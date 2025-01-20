@interface AGXG17FamilyTileRenderPipeline
- (AGXG17FamilyTileRenderPipeline)initWithDeviceAndTileDesc:(id)a3 tilePipelineStateDescriptor:(id)a4;
- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newTileShaderDebugInfo;
- (void)dealloc;
@end

@implementation AGXG17FamilyTileRenderPipeline

- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  uint64_t v271 = *MEMORY[0x263EF8340];
  if (self->super._basePipeline) {
    basePipeline = (AGXG17FamilyTileRenderPipeline *)self->super._basePipeline;
  }
  else {
    basePipeline = self;
  }
  v7 = [(AGXG17FamilyRenderPipeline *)[AGXG17FamilyTileRenderPipeline alloc] initWithParent:basePipeline];
  v8 = [(_MTLRenderPipelineState *)self device];
  v9 = @"Failed to allocate a new pipeline";
  v252 = @"Failed to allocate a new pipeline";
  if (!v7) {
    goto LABEL_281;
  }
  v226 = v7;
  uint64_t p_impl = (uint64_t)&v7->super._impl;
  v11 = &self->super._impl;
  v229 = (uint64_t **)v8;
  AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::copyStateAndFunctionsFromOriginal((uint64_t)&v7->super._impl, (uint64_t)v8, (uint64_t)&self->super._impl, [a3 count]);
  unint64_t prime = vcvtps_u32_f32((float)(unint64_t)([a3 count] + *(void *)&v7->super._anon_1a8[2344])/ *(float *)&v7->super._anon_1a8[2352]);
  if (prime == 1)
  {
    unint64_t prime = 2;
  }
  else if ((prime & (prime - 1)) != 0)
  {
    unint64_t prime = std::__next_prime(prime);
  }
  int8x8_t v13 = *(int8x8_t *)&v7->super._anon_1a8[2328];
  if (prime > *(void *)&v13) {
    goto LABEL_10;
  }
  if (prime < *(void *)&v13)
  {
    uint8x8_t v14 = (uint8x8_t)vcnt_s8(v13);
    v14.i16[0] = vaddlv_u8(v14);
    unint64_t v15 = vcvtps_u32_f32((float)*(unint64_t *)(p_impl + 2624) / *(float *)(p_impl + 2632));
    if (*(void *)&v13 < 3uLL || v14.u32[0] > 1uLL)
    {
      unint64_t v15 = std::__next_prime(v15);
    }
    else
    {
      uint64_t v17 = 1 << -(char)__clz(v15 - 1);
      if (v15 >= 2) {
        unint64_t v15 = v17;
      }
    }
    if (prime <= v15) {
      unint64_t prime = v15;
    }
    if (prime < *(void *)&v13) {
LABEL_10:
    }
      std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__do_rehash<true>(p_impl + 2600, prime);
  }
  v236 = (uint64_t *)(p_impl + 2944);
  iosurface = (std::__shared_weak_count *)v11[10].resource_info[8].iosurface;
  v253[0] = (uint64_t)v11[10].resource_info[7].iosurface;
  v253[1] = (uint64_t)iosurface;
  if (iosurface) {
    atomic_fetch_add_explicit(&iosurface->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v19 = AGX::mergeAndInsertAdditionalBinaryLinkedFunctions<AGX::HAL200::ObjClasses,AGX::HAL200::Classes>(v229, a3, p_impl + 2600, v236, v253, (int)v11[5].resource_info[15].iosurface, (uint64_t *)&v252);
  int v20 = v19;
  if (iosurface && !atomic_fetch_add(&iosurface->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))iosurface->__on_zero_shared)(iosurface);
    std::__shared_weak_count::__release_weak(iosurface);
    if (v20) {
      goto LABEL_28;
    }
  }
  else if (v19)
  {
LABEL_28:
    uint64_t v225 = *(void *)(p_impl + 16);
    v231 = v11[10].resource_info[7].iosurface;
    v21 = (std::__shared_weak_count *)v11[10].resource_info[8].iosurface;
    if (v21) {
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v224 = v21;
    int v22 = *(unsigned __int8 *)(p_impl + 709);
    uint64_t v24 = *((void *)v231 + 4);
    uint64_t v23 = *((void *)v231 + 5);
    uint64_t v25 = [a3 count];
    uint64_t v232 = (v23 - v24) / 1304;
    unint64_t v223 = 4 * v25;
    uint64_t v26 = v232 + 4 * v25;
    unint64_t v27 = v26 + 1;
    if (v26 == -1)
    {
      v28 = 0;
      __p = 0;
    }
    else
    {
      if (v27 > 0x2AAAAAAAAAAAAAALL) {
        abort();
      }
      __p = (char *)operator new(96 * v27);
      v28 = &__p[96 * v27];
    }
    v266 = 0;
    v267 = 0;
    v268 = 0;
    unint64_t v30 = v27 + ((uint64_t)(*(void *)(p_impl + 2456) - *(void *)(p_impl + 2448)) >> 4);
    id obj = a3;
    int v221 = v22;
    uint64_t v222 = v25;
    uint64_t v234 = v23;
    uint64_t v238 = v24;
    if (v30)
    {
      if (v30 > 0x333333333333333) {
        abort();
      }
      v31 = v28;
      v32 = (char *)operator new(80 * v30);
      v33 = &v32[80 * v30];
      v266 = v32;
      v267 = v32;
      v268 = v33;
      v28 = v31;
    }
    else
    {
      v33 = 0;
      v32 = 0;
    }
    uint64_t v237 = p_impl;
    uint64_t v34 = p_impl + 1536;
    v35 = &v11[5].resource_info[6];
    uint64_t v36 = v225 + 8;
    v37 = (_OWORD *)(v225 + 1208);
    long long v269 = *(_OWORD *)(v225 + 1208);
    uint64_t v270 = *(void *)(v225 + 1224);
    uint64_t v38 = *(void *)(v225 + 1464);
    uint64_t v39 = *(void *)(v225 + 1456);
    uint64_t v40 = *(void *)(v225 + 1472);
    v41 = (_OWORD *)(v225 + 2552);
    long long v256 = *(_OWORD *)(v225 + 2552);
    *(void *)&long long v257 = *(void *)(v225 + 2568);
    uint64_t v241 = v40;
    if (__p >= v28)
    {
      uint64_t v245 = v38;
      unint64_t v46 = 0x5555555555555556 * ((v28 - __p) >> 5);
      if (v46 <= 1) {
        unint64_t v46 = 1;
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v28 - __p) >> 5) >= 0x155555555555555) {
        unint64_t v47 = 0x2AAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v47 = v46;
      }
      if (v47 > 0x2AAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      v48 = (char *)operator new(96 * v47);
      v49 = &v48[96 * v47];
      *(void *)v48 = v36;
      uint64_t v50 = *(void *)(v225 + 1224);
      *(_OWORD *)(v48 + 8) = *v37;
      *((void *)v48 + 3) = v50;
      *((void *)v48 + 4) = v39;
      uint64_t v40 = v241;
      uint64_t v38 = v245;
      *((void *)v48 + 5) = v245;
      *((void *)v48 + 6) = v241;
      uint64_t v51 = *(void *)(v225 + 2568);
      *(_OWORD *)(v48 + 56) = *v41;
      *((void *)v48 + 9) = v51;
      *((void *)v48 + 10) = v34;
      *((void *)v48 + 11) = v35;
      v44 = v48 + 96;
      if (__p)
      {
        operator delete(__p);
        uint64_t v40 = v241;
        uint64_t v38 = v245;
      }
      __p = v48;
      unint64_t v45 = v232;
      v28 = v49;
    }
    else
    {
      *(void *)__p = v36;
      uint64_t v42 = *(void *)(v225 + 1224);
      *(_OWORD *)(__p + 8) = *v37;
      *((void *)__p + 3) = v42;
      *((void *)__p + 4) = v39;
      *((void *)__p + 5) = v38;
      *((void *)__p + 6) = v40;
      uint64_t v43 = *(void *)(v225 + 2568);
      *(_OWORD *)(__p + 56) = *v41;
      *((void *)__p + 9) = v43;
      *((void *)__p + 10) = v34;
      *((void *)__p + 11) = v35;
      v44 = __p + 96;
      unint64_t v45 = v232;
    }
    if (v32 >= v33)
    {
      v246 = v28;
      unint64_t v54 = 0x999999999999999ALL * ((v33 - v32) >> 4);
      if (v54 <= 1) {
        unint64_t v54 = 1;
      }
      if (0xCCCCCCCCCCCCCCCDLL * ((v33 - v32) >> 4) >= 0x199999999999999) {
        unint64_t v55 = 0x333333333333333;
      }
      else {
        unint64_t v55 = v54;
      }
      if (v55 > 0x333333333333333) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      uint64_t v56 = v38;
      v57 = (char *)operator new(80 * v55);
      *(void *)v57 = v36;
      *(_OWORD *)(v57 + 8) = v269;
      *((void *)v57 + 3) = v270;
      *((void *)v57 + 4) = v39;
      *((void *)v57 + 5) = v56;
      *((void *)v57 + 6) = v241;
      *(_OWORD *)(v57 + 56) = v256;
      *((void *)v57 + 9) = v257;
      v52 = v57 + 80;
      v266 = v57;
      v268 = &v57[80 * v55];
      uint64_t v53 = v234;
      if (v32) {
        operator delete(v32);
      }
      v28 = v246;
    }
    else
    {
      *(void *)v32 = v36;
      *(_OWORD *)(v32 + 8) = v269;
      *((void *)v32 + 3) = v270;
      *((void *)v32 + 4) = v39;
      *((void *)v32 + 5) = v38;
      *((void *)v32 + 6) = v40;
      *(_OWORD *)(v32 + 56) = v256;
      v52 = v32 + 80;
      *((void *)v32 + 9) = v257;
      uint64_t v53 = v234;
    }
    v267 = v52;
    if (v53 != v238)
    {
      uint64_t v58 = 0;
      if (v45 <= 1) {
        uint64_t v59 = 1;
      }
      else {
        uint64_t v59 = v45;
      }
      uint64_t v230 = v59;
      do
      {
        uint64_t v60 = 0;
        uint64_t v235 = v58;
        uint64_t v61 = 1304 * v58;
        uint64_t v239 = *((void *)v231 + 4) + v61 + 112;
        uint64_t v242 = *(void *)(*v236 + 32) + v61 + 112;
        do
        {
          v64 = (uint64_t *)(v242 + 296 * v60);
          uint64_t v65 = *v64;
          if (*v64)
          {
            uint64_t v66 = v65 + 8;
            long long v269 = *(_OWORD *)(v65 + 1160);
            uint64_t v270 = *(void *)(v65 + 1176);
            uint64_t v67 = *(void *)(v65 + 1416);
            uint64_t v68 = *(void *)(v65 + 1408);
            uint64_t v69 = *(void *)(v65 + 1424);
            long long v256 = *(_OWORD *)(v65 + 2496);
            *(void *)&long long v257 = *(void *)(v65 + 2512);
            long long v264 = *(_OWORD *)(v65 + 1160);
            v265 = *(char **)(v65 + 1176);
            v70 = v64 + 1;
            long long v262 = *(_OWORD *)(v65 + 2496);
            uint64_t v71 = v239 + 296 * v60 + 8;
            v263 = *(char **)(v65 + 2512);
            if (v44 >= v28)
            {
              unint64_t v73 = 0xAAAAAAAAAAAAAAABLL * ((v44 - __p) >> 5) + 1;
              if (v73 > 0x2AAAAAAAAAAAAAALL) {
                abort();
              }
              if (0x5555555555555556 * ((v28 - __p) >> 5) > v73) {
                unint64_t v73 = 0x5555555555555556 * ((v28 - __p) >> 5);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((v28 - __p) >> 5) >= 0x155555555555555) {
                unint64_t v74 = 0x2AAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v74 = v73;
              }
              if (v74)
              {
                if (v74 > 0x2AAAAAAAAAAAAAALL) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                v75 = v70;
                uint64_t v76 = v65 + 8;
                uint64_t v77 = v68;
                uint64_t v78 = v69;
                uint64_t v79 = v67;
                unint64_t v80 = v74;
                v81 = (char *)operator new(96 * v74);
                uint64_t v67 = v79;
                uint64_t v69 = v78;
                uint64_t v68 = v77;
                uint64_t v66 = v76;
                v70 = v75;
                uint64_t v71 = v239 + 296 * v60 + 8;
                unint64_t v74 = v80;
              }
              else
              {
                v81 = 0;
              }
              v82 = &v81[32 * ((v44 - __p) >> 5)];
              *(void *)v82 = v66;
              *(_OWORD *)(v82 + 8) = v264;
              *((void *)v82 + 3) = v265;
              *((void *)v82 + 4) = v68;
              *((void *)v82 + 5) = v67;
              *((void *)v82 + 6) = v69;
              *(_OWORD *)(v82 + 56) = v262;
              *((void *)v82 + 9) = v263;
              *((void *)v82 + 10) = v70;
              *((void *)v82 + 11) = v71;
              if (v44 == __p)
              {
                v85 = &v81[32 * ((v44 - __p) >> 5)];
                v84 = __p;
              }
              else
              {
                v83 = &v81[32 * ((v44 - __p) >> 5)];
                v84 = __p;
                do
                {
                  v85 = v83 - 96;
                  long long v86 = *((_OWORD *)v44 - 5);
                  *((_OWORD *)v83 - 6) = *((_OWORD *)v44 - 6);
                  *((_OWORD *)v83 - 5) = v86;
                  long long v87 = *((_OWORD *)v44 - 4);
                  long long v88 = *((_OWORD *)v44 - 3);
                  long long v89 = *((_OWORD *)v44 - 1);
                  *((_OWORD *)v83 - 2) = *((_OWORD *)v44 - 2);
                  *((_OWORD *)v83 - 1) = v89;
                  *((_OWORD *)v83 - 4) = v87;
                  *((_OWORD *)v83 - 3) = v88;
                  v44 -= 96;
                  v83 -= 96;
                }
                while (v44 != __p);
              }
              v28 = &v81[96 * v74];
              v44 = v82 + 96;
              if (v84)
              {
                v90 = &v81[96 * v74];
                uint64_t v91 = v67;
                operator delete(v84);
                uint64_t v67 = v91;
                v28 = v90;
              }
              __p = v85;
            }
            else
            {
              *(void *)v44 = v66;
              v72 = v265;
              *(_OWORD *)(v44 + 8) = v264;
              *((void *)v44 + 3) = v72;
              *((void *)v44 + 4) = v68;
              *((void *)v44 + 5) = v67;
              *((void *)v44 + 6) = v69;
              *(_OWORD *)(v44 + 56) = v262;
              *((void *)v44 + 9) = v263;
              *((void *)v44 + 10) = v70;
              *((void *)v44 + 11) = v71;
              v44 += 96;
              v52 = v267;
            }
            if (v52 < v268)
            {
              *(void *)v52 = v66;
              uint64_t v62 = v270;
              *(_OWORD *)(v52 + 8) = v269;
              *((void *)v52 + 3) = v62;
              *((void *)v52 + 4) = v68;
              *((void *)v52 + 5) = v67;
              *((void *)v52 + 6) = v69;
              *(_OWORD *)(v52 + 56) = v256;
              *((void *)v52 + 9) = v257;
              v63 = v52 + 80;
            }
            else
            {
              v92 = (char *)v266;
              unint64_t v93 = 0xCCCCCCCCCCCCCCCDLL * ((v52 - (unsigned char *)v266) >> 4);
              unint64_t v94 = v93 + 1;
              if (v93 + 1 > 0x333333333333333) {
                abort();
              }
              if (0x999999999999999ALL * ((v268 - (unsigned char *)v266) >> 4) > v94) {
                unint64_t v94 = 0x999999999999999ALL * ((v268 - (unsigned char *)v266) >> 4);
              }
              if (0xCCCCCCCCCCCCCCCDLL * ((v268 - (unsigned char *)v266) >> 4) >= 0x199999999999999) {
                unint64_t v95 = 0x333333333333333;
              }
              else {
                unint64_t v95 = v94;
              }
              v247 = v28;
              if (v95)
              {
                if (v95 > 0x333333333333333) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                uint64_t v96 = v66;
                uint64_t v97 = v68;
                uint64_t v98 = v69;
                uint64_t v99 = v67;
                v100 = (char *)operator new(80 * v95);
                uint64_t v67 = v99;
                uint64_t v69 = v98;
                uint64_t v68 = v97;
                uint64_t v66 = v96;
              }
              else
              {
                v100 = 0;
              }
              v101 = &v100[80 * v93];
              *(void *)v101 = v66;
              *(_OWORD *)(v101 + 8) = v269;
              *((void *)v101 + 3) = v270;
              *((void *)v101 + 4) = v68;
              *((void *)v101 + 5) = v67;
              *((void *)v101 + 6) = v69;
              *(_OWORD *)(v101 + 56) = v256;
              *((void *)v101 + 9) = v257;
              v102 = v101;
              if (v52 != v92)
              {
                do
                {
                  *((_OWORD *)v102 - 5) = *((_OWORD *)v52 - 5);
                  long long v103 = *((_OWORD *)v52 - 4);
                  long long v104 = *((_OWORD *)v52 - 3);
                  long long v105 = *((_OWORD *)v52 - 1);
                  *((_OWORD *)v102 - 2) = *((_OWORD *)v52 - 2);
                  *((_OWORD *)v102 - 1) = v105;
                  *((_OWORD *)v102 - 4) = v103;
                  *((_OWORD *)v102 - 3) = v104;
                  v102 -= 80;
                  v52 -= 80;
                }
                while (v52 != v92);
                v52 = v92;
              }
              v106 = &v100[80 * v95];
              v63 = v101 + 80;
              v266 = v102;
              v268 = v106;
              if (v52) {
                operator delete(v52);
              }
              v28 = v247;
            }
            v267 = v63;
            v52 = v63;
          }
          ++v60;
        }
        while (v60 != 4);
        uint64_t v58 = v235 + 1;
      }
      while (v235 + 1 != v230);
    }
    v107 = *(uint64_t **)(v237 + 2448);
    v108 = *(uint64_t **)(v237 + 2456);
    v248 = v28;
    if (v107 != v108)
    {
      while (1)
      {
        uint64_t v109 = *v107;
        v110 = (std::__shared_weak_count *)v107[1];
        if (v110) {
          atomic_fetch_add_explicit(&v110->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v111 = v109 + 96;
        long long v269 = *(_OWORD *)(v109 + 680);
        uint64_t v270 = *(void *)(v109 + 696);
        long long v256 = *(_OWORD *)(v109 + 768);
        *(void *)&long long v257 = *(void *)(v109 + 784);
        long long v264 = *(_OWORD *)(v109 + 944);
        v265 = *(char **)(v109 + 960);
        v112 = v267;
        if (v267 >= v268) {
          break;
        }
        *(void *)v267 = v111;
        *(_OWORD *)(v112 + 8) = v269;
        *((void *)v112 + 3) = v270;
        *((_OWORD *)v112 + 2) = v256;
        *((void *)v112 + 6) = v257;
        *(_OWORD *)(v112 + 56) = v264;
        *((void *)v112 + 9) = v265;
        v267 = v112 + 80;
        if (v110) {
          goto LABEL_134;
        }
LABEL_112:
        v107 += 2;
        if (v107 == v108) {
          goto LABEL_136;
        }
      }
      v113 = (char *)v266;
      unint64_t v114 = 0xCCCCCCCCCCCCCCCDLL * ((v267 - (unsigned char *)v266) >> 4);
      unint64_t v115 = v114 + 1;
      if (v114 + 1 > 0x333333333333333) {
        abort();
      }
      if (0x999999999999999ALL * ((v268 - (unsigned char *)v266) >> 4) > v115) {
        unint64_t v115 = 0x999999999999999ALL * ((v268 - (unsigned char *)v266) >> 4);
      }
      if (0xCCCCCCCCCCCCCCCDLL * ((v268 - (unsigned char *)v266) >> 4) >= 0x199999999999999) {
        unint64_t v116 = 0x333333333333333;
      }
      else {
        unint64_t v116 = v115;
      }
      if (v116)
      {
        if (v116 > 0x333333333333333) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        v117 = (char *)operator new(80 * v116);
      }
      else
      {
        v117 = 0;
      }
      v118 = &v117[80 * v114];
      *(void *)v118 = v111;
      *(_OWORD *)(v118 + 8) = v269;
      *((void *)v118 + 3) = v270;
      *((_OWORD *)v118 + 2) = v256;
      *((void *)v118 + 6) = v257;
      *(_OWORD *)(v118 + 56) = v264;
      *((void *)v118 + 9) = v265;
      v119 = v118;
      if (v112 != v113)
      {
        do
        {
          *((_OWORD *)v119 - 5) = *((_OWORD *)v112 - 5);
          long long v120 = *((_OWORD *)v112 - 4);
          long long v121 = *((_OWORD *)v112 - 3);
          long long v122 = *((_OWORD *)v112 - 1);
          *((_OWORD *)v119 - 2) = *((_OWORD *)v112 - 2);
          *((_OWORD *)v119 - 1) = v122;
          *((_OWORD *)v119 - 4) = v120;
          *((_OWORD *)v119 - 3) = v121;
          v119 -= 80;
          v112 -= 80;
        }
        while (v112 != v113);
        v112 = v113;
      }
      v123 = v118 + 80;
      v266 = v119;
      v268 = &v117[80 * v116];
      if (v112) {
        operator delete(v112);
      }
      v28 = v248;
      v267 = v123;
      if (!v110) {
        goto LABEL_112;
      }
LABEL_134:
      if (!atomic_fetch_add(&v110->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v110->__on_zero_shared)(v110);
        std::__shared_weak_count::__release_weak(v110);
        v28 = v248;
      }
      goto LABEL_112;
    }
LABEL_136:
    long long v264 = 0uLL;
    v265 = 0;
    if (v223)
    {
      if (v223 > 0x333333333333333) {
        abort();
      }
      v124 = (char *)operator new(320 * v222);
      uint64_t p_impl = v237;
      unint64_t v125 = v232;
      v126 = v124;
      *(void *)&long long v264 = v124;
      *((void *)&v264 + 1) = v124;
      v265 = &v124[80 * v223];
      v28 = v248;
    }
    else
    {
      v126 = 0;
      uint64_t p_impl = v237;
      unint64_t v125 = v232;
    }
    uint64_t v127 = *(void *)(*v236 + 32);
    if (v125 < 0x1F693A1C451AB30BLL * ((*(void *)(*v236 + 40) - v127) >> 3))
    {
      do
      {
        uint64_t v128 = 0;
        unint64_t v233 = v125;
        uint64_t v243 = v127 + 1304 * v125 + 112;
        do
        {
          v131 = (uint64_t *)(v243 + 296 * v128);
          uint64_t v132 = *v131;
          if (*v131)
          {
            uint64_t v133 = v132 + 8;
            long long v269 = *(_OWORD *)(v132 + 1160);
            uint64_t v270 = *(void *)(v132 + 1176);
            uint64_t v134 = *(void *)(v132 + 1416);
            uint64_t v135 = *(void *)(v132 + 1408);
            uint64_t v136 = *(void *)(v132 + 1424);
            long long v256 = *(_OWORD *)(v132 + 2496);
            *(void *)&long long v257 = *(void *)(v132 + 2512);
            long long v262 = *(_OWORD *)(v132 + 1160);
            v263 = *(char **)(v132 + 1176);
            long long v260 = *(_OWORD *)(v132 + 2496);
            v137 = v131 + 1;
            uint64_t v261 = *(void *)(v132 + 2512);
            if (v44 >= v28)
            {
              unint64_t v139 = 0xAAAAAAAAAAAAAAABLL * ((v44 - __p) >> 5) + 1;
              if (v139 > 0x2AAAAAAAAAAAAAALL) {
                abort();
              }
              if (0x5555555555555556 * ((v28 - __p) >> 5) > v139) {
                unint64_t v139 = 0x5555555555555556 * ((v28 - __p) >> 5);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((v28 - __p) >> 5) >= 0x155555555555555) {
                unint64_t v140 = 0x2AAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v140 = v139;
              }
              if (v140)
              {
                if (v140 > 0x2AAAAAAAAAAAAAALL) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                uint64_t v141 = v135;
                uint64_t v142 = v136;
                uint64_t v143 = v134;
                v144 = (char *)operator new(96 * v140);
                uint64_t v134 = v143;
                uint64_t v136 = v142;
                uint64_t v135 = v141;
              }
              else
              {
                v144 = 0;
              }
              v145 = &v144[32 * ((v44 - __p) >> 5)];
              *(void *)v145 = v133;
              *(_OWORD *)(v145 + 8) = v262;
              *((void *)v145 + 3) = v263;
              *((void *)v145 + 4) = v135;
              *((void *)v145 + 5) = v134;
              *((void *)v145 + 6) = v136;
              *(_OWORD *)(v145 + 56) = v260;
              *((void *)v145 + 9) = v261;
              *((void *)v145 + 10) = v137;
              *((void *)v145 + 11) = v137;
              if (v44 == __p)
              {
                v148 = &v144[32 * ((v44 - __p) >> 5)];
                v147 = __p;
              }
              else
              {
                v146 = &v144[32 * ((v44 - __p) >> 5)];
                v147 = __p;
                do
                {
                  v148 = v146 - 96;
                  long long v149 = *((_OWORD *)v44 - 5);
                  *((_OWORD *)v146 - 6) = *((_OWORD *)v44 - 6);
                  *((_OWORD *)v146 - 5) = v149;
                  long long v150 = *((_OWORD *)v44 - 4);
                  long long v151 = *((_OWORD *)v44 - 3);
                  long long v152 = *((_OWORD *)v44 - 1);
                  *((_OWORD *)v146 - 2) = *((_OWORD *)v44 - 2);
                  *((_OWORD *)v146 - 1) = v152;
                  *((_OWORD *)v146 - 4) = v150;
                  *((_OWORD *)v146 - 3) = v151;
                  v44 -= 96;
                  v146 -= 96;
                }
                while (v44 != __p);
              }
              v28 = &v144[96 * v140];
              v44 = v145 + 96;
              if (v147)
              {
                v153 = &v144[96 * v140];
                uint64_t v154 = v134;
                uint64_t v155 = v136;
                uint64_t v156 = v135;
                operator delete(v147);
                uint64_t v135 = v156;
                uint64_t v136 = v155;
                uint64_t v134 = v154;
                v28 = v153;
              }
              __p = v148;
            }
            else
            {
              *(void *)v44 = v133;
              v138 = v263;
              *(_OWORD *)(v44 + 8) = v262;
              *((void *)v44 + 3) = v138;
              *((void *)v44 + 4) = v135;
              *((void *)v44 + 5) = v134;
              *((void *)v44 + 6) = v136;
              *(_OWORD *)(v44 + 56) = v260;
              *((void *)v44 + 9) = v261;
              *((void *)v44 + 10) = v137;
              *((void *)v44 + 11) = v137;
              v44 += 96;
              v126 = (char *)*((void *)&v264 + 1);
            }
            if (v126 < v265)
            {
              *(void *)v126 = v133;
              uint64_t v129 = v270;
              *(_OWORD *)(v126 + 8) = v269;
              *((void *)v126 + 3) = v129;
              *((void *)v126 + 4) = v135;
              *((void *)v126 + 5) = v134;
              *((void *)v126 + 6) = v136;
              *(_OWORD *)(v126 + 56) = v256;
              *((void *)v126 + 9) = v257;
              v130 = v126 + 80;
              uint64_t p_impl = v237;
            }
            else
            {
              v157 = (char *)v264;
              unint64_t v158 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v126[-v264] >> 4);
              unint64_t v159 = v158 + 1;
              if (v158 + 1 > 0x333333333333333) {
                abort();
              }
              if (0x999999999999999ALL * ((uint64_t)&v265[-v264] >> 4) > v159) {
                unint64_t v159 = 0x999999999999999ALL * ((uint64_t)&v265[-v264] >> 4);
              }
              if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v265[-v264] >> 4) >= 0x199999999999999) {
                unint64_t v160 = 0x333333333333333;
              }
              else {
                unint64_t v160 = v159;
              }
              v249 = v28;
              if (v160)
              {
                if (v160 > 0x333333333333333) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                uint64_t v161 = v133;
                uint64_t v162 = v135;
                uint64_t v163 = v136;
                uint64_t v164 = v134;
                v165 = (char *)operator new(80 * v160);
                uint64_t v134 = v164;
                uint64_t v136 = v163;
                uint64_t v135 = v162;
                uint64_t v133 = v161;
              }
              else
              {
                v165 = 0;
              }
              v166 = &v165[80 * v158];
              *(void *)v166 = v133;
              *(_OWORD *)(v166 + 8) = v269;
              *((void *)v166 + 3) = v270;
              *((void *)v166 + 4) = v135;
              *((void *)v166 + 5) = v134;
              *((void *)v166 + 6) = v136;
              *(_OWORD *)(v166 + 56) = v256;
              *((void *)v166 + 9) = v257;
              v167 = v166;
              if (v126 == v157)
              {
                uint64_t p_impl = v237;
              }
              else
              {
                uint64_t p_impl = v237;
                do
                {
                  *((_OWORD *)v167 - 5) = *((_OWORD *)v126 - 5);
                  long long v168 = *((_OWORD *)v126 - 4);
                  long long v169 = *((_OWORD *)v126 - 3);
                  long long v170 = *((_OWORD *)v126 - 1);
                  *((_OWORD *)v167 - 2) = *((_OWORD *)v126 - 2);
                  *((_OWORD *)v167 - 1) = v170;
                  *((_OWORD *)v167 - 4) = v168;
                  *((_OWORD *)v167 - 3) = v169;
                  v167 -= 80;
                  v126 -= 80;
                }
                while (v126 != v157);
                v126 = v157;
              }
              v171 = &v165[80 * v160];
              v130 = v166 + 80;
              *(void *)&long long v264 = v167;
              v265 = v171;
              if (v126) {
                operator delete(v126);
              }
              v28 = v249;
            }
            *((void *)&v264 + 1) = v130;
            v126 = v130;
          }
          ++v128;
        }
        while (v128 != 4);
        unint64_t v125 = v233 + 1;
        uint64_t v127 = *(void *)(*v236 + 32);
      }
      while (v233 + 1 < 0x1F693A1C451AB30BLL * ((*(void *)(*v236 + 40) - v127) >> 3));
    }
    long long v258 = 0u;
    long long v259 = 0u;
    long long v256 = 0u;
    long long v257 = 0u;
    uint64_t v250 = [obj countByEnumeratingWithState:&v256 objects:&v269 count:16];
    if (v250)
    {
      uint64_t v240 = p_impl + 2448;
      uint64_t v244 = *(void *)v257;
      unint64_t v172 = 0x268D57000;
      while (2)
      {
        for (uint64_t i = 0; i != v250; ++i)
        {
          if (*(void *)v257 != v244) {
            objc_enumerationMutation(obj);
          }
          v174 = *(void **)(*((void *)&v256 + 1) + 8 * i);
          if (([v229 requiresRaytracingEmulation] & 1) != 0 || objc_msgSend(v174, "functionType") != 6)
          {
            if (![v174 vendorPrivate]
              || ([v174 vendorPrivate], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              LODWORD(v29) = 0;
              goto LABEL_250;
            }
            uint64_t v175 = [v174 vendorPrivate];
            v29 = (char *)v175;
            if (!v175) {
              goto LABEL_250;
            }
            uint64_t v176 = *(int *)(v172 + 1956);
            v177 = (__n128 *)(v175 + v176);
            unint64_t v178 = *(void *)(v175 + v176);
            v179 = *(__n128 **)(p_impl + 2456);
            if ((unint64_t)v179 >= *(void *)(p_impl + 2464))
            {
              v181 = std::vector<std::shared_ptr<AGX::HAL200::DynamicLibrary>>::__emplace_back_slow_path<std::shared_ptr<AGX::HAL200::DynamicLibrary>&>(v240, *v177);
              uint64_t v176 = *(int *)(v172 + 1956);
            }
            else
            {
              v179->n128_u64[0] = v178;
              unint64_t v180 = v177->n128_u64[1];
              v179->n128_u64[1] = v180;
              if (v180) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v180 + 8), 1uLL, memory_order_relaxed);
              }
              v181 = v179 + 1;
            }
            unint64_t v182 = v178 + 96;
            *(void *)(p_impl + 2456) = v181;
            uint64_t v183 = *(void *)&v29[v176];
            v263 = *(char **)(v183 + 696);
            long long v262 = *(_OWORD *)(v183 + 680);
            long long v260 = *(_OWORD *)(v183 + 768);
            uint64_t v261 = *(void *)(v183 + 784);
            long long v254 = *(_OWORD *)(v183 + 944);
            uint64_t v255 = *(void *)(v183 + 960);
            if (v126 >= v265)
            {
              v185 = (char *)v264;
              unint64_t v186 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v126[-v264] >> 4);
              unint64_t v187 = v186 + 1;
              if (v186 + 1 > 0x333333333333333) {
                abort();
              }
              if (0x999999999999999ALL * ((uint64_t)&v265[-v264] >> 4) > v187) {
                unint64_t v187 = 0x999999999999999ALL * ((uint64_t)&v265[-v264] >> 4);
              }
              if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v265[-v264] >> 4) >= 0x199999999999999) {
                unint64_t v188 = 0x333333333333333;
              }
              else {
                unint64_t v188 = v187;
              }
              if (v188)
              {
                if (v188 > 0x333333333333333) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                unint64_t v189 = v182;
                v190 = (char *)operator new(80 * v188);
                unint64_t v182 = v189;
              }
              else
              {
                v190 = 0;
              }
              v191 = &v190[80 * v186];
              *(void *)v191 = v182;
              *(_OWORD *)(v191 + 8) = v262;
              *((void *)v191 + 3) = v263;
              *((_OWORD *)v191 + 2) = v260;
              *((void *)v191 + 6) = v261;
              *(_OWORD *)(v191 + 56) = v254;
              *((void *)v191 + 9) = v255;
              if (v126 == v185)
              {
                v185 = v126;
                v192 = &v190[80 * v186];
              }
              else
              {
                v192 = &v190[80 * v186];
                do
                {
                  *((_OWORD *)v192 - 5) = *((_OWORD *)v126 - 5);
                  long long v193 = *((_OWORD *)v126 - 4);
                  long long v194 = *((_OWORD *)v126 - 3);
                  long long v195 = *((_OWORD *)v126 - 1);
                  *((_OWORD *)v192 - 2) = *((_OWORD *)v126 - 2);
                  *((_OWORD *)v192 - 1) = v195;
                  *((_OWORD *)v192 - 4) = v193;
                  *((_OWORD *)v192 - 3) = v194;
                  v192 -= 80;
                  v126 -= 80;
                }
                while (v126 != v185);
              }
              v126 = v191 + 80;
              *(void *)&long long v264 = v192;
              *((void *)&v264 + 1) = v191 + 80;
              v265 = &v190[80 * v188];
              if (v185)
              {
                unint64_t v196 = v182;
                operator delete(v185);
                unint64_t v182 = v196;
                unint64_t v172 = 0x268D57000uLL;
                uint64_t v176 = 56;
              }
              else
              {
                unint64_t v172 = 0x268D57000;
              }
            }
            else
            {
              *(void *)v126 = v182;
              long long v184 = v262;
              *((void *)v126 + 3) = v263;
              *(_OWORD *)(v126 + 8) = v184;
              *((_OWORD *)v126 + 2) = v260;
              *((void *)v126 + 6) = v261;
              *(_OWORD *)(v126 + 56) = v254;
              *((void *)v126 + 9) = v255;
              v126 += 80;
            }
            *((void *)&v264 + 1) = v126;
            uint64_t v197 = *(void *)&v29[v176];
            v263 = *(char **)(v197 + 696);
            long long v262 = *(_OWORD *)(v197 + 680);
            long long v260 = *(_OWORD *)(v197 + 768);
            uint64_t v261 = *(void *)(v197 + 784);
            long long v254 = *(_OWORD *)(v197 + 944);
            uint64_t v255 = *(void *)(v197 + 960);
            v198 = v267;
            if (v267 >= v268)
            {
              v199 = (char *)v266;
              unint64_t v200 = 0xCCCCCCCCCCCCCCCDLL * ((v267 - (unsigned char *)v266) >> 4);
              unint64_t v201 = v200 + 1;
              if (v200 + 1 > 0x333333333333333) {
                abort();
              }
              if (0x999999999999999ALL * ((v268 - (unsigned char *)v266) >> 4) > v201) {
                unint64_t v201 = 0x999999999999999ALL * ((v268 - (unsigned char *)v266) >> 4);
              }
              if (0xCCCCCCCCCCCCCCCDLL * ((v268 - (unsigned char *)v266) >> 4) >= 0x199999999999999) {
                unint64_t v202 = 0x333333333333333;
              }
              else {
                unint64_t v202 = v201;
              }
              if (v202)
              {
                if (v202 > 0x333333333333333) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                uint64_t v203 = v176;
                unint64_t v204 = v182;
                v205 = (char *)operator new(80 * v202);
                unint64_t v182 = v204;
                uint64_t v176 = v203;
              }
              else
              {
                v205 = 0;
              }
              v206 = &v205[80 * v200];
              *(void *)v206 = v182;
              *(_OWORD *)(v206 + 8) = v262;
              *((void *)v206 + 3) = v263;
              *((_OWORD *)v206 + 2) = v260;
              *((void *)v206 + 6) = v261;
              *(_OWORD *)(v206 + 56) = v254;
              *((void *)v206 + 9) = v255;
              v207 = v206;
              if (v198 != v199)
              {
                do
                {
                  *((_OWORD *)v207 - 5) = *((_OWORD *)v198 - 5);
                  long long v208 = *((_OWORD *)v198 - 4);
                  long long v209 = *((_OWORD *)v198 - 3);
                  long long v210 = *((_OWORD *)v198 - 1);
                  *((_OWORD *)v207 - 2) = *((_OWORD *)v198 - 2);
                  *((_OWORD *)v207 - 1) = v210;
                  *((_OWORD *)v207 - 4) = v208;
                  *((_OWORD *)v207 - 3) = v209;
                  v207 -= 80;
                  v198 -= 80;
                }
                while (v198 != v199);
                v198 = v199;
              }
              v266 = v207;
              v268 = &v205[80 * v202];
              unint64_t v172 = 0x268D57000uLL;
              if (v198)
              {
                operator delete(v198);
                uint64_t v176 = 56;
              }
              v198 = v206;
              uint64_t p_impl = v237;
            }
            else
            {
              *(void *)v267 = v182;
              *(_OWORD *)(v198 + 8) = v262;
              *((void *)v198 + 3) = v263;
              *((_OWORD *)v198 + 2) = v260;
              *((void *)v198 + 6) = v261;
              *(_OWORD *)(v198 + 56) = v254;
              *((void *)v198 + 9) = v255;
            }
            v267 = v198 + 80;
            AGX::applySPIRelocations<AGX::HAL200::ObjClasses,AGX::HAL200::DynamicLibrary>(*(void *)&v29[v176], (void *)[v29 relocations]);
          }
        }
        uint64_t v250 = [obj countByEnumeratingWithState:&v256 objects:&v269 count:16];
        if (v250) {
          continue;
        }
        break;
      }
    }
    long long v262 = 0uLL;
    v263 = 0;
    uint64_t v211 = v44 - __p;
    if (v44 == __p)
    {
      v212 = 0;
    }
    else
    {
      if (0xAAAAAAAAAAAAAAABLL * (v211 >> 5) > 0x2AAAAAAAAAAAAAALL) {
        abort();
      }
      v212 = (char *)operator new(v44 - __p);
      *(void *)&long long v262 = v212;
      *((void *)&v262 + 1) = v212;
      v263 = &v212[32 * (v211 >> 5)];
      size_t v213 = 96 * ((v211 - 96) / 0x60uLL) + 96;
      memcpy(v212, __p, v213);
      *((void *)&v262 + 1) = &v212[v213];
    }
    LODWORD(v29) = AGX::DynamicLoader<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,void>::load((uint64_t)v229, (uint64_t **)&v266, (uint64_t **)&v264, (size_t *)&v262, *(_DWORD *)(v225 + 1036), 0, &v252, v221 != 0);
    if (v212)
    {
      *((void *)&v262 + 1) = v212;
      operator delete(v212);
    }
LABEL_250:
    if ((void)v264) {
      operator delete((void *)v264);
    }
    if (v266) {
      operator delete(v266);
    }
    if (__p) {
      operator delete(__p);
    }
    if (v224 && !atomic_fetch_add(&v224->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v224->__on_zero_shared)(v224);
      std::__shared_weak_count::__release_weak(v224);
    }
    goto LABEL_259;
  }
  LODWORD(v29) = 0;
LABEL_259:
  if (([v229 requiresRaytracingEmulation] & 1) == 0)
  {
    AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::computeMaximumRayPayloadSizes((unsigned int *)p_impl);
    AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::createScsPerShaderConfigTables((uint64_t *)p_impl);
    AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::constructSpillParamsForIntersection(p_impl, v229[101]);
  }
  if (*(void *)p_impl && (*(unsigned char *)(*(void *)p_impl + 1951) & 0x18) != 0) {
    *(unsigned char *)(p_impl + 710) = 1;
  }
  uint64_t v214 = *(void *)(p_impl + 8);
  if (v214 && (*(unsigned char *)(v214 + 1951) & 0x18) != 0) {
    *(unsigned char *)(p_impl + 710) = 1;
  }
  uint64_t v215 = *(void *)(p_impl + 16);
  if (v215 && (*(unsigned char *)(v215 + 1951) & 0x18) != 0) {
    *(unsigned char *)(p_impl + 710) = 1;
  }
  uint64_t v216 = *(void *)(p_impl + 24);
  if (v216 && (*(unsigned char *)(v216 + 1951) & 0x18) != 0) {
    *(unsigned char *)(p_impl + 710) = 1;
  }
  uint64_t v217 = *(void *)(p_impl + 32);
  if (v217 && (*(unsigned char *)(v217 + 1951) & 0x18) != 0) {
    *(unsigned char *)(p_impl + 710) = 1;
  }
  AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::constructSpillParams((int8x8_t **)p_impl, v229[101]);
  if (v29)
  {
    uint64_t v218 = *(void *)(p_impl + 16);
    if (v218) {
      AGX::FragmentProgramVariantESLState<AGX::HAL200::Encoders,AGX::HAL200::Classes>::patchPipelineRequirements(v218 + 1936);
    }
    return v226;
  }
  v9 = v252;
  v7 = v226;
LABEL_281:
  if (a4 && v9)
  {
    uint64_t v220 = [NSDictionary dictionaryWithObject:v9 forKey:*MEMORY[0x263F08320]];
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"AGXMetalG17P" code:1 userInfo:v220];
  }

  return 0;
}

- (id)newTileShaderDebugInfo
{
  tile_variant = self->super._impl.tile_variant;
  if (!tile_variant) {
    return 0;
  }
  if (*((char *)tile_variant + 1583) < 0)
  {
    if (*((void *)tile_variant + 196)) {
      goto LABEL_4;
    }
    return 0;
  }
  if (!*((unsigned char *)tile_variant + 1583)) {
    return 0;
  }
LABEL_4:
  id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
  if (*((char *)tile_variant + 1583) < 0)
  {
    v4 = (char *)*((void *)tile_variant + 195);
    uint64_t v5 = *((void *)tile_variant + 196);
  }
  else
  {
    v4 = (char *)tile_variant + 1560;
    uint64_t v5 = *((unsigned __int8 *)tile_variant + 1583);
  }

  return (id)[v3 initWithBytes:v4 length:v5];
}

- (void)dealloc
{
  self->_tp = 0;
  v3.receiver = self;
  v3.super_class = (Class)AGXG17FamilyTileRenderPipeline;
  [(AGXG17FamilyRenderPipeline *)&v3 dealloc];
}

- (AGXG17FamilyTileRenderPipeline)initWithDeviceAndTileDesc:(id)a3 tilePipelineStateDescriptor:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AGXG17FamilyTileRenderPipeline;
  uint64_t v5 = -[_MTLRenderPipelineState initWithDeviceAndTileDesc:tilePipelineStateDescriptor:](&v9, sel_initWithDeviceAndTileDesc_tilePipelineStateDescriptor_, a3);
  if (v5)
  {
    v6 = (AGXG17FamilyTileProgram *)objc_msgSend((id)objc_msgSend(a4, "tileFunction"), "vendorPrivate");
    v5->_tp = v6;
    v7 = v6;
  }
  return v5;
}

@end