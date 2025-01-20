@interface AVMediaSelectionOption(MPNowPlayingInfoLanguageOptionAdditions)
- (MPNowPlayingInfoLanguageOption)makeNowPlayingInfoLanguageOption;
- (id)_languageOptionIdentifier;
@end

@implementation AVMediaSelectionOption(MPNowPlayingInfoLanguageOptionAdditions)

- (id)_languageOptionIdentifier
{
  v2 = NSString;
  uint64_t v3 = [a1 extendedLanguageTag];
  v4 = (void *)v3;
  v5 = @"NULL";
  if (v3) {
    v6 = (__CFString *)v3;
  }
  else {
    v6 = @"NULL";
  }
  uint64_t v7 = [a1 mediaType];
  v8 = (void *)v7;
  if (v7) {
    v5 = (__CFString *)v7;
  }
  uint64_t v9 = [a1 displayName];
  v10 = (void *)v9;
  v11 = @"?";
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v12 = [v2 stringWithFormat:@"MediaRemoteLanguageOption/%@/%@ \"%@\"", v6, v5, v11];

  return v12;
}

- (MPNowPlayingInfoLanguageOption)makeNowPlayingInfoLanguageOption
{
  if ([a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B00]])
  {
    uint64_t v2 = 0;
  }
  else
  {
    if (![a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B80]])
    {
      v18 = 0;
      goto LABEL_32;
    }
    uint64_t v2 = 1;
  }
  if (objc_opt_respondsToSelector())
  {
    id v3 = [a1 mediaCharacteristics];
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *MEMORY[0x1E4F15B60];
    if ([a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B60]]) {
      [v3 addObject:v4];
    }
    uint64_t v5 = *MEMORY[0x1E4F15B58];
    if ([a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B58]]) {
      [v3 addObject:v5];
    }
    uint64_t v6 = *MEMORY[0x1E4F15B20];
    if ([a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B20]]) {
      [v3 addObject:v6];
    }
    uint64_t v7 = *MEMORY[0x1E4F15B90];
    if ([a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B90]]) {
      [v3 addObject:v7];
    }
    uint64_t v8 = *MEMORY[0x1E4F15B30];
    if ([a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B30]]) {
      [v3 addObject:v8];
    }
    uint64_t v9 = *MEMORY[0x1E4F15B38];
    if ([a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B38]]) {
      [v3 addObject:v9];
    }
    uint64_t v10 = *MEMORY[0x1E4F15B48];
    if ([a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B48]]) {
      [v3 addObject:v10];
    }
    uint64_t v11 = *MEMORY[0x1E4F15B78];
    if ([a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B78]]) {
      [v3 addObject:v11];
    }
    uint64_t v12 = *MEMORY[0x1E4F15B40];
    if ([a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B40]]) {
      [v3 addObject:v12];
    }
    uint64_t v13 = *MEMORY[0x1E4F15BA0];
    if ([a1 hasMediaCharacteristic:*MEMORY[0x1E4F15BA0]]) {
      [v3 addObject:v13];
    }
  }
  if (v3 && ![v3 count])
  {

    id v3 = 0;
  }
  v14 = [MPNowPlayingInfoLanguageOption alloc];
  v15 = [a1 extendedLanguageTag];
  v16 = [a1 displayName];
  v17 = [a1 _languageOptionIdentifier];
  v18 = [(MPNowPlayingInfoLanguageOption *)v14 initWithType:v2 languageTag:v15 characteristics:v3 displayName:v16 identifier:v17];

LABEL_32:

  return v18;
}

@end