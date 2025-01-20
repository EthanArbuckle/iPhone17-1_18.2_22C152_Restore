@interface NSString(AppleMediaServices)
+ (id)_replaceBreakingSpaceMarkupForMutableAttributedString:()AppleMediaServices;
+ (id)_replaceMarkupForMutableAttributedString:()AppleMediaServices markupType:;
- (BOOL)ams_caseInsensitiveEquals:()AppleMediaServices;
- (BOOL)ams_matchesRegex:()AppleMediaServices;
- (id)ams_replaceAccountPatternWithUsername:()AppleMediaServices;
- (id)ams_replacingMarkupUsingAccount:()AppleMediaServices shouldUppercase:;
- (id)ams_sha256HashStringUsingEncoding:()AppleMediaServices error:;
- (id)ams_sha512HashStringUsingEncoding:()AppleMediaServices error:;
- (id)ams_stringByRemovingCharactersInSet:()AppleMediaServices;
- (uint64_t)ams_isPercentEncodedForAllowedCharacters:()AppleMediaServices;
- (void)ams_enumerateRangesOfString:()AppleMediaServices options:usingBlock:;
@end

@implementation NSString(AppleMediaServices)

- (id)ams_sha512HashStringUsingEncoding:()AppleMediaServices error:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v8 = objc_msgSend(a1, "dataUsingEncoding:");
  if (!v8)
  {
    v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      v9 = +[AMSLogConfig sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = AMSLogKey();
      v12 = NSString;
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = v13;
      if (v11)
      {
        uint64_t v4 = AMSLogKey();
        [v12 stringWithFormat:@"%@: [%@] ", v14, v4];
      }
      else
      {
        [v12 stringWithFormat:@"%@: ", v13];
      v15 = };
      v16 = AMSHashIfNeeded(a1);
      *(_DWORD *)buf = 138543874;
      v37 = v15;
      __int16 v38 = 2114;
      v39 = v16;
      __int16 v40 = 2048;
      uint64_t v41 = a3;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to convert string to data. string = %{public}@ | encoding = %lu", buf, 0x20u);
      if (v11)
      {

        v15 = (void *)v4;
      }
    }
    if (a4)
    {
      AMSError(0, @"Conversion Error", @"Unable to convert string to data.", 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v17 = v8;
  if (CC_SHA512((const void *)[v17 bytes], objc_msgSend(v17, "length"), buf))
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    for (uint64_t i = 0; i != 64; ++i)
      objc_msgSend(v18, "appendFormat:", @"%02x", buf[i]);
    v20 = (void *)[v18 copy];
  }
  else
  {
    v21 = +[AMSLogConfig sharedConfig];
    if (!v21)
    {
      v21 = +[AMSLogConfig sharedConfig];
    }
    v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = AMSLogKey();
      v24 = NSString;
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = v25;
      if (v23)
      {
        uint64_t v4 = AMSLogKey();
        [v24 stringWithFormat:@"%@: [%@] ", v26, v4];
      }
      else
      {
        [v24 stringWithFormat:@"%@: ", v25];
      v27 = };
      v28 = AMSHashIfNeeded(a1);
      *(_DWORD *)v30 = 138543874;
      v31 = v27;
      __int16 v32 = 2114;
      v33 = v28;
      __int16 v34 = 2048;
      uint64_t v35 = a3;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to hash data. string = %{public}@ | encoding = %lu", v30, 0x20u);
      if (v23)
      {

        v27 = (void *)v4;
      }
    }
    if (a4)
    {
      AMSError(0, @"Hash Error", @"Unable to string to a hashed representation.", 0);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

- (uint64_t)ams_isPercentEncodedForAllowedCharacters:()AppleMediaServices
{
  id v4 = a3;
  v5 = [a1 stringByRemovingPercentEncoding];
  v6 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v4];

  uint64_t v7 = [a1 isEqualToString:v6];
  return v7;
}

- (void)ams_enumerateRangesOfString:()AppleMediaServices options:usingBlock:
{
  id v16 = a3;
  v8 = a5;
  if ([a1 length])
  {
    uint64_t v9 = objc_msgSend(a1, "rangeOfString:options:range:", v16, a4, 0, objc_msgSend(a1, "length"));
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = v9;
      uint64_t v12 = v10;
      uint64_t v13 = 0;
      do
      {
        v8[2](v8, v11, v12);
        if ((a4 & 4) != 0)
        {
          uint64_t v14 = v11 - 1;
        }
        else
        {
          uint64_t v13 = v11 + v12;
          uint64_t v14 = [a1 length] - (v11 + v12);
        }
        uint64_t v11 = objc_msgSend(a1, "rangeOfString:options:range:", v16, a4, v13, v14);
        uint64_t v12 = v15;
      }
      while (v11 != 0x7FFFFFFFFFFFFFFFLL);
    }
  }
}

- (BOOL)ams_matchesRegex:()AppleMediaServices
{
  return [a1 rangeOfString:a3 options:1024] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)ams_replaceAccountPatternWithUsername:()AppleMediaServices
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = &stru_1EDCA7308;
  }
  if ([a1 rangeOfString:@"%%appleId%%" options:1] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = a1;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F4F0E0] formattedUsernameFromUsername:v5];
    if (!v7)
    {
      v8 = +[AMSLogConfig sharedConfig];
      if (!v8)
      {
        v8 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v9 = [v8 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = AMSLogKey();
        int v12 = 138543362;
        uint64_t v13 = v10;
        _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "NSString+AppleMediaServices: [%{public}@] Failed to determine display username", (uint8_t *)&v12, 0xCu);
      }
      uint64_t v7 = v5;
    }
    objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:", @"%%appleId%%", v7, 1, 0, objc_msgSend(a1, "length"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)ams_replacingMarkupUsingAccount:()AppleMediaServices shouldUppercase:
{
  id v6 = [a3 username];
  uint64_t v7 = objc_msgSend(a1, "ams_replaceAccountPatternWithUsername:", v6);

  if (a4)
  {
    uint64_t v8 = [v7 localizedUppercaseString];

    uint64_t v7 = (void *)v8;
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v7];
  uint64_t v10 = [NSString _replaceMarkupForMutableAttributedString:v9 markupType:0];

  uint64_t v11 = [NSString _replaceMarkupForMutableAttributedString:v10 markupType:1];

  int v12 = [NSString _replaceBreakingSpaceMarkupForMutableAttributedString:v11];

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v12];
  return v13;
}

- (id)ams_sha256HashStringUsingEncoding:()AppleMediaServices error:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend(a1, "dataUsingEncoding:");
  if (!v8)
  {
    uint64_t v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      uint64_t v9 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = AMSLogKey();
      int v12 = NSString;
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = v13;
      if (v11)
      {
        uint64_t v4 = AMSLogKey();
        [v12 stringWithFormat:@"%@: [%@] ", v14, v4];
      }
      else
      {
        [v12 stringWithFormat:@"%@: ", v13];
      uint64_t v15 = };
      id v16 = AMSHashIfNeeded(a1);
      *(_DWORD *)buf = 138543874;
      v37 = v15;
      __int16 v38 = 2114;
      v39 = v16;
      __int16 v40 = 2048;
      uint64_t v41 = a3;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to convert string to data. string = %{public}@ | encoding = %lu", buf, 0x20u);
      if (v11)
      {

        uint64_t v15 = (void *)v4;
      }
    }
    if (a4)
    {
      AMSError(0, @"Conversion Error", @"Unable to convert string to data.", 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v17 = v8;
  if (CC_SHA256((const void *)[v17 bytes], objc_msgSend(v17, "length"), buf))
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    for (uint64_t i = 0; i != 32; ++i)
      objc_msgSend(v18, "appendFormat:", @"%02x", buf[i]);
    v20 = (void *)[v18 copy];
  }
  else
  {
    v21 = +[AMSLogConfig sharedConfig];
    if (!v21)
    {
      v21 = +[AMSLogConfig sharedConfig];
    }
    v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = AMSLogKey();
      v24 = NSString;
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = v25;
      if (v23)
      {
        uint64_t v4 = AMSLogKey();
        [v24 stringWithFormat:@"%@: [%@] ", v26, v4];
      }
      else
      {
        [v24 stringWithFormat:@"%@: ", v25];
      v27 = };
      v28 = AMSHashIfNeeded(a1);
      *(_DWORD *)v30 = 138543874;
      v31 = v27;
      __int16 v32 = 2114;
      v33 = v28;
      __int16 v34 = 2048;
      uint64_t v35 = a3;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to hash data. string = %{public}@ | encoding = %lu", v30, 0x20u);
      if (v23)
      {

        v27 = (void *)v4;
      }
    }
    if (a4)
    {
      AMSError(0, @"Hash Error", @"Unable to string to a hashed representation.", 0);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

- (id)ams_stringByRemovingCharactersInSet:()AppleMediaServices
{
  v1 = objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
  v2 = [v1 componentsJoinedByString:&stru_1EDCA7308];

  return v2;
}

+ (id)_replaceBreakingSpaceMarkupForMutableAttributedString:()AppleMediaServices
{
  id v3 = a3;
  uint64_t v4 = [v3 string];
  v5 = [v4 lowercaseString];

  uint64_t v6 = [v5 rangeOfString:@"[br/]"];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v6;
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = v5;
      objc_msgSend(v3, "replaceCharactersInRange:withString:", v8, v7, @"\n");
      uint64_t v11 = [v3 string];
      v5 = [v11 lowercaseString];

      uint64_t v12 = [v5 rangeOfString:@"[br/]"];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v8 = v12;
    }
    while (v9++ < 9);
  }

  return v3;
}

+ (id)_replaceMarkupForMutableAttributedString:()AppleMediaServices markupType:
{
  id v5 = a3;
  uint64_t v6 = v5;
  uint64_t v7 = @"[b]";
  uint64_t v8 = @"[/b]";
  if (a4)
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  if (a4 == 1) {
    unint64_t v9 = @"[/i]";
  }
  else {
    unint64_t v9 = v8;
  }
  if (a4 == 1) {
    uint64_t v10 = @"[i]";
  }
  else {
    uint64_t v10 = v7;
  }
  uint64_t v11 = [v5 string];
  uint64_t v12 = [v11 lowercaseString];

  if ([v12 rangeOfString:v10] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      if (a4 != 1) {
        goto LABEL_23;
      }
      CFStringRef v13 = @"Helvetica-Italic";
    }
    else
    {
      CFStringRef v13 = @"Helvetica-Bold";
    }
    CTFontRef v14 = CTFontCreateWithName(v13, 14.0, 0);
    if (v14)
    {
      CTFontRef cf = v14;
      uint64_t v15 = [v12 rangeOfString:v10];
      uint64_t v17 = v16;
      uint64_t v18 = [v12 rangeOfString:v9];
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v20 = v18;
        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v21 = 0;
          do
          {
            v22 = v9;
            v23 = v12;
            objc_msgSend(v6, "replaceCharactersInRange:withString:", v20, v19, &stru_1EDCA7308);
            objc_msgSend(v6, "replaceCharactersInRange:withString:", v15, v17, &stru_1EDCA7308);
            v24 = [v6 string];
            uint64_t v12 = [v24 lowercaseString];

            unint64_t v9 = v22;
            uint64_t v15 = [v12 rangeOfString:v10];
            uint64_t v17 = v25;
            uint64_t v26 = [v12 rangeOfString:v22];
            if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            uint64_t v20 = v26;
            if (v26 == 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
          }
          while (v21++ < 9);
        }
      }
      CFRelease(cf);
    }
  }
LABEL_23:

  return v6;
}

- (BOOL)ams_caseInsensitiveEquals:()AppleMediaServices
{
  return objc_msgSend(a1, "caseInsensitiveCompare:") == 0;
}

@end