@interface CDPUIDeviceToDeviceEncryptionIneligibilityAlertViewModel
- (id)continueTitle;
- (id)message;
- (id)title;
@end

@implementation CDPUIDeviceToDeviceEncryptionIneligibilityAlertViewModel

- (id)title
{
  v3 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self context];
  v4 = [v3 featureName];

  if (v4)
  {
    v5 = NSString;
    v6 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_INELIGIBLE_TITLE_WITH_FEATURE"];
    v7 = [v6 localizedString];
    v8 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self context];
    v9 = [v8 featureName];
    v10 = [v5 stringWithValidatedFormat:v7, @"%@", 0, v9 validFormatSpecifiers error];
  }
  else
  {
    v6 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_INELIGIBLE_TITLE"];
    v10 = [v6 localizedString];
  }

  return v10;
}

- (id)message
{
  v3 = [MEMORY[0x263F290F0] sharedInstance];
  v4 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self context];
  v5 = [v4 altDSID];
  v6 = [v3 authKitAccountWithAltDSID:v5];

  v7 = NSString;
  v8 = (void *)MEMORY[0x263F343B8];
  v9 = @"D2DENCRYPTION_INELIGIBLE_MESSAGE";
  if (([@"D2DENCRYPTION_INELIGIBLE_MESSAGE" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v10 = 0;
  }
  else
  {
    v9 = [@"D2DENCRYPTION_INELIGIBLE_MESSAGE" stringByAppendingString:@"_REBRAND"];
    int v10 = 1;
  }
  v11 = [v8 builderForKey:v9];
  v12 = [v11 localizedString];
  v13 = [v6 username];
  v14 = [v7 stringWithValidatedFormat:v12, @"%@", 0, v13 validFormatSpecifiers error];

  if (v10) {

  }
  return v14;
}

- (id)continueTitle
{
  v2 = [MEMORY[0x263F343B8] builderForKey:@"OK"];
  v3 = [v2 localizedString];

  return v3;
}

@end