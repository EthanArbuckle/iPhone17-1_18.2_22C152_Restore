@interface AGXG17FamilyIndirectComputeCommand
- ($7B206454A2DF4CD367C4131B04854098)getStageInRegion;
- (AGXG17FamilyIndirectComputeCommand)initWithEncoder:(void *)a3 withIndex:(unsigned int)a4;
- (BOOL)hasBarrier;
- (id)dispatchThreadgroupsArguments;
- (id)dispatchThreadsArguments;
- (id)getImageBlockSize;
- (unint64_t)getCommandType;
- (unint64_t)getKernelAttributeStrideAtIndex:(unint64_t)a3;
- (unint64_t)getKernelBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getPipelineStateUniqueIdentifier;
- (unint64_t)getThreadgroupMemoryLengthAtIndex:(unint64_t)a3;
- (void)clearBarrier;
- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)reset;
- (void)setBarrier;
- (void)setComputePipelineState:(id)a3;
- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4;
- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setStageInRegion:(id *)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
@end

@implementation AGXG17FamilyIndirectComputeCommand

- (unint64_t)getPipelineStateUniqueIdentifier
{
  encoder = self->_encoder;
  uint64_t v3 = encoder[1];
  if (*(unsigned char *)(v3 + 16)) {
    return 0;
  }
  else {
    return *(void *)(*(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24)
  }
                     + *(_DWORD *)(v3 + 92)
                     + *(_DWORD *)(v3 + 96) * self->_index);
}

- (id)dispatchThreadgroupsArguments
{
  uint64_t v3 = objc_opt_new();
  v4 = (int *)MEMORY[0x263F4B188];
  v5 = (_DWORD *)(*(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
                + *(_DWORD *)(*((void *)self->_encoder + 1) + 44)
                + *(_DWORD *)(*((void *)self->_encoder + 1) + 48) * self->_index);
  uint64_t v6 = v5[5] / (v5[8] & 0x7FFu);
  uint64_t v7 = v5[6] / (v5[9] & 0x7FFu);
  uint64_t v8 = v5[7] / (v5[10] & 0x7FFu);
  v16[0] = v6;
  v16[1] = v7;
  v16[2] = v8;
  [v3 setThreadgroupsPerGrid:v16];
  v9 = (int8x8_t *)(*(void *)(*(void *)self->_encoder + *v4 + 24)
                  + *(_DWORD *)(*((void *)self->_encoder + 1) + 44)
                  + *(_DWORD *)(*((void *)self->_encoder + 1) + 48) * self->_index);
  uint64_t v10 = v9[5].i32[0] & 0x7FF;
  int8x8_t v11 = vand_s8(v9[4], (int8x8_t)0x700000007);
  *(void *)&long long v12 = v11.u32[0];
  *((void *)&v12 + 1) = v11.u32[1];
  long long v14 = v12;
  uint64_t v15 = v10;
  [v3 setThreadsPerThreadgroup:&v14];
  return v3;
}

- (unint64_t)getCommandType
{
  encoder = self->_encoder;
  unsigned int index = self->_index;
  v4 = (_DWORD *)encoder[1];
  uint64_t v5 = *(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24);
  uint64_t v6 = v5 + v4[11] + v4[12] * index;
  if (!*(void *)(v6 + 20)
    && !*(_DWORD *)(v6 + 28)
    && !*(_DWORD *)(v6 + 32)
    && !*(_DWORD *)(v6 + 36)
    && !*(_DWORD *)(v6 + 40))
  {
    return 0;
  }
  if (*(unsigned char *)(v5 + v4[27] + v4[28] * index)) {
    return 64;
  }
  return 32;
}

- (unint64_t)getKernelAttributeStrideAtIndex:(unint64_t)a3
{
  encoder = self->_encoder;
  uint64_t v4 = encoder[1];
  if (!*(unsigned char *)(v4 + 152)) {
    return -1;
  }
  unint64_t result = *(unsigned int *)(*(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24)
                           + *(_DWORD *)(v4 + 116)
                           + *(_DWORD *)(v4 + 120) * self->_index
                           + 4 * a3);
  if (result == -1) {
    return -1;
  }
  return result;
}

- (unint64_t)getKernelBufferAddressAtIndex:(unint64_t)a3
{
  return *(void *)(*(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
                   + *(_DWORD *)(*((void *)self->_encoder + 1) + 52)
                   + *(_DWORD *)(*((void *)self->_encoder + 1) + 56) * self->_index
                   + 8 * a3);
}

- (id)dispatchThreadsArguments
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = (int *)MEMORY[0x263F4B188];
  uint64_t v5 = *(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
     + *(_DWORD *)(*((void *)self->_encoder + 1) + 44)
     + *(_DWORD *)(*((void *)self->_encoder + 1) + 48) * self->_index;
  unint64_t v6 = *(void *)(v5 + 20);
  uint64_t v7 = *(unsigned int *)(v5 + 28);
  v15[0] = v6;
  v15[1] = HIDWORD(v6);
  v15[2] = v7;
  [v3 setThreadsPerGrid:v15];
  uint64_t v8 = (int8x8_t *)(*(void *)(*(void *)self->_encoder + *v4 + 24)
                  + *(_DWORD *)(*((void *)self->_encoder + 1) + 44)
                  + *(_DWORD *)(*((void *)self->_encoder + 1) + 48) * self->_index);
  uint64_t v9 = v8[5].i32[0] & 0x7FF;
  int8x8_t v10 = vand_s8(v8[4], (int8x8_t)0x700000007);
  *(void *)&long long v11 = v10.u32[0];
  *((void *)&v11 + 1) = v10.u32[1];
  long long v13 = v11;
  uint64_t v14 = v9;
  [v3 setThreadsPerThreadgroup:&v13];
  return v3;
}

- (unint64_t)getThreadgroupMemoryLengthAtIndex:(unint64_t)a3
{
  return *(unsigned int *)(*(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
                         + *(_DWORD *)(*((void *)self->_encoder + 1) + 84)
                         + *(_DWORD *)(*((void *)self->_encoder + 1) + 88) * self->_index
                         + 4 * a3);
}

- (id)getImageBlockSize
{
  uint64_t v3 = objc_opt_new();
  unint64_t v4 = *(void *)(*(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
                 + *(_DWORD *)(*((void *)self->_encoder + 1) + 100)
                 + *(_DWORD *)(*((void *)self->_encoder + 1) + 104) * self->_index
                 + 24);
  unint64_t v5 = HIDWORD(v4);
  [v3 setWidth:v4];
  [v3 setHeight:v5];
  return v3;
}

- (BOOL)hasBarrier
{
  return (*(unsigned char *)(*(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
                   + *(_DWORD *)(*((void *)self->_encoder + 1) + 44)
                   + *(_DWORD *)(*((void *)self->_encoder + 1) + 48) * self->_index
                   + 1) & 3) != 0;
}

- ($7B206454A2DF4CD367C4131B04854098)getStageInRegion
{
  uint64_t v3 = (void *)(*(void *)(*(void *)self->var0.var1 + (int)*MEMORY[0x263F4B188] + 24)
                + (*(_DWORD *)(*(void *)(self->var0.var1 + 8) + 60)
                               + *(_DWORD *)(*(void *)(self->var0.var1 + 8) + 64) * LODWORD(self->var0.var2)));
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  *(void *)&long long v6 = v4;
  *((void *)&v6 + 1) = HIDWORD(v4);
  long long v7 = v6;
  *(void *)&long long v6 = v5;
  *((void *)&v6 + 1) = HIDWORD(v5);
  *(_OWORD *)&retstr->var0.var0 = v7;
  *(_OWORD *)&retstr->var0.var2 = v6;
  *(void *)&long long v7 = v3[7];
  *(void *)&long long v6 = v7;
  *((void *)&v6 + 1) = DWORD1(v7);
  *(_OWORD *)&retstr->var1.var1 = v6;
  return self;
}

- (void)clearBarrier
{
  *(_DWORD *)(*(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
            + *(_DWORD *)(*((void *)self->_encoder + 1) + 44)
            + *(_DWORD *)(*((void *)self->_encoder + 1) + 48) * self->_index) = 1610612736;
}

- (void)setBarrier
{
  *(_DWORD *)(*(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
            + *(_DWORD *)(*((void *)self->_encoder + 1) + 44)
            + *(_DWORD *)(*((void *)self->_encoder + 1) + 48) * self->_index) = 1610618208;
}

- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  encoder = self->_encoder;
  unsigned int index = self->_index;
  unint64_t var1 = a3->var1;
  __int32 var2 = a3->var2;
  __int16 v8 = a4->var2;
  uint64_t v9 = (int *)MEMORY[0x263F4B188];
  int8x8_t v10 = (int8x8_t *)(*(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24)
                   + *(_DWORD *)(encoder[1] + 44)
                   + *(_DWORD *)(encoder[1] + 48) * index);
  unint64_t v11 = a3->var0 | ((unint64_t)var1 << 32);
  int8x8_t v12 = (int8x8_t)vmovn_s64(*(int64x2_t *)&a4->var0);
  v10[2].i32[1] = a3->var0;
  v10[3].i32[0] = var1;
  v10[3].i32[1] = var2;
  v10[4] = vand_s8(v12, (int8x8_t)0x700000007);
  v10[5].i32[0] = v8 & 0x7FF;
  uint64_t v13 = *(void *)(*encoder + *v9 + 24) + *(_DWORD *)(encoder[1] + 100) + *(_DWORD *)(encoder[1] + 104) * index;
  *(void *)uint64_t v13 = v11;
  *(_DWORD *)(v13 + 8) = var2;
  *(void *)(v13 + 12) = 0x100000001;
  *(_DWORD *)(v13 + 20) = 1;
  uint64_t v14 = *(void *)(*encoder + *v9 + 24);
  uint64_t v15 = *(_DWORD *)(encoder[1] + 108) + *(_DWORD *)(encoder[1] + 112) * index;
  *(unsigned char *)(v14 + v15) |= 1u;
}

- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  int v4 = a3;
  encoder = (uint64_t *)self->_encoder;
  unsigned int index = self->_index;
  uint64_t v7 = *encoder;
  uint64_t v8 = encoder[1];
  uint64_t v9 = *(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24) + *(_DWORD *)(v8 + 100) + *(_DWORD *)(v8 + 104) * index;
  *(_DWORD *)(v9 + 24) = v4;
  *(_DWORD *)(v9 + 28) = a4;
  if (!*(unsigned char *)(v8 + 16)) {
    AGX::IndirectComputeCommandEncoderGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::recalculateThreadgroupOffsets(v7, (_DWORD *)v8, index);
  }
}

- (void)setStageInRegion:(id *)a3
{
  uint64_t v3 = *(void *)(*(void *)self->_encoder + (int)*MEMORY[0x263F4B188] + 24)
     + *(_DWORD *)(*((void *)self->_encoder + 1) + 60)
     + *(_DWORD *)(*((void *)self->_encoder + 1) + 64) * self->_index;
  *(int32x4_t *)(v3 + 40) = vuzp1q_s32(*(int32x4_t *)&a3->var0.var0, *(int32x4_t *)&a3->var0.var2);
  *(int32x2_t *)(v3 + 56) = vmovn_s64(*(int64x2_t *)&a3->var1.var1);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  encoder = (uint64_t *)self->_encoder;
  unsigned int index = self->_index;
  uint64_t v6 = *encoder;
  uint64_t v7 = (_DWORD *)encoder[1];
  *(_DWORD *)(*(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24) + v7[21] + v7[22] * index + 4 * a4) = a3;
  AGX::IndirectComputeCommandEncoderGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::recalculateThreadgroupOffsets(v6, v7, index);
}

- (void)reset
{
  encoder = (uint64_t *)self->_encoder;
  unsigned int index = self->_index;
  int v4 = (int *)MEMORY[0x263F4B188];
  uint64_t v5 = (int)*MEMORY[0x263F4B188];
  uint64_t v7 = *encoder;
  uint64_t v6 = encoder[1];
  uint64_t v8 = *(void *)(*encoder + v5 + 24);
  uint64_t v9 = v8 + *(_DWORD *)(v6 + 44) + *(_DWORD *)(v6 + 48) * index;
  if (*(unsigned char *)(v6 + 17))
  {
    if (!*(unsigned char *)(v6 + 152)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  bzero((void *)(v8 + *(_DWORD *)(v6 + 52) + *(_DWORD *)(v6 + 56) * index), *(unsigned int *)(v6 + 56));
  uint64_t v7 = *encoder;
  uint64_t v6 = encoder[1];
  LODWORD(v5) = *v4;
  if (*(unsigned char *)(v6 + 152))
  {
LABEL_3:
    bzero((void *)(*(void *)(v7 + (int)v5 + 24) + *(_DWORD *)(v6 + 116) + *(_DWORD *)(v6 + 120) * index), *(unsigned int *)(v6 + 120));
    uint64_t v7 = *encoder;
    uint64_t v6 = encoder[1];
    LODWORD(v5) = *v4;
  }
LABEL_4:
  int8x8_t v10 = (void *)(*(void *)(v7 + (int)v5 + 24) + *(_DWORD *)(v6 + 60) + *(_DWORD *)(v6 + 64) * index);
  v10[5] = 0;
  v10[6] = 0;
  v10[7] = 0;
  bzero((void *)(*(void *)(*encoder + *v4 + 24) + *(_DWORD *)(encoder[1] + 84) + *(_DWORD *)(encoder[1] + 88) * index), *(unsigned int *)(encoder[1] + 88));
  *(void *)(v9 + 28) = 0;
  *(void *)(v9 + 20) = 0;
  *(void *)(v9 + 36) = 0;
  *(_DWORD *)uint64_t v9 = 1610612736;
  uint64_t v11 = encoder[1];
  if (!*(unsigned char *)(v11 + 16))
  {
    uint64_t v12 = *encoder;
    *(void *)(*(void *)(*encoder + *v4 + 24) + *(_DWORD *)(v11 + 92) + *(_DWORD *)(v11 + 96) * index) = 0;
    size_t v13 = *(unsigned int *)(v11 + 72);
    uint64_t v14 = (void *)(*(void *)(v12 + *v4 + 24) + *(_DWORD *)(v11 + 68) + v13 * index);
    bzero(v14, v13);
  }
}

- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  encoder = self->_encoder;
  unsigned int index = self->_index;
  unint64_t var0 = a3->var0;
  unint64_t var1 = a3->var1;
  unint64_t var2 = a3->var2;
  unint64_t v9 = a4->var0;
  unint64_t v10 = a4->var1;
  int v11 = a4->var2;
  uint64_t v12 = (int *)MEMORY[0x263F4B188];
  size_t v13 = (_DWORD *)(*(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24)
                 + *(_DWORD *)(encoder[1] + 44)
                 + *(_DWORD *)(encoder[1] + 48) * index);
  int v14 = a4->var0 * a3->var0;
  unint64_t v15 = a4->var0 & 0x7FF;
  v13[5] = v14;
  v13[6] = (v10 * (var1 << 32)) >> 32;
  v13[7] = v11 * var2;
  v13[8] = v15;
  v13[9] = v10 & 0x7FF;
  v13[10] = v11 & 0x7FF;
  unint64_t v16 = var0 | ((unint64_t)var1 << 32);
  uint64_t v17 = *(void *)(*encoder + *v12 + 24) + *(_DWORD *)(encoder[1] + 100) + *(_DWORD *)(encoder[1] + 104) * index;
  *(void *)uint64_t v17 = v16;
  *(_DWORD *)(v17 + 8) = var2;
  *(void *)(v17 + 12) = v9 | ((unint64_t)v10 << 32);
  *(_DWORD *)(v17 + 20) = v11;
  uint64_t v18 = *(void *)(*encoder + *v12 + 24);
  uint64_t v19 = *(_DWORD *)(encoder[1] + 108) + *(_DWORD *)(encoder[1] + 112) * index;
  *(unsigned char *)(v18 + v19) &= ~1u;
}

- (void)setComputePipelineState:(id)a3
{
  encoder = (uint64_t *)self->_encoder;
  unsigned int index = self->_index;
  uint64_t v5 = (int *)MEMORY[0x263F4B188];
  uint64_t v6 = *(void *)(*encoder + (int)*MEMORY[0x263F4B188] + 24)
     + *(_DWORD *)(encoder[1] + 44)
     + *(_DWORD *)(encoder[1] + 48) * index;
  uint64_t v7 = (char *)a3 + 64;
  uint64_t v8 = *((void *)a3 + 10);
  uint64_t v9 = *(void *)(v8 + 2784);
  int v10 = *(_DWORD *)(v6 + 8);
  *(_DWORD *)(v6 + 4) = *(_DWORD *)(v6 + 4) & 0xFFFF8007 | (8 * (*(_DWORD *)(v9 + 252) & 0xFFF));
  *(_DWORD *)(v6 + 8) = v10 & 0xFFE00007 | (8 * (*(_DWORD *)(v9 + 248) & 0x3FFFF));
  int v11 = (unsigned __int8 *)(*(void *)(*encoder + *v5 + 24)
                          + *(unsigned int *)(encoder[1] + 36)
                          + *(_DWORD *)(encoder[1] + 76)
                          + *(_DWORD *)(encoder[1] + 80) * index);
  uint64_t v12 = *(void *)(v8 + 2776);
  v20[1] = 0;
  v20[2] = 0;
  v20[0] = (2 * (v12 & 0xFFFFFFFFFFFFLL)) | 1;
  AGXIotoInstruction_B_0::emit((AGXIotoInstruction_B_0 *)v20, v11);
  uint64_t v13 = *encoder;
  int v14 = (_DWORD *)encoder[1];
  uint64_t v15 = *(void *)(*encoder + *v5 + 24) + v14[21] + v14[22] * index;
  *(_DWORD *)(v15 + 144) = 4 * *(_DWORD *)(v8 + 3376);
  *(_DWORD *)(v15 + 148) = (*(_DWORD *)(v8 + 3548) + 3) >> 2;
  AGX::IndirectComputeCommandEncoderGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::recalculateThreadgroupOffsets(v13, v14, index);
  uint64_t v16 = *encoder;
  uint64_t v17 = (_DWORD *)encoder[1];
  *(void *)(*(void *)(*encoder + *v5 + 24) + v17[23] + v17[24] * index) = *((void *)v7 + 5);
  uint64_t v18 = (void *)*((void *)v7 + 7);
  uint64_t v19 = (void *)(*(void *)(v16 + *v5 + 24) + v17[17] + v17[18] * index);
  *uint64_t v19 = v18[11];
  v19[1] = v18[12];
  v19[2] = v18[13];
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  encoder = (uint64_t *)self->_encoder;
  unsigned int index = self->_index;
  uint64_t v8 = (int *)MEMORY[0x263F4B188];
  uint64_t v9 = (int)*MEMORY[0x263F4B188];
  uint64_t v11 = *encoder;
  uint64_t v10 = encoder[1];
  uint64_t v12 = *(void *)(v11 + v9 + 24) + *(_DWORD *)(v10 + 52) + *(_DWORD *)(v10 + 56) * index;
  if (a3) {
    uint64_t v13 = *(void *)((char *)a3 + v9 + 8);
  }
  else {
    uint64_t v13 = 0;
  }
  *(void *)(v12 + 8 * a6) = v13 + a4;
  if (*(unsigned char *)(v10 + 152)) {
    *(_DWORD *)(*(void *)(v11 + *v8 + 24)
  }
              + *(_DWORD *)(v10 + 116)
              + *(_DWORD *)(v10 + 120) * index
              + 4 * a6) = a5;
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  encoder = (uint64_t *)self->_encoder;
  unsigned int index = self->_index;
  uint64_t v7 = (int *)MEMORY[0x263F4B188];
  uint64_t v8 = (int)*MEMORY[0x263F4B188];
  uint64_t v10 = *encoder;
  uint64_t v9 = encoder[1];
  uint64_t v11 = *(void *)(v10 + v8 + 24) + *(_DWORD *)(v9 + 52) + *(_DWORD *)(v9 + 56) * index;
  if (a3) {
    uint64_t v12 = *(void *)((char *)a3 + v8 + 8);
  }
  else {
    uint64_t v12 = 0;
  }
  *(void *)(v11 + 8 * a5) = v12 + a4;
  if (*(unsigned char *)(v9 + 152)) {
    *(_DWORD *)(*(void *)(v10 + *v7 + 24)
  }
              + *(_DWORD *)(v9 + 116)
              + *(_DWORD *)(v9 + 120) * index
              + 4 * a5) = -1;
}

- (AGXG17FamilyIndirectComputeCommand)initWithEncoder:(void *)a3 withIndex:(unsigned int)a4
{
  self->_encoder = a3;
  self->_unsigned int index = a4;
  return self;
}

@end