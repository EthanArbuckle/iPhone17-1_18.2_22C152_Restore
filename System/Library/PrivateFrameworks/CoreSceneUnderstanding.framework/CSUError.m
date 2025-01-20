@interface CSUError
+ (BOOL)CSUAssert:(BOOL)a3 logError:(id *)a4 withMessage:(id)a5;
+ (id)CSUAssert:(BOOL)a3 log:(id)a4;
+ (id)errorForDataUnavailableWithLocalizedDescription:(id)a3;
+ (id)errorForDataUnavailableWithLocalizedDescription:(id)a3 underlyingError:(id)a4;
+ (id)errorForDatabase:(id)a3;
+ (id)errorForDictionaryDeserialization:(id)a3;
+ (id)errorForEspressoErrorInfo:(id)a3 localizedDescription:(id)a4;
+ (id)errorForEspressoReturnStatus:(int)a3 localizedDescription:(id)a4;
+ (id)errorForFailedEspressoPlan:(void *)a3 localizedDescription:(id)a4;
+ (id)errorForInternalErrorWithLocalizedDescription:(id)a3;
+ (id)errorForInternalErrorWithLocalizedDescription:(id)a3 underlyingError:(id)a4;
+ (id)errorForInvalidArgument:(id)a3 named:(id)a4;
+ (id)errorForInvalidArgumentWithLocalizedDescription:(id)a3;
+ (id)errorForInvalidModelWithLocalizedDescription:(id)a3;
+ (id)errorForInvalidModelWithLocalizedDescription:(id)a3 underlyingError:(id)a4;
+ (id)errorForMemoryAllocationFailure;
+ (id)errorForMemoryAllocationFailureWithLocalizedDescription:(id)a3;
+ (id)errorForOSStatus:(int)a3 localizedDescription:(id)a4;
+ (id)errorForUnknownErrorWithLocalizedDescription:(id)a3;
+ (id)errorForUnsupportedRevision:(id)a3;
+ (id)errorFromErrors:(id)a3 And:(id)a4;
+ (id)errorWithCode:(int64_t)a3 message:(id)a4;
+ (id)errorWithCode:(int64_t)a3 message:(id)a4 underlyingError:(id)a5;
+ (void)logInternalError:(id)a3;
@end

@implementation CSUError

+ (id)errorWithCode:(int64_t)a3 message:(id)a4
{
  v4 = objc_msgSend_errorWithCode_message_underlyingError_(a1, a2, a3, (uint64_t)a4, 0);
  return v4;
}

+ (id)errorWithCode:(int64_t)a3 message:(id)a4 underlyingError:(id)a5
{
  v6 = objc_msgSend_dictionaryWithObjectsAndKeys_(NSDictionary, a2, (uint64_t)a4, (uint64_t)a4, (uint64_t)a5, *MEMORY[0x263F08320], a5, *MEMORY[0x263F08608], 0);
  v8 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v7, @"com.apple.coresceneunderstanding", a3, (uint64_t)v6);

  return v8;
}

+ (id)errorForMemoryAllocationFailure
{
  return (id)((uint64_t (*)(id, char *, void))MEMORY[0x270F9A6D0])(a1, sel_errorForMemoryAllocationFailureWithLocalizedDescription_, 0);
}

+ (id)errorForMemoryAllocationFailureWithLocalizedDescription:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v5 = v3;
  if (v3)
  {
    uint64_t v10 = *MEMORY[0x263F08320];
    v11[0] = v3;
    v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v4, (uint64_t)v11, (uint64_t)&v10, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v7, @"com.apple.coresceneunderstanding", 4, (uint64_t)v6);
  }
  else
  {
    v6 = 0;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v4, @"com.apple.coresceneunderstanding", 4, 0);
  v8 = };

  return v8;
}

+ (id)errorForInternalErrorWithLocalizedDescription:(id)a3
{
  v4 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(a1, a2, (uint64_t)a3, 0, v3);
  return v4;
}

+ (id)errorForInternalErrorWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  v5 = objc_msgSend_dictionaryWithObjectsAndKeys_(NSDictionary, a2, (uint64_t)a3, (uint64_t)a4, v4, *MEMORY[0x263F08320], a4, *MEMORY[0x263F08608], 0);
  v7 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v6, @"com.apple.coresceneunderstanding", 2, (uint64_t)v5);

  return v7;
}

+ (id)errorForInvalidArgumentWithLocalizedDescription:(id)a3
{
  uint64_t v4 = objc_msgSend_errorWithCode_message_(a1, a2, 8, (uint64_t)a3, v3);
  return v4;
}

+ (id)errorForInvalidArgument:(id)a3 named:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = NSString;
  id v9 = v6;
  objc_opt_class();
  v13 = v9;
  if (objc_opt_isKindOfClass())
  {
    v13 = objc_msgSend_stringWithFormat_(NSString, v10, @"\"%@\"", v11, v12, v9);
  }
  v14 = objc_msgSend_stringWithFormat_(v8, v10, @"argument %@ has an invalid value of %@", v11, v12, v7, v13);

  v18 = objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(a1, v15, (uint64_t)v14, v16, v17);

  return v18;
}

+ (id)errorForInvalidModelWithLocalizedDescription:(id)a3
{
  uint64_t v4 = objc_msgSend_errorForInvalidModelWithLocalizedDescription_underlyingError_(a1, a2, (uint64_t)a3, 0, v3);
  return v4;
}

+ (id)errorForInvalidModelWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v10 = *MEMORY[0x263F08320];
  v11[0] = v4;
  id v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v5, (uint64_t)v11, (uint64_t)&v10, 1);
  v8 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v7, @"com.apple.coresceneunderstanding", 9, (uint64_t)v6);

  return v8;
}

+ (id)errorForUnknownErrorWithLocalizedDescription:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v9 = *MEMORY[0x263F08320];
  v10[0] = v3;
  v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v4, (uint64_t)v10, (uint64_t)&v9, 1);
  id v7 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v6, @"com.apple.coresceneunderstanding", 5, (uint64_t)v5);

  return v7;
}

+ (id)errorForDataUnavailableWithLocalizedDescription:(id)a3
{
  id v4 = objc_msgSend_errorForDataUnavailableWithLocalizedDescription_underlyingError_(a1, a2, (uint64_t)a3, 0, v3);
  return v4;
}

+ (id)errorForDataUnavailableWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  id v4 = objc_msgSend_errorWithCode_message_underlyingError_(a1, a2, 10, (uint64_t)a3, (uint64_t)a4);
  return v4;
}

+ (id)errorForEspressoReturnStatus:(int)a3 localizedDescription:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v11 = objc_msgSend_string(MEMORY[0x263F089D8], v7, v8, v9, v10);
  objc_msgSend_appendFormat_(v11, v12, @"%d", v13, v14, v4);
  uint64_t status_string = espresso_get_status_string();
  if (status_string) {
    objc_msgSend_appendFormat_(v11, v16, @": %s", v18, v19, status_string);
  }
  if (objc_msgSend_length(v6, v16, v17, v18, v19))
  {
    objc_msgSend_stringWithFormat_(NSString, v20, @"%@ (%@)", v21, v22, v6, v11);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v23 = v11;
  }
  v24 = v23;

  v28 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_(a1, v25, (uint64_t)v24, v26, v27);

  return v28;
}

+ (id)errorForEspressoErrorInfo:(id)a3 localizedDescription:(id)a4
{
  var2 = a3.var2;
  uint64_t v5 = *(void *)&a3.var0;
  id v10 = a4;
  uint64_t v11 = NSString;
  if (v5 >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, v7, @"espresso plan phase %ul", v8, v9, v5);
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = off_2652E7D18[(int)v5];
  }
  uint64_t v13 = objc_msgSend_stringWithFormat_(v11, v7, @"%s (%@)", v8, v9, var2, v12);

  if (v10)
  {
    uint64_t v17 = objc_msgSend_stringWithFormat_(NSString, v14, @"%@ - %@", v15, v16, v10, v13);

    uint64_t v13 = (void *)v17;
  }
  uint64_t v18 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_(a1, v14, (uint64_t)v13, v15, v16);

  return v18;
}

+ (id)errorForFailedEspressoPlan:(void *)a3 localizedDescription:(id)a4
{
  id v5 = a4;
  uint64_t error_info = espresso_plan_get_error_info();
  uint64_t v8 = objc_msgSend_errorForEspressoErrorInfo_localizedDescription_(a1, v7, error_info, (uint64_t)v7, (uint64_t)v5);

  return v8;
}

+ (id)errorForOSStatus:(int)a3 localizedDescription:(id)a4
{
  id v6 = objc_msgSend_dictionaryWithObjectsAndKeys_(NSDictionary, a2, (uint64_t)a4, (uint64_t)a4, v4, *MEMORY[0x263F08320], 0);
  uint64_t v8 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v7, *MEMORY[0x263F08410], a3, (uint64_t)v6);

  return v8;
}

+ (id)errorForUnsupportedRevision:(id)a3
{
  uint64_t v4 = objc_msgSend_errorWithCode_message_(a1, a2, 13, (uint64_t)a3, v3);
  return v4;
}

+ (id)errorForDatabase:(id)a3
{
  uint64_t v4 = objc_msgSend_errorWithCode_message_(a1, a2, 14, (uint64_t)a3, v3);
  return v4;
}

+ (id)errorForDictionaryDeserialization:(id)a3
{
  uint64_t v4 = objc_msgSend_errorWithCode_message_(a1, a2, 16, (uint64_t)a3, v3);
  return v4;
}

+ (void)logInternalError:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = sub_24C69662C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v9 = objc_msgSend_code(v3, v5, v6, v7, v8);
      objc_msgSend_localizedDescription(v3, v10, v11, v12, v13);
      id v14 = objc_claimAutoreleasedReturnValue();
      uint64_t v18 = objc_msgSend_cStringUsingEncoding_(v14, v15, 1, v16, v17);
      objc_msgSend_localizedFailureReason(v3, v19, v20, v21, v22);
      id v23 = objc_claimAutoreleasedReturnValue();
      v27[0] = 67109634;
      v27[1] = v9;
      __int16 v28 = 2080;
      uint64_t v29 = v18;
      __int16 v30 = 2080;
      uint64_t v31 = objc_msgSend_cStringUsingEncoding_(v23, v24, 1, v25, v26);
      _os_log_error_impl(&dword_24C664000, v4, OS_LOG_TYPE_ERROR, "Internal Error Occurred. Code: %d; description: %s; reason: %s",
        (uint8_t *)v27,
        0x1Cu);
    }
  }
}

+ (id)CSUAssert:(BOOL)a3 log:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (a3)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = sub_24C69662C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = v5;
      uint64_t v13 = objc_msgSend_UTF8String(v8, v9, v10, v11, v12);
      sub_24C729A10(v13, v18, v7);
    }

    uint64_t v6 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v14, (uint64_t)v5, v15, v16);
  }

  return v6;
}

+ (BOOL)CSUAssert:(BOOL)a3 logError:(id *)a4 withMessage:(id)a5
{
  uint64_t v6 = objc_msgSend_CSUAssert_log_(CSUError, a2, a3, (uint64_t)a5, (uint64_t)a5);
  uint64_t v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return v7 == 0;
}

+ (id)errorFromErrors:(id)a3 And:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = v6;
  if (v5)
  {
    if (v6)
    {
      uint64_t v12 = NSString;
      uint64_t v13 = objc_msgSend_localizedDescription(v5, v7, v8, v9, v10);
      uint64_t v18 = objc_msgSend_localizedDescription(v11, v14, v15, v16, v17);
      uint64_t v22 = objc_msgSend_stringWithFormat_(v12, v19, @"%@ | %@", v20, v21, v13, v18);
      uint64_t v26 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v23, (uint64_t)v22, v24, v25);

      goto LABEL_9;
    }
    id v27 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    id v27 = v6;
LABEL_7:
    uint64_t v26 = v27;
    goto LABEL_9;
  }
  uint64_t v26 = 0;
LABEL_9:

  return v26;
}

@end