@interface LACUIAuthenticatorServiceConfiguration(LACustomPasswordControllerConfiguration)
- (id)initWithCustomPasswordConfiguration:()LACustomPasswordControllerConfiguration context:;
@end

@implementation LACUIAuthenticatorServiceConfiguration(LACustomPasswordControllerConfiguration)

- (id)initWithCustomPasswordConfiguration:()LACustomPasswordControllerConfiguration context:
{
  id v6 = a3;
  v7 = [a4 externalizedContext];
  id v8 = (id)[a1 initWithContext:v7 requirement:3];

  v9 = [v6 cancelButtonTitle];
  [v8 setCancelButtonTitle:v9];

  objc_msgSend(v8, "setPasscodeLength:", objc_msgSend(v6, "passwordType"));
  v10 = [v6 prompt];
  [v8 setPrompt:v10];

  v11 = [v6 verifyPrompt];
  [v8 setVerifyPrompt:v11];

  unint64_t v12 = [v6 mode];
  if (v12 <= 1) {
    [v8 setMode:v12];
  }
  v13 = [v6 style];
  uint64_t v14 = [v13 rawValue];

  if (!v14)
  {
    uint64_t v15 = 0;
    goto LABEL_7;
  }
  if (v14 == 1)
  {
    uint64_t v15 = 1;
LABEL_7:
    [v8 setStyle:v14];
    [v8 setHeaderHidden:v15];
  }

  return v8;
}

@end