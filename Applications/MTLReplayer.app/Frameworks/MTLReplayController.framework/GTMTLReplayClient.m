@interface GTMTLReplayClient
@end

@implementation GTMTLReplayClient

void __GTMTLReplayClient_displayTexture_block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 error];
  [*(id *)(*(void *)(a1 + 40) + 280) setDisplayTextureEncoder:*(void *)(a1 + 32)];
}

void __GTMTLReplayClient_displayAttachment_block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 error];
  [*(id *)(*(void *)(a1 + 40) + 280) setDisplayTextureEncoder:*(void *)(a1 + 32)];
}

void __GTMTLReplayClient_streamShaderProfilingData_block_invoke(GTUSCSamplingStreamingManagerHelper *a1)
{
  uint64_t v1 = *(void *)(*((void *)a1 + 4) + 8);
  GTUSCSamplingStreamingManagerHelper::Instance(a1);
  uint64_t v119 = v1;
  v2 = [*(id *)(v1 + 64) objectForKeyedSubscript:@"useOverlap"];
  id v120 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }
  byte_7728B2 = v4;
  uint64_t v118 = v1 + 48;
  GTUSCSamplingStreamingManagerHelper::InitQueryShaderInfo((GTUSCSamplingStreamingManagerHelper *)(v1 + 48), v3);
  GTUSCSamplingStreamingManagerHelper::GatherCommandBufferRestoreInfo((uint64_t **)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
  unsigned __int8 v6 = atomic_load(byte_772AF4);
  if ((v6 & 1) == 0)
  {
    v7 = objc_opt_new();
    [v7 setObject:*(void *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 56) forKeyedSubscript:@"MetalPluginName"];
    v173 = _NSConcreteStackBlock;
    uint64_t v174 = 3221225472;
    uint64_t v175 = (uint64_t)___ZN35GTUSCSamplingStreamingManagerHelper23StreamHarvestedBinariesEv_block_invoke;
    v176 = (__n128 (*)(__n128 *, __n128 *))&unk_7463C0;
    v178 = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
    v8 = v7;
    v177 = v8;
    v9 = +[NSBlockOperation blockOperationWithBlock:&v173];
    [v9 setQueuePriority:-8];
    [**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) addOperation:v9];
    [v9 waitUntilFinished];
    (*(void (**)(void))(*(void *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 32) + 16))();
  }
  unsigned __int8 v10 = atomic_load(byte_772AF4);
  if ((v10 & 1) == 0)
  {
    id v116 = *(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16);
    v11 = [v116 objectForKeyedSubscript:@"perEncoderDrawCallCount"];
    id v114 = [v11 count];

    v12 = [v116 objectForKeyedSubscript:@"perCommandBufferEncoderCount"];
    id v13 = [v12 count];

    v14 = objc_opt_new();
    v15 = (GTUSCSamplingStreamingManagerHelper *)[*((id *)&xmmword_772038 + 1) count];
    if (v15)
    {
      GTUSCSamplingStreamingManagerHelper::SetupMTLCounterAPIBuffer(v15);
      v127 = v14;
      v173 = 0;
      uint64_t v174 = (uint64_t)&v173;
      uint64_t v175 = 0x4812000000;
      v176 = __Block_byref_object_copy__483;
      v177 = __Block_byref_object_dispose__484;
      v178 = (long long *)&unk_4E231D;
      v16 = (char *)operator new(0x78uLL);
      uint64_t v17 = 0;
      v179[0] = v16;
      v179[2] = v16 + 120;
      do
      {
        v18 = &v16[v17];
        *(_OWORD *)v18 = 0uLL;
        *((_OWORD *)v18 + 1) = 0uLL;
        *((_DWORD *)v18 + 8) = 1065353216;
        v17 += 40;
      }
      while (v17 != 120);
      uint64_t v19 = 0;
      v179[1] = v16 + 120;
      do
      {
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(*(void *)(v174 + 48) + v19, vcvtps_u32_f32((float)(unint64_t)(6 * (void)v114) / *(float *)(*(void *)(v174 + 48) + v19 + 32)));
        v19 += 40;
      }
      while (v19 != 120);
      uint64_t v21 = +[NSMutableArray arrayWithCapacity:3];
      uint64_t v22 = +[NSMutableArray arrayWithCapacity:3];
      v125 = (void *)v22;
      v121 = (void *)v21;
      v23 = (char *)operator new(0x48uLL);
      uint64_t v24 = 0;
      *((void *)v23 + 8) = 0;
      *((_OWORD *)v23 + 2) = 0u;
      *((_OWORD *)v23 + 3) = 0u;
      *(_OWORD *)v23 = 0u;
      *((_OWORD *)v23 + 1) = 0u;
      v137.__begin_ = (std::vector<unsigned int>::pointer)v23;
      v137.__end_ = (std::vector<unsigned int>::pointer)(v23 + 72);
      unint64_t v25 = 2 * (void)v13;
      v137.__end_cap_.__value_ = (unsigned int *)(v23 + 72);
      do
      {
        std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long>>::reserve((void **)&v23[v24], v25);
        v24 += 24;
      }
      while (v24 != 72);
      v26 = 0;
      int v27 = 0;
      int v28 = *(_DWORD *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 68);
      do
      {
        v30 = objc_opt_new();
        v31 = objc_opt_new();
        [v125 addObject:v31];

        CFStringRef v164 = (const __CFString *)_NSConcreteStackBlock;
        uint64_t v165 = 3221225472;
        v166 = ___ZN35GTUSCSamplingStreamingManagerHelper19StreamFrameTimeDataEv_block_invoke;
        CFStringRef v167 = (const __CFString *)&unk_744810;
        int v171 = v28;
        int v172 = v27;
        v169 = &v173;
        v170 = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
        v32 = v30;
        v168 = v32;
        v33 = +[NSBlockOperation blockOperationWithBlock:&v164];
        [v33 setQueuePriority:-8];
        if (v26) {
          [v33 addDependency:v26];
        }
        [**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) addOperation:v33];
        if (dword_77286C && dword_772868)
        {
          CFStringRef v157 = (const __CFString *)_NSConcreteStackBlock;
          uint64_t v158 = 3221225472;
          v159 = ___ZN35GTUSCSamplingStreamingManagerHelper19StreamFrameTimeDataEv_block_invoke_2;
          CFStringRef v160 = (const __CFString *)&unk_744838;
          v162 = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
          id v161 = v125;
          int v163 = v27;
          v34 = +[NSBlockOperation blockOperationWithBlock:&v157];
          [v34 addDependency:v33];
          [v127 addDependency:v34];
          [**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) addOperation:v34];
        }
        else
        {
          [v127 addDependency:v33];
        }
        v150 = _NSConcreteStackBlock;
        uint64_t v151 = 3221225472;
        v152 = ___ZN35GTUSCSamplingStreamingManagerHelper19StreamFrameTimeDataEv_block_invoke_3;
        v153 = &unk_745EA8;
        v156 = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
        v35 = v32;
        v154 = v35;
        id v123 = v121;
        id v155 = v123;
        v36 = +[NSBlockOperation blockOperationWithBlock:&v150];
        [v36 addDependency:v33];
        id v129 = v36;

        [v127 addDependency:v129];
        [*(id *)(*(void *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) + 8) addOperation:v129];

        ++v27;
        v26 = v129;
      }
      while (v27 != 3);
      [*(id *)(*(void *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) + 8) addOperation:v127];
      [v127 waitUntilFinished];
      v131 = +[NSMutableArray arrayWithCapacity:3];
      LODWORD(v37) = 0;
      memset(&v183, 0, sizeof(v183));
      for (uint64_t i = 24; i != 144; i += 40)
      {
        uint64_t v39 = *(void *)(v174 + 48);
        int v40 = *(_DWORD *)(v39 + i);
        v41 = +[NSMutableDictionary dictionaryWithCapacity:0xCCCCCCCCCCCCCCCDLL * ((*(void *)(v174 + 56) - v39) >> 3)];
        [v131 addObject:v41];

        std::vector<unsigned int>::size_type v37 = (v37 + v40);
      }
      std::vector<unsigned int>::reserve(&v183, v37);
      for (uint64_t j = 0; j != 3; ++j)
      {
        v43 = *(uint64_t **)(*(void *)(v174 + 48) + 40 * j + 16);
        if (v43)
        {
          uint64_t v133 = j;
          value = v183.__end_cap_.__value_;
          begin = v183.__begin_;
          do
          {
            v46 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v43 + 7)];
            v180 = v46;
            v47 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v43 + 8)];
            v181 = v47;
            v48 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v43 + 9)];
            v182 = v48;
            v49 = +[NSArray arrayWithObjects:&v180 count:3];
            v50 = [v131 objectAtIndexedSubscript:v133];
            v51 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v43 + 4)];
            [v50 setObject:v49 forKeyedSubscript:v51];

            std::vector<unsigned int>::pointer end = v183.__end_;
            if (v183.__end_ >= value)
            {
              uint64_t v54 = v183.__end_ - begin;
              unint64_t v55 = v54 + 1;
              if ((unint64_t)(v54 + 1) >> 62)
              {
                v183.__end_cap_.__value_ = value;
                v183.__begin_ = begin;
                abort();
              }
              if (((char *)value - (char *)begin) >> 1 > v55) {
                unint64_t v55 = ((char *)value - (char *)begin) >> 1;
              }
              if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v56 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v56 = v55;
              }
              if (v56) {
                unint64_t v56 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v56);
              }
              else {
                uint64_t v57 = 0;
              }
              v58 = (unsigned int *)(v56 + 4 * v54);
              unsigned int *v58 = *((_DWORD *)v43 + 4);
              v53 = v58 + 1;
              while (end != begin)
              {
                unsigned int v59 = *--end;
                *--v58 = v59;
              }
              value = (unsigned int *)(v56 + 4 * v57);
              v183.__end_ = v53;
              if (begin) {
                operator delete(begin);
              }
              begin = v58;
            }
            else
            {
              *v183.__end_ = *((_DWORD *)v43 + 4);
              v53 = end + 1;
            }
            v183.__end_ = v53;
            v43 = (uint64_t *)*v43;
          }
          while (v43);
          v183.__end_cap_.__value_ = value;
          v183.__begin_ = begin;
          uint64_t j = v133;
        }
      }
      id v136 = 0;
      v60 = +[NSKeyedArchiver archivedDataWithRootObject:v131 requiringSecureCoding:1 error:&v136];
      id v61 = v136;
      v62 = v183.__begin_;
      v63 = +[NSData dataWithBytes:v183.__begin_ length:(char *)v183.__end_ - (char *)v183.__begin_];
      *(void *)&long long v138 = @"Frame Time Data";
      *((void *)&v138 + 1) = @"Encoder TraceId Data";
      *(void *)&long long v144 = v123;
      *((void *)&v144 + 1) = v63;
      v139[0] = (std::vector<unsigned int>::size_type)@"Num Encoders";
      v64 = +[NSNumber numberWithUnsignedInteger:v114];
      __n[0] = (std::vector<unsigned int>::size_type)v64;
      v139[1] = (std::vector<unsigned int>::size_type)@"Num Ring Buffers";
      v65 = +[NSNumber numberWithUnsignedInt:qword_7728A0];
      __n[1] = (std::vector<unsigned int>::size_type)v65;
      v146 = &off_759708;
      CFStringRef v140 = @"Num Frame Iterations";
      CFStringRef v141 = @"Sample Marker";
      v66 = +[NSNumber numberWithUnsignedLongLong:qword_772048];
      v147 = v66;
      v148 = v60;
      CFStringRef v142 = @"TraceId to SampleIndex";
      CFStringRef v143 = @"Frame Encoder Times Data";
      v149 = v125;
      v67 = +[NSDictionary dictionaryWithObjects:&v144 forKeys:&v138 count:8];

      (*(void (**)(void))(*(void *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 32) + 16))();
      if (v62)
      {
        v183.__end_ = v62;
        operator delete(v62);
      }

      v183.__begin_ = (std::vector<unsigned int>::pointer)&v137;
      std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v183);

      _Block_object_dispose(&v173, 8);
      v137.__begin_ = (std::vector<unsigned int>::pointer)v179;
      std::vector<std::unordered_map<unsigned int,GTEncoderSampleIndexInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v137);

      v14 = v127;
    }
  }
  unsigned __int8 v68 = atomic_load(byte_772AF4);
  if ((v68 & 1) == 0)
  {
    long long v144 = 0u;
    *(_OWORD *)__n = 0u;
    LODWORD(v146) = 1065353216;
    long long v138 = 0u;
    *(_OWORD *)v139 = 0u;
    LODWORD(v140) = 1065353216;
    v128 = objc_opt_new();
    v130 = objc_opt_new();
    v124 = objc_opt_new();
    v126 = objc_opt_new();
    v113 = GTUSCSamplingStreamingManagerHelper::GatherFrameMiscEncoderPostProcessedData(0, v128, v124, (uint64_t)&v144, 0);
    v115 = GTUSCSamplingStreamingManagerHelper::GatherFrameMiscEncoderPostProcessedData(1, v130, v126, (uint64_t)&v138, v113);
    [v115 waitUntilFinished];
    v134 = +[NSMutableDictionary dictionaryWithCapacity:__n[1]];
    memset(&v137, 0, sizeof(v137));
    std::vector<unsigned int>::reserve(&v137, __n[1]);
    std::vector<unsigned int>::size_type v69 = __n[0];
    if (__n[0])
    {
      v70 = v137.__end_cap_.__value_;
      v71 = v137.__begin_;
      do
      {
        v72 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v69 + 28)];
        v183.__begin_ = v72;
        v73 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v69 + 32)];
        v183.__end_ = v73;
        v74 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v69 + 36)];
        v183.__end_cap_.__value_ = v74;
        v75 = +[NSArray arrayWithObjects:&v183 count:3];
        v76 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v69 + 16)];
        [v134 setObject:v75 forKeyedSubscript:v76];

        std::vector<unsigned int>::pointer v77 = v137.__end_;
        if (v137.__end_ >= v70)
        {
          uint64_t v79 = v137.__end_ - v71;
          unint64_t v80 = v79 + 1;
          if ((unint64_t)(v79 + 1) >> 62)
          {
            v137.__begin_ = v71;
            abort();
          }
          if (((char *)v70 - (char *)v71) >> 1 > v80) {
            unint64_t v80 = ((char *)v70 - (char *)v71) >> 1;
          }
          if ((unint64_t)((char *)v70 - (char *)v71) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v81 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v81 = v80;
          }
          if (v81) {
            unint64_t v81 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v81);
          }
          else {
            uint64_t v82 = 0;
          }
          v83 = (unsigned int *)(v81 + 4 * v79);
          unsigned int *v83 = *(_DWORD *)(v69 + 16);
          v78 = v83 + 1;
          while (v77 != v71)
          {
            unsigned int v84 = *--v77;
            *--v83 = v84;
          }
          v70 = (unsigned int *)(v81 + 4 * v82);
          v137.__end_ = v78;
          if (v71) {
            operator delete(v71);
          }
          v71 = v83;
        }
        else
        {
          *v137.__end_ = *(_DWORD *)(v69 + 16);
          v78 = v77 + 1;
        }
        v137.__end_ = v78;
        std::vector<unsigned int>::size_type v69 = *(void *)v69;
      }
      while (v69);
      v137.__end_cap_.__value_ = v70;
      v137.__begin_ = v71;
    }
    std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
    v132 = +[NSMutableDictionary dictionaryWithCapacity:v139[1]];
    std::vector<unsigned int>::reserve(&v137, v139[1]);
    std::vector<unsigned int>::size_type v85 = v139[0];
    if (v139[0])
    {
      v86 = 0;
      unint64_t v87 = 0;
      v88 = 0;
      do
      {
        v89 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v85 + 28)];
        v180 = v89;
        v90 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v85 + 32)];
        v181 = v90;
        v91 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v85 + 36)];
        v182 = v91;
        v92 = +[NSArray arrayWithObjects:&v180 count:3];
        v93 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v85 + 16)];
        [v132 setObject:v92 forKeyedSubscript:v93];

        if ((unint64_t)v86 >= v87)
        {
          uint64_t v95 = (v86 - v88) >> 2;
          unint64_t v96 = v95 + 1;
          if ((unint64_t)(v95 + 1) >> 62) {
            abort();
          }
          if ((uint64_t)(v87 - (void)v88) >> 1 > v96) {
            unint64_t v96 = (uint64_t)(v87 - (void)v88) >> 1;
          }
          if (v87 - (unint64_t)v88 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v97 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v97 = v96;
          }
          if (v97) {
            unint64_t v97 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v97);
          }
          else {
            uint64_t v98 = 0;
          }
          v99 = (char *)(v97 + 4 * v95);
          *(_DWORD *)v99 = *(_DWORD *)(v85 + 16);
          v94 = v99 + 4;
          while (v86 != v88)
          {
            int v100 = *((_DWORD *)v86 - 1);
            v86 -= 4;
            *((_DWORD *)v99 - 1) = v100;
            v99 -= 4;
          }
          unint64_t v87 = v97 + 4 * v98;
          if (v88) {
            operator delete(v88);
          }
          v88 = v99;
        }
        else
        {
          *(_DWORD *)v86 = *(_DWORD *)(v85 + 16);
          v94 = v86 + 4;
        }
        std::vector<unsigned int>::size_type v85 = *(void *)v85;
        v86 = v94;
      }
      while (v85);
    }
    else
    {
      v94 = 0;
      v88 = 0;
    }
    std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
    v101 = +[NSData dataWithBytes:v137.__begin_ length:(char *)v137.__end_ - (char *)v137.__begin_];
    v122 = +[NSData dataWithBytes:v88 length:v94 - v88];
    id v136 = 0;
    v117 = +[NSKeyedArchiver archivedDataWithRootObject:v134 requiringSecureCoding:1 error:&v136];
    id v102 = v136;
    id v135 = v102;
    v103 = +[NSKeyedArchiver archivedDataWithRootObject:v132 requiringSecureCoding:1 error:&v135];
    id v112 = v135;

    CFStringRef v164 = @"Blit Encoder Frame Data";
    uint64_t v165 = @"Blit Encoder Info";
    v173 = (void **)v128;
    uint64_t v174 = (uint64_t)v101;
    v166 = (void (*)(uint64_t))@"Blit Split Encoder Frame Data";
    CFStringRef v167 = @"Blit Split Encoder Info";
    uint64_t v175 = (uint64_t)v130;
    v176 = v122;
    v168 = @"Blit Encoder Indices";
    v104 = [*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16) objectForKeyedSubscript:@"blitEncoderIndices"];
    v177 = v104;
    v169 = (void ***)@"Encoder Draw Call Count";
    v105 = [*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16) objectForKeyedSubscript:@"activePerEncoderDrawCallCount"];
    v178 = v105;
    v170 = (long long *)@"Source Sample Marker";
    v106 = +[NSNumber numberWithUnsignedLongLong:qword_772048];
    v179[0] = v106;
    v107 = +[NSDictionary dictionaryWithObjects:&v173 forKeys:&v164 count:7];
    v108 = +[NSMutableDictionary dictionaryWithDictionary:v107];

    if (dword_77286C && dword_772868)
    {
      CFStringRef v157 = @"Blit TraceId to Sample Index";
      uint64_t v158 = @"Blit Encoder Time Data";
      v150 = v117;
      uint64_t v151 = (uint64_t)v124;
      v159 = (void (*)(uint64_t))@"Blit Split TraceId to Sample Index";
      CFStringRef v160 = @"Blit Split Encoder Time Data";
      v152 = v103;
      v153 = v126;
      v109 = +[NSDictionary dictionaryWithObjects:&v150 forKeys:&v157 count:4];
      [v108 addEntriesFromDictionary:v109];
    }
    (*(void (**)(void))(*(void *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 32) + 16))();
    NSLog(@"Sent Blit Misc Data");

    if (v88) {
      operator delete(v88);
    }

    if (v137.__begin_) {
      operator delete(v137.__begin_);
    }

    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v138);
    v5 = (GTUSCSamplingStreamingManagerHelper *)std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v144);
  }
  GTUSCSamplingStreamingManagerHelper::StreamShaderProfilingData(v5);
  GTUSCSamplingStreamingManagerHelper::StreamEncoderDerivedCounterData(v110);
  dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_7729E8);
  (*(void (**)(void))(*(void *)(v119 + 80) + 16))();
  unint64_t v111 = atomic_load((unint64_t *)&xmmword_772AC8);
  if (v111 == v118) {
    GTUSCSamplingStreamingManagerHelper::CleanUp((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
  }
}

void __GTMTLReplayClient_streamDerivedCounterData_block_invoke(GTUSCSamplingStreamingManagerHelper *a1)
{
  uint64_t v1 = *(void *)(*((void *)a1 + 4) + 8);
  GTUSCSamplingStreamingManagerHelper::Instance(a1);
  GTUSCSamplingStreamingManagerHelper::Init((GTUSCSamplingStreamingManagerHelper *)(v1 + 48), v2);
  GTUSCSamplingStreamingManagerHelper::SetupGPURawCounters(v3);
  uint64_t v4 = +[NSMutableArray arrayWithCapacity:7];
  v5 = (void *)qword_7727F0;
  qword_7727F0 = v4;

  unsigned __int8 v6 = (void *)qword_7727F8;
  qword_7727F8 = 0;

  for (uint64_t i = 0; i != 7; ++i)
  {
    v8 = (void *)qword_7727F0;
    v9 = [&off_758A08 objectAtIndexedSubscript:i];
    unsigned __int8 v10 = +[GPURawCounterSelect selectWithName:v9 options:0];
    [v8 addObject:v10];
  }
  uint64_t v11 = +[NSMutableArray arrayWithCapacity:1];
  v12 = (void *)qword_772830;
  qword_772830 = v11;

  id v13 = (void *)qword_772830;
  v14 = +[GPURawCounterSourceTriggerSelect selectWithName:@"KickBoundary" options:0];
  [v13 addObject:v14];

  uint64_t v15 = +[NSMutableArray arrayWithCapacity:1];
  v16 = (void *)*((void *)&xmmword_772820 + 1);
  *((void *)&xmmword_772820 + 1) = v15;

  uint64_t v17 = (void *)*((void *)&xmmword_772820 + 1);
  v18 = +[GPURawCounterSourceTriggerSelect selectWithName:@"TimerNClock" options:&off_758E50];
  [v17 addObject:v18];

  GTUSCSamplingStreamingManagerHelper::SetupMTLCounterAPIBuffer(v19);
  GTUSCSamplingStreamingManagerHelper::StreamEncoderDerivedCounterData(v20);
  (*(void (**)(void))(*(void *)(v1 + 80) + 16))();
  dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_7729E8);
  unint64_t v21 = atomic_load((unint64_t *)&xmmword_772AC8);
  if (v21 == v1 + 48)
  {
    GTUSCSamplingStreamingManagerHelper::CleanUp((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
  }
}

void __GTMTLReplayClient_streamBatchFilteredData_block_invoke(GTUSCSamplingStreamingManagerHelper *a1)
{
  uint64_t v1 = *(void *)(*((void *)a1 + 4) + 8);
  GTUSCSamplingStreamingManagerHelper::Instance(a1);
  GTUSCSamplingStreamingManagerHelper::Init((GTUSCSamplingStreamingManagerHelper *)(v1 + 48), v2);
  id v3 = (GTUSCSamplingStreamingManagerHelper *)dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_7729E8);
  GTUSCSamplingStreamingManagerHelper::SetupGPURawCounters(v3);
  if (qword_7728A8 != -1) {
    GTAGXProfilingSupportHelper::Initialize((GTAGXProfilingSupportHelper *)qword_7727E8, v4);
  }
  v5 = [*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16) objectForKeyedSubscript:@"encoderBatchPriorityList"];
  unsigned __int8 v6 = [[GTBatchedCounterManager alloc] initWithEncoderBatchPriorityList:v5];
  id v7 = qword_7728B8;
  qword_7728B8 = v6;

  v8 = [*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16) objectForKeyedSubscript:@"pause"];

  if (!v8) {
    [qword_7728B8 resume];
  }
  uint64_t v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 7, v1 + 48);
  unsigned __int8 v10 = (void *)qword_7727F0;
  qword_7727F0 = v9;

  for (uint64_t i = 0; i != 7; ++i)
  {
    v12 = (void *)qword_7727F0;
    id v13 = [&off_758A08 objectAtIndexedSubscript:i];
    v14 = +[GPURawCounterSelect selectWithName:v13 options:0];
    [v12 addObject:v14];
  }
  uint64_t v15 = [*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16) objectForKeyedSubscript:@"perEncoderDrawCallCount"];
  id v16 = [v15 count];

  id v17 = [v5 count];
  if (v17 <= v16) {
    id v18 = v16;
  }
  else {
    id v18 = v17;
  }
  unint64_t v19 = 2 * (void)v18;
  uint64_t v20 = *((void *)&xmmword_7728C0 + 1);
  unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&xmmword_7728C0 + 1) - xmmword_7728C0) >> 3);
  unint64_t v22 = v19 - v21;
  if (v19 <= v21)
  {
    if (v19 >= v21)
    {
      uint64_t v25 = *((void *)&xmmword_7728C0 + 1);
      goto LABEL_29;
    }
    uint64_t v25 = xmmword_7728C0 + 24 * v19;
    if (*((void *)&xmmword_7728C0 + 1) != v25)
    {
      uint64_t v26 = *((void *)&xmmword_7728C0 + 1);
      do
      {
        int v28 = *(void **)(v26 - 24);
        v26 -= 24;
        int v27 = v28;
        if (v28)
        {
          *(void *)(v20 - 16) = v27;
          operator delete(v27);
        }
        uint64_t v20 = v26;
      }
      while (v26 != v25);
    }
LABEL_27:
    *((void *)&xmmword_7728C0 + 1) = v25;
    goto LABEL_29;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(unk_7728D0 - *((void *)&xmmword_7728C0 + 1)) >> 3) >= v22)
  {
    bzero(*((void **)&xmmword_7728C0 + 1), 24 * ((24 * v22 - 24) / 0x18) + 24);
    uint64_t v25 = v20 + 24 * ((24 * v22 - 24) / 0x18) + 24;
    goto LABEL_27;
  }
  if (v19 > 0xAAAAAAAAAAAAAAALL) {
    abort();
  }
  v41 = (long long *)&unk_7728D0;
  if (0x5555555555555556 * ((uint64_t)(unk_7728D0 - xmmword_7728C0) >> 3) > v19) {
    unint64_t v19 = 0x5555555555555556 * ((uint64_t)(unk_7728D0 - xmmword_7728C0) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(unk_7728D0 - xmmword_7728C0) >> 3) >= 0x555555555555555) {
    unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v23 = v19;
  }
  std::vector<unsigned int>::size_type v37 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v23);
  uint64_t v38 = (uint64_t)&v37[24 * v21];
  int v40 = &v37[24 * v24];
  bzero((void *)v38, 24 * ((24 * v22 - 24) / 0x18) + 24);
  uint64_t v39 = (void (*)(uint64_t))(v38 + 24 * ((24 * v22 - 24) / 0x18) + 24);
  std::vector<std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>>::__swap_out_circular_buffer(&xmmword_7728C0, &v37);
  std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer((uint64_t)&v37);
  uint64_t v25 = *((void *)&xmmword_7728C0 + 1);
LABEL_29:
  std::vector<std::pair<unsigned int,unsigned int>>::reserve(&qword_7728D8, 0xAAAAAAAAAAAAAAABLL * ((v25 - (uint64_t)xmmword_7728C0) >> 3));
  std::vector<unsigned int>::size_type v37 = (char *)_NSConcreteStackBlock;
  uint64_t v38 = 3221225472;
  uint64_t v39 = ___ZN35GTUSCSamplingStreamingManagerHelper20InitBatchIdFilteringEP29GTUSCSamplingStreamingManager_block_invoke;
  int v40 = (char *)&__block_descriptor_40_e5_v8__0l;
  v41 = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
  v29 = +[NSBlockOperation blockOperationWithBlock:&v37];
  [v29 setQueuePriority:-8];
  [**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) addOperation:v29];
  [v29 waitUntilFinished];
  uint64_t v30 = +[NSMutableArray arrayWithCapacity:1];
  v31 = (void *)qword_772830;
  qword_772830 = v30;

  v32 = (void *)qword_772830;
  v33 = +[GPURawCounterSourceTriggerSelect selectWithName:@"KickBoundary" options:0];
  [v32 addObject:v33];

  GTUSCSamplingStreamingManagerHelper::StreamBatchIdFilteredCounters(v34);
  (*(void (**)(void))(*(void *)(v1 + 80) + 16))();
  unint64_t v35 = atomic_load((unint64_t *)&xmmword_772AC8);
  if (v35 == v36)
  {
    GTUSCSamplingStreamingManagerHelper::CleanUp((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
  }
}

void __GTMTLReplayClient_collectGPUShaderTimelineData_block_invoke(GTUSCSamplingStreamingManagerHelper *a1)
{
  uint64_t v1 = *(void *)(*((void *)a1 + 4) + 8);
  GTUSCSamplingStreamingManagerHelper::Instance(a1);
  v2 = [*(id *)(v1 + 64) objectForKeyedSubscript:@"useOverlap"];
  id v9 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }
  byte_7728B2 = v4;
  GTUSCSamplingStreamingManagerHelper::InitQueryShaderInfo((GTUSCSamplingStreamingManagerHelper *)(v1 + 48), v3);
  HIDWORD(qword_7728A8) = 1;
  GTUSCSamplingStreamingManagerHelper::SetupMTLCounterAPIBuffer(v5);
  GTUSCSamplingStreamingManagerHelper::StreamEncoderDerivedCounterData(v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = ___ZN35GTUSCSamplingStreamingManagerHelper17StreamGPUTimelineEv_block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0l;
  v10[4] = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
  id v7 = +[NSBlockOperation blockOperationWithBlock:v10];
  GTUSCSamplingStreamingManagerHelper::StreamShaderProfilingData((GTUSCSamplingStreamingManagerHelper *)[**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) addOperation:v7]);

  (*(void (**)(void))(*(void *)(v1 + 80) + 16))();
  dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_7729E8);
  unint64_t v8 = atomic_load((unint64_t *)&xmmword_772AC8);
  if (v8 == v1 + 48) {
    GTUSCSamplingStreamingManagerHelper::CleanUp((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
  }
}

void __GTMTLReplayClient_collectAPSData_block_invoke(GTUSCSamplingStreamingManagerHelper *a1)
{
  uint64_t v1 = *(void *)(*((void *)a1 + 4) + 8);
  GTUSCSamplingStreamingManagerHelper::Instance(a1);
  uint64_t v148 = v1;
  id v142 = [*(id *)(v1 + 64) objectForKeyedSubscript:@"apsProfilingConfig"];
  if (v142)
  {
    id v2 = v142;
    id v3 = [v2 objectForKeyedSubscript:@"fractionOfCores"];
    unsigned __int8 v4 = [v2 objectForKeyedSubscript:@"thresholdInSeconds"];
    v5 = v4;
    if (v4)
    {
      [v4 doubleValue];
      *((void *)&xmmword_772C80 + 1) = v6;
    }
    id v7 = [v2 objectForKeyedSubscript:@"drawCountThreshold"];
    unint64_t v8 = v7;
    if (v7) {
      qword_772C90 = (uint64_t)[v7 unsignedLongLongValue];
    }
    id v9 = [v2 objectForKeyedSubscript:@"usingMinimumTracingMode"];
    unsigned __int8 v10 = v9;
    if (v9)
    {
      unsigned int v11 = [v9 BOOLValue];
      uint64_t v12 = 2;
      if (!v11) {
        uint64_t v12 = 0;
      }
      qword_772C98 = qword_772C98 & 0xFFFFFFFFFFFFFFFDLL | v12;
      id v13 = +[NSUserDefaults standardUserDefaults];
      unsigned int v14 = [v13 BOOLForKey:@"GPUDebugger.ShaderProfiler.ForceMinTracingMode"];

      if (v14) {
        qword_772C98 |= 2uLL;
      }
    }
    uint64_t v15 = [v2 objectForKeyedSubscript:@"usedCoreMasks"];
    id v16 = v15;
    if (v15 && [v15 count])
    {
      std::vector<BOOL>::resize((uint64_t)&qword_772CA0, (unint64_t)[v16 count], 0);
      long long v151 = 0u;
      long long v152 = 0u;
      long long v149 = 0u;
      long long v150 = 0u;
      id v17 = v16;
      id v18 = [v17 countByEnumeratingWithState:&v149 objects:&v153 count:16];
      if (v18)
      {
        CFStringRef v140 = v10;
        long long v144 = v5;
        v146 = v3;
        uint64_t v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = *(void *)v150;
        do
        {
          for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v150 != v21) {
              objc_enumerationMutation(v17);
            }
            unsigned int v23 = [*(id *)(*((void *)&v149 + 1) + 8 * i) BOOLValue];
            unint64_t v24 = ((unint64_t)i + v19) >> 6;
            uint64_t v25 = 1 << (v19 + i);
            if (v23) {
              uint64_t v26 = *(void *)(qword_772CA0 + 8 * v24) | v25;
            }
            else {
              uint64_t v26 = *(void *)(qword_772CA0 + 8 * v24) & ~v25;
            }
            *(void *)(qword_772CA0 + 8 * v24) = v26;
            v20 += v23;
          }
          id v18 = [v17 countByEnumeratingWithState:&v149 objects:&v153 count:16];
          v19 += (uint64_t)i;
        }
        while (v18);
        double v27 = (double)v20;
        v5 = v144;
        id v3 = v146;
        unsigned __int8 v10 = v140;
      }
      else
      {
        double v27 = 0.0;
      }

      uint64_t v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v27 / (double)(unint64_t)[v17 count]);

      id v3 = (GTUSCSamplingStreamingManager *)v28;
    }
    if (v3)
    {
      [(GTUSCSamplingStreamingManager *)v3 doubleValue];
      *(void *)&xmmword_772C80 = v29;
    }
    uint64_t v30 = [v2 objectForKeyedSubscript:@"useOverlap"];
    v31 = v30;
    if (v30) {
      unsigned int v32 = [v30 BOOLValue];
    }
    else {
      unsigned int v32 = 1;
    }
    qword_772C98 = qword_772C98 & 0xFFFFFFFFFFFFFFFELL | v32;
  }
  v139 = [*(id *)(v148 + 64) objectForKeyedSubscript:@"useOverlap"];
  if (v139)
  {
    unsigned int v33 = [v139 BOOLValue];
    qword_772C98 = qword_772C98 & 0xFFFFFFFFFFFFFFFELL | v33;
    byte_7728B2 = v33;
  }
  LODWORD(xmmword_7728B4) = 0;
  *(void *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance = v148 + 48;
  v147 = (GTUSCSamplingStreamingManagerHelper *)(v148 + 48);
  v34 = [*(id *)(*(void *)(v148 + 48) + 8) defaultDevice];
  unint64_t v35 = DEVICEOBJECT(v34);
  uint64_t v36 = GTProfilerConfigurationVariables((io_registry_entry_t)[v35 acceleratorPort]);
  std::vector<unsigned int>::size_type v37 = (void *)qword_7727E8;
  qword_7727E8 = v36;

  id v38 = (id)qword_7727E8;
  uint64_t v39 = v38;
  if (!qword_772CA8)
  {
    id v141 = v38;
    int v40 = [v38 objectForKeyedSubscript:@"num_cores"];
    unsigned int v145 = [v40 unsignedIntValue];

    if (*(double *)&xmmword_772C80 >= 1.0)
    {
      std::vector<BOOL>::resize((uint64_t)&qword_772CA0, v145, 1);
    }
    else
    {
      v41 = [v39 objectForKeyedSubscript:@"core_mask_list" *(double *)&xmmword_772C80];
      unsigned int v42 = [v41 count];
      if (v42 <= 1) {
        int v43 = 1;
      }
      else {
        int v43 = v42;
      }
      unsigned int v143 = v43;
      std::vector<BOOL>::resize((uint64_t)&qword_772CA0, v145, 0);
      double v44 = *(double *)&xmmword_772C80;
      id v45 = [v41 count];
      if (v45)
      {
        if ((unint64_t)v45 > 0xAAAAAAAAAAAAAAALL) {
          abort();
        }
        v46 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>((unint64_t)v45);
        v48 = &v46[24 * v47];
      }
      else
      {
        v46 = 0;
        v48 = 0;
      }
      unint64_t v49 = 0;
      double v50 = v44 * (double)v145;
      unint64_t v138 = v145 / v143;
      int v137 = (int)(ceil(v50) / (double)v143);
      uint64_t v136 = vcvtpd_s64_f64(v50) - v143 * v137;
      unint64_t v51 = (unint64_t)v46;
      while (v49 < (unint64_t)objc_msgSend(v41, "count", v136))
      {
        v52 = [v41 objectAtIndexedSubscript:v49];
        id v53 = [v52 unsignedLongLongValue];

        uint8x8_t v54 = (uint8x8_t)vcnt_s8((int8x8_t)v53);
        v54.i16[0] = vaddlv_u8(v54);
        int v55 = -v54.i32[0];
        if (v51 >= (unint64_t)v48)
        {
          unint64_t v56 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v51 - (void)v46) >> 3) + 1;
          if (v56 > 0xAAAAAAAAAAAAAAALL) {
            abort();
          }
          if (0x5555555555555556 * ((v48 - v46) >> 3) > v56) {
            unint64_t v56 = 0x5555555555555556 * ((v48 - v46) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((v48 - v46) >> 3) >= 0x555555555555555) {
            unint64_t v57 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v57 = v56;
          }
          if (v57) {
            unint64_t v57 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v57);
          }
          else {
            uint64_t v58 = 0;
          }
          unint64_t v59 = v57 + 8 * ((uint64_t)(v51 - (void)v46) >> 3);
          *(_DWORD *)unint64_t v59 = v55;
          *(void *)(v59 + 8) = v49;
          *(void *)(v59 + 16) = v53;
          if ((char *)v51 == v46)
          {
            id v61 = (char *)(v57 + 8 * ((uint64_t)(v51 - (void)v46) >> 3));
            uint64_t v39 = v141;
          }
          else
          {
            unint64_t v60 = v57 + 8 * ((uint64_t)(v51 - (void)v46) >> 3);
            uint64_t v39 = v141;
            do
            {
              id v61 = (char *)(v60 - 24);
              long long v62 = *(_OWORD *)(v51 - 24);
              *(void *)(v60 - 8) = *(void *)(v51 - 8);
              *(_OWORD *)(v60 - 24) = v62;
              v51 -= 24;
              v60 -= 24;
            }
            while ((char *)v51 != v46);
          }
          v48 = (char *)(v57 + 24 * v58);
          unint64_t v51 = v59 + 24;
          if (v46) {
            operator delete(v46);
          }
          v46 = v61;
        }
        else
        {
          *(_DWORD *)unint64_t v51 = v55;
          *(void *)(v51 + 8) = v49;
          *(void *)(v51 + 16) = v53;
          v51 += 24;
        }
        ++v49;
      }
      unint64_t v63 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v51 - (void)v46) >> 3));
      if ((char *)v51 == v46) {
        uint64_t v64 = 0;
      }
      else {
        uint64_t v64 = v63;
      }
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<int,unsigned long,unsigned long long> *,false>((unint64_t)v46, v51, v64, 1);
      if ((char *)v51 != v46)
      {
        unint64_t v65 = 0;
        uint64_t v66 = v145 / v143;
        if (v138 <= 1) {
          uint64_t v66 = 1;
        }
        v67 = v46;
        do
        {
          if (v65 >= (int)v136) {
            int v68 = 0;
          }
          else {
            int v68 = -1;
          }
          if (v143 <= v145)
          {
            uint64_t v69 = 0;
            unint64_t v70 = *((void *)v67 + 1) * v138;
            uint64_t v71 = qword_772CA0;
            int v72 = v137;
            do
            {
              if (v72 <= v68) {
                break;
              }
              uint64_t v73 = *((void *)v67 + 2);
              if ((v73 & (1 << v69)) != 0)
              {
                *((void *)v67 + 2) = v73 & ~(1 << v69);
                --v72;
                *(void *)(v71 + (((v70 + v69) >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << (v70
                                                                                        + v69);
              }
              ++v69;
            }
            while (v66 != v69);
          }
          ++v65;
          v67 += 24;
        }
        while (v67 != (char *)v51);
      }
      if (v46) {
        operator delete(v46);
      }
    }
  }

  uint64_t v153 = 0;
  v154 = &v153;
  uint64_t v155 = 0x3032000000;
  v156 = __Block_byref_object_copy_;
  CFStringRef v157 = __Block_byref_object_dispose_;
  id v158 = (id)objc_opt_new();
  *(void *)&long long v149 = _NSConcreteStackBlock;
  *((void *)&v149 + 1) = 3221225472;
  *(void *)&long long v150 = ___ZN35GTUSCSamplingStreamingManagerHelper18CalculateFrameTimeEv_block_invoke;
  *((void *)&v150 + 1) = &unk_747578;
  *(void *)&long long v151 = &v153;
  *((void *)&v151 + 1) = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
  v74 = +[NSBlockOperation blockOperationWithBlock:&v149];
  [**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) addOperation:v74];
  [v74 waitUntilFinished];
  if ([(id)v154[5] count])
  {
    v75 = [(id)v154[5] objectAtIndexedSubscript:0];
    v76 = [v75 objectAtIndexedSubscript:1];
    [v76 doubleValue];
    double v78 = v77;
  }
  else
  {
    double v78 = 0.0;
  }
  if ([(id)v154[5] count])
  {
    uint64_t v79 = [(id)v154[5] objectAtIndexedSubscript:0];
    unint64_t v80 = [v79 objectAtIndexedSubscript:0];
    [v80 doubleValue];
    double v82 = v81;

    double v83 = v78 - v82;
  }
  else
  {
    double v83 = 0.0;
  }
  for (unint64_t j = 1; j < (unint64_t)[(id)v154[5] count]; ++j)
  {
    std::vector<unsigned int>::size_type v85 = [(id)v154[5] objectAtIndexedSubscript:j];
    v86 = [v85 objectAtIndexedSubscript:1];
    [v86 doubleValue];
    BOOL v88 = v78 < v87;

    if (v88)
    {
      v89 = [(id)v154[5] objectAtIndexedSubscript:j];
      v90 = [v89 objectAtIndexedSubscript:1];
      [v90 doubleValue];
      double v92 = v91;
      v93 = [(id)v154[5] objectAtIndexedSubscript:j];
      v94 = [v93 objectAtIndexedSubscript:0];
      [v94 doubleValue];
      if (v78 >= v95) {
        double v96 = v78;
      }
      else {
        double v96 = v95;
      }

      double v83 = v83 + v92 - v96;
    }
    unint64_t v97 = [(id)v154[5] objectAtIndexedSubscript:j];
    uint64_t v98 = [v97 objectAtIndexedSubscript:1];
    [v98 doubleValue];
    if (v78 < v99) {
      double v78 = v99;
    }
  }
  qword_772C78 = *(void *)&v83;

  _Block_object_dispose(&v153, 8);
  char v101 = qword_772C98;
  if ((qword_772C98 & 2) == 0)
  {
    id v102 = [*(id *)(v148 + 64) objectForKeyedSubscript:@"totalDrawCallCount"];
    id v103 = [v102 unsignedIntegerValue];

    double v104 = *(double *)&xmmword_772C80 + *(double *)&xmmword_772C80;
    if (*(double *)&xmmword_772C80 + *(double *)&xmmword_772C80 > 1.0) {
      double v104 = 1.0;
    }
    double v105 = v83 * v104;
    BOOL v106 = (unint64_t)v103 <= qword_772C90 && v105 <= 0.5;
    uint64_t v107 = 2;
    if (v106) {
      uint64_t v107 = 0;
    }
    qword_772C98 = v107 | qword_772C98 & 0xFFFFFFFFFFFFFFFDLL;
    *((void *)&xmmword_772C80 + 1) = 0x3FE0000000000000;
    v108 = +[NSUserDefaults standardUserDefaults];
    unsigned int v109 = [v108 BOOLForKey:@"GPUDebugger.ShaderProfiler.DisableMinTracingMode"];

    if (v109) {
      qword_772C98 &= ~2uLL;
    }
    v110 = +[NSUserDefaults standardUserDefaults];
    unsigned int v111 = [v110 BOOLForKey:@"GPUDebugger.ShaderProfiler.ForceMinTracingMode"];

    char v101 = qword_772C98;
    if (v111)
    {
      char v101 = qword_772C98 | 2;
      qword_772C98 |= 2uLL;
    }
  }
  if ((v101 & 2) != 0)
  {
    GTUSCSamplingStreamingManagerHelper::InitAPSStreaming(v147, v100);
  }
  else
  {
    for (unsigned int k = 0; k != 5; ++k)
    {
      GTUSCSamplingStreamingManagerHelper::InitAPSStreaming(v147, v100);
      uint64_t v114 = GTUSCSamplingStreamingManagerHelper::StreamAPS(v113);
      if (v114) {
        break;
      }
      uint64_t v114 = (*(uint64_t (**)(void))(*(void *)(v148 + 80) + 16))();
      if (k <= 3) {
        uint64_t v114 = dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_7729E8);
      }
    }
  }
  LODWORD(xmmword_7728B4) = 1;
  int v115 = 5;
  do
  {
    GTUSCSamplingStreamingManagerHelper::CleanupForAPSStreaming((GTUSCSamplingStreamingManagerHelper *)v114);
    id v116 = GTUSCSamplingStreamingManagerHelper::AllocUSCSamplingAddressBuffer((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
    qword_7727B8 = (uint64_t)[(id)qword_7727D8 mutableBytes];
    id v117 = [[ProgramAddressTableCollector alloc] initForHarvestingBinaries];
    uint64_t v118 = (void *)xmmword_7727C0;
    *(void *)&xmmword_7727C0 = v117;

    if (qword_7728A8 != -1)
    {
      GTUSCSamplingStreamingManagerHelper::SetupBuffersForAPSSource(v119);
      if ((qword_772C98 & 2) != 0)
      {
        id v122 = [[GTGPUAPSConfig alloc] initForMinimumInfoCounters];
      }
      else
      {
        id v120 = [[GTGPUAPSConfig alloc] initForCounters];
        v121 = [*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16) objectForKeyedSubscript:@"CounterConfig"];
        if (v121) {
          [v120 readConfig:v121];
        }

        id v122 = v120;
      }
      uint64_t v123 = [v122 grcOptions];
      v124 = (void *)qword_772838;
      qword_772838 = v123;

      uint64_t v125 = +[NSMutableArray arrayWithCapacity:1];
      v126 = (void *)xmmword_772840;
      *(void *)&xmmword_772840 = v125;

      v127 = (void *)xmmword_772840;
      v128 = [v122 grcTrigger];
      id v129 = +[GPURawCounterSourceTriggerSelect selectWithName:@"KickAndStateTracing" options:v128];
      [v127 addObject:v129];

      v130 = (GTUSCSamplingStreamingManagerHelper *)(*(uint64_t (**)(void))(*(void *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance
                                                                                     + 32)
                                                                         + 16))();
      GTUSCSamplingStreamingManagerHelper::InitRDELimiterCounters(v130);
    }
    if (GTUSCSamplingStreamingManagerHelper::StreamAPS(v119)) {
      break;
    }
    uint64_t v114 = (*(uint64_t (**)(void))(*(void *)(v148 + 80) + 16))();
    --v115;
  }
  while (v115);
  GTUSCSamplingStreamingManager::InitDerivedCountersInfo((id *)v147);
  GTUSCSamplingStreamingManagerHelper::StreamEncoderDerivedCounterData(v131);
  LODWORD(xmmword_7728B4) = 2;
  int v133 = 5;
  do
  {
    GTUSCSamplingStreamingManagerHelper::InitAPSStreaming(v147, v132);
    if (GTUSCSamplingStreamingManagerHelper::StreamAPS(v134)) {
      break;
    }
    (*(void (**)(void))(*(void *)(v148 + 80) + 16))();
    --v133;
  }
  while (v133);
  (*(void (**)(void))(*(void *)(v148 + 80) + 16))();
  dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_7729E8);
  unint64_t v135 = atomic_load((unint64_t *)&xmmword_772AC8);
  if ((GTUSCSamplingStreamingManagerHelper *)v135 == v147) {
    GTUSCSamplingStreamingManagerHelper::CleanUp((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
  }
}

void __GTMTLReplayClient_harvestTexture_block_invoke(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) contents] + *(void *)(a1 + 40);
  id v3 = malloc_type_malloc(*(void *)(a1 + 136), 0xDC943483uLL);
  unsigned __int8 v4 = v3;
  if ((int)*(void *)(a1 + 80) >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)(a1 + 80);
    uint64_t v7 = *(void *)(a1 + 72);
    unint64_t v8 = v2;
    do
    {
      if ((int)v7 >= 1)
      {
        uint64_t v9 = 0;
        do
        {
          uint64_t v10 = *(void *)&vorr_s8((int8x8_t)vshl_n_s32((int32x2_t)__PAIR64__(v9, v5), 8uLL), vand_s8((int8x8_t)__PAIR64__(v9, v5), (int8x8_t)0xFFFF0000FFFFLL)) & 0xFF00FF00FF00FFLL;
          unint64_t v11 = *(void *)&vorr_s8((int8x8_t)vshl_n_s32((int32x2_t)v10, 4uLL), (int8x8_t)v10) & 0xFF0FFF0FFF0FFF0FLL;
          int8x8_t v12 = vand_s8(vorr_s8((int8x8_t)vshl_n_s32((int32x2_t)v11, 2uLL), (int8x8_t)v11), (int8x8_t)0x3333333333333333);
          int8x8_t v13 = (int8x8_t)vshl_u32((uint32x2_t)v12, (uint32x2_t)0x200000001);
          v12.i32[1] *= 2;
          int32x2_t v14 = (int32x2_t)vand_s8(vorr_s8(v13, v12), (int8x8_t)0xAAAAAAAA55555555);
          *((void *)v3 + vorr_s8((int8x8_t)v14, (int8x8_t)vdup_lane_s32(v14, 1)).i32[0]) = *(void *)&v8[8 * v9++];
        }
        while (v7 != v9);
      }
      ++v5;
      v8 += 8 * (int)v7;
    }
    while (v5 != v6);
  }
  memcpy(v2, v3, *(void *)(a1 + 136));

  free(v4);
}

void __GTMTLReplayClient_createOldTransport_block_invoke(uint64_t a1, void *a2)
{
}

intptr_t __GTMTLReplayClient_createOldTransport_block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __GTMTLReplayClient_createNewTransport_block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "_remoteDeviceRelayPort");
    id v5 = [objc_alloc((Class)GTRelayedXPCConnection) initWithConnection:WeakRetained uint64:xpc_dictionary_get_uint64(xdict, "_remoteDeviceRelayPid")];
    [WeakRetained dispatchMessage:xdict replyConnection:v5];
  }
}

void __GTMTLReplayClient_createNewTransport_block_invoke_2(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  exit(0);
}

void __GTMTLReplayClient_queryShaderInfo_block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) setPerfState:];
  }
  id v2 = [*(id *)(*(void *)(a1 + 72) + 8) defaultCommandQueue];
  [v2 setStatEnabled:1];
  if (g_runningInCI)
  {
    id v3 = +[NSString stringWithFormat:@"QueryShaderInfo - subdividing counter list"];
    unsigned __int8 v4 = [v3 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

    id v5 = __stdoutp;
    id v6 = v4;
    fprintf(v5, "#CI-INFO# %s\n", (const char *)[v6 UTF8String]);
  }
  uint64_t v7 = [v2 subdivideCounterList:*(void *)(a1 + 48)];
  validateSubdividedCounterLists(*(void **)(a1 + 48), v7);
  [v2 setStatEnabled:0];
  id v8 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v12 = *(void *)(a1 + 72);
  unint64_t v11 = *(id **)(a1 + 80);
  double v27 = *(void **)(a1 + 56);
  uint64_t v28 = v2;
  int8x8_t v13 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = v13;
  id v16 = *(void **)(v12 + 8);
  id v17 = v7;
  [v16 defaultDevice];

  id v18 = objc_alloc_init((Class)NSMutableData);
  uint64_t v26 = CollectFrameCounters(v12, v11, v14, v17, 41493, v18);
  id v19 = objc_alloc_init((Class)NSMutableData);
  unsigned int v20 = CollectFrameCounters(v12, v11, v14, v17, 63, v19);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __ProfileFrame_block_invoke;
  v29[3] = &unk_746838;
  id v30 = v15;
  id v31 = v18;
  id v32 = v19;
  id v33 = v14;
  id v21 = v15;
  id v22 = v18;
  id v23 = v19;
  id v24 = v14;
  uint64_t v25 = +[NSBlockOperation blockOperationWithBlock:v29];
  [v25 addDependency:v26];
  [v25 addDependency:v20];
  [v11[1] addOperation:v25];

  [v27 addDependency:v25];
  [*(id *)(*(void *)(a1 + 80) + 8) addOperation:*(void *)(a1 + 56)];
}

void __GTMTLReplayClient_queryShaderInfo_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 40);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v67 = v1[1];
  id v2 = *v1;
  uint64_t v64 = *((void *)*v1 + 2);
  uint64_t v3 = *((void *)*v1 + 14);
  uint64_t v4 = *(int *)(v3 + 12);
  if ((int)v4 < 1)
  {
    int v61 = 0;
  }
  else
  {
    int v61 = 0;
    uint64_t v5 = *(void *)(v3 + 24);
    do
    {
      if (GetFuncEnumConstructorType(*(_DWORD *)(v5 + 28)) == 25)
      {
        unint64_t v6 = v2[12];
        BOOL v8 = v6 > *(void *)v5;
        unint64_t v7 = v2[13] + v6;
        BOOL v8 = !v8 && v7 > *(void *)v5;
        if (v8) {
          int v9 = v61 + 1;
        }
        else {
          int v9 = v61;
        }
        int v61 = v9;
      }
      v5 += 32;
      --v4;
    }
    while (v4);
  }
  uint64_t v66 = (double *)malloc_type_calloc(32 * v61, 0x10uLL, 0x1000040451B5BE8uLL);
  unint64_t v65 = objc_opt_new();
  GTMTLReplayController_prePlayForProfiling((uint64_t)v1);
  uint64_t v10 = *v1;
  unint64_t v11 = (unsigned int *)(v1 + 2810);
  for (i = *((unsigned int *)v1 + 5620); v10[13] + v10[12] > i; unsigned int *v11 = i)
  {
    uint64_t v14 = *(void *)(v10[15] + 24) + ((unint64_t)*v11 << 6);
    if (GetFuncEnumConstructorType(*(_DWORD *)(v14 + 8)) == 25)
    {
      int v15 = GTMTLReplayController_restoreCommandBuffer((uint64_t)v1, v14);
      GTMTLReplayController_updateCommandEncoder((uint64_t)v1, v14);
      GTMTLReplayController_defaultDispatchFunction((uint64_t)v1, v14);
      if (v15)
      {
        id v16 = +[NSNumber numberWithUnsignedInt:*v11];
        [v65 addObject:v16];
      }
    }
    else
    {
      GTMTLReplayController_updateCommandEncoder((uint64_t)v1, v14);
      GTMTLReplayController_defaultDispatchFunction((uint64_t)v1, v14);
    }
    unint64_t i = *v11 + 1;
  }
  id v17 = [v67 defaultDevice];
  id v69 = [v17 newEvent];

  uint64_t v60 = mach_absolute_time();
  int v68 = 0;
  LODWORD(v18) = 0;
  int v19 = 1;
  do
  {
    int v20 = v19;
    unsigned int v63 = v18;
    [g_activityLog enterPerformFrameTimingForIndex:];
    id v21 = g_signpostLog;
    if (os_signpost_enabled((os_log_t)g_signpostLog))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v63;
      _os_signpost_emit_with_name_impl(&def_1C1270, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Replayer-1-serial", "performFrameTiming %d", buf, 8u);
    }
    GTMTLReplayController_prePlayForProfiling((uint64_t)v1);
    int v62 = v20;
    if (v2[13] + v2[12] > (unint64_t)*v11)
    {
      do
      {
        uint64_t v23 = *(void *)(v2[15] + 24);
        uint64_t v24 = *v11;
        int FuncEnumConstructorType = GetFuncEnumConstructorType(*(_DWORD *)(v23 + (v24 << 6) + 8));
        if (FuncEnumConstructorType == 25)
        {
          uint64_t v26 = +[NSNumber numberWithUnsignedInt:v24];
          unsigned int v27 = [v65 containsObject:v26];

          if (v27)
          {
            uint64_t v28 = [v67 defaultCommandQueue];
            uint64_t v29 = [v28 commandBuffer];

            ++performFrameTimingDesktop_signalCounter;
            [v29 encodeSignalEvent:v69];
            [v29 encodeWaitForEvent:v69 value:performFrameTimingDesktop_signalCounter];
            [v29 commit];
          }
          int v30 = GTMTLReplayController_restoreCommandBuffer((uint64_t)v1, v23 + (v24 << 6));
        }
        else
        {
          int v30 = 0;
        }
        GTMTLReplayController_updateCommandEncoder((uint64_t)v1, v23 + (v24 << 6));
        GTMTLReplayController_defaultDispatchFunction((uint64_t)v1, v23 + (v24 << 6));
        if (FuncEnumConstructorType == 25)
        {
          id v31 = [v67 commandBufferForKey:*((void *)GTTraceFunc_argumentBytesWithMap((void *)(v23 + (v24 << 6)), *(unsigned __int8 *)(v23 + (v24 << 6) + 13), *((void *)*v1 + 2))+ 1)];
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472;
          v70[2] = __performFrameTimingDesktop_block_invoke;
          v70[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
          v70[4] = &v66[2 * v68];
          [v31 addCompletedHandler:v70];

          ++v68;
        }
        if (v30)
        {
          id v32 = [v67 commandBufferForKey:*(void *)GTTraceFunc_argumentBytesWithMap((void *)(v23 + (v24 << 6)), *(unsigned __int8 *)(v23 + (v24 << 6) + 13), v64)+ 1];
          ++performFrameTimingDesktop_signalCounter;
          [v32 encodeSignalEvent:v69];
          [v32 encodeWaitForEvent:v69 value:performFrameTimingDesktop_signalCounter];
        }
        unint64_t v33 = *v11 + 1;
        unsigned int *v11 = v33;
      }
      while (v2[13] + v2[12] > v33);
    }
    uint64_t v34 = mach_absolute_time();
    unint64_t v35 = g_signpostLog;
    if (os_signpost_enabled((os_log_t)g_signpostLog))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v63;
      _os_signpost_emit_with_name_impl(&def_1C1270, v35, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Replayer-1-serial", "performFrameTiming %d", buf, 8u);
    }
    BOOL v36 = (v34 - v60) * info.numer / info.denom < 0x3B9ACA00;
    [(id)g_activityLog leaveActivity];
    BOOL v37 = v63 < 0x1F && v36;
    int v19 = v62 + 1;
    uint64_t v18 = v63 + 1;
  }
  while (v37);
  id v38 = [v1[1] defaultCommandQueue:v18];
  [v38 finish];

  uint64_t v39 = +[NSMutableArray arrayWithCapacity:v63 + 1];
  uint64_t v40 = 0;
  v41 = v66 + 1;
  do
  {
    qsort(&v66[2 * v40 * v61], v61, 0x10uLL, (int (__cdecl *)(const void *, const void *))CommandBufferTimeInfo_compare);
    if (v61 <= 0)
    {
      double v45 = 0.0;
    }
    else
    {
      double v42 = 0.0;
      int v43 = v41;
      uint64_t v44 = v61;
      double v45 = 0.0;
      do
      {
        if (v42 < *(v43 - 1)) {
          double v42 = *(v43 - 1);
        }
        double v46 = *v43;
        v43 += 2;
        double v47 = v46;
        double v48 = v46 - v42;
        BOOL v49 = v46 <= v42;
        if (v46 <= v42) {
          double v48 = -0.0;
        }
        double v45 = v45 + v48;
        if (!v49) {
          double v42 = v47;
        }
        --v44;
      }
      while (v44);
    }
    double v50 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)(v45 * 1000000000.0)];
    [v39 addObject:v50];

    ++v40;
    v41 += 2 * v61;
  }
  while (v40 != v62);
  free(v66);
  [v39 sortUsingComparator:&__block_literal_global_443];
  if ([v39 count])
  {
    objc_msgSend(v39, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v39, "count") >> 1);
    unint64_t v51 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v51 = &off_759DB0;
  }
  if (g_runningInCI)
  {
    v52 = +[NSString stringWithFormat:@"GPU Time = %@", v51];
    id v53 = [v52 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

    uint8x8_t v54 = __stdoutp;
    id v55 = v53;
    fprintf(v54, "#CI-INFO# %s\n", (const char *)[v55 UTF8String]);
  }
  v72[0] = @"frametime";
  v72[1] = @"frameGPUTime";
  *(void *)buf = v39;
  v74 = v51;
  uint64_t v56 = +[NSDictionary dictionaryWithObjects:buf forKeys:v72 count:2];

  uint64_t v57 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v58 = *(void **)(v57 + 40);
  *(void *)(v57 + 40) = v56;
}

id *__GTMTLReplayClient_queryShaderInfo_block_invoke_3(id *result)
{
  if (result[4])
  {
    uint64_t v1 = result;
    result = (id *)[result[5] getStateOccupancy];
    *(void *)(*((void *)v1[6] + 1) + 24) = v2;
  }
  return result;
}

void __GTMTLReplayClient_queryShaderInfo_block_invoke_4(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 40) + 8) defaultDevice];
  uint64_t v2 = DYMTLReplayFrameProfiler_loadAnalysis(v5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end