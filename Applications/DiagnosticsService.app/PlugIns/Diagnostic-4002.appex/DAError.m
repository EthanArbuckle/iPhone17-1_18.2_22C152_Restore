@interface DAError
+ (BOOL)setError:(id *)a3 withCode:(int)a4 format:(id)a5;
@end

@implementation DAError

+ (BOOL)setError:(id *)a3 withCode:(int)a4 format:(id)a5
{
  id v7 = a5;
  if (v7) {
    id v8 = [objc_alloc((Class)NSString) initWithFormat:v7 arguments:&v16];
  }
  else {
    id v8 = 0;
  }
  v9 = +[NSMutableDictionary dictionary];
  v10 = v9;
  if (v8) {
    [v9 setObject:v8 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  v11 = +[NSError errorWithDomain:@"com.apple.FieldDiagnostics" code:a4 userInfo:v10];
  v12 = v11;
  if (a3)
  {
    if (!*a3)
    {
      *a3 = v11;
      BOOL v14 = 1;
      goto LABEL_14;
    }
    v13 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100005740((uint64_t)v12, v13);
    }
  }
  else
  {
    v13 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000056C8((uint64_t)v12, v13);
    }
  }

  BOOL v14 = 0;
LABEL_14:

  return v14;
}

@end