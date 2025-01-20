@interface AGXG17FamilyComputeContext
- (AGXG17FamilyComputeContext)initWithCommandBuffer:(id)a3 config:(EncoderComputeServiceConfig *)a4;
- (BOOL)commandBatchIdRangeMin:(unsigned int *)a3 max:(unsigned int *)a4;
- (BOOL)encodeEndDoWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6;
- (BOOL)encodeEndIf;
- (BOOL)encodeEndWhile;
- (BOOL)parallelExecution;
- (BOOL)setMTLCounterSampleLocationWithBuffer:(id)a3 startIndex:(unsigned int)a4 endIndex:(unsigned int)a5;
- (id)newKernelDebugInfo;
- (id)reInitWithCommandBuffer:(id)a3;
- (unint64_t)dispatchType;
- (unint64_t)getDriverUniqueID;
- (unint64_t)nextVirtualSubstream;
- (unsigned)commandBatchIdOffset;
- (void)beginVirtualSubstream;
- (void)dealloc;
- (void)deferredEndEncoding;
- (void)destroyImpl;
- (void)dispatchFenceOnly;
- (void)dispatchFlushInvalidate;
- (void)dispatchFlushOnly;
- (void)dispatchInvalidateOnly;
- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5;
- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)dispatchWaitFlush;
- (void)enableNullBufferBinds:(BOOL)a3;
- (void)encodeStartDoWhile;
- (void)encodeStartElse;
- (void)encodeStartIf:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6;
- (void)encodeStartWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6;
- (void)endEncoding;
- (void)endVirtualSubstream;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5;
- (void)insertCompressedTextureReinterpretationFlush;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4;
- (void)memoryBarrierWithScope:(unint64_t)a3;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setComputePipelineState:(id)a3;
- (void)setFunctionTable:(id)a3 atIndex:(unint64_t)a4;
- (void)setFunctionTables:(const void *)a3 withRange:(_NSRange)a4;
- (void)setImageBlockWidth:(unint64_t)a3 height:(unint64_t)a4;
- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4;
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setStageInRegion:(id *)a3;
- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)setSubstream:(unsigned int)a3;
- (void)setTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setThreadgroupDistributionMode:(int64_t)a3;
- (void)setThreadgroupDistributionModeWithClusterGroupIndex:(unsigned int)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)signalProgress:(unsigned int)a3;
- (void)updateFence:(id)a3;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)waitForFence:(id)a3;
- (void)waitForProgress:(unsigned int)a3;
- (void)waitForVirtualSubstream:(unint64_t)a3;
@end

@implementation AGXG17FamilyComputeContext

- (void)waitForVirtualSubstream:(unint64_t)a3
{
  impl = self->_impl;
  v4 = impl + 4172;
  unsigned int v5 = impl[4334];
  uint64_t v6 = a3 - v5;
  if (a3 >= v5)
  {
    if (*(_DWORD *)(*((void *)impl + 2164) - 32) <= (*(_DWORD *)(*((void *)impl + 2163)
                                                                                  + (v6 << 6)
                                                                                  + 32)
                                                                      + *(_DWORD *)(*((void *)impl + 2163)
                                                                                  + (v6 << 6)
                                                                                  + 28)))
      int v7 = *(_DWORD *)(*((void *)impl + 2163) + (v6 << 6) + 32)
         + *(_DWORD *)(*((void *)impl + 2163) + (v6 << 6) + 28);
    else {
      int v7 = *(_DWORD *)(*((void *)impl + 2164) - 32);
    }
    if ((v7 + 1) > impl[4333])
    {
      int v8 = impl[4173];
      BOOL v9 = *v4 != 0;
      int v32 = 1;
      agxaReserveCDMTokenSpace<AGX::HAL200::Encoders,AGX::HAL200::DataBufferAllocator>(33, (uint64_t)(impl + 4), 24, 0, v9, v8, &v32);
      ++impl[4333];
    }
    int v10 = impl[4173];
    BOOL v11 = *v4 != 0;
    int v31 = 1;
    agxaReserveCDMTokenSpace<AGX::HAL200::Encoders,AGX::HAL200::DataBufferAllocator>(33, (uint64_t)(impl + 4), 4, 0, v11, v10, &v31);
    if (*(void *)(*((void *)impl + 187) + 520))
    {
      uint64_t v12 = *((void *)impl + 2164);
      *(_DWORD *)(v12 - 32) = v7;
      v14 = *(char **)(v12 - 16);
      unint64_t v13 = *(void *)(v12 - 8);
      if ((unint64_t)v14 >= v13)
      {
        v16 = *(char **)(v12 - 24);
        uint64_t v17 = (v14 - v16) >> 2;
        unint64_t v18 = v17 + 1;
        if ((unint64_t)(v17 + 1) >> 62) {
          abort();
        }
        uint64_t v19 = v13 - (void)v16;
        if (v19 >> 1 > v18) {
          unint64_t v18 = v19 >> 1;
        }
        if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v20 = v18;
        }
        if (v20)
        {
          if (v20 >> 62) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v21 = operator new(4 * v20);
        }
        else
        {
          v21 = 0;
        }
        v22 = &v21[4 * v17];
        v23 = &v21[4 * v20];
        _DWORD *v22 = v6;
        v15 = v22 + 1;
        if (v14 != v16)
        {
          unint64_t v24 = v14 - v16 - 4;
          if (v24 < 0x2C) {
            goto LABEL_38;
          }
          if ((unint64_t)(v16 - v21) < 0x20) {
            goto LABEL_38;
          }
          uint64_t v25 = (v24 >> 2) + 1;
          v26 = &v21[4 * v17 - 16];
          v27 = v14 - 16;
          uint64_t v28 = v25 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v29 = *(_OWORD *)v27;
            *(v26 - 1) = *((_OWORD *)v27 - 1);
            _OWORD *v26 = v29;
            v26 -= 2;
            v27 -= 32;
            v28 -= 8;
          }
          while (v28);
          v22 -= v25 & 0x7FFFFFFFFFFFFFF8;
          v14 -= 4 * (v25 & 0x7FFFFFFFFFFFFFF8);
          if (v25 != (v25 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_38:
            do
            {
              int v30 = *((_DWORD *)v14 - 1);
              v14 -= 4;
              *--v22 = v30;
            }
            while (v14 != v16);
          }
        }
        *(void *)(v12 - 24) = v22;
        *(void *)(v12 - 16) = v15;
        *(void *)(v12 - 8) = v23;
        if (v16) {
          operator delete(v16);
        }
      }
      else
      {
        *(_DWORD *)v14 = v6;
        v15 = v14 + 4;
      }
      *(void *)(v12 - 16) = v15;
    }
    else
    {
      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::restartComputePass((uint64_t)impl, 22);
    }
  }
}

- (void)endVirtualSubstream
{
}

- (unint64_t)nextVirtualSubstream
{
  impl = self->_impl;
  if (*(void *)(*((void *)impl + 187) + 520))
  {
    long long v8 = xmmword_242EA7370;
    long long v9 = xmmword_242EA7F80;
    int v10 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    __p = 0;
    unint64_t v3 = *((void *)impl + 2164);
    if (v3 >= *((void *)impl + 2165))
    {
      unsigned int v5 = std::vector<AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::VirtualSubstream,std::allocator<AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::VirtualSubstream>>::__push_back_slow_path<AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::VirtualSubstream>((void **)impl + 2163, (uint64_t)&v8);
      uint64_t v6 = __p;
      *((void *)impl + 2164) = v5;
      if (v6) {
        operator delete(v6);
      }
    }
    else
    {
      long long v4 = v9;
      *(_OWORD *)unint64_t v3 = v8;
      *(_OWORD *)(v3 + 16) = v4;
      *(_DWORD *)(v3 + 32) = v10;
      *(void *)(v3 + 48) = 0;
      *(void *)(v3 + 56) = 0;
      *(void *)(v3 + 40) = 0;
      *((void *)impl + 2164) = v3 + 64;
    }
  }
  else
  {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::restartComputePass((uint64_t)self->_impl, 22);
  }
  return *((_DWORD *)impl + 4334) + ((*((void *)impl + 2164) - *((void *)impl + 2163)) >> 6) - 1;
}

- (void)beginVirtualSubstream
{
}

- (void)waitForProgress:(unsigned int)a3
{
  impl = (uint32x2_t *)self->_impl;
  unsigned int v5 = (unsigned int *)impl[2090];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        int v7 = (uint32x2_t *)v5;
        unsigned int v8 = v5[7];
        if (v8 <= a3) {
          break;
        }
        unsigned int v5 = (unsigned int *)*v7;
        uint64_t v6 = (uint64_t **)v7;
        if (!*(void *)v7) {
          goto LABEL_8;
        }
      }
      if (v8 >= a3) {
        break;
      }
      unsigned int v5 = (unsigned int *)v7[1];
      if (!v5)
      {
        uint64_t v6 = (uint64_t **)&v7[1];
        goto LABEL_8;
      }
    }
  }
  else
  {
    uint64_t v6 = (uint64_t **)&impl[2090];
    int v7 = impl + 2090;
LABEL_8:
    long long v9 = v7;
    int v7 = (uint32x2_t *)operator new(0x30uLL);
    v7[3].i32[1] = a3;
    v7[4] = 0;
    v7[5].i32[0] = 0;
    *int v7 = 0;
    v7[1] = 0;
    v7[2] = (uint32x2_t)v9;
    *uint64_t v6 = (uint64_t *)v7;
    uint32x2_t v10 = **(uint32x2_t **)&impl[2089];
    BOOL v11 = (uint64_t *)v7;
    if (v10)
    {
      impl[2089] = v10;
      BOOL v11 = *v6;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)&impl[2090], v11);
    ++*(void *)&impl[2091];
  }
  if (v7[5].i32[0] >= (unsigned __int32)impl[2088].i32[0])
  {
    uint32x2_t v12 = v7[4];
    int v13 = impl[2086].i32[1];
    uint64_t v14 = (uint64_t)&impl[2];
    if (v13 == v12.i32[0])
    {
      int v15 = impl[2084].u8[5];
      BOOL v16 = impl[2086].i32[0] != 0;
      int v22 = 0;
      agxaReserveCDMTokenSpace<AGX::HAL200::Encoders,AGX::HAL200::DataBufferAllocator>(22, v14, 4, v15, v16, v12.i32[0], &v22);
      uint64_t v17 = impl + 96;
      unint64_t v18 = (unsigned __int32 *)impl[96];
      *unint64_t v18 = 1610612992;
    }
    else
    {
      BOOL v19 = impl[2086].i32[0] != 0;
      int32x2_t v20 = (int32x2_t)vand_s8((int8x8_t)vadd_s32((int32x2_t)vshl_u32(v12, (uint32x2_t)0x1500000012), (int32x2_t)0x20000000040000), (int8x8_t)0x1FE00000001C0000);
      unsigned __int32 v21 = (vorr_s8((int8x8_t)v20, (int8x8_t)vdup_lane_s32(v20, 1)).u32[0] | 0x60000100) + 256;
      int v23 = 0;
      agxaReserveCDMTokenSpace<AGX::HAL200::Encoders,AGX::HAL200::DataBufferAllocator>(22, v14, 4, 0, v19, v13, &v23);
      uint64_t v17 = impl + 96;
      unint64_t v18 = (unsigned __int32 *)impl[96];
      *unint64_t v18 = v21;
    }
    *uint64_t v17 = (uint32x2_t)(v18 + 1);
  }
}

- (void)signalProgress:(unsigned int)a3
{
  impl = (unsigned int *)self->_impl;
  uint64_t v5 = impl[4173];
  uint64_t v6 = &impl[v5];
  unsigned int v7 = v6[4174];
  v6[4174] = v7 + 1;
  if (v7 >= 0xFF)
  {
    BOOL v8 = impl[4172] != 0;
    int v30 = 0;
    agxaReserveCDMTokenSpace<AGX::HAL200::Encoders,AGX::HAL200::DataBufferAllocator>(22, (uint64_t)(impl + 4), 4, 0, v8, v5, &v30);
    long long v9 = (_DWORD *)*((void *)impl + 96);
    uint32x2_t v10 = (unint64_t *)(v9 + 1);
    *long long v9 = -1610612736;
    BOOL v11 = v9 + 2;
    *((void *)impl + 96) = v10;
    int v12 = impl[4173];
    impl[4173] = -1;
    if ((unint64_t)v11 > *((void *)impl + 95))
    {
      int v29 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 4, 22, 0);
      int v13 = (unint64_t *)*((void *)impl + 96);
      if (v29)
      {
        if ((unint64_t)v13 + 4 > *((void *)impl + 95)) {
          abort();
        }
        *((void *)impl + 97) = (char *)v13 + 4;
        *uint32x2_t v10 = __ROR8__((char *)v13 + *((void *)impl + 98), 32) & 0xFFFFFFFF0000FFFFLL | 0x20000000;
        int v13 = (unint64_t *)*((void *)impl + 96);
      }
    }
    else
    {
      *((void *)impl + 97) = v11;
      int v13 = v10;
    }
    *(_DWORD *)int v13 = 1610613504;
    *((void *)impl + 96) = (char *)v13 + 4;
    impl[4173] = 0;
    *((void *)impl + 2087) = 0;
    if (*((unsigned char *)impl + 17272))
    {
      LODWORD(v5) = 0;
      *(_DWORD *)(*((void *)impl + 2164) - 56) = v12;
    }
    else
    {
      impl[4173] = v12;
      BOOL v14 = impl[4172] != 0;
      int v31 = 0;
      agxaReserveCDMTokenSpace<AGX::HAL200::Encoders,AGX::HAL200::DataBufferAllocator>(22, (uint64_t)(impl + 4), 4, 0, v14, v12, &v31);
      int v15 = (unsigned int *)*((void *)impl + 96);
      unsigned int *v15 = ((_BYTE)v12 + 1) & 7 | 0xA0000000;
      *((void *)impl + 96) = v15 + 1;
      LODWORD(v5) = impl[4173];
    }
    ++impl[4176];
    BOOL v16 = &impl[v5];
    unsigned int v7 = v16[4174];
    v16[4174] = v7 + 1;
  }
  unsigned int v17 = impl[4176];
  unint64_t v18 = (unsigned int *)*((void *)impl + 2090);
  if (v18)
  {
    while (1)
    {
      while (1)
      {
        int32x2_t v20 = v18;
        unsigned int v21 = v18[7];
        if (v21 <= a3) {
          break;
        }
        unint64_t v18 = (unsigned int *)*v20;
        BOOL v19 = (uint64_t **)v20;
        if (!*v20) {
          goto LABEL_15;
        }
      }
      if (v21 >= a3) {
        break;
      }
      unint64_t v18 = (unsigned int *)v20[1];
      if (!v18)
      {
        BOOL v19 = (uint64_t **)(v20 + 1);
        goto LABEL_15;
      }
    }
  }
  else
  {
    BOOL v19 = (uint64_t **)(impl + 4180);
    int32x2_t v20 = impl + 4180;
LABEL_15:
    int v22 = v20;
    int32x2_t v20 = operator new(0x30uLL);
    *((_DWORD *)v20 + 7) = a3;
    v20[4] = 0;
    *((_DWORD *)v20 + 10) = 0;
    *int32x2_t v20 = 0;
    v20[1] = 0;
    v20[2] = v22;
    *BOOL v19 = v20;
    uint64_t v23 = **((void **)impl + 2089);
    unint64_t v24 = v20;
    if (v23)
    {
      *((void *)impl + 2089) = v23;
      unint64_t v24 = *v19;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*((uint64_t **)impl + 2090), v24);
    ++*((void *)impl + 2091);
  }
  *((_DWORD *)v20 + 8) = v5;
  *((_DWORD *)v20 + 9) = v7;
  *((_DWORD *)v20 + 10) = v17;
  int v25 = *((unsigned __int8 *)impl + 16677);
  BOOL v26 = impl[4172] != 0;
  int v27 = impl[4173];
  int v32 = 0;
  agxaReserveCDMTokenSpace<AGX::HAL200::Encoders,AGX::HAL200::DataBufferAllocator>(22, (uint64_t)(impl + 4), 4, v25, v26, v27, &v32);
  uint64_t v28 = (unsigned int *)*((void *)impl + 96);
  *uint64_t v28 = ((v7 << 21) + 0x200000) & 0x1FE00000 | 0x60000060;
  *((void *)impl + 96) = v28 + 1;
}

- (void)setSubstream:(unsigned int)a3
{
  impl = self->_impl;
  if (*((unsigned char *)impl + 17272))
  {
    *(_DWORD *)(impl[2164] - 56) = a3;
  }
  else
  {
    *((_DWORD *)impl + 4173) = a3;
    BOOL v4 = *((_DWORD *)impl + 4172) != 0;
    unsigned int v5 = ((_BYTE)a3 + 1) & 7 | 0xA0000000;
    int v7 = 0;
    agxaReserveCDMTokenSpace<AGX::HAL200::Encoders,AGX::HAL200::DataBufferAllocator>(22, (uint64_t)(impl + 2), 4, 0, v4, a3, &v7);
    uint64_t v6 = (unsigned int *)impl[96];
    *uint64_t v6 = v5;
    impl[96] = v6 + 1;
  }
}

- (BOOL)setMTLCounterSampleLocationWithBuffer:(id)a3 startIndex:(unsigned int)a4 endIndex:(unsigned int)a5
{
  if (!a3) {
    return 0;
  }
  impl = (unsigned int *)self->_impl;
  impl[4224] = a4;
  impl[4225] = a5;
  char v7 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 4224);
  int v8 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 4225);
  if ((v7 & 1) == 0 && !v8) {
    return 0;
  }

  return AGX::CounterSamplingContextGen1::setCounterSampleBuffer((AGX::CounterSamplingContextGen1 *)(impl + 4222), (AGXMTLCounterSampleBuffer *)a3);
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
  return AGX::ContextCommon<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::userDrawTokenIndex((uint64_t)self->_impl, a3, a4);
}

- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5
{
  impl = self->_impl;
  impl[379] = a3;
  impl[380] = a4;
}

- (void)waitForFence:(id)a3
{
  impl = self->_impl;
  if (*((void *)impl + 185)) {
    MTLResourceListAddResource();
  }
  if (!*((void *)impl + 2076)) {
    operator new();
  }
  unsigned int v5 = *(unsigned __int16 *)((char *)a3 + (int)*MEMORY[0x263F4B168]);
  uint64_t v6 = (AGX::FenceList *)*((void *)impl + 2076);

  AGX::FenceList::insertFence(v6, v5);
}

- (void)updateFence:(id)a3
{
  impl = self->_impl;
  if (*((void *)impl + 185)) {
    MTLResourceListAddResource();
  }
  unsigned int v5 = (AGX::FenceList *)*((void *)impl + 2075);
  if (!v5) {
    operator new();
  }
  AGX::FenceList::insertFence(v5, *(unsigned __int16 *)((char *)a3 + (int)*MEMORY[0x263F4B168]));
  *((unsigned char *)impl + 1888) = 1;
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    if (*((void *)self->_impl + 185))
    {
      do
      {
        if (*a3)
        {
          MTLResourceListAddResource();
          IOGPUResourceListAddResource();
        }
        ++a3;
        --v4;
      }
      while (v4);
    }
    else
    {
      do
      {
        if (*a3) {
          IOGPUResourceListAddResource();
        }
        ++a3;
        --v4;
      }
      while (v4);
    }
  }
}

- (void)useResidencySet:(id)a3
{
  if (*((void *)self->_impl + 185))
  {
    if (!a3) {
      return;
    }
    MTLResourceListAddResource();
  }
  else if (!a3)
  {
    return;
  }

  IOGPUResourceListAddResource();
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
}

- (void)useHeap:(id)a3
{
  impl = self->_impl;
  if ([a3 type] == 2)
  {
    for (uint64_t i = *((void *)a3 + 7); i != *((void *)a3 + 8); i += 8)
    {
      if (impl[185]) {
        MTLResourceListAddResource();
      }
      IOGPUResourceListAddResource();
    }
  }
  else if (a3)
  {
    if (impl[185]) {
      MTLResourceListAddResource();
    }
    IOGPUResourceListAddResource();
  }
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  LODWORD(v5) = a4;
  unint64_t v8 = a5 & 2 | ((a5 & 7) != 0);
  if (a4)
  {
    unint64_t v9 = 0;
    uint64_t v19 = 88;
    impl = (void **)self->_impl;
    uint64_t v11 = 8 * a4;
    int v12 = (int *)MEMORY[0x263F4B188];
    do
    {
      int v13 = a3[v9 / 8];
      if (v13 && *(void *)((char *)v13 + *v12 + 16) >> 61 == 3)
      {
        AGX::UserIntersectionFunctionTableGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::bindResources(v13[37]);
        AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(impl[199], *(void *)(v13[37] + 96), v8);
      }
      v9 += 8;
    }
    while (v11 != v9);
    AGX::ContextCommon<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::useResourcesCommon((uint64_t)impl, (uint64_t *)a3, v5, v8, v8);
  }
  if ([(AGXG17FamilyComputeContext *)self dispatchType] == 1)
  {
    uint64_t v14 = *((void *)self->_impl + 2085);
    if (!v14) {
      operator new();
    }
    if (v5)
    {
      int v15 = (float *)(v14 + 8);
      uint64_t v5 = v5;
      BOOL v16 = (int *)MEMORY[0x263F4B188];
      do
      {
        uint64_t v17 = (uint64_t)*a3++;
        unsigned int v18 = *(_DWORD *)(v17 + *v16 + 48);
        int v20 = v8;
        ResourceTracker<_ResourceTrackerBinding>::addResource(v15, (float *)&v20, v18, v8);
        --v5;
      }
      while (v5);
    }
  }
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  unint64_t v6 = a4 & 2 | ((a4 & 7) != 0);
  char v7 = (int *)MEMORY[0x263F4B188];
  if (a3)
  {
    impl = (void **)self->_impl;
    if (*(void *)((char *)a3 + *MEMORY[0x263F4B188] + 16) >> 61 == 3)
    {
      AGX::UserIntersectionFunctionTableGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::bindResources(*((void *)a3 + 37));
      AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(impl[199], *(void *)(*((void *)a3 + 37) + 96), v6);
    }
    AGX::ContextCommon<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::useResourceCommon((uint64_t)impl, (uint64_t)a3, v6, v6);
  }
  if ([(AGXG17FamilyComputeContext *)self dispatchType] == 1)
  {
    uint64_t v9 = *((void *)self->_impl + 2085);
    if (!v9) {
      operator new();
    }
    unsigned int v10 = *(_DWORD *)((char *)a3 + *v7 + 48);
    int v11 = v6;
    ResourceTracker<_ResourceTrackerBinding>::addResource((float *)(v9 + 8), (float *)&v11, v10, v6);
  }
}

- (id)newKernelDebugInfo
{
  uint64_t v2 = *(void *)(*((void *)self->_impl + 240) + 16);
  if (*(char *)(v2 + 1583) < 0)
  {
    if (*(void *)(v2 + 1568)) {
      goto LABEL_3;
    }
    return 0;
  }
  if (!*(unsigned char *)(v2 + 1583)) {
    return 0;
  }
LABEL_3:
  id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
  if (*(char *)(v2 + 1583) < 0)
  {
    uint64_t v4 = *(void *)(v2 + 1560);
    uint64_t v5 = *(void *)(v2 + 1568);
  }
  else
  {
    uint64_t v4 = v2 + 1560;
    uint64_t v5 = *(unsigned __int8 *)(v2 + 1583);
  }

  return (id)[v3 initWithBytes:v4 length:v5];
}

- (unint64_t)dispatchType
{
  return *((_DWORD *)self->_impl + 470) == 1;
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  impl = self->_impl;
  impl[382] = impl[381];
  if (*((void *)impl + 185)) {
    MTLResourceListAddResource();
  }
  unsigned int v10 = (int *)MEMORY[0x263F4B188];
  IOGPUResourceListAddResource();
  unint64_t v11 = *(void *)((char *)a4 + *v10 + 8) + a5;
  int v12 = 0;
  unint64_t v13 = v11;
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeCommandsInBufferCommon((uint64_t)impl, (uint64_t)a3, &v12);
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  impl = self->_impl;
  int v6 = impl[381];
  impl[382] = v6;
  if (LODWORD(a4.length))
  {
    v7[0] = 1;
    v7[2] = a4.location;
    v7[3] = LODWORD(a4.location) + LODWORD(a4.length) - 1;
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeCommandsInBufferCommon((uint64_t)impl, (uint64_t)a3, v7);
    impl = self->_impl;
    int v6 = impl[381];
  }
  impl[383] = v6;
}

- (BOOL)parallelExecution
{
  return 0;
}

- (void)dispatchFenceOnly
{
  impl = self->_impl;
  int v3 = *((unsigned __int8 *)impl + 16677);
  BOOL v4 = impl[4172] != 0;
  int v5 = impl[4173];
  int v7 = 0;
  agxaReserveCDMTokenSpace<AGX::HAL200::Encoders,AGX::HAL200::DataBufferAllocator>(22, (uint64_t)(impl + 4), 4, v3, v4, v5, &v7);
  int v6 = (_DWORD *)*((void *)impl + 96);
  *int v6 = 1610612992;
  *((void *)impl + 96) = v6 + 1;
}

- (void)dispatchInvalidateOnly
{
  impl = self->_impl;
  int v3 = *((unsigned __int8 *)impl + 16677);
  BOOL v4 = impl[4172] != 0;
  int v5 = impl[4173];
  int v7 = 0;
  agxaReserveCDMTokenSpace<AGX::HAL200::Encoders,AGX::HAL200::DataBufferAllocator>(22, (uint64_t)(impl + 4), 4, v3, v4, v5, &v7);
  int v6 = (_DWORD *)*((void *)impl + 96);
  *int v6 = 1610612768;
  *((void *)impl + 96) = v6 + 1;
}

- (void)dispatchFlushOnly
{
  impl = self->_impl;
  int v3 = *((unsigned __int8 *)impl + 16677);
  BOOL v4 = impl[4172] != 0;
  int v5 = impl[4173];
  int v7 = 0;
  agxaReserveCDMTokenSpace<AGX::HAL200::Encoders,AGX::HAL200::DataBufferAllocator>(22, (uint64_t)(impl + 4), 4, v3, v4, v5, &v7);
  int v6 = (_DWORD *)*((void *)impl + 96);
  *int v6 = 1610612800;
  *((void *)impl + 96) = v6 + 1;
}

- (void)dispatchFlushInvalidate
{
  impl = self->_impl;
  int v3 = *((unsigned __int8 *)impl + 16677);
  BOOL v4 = impl[4172] != 0;
  int v5 = impl[4173];
  int v7 = 0;
  agxaReserveCDMTokenSpace<AGX::HAL200::Encoders,AGX::HAL200::DataBufferAllocator>(22, (uint64_t)(impl + 4), 4, v3, v4, v5, &v7);
  int v6 = (_DWORD *)*((void *)impl + 96);
  *int v6 = 1612709984;
  *((void *)impl + 96) = v6 + 1;
}

- (void)dispatchWaitFlush
{
  impl = self->_impl;
  int v3 = *((unsigned __int8 *)impl + 16677);
  BOOL v4 = impl[4172] != 0;
  int v5 = impl[4173];
  int v7 = 0;
  agxaReserveCDMTokenSpace<AGX::HAL200::Encoders,AGX::HAL200::DataBufferAllocator>(22, (uint64_t)(impl + 4), 4, v3, v4, v5, &v7);
  int v6 = (_DWORD *)*((void *)impl + 96);
  *int v6 = 1610612864;
  *((void *)impl + 96) = v6 + 1;
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  if ([(AGXG17FamilyComputeContext *)self dispatchType] == 1)
  {
    impl = self->_impl;
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier((uint64_t)impl, 22);
    *(unsigned char *)(impl[239] + 458) = 0;
    if (!*((_DWORD *)impl + 4172)) {
      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::insertIndirectTGOptKernel((uint64_t)impl, 22, impl + 2169, impl + 2170, impl + 2171);
    }
  }

  [(_MTLCommandEncoder *)self memoryBarrierNotificationWithResources:a3 count:a4];
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  if ([(AGXG17FamilyComputeContext *)self dispatchType] == 1)
  {
    impl = self->_impl;
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::encodeBarrier((uint64_t)impl, 22);
    *(unsigned char *)(impl[239] + 458) = 0;
    if (!*((_DWORD *)impl + 4172)) {
      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::insertIndirectTGOptKernel((uint64_t)impl, 22, impl + 2169, impl + 2170, impl + 2171);
    }
  }

  [(_MTLCommandEncoder *)self memoryBarrierNotificationWithScope:a3];
}

- (void)setThreadgroupDistributionModeWithClusterGroupIndex:(unsigned int)a3
{
  *((_WORD *)self->_impl + 8580) = ((_WORD)a3 << 8) | 3;
}

- (void)setThreadgroupDistributionMode:(int64_t)a3
{
  __int16 v3 = a3 == 1;
  if (a3 == 2) {
    __int16 v3 = 2;
  }
  *((_WORD *)self->_impl + 8580) = v3;
}

- (BOOL)encodeEndIf
{
  impl = self->_impl;
  uint64_t v3 = impl[2144];
  if (v3)
  {
    unint64_t v4 = v3 + impl[2143] - 1;
    uint64_t v5 = *(void *)(impl[2140] + ((v4 >> 3) & 0x1FFFFFFFFFFFFFF8));
    unint64_t v6 = v4 & 0x3F;
    int v7 = *(_DWORD *)(v5 + (v6 << 6) + 56);
    if (v7 == 1)
    {
      uint64_t v8 = *(void *)(v5 + (v6 << 6));
      unint64_t v9 = __ROR8__(*(void *)(impl[2116] + 768) + *(void *)(impl[2116] + 752), 32) & 0xFFFFFFFF0000FFFFLL | 0x20000000;
      goto LABEL_6;
    }
    if (!v7)
    {
      uint64_t v10 = v5 + (v6 << 6);
      uint64_t v8 = *(void *)(v10 + 32);
      int v11 = *(unsigned __int8 *)(v10 + 48);
      unint64_t v9 = *(void *)(impl[2116] + 768) + *(void *)(impl[2116] + 752);
      if (!v11)
      {
        *(_WORD *)uint64_t v8 = WORD2(v9);
        *(_DWORD *)(v8 + 4) = v9;
LABEL_7:
        uint64_t v12 = impl[2140];
        uint64_t v13 = impl[2141];
        uint64_t v14 = 8 * (v13 - v12) - 1;
        BOOL v15 = v13 == v12;
        uint64_t v16 = impl[2144];
        uint64_t v17 = impl[2143];
        if (v15) {
          uint64_t v14 = 0;
        }
        impl[2144] = v16 - 1;
        if ((unint64_t)(v14 - (v16 + v17) + 1) >= 0x80)
        {
          operator delete(*(void **)(v13 - 8));
          impl[2141] -= 8;
        }
        if (*((unsigned char *)impl + 17104))
        {
          unsigned int v18 = (void (*)(void *))impl[2136];
          uint64_t v19 = impl[2137];
          int v20 = (void *)(impl[2135] + (v19 >> 1));
          if (v19) {
            unsigned int v18 = *(void (**)(void *))(*v20 + v18);
          }
          v18(v20);
        }
        if (!impl[2144] && *((unsigned char *)impl + 17040))
        {
          unsigned int v21 = (void (*)(void *))impl[2128];
          uint64_t v22 = impl[2129];
          uint64_t v23 = (void *)(impl[2127] + (v22 >> 1));
          if ((v22 & 1) == 0) {
            goto LABEL_23;
          }
          goto LABEL_22;
        }
        return (*((unsigned char *)impl + 17162) & 2) == 0;
      }
LABEL_6:
      *(void *)uint64_t v8 = v9;
      goto LABEL_7;
    }
  }
  if (*((unsigned char *)impl + 16976))
  {
    unsigned int v21 = (void (*)(void *))impl[2120];
    uint64_t v24 = impl[2121];
    uint64_t v23 = (void *)(impl[2119] + (v24 >> 1));
    if ((v24 & 1) == 0) {
      goto LABEL_23;
    }
LABEL_22:
    unsigned int v21 = *(void (**)(void *))(*v23 + v21);
LABEL_23:
    v21(v23);
  }
  return (*((unsigned char *)impl + 17162) & 2) == 0;
}

- (void)encodeStartElse
{
  impl = self->_impl;
  uint64_t v3 = impl[2144];
  if (!v3
    || (uint64_t v4 = impl[2143],
        uint64_t v5 = impl[2140],
        uint64_t v6 = *(void *)(v5 + (((unint64_t)(v3 - 1 + v4) >> 3) & 0x1FFFFFFFFFFFFFF8))
           + (((v3 - 1 + v4) & 0x3F) << 6),
        *(_DWORD *)(v6 + 56)))
  {
    if (*((unsigned char *)impl + 16976))
    {
      uint64_t v28 = (void (*)(void *))impl[2120];
      uint64_t v29 = impl[2121];
      int v30 = (void *)(impl[2119] + (v29 >> 1));
      if (v29) {
        uint64_t v28 = *(void (**)(void *))(*v30 + v28);
      }
      v28(v30);
    }
  }
  else
  {
    unint64_t v7 = impl[2086];
    uint64_t v8 = impl[2141];
    uint64_t v9 = *(void *)(v6 + 32);
    int v10 = *(unsigned __int8 *)(v6 + 48);
    impl[2144] = v3 - 1;
    if (v8 == v5) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = 8 * (v8 - v5) - 1;
    }
    if ((unint64_t)(v11 - (v3 + v4) + 1) >= 0x80)
    {
      operator delete(*(void **)(v8 - 8));
      impl[2141] -= 8;
    }
    if (*((unsigned char *)impl + 17104))
    {
      uint64_t v12 = (void (*)(void *))impl[2136];
      uint64_t v13 = impl[2137];
      uint64_t v14 = (void *)(impl[2135] + (v13 >> 1));
      if (v13) {
        uint64_t v12 = *(void (**)(void *))(*v14 + v12);
      }
      v12(v14);
    }
    if (*((unsigned char *)impl + 17072))
    {
      BOOL v15 = (void (*)(void *))impl[2132];
      uint64_t v16 = impl[2133];
      uint64_t v17 = (void *)(impl[2131] + (v16 >> 1));
      if (v16) {
        BOOL v15 = *(void (**)(void *))(*v17 + v15);
      }
      v15(v17);
    }
    unsigned int v18 = AGX::ComputeControlFlowEmitterGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::emitLink((void *)impl[2116], v7);
    uint64_t v20 = v19;
    uint64_t v21 = impl[2141];
    uint64_t v22 = impl[2140];
    uint64_t v23 = 8 * (v21 - v22) - 1;
    if (v21 == v22) {
      uint64_t v23 = 0;
    }
    unint64_t v24 = impl[2144] + impl[2143];
    if (v23 == v24)
    {
      std::deque<AGX::ControlFlowContext<AGX::HAL200::ComputeControlFlowEmitter,AGX::HAL200::ComputeUSCStateLoader,AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block,std::allocator<AGX::ControlFlowContext<AGX::HAL200::ComputeControlFlowEmitter,AGX::HAL200::ComputeUSCStateLoader,AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block>>::__add_back_capacity((uint64_t)(impl + 2139));
      uint64_t v22 = impl[2140];
      unint64_t v24 = impl[2144] + impl[2143];
    }
    unint64_t v25 = *(void *)(v22 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) + ((v24 & 0x3F) << 6);
    *(void *)unint64_t v25 = v18;
    *(void *)(v25 + 8) = v20;
    *(_DWORD *)(v25 + 56) = 1;
    uint64_t v26 = impl[2144];
    impl[2144] = v26 + 1;
    uint64_t v27 = *(void *)(*(void *)(impl[2140] + (((unint64_t)(impl[2143] + v26) >> 3) & 0x1FFFFFFFFFFFFFF8))
                    + (((impl[2143] + v26) & 0x3F) << 6)
                    + 8)
        + 8;
    if (v10)
    {
      *(void *)uint64_t v9 = v27;
    }
    else
    {
      *(_WORD *)uint64_t v9 = WORD2(v27);
      *(_DWORD *)(v9 + 4) = v27;
    }
  }
}

- (void)encodeStartIf:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  impl = self->_impl;
  if (a3)
  {
    if (*((void *)impl + 185)) {
      MTLResourceListAddResource();
    }
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(*((void **)impl + 199), (uint64_t)a3, 1);
    IOGPUResourceListAddResource();
    if (a5 - 1 > 4) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = dword_242EAA414[a5 - 1];
    }
    __int16 v12 = *((_WORD *)impl + 8580);
    uint64_t v13 = *((void *)impl + 2086);
    if (!*((void *)impl + 2144) && *((unsigned char *)impl + 17008))
    {
      uint64_t v14 = (void (*)(void *))*((void *)impl + 2124);
      uint64_t v15 = *((void *)impl + 2125);
      uint64_t v16 = (void *)(*((void *)impl + 2123) + (v15 >> 1));
      if (v15) {
        uint64_t v14 = *(void (**)(void *))(*v16 + v14);
      }
      v14(v16);
    }
    if (*((unsigned char *)impl + 17072))
    {
      uint64_t v17 = (void (*)(void *))*((void *)impl + 2132);
      uint64_t v18 = *((void *)impl + 2133);
      uint64_t v19 = (void *)(*((void *)impl + 2131) + (v18 >> 1));
      if (v18) {
        uint64_t v17 = *(void (**)(void *))(*v19 + v17);
      }
      v17(v19);
    }
    v27[0] = a3;
    v27[1] = a4;
    int v28 = 2;
    v26[0] = a6;
    v26[4] = 1;
    AGX::ComputeControlFlowEmitterGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::emitPredicate((uint64_t)v29, v11, (uint64_t)v27, (uint64_t)v26, *((void *)impl + 2115), *((void *)impl + 2116), *((void *)impl + 2117), *((void *)impl + 2118), v13, SHIDWORD(v13), v12);
    uint64_t v20 = *((void *)impl + 2141);
    uint64_t v21 = *((void *)impl + 2140);
    uint64_t v22 = 8 * (v20 - v21) - 1;
    if (v20 == v21) {
      uint64_t v22 = 0;
    }
    unint64_t v23 = *((void *)impl + 2144) + *((void *)impl + 2143);
    if (v22 == v23)
    {
      std::deque<AGX::ControlFlowContext<AGX::HAL200::ComputeControlFlowEmitter,AGX::HAL200::ComputeUSCStateLoader,AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block,std::allocator<AGX::ControlFlowContext<AGX::HAL200::ComputeControlFlowEmitter,AGX::HAL200::ComputeUSCStateLoader,AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block>>::__add_back_capacity((uint64_t)impl + 17112);
      uint64_t v21 = *((void *)impl + 2140);
      unint64_t v23 = *((void *)impl + 2144) + *((void *)impl + 2143);
    }
    unint64_t v24 = *(void *)(v21 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) + ((v23 & 0x3F) << 6);
    long long v25 = v29[1];
    *(_OWORD *)unint64_t v24 = v29[0];
    *(_OWORD *)(v24 + 16) = v25;
    *(_OWORD *)(v24 + 32) = v29[2];
    *(void *)(v24 + 48) = v30;
    *(_DWORD *)(v24 + 56) = 0;
    ++*((void *)impl + 2144);
  }
  else
  {
    *((unsigned char *)impl + 17162) |= 2u;
  }
}

- (BOOL)encodeEndWhile
{
  impl = self->_impl;
  uint64_t v3 = impl[2144];
  if (v3
    && *(_DWORD *)(*(void *)(impl[2140] + (((unint64_t)(v3 + impl[2143] - 1) >> 3) & 0x1FFFFFFFFFFFFFF8))
                 + (((v3 + impl[2143] - 1) & 0x3F) << 6)
                 + 56) == 2)
  {
    uint64_t v4 = AGX::ComputeControlFlowEmitterGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::emitLink((void *)impl[2116], impl[2086]);
    unint64_t v5 = impl[2144] + impl[2143] - 1;
    unint64_t *v4 = __ROR8__(*(void *)(*(void *)(impl[2140] + ((v5 >> 3) & 0x1FFFFFFFFFFFFFF8)) + ((v5 & 0x3F) << 6) + 8), 32) & 0xFFFFFFFF0000FFFFLL | 0x20000000;
    unint64_t v6 = impl[2144] + impl[2143] - 1;
    unint64_t v7 = *(void *)(impl[2140] + ((v6 >> 3) & 0x1FFFFFFFFFFFFFF8)) + ((v6 & 0x3F) << 6);
    uint64_t v8 = *(void *)(v7 + 32);
    int v9 = *(unsigned __int8 *)(v7 + 48);
    uint64_t v11 = v10 + 8;
    if (v9)
    {
      *(void *)uint64_t v8 = v11;
    }
    else
    {
      *(_WORD *)uint64_t v8 = WORD2(v11);
      *(_DWORD *)(v8 + 4) = v11;
    }
    uint64_t v12 = impl[2140];
    uint64_t v13 = impl[2141];
    uint64_t v14 = 8 * (v13 - v12) - 1;
    BOOL v15 = v13 == v12;
    uint64_t v16 = impl[2144];
    uint64_t v17 = impl[2143];
    if (v15) {
      uint64_t v14 = 0;
    }
    impl[2144] = v16 - 1;
    if ((unint64_t)(v14 - (v16 + v17) + 1) >= 0x80)
    {
      operator delete(*(void **)(v13 - 8));
      impl[2141] -= 8;
    }
    if (*((unsigned char *)impl + 17104))
    {
      uint64_t v18 = (void (*)(void *))impl[2136];
      uint64_t v19 = impl[2137];
      uint64_t v20 = (void *)(impl[2135] + (v19 >> 1));
      if (v19) {
        uint64_t v18 = *(void (**)(void *))(*v20 + v18);
      }
      v18(v20);
    }
    if (!impl[2144] && *((unsigned char *)impl + 17040))
    {
      uint64_t v21 = (void (*)(void *))impl[2128];
      uint64_t v22 = impl[2129];
      unint64_t v23 = (void *)(impl[2127] + (v22 >> 1));
      if ((v22 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)impl + 16976))
  {
    uint64_t v21 = (void (*)(void *))impl[2120];
    uint64_t v24 = impl[2121];
    unint64_t v23 = (void *)(impl[2119] + (v24 >> 1));
    if ((v24 & 1) == 0) {
      goto LABEL_21;
    }
LABEL_20:
    uint64_t v21 = *(void (**)(void *))(*v23 + v21);
LABEL_21:
    v21(v23);
  }
  return (*((unsigned char *)impl + 17162) & 2) == 0;
}

- (void)encodeStartWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  impl = self->_impl;
  if (a3)
  {
    if (*((void *)impl + 185)) {
      MTLResourceListAddResource();
    }
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(*((void **)impl + 199), (uint64_t)a3, 1);
    IOGPUResourceListAddResource();
    if (a5 - 1 > 4) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = dword_242EAA414[a5 - 1];
    }
    __int16 v12 = *((_WORD *)impl + 8580);
    uint64_t v13 = *((void *)impl + 2086);
    if (!*((void *)impl + 2144) && *((unsigned char *)impl + 17008))
    {
      uint64_t v14 = (void (*)(void *))*((void *)impl + 2124);
      uint64_t v15 = *((void *)impl + 2125);
      uint64_t v16 = (void *)(*((void *)impl + 2123) + (v15 >> 1));
      if (v15) {
        uint64_t v14 = *(void (**)(void *))(*v16 + v14);
      }
      v14(v16);
    }
    if (*((unsigned char *)impl + 17072))
    {
      uint64_t v17 = (void (*)(void *))*((void *)impl + 2132);
      uint64_t v18 = *((void *)impl + 2133);
      uint64_t v19 = (void *)(*((void *)impl + 2131) + (v18 >> 1));
      if (v18) {
        uint64_t v17 = *(void (**)(void *))(*v19 + v17);
      }
      v17(v19);
    }
    v27[0] = a3;
    v27[1] = a4;
    int v28 = 2;
    v26[0] = a6;
    v26[4] = 1;
    AGX::ComputeControlFlowEmitterGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::emitPredicate((uint64_t)v29, v11, (uint64_t)v27, (uint64_t)v26, *((void *)impl + 2115), *((void *)impl + 2116), *((void *)impl + 2117), *((void *)impl + 2118), v13, SHIDWORD(v13), v12);
    uint64_t v20 = *((void *)impl + 2141);
    uint64_t v21 = *((void *)impl + 2140);
    uint64_t v22 = 8 * (v20 - v21) - 1;
    if (v20 == v21) {
      uint64_t v22 = 0;
    }
    unint64_t v23 = *((void *)impl + 2144) + *((void *)impl + 2143);
    if (v22 == v23)
    {
      std::deque<AGX::ControlFlowContext<AGX::HAL200::ComputeControlFlowEmitter,AGX::HAL200::ComputeUSCStateLoader,AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block,std::allocator<AGX::ControlFlowContext<AGX::HAL200::ComputeControlFlowEmitter,AGX::HAL200::ComputeUSCStateLoader,AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block>>::__add_back_capacity((uint64_t)impl + 17112);
      uint64_t v21 = *((void *)impl + 2140);
      unint64_t v23 = *((void *)impl + 2144) + *((void *)impl + 2143);
    }
    unint64_t v24 = *(void *)(v21 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) + ((v23 & 0x3F) << 6);
    long long v25 = v29[1];
    *(_OWORD *)unint64_t v24 = v29[0];
    *(_OWORD *)(v24 + 16) = v25;
    *(_OWORD *)(v24 + 32) = v29[2];
    *(void *)(v24 + 48) = v30;
    *(_DWORD *)(v24 + 56) = 2;
    ++*((void *)impl + 2144);
  }
  else
  {
    *((unsigned char *)impl + 17162) |= 2u;
  }
}

- (BOOL)encodeEndDoWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  impl = self->_impl;
  if (!a3)
  {
    BOOL result = 0;
    *((unsigned char *)impl + 17162) |= 2u;
    return result;
  }
  if (*((void *)impl + 185)) {
    MTLResourceListAddResource();
  }
  AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setAndBindResource(*((void **)impl + 199), (uint64_t)a3, 1);
  IOGPUResourceListAddResource();
  if (a5 - 1 > 4) {
    unsigned int v11 = 2;
  }
  else {
    unsigned int v11 = dword_242EAA414[a5 - 1];
  }
  uint64_t v12 = *((void *)impl + 2144);
  if (v12
    && *(_DWORD *)(*(void *)(*((void *)impl + 2140)
                             + (((unint64_t)(v12 + *((void *)impl + 2143) - 1) >> 3) & 0x1FFFFFFFFFFFFFF8))
                 + (((v12 + *((void *)impl + 2143) - 1) & 0x3F) << 6)
                 + 56) == 3)
  {
    __int16 v13 = *((_WORD *)impl + 8580);
    uint64_t v14 = *((void *)impl + 2086);
    if (v11 - 1 >= 6) {
      uint64_t v15 = v11;
    }
    else {
      uint64_t v15 = 7 - v11;
    }
    v37[0] = a3;
    v37[1] = a4;
    int v38 = 2;
    v36[0] = a6;
    v36[4] = 1;
    AGX::ComputeControlFlowEmitterGen2<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::emitPredicate((uint64_t)v33, v15, (uint64_t)v37, (uint64_t)v36, *((void *)impl + 2115), *((void *)impl + 2116), *((void *)impl + 2117), *((void *)impl + 2118), v14, SHIDWORD(v14), v13);
    uint64_t v16 = v34;
    unint64_t v17 = *((void *)impl + 2144) + *((void *)impl + 2143) - 1;
    uint64_t v18 = *(void *)(*(void *)(*((void *)impl + 2140) + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8))
                    + ((v17 & 0x3F) << 6)
                    + 8);
    if (v35)
    {
      void *v34 = v18;
    }
    else
    {
      *(_WORD *)v34 = WORD2(v18);
      *((_DWORD *)v16 + 1) = v18;
    }
    uint64_t v19 = *((void *)impl + 2140);
    uint64_t v20 = *((void *)impl + 2141);
    uint64_t v21 = 8 * (v20 - v19) - 1;
    BOOL v22 = v20 == v19;
    uint64_t v23 = *((void *)impl + 2144);
    uint64_t v24 = *((void *)impl + 2143);
    if (v22) {
      uint64_t v21 = 0;
    }
    *((void *)impl + 2144) = v23 - 1;
    if ((unint64_t)(v21 - (v23 + v24) + 1) >= 0x80)
    {
      operator delete(*(void **)(v20 - 8));
      *((void *)impl + 2141) -= 8;
    }
    if (*((unsigned char *)impl + 17104))
    {
      long long v25 = (void (*)(void *))*((void *)impl + 2136);
      uint64_t v26 = *((void *)impl + 2137);
      uint64_t v27 = (void *)(*((void *)impl + 2135) + (v26 >> 1));
      if (v26) {
        long long v25 = *(void (**)(void *))(*v27 + v25);
      }
      v25(v27);
    }
    if (*((void *)impl + 2144) || !*((unsigned char *)impl + 17040)) {
      return (*((unsigned char *)impl + 17162) & 2) == 0;
    }
    int v28 = (void (*)(void *))*((void *)impl + 2128);
    uint64_t v29 = *((void *)impl + 2129);
    uint64_t v30 = (void *)(*((void *)impl + 2127) + (v29 >> 1));
    if ((v29 & 1) == 0) {
      goto LABEL_31;
    }
LABEL_30:
    int v28 = *(void (**)(void *))(*v30 + v28);
LABEL_31:
    v28(v30);
    return (*((unsigned char *)impl + 17162) & 2) == 0;
  }
  if (*((unsigned char *)impl + 16976))
  {
    int v28 = (void (*)(void *))*((void *)impl + 2120);
    uint64_t v32 = *((void *)impl + 2121);
    uint64_t v30 = (void *)(*((void *)impl + 2119) + (v32 >> 1));
    if ((v32 & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  return (*((unsigned char *)impl + 17162) & 2) == 0;
}

- (void)encodeStartDoWhile
{
  impl = self->_impl;
  if (!impl[2144] && *((unsigned char *)impl + 17008))
  {
    uint64_t v3 = (void (*)(void *, SEL))impl[2124];
    uint64_t v4 = impl[2125];
    unint64_t v5 = (void *)(impl[2123] + (v4 >> 1));
    if (v4) {
      uint64_t v3 = *(void (**)(void *, SEL))(*v5 + v3);
    }
    v3(v5, a2);
  }
  if (*((unsigned char *)impl + 17072))
  {
    unint64_t v6 = (void (*)(void *, SEL))impl[2132];
    uint64_t v7 = impl[2133];
    uint64_t v8 = (void *)(impl[2131] + (v7 >> 1));
    if (v7) {
      unint64_t v6 = *(void (**)(void *, SEL))(*v8 + v6);
    }
    v6(v8, a2);
  }
  uint64_t v9 = impl[2141];
  uint64_t v10 = impl[2140];
  uint64_t v11 = 8 * (v9 - v10) - 1;
  BOOL v12 = v9 == v10;
  uint64_t v13 = impl[2116];
  uint64_t v14 = *(void *)(v13 + 752);
  uint64_t v15 = *(void *)(v13 + 768);
  if (v12) {
    uint64_t v11 = 0;
  }
  unint64_t v16 = impl[2144] + impl[2143];
  if (v11 == v16)
  {
    std::deque<AGX::ControlFlowContext<AGX::HAL200::ComputeControlFlowEmitter,AGX::HAL200::ComputeUSCStateLoader,AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block,std::allocator<AGX::ControlFlowContext<AGX::HAL200::ComputeControlFlowEmitter,AGX::HAL200::ComputeUSCStateLoader,AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block>>::__add_back_capacity((uint64_t)(impl + 2139));
    uint64_t v10 = impl[2140];
    unint64_t v16 = impl[2144] + impl[2143];
  }
  unint64_t v17 = *(void *)(v10 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) + ((v16 & 0x3F) << 6);
  *(void *)unint64_t v17 = v14;
  *(void *)(v17 + 8) = v15 + v14;
  *(_DWORD *)(v17 + 56) = 3;
  ++impl[2144];
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  impl = self->_impl;
  impl[382] = impl[381];
  if (a4->var1 * a4->var0 * a4->var2 <= *(unsigned int *)(*((void *)impl + 240) + 440))
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v7 = *a3;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a4;
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithThreadsPerGridImpl((uint64_t)impl, 22, (int *)&v7, &v6);
    *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
  }
}

- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  impl = self->_impl;
  impl[382] = impl[381];
  AGX::ComputeService<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithImprovedIndirectBuffer((uint64_t)impl, (uint64_t)a3, a4);
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  impl = self->_impl;
  impl[382] = impl[381];
  if (a5->var1 * a5->var0 * a5->var2 <= *(unsigned int *)(*((void *)impl + 240) + 440))
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v7 = *a5;
    AGX::ComputeService<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernelWithIndirectBuffer((uint64_t)impl, (uint64_t)a3, a4, &v7);
    *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
  }
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  impl = self->_impl;
  impl[382] = impl[381];
  if (a4->var1 * a4->var0 * a4->var2 <= *(unsigned int *)(*((void *)impl + 240) + 440))
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v7 = *a4;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a3;
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::executeKernel((uint64_t)impl, (long long *)&v7, (long long *)&v6);
    *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
  }
}

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
}

- (void)setStageInRegion:(id *)a3
{
  impl = (int32x4_t *)self->_impl;
  impl[1074] = vuzp1q_s32(*(int32x4_t *)&a3->var0.var0, *(int32x4_t *)&a3->var0.var2);
  *(int32x2_t *)impl[1075].i8 = vmovn_s64(*(int64x2_t *)&a3->var1.var1);
  uint64_t v4 = impl[10].i64[0];
  uint64_t v5 = v4 + 47;
  if ((unint64_t)(v4 + 47) > impl[9].i64[1])
  {
    int v9 = AGX::DataBufferAllocator<34ul>::growNoInline(&impl[1], 3, 0);
    uint64_t v4 = impl[10].i64[0];
    if (!v9) {
      goto LABEL_3;
    }
    uint64_t v5 = v4 + 47;
    if ((unint64_t)(v4 + 47) > impl[9].i64[1]) {
      abort();
    }
  }
  impl[10].i64[1] = v5;
LABEL_3:
  unint64_t v6 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v7 = v6 + impl[11].i64[0];
  impl[10].i64[0] = v6 + 32;
  impl[1039].i64[0] |= 0x10000000000uLL;
  impl[1041].i32[0] |= 1u;
  *(void *)(impl[121].i64[0] + 856) = v7;
  impl[748].i64[1] = *(void *)(impl[2].i64[1] + 224) + (int)*MEMORY[0x263F4B188];
  impl[680].i32[2] = 24;
  impl[696].i32[3] = 24;
  impl[713].i32[0] = v7 >> 8;
  int32x4_t v8 = impl[1074];
  *(void *)(v6 + 16) = impl[1075].i64[0];
  *(int32x4_t *)unint64_t v6 = v8;
}

- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  impl = self->_impl;
  impl[434] = a3;
  impl[435] = a4;
  impl[436] = 1;
  *((void *)impl + 2158) |= 0x8000uLL;
}

- (void)setImageBlockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  impl = self->_impl;
  impl[434] = a3;
  impl[435] = a4;
  impl[436] = 1;
  *((void *)impl + 2158) |= 0x8000uLL;
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  *((_DWORD *)self->_impl + a4 + 2878) = a3;
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  if (LODWORD(a6.length))
  {
    unsigned int location = a6.location;
    unint64_t v9 = 0;
    impl = self->_impl;
    uint64_t v26 = 8 * LODWORD(a6.length);
    uint64_t v11 = 9912;
    do
    {
      uint64_t v14 = (char *)a3[v9 / 8];
      if (v14)
      {
        uint64_t v15 = impl[182];
        uint64_t v16 = *(void *)(v15 + 808);
        unsigned int v17 = *(_DWORD *)a4;
        unsigned int v18 = *(_DWORD *)a5;
        uint64_t v19 = v14 + 48;
        long long v21 = *((_OWORD *)v19 + 1);
        long long v20 = *((_OWORD *)v19 + 2);
        v28[0] = *(_OWORD *)v19;
        v28[1] = v21;
        v28[2] = v20;
        if (v19[71] < 0)
        {
          std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)v19 + 6), *((void *)v19 + 7));
        }
        else
        {
          long long v22 = *((_OWORD *)v19 + 3);
          __p.__r_.__value_.__r.__words[2] = *((void *)v19 + 8);
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v22;
        }
        *((void *)&v28[0] + 1) = __PAIR64__(v18, v17);
        Sampler = AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::findOrCreateSampler(v16, (uint64_t)v28, v15, 0);
        if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
          if (!impl[185]) {
            goto LABEL_16;
          }
LABEL_15:
          MTLResourceListAddResource();
          goto LABEL_16;
        }
        operator delete(__p.__r_.__value_.__l.__data_);
        if (impl[185]) {
          goto LABEL_15;
        }
      }
      else
      {
        Sampler = 0;
        if (impl[185]) {
          goto LABEL_15;
        }
      }
LABEL_16:
      if (Sampler) {
        uint64_t v24 = *(void *)&Sampler->_impl.desc.label.__r_.var0;
      }
      else {
        uint64_t v24 = 0;
      }
      *(void *)(impl[242] + 8 * location + 9784) = v24;
      uint64_t v25 = impl[242];
      if ((~*(void *)(v25 + v9 + 9784) & 0x6000000000000000) == 0)
      {
        *(_OWORD *)(v25 + v11) = *(_OWORD *)&Sampler->_impl.desc.label.var0;
LABEL_4:
        p_impl = &Sampler->_impl;
        if (LODWORD(Sampler[1].super._device)) {
          p_impl = (Sampler *)LODWORD(Sampler[1].super._device);
        }
        goto LABEL_6;
      }
      if (Sampler) {
        goto LABEL_4;
      }
      p_impl = 0;
LABEL_6:
      uint64_t v13 = &impl[location++];
      v9 += 8;
      v13[1288] = p_impl;
      v11 += 16;
      ++a5;
      ++a4;
    }
    while (v26 != v9);
  }
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  unsigned int v6 = a6;
  impl = self->_impl;
  if (a3)
  {
    uint64_t v10 = impl[182];
    uint64_t v11 = *(void *)(v10 + 808);
    long long v12 = *((_OWORD *)a3 + 4);
    v19[0] = *((_OWORD *)a3 + 3);
    v19[1] = v12;
    v19[2] = *((_OWORD *)a3 + 5);
    if (*((char *)a3 + 119) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a3 + 12), *((void *)a3 + 13));
    }
    else {
      std::string __p = *(std::string *)((unsigned char *)a3 + 4);
    }
    *((void *)&v19[0] + 1) = __PAIR64__(LODWORD(a5), LODWORD(a4));
    Sampler = AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::findOrCreateSampler(v11, (uint64_t)v19, v10, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    Sampler = 0;
  }
  if (impl[185]) {
    MTLResourceListAddResource();
  }
  if (Sampler) {
    uint64_t v14 = *(void *)&Sampler->_impl.desc.label.__r_.var0;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = 8 * v6;
  *(void *)(impl[242] + v15 + 9784) = v14;
  uint64_t v16 = impl[242];
  if ((~*(void *)(v16 + v15 + 9784) & 0x6000000000000000) != 0)
  {
    unsigned int v17 = impl + 243;
    if (!Sampler)
    {
      p_impl = 0;
      goto LABEL_18;
    }
  }
  else
  {
    *(_OWORD *)(v16 + 16 * v6 + 9912) = *(_OWORD *)&Sampler->_impl.desc.label.var0;
    unsigned int v17 = impl + 243;
  }
  p_impl = &Sampler->_impl;
  if (LODWORD(Sampler[1].super._device)) {
    p_impl = (Sampler *)LODWORD(Sampler[1].super._device);
  }
LABEL_18:
  v17[v6 + 1045] = p_impl;
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  int length = a4.length;
  unsigned int location = a4.location;
  impl = self->_impl;
  if (LODWORD(a4.length) && impl[185])
  {
    uint64_t length_low = LODWORD(a4.length);
    unint64_t v9 = a3;
    do
    {
      if (*v9) {
        MTLResourceListAddResource();
      }
      ++v9;
      --length_low;
    }
    while (length_low);
  }
  if (length)
  {
    uint64_t v10 = 0;
    for (uint64_t i = 9912; ; i += 16)
    {
      long long v12 = a3[v10];
      uint64_t v13 = v12 ? v12[15] : 0;
      *(void *)(impl[242] + 8 * location + 9784) = v13;
      uint64_t v14 = impl[242];
      if ((~*(void *)(v14 + v10 * 8 + 9784) & 0x6000000000000000) == 0) {
        break;
      }
      if (v12) {
        goto LABEL_10;
      }
LABEL_12:
      impl[location++ + 1288] = v12;
      if (length == ++v10) {
        return;
      }
    }
    *(_OWORD *)(v14 + i) = *((_OWORD *)v12 + 8);
LABEL_10:
    v12 += 6;
    if (*((_DWORD *)v12 + 24)) {
      long long v12 = (void *)*((unsigned int *)v12 + 24);
    }
    goto LABEL_12;
  }
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = self->_impl;
  if (impl[185]) {
    MTLResourceListAddResource();
  }
  if (a3) {
    uint64_t v7 = *((void *)a3 + 15);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = 8 * v4;
  *(void *)(impl[242] + v8 + 9784) = v7;
  uint64_t v9 = impl[242];
  if ((~*(void *)(v9 + v8 + 9784) & 0x6000000000000000) != 0)
  {
    uint64_t v10 = (char *)(impl + 243);
    if (!a3)
    {
      uint64_t v11 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    *(_OWORD *)(v9 + 16 * v4 + 9912) = *((_OWORD *)a3 + 8);
    uint64_t v10 = (char *)(impl + 243);
  }
  uint64_t v11 = (char *)a3 + 48;
  if (*((_DWORD *)a3 + 36)) {
    uint64_t v11 = (char *)*((unsigned int *)a3 + 36);
  }
LABEL_13:
  *(void *)&v10[8 * v4 + 8360] = v11;
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  unsigned int length = a4.length;
  unsigned int location = a4.location;
  uint64_t v5 = a3;
  impl = self->_impl;
  if (LODWORD(a4.length) && impl[185])
  {
    uint64_t length_low = LODWORD(a4.length);
    uint64_t v8 = a3;
    do
    {
      if (*v8) {
        MTLResourceListAddResource();
      }
      ++v8;
      --length_low;
    }
    while (length_low);
  }
  unsigned int v50 = length;
  if (length)
  {
    v56 = (char *)(impl + 1148);
    v55 = (char *)(impl + 1150);
    v54 = (char *)(impl + 2071);
    v53 = (char *)(impl + 2073);
    uint64_t v9 = length;
    v52 = (char *)(impl + 1522);
    unsigned int v10 = location;
    unsigned int v11 = 3 * location;
    do
    {
      uint64_t v22 = (uint64_t)*v5;
      if (*v5)
      {
        uint64_t v23 = *(void *)(v22 + 536);
        uint64_t v12 = v10;
        uint64_t v24 = (_OWORD *)(impl[242] + 32 * v10 + 1592);
        long long v25 = *(_OWORD *)(v23 + 416);
        *uint64_t v24 = *(_OWORD *)(v23 + 400);
        v24[1] = v25;
        uint64_t v26 = (_OWORD *)(impl[242] + 32 * (v10 + 128) + 1592);
        long long v27 = *(_OWORD *)(v23 + 448);
        _OWORD *v26 = *(_OWORD *)(v23 + 432);
        v26[1] = v27;
        uint64_t v28 = *(void *)(v22 + 536);
        if (v28)
        {
          uint64_t v30 = *(void *)(v28 + 496);
          uint64_t v29 = *(void *)(v28 + 504);
        }
        else
        {
          uint64_t v30 = 0;
          uint64_t v29 = 0;
        }
        AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource((void *)impl[199], v22, 3u, v10);
        uint64_t v31 = (int *)MEMORY[0x263F4B188];
        impl[v11 + 1522] = v22 + (int)*MEMORY[0x263F4B188];
        if (v30) {
          uint64_t v32 = v30 + *v31;
        }
        else {
          uint64_t v32 = 0;
        }
        impl[v11 + 1523] = v32;
        if (v29) {
          uint64_t v33 = v29 + *v31;
        }
        else {
          uint64_t v33 = 0;
        }
        impl[v11 + 1524] = v33;
        v34 = (char *)&impl[7 * v10];
        long long v35 = *(_OWORD *)(v23 + 72);
        long long v36 = *(_OWORD *)(v23 + 88);
        long long v37 = *(_OWORD *)(v23 + 104);
        *((void *)v34 + 258) = *(void *)(v23 + 120);
        *((_OWORD *)v34 + 128) = v37;
        *((_OWORD *)v34 + 127) = v36;
        *((_OWORD *)v34 + 126) = v35;
        uint64_t v38 = 1 << v10;
        *(void *)&v56[8 * (v10 > 0x3F)] |= 1 << v10;
        uint64_t v39 = *(void *)(v23 + 488);
        if (v39) {
          LODWORD(v39) = *(_DWORD *)(v39 + 1080) != 0;
        }
        char v40 = v10 & 0x3F;
        *(void *)&v55[8 * (v10 > 0x3F)] = *(void *)&v55[8 * (v10 > 0x3F)] & ~v38 | ((unint64_t)v39 << (v10 & 0x3F));
        unint64_t v41 = (unint64_t)*(unsigned __int8 *)(v23 + 381) << 8;
        uint64_t v43 = v41 == 512 || v41 == 1024;
        *(void *)&v54[8 * (v10 > 0x3F)] = (v43 << v40) | *(void *)&v54[8 * (v10 > 0x3F)] & ~v38;
        *(void *)&v53[8 * (v10 > 0x3F)] = *(void *)&v53[8 * (v10 > 0x3F)] & ~v38 | ((unint64_t)(v41 == 768) << v40);
        uint64_t v14 = *(unsigned int *)(*(void *)(v22 + 536) + 120);
      }
      else
      {
        *(void *)&v52[8 * v11] = 0;
        *(void *)&v52[8 * v11 + 8] = 0;
        *(void *)&v52[8 * v11 + 16] = 0;
        uint64_t v12 = v10;
        uint64_t v13 = (char *)&impl[7 * v10];
        bzero(v13 + 2016, 0x38uLL);
        uint64_t v14 = 0;
        *((_DWORD *)v13 + 516) = 0;
        uint64_t v15 = 8 * (v10 > 0x3F);
        *(void *)&v56[v15] &= ~(1 << v10);
        *(void *)&v55[v15] &= ~(1 << v10);
        uint64_t v16 = *(void *)(impl[182] + 808);
        unsigned int v17 = (_OWORD *)(impl[242] + 32 * v10 + 1592);
        long long v18 = *(_OWORD *)(v16 + 7328);
        *unsigned int v17 = *(_OWORD *)(v16 + 7312);
        v17[1] = v18;
        uint64_t v19 = *(void *)(impl[182] + 808);
        long long v20 = (_OWORD *)(impl[242] + 32 * (v10 + 128) + 1592);
        long long v21 = *(_OWORD *)(v19 + 7360);
        *long long v20 = *(_OWORD *)(v19 + 7344);
        v20[1] = v21;
        *(void *)&v54[v15] &= ~(1 << v10);
        *(void *)&v53[v15] &= ~(1 << v10);
      }
      impl[v12 + 1160] = v14;
      ++v10;
      ++v5;
      v11 += 3;
      --v9;
    }
    while (v9);
  }
  unsigned int v44 = v50 + location;
  if (v50 + location == 128) {
    uint64_t v45 = -1;
  }
  else {
    uint64_t v45 = ~(-1 << (v50 + location));
  }
  if (v44 < 0x40) {
    uint64_t v46 = ~(-1 << (v50 + location));
  }
  else {
    uint64_t v46 = -1;
  }
  if (v44 >= 0x40) {
    uint64_t v47 = v45;
  }
  else {
    uint64_t v47 = 0;
  }
  uint64_t v48 = -1 << location;
  if (location < 0x40) {
    uint64_t v48 = -1;
  }
  uint64_t v49 = -1 << location;
  if (location >= 0x40) {
    uint64_t v49 = 0;
  }
  impl[2080] |= v46 & v49;
  impl[2081] |= v47 & v48;
  *((_DWORD *)impl + 4164) |= 2u;
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  impl = self->_impl;
  if (a3)
  {
    uint64_t v7 = *((void *)a3 + 67);
    uint64_t v8 = a4;
    uint64_t v9 = (_OWORD *)(impl[242] + 32 * a4 + 1592);
    long long v10 = *(_OWORD *)(v7 + 416);
    *uint64_t v9 = *(_OWORD *)(v7 + 400);
    v9[1] = v10;
    unsigned int v11 = (_OWORD *)(impl[242] + 32 * (a4 + 128) + 1592);
    long long v12 = *(_OWORD *)(v7 + 448);
    *unsigned int v11 = *(_OWORD *)(v7 + 432);
    v11[1] = v12;
    uint64_t v13 = *((void *)a3 + 67);
    if (v13)
    {
      uint64_t v15 = *(void *)(v13 + 496);
      uint64_t v14 = *(void *)(v13 + 504);
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v14 = 0;
    }
    AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource((void *)impl[199], (uint64_t)a3, 3u, a4);
    int v28 = 3 * v4;
    uint64_t v29 = (int *)MEMORY[0x263F4B188];
    impl[3 * v4 + 1522] = (char *)a3 + (int)*MEMORY[0x263F4B188];
    if (v15) {
      uint64_t v30 = v15 + *v29;
    }
    else {
      uint64_t v30 = 0;
    }
    impl[(v28 + 1) + 1522] = v30;
    if (v14) {
      uint64_t v31 = v14 + *v29;
    }
    else {
      uint64_t v31 = 0;
    }
    impl[(v28 + 2) + 1522] = v31;
    uint64_t v32 = (uint64_t)&impl[7 * v8 + 243];
    long long v33 = *(_OWORD *)(v7 + 72);
    long long v34 = *(_OWORD *)(v7 + 88);
    long long v35 = *(_OWORD *)(v7 + 104);
    *(void *)(v32 + 120) = *(void *)(v7 + 120);
    *(_OWORD *)(v32 + 104) = v35;
    *(_OWORD *)(v32 + 88) = v34;
    *(_OWORD *)(v32 + 72) = v33;
    char v36 = v4 & 0x3F;
    uint64_t v37 = 1 << v4;
    impl[(v4 > 0x3F) + 1148] |= 1 << v4;
    uint64_t v38 = *(void *)(v7 + 488);
    if (v38) {
      uint64_t v38 = *(_DWORD *)(v38 + 1080) != 0;
    }
    uint64_t v39 = v4 > 0x3F;
    char v40 = (char *)&impl[v39];
    impl[v39 + 1150] = impl[v39 + 1150] & ~v37 | (v38 << v36);
    unint64_t v41 = (unint64_t)*(unsigned __int8 *)(v7 + 381) << 8;
    uint64_t v43 = v41 == 512 || v41 == 1024;
    *((void *)v40 + 2071) = (v43 << v36) | *((void *)v40 + 2071) & ~v37;
    *((void *)v40 + 2073) = *((void *)v40 + 2073) & ~v37 | ((unint64_t)(v41 == 768) << v36);
    impl[v39 + 2080] |= v37;
    *((_DWORD *)impl + 4164) |= 2u;
    if (impl[185]) {
      MTLResourceListAddResource();
    }
    uint64_t v17 = *(unsigned int *)(*((void *)a3 + 67) + 120);
  }
  else
  {
    impl[(3 * a4) + 1522] = 0;
    impl[(3 * a4 + 1) + 1522] = 0;
    impl[(3 * a4 + 2) + 1522] = 0;
    uint64_t v8 = a4;
    uint64_t v16 = (uint64_t)&impl[7 * a4 + 243];
    bzero((void *)(v16 + 72), 0x38uLL);
    uint64_t v17 = 0;
    *(_DWORD *)(v16 + 120) = 0;
    uint64_t v18 = v4 > 0x3F;
    uint64_t v19 = (char *)&impl[v18 + 243];
    *((void *)v19 + 905) &= ~(1 << v4);
    *((void *)v19 + 907) &= ~(1 << v4);
    uint64_t v20 = *(void *)(impl[182] + 808);
    long long v21 = *(_OWORD *)(v20 + 7312);
    long long v22 = *(_OWORD *)(v20 + 7328);
    uint64_t v23 = (_OWORD *)(impl[242] + 32 * v8 + 1592);
    _OWORD *v23 = v21;
    v23[1] = v22;
    uint64_t v24 = *(void *)(impl[182] + 808);
    long long v25 = (_OWORD *)(impl[242] + 32 * (v4 + 128) + 1592);
    long long v26 = *(_OWORD *)(v24 + 7360);
    *long long v25 = *(_OWORD *)(v24 + 7344);
    v25[1] = v26;
    long long v27 = (char *)&impl[v18];
    *((void *)v27 + 2071) &= ~(1 << v4);
    *((void *)v27 + 2073) &= ~(1 << v4);
  }
  impl[v8 + 1160] = v17;
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  unsigned int v4 = a4;
  int v7 = [(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation];
  impl = self->_impl;
  impl[v4 + 1906] = 0;
  if (!v7)
  {
    if (a3)
    {
      *(void *)(impl[242] + 8 * v4 + 536) = *((unsigned int *)a3 + 86);
      uint64_t v18 = [a3 buffer];
      uint64_t v19 = (int *)MEMORY[0x263F4B188];
      unint64_t v20 = *(void *)(v18 + (int)*MEMORY[0x263F4B188] + 8);
      uint64_t v21 = *(void *)([a3 buffer] + *v19 + 24);
      int v22 = *(_DWORD *)([a3 buffer] + *v19 + 16);
      uint64_t v23 = &impl[v4];
      v23[1941] = v20;
      v23[2006] = v21;
      uint64_t v24 = (_DWORD *)impl + v4;
      v24[2682] = v22;
      v24[2747] = v22;
      v24[2812] = v20 >> 8;
      uint64_t v25 = [a3 buffer];
      v23[1457] = v25 + *v19;
      AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource((void *)impl[199], v25, 0, v4);
      if (impl[185]) {
        MTLResourceListAddResource();
      }
      goto LABEL_9;
    }
LABEL_10:
    long long v26 = &impl[v4];
    v26[1457] = 0;
    long long v27 = (void *)(impl[242] + 8 * v4);
    v27[67] = impl[237];
    void *v27 = 0;
    v26[1941] = impl[237];
    v26[2006] = 0;
    int v28 = (char *)impl + 4 * v4;
    *((_DWORD *)v28 + 2682) = 0;
    *((_DWORD *)v28 + 2747) = 0;
    goto LABEL_11;
  }
  if (!a3) {
    goto LABEL_10;
  }
  *(void *)(impl[242] + 8 * v4 + 536) = *((unsigned int *)a3 + 80);
  uint64_t v9 = [a3 buffer];
  long long v10 = (int *)MEMORY[0x263F4B188];
  unint64_t v11 = *(void *)(v9 + (int)*MEMORY[0x263F4B188] + 8);
  uint64_t v12 = *(void *)([a3 buffer] + *v10 + 24);
  int v13 = *(_DWORD *)([a3 buffer] + *v10 + 16);
  uint64_t v14 = &impl[v4];
  v14[1941] = v11;
  v14[2006] = v12;
  uint64_t v15 = (_DWORD *)impl + v4;
  v15[2682] = v13;
  v15[2747] = v13;
  v15[2812] = v11 >> 8;
  uint64_t v16 = [a3 buffer];
  v14[1457] = v16 + *v10;
  AGX::ResourceGroupUsage<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setResource((void *)impl[199], v16, 0, v4);
  if (impl[185]) {
    MTLResourceListAddResource();
  }
  uint64_t v17 = (os_unfair_lock_s *)(*((void *)a3 + 41) + 40);
  os_unfair_lock_lock(v17);
  os_unfair_lock_unlock(v17);
LABEL_9:
  [a3 buffer];
LABEL_11:
  impl[(v4 > 0x3F) + 2078] |= 1 << v4;
  *((_DWORD *)impl + 4164) |= 1u;
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
}

- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  impl = self->_impl;
  uint64_t v6 = a5;
  uint64_t v7 = impl[v6 + 2006];
  unint64_t v8 = impl[v6 + 1941] + a3;
  uint64_t v9 = (void *)(impl[242] + v6 * 8);
  v9[67] = v8;
  *uint64_t v9 = v7 + a3;
  if (a5 <= 0x22) {
    *((_DWORD *)impl + a5 + 2647) = a4;
  }
  *((_DWORD *)impl + a5 + 2747) = *((_DWORD *)impl + a5 + 2682);
  *((_DWORD *)impl + 4164) |= 1u;
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  impl = self->_impl;
  uint64_t v5 = a4;
  uint64_t v6 = impl[v5 + 2006];
  unint64_t v7 = impl[v5 + 1941] + a3;
  unint64_t v8 = (void *)(impl[242] + v5 * 8);
  v8[67] = v7;
  *unint64_t v8 = v6 + a3;
  if (a4 <= 0x22) {
    *((_DWORD *)impl + a4 + 2647) = 0;
  }
  *((_DWORD *)impl + a4 + 2747) = *((_DWORD *)impl + a4 + 2682);
  *((_DWORD *)impl + 4164) |= 1u;
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    v9.receiver = self;
    v9.super_class = (Class)AGXG17FamilyComputeContext;
    -[IOGPUMetalComputeCommandEncoder setIntersectionFunctionTables:withBufferRange:](&v9, sel_setIntersectionFunctionTables_withBufferRange_, a3, location, length);
  }
  else
  {
    for (; length; --length)
    {
      uint64_t v8 = (uint64_t)*a3++;
      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setIntersectionFunctionTable((uint64_t)self->_impl, v8, location);
      LODWORD(location) = location + 1;
    }
  }
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation])
  {
    v8.receiver = self;
    v8.super_class = (Class)AGXG17FamilyComputeContext;
    [(IOGPUMetalComputeCommandEncoder *)&v8 setIntersectionFunctionTable:a3 atBufferIndex:a4];
  }
  else
  {
    impl = self->_impl;
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setIntersectionFunctionTable((uint64_t)impl, (uint64_t)a3, a4);
  }
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    unsigned int location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setBuffer((uint64_t)self->_impl, v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    unsigned int location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setBuffer((uint64_t)self->_impl, v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  unsigned int v6 = a6;
  impl = self->_impl;
  if (a6 <= 0x22) {
    impl[a6 + 2647] = a5;
  }
  unint64_t v10 = a4 + 15;
  unint64_t v11 = (a4 + 15) | 0xF;
  uint64_t v12 = *((void *)impl + 20);
  uint64_t v13 = v12 + v11;
  if (v12 + v11 <= *((void *)impl + 19)) {
    goto LABEL_4;
  }
  int v18 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 4, 3, 0);
  uint64_t v12 = *((void *)impl + 20);
  if (v18)
  {
    uint64_t v13 = v12 + v11;
    if (v12 + v11 > *((void *)impl + 19)) {
      abort();
    }
LABEL_4:
    *((void *)impl + 21) = v13;
  }
  uint64_t v14 = (char *)((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *((void *)impl + 22);
  *((void *)impl + 20) = &v14[v10 & 0xFFFFFFFFFFFFFFF0];
  if (v6 <= 0x22) {
    *(void *)&impl[2 * v6 + 3812] = 0;
  }
  *(void *)&impl[2 * (v6 > 0x3F) + 4156] |= 1 << v6;
  unint64_t v16 = (unint64_t)&v14[v15];
  impl[4164] |= 1u;
  *(void *)(*((void *)impl + 242) + 8 * v6 + 536) = v16;
  *(void *)&impl[2 * v6 + 2914] = *(void *)(*((void *)impl + 5) + 224) + (int)*MEMORY[0x263F4B188];
  uint64_t v17 = &impl[v6];
  v17[2682] = a4;
  v17[2747] = a4;
  v17[2812] = v16 >> 8;

  memcpy(v14, a3, a4);
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v5 = a5;
  impl = self->_impl;
  if (a5 <= 0x22) {
    impl[a5 + 2647] = 0;
  }
  unint64_t v9 = a4 + 15;
  unint64_t v10 = (a4 + 15) | 0xF;
  uint64_t v11 = *((void *)impl + 20);
  uint64_t v12 = v11 + v10;
  if (v11 + v10 <= *((void *)impl + 19)) {
    goto LABEL_4;
  }
  int v17 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 4, 3, 0);
  uint64_t v11 = *((void *)impl + 20);
  if (v17)
  {
    uint64_t v12 = v11 + v10;
    if (v11 + v10 > *((void *)impl + 19)) {
      abort();
    }
LABEL_4:
    *((void *)impl + 21) = v12;
  }
  uint64_t v13 = (char *)((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *((void *)impl + 22);
  *((void *)impl + 20) = &v13[v9 & 0xFFFFFFFFFFFFFFF0];
  if (v5 <= 0x22) {
    *(void *)&impl[2 * v5 + 3812] = 0;
  }
  *(void *)&impl[2 * (v5 > 0x3F) + 4156] |= 1 << v5;
  unint64_t v15 = (unint64_t)&v13[v14];
  impl[4164] |= 1u;
  *(void *)(*((void *)impl + 242) + 8 * v5 + 536) = v15;
  *(void *)&impl[2 * v5 + 2914] = *(void *)(*((void *)impl + 5) + 224) + (int)*MEMORY[0x263F4B188];
  unint64_t v16 = &impl[v5];
  v16[2682] = a4;
  v16[2747] = a4;
  v16[2812] = v15 >> 8;

  memcpy(v13, a3, a4);
}

- (void)setComputePipelineState:(id)a3
{
  impl = self->_impl;
  if (impl[185]) {
    MTLResourceListAddResource();
  }

  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::setPipelineCommon((uint64_t)impl, (uint64_t)a3 + 64);
}

- (void)insertCompressedTextureReinterpretationFlush
{
  impl = self->_impl;
  int v3 = *((unsigned __int8 *)impl + 16677);
  BOOL v4 = impl[4172] != 0;
  int v5 = impl[4173];
  int v7 = 0;
  agxaReserveCDMTokenSpace<AGX::HAL200::Encoders,AGX::HAL200::DataBufferAllocator>(22, (uint64_t)(impl + 4), 4, v3, v4, v5, &v7);
  unsigned int v6 = (_DWORD *)*((void *)impl + 96);
  *unsigned int v6 = 1610613116;
  *((void *)impl + 96) = v6 + 1;
}

- (void)enableNullBufferBinds:(BOOL)a3
{
  *((void *)self->_impl + 237) = 0;
}

- (unint64_t)getDriverUniqueID
{
  return self->_markerID;
}

- (id)reInitWithCommandBuffer:(id)a3
{
  impl = self->_impl;
  if (*(_DWORD *)*MEMORY[0x263F4B1E8])
  {
    IOGPUDeviceTraceEvent();
    impl = self->_impl;
  }
  uint64_t v6 = *(void *)(impl[182] + 808);
  *((_DWORD *)impl + 4168) = *(_DWORD *)(v6 + 5176);
  int v7 = *(void **)(v6 + 5688);
  if (v7)
  {
    do
    {
      IOGPUResourceListAddResource();
      int v7 = (void *)*v7;
    }
    while (v7);
    uint64_t v6 = *(void *)(impl[182] + 808);
  }
  for (uint64_t i = *(void **)(v6 + 5520); i; uint64_t i = (void *)*i)
    IOGPUResourceListAddResource();
  unint64_t v9 = (objc_class *)a3;
  uint64_t v10 = (int)*MEMORY[0x263F12B70];
  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = v9;
  uint64_t v11 = *(void *)(*((void *)v9 + 82) + 96);
  [(IOGPUMetalCommandEncoder *)self setLabel:&stru_26F8544F8];
  uint64_t v12 = self->_impl;
  if (v12[4172] >= 2u)
  {
    v12[4173] = 0;
    *((void *)v12 + 2087) = 0;
    std::__tree<std::__value_type<AGX::scissorMapInfo<AGX::HAL200::Encoders>,unsigned int>,std::__map_value_compare<AGX::scissorMapInfo<AGX::HAL200::Encoders>,std::__value_type<AGX::scissorMapInfo<AGX::HAL200::Encoders>,unsigned int>,std::less<AGX::scissorMapInfo<AGX::HAL200::Encoders>>,true>,std::allocator<std::__value_type<AGX::scissorMapInfo<AGX::HAL200::Encoders>,unsigned int>>>::destroy(*((void **)v12 + 2090));
    *((void *)v12 + 2089) = v12 + 4180;
    *((void *)v12 + 2091) = 0;
    *((void *)v12 + 2090) = 0;
  }
  [*(id *)((char *)&self->super.super.super.super.super.isa + v10) setCurrentCommandEncoder:self];
  if ([*(id *)((char *)&self->super.super.super.super.super.isa + v10) getSupportedAndEnabledErrorOptions])
  {
    [(MTLDevice *)[(_MTLCommandEncoder *)self device] deviceRef];
    self->_markerID = IOGPUDeviceGetNextGlobalTraceID();
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::issueProgressMarkerDispatch((uint64_t)self->_impl, [(IOGPUMetalCommandEncoder *)self globalTraceObjectID], v11);
  }
  [a3 setPreviousComputeCommandEncoder:0];
  return self;
}

- (void)deferredEndEncoding
{
  if (self->_impl)
  {
    if ([(IOGPUMetalCommandEncoder *)self globalTraceObjectID] != self->_markerID
      && ([*(id *)self->_impl getSupportedAndEnabledErrorOptions] & 1) != 0)
    {
      AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::issueProgressMarkerDispatch((uint64_t)self->_impl, [(IOGPUMetalCommandEncoder *)self globalTraceObjectID], self->_markerID);
    }
    impl = self->_impl;
    if (*((_DWORD *)impl + 470) == 1)
    {
      BOOL v4 = (_WORD *)impl[2170];
      if (v4)
      {
        if (!*v4)
        {
          uint64_t v5 = impl[2171];
          *(void *)&long long v6 = 0x6000000060000000;
          *((void *)&v6 + 1) = 0x6000000060000000;
          *(_OWORD *)uint64_t v5 = v6;
          *(_OWORD *)(v5 + 16) = v6;
          *(void *)(v5 + 32) = 0x6000000060000000;
        }
      }
    }
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::endComputePass(impl, 0, 22);
  }

  [(AGXG17FamilyComputeContext *)self destroyImpl];
}

- (void)endEncoding
{
  if (self->_impl)
  {
    uint64_t v3 = (int)*MEMORY[0x263F12B70];
    BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    if (!v4)
    {
      MTLReportFailure();
      BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    }
    uint64_t v5 = [v4 device];
    impl = self->_impl;
    unint64_t v7 = impl[2157];
    unint64_t v8 = impl[2158];
    atomic_fetch_or((atomic_ullong *volatile)(v5 + 816), v7);
    atomic_fetch_or((atomic_ullong *volatile)(v5 + 824), v8);
    unint64_t v9 = self->_impl;
    if (*(_DWORD *)*MEMORY[0x263F4B1E8])
    {
      IOGPUDeviceTraceEvent();
      unint64_t v9 = self->_impl;
    }
    {
      if (v30)
      {
        AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::checkCoalescingMemoryThreshold(void)::coalescing_threshold_override = 0;
      }
    }
    uint64_t v11 = v9[187];
    unint64_t v12 = *(void *)(v11 + 528);
    uint64_t v13 = *(void *)(v11 + 520);
    unint64_t v14 = v10[410];
    if (!v14) {
      unint64_t v14 = v12 >> 4;
    }
    if (v12 - v13 >= v14) {
      goto LABEL_48;
    }
    if ([(AGXG17FamilyComputeContext *)self dispatchType] == 1)
    {
      unint64_t v15 = self->_impl;
      if (*((_DWORD *)v15 + 471) == 1)
      {
        uint64_t v16 = v15[2085];
        if (!v16) {
          operator new();
        }
        int v17 = *(void **)(v16 + 24);
        if (v17)
        {
          unint64_t v18 = *(void *)(v16 + 56);
          if (v18)
          {
            uint64_t v19 = *(void *)(v16 + 48);
            unint64_t v20 = v18 - 1;
            if ((v18 & (v18 - 1)) != 0)
            {
              do
              {
                uint64_t v23 = v17[2];
                unint64_t v24 = v23;
                if (v18 <= v23) {
                  unint64_t v24 = v23 % v18;
                }
                uint64_t v25 = *(uint64_t **)(v19 + 8 * v24);
                if (v25)
                {
                  while (1)
                  {
                    uint64_t v25 = (uint64_t *)*v25;
                    if (!v25) {
                      break;
                    }
                    unint64_t v26 = v25[1];
                    if (v26 == v23)
                    {
                      if (*((_DWORD *)v25 + 4) == v23)
                      {
                        if ((*((unsigned char *)v25 + 20) & 2) == 0 && (v23 & 0x200000000) == 0) {
                          break;
                        }
                        goto LABEL_21;
                      }
                    }
                    else
                    {
                      if (v26 >= v18) {
                        v26 %= v18;
                      }
                      if (v26 != v24) {
                        break;
                      }
                    }
                  }
                }
                int v17 = (void *)*v17;
              }
              while (v17);
            }
            else
            {
              int v21 = v18 - 1;
              do
              {
                uint64_t v27 = v17[2];
                int v28 = *(uint64_t **)(v19 + 8 * (v21 & v27));
                if (v28)
                {
                  while (1)
                  {
                    int v28 = (uint64_t *)*v28;
                    if (!v28) {
                      break;
                    }
                    uint64_t v29 = v28[1];
                    if (v29 == v27)
                    {
                      if (*((_DWORD *)v28 + 4) == v27)
                      {
                        if ((*((unsigned char *)v28 + 20) & 2) == 0 && (v27 & 0x200000000) == 0) {
                          break;
                        }
                        goto LABEL_21;
                      }
                    }
                    else if ((v29 & v20) != (v21 & v27))
                    {
                      break;
                    }
                  }
                }
                int v17 = (void *)*v17;
              }
              while (v17);
            }
          }
          else
          {
            do
              int v17 = (void *)*v17;
            while (v17);
          }
        }
        if (*(void *)v16) {
          **(_DWORD **)uint64_t v16 = 1610612736;
        }
      }
    }
LABEL_21:
    int v22 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    if (v22[696]) {
LABEL_48:
    }
      [(AGXG17FamilyComputeContext *)self deferredEndEncoding];
    else {
      [v22 setPreviousComputeCommandEncoder:self];
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)AGXG17FamilyComputeContext;
  [(IOGPUMetalCommandEncoder *)&v31 endEncoding];
}

- (void)dealloc
{
  [(AGXG17FamilyComputeContext *)self destroyImpl];
  v3.receiver = self;
  v3.super_class = (Class)AGXG17FamilyComputeContext;
  [(_MTLCommandEncoder *)&v3 dealloc];
}

- (void)destroyImpl
{
  if (!self->_impl) {
    return;
  }
  objc_super v3 = *(os_unfair_lock_s **)([(_MTLCommandEncoder *)self device] + 808);
  impl = self->_impl;
  uint64_t v5 = (void *)*((void *)impl + 242);
  if (!v5)
  {
LABEL_5:
    uint64_t v8 = *((void *)impl + 2075);
    if (!v8) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
  long long v6 = *(os_unfair_lock_s **)(*((void *)impl + 182) + 808);
  os_unfair_lock_lock(v6 + 1699);
  uint64_t os_unfair_lock_opaque = v6[1698]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque <= 0xF)
  {
    v6[1698]._uint64_t os_unfair_lock_opaque = os_unfair_lock_opaque + 1;
    *(void *)&v6[2 * os_unfair_lock_opaque + 1700]._uint64_t os_unfair_lock_opaque = v5;
    os_unfair_lock_unlock(v6 + 1699);
    goto LABEL_5;
  }
  os_unfair_lock_unlock(v6 + 1699);
  free(v5);
  uint64_t v8 = *((void *)impl + 2075);
  if (!v8)
  {
LABEL_6:
    uint64_t v9 = *((void *)impl + 2076);
    if (!v9) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_22:
  unint64_t v19 = *(void *)(v8 + 512);
  if (v19)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    do
    {
      uint64_t v21 = *(void *)(v8 + 520);
      uint64_t v22 = *(void *)(v8 + 8 * __clz(__rbit64(v19)));
      uint64_t v23 = *(NSObject **)(v21 + 16);
      uint64_t v38 = v20;
      uint64_t v39 = 3221225472;
      char v40 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
      unint64_t v41 = &__block_descriptor_48_e5_v8__0l;
      uint64_t v42 = v21;
      uint64_t v43 = v22;
      dispatch_sync(v23, &v38);
      unint64_t v19 = (*(void *)(v8 + 512) - 1) & *(void *)(v8 + 512);
      *(void *)(v8 + 512) = v19;
    }
    while (v19);
  }
  MEMORY[0x24566ED90](v8, 0x1020C40C758419CLL);
  uint64_t v9 = *((void *)impl + 2076);
  if (!v9)
  {
LABEL_7:
    uint64_t v10 = (void *)*((void *)impl + 2085);
    if (!v10) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_26:
  unint64_t v24 = *(void *)(v9 + 512);
  if (v24)
  {
    uint64_t v25 = MEMORY[0x263EF8330];
    do
    {
      uint64_t v26 = *(void *)(v9 + 520);
      uint64_t v27 = *(void *)(v9 + 8 * __clz(__rbit64(v24)));
      int v28 = *(NSObject **)(v26 + 16);
      uint64_t v38 = v25;
      uint64_t v39 = 3221225472;
      char v40 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
      unint64_t v41 = &__block_descriptor_48_e5_v8__0l;
      uint64_t v42 = v26;
      uint64_t v43 = v27;
      dispatch_sync(v28, &v38);
      unint64_t v24 = (*(void *)(v9 + 512) - 1) & *(void *)(v9 + 512);
      *(void *)(v9 + 512) = v24;
    }
    while (v24);
  }
  MEMORY[0x24566ED90](v9, 0x1020C40C758419CLL);
  uint64_t v10 = (void *)*((void *)impl + 2085);
  if (!v10)
  {
LABEL_8:
    uint64_t v11 = (char *)*((void *)impl + 2163);
    if (!v11) {
      goto LABEL_9;
    }
LABEL_39:
    long long v35 = (char *)*((void *)impl + 2164);
    char v36 = v11;
    if (v35 != v11)
    {
      do
      {
        uint64_t v37 = (void *)*((void *)v35 - 3);
        if (v37)
        {
          *((void *)v35 - 2) = v37;
          operator delete(v37);
        }
        v35 -= 64;
      }
      while (v35 != v11);
      char v36 = (char *)*((void *)impl + 2163);
    }
    *((void *)impl + 2164) = v11;
    operator delete(v36);
    unint64_t v12 = (void *)*((void *)impl + 2160);
    if (!v12) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_30:
  uint64_t v29 = (void *)v10[8];
  if (v29)
  {
    do
    {
      int v30 = (void *)*v29;
      operator delete(v29);
      uint64_t v29 = v30;
    }
    while (v30);
  }
  objc_super v31 = (void *)v10[6];
  v10[6] = 0;
  if (v31) {
    operator delete(v31);
  }
  uint64_t v32 = (void *)v10[3];
  if (v32)
  {
    do
    {
      long long v33 = (void *)*v32;
      operator delete(v32);
      uint64_t v32 = v33;
    }
    while (v33);
  }
  long long v34 = (void *)v10[1];
  v10[1] = 0;
  if (v34) {
    operator delete(v34);
  }
  MEMORY[0x24566ED90](v10, 0x10A0C40B4CCAB04);
  uint64_t v11 = (char *)*((void *)impl + 2163);
  if (v11) {
    goto LABEL_39;
  }
LABEL_9:
  unint64_t v12 = (void *)*((void *)impl + 2160);
  if (v12)
  {
LABEL_10:
    *((void *)impl + 2161) = v12;
    operator delete(v12);
  }
LABEL_11:
  std::deque<AGX::ControlFlowContext<AGX::HAL200::ComputeControlFlowEmitter,AGX::HAL200::ComputeUSCStateLoader,AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block,std::allocator<AGX::ControlFlowContext<AGX::HAL200::ComputeControlFlowEmitter,AGX::HAL200::ComputeUSCStateLoader,AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block>>::~deque[abi:nn180100]((uint64_t)impl + 17112);
  std::__tree<std::__value_type<AGX::scissorMapInfo<AGX::HAL200::Encoders>,unsigned int>,std::__map_value_compare<AGX::scissorMapInfo<AGX::HAL200::Encoders>,std::__value_type<AGX::scissorMapInfo<AGX::HAL200::Encoders>,unsigned int>,std::less<AGX::scissorMapInfo<AGX::HAL200::Encoders>>,true>,std::allocator<std::__value_type<AGX::scissorMapInfo<AGX::HAL200::Encoders>,unsigned int>>>::destroy(*((void **)impl + 2090));
  uint64_t v13 = (void **)*((void *)impl + 215);
  if (v13)
  {
    free(*v13);
    MEMORY[0x24566ED90](v13, 0x1020C4014030ADELL);
  }
  unint64_t v14 = (void **)*((void *)impl + 177);
  unint64_t v15 = (void **)*((void *)impl + 178);
  if (v14 != v15)
  {
    do
    {
      uint64_t v16 = *v14++;
      free(v16);
    }
    while (v14 != v15);
    unint64_t v14 = (void **)*((void *)impl + 177);
  }
  if (v14)
  {
    *((void *)impl + 178) = v14;
    operator delete(v14);
  }
  int v17 = self->_impl;
  if (v17)
  {
    os_unfair_lock_lock(v3 + 1679);
    uint64_t v18 = v3[1678]._os_unfair_lock_opaque;
    if (v18 > 7)
    {
      os_unfair_lock_unlock(v3 + 1679);
      free(v17);
    }
    else
    {
      v3[1678]._uint64_t os_unfair_lock_opaque = v18 + 1;
      *(void *)&v3[2 * v18 + 1680]._uint64_t os_unfair_lock_opaque = v17;
      os_unfair_lock_unlock(v3 + 1679);
    }
  }
  self->_impl = 0;
}

- (AGXG17FamilyComputeContext)initWithCommandBuffer:(id)a3 config:(EncoderComputeServiceConfig *)a4
{
  v66.receiver = self;
  v66.super_class = (Class)AGXG17FamilyComputeContext;
  long long v6 = -[IOGPUMetalCommandEncoder initWithCommandBuffer:](&v66, sel_initWithCommandBuffer_);
  if (!v6) {
    return v6;
  }
  uint64_t v7 = *(void *)([a3 device] + 808);
  if (*(void *)(v7 + 6704) >> 5 <= 0x21EuLL)
  {
    v6->_impl = 0;
    goto LABEL_59;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 6716));
  int v8 = *(_DWORD *)(v7 + 6712);
  if (v8)
  {
    unsigned int v9 = v8 - 1;
    *(_DWORD *)(v7 + 6712) = v9;
    uint64_t v10 = *(char **)(v7 + 8 * v9 + 6720);
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 6716));
    if (v10)
    {
      bzero(v10, *(void *)(v7 + 6704));
      p_impl = (uint64_t *)&v6->_impl;
      v6->_impl = v10;
      goto LABEL_9;
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 6716));
  }
  uint64_t v13 = (char *)malloc_type_calloc(*(void *)(v7 + 6704), 1uLL, 0xC8454162uLL);
  p_impl = (uint64_t *)&v6->_impl;
  v6->_impl = v13;
  if (!v13)
  {
LABEL_59:
    [(AGXG17FamilyComputeContext *)v6 endEncoding];

    return 0;
  }
  uint64_t v10 = v13;
LABEL_9:
  a4->var2 = v6;
  var0 = a4->var0;
  var1 = a4->var1;
  var4 = (MTLComputePassDescriptor *)a4->var4;
  int var5 = a4->var5;
  unsigned int var6 = a4->var6;
  BOOL var8 = a4->var8;
  [(_MTLCommandEncoder *)v6 numThisEncoder];
  uint64_t v17 = [var1 commandBufferStorage];
  uint64_t v18 = [var1 globalTraceObjectID];
  uint64_t v19 = [(IOGPUMetalCommandEncoder *)v6 globalTraceObjectID];
  uint64_t v20 = var0[101] + 5864;
  *(void *)&long long block = MEMORY[0x263EF8330];
  *((void *)&block + 1) = 3221225472;
  *(void *)&long long v68 = ___ZN3AGX21ComputeUSCStateLoaderINS_6HAL2008EncodersENS1_7ClassesEE17dataBufferConfigsERK16AGXGPUCoreConfig_block_invoke;
  *((void *)&v68 + 1) = &__block_descriptor_40_e5_v8__0l;
  uint64_t v69 = v20;
  v63 = p_impl;
  if (AGX::ComputeUSCStateLoader<AGX::HAL200::Encoders,AGX::HAL200::Classes>::dataBufferConfigs(AGXGPUCoreConfig const&)::once != -1) {
    dispatch_once(&AGX::ComputeUSCStateLoader<AGX::HAL200::Encoders,AGX::HAL200::Classes>::dataBufferConfigs(AGXGPUCoreConfig const&)::once, &block);
  }
  *((void *)v10 + 2) = &AGX::ComputeUSCStateLoader<AGX::HAL200::Encoders,AGX::HAL200::Classes>::databuffer_configs;
  uint64_t v21 = v10 + 16;
  *(void *)uint64_t v10 = var1;
  *((void *)v10 + 1) = v17;
  *((void *)v10 + 3) = var0;
  *((void *)v10 + 4) = v17;
  uint64_t v22 = *(void *)(v17 + 768);
  *((void *)v10 + 177) = 0;
  *((_OWORD *)v10 + 89) = 0u;
  *((_DWORD *)v10 + 360) = 0;
  *((void *)v10 + 5) = v22;
  *((void *)v10 + 6) = v17 + 144;
  *((void *)v10 + 181) = *(void *)(v17 + 784);
  *((void *)v10 + 183) = v17;
  *((void *)v10 + 184) = v17 + 64;
  v10[1504] = 0;
  v10[1545] = 0;
  *((void *)v10 + 197) = v18;
  *((void *)v10 + 198) = v19;
  *((void *)v10 + 199) = var1[86] + 24;
  *((_OWORD *)v10 + 100) = 0u;
  *((void *)v10 + 202) = 0xFFFFFFFF00000001;
  *((void *)v10 + 203) = 1610612736;
  *((void *)v10 + 208) = 0;
  *((_OWORD *)v10 + 103) = 0u;
  *((_OWORD *)v10 + 102) = 0u;
  *(void *)&long long v23 = -1;
  *((void *)&v23 + 1) = -1;
  *(_OWORD *)(v10 + 1704) = v23;
  *(_OWORD *)(v10 + 1688) = v23;
  *(_OWORD *)(v10 + 1672) = v23;
  *((void *)v10 + 182) = var0;
  *(_OWORD *)(v10 + 1480) = *(_OWORD *)(v17 + 728);
  *((void *)v10 + 187) = v17 + 144;
  *((void *)v10 + 194) = *(void *)(v17 + 48);
  *((void *)v10 + 195) = *(void *)(v17 + 56);
  *((_DWORD *)v10 + 377) = v19;
  *(void *)(v10 + 1516) = 0xFFFFFFFF00000000;
  *((_DWORD *)v10 + 385) = 0;
  v10[1544] = 1;
  uint64_t v24 = var0[101];
  if (var8) {
    operator new();
  }
  uint64_t v25 = v10 + 1720;
  *((void *)v10 + 215) = 0;
  *((void *)v10 + 217) = 0;
  *((_DWORD *)v10 + 436) = 0;
  *((void *)v10 + 216) = v24 + 6000;
  int v26 = *(_DWORD *)(v24 + 5876);
  *((_DWORD *)v10 + 437) = 96 * v26;
  *((_DWORD *)v10 + 438) = v26;
  uint64_t v27 = var0[101];
  unsigned int v28 = *(_DWORD *)(v27 + 5912);
  v29.i32[1] = 1792;
  v29.i32[0] = (((96 * (*(_DWORD *)(v27 + 5876) / v28) + 367) & 0xFFFFFFE0) + 127) & 0xFFFFFF80;
  int32x2_t v30 = vmla_s32((int32x2_t)0xD8000000080, v29, vdup_n_s32(v28));
  *(void *)&long long v31 = v30.u32[0];
  *((void *)&v31 + 1) = v30.u32[1];
  *((_OWORD *)v10 + 110) = v31;
  BOOL v32 = v28 == 1;
  if (v28 == 1) {
    uint64_t v33 = 640;
  }
  else {
    uint64_t v33 = (640 * v28 + 671) & 0xFFFFFF80;
  }
  *((void *)v10 + 222) = v33;
  LODWORD(v34) = 1632 * v28 + 2016;
  if (v32) {
    uint64_t v34 = 1632;
  }
  else {
    uint64_t v34 = v34;
  }
  *((void *)v10 + 223) = v33 + v34;
  *((void *)v10 + 224) = v25;
  *((void *)v10 + 225) = v21;
  *((_OWORD *)v10 + 114) = 0u;
  *((_OWORD *)v10 + 115) = 0u;
  *((void *)v10 + 232) = 0;
  *(void *)&long long block = MEMORY[0x263EF8330];
  *((void *)&block + 1) = 3221225472;
  *(void *)&long long v68 = ___ZN3AGX35ComputeIndirectExecutionContextGen4INS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesENS1_28EncoderComputeServiceClassesEE30getComputeRangeExecutionShaderEPNS1_6DeviceE_block_invoke;
  *((void *)&v68 + 1) = &__block_descriptor_40_e5_v8__0l;
  uint64_t v69 = v27;
  if (AGX::ComputeIndirectExecutionContextGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::getComputeRangeExecutionShader(AGX::HAL200::Device *)::compute_execute_indirect_stateless_shaders_pred != -1) {
    dispatch_once(&AGX::ComputeIndirectExecutionContextGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::getComputeRangeExecutionShader(AGX::HAL200::Device *)::compute_execute_indirect_stateless_shaders_pred, &block);
  }
  *((void *)v10 + 226) = AGX::ComputeIndirectExecutionContextGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::getComputeRangeExecutionShader(AGX::HAL200::Device *)::pipeline;
  *(void *)&long long block = MEMORY[0x263EF8330];
  *((void *)&block + 1) = 3221225472;
  *(void *)&long long v68 = ___ZN3AGX35ComputeIndirectExecutionContextGen4INS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesENS1_28EncoderComputeServiceClassesEE30getComputePatchExecutionShaderEPNS1_6DeviceE_block_invoke;
  *((void *)&v68 + 1) = &__block_descriptor_40_e5_v8__0l;
  uint64_t v69 = v27;
  if (AGX::ComputeIndirectExecutionContextGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::getComputePatchExecutionShader(AGX::HAL200::Device *)::compute_execute_indirect_stateless_shaders_pred != -1) {
    dispatch_once(&AGX::ComputeIndirectExecutionContextGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::getComputePatchExecutionShader(AGX::HAL200::Device *)::compute_execute_indirect_stateless_shaders_pred, &block);
  }
  *((void *)v10 + 227) = AGX::ComputeIndirectExecutionContextGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::getComputePatchExecutionShader(AGX::HAL200::Device *)::pipeline;
  *((void *)v10 + 243) = 0;
  *((_DWORD *)v10 + 488) = -1;
  v10[1956] = 0;
  bzero(v10 + 1960, 0x2120uLL);
  *((_DWORD *)v10 + 2611) = 1;
  bzero(v10 + 10448, 0x424uLL);
  *((void *)v10 + 1940) = 0;
  *((_OWORD *)v10 + 969) = 0u;
  *((_OWORD *)v10 + 968) = 0u;
  *((_OWORD *)v10 + 967) = 0u;
  *((_OWORD *)v10 + 966) = 0u;
  *((_OWORD *)v10 + 965) = 0u;
  *((_OWORD *)v10 + 964) = 0u;
  *((_OWORD *)v10 + 963) = 0u;
  *((_OWORD *)v10 + 962) = 0u;
  *((_OWORD *)v10 + 961) = 0u;
  *((_OWORD *)v10 + 960) = 0u;
  *((_OWORD *)v10 + 959) = 0u;
  *((_OWORD *)v10 + 958) = 0u;
  *((_OWORD *)v10 + 957) = 0u;
  *((_OWORD *)v10 + 956) = 0u;
  *((_OWORD *)v10 + 955) = 0u;
  *((_OWORD *)v10 + 954) = 0u;
  *((_OWORD *)v10 + 953) = 0u;
  *((_DWORD *)v10 + 4164) = 0;
  *((_OWORD *)v10 + 1040) = 0u;
  *((_OWORD *)v10 + 1039) = 0u;
  *((void *)v10 + 2083) = 0;
  v10[16676] = 0;
  *((void *)v10 + 2085) = 0;
  *((_OWORD *)v10 + 1045) = 0u;
  *(_OWORD *)(v10 + 16568) = 0u;
  *(_OWORD *)(v10 + 16584) = 0u;
  *((void *)v10 + 2089) = v10 + 16720;
  *(_OWORD *)(v10 + 16744) = 0u;
  AGX::SpillInfoGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::SpillInfoGen3((uint64_t)(v10 + 16760), *(void *)(*((void *)v10 + 182) + 808), *(void *)(*(void *)(*((void *)v10 + 182) + 808) + 6048));
  AGX::ComputeCounterSamplingContextGen1::ComputeCounterSamplingContextGen1((AGX::ComputeCounterSamplingContextGen1 *)(v10 + 16888), var4);
  int v35 = *(unsigned __int8 *)(*(void *)(*(void *)v10 + 688) + 568);
  v10[16904] = v35;
  if (v35) {
    BOOL v36 = 0;
  }
  else {
    BOOL v36 = var5 == 2;
  }
  char v37 = v36;
  v10[16905] = v37;
  *((_DWORD *)v10 + 4227) = var5;
  uint64_t v38 = *((void *)v10 + 182);
  uint64_t v39 = *((void *)v10 + 187);
  *((void *)v10 + 2115) = *(void *)(v38 + 808);
  *((void *)v10 + 2116) = v21;
  *((void *)v10 + 2117) = v25;
  *((void *)v10 + 2118) = v39;
  v10[16952] = 0;
  v10[16976] = 0;
  v10[16984] = 0;
  v10[17008] = 0;
  v10[17016] = 0;
  v10[17040] = 0;
  v10[17048] = 0;
  v10[17072] = 0;
  v10[17080] = 0;
  v10[17104] = 0;
  *(_OWORD *)(v10 + 17112) = 0u;
  *(_OWORD *)(v10 + 17128) = 0u;
  *(_OWORD *)(v10 + 17144) = 0u;
  v10[17168] = 0;
  v10[17176] = 0;
  *(_OWORD *)(v10 + 17208) = 0u;
  *((void *)v10 + 2158) = 0;
  *((void *)v10 + 2157) = 4;
  v10[17272] = 0;
  *((void *)v10 + 2167) = 0;
  *((_OWORD *)v10 + 1080) = 0u;
  *((_OWORD *)v10 + 1081) = 0u;
  *((_OWORD *)v10 + 1082) = 0u;
  v10[17162] |= 1u;
  *((void *)v10 + 235) = 0;
  *((void *)v10 + 237) = 0;
  uint64_t v40 = *(void *)(v38 + 808);
  if (*(void *)(v40 + 6784) >> 4 < 0x27DuLL)
  {
    uint64_t v43 = 0;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v40 + 6796));
    int v41 = *(_DWORD *)(v40 + 6792);
    if (v41)
    {
      unsigned int v42 = v41 - 1;
      *(_DWORD *)(v40 + 6792) = v42;
      uint64_t v43 = *(void **)(v40 + 8 * v42 + 6800);
      os_unfair_lock_unlock((os_unfair_lock_t)(v40 + 6796));
      if (v43)
      {
        bzero(v43, *(void *)(v40 + 6784));
        goto LABEL_35;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v40 + 6796));
    }
    uint64_t v43 = malloc_type_calloc(*(void *)(v40 + 6784), 1uLL, 0xC8454162uLL);
  }
LABEL_35:
  bzero(v43, 0x27D0uLL);
  *((void *)v10 + 242) = v43;
  v43[65] = v43;
  *(void *)(*((void *)v10 + 242) + 528) = v10 + 1944;
  uint64_t v44 = *(void *)(*((void *)v10 + 182) + 808);
  long long v45 = *(_OWORD *)(v44 + 7328);
  long long block = *(_OWORD *)(v44 + 7312);
  long long v68 = v45;
  for (uint64_t i = 1592; i != 5688; i += 32)
  {
    uint64_t v47 = (_OWORD *)(*((void *)v10 + 242) + i);
    *uint64_t v47 = block;
    v47[1] = v68;
  }
  uint64_t v48 = *(void *)(*((void *)v10 + 182) + 808);
  long long v49 = *(_OWORD *)(v48 + 7360);
  long long block = *(_OWORD *)(v48 + 7344);
  long long v68 = v49;
  uint64_t v50 = -4096;
  do
  {
    v51 = (_OWORD *)(*((void *)v10 + 242) + v50 + 9784);
    _OWORD *v51 = block;
    v51[1] = v68;
    v50 += 32;
  }
  while (v50);
  *((_DWORD *)v10 + 470) = v61;
  *((_DWORD *)v10 + 4172) = var6;
  uint64_t v52 = 16;
  if (v61 == 1) {
    uint64_t v52 = 8;
  }
  *((void *)v10 + 2157) |= v52;
  int v53 = v10[16976];
  *((void *)v10 + 2119) = v10;
  *((void *)v10 + 2120) = AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::handleControlFlowFailure;
  *((void *)v10 + 2121) = 0;
  if (!v53) {
    v10[16976] = 1;
  }
  int v54 = v10[17008];
  *((void *)v10 + 2123) = v10;
  *((void *)v10 + 2124) = AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::handleFirstControlFlowPrologue;
  *((void *)v10 + 2125) = 0;
  if (!v54) {
    v10[17008] = 1;
  }
  int v55 = v10[17040];
  *((void *)v10 + 2127) = v10;
  *((void *)v10 + 2128) = AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::handleLastControlFlowEpilogue;
  *((void *)v10 + 2129) = 0;
  if (!v55) {
    v10[17040] = 1;
  }
  int v56 = v10[17072];
  *((void *)v10 + 2131) = v10;
  *((void *)v10 + 2132) = AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::handleControlFlowPrologue;
  *((void *)v10 + 2133) = 0;
  if (!v56) {
    v10[17072] = 1;
  }
  int v57 = v10[17104];
  *((void *)v10 + 2135) = v10;
  *((void *)v10 + 2136) = AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::handleControlFlowEpilogue;
  *((void *)v10 + 2137) = 0;
  if (!v57) {
    v10[17104] = 1;
  }
  uint64_t v58 = *((void *)v10 + 182);
  *((void *)v10 + 233) = *(void *)(v58 + 808) + 6472;
  *((void *)v10 + 234) = *(void *)(v58 + 808) + 6536;
  *((_WORD *)v10 + 8580) = 0;
  *((_DWORD *)v10 + 4336) = 96 * *(_DWORD *)(*(void *)(v58 + 808) + 5876);
  uint64_t v59 = *v63;
  if (*(_DWORD *)*MEMORY[0x263F4B1E8])
  {
    IOGPUDeviceTraceEvent();
    uint64_t v59 = *v63;
  }
  AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::beginComputePass(v59, 0, 0x16u);
  if (*(_DWORD *)(v59 + 1880) == 1 && !*(_DWORD *)(v59 + 16688)) {
    AGX::ComputeContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,AGX::HAL200::EncoderComputeServiceClasses>::insertIndirectTGOptKernel(v59, 22, (unint64_t *)(v59 + 17352), (void *)(v59 + 17360), (uint64_t *)(v59 + 17368));
  }
  if ([*(id *)((char *)&v6->super.super.super.super.super.isa + (int)*MEMORY[0x263F12B70]) getSupportedAndEnabledErrorOptions])v6->_markerID = -[IOGPUMetalCommandEncoder globalTraceObjectID](v6, "globalTraceObjectID"); {
  return v6;
  }
}

@end