@interface CKSQLiteUnsetPropertySentinel
+ (id)forwardingTargetForSelector:(SEL)a3;
@end

@implementation CKSQLiteUnsetPropertySentinel

+ (id)forwardingTargetForSelector:(SEL)a3
{
  if (ck_log_initialization_predicate != -1) {
    goto LABEL_5;
  }
  while (1)
  {
    v3 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_18AF10000, v3, OS_LOG_TYPE_ERROR, "Attempted to access CKSQLiteUnsetPropertySentinel. This probably means a fetch operation did not include a needed property.", v10, 2u);
    }
    v6 = objc_msgSend_stringWithFormat_(NSString, v4, @"Attempted to access CKSQLiteUnsetPropertySentinel. This probably means a fetch operation did not include a needed property.", v5);
    objc_msgSend_UTF8String(v6, v7, v8, v9);
    _os_crash();
    __break(1u);
LABEL_5:
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
}

@end