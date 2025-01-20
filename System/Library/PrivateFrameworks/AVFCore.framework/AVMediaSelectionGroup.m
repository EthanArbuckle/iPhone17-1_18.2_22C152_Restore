@interface AVMediaSelectionGroup
+ (AVMediaSelectionGroup)mediaSelectionGroupWithAsset:(id)a3 dictionary:(id)a4;
+ (NSArray)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions filteredAndSortedAccordingToPreferredLanguages:(NSArray *)preferredLanguages;
+ (NSArray)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions withLocale:(NSLocale *)locale;
+ (NSArray)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions withMediaCharacteristics:(NSArray *)mediaCharacteristics;
+ (NSArray)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions withoutMediaCharacteristics:(NSArray *)mediaCharacteristics;
+ (NSArray)playableMediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions;
- (AVMediaSelectionGroup)init;
- (AVMediaSelectionOption)defaultOption;
- (AVMediaSelectionOption)mediaSelectionOptionWithPropertyList:(id)plist;
- (BOOL)_isStreamingGroup;
- (BOOL)_matchesGroupID:(id)a3 mediaType:(id)a4;
- (BOOL)allowsEmptySelection;
- (NSArray)options;
- (id)_groupID;
- (id)_groupMediaCharacteristics;
- (id)_groupMediaType;
- (id)_localizedMediaSelectionOptionDisplayNames;
- (id)_optionWithID:(id)a3 displaysNonForcedSubtitles:(BOOL)a4 audioCompositionPresetIndex:(id)a5;
- (id)_primaryMediaCharacteristic;
- (id)_weakReference;
- (id)asset;
- (id)currentBundleIdentifier;
- (id)description;
- (id)dictionary;
- (id)mediaSelectionOptionWithPropertyListMatchToMediaSelectionArray:(id)a3;
- (void)dealloc;
- (void)setCurrentBundleIdentifier:(id)a3;
@end

@implementation AVMediaSelectionGroup

+ (AVMediaSelectionGroup)mediaSelectionGroupWithAsset:(id)a3 dictionary:(id)a4
{
  v4 = [[AVAssetMediaSelectionGroup alloc] initWithAsset:a3 dictionary:a4];
  return (AVMediaSelectionGroup *)v4;
}

- (AVMediaSelectionGroup)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVMediaSelectionGroup;
  v2 = [(AVMediaSelectionGroup *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVMediaSelectionGroupInternal);
    v2->_mediaSelectionGroup = v3;
    if (v3)
    {
      CFRetain(v3);
      v2->_mediaSelectionGroup->weakReference = [[AVWeakReference alloc] initWithReferencedObject:v2];
      v2->_mediaSelectionGroup->currentBundleIdentifier = 0;
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (id)_weakReference
{
  return self->_mediaSelectionGroup->weakReference;
}

- (id)_groupMediaType
{
  id v2 = [(AVMediaSelectionGroup *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F34718];
  return (id)[v2 objectForKey:v3];
}

- (id)_groupID
{
  id v2 = [(AVMediaSelectionGroup *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F34708];
  return (id)[v2 objectForKey:v3];
}

- (BOOL)allowsEmptySelection
{
  id v2 = [(AVMediaSelectionGroup *)self dictionary];
  uint64_t v3 = (void *)[v2 objectForKey:*MEMORY[0x1E4F34700]];
  if (!v3) {
    return 1;
  }
  return [v3 BOOLValue];
}

- (id)_primaryMediaCharacteristic
{
  id v2 = [(AVMediaSelectionGroup *)self _groupMediaCharacteristics];
  uint64_t v3 = @"AVMediaCharacteristicAudible";
  if ([v2 containsObject:@"AVMediaCharacteristicAudible"]) {
    return v3;
  }
  uint64_t v3 = @"AVMediaCharacteristicLegible";
  if ([v2 containsObject:@"AVMediaCharacteristicLegible"]) {
    return v3;
  }
  uint64_t v3 = @"AVMediaCharacteristicVisual";
  if ([v2 containsObject:@"AVMediaCharacteristicVisual"]) {
    return v3;
  }
  return (id)[v2 firstObject];
}

- (void)dealloc
{
  mediaSelectionGroup = self->_mediaSelectionGroup;
  if (mediaSelectionGroup)
  {

    CFRelease(self->_mediaSelectionGroup);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVMediaSelectionGroup;
  [(AVMediaSelectionGroup *)&v4 dealloc];
}

- (id)description
{
  uint64_t v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [(AVMediaSelectionGroup *)self options];
  BOOL v7 = [(AVMediaSelectionGroup *)self allowsEmptySelection];
  v8 = @"NO";
  if (v7) {
    v8 = @"YES";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p, options = %@, allowsEmptySelection = %@>", v5, self, v6, v8];
}

- (id)asset
{
  return 0;
}

- (NSArray)options
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (id)dictionary
{
  return 0;
}

- (id)_groupMediaCharacteristics
{
  id v2 = [(AVMediaSelectionGroup *)self dictionary];
  uint64_t v3 = *MEMORY[0x1E4F34710];
  return (id)[v2 objectForKey:v3];
}

- (BOOL)_matchesGroupID:(id)a3 mediaType:(id)a4
{
  id v7 = [(AVMediaSelectionGroup *)self _groupID];
  id v8 = [(AVMediaSelectionGroup *)self _groupMediaType];
  if (v7 == a3 || (int v9 = [v7 isEqual:a3]) != 0)
  {
    if (v8 == a4)
    {
      LOBYTE(v9) = 1;
    }
    else
    {
      LOBYTE(v9) = [v8 isEqualToString:a4];
    }
  }
  return v9;
}

- (BOOL)_isStreamingGroup
{
  return 0;
}

- (id)_localizedMediaSelectionOptionDisplayNames
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionary];
}

- (AVMediaSelectionOption)defaultOption
{
  return 0;
}

- (id)_optionWithID:(id)a3 displaysNonForcedSubtitles:(BOOL)a4 audioCompositionPresetIndex:(id)a5
{
  return 0;
}

- (AVMediaSelectionOption)mediaSelectionOptionWithPropertyList:(id)plist
{
  return 0;
}

- (id)mediaSelectionOptionWithPropertyListMatchToMediaSelectionArray:(id)a3
{
  return 0;
}

+ (NSArray)playableMediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions
{
  objc_super v4 = [(NSArray *)mediaSelectionOptions indexesOfObjectsPassingTest:&__block_literal_global_33];
  return [(NSArray *)mediaSelectionOptions objectsAtIndexes:v4];
}

uint64_t __64__AVMediaSelectionGroup_playableMediaSelectionOptionsFromArray___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [a2 isPlayable];
}

+ (NSArray)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions withLocale:(NSLocale *)locale
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = [(NSLocale *)locale localeIdentifier];
  return (NSArray *)objc_msgSend(a1, "mediaSelectionOptionsFromArray:filteredAndSortedAccordingToPreferredLanguages:", mediaSelectionOptions, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 1));
}

+ (NSArray)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions filteredAndSortedAccordingToPreferredLanguages:(NSArray *)preferredLanguages
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  AVAllAvailableNSBundleCompatibleLanguageTagsForObjects(mediaSelectionOptions);
  v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](preferredLanguages, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = [(NSArray *)preferredLanguages countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(preferredLanguages);
        }
        uint64_t v11 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromString:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        if (v11) {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [(NSArray *)preferredLanguages countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }
  id v12 = (id)FigCopyRankedLanguagesAccordingToPreferredLanguages();
  v13 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  v14 = (void *)[MEMORY[0x1E4F28E60] indexSet];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v15 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __103__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke;
        v23[3] = &unk_1E57B2CB8;
        v23[4] = v19;
        v20 = [(NSArray *)mediaSelectionOptions indexesOfObjectsPassingTest:v23];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __103__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke_2;
        v22[3] = &unk_1E57B2CE0;
        v22[4] = v14;
        v22[5] = v13;
        v22[6] = mediaSelectionOptions;
        [(NSIndexSet *)v20 enumerateIndexesUsingBlock:v22];
        [v14 addIndexes:v20];
      }
      uint64_t v16 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }
  return v13;
}

uint64_t __103__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = [a2 unicodeLanguageIdentifier];
  if (!v4)
  {
    uint64_t v4 = [a2 unicodeLanguageCode];
    if (!v4) {
      return 0;
    }
  }
  objc_super v5 = *(void **)(a1 + 32);
  return [v5 isEqualToString:v4];
}

uint64_t __103__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) containsIndex:a2];
  if ((result & 1) == 0)
  {
    objc_super v5 = *(void **)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 48) objectAtIndex:a2];
    return [v5 addObject:v6];
  }
  return result;
}

+ (NSArray)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions withMediaCharacteristics:(NSArray *)mediaCharacteristics
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_withMediaCharacteristics___block_invoke;
  v5[3] = &unk_1E57B2CB8;
  v5[4] = mediaCharacteristics;
  return [(NSArray *)mediaSelectionOptions objectsAtIndexes:[(NSArray *)mediaSelectionOptions indexesOfObjectsPassingTest:v5]];
}

uint64_t __81__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_withMediaCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v5) {
    return 1;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v11;
LABEL_4:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v11 != v7) {
      objc_enumerationMutation(v4);
    }
    uint64_t result = [a2 hasMediaCharacteristic:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
    if (!result) {
      return result;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t result = 1;
      if (v6) {
        goto LABEL_4;
      }
      return result;
    }
  }
}

+ (NSArray)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions withoutMediaCharacteristics:(NSArray *)mediaCharacteristics
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_withoutMediaCharacteristics___block_invoke;
  v5[3] = &unk_1E57B2CB8;
  v5[4] = mediaCharacteristics;
  return [(NSArray *)mediaSelectionOptions objectsAtIndexes:[(NSArray *)mediaSelectionOptions indexesOfObjectsPassingTest:v5]];
}

uint64_t __84__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_withoutMediaCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
LABEL_4:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v4);
      }
      if ([a2 hasMediaCharacteristic:*(void *)(*((void *)&v10 + 1) + 8 * v8)]) {
        return 0;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        uint64_t result = 1;
        if (v6) {
          goto LABEL_4;
        }
        return result;
      }
    }
  }
  return 1;
}

- (id)currentBundleIdentifier
{
  return self->_mediaSelectionGroup->currentBundleIdentifier;
}

- (void)setCurrentBundleIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];

  self->_mediaSelectionGroup->currentBundleIdentifier = v4;
}

@end