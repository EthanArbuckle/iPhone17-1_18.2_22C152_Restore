@interface AKSecureKey
+ (__SecKey)createOSVersionAttestationRefKeyWithContext:(id)a3 accessControl:(__SecAccessControl *)a4 error:(id *)a5;
+ (__SecKey)osVersionAttestationRefKey;
+ (int)deleteOSVersionAttestationRefKey;
+ (int)storeOSVersionAttestationRefKey:(__SecKey *)a3;
@end

@implementation AKSecureKey

+ (__SecKey)createOSVersionAttestationRefKeyWithContext:(id)a3 accessControl:(__SecAccessControl *)a4 error:(id *)a5
{
  v8 = (id)kSecAttrKeyTypeECSECPrimeRandom;
  CFTypeRef cf = 0;
  v9 = +[AAFAnalyticsEvent ak_analyticsEventWithContext:a3 eventName:@"com.apple.authkit.generateOSBoundRefKey" error:0];
  uint64_t v10 = kAAFDidSucceed;
  [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:kAAFDidSucceed];
  if (!a4 || (v11 = CFRetain(a4)) == 0)
  {
    v11 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, 0x40000000uLL, (CFErrorRef *)&cf);
    if (!v11)
    {
      v23 = _AKLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10018CE44((uint64_t *)&cf, v23);
      }

      CFDictionaryRef v12 = (const __CFDictionary *)cf;
      if (cf) {
        CFTypeRef cf = 0;
      }
      +[NSError ak_attestationErrorWithCode:underlyingError:](NSError, "ak_attestationErrorWithCode:underlyingError:", -10003, v12, cf);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      *a5 = v24;
      [v9 populateUnderlyingErrorsStartingWithRootError:v24];
      v18 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
      [v18 sendEvent:v9];
      goto LABEL_20;
    }
  }
  v27[0] = kSecAttrIsPermanent;
  v27[1] = kSecAttrTokenID;
  v28[0] = &__kCFBooleanFalse;
  v28[1] = kSecAttrTokenIDAppleKeyStore;
  v27[2] = kSecAttrKeyType;
  v27[3] = kSecAttrAccessControl;
  v28[2] = v8;
  v28[3] = v11;
  v27[4] = kSecKeyOSBound;
  v27[5] = kSecAttrKeySizeInBits;
  v28[4] = &__kCFBooleanTrue;
  v28[5] = &off_10023B0F8;
  CFDictionaryRef v12 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:6];
  RandomKey = SecKeyCreateRandomKey(v12, (CFErrorRef *)&cf);
  v14 = _AKLogSystem();
  v15 = v14;
  if (!RandomKey)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10018CEC0((uint64_t *)&cf, v15);
    }

    v18 = (void *)cf;
    if (cf) {
      CFTypeRef cf = 0;
    }
    +[NSError ak_attestationErrorWithCode:underlyingError:](NSError, "ak_attestationErrorWithCode:underlyingError:", -10004, v18, cf);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    *a5 = v21;
    [v9 populateUnderlyingErrorsStartingWithRootError:v21];
    v22 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
    [v22 sendEvent:v9];

    CFRelease(v11);
LABEL_20:
    RandomKey = 0;
    goto LABEL_21;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10018CF3C(v15);
  }

  signed int v16 = +[AKSecureKey deleteOSVersionAttestationRefKey];
  uint64_t v17 = AKAttestationErrorDomain;
  v18 = +[NSError ak_generalErrorWithCode:v16 errorDomain:AKAttestationErrorDomain underlyingError:0];
  v19 = +[NSError ak_generalErrorWithCode:errorDomain:underlyingError:](NSError, "ak_generalErrorWithCode:errorDomain:underlyingError:", +[AKSecureKey storeOSVersionAttestationRefKey:RandomKey], v17, v18);
  [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:v10];
  [v9 populateUnderlyingErrorsStartingWithRootError:v19];
  v20 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
  [v20 sendEvent:v9];

  CFRelease(v11);
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0;

LABEL_21:
  return RandomKey;
}

+ (int)storeOSVersionAttestationRefKey:(__SecKey *)a3
{
  v8[0] = kSecAttrLabel;
  v8[1] = kSecClass;
  v9[0] = @"com.apple.authkit.osVersionAttestationRefKey";
  v9[1] = kSecClassKey;
  v8[2] = kSecValueRef;
  v8[3] = kSecUseDataProtectionKeychain;
  v9[2] = a3;
  v9[3] = &__kCFBooleanTrue;
  v8[4] = kSecAttrAccessible;
  v9[4] = kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate;
  CFDictionaryRef v3 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
  OSStatus v4 = SecItemAdd(v3, 0);
  if (v4)
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10018CFF4();
    }
  }
  v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10018CF80();
  }

  return v4;
}

+ (__SecKey)osVersionAttestationRefKey
{
  v7[0] = kSecClass;
  v7[1] = kSecAttrLabel;
  v8[0] = kSecClassKey;
  v8[1] = @"com.apple.authkit.osVersionAttestationRefKey";
  v7[2] = kSecUseDataProtectionKeychain;
  v7[3] = kSecReturnRef;
  v8[2] = &__kCFBooleanTrue;
  v8[3] = &__kCFBooleanTrue;
  CFDictionaryRef v2 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v6 = 0;
  if (SecItemCopyMatching(v2, (CFTypeRef *)&v6))
  {
    CFDictionaryRef v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10018D05C();
    }
  }
  OSStatus v4 = v6;

  return v4;
}

+ (int)deleteOSVersionAttestationRefKey
{
  v6[0] = kSecClass;
  v6[1] = kSecAttrLabel;
  v7[0] = kSecClassKey;
  v7[1] = @"com.apple.authkit.osVersionAttestationRefKey";
  v6[2] = kSecUseDataProtectionKeychain;
  v7[2] = &__kCFBooleanTrue;
  CFDictionaryRef v2 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];
  OSStatus v3 = SecItemDelete(v2);
  if (v3)
  {
    OSStatus v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10018D0C4();
    }
  }
  return v3;
}

@end