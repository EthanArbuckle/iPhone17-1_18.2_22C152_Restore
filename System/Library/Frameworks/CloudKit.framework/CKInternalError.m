@interface CKInternalError
+ (id)errorWithCode:(int64_t)a3 format:(id)a4;
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4 format:(id)a5;
+ (void)initialize;
@end

@implementation CKInternalError

+ (id)errorWithCode:(int64_t)a3 format:(id)a4
{
  v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = [v6 alloc];
  v10 = objc_msgSend_initWithFormat_arguments_(v8, v9, (uint64_t)v7, (uint64_t)&v15);

  v12 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v11, @"CKInternalErrorDomain", a3, 0, 0, 0, 0, v10);

  return v12;
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4 format:(id)a5
{
  id v8 = (objc_class *)NSString;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 alloc];
  v13 = objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, (uint64_t)&v18);

  uint64_t v15 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v14, @"CKInternalErrorDomain", a3, v10, 0, 0, 0, v13);

  return v15;
}

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 1);
}

@end