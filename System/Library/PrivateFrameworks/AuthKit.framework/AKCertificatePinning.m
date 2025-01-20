@interface AKCertificatePinning
+ (BOOL)isValidCertificateTrust:(__SecTrust *)a3 forHostname:(id)a4;
@end

@implementation AKCertificatePinning

+ (BOOL)isValidCertificateTrust:(__SecTrust *)a3 forHostname:(id)a4
{
  v5 = (__CFString *)a4;
  int v16 = 0;
  AppleGSService = (const void *)SecPolicyCreateAppleGSService();
  if (AppleGSService)
  {
    v7 = AppleGSService;
    if (SecTrustSetPolicies(a3, AppleGSService) || MEMORY[0x1996FE020](a3, &v16))
    {
      CFRelease(v7);
    }
    else
    {
      int v8 = v16;
      CFRelease(v7);
      BOOL v9 = 1;
      if (v8 == 1 || v8 == 4) {
        goto LABEL_19;
      }
    }
  }
  v10 = +[AKDevice currentDevice];
  int v11 = [v10 isInternalBuild];

  if (v11
    && CFPreferencesGetAppBooleanValue(@"AppleIDAuthSupportNoPinning", @".GlobalPreferences", 0)
    && (SecPolicyRef SSL = SecPolicyCreateSSL(1u, v5)) != 0)
  {
    SecPolicyRef v13 = SSL;
    BOOL v9 = !SecTrustSetPolicies(a3, SSL) && !MEMORY[0x1996FE020](a3, &v16) && (v16 == 4 || v16 == 1);
    CFRelease(v13);
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_19:

  return v9;
}

@end