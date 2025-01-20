@interface NSString(AAAFoundation)
+ (id)URLQueryValueAllowedCharacterSet;
- (id)aaf_base64Padded;
- (id)aaf_toBase64DecodedData;
- (id)aaf_toBase64DecodedString;
- (id)aaf_toBase64EncodedString;
- (id)aaf_toSHA256Data;
- (id)aaf_toSHA256String;
- (id)aaf_urlEncoded;
@end

@implementation NSString(AAAFoundation)

+ (id)URLQueryValueAllowedCharacterSet
{
  if (URLQueryValueAllowedCharacterSet__onceToken != -1) {
    dispatch_once(&URLQueryValueAllowedCharacterSet__onceToken, &__block_literal_global_0);
  }
  v0 = (void *)URLQueryValueAllowedCharacterSet__URLQueryValueAllowedCharacterSet;
  return v0;
}

- (id)aaf_urlEncoded
{
  v2 = [NSString URLQueryValueAllowedCharacterSet];
  v3 = [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];

  return v3;
}

- (id)aaf_toBase64DecodedData
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v3 = objc_msgSend(a1, "aaf_base64Padded");
  v4 = (void *)[v2 initWithBase64EncodedString:v3 options:0];

  return v4;
}

- (id)aaf_toBase64DecodedString
{
  v1 = objc_msgSend(a1, "aaf_toBase64DecodedData");
  id v2 = (void *)[[NSString alloc] initWithData:v1 encoding:4];

  return v2;
}

- (id)aaf_toBase64EncodedString
{
  v1 = [a1 dataUsingEncoding:4 allowLossyConversion:0];
  id v2 = [v1 base64EncodedStringWithOptions:0];

  return v2;
}

- (id)aaf_base64Padded
{
  uint64_t v2 = [a1 length] & 3;
  if (v2 == 3)
  {
    v3 = @"=";
    goto LABEL_5;
  }
  if (v2 == 2)
  {
    v3 = @"==";
LABEL_5:
    id v4 = [a1 stringByAppendingString:v3];
    goto LABEL_7;
  }
  id v4 = a1;
LABEL_7:
  return v4;
}

- (id)aaf_toSHA256Data
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = (const char *)[a1 UTF8String];
  CC_LONG v2 = strlen(v1);
  CC_SHA256(v1, v2, md);
  v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:32];
  return v3;
}

- (id)aaf_toSHA256String
{
  v1 = objc_msgSend(a1, "aaf_toSHA256Data");
  CC_LONG v2 = objc_msgSend(v1, "aaf_toHexString");

  return v2;
}

@end