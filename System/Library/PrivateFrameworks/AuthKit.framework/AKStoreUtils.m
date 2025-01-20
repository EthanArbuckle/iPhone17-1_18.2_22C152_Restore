@interface AKStoreUtils
+ (id)hash:(id)a3;
@end

@implementation AKStoreUtils

+ (id)hash:(id)a3
{
  id v3 = a3;
  v4 = (const char *)[v3 UTF8String];
  if (v4)
  {
    v5 = v4;
    CC_LONG v6 = strlen(v4);
    CC_SHA256(v5, v6, md);
    id v7 = objc_alloc_init((Class)NSMutableString);
    for (uint64_t i = 0; i != 32; ++i)
      objc_msgSend(v7, "appendFormat:", @"%02x", md[i]);
    id v9 = [v7 copy];

    id v3 = v9;
  }
  else
  {
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10018B540((uint64_t)v3, v10);
    }
  }

  return v3;
}

@end