@interface CMSkiData
+ (BOOL)supportsSecureCoding;
- (CMSkiData)initWithCoder:(id)a3;
- (CMSkiData)initWithRecordId:(unint64_t)a3 sourceId:(id)a4 sessionId:(id)a5 startDate:(id)a6 endDate:(id)a7 runDistance:(double)a8 runAvgSpeed:(double)a9 runMaxSpeed:(double)a10 runSlope:(double)a11 runElevationDescent:(double)a12;
- (CMSkiData)initWithSessionId:(id)a3;
- (CMSkiData)initWithSkiEntry:(const CLSkiEntry *)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSUUID)sessionId;
- (NSUUID)sourceId;
- (double)runAvgSpeed;
- (double)runDistance;
- (double)runElevationDescent;
- (double)runMaxSpeed;
- (double)runSlope;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)recordId;
- (void)convertToSkiEntry:(CLSkiEntry *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMSkiData

- (CMSkiData)initWithRecordId:(unint64_t)a3 sourceId:(id)a4 sessionId:(id)a5 startDate:(id)a6 endDate:(id)a7 runDistance:(double)a8 runAvgSpeed:(double)a9 runMaxSpeed:(double)a10 runSlope:(double)a11 runElevationDescent:(double)a12
{
  if (!a7 || !a4 || !a5 || !a6)
  {
    v27 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, @"CMSkiData.mm", 49, @"Invalid parameter not satisfying: %@", @"sourceId && sessionId && startDate && endDate");
  }
  v29.receiver = self;
  v29.super_class = (Class)CMSkiData;
  v24 = [(CMSkiData *)&v29 init];
  v25 = v24;
  if (v24)
  {
    v24->fRecordId = a3;
    v24->fSourceId = (NSUUID *)a4;
    v25->fSessionId = (NSUUID *)a5;
    v25->fStartDate = (NSDate *)a6;
    v25->fEndDate = (NSDate *)a7;
    v25->fRunDistance = a8;
    v25->fRunAvgSpeed = a9;
    v25->fRunMaxSpeed = a10;
    v25->fRunSlope = a11;
    v25->fRunElevationDescent = a12;
  }
  return v25;
}

- (CMSkiData)initWithSessionId:(id)a3
{
  if (!a3)
  {
    v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, self, @"CMSkiData.mm", 67, @"Invalid parameter not satisfying: %@", @"sessionId");
  }
  v11.receiver = self;
  v11.super_class = (Class)CMSkiData;
  v5 = [(CMSkiData *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->fRecordId = 0;
    v5->fSourceId = 0;
    v5->fSessionId = (NSUUID *)a3;
    *(_OWORD *)&v6->fStartDate = 0u;
    *(_OWORD *)&v6->fRunDistance = 0u;
    *(_OWORD *)&v6->fRunMaxSpeed = 0u;
    v6->fRunElevationDescent = 0.0;
  }
  return v6;
}

- (CMSkiData)initWithSkiEntry:(const CLSkiEntry *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CMSkiData;
  v4 = [(CMSkiData *)&v18 init];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v7 = objc_msgSend_initWithUUIDBytes_(v5, v6, (uint64_t)a3->var1);
    id v8 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v10 = objc_msgSend_initWithUUIDBytes_(v8, v9, (uint64_t)a3->var2);
    v4->fRecordId = a3->var0;
    v4->fSourceId = (NSUUID *)v7;
    v4->fSessionId = (NSUUID *)v10;
    id v11 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v4->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v11, v12, v13, a3->var3);
    id v14 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v4->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v14, v15, v16, a3->var4);
    v4->fRunDistance = a3->var5;
    v4->fRunAvgSpeed = a3->var6;
    v4->fRunMaxSpeed = a3->var7;
    v4->fRunSlope = a3->var8;
    v4->fRunElevationDescent = a3->var9;
  }
  return v4;
}

- (void)convertToSkiEntry:(CLSkiEntry *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  memset(src, 0, sizeof(src));
  uuid_clear(uu);
  uuid_clear(src);
  objc_msgSend_getUUIDBytes_(self->fSourceId, v5, (uint64_t)uu);
  objc_msgSend_getUUIDBytes_(self->fSessionId, v6, (uint64_t)src);
  a3->var0 = self->fRecordId;
  uuid_copy(a3->var1, uu);
  uuid_copy(a3->var2, src);
  objc_msgSend_timeIntervalSinceReferenceDate(self->fStartDate, v7, v8);
  a3->var3 = v9;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fEndDate, v10, v11);
  a3->var4 = v12;
  a3->var5 = self->fRunDistance;
  a3->var6 = self->fRunAvgSpeed;
  a3->var7 = self->fRunMaxSpeed;
  a3->var8 = self->fRunSlope;
  a3->var9 = self->fRunElevationDescent;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMSkiData;
  [(CMSkiData *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSkiData)initWithCoder:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CMSkiData;
  id v5 = [(CMSkiData *)&v25 init];
  if (v5)
  {
    v5->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, @"kCMSkiDataCodingKeyRecordId");
    uint64_t v6 = objc_opt_class();
    v5->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v7, v6, @"kCMSkiDataCodingKeySourceId");
    uint64_t v8 = objc_opt_class();
    v5->fSessionId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, @"kCMSkiDataCodingKeySessionId");
    uint64_t v10 = objc_opt_class();
    v5->fStartDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, @"kCMSkiDataCodingKeyStartDate");
    uint64_t v12 = objc_opt_class();
    v5->fEndDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, @"kCMSkiDataCodingKeyEndDate");
    objc_msgSend_decodeDoubleForKey_(a3, v14, @"kCMSkiDataCodingKeyRunDistance");
    v5->fRunDistance = v15;
    objc_msgSend_decodeDoubleForKey_(a3, v16, @"kCMSkiDataCodingKeyRunAvgSpeed");
    v5->fRunAvgSpeed = v17;
    objc_msgSend_decodeDoubleForKey_(a3, v18, @"kCMSkiDataCodingKeyRunMaxSpeed");
    v5->fRunMaxSpeed = v19;
    objc_msgSend_decodeDoubleForKey_(a3, v20, @"kCMSkiDataCodingKeyRunSlope");
    v5->fRunSlope = v21;
    objc_msgSend_decodeDoubleForKey_(a3, v22, @"kCMSkiDataCodingKeyRunElevationDescent");
    v5->fRunElevationDescent = v23;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  unint64_t fRecordId = self->fRecordId;
  fSourceId = self->fSourceId;
  fSessionId = self->fSessionId;
  fStartDate = self->fStartDate;
  fEndDate = self->fEndDate;
  double fRunDistance = self->fRunDistance;
  double fRunAvgSpeed = self->fRunAvgSpeed;
  double fRunMaxSpeed = self->fRunMaxSpeed;
  double fRunSlope = self->fRunSlope;
  double fRunElevationDescent = self->fRunElevationDescent;

  return (id)objc_msgSend_initWithRecordId_sourceId_sessionId_startDate_endDate_runDistance_runAvgSpeed_runMaxSpeed_runSlope_runElevationDescent_(v7, v8, fRecordId, fSourceId, fSessionId, fStartDate, fEndDate, fRunDistance, fRunAvgSpeed, fRunMaxSpeed, fRunSlope, fRunElevationDescent);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, @"kCMSkiDataCodingKeyRecordId");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fSourceId, @"kCMSkiDataCodingKeySourceId");
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fSessionId, @"kCMSkiDataCodingKeySessionId");
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->fStartDate, @"kCMSkiDataCodingKeyStartDate");
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fEndDate, @"kCMSkiDataCodingKeyEndDate");
  objc_msgSend_encodeDouble_forKey_(a3, v9, @"kCMSkiDataCodingKeyRunDistance", self->fRunDistance);
  objc_msgSend_encodeDouble_forKey_(a3, v10, @"kCMSkiDataCodingKeyRunAvgSpeed", self->fRunAvgSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v11, @"kCMSkiDataCodingKeyRunMaxSpeed", self->fRunMaxSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v12, @"kCMSkiDataCodingKeyRunSlope", self->fRunSlope);
  double fRunElevationDescent = self->fRunElevationDescent;

  objc_msgSend_encodeDouble_forKey_(a3, v13, @"kCMSkiDataCodingKeyRunElevationDescent", fRunElevationDescent);
}

- (unint64_t)recordId
{
  return self->fRecordId;
}

- (NSUUID)sourceId
{
  return self->fSourceId;
}

- (NSUUID)sessionId
{
  return self->fSessionId;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

- (double)runDistance
{
  return self->fRunDistance;
}

- (double)runAvgSpeed
{
  return self->fRunAvgSpeed;
}

- (double)runMaxSpeed
{
  return self->fRunMaxSpeed;
}

- (double)runSlope
{
  return self->fRunSlope;
}

- (double)runElevationDescent
{
  return self->fRunElevationDescent;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_sessionId(self, v6, v7);
  uint64_t started = objc_msgSend_startDate(self, v9, v10);
  uint64_t v14 = objc_msgSend_endDate(self, v12, v13);
  objc_msgSend_runDistance(self, v15, v16);
  uint64_t v18 = v17;
  objc_msgSend_runAvgSpeed(self, v19, v20);
  uint64_t v22 = v21;
  objc_msgSend_runMaxSpeed(self, v23, v24);
  uint64_t v26 = v25;
  objc_msgSend_runSlope(self, v27, v28);
  uint64_t v30 = v29;
  objc_msgSend_runElevationDescent(self, v31, v32);
  return (id)objc_msgSend_stringWithFormat_(v3, v33, @"%@, <sessionId %@, startDate %@, endDate %@, runDistance %.2f, runAvgSpeed %.2f, runMaxSpeed %.2f, runSlope %.2f, runElevationDescent %.2f>", v5, v8, started, v14, v18, v22, v26, v30, v34);
}

@end