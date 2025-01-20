@interface CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel
- (id)_stringWithFeatureIfNeeded:(id)a3;
- (id)_stringWithFeatureSubstituted:(id)a3;
- (id)cancelTitle;
- (id)continueTitle;
- (id)message;
- (id)title;
- (unint64_t)_localSecretType;
@end

@implementation CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel

- (id)title
{
  v3 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self context];
  uint64_t v4 = [v3 deviceToDeviceEncryptionUpgradeType];

  if (v4 == 1) {
    goto LABEL_7;
  }
  if (![(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self is2FA]
    || [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self hasLocalSecret])
  {
    if ([(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self is2FA]
      && [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self hasLocalSecret])
    {
      v5 = @"D2DENCRYPTION_UPGRADE_TITLE_ONLY_MISSING_SECRET";
LABEL_8:
      v6 = [(CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel *)self _stringWithFeatureIfNeeded:v5];
      v7 = [MEMORY[0x263F343B8] builderForKey:v6];
      v8 = [v7 localizedString];
      v9 = [(CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel *)self _stringWithFeatureSubstituted:v8];

      goto LABEL_9;
    }
LABEL_7:
    v5 = @"D2DENCRYPTION_UPGRADE_TITLE";
    goto LABEL_8;
  }
  v11 = [(CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel *)self _stringWithFeatureIfNeeded:@"D2DENCRYPTION_UPGRADE_TITLE_UPGRADE_MISSING_SECRET"];
  v12 = [MEMORY[0x263F343B8] builderForKey:v11];
  v13 = [MEMORY[0x263F343A8] sharedInstance];
  v14 = [v13 deviceClass];
  v15 = [v12 addDeviceClass:v14];
  v16 = objc_msgSend(v15, "addSecretType:", -[CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel _localSecretType](self, "_localSecretType"));
  v6 = [v16 localizedString];

  v9 = [(CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel *)self _stringWithFeatureSubstituted:v6];
LABEL_9:

  return v9;
}

- (id)message
{
  v3 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self context];
  uint64_t v4 = [v3 deviceToDeviceEncryptionUpgradeType];

  if (v4 == 1)
  {
    v5 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_UPGRADE_MESSAGE"];
    v6 = [(__CFString *)v5 localizedString];
    goto LABEL_15;
  }
  if ([(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self is2FA]
    && ![(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self hasLocalSecret])
  {
    v5 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_UPGRADE_MESSAGE_NO_UPGRADE_MISSING_SECRET"];
    v7 = [MEMORY[0x263F343A8] sharedInstance];
    v8 = [v7 deviceClass];
    v9 = [(__CFString *)v5 addDeviceClass:v8];
    v10 = objc_msgSend(v9, "addSecretType:", -[CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel _localSecretType](self, "_localSecretType"));
LABEL_13:
    v16 = v10;
    v6 = [v10 localizedString];

    goto LABEL_14;
  }
  if ([(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self is2FA]
    && [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self hasLocalSecret])
  {
    v5 = @"D2DENCRYPTION_UPGRADE_MESSAGE_ONLY_MISSING_SECRET";
    if (([@"D2DENCRYPTION_UPGRADE_MESSAGE_ONLY_MISSING_SECRET" containsString:@"REBRAND"] & 1) == 0
      && _os_feature_enabled_impl())
    {
      v5 = [@"D2DENCRYPTION_UPGRADE_MESSAGE_ONLY_MISSING_SECRET" stringByAppendingString:@"_REBRAND"];
    }
    v7 = [MEMORY[0x263F343B8] builderForKey:v5];
    v8 = [MEMORY[0x263F343A8] sharedInstance];
    v9 = [v8 deviceClass];
    v10 = [v7 addDeviceClass:v9];
    goto LABEL_13;
  }
  v11 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_UPGRADE_MESSAGE_UPGRADE_MISSING_SECRET"];
  v12 = objc_msgSend(v11, "addSecretType:", -[CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel _localSecretType](self, "_localSecretType"));
  v13 = [MEMORY[0x263F343A8] sharedInstance];
  v14 = [v13 deviceClass];
  v15 = [v12 addDeviceClass:v14];
  v5 = [v15 localizedString];

  v7 = [MEMORY[0x263F343B8] builderForKey:v5];
  v6 = [v7 localizedString];
LABEL_14:

LABEL_15:

  return v6;
}

- (id)continueTitle
{
  v2 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_CONTINUE"];
  v3 = [v2 localizedString];

  return v3;
}

- (id)cancelTitle
{
  v2 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_CANCEL"];
  v3 = [v2 localizedString];

  return v3;
}

- (id)_stringWithFeatureIfNeeded:(id)a3
{
  id v4 = a3;
  v5 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self context];
  v6 = [v5 featureName];

  if (v6)
  {
    id v7 = [v4 stringByAppendingString:@"_WITH_FEATURE"];
  }
  else
  {
    id v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (id)_stringWithFeatureSubstituted:(id)a3
{
  id v4 = a3;
  v5 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self context];
  v6 = [v5 featureName];

  if (v6)
  {
    id v7 = NSString;
    v8 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self context];
    v9 = [v8 featureName];
    id v10 = [v7 stringWithValidatedFormat:v4, @"%@", 0, v9 validFormatSpecifiers error];
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

- (unint64_t)_localSecretType
{
  return 1;
}

@end