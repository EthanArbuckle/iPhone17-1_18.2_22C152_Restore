@interface NCLocation
+ (NCLocation)idealizedLocation;
+ (NCLocation)locationWithLocation:(id)a3 error:(id)a4;
+ (id)randomizedLocation;
- (BOOL)hasAcceptableAccuracy;
- (BOOL)hasReading;
- (BOOL)isBetterThan:(id)a3 withStaleTimeThreshold:(double)a4;
- (CLLocation)rawLocation;
- (CLLocationCoordinate2D)coordinate;
- (NCLocation)initWithLocation:(id)a3;
- (NCLocation)initWithLocation:(id)a3 error:(id)a4;
- (NSDate)reportedTimestamp;
- (NSDate)timestamp;
- (NSError)error;
- (double)accuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAccuracy:(double)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setError:(id)a3;
- (void)setRawLocation:(id)a3;
- (void)setReportedTimestamp:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation NCLocation

+ (NCLocation)locationWithLocation:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v10 = objc_msgSend_initWithLocation_error_(v8, v9, (uint64_t)v7, (uint64_t)v6);

  return (NCLocation *)v10;
}

- (NCLocation)initWithLocation:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)NCLocation;
  id v8 = [(NCLocation *)&v45 init];
  v12 = v8;
  if (v8)
  {
    if (v6)
    {
      objc_msgSend_coordinate(v6, v9, v10, v11);
      objc_msgSend_setCoordinate_(v12, v13, v14, v15);
      objc_msgSend_horizontalAccuracy(v6, v16, v17, v18);
      objc_msgSend_setAccuracy_(v12, v19, v20, v21);
      objc_msgSend_timestamp(v6, v22, v23, v24);
    }
    else
    {
      objc_msgSend_setCoordinate_(v8, v9, v10, v11, *MEMORY[0x263F00B58], *(double *)(MEMORY[0x263F00B58] + 8));
      objc_msgSend_setAccuracy_(v12, v25, v26, v27, -1.0);
      objc_msgSend_date(MEMORY[0x263EFF910], v28, v29, v30);
    v31 = };
    objc_msgSend_setTimestamp_(v12, v32, (uint64_t)v31, v33);

    v37 = objc_msgSend_date(MEMORY[0x263EFF910], v34, v35, v36);
    objc_msgSend_setReportedTimestamp_(v12, v38, (uint64_t)v37, v39);

    objc_msgSend_setError_(v12, v40, (uint64_t)v7, v41);
    objc_msgSend_setRawLocation_(v12, v42, (uint64_t)v6, v43);
  }

  return v12;
}

- (NCLocation)initWithLocation:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)NCLocation;
  id v8 = [(NCLocation *)&v36 init];
  if (v8)
  {
    objc_msgSend_coordinate(v4, v5, v6, v7);
    v8->_coordinate.latitude = v9;
    v8->_coordinate.longitude = v10;
    objc_msgSend_accuracy(v4, v11, v12, v13);
    v8->_accuracy = v14;
    uint64_t v18 = objc_msgSend_timestamp(v4, v15, v16, v17);
    timestamp = v8->_timestamp;
    v8->_timestamp = (NSDate *)v18;

    uint64_t v23 = objc_msgSend_reportedTimestamp(v4, v20, v21, v22);
    reportedTimestamp = v8->_reportedTimestamp;
    v8->_reportedTimestamp = (NSDate *)v23;

    uint64_t v28 = objc_msgSend_error(v4, v25, v26, v27);
    error = v8->_error;
    v8->_error = (NSError *)v28;

    uint64_t v33 = objc_msgSend_rawLocation(v4, v30, v31, v32);
    rawLocation = v8->_rawLocation;
    v8->_rawLocation = (CLLocation *)v33;
  }
  return v8;
}

- (BOOL)hasReading
{
  return !self->_error
      && self->_accuracy >= 0.0
      && self->_coordinate.latitude != *MEMORY[0x263F00B58]
      && self->_coordinate.longitude != *(double *)(MEMORY[0x263F00B58] + 8);
}

- (BOOL)isBetterThan:(id)a3 withStaleTimeThreshold:(double)a4
{
  id v12 = a3;
  if (!v12) {
    goto LABEL_41;
  }
  uint64_t v13 = objc_msgSend_timestamp(self, v9, v10, v11);
  uint64_t v17 = objc_msgSend_timestamp(v12, v14, v15, v16);
  objc_msgSend_timeIntervalSinceDate_(v13, v18, (uint64_t)v17, v19);
  double v21 = v20;

  if (v21 < 0.0)
  {
    BOOL v25 = 0;
    goto LABEL_42;
  }
  uint64_t v26 = objc_msgSend_error(self, v22, v23, v24);
  if (v26)
  {

    goto LABEL_6;
  }
  v92 = objc_msgSend_error(v12, v27, v28, v29);

  if (v92)
  {
LABEL_41:
    BOOL v25 = 1;
    goto LABEL_42;
  }
LABEL_6:
  objc_msgSend_coordinate(self, v30, v31, v32);
  if (CLLocationCoordinate2DIsValid(v107))
  {
    objc_msgSend_coordinate(v12, v33, v34, v35);
    if (!CLLocationCoordinate2DIsValid(v108)) {
      goto LABEL_41;
    }
  }
  objc_msgSend_accuracy(self, v33, v34, v35);
  if (v39 >= 0.0)
  {
    objc_msgSend_accuracy(v12, v36, v37, v38);
    if (v40 < 0.0) {
      goto LABEL_41;
    }
  }
  int hasAcceptableAccuracy = objc_msgSend_hasAcceptableAccuracy(self, v36, v37, v38);
  if (hasAcceptableAccuracy)
  {
    if (!objc_msgSend_hasAcceptableAccuracy(v12, v41, v42, v43)) {
      goto LABEL_41;
    }
  }
  objc_msgSend_accuracy(v12, v41, v42, v43);
  double v46 = v45;
  objc_msgSend_accuracy(self, v47, v48, v49);
  double v51 = v50;
  objc_msgSend_accuracy(self, v52, v53, v54);
  if (v58 >= 0.0 && v46 - v51 > 2.22044605e-16) {
    goto LABEL_41;
  }
  objc_msgSend_coordinate(self, v55, v56, v57);
  double v60 = v59;
  objc_msgSend_coordinate(v12, v61, v62, v63);
  double v68 = v60 - v67;
  if (v68 >= 0.0) {
    double v69 = v68;
  }
  else {
    double v69 = -v68;
  }
  objc_msgSend_coordinate(self, v64, v65, v66);
  double v71 = v70;
  objc_msgSend_coordinate(v12, v72, v73, v74);
  double v79 = v71 - v78;
  double v80 = -(v71 - v78);
  if (v79 >= 0.0) {
    double v81 = v79;
  }
  else {
    double v81 = v80;
  }
  v85 = objc_msgSend_error(self, v75, v76, v77);
  if (v85 || (objc_msgSend_error(v12, v82, v83, v84), (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = objc_msgSend_error(self, v82, v83, v84);
    uint64_t v6 = objc_msgSend_error(v12, v86, v87, v88);
    if (!objc_msgSend_isEqual_(v5, v89, (uint64_t)v6, v90))
    {
      BOOL v93 = 0;
      goto LABEL_34;
    }
    int v91 = 1;
  }
  else
  {
    int v91 = 0;
  }
  objc_msgSend_accuracy(self, v82, v83, v84);
  double v95 = v94;
  objc_msgSend_accuracy(v12, v96, v97, v98);
  double v100 = v95 - v99;
  if (v100 < 0.0) {
    double v100 = -v100;
  }
  if (v100 < 2.22044605e-16 && v69 <= 2.22044605e-16 && v81 <= 2.22044605e-16)
  {
    BOOL v93 = v21 > a4;
    if ((v91 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  BOOL v93 = 0;
  if (v91)
  {
LABEL_34:
  }
LABEL_35:
  if (!v85) {

  }
  if (v93) {
    goto LABEL_41;
  }
  BOOL v104 = v69 > 2.22044605e-16;
  if (v81 > 2.22044605e-16) {
    BOOL v104 = 1;
  }
  if (hasAcceptableAccuracy & v104) {
    goto LABEL_41;
  }
  objc_msgSend_accuracy(self, v101, v102, v103);
  BOOL v25 = v21 > a4 && v106 >= 0.0;
LABEL_42:

  return v25;
}

- (BOOL)hasAcceptableAccuracy
{
  objc_msgSend_accuracy(self, a2, v2, v3);
  if (v8 < 0.0) {
    return 0;
  }
  objc_msgSend_accuracy(self, v5, v6, v7);
  return v10 < 300.0;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<%+.4f,%+.4f> ±%.2fm @generated %@ @reported %@", v2, *(void *)&self->_coordinate.latitude, *(void *)&self->_coordinate.longitude, *(void *)&self->_accuracy, self->_timestamp, self->_reportedTimestamp);
}

+ (NCLocation)idealizedLocation
{
  if (qword_268921330 != -1) {
    dispatch_once(&qword_268921330, &unk_26EA48D80);
  }
  uint64_t v2 = (void *)qword_268921328;

  return (NCLocation *)v2;
}

+ (id)randomizedLocation
{
  uint64_t v2 = objc_opt_new();
  CLLocationDegrees v3 = (double)(arc4random_uniform(0xB4u) - 90);
  uint32_t v4 = arc4random_uniform(0x168u);
  CLLocationCoordinate2D v5 = CLLocationCoordinate2DMake(v3, (double)(v4 - 180));
  objc_msgSend_setCoordinate_(v2, v6, v7, v8, v5.latitude, v5.longitude);
  uint32_t v9 = arc4random_uniform(0xFA0u);
  objc_msgSend_setAccuracy_(v2, v10, v11, v12, (double)v9);
  uint64_t v16 = objc_msgSend_date(MEMORY[0x263EFF910], v13, v14, v15);
  objc_msgSend_setTimestamp_(v2, v17, (uint64_t)v16, v18);

  uint64_t v22 = objc_msgSend_timestamp(v2, v19, v20, v21);
  objc_msgSend_setReportedTimestamp_(v2, v23, (uint64_t)v22, v24);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint32_t v4 = [NCLocation alloc];

  return (id)MEMORY[0x270F9A6D0](v4, sel_initWithLocation_, self, v5);
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
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

- (CLLocation)rawLocation
{
  return self->_rawLocation;
}

- (void)setRawLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawLocation, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_reportedTimestamp, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end