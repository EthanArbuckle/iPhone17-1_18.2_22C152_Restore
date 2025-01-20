@interface NSXPCConnection(CRKAdditions)
+ (id)crk_applicationInfoServiceConnection;
+ (id)crk_booksServiceConnection;
+ (id)crk_internetDateServiceConnection;
+ (id)crk_screenshotServiceConnection;
+ (id)crk_screenshotServiceConnectionWithInterface:()CRKAdditions;
+ (id)crk_studentDaemonConnection;
+ (id)crk_studentDaemonNonCatalystConnection;
+ (uint64_t)crk_studentDaemonConnectionOptions;
@end

@implementation NSXPCConnection(CRKAdditions)

+ (id)crk_studentDaemonConnection
{
  v0 = objc_msgSend(objc_alloc(MEMORY[0x263F08D68]), "initWithMachServiceName:options:", @"com.apple.studentd", objc_msgSend((id)objc_opt_class(), "crk_studentDaemonConnectionOptions"));

  return v0;
}

+ (id)crk_studentDaemonNonCatalystConnection
{
  v1 = objc_msgSend(a1, "crk_studentDaemonConnection");
  v2 = CRKStudentDaemonXPCInterface();
  [v1 setRemoteObjectInterface:v2];

  return v1;
}

+ (id)crk_screenshotServiceConnection
{
  v2 = CRKScreenshotServiceXPCInterface();
  v3 = objc_msgSend(a1, "crk_screenshotServiceConnectionWithInterface:", v2);

  return v3;
}

+ (id)crk_applicationInfoServiceConnection
{
  v2 = CRKApplicationInfoServiceXPCInterface();
  v3 = objc_msgSend(a1, "crk_screenshotServiceConnectionWithInterface:", v2);

  return v3;
}

+ (id)crk_internetDateServiceConnection
{
  v2 = CRKInternetDateFetchingXPCInterface();
  v3 = objc_msgSend(a1, "crk_screenshotServiceConnectionWithInterface:", v2);

  return v3;
}

+ (id)crk_booksServiceConnection
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.ClassroomKit.BooksService"];
  v1 = CRKBooksServiceXPCInterface();
  [v0 setRemoteObjectInterface:v1];

  return v0;
}

+ (uint64_t)crk_studentDaemonConnectionOptions
{
  return 4096;
}

+ (id)crk_screenshotServiceConnectionWithInterface:()CRKAdditions
{
  v3 = (objc_class *)MEMORY[0x263F08D68];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithServiceName:@"com.apple.ClassroomKit.ScreenshotService"];
  [v5 setRemoteObjectInterface:v4];

  return v5;
}

@end