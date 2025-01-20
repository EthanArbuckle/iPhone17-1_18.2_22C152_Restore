@interface AVAssetWriterInputSelectionOption
+ (id)assetWriterInputSelectionOptionWithAssetWriterInput:(id)a3;
+ (id)assetWriterInputSelectionOptionWithAssetWriterInput:(id)a3 displaysNonForcedSubtitles:(BOOL)a4;
- (AVAssetWriterInput)input;
- (AVAssetWriterInputSelectionOption)initWithAssetWriterInput:(id)a3;
- (AVAssetWriterInputSelectionOption)initWithAssetWriterInput:(id)a3 displaysNonForcedSubtitles:(BOOL)a4;
- (BOOL)_hasEqualValueForKey:(id)a3 asObject:(id)a4;
- (BOOL)_isAuxiliaryContent;
- (BOOL)_isDesignatedDefault;
- (BOOL)displaysNonForcedSubtitles;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlayable;
- (NSArray)metadata;
- (NSDictionary)outputSettings;
- (NSDictionary)trackReferences;
- (NSString)extendedLanguageTag;
- (NSString)languageCode;
- (NSString)mediaType;
- (id)_ancillaryDescription;
- (id)_taggedCharacteristics;
- (id)associatedMediaSelectionOptionInMediaSelectionGroup:(id)a3;
- (id)availableMetadataFormats;
- (id)commonMetadata;
- (id)locale;
- (id)mediaSubTypes;
- (id)metadataForFormat:(id)a3;
- (id)propertyList;
- (opaqueCMFormatDescription)sourceFormatHint;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVAssetWriterInputSelectionOption

+ (id)assetWriterInputSelectionOptionWithAssetWriterInput:(id)a3
{
  v3 = [[AVAssetWriterInputSelectionOption alloc] initWithAssetWriterInput:a3];
  return v3;
}

+ (id)assetWriterInputSelectionOptionWithAssetWriterInput:(id)a3 displaysNonForcedSubtitles:(BOOL)a4
{
  v4 = [[AVAssetWriterInputSelectionOption alloc] initWithAssetWriterInput:a3 displaysNonForcedSubtitles:a4];
  return v4;
}

- (AVAssetWriterInputSelectionOption)initWithAssetWriterInput:(id)a3
{
  return [(AVAssetWriterInputSelectionOption *)self initWithAssetWriterInput:a3 displaysNonForcedSubtitles:0];
}

- (AVAssetWriterInputSelectionOption)initWithAssetWriterInput:(id)a3 displaysNonForcedSubtitles:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVAssetWriterInputSelectionOption;
  v6 = [(AVMediaSelectionOption *)&v9 init];
  if (v6)
  {
    v6->_input = (AVAssetWriterInput *)a3;
    v6->_mediaType = (NSString *)objc_msgSend((id)objc_msgSend(a3, "mediaType"), "copy");
    v6->_outputSettings = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "outputSettings"), "copy");
    v7 = (void *)[a3 sourceFormatHint];
    if (v7) {
      v7 = (void *)CFRetain(v7);
    }
    v6->_sourceFormatHint = (opaqueCMFormatDescription *)v7;
    v6->_languageCode = (NSString *)objc_msgSend((id)objc_msgSend(a3, "languageCode"), "copy");
    v6->_extendedLanguageTag = (NSString *)objc_msgSend((id)objc_msgSend(a3, "extendedLanguageTag"), "copy");
    v6->_metadata = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "metadata"), "copy");
    v6->_trackReferences = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "_trackReferences"), "copy");
    v6->_displaysNonForcedSubtitles = a4;
    v6->_enabled = [a3 marksOutputTrackAsEnabled];
  }
  return v6;
}

- (void)dealloc
{
  sourceFormatHint = self->_sourceFormatHint;
  if (sourceFormatHint) {
    CFRelease(sourceFormatHint);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterInputSelectionOption;
  [(AVMediaSelectionOption *)&v4 dealloc];
}

- (BOOL)_hasEqualValueForKey:(id)a3 asObject:(id)a4
{
  v6 = (void *)-[AVAssetWriterInputSelectionOption valueForKey:](self, "valueForKey:");
  uint64_t v7 = [a4 valueForKey:a3];
  if (v6)
  {
    if ([v6 isEqual:v7]) {
      return 1;
    }
  }
  else if (!v7)
  {
    return 1;
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (input = self->_input, input == (AVAssetWriterInput *)[a3 input]))
    {
      BOOL v6 = [(AVAssetWriterInputSelectionOption *)self _hasEqualValueForKey:@"languageCode" asObject:a3];
      if (v6)
      {
        BOOL v6 = [(AVAssetWriterInputSelectionOption *)self _hasEqualValueForKey:@"extendedLanguageTag" asObject:a3];
        if (v6)
        {
          BOOL v6 = [(AVAssetWriterInputSelectionOption *)self _hasEqualValueForKey:@"metadata" asObject:a3];
          if (v6)
          {
            BOOL v6 = [(AVAssetWriterInputSelectionOption *)self _hasEqualValueForKey:@"trackReferences" asObject:a3];
            if (v6)
            {
              LOBYTE(v6) = [(AVAssetWriterInputSelectionOption *)self _hasEqualValueForKey:@"displaysNonForcedSubtitles" asObject:a3];
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  input = self->_input;
  NSUInteger v4 = [(NSString *)self->_languageCode hash] ^ (unint64_t)input;
  NSUInteger v5 = [(NSString *)self->_extendedLanguageTag hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_metadata hash];
  return v6 ^ [(NSDictionary *)self->_trackReferences hash] ^ self->_displaysNonForcedSubtitles;
}

- (id)_ancillaryDescription
{
  return &stru_1EE5953B8;
}

- (id)mediaSubTypes
{
  int valuePtr = 0;
  if (!self->_outputSettings)
  {
    sourceFormatHint = self->_sourceFormatHint;
    if (!sourceFormatHint) {
      return (id)[MEMORY[0x1E4F1C978] array];
    }
    CFTypeID v5 = CFGetTypeID(sourceFormatHint);
    if (v5 != CMFormatDescriptionGetTypeID()) {
      return (id)[MEMORY[0x1E4F1C978] array];
    }
    int MediaSubType = CMFormatDescriptionGetMediaSubType(self->_sourceFormatHint);
    CFNumberRef v3 = 0;
    goto LABEL_12;
  }
  if ([(NSString *)self->_mediaType isEqualToString:@"soun"]) {
    CFNumberRef v3 = [(NSDictionary *)self->_outputSettings objectForKey:*MEMORY[0x1E4F151E0]];
  }
  else {
    CFNumberRef v3 = 0;
  }
  if ([(NSString *)self->_mediaType isEqualToString:@"vide"]
    || [(NSString *)self->_mediaType isEqualToString:@"auxv"])
  {
    id v7 = [(NSDictionary *)self->_outputSettings objectForKey:@"AVVideoCodecKey"];
    if (v7)
    {
      int MediaSubType = AVOSTypeForString(v7);
LABEL_12:
      int valuePtr = MediaSubType;
      if (MediaSubType) {
        CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
      }
    }
  }
  if (v3) {
    return (id)[MEMORY[0x1E4F1C978] arrayWithObject:v3];
  }
  return (id)[MEMORY[0x1E4F1C978] array];
}

- (id)_taggedCharacteristics
{
  CFNumberRef v3 = +[AVMetadataItem metadataItemsFromArray:[(AVAssetWriterInputSelectionOption *)self metadataForFormat:@"com.apple.quicktime.udta"] withKey:@"tagc" keySpace:@"udta"];
  NSUInteger v4 = +[AVMetadataItem metadataItemsFromArray:[(AVAssetWriterInputSelectionOption *)self metadataForFormat:@"org.mp4ra"] withKey:@"tagc" keySpace:@"uiso"];
  return [(NSArray *)v3 arrayByAddingObjectsFromArray:v4];
}

- (BOOL)_isAuxiliaryContent
{
  return objc_msgSend(+[AVMetadataItem metadataItemsFromArray:withStringValue:](AVMetadataItem, "metadataItemsFromArray:withStringValue:", -[AVAssetWriterInputSelectionOption _taggedCharacteristics](self, "_taggedCharacteristics"), @"public.auxiliary-content"), "count") != 0;
}

- (BOOL)isPlayable
{
  return self->_outputSettings
      || !self->_sourceFormatHint
      || !+[AVURLAsset _avfValidationPlist]
      || FigMediaValidatorValidateFormatDescription() == 0;
}

- (BOOL)_isDesignatedDefault
{
  return self->_enabled;
}

- (id)locale
{
  CFStringRef extendedLanguageTag = (const __CFString *)self->_extendedLanguageTag;
  if (extendedLanguageTag || (CFStringRef extendedLanguageTag = (const __CFString *)self->_languageCode) != 0) {
    CFLocaleRef v3 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], extendedLanguageTag);
  }
  else {
    CFLocaleRef v3 = 0;
  }
  return v3;
}

- (id)commonMetadata
{
  CFLocaleRef v3 = [(NSArray *)self->_metadata indexesOfObjectsPassingTest:&__block_literal_global_9];
  metadata = self->_metadata;
  return [(NSArray *)metadata objectsAtIndexes:v3];
}

BOOL __51__AVAssetWriterInputSelectionOption_commonMetadata__block_invoke(uint64_t a1, void *a2)
{
  return [a2 commonKey] != 0;
}

- (id)availableMetadataFormats
{
  CFLocaleRef v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ([(NSArray *)+[AVMetadataItem metadataItemsFromArray:self->_metadata withKey:0 keySpace:@"udta"] count])
  {
    [v3 addObject:@"com.apple.quicktime.udta"];
  }
  if ([(NSArray *)+[AVMetadataItem metadataItemsFromArray:self->_metadata withKey:0 keySpace:@"uiso"] count])
  {
    [v3 addObject:@"org.mp4ra"];
    if (+[AVMetadataItem _clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace])
    {
      [v3 addObject:@"com.apple.quicktime.udta"];
    }
  }
  if ([(NSArray *)+[AVMetadataItem metadataItemsFromArray:self->_metadata withKey:0 keySpace:@"mdta"] count])
  {
    [v3 addObject:@"com.apple.quicktime.mdta"];
  }
  if ([(NSArray *)+[AVMetadataItem metadataItemsFromArray:self->_metadata withKey:0 keySpace:@"itsk"] count])
  {
    [v3 addObject:@"com.apple.itunes"];
  }
  if ([(NSArray *)+[AVMetadataItem metadataItemsFromArray:self->_metadata withKey:0 keySpace:@"org.id3"] count])
  {
    [v3 addObject:@"org.id3"];
  }
  return v3;
}

- (id)metadataForFormat:(id)a3
{
  if ([a3 isEqualToString:@"com.apple.quicktime.udta"]) {
    CFTypeID v5 = @"udta";
  }
  else {
    CFTypeID v5 = 0;
  }
  if ([a3 isEqualToString:@"org.mp4ra"])
  {
    uint64_t v6 = &AVMetadataKeySpaceISOUserData;
LABEL_10:
    id v7 = (__CFString *)*v6;
    goto LABEL_11;
  }
  if ([a3 isEqualToString:@"com.apple.quicktime.mdta"])
  {
    uint64_t v6 = &AVMetadataKeySpaceQuickTimeMetadata;
    goto LABEL_10;
  }
  if ([a3 isEqualToString:@"com.apple.itunes"])
  {
    uint64_t v6 = &AVMetadataKeySpaceiTunes;
    goto LABEL_10;
  }
  if ([a3 isEqualToString:@"org.id3"]) {
    id v7 = @"org.id3";
  }
  else {
    id v7 = v5;
  }
LABEL_11:
  metadata = self->_metadata;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__AVAssetWriterInputSelectionOption_metadataForFormat___block_invoke;
  v11[3] = &unk_1E57B2CB8;
  v11[4] = v7;
  objc_super v9 = [(NSArray *)self->_metadata objectsAtIndexes:[(NSArray *)metadata indexesOfObjectsPassingTest:v11]];
  if ([(__CFString *)v7 isEqualToString:@"udta"]
    && +[AVMetadataItem _clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace])
  {
    return [(NSArray *)v9 arrayByAddingObjectsFromArray:+[AVMetadataItem _replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:[(AVAssetWriterInputSelectionOption *)self metadataForFormat:@"org.mp4ra"]]];
  }
  return v9;
}

uint64_t __55__AVAssetWriterInputSelectionOption_metadataForFormat___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 keySpace];
  return [v2 isEqual:v3];
}

- (id)associatedMediaSelectionOptionInMediaSelectionGroup:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  CFTypeID v5 = (void *)[a3 inputs];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  trackReferences = self->_trackReferences;
  id result = [(NSDictionary *)trackReferences countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (result)
  {
    id v8 = result;
    uint64_t v9 = *(void *)v25;
    uint64_t v18 = *(void *)v25;
    v19 = trackReferences;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(trackReferences);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v12 = -[NSDictionary objectForKey:](self->_trackReferences, "objectForKey:", v11, v18);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * j);
              if ([v5 containsObject:v17]) {
                return +[AVAssetWriterInputSelectionOption assetWriterInputSelectionOptionWithAssetWriterInput:v17];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
        uint64_t v9 = v18;
        trackReferences = v19;
      }
      id v8 = [(NSDictionary *)v19 countByEnumeratingWithState:&v24 objects:v29 count:16];
      id result = 0;
    }
    while (v8);
  }
  return result;
}

- (id)propertyList
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AVAssetWriterInputSelectionOption *)self input];
  NSUInteger v4 = @"UnsafeUnretainedPointerData";
  v5[0] = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v3 length:8];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
}

- (AVAssetWriterInput)input
{
  return self->_input;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (NSDictionary)outputSettings
{
  return self->_outputSettings;
}

- (opaqueCMFormatDescription)sourceFormatHint
{
  return self->_sourceFormatHint;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)extendedLanguageTag
{
  return self->_extendedLanguageTag;
}

- (NSArray)metadata
{
  return self->_metadata;
}

- (NSDictionary)trackReferences
{
  return self->_trackReferences;
}

- (BOOL)displaysNonForcedSubtitles
{
  return self->_displaysNonForcedSubtitles;
}

@end