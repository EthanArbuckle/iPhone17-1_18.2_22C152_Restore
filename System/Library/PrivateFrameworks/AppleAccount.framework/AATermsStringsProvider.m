@interface AATermsStringsProvider
+ (id)neediCloudTermsAcceptanceDeviceSpecificMessage;
+ (id)neediCloudTermsAcceptanceTitle;
@end

@implementation AATermsStringsProvider

+ (id)neediCloudTermsAcceptanceTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v3 = [v2 localizedStringForKey:@"FOLLOWUP_VERIFY_TERMS_TITLE" value:0 table:@"Localizable"];

  return v3;
}

+ (id)neediCloudTermsAcceptanceDeviceSpecificMessage
{
  return AADeviceLocStringForKey(@"FOLLOWUP_VERIFY_TERMS_MESSAGE");
}

@end