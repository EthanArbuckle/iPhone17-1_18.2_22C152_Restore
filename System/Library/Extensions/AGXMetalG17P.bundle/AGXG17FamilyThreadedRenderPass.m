@interface AGXG17FamilyThreadedRenderPass
- (AGXG17FamilyThreadedRenderPass)initWithCommandBuffer:(id)a3 renderPassDescriptor:(id)a4;
- (BOOL)isMemorylessRender;
- (BOOL)setMTLCounterSampleLocationWithBuffer:(id)a3 startIndex:(unsigned int)a4 endIndex:(unsigned int)a5;
- (id).cxx_construct;
- (id)renderCommandEncoder;
- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4;
- (void)dealloc;
- (void)endEncoding;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setDepthStoreAction:(unint64_t)a3;
- (void)setStencilStoreAction:(unint64_t)a3;
@end

@implementation AGXG17FamilyThreadedRenderPass

- (id).cxx_construct
{
  *((void *)self + 28) = 0;
  *((void *)self + 29) = 0;
  *((void *)self + 27) = 0;
  *((void *)self + 31) = 0;
  *((void *)self + 32) = 0;
  *((void *)self + 30) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_subRenderCommandEncoders = &self->_subRenderCommandEncoders;
  begin = self->_subRenderCommandEncoders.__begin_;
  if (begin)
  {
    p_subRenderCommandEncoders->__end_ = begin;
    operator delete(begin);
  }
  v5 = self->_subOBJCRenderCommandEncoders.__begin_;
  if (v5)
  {
    self->_subOBJCRenderCommandEncoders.var0 = v5;
    operator delete(v5);
  }
}

- (BOOL)setMTLCounterSampleLocationWithBuffer:(id)a3 startIndex:(unsigned int)a4 endIndex:(unsigned int)a5
{
  return 0;
}

- (BOOL)isMemorylessRender
{
  return *((unsigned char *)self->_impl + 5405);
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  impl = self->_impl;
  if ((*((unsigned char *)impl + 6357) & 2) != 0)
  {
    switch(a3)
    {
      case 0uLL:
        impl[1588] &= ~0x200u;
        LODWORD(v4) = *((void *)impl + 793) & 0xFFFFFDFF;
        HIDWORD(v4) = (*((void *)impl + 793) | 0x20000000200uLL) >> 32;
        *((void *)impl + 793) = v4;
        __int16 v5 = *((_WORD *)impl + 2910) | 8;
        goto LABEL_9;
      case 1uLL:
        unsigned int v6 = impl[1588] & 0xFFFFFDFF;
        goto LABEL_7;
      case 2uLL:
        impl[1588] |= 0x200u;
        *((void *)impl + 793) &= 0xFFFFFDFFFFFFFDFFLL;
        goto LABEL_8;
      case 3uLL:
        unsigned int v6 = impl[1588] | 0x200;
LABEL_7:
        impl[1588] = v6;
        LODWORD(v7) = *((void *)impl + 793) | 0x200;
        HIDWORD(v7) = (*((void *)impl + 793) & 0xFFFFFDFFFFFFFDFFLL) >> 32;
        *((void *)impl + 793) = v7;
LABEL_8:
        __int16 v5 = impl[1455] & 0xFFF7;
LABEL_9:
        *((_WORD *)impl + 2910) = v5;
        break;
      default:
        break;
    }
  }
  uint64_t v8 = 0x2000000000000000;
  if (a3 != 1) {
    uint64_t v8 = 1;
  }
  *((void *)impl + 867) |= v8;
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  impl = self->_impl;
  if (*((unsigned char *)impl + 6357))
  {
    switch(a3)
    {
      case 0uLL:
        impl[1588] &= ~0x100u;
        LODWORD(v5) = *((void *)impl + 793) & 0xFFFFFEFF;
        HIDWORD(v5) = (*((void *)impl + 793) | 0x10000000100uLL) >> 32;
        *((void *)impl + 793) = v5;
        __int16 v6 = *((_WORD *)impl + 2910) | 2;
        goto LABEL_9;
      case 1uLL:
      case 5uLL:
        unsigned int v4 = impl[1588] & 0xFFFFFEFF;
        goto LABEL_7;
      case 2uLL:
        impl[1588] |= 0x100u;
        *((void *)impl + 793) &= 0xFFFFFEFFFFFFFEFFLL;
        goto LABEL_8;
      case 3uLL:
        unsigned int v4 = impl[1588] | 0x100;
LABEL_7:
        impl[1588] = v4;
        LODWORD(v7) = *((void *)impl + 793) | 0x100;
        HIDWORD(v7) = (*((void *)impl + 793) & 0xFFFFFEFFFFFFFEFFLL) >> 32;
        *((void *)impl + 793) = v7;
LABEL_8:
        __int16 v6 = impl[1455] & 0xFFFD;
LABEL_9:
        *((_WORD *)impl + 2910) = v6;
        break;
      default:
        break;
    }
  }
  uint64_t v8 = 0x1000000000000000;
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    uint64_t v8 = 1;
  }
  *((void *)impl + 867) |= v8;
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (a4 <= 7) {
    AGX::Framebuffer<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setColorStoreAction((uint64_t)self->_impl + 1440, a3, a4);
  }
}

- (void)endEncoding
{
  if (!*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12C70]))
  {
    v3 = (void *)MEMORY[0x24566F2C0]();
    objc_msgSend(-[AGXG17FamilyThreadedRenderPass renderCommandEncoder](self, "renderCommandEncoder"), "endEncoding");
  }
  uint64_t v4 = [*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12C60]) device];
  impl = self->_impl;
  unint64_t v6 = impl[867];
  unint64_t v7 = impl[868];
  atomic_fetch_or((atomic_ullong *volatile)(v4 + 816), v6);
  atomic_fetch_or((atomic_ullong *volatile)(v4 + 824), v7);
  dispatchQueue = self->dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__AGXG17FamilyThreadedRenderPass_endEncoding__block_invoke;
  block[3] = &unk_265170D78;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  v9 = self->_impl;
  free(*((void **)v9 + 843));
  v10 = (void *)*((void *)v9 + 833);
  if (v10) {

  }
  AGX::Framebuffer<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::~Framebuffer((uint64_t)v9 + 1440);
  v11 = (void **)*((void *)v9 + 175);
  v12 = (void **)*((void *)v9 + 176);
  if (v11 != v12)
  {
    do
    {
      v13 = *v11++;
      free(v13);
    }
    while (v11 != v12);
    v11 = (void **)*((void *)v9 + 175);
  }
  if (v11)
  {
    *((void *)v9 + 176) = v11;
    operator delete(v11);
  }
  free(self->_impl);
  self->_impl = 0;
  v14.receiver = self;
  v14.super_class = (Class)AGXG17FamilyThreadedRenderPass;
  [(IOGPUMetalParallelRenderCommandEncoder *)&v14 endEncoding];
}

void __45__AGXG17FamilyThreadedRenderPass_endEncoding__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 200);
  uint64_t v4 = *(void **)(v2 + (int)*MEMORY[0x263F12C60]);
  uint64_t v185 = *(void *)(v2 + (int)*MEMORY[0x263F12C68]);
  uint64_t v5 = *(void *)(v2 + 240);
  unint64_t v6 = *(void *)(v2 + (int)*MEMORY[0x263F12C70]);
  AGX::FramebufferGen3_1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::finalizeStoreActions(v3 + 1440);
  unint64_t v200 = v6;
  if (v6)
  {
    v182 = (void *)(v3 + 6904);
    uint64_t v190 = v3 + 6888;
    v199 = (void **)(v3 + 6896);
    objc_msgSend(v4, "getCurrentKernelCommandBufferStart:current:end:");
    AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::emitSWEndOfTileIfNeeded(*(void *)(v5 + 8 * v6 - 8));
    v180 = (unsigned char *)(v3 + 5407);
    unint64_t v9 = 0;
    unint64_t v10 = 0x268D57000;
    uint64_t v184 = v1;
    uint64_t v183 = v3;
    v188 = v4;
    uint64_t v206 = v5;
    while (v9 < v200)
    {
      unsigned int v207 = 0;
      int v193 = 0;
      int v209 = 0;
      uint64_t v191 = 0;
      uint64_t v192 = 0;
      int v196 = 0;
      uint64_t v13 = 0;
      uint64_t v194 = 0;
      uint64_t v195 = 0;
      unsigned int v205 = 0;
      uint64_t v14 = 0;
      __n128 v15 = 0uLL;
      __n128 v212 = 0u;
      uint64_t v16 = *(void *)(v5 + 8 * v9);
      v186 = (unint64_t *)(v16 + 91168);
      uint64_t v213 = v16 + 90488;
      uint64_t v187 = v16 + 38696;
      uint64_t v17 = v16 + 36624;
      v198 = (unsigned int *)(v16 + 1616);
      uint64_t v181 = v16 + 16;
      unint64_t v189 = v9;
      unint64_t v18 = v9;
      int32x4_t v210 = 0u;
      int32x4_t v211 = 0u;
      long long v208 = 0u;
      uint64_t v197 = v16;
      while (1)
      {
        uint64_t v21 = *(void *)(v5 + 8 * v18);
        if (v16 == v21)
        {
          uint64_t v26 = v13;
          uint64_t v27 = *(void *)(*(void *)(v16 + 1456) + *(int *)(v10 + 2064));
          if (*(unsigned char *)(v27 + 5106))
          {
            os_unfair_lock_lock((os_unfair_lock_t)(v27 + 7656));
            unsigned int v207 = *(_DWORD *)(v27 + 7696);
            os_unfair_lock_unlock((os_unfair_lock_t)(v27 + 7656));
            uint64_t v27 = *(void *)(*(void *)(v16 + 1456) + *(int *)(v10 + 2064));
          }
          else
          {
            v207 += (*(void *)(v16 + 320) - *(void *)(*(void *)(v16 + 40) + 536)) >> 4;
          }
          if (*(unsigned char *)(v27 + 5105))
          {
            os_unfair_lock_lock((os_unfair_lock_t)(v27 + 7616));
            unsigned int v205 = *(_DWORD *)(v27 + 7640);
            os_unfair_lock_unlock((os_unfair_lock_t)(v27 + 7616));
          }
          else
          {
            uint64_t v41 = *(void *)(v16 + 288);
            if (!v41)
            {
              AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v181);
              uint64_t v41 = *(void *)(v16 + 288);
              if (!v41)
              {
                AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v181);
                uint64_t v41 = 0;
              }
            }
            v205 -= 1431655765 * ((unint64_t)(v41 - *(void *)(*(void *)(v16 + 40) + 472)) >> 2);
          }
          uint64_t v13 = v26;
          goto LABEL_44;
        }
        if (*(_DWORD *)(v21 + 90580) > 1u || !IOGPUResourceListMergeLists()) {
          break;
        }
        uint64_t v22 = v13;
        unint64_t v23 = v10;
        uint64_t v24 = *(void *)(*(void *)(v21 + 1456) + *(int *)(v10 + 2064));
        if (*(unsigned char *)(v24 + 5106))
        {
          os_unfair_lock_lock((os_unfair_lock_t)(v24 + 7656));
          LODWORD(v25) = *(_DWORD *)(v24 + 7696);
          os_unfair_lock_unlock((os_unfair_lock_t)(v24 + 7656));
          uint64_t v24 = *(void *)(*(void *)(v21 + 1456) + *(int *)(v23 + 2064));
        }
        else
        {
          uint64_t v25 = (*(void *)(v21 + 320) - *(void *)(*(void *)(v21 + 40) + 536)) >> 4;
        }
        if (*(unsigned char *)(v24 + 5105))
        {
          v28 = (os_unfair_lock_s *)(v24 + 7616);
          os_unfair_lock_lock((os_unfair_lock_t)(v24 + 7616));
          unint64_t v29 = *(void *)(v24 + 7640);
          os_unfair_lock_unlock(v28);
        }
        else
        {
          uint64_t v30 = *(void *)(v21 + 288);
          if (!v30)
          {
            AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v21 + 16);
            uint64_t v30 = *(void *)(v21 + 288);
            if (!v30)
            {
              AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v21 + 16);
              uint64_t v30 = 0;
            }
          }
          unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * ((v30 - *(void *)(*(void *)(v21 + 40) + 472)) >> 2);
        }
        unsigned int v31 = v207;
        if (*(unsigned char *)(*(void *)(*(void *)(v21 + 1456) + 808) + 5106)) {
          unsigned int v31 = 0;
        }
        unsigned int v32 = v31 + v25;
        unsigned int v33 = v205;
        if (*(unsigned char *)(*(void *)(*(void *)(v21 + 1456) + 808) + 5105)) {
          unsigned int v33 = 0;
        }
        unsigned int v34 = v33 + v29;
        unint64_t v10 = 0x268D57000uLL;
        BOOL v35 = !HIWORD(v32) && HIWORD(v34) == 0;
        uint64_t v13 = v22;
        uint64_t v16 = v197;
        if (!v35) {
          break;
        }
        int v36 = *(_DWORD *)(v21 + 38488);
        if (v36 != 1)
        {
          int v37 = v209;
          if (!v36)
          {
            v38 = *(unsigned int **)(v21 + 38464);
            if (v38)
            {
              uint64_t v39 = *(void *)(v21 + 38480);
              unsigned int *v38 = BYTE4(v39) | 0x80000000;
              v38[1] = v39;
              *(void *)(v21 + 38464) = 0;
              *(void *)(v21 + 38480) = 0;
              ++*(_DWORD *)(v21 + 1536);
            }
          }
          unsigned int v207 = v32;
          unsigned int v205 = v34;
          goto LABEL_45;
        }
        v40 = *(_WORD **)(v21 + 448);
        _WORD *v40 = 2 * *(_WORD *)(v21 + 38492);
        *(void *)(v21 + 448) = v40 + 1;
        *(_DWORD *)(v21 + 38488) = 2;
        *(_DWORD *)(*(void *)(v21 + 38472) + 8) = 2;
        unsigned int v207 = v32;
        unsigned int v205 = v34;
LABEL_44:
        int v37 = v209;
LABEL_45:
        if (v14 && v14 != v21)
        {
          uint64_t v42 = **(void **)(v21 + 38952);
          v43 = *(unint64_t **)(v14 + 64);
          *(void *)(v14 + 64) = v43 + 1;
          unint64_t *v43 = __ROR8__(v42, 32) & 0xFFFFFFFF000000FFLL | 0x80000000;
        }
        if (*(_DWORD *)(v21 + 38700) > v37)
        {
          int v193 = *(_DWORD *)(v21 + 38696);
          uint64_t v191 = *(void *)(v21 + 38712);
          uint64_t v192 = *(void *)(v21 + 38704);
          int v37 = *(_DWORD *)(v21 + 38700);
        }
        int32x4_t v44 = *(int32x4_t *)(v21 + 38720);
        int32x2_t v45 = *(int32x2_t *)(v21 + 38736);
        if (*(_DWORD *)(v21 + 38820) > (int)v13)
        {
          int v196 = *(_DWORD *)(v21 + 38816);
          uint64_t v13 = *(unsigned int *)(v21 + 38820);
          uint64_t v194 = *(void *)(v21 + 38832);
          uint64_t v195 = *(void *)(v21 + 38824);
        }
        int v209 = v37;
        int8x16_t v8 = *(int8x16_t *)(v21 + 38840);
        int32x2_t v46 = *(int32x2_t *)(v21 + 38856);
        *(unsigned char *)(v17 + 33) |= *(unsigned char *)(v21 + 36657);
        *(unsigned char *)v17 |= *(unsigned char *)(v21 + 36624);
        *(_WORD *)(v17 + 1794) = *(_WORD *)(v21 + 38418);
        *(_WORD *)(v17 + 1792) |= *(_WORD *)(v21 + 38416);
        *(unsigned char *)(v17 + 1871) |= *(unsigned char *)(v21 + 38495);
        if (v16 != v21)
        {
          *(_DWORD *)(v213 + 96) += *(_DWORD *)(v21 + 90584);
          *(_DWORD *)(v16 + 1540) += *(_DWORD *)(v21 + 1540);
          *(unsigned char *)(v16 + 1544) &= *(unsigned char *)(v21 + 1544);
          int8x16_t v201 = v8;
          int32x4_t v203 = v44;
          AGX::RayPayloadSizeAlignImpl<AGX::HAL200::Classes>::merge(v198, (unsigned int *)(v21 + 1616));
          int8x16_t v8 = v201;
          int32x4_t v44 = v203;
        }
        int32x4_t v210 = vmaxq_s32(v210, v44);
        *((void *)&v19 + 1) = *((void *)&v208 + 1);
        *(int32x2_t *)&long long v19 = vmax_s32(*(int32x2_t *)&v208, v45);
        long long v208 = v19;
        int32x4_t v7 = vmaxq_s32(v211, (int32x4_t)v8);
        v15.n128_u64[1] = v212.n128_u64[1];
        v15.n128_u64[0] = (unint64_t)vmax_s32((int32x2_t)v212.n128_u64[0], v46);
        int32x4_t v211 = v7;
        __n128 v212 = v15;
        unsigned int v20 = *(_DWORD *)(v16 + 2240);
        if (v20 <= *(_DWORD *)(v21 + 2240)) {
          unsigned int v20 = *(_DWORD *)(v21 + 2240);
        }
        *(_DWORD *)(v16 + 2240) = v20;
        *(unsigned char *)(v21 + 36625) = *(unsigned char *)(v17 + 1);
        ++v18;
        uint64_t v14 = v21;
        uint64_t v5 = v206;
        if (v200 == v18)
        {
          unint64_t v48 = v200;
          unint64_t v47 = v189;
          goto LABEL_66;
        }
      }
      unint64_t v47 = v189;
      if (v18 == v189) {
        uint64_t v21 = v16;
      }
      else {
        uint64_t v21 = v14;
      }
      if (v18 == v189) {
        unint64_t v48 = v189 + 1;
      }
      else {
        unint64_t v48 = v18;
      }
      uint64_t v5 = v206;
LABEL_66:
      char v49 = *(unsigned char *)(v213 + 89) != 0;
      unint64_t v204 = v48;
      v50 = v188;
      v51 = v199;
      if (v48 - v47 >= 2)
      {
        int v202 = v13;
        unint64_t v52 = *(void *)(*(void *)(v16 + 1456) + *(int *)(v10 + 2064));
        if (*(unsigned char *)(v52 + 5106))
        {
          v53 = (os_unfair_lock_s *)(v52 + 7656);
          os_unfair_lock_lock((os_unfair_lock_t)(v52 + 7656));
          LODWORD(v52) = *(_DWORD *)(v52 + 7696);
          os_unfair_lock_unlock(v53);
          if (!*(unsigned char *)(*(void *)(*(void *)(v16 + 1456) + *(int *)(v10 + 2064)) + 5106))
          {
            uint64_t v54 = *(void *)(v16 + 320);
            goto LABEL_71;
          }
          goto LABEL_73;
        }
        uint64_t v54 = *(void *)(v16 + 320);
        unint64_t v52 = (unint64_t)(v54 - *(void *)(*(void *)(v16 + 40) + 536)) >> 4;
LABEL_71:
        uint64_t v55 = 16 * (v207 - v52);
        unint64_t v56 = v54 + v55;
        if (v56 <= *(void *)(v16 + 312))
        {
          *(void *)(v16 + 328) = v56;
          goto LABEL_73;
        }
        if (AGX::DataBufferAllocator<34ul>::growNoInline(v181, 8, 1))
        {
          unint64_t v176 = *(void *)(v16 + 320) + v55;
          if (v176 <= *(void *)(v16 + 312))
          {
            *(void *)(v16 + 328) = v176;
            *(void *)(*(void *)(v187 + 256) + 752) = *(void *)(*(void *)(v16 + 40) + 512)
                                                         + *(void *)(*(void *)(v16 + 40) + 536)
                                                         - *(void *)(*(void *)(v16 + 40) + 520);
            goto LABEL_73;
          }
LABEL_217:
          abort();
        }
LABEL_73:
        uint64_t v57 = *(void *)(*(void *)(v16 + 1456) + *(int *)(v10 + 2064));
        if (*(unsigned char *)(v57 + 5105))
        {
          v58 = (os_unfair_lock_s *)(v57 + 7616);
          os_unfair_lock_lock((os_unfair_lock_t)(v57 + 7616));
          unint64_t v59 = *(void *)(v57 + 7640);
          os_unfair_lock_unlock(v58);
        }
        else
        {
          uint64_t v60 = *(void *)(v16 + 288);
          if (!v60)
          {
            AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v181);
            uint64_t v60 = *(void *)(v16 + 288);
            if (!v60)
            {
              AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v181);
              uint64_t v60 = 0;
            }
          }
          unint64_t v59 = 0xAAAAAAAAAAAAAAABLL * ((v60 - *(void *)(*(void *)(v16 + 40) + 472)) >> 2);
        }
        if (!*(unsigned char *)(*(void *)(*(void *)(v16 + 1456) + *(int *)(v10 + 2064)) + 5105))
        {
          uint64_t v61 = *(void *)(v16 + 288);
          if (!v61)
          {
            if (!AGX::DataBufferAllocator<34ul>::growNoInline(v181, 7, 0)) {
              goto LABEL_217;
            }
            uint64_t v61 = *(void *)(v16 + 288);
          }
          uint64_t v62 = 12 * (v205 - v59);
          unint64_t v63 = v61 + v62;
          if (v63 > *(void *)(v16 + 280))
          {
            if (AGX::DataBufferAllocator<34ul>::growNoInline(v181, 7, 1))
            {
              uint64_t v177 = *(void *)(v16 + 288);
              if ((unint64_t)(v177 + v62) > *(void *)(v16 + 280)) {
                goto LABEL_217;
              }
              *(void *)(v16 + 296) = v177 + v62;
              if (!v177) {
                AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v181);
              }
              *(void *)(*(void *)(v187 + 256) + 760) = *(void *)(*(void *)(v16 + 40) + 448)
                                                           + *(void *)(*(void *)(v16 + 40) + 472)
                                                           - *(void *)(*(void *)(v16 + 40) + 456);
            }
          }
          else
          {
            *(void *)(v16 + 296) = v63;
          }
        }
        uint64_t v64 = v187;
        int v65 = *(_DWORD *)(v187 + 4);
        if (v209 > v65)
        {
          *(_DWORD *)uint64_t v187 = v193;
          *(_DWORD *)(v187 + 4) = v209;
          *(void *)(v16 + 38712) = v191;
          *(void *)(v16 + 38704) = v192;
          uint64_t v64 = v187;
        }
        v66.i64[0] = *(void *)(v64 + 24);
        int32x2_t v67 = *(int32x2_t *)(v64 + 32);
        int32x2_t v68 = vrev64_s32(*(int32x2_t *)v66.i8);
        v66.u64[1] = (unint64_t)v67;
        int8x16_t v69 = (int8x16_t)v210;
        *(int32x4_t *)(v64 + 24) = vmaxq_s32(v66, v210);
        *(int32x2_t *)v66.i8 = vrev64_s32(*(int32x2_t *)&v208);
        v66.i64[1] = __PAIR64__(v69.u32[0], v69.u32[1]);
        int32x2_t v70 = *(int32x2_t *)(v64 + 40);
        *(int32x2_t *)v71.i8 = vrev64_s32(v70);
        v71.u64[1] = (unint64_t)v68;
        *(int32x2_t *)(v64 + 40) = vmax_s32(v70, *(int32x2_t *)&v208);
        *(int16x4_t *)v66.i8 = vmovn_s32(vcgtq_s32(v66, v71));
        v66.i16[0] = vmaxv_u16(*(uint16x4_t *)v66.i8);
        v66.i32[1] = v209 > v65;
        *(int8x8_t *)v66.i8 = vorr_s8((int8x8_t)vcgt_s32((int32x2_t)*(_OWORD *)&vextq_s8(v69, v69, 8uLL), v67), *(int8x8_t *)v66.i8);
        if (vorr_s8(*(int8x8_t *)v66.i8, (int8x8_t)vdup_lane_s32(*(int32x2_t *)v66.i8, 1)).u8[0])
        {
          AGX::SpillInfoGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::allocateUSCSpillBuffer(v64, (__n128 *)(*(void *)(v64 + 256) + 304), 1);
          uint64_t v64 = v187;
        }
        int v72 = *(_DWORD *)(v64 + 124);
        int v73 = v72;
        if (v202 > v72)
        {
          *(_DWORD *)(v64 + 120) = v196;
          *(_DWORD *)(v64 + 124) = v202;
          int v73 = v202;
          *(void *)(v64 + 128) = v195;
          *(void *)(v64 + 136) = v194;
        }
        v74.i64[0] = *(void *)(v64 + 144);
        int32x2_t v75 = *(int32x2_t *)(v64 + 152);
        int32x2_t v76 = vrev64_s32(*(int32x2_t *)v74.i8);
        v74.u64[1] = (unint64_t)v75;
        int8x16_t v77 = (int8x16_t)v211;
        int32x4_t v7 = vmaxq_s32(v74, v211);
        *(int32x4_t *)(v64 + 144) = v7;
        v15.n128_u64[1] = v212.n128_u64[1];
        *(int32x2_t *)v78.i8 = vrev64_s32((int32x2_t)v212.n128_u64[0]);
        v78.i64[1] = __PAIR64__(v77.u32[0], v77.u32[1]);
        int32x2_t v79 = *(int32x2_t *)(v64 + 160);
        v15.n128_u64[0] = (unint64_t)vmax_s32(v79, (int32x2_t)v212.n128_u64[0]);
        *(int32x2_t *)v80.i8 = vrev64_s32(v79);
        v80.u64[1] = (unint64_t)v76;
        *(void *)(v64 + 160) = v15.n128_u64[0];
        int8x8_t v81 = (int8x8_t)vmovn_s32(vcgtq_s32(v78, v80));
        v81.i16[0] = vmaxv_u16((uint16x4_t)v81);
        v81.i32[1] = v202 > v72;
        int32x2_t v82 = (int32x2_t)vorr_s8((int8x8_t)vcgt_s32((int32x2_t)*(_OWORD *)&vextq_s8(v77, v77, 8uLL), v75), v81);
        *(int8x8_t *)v8.i8 = vorr_s8((int8x8_t)v82, (int8x8_t)vdup_lane_s32(v82, 1));
        if (v8.i8[0])
        {
          __int32 v83 = v7.i32[0];
          if (v15.n128_i32[0] < 1)
          {
            unsigned __int32 v89 = 0;
            int v88 = 0;
            uint64_t v84 = v187;
          }
          else
          {
            uint64_t v84 = v187;
            uint64_t v85 = *(void *)(v187 + 176);
            uint64_t v86 = 5936;
            if (*(_OWORD *)(v85 + 5936) == 0) {
              uint64_t v86 = 5952;
            }
            int8x16_t v8 = *(int8x16_t *)(v85 + v86);
            int v87 = *(_DWORD *)(v85 + 5912);
            *(int32x2_t *)v8.i8 = vmovn_s64((int64x2_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(v8)))));
            *(int32x2_t *)v8.i8 = vadd_s32(vdup_lane_s32(*(int32x2_t *)v8.i8, 1), *(int32x2_t *)v8.i8);
            int v88 = v7.i32[2] + v7.i32[3];
            unsigned __int32 v89 = (v15.n128_u32[1] + v15.n128_u32[0] + v7.i32[2] + v7.i32[3]) * v8.i32[0];
            int v90 = *(_DWORD *)(v187 + 120);
            BOOL v91 = __OFSUB__(v7.i32[3], v90);
            int v92 = v7.i32[3] - v90;
            int v93 = v92 * v87;
            if ((v92 < 0) ^ v91 | (v92 == 0)) {
              int v93 = 0;
            }
            v73 += v89 + v93;
            __int32 v83 = v7.i32[1] + v7.i32[0] + v89;
          }
          v94 = *(__n128 **)(v84 + 256);
          v94[75].n128_u16[4] = 0;
          v94[74].n128_u64[1] = v15.n128_u64[0];
          v94[75].n128_u32[0] = v88;
          v94[75].n128_u32[1] = v89;
          v94[72].n128_u64[0] = (uint64_t)(int)((v73 + 7) & 0xFFFFFFF8) << 12;
          v94[72].n128_u64[1] = (uint64_t)(int)((v83 + 7) & 0xFFFFFFF8) << 12;
          __n128 v15 = *(__n128 *)(v16 + 38824);
          v94[73] = v15;
        }
        unint64_t v95 = v189 + 1;
        if (v189 + 1 < v204)
        {
          while (1)
          {
            v97 = *(void **)(v5 + 8 * v95);
            uint64_t v98 = *(int *)(v10 + 2064);
            if (*(unsigned char *)(*(void *)(*(void *)(v16 + 1456) + v98) + 5105)) {
              break;
            }
            if (!*(unsigned char *)(*(void *)(*(void *)(v16 + 1456) + v98) + 5106)) {
              goto LABEL_107;
            }
            LOWORD(v99) = 0;
LABEL_113:
            if (*(unsigned char *)(*(void *)(*(void *)(v16 + 1456) + *(int *)(v10 + 2064)) + 5105))
            {
              int v107 = 0;
            }
            else
            {
              uint64_t v108 = *(void *)(v16 + 288);
              if (!v108)
              {
                AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v181);
                uint64_t v108 = *(void *)(v16 + 288);
                if (!v108) {
                  AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v181);
                }
              }
              uint64_t v109 = *(void *)(*(void *)(v16 + 40) + 472);
              unint64_t v110 = *(void *)(v97[182] + *(int *)(v10 + 2064));
              if (*(unsigned char *)(v110 + 5105))
              {
                v111 = (os_unfair_lock_s *)(v110 + 7616);
                os_unfair_lock_lock((os_unfair_lock_t)(v110 + 7616));
                LODWORD(v110) = *(_DWORD *)(v110 + 7640);
                os_unfair_lock_unlock(v111);
              }
              else
              {
                uint64_t v112 = v97[36];
                if (!v112)
                {
                  AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v97 + 2);
                  uint64_t v112 = v97[36];
                  if (!v112)
                  {
                    AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v97 + 2);
                    uint64_t v112 = 0;
                  }
                }
                unint64_t v110 = 0xAAAAAAAAAAAAAAABLL * ((v112 - *(void *)(v97[5] + 472)) >> 2);
              }
              int v107 = -1431655765 * ((unint64_t)(v108 - v109) >> 2);
              uint64_t v113 = v110;
              if (v110)
              {
                v50 = v188;
                unint64_t v10 = 0x268D57000;
                if (!v97[36]) {
                  AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v97 + 2);
                }
                v114 = *(const void **)(v97[5] + 472);
                v115 = *(char **)(v16 + 288);
                *(void *)(v16 + 288) = &v115[12 * v113];
                memcpy(v115, v114, 12 * v113);
              }
              else
              {
                v50 = v188;
                unint64_t v10 = 0x268D57000uLL;
              }
            }
            uint64_t v116 = *(void *)(v97[5] + 600);
            uint64_t v117 = v97[44] - v116;
            if (!v117) {
              goto LABEL_137;
            }
            unint64_t v118 = v117 >> 3;
            if (v118 <= 1) {
              unint64_t v119 = 1;
            }
            else {
              unint64_t v119 = v118;
            }
            int v120 = v107 << 16;
            if (v119 >= 2
              && (v116 + 4 + 8 * (v119 - 1) >= v116 + 4 ? (BOOL v121 = (v119 - 1) >> 61 == 0) : (BOOL v121 = 0), v121))
            {
              unint64_t v122 = v119 & 0xFFFFFFFFFFFFFFFELL;
              v140 = (unsigned int *)(v116 + 12);
              unint64_t v141 = v119 & 0xFFFFFFFFFFFFFFFELL;
              do
              {
                unsigned int v142 = (*v140 + v120) & 0xFFFF0000 | (unsigned __int16)(*(_WORD *)v140 + v99);
                *(v140 - 2) = (*(v140 - 2) + v120) & 0xFFFF0000 | (unsigned __int16)(*(v140 - 2) + v99);
                unsigned int *v140 = v142;
                v140 += 4;
                v141 -= 2;
              }
              while (v141);
              if (v119 == v122) {
                goto LABEL_137;
              }
            }
            else
            {
              unint64_t v122 = 0;
            }
            v123 = (unsigned int *)(v116 + 8 * v122 + 4);
            unint64_t v124 = v119 - v122;
            do
            {
              unsigned int *v123 = (*v123 + v120) & 0xFFFF0000 | (unsigned __int16)(*(_WORD *)v123 + v99);
              v123 += 2;
              --v124;
            }
            while (v124);
LABEL_137:
            v125 = (AGX::FenceList **)(v97 + 11311);
            if (*v125)
            {
              if (!*(void *)v213) {
                operator new();
              }
              AGX::FenceList::merge(*(AGX::FenceList **)v213, *v125);
            }
            v126 = v125[4];
            if (v126)
            {
              v127 = *(AGX::FenceList **)(v213 + 32);
              if (!v127) {
                operator new();
              }
              AGX::FenceList::merge(v127, v126);
            }
            v128 = v125[1];
            v51 = v199;
            if (v128)
            {
              v129 = *(AGX::FenceList **)(v213 + 8);
              if (!v129) {
                operator new();
              }
              AGX::FenceList::merge(v129, v128);
            }
            v130 = v125[5];
            if (v130)
            {
              v131 = *(AGX::FenceList **)(v213 + 40);
              if (!v131) {
                operator new();
              }
              AGX::FenceList::merge(v131, v130);
            }
            v132 = v125[2];
            if (v132)
            {
              v133 = *(AGX::FenceList **)(v213 + 16);
              if (!v133) {
                operator new();
              }
              AGX::FenceList::merge(v133, v132);
            }
            v134 = v125[6];
            if (v134)
            {
              v135 = *(AGX::FenceList **)(v213 + 48);
              if (!v135) {
                operator new();
              }
              AGX::FenceList::merge(v135, v134);
            }
            v136 = v125[3];
            if (v136)
            {
              v137 = *(AGX::FenceList **)(v213 + 24);
              if (!v137) {
                operator new();
              }
              AGX::FenceList::merge(v137, v136);
            }
            v138 = v125[7];
            if (v138)
            {
              v139 = *(AGX::FenceList **)(v213 + 56);
              if (!v139) {
                operator new();
              }
              AGX::FenceList::merge(v139, v138);
            }
            uint64_t v5 = v206;
            v49 |= *(unsigned char *)(*(void *)(v206 + 8 * v95++) + 90577) != 0;
            if (v95 == v204) {
              goto LABEL_98;
            }
          }
          if (*(unsigned char *)(*(void *)(*(void *)(v16 + 1456) + v98) + 5106)) {
            goto LABEL_137;
          }
LABEL_107:
          uint64_t v100 = *(void *)(v16 + 320);
          uint64_t v101 = *(void *)(*(void *)(v16 + 40) + 536);
          uint64_t v102 = *(void *)(v97[182] + v98);
          if (*(unsigned char *)(v102 + 5106))
          {
            v103 = (os_unfair_lock_s *)(v102 + 7656);
            os_unfair_lock_lock((os_unfair_lock_t)(v102 + 7656));
            uint64_t v104 = *(unsigned int *)(v102 + 7696);
            os_unfair_lock_unlock(v103);
          }
          else
          {
            uint64_t v104 = ((v97[40] - *(void *)(v97[5] + 536)) >> 4);
          }
          unint64_t v99 = (unint64_t)(v100 - v101) >> 4;
          if (v104)
          {
            v105 = *(const void **)(v97[5] + 536);
            v106 = *(char **)(v16 + 320);
            *(void *)(v16 + 320) = &v106[16 * v104];
            memcpy(v106, v105, 16 * v104);
          }
          unint64_t v10 = 0x268D57000uLL;
          goto LABEL_113;
        }
      }
LABEL_98:
      BOOL v96 = (v49 & 1) == 0 && *v180 != 0;
      if ((*(void *)(v183 + 5448) & 0xFFFFFFFFFF80) != 0) {
        *(void *)(v183 + 5424) = *(void *)(v183 + 5424) & 0xFFFFFFFFFFFFFFFELL | v96;
      }
      v143 = *(_DWORD **)(v21 + 64);
      *(void *)(v21 + 64) = v143 + 1;
      _DWORD *v143 = *(_DWORD *)(v21 + 36484);
      if (v204 >= v200)
      {
        AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::endRenderPassCommon(v16, 1, 0, 0, 0, v15, v7, *(int8x8_t *)v8.i8);
        if (*(unsigned char *)(*(void *)(v16 + 1968) + 3964)) {
          AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::encodeDepthCopy((uint64_t *)v16);
        }
      }
      else
      {
        v144 = *(_OWORD **)(v187 + 256);
        long long v145 = v144[88];
        v144[44] = v144[87];
        v144[45] = v145;
        v144[46] = v144[89];
        uint64_t v146 = *(void *)(v187 + 256);
        *(unsigned char *)(v146 + 1618) = 0;
        __n128 v147 = *(__n128 *)(v146 + 1472);
        long long v148 = *(_OWORD *)(v146 + 1456);
        *(_OWORD *)(v146 + 528) = *(_OWORD *)(v146 + 1440);
        *(_OWORD *)(v146 + 544) = v148;
        long long v149 = *(_OWORD *)(v146 + 1552);
        *(_OWORD *)(v146 + 624) = *(_OWORD *)(v146 + 1536);
        *(_OWORD *)(v146 + 640) = v149;
        long long v150 = *(_OWORD *)(v146 + 1520);
        long long v151 = *(_OWORD *)(v146 + 1504);
        *(_OWORD *)(v146 + 592) = v151;
        *(_OWORD *)(v146 + 608) = v150;
        int32x4_t v152 = *(int32x4_t *)(v146 + 1488);
        *(__n128 *)(v146 + 560) = v147;
        *(int32x4_t *)(v146 + 576) = v152;
        AGX::RenderContext<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::endRenderPassCommon(v16, 0, 0, 0, 0, v147, v152, *(int8x8_t *)&v151);
      }
      unint64_t v153 = v186[1];
      v154 = (atomic_ullong *)(*(void *)(v16 + 1456) + 816);
      atomic_fetch_or(v154, *v186);
      atomic_fetch_or(v154 + 1, v153);
      *(void *)(v16 + 32) = 0;
      *(void *)(v16 + 40) = 0;
      *(void *)(v16 + 48) = 0;
      *(void *)uint64_t v16 = 0;
      *(_OWORD *)(v16 + 1480) = 0u;
      v155 = *(void **)(v185 + 8 * v189);
      objc_msgSend(v155, "getCurrentKernelCommandBufferStart:current:end:", &v215, &v216, &v217, v180);
      v157 = v215;
      int v156 = v216;
      v158 = (void *)[v155 commandBufferStorage];
      v159 = v158;
      if (v158[8])
      {
        size_t v160 = v158[10] - v158[9];
        v214[0] = [v50 commandBufferStorage];
        v214[1] = v214[0] + 64;
        int v161 = *(_DWORD *)(v214[0] + 80) - *(_DWORD *)(v214[0] + 72);
        v162 = (void *)AGX::SidebandBufferAllocator::allocate((AGX::SidebandBufferAllocator *)v214, v160, 8u, 0);
        memcpy(v162, (const void *)v159[9], v160);
      }
      else
      {
        int v161 = 0;
      }
      unsigned int v163 = v156 - v157;
      if (v157[1] >= v156 - (int)v157)
      {
        v173 = *v51;
        size_t v174 = (v156 - v157);
        if ((unint64_t)*v51 + v163 > *v182)
        {
          objc_msgSend(v50, "setCurrentKernelCommandBufferPointer:");
          [v50 growKernelCommandBuffer:v174];
          [v50 getCurrentKernelCommandBufferStart:v190 current:v51 end:v182];
          v173 = *v51;
        }
        [v50 beginSegment:v173];
        [v50 ioGPUResourceList];
        [v155 ioGPUResourceList];
        IOGPUResourceListMergeLists();
        memcpy(*v51, v215, v174);
        v175 = (id *)v50[86];
        int v11 = *(unsigned __int8 *)v175;
        if (*(unsigned char *)v175)
        {
          if ([v175[1] ownedByParallelEncoder])
          {
            int v11 = 0;
          }
          else
          {
            *(unsigned char *)v175 = 0;
            int v11 = 4;
          }
        }
        v12 = *v51;
        v12[2] = v11;
        *v51 = (char *)v12 + v174;
        objc_msgSend(v50, "setCurrentKernelCommandBufferPointer:");
        *(_DWORD *)(*(void *)([v50 commandBufferStorage] + 128) + 16) = v161;
        [v50 endCurrentSegment];
      }
      else
      {
        uint64_t v164 = v159[15];
        int v165 = *(_DWORD *)(v164 + 8);
        if (v165)
        {
          uint64_t v166 = v164 + 16;
          do
          {
            uint64_t v169 = *(unsigned int *)(v166 + 28);
            uint64_t v170 = v157[1];
            v171 = *v51;
            if ((unint64_t)*v51 + v170 > *v182)
            {
              objc_msgSend(v50, "setCurrentKernelCommandBufferPointer:");
              [v50 growKernelCommandBuffer:v170];
              [v50 getCurrentKernelCommandBufferStart:v190 current:v51 end:v182];
              v171 = *v51;
            }
            [v50 beginSegment:v171];
            [v50 ioGPUResourceList];
            IOGPUResourceListMerge();
            memcpy(*v51, v157, v157[1]);
            v172 = (id *)v50[86];
            int v167 = *(unsigned __int8 *)v172;
            if (*(unsigned char *)v172)
            {
              if ([v172[1] ownedByParallelEncoder])
              {
                int v167 = 0;
              }
              else
              {
                *(unsigned char *)v172 = 0;
                int v167 = 4;
              }
            }
            v168 = *v51;
            v168[2] = v167;
            *v51 = (char *)v168 + v157[1];
            objc_msgSend(v50, "setCurrentKernelCommandBufferPointer:");
            *(_DWORD *)(*(void *)([v50 commandBufferStorage] + 128) + 16) = v161;
            [v50 endCurrentSegment];
            v157 = (unsigned int *)((char *)v157 + v157[1]);
            v166 += 32 + (v169 << 6);
            --v165;
          }
          while (v165);
        }
      }
      unint64_t v9 = v204;
      uint64_t v1 = v184;
      uint64_t v5 = v206;
      unint64_t v10 = 0x268D57000uLL;
    }
  }
  v178 = *(void **)(v1 + 32);
  if (v178[28] != v178[27])
  {
    unint64_t v179 = 0;
    do
    {
      *(void *)(v178[30] + 8 * v179) = 0;

      *(void *)(*(void *)(*(void *)(v1 + 32) + 216) + 8 * v179++) = 0;
      v178 = *(void **)(v1 + 32);
    }
    while (v179 < (uint64_t)(v178[28] - v178[27]) >> 3);
  }
  v178[31] = v178[30];
  *(void *)(*(void *)(v1 + 32) + 224) = *(void *)(*(void *)(v1 + 32) + 216);
}

- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  id v7 = [(IOGPUMetalParallelRenderCommandEncoder *)self _renderCommandEncoderCommon];
  int8x16_t v8 = (void *)[v7 sampledSubRenderCommandEncoderWithDescriptor:*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12C90]) subEncoderIndex:*(char **)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12C70]) - 1 framebuffer:(char *)self->_impl + 1440 programInfoBuffer:a3 capacity:a4];
  id v9 = v8;
  if (*(_DWORD *)*MEMORY[0x263F4B1E8])
  {
    [(_MTLParallelRenderCommandEncoder *)self globalTraceObjectID];
    [v8 globalTraceObjectID];
    kdebug_trace();
  }
  if (v8)
  {
    dispatchQueue = self->dispatchQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __92__AGXG17FamilyThreadedRenderPass_sampledRenderCommandEncoderWithProgramInfoBuffer_capacity___block_invoke;
    v12[3] = &unk_265170D50;
    v12[4] = self;
    v12[5] = v8;
    dispatch_sync(dispatchQueue, v12);
  }
  return v8;
}

void __92__AGXG17FamilyThreadedRenderPass_sampledRenderCommandEncoderWithProgramInfoBuffer_capacity___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32) + 216;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 224);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 232);
  uint64_t v5 = v4;
  if ((unint64_t)v4 >= v3)
  {
    id v7 = *(unsigned char **)v2;
    uint64_t v8 = (uint64_t)v4 - *(void *)v2;
    uint64_t v9 = v8 >> 3;
    unint64_t v10 = (v8 >> 3) + 1;
    if (v10 >> 61) {
      goto LABEL_48;
    }
    uint64_t v11 = v3 - (void)v7;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 >> 61) {
        goto LABEL_49;
      }
      uint64_t v13 = operator new(8 * v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v14 = &v13[8 * v9];
    __n128 v15 = &v13[8 * v12];
    *uint64_t v14 = *(void *)(a1 + 40);
    unint64_t v6 = v14 + 1;
    if (v4 == (void *)v7)
    {
      id v7 = v4;
    }
    else
    {
      unint64_t v16 = (char *)v4 - v7 - 8;
      if (v16 < 0x58) {
        goto LABEL_52;
      }
      if ((unint64_t)((char *)v4 - v13 - v8) < 0x20) {
        goto LABEL_52;
      }
      uint64_t v17 = (v16 >> 3) + 1;
      uint64_t v5 = &v4[-(v17 & 0x3FFFFFFFFFFFFFFCLL)];
      unint64_t v18 = &v13[8 * v9 - 16];
      long long v19 = (long long *)(v4 - 2);
      uint64_t v20 = v17 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v21 = *v19;
        *(v18 - 1) = *(v19 - 1);
        *unint64_t v18 = v21;
        v18 -= 2;
        v19 -= 2;
        v20 -= 4;
      }
      while (v20);
      v14 -= v17 & 0x3FFFFFFFFFFFFFFCLL;
      if (v17 != (v17 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_52:
        do
        {
          uint64_t v22 = *--v5;
          *--uint64_t v14 = v22;
        }
        while (v5 != (void *)v7);
        id v7 = *(unsigned char **)v2;
      }
    }
    *(void *)uint64_t v2 = v14;
    *(void *)(v2 + 8) = v6;
    *(void *)(v2 + 16) = v15;
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    *uint64_t v4 = *(void *)(a1 + 40);
    unint64_t v6 = v4 + 1;
  }
  *(void *)(v2 + 8) = v6;
  uint64_t v23 = *(void *)(a1 + 32) + 240;
  uint64_t v24 = [*(id *)(a1 + 40) getImpl];
  uint64_t v25 = v24;
  uint64_t v27 = *(uint64_t **)(v23 + 8);
  unint64_t v26 = *(void *)(v23 + 16);
  if ((unint64_t)v27 < v26)
  {
    *uint64_t v27 = v24;
    v28 = v27 + 1;
    goto LABEL_47;
  }
  unint64_t v29 = *(uint64_t **)v23;
  uint64_t v30 = (uint64_t)v27 - *(void *)v23;
  uint64_t v31 = v30 >> 3;
  unint64_t v32 = (v30 >> 3) + 1;
  if (v32 >> 61) {
LABEL_48:
  }
    abort();
  uint64_t v33 = v26 - (void)v29;
  if (v33 >> 2 > v32) {
    unint64_t v32 = v33 >> 2;
  }
  if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v34 = v32;
  }
  if (!v34)
  {
    BOOL v35 = 0;
    goto LABEL_36;
  }
  if (v34 >> 61) {
LABEL_49:
  }
    std::__throw_bad_array_new_length[abi:nn180100]();
  BOOL v35 = operator new(8 * v34);
LABEL_36:
  int v36 = (uint64_t *)&v35[8 * v31];
  int v37 = &v35[8 * v34];
  *int v36 = v25;
  v28 = v36 + 1;
  if (v27 == v29)
  {
    unint64_t v29 = v27;
  }
  else
  {
    unint64_t v38 = (char *)v27 - (char *)v29 - 8;
    if (v38 < 0x58) {
      goto LABEL_53;
    }
    if ((unint64_t)((char *)v27 - v35 - v30) < 0x20) {
      goto LABEL_53;
    }
    uint64_t v39 = (v38 >> 3) + 1;
    v40 = &v35[8 * v31 - 16];
    uint64_t v41 = v27 - 2;
    uint64_t v42 = v39 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v43 = *(_OWORD *)v41;
      *(v40 - 1) = *((_OWORD *)v41 - 1);
      _OWORD *v40 = v43;
      v40 -= 2;
      v41 -= 4;
      v42 -= 4;
    }
    while (v42);
    v36 -= v39 & 0x3FFFFFFFFFFFFFFCLL;
    v27 -= v39 & 0x3FFFFFFFFFFFFFFCLL;
    if (v39 != (v39 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_53:
      do
      {
        uint64_t v44 = *--v27;
        *--int v36 = v44;
      }
      while (v27 != v29);
      unint64_t v29 = *(uint64_t **)v23;
    }
  }
  *(void *)uint64_t v23 = v36;
  *(void *)(v23 + 8) = v28;
  *(void *)(v23 + 16) = v37;
  if (v29) {
    operator delete(v29);
  }
LABEL_47:
  *(void *)(v23 + 8) = v28;
}

- (id)renderCommandEncoder
{
  id v3 = [(IOGPUMetalParallelRenderCommandEncoder *)self _renderCommandEncoderCommon];
  uint64_t v4 = (void *)[v3 subRenderCommandEncoderWithDescriptor:*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12C90]) subEncoderIndex:*(char **)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F12C70]) - 1 framebuffer:(char *)self->_impl + 1440];
  id v5 = v4;
  if (*(_DWORD *)*MEMORY[0x263F4B1E8])
  {
    [(_MTLParallelRenderCommandEncoder *)self globalTraceObjectID];
    [v4 globalTraceObjectID];
    kdebug_trace();
  }
  if (v4)
  {
    dispatchQueue = self->dispatchQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __54__AGXG17FamilyThreadedRenderPass_renderCommandEncoder__block_invoke;
    v8[3] = &unk_265170D50;
    v8[4] = self;
    v8[5] = v4;
    dispatch_sync(dispatchQueue, v8);
  }
  return v4;
}

void __54__AGXG17FamilyThreadedRenderPass_renderCommandEncoder__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32) + 216;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 224);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 232);
  id v5 = v4;
  if ((unint64_t)v4 >= v3)
  {
    id v7 = *(unsigned char **)v2;
    uint64_t v8 = (uint64_t)v4 - *(void *)v2;
    uint64_t v9 = v8 >> 3;
    unint64_t v10 = (v8 >> 3) + 1;
    if (v10 >> 61) {
      goto LABEL_48;
    }
    uint64_t v11 = v3 - (void)v7;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 >> 61) {
        goto LABEL_49;
      }
      uint64_t v13 = operator new(8 * v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v14 = &v13[8 * v9];
    __n128 v15 = &v13[8 * v12];
    *uint64_t v14 = *(void *)(a1 + 40);
    unint64_t v6 = v14 + 1;
    if (v4 == (void *)v7)
    {
      id v7 = v4;
    }
    else
    {
      unint64_t v16 = (char *)v4 - v7 - 8;
      if (v16 < 0x58) {
        goto LABEL_52;
      }
      if ((unint64_t)((char *)v4 - v13 - v8) < 0x20) {
        goto LABEL_52;
      }
      uint64_t v17 = (v16 >> 3) + 1;
      id v5 = &v4[-(v17 & 0x3FFFFFFFFFFFFFFCLL)];
      unint64_t v18 = &v13[8 * v9 - 16];
      long long v19 = (long long *)(v4 - 2);
      uint64_t v20 = v17 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v21 = *v19;
        *(v18 - 1) = *(v19 - 1);
        *unint64_t v18 = v21;
        v18 -= 2;
        v19 -= 2;
        v20 -= 4;
      }
      while (v20);
      v14 -= v17 & 0x3FFFFFFFFFFFFFFCLL;
      if (v17 != (v17 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_52:
        do
        {
          uint64_t v22 = *--v5;
          *--uint64_t v14 = v22;
        }
        while (v5 != (void *)v7);
        id v7 = *(unsigned char **)v2;
      }
    }
    *(void *)uint64_t v2 = v14;
    *(void *)(v2 + 8) = v6;
    *(void *)(v2 + 16) = v15;
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    *uint64_t v4 = *(void *)(a1 + 40);
    unint64_t v6 = v4 + 1;
  }
  *(void *)(v2 + 8) = v6;
  uint64_t v23 = *(void *)(a1 + 32) + 240;
  uint64_t v24 = [*(id *)(a1 + 40) getImpl];
  uint64_t v25 = v24;
  uint64_t v27 = *(uint64_t **)(v23 + 8);
  unint64_t v26 = *(void *)(v23 + 16);
  if ((unint64_t)v27 < v26)
  {
    *uint64_t v27 = v24;
    v28 = v27 + 1;
    goto LABEL_47;
  }
  unint64_t v29 = *(uint64_t **)v23;
  uint64_t v30 = (uint64_t)v27 - *(void *)v23;
  uint64_t v31 = v30 >> 3;
  unint64_t v32 = (v30 >> 3) + 1;
  if (v32 >> 61) {
LABEL_48:
  }
    abort();
  uint64_t v33 = v26 - (void)v29;
  if (v33 >> 2 > v32) {
    unint64_t v32 = v33 >> 2;
  }
  if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v34 = v32;
  }
  if (!v34)
  {
    BOOL v35 = 0;
    goto LABEL_36;
  }
  if (v34 >> 61) {
LABEL_49:
  }
    std::__throw_bad_array_new_length[abi:nn180100]();
  BOOL v35 = operator new(8 * v34);
LABEL_36:
  int v36 = (uint64_t *)&v35[8 * v31];
  int v37 = &v35[8 * v34];
  *int v36 = v25;
  v28 = v36 + 1;
  if (v27 == v29)
  {
    unint64_t v29 = v27;
  }
  else
  {
    unint64_t v38 = (char *)v27 - (char *)v29 - 8;
    if (v38 < 0x58) {
      goto LABEL_53;
    }
    if ((unint64_t)((char *)v27 - v35 - v30) < 0x20) {
      goto LABEL_53;
    }
    uint64_t v39 = (v38 >> 3) + 1;
    v40 = &v35[8 * v31 - 16];
    uint64_t v41 = v27 - 2;
    uint64_t v42 = v39 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v43 = *(_OWORD *)v41;
      *(v40 - 1) = *((_OWORD *)v41 - 1);
      _OWORD *v40 = v43;
      v40 -= 2;
      v41 -= 4;
      v42 -= 4;
    }
    while (v42);
    v36 -= v39 & 0x3FFFFFFFFFFFFFFCLL;
    v27 -= v39 & 0x3FFFFFFFFFFFFFFCLL;
    if (v39 != (v39 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_53:
      do
      {
        uint64_t v44 = *--v27;
        *--int v36 = v44;
      }
      while (v27 != v29);
      unint64_t v29 = *(uint64_t **)v23;
    }
  }
  *(void *)uint64_t v23 = v36;
  *(void *)(v23 + 8) = v28;
  *(void *)(v23 + 16) = v37;
  if (v29) {
    operator delete(v29);
  }
LABEL_47:
  *(void *)(v23 + 8) = v28;
}

- (void)dealloc
{
  impl = self->_impl;
  if (impl)
  {
    free(*((void **)impl + 843));
    uint64_t v4 = (void *)*((void *)impl + 833);
    if (v4) {

    }
    AGX::Framebuffer<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::~Framebuffer((uint64_t)impl + 1440);
    id v5 = (void **)*((void *)impl + 175);
    unint64_t v6 = (void **)*((void *)impl + 176);
    if (v5 != v6)
    {
      do
      {
        id v7 = *v5++;
        free(v7);
      }
      while (v5 != v6);
      id v5 = (void **)*((void *)impl + 175);
    }
    if (v5)
    {
      *((void *)impl + 176) = v5;
      operator delete(v5);
    }
    free(self->_impl);
    self->_impl = 0;
  }
  dispatchQueue = self->dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  v9.receiver = self;
  v9.super_class = (Class)AGXG17FamilyThreadedRenderPass;
  [(_MTLParallelRenderCommandEncoder *)&v9 dealloc];
}

- (AGXG17FamilyThreadedRenderPass)initWithCommandBuffer:(id)a3 renderPassDescriptor:(id)a4
{
  block[277] = *MEMORY[0x263EF8340];
  v44.receiver = self;
  v44.super_class = (Class)AGXG17FamilyThreadedRenderPass;
  unint64_t v6 = -[IOGPUMetalParallelRenderCommandEncoder initWithCommandBuffer:renderPassDescriptor:](&v44, sel_initWithCommandBuffer_renderPassDescriptor_);
  if (!v6) {
    return v6;
  }
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  id v7 = (atomic_ullong *)[a3 device];
  [a4 validate:v7 width:&v43 height:&v42];
  v6->dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Metal.ParallelRenderCommandEncoder", 0);
  begin = v6->_subRenderCommandEncoders.__begin_;
  if ((RenderContext **)((char *)v6->_subRenderCommandEncoders.__end_cap_.__value_ - (char *)begin) <= (RenderContext **)0x7F)
  {
    end = v6->_subRenderCommandEncoders.__end_;
    unint64_t v10 = (char *)operator new(0x80uLL);
    uint64_t v11 = end - begin;
    unint64_t v12 = (RenderContext **)&v10[8 * v11];
    uint64_t v13 = v12;
    if (end == begin) {
      goto LABEL_11;
    }
    unint64_t v14 = (char *)end - (char *)begin - 8;
    if (v14 >= 0x58)
    {
      uint64_t v13 = (RenderContext **)&v10[8 * v11];
      if ((char *)end - v10 - (((char *)end - (char *)begin) & 0xFFFFFFFFFFFFFFF8) >= 0x20)
      {
        uint64_t v15 = (v14 >> 3) + 1;
        unint64_t v16 = &v10[8 * v11 - 16];
        uint64_t v17 = end - 2;
        uint64_t v18 = v15 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v19 = *(_OWORD *)v17;
          *((_OWORD *)v16 - 1) = *((_OWORD *)v17 - 1);
          *(_OWORD *)unint64_t v16 = v19;
          v16 -= 32;
          v17 -= 4;
          v18 -= 4;
        }
        while (v18);
        uint64_t v13 = &v12[-(v15 & 0x3FFFFFFFFFFFFFFCLL)];
        end -= v15 & 0x3FFFFFFFFFFFFFFCLL;
        if (v15 == (v15 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_11:
          v6->_subRenderCommandEncoders.__begin_ = v13;
          v6->_subRenderCommandEncoders.__end_ = v12;
          v6->_subRenderCommandEncoders.__end_cap_.__value_ = (RenderContext **)(v10 + 128);
          if (begin) {
            operator delete(begin);
          }
          goto LABEL_13;
        }
      }
    }
    else
    {
      uint64_t v13 = (RenderContext **)&v10[8 * v11];
    }
    do
    {
      uint64_t v20 = *--end;
      *--uint64_t v13 = v20;
    }
    while (end != begin);
    goto LABEL_11;
  }
LABEL_13:
  long long v21 = v6->_subOBJCRenderCommandEncoders.__begin_;
  if ((id *)((char *)v6->_subOBJCRenderCommandEncoders.var1.__value_ - (char *)v21) <= (id *)0x7F)
  {
    var0 = v6->_subOBJCRenderCommandEncoders.var0;
    uint64_t v23 = (char *)operator new(0x80uLL);
    uint64_t v24 = var0 - v21;
    uint64_t v25 = (__end_cap_ **)&v23[8 * v24];
    unint64_t v26 = v25;
    if (var0 == v21) {
      goto LABEL_22;
    }
    unint64_t v27 = (char *)var0 - (char *)v21 - 8;
    if (v27 >= 0x58)
    {
      unint64_t v26 = (__end_ **)&v23[8 * v24];
      if ((unint64_t)((char *)var0 - &v23[((char *)var0 - (char *)v21) & 0xFFFFFFFFFFFFFFF8]) >= 0x20)
      {
        uint64_t v28 = (v27 >> 3) + 1;
        unint64_t v29 = &v23[8 * v24 - 16];
        uint64_t v30 = var0 - 2;
        uint64_t v31 = v28 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v32 = *(_OWORD *)v30;
          *((_OWORD *)v29 - 1) = *((_OWORD *)v30 - 1);
          *(_OWORD *)unint64_t v29 = v32;
          v29 -= 32;
          v30 -= 4;
          v31 -= 4;
        }
        while (v31);
        unint64_t v26 = &v25[-(v28 & 0x3FFFFFFFFFFFFFFCLL)];
        var0 -= v28 & 0x3FFFFFFFFFFFFFFCLL;
        if (v28 == (v28 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_22:
          v6->_subOBJCRenderCommandEncoders.__begin_ = v26;
          v6->_subOBJCRenderCommandEncoders.var0 = v25;
          v6->_subOBJCRenderCommandEncoders.var1.__value_ = (id *)(v23 + 128);
          if (v21) {
            operator delete(v21);
          }
          goto LABEL_24;
        }
      }
    }
    else
    {
      unint64_t v26 = (__end_ **)&v23[8 * v24];
    }
    do
    {
      uint64_t v33 = *--var0;
      *--unint64_t v26 = v33;
    }
    while (var0 != v21);
    goto LABEL_22;
  }
LABEL_24:
  unint64_t v34 = malloc_type_calloc(0x1B28uLL, 1uLL, 0x99EF825DuLL);
  v6->_impl = v34;
  if (v34)
  {
    int v35 = v43;
    int v36 = v42;
    uint64_t v37 = [a3 commandBufferStorage];
    uint64_t v38 = v7[101] + 5864;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN3AGX20RenderUSCStateLoaderINS_6HAL2008EncodersENS1_7ClassesEE17dataBufferConfigsERK16AGXGPUCoreConfig_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v38;
    if (AGX::RenderUSCStateLoader<AGX::HAL200::Encoders,AGX::HAL200::Classes>::dataBufferConfigs(AGXGPUCoreConfig const&)::once != -1) {
      dispatch_once(&AGX::RenderUSCStateLoader<AGX::HAL200::Encoders,AGX::HAL200::Classes>::dataBufferConfigs(AGXGPUCoreConfig const&)::once, block);
    }
    *unint64_t v34 = &AGX::RenderUSCStateLoader<AGX::HAL200::Encoders,AGX::HAL200::Classes>::databuffer_configs;
    v34[1] = v7;
    v34[2] = v37;
    uint64_t v39 = *(void *)(v37 + 768);
    *((_DWORD *)v34 + 356) = 0;
    v34[177] = 0;
    v34[176] = 0;
    v34[175] = 0;
    v34[3] = v39;
    v34[4] = v37 + 144;
    v34[179] = *(void *)(v37 + 784);
    uint64_t v40 = *((void *)a3 + 86);
    AGX::FramebufferDriverConfigGen3_3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::FramebufferDriverConfigGen3_3((uint64_t)block, a4, *(_DWORD *)(v7[101] + 7764), 0);
    AGX::FramebufferGen3_3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::FramebufferGen3_3((uint64_t)(v34 + 180), v7, v40, (uint64_t)block, v35, v36, 0);
    v34[868] = 0;
    v34[867] = 64;
  }
  else
  {
    [(AGXG17FamilyThreadedRenderPass *)v6 endEncoding];

    return 0;
  }
  return v6;
}

@end