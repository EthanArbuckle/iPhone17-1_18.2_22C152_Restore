@interface Tiling
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)createTileInfoArrayForFrameWithWidth:(unint64_t)a3 height:(unint64_t)a4 numTiles:(unint64_t)a5;
- (Tiling)initWithDevice:(id)a3 commmandQueue:(id)a4;
- (void)assemble2TilesToCommandBuffer:(id)a3 from:(id *)a4 to:(id)a5 tileInfo:(id *)a6;
- (void)assemble3TilesToCommandBuffer:(id)a3 from:(id *)a4 to:(id)a5 tileInfo:(id *)a6;
- (void)assembleTiles:(__CVBuffer *)a3 to:(__CVBuffer *)a4 tileInfo:(id *)a5 numTiles:(int64_t)a6;
- (void)dealloc;
- (void)encodeTileBufferToCommandBuffer:(id)a3 from:(__CVBuffer *)a4 to:(__CVBuffer *)a5 channels:(int64_t)a6 tileInfo:(id *)a7 numTiles:(int64_t)a8;
- (void)encodeTilingToCommandBuffer:(id)a3 from:(id)a4 to:(id)a5 verticalOffset:(unint64_t)a6 sourceHeight:(unint64_t)a7;
@end

@implementation Tiling

- (Tiling)initWithDevice:(id)a3 commmandQueue:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)Tiling;
  v4 = [(FRCMetalBase *)&v18 initWithDevice:a3 commmandQueue:a4];
  if (v4)
  {
    v5 = (MTLDeviceSPI *)MTLCreateSystemDefaultDevice();
    device = v4->_device;
    v4->_device = v5;

    uint64_t v7 = [(MTLDeviceSPI *)v4->_device newCommandQueue];
    commandQueue = v4->_commandQueue;
    v4->_commandQueue = (MTLCommandQueue *)v7;

    uint64_t v9 = [(MTLDeviceSPI *)v4->_device newDefaultLibrary];
    mtlLibrary = v4->_mtlLibrary;
    v4->_mtlLibrary = (MTLLibrary *)v9;

    uint64_t v11 = [(FRCMetalBase *)v4 createKernel:@"assembleHorizontalThreeTiles"];
    assembleKernel = v4->_assembleKernel;
    v4->_assembleKernel = (MTLComputePipelineState *)v11;

    uint64_t v13 = [(FRCMetalBase *)v4 createKernel:@"assembleHorizontalTwoTiles"];
    assembleTwoTileKernel = v4->_assembleTwoTileKernel;
    v4->_assembleTwoTileKernel = (MTLComputePipelineState *)v13;

    v4->_tileOverlap = 104;
    uint64_t v15 = [(MTLDeviceSPI *)v4->_device newBufferWithLength:12 options:0];
    tileParameters = v4->_tileParameters;
    v4->_tileParameters = (MTLBuffer *)v15;
  }
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)Tiling;
  [(Tiling *)&v2 dealloc];
}

- (void)encodeTilingToCommandBuffer:(id)a3 from:(id)a4 to:(id)a5 verticalOffset:(unint64_t)a6 sourceHeight:(unint64_t)a7
{
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [a3 blitCommandEncoder];
  uint64_t v14 = [v12 width];
  if ([v11 arrayLength])
  {
    unint64_t v15 = 0;
    do
    {
      v18[0] = 0;
      v18[1] = a6;
      v18[2] = 0;
      v17[0] = v14;
      v17[1] = a7;
      v17[2] = 1;
      memset(v16, 0, sizeof(v16));
      [v13 copyFromTexture:v11 sourceSlice:v15 sourceLevel:0 sourceOrigin:v18 sourceSize:v17 toTexture:v12 destinationSlice:v15 destinationLevel:0 destinationOrigin:v16];
      ++v15;
    }
    while ([v11 arrayLength] > v15);
  }
  [v13 endEncoding];
}

- (void)encodeTileBufferToCommandBuffer:(id)a3 from:(__CVBuffer *)a4 to:(__CVBuffer *)a5 channels:(int64_t)a6 tileInfo:(id *)a7 numTiles:(int64_t)a8
{
  id v23 = a3;
  if ((unint64_t)(a8 - 4) > 0xFFFFFFFFFFFFFFFDLL)
  {
    int v14 = isPackedRGBA(a4);
    device = self->_device;
    if (v14) {
      createRGBATextureFromCVPixelBuffer(a4, device);
    }
    else {
    v16 = createTexturesFromCVPixelBuffer(a4, device, 1, a6);
    }
    p_var2 = &a7->var2;
    do
    {
      int v18 = isPackedRGBA(*a5);
      v19 = *a5;
      v20 = self->_device;
      if (v18) {
        createRGBATextureFromCVPixelBuffer(v19, v20);
      }
      else {
      v21 = createTexturesFromCVPixelBuffer(v19, v20, 1, a6);
      }
      unint64_t v22 = *p_var2 + *(p_var2 - 1);
      if (v22 > [v16 height]) {
        [v16 height];
      }
      -[Tiling encodeTilingToCommandBuffer:from:to:verticalOffset:sourceHeight:](self, "encodeTilingToCommandBuffer:from:to:verticalOffset:sourceHeight:", v23, v16, v21);

      p_var2 += 3;
      ++a5;
      --a8;
    }
    while (a8);
  }
  else
  {
    NSLog(&cfstr_UnsupportedNum.isa);
  }
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)createTileInfoArrayForFrameWithWidth:(unint64_t)a3 height:(unint64_t)a4 numTiles:(unint64_t)a5
{
  unint64_t v5 = a5;
  result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)malloc_type_malloc(24 * a5, 0x1000040504FFAC1uLL);
  unint64_t v10 = a4 / v5;
  if (v5 == 3)
  {
    self->_tileOverlap = 104;
    unint64_t v11 = v10 + 111;
  }
  else
  {
    self->_tileOverlap = 64;
    unint64_t v11 = v10 + 71;
    v10 -= 64;
  }
  unint64_t v12 = 0;
  unint64_t v13 = v11 & 0xFFFFFFFFFFFFFFF8;
  p_var2 = &result->var2;
  do
  {
    *(p_var2 - 2) = a3;
    *(p_var2 - 1) = v13;
    unint64_t *p_var2 = v12;
    p_var2 += 3;
    v12 += v10;
    --v5;
  }
  while (v5);
  return result;
}

- (void)assembleTiles:(__CVBuffer *)a3 to:(__CVBuffer *)a4 tileInfo:(id *)a5 numTiles:(int64_t)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  int v10 = isPackedRGBA(a4);
  device = self->_device;
  if (v10) {
    createRGBATextureFromCVPixelBuffer(a4, device);
  }
  else {
  unint64_t v12 = createTexturesFromCVPixelBuffer(a4, device, 1, 3uLL);
  }
  unint64_t v13 = (unsigned int *)[(MTLBuffer *)self->_tileParameters contents];
  *unint64_t v13 = self->_tileOverlap;
  v13[2] = a6;
  v24[0] = v24;
  v13[1] = [v12 height] / a6;
  int64_t v14 = a6;
  bzero((char *)v24 - ((8 * a6 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a6);
  if (a6 >= 1)
  {
    int64_t v15 = a6;
    v16 = (void **)((char *)v24 - ((8 * a6 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      int v17 = isPackedRGBA(*a3);
      int v18 = *a3;
      v19 = self->_device;
      if (v17) {
        createRGBATextureFromCVPixelBuffer(v18, v19);
      }
      else {
      uint64_t v20 = createTexturesFromCVPixelBuffer(v18, v19, 1, 3uLL);
      }
      v21 = *v16;
      *v16++ = (void *)v20;

      ++a3;
      --v15;
    }
    while (v15);
  }
  unint64_t v22 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  id v23 = (char *)v24 - ((8 * a6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6 == 3) {
    [(Tiling *)self assemble3TilesToCommandBuffer:v22 from:v23 to:v12 tileInfo:v13];
  }
  else {
    [(Tiling *)self assemble2TilesToCommandBuffer:v22 from:v23 to:v12 tileInfo:v13];
  }
  kdebug_trace();
  [v22 commit];
  kdebug_trace();

  if (a6)
  {
    do

    while (v14 * 8);
  }
}

- (void)assemble3TilesToCommandBuffer:(id)a3 from:(id *)a4 to:(id)a5 tileInfo:(id *)a6
{
  id v9 = a5;
  int v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_assembleKernel];
  [v10 setTexture:*a4 atIndex:0];
  [v10 setTexture:a4[1] atIndex:1];
  [v10 setTexture:a4[2] atIndex:2];
  [v10 setTexture:v9 atIndex:3];
  [v10 setBuffer:self->_tileParameters offset:0 atIndex:0];
  unint64_t v11 = (unint64_t)([v9 width] + 15) >> 4;
  uint64_t v12 = [v9 height];

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 15) >> 4;
  v15[2] = 1;
  int64x2_t v13 = vdupq_n_s64(0x10uLL);
  uint64_t v14 = 1;
  [v10 dispatchThreadgroups:v15 threadsPerThreadgroup:&v13];
  [v10 endEncoding];
}

- (void)assemble2TilesToCommandBuffer:(id)a3 from:(id *)a4 to:(id)a5 tileInfo:(id *)a6
{
  id v9 = a5;
  int v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_assembleTwoTileKernel];
  [v10 setTexture:*a4 atIndex:0];
  [v10 setTexture:a4[1] atIndex:1];
  [v10 setTexture:v9 atIndex:2];
  [v10 setBuffer:self->_tileParameters offset:0 atIndex:0];
  unint64_t v11 = (unint64_t)([v9 width] + 15) >> 4;
  uint64_t v12 = [v9 height];

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 15) >> 4;
  v15[2] = 1;
  int64x2_t v13 = vdupq_n_s64(0x10uLL);
  uint64_t v14 = 1;
  [v10 dispatchThreadgroups:v15 threadsPerThreadgroup:&v13];
  [v10 endEncoding];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileParameters, 0);
  objc_storeStrong((id *)&self->_assembleTwoTileKernel, 0);
  objc_storeStrong((id *)&self->_assembleKernel, 0);
  objc_storeStrong((id *)&self->_mtlLibrary, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end