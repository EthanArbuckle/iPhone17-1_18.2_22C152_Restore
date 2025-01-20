@interface AVMediaSelectionOption
+ (BOOL)_plistHasOptionIdentifier:(id)a3;
+ (id)mediaSelectionNilOptionForGroup:(id)a3;
+ (id)mediaSelectionOptionForAsset:(id)a3 group:(id)a4 dictionary:(id)a5 hasUnderlyingTrack:(BOOL)a6;
- (AVMediaSelectionOption)associatedMediaSelectionOptionInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup;
- (AVMediaSelectionOption)init;
- (AVMediaSelectionOption)initWithGroup:(id)a3;
- (AVMediaType)mediaType;
- (BOOL)_isAuxiliaryContent;
- (BOOL)_isDesignatedDefault;
- (BOOL)_isMainProgramContent;
- (BOOL)_representsNilSelection;
- (BOOL)_updateDisplayNameWithLocale:(id)a3 fallingBackToMatchingUndeterminedAndMultilingual:(BOOL)a4 context:(int64_t)a5;
- (BOOL)displaysNonForcedSubtitles;
- (BOOL)hasMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic;
- (BOOL)isPlayable;
- (NSArray)_audioCompositionPresetIndexesForFallbackIDs;
- (NSArray)availableMetadataFormats;
- (NSArray)commonMetadata;
- (NSArray)mediaSubTypes;
- (NSArray)metadataForFormat:(NSString *)format;
- (NSLocale)locale;
- (NSNumber)_audioCompositionPresetIndex;
- (NSString)displayName;
- (NSString)displayNameWithLocale:(NSLocale *)locale;
- (NSString)extendedLanguageTag;
- (NSString)unicodeLanguageCode;
- (NSString)unicodeLanguageIdentifier;
- (id)_ancillaryDescription;
- (id)_displayNameWithLocale:(id)a3 fallingBackToMatchingUndeterminedAndMultilingual:(BOOL)a4;
- (id)_groupID;
- (id)_groupMediaCharacteristics;
- (id)_groupMediaType;
- (id)_languageDisplayNameFromMetadataAccordingToPreferredLanguages:(id)a3 fallingBackToMatchingEmptyLocale:(BOOL)a4;
- (id)_preferredMetadataTitleAccordingToPreferredLanguages:(id)a3 fallingBackToMatchingEmptyLocale:(BOOL)a4 excludeM3U8Metadata:(BOOL)a5;
- (id)_taggedMediaCharacteristics;
- (id)_title;
- (id)_track;
- (id)associatedExtendedLanguageTag;
- (id)associatedPersistentIDs;
- (id)associatedUnicodeLanguageIdentifier;
- (id)description;
- (id)dictionary;
- (id)fallbackIDs;
- (id)group;
- (id)languageCode;
- (id)mediaCharacteristics;
- (id)optionID;
- (id)outOfBandIdentifier;
- (id)outOfBandSource;
- (id)propertyList;
- (id)track;
- (int)trackID;
- (void)dealloc;
@end

@implementation AVMediaSelectionOption

- (void)dealloc
{
  mediaSelectionOption = self->_mediaSelectionOption;
  if (mediaSelectionOption)
  {
  }
  v4.receiver = self;
  v4.super_class = (Class)AVMediaSelectionOption;
  [(AVMediaSelectionOption *)&v4 dealloc];
}

- (BOOL)_isDesignatedDefault
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  v3 = (void *)[v2 objectForKey:*MEMORY[0x1E4F34778]];
  return [v3 BOOLValue];
}

+ (id)mediaSelectionOptionForAsset:(id)a3 group:(id)a4 dictionary:(id)a5 hasUnderlyingTrack:(BOOL)a6
{
  v6 = off_1E57AD820;
  if (!a6) {
    v6 = off_1E57AD810;
  }
  v7 = (void *)[objc_alloc(*v6) initWithAsset:a3 group:a4 dictionary:a5];
  return v7;
}

+ (id)mediaSelectionNilOptionForGroup:(id)a3
{
  v3 = [[AVMediaSelectionNilOption alloc] initWithGroup:a3];
  return v3;
}

- (AVMediaSelectionOption)initWithGroup:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVMediaSelectionOption;
  objc_super v4 = [(AVMediaSelectionOption *)&v7 init];
  if (v4)
  {
    v5 = objc_alloc_init(AVMediaSelectionOptionInternal);
    v4->_mediaSelectionOption = v5;
    if (v5)
    {
      v4->_mediaSelectionOption->_groupMediaCharacteristics = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "_groupMediaCharacteristics"), "copy");
      v4->_mediaSelectionOption->_synthesizeMediaCharacteristicsOnce = objc_alloc_init(AVDispatchOnce);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (id)propertyList
{
  id v3 = [(AVMediaSelectionOption *)self optionID];
  id v4 = [(AVMediaSelectionOption *)self outOfBandIdentifier];
  id v5 = [(AVMediaSelectionOption *)self outOfBandSource];
  v6 = [(AVMediaSelectionOption *)self _audioCompositionPresetIndex];
  objc_super v7 = [(AVMediaSelectionOption *)self _audioCompositionPresetIndexesForFallbackIDs];
  if (!v3 && !v4 && !v5) {
    goto LABEL_17;
  }
  v8 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  [v8 setValue:v3 forKey:*MEMORY[0x1E4F347A0]];
  [v8 setValue:v4 forKey:*MEMORY[0x1E4F34750]];
  [v8 setValue:v5 forKey:*MEMORY[0x1E4F347B0]];
  [v8 setValue:v6 forKey:*MEMORY[0x1E4F34740]];
  [v8 setValue:v7 forKey:*MEMORY[0x1E4F34748]];
  id v9 = [(AVMediaSelectionOption *)self _groupID];
  id v10 = [(AVMediaSelectionOption *)self _groupMediaType];
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E4F34708];
    id v12 = v9;
  }
  else
  {
    id v12 = v10;
    if (!v10) {
      goto LABEL_9;
    }
    v11 = (void *)MEMORY[0x1E4F34718];
  }
  [v8 setObject:v12 forKey:*v11];
LABEL_9:
  if (([(NSString *)[(AVMediaSelectionOption *)self mediaType] isEqualToString:@"sbtl"]|| [(NSString *)[(AVMediaSelectionOption *)self mediaType] isEqualToString:@"text"])&& [(AVMediaSelectionOption *)self displaysNonForcedSubtitles])
  {
    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v8 setObject:v13 forKey:*MEMORY[0x1E4F34758]];
  }
  id v14 = [(AVMediaSelectionOption *)self dictionary];
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E4F34798]), *MEMORY[0x1E4F34798]);
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E4F34780]), *MEMORY[0x1E4F34780]);
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E4F34760]), *MEMORY[0x1E4F34760]);
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E4F347A8]), *MEMORY[0x1E4F347A8]);
  if (v8)
  {
    v15 = (void *)[v8 copy];
    return v15;
  }
LABEL_17:
  v17 = (void *)MEMORY[0x1E4F1C9E8];
  return (id)[v17 dictionary];
}

- (id)outOfBandSource
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F347B0];
  return (id)[v2 objectForKey:v3];
}

- (id)outOfBandIdentifier
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F34750];
  return (id)[v2 objectForKey:v3];
}

- (id)optionID
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F347A0];
  return (id)[v2 objectForKey:v3];
}

- (NSArray)_audioCompositionPresetIndexesForFallbackIDs
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F34748];
  return (NSArray *)[v2 objectForKey:v3];
}

- (NSNumber)_audioCompositionPresetIndex
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F34740];
  return (NSNumber *)[v2 objectForKey:v3];
}

+ (BOOL)_plistHasOptionIdentifier:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if ([a3 objectForKey:*MEMORY[0x1E4F347A0]]
    || [a3 objectForKey:*MEMORY[0x1E4F34750]])
  {
    return 1;
  }
  return [a3 objectForKey:*MEMORY[0x1E4F347B0]] != 0;
}

- (AVMediaSelectionOption)init
{
  return [(AVMediaSelectionOption *)self initWithGroup:0];
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, language = %@%@>", NSStringFromClass(v4), self, -[AVMediaSelectionOption extendedLanguageTag](self, "extendedLanguageTag"), -[AVMediaSelectionOption _ancillaryDescription](self, "_ancillaryDescription")];
}

- (id)_ancillaryDescription
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AVMediaSelectionOption *)self mediaType];
  id v40 = [(AVMediaSelectionOption *)self group];
  id v4 = [(AVMediaSelectionOption *)self _title];
  id v5 = [(AVMediaSelectionOption *)self _taggedMediaCharacteristics];
  id v6 = [(AVMediaSelectionOption *)self associatedExtendedLanguageTag];
  id v7 = v6;
  if (v4)
  {
    v45 = (__CFString *)[NSString stringWithFormat:@", title = %@", v4];
    if (v7)
    {
LABEL_3:
      v44 = (__CFString *)[NSString stringWithFormat:@", associated language = %@", v7];
      goto LABEL_6;
    }
  }
  else
  {
    v45 = &stru_1EE5953B8;
    if (v6) {
      goto LABEL_3;
    }
  }
  v44 = &stru_1EE5953B8;
LABEL_6:
  if ([v5 count])
  {
    v8 = (void *)[MEMORY[0x1E4F28E78] stringWithString:&stru_1EE5953B8];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v9 = [v5 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v48 != v12) {
            objc_enumerationMutation(v5);
          }
          uint64_t v14 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          if (-v11 != i) {
            [v8 appendString:@", "];
          }
          [v8 appendString:v14];
        }
        v11 += v10;
        uint64_t v10 = [v5 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v10);
    }
    v15 = (__CFString *)[NSString stringWithFormat:@", tagged media characteristics = {%@}", v8];
  }
  else
  {
    v15 = &stru_1EE5953B8;
  }
  BOOL v16 = [(AVMediaSelectionOption *)self _isDesignatedDefault];
  BOOL v17 = [(AVMediaSelectionOption *)self _isAuxiliaryContent];
  id v18 = [(AVMediaSelectionOption *)self fallbackIDs];
  if (v18)
  {
    v19 = v18;
    BOOL v42 = v16;
    v20 = (void *)[MEMORY[0x1E4F28E78] stringWithString:&stru_1EE5953B8];
    uint64_t v21 = [v19 count];
    if (v21)
    {
      uint64_t v22 = v21;
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (j) {
          [v20 appendString:@", "];
        }
        [v20 appendString:objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend((id)objc_msgSend(v19, "objectAtIndex:", j), "integerValue"))];
      }
    }
    v24 = (__CFString *)[NSString stringWithFormat:@", fallback track or variant IDs = {%@}", v20];
    BOOL v16 = v42;
  }
  else
  {
    v24 = &stru_1EE5953B8;
  }
  if ([(NSString *)v3 isEqualToString:@"sbtl"]
    || [(NSString *)v3 isEqualToString:@"text"])
  {
    if ([(AVMediaSelectionOption *)self hasMediaCharacteristic:@"public.subtitles.forced-only"])
    {
      v25 = @", forced subtitles only";
      goto LABEL_42;
    }
    if (v40)
    {
      v26 = -[AVMediaSelectionOption associatedMediaSelectionOptionInMediaSelectionGroup:](self, "associatedMediaSelectionOptionInMediaSelectionGroup:");
      if (v26)
      {
        v27 = v26;
        v28 = NSString;
        v29 = (objc_class *)objc_opt_class();
        v25 = (__CFString *)[v28 stringWithFormat:@", associated forced-only option = <%@: %p>", NSStringFromClass(v29), v27];
        goto LABEL_42;
      }
    }
    goto LABEL_40;
  }
  if (![(NSString *)v3 isEqualToString:@"soun"])
  {
LABEL_40:
    v25 = &stru_1EE5953B8;
    goto LABEL_42;
  }
  v30 = [(AVMediaSelectionOption *)self mediaSubTypes];
  uint64_t v31 = [(NSArray *)v30 count];
  if (v31)
  {
    uint64_t v32 = v31;
    BOOL v41 = v17;
    v43 = v3;
    v33 = (void *)[MEMORY[0x1E4F28E78] stringWithString:&stru_1EE5953B8];
    for (uint64_t k = 0; k != v32; ++k)
    {
      unsigned int valuePtr = 0;
      CFNumberGetValue((CFNumberRef)[(NSArray *)v30 objectAtIndex:k], kCFNumberSInt32Type, &valuePtr);
      unsigned int v35 = valuePtr;
      if (k) {
        [v33 appendString:@", "];
      }
      int v36 = bswap32(v35);
      [v33 appendString:objc_msgSend(NSString, "stringWithFormat:", @"'%c%c%c%c'", (char)v36, ((__int16)v36 >> 8), (v36 << 8 >> 24), (v36 >> 24))];
    }
    v25 = (__CFString *)[NSString stringWithFormat:@", mediaSubTypes = {%@}", v33];
    uint64_t v3 = v43;
    BOOL v17 = v41;
  }
  else
  {
    v25 = &stru_1EE5953B8;
  }
LABEL_42:
  if (v17) {
    v37 = @", auxiliary = YES";
  }
  else {
    v37 = &stru_1EE5953B8;
  }
  if (v16) {
    v38 = @", default = YES";
  }
  else {
    v38 = &stru_1EE5953B8;
  }
  return (id)[NSString stringWithFormat:@", mediaType = '%@'%@%@%@%@%@%@%@", v3, v25, v24, v15, v45, v38, v37, v44];
}

- (id)dictionary
{
  return 0;
}

- (id)group
{
  return 0;
}

- (id)_groupID
{
  return 0;
}

- (id)_groupMediaType
{
  return 0;
}

- (id)_groupMediaCharacteristics
{
  return self->_mediaSelectionOption->_groupMediaCharacteristics;
}

- (AVMediaType)mediaType
{
  return (AVMediaType)[NSString string];
}

- (NSArray)mediaSubTypes
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  id v4 = [(AVMediaSelectionOption *)self dictionary];
  id v5 = (void *)[v4 objectForKey:*MEMORY[0x1E4F34788]];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = v3;
          uint64_t v12 = v10;
LABEL_11:
          [(NSArray *)v11 addObject:v12];
          goto LABEL_12;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:AVOSTypeForString(v10)];
          if (v13)
          {
            uint64_t v12 = (void *)v13;
            uint64_t v11 = v3;
            goto LABEL_11;
          }
        }
LABEL_12:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  return v3;
}

- (id)_track
{
  return 0;
}

- (BOOL)_isAuxiliaryContent
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = (void *)[v2 objectForKey:*MEMORY[0x1E4F34770]];
  return [v3 BOOLValue];
}

- (BOOL)_isMainProgramContent
{
  return ![(AVMediaSelectionOption *)self _isAuxiliaryContent];
}

- (id)_taggedMediaCharacteristics
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F347A8];
  return (id)[v2 objectForKey:v3];
}

- (BOOL)hasMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  id v4 = [(AVMediaSelectionOption *)self mediaCharacteristics];
  return [v4 containsObject:mediaCharacteristic];
}

- (id)mediaCharacteristics
{
  synthesizeMediaCharacteristicsOnce = self->_mediaSelectionOption->_synthesizeMediaCharacteristicsOnce;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AVMediaSelectionOption_mediaCharacteristics__block_invoke;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  [(AVDispatchOnce *)synthesizeMediaCharacteristicsOnce runBlockOnce:v5];
  return self->_mediaSelectionOption->_optionMediaCharacteristics;
}

id __46__AVMediaSelectionOption_mediaCharacteristics__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _groupMediaCharacteristics]) {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:");
  }
  else {
    uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  }
  uint64_t v3 = (void *)v2;
  uint64_t v4 = objc_msgSend(+[AVAssetTrack mediaCharacteristicsForMediaTypes](AVAssetTrack, "mediaCharacteristicsForMediaTypes"), "objectForKey:", objc_msgSend(*(id *)(a1 + 32), "mediaType"));
  if (v4) {
    [v3 addObjectsFromArray:v4];
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_track"), "mediaCharacteristics");
  if (v5) {
    [v3 addObjectsFromArray:v5];
  }
  uint64_t v6 = [*(id *)(a1 + 32) _taggedMediaCharacteristics];
  if (v6) {
    [v3 addObjectsFromArray:v6];
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "mediaType"), "isEqualToString:", @"sbtl")
    && ([*(id *)(a1 + 32) displaysNonForcedSubtitles] & 1) == 0)
  {
    [v3 addObject:@"public.subtitles.forced-only"];
  }
  int v7 = [*(id *)(a1 + 32) _isAuxiliaryContent];
  uint64_t v8 = &AVMediaCharacteristicIsAuxiliaryContent;
  if (!v7) {
    uint64_t v8 = &AVMediaCharacteristicIsMainProgramContent;
  }
  [v3 addObject:*v8];
  id result = (id)[v3 allObjects];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = result;
  return result;
}

- (BOOL)isPlayable
{
  return 1;
}

- (NSLocale)locale
{
  return 0;
}

- (NSString)extendedLanguageTag
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F34760];
  return (NSString *)[v2 objectForKey:v3];
}

- (NSString)unicodeLanguageIdentifier
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F347C0];
  return (NSString *)[v2 objectForKey:v3];
}

- (id)associatedExtendedLanguageTag
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F34728];
  return (id)[v2 objectForKey:v3];
}

- (id)associatedUnicodeLanguageIdentifier
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F34738];
  return (id)[v2 objectForKey:v3];
}

- (id)languageCode
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F34780];
  return (id)[v2 objectForKey:v3];
}

- (NSString)unicodeLanguageCode
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F347B8];
  return (NSString *)[v2 objectForKey:v3];
}

- (id)associatedPersistentIDs
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F34730];
  return (id)[v2 objectForKey:v3];
}

- (id)fallbackIDs
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F34768];
  return (id)[v2 objectForKey:v3];
}

- (BOOL)displaysNonForcedSubtitles
{
  id v2 = [(AVMediaSelectionOption *)self dictionary];
  uint64_t v3 = (void *)[v2 objectForKey:*MEMORY[0x1E4F34758]];
  return [v3 BOOLValue];
}

- (BOOL)_representsNilSelection
{
  return 0;
}

- (NSArray)commonMetadata
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (id)_title
{
  id v2 = +[AVMetadataItem metadataItemsFromArray:[(AVMediaSelectionOption *)self commonMetadata] withKey:@"title" keySpace:@"comn"];
  id v3 = [(NSArray *)v2 count];
  if (v3)
  {
    uint64_t v4 = +[AVMetadataItem metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:](AVMetadataItem, "metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:", v2, [MEMORY[0x1E4F1CA20] preferredLanguages]);
    if ([(NSArray *)v4 count]) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = v2;
    }
    id v3 = [(NSArray *)v5 objectAtIndex:0];
  }
  return (id)[v3 stringValue];
}

- (NSArray)availableMetadataFormats
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (NSArray)metadataForFormat:(NSString *)format
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "array", format);
}

- (AVMediaSelectionOption)associatedMediaSelectionOptionInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = [(AVMediaSelectionOption *)self group];
  if (([(AVMediaSelectionGroup *)mediaSelectionGroup isEqual:v5] & 1) != 0
    || !objc_msgSend(-[AVMediaSelectionGroup asset](mediaSelectionGroup, "asset"), "isEqual:", objc_msgSend(v5, "asset")))
  {
    return 0;
  }
  id v6 = [(AVMediaSelectionOption *)self associatedPersistentIDs];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v47;
    uint64_t v32 = *(void *)v47;
    v33 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v12 = [(AVMediaSelectionGroup *)mediaSelectionGroup options];
        uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v43;
LABEL_10:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v43 != v15) {
              objc_enumerationMutation(v12);
            }
            long long v17 = *(AVMediaSelectionOption **)(*((void *)&v42 + 1) + 8 * v16);
            if (objc_msgSend(v11, "isEqual:", -[AVMediaSelectionOption optionID](v17, "optionID"))) {
              return v17;
            }
            if (v14 == ++v16)
            {
              uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v42 objects:v52 count:16];
              if (v14) {
                goto LABEL_10;
              }
              break;
            }
          }
        }
        uint64_t v9 = v32;
        id v6 = v33;
      }
      uint64_t v8 = [v33 countByEnumeratingWithState:&v46 objects:v53 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  long long v18 = [(AVMediaSelectionOption *)self locale];
  if (!v18) {
    return 0;
  }
  v19 = v18;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v20 = [(AVMediaSelectionGroup *)mediaSelectionGroup options];
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (!v21)
  {
LABEL_29:
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v25 = [(AVMediaSelectionGroup *)mediaSelectionGroup options];
    uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v34 objects:v50 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v35;
LABEL_31:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v17 = *(AVMediaSelectionOption **)(*((void *)&v34 + 1) + 8 * v29);
        uint64_t v30 = [(AVMediaSelectionOption *)v17 associatedExtendedLanguageTag];
        if (v30)
        {
          if ([(NSString *)[(AVMediaSelectionOption *)self extendedLanguageTag] isEqualToString:v30]&& (![(AVMediaSelectionOption *)v17 hasMediaCharacteristic:@"AVMediaCharacteristicLegible"]|| [(AVMediaSelectionOption *)v17 hasMediaCharacteristic:@"public.subtitles.forced-only"]))
          {
            return v17;
          }
        }
        if (v27 == ++v29)
        {
          uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v34 objects:v50 count:16];
          long long v17 = 0;
          if (v27) {
            goto LABEL_31;
          }
          return v17;
        }
      }
    }
    return 0;
  }
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)v39;
LABEL_21:
  uint64_t v24 = 0;
  while (1)
  {
    if (*(void *)v39 != v23) {
      objc_enumerationMutation(v20);
    }
    long long v17 = *(AVMediaSelectionOption **)(*((void *)&v38 + 1) + 8 * v24);
    if (AVNSLocalesMatchAccordingToRFC4647FilteringRules(v19, [(AVMediaSelectionOption *)v17 locale]))
    {
      if (![(AVMediaSelectionOption *)v17 hasMediaCharacteristic:@"AVMediaCharacteristicLegible"]|| [(AVMediaSelectionOption *)v17 hasMediaCharacteristic:@"public.subtitles.forced-only"])
      {
        return v17;
      }
    }
    if (v22 == ++v24)
    {
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v38 objects:v51 count:16];
      if (v22) {
        goto LABEL_21;
      }
      goto LABEL_29;
    }
  }
}

- (id)_preferredMetadataTitleAccordingToPreferredLanguages:(id)a3 fallingBackToMatchingEmptyLocale:(BOOL)a4 excludeM3U8Metadata:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [(AVMediaSelectionOption *)self commonMetadata];
  if (![(AVMediaSelectionOption *)self _track]
    && [(AVMediaSelectionOption *)self _isMainProgramContent]
    && v5)
  {
    uint64_t v10 = (NSArray *)(id)[(NSArray *)v9 mutableCopy];
    [(NSArray *)v10 removeObjectsInArray:+[AVMetadataItem metadataItemsFromArray:v9 withKey:@"NAME" keySpace:@"m3u8"]];
    uint64_t v9 = v10;
  }
  uint64_t v11 = +[AVMetadataItem metadataItemsFromArray:v9 withKey:@"title" keySpace:@"comn"];
  uint64_t v12 = +[AVMetadataItem metadataItemsFromArray:v11 filteredAndSortedAccordingToPreferredLanguages:a3];
  if (![(NSArray *)v12 count] && [(NSArray *)v11 count] >= 2)
  {
    uint64_t v13 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v14 = [(NSArray *)v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v11);
          }
          long long v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ([v18 extendedLanguageTag]) {
            objc_msgSend(v13, "addObject:", objc_msgSend(v18, "extendedLanguageTag"));
          }
        }
        uint64_t v15 = [(NSArray *)v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v15);
    }
    v19 = (void *)FigCopyRankedLanguagesAccordingToPreferredLanguages2();
    if (CFArrayGetCount((CFArrayRef)v19) >= 1)
    {
      uint64_t v34 = [v19 firstObject];
      uint64_t v12 = +[AVMetadataItem metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:](AVMetadataItem, "metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:", v11, [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1]);
    }
    if (v19) {
      CFRelease(v19);
    }
  }
  if ([(NSArray *)v12 count])
  {
    id v20 = [(NSArray *)v12 objectAtIndex:0];
    return (id)[v20 stringValue];
  }
  else
  {
    if (v6)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id result = (id)[(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (!result) {
        return result;
      }
      id v22 = result;
      uint64_t v23 = *(void *)v26;
LABEL_26:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v11);
        }
        id v20 = *(id *)(*((void *)&v25 + 1) + 8 * v24);
        if (![v20 locale]) {
          break;
        }
        if (v22 == (id)++v24)
        {
          id v22 = (id)[(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
          id result = 0;
          if (v22) {
            goto LABEL_26;
          }
          return result;
        }
      }
      if ((objc_msgSend((id)objc_msgSend(v20, "identifier"), "isEqual:", @"udta/name") & 1) == 0) {
        return (id)[v20 stringValue];
      }
    }
    return 0;
  }
}

- (id)_languageDisplayNameFromMetadataAccordingToPreferredLanguages:(id)a3 fallingBackToMatchingEmptyLocale:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(AVMediaSelectionOption *)self hasMediaCharacteristic:@"com.apple.has-language-display-name-as-name"])return 0; {
  return [(AVMediaSelectionOption *)self _preferredMetadataTitleAccordingToPreferredLanguages:a3 fallingBackToMatchingEmptyLocale:v4 excludeM3U8Metadata:0];
  }
}

- (id)_displayNameWithLocale:(id)a3 fallingBackToMatchingUndeterminedAndMultilingual:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(AVMediaSelectionOption *)self _updateDisplayNameWithLocale:a3 fallingBackToMatchingUndeterminedAndMultilingual:a4 context:3])
  {

    self->_mediaSelectionOption->_displayName = 0;
    [(AVMediaSelectionOption *)self _updateDisplayNameWithLocale:a3 fallingBackToMatchingUndeterminedAndMultilingual:v4 context:5];
  }
  return self->_mediaSelectionOption->_displayName;
}

- (BOOL)_updateDisplayNameWithLocale:(id)a3 fallingBackToMatchingUndeterminedAndMultilingual:(BOOL)a4 context:(int64_t)a5
{
  BOOL v6 = a4;
  v80[3] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void *)[MEMORY[0x1E4F1CA20] preferredLanguages];
  if ([v9 count]) {
    uint64_t v10 = [v9 objectAtIndex:0];
  }
  else {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"), "localeIdentifier");
  }
  if (v10) {
    uint64_t v11 = (__CFString *)v10;
  }
  else {
    uint64_t v11 = @"en";
  }
  if (a3)
  {
    if (-[__CFString isEqualToString:](v11, "isEqualToString:", [a3 localeIdentifier])) {
      id v12 = 0;
    }
    else {
      id v12 = a3;
    }
  }
  else
  {
    a3 = (id)[MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v11];
    id v12 = 0;
  }
  if (!-[NSString isEqualToString:](self->_mediaSelectionOption->_displayNameLocaleIdentifier, "isEqualToString:", [a3 localeIdentifier]))
  {

    self->_mediaSelectionOption->_displayNameLocaleIdentifier = (NSString *)objc_msgSend((id)objc_msgSend(a3, "localeIdentifier"), "copy");
    self->_mediaSelectionOption->_displayName = 0;
  }
  if (self->_mediaSelectionOption->_displayName)
  {
    LOBYTE(v13) = 0;
    return v13;
  }
  bundleID = (__CFString *)objc_msgSend(-[AVMediaSelectionOption group](self, "group"), "currentBundleIdentifier");
  uint64_t v14 = [a3 objectForKey:*MEMORY[0x1E4F1C430]];
  if (v6)
  {
    v80[0] = v14;
    v80[1] = @"mul";
    v80[2] = @"und";
    uint64_t v15 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v16 = v80;
    uint64_t v17 = 3;
  }
  else
  {
    uint64_t v79 = v14;
    uint64_t v15 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v16 = &v79;
    uint64_t v17 = 1;
  }
  long long v18 = (void *)[v15 arrayWithObjects:v16 count:v17];
  v19 = [(AVMediaSelectionOption *)self _preferredMetadataTitleAccordingToPreferredLanguages:v18 fallingBackToMatchingEmptyLocale:v6 excludeM3U8Metadata:1];
  id v20 = [(AVMediaSelectionOption *)self extendedLanguageTag];
  if (!v20)
  {
    uint64_t v24 = 0;
    long long v26 = 0;
    goto LABEL_41;
  }
  uint64_t v21 = v20;
  int64_t v66 = a5;
  id v67 = v12;
  id v22 = (void *)AVLanguageCodeFromExtendedLanguageTag(v20);
  if (!AVIsSpecialSpokenExtendedLanguageTag(v21)) {
    goto LABEL_29;
  }
  uint64_t v23 = [a3 displayNameForKey:*MEMORY[0x1E4F1C438] value:v22];
  if (v23)
  {
    uint64_t v24 = v23;
    if (([v22 isEqualToString:@"no"] & 1) != 0
      || ([v22 isEqualToString:@"nor"] & 1) != 0
      || ([v22 isEqualToString:v21] & 1) == 0)
    {
      long long v25 = (__CFString *)[a3 localizedStringForLanguage:v21 context:v66];
    }
    else
    {
      long long v25 = 0;
    }
    goto LABEL_32;
  }
  long long v25 = -[AVMediaSelectionOption _languageDisplayNameFromMetadataAccordingToPreferredLanguages:fallingBackToMatchingEmptyLocale:](self, "_languageDisplayNameFromMetadataAccordingToPreferredLanguages:fallingBackToMatchingEmptyLocale:", [v18 arrayByAddingObject:v21], v6);
  uint64_t v24 = (uint64_t)v25;
  if (!v25)
  {
LABEL_29:
    uint64_t v27 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromString:v21];
    if (!v27
      || (uint64_t v28 = v27,
          uint64_t v24 = [a3 displayNameForKey:*MEMORY[0x1E4F1C438] value:v27],
          long long v25 = (__CFString *)[a3 localizedStringForLanguage:v28 context:v66],
          !v24))
    {
      long long v25 = -[AVMediaSelectionOption _languageDisplayNameFromMetadataAccordingToPreferredLanguages:fallingBackToMatchingEmptyLocale:](self, "_languageDisplayNameFromMetadataAccordingToPreferredLanguages:fallingBackToMatchingEmptyLocale:", [v18 arrayByAddingObject:v21], v6);
      uint64_t v24 = (uint64_t)v25;
    }
  }
LABEL_32:
  if (v25) {
    long long v29 = v25;
  }
  else {
    long long v29 = (__CFString *)v24;
  }
  if (!v24) {
    uint64_t v24 = (uint64_t)v22;
  }
  if (v29) {
    long long v26 = v29;
  }
  else {
    long long v26 = (__CFString *)v21;
  }
  id v12 = v67;
LABEL_41:
  long long v30 = bundleID;
  if (v19
    && objc_msgSend((id)-[__CFString stringByTrimmingCharactersInSet:](v19, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceCharacterSet")), "length"))
  {
    if (v24 && [(__CFString *)v19 rangeOfString:v24 options:1] == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v31 = AVLocalizedStringFromTableWithLocaleWithBundleIdentifier(@"SUBTITLE_TRACK_DISPLAY_FORMAT", @"AVMediaSelectionOption", v12, bundleID);
      int v13 = [(__CFString *)v31 hasPrefix:@"%2$@"] ^ 1;
      *(void *)&inSpecifier[0] = 0;
      long long v26 = (__CFString *)[NSString stringWithValidatedFormat:v31, @"%@%@", inSpecifier, v19, v26 validFormatSpecifiers error];
    }
    else
    {
      int v13 = 0;
      long long v26 = v19;
    }
  }
  else
  {
    int v13 = 0;
  }
  if ([(NSString *)[(AVMediaSelectionOption *)self mediaType] isEqualToString:@"sbtl"]|| [(NSString *)[(AVMediaSelectionOption *)self mediaType] isEqualToString:@"text"])
  {
    if ([(AVMediaSelectionOption *)self hasMediaCharacteristic:@"public.accessibility.transcribes-spoken-dialog"]&& [(AVMediaSelectionOption *)self hasMediaCharacteristic:@"public.accessibility.describes-music-and-sound"])
    {
      long long v32 = AVLocalizedStringFromTableWithLocaleWithBundleIdentifier(@"SDH_SUBTITLE_FORMAT", @"AVMediaSelectionOption", v12, bundleID);
      v33 = v32;
      if (v13) {
        int v13 = 1;
      }
      else {
        int v13 = [(__CFString *)v32 hasPrefix:@"%1$@"] ^ 1;
      }
      long long v38 = &stru_1EE5953B8;
      if (v26) {
        long long v38 = v26;
      }
      *(void *)&inSpecifier[0] = 0;
      long long v26 = (__CFString *)[NSString stringWithValidatedFormat:v33, @"%@", inSpecifier, v38 validFormatSpecifiers error];
    }
    if ([(AVMediaSelectionOption *)self hasMediaCharacteristic:@"public.subtitles.forced-only"])
    {
      long long v39 = AVLocalizedStringFromTableWithLocaleWithBundleIdentifier(@"FORCEDONLY_SUBTITLE_FORMAT", @"AVMediaSelectionOption", v12, bundleID);
      long long v40 = v39;
      if (v13) {
        int v13 = 1;
      }
      else {
        int v13 = [(__CFString *)v39 hasPrefix:@"%1$@"] ^ 1;
      }
      long long v41 = &stru_1EE5953B8;
      if (v26) {
        long long v41 = v26;
      }
      *(void *)&inSpecifier[0] = 0;
      long long v26 = (__CFString *)[NSString stringWithValidatedFormat:v40, @"%@", inSpecifier, v41 validFormatSpecifiers error];
    }
    if (![(AVMediaSelectionOption *)self hasMediaCharacteristic:@"public.easy-to-read"])goto LABEL_80; {
    long long v42 = AVLocalizedStringFromTableWithLocaleWithBundleIdentifier(@"EASYTOREAD_SUBTITLE_FORMAT", @"AVMediaSelectionOption", v12, bundleID);
    }
    long long v43 = v42;
    if (v13) {
      LOBYTE(v13) = 1;
    }
    else {
      int v13 = [(__CFString *)v42 hasPrefix:@"%1$@"] ^ 1;
    }
    long long v44 = &stru_1EE5953B8;
    if (v26) {
      long long v44 = v26;
    }
    *(void *)&inSpecifier[0] = 0;
    long long v45 = NSString;
    goto LABEL_79;
  }
  if (![(NSString *)[(AVMediaSelectionOption *)self mediaType] isEqualToString:@"clcp"])
  {
    if ([(NSString *)[(AVMediaSelectionOption *)self mediaType] isEqualToString:@"soun"])
    {
      if ([(AVMediaSelectionOption *)self hasMediaCharacteristic:@"public.accessibility.describes-video"])
      {
        uint64_t v36 = AVLocalizedStringFromTableWithLocaleWithBundleIdentifier(@"DESCRIBESVIDEO_AUDIO_FORMAT", @"AVMediaSelectionOption", v12, bundleID);
        long long v37 = v36;
        if (v13) {
          int v13 = 1;
        }
        else {
          int v13 = [(__CFString *)v36 hasPrefix:@"%1$@"] ^ 1;
        }
        long long v50 = &stru_1EE5953B8;
        if (v26) {
          long long v50 = v26;
        }
        *(void *)&inSpecifier[0] = 0;
        long long v26 = (__CFString *)[NSString stringWithValidatedFormat:v37, @"%@", inSpecifier, v50 validFormatSpecifiers error];
      }
      if ([(AVMediaSelectionOption *)self hasMediaCharacteristic:@"public.translation.voice-over"])
      {
        v51 = AVLocalizedStringFromTableWithLocaleWithBundleIdentifier(@"VOICEOVERTRANSLATION_AUDIO_FORMAT", @"AVMediaSelectionOption", v12, bundleID);
        uint64_t v52 = v51;
        if (v13) {
          int v13 = 1;
        }
        else {
          int v13 = [(__CFString *)v51 hasPrefix:@"%1$@"] ^ 1;
        }
        v53 = &stru_1EE5953B8;
        if (v26) {
          v53 = v26;
        }
        *(void *)&inSpecifier[0] = 0;
        long long v26 = (__CFString *)[NSString stringWithValidatedFormat:v52, @"%@", inSpecifier, v53 validFormatSpecifiers error];
      }
      if ([(AVMediaSelectionOption *)self hasMediaCharacteristic:@"public.original-content"])
      {
        uint64_t v54 = AVLocalizedStringFromTableWithLocaleWithBundleIdentifier(@"ORIGINAL_AUDIO_FORMAT", @"AVMediaSelectionOption", v12, bundleID);
        v55 = v54;
        if (v13) {
          LOBYTE(v13) = 1;
        }
        else {
          int v13 = [(__CFString *)v54 hasPrefix:@"%1$@"] ^ 1;
        }
        v56 = &stru_1EE5953B8;
        if (v26) {
          v56 = v26;
        }
        *(void *)&inSpecifier[0] = 0;
        long long v26 = (__CFString *)[NSString stringWithValidatedFormat:v55, @"%@", inSpecifier, v56 validFormatSpecifiers error];
      }
      v57 = [(AVMediaSelectionOption *)self mediaSubTypes];
      if ([(NSArray *)v57 count])
      {
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        uint64_t v58 = [(NSArray *)v57 countByEnumeratingWithState:&v73 objects:v78 count:16];
        if (v58)
        {
          uint64_t v59 = v58;
          uint64_t v60 = *(void *)v74;
          while (2)
          {
            id v61 = v12;
            for (uint64_t i = 0; i != v59; ++i)
            {
              if (*(void *)v74 != v60) {
                objc_enumerationMutation(v57);
              }
              if ([*(id *)(*((void *)&v73 + 1) + 8 * i) intValue] != 1633889587)
              {
                id v12 = v61;
                goto LABEL_128;
              }
            }
            uint64_t v59 = [(NSArray *)v57 countByEnumeratingWithState:&v73 objects:v78 count:16];
            id v12 = v61;
            if (v59) {
              continue;
            }
            break;
          }
        }
        uint64_t v71 = 0;
        CFTypeRef outPropertyData = 0;
        memset(inSpecifier, 0, sizeof(inSpecifier));
        UInt32 ioPropertyDataSize = 8;
        DWORD2(inSpecifier[0]) = 1633889587;
        AudioFormatGetProperty(0x666E616Du, 0x28u, inSpecifier, &ioPropertyDataSize, &outPropertyData);
        if (outPropertyData)
        {
          long long v30 = bundleID;
          if (-[__CFString rangeOfString:](v26, "rangeOfString:") == 0x7FFFFFFFFFFFFFFFLL)
          {
            v63 = AVLocalizedStringFromTableWithLocaleWithBundleIdentifier(@"AUDIOENCODING_AUDIO_FORMAT", @"AVMediaSelectionOption", v12, bundleID);
            v64 = v63;
            if (v13) {
              LOBYTE(v13) = 1;
            }
            else {
              int v13 = [(__CFString *)v63 hasPrefix:@"%1$@"] ^ 1;
            }
            v65 = &stru_1EE5953B8;
            if (v26) {
              v65 = v26;
            }
            uint64_t v77 = 0;
            long long v26 = (__CFString *)[NSString stringWithValidatedFormat:v64, @"%@%@", &v77, v65, outPropertyData validFormatSpecifiers error];
          }
          if (outPropertyData) {
            CFRelease(outPropertyData);
          }
        }
        else
        {
LABEL_128:
          long long v30 = bundleID;
        }
      }
    }
    goto LABEL_80;
  }
  uint64_t v34 = AVLocalizedStringFromTableWithLocaleWithBundleIdentifier(@"CC_SUBTITLE_FORMAT", @"AVMediaSelectionOption", v12, bundleID);
  long long v35 = v34;
  if (v13) {
    LOBYTE(v13) = 1;
  }
  else {
    int v13 = [(__CFString *)v34 hasPrefix:@"%1$@"] ^ 1;
  }
  if (v26) {
    long long v48 = v26;
  }
  else {
    long long v48 = &stru_1EE5953B8;
  }
  *(void *)&inSpecifier[0] = 0;
  long long v26 = (__CFString *)[NSString stringWithValidatedFormat:v35, @"%@", inSpecifier, v48 validFormatSpecifiers error];
  if ([(AVMediaSelectionOption *)self hasMediaCharacteristic:@"public.easy-to-read"])
  {
    long long v49 = AVLocalizedStringFromTableWithLocaleWithBundleIdentifier(@"EASYTOREAD_SUBTITLE_FORMAT", @"AVMediaSelectionOption", v12, bundleID);
    long long v43 = v49;
    if (v13) {
      LOBYTE(v13) = 1;
    }
    else {
      int v13 = [(__CFString *)v49 hasPrefix:@"%1$@"] ^ 1;
    }
    if (v26) {
      long long v44 = v26;
    }
    else {
      long long v44 = &stru_1EE5953B8;
    }
    *(void *)&inSpecifier[0] = 0;
    long long v45 = NSString;
LABEL_79:
    long long v26 = (__CFString *)[v45 stringWithValidatedFormat:v43, @"%@", inSpecifier, v44 validFormatSpecifiers error];
  }
LABEL_80:
  long long v46 = (__CFString *)-[__CFString stringByTrimmingCharactersInSet:](v26, "stringByTrimmingCharactersInSet:", [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet]);
  if (![(__CFString *)v46 length]) {
    long long v46 = AVLocalizedStringFromTableWithLocaleWithBundleIdentifier(@"UNKNOWN_LANGUAGE", @"AVMediaSelectionOption", v12, v30);
  }
  self->_mediaSelectionOption->_displayName = (NSString *)v46;
  return v13;
}

- (NSString)displayNameWithLocale:(NSLocale *)locale
{
  if (!locale)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"displayNameWithLocale requires an NSLocale", v3, v4, v5, v6, v7, v8), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  return (NSString *)-[AVMediaSelectionOption _displayNameWithLocale:fallingBackToMatchingUndeterminedAndMultilingual:](self, "_displayNameWithLocale:fallingBackToMatchingUndeterminedAndMultilingual:");
}

- (NSString)displayName
{
  return (NSString *)[(AVMediaSelectionOption *)self _displayNameWithLocale:0 fallingBackToMatchingUndeterminedAndMultilingual:1];
}

- (id)track
{
  return 0;
}

- (int)trackID
{
  return 0;
}

@end