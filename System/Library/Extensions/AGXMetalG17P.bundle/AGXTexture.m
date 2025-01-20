@interface AGXTexture
- (AGXTexture)initWithBuffer:(id)a3 desc:(id)a4 offset:(unint64_t)a5 bytesPerRow:(unint64_t)a6;
- (AGXTexture)initWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 slice:(unint64_t)a7;
- (AGXTexture)initWithDevice:(id)a3 bytes:(void *)a4 length:(unint64_t)a5 desc:(id)a6 deallocator:(id)a7;
- (AGXTexture)initWithDevice:(id)a3 desc:(id)a4 iosurface:(__IOSurface *)a5 plane:(unint64_t)a6 slice:(unint64_t)a7;
- (AGXTexture)initWithDevice:(id)a3 desc:(id)a4 isSuballocDisabled:(BOOL)a5;
- (AGXTexture)initWithHeap:(id)a3 desc:(id)a4;
- (AGXTexture)initWithHeap:(id)a3 desc:(id)a4 atOffset:(unint64_t)a5;
- (AGXTexture)initWithImplHeap:(id)a3 resource:(id)a4 descriptor:(id)a5 length:(unint64_t)a6 atOffset:(unint64_t)a7;
- (AGXTexture)initWithImplHeapMemoryless:(id)a3 descriptor:(id)a4 length:(unint64_t)a5;
- (AGXTexture)initWithSharedTextureHandle:(__IOSurface *)a3 device:(id)a4 desc:(id)a5 compressionMode:(unint64_t)a6;
- (AGXTexture)initWithSparseHeap:(id)a3 desc:(id)a4 resource:(id)a5 sparsePagesAddress:(unint64_t)a6 sparsePageSize:(unint64_t)a7;
- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4;
- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7;
- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 resourceIndex:(unint64_t)a8;
- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8;
- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8 resourceIndex:(unint64_t)a9;
- (BOOL)canGenerateMipmapLevels;
- (BOOL)initImplWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6;
- (BOOL)initImplWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 resourceIndex:(unint64_t)a7;
- (BOOL)initImplWithDevice:(id)a3 Descriptor:(id)a4 iosurface:(__IOSurface *)a5 plane:(unint64_t)a6 slice:(unint64_t)a7 buffer:(id)a8 bytesPerRow:(unint64_t)a9 allowNPOT:(BOOL)a10 sparsePageSize:(unint64_t)a11 isCompressedIOSurface:(BOOL)a12 isHeapBacked:(BOOL)a13;
- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4;
- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7;
- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 resourceIndex:(unint64_t)a8;
- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8;
- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8 resourceIndex:(unint64_t)a9;
- (BOOL)isMemoryless;
- (BOOL)isSparse;
- (BOOL)updateBindDataWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 slice:(unint64_t)a7;
- (BOOL)validateBufferTextureWithSize:(unint64_t)a3;
- (id)backingResource;
- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 resourceIndex:(unint64_t)a7;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7 resourceIndex:(unint64_t)a8;
- (unint64_t)colorSpaceConversionMatrix;
- (unint64_t)firstMipmapInTail;
- (unint64_t)getAlignment;
- (unint64_t)getBytesPerRow;
- (unint64_t)getCPUSizeBytes;
- (unint64_t)sparseSurfaceDefaultValue;
- (unint64_t)tailSize;
- (unint64_t)tailSizeInBytes;
- (void)dealloc;
- (void)set_alignment:(unint64_t)a3;
- (void)set_bytesPerRow:(unint64_t)a3;
- (void)set_cpuSizeBytes:(unint64_t)a3;
@end

@implementation AGXTexture

- (void)set_bytesPerRow:(unint64_t)a3
{
  self->_cpuSizeBytes = a3;
}

- (unint64_t)getBytesPerRow
{
  return self->_cpuSizeBytes;
}

- (void)set_cpuSizeBytes:(unint64_t)a3
{
  self->_alignment = a3;
}

- (unint64_t)getCPUSizeBytes
{
  return self->_alignment;
}

- (void)set_alignment:(unint64_t)a3
{
  self->_backingResourceCached = (IOGPUMetalResource *)a3;
}

- (unint64_t)getAlignment
{
  return (unint64_t)self->_backingResourceCached;
}

- (id)backingResource
{
  id result = *(id *)&self->_hasCPUMapping;
  if (!result)
  {
    if ([(IOGPUMetalTexture *)self buffer])
    {
      id result = [(IOGPUMetalTexture *)self buffer];
    }
    else
    {
      v4 = [(IOGPUMetalTexture *)self parentTexture];
      id result = self;
      if (v4) {
        id result = (id)[[(IOGPUMetalTexture *)self parentTexture] backingResource];
      }
    }
    *(void *)&self->_hasCPUMapping = result;
  }
  return result;
}

- (BOOL)validateBufferTextureWithSize:(unint64_t)a3
{
  return 0;
}

- (BOOL)isMemoryless
{
  return 0;
}

- (BOOL)isSparse
{
  return 0;
}

- (unint64_t)firstMipmapInTail
{
  return 0;
}

- (unint64_t)tailSizeInBytes
{
  return 0;
}

- (unint64_t)tailSize
{
  return 0;
}

- (unint64_t)sparseSurfaceDefaultValue
{
  return 0;
}

- (unint64_t)colorSpaceConversionMatrix
{
  return 0;
}

- (BOOL)canGenerateMipmapLevels
{
  return 0;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8 resourceIndex:(unint64_t)a9
{
  return 0;
}

- (BOOL)initImplWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 resourceIndex:(unint64_t)a7
{
  return 0;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 resourceIndex:(unint64_t)a8
{
  return 0;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  return 0;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8
{
  return 0;
}

- (BOOL)initImplWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6
{
  return 0;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7
{
  return 0;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4
{
  return 0;
}

- (BOOL)initImplWithDevice:(id)a3 Descriptor:(id)a4 iosurface:(__IOSurface *)a5 plane:(unint64_t)a6 slice:(unint64_t)a7 buffer:(id)a8 bytesPerRow:(unint64_t)a9 allowNPOT:(BOOL)a10 sparsePageSize:(unint64_t)a11 isCompressedIOSurface:(BOOL)a12 isHeapBacked:(BOOL)a13
{
  return 0;
}

- (BOOL)updateBindDataWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 slice:(unint64_t)a7
{
  return 0;
}

- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6
{
  id v11 = objc_alloc((Class)objc_opt_class());

  return (id)[v11 initWithCompressedTexture:self pixelFormat:a3 textureType:a4 level:a5 slice:a6];
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7 resourceIndex:(unint64_t)a8
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTexture:pixelFormat:textureType:levels:slices:swizzle:resourceIndex:", self, a3, a4, a5.location, a5.length, a6.location, a6.length, *(unsigned int *)&a7, a8);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 resourceIndex:(unint64_t)a7
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:", self, a3, a4, a5.location, a5.length, a6.location, a6.length, a7);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  id v7 = objc_alloc((Class)objc_opt_class());

  return (id)[v7 initWithTexture:self pixelFormat:a3 resourceIndex:a4];
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTexture:pixelFormat:textureType:levels:slices:swizzle:", self, a3, a4, a5.location, a5.length, a6.location, a6.length, *(unsigned int *)&a7);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTexture:pixelFormat:textureType:levels:slices:", self, a3, a4, a5.location, a5.length, a6.location, a6.length);
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());

  return (id)[v5 initWithTexture:self pixelFormat:a3];
}

- (AGXTexture)initWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 slice:(unint64_t)a7
{
  v15.receiver = self;
  v15.super_class = (Class)AGXTexture;
  v12 = -[IOGPUMetalTexture initWithCompressedTexture:pixelFormat:textureType:level:slice:](&v15, sel_initWithCompressedTexture_pixelFormat_textureType_level_slice_);
  v13 = v12;
  if (v12)
  {
    if ([(AGXTexture *)v12 initImplWithCompressedTexture:a3 pixelFormat:a4 textureType:a5 level:a6]&& [(AGXTexture *)v13 updateBindDataWithCompressedTexture:a3 pixelFormat:a4 textureType:a5 level:a6 slice:a7])
    {
      [(AGXTexture *)v13 finalizeCompressedTextureViewCreation];
    }
    else
    {

      return 0;
    }
  }
  return v13;
}

- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8 resourceIndex:(unint64_t)a9
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  if (-[AGXTexture initImplWithTexture:pixelFormat:textureType:levels:slices:swizzle:resourceIndex:](self, "initImplWithTexture:pixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a7.location, a7.length, *(unsigned int *)&a8, a9))
  {
    v18.receiver = self;
    v18.super_class = (Class)AGXTexture;
    objc_super v15 = -[IOGPUMetalTexture initWithTexture:pixelFormat:textureType:levels:slices:swizzle:](&v18, sel_initWithTexture_pixelFormat_textureType_levels_slices_swizzle_, a3, a4, a5, location, length, a7.location, a7.length, *(unsigned int *)&a8);
    v16 = v15;
    if (v15)
    {
      -[AGXTexture updateBindDataWithTexture:pixelFormat:textureType:levels:slices:](v15, "updateBindDataWithTexture:pixelFormat:textureType:levels:slices:", a3, a4, a5, location, length, a7.location, a7.length);
      [(AGXTexture *)v16 finalizeTextureCreation];
    }
  }
  else
  {

    return 0;
  }
  return v16;
}

- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 resourceIndex:(unint64_t)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  if (-[AGXTexture initImplWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:](self, "initImplWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:", a7.location, a7.length, a8))
  {
    v17.receiver = self;
    v17.super_class = (Class)AGXTexture;
    v14 = -[IOGPUMetalTexture initWithTexture:pixelFormat:textureType:levels:slices:](&v17, sel_initWithTexture_pixelFormat_textureType_levels_slices_, a3, a4, a5, location, length, a7.location, a7.length);
    objc_super v15 = v14;
    if (v14)
    {
      -[AGXTexture updateBindDataWithTexture:pixelFormat:textureType:levels:slices:](v14, "updateBindDataWithTexture:pixelFormat:textureType:levels:slices:", a3, a4, a5, location, length, a7.location, a7.length);
      [(AGXTexture *)v15 finalizeTextureCreation];
    }
  }
  else
  {

    return 0;
  }
  return v15;
}

- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  return -[AGXTexture initWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:](self, "initWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:", 0, *(void *)((char *)a3 + (int)*MEMORY[0x263F4B190]) * *(void *)((char *)a3 + (int)*MEMORY[0x263F4B1B8]), a5);
}

- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8
{
  return -[AGXTexture initWithTexture:pixelFormat:textureType:levels:slices:swizzle:resourceIndex:](self, "initWithTexture:pixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, *(unsigned int *)&a8, 0);
}

- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7
{
  return -[AGXTexture initWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:](self, "initWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, 0);
}

- (AGXTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4
{
  return [(AGXTexture *)self initWithTexture:a3 pixelFormat:a4 resourceIndex:0];
}

- (AGXTexture)initWithDevice:(id)a3 bytes:(void *)a4 length:(unint64_t)a5 desc:(id)a6 deallocator:(id)a7
{
  if (!objc_msgSend(a6, "validateWithDevice:")
    || (LOWORD(v18) = 0,
        LOBYTE(v16) = 1,
        !-[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", a3, a6, 0, 0, 0, 0, 0, v16, 0, v18)))
  {

    return 0;
  }
  uint64_t v21 = 0;
  memset(v20, 0, sizeof(v20));
  [(AGXTexture *)self initNewTextureData:v20];
  v19.receiver = self;
  v19.super_class = (Class)AGXTexture;
  LODWORD(v17) = 104;
  v13 = [(IOGPUMetalTexture *)&v19 initWithDevice:a3 descriptor:a6 sysMemPointer:a4 sysMemSize:[(AGXTexture *)self getCPUSizeBytes] sysMemLength:a5 sysMemRowBytes:[(AGXTexture *)self getBytesPerRow] args:v20 argsSize:v17 deallocator:a7];
  v14 = v13;
  if (v13)
  {
    [(AGXTexture *)v13 updateBindDataWithAddresses:a4 gpuVirtualAddress:*(void *)((char *)&v13->super.super._res.var0 + (int)*MEMORY[0x263F4B188]) shouldInitMetadata:0];
    [(AGXTexture *)v14 finalizeTextureCreation];
    if (![(AGXTexture *)v14 validateBufferTextureWithSize:a5])
    {

      return 0;
    }
  }
  return v14;
}

- (AGXTexture)initWithDevice:(id)a3 desc:(id)a4 iosurface:(__IOSurface *)a5 plane:(unint64_t)a6 slice:(unint64_t)a7
{
  unsigned int CompressionTypeOfPlane = IOSurfaceGetCompressionTypeOfPlane();
  if (CompressionTypeOfPlane > 4 || CompressionTypeOfPlane == 1) {
    return 0;
  }
  unsigned int v15 = CompressionTypeOfPlane;
  BOOL v17 = CompressionTypeOfPlane == 4 || (CompressionTypeOfPlane & 0xFFFFFFFE) == 2;
  unint64_t SliceCount = IOSurfaceGetSliceCount();
  size_t BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(a5, a6);
  if (![a4 validateWithDevice:a3]
    || IOSurfaceIsTiled()
    || (LOWORD(v29) = v17,
        LOBYTE(v28) = 1,
        !-[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", a3, a4, a5, a6, a7, 0, BytesPerRowOfPlane, v28, 0, v29)))
  {

    return 0;
  }
  uint64_t v32 = 0;
  memset(v31, 0, sizeof(v31));
  [(AGXTexture *)self initNewTextureData:v31];
  v30.receiver = self;
  v30.super_class = (Class)AGXTexture;
  LODWORD(v27) = 104;
  v20 = [(IOGPUMetalTexture *)&v30 initWithDevice:a3 descriptor:a4 iosurface:a5 plane:a6 field:0 args:v31 argsSize:v27];
  if (v20)
  {
    if (SliceCount < 2)
    {
      uint64_t BaseAddressOfPlane = (uint64_t)IOSurfaceGetBaseAddressOfPlane(a5, a6);
      uint64_t v24 = (int)*MEMORY[0x263F4B188];
      uint64_t v25 = *(void *)((char *)&v20->super.super._res.var0 + v24);
      uint64_t BaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane = v15 - 2 > 2
                                                             ? 0
                                                             : IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane();
    }
    else
    {
      uint64_t BaseAddressOfPlane = IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane();
      uint64_t BaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane = IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane();
      uint64_t v23 = BaseAddressOfPlane - IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane();
      uint64_t v24 = (int)*MEMORY[0x263F4B188];
      uint64_t v25 = v23 + *(void *)((char *)&v20->super.super._res.var0 + v24);
    }
    [(AGXTexture *)v20 updateBindDataWithAddresses:BaseAddressOfPlane cpuMetadataAddress:BaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane gpuVirtualAddress:v25 isCompressible:v17 shouldInitMetadata:0];
    [(AGXTexture *)v20 finalizeTextureCreation];
    if (![(AGXTexture *)v20 validateBufferTextureWithSize:*(unint64_t *)((unsigned char *)&v20->super.super._res.vendor.reserved[1] + v24) & 0xFFFFFFFFFFFFFFLL])
    {

      return 0;
    }
  }
  return v20;
}

- (AGXTexture)initWithSharedTextureHandle:(__IOSurface *)a3 device:(id)a4 desc:(id)a5 compressionMode:(unint64_t)a6
{
  [a5 setCompressionMode:a6];
  if ([a5 validateWithDevice:a4]
    && (LOWORD(v14) = 0,
        LOBYTE(v13) = 1,
        -[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", a4, a5, 0, 0, 0, 0, 0, v13, 0, v14)))
  {
    uint64_t v17 = 0;
    memset(v16, 0, sizeof(v16));
    [(AGXTexture *)self initNewTextureData:v16];
    v15.receiver = self;
    v15.super_class = (Class)AGXTexture;
    LODWORD(v12) = 104;
    v10 = [(IOGPUMetalTexture *)&v15 initWithDevice:a4 descriptor:a5 iosurface:a3 plane:0 field:0 args:v16 argsSize:v12];
    if (v10)
    {
      [(AGXTexture *)v10 updateBindDataWithAddresses:IOSurfaceGetBaseAddressOfPlane(a3, 0) gpuVirtualAddress:*(void *)((char *)&v10->super.super._res.var0 + (int)*MEMORY[0x263F4B188]) shouldInitMetadata:0];
      [(AGXTexture *)v10 finalizeTextureCreation];
    }
  }
  else
  {

    return 0;
  }
  return v10;
}

- (AGXTexture)initWithBuffer:(id)a3 desc:(id)a4 offset:(unint64_t)a5 bytesPerRow:(unint64_t)a6
{
  if (!objc_msgSend(a4, "validateWithDevice:", objc_msgSend(a3, "device"))
    || (LOWORD(v17) = 0,
        LOBYTE(v16) = 0,
        !-[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", [a3 device], a4, 0, 0, 0, a3, a6, v16, 0, v17))|| (unint64_t v11 = -[AGXTexture getCPUSizeBytes](self, "getCPUSizeBytes"), v12 = (int)*MEMORY[0x263F4B188], v11 + a5 > (*(void *)((unsigned char *)a3 + v12 + 40) & 0xFFFFFFFFFFFFFFuLL)))
  {

    return 0;
  }
  v18.receiver = self;
  v18.super_class = (Class)AGXTexture;
  uint64_t v13 = [(IOGPUMetalTexture *)&v18 initWithBuffer:a3 descriptor:a4 offset:a5 bytesPerRow:a6];
  if (v13)
  {
    objc_super v15 = [a3 iosurface]
        ? (char *)IOSurfaceGetBaseAddressOfPlane((IOSurfaceRef)[a3 iosurface], 0) + a5
        : *(char **)&v13->super.super._anon_50[v12 + 48];
    [(AGXTexture *)v13 updateBindDataWithAddresses:v15 gpuVirtualAddress:*(void *)((char *)&v13->super.super._res.var0 + v12)];
    [(AGXTexture *)v13 finalizeTextureCreation];
    if (![(AGXTexture *)v13 validateBufferTextureWithSize:(*(unint64_t *)((unsigned char *)&v13->super.super._res.vendor.reserved[1] + v12) & 0xFFFFFFFFFFFFFFLL) - a5])
    {

      return 0;
    }
  }
  return v13;
}

- (AGXTexture)initWithHeap:(id)a3 desc:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t v9 = [a3 device];
  if ([a3 type] != 1) {
    goto LABEL_12;
  }
  if (![a4 validateWithDevice:v9]) {
    goto LABEL_12;
  }
  LOWORD(v15) = 256;
  LOBYTE(v14) = 0;
  if (!-[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", v9, a4, 0, 0, 0, 0, 0, v14, 0, v15))goto LABEL_12; {
  unint64_t v10 = [(AGXTexture *)self getCPUSizeBytes];
  }
  unint64_t v11 = [(AGXTexture *)self getAlignment];
  if ([(AGXTexture *)self isMemoryless])
  {
    return [(AGXTexture *)self initWithImplHeapMemoryless:a3 descriptor:a4 length:v10];
  }
  uint64_t v13 = objc_msgSend(a3, "newSubResourceAtOffset:withLength:alignment:options:", a5, v10, v11, *(void *)(objc_msgSend(a4, "descriptorPrivate") + 112));
  if (!v13)
  {
LABEL_12:

    return 0;
  }

  return [(AGXTexture *)self initWithImplHeap:a3 resource:v13 descriptor:a4 length:v10 atOffset:a5];
}

- (AGXTexture)initWithHeap:(id)a3 desc:(id)a4
{
  uint64_t v7 = [a3 device];
  if ([a3 type]
    || ![a4 validateWithDevice:v7]
    || (LOWORD(v13) = 256,
        LOBYTE(v12) = 0,
        !-[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", v7, a4, 0, 0, 0, 0, 0, v12, 0, v13)))
  {
LABEL_10:

    return 0;
  }
  unint64_t v8 = [(AGXTexture *)self getCPUSizeBytes];
  unint64_t v9 = [(AGXTexture *)self getAlignment];
  if (![(AGXTexture *)self isMemoryless])
  {
    uint64_t v14 = 0;
    uint64_t v11 = objc_msgSend(a3, "newSubResourceWithLength:alignment:options:offset:", v8, v9, *(void *)(objc_msgSend(a4, "descriptorPrivate") + 112), &v14);
    if (v11) {
      return [(AGXTexture *)self initWithImplHeap:a3 resource:v11 descriptor:a4 length:v8 atOffset:v14];
    }
    goto LABEL_10;
  }

  return [(AGXTexture *)self initWithImplHeapMemoryless:a3 descriptor:a4 length:v8];
}

- (AGXTexture)initWithSparseHeap:(id)a3 desc:(id)a4 resource:(id)a5 sparsePagesAddress:(unint64_t)a6 sparsePageSize:(unint64_t)a7
{
  uint64_t v11 = (void *)[a3 device];
  if (![a4 validateWithDevice:v11]) {
    goto LABEL_6;
  }
  LOWORD(v19) = 0;
  LOBYTE(v17) = 0;
  if (!-[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", v11, a4, 0, 0, 0, 0, 0, v17, a7, v19))goto LABEL_6; {
  uint64_t v25 = 0;
  }
  memset(v24, 0, sizeof(v24));
  [(AGXTexture *)self initNewTextureData:v24];
  size_t v12 = [(AGXTexture *)self getCPUSizeBytes];
  if (v12 >= *MEMORY[0x263EF8AF8]
    || (int v23 = 0,
        uint64_t v22 = 0,
        (uint64_t v13 = objc_msgSend(v11, "allocBufferSubDataWithLength:options:alignment:heapIndex:bufferIndex:bufferOffset:", v12, *(void *)(objc_msgSend(a4, "descriptorPrivate") + 112) | 0x20000, 1024, (char *)&v23 + 2, &v23, &v22)) == 0))
  {
    uint64_t v15 = (void *)[a4 copy];
    objc_msgSend(v15, "setResourceOptions:", objc_msgSend(v15, "resourceOptions") | 0x20000);
    v20.receiver = self;
    v20.super_class = (Class)AGXTexture;
    LODWORD(v18) = 104;
    self = [(IOGPUMetalTexture *)&v20 initWithDevice:v11 descriptor:v15 sysMemSize:v12 sysMemRowBytes:[(AGXTexture *)self getBytesPerRow] vidMemSize:0 vidMemRowBytes:0 args:v24 argsSize:v18];

    if (!self) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v16 = (void **)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F4B188]);
    bzero(v16[16], v12);
    [(AGXTexture *)self updateBindDataWithAddresses:v16[16] gpuVirtualAddress:v16[9]];
    [(AGXTexture *)self setSparseHeap:a3];
    [(AGXTexture *)self finalizeTextureCreation];
    return self;
  }
  v21.receiver = self;
  v21.super_class = (Class)AGXTexture;
  self = [(IOGPUMetalTexture *)&v21 initWithPrimaryBuffer:v13 heapIndex:SHIWORD(v23) bufferIndex:(__int16)v23 bufferOffset:v22 length:v12 descriptor:a4 sysMemRowBytes:[(AGXTexture *)self getBytesPerRow] vidMemSize:0 vidMemRowBytes:0 args:v24 argsSize:104];
  if (self) {
    goto LABEL_9;
  }
LABEL_6:

  return 0;
}

- (AGXTexture)initWithDevice:(id)a3 desc:(id)a4 isSuballocDisabled:(BOOL)a5
{
  if (objc_msgSend(a4, "validateWithDevice:")
    && (LOWORD(v20) = 0,
        LOBYTE(v18) = 1,
        -[AGXTexture initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:](self, "initImplWithDevice:Descriptor:iosurface:plane:slice:buffer:bytesPerRow:allowNPOT:sparsePageSize:isCompressedIOSurface:isHeapBacked:", a3, a4, 0, 0, 0, 0, 0, v18, 0, v20)))
  {
    uint64_t v27 = 0;
    long long v26 = 0u;
    memset(v25, 0, sizeof(v25));
    [(AGXTexture *)self initNewTextureData:v25];
    if (!-[AGXTexture isMemoryless](self, "isMemoryless") && ![a4 protectionOptions])
    {
      unint64_t v9 = [(AGXTexture *)self getCPUSizeBytes];
      if (v9 < *MEMORY[0x263EF8AF8] && (BYTE8(v26) & 1) == 0 && !a5)
      {
        int v24 = 0;
        uint64_t v23 = 0;
        unint64_t v10 = [(AGXTexture *)self getCPUSizeBytes];
        unint64_t v11 = [(AGXTexture *)self getAlignment];
        uint64_t v12 = [a4 descriptorPrivate];
        uint64_t v13 = (*(void *)(v12 + 112) & 0xF0) == 0x20 ? *(void *)(v12 + 112) | 0x20000 : *(void *)(v12 + 112);
        uint64_t v14 = [a3 allocBufferSubDataWithLength:v10 options:v13 alignment:v11 heapIndex:(char *)&v24 + 2 bufferIndex:&v24 bufferOffset:&v23];
        if (v14)
        {
          v22.receiver = self;
          v22.super_class = (Class)AGXTexture;
          uint64_t v15 = [(IOGPUMetalTexture *)&v22 initWithPrimaryBuffer:v14 heapIndex:SHIWORD(v24) bufferIndex:(__int16)v24 bufferOffset:v23 length:v10 descriptor:a4 sysMemRowBytes:[(AGXTexture *)self getBytesPerRow] vidMemSize:0 vidMemRowBytes:0 args:v25 argsSize:104];
          if (!v15) {
            return v15;
          }
          goto LABEL_19;
        }
      }
    }
    v21.receiver = self;
    v21.super_class = (Class)AGXTexture;
    LODWORD(v19) = 104;
    uint64_t v17 = [(IOGPUMetalTexture *)&v21 initWithDevice:a3 descriptor:a4 sysMemSize:[(AGXTexture *)self getCPUSizeBytes] sysMemRowBytes:[(AGXTexture *)self getBytesPerRow] vidMemSize:0 vidMemRowBytes:0 args:v25 argsSize:v19];
    uint64_t v15 = v17;
    if (v17)
    {
      if ([(AGXTexture *)v17 isMemoryless])
      {
        [(AGXTexture *)v15 updateBindDataWithAddresses:0 gpuVirtualAddress:4008574976];
LABEL_20:
        [(AGXTexture *)v15 finalizeTextureCreation];
        return v15;
      }
LABEL_19:
      [(AGXTexture *)v15 updateBindDataWithAddresses:*(void *)&v15->super.super._anon_50[*MEMORY[0x263F4B188] + 48] gpuVirtualAddress:*(void *)((char *)&v15->super.super._res.var0 + (int)*MEMORY[0x263F4B188]) shouldInitMetadata:*((unsigned __int8 *)&v15->super._allowGPUOptimizedContents + 1)];
      goto LABEL_20;
    }
  }
  else
  {

    return 0;
  }
  return v15;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AGXTexture;
  [(IOGPUMetalTexture *)&v2 dealloc];
}

- (AGXTexture)initWithImplHeap:(id)a3 resource:(id)a4 descriptor:(id)a5 length:(unint64_t)a6 atOffset:(unint64_t)a7
{
  v11.receiver = self;
  v11.super_class = (Class)AGXTexture;
  uint64_t v7 = -[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:](&v11, sel_initWithHeap_resource_offset_length_device_descriptor_, a3, a4, a7, a6, [a3 device], a5);
  unint64_t v8 = v7;
  uint64_t v9 = (int)*MEMORY[0x263F4B188];
  if (v7)
  {
    [(AGXTexture *)v7 updateBindDataWithAddresses:*(void *)&v7->super.super._anon_50[v9 + 48] gpuVirtualAddress:*(void *)((char *)&v7->super.super._res.var0 + v9) shouldInitMetadata:0];
    [(AGXTexture *)v8 finalizeTextureCreation];
  }
  *(void *)((char *)&v8->super.super.super.super.super._labelLock._os_unfair_lock_opaque + v9) = *(void *)((unsigned char *)&v8->super.super.super.super.super._labelLock._os_unfair_lock_opaque + v9) & 0x1FFFFFFFFFFFFFFFLL | 0x4000000000000000;
  return v8;
}

- (AGXTexture)initWithImplHeapMemoryless:(id)a3 descriptor:(id)a4 length:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)AGXTexture;
  id v5 = -[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:](&v8, sel_initWithHeap_resource_offset_length_device_descriptor_, a3, 0, 0, a5, [a3 device], a4);
  v6 = v5;
  if (v5)
  {
    [(AGXTexture *)v5 updateBindDataWithAddresses:0 gpuVirtualAddress:4008574976];
    [(AGXTexture *)v6 finalizeTextureCreation];
  }
  *(void *)((char *)&v6->super.super.super.super.super._labelLock._os_unfair_lock_opaque + (int)*MEMORY[0x263F4B188]) = *(void *)((unsigned char *)&v6->super.super.super.super.super._labelLock._os_unfair_lock_opaque + (int)*MEMORY[0x263F4B188]) & 0x1FFFFFFFFFFFFFFFLL | 0x4000000000000000;
  return v6;
}

@end