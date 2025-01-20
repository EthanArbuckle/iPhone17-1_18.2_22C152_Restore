@interface CSUCaptioningProcUtils
- (BeamSearchOptions)beamSearchOptions;
- (CSUCaptionPostProcessingHandler)postProcessingHandler;
- (CSUCaptionRuntimeParameters)runTimeParams;
- (CSUCaptioningProcUtils)initWithDecoderConfiguration:(id)a3 beamWidth:(int)a4 beamScorerType:(unint64_t)a5 error:(id *)a6;
- (EspressoTensor)encodedFeaturesBuffer;
- (id).cxx_construct;
- (int)genderOptionForBeamSearch;
- (shared_ptr<csu::BeamSearch>)beamSearch;
- (shared_ptr<csu::CustomVocabulary>)vocabulary;
- (void)setBeamSearch:(shared_ptr<csu::BeamSearch>)a3;
- (void)setBeamSearchOptions:(BeamSearchOptions *)a3;
- (void)setEncodedFeaturesBuffer:(EspressoTensor *)a3;
- (void)setGenderOptionForBeamSearch:(int)a3;
- (void)setPostProcessingHandler:(id)a3;
- (void)setRunTimeParams:(id)a3;
- (void)setVocabulary:(shared_ptr<csu::CustomVocabulary>)a3;
@end

@implementation CSUCaptioningProcUtils

- (CSUCaptioningProcUtils)initWithDecoderConfiguration:(id)a3 beamWidth:(int)a4 beamScorerType:(unint64_t)a5 error:(id *)a6
{
  uint64_t v186 = *MEMORY[0x263EF8340];
  id v157 = a3;
  v182.receiver = self;
  v182.super_class = (Class)CSUCaptioningProcUtils;
  v158 = [(CSUCaptioningProcUtils *)&v182 init];
  if (v158)
  {
    int v151 = a4;
    v12 = (void *)MEMORY[0x263EFF8F8];
    v13 = objc_msgSend_vocabularyModelPath(v157, v8, v9, v10, v11);
    v156 = objc_msgSend_dataWithContentsOfFile_(v12, v14, (uint64_t)v13, v15, v16);

    if (!v156)
    {
      if (a6)
      {
        objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v17, @"No vocabulary data could be read!", 0, v18);
        v48 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v48 = 0;
      }
      goto LABEL_72;
    }
    id v181 = 0;
    v19 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v17, (uint64_t)v156, 0, (uint64_t)&v181);
    id v20 = v181;
    v152 = v19;
    if (!v19)
    {
      if (a6)
      {
        id v154 = v20;
        v48 = 0;
        *a6 = v154;
      }
      else
      {
        id v154 = v20;
        v48 = 0;
      }
LABEL_71:

LABEL_72:
      goto LABEL_73;
    }
    id v154 = v20;
    *(_OWORD *)v178 = 0u;
    *(_OWORD *)v179 = 0u;
    int v180 = 1065353216;
    long long v174 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    obuint64_t j = v19;
    unint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v174, (uint64_t)v185, 16);
    if (v25)
    {
      uint64_t v26 = 0;
      uint64_t v27 = *(void *)v175;
      for (uint64_t i = *(void *)v175; ; uint64_t i = *(void *)v175)
      {
        if (i != v27) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v174 + 1) + 8 * v26);
        objc_msgSend_objectForKey_(obj, v22, (uint64_t)v29, v23, v24);
        id v30 = objc_claimAutoreleasedReturnValue();
        v35 = (char *)objc_msgSend_UTF8String(v30, v31, v32, v33, v34);
        id v36 = v29;
        v41 = (const char *)objc_msgSend_UTF8String(v36, v37, v38, v39, v40);
        size_t v42 = strlen(v41);
        if (v42 >= 0x7FFFFFFFFFFFFFF8) {
          sub_24C6673C8();
        }
        size_t v43 = v42;
        if (v42 >= 0x17) {
          break;
        }
        BYTE7(v161) = v42;
        p_dst = &__dst;
        if (v42) {
          goto LABEL_16;
        }
LABEL_17:
        *((unsigned char *)p_dst + v43) = 0;
        int v173 = std::stoi((const std::string *)&__dst, 0, 10);
        v183 = &v173;
        v47 = (void **)sub_24C680E00((uint64_t)v178, (unsigned int *)&v173, (uint64_t)&unk_24C72FF38, &v183);
        sub_24C67C294(v47 + 3, v35);
        if (SBYTE7(v161) < 0) {
          operator delete((void *)__dst);
        }

        if (++v26 >= v25)
        {
          unint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v174, (uint64_t)v185, 16);
          if (!v25) {
            goto LABEL_23;
          }
          uint64_t v26 = 0;
        }
      }
      uint64_t v45 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v42 | 7) != 0x17) {
        uint64_t v45 = v42 | 7;
      }
      uint64_t v46 = v45 + 1;
      p_dst = (long long *)operator new(v45 + 1);
      *((void *)&__dst + 1) = v43;
      *(void *)&long long v161 = v46 | 0x8000000000000000;
      *(void *)&long long __dst = p_dst;
LABEL_16:
      memmove(p_dst, v41, v43);
      goto LABEL_17;
    }
LABEL_23:

    v49 = operator new(0xA0uLL);
    v49[1] = 0;
    v49[2] = 0;
    void *v49 = &unk_26FEDD530;
    v50 = (void **)v158;
    *((void *)v158 + 4) = sub_24C6A8E30(v49 + 3, v178, 0, 0, 1);
    v55 = (std::__shared_weak_count *)*((void *)v158 + 5);
    v149 = (uint64_t *)(v158 + 32);
    *((void *)v158 + 5) = v49;
    if (v55 && !atomic_fetch_add(&v55->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
    uint64_t v60 = objc_msgSend_runTimeParamsPath(v157, v51, v52, v53, v54);
    v150 = (void *)v60;
    if (v60)
    {
      id v172 = v154;
      v61 = objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x263EFF8F8], v56, v60, 0, (uint64_t)&v172);
      id v62 = v172;

      if (!v61)
      {
        if (a6)
        {
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v63, @"could not load resources", (uint64_t)v62, v64);
          v48 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v48 = 0;
        }
        id v154 = v62;
LABEL_68:

        v141 = (void **)v179[0];
        if (v179[0])
        {
          do
          {
            v144 = (void **)*v141;
            if (*((char *)v141 + 47) < 0) {
              operator delete(v141[3]);
            }
            operator delete(v141);
            v141 = v144;
          }
          while (v144);
        }
        v142 = v178[0];
        v178[0] = 0;
        if (v142) {
          operator delete(v142);
        }
        goto LABEL_71;
      }
      id v171 = v62;
      v65 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v63, (uint64_t)v61, 0, (uint64_t)&v171);
      id v154 = v171;

      if (!v65)
      {
        if (a6)
        {
          v145 = objc_msgSend_localizedDescription(v154, v66, v67, v68, v69);
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v146, (uint64_t)v145, v147, v148);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        v48 = 0;
        goto LABEL_68;
      }
      v70 = [CSUCaptionRuntimeParameters alloc];
      uint64_t v74 = objc_msgSend_initWithOptions_(v70, v71, (uint64_t)v65, v72, v73);
      v75 = (void *)*((void *)v158 + 2);
      *((void *)v158 + 2) = v74;

      v50 = (void **)v158;
    }
    int v76 = objc_msgSend_genderOption(v50[2], v56, v57, v58, v59);
    BOOL v81 = v76;
    if (v76)
    {
      *((_DWORD *)v50 + 2) = v76;
      if (v50[2])
      {
LABEL_32:
        id v82 = objc_alloc(MEMORY[0x263EFF980]);
        v87 = objc_msgSend_blackListRules(v50[2], v83, v84, v85, v86);
        v91 = objc_msgSend_initWithArray_(v82, v88, (uint64_t)v87, v89, v90);

        v92 = [CSUCaptionPostProcessingHandler alloc];
        uint64_t v96 = objc_msgSend_initWithRuntimeParameters_(v92, v93, *((void *)v158 + 2), v94, v95);
        v97 = (void *)*((void *)v158 + 3);
        *((void *)v158 + 3) = v96;
LABEL_43:

        if (!v81)
        {
          long long v169 = 0u;
          long long v170 = 0u;
          long long v167 = 0u;
          long long v168 = 0u;
          v103 = objc_msgSend_genderedTokens(*((void **)v158 + 2), v99, v100, v101, v102);
          uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v104, (uint64_t)&v167, (uint64_t)v184, 16);
          if (v108)
          {
            uint64_t v109 = *(void *)v168;
            do
            {
              for (uint64_t j = 0; j != v108; ++j)
              {
                if (*(void *)v168 != v109) {
                  objc_enumerationMutation(v103);
                }
                v111 = (void *)MEMORY[0x263F08AE8];
                v112 = objc_msgSend_stringWithFormat_(NSString, v105, @"\\b%@\\b", v106, v107, *(void *)(*((void *)&v167 + 1) + 8 * j), v149, v150);
                v114 = objc_msgSend_regularExpressionWithPattern_options_error_(v111, v113, (uint64_t)v112, 1, 0);

                if (v114) {
                  objc_msgSend_addObject_(v91, v115, (uint64_t)v114, v116, v117);
                }
              }
              uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v105, (uint64_t)&v167, (uint64_t)v184, 16);
            }
            while (v108);
          }
        }
        long long __dst = 0u;
        long long v161 = 0u;
        long long v162 = 0u;
        long long v163 = 0u;
        BYTE8(__dst) = 1;
        __asm { FMOV            V0.2S, #1.0 }
        long long v164 = _D0;
        uint64_t v165 = 0xA00000003;
        uint64_t v166 = 1065353216;
        v158[136] = 0;
        *(_OWORD *)(v158 + 120) = __dst;
        sub_24C680800((uint64_t)(v158 + 144), (uint64_t)&v161 + 8);
        uint64_t v123 = *((void *)&v163 + 1);
        *((void *)&v163 + 1) = 0;
        v124 = (void *)*((void *)v158 + 22);
        *((void *)v158 + 22) = v123;

        long long v125 = v164;
        *((void *)v158 + 25) = v165;
        *(_OWORD *)(v158 + 184) = v125;
        *((_DWORD *)v158 + 52) = v166;

        if ((_BYTE)v163)
        {
          uint64_t v130 = *((void *)&v161 + 1);
          if (*((void *)&v161 + 1))
          {
            uint64_t v131 = v162;
            v132 = (void *)*((void *)&v161 + 1);
            if ((void)v162 != *((void *)&v161 + 1))
            {
              do
              {
                if (*(char *)(v131 - 1) < 0) {
                  operator delete(*(void **)(v131 - 24));
                }
                v131 -= 24;
              }
              while (v131 != v130);
              v132 = (void *)*((void *)&v161 + 1);
            }
            *(void *)&long long v162 = v130;
            operator delete(v132);
          }
        }
        *((void *)v158 + 24) = a5;
        *((void *)v158 + 15) = objc_msgSend_maxSeqLen(v157, v126, v127, v128, v129);
        *((_DWORD *)v158 + 50) = v151;
        uint64_t v137 = objc_msgSend_copy(v91, v133, v134, v135, v136);
        v138 = (void *)*((void *)v158 + 22);
        *((void *)v158 + 22) = v137;

        v139 = operator new(0xF8uLL);
        v139[1] = 0;
        v139[2] = 0;
        void *v139 = &unk_26FEDD4F8;
        sub_24C681284((uint64_t)(v139 + 3), (uint64_t)(v158 + 120), v149);
        v140 = (std::__shared_weak_count *)*((void *)v158 + 7);
        *((void *)v158 + 6) = v139 + 3;
        *((void *)v158 + 7) = v139;
        if (v140 && !atomic_fetch_add(&v140->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v140->__on_zero_shared)(v140);
          std::__shared_weak_count::__release_weak(v140);
        }
        v48 = v158;

        goto LABEL_68;
      }
    }
    else
    {
      BOOL v81 = objc_msgSend_excludeGenderStrategy(v50[2], v77, v78, v79, v80) == 2;
      *((_DWORD *)v50 + 2) = v81;
      if (v50[2]) {
        goto LABEL_32;
      }
    }
    v98 = v50[22];
    v50[22] = 0;

    v91 = 0;
    v97 = (void *)*((void *)v158 + 3);
    *((void *)v158 + 3) = 0;
    goto LABEL_43;
  }
  v48 = 0;
LABEL_73:

  return v48;
}

- (shared_ptr<csu::CustomVocabulary>)vocabulary
{
  cntrl = self->_vocabulary.__cntrl_;
  *v2 = self->_vocabulary.__ptr_;
  v2[1] = (CustomVocabulary *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (CustomVocabulary *)self;
  return result;
}

- (void)setVocabulary:(shared_ptr<csu::CustomVocabulary>)a3
{
  v4 = *(CustomVocabulary **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_vocabulary.__cntrl_;
  self->_vocabulary.__ptr_ = v4;
  self->_vocabulary.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<csu::BeamSearch>)beamSearch
{
  cntrl = self->_beamSearch.__cntrl_;
  *v2 = self->_beamSearch.__ptr_;
  v2[1] = (BeamSearch *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (BeamSearch *)self;
  return result;
}

- (void)setBeamSearch:(shared_ptr<csu::BeamSearch>)a3
{
  v4 = *(BeamSearch **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_beamSearch.__cntrl_;
  self->_beamSearch.__ptr_ = v4;
  self->_beamSearch.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (BeamSearchOptions)beamSearchOptions
{
  *(_OWORD *)&retstr->maxSeqLen = *(_OWORD *)&self->_beamSearchOptions.maxSeqLen;
  retstr->maxSteps.__engaged_ = self->_beamSearchOptions.maxSteps.__engaged_;
  retstr->excludeTokens.var0.__null_state_ = 0;
  p_excludeTokens = &retstr->excludeTokens;
  retstr->excludeTokens.__engaged_ = 0;
  if (self->_beamSearchOptions.excludeTokens.__engaged_)
  {
    p_excludeTokens->var0.__val_.__begin_ = 0;
    *(_OWORD *)&retstr->excludeTokens.var0.__val_.__end_ = 0uLL;
    sub_24C671B74(&p_excludeTokens->var0.__null_state_, (uint64_t)self->_beamSearchOptions.excludeTokens.var0.__val_.__begin_, (uint64_t)self->_beamSearchOptions.excludeTokens.var0.__val_.__end_, 0xAAAAAAAAAAAAAAABLL* (((char *)self->_beamSearchOptions.excludeTokens.var0.__val_.__end_- (char *)self->_beamSearchOptions.excludeTokens.var0.__val_.__begin_) >> 3));
    retstr->excludeTokens.__engaged_ = 1;
  }
  shared_ptr<csu::BeamSearch> result = self->_beamSearchOptions.denyListRules;
  retstr->denyListRules = (NSArray *)result;
  *(_OWORD *)&retstr->lengthNormalizationAlpha = *(_OWORD *)&self->_beamSearchOptions.lengthNormalizationAlpha;
  *(void *)&retstr->beamWidth = *(void *)&self->_beamSearchOptions.beamWidth;
  retstr->lengthNormalizationAlpha_2 = self->_beamSearchOptions.lengthNormalizationAlpha_2;
  return result;
}

- (void)setBeamSearchOptions:(BeamSearchOptions *)a3
{
  long long v5 = *(_OWORD *)&a3->maxSeqLen;
  self->_beamSearchOptions.maxSteps.__engaged_ = a3->maxSteps.__engaged_;
  *(_OWORD *)&self->_beamSearchOptions.maxSeqLen = v5;
  sub_24C680940((uint64_t)&self->_beamSearchOptions.excludeTokens, (uint64_t)&a3->excludeTokens);
  objc_storeStrong((id *)&self->_beamSearchOptions.denyListRules, a3->denyListRules);
  *(_OWORD *)&self->_beamSearchOptions.lengthNormalizationAlpha = *(_OWORD *)&a3->lengthNormalizationAlpha;
  uint64_t v6 = *(void *)&a3->beamWidth;
  self->_beamSearchOptions.lengthNormalizationAlpha_2 = a3->lengthNormalizationAlpha_2;
  *(void *)&self->_beamSearchOptions.beamWidth = v6;
}

- (EspressoTensor)encodedFeaturesBuffer
{
  uint64_t v3 = self;
  retstr->_vptr$Tensor = (void **)&unk_26FEDD950;
  int begin = (int)self[1].shape_.sizes_.__begin_;
  retstr->shape_.sizes_.__begin_ = 0;
  retstr->type_ = begin;
  retstr->shape_.sizes_.__end_ = 0;
  retstr->shape_.sizes_.__end_cap_.__value_ = 0;
  end = self[1].shape_.sizes_.__end_;
  value = self[1].shape_.sizes_.__end_cap_.__value_;
  int64_t v8 = (char *)value - (char *)end;
  if (value != end)
  {
    if (v8 < 0) {
      sub_24C667470();
    }
    uint64_t v9 = (unint64_t *)operator new((char *)value - (char *)end);
    retstr->shape_.sizes_.__begin_ = v9;
    retstr->shape_.sizes_.__end_ = v9;
    uint64_t v10 = &v9[v8 >> 3];
    retstr->shape_.sizes_.__end_cap_.__value_ = v10;
    self = (EspressoTensor *)memcpy(v9, end, v8);
    retstr->shape_.sizes_.__end_ = v10;
  }
  uint64_t v11 = v3[2]._vptr$Tensor;
  retstr->storage_.__ptr_ = (TensorStorage *)v3[1].storage_.__cntrl_;
  retstr->storage_.__cntrl_ = (__shared_weak_count *)v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v11 + 1, 1uLL, memory_order_relaxed);
  }
  retstr->_vptr$Tensor = (void **)&unk_26FEDD7F0;
  return self;
}

- (void)setEncodedFeaturesBuffer:(EspressoTensor *)a3
{
  self->_encodedFeaturesBuffer.type_ = a3->type_;
  if (&self->_encodedFeaturesBuffer != a3) {
    sub_24C670F38(&self->_encodedFeaturesBuffer.shape_.sizes_.__begin_, (char *)a3->shape_.sizes_.__begin_, (char *)a3->shape_.sizes_.__end_, a3->shape_.sizes_.__end_ - a3->shape_.sizes_.__begin_);
  }
  ptr = a3->storage_.__ptr_;
  cntrl = a3->storage_.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  v7 = self->_encodedFeaturesBuffer.storage_.__cntrl_;
  self->_encodedFeaturesBuffer.storage_.__ptr_ = ptr;
  self->_encodedFeaturesBuffer.storage_.__cntrl_ = cntrl;
  if (v7 && !atomic_fetch_add((atomic_ullong *volatile)v7 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v7 + 16))(v7);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
  }
}

- (CSUCaptionRuntimeParameters)runTimeParams
{
  return self->_runTimeParams;
}

- (void)setRunTimeParams:(id)a3
{
}

- (int)genderOptionForBeamSearch
{
  return self->_genderOptionForBeamSearch;
}

- (void)setGenderOptionForBeamSearch:(int)a3
{
  self->_genderOptionForBeamSearch = a3;
}

- (CSUCaptionPostProcessingHandler)postProcessingHandler
{
  return self->_postProcessingHandler;
}

- (void)setPostProcessingHandler:(id)a3
{
}

- (void).cxx_destruct
{
  if (self->_beamSearchOptions.excludeTokens.__engaged_)
  {
    int begin = (void **)self->_beamSearchOptions.excludeTokens.var0.__val_.__begin_;
    if (begin)
    {
      end = (void **)self->_beamSearchOptions.excludeTokens.var0.__val_.__end_;
      long long v5 = self->_beamSearchOptions.excludeTokens.var0.__val_.__begin_;
      if (end != begin)
      {
        do
        {
          if (*((char *)end - 1) < 0) {
            operator delete(*(end - 3));
          }
          end -= 3;
        }
        while (end != begin);
        long long v5 = self->_beamSearchOptions.excludeTokens.var0.__val_.__begin_;
      }
      self->_beamSearchOptions.excludeTokens.var0.__val_.__end_ = begin;
      operator delete(v5);
    }
  }
  self->_encodedFeaturesBuffer._vptr$Tensor = (void **)&unk_26FEDD950;
  cntrl = self->_encodedFeaturesBuffer.storage_.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    v7 = self->_encodedFeaturesBuffer.shape_.sizes_.__begin_;
    if (!v7) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v7 = self->_encodedFeaturesBuffer.shape_.sizes_.__begin_;
  if (v7)
  {
LABEL_13:
    self->_encodedFeaturesBuffer.shape_.sizes_.__end_ = v7;
    operator delete(v7);
  }
LABEL_14:
  int64_t v8 = self->_beamSearch.__cntrl_;
  if (v8 && !atomic_fetch_add((atomic_ullong *volatile)v8 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v8 + 16))(v8);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v8);
    uint64_t v9 = self->_vocabulary.__cntrl_;
    if (!v9) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v9 = self->_vocabulary.__cntrl_;
    if (!v9) {
      goto LABEL_22;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v9 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v9 + 16))(v9);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v9);
  }
LABEL_22:
  objc_storeStrong((id *)&self->_postProcessingHandler, 0);
  objc_storeStrong((id *)&self->_runTimeParams, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_DWORD *)self + 18) = 4;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((void *)self + 14) = 0;
  *((void *)self + 8) = &unk_26FEDD7F0;
  *((unsigned char *)self + 128) = 1;
  *((unsigned char *)self + 132) = 0;
  *((unsigned char *)self + 136) = 0;
  *((unsigned char *)self + 144) = 0;
  *((unsigned char *)self + 168) = 0;
  *((void *)self + 22) = 0;
  __asm { FMOV            V0.2S, #1.0 }
  *((void *)self + 23) = _D0;
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0xA00000003;
  *((_DWORD *)self + 52) = 1065353216;
  return self;
}

@end