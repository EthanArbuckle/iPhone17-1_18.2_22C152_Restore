@interface NSPropertyListSerialization(GKAdditions)
+ (id)_gkTypesafePropertyListWithData:()GKAdditions withClass:;
@end

@implementation NSPropertyListSerialization(GKAdditions)

+ (id)_gkTypesafePropertyListWithData:()GKAdditions withClass:
{
  if (a3)
  {
    id v8 = 0;
    uint64_t v9 = 200;
    v3 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:&v9 error:&v8];
    id v4 = v8;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      if (!os_log_GKGeneral) {
        id v5 = GKOSLoggers();
      }
      v6 = (void *)os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
        +[NSPropertyListSerialization(GKAdditions) _gkTypesafePropertyListWithData:withClass:](v6);
      }
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (void)_gkTypesafePropertyListWithData:()GKAdditions withClass:.cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = 0;
  _os_log_error_impl(&dword_1C2D22000, v1, OS_LOG_TYPE_ERROR, "unexpected class %@ encountered during property list deserialization to %@. will return a nil result", v4, 0x16u);
}

@end