@interface MPCSonicAVItem
- (BOOL)isHLSAsset;
- (MPCSonicAVItem)initWithGenericObject:(id)a3 itemProperties:(id)a4 playbackRequestEnvironment:(id)a5 identityPropertySet:(id)a6 contentID:(id)a7;
- (MPCSonicAVItemAsset)swiftAsset;
- (MPCSonicAVItem_Swift)swift;
- (id)contentIdentifier;
- (int64_t)loadedAudioAssetType;
- (int64_t)playerItemType;
- (void)emitEventType:(id)a3 payload:(id)a4;
- (void)loadAssetAndPlayerItemWithTask:(id)a3 completion:(id)a4;
- (void)prepareForRate:(float)a3 completionHandler:(id)a4;
- (void)setSwift:(id)a3;
- (void)setSwiftAsset:(id)a3;
@end

@implementation MPCSonicAVItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftAsset, 0);

  objc_storeStrong((id *)&self->_swift, 0);
}

- (void)setSwiftAsset:(id)a3
{
}

- (MPCSonicAVItemAsset)swiftAsset
{
  return self->_swiftAsset;
}

- (void)setSwift:(id)a3
{
}

- (MPCSonicAVItem_Swift)swift
{
  return self->_swift;
}

- (void)emitEventType:(id)a3 payload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MPCModelGenericAVItem *)self eventStream];
  [v8 emitEventType:v7 payload:v6];
}

- (int64_t)playerItemType
{
  return 1;
}

- (id)contentIdentifier
{
  v2 = [(MPCSonicAVItem *)self swift];
  v3 = [v2 _contentID];

  return v3;
}

- (BOOL)isHLSAsset
{
  v2 = [(MPCSonicAVItem *)self swiftAsset];
  char v3 = [v2 isHLS];

  return v3;
}

- (int64_t)loadedAudioAssetType
{
  char v3 = [(MPCSonicAVItem *)self swiftAsset];

  if (!v3) {
    return 0;
  }
  if ([(MPCSonicAVItem *)self isHLSAsset]) {
    return 2;
  }
  return 1;
}

- (void)prepareForRate:(float)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = [(MPCSonicAVItem *)self swiftAsset];

  if (!v8)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MPCSonicAVItem.m" lineNumber:62 description:@"Asset has not been loaded!"];
  }
  v9 = [(MPCSonicAVItem *)self swiftAsset];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__MPCSonicAVItem_prepareForRate_completionHandler___block_invoke;
  v13[3] = &unk_2643C5830;
  id v14 = v7;
  id v10 = v7;
  *(float *)&double v11 = a3;
  [v9 prepareForRate:v13 completion:v11];
}

void __51__MPCSonicAVItem_prepareForRate_completionHandler___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  msv_dispatch_on_main_queue();
}

uint64_t __51__MPCSonicAVItem_prepareForRate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadAssetAndPlayerItemWithTask:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(MPCSonicAVItem *)self swift];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__MPCSonicAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke;
  v8[3] = &unk_2643C5490;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 renderWithCompletion:v8];
}

void __60__MPCSonicAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v5)
  {
    [v7 setSwiftAsset:v5];
    id v8 = (void *)MEMORY[0x263EFA800];
    id v9 = [v5 avAsset];
    id v10 = [v8 playerItemWithAsset:v9];

    double v11 = *(void **)(a1 + 32);
    v12 = [v5 avAsset];
    [v11 setAsset:v12];

    [*(id *)(a1 + 32) setPlayerItem:v10];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__MPCSonicAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2;
    v13[3] = &unk_2643C5468;
    void v13[4] = *(void *)(a1 + 32);
    [v5 loadEnhancedHLSAudioFormatsWithCompletion:v13];
  }
  else
  {
    [v7 setItemError:v6];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __60__MPCSonicAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) updateAudioFormatsDictionary:a2];
  }
  else
  {
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_ERROR, "Failed to load enhanced HLS format error=%{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (MPCSonicAVItem)initWithGenericObject:(id)a3 itemProperties:(id)a4 playbackRequestEnvironment:(id)a5 identityPropertySet:(id)a6 contentID:(id)a7
{
  v18.receiver = self;
  v18.super_class = (Class)MPCSonicAVItem;
  id v11 = a7;
  id v12 = a5;
  v13 = [(MPCModelGenericAVItem *)&v18 initWithGenericObject:a3 itemProperties:a4 playbackRequestEnvironment:v12 identityPropertySet:a6];
  id v14 = [MPCSonicAVItem_Swift alloc];
  v15 = objc_msgSend(v12, "userIdentity", v18.receiver, v18.super_class);

  v16 = [(MPCSonicAVItem_Swift *)v14 initWithItem:v13 contentID:v11 userIdentity:v15];
  [(MPCSonicAVItem *)v13 setSwift:v16];

  return v13;
}

@end