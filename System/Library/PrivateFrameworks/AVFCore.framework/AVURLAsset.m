@interface AVURLAsset
+ (AVURLAsset)URLAssetWithURL:(NSURL *)URL options:(NSDictionary *)options;
+ (BOOL)isPlayableExtendedMIMEType:(NSString *)extendedMIMEType;
+ (BOOL)isPlayableExtendedMIMEType:(id)a3 options:(id)a4;
+ (NSArray)audiovisualMIMETypes;
+ (NSArray)audiovisualTypes;
+ (id)UTTypeIDArrayFromUTTypeArray:(id)a3;
+ (id)_UTTypes;
+ (id)_avfValidationPlist;
+ (id)_avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes;
+ (id)_figFileMIMETypes;
+ (id)_figFilePathExtensions;
+ (id)_figFileUTIs;
+ (id)_figHFSFileTypes;
+ (id)_figMIMETypes;
+ (id)_figStreamingMIMETypes;
+ (id)_figStreamingUTIs;
+ (id)_fileUTTypes;
+ (id)_getFigAssetCreationOptionsFromURLAssetInitializationOptions:(id)a3 assetLoggingIdentifier:(id)a4 figAssetCreationFlags:(unint64_t *)a5 error:(id *)a6;
+ (id)_getFigAssetiTunesStoreContentInfoFromURLAssetiTunesStoreContentInfo:(id)a3;
+ (id)_initializationOptionsClasses;
+ (id)_objectWithItemProviderFileURL:(id)a3 typeIdentifier:(id)a4 isInPlace:(BOOL)a5 error:(id *)a6;
+ (id)_streamingUTTypes;
+ (id)assetForNSURLSessionWithURL:(id)a3 propertyList:(id)a4;
+ (id)instanceIdentifierMapTable;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)readableTypeIdentifiersForItemProvider;
+ (id)userInfoObjectForURLAsset:(id)a3;
+ (id)userInfoObjectForURLAssetInstanceIdentifier:(id)a3;
+ (id)writableTypeIdentifiersForItemProvider;
+ (int64_t)_preferredRepresentationForItemProviderReadableTypeIdentifier:(id)a3;
+ (int64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:(id)a3;
+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3;
+ (void)setUserInfoObject:(id)a3 forURLAsset:(id)a4;
- (AVAssetCache)assetCache;
- (AVAssetResourceLoader)resourceLoader;
- (AVURLAsset)init;
- (AVURLAsset)initWithFigCreationOptions:(id)a3 options:(id)a4 figAssetCreationOptions:(id)a5 figAssetCreationFlags:(unint64_t)a6;
- (AVURLAsset)initWithFileURL:(id)a3 offset:(int64_t)a4 length:(int64_t)a5 options:(id)a6;
- (AVURLAsset)initWithURL:(NSURL *)URL options:(NSDictionary *)options;
- (BOOL)_attachedToExternalContentKeySession;
- (BOOL)_clientURLLoadingRepresentsAccurateNetworkStatistics;
- (BOOL)_doNotLogURLs;
- (BOOL)_hasResourceLoaderDelegate;
- (BOOL)_requiresInProcessOperation;
- (BOOL)_shouldOptimizeAccessForLinearMoviePlayback;
- (BOOL)allowsConstrainedNetworkAccess;
- (BOOL)allowsExpensiveNetworkAccess;
- (BOOL)mayRequireContentKeysForMediaDataProcessing;
- (BOOL)shouldMatchDataInCacheByURLPathComponentOnly;
- (BOOL)shouldMatchDataInCacheByURLWithoutQueryComponent;
- (Class)_classForAssetTracks;
- (Class)_classForFigAssetInspectorLoader;
- (Class)_classForTrackInspectors;
- (NSArray)variants;
- (NSString)cacheKey;
- (NSURL)URL;
- (NSUUID)httpSessionIdentifier;
- (OpaqueFigFormatReader)_copyFormatReader;
- (OpaqueFigPlaybackItem)_playbackItem;
- (id)SHA1Digest;
- (id)_absoluteURL;
- (id)_assetInspector;
- (id)_assetInspectorLoader;
- (id)_errorForFigNotificationPayload:(__CFDictionary *)a3 key:(__CFString *)a4;
- (id)_installHandlerForNSURLSessionConfiguration:(id)a3 queue:(id)a4;
- (id)_loadFileRepresentationOfTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)_managedAssetCache;
- (id)_resourceLoaderWithRemoteHandlerContext:(id)a3;
- (id)_serializableCreationOptions;
- (id)contentKeySession;
- (id)contentKeySpecifiersEligibleForPreloading;
- (id)creationOptions;
- (id)description;
- (id)downloadDestinationURL;
- (id)identifyingTag;
- (id)identifyingTagClass;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)lyrics;
- (id)originalNetworkContentURL;
- (id)propertyListForNSURLSessionAssetReturningError:(id *)a3;
- (id)recommendedDestinationURLPathExtension;
- (id)resolvedURL;
- (id)tracks;
- (int)_attachToContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 failedSinceAlreadyAttachedToAnotherSession:(BOOL *)a5;
- (unint64_t)downloadToken;
- (unint64_t)referenceRestrictions;
- (void)_addFigAssetNotifications;
- (void)_ensureAssetDownloadCache;
- (void)_removeFigAssetNotifications;
- (void)_removeUserInfoObject;
- (void)_setAssetInspectorLoader:(id)a3;
- (void)_setUserInfoObject:(id)a3;
- (void)_tracksDidChange;
- (void)cancelLoading;
- (void)dealloc;
- (void)expire;
@end

@implementation AVURLAsset

+ (id)_UTTypes
{
  if (getTypeAccessMutex_onceToken != -1) {
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_1043);
  }
  MEMORY[0x199714DD0](getTypeAccessMutex_sTypeAccessMutex);
  v2 = (void *)gUTTypes;
  if (!gUTTypes)
  {
    if (ensureSupportedFormatsChangedNotificationRegistered_onceToken != -1) {
      dispatch_once(&ensureSupportedFormatsChangedNotificationRegistered_onceToken, &__block_literal_global_1045);
    }
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v4 = +[AVURLAsset _fileUTTypes];
    if (v4) {
      [v3 unionSet:v4];
    }
    id v5 = +[AVURLAsset _streamingUTTypes];
    if (v5) {
      [v3 unionSet:v5];
    }
    gUTTypes = (uint64_t)(id)[v3 allObjects];

    v2 = (void *)gUTTypes;
  }
  id v6 = v2;
  if (getTypeAccessMutex_onceToken != -1) {
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_1043);
  }
  MEMORY[0x199714DF0](getTypeAccessMutex_sTypeAccessMutex);
  return v6;
}

+ (id)_streamingUTTypes
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (getTypeAccessMutex_onceToken != -1) {
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_1043);
  }
  MEMORY[0x199714DD0](getTypeAccessMutex_sTypeAccessMutex);
  id v3 = (void *)gStreamingUTTypes;
  if (!gStreamingUTTypes)
  {
    if (ensureSupportedFormatsChangedNotificationRegistered_onceToken != -1) {
      dispatch_once(&ensureSupportedFormatsChangedNotificationRegistered_onceToken, &__block_literal_global_1045);
    }
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objc_msgSend(v4, "unionSet:", +[AVURLAsset _figStreamingUTIs](AVURLAsset, "_figStreamingUTIs"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = +[AVURLAsset _figStreamingMIMETypes];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    v7 = (uint64_t *)MEMORY[0x1E4F442E8];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v27;
      uint64_t v10 = *MEMORY[0x1E4F442E8];
      uint64_t v11 = *MEMORY[0x1E4F44338];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v5);
          }
          v13 = objc_msgSend(a1, "UTTypeIDArrayFromUTTypeArray:", objc_msgSend(MEMORY[0x1E4F442D8], "typesWithTag:tagClass:conformingToType:", *(void *)(*((void *)&v26 + 1) + 8 * i), v10, v11));
          if (AVAssetUTIsAreComplementary(v4, v13)) {
            [v4 addObjectsFromArray:v13];
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v8);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v14 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      uint64_t v17 = *v7;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v5);
          }
          v19 = objc_msgSend(a1, "UTTypeIDArrayFromUTTypeArray:", objc_msgSend(MEMORY[0x1E4F442D8], "typesWithTag:tagClass:conformingToType:", *(void *)(*((void *)&v22 + 1) + 8 * j), v17, objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:", @"public.playlist")));
          if (AVAssetUTIsAreComplementary(v4, v19)) {
            [v4 addObjectsFromArray:v19];
          }
        }
        uint64_t v15 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v15);
    }
    gStreamingUTTypes = [v4 copy];

    id v3 = (void *)gStreamingUTTypes;
  }
  id v20 = v3;
  if (getTypeAccessMutex_onceToken != -1) {
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_1043);
  }
  MEMORY[0x199714DF0](getTypeAccessMutex_sTypeAccessMutex);
  return v20;
}

+ (id)_fileUTTypes
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (getTypeAccessMutex_onceToken != -1) {
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_1043);
  }
  MEMORY[0x199714DD0](getTypeAccessMutex_sTypeAccessMutex);
  id v3 = (void *)gFileUTTypes;
  if (!gFileUTTypes)
  {
    if (ensureSupportedFormatsChangedNotificationRegistered_onceToken != -1) {
      dispatch_once(&ensureSupportedFormatsChangedNotificationRegistered_onceToken, &__block_literal_global_1045);
    }
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objc_msgSend(v4, "unionSet:", +[AVURLAsset _figFileUTIs](AVURLAsset, "_figFileUTIs"));
    id v5 = +[AVURLAsset _figFilePathExtensions];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v28;
      uint64_t v9 = *MEMORY[0x1E4F442E0];
      uint64_t v10 = *MEMORY[0x1E4F44338];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(v5);
          }
          v12 = objc_msgSend(a1, "UTTypeIDArrayFromUTTypeArray:", objc_msgSend(MEMORY[0x1E4F442D8], "typesWithTag:tagClass:conformingToType:", *(void *)(*((void *)&v27 + 1) + 8 * i), v9, v10));
          if (AVAssetUTIsAreComplementary(v4, v12)) {
            [v4 addObjectsFromArray:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v7);
    }
    id v13 = +[AVURLAsset _figFileMIMETypes];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      uint64_t v17 = *MEMORY[0x1E4F442E8];
      uint64_t v18 = *MEMORY[0x1E4F44338];
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          id v20 = objc_msgSend(a1, "UTTypeIDArrayFromUTTypeArray:", objc_msgSend(MEMORY[0x1E4F442D8], "typesWithTag:tagClass:conformingToType:", *(void *)(*((void *)&v23 + 1) + 8 * j), v17, v18));
          if (AVAssetUTIsAreComplementary(v4, v20)) {
            [v4 addObjectsFromArray:v20];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v15);
    }
    objc_msgSend(v4, "unionSet:", +[AVMediaFileType allFileTypeIdentifiers](AVMediaFileType, "allFileTypeIdentifiers"));
    gFileUTTypes = [v4 copy];

    id v3 = (void *)gFileUTTypes;
  }
  id v21 = v3;
  if (getTypeAccessMutex_onceToken != -1) {
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_1043);
  }
  MEMORY[0x199714DF0](getTypeAccessMutex_sTypeAccessMutex);
  return v21;
}

+ (id)UTTypeIDArrayFromUTTypeArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "identifier"));
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v4;
}

+ (id)_figStreamingUTIs
{
  return 0;
}

+ (id)_figStreamingMIMETypes
{
  return 0;
}

+ (id)_figFileUTIs
{
  return 0;
}

+ (id)_figFilePathExtensions
{
  return 0;
}

+ (id)_figFileMIMETypes
{
  return 0;
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  return [(AVAssetInspectorLoader *)self->_URLAsset->loader _playbackItem];
}

- (id)_absoluteURL
{
  id v3 = [(AVURLAsset *)self URL];
  if (!v3) {
    id v3 = [(AVURLAsset *)self resolvedURL];
  }
  return [(NSURL *)v3 absoluteURL];
}

- (NSURL)URL
{
  URL = self->_URLAsset->URL;
  if (URL) {
    return URL;
  }
  id v3 = [(AVURLAsset *)self _assetInspector];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return (NSURL *)[v3 URL];
}

- (id)_assetInspectorLoader
{
  return self->_URLAsset->loader;
}

- (BOOL)_shouldOptimizeAccessForLinearMoviePlayback
{
  id v2 = [(NSDictionary *)self->_URLAsset->initializationOptions objectForKey:@"AVURLAssetOptimizeAccessForLinearMoviePlaybackKey"];
  return [v2 BOOLValue];
}

+ (id)_getFigAssetCreationOptionsFromURLAssetInitializationOptions:(id)a3 assetLoggingIdentifier:(id)a4 figAssetCreationFlags:(unint64_t *)a5 error:(id *)a6
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  long long v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v12 = (void *)[a3 objectForKey:@"AVURLAssetReferenceRestrictionsKey"];
  if (v12) {
    unint64_t v13 = 4 * ([v12 unsignedIntegerValue] & 0xF);
  }
  else {
    unint64_t v13 = 8;
  }
  *a5 = v13;
  uint64_t v14 = (void *)[a3 objectForKey:@"AVURLAssetPreferNominalDurationsKey"];
  if (v14)
  {
    if (([v14 BOOLValue] & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ((dyld_program_sdk_at_least() & 1) == 0) {
LABEL_6:
  }
    *a5 |= 0x100uLL;
LABEL_7:
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVURLAssetDoNotLogURLsKey"), "BOOLValue"))*a5 |= 0x200uLL; {
  uint64_t v15 = [a3 objectForKey:@"AVURLAssetTypeKey"];
  }
  if (v15)
  {
    uint64_t v16 = v15;
    int v17 = objc_msgSend(+[AVURLAsset _fileUTTypes](AVURLAsset, "_fileUTTypes"), "containsObject:", v15);
    if (v17 != objc_msgSend(+[AVURLAsset _streamingUTTypes](AVURLAsset, "_streamingUTTypes"), "containsObject:", v16))
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F324E8];
      if (!v17) {
        uint64_t v18 = (void *)MEMORY[0x1E4F324F0];
      }
      [v11 setObject:*v18 forKey:*MEMORY[0x1E4F31F88]];
    }
  }
  uint64_t v19 = [a3 objectForKey:@"AVURLAssetClientBundleIdentifierKey"];
  if (v19) {
    [v11 setObject:v19 forKey:*MEMORY[0x1E4F31F68]];
  }
  uint64_t v20 = [a3 objectForKey:@"AVURLAssetClientAuditTokenKey"];
  if (v20) {
    [v11 setObject:v20 forKey:*MEMORY[0x1E4F31F60]];
  }
  uint64_t v21 = [a3 objectForKey:@"AVURLAssetAlternativeConfigurationOptionsKey"];
  if (v21) {
    [v11 setObject:v21 forKey:*MEMORY[0x1E4F31F28]];
  }
  uint64_t v22 = [a3 objectForKey:@"AVURLAssetSSLPropertiesKey"];
  if (v22) {
    [v11 setObject:v22 forKey:*MEMORY[0x1E4F320E0]];
  }
  long long v23 = (void *)[a3 objectForKey:@"AVURLAssetMaxSizeAllowedForCellularAccessKey"];
  long long v24 = (void *)[a3 objectForKey:@"AVURLAssetAllowsCellularAccessKey"];
  if (v24)
  {
    int v25 = [v24 BOOLValue];
    if (v23 && ((v25 ^ ([v23 longLongValue] == 0)) & 1) == 0)
    {
      v67 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v68 = *MEMORY[0x1E4F1C3C8];
      v69 = @"AVURLAssetMaxSizeAllowedForCellularAccessKey and AVURLAssetAllowsCellularAccessKey options are incompatible";
      goto LABEL_192;
    }
    if ((v25 & 1) == 0) {
      long long v23 = (void *)[MEMORY[0x1E4F28ED0] numberWithInt:0];
    }
  }
  if (v23) {
    [v11 setObject:v23 forKey:*MEMORY[0x1E4F32028]];
  }
  long long v26 = (void *)[a3 objectForKey:@"AVURLAssetAllowsExpensiveNetworkAccessKey"];
  if (v26 && ([v26 BOOLValue] & 1) == 0) {
    [v11 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F31FB8]];
  }
  long long v27 = (void *)[a3 objectForKey:@"AVURLAssetAllowsConstrainedNetworkAccessKey"];
  if (v27 && ([v27 BOOLValue] & 1) == 0) {
    [v11 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F31FB0]];
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVURLAssetInheritURIQueryComponentFromReferencingURIKey"), "BOOLValue"))objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F32008]); {
  uint64_t v28 = [a3 objectForKey:@"AVURLAssetBoundNetworkInterfaceName"];
  }
  if (v28) {
    [v11 setObject:v28 forKey:*MEMORY[0x1E4F31F48]];
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVURLAssetUseAppleWirelessDirectLinkKey"), "BOOLValue"))objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F32118]); {
  uint64_t v29 = [a3 objectForKey:@"AVURLAssetPreferPreciseDurationAndTimingKey"];
  }
  if (v29) {
    [v11 setObject:v29 forKey:*MEMORY[0x1E4F32098]];
  }
  long long v30 = (void *)[a3 objectForKey:@"AVURLAssetOutOfBandMIMETypeKey"];
  if (v30)
  {
    uint64_t v31 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v30, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceCharacterSet")), "componentsSeparatedByString:", @";"),
            "firstObject");
    [v11 setObject:v31 forKey:*MEMORY[0x1E4F32080]];
  }
  uint64_t v32 = [a3 objectForKey:@"AVURLAssetOverrideFileTypeKey"];
  if (v32) {
    [v11 setObject:v32 forKey:*MEMORY[0x1E4F32078]];
  }
  uint64_t v33 = [a3 objectForKey:@"AVURLAssetAllowableTypeCategoriesKey"];
  if (v33) {
    [v11 setObject:v33 forKey:*MEMORY[0x1E4F31F10]];
  }
  uint64_t v34 = [a3 objectForKey:@"AVURLAssetAllowableAudioCodecTypesKey"];
  if (v34) {
    [v11 setObject:v34 forKey:*MEMORY[0x1E4F31F00]];
  }
  uint64_t v35 = [a3 objectForKey:@"AVURLAssetAllowableVideoCodecTypesKey"];
  if (v35) {
    [v11 setObject:v35 forKey:*MEMORY[0x1E4F31F18]];
  }
  uint64_t v36 = [a3 objectForKey:@"AVURLAssetAllowableCaptionFormatsKey"];
  if (v36) {
    [v11 setObject:v36 forKey:*MEMORY[0x1E4F31F08]];
  }
  if (+[AVAsset _assetCreationOptionsRequiresInProcessOperation:a3])
  {
    uint64_t v37 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v11 setObject:v37 forKey:*MEMORY[0x1E4F320D8]];
  }
  if (+[AVAsset _assetCreationOptionsPrefersSandboxedOption:a3])
  {
    uint64_t v38 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v11 setObject:v38 forKey:*MEMORY[0x1E4F320A0]];
  }
  uint64_t v39 = [a3 objectForKey:@"AVURLAssetByteRangeInFileKey"];
  if (v39) {
    [v11 setObject:v39 forKey:*MEMORY[0x1E4F31F50]];
  }
  uint64_t v40 = [a3 objectForKey:@"AVURLAssetHTTPUserAgentKey"];
  uint64_t v41 = [a3 objectForKey:@"AVURLAssetHTTPHeaderFieldsKey"];
  if (!v41)
  {
    if (!v40) {
      goto LABEL_74;
    }
LABEL_70:
    id v42 = (id)[MEMORY[0x1E4F1CA60] dictionary];
    goto LABEL_71;
  }
  id v42 = (id)v41;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    id v42 = 0;
  }
  if (!v40) {
    goto LABEL_72;
  }
  if (!v42) {
    goto LABEL_70;
  }
  id v42 = (id)[v42 mutableCopy];
  v43 = (void *)[v42 allKeys];
  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __126__AVURLAsset__getFigAssetCreationOptionsFromURLAssetInitializationOptions_assetLoggingIdentifier_figAssetCreationFlags_error___block_invoke;
  v130[3] = &unk_1E57B31F8;
  v130[4] = v42;
  [v43 enumerateObjectsUsingBlock:v130];
LABEL_71:
  [v42 setObject:v40 forKey:@"User-Agent"];
LABEL_72:
  if (v42) {
    [v11 setObject:v42 forKey:*MEMORY[0x1E4F32000]];
  }
LABEL_74:
  uint64_t v44 = [a3 objectForKey:@"AVURLAssetAllowedHTTPProtocolTypesKey"];
  if (v44) {
    [v11 setObject:v44 forKey:*MEMORY[0x1E4F31F20]];
  }
  uint64_t v45 = [a3 objectForKey:@"AVURLAssetApplicationTransportSecurityKey"];
  if (v45) {
    [v11 setObject:v45 forKey:*MEMORY[0x1E4F31F40]];
  }
  v46 = (void *)[a3 objectForKey:@"AVURLAssetCacheKey"];
  uint64_t v47 = [v46 URL];
  if (v47)
  {
    [v11 setObject:v47 forKey:*MEMORY[0x1E4F32050]];
    [v11 setObject:*MEMORY[0x1E4F31E98] forKey:*MEMORY[0x1E4F32040]];
    if ([v46 isProgressiveDownloadCacheEnabled]) {
      [v11 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F31F58]];
    }
    if ([v46 isHTTPLiveStreamingCacheEnabled])
    {
      uint64_t v48 = MEMORY[0x1E4F1CC38];
      v49 = (void *)MEMORY[0x1E4F31FF8];
LABEL_86:
      [v11 setObject:v48 forKey:*v49];
    }
  }
  else if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVURLAssetCacheUseNonPurgeableMemoryKey"), "BOOLValue"))
  {
    [v11 setObject:*MEMORY[0x1E4F31EA0] forKey:*MEMORY[0x1E4F32040]];
    uint64_t v50 = [a3 objectForKey:@"AVURLAssetCacheNonPurgeableMemoryLimitKey"];
    if (v50)
    {
      uint64_t v48 = v50;
      v49 = (void *)MEMORY[0x1E4F32048];
      goto LABEL_86;
    }
  }
  v51 = (void *)[a3 objectForKey:@"AVURLAssetVideoNotEligibleForAppRecordingKey"];
  v52 = (void *)MEMORY[0x1E4F1CFC8];
  if (v51)
  {
    int v53 = [v51 BOOLValue];
    v54 = (void *)MEMORY[0x1E4F1CFD0];
    if (!v53) {
      v54 = v52;
    }
    [v11 setObject:*v54 forKey:*MEMORY[0x1E4F32120]];
  }
  v55 = (void *)[a3 objectForKey:@"AVURLAssetUsesNoPersistentCacheKey"];
  v56 = v55;
  if (v55)
  {
    int v57 = [v55 BOOLValue];
    v58 = (void *)MEMORY[0x1E4F1CFD0];
    if (!v57) {
      v58 = v52;
    }
    [v11 setObject:*v58 forKey:*MEMORY[0x1E4F32068]];
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVURLAssetShouldMatchDataInCacheByURLPathComponentOnlyKey"), "BOOLValue"))objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F32058]); {
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVURLAssetShouldMatchDataInCacheByURLWithoutQueryComponentKey"), "BOOLValue"))objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F32060]);
  }
  uint64_t v59 = [a3 objectForKey:@"AVURLAssetReadAheadOnByteStreamCreationEnabledKey"];
  if (v59) {
    [v11 setObject:v59 forKey:*MEMORY[0x1E4F32020]];
  }
  uint64_t v60 = [a3 objectForKey:@"AVURLAssetNetworkProbeRequestDisabledKey"];
  v61 = (void *)MEMORY[0x1E4F31FA8];
  if (v60) {
    [v11 setObject:v60 forKey:*MEMORY[0x1E4F31FA8]];
  }
  uint64_t v62 = [a3 objectForKey:@"AVURLAssetNetworkLatencyMitigationKeyPodcastsOnly"];
  if (v62)
  {
    uint64_t v63 = v62;
    [v11 setObject:v62 forKey:*MEMORY[0x1E4F320F0]];
    [v11 setObject:v63 forKey:*MEMORY[0x1E4F31F90]];
    [v11 setObject:v63 forKey:*v61];
    [v11 setObject:v63 forKey:*MEMORY[0x1E4F31F38]];
    [v11 setObject:v63 forKey:*MEMORY[0x1E4F31F30]];
  }
  uint64_t v64 = [a3 objectForKey:@"AVURLAssetDownloadDestinationURLKey"];
  if (v64) {
    [v11 setObject:v64 forKey:*MEMORY[0x1E4F31FC8]];
  }
  uint64_t v65 = [a3 objectForKey:@"AVURLAssetDownloadIsLowPriorityKey"];
  if (v65) {
    [v11 setObject:v65 forKey:*MEMORY[0x1E4F31FD0]];
  }
  if (v56)
  {
    int v66 = [v56 BOOLValue];
    if (v64)
    {
      if (v66)
      {
        v67 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v68 = *MEMORY[0x1E4F1C3C8];
        v69 = @"AVURLAssetDownloadDestinationURLKey and AVURLAssetUsesNoPersistentCacheKey options are incompatible";
LABEL_192:
        v114 = (void *)AVErrorForClientProgrammingError([v67 exceptionWithName:v68 reason:v69 userInfo:0]);
        long long v11 = 0;
        goto LABEL_193;
      }
    }
  }
  v70 = (void *)[a3 objectForKey:@"AVURLAssetPreloadDurationWhenNextItemKey"];
  if (v70)
  {
    memset(&v129[32], 0, 24);
    [v70 CMTimeValue];
    *(CMTime *)v129 = *(CMTime *)&v129[32];
    [v11 setObject:AVDictionaryWithTime((CMTime *)v129) forKey:*MEMORY[0x1E4F320A8]];
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVURLAssetOptimizeAccessForLinearMoviePlaybackKey"), "BOOLValue"))
  {
    uint64_t v71 = *MEMORY[0x1E4F1CFD0];
    [v11 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F32020]];
    [v11 setObject:v71 forKey:*MEMORY[0x1E4F32010]];
    [v11 setObject:v71 forKey:*MEMORY[0x1E4F320C8]];
    [v11 setObject:v71 forKey:*MEMORY[0x1E4F31FA0]];
    [v11 setObject:v71 forKey:*v61];
  }
  uint64_t v72 = [a3 objectForKey:@"AVAssetPrepareForIncrementalFragmentsKey"];
  if (v72) {
    [v11 setObject:v72 forKey:*MEMORY[0x1E4F320B8]];
  }
  id v118 = a4;
  v73 = (void *)[a3 objectForKey:@"AVURLAssetRequiresCustomURLLoadingKey"];
  v74 = (void *)[a3 objectForKey:@"AVURLAssetUseClientURLLoadingExclusively"];
  if (([v73 BOOLValue] & 1) != 0 || objc_msgSend(v74, "BOOLValue")) {
    [v11 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F320D0]];
  }
  uint64_t v75 = [a3 objectForKey:@"AVURLAssetProtectedContentSupportStorageURLKey"];
  uint64_t v76 = [a3 objectForKey:@"AVURLAssetPurchaseBundleKey"];
  uint64_t v77 = [a3 objectForKey:@"AVURLAssetAirPlayAuthorizationInfoKey"];
  uint64_t v78 = v77;
  if (v75 || v76 || v77)
  {
    v79 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    v80 = v79;
    if (v75) {
      [v79 setValue:v75 forKey:*MEMORY[0x1E4F31C40]];
    }
    if (v76) {
      [v80 setValue:v76 forKey:*MEMORY[0x1E4F31C48]];
    }
    if (v78) {
      [v80 setValue:v78 forKey:*MEMORY[0x1E4F31C38]];
    }
    [v11 setObject:v80 forKey:*MEMORY[0x1E4F31F78]];
  }
  v81 = (void *)[a3 objectForKey:@"AVURLAssetHTTPCookiesKey"];
  if ([v81 count])
  {
    v82 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v81, "count"));
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    uint64_t v83 = [v81 countByEnumeratingWithState:&v125 objects:v132 count:16];
    if (v83)
    {
      uint64_t v84 = v83;
      uint64_t v85 = *(void *)v126;
      do
      {
        for (uint64_t i = 0; i != v84; ++i)
        {
          if (*(void *)v126 != v85) {
            objc_enumerationMutation(v81);
          }
          uint64_t v87 = [*(id *)(*((void *)&v125 + 1) + 8 * i) properties];
          if (v87) {
            [v82 addObject:v87];
          }
        }
        uint64_t v84 = [v81 countByEnumeratingWithState:&v125 objects:v132 count:16];
      }
      while (v84);
    }
    [v11 setObject:v82 forKey:*MEMORY[0x1E4F31EF8]];
  }
  uint64_t v88 = [a3 objectForKey:@"AVURLAssetiTunesStoreContentInfoKey"];
  if (v88)
  {
    uint64_t v89 = [a1 _getFigAssetiTunesStoreContentInfoFromURLAssetiTunesStoreContentInfo:v88];
    [v11 setObject:v89 forKey:*MEMORY[0x1E4F32130]];
  }
  v90 = (void *)[a3 objectForKey:@"AVURLAssetOutOfBandAlternateTracksKey"];
  if (v90)
  {
    v91 = v90;
    v116 = v11;
    v117 = a6;
    v92 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v90, "count"));
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    uint64_t v93 = [v91 countByEnumeratingWithState:&v121 objects:v131 count:16];
    if (v93)
    {
      uint64_t v94 = v93;
      uint64_t v95 = *(void *)v122;
      uint64_t v96 = *MEMORY[0x1E4F34790];
      uint64_t v120 = *MEMORY[0x1E4F1CFD0];
      uint64_t v119 = *MEMORY[0x1E4F34770];
      do
      {
        for (uint64_t j = 0; j != v94; ++j)
        {
          if (*(void *)v122 != v95) {
            objc_enumerationMutation(v91);
          }
          uint64_t v98 = *(void *)(*((void *)&v121 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v99 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v98];
            if (![v99 objectForKey:v96]) {
              [v99 setValue:@"text" forKey:v96];
            }
            if (objc_msgSend((id)objc_msgSend(v99, "objectForKey:", @"MediaSelectionOptionsTaggedMediaCharacteristics"), "containsObject:", @"public.auxiliary-content"))objc_msgSend(v99, "setValue:forKey:", v120, v119); {
            [v92 addObject:v99];
            }
          }
        }
        uint64_t v94 = [v91 countByEnumeratingWithState:&v121 objects:v131 count:16];
      }
      while (v94);
    }
    long long v11 = v116;
    [v116 setObject:v92 forKey:*MEMORY[0x1E4F32070]];
    a6 = v117;
  }
  uint64_t v100 = [a3 objectForKey:@"AVURLAssetEnableQUICKey"];
  if (v100) {
    [v11 setObject:v100 forKey:*MEMORY[0x1E4F31FE0]];
  }
  uint64_t v101 = [a3 objectForKey:@"AVURLAssetForceQUICKey"];
  if (v101) {
    [v11 setObject:v101 forKey:*MEMORY[0x1E4F31FE8]];
  }
  uint64_t v102 = [a3 objectForKey:@"AVURLAssetWhitelistQUICKey"];
  if (v102) {
    [v11 setObject:v102 forKey:*MEMORY[0x1E4F32128]];
  }
  uint64_t v103 = [a3 objectForKey:@"AVURLAssetEnableMultiPath"];
  if (v103) {
    [v11 setObject:v103 forKey:*MEMORY[0x1E4F31FD8]];
  }
  v104 = (void *)[a3 objectForKey:@"AVURLAssetPrimarySessionIdentifierKey"];
  if (v104)
  {
    uint64_t v105 = [v104 UUIDString];
    [v11 setObject:v105 forKey:*MEMORY[0x1E4F320C0]];
  }
  uint64_t v106 = [a3 objectForKey:@"AVURLAssetPreferLargeResourceRequests"];
  if (v106) {
    [v11 setObject:v106 forKey:*MEMORY[0x1E4F32090]];
  }
  if (v118) {
    [v11 setObject:v118 forKey:*MEMORY[0x1E4F32018]];
  }
  uint64_t v107 = [a3 objectForKey:@"AVURLAssetUnitTestOptions"];
  if (v107) {
    [v11 setObject:v107 forKey:*MEMORY[0x1E4F32110]];
  }
  if ([a3 objectForKey:@"AVURLAssetParentNetworkActivityKey"])
  {
    uint64_t Token = FigNWActivityCreateToken();
    if (Token)
    {
      v109 = (const void *)Token;
      [v11 setObject:Token forKey:*MEMORY[0x1E4F32088]];
      CFRelease(v109);
    }
  }
  uint64_t v110 = [a3 objectForKey:@"AVURLAssetURLRequestAttributionKey"];
  if (v110) {
    [v11 setObject:v110 forKey:*MEMORY[0x1E4F32108]];
  }
  uint64_t v111 = [a3 objectForKey:@"AVURLAssetShouldEnableLegacyWebKitCompatibilityModeForContentKeyRequests"];
  if (v111) {
    [v11 setObject:v111 forKey:*MEMORY[0x1E4F320E8]];
  }
  uint64_t v112 = [a3 objectForKey:@"AVURLAssetCustomURLLoaderKey"];
  if (v112) {
    [v11 setObject:v112 forKey:*MEMORY[0x1E4F31F80]];
  }
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    [v11 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F31FC0]];
  }
  uint64_t v113 = [a3 objectForKey:@"AVURLAssetShouldSupportAIMEMetadataKey"];
  if (v113) {
    [v11 setObject:v113 forKey:*MEMORY[0x1E4F320F8]];
  }
  v114 = (void *)[a3 objectForKey:@"AVURLAssetDisableL4SKey"];
  if (v114)
  {
    [v11 setObject:v114 forKey:*MEMORY[0x1E4F31F98]];
    v114 = 0;
  }
LABEL_193:
  if (a6 && !v11) {
    *a6 = v114;
  }
  return v11;
}

id __20__AVURLAsset_tracks__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(v2[2] + 48);
  if (!v3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 48) = (id)objc_msgSend(v2, "_tracksWithClass:", objc_msgSend(*(id *)(a1 + 32), "_classForAssetTracks"));
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 16) + 48);
  }
  id result = v3;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (Class)_classForAssetTracks
{
  return (Class)objc_opt_class();
}

- (id)_assetInspector
{
  return [(AVAssetInspectorLoader *)self->_URLAsset->loader assetInspector];
}

- (Class)_classForTrackInspectors
{
  return [(AVAssetInspectorLoader *)self->_URLAsset->loader _classForTrackInspectors];
}

+ (AVURLAsset)URLAssetWithURL:(NSURL *)URL options:(NSDictionary *)options
{
  id v4 = (void *)[objc_alloc((Class)a1) initWithURL:URL options:options];
  return (AVURLAsset *)v4;
}

- (AVURLAsset)initWithURL:(NSURL *)URL options:(NSDictionary *)options
{
  v7.receiver = self;
  v7.super_class = (Class)AVURLAsset;
  id result = [(AVAsset *)&v7 init];
  if (result) {
    return (AVURLAsset *)avurlasset_setupGuts(result, URL, options, 0, 0);
  }
  return result;
}

- (Class)_classForFigAssetInspectorLoader
{
  return (Class)objc_opt_class();
}

- (BOOL)_hasResourceLoaderDelegate
{
  return [(AVAssetResourceLoader *)self->_URLAsset->resourceLoader delegate] != 0;
}

- (id)tracks
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  long long v10 = __Block_byref_object_copy__3;
  URLAsset = self->_URLAsset;
  long long v11 = __Block_byref_object_dispose__3;
  uint64_t v12 = 0;
  tracksAccessQueue = URLAsset->tracksAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __20__AVURLAsset_tracks__block_invoke;
  v6[3] = &unk_1E57B2160;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(tracksAccessQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_setAssetInspectorLoader:(id)a3
{
  if (self->_URLAsset->loader != a3)
  {
    [(AVURLAsset *)self _removeFigAssetNotifications];
    id v5 = a3;

    self->_URLAsset->loader = (AVAssetInspectorLoader *)a3;
    URLRequestHelper = self->_URLAsset->URLRequestHelper;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__AVURLAsset__setAssetInspectorLoader___block_invoke;
    v7[3] = &unk_1E57B3220;
    v7[4] = a3;
    [(AVAssetClientURLRequestHelper *)URLRequestHelper setFigAssetProvider:v7];
    [(AVURLAsset *)self _addFigAssetNotifications];
  }
}

- (void)_removeFigAssetNotifications
{
  id v3 = [(AVURLAsset *)self _assetInspectorLoader];
  if (v3)
  {
    id v4 = v3;
    id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v6 = [(AVAsset *)self _weakReference];
    [v5 removeListenerWithWeakReference:v6 callback:figLoaderNotificationHandler name:*MEMORY[0x1E4F31EC8] object:v4];
    [v5 removeListenerWithWeakReference:v6 callback:figLoaderNotificationHandler name:*MEMORY[0x1E4F31EC0] object:v4];
    [v5 removeListenerWithWeakReference:v6 callback:figLoaderNotificationHandler name:*MEMORY[0x1E4F31EE8] object:v4];
    [v5 removeListenerWithWeakReference:v6 callback:figLoaderNotificationHandler name:*MEMORY[0x1E4F31EF0] object:v4];
    [v5 removeListenerWithWeakReference:v6 callback:figLoaderNotificationHandler name:*MEMORY[0x1E4F31EE0] object:v4];
    [v5 removeListenerWithWeakReference:v6 callback:figLoaderNotificationHandler name:*MEMORY[0x1E4F31ED8] object:v4];
    CFRelease(v6);
  }
}

- (void)_addFigAssetNotifications
{
  id v3 = [(AVURLAsset *)self _assetInspectorLoader];
  if (v3)
  {
    id v4 = v3;
    id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v6 = [(AVAsset *)self _weakReference];
    CFRetain(v6);
    [v5 addListenerWithWeakReference:v6 callback:figLoaderNotificationHandler name:*MEMORY[0x1E4F31EC8] object:v4 flags:0];
    [v5 addListenerWithWeakReference:v6 callback:figLoaderNotificationHandler name:*MEMORY[0x1E4F31EC0] object:v4 flags:0];
    [v5 addListenerWithWeakReference:v6 callback:figLoaderNotificationHandler name:*MEMORY[0x1E4F31EE8] object:v4 flags:0];
    [v5 addListenerWithWeakReference:v6 callback:figLoaderNotificationHandler name:*MEMORY[0x1E4F31EF0] object:v4 flags:0];
    [v5 addListenerWithWeakReference:v6 callback:figLoaderNotificationHandler name:*MEMORY[0x1E4F31EE0] object:v4 flags:0];
    uint64_t v7 = *MEMORY[0x1E4F31ED8];
    [v5 addListenerWithWeakReference:v6 callback:figLoaderNotificationHandler name:v7 object:v4 flags:0];
  }
}

+ (NSArray)audiovisualTypes
{
  return (NSArray *)+[AVURLAsset _UTTypes];
}

+ (id)_avfValidationPlist
{
  if (_avfValidationPlist_loadValidationPlistOnceToken != -1) {
    dispatch_once(&_avfValidationPlist_loadValidationPlistOnceToken, &__block_literal_global_2);
  }
  return (id)_avfValidationPlist_sAVFoundationValidationPlist;
}

id __33__AVURLAsset__avfValidationPlist__block_invoke()
{
  FigMediaValidatorCreateMediaValidatorPropertyList();
  id result = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  _avfValidationPlist_sAVFoundationValidationPlist = (uint64_t)result;
  return result;
}

+ (id)_avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AVURLAsset__avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = a1;
  if (_avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes_loadValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypesOnceToken != -1) {
    dispatch_once(&_avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes_loadValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypesOnceToken, block);
  }
  return (id)_avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes_sAVFoundationValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes;
}

void __79__AVURLAsset__avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) _avfValidationPlist];
  FigCopySetOfPlaylistSupportedMIMETypes();
  if ([0 count])
  {
    id v2 = (id)[v1 mutableCopy];
    uint64_t v3 = [0 allObjects];
    [v2 setObject:v3 forKey:*MEMORY[0x1E4F32F90]];
  }
  else
  {
    id v2 = v1;
  }
  _avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes_sAVFoundationValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes = (uint64_t)v2;
}

+ (id)_figHFSFileTypes
{
  return 0;
}

+ (id)_figMIMETypes
{
  if (getTypeAccessMutex_onceToken != -1) {
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_1043);
  }
  MEMORY[0x199714DD0](getTypeAccessMutex_sTypeAccessMutex);
  id v2 = (void *)gFigMIMETypes;
  if (!gFigMIMETypes)
  {
    if (ensureSupportedFormatsChangedNotificationRegistered_onceToken != -1) {
      dispatch_once(&ensureSupportedFormatsChangedNotificationRegistered_onceToken, &__block_literal_global_1045);
    }
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
    id v4 = +[AVURLAsset _figFileMIMETypes];
    if (v4) {
      [v3 unionSet:v4];
    }
    id v5 = +[AVURLAsset _figStreamingMIMETypes];
    if (v5) {
      [v3 unionSet:v5];
    }
    gFigMIMETypes = (uint64_t)(id)[v3 allObjects];

    id v2 = (void *)gFigMIMETypes;
  }
  id v6 = v2;
  if (getTypeAccessMutex_onceToken != -1) {
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_1043);
  }
  MEMORY[0x199714DF0](getTypeAccessMutex_sTypeAccessMutex);
  return v6;
}

+ (NSArray)audiovisualMIMETypes
{
  return (NSArray *)+[AVURLAsset _figMIMETypes];
}

+ (BOOL)isPlayableExtendedMIMEType:(id)a3 options:(id)a4
{
  if (a4
    && objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"AVURLAssetExtendedMIMETypePlayabilityTreatPlaylistMIMETypesAsISOBMFFMediaDataContainersKey"), "BOOLValue"))
  {
    +[AVURLAsset _avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes];
  }
  else
  {
    +[AVURLAsset _avfValidationPlist];
  }
  +[AVURLAsset audiovisualMIMETypes];
  return FigMediaValidatorValidateRFC4281ExtendedMIMEType() == 0;
}

+ (BOOL)isPlayableExtendedMIMEType:(NSString *)extendedMIMEType
{
  return [a1 isPlayableExtendedMIMEType:extendedMIMEType options:0];
}

- (AVURLAsset)init
{
  return [(AVURLAsset *)self initWithURL:0 options:0];
}

+ (id)_getFigAssetiTunesStoreContentInfoFromURLAssetiTunesStoreContentInfo:(id)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  uint64_t v5 = [a3 objectForKey:@"AVURLAssetiTunesStoreContentIDKey"];
  uint64_t v6 = [a3 objectForKey:@"AVURLAssetiTunesStoreContentTypeKey"];
  uint64_t v7 = [a3 objectForKey:@"AVURLAssetiTunesStoreContentUserAgentKey"];
  uint64_t v8 = [a3 objectForKey:@"AVURLAssetiTunesStoreContentDownloadParametersKey"];
  uint64_t v9 = [a3 objectForKey:@"AVURLAssetiTunesStoreContentDSIDKey"];
  uint64_t v10 = [a3 objectForKey:@"AVURLAssetiTunesStoreContentPurchasedMediaKindKey"];
  uint64_t v11 = [a3 objectForKey:@"AVURLAssetiTunesStoreContentRentalIDKey"];
  uint64_t v12 = [a3 objectForKey:@"AVURLAssetiTunesStoreContentHLSAssetURLStringKey"];
  unint64_t v13 = (void *)[a3 objectForKey:@"AVURLAssetiTunesStoreContentAlternateContentInfoKey"];
  [v4 setValue:v5 forKey:*MEMORY[0x1E4F325D8]];
  [v4 setValue:v6 forKey:*MEMORY[0x1E4F325F0]];
  [v4 setValue:v7 forKey:*MEMORY[0x1E4F325F8]];
  [v4 setValue:v8 forKey:*MEMORY[0x1E4F325C8]];
  [v4 setValue:v9 forKey:*MEMORY[0x1E4F325C0]];
  [v4 setValue:v10 forKey:*MEMORY[0x1E4F325E0]];
  [v4 setValue:v11 forKey:*MEMORY[0x1E4F325E8]];
  if (v12) {
    [v4 setValue:v12 forKey:*MEMORY[0x1E4F325D0]];
  }
  if (v13)
  {
    uint64_t v14 = (void *)[a1 _getFigAssetiTunesStoreContentInfoFromURLAssetiTunesStoreContentInfo:v13];
    uint64_t v15 = [v13 objectForKey:@"AVURLAssetiTunesStoreContentAlternateContentInfoAssetURLStringKey"];
    [v14 setValue:v15 forKey:*MEMORY[0x1E4F325B8]];
    [v4 setValue:v14 forKey:*MEMORY[0x1E4F325B0]];
  }
  return v4;
}

+ (id)_initializationOptionsClasses
{
  if (_initializationOptionsClasses_onceToken != -1) {
    dispatch_once(&_initializationOptionsClasses_onceToken, &__block_literal_global_736);
  }
  return (id)_initializationOptionsClasses_sClassesSet;
}

id __43__AVURLAsset__initializationOptionsClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id result = (id)objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  _initializationOptionsClasses_sClassesSet = (uint64_t)result;
  return result;
}

uint64_t __126__AVURLAsset__getFigAssetCreationOptionsFromURLAssetInitializationOptions_assetLoggingIdentifier_figAssetCreationFlags_error___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = [a2 caseInsensitiveCompare:@"User-Agent"];
    if (!result)
    {
      uint64_t v5 = *(void **)(a1 + 32);
      return [v5 removeObjectForKey:a2];
    }
  }
  return result;
}

- (AVURLAsset)initWithFigCreationOptions:(id)a3 options:(id)a4 figAssetCreationOptions:(id)a5 figAssetCreationFlags:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)AVURLAsset;
  uint64_t result = [(AVAsset *)&v11 init];
  if (result) {
    return (AVURLAsset *)avurlasset_setupGuts(result, a3, a4, a5, a6);
  }
  return result;
}

- (AVURLAsset)initWithFileURL:(id)a3 offset:(int64_t)a4 length:(int64_t)a5 options:(id)a6
{
  uint64_t v10 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a6];
  objc_super v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a4];
  [v11 setObject:v12 forKey:*MEMORY[0x1E4F31C20]];
  uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a5];
  [v11 setObject:v13 forKey:*MEMORY[0x1E4F31C18]];
  [v10 setObject:v11 forKey:@"AVURLAssetByteRangeInFileKey"];
  if (!a3 || ![a3 isFileURL]) {
    return 0;
  }
  return [(AVURLAsset *)self initWithURL:a3 options:v10];
}

- (id)_errorForFigNotificationPayload:(__CFDictionary *)a3 key:(__CFString *)a4
{
  if (!a3) {
    return 0;
  }
  CFTypeID v6 = CFGetTypeID(a3);
  if (v6 != CFDictionaryGetTypeID()) {
    return 0;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a3, a4);
  signed int valuePtr = 0;
  if (!Value) {
    return 0;
  }
  CFNumberRef v8 = Value;
  CFTypeID v9 = CFGetTypeID(Value);
  if (v9 != CFNumberGetTypeID()) {
    return 0;
  }
  CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
  return (id)AVLocalizedErrorWithUnderlyingOSStatus(valuePtr, 0);
}

- (void)_ensureAssetDownloadCache
{
  makeOneAssetDownloadCacheOnly = self->_URLAsset->makeOneAssetDownloadCacheOnly;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__AVURLAsset__ensureAssetDownloadCache__block_invoke;
  v3[3] = &unk_1E57B1E80;
  v3[4] = self;
  [(AVDispatchOnce *)makeOneAssetDownloadCacheOnly runBlockOnce:v3];
}

AVAssetDownloadCache *__39__AVURLAsset__ensureAssetDownloadCache__block_invoke(uint64_t a1)
{
  uint64_t result = (AVAssetDownloadCache *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 96) objectForKey:@"AVURLAssetCacheKey"];
  if (!result)
  {
    uint64_t result = [[AVAssetDownloadCache alloc] initWithAsset:*(void *)(a1 + 32)];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 72) = result;
  }
  return result;
}

- (void)dealloc
{
  if (self->_URLAsset)
  {
    [(AVURLAsset *)self _removeUserInfoObject];
    [(AVURLAsset *)self _removeFigAssetNotifications];
    URLAsset = self->_URLAsset;
    tracksAccessQueue = URLAsset->tracksAccessQueue;
    if (tracksAccessQueue)
    {
      dispatch_release(tracksAccessQueue);
      URLAsset = self->_URLAsset;
    }
    if (URLAsset->requiresSecurityScopeRelease)
    {
      [(NSURL *)URLAsset->URL stopAccessingSecurityScopedResource];
      URLAsset = self->_URLAsset;
    }

    CFRelease(self->_URLAsset);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVURLAsset;
  [(AVAsset *)&v5 dealloc];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  if ([(AVURLAsset *)self _doNotLogURLs]) {
    CFTypeID v6 = (NSURL *)@"<redacted>";
  }
  else {
    CFTypeID v6 = [(AVURLAsset *)self URL];
  }
  return (id)[v3 stringWithFormat:@"<%@: %p, URL = %@>", v5, self, v6];
}

uint64_t __39__AVURLAsset__setAssetInspectorLoader___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _figAsset];
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  return [(AVAssetInspectorLoader *)self->_URLAsset->loader _copyFormatReader];
}

- (void)_tracksDidChange
{
  tracksAccessQueue = self->_URLAsset->tracksAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__AVURLAsset__tracksDidChange__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(tracksAccessQueue, block);
}

void __30__AVURLAsset__tracksDidChange__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 48) = 0;
}

- (BOOL)_doNotLogURLs
{
  uint64_t v2 = objc_msgSend(-[AVURLAsset creationOptions](self, "creationOptions"), "objectForKey:", @"AVURLAssetDoNotLogURLsKey");
  return [v2 BOOLValue];
}

- (NSUUID)httpSessionIdentifier
{
  id v2 = [(AVURLAsset *)self _assetInspector];
  return (NSUUID *)[v2 httpSessionIdentifier];
}

- (id)recommendedDestinationURLPathExtension
{
  if ([(AVAsset *)self _isStreaming]) {
    return @"movpkg";
  }
  id v4 = [(AVURLAsset *)self identifyingTagClass];
  id v3 = [(AVURLAsset *)self identifyingTag];
  if ([v4 isEqualToString:*MEMORY[0x1E4F442E0]]) {
    return v3;
  }
  if (v3)
  {
    if (v4) {
      CFTypeID v6 = (void *)[MEMORY[0x1E4F442D8] typeWithTag:v3 tagClass:v4 conformingToType:0];
    }
    else {
      CFTypeID v6 = (void *)[MEMORY[0x1E4F442D8] typeWithIdentifier:v3];
    }
  }
  else
  {
    CFTypeID v6 = 0;
  }
  return (id)[v6 preferredFilenameExtension];
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return self->_URLAsset->allowsExpensiveNetworkAccess;
}

- (BOOL)allowsConstrainedNetworkAccess
{
  return self->_URLAsset->allowsConstrainedNetworkAccess;
}

- (id)creationOptions
{
  return self->_URLAsset->initializationOptions;
}

- (void)cancelLoading
{
  [(AVAssetInspectorLoader *)self->_URLAsset->loader cancelLoading];
  resourceLoader = self->_URLAsset->resourceLoader;
  [(AVAssetResourceLoader *)resourceLoader cancelLoading];
}

- (id)lyrics
{
  return [(AVAssetInspectorLoader *)self->_URLAsset->loader lyrics];
}

- (unint64_t)referenceRestrictions
{
  id v2 = [(NSDictionary *)self->_URLAsset->initializationOptions objectForKey:@"AVURLAssetReferenceRestrictionsKey"];
  return [v2 unsignedIntegerValue];
}

- (BOOL)_requiresInProcessOperation
{
  return +[AVAsset _assetCreationOptionsRequiresInProcessOperation:self->_URLAsset->initializationOptions];
}

- (id)contentKeySpecifiersEligibleForPreloading
{
  return [(AVAssetInspectorLoader *)self->_URLAsset->loader contentKeySpecifiersEligibleForPreloading];
}

- (id)_managedAssetCache
{
  return [(NSDictionary *)self->_URLAsset->initializationOptions objectForKey:@"AVURLAssetCacheKey"];
}

- (AVAssetCache)assetCache
{
  uint64_t result = [(AVURLAsset *)self _managedAssetCache];
  if (!result)
  {
    [(AVURLAsset *)self _ensureAssetDownloadCache];
    return self->_URLAsset->assetCache;
  }
  return result;
}

- (BOOL)shouldMatchDataInCacheByURLPathComponentOnly
{
  id v2 = [(NSDictionary *)self->_URLAsset->initializationOptions objectForKey:@"AVURLAssetShouldMatchDataInCacheByURLPathComponentOnlyKey"];
  return [v2 BOOLValue];
}

- (BOOL)shouldMatchDataInCacheByURLWithoutQueryComponent
{
  id v2 = [(NSDictionary *)self->_URLAsset->initializationOptions objectForKey:@"AVURLAssetShouldMatchDataInCacheByURLWithoutQueryComponentKey"];
  return [v2 BOOLValue];
}

- (NSString)cacheKey
{
  if (![(AVURLAsset *)self shouldMatchDataInCacheByURLPathComponentOnly]) {
    [(AVURLAsset *)self shouldMatchDataInCacheByURLWithoutQueryComponent];
  }
  [(AVURLAsset *)self URL];
  id v3 = (void *)FigCFURLCreateCacheKey();
  return (NSString *)v3;
}

- (id)identifyingTagClass
{
  id v2 = [(AVURLAsset *)self _assetInspector];
  return (id)[v2 identifyingTagClass];
}

- (id)identifyingTag
{
  id v2 = [(AVURLAsset *)self _assetInspector];
  return (id)[v2 identifyingTag];
}

- (id)resolvedURL
{
  return [(AVAssetInspectorLoader *)self->_URLAsset->loader resolvedURL];
}

- (id)originalNetworkContentURL
{
  return [(AVAssetInspectorLoader *)self->_URLAsset->loader originalNetworkContentURL];
}

- (id)downloadDestinationURL
{
  return [(NSDictionary *)self->_URLAsset->initializationOptions objectForKey:@"AVURLAssetDownloadDestinationURLKey"];
}

- (unint64_t)downloadToken
{
  return [(AVAssetInspectorLoader *)self->_URLAsset->loader downloadToken];
}

- (id)SHA1Digest
{
  id v2 = [(AVURLAsset *)self _assetInspector];
  return (id)[v2 SHA1Digest];
}

- (BOOL)_clientURLLoadingRepresentsAccurateNetworkStatistics
{
  if (objc_msgSend(-[NSDictionary objectForKey:](self->_URLAsset->initializationOptions, "objectForKey:", @"AVURLAssetClientURLLoadingRepresentsAccurateNetworkStatistics"), "BOOLValue") & 1) != 0|| (objc_msgSend(-[NSDictionary objectForKey:](self->_URLAsset->initializationOptions, "objectForKey:", @"AVURLAssetUseClientURLLoadingExclusively"), "BOOLValue"))
  {
    return 1;
  }
  id v4 = [(NSDictionary *)self->_URLAsset->initializationOptions objectForKey:@"AVURLAssetRequiresCustomURLLoadingKey"];
  return [v4 BOOLValue];
}

- (NSArray)variants
{
  return [(AVAssetInspectorLoader *)self->_URLAsset->loader variants];
}

- (id)_resourceLoaderWithRemoteHandlerContext:(id)a3
{
  makeOneResourceLoaderOnly = self->_URLAsset->makeOneResourceLoaderOnly;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__AVURLAsset_AVURLAssetURLHandlingInternal___resourceLoaderWithRemoteHandlerContext___block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = self;
  v6[5] = a3;
  [(AVDispatchOnce *)makeOneResourceLoaderOnly runBlockOnce:v6];
  return self->_URLAsset->resourceLoader;
}

void __85__AVURLAsset_AVURLAssetURLHandlingInternal___resourceLoaderWithRemoteHandlerContext___block_invoke(uint64_t a1)
{
  id v2 = -[AVAssetResourceLoader initWithURLRequestHelper:asset:remoteCustomURLHandlerContext:]([AVAssetResourceLoader alloc], "initWithURLRequestHelper:asset:remoteCustomURLHandlerContext:", *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 16));
  uint64_t v3 = 0;
  atomic_compare_exchange_strong((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 32) + 16) + 56), (unint64_t *)&v3, (unint64_t)v2);
  if (v3)
  {
  }
}

- (AVAssetResourceLoader)resourceLoader
{
  return (AVAssetResourceLoader *)[(AVURLAsset *)self _resourceLoaderWithRemoteHandlerContext:0];
}

+ (id)instanceIdentifierMapTable
{
  if (sInstanceIdentifierOnceToken != -1) {
    dispatch_once(&sInstanceIdentifierOnceToken, &__block_literal_global_874);
  }
  return (id)sInstanceIdentfierMapTable;
}

uint64_t __76__AVURLAsset_AVURLAssetInstanceIdentiferMapping__instanceIdentifierMapTable__block_invoke()
{
  sInstanceIdentifierMapTableQueue = (uint64_t)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avurlasset.instanceIdentifierMapping");
  uint64_t result = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0x10000 valueOptions:5 capacity:0];
  sInstanceIdentfierMapTable = result;
  return result;
}

- (void)_removeUserInfoObject
{
  if (self->_URLAsset->hasInstanceIdentifierMapping) {
    [(AVURLAsset *)self _setUserInfoObject:0];
  }
}

- (void)_setUserInfoObject:(id)a3
{
  objc_super v5 = [(NSUUID *)[(AVURLAsset *)self httpSessionIdentifier] UUIDString];
  id v6 = +[AVURLAsset instanceIdentifierMapTable];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__AVURLAsset_AVURLAssetInstanceIdentiferMapping___setUserInfoObject___block_invoke;
  v7[3] = &unk_1E57B3248;
  v7[4] = a3;
  void v7[5] = v6;
  v7[6] = v5;
  v7[7] = self;
  av_readwrite_dispatch_queue_write((dispatch_queue_t)sInstanceIdentifierMapTableQueue, v7);
}

uint64_t __69__AVURLAsset_AVURLAssetInstanceIdentiferMapping___setUserInfoObject___block_invoke(void *a1)
{
  uint64_t v3 = a1[4];
  id v2 = (void *)a1[5];
  if (v3)
  {
    uint64_t result = [v2 setObject:v3 forKey:a1[6]];
    char v5 = 1;
  }
  else
  {
    uint64_t result = [v2 removeObjectForKey:a1[6]];
    char v5 = 0;
  }
  *(unsigned char *)(*(void *)(a1[7] + 16) + 104) = v5;
  return result;
}

+ (void)setUserInfoObject:(id)a3 forURLAsset:(id)a4
{
}

+ (id)userInfoObjectForURLAsset:(id)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend(a3, "httpSessionIdentifier"), "UUIDString");
  if (result)
  {
    return (id)[a1 userInfoObjectForURLAssetInstanceIdentifier:result];
  }
  return result;
}

+ (id)userInfoObjectForURLAssetInstanceIdentifier:(id)a3
{
  uint64_t v8 = 0;
  CFTypeID v9 = &v8;
  uint64_t v10 = 0x3052000000;
  objc_super v11 = __Block_byref_object_copy__3;
  uint64_t v12 = __Block_byref_object_dispose__3;
  uint64_t v13 = 0;
  uint64_t v4 = [a1 instanceIdentifierMapTable];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__AVURLAsset_AVURLAssetInstanceIdentiferMapping__userInfoObjectForURLAssetInstanceIdentifier___block_invoke;
  block[3] = &unk_1E57B3270;
  void block[5] = a3;
  block[6] = &v8;
  block[4] = v4;
  av_readwrite_dispatch_queue_read((dispatch_queue_t)sInstanceIdentifierMapTableQueue, block);
  char v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __94__AVURLAsset_AVURLAssetInstanceIdentiferMapping__userInfoObjectForURLAssetInstanceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (BOOL)mayRequireContentKeysForMediaDataProcessing
{
  return 1;
}

- (int)_attachToContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 failedSinceAlreadyAttachedToAnotherSession:(BOOL *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  CFTypeRef v44 = 0;
  CFTypeRef v45 = 0;
  CFTypeID v9 = (AVWeakReference *)(id)[a3 _weakReference];
  if (!a3
    || (uint64_t v10 = 0,
        atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_URLAsset->sessionReference, (unint64_t *)&v10, (unint64_t)v9), v10))
  {
    if (a5)
    {
      if (v9) {
        BOOL v14 = v9 != self->_URLAsset->sessionReference;
      }
      else {
        BOOL v14 = 0;
      }
      *a5 = v14;
    }

    int v15 = 0;
    goto LABEL_43;
  }
  if (![(AVAsset *)self _figAsset])
  {
    int v18 = FigSignalErrorAt();
    goto LABEL_49;
  }
  [(AVAsset *)self _figAsset];
  uint64_t CMBaseObject = FigAssetGetCMBaseObject();
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v16 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v13 + 48);
  if (!v16) {
    goto LABEL_42;
  }
  uint64_t v17 = *MEMORY[0x1E4F1CF80];
  int v18 = v16(CMBaseObject, *MEMORY[0x1E4F321E0], *MEMORY[0x1E4F1CF80], &v44);
  if (v18) {
    goto LABEL_49;
  }
  if (a4)
  {
    CFTypeRef v19 = v44;
    if (v44)
    {
      uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v20) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = 0;
      }
      uint64_t v22 = *(uint64_t (**)(CFTypeRef, OpaqueFigContentKeyBoss *))(v21 + 88);
      if (!v22) {
        goto LABEL_42;
      }
      int v18 = v22(v19, a4);
      if (v18)
      {
LABEL_49:
        int v15 = v18;
        goto LABEL_43;
      }
    }
  }
  [(AVAsset *)self _figAsset];
  uint64_t v23 = FigAssetGetCMBaseObject();
  uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 8);
  uint64_t v25 = v24 ? v24 : 0;
  long long v26 = *(uint64_t (**)(uint64_t, void, uint64_t, CFTypeRef *))(v25 + 48);
  if (!v26)
  {
LABEL_42:
    int v15 = -12782;
    goto LABEL_43;
  }
  int v18 = v26(v23, *MEMORY[0x1E4F32210], v17, &v45);
  if (v18) {
    goto LABEL_49;
  }
  long long v27 = (void *)[a3 _contentKeyGroups];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v41;
LABEL_29:
    uint64_t v31 = 0;
    while (1)
    {
      if (*(void *)v41 != v30) {
        objc_enumerationMutation(v27);
      }
      CFTypeRef v32 = v45;
      uint64_t v33 = [*(id *)(*((void *)&v40 + 1) + 8 * v31) _figContentKeySession];
      uint64_t v34 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v35 = v34 ? v34 : 0;
      uint64_t v36 = *(uint64_t (**)(CFTypeRef, uint64_t))(v35 + 8);
      if (!v36) {
        goto LABEL_42;
      }
      int v18 = v36(v32, v33);
      if (v18) {
        goto LABEL_49;
      }
      if (v29 == ++v31)
      {
        uint64_t v29 = [v27 countByEnumeratingWithState:&v40 objects:v46 count:16];
        if (v29) {
          goto LABEL_29;
        }
        break;
      }
    }
  }
  uint64_t v37 = [(AVURLAsset *)self resourceLoader];
  CFTypeRef cf = 0;
  int v15 = [a3 createAndInstallCustomURLHandlerForAsset:self outHandler:&cf];
  if (!v15)
  {
    [(AVAssetResourceLoader *)v37 _setContentKeySessionCustomURLHandler:cf];
    if (cf) {
      CFRelease(cf);
    }
  }
LABEL_43:
  if (v45) {
    CFRelease(v45);
  }
  if (v44) {
    CFRelease(v44);
  }
  return v15;
}

- (id)contentKeySession
{
  return [(AVWeakReference *)self->_URLAsset->sessionReference referencedObject];
}

- (BOOL)_attachedToExternalContentKeySession
{
  id v2 = [(AVWeakReference *)self->_URLAsset->sessionReference referencedObject];
  if (v2) {
    LOBYTE(v2) = [v2 isInternal] ^ 1;
  }
  return (char)v2;
}

- (void)expire
{
  [(AVURLAsset *)self cancelLoading];
  uint64_t v3 = [(AVAsset *)self _figAsset];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v6 = v5 ? v5 : 0;
    uint64_t v7 = *(void (**)(OpaqueFigAsset *))(v6 + 24);
    if (v7)
    {
      v7(v4);
    }
  }
}

- (id)_installHandlerForNSURLSessionConfiguration:(id)a3 queue:(id)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v7 setMaxConcurrentOperationCount:1];
  [v7 setUnderlyingQueue:a4];
  uint64_t v8 = [[AVAssetCustomURLBridgeForNSURLSession alloc] initWithFigAsset:[(AVAsset *)self _figAsset]];
  -[AVAssetCustomURLBridgeForNSURLSession setSession:](v8, "setSession:", [MEMORY[0x1E4F18DC0] sessionWithConfiguration:a3 delegate:v8 delegateQueue:v7]);
  return v8;
}

+ (id)readableTypeIdentifiersForItemProvider
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"com.apple.avfoundation.urlasset";
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  if ([a4 caseInsensitiveCompare:@"com.apple.avfoundation.urlasset"])
  {
    uint64_t v18 = *MEMORY[0x1E4F28228];
    v19[0] = [NSString stringWithFormat:@"Reading data from the type identifier %@ is not supported by AVURLAsset.", a4];
    a3 = 0;
    uint64_t v17 = AVLocalizedError(@"AVFoundationErrorDomain", -11862, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1]);
  }
  else if (a3)
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:&v17];
    uint64_t v11 = [v10 securityScopedURL];
    uint64_t v12 = [v10 assetInitializationOptions];
    if (v11) {
      BOOL v13 = v17 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      uint64_t v14 = v12;
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v16 = v15;
      if (v14) {
        [v15 addEntriesFromDictionary:v14];
      }
      [v16 setValue:MEMORY[0x1E4F1CC38] forKey:@"AVURLAssetHasSecurityScopedURLKey"];
      a3 = +[AVURLAsset URLAssetWithURL:v11 options:v16];
    }
    else
    {
      a3 = 0;
    }
  }
  if (a5 && !a3)
  {
    uint64_t v8 = (void *)v17;
    if (!v17) {
      uint64_t v8 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
    }
    *a5 = v8;
  }
  return a3;
}

+ (int64_t)_preferredRepresentationForItemProviderReadableTypeIdentifier:(id)a3
{
  return 0;
}

+ (id)_objectWithItemProviderFileURL:(id)a3 typeIdentifier:(id)a4 isInPlace:(BOOL)a5 error:(id *)a6
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if ([a4 caseInsensitiveCompare:@"com.apple.avfoundation.urlasset"])
  {
    v13[0] = [NSString stringWithFormat:@"Reading file representations for the type identifier %@ is not supported by AVURLAsset.", a4, *MEMORY[0x1E4F28228]];
    uint64_t v9 = AVLocalizedError(@"AVFoundationErrorDomain", -11862, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1]);
    if (a6)
    {
      uint64_t v10 = (void *)v9;
      if (v9)
      {
LABEL_8:
        id result = 0;
        *a6 = v10;
        return result;
      }
LABEL_7:
      uint64_t v10 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
      goto LABEL_8;
    }
    return 0;
  }
  else
  {
    id result = +[AVURLAsset URLAssetWithURL:a3 options:0];
    if (a6 && !result) {
      goto LABEL_7;
    }
  }
  return result;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"com.apple.avfoundation.urlasset";
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 0;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = [(AVURLAsset *)self URL];
  uint64_t v14 = 0;
  if ([a3 caseInsensitiveCompare:@"com.apple.avfoundation.urlasset"])
  {
    uint64_t v15 = *MEMORY[0x1E4F28228];
    uint64_t v16 = [NSString stringWithFormat:@"Loading data from the type identifier %@ is not supported by AVURLAsset.", a3];
    uint64_t v8 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v9 = -11862;
  }
  else
  {
    if ([(NSURL *)v7 isFileURL])
    {
      uint64_t v10 = +[AVURLAssetItemProviderData itemProviderDataWithURL:v7 assetInitializationOptions:self->_URLAsset->initializationOptions];
      uint64_t v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v14];
      if (v11) {
        BOOL v12 = v14 == 0;
      }
      else {
        BOOL v12 = 0;
      }
      if (v12)
      {
        (*((void (**)(id, uint64_t))a4 + 2))(a4, v11);
        return 0;
      }
      if (!v14) {
        goto LABEL_12;
      }
      goto LABEL_13;
    }
    uint64_t v17 = *MEMORY[0x1E4F28228];
    v18[0] = [NSString stringWithFormat:@"Writing to NSItemProviders is not supported for non file:/// scheme URLs: %@", v7];
    uint64_t v8 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v9 = -11838;
  }
  uint64_t v14 = AVLocalizedError(@"AVFoundationErrorDomain", v9, v8);
  if (!v14) {
LABEL_12:
  }
    uint64_t v14 = AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
LABEL_13:
  (*((void (**)(id, void))a4 + 2))(a4, 0);
  return 0;
}

+ (int64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:(id)a3
{
  return 0;
}

- (id)_loadFileRepresentationOfTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(AVURLAsset *)self URL];
  if ([a3 caseInsensitiveCompare:@"com.apple.avfoundation.urlasset"])
  {
    uint64_t v12 = [NSString stringWithFormat:@"Loading file representations for the type identifier %@ is not supported by AVURLAsset.", a3, *MEMORY[0x1E4F28228]];
    id v7 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    uint64_t v8 = -11862;
  }
  else
  {
    if ([(NSURL *)v6 isFileURL])
    {
      (*((void (**)(id, NSURL *, uint64_t, void))a4 + 2))(a4, v6, 1, 0);
      return 0;
    }
    uint64_t v13 = *MEMORY[0x1E4F28228];
    v14[0] = [NSString stringWithFormat:@"Writing to NSItemProviders is not supported for non file:/// scheme URLs: %@", v6];
    id v7 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v8 = -11838;
  }
  uint64_t v9 = AVLocalizedError(@"AVFoundationErrorDomain", v8, v7);
  if (!v9) {
    uint64_t v9 = AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
  }
  (*((void (**)(id, void, void, uint64_t))a4 + 2))(a4, 0, 0, v9);
  return 0;
}

- (id)_serializableCreationOptions
{
  id v2 = [[AVAssetSerializableCreationOptions alloc] initWithCreationOptions:[(AVURLAsset *)self creationOptions]];
  return v2;
}

+ (id)assetForNSURLSessionWithURL:(id)a3 propertyList:(id)a4
{
  objc_opt_class();
  uint64_t v6 = 0;
  if (objc_opt_isKindOfClass())
  {
    [a4 objectForKey:@"figAssetCreationOptions"];
    FigAssetCreateOptionsDictFromPList();
    id v7 = (void *)[a4 objectForKey:@"figAssetCreationFlags"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = [v7 unsignedLongLongValue];
    }
    else {
      uint64_t v6 = 0;
    }
  }
  uint64_t v8 = [AVURLAsset alloc];
  id v9 = 0;
  return [(AVURLAsset *)v8 initWithFigCreationOptions:a3 options:MEMORY[0x1E4F1CC08] figAssetCreationOptions:v9 figAssetCreationFlags:v6];
}

- (id)propertyListForNSURLSessionAssetReturningError:(id *)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  CFTypeRef v20 = 0;
  uint64_t valuePtr = 0;
  CFNumberRef number = 0;
  if ([(AVAsset *)self _figAsset])
  {
    uint64_t CMBaseObject = FigAssetGetCMBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v6 + 48);
    if (!v7) {
      goto LABEL_16;
    }
    uint64_t v8 = *MEMORY[0x1E4F1CF80];
    signed int PListFromOptionsDict = v7(CMBaseObject, *MEMORY[0x1E4F321F8], *MEMORY[0x1E4F1CF80], &v20);
    if (PListFromOptionsDict) {
      goto LABEL_28;
    }
    if (v20)
    {
      signed int PListFromOptionsDict = FigAssetCreatePListFromOptionsDict();
      if (PListFromOptionsDict) {
        goto LABEL_28;
      }
      uint64_t v10 = FigAssetGetCMBaseObject();
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v11) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      uint64_t v13 = *(uint64_t (**)(uint64_t, void, uint64_t, CFNumberRef *))(v12 + 48);
      if (v13)
      {
        signed int PListFromOptionsDict = v13(v10, *MEMORY[0x1E4F321F0], v8, &number);
        if (!PListFromOptionsDict)
        {
          if (number)
          {
            CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
            v22[0] = cf;
            v21[0] = @"figAssetCreationOptions";
            v21[1] = @"figAssetCreationFlags";
            v22[1] = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:valuePtr];
            v21[2] = @"figAssetCreationVersion";
            v22[2] = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:1];
            uint64_t v14 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
            signed int v15 = 0;
            goto LABEL_17;
          }
          goto LABEL_27;
        }
LABEL_28:
        signed int v15 = PListFromOptionsDict;
        goto LABEL_29;
      }
LABEL_16:
      uint64_t v14 = 0;
      signed int v15 = -12782;
      goto LABEL_17;
    }
  }
LABEL_27:
  signed int v15 = 0;
LABEL_29:
  uint64_t v14 = 0;
LABEL_17:
  if (cf) {
    CFRelease(cf);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (number) {
    CFRelease(number);
  }
  if (a3 && v15) {
    *a3 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v15, 0);
  }
  return v14;
}

@end