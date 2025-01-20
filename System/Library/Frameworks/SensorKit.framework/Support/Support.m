void start()
{
  void *v0;

  sub_100002FCC();
  dispatch_main();
}

void sub_100002FCC()
{
  v0 = [+[NSProcessInfo processInfo] arguments];
  if ([(NSArray *)v0 count] <= 1)
  {
    v5 = __stderrp;
    v6 = "Not enough arguments.\n";
    size_t v7 = 22;
    goto LABEL_12;
  }
  v1 = +[NSUserDefaults standardUserDefaults];
  if ([(NSUserDefaults *)v1 stringForKey:@"help"]
    || [(NSUserDefaults *)v1 stringForKey:@"h"])
  {
    sub_100003340();
  }
  if (!objc_msgSend(-[NSArray objectAtIndexedSubscript:](v0, "objectAtIndexedSubscript:", 1), "isEqualToString:", @"diagnostics"))
  {
    v5 = __stderrp;
    v6 = "Unsupported command.\n";
    size_t v7 = 21;
    goto LABEL_12;
  }
  v2 = [(NSUserDefaults *)v1 stringForKey:@"output"];
  if (!v2)
  {
    v5 = __stderrp;
    v6 = "Missing output directory\n";
    size_t v7 = 25;
LABEL_12:
    fwrite(v6, v7, 1uLL, v5);
    sub_100003340();
  }
  v3 = +[NSURL fileURLWithPath:v2];
  uint64_t v16 = 0;
  if (![+[NSFileManager defaultManager] createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v16])
  {
    NSLog(@"Failed to create directory %@ because %@", v3, v16);
    exit(73);
  }
  id v4 = objc_alloc_init((Class)SRDebugInfoClient);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  int v15 = 5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000033B8;
  v13[3] = &unk_1000040A0;
  v13[4] = v14;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000033F0;
  v12[3] = &unk_1000040C8;
  v12[4] = v3;
  v12[5] = v13;
  [v4 datastoreListingWithReply:v12];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003530;
  v11[3] = &unk_1000040F0;
  v11[4] = v3;
  v11[5] = v13;
  [v4 dumpClientsWithReply:v11];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000035BC;
  v10[3] = &unk_1000040F0;
  v10[4] = v3;
  v10[5] = v13;
  [v4 dumpStateCacheWithReply:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003648;
  v9[3] = &unk_1000040F0;
  v9[4] = v3;
  v9[5] = v13;
  [v4 dumpConfigurationsWithReply:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000036D4;
  v8[3] = &unk_1000040F0;
  v8[4] = v3;
  v8[5] = v13;
  [v4 dumpDefaultsWithReply:v8];
  _Block_object_dispose(v14, 8);
}

void sub_100003328(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 104), 8);
  _Unwind_Resume(a1);
}

void sub_100003340()
{
}

uint64_t sub_1000033B8(uint64_t result)
{
  if (atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(result + 32) + 8) + 24), 0xFFFFFFFF) == 1) {
    exit(0);
  }
  return result;
}

uint64_t sub_1000033F0(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    NSLog(@"Failed to list datastore because %@", a3);
LABEL_3:
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  if (!a2)
  {
    NSLog(@"No datastore listing available");
    goto LABEL_3;
  }
  uint64_t v8 = 0;
  size_t v7 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", [a2 lastPathComponent], 0, *(void *)(a1 + 32));
  if ([+[NSFileManager defaultManager] fileExistsAtPath:[(NSURL *)v7 path]])
  {
    [+[NSFileManager defaultManager] removeItemAtURL:v7 error:0];
  }
  if (![+[NSFileManager defaultManager]; {
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_100003530(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3) {
    NSLog(@"Failed to list clients because %@", a3);
  }
  else {
    objc_msgSend(a2, "writeToURL:atomically:", +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", @"clients.plist", 0, *(void *)(a1 + 32)), 1);
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

uint64_t sub_1000035BC(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3) {
    NSLog(@"Failed to list stateCache because %@", a3);
  }
  else {
    objc_msgSend(a2, "writeToURL:atomically:", +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", @"stateCache.plist", 0, *(void *)(a1 + 32)), 1);
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

uint64_t sub_100003648(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3) {
    NSLog(@"Failed to list configurations because %@", a3);
  }
  else {
    objc_msgSend(a2, "writeToURL:atomically:", +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", @"configurations.plist", 0, *(void *)(a1 + 32)), 1);
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

uint64_t sub_1000036D4(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3) {
    NSLog(@"Failed to list defaults because %@", a3);
  }
  else {
    objc_msgSend(a2, "writeToURL:atomically:", +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", @"defaults.plist", 0, *(void *)(a1 + 32)), 1);
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_main(void)
{
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return [a1 arguments];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}