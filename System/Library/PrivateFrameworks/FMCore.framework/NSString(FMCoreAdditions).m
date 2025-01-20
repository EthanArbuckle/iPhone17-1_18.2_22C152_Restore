@interface NSString(FMCoreAdditions)
- (__CFString)fm_wifiToWLAN;
- (id)fm_decodeHexString;
- (id)fm_encodeToPercentEscape;
- (id)legacyAllowedCharacterSet;
- (uint64_t)fm_isNumeric;
- (uint64_t)fm_stringByReplacingNonBreakingSpaces;
@end

@implementation NSString(FMCoreAdditions)

- (id)fm_encodeToPercentEscape
{
  v2 = [a1 legacyAllowedCharacterSet];
  v3 = [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];

  return v3;
}

- (uint64_t)fm_isNumeric
{
  v2 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:a1];
  uint64_t v4 = [v2 isSupersetOfSet:v3];

  return v4;
}

- (id)fm_decodeHexString
{
  if ([a1 length])
  {
    v11 = 0;
  }
  else
  {
    id v2 = a1;
    uint64_t v3 = [v2 cStringUsingEncoding:1];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    if ([v2 length] >= 1)
    {
      uint64_t v5 = 0;
      uint64_t v6 = MEMORY[0x1E4F14390];
      while (1)
      {
        unsigned __int8 v7 = __toupper(*(char *)(v3 + v5));
        unsigned __int8 v8 = __toupper(*(char *)(v3 + v5 + 1));
        if ((*(_DWORD *)(v6 + 4 * v7 + 60) & 0x10000) == 0 || (*(_DWORD *)(v6 + 4 * v8 + 60) & 0x10000) == 0) {
          break;
        }
        if (v8 <= 0x40u) {
          char v9 = -48;
        }
        else {
          char v9 = -55;
        }
        if (v7 <= 0x40u) {
          char v10 = 16 * v7;
        }
        else {
          char v10 = 16 * v7 - 112;
        }
        char v13 = v10 + v8 + v9;
        [v4 appendBytes:&v13 length:1];
        v5 += 2;
        if (v5 >= [v2 length]) {
          goto LABEL_16;
        }
      }

      id v4 = 0;
    }
LABEL_16:
    v11 = (void *)[v4 copy];
  }
  return v11;
}

- (uint64_t)fm_stringByReplacingNonBreakingSpaces
{
  return [a1 stringByReplacingOccurrencesOfString:@" " withString:@" "];
}

- (__CFString)fm_wifiToWLAN
{
  if (fm_wifiToWLAN___wapiCapabilityToken != -1) {
    dispatch_once(&fm_wifiToWLAN___wapiCapabilityToken, &__block_literal_global_0);
  }
  if (fm_wifiToWLAN___wapi)
  {
    id v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.icloud.FMCore"];
    uint64_t v3 = [v2 preferredLocalizations];
    id v4 = [v3 firstObject];

    uint64_t v5 = @"WLAN";
    uint64_t v6 = [v2 localizedStringForKey:@"WLAN" value:@"WLAN" table:0];
    if ([(id)fm_wifiToWLAN_stripWhitespaceWhitelist containsObject:v4]) {
      unsigned __int8 v7 = @"(\\s?Wi\\-?Fi\\s?)";
    }
    else {
      unsigned __int8 v7 = @"(Wi\\-?Fi)";
    }
    unsigned __int8 v8 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v7 options:1 error:0];
    uint64_t v9 = [a1 length];
    if (v6)
    {
      objc_msgSend(v8, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, v9, v6);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v5 = a1;
  }
  return v5;
}

- (id)legacyAllowedCharacterSet
{
  if (legacyAllowedCharacterSet_once != -1) {
    dispatch_once(&legacyAllowedCharacterSet_once, &__block_literal_global_28);
  }
  v0 = (void *)legacyAllowedCharacterSet_allowedCharSet;
  return v0;
}

@end