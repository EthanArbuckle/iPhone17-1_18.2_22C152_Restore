@interface CMSignificantElevationSample
+ (BOOL)supportsSecureCoding;
- (CMSignificantElevationSample)initWithCoder:(id)a3;
- (CMSignificantElevationSample)initWithFilteredElevation:(const CLElevationChangeEntry *)a3;
- (CMSignificantElevationSample)initWithRecordId:(unint64_t)a3 sourceId:(id)a4 startDate:(id)a5 endDate:(id)a6 elevationAscended:(id)a7 elevationDescended:(id)a8;
- (CMSignificantElevationSample)initWithSignificantElevation:(const CLSignificantElevation *)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)elevationAscended;
- (NSNumber)elevationDescended;
- (NSUUID)sourceId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)recordId;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMSignificantElevationSample

- (CMSignificantElevationSample)initWithRecordId:(unint64_t)a3 sourceId:(id)a4 startDate:(id)a5 endDate:(id)a6 elevationAscended:(id)a7 elevationDescended:(id)a8
{
  if (!a8 || !a4 || !a5 || !a6 || !a7)
  {
    v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, @"CMAltitude.mm", 200, @"Invalid parameter not satisfying: %@", @"sourceId && startDate && endDate && elevationAscended && elevationDescended");
  }
  v21.receiver = self;
  v21.super_class = (Class)CMSignificantElevationSample;
  v16 = [(CMSignificantElevationSample *)&v21 init];
  v17 = v16;
  if (v16)
  {
    v16->fRecordId = a3;
    v16->fSourceId = (NSUUID *)a4;
    v17->fStartDate = (NSDate *)a5;
    v17->fEndDate = (NSDate *)a6;
    v17->fElevationAscended = (NSNumber *)a7;
    v17->fElevationDescended = (NSNumber *)a8;
  }
  return v17;
}

- (CMSignificantElevationSample)initWithSignificantElevation:(const CLSignificantElevation *)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CMSignificantElevationSample;
  v4 = [(CMSignificantElevationSample *)&v23 init];
  v5 = v4;
  if (v4)
  {
    v4->fRecordId = a3->var0;
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    v5->fSourceId = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v6, v7, (uint64_t)a3->var1);
    id v8 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v5->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v8, v9, v10, a3->var2);
    id v11 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v5->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v11, v12, v13, a3->var3);
    id v14 = objc_alloc(NSNumber);
    LODWORD(v15) = a3->var4;
    v5->fElevationAscended = (NSNumber *)objc_msgSend_initWithDouble_(v14, v16, v17, (double)v15 / 100.0);
    id v18 = objc_alloc(NSNumber);
    LODWORD(v19) = a3->var5;
    v5->fElevationDescended = (NSNumber *)objc_msgSend_initWithDouble_(v18, v20, v21, (double)v19 / 100.0);
  }
  return v5;
}

- (CMSignificantElevationSample)initWithFilteredElevation:(const CLElevationChangeEntry *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CMSignificantElevationSample;
  v4 = [(CMSignificantElevationSample *)&v21 init];
  v5 = v4;
  if (v4)
  {
    v4->fRecordId = 0;
    v4->fSourceId = 0;
    id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v5->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v6, v7, v8, a3->var1);
    id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v5->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v9, v10, v11, a3->var1);
    id v12 = objc_alloc(NSNumber);
    LODWORD(v13) = a3->var2;
    v5->fElevationAscended = (NSNumber *)objc_msgSend_initWithDouble_(v12, v14, v15, (double)v13 / 100.0);
    id v16 = objc_alloc(NSNumber);
    LODWORD(v17) = a3->var3;
    v5->fElevationDescended = (NSNumber *)objc_msgSend_initWithDouble_(v16, v18, v19, (double)v17 / 100.0);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMSignificantElevationSample;
  [(CMSignificantElevationSample *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSignificantElevationSample)initWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CMSignificantElevationSample;
  v5 = [(CMSignificantElevationSample *)&v17 init];
  if (v5)
  {
    v5->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, @"kCMSignificantElevationCodingKeyRecordId");
    uint64_t v6 = objc_opt_class();
    v5->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v7, v6, @"kCMSignificantElevationCodingKeySourceId");
    uint64_t v8 = objc_opt_class();
    v5->fStartDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, @"kCMSignificantElevationCodingKeyStartDate");
    uint64_t v10 = objc_opt_class();
    v5->fEndDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, @"kCMSignificantElevationCodingKeyEndDate");
    uint64_t v12 = objc_opt_class();
    v5->fElevationAscended = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, @"kCMSignificantElevationCodingKeyElevationAscended");
    uint64_t v14 = objc_opt_class();
    v5->fElevationDescended = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, @"kCMSignificantElevationCodingKeyElevationDescended");
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  unint64_t fRecordId = self->fRecordId;
  fSourceId = self->fSourceId;
  fStartDate = self->fStartDate;
  fEndDate = self->fEndDate;
  fElevationAscended = self->fElevationAscended;
  fElevationDescended = self->fElevationDescended;

  return (id)objc_msgSend_initWithRecordId_sourceId_startDate_endDate_elevationAscended_elevationDescended_(v7, v8, fRecordId, fSourceId, fStartDate, fEndDate, fElevationAscended, fElevationDescended);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, @"kCMSignificantElevationCodingKeyRecordId");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fSourceId, @"kCMSignificantElevationCodingKeySourceId");
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fStartDate, @"kCMSignificantElevationCodingKeyStartDate");
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->fEndDate, @"kCMSignificantElevationCodingKeyEndDate");
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fElevationAscended, @"kCMSignificantElevationCodingKeyElevationAscended");
  fElevationDescended = self->fElevationDescended;

  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)fElevationDescended, @"kCMSignificantElevationCodingKeyElevationDescended");
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t started = objc_msgSend_startDate(self, v6, v7);
  uint64_t v11 = objc_msgSend_endDate(self, v9, v10);
  uint64_t v14 = objc_msgSend_elevationAscended(self, v12, v13);
  uint64_t v17 = objc_msgSend_elevationDescended(self, v15, v16);
  return (id)objc_msgSend_stringWithFormat_(v3, v18, @"%@, <startDate, %@, endDate, %@, elevationAscended, %@ elevationDescended, %@>", v5, started, v11, v14, v17);
}

- (unint64_t)recordId
{
  return self->fRecordId;
}

- (NSUUID)sourceId
{
  return self->fSourceId;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

- (NSNumber)elevationAscended
{
  return self->fElevationAscended;
}

- (NSNumber)elevationDescended
{
  return self->fElevationDescended;
}

@end