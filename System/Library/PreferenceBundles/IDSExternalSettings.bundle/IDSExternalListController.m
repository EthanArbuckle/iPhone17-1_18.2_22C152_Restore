@interface IDSExternalListController
- (id)niceBasicLogging:(id)a3;
- (id)niceBasicLoggingDefaults;
- (id)specifiers;
- (void)dumpLogs:(id)a3;
- (void)setNiceBasicLogging:(id)a3 specifier:(id)a4;
- (void)setRegistrationLoggingEnabled:(id)a3 forSpecifier:(id)a4;
@end

@implementation IDSExternalListController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id result = *(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!result)
  {
    id result = [(IDSExternalListController *)self loadSpecifiersFromPlistName:@"IDSExternalSettings" target:self];
    *(void *)&self->PSListController_opaque[v3] = result;
  }
  return result;
}

- (void)dumpLogs:(id)a3
{
  +[TULogging sendDirectoryToCrashReporter:@"/var/mobile/Library/Logs/Phone" error:0];

  _DLCCollectLogs(@"IDS", @"IDS Log Dump", 2, 7167);
}

- (id)niceBasicLoggingDefaults
{
  id result = (id)qword_C268;
  if (!qword_C268)
  {
    id v3 = +[NSMutableDictionary dictionary];
    objc_msgSend(v3, "setObject:forKey:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"IDSLogging", @"MadridEventLogging", 0), @"com.apple.logging");
    qword_C268 = +[NSDictionary dictionaryWithDictionary:v3];
    id v4 = (id)qword_C268;
    return (id)qword_C268;
  }
  return result;
}

- (id)niceBasicLogging:(id)a3
{
  id v3 = [(IDSExternalListController *)self niceBasicLoggingDefaults];
  if ([v3 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v21;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v21 != v6) {
            objc_enumerationMutation(v3);
          }
          CFStringRef v8 = *(const __CFString **)(*((void *)&v20 + 1) + 8 * i);
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v9 = objc_msgSend(v3, "objectForKey:", v8, 0);
          id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v17;
            while (2)
            {
              for (j = 0; j != v11; j = (char *)j + 1)
              {
                if (*(void *)v17 != v12) {
                  objc_enumerationMutation(v9);
                }
                if (!CFPreferencesGetAppBooleanValue(*(CFStringRef *)(*((void *)&v16 + 1) + 8 * (void)j), v8, 0))
                {
                  uint64_t v14 = 0;
                  return +[NSNumber numberWithBool:v14];
                }
              }
              id v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v5);
    }
    uint64_t v14 = 1;
    return +[NSNumber numberWithBool:v14];
  }
  else
  {
    return +[NSNumber numberWithBool:0];
  }
}

- (void)setNiceBasicLogging:(id)a3 specifier:(id)a4
{
  int v5 = [a3 BOOLValue];
  sub_4F94(v5, [(IDSExternalListController *)self niceBasicLoggingDefaults]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kMarcoSyncLoggingPrefs", 0, 0, 1u);
  int v7 = sub_5A90();
  if (!v5)
  {
    unsigned int v8 = -1;
    goto LABEL_5;
  }
  if (v7 == -1)
  {
    unsigned int v8 = 0;
LABEL_5:
    sub_5C44(v8);
  }
  sub_56F8(v5);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_694C;
  block[3] = &unk_8318;
  char v11 = v5;
  dispatch_async(global_queue, block);
  sub_533C(v5 - 1);
  sub_6094();
  sub_60AC();
  sub_61E8(v5);
}

- (void)setRegistrationLoggingEnabled:(id)a3 forSpecifier:(id)a4
{
  int v5 = [a3 BOOLValue];
  sub_533C(v5 - 1);
  sub_56F8(v5);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"PCLoggingSettingsDidChangeNotification", 0, 0, 1u);

  [(IDSExternalListController *)self reloadSpecifiers];
}

@end