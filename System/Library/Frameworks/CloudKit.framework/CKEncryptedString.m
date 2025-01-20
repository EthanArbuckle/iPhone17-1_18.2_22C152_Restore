@interface CKEncryptedString
- (CKEncryptedString)initWithString:(id)a3;
- (NSString)string;
@end

@implementation CKEncryptedString

- (CKEncryptedString)initWithString:(id)a3
{
  id v4 = a3;
  id v33 = 0;
  char v5 = _CKCheckArgument((uint64_t)"string", v4, 0, 0, 1, &v33);
  id v6 = v33;
  if ((v5 & 1) == 0)
  {
    v20 = v6;
    v21 = [CKException alloc];
    uint64_t v25 = objc_msgSend_code(v20, v22, v23, v24);
    v29 = objc_msgSend_localizedDescription(v20, v26, v27, v28);
    id v31 = (id)objc_msgSend_initWithCode_format_(v21, v30, v25, @"%@", v29);

    objc_exception_throw(v31);
  }

  v7 = objc_alloc_init(CKDPRecordFieldValueEncryptedValue);
  v11 = objc_msgSend_copy(v4, v8, v9, v10);
  objc_msgSend_setStringValue_(v7, v12, (uint64_t)v11, v13);

  v17 = objc_msgSend_data(v7, v14, v15, v16);
  v32.receiver = self;
  v32.super_class = (Class)CKEncryptedString;
  v18 = [(CKEncryptedData *)&v32 initWithData:v17];

  return v18;
}

- (NSString)string
{
  id v4 = objc_msgSend_data(self, a2, v2, v3);
  if (v4)
  {
    char v5 = [CKDPRecordFieldValueEncryptedValue alloc];
    v8 = objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);
    v12 = objc_msgSend_stringValue(v8, v9, v10, v11);
  }
  else
  {
    v12 = 0;
  }

  return (NSString *)v12;
}

@end