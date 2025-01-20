@interface AGXTextureLayout
- ($71D83D51AB0F57F7CF166351F850C832)watermark;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)copyGranularity;
- (AGXTextureLayout)initWithDevice:(id)a3 descriptor:(id)a4 isHeapOrBufferBacked:(BOOL)a5;
- (unint64_t)alignment;
- (unint64_t)size;
- (void)copyFromLinearBytes:(const void *)a3 linearOffset:(unint64_t)a4 linearBytesPerRow:(unint64_t)a5 linearBytesPerImage:(unint64_t)a6 toTextureMemory:(void *)a7 textureSlice:(unint64_t)a8 textureLevel:(unint64_t)a9 textureRegion:(id *)a10;
- (void)copyFromTextureMemory:(const void *)a3 textureSlice:(unint64_t)a4 textureLevel:(unint64_t)a5 textureRegion:(id *)a6 toLinearBytes:(void *)a7 linearOffset:(unint64_t)a8 linearBytesPerRow:(unint64_t)a9 linearBytesPerImage:(unint64_t)a10;
- (void)dealloc;
- (void)finalizeTextureMemory:(void *)a3;
- (void)initializeTextureMemory:(void *)a3;
@end

@implementation AGXTextureLayout

- (void)finalizeTextureMemory:(void *)a3
{
  *(_OWORD *)((char *)a3 + *((void *)self->_impl + 44)) = AGX::HAL200::Texture::twiddle_hash;
}

- (void)copyFromTextureMemory:(const void *)a3 textureSlice:(unint64_t)a4 textureLevel:(unint64_t)a5 textureRegion:(id *)a6 toLinearBytes:(void *)a7 linearOffset:(unint64_t)a8 linearBytesPerRow:(unint64_t)a9 linearBytesPerImage:(unint64_t)a10
{
  int v26 = a5;
  unsigned int v27 = a4;
  impl = self->_impl;
  uint64_t v15 = impl[61];
  if (v15 && *(_DWORD *)(v15 + 1080))
  {
    if (impl[21] && (IOSurfaceGetSliceCount() & 0xFFFFFFFELL) != 0)
    {
      uint64_t BaseAddressOfCompressedTileDataRegionOfSliceAndPlane = IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane();
      unint64_t v17 = IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane()
          - BaseAddressOfCompressedTileDataRegionOfSliceAndPlane;
    }
    else
    {
      unint64_t v17 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getPlaneSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)1>((uint64_t)impl, 0, 0);
    }
    v24 = (char *)a3 + v17;
    v18 = self->_impl;
    v19 = (void *)v18[61];
    if (v18[21] && (IOSurfaceGetSliceCount() & 0xFFFFFFFELL) != 0)
    {
      uint64_t v20 = IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane();
      uint64_t v21 = IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane() - v20;
    }
    else
    {
      uint64_t v21 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getPlaneSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)0>((uint64_t)v18, 0, 0);
    }
    v19[37] = v24;
    v19[9] = v21;
    (*(void (**)(void *))(*v19 + 16))(v19);
    if (v19[140] >= 2uLL)
    {
      uint64_t v22 = v19[139];
      v19[104] = &v24[v22];
      v19[76] = v22 + v21;
      (*(void (**)(void))(v19[67] + 16))();
    }
  }
  v23 = self->_impl;
  v23[37] = a3;
  v23[9] = 0;
  (*(void (**)(void *, SEL))(*v23 + 16))(v23, a2);
  AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::readRegion((uint64_t)self->_impl, a6->var0.var0, a6->var0.var1, a6->var0.var2, a6->var1.var0, a6->var1.var1, a6->var1.var2, v27, v26, (unsigned __int8 *)a7 + a8, a9, a10);
}

- (void)copyFromLinearBytes:(const void *)a3 linearOffset:(unint64_t)a4 linearBytesPerRow:(unint64_t)a5 linearBytesPerImage:(unint64_t)a6 toTextureMemory:(void *)a7 textureSlice:(unint64_t)a8 textureLevel:(unint64_t)a9 textureRegion:(id *)a10
{
  unsigned int v27 = a8;
  impl = self->_impl;
  uint64_t v15 = impl[61];
  if (v15 && *(_DWORD *)(v15 + 1080))
  {
    if (impl[21] && (IOSurfaceGetSliceCount() & 0xFFFFFFFELL) != 0)
    {
      uint64_t BaseAddressOfCompressedTileDataRegionOfSliceAndPlane = IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane();
      unint64_t v17 = IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane()
          - BaseAddressOfCompressedTileDataRegionOfSliceAndPlane;
    }
    else
    {
      unint64_t v17 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getPlaneSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)1>((uint64_t)impl, 0, 0);
    }
    v18 = (char *)a7 + v17;
    v19 = self->_impl;
    uint64_t v20 = (void *)v19[61];
    if (v19[21] && (IOSurfaceGetSliceCount() & 0xFFFFFFFELL) != 0)
    {
      uint64_t v24 = IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane();
      uint64_t v21 = IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane() - v24;
    }
    else
    {
      uint64_t v21 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getPlaneSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)0>((uint64_t)v19, 0, 0);
    }
    v20[37] = v18;
    v20[9] = v21;
    (*(void (**)(void *))(*v20 + 16))(v20);
    if (v20[140] >= 2uLL)
    {
      uint64_t v22 = v20[139];
      v20[104] = &v18[v22];
      v20[76] = v22 + v21;
      (*(void (**)(void))(v20[67] + 16))();
    }
  }
  v23 = self->_impl;
  v23[37] = a7;
  v23[9] = 0;
  (*(void (**)(void *, SEL))(*v23 + 16))(v23, a2);
  AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::writeRegion((uint64_t)self->_impl, a10->var0.var0, a10->var0.var1, a10->var0.var2, a10->var1.var0, a10->var1.var1, a10->var1.var2, v27, a9, (unsigned __int8 *)a3 + a4, a5, a6);
}

- (void)initializeTextureMemory:(void *)a3
{
  impl = self->_impl;
  uint64_t v4 = impl[61];
  if (v4 && *(_DWORD *)(v4 + 1080))
  {
    if (impl[21] && (IOSurfaceGetSliceCount() & 0xFFFFFFFELL) != 0)
    {
      uint64_t BaseAddressOfCompressedTileDataRegionOfSliceAndPlane = IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane();
      unint64_t v8 = IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane()
         - BaseAddressOfCompressedTileDataRegionOfSliceAndPlane;
    }
    else
    {
      unint64_t v8 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getPlaneSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)1>((uint64_t)impl, 0, 0);
    }
    v9 = (char *)a3 + v8;
    v10 = self->_impl;
    v11 = (void *)v10[61];
    if (v10[21] && (IOSurfaceGetSliceCount() & 0xFFFFFFFELL) != 0)
    {
      uint64_t v12 = IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane();
      uint64_t v13 = IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane() - v12;
    }
    else
    {
      uint64_t v13 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getPlaneSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)0>((uint64_t)v10, 0, 0);
    }
    v11[37] = v9;
    v11[9] = v13;
    (*(void (**)(void *))(*v11 + 16))(v11);
    if (v11[140] >= 2uLL)
    {
      uint64_t v14 = v11[139];
      v11[104] = &v9[v14];
      v11[76] = v14 + v13;
      (*(void (**)(void))(v11[67] + 16))();
    }
    uint64_t v15 = *((void *)self->_impl + 61);
    if (*(void *)(v15 + 1120))
    {
      uint64_t v16 = 0;
      unsigned int v17 = 0;
      do
      {
        if (*(unsigned char *)(v15 + 1128)) {
          int MetadataUncompressedValue = 0;
        }
        else {
          int MetadataUncompressedValue = AGX::CompressionMetadataGen2<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getMetadataUncompressedValue(*(void *)(v15 + 1072), v17);
        }
        uint64_t v19 = v15 + 536 * v16;
        CPUPtr = (void *)AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getCPUPtr(v19, 0, 0, 0);
        size_t v21 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getPlaneSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)1>(v19, 0, 1);
        memset(CPUPtr, MetadataUncompressedValue, v21);
        uint64_t v16 = ++v17;
      }
      while (*(void *)(v15 + 1120) > (unint64_t)v17);
    }
  }
}

- ($71D83D51AB0F57F7CF166351F850C832)watermark
{
  unint64_t v2 = 0x53ED1928C61E1F13;
  unint64_t v3 = 0xC512B61E8CC6BB6;
  result.var0[1] = v3;
  result.var0[0] = v2;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)copyGranularity
{
  unint64_t var1 = self->var1;
  if (*(void *)(var1 + 488))
  {
    int v5 = *(_DWORD *)(var1 + 112);
    if (*(unsigned char *)(var1 + 380) == 3)
    {
      if (*(void *)(var1 + 168))
      {
        unsigned __int8 CompressedTileWidthOfPlane = IOSurfaceGetCompressedTileWidthOfPlane();
        self = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)IOSurfaceGetCompressedTileHeightOfPlane();
      }
      else
      {
        MTLPixelFormat v9 = *(void *)(var1 + 32);
        uint64_t v10 = *(void *)(var1 + 208);
        uint64_t v12 = 0;
        memset(v11, 0, sizeof(v11));
        InterchangeTiledMemory::getPlaneInfo((InterchangeTiledMemory *)v11, 0, v9, *(unsigned __int8 *)(v10 + 49));
        unsigned __int8 CompressedTileWidthOfPlane = v11[0];
        self = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)BYTE1(v11[0]);
      }
    }
    else
    {
      self = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)16;
      unsigned __int8 CompressedTileWidthOfPlane = 16;
    }
    unsigned int v7 = self;
    unsigned int v8 = CompressedTileWidthOfPlane;
    switch(v5)
    {
      case 2:
        goto LABEL_13;
      case 4:
LABEL_12:
        unsigned int v8 = CompressedTileWidthOfPlane >> 1;
LABEL_13:
        v7 >>= 1;
        break;
      case 8:
        unsigned int v7 = self >> 1;
        goto LABEL_12;
    }
  }
  else
  {
    unsigned int v8 = *(_DWORD *)(var1 + 216);
    unsigned int v7 = *(_DWORD *)(var1 + 220);
  }
  retstr->var0 = v8;
  retstr->unint64_t var1 = v7;
  retstr->var2 = 1;
  return self;
}

- (unint64_t)alignment
{
  impl = (unsigned int *)self->_impl;
  if (*((unsigned char *)impl + 16)) {
    return 128;
  }
  if (*((unsigned char *)impl + 232)) {
    return *((void *)impl + 40);
  }
  unint64_t result = impl[59];
  if (!result)
  {
    uint64_t v4 = impl + 95;
    int v5 = *((unsigned __int8 *)impl + 380);
    int v6 = *((unsigned __int8 *)impl + 381);
    unint64_t v7 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getMipmapSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)0>((uint64_t)impl, 0);
    uint64_t v8 = (*v4 >> 16) & 1;
    if (v6 == 1) {
      char v9 = WORD1(*v4) & 1;
    }
    else {
      char v9 = 0;
    }
    if (v6 != 2) {
      LOBYTE(v8) = 0;
    }
    if (v9) {
      LOBYTE(v8) = 1;
    }
    if ((v6 - 3) >= 2) {
      char v10 = v8;
    }
    else {
      char v10 = 1;
    }
    unsigned int v11 = (v5 - 1);
    if (v11 <= 1 && v7 >= 0x4000 && (v10 & 1) != 0)
    {
      return 0x4000;
    }
    else
    {
      if (v11 < 3) {
        return 128;
      }
      if ((*v4 & 0x10000) != 0 && v6 == 2 && v5 == 0) {
        return 128;
      }
      else {
        return 16;
      }
    }
  }
  return result;
}

- (unint64_t)size
{
  return *((void *)self->_impl + 44) + 16;
}

- (AGXTextureLayout)initWithDevice:(id)a3 descriptor:(id)a4 isHeapOrBufferBacked:(BOOL)a5
{
  v38.receiver = self;
  v38.super_class = (Class)AGXTextureLayout;
  uint64_t v8 = -[IOGPUMetalTextureLayout initWithDevice:descriptor:](&v38, sel_initWithDevice_descriptor_);
  if (!v8) {
    goto LABEL_27;
  }
  uint64_t v9 = [a4 descriptorPrivate];
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v9 + 96);
  if (v11 == 2)
  {
    unint64_t v12 = 0;
  }
  else
  {
    LOBYTE(v11) = v11 == 1 ? 9 : 0;
    unint64_t v12 = *(void *)(v9 + 152) <= 3uLL ? (unint64_t)*(void *)(v9 + 152) << 8 : 0;
  }
  char v13 = v11 & 0xFB;
  char v14 = *(unsigned char *)(v9 + 128) ? v13 : 2;
  unsigned int v15 = *(_DWORD *)(v9 + 8) - 1;
  uint64_t v16 = v15 > 0x284 ? &texFormatUnsupported : (uint64_t *)*(&off_26516F8A0 + v15);
  BOOL v17 = (*((_DWORD *)v16 + 15) & 0xC) != 0;
  v18 = malloc_type_calloc(0x218uLL, 1uLL, 0x55FB10BDuLL);
  v8->_impl = v18;
  if (!v18) {
    goto LABEL_27;
  }
  uint64_t v20 = *(void *)v10;
  uint64_t v21 = *(void *)(v10 + 8);
  uint64_t v22 = *(void *)(v10 + 104);
  unint64_t v23 = *(void *)(v10 + 168) - 1;
  int v24 = v23 > 9 ? 0 : dword_242EAC4F0[v23];
  uint64_t v25 = *(void *)(v10 + 192);
  int v26 = (unint64_t)(*(void *)(v10 + 72) - 1) < 4 ? *(_DWORD *)(v10 + 72) : 0;
  int v27 = *(_DWORD *)(v10 + 84);
  unsigned int v28 = *(_DWORD *)(v10 + 16);
  unsigned int v29 = *(_DWORD *)(v10 + 24);
  unsigned int v30 = *(_DWORD *)(v10 + 32);
  unsigned int v31 = *(_DWORD *)(v10 + 40);
  int v32 = *(_DWORD *)(v10 + 48);
  int v33 = *(_DWORD *)(v10 + 56);
  uint64_t v34 = *(void *)(v10 + 112) & 0xFLL;
  v35 = (v21 - 1) > 0x284 ? &texFormatUnsupported : (uint64_t *)*(&off_26516F8A0 + (v21 - 1));
  *(void *)AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::TextureGen4((uint64_t)v18, *((os_unfair_lock_s **)a3 + 101), 0, 2, v20, (uint64_t)v35, v21, v22, v19, v25, v12 | (v14 | v17), v24, v26, v27, v28, v29, v30, v31, v32,
               v33,
               0,
               0,
               v34,
               0,
               0,
               0,
               0,
               0,
               v31,
               !a5,
               0,
               a5,
               v37,
               0) = off_26F853CD8;
  if (!*((unsigned char *)v8->_impl + 200))
  {
LABEL_27:

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  impl = (void (***)(void *, SEL))self->_impl;
  if (impl)
  {
    (**impl)(impl, a2);
    free(self->_impl);
    self->_impl = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXTextureLayout;
  [(AGXTextureLayout *)&v4 dealloc];
}

@end