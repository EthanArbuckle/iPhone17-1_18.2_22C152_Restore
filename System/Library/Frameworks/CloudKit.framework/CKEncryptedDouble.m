@interface CKEncryptedDouble
- (CKEncryptedDouble)initWithDouble:(double)a3;
- (double)ckDoubleValue;
- (id)value;
@end

@implementation CKEncryptedDouble

- (CKEncryptedDouble)initWithDouble:(double)a3
{
  v5 = objc_alloc_init(CKDPRecordFieldValueEncryptedValue);
  objc_msgSend_setCkDoubleValue_(v5, v6, v7, v8, a3);
  v12 = objc_msgSend_data(v5, v9, v10, v11);
  v15.receiver = self;
  v15.super_class = (Class)CKEncryptedDouble;
  v13 = [(CKEncryptedData *)&v15 initWithData:v12];

  return v13;
}

- (double)ckDoubleValue
{
  v4 = objc_msgSend_data(self, a2, v2, v3);
  if (v4)
  {
    v5 = [CKDPRecordFieldValueEncryptedValue alloc];
    uint64_t v8 = objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);
    objc_msgSend_ckDoubleValue(v8, v9, v10, v11);
    double v13 = v12;
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (id)value
{
  v4 = NSNumber;
  objc_msgSend_ckDoubleValue(self, a2, v2, v3);

  return (id)objc_msgSend_numberWithDouble_(v4, v5, v6, v7);
}

@end