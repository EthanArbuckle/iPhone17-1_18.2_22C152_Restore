@interface NSString(MFStringUtils)
+ (id)mf_stringWithData:()MFStringUtils encoding:;
- (uint64_t)mf_caseInsensitiveCompareExcludingXDash:()MFStringUtils;
- (uint64_t)mf_copyDisplayString;
- (uint64_t)mf_copyDisplayStringInRange:()MFStringUtils;
- (uint64_t)mf_dataUsingEncoding:()MFStringUtils;
- (void)mf_dataUsingEncoding:()MFStringUtils allowLossyConversion:;
@end

@implementation NSString(MFStringUtils)

- (uint64_t)mf_caseInsensitiveCompareExcludingXDash:()MFStringUtils
{
  if (a1 == a3) {
    return 0;
  }
  if (!a3) {
    return 1;
  }
  uint64_t v5 = [a1 rangeOfString:@"x-" options:9];
  uint64_t v7 = v6;
  uint64_t v8 = [a3 rangeOfString:@"x-" options:9];
  if ((v7 != 0) != (v9 != 0))
  {
    if (v7)
    {
      uint64_t v10 = v5 + v7;
      uint64_t v11 = [a1 length] - v10;
      return objc_msgSend(a1, "compare:options:range:", a3, 9, v10, v11);
    }
    uint64_t result = objc_msgSend(a3, "compare:options:range:", a1, 9, v8 + v9, objc_msgSend(a3, "length") - (v8 + v9));
    if (result != -1)
    {
      if (result == 1) {
        return -1;
      }
      return result;
    }
    return 1;
  }
  return [a1 compare:a3 options:1];
}

- (void)mf_dataUsingEncoding:()MFStringUtils allowLossyConversion:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFIndex v7 = [(__CFString *)a1 length];
  CFIndex v18 = 0xAAAAAAAAAAAAAAAALL;
  CFStringEncoding v8 = CFStringConvertNSStringEncodingToEncoding(a3);
  if (!CFStringIsEncodingAvailable(v8))
  {
    v16 = MFLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v20 = a3;
      _os_log_impl(&dword_1AFB03000, v16, OS_LOG_TYPE_DEFAULT, "#Warning Unknown encoding %lu", buf, 0xCu);
    }
    return 0;
  }
  if (a3 == 1) {
    char v9 = -1;
  }
  else {
    char v9 = 63;
  }
  if (a4) {
    UInt8 v10 = v9;
  }
  else {
    UInt8 v10 = 0;
  }
  v22.location = 0;
  v22.length = v7;
  uint64_t v11 = 0;
  if (MFStringGetBytes(a1, v22, v8, v10, 1u, 0, 0, &v18) == v7)
  {
    id v12 = objc_allocWithZone((Class)MFMutableData);
    v13 = (void *)[v12 initWithLength:v18];
    uint64_t v11 = v13;
    if (!v18)
    {
LABEL_12:
      id v15 = v11;
      return v11;
    }
    v14 = (UInt8 *)[v13 mutableBytes];
    v23.location = 0;
    v23.length = v7;
    if (MFStringGetBytes(a1, v23, v8, v10, 1u, v14, v18, &v18) == v7)
    {
      [v11 setLength:v18];
      goto LABEL_12;
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@: didn't convert all characters", _NSMethodExceptionProem() format];

    return 0;
  }
  return v11;
}

- (uint64_t)mf_dataUsingEncoding:()MFStringUtils
{
  return objc_msgSend(a1, "mf_dataUsingEncoding:allowLossyConversion:", a3, 0);
}

+ (id)mf_stringWithData:()MFStringUtils encoding:
{
  if (!a3) {
    return 0;
  }
  v4 = (void *)[[NSString alloc] initWithData:a3 encoding:a4];
  return v4;
}

- (uint64_t)mf_copyDisplayStringInRange:()MFStringUtils
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0)
  {
    CFIndex v7 = objc_msgSend(a1, "substringWithRange:");
    uint64_t v8 = objc_msgSend(v7, "_lp_userVisibleHost");
    if (([v7 isEqualToString:v8] & 1) == 0) {
      return [[NSString alloc] initWithFormat:@"%@%@", objc_msgSend(a1, "substringWithRange:", 0, a3), v8];
    }
  }
  return [a1 copy];
}

- (uint64_t)mf_copyDisplayString
{
  uint64_t v2 = [a1 length];
  return objc_msgSend(a1, "mf_copyDisplayStringInRange:", 0, v2);
}

@end