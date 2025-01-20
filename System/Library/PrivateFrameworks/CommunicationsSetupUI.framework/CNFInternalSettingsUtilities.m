@interface CNFInternalSettingsUtilities
+ (BOOL)isViceroyLoggingEnabled;
+ (id)IDSEnvironment;
+ (id)currentInternalSettingsBundle;
+ (void)killCallservicesd;
+ (void)killEverything;
+ (void)killFaceTime;
+ (void)killImagent;
+ (void)killImavagent;
+ (void)killMediaServerd;
+ (void)killMobilePhone;
+ (void)killMobileSMS;
+ (void)nukeKeychain;
+ (void)setCurrentInternalSettingsBundle:(id)a3;
+ (void)setIDSEnvironment:(id)a3;
+ (void)setViceroyLoggingEnabled:(BOOL)a3;
+ (void)signOutAllAccounts;
+ (void)syncImagentLogSettings;
@end

@implementation CNFInternalSettingsUtilities

+ (BOOL)isViceroyLoggingEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"errorLogLevel", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  return keyExistsAndHasValidFormat && AppIntegerValue == 7;
}

+ (void)setViceroyLoggingEnabled:(BOOL)a3
{
  if (a3) {
    v3 = (const void *)[NSNumber numberWithInt:8];
  }
  else {
    v3 = 0;
  }
  CFPreferencesSetAppValue(@"errorLogLevel", v3, @"com.apple.VideoConference");
  CFPreferencesAppSynchronize(@"com.apple.VideoConference");
}

+ (void)killImagent
{
  if (MarcoShouldLogRegistration())
  {
    v3 = @"killall -9 imagent";
    MarcoLogRegistration();
  }
  uint64_t v2 = objc_msgSend(@"killall -9 imagent", "UTF8String", v3);
  MEMORY[0x270F3CE10](v2);
}

+ (void)killImavagent
{
  if (MarcoShouldLogRegistration())
  {
    v3 = @"killall -9 imavagent";
    MarcoLogRegistration();
  }
  uint64_t v2 = objc_msgSend(@"killall -9 imavagent", "UTF8String", v3);
  MEMORY[0x270F3CE10](v2);
}

+ (void)syncImagentLogSettings
{
  if (MarcoShouldLogRegistration())
  {
    v3 = @"killall -USR2 imagent";
    MarcoLogRegistration();
  }
  uint64_t v2 = objc_msgSend(@"killall -USR2 imagent", "UTF8String", v3);
  MEMORY[0x270F3CE10](v2);
}

+ (void)killMediaServerd
{
  if (MarcoShouldLogRegistration())
  {
    v3 = @"killall -9 mediaserverd";
    MarcoLogRegistration();
  }
  uint64_t v2 = objc_msgSend(@"killall -9 mediaserverd", "UTF8String", v3);
  MEMORY[0x270F3CE10](v2);
}

+ (void)killCallservicesd
{
  if (MarcoShouldLogRegistration())
  {
    v3 = @"killall -9 callservicesd";
    MarcoLogRegistration();
  }
  uint64_t v2 = objc_msgSend(@"killall -9 callservicesd", "UTF8String", v3);
  MEMORY[0x270F3CE10](v2);
}

+ (void)killFaceTime
{
  if (MarcoShouldLogRegistration())
  {
    v3 = @"killall -9 FaceTime";
    MarcoLogRegistration();
  }
  uint64_t v2 = objc_msgSend(@"killall -9 FaceTime", "UTF8String", v3);
  MEMORY[0x270F3CE10](v2);
}

+ (void)killMobilePhone
{
  if (MarcoShouldLogRegistration())
  {
    v3 = @"killall -9 MobilePhone";
    MarcoLogRegistration();
  }
  uint64_t v2 = objc_msgSend(@"killall -9 MobilePhone", "UTF8String", v3);
  MEMORY[0x270F3CE10](v2);
}

+ (void)killMobileSMS
{
  if (MarcoShouldLogRegistration())
  {
    v3 = @"killall -9 MobileSMS";
    MarcoLogRegistration();
  }
  uint64_t v2 = objc_msgSend(@"killall -9 MobileSMS", "UTF8String", v3);
  MEMORY[0x270F3CE10](v2);
}

+ (void)killEverything
{
  if (MarcoShouldLogRegistration())
  {
    v3 = @"killall -9 mediaserverd Contacts imagent imavagent identityservicesd SpringBoard MobilePhone MobileSMS";
    MarcoLogRegistration();
  }
  uint64_t v2 = objc_msgSend(@"killall -9 mediaserverd Contacts imagent imavagent identityservicesd SpringBoard MobilePhone MobileSMS", "UTF8String", v3);
  MEMORY[0x270F3CE10](v2);
}

+ (void)nukeKeychain
{
  if (MarcoShouldLogRegistration()) {
    MarcoLogRegistration();
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  v3 = (const void *)*MEMORY[0x263F17090];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F17090], @"com.apple.iChat.VeniceRegistrationAgent");
  OSStatus v4 = SecItemDelete(Mutable);
  if (v4) {
    NSLog(&cfstr_UnableToRemove.isa, v4);
  }
  CFDictionarySetValue(Mutable, v3, @"com.apple.facetime");
  OSStatus v5 = SecItemDelete(Mutable);
  if (v5) {
    NSLog(&cfstr_UnableToRemove_0.isa, v5);
  }
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

+ (void)signOutAllAccounts
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  MarcoLogRegistration();
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
  v3 = [MEMORY[0x263F4A608] facetimeService];

  if (v3)
  {
    OSStatus v4 = [MEMORY[0x263F4A608] facetimeService];
    [v2 addObject:v4];
  }
  OSStatus v5 = [MEMORY[0x263F4A608] iMessageService];

  if (v5)
  {
    v6 = [MEMORY[0x263F4A608] iMessageService];
    [v2 addObject:v6];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v2;
  uint64_t v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v34;
    v7 = (void *)*MEMORY[0x263F4A8D8];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v8;
        uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * v8);
        v10 = [MEMORY[0x263F4A520] sharedInstance];
        v11 = [v10 accountsForService:v9];

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v30 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              if ([v17 accountType] == 1)
              {
                MarcoLogRegistration();
                objc_msgSend(v17, "unregisterAccount", v17);
                [v17 setBool:1 forKey:@"AccountSignedOut"];
                id v18 = objc_alloc(MEMORY[0x263EFF980]);
                v19 = [v17 aliases];
                v20 = (void *)[v18 initWithArray:v19];

                v21 = [v7 lowercaseString];
                char v22 = [v20 containsObject:v21];

                if ((v22 & 1) == 0)
                {
                  v23 = [v7 lowercaseString];
                  [v20 addObject:v23];
                }
                [v17 removeAliases:v20];
                [v17 writeSettings];
                v24 = [MEMORY[0x263F4A520] sharedInstance];
                [v24 deactivateAccount:v17];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v14);
        }

        uint64_t v8 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v27);
  }
}

+ (id)currentInternalSettingsBundle
{
  return (id)sCurrentInternalBundle;
}

+ (void)setCurrentInternalSettingsBundle:(id)a3
{
}

+ (id)IDSEnvironment
{
  CFPreferencesAppSynchronize(@"com.apple.ids");
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"env", @"com.apple.ids");
  v3 = v2;
  if (v2) {
    OSStatus v4 = v2;
  }
  else {
    OSStatus v4 = @"prod";
  }

  return v4;
}

+ (void)setIDSEnvironment:(id)a3
{
  id v3 = a3;
  MarcoLogRegistration();
  CFPreferencesSetAppValue(@"env", v3, @"com.apple.ids");

  CFPreferencesAppSynchronize(@"com.apple.ids");
}

@end