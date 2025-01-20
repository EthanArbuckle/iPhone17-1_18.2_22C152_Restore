@interface CPSMapsImageLoader
- (CPSMapsImageLoader)initWithImageDownloader:(id)a3;
- (void)_loadImageForGEOFeatureStyleAttributes:(id)a3 completionHandler:(id)a4;
- (void)loadImageForGEOStyleAttributes:(id)a3 completionHandler:(id)a4;
- (void)loadImageForMapItemMUID:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation CPSMapsImageLoader

- (CPSMapsImageLoader)initWithImageDownloader:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPSMapsImageLoader;
  v6 = [(CPSMapsImageLoader *)&v14 init];
  if (v6)
  {
    id v7 = [NSString stringWithFormat:@"com.apple.ClipServices.%@.%p", objc_opt_class(), v6];
    v8 = (const char *)[v7 UTF8String];
    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v6->_imageDownloader, a3);
    v12 = v6;
  }

  return v6;
}

- (void)loadImageForGEOStyleAttributes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__CPSMapsImageLoader_loadImageForGEOStyleAttributes_completionHandler___block_invoke;
  block[3] = &unk_26424E678;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __71__CPSMapsImageLoader_loadImageForGEOStyleAttributes_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F41790]) initWithPlaceStyleAttributes:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _loadImageForGEOFeatureStyleAttributes:v2 completionHandler:*(void *)(a1 + 48)];
}

- (void)loadImageForMapItemMUID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke;
  block[3] = &unk_26424FBB0;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke(void *a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x263F41B00]), "initWithMUID:coordinate:", a1[6], -180.0, -180.0);
  v3 = [MEMORY[0x263F41B18] sharedService];
  v4 = [v3 defaultTraits];

  [v4 setWantsBrandIcon:1];
  id v5 = [MEMORY[0x263F41B18] sharedService];
  v11[0] = v2;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v7 = [v5 ticketForIdentifiers:v6 resultProviderID:0 contentProvider:0 traits:v4];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_2;
  v9[3] = &unk_26424FB88;
  id v8 = (void *)a1[5];
  v9[4] = a1[4];
  id v10 = v8;
  [v7 submitWithHandler:v9 networkActivity:0];
}

void __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 firstObject];
  id v7 = objc_msgSend(v6, "_bestAvatarBrandIconURLForSize:allowSmaller:", 1, 500.0, 500.0);
  id v8 = [v6 _styleAttributes];
  id v9 = v8;
  if (v7)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) downloadImageWithURL:v7 completionHandler:*(void *)(a1 + 40)];
  }
  else if (v8)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    unint64_t v11 = *(NSObject **)(v10 + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_3;
    block[3] = &unk_26424E678;
    void block[4] = v10;
    id v23 = v8;
    id v24 = *(id *)(a1 + 40);
    dispatch_async(v11, block);
  }
  else
  {
    id v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_2_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    uint64_t v20 = *(void *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(uint64_t, void, id))(v20 + 16))(v20, 0, v5);
    }
    else
    {
      v21 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 1);
      (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v21);
    }
  }
}

uint64_t __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadImageForGEOFeatureStyleAttributes:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_loadImageForGEOFeatureStyleAttributes:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void *, void))a4;
  queue = self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  id v9 = objc_alloc_init(MEMORY[0x263F84648]);
  [v9 setGlyphOnly:1];
  uint64_t v10 = [MEMORY[0x263F84640] sharedManager];
  double v11 = _CPSScreenScale();
  *(float *)&double v11 = v11;
  id v12 = [v10 imageForStyleAttributes:v8 withStylesheetName:@"default-search" contentScale:9 sizeGroup:v9 modifiers:v11];

  uint64_t v13 = [MEMORY[0x263F84640] sharedManager];
  double v14 = _CPSScreenScale();
  *(float *)&double v14 = v14;
  uint64_t v15 = [v13 imageForStyleAttributes:v8 withStylesheetName:@"default-search" contentScale:9 sizeGroup:0 modifiers:v14];

  uint64_t v16 = [v12 image];
  if (v12 && v15)
  {
    uint64_t v17 = (CGImage *)v16;
    [v15 imageSize];
    double v19 = v18;
    double v21 = v20;
    double v22 = _CPSScreenScale();
    [v15 imageSize];
    CGFloat v24 = v23;
    [v15 imageSize];
    v26 = CPSCreateImageFromImageAndBackgroundColor(v17, (CGColor *)[v15 fillColor], v19, v21, v22, 0.0, 0.0, v24, v25);
    v27 = CPSImagePNGRepresentation(v26);
    if (v26) {
      CGImageRelease(v26);
    }
    if (v27)
    {
      v6[2](v6, v27, 0);
    }
    else
    {
      v36 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[CPSMapsImageLoader _loadImageForGEOFeatureStyleAttributes:completionHandler:](v36, v37, v38, v39, v40, v41, v42, v43);
      }
      v44 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 7);
      ((void (**)(id, void *, void *))v6)[2](v6, 0, v44);
    }
  }
  else
  {
    v28 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[CPSMapsImageLoader _loadImageForGEOFeatureStyleAttributes:completionHandler:](v28, v29, v30, v31, v32, v33, v34, v35);
    }
    v27 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 7);
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v27);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDownloader, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_loadImageForGEOFeatureStyleAttributes:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_loadImageForGEOFeatureStyleAttributes:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end