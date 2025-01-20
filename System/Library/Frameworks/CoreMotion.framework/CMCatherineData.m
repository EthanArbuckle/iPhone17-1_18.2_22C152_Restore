@interface CMCatherineData
+ (BOOL)supportsSecureCoding;
- (CMCatherineData)initWithCatherine:(double)a3 confidence:(double)a4 timestamp:(double)a5;
- (CMCatherineData)initWithCoder:(id)a3;
- (double)catherine;
- (double)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMCatherineData

- (CMCatherineData)initWithCatherine:(double)a3 confidence:(double)a4 timestamp:(double)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CMCatherineData;
  result = [(CMLogItem *)&v8 initWithTimestamp:a5];
  if (result)
  {
    result->_catherine = a3;
    result->_confidence = a4;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMCatherineData;
  [(CMLogItem *)&v2 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CMCatherineData;
  id result = [(CMLogItem *)&v5 copyWithZone:a3];
  if (result)
  {
    *((void *)result + 2) = *(void *)&self->_catherine;
    *((void *)result + 3) = *(void *)&self->_confidence;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMCatherineData)initWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CMCatherineData;
  v4 = -[CMLogItem initWithCoder:](&v18, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMCatherineDataCodingKeyCatherine");
    objc_msgSend_doubleValue(v7, v8, v9);
    v4->_catherine = v10;
    uint64_t v11 = objc_opt_class();
    v13 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, @"kCMCatherineDataCodingKeyConfidence");
    objc_msgSend_doubleValue(v13, v14, v15);
    v4->_confidence = v16;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CMCatherineData;
  -[CMLogItem encodeWithCoder:](&v13, sel_encodeWithCoder_);
  uint64_t v7 = objc_msgSend_numberWithDouble_(NSNumber, v5, v6, self->_catherine);
  objc_msgSend_encodeObject_forKey_(a3, v8, v7, @"kCMCatherineDataCodingKeyCatherine");
  uint64_t v11 = objc_msgSend_numberWithDouble_(NSNumber, v9, v10, self->_confidence);
  objc_msgSend_encodeObject_forKey_(a3, v12, v11, @"kCMCatherineDataCodingKeyConfidence");
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  double catherine = self->_catherine;
  double confidence = self->_confidence;
  v11.receiver = self;
  v11.super_class = (Class)CMCatherineData;
  [(CMLogItem *)&v11 timestamp];
  return (id)objc_msgSend_stringWithFormat_(v3, v8, @"%@,<catherine %f confidence %f @ %f>", v5, *(void *)&catherine, *(void *)&confidence, v9);
}

- (double)catherine
{
  return self->_catherine;
}

- (double)confidence
{
  return self->_confidence;
}

@end