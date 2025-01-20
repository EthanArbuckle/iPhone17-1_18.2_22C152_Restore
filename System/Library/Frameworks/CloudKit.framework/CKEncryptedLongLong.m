@interface CKEncryptedLongLong
- (CKEncryptedLongLong)initWithLongLong:(int64_t)a3;
- (id)value;
- (int64_t)longLongValue;
@end

@implementation CKEncryptedLongLong

- (CKEncryptedLongLong)initWithLongLong:(int64_t)a3
{
  v5 = objc_alloc_init(CKDPRecordFieldValueEncryptedValue);
  objc_msgSend_setSignedValue_(v5, v6, a3, v7);
  v11 = objc_msgSend_data(v5, v8, v9, v10);
  v14.receiver = self;
  v14.super_class = (Class)CKEncryptedLongLong;
  v12 = [(CKEncryptedData *)&v14 initWithData:v11];

  return v12;
}

- (int64_t)longLongValue
{
  v4 = objc_msgSend_data(self, a2, v2, v3);
  if (v4)
  {
    v5 = [CKDPRecordFieldValueEncryptedValue alloc];
    v8 = objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);
    int64_t v12 = objc_msgSend_signedValue(v8, v9, v10, v11);
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (id)value
{
  v4 = NSNumber;
  uint64_t v6 = objc_msgSend_longLongValue(self, a2, v2, v3);

  return (id)objc_msgSend_numberWithLongLong_(v4, v5, v6, v7);
}

@end