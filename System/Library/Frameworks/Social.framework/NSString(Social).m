@interface NSString(Social)
- (id)_SHA256String;
- (id)sl_urlEncodedSHA256;
@end

@implementation NSString(Social)

- (id)sl_urlEncodedSHA256
{
  v1 = [a1 _SHA256String];
  v2 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  v3 = [v1 stringByAddingPercentEncodingWithAllowedCharacters:v2];

  v4 = [v3 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];

  v5 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

  v6 = [v5 stringByReplacingOccurrencesOfString:@"=" withString:&stru_1F1E28690];

  return v6;
}

- (id)_SHA256String
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v1 = (const char *)[a1 UTF8String];
  CC_LONG v2 = strlen(v1);
  CC_SHA256(v1, v2, md);
  v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:32];
  v4 = [v3 base64EncodedStringWithOptions:0];

  return v4;
}

@end