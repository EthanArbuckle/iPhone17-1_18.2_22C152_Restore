@interface CaptureMTLTexture
- ($14D77461FF5D83CAEC4252578BA76F85)swizzle;
- (BOOL)allowGPUOptimizedContents;
- (BOOL)canGenerateMipmapLevels;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (BOOL)isCompressed;
- (BOOL)isDrawable;
- (BOOL)isFramebufferOnly;
- (BOOL)isPurgeable;
- (BOOL)isShareable;
- (BOOL)isSparse;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureBuffer:(id)a4;
- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureHeap:(id)a4;
- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureTexture:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLBuffer)buffer;
- (MTLDevice)device;
- (MTLHeap)heap;
- (MTLResource)rootResource;
- (MTLResourceID)gpuResourceID;
- (MTLTexture)baseObject;
- (MTLTexture)parentTexture;
- (NSString)description;
- (NSString)label;
- (__IOSurface)iosurface;
- (id)_quicklookData;
- (id)formattedDescription:(unint64_t)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6;
- (id)newSharedTextureHandle;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 resourceIndex:(unint64_t)a7;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7 resourceIndex:(unint64_t)a8;
- (id)originalObject;
- (int)responsibleProcess;
- (int64_t)compressionFeedback;
- (int64_t)compressionType;
- (unint64_t)allocatedSize;
- (unint64_t)allocationID;
- (unint64_t)arrayLength;
- (unint64_t)bufferBytesPerRow;
- (unint64_t)bufferOffset;
- (unint64_t)colorSpaceConversionMatrix;
- (unint64_t)compressionFootprint;
- (unint64_t)cpuCacheMode;
- (unint64_t)depth;
- (unint64_t)firstMipmapInTail;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)hazardTrackingMode;
- (unint64_t)heapOffset;
- (unint64_t)height;
- (unint64_t)iosurfacePlane;
- (unint64_t)mipmapLevelCount;
- (unint64_t)numFaces;
- (unint64_t)parentRelativeLevel;
- (unint64_t)parentRelativeSlice;
- (unint64_t)pixelFormat;
- (unint64_t)resourceIndex;
- (unint64_t)resourceOptions;
- (unint64_t)rotation;
- (unint64_t)sampleCount;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)sparseSurfaceDefaultValue;
- (unint64_t)storageMode;
- (unint64_t)streamReference;
- (unint64_t)tailSize;
- (unint64_t)tailSizeInBytes;
- (unint64_t)textureType;
- (unint64_t)unfilteredResourceOptions;
- (unint64_t)uniqueIdentifier;
- (unint64_t)usage;
- (unint64_t)width;
- (unsigned)swizzleKey;
- (void)dealloc;
- (void)generateMipmapLevel:(unint64_t)a3 slice:(unint64_t)a4;
- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 bytesPerImage:(unint64_t)a5 fromRegion:(id *)a6 mipmapLevel:(unint64_t)a7 slice:(unint64_t)a8;
- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6;
- (void)makeAliasable;
- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 slice:(unint64_t)a5 withBytes:(const void *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8;
- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6;
- (void)setLabel:(id)a3;
- (void)setResponsibleProcess:(int)a3;
- (void)touch;
- (void)waitUntilComplete;
@end

@implementation CaptureMTLTexture

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureRemoteStorageTexture, 0);
  objc_storeStrong((id *)&self->_captureRootResource, 0);
  objc_storeStrong((id *)&self->_captureHeap, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (id)_quicklookData
{
  return GTMTLQL_EncodeTexture((uint64_t)self->_traceContext, self);
}

- (void)waitUntilComplete
{
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  id v5 = [(MTLTextureSPI *)self->_baseObject setPurgeableState:a3];
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -16232;
  char v7 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v10 = BYTE10(v18);
    ++BYTE10(v18);
    v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v17 + 1), v10 | 0x1800000000) + 16;
    char v7 = v10;
  }
  else
  {
    v8 = (char *)(v6 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v6 + 13) = v7;
  v11 = [(CaptureMTLTexture *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)v8 = var0;
  *((void *)v8 + 1) = v5;
  *((void *)v8 + 2) = a3;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
  return (unint64_t)v5;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7 resourceIndex:(unint64_t)a8
{
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  traceContext = self->_traceContext;
  long long v37 = (unint64_t)traceContext;
  *(void *)&long long v38 = 0;
  *((void *)&v38 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  *(void *)&long long v39 = v14;
  BYTE8(v39) = *((unsigned char *)v12 + 8);
  *(_WORD *)((char *)&v39 + 9) = 16400;
  *(_DWORD *)((char *)&v39 + 11) = 0;
  HIBYTE(v39) = 0;
  uint64_t v32 = v17;
  uint64_t v33 = v16;
  uint64_t v34 = v18;
  uint64_t v35 = v19;
  uint64_t v36 = v20;
  id v21 = -[MTLTextureSPI newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:](self->_baseObject, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:", *(unsigned int *)&a7, v17);
  if (v21) {
    v22 = [[CaptureMTLTexture alloc] initWithBaseObject:v21 captureTexture:self];
  }
  else {
    v22 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v37, (uint64_t)[(CaptureMTLTexture *)v22 traceStream]);
  uint64_t v23 = v38;
  *(_DWORD *)(v38 + 8) = -15688;
  uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 24);
  uint64_t v25 = BYTE10(v39);
  ++BYTE10(v39);
  Bytes = GTTraceMemPool_allocateBytes(v24, *((uint64_t *)&v38 + 1), v25 | 0x5000000000);
  *(unsigned char *)(v23 + 13) = v25;
  SaveMTLTextureInfo((uint64_t)&v37, v21);
  v27 = [(CaptureMTLTexture *)self traceStream];
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v29 = [(CaptureMTLTexture *)v22 traceStream];
  if (v29) {
    unint64_t v30 = v29->var0;
  }
  else {
    unint64_t v30 = 0;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v30;
  *((void *)Bytes + 4) = a3;
  *((void *)Bytes + 5) = a4;
  *((void *)Bytes + 6) = v33;
  *((void *)Bytes + 7) = v34;
  *((void *)Bytes + 8) = v35;
  *((void *)Bytes + 9) = v36;
  *((void *)Bytes + 10) = v32;
  *(($14D77461FF5D83CAEC4252578BA76F85 *)Bytes + 22) = a7;
  *((_DWORD *)Bytes + 23) = 0;
  *uint64_t v13 = v39;
  *((unsigned char *)v13 + 8) = BYTE8(v39);
  *(unsigned char *)(v38 + 15) |= 8u;

  return v22;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7
{
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  traceContext = self->_traceContext;
  long long v34 = (unint64_t)traceContext;
  *(void *)&long long v35 = 0;
  *((void *)&v35 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  v12 = v11;
  uint64_t v13 = *v11;
  uint64_t *v11 = v14;
  *(void *)&long long v36 = v13;
  BYTE8(v36) = *((unsigned char *)v11 + 8);
  *(_WORD *)((char *)&v36 + 9) = 16400;
  *(_DWORD *)((char *)&v36 + 11) = 0;
  HIBYTE(v36) = 0;
  uint64_t v30 = v15;
  uint64_t v31 = v16;
  uint64_t v32 = v17;
  uint64_t v33 = v18;
  id v19 = -[MTLTextureSPI newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:](self->_baseObject, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", *(unsigned int *)&a7);
  if (v19) {
    uint64_t v20 = [[CaptureMTLTexture alloc] initWithBaseObject:v19 captureTexture:self];
  }
  else {
    uint64_t v20 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v34, (uint64_t)[(CaptureMTLTexture *)v20 traceStream]);
  uint64_t v21 = v35;
  *(_DWORD *)(v35 + 8) = -15775;
  uint64_t v22 = *(void *)(*((void *)&v34 + 1) + 24);
  uint64_t v23 = BYTE10(v36);
  ++BYTE10(v36);
  Bytes = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v35 + 1), v23 | 0x4800000000);
  *(unsigned char *)(v21 + 13) = v23;
  SaveMTLTextureInfo((uint64_t)&v34, v19);
  uint64_t v25 = [(CaptureMTLTexture *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v27 = [(CaptureMTLTexture *)v20 traceStream];
  if (v27) {
    unint64_t v28 = v27->var0;
  }
  else {
    unint64_t v28 = 0;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v28;
  *((void *)Bytes + 4) = a3;
  *((void *)Bytes + 5) = a4;
  *((void *)Bytes + 6) = v30;
  *((void *)Bytes + 7) = v31;
  *((void *)Bytes + 8) = v32;
  *((void *)Bytes + 9) = v33;
  *(($14D77461FF5D83CAEC4252578BA76F85 *)Bytes + 20) = a7;
  *((_DWORD *)Bytes + 21) = 0;
  uint64_t *v12 = v36;
  *((unsigned char *)v12 + 8) = BYTE8(v36);
  *(unsigned char *)(v35 + 15) |= 8u;

  return v20;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 resourceIndex:(unint64_t)a7
{
  NSUInteger location = a5.location;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  traceContext = self->_traceContext;
  long long v35 = (unint64_t)traceContext;
  *(void *)&long long v36 = 0;
  *((void *)&v36 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  *(void *)&long long v37 = v14;
  BYTE8(v37) = *((unsigned char *)v12 + 8);
  *(_WORD *)((char *)&v37 + 9) = 16400;
  *(_DWORD *)((char *)&v37 + 11) = 0;
  HIBYTE(v37) = 0;
  uint64_t v31 = v17;
  uint64_t v32 = v16;
  uint64_t v33 = v18;
  uint64_t v34 = v19;
  id v20 = -[MTLTextureSPI newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:](self->_baseObject, "newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:", v17);
  if (v20) {
    uint64_t v21 = [[CaptureMTLTexture alloc] initWithBaseObject:v20 captureTexture:self];
  }
  else {
    uint64_t v21 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v35, (uint64_t)[(CaptureMTLTexture *)v21 traceStream]);
  uint64_t v22 = v36;
  *(_DWORD *)(v36 + 8) = -15689;
  uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 24);
  uint64_t v24 = BYTE10(v37);
  ++BYTE10(v37);
  Bytes = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v36 + 1), v24 | 0x4800000000);
  *(unsigned char *)(v22 + 13) = v24;
  SaveMTLTextureInfo((uint64_t)&v35, v20);
  v26 = [(CaptureMTLTexture *)self traceStream];
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v28 = [(CaptureMTLTexture *)v21 traceStream];
  if (v28) {
    unint64_t v29 = v28->var0;
  }
  else {
    unint64_t v29 = 0;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v29;
  *((void *)Bytes + 4) = a3;
  *((void *)Bytes + 5) = a4;
  *((void *)Bytes + 6) = location;
  *((void *)Bytes + 7) = v32;
  *((void *)Bytes + 8) = v33;
  *((void *)Bytes + 9) = v34;
  *((void *)Bytes + 10) = v31;
  *uint64_t v13 = v37;
  *((unsigned char *)v13 + 8) = BYTE8(v37);
  *(unsigned char *)(v36 + 15) |= 8u;

  return v21;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6
{
  NSUInteger location = a5.location;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  traceContext = self->_traceContext;
  long long v32 = (unint64_t)traceContext;
  *(void *)&long long v33 = 0;
  *((void *)&v33 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  v12 = v11;
  uint64_t v13 = *v11;
  uint64_t *v11 = v14;
  *(void *)&long long v34 = v13;
  BYTE8(v34) = *((unsigned char *)v11 + 8);
  *(_WORD *)((char *)&v34 + 9) = 16400;
  *(_DWORD *)((char *)&v34 + 11) = 0;
  HIBYTE(v34) = 0;
  uint64_t v29 = v15;
  uint64_t v30 = v16;
  uint64_t v31 = v17;
  id v18 = -[MTLTextureSPI newTextureViewWithPixelFormat:textureType:levels:slices:](self->_baseObject, "newTextureViewWithPixelFormat:textureType:levels:slices:");
  if (v18) {
    uint64_t v19 = [[CaptureMTLTexture alloc] initWithBaseObject:v18 captureTexture:self];
  }
  else {
    uint64_t v19 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v32, (uint64_t)[(CaptureMTLTexture *)v19 traceStream]);
  id v20 = (char *)v33;
  *(_DWORD *)(v33 + 8) = -16196;
  if (BYTE9(v34))
  {
    uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 24);
    uint64_t v22 = BYTE10(v34);
    ++BYTE10(v34);
    uint64_t v23 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v33 + 1), v22 | 0x4000000000) + 16;
  }
  else
  {
    LOBYTE(v22) = 0;
    BYTE9(v34) = 64;
    uint64_t v23 = v20;
  }
  v20[13] = v22;
  SaveMTLTextureInfo((uint64_t)&v32, v18);
  uint64_t v24 = [(CaptureMTLTexture *)self traceStream];
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v26 = [(CaptureMTLTexture *)v19 traceStream];
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0;
  }
  *(void *)uint64_t v23 = var0;
  *((void *)v23 + 1) = v27;
  *((void *)v23 + 2) = a3;
  *((void *)v23 + 3) = a4;
  *((void *)v23 + 4) = location;
  *((void *)v23 + 5) = v29;
  *((void *)v23 + 6) = v30;
  *((void *)v23 + 7) = v31;
  uint64_t *v12 = v34;
  *((unsigned char *)v12 + 8) = BYTE8(v34);
  *(unsigned char *)(v33 + 15) |= 8u;

  return v19;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  traceContext = self->_traceContext;
  long long v24 = (unint64_t)traceContext;
  *(void *)&long long v25 = 0;
  *((void *)&v25 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  *(void *)&long long v26 = v10;
  BYTE8(v26) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v26 + 9) = 16400;
  *(_DWORD *)((char *)&v26 + 11) = 0;
  HIBYTE(v26) = 0;
  id v12 = -[MTLTextureSPI newTextureViewWithPixelFormat:resourceIndex:](self->_baseObject, "newTextureViewWithPixelFormat:resourceIndex:");
  if (v12) {
    uint64_t v13 = [[CaptureMTLTexture alloc] initWithBaseObject:v12 captureTexture:self];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)[(CaptureMTLTexture *)v13 traceStream]);
  uint64_t v14 = v25;
  *(_DWORD *)(v25 + 8) = -15690;
  char v15 = BYTE9(v26);
  if (BYTE9(v26) > 0x20uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v18 = BYTE10(v26);
    ++BYTE10(v26);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v25 + 1), v18 | 0x2000000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v26));
    BYTE9(v26) += 32;
  }
  *(unsigned char *)(v14 + 13) = v15;
  SaveMTLTextureInfo((uint64_t)&v24, v12);
  uint64_t v19 = [(CaptureMTLTexture *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v21 = [(CaptureMTLTexture *)v13 traceStream];
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0;
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a3;
  *((void *)v16 + 3) = a4;
  *uint64_t v9 = v26;
  *((unsigned char *)v9 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v13;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  traceContext = self->_traceContext;
  long long v22 = (unint64_t)traceContext;
  *(void *)&long long v23 = 0;
  *((void *)&v23 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  char v7 = v6;
  uint64_t v8 = *v6;
  *uint64_t v6 = v9;
  *(void *)&long long v24 = v8;
  BYTE8(v24) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v24 + 9) = 16400;
  *(_DWORD *)((char *)&v24 + 11) = 0;
  HIBYTE(v24) = 0;
  id v10 = -[MTLTextureSPI newTextureViewWithPixelFormat:](self->_baseObject, "newTextureViewWithPixelFormat:");
  if (v10) {
    uint64_t v11 = [[CaptureMTLTexture alloc] initWithBaseObject:v10 captureTexture:self];
  }
  else {
    uint64_t v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v22, (uint64_t)[(CaptureMTLTexture *)v11 traceStream]);
  uint64_t v12 = v23;
  *(_DWORD *)(v23 + 8) = -16233;
  char v13 = BYTE9(v24);
  if (BYTE9(v24) > 0x28uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v16 = BYTE10(v24);
    ++BYTE10(v24);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v23 + 1), v16 | 0x1800000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v24));
    BYTE9(v24) += 24;
  }
  *(unsigned char *)(v12 + 13) = v13;
  SaveMTLTextureInfo((uint64_t)&v22, v10);
  uint64_t v17 = [(CaptureMTLTexture *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v19 = [(CaptureMTLTexture *)v11 traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a3;
  *char v7 = v24;
  *((unsigned char *)v7 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;

  return v11;
}

- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6
{
  id v7 = [(MTLTextureSPI *)self->_baseObject newCompressedTextureViewWithPixelFormat:a3 textureType:a4 level:a5 slice:a6];
  if (v7) {
    uint64_t v8 = [[CaptureMTLTexture alloc] initWithBaseObject:v7 captureTexture:self];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)makeAliasable
{
  if (!qword_2501C0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
    [(MTLTextureSPI *)self->_baseObject makeAliasable];
    [(MTLHeap *)self->_captureHeap usedSize];
    [(MTLHeap *)self->_captureHeap currentAllocatedSize];
    uint64_t v3 = v13;
    *(_DWORD *)(v13 + 8) = -16114;
    char v4 = BYTE9(v14);
    if (BYTE9(v14) > 0x38uLL)
    {
      uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
      uint64_t v7 = BYTE10(v14);
      ++BYTE10(v14);
      id v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
      char v4 = v7;
    }
    else
    {
      id v5 = (char *)(v3 + BYTE9(v14));
      BYTE9(v14) += 8;
    }
    *(unsigned char *)(v3 + 13) = v4;
    uint64_t v8 = [(CaptureMTLTexture *)self traceStream];
    if (v8) {
      unint64_t var0 = v8->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    *(void *)id v5 = var0;
    s();
    *(void *)uint64_t v10 = v11;
    *(unsigned char *)(v10 + 8) = BYTE8(v14);
    *(unsigned char *)(v13 + 15) |= 8u;
  }
}

- (BOOL)isPurgeable
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  unsigned int v3 = [(MTLTextureSPI *)self->_baseObject isPurgeable];
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -16231;
  char v5 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v8 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v6 = GTTraceMemPool_allocateBytes(v7, *((uint64_t *)&v15 + 1), v8 | 0x1000000000) + 16;
    char v5 = v8;
  }
  else
  {
    uint64_t v6 = (char *)(v4 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v4 + 13) = v5;
  uint64_t v9 = [(CaptureMTLTexture *)self traceStream];
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v6 = var0;
  *((_DWORD *)v6 + 2) = v3;
  *((_DWORD *)v6 + 3) = 0;
  s();
  *(void *)uint64_t v11 = v12;
  *(unsigned char *)(v11 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  return v3;
}

- (BOOL)isComplete
{
  return [(MTLTextureSPI *)self->_baseObject isComplete];
}

- (BOOL)isAliasable
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  unsigned int v3 = [(MTLTextureSPI *)self->_baseObject isAliasable];
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -16108;
  char v5 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v8 = BYTE10(v16);
    ++BYTE10(v16);
    uint64_t v6 = GTTraceMemPool_allocateBytes(v7, *((uint64_t *)&v15 + 1), v8 | 0x1000000000) + 16;
    char v5 = v8;
  }
  else
  {
    uint64_t v6 = (char *)(v4 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v4 + 13) = v5;
  uint64_t v9 = [(CaptureMTLTexture *)self traceStream];
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v6 = var0;
  *((_DWORD *)v6 + 2) = v3;
  *((_DWORD *)v6 + 3) = 0;
  s();
  *(void *)uint64_t v11 = v12;
  *(unsigned char *)(v11 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  return v3;
}

- (void)generateMipmapLevel:(unint64_t)a3 slice:(unint64_t)a4
{
}

- (BOOL)doesAliasResource:(id)a3
{
  baseObject = self->_baseObject;
  uint64_t v4 = [a3 baseObject];
  LOBYTE(baseObject) = [(MTLTextureSPI *)baseObject doesAliasResource:v4];

  return (char)baseObject;
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, 8 * a4);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, v7);
  if (a4)
  {
    uint64_t v9 = v8;
    unint64_t v10 = a4;
    do
    {
      uint64_t v11 = (void *)*a3++;
      *(void *)uint64_t v9 = [v11 baseObject];
      v9 += 8;
      --v10;
    }
    while (v10);
  }
  return [(MTLTextureSPI *)baseObject doesAliasAnyResources:v8 count:a4];
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, 8 * a4);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, v7);
  if (a4)
  {
    uint64_t v9 = v8;
    unint64_t v10 = a4;
    do
    {
      uint64_t v11 = (void *)*a3++;
      *(void *)uint64_t v9 = [v11 baseObject];
      v9 += 8;
      --v10;
    }
    while (v10);
  }
  return [(MTLTextureSPI *)baseObject doesAliasAllResources:v8 count:a4];
}

- (BOOL)canGenerateMipmapLevels
{
  return [(MTLTextureSPI *)self->_baseObject canGenerateMipmapLevels];
}

- (unint64_t)width
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject width];
}

- (unint64_t)usage
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject usage];
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject uniqueIdentifier];
}

- (unint64_t)unfilteredResourceOptions
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject unfilteredResourceOptions];
}

- (unint64_t)textureType
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject textureType];
}

- (unint64_t)tailSizeInBytes
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject tailSizeInBytes];
}

- (unsigned)swizzleKey
{
  return [(MTLTextureSPI *)self->_baseObject swizzleKey];
}

- ($14D77461FF5D83CAEC4252578BA76F85)swizzle
{
  return ($14D77461FF5D83CAEC4252578BA76F85)[(MTLTextureSPI *)self->_baseObject swizzle];
}

- (unint64_t)storageMode
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject storageMode];
}

- (unint64_t)sparseSurfaceDefaultValue
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject sparseSurfaceDefaultValue];
}

- (unint64_t)sampleCount
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject sampleCount];
}

- (unint64_t)rotation
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject rotation];
}

- (void)setResponsibleProcess:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLTextureSPI *)self->_baseObject setResponsibleProcess:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16239;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    size_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    size_t v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  unint64_t v10 = [(CaptureMTLTexture *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)size_t v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (int)responsibleProcess
{
  return [(MTLTextureSPI *)self->_baseObject responsibleProcess];
}

- (unint64_t)resourceOptions
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject resourceOptions];
}

- (unint64_t)resourceIndex
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject resourceIndex];
}

- (unint64_t)pixelFormat
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject pixelFormat];
}

- (unint64_t)parentRelativeSlice
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject parentRelativeSlice];
}

- (unint64_t)parentRelativeLevel
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject parentRelativeLevel];
}

- (unint64_t)numFaces
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject numFaces];
}

- (unint64_t)mipmapLevelCount
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject mipmapLevelCount];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v19);
  [(MTLTextureSPI *)self->_baseObject setLabel:v4];
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16240;
  char v6 = BYTE9(v21);
  if (BYTE9(v21) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 24);
    uint64_t v9 = BYTE10(v21);
    ++BYTE10(v21);
    size_t v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v20 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    size_t v7 = (char *)(v5 + BYTE9(v21));
    BYTE9(v21) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  unint64_t v10 = [(CaptureMTLTexture *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)&v19, v15, v16 + 1);
  }
  *(void *)size_t v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v21);
  *(unsigned char *)(v20 + 15) |= 8u;
}

- (NSString)label
{
  return (NSString *)[(MTLTextureSPI *)self->_baseObject label];
}

- (BOOL)isSparse
{
  return [(MTLTextureSPI *)self->_baseObject isSparse];
}

- (BOOL)isDrawable
{
  return [(MTLTextureSPI *)self->_baseObject isDrawable];
}

- (BOOL)isCompressed
{
  return [(MTLTextureSPI *)self->_baseObject isCompressed];
}

- (unint64_t)iosurfacePlane
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject iosurfacePlane];
}

- (__IOSurface)iosurface
{
  return (__IOSurface *)[(MTLTextureSPI *)self->_baseObject iosurface];
}

- (unint64_t)height
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject height];
}

- (unint64_t)heapOffset
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject heapOffset];
}

- (unint64_t)hazardTrackingMode
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject hazardTrackingMode];
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)[(MTLTextureSPI *)self->_baseObject gpuResourceID];
}

- (unint64_t)gpuHandle
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject gpuHandle];
}

- (unint64_t)gpuAddress
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject gpuAddress];
}

- (BOOL)isFramebufferOnly
{
  return [(MTLTextureSPI *)self->_baseObject isFramebufferOnly];
}

- (unint64_t)firstMipmapInTail
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject firstMipmapInTail];
}

- (MTLDevice)device
{
  return self->_captureDevice;
}

- (unint64_t)depth
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject depth];
}

- (unint64_t)cpuCacheMode
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject cpuCacheMode];
}

- (int64_t)compressionType
{
  return (int64_t)[(MTLTextureSPI *)self->_baseObject compressionType];
}

- (unint64_t)compressionFootprint
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject compressionFootprint];
}

- (int64_t)compressionFeedback
{
  return (int64_t)[(MTLTextureSPI *)self->_baseObject compressionFeedback];
}

- (unint64_t)colorSpaceConversionMatrix
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject colorSpaceConversionMatrix];
}

- (unint64_t)bufferOffset
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject bufferOffset];
}

- (unint64_t)bufferBytesPerRow
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject bufferBytesPerRow];
}

- (unint64_t)arrayLength
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject arrayLength];
}

- (BOOL)allowGPUOptimizedContents
{
  return [(MTLTextureSPI *)self->_baseObject allowGPUOptimizedContents];
}

- (unint64_t)allocationID
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject allocationID];
}

- (unint64_t)allocatedSize
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject allocatedSize];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLTextureSPI *)baseObject conformsToProtocol:v4];

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return CaptureRespondsToSelector((uint64_t)self->_baseObject, a3);
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)CaptureMTLTexture;
  uint64_t v3 = [(CaptureMTLTexture *)&v7 description];
  id v4 = [(MTLTextureSPI *)self->_baseObject description];
  unsigned __int8 v5 = +[NSString stringWithFormat:@"%@ -> %@", v3, v4];

  return (NSString *)v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_baseObject;
}

- (unint64_t)streamReference
{
  traceStream = self->_traceStream;
  if (traceStream) {
    return traceStream->var0;
  }
  else {
    return 0;
  }
}

- (GTTraceStream)traceStream
{
  return self->_traceStream;
}

- (GTTraceContext)traceContext
{
  return self->_traceContext;
}

- (void)touch
{
  traceStream = self->_traceStream;
  uint64_t v3 = mach_absolute_time();
  if (traceStream)
  {
    unint64_t v4 = atomic_load(&traceStream[1].var1);
    unint64_t v5 = v4;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)&traceStream[1].var1, &v5, v4 & 0x1F | v3 & 0xFFFFFFFFFFFFFFE0);
      BOOL v6 = v5 == v4;
      unint64_t v4 = v5;
    }
    while (!v6);
  }
}

- (id)originalObject
{
  return DEVICEOBJECT(self->_baseObject);
}

- (BOOL)isShareable
{
  return [(MTLTextureSPI *)self->_baseObject isShareable];
}

- (unint64_t)tailSize
{
  return (unint64_t)[(MTLTextureSPI *)self->_baseObject tailSizeInBytes];
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6
{
  traceStream = self->_traceStream;
  if (traceStream)
  {
    p_unint64_t var1 = &traceStream[1].var1;
    unint64_t v13 = atomic_load(p_var1);
    unint64_t v14 = v13;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)p_var1, &v14, v13 | 1);
      BOOL v15 = v14 == v13;
      unint64_t v13 = v14;
    }
    while (!v15);
  }
  baseObject = self->_baseObject;
  long long v17 = *(_OWORD *)&a5->var0.var2;
  long long v32 = *(_OWORD *)&a5->var0.var0;
  long long v33 = v17;
  long long v34 = *(_OWORD *)&a5->var1.var1;
  [(MTLTextureSPI *)baseObject getBytes:a3 bytesPerRow:a4 fromRegion:&v32 mipmapLevel:a6];
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v32);
    uint64_t v18 = v33;
    *(_DWORD *)(v33 + 8) = -16235;
    uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 24);
    uint64_t v20 = BYTE10(v34);
    ++BYTE10(v34);
    Bytes = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v33 + 1), v20 | 0x5000000000);
    *(unsigned char *)(v18 + 13) = v20;
    long long v22 = [(CaptureMTLTexture *)self traceStream];
    if (v22) {
      unint64_t var0 = v22->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    unint64_t v24 = a5->var0.var0;
    unint64_t var1 = a5->var0.var1;
    long long v31 = *(_OWORD *)&a5->var0.var2;
    unint64_t v27 = a5->var1.var1;
    unint64_t var2 = a5->var1.var2;
    char v28 = TransferBytes((uint64_t)&v32, (uint64_t *)a3, (char *)&def_CFBEC + 1);
    *((void *)Bytes + 2) = var0;
    *((void *)Bytes + 3) = a4;
    *((void *)Bytes + 4) = v24;
    *((void *)Bytes + 5) = var1;
    *((_OWORD *)Bytes + 3) = v31;
    *((void *)Bytes + 8) = v27;
    *((void *)Bytes + 9) = var2;
    *((void *)Bytes + 10) = a6;
    Bytes[88] = v28;
    *(_DWORD *)(Bytes + 89) = 0;
    *((_DWORD *)Bytes + 23) = 0;
    s();
    *(void *)uint64_t v29 = v30;
    *(unsigned char *)(v29 + 8) = BYTE8(v34);
    *(unsigned char *)(v33 + 15) |= 8u;
  }
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 bytesPerImage:(unint64_t)a5 fromRegion:(id *)a6 mipmapLevel:(unint64_t)a7 slice:(unint64_t)a8
{
  traceStream = self->_traceStream;
  if (traceStream)
  {
    p_unint64_t var1 = &traceStream[1].var1;
    unint64_t v17 = atomic_load(p_var1);
    unint64_t v18 = v17;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)p_var1, &v18, v17 | 1);
      BOOL v19 = v18 == v17;
      unint64_t v17 = v18;
    }
    while (!v19);
  }
  baseObject = self->_baseObject;
  long long v21 = *(_OWORD *)&a6->var0.var2;
  long long v35 = *(_OWORD *)&a6->var0.var0;
  long long v36 = v21;
  long long v37 = *(_OWORD *)&a6->var1.var1;
  [(MTLTextureSPI *)baseObject getBytes:a3 bytesPerRow:a4 bytesPerImage:a5 fromRegion:&v35 mipmapLevel:a7 slice:a8];
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v35);
    uint64_t v22 = v36;
    *(_DWORD *)(v36 + 8) = -16237;
    uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 24);
    uint64_t v24 = BYTE10(v37);
    ++BYTE10(v37);
    Bytes = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v36 + 1), v24 | 0x6000000000);
    *(unsigned char *)(v22 + 13) = v24;
    long long v26 = [(CaptureMTLTexture *)self traceStream];
    if (v26) {
      unint64_t var0 = v26->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    unint64_t v28 = a6->var0.var0;
    long long v33 = *(_OWORD *)&a6->var1.var0;
    long long v34 = *(_OWORD *)&a6->var0.var1;
    unint64_t var2 = a6->var1.var2;
    char v30 = TransferBytes((uint64_t)&v35, (uint64_t *)a3, (char *)&def_CFBEC + 1);
    *((void *)Bytes + 2) = var0;
    *((void *)Bytes + 3) = a4;
    *((void *)Bytes + 4) = a5;
    *((void *)Bytes + 5) = v28;
    *((_OWORD *)Bytes + 3) = v34;
    *((_OWORD *)Bytes + 4) = v33;
    *((void *)Bytes + 10) = var2;
    *((void *)Bytes + 11) = a7;
    *((void *)Bytes + 12) = a8;
    Bytes[104] = v30;
    *(_DWORD *)(Bytes + 105) = 0;
    *((_DWORD *)Bytes + 27) = 0;
    s();
    *(void *)uint64_t v31 = v32;
    *(unsigned char *)(v31 + 8) = BYTE8(v37);
    *(unsigned char *)(v36 + 15) |= 8u;
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  return [(MTLTextureSPI *)self->_baseObject formattedDescription:a3];
}

- (id)newSharedTextureHandle
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  id v3 = [(MTLTextureSPI *)self->_baseObject newSharedTextureHandle];
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -15910;
  char v5 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v8 = BYTE10(v16);
    ++BYTE10(v16);
    BOOL v6 = GTTraceMemPool_allocateBytes(v7, *((uint64_t *)&v15 + 1), v8 | 0x1000000000) + 16;
    char v5 = v8;
  }
  else
  {
    BOOL v6 = (char *)(v4 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v4 + 13) = v5;
  uint64_t v9 = [(CaptureMTLTexture *)self traceStream];
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)BOOL v6 = var0;
  *((void *)v6 + 1) = v3;
  s();
  *(void *)uint64_t v11 = v12;
  *(unsigned char *)(v11 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  return v3;
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6
{
  traceStream = self->_traceStream;
  if (traceStream)
  {
    p_unint64_t var1 = &traceStream[1].var1;
    unint64_t v13 = atomic_load(p_var1);
    unint64_t v14 = v13;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)p_var1, &v14, v13 | 2);
      BOOL v15 = v14 == v13;
      unint64_t v13 = v14;
    }
    while (!v15);
  }
  baseObject = self->_baseObject;
  long long v17 = *(_OWORD *)&a3->var0.var2;
  long long v33 = *(_OWORD *)&a3->var0.var0;
  long long v34 = v17;
  long long v35 = *(_OWORD *)&a3->var1.var1;
  [(MTLTextureSPI *)baseObject replaceRegion:&v33 mipmapLevel:a4 withBytes:a5 bytesPerRow:a6];
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    unint64_t v18 = DEVICEOBJECT(self);
    long long v33 = *(_OWORD *)&a3->var1.var0;
    *(void *)&long long v34 = a3->var1.var2;
    ClientMemorySize = (const void *)GetClientMemorySize(v18, (uint64_t)&v33, a6, 0);

    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v33);
    uint64_t v20 = v34;
    *(_DWORD *)(v34 + 8) = -16234;
    uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 24);
    uint64_t v22 = BYTE10(v35);
    ++BYTE10(v35);
    Bytes = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v34 + 1), v22 | 0x5000000000);
    *(unsigned char *)(v20 + 13) = v22;
    uint64_t v24 = [(CaptureMTLTexture *)self traceStream];
    if (v24) {
      unint64_t var0 = v24->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    unint64_t var2 = a3->var0.var2;
    long long v31 = *(_OWORD *)&a3->var1.var0;
    long long v32 = *(_OWORD *)&a3->var0.var0;
    unint64_t v27 = a3->var1.var2;
    char v28 = TransferBytes((uint64_t)&v33, (uint64_t *)a5, ClientMemorySize);
    *((void *)Bytes + 2) = var0;
    *(_OWORD *)(Bytes + 24) = v32;
    *((void *)Bytes + 5) = var2;
    *((_OWORD *)Bytes + 3) = v31;
    *((void *)Bytes + 8) = v27;
    *((void *)Bytes + 9) = a4;
    *((void *)Bytes + 10) = a6;
    Bytes[88] = v28;
    *(_DWORD *)(Bytes + 89) = 0;
    *((_DWORD *)Bytes + 23) = 0;
    s();
    *(void *)uint64_t v29 = v30;
    *(unsigned char *)(v29 + 8) = BYTE8(v35);
    *(unsigned char *)(v34 + 15) |= 8u;
  }
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 slice:(unint64_t)a5 withBytes:(const void *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  traceStream = self->_traceStream;
  if (traceStream)
  {
    p_unint64_t var1 = &traceStream[1].var1;
    unint64_t v17 = atomic_load(p_var1);
    unint64_t v18 = v17;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)p_var1, &v18, v17 | 2);
      BOOL v19 = v18 == v17;
      unint64_t v17 = v18;
    }
    while (!v19);
  }
  baseObject = self->_baseObject;
  long long v21 = *(_OWORD *)&a3->var0.var2;
  long long v37 = *(_OWORD *)&a3->var0.var0;
  long long v38 = v21;
  long long v39 = *(_OWORD *)&a3->var1.var1;
  [(MTLTextureSPI *)baseObject replaceRegion:&v37 mipmapLevel:a4 slice:a5 withBytes:a6 bytesPerRow:a7 bytesPerImage:a8];
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    uint64_t v22 = DEVICEOBJECT(self);
    long long v37 = *(_OWORD *)&a3->var1.var0;
    *(void *)&long long v38 = a3->var1.var2;
    ClientMemorySize = (const void *)GetClientMemorySize(v22, (uint64_t)&v37, a7, a8);

    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v37);
    uint64_t v23 = v38;
    *(_DWORD *)(v38 + 8) = -16236;
    uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 24);
    uint64_t v25 = BYTE10(v39);
    ++BYTE10(v39);
    Bytes = GTTraceMemPool_allocateBytes(v24, *((uint64_t *)&v38 + 1), v25 | 0x6800000000);
    *(unsigned char *)(v23 + 13) = v25;
    unint64_t v27 = [(CaptureMTLTexture *)self traceStream];
    if (v27) {
      unint64_t var0 = v27->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    unint64_t var2 = a3->var0.var2;
    long long v34 = *(_OWORD *)&a3->var1.var0;
    long long v35 = *(_OWORD *)&a3->var0.var0;
    unint64_t v30 = a3->var1.var2;
    char v31 = TransferBytes((uint64_t)&v37, (uint64_t *)a6, ClientMemorySize);
    *((void *)Bytes + 2) = var0;
    *(_OWORD *)(Bytes + 24) = v35;
    *((void *)Bytes + 5) = var2;
    *((_OWORD *)Bytes + 3) = v34;
    *((void *)Bytes + 8) = v30;
    *((void *)Bytes + 9) = a4;
    *((void *)Bytes + 10) = a5;
    *((void *)Bytes + 11) = a7;
    *((void *)Bytes + 12) = a8;
    *((void *)Bytes + 13) = 0;
    Bytes[112] = v31;
    *(_DWORD *)(Bytes + 113) = 0;
    *((_DWORD *)Bytes + 29) = 0;
    s();
    *(void *)uint64_t v32 = v33;
    *(unsigned char *)(v32 + 8) = BYTE8(v39);
    *(unsigned char *)(v38 + 15) |= 8u;
  }
}

- (MTLResource)rootResource
{
  return self->_captureRootResource;
}

- (MTLTexture)parentTexture
{
  if ([(MTLResource *)self->_captureRootResource conformsToProtocol:&OBJC_PROTOCOL___MTLTexture])captureRootResource = self->_captureRootResource; {
  else
  }
    captureRootResource = 0;

  return captureRootResource;
}

- (MTLHeap)heap
{
  return self->_captureHeap;
}

- (MTLBuffer)buffer
{
  if ([(MTLResource *)self->_captureRootResource conformsToProtocol:&OBJC_PROTOCOL___MTLBuffer])captureRootResource = self->_captureRootResource; {
  else
  }
    captureRootResource = 0;

  return captureRootResource;
}

- (MTLTexture)baseObject
{
  return self->_baseObject;
}

- (void)dealloc
{
  baseObject = self->_baseObject;
  self->_baseObject = 0;

  [(MTLHeap *)self->_captureHeap usedSize];
  [(MTLHeap *)self->_captureHeap currentAllocatedSize];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -16238;
  char v5 = BYTE9(v16);
  if (BYTE9(v16) > 0x38uLL)
  {
    uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v8 = BYTE10(v16);
    ++BYTE10(v16);
    BOOL v6 = GTTraceMemPool_allocateBytes(v7, *((uint64_t *)&v15 + 1), v8 | 0x800000000) + 16;
    char v5 = v8;
  }
  else
  {
    BOOL v6 = (char *)(v4 + BYTE9(v16));
    BYTE9(v16) += 8;
  }
  *(unsigned char *)(v4 + 13) = v5;
  uint64_t v9 = [(CaptureMTLTexture *)self traceStream];
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)BOOL v6 = var0;
  s();
  *(void *)uint64_t v11 = v12;
  *(unsigned char *)(v11 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v13.receiver = self;
  v13.super_class = (Class)CaptureMTLTexture;
  [(CaptureMTLTexture *)&v13 dealloc];
}

- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureTexture:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CaptureMTLTexture;
  uint64_t v9 = [(CaptureMTLTexture *)&v18 init];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = [v8 device];
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (MTLDevice *)v11;

    uint64_t v13 = [v8 heap];
    captureHeap = v10->_captureHeap;
    v10->_captureHeap = (MTLHeap *)v13;

    objc_storeStrong((id *)&v10->_captureRootResource, a4);
    long long v15 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v15;
    long long v16 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v15, (unint64_t)v16, (unint64_t)v10);
  }
  return v10;
}

- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CaptureMTLTexture;
  uint64_t v9 = [(CaptureMTLTexture *)&v18 init];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = [v8 device];
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (MTLDevice *)v11;

    uint64_t v13 = [v8 heap];
    captureHeap = v10->_captureHeap;
    v10->_captureHeap = (MTLHeap *)v13;

    objc_storeStrong((id *)&v10->_captureRootResource, a4);
    long long v15 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v15;
    long long v16 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v15, (unint64_t)v16, (unint64_t)v10);
  }
  return v10;
}

- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureHeap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CaptureMTLTexture;
  uint64_t v9 = [(CaptureMTLTexture *)&v16 init];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = [v8 device];
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (MTLDevice *)v11;

    objc_storeStrong((id *)&v10->_captureHeap, a4);
    uint64_t v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    long long v14 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v13, (unint64_t)v14, (unint64_t)v10);

    [v8 usedSize];
    [v8 currentAllocatedSize];
  }

  return v10;
}

- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLTexture;
  uint64_t v9 = [(CaptureMTLTexture *)&v14 init];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    uint64_t v12 = DEVICEOBJECT(v7);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v11, (unint64_t)v12, (unint64_t)v10);
  }
  return v10;
}

@end