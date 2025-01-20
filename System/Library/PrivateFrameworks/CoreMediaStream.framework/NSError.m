@interface NSError
@end

@implementation NSError

uint64_t __49__NSError_MSErrorUtilities__MSMMCSRetryAfterDate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F73818]];

  if (v5)
  {
    v6 = [v3 userInfo];
    v7 = [v6 objectForKey:@"Retry-After"];

    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v12 = 1;
      goto LABEL_13;
    }
    if (kMSErrorIsPrimaryKey_block_invoke_onceToken != -1) {
      dispatch_once(&kMSErrorIsPrimaryKey_block_invoke_onceToken, &__block_literal_global_719);
    }
    uint64_t DateFromString = (uint64_t)CFDateFormatterCreateDateFromString(0, (CFDateFormatterRef)kMSErrorIsPrimaryKey_block_invoke_formatter, v7, 0);
    if (!DateFromString)
    {
      int v9 = [(__CFString *)v7 intValue];
      if (v9 < 1)
      {
LABEL_10:
        uint64_t v12 = 0;
LABEL_13:

        goto LABEL_14;
      }
      uint64_t DateFromString = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)v9];
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = DateFromString;

    goto LABEL_10;
  }
  uint64_t v12 = 1;
LABEL_14:

  return v12;
}

void __49__NSError_MSErrorUtilities__MSMMCSRetryAfterDate__block_invoke_2()
{
  v0 = CFDateFormatterCreate(0, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  kMSErrorIsPrimaryKey_block_invoke_formatter = (uint64_t)v0;
  if (v0)
  {
    CFStringRef v1 = (const __CFString *)*MEMORY[0x1E4F1D088];
    v2 = (const void *)*MEMORY[0x1E4F1CFD0];
    CFDateFormatterSetProperty(v0, v1, v2);
  }
}

uint64_t __43__NSError_MSErrorUtilities__MSIsQuotaError__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = 1;
    if ([v3 code] == 3)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t __60__NSError_MSErrorUtilities__MSContainsErrorWithDomain_code___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 domain];
  if ([v4 isEqualToString:a1[4]])
  {
    uint64_t v5 = [v3 code];
    uint64_t v6 = a1[6];

    uint64_t v7 = 1;
    if (v5 == v6)
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      uint64_t v7 = 0;
    }
  }
  else
  {

    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __46__NSError_MSErrorUtilities__MSIsBadTokenError__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F73818]];

  if (v5)
  {
    if ([v3 code] == 14)
    {
LABEL_7:
      uint64_t v8 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = [v3 domain];
    int v7 = [v6 isEqualToString:@"MSSubscribeStorageProtocolErrorDomain"];

    if (v7 && ![v3 code]) {
      goto LABEL_7;
    }
  }
  uint64_t v8 = 1;
LABEL_8:

  return v8;
}

uint64_t __42__NSError_MSErrorUtilities__MSIsAuthError__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F73818]];

  if (!v5)
  {
    int v7 = [v3 domain];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F18F50]];

    if (v8)
    {
      uint64_t v9 = [v3 code];
      if (v9 == -1012 || v9 == 401 || v9 == 330)
      {
        uint64_t v6 = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        goto LABEL_10;
      }
    }
LABEL_9:
    uint64_t v6 = 1;
    goto LABEL_10;
  }
  if ([v3 code] != 15) {
    goto LABEL_9;
  }
  uint64_t v6 = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
LABEL_10:

  return v6;
}

unint64_t __38__NSError_MSErrorUtilities__MSIsFatal__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F18F50]];

  if (v5)
  {
    uint64_t v6 = [v3 code];
    if ((unint64_t)(v6 - 500) >= 0xFFFFFFFFFFFFFF9CLL)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      unint64_t v7 = 0;
      *(unsigned char *)(v11 + 24) = v6 != 401;
    }
    else
    {
      unint64_t v7 = 1;
    }
  }
  else
  {
    int v8 = [v3 domain];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F73818]];

    if (v9)
    {
      unint64_t v10 = [v3 code];
      unint64_t v7 = 1;
      if (v10 <= 0x27 && ((1 << v10) & 0x8810001904) != 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        unint64_t v7 = (0x77EFFFE6FBuLL >> v10) & 1;
      }
    }
    else
    {
      uint64_t v12 = [v3 domain];
      int v13 = [v12 isEqualToString:*MEMORY[0x1E4F19C40]];

      unint64_t v7 = 1;
      if (v13)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        unint64_t v7 = 0;
      }
    }
  }

  return v7;
}

uint64_t __40__NSError_MSErrorUtilities__MSIsCounted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F18F50]];

  if (v5)
  {
    if ([v3 code] != 503)
    {
LABEL_7:
      uint64_t v8 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = [v3 domain];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F73818]];

    if (!v7 || [v3 code] != 16) {
      goto LABEL_7;
    }
  }
  uint64_t v8 = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
LABEL_8:

  return v8;
}

uint64_t __43__NSError_MSErrorUtilities__MSNeedsBackoff__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F18F50]];

  if (v5)
  {
    uint64_t v6 = 1;
    if ((unint64_t)([v3 code] - 600) >= 0xFFFFFFFFFFFFFF9CLL)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      uint64_t v6 = 0;
    }
  }
  else
  {
    int v7 = [v3 domain];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F73818]];

    if (v8)
    {
      unint64_t v9 = [v3 code];
      uint64_t v6 = 1;
      if (v9 <= 0x17 && ((1 << v9) & 0x810040) != 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        uint64_t v6 = (0x7EFFBFu >> v9) & 1;
      }
    }
    else
    {
      uint64_t v6 = 1;
    }
  }

  return v6;
}

uint64_t __54__NSError_MSErrorUtilities__MSIsTemporaryNetworkError__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F18F50]];

  if (!v5)
  {
    int v8 = [v3 domain];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F73818]];

    if (v9)
    {
      unint64_t v10 = [v3 code];
      uint64_t v7 = 1;
      if (v10 > 0x26) {
        goto LABEL_22;
      }
      uint64_t v11 = 1 << v10;
      uint64_t v12 = 0x400000002ALL;
    }
    else
    {
      int v13 = [v3 domain];
      int v14 = [v13 isEqualToString:*MEMORY[0x1E4F28798]];

      if (!v14)
      {
        v16 = [v3 domain];
        int v17 = [v16 isEqualToString:*MEMORY[0x1E4F19C40]];

        if (!v17 || ([v3 code] & 0xFFFFFFFFFFFFFFFELL) != 6)
        {
          uint64_t v7 = 1;
          goto LABEL_22;
        }
        goto LABEL_21;
      }
      uint64_t v15 = [v3 code];
      uint64_t v7 = 1;
      if ((unint64_t)(v15 - 22) > 0x2B) {
        goto LABEL_22;
      }
      uint64_t v11 = 1 << (v15 - 22);
      uint64_t v12 = 0xCC978000401;
    }
    if ((v11 & v12) == 0) {
      goto LABEL_22;
    }
LABEL_21:
    uint64_t v7 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    goto LABEL_22;
  }
  uint64_t v6 = [v3 code];
  uint64_t v7 = 1;
  if (v6 <= -1010)
  {
    if ((unint64_t)(v6 + 1206) >= 7 && v6 != -73000 && v6 != -2000) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if ((unint64_t)(v6 + 1009) <= 8 && ((1 << (v6 - 15)) & 0x179) != 0
    || (unint64_t)(v6 - 1) < 2)
  {
    goto LABEL_21;
  }
LABEL_22:

  return v7;
}

uint64_t __38__NSError_MMCSKit__MMCSRetryAfterDate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F73818]];

  if (v5)
  {
    uint64_t v6 = [v3 userInfo];
    uint64_t v7 = [v6 objectForKey:@"Retry-After"];

    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v12 = 1;
      goto LABEL_13;
    }
    if (kMMCSKitErrorDomain_block_invoke_onceToken != -1) {
      dispatch_once(&kMMCSKitErrorDomain_block_invoke_onceToken, &__block_literal_global_17_5673);
    }
    uint64_t DateFromString = (uint64_t)CFDateFormatterCreateDateFromString(0, (CFDateFormatterRef)kMMCSKitErrorDomain_block_invoke_formatter, v7, 0);
    if (!DateFromString)
    {
      int v9 = [(__CFString *)v7 intValue];
      if (v9 < 1)
      {
LABEL_10:
        uint64_t v12 = 0;
LABEL_13:

        goto LABEL_14;
      }
      uint64_t DateFromString = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)v9];
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = DateFromString;

    goto LABEL_10;
  }
  uint64_t v12 = 1;
LABEL_14:

  return v12;
}

void __38__NSError_MMCSKit__MMCSRetryAfterDate__block_invoke_2()
{
  v0 = CFDateFormatterCreate(0, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  kMMCSKitErrorDomain_block_invoke_formatter = (uint64_t)v0;
  if (v0)
  {
    CFStringRef v1 = (const __CFString *)*MEMORY[0x1E4F1D088];
    v2 = (const void *)*MEMORY[0x1E4F1CFD0];
    CFDateFormatterSetProperty(v0, v1, v2);
  }
}

unint64_t __36__NSError_MMCSKit__MMCSIsFatalError__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F73818]];

  if (v5)
  {
    unint64_t v6 = [v3 code];
    unint64_t v7 = 1;
    if (v6 <= 0x27 && ((1 << v6) & 0x8810001904) != 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      unint64_t v7 = (0x77EFFFE6FBuLL >> v6) & 1;
    }
  }
  else
  {
    unint64_t v7 = 1;
  }

  return v7;
}

uint64_t __44__NSError_MMCSKit__MMCSIsAuthorizationError__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F73818]];

  if (v5)
  {
    uint64_t v6 = 1;
    if ((unint64_t)([v3 code] - 15) >= 0xFFFFFFFFFFFFFFFELL)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __48__NSError_MMCSKit__MMCSIsNetworkConditionsError__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F18F50]];

  if (v5)
  {
    uint64_t v6 = [v3 code];
    uint64_t v7 = 1;
    if (v6 > 0)
    {
      if ((unint64_t)(v6 - 1) >= 2) {
        goto LABEL_19;
      }
    }
    else if (((unint64_t)(v6 + 1009) > 8 || ((1 << (v6 - 15)) & 0x179) == 0) {
           && v6 != -73000
    }
           && v6 != -2000)
    {
      goto LABEL_19;
    }
LABEL_18:
    uint64_t v7 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    goto LABEL_19;
  }
  int v8 = [v3 domain];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F73818]];

  if (v9)
  {
    unint64_t v10 = [v3 code];
    uint64_t v7 = 1;
    if (v10 > 0x26) {
      goto LABEL_19;
    }
    uint64_t v11 = 1 << v10;
    uint64_t v12 = 0x400000002ALL;
    goto LABEL_14;
  }
  int v13 = [v3 domain];
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F28798]];

  if (!v14)
  {
    uint64_t v7 = 1;
    goto LABEL_19;
  }
  uint64_t v15 = [v3 code];
  uint64_t v7 = 1;
  if ((unint64_t)(v15 - 22) <= 0x2B)
  {
    uint64_t v11 = 1 << (v15 - 22);
    uint64_t v12 = 0xCC978000401;
LABEL_14:
    if ((v11 & v12) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_19:

  return v7;
}

uint64_t __37__NSError_MMCSKit__MMCSIsCancelError__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F73818]];

  if (v5)
  {
    uint64_t v6 = 1;
    if ([v3 code] == 4)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __57__NSError_MMCSKit__MMCSErrorWithDomain_code_description___block_invoke()
{
  MMCSErrorWithDomain_code_description__MMCSKitBundle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  return MEMORY[0x1F41817F8]();
}

@end