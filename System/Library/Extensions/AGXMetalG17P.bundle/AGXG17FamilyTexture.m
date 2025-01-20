@interface AGXG17FamilyTexture
- (BOOL)canGenerateMipmapLevels;
- (BOOL)initImplWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6;
- (BOOL)initImplWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 resourceIndex:(unint64_t)a7;
- (BOOL)initImplWithDevice:(id)a3 Descriptor:(id)a4 iosurface:(__IOSurface *)a5 plane:(unint64_t)a6 slice:(unint64_t)a7 buffer:(id)a8 bytesPerRow:(unint64_t)a9 allowNPOT:(BOOL)a10 sparsePageSize:(unint64_t)a11 isCompressedIOSurface:(BOOL)a12 isHeapBacked:(BOOL)a13;
- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4;
- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7;
- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 resourceIndex:(unint64_t)a8;
- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(unsigned int)a8;
- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(unsigned int)a8 resourceIndex:(unint64_t)a9;
- (BOOL)isMemoryless;
- (BOOL)isSparse;
- (BOOL)updateBindDataWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 slice:(unint64_t)a7;
- (BOOL)validateBufferTextureWithSize:(unint64_t)a3;
- (int64_t)compressionFeedback;
- (unint64_t)colorSpaceConversionMatrix;
- (unint64_t)compressionFootprint;
- (unint64_t)firstMipmapInTail;
- (unint64_t)resourceIndex;
- (unint64_t)sparseSurfaceDefaultValue;
- (unint64_t)tailSize;
- (unint64_t)tailSizeInBytes;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
- (void)finalizeCompressedTextureViewCreation;
- (void)finalizeTextureCreation;
- (void)generateMipmapLevel:(unint64_t)a3 slice:(unint64_t)a4;
- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 bytesPerImage:(unint64_t)a5 fromRegion:(id *)a6 mipmapLevel:(unint64_t)a7 slice:(unint64_t)a8;
- (void)initNewTextureData:(AGXNewTextureDataStruc *)a3;
- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 slice:(unint64_t)a5 withBytes:(const void *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8;
- (void)setSparseHeap:(id)a3;
- (void)updateBindDataWithAddresses:(void *)a3 cpuMetadataAddress:(void *)a4 gpuVirtualAddress:(unint64_t)a5 isCompressible:(BOOL)a6 shouldInitMetadata:(BOOL)a7;
- (void)updateBindDataWithAddresses:(void *)a3 gpuVirtualAddress:(unint64_t)a4;
- (void)updateBindDataWithAddresses:(void *)a3 gpuVirtualAddress:(unint64_t)a4 shouldInitMetadata:(BOOL)a5;
- (void)updateBindDataWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7;
@end

@implementation AGXG17FamilyTexture

- (unint64_t)resourceIndex
{
  return *(unsigned int *)(self->super._bytesPerRow + 464);
}

- (void)finalizeCompressedTextureViewCreation
{
  v3 = [(AGXTexture *)self backingResource];
  uint64_t v4 = (int)*MEMORY[0x263F4B188];
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa + v4);
  uint64_t v6 = *(void *)((char *)&self->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque + v4) | 0x1000000000000000;
  v5[2] = v6;
  void *v5 = &v3[v4];
  v5[1] = *(void *)(self->super._bytesPerRow + 72);
  v5[2] = v6 & 0xFF00000000000000 | *(void *)(self->super._bytesPerRow + 352) & 0xFFFFFFFFFFFFFFLL;
  *(_DWORD *)(self->super._bytesPerRow + 124) = *(_DWORD *)((char *)&self->super.super.super._res.vendor.reserved[2] + v4);
}

- (void)finalizeTextureCreation
{
  unint64_t bytesPerRow = self->super._bytesPerRow;
  uint64_t v4 = *(void *)(bytesPerRow + 488);
  if (v4) {
    BOOL v5 = *(_DWORD *)(v4 + 1080) > *(_DWORD *)(bytesPerRow + 144);
  }
  else {
    BOOL v5 = 0;
  }
  *((unsigned char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B1A8]) = v5;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B1C0]);
  uint64_t v7 = (int)*MEMORY[0x263F4B188];
  v8 = (char *)self + v7;
  uint64_t v9 = *(void *)&self->super.super.super._anon_50[v7 + 16];
  if (*(_DWORD *)*MEMORY[0x263F4B1E8])
  {
    IOGPUDeviceTraceEvent();
    unint64_t bytesPerRow = self->super._bytesPerRow;
  }
  *(_DWORD *)(bytesPerRow + 124) = *((_DWORD *)v8 + 12);
  v10 = [(AGXTexture *)self backingResource];
  uint64_t v11 = *((void *)v8 + 2);
  if (v10 == self)
  {
    v12 = 0;
  }
  else
  {
    v11 |= 0x1000000000000000uLL;
    *((void *)v8 + 2) = v11;
    v12 = (char *)v10 + v7;
  }
  *(void *)v8 = v12;
  *((void *)v8 + 1) = *(void *)(self->super._bytesPerRow + 72);
  *((void *)v8 + 2) = v11 & 0xFF00000000000000 | *(void *)(self->super._bytesPerRow + 352) & 0xFFFFFFFFFFFFFFLL;
}

- (unint64_t)compressionFootprint
{
  if (*(unsigned __int8 *)(self->super._bytesPerRow + 57) - 1 < 3) {
    return (*(unsigned char *)(self->super._bytesPerRow + 57) - 1) + 1;
  }
  else {
    return 0;
  }
}

- (int64_t)compressionFeedback
{
  unint64_t bytesPerRow = self->super._bytesPerRow;
  v3 = (unsigned __int8 *)&unk_268D5A000;
  {
    unint64_t v30 = bytesPerRow;
    v3 = (unsigned __int8 *)&unk_268D5A000;
    unint64_t bytesPerRow = v30;
    if (v27)
    {
      AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::evaluateCompressionFeedback<AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCompressionFeedback(void)::CompressionPolicyVisitor>(void)const::disable_apple_compression = 0;
      v3 = (unsigned char *)&unk_268D5A000;
      unint64_t bytesPerRow = v30;
    }
  }
  {
    unint64_t v31 = bytesPerRow;
    v3 = (unsigned char *)&unk_268D5A000;
    unint64_t bytesPerRow = v31;
    if (v28)
    {
      AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::evaluateCompressionFeedback<AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCompressionFeedback(void)::CompressionPolicyVisitor>(void)const::disable_apple_compression_for_shared_textures = 0;
      v3 = (unsigned char *)&unk_268D5A000;
      unint64_t bytesPerRow = v31;
    }
  }
  {
    unint64_t v32 = bytesPerRow;
    v3 = (unsigned char *)&unk_268D5A000;
    unint64_t bytesPerRow = v32;
    if (v29)
    {
      AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::evaluateCompressionFeedback<AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCompressionFeedback(void)::CompressionPolicyVisitor>(void)const::disable_apple_compression_for_shared_attachments = 0;
      v3 = (unsigned char *)&unk_268D5A000;
      unint64_t bytesPerRow = v32;
    }
  }
  uint64_t v4 = *(void *)(bytesPerRow + 56);
  uint64_t v5 = (unsigned __int16)v4 & 0xFF00;
  unsigned int v6 = v3[3704];
  if (v6)
  {
    if (*(void *)(bytesPerRow + 168) | v5) {
      unsigned int v6 = 0;
    }
    else {
      unsigned int v6 = 514;
    }
  }
  int v7 = v6 | 2;
  if (*(unsigned char *)(bytesPerRow + 16)) {
    v6 |= 2u;
  }
  uint64_t v8 = *(void *)(bytesPerRow + 48);
  if (v8 == 3)
  {
    unsigned int v6 = v7;
  }
  else if (!v8)
  {
    BOOL v9 = (*(unsigned char *)(bytesPerRow + 40) & 4) == 0
      || AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::evaluateCompressionFeedback<AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCompressionFeedback(void)::CompressionPolicyVisitor>(void)const::disable_apple_compression_for_shared_attachments == 0;
    BOOL v10 = v9
       && AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::evaluateCompressionFeedback<AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCompressionFeedback(void)::CompressionPolicyVisitor>(void)const::disable_apple_compression_for_shared_textures == 0;
    if (!v10 && v5 == 0) {
      unsigned int v6 = 514;
    }
  }
  if ((v4 & 6) == 2) {
    v6 |= 0x202u;
  }
  uint64_t v12 = *(void *)(bytesPerRow + 380);
  if (!(_BYTE)v12) {
    v6 |= 0x102u;
  }
  if (*(_DWORD *)(*(void *)(bytesPerRow + 208) + 56)) {
    v6 |= 0xAu;
  }
  if ((v12 & 0xFF00) == 0x100) {
    v6 |= 0x42u;
  }
  if (*(unsigned char *)(bytesPerRow + 240)) {
    v6 |= 0x82u;
  }
  if (*(void *)(bytesPerRow + 380) != 3 && v6 <= 1)
  {
    int v14 = *(_DWORD *)(bytesPerRow + 112);
    int v15 = 8;
    unsigned int v16 = 16;
    if (v14 != 2)
    {
      if (v14 != 4)
      {
        unsigned int v17 = 16;
        if (v14 != 8)
        {
LABEL_45:
          if (*(_DWORD *)(bytesPerRow + 128) < v17 || *(_DWORD *)(bytesPerRow + 132) < v16) {
            v6 |= 0x402u;
          }
          goto LABEL_48;
        }
        int v15 = 4;
      }
      unsigned int v16 = 8;
    }
    unsigned int v17 = v16;
    unsigned int v16 = v15;
    goto LABEL_45;
  }
  if (v4) {
    goto LABEL_65;
  }
LABEL_48:
  uint64_t v19 = *(void *)(bytesPerRow + 32);
  uint64_t v18 = *(void *)(bytesPerRow + 40);
  if (!v18) {
    v6 |= 0x32u;
  }
  int v20 = *(unsigned __int8 *)(bytesPerRow + 393);
  BOOL v21 = (unint64_t)(v19 - 323) >= 3 && (unint64_t)(v19 - 123) > 2;
  if (v20) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = v21;
  }
  unsigned int v23 = v22 & (v18 >> 14);
  if ((v18 & 2) == 0) {
    unsigned int v23 = 1;
  }
  unsigned int v24 = v23 ? v6 : v6 | 0x12;
  unsigned int v6 = v24 | 0x802;
  if ((v18 & 0x20) == 0) {
    unsigned int v6 = v24;
  }
  if ((v18 & 0x10) != 0)
  {
    return v6 | 0x22;
  }
  else
  {
LABEL_65:
    if (v6 <= 1) {
      return 1;
    }
    else {
      return v6;
    }
  }
}

- (unint64_t)uniqueIdentifier
{
  return *(unsigned int *)(self->super._bytesPerRow + 120);
}

- (BOOL)validateBufferTextureWithSize:(unint64_t)a3
{
  unint64_t bytesPerRow = self->super._bytesPerRow;
  if (!*(unsigned char *)(bytesPerRow + 392)) {
    return 1;
  }
  uint64_t v4 = *(void *)(bytesPerRow + 352);
  if (v4 + 16 > a3) {
    return 0;
  }
  uint64_t v6 = *(void *)(bytesPerRow + 296);
  if (v6
    && ((int v7 = (uint64_t *)(v6 + v4), v9 = *v7, v8 = v7[1], v9 == 0x53ED1928C61E1F13)
      ? (BOOL v10 = v8 == 0xC512B61E8CC6BB6)
      : (BOOL v10 = 0),
        !v10))
  {
    return 0;
  }
  else
  {
    return 1;
  }
}

- (BOOL)isMemoryless
{
  return *(void *)(self->super._bytesPerRow + 48) == 3;
}

- (BOOL)isSparse
{
  return *(_DWORD *)(self->super._bytesPerRow + 236) != 0;
}

- (unint64_t)firstMipmapInTail
{
  unint64_t bytesPerRow = self->super._bytesPerRow;
  int v3 = *(_DWORD *)(bytesPerRow + 64);
  unsigned int v4 = (*(_DWORD *)(bytesPerRow + 128) + *(_DWORD *)(bytesPerRow + 216) - 1)
     / *(_DWORD *)(bytesPerRow + 216);
  unsigned int v5 = (*(_DWORD *)(bytesPerRow + 132) + *(_DWORD *)(bytesPerRow + 220) - 1)
     / *(_DWORD *)(bytesPerRow + 220);
  unsigned int v6 = 32 - __clz(~(-1 << -(char)__clz(v4 - 1)));
  if (v4 >= 2) {
    unsigned int v7 = v6;
  }
  else {
    unsigned int v7 = 0;
  }
  unsigned int v8 = 32 - __clz(~(-1 << -(char)__clz(v5 - 1)));
  if (v5 >= 2) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = 0;
  }
  unsigned int v10 = *(_DWORD *)(bytesPerRow + 236)
      / (*(_DWORD *)(bytesPerRow + 112)
       * *(unsigned __int8 *)(*(void *)(bytesPerRow + 208) + 88));
  unsigned int v11 = 32 - __clz(v10 - 1);
  if (v10 >= 2) {
    unsigned int v12 = v11;
  }
  else {
    unsigned int v12 = 0;
  }
  if (v3)
  {
    unsigned int v13 = 0;
    unsigned int v14 = (v12 + 1) >> 1;
    unsigned int v15 = v12 - v14;
    while (1)
    {
      unsigned int v16 = v7 - v13;
      if (v7 < v13) {
        unsigned int v16 = 0;
      }
      unsigned int v17 = v9 - v13;
      if (v9 < v13) {
        unsigned int v17 = 0;
      }
      if (v17 < v15 || v16 < v14) {
        break;
      }
      if (v3 == ++v13) {
        return 1;
      }
    }
  }
  else
  {
    return 1;
  }
  return v13;
}

- (unint64_t)tailSizeInBytes
{
  return AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::tailSize(self->super._bytesPerRow, 1);
}

- (unint64_t)tailSize
{
  return AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::tailSize(self->super._bytesPerRow, 1);
}

- (unint64_t)sparseSurfaceDefaultValue
{
  return *(unsigned int *)(self->super._bytesPerRow + 512);
}

- (unint64_t)colorSpaceConversionMatrix
{
  unint64_t result = 0;
  switch(*(_DWORD *)(self->super._bytesPerRow + 308))
  {
    case 1:
      unint64_t result = 5;
      break;
    case 2:
      unint64_t result = 7;
      break;
    case 3:
      unint64_t result = 6;
      break;
    case 4:
      unint64_t result = 8;
      break;
    case 5:
      unint64_t result = 9;
      break;
    case 6:
      unint64_t result = 10;
      break;
    case 0x1C:
      unint64_t result = 1;
      break;
    case 0x1D:
      unint64_t result = 2;
      break;
    case 0x1E:
      unint64_t result = 3;
      break;
    case 0x1F:
      unint64_t result = 4;
      break;
    default:
      return result;
  }
  return result;
}

- (void)generateMipmapLevel:(unint64_t)a3 slice:(unint64_t)a4
{
  unsigned int v4 = a4;
  unint64_t bytesPerRow = self->super._bytesPerRow;
  int v6 = *(_DWORD *)(bytesPerRow + 144);
  unsigned int v7 = v6 + a3;
  char v8 = v6 + a3 - 1;
  unsigned int v10 = *(_DWORD *)(bytesPerRow + 128);
  unsigned int v9 = *(_DWORD *)(bytesPerRow + 132);
  if (v10 >> v8 <= 1) {
    unsigned int v11 = 1;
  }
  else {
    unsigned int v11 = v10 >> (v6 + a3 - 1);
  }
  if (v9 >> v8 <= 1) {
    int v12 = 1;
  }
  else {
    int v12 = v9 >> v8;
  }
  unsigned int v43 = v12;
  unsigned int v13 = agxsDownsample<AGXSDownsamplerGeneric<unsigned char,4u>>;
  switch(*(void *)(bytesPerRow + 32))
  {
    case 1:
    case 0xALL:
    case 0xBLL:
    case 0xCLL:
    case 0xDLL:
    case 0xELL:
      unsigned int v14 = (uint8x16_t *(*)(uint8x16_t *, const float *, int, int, int))agxsDownsample<AGXSDownsamplerGeneric<unsigned char,1u>>;
      goto LABEL_10;
    case 0x1ELL:
    case 0x1FLL:
    case 0x20:
    case 0x21:
    case 0x22:
      unsigned int v14 = (uint8x16_t *(*)(uint8x16_t *, const float *, int, int, int))agxsDownsample<AGXSDownsamplerGeneric<unsigned char,2u>>;
LABEL_10:
      unsigned int v13 = v14;
      break;
    case 0x46:
    case 0x47:
    case 0x48:
    case 0x49:
    case 0x4ALL:
    case 0x50:
    case 0x51:
    case 0x54:
    case 0x55:
      break;
    default:
      unsigned int v13 = 0;
      break;
  }
  v45 = v13;
  uint64_t CPUPtr = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCPUPtr(bytesPerRow, a4, v7, 0);
  uint64_t v16 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCPUPtr(bytesPerRow, v4, v7 - 1, 0);
  if (AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::isLevelTiled(bytesPerRow, v7 - 1))
  {
    uint64_t v19 = *(void *)(bytesPerRow + 488);
    char v20 = v19 && *(_DWORD *)(v19 + 1080) > v7 && *(unsigned char *)(bytesPerRow + 57) != 0;
    BOOL v25 = 0;
    int64_t v26 = (8 * (unint64_t)*(unsigned __int8 *)(*(void *)(bytesPerRow + 208) + 88)) >> v20;
    if (v26 <= 127)
    {
      int64_t v27 = v26 - 4;
      unsigned int v28 = 128;
      unsigned int v29 = 256;
      unsigned int v30 = 0;
      unsigned int v31 = 0;
      switch(v27)
      {
        case 0:
          goto LABEL_47;
        case 1:
        case 2:
        case 3:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
          goto LABEL_49;
        case 4:
          unsigned int v29 = 128;
          goto LABEL_47;
        case 12:
          unsigned int v28 = 64;
          unsigned int v29 = 128;
          goto LABEL_47;
        case 28:
          unsigned int v29 = 64;
          unsigned int v28 = 64;
          goto LABEL_47;
        default:
          unsigned int v30 = 0;
          unsigned int v31 = 0;
          goto LABEL_49;
      }
    }
    if (v26 > 511)
    {
      if (v26 == 512)
      {
        unsigned int v29 = 16;
        unsigned int v28 = 16;
        goto LABEL_47;
      }
      unsigned int v30 = 0;
      unsigned int v31 = 0;
      if (v26 == 1024)
      {
        unsigned int v28 = 8;
        unsigned int v29 = 16;
        goto LABEL_47;
      }
    }
    else
    {
      if (v26 == 128)
      {
        unsigned int v29 = 32;
        unsigned int v28 = 32;
        goto LABEL_47;
      }
      unsigned int v30 = 0;
      unsigned int v31 = 0;
      if (v26 == 256)
      {
        unsigned int v28 = 16;
        unsigned int v29 = 32;
LABEL_47:
        BOOL v25 = v29 < v28;
        if (v28 > v43) {
          return;
        }
        unsigned int v18 = v11 / v29;
        unsigned int v30 = v28;
        unsigned int v31 = v29;
        unsigned int v17 = v43 / v28;
      }
    }
LABEL_49:
    unsigned int v32 = 33 - __clz(v18 - 1);
    if (v18 <= 1) {
      LOBYTE(v32) = 1;
    }
    char v44 = v32;
    if (v31 <= v11)
    {
      uint64_t v33 = v31 >> 1;
      uint64_t v34 = v30 >> 1;
      if (v18 <= 1) {
        int v35 = 1;
      }
      else {
        int v35 = v18;
      }
      if (v17 <= 1) {
        int v36 = 1;
      }
      else {
        int v36 = v17;
      }
      int v42 = v36;
      unsigned int v37 = 0;
      if (v25)
      {
        do
        {
          int v38 = 0;
          for (int i = 0; i != v35; ++i)
          {
            ((void (*)(unint64_t, uint64_t, uint64_t, uint64_t, void, void))v45)(CPUPtr + ((unint64_t)(v38 & 0xFFFFFFFC | (v37 >> 1 << v44) | i & 1 | (2 * (v37 & 1))) << 12), v16, v33, v34, 0, 0);
            v16 += 0x4000;
            v38 += 2;
          }
          ++v37;
        }
        while (v37 != v42);
      }
      else
      {
        do
        {
          int v40 = 0;
          int v41 = v35;
          do
          {
            ((void (*)(unint64_t, uint64_t, uint64_t, uint64_t, void, void))v45)(CPUPtr + ((unint64_t)(v40 & 0xFFFFFFFC | (v37 >> 1 << v44) | v40 & 2 | v37 & 1) << 12), v16, v33, v34, 0, 0);
            v16 += 0x4000;
            v40 += 2;
            --v41;
          }
          while (v41);
          ++v37;
        }
        while (v37 != v42);
      }
    }
    return;
  }
  if (v9 >> v7 <= 1) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = v9 >> v7;
  }
  if (v10 >> v7 <= 1) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = v10 >> v7;
  }
  BOOL v24 = v10 >> v8 < 2 || v9 >> v8 < 2;

  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, BOOL, void))v45)(CPUPtr, v16, v22, v21, v24, 0);
}

- (BOOL)canGenerateMipmapLevels
{
  return 0;
}

- (void)setSparseHeap:(id)a3
{
  unint64_t bytesPerRow = self->super._bytesPerRow;
  if (!*(unsigned char *)(bytesPerRow + 240))
  {
    *(void *)(bytesPerRow + 496) = [a3 sparsePagesResource];
    *(void *)(bytesPerRow + 504) = [a3 sparseQueueResource];
    *(void *)(bytesPerRow + 520) = [a3 sparsePageQueueAddress];
    *(void *)(bytesPerRow + 528) = a3;
  }
}

- (void)initNewTextureData:(AGXNewTextureDataStruc *)a3
{
  unint64_t bytesPerRow = self->super._bytesPerRow;
  unint64_t v4 = a3->var1.var1 & 0xFFFFFFFFFFFFFFFELL | *(unsigned __int8 *)(bytesPerRow + 232);
  a3->var1.var1 = v4;
  unint64_t v5 = v4 & 0xFFFFFFFFFFFFEFFFLL | ((unint64_t)*(unsigned __int8 *)(bytesPerRow + 316) << 12);
  a3->var1.var1 = v5;
  unint64_t v6 = v5 & 0xFFFFFFFFFFFFDFFFLL | ((unint64_t)((unint64_t)*(unsigned __int8 *)(bytesPerRow + 381) << 8 == 1024) << 13);
  a3->var1.var1 = v6;
  unint64_t v7 = v6 & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)((unint64_t)*(unsigned __int8 *)(bytesPerRow + 381) << 8 == 768) << 14);
  a3->var1.var1 = v7;
  unint64_t v8 = v7 & 0xFFFFFFFFFFFFFF8FLL | (16 * (*(unsigned char *)(*(void *)(bytesPerRow + 208) + 48) & 7));
  a3->var1.var1 = v8;
  if ((*(unsigned char *)(bytesPerRow + 382) & 2) != 0)
  {
    unsigned int v10 = *(_DWORD *)(bytesPerRow + 112);
    unsigned int v11 = (-2 * __clz(v10 - 1)) & 0xE;
    if (v10 >= 2) {
      uint64_t v9 = v11;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  unint64_t v12 = v9 | v8 & 0xFFFFFFFFFFFFFFF1;
  a3->var1.var1 = v12;
  uint64_t v13 = *(void *)(bytesPerRow + 208);
  if (*(_DWORD *)(v13 + 24) < 2u) {
    unint64_t v14 = 0;
  }
  else {
    unint64_t v14 = (unint64_t)(*(_DWORD *)(v13 + 80) != 0) << 7;
  }
  unint64_t v15 = v14 | v12 & 0xFFFFFFFFFFFFFF7FLL;
  a3->var1.var1 = v15;
  unint64_t v16 = v15 & 0xFFFFFFFFFFFFFCFFLL | ((((unint64_t)((*(unsigned __int8 *)(*(void *)(bytesPerRow + 208) + 88) << 8)
                                                         + 768) >> 8) & 3) << 8);
  a3->var1.var1 = v16;
  unint64_t v17 = v16 & 0xFFFFFFFFFFFFF3FFLL | ((((unint64_t)((*(unsigned __int8 *)(*(void *)(bytesPerRow + 208) + 89) << 10)
                                                         + 3072) >> 10) & 3) << 10);
  a3->var1.var1 = v17;
  unint64_t v18 = v17 & 0xFFFFFFFFFFF87FFFLL | ((unint64_t)(*(_DWORD *)(bytesPerRow + 216) & 0xF) << 15);
  a3->var1.var1 = v18;
  unint64_t v19 = v18 & 0xFFFFFFFFFF87FFFFLL | ((unint64_t)(*(_DWORD *)(bytesPerRow + 220) & 0xF) << 19);
  a3->var1.var1 = v19;
  unint64_t v20 = v19 & 0xFFFFFFFFF87FFFFFLL | ((unint64_t)(*(_DWORD *)(bytesPerRow + 64) & 0xF) << 23) | 0x180000000;
  a3->var1.var1 = v20;
  uint64_t v21 = *(void *)(bytesPerRow + 488);
  a3->var1.var1 = v20 & 0xFFFFFFFDFFFFFFFFLL | ((unint64_t)(v21 != 0) << 33);
  if (v21) {
    *(&a3->var1.var1 + 1) = (*(void *)(*(void *)(bytesPerRow + 488) + 360) + *(void *)(bytesPerRow + 320) - 1) & -*(void *)(bytesPerRow + 320);
  }
}

- (BOOL)updateBindDataWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 slice:(unint64_t)a7
{
  unsigned int v7 = a7;
  uint64_t v9 = *((void *)a3 + 67);
  unsigned int v10 = *(_DWORD *)(v9 + 144) + a6;
  uint64_t GPUVirtualAddress = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v9, a7, v10, 0, 0);
  unint64_t v12 = (GPUVirtualAddress + 127) & 0xFFFFFFFFFFFFFF80;
  if (GPUVirtualAddress == v12)
  {
    unint64_t bytesPerRow = (void *)self->super._bytesPerRow;
    bytesPerRow[37] = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCPUPtr(v9, v7, v10, 0);
    bytesPerRow[9] = GPUVirtualAddress;
    (*(void (**)(void *))(*bytesPerRow + 16))(bytesPerRow);
  }
  return GPUVirtualAddress == v12;
}

- (void)updateBindDataWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7
{
  unsigned int v7 = self;
  unsigned int location = a7.location;
  uint64_t v9 = 536;
  uint64_t v10 = *((void *)a3 + 67);
  unsigned int v12 = a4 == 261 && *(void *)(v10 + 32) != 261;
  unint64_t bytesPerRow = self->super._bytesPerRow;
  uint64_t v14 = *(void *)(bytesPerRow + 488);
  if (v14 && *(_DWORD *)(v14 + 1080))
  {
    if (*(_DWORD *)(*(void *)(bytesPerRow + 208) + 24) >= 2u
      && *(_DWORD *)(bytesPerRow + 376) * *(_DWORD *)(bytesPerRow + 368) != *(_DWORD *)(v10 + 376)
                                                                          * *(_DWORD *)(v10 + 368))
    {
      uint64_t GPUVirtualAddress = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(*(void *)(v10 + 488) + 536, a7.location, 0, 0, 0);
      uint64_t v16 = GPUVirtualAddress
          - AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(*(void *)(v10 + 488), a7.location, 0, 0, 0);
      uint64_t v14 = *(void *)(v7->super._bytesPerRow + 488);
      *(void *)(v14 + 1112) = v16;
    }
    uint64_t CPUPtr = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCPUPtr(*(void *)(v10 + 488) + 536 * v12, a7.location, 0, 0);
    uint64_t v18 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(*(void *)(v10 + 488) + 536 * v12, a7.location, 0, 0, 0);
    *(void *)(v14 + 296) = CPUPtr;
    *(void *)(v14 + 72) = v18;
    (*(void (**)(uint64_t))(*(void *)v14 + 16))(v14);
    if (*(void *)(v14 + 1120) >= 2uLL)
    {
      uint64_t v19 = *(void *)(v14 + 1112);
      *(void *)(v14 + 832) = CPUPtr + v19;
      *(void *)(v14 + 608) = v19 + v18;
      (*(void (**)(void))(*(void *)(v14 + 536) + 16))();
    }
  }
  unint64_t v20 = v7->super._bytesPerRow;
  if (*(_DWORD *)(*(void *)(v20 + 208) + 24) >= 2u
    && *(_DWORD *)(v20 + 376) * *(_DWORD *)(v20 + 368) != *(_DWORD *)(v10 + 376) * *(_DWORD *)(v10 + 368))
  {
    unsigned int v36 = v12;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    unsigned int v23 = 1;
    do
    {
      uint64_t v37 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCPUPtr(v10, a7.location, 0, v23);
      uint64_t v24 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCPUPtr(v10, a7.location, 0, v23 - 1);
      uint64_t v25 = v9;
      int64_t v26 = v7;
      uint64_t v27 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v10, a7.location, 0, 0, v23);
      v21 += v37 - v24;
      uint64_t v28 = v27
          - AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v10, a7.location, 0, 0, v23 - 1);
      unsigned int v7 = v26;
      uint64_t v9 = v25;
      v22 += v28;
      unsigned int v29 = *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + v25);
      uint64_t v30 = *(unsigned int *)(v29[26] + 24);
      ++v23;
    }
    while (v23 < v30);
    if (v30 >= 2)
    {
      uint64_t v31 = v30 - 1;
      unsigned int v32 = v29 + 43;
      do
      {
        *(v32 - 1) = v22;
        *v32++ = v21;
        --v31;
      }
      while (v31);
    }
    (*(void (**)(void *))(*v29 + 16))(v29);
    unint64_t v20 = *(unint64_t *)((char *)&v7->super.super.super.super.super.super.super.isa + v25);
    unsigned int v12 = v36;
    unsigned int location = a7.location;
  }
  uint64_t v33 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCPUPtr(v10, location, 0, v12);
  uint64_t v34 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getGPUVirtualAddress(v10, location, 0, 0, v12);
  *(void *)(v20 + 296) = v33;
  *(void *)(v20 + 72) = v34;
  int v35 = *(void (**)(unint64_t))(*(void *)v20 + 16);

  v35(v20);
}

- (void)updateBindDataWithAddresses:(void *)a3 gpuVirtualAddress:(unint64_t)a4
{
}

- (void)updateBindDataWithAddresses:(void *)a3 gpuVirtualAddress:(unint64_t)a4 shouldInitMetadata:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t bytesPerRow = self->super._bytesPerRow;
  uint64_t v10 = *(void *)(bytesPerRow + 488);
  if (v10 && *(_DWORD *)(v10 + 1080))
  {
    if (*(void *)(bytesPerRow + 168) && (IOSurfaceGetSliceCount() & 0xFFFFFFFELL) != 0)
    {
      uint64_t BaseAddressOfCompressedTileDataRegionOfSliceAndPlane = IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane();
      unint64_t v12 = IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane()
          - BaseAddressOfCompressedTileDataRegionOfSliceAndPlane;
    }
    else
    {
      unint64_t v12 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getPlaneSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)1>(bytesPerRow, 0, 0);
    }
    uint64_t v14 = (char *)a3 + v12;
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }

  [(AGXG17FamilyTexture *)self updateBindDataWithAddresses:a3 cpuMetadataAddress:v14 gpuVirtualAddress:a4 isCompressible:v13 shouldInitMetadata:v5];
}

- (void)updateBindDataWithAddresses:(void *)a3 cpuMetadataAddress:(void *)a4 gpuVirtualAddress:(unint64_t)a5 isCompressible:(BOOL)a6 shouldInitMetadata:(BOOL)a7
{
  if (a6)
  {
    BOOL v10 = a7;
    unint64_t bytesPerRow = self->super._bytesPerRow;
    if (*(void *)(bytesPerRow + 168) && (IOSurfaceGetSliceCount() & 0xFFFFFFFELL) != 0)
    {
      uint64_t BaseAddressOfCompressedTileDataRegionOfSliceAndPlane = IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane();
      uint64_t v14 = IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane()
          - BaseAddressOfCompressedTileDataRegionOfSliceAndPlane;
    }
    else
    {
      uint64_t v14 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getPlaneSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)0>(bytesPerRow, 0, 0);
    }
    unint64_t v15 = v14 + a5;
    uint64_t v16 = *(void **)(self->super._bytesPerRow + 488);
    v16[37] = a4;
    v16[9] = v14 + a5;
    (*(void (**)(void *))(*v16 + 16))(v16);
    if (v16[140] >= 2uLL)
    {
      uint64_t v17 = v16[139];
      v16[104] = (char *)a4 + v17;
      v16[76] = v17 + v15;
      (*(void (**)(void))(v16[67] + 16))();
    }
    if (v10)
    {
      uint64_t v18 = *(void *)(self->super._bytesPerRow + 488);
      if (*(void *)(v18 + 1120))
      {
        uint64_t v19 = 0;
        unsigned int v20 = 0;
        do
        {
          if (*(unsigned char *)(v18 + 1128)) {
            int MetadataUncompressedValue = 0;
          }
          else {
            int MetadataUncompressedValue = AGX::CompressionMetadataGen2<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getMetadataUncompressedValue(*(void *)(v18 + 1072), v20);
          }
          uint64_t v22 = v18 + 536 * v19;
          uint64_t CPUPtr = (void *)AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCPUPtr(v22, 0, 0, 0);
          size_t v24 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getPlaneSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)1>(v22, 0, 1);
          memset(CPUPtr, MetadataUncompressedValue, v24);
          uint64_t v19 = ++v20;
        }
        while (*(void *)(v18 + 1120) > (unint64_t)v20);
      }
    }
  }
  uint64_t v25 = (void *)self->super._bytesPerRow;
  v25[37] = a3;
  v25[9] = a5;
  int64_t v26 = *(void (**)(void))(*v25 + 16);

  v26();
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 slice:(unint64_t)a5 withBytes:(const void *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 bytesPerImage:(unint64_t)a5 fromRegion:(id *)a6 mipmapLevel:(unint64_t)a7 slice:(unint64_t)a8
{
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(unsigned int)a8 resourceIndex:(unint64_t)a9
{
  uint64_t v9 = *((void *)a3 + 67);
  if (*(void *)(v9 + 48) == 3)
  {
LABEL_2:
    LOBYTE(v10) = 0;
    return (char)v10;
  }
  int length = a6.length;
  int location = a6.location;
  if (a5 - 5 >= 2) {
    unsigned int v16 = 1;
  }
  else {
    unsigned int v16 = 6;
  }
  BOOL v10 = malloc_type_calloc(0x218uLL, 1uLL, 0x2041FA06uLL);
  self->super._unint64_t bytesPerRow = (unint64_t)v10;
  if (v10)
  {
    v53 = *(os_unfair_lock_s **)(v9 + 8);
    uint64_t v54 = *(void *)(v9 + 40);
    if (*(unsigned char *)(v9 + 240)) {
      int v18 = 0;
    }
    else {
      int v18 = *(_DWORD *)(v9 + 236);
    }
    uint64_t v51 = *(void *)(v9 + 56);
    uint64_t v52 = *(void *)(v9 + 48);
    int v19 = *(_DWORD *)(v9 + 308);
    int v20 = *(_DWORD *)(v9 + 192);
    unsigned int v21 = *(_DWORD *)(v9 + 128);
    unsigned int v22 = *(_DWORD *)(v9 + 132);
    unsigned int v23 = *(_DWORD *)(v9 + 140);
    unsigned int v24 = *(_DWORD *)(v9 + 144) + location;
    if (v18) {
      char v25 = 1;
    }
    else {
      char v25 = 2;
    }
    unsigned int v26 = *(_DWORD *)(v9 + 136);
    int v27 = *(_DWORD *)(v9 + 112);
    uint64_t v28 = *(void *)(v9 + 152);
    uint64_t v29 = *(void *)(v9 + 160);
    uint64_t v30 = *(void *)(v9 + 168);
    int v32 = *(_DWORD *)(v9 + 176);
    int v31 = *(_DWORD *)(v9 + 180);
    uint64_t v33 = *(void *)(v9 + 184);
    int v34 = *(unsigned __int8 *)(v9 + 232);
    int v35 = *(unsigned __int8 *)(v9 + 392);
    int v36 = *(unsigned __int8 *)(v9 + 393);
    if ((a4 - 1) > 0x284) {
      uint64_t v37 = &texFormatUnsupported;
    }
    else {
      uint64_t v37 = (uint64_t *)*(&off_26516F8A0 + (a4 - 1));
    }
    *(void *)AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::TextureGen4((uint64_t)v10, v53, 0, v25, a5, (uint64_t)v37, a4, v54, v17, v52, v51, v19, v20, a8, v21, v22, v26, v23, v27,
                 LODWORD(a7.length) / v16,
                 v28,
                 v18,
                 v29,
                 v30,
                 v32,
                 v31,
                 v33,
                 v24,
                 length,
                 v34 != 0,
                 v35 != 0,
                 v36 != 0,
                 v50,
                 a9) = off_26F853CD8;
    unint64_t bytesPerRow = self->super._bytesPerRow;
    if (!*(unsigned char *)(bytesPerRow + 200)) {
      goto LABEL_2;
    }
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B1D0]) = (Class)*(unsigned int *)(bytesPerRow + 112);
    if (!*(unsigned char *)(bytesPerRow + 16))
    {
      if (*(unsigned char *)(bytesPerRow + 232))
      {
        uint64_t v39 = *(void *)(bytesPerRow + 320);
        goto LABEL_44;
      }
      uint64_t v39 = *(unsigned int *)(bytesPerRow + 236);
      if (v39) {
        goto LABEL_44;
      }
      int v40 = (void *)(bytesPerRow + 380);
      int v41 = *(unsigned __int8 *)(bytesPerRow + 380);
      int v42 = *(unsigned __int8 *)(bytesPerRow + 381);
      unint64_t v43 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getMipmapSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)0>(bytesPerRow, 0);
      if (v42 == 1) {
        char v44 = WORD1(*v40) & 1;
      }
      else {
        char v44 = 0;
      }
      char v45 = 1;
      if ((v42 - 3) >= 2 && (v44 & 1) == 0)
      {
        if (v42 == 2) {
          char v45 = WORD1(*v40) & 1;
        }
        else {
          char v45 = 0;
        }
      }
      unsigned int v46 = (v41 - 1);
      if (v46 <= 1 && v43 >= 0x4000 && (v45 & 1) != 0)
      {
        uint64_t v39 = 0x4000;
        goto LABEL_44;
      }
      if (v46 >= 3)
      {
        if ((*v40 & 0x10000) != 0 && v42 == 2 && v41 == 0) {
          uint64_t v39 = 128;
        }
        else {
          uint64_t v39 = 16;
        }
        goto LABEL_44;
      }
    }
    uint64_t v39 = 128;
LABEL_44:
    [(AGXTexture *)self set_alignment:v39];
    [(AGXTexture *)self set_cpuSizeBytes:*(void *)(self->super._bytesPerRow + 352)];
    -[AGXTexture set_bytesPerRow:](self, "set_bytesPerRow:", AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getStride<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)1,(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::Units)0,(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::Op)0>(self->super._bytesPerRow, 0));
    *(void *)((char *)&self->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
              + (int)*MEMORY[0x263F4B188]) = *(void *)((unsigned char *)&self->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
                                                       + (int)*MEMORY[0x263F4B188]) & 0x1FFFFFFFFFFFFFFFLL | 0x4000000000000000;
    LOBYTE(v10) = 1;
  }
  return (char)v10;
}

- (BOOL)initImplWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 resourceIndex:(unint64_t)a7
{
  unsigned int v7 = self;
  LOBYTE(self) = 0;
  if (a5 == 2 && a4 == 123)
  {
    uint64_t v8 = *((void *)a3 + 67);
    if (*(unsigned char *)(v8 + 316))
    {
      unsigned int v9 = a7;
      *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B1C8]) = (Class)123;
      int v10 = *(_DWORD *)(v8 + 144) + a6;
      unsigned int v11 = *(_DWORD *)(v8 + 132);
      unsigned int v12 = *(_DWORD *)(v8 + 128) >> (*(unsigned char *)(v8 + 144) + a6);
      if (v12 <= 1) {
        unsigned int v12 = 1;
      }
      unsigned int v13 = *(_DWORD *)(v8 + 220);
      uint64_t v14 = (objc_class *)((*(_DWORD *)(v8 + 216) + v12 - 1) / *(_DWORD *)(v8 + 216));
      *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B1E0]) = v14;
      unsigned int v15 = v11 >> v10;
      if (v15 <= 1) {
        unsigned int v15 = 1;
      }
      unsigned int v16 = (objc_class *)((v13 + v15 - 1) / v13);
      *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B1A0]) = v16;
      *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B1B0]) = (Class)1;
      *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B198]) = (Class)1;
      *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B190]) = (Class)1;
      *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B1D0]) = (Class)1;
      *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B1D8]) = (Class)2;
      self = (AGXG17FamilyTexture *)malloc_type_calloc(0x218uLL, 1uLL, 0xD6571D39uLL);
      v7->super._uint64_t bytesPerRow = (unint64_t)self;
      if (self)
      {
        if (*(unsigned char *)(v8 + 240)) {
          int v18 = 0;
        }
        else {
          int v18 = *(_DWORD *)(v8 + 236);
        }
        if (v18) {
          char v19 = 1;
        }
        else {
          char v19 = 2;
        }
        *(void *)AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::TextureGen4((uint64_t)self, *(os_unfair_lock_s **)(v8 + 8), 0, v19, 2, (uint64_t)&texFormatRGBA32UI, 123, *(void *)(v8 + 40), v17, *(void *)(v8 + 48), 2, *(_DWORD *)(v8 + 308), *(_DWORD *)(v8 + 192), *(_DWORD *)(v8 + 196), v14, v16, 1u, 1u, 1,
                     1,
                     *(void *)(v8 + 152),
                     v18,
                     *(void *)(v8 + 160),
                     0,
                     0,
                     0,
                     0,
                     0,
                     1,
                     *(unsigned char *)(v8 + 232),
                     *(_WORD *)(v8 + 392),
                     HIBYTE(*(_WORD *)(v8 + 392)),
                     v36,
                     v9) = off_26F853CD8;
        uint64_t bytesPerRow = v7->super._bytesPerRow;
        if (*(unsigned char *)(bytesPerRow + 200))
        {
          int v21 = *(unsigned __int8 *)(v8 + 232);
          *(unsigned char *)(bytesPerRow + 232) = v21;
          if (v21)
          {
            long long v22 = *(_OWORD *)(v8 + 242);
            *(void *)(bytesPerRow + 258) = *(void *)(v8 + 258);
            *(_OWORD *)(bytesPerRow + 242) = v22;
            long long v23 = *(_OWORD *)(v8 + 266);
            *(void *)(bytesPerRow + 282) = *(void *)(v8 + 282);
            *(_OWORD *)(bytesPerRow + 266) = v23;
            uint64_t bytesPerRow = v7->super._bytesPerRow;
          }
          if (*(_DWORD *)(v8 + 236) && !*(unsigned char *)(bytesPerRow + 240))
          {
            unsigned int v24 = *(void **)(v8 + 528);
            *(void *)(bytesPerRow + 496) = [v24 sparsePagesResource];
            *(void *)(bytesPerRow + 504) = [v24 sparseQueueResource];
            *(void *)(bytesPerRow + 520) = [v24 sparsePageQueueAddress];
            *(void *)(bytesPerRow + 528) = v24;
            uint64_t bytesPerRow = v7->super._bytesPerRow;
          }
          if (!*(unsigned char *)(bytesPerRow + 16))
          {
            if (*(unsigned char *)(bytesPerRow + 232))
            {
              uint64_t v25 = *(void *)(bytesPerRow + 320);
              goto LABEL_49;
            }
            uint64_t v25 = *(unsigned int *)(bytesPerRow + 236);
            if (v25) {
              goto LABEL_49;
            }
            int v26 = *(unsigned __int8 *)(bytesPerRow + 380);
            int v27 = *(unsigned __int8 *)(bytesPerRow + 381);
            unint64_t v28 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getMipmapSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)0>(bytesPerRow, 0);
            uint64_t v29 = *(void *)(bytesPerRow + 380);
            if (v27 == 1) {
              char v30 = BYTE2(v29) & 1;
            }
            else {
              char v30 = 0;
            }
            char v31 = 1;
            if ((v27 - 3) >= 2 && (v30 & 1) == 0)
            {
              if (v27 == 2) {
                char v31 = BYTE2(v29) & 1;
              }
              else {
                char v31 = 0;
              }
            }
            unsigned int v32 = (v26 - 1);
            if (v32 <= 1 && v28 >= 0x4000 && (v31 & 1) != 0)
            {
              uint64_t v25 = 0x4000;
              goto LABEL_49;
            }
            if (v32 >= 3)
            {
              if ((v29 & 0x10000) != 0 && v27 == 2 && v26 == 0) {
                uint64_t v25 = 128;
              }
              else {
                uint64_t v25 = 16;
              }
              goto LABEL_49;
            }
          }
          uint64_t v25 = 128;
LABEL_49:
          [(AGXTexture *)v7 set_alignment:v25];
          [(AGXTexture *)v7 set_cpuSizeBytes:*(void *)(v7->super._bytesPerRow + 352)];
          -[AGXTexture set_bytesPerRow:](v7, "set_bytesPerRow:", AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getStride<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)1,(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::Units)0,(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::Op)0>(v7->super._bytesPerRow, 0));
          *(void *)((char *)&v7->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
                    + (int)*MEMORY[0x263F4B188]) = *(void *)((unsigned char *)&v7->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
                                                             + (int)*MEMORY[0x263F4B188]) & 0x1FFFFFFFFFFFFFFFLL | 0x4000000000000000;
          LOBYTE(self) = 1;
          return (char)self;
        }
        LOBYTE(self) = 0;
      }
    }
  }
  return (char)self;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 resourceIndex:(unint64_t)a8
{
  uint64_t v8 = *((void *)a3 + 67);
  if (*(void *)(v8 + 48) == 3)
  {
LABEL_2:
    LOBYTE(v9) = 0;
    return (char)v9;
  }
  int length = a6.length;
  int location = a6.location;
  if (a5 - 5 >= 2) {
    unsigned int v16 = 1;
  }
  else {
    unsigned int v16 = 6;
  }
  unsigned int v9 = (atomic_ullong *)malloc_type_calloc(0x218uLL, 1uLL, 0x5CAE185BuLL);
  self->super._unint64_t bytesPerRow = (unint64_t)v9;
  if (v9)
  {
    id v37 = a3;
    if (*(unsigned char *)(v8 + 240)) {
      int v18 = 0;
    }
    else {
      int v18 = *(_DWORD *)(v8 + 236);
    }
    if (v18) {
      char v19 = 1;
    }
    else {
      char v19 = 2;
    }
    if ((a4 - 1) > 0x284) {
      int v20 = &texFormatUnsupported;
    }
    else {
      int v20 = (uint64_t *)*(&off_26516F8A0 + (a4 - 1));
    }
    *(void *)AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::TextureGen4((uint64_t)v9, *(os_unfair_lock_s **)(v8 + 8), 0, v19, a5, (uint64_t)v20, a4, *(void *)(v8 + 40), v17, *(void *)(v8 + 48), *(void *)(v8 + 56), *(_DWORD *)(v8 + 308), *(_DWORD *)(v8 + 192), *(_DWORD *)(v8 + 196), *(_DWORD *)(v8 + 128), *(_DWORD *)(v8 + 132), *(_DWORD *)(v8 + 136), *(_DWORD *)(v8 + 140), *(_DWORD *)(v8 + 112),
                 LODWORD(a7.length) / v16,
                 *(void *)(v8 + 152),
                 v18,
                 *(void *)(v8 + 160),
                 *(void *)(v8 + 168),
                 *(_DWORD *)(v8 + 176),
                 *(_DWORD *)(v8 + 180),
                 *(void *)(v8 + 184),
                 *(_DWORD *)(v8 + 144) + location,
                 length,
                 *(unsigned char *)(v8 + 232) != 0,
                 *(unsigned char *)(v8 + 392) != 0,
                 *(unsigned char *)(v8 + 393) != 0,
                 v36,
                 a8) = off_26F853CD8;
    unint64_t bytesPerRow = self->super._bytesPerRow;
    if (!*(unsigned char *)(bytesPerRow + 200)) {
      goto LABEL_2;
    }
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B1D0]) = (Class)*(unsigned int *)(bytesPerRow + 112);
    if (*(unsigned char *)(bytesPerRow + 16))
    {
LABEL_18:
      uint64_t v22 = 128;
      goto LABEL_44;
    }
    if (*(unsigned char *)(bytesPerRow + 232))
    {
      uint64_t v22 = *(void *)(bytesPerRow + 320);
    }
    else
    {
      uint64_t v22 = *(unsigned int *)(bytesPerRow + 236);
      if (!v22)
      {
        long long v23 = (void *)(bytesPerRow + 380);
        int v24 = *(unsigned __int8 *)(bytesPerRow + 380);
        int v25 = *(unsigned __int8 *)(bytesPerRow + 381);
        unint64_t v26 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getMipmapSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)0>(bytesPerRow, 0);
        if (v25 == 1) {
          char v27 = WORD1(*v23) & 1;
        }
        else {
          char v27 = 0;
        }
        char v28 = 1;
        if ((v25 - 3) >= 2 && (v27 & 1) == 0)
        {
          if (v25 == 2) {
            char v28 = WORD1(*v23) & 1;
          }
          else {
            char v28 = 0;
          }
        }
        unsigned int v29 = (v24 - 1);
        if (v29 > 1 || v26 < 0x4000 || (v28 & 1) == 0)
        {
          if (v29 >= 3)
          {
            if ((*v23 & 0x10000) != 0 && v25 == 2 && v24 == 0) {
              uint64_t v22 = 128;
            }
            else {
              uint64_t v22 = 16;
            }
            goto LABEL_44;
          }
          goto LABEL_18;
        }
        uint64_t v22 = 0x4000;
      }
    }
LABEL_44:
    [(AGXTexture *)self set_alignment:v22];
    [(AGXTexture *)self set_cpuSizeBytes:*(void *)(self->super._bytesPerRow + 352)];
    -[AGXTexture set_bytesPerRow:](self, "set_bytesPerRow:", AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getStride<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)1,(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::Units)0,(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::Op)0>(self->super._bytesPerRow, 0));
    unint64_t v32 = self->super._bytesPerRow;
    if (*(_DWORD *)(v8 + 236) && !*(unsigned char *)(v32 + 240))
    {
      uint64_t v33 = *(void **)(v8 + 528);
      *(void *)(v32 + 496) = [v33 sparsePagesResource];
      *(void *)(v32 + 504) = [v33 sparseQueueResource];
      *(void *)(v32 + 520) = [v33 sparsePageQueueAddress];
      *(void *)(v32 + 528) = v33;
      unint64_t v32 = self->super._bytesPerRow;
    }
    if (*(_DWORD *)(*(void *)(v8 + 208) + 28) == *(_DWORD *)(*(void *)(v32 + 208) + 28)) {
      unint64_t v34 = 0x4000000000000001;
    }
    else {
      unint64_t v34 = 0xC000000000000000;
    }
    unsigned int v9 = (atomic_ullong *)[v37 device];
    atomic_fetch_or(v9 + 102, v34);
    atomic_fetch_or(v9 + 103, 0);
    *(void *)((char *)&self->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
              + (int)*MEMORY[0x263F4B188]) = *(void *)((unsigned char *)&self->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
                                                       + (int)*MEMORY[0x263F4B188]) & 0x1FFFFFFFFFFFFFFFLL | 0x4000000000000000;
    LOBYTE(v9) = 1;
  }
  return (char)v9;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  return -[AGXG17FamilyTexture initImplWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:](self, "initImplWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:", 0, *(void *)((char *)a3 + (int)*MEMORY[0x263F4B190]) * *(void *)((char *)a3 + (int)*MEMORY[0x263F4B1B8]), a5);
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(unsigned int)a8
{
  LODWORD(v9) = a8;
  return -[AGXG17FamilyTexture initImplWithTexture:pixelFormat:textureType:levels:slices:swizzle:resourceIndex:](self, "initImplWithTexture:pixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, v9, 0);
}

- (BOOL)initImplWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6
{
  return [(AGXG17FamilyTexture *)self initImplWithCompressedTexture:a3 pixelFormat:a4 textureType:a5 level:a6 resourceIndex:0];
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7
{
  return -[AGXG17FamilyTexture initImplWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:](self, "initImplWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, 0);
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4
{
  return [(AGXG17FamilyTexture *)self initImplWithTexture:a3 pixelFormat:a4 resourceIndex:0];
}

- (BOOL)initImplWithDevice:(id)a3 Descriptor:(id)a4 iosurface:(__IOSurface *)a5 plane:(unint64_t)a6 slice:(unint64_t)a7 buffer:(id)a8 bytesPerRow:(unint64_t)a9 allowNPOT:(BOOL)a10 sparsePageSize:(unint64_t)a11 isCompressedIOSurface:(BOOL)a12 isHeapBacked:(BOOL)a13
{
  int v14 = a7;
  uint64_t v104 = *MEMORY[0x263EF8340];
  uint64_t v20 = [a4 descriptorPrivate];
  uint64_t v21 = v20;
  int v96 = v14;
  char v22 = 0;
  if ((unint64_t)a5 | (unint64_t)a8)
  {
    switch(*(void *)(v20 + 8))
    {
      case 0x82:
      case 0x83:
      case 0x84:
      case 0x85:
      case 0x86:
      case 0x87:
      case 0x8CLL:
      case 0x8DLL:
      case 0x8ELL:
      case 0x8FLL:
      case 0x96:
      case 0x97:
      case 0x98:
      case 0x99:
      case 0xA0:
      case 0xA1:
      case 0xA2:
      case 0xA3:
      case 0xA4:
      case 0xA5:
      case 0xA6:
      case 0xA7:
      case 0xAALL:
      case 0xACLL:
      case 0xAELL:
      case 0xB0:
      case 0xB2:
      case 0xB3:
      case 0xB4:
      case 0xB5:
      case 0xB6:
      case 0xB7:
      case 0xB9:
      case 0xBALL:
      case 0xBBLL:
      case 0xBCLL:
      case 0xBDLL:
      case 0xBELL:
      case 0xBFLL:
      case 0xC0:
      case 0xC1:
      case 0xC2:
      case 0xC3:
      case 0xC4:
      case 0xC5:
      case 0xC6:
      case 0xC7:
      case 0xC8:
      case 0xCBLL:
      case 0xCCLL:
      case 0xCDLL:
      case 0xCELL:
      case 0xCFLL:
      case 0xD0:
      case 0xD1:
      case 0xD2:
      case 0xD3:
      case 0xD4:
      case 0xD5:
      case 0xD6:
      case 0xD7:
      case 0xD8:
      case 0xD9:
      case 0xDALL:
      case 0xDDLL:
      case 0xDELL:
      case 0xDFLL:
      case 0xE0:
      case 0xE1:
      case 0xE2:
      case 0xE3:
      case 0xE4:
      case 0xE5:
      case 0xE6:
      case 0xE7:
      case 0xE8:
      case 0xE9:
      case 0xEALL:
      case 0xEBLL:
      case 0xECLL:
        char v22 = 1;
        break;
      default:
        break;
    }
  }
  uint64_t v23 = [a8 iosurface];
  v97 = a5;
  unint64_t CompressionSettings = getCompressionSettings(v21, (uint64_t)a5, a6, a12, (uint64_t)a3);
  if (!v25) {
    goto LABEL_69;
  }
  unint64_t v26 = CompressionSettings;
  char v27 = malloc_type_calloc(0x218uLL, 1uLL, 0xBBBEA729uLL);
  self->super._uint64_t bytesPerRow = (unint64_t)v27;
  if (v27)
  {
    char v28 = v27;
    uint64_t v92 = v23;
    uint64_t v29 = *(void *)(v21 + 8);
    uint64_t v91 = *(void *)v21;
    v89 = (os_unfair_lock_s *)*((void *)a3 + 101);
    uint64_t v90 = *(void *)(v21 + 104);
    unint64_t v30 = *(void *)(v21 + 168) - 1;
    v94 = self;
    uint64_t v93 = v26;
    id v95 = a4;
    v82 = a3;
    if (v30 > 9) {
      int v88 = 0;
    }
    else {
      int v88 = dword_242EAC4F0[v30];
    }
    uint64_t v87 = *(void *)(v21 + 192);
    if ((unint64_t)(*(void *)(v21 + 72) - 1) < 4) {
      int v31 = *(_DWORD *)(v21 + 72);
    }
    else {
      int v31 = 0;
    }
    int v85 = *(_DWORD *)(v21 + 84);
    int v86 = v31;
    unsigned int v84 = *(_DWORD *)(v21 + 16);
    unsigned int v83 = *(_DWORD *)(v21 + 24);
    unsigned int v32 = *(_DWORD *)(v21 + 32);
    unsigned int v33 = *(_DWORD *)(v21 + 40);
    int v34 = *(_DWORD *)(v21 + 48);
    int v35 = *(_DWORD *)(v21 + 56);
    uint64_t v36 = *(void *)(v21 + 112) & 0xFLL;
    if (a8) {
      a13 = 1;
    }
    unsigned int v38 = [v95 resourceIndex];
    if (a11) {
      char v40 = 1;
    }
    else {
      char v40 = 2;
    }
    if ((v29 - 1) > 0x284) {
      int v41 = &texFormatUnsupported;
    }
    else {
      int v41 = (uint64_t *)*(&off_26516F8A0 + (v29 - 1));
    }
    AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::TextureGen4((uint64_t)v28, v89, 0, v40, v91, (uint64_t)v41, v29, v90, v39, v87, v93, v88, v86, v85, v84, v83, v32, v33, v34,
      v35,
      a9,
      a11,
      v36,
      (uint64_t)v97,
      a6,
      v96,
      v92,
      0,
      v33,
      a10,
      v22,
      a13,
      v81,
      v38);
    *char v28 = off_26F853CD8;
    uint64_t bytesPerRow = v94->super._bytesPerRow;
    if (!*(unsigned char *)(bytesPerRow + 200)) {
      goto LABEL_69;
    }
    *(Class *)((char *)&v94->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B1D0]) = (Class)*(unsigned int *)(bytesPerRow + 112);
    if (*(unsigned char *)(bytesPerRow + 16))
    {
      uint64_t v43 = 128;
      char v44 = v95;
      char v45 = v82;
      BOOL v46 = a12;
    }
    else
    {
      char v44 = v95;
      char v45 = v82;
      BOOL v46 = a12;
      if (*(unsigned char *)(bytesPerRow + 232))
      {
        uint64_t v43 = *(void *)(bytesPerRow + 320);
      }
      else
      {
        uint64_t v43 = *(unsigned int *)(bytesPerRow + 236);
        if (!v43)
        {
          v47 = (void *)(bytesPerRow + 380);
          int v48 = *(unsigned __int8 *)(bytesPerRow + 380);
          int v49 = *(unsigned __int8 *)(bytesPerRow + 381);
          unint64_t v50 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getMipmapSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)0>(bytesPerRow, 0);
          if (v49 == 1) {
            char v51 = WORD1(*v47) & 1;
          }
          else {
            char v51 = 0;
          }
          char v52 = 1;
          if ((v49 - 3) >= 2 && (v51 & 1) == 0)
          {
            if (v49 == 2) {
              char v52 = WORD1(*v47) & 1;
            }
            else {
              char v52 = 0;
            }
          }
          unsigned int v53 = (v48 - 1);
          if (v53 <= 1 && v50 >= 0x4000 && (v52 & 1) != 0)
          {
            uint64_t v43 = 0x4000;
          }
          else if (v53 >= 3)
          {
            if ((*v47 & 0x10000) != 0 && v49 == 2 && v48 == 0) {
              uint64_t v43 = 128;
            }
            else {
              uint64_t v43 = 16;
            }
          }
          else
          {
            uint64_t v43 = 128;
          }
        }
      }
    }
    [(AGXTexture *)v94 set_alignment:v43];
    [(AGXTexture *)v94 set_cpuSizeBytes:*(void *)(v94->super._bytesPerRow + 352)];
    -[AGXTexture set_bytesPerRow:](v94, "set_bytesPerRow:", AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getStride<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)1,(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::Units)0,(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::Op)0>(v94->super._bytesPerRow, 0));
    if (a11)
    {
      unint64_t v56 = v94->super._bytesPerRow;
      *(_DWORD *)(v56 + 512) = [v44 sparseSurfaceDefaultValue];
    }
    *(&v94->super.super._allowGPUOptimizedContents + 1) = [v44 protectionOptions] == 0;
    BOOL v58 = ([v44 resourceOptions] & 0x80000) == 0 && *(&v94->super.super._allowGPUOptimizedContents + 1);
    *(&v94->super.super._allowGPUOptimizedContents + 1) = v58;
    if (*(unsigned char *)(v45[101] + 7804))
    {
      BOOL v60 = [v44 storageMode] != 2 && *(&v94->super.super._allowGPUOptimizedContents + 1);
      *(&v94->super.super._allowGPUOptimizedContents + 1) = v60;
    }
    if (v97)
    {
      uint64_t v61 = *(void *)(v94->super._bytesPerRow + 488);
      if (v61)
      {
        if (((*(_DWORD *)(v61 + 1080) != 0) ^ v46))
        {
LABEL_69:
          LOBYTE(v27) = 0;
          return (char)v27;
        }
      }
      else if (v46)
      {
        goto LABEL_69;
      }
    }
    v62 = v45 + 102;
    if (*((unsigned char *)v45 + 936))
    {
      uint64_t v63 = [v44 pixelFormat];
      if ((unint64_t)(v63 - 250) > 0xB)
      {
        LOBYTE(v66) = 0;
        uint64_t v65 = 13;
      }
      else
      {
        uint64_t v64 = 8 * (v63 - 250);
        uint64_t v65 = *(void *)((char *)&unk_242EAC410 + v64);
        uint64_t v66 = *(void *)((char *)&unk_242EAC470 + v64);
      }
      uint64_t v67 = 1 << v66;
      __int16 v68 = [v44 resourceOptions];
      uint64_t v69 = 0x100000000000000;
      if ((v68 & 0x100) == 0) {
        uint64_t v69 = 1;
      }
      uint64_t v70 = v69 | v67;
      switch([v44 textureType])
      {
        case 0:
          v70 |= 0x40000uLL;
          break;
        case 1:
          v70 |= 0x80000uLL;
          break;
        case 2:
          v70 |= 0x100000uLL;
          break;
        case 3:
          v70 |= 0x200000uLL;
          break;
        case 4:
          v70 |= 0x400000uLL;
          break;
        case 5:
          v70 |= 0x800000uLL;
          break;
        case 6:
          v70 |= 0x1000000uLL;
          break;
        case 7:
          v70 |= 0x2000000uLL;
          break;
        default:
          break;
      }
      uint64_t v71 = [v44 storageMode];
      switch(v71)
      {
        case 3:
          v70 |= 0x20000000000000uLL;
          break;
        case 2:
          v70 |= 0x10000000000000uLL;
          break;
        case 0:
          v70 |= 0x8000000000000uLL;
          break;
      }
      if ([v44 usage]) {
        unint64_t v72 = v70 | ([v44 usage] << 28);
      }
      else {
        unint64_t v72 = v70 | 0x8000000;
      }
      if (*(unsigned char *)(v94->super._bytesPerRow + 316))
      {
        uint64_t v73 = [v44 pixelFormat];
        BOOL v74 = v73 == 227 || v73 == 221;
        unint64_t v75 = 0x800000;
        if (!v74) {
          unint64_t v75 = 0;
        }
      }
      else
      {
        unint64_t v75 = 0;
      }
      atomic_fetch_or(v62, v72);
      atomic_fetch_or(v45 + 103, v75);
      uint64_t v76 = [v44 pixelFormat];
      uint64_t v77 = 0;
      switch(v76)
      {
        case 1:
        case 10:
        case 11:
          goto LABEL_171;
        case 12:
          uint64_t v77 = 4;
          goto LABEL_171;
        case 13:
          uint64_t v77 = 8;
          goto LABEL_171;
        case 14:
          uint64_t v77 = 12;
          goto LABEL_171;
        case 20:
          uint64_t v77 = 20;
          goto LABEL_171;
        case 22:
          uint64_t v77 = 24;
          goto LABEL_171;
        case 23:
          uint64_t v77 = 28;
          goto LABEL_171;
        case 24:
          uint64_t v77 = 32;
          goto LABEL_171;
        case 25:
          uint64_t v77 = 16;
          goto LABEL_171;
        case 30:
        case 31:
          uint64_t v77 = 1;
          goto LABEL_171;
        case 32:
          uint64_t v77 = 5;
          goto LABEL_171;
        case 33:
          uint64_t v77 = 9;
          goto LABEL_171;
        case 34:
          uint64_t v77 = 13;
          goto LABEL_171;
        case 40:
        case 41:
        case 42:
        case 43:
          uint64_t v77 = 48;
          goto LABEL_171;
        case 53:
          uint64_t v77 = 40;
          goto LABEL_171;
        case 54:
          uint64_t v77 = 44;
          goto LABEL_171;
        case 55:
          uint64_t v77 = 36;
          goto LABEL_171;
        case 60:
          uint64_t v77 = 21;
          goto LABEL_171;
        case 62:
          uint64_t v77 = 25;
          goto LABEL_171;
        case 63:
          uint64_t v77 = 29;
          goto LABEL_171;
        case 64:
          uint64_t v77 = 33;
          goto LABEL_171;
        case 65:
          uint64_t v77 = 17;
          goto LABEL_171;
        case 70:
        case 71:
        case 80:
        case 81:
          uint64_t v77 = 3;
          goto LABEL_171;
        case 72:
          uint64_t v77 = 7;
          goto LABEL_171;
        case 73:
          uint64_t v77 = 11;
          goto LABEL_171;
        case 74:
          uint64_t v77 = 15;
          goto LABEL_171;
        case 90:
        case 91:
          uint64_t v77 = 49;
          goto LABEL_171;
        case 92:
          uint64_t v77 = 52;
          goto LABEL_171;
        case 93:
          uint64_t v77 = 51;
          goto LABEL_171;
        case 103:
          uint64_t v77 = 41;
          goto LABEL_171;
        case 104:
          uint64_t v77 = 45;
          goto LABEL_171;
        case 105:
          uint64_t v77 = 37;
          goto LABEL_171;
        case 110:
          uint64_t v77 = 23;
          goto LABEL_171;
        case 112:
          uint64_t v77 = 27;
          goto LABEL_171;
        case 113:
          uint64_t v77 = 31;
          goto LABEL_171;
        case 114:
          uint64_t v77 = 35;
          goto LABEL_171;
        case 115:
          uint64_t v77 = 19;
          goto LABEL_171;
        case 123:
          uint64_t v77 = 43;
          goto LABEL_171;
        case 124:
          uint64_t v77 = 47;
          goto LABEL_171;
        case 125:
          uint64_t v77 = 39;
          goto LABEL_171;
        case 160:
        case 161:
        case 164:
        case 165:
          uint64_t v77 = 57;
          goto LABEL_171;
        case 162:
        case 163:
        case 166:
        case 167:
          uint64_t v77 = 58;
          goto LABEL_171;
        case 170:
        case 172:
        case 174:
        case 176:
        case 178:
        case 179:
          uint64_t v77 = 60;
          goto LABEL_171;
        case 180:
        case 181:
        case 182:
        case 183:
          uint64_t v77 = 59;
          goto LABEL_171;
        case 186:
        case 204:
          uint64_t v77 = 61;
          goto LABEL_171;
        case 187:
        case 205:
          uint64_t v77 = 62;
          goto LABEL_171;
        case 188:
        case 206:
          uint64_t v77 = 63;
          goto LABEL_171;
        case 189:
        case 207:
          uint64_t v77 = 64;
          goto LABEL_171;
        case 190:
        case 208:
          uint64_t v77 = 65;
          goto LABEL_171;
        case 192:
        case 210:
          uint64_t v77 = 66;
          goto LABEL_171;
        case 193:
        case 211:
          uint64_t v77 = 67;
          goto LABEL_171;
        case 194:
        case 212:
          uint64_t v77 = 68;
          goto LABEL_171;
        case 195:
        case 213:
          uint64_t v77 = 69;
          goto LABEL_171;
        case 196:
        case 214:
          uint64_t v77 = 70;
          goto LABEL_171;
        case 197:
        case 215:
          uint64_t v77 = 71;
          goto LABEL_171;
        case 198:
        case 216:
          uint64_t v77 = 72;
          goto LABEL_171;
        case 199:
        case 217:
          uint64_t v77 = 73;
          goto LABEL_171;
        case 200:
        case 218:
          uint64_t v77 = 74;
          goto LABEL_171;
        case 240:
        case 241:
          uint64_t v77 = 75;
          goto LABEL_171;
        case 250:
          uint64_t v77 = 54;
          goto LABEL_171;
        case 252:
          uint64_t v77 = 53;
          goto LABEL_171;
        case 253:
        case 261:
          uint64_t v77 = 56;
          goto LABEL_171;
        case 260:
          uint64_t v77 = 55;
          goto LABEL_171;
        case 552:
        case 553:
        case 554:
        case 555:
        case 631:
        case 632:
          uint64_t v77 = 76;
          goto LABEL_171;
        case 642:
          uint64_t v77 = 79;
          goto LABEL_171;
        case 643:
          uint64_t v77 = 77;
          goto LABEL_171;
        case 644:
          uint64_t v77 = 80;
          goto LABEL_171;
        case 645:
          uint64_t v77 = 78;
LABEL_171:
          atomic_fetch_add(&v62[v77 + 37], 1uLL);
          break;
        default:
          break;
      }
      v78 = (char *)(v45 + 118);
      if ((v93 & 2) != 0)
      {
        uint64_t v79 = 12;
      }
      else if ((v93 & 0xFC00) != 0)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** Unsupported compression footprint!\n", "agxa_texture_objc.mm", 313, "lossyTelemetryFromCompressionSettings");
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v99 = "agxa_texture_objc.mm";
          __int16 v100 = 1024;
          int v101 = 313;
          __int16 v102 = 2080;
          v103 = "lossyTelemetryFromCompressionSettings";
          _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Unsupported compression footprint!\n", buf, 0x1Cu);
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v99 = "agxa_texture_objc.mm";
          __int16 v100 = 1024;
          int v101 = 313;
          __int16 v102 = 2080;
          v103 = "lossyTelemetryFromCompressionSettings";
          _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Unsupported compression footprint!\n", buf, 0x1Cu);
        }
      }
      else
      {
        uint64_t v79 = qword_242EAC4D0[(uint64_t)(__int16)v93 >> 8];
      }
      atomic_fetch_add((atomic_ullong *volatile)&v78[8 * v79], 1uLL);
      if (*(_DWORD *)(v94->super._bytesPerRow + 236)) {
        atomic_fetch_add((atomic_ullong *volatile)&v78[8 * v65], 1uLL);
      }
    }
    *(void *)((char *)&v94->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
              + (int)*MEMORY[0x263F4B188]) = *(void *)((unsigned char *)&v94->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
                                                       + (int)*MEMORY[0x263F4B188]) & 0x1FFFFFFFFFFFFFFFLL | 0x4000000000000000;
    LOBYTE(v27) = 1;
  }
  return (char)v27;
}

- (void)dealloc
{
  if (self->super._bytesPerRow)
  {
    if ([(AGXG17FamilyTexture *)self isSparse]) {
      [*(id *)(self->super._bytesPerRow + 528) removeTexture:self];
    }
    int v3 = (void **)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B188]);
    (**(void (***)(unint64_t))self->super._bytesPerRow)(self->super._bytesPerRow);
    free((void *)self->super._bytesPerRow);
    self->super._uint64_t bytesPerRow = 0;
    if ((*((unsigned char *)v3 + 23) & 0x10) == 0 && *v3) {
      free(*v3);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXG17FamilyTexture;
  [(AGXTexture *)&v4 dealloc];
}

@end