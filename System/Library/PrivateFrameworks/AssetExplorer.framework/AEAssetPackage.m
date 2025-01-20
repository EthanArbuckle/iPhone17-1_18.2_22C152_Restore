@interface AEAssetPackage
+ (BOOL)supportsSecureCoding;
+ (id)unsuppressedURLsFromURLs:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sidecarTimeForKey:(SEL)a3;
- (AEAssetPackage)init;
- (AEAssetPackage)initWithAssetIdentifier:(id)a3 durableURLs:(id)a4 sidecar:(id)a5;
- (AEAssetPackage)initWithAssetIdentifier:(id)a3 durableURLs:(id)a4 suppressedTypes:(id)a5 sidecar:(id)a6;
- (AEAssetPackage)initWithCoder:(id)a3;
- (AVAsset)providedAVAsset;
- (AVAudioMix)providedAudioMix;
- (BOOL)canPlayLoopingVideo;
- (BOOL)canPlayPhotoIris;
- (BOOL)containsGenerationRecipeData;
- (BOOL)containsGenerationSourceImage;
- (BOOL)containsLivePhotoContent;
- (BOOL)containsSuppressedLivePhoto;
- (BOOL)hasPhotoColorAdjustments;
- (BOOL)isAnimatedImage;
- (BOOL)isFavorite;
- (BOOL)isGuestAsset;
- (BOOL)isHidden;
- (BOOL)isPhotoIrisPlaceholder;
- (BOOL)isTemporaryPlaceholder;
- (BOOL)isURLSuppressedForType:(id)a3;
- (BOOL)representsBurst;
- (CLLocation)location;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSDictionary)providedImageMetadata;
- (NSMutableDictionary)_contentQueueSidecar;
- (NSMutableDictionary)_contentQueue_finalURLs;
- (NSMutableSet)_contentQueue_suppressedTypes;
- (NSString)burstIdentifier;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedGeoDescription;
- (NSString)uniformTypeIdentifier;
- (NSURL)providedFullsizeImageURL;
- (NSURL)providedFullsizeRenderImageURL;
- (NSURL)providedFullsizeRenderVideoURL;
- (NSURL)providedVideoURL;
- (OS_dispatch_queue)_packageContentQueue;
- (PFAssetAdjustments)assetAdjustments;
- (PHLivePhoto)providedLivePhoto;
- (UIImage)providedPreviewImage;
- (double)aspectRatio;
- (double)duration;
- (id)_sidecarObjectForKey:(id)a3;
- (id)browserItemPayload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentURLForType:(id)a3;
- (id)durableURLsSnapshot;
- (id)durableURLsSnapshotApplyingSuppression:(BOOL)a3;
- (id)generationRecipeData;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)reviewAssetFromPackageMetadata;
- (id)sidecarDataForKey:(id)a3;
- (id)sidecarDateForKey:(id)a3;
- (id)sidecarImageForKey:(id)a3;
- (id)sidecarNumberForKey:(id)a3;
- (id)sidecarPropertyListForKey:(id)a3;
- (id)sidecarSnapshot;
- (id)sourceImageURL;
- (id)suppressedTypesSnapshot;
- (int64_t)_sendSourceFromMediaOrigin:(int64_t)a3;
- (int64_t)mediaOrigin;
- (int64_t)numberOfRepresentedAssets;
- (int64_t)playbackStyle;
- (unint64_t)isContentEqualTo:(id)a3;
- (unint64_t)mediaSubtypes;
- (unint64_t)mediaType;
- (unint64_t)originalFilesize;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unsigned)playbackVariation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AEAssetPackage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contentQueue_suppressedTypes, 0);
  objc_storeStrong((id *)&self->__contentQueueSidecar, 0);
  objc_storeStrong((id *)&self->__contentQueue_finalURLs, 0);
  objc_storeStrong((id *)&self->__packageContentQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSMutableSet)_contentQueue_suppressedTypes
{
  return self->__contentQueue_suppressedTypes;
}

- (NSMutableDictionary)_contentQueueSidecar
{
  return self->__contentQueueSidecar;
}

- (NSMutableDictionary)_contentQueue_finalURLs
{
  return self->__contentQueue_finalURLs;
}

- (OS_dispatch_queue)_packageContentQueue
{
  return self->__packageContentQueue;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)sidecarImageForKey:(id)a3
{
  v3 = [(AEAssetPackage *)self _sidecarObjectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sidecarTimeForKey:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x263F01090];
  CFDictionaryRef v5 = [(AEAssetPackage *)self _sidecarObjectForKey:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CMTimeMakeFromDictionary(&v7, v5);
    *(CMTime *)retstr = v7;
  }

  return result;
}

- (id)sidecarDateForKey:(id)a3
{
  v3 = [(AEAssetPackage *)self _sidecarObjectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)sidecarDataForKey:(id)a3
{
  v3 = [(AEAssetPackage *)self _sidecarObjectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)sidecarNumberForKey:(id)a3
{
  v3 = [(AEAssetPackage *)self _sidecarObjectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)sidecarPropertyListForKey:(id)a3
{
  v3 = [(AEAssetPackage *)self _sidecarObjectForKey:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [MEMORY[0x263F08AC0] propertyList:v3 isValidForFormat:200])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_sidecarObjectForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    CFDictionaryRef v5 = [(AEAssetPackage *)self _packageContentQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__AEAssetPackage__sidecarObjectForKey___block_invoke;
    block[3] = &unk_26489B818;
    block[4] = self;
    v10 = &v11;
    id v9 = v4;
    dispatch_sync(v5, block);

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __39__AEAssetPackage__sidecarObjectForKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _contentQueueSidecar];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)currentURLForType:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  packageContentQueue = self->__packageContentQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__AEAssetPackage_currentURLForType___block_invoke;
  block[3] = &unk_26489B818;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(packageContentQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __36__AEAssetPackage_currentURLForType___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (id)suppressedTypesSnapshot
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(AEAssetPackage *)self _packageContentQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__AEAssetPackage_suppressedTypesSnapshot__block_invoke;
  v6[3] = &unk_26489B978;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __41__AEAssetPackage_suppressedTypesSnapshot__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)sidecarSnapshot
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(AEAssetPackage *)self _packageContentQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__AEAssetPackage_sidecarSnapshot__block_invoke;
  v6[3] = &unk_26489B978;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __33__AEAssetPackage_sidecarSnapshot__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _contentQueueSidecar];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)durableURLsSnapshotApplyingSuppression:(BOOL)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id v5 = [(AEAssetPackage *)self _packageContentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__AEAssetPackage_durableURLsSnapshotApplyingSuppression___block_invoke;
  block[3] = &unk_26489B5E0;
  BOOL v9 = a3;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __57__AEAssetPackage_durableURLsSnapshotApplyingSuppression___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_contentQueue_finalURLs");
  uint64_t v3 = (void *)[v2 mutableCopy];

  if (*(unsigned char *)(a1 + 48))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          BOOL v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = [@"com.apple.asset-explorer-package.suppressed." stringByAppendingString:v9];
          -[NSMutableDictionary ae_moveObjectFromKey:toKey:](v3, v9, v10);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
  uint64_t v11 = [v3 copy];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

- (id)durableURLsSnapshot
{
  return [(AEAssetPackage *)self durableURLsSnapshotApplyingSuppression:1];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  id v4 = [(AEAssetPackage *)self _packageContentQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__AEAssetPackage_mutableCopyWithZone___block_invoke;
  v7[3] = &unk_26489B978;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __38__AEAssetPackage_mutableCopyWithZone___block_invoke(uint64_t a1)
{
  uint64_t v2 = [AEMutableAssetPackage alloc];
  id v9 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_contentQueue_finalURLs");
  id v4 = objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
  id v5 = [*(id *)(a1 + 32) _contentQueueSidecar];
  uint64_t v6 = [(AEAssetPackage *)v2 initWithAssetIdentifier:v9 durableURLs:v3 suppressedTypes:v4 sidecar:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

+ (id)unsuppressedURLsFromURLs:(id)a3
{
  return _UnsuppressedURLs(a3, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  id v4 = [(AEAssetPackage *)self _packageContentQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__AEAssetPackage_copyWithZone___block_invoke;
  v7[3] = &unk_26489B978;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __31__AEAssetPackage_copyWithZone___block_invoke(uint64_t a1)
{
  uint64_t v2 = [AEAssetPackage alloc];
  id v9 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_contentQueue_finalURLs");
  id v4 = objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
  id v5 = [*(id *)(a1 + 32) _contentQueueSidecar];
  uint64_t v6 = [(AEAssetPackage *)v2 initWithAssetIdentifier:v9 durableURLs:v3 suppressedTypes:v4 sidecar:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Coder must allow keyed coding."];
  }
  id v5 = [(AEAssetPackage *)self identifier];
  [v4 encodeObject:v5 forKey:@"AEAssetPackage.assetIdentifier"];

  uint64_t v6 = [(AEAssetPackage *)self durableURLsSnapshotApplyingSuppression:0];
  [v4 encodeObject:v6 forKey:@"AEAssetPackage.durableURLs"];

  uint64_t v7 = [(AEAssetPackage *)self suppressedTypesSnapshot];
  [v4 encodeObject:v7 forKey:@"AEAssetPackage.suppressedTypes"];

  id v8 = [(AEAssetPackage *)self sidecarSnapshot];
  [v4 encodeObject:v8 forKey:@"AEAssetPackage.sidecar"];
}

- (AEAssetPackage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AEAssetPackage.assetIdentifier"];
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"AEAssetPackage.durableURLs"];

  uint64_t v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  long long v14 = [v4 decodeObjectOfClasses:v13 forKey:@"AEAssetPackage.suppressedTypes"];

  id v15 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v15 addObject:objc_opt_class()];
  [v15 addObject:objc_opt_class()];
  [v15 addObject:objc_opt_class()];
  [v15 addObject:objc_opt_class()];
  [v15 addObject:objc_opt_class()];
  [v15 addObject:objc_opt_class()];
  [v15 addObject:objc_opt_class()];
  [v15 addObject:objc_opt_class()];
  [v15 addObject:objc_opt_class()];
  [v15 addObject:objc_opt_class()];
  [v15 addObject:objc_opt_class()];
  long long v16 = [v4 decodeObjectOfClasses:v15 forKey:@"AEAssetPackage.sidecar"];

  long long v17 = [(AEAssetPackage *)self initWithAssetIdentifier:v5 durableURLs:v10 suppressedTypes:v14 sidecar:v16];
  return v17;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = NSString;
  id v5 = [(AEAssetPackage *)self identifier];
  uint64_t v6 = [v4 stringWithFormat:@"%@ = %@", @"identifier", v5];
  [v3 addObject:v6];

  uint64_t v7 = NSString;
  uint64_t v8 = [(AEAssetPackage *)self durableURLsSnapshotApplyingSuppression:0];
  id v9 = [v7 stringWithFormat:@"%@ = %@", @"durableURLs", v8];
  [v3 addObject:v9];

  uint64_t v10 = NSString;
  uint64_t v11 = [(AEAssetPackage *)self suppressedTypesSnapshot];
  uint64_t v12 = [v10 stringWithFormat:@"%@ = %@", @"suppressedTypes", v11];
  [v3 addObject:v12];

  id v13 = NSString;
  long long v14 = [(AEAssetPackage *)self sidecarSnapshot];
  id v15 = [v13 stringWithFormat:@"%@ = %@", @"sidecar", v14];
  [v3 addObject:v15];

  long long v16 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)AEAssetPackage;
  long long v17 = [(AEAssetPackage *)&v21 description];
  v18 = [v3 componentsJoinedByString:@", "];
  uint64_t v19 = [v16 stringWithFormat:@"<%@ %@>", v17, v18];

  return (NSString *)v19;
}

- (AEAssetPackage)init
{
  [(AEAssetPackage *)self doesNotRecognizeSelector:a2];
  return [(AEAssetPackage *)self initWithAssetIdentifier:@"bogus" durableURLs:0 sidecar:0];
}

- (AEAssetPackage)initWithAssetIdentifier:(id)a3 durableURLs:(id)a4 suppressedTypes:(id)a5 sidecar:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)AEAssetPackage;
  long long v14 = [(AEAssetPackage *)&v26 init];
  if (v14)
  {
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.asset-explorer.package-content-queue", MEMORY[0x263EF83A8]);
    packageContentQueue = v14->__packageContentQueue;
    v14->__packageContentQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v17;

    uint64_t v19 = v14->__packageContentQueue;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __78__AEAssetPackage_initWithAssetIdentifier_durableURLs_suppressedTypes_sidecar___block_invoke;
    v21[3] = &unk_26489BB40;
    v22 = v14;
    id v23 = v11;
    id v24 = v12;
    id v25 = v13;
    dispatch_barrier_sync(v19, v21);
  }
  return v14;
}

void __78__AEAssetPackage_initWithAssetIdentifier_durableURLs_suppressedTypes_sidecar___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[5];
  if (v2) {
    id v3 = (id)[v2 mutableCopy];
  }
  else {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v4 = v3;
  objc_storeStrong((id *)(a1[4] + 24), v3);

  id v5 = (void *)a1[6];
  if (v5) {
    id v6 = (id)[v5 mutableCopy];
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  uint64_t v7 = v6;
  objc_storeStrong((id *)(a1[4] + 40), v6);

  uint64_t v8 = (void *)a1[7];
  if (v8) {
    id v9 = (id)[v8 mutableCopy];
  }
  else {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v10 = v9;
  objc_storeStrong((id *)(a1[4] + 32), v9);
}

- (AEAssetPackage)initWithAssetIdentifier:(id)a3 durableURLs:(id)a4 sidecar:(id)a5
{
  id v14 = 0;
  id v8 = a5;
  id v9 = a3;
  id v10 = _UnsuppressedURLs(a4, &v14);
  id v11 = v14;
  id v12 = [(AEAssetPackage *)self initWithAssetIdentifier:v9 durableURLs:v10 suppressedTypes:v11 sidecar:v8];

  return v12;
}

- (BOOL)isURLSuppressedForType:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(AEAssetPackage *)self _packageContentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__AEAssetPackage_AEURLSuppression__isURLSuppressedForType___block_invoke;
  block[3] = &unk_26489B818;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_barrier_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __59__AEAssetPackage_AEURLSuppression__isURLSuppressedForType___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

- (AVAudioMix)providedAudioMix
{
  return 0;
}

- (AVAsset)providedAVAsset
{
  return 0;
}

- (PHLivePhoto)providedLivePhoto
{
  return 0;
}

- (NSURL)providedFullsizeRenderVideoURL
{
  id v3 = [(AEAssetPackage *)self currentURLForType:@"com.apple.assetexplorer.editedoriginalvideo"];
  if (v3)
  {
    id v4 = [(id)*MEMORY[0x263F1DBC8] identifier];
    id v5 = [(AEAssetPackage *)self currentURLForType:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (NSURL *)v5;
}

- (NSURL)providedVideoURL
{
  id v3 = [(AEAssetPackage *)self currentURLForType:@"com.apple.assetexplorer.editedoriginalvideo"];
  if (!v3)
  {
    id v4 = [(id)*MEMORY[0x263F1DBC8] identifier];
    id v3 = [(AEAssetPackage *)self currentURLForType:v4];
  }
  return (NSURL *)v3;
}

- (NSURL)providedFullsizeRenderImageURL
{
  id v3 = [(AEAssetPackage *)self currentURLForType:@"com.apple.assetexplorer.editedoriginalimage"];
  if (v3)
  {
    id v4 = [(id)*MEMORY[0x263F1DB18] identifier];
    id v5 = [(AEAssetPackage *)self currentURLForType:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (NSURL *)v5;
}

- (NSURL)providedFullsizeImageURL
{
  id v3 = [(AEAssetPackage *)self currentURLForType:@"com.apple.assetexplorer.editedoriginalimage"];
  if (!v3)
  {
    id v4 = [(id)*MEMORY[0x263F1DB18] identifier];
    id v3 = [(AEAssetPackage *)self currentURLForType:v4];
  }
  return (NSURL *)v3;
}

- (UIImage)providedPreviewImage
{
  return (UIImage *)[(AEAssetPackage *)self sidecarImageForKey:@"com.apple.assetexplorer.asset-preview-image"];
}

- (PFAssetAdjustments)assetAdjustments
{
  id v3 = [(AEAssetPackage *)self sidecarPropertyListForKey:@"com.apple.assetexplorer.editedadjustments"];
  if (v3
    || ([(AEAssetPackage *)self sidecarPropertyListForKey:@"com.apple.video.slomo"],
        (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F5DED8]) initWithPropertyListDictionary:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (PFAssetAdjustments *)v4;
}

- (NSDictionary)providedImageMetadata
{
  return (NSDictionary *)[(AEAssetPackage *)self sidecarPropertyListForKey:@"AEAssetPackageDisplayImageMetadata"];
}

- (BOOL)representsBurst
{
  return 0;
}

- (int64_t)numberOfRepresentedAssets
{
  return 0;
}

- (NSString)burstIdentifier
{
  return 0;
}

- (BOOL)isGuestAsset
{
  return 0;
}

- (BOOL)isAnimatedImage
{
  return [(AEAssetPackage *)self playbackStyle] == 2;
}

- (CLLocation)location
{
  return 0;
}

- (double)duration
{
  id v2 = [(AEAssetPackage *)self sidecarNumberForKey:@"AEAssetPackageDisplayDuration"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (NSDate)modificationDate
{
  return (NSDate *)[(AEAssetPackage *)self sidecarDateForKey:@"AEAssetPackageDisplayModificationDate"];
}

- (NSDate)creationDate
{
  return (NSDate *)[(AEAssetPackage *)self sidecarDateForKey:@"AEAssetPackageDisplayCreationDate"];
}

- (unint64_t)pixelHeight
{
  id v2 = [(AEAssetPackage *)self sidecarNumberForKey:@"AEAssetPackageDisplayPixelHeight"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unint64_t)pixelWidth
{
  id v2 = [(AEAssetPackage *)self sidecarNumberForKey:@"AEAssetPackageDisplayPixelWidth"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unsigned)playbackVariation
{
  id v2 = [(AEAssetPackage *)self sidecarNumberForKey:@"AEAssetPackageDisplayPlaybackVariation"];
  unsigned __int16 v3 = [v2 integerValue];

  return v3;
}

- (int64_t)playbackStyle
{
  id v2 = [(AEAssetPackage *)self sidecarNumberForKey:@"AEAssetPackageDisplayPlaybackStyle"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (unint64_t)mediaSubtypes
{
  int64_t v3 = [(AEAssetPackage *)self sidecarNumberForKey:@"AEAssetPackageDisplayMediaSubtypes"];
  unint64_t v4 = [v3 unsignedIntegerValue] & 0xFFFFFFFFFFFFFFF5;
  if ([(AEAssetPackage *)self canPlayPhotoIris]) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = 0;
  }
  BOOL v6 = [(AEAssetPackage *)self isHDR];
  uint64_t v7 = 2;
  if (!v6) {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v5 | v7 | v4;

  return v8;
}

- (unint64_t)mediaType
{
  id v2 = [(AEAssetPackage *)self sidecarNumberForKey:@"AEAssetPackageDisplayMediaType"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (BOOL)canPlayLoopingVideo
{
  return [(AEAssetPackage *)self playbackStyle] == 5;
}

- (BOOL)isPhotoIrisPlaceholder
{
  return 0;
}

- (BOOL)canPlayPhotoIris
{
  BOOL v3 = [(AEAssetPackage *)self containsLivePhotoContent];
  return v3 & ![(AEAssetPackage *)self containsSuppressedLivePhoto];
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)isTemporaryPlaceholder
{
  return 0;
}

- (unint64_t)isContentEqualTo:(id)a3
{
  return self == a3;
}

- (BOOL)hasPhotoColorAdjustments
{
  id v2 = [(AEAssetPackage *)self sidecarNumberForKey:@"AEAssetPackageDisplayHasPhotoColorAdjustments"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration
{
  return [(AEAssetPackage *)self sidecarTimeForKey:@"AEAssetPackageDisplayLivePhotoVideoDuration"];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime
{
  return [(AEAssetPackage *)self sidecarTimeForKey:@"AEAssetPackageDisplayLivePhotoStillDisplayTime"];
}

- (unint64_t)originalFilesize
{
  return 0;
}

- (NSString)uniformTypeIdentifier
{
  id v2 = (void *)MEMORY[0x263F5DF98];
  char v3 = [(AEAssetPackage *)self providedFullsizeImageURL];
  unint64_t v4 = [v3 pathExtension];
  uint64_t v5 = [v2 typeWithFilenameExtension:v4];
  BOOL v6 = [v5 identifier];

  return (NSString *)v6;
}

- (NSString)localizedGeoDescription
{
  return 0;
}

- (double)aspectRatio
{
  if (![(AEAssetPackage *)self pixelHeight]) {
    return 1.0;
  }
  double v3 = (double)[(AEAssetPackage *)self pixelWidth];
  return v3 / (double)[(AEAssetPackage *)self pixelHeight];
}

- (BOOL)isFavorite
{
  return 0;
}

- (id)reviewAssetFromPackageMetadata
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  if (v3 != v4
    || (objc_getAssociatedObject(v2, sel_reviewAssetFromPackageMetadata),
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F5E440]) initWithConformingAsset:v2];
    if (v3 == v4) {
      objc_setAssociatedObject(v2, sel_reviewAssetFromPackageMetadata, v5, (void *)1);
    }
  }
  objc_sync_exit(v2);

  return v5;
}

- (BOOL)containsSuppressedLivePhoto
{
  uint64_t v3 = (void *)*MEMORY[0x263F1DBC8];
  uint64_t v4 = [(id)*MEMORY[0x263F1DBC8] identifier];
  uint64_t v5 = [(AEAssetPackage *)self currentURLForType:v4];

  BOOL v6 = [v3 identifier];
  BOOL v7 = [(AEAssetPackage *)self isURLSuppressedForType:v6];

  if (!v5) {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)containsLivePhotoContent
{
  uint64_t v3 = [(id)*MEMORY[0x263F1DB18] identifier];
  uint64_t v4 = [(AEAssetPackage *)self currentURLForType:v3];

  uint64_t v5 = [(id)*MEMORY[0x263F1DBC8] identifier];
  BOOL v6 = [(AEAssetPackage *)self currentURLForType:v5];

  if (v4) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = !v7;

  return v8;
}

- (int64_t)mediaOrigin
{
  id v2 = [(AEAssetPackage *)self sidecarNumberForKey:@"AEAssetPackageMediaOrigin"];
  uint64_t v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 5;
  }

  return v4;
}

- (id)sourceImageURL
{
  uint64_t v3 = [(id)*MEMORY[0x263F1DB18] identifier];
  int64_t v4 = [(AEAssetPackage *)self currentURLForType:v3];

  return v4;
}

- (id)generationRecipeData
{
  return [(AEAssetPackage *)self sidecarDataForKey:@"com.apple.assetexplorer.generatedimagerecipe"];
}

- (BOOL)containsGenerationSourceImage
{
  id v2 = [(AEAssetPackage *)self sourceImageURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)containsGenerationRecipeData
{
  id v2 = [(AEAssetPackage *)self generationRecipeData];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)browserItemPayload
{
  v31[1] = *MEMORY[0x263EF8340];
  v22 = [(AEAssetPackage *)self identifier];
  id v3 = objc_alloc_init(MEMORY[0x263F31A30]);
  int64_t v4 = [(AEAssetPackage *)self durableURLsSnapshotApplyingSuppression:1];
  uint64_t v5 = [(id)*MEMORY[0x263F1DB18] identifier];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  BOOL v7 = [(id)*MEMORY[0x263F1DBC8] identifier];
  id v24 = [v4 objectForKeyedSubscript:v7];

  id v23 = (void *)v6;
  if (v6)
  {
    [v3 setFileURL:v6];
    [v3 setVideoComplementFileURL:v24];
  }
  else
  {
    [v3 setFileURL:v24];
  }
  BOOL v8 = [v4 objectForKeyedSubscript:@"com.apple.assetexplorer.alasset.url"];
  id v9 = [(AEAssetPackage *)self sidecarPropertyListForKey:@"com.apple.video.slomo"];
  id v25 = [(AEAssetPackage *)self sidecarNumberForKey:*MEMORY[0x263F83DA0]];
  id v10 = [(AEAssetPackage *)self sidecarNumberForKey:*MEMORY[0x263F83D98]];
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (v8)
  {
    id v12 = v10;
    uint64_t v30 = *MEMORY[0x263F319D8];
    uint64_t v13 = [v8 absoluteString];
    v31[0] = v13;
    char v14 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    [v11 addEntriesFromDictionary:v14];

LABEL_8:
    id v10 = v12;
    goto LABEL_9;
  }
  if (v9)
  {
    id v12 = v10;
    uint64_t v28 = *MEMORY[0x263F319E8];
    v29 = v9;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    [v11 addEntriesFromDictionary:v13];
    goto LABEL_8;
  }
LABEL_9:
  if (v25 && v10)
  {
    uint64_t v15 = *MEMORY[0x263F319E0];
    v26[0] = *MEMORY[0x263F319F0];
    v26[1] = v15;
    v27[0] = v25;
    v27[1] = v10;
    long long v16 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    [v11 addEntriesFromDictionary:v16];
  }
  uint64_t v17 = [(AEAssetPackage *)self sidecarSnapshot];
  [v11 setObject:v4 forKey:@"AEAssetPackageDurableURLs"];
  [v11 setObject:v17 forKey:@"AEAssetPackageSidecar"];
  [v11 setObject:v22 forKey:@"AEAssetPackageAssetIdentifier"];
  int64_t v18 = [(AEAssetPackage *)self _sendSourceFromMediaOrigin:[(AEAssetPackage *)self mediaOrigin]];
  uint64_t v19 = [NSNumber numberWithInteger:v18];
  [v11 setObject:v19 forKey:kAEChatKitPayloadSendSource];

  v20 = (void *)[v11 copy];
  [v3 setUserInfo:v20];

  return v3;
}

- (int64_t)_sendSourceFromMediaOrigin:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 6;
  }
  else {
    return qword_22B5481A8[a3];
  }
}

@end