@interface CKException
- (CKException)initWithCode:(int)a3 format:(id)a4;
- (CKException)initWithCode:(int)a3 format:(id)a4 args:(char *)a5;
- (CKException)initWithName:(id)a3 format:(id)a4;
- (CKException)initWithName:(id)a3 format:(id)a4 args:(char *)a5;
- (id)error;
- (int)errorCode;
@end

@implementation CKException

- (CKException)initWithCode:(int)a3 format:(id)a4
{
  return (CKException *)objc_msgSend_initWithCode_format_args_(self, a2, *(uint64_t *)&a3, (uint64_t)a4, &v5);
}

- (CKException)initWithCode:(int)a3 format:(id)a4 args:(char *)a5
{
  uint64_t v6 = *(void *)&a3;
  v22[1] = *MEMORY[0x1E4F143B8];
  v8 = (objc_class *)NSString;
  id v9 = a4;
  id v10 = [v8 alloc];
  v12 = objc_msgSend_initWithFormat_arguments_(v10, v11, (uint64_t)v9, (uint64_t)a5);

  v21 = @"CKErrorCode";
  v15 = objc_msgSend_numberWithInt_(NSNumber, v13, v6, v14);
  v22[0] = v15;
  v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v22, (uint64_t)&v21, 1);

  v20.receiver = self;
  v20.super_class = (Class)CKException;
  v18 = [(CKException *)&v20 initWithName:@"CKException" reason:v12 userInfo:v17];

  return v18;
}

- (CKException)initWithName:(id)a3 format:(id)a4
{
  return (CKException *)objc_msgSend_initWithName_format_args_(self, a2, (uint64_t)a3, (uint64_t)a4, &v5);
}

- (CKException)initWithName:(id)a3 format:(id)a4 args:(char *)a5
{
  v8 = (objc_class *)NSString;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 alloc];
  v13 = objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, (uint64_t)a5);

  v16.receiver = self;
  v16.super_class = (Class)CKException;
  uint64_t v14 = [(CKException *)&v16 initWithName:v10 reason:v13 userInfo:0];

  return v14;
}

- (int)errorCode
{
  v4 = objc_msgSend_userInfo(self, a2, v2, v3);
  v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"CKErrorCode", v6);
  int v11 = objc_msgSend_intValue(v7, v8, v9, v10);

  return v11;
}

- (id)error
{
  uint64_t v5 = (int)objc_msgSend_errorCode(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_reason(self, v6, v7, v8);
  int v11 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v10, @"CKInternalErrorDomain", v5, @"%@", v9);

  return v11;
}

@end