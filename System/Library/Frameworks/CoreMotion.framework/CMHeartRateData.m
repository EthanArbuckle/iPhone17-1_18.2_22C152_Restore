@interface CMHeartRateData
+ (BOOL)supportsSecureCoding;
+ (id)dataSourceName:(int64_t)a3;
+ (id)modeName:(int64_t)a3;
- (BOOL)error;
- (CMHeartRateData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMHeartRateData)initWithCoder:(id)a3;
- (CMHeartRateData)initWithHeartRate:(double)a3 confidence:(double)a4 timestamp:(double)a5 startDate:(id)a6 error:(BOOL)a7 dataSource:(int64_t)a8 mode:(int64_t)a9;
- (CMHeartRateData)initWithHighFrequencyHeartRate:(id)a3;
- (NSDate)startDate;
- (NSString)description;
- (double)confidence;
- (double)frequency;
- (double)heartRate;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)dataSource;
- (int64_t)mode;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setFrequency:(double)a3;
@end

@implementation CMHeartRateData

- (CMHeartRateData)initWithHeartRate:(double)a3 confidence:(double)a4 timestamp:(double)a5 startDate:(id)a6 error:(BOOL)a7 dataSource:(int64_t)a8 mode:(int64_t)a9
{
  v18.receiver = self;
  v18.super_class = (Class)CMHeartRateData;
  v15 = [(CMLogItem *)&v18 initWithTimestamp:a5];
  v16 = v15;
  if (v15)
  {
    v15->_heartRate = a3;
    v15->_confidence = a4;
    v15->_startDate = (NSDate *)a6;
    v16->_error = a7;
    v16->_dataSource = a8;
    v16->_mode = a9;
    v16->_frequency = -1.0;
  }
  return v16;
}

- (CMHeartRateData)initWithHighFrequencyHeartRate:(id)a3
{
  objc_msgSend_timestamp(a3, a2, (uint64_t)a3);
  v12.receiver = self;
  v12.super_class = (Class)CMHeartRateData;
  v7 = -[CMLogItem initWithTimestamp:](&v12, sel_initWithTimestamp_);
  if (v7)
  {
    objc_msgSend_heartRate(a3, v5, v6);
    v7->_heartRate = v8;
    v7->_confidence = 1.0;
    v7->_startDate = (NSDate *)(id)objc_msgSend_date(a3, v9, v10);
    v7->_error = 0;
    v7->_dataSource = 3;
    v7->_mode = 1;
    v7->_frequency = 1.0;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMHeartRateData;
  [(CMLogItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CMHeartRateData;
  v4 = [(CMLogItem *)&v9 copyWithZone:a3];
  v7 = v4;
  if (v4)
  {
    v4[3] = *(void *)&self->_heartRate;
    v4[4] = *(void *)&self->_confidence;
    v4[5] = objc_msgSend_copy(self->_startDate, v5, v6);
    v7[16] = self->_error;
    *((void *)v7 + 6) = self->_dataSource;
    *((void *)v7 + 7) = self->_mode;
    *((void *)v7 + 8) = *(void *)&self->_frequency;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMHeartRateData)initWithCoder:(id)a3
{
  v33.receiver = self;
  v33.super_class = (Class)CMHeartRateData;
  v4 = -[CMLogItem initWithCoder:](&v33, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMHeartRateDataCodingKeyHeartRate");
    objc_msgSend_doubleValue(v7, v8, v9);
    v4->_heartRate = v10;
    uint64_t v11 = objc_opt_class();
    v13 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, @"kCMHeartRateDataCodingKeyConfidence");
    objc_msgSend_doubleValue(v13, v14, v15);
    v4->_confidence = v16;
    uint64_t v17 = objc_opt_class();
    v4->_startDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, @"kCMHeartRateDataCodingKeyStartDate");
    uint64_t v19 = objc_opt_class();
    v21 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, @"kCMHeartRateDataCodingKeyError");
    v4->_error = objc_msgSend_BOOLValue(v21, v22, v23);
    v4->_dataSource = objc_msgSend_decodeIntegerForKey_(a3, v24, @"kCMHeartRateDataCodingKeyDataSource");
    v4->_mode = objc_msgSend_decodeIntegerForKey_(a3, v25, @"kCMHeartRateDataCodingKeyMode");
    uint64_t v26 = objc_opt_class();
    v28 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v27, v26, @"kCMHeartRateDataCodingKeyFrequency");
    objc_msgSend_doubleValue(v28, v29, v30);
    v4->_frequency = v31;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CMHeartRateData;
  -[CMLogItem encodeWithCoder:](&v23, sel_encodeWithCoder_);
  uint64_t v7 = objc_msgSend_numberWithDouble_(NSNumber, v5, v6, self->_heartRate);
  objc_msgSend_encodeObject_forKey_(a3, v8, v7, @"kCMHeartRateDataCodingKeyHeartRate");
  uint64_t v11 = objc_msgSend_numberWithDouble_(NSNumber, v9, v10, self->_confidence);
  objc_msgSend_encodeObject_forKey_(a3, v12, v11, @"kCMHeartRateDataCodingKeyConfidence");
  objc_msgSend_encodeObject_forKey_(a3, v13, (uint64_t)self->_startDate, @"kCMHeartRateDataCodingKeyStartDate");
  uint64_t v15 = objc_msgSend_numberWithBool_(NSNumber, v14, self->_error);
  objc_msgSend_encodeObject_forKey_(a3, v16, v15, @"kCMHeartRateDataCodingKeyError");
  objc_msgSend_encodeInteger_forKey_(a3, v17, self->_dataSource, @"kCMHeartRateDataCodingKeyDataSource");
  objc_msgSend_encodeInteger_forKey_(a3, v18, self->_mode, @"kCMHeartRateDataCodingKeyMode");
  uint64_t v21 = objc_msgSend_numberWithDouble_(NSNumber, v19, v20, self->_frequency);
  objc_msgSend_encodeObject_forKey_(a3, v22, v21, @"kCMHeartRateDataCodingKeyFrequency");
}

+ (id)dataSourceName:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return off_1E568FF10[a3];
  }
}

+ (id)modeName:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return off_1E568FF38[a3];
  }
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  double heartRate = self->_heartRate;
  double confidence = self->_confidence;
  v18.receiver = self;
  v18.super_class = (Class)CMHeartRateData;
  [(CMLogItem *)&v18 timestamp];
  uint64_t v10 = v9;
  startDate = self->_startDate;
  if (self->_error) {
    objc_super v12 = "true";
  }
  else {
    objc_super v12 = "false";
  }
  uint64_t v13 = objc_msgSend_dataSourceName_(CMHeartRateData, v8, self->_dataSource);
  uint64_t v15 = objc_msgSend_modeName_(CMHeartRateData, v14, self->_mode);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v16, @"%@,<heartRate %f, confidence %f, @ %f, startDate %@, error %s, dataSource %@, mode %@, frequency %f>", v5, *(void *)&heartRate, *(void *)&confidence, v10, startDate, v12, v13, v15, *(void *)&self->_frequency);
}

- (double)heartRate
{
  return self->_heartRate;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (BOOL)error
{
  return self->_error;
}

- (int64_t)dataSource
{
  return self->_dataSource;
}

- (int64_t)mode
{
  return self->_mode;
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)a3
{
  self->_frequency = a3;
}

- (id)binarySampleRepresentation
{
  objc_super v3 = (void *)MEMORY[0x192FCD2F0](self, a2);
  id v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)self, 1, 0);

  return v5;
}

- (CMHeartRateData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
    v14.receiver = self;
    v14.super_class = (Class)CMHeartRateData;
    uint64_t v7 = [(CMHeartRateData *)&v14 init];
    if (v7)
    {
      double v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = objc_opt_class();
      uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v8, v10, v9, a3, 0);
      if (v11)
      {
        objc_super v12 = (void *)v11;

        return (CMHeartRateData *)v12;
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