@interface AVFigAssetInspector
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumTimeOffsetFromLive;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)overallDurationHint;
- (AVFigAssetInspector)initWithFigAsset:(OpaqueFigAsset *)a3;
- (BOOL)_hasQTSaveRestriction;
- (BOOL)_isDefunct;
- (BOOL)_isStreaming;
- (BOOL)canContainFragments;
- (BOOL)containsFragments;
- (BOOL)hasProtectedContent;
- (BOOL)isCompatibleWithAirPlayVideo;
- (BOOL)isCompatibleWithPhotosTranscodingServiceWithOptions:(id)a3;
- (BOOL)isCompatibleWithSavedPhotosAlbum;
- (BOOL)isComposable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExportable;
- (BOOL)isPlayable;
- (BOOL)isReadable;
- (BOOL)providesPreciseDurationAndTiming;
- (BOOL)supportsAnalysisReporting;
- (CGAffineTransform)preferredTransform;
- (CGSize)maximumVideoResolution;
- (CGSize)naturalSize;
- (NSArray)contentKeySpecifiersEligibleForPreloading;
- (NSArray)figChapterGroupInfo;
- (NSArray)figChapters;
- (NSArray)variants;
- (NSURL)URL;
- (NSURL)originalNetworkContentURL;
- (NSURL)resolvedURL;
- (OpaqueFigAsset)_figAsset;
- (OpaqueFigFormatReader)_copyFormatReader;
- (float)preferredRate;
- (float)preferredSoundCheckVolumeNormalization;
- (float)preferredVolume;
- (id)SHA1Digest;
- (id)_assetAnalysisMessages;
- (id)_localizedMediaSelectionOptionDisplayNames;
- (id)_mediaSelectionGroupDictionaries;
- (id)_nameForProxy;
- (id)alternateTrackGroups;
- (id)availableMetadataFormats;
- (id)availableVideoDynamicRanges;
- (id)commonMetadata;
- (id)creationDate;
- (id)httpSessionIdentifier;
- (id)identifyingTag;
- (id)identifyingTagClass;
- (id)lyrics;
- (id)makePropertyListForProxyWithOptions:(id)a3;
- (id)metadataForFormat:(id)a3;
- (id)preferredDisplayCriteria;
- (id)propertyListForProxy;
- (id)trackReferences;
- (int)naturalTimeScale;
- (int64_t)_moovAtomSize;
- (int64_t)firstFragmentSequenceNumber;
- (int64_t)fragmentCount;
- (int64_t)trackCount;
- (unint64_t)downloadToken;
- (unint64_t)hash;
- (void)_valueAsCFTypeForProperty:(__CFString *)a3;
- (void)dealloc;
@end

@implementation AVFigAssetInspector

- (BOOL)_isStreaming
{
  checkIsStreamingOnce = self->_checkIsStreamingOnce;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__AVFigAssetInspector__isStreaming__block_invoke;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  [(AVDispatchOnce *)checkIsStreamingOnce runBlockOnce:v5];
  return self->_isStreaming;
}

uint64_t __35__AVFigAssetInspector__isStreaming__block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _tollFreeBridgedObjectForProperty:*MEMORY[0x1E4F32188]];
  uint64_t result = [v2 isEqualToString:*MEMORY[0x1E4F324F0]];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = result;
  return result;
}

- (void)_valueAsCFTypeForProperty:(__CFString *)a3
{
  v9 = 0;
  uint64_t result = [(AVFigAssetInspector *)self _figAsset];
  if (result)
  {
    uint64_t CMBaseObject = FigAssetGetCMBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    v8 = *(void (**)(uint64_t, __CFString *, void, void **))(v7 + 48);
    if (v8)
    {
      v8(CMBaseObject, a3, *MEMORY[0x1E4F1CF80], &v9);
      return v9;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (OpaqueFigAsset)_figAsset
{
  return self->_figAsset;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  if (self) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self _timeForProperty:*MEMORY[0x1E4F347E0]];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return self;
}

- (id)_localizedMediaSelectionOptionDisplayNames
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(AVFigObjectInspector *)self _nonNilDictionaryForProperty:@"LocalizedMSODisplayNames"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          [v2 objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * i)];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            return (id)[MEMORY[0x1E4F1C9E8] dictionary];
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    return v2;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
    return (id)[v7 dictionary];
  }
}

- (id)_mediaSelectionGroupDictionaries
{
  return [(AVFigObjectInspector *)self _nonNilArrayForProperty:*MEMORY[0x1E4F347F8]];
}

- (int64_t)trackCount
{
  id v2 = [(AVFigObjectInspector *)self _nonNilArrayForProperty:*MEMORY[0x1E4F32310]];
  return [v2 count];
}

- (AVFigAssetInspector)initWithFigAsset:(OpaqueFigAsset *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVFigAssetInspector;
  uint64_t v4 = [(AVFigAssetInspector *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_figAsset = (OpaqueFigAsset *)CFRetain(a3);
      v5->_checkIsStreamingOnce = objc_alloc_init(AVDispatchOnce);
      v5->_makeDisplayCriteriaOnce = objc_alloc_init(AVDispatchOnce);
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  figAsset = self->_figAsset;
  if (figAsset) {
    CFRelease(figAsset);
  }

  self->_displayCriteria = 0;
  v4.receiver = self;
  v4.super_class = (Class)AVFigAssetInspector;
  [(AVFigAssetInspector *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(AVFigAssetInspector *)self _figAsset];
  uint64_t v6 = [a3 _figAsset];
  if (v5 == (OpaqueFigAsset *)v6) {
    return 1;
  }
  objc_super v7 = (const void *)v6;
  BOOL result = 0;
  if (v5)
  {
    if (v7) {
      return CFEqual(v5, v7) != 0;
    }
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v3 = [(AVFigAssetInspector *)self _figAsset];
  if (v3)
  {
    return CFHash(v3);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AVFigAssetInspector;
    return [(AVFigAssetInspector *)&v5 hash];
  }
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  objc_super v7 = 0;
  BOOL result = (OpaqueFigFormatReader *)self->_figAsset;
  if (result)
  {
    uint64_t CMBaseObject = FigAssetGetCMBaseObject();
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void (**)(uint64_t, void, void, OpaqueFigFormatReader **))(v5 + 48);
    if (v6)
    {
      v6(CMBaseObject, *MEMORY[0x1E4F32230], *MEMORY[0x1E4F1CF80], &v7);
      return v7;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)identifyingTagClass
{
  int v2 = [(AVFigObjectInspector *)self _SInt32ForProperty:*MEMORY[0x1E4F32298]];
  if (v2 == 2)
  {
    uint64_t v3 = (id *)MEMORY[0x1E4F442E8];
    return *v3;
  }
  if (!v2)
  {
    uint64_t v3 = (id *)MEMORY[0x1E4F442E0];
    return *v3;
  }
  return 0;
}

- (id)identifyingTag
{
  return [(AVFigObjectInspector *)self _stringForProperty:*MEMORY[0x1E4F32290]];
}

- (id)httpSessionIdentifier
{
  id result = [(AVFigObjectInspector *)self _stringForProperty:*MEMORY[0x1E4F32280]];
  if (result)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:result];
    return v3;
  }
  return result;
}

- (NSArray)variants
{
  uint64_t v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  CFArrayRef v4 = [(AVFigAssetInspector *)self _valueAsCFTypeForProperty:*MEMORY[0x1E4F32248]];
  if (v4)
  {
    CFArrayRef v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount(v5);
      if (Count)
      {
        CFIndex v8 = Count;
        for (CFIndex i = 0; i != v8; ++i)
        {
          long long v10 = [[AVAssetVariant alloc] initWithFigAlternate:CFArrayGetValueAtIndex(v5, i)];
          if (v10) {
            [(NSArray *)v3 addObject:v10];
          }
        }
      }
    }
    CFRelease(v5);
  }
  return v3;
}

- (float)preferredRate
{
  LODWORD(v2) = 1.0;
  [(AVFigObjectInspector *)self _floatForProperty:*MEMORY[0x1E4F34810] defaultValue:v2];
  return result;
}

- (float)preferredVolume
{
  LODWORD(v2) = 1.0;
  [(AVFigObjectInspector *)self _floatForProperty:*MEMORY[0x1E4F34820] defaultValue:v2];
  return result;
}

- (float)preferredSoundCheckVolumeNormalization
{
  [(AVFigObjectInspector *)self _floatForProperty:*MEMORY[0x1E4F34828] defaultValue:0.0];
  return result;
}

- (CGAffineTransform)preferredTransform
{
  if (self) {
    return (CGAffineTransform *)[(CGAffineTransform *)self _affineTransformForProperty:*MEMORY[0x1E4F34818]];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (CGSize)naturalSize
{
  v4.receiver = self;
  v4.super_class = (Class)AVFigAssetInspector;
  [(AVAssetInspector *)&v4 naturalSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (int)naturalTimeScale
{
  int valuePtr = 0;
  CFNumberRef number = 0;
  double v2 = [(AVFigAssetInspector *)self _copyFormatReader];
  if (v2)
  {
    double v3 = v2;
    uint64_t FigBaseObject = FigFormatReaderGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    objc_super v7 = *(void (**)(uint64_t, void, void, CFNumberRef *))(v6 + 48);
    if (v7)
    {
      v7(FigBaseObject, *MEMORY[0x1E4F32BA0], *MEMORY[0x1E4F1CF80], &number);
      if (number)
      {
        CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
        if (number) {
          CFRelease(number);
        }
      }
    }
    CFRelease(v3);
    LODWORD(v2) = valuePtr;
  }
  return (int)v2;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumTimeOffsetFromLive
{
  if (self)
  {
    uint64_t v3 = *MEMORY[0x1E4F34800];
    long long v4 = *MEMORY[0x1E4F1F9F8];
    uint64_t v5 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self _timeForProperty:v3 defaultValue:&v4];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }
  return self;
}

- (BOOL)providesPreciseDurationAndTiming
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F322D8]] != 0;
}

- (id)alternateTrackGroups
{
  return [(AVFigObjectInspector *)self _nonNilArrayForProperty:*MEMORY[0x1E4F32180]];
}

- (id)trackReferences
{
  return [(AVFigObjectInspector *)self _nonNilDictionaryForProperty:*MEMORY[0x1E4F32308]];
}

- (id)creationDate
{
  id v2 = [(AVFigObjectInspector *)self _tollFreeBridgedObjectForProperty:*MEMORY[0x1E4F347D8]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    id v2 = (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v2, *MEMORY[0x1E4F33060], @"creationDate", *MEMORY[0x1E4F33020], @"comn", *MEMORY[0x1E4F33028], 0);
  }
  if (!v2) {
    return 0;
  }
  return +[AVMetadataItem _metadataItemWithFigMetadataDictionary:v2];
}

- (id)lyrics
{
  return [(AVFigObjectInspector *)self _stringForProperty:*MEMORY[0x1E4F347F0]];
}

- (id)commonMetadata
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [(AVFigObjectInspector *)self _nonNilArrayForProperty:*MEMORY[0x1E4F321B8]];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        if (v8) {
          [v3 addObject:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)availableMetadataFormats
{
  return [(AVFigObjectInspector *)self _nonNilArrayForProperty:*MEMORY[0x1E4F32190]];
}

- (id)metadataForFormat:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ([a3 isEqualToString:@"com.apple.quicktime.udta"])
  {
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F322E8];
LABEL_15:
    uint64_t v9 = *v6;
    goto LABEL_16;
  }
  if ([a3 isEqualToString:@"org.mp4ra"])
  {
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F32270];
    goto LABEL_15;
  }
  if ([a3 isEqualToString:@"com.apple.quicktime.mdta"])
  {
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F322E0];
    goto LABEL_15;
  }
  if ([a3 isEqualToString:@"com.apple.itunes"])
  {
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F32318];
    goto LABEL_15;
  }
  if ([a3 isEqualToString:@"org.id3"])
  {
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F32260];
    int v8 = dyld_program_sdk_at_least();
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F32268];
    if (v8) {
      uint64_t v6 = v7;
    }
    goto LABEL_15;
  }
  if ([a3 isEqualToString:0x1EE594C18])
  {
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F32260];
    goto LABEL_15;
  }
  if ([a3 isEqualToString:@"com.apple.quicktime.HLS"]) {
    uint64_t v9 = *MEMORY[0x1E4F32250];
  }
  else {
    uint64_t v9 = 0;
  }
LABEL_16:
  id v10 = [(AVFigObjectInspector *)self _nonNilArrayForProperty:v9];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:*(void *)(*((void *)&v17 + 1) + 8 * v14)];
        if (v15) {
          [v5 addObject:v15];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
  return v5;
}

- (BOOL)_hasQTSaveRestriction
{
  if (!self->didCheckForSaveRestriction)
  {
    id v3 = [(AVFigAssetInspector *)self metadataForFormat:@"com.apple.quicktime.udta"];
    uint64_t v4 = +[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v3, [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:1853055350], @"udta");
    if ([(NSArray *)v4 count])
    {
      int v6 = 0;
      objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", 0), "dataValue"), "getBytes:length:", &v6, 4);
      if ((v6 & 0x1000000) != 0) {
        self->hasSaveRestriction = 1;
      }
    }
    self->didCheckForSaveRestriction = 1;
  }
  return self->hasSaveRestriction;
}

- (BOOL)isExportable
{
  BOOL v3 = [(AVFigAssetInspector *)self hasProtectedContent];
  return (v3 | [(AVFigAssetInspector *)self _hasQTSaveRestriction]) ^ 1;
}

- (BOOL)isReadable
{
  BOOL v3 = [(AVFigAssetInspector *)self hasProtectedContent];
  return (v3 | [(AVFigAssetInspector *)self _hasQTSaveRestriction]) ^ 1;
}

- (BOOL)isComposable
{
  BOOL v3 = [(AVFigAssetInspector *)self hasProtectedContent];
  return (v3 | [(AVFigAssetInspector *)self _hasQTSaveRestriction]) ^ 1;
}

- (NSArray)figChapterGroupInfo
{
  return (NSArray *)[(AVFigObjectInspector *)self _nonNilArrayForProperty:*MEMORY[0x1E4F321B0]];
}

- (NSArray)figChapters
{
  return (NSArray *)[(AVFigObjectInspector *)self _nonNilArrayForProperty:*MEMORY[0x1E4F347D0]];
}

- (NSURL)URL
{
  return (NSURL *)[(AVFigObjectInspector *)self _tollFreeBridgedObjectForProperty:*MEMORY[0x1E4F32200]];
}

- (NSURL)resolvedURL
{
  return (NSURL *)[(AVFigObjectInspector *)self _tollFreeBridgedObjectForProperty:*MEMORY[0x1E4F322F0]];
}

- (NSURL)originalNetworkContentURL
{
  return (NSURL *)[(AVFigObjectInspector *)self _tollFreeBridgedObjectForProperty:*MEMORY[0x1E4F322C8]];
}

- (unint64_t)downloadToken
{
  unint64_t result = [(AVFigObjectInspector *)self _tollFreeBridgedObjectForProperty:*MEMORY[0x1E4F32220]];
  if (result)
  {
    return [(id)result unsignedLongLongValue];
  }
  return result;
}

- (NSArray)contentKeySpecifiersEligibleForPreloading
{
  BOOL v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  CFArrayRef v4 = [(AVFigAssetInspector *)self _valueAsCFTypeForProperty:*MEMORY[0x1E4F32258]];
  if (v4)
  {
    CFArrayRef v5 = v4;
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      CFIndex v8 = 0;
      uint64_t v9 = MEMORY[0x1E4F1CC08];
      do
      {
        CFArrayGetValueAtIndex(v5, v8);
        if (FigContentKeySpecifierGetKeySystem() == 1) {
          id v10 = @"FairPlayStreaming";
        }
        else {
          id v10 = @"ClearKeySystem";
        }
        uint64_t v11 = +[AVContentKeySpecifier contentKeySpecifierForKeySystem:v10 identifier:FigContentKeySpecifierGetIdentifier() options:v9];
        if (v11) {
          [(NSArray *)v3 addObject:v11];
        }
        ++v8;
      }
      while (v7 != v8);
    }
    CFRelease(v5);
  }
  return v3;
}

- (BOOL)hasProtectedContent
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F322D0]] != 0;
}

- (BOOL)isPlayable
{
  BOOL v3 = [(AVFigAssetInspector *)self _isStreaming];
  return ![(AVFigObjectInspector *)self _SInt32ForProperty:*MEMORY[0x1E4F322A8] defaultValue:4294955496]|| v3;
}

- (BOOL)isCompatibleWithPhotosTranscodingServiceWithOptions:(id)a3
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F321C8]] != 0;
}

- (BOOL)isCompatibleWithSavedPhotosAlbum
{
  return [(AVFigObjectInspector *)self _SInt32ForProperty:*MEMORY[0x1E4F321A8] defaultValue:4294955496] == 0;
}

- (BOOL)isCompatibleWithAirPlayVideo
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F321C0]] != 0;
}

- (id)SHA1Digest
{
  return [(AVFigObjectInspector *)self _tollFreeBridgedObjectForProperty:*MEMORY[0x1E4F322F8]];
}

- (BOOL)canContainFragments
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F321E8]] != 0;
}

- (BOOL)containsFragments
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F321D0]] != 0;
}

- (int64_t)firstFragmentSequenceNumber
{
  return [(AVFigObjectInspector *)self _SInt32ForProperty:*MEMORY[0x1E4F32228]];
}

- (int64_t)fragmentCount
{
  return [(AVFigObjectInspector *)self _SInt32ForProperty:*MEMORY[0x1E4F32240]];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)overallDurationHint
{
  if (self) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self _timeForProperty:*MEMORY[0x1E4F322B0]];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return self;
}

- (BOOL)supportsAnalysisReporting
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F347E8]] != 0;
}

- (id)_assetAnalysisMessages
{
  return [(AVFigObjectInspector *)self _tollFreeBridgedObjectForProperty:*MEMORY[0x1E4F347C8]];
}

- (id)_nameForProxy
{
  BOOL v3 = [(NSString *)[(NSURL *)[(AVFigAssetInspector *)self resolvedURL] path] lastPathComponent];
  id v4 = [(AVFigAssetInspector *)self identifyingTag];
  if (!v4) {
    return v3;
  }
  CFArrayRef v5 = v4;
  int v6 = [(AVFigObjectInspector *)self _SInt32ForProperty:*MEMORY[0x1E4F32298]];
  if (v6 != 4)
  {
    if (v6 != 2) {
      return v3;
    }
    CFArrayRef v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F442D8], "typeWithMIMEType:", v5), "identifier");
    if (!v5) {
      return v3;
    }
  }
  return (id)AVFileNameWithExtensionThatAccordsWithUTI(v3, v5);
}

- (int64_t)_moovAtomSize
{
  return [(AVFigObjectInspector *)self _longLongForProperty:*MEMORY[0x1E4F32320]];
}

- (id)propertyListForProxy
{
  id v3 = [(AVFigObjectInspector *)self _dataForProperty:*MEMORY[0x1E4F322B8]];
  unint64_t v4 = ((unint64_t)[(AVFigObjectInspector *)self _longLongForProperty:*MEMORY[0x1E4F321F0]] >> 8) & 1;
  id v5 = [(AVFigAssetInspector *)self _nameForProxy];
  return +[AVAssetProxy makePropertyListForMovieProxyHeader:v3 name:v5 prefersNominalDurations:v4];
}

- (BOOL)_isDefunct
{
  unsigned __int8 v9 = 0;
  id v2 = [(AVFigAssetInspector *)self _figAsset];
  id v3 = *(void **)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  if (*v4 < 5uLL)
  {
    int v6 = 0;
    LOBYTE(v5) = 0;
  }
  else
  {
    id v5 = (unsigned int (*)(OpaqueFigAsset *, unsigned __int8 *))v4[11];
    if (v5)
    {
      LOBYTE(v5) = v5(v2, &v9) == 0;
      int v6 = v9;
    }
    else
    {
      int v6 = 0;
    }
  }
  if (v5) {
    int v7 = v6;
  }
  else {
    int v7 = 1;
  }
  if (!v6) {
    int v6 = v7;
  }
  return v6 == 1;
}

- (id)makePropertyListForProxyWithOptions:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  CFDataRef theData = 0;
  CFTypeRef v77 = 0;
  CFTypeRef cf = 0;
  CFTypeRef v75 = 0;
  CFTypeRef v72 = 0;
  CFTypeRef v73 = 0;
  unint64_t v5 = [(AVFigObjectInspector *)self _longLongForProperty:*MEMORY[0x1E4F321F0]];
  uint64_t v6 = *MEMORY[0x1E4F322B8];
  v57 = self;
  id v7 = [(AVFigObjectInspector *)self _dataForProperty:*MEMORY[0x1E4F322B8]];
  if (v7)
  {
    if (!objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVPropertyListForProxyCreationOption_ReduceMetadataForPhotoLibrary"), "BOOLValue"))goto LABEL_35; {
    if (makePropertyListForProxyWithOptions__commonKeysWeWantToKeepOnce != -1)
    }
      dispatch_once(&makePropertyListForProxyWithOptions__commonKeysWeWantToKeepOnce, &__block_literal_global_27);
    CFIndex v8 = (void *)[MEMORY[0x1E4F1CA48] array];
    unsigned __int8 v9 = (void *)[MEMORY[0x1E4F1CA80] set];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    obuint64_t j = [(AVFigAssetInspector *)v57 availableMetadataFormats];
    uint64_t v58 = [obj countByEnumeratingWithState:&v68 objects:v86 count:16];
    if (!v58)
    {
LABEL_35:
      id v7 = +[AVAssetProxy makePropertyListForMovieProxyHeader:v7 name:[(AVFigAssetInspector *)v57 _nameForProxy] prefersNominalDurations:(v5 >> 8) & 1];
      CFTypeRef v34 = cf;
      if (!cf) {
        goto LABEL_59;
      }
      goto LABEL_36;
    }
    unint64_t v53 = v5;
    id v54 = v7;
    uint64_t v52 = v6;
    char v10 = 0;
    uint64_t v56 = *(void *)v69;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v69 != v56) {
          objc_enumerationMutation(obj);
        }
        uint64_t v59 = v11;
        uint64_t v12 = *(void *)(*((void *)&v68 + 1) + 8 * v11);
        id v13 = [(AVFigAssetInspector *)v57 metadataForFormat:v12];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v64 objects:v85 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v65 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              uint64_t v19 = [v18 commonKey];
              if (v19
                && [(id)makePropertyListForProxyWithOptions__commonKeysWeWantToKeep containsObject:v19])
              {
                [v8 addObject:v18];
                [v9 addObject:v12];
              }
              else
              {
                char v10 = 1;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v64 objects:v85 count:16];
          }
          while (v15);
        }
        uint64_t v11 = v59 + 1;
      }
      while (v59 + 1 != v58);
      uint64_t v58 = [obj countByEnumeratingWithState:&v68 objects:v86 count:16];
    }
    while (v58);
    if ((v10 & 1) == 0)
    {
      unint64_t v5 = v53;
      id v7 = v54;
      goto LABEL_35;
    }
    long long v20 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", -[AVFigAssetInspector availableMetadataFormats](v57, "availableMetadataFormats"));
    [v20 minusSet:v9];
    v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", +[AVMetadataItem _figMetadataPropertyFromMetadataItems:](AVMetadataItem, "_figMetadataPropertyFromMetadataItems:", v8));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v22 = [v20 countByEnumeratingWithState:&v60 objects:v84 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v61;
      uint64_t v25 = *MEMORY[0x1E4F33070];
      uint64_t v26 = *MEMORY[0x1E4F33068];
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v61 != v24) {
            objc_enumerationMutation(v20);
          }
          objc_msgSend(v21, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "array"), v25, *(void *)(*((void *)&v60 + 1) + 8 * j), v26, 0));
        }
        uint64_t v23 = [v20 countByEnumeratingWithState:&v60 objects:v84 count:16];
      }
      while (v23);
    }
    uint64_t v28 = MEMORY[0x1E4F1CC38];
    uint64_t v29 = *MEMORY[0x1E4F330D8];
    v82[0] = *MEMORY[0x1E4F330E0];
    v82[1] = v29;
    v83[0] = MEMORY[0x1E4F1CC38];
    v83[1] = MEMORY[0x1E4F1CC38];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
    uint64_t v30 = *MEMORY[0x1E4F1CF80];
    if (FigMutableMovieCreateFromData()) {
      goto LABEL_58;
    }
    uint64_t FigBaseObject = FigMutableMovieGetFigBaseObject();
    uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v33 = v32 ? v32 : 0;
    v35 = *(unsigned int (**)(uint64_t, void, void *))(v33 + 56);
    if (!v35 || v35(FigBaseObject, *MEMORY[0x1E4F33108], v21)) {
      goto LABEL_58;
    }
    uint64_t v80 = *MEMORY[0x1E4F330E8];
    uint64_t v81 = v28;
    uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    CFTypeRef v37 = v77;
    uint64_t v38 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v39 = v38 ? v38 : 0;
    v40 = *(unsigned int (**)(CFTypeRef, __CFString *, uint64_t, uint64_t, CFDataRef *))(v39 + 24);
    if (!v40) {
      goto LABEL_58;
    }
    if (v40(v37, @"com.apple.quicktime-movie", v36, v30, &theData)) {
      goto LABEL_58;
    }
    CFDataGetLength(theData);
    if (FigCreateBlockBufferWithCFDataNoCopy() || CMByteStreamCreateForBlockBuffer()) {
      goto LABEL_58;
    }
    uint64_t v41 = [(AVFigAssetInspector *)v57 resolvedURL];
    uint64_t CMBaseObject = CMByteStreamGetCMBaseObject();
    uint64_t v43 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v44 = v43 ? v43 : 0;
    v45 = *(unsigned int (**)(uint64_t, void, uint64_t))(v44 + 56);
    if (!v45 || v45(CMBaseObject, *MEMORY[0x1E4F1EC78], v41)) {
      goto LABEL_58;
    }
    uint64_t v78 = *MEMORY[0x1E4F320D8];
    uint64_t v79 = v28;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
    FigAssetCreateWithByteStream();
    uint64_t v46 = FigAssetGetCMBaseObject();
    uint64_t v47 = *(void *)(CMBaseObjectGetVTable() + 8);
    unint64_t v5 = v53;
    uint64_t v48 = v47 ? v47 : 0;
    v49 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v48 + 48);
    if (!v49)
    {
LABEL_58:
      id v7 = 0;
    }
    else
    {
      int v50 = v49(v46, v52, v30, &cf);
      CFTypeRef v34 = cf;
      if (!v50)
      {
        id v7 = (id)cf;
        CFTypeRef cf = 0;
        goto LABEL_35;
      }
      id v7 = 0;
      if (cf) {
LABEL_36:
      }
        CFRelease(v34);
    }
  }
LABEL_59:
  if (v75) {
    CFRelease(v75);
  }
  if (v72) {
    CFRelease(v72);
  }
  if (v73) {
    CFRelease(v73);
  }
  if (theData) {
    CFRelease(theData);
  }
  if (v77) {
    CFRelease(v77);
  }
  return v7;
}

uint64_t __59__AVFigAssetInspector_makePropertyListForProxyWithOptions___block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"creationDate", @"identifier", @"make", @"model", @"software", @"location", 0);
  makePropertyListForProxyWithOptions__commonKeysWeWantToKeep = result;
  return result;
}

- (CGSize)maximumVideoResolution
{
  [(AVFigObjectInspector *)self _sizeForProperty:*MEMORY[0x1E4F322A0]];
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)availableVideoDynamicRanges
{
  return [(AVFigObjectInspector *)self _arrayForProperty:*MEMORY[0x1E4F32198]];
}

- (id)preferredDisplayCriteria
{
  makeDisplayCriteriaOnce = self->_makeDisplayCriteriaOnce;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__AVFigAssetInspector_preferredDisplayCriteria__block_invoke;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  [(AVDispatchOnce *)makeDisplayCriteriaOnce runBlockOnce:v5];
  return self->_displayCriteria;
}

uint64_t __47__AVFigAssetInspector_preferredDisplayCriteria__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int valuePtr = 0;
  double v2 = (void *)[*(id *)(a1 + 32) availableVideoDynamicRanges];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unsigned __int8 v5 = 0;
    LODWORD(v6) = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v2);
        }
        unsigned int v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) integerValue];
        unsigned int v10 = MTGetVideoDynamicRangeQualityGrade();
        unsigned int v11 = v5;
        if (v5 <= v10) {
          unsigned __int8 v5 = v10;
        }
        if (v11 >= v10) {
          uint64_t v6 = v6;
        }
        else {
          uint64_t v6 = v9;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  CFNumberRef v12 = (const __CFNumber *)[*(id *)(a1 + 32) _valueAsCFTypeForProperty:*MEMORY[0x1E4F322C0]];
  if (v12)
  {
    CFNumberRef v13 = v12;
    CFNumberGetValue(v12, kCFNumberFloatType, &valuePtr);
    CFRelease(v13);
  }
  uint64_t v14 = [AVDisplayCriteria alloc];
  LODWORD(v15) = valuePtr;
  uint64_t result = [(AVDisplayCriteria *)v14 initWithRefreshRate:v6 videoDynamicRange:v15];
  *(void *)(*(void *)(a1 + 32) + 32) = result;
  return result;
}

@end