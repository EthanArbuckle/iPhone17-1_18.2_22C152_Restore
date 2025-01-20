@interface SKCameraNode
+ (BOOL)supportsSecureCoding;
- (BOOL)containsNode:(SKNode *)node;
- (NSSet)containedNodeSet;
- (__n128)cameraBoundingBox;
- (double)cameraBoundingBoxOverridingSceneSize:(double)a3;
@end

@implementation SKCameraNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)containsNode:(SKNode *)node
{
  v4 = node;
  v5 = [(SKNode *)self scene];
  if (v5
    && ([(SKNode *)v4 scene],
        v6 = objc_claimAutoreleasedReturnValue(),
        [(SKNode *)self scene],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v5,
        v6 == v7))
  {
    v9 = [(SKNode *)v4 _backingNode];
    [(SKCameraNode *)self cameraBoundingBox];
    float32x2_t v19 = v11;
    float32x4_t v20 = v10;
    float32x2_t v18 = v12;
    *(double *)v13.i64 = SKCNode::getWorldBoundingBox(v9);
    v22.columns[0] = (simd_float4)v13;
    v22.columns[1] = v14;
    v22.columns[2] = (simd_float4)v15;
    v22.columns[3] = v16;
    *(float32x2_t *)v15.f32 = vmul_f32(vsub_f32(v18, *(float32x2_t *)v20.f32), (float32x2_t)0x3F0000003F000000);
    v15.i64[1] = 0x3F80000000000000;
    *(float32x2_t *)v13.f32 = vmul_f32(vsub_f32(v19, *(float32x2_t *)v20.f32), (float32x2_t)0x3F0000003F000000);
    v13.i64[1] = 0x3F80000000000000;
    v21.columns[0] = (simd_float4)vaddq_f32(v13, vaddq_f32(v20, v15));
    v21.columns[1] = (simd_float4)v15;
    v21.columns[2] = (simd_float4)v13;
    v21.columns[3] = 0uLL;
    BOOL v8 = SKCBoundingBoxIntersectsBoundingBox(&v21, &v22);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSSet)containedNodeSet
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  float32x2_t v11 = __Block_byref_object_copy__0;
  float32x2_t v12 = __Block_byref_object_dispose__0;
  id v13 = [MEMORY[0x263EFF9C0] set];
  v3 = [(SKNode *)self scene];
  v4 = v3;
  if (v3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __32__SKCameraNode_containedNodeSet__block_invoke;
    v7[3] = &unk_263FE9F60;
    v7[4] = self;
    v7[5] = &v8;
    [v3 enumerateChildNodesWithName:@"//SKNode" usingBlock:v7];
  }
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

void __32__SKCameraNode_containedNodeSet__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsNode:")) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
  }
}

- (__n128)cameraBoundingBox
{
  v2 = [a1 scene];
  [v2 frame];
  objc_msgSend(a1, "cameraBoundingBoxOverridingSceneSize:", v3, v4);
  long long v7 = v5;

  return (__n128)v7;
}

- (double)cameraBoundingBoxOverridingSceneSize:(double)a3
{
  float v3 = a2 * -0.5;
  float v4 = a3 * -0.5;
  float v5 = a2 * 0.5;
  float v6 = a3 * 0.5;
  long long v7 = xmmword_20AE9A910;
  long long v8 = xmmword_20AE9A910;
  *(float *)&long long v8 = v3;
  long long v9 = v8;
  *((float *)&v9 + 1) = v4;
  *(float *)&long long v7 = v5;
  long long v10 = v7;
  *((float *)&v10 + 1) = v4;
  *((float *)&v7 + 1) = v6;
  long long v19 = v7;
  long long v20 = v9;
  *((float *)&v8 + 1) = v6;
  long long v17 = v10;
  long long v18 = v8;
  __n128 ConversionMatrixToWorld = SKCNode::getConversionMatrixToWorld((SKCNode *)[a1 _backingNode]);
  uint64_t v15 = 0;
  v21[0] = v20;
  v21[1] = v17;
  v21[2] = v19;
  v21[3] = v18;
  do
  {
    *(long long *)((char *)&v22 + v15 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)ConversionMatrixToWorld, COERCE_FLOAT(v21[v15])), v12, *(float32x2_t *)&v21[v15], 1), v13, (float32x4_t)v21[v15], 2), v14, (float32x4_t)v21[v15], 3);
    ++v15;
  }
  while (v15 != 4);
  return *(double *)&v22;
}

@end