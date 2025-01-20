CFStringRef sub_3EA4()
{
  CFPropertyListRef v0;

  CFPreferencesAppSynchronize(@"com.apple.ids");
  v0 = CFPreferencesCopyAppValue(@"custom-ids-bag-url", @"com.apple.ids");
  if (!v0) {
    return @"none";
  }
  CFRelease(v0);
  return @"Custom";
}

id sub_3EFC(void *a1)
{
  IDSLog();
  if (objc_msgSend(a1, "isEqualToString:", @"Custom", a1))
  {
    uint64_t v2 = IMUserNotificationTitleKey;
    uint64_t v3 = IMUserNotificationMessageKey;
    v4 = +[NSArray arrayWithObject:&stru_8438];
    uint64_t v5 = IMUserNotificationTextFieldValuesKey;
    v6 = +[NSArray arrayWithObject:&stru_8438];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_40FC;
    v9[3] = &unk_8298;
    return -[IMUserNotificationCenter addUserNotification:listener:completionHandler:](+[IMUserNotificationCenter sharedInstance](IMUserNotificationCenter, "sharedInstance"), "addUserNotification:listener:completionHandler:", +[IMUserNotification userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:](IMUserNotification, "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:", @"bagfetchurl", 3, 0, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", @"Bag fetch URL", v2, @"Please type in URL", v3, v4, v5, v6, IMUserNotificationTextFieldTitlesKey,
                 @"OK",
                 IMUserNotificationDefaultButtonTitleKey,
                 @"Cancel",
                 IMUserNotificationAlternateButtonTitleKey,
                 0,
                 0),
               0.0),
             0,
             v9);
  }
  else
  {
    CFPreferencesSetAppValue(@"custom-ids-bag-url", 0, @"com.apple.ids");
    return (id)CFPreferencesAppSynchronize(@"com.apple.ids");
  }
}

uint64_t sub_40FC(uint64_t a1, void *a2)
{
  uint64_t result = (uint64_t)[a2 response];
  if (!result)
  {
    id v4 = [*(id *)(a1 + 32) responseInformation];
    id v5 = [v4 objectForKey:IMUserNotificationTextFieldValuesKey];
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      uint64_t result = (uint64_t)[v5 length];
      if (result)
      {
        CFPreferencesSetAppValue(@"custom-ids-bag-url", v5, @"com.apple.ids");
        return CFPreferencesAppSynchronize(@"com.apple.ids");
      }
    }
  }
  return result;
}

CFStringRef sub_41A8()
{
  CFPreferencesAppSynchronize(@"com.apple.ids");
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"custom-sps-bag-url", @"com.apple.ids");
  if (!v0) {
    return @"none";
  }
  CFRelease(v0);
  return @"Custom";
}

id sub_4200(void *a1)
{
  IDSLog();
  if (objc_msgSend(a1, "isEqualToString:", @"Custom", a1))
  {
    uint64_t v2 = IMUserNotificationTitleKey;
    uint64_t v3 = IMUserNotificationMessageKey;
    id v4 = +[NSArray arrayWithObject:&stru_8438];
    uint64_t v5 = IMUserNotificationTextFieldValuesKey;
    v6 = +[NSArray arrayWithObject:&stru_8438];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_4400;
    v9[3] = &unk_8298;
    return -[IMUserNotificationCenter addUserNotification:listener:completionHandler:](+[IMUserNotificationCenter sharedInstance](IMUserNotificationCenter, "sharedInstance"), "addUserNotification:listener:completionHandler:", +[IMUserNotification userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:](IMUserNotification, "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:", @"bagfetchurl", 3, 0, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", @"Bag fetch URL", v2, @"Please type in URL", v3, v4, v5, v6, IMUserNotificationTextFieldTitlesKey,
                 @"OK",
                 IMUserNotificationDefaultButtonTitleKey,
                 @"Cancel",
                 IMUserNotificationAlternateButtonTitleKey,
                 0,
                 0),
               0.0),
             0,
             v9);
  }
  else
  {
    CFPreferencesSetAppValue(@"custom-sps-bag-url", 0, @"com.apple.ids");
    return (id)CFPreferencesAppSynchronize(@"com.apple.ids");
  }
}

uint64_t sub_4400(uint64_t a1, void *a2)
{
  uint64_t result = (uint64_t)[a2 response];
  if (!result)
  {
    id v4 = [*(id *)(a1 + 32) responseInformation];
    id v5 = [v4 objectForKey:IMUserNotificationTextFieldValuesKey];
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      uint64_t result = (uint64_t)[v5 length];
      if (result)
      {
        CFPreferencesSetAppValue(@"custom-sps-bag-url", v5, @"com.apple.ids");
        return CFPreferencesAppSynchronize(@"com.apple.ids");
      }
    }
  }
  return result;
}

CFStringRef sub_44AC()
{
  CFPreferencesAppSynchronize(@"com.apple.ids");
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"testOptionsHeader", @"com.apple.ids");
  if (!v0) {
    return @"none";
  }
  CFRelease(v0);
  return @"Custom";
}

id sub_4504(void *a1)
{
  if ([a1 isEqualToString:@"Custom"])
  {
    uint64_t v1 = IMUserNotificationTitleKey;
    uint64_t v2 = IMUserNotificationMessageKey;
    uint64_t v3 = +[NSArray arrayWithObject:&stru_8438];
    uint64_t v4 = IMUserNotificationTextFieldValuesKey;
    id v5 = +[NSArray arrayWithObject:&stru_8438];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_46DC;
    v7[3] = &unk_8298;
    return -[IMUserNotificationCenter addUserNotification:listener:completionHandler:](+[IMUserNotificationCenter sharedInstance](IMUserNotificationCenter, "sharedInstance"), "addUserNotification:listener:completionHandler:", +[IMUserNotification userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:](IMUserNotification, "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:", @"testoptionsheader", 3, 0, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", @"X-Apple-Test-Options:", v1, &stru_8438, v2, v3, v4, v5, IMUserNotificationTextFieldTitlesKey,
                 @"OK",
                 IMUserNotificationDefaultButtonTitleKey,
                 @"Cancel",
                 IMUserNotificationAlternateButtonTitleKey,
                 0,
                 0),
               0.0),
             0,
             v7);
  }
  else
  {
    CFPreferencesSetAppValue(@"testOptionsHeader", 0, @"com.apple.ids");
    return (id)CFPreferencesAppSynchronize(@"com.apple.ids");
  }
}

uint64_t sub_46DC(uint64_t a1, void *a2)
{
  uint64_t result = (uint64_t)[a2 response];
  if (!result)
  {
    id v4 = [*(id *)(a1 + 32) responseInformation];
    id v5 = [v4 objectForKey:IMUserNotificationTextFieldValuesKey];
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      uint64_t result = (uint64_t)[v5 length];
      if (result)
      {
        CFPreferencesSetAppValue(@"testOptionsHeader", v5, @"com.apple.ids");
        return CFPreferencesAppSynchronize(@"com.apple.ids");
      }
    }
  }
  return result;
}

CFStringRef sub_4788()
{
  CFPreferencesAppSynchronize(@"com.apple.ids");
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"x-test-opts", @"com.apple.ids");
  if (!v0) {
    return @"none";
  }
  CFRelease(v0);
  return @"Custom";
}

id sub_47E0(void *a1)
{
  if ([a1 isEqualToString:@"Custom"])
  {
    uint64_t v1 = IMUserNotificationTitleKey;
    uint64_t v2 = IMUserNotificationMessageKey;
    uint64_t v3 = +[NSArray arrayWithObject:&stru_8438];
    uint64_t v4 = IMUserNotificationTextFieldValuesKey;
    id v5 = +[NSArray arrayWithObject:&stru_8438];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_49B8;
    v7[3] = &unk_8298;
    return -[IMUserNotificationCenter addUserNotification:listener:completionHandler:](+[IMUserNotificationCenter sharedInstance](IMUserNotificationCenter, "sharedInstance"), "addUserNotification:listener:completionHandler:", +[IMUserNotification userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:](IMUserNotification, "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:", @"x-test-opts", 3, 0, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", @"x-test-opts:", v1, &stru_8438, v2, v3, v4, v5, IMUserNotificationTextFieldTitlesKey,
                 @"OK",
                 IMUserNotificationDefaultButtonTitleKey,
                 @"Cancel",
                 IMUserNotificationAlternateButtonTitleKey,
                 0,
                 0),
               0.0),
             0,
             v7);
  }
  else
  {
    CFPreferencesSetAppValue(@"x-test-opts", 0, @"com.apple.ids");
    return (id)CFPreferencesAppSynchronize(@"com.apple.ids");
  }
}

uint64_t sub_49B8(uint64_t a1, void *a2)
{
  uint64_t result = (uint64_t)[a2 response];
  if (!result)
  {
    id v4 = [*(id *)(a1 + 32) responseInformation];
    id v5 = [v4 objectForKey:IMUserNotificationTextFieldValuesKey];
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      uint64_t result = (uint64_t)[v5 length];
      if (result)
      {
        CFPreferencesSetAppValue(@"x-test-opts", v5, @"com.apple.ids");
        return CFPreferencesAppSynchronize(@"com.apple.ids");
      }
    }
  }
  return result;
}

CFStringRef sub_4A64()
{
  CFPreferencesAppSynchronize(@"com.apple.ids");
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"env", @"com.apple.ids");
  if (!v0) {
    return @"prod";
  }

  return (const __CFString *)v0;
}

uint64_t sub_4AC8(void *a1)
{
  IDSLog();
  if (objc_msgSend(a1, "length", a1)) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = 0;
  }
  CFPreferencesSetAppValue(@"env", v2, @"com.apple.ids");

  return CFPreferencesAppSynchronize(@"com.apple.ids");
}

CFStringRef sub_4B44()
{
  CFPreferencesAppSynchronize(@"com.apple.ids");
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"sps-env", @"com.apple.ids");
  if (!v0) {
    return @"prod";
  }

  return (const __CFString *)v0;
}

uint64_t sub_4BA8(void *a1)
{
  IDSLog();
  if (objc_msgSend(a1, "length", a1)) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = 0;
  }
  CFPreferencesSetAppValue(@"sps-env", v2, @"com.apple.ids");

  return CFPreferencesAppSynchronize(@"com.apple.ids");
}

void sub_4C24()
{
  IDSLog();
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionarySetValue(Mutable, kSecAttrService, @"com.apple.iChat.VeniceRegistrationAgent");
  OSStatus v1 = SecItemDelete(Mutable);
  if (v1) {
    NSLog(@"Unable to remove V0 keychain data: %ld", v1);
  }
  CFDictionarySetValue(Mutable, kSecAttrService, @"com.apple.facetime");
  OSStatus v2 = SecItemDelete(Mutable);
  if (v2) {
    NSLog(@"Unable to remove V1 keychain data: %ld", v2);
  }
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

uint64_t sub_4D34()
{
  IDSLog();
  CFPropertyListRef v0 = (const char *)objc_msgSend(@"killall -9 identityservicesd", "UTF8String", @"killall -9 identityservicesd");

  return system(v0);
}

uint64_t sub_4D90()
{
  IDSLog();
  CFPropertyListRef v0 = (const char *)objc_msgSend(@"killall -9 identityservicesd imagent", "UTF8String", @"killall -9 identityservicesd imagent");

  return system(v0);
}

uint64_t sub_4DEC()
{
  IDSLog();
  CFPropertyListRef v0 = (const char *)objc_msgSend(@"killall -USR2 imagent", "UTF8String", @"killall -USR2 imagent");

  return system(v0);
}

uint64_t sub_4E48()
{
  IDSLog();
  CFPropertyListRef v0 = (const char *)objc_msgSend(@"killall -USR2 identityservicesd", "UTF8String", @"killall -USR2 identityservicesd");

  return system(v0);
}

uint64_t sub_4EA4()
{
  IDSLog();
  CFPropertyListRef v0 = (const char *)objc_msgSend(@"killall -USR1 identityservicesd", "UTF8String", @"killall -USR1 identityservicesd");

  return system(v0);
}

uint64_t sub_4F00()
{
  IDSLog();
  CFPropertyListRef v0 = (const char *)objc_msgSend(@"killall -9 mediaserverd Contacts imagent imavagent identityservicesd SpringBoard MobilePhone MobileSMS", "UTF8String", @"killall -9 mediaserverd Contacts imagent imavagent identityservicesd SpringBoard MobilePhone MobileSMS");

  return system(v0);
}

uint64_t sub_4F5C()
{
  CFPropertyListRef v0 = popen("/usr/bin/killall -9 identityservicesd sharingd lsuseractivityd callservicesd FaceTime SpringBoard blued BTServer cloudpaird wirelessproxd", "r");

  return pclose(v0);
}

id sub_4F94(int a1, void *a2)
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [a2 allKeys];
  id result = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (result)
  {
    id v5 = result;
    uint64_t v6 = *(void *)v21;
    if (a1) {
      CFBooleanRef v7 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v7 = 0;
    }
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v9 = *(const __CFString **)(*((void *)&v20 + 1) + 8 * (void)v8);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v10 = [a2 objectForKey:v9];
        id v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            v14 = 0;
            do
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              CFPreferencesSetAppValue(*(CFStringRef *)(*((void *)&v16 + 1) + 8 * (void)v14), v7, v9);
              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v12);
        }
        CFPreferencesAppSynchronize(v9);
        v8 = (char *)v8 + 1;
      }
      while (v8 != v5);
      id result = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
      id v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t sub_5140()
{
  IDSLog();
  CFPropertyListRef v0 = (const char *)objc_msgSend(@"rm -rf /var/mobile/Library/Preferences/com.apple.ids.service.com.apple.* /var/mobile/Library/Preferences/com.apple.imservice.*", "UTF8String", @"rm -rf /var/mobile/Library/Preferences/com.apple.ids.service.com.apple.* /var/mobile/Library/Preferences/com.apple.imservice.*");

  return system(v0);
}

uint64_t sub_519C()
{
  CFPropertyListRef v0 = (void *)sub_6324();
  if (![v0 count]) {
    return 0xFFFFFFFFLL;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t result = (uint64_t)[v0 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (result)
  {
    id v2 = (id)result;
    uint64_t v3 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v16 != v3) {
          objc_enumerationMutation(v0);
        }
        CFStringRef v5 = *(const __CFString **)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = 0u;
        long long v12 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        id v6 = objc_msgSend(v0, "objectForKey:", v5, 0);
        id v7 = [v6 countByEnumeratingWithState:&v11 objects:v19 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v12;
LABEL_9:
          uint64_t v10 = 0;
          while (1)
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            if (!CFPreferencesGetAppBooleanValue(*(CFStringRef *)(*((void *)&v11 + 1) + 8 * v10), v5, 0)) {
              return 0xFFFFFFFFLL;
            }
            if (v8 == (id)++v10)
            {
              id v8 = [v6 countByEnumeratingWithState:&v11 objects:v19 count:16];
              if (v8) {
                goto LABEL_9;
              }
              break;
            }
          }
        }
      }
      id v2 = [v0 countByEnumeratingWithState:&v15 objects:v20 count:16];
      uint64_t result = 0;
      if (v2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_533C(int a1)
{
  id v2 = (void *)sub_6324();
  sub_4F94(a1 >= 0, v2);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kMarcoSyncLoggingPrefs", 0, 0, 1u);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v4, @"PCLoggingSettingsDidChangeNotification", 0, 0, 1u);

  return system("killall -USR2 imagent");
}

uint64_t sub_53C0(const __CFString *a1)
{
  if (a1) {
    CFStringRef v1 = a1;
  }
  else {
    CFStringRef v1 = @"CNFDumpRegistrationLogs";
  }
  return _MarcoAction(0, v1, 4);
}

uint64_t sub_53DC()
{
  uint64_t result = qword_C230;
  if (!qword_C230)
  {
    id v1 = +[NSMutableDictionary dictionary];
    objc_msgSend(v1, "setObject:forKey:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"Log", @"PCWriteLogs", @"APSFullNetworkLogging", 0), @"com.apple.persistentconnection");
    qword_C230 = +[NSDictionary dictionaryWithDictionary:v1];
    id v2 = (id)qword_C230;
    return qword_C230;
  }
  return result;
}

id sub_5478()
{
  CFPropertyListRef v0 = (void *)sub_53DC();
  id result = [v0 count];
  if (result)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v20 = [v0 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v20)
    {
      uint64_t v2 = *(void *)v28;
      uint64_t v18 = *(void *)v28;
      long long v19 = v0;
      do
      {
        uint64_t v3 = 0;
        do
        {
          if (*(void *)v28 != v2) {
            objc_enumerationMutation(v0);
          }
          uint64_t v21 = v3;
          CFStringRef v4 = *(const __CFString **)(*((void *)&v27 + 1) + 8 * v3);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id obj = [v0 objectForKey:v4];
          id v5 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v5)
          {
            id v6 = v5;
            uint64_t v7 = *(void *)v24;
            while (2)
            {
              for (i = 0; i != v6; i = (char *)i + 1)
              {
                if (*(void *)v24 != v7) {
                  objc_enumerationMutation(obj);
                }
                CFStringRef v9 = *(const __CFString **)(*((void *)&v23 + 1) + 8 * i);
                sub_63A4();
                CFBooleanRef v10 = (const __CFBoolean *)_CFPreferencesCopyValueWithContainer();
                if (v10)
                {
                  CFBooleanRef v11 = v10;
                  CFTypeID v12 = CFGetTypeID(v10);
                  if (v12 == CFBooleanGetTypeID()) {
                    int Value = CFBooleanGetValue(v11);
                  }
                  else {
                    int Value = 0;
                  }
                  CFRelease(v11);
                }
                else
                {
                  int Value = 0;
                }
                CFBooleanRef v14 = (const __CFBoolean *)CFPreferencesCopyValue(v9, v4, @"mobile", kCFPreferencesAnyHost);
                if (v14)
                {
                  CFBooleanRef v15 = v14;
                  CFTypeID v16 = CFGetTypeID(v14);
                  if (v16 == CFBooleanGetTypeID())
                  {
                    if (Value) {
                      int Value = 1;
                    }
                    else {
                      int Value = CFBooleanGetValue(v15) != 0;
                    }
                  }
                  CFRelease(v15);
                }
                if (!Value) {
                  return 0;
                }
              }
              id v6 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v6) {
                continue;
              }
              break;
            }
          }
          uint64_t v3 = v21 + 1;
          uint64_t v2 = v18;
          CFPropertyListRef v0 = v19;
        }
        while ((id)(v21 + 1) != v20);
        id v17 = [v19 countByEnumeratingWithState:&v27 objects:v32 count:16];
        id result = &dword_0 + 1;
        id v20 = v17;
      }
      while (v17);
    }
    else
    {
      return &dword_0 + 1;
    }
  }
  return result;
}

void sub_56F8(int a1)
{
  id v2 = [(NSArray *)NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1) lastObject];
  uint64_t v3 = +[NSFileManager defaultManager];
  if (a1)
  {
    if ([(NSFileManager *)v3 fileExistsAtPath:@"/usr/sbin/tcpdump"])
    {
      -[NSData writeToFile:options:error:](+[NSData data](NSData, "data"), "writeToFile:options:error:", [v2 stringByAppendingPathComponent:@"Caches/com.apple.aps.tcpdump.en0.plist"], 0, 0);
      if (-[FTDeviceSupport supportsCellularData](+[FTDeviceSupport sharedInstance](FTDeviceSupport, "sharedInstance"), "supportsCellularData"))-[NSData writeToFile:options:error:](+[NSData data](NSData, "data"), "writeToFile:options:error:", [v2 stringByAppendingPathComponent:@"Caches/com.apple.aps.tcpdump.pdp_ip0.plist"], 0, 0); {
    }
      }
  }
  else
  {
    -[NSFileManager removeItemAtPath:error:](v3, "removeItemAtPath:error:", [v2 stringByAppendingPathComponent:@"Preferences/com.apple.aps.tcpdump.en0.plist"], 0);
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", [v2 stringByAppendingPathComponent:@"Preferences/com.apple.aps.tcpdump.pdp_ip0.plist"], 0);
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", [v2 stringByAppendingPathComponent:@"Caches/com.apple.aps.tcpdump.en0.plist"], 0);
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", [v2 stringByAppendingPathComponent:@"Caches/com.apple.aps.tcpdump.pdp_ip0.plist"], 0);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(id)sub_53DC() allKeys];
  id v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v23;
    if (a1) {
      CFBooleanRef v4 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v4 = 0;
    }
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = v5;
        CFStringRef v6 = *(const __CFString **)(*((void *)&v22 + 1) + 8 * v5);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v7 = [(id)sub_53DC() objectForKey:v6];
        id v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v19;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(v7);
              }
              CFStringRef v12 = *(const __CFString **)(*((void *)&v18 + 1) + 8 * i);
              sub_63A4();
              _CFPreferencesSetValueWithContainer();
              CFPreferencesSetValue(v12, v4, v6, @"mobile", kCFPreferencesAnyHost);
            }
            id v9 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v9);
        }
        sub_63A4();
        _CFPreferencesSynchronizeWithContainer();
        CFPreferencesAppSynchronize(v6);
        uint64_t v5 = v17 + 1;
      }
      while ((id)(v17 + 1) != v16);
      id v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v16);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"PCLoggingSettingsDidChangeNotification", 0, 0, 1u);
}

CFIndex sub_5A90()
{
  CFPropertyListRef v0 = (void *)sub_6424();
  if (![v0 count]) {
    return 0xFFFFFFFFLL;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v1 = [v0 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = *(void *)v17;
    while (2)
    {
      CFBooleanRef v4 = 0;
      do
      {
        if (*(void *)v17 != v3) {
          objc_enumerationMutation(v0);
        }
        CFStringRef v5 = *(const __CFString **)(*((void *)&v16 + 1) + 8 * (void)v4);
        long long v12 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v6 = objc_msgSend(v0, "objectForKey:", v5, 0);
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v13;
LABEL_9:
          uint64_t v10 = 0;
          while (1)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            if (!CFPreferencesGetAppBooleanValue(*(CFStringRef *)(*((void *)&v12 + 1) + 8 * v10), v5, 0)) {
              return 0xFFFFFFFFLL;
            }
            if (v8 == (id)++v10)
            {
              id v8 = [v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
              if (v8) {
                goto LABEL_9;
              }
              break;
            }
          }
        }
        CFBooleanRef v4 = (char *)v4 + 1;
      }
      while (v4 != v2);
      id v2 = [v0 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
  return CFPreferencesGetAppIntegerValue(@"MadridLoggingLevel", @"com.apple.logging", 0);
}

void sub_5C44(unsigned int a1)
{
  id v2 = (void *)sub_6424();
  sub_4F94((a1 & 0x80000000) == 0, v2);
  if ((a1 & 0x80000000) != 0)
  {
    CFPreferencesSetAppValue(@"MadridLoggingLevel", 0, @"com.apple.logging");
    CFPreferencesSetAppValue(@"DebugLevel", 0, @"com.apple.mmcs");
  }
  else
  {
    id v3 = [objc_alloc((Class)NSNumber) initWithInteger:a1];
    CFPreferencesSetAppValue(@"MadridLoggingLevel", v3, @"com.apple.logging");
    CFPreferencesSetAppValue(@"DebugLevel", +[NSNumber numberWithInt:3], @"com.apple.mmcs");
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kMarcoSyncLoggingPrefs", 0, 0, 1u);
  CFStringRef v5 = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(v5, @"PCLoggingSettingsDidChangeNotification", 0, 0, 1u);
}

void sub_5D4C(int a1)
{
  if (a1)
  {
    sub_5F6C(&__kCFBooleanTrue, @"CSILog", @"enabled");
    sub_5F6C(@"512", @"CSILog", @"history");
    sub_5F6C(&__kCFBooleanTrue, @"CSILog", @"enableGlobalLogging");
    sub_5F6C(&__kCFBooleanTrue, @"MobileAnalyzer", @"enabled");
    sub_5F6C(@"512", @"MobileAnalyzer", @"history");
    sub_5F6C(&__kCFBooleanTrue, @"Artemis", @"enabled");
    sub_5F6C(@"512", @"Artemis", @"history");
    sub_5F6C(@"1", @"EURCoreDump", @"enabled");
    sub_5F6C(@"2", @"CoreDump", @"enabled");
    sub_5F6C(@"512", @"DIAG", @"history");
    sub_5F6C(@"default", @"DIAG", @"file");
    id v1 = &__kCFBooleanTrue;
    CFStringRef v2 = @"DIAG";
  }
  else
  {
    sub_5F6C(&__kCFBooleanFalse, @"CSILog", @"enabled");
    sub_5F6C(@"64", @"CSILog", @"history");
    sub_5F6C(&__kCFBooleanFalse, @"CSILog", @"enableGlobalLogging");
    sub_5F6C(&__kCFBooleanFalse, @"MobileAnalyzer", @"enabled");
    sub_5F6C(@"16", @"MobileAnalyzer", @"history");
    sub_5F6C(&__kCFBooleanFalse, @"Artemis", @"enabled");
    sub_5F6C(@"16", @"Artemis", @"history");
    id v1 = @"0";
    CFStringRef v2 = @"CoreDump";
  }

  sub_5F6C(v1, (uint64_t)v2, @"enabled");
}

void sub_5F6C(__CFString *a1, uint64_t a2, uint64_t a3)
{
  if (qword_C250 != -1) {
    dispatch_once(&qword_C250, &stru_82D8);
  }
  if (qword_C260 != -1) {
    dispatch_once(&qword_C260, &stru_82F8);
  }
  uint64_t v9 = 0;
  memset(v8, 0, sizeof(v8));
  uint64_t v6 = off_C248(kCFAllocatorDefault, nullsub_1, v8);
  if (v6)
  {
    id v7 = (const void *)v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ([(__CFString *)a1 BOOLValue]) {
        a1 = @"true";
      }
      else {
        a1 = @"false";
      }
    }
    off_C258(v7, a2, a3, a1);
    CFRelease(v7);
  }
}

uint64_t sub_6094()
{
  return IMSetDomainBoolForKey();
}

uint64_t sub_60AC()
{
  IMSetDomainBoolForKey();
  IMSetDomainBoolForKey();
  [(NSString *)NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/.GlobalPreferences"];

  return IMSetDomainBoolForKey();
}

void sub_6128()
{
  uint64_t v0 = WiFiManagerClientCreate();
  if (v0)
  {
    id v1 = (const void *)v0;
    WiFiManagerClientSetProperty();
    WiFiManagerClientSetProperty();
    WiFiManagerClientSetProperty();
    CFRelease(v1);
  }
}

uint64_t sub_61E8(int a1)
{
  IMSetDomainBoolForKey();
  IMSetDomainBoolForKey();
  BOOL v2 = a1 == 0;
  if (a1) {
    CFStringRef v3 = @"Info";
  }
  else {
    CFStringRef v3 = @"Error";
  }
  if (v2) {
    CFStringRef v4 = @"FALSE";
  }
  else {
    CFStringRef v4 = @"TRUE";
  }
  IMSetDomainValueForKey();
  CFStringRef v8 = @"StackDebugEnabled";
  CFStringRef v9 = v4;
  +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  IMSetDomainValueForKey();
  CFStringRef v6 = @"DebugLevel";
  CFStringRef v7 = v3;
  +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  return IMSetDomainValueForKey();
}

uint64_t sub_6324()
{
  uint64_t result = qword_C238;
  if (!qword_C238)
  {
    id v1 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v1, "setObject:forKey:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"RegistrationLogging", 0), @"com.apple.logging");
    qword_C238 = (uint64_t)[v1 copy];

    return qword_C238;
  }
  return result;
}

id sub_63A4()
{
  [@"systemgroup.com.apple.sharedpclogging" UTF8String];
  uint64_t v0 = container_system_group_path_for_identifier();
  if (!v0) {
    return 0;
  }
  id v1 = (void *)v0;
  id v2 = [objc_alloc((Class)NSString) initWithCString:v0 encoding:4];
  free(v1);
  return v2;
}

uint64_t sub_6424()
{
  uint64_t result = qword_C240;
  if (!qword_C240)
  {
    id v1 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v1, "setObject:forKey:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"MadridLogging", 0), @"com.apple.logging");
    qword_C240 = (uint64_t)[v1 copy];

    return qword_C240;
  }
  return result;
}

void sub_64A4(id a1)
{
  off_C248 = (_UNKNOWN *)IMWeakLinkSymbol();
}

void sub_64D4(id a1)
{
  off_C258 = (_UNKNOWN *)IMWeakLinkSymbol();
}

void sub_694C(uint64_t a1)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t IDSLog()
{
  return _IDSLog();
}

uint64_t IMSetDomainBoolForKey()
{
  return _IMSetDomainBoolForKey();
}

uint64_t IMSetDomainValueForKey()
{
  return _IMSetDomainValueForKey();
}

uint64_t IMWeakLinkSymbol()
{
  return _IMWeakLinkSymbol();
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientSetProperty()
{
  return _WiFiManagerClientSetProperty();
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return __CFPreferencesCopyValueWithContainer();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return __CFPreferencesSetValueWithContainer();
}

uint64_t _CFPreferencesSynchronizeWithContainer()
{
  return __CFPreferencesSynchronizeWithContainer();
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

int pclose(FILE *a1)
{
  return _pclose(a1);
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return _popen(a1, a2);
}

int system(const char *a1)
{
  return _system(a1);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_niceBasicLoggingDefaults(void *a1, const char *a2, ...)
{
  return [a1 niceBasicLoggingDefaults];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_responseInformation(void *a1, const char *a2, ...)
{
  return [a1 responseInformation];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_supportsCellularData(void *a1, const char *a2, ...)
{
  return [a1 supportsCellularData];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}