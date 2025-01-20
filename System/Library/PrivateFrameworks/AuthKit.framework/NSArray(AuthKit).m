@interface NSArray(AuthKit)
+ (id)ak_arrayWithJSONResponseData:()AuthKit;
@end

@implementation NSArray(AuthKit)

+ (id)ak_arrayWithJSONResponseData:()AuthKit
{
  if (a3)
  {
    id v8 = 0;
    v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v8];
    v4 = v8;
    if (v4)
    {
      v5 = _AKLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[NSArray(AuthKit) ak_arrayWithJSONResponseData:]((uint64_t)v4, v5);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v3;
LABEL_13:

        goto LABEL_14;
      }
      v5 = _AKLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[NSArray(AuthKit) ak_arrayWithJSONResponseData:](v5);
      }
    }

    id v6 = 0;
    goto LABEL_13;
  }
  v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[NSArray(AuthKit) ak_arrayWithJSONResponseData:](v4);
  }
  id v6 = 0;
LABEL_14:

  return v6;
}

+ (void)ak_arrayWithJSONResponseData:()AuthKit .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Error: No response data!", v1, 2u);
}

+ (void)ak_arrayWithJSONResponseData:()AuthKit .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "The body data was not in the expected (dictionary) format!", v1, 2u);
}

+ (void)ak_arrayWithJSONResponseData:()AuthKit .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "There was an error parsing body data! %@", (uint8_t *)&v2, 0xCu);
}

@end