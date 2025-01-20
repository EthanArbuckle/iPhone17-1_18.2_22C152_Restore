@interface IOGPUMetalBlitCommandEncoder
- (unint64_t)getType;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10;
- (void)copyFromTexture:(id)a3 toTexture:(id)a4;
- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8;
- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)synchronizeResource:(id)a3;
- (void)synchronizeTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)updateFence:(id)a3;
- (void)waitForFence:(id)a3;
@end

@implementation IOGPUMetalBlitCommandEncoder

- (unint64_t)getType
{
  return 2;
}

- (void)synchronizeResource:(id)a3
{
}

- (void)synchronizeTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
}

- (void)updateFence:(id)a3
{
}

- (void)waitForFence:(id)a3
{
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7
{
  double var3 = a7.var3;
  double var2 = a7.var2;
  double var1 = a7.var1;
  double var0 = a7.var0;
  uint64_t v16 = [a3 pixelFormat];
  long long v17 = *(_OWORD *)&a6->var0.var2;
  v18[0] = *(_OWORD *)&a6->var0.var0;
  v18[1] = v17;
  v18[2] = *(_OWORD *)&a6->var1.var1;
  -[IOGPUMetalBlitCommandEncoder fillTexture:level:slice:region:color:pixelFormat:](self, "fillTexture:level:slice:region:color:pixelFormat:", a3, a4, a5, v18, v16, var0, var1, var2, var3);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  $01BB1521EC52D44A8E7628F5261DCEC8 v16 = a7;
  uint64_t v13 = MTLPackColor();
  long long v14 = *(_OWORD *)&a6->var0.var2;
  v15[0] = *(_OWORD *)&a6->var0.var0;
  v15[1] = v14;
  v15[2] = *(_OWORD *)&a6->var1.var1;
  [(IOGPUMetalBlitCommandEncoder *)self fillTexture:a3 level:a4 slice:a5 region:v15 bytes:v17 length:v13];
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  uint64_t v13 = [a3 width];
  uint64_t v14 = [a3 height];
  unint64_t v15 = [a3 depth];
  if (a10)
  {
    uint64_t v30 = 0;
    v16.i64[0] = v13;
    v16.i64[1] = v14;
    int8x16_t v17 = (int8x16_t)vshlq_u64(v16, (uint64x2_t)vnegq_s64(vdupq_n_s64(a5)));
    uint64x2_t v18 = (uint64x2_t)vdupq_n_s64(1uLL);
    if (v15 >> a5 <= 1) {
      unint64_t v19 = 1;
    }
    else {
      unint64_t v19 = v15 >> a5;
    }
    int8x16_t v20 = (int8x16_t)vcgtq_u64((uint64x2_t)v17, v18);
    uint64x2_t v21 = (uint64x2_t)vsubq_s64((int64x2_t)vandq_s8(v17, v20), (int64x2_t)vmvnq_s8(v20));
    do
    {
      if (a9)
      {
        unint64_t v22 = a9;
        unint64_t v23 = a7;
        unint64_t v24 = a4;
        uint64x2_t v31 = v21;
        do
        {
          memset(v35, 0, 24);
          unint64_t v33 = v19;
          memset(v34, 0, sizeof(v34));
          uint64x2_t v32 = v21;
          [(IOGPUMetalBlitCommandEncoder *)self copyFromTexture:a3 sourceSlice:v24 sourceLevel:v30 + a5 sourceOrigin:v35 sourceSize:&v32 toTexture:a6 destinationSlice:v23 destinationLevel:v30 + a8 destinationOrigin:v34];
          uint64x2_t v21 = v31;
          ++v23;
          ++v24;
          --v22;
        }
        while (v22);
      }
      int8x16_t v25 = (int8x16_t)vcgtq_u64(v21, (uint64x2_t)vdupq_n_s64(1uLL));
      uint64x2_t v21 = (uint64x2_t)vsubq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64(v21, 1uLL), v25), (int64x2_t)vmvnq_s8(v25));
      if (v19 <= 1) {
        unint64_t v19 = 1;
      }
      else {
        v19 >>= 1;
      }
      ++v30;
    }
    while (v30 != a10);
  }
}

- (void)copyFromTexture:(id)a3 toTexture:(id)a4
{
  unint64_t v7 = [a3 width];
  unint64_t v8 = v7;
  unint64_t v9 = [a3 height];
  unint64_t v10 = [a3 depth];
  unint64_t v43 = v10;
  unint64_t v44 = v9;
  unint64_t v11 = [a4 width];
  unint64_t v12 = [a4 height];
  unint64_t v13 = [a4 depth];
  unint64_t v41 = v13;
  unint64_t v42 = v12;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  if (v7 <= v11 && v9 <= v12 && v10 <= v13)
  {
    uint64_t v14 = &v44;
    unint64_t v15 = &v43;
    uint64x2_t v16 = &v39;
    int8x16_t v17 = &v40;
    unint64_t v18 = v13;
    unint64_t v19 = v12;
    unint64_t v20 = v7;
    unint64_t v8 = v11;
  }
  else
  {
    uint64_t v14 = &v42;
    unint64_t v15 = &v41;
    uint64x2_t v16 = &v40;
    int8x16_t v17 = &v39;
    unint64_t v18 = v10;
    unint64_t v19 = v9;
    unint64_t v20 = v11;
  }
  uint64_t v21 = 0;
  while (v8 > v20 || v19 > *v14 || v18 > *v15)
  {
    v8 >>= 1;
    v19 >>= 1;
    ++v21;
    v18 >>= 1;
  }
  *int8x16_t v17 = 0;
  *uint64x2_t v16 = v21;
  uint64_t v22 = v40;
  uint64_t v23 = v7 >> v40;
  if (v7 >> v40 <= 1) {
    uint64_t v23 = 1;
  }
  uint64_t v24 = v39;
  uint64_t v25 = v11 >> v39;
  if (v11 >> v39 <= 1) {
    uint64_t v25 = 1;
  }
  if (v23 != v25) {
    goto LABEL_40;
  }
  uint64_t v26 = v9 >> v40;
  if (v9 >> v40 <= 1) {
    uint64_t v26 = 1;
  }
  uint64_t v27 = v12 >> v39;
  if (v12 >> v39 <= 1) {
    uint64_t v27 = 1;
  }
  if (v26 != v27) {
    goto LABEL_40;
  }
  uint64_t v28 = v10 >> v40;
  if (v10 >> v40 <= 1) {
    uint64_t v28 = 1;
  }
  uint64_t v29 = v13 >> v39;
  if (v13 >> v39 <= 1) {
    uint64_t v29 = 1;
  }
  if (v28 != v29 || v40 && v39) {
LABEL_40:
  }
    -[IOGPUMetalBlitCommandEncoder copyFromTexture:toTexture:]();
  unint64_t v30 = [a3 mipmapLevelCount] - v22;
  uint64_t v31 = [a4 mipmapLevelCount];
  if (v30 >= v31 - v24) {
    unint64_t v32 = v31 - v24;
  }
  else {
    unint64_t v32 = v30;
  }
  uint64_t v33 = [a3 arrayLength];
  if ((unint64_t)([a3 textureType] - 5) >= 2) {
    uint64_t v34 = 1;
  }
  else {
    uint64_t v34 = 6;
  }
  unint64_t v35 = v34 * v33;
  uint64_t v36 = [a4 arrayLength];
  if ((unint64_t)([a4 textureType] - 5) >= 2) {
    uint64_t v37 = 1;
  }
  else {
    uint64_t v37 = 6;
  }
  unint64_t v38 = v37 * v36;
  if (v35 < v38) {
    unint64_t v38 = v35;
  }
  [(IOGPUMetalBlitCommandEncoder *)self copyFromTexture:a3 sourceSlice:0 sourceLevel:v22 toTexture:a4 destinationSlice:0 destinationLevel:v24 sliceCount:v38 levelCount:v32];
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
}

- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6
{
}

- (void)copyFromTexture:toTexture:.cold.1()
{
  __assert_rtn("MTLPickLargestMip", "MTLTexture_Private.h", 303, "MAX(srcSize->width >> *srcMip, 1UL) == MAX(dstSize->width >> *dstMip, 1UL) && MAX(srcSize->height >> *srcMip, 1UL) == MAX(dstSize->height >> *dstMip, 1UL) && MAX(srcSize->depth >> *srcMip, 1UL) == MAX(dstSize->depth >> *dstMip, 1UL) && (*srcMip == 0 || *dstMip == 0) && \"Postcondition does not hold\"");
}

@end