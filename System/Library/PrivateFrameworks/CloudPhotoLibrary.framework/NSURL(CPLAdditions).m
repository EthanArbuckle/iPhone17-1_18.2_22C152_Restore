@interface NSURL(CPLAdditions)
- (id)cpl_redactedShareURL;
@end

@implementation NSURL(CPLAdditions)

- (id)cpl_redactedShareURL
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [a1 host];
  if ([v2 isEqualToString:@"redacted.icloud.com"])
  {
    id v3 = a1;
  }
  else
  {
    id v4 = [a1 absoluteString];
    v5 = (const char *)[v4 UTF8String];

    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    CC_LONG v6 = strlen(v5);
    CC_SHA256_Update(&c, v5, v6);
    CC_SHA256_Final(md, &c);
    v7 = [MEMORY[0x1E4F28E78] stringWithCapacity:32];
    for (uint64_t i = 0; i != 32; ++i)
      objc_msgSend(v7, "appendFormat:", @"%02x", md[i]);
    v9 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://redacted.icloud.com/photos"];
    id v3 = [v9 URLByAppendingPathComponent:v7];
  }
  return v3;
}

@end