@interface AMSUIParentalVerificationCore
+ (BOOL)_isCardOnFileOnStack:(id)a3;
+ (id)_allowedAccountParameters:(id)a3;
+ (id)_minimumAgeFrom:(id)a3;
+ (id)_tokenFromObject:(id)a3;
+ (id)_tokenResultFromTokenString:(id)a3;
@end

@implementation AMSUIParentalVerificationCore

+ (id)_tokenFromObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4)
  {
    v5 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v6 && ![v6 integerValue])
    {
      v8 = [v4 objectForKeyedSubscript:@"paymentToken"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = v8;
      }
      else {
        id v7 = 0;
      }

      if (v7) {
        id v9 = v7;
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_tokenResultFromTokenString:(id)a3
{
  id v3 = [a3 dataUsingEncoding:4];
  id v4 = [[AMSPaymentVerificationTokenResult alloc] initWithTokenData:v3];

  return v4;
}

+ (BOOL)_isCardOnFileOnStack:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4)
  {
    v5 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v6 && ![v6 integerValue])
    {
      v8 = [v4 objectForKeyedSubscript:@"aurumOnStack"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }

      if (v9) {
        char v7 = [v9 BOOLValue];
      }
      else {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)_allowedAccountParameters:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__AMSUIParentalVerificationCore__allowedAccountParameters___block_invoke;
  v5[3] = &unk_2643E4278;
  id v6 = &unk_26CC73BD8;
  id v3 = objc_msgSend(a3, "ams_filterUsingTest:", v5);

  return v3;
}

uint64_t __59__AMSUIParentalVerificationCore__allowedAccountParameters___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

+ (id)_minimumAgeFrom:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"adultMinimumAge"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    char v7 = [v3 objectForKeyedSubscript:@"adultMinimumAge"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    if (v8 && (uint64_t v9 = [v8 integerValue], v9 >= 1))
    {
      id v6 = [NSNumber numberWithInteger:v9];
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

@end