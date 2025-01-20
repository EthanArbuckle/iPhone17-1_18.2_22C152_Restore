@interface NSData(AuthKit)
+ (id)ak_dataWithBase64UrlEncodedString:()AuthKit;
- (id)ak_SHA256Data;
@end

@implementation NSData(AuthKit)

- (id)ak_SHA256Data
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v2 = CC_SHA256((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  if (v2)
  {
    v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:32];
  }

  return v2;
}

+ (id)ak_dataWithBase64UrlEncodedString:()AuthKit
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
  v4 = [v3 stringByReplacingOccurrencesOfString:@"-" withString:@"+"];

  uint64_t v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[NSData(AuthKit) ak_dataWithBase64UrlEncodedString:]((uint64_t)v4, v5);
  }

  v6 = objc_msgSend(v4, "aaf_toBase64DecodedData");

  return v6;
}

+ (void)ak_dataWithBase64UrlEncodedString:()AuthKit .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_193494000, a2, OS_LOG_TYPE_DEBUG, "Base64 encoded string after replacement: %{private}@", (uint8_t *)&v2, 0xCu);
}

@end