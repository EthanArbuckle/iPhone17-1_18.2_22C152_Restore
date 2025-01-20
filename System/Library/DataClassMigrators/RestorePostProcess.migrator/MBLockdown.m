@interface MBLockdown
+ (id)buddySetupState;
+ (id)connect;
+ (id)dateOfLastBackupFromLockdownPlist;
+ (void)setDeviceName:(id)a3;
- (BOOL)connect;
- (BOOL)removeObjectWithDomain:(id)a3 andKey:(id)a4 withError:(id *)a5;
- (BOOL)setObject:(id)a3 forDomain:(id)a4 andKey:(id)a5 withError:(id *)a6;
- (MBLockdown)init;
- (id)objectForDomain:(id)a3 andKey:(id)a4;
- (void)dealloc;
- (void)disconnect;
@end

@implementation MBLockdown

+ (id)connect
{
  v2 = objc_alloc_init(MBLockdown);

  return v2;
}

- (MBLockdown)init
{
  v4.receiver = self;
  v4.super_class = (Class)MBLockdown;
  v2 = [(MBLockdown *)&v4 init];
  if (v2)
  {
    if (qword_2EB48 != -1) {
      dispatch_once(&qword_2EB48, &stru_28EB0);
    }
    if (![(MBLockdown *)v2 connect])
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  [(MBLockdown *)self disconnect];
  v3.receiver = self;
  v3.super_class = (Class)MBLockdown;
  [(MBLockdown *)&v3 dealloc];
}

- (BOOL)connect
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_15118;
  v4[3] = &unk_28ED8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)qword_2EB50, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)disconnect
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_151D4;
  block[3] = &unk_28F00;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_2EB50, block);
}

- (id)objectForDomain:(id)a3 andKey:(id)a4
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_152E4;
  v11 = sub_152F4;
  uint64_t v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_15300;
  v6[3] = &unk_28F28;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = &v7;
  dispatch_sync((dispatch_queue_t)qword_2EB50, v6);
  objc_super v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)setObject:(id)a3 forDomain:(id)a4 andKey:(id)a5 withError:(id *)a6
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_153FC;
  v8[3] = &unk_28F50;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a5;
  v8[7] = a3;
  v8[8] = &v9;
  v8[9] = a6;
  dispatch_sync((dispatch_queue_t)qword_2EB50, v8);
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (BOOL)removeObjectWithDomain:(id)a3 andKey:(id)a4 withError:(id *)a5
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_155EC;
  block[3] = &unk_28F78;
  block[4] = a3;
  void block[5] = a4;
  block[7] = &v8;
  block[8] = a5;
  block[6] = self;
  dispatch_sync((dispatch_queue_t)qword_2EB50, block);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

+ (id)dateOfLastBackupFromLockdownPlist
{
  CFPropertyListRef v2 = CFPreferencesCopyValue(@"LastCloudBackupDate", @"com.apple.mobile.ldbackup", kMBMobileUserName, kCFPreferencesAnyHost);
  if (!v2) {
    return 0;
  }
  objc_super v3 = (void *)v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 != CFNumberGetTypeID())
  {
    char v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v8 = @"LastCloudBackupDate";
      __int16 v9 = 2048;
      CFTypeID v10 = CFGetTypeID(v3);
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "Invalid type for \"%@\": %ld", buf, 0x16u);
      CFGetTypeID(v3);
      _MBLog();
    }
    CFRelease(v3);
    return 0;
  }

  return v3;
}

+ (id)buddySetupState
{
  CFPropertyListRef v2 = CFPreferencesCopyValue(@"SetupState", @"com.apple.purplebuddy", kMBMobileUserName, kCFPreferencesAnyHost);
  if (!v2) {
    return 0;
  }
  objc_super v3 = (void *)v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 != CFStringGetTypeID())
  {
    char v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v8 = @"com.apple.purplebuddy";
      __int16 v9 = 2112;
      CFStringRef v10 = @"SetupState";
      __int16 v11 = 2048;
      CFTypeID v12 = CFGetTypeID(v3);
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "Invalid type for %@/\"%@\": %ld", buf, 0x20u);
      CFGetTypeID(v3);
      _MBLog();
    }
    CFRelease(v3);
    return 0;
  }

  return v3;
}

+ (void)setDeviceName:(id)a3
{
  CFTypeID v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Updating the device name to \"%@\"", buf, 0xCu);
    _MBLog();
  }
  if (a3)
  {
    id v5 = +[MBLockdown connect];
    if (v5)
    {
      char v6 = v5;
      __int16 v11 = 0;
      unsigned int v7 = [v5 setObject:a3 forDomain:0 andKey:kLockdownDeviceNameKey withError:&v11];
      [v6 disconnect];
      CFStringRef v8 = MBGetDefaultLog();
      __int16 v9 = v8;
      if (v7)
      {
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        *(_DWORD *)buf = 138412290;
        id v13 = a3;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Updated the device name to \"%@\"", buf, 0xCu);
      }
      else
      {
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          return;
        }
        *(_DWORD *)buf = 138412290;
        id v13 = v11;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Failed to update the device name: %@", buf, 0xCu);
      }
    }
    else
    {
      CFStringRef v10 = MBGetDefaultLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Failed to connect to lockdown to update the device name", buf, 2u);
    }
    _MBLog();
  }
}

@end