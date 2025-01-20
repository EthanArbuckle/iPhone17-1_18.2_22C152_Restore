@interface CloudServicesError
+ (id)errorForNSError:(id)a3 path:(id)a4 format:(id)a5;
+ (id)errorWithCode:(int64_t)a3 URL:(id)a4 format:(id)a5;
+ (id)errorWithCode:(int64_t)a3 error:(id)a4 URL:(id)a5 format:(id)a6;
+ (id)errorWithCode:(int64_t)a3 error:(id)a4 format:(id)a5;
+ (id)errorWithCode:(int64_t)a3 format:(id)a4;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 format:(id)a5;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 format:(id)a6;
+ (int64_t)codeForErrno:(int64_t)a3;
+ (int64_t)codeForNSError:(id)a3;
@end

@implementation CloudServicesError

+ (int64_t)codeForNSError:(id)a3
{
  id v3 = a3;
  v6 = objc_msgSend_domain(v3, v4, v5);
  int isEqualToString = objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x263F07F70]);

  if (isEqualToString)
  {
    if ((objc_msgSend_code(v3, v9, v10) | 0x100) == 0x104)
    {
      int64_t v13 = 4;
    }
    else
    {
      v27 = objc_msgSend_userInfo(v3, v11, v12);
      v29 = objc_msgSend_objectForKey_(v27, v28, *MEMORY[0x263F08608]);

      if (v29) {
        int64_t v13 = objc_msgSend_codeForNSError_(CloudServicesError, v30, (uint64_t)v29);
      }
      else {
        int64_t v13 = 100;
      }
    }
  }
  else
  {
    v14 = objc_msgSend_domain(v3, v9, v10);
    int v16 = objc_msgSend_isEqualToString_(v14, v15, *MEMORY[0x263F08570]);

    if (v16)
    {
      if (objc_msgSend_code(v3, v17, v18) == -999) {
        int64_t v13 = 202;
      }
      else {
        int64_t v13 = 300;
      }
    }
    else
    {
      v19 = objc_msgSend_domain(v3, v17, v18);
      int v21 = objc_msgSend_isEqualToString_(v19, v20, *MEMORY[0x263F08438]);

      if (v21)
      {
        uint64_t v24 = objc_msgSend_code(v3, v22, v23);
        uint64_t v26 = objc_msgSend_codeForErrno_(CloudServicesError, v25, v24);
      }
      else
      {
        v31 = objc_msgSend_domain(v3, v22, v23);
        int v33 = objc_msgSend_isEqualToString_(v31, v32, @"EscrowServiceErrorDomain");

        if (!v33)
        {
          int64_t v13 = 100;
          goto LABEL_18;
        }
        uint64_t v26 = objc_msgSend_code(v3, v34, v35);
      }
      int64_t v13 = v26;
    }
  }
LABEL_18:

  return v13;
}

+ (int64_t)codeForErrno:(int64_t)a3
{
  if (a3 > 20)
  {
    if (a3 > 61)
    {
      if (a3 == 62) {
        return 7;
      }
      if (a3 == 93) {
        return 8;
      }
    }
    else
    {
      if (a3 == 21) {
        return 6;
      }
      if (a3 == 28) {
        return 105;
      }
    }
  }
  else if (a3 > 16)
  {
    if (a3 == 17) {
      return 3;
    }
    if (a3 == 20) {
      return 5;
    }
  }
  else
  {
    int64_t result = 4;
    if (a3 == 2 || a3 == 9) {
      return result;
    }
  }
  v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_21813EE14(v4);
  }

  return 100;
}

+ (id)errorWithCode:(int64_t)a3 format:(id)a4
{
  uint64_t v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = [v5 alloc];
  v9 = objc_msgSend_initWithFormat_arguments_(v7, v8, (uint64_t)v6, &v16);

  v11 = objc_msgSend_dictionaryWithObjectsAndKeys_(NSDictionary, v10, (uint64_t)v9, *MEMORY[0x263F08320], 0);
  int64_t v13 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v12, @"CloudServicesErrorDomain", a3, v11);

  return v13;
}

+ (id)errorWithCode:(int64_t)a3 error:(id)a4 format:(id)a5
{
  id v7 = (objc_class *)NSString;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 alloc];
  uint64_t v12 = objc_msgSend_initWithFormat_arguments_(v10, v11, (uint64_t)v8, &v19);

  v14 = objc_msgSend_dictionaryWithObjectsAndKeys_(NSDictionary, v13, (uint64_t)v12, *MEMORY[0x263F08320], v9, *MEMORY[0x263F08608], 0);

  uint64_t v16 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v15, @"CloudServicesErrorDomain", a3, v14);

  return v16;
}

+ (id)errorWithCode:(int64_t)a3 URL:(id)a4 format:(id)a5
{
  id v7 = (objc_class *)NSString;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 alloc];
  uint64_t v12 = objc_msgSend_initWithFormat_arguments_(v10, v11, (uint64_t)v8, &v19);

  v14 = objc_msgSend_dictionaryWithObjectsAndKeys_(NSDictionary, v13, (uint64_t)v12, *MEMORY[0x263F08320], v9, *MEMORY[0x263F08590], 0);

  uint64_t v16 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v15, @"CloudServicesErrorDomain", a3, v14);

  return v16;
}

+ (id)errorWithCode:(int64_t)a3 error:(id)a4 URL:(id)a5 format:(id)a6
{
  id v9 = (objc_class *)NSString;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [v9 alloc];
  v15 = objc_msgSend_initWithFormat_arguments_(v13, v14, (uint64_t)v10, &v22);

  v17 = objc_msgSend_dictionaryWithObjectsAndKeys_(NSDictionary, v16, (uint64_t)v15, *MEMORY[0x263F08320], v12, *MEMORY[0x263F08608], v11, *MEMORY[0x263F08590], 0);

  uint64_t v19 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v18, @"CloudServicesErrorDomain", a3, v17);

  return v19;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 format:(id)a5
{
  id v7 = (objc_class *)NSString;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v7 alloc];
  id v12 = objc_msgSend_initWithFormat_arguments_(v10, v11, (uint64_t)v8, &v19);

  v14 = objc_msgSend_dictionaryWithObjectsAndKeys_(NSDictionary, v13, (uint64_t)v12, *MEMORY[0x263F08320], 0);
  uint64_t v16 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v15, (uint64_t)v9, a4, v14);

  return v16;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 format:(id)a6
{
  id v9 = (objc_class *)NSString;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [v9 alloc];
  v15 = objc_msgSend_initWithFormat_arguments_(v13, v14, (uint64_t)v10, &v22);

  v17 = objc_msgSend_dictionaryWithObjectsAndKeys_(NSDictionary, v16, (uint64_t)v15, *MEMORY[0x263F08320], v11, *MEMORY[0x263F08608], 0);

  uint64_t v19 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v18, (uint64_t)v12, a4, v17);

  return v19;
}

+ (id)errorForNSError:(id)a3 path:(id)a4 format:(id)a5
{
  id v7 = (objc_class *)NSString;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 alloc];
  id v13 = objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v8, &v23);

  v15 = objc_msgSend_dictionaryWithObjectsAndKeys_(NSDictionary, v14, (uint64_t)v13, *MEMORY[0x263F08320], v10, *MEMORY[0x263F08608], v9, *MEMORY[0x263F08068], 0);

  uint64_t v16 = (void *)MEMORY[0x263F087E8];
  uint64_t v18 = objc_msgSend_codeForNSError_(CloudServicesError, v17, (uint64_t)v10);

  v20 = objc_msgSend_errorWithDomain_code_userInfo_(v16, v19, @"CloudServicesErrorDomain", v18, v15);

  return v20;
}

@end