@interface CMVO2MaxRetrocomputeState
+ (BOOL)supportsSecureCoding;
- (CMVO2MaxRetrocomputeState)initWithCoder:(id)a3;
- (CMVO2MaxRetrocomputeState)initWithStatus:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 meanDelta:(id)a6;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)meanDelta;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)status;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMVO2MaxRetrocomputeState

- (CMVO2MaxRetrocomputeState)initWithStatus:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 meanDelta:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)CMVO2MaxRetrocomputeState;
  v10 = [(CMVO2MaxRetrocomputeState *)&v12 init];
  if (v10)
  {
    v10->_startDate = (NSDate *)a4;
    v10->_endDate = (NSDate *)a5;
    v10->_meanDelta = (NSNumber *)a6;
    v10->_status = a3;
  }
  return v10;
}

- (CMVO2MaxRetrocomputeState)initWithCoder:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CMVO2MaxRetrocomputeState;
  v4 = [(CMVO2MaxRetrocomputeState *)&v22 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kMetMinuteDataCodingKeyStartDate");
    v4->_startDate = (NSDate *)objc_msgSend_copy(v7, v8, v9);
    uint64_t v10 = objc_opt_class();
    objc_super v12 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, @"kMetMinuteDataCodingKeyEndDate");
    v4->_endDate = (NSDate *)objc_msgSend_copy(v12, v13, v14);
    uint64_t v15 = objc_opt_class();
    v17 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, @"kMetMinuteDataCodingKeyMeanDelta");
    v4->_meanDelta = (NSNumber *)objc_msgSend_copy(v17, v18, v19);
    v4->_status = objc_msgSend_decodeInt64ForKey_(a3, v20, @"kMetMinuteDataCodingKeyStatus");
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMVO2MaxRetrocomputeState;
  [(CMVO2MaxRetrocomputeState *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_startDate, @"kMetMinuteDataCodingKeyStartDate");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_endDate, @"kMetMinuteDataCodingKeyEndDate");
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_meanDelta, @"kMetMinuteDataCodingKeyMeanDelta");
  int64_t status = self->_status;

  objc_msgSend_encodeInt64_forKey_(a3, v7, status, @"kMetMinuteDataCodingKeyStatus");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)status
{
  return self->_status;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  int64_t status = self->_status;

  return (id)MEMORY[0x1F4181798](v7, sel_initWithStatus_startDate_endDate_meanDelta_, status);
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t started = objc_msgSend_startDate(self, v6, v7);
  uint64_t v11 = objc_msgSend_endDate(self, v9, v10);
  uint64_t v14 = objc_msgSend_meanDelta(self, v12, v13);
  uint64_t v17 = objc_msgSend_status(self, v15, v16);
  return (id)objc_msgSend_stringWithFormat_(v3, v18, @"%@, <startDate, %@, endDate, %@, meanDelta, %@, status %ld>", v5, started, v11, v14, v17);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSNumber)meanDelta
{
  return self->_meanDelta;
}

@end