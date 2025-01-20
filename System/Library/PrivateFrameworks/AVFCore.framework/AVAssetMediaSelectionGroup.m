@interface AVAssetMediaSelectionGroup
- (AVAssetMediaSelectionGroup)init;
- (AVAssetMediaSelectionGroup)initWithAsset:(id)a3 dictionary:(id)a4;
- (BOOL)_isStreamingGroup;
- (BOOL)isEqual:(id)a3;
- (id)_groupMediaCharacteristics;
- (id)_localizedMediaSelectionOptionDisplayNames;
- (id)_mediaSelectionOptionWithPropertyList:(id)a3 matchToMediaSelectionArray:(BOOL)a4;
- (id)_optionWithID:(id)a3 displaysNonForcedSubtitles:(BOOL)a4 audioCompositionPresetIndex:(id)a5;
- (id)_optionWithID:(id)a3 identifier:(id)a4 source:(id)a5 displaysNonForcedSubtitles:(BOOL)a6 audioCompositionPresetIndex:(id)a7;
- (id)asset;
- (id)defaultOption;
- (id)dictionary;
- (id)mediaSelectionOptionWithPropertyList:(id)a3;
- (id)mediaSelectionOptionWithPropertyListMatchToMediaSelectionArray:(id)a3;
- (id)options;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVAssetMediaSelectionGroup

- (unint64_t)hash
{
  unint64_t v3 = [(AVAsset *)self->_asset hash];
  return [(NSDictionary *)self->_dictionary hash] ^ v3;
}

- (AVAssetMediaSelectionGroup)initWithAsset:(id)a3 dictionary:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)AVAssetMediaSelectionGroup;
  v6 = [(AVMediaSelectionGroup *)&v25 init];
  v7 = v6;
  if (v6)
  {
    if (a3 && a4)
    {
      v6->_asset = (AVAsset *)a3;
      id v8 = a3;
      v7->_isStreamingGroup = [a3 _isStreaming];
      v9 = (NSDictionary *)a4;
      v7->_dictionary = v9;
      v7->_groupMediaCharacteristics = (NSArray *)objc_msgSend(AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(-[NSDictionary objectForKey:](v9, "objectForKey:", *MEMORY[0x1E4F34710])), "copy");
      v7->_localizedMediaSelectionOptionDisplayNames = (NSDictionary *)objc_msgSend(-[AVAsset _localizedMediaSelectionOptionDisplayNames](v7->_asset, "_localizedMediaSelectionOptionDisplayNames"), "copy");
      id v10 = [(NSDictionary *)v7->_dictionary objectForKey:*MEMORY[0x1E4F34720]];
      v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        uint64_t v15 = *MEMORY[0x1E4F347A0];
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v10);
            }
            v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if ([v17 objectForKey:v15]) {
              BOOL v18 = !v7->_isStreamingGroup;
            }
            else {
              BOOL v18 = 0;
            }
            v19 = +[AVMediaSelectionOption mediaSelectionOptionForAsset:v8 group:v7 dictionary:v17 hasUnderlyingTrack:v18];
            [(NSArray *)v11 addObject:v19];
            if (!v7->_defaultOption && [(AVMediaSelectionOption *)v19 _isDesignatedDefault]) {
              v7->_defaultOption = v19;
            }
          }
          uint64_t v13 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v13);
      }
      v7->_options = v11;
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (id)asset
{
  return self->_asset;
}

- (id)dictionary
{
  return self->_dictionary;
}

- (id)_groupMediaCharacteristics
{
  return self->_groupMediaCharacteristics;
}

- (id)_localizedMediaSelectionOptionDisplayNames
{
  return self->_localizedMediaSelectionOptionDisplayNames;
}

- (BOOL)_isStreamingGroup
{
  return self->_isStreamingGroup;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetMediaSelectionGroup;
  [(AVMediaSelectionGroup *)&v3 dealloc];
}

- (AVAssetMediaSelectionGroup)init
{
  return [(AVAssetMediaSelectionGroup *)self initWithAsset:0 dictionary:0];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = -[AVAsset isEqual:](self->_asset, "isEqual:", [a3 asset]);
      if (v5)
      {
        dictionary = self->_dictionary;
        uint64_t v7 = [a3 dictionary];
        LOBYTE(v5) = [(NSDictionary *)dictionary isEqual:v7];
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)options
{
  return self->_options;
}

- (id)defaultOption
{
  return self->_defaultOption;
}

- (id)_optionWithID:(id)a3 identifier:(id)a4 source:(id)a5 displaysNonForcedSubtitles:(BOOL)a6 audioCompositionPresetIndex:(id)a7
{
  int v24 = a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = [(AVAssetMediaSelectionGroup *)self options];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v12) {
    return 0;
  }
  uint64_t v13 = v12;
  id v23 = a5;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = *(void *)v26;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v26 != v16) {
        objc_enumerationMutation(v11);
      }
      BOOL v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
      if (!a3)
      {
        if (a4)
        {
          int v19 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v17), "outOfBandIdentifier"), "isEqual:", a4);
          if (a7) {
            goto LABEL_14;
          }
        }
        else
        {
          if (!v23)
          {
            a4 = 0;
            goto LABEL_24;
          }
          int v19 = objc_msgSend((id)objc_msgSend(v18, "outOfBandSource"), "isEqual:", v23);
          a4 = 0;
          if (a7)
          {
LABEL_14:
            if (!v19) {
              goto LABEL_24;
            }
LABEL_15:
            if ((objc_msgSend((id)objc_msgSend(v18, "_audioCompositionPresetIndex"), "isEqualToNumber:", a7) & 1) == 0) {
              goto LABEL_24;
            }
            goto LABEL_20;
          }
        }
        goto LABEL_19;
      }
      if ((objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v17), "optionID"), "isEqual:", a3) & 1) == 0)
      {
        int v19 = objc_msgSend((id)objc_msgSend(v18, "fallbackIDs"), "containsObject:", a3);
        if (a7) {
          goto LABEL_14;
        }
LABEL_19:
        if (!v19) {
          goto LABEL_24;
        }
        goto LABEL_20;
      }
      if (a7) {
        goto LABEL_15;
      }
LABEL_20:
      if ([v18 displaysNonForcedSubtitles] == v24) {
        return v18;
      }
      if (v14++ == 0) {
        uint64_t v15 = v18;
      }
      else {
        uint64_t v15 = 0;
      }
LABEL_24:
      ++v17;
    }
    while (v13 != v17);
    uint64_t v21 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    uint64_t v13 = v21;
    BOOL v18 = v15;
  }
  while (v21);
  return v18;
}

- (id)_optionWithID:(id)a3 displaysNonForcedSubtitles:(BOOL)a4 audioCompositionPresetIndex:(id)a5
{
  return [(AVAssetMediaSelectionGroup *)self _optionWithID:a3 identifier:0 source:0 displaysNonForcedSubtitles:a4 audioCompositionPresetIndex:a5];
}

- (id)_mediaSelectionOptionWithPropertyList:(id)a3 matchToMediaSelectionArray:(BOOL)a4
{
  BOOL v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (v4)
  {
    objc_msgSend(-[AVAssetMediaSelectionGroup asset](self, "asset"), "_mediaSelectionGroupDictionaries");
    a3 = (id)FigMediaSelectionGroupsCreateMatchingSelection();
  }
  uint64_t v7 = [a3 objectForKey:*MEMORY[0x1E4F347A0]];
  CFNumberRef v8 = (const __CFNumber *)v7;
  if (!v7) {
    CFNumberRef v8 = (const __CFNumber *)[a3 objectForKey:@"AVMediaSelectionTrackOptionTrackIDKey"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    CFNumberRef v8 = 0;
  }
  if (v8)
  {
    uint64_t v9 = [a3 objectForKey:*MEMORY[0x1E4F34740]];
    if (!v7)
    {
      unsigned int valuePtr = 0;
      CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
      id v13 = [(AVAssetMediaSelectionGroup *)self asset];
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "trackWithTrackID:", valuePtr), "mediaType"), "isEqualToString:", @"sbtl"))uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVMediaSelectionTrackOptionSettingsKey"), "objectForKey:", @"AVMediaSelectionTrackOptionCharacteristicsKey"), "containsObject:", @"public.subtitles.forced-only") ^ 1; {
      uint64_t v10 = 0;
      }
      uint64_t v11 = 0;
      goto LABEL_20;
    }
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = [a3 objectForKey:*MEMORY[0x1E4F34750]];
  uint64_t v12 = [a3 objectForKey:*MEMORY[0x1E4F347B0]];
  if (!(v10 | v12)) {
    return 0;
  }
  uint64_t v11 = v12;
  uint64_t v9 = [a3 objectForKey:*MEMORY[0x1E4F34740]];
  if (v7 || v10 || v11)
  {
LABEL_11:
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F34758]), "BOOLValue");
    goto LABEL_20;
  }
  uint64_t v10 = 0;
  uint64_t v7 = 0;
LABEL_20:
  uint64_t v14 = [a3 objectForKey:*MEMORY[0x1E4F34718]];
  if (v14 || (uint64_t v14 = [a3 objectForKey:@"AVMediaSelectionKeyValueOptionMediaTypeKey"]) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    int v15 = 1;
  }
  else
  {
    int v15 = 0;
  }
  uint64_t v16 = [a3 objectForKey:*MEMORY[0x1E4F34708]];
  if (!v16)
  {
    uint64_t v16 = [a3 objectForKey:@"AVMediaSelectionKeyValueOptionGroupIDKey"];
    if (((v16 == 0) & ~v15) != 0) {
      return [(AVAssetMediaSelectionGroup *)self _optionWithID:v8 identifier:v10 source:v11 displaysNonForcedSubtitles:v7 audioCompositionPresetIndex:v9];
    }
  }
  if ([(AVMediaSelectionGroup *)self _matchesGroupID:v16 mediaType:v14]) {
    return [(AVAssetMediaSelectionGroup *)self _optionWithID:v8 identifier:v10 source:v11 displaysNonForcedSubtitles:v7 audioCompositionPresetIndex:v9];
  }
  return 0;
}

- (id)mediaSelectionOptionWithPropertyList:(id)a3
{
  return [(AVAssetMediaSelectionGroup *)self _mediaSelectionOptionWithPropertyList:a3 matchToMediaSelectionArray:0];
}

- (id)mediaSelectionOptionWithPropertyListMatchToMediaSelectionArray:(id)a3
{
  return [(AVAssetMediaSelectionGroup *)self _mediaSelectionOptionWithPropertyList:a3 matchToMediaSelectionArray:1];
}

@end