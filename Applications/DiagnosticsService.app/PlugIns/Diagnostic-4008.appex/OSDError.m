@interface OSDError
+ (BOOL)setError:(id *)a3 withDomain:(id)a4 withCode:(int)a5;
+ (BOOL)setError:(id *)a3 withDomain:(id)a4 withCode:(int)a5 format:(id)a6;
@end

@implementation OSDError

+ (BOOL)setError:(id *)a3 withDomain:(id)a4 withCode:(int)a5
{
  return [a1 setError:a3 withDomain:a4 withCode:*(void *)&a5 format:0];
}

+ (BOOL)setError:(id *)a3 withDomain:(id)a4 withCode:(int)a5 format:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if (v10) {
    id v11 = [objc_alloc((Class)NSString) initWithFormat:v10 arguments:&v19];
  }
  else {
    id v11 = 0;
  }
  v12 = +[NSMutableDictionary dictionary];
  v13 = v12;
  if (v11) {
    [v12 setObject:v11 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  v14 = +[NSError errorWithDomain:v9 code:a5 userInfo:v13];
  v15 = v14;
  if (a3)
  {
    if (!*a3)
    {
      *a3 = v14;
      BOOL v17 = 1;
      goto LABEL_14;
    }
    v16 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100005A0C((uint64_t)v15, v16);
    }
  }
  else
  {
    v16 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100005994((uint64_t)v15, v16);
    }
  }

  BOOL v17 = 0;
LABEL_14:

  return v17;
}

@end