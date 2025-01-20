@interface DDRTaskResetWifiCertificate
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskResetWifiCertificate

- (void)run
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassInternetPassword);
  CFDictionaryAddValue(Mutable, kSecAttrProtocol, kSecAttrProtocolHTTPS);
  CFDictionaryAddValue(Mutable, kSecAttrAuthenticationType, kSecAttrAuthenticationTypeHTMLForm);
  CFDictionaryAddValue(Mutable, kSecAttrSecurityDomain, @"WISPr");
  OSStatus v3 = SecItemDelete(Mutable);
  if (v3)
  {
    int v4 = v3;
    v5 = DDRLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100008EC4(v4, v5);
    }
  }
  CFRelease(Mutable);
}

- (double)estimatedTimeOfCompletion
{
  return 0.4;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetWifiCertificate";
}

@end