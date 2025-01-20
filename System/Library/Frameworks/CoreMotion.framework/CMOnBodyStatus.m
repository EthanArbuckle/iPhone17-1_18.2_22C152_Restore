@interface CMOnBodyStatus
+ (BOOL)supportsSecureCoding;
- (CMOnBodyStatus)initWithCoder:(id)a3;
- (CMOnBodyStatus)initWithOnBodyResult:(int)a3 confidence:(int)a4 timestamp:(double)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)confidence;
- (int64_t)result;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMOnBodyStatus

- (CMOnBodyStatus)initWithOnBodyResult:(int)a3 confidence:(int)a4 timestamp:(double)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CMOnBodyStatus;
  result = [(CMLogItem *)&v8 initWithTimestamp:a5];
  if (result)
  {
    result->fResult = a3;
    result->fConfidence = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMOnBodyStatus)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CMOnBodyStatus;
  v5 = -[CMLogItem initWithCoder:](&v8, sel_initWithCoder_);
  if (v5)
  {
    v5->fResult = objc_msgSend_decodeIntForKey_(a3, v4, @"kCMOnBodyStatusResult");
    v5->fConfidence = objc_msgSend_decodeIntForKey_(a3, v6, @"kCMOnBodyStatusConfidence");
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t fResult = self->fResult;
  uint64_t fConfidence = self->fConfidence;
  v12.receiver = self;
  v12.super_class = (Class)CMOnBodyStatus;
  [(CMLogItem *)&v12 timestamp];
  return (id)objc_msgSend_initWithOnBodyResult_confidence_timestamp_(v7, v10, fResult, fConfidence);
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMOnBodyStatus;
  -[CMLogItem encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend_encodeInt_forKey_(a3, v5, self->fResult, @"kCMOnBodyStatusResult");
  objc_msgSend_encodeInt_forKey_(a3, v6, self->fConfidence, @"kCMOnBodyStatusConfidence");
}

- (int64_t)result
{
  return self->fResult;
}

- (int64_t)confidence
{
  return self->fConfidence;
}

- (id)description
{
  v2 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CMOnBodyStatus;
  uint64_t fResult = self->fResult;
  uint64_t fConfidence = self->fConfidence;
  [(CMLogItem *)&v8 timestamp];
  return (id)objc_msgSend_stringWithFormat_(v2, v5, @"result %d confidence %d timestamp %f", fResult, fConfidence, v6);
}

@end