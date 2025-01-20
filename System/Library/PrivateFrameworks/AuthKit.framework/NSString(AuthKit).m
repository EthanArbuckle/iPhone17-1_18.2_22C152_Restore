@interface NSString(AuthKit)
+ (id)ak_base64EncodedJsonFromObject:()AuthKit;
- (id)ak_numberObject;
- (id)ak_safeBase64String;
- (id)ak_stringByZeroPaddingOccurencesOfString:()AuthKit;
- (id)ak_truncatedCopy;
- (uint64_t)ak_isEmailAddress;
- (void)ak_safeBase64String;
@end

@implementation NSString(AuthKit)

+ (id)ak_base64EncodedJsonFromObject:()AuthKit
{
  id v8 = 0;
  v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:0 error:&v8];
  id v4 = v8;
  if (v4)
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[NSString(AuthKit) ak_base64EncodedJsonFromObject:]((uint64_t)v4, v5);
    }

    v6 = 0;
  }
  else
  {
    v6 = [v3 base64EncodedStringWithOptions:0];
  }

  return v6;
}

- (id)ak_truncatedCopy
{
  v1 = (void *)[a1 copy];
  if ((unint64_t)[v1 length] >= 7)
  {
    v2 = NSString;
    v3 = [v1 substringToIndex:6];
    uint64_t v4 = [v2 stringWithFormat:@"%@...", v3];

    v1 = (void *)v4;
  }

  return v1;
}

- (id)ak_stringByZeroPaddingOccurencesOfString:()AuthKit
{
  uint64_t v4 = NSString;
  id v5 = a3;
  v6 = [v4 stringWithFormat:@"​%@", v5];
  v7 = [a1 stringByReplacingOccurrencesOfString:v5 withString:v6];

  return v7;
}

- (id)ak_safeBase64String
{
  if ([a1 length]
    && (objc_msgSend(a1, "substringFromIndex:", objc_msgSend(a1, "length") - 1),
        v2 = objc_claimAutoreleasedReturnValue(),
        char v3 = [v2 isEqualToString:@"="],
        v2,
        (v3 & 1) == 0))
  {
    [NSString stringWithFormat:@"%@==", a1];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(NSString(AuthKit) *)(uint64_t)v4 ak_safeBase64String];
    }
  }
  else
  {
    id v4 = a1;
  }

  return v4;
}

- (id)ak_numberObject
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v2 setNumberStyle:1];
  char v3 = [v2 numberFromString:a1];

  return v3;
}

- (uint64_t)ak_isEmailAddress
{
  id v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF MATCHES %@", @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"];
  uint64_t v3 = [v2 evaluateWithObject:a1];

  return v3;
}

+ (void)ak_base64EncodedJsonFromObject:()AuthKit .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Error converting object to json string: %@", (uint8_t *)&v2, 0xCu);
}

- (void)ak_safeBase64String
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_193494000, a2, OS_LOG_TYPE_DEBUG, "Adding padding to the string: %{private}@", (uint8_t *)&v2, 0xCu);
}

@end