@interface IMUserDefaults
+ (BOOL)isEngramEnabled;
+ (BOOL)isLiveDeliveryWarmUpEnabled;
+ (BOOL)isWriteBlastDoorPayloadsToDiskEnabled;
+ (BOOL)isWritePushPayloadsToDiskEnabled;
+ (BOOL)shouldDisableFailFastWhenSatelliteIsAvailable;
+ (BOOL)trustAnyCredential;
+ (NSString)phoneNumberValidationPreflightTestData;
+ (NSString)writePushPayloadsToDiskPath;
+ (id)sharedDefaults;
+ (int64_t)phoneNumberValidationMode;
+ (void)setEnableEngram:(BOOL)a3;
+ (void)setEnableLiveDeliveryWarmUp:(BOOL)a3;
+ (void)setPhoneNumberValidationMode:(int64_t)a3;
+ (void)setPhoneNumberValidationPreflightTestData:(id)a3;
- (BOOL)appBoolByHostForKey:(id)a3;
- (BOOL)appBoolForKey:(id)a3;
- (id)appValueForKey:(id)a3;
- (id)copyKeyListForAppID:(id)a3;
- (id)copyKeyListForApplicationID:(__CFString *)a3 userName:(__CFString *)a4 hostName:(__CFString *)a5;
- (id)copyMultipleForCurrentKeys:(id)a3 appID:(id)a4;
- (id)copyMultipleForCurrentKeys:(id)a3 applicationID:(__CFString *)a4 userName:(__CFString *)a5 hostName:(__CFString *)a6;
- (id)copyValueForKey:(id)a3 appID:(id)a4;
- (id)copyValueForKey:(id)a3 applicationID:(__CFString *)a4 userName:(__CFString *)a5 hostName:(__CFString *)a6;
- (void)removeAppValueForKey:(id)a3;
- (void)setAppBool:(BOOL)a3 byHostForKey:(id)a4;
- (void)setAppBool:(BOOL)a3 forKey:(id)a4;
- (void)setAppValue:(id)a3 forKey:(id)a4;
- (void)setMultiple:(id)a3 remove:(id)a4 appID:(id)a5;
- (void)setMultiple:(id)a3 remove:(id)a4 applicationID:(__CFString *)a5 userName:(__CFString *)a6 hostName:(__CFString *)a7;
- (void)setValue:(void *)a3 forKey:(id)a4 appID:(id)a5;
- (void)setValue:(void *)a3 forKey:(id)a4 applicationID:(__CFString *)a5 userName:(__CFString *)a6 hostName:(__CFString *)a7;
- (void)synchronizeAppID:(id)a3;
- (void)synchronizeApplicationID:(__CFString *)a3 userName:(__CFString *)a4 hostName:(__CFString *)a5;
@end

@implementation IMUserDefaults

- (id)appValueForKey:(id)a3
{
  return (id)IMGetAppValueForKey(a3, a2);
}

+ (id)sharedDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1918A0544;
  block[3] = &unk_1E5723248;
  block[4] = a1;
  if (qword_1EB273A10 != -1) {
    dispatch_once(&qword_1EB273A10, block);
  }
  v2 = (void *)qword_1EB273A08;
  return v2;
}

+ (void)setEnableEngram:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v8 = (id)objc_msgSend_initWithSuiteName_(v4, v5, @"com.apple.ids", v6);
  objc_msgSend_setBool_forKey_(v8, v7, v3, @"EnableEngramVersion");
}

+ (BOOL)isEngramEnabled
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v5 = objc_msgSend_initWithSuiteName_(v2, v3, @"com.apple.ids", v4);
  BOOL v8 = objc_msgSend_integerForKey_(v5, v6, @"EnableEngramVersion", v7) == 2;

  return v8;
}

+ (void)setPhoneNumberValidationMode:(int64_t)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v8 = (id)objc_msgSend_initWithSuiteName_(v4, v5, @"com.apple.ids", v6);
  objc_msgSend_setInteger_forKey_(v8, v7, a3, @"PhoneNumberValidationMode");
}

+ (int64_t)phoneNumberValidationMode
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v5 = objc_msgSend_initWithSuiteName_(v2, v3, @"com.apple.ids", v4);
  int64_t v8 = objc_msgSend_integerForKey_(v5, v6, @"PhoneNumberValidationMode", v7);

  return v8;
}

+ (void)setPhoneNumberValidationPreflightTestData:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v9 = (id)objc_msgSend_initWithSuiteName_(v5, v6, @"com.apple.ids", v7);
  objc_msgSend_setObject_forKey_(v9, v8, (uint64_t)v4, @"PreflightTestData");
}

+ (NSString)phoneNumberValidationPreflightTestData
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = objc_msgSend_initWithSuiteName_(v2, v3, @"com.apple.ids", v4);
  int64_t v8 = objc_msgSend_stringForKey_(v5, v6, @"PreflightTestData", v7);

  return (NSString *)v8;
}

+ (void)setEnableLiveDeliveryWarmUp:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v8 = (id)objc_msgSend_initWithSuiteName_(v4, v5, @"com.apple.ids", v6);
  objc_msgSend_setBool_forKey_(v8, v7, v3, @"EnableLiveDeliveryWarmUp");
}

+ (BOOL)isLiveDeliveryWarmUpEnabled
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = objc_msgSend_initWithSuiteName_(v2, v3, @"com.apple.ids", v4);
  char v8 = objc_msgSend_BOOLForKey_(v5, v6, @"EnableLiveDeliveryWarmUp", v7);

  return v8;
}

+ (BOOL)trustAnyCredential
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = objc_msgSend_initWithSuiteName_(v2, v3, @"com.apple.ids", v4);
  char v8 = objc_msgSend_BOOLForKey_(v5, v6, @"TrustAnyCredential", v7);

  return v8;
}

+ (BOOL)isWritePushPayloadsToDiskEnabled
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = objc_msgSend_initWithSuiteName_(v2, v3, @"com.apple.ids", v4);
  char v8 = objc_msgSend_BOOLForKey_(v5, v6, @"WritePushPayloadsToDisk", v7);

  return v8;
}

+ (BOOL)isWriteBlastDoorPayloadsToDiskEnabled
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = objc_msgSend_initWithSuiteName_(v2, v3, @"com.apple.ids", v4);
  char v8 = objc_msgSend_BOOLForKey_(v5, v6, @"WriteBlastDoorPayloadsToDisk", v7);

  return v8;
}

+ (NSString)writePushPayloadsToDiskPath
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = objc_msgSend_initWithSuiteName_(v2, v3, @"com.apple.ids", v4);
  char v8 = objc_msgSend_stringForKey_(v5, v6, @"WritePushPayloadsToDiskPath", v7);

  return (NSString *)v8;
}

+ (BOOL)shouldDisableFailFastWhenSatelliteIsAvailable
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = objc_msgSend_initWithSuiteName_(v2, v3, @"com.apple.ids", v4);
  char v8 = objc_msgSend_BOOLForKey_(v5, v6, @"ShouldDisableFailFastWhenSatelliteIsAvailable", v7);

  return v8;
}

- (BOOL)appBoolByHostForKey:(id)a3
{
  return IMGetAppByHostBoolForKey(a3);
}

- (void)setAppBool:(BOOL)a3 byHostForKey:(id)a4
{
}

- (void)setAppValue:(id)a3 forKey:(id)a4
{
}

- (void)removeAppValueForKey:(id)a3
{
}

- (BOOL)appBoolForKey:(id)a3
{
  return IMGetAppBoolForKey(a3);
}

- (void)setAppBool:(BOOL)a3 forKey:(id)a4
{
}

- (void)setValue:(void *)a3 forKey:(id)a4 appID:(id)a5
{
}

- (void)setMultiple:(id)a3 remove:(id)a4 appID:(id)a5
{
}

- (void)synchronizeAppID:(id)a3
{
}

- (id)copyKeyListForAppID:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_copyKeyListForApplicationID_userName_hostName_, a3, *MEMORY[0x1E4F1D3F0]);
}

- (id)copyMultipleForCurrentKeys:(id)a3 appID:(id)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_copyMultipleForCurrentKeys_applicationID_userName_hostName_, a3, a4);
}

- (id)copyValueForKey:(id)a3 appID:(id)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_copyValueForKey_applicationID_userName_hostName_, a3, a4);
}

- (void)setValue:(void *)a3 forKey:(id)a4 applicationID:(__CFString *)a5 userName:(__CFString *)a6 hostName:(__CFString *)a7
{
}

- (void)setMultiple:(id)a3 remove:(id)a4 applicationID:(__CFString *)a5 userName:(__CFString *)a6 hostName:(__CFString *)a7
{
}

- (void)synchronizeApplicationID:(__CFString *)a3 userName:(__CFString *)a4 hostName:(__CFString *)a5
{
}

- (id)copyKeyListForApplicationID:(__CFString *)a3 userName:(__CFString *)a4 hostName:(__CFString *)a5
{
  return CFPreferencesCopyKeyList(a3, a4, a5);
}

- (id)copyMultipleForCurrentKeys:(id)a3 applicationID:(__CFString *)a4 userName:(__CFString *)a5 hostName:(__CFString *)a6
{
  return CFPreferencesCopyMultiple((CFArrayRef)a3, a4, a5, a6);
}

- (id)copyValueForKey:(id)a3 applicationID:(__CFString *)a4 userName:(__CFString *)a5 hostName:(__CFString *)a6
{
  return (id)CFPreferencesCopyValue((CFStringRef)a3, a4, a5, a6);
}

@end