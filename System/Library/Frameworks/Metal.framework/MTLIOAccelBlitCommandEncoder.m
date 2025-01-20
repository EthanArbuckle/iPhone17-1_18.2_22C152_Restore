@interface MTLIOAccelBlitCommandEncoder
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

@implementation MTLIOAccelBlitCommandEncoder

- (void)synchronizeResource:(id)a3
{
  MTLReportFailure(0, "-[MTLIOAccelBlitCommandEncoder synchronizeResource:]", 24, @"synchronizeResource: is not supported on this platform", v3, v4, v5, v6, v7);
}

- (void)synchronizeTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  MTLReportFailure(0, "-[MTLIOAccelBlitCommandEncoder synchronizeTexture:slice:level:]", 29, @"synchronizeTexture:slice:level:Resource: is not available on this platform", a5, v5, v6, v7, v8);
}

- (void)updateFence:(id)a3
{
}

- (void)waitForFence:(id)a3
{
}

- (unint64_t)getType
{
  return 2;
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
  -[MTLIOAccelBlitCommandEncoder fillTexture:level:slice:region:color:pixelFormat:](self, "fillTexture:level:slice:region:color:pixelFormat:", a3, a4, a5, v18, v16, var0, var1, var2, var3);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v16.f64[0] = a7.var0;
  v16.f64[1] = a7.var1;
  double var2 = a7.var2;
  double var3 = a7.var3;
  v13 = MTLPackColor(a8, &v16, (uint64_t)v19);
  long long v14 = *(_OWORD *)&a6->var0.var2;
  v15[0] = *(_OWORD *)&a6->var0.var0;
  v15[1] = v14;
  v15[2] = *(_OWORD *)&a6->var1.var1;
  [(MTLIOAccelBlitCommandEncoder *)self fillTexture:a3 level:a4 slice:a5 region:v15 bytes:v19 length:v13];
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  if ((unint64_t)[a3 width] >> a5 < 2) {
    unint64_t v14 = 1;
  }
  else {
    unint64_t v14 = (unint64_t)[a3 width] >> a5;
  }
  if ((unint64_t)[a3 height] >> a5 < 2) {
    unint64_t v15 = 1;
  }
  else {
    unint64_t v15 = (unint64_t)[a3 height] >> a5;
  }
  unint64_t v24 = a5;
  if ((unint64_t)[a3 depth] >> a5 < 2) {
    unint64_t v16 = 1;
  }
  else {
    unint64_t v16 = (unint64_t)[a3 depth] >> a5;
  }
  if (a10)
  {
    uint64_t v28 = 0;
    v17.i64[0] = v14;
    v17.i64[1] = v15;
    uint64x2_t v27 = (uint64x2_t)vdupq_n_s64(1uLL);
    do
    {
      if (a9)
      {
        unint64_t v18 = a4;
        unint64_t v19 = a9;
        unint64_t v20 = a7;
        uint64x2_t v29 = v17;
        do
        {
          memset(v33, 0, 24);
          memset(v32, 0, sizeof(v32));
          uint64x2_t v30 = v17;
          unint64_t v31 = v16;
          [(MTLIOAccelBlitCommandEncoder *)self copyFromTexture:a3 sourceSlice:v18 sourceLevel:v28 + v24 sourceOrigin:v33 sourceSize:&v30 toTexture:a6 destinationSlice:v20 destinationLevel:v28 + a8 destinationOrigin:v32];
          uint64x2_t v17 = v29;
          ++v20;
          ++v18;
          --v19;
        }
        while (v19);
      }
      int8x16_t v21 = (int8x16_t)vshrq_n_u64(v17, 1uLL);
      int8x16_t v22 = (int8x16_t)vcgtq_u64((uint64x2_t)v21, v27);
      uint64x2_t v17 = (uint64x2_t)vsubq_s64((int64x2_t)vandq_s8(v21, v22), (int64x2_t)vmvnq_s8(v22));
      if (v16 >> 1 <= 1) {
        unint64_t v16 = 1;
      }
      else {
        v16 >>= 1;
      }
      ++v28;
    }
    while (v28 != a10);
  }
}

- (void)copyFromTexture:(id)a3 toTexture:(id)a4
{
  unint64_t v7 = [a3 width];
  unint64_t v8 = [a3 height];
  unint64_t v9 = [a3 depth];
  unint64_t v35 = v9;
  unint64_t v36 = v8;
  unint64_t v10 = [a4 width];
  unint64_t v11 = [a4 height];
  unint64_t v12 = [a4 depth];
  unint64_t v33 = v12;
  unint64_t v34 = v11;
  if (v7 <= v10 && v8 <= v11 && v9 <= v12)
  {
    int v15 = 0;
    v13 = &v36;
    unint64_t v14 = &v35;
    unint64_t v8 = v11;
    unint64_t v9 = v12;
    unint64_t v16 = v7;
    unint64_t v7 = v10;
  }
  else
  {
    v13 = &v34;
    unint64_t v14 = &v33;
    int v15 = 1;
    unint64_t v16 = v10;
  }
  uint64_t v17 = 0;
  while (v7 > v16 || v8 > *v13 || v9 > *v14)
  {
    v7 >>= 1;
    v8 >>= 1;
    ++v17;
    v9 >>= 1;
  }
  if (v15) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  if (v15) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = v17;
  }
  unint64_t v20 = [a3 mipmapLevelCount] - v18;
  unint64_t v21 = [a4 mipmapLevelCount] - v19;
  if (v20 >= v21) {
    id v22 = a4;
  }
  else {
    id v22 = a3;
  }
  if (v20 >= v21) {
    uint64_t v23 = v19;
  }
  else {
    uint64_t v23 = v18;
  }
  uint64_t v24 = [v22 mipmapLevelCount] - v23;
  uint64_t v25 = [a3 arrayLength];
  if ((unint64_t)([a3 textureType] - 5) >= 2) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = 6;
  }
  unint64_t v27 = v26 * v25;
  uint64_t v28 = [a4 arrayLength];
  if ((unint64_t)([a4 textureType] - 5) >= 2) {
    uint64_t v29 = 1;
  }
  else {
    uint64_t v29 = 6;
  }
  if (v27 >= v29 * v28) {
    id v30 = a4;
  }
  else {
    id v30 = a3;
  }
  uint64_t v31 = [v30 arrayLength];
  if ((unint64_t)([v30 textureType] - 5) >= 2) {
    uint64_t v32 = 1;
  }
  else {
    uint64_t v32 = 6;
  }
  -[MTLIOAccelBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:](self, "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", a3, 0, v18, a4, 0, v19, v32 * v31, v24, v33, v34);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
}

- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6
{
}

@end