@interface AVAsset
+ (AVAsset)assetWithData:(id)a3 contentType:(id)a4 options:(id)a5;
+ (AVAsset)assetWithURL:(NSURL *)URL;
+ (AVAsset)assetWithURL:(id)a3 figPlaybackItem:(OpaqueFigPlaybackItem *)a4 trackIDs:(id)a5 dynamicBehavior:(BOOL)a6;
+ (BOOL)_assetCreationOptionsPrefersSandboxedOption:(id)a3;
+ (BOOL)_assetCreationOptionsRequiresInProcessOperation:(id)a3;
+ (BOOL)expectsPropertyRevisedNotifications;
+ (BOOL)supportsPlayerItems;
+ (id)assetProxyWithPropertyList:(id)a3;
+ (id)inspectionOnlyAssetWithFigAsset:(OpaqueFigAsset *)a3;
+ (id)inspectionOnlyAssetWithStreamDataParser:(id)a3 tracks:(id)a4;
+ (id)makeAssetLoggingIdentifier;
+ (void)initialize;
- (AVAsset)init;
- (AVAsset)initWithData:(id)a3 contentType:(id)a4 options:(id)a5;
- (AVAsset)initWithURL:(id)a3 options:(id)a4;
- (AVAssetReferenceRestrictions)referenceRestrictions;
- (AVAssetTrack)trackWithTrackID:(CMPersistentTrackID)trackID;
- (AVDisplayCriteria)preferredDisplayCriteria;
- (AVLoggingIdentifier)loggingIdentifier;
- (AVMediaSelection)preferredMediaSelection;
- (AVMediaSelectionGroup)mediaSelectionGroupForMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic;
- (AVMetadataItem)creationDate;
- (BOOL)_doNotLogURLs;
- (BOOL)_hasResourceLoaderDelegate;
- (BOOL)_isStreaming;
- (BOOL)_mindsFragments;
- (BOOL)_needsLegacyChangeNotifications;
- (BOOL)_prefersNominalDurations;
- (BOOL)_requiresInProcessOperation;
- (BOOL)canContainFragments;
- (BOOL)containsFragments;
- (BOOL)hasProtectedContent;
- (BOOL)isCompatibleWithAirPlayVideo;
- (BOOL)isCompatibleWithPhotosTranscodingServiceWithOptions:(id)a3;
- (BOOL)isCompatibleWithSavedPhotosAlbum;
- (BOOL)isComposable;
- (BOOL)isDefunct;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExportable;
- (BOOL)isPlayable;
- (BOOL)isProxy;
- (BOOL)isReadable;
- (BOOL)providesPreciseDurationAndTiming;
- (BOOL)supportsAnalysisReporting;
- (CGAffineTransform)preferredTransform;
- (CGSize)maximumVideoResolution;
- (CGSize)naturalSize;
- (CMPersistentTrackID)unusedTrackID;
- (CMTime)duration;
- (CMTime)minimumTimeOffsetFromLive;
- (CMTime)overallDurationHint;
- (Class)_classForTrackInspectors;
- (NSArray)allMediaSelections;
- (NSArray)availableChapterLocales;
- (NSArray)availableMediaCharacteristicsWithMediaSelectionOptions;
- (NSArray)availableMetadataFormats;
- (NSArray)chapterMetadataGroupsBestMatchingPreferredLanguages:(NSArray *)preferredLanguages;
- (NSArray)chapterMetadataGroupsWithTitleLocale:(NSLocale *)locale containingItemsWithCommonKeys:(NSArray *)commonKeys;
- (NSArray)commonMetadata;
- (NSArray)fragments;
- (NSArray)metadata;
- (NSArray)metadataForFormat:(AVMetadataFormat)format;
- (NSArray)trackGroups;
- (NSArray)tracks;
- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic;
- (NSArray)tracksWithMediaType:(AVMediaType)mediaType;
- (NSString)lyrics;
- (OpaqueFigAsset)_figAsset;
- (OpaqueFigFormatReader)_copyFormatReader;
- (OpaqueFigMutableComposition)_mutableComposition;
- (OpaqueFigPlaybackItem)_playbackItem;
- (double)_fragmentMindingInterval;
- (float)preferredRate;
- (float)preferredSoundCheckVolumeNormalization;
- (float)preferredVolume;
- (id)_ID3Metadata;
- (id)_absoluteURL;
- (id)_assetAnalysisMessages;
- (id)_assetInspector;
- (id)_assetInspectorLoader;
- (id)_availableCanonicalizedChapterLanguages;
- (id)_chapterDataTypeForMediaSubType:(int)a3;
- (id)_chapterMetadataGroupsBestMatchingPreferredLanguages:(id)a3 containingItemsWithCommonKeys:(id)a4;
- (id)_chapterMetadataGroupsWithFigChapterGroups:(id)a3 titleLanguage:(id)a4 containingItemsWithCommonKeys:(id)a5;
- (id)_chapterMetadataGroupsWithTitleLanguage:(id)a3 containingItemsWithCommonKeys:(id)a4;
- (id)_chapterTracks;
- (id)_comparisonToken;
- (id)_firstTrackGroupWithMediaTypes:(id)a3;
- (id)_localizedMediaSelectionOptionDisplayNames;
- (id)_mediaSelectionGroupDictionaries;
- (id)_nameForLogging;
- (id)_tracksWithClass:(Class)a3;
- (id)_weakReference;
- (id)alternateTrackGroups;
- (id)audioAlternatesTrackGroup;
- (id)availableChapterLanguages;
- (id)availableVideoDynamicRanges;
- (id)compatibleTrackForCompositionTrack:(id)a3;
- (id)makePropertyListForProxyWithOptions:(id)a3;
- (id)mediaSelectionGroupForPropertyList:(id)a3 mediaSelectionOption:(id *)a4;
- (id)propertyListForProxy;
- (id)subtitleAlternatesTrackGroup;
- (id)trackReferences;
- (id)tracksWithMediaCharacteristics:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int)naturalTimeScale;
- (int64_t)moovAtomSize;
- (int64_t)statusOfValueForKey:(id)a3;
- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4;
- (unint64_t)_addChapterMetadataItem:(id)a3 timeRange:(id *)a4 toChapters:(id)a5 fromIndex:(unint64_t)a6;
- (unint64_t)hash;
- (void)_loadChapterInfo;
- (void)_loadValuesSynchronouslyForKeys:(id)a3 trackKeys:(id)a4;
- (void)_serverHasDied;
- (void)_setFragmentMindingInterval:(double)a3;
- (void)_setIsAssociatedWithFragmentMinder:(BOOL)a3;
- (void)_setLoggingIdentifier:(id)a3;
- (void)cancelLoading;
- (void)dealloc;
- (void)findCompatibleTrackForCompositionTrack:(id)a3 completionHandler:(id)a4;
- (void)findUnusedTrackIDWithCompletionHandler:(void *)completionHandler;
- (void)loadChapterMetadataGroupsBestMatchingPreferredLanguages:(NSArray *)preferredLanguages completionHandler:(void *)completionHandler;
- (void)loadChapterMetadataGroupsWithTitleLocale:(NSLocale *)locale containingItemsWithCommonKeys:(NSArray *)commonKeys completionHandler:(void *)completionHandler;
- (void)loadMediaSelectionGroupForMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic completionHandler:(void *)completionHandler;
- (void)loadMetadataForFormat:(AVMetadataFormat)format completionHandler:(void *)completionHandler;
- (void)loadTrackWithTrackID:(CMPersistentTrackID)trackID completionHandler:(void *)completionHandler;
- (void)loadTracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic completionHandler:(void *)completionHandler;
- (void)loadTracksWithMediaType:(AVMediaType)mediaType completionHandler:(void *)completionHandler;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 keysForCollectionKeys:(id)a4 completionHandler:(id)a5;
@end

@implementation AVAsset

- (unint64_t)hash
{
  id v2 = [(AVAsset *)self _assetInspectorLoader];
  return [v2 hash];
}

+ (BOOL)supportsPlayerItems
{
  return 1;
}

- (AVLoggingIdentifier)loggingIdentifier
{
  id v2 = self->_asset->loggingIdentifier;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [(AVAsset *)self _assetInspectorLoader];
  uint64_t v6 = [a3 _assetInspectorLoader];
  return [v5 isEqual:v6];
}

- (OpaqueFigAsset)_figAsset
{
  id v2 = [(AVAsset *)self _assetInspectorLoader];
  return (OpaqueFigAsset *)[v2 _figAsset];
}

- (BOOL)_isStreaming
{
  id v2 = [(AVAsset *)self _assetInspectorLoader];
  return [v2 _isStreaming];
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  id v6 = [(AVAsset *)self _assetInspectorLoader];
  return [v6 statusOfValueForKey:a3 error:a4];
}

- (CMTime)duration
{
  result = [(AVAsset *)self _assetInspectorLoader];
  if (result)
  {
    return (CMTime *)[(CMTime *)result duration];
  }
  else
  {
    retstr->value = 0;
    *(void *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }
  return result;
}

+ (BOOL)_assetCreationOptionsRequiresInProcessOperation:(id)a3
{
  v3 = (void *)[a3 objectForKey:@"AVAssetRequiresInProcessOperationKey"];
  return v3 && ([v3 BOOLValue] & 1) != 0;
}

+ (BOOL)_assetCreationOptionsPrefersSandboxedOption:(id)a3
{
  v3 = (void *)[a3 objectForKey:@"AVAssetPrefersSandboxedParsingOptionKey"];
  return [v3 BOOLValue];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigKTraceInit();
  }
}

- (void)loadMediaSelectionGroupForMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic completionHandler:(void *)completionHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__AVAsset_loadMediaSelectionGroupForMediaCharacteristic_completionHandler___block_invoke;
  v4[3] = &unk_1E57B3180;
  v4[4] = self;
  v4[5] = mediaCharacteristic;
  v4[6] = completionHandler;
  AVLoadValueAsynchronously(self, @"availableMediaCharacteristicsWithMediaSelectionOptions", (uint64_t)v4);
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  id v6 = [(AVAsset *)self _assetInspectorLoader];
  [v6 loadValuesAsynchronouslyForKeys:a3 completionHandler:a4];
}

- (id)_tracksWithClass:(Class)a3
{
  id v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v6 = objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "trackIDs");
  v7 = v6;
  if (v6) {
    uint64_t v8 = [v6 count];
  }
  else {
    uint64_t v8 = objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "trackCount");
  }
  uint64_t v9 = v8;
  if (v8 >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      if (v7)
      {
        CFNumberRef v11 = (const __CFNumber *)[v7 objectAtIndex:v10];
        unsigned int valuePtr = 0;
        CFNumberGetValue(v11, kCFNumberSInt32Type, &valuePtr);
        id v12 = [a3 alloc];
        v13 = (void *)[v12 _initWithAsset:self trackID:valuePtr];
      }
      else
      {
        v13 = (void *)[[a3 alloc] _initWithAsset:self trackIndex:v10];
      }
      id v14 = v13;
      if (v14) {
        [v5 addObject:v14];
      }
      ++v10;
    }
    while (v9 != v10);
  }
  return v5;
}

- (id)_localizedMediaSelectionOptionDisplayNames
{
  id v2 = [(AVAsset *)self _assetInspector];
  return (id)[v2 _localizedMediaSelectionOptionDisplayNames];
}

uint64_t __75__AVAsset_loadMediaSelectionGroupForMediaCharacteristic_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) mediaSelectionGroupForMediaCharacteristic:*(void *)(a1 + 40)];
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (AVMediaSelectionGroup)mediaSelectionGroupForMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)mediaCharacteristic isEqualToString:@"AVMediaCharacteristicAudible"])
  {
    v19 = 0;
    id v5 = @"soun";
    id v6 = (uint64_t *)MEMORY[0x1E4F346E0];
LABEL_7:
    uint64_t v7 = *v6;
    goto LABEL_8;
  }
  if ([(NSString *)mediaCharacteristic isEqualToString:@"AVMediaCharacteristicLegible"])
  {
    id v5 = @"sbtl";
    v19 = @"clcp";
    id v6 = (uint64_t *)MEMORY[0x1E4F346E8];
    goto LABEL_7;
  }
  if ([(NSString *)mediaCharacteristic isEqualToString:@"AVMediaCharacteristicVisual"])
  {
    v19 = 0;
    id v5 = @"vide";
    id v6 = (uint64_t *)MEMORY[0x1E4F346F8];
    goto LABEL_7;
  }
  id v5 = 0;
  v19 = 0;
  uint64_t v7 = 0;
LABEL_8:
  if (!((unint64_t)v5 | v7)) {
    return 0;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [(AVAsset *)self _mediaSelectionGroupDictionaries];
  result = (AVMediaSelectionGroup *)[v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (result)
  {
    uint64_t v10 = result;
    v18 = self;
    uint64_t v11 = *(void *)v21;
    uint64_t v12 = *MEMORY[0x1E4F34718];
    uint64_t v13 = *MEMORY[0x1E4F34710];
    while (2)
    {
      for (i = 0; i != v10; i = (AVMediaSelectionGroup *)((char *)i + 1))
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "objectForKey:", v12, v18);
        if (v16)
        {
          v17 = v16;
          if (([v16 isEqualToString:v5] & 1) != 0
            || ([v17 isEqualToString:v19] & 1) != 0)
          {
            return +[AVMediaSelectionGroup mediaSelectionGroupWithAsset:v18 dictionary:v15];
          }
        }
        if (objc_msgSend((id)objc_msgSend(v15, "objectForKey:", v13), "containsObject:", v7)) {
          return +[AVMediaSelectionGroup mediaSelectionGroupWithAsset:v18 dictionary:v15];
        }
      }
      uint64_t v10 = (AVMediaSelectionGroup *)[v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      result = 0;
      if (v10) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)_mediaSelectionGroupDictionaries
{
  objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "_ensureAllDependenciesOfKeyAreLoaded:", @"availableMediaCharacteristicsWithMediaSelectionOptions");
  id v3 = [(AVAsset *)self _assetInspector];
  return (id)[v3 _mediaSelectionGroupDictionaries];
}

- (id)_weakReference
{
  return self->_asset->weakReference;
}

- (AVAsset)init
{
  v7.receiver = self;
  v7.super_class = (Class)AVAsset;
  id v3 = [(AVAsset *)&v7 init];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    AVRequireConcreteObject(v3, a2, v4);
    id v5 = objc_alloc_init(AVAssetInternal);
    v3->_asset = v5;
    if (v5)
    {
      v3->_asset->loadChapterInfoOnce = objc_alloc_init(AVDispatchOnce);
      v3->_asset->weakReference = [[AVWeakReference alloc] initWithReferencedObject:v3];
      v3->_asset->loggingIdentifier = (AVLoggingIdentifier *)+[AVAsset makeAssetLoggingIdentifier];
    }
    else
    {

      return 0;
    }
  }
  return v3;
}

- (BOOL)_prefersNominalDurations
{
  id v2 = [(AVAsset *)self _assetInspectorLoader];
  return [v2 _prefersNominalDurations];
}

- (id)_nameForLogging
{
  asset = self->_asset;
  if (!asset) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
  }
  loggingIdentifier = asset->loggingIdentifier;
  if (!loggingIdentifier) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
  }
  return (id)[(AVLoggingIdentifier *)loggingIdentifier name];
}

+ (AVAsset)assetWithURL:(NSURL *)URL
{
  if ((id)objc_opt_class() == a1)
  {
    return (AVAsset *)+[AVURLAsset URLAssetWithURL:URL options:0];
  }
  else
  {
    uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURL:URL options:0];
    return (AVAsset *)v4;
  }
}

+ (id)makeAssetLoggingIdentifier
{
  id v2 = objc_alloc_init(AVAssetLoggingIdentifier);
  return v2;
}

- (AVAsset)initWithURL:(id)a3 options:(id)a4
{
  return 0;
}

+ (AVAsset)assetWithURL:(id)a3 figPlaybackItem:(OpaqueFigPlaybackItem *)a4 trackIDs:(id)a5 dynamicBehavior:(BOOL)a6
{
  objc_super v7 = [[AVPlaybackItemInspectorLoader alloc] initWithURL:a3 playbackItem:a4 trackIDs:a5 dynamicBehavior:a6];
  id v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"AVURLAssetInspectorLoaderKey", 0);
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    return 0;
  }
  return (AVAsset *)+[AVURLAsset URLAssetWithURL:a3 options:v8];
}

+ (AVAsset)assetWithData:(id)a3 contentType:(id)a4 options:(id)a5
{
  if (!a4)
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v17 = "contentType != nil";
    goto LABEL_10;
  }
  if (![a3 length])
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v17 = "[data length] > 0";
LABEL_10:
    v18 = (void *)[v15 exceptionWithName:v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"invalid parameter not satisfying: %s", (uint64_t)a4, (uint64_t)a5, v5, v6, v7, (uint64_t)v17), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  if ((id)objc_opt_class() == a1) {
    a1 = (id)objc_opt_class();
  }
  uint64_t v13 = (void *)[objc_alloc((Class)a1) initWithData:a3 contentType:a4 options:a5];
  return (AVAsset *)v13;
}

- (AVAsset)initWithData:(id)a3 contentType:(id)a4 options:(id)a5
{
  return 0;
}

- (void)dealloc
{
  asset = self->_asset;
  if (asset)
  {
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAsset;
  [(AVAsset *)&v4 dealloc];
}

- (void)_setLoggingIdentifier:(id)a3
{
  self->_asset->loggingIdentifier = (AVLoggingIdentifier *)a3;
}

- (id)_assetInspector
{
  objc_super v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (id)_assetInspectorLoader
{
  objc_super v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (id)_comparisonToken
{
  id result = [(AVAsset *)self _assetInspectorLoader];
  if (!result)
  {
    id result = [(AVAsset *)self _assetInspector];
    if (!result)
    {
      objc_super v4 = (void *)MEMORY[0x1E4F29238];
      return (id)[v4 valueWithNonretainedObject:self];
    }
  }
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  if ([a3 isEqualToString:@"streaming"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
    BOOL v6 = [(AVAsset *)self _isStreaming];
    return (id)[v5 numberWithBool:v6];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVAsset;
    return [(AVAsset *)&v8 valueForUndefinedKey:a3];
  }
}

- (int64_t)statusOfValueForKey:(id)a3
{
  return [(AVAsset *)self statusOfValueForKey:a3 error:0];
}

- (void)_loadValuesSynchronouslyForKeys:(id)a3 trackKeys:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  if (a4)
  {
    uint64_t v10 = @"tracks";
    v11[0] = a4;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__AVAsset__loadValuesSynchronouslyForKeys_trackKeys___block_invoke;
  v9[3] = &unk_1E57B1E80;
  v9[4] = v7;
  [(AVAsset *)self loadValuesAsynchronouslyForKeys:a3 keysForCollectionKeys:v8 completionHandler:v9];
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v7);
}

void __53__AVAsset__loadValuesSynchronouslyForKeys_trackKeys___block_invoke(uint64_t a1)
{
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 keysForCollectionKeys:(id)a4 completionHandler:(id)a5
{
  id v8 = [(AVAsset *)self _assetInspectorLoader];
  [v8 loadValuesAsynchronouslyForKeys:a3 keysForCollectionKeys:a4 completionHandler:a5];
}

- (void)cancelLoading
{
  id v2 = [(AVAsset *)self _assetInspectorLoader];
  [v2 cancelLoading];
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  objc_super v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  id v2 = [(AVAsset *)self _assetInspectorLoader];
  return (OpaqueFigPlaybackItem *)[v2 _playbackItem];
}

- (Class)_classForTrackInspectors
{
  objc_super v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (id)_absoluteURL
{
  return 0;
}

- (BOOL)_doNotLogURLs
{
  return 0;
}

- (OpaqueFigMutableComposition)_mutableComposition
{
  return 0;
}

- (double)_fragmentMindingInterval
{
  if (![(AVAsset *)self _mindsFragments]) {
    return 0.0;
  }
  id v3 = [(AVAsset *)self _assetInspectorLoader];
  [v3 _fragmentMindingInterval];
  return result;
}

- (BOOL)_mindsFragments
{
  return 0;
}

- (BOOL)_needsLegacyChangeNotifications
{
  return 0;
}

- (void)_setFragmentMindingInterval:(double)a3
{
  if ([(AVAsset *)self _mindsFragments])
  {
    id v5 = [(AVAsset *)self _assetInspectorLoader];
    [v5 _setFragmentMindingInterval:a3];
  }
}

- (void)_setIsAssociatedWithFragmentMinder:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVAsset *)self _mindsFragments])
  {
    id v5 = [(AVAsset *)self _assetInspectorLoader];
    [v5 _setIsAssociatedWithFragmentMinder:v3];
  }
}

- (float)preferredRate
{
  id v2 = [(AVAsset *)self _assetInspector];
  [v2 preferredRate];
  return result;
}

- (float)preferredVolume
{
  id v2 = [(AVAsset *)self _assetInspector];
  [v2 preferredVolume];
  return result;
}

- (float)preferredSoundCheckVolumeNormalization
{
  id v2 = [(AVAsset *)self _assetInspector];
  [v2 preferredSoundCheckVolumeNormalization];
  return result;
}

- (CGAffineTransform)preferredTransform
{
  float result = [(AVAsset *)self _assetInspector];
  if (result)
  {
    return (CGAffineTransform *)[(CGAffineTransform *)result preferredTransform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (CGSize)maximumVideoResolution
{
  id v2 = [(AVAsset *)self _assetInspector];
  [v2 maximumVideoResolution];
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)availableVideoDynamicRanges
{
  id result = (id)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "availableVideoDynamicRanges");
  if (!result) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  return result;
}

- (AVDisplayCriteria)preferredDisplayCriteria
{
  id v2 = [(AVAsset *)self _assetInspector];
  return (AVDisplayCriteria *)[v2 preferredDisplayCriteria];
}

- (CMTime)minimumTimeOffsetFromLive
{
  id result = [(AVAsset *)self _assetInspector];
  if (result)
  {
    return (CMTime *)[(CMTime *)result minimumTimeOffsetFromLive];
  }
  else
  {
    retstr->value = 0;
    *(void *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }
  return result;
}

- (CGSize)naturalSize
{
  objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "_ensureAllDependenciesOfKeyAreLoaded:", @"naturalSize");
  double v3 = [(AVAsset *)self tracksWithMediaType:@"vide"];
  if ([(NSArray *)v3 count])
  {
    objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0), "naturalSize");
  }
  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (int)naturalTimeScale
{
  id v2 = [(AVAsset *)self _assetInspector];
  return [v2 naturalTimeScale];
}

- (BOOL)providesPreciseDurationAndTiming
{
  id v2 = [(AVAsset *)self _assetInspector];
  return [v2 providesPreciseDurationAndTiming];
}

- (AVAssetReferenceRestrictions)referenceRestrictions
{
  return 0;
}

- (NSArray)trackGroups
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVAsset *)self alternateTrackGroups];
  double v4 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        [(NSArray *)v4 addObject:[[AVAssetTrackGroup alloc] initWithAsset:self trackIDs:*(void *)(*((void *)&v10 + 1) + 8 * v8++)]];
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)_firstTrackGroupWithMediaTypes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(AVAsset *)self trackGroups];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v14;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v14 != v8) {
      objc_enumerationMutation(v5);
    }
    long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
    long long v11 = (void *)[v10 trackIDs];
    if ([v11 count])
    {
      if (objc_msgSend(a3, "containsObject:", -[AVAssetTrack mediaType](-[AVAsset trackWithTrackID:](self, "trackWithTrackID:", objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "intValue")), "mediaType")))return v10; {
    }
      }
    if (v7 == ++v9)
    {
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)audioAlternatesTrackGroup
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"soun";
  return -[AVAsset _firstTrackGroupWithMediaTypes:](self, "_firstTrackGroupWithMediaTypes:", [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1]);
}

- (id)subtitleAlternatesTrackGroup
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"sbtl";
  v3[1] = @"text";
  void v3[2] = @"clcp";
  return -[AVAsset _firstTrackGroupWithMediaTypes:](self, "_firstTrackGroupWithMediaTypes:", [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3]);
}

- (id)alternateTrackGroups
{
  id v2 = [(AVAsset *)self _assetInspector];
  return (id)[v2 alternateTrackGroups];
}

- (NSArray)availableMediaCharacteristicsWithMediaSelectionOptions
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(AVAsset *)self _mediaSelectionGroupDictionaries];
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    uint64_t v7 = *MEMORY[0x1E4F34718];
    uint64_t v23 = *MEMORY[0x1E4F34710];
    uint64_t v22 = *MEMORY[0x1E4F346E0];
    uint64_t v21 = *MEMORY[0x1E4F346E8];
    uint64_t v20 = *MEMORY[0x1E4F346F8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v10 = (void *)[v9 objectForKey:v7];
        if (v10)
        {
          long long v11 = v10;
          char v12 = [v10 isEqualToString:@"soun"];
          long long v13 = @"AVMediaCharacteristicAudible";
          if (v12) {
            goto LABEL_17;
          }
          char v14 = [v11 isEqualToString:@"sbtl"];
          long long v13 = @"AVMediaCharacteristicLegible";
          if (v14) {
            goto LABEL_17;
          }
          char v15 = [v11 isEqualToString:@"clcp"];
          long long v13 = @"AVMediaCharacteristicLegible";
          if (v15) {
            goto LABEL_17;
          }
          char v16 = [v11 isEqualToString:@"vide"];
          long long v13 = @"AVMediaCharacteristicVisual";
          if (v16) {
            goto LABEL_17;
          }
        }
        else
        {
          v17 = (void *)[v9 objectForKey:v23];
          if ([v17 containsObject:v22]) {
            [v3 addObject:@"AVMediaCharacteristicAudible"];
          }
          if ([v17 containsObject:v21]) {
            [v3 addObject:@"AVMediaCharacteristicLegible"];
          }
          int v18 = [v17 containsObject:v20];
          long long v13 = @"AVMediaCharacteristicVisual";
          if (v18)
          {
LABEL_17:
            [v3 addObject:v13];
            continue;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }
  return (NSArray *)[v3 allObjects];
}

- (id)mediaSelectionGroupForPropertyList:(id)a3 mediaSelectionOption:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(AVAsset *)self _mediaSelectionGroupDictionaries];
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v22 = a4;
  uint64_t v23 = self;
  uint64_t v25 = *(void *)v27;
  uint64_t v9 = *MEMORY[0x1E4F34718];
  uint64_t v10 = *MEMORY[0x1E4F34708];
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v27 != v25) {
        objc_enumerationMutation(obj);
      }
      char v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      long long v13 = objc_msgSend(v12, "objectForKey:", v9, v22);
      uint64_t v14 = [a3 objectForKey:v9];
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          uint64_t v14 = 0;
        }
      }
      char v15 = (void *)[v12 objectForKey:v10];
      uint64_t v16 = [a3 objectForKey:v10];
      if (v13) {
        BOOL v17 = v14 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (v17 || ([v13 isEqualToString:v14] & 1) == 0)
      {
        BOOL v18 = !v15 || v16 == 0;
        if (v18 || ![v15 isEqual:v16]) {
          continue;
        }
      }
      v19 = +[AVMediaSelectionGroup mediaSelectionGroupWithAsset:v23 dictionary:v12];
      if (v19)
      {
        if (+[AVMediaSelectionOption _plistHasOptionIdentifier:a3])
        {
          uint64_t v21 = [(AVMediaSelectionGroup *)v19 mediaSelectionOptionWithPropertyListMatchToMediaSelectionArray:a3];
          if (!v21) {
            v19 = 0;
          }
        }
        else
        {
          uint64_t v21 = 0;
        }
        if (v22) {
          *uint64_t v22 = (id)v21;
        }
      }
      return v19;
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    v19 = 0;
    if (v8) {
      continue;
    }
    break;
  }
  return v19;
}

- (AVMediaSelection)preferredMediaSelection
{
  id v2 = [[AVMediaSelection alloc] _initWithAsset:self];
  return (AVMediaSelection *)v2;
}

- (NSArray)allMediaSelections
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(AVAsset *)self preferredMediaSelection];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v17 = self;
  id obj = [(AVAsset *)self availableMediaCharacteristicsWithMediaSelectionOptions];
  uint64_t v18 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = [(AVAsset *)v17 mediaSelectionGroupForMediaCharacteristic:*(void *)(*((void *)&v23 + 1) + 8 * v5)];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v7 = [(AVMediaSelectionGroup *)v6 options];
        uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v20;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v20 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
              long long v13 = (void *)[(AVMediaSelection *)v4 mutableCopy];
              [v13 selectMediaOption:v12 inMediaSelectionGroup:v6];
              [v3 addObject:v13];

              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v9);
        }
        ++v5;
      }
      while (v5 != v18);
      uint64_t v18 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }
  return (NSArray *)(id)[v3 copy];
}

- (id)trackReferences
{
  id v2 = [(AVAsset *)self _assetInspector];
  return (id)[v2 trackReferences];
}

- (AVMetadataItem)creationDate
{
  id v2 = [(AVAsset *)self _assetInspector];
  return (AVMetadataItem *)[v2 creationDate];
}

- (NSString)lyrics
{
  id v2 = [(AVAsset *)self _assetInspectorLoader];
  return (NSString *)[v2 lyrics];
}

- (NSArray)commonMetadata
{
  id v2 = [(AVAsset *)self _assetInspector];
  return (NSArray *)[v2 commonMetadata];
}

- (NSArray)availableMetadataFormats
{
  objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "_ensureAllDependenciesOfKeyAreLoaded:", @"availableMetadataFormats");
  id v3 = (NSArray *)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "availableMetadataFormats");
  if (!+[AVMetadataItem _clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace]|| ![(NSArray *)v3 containsObject:@"org.mp4ra"])
  {
    return v3;
  }
  return [(NSArray *)v3 arrayByAddingObject:@"com.apple.quicktime.udta"];
}

- (NSArray)metadataForFormat:(AVMetadataFormat)format
{
  uint64_t v5 = (NSArray *)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "metadataForFormat:", format);
  if (!+[AVMetadataItem _clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace]|| ![(NSString *)format isEqualToString:@"com.apple.quicktime.udta"])
  {
    return v5;
  }
  id v6 = +[AVMetadataItem _replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:](AVMetadataItem, "_replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:", objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "metadataForFormat:", @"org.mp4ra"));
  return [(NSArray *)v5 arrayByAddingObjectsFromArray:v6];
}

- (void)loadMetadataForFormat:(AVMetadataFormat)format completionHandler:(void *)completionHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__AVAsset_loadMetadataForFormat_completionHandler___block_invoke;
  v4[3] = &unk_1E57B3180;
  v4[4] = self;
  v4[5] = format;
  v4[6] = completionHandler;
  AVLoadValueAsynchronously(self, @"availableMetadataFormats", (uint64_t)v4);
}

uint64_t __51__AVAsset_loadMetadataForFormat_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) metadataForFormat:*(void *)(a1 + 40)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (NSArray)metadata
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVAsset *)self availableMetadataFormats];
  uint64_t v4 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        [(NSArray *)v4 addObjectsFromArray:[(AVAsset *)self metadataForFormat:*(void *)(*((void *)&v10 + 1) + 8 * v8++)]];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)_ID3Metadata
{
  id v2 = [(AVAsset *)self _assetInspector];
  return (id)[v2 metadataForFormat:@"AVMetadataFormatTypedID3Metadata"];
}

- (NSArray)tracks
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
  return (NSArray *)[v5 array];
}

- (AVAssetTrack)trackWithTrackID:(CMPersistentTrackID)trackID
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(AVAsset *)self tracks];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    uint64_t v9 = *(AVAssetTrack **)(*((void *)&v11 + 1) + 8 * v8);
    if ([(AVAssetTrack *)v9 trackID] == trackID) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)loadTrackWithTrackID:(CMPersistentTrackID)trackID completionHandler:(void *)completionHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__AVAsset_loadTrackWithTrackID_completionHandler___block_invoke;
  v4[3] = &unk_1E57B31A8;
  CMPersistentTrackID v5 = trackID;
  v4[4] = self;
  v4[5] = completionHandler;
  AVLoadValueAsynchronously(self, @"tracks", (uint64_t)v4);
}

uint64_t __50__AVAsset_loadTrackWithTrackID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) trackWithTrackID:*(unsigned int *)(a1 + 48)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (NSArray)tracksWithMediaType:(AVMediaType)mediaType
{
  id v3 = [[AVAssetTrackEnumerator alloc] initWithAsset:self mediaType:mediaType];
  uint64_t v4 = (NSArray *)[(AVAssetTrackEnumerator *)v3 allObjects];

  return v4;
}

- (void)loadTracksWithMediaType:(AVMediaType)mediaType completionHandler:(void *)completionHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__AVAsset_loadTracksWithMediaType_completionHandler___block_invoke;
  v4[3] = &unk_1E57B3180;
  v4[4] = self;
  v4[5] = mediaType;
  void v4[6] = completionHandler;
  AVLoadValueAsynchronously(self, @"tracks", (uint64_t)v4);
}

uint64_t __53__AVAsset_loadTracksWithMediaType_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) tracksWithMediaType:*(void *)(a1 + 40)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObject:mediaCharacteristic];
  return (NSArray *)[(AVAsset *)self tracksWithMediaCharacteristics:v4];
}

- (void)loadTracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic completionHandler:(void *)completionHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__AVAsset_loadTracksWithMediaCharacteristic_completionHandler___block_invoke;
  v4[3] = &unk_1E57B3180;
  v4[4] = self;
  v4[5] = mediaCharacteristic;
  void v4[6] = completionHandler;
  AVLoadValueAsynchronously(self, @"tracks", (uint64_t)v4);
}

uint64_t __63__AVAsset_loadTracksWithMediaCharacteristic_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) tracksWithMediaCharacteristic:*(void *)(a1 + 40)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (id)tracksWithMediaCharacteristics:(id)a3
{
  id v3 = [[AVAssetTrackEnumerator alloc] initWithAsset:self mediaCharacteristics:a3];
  uint64_t v4 = (void *)[(AVAssetTrackEnumerator *)v3 allObjects];

  return v4;
}

- (id)compatibleTrackForCompositionTrack:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = -[AVAsset tracksWithMediaType:](self, "tracksWithMediaType:", [a3 mediaType]);
  if (![(NSArray *)v3 count]) {
    return 0;
  }
  return [(NSArray *)v3 objectAtIndex:0];
}

- (void)findCompatibleTrackForCompositionTrack:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__AVAsset_findCompatibleTrackForCompositionTrack_completionHandler___block_invoke;
  v4[3] = &unk_1E57B3180;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  AVLoadValueAsynchronously(self, @"tracks", (uint64_t)v4);
}

uint64_t __68__AVAsset_findCompatibleTrackForCompositionTrack_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) compatibleTrackForCompositionTrack:*(void *)(a1 + 40)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (BOOL)_requiresInProcessOperation
{
  return 0;
}

- (void)_serverHasDied
{
  id v2 = [(AVAsset *)self _assetInspectorLoader];
  [v2 _serverHasDied];
}

- (BOOL)hasProtectedContent
{
  id v2 = [(AVAsset *)self _assetInspectorLoader];
  return [v2 hasProtectedContent];
}

- (BOOL)isPlayable
{
  id v2 = [(AVAsset *)self _assetInspectorLoader];
  return [v2 isPlayable];
}

- (BOOL)isExportable
{
  id v2 = [(AVAsset *)self _assetInspectorLoader];
  return [v2 isExportable];
}

- (BOOL)isReadable
{
  id v2 = [(AVAsset *)self _assetInspectorLoader];
  return [v2 isReadable];
}

- (BOOL)isComposable
{
  id v2 = [(AVAsset *)self _assetInspectorLoader];
  return [v2 isComposable];
}

- (BOOL)isCompatibleWithPhotosTranscodingServiceWithOptions:(id)a3
{
  id v4 = [(AVAsset *)self _assetInspector];
  return [v4 isCompatibleWithPhotosTranscodingServiceWithOptions:a3];
}

- (BOOL)isCompatibleWithSavedPhotosAlbum
{
  id v2 = [(AVAsset *)self _assetInspectorLoader];
  return [v2 isCompatibleWithSavedPhotosAlbum];
}

- (BOOL)isCompatibleWithAirPlayVideo
{
  id v2 = [(AVAsset *)self _assetInspector];
  return [v2 isCompatibleWithAirPlayVideo];
}

- (BOOL)canContainFragments
{
  id v2 = [(AVAsset *)self _assetInspector];
  return [v2 canContainFragments];
}

- (BOOL)containsFragments
{
  id v2 = [(AVAsset *)self _assetInspector];
  return [v2 containsFragments];
}

- (CMTime)overallDurationHint
{
  CGSize result = [(AVAsset *)self _assetInspector];
  if (result)
  {
    return (CMTime *)[(CMTime *)result overallDurationHint];
  }
  else
  {
    retstr->value = 0;
    *(void *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }
  return result;
}

- (BOOL)_hasResourceLoaderDelegate
{
  return 0;
}

- (BOOL)supportsAnalysisReporting
{
  id v2 = [(AVAsset *)self _assetInspector];
  return [v2 supportsAnalysisReporting];
}

- (id)_assetAnalysisMessages
{
  id v2 = [(AVAsset *)self _assetInspector];
  return (id)[v2 _assetAnalysisMessages];
}

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 1;
}

- (int64_t)moovAtomSize
{
  id v2 = [(AVAsset *)self _assetInspector];
  return [v2 _moovAtomSize];
}

- (void)_loadChapterInfo
{
  loadChapterInfoOnce = self->_asset->loadChapterInfoOnce;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __53__AVAsset_AVAssetChapterInspection___loadChapterInfo__block_invoke;
  v3[3] = &unk_1E57B1E80;
  void v3[4] = self;
  [(AVDispatchOnce *)loadChapterInfoOnce runBlockOnce:v3];
}

uint64_t __53__AVAsset_AVAssetChapterInspection___loadChapterInfo__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_assetInspectorLoader"), "figChapterGroupInfo");
  id v3 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "_assetInspectorLoader"), "figChapters");
  uint64_t v68 = v1;
  if ([v2 count])
  {
    id v58 = v3;
    id v69 = (id)[MEMORY[0x1E4F1CA48] array];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    uint64_t v4 = [v2 countByEnumeratingWithState:&v87 objects:v95 count:16];
    if (!v4) {
      goto LABEL_22;
    }
    uint64_t v5 = v4;
    uint64_t v66 = *(void *)v88;
    uint64_t v6 = *MEMORY[0x1E4F32878];
    uint64_t v7 = *MEMORY[0x1E4F32868];
    uint64_t v8 = *MEMORY[0x1E4F32860];
    uint64_t v9 = *MEMORY[0x1E4F32F98];
    uint64_t v60 = *MEMORY[0x1E4F32870];
    id obj = v2;
    uint64_t v64 = *MEMORY[0x1E4F32FA0];
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v88 != v66) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v87 + 1) + 8 * i);
        long long v12 = (void *)[v11 valueForKey:v6];
        uint64_t v13 = [v11 valueForKey:v7];
        uint64_t v14 = [v11 valueForKey:v8];
        if (!v14)
        {
          uint64_t ISO639_1FromISO639_2T = FigMetadataGetISO639_1FromISO639_2T();
          if (ISO639_1FromISO639_2T) {
            uint64_t v14 = ISO639_1FromISO639_2T;
          }
          else {
            uint64_t v14 = v13;
          }
        }
        if ([v12 isEqualToString:v9]) {
          uint64_t v16 = (void *)[v11 valueForKey:v60];
        }
        else {
          uint64_t v16 = 0;
        }
        uint64_t v17 = *(void *)(*(void *)(v68 + 32) + 8);
        uint64_t v19 = *(void *)(v17 + 32);
        uint64_t v18 = (void *)(v17 + 32);
        if (v19)
        {
          if (![v12 isEqualToString:v64]) {
            goto LABEL_18;
          }
          uint64_t v18 = (void *)(*(void *)(*(void *)(v68 + 32) + 8) + 32);
        }
        void *v18 = v12;
LABEL_18:
        long long v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v12, @"AVChapterGroupTypeKey", v13, @"AVChapterGroupLanguageCodeKey", v14, @"AVChapterGroupExtendedLanguageTagKey", 0);
        if ([v16 count]) {
          [v20 setObject:v16 forKey:@"AVChapterGroupPerChapterInfoKey"];
        }
        [v69 addObject:v20];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v87 objects:v95 count:16];
      if (!v5)
      {
LABEL_22:
        uint64_t v1 = v68;
        *(void *)(*(void *)(*(void *)(v68 + 32) + 8) + 24) = [v69 copy];
        id v3 = v58;
        break;
      }
    }
  }
  long long v21 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v22 = *(void **)(*(void *)(*(void *)(v1 + 32) + 8) + 24);
  if (v22)
  {
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v83 objects:v94 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v84;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v84 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v27 = *(void **)(*((void *)&v83 + 1) + 8 * j);
          if (objc_msgSend((id)objc_msgSend(v27, "valueForKey:", @"AVChapterGroupTypeKey"), "isEqualToString:", *(void *)(*(void *)(*(void *)(v1 + 32) + 8) + 32)))
          {
            uint64_t v28 = [v27 valueForKey:@"AVChapterGroupExtendedLanguageTagKey"];
            if (v28)
            {
              uint64_t v29 = v28;
              if (([v21 containsObject:v28] & 1) == 0) {
                [v21 addObject:v29];
              }
            }
            uint64_t v30 = [v27 valueForKey:@"AVChapterGroupLanguageCodeKey"];
            uint64_t v1 = v68;
            if (v30)
            {
              uint64_t v31 = v30;
              if (([v21 containsObject:v30] & 1) == 0) {
                [v21 addObject:v31];
              }
            }
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v83 objects:v94 count:16];
      }
      while (v24);
    }
    goto LABEL_72;
  }
  if (![v3 count]) {
    goto LABEL_72;
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v59 = v3;
  uint64_t v65 = [v3 countByEnumeratingWithState:&v79 objects:v93 count:16];
  if (v65)
  {
    id obja = *(id *)v80;
    uint64_t v61 = *MEMORY[0x1E4F32890];
    uint64_t v32 = *MEMORY[0x1E4F33010];
    uint64_t v33 = *MEMORY[0x1E4F33030];
    uint64_t v34 = *MEMORY[0x1E4F33038];
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(id *)v80 != obja) {
          objc_enumerationMutation(v59);
        }
        uint64_t v67 = v35;
        v36 = (void *)[*(id *)(*((void *)&v79 + 1) + 8 * v35) objectForKey:v61];
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v70 = v36;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v75 objects:v92 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v76;
          do
          {
            for (uint64_t k = 0; k != v38; ++k)
            {
              if (*(void *)v76 != v39) {
                objc_enumerationMutation(v70);
              }
              v41 = *(void **)(*((void *)&v75 + 1) + 8 * k);
              v42 = (void *)[v41 objectForKey:v32];
              uint64_t v43 = [v41 objectForKey:v33];
              v44 = (void *)[v41 objectForKey:v34];
              if (v42) {
                BOOL v45 = 1;
              }
              else {
                BOOL v45 = v44 == 0;
              }
              if (!v45) {
                v42 = (void *)[v44 localeIdentifier];
              }
              if (v43) {
                BOOL v46 = 1;
              }
              else {
                BOOL v46 = v42 == 0;
              }
              if (v46)
              {
                if (!v42) {
                  goto LABEL_63;
                }
              }
              else
              {
                uint64_t v43 = AVLanguageCodeFromExtendedLanguageTag(v42);
              }
              if (([v21 containsObject:v42] & 1) == 0) {
                [v21 addObject:v42];
              }
LABEL_63:
              if (v43 && ([v21 containsObject:v43] & 1) == 0) {
                [v21 addObject:v43];
              }
            }
            uint64_t v38 = [v70 countByEnumeratingWithState:&v75 objects:v92 count:16];
          }
          while (v38);
        }
        uint64_t v35 = v67 + 1;
      }
      while (v67 + 1 != v65);
      uint64_t v65 = [v59 countByEnumeratingWithState:&v79 objects:v93 count:16];
    }
    while (v65);
  }
  uint64_t v1 = v68;
  if (![v21 count]) {
    [v21 addObject:@"und"];
  }
LABEL_72:
  *(void *)(*(void *)(*(void *)(v1 + 32) + 8) + 40) = [v21 copy];
  v47 = (void *)[MEMORY[0x1E4F1CA48] array];
  v48 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v49 = [v21 countByEnumeratingWithState:&v71 objects:v91 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v72;
    do
    {
      for (uint64_t m = 0; m != v50; ++m)
      {
        if (*(void *)v72 != v51) {
          objc_enumerationMutation(v21);
        }
        id v53 = (id)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:*(void *)(*((void *)&v71 + 1) + 8 * m)];
        if (v53)
        {
          v54 = v53;
          if (([v47 containsObject:v53] & 1) == 0)
          {
            uint64_t v55 = [v54 localeIdentifier];
            if (v55)
            {
              uint64_t v56 = v55;
              if (([v48 containsObject:v55] & 1) == 0) {
                [v48 addObject:v56];
              }
            }
            [v47 addObject:v54];
          }
        }
      }
      uint64_t v50 = [v21 countByEnumeratingWithState:&v71 objects:v91 count:16];
    }
    while (v50);
  }
  *(void *)(*(void *)(*(void *)(v68 + 32) + 8) + 48) = [v48 copy];
  uint64_t result = [v47 copy];
  *(void *)(*(void *)(*(void *)(v68 + 32) + 8) + 56) = result;
  return result;
}

- (id)availableChapterLanguages
{
  return self->_asset->availableChapterLanguages;
}

- (id)_availableCanonicalizedChapterLanguages
{
  return self->_asset->availableCanonicalizedChapterLanguages;
}

- (NSArray)availableChapterLocales
{
  return self->_asset->availableChapterLocales;
}

- (unint64_t)_addChapterMetadataItem:(id)a3 timeRange:(id *)a4 toChapters:(id)a5 fromIndex:(unint64_t)a6
{
  unint64_t v10 = [a5 count];
  if (v10 > a6)
  {
    unint64_t v11 = v10;
    uint64_t v12 = MEMORY[0x1E4F1FA48];
    for (unint64_t i = a6; v11 != i; ++i)
    {
      uint64_t v14 = (void *)[a5 objectAtIndex:i];
      uint64_t v15 = v14;
      memset(&v24, 0, sizeof(v24));
      if (v14) {
        [v14 timeRange];
      }
      CMTimeRange range = v24;
      memset(&v23, 0, sizeof(v23));
      long long v16 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a4->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v16;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a4->var1.var1;
      CMTimeRangeGetIntersection(&v23, &range, &otherRange);
      if ((v23.start.flags & 1) == 0
        || (v23.duration.flags & 1) == 0
        || v23.duration.epoch
        || v23.duration.value < 0
        || (range.CMTime start = v23.duration,
            *(_OWORD *)&otherRange.start.value = *(_OWORD *)v12,
            otherRange.start.epoch = *(void *)(v12 + 16),
            CMTimeCompare(&range.start, &otherRange.start)))
      {
        id v17 = (id)objc_msgSend((id)objc_msgSend(v15, "items"), "mutableCopy");
        [v17 addObject:a3];
        [v15 setItems:v17];
        a6 = i;
      }
      else
      {
        memset(&otherRange, 0, 24);
        long long v18 = *(_OWORD *)&a4->var0.var3;
        *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0.var0;
        *(_OWORD *)&range.start.epoch = v18;
        *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a4->var1.var1;
        CMTimeRangeGetEnd(&otherRange.start, &range);
        *(_OWORD *)&range.start.value = *(_OWORD *)&v24.start.value;
        range.start.epoch = v24.start.epoch;
        CMTime start = otherRange.start;
        if (CMTimeCompare(&range.start, &start) < 1) {
          a6 = i;
        }
        *(_OWORD *)&range.start.value = *(_OWORD *)&v24.start.value;
        range.start.epoch = v24.start.epoch;
        CMTime start = otherRange.start;
        if ((CMTimeCompare(&range.start, &start) & 0x80000000) == 0) {
          return a6;
        }
      }
    }
  }
  return a6;
}

- (id)_chapterDataTypeForMediaSubType:(int)a3
{
  id result = 0;
  if (a3 > 1785750886)
  {
    if (a3 == 1785750887)
    {
      uint64_t v4 = (id *)MEMORY[0x1E4F1EFE8];
    }
    else
    {
      if (a3 != 1886283552) {
        return result;
      }
      uint64_t v4 = (id *)MEMORY[0x1E4F1EFF8];
    }
  }
  else if (a3 == 1465011269)
  {
    uint64_t v4 = (id *)MEMORY[0x1E4F1EFC0];
  }
  else
  {
    if (a3 != 1734960672) {
      return result;
    }
    uint64_t v4 = (id *)MEMORY[0x1E4F1EFE0];
  }
  return *v4;
}

- (id)_chapterMetadataGroupsWithFigChapterGroups:(id)a3 titleLanguage:(id)a4 containingItemsWithCommonKeys:(id)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  CFArrayRef theArray = 0;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  long long v7 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&v83.start.epoch = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&v83.duration.timescale = v6;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  *(_OWORD *)&v83.start.value = v7;
  long long v79 = 0u;
  chapterGroupInfo = self->_asset->chapterGroupInfo;
  uint64_t v9 = [(NSArray *)chapterGroupInfo countByEnumeratingWithState:&v79 objects:v86 count:16];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v80;
  id v59 = self;
LABEL_3:
  uint64_t v13 = 0;
  uint64_t v68 = v11;
  uint64_t v70 = v11 + v10;
  while (1)
  {
    if (*(void *)v80 != v12) {
      objc_enumerationMutation(chapterGroupInfo);
    }
    uint64_t v14 = *(void **)(*((void *)&v79 + 1) + 8 * v13);
    uint64_t v15 = (void *)[v14 valueForKey:@"AVChapterGroupTypeKey"];
    uint64_t v64 = v14;
    uint64_t v16 = [v14 valueForKey:@"AVChapterGroupExtendedLanguageTagKey"];
    uint64_t v17 = v16 ? [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v16] : 0;
    uint64_t v18 = [v64 valueForKey:@"AVChapterGroupLanguageCodeKey"];
    uint64_t v19 = v18 ? [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v18] : 0;
    long long v20 = (void *)[v64 valueForKey:@"AVChapterGroupPerChapterInfoKey"];
    if ([v15 isEqualToString:v59->_asset->anchorChapterType])
    {
      if (([a4 isEqualToString:v17] & 1) != 0
        || [a4 isEqualToString:v19])
      {
        break;
      }
    }
    if (v10 == ++v13)
    {
      uint64_t v10 = [(NSArray *)chapterGroupInfo countByEnumeratingWithState:&v79 objects:v86 count:16];
      uint64_t v11 = v70;
      if (v10) {
        goto LABEL_3;
      }
      return 0;
    }
  }
  long long v22 = (void *)[v64 valueForKey:@"AVChapterGroupChaptersKey"];
  unint64_t v23 = 0x1E4F1C000;
  if (!v22)
  {
    long long v22 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v71 = v68 + v13;
    if (FCSupport_CopyChapterTimeRangesForChapterGroup()) {
      return 0;
    }
    if (theArray)
    {
      CFIndex Count = CFArrayGetCount(theArray);
      if (Count)
      {
        CFIndex v25 = Count;
        CFIndex v26 = 0;
        uint64_t v69 = *MEMORY[0x1E4F32888];
        do
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v26);
          CMTimeRangeMakeFromDictionary(&v83, ValueAtIndex);
          if ([v20 count])
          {
            uint64_t v28 = (void *)[v20 objectAtIndex:v26];
            LODWORD(valuePtr.start.value) = 0;
            CFNumberGetValue((CFNumberRef)[v28 objectForKey:v69], kCFNumberSInt32Type, &valuePtr);
            uint64_t v29 = v59;
            uint64_t v30 = [(AVAsset *)v59 _chapterDataTypeForMediaSubType:LODWORD(valuePtr.start.value)];
          }
          else
          {
            uint64_t v30 = 0;
            uint64_t v29 = v59;
          }
          uint64_t v31 = [AVChapterMetadataItem alloc];
          *(_OWORD *)&valuePtr.start.value = *(_OWORD *)&v83.start.value;
          valuePtr.start.epoch = v83.start.epoch;
          CMTime duration = v83.duration;
          id v32 = [(AVChapterMetadataItem *)v31 _initWithAsset:v29 chapterGroupIndex:v71 chapterIndex:v26 chapterType:v15 extendedLanguageTag:v16 languageCode:v18 chapterDataType:v30 time:&valuePtr duration:&duration];
          uint64_t v33 = [AVTimedMetadataGroup alloc];
          uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObject:v32];
          CMTimeRange valuePtr = v83;
          objc_msgSend(v22, "addObject:", -[AVTimedMetadataGroup initWithItems:timeRange:](v33, "initWithItems:timeRange:", v34, &valuePtr));
          ++v26;
        }
        while (v25 != v26);
      }
      unint64_t v23 = 0x1E4F1C000uLL;
      if (theArray)
      {
        CFRelease(theArray);
        CFArrayRef theArray = 0;
      }
    }
    [v64 setObject:v22 forKey:@"AVChapterGroupChaptersKey"];
    if (!v22) {
      return 0;
    }
  }
  id v21 = (id)[v22 mutableCopy];
  uint64_t v35 = [v21 count];
  if (v35)
  {
    uint64_t v36 = v35;
    for (uint64_t i = 0; i != v36; ++i)
      objc_msgSend(v21, "replaceObjectAtIndex:withObject:", i, (id)objc_msgSend((id)objc_msgSend(v21, "objectAtIndex:", i), "mutableCopy"));
  }
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v59->_asset->chapterGroupInfo;
  uint64_t v63 = [(NSArray *)obj countByEnumeratingWithState:&v73 objects:v85 count:16];
  if (v63)
  {
    long long v72 = v21;
    uint64_t v38 = 0;
    uint64_t v62 = *(void *)v74;
    uint64_t v67 = *MEMORY[0x1E4F32888];
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v74 != v62) {
          objc_enumerationMutation(obj);
        }
        v40 = *(void **)(*((void *)&v73 + 1) + 8 * v39);
        v41 = (void *)[v40 valueForKey:@"AVChapterGroupTypeKey"];
        uint64_t v42 = [v40 valueForKey:@"AVChapterGroupExtendedLanguageTagKey"];
        if (v42) {
          uint64_t v43 = [*(id *)(v23 + 2592) canonicalLanguageIdentifierFromString:v42];
        }
        else {
          uint64_t v43 = 0;
        }
        uint64_t v44 = [v40 valueForKey:@"AVChapterGroupLanguageCodeKey"];
        uint64_t v66 = v39;
        if (v44) {
          uint64_t v45 = [*(id *)(v23 + 2592) canonicalLanguageIdentifierFromString:v44];
        }
        else {
          uint64_t v45 = 0;
        }
        BOOL v46 = (void *)[v40 valueForKey:@"AVChapterGroupPerChapterInfoKey"];
        int v47 = [a5 containsObject:v41];
        if (v40 != v64)
        {
          int v48 = v47;
          if ((([a4 isEqualToString:v43] & 1) != 0
             || ([a4 isEqualToString:v45] | v48) == 1)
            && (([a5 containsObject:v41] & 1) != 0
             || [v41 isEqualToString:v59->_asset->anchorChapterType]))
          {
            if (FCSupport_CopyChapterTimeRangesForChapterGroup()) {
              return v72;
            }
            if (theArray)
            {
              CFIndex v49 = CFArrayGetCount(theArray);
              if (v49)
              {
                CFIndex v50 = v49;
                uint64_t v51 = 0;
                for (CFIndex j = 0; j != v50; ++j)
                {
                  CFDictionaryRef v53 = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, j);
                  CMTimeRangeMakeFromDictionary(&valuePtr, v53);
                  CMTimeRange v83 = valuePtr;
                  if ([v46 count])
                  {
                    v54 = (void *)[v46 objectAtIndex:j];
                    LODWORD(valuePtr.start.value) = 0;
                    CFNumberGetValue((CFNumberRef)[v54 objectForKey:v67], kCFNumberSInt32Type, &valuePtr);
                    uint64_t v55 = [(AVAsset *)v59 _chapterDataTypeForMediaSubType:LODWORD(valuePtr.start.value)];
                  }
                  else
                  {
                    uint64_t v55 = 0;
                  }
                  uint64_t v56 = [AVChapterMetadataItem alloc];
                  *(_OWORD *)&valuePtr.start.value = *(_OWORD *)&v83.start.value;
                  valuePtr.start.epoch = v83.start.epoch;
                  CMTime duration = v83.duration;
                  id v57 = [(AVChapterMetadataItem *)v56 _initWithAsset:v59 chapterGroupIndex:v38 chapterIndex:j chapterType:v41 extendedLanguageTag:v42 languageCode:v44 chapterDataType:v55 time:&valuePtr duration:&duration];
                  CMTimeRange valuePtr = v83;
                  uint64_t v51 = [(AVAsset *)v59 _addChapterMetadataItem:v57 timeRange:&valuePtr toChapters:v72 fromIndex:v51];
                }
              }
              unint64_t v23 = 0x1E4F1C000;
              if (theArray)
              {
                CFRelease(theArray);
                CFArrayRef theArray = 0;
              }
            }
          }
        }
        ++v38;
        uint64_t v39 = v66 + 1;
      }
      while (v66 + 1 != v63);
      uint64_t v63 = [(NSArray *)obj countByEnumeratingWithState:&v73 objects:v85 count:16];
    }
    while (v63);
    return v72;
  }
  return v21;
}

- (id)_chapterMetadataGroupsWithTitleLanguage:(id)a3 containingItemsWithCommonKeys:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  [(AVAsset *)self _loadChapterInfo];
  long long v7 = objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "figChapterGroupInfo");
  uint64_t v8 = objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "figChapters");
  if ([v7 count])
  {
    id result = [(AVAsset *)self _chapterMetadataGroupsWithFigChapterGroups:v7 titleLanguage:a3 containingItemsWithCommonKeys:a4];
  }
  else
  {
    id result = (id)[v8 count];
    if (result)
    {
      if (objc_msgSend(-[AVAsset _availableCanonicalizedChapterLanguages](self, "_availableCanonicalizedChapterLanguages"), "containsObject:", a3))
      {
        id v10 = [(AVAsset *)self _absoluteURL];
        char v11 = [(AVAsset *)self referenceRestrictions];
        long long v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v36 = [v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v36)
        {
          uint64_t v12 = 2 * (v11 & 0xFu);
          uint64_t v34 = *MEMORY[0x1E4F32890];
          uint64_t v35 = *(void *)v47;
          uint64_t v32 = *MEMORY[0x1E4F32880];
          uint64_t v33 = *MEMORY[0x1E4F32898];
          long long v31 = *MEMORY[0x1E4F1FA48];
          CMTimeEpoch v30 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
          long long v29 = *MEMORY[0x1E4F1F9F0];
          CMTimeEpoch v28 = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
          id obj = v8;
          do
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v47 != v35) {
                objc_enumerationMutation(obj);
              }
              uint64_t v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              uint64_t v15 = (void *)[v14 objectForKey:v34];
              uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
              long long v42 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v50 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v43;
                do
                {
                  for (uint64_t j = 0; j != v18; ++j)
                  {
                    if (*(void *)v43 != v19) {
                      objc_enumerationMutation(v15);
                    }
                    id v21 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:*(void *)(*((void *)&v42 + 1) + 8 * j) containerURL:v10 securityOptions:v12];
                    if (v21) {
                      [v16 addObject:v21];
                    }
                  }
                  uint64_t v18 = [v15 countByEnumeratingWithState:&v42 objects:v50 count:16];
                }
                while (v18);
              }
              *(_OWORD *)&v41.value = v31;
              v41.epoch = v30;
              *(_OWORD *)&v40.value = v29;
              v40.epoch = v28;
              CFDictionaryRef v22 = (const __CFDictionary *)[v14 objectForKey:v33];
              if (v22) {
                CMTimeMakeFromDictionary(&v41, v22);
              }
              CFDictionaryRef v23 = (const __CFDictionary *)[v14 objectForKey:v32];
              if (v23) {
                CMTimeMakeFromDictionary(&v40, v23);
              }
              memset(&v39, 0, sizeof(v39));
              start.CMTimeRange start = v41;
              CMTime duration = v40;
              CMTimeRangeMake(&v39, &start.start, &duration);
              CMTimeRange v24 = [AVTimedMetadataGroup alloc];
              CMTimeRange start = v39;
              CFIndex v25 = [(AVTimedMetadataGroup *)v24 initWithItems:v16 timeRange:&start];
              if (v25) {
                [v27 addObject:v25];
              }
            }
            uint64_t v36 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
          }
          while (v36);
        }
        id result = (id)[v27 copy];
      }
      else
      {
        id result = 0;
      }
    }
  }
  if (!result) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  return result;
}

- (id)_chapterMetadataGroupsBestMatchingPreferredLanguages:(id)a3 containingItemsWithCommonKeys:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromString:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        if (v12) {
          [v7 addObject:v12];
        }
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }
  [(AVAsset *)self _availableCanonicalizedChapterLanguages];
  id v13 = (id)FigCopyRankedLanguagesAccordingToPreferredLanguages();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (!v14) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v21;
  uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_12:
  uint64_t v18 = 0;
  while (1)
  {
    if (*(void *)v21 != v16) {
      objc_enumerationMutation(v13);
    }
    id result = [(AVAsset *)self _chapterMetadataGroupsWithTitleLanguage:*(void *)(*((void *)&v20 + 1) + 8 * v18) containingItemsWithCommonKeys:a4];
    if (result) {
      return result;
    }
    if (v15 == ++v18)
    {
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v15) {
        goto LABEL_12;
      }
      return v17;
    }
  }
}

- (NSArray)chapterMetadataGroupsBestMatchingPreferredLanguages:(NSArray *)preferredLanguages
{
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObject:@"artwork"];
  return (NSArray *)[(AVAsset *)self _chapterMetadataGroupsBestMatchingPreferredLanguages:preferredLanguages containingItemsWithCommonKeys:v5];
}

- (void)loadChapterMetadataGroupsBestMatchingPreferredLanguages:(NSArray *)preferredLanguages completionHandler:(void *)completionHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __111__AVAsset_AVAssetChapterInspection__loadChapterMetadataGroupsBestMatchingPreferredLanguages_completionHandler___block_invoke;
  v4[3] = &unk_1E57B3180;
  v4[4] = self;
  v4[5] = preferredLanguages;
  void v4[6] = completionHandler;
  AVLoadValueAsynchronously(self, @"availableChapterLocales", (uint64_t)v4);
}

uint64_t __111__AVAsset_AVAssetChapterInspection__loadChapterMetadataGroupsBestMatchingPreferredLanguages_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) chapterMetadataGroupsBestMatchingPreferredLanguages:*(void *)(a1 + 40)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (NSArray)chapterMetadataGroupsWithTitleLocale:(NSLocale *)locale containingItemsWithCommonKeys:(NSArray *)commonKeys
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = [(NSLocale *)locale localeIdentifier];
  return (NSArray *)-[AVAsset _chapterMetadataGroupsBestMatchingPreferredLanguages:containingItemsWithCommonKeys:](self, "_chapterMetadataGroupsBestMatchingPreferredLanguages:containingItemsWithCommonKeys:", [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1], commonKeys);
}

- (void)loadChapterMetadataGroupsWithTitleLocale:(NSLocale *)locale containingItemsWithCommonKeys:(NSArray *)commonKeys completionHandler:(void *)completionHandler
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __126__AVAsset_AVAssetChapterInspection__loadChapterMetadataGroupsWithTitleLocale_containingItemsWithCommonKeys_completionHandler___block_invoke;
  v5[3] = &unk_1E57B31D0;
  v5[4] = self;
  v5[5] = locale;
  v5[6] = commonKeys;
  v5[7] = completionHandler;
  AVLoadValueAsynchronously(self, @"availableChapterLocales", (uint64_t)v5);
}

uint64_t __126__AVAsset_AVAssetChapterInspection__loadChapterMetadataGroupsWithTitleLocale_containingItemsWithCommonKeys_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) chapterMetadataGroupsWithTitleLocale:*(void *)(a1 + 40) containingItemsWithCommonKeys:*(void *)(a1 + 48)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v3();
}

- (id)_chapterTracks
{
  id v3 = (void *)[MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = objc_msgSend(-[AVAsset trackReferences](self, "trackReferences"), "objectForKey:", @"chap");
  unint64_t v5 = [v4 count];
  if (v5 >= 2)
  {
    unint64_t v6 = v5 >> 1;
    uint64_t v7 = 1;
    do
    {
      uint64_t v8 = -[AVAsset trackWithTrackID:](self, "trackWithTrackID:", objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v7), "intValue"));
      if (v8) {
        [v3 addObject:v8];
      }
      v7 += 2;
      --v6;
    }
    while (v6);
  }
  return v3;
}

- (BOOL)isDefunct
{
  id v2 = [(AVAsset *)self _assetInspector];
  return [v2 _isDefunct];
}

- (NSArray)fragments
{
  id v2 = -[AVFragmentedAssetsArray initWithCount:firstSequenceNumber:]([AVFragmentedAssetsArray alloc], "initWithCount:firstSequenceNumber:", objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "fragmentCount"), objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "firstFragmentSequenceNumber"));
  return (NSArray *)v2;
}

- (CMPersistentTrackID)unusedTrackID
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [(AVAsset *)self tracks];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((int)[v8 trackID] > v5) {
          int v5 = [v8 trackID];
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }
  return v5 + 2;
}

- (void)findUnusedTrackIDWithCompletionHandler:(void *)completionHandler
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __82__AVAsset_AVAssetVideoCompositionUtility__findUnusedTrackIDWithCompletionHandler___block_invoke;
  v3[3] = &unk_1E57B4830;
  void v3[4] = self;
  void v3[5] = completionHandler;
  AVLoadValueAsynchronously(self, @"tracks", (uint64_t)v3);
}

uint64_t __82__AVAsset_AVAssetVideoCompositionUtility__findUnusedTrackIDWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) unusedTrackID];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

+ (id)assetProxyWithPropertyList:(id)a3
{
  return +[AVAssetProxy assetProxyWithPropertyList:a3];
}

- (id)propertyListForProxy
{
  id v2 = [(AVAsset *)self _assetInspector];
  return (id)[v2 propertyListForProxy];
}

- (id)makePropertyListForProxyWithOptions:(id)a3
{
  id v4 = [(AVAsset *)self _assetInspector];
  return (id)[v4 makePropertyListForProxyWithOptions:a3];
}

- (BOOL)isProxy
{
  return 0;
}

+ (id)inspectionOnlyAssetWithFigAsset:(OpaqueFigAsset *)a3
{
  uint64_t v3 = [[AVStreamDataInspectionOnlyAsset alloc] initWithFigAsset:a3];
  return v3;
}

+ (id)inspectionOnlyAssetWithStreamDataParser:(id)a3 tracks:(id)a4
{
  id v4 = [[AVStreamDataAsset alloc] initWithParser:a3 tracks:a4];
  return v4;
}

@end