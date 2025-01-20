@interface OSADiagnosticsReporter
+ (void)launchAppWith:(int64_t)a3 options:(id)a4 completion:(id)a5;
@end

@implementation OSADiagnosticsReporter

+ (void)launchAppWith:(int64_t)a3 options:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v12 = (id)objc_opt_new();
  v9 = objc_msgSend(v8, "files_to_attach");
  objc_msgSend(v12, "setFiles_to_attach:", v9);

  v10 = objc_msgSend(v8, "log_path");
  objc_msgSend(v12, "setLog_path:", v10);

  v11 = objc_msgSend(v8, "panic_string");

  objc_msgSend(v12, "setPanic_string:", v11);
  +[ObjcDiagnosticsReporter launchAppWith:a3 options:v12 completion:v7];
}

@end