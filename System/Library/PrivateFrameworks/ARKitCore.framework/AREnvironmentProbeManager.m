@interface AREnvironmentProbeManager
- (AREnvironmentProbeManager)initWithMode:(int64_t)a3;
- (BOOL)_addProbeWithAnchor:(id)a3 timestamp:(double)a4 textureImmediately:(BOOL)a5;
- (BOOL)_isBusy;
- (BOOL)_textureDataIsBusy;
- (id).cxx_construct;
- (id)_fullDescription;
- (id)updateProbesForTimestamp:(double)a3 planes:()vector<ARTexturedPlane imageData:(std:(id)a5 :(id)a6 allocator<ARTexturedPlane>> *)a4 pose:(id)a7 enableDirectTexturingForProbesWithIdentifier:;
- (int64_t)mode;
- (void)_insertIntoQueue:(id)a3;
- (void)_requestTextureForProbe:(id)a3;
- (void)_updateProbesFromExistingAnchors:(id)a3;
@end

@implementation AREnvironmentProbeManager

- (AREnvironmentProbeManager)initWithMode:(int64_t)a3
{
  v32.receiver = self;
  v32.super_class = (Class)AREnvironmentProbeManager;
  v4 = [(AREnvironmentProbeManager *)&v32 init];
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    uint64_t v6 = objc_opt_new();
    initialProbeIdentifiers = v5->_initialProbeIdentifiers;
    v5->_initialProbeIdentifiers = (NSMutableArray *)v6;

    uint64_t v8 = objc_opt_new();
    anchorsToRemove = v5->_anchorsToRemove;
    v5->_anchorsToRemove = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    probesByIdentifier = v5->_probesByIdentifier;
    v5->_probesByIdentifier = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    probeIdentifiersByPlaneIdentifier = v5->_probeIdentifiersByPlaneIdentifier;
    v5->_probeIdentifiersByPlaneIdentifier = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    requestedProbeIdentifiers = v5->_requestedProbeIdentifiers;
    v5->_requestedProbeIdentifiers = (NSMutableArray *)v14;

    uint64_t v16 = objc_opt_new();
    updatedProbeIdentifiers = v5->_updatedProbeIdentifiers;
    v5->_updatedProbeIdentifiers = (NSMutableArray *)v16;

    uint64_t v18 = objc_opt_new();
    directTexturingIdentifiers = v5->_directTexturingIdentifiers;
    v5->_directTexturingIdentifiers = (NSMutableArray *)v18;

    dispatch_semaphore_t v20 = dispatch_semaphore_create(1);
    textureDataSemaphore = v5->_textureDataSemaphore;
    v5->_textureDataSemaphore = (OS_dispatch_semaphore *)v20;

    uint64_t v22 = objc_opt_new();
    probeUpdateQueue = v5->_probeUpdateQueue;
    v5->_probeUpdateQueue = (NSMutableArray *)v22;

    uint64_t v24 = objc_opt_new();
    currentProbeUpdate = v5->_currentProbeUpdate;
    v5->_currentProbeUpdate = (AREnvironmentProbeUpdate *)v24;

    [(AREnvironmentProbeUpdate *)v5->_currentProbeUpdate setManager:v5];
    v5->_lastProbeUpdateTime = 0.0;
    +[ARKitUserDefaults floatForKey:@"com.apple.arkit.environmentTexturing.minimumProbeUpdateInterval"];
    v5->_minimumProbeUpdateInterval = v26;
    dispatch_semaphore_t v27 = dispatch_semaphore_create(1);
    semaphore = v5->_semaphore;
    v5->_semaphore = (OS_dispatch_semaphore *)v27;

    uint64_t v29 = objc_opt_new();
    cubemapGenerator = v5->_cubemapGenerator;
    v5->_cubemapGenerator = (ARCubemapGenerator *)v29;
  }
  return v5;
}

- (BOOL)_textureDataIsBusy
{
  intptr_t v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_textureDataSemaphore, 0);
  if (!v3) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_textureDataSemaphore);
  }
  return v3 != 0;
}

- (BOOL)_isBusy
{
  intptr_t v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0);
  if (!v3) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  }
  return v3 != 0;
}

- (id)_fullDescription
{
  intptr_t v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = [(AREnvironmentProbeManager *)self description];
  v5 = [v3 stringWithFormat:@"%@\n", v4];

  if ([(AREnvironmentProbeManager *)self _isBusy]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  [v5 appendFormat:@"Status: %@\n", v6];
  if ([(AREnvironmentProbeManager *)self _textureDataIsBusy]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v5 appendFormat:@"TextureData Status: %@\n", v7];
  [v5 appendFormat:@"LastImageData: %@\n", self->_lastImageData];
  return v5;
}

- (void)_insertIntoQueue:(id)a3
{
  id v10 = a3;
  uint64_t v4 = -[NSMutableArray indexOfObject:](self->_probeUpdateQueue, "indexOfObject:");
  probeUpdateQueue = self->_probeUpdateQueue;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)probeUpdateQueue addObject:v10];
  }
  else
  {
    uint64_t v6 = [(NSMutableArray *)probeUpdateQueue objectAtIndexedSubscript:v4];
    [v6 lastUpdateTimestamp];
    double v8 = v7;

    [(NSMutableArray *)self->_probeUpdateQueue replaceObjectAtIndex:v4 withObject:v10];
    v9 = [(NSMutableArray *)self->_probeUpdateQueue objectAtIndexedSubscript:v4];
    [v9 setLastUpdateTimestamp:v8];
  }
}

- (id)updateProbesForTimestamp:(double)a3 planes:()vector<ARTexturedPlane imageData:(std:(id)a5 :(id)a6 allocator<ARTexturedPlane>> *)a4 pose:(id)a7 enableDirectTexturingForProbesWithIdentifier:
{
  uint64_t v224 = *MEMORY[0x1E4F143B8];
  id v173 = a5;
  id v12 = a6;
  id v172 = a7;
  v162 = v12;
  if (v12)
  {
    [v12 cameraTransform];
    simd_float4 v167 = v14;
    simd_float4 v169 = v13;
    simd_float4 v163 = v16;
    simd_float4 v165 = v15;
  }
  else
  {
    simd_float4 v167 = *(simd_float4 *)(MEMORY[0x1E4F149A0] + 16);
    simd_float4 v169 = *(simd_float4 *)MEMORY[0x1E4F149A0];
    simd_float4 v163 = *(simd_float4 *)(MEMORY[0x1E4F149A0] + 48);
    simd_float4 v165 = *(simd_float4 *)(MEMORY[0x1E4F149A0] + 32);
  }
  BOOL v17 = v12 != 0;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_storeStrong((id *)&self->_lastImageData, a5);
  *(simd_float4 *)self->_anon_80 = v169;
  *(simd_float4 *)&self->_anon_80[16] = v167;
  *(simd_float4 *)&self->_anon_80[32] = v165;
  *(simd_float4 *)&self->_anon_80[48] = v163;
  if (v173) {
    BOOL v18 = v17;
  }
  else {
    BOOL v18 = 0;
  }
  self->_isReady = v18;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  v177 = objc_opt_new();
  v19 = objc_opt_new();
  v175 = objc_opt_new();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_textureDataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [(NSMutableArray *)self->_directTexturingIdentifiers addObjectsFromArray:v172];
  [v175 addObjectsFromArray:self->_anchorsToRemove];
  [(NSMutableArray *)self->_anchorsToRemove removeAllObjects];
  dispatch_semaphore_t v20 = [(NSMutableDictionary *)self->_probeIdentifiersByPlaneIdentifier allValues];
  long long v205 = 0u;
  long long v206 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  v21 = self->_probesByIdentifier;
  uint64_t v22 = [(NSMutableDictionary *)v21 countByEnumeratingWithState:&v203 objects:v223 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v204;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v204 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = *(void **)(*((void *)&v203 + 1) + 8 * i);
        if (([v20 containsObject:v25] & 1) == 0)
        {
          float v26 = [(NSMutableDictionary *)self->_probesByIdentifier objectForKeyedSubscript:v25];
          if (([v25 isEqual:self->_universeProbeIdentifier] & 1) == 0
            && ([v26 lastUpdateTimestamp], a3 - v27 > 3.0)
            || [v25 isEqual:self->_universeProbeIdentifier]
            && ([v26 lastUpdateTimestamp], a3 - v28 > 15.0))
          {
            requestedProbeIdentifiers = self->_requestedProbeIdentifiers;
            v30 = [v26 identifier];
            LOBYTE(requestedProbeIdentifiers) = [(NSMutableArray *)requestedProbeIdentifiers containsObject:v30];

            if ((requestedProbeIdentifiers & 1) == 0)
            {
              v31 = (void *)[v26 copy];
              [v31 setLastUpdateTimestamp:a3];
              [(AREnvironmentProbeManager *)self _insertIntoQueue:v31];
            }
          }
        }
      }
      uint64_t v22 = [(NSMutableDictionary *)v21 countByEnumeratingWithState:&v203 objects:v223 count:16];
    }
    while (v22);
  }

  if ([(NSMutableArray *)self->_initialProbeIdentifiers count] && self->_isReady)
  {
    long long v201 = 0u;
    long long v202 = 0u;
    long long v199 = 0u;
    long long v200 = 0u;
    objc_super v32 = self->_initialProbeIdentifiers;
    uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v199 objects:v222 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v200;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v200 != v34) {
            objc_enumerationMutation(v32);
          }
          v36 = [(NSMutableDictionary *)self->_probesByIdentifier objectForKeyedSubscript:*(void *)(*((void *)&v199 + 1) + 8 * j)];
          v37 = (void *)[v36 copy];

          [v37 setLastUpdateTimestamp:a3];
          [(AREnvironmentProbeManager *)self _insertIntoQueue:v37];
        }
        uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v199 objects:v222 count:16];
      }
      while (v33);
    }

    [(NSMutableArray *)self->_initialProbeIdentifiers removeAllObjects];
  }
  if (self->_mode == 2)
  {
    if (!self->_universeProbeIdentifier && self->_isReady)
    {
      long long v197 = 0u;
      long long v198 = 0u;
      long long v195 = 0u;
      long long v196 = 0u;
      v130 = [(NSMutableDictionary *)self->_probesByIdentifier allValues];
      uint64_t v131 = [v130 countByEnumeratingWithState:&v195 objects:v221 count:16];
      if (v131)
      {
        uint64_t v132 = *(void *)v196;
        while (2)
        {
          for (uint64_t k = 0; k != v131; ++k)
          {
            if (*(void *)v196 != v132) {
              objc_enumerationMutation(v130);
            }
            v134 = *(void **)(*((void *)&v195 + 1) + 8 * k);
            [v134 extent];
            if (fabsf(v135) != INFINITY)
            {
              [v134 extent];
              if (fabsf(v136) != INFINITY)
              {
                [v134 extent];
                if (fabsf(v137) != INFINITY) {
                  continue;
                }
              }
            }
            v138 = [v134 identifier];
            universeProbeIdentifier = self->_universeProbeIdentifier;
            self->_universeProbeIdentifier = v138;

            goto LABEL_109;
          }
          uint64_t v131 = [v130 countByEnumeratingWithState:&v195 objects:v221 count:16];
          if (v131) {
            continue;
          }
          break;
        }
      }
LABEL_109:

      if (!self->_universeProbeIdentifier)
      {
        v140 = (NSUUID *)objc_opt_new();
        v141 = self->_universeProbeIdentifier;
        self->_universeProbeIdentifier = v140;

        v142 = [AREnvironmentProbeAnchor alloc];
        v143 = -[AREnvironmentProbeAnchor initWithIdentifier:transform:](v142, "initWithIdentifier:transform:", self->_universeProbeIdentifier, *MEMORY[0x1E4F149A0], *(double *)(MEMORY[0x1E4F149A0] + 16), *(double *)(MEMORY[0x1E4F149A0] + 32), *(double *)(MEMORY[0x1E4F149A0] + 48));
        v144 = _ARLogGeneral();
        if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
        {
          v145 = (objc_class *)objc_opt_class();
          NSStringFromClass(v145);
          id v146 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v146;
          __int16 v212 = 2048;
          v213 = self;
          __int16 v214 = 2114;
          v215 = v143;
          _os_log_impl(&dword_1B88A2000, v144, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Added universe probe: %{public}@", buf, 0x20u);
        }
        [(NSMutableDictionary *)self->_probesByIdentifier setObject:v143 forKeyedSubscript:self->_universeProbeIdentifier];
        [v177 addObject:v143];
        v147 = (void *)[(AREnvironmentProbeAnchor *)v143 copy];
        [v147 setLastUpdateTimestamp:a3];
        [(AREnvironmentProbeManager *)self _insertIntoQueue:v147];
      }
    }
    v194[1] = 0;
    v194[0] = 0;
    v193 = (uint64_t *)v194;
    begin = a4->__begin_;
    end = a4->__end_;
    if (a4->__begin_ != end)
    {
      p_pair1 = &begin[3].var4.__tree_.__pair1_;
      do
      {
        *(void *)buf = begin;
        v41 = (uint64_t **)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>(&v193, (uint64_t)begin, (uint64_t)&std::piecewise_construct, (long long **)buf);
        v42 = v41;
        array<unsigned char, 16UL> var0 = begin->var0;
        long long v44 = *(_OWORD *)&begin->var1;
        long long v45 = *(_OWORD *)&begin->var5;
        *((_OWORD *)v41 + 5) = *(_OWORD *)&begin->var4.__tree_.__pair1_.__value_.__left_;
        *((_OWORD *)v41 + 6) = v45;
        *((array<unsigned char, 16UL> *)v41 + 3) = var0;
        *((_OWORD *)v41 + 4) = v44;
        long long v46 = *(long long *)((char *)&begin[1].var0 + 8);
        long long v47 = *(_OWORD *)&begin[1].var4.__tree_.__begin_node_;
        array<unsigned char, 16UL> v48 = begin[2].var0;
        *((_OWORD *)v41 + 9) = *(_OWORD *)&begin[1].var4.__tree_.__pair3_.__value_;
        *((array<unsigned char, 16UL> *)v41 + 10) = v48;
        *((_OWORD *)v41 + 7) = v46;
        *((_OWORD *)v41 + 8) = v47;
        long long v49 = *(_OWORD *)&begin[2].var1;
        long long v50 = *(_OWORD *)&begin[2].var4.__tree_.__pair1_.__value_.__left_;
        long long v51 = *(long long *)((char *)&begin[3].var0 + 8);
        *((_OWORD *)v41 + 13) = *(_OWORD *)&begin[2].var5;
        *((_OWORD *)v41 + 14) = v51;
        *((_OWORD *)v41 + 11) = v49;
        *((_OWORD *)v41 + 12) = v50;
        if (v41 + 6 != (uint64_t **)begin) {
          std::__tree<std::array<unsigned char,16ul>>::__assign_multi<std::__tree_const_iterator<std::array<unsigned char,16ul>,std::__tree_node<std::array<unsigned char,16ul>,void *> *,long>>(v41 + 30, (void *)begin[3].var4.__tree_.__begin_node_, p_pair1);
        }
        objc_storeStrong((id *)v42 + 33, begin[3].var5);
        p_pair1 += 28;
        begin += 4;
      }
      while (begin != end);
    }
    keys<std::array<unsigned char,16ul>,ARTexturedPlane>((char *)&v193, (uint64_t)v192);
    v191[1] = 0;
    v191[0] = 0;
    v190 = (uint64_t *)v191;
    v52 = self->_lastPlanes.__begin_;
    v53 = self->_lastPlanes.__end_;
    while (v52 != v53)
    {
      std::__tree<std::array<unsigned char,16ul>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::array<unsigned char,16ul>>(&v190, (uint64_t)v52, v52);
      v52 += 4;
    }
    notInLeftButRight<std::array<unsigned char,16ul>>((char *)&v190, v192, (uint64_t)&v188);
    notInLeftButRight<std::array<unsigned char,16ul>>((char *)v192, &v190, (uint64_t)&v186);
    intersect<std::array<unsigned char,16ul>>(&v190, (uint64_t)v192, (uint64_t)&v184);
    v183[0] = 0;
    v183[1] = 0;
    v182 = (uint64_t *)v183;
    v54 = v184;
    if (v184 != v185)
    {
      do
      {
        v55 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:(char *)v54 + 25];
        v56 = [(NSMutableDictionary *)self->_probeIdentifiersByPlaneIdentifier objectForKeyedSubscript:v55];
        v57 = [(NSMutableDictionary *)self->_probesByIdentifier objectForKeyedSubscript:v56];
        *(void *)buf = (char *)v54 + 25;
        if (!*((void *)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>(&v193, (uint64_t)v54 + 25, (uint64_t)&std::piecewise_construct, (long long **)buf)+ 8)|| ([v57 lastUpdateTimestamp], a3 - v58 > 3.0))
        {
          std::__tree<std::array<unsigned char,16ul>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::array<unsigned char,16ul>>(&v182, (uint64_t)v54 + 25, (void **)((char *)v54 + 25));
        }

        v59 = v54[1];
        if (v59)
        {
          do
          {
            v60 = (void **)v59;
            v59 = (void *)*v59;
          }
          while (v59);
        }
        else
        {
          do
          {
            v60 = (void **)v54[2];
            BOOL v61 = *v60 == v54;
            v54 = v60;
          }
          while (!v61);
        }
        v54 = v60;
      }
      while (v60 != v185);
      v62 = v182;
      if (v182 != (uint64_t *)v183)
      {
        do
        {
          v63 = (AREnvironmentProbeAnchor *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:(char *)v62 + 25];
          v64 = [(NSMutableDictionary *)self->_probeIdentifiersByPlaneIdentifier objectForKeyedSubscript:v63];
          v65 = [(NSMutableDictionary *)self->_probesByIdentifier objectForKeyedSubscript:v64];
          if (v65
            && ([(NSMutableArray *)self->_requestedProbeIdentifiers containsObject:v64] & 1) == 0)
          {
            v66 = [AREnvironmentProbeAnchor alloc];
            *(void *)buf = (char *)v62 + 25;
            v67 = (id *)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>(&v193, (uint64_t)v62 + 25, (uint64_t)&std::piecewise_construct, (long long **)buf);
            long long v68 = *((_OWORD *)v67 + 12);
            v218[8] = *((_OWORD *)v67 + 11);
            v218[9] = v68;
            long long v69 = *((_OWORD *)v67 + 14);
            v218[10] = *((_OWORD *)v67 + 13);
            v218[11] = v69;
            long long v70 = *((_OWORD *)v67 + 8);
            v218[4] = *((_OWORD *)v67 + 7);
            v218[5] = v70;
            long long v71 = *((_OWORD *)v67 + 10);
            v218[6] = *((_OWORD *)v67 + 9);
            v218[7] = v71;
            long long v72 = *((_OWORD *)v67 + 4);
            v218[0] = *((_OWORD *)v67 + 3);
            v218[1] = v72;
            long long v73 = *((_OWORD *)v67 + 6);
            v218[2] = *((_OWORD *)v67 + 5);
            v218[3] = v73;
            std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v219, (uint64_t)(v67 + 30));
            id v220 = v67[33];
            v74 = [(AREnvironmentProbeAnchor *)v66 initWithIdentifier:v64 onPlane:v218];

            std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v219, v219[1]);
            if ([(NSMutableArray *)self->_probeUpdateQueue indexOfObject:v74] == 0x7FFFFFFFFFFFFFFFLL)
            {
              v75 = _ARLogGeneral();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
              {
                log = v75;
                v76 = (objc_class *)objc_opt_class();
                NSStringFromClass(v76);
                id v77 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                *(void *)&buf[4] = v77;
                __int16 v212 = 2048;
                v213 = self;
                __int16 v214 = 2114;
                v215 = v63;
                __int16 v216 = 2114;
                v217 = v74;
                _os_log_impl(&dword_1B88A2000, log, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Updating probe for plane %{public}@: %{public}@", buf, 0x2Au);

                v75 = log;
              }
            }
            *(void *)buf = (char *)v62 + 25;
            if (*((void *)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>(&v193, (uint64_t)v62 + 25, (uint64_t)&std::piecewise_construct, (long long **)buf)+ 8))
            {
              [v65 lastUpdateTimestamp];
              if (a3 - v78 > 3.0)
              {
                v79 = [v65 colorHistogram];
                [(AREnvironmentProbeAnchor *)v74 setColorHistogram:v79];

                [v65 opaquePixelPercentage];
                -[AREnvironmentProbeAnchor setOpaquePixelPercentage:](v74, "setOpaquePixelPercentage:");
              }
            }
            [(ARAnchor *)v74 setLastUpdateTimestamp:a3];
            [(AREnvironmentProbeManager *)self _insertIntoQueue:v74];
          }
          v80 = (uint64_t *)v62[1];
          if (v80)
          {
            do
            {
              v81 = v80;
              v80 = (uint64_t *)*v80;
            }
            while (v80);
          }
          else
          {
            do
            {
              v81 = (uint64_t *)v62[2];
              BOOL v61 = *v81 == (void)v62;
              v62 = v81;
            }
            while (!v61);
          }
          v62 = v81;
        }
        while (v81 != (uint64_t *)v183);
      }
    }
    v82 = v188;
    if (v188 != v189)
    {
      do
      {
        v83 = (AREnvironmentProbeAnchor *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:(char *)v82 + 25];
        v84 = objc_opt_new();
        v85 = [AREnvironmentProbeAnchor alloc];
        *(void *)buf = (char *)v82 + 25;
        v86 = (id *)std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::__emplace_unique_key_args<std::array<unsigned char,16ul>,std::piecewise_construct_t const&,std::tuple<std::array<unsigned char,16ul>&&>,std::tuple<>>(&v193, (uint64_t)v82 + 25, (uint64_t)&std::piecewise_construct, (long long **)buf);
        long long v87 = *((_OWORD *)v86 + 12);
        v208[8] = *((_OWORD *)v86 + 11);
        v208[9] = v87;
        long long v88 = *((_OWORD *)v86 + 14);
        v208[10] = *((_OWORD *)v86 + 13);
        v208[11] = v88;
        long long v89 = *((_OWORD *)v86 + 8);
        v208[4] = *((_OWORD *)v86 + 7);
        v208[5] = v89;
        long long v90 = *((_OWORD *)v86 + 10);
        v208[6] = *((_OWORD *)v86 + 9);
        v208[7] = v90;
        long long v91 = *((_OWORD *)v86 + 4);
        v208[0] = *((_OWORD *)v86 + 3);
        v208[1] = v91;
        long long v92 = *((_OWORD *)v86 + 6);
        v208[2] = *((_OWORD *)v86 + 5);
        v208[3] = v92;
        std::set<std::array<unsigned char,16ul>>::set[abi:ne180100]((uint64_t)v209, (uint64_t)(v86 + 30));
        id v210 = v86[33];
        v93 = [(AREnvironmentProbeAnchor *)v85 initWithIdentifier:v84 onPlane:v208];

        std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v209, v209[1]);
        v94 = _ARLogGeneral();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
        {
          v95 = (objc_class *)objc_opt_class();
          NSStringFromClass(v95);
          id v96 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          *(void *)&buf[4] = v96;
          __int16 v212 = 2048;
          v213 = self;
          __int16 v214 = 2114;
          v215 = v83;
          __int16 v216 = 2114;
          v217 = v93;
          _os_log_impl(&dword_1B88A2000, v94, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Added probe for plane %{public}@: %{public}@", buf, 0x2Au);
        }
        [(NSMutableDictionary *)self->_probesByIdentifier setObject:v93 forKeyedSubscript:v84];
        [(NSMutableDictionary *)self->_probeIdentifiersByPlaneIdentifier setObject:v84 forKeyedSubscript:v83];
        [v177 addObject:v93];
        v97 = (void *)[(AREnvironmentProbeAnchor *)v93 copy];
        [v97 setLastUpdateTimestamp:a3];
        [(AREnvironmentProbeManager *)self _insertIntoQueue:v97];

        v98 = v82[1];
        if (v98)
        {
          do
          {
            v99 = (void **)v98;
            v98 = (void *)*v98;
          }
          while (v98);
        }
        else
        {
          do
          {
            v99 = (void **)v82[2];
            BOOL v61 = *v99 == v82;
            v82 = v99;
          }
          while (!v61);
        }
        v82 = v99;
      }
      while (v99 != v189);
    }
    v100 = v186;
    if (v186 != v187)
    {
      do
      {
        v101 = (AREnvironmentProbeAnchor *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:(char *)v100 + 25];
        v102 = [(NSMutableDictionary *)self->_probeIdentifiersByPlaneIdentifier objectForKeyedSubscript:v101];
        [(NSMutableDictionary *)self->_probeIdentifiersByPlaneIdentifier removeObjectForKey:v101];
        v103 = [(NSMutableDictionary *)self->_probesByIdentifier objectForKeyedSubscript:v102];
        if (v103)
        {
          v104 = _ARLogGeneral();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
          {
            v105 = (objc_class *)objc_opt_class();
            NSStringFromClass(v105);
            id v106 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            *(void *)&buf[4] = v106;
            __int16 v212 = 2048;
            v213 = self;
            __int16 v214 = 2114;
            v215 = v101;
            __int16 v216 = 2114;
            v217 = v103;
            _os_log_impl(&dword_1B88A2000, v104, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Removed probe for plane %{public}@: %{public}@", buf, 0x2Au);
          }
          [v175 addObject:v103];
          [(NSMutableDictionary *)self->_probesByIdentifier removeObjectForKey:v102];
          [(NSMutableArray *)self->_probeUpdateQueue removeObject:v103];
        }

        v107 = v100[1];
        if (v107)
        {
          do
          {
            v108 = (void **)v107;
            v107 = (void *)*v107;
          }
          while (v107);
        }
        else
        {
          do
          {
            v108 = (void **)v100[2];
            BOOL v61 = *v108 == v100;
            v100 = v108;
          }
          while (!v61);
        }
        v100 = v108;
      }
      while (v108 != v187);
    }
    std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v182, v183[0]);
    std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v184, v185[0]);
    std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v186, v187[0]);
    std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v188, v189[0]);
    std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v190, v191[0]);
    std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v192, (void *)v192[1]);
    std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)&v193, v194[0]);
  }
  if (v173
    && [v173 pixelBuffer]
    && [(NSMutableArray *)self->_probeUpdateQueue count]
    && a3 - self->_lastProbeUpdateTime > self->_minimumProbeUpdateInterval)
  {
    v109 = [(NSMutableArray *)self->_probeUpdateQueue objectAtIndex:0];
    [v109 referenceTransform];
    float32x4_t v176 = v110;
    float32x4_t v174 = v111;
    float32x4_t v159 = v113;
    *(_OWORD *)loga = v112;
    [v109 extent];
    float32x4_t v158 = v114;
    v225.columns[1] = v167;
    v225.columns[0] = v169;
    v225.columns[3] = v163;
    v225.columns[2] = v165;
    simd_float4x4 v226 = __invert_f4(v225);
    float32x4_t v168 = (float32x4_t)v226.columns[2];
    float32x4_t v170 = (float32x4_t)v226.columns[0];
    float32x4_t v164 = (float32x4_t)v226.columns[3];
    float32x4_t v166 = (float32x4_t)v226.columns[1];
    [v173 cameraIntrinsics];
    float32x4_t v156 = v116;
    float32x4_t v157 = v115;
    float32x4_t v155 = v117;
    size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v173 pixelBuffer]);
    size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v173 pixelBuffer]);
    if (ARIsBoxInViewFrustum(v176, v174, *(float32x4_t *)loga, v159, v158, v127, v128, v129, Height, v120, v121, v122, v123, v124, v125, v126, v170, v166, v168,
                         v164,
                         v157,
                         v156,
                         v155,
                         (float)Width,
                         (float)Height))
    {
      self->_lastProbeUpdateTime = a3;
      [v109 setLastUpdateTimestamp:a3];
      [(NSMutableArray *)self->_probeUpdateQueue removeObjectAtIndex:0];
      [(AREnvironmentProbeManager *)self _requestTextureForProbe:v109];
    }
    else
    {
      [(NSMutableArray *)self->_probeUpdateQueue removeObjectAtIndex:0];
      [(AREnvironmentProbeManager *)self _insertIntoQueue:v109];
    }
  }
  long long v180 = 0u;
  long long v181 = 0u;
  long long v178 = 0u;
  long long v179 = 0u;
  v148 = self->_updatedProbeIdentifiers;
  uint64_t v149 = [(NSMutableArray *)v148 countByEnumeratingWithState:&v178 objects:v207 count:16];
  if (v149)
  {
    uint64_t v150 = *(void *)v179;
    do
    {
      for (uint64_t m = 0; m != v149; ++m)
      {
        if (*(void *)v179 != v150) {
          objc_enumerationMutation(v148);
        }
        v152 = [(NSMutableDictionary *)self->_probesByIdentifier objectForKeyedSubscript:*(void *)(*((void *)&v178 + 1) + 8 * m)];
        if (v152) {
          [v19 addObject:v152];
        }
      }
      uint64_t v149 = [(NSMutableArray *)v148 countByEnumeratingWithState:&v178 objects:v207 count:16];
    }
    while (v149);
  }

  [(NSMutableArray *)self->_updatedProbeIdentifiers removeAllObjects];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_textureDataSemaphore);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  std::vector<ARTexturedPlane>::__vdeallocate((uint64_t *)&self->_lastPlanes);
  *(_OWORD *)&self->_lastPlanes.__begin_ = *(_OWORD *)&a4->__begin_;
  self->_lastPlanes.__end_cap_.__value_ = a4->__end_cap_.__value_;
  a4->__begin_ = 0;
  a4->__end_ = 0;
  a4->__end_cap_.__value_ = 0;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  [(AREnvironmentProbeUpdate *)self->_currentProbeUpdate updateAddedProbeAnchors:v177 updatedProbeAnchors:v19 removedProbeAnchors:v175];
  v153 = self->_currentProbeUpdate;

  return v153;
}

- (void)_updateProbesFromExistingAnchors:(id)a3
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_textureDataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v76 = objc_opt_new();
  v75 = objc_opt_new();
  long long v72 = objc_opt_new();
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v93 objects:v107 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v94 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        probesByIdentifier = self->_probesByIdentifier;
        v11 = [v9 identifier];
        id v12 = [(NSMutableDictionary *)probesByIdentifier objectForKeyedSubscript:v11];
        LODWORD(probesByIdentifier) = v12 == 0;

        if (probesByIdentifier) {
          simd_float4 v13 = v76;
        }
        else {
          simd_float4 v13 = v75;
        }
        [v13 addObject:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v93 objects:v107 count:16];
    }
    while (v6);
  }

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  simd_float4 v14 = self->_probesByIdentifier;
  uint64_t v15 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v89 objects:v106 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v90;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v90 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v89 + 1) + 8 * j);
        v19 = [(NSMutableDictionary *)self->_probesByIdentifier objectForKeyedSubscript:v18];
        char v20 = [v5 containsObject:v19];

        if ((v20 & 1) == 0)
        {
          v21 = [(NSMutableDictionary *)self->_probesByIdentifier objectForKeyedSubscript:v18];
          [v72 addObject:v21];
        }
      }
      uint64_t v15 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v89 objects:v106 count:16];
    }
    while (v15);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obuint64_t j = v76;
  uint64_t v22 = [obj countByEnumeratingWithState:&v85 objects:v105 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v86;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v86 != v23) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v85 + 1) + 8 * k);
        directTexturingIdentifiers = self->_directTexturingIdentifiers;
        double v27 = [v25 identifier];
        uint64_t v28 = [(NSMutableArray *)directTexturingIdentifiers containsObject:v27];

        if (v28)
        {
          uint64_t v29 = self->_directTexturingIdentifiers;
          v30 = [v25 identifier];
          [(NSMutableArray *)v29 removeObject:v30];
        }
        BOOL v31 = [(AREnvironmentProbeManager *)self _addProbeWithAnchor:v25 timestamp:v28 textureImmediately:0.0];
        objc_super v32 = _ARLogGeneral();
        BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
        if (v31)
        {
          if (v33)
          {
            uint64_t v34 = (objc_class *)objc_opt_class();
            v35 = NSStringFromClass(v34);
            *(_DWORD *)buf = 138543874;
            v100 = v35;
            __int16 v101 = 2048;
            v102 = self;
            __int16 v103 = 2114;
            v104 = v25;
            _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Added probe: %{public}@", buf, 0x20u);
          }
        }
        else
        {
          if (v33)
          {
            v36 = (objc_class *)objc_opt_class();
            v37 = NSStringFromClass(v36);
            *(_DWORD *)buf = 138543874;
            v100 = v37;
            __int16 v101 = 2048;
            v102 = self;
            __int16 v103 = 2114;
            v104 = v25;
            _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Removed redundant probe: %{public}@", buf, 0x20u);
          }
          [(NSMutableArray *)self->_anchorsToRemove addObject:v25];
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v85 objects:v105 count:16];
    }
    while (v22);
  }

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v73 = v75;
  uint64_t v38 = [v73 countByEnumeratingWithState:&v81 objects:v98 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v82;
    do
    {
      for (uint64_t m = 0; m != v38; ++m)
      {
        if (*(void *)v82 != v39) {
          objc_enumerationMutation(v73);
        }
        v41 = *(void **)(*((void *)&v81 + 1) + 8 * m);
        v42 = self->_probesByIdentifier;
        v43 = [v41 identifier];
        long long v44 = [(NSMutableDictionary *)v42 objectForKeyedSubscript:v43];
        [v44 lastUpdateTimestamp];
        double v46 = v45;
        [v41 lastUpdateTimestamp];
        BOOL v48 = v46 > v47;

        if (!v48)
        {
          long long v49 = self->_probesByIdentifier;
          long long v50 = [v41 identifier];
          long long v51 = [(NSMutableDictionary *)v49 objectForKeyedSubscript:v50];

          v52 = self->_probesByIdentifier;
          v53 = [v41 identifier];
          [(NSMutableDictionary *)v52 setObject:v41 forKeyedSubscript:v53];

          updatedProbeIdentifiers = self->_updatedProbeIdentifiers;
          v55 = [v41 identifier];
          LODWORD(updatedProbeIdentifiers) = [(NSMutableArray *)updatedProbeIdentifiers containsObject:v55];

          if (updatedProbeIdentifiers)
          {
            v56 = [v51 environmentTexture];
            [v41 setEnvironmentTexture:v56];

            v57 = [v51 colorHistogram];
            [v41 setColorHistogram:v57];

            [v51 opaquePixelPercentage];
            objc_msgSend(v41, "setOpaquePixelPercentage:");
          }
        }
      }
      uint64_t v38 = [v73 countByEnumeratingWithState:&v81 objects:v98 count:16];
    }
    while (v38);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v58 = v72;
  uint64_t v59 = [v58 countByEnumeratingWithState:&v77 objects:v97 count:16];
  if (v59)
  {
    uint64_t v60 = *(void *)v78;
    do
    {
      for (uint64_t n = 0; n != v59; ++n)
      {
        if (*(void *)v78 != v60) {
          objc_enumerationMutation(v58);
        }
        v62 = *(void **)(*((void *)&v77 + 1) + 8 * n);
        v63 = _ARLogGeneral();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          v64 = (objc_class *)objc_opt_class();
          v65 = NSStringFromClass(v64);
          *(_DWORD *)buf = 138543874;
          v100 = v65;
          __int16 v101 = 2048;
          v102 = self;
          __int16 v103 = 2114;
          v104 = v62;
          _os_log_impl(&dword_1B88A2000, v63, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Removed probe: %{public}@", buf, 0x20u);
        }
        v66 = self->_probesByIdentifier;
        v67 = [v62 identifier];
        [(NSMutableDictionary *)v66 removeObjectForKey:v67];

        initialProbeIdentifiers = self->_initialProbeIdentifiers;
        long long v69 = [v62 identifier];
        [(NSMutableArray *)initialProbeIdentifiers removeObject:v69];

        [(NSMutableArray *)self->_probeUpdateQueue removeObject:v62];
        long long v70 = [v62 identifier];
        LODWORD(initialProbeIdentifiers) = [v70 isEqual:self->_universeProbeIdentifier];

        if (initialProbeIdentifiers)
        {
          universeProbeIdentifier = self->_universeProbeIdentifier;
          self->_universeProbeIdentifier = 0;
        }
      }
      uint64_t v59 = [v58 countByEnumeratingWithState:&v77 objects:v97 count:16];
    }
    while (v59);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_textureDataSemaphore);
}

- (BOOL)_addProbeWithAnchor:(id)a3 timestamp:(double)a4 textureImmediately:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = v8;
  if (self->_mode != 2) {
    goto LABEL_10;
  }
  id v10 = [v8 trackedPlaneIdentifier];

  if (v10)
  {
    v11 = [v9 trackedPlaneIdentifier];
    id v12 = [(NSMutableDictionary *)self->_probeIdentifiersByPlaneIdentifier objectForKeyedSubscript:v11];
    LOBYTE(v5) = v12 == 0;

    if (v12)
    {
LABEL_16:

      goto LABEL_17;
    }
    simd_float4 v13 = [v9 identifier];
    [(NSMutableDictionary *)self->_probeIdentifiersByPlaneIdentifier setObject:v13 forKeyedSubscript:v11];

    probesByIdentifier = self->_probesByIdentifier;
    uint64_t v15 = [v9 identifier];
    [(NSMutableDictionary *)probesByIdentifier setObject:v9 forKeyedSubscript:v15];

LABEL_15:
    LOBYTE(v5) = 1;
    goto LABEL_16;
  }
  if (([v9 extent], fabsf(v16) != INFINITY)
    && ([v9 extent], fabsf(v17) != INFINITY)
    && ([v9 extent], fabsf(v18) != INFINITY)
    || !self->_universeProbeIdentifier
    || v5)
  {
LABEL_10:
    v19 = self->_probesByIdentifier;
    char v20 = [v9 identifier];
    [(NSMutableDictionary *)v19 setObject:v9 forKeyedSubscript:v20];

    dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
    LODWORD(v20) = self->_isReady;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
    if (v20)
    {
      v11 = (void *)[v9 copy];
      [v11 setLastUpdateTimestamp:a4];
      if (v5) {
        [(AREnvironmentProbeManager *)self _requestTextureForProbe:v11];
      }
      else {
        [(AREnvironmentProbeManager *)self _insertIntoQueue:v11];
      }
    }
    else
    {
      initialProbeIdentifiers = self->_initialProbeIdentifiers;
      v11 = [v9 identifier];
      [(NSMutableArray *)initialProbeIdentifiers addObject:v11];
    }
    goto LABEL_15;
  }
LABEL_17:

  return v5;
}

- (void)_requestTextureForProbe:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = _ARLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = [v4 identifier];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v8;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Requesting texture for probe %{public}@", buf, 0x20u);
  }
  requestedProbeIdentifiers = self->_requestedProbeIdentifiers;
  id v10 = [v4 identifier];
  [(NSMutableArray *)requestedProbeIdentifiers addObject:v10];

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  v11 = self->_lastImageData;
  long long v43 = *(_OWORD *)&self->_anon_80[16];
  long long v44 = *(_OWORD *)self->_anon_80;
  long long v41 = *(_OWORD *)&self->_anon_80[48];
  long long v42 = *(_OWORD *)&self->_anon_80[32];
  id v12 = convertToMeshes((const ARTexturedPlane **)&self->_lastPlanes.__begin_);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  kdebug_trace();
  memset(buf, 0, 512);
  ARLabHistogramCreate(buf);
  simd_float4 v13 = [v4 colorHistogram];
  BOOL v14 = v13 == 0;

  if (!v14)
  {
    uint64_t v15 = [v4 colorHistogram];
    [v15 getBytes:&buf[4] length:1024];

    [v4 opaquePixelPercentage];
    *(_DWORD *)buf = v16;
  }
  cubemapGenerator = self->_cubemapGenerator;
  [v4 referenceTransform];
  double v39 = v19;
  double v40 = v18;
  double v37 = v21;
  double v38 = v20;
  [v4 extent];
  double v36 = v22;
  memcpy(__dst, buf, sizeof(__dst));
  uint64_t v23 = [(ARImageData *)v11 pixelBuffer];
  [(ARImageData *)v11 cameraIntrinsics];
  long long v34 = v25;
  long long v35 = v24;
  long long v33 = v26;
  [(ARImageData *)v11 exposureDuration];
  uint64_t v28 = v27;
  [(ARImageData *)v11 exposureTargetOffset];
  int v30 = v29;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __53__AREnvironmentProbeManager__requestTextureForProbe___block_invoke;
  v45[3] = &unk_1E6187E68;
  v45[4] = self;
  id v31 = v4;
  id v46 = v31;
  LODWORD(v32) = v30;
  -[ARCubemapGenerator cubemapWithTransform:extent:lastHistogram:fromMeshes:cameraImage:cameraTransform:cameraIntrinsics:cameraExposure:cameraExposureOffset:completionHandler:](cubemapGenerator, "cubemapWithTransform:extent:lastHistogram:fromMeshes:cameraImage:cameraTransform:cameraIntrinsics:cameraExposure:cameraExposureOffset:completionHandler:", __dst, v12, v23, v45, v40, v39, v38, v37, v36, v44, v43, v42, v41, v35, v34, v33,
    v28,
    v32);
}

void __53__AREnvironmentProbeManager__requestTextureForProbe___block_invoke(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = _ARLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = [*(id *)(a1 + 40) identifier];
      int v33 = 138543874;
      long long v34 = v8;
      __int16 v35 = 2048;
      uint64_t v36 = v9;
      __int16 v37 = 2114;
      double v38 = v10;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Received texture for probe %{public}@", (uint8_t *)&v33, 0x20u);
    }
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 88), 0xFFFFFFFFFFFFFFFFLL);
    [*(id *)(a1 + 40) setEnvironmentTexture:v5];
    v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 + 1 length:1024];
    [*(id *)(a1 + 40) setColorHistogram:v11];

    LODWORD(v12) = *a3;
    [*(id *)(a1 + 40) setOpaquePixelPercentage:v12];
    simd_float4 v13 = *(void **)(*(void *)(a1 + 32) + 40);
    BOOL v14 = [*(id *)(a1 + 40) identifier];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];
    LOBYTE(v13) = v15 == 0;

    if ((v13 & 1) == 0)
    {
      int v16 = *(void **)(a1 + 40);
      float v17 = *(void **)(*(void *)(a1 + 32) + 40);
      double v18 = [v16 identifier];
      [v17 setObject:v16 forKeyedSubscript:v18];
    }
    double v19 = *(void **)(*(void *)(a1 + 32) + 56);
    double v20 = [*(id *)(a1 + 40) identifier];
    [v19 removeObject:v20];

    double v21 = *(void **)(*(void *)(a1 + 32) + 64);
    double v22 = [*(id *)(a1 + 40) identifier];
    [v21 addObject:v22];
  }
  else
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 88), 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v23 = *(void **)(*(void *)(a1 + 32) + 56);
    long long v24 = [*(id *)(a1 + 40) identifier];
    [v23 removeObject:v24];

    [*(id *)(a1 + 32) _insertIntoQueue:*(void *)(a1 + 40)];
    long long v25 = *(void **)(*(void *)(a1 + 32) + 40);
    long long v26 = [*(id *)(a1 + 40) identifier];
    uint64_t v27 = [v25 objectForKeyedSubscript:v26];

    if (v27)
    {
      [*(id *)(a1 + 40) lastUpdateTimestamp];
      double v29 = v28;
      int v30 = *(void **)(*(void *)(a1 + 32) + 40);
      id v31 = [*(id *)(a1 + 40) identifier];
      uint64_t v32 = [v30 objectForKeyedSubscript:v31];
      [v32 setLastUpdateTimestamp:v29];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 88));
  kdebug_trace();
}

- (int64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cubemapGenerator, 0);
  p_lastPlanes = &self->_lastPlanes;
  std::vector<ARTexturedPlane>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_lastPlanes);
  objc_storeStrong((id *)&self->_lastImageData, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_currentProbeUpdate, 0);
  objc_storeStrong((id *)&self->_probeUpdateQueue, 0);
  objc_storeStrong((id *)&self->_textureDataSemaphore, 0);
  objc_storeStrong((id *)&self->_universeProbeIdentifier, 0);
  objc_storeStrong((id *)&self->_directTexturingIdentifiers, 0);
  objc_storeStrong((id *)&self->_updatedProbeIdentifiers, 0);
  objc_storeStrong((id *)&self->_requestedProbeIdentifiers, 0);
  objc_storeStrong((id *)&self->_probeIdentifiersByPlaneIdentifier, 0);
  objc_storeStrong((id *)&self->_probesByIdentifier, 0);
  objc_storeStrong((id *)&self->_anchorsToRemove, 0);
  objc_storeStrong((id *)&self->_initialProbeIdentifiers, 0);
}

- (id).cxx_construct
{
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 26) = 0;
  return self;
}

@end