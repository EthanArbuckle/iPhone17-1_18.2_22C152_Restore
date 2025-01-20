@interface NSString(MercuryBase64)
- (BOOL)vcp_isMercuryBase64;
- (id)vcp_mercuryBase64ToLocalIdentifier;
@end

@implementation NSString(MercuryBase64)

- (BOOL)vcp_isMercuryBase64
{
  return [a1 length] == 22
      && strspn((const char *)[a1 UTF8String], "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+%") == 22;
}

- (id)vcp_mercuryBase64ToLocalIdentifier
{
  if (objc_msgSend(a1, "vcp_isMercuryBase64"))
  {
    v2 = (void *)[a1 copy];
    v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"%"];
    uint64_t v5 = [v2 rangeOfCharacterFromSet:v3 options:0];
    while (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", @"%", @"/", 0, v5, v4);

      uint64_t v5 = [v6 rangeOfCharacterFromSet:v3 options:0];
      v2 = v6;
    }
    v8 = [v2 stringByAppendingString:@"=="];

    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
    if (v9)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v9, "bytes"));
      v11 = (void *)MEMORY[0x1E4F38EC0];
      v12 = [v10 UUIDString];
      v7 = [v11 localIdentifierWithUUID:v12];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end