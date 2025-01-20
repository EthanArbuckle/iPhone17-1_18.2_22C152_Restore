@interface NSDictionary
@end

@implementation NSDictionary

void __47__NSDictionary_AuthKit___ak_truncateTokenDict___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = objc_msgSend(*(id *)(a1 + 32), "_ak_shortenServiceIdentifier:", a2);
  id v9 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_ak_truncateTokenString:", v9);
  }
  else
  {
    objc_opt_class();
    v8 = v9;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v7 = objc_msgSend(v9, "ak_redactedCopy");
  }
  v8 = (void *)v7;

LABEL_6:
  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v6];
}

__CFString *__40__NSDictionary_AuthKit__ak_redactedCopy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[AKAppleIDAuthenticationController sensitiveAuthenticationKeys];
  int v8 = [v7 containsObject:v5];

  if (v8)
  {
    if ([v5 isEqualToString:@"AKPassword"])
    {
      id v9 = v6;
      if ((unint64_t)[v9 length] < 5)
      {
        v12 = @"(******)";
      }
      else
      {
        v10 = NSString;
        v11 = objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v9, "length") - 4);
        v12 = [v10 stringWithFormat:@"(...%@)", v11];
      }
      goto LABEL_18;
    }
    v16 = @"(******)";
    if (!v6) {
      v16 = @"(null)";
    }
    v15 = v16;
  }
  else
  {
    v13 = +[AKAppleIDAuthenticationController sensitiveTokenKeys];
    int v14 = [v13 containsObject:v5];

    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "_ak_truncateTokenString:", v6);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = +[AKAppleIDAuthenticationController sensitiveTokenKeysForFullRedaction];
      int v18 = [v17 containsObject:v5];

      if (v18)
      {
        v12 = @"<REDACTED>";
        goto LABEL_18;
      }
      v19 = +[AKAppleIDAuthenticationController tokenDictionaryKeys];
      int v20 = [v19 containsObject:v5];

      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 32), "_ak_truncateTokenDict:", v6);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = (__CFString *)v6;
      }
    }
  }
  v12 = v15;
LABEL_18:

  return v12;
}

@end