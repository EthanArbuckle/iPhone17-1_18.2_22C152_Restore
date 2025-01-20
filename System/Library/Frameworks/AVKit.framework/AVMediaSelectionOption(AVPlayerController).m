@interface AVMediaSelectionOption(AVPlayerController)
+ (id)avkit_recentAudioLanguageCode;
+ (id)avkit_recentLegibleLanguageCode;
+ (uint64_t)avkit_subtitleAutomaticallyEnabledState;
- (id)avkit_persistentIdentifier;
- (id)avkit_recentLanguageCode;
- (uint64_t)audioLanguageCompare:()AVPlayerController;
- (uint64_t)avkit_isBestChoiceForRecentLanguage;
- (uint64_t)avkit_preferredSortIndex;
- (uint64_t)isAC3Only;
- (uint64_t)isAudio;
- (uint64_t)isAuxiliary;
- (uint64_t)isCC;
- (uint64_t)isEasyReader;
- (uint64_t)isMain;
- (uint64_t)isOriginal;
- (uint64_t)isSDH;
- (uint64_t)languageCompare:()AVPlayerController;
- (void)avkit_setBestChoiceForRecentLanguage:()AVPlayerController;
- (void)avkit_setPreferredSortIndex:()AVPlayerController;
@end

@implementation AVMediaSelectionOption(AVPlayerController)

- (uint64_t)avkit_isBestChoiceForRecentLanguage
{
  v1 = objc_getAssociatedObject(a1, (const void *)_BestChoiceForRecentLanguageKey);
  objc_opt_class();
  uint64_t v2 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v1) {
    uint64_t v2 = [v1 BOOLValue];
  }

  return v2;
}

- (void)avkit_setBestChoiceForRecentLanguage:()AVPlayerController
{
  if (a3) {
    v3 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    v3 = 0;
  }
  objc_setAssociatedObject(a1, (const void *)_BestChoiceForRecentLanguageKey, v3, (void *)1);
}

- (uint64_t)avkit_preferredSortIndex
{
  v1 = objc_getAssociatedObject(a1, (const void *)_PreferredSortIndexKey);
  objc_opt_class();
  uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v1) {
    uint64_t v2 = [v1 integerValue];
  }

  return v2;
}

- (void)avkit_setPreferredSortIndex:()AVPlayerController
{
  v4 = (const void *)_PreferredSortIndexKey;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (const void *)_PreferredSortIndexKey;
    objc_setAssociatedObject(object, v5, 0, (void *)1);
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithInteger:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(object, v4, v6, (void *)1);
  }
}

- (uint64_t)languageCompare:()AVPlayerController
{
  id v4 = a3;
  v5 = [v4 extendedLanguageTag];
  id v6 = [a1 extendedLanguageTag];
  uint64_t v7 = objc_msgSend(v4, "avkit_preferredSortIndex");
  uint64_t v8 = objc_msgSend(a1, "avkit_preferredSortIndex");
  if ([v6 isEqualToString:v5])
  {
    uint64_t v9 = 0;
    goto LABEL_19;
  }
  if ([a1 isOriginal] && !objc_msgSend(v4, "isOriginal"))
  {
    uint64_t v9 = -1;
    goto LABEL_19;
  }
  if ([v4 isOriginal] && !objc_msgSend(a1, "isOriginal")) {
    goto LABEL_17;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v10 = objc_msgSend(a1, "avkit_isBestChoiceForRecentLanguage");
      if (v10 != objc_msgSend(v4, "avkit_isBestChoiceForRecentLanguage"))
      {
        if (objc_msgSend(a1, "avkit_isBestChoiceForRecentLanguage")) {
          uint64_t v9 = -1;
        }
        else {
          uint64_t v9 = 1;
        }
        goto LABEL_19;
      }
LABEL_16:
      v11 = [a1 displayName];
      v12 = [v4 displayName];
      uint64_t v9 = [v11 localizedCaseInsensitiveCompare:v12];

      goto LABEL_19;
    }
LABEL_17:
    uint64_t v9 = 1;
    goto LABEL_19;
  }
  uint64_t v9 = -1;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 <= v8)
  {
    if (v7 == v8) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_19:

  return v9;
}

- (uint64_t)audioLanguageCompare:()AVPlayerController
{
  id v4 = a3;
  int v5 = [a1 isOriginal];
  int v6 = [v4 isOriginal];
  if (v5) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 1;
  }
  if (v5 == v6)
  {
    uint64_t v7 = [a1 languageCompare:v4];
    if (!v7)
    {
      uint64_t v8 = *MEMORY[0x1E4F15B58];
      if ([a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B58]])
      {
        uint64_t v9 = a1;
        uint64_t v10 = v8;
LABEL_11:
        uint64_t v7 = [v9 hasMediaCharacteristic:v10] ^ 1;
        goto LABEL_15;
      }
      uint64_t v11 = *MEMORY[0x1E4F15B38];
      int v12 = [a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B38]];
      char v13 = [v4 hasMediaCharacteristic:v8];
      if (v12)
      {
        if ((v13 & 1) == 0)
        {
          uint64_t v9 = v4;
          uint64_t v10 = v11;
          goto LABEL_11;
        }
      }
      else if ((v13 & 1) == 0 && ![v4 hasMediaCharacteristic:v11])
      {
        uint64_t v7 = 0;
        goto LABEL_15;
      }
      uint64_t v7 = -1;
    }
  }
LABEL_15:

  return v7;
}

- (id)avkit_recentLanguageCode
{
  if ([a1 isAudio]) {
    objc_msgSend(MEMORY[0x1E4F16540], "avkit_recentAudioLanguageCode");
  }
  else {
  v1 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_recentLegibleLanguageCode");
  }

  return v1;
}

- (uint64_t)isOriginal
{
  return [a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B68]];
}

- (uint64_t)isAudio
{
  v1 = [a1 mediaType];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F15BA8]];

  return v2;
}

- (uint64_t)isAuxiliary
{
  return [a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B58]];
}

- (uint64_t)isEasyReader
{
  return [a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B48]];
}

- (uint64_t)isCC
{
  v1 = [a1 mediaType];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F15BC8]];

  return v2;
}

- (uint64_t)isSDH
{
  uint64_t result = [a1 hasMediaCharacteristic:*MEMORY[0x1E4F15B90]];
  if (result)
  {
    uint64_t v3 = *MEMORY[0x1E4F15B30];
    return [a1 hasMediaCharacteristic:v3];
  }
  return result;
}

- (uint64_t)isMain
{
  if ([a1 isEasyReader]) {
    return 0;
  }
  else {
    return [a1 isAuxiliary] ^ 1;
  }
}

- (uint64_t)isAC3Only
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 mediaSubTypes];
  uint64_t v3 = [v2 count];

  if (!v3) {
    return 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(a1, "mediaSubTypes", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) unsignedIntValue];
        if (v9 != 1885430579 && v9 != 1633889587)
        {
          uint64_t v11 = 0;
          goto LABEL_16;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  uint64_t v11 = 1;
LABEL_16:

  return v11;
}

- (id)avkit_persistentIdentifier
{
  uint64_t v2 = [a1 propertyList];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = [a1 propertyList];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"MediaSelectionOptionsPersistentID"];
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = &unk_1F0949D88;
  }
  id v7 = v6;

  return v7;
}

+ (uint64_t)avkit_subtitleAutomaticallyEnabledState
{
  v0 = +[AVKitGlobalSettings shared];
  uint64_t v1 = [v0 subtitleAutomaticallyEnabledState];

  return v1;
}

+ (id)avkit_recentLegibleLanguageCode
{
  v0 = +[AVKitGlobalSettings shared];
  uint64_t v1 = [v0 mostRecentLegibleLanguageCode];

  return v1;
}

+ (id)avkit_recentAudioLanguageCode
{
  v0 = +[AVKitGlobalSettings shared];
  uint64_t v1 = [v0 mostRecentAudioLanguageCode];

  return v1;
}

@end