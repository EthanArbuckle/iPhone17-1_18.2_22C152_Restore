@interface AGXG17FamilyBlitContext
- (AGXG17FamilyBlitContext)initWithCommandBuffer:(id)a3 descriptor:(id)a4;
- (BOOL)commandBatchIdRangeMin:(unsigned int *)a3 max:(unsigned int *)a4;
- (BOOL)setMTLCounterSampleLocationWithBuffer:(id)a3 startIndex:(unsigned int)a4 endIndex:(unsigned int)a5;
- (id)reInitWithCommandBuffer:(id)a3;
- (unsigned)commandBatchIdOffset;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10;
- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6;
- (void)dealloc;
- (void)deferredEndEncoding;
- (void)endEncoding;
- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5;
- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8;
- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5;
- (void)generateMipmapsForTexture:(id)a3;
- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9;
- (void)invalidateCompressedTexture:(id)a3;
- (void)invalidateCompressedTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)optimizeContentsForCPUAccess:(id)a3;
- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)optimizeContentsForGPUAccess:(id)a3;
- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)resetCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6;
- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)updateFence:(id)a3;
- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6;
- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7;
- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8;
- (void)waitForFence:(id)a3;
@end

@implementation AGXG17FamilyBlitContext

- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    impl = self->_impl;
    if (a4.length + a4.location <= [a3 sampleCount])
    {
      uint64_t v12 = [a3 buffer];
      if (impl[492] != -1 && [a3 buffer] == *((void *)impl + 245))
      {
        unsigned int v16 = impl[492];
        if (v16 >= location && v16 < (int)length + (int)location)
        {
          AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::endPreviousBlitCommand((uint64_t)impl, 0, v13, v14, v15);
          AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::beginComputePass((uint64_t)impl, 0);
        }
      }
      *((unsigned char *)impl + 1976) = 1;
      uint64_t v18 = [a3 sampleSize];
      AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::copyBufferToBuffer((uint64_t)impl, (uint64_t)a5, a6, v12, v18 * location, v18 * length);
      *((unsigned char *)impl + 1976) = 0;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** Cannot resolve MTLCounter data: out of bounds access\n", "agxa_blit_template.hpp", 3464, "resolveCounters");
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v20 = "agxa_blit_template.hpp";
        __int16 v21 = 1024;
        int v22 = 3464;
        __int16 v23 = 2080;
        v24 = "resolveCounters";
        _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Cannot resolve MTLCounter data: out of bounds access\n", buf, 0x1Cu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v20 = "agxa_blit_template.hpp";
        __int16 v21 = 1024;
        int v22 = 3464;
        __int16 v23 = 2080;
        v24 = "resolveCounters";
        _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Cannot resolve MTLCounter data: out of bounds access\n", buf, 0x1Cu);
      }
    }
  }
}

- (BOOL)setMTLCounterSampleLocationWithBuffer:(id)a3 startIndex:(unsigned int)a4 endIndex:(unsigned int)a5
{
  if (!a3) {
    return 0;
  }
  impl = (unsigned int *)self->_impl;
  impl[492] = a4;
  impl[493] = a5;
  char v7 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 492);
  int v8 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 493);
  if ((v7 & 1) == 0 && !v8) {
    return 0;
  }

  return AGX::CounterSamplingContextGen1::setCounterSampleBuffer((AGX::CounterSamplingContextGen1 *)(impl + 490), (AGXMTLCounterSampleBuffer *)a3);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
}

- (unsigned)commandBatchIdOffset
{
  return 0;
}

- (BOOL)commandBatchIdRangeMin:(unsigned int *)a3 max:(unsigned int *)a4
{
  return AGX::ContextCommon<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::userDrawTokenIndex((uint64_t)self->_impl + 8, a3, a4);
}

- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5
{
  impl = self->_impl;
  impl[381] = a3;
  impl[382] = a4;
}

- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6
{
  int v6 = a6;
  int length = a4.length;
  int location = a4.location;
  v53[3] = *MEMORY[0x263EF8340];
  impl = self->_impl;
  uint64_t v9 = *((void *)a5 + 47);
  uint64_t v10 = *((void *)a3 + 47);
  int v11 = *((_DWORD *)a3 + 92);
  uint64_t v12 = (int)*MEMORY[0x263F4B188];
  uint64_t v13 = *(void *)(v9 + v12 + 8);
  uint64_t v14 = *(void *)(v10 + v12 + 8);
  if (*(_DWORD *)*MEMORY[0x263F4B1E8]) {
    IOGPUDeviceTraceEvent();
  }
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::startTAHardwareCommand((uint64_t)impl);
  v53[1] = 0;
  v53[2] = 0;
  v52[2] = 0;
  v53[0] = v9;
  v52[0] = v10;
  v52[1] = 0;
  AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::bindTAResources((uint64_t)impl, (uint64_t)v53, v52);
  uint64_t v15 = *(void *)(impl[183] + 808);
  unsigned int v16 = *(void **)(v15 + 5688);
  if (v16)
  {
    do
    {
      IOGPUResourceListAddResource();
      unsigned int v16 = (void *)*v16;
    }
    while (v16);
    uint64_t v15 = *(void *)(impl[183] + 808);
  }
  LODWORD(__p[0]) = 15;
  v39 = 0;
  uint64_t v40 = 0;
  __p[1] = 0;
  v37 = &unk_26F852188;
  if (v11) {
    int v17 = 4;
  }
  else {
    int v17 = 134217732;
  }
  int v41 = v17;
  uint64_t BlitProgramVariant = AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::findOrCreateBlitProgramVariant(v15, (uint64_t)&v37);
  v37 = &unk_26F8521C8;
  if (__p[1])
  {
    v39 = __p[1];
    operator delete(__p[1]);
  }
  memset(v49, 0, 56);
  v45[3] = 0;
  v45[0] = v14;
  v45[1] = v13;
  int v46 = 0;
  int v47 = location;
  int v48 = v6;
  AGX::SpillInfoGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::SpillInfoGen3((uint64_t)&v37, *(void *)(impl[183] + 808), *(void *)(*(void *)(impl[183] + 808) + 6032));
  int v43 = 1;
  int v19 = *(_DWORD *)(BlitProgramVariant + 2636);
  int v20 = HIDWORD(v37);
  int v21 = HIDWORD(v37);
  if (v19 > SHIDWORD(v37))
  {
    LODWORD(v37) = *(_DWORD *)(BlitProgramVariant + 2632);
    HIDWORD(v37) = v19;
    *(_OWORD *)__p = *(_OWORD *)(BlitProgramVariant + 2640);
    int v21 = v19;
  }
  int v22 = *(_DWORD *)(BlitProgramVariant + 2656);
  int v23 = (int)v39;
  if ((int)v39 <= v22) {
    int v24 = *(_DWORD *)(BlitProgramVariant + 2656);
  }
  else {
    int v24 = (int)v39;
  }
  LODWORD(v39) = v24;
  uint64_t v25 = v50;
  if (v19 > v20 || v23 < v22)
  {
    int v26 = v41;
    int v27 = v42;
    if (v41 < 1)
    {
      int v34 = 0;
      int v33 = 0;
    }
    else
    {
      unsigned int v28 = *(_DWORD *)(v44 + 5912);
      unsigned int v29 = 2 * *(_DWORD *)(v44 + 5888) / v28 * v28;
      uint64_t v30 = 5936;
      if (*(_OWORD *)(v44 + 5936) == 0) {
        uint64_t v30 = 5952;
      }
      int32x2_t v31 = vmovn_s64((int64x2_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v44 + v30))))));
      unsigned __int32 v32 = vadd_s32(vdup_lane_s32(v31, 1), v31).u32[0];
      if (v29 >= v32) {
        unsigned int v29 = v32;
      }
      int v33 = v40 + HIDWORD(v40);
      int v34 = (v42 + v41 + v40 + HIDWORD(v40)) * v29;
      int v35 = (HIDWORD(v40) - v37) * v28;
      if (SHIDWORD(v40) <= (int)v37) {
        int v35 = 0;
      }
      v21 += v34 + v35;
      v24 += HIDWORD(v39) + v34;
    }
    *(_WORD *)(v50 + 360) = 0;
    *(_DWORD *)(v25 + 344) = v26;
    *(_DWORD *)(v25 + 348) = v27;
    *(_DWORD *)(v25 + 352) = v33;
    *(_DWORD *)(v25 + 356) = v34;
    *(void *)(v25 + 304) = (uint64_t)(int)((v21 + 7) & 0xFFFFFFF8) << 12;
    *(void *)(v25 + 312) = (uint64_t)(int)((v24 + 7) & 0xFFFFFFF8) << 12;
    *(_OWORD *)(v25 + 320) = *(_OWORD *)__p;
  }
  AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeTACommonDrawState(impl);
  AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeTADraw((uint64_t)impl, BlitProgramVariant, v49, (uint64_t)v45, length, 1u);
  AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::endTAHardwareCommand((uint64_t)impl, v51, v25);
  if (*(_DWORD *)*MEMORY[0x263F4B1E8]) {
    IOGPUDeviceTraceEvent();
  }
}

- (void)resetCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  int length = a4.length;
  int location = a4.location;
  v46[3] = *MEMORY[0x263EF8340];
  impl = self->_impl;
  uint64_t v7 = *((void *)a3 + 47);
  int v8 = *((_DWORD *)a3 + 92);
  uint64_t v9 = *(void *)(v7 + (int)*MEMORY[0x263F4B188] + 8);
  uint64_t v10 = (_DWORD **)MEMORY[0x263F4B1E8];
  if (*(_DWORD *)*MEMORY[0x263F4B1E8]) {
    IOGPUDeviceTraceEvent();
  }
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::startTAHardwareCommand((uint64_t)impl);
  v46[1] = 0;
  v46[2] = 0;
  v46[0] = v7;
  AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::bindTAResources((uint64_t)impl, (uint64_t)v46, 0);
  LODWORD(__p[0]) = 15;
  int v34 = 0;
  uint64_t v35 = 0;
  __p[1] = 0;
  unsigned __int32 v32 = &unk_26F852188;
  if (v8) {
    int v11 = 5;
  }
  else {
    int v11 = 134217733;
  }
  int v36 = v11;
  uint64_t BlitProgramVariant = AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::findOrCreateBlitProgramVariant(*(void *)(impl[183] + 808), (uint64_t)&v32);
  unsigned __int32 v32 = &unk_26F8521C8;
  if (__p[1])
  {
    int v34 = __p[1];
    operator delete(__p[1]);
  }
  uint64_t v13 = *(void *)(impl[183] + 808);
  uint64_t v14 = *(void **)(v13 + 5688);
  if (v14)
  {
    do
    {
      IOGPUResourceListAddResource();
      uint64_t v14 = (void *)*v14;
    }
    while (v14);
    uint64_t v13 = *(void *)(impl[183] + 808);
  }
  memset(v43, 0, 56);
  v40[3] = 0;
  v40[0] = 0;
  v40[1] = v9;
  int v41 = 0;
  int v42 = location;
  AGX::SpillInfoGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::SpillInfoGen3((uint64_t)&v32, v13, *(void *)(v13 + 6032));
  int v38 = 1;
  int v15 = *(_DWORD *)(BlitProgramVariant + 2636);
  int v16 = HIDWORD(v32);
  int v17 = HIDWORD(v32);
  if (v15 > SHIDWORD(v32))
  {
    LODWORD(v32) = *(_DWORD *)(BlitProgramVariant + 2632);
    HIDWORD(v32) = v15;
    *(_OWORD *)__p = *(_OWORD *)(BlitProgramVariant + 2640);
    int v17 = v15;
  }
  int v18 = *(_DWORD *)(BlitProgramVariant + 2656);
  int v19 = (int)v34;
  if ((int)v34 <= v18) {
    int v20 = *(_DWORD *)(BlitProgramVariant + 2656);
  }
  else {
    int v20 = (int)v34;
  }
  LODWORD(v34) = v20;
  uint64_t v21 = v44;
  if (v15 > v16 || v19 < v18)
  {
    int v22 = v36;
    int v23 = v37;
    if (v36 < 1)
    {
      int v30 = 0;
      int v29 = 0;
    }
    else
    {
      unsigned int v24 = *(_DWORD *)(v39 + 5912);
      unsigned int v25 = 2 * *(_DWORD *)(v39 + 5888) / v24 * v24;
      uint64_t v26 = 5936;
      if (*(_OWORD *)(v39 + 5936) == 0) {
        uint64_t v26 = 5952;
      }
      int32x2_t v27 = vmovn_s64((int64x2_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v39 + v26))))));
      unsigned __int32 v28 = vadd_s32(vdup_lane_s32(v27, 1), v27).u32[0];
      if (v25 >= v28) {
        unsigned int v25 = v28;
      }
      int v29 = v35 + HIDWORD(v35);
      int v30 = (v37 + v36 + v35 + HIDWORD(v35)) * v25;
      int v31 = (HIDWORD(v35) - v32) * v24;
      if (SHIDWORD(v35) <= (int)v32) {
        int v31 = 0;
      }
      v17 += v30 + v31;
      v20 += HIDWORD(v34) + v30;
    }
    *(_WORD *)(v44 + 360) = 0;
    *(_DWORD *)(v21 + 344) = v22;
    *(_DWORD *)(v21 + 348) = v23;
    *(_DWORD *)(v21 + 352) = v29;
    *(_DWORD *)(v21 + 356) = v30;
    *(void *)(v21 + 304) = (uint64_t)(int)((v17 + 7) & 0xFFFFFFF8) << 12;
    *(void *)(v21 + 312) = (uint64_t)(int)((v20 + 7) & 0xFFFFFFF8) << 12;
    *(_OWORD *)(v21 + 320) = *(_OWORD *)__p;
  }
  AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeTACommonDrawState(impl);
  AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeTADraw((uint64_t)impl, BlitProgramVariant, v43, (uint64_t)v40, length, 1u);
  AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::endTAHardwareCommand((uint64_t)impl, v45, v21);
  if (**v10) {
    IOGPUDeviceTraceEvent();
  }
}

- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  v13[0] = *a6;
  v13[1] = *a7;
  impl = (uint32x2_t *)self->_impl;
  impl[192].i32[0] = impl[191].i32[1];
  AGX::BlitDispatchContextGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::sparseTexture(impl, (uint64_t)a3, (int *)v13, a5, a4, 0, 0, 0, 0, (uint64_t)a8, (uint64_t)a11, a10, a9);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6
{
  impl = (uint32x2_t *)self->_impl;
  impl[192].i32[0] = impl[191].i32[1];
  AGX::BlitDispatchContextGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::sparseTexture(impl, (uint64_t)a3, (int *)a4, a5, a6, 0, 1, 0, 0, 0, 0, 0, 0);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9
{
  impl = (uint32x2_t *)self->_impl;
  impl[192].i32[0] = impl[191].i32[1];
  AGX::BlitDispatchContextGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::sparseTexture(impl, (uint64_t)a3, (int *)a4, a5, a6, 0, a7, (uint64_t)a8, a9, 0, 0, 0, 0);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6
{
  impl = self->_impl;
  impl[384] = impl[383];
  AGX::BlitDispatchContextGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::sparseTextureIndirect((uint64_t)impl, (uint64_t)a3, (uint64_t)a5, a6, a4);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7
{
  impl = (uint32x2_t *)self->_impl;
  impl[192].i32[0] = impl[191].i32[1];
  AGX::BlitDispatchContextGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::sparseTexture(impl, (uint64_t)a3, (int *)a5, a6, a7, a4, 0, 0, 0, 0, 0, 0, 0);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8
{
  impl = (uint32x2_t *)self->_impl;
  __int32 v9 = impl[191].i32[1];
  impl[192].i32[0] = v9;
  uint64_t v10 = a8;
  if (a8)
  {
    int v14 = a4;
    do
    {
      unsigned int v18 = *(_DWORD *)a6++;
      uint64_t v17 = v18;
      unsigned int v19 = *(_DWORD *)a7++;
      AGX::BlitDispatchContextGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::sparseTexture(impl, (uint64_t)a3, (int *)a5++, v17, v19, v14, 0, 0, 0, 0, 0, 0, 0);
      --v10;
    }
    while (v10);
    impl = (uint32x2_t *)self->_impl;
    __int32 v9 = impl[191].i32[1];
  }
  impl[192].i32[1] = v9;
}

- (void)waitForFence:(id)a3
{
  impl = self->_impl;
  if (*((void *)impl + 186)) {
    MTLResourceListAddResource();
  }
  if (!*((void *)impl + 244)) {
    operator new();
  }
  unsigned int v5 = *(unsigned __int16 *)((char *)a3 + (int)*MEMORY[0x263F4B168]);
  int v6 = (AGX::FenceList *)*((void *)impl + 244);

  AGX::FenceList::insertFence(v6, v5);
}

- (void)updateFence:(id)a3
{
  impl = self->_impl;
  if (*((void *)impl + 186)) {
    MTLResourceListAddResource();
  }
  if (!*((void *)impl + 243)) {
    operator new();
  }
  unsigned int v5 = *(unsigned __int16 *)((char *)a3 + (int)*MEMORY[0x263F4B168]);
  int v6 = (AGX::FenceList *)*((void *)impl + 243);

  AGX::FenceList::insertFence(v6, v5);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  int v119 = a5;
  int v120 = a8;
  int v121 = a4;
  int v122 = a7;
  impl = self->_impl;
  impl[384] = impl[383];
  uint64_t v14 = *((void *)a3 + 67);
  uint64_t v15 = *((void *)a6 + 67);
  if (*(_DWORD *)(v14 + 236)) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = *(_DWORD *)(v15 + 236) != 0;
  }
  unsigned int v17 = *(_DWORD *)(*(void *)(v14 + 208) + 24);
  if (*(_DWORD *)(*(void *)(v15 + 208) + 24) < v17) {
    unsigned int v17 = *(_DWORD *)(*(void *)(v15 + 208) + 24);
  }
  unsigned int v112 = v17;
  uint64_t v18 = *(void *)(v15 + 32);
  uint64_t v19 = *(void *)(v14 + 32);
  BOOL v21 = v18 == 260 && v19 == 261;
  BOOL v23 = v19 == 260 && v18 == 261;
  BOOL v110 = v23;
  BOOL v111 = v21;
  if (v16 || *(unsigned __int8 *)(v14 + 380) != *(unsigned __int8 *)(v15 + 380))
  {
    id v131 = (id)MEMORY[0x263EF8330];
    unint64_t v132 = 3221225472;
    v133 = (void (*)(id *, id *, id *))___ZN3AGX11BlitContextINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE20copyTextureToTextureEP19AGXG17FamilyTexturejjS7_jjjj_block_invoke_2;
    v134 = &unk_26516F1A8;
    id v136 = a3;
    v137 = impl;
    id v135 = a6;
    if (v112) {
      BOOL v68 = a9 == 0;
    }
    else {
      BOOL v68 = 1;
    }
    if (!v68 && a10 != 0)
    {
      int v70 = 0;
      do
      {
        int v71 = 0;
        unsigned int v72 = v70 + v111;
        int v109 = v70;
        unsigned int v73 = v70 + v110;
        do
        {
          unsigned int v74 = v71 + v122;
          int v117 = v71;
          unsigned int v75 = v71 + v121;
          int v76 = v120;
          int v77 = v119;
          int v78 = a10;
          do
          {
            id v165 = a6;
            v166 = (id *)__PAIR64__(v74, v72);
            LODWORD(v167) = v76;
            id v144 = a3;
            v145 = (id *)__PAIR64__(v75, v73);
            LODWORD(v146) = v77;
            v133(&v131, &v165, &v144);
            ++v77;
            ++v76;
            --v78;
          }
          while (v78);
          int v71 = v117 + 1;
        }
        while (v117 + 1 != a9);
        int v70 = v109 + 1;
      }
      while (v109 + 1 != v112);
    }
  }
  else
  {
    BOOL v106 = *(void *)(v15 + 488) != 0;
    v113 = impl;
    uint64_t v24 = *(void *)(v14 + 488);
    uint64_t v183 = 0;
    v184 = &v183;
    v10.n128_u64[0] = 0x2020000000;
    uint64_t v185 = 0x2020000000;
    int v186 = 0;
    v178[0] = MEMORY[0x263EF8330];
    v178[1] = 3221225472;
    v179 = (uint64_t (*)(uint64_t, uint64_t, id *))___ZN3AGX11BlitContextINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE20copyTextureToTextureEP19AGXG17FamilyTexturejjS7_jjjj_block_invoke_3;
    v180 = &unk_26516F1D0;
    v181 = &v183;
    char v182 = 1;
    if (v112) {
      BOOL v25 = a10 == 0;
    }
    else {
      BOOL v25 = 1;
    }
    if (!v25)
    {
      int v26 = 0;
      do
      {
        int v27 = v120;
        int v28 = v119;
        int v29 = a10;
        do
        {
          id v131 = a6;
          LODWORD(v132) = v26 + v111;
          HIDWORD(v132) = v122;
          LODWORD(v133) = v27;
          id v165 = a3;
          LODWORD(v166) = v26 + v110;
          HIDWORD(v166) = v121;
          LODWORD(v167) = v28;
          v179((uint64_t)v178, (uint64_t)&v131, &v165);
          ++v28;
          ++v27;
          --v29;
        }
        while (v29);
        ++v26;
      }
      while (v26 != v112);
    }
    if (v24)
    {
      v174[0] = MEMORY[0x263EF8330];
      v174[1] = 3221225472;
      v175 = (uint64_t (*)(uint64_t, uint64_t, id *))___ZN3AGX11BlitContextINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE20copyTextureToTextureEP19AGXG17FamilyTexturejjS7_jjjj_block_invoke_4;
      v176 = &unk_26516F1F8;
      v177 = &v183;
      if (v112)
      {
        if (a10)
        {
          for (int i = 0; i != v112; ++i)
          {
            int v31 = v120;
            int v32 = v119;
            int v33 = a10;
            do
            {
              id v131 = a6;
              LODWORD(v132) = i + v111;
              HIDWORD(v132) = v122;
              LODWORD(v133) = v31;
              id v165 = a3;
              LODWORD(v166) = i + v110;
              HIDWORD(v166) = v121;
              LODWORD(v167) = v32;
              v175((uint64_t)v174, (uint64_t)&v131, &v165);
              ++v32;
              ++v31;
              --v33;
            }
            while (v33);
          }
        }
      }
    }
    uint64_t v108 = v24;
    uint64_t v34 = v112 * a9 * *((_DWORD *)v184 + 6);
    id v165 = 0;
    v166 = &v165;
    uint64_t v167 = 0x4812000000;
    v168 = __Block_byref_object_copy__313;
    v169 = __Block_byref_object_dispose__314;
    v170 = &unk_242ECA497;
    v173 = 0;
    v171 = 0;
    v172 = 0;
    if (v34)
    {
      v171 = operator new(16 * v34);
      v172 = v171;
      v173 = (char *)v171 + 16 * v34;
    }
    uint64_t v105 = v34;
    v159[0] = MEMORY[0x263EF8330];
    v159[1] = 3221225472;
    v160 = ___ZN3AGX11BlitContextINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE20copyTextureToTextureEP19AGXG17FamilyTexturejjS7_jjjj_block_invoke_186;
    v161 = &unk_26516F240;
    char v164 = 1;
    v162 = &__block_literal_global_181;
    v163 = &v165;
    if (v112 && a9 && a10)
    {
      int v35 = 0;
      do
      {
        int v36 = 0;
        unsigned int v37 = v35 + v111;
        int v115 = v35;
        unsigned int v38 = v35 + v110;
        do
        {
          unsigned int v39 = v36 + v122;
          int v40 = v36;
          unsigned int v41 = v36 + v121;
          int v42 = v120;
          int v43 = v119;
          int v44 = a10;
          do
          {
            id v131 = a6;
            unint64_t v132 = __PAIR64__(v39, v37);
            LODWORD(v133) = v42;
            id v144 = a3;
            v145 = (id *)__PAIR64__(v41, v38);
            LODWORD(v146) = v43;
            v160((uint64_t)v159, (uint64_t)&v131, (unsigned int *)&v144);
            ++v43;
            ++v42;
            --v44;
          }
          while (v44);
          int v36 = v40 + 1;
        }
        while (v40 + 1 != a9);
        int v35 = v115 + 1;
      }
      while (v115 + 1 != v112);
    }
    if (v108)
    {
      v153[0] = MEMORY[0x263EF8330];
      v153[1] = 3221225472;
      v154 = ___ZN3AGX11BlitContextINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE20copyTextureToTextureEP19AGXG17FamilyTexturejjS7_jjjj_block_invoke_2_187;
      v155 = &unk_26516F240;
      char v158 = 1;
      v157 = &v165;
      v156 = &__block_literal_global_181;
      if (v112)
      {
        if (a9 && a10)
        {
          int v45 = 0;
          do
          {
            int v46 = 0;
            unsigned int v47 = v45 + v111;
            int v116 = v45;
            unsigned int v48 = v45 + v110;
            do
            {
              unsigned int v49 = v46 + v122;
              int v50 = v46;
              unsigned int v51 = v46 + v121;
              int v52 = v120;
              int v53 = v119;
              int v54 = a10;
              do
              {
                id v131 = a6;
                unint64_t v132 = __PAIR64__(v49, v47);
                LODWORD(v133) = v52;
                id v144 = a3;
                v145 = (id *)__PAIR64__(v51, v48);
                LODWORD(v146) = v53;
                v154((uint64_t)v153, (uint64_t)&v131, (unsigned int *)&v144);
                ++v53;
                ++v52;
                --v54;
              }
              while (v54);
              int v46 = v50 + 1;
            }
            while (v50 + 1 != a9);
            int v45 = v116 + 1;
          }
          while (v116 + 1 != v112);
        }
      }
    }
    v55 = (__n128 *)v166[6];
    v56 = (__n128 *)v166[7];
    unint64_t v57 = 126 - 2 * __clz(v56 - v55);
    if (v56 == v55) {
      uint64_t v58 = 0;
    }
    else {
      uint64_t v58 = v57;
    }
    __n128 v59 = std::__introsort<std::_ClassicAlgPolicy,AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::copyTextureToTexture(AGXG17FamilyTexture *,unsigned int,unsigned int,AGXG17FamilyTexture *,unsigned int,unsigned int,unsigned int,unsigned int)::{lambda(AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::copyTextureToTexture(AGXG17FamilyTexture *,unsigned int,unsigned int,AGXG17FamilyTexture *,unsigned int,unsigned int,unsigned int,unsigned int)::MemRange,AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::copyTextureToTexture(AGXG17FamilyTexture *,unsigned int,unsigned int,AGXG17FamilyTexture *,unsigned int,unsigned int,unsigned int,unsigned int)::MemRange)#1} &,AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::copyTextureToTexture(AGXG17FamilyTexture *,unsigned int,unsigned int,AGXG17FamilyTexture *,unsigned int,unsigned int,unsigned int,unsigned int)::MemRange*,false>(v55, v56, v58, 1, v10);
    v61 = (__n128 *)v166[6];
    v60 = (__n128 *)v166[7];
    if (v61 == v60)
    {
      id v63 = a6;
      v64 = v113;
      uint64_t v65 = v105;
    }
    else
    {
      v62 = (__n128 *)v166[6];
      id v63 = a6;
      v64 = v113;
      uint64_t v65 = v105;
      while (1)
      {
        __n128 v66 = *v62++;
        __n128 v59 = v66;
        __n128 *v61 = v66;
        if (v62 == v60) {
          break;
        }
        unint64_t v67 = v61->n128_u64[1];
        while (v67 == v62->n128_u64[0])
        {
          unint64_t v67 = v62->n128_u64[1];
          v61->n128_u64[1] = v67;
          if (++v62 == v60) {
            goto LABEL_82;
          }
        }
        ++v61;
        if (v62 == v60) {
          goto LABEL_84;
        }
      }
LABEL_82:
      ++v61;
    }
LABEL_84:
    if (v61 != v166[7]) {
      v166[7] = v61;
    }
    id v144 = 0;
    v145 = &v144;
    uint64_t v146 = 0x4812000000;
    v147 = __Block_byref_object_copy__188;
    v148 = __Block_byref_object_dispose__189;
    v149 = &unk_242ECA497;
    v151 = 0;
    v152 = 0;
    __p = 0;
    if (v65)
    {
      v79 = (char *)operator new(24 * v65);
      __p = v79;
      v151 = v79;
      v152 = &v79[24 * v65];
    }
    else
    {
      v79 = 0;
    }
    id v131 = (id)MEMORY[0x263EF8330];
    unint64_t v132 = 3221225472;
    v133 = (void (*)(id *, id *, id *))___ZN3AGX11BlitContextINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE20copyTextureToTextureEP19AGXG17FamilyTexturejjS7_jjjj_block_invoke_2_195;
    v134 = &unk_26516F288;
    v140 = &v144;
    v141 = v64;
    BOOL v142 = v106;
    char v143 = 1;
    v137 = &__block_literal_global_194;
    v138 = &__block_literal_global_181;
    v139 = &v165;
    id v135 = v63;
    id v136 = a3;
    if (v112 && a9)
    {
      unint64_t v80 = (unint64_t)v79;
      if (a10)
      {
        int v81 = 0;
        do
        {
          int v82 = 0;
          unsigned int v83 = v81 + v111;
          int v118 = v81;
          unsigned int v84 = v81 + v110;
          do
          {
            unsigned int v85 = v82 + v122;
            int v86 = v82;
            unsigned int v87 = v82 + v121;
            int v88 = v120;
            int v89 = v119;
            int v90 = a10;
            do
            {
              id v124 = a6;
              unint64_t v125 = __PAIR64__(v85, v83);
              LODWORD(v126) = v88;
              *(void *)&long long v187 = a3;
              *((void *)&v187 + 1) = __PAIR64__(v87, v84);
              LODWORD(v188) = v89;
              v133(&v131, &v124, (id *)&v187);
              ++v89;
              ++v88;
              --v90;
            }
            while (v90);
            int v82 = v86 + 1;
          }
          while (v86 + 1 != a9);
          int v81 = v118 + 1;
        }
        while (v118 + 1 != v112);
        unint64_t v80 = (unint64_t)v145[6];
        v79 = (char *)v145[7];
        id v63 = a6;
        v64 = v113;
      }
    }
    else
    {
      unint64_t v80 = (unint64_t)v79;
    }
    unint64_t v91 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v79[-v80] >> 3));
    if (v79 == (char *)v80) {
      uint64_t v92 = 0;
    }
    else {
      uint64_t v92 = v91;
    }
    std::__introsort<std::_ClassicAlgPolicy,AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::copyTextureToTexture(AGXG17FamilyTexture *,unsigned int,unsigned int,AGXG17FamilyTexture *,unsigned int,unsigned int,unsigned int,unsigned int)::{lambda(AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::CopyRange,AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::CopyRange)#1} &,AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::CopyRange*,false>(v80, (unint64_t)v79, v92, 1, v59);
    v93 = v145[6];
    v94 = v145[7];
    if (v93 == v94)
    {
      v95 = v145[6];
    }
    else
    {
      v95 = v145[6];
      while (1)
      {
        long long v96 = *(_OWORD *)v93;
        v95[2] = v93[2];
        *(_OWORD *)v95 = v96;
        v93 += 3;
        if (v93 == v94) {
          break;
        }
        uint64_t v97 = *v95;
        uint64_t v98 = v95[1];
        uint64_t v99 = v95[2];
        while (v99 + v97 == *v93 && v99 + v98 == v93[1])
        {
          v99 += v93[2];
          v95[2] = v99;
          v93 += 3;
          if (v93 == v94) {
            goto LABEL_116;
          }
        }
        v95 += 3;
        if (v93 == v94) {
          goto LABEL_118;
        }
      }
LABEL_116:
      v95 += 3;
    }
LABEL_118:
    v101 = v145[6];
    if (v95 != v145[7])
    {
      v102 = v145;
      v145[7] = v95;
      v95 = v102[7];
    }
    if (v101 != v95)
    {
      id v124 = (id)MEMORY[0x263EF8330];
      unint64_t v125 = 3221225472;
      v126 = (void (*)(uint64_t *, long long *))___ZN3AGX11BlitContextINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE20copyTextureToTextureEP19AGXG17FamilyTexturejjS7_jjjj_block_invoke_3_196;
      v127 = &unk_26516F2B0;
      id v129 = a3;
      v130 = v64;
      id v128 = v63;
      if (v101[1] <= *v101)
      {
        while (v95 != v145[6])
        {
          long long v104 = *(_OWORD *)(v95 - 3);
          uint64_t v188 = *(v95 - 1);
          long long v187 = v104;
          v126((uint64_t *)&v124, &v187);
          v95 -= 3;
        }
      }
      else
      {
        do
        {
          long long v103 = *(_OWORD *)v101;
          uint64_t v188 = v101[2];
          long long v187 = v103;
          v126((uint64_t *)&v124, &v187);
          v101 += 3;
        }
        while (v101 != v145[7]);
      }
    }
    _Block_object_dispose(&v144, 8);
    if (__p)
    {
      v151 = __p;
      operator delete(__p);
    }
    _Block_object_dispose(&v165, 8);
    if (v171)
    {
      v172 = v171;
      operator delete(v171);
    }
    _Block_object_dispose(&v183, 8);
  }
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
  impl = self->_impl;
  impl[384] = impl[383];
  long long v10 = *(_OWORD *)&a6->var0.var2;
  v11[0] = *(_OWORD *)&a6->var0.var0;
  v11[1] = v10;
  v11[2] = *(_OWORD *)&a6->var1.var1;
  AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::fillTexture((uint64_t)impl, (uint64_t)a3, a4, a5, (uint64_t *)v11, (unsigned __int8 *)a7, a8);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
  impl = self->_impl;
  impl[384] = impl[383];
  unsigned int v7 = a5;
  AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::fillBuffer((uint64_t)impl, (uint64_t)a3, a4.location, a4.length, (unsigned __int8 *)&v7, 4uLL);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v14 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13 = *a7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a11;
  [(AGXG17FamilyBlitContext *)self copyFromTexture:a3 sourceSlice:a4 sourceLevel:a5 sourceOrigin:&v14 sourceSize:&v13 toTexture:a8 destinationSlice:a9 destinationLevel:a10 destinationOrigin:&v12];
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12
{
  impl = self->_impl;
  impl[384] = impl[383];
  int64x2_t v16 = *(int64x2_t *)&a6->var0;
  unint64_t var2 = a6->var2;
  int64x2_t v14 = *(int64x2_t *)&a7->var0;
  unint64_t v15 = a7->var2;
  AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::copyTextureToBuffer(impl, (uint64_t)a8, a9, a10, a11, (uint64_t)a3, a4, a5, &v16, &v14, a12);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  impl = self->_impl;
  impl[384] = impl[383];
  int64x2_t v16 = *(int64x2_t *)&a11->var0;
  unint64_t var2 = a11->var2;
  int64x2_t v14 = *(int64x2_t *)&a7->var0;
  unint64_t v15 = a7->var2;
  AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::copyBufferToTexture((uint64_t)impl, (uint64_t)a8, a9, a10, &v16, &v14, (uint64_t)a3, a4, a5, a6, a12);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5
{
  impl = self->_impl;
  impl[384] = impl[383];
  unsigned __int8 v7 = a5;
  AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::fillBuffer((uint64_t)impl, (uint64_t)a3, a4.location, a4.length, &v7, 1uLL);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)generateMipmapsForTexture:(id)a3
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  (*(void **)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F12B70]))[85] |= 4uLL;
  impl = self->_impl;
  int v4 = impl[383];
  impl[384] = v4;
  uint64_t v5 = *((void *)a3 + 67);
  if (!*(void *)(v5 + 168))
  {
    MTLPixelFormat v6 = *(void *)(v5 + 32);
    if (v6 - 624 >= 4 && v6 - 550 >= 2)
    {
      uint64_t v7 = *(void *)(v5 + 208);
      if ((*(unsigned char *)(v7 + 60) & 3) != 0)
      {
        int v9 = *(_DWORD *)(v5 + 176);
        int v10 = *(_DWORD *)(v5 + 180);
        uint64_t v11 = *(void *)(v5 + 184);
        uint64_t v12 = *(void *)(v5 + 24);
        if (v12 == 7) {
          uint64_t v13 = 7;
        }
        else {
          uint64_t v13 = 2;
        }
        unsigned int v14 = *(_DWORD *)(v5 + 112);
        unsigned int v115 = *(_DWORD *)(v5 + 108) - 1;
        long long v144 = *(_OWORD *)(v5 + 496);
        int v142 = 1;
        uint64_t v15 = *(void *)(v5 + 160);
        uint64_t v126 = v13;
        uint64_t v127 = *(void *)(v5 + 152);
        id v143 = a3;
        uint64_t v130 = v6;
        id v128 = (uint32x2_t *)v5;
        int v129 = v9;
        int v125 = v10;
        uint64_t v124 = v11;
        if (v14 <= 1 && *(_DWORD *)(v5 + 236))
        {
          if (*(_DWORD *)*MEMORY[0x263F4B1E8])
          {
            IOGPUDeviceTraceEvent();
            uint64_t v5 = (uint64_t)v128;
            uint64_t v13 = v126;
            MTLPixelFormat v6 = v130;
          }
          if (v115)
          {
            int v16 = 0;
            uint64_t v116 = v15;
            int v122 = (void *)(v5 + 380);
            while (1)
            {
              unsigned int v17 = 0;
              int v120 = v16++;
              unsigned int v18 = *(_DWORD *)(v5 + 136) >> (*(unsigned char *)(v5 + 144) + v16);
              if (v18 <= 1) {
                unsigned int v18 = 1;
              }
              unsigned int v117 = v18;
              int v118 = v16;
              while (1)
              {
                uint64_t v19 = *v122 & 0xFF00;
                if ((*v122 & 0x10000) != 0 || v19 == 1024) {
                  break;
                }
                if (v17) {
                  goto LABEL_14;
                }
LABEL_28:
                BOOL v21 = (uint64_t *)(v5 + 40);
                int v22 = (uint64_t *)(v5 + 56);
                int v110 = v9;
                uint64_t v108 = v15;
                int v23 = v9;
                uint64_t v24 = v5;
                uint64_t v25 = v13;
                AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::createTextureViewForBlit((uint64_t)v137, v5, v13, v6, *(void *)(v5 + 40), *(void *)(v5 + 56), *(_DWORD *)(v5 + 308), v17, v120, 0, 0, v127, v108, 0, v110, v10, v11, 0, 0);
                int v111 = v23;
                uint64_t v15 = v116;
                int v16 = v118;
                AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::createTextureViewForBlit((uint64_t)v132, v24, v25, v130, *v21, *v22, *(_DWORD *)(v24 + 308), v17, v118, 0, 0, v127, v116, 0, v111, v10, v11, 0, 0);
                unsigned int v26 = 0;
                char v27 = v142;
                int v10 = v125;
                int v28 = (int *)MEMORY[0x263F4B188];
                do
                {
                  if ((v27 & 2) != 0)
                  {
                    if (*((_WORD *)impl + 3308))
                    {
                      int v30 = (unint64_t *)*((void *)impl + 97);
                      if ((unint64_t)v30 + 4 > *((void *)impl + 96))
                      {
                        int v32 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 6, 22, 0);
                        int v31 = (unint64_t *)*((void *)impl + 97);
                        if (v32)
                        {
                          if ((unint64_t)v31 + 4 > *((void *)impl + 96)) {
                            abort();
                          }
                          *((void *)impl + 98) = (char *)v31 + 4;
                          *int v30 = __ROR8__((char *)v31 + *((void *)impl + 99), 32) & 0xFFFFFFFF0000FFFFLL | 0x20000000;
                          int v31 = (unint64_t *)*((void *)impl + 97);
                        }
                      }
                      else
                      {
                        *((void *)impl + 98) = (char *)v30 + 4;
                        int v31 = v30;
                      }
                      *(_DWORD *)int v31 = 1610613088;
                      *((void *)impl + 97) = (char *)v31 + 4;
                      *((_WORD *)impl + 2152) = 0;
                      *((_WORD *)impl + 3308) = 0;
                    }
                    int v29 = 1;
                  }
                  else
                  {
                    int v29 = 2;
                  }
                  AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::blitCDM((uint64_t)impl, (uint64_t)&v143, (uint64_t)v132, 0, (uint64_t *)&v143, v137, 0, &v142, v26++, 0, 0, 0, 0, 0, v29);
                }
                while (v117 != v26);
                v132[0] = &unk_26F853CB0;
                std::unique_ptr<AGX::HAL200::CompressionMetadata>::~unique_ptr[abi:nn180100](v136);
                if (v133 && !v135)
                {
                  int v33 = (os_unfair_lock_s *)(v134 + 56);
                  os_unfair_lock_lock((os_unfair_lock_t)(v134 + 56));
                  uint64_t v34 = v134;
                  uint64_t v35 = v133;
                  uint64_t v36 = *(void *)(v134 + 48);
                  uint64_t v37 = 32 * v133;
                  *(_DWORD *)(*(void *)(*(void *)(*(void *)(v134 + 40) + 8) + *v28 + 24) + v37) = v36;
                  uint64_t v38 = v36;
                  atomic_compare_exchange_strong((atomic_ullong *volatile)(v34 + 48), (unint64_t *)&v38, (v36 & 0xFFFFFFFF00000000 | v35) + 0x100000000);
                  if (v38 != v36)
                  {
                    uint64_t v39 = v38;
                    do
                    {
                      *(_DWORD *)(*(void *)(*(void *)(*(void *)(v34 + 40) + 8) + *v28 + 24) + v37) = v38;
                      atomic_compare_exchange_strong((atomic_ullong *volatile)(v34 + 48), (unint64_t *)&v39, (v38 & 0xFFFFFFFF00000000 | v35) + 0x100000000);
                      BOOL v40 = v39 == v38;
                      uint64_t v38 = v39;
                    }
                    while (!v40);
                  }
                  os_unfair_lock_unlock(v33);
                }
                v137[0] = (uint32x2_t)&unk_26F853CB0;
                std::unique_ptr<AGX::HAL200::CompressionMetadata>::~unique_ptr[abi:nn180100](v141);
                if (v138 && !v140)
                {
                  unsigned int v41 = (os_unfair_lock_s *)(v139 + 56);
                  os_unfair_lock_lock((os_unfair_lock_t)(v139 + 56));
                  uint64_t v42 = v139;
                  uint64_t v43 = v138;
                  uint64_t v44 = *(void *)(v139 + 48);
                  uint64_t v45 = 32 * v138;
                  *(_DWORD *)(*(void *)(*(void *)(*(void *)(v139 + 40) + 8) + *v28 + 24) + v45) = v44;
                  uint64_t v46 = v44;
                  atomic_compare_exchange_strong((atomic_ullong *volatile)(v42 + 48), (unint64_t *)&v46, (v44 & 0xFFFFFFFF00000000 | v43) + 0x100000000);
                  if (v46 != v44)
                  {
                    uint64_t v47 = v46;
                    do
                    {
                      *(_DWORD *)(*(void *)(*(void *)(*(void *)(v42 + 40) + 8) + *v28 + 24) + v45) = v46;
                      atomic_compare_exchange_strong((atomic_ullong *volatile)(v42 + 48), (unint64_t *)&v47, (v46 & 0xFFFFFFFF00000000 | v43) + 0x100000000);
                      BOOL v40 = v47 == v46;
                      uint64_t v46 = v47;
                    }
                    while (!v40);
                  }
                  os_unfair_lock_unlock(v41);
                }
                ++v17;
                MTLPixelFormat v6 = v130;
                uint64_t v13 = v126;
                uint64_t v5 = (uint64_t)v128;
                uint64_t v11 = v124;
                int v9 = v129;
              }
              if (v19 == 1024) {
                unsigned int v20 = 6 * *(_DWORD *)(v5 + 376);
              }
              else {
                unsigned int v20 = *(_DWORD *)(v5 + 376);
              }
              if (v17 < v20) {
                goto LABEL_28;
              }
LABEL_14:
              if (v16 == v115) {
                goto LABEL_145;
              }
            }
          }
          goto LABEL_145;
        }
        if (v12 == 7)
        {
          if (*(_DWORD *)*MEMORY[0x263F4B1E8])
          {
            IOGPUDeviceTraceEvent();
            uint64_t v5 = (uint64_t)v128;
            uint64_t v13 = v126;
            MTLPixelFormat v6 = v130;
          }
          uint64_t v48 = v127;
          if (v115)
          {
            int v49 = 0;
            int v121 = (void *)(v5 + 380);
            do
            {
              unsigned int v50 = 0;
              int v123 = v49 + 1;
              if (*(_DWORD *)(v5 + 136) >> (*(_DWORD *)(v5 + 144) + v49 + 1) <= 1u) {
                int v51 = 1;
              }
              else {
                int v51 = *(_DWORD *)(v5 + 136) >> (*(_DWORD *)(v5 + 144) + v49 + 1);
              }
              int v119 = v49;
              while (1)
              {
                uint64_t v52 = *v121 & 0xFF00;
                if ((*v121 & 0x10000) != 0 || v52 == 1024) {
                  break;
                }
                if (v50) {
                  goto LABEL_60;
                }
LABEL_75:
                int v54 = (uint64_t *)(v5 + 40);
                v55 = (uint64_t *)(v5 + 56);
                int v112 = v9;
                uint64_t v107 = v48;
                uint64_t v56 = v5;
                uint64_t v57 = v13;
                unsigned int v58 = v50;
                AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::createTextureViewForBlit((uint64_t)v137, v5, v13, v6, *(void *)(v5 + 40), *(void *)(v5 + 56), *(_DWORD *)(v5 + 308), v50, v49, 0, 0, v107, v15, 0, v112, v10, v11, 0, 0);
                uint64_t v113 = v11;
                uint64_t v109 = v15;
                uint64_t v59 = v15;
                unsigned int v60 = v58;
                AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::createTextureViewForBlit((uint64_t)v132, v56, v57, v130, *v54, *v55, *(_DWORD *)(v56 + 308), v58, v123, 0, 0, v127, v109, 0, v129, v10, v113, 0, 0);
                uint64_t v48 = v127;
                uint64_t v61 = 0;
                int v9 = v129;
                v62 = (int *)MEMORY[0x263F4B188];
                do
                {
                  int v131 = 1;
                  AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::renderTexture((uint64_t)impl, (uint64_t)&v143, (uint64_t)v132, (uint64_t)&v143, (uint64_t)v137, (uint64_t)&v131, v61, 0, 0);
                  uint64_t v61 = (v61 + 1);
                }
                while (v51 != v61);
                v132[0] = &unk_26F853CB0;
                std::unique_ptr<AGX::HAL200::CompressionMetadata>::~unique_ptr[abi:nn180100](v136);
                if (v133 && !v135)
                {
                  id v63 = (os_unfair_lock_s *)(v134 + 56);
                  os_unfair_lock_lock((os_unfair_lock_t)(v134 + 56));
                  uint64_t v64 = v134;
                  uint64_t v65 = v133;
                  uint64_t v66 = *(void *)(v134 + 48);
                  uint64_t v67 = 32 * v133;
                  *(_DWORD *)(*(void *)(*(void *)(*(void *)(v134 + 40) + 8) + *v62 + 24) + v67) = v66;
                  uint64_t v68 = v66;
                  atomic_compare_exchange_strong((atomic_ullong *volatile)(v64 + 48), (unint64_t *)&v68, (v66 & 0xFFFFFFFF00000000 | v65) + 0x100000000);
                  if (v68 != v66)
                  {
                    uint64_t v69 = v68;
                    do
                    {
                      *(_DWORD *)(*(void *)(*(void *)(*(void *)(v64 + 40) + 8) + *v62 + 24) + v67) = v68;
                      atomic_compare_exchange_strong((atomic_ullong *volatile)(v64 + 48), (unint64_t *)&v69, (v68 & 0xFFFFFFFF00000000 | v65) + 0x100000000);
                      BOOL v40 = v69 == v68;
                      uint64_t v68 = v69;
                    }
                    while (!v40);
                  }
                  os_unfair_lock_unlock(v63);
                }
                v137[0] = (uint32x2_t)&unk_26F853CB0;
                std::unique_ptr<AGX::HAL200::CompressionMetadata>::~unique_ptr[abi:nn180100](v141);
                if (v138 && !v140)
                {
                  int v70 = (os_unfair_lock_s *)(v139 + 56);
                  os_unfair_lock_lock((os_unfair_lock_t)(v139 + 56));
                  uint64_t v71 = v139;
                  uint64_t v72 = v138;
                  uint64_t v73 = *(void *)(v139 + 48);
                  uint64_t v74 = 32 * v138;
                  *(_DWORD *)(*(void *)(*(void *)(*(void *)(v139 + 40) + 8) + *v62 + 24) + v74) = v73;
                  uint64_t v75 = v73;
                  atomic_compare_exchange_strong((atomic_ullong *volatile)(v71 + 48), (unint64_t *)&v75, (v73 & 0xFFFFFFFF00000000 | v72) + 0x100000000);
                  if (v75 != v73)
                  {
                    uint64_t v76 = v75;
                    do
                    {
                      *(_DWORD *)(*(void *)(*(void *)(*(void *)(v71 + 40) + 8) + *v62 + 24) + v74) = v75;
                      atomic_compare_exchange_strong((atomic_ullong *volatile)(v71 + 48), (unint64_t *)&v76, (v75 & 0xFFFFFFFF00000000 | v72) + 0x100000000);
                      BOOL v40 = v76 == v75;
                      uint64_t v75 = v76;
                    }
                    while (!v40);
                  }
                  os_unfair_lock_unlock(v70);
                }
                unsigned int v50 = v60 + 1;
                MTLPixelFormat v6 = v130;
                uint64_t v13 = v126;
                uint64_t v5 = (uint64_t)v128;
                int v10 = v125;
                int v49 = v119;
                uint64_t v15 = v59;
                uint64_t v11 = v124;
              }
              if (v52 == 1024) {
                unsigned int v53 = 6 * *(_DWORD *)(v5 + 376);
              }
              else {
                unsigned int v53 = *(_DWORD *)(v5 + 376);
              }
              if (v50 < v53) {
                goto LABEL_75;
              }
LABEL_60:
              int v49 = v123;
            }
            while (v123 != v115);
          }
LABEL_145:
          impl = self->_impl;
          int v4 = impl[383];
          goto LABEL_146;
        }
        uint64_t v77 = *(void *)(v5 + 380) & 0xFF00;
        if ((*(void *)(v5 + 380) & 0x10000) != 0 || v77 == 1024)
        {
          unsigned int v78 = v77 == 1024 ? 6 * *(_DWORD *)(v5 + 376) : *(_DWORD *)(v5 + 376);
          if (v78 > 1) {
            uint64_t v13 = 3;
          }
        }
        if (!*(void *)(v5 + 488))
        {
          uint64_t v82 = v15;
          unsigned int v83 = 5;
          uint64_t v84 = v127;
LABEL_115:
          int v86 = (uint32x2_t *)v5;
          AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::createTextureViewForBlit((uint64_t)v137, v5, v13, v6, *(void *)(v5 + 40), *(void *)(v5 + 56), *(_DWORD *)(v5 + 308), 0, 0, 0, 0, v84, v82, 0, v9, v10, v11, 1, 0);
          unsigned int v87 = v115;
          if (v115)
          {
            int v88 = v86;
            int v89 = 0;
            while (1)
            {
              int v90 = v89 + 1;
              uint32x2_t v91 = vmax_u32(vshl_u32(v88[16], (uint32x2_t)vneg_s32(vdup_n_s32(v89 + 1 + v88[18].i32[0]))), (uint32x2_t)0x100000001);
              unsigned int v92 = v91.i32[0] <= (unsigned __int32)v91.i32[1] ? v91.i32[1] : v91.i32[0];
              if (v92 <= 0x20) {
                break;
              }
              unsigned int v93 = __clz(__rbit32(v91.u32[0]));
              unsigned int v94 = __clz(__rbit32(v91.u32[1]));
              if ((unsigned __int32)v91.i32[0] >> v93 == 1) {
                unsigned int v95 = v83;
              }
              else {
                unsigned int v95 = v93;
              }
              if ((unsigned __int32)v91.i32[1] >> v94 == 1) {
                unsigned int v96 = v83;
              }
              else {
                unsigned int v96 = v94;
              }
              if (v96 >= v95) {
                unsigned int v97 = v95;
              }
              else {
                unsigned int v97 = v96;
              }
              if (v83 < v97) {
                unsigned int v97 = v83;
              }
              if (v87 - v89 - 1 >= v97) {
                int v98 = v97;
              }
              else {
                int v98 = v87 - v89 - 1;
              }
              AGX::BlitDispatchContextGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::renderMRCDownsample((uint64_t)impl);
              int v89 = v90 + v98;
              unsigned int v87 = v115;
              int v88 = v128;
              if (v90 + v98 >= v115) {
                goto LABEL_138;
              }
            }
            AGX::BlitDispatchContextGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::renderMRCDownsample((uint64_t)impl);
          }
LABEL_138:
          v137[0] = (uint32x2_t)&unk_26F853CB0;
          std::unique_ptr<AGX::HAL200::CompressionMetadata>::~unique_ptr[abi:nn180100](v141);
          if (v138 && !v140)
          {
            uint64_t v99 = (os_unfair_lock_s *)(v139 + 56);
            os_unfair_lock_lock((os_unfair_lock_t)(v139 + 56));
            uint64_t v100 = v139;
            uint64_t v101 = v138;
            uint64_t v102 = *(void *)(v139 + 48);
            long long v103 = (int *)MEMORY[0x263F4B188];
            uint64_t v104 = 32 * v138;
            *(_DWORD *)(*(void *)(*(void *)(*(void *)(v139 + 40) + 8) + (int)*MEMORY[0x263F4B188] + 24) + v104) = v102;
            uint64_t v105 = v102;
            atomic_compare_exchange_strong((atomic_ullong *volatile)(v100 + 48), (unint64_t *)&v105, (v102 & 0xFFFFFFFF00000000 | v101) + 0x100000000);
            if (v105 != v102)
            {
              uint64_t v106 = v105;
              do
              {
                *(_DWORD *)(*(void *)(*(void *)(*(void *)(v100 + 40) + 8) + *v103 + 24) + v104) = v105;
                atomic_compare_exchange_strong((atomic_ullong *volatile)(v100 + 48), (unint64_t *)&v106, (v105 & 0xFFFFFFFF00000000 | v101) + 0x100000000);
                BOOL v40 = v106 == v105;
                uint64_t v105 = v106;
              }
              while (!v40);
            }
            os_unfair_lock_unlock(v99);
          }
          goto LABEL_145;
        }
        if (*(void *)(v5 + 380) == 3)
        {
          memset(v137, 0, 72);
          uint64_t v79 = v13;
          InterchangeTiledMemory::getPlaneInfo((InterchangeTiledMemory *)v137, 0, v6, *(unsigned __int8 *)(v7 + 49));
          uint64_t v5 = (uint64_t)v128;
          uint64_t v13 = v79;
          int v9 = v129;
          MTLPixelFormat v6 = v130;
          unsigned int v80 = v137[0].u8[0];
          unsigned int v81 = v137[0].u8[1];
        }
        else
        {
          unsigned int v81 = 16;
          unsigned int v80 = 16;
        }
        if (v14 != 2)
        {
          if (v14 != 4)
          {
            if (v14 != 8)
            {
              uint64_t v82 = v15;
              uint64_t v84 = v127;
              goto LABEL_110;
            }
            v81 >>= 1;
          }
          v80 >>= 1;
        }
        uint64_t v84 = v127;
        uint64_t v82 = v15;
        v81 >>= 1;
LABEL_110:
        if (v80 > v81) {
          unsigned int v81 = v80;
        }
        unsigned int v85 = __clz(v81 - 1) - 27;
        if (v81 >= 2) {
          unsigned int v83 = v85;
        }
        else {
          unsigned int v83 = 5;
        }
        goto LABEL_115;
      }
    }
  }
LABEL_146:
  impl[385] = v4;
}

- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
}

- (void)optimizeContentsForCPUAccess:(id)a3
{
  uint64_t v3 = *((void *)a3 + 67);
  if (*(void *)(v3 + 48) || !*(void *)(v3 + 488)) {
    return;
  }
  impl = self->_impl;
  uint64_t v6 = *(void *)(v3 + 380) & 0xFF00;
  if ((*(void *)(v3 + 380) & 0x10000) != 0 || v6 == 1024)
  {
    if (v6 == 1024) {
      int v7 = 6 * *(_DWORD *)(v3 + 376);
    }
    else {
      int v7 = *(_DWORD *)(v3 + 376);
    }
    if (!v7) {
      return;
    }
  }
  else
  {
    int v7 = 1;
  }
  int v8 = *(_DWORD *)(v3 + 108);
  if (v8)
  {
    for (unsigned int i = 0; i != v7; ++i)
    {
      for (unsigned int j = 0; j != v8; ++j)
      {
        uint64_t v11 = *(void *)(v3 + 488);
        if (v11 && *(_DWORD *)(v11 + 1080) > j && !*(unsigned char *)(v3 + 57)) {
          AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::optimizeContentsForUncompressedAccess((uint64_t)impl, (uint64_t)a3, i, j);
        }
      }
    }
  }
}

- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  unsigned int v5 = a5;
  unsigned int v6 = a4;
  impl = self->_impl;
  int v9 = (uint32x2_t *)*((void *)a3 + 67);
  if (!*(void *)&v9[6] || (v9[5].i8[0] & 2) != 0)
  {
    uint32x2_t v10 = v9[61];
    if (v10)
    {
      if (*(_DWORD *)(*(void *)&v10 + 1080) > a5 && !v9[7].i8[1])
      {
        unsigned int v11 = (unsigned __int32)v9[17].i32[0] >> (v9[18].i8[0] + a5);
        if (v11 <= 1) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = v11;
        }
        int v13 = *(_DWORD *)(*(void *)&v9[26] + 24);
        if (v13)
        {
          unsigned int v14 = 0;
          uint32x2_t v15 = vmax_u32(vshl_u32(v9[16], (uint32x2_t)vneg_s32(vdup_n_s32(v9[18].i32[0] + (int)a5))), (uint32x2_t)0x100000001);
          v16.i64[0] = v15.u32[0];
          v16.i64[1] = v15.u32[1];
          int64x2_t v17 = v16;
          do
          {
            int64x2_t v22 = 0uLL;
            uint64_t v23 = 0;
            uint64_t v21 = 0;
            int64x2_t v20 = 0uLL;
            int64x2_t v18 = v17;
            uint64_t v19 = v12;
            AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::copyTextureToTextureImpl(impl, (uint64_t)a3, v14, v6, v5, &v22, (uint64_t)a3, v14, v6, v5, &v20, &v18);
            ++v14;
          }
          while (v13 != v14);
        }
      }
    }
  }
}

- (void)optimizeContentsForGPUAccess:(id)a3
{
  impl = self->_impl;
  uint64_t v5 = *((void *)a3 + 67);
  if ((!*(void *)(v5 + 48) || (*(unsigned char *)(v5 + 40) & 2) != 0) && *(void *)(v5 + 488))
  {
    uint64_t v6 = *(void *)(v5 + 380) & 0xFF00;
    if ((*(void *)(v5 + 380) & 0x10000) != 0 || v6 == 1024)
    {
      if (v6 == 1024) {
        int v7 = 6 * *(_DWORD *)(v5 + 376);
      }
      else {
        int v7 = *(_DWORD *)(v5 + 376);
      }
      int v18 = v7;
      if (!v7) {
        return;
      }
    }
    else
    {
      int v18 = 1;
    }
    int v8 = *(_DWORD *)(v5 + 108);
    if (v8)
    {
      unsigned int v9 = 0;
      int v19 = *(_DWORD *)(v5 + 108);
      do
      {
        unsigned int v10 = 0;
        do
        {
          uint64_t v11 = *(void *)(v5 + 488);
          if (v11 && *(_DWORD *)(v11 + 1080) > v10 && !*(unsigned char *)(v5 + 57))
          {
            unsigned int v12 = *(_DWORD *)(v5 + 136) >> (*(unsigned char *)(v5 + 144) + v10);
            if (v12 <= 1) {
              uint64_t v13 = 1;
            }
            else {
              uint64_t v13 = v12;
            }
            int v14 = *(_DWORD *)(*(void *)(*((void *)a3 + 67) + 208) + 24);
            if (v14)
            {
              unsigned int v15 = 0;
              uint32x2_t v16 = vmax_u32(vshl_u32(*(uint32x2_t *)(v5 + 128), (uint32x2_t)vneg_s32(vdup_n_s32(*(_DWORD *)(v5 + 144) + v10))), (uint32x2_t)0x100000001);
              v17.i64[0] = v16.u32[0];
              v17.i64[1] = v16.u32[1];
              int64x2_t v20 = v17;
              do
              {
                int64x2_t v25 = 0uLL;
                uint64_t v26 = 0;
                uint64_t v24 = 0;
                int64x2_t v23 = 0uLL;
                int64x2_t v21 = v20;
                uint64_t v22 = v13;
                AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::copyTextureToTextureImpl(impl, (uint64_t)a3, v15, v9, v10, &v25, (uint64_t)a3, v15, v9, v10, &v23, &v21);
                ++v15;
              }
              while (v14 != v15);
            }
            int v8 = v19;
          }
          ++v10;
        }
        while (v10 != v8);
        ++v9;
      }
      while (v9 != v18);
    }
  }
}

- (void)invalidateCompressedTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
}

- (void)invalidateCompressedTexture:(id)a3
{
  uint64_t v3 = *((void *)a3 + 67);
  if (!*(void *)(v3 + 488)) {
    return;
  }
  uint64_t v5 = *(void *)(v3 + 380) & 0xFF00;
  if ((*(void *)(v3 + 380) & 0x10000) != 0 || v5 == 1024)
  {
    if (v5 == 1024) {
      int v6 = 6 * *(_DWORD *)(v3 + 376);
    }
    else {
      int v6 = *(_DWORD *)(v3 + 376);
    }
    if (!v6) {
      return;
    }
  }
  else
  {
    int v6 = 1;
  }
  int v7 = *(_DWORD *)(v3 + 108);
  if (v7)
  {
    unsigned int v8 = 0;
    impl = self->_impl;
    do
    {
      for (unsigned int i = 0; i != v7; ++i)
      {
        uint64_t v11 = *(void *)(v3 + 488);
        if (v11)
        {
          if (*(_DWORD *)(v11 + 1080) > i) {
            AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::invalidateCompressedTexture((uint64_t)impl, (uint64_t)a3, v8, i);
          }
        }
      }
      ++v8;
    }
    while (v8 != v6);
  }
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11
{
  impl = self->_impl;
  impl[384] = impl[383];
  int64x2_t v15 = *(int64x2_t *)&a6->var0;
  unint64_t var2 = a6->var2;
  int64x2_t v13 = *(int64x2_t *)&a7->var0;
  unint64_t v14 = a7->var2;
  AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::copyTextureToBuffer(impl, (uint64_t)a8, a9, a10, a11, (uint64_t)a3, a4, a5, &v15, &v13, 0);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7
{
  impl = self->_impl;
  impl[384] = impl[383];
  AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::copyBufferToBuffer((uint64_t)impl, (uint64_t)a5, a6, (uint64_t)a3, a4, a7);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  impl = self->_impl;
  impl[384] = impl[383];
  int64x2_t v15 = *(int64x2_t *)&a11->var0;
  unint64_t var2 = a11->var2;
  int64x2_t v13 = *(int64x2_t *)&a7->var0;
  unint64_t v14 = a7->var2;
  AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::copyBufferToTexture((uint64_t)impl, (uint64_t)a8, a9, a10, &v15, &v13, (uint64_t)a3, a4, a5, a6, 0);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  impl = self->_impl;
  int v12 = impl[383];
  impl[384] = v12;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v31 = *a11;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v30 = *a6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v29 = *a7;
  uint64_t v13 = *((void *)a3 + 67);
  uint64_t v14 = *((void *)a8 + 67);
  uint64_t v15 = *(void *)(v13 + 32);
  uint64_t v16 = *(void *)(v14 + 32);
  unsigned int v18 = v15 == 260 && v16 == 261;
  unsigned int v20 = v16 == 260 && v15 == 261;
  unsigned int v21 = *(_DWORD *)(*(void *)(v13 + 208) + 24);
  unsigned int v22 = *(_DWORD *)(*(void *)(v14 + 208) + 24);
  if (v21 >= v22) {
    unsigned int v23 = v22;
  }
  else {
    unsigned int v23 = v21;
  }
  if (v23)
  {
    unsigned int v25 = a5;
    unsigned int v26 = a4;
    do
    {
      int64x2_t v36 = *(int64x2_t *)&v31.var0;
      unint64_t var2 = v31.var2;
      int64x2_t v34 = *(int64x2_t *)&v30.var0;
      unint64_t v35 = v30.var2;
      int64x2_t v32 = *(int64x2_t *)&v29.var0;
      unint64_t v33 = v29.var2;
      AGX::BlitContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::copyTextureToTextureImpl(impl, (uint64_t)a8, v20++, a9, a10, &v36, (uint64_t)a3, v18++, v26, v25, &v34, &v32);
      --v23;
    }
    while (v23);
    impl = self->_impl;
    int v12 = impl[383];
  }
  impl[385] = v12;
}

- (void)endEncoding
{
  if (self->_impl)
  {
    uint64_t v3 = (int)*MEMORY[0x263F12B70];
    uint64_t v4 = [*(id *)((char *)&self->super.super.super.super.super.isa + v3) device];
    impl = self->_impl;
    unint64_t v6 = impl[248];
    unint64_t v7 = impl[249];
    atomic_fetch_or((atomic_ullong *volatile)(v4 + 816), v6);
    atomic_fetch_or((atomic_ullong *volatile)(v4 + 824), v7);
    if ([*(id *)((char *)&self->super.super.super.super.super.isa + v3) disableDeferredEndEncoding]) {
      [(AGXG17FamilyBlitContext *)self deferredEndEncoding];
    }
    else {
      [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setPreviousBlitCommandEncoder:self];
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)AGXG17FamilyBlitContext;
  [(IOGPUMetalCommandEncoder *)&v8 endEncoding];
}

- (void)deferredEndEncoding
{
  impl = self->_impl;
  if (impl)
  {
    AGX::BlitDispatchContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::commit((uint64_t)impl, v2, v3, v4);
    AGX::BlitDispatchContextGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::~BlitDispatchContextGen2((void *)self->_impl);
    free(self->_impl);
    self->_impl = 0;
  }
}

- (void)dealloc
{
  impl = self->_impl;
  if (impl)
  {
    AGX::BlitDispatchContextGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::~BlitDispatchContextGen2(impl);
    free(self->_impl);
    self->_impl = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXG17FamilyBlitContext;
  [(_MTLCommandEncoder *)&v4 dealloc];
}

- (id)reInitWithCommandBuffer:(id)a3
{
  uint64_t v5 = (objc_class *)a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F12B70]) = v5;
  [(objc_class *)v5 setCurrentCommandEncoder:self];
  [a3 setPreviousBlitCommandEncoder:0];
  return self;
}

- (AGXG17FamilyBlitContext)initWithCommandBuffer:(id)a3 descriptor:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AGXG17FamilyBlitContext;
  id v6 = -[IOGPUMetalCommandEncoder initWithCommandBuffer:](&v11, sel_initWithCommandBuffer_);
  if (v6)
  {
    unint64_t v7 = malloc_type_calloc(0x1A50uLL, 1uLL, 0x699AC894uLL);
    *((void *)v6 + 11) = v7;
    if (v7)
    {
      v10[2] = objc_msgSend(a3, "commandBufferStorage", objc_msgSend(a3, "device"), a3);
      v10[3] = v6;
      v10[4] = [a3 globalTraceObjectID];
      v10[5] = [v6 globalTraceObjectID];
      objc_super v8 = (void *)AGX::BlitDispatchContextGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::BlitDispatchContextGen2(*((void *)v6 + 11), v10, (MTLBlitPassDescriptor *)a4, 0);
      *objc_super v8 = &unk_26F851FA0;
      v8[840] = v8[183];
      v8[841] = 0;
    }
    else
    {
      [v6 endEncoding];

      return 0;
    }
  }
  return (AGXG17FamilyBlitContext *)v6;
}

@end