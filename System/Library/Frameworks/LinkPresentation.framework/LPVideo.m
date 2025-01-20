@interface LPVideo
+ (BOOL)supportsSecureCoding;
- (AVAsset)_asset;
- (BOOL)_canEncodeWithoutComputation;
- (BOOL)_isSubstitute;
- (BOOL)hasAudio;
- (BOOL)hasPlaceholderValueForAsynchronousLoad;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsAsynchronousLoad;
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (CGSize)_intrinsicSizeIfKnown;
- (LPVideo)init;
- (LPVideo)initWithCoder:(id)a3;
- (LPVideo)initWithData:(id)a3 MIMEType:(id)a4 hasAudio:(BOOL)a5;
- (LPVideo)initWithData:(id)a3 MIMEType:(id)a4 properties:(id)a5;
- (LPVideo)initWithItemProvider:(id)a3 properties:(id)a4;
- (LPVideo)initWithStreamingURL:(id)a3 hasAudio:(BOOL)a4;
- (LPVideo)initWithStreamingURL:(id)a3 properties:(id)a4;
- (LPVideo)initWithYouTubeURL:(id)a3;
- (LPVideo)initWithYouTubeURL:(id)a3 properties:(id)a4;
- (NSItemProvider)_itemProvider;
- (NSURL)streamingURL;
- (NSURL)youTubeURL;
- (id)_initWithVideo:(id)a3;
- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4 hasAudio:(BOOL)a5;
- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4 properties:(id)a5;
- (void)_installMediaServicesResetNotificationHandler;
- (void)_intrinsicSizeWithCompletionHandler:(id)a3;
- (void)_uninstallMediaServicesResetNotificationHandler;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadAsynchronouslyWithCompletionHandler:(id)a3;
- (void)setFileURL:(id)a3;
@end

@implementation LPVideo

- (LPVideo)init
{
  return 0;
}

- (id)_initWithVideo:(id)a3
{
  v4 = (id *)a3;
  v5 = [v4 data];
  v6 = [v4 fileURL];
  v7 = [v4 MIMEType];
  v8 = [v4 properties];
  v12.receiver = self;
  v12.super_class = (Class)LPVideo;
  v9 = [(LPVisualMedia *)&v12 _initWithData:v5 fileURL:v6 MIMEType:v7 properties:v8];

  if (v9)
  {
    objc_storeStrong(v9 + 14, v4[14]);
    objc_storeStrong(v9 + 15, v4[15]);
    v10 = v9;
  }

  return v9;
}

- (LPVideo)initWithData:(id)a3 MIMEType:(id)a4 hasAudio:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = objc_alloc_init(LPVideoProperties);
  [(LPVideoProperties *)v10 setHasAudio:v5];
  v11 = [(LPVideo *)self initWithData:v8 MIMEType:v9 properties:v10];
  objc_super v12 = v11;
  if (v11) {
    v13 = v11;
  }

  return v12;
}

- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4 hasAudio:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = objc_alloc_init(LPVideoProperties);
  [(LPVideoProperties *)v10 setHasAudio:v5];
  id v11 = [(LPVisualMedia *)self _initByReferencingFileURL:v8 MIMEType:v9 properties:v10];
  objc_super v12 = v11;
  if (v11) {
    id v13 = v11;
  }

  return v12;
}

- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)LPVideo;
  id v5 = [(LPVisualMedia *)&v9 _initByReferencingFileURL:a3 MIMEType:a4 properties:a5];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }

  return v6;
}

- (LPVideo)initWithData:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)LPVideo;
  id v5 = [(LPVisualMedia *)&v9 _initWithData:a3 MIMEType:a4 properties:a5];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }

  return v6;
}

- (LPVideo)initWithStreamingURL:(id)a3 hasAudio:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(LPVideoProperties);
  [(LPVideoProperties *)v7 setHasAudio:v4];
  id v8 = [(LPVideo *)self initWithStreamingURL:v6 properties:v7];
  objc_super v9 = v8;
  if (v8) {
    v10 = v8;
  }

  return v9;
}

- (LPVideo)initWithStreamingURL:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPVideo;
  id v8 = [(LPVisualMedia *)&v12 initWithProperties:a4];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_streamingURL, a3);
    v10 = v9;
  }

  return v9;
}

- (LPVideo)initWithYouTubeURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(LPVideoProperties);
  [(LPVideoProperties *)v5 setHasAudio:1];
  id v6 = [(LPVideo *)self initWithYouTubeURL:v4 properties:v5];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }

  return v7;
}

- (LPVideo)initWithYouTubeURL:(id)a3 properties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LPVideo;
  objc_super v9 = [(LPVisualMedia *)&v12 initWithProperties:v8];
  if (v9
    && +[LPPresentationSpecializations isYouTubeEmbedURL:v7])
  {
    objc_storeStrong((id *)&v9->_youTubeURL, a3);
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (LPVideo)initWithItemProvider:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPVideo;
  id v8 = [(LPVisualMedia *)&v12 initWithProperties:a4];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_itemProvider, a3);
    v10 = v9;
  }

  return v9;
}

- (void)dealloc
{
  [(LPVideo *)self _uninstallMediaServicesResetNotificationHandler];
  v3.receiver = self;
  v3.super_class = (Class)LPVideo;
  [(LPVideo *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPVideo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(LPVideoProperties);
  -[LPVideoProperties setHasAudio:](v5, "setHasAudio:", [v4 decodeBoolForKey:@"hasAudio"]);
  id v6 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"overlappingControlsColor");
  [(LPVideoProperties *)v5 _setOverlappingControlsColor:v6];

  v14.receiver = self;
  v14.super_class = (Class)LPVideo;
  id v7 = [(LPVisualMedia *)&v14 initWithCoder:v4 properties:v5];
  if (v7)
  {
    uint64_t v8 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"streamingURL");
    streamingURL = v7->_streamingURL;
    v7->_streamingURL = (NSURL *)v8;

    uint64_t v10 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"youTubeURL");
    youTubeURL = v7->_youTubeURL;
    v7->_youTubeURL = (NSURL *)v10;

    objc_super v12 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if ([(LPVideo *)self needsAsynchronousLoad])
  {
    if (objc_msgSend(v4, "_lp_coderType") != 1)
    {
      id v5 = LPLogChannelSerialization();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A35DC000, v5, OS_LOG_TYPE_DEFAULT, "Trying to encode an LPVideo with an unloaded item provider.", buf, 2u);
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)LPVideo;
  [(LPVisualMedia *)&v9 encodeWithCoder:v4];
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_streamingURL, @"streamingURL");
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_youTubeURL, @"youTubeURL");
  id v6 = [(LPVisualMedia *)self properties];
  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v6, "hasAudio"), @"hasAudio");

  id v7 = [(LPVisualMedia *)self properties];
  uint64_t v8 = [v7 _overlappingControlsColor];
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", v8, @"overlappingControlsColor");
}

- (BOOL)_canEncodeWithoutComputation
{
  objc_super v3 = [(LPVisualMedia *)self fileURL];

  if (v3) {
    return 0;
  }
  if (self->_streamingURL || self->_youTubeURL) {
    return 1;
  }
  id v6 = [(LPVisualMedia *)self _cachedData];
  BOOL v4 = v6 != 0;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPVideo;
  if ([(LPVisualMedia *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (void **)v4;
      if (objectsAreEqual_1(v6[14], self->_streamingURL)) {
        char v5 = objectsAreEqual_1(v6[15], self->_youTubeURL);
      }
      else {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (void)setFileURL:(id)a3
{
  id v4 = a3;
  if ([v4 isFileURL])
  {
    id v7 = self;
    char v5 = (objc_super *)&v7;
    id v6 = v4;
  }
  else
  {
    id v6 = 0;
    v8.receiver = self;
    char v5 = &v8;
  }
  v5->super_class = (Class)LPVideo;
  -[objc_super setFileURL:](v5, sel_setFileURL_, v6, v7);
}

- (BOOL)hasAudio
{
  v2 = [(LPVisualMedia *)self properties];
  char v3 = [v2 hasAudio];

  return v3;
}

- (BOOL)_isSubstitute
{
  return 0;
}

- (CGSize)_intrinsicSizeIfKnown
{
  double width = self->_intrinsicSize.width;
  double height = self->_intrinsicSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_intrinsicSizeWithCompletionHandler:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void, __n128, __n128))a3;
  if (*(_OWORD *)&self->_streamingURL != 0) {
    goto LABEL_2;
  }
  id v7 = [(LPVisualMedia *)self fileURL];
  if (v7)
  {
  }
  else
  {
    objc_super v8 = [(LPVisualMedia *)self data];

    if (!v8)
    {
LABEL_2:
      v5.n128_u64[0] = *MEMORY[0x1E4F1DB30];
      v6.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB30] + 8);
LABEL_3:
      v4[2](v4, v5, v6);
      goto LABEL_4;
    }
  }
  v5.n128_u64[0] = *(void *)&self->_intrinsicSize.width;
  v6.n128_u64[0] = *(void *)&self->_intrinsicSize.height;
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v5.n128_f64[0] != *MEMORY[0x1E4F1DB30] || v6.n128_f64[0] != v10) {
    goto LABEL_3;
  }
  objc_super v12 = [(LPVideo *)self _asset];
  if (v12 && !self->_startedFetchingIntrinsicSize)
  {
    self->_startedFetchingIntrinsicSize = 1;
    v19 = @"tracks";
    v20[0] = &unk_1EF712A20;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E5B06200;
    id v15 = v12;
    v17 = self;
    v18 = v4;
    id v16 = &unk_1EF712A20;
    [v15 loadValuesAsynchronouslyForKeys:&unk_1EF712A38 keysForCollectionKeys:v13 completionHandler:v14];
  }
  else
  {
    ((void (*)(void (**)(void, __n128, __n128), double, double))v4[2])(v4, v9, v10);
  }

LABEL_4:
}

void __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) statusOfValueForKey:@"tracks" error:0] == 2)
  {
    [*(id *)(a1 + 32) tracksWithMediaType:*MEMORY[0x1E4F15C18]];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [v2 countByEnumeratingWithState:&v30 objects:v37 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v31 != v4) {
            objc_enumerationMutation(v2);
          }
          __n128 v6 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v7 = *(id *)(a1 + 40);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v27;
            while (2)
            {
              for (uint64_t j = 0; j != v8; ++j)
              {
                if (*(void *)v27 != v9) {
                  objc_enumerationMutation(v7);
                }
                if ([v6 statusOfValueForKey:*(void *)(*((void *)&v26 + 1) + 8 * j) error:0] != 2)
                {
                  v24[0] = MEMORY[0x1E4F143A8];
                  v24[1] = 3221225472;
                  v24[2] = __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke_3;
                  v24[3] = &unk_1E5B05500;
                  id v25 = *(id *)(a1 + 56);
                  dispatch_async(MEMORY[0x1E4F14428], v24);

                  goto LABEL_22;
                }
              }
              uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
              if (v8) {
                continue;
              }
              break;
            }
          }

          if ([v6 isPlayable] && objc_msgSend(v6, "isEnabled"))
          {
            uint64_t v11 = *(void *)(a1 + 48);
            [v6 naturalSize];
            double v17 = v13;
            double v18 = v12;
            if (v6)
            {
              [v6 preferredTransform];
              float64x2_t v14 = v21;
              float64x2_t v15 = v22;
            }
            else
            {
              float64x2_t v14 = 0uLL;
              float64x2_t v22 = 0u;
              long long v23 = 0u;
              float64x2_t v21 = 0u;
              float64x2_t v15 = 0uLL;
            }
            *(float64x2_t *)(v11 + 72) = vmlaq_n_f64(vmulq_n_f64(v15, v17), v14, v18);
            *(float64x2_t *)(*(void *)(a1 + 48) + 72) = vabsq_f64(*(float64x2_t *)(*(void *)(a1 + 48) + 72));
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke_4;
            v19[3] = &unk_1E5B04F80;
            id v16 = *(id *)(a1 + 56);
            v19[4] = *(void *)(a1 + 48);
            id v20 = v16;
            dispatch_async(MEMORY[0x1E4F14428], v19);
            id v7 = v20;
LABEL_22:

            goto LABEL_23;
          }
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v30 objects:v37 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_23:
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5B05500;
    id v35 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v2 = v35;
  }
}

uint64_t __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(void *)(a1 + 32) + 16))(*MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

uint64_t __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(void *)(a1 + 32) + 16))(*MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

uint64_t __47__LPVideo__intrinsicSizeWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(double *)(*(void *)(a1 + 32) + 72), *(double *)(*(void *)(a1 + 32) + 80));
}

- (BOOL)needsAsynchronousLoad
{
  return self->_itemProvider != 0;
}

- (BOOL)hasPlaceholderValueForAsynchronousLoad
{
  return 0;
}

- (void)loadAsynchronouslyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  itemProviderLoadGroup = self->_itemProviderLoadGroup;
  if (!itemProviderLoadGroup)
  {
    __n128 v6 = (OS_dispatch_group *)dispatch_group_create();
    id v7 = self->_itemProviderLoadGroup;
    self->_itemProviderLoadGroup = v6;

    dispatch_group_enter((dispatch_group_t)self->_itemProviderLoadGroup);
    itemProvider = self->_itemProvider;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__LPVideo_loadAsynchronouslyWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E5B05040;
    v12[4] = self;
    [(NSItemProvider *)itemProvider _lp_loadFirstDataRepresentationMatchingMIMETypePredicate:&__block_literal_global_15 completionHandler:v12];
    itemProviderLoadGroup = self->_itemProviderLoadGroup;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__LPVideo_loadAsynchronouslyWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E5B05068;
  void block[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_group_notify(itemProviderLoadGroup, MEMORY[0x1E4F14428], block);
}

BOOL __51__LPVideo_loadAsynchronouslyWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[LPMIMETypeRegistry isVideoType:a2];
}

void __51__LPVideo_loadAsynchronouslyWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    __n128 v6 = [[LPVideo alloc] initWithData:v9 MIMEType:v5 hasAudio:1];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = v6;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 64));
}

uint64_t __51__LPVideo_loadAsynchronouslyWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (NSItemProvider)_itemProvider
{
  itemProvider = self->_itemProvider;
  if (itemProvider)
  {
    uint64_t v3 = itemProvider;
  }
  else
  {
    id v5 = [(LPVisualMedia *)self data];
    __n128 v6 = (void *)MEMORY[0x1E4F28D78];
    uint64_t v7 = [(LPVisualMedia *)self MIMEType];
    objc_msgSend(v6, "_lp_itemProviderWithData:MIMEType:", v5, v7);
    uint64_t v3 = (NSItemProvider *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (AVAsset)_asset
{
  v33[2] = *MEMORY[0x1E4F143B8];
  p_asset = (id *)&self->_asset;
  asset = self->_asset;
  if (asset)
  {
    id v4 = asset;
  }
  else
  {
    streamingURL = self->_streamingURL;
    if (streamingURL)
    {
      uint64_t v7 = streamingURL;
      uint64_t v8 = +[LPTestingOverrides customLoader];

      if (v8)
      {
        id v9 = +[LPTestingOverrides customLoader];
        uint64_t v10 = [v9 overrideURLForMediaURL:v7];

        uint64_t v7 = (NSURL *)v10;
      }
      uint64_t v11 = [MEMORY[0x1E4F166C8] assetWithURL:v7];
      id v12 = *p_asset;
      id *p_asset = (id)v11;

      double v13 = +[LPTestingOverrides customLoader];

      if (v13)
      {
        float64x2_t v14 = +[LPTestingOverrides customLoader];
        float64x2_t v15 = [*p_asset resourceLoader];
        [v14 installCustomMediaLoader:v15];
      }
      [(LPVideo *)self _installMediaServicesResetNotificationHandler];
      id v4 = (AVURLAsset *)*p_asset;
    }
    else
    {
      id v16 = [(LPVisualMedia *)self data];

      if (v16)
      {
        double v17 = (void *)MEMORY[0x1E4F166C8];
        double v18 = (void *)MEMORY[0x1E4F1CB10];
        v19 = NSString;
        id v20 = [MEMORY[0x1E4F29128] UUID];
        float64x2_t v21 = [v20 UUIDString];
        float64x2_t v22 = [v19 stringWithFormat:@"link-presentation-video://video/%@", v21];
        long long v23 = [v18 URLWithString:v22];
        uint64_t v24 = *MEMORY[0x1E4F16178];
        v32[0] = *MEMORY[0x1E4F16158];
        v32[1] = v24;
        v33[0] = &unk_1EF712738;
        v33[1] = MEMORY[0x1E4F1CC38];
        id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
        long long v26 = [v17 URLAssetWithURL:v23 options:v25];

        if (!self->_mediaLoadingQueue)
        {
          long long v27 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
          long long v28 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.LinkPresentation.MediaFetching", v27);
          mediaLoadingQueue = self->_mediaLoadingQueue;
          self->_mediaLoadingQueue = v28;
        }
        long long v30 = [v26 resourceLoader];
        [v30 setDelegate:self queue:self->_mediaLoadingQueue];

        objc_storeStrong(p_asset, v26);
        [(LPVideo *)self _installMediaServicesResetNotificationHandler];
        id v4 = (AVURLAsset *)*p_asset;
      }
      else
      {
        id v4 = 0;
      }
    }
  }

  return (AVAsset *)v4;
}

- (void)_installMediaServicesResetNotificationHandler
{
  [(LPVideo *)self _uninstallMediaServicesResetNotificationHandler];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = +[LPMediaPlaybackManager shared];
  id v5 = [v4 audioSession];
  __n128 v6 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v7 = *MEMORY[0x1E4F15048];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__LPVideo__installMediaServicesResetNotificationHandler__block_invoke;
  v10[3] = &unk_1E5B06228;
  v10[4] = self;
  uint64_t v8 = [v3 addObserverForName:v7 object:v5 queue:v6 usingBlock:v10];
  id mediaServicesResetNotificationHandler = self->_mediaServicesResetNotificationHandler;
  self->_id mediaServicesResetNotificationHandler = v8;
}

uint64_t __56__LPVideo__installMediaServicesResetNotificationHandler__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 96);
  *(void *)(v2 + 96) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 _uninstallMediaServicesResetNotificationHandler];
}

- (void)_uninstallMediaServicesResetNotificationHandler
{
  if (self->_mediaServicesResetNotificationHandler)
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_mediaServicesResetNotificationHandler];

    id mediaServicesResetNotificationHandler = self->_mediaServicesResetNotificationHandler;
  }
  else
  {
    id mediaServicesResetNotificationHandler = 0;
  }
  self->_id mediaServicesResetNotificationHandler = 0;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 request];
  id v9 = [v8 URL];
  uint64_t v10 = [(AVURLAsset *)self->_asset URL];
  char v11 = [v9 isEqual:v10];

  if (v11)
  {
    id v12 = [v7 contentInformationRequest];

    if (v12)
    {
      double v13 = [(LPVisualMedia *)self MIMEType];
      float64x2_t v14 = +[LPMIMETypeRegistry UTIForMIMEType:v13];

      float64x2_t v15 = [v7 contentInformationRequest];
      [v15 setContentType:v14];

      id v16 = [(LPVisualMedia *)self data];
      uint64_t v17 = [v16 length];
      double v18 = [v7 contentInformationRequest];
      [v18 setContentLength:v17];

      v19 = [v7 contentInformationRequest];
      [v19 setByteRangeAccessSupported:1];
    }
    id v20 = [v7 dataRequest];

    if (v20)
    {
      float64x2_t v21 = [v7 dataRequest];
      uint64_t v22 = [v21 requestedOffset];
      long long v23 = [(LPVisualMedia *)self data];
      uint64_t v24 = [v23 length];
      unint64_t v25 = v24 - [v21 requestedOffset];

      if (!v25) {
        goto LABEL_15;
      }
      if (([v21 requestsAllDataToEndOfResource] & 1) == 0)
      {
        unint64_t v26 = [v21 requestedLength];
        if (v26 < v25) {
          unint64_t v25 = v26;
        }
      }
      long long v27 = [(LPVisualMedia *)self data];
      long long v28 = objc_msgSend(v27, "subdataWithRange:", v22, v25);

      if (!v28)
      {
LABEL_15:

        BOOL v29 = 0;
        goto LABEL_14;
      }
      [v21 respondWithData:v28];
    }
    [v7 finishLoading];
  }
  else
  {
    [v7 finishLoadingWithError:0];
  }
  BOOL v29 = 1;
LABEL_14:

  return v29;
}

- (NSURL)streamingURL
{
  return self->_streamingURL;
}

- (NSURL)youTubeURL
{
  return self->_youTubeURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_youTubeURL, 0);
  objc_storeStrong((id *)&self->_streamingURL, 0);
  objc_storeStrong(&self->_mediaServicesResetNotificationHandler, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_itemProviderLoadGroup, 0);
  objc_storeStrong((id *)&self->_videoLoadedFromItemProvider, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);

  objc_storeStrong((id *)&self->_mediaLoadingQueue, 0);
}

@end