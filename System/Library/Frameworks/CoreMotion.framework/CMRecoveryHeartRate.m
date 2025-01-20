@interface CMRecoveryHeartRate
+ (BOOL)supportsSecureCoding;
+ (HRRecoveryInputHR)inputFromPreparedStatement:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (CMRecoveryHeartRate)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMRecoveryHeartRate)initWithCoder:(id)a3;
- (CMRecoveryHeartRate)initWithRecordId:(unint64_t)a3 startDate:(id)a4 heartRate:(double)a5 heartRateConfidence:(double)a6;
- (CMRecoveryHeartRate)initWithSample:(HRRecoveryInputHR *)a3;
- (NSDate)startDate;
- (NSString)description;
- (double)heartRate;
- (double)heartRateConfidence;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sr_dictionaryRepresentation;
- (unint64_t)recordId;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMRecoveryHeartRate

- (id)sr_dictionaryRepresentation
{
  v25[3] = *MEMORY[0x1E4F143B8];
  objc_msgSend_heartRateConfidence(self, a2, v2);
  if (v6 >= 0.6)
  {
    objc_msgSend_heartRateConfidence(self, v4, v5);
    if (v8 >= 0.8)
    {
      objc_msgSend_heartRateConfidence(self, v4, v5);
      if (v9 >= 1.0) {
        uint64_t v7 = 3;
      }
      else {
        uint64_t v7 = 2;
      }
    }
    else
    {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  v24[0] = @"startTime";
  v10 = NSNumber;
  started = objc_msgSend_startDate(self, v4, v5);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v12, v13);
  v25[0] = objc_msgSend_numberWithDouble_(v10, v14, v15);
  v24[1] = @"heartRate";
  v16 = NSNumber;
  objc_msgSend_heartRate(self, v17, v18);
  v25[1] = objc_msgSend_numberWithDouble_(v16, v19, v20);
  v24[2] = @"confidence";
  v25[2] = objc_msgSend_numberWithInteger_(NSNumber, v21, v7);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)v25, v24, 3);
}

- (CMRecoveryHeartRate)initWithRecordId:(unint64_t)a3 startDate:(id)a4 heartRate:(double)a5 heartRateConfidence:(double)a6
{
  v13.receiver = self;
  v13.super_class = (Class)CMRecoveryHeartRate;
  v10 = [(CMRecoveryHeartRate *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->fRecordId = a3;
    v10->fStartDate = (NSDate *)a4;
    v11->fHeartRate = a5;
    v11->fHeartRateConfidence = a6;
  }
  return v11;
}

- (CMRecoveryHeartRate)initWithSample:(HRRecoveryInputHR *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CMRecoveryHeartRate;
  v4 = [(CMRecoveryHeartRate *)&v10 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->fRecordId = a3->var0;
    id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v5->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v6, v7, v8, a3->var1);
    v5->fHeartRate = a3->var2;
    v5->fHeartRateConfidence = a3->var3;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMRecoveryHeartRate;
  [(CMRecoveryHeartRate *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMRecoveryHeartRate)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CMRecoveryHeartRate;
  uint64_t v5 = [(CMRecoveryHeartRate *)&v16 init];
  if (v5)
  {
    v5->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, @"kCMRecoveryHeartRateCodingKeyRecordId");
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v7, v6, @"kCMRecoveryHeartRateCodingKeyStartDate");
    v5->fStartDate = (NSDate *)objc_msgSend_copy(v8, v9, v10);
    objc_msgSend_decodeDoubleForKey_(a3, v11, @"kCMRecoveryHeartRateCodingKeyHeartRate");
    v5->fHeartRate = v12;
    objc_msgSend_decodeDoubleForKey_(a3, v13, @"kCMRecoveryHeartRateCodingKeyHeartRateConfidence");
    v5->fHeartRateConfidence = v14;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t fRecordId = self->fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fStartDate, a2, (uint64_t)a3);
  uint64_t v7 = v6;
  *(float *)&uint64_t v6 = self->fHeartRate;
  double v8 = *(float *)&v6;
  *(float *)&uint64_t v6 = self->fHeartRateConfidence;
  double v9 = *(float *)&v6;
  uint64_t v10 = objc_opt_class();
  double v12 = objc_msgSend_allocWithZone_(v10, v11, (uint64_t)a3);
  v15[0] = fRecordId;
  v15[1] = v7;
  *(double *)&v15[2] = v8;
  *(double *)&v15[3] = v9;
  return (id)objc_msgSend_initWithSample_(v12, v13, (uint64_t)v15);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, @"kCMRecoveryHeartRateCodingKeyRecordId");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fStartDate, @"kCMRecoveryHeartRateCodingKeyStartDate");
  objc_msgSend_encodeDouble_forKey_(a3, v6, @"kCMRecoveryHeartRateCodingKeyHeartRate", self->fHeartRate);
  double fHeartRateConfidence = self->fHeartRateConfidence;

  objc_msgSend_encodeDouble_forKey_(a3, v7, @"kCMRecoveryHeartRateCodingKeyHeartRateConfidence", fHeartRateConfidence);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v7 = objc_msgSend_recordId(self, v5, v6);
  if (v7 != objc_msgSend_recordId(a3, v8, v9)) {
    goto LABEL_8;
  }
  if (!objc_msgSend_startDate(self, v10, v11) && !objc_msgSend_startDate(a3, v12, v13)
    || (started = objc_msgSend_startDate(self, v12, v13),
        uint64_t v17 = objc_msgSend_startDate(a3, v15, v16),
        (int isEqualToDate = objc_msgSend_isEqualToDate_(started, v18, v17)) != 0))
  {
    objc_msgSend_heartRate(self, v12, v13);
    double v21 = v20;
    objc_msgSend_heartRate(a3, v22, v23);
    if (v21 == v26)
    {
      objc_msgSend_heartRateConfidence(self, v24, v25);
      double v28 = v27;
      objc_msgSend_heartRateConfidence(a3, v29, v30);
      LOBYTE(isEqualToDate) = v28 == v31;
      return isEqualToDate;
    }
LABEL_8:
    LOBYTE(isEqualToDate) = 0;
  }
  return isEqualToDate;
}

- (unint64_t)recordId
{
  return self->fRecordId;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (double)heartRate
{
  return self->fHeartRate;
}

- (double)heartRateConfidence
{
  return self->fHeartRateConfidence;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_recordId(self, v6, v7);
  uint64_t started = objc_msgSend_startDate(self, v9, v10);
  objc_msgSend_heartRate(self, v12, v13);
  uint64_t v15 = v14;
  objc_msgSend_heartRateConfidence(self, v16, v17);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v18, @"%@, <recordId, %lu, startDate, %@, hr, %.3f, hrConf, %.3f>", v5, v8, started, v15, v19);
}

+ (HRRecoveryInputHR)inputFromPreparedStatement:(SEL)a3
{
  retstr->var0 = sqlite3_column_int(a4, 0);
  retstr->var1 = sqlite3_column_double(a4, 1);
  retstr->var2 = sqlite3_column_double(a4, 2);
  retstr->var3 = sqlite3_column_double(a4, 3);
  return result;
}

- (id)binarySampleRepresentation
{
  objc_super v3 = (void *)MEMORY[0x192FCD2F0](self, a2);
  id v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)self, 1, 0);

  return v5;
}

- (CMRecoveryHeartRate)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
    v14.receiver = self;
    v14.super_class = (Class)CMRecoveryHeartRate;
    uint64_t v7 = [(CMRecoveryHeartRate *)&v14 init];
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = objc_opt_class();
      uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v8, v10, v9, a3, 0);
      if (v11)
      {
        double v12 = (void *)v11;

        return (CMRecoveryHeartRate *)v12;
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