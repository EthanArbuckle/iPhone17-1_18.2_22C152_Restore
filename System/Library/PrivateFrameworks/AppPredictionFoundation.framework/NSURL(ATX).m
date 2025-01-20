@interface NSURL(ATX)
- (id)schemelessAbsoluteString;
- (uint64_t)atx_isOpenableFaceTimeURL;
- (void)atx_isOpenableFaceTimeURL;
@end

@implementation NSURL(ATX)

- (uint64_t)atx_isOpenableFaceTimeURL
{
  v1 = [a1 host];
  int v2 = [v1 isEqualToString:@"facetime.apple.com"];

  if (v2)
  {
    id v10 = 0;
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.facetime" allowPlaceholder:1 error:&v10];
    id v4 = v10;
    if (v3)
    {
      v5 = [v3 applicationState];
      if ([v5 isInstalled]
        && ([v5 isRestricted] & 1) == 0
        && ([MEMORY[0x1E4F93B08] isFaceTimeSupported] & 1) != 0)
      {
        uint64_t v6 = 1;
LABEL_14:

        return v6;
      }
      v7 = __atxlog_handle_default();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D0F2B000, v7, OS_LOG_TYPE_DEFAULT, "isOpenableFaceTimeURL: not allowed", v9, 2u);
      }
    }
    else
    {
      v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(NSURL(ATX) *)(uint64_t)v4 atx_isOpenableFaceTimeURL];
      }
    }
    uint64_t v6 = 0;
    goto LABEL_14;
  }
  return 0;
}

- (id)schemelessAbsoluteString
{
  v1 = [a1 resourceSpecifier];
  if ([v1 hasPrefix:@"//"])
  {
    uint64_t v2 = [v1 substringFromIndex:objc_msgSend(@"//", "length")];

    v1 = (void *)v2;
  }
  return v1;
}

- (void)atx_isOpenableFaceTimeURL
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F2B000, a2, OS_LOG_TYPE_ERROR, "isOpenableFaceTimeURL: could not obtain record: %@", (uint8_t *)&v2, 0xCu);
}

@end