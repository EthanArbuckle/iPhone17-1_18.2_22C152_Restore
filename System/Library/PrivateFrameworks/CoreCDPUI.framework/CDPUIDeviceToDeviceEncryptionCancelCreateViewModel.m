@interface CDPUIDeviceToDeviceEncryptionCancelCreateViewModel
- (id)cancelTitle;
- (id)continueTitle;
- (id)message;
- (id)title;
- (unint64_t)_localSecretType;
@end

@implementation CDPUIDeviceToDeviceEncryptionCancelCreateViewModel

- (id)title
{
  v3 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_CANCEL_CREATE_SECRET_TITLE"];
  v4 = objc_msgSend(v3, "addSecretType:", -[CDPUIDeviceToDeviceEncryptionCancelCreateViewModel _localSecretType](self, "_localSecretType"));
  v5 = [v4 localizedString];

  return v5;
}

- (id)message
{
  unint64_t v3 = [(CDPUIDeviceToDeviceEncryptionCancelCreateViewModel *)self _localSecretType];
  v4 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self context];
  v5 = [v4 featureName];

  if (v5)
  {
    v6 = NSString;
    v7 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_CANCEL_CREATE_SECRET_MESSAGE_WITH_FEATURE"];
    v8 = [MEMORY[0x263F343A8] sharedInstance];
    v9 = [v8 deviceClass];
    v10 = [v7 addDeviceClass:v9];
    v11 = [v10 addSecretType:v3];
    v12 = [v11 localizedString];
    v13 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self context];
    v14 = [v13 featureName];
    v15 = [v6 stringWithValidatedFormat:v12, @"%@", 0, v14 validFormatSpecifiers error];
  }
  else
  {
    v7 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_CANCEL_CREATE_SECRET_MESSAGE"];
    v8 = [MEMORY[0x263F343A8] sharedInstance];
    v9 = [v8 deviceClass];
    v10 = [v7 addDeviceClass:v9];
    v11 = [v10 addSecretType:v3];
    v15 = [v11 localizedString];
  }

  return v15;
}

- (id)continueTitle
{
  unint64_t v3 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_CANCEL_DONT_USE"];
  v4 = objc_msgSend(v3, "addSecretType:", -[CDPUIDeviceToDeviceEncryptionCancelCreateViewModel _localSecretType](self, "_localSecretType"));
  v5 = [v4 localizedString];

  return v5;
}

- (id)cancelTitle
{
  unint64_t v3 = [MEMORY[0x263F343B8] builderForKey:@"D2DENCRYPTION_CANCEL_CREATE_SECRET"];
  v4 = objc_msgSend(v3, "addSecretType:", -[CDPUIDeviceToDeviceEncryptionCancelCreateViewModel _localSecretType](self, "_localSecretType"));
  v5 = [v4 localizedString];

  return v5;
}

- (unint64_t)_localSecretType
{
  return 1;
}

@end