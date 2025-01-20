@interface DYMTLDebugPlaybackEngineCounterSupport
- (BOOL)_FixSplitEncoderSamples:(void *)a3 forProfile:(const void *)a4 withInfo:(id)a5 andUpdatedCounterInfo:(id)a6;
- (BOOL)_computeAverageForFrameProfile:(void *)a3 forProfile:(const void *)a4 withInfo:(id)a5 andUpdatedCounterInfo:(id)a6 forEncoders:(BOOL)a7;
- (DYMTLDebugPlaybackEngineCounterSupport)initWithPlaybackEngine:(id)a3;
- (id).cxx_construct;
- (id)_profileFrameWithCounterListsForProfileInfo:(id)a3;
- (id)_profileFrameWithCounterListsForProfileInfo:(id)a3 encoderPass:(BOOL)a4;
- (id)_profileFrameWithCounterListsForProfileInfo:(id)a3 setConsistentState:(unsigned int)a4;
- (id)_profileFrameWithCounterListsForProfileInfoAsync:(id)a3 encoderPass:(BOOL)a4 updateStatSampling:(BOOL)a5 setConsistentState:(unsigned int)a6;
- (id)_profileSplitEncodersForProfileInfo:(id)a3;
- (id)_runPassesForCounterLists:(id)a3 encoderPass:(BOOL)a4 frameProfileInfo:(void *)a5;
- (id)_updatedBatchInfos:(id)a3 fromPerEncoderDrawCallCount:(id)a4;
- (id)availableCounters;
- (id)derivedCounterData;
- (id)profileEncodersForProfileInfo:(id)a3;
- (id)profileFrameWithCounterListsForProfileInfo:(id)a3;
- (id)profileFrameWithCounterListsForProfileInfoAsync:(id)a3;
- (id)profileFrameWithPayload:(id)a3;
- (unint64_t)_profileFrameForFrameTiming:(id)a3 atConsistentState:(unsigned int)a4;
- (void)_clearData;
- (void)_setupPState;
- (void)addCommandBufferFrameProfile:(const void *)a3;
- (void)addCounters:(id)a3;
- (void)createBatchIdFilterMapping;
@end

@implementation DYMTLDebugPlaybackEngineCounterSupport

- (DYMTLDebugPlaybackEngineCounterSupport)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DYMTLDebugPlaybackEngineCounterSupport;
  v5 = [(DYMTLDebugPlaybackEngineCounterSupport *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_engine, v4);
    v6->_loopCount = 1;
    id v7 = MTLCreateSystemDefaultDevice();
    v8 = [v7 name];
    v6->_isAGXDevice = [v8 compare:@"Unknown Unknown"] == 0;

    v9 = v6;
  }

  return v6;
}

- (void)_setupPState
{
  id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v6 objectForKey:@"GPUFrameProfilingPowerStateWarmupTime"];

  if (v3)
  {
    id v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v4 = [v7 integerForKey:@"GPUFrameProfilingPowerStateWarmupTime"];

    if (v4 < 1) {
      return;
    }
  }
  else
  {
    uint64_t v4 = 500;
  }
  p_engine = &self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)p_engine);
  [WeakRetained setLoopTimeLimit:1000000 * v4];

  id v9 = objc_loadWeakRetained((id *)p_engine);
  [v9 setPlaybackMode:5];

  id v10 = objc_loadWeakRetained((id *)p_engine);
  [v10 playbackToFunction:0 withLoops:0xFFFFFFFFLL];
}

- (BOOL)_computeAverageForFrameProfile:(void *)a3 forProfile:(const void *)a4 withInfo:(id)a5 andUpdatedCounterInfo:(id)a6 forEncoders:(BOOL)a7
{
  id v11 = a5;
  id v12 = a6;
  if (*(void *)a4 == *((void *)a4 + 1)
    || ((id WeakRetained = objc_loadWeakRetained((id *)&self->_engine),
         unsigned int v14 = [WeakRetained numIterationsInLastPlayback],
         unsigned int v15 = v14,
         v14 <= 1)
      ? (unint64_t v16 = 1)
      : (unint64_t v16 = v14),
        WeakRetained,
        unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 4),
        unint64_t v18 = v17 / v16,
        v17 % v16))
  {
    BOOL v19 = 0;
  }
  else
  {
    unint64_t v61 = v16;
    std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>::resize((uint64_t)a3, v17 / v16);
    uint64_t v21 = **(void **)a4;
    if (v15 > 1)
    {
      id v59 = v12;
      id v60 = v11;
      std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,std::vector<unsigned long long>,std::vector<unsigned long long>>>::vector(v62, v18);
      v25 = *(uint64_t **)a4;
      if (*((void *)a4 + 1) != *(void *)a4)
      {
        unint64_t v26 = 0;
        do
        {
          v27 = (void *)(v62[0] + 80 * (v26 % v18));
          v28 = &v25[6 * v26];
          if (v26 < v18)
          {
            void *v27 = *v28 - v21;
            v27[1] = v28[1];
            v27[2] = v28[2];
            v27[3] = v28[3];
          }
          unint64_t v29 = v27[6];
          v30 = (char *)v27[5];
          if ((unint64_t)v30 >= v29)
          {
            v32 = (char *)v27[4];
            uint64_t v33 = (v30 - v32) >> 3;
            if ((unint64_t)(v33 + 1) >> 61) {
              goto LABEL_65;
            }
            unint64_t v34 = v29 - (void)v32;
            unint64_t v35 = (uint64_t)(v29 - (void)v32) >> 2;
            if (v35 <= v33 + 1) {
              unint64_t v35 = v33 + 1;
            }
            if (v34 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v36 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v36 = v35;
            }
            if (v36)
            {
              v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)(v27 + 6), v36);
              v32 = (char *)v27[4];
              v30 = (char *)v27[5];
            }
            else
            {
              v37 = 0;
            }
            v38 = &v37[8 * v33];
            *(void *)v38 = v28[4];
            v31 = v38 + 8;
            while (v30 != v32)
            {
              uint64_t v39 = *((void *)v30 - 1);
              v30 -= 8;
              *((void *)v38 - 1) = v39;
              v38 -= 8;
            }
            v27[4] = v38;
            v27[5] = v31;
            v27[6] = &v37[8 * v36];
            if (v32) {
              operator delete(v32);
            }
          }
          else
          {
            *(void *)v30 = v28[4];
            v31 = v30 + 8;
          }
          v27[5] = v31;
          if (self->_isAGXDevice)
          {
            unint64_t v40 = v27[9];
            v41 = (char *)v27[8];
            if ((unint64_t)v41 >= v40)
            {
              v43 = (char *)v27[7];
              uint64_t v44 = (v41 - v43) >> 3;
              if ((unint64_t)(v44 + 1) >> 61) {
LABEL_65:
              }
                std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
              unint64_t v45 = v40 - (void)v43;
              unint64_t v46 = (uint64_t)(v40 - (void)v43) >> 2;
              if (v46 <= v44 + 1) {
                unint64_t v46 = v44 + 1;
              }
              if (v45 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v47 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v47 = v46;
              }
              if (v47)
              {
                v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)(v27 + 9), v47);
                v43 = (char *)v27[7];
                v41 = (char *)v27[8];
              }
              else
              {
                v48 = 0;
              }
              v49 = &v48[8 * v44];
              *(void *)v49 = v28[5];
              v42 = v49 + 8;
              while (v41 != v43)
              {
                uint64_t v50 = *((void *)v41 - 1);
                v41 -= 8;
                *((void *)v49 - 1) = v50;
                v49 -= 8;
              }
              v27[7] = v49;
              v27[8] = v42;
              v27[9] = &v48[8 * v47];
              if (v43) {
                operator delete(v43);
              }
            }
            else
            {
              *(void *)v41 = v28[5];
              v42 = v41 + 8;
            }
            v27[8] = v42;
          }
          ++v26;
          v25 = *(uint64_t **)a4;
        }
        while (v26 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 4));
      }
      if (v17 >= v61)
      {
        uint64_t v51 = 0;
        if (v18 <= 1) {
          uint64_t v52 = 1;
        }
        else {
          uint64_t v52 = v18;
        }
        uint64_t v53 = 56;
        do
        {
          uint64_t v54 = *(void *)a3;
          v55 = (void *)(*(void *)a3 + v51);
          uint64_t v56 = v62[0];
          uint64_t v57 = v62[0] + v53;
          void *v55 = *(void *)(v62[0] + v53 - 56);
          v55[1] = *(void *)(v57 - 48);
          v55[2] = *(void *)(v57 - 40);
          v55[3] = *(void *)(v57 - 32);
          if (self->_isAGXDevice) {
          else
          }
            unint64_t v58 = 0;
          *(void *)(v54 + v51 + 40) = v58;
          v51 += 48;
          v53 += 80;
          --v52;
        }
        while (v52);
      }
      v63 = (void **)v62;
      std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,std::vector<unsigned long long>,std::vector<unsigned long long>>>::__destroy_vector::operator()[abi:ne180100](&v63);
      BOOL v19 = 1;
      id v12 = v59;
      id v11 = v60;
    }
    else
    {
      if (v17 >= v61)
      {
        if (v18 <= 1) {
          uint64_t v22 = 1;
        }
        else {
          uint64_t v22 = v18;
        }
        v23 = (void *)(*(void *)a4 + 24);
        v24 = (void *)(*(void *)a3 + 24);
        do
        {
          *(v24 - 3) = *(v23 - 3) - v21;
          *(v24 - 2) = *(v23 - 2);
          *(v24 - 1) = *(v23 - 1);
          void *v24 = *v23;
          v24[1] = v23[1];
          v24[2] = v23[2];
          v23 += 6;
          v24 += 6;
          --v22;
        }
        while (v22);
      }
      BOOL v19 = 1;
    }
  }

  return v19;
}

- (void)_clearData
{
  self->_commandBufferFrameProfilesInfo.__end_ = self->_commandBufferFrameProfilesInfo.__begin_;
  self->_commandBufferFrameProfiles.__end_ = self->_commandBufferFrameProfiles.__begin_;
  self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_ = self->_commandBufferFrameProfilesPerDMDrawCallInfo.__begin_;
}

- (id)profileFrameWithPayload:(id)a3
{
  id v4 = a3;
  [(DYMTLDebugPlaybackEngineCounterSupport *)self _setupPState];
  unsigned int loopCount = self->_loopCount;
  self->_unsigned int loopCount = 15;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  id v7 = [WeakRetained player];
  [v7 enableStatsSampling:1];

  id v8 = objc_loadWeakRetained((id *)&self->_engine);
  id v9 = [v8 player];
  uint64_t v10 = [v9 setupCounterConfigurationAndGetFrameProfilerCounters];

  if (v4) {
    id v11 = (void *)[v4 mutableCopy];
  }
  else {
    id v11 = objc_opt_new();
  }
  id v12 = v11;
  [v11 setObject:v10 forKeyedSubscript:*MEMORY[0x263F3FE88]];
  v13 = [(DYMTLDebugPlaybackEngineCounterSupport *)self _profileFrameWithCounterListsForProfileInfo:v12];
  uint64_t v14 = *MEMORY[0x263F3FA38];
  uint64_t v51 = v13;
  v55 = [v13 objectForKeyedSubscript:*MEMORY[0x263F3FA38]];
  id v15 = objc_loadWeakRetained((id *)&self->_engine);
  unint64_t v16 = [v15 player];
  [v16 enableStatsSampling:1];

  id v17 = objc_loadWeakRetained((id *)&self->_engine);
  unint64_t v18 = [v17 player];
  [v18 sampleEncoderCounters];

  uint64_t v53 = [(DYMTLDebugPlaybackEngineCounterSupport *)self _profileFrameWithCounterListsForProfileInfo:v12 encoderPass:1];
  id v19 = objc_loadWeakRetained((id *)&self->_engine);
  v20 = [v19 player];
  [v20 enableStatsSampling:0];
  v49 = v12;
  uint64_t v50 = v4;
  uint64_t v52 = (void *)v10;

  uint64_t v54 = [v53 objectForKeyedSubscript:v14];
  self->_unsigned int loopCount = loopCount;
  uint64_t v21 = [MEMORY[0x263EFF980] array];
  uint64_t v22 = [v55 count];
  if (v22 == [v54 count])
  {
    unint64_t v23 = 0;
    uint64_t v56 = self;
LABEL_6:
    if (v23 >= [v55 count])
    {
      [(DYMTLDebugPlaybackEngineCounterSupport *)self addCounters:v52];
      [(NSMutableDictionary *)self->_frameProfiling setObject:v21 forKeyedSubscript:@"frame profile data"];
      unint64_t v46 = self->_frameProfiling;
      frameProfiling = self->_frameProfiling;
      self->_frameProfiling = 0;
    }
    else
    {
      uint64_t v24 = [v55 objectAtIndexedSubscript:v23];
      unint64_t v25 = v23;
      unint64_t v26 = (void *)v24;
      unint64_t v48 = v25;
      id v59 = objc_msgSend(v54, "objectAtIndexedSubscript:");
      uint64_t v57 = v26;
      uint64_t v27 = [v26 count];
      if (v27 == [v59 count])
      {
        for (unint64_t i = 0; ; ++i)
        {
          if (i >= [v57 count])
          {

            unint64_t v23 = v48 + 1;
            goto LABEL_6;
          }
          unint64_t v29 = [v57 objectAtIndexedSubscript:i];
          v30 = [v59 objectAtIndexedSubscript:i];
          if ([v30 count] != 1) {
            break;
          }
          unint64_t v31 = 0;
          for (unint64_t j = 0; j < [v29 count]; ++j)
          {
            uint64_t v33 = [v29 objectAtIndexedSubscript:j];
            unint64_t v34 = [v33 objectAtIndexedSubscript:3];
            v31 += [v34 unsignedLongLongValue];
          }
          unint64_t v35 = [v30 objectAtIndexedSubscript:0];
          unint64_t v36 = [v35 objectAtIndexedSubscript:3];
          unint64_t v37 = [v36 unsignedLongLongValue];

          unint64_t v38 = 0;
          double v39 = (double)v37;
          while (v38 < [v29 count])
          {
            if (v31)
            {
              unint64_t v40 = [v29 objectAtIndexedSubscript:v38];
              v41 = [v40 objectAtIndexedSubscript:3];
              unint64_t v42 = (unint64_t)(v39
                                     * (double)(unint64_t)[v41 unsignedLongLongValue]
                                     / (double)v31);
            }
            else
            {
              unint64_t v42 = 0;
            }
            v43 = [NSNumber numberWithUnsignedLongLong:v42];
            uint64_t v44 = [v29 objectAtIndexedSubscript:v38];
            [v44 setObject:v43 atIndexedSubscript:3];

            unint64_t v45 = [v29 objectAtIndexedSubscript:v38];
            [v21 addObjectsFromArray:v45];

            ++v38;
          }

          self = v56;
        }
      }
      unint64_t v46 = 0;
    }
  }
  else
  {
    unint64_t v46 = 0;
  }

  return v46;
}

- (void)addCommandBufferFrameProfile:(const void *)a3
{
}

- (BOOL)_FixSplitEncoderSamples:(void *)a3 forProfile:(const void *)a4 withInfo:(id)a5 andUpdatedCounterInfo:(id)a6
{
  id v6 = *(char **)a4;
  id v7 = (char *)*((void *)a4 + 1);
  if (*(char **)a4 != v7)
  {
    std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>::resize((uint64_t)a3, 0xAAAAAAAAAAAAAAABLL * ((v7 - v6) >> 4));
    id v11 = *(char **)a4;
    uint64_t v10 = *((void *)a4 + 1);
    uint64_t v12 = v10 - *(void *)a4;
    if (v10 != *(void *)a4)
    {
      unint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v17 = *(void *)v11;
      unint64_t v16 = v11 + 24;
      uint64_t v15 = v17;
      unint64_t v18 = v12 / 48;
      if (v18 <= 1) {
        unint64_t v18 = 1;
      }
      id v19 = (void *)(*(void *)a3 + 24);
      unint64_t v20 = -1;
      do
      {
        unint64_t v21 = *(v16 - 3) - v15;
        *(v19 - 3) = v21;
        unint64_t v22 = *(v16 - 2);
        uint64_t v23 = *(v16 - 1);
        if (v22 > v20) {
          ++v14;
        }
        if (v21 > v13) {
          uint64_t v14 = 0;
        }
        *(v19 - 2) = v22;
        *(v19 - 1) = v14;
        *id v19 = v23;
        v19[1] = *v16;
        v19[2] = v16[1];
        v19[3] = v16[2];
        v19 += 7;
        v16 += 6;
        unint64_t v13 = v21;
        unint64_t v20 = v22;
        --v18;
      }
      while (v18);
    }
  }
  return v6 != v7;
}

- (id)_profileSplitEncodersForProfileInfo:(id)a3
{
  uint64_t v206 = *MEMORY[0x263EF8340];
  id v151 = a3;
  p_engine = &self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  id v6 = [WeakRetained player];

  v156 = v6;
  [v6 enableStatsSampling:1];
  [v6 sampleSplitEncoderCounters];
  [v6 setupProfileInfo:v151];
  [(DYMTLDebugPlaybackEngineCounterSupport *)self _clearData];
  id v7 = objc_loadWeakRetained((id *)&self->_engine);
  [v7 setPlaybackMode:9];

  id v8 = [v151 objectForKeyedSubscript:*MEMORY[0x263F3FE88]];
  v150 = [v6 counterInfo:v8];

  id v9 = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v10 = [v9 player];
  [v10 setupProfilingForCounterLists];

  id v11 = [v150 objectForKeyedSubscript:*MEMORY[0x263F3FDA0]];
  unint64_t v162 = [v11 unsignedIntegerValue];

  uint64_t v161 = *MEMORY[0x263F3FAD8];
  v149 = objc_msgSend(v150, "objectForKeyedSubscript:");
  obunint64_t j = (id)*MEMORY[0x263F3FAD0];
  v170 = objc_msgSend(v150, "objectForKeyedSubscript:");
  if (v162)
  {
    unint64_t v12 = 0;
    for (uint64_t i = 0; i != v162; ++i)
    {
      uint64_t v14 = [v170 objectAtIndexedSubscript:i];
      v12 += [v14 count];
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if (self->_isAGXDevice)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_engine);
    unint64_t v16 = [v15 player];
    [v16 enableConsistentState:1];
  }
  if (v162)
  {
    uint64_t v17 = 0;
    p_commandBufferFrameProfilesPerDMDrawCallInfo = &self->_commandBufferFrameProfilesPerDMDrawCallInfo;
    p_end_cap = &self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_cap_;
    while (1)
    {
      uint64_t v168 = v17;
      if ((objc_msgSend(v156, "setupProfilingForListAtIndex:") & 1) == 0) {
        break;
      }
      id v20 = objc_loadWeakRetained((id *)p_engine);
      [v20 setPlaybackMode:9];

      id v21 = objc_loadWeakRetained((id *)p_engine);
      [v21 playbackToFunction:0 withLoops:self->_loopCount];

      unint64_t v22 = objc_opt_new();
      uint64_t v23 = [v150 objectForKeyedSubscript:obj];
      uint64_t v24 = [v23 objectAtIndexedSubscript:v168];
      [v22 setObject:v24 forKeyedSubscript:v161];

      begiuint64_t n = (uint64_t *)self->_commandBufferFrameProfilesInfo.__begin_;
      end = (uint64_t *)self->_commandBufferFrameProfilesInfo.__end_;
      unint64_t v27 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 4));
      if (end == begin) {
        uint64_t v28 = 0;
      }
      else {
        uint64_t v28 = v27;
      }
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> *,false>((uint64_t)begin, end, (uint64_t)&v190, v28, 1);
      __p = 0;
      v195 = 0;
      uint64_t v196 = 0;
      BOOL v29 = [(DYMTLDebugPlaybackEngineCounterSupport *)self _FixSplitEncoderSamples:&__p forProfile:&self->_commandBufferFrameProfilesInfo withInfo:v151 andUpdatedCounterInfo:v22];
      v30 = __p;
      if (!v29)
      {
        if (__p)
        {
          v195 = __p;
          operator delete(__p);
        }

        break;
      }
      unint64_t v31 = v195;
      if (__p != v195)
      {
        v32 = (char *)self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_;
        do
        {
          long long v190 = *v30;
          long long v191 = v30[1];
          long long v192 = v30[2];
          uint64_t v193 = *((void *)v30 + 6);
          if (v32 >= p_end_cap->__value_)
          {
            uint64_t v36 = 0x6DB6DB6DB6DB6DB7 * ((v32 - (char *)p_commandBufferFrameProfilesPerDMDrawCallInfo->__begin_) >> 3);
            unint64_t v37 = v36 + 1;
            if ((unint64_t)(v36 + 1) > 0x492492492492492) {
              std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
            }
            if (0xDB6DB6DB6DB6DB6ELL
               * (((char *)p_end_cap->__value_ - (char *)p_commandBufferFrameProfilesPerDMDrawCallInfo->__begin_) >> 3) > v37)
              unint64_t v37 = 0xDB6DB6DB6DB6DB6ELL
                  * (((char *)p_end_cap->__value_ - (char *)p_commandBufferFrameProfilesPerDMDrawCallInfo->__begin_) >> 3);
            if ((unint64_t)(0x6DB6DB6DB6DB6DB7
                                  * (((char *)p_end_cap->__value_
                                    - (char *)p_commandBufferFrameProfilesPerDMDrawCallInfo->__begin_) >> 3)) >= 0x249249249249249)
              unint64_t v38 = 0x492492492492492;
            else {
              unint64_t v38 = v37;
            }
            if (v38) {
              double v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>((uint64_t)&self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_cap_, v38);
            }
            else {
              double v39 = 0;
            }
            unint64_t v40 = &v39[56 * v36];
            *(_OWORD *)unint64_t v40 = v190;
            *((_OWORD *)v40 + 1) = v191;
            *((_OWORD *)v40 + 2) = v192;
            *((void *)v40 + 6) = v193;
            unint64_t v42 = (char *)self->_commandBufferFrameProfilesPerDMDrawCallInfo.__begin_;
            v41 = (char *)self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_;
            v43 = v40;
            if (v41 != v42)
            {
              do
              {
                long long v44 = *(_OWORD *)(v41 - 56);
                long long v45 = *(_OWORD *)(v41 - 40);
                long long v46 = *(_OWORD *)(v41 - 24);
                *((void *)v43 - 1) = *((void *)v41 - 1);
                *(_OWORD *)(v43 - 24) = v46;
                *(_OWORD *)(v43 - 40) = v45;
                *(_OWORD *)(v43 - 56) = v44;
                v43 -= 56;
                v41 -= 56;
              }
              while (v41 != v42);
              v41 = (char *)p_commandBufferFrameProfilesPerDMDrawCallInfo->__begin_;
            }
            v32 = v40 + 56;
            self->_commandBufferFrameProfilesPerDMDrawCallInfo.__begin_ = v43;
            self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_ = v40 + 56;
            self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_cap_.__value_ = &v39[56 * v38];
            if (v41) {
              operator delete(v41);
            }
          }
          else
          {
            long long v33 = *v30;
            long long v34 = v30[1];
            long long v35 = v30[2];
            *((void *)v32 + 6) = *((void *)v30 + 6);
            *((_OWORD *)v32 + 1) = v34;
            *((_OWORD *)v32 + 2) = v35;
            *(_OWORD *)v32 = v33;
            v32 += 56;
          }
          self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_ = v32;
          v30 = (_OWORD *)((char *)v30 + 56);
        }
        while (v30 != (_OWORD *)v31);
        v30 = __p;
        p_engine = &self->_engine;
      }
      self->_commandBufferFrameProfilesInfo.__end_ = self->_commandBufferFrameProfilesInfo.__begin_;
      if (v30)
      {
        v195 = v30;
        operator delete(v30);
      }

      uint64_t v17 = v168 + 1;
      if (v168 + 1 == v162) {
        goto LABEL_38;
      }
    }
    id v134 = 0;
  }
  else
  {
LABEL_38:
    [v156 stopFrameProfiling];
    id v47 = objc_loadWeakRetained((id *)p_engine);
    [v47 setPlaybackMode:0];

    unint64_t v48 = (unint64_t *)self->_commandBufferFrameProfilesPerDMDrawCallInfo.__begin_;
    v49 = (unint64_t *)self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_;
    unint64_t v50 = 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * (v49 - v48));
    if (v49 == v48) {
      uint64_t v51 = 0;
    }
    else {
      uint64_t v51 = v50;
    }
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> *,false>((uint64_t)v48, v49, (uint64_t)&v190, v51, 1);
    [v156 enableStatsSampling:0];
    v195 = 0;
    uint64_t v196 = 0;
    __p = &v195;
    uint64_t v52 = self->_commandBufferFrameProfilesPerDMDrawCallInfo.__begin_;
    for (j = self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_; v52 != j; uint64_t v52 = (_OWORD *)((char *)v52 + 56))
    {
      long long v54 = v52[1];
      long long v190 = *v52;
      long long v191 = v54;
      v55 = std::__tree<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::__map_value_compare<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::less<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,true>,std::allocator<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>>>::find<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>((uint64_t)&__p, &v190);
      if (&v195 == v55)
      {
        long long v187 = 0uLL;
        std::vector<std::pair<unsigned long long,unsigned long long>>::vector(&v188, v12, &v187);
        v197 = &v190;
        uint64_t v56 = std::__tree<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::__map_value_compare<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::less<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,true>,std::allocator<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>>>::__emplace_unique_key_args<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::piecewise_construct_t const&,std::tuple<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long> const&>,std::tuple<>>((uint64_t **)&__p, &v190, (uint64_t)&std::piecewise_construct, &v197);
        uint64_t v57 = (void *)v56[8];
        if (v57)
        {
          v56[9] = v57;
          operator delete(v57);
          v56[8] = 0;
          v56[9] = 0;
          v56[10] = 0;
        }
        *((_OWORD *)v56 + 4) = v188;
        v56[10] = v189;
        v55 = std::__tree<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::__map_value_compare<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::less<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,true>,std::allocator<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>>>::find<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>((uint64_t)&__p, &v190);
      }
      *(_OWORD *)(v55[8] + 16 * *((void *)v52 + 4)) = *(_OWORD *)((char *)v52 + 40);
    }
    v169 = objc_opt_new();
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    id obja = v149;
    uint64_t v58 = [obja countByEnumeratingWithState:&v183 objects:v205 count:16];
    if (v58)
    {
      uint64_t v59 = 0;
      uint64_t v60 = *(void *)v184;
      do
      {
        for (uint64_t k = 0; k != v58; ++k)
        {
          if (*(void *)v184 != v60) {
            objc_enumerationMutation(obja);
          }
          uint64_t v62 = *(void *)(*((void *)&v183 + 1) + 8 * k);
          v63 = [NSNumber numberWithUnsignedInteger:v59 + k];
          [v169 setObject:v63 forKeyedSubscript:v62];
        }
        uint64_t v58 = [obja countByEnumeratingWithState:&v183 objects:v205 count:16];
        v59 += k;
      }
      while (v58);
    }

    if (v162)
    {
      v64 = objc_opt_new();
      if (v162 >= 2)
      {
        v65 = [v170 objectAtIndexedSubscript:0];
        unint64_t v66 = [v65 count];
        v67 = [v170 objectAtIndexedSubscript:1];
        unint64_t v68 = [v67 count];
        unint64_t v69 = v68 >= v66 ? v66 : v68;

        if (v69)
        {
          for (uint64_t m = 0; m != v69; ++m)
          {
            v71 = [v170 objectAtIndexedSubscript:0];
            v72 = [v71 objectAtIndexedSubscript:m];
            v73 = [v170 objectAtIndexedSubscript:1];
            v74 = [v73 objectAtIndexedSubscript:m];
            int v75 = [v72 isEqualToString:v74];

            if (v75)
            {
              v76 = [v170 objectAtIndexedSubscript:0];
              v77 = [v76 objectAtIndexedSubscript:m];
              [v64 addObject:v77];
            }
          }
        }
      }
      long long v190 = 0u;
      long long v191 = 0u;
      LODWORD(v192) = 1065353216;
      v78 = objc_opt_new();
      uint64_t v79 = 0;
      *(void *)&long long v188 = 0;
      uint64_t v80 = v162;
      if (v162 <= 1) {
        uint64_t v80 = 1;
      }
      uint64_t v163 = v80;
      do
      {
        long long v181 = 0u;
        long long v182 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        v81 = [v170 objectAtIndexedSubscript:v79];
        uint64_t v82 = [v81 countByEnumeratingWithState:&v179 objects:v204 count:16];
        if (v82)
        {
          uint64_t v83 = *(void *)v180;
          do
          {
            for (uint64_t n = 0; n != v82; ++n)
            {
              if (*(void *)v180 != v83) {
                objc_enumerationMutation(v81);
              }
              uint64_t v85 = *(void *)(*((void *)&v179 + 1) + 8 * n);
              if (v79
                && [v64 containsObject:*(void *)(*((void *)&v179 + 1) + 8 * n)])
              {
                std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t)&v190, (unint64_t *)&v188, &v188);
              }
              *(void *)&long long v188 = v188 + 1;
              v86 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
              [v78 setObject:v85 forKeyedSubscript:v86];
            }
            uint64_t v82 = [v81 countByEnumeratingWithState:&v179 objects:v204 count:16];
          }
          while (v82);
        }

        ++v79;
      }
      while (v79 != v163);
      v87 = (char *)__p;
      if (__p != &v195)
      {
        do
        {
          unint64_t v88 = [obja count];
          long long v187 = 0uLL;
          std::vector<std::pair<unsigned long long,unsigned long long>>::vector(&v188, v88, &v187);
          uint64_t v89 = 0;
          v159 = v87;
          v90 = (void **)(v87 + 64);
          *(void *)&long long v187 = 0;
          do
          {
            for (iuint64_t i = 0; ; ++ii)
            {
              v92 = [v170 objectAtIndexedSubscript:v89];
              BOOL v93 = ii < [v92 count];

              if (!v93) {
                break;
              }
              if (std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v190, (unint64_t *)&v187))
              {
                *(void *)&long long v187 = v187 + 1;
              }
              else
              {
                v94 = [NSNumber numberWithUnsignedInteger:(void)v187];
                v95 = [v78 objectForKeyedSubscript:v94];
                v96 = [v169 objectForKeyedSubscript:v95];
                uint64_t v97 = [v96 unsignedIntegerValue];

                uint64_t v98 = v187;
                *(void *)&long long v187 = v187 + 1;
                *(_OWORD *)(v188 + 16 * v97) = *((_OWORD *)*v90 + v98);
              }
            }
            ++v89;
          }
          while (v89 != v163);
          v99 = *v90;
          v100 = (void **)v159;
          if (*v90)
          {
            *((void *)v159 + 9) = v99;
            operator delete(v99);
            *v90 = 0;
            v90[1] = 0;
            v90[2] = 0;
          }
          *((_OWORD *)v159 + 4) = v188;
          *((void *)v159 + 10) = v189;
          v101 = (void *)*((void *)v159 + 1);
          if (v101)
          {
            do
            {
              v102 = (void **)v101;
              v101 = (void *)*v101;
            }
            while (v101);
          }
          else
          {
            do
            {
              v102 = (void **)v100[2];
              BOOL v103 = *v102 == v100;
              v100 = v102;
            }
            while (!v103);
          }
          v87 = (char *)v102;
        }
        while (v102 != &v195);
      }

      std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&v190);
    }
    v104 = [v169 objectForKeyedSubscript:@"MTLStatCommandBufferIndex"];
    uint64_t v155 = [v104 unsignedIntegerValue];

    v105 = [v169 objectForKeyedSubscript:@"MTLStatEncoderIndex"];
    uint64_t v154 = [v105 unsignedIntegerValue];

    v106 = [v169 objectForKeyedSubscript:@"MTLStatCommandIndex"];
    uint64_t v153 = [v106 unsignedIntegerValue];

    v107 = [v169 objectForKeyedSubscript:@"MTLStat_nSec"];
    uint64_t v152 = [v107 unsignedIntegerValue];

    v160 = objc_opt_new();
    v158 = objc_opt_new();
    v108 = __p;
    if (__p == &v195)
    {
      v164 = 0;
      id objb = 0;
    }
    else
    {
      v164 = 0;
      id objb = 0;
      uint64_t v109 = -1;
      uint64_t v157 = -1;
      do
      {
        uint64_t v110 = v108[4];
        if (v110 != v157)
        {
          uint64_t v111 = objc_opt_new();

          [v160 addObject:v111];
          uint64_t v109 = -1;
          uint64_t v157 = v110;
          v164 = (void *)v111;
        }
        uint64_t v112 = v108[5];
        if (v112 != v109)
        {
          uint64_t v113 = objc_opt_new();

          v114 = objc_opt_new();
          [v158 addObject:v114];

          id objb = (id)v113;
          [v164 addObject:v113];
          uint64_t v109 = v112;
        }
        v115 = objc_opt_new();
        v116 = (void *)v108[8];
        v117 = (void *)v108[9];
        while (v116 != v117)
        {
          uint64_t v118 = v116[1];
          v119 = [NSNumber numberWithUnsignedLongLong:*v116];
          v203[0] = v119;
          v120 = [NSNumber numberWithUnsignedLongLong:v118];
          v203[1] = v120;
          v121 = [MEMORY[0x263EFF8C0] arrayWithObjects:v203 count:2];
          [v115 addObject:v121];

          v116 += 2;
        }
        v122 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v160, "count") - 1);
        v202[0] = v122;
        v202[1] = &unk_2700F9FF0;
        v123 = [MEMORY[0x263EFF8C0] arrayWithObjects:v202 count:2];
        [v115 setObject:v123 atIndexedSubscript:v155];

        v124 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v164, "count") - 1);
        v201[0] = v124;
        v201[1] = &unk_2700F9FF0;
        v125 = [MEMORY[0x263EFF8C0] arrayWithObjects:v201 count:2];
        [v115 setObject:v125 atIndexedSubscript:v154];

        v126 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(objb, "count"));
        v200[0] = v126;
        v200[1] = &unk_2700F9FF0;
        v127 = [MEMORY[0x263EFF8C0] arrayWithObjects:v200 count:2];
        [v115 setObject:v127 atIndexedSubscript:v153];

        v128 = [v158 lastObject];
        v129 = [v115 objectAtIndexedSubscript:v152];
        v130 = [v129 objectAtIndexedSubscript:0];
        [v128 addObject:v130];

        v131 = [MEMORY[0x263EFF980] arrayWithObject:v115];
        [objb addObject:v131];

        v132 = (void *)v108[1];
        if (v132)
        {
          do
          {
            v133 = (void **)v132;
            v132 = (void *)*v132;
          }
          while (v132);
        }
        else
        {
          do
          {
            v133 = (void **)v108[2];
            BOOL v103 = *v133 == v108;
            v108 = v133;
          }
          while (!v103);
        }
        v108 = v133;
      }
      while (v133 != &v195);
    }
    v135 = objc_opt_new();
    long long v177 = 0u;
    long long v178 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    id v136 = v158;
    uint64_t v137 = [v136 countByEnumeratingWithState:&v175 objects:v199 count:16];
    if (v137)
    {
      uint64_t v138 = *(void *)v176;
      do
      {
        for (junint64_t j = 0; jj != v137; ++jj)
        {
          if (*(void *)v176 != v138) {
            objc_enumerationMutation(v136);
          }
          v140 = *(void **)(*((void *)&v175 + 1) + 8 * jj);
          long long v171 = 0u;
          long long v172 = 0u;
          long long v173 = 0u;
          long long v174 = 0u;
          id v141 = v140;
          uint64_t v142 = [v141 countByEnumeratingWithState:&v171 objects:v198 count:16];
          if (v142)
          {
            uint64_t v143 = *(void *)v172;
            double v144 = 0.0;
            do
            {
              for (kuint64_t k = 0; kk != v142; ++kk)
              {
                if (*(void *)v172 != v143) {
                  objc_enumerationMutation(v141);
                }
                [*(id *)(*((void *)&v171 + 1) + 8 * kk) doubleValue];
                double v144 = v144 + v146;
              }
              uint64_t v142 = [v141 countByEnumeratingWithState:&v171 objects:v198 count:16];
            }
            while (v142);
          }
          else
          {
            double v144 = 0.0;
          }

          v147 = [NSNumber numberWithDouble:v144];
          [v135 addObject:v147];
        }
        uint64_t v137 = [v136 countByEnumeratingWithState:&v175 objects:v199 count:16];
      }
      while (v137);
    }

    [v150 setObject:v160 forKeyedSubscript:*MEMORY[0x263F3FA38]];
    [v150 setObject:v135 forKeyedSubscript:@"PerDrawNsecTimes"];
    id v134 = v150;

    std::__tree<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::__map_value_compare<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::less<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,true>,std::allocator<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>>>::destroy((uint64_t)&__p, v195);
  }

  return v134;
}

- (void)createBatchIdFilterMapping
{
  p_engine = &self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v3 = [WeakRetained player];
  [v3 enableStatsSampling:1];

  id v6 = objc_loadWeakRetained((id *)p_engine);
  [v6 setPlaybackMode:12];

  id v7 = objc_loadWeakRetained((id *)p_engine);
  [v7 playbackToFunction:0 withLoops:1];

  id v8 = objc_loadWeakRetained((id *)p_engine);
  id v4 = [v8 player];
  [v4 enableStatsSampling:0];

  id v9 = objc_loadWeakRetained((id *)p_engine);
  [v9 setPlaybackMode:0];
}

- (id)profileEncodersForProfileInfo:(id)a3
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v61 = a3;
  [(DYMTLDebugPlaybackEngineCounterSupport *)self _setupPState];
  v64 = self;
  self = (DYMTLDebugPlaybackEngineCounterSupport *)((char *)self + 88);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  v5 = [WeakRetained player];
  [v5 enableStatsSampling:1];

  id v6 = objc_loadWeakRetained((id *)&self->super.isa);
  id v7 = [v6 player];
  [v7 sampleEncoderCounters];

  id v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"MTLStatCommandBufferIndex", @"MTLStatEncoderIndex", @"MTLStatCommandIndex", @"MTLStat_nSec", @"MTLStatTotalGPUCycles", 0);
  uint64_t v62 = (void *)[v8 mutableCopy];

  id v9 = objc_loadWeakRetained((id *)&self->super.isa);
  uint64_t v10 = [v9 player];

  uint64_t v56 = v10;
  if ([v10 isCounterAvailable:@"SW_PBUsed"])
  {
    id v11 = @"SW_PBUsed";
  }
  else
  {
    if (![v10 isCounterAvailable:@"_fedf2c59"])
    {
      int v77 = 0;
      goto LABEL_7;
    }
    id v11 = @"_fedf2c59";
  }
  [v62 addObject:v11];
  int v77 = 1;
LABEL_7:
  v63 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v61];
  [v63 setValue:v62 forKey:*MEMORY[0x263F3FE88]];
  unsigned int loopCount = v64->_loopCount;
  v64->_unsigned int loopCount = 1;
  if (v64->_isAGXDevice)
  {
    unint64_t v13 = [v61 objectForKeyedSubscript:*MEMORY[0x263F3FF00]];
    uint64_t v14 = v13;
    if (v13)
    {
      [v13 doubleValue];
      double v16 = floor(v15);
      uint64_t v17 = (v16 * 100.0);
      uint64_t v18 = (ceil(v15) * 100.0);
      double v19 = v15 - v16;
    }
    else
    {
      uint64_t v18 = 0;
      uint64_t v17 = 0;
      double v19 = 0.5;
    }
    uint64_t v60 = [(DYMTLDebugPlaybackEngineCounterSupport *)v64 _profileFrameWithCounterListsForProfileInfo:v63 setConsistentState:v18];
  }
  else
  {
    uint64_t v60 = [(DYMTLDebugPlaybackEngineCounterSupport *)v64 _profileFrameWithCounterListsForProfileInfo:v63];
    uint64_t v18 = 0;
    uint64_t v17 = 0;
    double v19 = 0.5;
  }
  uint64_t v59 = [(DYMTLDebugPlaybackEngineCounterSupport *)v64 _profileSplitEncodersForProfileInfo:v63];
  if (v64->_isAGXDevice)
  {
    unint64_t v20 = [(DYMTLDebugPlaybackEngineCounterSupport *)v64 _profileFrameForFrameTiming:v63 atConsistentState:v18];
    unint64_t v21 = (unint64_t)((1.0 - v19)
                           * (double)[(DYMTLDebugPlaybackEngineCounterSupport *)v64 _profileFrameForFrameTiming:v63 atConsistentState:v17]+ v19 * (double)v20);
    unint64_t v22 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v23 = [NSNumber numberWithUnsignedLongLong:v21];
    uint64_t v58 = [v22 dictionaryWithObject:v23 forKey:@"gputime"];
  }
  else
  {
    uint64_t v58 = 0;
  }
  v64->_unsigned int loopCount = loopCount;
  if (!v60)
  {
    id v33 = 0;
    goto LABEL_66;
  }
  long long v54 = [v60 objectForKeyedSubscript:*MEMORY[0x263F3FA38]];
  unint64_t v69 = objc_opt_new();
  v70 = objc_opt_new();
  v71 = objc_opt_new();
  unint64_t v66 = objc_opt_new();
  [v60 objectForKeyedSubscript:*MEMORY[0x263F3FAD8]];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [obj countByEnumeratingWithState:&v94 objects:v101 count:16];
  if (!v24)
  {
    unsigned int v26 = -1;
    unsigned int v28 = -1;
    unsigned int v78 = -1;
    goto LABEL_36;
  }
  int v80 = 0;
  int v25 = 0;
  unsigned int v26 = -1;
  uint64_t v27 = *(void *)v95;
  unsigned int v28 = -1;
  unsigned int v78 = -1;
  do
  {
    uint64_t v29 = 0;
    int v30 = v80;
    v80 += v24;
    do
    {
      if (*(void *)v95 != v27) {
        objc_enumerationMutation(obj);
      }
      uint64_t v31 = *(void *)(*((void *)&v94 + 1) + 8 * v29);
      if ([@"MTLStat_nSec" isEqualToString:v31])
      {
        unsigned int v26 = v30 + v29;
      }
      else if ([@"SW_PBUsed" isEqualToString:v31] {
             || [@"_fedf2c59" isEqualToString:v31])
      }
      {
        unsigned int v28 = v30 + v29;
      }
      else
      {
        if (![@"MTLStatTotalGPUCycles" isEqualToString:v31]) {
          goto LABEL_28;
        }
        unsigned int v78 = v30 + v29;
      }
      if (++v25 == 3) {
        goto LABEL_36;
      }
LABEL_28:
      ++v29;
    }
    while (v24 != v29);
    uint64_t v32 = [obj countByEnumeratingWithState:&v94 objects:v101 count:16];
    uint64_t v24 = v32;
  }
  while (v32);
LABEL_36:

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v55 = v54;
  uint64_t v52 = [v55 countByEnumeratingWithState:&v90 objects:v100 count:16];
  if (v52)
  {
    uint64_t v53 = *(void *)v91;
    uint64_t v34 = v26;
    uint64_t v76 = v78;
    uint64_t v74 = v28;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v91 != v53) {
          objc_enumerationMutation(v55);
        }
        long long v35 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        id v67 = v35;
        uint64_t v72 = [v67 countByEnumeratingWithState:&v86 objects:v99 count:16];
        if (v72)
        {
          uint64_t v68 = *(void *)v87;
          do
          {
            for (uint64_t j = 0; j != v72; ++j)
            {
              if (*(void *)v87 != v68) {
                objc_enumerationMutation(v67);
              }
              uint64_t v36 = *(void **)(*((void *)&v86 + 1) + 8 * j);
              unint64_t v37 = [NSNumber numberWithLongLong:0];
              unint64_t v38 = [NSNumber numberWithLongLong:0];
              v81 = objc_opt_new();
              uint64_t v79 = objc_opt_new();
              long long v84 = 0u;
              long long v85 = 0u;
              long long v82 = 0u;
              long long v83 = 0u;
              id v75 = v36;
              uint64_t v39 = [v75 countByEnumeratingWithState:&v82 objects:v98 count:16];
              if (v39)
              {
                uint64_t v40 = *(void *)v83;
                do
                {
                  for (uint64_t k = 0; k != v39; ++k)
                  {
                    if (*(void *)v83 != v40) {
                      objc_enumerationMutation(v75);
                    }
                    unint64_t v42 = *(void **)(*((void *)&v82 + 1) + 8 * k);
                    v43 = NSNumber;
                    long long v44 = [v42 objectAtIndexedSubscript:v34];
                    uint64_t v45 = objc_msgSend(v43, "numberWithUnsignedLongLong:", objc_msgSend(v37, "unsignedLongLongValue") + objc_msgSend(v44, "unsignedLongLongValue"));

                    unint64_t v37 = (void *)v45;
                    long long v46 = [v42 objectAtIndexedSubscript:v34];
                    [v81 addObject:v46];

                    id v47 = [v42 objectAtIndexedSubscript:v76];
                    [v79 addObject:v47];

                    if (v77)
                    {
                      unint64_t v48 = NSNumber;
                      v49 = [v42 objectAtIndexedSubscript:v74];
                      uint64_t v50 = objc_msgSend(v48, "numberWithUnsignedLongLong:", objc_msgSend(v38, "unsignedLongLongValue") + objc_msgSend(v49, "unsignedLongLongValue"));

                      unint64_t v38 = (void *)v50;
                    }
                  }
                  uint64_t v39 = [v75 countByEnumeratingWithState:&v82 objects:v98 count:16];
                }
                while (v39);
              }

              [v69 addObject:v37];
              [v70 addObject:v81];
              [v71 addObject:v79];
              if (v77) {
                [v66 addObject:v38];
              }
            }
            uint64_t v72 = [v67 countByEnumeratingWithState:&v86 objects:v99 count:16];
          }
          while (v72);
        }
      }
      uint64_t v52 = [v55 countByEnumeratingWithState:&v90 objects:v100 count:16];
    }
    while (v52);
  }

  id v33 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v33 setObject:v69 forKeyedSubscript:@"encoder time data"];
  [v33 setObject:v70 forKeyedSubscript:@"kick time data"];
  [v33 setObject:v71 forKeyedSubscript:@"kick cycle data"];
  [v33 setObject:v59 forKeyedSubscript:*MEMORY[0x263F3FEE8]];
  if (v64->_isAGXDevice) {
    [v33 setObject:v58 forKeyedSubscript:@"consistent time"];
  }
  if (v77) {
    [v33 setObject:v66 forKeyedSubscript:@"tilerParamBufBytesUsedArray"];
  }

LABEL_66:
  return v33;
}

- (id)profileFrameWithCounterListsForProfileInfo:(id)a3
{
  id v4 = a3;
  p_engine = &self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  id v7 = [WeakRetained player];
  [v7 enableStatsSampling:1];

  id v8 = objc_loadWeakRetained((id *)&self->_engine);
  id v9 = [v8 player];
  [v9 setupAllStatLocationsWithBlitOption:1];

  uint64_t v10 = [(DYMTLDebugPlaybackEngineCounterSupport *)self _profileFrameWithCounterListsForProfileInfo:v4 encoderPass:0];
  if (self->_isAGXDevice)
  {
    uint64_t v11 = *MEMORY[0x263F3FEE8];
    unint64_t v12 = [v4 objectForKeyedSubscript:*MEMORY[0x263F3FEE8]];
    unint64_t v13 = v12;
    if (v12 && [v12 BOOLValue])
    {
      uint64_t v14 = [(DYMTLDebugPlaybackEngineCounterSupport *)self _profileSplitEncodersForProfileInfo:v4];
      if (v14) {
        [v10 setObject:v14 forKeyedSubscript:v11];
      }
    }
  }
  else
  {
    double v15 = [v4 objectForKeyedSubscript:*MEMORY[0x263F3FEE0]];

    if (!v15) {
      goto LABEL_10;
    }
    id v16 = objc_loadWeakRetained((id *)&self->_engine);
    uint64_t v17 = [v16 player];
    [v17 enableStatsSampling:1];

    id v18 = objc_loadWeakRetained((id *)&self->_engine);
    double v19 = [v18 player];
    [v19 sampleEncoderCounters];

    unint64_t v13 = [(DYMTLDebugPlaybackEngineCounterSupport *)self _profileFrameWithCounterListsForProfileInfo:v4 encoderPass:1];
    [v10 setObject:v13 forKeyedSubscript:*MEMORY[0x263F3FB58]];
  }

LABEL_10:
  id v20 = objc_loadWeakRetained((id *)p_engine);
  unint64_t v21 = [v20 player];
  [v21 enableStatsSampling:0];

  return v10;
}

- (id)profileFrameWithCounterListsForProfileInfoAsync:(id)a3
{
  v3 = [(DYMTLDebugPlaybackEngineCounterSupport *)self _profileFrameWithCounterListsForProfileInfoAsync:a3 encoderPass:0 updateStatSampling:1 setConsistentState:0];
  return v3;
}

- (id)_profileFrameWithCounterListsForProfileInfo:(id)a3
{
  v3 = [(DYMTLDebugPlaybackEngineCounterSupport *)self _profileFrameWithCounterListsForProfileInfo:a3 encoderPass:0];
  return v3;
}

- (id)_updatedBatchInfos:(id)a3 fromPerEncoderDrawCallCount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  while (v8 < [v6 count])
  {
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:v8];
    uint64_t v11 = [v6 objectForKeyedSubscript:v10];
    uint64_t v12 = [v11 unsignedIntegerValue];

    if (v12)
    {
      unint64_t v13 = [v5 objectAtIndexedSubscript:v9];
      [v7 addObject:v13];
      ++v9;
    }
    else
    {
      [v7 addObject:&unk_2700FA008];
    }
    ++v8;
  }

  return v7;
}

- (id)_runPassesForCounterLists:(id)a3 encoderPass:(BOOL)a4 frameProfileInfo:(void *)a5
{
  id v30 = a3;
  [(DYMTLDebugPlaybackEngineCounterSupport *)self _clearData];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  [WeakRetained setPlaybackMode:5];

  id v7 = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v31 = [v7 player];

  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = __Block_byref_object_copy__3;
  uint64_t v52 = __Block_byref_object_dispose__3;
  unint64_t v8 = [v30 objectForKeyedSubscript:*MEMORY[0x263F3FE88]];
  id v53 = [v31 counterInfo:v8];

  if (self->_isAGXDevice)
  {
    uint64_t v9 = *MEMORY[0x263F3FA40];
    uint64_t v10 = [v30 objectForKeyedSubscript:*MEMORY[0x263F3FA40]];
    if (v10)
    {
      uint64_t v11 = [v30 objectForKeyedSubscript:@"perEncoderIndexDrawCallCount"];
      uint64_t v12 = [(DYMTLDebugPlaybackEngineCounterSupport *)self _updatedBatchInfos:v10 fromPerEncoderDrawCallCount:v11];

      [v31 setupBatchFilterForEncoders:v12];
      if (v12)
      {
        [(id)v49[5] setObject:v12 forKeyedSubscript:v9];
        uint64_t v13 = *MEMORY[0x263F3FC28];
        uint64_t v14 = [v30 objectForKeyedSubscript:*MEMORY[0x263F3FC28]];

        if (v14) {
          [(id)v49[5] setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v13];
        }
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  [v31 setupProfilingForCounterLists];
  double v15 = [(id)v49[5] objectForKeyedSubscript:*MEMORY[0x263F3FDA0]];
  uint64_t v16 = [v15 unsignedIntegerValue];

  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  dispatch_group_t v17 = dispatch_group_create();
  if (v16)
  {
    uint64_t v18 = 0;
    while (!v45[3])
    {
      if (([v31 setupProfilingForListAtIndex:v18] & 1) == 0)
      {

        id v26 = 0;
        goto LABEL_20;
      }
      id v19 = objc_loadWeakRetained((id *)&self->_engine);
      [v19 setPlaybackMode:5];

      [v31 resetFunctionPlayerData];
      id v20 = objc_loadWeakRetained((id *)&self->_engine);
      [v20 setLoopTimeLimit:3000000000];

      id v21 = objc_loadWeakRetained((id *)&self->_engine);
      [v21 playbackToFunction:0 withLoops:self->_loopCount];

      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x4812000000;
      v41[3] = __Block_byref_object_copy__85;
      v41[4] = __Block_byref_object_dispose__86;
      v41[5] = "";
      *(_OWORD *)__p = *(_OWORD *)&self->_commandBufferFrameProfilesInfo.__begin_;
      self->_commandBufferFrameProfilesInfo.__begin_ = 0;
      self->_commandBufferFrameProfilesInfo.__end_ = 0;
      value = self->_commandBufferFrameProfilesInfo.__end_cap_.__value_;
      self->_commandBufferFrameProfilesInfo.__end_cap_.__value_ = 0;
      dispatch_group_enter(v17);
      unint64_t v22 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __97__DYMTLDebugPlaybackEngineCounterSupport__runPassesForCounterLists_encoderPass_frameProfileInfo___block_invoke;
      block[3] = &unk_265339200;
      unint64_t v37 = v41;
      uint64_t v38 = v18;
      uint64_t v36 = &v48;
      long long v35 = &v44;
      block[4] = self;
      id v23 = v30;
      BOOL v40 = a4;
      id v33 = v23;
      uint64_t v39 = a5;
      uint64_t v34 = v17;
      dispatch_async(v22, block);

      _Block_object_dispose(v41, 8);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v16 == ++v18) {
        break;
      }
    }
  }
  [v31 stopFrameProfiling];
  id v24 = objc_loadWeakRetained((id *)&self->_engine);
  [v24 setPlaybackMode:0];

  dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if (v45[3]) {
    int v25 = 0;
  }
  else {
    int v25 = (void *)v49[5];
  }
  id v26 = v25;
LABEL_20:
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  return v26;
}

void __97__DYMTLDebugPlaybackEngineCounterSupport__runPassesForCounterLists_encoderPass_frameProfileInfo___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v2 = objc_opt_new();
    v3 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:*MEMORY[0x263F3FAD0]];
    id v4 = [v3 objectAtIndexedSubscript:*(void *)(a1 + 80)];
    [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x263F3FAD8]];

    uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v6 = *(void *)(v5 + 48);
    id v7 = *(uint64_t **)(v5 + 56);
    unint64_t v8 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - v6) >> 4));
    if (v7 == (uint64_t *)v6) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v8;
    }
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> *,false>(v6, v7, (uint64_t)&__p, v9, 1);
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    __p = 0;
    if (([*(id *)(a1 + 32) _computeAverageForFrameProfile:&__p forProfile:*(void *)(*(void *)(a1 + 72) + 8) + 48 withInfo:*(void *)(a1 + 40) andUpdatedCounterInfo:v2 forEncoders:*(unsigned __int8 *)(a1 + 96)] & 1) == 0)atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 24), 1uLL, memory_order_relaxed); {
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> const*>,std::__wrap_iter<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> const*>,std::back_insert_iterator<std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>,0>((long long *)__p, v11, *(void ***)(a1 + 88));
    }
    if (__p)
    {
      uint64_t v11 = (long long *)__p;
      operator delete(__p);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)_profileFrameWithCounterListsForProfileInfoAsync:(id)a3 encoderPass:(BOOL)a4 updateStatSampling:(BOOL)a5 setConsistentState:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x4812000000;
  uint64_t v45 = __Block_byref_object_copy__85;
  uint64_t v46 = __Block_byref_object_dispose__86;
  uint64_t v47 = "";
  v49 = 0;
  uint64_t v50 = 0;
  uint64_t v48 = 0;
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
    uint64_t v12 = [WeakRetained player];
    [v12 enableStatsSampling:1];

    id v13 = objc_loadWeakRetained((id *)&self->_engine);
    uint64_t v14 = [v13 player];
    [v14 setupAllStatLocationsWithBlitOption:1];
  }
  if (v6 && self->_isAGXDevice)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_engine);
    uint64_t v16 = [v15 player];
    [v16 setConsistentStateTo:v6];

    id v17 = objc_loadWeakRetained((id *)&self->_engine);
    uint64_t v18 = [v17 player];
    [v18 enableConsistentState:1];
  }
  uint64_t v36 = 0;
  unint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__3;
  BOOL v40 = __Block_byref_object_dispose__3;
  id v41 = [(DYMTLDebugPlaybackEngineCounterSupport *)self _runPassesForCounterLists:v10 encoderPass:v8 frameProfileInfo:v43 + 6];
  if (v7)
  {
    id v19 = objc_loadWeakRetained((id *)&self->_engine);
    id v20 = [v19 player];
    [v20 enableStatsSampling:0];
  }
  if (v37[5])
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    id v33 = __Block_byref_object_copy__3;
    uint64_t v34 = __Block_byref_object_dispose__3;
    id v35 = [MEMORY[0x263F3F9D0] future];
    id v21 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __141__DYMTLDebugPlaybackEngineCounterSupport__profileFrameWithCounterListsForProfileInfoAsync_encoderPass_updateStatSampling_setConsistentState___block_invoke;
    block[3] = &unk_265339228;
    uint64_t v27 = &v42;
    id v26 = &v36;
    block[4] = self;
    BOOL v29 = v8;
    id v25 = v10;
    unsigned int v28 = &v30;
    dispatch_async(v21, block);

    id v22 = (id)v31[5];
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    id v22 = [MEMORY[0x263F3F9D0] futureWithResult:0 error:0];
  }
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  if (v48)
  {
    v49 = v48;
    operator delete(v48);
  }

  return v22;
}

void __141__DYMTLDebugPlaybackEngineCounterSupport__profileFrameWithCounterListsForProfileInfoAsync_encoderPass_updateStatSampling_setConsistentState___block_invoke(uint64_t a1)
{
  uint64_t v171 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:*MEMORY[0x263F3FDA0]];
  unint64_t v2 = [v1 unsignedIntegerValue];

  v130 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:*MEMORY[0x263F3FAD0]];
  unint64_t v3 = 0;
  if (v2)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      uint64_t v5 = [v130 objectAtIndexedSubscript:i];
      v3 += [v5 count];
    }
  }
  uint64_t v118 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:*MEMORY[0x263F3FAD8]];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void *)(v6 + 48);
  BOOL v8 = *(uint64_t **)(v6 + 56);
  unint64_t v9 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - v7) >> 4));
  if (v8 == (uint64_t *)v7) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v9;
  }
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> *,false>(v7, v8, (uint64_t)&v131, v10, 1);
  v163[0] = 0;
  v163[1] = 0;
  unint64_t v162 = (uint64_t *)v163;
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v12 = *(long long **)(v11 + 48);
  for (uint64_t j = *(long long **)(v11 + 56); v12 != j; v12 += 3)
  {
    long long v131 = *v12;
    *(void *)&long long v132 = *((void *)v12 + 2);
    uint64_t v14 = std::__tree<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::__map_value_compare<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::less<std::tuple<unsigned long long,unsigned long long,unsigned long long>>,true>,std::allocator<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>>>::find<std::tuple<unsigned long long,unsigned long long,unsigned long long>>((uint64_t)&v162, (unint64_t *)&v131);
    if (v163 == v14)
    {
      long long v159 = 0uLL;
      std::vector<std::pair<unsigned long long,unsigned long long>>::vector(&v160, v3, &v159);
      v164 = &v131;
      id v15 = std::__tree<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::__map_value_compare<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::less<std::tuple<unsigned long long,unsigned long long,unsigned long long>>,true>,std::allocator<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>>>::__emplace_unique_key_args<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::piecewise_construct_t const&,std::tuple<std::tuple<unsigned long long,unsigned long long,unsigned long long> const&>,std::tuple<>>(&v162, (unint64_t *)&v131, (uint64_t)&std::piecewise_construct, &v164);
      uint64_t v16 = (void *)v15[7];
      if (v16)
      {
        v15[8] = v16;
        operator delete(v16);
        v15[7] = 0;
        v15[8] = 0;
        v15[9] = 0;
      }
      *(_OWORD *)(v15 + 7) = v160;
      v15[9] = v161;
      uint64_t v14 = std::__tree<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::__map_value_compare<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>,std::less<std::tuple<unsigned long long,unsigned long long,unsigned long long>>,true>,std::allocator<std::__value_type<std::tuple<unsigned long long,unsigned long long,unsigned long long>,std::vector<std::pair<unsigned long long,unsigned long long>>>>>::find<std::tuple<unsigned long long,unsigned long long,unsigned long long>>((uint64_t)&v162, (unint64_t *)&v131);
    }
    *(_OWORD *)(v14[7] + 16 * *((void *)v12 + 3)) = v12[2];
  }
  v164 = (long long *)objc_opt_new();
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  obuint64_t j = v118;
  uint64_t v17 = [obj countByEnumeratingWithState:&v155 objects:v170 count:16];
  if (v17)
  {
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)v156;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v156 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v155 + 1) + 8 * k);
        id v22 = [NSNumber numberWithUnsignedInteger:v18 + k];
        [v164 setObject:v22 forKeyedSubscript:v21];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v155 objects:v170 count:16];
      v18 += k;
    }
    while (v17);
  }

  if (v2)
  {
    id v23 = objc_opt_new();
    if (v2 >= 2)
    {
      id v24 = [v130 objectAtIndexedSubscript:0];
      unint64_t v25 = [v24 count];
      id v26 = [v130 objectAtIndexedSubscript:1];
      unint64_t v27 = [v26 count];
      unint64_t v28 = v27 >= v25 ? v25 : v27;

      if (v28)
      {
        for (uint64_t m = 0; m != v28; ++m)
        {
          uint64_t v30 = [v130 objectAtIndexedSubscript:0];
          uint64_t v31 = [v30 objectAtIndexedSubscript:m];
          uint64_t v32 = [v130 objectAtIndexedSubscript:1];
          id v33 = [v32 objectAtIndexedSubscript:m];
          int v34 = [v31 isEqualToString:v33];

          if (v34)
          {
            id v35 = [v130 objectAtIndexedSubscript:0];
            uint64_t v36 = [v35 objectAtIndexedSubscript:m];
            [v23 addObject:v36];
          }
        }
      }
    }
    long long v131 = 0u;
    long long v132 = 0u;
    LODWORD(v133) = 1065353216;
    unint64_t v37 = objc_opt_new();
    uint64_t v38 = 0;
    *(void *)&long long v160 = 0;
    if (v2 <= 1) {
      uint64_t v39 = 1;
    }
    else {
      uint64_t v39 = v2;
    }
    uint64_t v127 = v39;
    do
    {
      long long v153 = 0u;
      long long v154 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      BOOL v40 = [v130 objectAtIndexedSubscript:v38];
      uint64_t v41 = [v40 countByEnumeratingWithState:&v151 objects:v169 count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v152;
        do
        {
          for (uint64_t n = 0; n != v41; ++n)
          {
            if (*(void *)v152 != v42) {
              objc_enumerationMutation(v40);
            }
            uint64_t v44 = *(void *)(*((void *)&v151 + 1) + 8 * n);
            if (v38 && [v23 containsObject:*(void *)(*((void *)&v151 + 1) + 8 * n)]) {
              std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t)&v131, (unint64_t *)&v160, &v160);
            }
            *(void *)&long long v160 = v160 + 1;
            uint64_t v45 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
            [v37 setObject:v44 forKeyedSubscript:v45];
          }
          uint64_t v41 = [v40 countByEnumeratingWithState:&v151 objects:v169 count:16];
        }
        while (v41);
      }

      ++v38;
    }
    while (v38 != v127);
    uint64_t v46 = v162;
    if (v162 != (uint64_t *)v163)
    {
      do
      {
        unint64_t v47 = [obj count];
        long long v159 = 0uLL;
        std::vector<std::pair<unsigned long long,unsigned long long>>::vector(&v160, v47, &v159);
        uint64_t v48 = 0;
        v125 = v46;
        v49 = (void **)(v46 + 7);
        *(void *)&long long v159 = 0;
        do
        {
          for (iuint64_t i = 0; ; ++ii)
          {
            uint64_t v51 = [v130 objectAtIndexedSubscript:v48];
            BOOL v52 = ii < [v51 count];

            if (!v52) {
              break;
            }
            if (std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v131, (unint64_t *)&v159))
            {
              *(void *)&long long v159 = v159 + 1;
            }
            else
            {
              id v53 = v164;
              long long v54 = [NSNumber numberWithUnsignedInteger:(void)v159];
              id v55 = [v37 objectForKeyedSubscript:v54];
              uint64_t v56 = [v53 objectForKeyedSubscript:v55];
              uint64_t v57 = [v56 unsignedIntegerValue];

              uint64_t v58 = v159;
              *(void *)&long long v159 = v159 + 1;
              *(_OWORD *)(v160 + 16 * v57) = *((_OWORD *)*v49 + v58);
            }
          }
          ++v48;
        }
        while (v48 != v127);
        uint64_t v59 = *v49;
        uint64_t v60 = v125;
        if (*v49)
        {
          v125[8] = (uint64_t)v59;
          operator delete(v59);
          void *v49 = 0;
          v49[1] = 0;
          v49[2] = 0;
        }
        *(_OWORD *)(v125 + 7) = v160;
        v125[9] = v161;
        id v61 = (uint64_t *)v125[1];
        if (v61)
        {
          do
          {
            uint64_t v62 = v61;
            id v61 = (uint64_t *)*v61;
          }
          while (v61);
        }
        else
        {
          do
          {
            uint64_t v62 = (uint64_t *)v60[2];
            BOOL v81 = *v62 == (void)v60;
            uint64_t v60 = v62;
          }
          while (!v81);
        }
        uint64_t v46 = v62;
      }
      while (v62 != (uint64_t *)v163);
    }

    std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&v131);
  }
  *(void *)&long long v160 = 0;
  v63 = [v164 objectForKeyedSubscript:@"MTLStatCommandBufferIndex"];
  uint64_t v64 = [v63 unsignedIntegerValue];

  *(void *)&long long v160 = v64;
  *(void *)&long long v159 = 0;
  v65 = [v164 objectForKeyedSubscript:@"MTLStatEncoderIndex"];
  uint64_t v66 = [v65 unsignedIntegerValue];

  *(void *)&long long v159 = v66;
  uint64_t v150 = 0;
  id v67 = [v164 objectForKeyedSubscript:@"MTLStatCommandIndex"];
  uint64_t v68 = [v67 unsignedIntegerValue];

  uint64_t v150 = v68;
  char v149 = 0;
  id v148 = 0;
  uint64_t v70 = a1 + 32;
  uint64_t v69 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v69 + 104))
  {
    v71 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x263F3FD98]];
    id v72 = v71;
    if (v71)
    {
      v123 = 0;
      BOOL v128 = [v71 count] != 0;
    }
    else
    {
      BOOL v128 = 0;
      v123 = 0;
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v69 + 88));
    uint64_t v74 = [WeakRetained player];
    char v149 = [v74 isBlitSamplingSupported];

    id v75 = *(void **)(a1 + 40);
    if (v149) {
      [v75 objectForKeyedSubscript:@"perEncoderIndexDrawCallCount"];
    }
    else {
    v123 = [v75 objectForKeyedSubscript:@"withoutBlitPerEncoderIndexDrawCallCount"];
    }
    uint64_t v76 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"blitEncoderIndices"];
    id v77 = v148;
    id v148 = v76;

    if (v148)
    {
      BOOL v128 = 0;
      goto LABEL_74;
    }
    unsigned int v78 = objc_opt_new();
    BOOL v128 = 0;
    id v72 = v148;
    id v148 = v78;
  }

LABEL_74:
  uint64_t v79 = objc_opt_new();
  uint64_t v146 = -1;
  id v147 = v79;
  id v144 = 0;
  id v145 = 0;
  uint64_t v143 = 0;
  *(void *)&long long v131 = a1 + 32;
  *((void *)&v131 + 1) = a1 + 40;
  *(void *)&long long v132 = &v149;
  *((void *)&v132 + 1) = &v146;
  v133 = &v164;
  id v134 = &v143;
  v135 = &v148;
  uint64_t v136 = a1 + 72;
  uint64_t v137 = &v144;
  uint64_t v138 = &v145;
  v139 = &v160;
  v140 = &v147;
  id v141 = &v159;
  uint64_t v142 = &v150;
  int v80 = v162;
  if (v162 != (uint64_t *)v163)
  {
    int v122 = -1;
    uint64_t v124 = -1;
    uint64_t v126 = -1;
    uint64_t v120 = -1;
    uint64_t v121 = -1;
    do
    {
      if (*(unsigned char *)(*(void *)v70 + 104)) {
        goto LABEL_90;
      }
      BOOL v81 = !*(unsigned char *)(a1 + 72) || v123 == 0;
      if (v81) {
        goto LABEL_90;
      }
      uint64_t v82 = v80[7];
      uint64_t v83 = *(void *)(v82 + 16 * v160);
      uint64_t v84 = *(void *)(v82 + 16 * v159);
      uint64_t v86 = v120;
      uint64_t v85 = v121;
      BOOL v87 = v120 == v83 && v121 == v84;
      if (v87) {
        int v88 = v122;
      }
      else {
        int v88 = v122 + 1;
      }
      if (!v87)
      {
        uint64_t v86 = v83;
        uint64_t v85 = v84;
      }
      uint64_t v120 = v86;
      uint64_t v121 = v85;
      int v122 = v88;
      long long v89 = [NSNumber numberWithUnsignedLongLong:v88];
      long long v90 = [v123 objectForKeyedSubscript:v89];
      uint64_t v91 = [v90 unsignedLongLongValue];

      if (v91)
      {
LABEL_90:
        uint64_t v92 = v80[4];
        if (v92 != v124)
        {
          uint64_t v146 = -1;
          long long v93 = objc_opt_new();
          id v94 = v145;
          id v145 = v93;

          [v147 addObject:v145];
          uint64_t v124 = v92;
          uint64_t v126 = -1;
        }
        uint64_t v95 = v80[5];
        if (v95 != v126)
        {
          v146 += v95 - v126;
          long long v96 = objc_opt_new();
          id v97 = v144;
          id v144 = v96;

          [v145 addObject:v144];
          _ZZZ141__DYMTLDebugPlaybackEngineCounterSupport__profileFrameWithCounterListsForProfileInfoAsync_encoderPass_updateStatSampling_setConsistentState__EUb_ENK3__0clEb((uint64_t)&v131, 1);
          uint64_t v126 = v95;
        }
        uint64_t v98 = objc_opt_new();
        v99 = (uint64_t *)v80[7];
        v100 = (uint64_t *)v80[8];
        while (v99 != v100)
        {
          uint64_t v101 = *v99;
          if (*(unsigned char *)(*(void *)v70 + 104) && v128)
          {
            uint64_t v102 = v99[1];
            BOOL v103 = [NSNumber numberWithUnsignedLongLong:v101];
            v168[0] = v103;
            v104 = [NSNumber numberWithUnsignedLongLong:v102];
            v168[1] = v104;
            v105 = [MEMORY[0x263EFF8C0] arrayWithObjects:v168 count:2];
            [v98 addObject:v105];
          }
          else
          {
            BOOL v103 = [NSNumber numberWithUnsignedLongLong:v101];
            [v98 addObject:v103];
          }

          v99 += 2;
        }
        if (*(unsigned char *)(*(void *)v70 + 104))
        {
          objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v147, "count") - 1);
          if (v128) {
            v106 = {;
          }
            v167[0] = v106;
            v167[1] = &unk_2700F9FF0;
            v107 = [MEMORY[0x263EFF8C0] arrayWithObjects:v167 count:2];
            [v98 setObject:v107 atIndexedSubscript:(void)v160];

            v108 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v145, "count") - 1);
            v166[0] = v108;
            v166[1] = &unk_2700F9FF0;
            uint64_t v109 = [MEMORY[0x263EFF8C0] arrayWithObjects:v166 count:2];
            [v98 setObject:v109 atIndexedSubscript:(void)v159];

            uint64_t v110 = [NSNumber numberWithUnsignedLongLong:v80[6]];
            v165[0] = v110;
            v165[1] = &unk_2700F9FF0;
            uint64_t v111 = [MEMORY[0x263EFF8C0] arrayWithObjects:v165 count:2];
            [v98 setObject:v111 atIndexedSubscript:v150];
          }
          else {
            v114 = {;
          }
            [v98 setObject:v114 atIndexedSubscript:(void)v160];

            v115 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v145, "count") - 1);
            [v98 setObject:v115 atIndexedSubscript:(void)v159];

            uint64_t v110 = [NSNumber numberWithUnsignedLongLong:v80[6]];
            [v98 setObject:v110 atIndexedSubscript:v150];
          }
        }
        else
        {
          uint64_t v112 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v147, "count") - 1);
          [v98 setObject:v112 atIndexedSubscript:(void)v160];

          uint64_t v113 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v145, "count") - 1);
          [v98 setObject:v113 atIndexedSubscript:(void)v159];

          uint64_t v110 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v144, "count"));
          [v98 setObject:v110 atIndexedSubscript:v150];
        }

        [v144 addObject:v98];
      }
      v116 = (uint64_t *)v80[1];
      if (v116)
      {
        do
        {
          v117 = v116;
          v116 = (uint64_t *)*v116;
        }
        while (v116);
      }
      else
      {
        do
        {
          v117 = (uint64_t *)v80[2];
          BOOL v81 = *v117 == (void)v80;
          int v80 = v117;
        }
        while (!v81);
      }
      int v80 = v117;
    }
    while (v117 != (uint64_t *)v163);
  }
  _ZZZ141__DYMTLDebugPlaybackEngineCounterSupport__profileFrameWithCounterListsForProfileInfoAsync_encoderPass_updateStatSampling_setConsistentState__EUb_ENK3__0clEb((uint64_t)&v131, 0);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v147 forKeyedSubscript:*MEMORY[0x263F3FA38]];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setResult:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  std::__tree<DYMTLIABDecodingOp>::destroy((uint64_t)&v162, v163[0]);
}

- (id)_profileFrameWithCounterListsForProfileInfo:(id)a3 encoderPass:(BOOL)a4
{
  id v4 = [(DYMTLDebugPlaybackEngineCounterSupport *)self _profileFrameWithCounterListsForProfileInfoAsync:a3 encoderPass:a4 updateStatSampling:0 setConsistentState:0];
  uint64_t v5 = [v4 result];

  return v5;
}

- (id)_profileFrameWithCounterListsForProfileInfo:(id)a3 setConsistentState:(unsigned int)a4
{
  id v4 = [(DYMTLDebugPlaybackEngineCounterSupport *)self _profileFrameWithCounterListsForProfileInfoAsync:a3 encoderPass:0 updateStatSampling:0 setConsistentState:*(void *)&a4];
  uint64_t v5 = [v4 result];

  return v5;
}

- (unint64_t)_profileFrameForFrameTiming:(id)a3 atConsistentState:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  [(DYMTLDebugPlaybackEngineCounterSupport *)self _clearData];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  BOOL v8 = [WeakRetained player];

  id v9 = objc_loadWeakRetained((id *)&self->_engine);
  [v9 setPlaybackMode:11];

  uint64_t v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F3FE88]];
  uint64_t v11 = [v8 counterInfo:v10];

  [v8 setupFrameTimeProfiling];
  uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F3FDA0]];
  uint64_t v13 = [v12 unsignedIntegerValue];

  if (v13 != 1) {
    goto LABEL_14;
  }
  [v8 allowOverlap:1 withPState:v4];
  if (![v8 setupProfilingForListAtIndex:0]) {
    goto LABEL_14;
  }
  id v14 = objc_loadWeakRetained((id *)&self->_engine);
  [v14 setPlaybackMode:11];

  [v8 resetFunctionPlayerData];
  id v15 = objc_loadWeakRetained((id *)&self->_engine);
  [v15 setLoopTimeLimit:3000000000];

  id v16 = objc_loadWeakRetained((id *)&self->_engine);
  [v16 playbackToFunction:0 withLoops:self->_loopCount];

  [v8 allowOverlap:0 withPState:0];
  id v17 = objc_loadWeakRetained((id *)&self->_engine);
  [v17 setPlaybackMode:0];

  begiuint64_t n = (uint64_t *)self->_commandBufferFrameProfilesInfo.__begin_;
  end = (uint64_t *)self->_commandBufferFrameProfilesInfo.__end_;
  if (begin == end
    || (std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> *,false>((uint64_t)begin, end, (uint64_t)&v29, 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 4)), 1), v20 = (unint64_t *)self->_commandBufferFrameProfilesInfo.__begin_, uint64_t v21 = (unint64_t *)self->_commandBufferFrameProfilesInfo.__end_, v20 == v21))
  {
LABEL_14:
    unint64_t v22 = 0;
  }
  else
  {
    unint64_t v22 = 0;
    unint64_t v23 = 0;
    do
    {
      unint64_t v24 = *v20;
      unint64_t v25 = v20[1];
      v20 += 6;
      if (v23 <= v24) {
        unint64_t v23 = v24;
      }
      BOOL v26 = v25 >= v23;
      unint64_t v27 = v25 - v23;
      if (v25 > v23) {
        unint64_t v23 = v25;
      }
      if (!v26) {
        unint64_t v27 = 0;
      }
      v22 += v27;
    }
    while (v20 != v21);
  }

  return v22;
}

- (id)availableCounters
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  unint64_t v3 = [WeakRetained player];
  uint64_t v4 = [v3 counterInfo:0];

  return v4;
}

- (id)derivedCounterData
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  unint64_t v3 = [WeakRetained player];
  uint64_t v4 = [v3 derivedCounterData];

  return v4;
}

- (void)addCounters:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  frameProfiling = self->_frameProfiling;
  self->_frameProfiling = v4;

  id v6 = (void *)[v7 copy];
  [(NSMutableDictionary *)self->_frameProfiling setObject:v6 forKeyedSubscript:@"frame counters"];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);
  objc_storeStrong((id *)&self->_frameProfiling, 0);
  begiuint64_t n = self->_commandBufferFrameProfiles.__begin_;
  if (begin)
  {
    self->_commandBufferFrameProfiles.__end_ = begin;
    operator delete(begin);
  }
  uint64_t v4 = self->_commandBufferFrameProfilesPerDMDrawCallInfo.__begin_;
  if (v4)
  {
    self->_commandBufferFrameProfilesPerDMDrawCallInfo.__end_ = v4;
    operator delete(v4);
  }
  uint64_t v5 = self->_commandBufferFrameProfilesInfo.__begin_;
  if (v5)
  {
    self->_commandBufferFrameProfilesInfo.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end