@interface AGXG17FamilyIndirectRenderCommand
- (AGXG17FamilyIndirectRenderCommand)initWithEncoder:(void *)a3 withIndex:(unsigned int)a4;
- (BOOL)hasBarrier;
- (id)drawArguments;
- (id)drawIndexedArguments;
- (id)drawIndexedPatchesArguments;
- (id)drawMeshThreadgroupsArguments;
- (id)drawMeshThreadsArguments;
- (id)drawPatchesArguments;
- (id)getPipelineState;
- (id)getTessellationFactorArguments;
- (unint64_t)getCommandType;
- (unint64_t)getFragmentBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getMeshBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getObjectBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getObjectThreadgroupMemoryLengthAtIndex:(unint64_t)a3;
- (unint64_t)getPipelineStateUniqueIdentifier;
- (unint64_t)getVertexAttributeStrideAtIndex:(unint64_t)a3;
- (unint64_t)getVertexBufferAddressAtIndex:(unint64_t)a3;
- (void)clearBarrier;
- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14;
- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14 tessellationFactorBufferScale:(float)a15;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10;
- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12;
- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12 tessellationFactorBufferScale:(float)a13;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7;
- (void)reset;
- (void)setBarrier;
- (void)setFragmentArguments:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setRenderPipelineState:(id)a3;
- (void)setVertexArguments:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
@end

@implementation AGXG17FamilyIndirectRenderCommand

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  encoder = (uint64_t *)self->_encoder;
  unsigned int index = self->_index;
  v6 = (int *)MEMORY[0x263F4B188];
  uint64_t v8 = *encoder;
  v7 = (_DWORD *)encoder[1];
  *(_DWORD *)(*(void *)(v8 + (int)*MEMORY[0x263F4B188] + 24) + v7[95] + v7[96] * index + 4 * (a4 + 1)) = a3;
  uint64_t v9 = *(void *)(v8 + *v6 + 24);
  uint64_t v10 = v7[95] + v7[96] * index;
  int v11 = *(_DWORD *)(v9 + v10);
  uint64_t v12 = v7[108];
  if (v12)
  {
    v13 = (_DWORD *)(v9 + v7[97] + v7[98] * index);
    v14 = (int *)(v10 + v9 + 4);
    do
    {
      *v13++ = v11;
      int v15 = *v14++;
      v11 += v15;
      --v12;
    }
    while (v12);
    uint64_t v9 = *(void *)(v8 + *v6 + 24);
  }
  uint64_t v16 = v9 + v7[47] + v7[48] * index;
  unsigned int v17 = (v11 + 63) & 0xFFFFFFC0;
  if (v17 == 0x10000) {
    unsigned int v17 = 0;
  }
  __int16 v18 = *(_WORD *)(v16 + 4);
  *(_WORD *)(v16 + 6) = *(_WORD *)(v16 + 6) & 0xFFFC | ((unsigned __int16)v17 >> 14);
  *(_WORD *)(v16 + 4) = v18 & 0x7F | ((v17 != 0) << 7) | ((unsigned __int16)(v17 >> 6) << 8);
}

- (unint64_t)getObjectThreadgroupMemoryLengthAtIndex:(unint64_t)a3
{
  return *(unsigned int *)(*(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
                         + *(_DWORD *)(*((void *)self->_encoder + 1) + 380)
                         + *(_DWORD *)(*((void *)self->_encoder + 1) + 384) * self->_index
                         + 4 * (a3 + 1));
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  encoder = self->_encoder;
  uint64_t v6 = (int)*MEMORY[0x263F4B188];
  uint64_t v7 = encoder[1];
  uint64_t v8 = *(void *)(*encoder + v6 + 24);
  int v9 = *(_DWORD *)(v7 + 196);
  int v10 = *(_DWORD *)(v7 + 200);
  if (a3) {
    uint64_t v11 = *(void *)((char *)a3 + v6 + 8);
  }
  else {
    uint64_t v11 = 0;
  }
  *(void *)(v8 + v9 + v10 * self->_index + 8 * a5) = v11 + a4;
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  encoder = self->_encoder;
  uint64_t v6 = (int)*MEMORY[0x263F4B188];
  uint64_t v7 = encoder[1];
  uint64_t v8 = *(void *)(*encoder + v6 + 24);
  int v9 = *(_DWORD *)(v7 + 212);
  int v10 = *(_DWORD *)(v7 + 216);
  if (a3) {
    uint64_t v11 = *(void *)((char *)a3 + v6 + 8);
  }
  else {
    uint64_t v11 = 0;
  }
  *(void *)(v8 + v9 + v10 * self->_index + 8 * a5) = v11 + a4;
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  encoder = self->_encoder;
  unsigned int index = self->_index;
  uint64_t var0_low = LODWORD(a3->var0);
  unint64_t var1 = a3->var1;
  unsigned __int32 var2 = a3->var2;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v35 = *a4;
  uint64_t v10 = LODWORD(a5->var0);
  unint64_t v11 = a5->var1;
  unsigned int v12 = a5->var2;
  unint64_t v13 = v10 | (v11 << 32);
  uint64_t v14 = encoder[1];
  if (*(unsigned char *)(v14 + 396))
  {
    AGX::IndirectRenderCommandEncoderGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCommonDrawMeshInherited(encoder, index);
    uint64_t v14 = encoder[1];
  }
  unint64_t v15 = (var0_low / v10) | ((unint64_t)(var1 / v11) << 32);
  uint64_t v16 = (int *)MEMORY[0x263F4B188];
  uint64_t v17 = *encoder + (int)*MEMORY[0x263F4B188];
  uint64_t v18 = *(void *)(v17 + 24);
  uint64_t v19 = v18 + *(_DWORD *)(v14 + 228) + *(_DWORD *)(v14 + 232) * index;
  uint64_t v20 = *(_DWORD *)(v14 + 292) + *(_DWORD *)(v14 + 296) * index;
  uint64_t v21 = *(void *)(v17 + 8) + v20;
  uint64_t v22 = v18 + v20;
  *(unsigned char *)(v22 + 51) = 1;
  *(void *)uint64_t v22 = var0_low | (var1 << 32);
  *(_DWORD *)(v22 + 8) = var2;
  *(void *)(v22 + 36) = v15;
  *(_DWORD *)(v22 + 44) = var2 / v12;
  *(void *)(v19 + 56) = v21;
  *(void *)(v22 + 12) = 0x100000001;
  *(_DWORD *)(v22 + 20) = 1;
  *(void *)(v19 + 64) = v21 + 12;
  *(void *)(v22 + 24) = v13;
  *(_DWORD *)(v22 + 32) = v12;
  uint64_t v23 = encoder[1];
  LODWORD(v21) = *(unsigned __int8 *)(v23 + 396);
  uint64_t v24 = *(void *)(*encoder + *v16 + 24);
  uint64_t v25 = *(_DWORD *)(v23 + 140) + *(_DWORD *)(v23 + 144) * index;
  uint64_t v27 = *(unsigned int *)(v23 + 128);
  uint64_t v26 = *(unsigned int *)(v23 + 132);
  uint64_t v28 = v24 + v27;
  BOOL v29 = v21 == 0;
  uint64_t v30 = 36;
  if (v29) {
    uint64_t v30 = 52;
  }
  uint64_t v31 = v28 + v30;
  uint64_t v32 = v24 + v26;
  v33 = (int32x2_t *)(v32 + v25);
  if (v32 != v31 && v32 + v25 >= (unint64_t)(v31 + v25))
  {
    int __pattern4 = 0x20000000;
    memset_pattern4((void *)(v31 + v25), &__pattern4, v32 - v31);
  }
  v33->i32[0] = 1879048192;
  v33->i32[1] = var0_low;
  v33[1].i32[0] = var1;
  v33[1].i32[1] = var2;
  v33[2] = vmovn_s64(*(int64x2_t *)&v35.var0);
  v33[3].i32[0] = v35.var2;
  unint64_t v34 = *(void *)(*encoder + *v16 + 24)
      + *(unsigned int *)(encoder[1] + 136)
      + *(_DWORD *)(encoder[1] + 140)
      + *(_DWORD *)(encoder[1] + 144) * index;
  if (v34 > (unint64_t)&v33[3] + 4)
  {
    int v37 = 0x20000000;
    memset_pattern4((char *)&v33[3] + 4, &v37, v34 - ((void)v33 + 28));
  }
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  encoder = self->_encoder;
  unsigned int index = self->_index;
  unint64_t var0 = a3->var0;
  unint64_t var1 = a3->var1;
  unint64_t var2 = a3->var2;
  unint64_t v11 = a4->var0;
  unint64_t v10 = a4->var1;
  unint64_t v12 = a4->var2;
  int v13 = a5->var2;
  unint64_t v14 = LODWORD(a5->var0) | (a5->var1 << 32);
  unint64_t v15 = v10 << 32;
  unint64_t v16 = a4->var0 | ((unint64_t)v10 << 32);
  unint64_t v17 = a3->var0 | ((unint64_t)var1 << 32);
  uint64_t v18 = encoder[1];
  if (*(unsigned char *)(v18 + 396))
  {
    unint64_t v47 = LODWORD(a5->var0) | (a5->var1 << 32);
    unint64_t v48 = v10 << 32;
    int v19 = index;
    unint64_t v49 = a4->var0;
    unint64_t v11 = a4->var2;
    int v20 = a4->var1;
    int v21 = a5->var2;
    unsigned int v22 = index;
    unint64_t v23 = a3->var0;
    AGX::IndirectRenderCommandEncoderGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCommonDrawMeshInherited(encoder, v19);
    unint64_t v14 = v47;
    unint64_t v15 = v48;
    LODWORD(var0) = v23;
    unsigned int index = v22;
    int v13 = v21;
    LODWORD(v10) = v20;
    LODWORD(v12) = v11;
    LODWORD(v11) = v49;
    uint64_t v18 = encoder[1];
  }
  uint64_t v24 = (int *)MEMORY[0x263F4B188];
  uint64_t v25 = *encoder + (int)*MEMORY[0x263F4B188];
  uint64_t v26 = *(void *)(v25 + 24);
  uint64_t v27 = v26 + *(_DWORD *)(v18 + 228) + *(_DWORD *)(v18 + 232) * index;
  uint64_t v28 = *(_DWORD *)(v18 + 292) + *(_DWORD *)(v18 + 296) * index;
  uint64_t v29 = *(void *)(v25 + 8) + v28;
  uint64_t v30 = v26 + v28;
  *(unsigned char *)(v30 + 51) = 0;
  *(void *)uint64_t v30 = v17;
  *(_DWORD *)(v30 + 8) = var2;
  *(void *)(v30 + 36) = v17;
  *(_DWORD *)(v30 + 44) = var2;
  *(void *)(v27 + 56) = v29;
  *(void *)(v30 + 12) = v16;
  *(_DWORD *)(v30 + 20) = v12;
  *(void *)(v27 + 64) = v29 + 12;
  *(void *)(v30 + 24) = v14;
  *(_DWORD *)(v30 + 32) = v13;
  int v31 = var0 * v11;
  unint64_t v32 = v15 * var1;
  int v33 = var2 * v12;
  uint64_t v34 = encoder[1];
  LODWORD(v26) = *(unsigned __int8 *)(v34 + 396);
  uint64_t v35 = *(void *)(*encoder + *v24 + 24);
  uint64_t v36 = *(_DWORD *)(v34 + 140) + *(_DWORD *)(v34 + 144) * index;
  uint64_t v38 = *(unsigned int *)(v34 + 128);
  uint64_t v37 = *(unsigned int *)(v34 + 132);
  uint64_t v39 = v35 + v38;
  BOOL v40 = v26 == 0;
  uint64_t v41 = 36;
  if (v40) {
    uint64_t v41 = 52;
  }
  uint64_t v42 = v39 + v41;
  uint64_t v43 = v35 + v37;
  v44 = (_DWORD *)(v43 + v36);
  if (v43 != v42 && v43 + v36 >= (unint64_t)(v42 + v36))
  {
    int __pattern4 = 0x20000000;
    v45 = v24;
    memset_pattern4((void *)(v42 + v36), &__pattern4, v43 - v42);
    uint64_t v24 = v45;
  }
  _DWORD *v44 = 1879048192;
  v44[1] = v31;
  v44[2] = HIDWORD(v32);
  v44[3] = v33;
  v44[4] = v11;
  v44[5] = v10;
  v44[6] = v12;
  unint64_t v46 = *(void *)(*encoder + *v24 + 24)
      + *(unsigned int *)(encoder[1] + 136)
      + *(_DWORD *)(encoder[1] + 140)
      + *(_DWORD *)(encoder[1] + 144) * index;
  if (v46 > (unint64_t)(v44 + 7))
  {
    int v51 = 0x20000000;
    memset_pattern4(v44 + 7, &v51, v46 - (void)(v44 + 7));
  }
}

- (unint64_t)getMeshBufferAddressAtIndex:(unint64_t)a3
{
  return *(void *)(*(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
                   + *(_DWORD *)(*((void *)self->_encoder + 1) + 212)
                   + *(_DWORD *)(*((void *)self->_encoder + 1) + 216) * self->_index
                   + 8 * a3);
}

- (unint64_t)getObjectBufferAddressAtIndex:(unint64_t)a3
{
  return *(void *)(*(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
                   + *(_DWORD *)(*((void *)self->_encoder + 1) + 196)
                   + *(_DWORD *)(*((void *)self->_encoder + 1) + 200) * self->_index
                   + 8 * a3);
}

- (id)drawMeshThreadsArguments
{
  v3 = objc_opt_new();
  encoder = self->_encoder;
  v5 = (int *)MEMORY[0x263F4B188];
  uint64_t v6 = *(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24)
     + *(unsigned int *)(encoder[1] + 132)
     + *(_DWORD *)(encoder[1] + 140)
     + *(_DWORD *)(encoder[1] + 144) * self->_index;
  uint64_t v7 = *(void *)(v6 + 4);
  uint64_t v8 = *(unsigned int *)(v6 + 12);
  *(void *)&long long v9 = v7;
  *((void *)&v9 + 1) = HIDWORD(v7);
  long long v21 = v9;
  uint64_t v22 = v8;
  [v3 setThreadsPerGrid:&v21];
  uint64_t v10 = *(void *)(*(void *)self->_encoder + *v5 + 24)
      + *(_DWORD *)(*((void *)self->_encoder + 1) + 292)
      + *(_DWORD *)(*((void *)self->_encoder + 1) + 296) * self->_index;
  uint64_t v11 = *(unsigned int *)(v10 + 20);
  uint64_t v12 = *(void *)(v10 + 12);
  *(void *)&long long v9 = v12;
  *((void *)&v9 + 1) = HIDWORD(v12);
  long long v19 = v9;
  uint64_t v20 = v11;
  [v3 setThreadsPerObjectThreadgroup:&v19];
  uint64_t v13 = *(void *)(*(void *)self->_encoder + *v5 + 24)
      + *(_DWORD *)(*((void *)self->_encoder + 1) + 292)
      + *(_DWORD *)(*((void *)self->_encoder + 1) + 296) * self->_index;
  uint64_t v14 = *(unsigned int *)(v13 + 32);
  uint64_t v15 = *(void *)(v13 + 24);
  *(void *)&long long v9 = v15;
  *((void *)&v9 + 1) = HIDWORD(v15);
  long long v17 = v9;
  uint64_t v18 = v14;
  [v3 setThreadsPerMeshThreadgroup:&v17];
  return v3;
}

- (id)drawMeshThreadgroupsArguments
{
  v3 = objc_opt_new();
  v4 = (int *)MEMORY[0x263F4B188];
  uint64_t v5 = *(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
     + *(_DWORD *)(*((void *)self->_encoder + 1) + 292)
     + *(_DWORD *)(*((void *)self->_encoder + 1) + 296) * self->_index;
  uint64_t v6 = *(unsigned int *)(v5 + 8);
  *(void *)&long long v7 = *(void *)v5;
  *((void *)&v7 + 1) = HIDWORD(*(void *)v5);
  long long v19 = v7;
  uint64_t v20 = v6;
  [v3 setThreadgroupsPerGrid:&v19];
  uint64_t v8 = *(void *)(*(void *)self->_encoder + *v4 + 24)
     + *(_DWORD *)(*((void *)self->_encoder + 1) + 292)
     + *(_DWORD *)(*((void *)self->_encoder + 1) + 296) * self->_index;
  uint64_t v9 = *(unsigned int *)(v8 + 20);
  uint64_t v10 = *(void *)(v8 + 12);
  *(void *)&long long v7 = v10;
  *((void *)&v7 + 1) = HIDWORD(v10);
  long long v17 = v7;
  uint64_t v18 = v9;
  [v3 setThreadsPerObjectThreadgroup:&v17];
  uint64_t v11 = *(void *)(*(void *)self->_encoder + *v4 + 24)
      + *(_DWORD *)(*((void *)self->_encoder + 1) + 292)
      + *(_DWORD *)(*((void *)self->_encoder + 1) + 296) * self->_index;
  uint64_t v12 = *(unsigned int *)(v11 + 32);
  uint64_t v13 = *(void *)(v11 + 24);
  *(void *)&long long v7 = v13;
  *((void *)&v7 + 1) = HIDWORD(v13);
  long long v15 = v7;
  uint64_t v16 = v12;
  [v3 setThreadsPerMeshThreadgroup:&v15];
  return v3;
}

- (id)drawIndexedPatchesArguments
{
  v3 = objc_opt_new();
  v4 = v3;
  encoder = self->_encoder;
  uint64_t v6 = encoder[1];
  int v7 = *(_DWORD *)(v6 + 224);
  uint64_t v8 = (int *)MEMORY[0x263F4B188];
  if (v7 == -1) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = *(unsigned int *)(*(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24)
  }
                         + *(_DWORD *)(v6 + 220)
                         + v7 * self->_index
                         + 84);
  [v3 setNumberOfPatchControlPoints:v9];
  uint64_t v10 = self->_encoder;
  [v4 setPatchStart:*(unsigned int *)(*(void *)(*v10 + *v8 + 24)+ *(unsigned int *)(v10[1] + 132)+ *(_DWORD *)(v10[1] + 140)+ *(_DWORD *)(v10[1] + 144) * self->_index+ 16)];
  uint64_t v11 = self->_encoder;
  [v4 setPatchCount:*(unsigned int *)(*(void *)(*v11 + *v8 + 24)+ *(unsigned int *)(v11[1] + 132)+ *(_DWORD *)(v11[1] + 140)+ *(_DWORD *)(v11[1] + 144) * self->_index+ 8)];
  uint64_t v12 = self->_encoder;
  uint64_t v13 = v12[1];
  int v14 = *(_DWORD *)(v13 + 224);
  if (v14 == -1) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = *(void *)(*(void *)(*v12 + *v8 + 24) + *(_DWORD *)(v13 + 220) + v14 * self->_index + 24);
  }
  [v4 setPatchIndexBufferGPUVirtualAddress:v15];
  uint64_t v16 = self->_encoder;
  uint64_t v17 = v16[1];
  int v18 = *(_DWORD *)(v17 + 224);
  if (v18 == -1) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = *(void *)(*(void *)(*v16 + *v8 + 24) + *(_DWORD *)(v17 + 220) + v18 * self->_index + 32);
  }
  [v4 setControlPointIndexBufferGPUVirtualAddress:v19];
  uint64_t v20 = self->_encoder;
  [v4 setInstanceCount:*(unsigned int *)(*(void *)(*v20 + *v8 + 24)+ *(unsigned int *)(v20[1] + 132)+ *(_DWORD *)(v20[1] + 140)+ *(_DWORD *)(v20[1] + 144) * self->_index+ 12)];
  long long v21 = self->_encoder;
  [v4 setBaseInstance:*(unsigned int *)(*(void *)(*v21 + *v8 + 24)+ *(unsigned int *)(v21[1] + 132)+ *(_DWORD *)(v21[1] + 140)+ *(_DWORD *)(v21[1] + 144) * self->_index+ 20)];

  return v4;
}

- (id)drawPatchesArguments
{
  v3 = objc_opt_new();
  v4 = v3;
  encoder = self->_encoder;
  uint64_t v6 = encoder[1];
  int v7 = *(_DWORD *)(v6 + 224);
  uint64_t v8 = (int *)MEMORY[0x263F4B188];
  if (v7 == -1) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = *(unsigned int *)(*(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24)
  }
                         + *(_DWORD *)(v6 + 220)
                         + v7 * self->_index
                         + 84);
  [v3 setNumberOfPatchControlPoints:v9];
  uint64_t v10 = self->_encoder;
  [v4 setPatchStart:*(unsigned int *)(*(void *)(*v10 + *v8 + 24)+ *(unsigned int *)(v10[1] + 132)+ *(_DWORD *)(v10[1] + 140)+ *(_DWORD *)(v10[1] + 144) * self->_index+ 16)];
  uint64_t v11 = self->_encoder;
  [v4 setPatchCount:*(unsigned int *)(*(void *)(*v11 + *v8 + 24)+ *(unsigned int *)(v11[1] + 132)+ *(_DWORD *)(v11[1] + 140)+ *(_DWORD *)(v11[1] + 144) * self->_index+ 8)];
  uint64_t v12 = self->_encoder;
  uint64_t v13 = v12[1];
  int v14 = *(_DWORD *)(v13 + 224);
  if (v14 == -1) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = *(void *)(*(void *)(*v12 + *v8 + 24) + *(_DWORD *)(v13 + 220) + v14 * self->_index + 24);
  }
  [v4 setPatchIndexBufferGPUVirtualAddress:v15];
  [v4 setPatchIndexBufferOffset:0];
  uint64_t v16 = self->_encoder;
  [v4 setInstanceCount:*(unsigned int *)(*(void *)(*v16 + *v8 + 24)+ *(unsigned int *)(v16[1] + 132)+ *(_DWORD *)(v16[1] + 140)+ *(_DWORD *)(v16[1] + 144) * self->_index+ 12)];
  uint64_t v17 = self->_encoder;
  [v4 setBaseInstance:*(unsigned int *)(*(void *)(*v17 + *v8 + 24)+ *(unsigned int *)(v17[1] + 132)+ *(_DWORD *)(v17[1] + 140)+ *(_DWORD *)(v17[1] + 144) * self->_index+ 20)];

  return v4;
}

- (id)drawIndexedArguments
{
  v3 = objc_opt_new();
  v4 = v3;
  encoder = self->_encoder;
  uint64_t v6 = (int *)MEMORY[0x263F4B188];
  unsigned int v7 = ((*(_DWORD *)(*(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24)
                   + *(_DWORD *)(encoder[1] + 140)
                   + *(_DWORD *)(encoder[1] + 144) * self->_index
                   + (unint64_t)*(unsigned int *)(encoder[1] + 132)) >> 8) & 0xF)
     - 1;
  if (v7 > 0xA) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = dword_242EB2F78[v7];
  }
  [v3 setPrimitiveType:v8];
  uint64_t v9 = self->_encoder;
  [v4 setIndexCount:*(unsigned int *)(*(void *)(*v9 + *v6 + 24)+ *(unsigned int *)(v9[1] + 132)+ *(_DWORD *)(v9[1] + 140)+ *(_DWORD *)(v9[1] + 144) * self->_index+ 8)];
  uint64_t v10 = self->_encoder;
  [v4 setIndexType:((*(_DWORD *)(*(void *)(*v10 + *v6 + 24)+ *(_DWORD *)(v10[1] + 140)+ *(_DWORD *)(v10[1] + 144) * self->_index+ (unint64_t)*(unsigned int *)(v10[1] + 132)) >> 17) & 3u)- 1];
  uint64_t v11 = self->_encoder;
  uint64_t v12 = (unsigned __int8 *)(*(void *)(*v11 + *v6 + 24)
                          + *(unsigned int *)(v11[1] + 132)
                          + *(_DWORD *)(v11[1] + 140)
                          + *(_DWORD *)(v11[1] + 144) * self->_index);
  [v4 setIndexBufferGPUVirtualAddress:*((unsigned int *)v12 + 1) | ((unint64_t)v12[24] << 40) | ((unint64_t)*v12 << 32)];
  uint64_t v13 = self->_encoder;
  [v4 setInstanceCount:*(unsigned int *)(*(void *)(*v13 + *v6 + 24)+ *(unsigned int *)(v13[1] + 132)+ *(_DWORD *)(v13[1] + 140)+ *(_DWORD *)(v13[1] + 144) * self->_index+ 12)];
  int v14 = self->_encoder;
  [v4 setBaseVertex:*(unsigned int *)(*(void *)(*v14 + *v6 + 24)+ *(unsigned int *)(v14[1] + 132)+ *(_DWORD *)(v14[1] + 140)+ *(_DWORD *)(v14[1] + 144) * self->_index+ 16)];
  uint64_t v15 = self->_encoder;
  uint64_t v16 = v15[1];
  int v17 = *(_DWORD *)(v16 + 224);
  if (v17 == -1) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = *(unsigned int *)(*(void *)(*v15 + *v6 + 24) + *(_DWORD *)(v16 + 220) + v17 * self->_index + 16);
  }
  [v4 setBaseInstance:v18];

  return v4;
}

- (id)drawArguments
{
  v3 = objc_opt_new();
  v4 = v3;
  encoder = self->_encoder;
  uint64_t v6 = (int *)MEMORY[0x263F4B188];
  unsigned int v7 = ((*(_DWORD *)(*(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24)
                   + *(_DWORD *)(encoder[1] + 140)
                   + *(_DWORD *)(encoder[1] + 144) * self->_index
                   + (unint64_t)*(unsigned int *)(encoder[1] + 132)) >> 8) & 0xF)
     - 1;
  if (v7 > 0xA) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = dword_242EB2F78[v7];
  }
  [v3 setPrimitiveType:v8];
  uint64_t v9 = self->_encoder;
  [v4 setVertexStart:*(unsigned int *)(*(void *)(*v9 + *v6 + 24)+ *(unsigned int *)(v9[1] + 132)+ *(_DWORD *)(v9[1] + 140)+ *(_DWORD *)(v9[1] + 144) * self->_index+ 12)];
  uint64_t v10 = self->_encoder;
  [v4 setVertexCount:*(unsigned int *)(*(void *)(*v10 + *v6 + 24)+ *(unsigned int *)(v10[1] + 132)+ *(_DWORD *)(v10[1] + 140)+ *(_DWORD *)(v10[1] + 144) * self->_index+ 4)];
  uint64_t v11 = self->_encoder;
  [v4 setInstanceCount:*(unsigned int *)(*(void *)(*v11 + *v6 + 24)+ *(unsigned int *)(v11[1] + 132)+ *(_DWORD *)(v11[1] + 140)+ *(_DWORD *)(v11[1] + 144) * self->_index+ 8)];
  [v4 setBaseInstance:*(unsigned int *)(*(void *)(*(void *)self->_encoder + *v6 + 24)+ *(_DWORD *)(*((void *)self->_encoder + 1) + 220)+ *(_DWORD *)(*((void *)self->_encoder + 1) + 224) * self->_index+ 16)];

  return v4;
}

- (unint64_t)getCommandType
{
  encoder = self->_encoder;
  unsigned int index = self->_index;
  v4 = (unsigned int *)encoder[1];
  uint64_t v5 = *(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24);
  unsigned int v6 = v4[56];
  if (v6 == -1) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = *(void *)(v5 + v4[55] + v6 * index + 32);
  }
  unsigned int v8 = *(_DWORD *)(v5 + v4[35] + v4[36] * index + (unint64_t)v4[33]);
  if ((v8 & 0xF0200000) == 0x60000000) {
    return 1;
  }
  if ((v8 & 0xF0200000) == 0x60200000) {
    return 2;
  }
  if (!v7) {
    goto LABEL_15;
  }
  unsigned int v10 = v8 & 0xE0000000;
  if (v7 == 0x1EEEE1111 && v10 == -1610612736) {
    return 4;
  }
  if (v7 != 0x1EEEE1111 && v10 == -1610612736) {
    return 8;
  }
LABEL_15:
  if (v8 >> 28 != 7) {
    return 0;
  }
  if (*(unsigned char *)(v5 + v4[73] + v4[74] * index + 51)) {
    return 256;
  }
  return 128;
}

- (id)getPipelineState
{
  return 0;
}

- (BOOL)hasBarrier
{
  return *(_DWORD *)(*(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
                   + *(_DWORD *)(*((void *)self->_encoder + 1) + 140)
                   + *(_DWORD *)(*((void *)self->_encoder + 1) + 144) * self->_index) == 553648480;
}

- (void)clearBarrier
{
  *(_DWORD *)(*(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
            + *(_DWORD *)(*((void *)self->_encoder + 1) + 140)
            + *(_DWORD *)(*((void *)self->_encoder + 1) + 144) * self->_index) = 0x20000000;
}

- (void)setBarrier
{
  *(_DWORD *)(*(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
            + *(_DWORD *)(*((void *)self->_encoder + 1) + 140)
            + *(_DWORD *)(*((void *)self->_encoder + 1) + 144) * self->_index) = 553648480;
}

- (void)reset
{
  encoder = (uint64_t *)self->_encoder;
  unsigned int index = self->_index;
  v4 = (int *)MEMORY[0x263F4B188];
  uint64_t v6 = *encoder;
  uint64_t v5 = encoder[1];
  *(void *)(*(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24)
            + *(_DWORD *)(v5 + 364)
            + *(_DWORD *)(v5 + 368) * index) = 0;
  if (!*(unsigned char *)(v5 + 397))
  {
    bzero((void *)(*(void *)(v6 + *v4 + 24) + *(_DWORD *)(v5 + 164) + *(_DWORD *)(v5 + 168) * index), *(unsigned int *)(v5 + 168));
    uint64_t v5 = encoder[1];
    if (*(unsigned char *)(v5 + 436))
    {
      bzero((void *)(*(void *)(*encoder + *v4 + 24) + *(_DWORD *)(v5 + 180) + *(_DWORD *)(v5 + 184) * index), *(unsigned int *)(v5 + 184));
      uint64_t v5 = encoder[1];
    }
    if (*(unsigned char *)(v5 + 439))
    {
      bzero((void *)(*(void *)(*encoder + *v4 + 24) + *(_DWORD *)(v5 + 212) + *(_DWORD *)(v5 + 216) * index), *(unsigned int *)(v5 + 216));
      bzero((void *)(*(void *)(*encoder + *v4 + 24) + *(_DWORD *)(encoder[1] + 196)+ *(_DWORD *)(encoder[1] + 200) * index), *(unsigned int *)(encoder[1] + 200));
      uint64_t v5 = encoder[1];
    }
    uint64_t v6 = *encoder;
    if (*(unsigned char *)(v5 + 441))
    {
      bzero((void *)(*(void *)(v6 + *v4 + 24) + *(_DWORD *)(v5 + 340) + *(_DWORD *)(v5 + 344) * index), *(unsigned int *)(v5 + 344));
      uint64_t v6 = *encoder;
      uint64_t v5 = encoder[1];
    }
  }
  size_t v7 = *(unsigned int *)(v5 + 144);
  unsigned int v8 = (void *)(*(void *)(v6 + *v4 + 24) + *(_DWORD *)(v5 + 140) + v7 * index);
  int __pattern4 = 0x20000000;
  memset_pattern4(v8, &__pattern4, v7);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  unsigned int v50 = a4;
  unsigned int v51 = a8;
  unsigned int v10 = a7;
  int v12 = a5;
  encoder = (uint64_t *)self->_encoder;
  unsigned int index = self->_index;
  uint64_t v16 = encoder[1];
  int v17 = (int *)MEMORY[0x263F4B188];
  if (*(unsigned char *)(v16 + 396))
  {
    AGX::IndirectRenderCommandEncoderGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCommonDrawInherited((void *)self->_encoder, index, a3);
    goto LABEL_9;
  }
  uint64_t v18 = *(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24) + *(_DWORD *)(v16 + 148) + *(_DWORD *)(v16 + 152) * index;
  unsigned int v19 = *(_DWORD *)(v18 + 32) & 0xFF7FFFFF;
  *(_DWORD *)(v18 + 32) = v19;
  if (a3 > 8) {
    goto LABEL_7;
  }
  if (((1 << a3) & 0x1D8) != 0)
  {
    *(int8x8_t *)(v18 + 36) = vand_s8(*(int8x8_t *)(v18 + 36), (int8x8_t)vdup_n_s32(0xFF3FFFFu));
    goto LABEL_9;
  }
  int8x8_t v20 = (int8x8_t)0x1000000010000000;
  if (((1 << a3) & 0x26) == 0) {
LABEL_7:
  }
    int8x8_t v20 = (int8x8_t)0x4000000040000000;
  *(int8x8_t *)(v18 + 36) = vorr_s8((int8x8_t)(*(void *)(v18 + 36) & 0xFFFFFFF0FFFFFFFLL), v20);
  *(_DWORD *)(v18 + 32) = v19 | 0x4000000;
LABEL_9:
  uint64_t v21 = *encoder;
  uint64_t v22 = encoder[1];
  uint64_t v23 = *encoder + *v17;
  uint64_t v24 = *(void *)(v23 + 24);
  uint64_t v25 = (void *)(v24 + *(_DWORD *)(v22 + 220) + *(_DWORD *)(v22 + 224) * index);
  uint64_t v26 = *(_DWORD *)(v22 + 284) + *(_DWORD *)(v22 + 288) * index;
  uint64_t v27 = *(void *)(v23 + 8) + v26;
  uint64_t v28 = (void *)(v24 + v26);
  *uint64_t v25 = v27;
  v25[1] = v27 + 8;
  v25[2] = a10;
  *uint64_t v28 = a9;
  v28[1] = a10;
  uint64_t v29 = *v17;
  uint64_t v30 = *(void *)((char *)a6 + v29 + 8) + v10;
  unint64_t v31 = (unint64_t)(*(void *)((char *)a6 + v29 + 16) + 3) >> 2;
  BOOL v32 = a3 == 4 || a3 == 2;
  int v33 = v32;
  uint64_t v34 = *(void *)(v21 + v29 + 24)
      + *(unsigned int *)(v22 + 128)
      + *(_DWORD *)(v22 + 140)
      + *(_DWORD *)(v22 + 144) * index;
  uint64_t v35 = 12;
  if (!*(unsigned char *)(v22 + 396)) {
    uint64_t v35 = 24;
  }
  uint64_t v36 = -3221225471;
  if (!v12) {
    uint64_t v36 = 0xFFFF40000001;
  }
  *(void *)(v34 + v35) = v36;
  uint64_t v37 = encoder[1];
  int v38 = *(unsigned __int8 *)(v37 + 396);
  uint64_t v39 = *(void *)(*encoder + *v17 + 24);
  uint64_t v40 = *(_DWORD *)(v37 + 140) + *(_DWORD *)(v37 + 144) * index;
  uint64_t v42 = *(unsigned int *)(v37 + 128);
  uint64_t v41 = *(unsigned int *)(v37 + 132);
  uint64_t v43 = v39 + v42;
  BOOL v32 = v38 == 0;
  uint64_t v44 = 20;
  if (v32) {
    uint64_t v44 = 32;
  }
  uint64_t v45 = v43 + v44;
  uint64_t v46 = v39 + v41;
  unint64_t v47 = (unsigned int *)(v46 + v40);
  if (v46 != v45 && v46 + v40 >= (unint64_t)(v45 + v40))
  {
    int __pattern4 = 0x20000000;
    memset_pattern4((void *)(v45 + v40), &__pattern4, v46 - v45);
  }
  if (v33) {
    int v48 = 0x10000;
  }
  else {
    int v48 = 0;
  }
  *unint64_t v47 = BYTE4(v30) | v48 | (AGX::VDMEncoderGen5<AGX::HAL200::ESLEncoder,AGX::HAL200::DeviceConstants,AGX::HAL200::VsStateConfig>::PrimitiveTypeToVDMCTRLTypeIndexedDraw[a3]
                           + (v12 << 17)) & 0xFFEEFF00 | 0x100000;
  v47[1] = v30;
  v47[2] = v50;
  v47[3] = v51;
  v47[4] = a9;
  v47[5] = v31 - 1;
  v47[6] = BYTE5(v30);
  unint64_t v49 = *(void *)(*encoder + *v17 + 24)
      + *(unsigned int *)(encoder[1] + 136)
      + *(_DWORD *)(encoder[1] + 140)
      + *(_DWORD *)(encoder[1] + 144) * index;
  if (v49 > (unint64_t)(v47 + 7))
  {
    int v53 = 0x20000000;
    memset_pattern4(v47 + 7, &v53, v49 - (void)(v47 + 7));
  }
}

- (unint64_t)getPipelineStateUniqueIdentifier
{
  return *(void *)(*(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
                   + *(_DWORD *)(*((void *)self->_encoder + 1) + 364)
                   + *(_DWORD *)(*((void *)self->_encoder + 1) + 368) * self->_index);
}

- (id)getTessellationFactorArguments
{
  v3 = objc_opt_new();
  encoder = self->_encoder;
  uint64_t v5 = (int *)MEMORY[0x263F4B188];
  uint64_t v6 = (unsigned __int8 *)(*(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24)
                         + *(unsigned int *)(encoder[1] + 132)
                         + *(_DWORD *)(encoder[1] + 140)
                         + *(_DWORD *)(encoder[1] + 144) * self->_index);
  [v3 setGPUVirtualAddress:*((unsigned int *)v6 + 1) | ((unint64_t)*v6 << 32) | ((unint64_t)v6[32] << 40)];
  size_t v7 = self->_encoder;
  [v3 setInstanceStride:4* (*(_DWORD *)(*(void *)(*v7 + *v5 + 24)+ *(unsigned int *)(v7[1] + 132)+ *(_DWORD *)(v7[1] + 140)+ *(_DWORD *)(v7[1] + 144) * self->_index+ 24) & 0x7FFFF)];
  uint64_t v9 = self->_encoder;
  uint64_t v10 = v9[1];
  int v11 = *(_DWORD *)(v10 + 352);
  if (v11 == -1)
  {
    double v8 = 0.0;
    goto LABEL_13;
  }
  unsigned int v12 = *(__int16 *)(*(void *)(*v9 + *v5 + 24) + *(_DWORD *)(v10 + 348) + v11 * self->_index + 4);
  unsigned int v13 = v12 & 0x80000000;
  int v14 = (v12 >> 10) & 0x1F;
  int v15 = (unsigned __int16)v12 << 13;
  unsigned int v16 = v15 & 0x7FE000;
  if (v14 == 31)
  {
    if (v16) {
      int v19 = 2143289344;
    }
    else {
      int v19 = 2139095040;
    }
    int v18 = v13 | v15 | v19;
    goto LABEL_12;
  }
  if (v14)
  {
LABEL_6:
    int v18 = ((v16 | (v14 << 23)) + 939524096) | v13;
LABEL_12:
    LODWORD(v8) = v18;
    goto LABEL_13;
  }
  if (v16)
  {
    unsigned int v17 = __clz(v16);
    int v14 = 9 - v17;
    unsigned int v16 = (v15 << (v17 - 8)) & 0x7FE000;
    goto LABEL_6;
  }
  *(void *)&double v8 = 0x8000000080000000;
  if (!v13) {
    *(float *)&double v8 = 0.0;
  }
LABEL_13:
  [v3 setScale:v8];

  return v3;
}

- (unint64_t)getVertexAttributeStrideAtIndex:(unint64_t)a3
{
  encoder = self->_encoder;
  uint64_t v4 = encoder[1];
  if (!*(unsigned char *)(v4 + 441)) {
    return -1;
  }
  unint64_t result = *(unsigned int *)(*(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24)
                           + *(_DWORD *)(v4 + 340)
                           + *(_DWORD *)(v4 + 344) * self->_index
                           + 4 * a3);
  if (result == -1) {
    return -1;
  }
  return result;
}

- (unint64_t)getFragmentBufferAddressAtIndex:(unint64_t)a3
{
  return *(void *)(*(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
                   + *(_DWORD *)(*((void *)self->_encoder + 1) + 164)
                   + *(_DWORD *)(*((void *)self->_encoder + 1) + 168) * self->_index
                   + 8 * a3);
}

- (unint64_t)getVertexBufferAddressAtIndex:(unint64_t)a3
{
  encoder = self->_encoder;
  uint64_t v4 = encoder[1];
  int v5 = *(_DWORD *)(v4 + 184);
  if (v5 == -1) {
    return 0;
  }
  else {
    return *(void *)(*(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24)
  }
                     + *(_DWORD *)(v4 + 180)
                     + v5 * self->_index
                     + 8 * a3);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14
{
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12
{
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14 tessellationFactorBufferScale:(float)a15
{
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12 tessellationFactorBufferScale:(float)a13
{
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  unsigned int v7 = a7;
  int v8 = a6;
  int v9 = a5;
  unsigned int v10 = a4;
  int v11 = a3;
  encoder = (uint64_t *)self->_encoder;
  unsigned int index = self->_index;
  uint64_t v14 = encoder[1];
  int v15 = (int *)MEMORY[0x263F4B188];
  if (*(unsigned char *)(v14 + 396))
  {
    AGX::IndirectRenderCommandEncoderGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeCommonDrawInherited((void *)self->_encoder, index, a3);
    goto LABEL_9;
  }
  uint64_t v16 = *(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24) + *(_DWORD *)(v14 + 148) + *(_DWORD *)(v14 + 152) * index;
  unsigned int v17 = *(_DWORD *)(v16 + 32) & 0xFF7FFFFF;
  *(_DWORD *)(v16 + 32) = v17;
  if (a3 > 8) {
    goto LABEL_7;
  }
  if (((1 << a3) & 0x1D8) != 0)
  {
    *(int8x8_t *)(v16 + 36) = vand_s8(*(int8x8_t *)(v16 + 36), (int8x8_t)vdup_n_s32(0xFF3FFFFu));
    goto LABEL_9;
  }
  int8x8_t v18 = (int8x8_t)0x1000000010000000;
  if (((1 << a3) & 0x26) == 0) {
LABEL_7:
  }
    int8x8_t v18 = (int8x8_t)0x4000000040000000;
  *(int8x8_t *)(v16 + 36) = vorr_s8((int8x8_t)(*(void *)(v16 + 36) & 0xFFFFFFF0FFFFFFFLL), v18);
  *(_DWORD *)(v16 + 32) = v17 | 0x4000000;
LABEL_9:
  uint64_t v19 = *encoder;
  uint64_t v20 = encoder[1];
  uint64_t v21 = *encoder + *v15;
  uint64_t v22 = *(void *)(v21 + 24);
  uint64_t v23 = (void *)(v22 + *(_DWORD *)(v20 + 220) + *(_DWORD *)(v20 + 224) * index);
  uint64_t v24 = *(_DWORD *)(v20 + 284) + *(_DWORD *)(v20 + 288) * index;
  uint64_t v25 = *(void *)(v21 + 8) + v24;
  uint64_t v26 = (void *)(v22 + v24);
  *uint64_t v23 = v25;
  v23[1] = v25 + 8;
  v23[2] = v7;
  *uint64_t v26 = v10;
  v26[1] = v7;
  LODWORD(v25) = *(unsigned __int8 *)(v20 + 396);
  uint64_t v27 = *(void *)(v19 + *v15 + 24);
  uint64_t v28 = *(_DWORD *)(v20 + 140) + *(_DWORD *)(v20 + 144) * index;
  uint64_t v30 = *(unsigned int *)(v20 + 128);
  uint64_t v29 = *(unsigned int *)(v20 + 132);
  uint64_t v31 = v27 + v30;
  BOOL v32 = v25 == 0;
  uint64_t v33 = 12;
  if (v32) {
    uint64_t v33 = 24;
  }
  uint64_t v34 = (_DWORD *)(v31 + v33 + v28);
  uint64_t v35 = (char *)(v27 + v29 + v28);
  if (v35 > (char *)v34)
  {
    int __pattern4 = 0x20000000;
    memset_pattern4(v34, &__pattern4, v35 - (char *)v34);
  }
  *(_DWORD *)uint64_t v35 = AGX::VDMEncoderGen5<AGX::HAL200::ESLEncoder,AGX::HAL200::DeviceConstants,AGX::HAL200::VsStateConfig>::PrimitiveTypeToVDMCTRLTypeNonIndexedDraw[v11] & 0xFFFEFFFF;
  *((_DWORD *)v35 + 1) = v9;
  *((_DWORD *)v35 + 2) = v8;
  *((_DWORD *)v35 + 3) = v10;
  unint64_t v36 = *(void *)(*encoder + *v15 + 24)
      + *(unsigned int *)(encoder[1] + 136)
      + *(_DWORD *)(encoder[1] + 140)
      + *(_DWORD *)(encoder[1] + 144) * index;
  if (v36 > (unint64_t)(v35 + 16))
  {
    int v38 = 0x20000000;
    memset_pattern4(v35 + 16, &v38, v36 - (void)(v35 + 16));
  }
}

- (void)setFragmentArguments:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  encoder = self->_encoder;
  uint64_t v6 = (int)*MEMORY[0x263F4B188];
  uint64_t v7 = encoder[1];
  uint64_t v8 = *(void *)(*encoder + v6 + 24);
  int v9 = *(_DWORD *)(v7 + 164);
  int v10 = *(_DWORD *)(v7 + 168);
  if (a3) {
    uint64_t v11 = *(void *)((char *)a3 + v6 + 8);
  }
  else {
    uint64_t v11 = 0;
  }
  *(void *)(v8 + v9 + v10 * self->_index + 8 * a5) = v11 + a4;
}

- (void)setVertexArguments:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  encoder = (uint64_t *)self->_encoder;
  unsigned int index = self->_index;
  uint64_t v7 = (int *)MEMORY[0x263F4B188];
  uint64_t v8 = (int)*MEMORY[0x263F4B188];
  uint64_t v10 = *encoder;
  uint64_t v9 = encoder[1];
  uint64_t v11 = *(void *)(v10 + v8 + 24) + *(_DWORD *)(v9 + 180) + *(_DWORD *)(v9 + 184) * index;
  if (a3) {
    uint64_t v12 = *(void *)((char *)a3 + v8 + 8);
  }
  else {
    uint64_t v12 = 0;
  }
  *(void *)(v11 + 8 * a5) = v12 + a4;
  if (*(unsigned char *)(v9 + 441)) {
    *(_DWORD *)(*(void *)(v10 + *v7 + 24)
  }
              + *(_DWORD *)(v9 + 340)
              + *(_DWORD *)(v9 + 344) * index
              + 4 * a5) = -1;
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  encoder = self->_encoder;
  uint64_t v6 = (int)*MEMORY[0x263F4B188];
  uint64_t v7 = encoder[1];
  uint64_t v8 = *(void *)(*encoder + v6 + 24);
  int v9 = *(_DWORD *)(v7 + 164);
  int v10 = *(_DWORD *)(v7 + 168);
  if (a3) {
    uint64_t v11 = *(void *)((char *)a3 + v6 + 8);
  }
  else {
    uint64_t v11 = 0;
  }
  *(void *)(v8 + v9 + v10 * self->_index + 8 * a5) = v11 + a4;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  encoder = (uint64_t *)self->_encoder;
  unsigned int index = self->_index;
  uint64_t v8 = (int *)MEMORY[0x263F4B188];
  uint64_t v9 = (int)*MEMORY[0x263F4B188];
  uint64_t v11 = *encoder;
  uint64_t v10 = encoder[1];
  uint64_t v12 = *(void *)(v11 + v9 + 24) + *(_DWORD *)(v10 + 180) + *(_DWORD *)(v10 + 184) * index;
  if (a3) {
    uint64_t v13 = *(void *)((char *)a3 + v9 + 8);
  }
  else {
    uint64_t v13 = 0;
  }
  *(void *)(v12 + 8 * a6) = v13 + a4;
  if (*(unsigned char *)(v10 + 441)) {
    *(_DWORD *)(*(void *)(v11 + *v8 + 24)
  }
              + *(_DWORD *)(v10 + 340)
              + *(_DWORD *)(v10 + 344) * index
              + 4 * a6) = a5;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  encoder = (uint64_t *)self->_encoder;
  unsigned int index = self->_index;
  uint64_t v7 = (int *)MEMORY[0x263F4B188];
  uint64_t v8 = (int)*MEMORY[0x263F4B188];
  uint64_t v10 = *encoder;
  uint64_t v9 = encoder[1];
  uint64_t v11 = *(void *)(v10 + v8 + 24) + *(_DWORD *)(v9 + 180) + *(_DWORD *)(v9 + 184) * index;
  if (a3) {
    uint64_t v12 = *(void *)((char *)a3 + v8 + 8);
  }
  else {
    uint64_t v12 = 0;
  }
  *(void *)(v11 + 8 * a5) = v12 + a4;
  if (*(unsigned char *)(v9 + 441)) {
    *(_DWORD *)(*(void *)(v10 + *v7 + 24)
  }
              + *(_DWORD *)(v9 + 340)
              + *(_DWORD *)(v9 + 344) * index
              + 4 * a5) = -1;
}

- (void)setRenderPipelineState:(id)a3
{
  encoder = self->_encoder;
  unsigned int index = self->_index;
  uint64_t v14 = (int8x8_t **)((char *)a3 + 144);
  int v15 = (int *)MEMORY[0x263F4B188];
  uint64_t v17 = *encoder;
  uint64_t v16 = (_DWORD *)encoder[1];
  uint64_t v18 = *encoder + (int)*MEMORY[0x263F4B188];
  uint64_t v19 = *(void *)(v18 + 24);
  if (*((unsigned char *)a3 + 853)) {
    uint64_t v20 = (char *)*((void *)a3 + 127);
  }
  else {
    uint64_t v20 = (char *)a3 + 144;
  }
  int v21 = v16[39];
  int v22 = v16[40];
  uint64_t v23 = *(void *)(v18 + 8);
  *(void *)(v19 + v16[91] + v16[92] * index) = v20;
  unint64_t v24 = *((_DWORD *)a3 + 225) & 0x20000;
  uint64_t v25 = (int8x8_t *)*((void *)a3 + 22);
  if (v25)
  {
    unint64_t v26 = v23 + v16[47] + v16[48] * index;
    unint64_t v27 = v23 + v16[51] + v16[52] * index;
    uint64_t v28 = *((void *)a3 + 21);
    unsigned int v4 = *(_DWORD *)(v28 + 3212);
    int v29 = *((_DWORD *)a3 + 245);
    if (v24) {
      int v30 = 48;
    }
    else {
      int v30 = 16;
    }
    v31.i32[0] = v30;
    v31.i32[1] = *(_DWORD *)(v28 + 3200) & 0xFFF;
    if (v29) {
      unsigned int v4 = v4 & 0xFFFFFF80 | ((v29 + 1023) >> 10) & 0x7F;
    }
    int8x8_t v32 = v25[418];
    __int32 v33 = v25[419].i32[1];
    int v3 = v25[403].i32[1];
    __int32 v5 = v25[406].i32[0];
    int8x8_t v34 = vand_s8(v25[404], (int8x8_t)0xFFF0000FFFFFFCFLL);
    int8x8_t v35 = v25[420];
    int8x8_t v36 = v25[421];
    int8x8_t v10 = v25[407];
    int v8 = (v26 >> 16) & 0xFFC00000 | *(_DWORD *)(v28 + 3204) & 0x3FFFFF;
    unint64_t v6 = v26 >> 6;
    int v9 = (v27 >> 16) & 0xFFC00000 | v25[405].i32[0] & 0x3FFFFF;
    unint64_t v7 = v27 >> 6;
    uint64_t v37 = *(void *)(v17 + *v15 + 24);
    int v38 = (unsigned char *)(v37 + v16[73] + v16[74] * index);
    v38[50] = *(unsigned char *)(v28 + 3410);
    unsigned int v39 = v25[410].u32[1];
    char v40 = v39 == 1;
    if (v39 == 3) {
      char v40 = 6;
    }
    v38[48] = v40;
    if (v39 >= 4) {
      char v41 = 0;
    }
    else {
      char v41 = 0x104u >> (8 * v39);
    }
    v38[49] = v41;
    *(_DWORD *)(v37 + v16[59] + v16[60] * index + 104) = 4 * v25[438].i32[0];
    *(_DWORD *)(*(void *)(v17 + *v15 + 24) + v16[95] + v16[96] * index) = 4 * *(_DWORD *)(v28 + 3256);
    uint64_t v42 = *v15;
    uint64_t v43 = *(void *)(v17 + v42 + 24);
    uint64_t v44 = v16[95] + v16[96] * index;
    int v45 = *(_DWORD *)(v43 + v44);
    uint64_t v46 = v16[108];
    if (v46)
    {
      unint64_t v47 = (_DWORD *)(v43 + v16[97] + v16[98] * index);
      int v48 = (int *)(v44 + v43 + 4);
      do
      {
        *v47++ = v45;
        int v49 = *v48++;
        v45 += v49;
        --v46;
      }
      while (v46);
      uint64_t v42 = *v15;
    }
    int8x8_t v11 = vorr_s8(v34, v31);
    uint64_t v50 = *(void *)(*encoder + v42 + 24) + *(_DWORD *)(encoder[1] + 188) + *(_DWORD *)(encoder[1] + 192) * index;
    unsigned int v51 = (v45 + 63) & 0xFFFFFFC0;
    if (v51 == 0x10000) {
      unsigned int v51 = 0;
    }
    __int16 v52 = *(_WORD *)(v50 + 4);
    *(_WORD *)(v50 + 6) = *(_WORD *)(v50 + 6) & 0xFFFC | ((unsigned __int16)v51 >> 14);
    *(_WORD *)(v50 + 4) = v52 & 0x7F | ((v51 != 0) << 7) | ((unsigned __int16)(v51 >> 6) << 8);
    int v152 = v50;
    LODWORD(v153) = v50;
    if (v24)
    {
LABEL_22:
      int v53 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    unint64_t v54 = v23 + v16[43] + v16[44] * index;
    uint64_t v55 = *((void *)a3 + 19);
    int8x8_t v32 = *(int8x8_t *)(v55 + 3576);
    __int32 v33 = *(_DWORD *)(v55 + 3584);
    int8x8_t v35 = *(int8x8_t *)(v55 + 3588);
    int8x8_t v36 = *(int8x8_t *)(v55 + 3596);
    uint64_t v56 = v55 + 28 * ((v24 >> 17) ^ 1);
    int v152 = (v54 >> 16) & 0xFFC00000 | *(_DWORD *)(v56 + 3368) & 0x3FFFFF;
    unint64_t v153 = v54 >> 6;
    unsigned int v148 = *(_DWORD *)(v56 + 3360) & 0xFFFFFFDF;
    int v149 = *(_DWORD *)(v56 + 3364);
    uint64_t v158 = *(void *)(v56 + 3376);
    if (*(_DWORD *)(v55 + 3744))
    {
      uint64_t v57 = *(void *)(v17 + *v15 + 24);
      int v58 = *((_DWORD *)a3 + 208);
      int v59 = *((_DWORD *)a3 + 207);
      int v60 = *((_DWORD *)a3 + 212);
      int v61 = *((_DWORD *)a3 + 210);
      int v62 = *((_DWORD *)v14 + 175);
      uint64_t v63 = v16[87] + v16[88] * index;
      char v64 = *(unsigned char *)(v55 + 3736);
      int v3 = *(unsigned char *)(v57 + v63) & 0xF0 | v64 & 1 | (2 * (v61 & 3)) & 0xF7 | (8 * (v62 & 1));
      *(unsigned char *)(v57 + v63) = *(unsigned char *)(v57 + v63) & 0xF0 | v64 & 1 | (2 * (v61 & 3)) & 0xF7 | (8 * (v62 & 1));
      LODWORD(v63) = (((v60 - (v58 == 2)) << 23) + 528482304) & 0x1F800000 | (v58 << 30) | ((v59 & 1) << 29) | (*(unsigned __int8 *)(v55 + 3749) << 16) | ((v61 & 3) << 17) | ((v62 & 1) << 19) | ((*(_DWORD *)(v55 + 3736) & 1) << 20) | 0x200000;
      v65 = (_DWORD *)(*(void *)(*encoder + *v15 + 24)
                     + *(unsigned int *)(encoder[1] + 128)
                     + *(_DWORD *)(encoder[1] + 140)
                     + *(_DWORD *)(encoder[1] + 144) * index);
      v65[6] = 1073741968;
      v65[7] = v63;
      v65[8] = 15360;
    }
    if (v24) {
      goto LABEL_22;
    }
  }
  int v53 = *v14;
LABEL_27:
  uint64_t v66 = *(void *)(*encoder + *v15 + 24) + *(_DWORD *)(encoder[1] + 148) + *(_DWORD *)(encoder[1] + 152) * index;
  if (v53)
  {
    unint64_t v67 = v23 + v21 + v22 * index;
    __int32 v68 = (*v14)[409].i32[0];
    __int32 v69 = (*v14)[410].i32[1];
    int v70 = (v67 >> 16) & 0xFFC00000 | (*v14)[409].i32[1] & 0x3FFFFF;
    unint64_t v71 = v67 >> 6;
    int8x8_t v72 = vand_s8((*v14)[408], (int8x8_t)0x3FFFF0000);
    v73 = v14[401];
    if (v73) {
      unint64_t v74 = (unint64_t)v73[4];
    }
    else {
      unint64_t v74 = *(void *)(*(void *)&(*v14)[411] + 32);
    }
    v76.i64[0] = HIDWORD(v74);
    v76.i64[1] = v74;
    *(_DWORD *)uint64_t v66 = (*v14)[407].i32[1];
    *(int8x8_t *)(v66 + 4) = vorr_s8(v72, vand_s8((int8x8_t)vmovn_s64(v76), (int8x8_t)0xFFFFFFFC0000FFFFLL));
    *(_DWORD *)(v66 + 12) = v68;
    *(_DWORD *)(v66 + 16) = v70;
    *(_DWORD *)(v66 + 20) = v71;
    *(_DWORD *)(v66 + 24) = v69;
    int v75 = v53[414].i32[0] & 0xE10000;
  }
  else
  {
    int v75 = 0;
  }
  uint64_t v77 = HIDWORD(*(void *)&v32);
  __int32 v78 = v75 | v32.i32[0] & 0xF1C00FF;
  *(_DWORD *)(v66 + 28) = 0;
  unsigned int v79 = *((_DWORD *)v14 + 187) & 0xFBFFFFFF | v33 & 0xF3F5FFFF | 0x80A0000;
  *(_DWORD *)(v66 + 28) = v79;
  *(_DWORD *)(v66 + 44) = *((_DWORD *)v14 + 188);
  int v80 = *((_DWORD *)v14 + 189);
  *(_DWORD *)(v66 + 48) = v78;
  *(_DWORD *)(v66 + 72) = v77;
  *(_DWORD *)(v66 + 60) = 0;
  *(_DWORD *)(v66 + 64) = v80;
  *(int8x8_t *)(v66 + 52) = v35;
  *(int8x8_t *)(v66 + 76) = v36;
  *(_DWORD *)(v66 + 28) = *((_DWORD *)v14 + 182) | v79;
  int v81 = *((_DWORD *)v14 + 183);
  *(_DWORD *)(v66 + 32) = v81;
  int8x8_t v82 = *(int8x8_t *)(v66 + 36);
  unsigned int v83 = *((_DWORD *)v14 + 184);
  *(_DWORD *)(v66 + 36) = v83;
  LODWORD(v77) = *((_DWORD *)v14 + 185);
  *(_DWORD *)(v66 + 40) = v77;
  *(_DWORD *)(v66 + 68) = *((_DWORD *)v14 + 186);
  int8x8_t v84 = (int8x8_t)__PAIR64__(v77, v83);
  *(int8x8_t *)(v66 + 36) = vbsl_s8((int8x8_t)0xF0000000F0000000, (int8x8_t)__PAIR64__(v77, v83), v82);
  int v85 = v81 | 0x10000000;
  *(_DWORD *)(v66 + 32) = v85;
  v86 = v14[4];
  if (v86)
  {
    uint64_t v87 = *(void *)&v84 & 0xFFFFFFF0FFFFFFFLL;
    unsigned int v88 = v86[410].u32[1];
    *(_DWORD *)(v66 + 32) = v85 & 0xFF7FFFFF;
    if (v88 <= 8)
    {
      if (((1 << v88) & 0x1D8) != 0)
      {
        uint64_t v89 = (uint64_t)vand_s8(v84, (int8x8_t)vdup_n_s32(0xFF3FFFFu));
LABEL_40:
        *(void *)(v66 + 36) = v89;
        goto LABEL_41;
      }
      if (((1 << v88) & 0x26) != 0)
      {
        uint64_t v89 = v87 | 0x1000000010000000;
        goto LABEL_40;
      }
    }
    uint64_t v89 = v87 | 0x4000000040000000;
    goto LABEL_40;
  }
LABEL_41:
  v90 = (unsigned int *)encoder[1];
  uint64_t v91 = *encoder + *v15;
  uint64_t v92 = *(void *)(v91 + 8) + v90[37] + v90[38] * index;
  unint64_t v93 = v92 - 0xFFFFFFFE4;
  uint64_t v94 = ((unint64_t)(v92 - 0xFFFFFFFE4) >> 32) | 0xE00;
  uint64_t v95 = *(void *)(v91 + 24);
  unint64_t v96 = v90[35] + v90[36] * index + (unint64_t)v90[31];
  v97 = (unint64_t *)(v95 + v96);
  v154 = v53;
  if (v53)
  {
    unint64_t *v97 = __ROR8__(v92 - 0x1000000000, 32) & 0xFFFFFFFC000000FFLL | 0x700;
  }
  else
  {
    LODWORD(__pattern4) = 0x20000000;
    v150 = encoder;
    int v151 = v8;
    int v98 = v6;
    unsigned int v99 = v4;
    int v100 = v7;
    int v101 = v3;
    __int32 v102 = v5;
    memset_pattern4((void *)(v95 + v96), &__pattern4, 8uLL);
    __int32 v5 = v102;
    int v15 = (int *)MEMORY[0x263F4B188];
    int v3 = v101;
    LODWORD(v7) = v100;
    unsigned int v4 = v99;
    LODWORD(v6) = v98;
    encoder = v150;
    int v8 = v151;
  }
  v97[1] = v94 & 0x3FFFFFFFFLL | ((unint64_t)(v93 >> 2) << 34);
  uint64_t v103 = *(void *)(*encoder + *v15 + 24);
  if (v14[4])
  {
    uint64_t v104 = v103
         + *(_DWORD *)(encoder[1] + 140)
         + *(_DWORD *)(encoder[1] + 144) * index
         + (unint64_t)*(unsigned int *)(encoder[1] + 128);
    *(_DWORD *)uint64_t v104 = 1073745164;
    *(_DWORD *)(v104 + 4) = v3;
    *(int8x8_t *)(v104 + 8) = v11;
    *(_DWORD *)(v104 + 16) = v8 | 4;
    *(_DWORD *)(v104 + 20) = v6;
    *(_DWORD *)(v104 + 24) = v9 | 4;
    *(_DWORD *)(v104 + 28) = v7;
    *(_DWORD *)(v104 + 32) = v4;
    *(_DWORD *)(v104 + 36) = v5;
    *(_DWORD *)(v104 + 40) = 0;
    *(int8x8_t *)(v104 + 44) = v10;
    int8x8_t v105 = v14[3][347];
    v106 = (unsigned __int8 *)(v103
                             + *(_DWORD *)(encoder[1] + 188)
                             + *(_DWORD *)(encoder[1] + 192) * index
                             + *(unsigned int *)(encoder[1] + 104));
    uint64_t v156 = 0;
    uint64_t v157 = 0;
    uint64_t __pattern4 = (2 * (*(void *)&v105 & 0xFFFFFFFFFFFFLL)) | 1;
    v107 = AGXIotoInstruction_B_0::emit((AGXIotoInstruction_B_0 *)&__pattern4, v106);
    uint64_t v108 = v103
         + *(_DWORD *)(encoder[1] + 188)
         + *(_DWORD *)(encoder[1] + 192) * index
         + *(unsigned int *)(encoder[1] + 192)
         - (void)v107;
    unint64_t v109 = v108 & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v110 = v108 & 3;
    LODWORD(__pattern4) = 0;
    memset_pattern4(v107, &__pattern4, v108 & 0xFFFFFFFFFFFFFFFCLL);
    if (v110) {
      *(_WORD *)&v107[v109] = 0;
    }
    int8x8_t v111 = v14[4][347];
    v112 = (unsigned __int8 *)(v103
                             + *(_DWORD *)(encoder[1] + 204)
                             + *(_DWORD *)(encoder[1] + 208) * index
                             + *(unsigned int *)(encoder[1] + 120));
    uint64_t v156 = 0;
    uint64_t v157 = 0;
    uint64_t __pattern4 = (2 * (*(void *)&v111 & 0xFFFFFFFFFFFFLL)) | 1;
    v113 = AGXIotoInstruction_B_0::emit((AGXIotoInstruction_B_0 *)&__pattern4, v112);
    v114 = v113;
    uint64_t v115 = encoder[1];
    int v117 = *(_DWORD *)(v115 + 204);
    uint64_t v116 = *(unsigned int *)(v115 + 208);
  }
  else
  {
    uint64_t v118 = v103
         + *(_DWORD *)(encoder[1] + 140)
         + *(_DWORD *)(encoder[1] + 144) * index
         + (unint64_t)*(unsigned int *)(encoder[1] + 128);
    *(_DWORD *)uint64_t v118 = v148;
    *(_DWORD *)(v118 + 4) = v149;
    *(_DWORD *)(v118 + 8) = v152 | 4;
    *(_DWORD *)(v118 + 12) = v153;
    *(void *)(v118 + 16) = v158;
    int8x8_t v119 = v14[1][347];
    v120 = (unsigned __int8 *)(v103
                             + *(_DWORD *)(encoder[1] + 172)
                             + *(_DWORD *)(encoder[1] + 176) * index
                             + *(unsigned int *)(encoder[1] + 44));
    uint64_t v156 = 0;
    uint64_t v157 = 0;
    uint64_t __pattern4 = (2 * (*(void *)&v119 & 0xFFFFFFFFFFFFLL)) | 1;
    v113 = AGXIotoInstruction_B_0::emit((AGXIotoInstruction_B_0 *)&__pattern4, v120);
    v114 = v113;
    uint64_t v121 = encoder[1];
    int v117 = *(_DWORD *)(v121 + 172);
    uint64_t v116 = *(unsigned int *)(v121 + 176);
  }
  uint64_t v122 = v103 + v117 + v116 * index + v116 - (void)v113;
  unint64_t v123 = v122 & 0xFFFFFFFFFFFFFFFCLL;
  uint64_t v124 = v122 & 3;
  LODWORD(__pattern4) = 0;
  memset_pattern4(v113, &__pattern4, v122 & 0xFFFFFFFFFFFFFFFCLL);
  if (v124) {
    *(_WORD *)&v114[v123] = 0;
  }
  if (v154)
  {
    int8x8_t v125 = v154[348];
    v126 = (unsigned __int8 *)(v103
                             + *(_DWORD *)(encoder[1] + 156)
                             + *(_DWORD *)(encoder[1] + 160) * index
                             + *(unsigned int *)(encoder[1] + 40));
    uint64_t v156 = 0;
    uint64_t v157 = 0;
    uint64_t __pattern4 = (2 * (*(void *)&v125 & 0xFFFFFFFFFFFFLL)) | 1;
    v127 = AGXIotoInstruction_B_0::emit((AGXIotoInstruction_B_0 *)&__pattern4, v126);
    uint64_t v128 = v103
         + *(_DWORD *)(encoder[1] + 156)
         + *(_DWORD *)(encoder[1] + 160) * index
         + *(unsigned int *)(encoder[1] + 160)
         - (void)v127;
    unint64_t v129 = v128 & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v130 = v128 & 3;
    LODWORD(__pattern4) = 0;
    memset_pattern4(v127, &__pattern4, v128 & 0xFFFFFFFFFFFFFFFCLL);
    if (v130) {
      *(_WORD *)&v127[v129] = 0;
    }
  }
  v131 = v14[156];
  v132 = v14[158];
  v133 = (_DWORD *)encoder[1];
  v134 = (int8x8_t **)(v103 + v133[69] + v133[70] * index);
  if (v131) {
    v131 = (int8x8_t *)v131[7];
  }
  *v134 = v131;
  if (v132) {
    v132 = (int8x8_t *)v132[7];
  }
  v134[1] = v132;
  int v135 = *((_DWORD *)v14 + 800);
  if ((v135 & 2) != 0) {
    int8x8_t v136 = v14[395][7];
  }
  else {
    int8x8_t v136 = 0;
  }
  v134[2] = (int8x8_t *)v136;
  if (!v14[4])
  {
    v141 = v14[120];
    v142 = v14[122];
    v143 = (int8x8_t **)(v103 + v133[63] + v133[64] * index);
    if (v141) {
      v141 = (int8x8_t *)v141[7];
    }
    *v143 = v141;
    if (v142) {
      v142 = (int8x8_t *)v142[7];
    }
    v143[1] = v142;
    if ((v135 & 1) == 0) {
      goto LABEL_80;
    }
    v144 = v14 + 394;
LABEL_82:
    int8x8_t v147 = (*v144)[7];
    goto LABEL_83;
  }
  v137 = v14[228];
  v138 = v14[230];
  v139 = (int8x8_t **)(v103 + v133[65] + v133[66] * index);
  if (v137) {
    v137 = (int8x8_t *)v137[7];
  }
  *v139 = v137;
  if (v138) {
    v138 = (int8x8_t *)v138[7];
  }
  v139[1] = v138;
  if ((v135 & 8) != 0) {
    int8x8_t v140 = v14[397][7];
  }
  else {
    int8x8_t v140 = 0;
  }
  v139[2] = (int8x8_t *)v140;
  v145 = v14[264];
  v146 = v14[266];
  v143 = (int8x8_t **)(v103 + v133[67] + v133[68] * index);
  if (v145) {
    v145 = (int8x8_t *)v145[7];
  }
  *v143 = v145;
  if (v146) {
    v146 = (int8x8_t *)v146[7];
  }
  v143[1] = v146;
  if ((v135 & 0x10) != 0)
  {
    v144 = v14 + 398;
    goto LABEL_82;
  }
LABEL_80:
  int8x8_t v147 = 0;
LABEL_83:
  v143[2] = (int8x8_t *)v147;
}

- (AGXG17FamilyIndirectRenderCommand)initWithEncoder:(void *)a3 withIndex:(unsigned int)a4
{
  self->_encoder = a3;
  self->_unsigned int index = a4;
  return self;
}

@end