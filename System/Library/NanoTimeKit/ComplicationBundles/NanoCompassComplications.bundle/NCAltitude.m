@interface NCAltitude
+ (NCAltitude)idealizedAltitude;
+ (id)altitudeWithLocation:(id)a3 error:(id)a4;
+ (id)initAltitude:(id)a3;
+ (id)randomizedAltitude;
- (BOOL)displayTilde;
- (BOOL)hasAcceptibleAccuracy;
- (BOOL)hasAltitudeReading;
- (BOOL)hasReading;
- (BOOL)isBetterThan:(id)a3 withStaleTimeThreshold:(double)a4;
- (NCAltitude)initWithAbsoluteAltitude:(id)a3;
- (NCAltitude)initWithLocation:(id)a3 error:(id)a4;
- (NCAltitude)initWithNCAltitude:(id)a3;
- (NSDate)reportedTimestamp;
- (NSDate)timestamp;
- (NSError)error;
- (NSNumber)absoluteAltitudeAccuracy;
- (double)accuracy;
- (double)altitude;
- (double)altitudeInMeters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)setAbsoluteAltitudeAccuracy:(id)a3;
- (void)setAccuracy:(double)a3;
- (void)setAltitude:(double)a3;
- (void)setAltitudeInMeters:(double)a3;
- (void)setDisplayTilde:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setHasAltitudeReading:(BOOL)a3;
- (void)setReportedTimestamp:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation NCAltitude

+ (id)initAltitude:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v8 = objc_msgSend_initWithAbsoluteAltitude_(v5, v6, (uint64_t)v4, v7);

  return v8;
}

- (NCAltitude)initWithNCAltitude:(id)a3
{
  id v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)NCAltitude;
  v8 = [(NCAltitude *)&v67 init];
  if (v8)
  {
    objc_msgSend_altitude(v4, v5, v6, v7);
    objc_msgSend_setAltitude_(v8, v9, v10, v11);
    objc_msgSend_altitudeInMeters(v4, v12, v13, v14);
    objc_msgSend_setAltitudeInMeters_(v8, v15, v16, v17);
    uint64_t v21 = objc_msgSend_type(v4, v18, v19, v20);
    objc_msgSend_setType_(v8, v22, v21, v23);
    objc_msgSend_accuracy(v4, v24, v25, v26);
    objc_msgSend_setAccuracy_(v8, v27, v28, v29);
    v33 = objc_msgSend_timestamp(v4, v30, v31, v32);
    objc_msgSend_setTimestamp_(v8, v34, (uint64_t)v33, v35);

    v39 = objc_msgSend_reportedTimestamp(v4, v36, v37, v38);
    objc_msgSend_setReportedTimestamp_(v8, v40, (uint64_t)v39, v41);

    v45 = objc_msgSend_error(v4, v42, v43, v44);
    objc_msgSend_setError_(v8, v46, (uint64_t)v45, v47);

    uint64_t hasAltitudeReading = objc_msgSend_hasAltitudeReading(v4, v48, v49, v50);
    objc_msgSend_setHasAltitudeReading_(v8, v52, hasAltitudeReading, v53);
    v57 = objc_msgSend_absoluteAltitudeAccuracy(v4, v54, v55, v56);
    objc_msgSend_setAbsoluteAltitudeAccuracy_(v8, v58, (uint64_t)v57, v59);

    uint64_t v63 = objc_msgSend_displayTilde(v4, v60, v61, v62);
    objc_msgSend_setDisplayTilde_(v8, v64, v63, v65);
  }

  return v8;
}

- (NCAltitude)initWithAbsoluteAltitude:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)NCAltitude;
  v8 = [(NCAltitude *)&v49 init];
  if (v8)
  {
    objc_msgSend_altitude(v4, v5, v6, v7);
    v8->_rawAltitude = v9;
    objc_msgSend_accuracy(v4, v10, v11, v12);
    v8->_rawAccuracy = v13;
    objc_msgSend_precision(v4, v14, v15, v16);
    v8->_rawPrecision = v17;
    id v18 = objc_alloc(MEMORY[0x263EFF910]);
    objc_msgSend_timestamp(v4, v19, v20, v21);
    uint64_t v25 = objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v18, v22, v23, v24);
    objc_msgSend_setTimestamp_(v8, v26, (uint64_t)v25, v27);

    id v28 = objc_alloc(MEMORY[0x263EFF910]);
    objc_msgSend_timestamp(v4, v29, v30, v31);
    uint64_t v35 = objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v28, v32, v33, v34);
    objc_msgSend_setReportedTimestamp_(v8, v36, (uint64_t)v35, v37);

    objc_msgSend_setType_(v8, v38, 4, v39);
    objc_msgSend_altitude(v4, v40, v41, v42);
    objc_msgSend_setAltitudeInMeters_(v8, v43, v44, v45);
    objc_msgSend_setHasAltitudeReading_(v8, v46, 1, v47);
  }

  return v8;
}

+ (id)altitudeWithLocation:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  uint64_t v10 = objc_msgSend_initWithLocation_error_(v8, v9, (uint64_t)v7, (uint64_t)v6);

  return v10;
}

- (NCAltitude)initWithLocation:(id)a3 error:(id)a4
{
  id v5 = a3;
  v80.receiver = self;
  v80.super_class = (Class)NCAltitude;
  id v6 = [(NCAltitude *)&v80 init];
  uint64_t v10 = v6;
  if (v6)
  {
    if (v5)
    {
      if (objc_msgSend_type(v5, v7, v8, v9) - 1 > 2)
      {
        uint64_t v37 = objc_msgSend__groundAltitude(v5, v11, v12, v13);

        if (v37)
        {
          uint64_t v41 = objc_msgSend__groundAltitude(v5, v38, v39, v40);
          objc_msgSend_estimate(v41, v42, v43, v44);
          double v15 = v45;

          objc_super v49 = objc_msgSend__groundAltitude(v5, v46, v47, v48);
          objc_msgSend_uncertainty(v49, v50, v51, v52);
          double v23 = v53;

          uint64_t v24 = 2;
        }
        else
        {
          objc_msgSend_altitude(v5, v38, v39, v40);
          double v15 = v54;
          objc_msgSend_verticalAccuracy(v5, v55, v56, v57);
          double v23 = v58;
          uint64_t v24 = 1;
        }
      }
      else
      {
        objc_msgSend_altitude(v5, v11, v12, v13);
        double v15 = v14;
        objc_msgSend_verticalAccuracy(v5, v16, v17, v18);
        double v23 = v22;
        uint64_t v24 = 3;
      }
      objc_msgSend_setAltitude_(v10, v19, v20, v21, v15);
      objc_msgSend_setAltitudeInMeters_(v10, v59, v60, v61, v15);
      objc_msgSend_setType_(v10, v62, v24, v63);
      objc_msgSend_setAccuracy_(v10, v64, v65, v66, v23);
      uint64_t v34 = objc_msgSend_timestamp(v5, v67, v68, v69);
    }
    else
    {
      objc_msgSend_setAltitude_(v6, v7, v8, v9, 0.0);
      objc_msgSend_setAltitudeInMeters_(v10, v25, v26, v27, 0.0);
      objc_msgSend_setAccuracy_(v10, v28, v29, v30, -1.0);
      uint64_t v34 = objc_msgSend_date(MEMORY[0x263EFF910], v31, v32, v33);
    }
    v70 = (void *)v34;
    objc_msgSend_setTimestamp_(v10, v35, v34, v36);

    objc_msgSend_setHasAltitudeReading_(v10, v71, v5 != 0, v72);
    v76 = objc_msgSend_date(MEMORY[0x263EFF910], v73, v74, v75);
    objc_msgSend_setReportedTimestamp_(v10, v77, (uint64_t)v76, v78);
  }
  return v10;
}

- (BOOL)hasReading
{
  return !self->_error && self->_hasAltitudeReading;
}

- (BOOL)isBetterThan:(id)a3 withStaleTimeThreshold:(double)a4
{
  id v12 = a3;
  if (!v12 || objc_msgSend_type(self, v9, v10, v11) == 4 && objc_msgSend_type(v12, v13, v14, v15) != 4) {
    goto LABEL_49;
  }
  if (objc_msgSend_type(self, v13, v14, v15) != 4 && objc_msgSend_type(v12, v16, v17, v18) == 4) {
    goto LABEL_7;
  }
  uint64_t v19 = objc_msgSend_timestamp(self, v16, v17, v18);
  double v23 = objc_msgSend_timestamp(v12, v20, v21, v22);
  objc_msgSend_timeIntervalSinceDate_(v19, v24, (uint64_t)v23, v25);
  double v27 = v26;

  if (v27 < 0.0)
  {
LABEL_7:
    BOOL v31 = 0;
    goto LABEL_50;
  }
  uint64_t v32 = objc_msgSend_error(self, v28, v29, v30);
  if (v32)
  {

    goto LABEL_10;
  }
  uint64_t v62 = objc_msgSend_error(v12, v33, v34, v35);

  if (v62)
  {
LABEL_49:
    BOOL v31 = 1;
    goto LABEL_50;
  }
LABEL_10:
  objc_msgSend_accuracy(self, v36, v37, v38);
  if (v42 >= 0.0)
  {
    objc_msgSend_accuracy(v12, v39, v40, v41);
    if (v43 < 0.0) {
      goto LABEL_49;
    }
  }
  objc_msgSend_accuracy(self, v39, v40, v41);
  if (v47 >= 0.0)
  {
    objc_msgSend_accuracy(self, v44, v45, v46);
    double v49 = v48;
    objc_msgSend_accuracy(v12, v50, v51, v52);
    if (v49 < v53) {
      goto LABEL_49;
    }
  }
  int hasAcceptibleAccuracy = objc_msgSend_hasAcceptibleAccuracy(self, v44, v45, v46);
  if (hasAcceptibleAccuracy)
  {
    if (objc_msgSend_type(self, v54, v55, v56) == 2 && objc_msgSend_type(v12, v58, v59, v60) > 2)
    {
      BOOL v61 = v27 <= 30.0;
      goto LABEL_23;
    }
    if (objc_msgSend_type(self, v58, v59, v60) < 2 && objc_msgSend_type(v12, v54, v55, v56) >= 2)
    {
      BOOL v61 = v27 <= a4;
LABEL_23:
      BOOL v31 = !v61;
      goto LABEL_50;
    }
  }
  objc_msgSend_altitude(self, v54, v55, v56);
  double v64 = v63;
  objc_msgSend_altitude(v12, v65, v66, v67);
  double v72 = v64 - v71;
  if (v72 >= 0.0) {
    double v73 = v72;
  }
  else {
    double v73 = -v72;
  }
  v77 = objc_msgSend_error(self, v68, v69, v70);
  if (v77 || (objc_msgSend_error(v12, v74, v75, v76), (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = objc_msgSend_error(self, v74, v75, v76);
    id v6 = objc_msgSend_error(v12, v78, v79, v80);
    if (!objc_msgSend_isEqual_(v5, v81, (uint64_t)v6, v82))
    {
      BOOL v84 = 0;
      goto LABEL_43;
    }
    int v83 = 1;
  }
  else
  {
    int v83 = 0;
  }
  objc_msgSend_accuracy(self, v74, v75, v76);
  double v86 = v85;
  objc_msgSend_accuracy(v12, v87, v88, v89);
  double v94 = v86 - v93;
  if (v94 < 0.0) {
    double v94 = -v94;
  }
  if (v94 >= 0.00000011920929
    || (uint64_t v95 = objc_msgSend_type(self, v90, v91, v92), v95 != objc_msgSend_type(v12, v96, v97, v98))
    || v73 >= 0.00000011920929)
  {
    BOOL v84 = 0;
    if (!v83) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  BOOL v84 = v27 > a4;
  if (v83)
  {
LABEL_43:
  }
LABEL_44:
  if (!v77) {

  }
  if (v84 || hasAcceptibleAccuracy && v73 < 0.00000011920929) {
    goto LABEL_49;
  }
  objc_msgSend_accuracy(self, v99, v100, v101);
  BOOL v31 = v27 > a4 && v103 >= 0.0;
LABEL_50:

  return v31;
}

- (BOOL)hasAcceptibleAccuracy
{
  objc_msgSend_accuracy(self, a2, v2, v3);
  if (v8 < 0.0) {
    return 0;
  }
  objc_msgSend_accuracy(self, v5, v6, v7);
  return v10 <= 20.0;
}

- (id)description
{
  unint64_t v3 = self->_type - 1;
  if (v3 > 3) {
    return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<%.2fm> ±%.2fm (%@) @generated %@ @reported %@", v2, *(void *)&self->_altitude, *(void *)&self->_accuracy, @"NONE", self->_timestamp, self->_reportedTimestamp);
  }
  else {
    return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<%.2fm> ±%.2fm (%@) @generated %@ @reported %@", v2, *(void *)&self->_altitude, *(void *)&self->_accuracy, off_264CD5520[v3], self->_timestamp, self->_reportedTimestamp);
  }
}

+ (NCAltitude)idealizedAltitude
{
  if (qword_268920BF8 != -1) {
    dispatch_once(&qword_268920BF8, &unk_26EA488A0);
  }
  uint64_t v2 = (void *)qword_268920BF0;

  return (NCAltitude *)v2;
}

+ (id)randomizedAltitude
{
  uint64_t v2 = objc_opt_new();
  uint32_t v3 = arc4random_uniform(0x2904u);
  objc_msgSend_setAltitude_(v2, v4, v5, v6, (double)(v3 - 500));
  if (arc4random()) {
    objc_msgSend_setType_(v2, v7, 2, v8);
  }
  else {
    objc_msgSend_setType_(v2, v7, 3, v8);
  }
  uint32_t v9 = arc4random_uniform(0xC8u);
  objc_msgSend_setAccuracy_(v2, v10, v11, v12, (double)v9);
  uint64_t v16 = objc_msgSend_date(MEMORY[0x263EFF910], v13, v14, v15);
  objc_msgSend_setTimestamp_(v2, v17, (uint64_t)v16, v18);

  uint64_t v22 = objc_msgSend_timestamp(v2, v19, v20, v21);
  objc_msgSend_setReportedTimestamp_(v2, v23, (uint64_t)v22, v24);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [NCAltitude alloc];

  return (id)MEMORY[0x270F9A6D0](v4, sel_initWithNCAltitude_, self, v5);
}

- (double)altitudeInMeters
{
  return self->_altitudeInMeters;
}

- (void)setAltitudeInMeters:(double)a3
{
  self->_altitudeInMeters = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (void)setAccuracy:(double)a3
{
  self->_accuracy = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSDate)reportedTimestamp
{
  return self->_reportedTimestamp;
}

- (void)setReportedTimestamp:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSNumber)absoluteAltitudeAccuracy
{
  return self->_absoluteAltitudeAccuracy;
}

- (void)setAbsoluteAltitudeAccuracy:(id)a3
{
}

- (BOOL)displayTilde
{
  return self->_displayTilde;
}

- (void)setDisplayTilde:(BOOL)a3
{
  self->_displayTilde = a3;
}

- (BOOL)hasAltitudeReading
{
  return self->_hasAltitudeReading;
}

- (void)setHasAltitudeReading:(BOOL)a3
{
  self->_uint64_t hasAltitudeReading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_absoluteAltitudeAccuracy, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_reportedTimestamp, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end