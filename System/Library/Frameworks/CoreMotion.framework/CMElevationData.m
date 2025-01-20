@interface CMElevationData
+ (BOOL)supportsSecureCoding;
+ (id)sourceName:(int64_t)a3;
- (CMElevationData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMElevationData)initWithCoder:(id)a3;
- (CMElevationData)initWithSignificantElevationSample:(id)a3;
- (CMElevationData)initWithStartDate:(id)a3 endDate:(id)a4 elevationAscended:(unint64_t)a5 elevationDescended:(unint64_t)a6 source:(int64_t)a7 recordId:(unint64_t)a8 sourceId:(id)a9;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (NSUUID)sourceId;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)source;
- (unint64_t)elevationAscended;
- (unint64_t)elevationDescended;
- (unint64_t)recordId;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMElevationData

- (CMElevationData)initWithSignificantElevationSample:(id)a3
{
  if (!a3)
  {
    v32 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, self, @"CMElevationData.mm", 34, @"Invalid parameter not satisfying: %@", @"sample");
  }
  uint64_t started = objc_msgSend_startDate(a3, a2, (uint64_t)a3);
  uint64_t v8 = objc_msgSend_endDate(a3, v6, v7);
  v11 = objc_msgSend_elevationAscended(a3, v9, v10);
  objc_msgSend_doubleValue(v11, v12, v13);
  unint64_t v15 = (unint64_t)(v14 * 100.0);
  v18 = objc_msgSend_elevationDescended(a3, v16, v17);
  objc_msgSend_doubleValue(v18, v19, v20);
  unint64_t v22 = (unint64_t)(v21 * 100.0);
  uint64_t v25 = objc_msgSend_recordId(a3, v23, v24);
  uint64_t v28 = objc_msgSend_sourceId(a3, v26, v27);
  return (CMElevationData *)objc_msgSend_initWithStartDate_endDate_elevationAscended_elevationDescended_source_recordId_sourceId_(self, v29, started, v8, v15, v22, 1000, v25, v28);
}

- (CMElevationData)initWithStartDate:(id)a3 endDate:(id)a4 elevationAscended:(unint64_t)a5 elevationDescended:(unint64_t)a6 source:(int64_t)a7 recordId:(unint64_t)a8 sourceId:(id)a9
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, @"CMElevationData.mm", 52, @"Invalid parameter not satisfying: %@", @"startDate");
    if (a4) {
      goto LABEL_3;
    }
  }
  double v21 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, @"CMElevationData.mm", 53, @"Invalid parameter not satisfying: %@", @"endDate");
LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)CMElevationData;
  uint64_t v17 = [(CMElevationData *)&v23 init];
  if (v17)
  {
    v17->fStartDate = (NSDate *)a3;
    v17->fEndDate = (NSDate *)a4;
    v17->fElevationAscended = a5;
    v17->fElevationDescended = a6;
    v17->fSource = a7;
    v17->fRecordId = a8;
    v17->fSourceId = (NSUUID *)a9;
  }
  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMElevationData;
  [(CMElevationData *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMElevationData)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CMElevationData;
  v5 = [(CMElevationData *)&v16 init];
  if (v5)
  {
    v5->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, @"kCMElevationDataCodingKeyRecordId");
    uint64_t v6 = objc_opt_class();
    v5->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v7, v6, @"kCMElevationDataCodingKeySourceId");
    uint64_t v8 = objc_opt_class();
    v5->fStartDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, @"kCMElevationDataCodingKeyStartDate");
    uint64_t v10 = objc_opt_class();
    v5->fEndDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, @"kCMElevationDataCodingKeyEndDate");
    v5->fElevationAscended = objc_msgSend_decodeIntegerForKey_(a3, v12, @"kCMElevationDataCodingKeyElevationAscended");
    v5->fElevationDescended = objc_msgSend_decodeIntegerForKey_(a3, v13, @"kCMElevationDataCodingKeyElevationDescended");
    v5->fSource = objc_msgSend_decodeIntegerForKey_(a3, v14, @"kCMElevationDataCodingKeySource");
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  return (id)objc_msgSend_initWithStartDate_endDate_elevationAscended_elevationDescended_source_recordId_sourceId_(v7, v8, (uint64_t)self->fStartDate, self->fEndDate, self->fElevationAscended, self->fElevationDescended, self->fSource, self->fRecordId, self->fSourceId);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, @"kCMElevationDataCodingKeyRecordId");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fSourceId, @"kCMElevationDataCodingKeySourceId");
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fStartDate, @"kCMElevationDataCodingKeyStartDate");
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->fEndDate, @"kCMElevationDataCodingKeyEndDate");
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->fElevationAscended, @"kCMElevationDataCodingKeyElevationAscended");
  objc_msgSend_encodeInteger_forKey_(a3, v9, self->fElevationDescended, @"kCMElevationDataCodingKeyElevationDescended");
  int64_t fSource = self->fSource;

  objc_msgSend_encodeInteger_forKey_(a3, v10, fSource, @"kCMElevationDataCodingKeySource");
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

- (unint64_t)elevationAscended
{
  return self->fElevationAscended;
}

- (unint64_t)elevationDescended
{
  return self->fElevationDescended;
}

- (int64_t)source
{
  return self->fSource;
}

+ (id)sourceName:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id result = @"Phone";
      break;
    case 1:
      id result = @"Watch";
      break;
    case 2:
      id result = @"WatchDEM";
      break;
    case 3:
      id result = @"WatchGPS";
      break;
    default:
      if (a3 == 1000) {
        id result = @"None";
      }
      else {
        id result = 0;
      }
      break;
  }
  return result;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t started = objc_msgSend_startDate(self, v6, v7);
  uint64_t v11 = objc_msgSend_endDate(self, v9, v10);
  uint64_t v14 = objc_msgSend_elevationAscended(self, v12, v13);
  uint64_t v17 = objc_msgSend_elevationDescended(self, v15, v16);
  uint64_t v20 = objc_msgSend_source(self, v18, v19);
  uint64_t v22 = objc_msgSend_sourceName_(CMElevationData, v21, v20);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v23, @"%@, <startDate, %@, endDate, %@, elevationAscended, %lu, elevationDescended, %lu, source, %@>", v5, started, v11, v14, v17, v22);
}

- (id)binarySampleRepresentation
{
  objc_super v3 = (void *)MEMORY[0x192FCD2F0](self, a2);
  id v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)self, 1, 0);

  return v5;
}

- (CMElevationData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
    v14.receiver = self;
    v14.super_class = (Class)CMElevationData;
    uint64_t v7 = [(CMElevationData *)&v14 init];
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = objc_opt_class();
      uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v8, v10, v9, a3, 0);
      if (v11)
      {
        v12 = (void *)v11;

        return (CMElevationData *)v12;
      }
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

@end