@interface CFXClip
+ (BOOL)cfx_writeProxyImageToURL:(id)a3 fromImageAtURL:(id)a4 maximumImageDimension:(unint64_t)a5 outColorSpace:(id *)a6;
+ (id)createCaptureClip;
+ (id)defaultClip;
+ (void)cfx_createStillClipPreviewWithLocalURL:(id)a3 maximumImageDimension:(unint64_t)a4 effectStack:(id)a5 completionHandler:(id)a6;
+ (void)cfx_createVideoClipWithLocalURL:(id)a3 effectStack:(id)a4 completionHandler:(id)a5;
+ (void)createClipWithLocalURL:(id)a3 effectStack:(id)a4 isVideo:(BOOL)a5 maximumImageDimension:(unint64_t)a6 completionHandler:(id)a7;
- (BOOL)cfx_isAssetInTrash;
- (BOOL)cfx_isAssetMissing;
- (BOOL)cfx_removeAllEffectsOfType:(int)a3;
- (BOOL)hasMetadataAsset;
- (BOOL)hasPlayableEffectOfType:(int)a3;
- (BOOL)isAssetLoaded;
- (BOOL)isAssetUnavailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStill;
- (BOOL)isVideo;
- (BOOL)shouldRenderVideoAsBlack;
- (CFXClip)init;
- (CFXClip)initWithMediaItem:(id)a3;
- (CGRect)playableRectInOutputSize:(CGSize)a3;
- (CGRect)rectFromNormalizedPlayableRect:(CGRect)a3 inOutputSize:(CGSize)a4;
- (CGSize)mediaSize;
- (CGSize)playableMediaSizeWithTransform;
- (JFXMediaItem)mediaItem;
- (JFXMediaReaderCreationAVAssetTrackAttributes)arMetadataReaderAssetTrackAttributes;
- (JFXMediaReaderCreationAVAssetTrackAttributes)depthDataReaderAssetTrackAttributes;
- (NSData)originalAnimojiDataRepresentation;
- (NSMutableArray)animojis;
- (NSMutableArray)filters;
- (NSMutableArray)overlays;
- (NSString)description;
- (NSString)uuid;
- (NSURL)metadataURL;
- (PVTransformAnimation)transformAnimation;
- (double)playableScaleInOutputSize:(CGSize)a3;
- (id)cfx_clipType;
- (id)cfx_effectsOfType:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)effectStack;
- (id)effectStackExcludingType:(int)a3;
- (id)effectsOfType:(int)a3;
- (id)stringForMediaType:(int64_t)a3;
- (int)duration;
- (int)mediaStartOffset;
- (int)playableMediaContentMode;
- (int)presentationTime;
- (int)transformInitialStartOffset;
- (int64_t)mediaInterfaceOrientationForDisplay;
- (int64_t)mediaType;
- (int64_t)playableAspectRatio;
- (int64_t)playableAspectRatioPreservationMode;
- (unint64_t)hash;
- (unint64_t)originalAnimojiVersionNumber;
- (void)addEffectStack:(id)a3;
- (void)cfx_addEffect:(id)a3;
- (void)dealloc;
- (void)removeAllEffects;
- (void)removeEffect:(id)a3;
- (void)setAnimojis:(id)a3;
- (void)setDuration:(int)a3;
- (void)setFilters:(id)a3;
- (void)setMediaInterfaceOrientationForDisplay:(int64_t)a3;
- (void)setMediaItem:(id)a3;
- (void)setMetadataURL:(id)a3;
- (void)setOriginalAnimojiDataRepresentation:(id)a3;
- (void)setOriginalAnimojiVersionNumber:(unint64_t)a3;
- (void)setOverlays:(id)a3;
- (void)setPresentationTime:(int)a3;
- (void)setTransformAnimation:(id)a3;
- (void)setTransformInitialStartOffset:(int)a3;
- (void)setUuid:(id)a3;
- (void)updateTransformPresentationTimeRange;
@end

@implementation CFXClip

- (CFXClip)init
{
  v11.receiver = self;
  v11.super_class = (Class)CFXClip;
  v2 = [(CFXClip *)&v11 init];
  v3 = v2;
  if (v2)
  {
    uuid = v2->_uuid;
    v2->_uuid = 0;

    *(void *)&v3->_presentationTime = 0;
    v3->_mediaStartOffset = 0;
    mediaItem = v3->_mediaItem;
    v3->_mediaItem = 0;

    filters = v3->_filters;
    v3->_filters = 0;

    overlays = v3->_overlays;
    v3->_overlays = 0;

    animojis = v3->_animojis;
    v3->_animojis = 0;

    transformAnimation = v3->_transformAnimation;
    v3->_transformAnimation = 0;

    v3->_transformInitialStartOffset = 0;
  }
  return v3;
}

- (CFXClip)initWithMediaItem:(id)a3
{
  id v5 = a3;
  v6 = [(CFXClip *)self init];
  if (v6)
  {
    v7 = [MEMORY[0x263F08C38] UUID];
    uint64_t v8 = [v7 UUIDString];
    uuid = v6->_uuid;
    v6->_uuid = (NSString *)v8;

    objc_storeStrong((id *)&v6->_mediaItem, a3);
  }

  return v6;
}

- (id)stringForMediaType:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"What MediaType ? please update stringForMediaType if you added new type";
  }
  else {
    return off_264C0AD28[a3];
  }
}

- (id)cfx_clipType
{
  int64_t v3 = [(CFXClip *)self mediaType];
  return [(CFXClip *)self stringForMediaType:v3];
}

- (NSString)description
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v54.receiver = self;
  v54.super_class = (Class)CFXClip;
  int64_t v3 = [(CFXClip *)&v54 description];
  v4 = NSString;
  uuid = self->_uuid;
  uint64_t presentationTime = self->_presentationTime;
  uint64_t duration = self->_duration;
  uint64_t v8 = [(CFXClip *)self cfx_clipType];
  uint64_t mediaStartOffset = self->_mediaStartOffset;
  v10 = [(CFXClip *)self metadataURL];
  objc_super v11 = [v4 stringWithFormat:@"\r\tuuid: %@\r\tpresentationTime: %d\r\tduration: %d\r\tMediaType: %@\r\tmediaStartOffset: %d\r\tmetadata url: %@\r\tMedia: %@", uuid, presentationTime, duration, v8, mediaStartOffset, v10, self->_mediaItem];
  v12 = [v3 stringByAppendingString:v11];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v41 = self;
  v13 = [(CFXClip *)self filters];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v51;
    do
    {
      uint64_t v17 = 0;
      v18 = v12;
      do
      {
        if (*(void *)v51 != v16) {
          objc_enumerationMutation(v13);
        }
        v19 = NSString;
        v20 = [*(id *)(*((void *)&v50 + 1) + 8 * v17) description];
        v21 = [v19 stringWithFormat:@"\r\t%@", v20];
        v12 = [v18 stringByAppendingString:v21];

        ++v17;
        v18 = v12;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v15);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v22 = [(CFXClip *)v41 overlays];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v47;
    do
    {
      uint64_t v26 = 0;
      v27 = v12;
      do
      {
        if (*(void *)v47 != v25) {
          objc_enumerationMutation(v22);
        }
        v28 = NSString;
        v29 = [*(id *)(*((void *)&v46 + 1) + 8 * v26) description];
        v30 = [v28 stringWithFormat:@"\r\t%@", v29];
        v12 = [v27 stringByAppendingString:v30];

        ++v26;
        v27 = v12;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v24);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v31 = [(CFXClip *)v41 animojis];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v43;
    do
    {
      uint64_t v35 = 0;
      v36 = v12;
      do
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(v31);
        }
        v37 = NSString;
        v38 = [*(id *)(*((void *)&v42 + 1) + 8 * v35) description];
        v39 = [v37 stringWithFormat:@"\r\t%@", v38];
        v12 = [v36 stringByAppendingString:v39];

        ++v35;
        v36 = v12;
      }
      while (v33 != v35);
      uint64_t v33 = [v31 countByEnumeratingWithState:&v42 objects:v55 count:16];
    }
    while (v33);
  }

  return (NSString *)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [MEMORY[0x263F08C38] UUID];
  uint64_t v7 = [v6 UUIDString];
  uint64_t v8 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v7;

  *(_DWORD *)(v5 + 8) = self->_presentationTime;
  *(_DWORD *)(v5 + 12) = self->_duration;
  *(_DWORD *)(v5 + 16) = self->_mediaStartOffset;
  id v9 = [(JFXMediaItem *)self->_mediaItem copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  objc_storeStrong((id *)(v5 + 40), self->_metadataURL);
  uint64_t v11 = [(NSMutableArray *)self->_filters mutableDeepCopy];
  v12 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v11;

  uint64_t v13 = [(NSMutableArray *)self->_overlays mutableDeepCopy];
  uint64_t v14 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v13;

  uint64_t v15 = [(NSMutableArray *)self->_animojis mutableDeepCopy];
  uint64_t v16 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v15;

  uint64_t v17 = [(NSData *)self->_originalAnimojiDataRepresentation copy];
  v18 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v17;

  *(void *)(v5 + 56) = self->_originalAnimojiVersionNumber;
  if (self->_transformAnimation)
  {
    id v19 = objc_alloc(MEMORY[0x263F61300]);
    v20 = [(PVTransformAnimation *)self->_transformAnimation animationData];
    v21 = (void *)[v20 copy];
    uint64_t v22 = [v19 initWithAnimation:v21];
    uint64_t v23 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v22;

    *(_DWORD *)(v5 + 20) = self->_transformInitialStartOffset;
    [(PVTransformAnimation *)self->_transformAnimation aspectRatio];
    objc_msgSend(*(id *)(v5 + 64), "setAspectRatio:");
  }
  else
  {
    uint64_t v24 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = 0;

    *(_DWORD *)(v5 + 20) = 0;
  }
  uint64_t v25 = JFXLog_DebugClip();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = [(CFXClip *)self uuid];
    v27 = [(id)v5 uuid];
    int v29 = 138412546;
    v30 = v26;
    __int16 v31 = 2112;
    uint64_t v32 = v27;
    _os_log_impl(&dword_234C41000, v25, OS_LOG_TYPE_DEFAULT, "[CFXClip copyWithZone:] %@ -> %@", (uint8_t *)&v29, 0x16u);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CFXClip *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v6 = [(CFXClip *)self uuid];
      uint64_t v7 = [(CFXClip *)v5 uuid];

      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_uuid hash];
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int64_t v3 = JFXLog_DebugClip();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(CFXClip *)self uuid];
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_234C41000, v3, OS_LOG_TYPE_DEFAULT, "[CFXClip dealloc] %@", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)CFXClip;
  [(CFXClip *)&v5 dealloc];
}

+ (id)defaultClip
{
  v2 = objc_alloc_init(CFXClip);
  int64_t v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [v3 UUIDString];
  [(CFXClip *)v2 setUuid:v4];

  return v2;
}

+ (void)cfx_createVideoClipWithLocalURL:(id)a3 effectStack:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = +[CFXClip defaultClip];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__CFXClip_cfx_createVideoClipWithLocalURL_effectStack_completionHandler___block_invoke;
  v14[3] = &unk_264C0AC68;
  id v15 = v10;
  id v16 = v7;
  id v17 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  +[JFXVideoMediaItem videoMediaItemWithLocalURL:v9 delegate:0 completionHandler:v14];
}

void __73__CFXClip_cfx_createVideoClipWithLocalURL_effectStack_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_super v5 = *(void **)(a1 + 32);
  id v7 = a3;
  [v5 setMediaItem:a2];
  v6 = [*(id *)(a1 + 32) mediaItem];
  objc_msgSend(*(id *)(a1 + 32), "setDuration:", objc_msgSend(v6, "durationAt30fps"));

  [*(id *)(a1 + 32) addEffectStack:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)cfx_createStillClipPreviewWithLocalURL:(id)a3 maximumImageDimension:(unint64_t)a4 effectStack:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v10;
  uint64_t v14 = v13;
  if (a4)
  {
    id v15 = [v13 URLByDeletingLastPathComponent];
    id v16 = [v15 URLByAppendingPathComponent:@"proxyImage.jpg"];

    id v27 = 0;
    objc_msgSend(a1, "cfx_writeProxyImageToURL:fromImageAtURL:maximumImageDimension:outColorSpace:", v16, v14, a4, &v27);
    a4 = (unint64_t)v27;
  }
  else
  {
    id v16 = v13;
  }
  id v17 = +[CFXClip defaultClip];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __102__CFXClip_cfx_createStillClipPreviewWithLocalURL_maximumImageDimension_effectStack_completionHandler___block_invoke;
  v22[3] = &unk_264C0AC90;
  id v23 = (id)a4;
  id v24 = v17;
  id v25 = v11;
  id v26 = v12;
  id v18 = v12;
  id v19 = v11;
  id v20 = v17;
  id v21 = (id)a4;
  +[JFXStillMediaItem stillMediaItemWithLocalURL:v16 delegate:0 completionHandler:v22];
}

void __102__CFXClip_cfx_createStillClipPreviewWithLocalURL_maximumImageDimension_effectStack_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = a3;
  id v6 = a2;
  [v6 setImageColorSpace:v5];
  [*(id *)(a1 + 40) setMediaItem:v6];

  [*(id *)(a1 + 40) setDuration:1];
  [*(id *)(a1 + 40) addEffectStack:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (BOOL)cfx_writeProxyImageToURL:(id)a3 fromImageAtURL:(id)a4 maximumImageDimension:(unint64_t)a5 outColorSpace:(id *)a6
{
  v25[2] = *MEMORY[0x263EF8340];
  CFURLRef v9 = (const __CFURL *)a3;
  id v10 = CGImageSourceCreateWithURL((CFURLRef)a4, 0);
  if (!v10) {
    goto LABEL_10;
  }
  id v11 = v10;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v10, 0, 0);
  if (!ImageAtIndex)
  {
    CFRelease(v11);
LABEL_10:
    BOOL v22 = 0;
    goto LABEL_11;
  }
  id v13 = ImageAtIndex;
  CGColorSpaceRef ColorSpace = CGImageGetColorSpace(ImageAtIndex);
  if (ColorSpace)
  {
    objc_msgSend(MEMORY[0x263F61230], "jfx_getColorSpaceFromCGColorSpace:", ColorSpace);
    id v15 = objc_claimAutoreleasedReturnValue();
    *a6 = v15;
  }
  id v16 = CGImageSourceCopyMetadataAtIndex(v11, 0, 0);
  CGImageDestinationRef v17 = CGImageDestinationCreateWithURL(v9, (CFStringRef)*MEMORY[0x263EF9880], 1uLL, 0);
  if (!v17)
  {
    BOOL v22 = 0;
    if (!v16) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v18 = v17;
  uint64_t v19 = *MEMORY[0x263F0EFE0];
  v24[0] = *MEMORY[0x263F0EFE8];
  v24[1] = v19;
  v25[0] = &unk_26E801E80;
  id v20 = [NSNumber numberWithUnsignedInteger:a5];
  v25[1] = v20;
  CFDictionaryRef v21 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  CGImageDestinationAddImageAndMetadata(v18, v13, v16, v21);
  BOOL v22 = CGImageDestinationFinalize(v18);
  CFRelease(v18);

  if (v16) {
LABEL_7:
  }
    CFRelease(v16);
LABEL_8:
  CGImageRelease(v13);
  CFRelease(v11);
LABEL_11:

  return v22;
}

+ (void)createClipWithLocalURL:(id)a3 effectStack:(id)a4 isVideo:(BOOL)a5 maximumImageDimension:(unint64_t)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  id v11 = a7;
  id v12 = v11;
  if (v8)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __94__CFXClip_createClipWithLocalURL_effectStack_isVideo_maximumImageDimension_completionHandler___block_invoke;
    v16[3] = &unk_264C0ACB8;
    id v13 = &v17;
    id v17 = v11;
    +[CFXClip cfx_createVideoClipWithLocalURL:a3 effectStack:a4 completionHandler:v16];
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __94__CFXClip_createClipWithLocalURL_effectStack_isVideo_maximumImageDimension_completionHandler___block_invoke_2;
    v14[3] = &unk_264C0ACB8;
    id v13 = &v15;
    id v15 = v11;
    +[CFXClip cfx_createStillClipPreviewWithLocalURL:a3 maximumImageDimension:a6 effectStack:a4 completionHandler:v14];
  }
}

uint64_t __94__CFXClip_createClipWithLocalURL_effectStack_isVideo_maximumImageDimension_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__CFXClip_createClipWithLocalURL_effectStack_isVideo_maximumImageDimension_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)createCaptureClip
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = [CFXClip alloc];
  int64_t v3 = objc_alloc_init(JTCaptureMediaItem);
  v4 = [(CFXClip *)v2 initWithMediaItem:v3];

  uint64_t v5 = JFXLog_DebugClip();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CFXClip *)v4 uuid];
    int v8 = 138412290;
    CFURLRef v9 = v6;
    _os_log_impl(&dword_234C41000, v5, OS_LOG_TYPE_DEFAULT, "[CFXClip createCaptureClip] %@", (uint8_t *)&v8, 0xCu);
  }
  return v4;
}

- (BOOL)isAssetUnavailable
{
  if ([(CFXClip *)self cfx_isAssetMissing]) {
    return 1;
  }
  return [(CFXClip *)self cfx_isAssetInTrash];
}

- (BOOL)cfx_isAssetMissing
{
  v2 = [(CFXClip *)self mediaItem];
  BOOL v3 = [v2 mediaState] == 2;

  return v3;
}

- (BOOL)cfx_isAssetInTrash
{
  v2 = [(CFXClip *)self mediaItem];
  BOOL v3 = [v2 mediaState] == 3;

  return v3;
}

- (void)updateTransformPresentationTimeRange
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (self->_transformAnimation)
  {
    BOOL v3 = +[CFXMediaSettings sharedInstance];
    int v4 = [v3 timeScale];

    int32_t v5 = v4 ? v4 : 30;
    int presentationTime = self->_presentationTime;
    memset(&v22, 0, sizeof(v22));
    CMTimeMake(&start, [(CFXClip *)self transformInitialStartOffset]+ presentationTime- [(CFXClip *)self mediaStartOffset], v5);
    CMTimeMake(&duration, self->_duration, v5);
    CMTimeRangeMake(&v22, &start, &duration);
    transformAnimation = self->_transformAnimation;
    if (transformAnimation) {
      [(PVTransformAnimation *)transformAnimation presentationTimeRange];
    }
    else {
      memset(&range2, 0, sizeof(range2));
    }
    CMTimeRange range1 = v22;
    if (!CMTimeRangeEqual(&range1, &range2))
    {
      CMTimeRange v17 = v22;
      [(PVTransformAnimation *)self->_transformAnimation setPresentationTimeRange:&v17];
      int v8 = [(CFXClip *)self effectsOfType:2];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * i) setTransformAnimation:self->_transformAnimation];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v23 count:16];
        }
        while (v10);
      }
    }
  }
}

- (void)setDuration:(int)a3
{
  if (self->_duration != a3)
  {
    self->_CMTime duration = a3;
    [(CFXClip *)self updateTransformPresentationTimeRange];
  }
}

- (void)setPresentationTime:(int)a3
{
  if (self->_presentationTime != a3)
  {
    self->_int presentationTime = a3;
    [(CFXClip *)self updateTransformPresentationTimeRange];
  }
}

- (BOOL)isAssetLoaded
{
  v2 = [(CFXClip *)self mediaItem];
  BOOL v3 = [v2 mediaLoadState] == 1;

  return v3;
}

- (BOOL)isStill
{
  return [(CFXClip *)self mediaType] == 2;
}

- (BOOL)isVideo
{
  return [(CFXClip *)self mediaType] == 1;
}

- (NSMutableArray)filters
{
  filters = self->_filters;
  if (!filters)
  {
    int v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    int32_t v5 = self->_filters;
    self->_filters = v4;

    filters = self->_filters;
  }
  return filters;
}

- (NSMutableArray)overlays
{
  overlays = self->_overlays;
  if (!overlays)
  {
    int v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    int32_t v5 = self->_overlays;
    self->_overlays = v4;

    overlays = self->_overlays;
  }
  return overlays;
}

- (NSMutableArray)animojis
{
  animojis = self->_animojis;
  if (!animojis)
  {
    int v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    int32_t v5 = self->_animojis;
    self->_animojis = v4;

    animojis = self->_animojis;
  }
  return animojis;
}

- (int64_t)mediaType
{
  v2 = [(CFXClip *)self mediaItem];
  int64_t v3 = [v2 mediaType];

  return v3;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
  id v5 = a3;
  int v6 = [v5 durationAt30fps];

  self->_CMTime duration = v6;
}

- (CGSize)mediaSize
{
  if ([(CFXClip *)self mediaType] == 2)
  {
    int64_t v3 = [(CFXClip *)self mediaItem];
    [v3 sizeForQuality:0];
  }
  else
  {
    if ([(CFXClip *)self mediaType] != 1)
    {
      double v6 = *MEMORY[0x263F001B0];
      double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
      goto LABEL_7;
    }
    int64_t v3 = [(CFXClip *)self mediaItem];
    [v3 naturalSizeWithTransform];
  }
  double v6 = v4;
  double v7 = v5;

LABEL_7:
  double v8 = v6;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (int64_t)mediaInterfaceOrientationForDisplay
{
  v2 = [(CFXClip *)self mediaItem];
  int64_t v3 = [v2 interfaceOrientationForDisplay];

  return v3;
}

- (void)setMediaInterfaceOrientationForDisplay:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v5 = [(CFXClip *)self mediaItem];
  [v5 setInterfaceOrientationForDisplay:a3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v6 = [(CFXClip *)self animojis];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setCaptureInterfaceOrientation:a3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)setTransformAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_transformAnimation, a3);
  id v5 = a3;
  [(PVTransformAnimation *)self->_transformAnimation setAspectRatio:multiplierForAspectRatio([(CFXClip *)self playableAspectRatio])];

  [(CFXClip *)self updateTransformPresentationTimeRange];
}

- (id)cfx_effectsOfType:(int)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v4 = 72;
      goto LABEL_7;
    case 7:
      uint64_t v4 = 88;
LABEL_7:
      id v5 = *(id *)((char *)&self->super.isa + v4);
      return v5;
    case 2:
      uint64_t v4 = 80;
      goto LABEL_7;
  }
  id v5 = 0;
  return v5;
}

- (void)cfx_addEffect:(id)a3
{
  id v15 = a3;
  int v4 = [v15 type];
  if (v4 == 7)
  {
    uint64_t v8 = [(CFXClip *)self animojis];
    char v9 = [v8 containsObject:v15];

    if (v9) {
      goto LABEL_17;
    }
    if ([(CFXClip *)self mediaInterfaceOrientationForDisplay]) {
      int64_t v10 = [(CFXClip *)self mediaInterfaceOrientationForDisplay];
    }
    else {
      int64_t v10 = +[JFXOrientationMonitor deviceInterfaceOrientation];
    }
    [v15 setCaptureInterfaceOrientation:v10];
    uint64_t v14 = [(CFXClip *)self animojis];
    id v13 = v15;
    id v5 = (void *)v14;
  }
  else
  {
    if (v4 == 2)
    {
      long long v11 = [(CFXClip *)self overlays];
      char v12 = [v11 containsObject:v15];

      if (v12) {
        goto LABEL_17;
      }
      uint64_t v7 = [(CFXClip *)self overlays];
    }
    else
    {
      if (v4 != 1) {
        goto LABEL_17;
      }
      id v5 = [(CFXClip *)self filters];
      if ([v5 containsObject:v15]) {
        goto LABEL_16;
      }
      int64_t v6 = [(CFXClip *)self mediaType];

      if (v6 == 3) {
        goto LABEL_17;
      }
      uint64_t v7 = [(CFXClip *)self filters];
    }
    id v5 = (void *)v7;
    id v13 = v15;
  }
  [v5 addObject:v13];
LABEL_16:

LABEL_17:
}

- (void)addEffectStack:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __26__CFXClip_addEffectStack___block_invoke;
  v3[3] = &unk_264C0ACE0;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

void __26__CFXClip_addEffectStack___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)[a2 copy];
  objc_msgSend(v2, "cfx_addEffect:", v3);
}

- (void)removeEffect:(id)a3
{
  id v13 = a3;
  int v4 = [v13 type];
  switch(v4)
  {
    case 7:
      uint64_t v8 = [(CFXClip *)self animojis];
      int v9 = [v8 containsObject:v13];

      if (!v9) {
        break;
      }
      uint64_t v7 = [(CFXClip *)self animojis];
      goto LABEL_10;
    case 2:
      int64_t v10 = [(CFXClip *)self overlays];
      int v11 = [v10 containsObject:v13];

      if (!v11) {
        break;
      }
      uint64_t v7 = [(CFXClip *)self overlays];
      goto LABEL_10;
    case 1:
      id v5 = [(CFXClip *)self filters];
      int v6 = [v5 containsObject:v13];

      if (v6)
      {
        uint64_t v7 = [(CFXClip *)self filters];
LABEL_10:
        char v12 = v7;
        [v7 removeObject:v13];
      }
      break;
  }
}

- (void)removeAllEffects
{
  for (uint64_t i = 0; i != 9; ++i)
    [(CFXClip *)self cfx_removeAllEffectsOfType:i];
}

- (BOOL)cfx_removeAllEffectsOfType:(int)a3
{
  id v3 = [(CFXClip *)self cfx_effectsOfType:*(void *)&a3];
  uint64_t v4 = [v3 count];
  if (v4) {
    [v3 removeAllObjects];
  }

  return v4 != 0;
}

- (id)effectsOfType:(int)a3
{
  id v3 = [(CFXClip *)self cfx_effectsOfType:*(void *)&a3];
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (id)effectStack
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [(CFXClip *)self effectsOfType:1];
  [v3 addObjectsFromArray:v4];

  id v5 = [(CFXClip *)self effectsOfType:7];
  [v3 addObjectsFromArray:v5];

  int v6 = [(CFXClip *)self effectsOfType:2];
  [v3 addObjectsFromArray:v6];

  return v3;
}

- (id)effectStackExcludingType:(int)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a3 == 1
    || ([(CFXClip *)self effectsOfType:1],
        int v6 = objc_claimAutoreleasedReturnValue(),
        [v5 addObjectsFromArray:v6],
        v6,
        a3 != 2))
  {
    uint64_t v7 = [(CFXClip *)self effectsOfType:2];
    [v5 addObjectsFromArray:v7];
  }
  return v5;
}

- (BOOL)hasPlayableEffectOfType:(int)a3
{
  if (a3 == 7) {
    -[CFXClip cfx_effectsOfType:](self, "cfx_effectsOfType:");
  }
  else {
  id v3 = -[CFXClip playableEffectsOfType:](self, "playableEffectsOfType:");
  }
  uint64_t v4 = [v3 count];

  return v4 != 0;
}

- (int64_t)playableAspectRatio
{
  v2 = +[CFXMediaSettings sharedInstance];
  [v2 frameSize];
  unint64_t v5 = aspectRatioForSize(v3, v4);

  return v5;
}

- (int64_t)playableAspectRatioPreservationMode
{
  return 0;
}

- (CGRect)playableRectInOutputSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v6 = [(CFXClip *)self playableAspectRatio];
  uint64_t v7 = [(CFXClip *)self playableAspectRatioPreservationMode];
  double v8 = rectWithAspectRatioAndPreservationModeInRectWithSize(v6, v7, width, height);
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (double)playableScaleInOutputSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v6 = PVViewContentModeFromAspectRatioPreservationMode([(CFXClip *)self playableAspectRatioPreservationMode]);
  double v7 = multiplierForAspectRatio([(CFXClip *)self playableAspectRatio]);
  double v8 = 1.0;
  if (!v6) {
    goto LABEL_22;
  }
  if (v7 > -0.0000001)
  {
    double v8 = 1.0;
    if (v7 < 0.0000001) {
      goto LABEL_22;
    }
  }
  double v9 = height * v7;
  if (v6 > 2)
  {
    if (v6 == 3 || v6 == 13)
    {
      double v7 = width;
    }
    else if (v6 == 14)
    {
      double v7 = height * v7;
    }
    goto LABEL_21;
  }
  if (v6 == 1)
  {
    if (width <= height)
    {
      double v10 = height;
      if (v9 < width) {
        double v10 = width / v7;
      }
    }
    else
    {
      double v10 = width / v7;
      if (width / v7 < height) {
        double v10 = height;
      }
    }
    goto LABEL_20;
  }
  if (v6 == 2)
  {
    double v10 = width / v7;
    if (width / v7 > height) {
      double v10 = height;
    }
LABEL_20:
    double v7 = v7 * v10;
  }
LABEL_21:
  double v8 = v7 / v9;
LABEL_22:
  if (v8 >= 0.0000001 || v8 <= -0.0000001) {
    return v8;
  }
  else {
    return 1.0;
  }
}

- (CGRect)rectFromNormalizedPlayableRect:(CGRect)a3 inOutputSize:(CGSize)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[CFXClip playableRectInOutputSize:](self, "playableRectInOutputSize:", a4.width, a4.height);
  double v9 = x * v8;
  double v11 = y * v10;
  double v12 = width * v8;
  double v13 = height * v10;
  double v15 = v14 + v9;
  double v17 = v16 + v11;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v17;
  result.origin.double x = v15;
  return result;
}

- (CGSize)playableMediaSizeWithTransform
{
  int64_t v3 = [(CFXClip *)self mediaType];
  if (v3 == 2)
  {
    double v4 = [(CFXClip *)self mediaItem];
    [v4 sizeForQuality:0];
  }
  else if (v3 == 1)
  {
    double v4 = [(CFXClip *)self mediaItem];
    [v4 naturalSizeWithTransform];
  }
  else
  {
    double v4 = +[CFXMediaSettings sharedInstance];
    [v4 frameSize];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (int)playableMediaContentMode
{
  v2 = [(CFXClip *)self mediaItem];
  int v3 = [v2 playableMediaContentMode];

  return v3;
}

- (BOOL)shouldRenderVideoAsBlack
{
  return 0;
}

- (BOOL)hasMetadataAsset
{
  v2 = [(CFXClip *)self metadataURL];
  BOOL v6 = 0;
  if (v2)
  {
    int v3 = [MEMORY[0x263F08850] defaultManager];
    double v4 = [v2 path];
    char v5 = [v3 fileExistsAtPath:v4];

    if (v5) {
      BOOL v6 = 1;
    }
  }

  return v6;
}

- (JFXMediaReaderCreationAVAssetTrackAttributes)arMetadataReaderAssetTrackAttributes
{
  v11[1] = *MEMORY[0x263EF8340];
  if ([(CFXClip *)self hasMetadataAsset])
  {
    int v3 = [(CFXClip *)self metadataURL];
    double v4 = (void *)MEMORY[0x263EFA8D0];
    uint64_t v10 = *MEMORY[0x263EFA288];
    v11[0] = MEMORY[0x263EFFA88];
    char v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    BOOL v6 = [v4 URLAssetWithURL:v3 options:v5];

    double v7 = +[JFXVideoWriter META_ARMetadataTrackForAsset:v6];
    if (v7) {
      double v8 = [[JFXMediaReaderCreationAVAssetTrackAttributes alloc] initWithAssetTrack:v7];
    }
    else {
      double v8 = 0;
    }
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (JFXMediaReaderCreationAVAssetTrackAttributes)depthDataReaderAssetTrackAttributes
{
  v23[1] = *MEMORY[0x263EF8340];
  if ([(CFXClip *)self hasMetadataAsset])
  {
    int v3 = [(CFXClip *)self metadataURL];
    double v4 = (void *)MEMORY[0x263EFA8D0];
    uint64_t v22 = *MEMORY[0x263EFA288];
    v23[0] = MEMORY[0x263EFFA88];
    char v5 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    BOOL v6 = [v4 URLAssetWithURL:v3 options:v5];

    uint64_t v16 = 0;
    double v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__8;
    id v20 = __Block_byref_object_dispose__8;
    id v21 = 0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    uint64_t v8 = *MEMORY[0x263EF9D48];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __46__CFXClip_depthDataReaderAssetTrackAttributes__block_invoke;
    v13[3] = &unk_264C0AD08;
    double v15 = &v16;
    double v9 = v7;
    double v14 = v9;
    [v6 loadTracksWithMediaType:v8 completionHandler:v13];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    if ([(id)v17[5] count])
    {
      uint64_t v10 = [(id)v17[5] objectAtIndexedSubscript:0];
      double v11 = [[JFXMediaReaderCreationAVAssetTrackAttributes alloc] initWithAssetTrack:v10];
    }
    else
    {
      double v11 = 0;
    }

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    double v11 = 0;
  }
  return v11;
}

void __46__CFXClip_depthDataReaderAssetTrackAttributes__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (int)presentationTime
{
  return self->_presentationTime;
}

- (int)duration
{
  return self->_duration;
}

- (int)mediaStartOffset
{
  return self->_mediaStartOffset;
}

- (JFXMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (NSURL)metadataURL
{
  return self->_metadataURL;
}

- (void)setMetadataURL:(id)a3
{
}

- (NSData)originalAnimojiDataRepresentation
{
  return self->_originalAnimojiDataRepresentation;
}

- (void)setOriginalAnimojiDataRepresentation:(id)a3
{
}

- (unint64_t)originalAnimojiVersionNumber
{
  return self->_originalAnimojiVersionNumber;
}

- (void)setOriginalAnimojiVersionNumber:(unint64_t)a3
{
  self->_originalAnimojiVersionNumber = a3;
}

- (PVTransformAnimation)transformAnimation
{
  return self->_transformAnimation;
}

- (int)transformInitialStartOffset
{
  return self->_transformInitialStartOffset;
}

- (void)setTransformInitialStartOffset:(int)a3
{
  self->_transformInitialStartOffset = a3;
}

- (void)setFilters:(id)a3
{
}

- (void)setOverlays:(id)a3
{
}

- (void)setAnimojis:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animojis, 0);
  objc_storeStrong((id *)&self->_overlays, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_transformAnimation, 0);
  objc_storeStrong((id *)&self->_originalAnimojiDataRepresentation, 0);
  objc_storeStrong((id *)&self->_metadataURL, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end