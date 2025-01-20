@interface DANvramUtil
+ (id)sharedInstance;
- (void)_clearNVRamVariable:(id)a3;
- (void)_writeNVRamVariable:(id)a3 value:(id)a4;
- (void)clearNextBootCheckerBoardPersistent;
- (void)setNextBootCheckerBoard;
- (void)setNextBootCheckerBoardPersistent;
- (void)setNextBootRecovery;
- (void)syncASTDefaultsToNVRam;
@end

@implementation DANvramUtil

+ (id)sharedInstance
{
  if (qword_1001868D8 != -1) {
    dispatch_once(&qword_1001868D8, &stru_10014BAF0);
  }
  v2 = (void *)qword_1001868D0;

  return v2;
}

- (void)syncASTDefaultsToNVRam
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DANvramUtil: syncASTDefaultsToNVRam", buf, 2u);
  }

  uint64_t v4 = ASTDomain;
  uint64_t v5 = ASTServerKey;
  uint64_t v6 = ASTCustomServerKey;
  id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:ASTDomain];
  v8 = [v7 objectForKey:v5];
  v9 = [v7 objectForKey:v6];
  v10 = +[NSString stringWithFormat:@"%@.%@", v4, v5];
  v11 = +[NSString stringWithFormat:@"%@.%@", v4, v6];
  if (v8 && ([v8 isEqualToNumber:&off_100156A90] & 1) == 0)
  {
    v12 = [v8 description];
    [(DANvramUtil *)self _writeNVRamVariable:v10 value:v12];

    if (!v9) {
      goto LABEL_9;
    }
  }
  else
  {
    [(DANvramUtil *)self _clearNVRamVariable:v10];
    if (!v9) {
      goto LABEL_9;
    }
  }
  if (([v9 isEqualToString:&stru_1001548A0] & 1) == 0)
  {
    [(DANvramUtil *)self _writeNVRamVariable:v11 value:v9];
    goto LABEL_11;
  }
LABEL_9:
  [(DANvramUtil *)self _clearNVRamVariable:v11];
LABEL_11:
}

- (void)setNextBootRecovery
{
  [(DANvramUtil *)self clearNextBootCheckerBoardPersistent];

  [(DANvramUtil *)self _writeNVRamVariable:@"auto-boot" value:@"0"];
}

- (void)setNextBootCheckerBoard
{
}

- (void)setNextBootCheckerBoardPersistent
{
}

- (void)clearNextBootCheckerBoardPersistent
{
}

- (void)_writeNVRamVariable:(id)a3 value:(id)a4
{
  kern_return_t v9;
  NSObject *v10;
  const char *v11;
  int v12;
  __CFString *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  kern_return_t v17;

  uint64_t v5 = (__CFString *)a3;
  id v6 = a4;
  io_registry_entry_t v7 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v7)
  {
    io_object_t v8 = v7;
    v9 = IORegistryEntrySetCFProperty(v7, v5, v6);
    v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = "failed";
      v12 = 138412802;
      v13 = v5;
      if (!v9) {
        v11 = "succeeded.";
      }
      v14 = 2080;
      v15 = v11;
      v16 = 1024;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DANvramUtil: Writing %@ to nvram %s with result %x", (uint8_t *)&v12, 0x1Cu);
    }

    IOObjectRelease(v8);
  }
}

- (void)_clearNVRamVariable:(id)a3
{
  kern_return_t v6;
  NSObject *v7;
  const char *v8;
  int v9;
  id v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  kern_return_t v14;

  id v3 = a3;
  io_registry_entry_t v4 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v4)
  {
    io_object_t v5 = v4;
    id v6 = IORegistryEntrySetCFProperty(v4, @"IONVRAM-DELETE-PROPERTY", v3);
    io_registry_entry_t v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      io_object_t v8 = "failed";
      v9 = 138412802;
      v10 = v3;
      if (!v6) {
        io_object_t v8 = "succeeded.";
      }
      v11 = 2080;
      v12 = v8;
      v13 = 1024;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DANvramUtil: Deleting %@ from nvram %s with result %x", (uint8_t *)&v9, 0x1Cu);
    }

    IOObjectRelease(v5);
  }
}

@end