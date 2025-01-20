@interface NSString(UserNotifications)
- (__CFString)un_logDigest;
- (uint64_t)un_isFirstPartyIdentifier;
@end

@implementation NSString(UserNotifications)

- (uint64_t)un_isFirstPartyIdentifier
{
  return [a1 hasPrefix:@"com.apple."];
}

- (__CFString)un_logDigest
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v2 = (const char *)[v1 UTF8String];
  if (v2
    || [v1 length]
    && ([v1 dataUsingEncoding:1 allowLossyConversion:1],
        v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = (id) [[NSString alloc] initWithData:v5 encoding:4],
        v2 = (const char *)[v6 UTF8String],
        v6,
        v5,
        v2))
  {
    CC_LONG v3 = strlen(v2);
    v4 = (__CFString *)CC_SHA1(v2, v3, md);
    if (v4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%02X%02X-%02X%02X", md[0], md[1], md[2], md[3]);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"<Unicode conversion error>";
  }

  return v4;
}

@end