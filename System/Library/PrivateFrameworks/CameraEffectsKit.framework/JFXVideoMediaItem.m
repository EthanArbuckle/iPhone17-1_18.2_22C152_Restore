@interface JFXVideoMediaItem
+ (void)videoMediaItemWithLocalURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (AVAsset)avAsset;
- (BOOL)canBeAddedToSequence;
- (BOOL)capturedByInAppCamera;
- (BOOL)hasAudibleCharacteristic;
- (BOOL)hasAudioTracks;
- (BOOL)hasVideoTracks;
- (BOOL)hasVisualCharacteristic;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighFrameRate;
- (BOOL)isUnsupportedAudio;
- (BOOL)needsDerivativeMedia;
- (BOOL)originalIsHEVC4k;
- (CGAffineTransform)transform;
- (CGAffineTransform)transform:(SEL)a3 fillDest:(CGSize)a4;
- (CGSize)naturalSize;
- (CGSize)naturalSizeWithTransform;
- (JTVideoMediaUtils)videoMediaItemUtils;
- (float)frameRate;
- (id)assetURL;
- (id)colorSpace;
- (id)copyWithZone:(_NSZone *)a3;
- (id)info;
- (int)durationAt30fps;
- (int)mediaStartOffset;
- (unint64_t)hash;
- (void)cacheAssetInformation;
- (void)commonInit;
- (void)dealloc;
- (void)loadAVAssetWithCompletionHandler:(id)a3;
- (void)mediaserverdCrashed;
- (void)reloadAVAsset;
- (void)setAssetIs4kHEVC:(BOOL)a3;
- (void)setAvAsset:(id)a3;
- (void)setCapturedByInAppCamera:(BOOL)a3;
- (void)setMediaStartOffset:(int)a3;
- (void)setOriginalIsHEVC4k:(BOOL)a3;
- (void)setVideoMediaItemUtils:(id)a3;
@end

@implementation JFXVideoMediaItem

- (void)loadAVAssetWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = [(JFXMediaItem *)self delegate];
  [v5 mediaItemWillLoad:self];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __54__JFXVideoMediaItem_loadAVAssetWithCompletionHandler___block_invoke;
  v23[3] = &unk_264C0D328;
  v23[4] = self;
  v6 = (void (**)(void, void))MEMORY[0x237DD15A0](v23);
  v7 = [(JTAssetMediaItem *)self asset];

  if (v7)
  {
    if (v4) {
      dispatch_semaphore_t v8 = 0;
    }
    else {
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    }
    v12 = [(JFXVideoMediaItem *)self videoMediaItemUtils];
    v13 = [(JTAssetMediaItem *)self asset];
    BOOL v14 = [(JFXVideoMediaItem *)self needsDerivativeMedia];
    [(JFXVideoMediaItem *)self frameRate];
    int v16 = v15;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __54__JFXVideoMediaItem_loadAVAssetWithCompletionHandler___block_invoke_2;
    v19[3] = &unk_264C0D350;
    v21 = v6;
    v22 = v4;
    v11 = v8;
    v20 = v11;
    LODWORD(v17) = v16;
    [v12 requestAVAssetAsyncWithAsset:v13 needsDerivativeMedia:v14 frameRate:v19 completion:v17];

    if (v11)
    {
      dispatch_time_t v18 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v11, v18);
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x263EFA470];
    v10 = [(JTLocalAssetMediaItem *)self localFileURL];
    v11 = [v9 assetWithURL:v10];

    ((void (**)(void, NSObject *))v6)[2](v6, v11);
    if (v4) {
      v4[2](v4);
    }
  }
}

void __54__JFXVideoMediaItem_loadAVAssetWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [*(id *)(a1 + 32) setAvAsset:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v6 URL];
    [*(id *)(a1 + 32) setAssetLocalURL:v3];
  }
  [*(id *)(a1 + 32) cacheAssetInformation];
  if (+[CFXVideoSettings canDecodeHEVC2160P])
  {
    v4 = [*(id *)(a1 + 32) videoMediaItemUtils];
    *(unsigned char *)(*(void *)(a1 + 32) + 114) = [v4 isOriginalHEVC4k];
  }
  [*(id *)(a1 + 32) setMediaLoadState:1];
  v5 = [*(id *)(a1 + 32) delegate];
  [v5 mediaItemDidLoad:*(void *)(a1 + 32) error:0];
}

NSObject *__54__JFXVideoMediaItem_loadAVAssetWithCompletionHandler___block_invoke_2(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  result = a1[4];
  if (result)
  {
    return dispatch_semaphore_signal(result);
  }
  return result;
}

+ (void)videoMediaItemWithLocalURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *, void))a5;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___JFXVideoMediaItem;
  id v10 = a3;
  id v11 = objc_msgSendSuper2(&v13, sel_alloc);
  v12 = objc_msgSend(v11, "initWithURL:", v10, v13.receiver, v13.super_class);

  if (v12)
  {
    [v12 setDelegate:v8];
    [v12 commonInit];
    [v12 setMediaState:0];
    [v12 setMediaLoadState:0];
    [v12 checkIfAssetIsMissing];
    [v12 loadAVAssetWithCompletionHandler:0];
    v9[2](v9, v12, 0);
  }
}

- (void)commonInit
{
  [(JFXMediaItem *)self setMediaType:1];
  [(JFXVideoMediaItem *)self setMediaStartOffset:0];
  v3 = objc_alloc_init(JTVideoMediaUtils);
  [(JFXVideoMediaItem *)self setVideoMediaItemUtils:v3];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_mediaserverdCrashed name:@"mediaserverdCrashed" object:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"mediaserverdCrashed" object:0];

  v4.receiver = self;
  v4.super_class = (Class)JFXVideoMediaItem;
  [(JTAssetMediaItem *)&v4 dealloc];
}

- (void)reloadAVAsset
{
  v3 = [(JFXVideoMediaItem *)self videoMediaItemUtils];
  [v3 invalidateCachedAssetInformation];

  [(JFXVideoMediaItem *)self loadAVAssetWithCompletionHandler:0];
}

- (void)mediaserverdCrashed
{
  [(JFXMediaItem *)self setMediaLoadState:0];
  [(JFXVideoMediaItem *)self setAvAsset:0];
  [(JFXVideoMediaItem *)self loadAVAssetWithCompletionHandler:0];
}

- (id)assetURL
{
  v3 = [(JTAssetMediaItem *)self assetIdentifier];

  if (v3) {
    [(JTAssetMediaItem *)self assetLocalURL];
  }
  else {
  objc_super v4 = [(JTLocalAssetMediaItem *)self localFileURL];
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)JFXVideoMediaItem;
  objc_super v4 = [(JTAssetMediaItem *)&v9 copyWithZone:a3];
  objc_storeStrong(v4 + 15, self->_avAsset);
  *((unsigned char *)v4 + 113) = self->_capturedByInAppCamera;
  v5 = objc_alloc_init(JTVideoMediaUtils);
  id v6 = v4[16];
  v4[16] = v5;

  *((unsigned char *)v4 + 114) = self->_originalIsHEVC4k;
  [v4 cacheAssetInformation];
  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:v4 selector:sel_mediaserverdCrashed name:@"mediaserverdCrashed" object:0];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)JFXVideoMediaItem;
  return [(JTAssetMediaItem *)&v4 isEqual:a3];
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)JFXVideoMediaItem;
  return [(JTAssetMediaItem *)&v3 hash];
}

- (void)cacheAssetInformation
{
  id v4 = [(JFXVideoMediaItem *)self videoMediaItemUtils];
  objc_super v3 = [(JFXVideoMediaItem *)self avAsset];
  [v4 cacheTrackInformationWithAVAsset:v3];
}

- (BOOL)canBeAddedToSequence
{
  return 1;
}

- (BOOL)hasVisualCharacteristic
{
  return 1;
}

- (BOOL)hasAudibleCharacteristic
{
  uint64_t v3 = [(JFXMediaItem *)self mediaState] == 2;
  id v4 = [(JFXVideoMediaItem *)self videoMediaItemUtils];
  LOBYTE(v3) = [v4 hasAudibleCharacteristicWithIsMissing:v3];

  return v3;
}

- (CGSize)naturalSize
{
  BOOL v3 = [(JFXMediaItem *)self mediaState] == 2;
  id v4 = [(JFXVideoMediaItem *)self videoMediaItemUtils];
  v5 = [(JTAssetMediaItem *)self asset];
  [v4 naturalSizeWithIsMissing:v3 asset:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGAffineTransform)transform
{
  id v4 = [(JFXVideoMediaItem *)self videoMediaItemUtils];
  if (v4)
  {
    double v6 = v4;
    [v4 transform];
    id v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (CGSize)naturalSizeWithTransform
{
  [(JFXVideoMediaItem *)self naturalSize];
  double v7 = v4;
  double v8 = v3;
  [(JFXVideoMediaItem *)self transform];
  float64x2_t v5 = vabsq_f64(vmlaq_n_f64(vmulq_n_f64(v10, v7), v9, v8));
  double v6 = v5.f64[1];
  result.width = v5.f64[0];
  result.height = v6;
  return result;
}

- (float)frameRate
{
  uint64_t v2 = [(JFXVideoMediaItem *)self videoMediaItemUtils];
  [v2 frameRate];
  float v4 = v3;

  return v4;
}

- (id)colorSpace
{
  uint64_t v2 = [(JFXVideoMediaItem *)self videoMediaItemUtils];
  float v3 = [v2 colorSpace];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x263F61230] rec709GammaColorSpace];
  }
  float64x2_t v5 = v4;

  return v5;
}

- (BOOL)hasVideoTracks
{
  uint64_t v2 = [(JFXVideoMediaItem *)self videoMediaItemUtils];
  char v3 = [v2 hasVideoTracks];

  return v3;
}

- (int)durationAt30fps
{
  char v3 = [(JFXVideoMediaItem *)self videoMediaItemUtils];
  id v4 = [(JTAssetMediaItem *)self asset];
  [v4 duration];
  int v5 = objc_msgSend(v3, "durationAt30fpsWithAssetDuration:");

  return v5;
}

- (BOOL)needsDerivativeMedia
{
  if (self->_originalIsHEVC4k) {
    return !+[CFXVideoSettings canDecodeHEVC2160P];
  }
  else {
    return 0;
  }
}

- (BOOL)isUnsupportedAudio
{
  uint64_t v2 = [(JFXVideoMediaItem *)self videoMediaItemUtils];
  char v3 = [v2 isUnsupportedAudio];

  return v3;
}

- (void)setAssetIs4kHEVC:(BOOL)a3
{
  if (self->_originalIsHEVC4k != a3) {
    self->_originalIsHEVC4k = a3;
  }
}

- (CGAffineTransform)transform:(SEL)a3 fillDest:(CGSize)a4
{
  uint64_t v5 = MEMORY[0x263F000D0];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  return self;
}

- (BOOL)hasAudioTracks
{
  uint64_t v2 = [(JFXVideoMediaItem *)self videoMediaItemUtils];
  char v3 = [v2 hasAudioTracks];

  return v3;
}

- (id)info
{
  char v3 = (void *)MEMORY[0x263EFF9A0];
  v10.receiver = self;
  v10.super_class = (Class)JFXVideoMediaItem;
  id v4 = [(JTAssetMediaItem *)&v10 info];
  uint64_t v5 = [v3 dictionaryWithDictionary:v4];

  long long v6 = [NSNumber numberWithBool:self->_capturedByInAppCamera];
  [v5 setObject:v6 forKey:kRecordedWithInAppCamera];

  double v7 = [NSNumber numberWithInt:self->_mediaStartOffset];
  [v5 setObject:v7 forKey:kMediaStartOffset];

  double v8 = [NSNumber numberWithBool:self->_originalIsHEVC4k];
  [v5 setObject:v8 forKey:kOriginalIsHEVC4kAsset];

  return v5;
}

- (AVAsset)avAsset
{
  return self->_avAsset;
}

- (void)setAvAsset:(id)a3
{
}

- (int)mediaStartOffset
{
  return self->_mediaStartOffset;
}

- (void)setMediaStartOffset:(int)a3
{
  self->_mediaStartOffset = a3;
}

- (BOOL)isHighFrameRate
{
  return self->_isHighFrameRate;
}

- (BOOL)capturedByInAppCamera
{
  return self->_capturedByInAppCamera;
}

- (void)setCapturedByInAppCamera:(BOOL)a3
{
  self->_capturedByInAppCamera = a3;
}

- (JTVideoMediaUtils)videoMediaItemUtils
{
  return self->_videoMediaItemUtils;
}

- (void)setVideoMediaItemUtils:(id)a3
{
}

- (BOOL)originalIsHEVC4k
{
  return self->_originalIsHEVC4k;
}

- (void)setOriginalIsHEVC4k:(BOOL)a3
{
  self->_originalIsHEVC4k = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoMediaItemUtils, 0);
  objc_storeStrong((id *)&self->_avAsset, 0);
}

@end