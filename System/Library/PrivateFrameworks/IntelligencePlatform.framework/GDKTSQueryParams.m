@interface GDKTSQueryParams
+ (BOOL)supportsSecureCoding;
+ (int64_t)roadTypeForString:(id)a3;
- (GDEntityIdentifier)destinationId;
- (GDEntityIdentifier)originId;
- (GDKTSQueryParams)initWithCoder:(id)a3;
- (GDKTSQueryParams)initWithStartTime:(id)a3 endTime:(id)a4 inclusionType:(int64_t)a5 distanceMinInMeters:(id)a6 distanceMaxInMeters:(id)a7 elevationGainMinInMeters:(id)a8 elevationGainMaxInMeters:(id)a9 durationMinInSeconds:(id)a10 durationMaxInSeconds:(id)a11 roadType:(id)a12 roadName:(id)a13 originId:(id)a14 destinationId:(id)a15;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSNumber)distanceMaxInMeters;
- (NSNumber)distanceMinInMeters;
- (NSNumber)durationMaxInSeconds;
- (NSNumber)durationMinInSeconds;
- (NSNumber)elevationGainMaxInMeters;
- (NSNumber)elevationGainMinInMeters;
- (NSString)roadName;
- (NSString)roadType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)inclusionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDKTSQueryParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationId, 0);
  objc_storeStrong((id *)&self->_originId, 0);
  objc_storeStrong((id *)&self->_roadName, 0);
  objc_storeStrong((id *)&self->_roadType, 0);
  objc_storeStrong((id *)&self->_durationMaxInSeconds, 0);
  objc_storeStrong((id *)&self->_durationMinInSeconds, 0);
  objc_storeStrong((id *)&self->_elevationGainMaxInMeters, 0);
  objc_storeStrong((id *)&self->_elevationGainMinInMeters, 0);
  objc_storeStrong((id *)&self->_distanceMaxInMeters, 0);
  objc_storeStrong((id *)&self->_distanceMinInMeters, 0);
  objc_storeStrong((id *)&self->_endTime, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

- (GDEntityIdentifier)destinationId
{
  return self->_destinationId;
}

- (GDEntityIdentifier)originId
{
  return self->_originId;
}

- (NSString)roadName
{
  return self->_roadName;
}

- (NSString)roadType
{
  return self->_roadType;
}

- (NSNumber)durationMaxInSeconds
{
  return self->_durationMaxInSeconds;
}

- (NSNumber)durationMinInSeconds
{
  return self->_durationMinInSeconds;
}

- (NSNumber)elevationGainMaxInMeters
{
  return self->_elevationGainMaxInMeters;
}

- (NSNumber)elevationGainMinInMeters
{
  return self->_elevationGainMinInMeters;
}

- (NSNumber)distanceMaxInMeters
{
  return self->_distanceMaxInMeters;
}

- (NSNumber)distanceMinInMeters
{
  return self->_distanceMinInMeters;
}

- (int64_t)inclusionType
{
  return self->_inclusionType;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7 = objc_msgSend_initWithFormat_(v3, v4, @"GDKTSQueryParams<startTime: %@, endTime: %@, minDistance: %@, maxDistance: %@, minDuration: %@, maxDuration: %@, roadType: %@, roadName: %@, originId: %@, destinationId: %@>", v5, v6, self->_startTime, self->_endTime, self->_distanceMinInMeters, self->_distanceMaxInMeters, self->_durationMinInSeconds, self->_durationMaxInSeconds, self->_roadType, self->_roadName, self->_originId, self->_destinationId);

  return v7;
}

- (GDKTSQueryParams)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = NSStringFromSelector(sel_startTime);
  v77 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v6, v4, (uint64_t)v5, v7);

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_endTime);
  v76 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v10, v8, (uint64_t)v9, v11);

  uint64_t v12 = objc_opt_class();
  v13 = NSStringFromSelector(sel_inclusionType);
  v16 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v14, v12, (uint64_t)v13, v15);
  uint64_t v71 = (int)objc_msgSend_intValue(v16, v17, v18, v19, v20);

  uint64_t v21 = objc_opt_class();
  v22 = NSStringFromSelector(sel_distanceMinInMeters);
  v25 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v23, v21, (uint64_t)v22, v24);

  uint64_t v26 = objc_opt_class();
  v27 = NSStringFromSelector(sel_distanceMaxInMeters);
  v75 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v28, v26, (uint64_t)v27, v29);

  uint64_t v30 = objc_opt_class();
  v31 = NSStringFromSelector(sel_elevationGainMinInMeters);
  v74 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v32, v30, (uint64_t)v31, v33);

  uint64_t v34 = objc_opt_class();
  v35 = NSStringFromSelector(sel_elevationGainMaxInMeters);
  v38 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v36, v34, (uint64_t)v35, v37);

  uint64_t v39 = objc_opt_class();
  v40 = NSStringFromSelector(sel_durationMinInSeconds);
  v43 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v41, v39, (uint64_t)v40, v42);

  uint64_t v44 = objc_opt_class();
  v45 = NSStringFromSelector(sel_durationMaxInSeconds);
  v48 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v46, v44, (uint64_t)v45, v47);

  uint64_t v49 = objc_opt_class();
  v50 = NSStringFromSelector(sel_roadType);
  v70 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v51, v49, (uint64_t)v50, v52);

  uint64_t v53 = objc_opt_class();
  v54 = NSStringFromSelector(sel_roadName);
  v57 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v55, v53, (uint64_t)v54, v56);

  uint64_t v58 = objc_opt_class();
  v59 = NSStringFromSelector(sel_originId);
  v62 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v60, v58, (uint64_t)v59, v61);

  uint64_t v63 = objc_opt_class();
  v64 = NSStringFromSelector(sel_destinationId);
  v67 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v65, v63, (uint64_t)v64, v66);

  started = (GDKTSQueryParams *)objc_msgSend_initWithStartTime_endTime_inclusionType_distanceMinInMeters_distanceMaxInMeters_elevationGainMinInMeters_elevationGainMaxInMeters_durationMinInSeconds_durationMaxInSeconds_roadType_roadName_originId_destinationId_(self, v68, (uint64_t)v77, (uint64_t)v76, v71, v25, v75, v74, v38, v43, v48, v70, v57, v62, v67);
  return started;
}

- (void)encodeWithCoder:(id)a3
{
  startTime = self->_startTime;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_startTime);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)startTime, (uint64_t)v6, v8);

  endTime = self->_endTime;
  v10 = NSStringFromSelector(sel_endTime);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)endTime, (uint64_t)v10, v12);

  v16 = objc_msgSend_numberWithInteger_(NSNumber, v13, self->_inclusionType, v14, v15);
  v17 = NSStringFromSelector(sel_inclusionType);
  objc_msgSend_encodeObject_forKey_(v5, v18, (uint64_t)v16, (uint64_t)v17, v19);

  distanceMinInMeters = self->_distanceMinInMeters;
  uint64_t v21 = NSStringFromSelector(sel_distanceMinInMeters);
  objc_msgSend_encodeObject_forKey_(v5, v22, (uint64_t)distanceMinInMeters, (uint64_t)v21, v23);

  distanceMaxInMeters = self->_distanceMaxInMeters;
  v25 = NSStringFromSelector(sel_distanceMaxInMeters);
  objc_msgSend_encodeObject_forKey_(v5, v26, (uint64_t)distanceMaxInMeters, (uint64_t)v25, v27);

  elevationGainMinInMeters = self->_elevationGainMinInMeters;
  uint64_t v29 = NSStringFromSelector(sel_elevationGainMinInMeters);
  objc_msgSend_encodeObject_forKey_(v5, v30, (uint64_t)elevationGainMinInMeters, (uint64_t)v29, v31);

  elevationGainMaxInMeters = self->_elevationGainMaxInMeters;
  uint64_t v33 = NSStringFromSelector(sel_elevationGainMaxInMeters);
  objc_msgSend_encodeObject_forKey_(v5, v34, (uint64_t)elevationGainMaxInMeters, (uint64_t)v33, v35);

  durationMinInSeconds = self->_durationMinInSeconds;
  uint64_t v37 = NSStringFromSelector(sel_durationMinInSeconds);
  objc_msgSend_encodeObject_forKey_(v5, v38, (uint64_t)durationMinInSeconds, (uint64_t)v37, v39);

  durationMaxInSeconds = self->_durationMaxInSeconds;
  v41 = NSStringFromSelector(sel_durationMaxInSeconds);
  objc_msgSend_encodeObject_forKey_(v5, v42, (uint64_t)durationMaxInSeconds, (uint64_t)v41, v43);

  roadType = self->_roadType;
  v45 = NSStringFromSelector(sel_roadType);
  objc_msgSend_encodeObject_forKey_(v5, v46, (uint64_t)roadType, (uint64_t)v45, v47);

  roadName = self->_roadName;
  uint64_t v49 = NSStringFromSelector(sel_roadName);
  objc_msgSend_encodeObject_forKey_(v5, v50, (uint64_t)roadName, (uint64_t)v49, v51);

  originId = self->_originId;
  uint64_t v53 = NSStringFromSelector(sel_originId);
  objc_msgSend_encodeObject_forKey_(v5, v54, (uint64_t)originId, (uint64_t)v53, v55);

  destinationId = self->_destinationId;
  NSStringFromSelector(sel_destinationId);
  id v59 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v57, (uint64_t)destinationId, (uint64_t)v59, v58);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)objc_msgSend_initWithStartTime_endTime_inclusionType_distanceMinInMeters_distanceMaxInMeters_elevationGainMinInMeters_elevationGainMaxInMeters_durationMinInSeconds_durationMaxInSeconds_roadType_roadName_originId_destinationId_(v9, v10, (uint64_t)self->_startTime, (uint64_t)self->_endTime, self->_inclusionType, self->_distanceMinInMeters, self->_distanceMaxInMeters, self->_elevationGainMinInMeters, self->_elevationGainMaxInMeters, self->_durationMinInSeconds, self->_durationMaxInSeconds, self->_roadType, self->_roadName, self->_originId, self->_destinationId);
}

- (GDKTSQueryParams)initWithStartTime:(id)a3 endTime:(id)a4 inclusionType:(int64_t)a5 distanceMinInMeters:(id)a6 distanceMaxInMeters:(id)a7 elevationGainMinInMeters:(id)a8 elevationGainMaxInMeters:(id)a9 durationMinInSeconds:(id)a10 durationMaxInSeconds:(id)a11 roadType:(id)a12 roadName:(id)a13 originId:(id)a14 destinationId:(id)a15
{
  id v19 = a3;
  id v92 = a4;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  id v27 = a15;
  v93.receiver = self;
  v93.super_class = (Class)GDKTSQueryParams;
  v32 = [(GDKTSQueryParams *)&v93 init];
  if (v32)
  {
    uint64_t v33 = objc_msgSend_copy(v19, v28, v29, v30, v31);
    startTime = v32->_startTime;
    v32->_startTime = (NSDate *)v33;

    uint64_t v39 = objc_msgSend_copy(v92, v35, v36, v37, v38);
    endTime = v32->_endTime;
    v32->_endTime = (NSDate *)v39;

    v32->_inclusionType = a5;
    uint64_t v45 = objc_msgSend_copy(v20, v41, v42, v43, v44);
    distanceMinInMeters = v32->_distanceMinInMeters;
    v32->_distanceMinInMeters = (NSNumber *)v45;

    uint64_t v51 = objc_msgSend_copy(v21, v47, v48, v49, v50);
    distanceMaxInMeters = v32->_distanceMaxInMeters;
    v32->_distanceMaxInMeters = (NSNumber *)v51;

    uint64_t v57 = objc_msgSend_copy(v22, v53, v54, v55, v56);
    elevationGainMinInMeters = v32->_elevationGainMinInMeters;
    v32->_elevationGainMinInMeters = (NSNumber *)v57;

    uint64_t v63 = objc_msgSend_copy(v23, v59, v60, v61, v62);
    elevationGainMaxInMeters = v32->_elevationGainMaxInMeters;
    v32->_elevationGainMaxInMeters = (NSNumber *)v63;

    uint64_t v69 = objc_msgSend_copy(v24, v65, v66, v67, v68);
    roadType = v32->_roadType;
    v32->_roadType = (NSString *)v69;

    uint64_t v75 = objc_msgSend_copy(v25, v71, v72, v73, v74);
    roadName = v32->_roadName;
    v32->_roadName = (NSString *)v75;

    uint64_t v81 = objc_msgSend_copy(v26, v77, v78, v79, v80);
    originId = v32->_originId;
    v32->_originId = (GDEntityIdentifier *)v81;

    uint64_t v87 = objc_msgSend_copy(v27, v83, v84, v85, v86);
    destinationId = v32->_destinationId;
    v32->_destinationId = (GDEntityIdentifier *)v87;
  }
  return v32;
}

+ (int64_t)roadTypeForString:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"freeway", v5, v6))
  {
    int64_t v10 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"arterial", v8, v9))
  {
    int64_t v10 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"collector", v12, v13))
  {
    int64_t v10 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v14, @"local", v15, v16))
  {
    int64_t v10 = 4;
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end