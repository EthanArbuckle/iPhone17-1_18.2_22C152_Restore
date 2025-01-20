@interface CMHighFrequencyHeartRateData
+ (BOOL)supportsSecureCoding;
- (CMHighFrequencyHeartRateData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMHighFrequencyHeartRateData)initWithCoder:(id)a3;
- (CMHighFrequencyHeartRateData)initWithHeartRateData:(id)a3;
- (CMHighFrequencyHeartRateDataConfidence)confidence;
- (NSDate)date;
- (double)heartRate;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sr_dictionaryRepresentation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMHighFrequencyHeartRateData

- (CMHighFrequencyHeartRateData)initWithHeartRateData:(id)a3
{
  objc_msgSend_frequency(a3, a2, (uint64_t)a3);
  if (v7 >= 1.0 && (objc_msgSend_confidence(a3, v5, v6), v10 >= 0.4))
  {
    objc_msgSend_timestamp(a3, v8, v9);
    v19.receiver = self;
    v19.super_class = (Class)CMHighFrequencyHeartRateData;
    v11 = -[CMLogItem initWithTimestamp:](&v19, sel_initWithTimestamp_);
    if (v11)
    {
      started = (CMHeartRateData *)a3;
      goto LABEL_7;
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CMHighFrequencyHeartRateData;
    v11 = [(CMLogItem *)&v20 initWithTimestamp:0.0];
    if (v11)
    {
      v12 = [CMHeartRateData alloc];
      uint64_t v15 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v13, v14, 0.0);
      started = (CMHeartRateData *)objc_msgSend_initWithHeartRate_confidence_timestamp_startDate_error_dataSource_mode_(v12, v16, v15, 0, 3, 1, 0.0, 0.0, 0.0);
LABEL_7:
      v11->_heartRateData = started;
    }
  }
  return v11;
}

- (void)dealloc
{
  self->_heartRateData = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMHighFrequencyHeartRateData;
  [(CMLogItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CMHighFrequencyHeartRateData;
  uint64_t v6 = [(CMLogItem *)&v8 copyWithZone:a3];
  if (v6) {
    v6[2] = objc_msgSend_copy(self->_heartRateData, v4, v5);
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMHighFrequencyHeartRateData)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CMHighFrequencyHeartRateData;
  v4 = -[CMLogItem initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_heartRateData = (CMHeartRateData *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMHighFrequencyHeartRateDataCodingKeyData");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CMHighFrequencyHeartRateData;
  -[CMLogItem encodeWithCoder:](&v6, sel_encodeWithCoder_);
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_heartRateData, @"kCMHighFrequencyHeartRateDataCodingKeyData");
}

- (double)heartRate
{
  objc_msgSend_heartRate(self->_heartRateData, a2, v2);
  return result;
}

- (CMHighFrequencyHeartRateDataConfidence)confidence
{
  objc_msgSend_confidence(self->_heartRateData, a2, v2);
  if (v6 < 0.6) {
    return 0;
  }
  objc_msgSend_confidence(self->_heartRateData, v4, v5);
  if (v10 < 0.8) {
    return 1;
  }
  objc_msgSend_confidence(self->_heartRateData, v8, v9);
  if (v11 >= 1.0) {
    return 3;
  }
  else {
    return 2;
  }
}

- (NSDate)date
{
  return (NSDate *)objc_msgSend_startDate(self->_heartRateData, a2, v2);
}

- (id)binarySampleRepresentation
{
  objc_super v3 = (void *)MEMORY[0x192FCD2F0](self, a2);
  id v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)self, 1, 0);

  return v5;
}

- (CMHighFrequencyHeartRateData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (!objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5)) {
    goto LABEL_7;
  }
  v22.receiver = self;
  v22.super_class = (Class)CMHighFrequencyHeartRateData;
  self = [(CMHighFrequencyHeartRateData *)&v22 init];
  if (!self) {
    return self;
  }
  double v7 = (void *)MEMORY[0x1E4F28DC0];
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v12 = (id)objc_msgSend_initWithObjects_(v8, v11, v9, v10, 0);
  uint64_t v14 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v7, v13, (uint64_t)v12, a3, 0);
  if (!v14)
  {
LABEL_7:

    return 0;
  }
  uint64_t v15 = (void *)v14;
  uint64_t v16 = objc_opt_class();
  if (v16 == objc_opt_class())
  {

    return (CMHighFrequencyHeartRateData *)v15;
  }
  uint64_t v17 = objc_opt_class();
  if (v17 == objc_opt_class())
  {

    v18 = [CMHighFrequencyHeartRateData alloc];
    return (CMHighFrequencyHeartRateData *)objc_msgSend_initWithHeartRateData_(v18, v19, (uint64_t)v15);
  }
  return self;
}

- (id)sr_dictionaryRepresentation
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v22[0] = @"heartRate";
  v4 = NSNumber;
  objc_msgSend_heartRate(self, a2, v2);
  v23[0] = objc_msgSend_numberWithDouble_(v4, v5, v6);
  v22[1] = @"confidence";
  double v7 = NSNumber;
  uint64_t v10 = objc_msgSend_confidence(self, v8, v9);
  v23[1] = objc_msgSend_numberWithInteger_(v7, v11, v10);
  v22[2] = @"startTime";
  id v12 = NSNumber;
  uint64_t v15 = objc_msgSend_date(self, v13, v14);
  objc_msgSend_timeIntervalSinceReferenceDate(v15, v16, v17);
  v23[2] = objc_msgSend_numberWithDouble_(v12, v18, v19);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v23, v22, 3);
}

@end