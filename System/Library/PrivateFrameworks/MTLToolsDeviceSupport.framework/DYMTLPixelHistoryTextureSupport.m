@interface DYMTLPixelHistoryTextureSupport
+ (id)pixelValueFromTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 depthPlane:(unint64_t)a6 atX:(unint64_t)a7 y:(unint64_t)a8 inCommandBuffer:(id)a9 overHarvestForDepthStencil:(BOOL)a10;
+ (void)pixelValueFromTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 depthPlane:(unint64_t)a6 atX:(unint64_t)a7 y:(unint64_t)a8 inCommandBuffer:(id)a9 overHarvestForDepthStencil:(BOOL)a10 completion:(id)a11;
+ (void)pixelValueToTexture:(id)a3 buffer:(id)a4 level:(unint64_t)a5 slice:(unint64_t)a6 depthPlane:(unint64_t)a7 atX:(unint64_t)a8 y:(unint64_t)a9 inCommandBuffer:(id)a10;
@end

@implementation DYMTLPixelHistoryTextureSupport

+ (void)pixelValueFromTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 depthPlane:(unint64_t)a6 atX:(unint64_t)a7 y:(unint64_t)a8 inCommandBuffer:(id)a9 overHarvestForDepthStencil:(BOOL)a10 completion:(id)a11
{
  id v17 = a3;
  id v18 = a9;
  id v19 = a11;
  if ([v17 width] && objc_msgSend(v17, "height"))
  {
    LOBYTE(v22) = a10;
    v20 = [a1 pixelValueFromTexture:v17 level:a4 slice:a5 depthPlane:a6 atX:a7 y:a8 inCommandBuffer:v18 overHarvestForDepthStencil:v22];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __140__DYMTLPixelHistoryTextureSupport_pixelValueFromTexture_level_slice_depthPlane_atX_y_inCommandBuffer_overHarvestForDepthStencil_completion___block_invoke;
    v23[3] = &unk_2653C3460;
    id v24 = v20;
    id v26 = v19;
    id v25 = v17;
    id v21 = v20;
    [v18 addCompletedHandler:v23];
  }
}

void __140__DYMTLPixelHistoryTextureSupport_pixelValueFromTexture_level_slice_depthPlane_atX_y_inCommandBuffer_overHarvestForDepthStencil_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytes:length:", objc_msgSend(*(id *)(a1 + 32), "contents"), objc_msgSend(*(id *)(a1 + 32), "length"));
  (*(void (**)(void, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v2, [*(id *)(a1 + 40) pixelFormat]);
}

+ (id)pixelValueFromTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 depthPlane:(unint64_t)a6 atX:(unint64_t)a7 y:(unint64_t)a8 inCommandBuffer:(id)a9 overHarvestForDepthStencil:(BOOL)a10
{
  id v15 = a3;
  id v16 = a9;
  if ([v15 width] && objc_msgSend(v15, "height"))
  {
    unint64_t v23 = a7;
    id v17 = [v16 device];
    [v15 pixelFormat];
    uint64_t v37 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v34 = 0u;
    MTLPixelFormatGetInfoForDevice();
    id v18 = [v16 blitCommandEncoder];
    uint64_t v33 = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    MTLGetTextureLevelInfoForDeviceWithOptions();
    uint64_t v19 = [v17 newBufferWithLength:0 options:0];
    unint64_t v20 = a4;
    id v21 = (void *)v19;
    v26[0] = v23;
    v26[1] = a8;
    v26[2] = a6;
    int64x2_t v24 = vdupq_n_s64(1uLL);
    uint64_t v25 = 1;
    [v18 copyFromTexture:v15 sourceSlice:a5 sourceLevel:v20 sourceOrigin:v26 sourceSize:&v24 toBuffer:v19 destinationOffset:0 destinationBytesPerRow:0 destinationBytesPerImage:0 options:0];
    [v18 endEncoding];
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

+ (void)pixelValueToTexture:(id)a3 buffer:(id)a4 level:(unint64_t)a5 slice:(unint64_t)a6 depthPlane:(unint64_t)a7 atX:(unint64_t)a8 y:(unint64_t)a9 inCommandBuffer:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a10;
  if ([v15 width] && objc_msgSend(v15, "height"))
  {
    id v18 = [v17 device];
    [v15 pixelFormat];
    uint64_t v33 = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v30 = 0u;
    MTLPixelFormatGetInfoForDevice();
    uint64_t v19 = [v17 blitCommandEncoder];
    uint64_t v29 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    MTLGetTextureLevelInfoForDeviceWithOptions();
    int64x2_t v21 = vdupq_n_s64(1uLL);
    uint64_t v22 = 1;
    v20[0] = a8;
    v20[1] = a9;
    v20[2] = a7;
    [v19 copyFromBuffer:v16 sourceOffset:0 sourceBytesPerRow:0 sourceBytesPerImage:0 sourceSize:&v21 toTexture:v15 destinationSlice:a6 destinationLevel:a5 destinationOrigin:v20 options:0];
    [v19 endEncoding];
  }
}

@end