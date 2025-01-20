@interface AMSUIAgeVerificationCore
+ (id)_messageForResult:(id)a3 withBag:(id)a4 expiration:(id)a5 dateFormatter:(id)a6 bundle:(id)a7;
+ (id)_promiseResultForCancelWithVerificationResult:(id)a3;
+ (id)_timestampOfExpiryFrom:(id)a3;
+ (id)_titleForResult:(id)a3 withBag:(id)a4 bundle:(id)a5;
@end

@implementation AMSUIAgeVerificationCore

+ (id)_promiseResultForCancelWithVerificationResult:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F27E20];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 requiredType];

  if (v6 == 3)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F27AE8]);
    [v7 setSuccessType:3];
    [v5 setResult:v7];
  }
  else
  {
    AMSError();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v5 setError:v7];
  }

  return v5;
}

+ (id)_messageForResult:(id)a3 withBag:(id)a4 expiration:(id)a5 dateFormatter:(id)a6 bundle:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = a4;
  if ([a3 requiredType] == 3)
  {
    uint64_t v15 = [v12 stringFromDate:v11];
    v16 = NSString;
    id v17 = (id)[MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
    uint64_t v18 = AMSUILocalizedStringFromBundle(@"AGE_VERIFICATION_SOON_DIALOG_MESSAGE", v14, v13);

    v19 = objc_msgSend(v16, "stringWithFormat:", v18, v15);
    id v13 = (id)v18;
    id v14 = (id)v15;
  }
  else
  {
    id v20 = (id)[MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
    v19 = AMSUILocalizedStringFromBundle(@"AGE_VERIFICATION_DIALOG_MESSAGE", v14, v13);
  }

  return v19;
}

+ (id)_titleForResult:(id)a3 withBag:(id)a4 bundle:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [a3 requiredType];
  id v10 = (id)[MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  if (v9 == 3) {
    id v11 = @"AGE_VERIFICATION_SOON_DIALOG_TITLE";
  }
  else {
    id v11 = @"AGE_VERIFICATION_DIALOG_TITLE";
  }
  id v12 = AMSUILocalizedStringFromBundle(v11, v8, v7);

  return v12;
}

+ (id)_timestampOfExpiryFrom:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(objc_msgSend(v3, "longLongValue") / 1000));
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end