@interface CSUImageCaptionDecoderAXKVCacheE1Network
- (BOOL)loadDecoderNetworkfromConfiguration:(id)a3 error:(id *)a4;
- (EspressoTensor)inputTokens;
- (ModelOutput)predict;
- (id).cxx_construct;
- (map<std::string,)stateInputEspressoBuffers;
- (map<std::string,)stateInputEspressoBuffersShape;
- (map<std::string,)stateOutputEspressoBuffers;
- (shared_ptr<ik::EspressoNet>)decoderNet;
- (shared_ptr<std::unordered_map<std::string,)getOutputState;
- (unint64_t)sequenceLength;
- (unint64_t)vocabSize;
- (vector<float,)inWords;
- (vector<float,)inputMask;
- (vector<float,)positionInput;
- (vector<float,)scaleInput;
- (vector<float,)wordProbs;
- (void)buildNetworkForSequenceLength:(unint64_t)a3 error:(id *)a4;
- (void)copyInputContextIDs:(const void *)a3 EncoderFeatures:(const void *)a4 KVCache:(const void *)a5 MaskPosition:(unint64_t)a6;
- (void)copyInputState:(const void *)a3;
@end

@implementation CSUImageCaptionDecoderAXKVCacheE1Network

- (BOOL)loadDecoderNetworkfromConfiguration:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v102 = v5;
  objc_msgSend_decoderNetworkPath(v5, v6, v7, v8, v9);
  id v10 = objc_claimAutoreleasedReturnValue();
  v15 = (const char *)objc_msgSend_UTF8String(v10, v11, v12, v13, v14);
  size_t v16 = strlen(v15);
  if (v16 > 0x7FFFFFFFFFFFFFF7) {
    sub_24C6673C8();
  }
  v17 = (void *)v16;
  if (v16 >= 0x17)
  {
    uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v19 = v16 | 7;
    }
    uint64_t v20 = v19 + 1;
    v18 = (void **)operator new(v19 + 1);
    __dst[1] = v17;
    int64_t v137 = v20 | 0x8000000000000000;
    __dst[0] = v18;
  }
  else
  {
    HIBYTE(v137) = v16;
    v18 = __dst;
    if (!v16) {
      goto LABEL_9;
    }
  }
  memmove(v18, v15, (size_t)v17);
LABEL_9:
  *((unsigned char *)v17 + (void)v18) = 0;

  v25 = (uint64_t *)__dst;
  if (v137 < 0) {
    v25 = (uint64_t *)__dst[0];
  }
  v115 = (long long *)v25;
  v117 = 0;
  v118 = 0;
  uint64_t v119 = 0;
  int v120 = objc_msgSend_espressoExecutionEngine(v5, v21, v22, v23, v24);
  char v121 = 1;
  char v122 = 0;
  char v123 = 0;
  uint64_t v124 = 0xFFFFFFFFLL;
  char v125 = 0;
  char v126 = 0;
  char v127 = 0;
  char v128 = 0;
  long long v129 = 0u;
  long long v130 = 0u;
  int v131 = 1065353216;
  char v133 = 0;
  LOBYTE(__p) = 0;
  v26 = (char *)operator new(0x30uLL);
  *((void *)v26 + 1) = 0;
  *((void *)v26 + 2) = 0;
  *(void *)v26 = &unk_26FEDBB80;
  v27 = (EspressoNet *)(v26 + 24);
  sub_24C6D6544((void *)v26 + 3, (const char **)&v115, (uint64_t)&v117);
  v134 = (EspressoNet *)(v26 + 24);
  v135 = (std::__shared_weak_count *)v26;
  if (v133 < 0) {
    operator delete(__p);
  }
  v28 = (void **)v130;
  if ((void)v130)
  {
    do
    {
      v33 = (void **)*v28;
      if (*((char *)v28 + 39) < 0) {
        operator delete(v28[2]);
      }
      operator delete(v28);
      v28 = v33;
    }
    while (v33);
  }
  v29 = (void *)v129;
  *(void *)&long long v129 = 0;
  if (v29) {
    operator delete(v29);
  }
  v30 = (void **)v117;
  if (v117)
  {
    v31 = v118;
    v32 = v117;
    if (v118 != v117)
    {
      do
      {
        if (*((char *)v31 - 1) < 0) {
          operator delete(*(v31 - 3));
        }
        v31 -= 3;
      }
      while (v31 != v30);
      v32 = v117;
    }
    v118 = v30;
    operator delete(v32);
  }
  v117 = 0;
  v118 = 0;
  uint64_t v119 = 0;
  int input_names = c_network_get_input_names();
  if (input_names)
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v34, @"Not able to fetch decoder input names!", v35, v36);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = v38;
    objc_msgSend_logInternalError_(CSUError, v39, (uint64_t)v38, v40, v41);
    v42 = (void **)v117;
    if (!v117) {
      goto LABEL_134;
    }
    goto LABEL_29;
  }
  long long v116 = 0uLL;
  v115 = &v116;
  v113 = &v114;
  long long v114 = 0uLL;
  long long v112 = 0uLL;
  v111 = &v112;
  v45 = (char *)v117;
  v46 = (char *)v118;
  if (v117 == v118) {
    goto LABEL_121;
  }
  do
  {
    while (1)
    {
      if (v45[23] < 0)
      {
        sub_24C66E0A8(v109, *(void **)v45, *((void *)v45 + 1));
      }
      else
      {
        long long v48 = *(_OWORD *)v45;
        uint64_t v110 = *((void *)v45 + 2);
        *(_OWORD *)v109 = v48;
      }
      char v47 = HIBYTE(v110);
      if (v110 >= 0) {
        uint64_t v49 = HIBYTE(v110);
      }
      else {
        uint64_t v49 = (uint64_t)v109[1];
      }
      if (v110 >= 0) {
        v50 = v109;
      }
      else {
        v50 = (void **)v109[0];
      }
      if (v49 >= 5)
      {
        v51 = (char *)v50 + v49;
        uint64_t v52 = v49;
        v53 = v50;
        while (1)
        {
          v54 = (char *)memchr(v53, 95, v52 - 4);
          if (!v54) {
            goto LABEL_43;
          }
          if (*(_DWORD *)v54 == 1767863135 && v54[4] == 110) {
            break;
          }
          v53 = (void **)(v54 + 1);
          uint64_t v52 = v51 - (char *)v53;
          if (v51 - (char *)v53 < 5) {
            goto LABEL_43;
          }
        }
        if (v54 == v51 || v54 - (char *)v50 == -1) {
          goto LABEL_43;
        }
        v56 = (void **)(v51 - 3);
        unint64_t v57 = v49 - 3;
        if ((unint64_t)(v49 - 3) > 0x7FFFFFFFFFFFFFF7) {
          sub_24C6673C8();
        }
        if (v57 > 0x16)
        {
          uint64_t v66 = (v57 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v57 | 7) != 0x17) {
            uint64_t v66 = v57 | 7;
          }
          uint64_t v67 = v66 + 1;
          v58 = operator new(v66 + 1);
          int64_t v107 = v49 - 3;
          int64_t v108 = v67 | 0x8000000000000000;
          v106 = v58;
          if (v50 != v56)
          {
LABEL_70:
            uint64_t v59 = v49 - 3;
            if ((unint64_t)(v49 - 3) < 0x20 || (unint64_t)((char *)v58 - (char *)v50) < 0x20)
            {
              v60 = v58;
              v61 = v50;
            }
            else
            {
              v60 = (char *)v58 + (v59 & 0xFFFFFFFFFFFFFFE0);
              v61 = (void **)((char *)v50 + (v59 & 0xFFFFFFFFFFFFFFE0));
              v62 = (long long *)(v50 + 2);
              v63 = v58 + 1;
              unint64_t v64 = v59 & 0xFFFFFFFFFFFFFFE0;
              do
              {
                long long v65 = *v62;
                *(v63 - 1) = *(v62 - 1);
                _OWORD *v63 = v65;
                v62 += 2;
                v63 += 2;
                v64 -= 32;
              }
              while (v64);
              if (v59 == (v59 & 0xFFFFFFFFFFFFFFE0))
              {
LABEL_82:
                unsigned char *v60 = 0;
                v69 = operator new(0x28uLL);
                v69[4] = 0;
                *(_OWORD *)v69 = 0u;
                *((_OWORD *)v69 + 1) = 0u;
                v103 = v109;
                v70 = sub_24C6D669C((uint64_t **)&v111, (const void **)v109, (uint64_t)&unk_24C72FF38, (long long **)&v103);
                v71 = v70[7];
                if (v71)
                {
                  v70[8] = v71;
                  operator delete(v71);
                  v70[7] = 0;
                  v70[8] = 0;
                  v70[9] = 0;
                }
                v70[7] = v69;
                v70[8] = v69 + 5;
                v70[9] = v69 + 5;
                if (v108 >= 0) {
                  int64_t v72 = HIBYTE(v108);
                }
                else {
                  int64_t v72 = v107;
                }
                if (v108 >= 0) {
                  v73 = (char *)&v106;
                }
                else {
                  v73 = (char *)v106;
                }
                if (v72 >= 17)
                {
                  v74 = &v73[v72];
                  int64_t v75 = v72;
                  v76 = v73;
                  do
                  {
                    v77 = (char *)memchr(v76, 118, v75 - 16);
                    if (!v77) {
                      break;
                    }
                    if (*(void *)v77 == 0x5F616C6C696E6176
                      && *((void *)v77 + 1) == 0x6F69746E65747461
                      && v77[16] == 110)
                    {
                      if (v77 == v74 || v77 - v73 == -1) {
                        break;
                      }
                      v103 = v109;
                      v80 = sub_24C6D6830((uint64_t **)&v113, (const void **)v109, (uint64_t)&unk_24C72FF38, (long long **)&v103);
                      v82 = v80 + 7;
                      v81 = v80[7];
                      if (v81)
                      {
                        v80[8] = v81;
                        operator delete(v81);
                        void *v82 = 0;
                        v82[1] = 0;
                        v82[2] = 0;
                      }
                      void *v82 = 0;
                      v82[1] = 0;
                      v82[2] = 0;
                      goto LABEL_40;
                    }
                    v76 = v77 + 1;
                    int64_t v75 = v74 - (unsigned char *)v76;
                  }
                  while (v74 - (unsigned char *)v76 >= 17);
                }
                unint64_t v83 = v72 + 4;
                if ((unint64_t)(v72 + 4) > 0x7FFFFFFFFFFFFFF7) {
                  sub_24C6673C8();
                }
                if (v83 >= 0x17)
                {
                  uint64_t v85 = (v83 & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v83 | 7) != 0x17) {
                    uint64_t v85 = v83 | 7;
                  }
                  uint64_t v86 = v85 + 1;
                  v84 = operator new(v85 + 1);
                  int64_t v104 = v72 + 4;
                  unint64_t v105 = v86 | 0x8000000000000000;
                  v103 = v84;
                }
                else
                {
                  int64_t v104 = 0;
                  unint64_t v105 = 0;
                  v103 = 0;
                  v84 = &v103;
                  HIBYTE(v105) = v72 + 4;
                  if (!v72)
                  {
LABEL_114:
                    strcpy((char *)v84 + v72, "_out");
                    v87 = (uint64_t *)operator new(0xB800uLL);
                    bzero(v87, 0xB800uLL);
                    v138[0] = (long long *)v109;
                    v88 = sub_24C6D6830((uint64_t **)&v113, (const void **)v109, (uint64_t)&unk_24C72FF38, v138);
                    v89 = v88[7];
                    if (v89)
                    {
                      v88[8] = v89;
                      operator delete(v89);
                      v88[7] = 0;
                      v88[8] = 0;
                      v88[9] = 0;
                    }
                    v88[7] = v87;
                    v88[8] = v87 + 5888;
                    v88[9] = v87 + 5888;
                    v90 = (uint64_t *)operator new(0x800uLL);
                    bzero(v90, 0x800uLL);
                    v138[0] = (long long *)&v103;
                    v91 = sub_24C6D6830((uint64_t **)&v115, (const void **)&v103, (uint64_t)&unk_24C72FF38, v138);
                    v92 = v91[7];
                    if (v92)
                    {
                      v91[8] = v92;
                      operator delete(v92);
                      v91[7] = 0;
                      v91[8] = 0;
                      v91[9] = 0;
                    }
                    v91[7] = v90;
                    v91[8] = v90 + 256;
                    v91[9] = v90 + 256;
                    if (SHIBYTE(v105) < 0) {
                      operator delete(v103);
                    }
LABEL_40:
                    if (SHIBYTE(v108) < 0) {
                      operator delete(v106);
                    }
                    char v47 = HIBYTE(v110);
                    goto LABEL_43;
                  }
                }
                memmove(v84, v73, v72);
                goto LABEL_114;
              }
            }
            do
            {
              char v68 = *(unsigned char *)v61;
              v61 = (void **)((char *)v61 + 1);
              *v60++ = v68;
            }
            while (v61 != v56);
            goto LABEL_82;
          }
        }
        else
        {
          HIBYTE(v108) = v49 - 3;
          v58 = &v106;
          if (v50 != v56) {
            goto LABEL_70;
          }
        }
        v60 = v58;
        goto LABEL_82;
      }
LABEL_43:
      if (v47 < 0) {
        break;
      }
      v45 += 24;
      if (v45 == v46) {
        goto LABEL_120;
      }
    }
    operator delete(v109[0]);
    v45 += 24;
  }
  while (v45 != v46);
LABEL_120:
  v27 = v134;
  v26 = (char *)v135;
  if (v135)
  {
LABEL_121:
    atomic_fetch_add_explicit((atomic_ullong *volatile)v26 + 1, 1uLL, memory_order_relaxed);
    v93 = self;
    cntrl = self->_decoderNet.__cntrl_;
    self->_decoderNet.__ptr_ = v27;
    self->_decoderNet.__cntrl_ = (__shared_weak_count *)v26;
    if (!cntrl)
    {
LABEL_125:
      p_stateInputEspressoBuffersShape = (uint64_t **)&v93->_stateInputEspressoBuffersShape;
      if (&v93->_stateInputEspressoBuffersShape != (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)&v111) {
        goto LABEL_126;
      }
      goto LABEL_127;
    }
  }
  else
  {
    v93 = self;
    cntrl = self->_decoderNet.__cntrl_;
    self->_decoderNet.__ptr_ = v134;
    self->_decoderNet.__cntrl_ = 0;
    if (!cntrl) {
      goto LABEL_125;
    }
  }
  if (atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_125;
  }
  (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  p_stateInputEspressoBuffersShape = (uint64_t **)&v93->_stateInputEspressoBuffersShape;
  if (&v93->_stateInputEspressoBuffersShape != (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)&v111) {
LABEL_126:
  }
    sub_24C6D69C4(p_stateInputEspressoBuffersShape, v111, &v112);
LABEL_127:
  if (&v93->_stateInputEspressoBuffers != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)&v113) {
    sub_24C6D6F10((uint64_t **)&v93->_stateInputEspressoBuffers, v113, &v114);
  }
  if (&v93->_stateOutputEspressoBuffers != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)&v115) {
    sub_24C6D6F10((uint64_t **)&v93->_stateOutputEspressoBuffers, v115, &v116);
  }
  *(_OWORD *)&v93->_sequenceLength = xmmword_24C7304C0;
  v96 = (float *)operator new(0x177000uLL);
  bzero(v96, 0x177000uLL);
  v97 = v96 + 384000;
  begin = v93->_wordProbs.__begin_;
  if (begin)
  {
    v93->_wordProbs.__end_ = begin;
    operator delete(begin);
    v93->_wordProbs.__begin_ = 0;
    v93->_wordProbs.__end_ = 0;
    v93->_wordProbs.__end_cap_.__value_ = 0;
  }
  v93->_wordProbs.__begin_ = v96;
  v93->_wordProbs.__end_ = v97;
  v93->_wordProbs.__end_cap_.__value_ = v97;
  sub_24C6D6244((uint64_t)&v111, (char *)v112);
  sub_24C6D6244((uint64_t)&v113, (char *)v114);
  sub_24C6D6244((uint64_t)&v115, (char *)v116);
  int input_names = 0;
  v42 = (void **)v117;
  if (!v117)
  {
LABEL_134:
    v44 = v135;
    if (v135) {
      goto LABEL_135;
    }
LABEL_136:
    v99 = v102;
    if (SHIBYTE(v137) < 0) {
      goto LABEL_137;
    }
    goto LABEL_138;
  }
LABEL_29:
  v43 = v118;
  if (v118 == v42)
  {
    v118 = v42;
    operator delete(v42);
    v44 = v135;
    if (v135) {
      goto LABEL_135;
    }
    goto LABEL_136;
  }
  do
  {
    if (*((char *)v43 - 1) < 0) {
      operator delete(*(v43 - 3));
    }
    v43 -= 3;
  }
  while (v43 != v42);
  v118 = v42;
  operator delete(v117);
  v44 = v135;
  if (!v135) {
    goto LABEL_136;
  }
LABEL_135:
  if (atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_136;
  }
  ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
  std::__shared_weak_count::__release_weak(v44);
  v99 = v102;
  if (SHIBYTE(v137) < 0) {
LABEL_137:
  }
    operator delete(__dst[0]);
LABEL_138:

  return input_names == 0;
}

- (void)buildNetworkForSequenceLength:(unint64_t)a3 error:(id *)a4
{
  int v580 = a3;
  uint64_t v613 = *MEMORY[0x263EF8340];
  espresso_plan_build_clean();
  v596 = 0;
  v597 = 0;
  v598 = 0;
  v593 = 0;
  v594 = 0;
  v595 = 0;
  v591[0] = 0;
  v591[1] = 0;
  v592 = 0;
  v588 = 0;
  v589 = 0;
  v590 = 0;
  v585 = 0;
  v586 = 0;
  HIBYTE(__p[2]) = 21;
  v587 = 0;
  strcpy((char *)__p, "att_feats_placeholder");
  v579 = self;
  v591[1] = sub_24C693F34(v591, (uint64_t)__p);
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    v6 = v594;
    id v5 = v595;
    if (v594 < v595) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = (char *)v593;
    int64_t v9 = v6 - (unsigned char *)v593;
    uint64_t v10 = (v6 - (unsigned char *)v593) >> 2;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 62) {
      sub_24C667470();
    }
    uint64_t v12 = v5 - (unsigned char *)v593;
    if (v12 >> 1 > v11) {
      unint64_t v11 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      if (v13 >> 62) {
        sub_24C66DB48();
      }
      uint64_t v14 = operator new(4 * v13);
    }
    else
    {
      uint64_t v14 = 0;
    }
    v15 = &v14[4 * v10];
    *(_DWORD *)v15 = 512;
    uint64_t v7 = v15 + 4;
    if (v6 != v8)
    {
      unint64_t v16 = v6 - v8 - 4;
      if (v16 < 0x2C) {
        goto LABEL_870;
      }
      if ((unint64_t)(v6 - v14 - v9) < 0x20) {
        goto LABEL_870;
      }
      uint64_t v17 = (v16 >> 2) + 1;
      uint64_t v18 = 4 * (v17 & 0x7FFFFFFFFFFFFFF8);
      uint64_t v19 = &v6[-v18];
      v15 -= v18;
      uint64_t v20 = &v14[v9 - 16];
      v21 = v6 - 16;
      uint64_t v22 = v17 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v23 = *(_OWORD *)v21;
        *(v20 - 1) = *((_OWORD *)v21 - 1);
        *uint64_t v20 = v23;
        v20 -= 2;
        v21 -= 32;
        v22 -= 8;
      }
      while (v22);
      v6 = v19;
      if (v17 != (v17 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_870:
        do
        {
          int v24 = *((_DWORD *)v6 - 1);
          v6 -= 4;
          *((_DWORD *)v15 - 1) = v24;
          v15 -= 4;
        }
        while (v6 != v8);
      }
    }
    v593 = v15;
    v594 = v7;
    v595 = &v14[4 * v13];
    if (v8) {
      operator delete(v8);
    }
    goto LABEL_24;
  }
  v6 = v594;
  id v5 = v595;
  if (v594 >= v595) {
    goto LABEL_5;
  }
LABEL_3:
  *(_DWORD *)v6 = 512;
  uint64_t v7 = v6 + 4;
LABEL_24:
  v594 = v7;
  v25 = v597;
  if (v597 >= v598)
  {
    v27 = (char *)v596;
    int64_t v28 = v597 - (unsigned char *)v596;
    uint64_t v29 = (v597 - (unsigned char *)v596) >> 2;
    unint64_t v30 = v29 + 1;
    if ((unint64_t)(v29 + 1) >> 62) {
      sub_24C667470();
    }
    uint64_t v31 = v598 - (unsigned char *)v596;
    if ((v598 - (unsigned char *)v596) >> 1 > v30) {
      unint64_t v30 = v31 >> 1;
    }
    if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v32 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v32 = v30;
    }
    if (v32)
    {
      if (v32 >> 62) {
        sub_24C66DB48();
      }
      v33 = (char *)operator new(4 * v32);
    }
    else
    {
      v33 = 0;
    }
    v34 = &v33[4 * v29];
    *(_DWORD *)v34 = 144;
    v26 = v34 + 4;
    if (v25 != v27)
    {
      unint64_t v35 = v25 - v27 - 4;
      if (v35 < 0x2C) {
        goto LABEL_871;
      }
      if ((unint64_t)(v25 - v33 - v28) < 0x20) {
        goto LABEL_871;
      }
      uint64_t v36 = (v35 >> 2) + 1;
      uint64_t v37 = 4 * (v36 & 0x7FFFFFFFFFFFFFF8);
      id v38 = &v25[-v37];
      v34 -= v37;
      v39 = &v33[v28 - 16];
      uint64_t v40 = v25 - 16;
      uint64_t v41 = v36 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v42 = *(_OWORD *)v40;
        *((_OWORD *)v39 - 1) = *((_OWORD *)v40 - 1);
        *(_OWORD *)v39 = v42;
        v39 -= 32;
        v40 -= 32;
        v41 -= 8;
      }
      while (v41);
      v25 = v38;
      if (v36 != (v36 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_871:
        do
        {
          int v43 = *((_DWORD *)v25 - 1);
          v25 -= 4;
          *((_DWORD *)v34 - 1) = v43;
          v34 -= 4;
        }
        while (v25 != v27);
      }
    }
    v596 = v34;
    v597 = v26;
    v598 = &v33[4 * v32];
    if (v27) {
      operator delete(v27);
    }
  }
  else
  {
    *(_DWORD *)v597 = 144;
    v26 = v25 + 4;
  }
  v597 = v26;
  v44 = v589;
  if (v589 >= v590)
  {
    v46 = (char *)v588;
    int64_t v47 = v589 - (unsigned char *)v588;
    uint64_t v48 = (v589 - (unsigned char *)v588) >> 2;
    unint64_t v49 = v48 + 1;
    if ((unint64_t)(v48 + 1) >> 62) {
      sub_24C667470();
    }
    uint64_t v50 = v590 - (unsigned char *)v588;
    if ((v590 - (unsigned char *)v588) >> 1 > v49) {
      unint64_t v49 = v50 >> 1;
    }
    if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v51 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v51 = v49;
    }
    if (v51)
    {
      if (v51 >> 62) {
        sub_24C66DB48();
      }
      uint64_t v52 = (char *)operator new(4 * v51);
    }
    else
    {
      uint64_t v52 = 0;
    }
    v53 = &v52[4 * v48];
    *(_DWORD *)v53 = 1;
    v45 = v53 + 4;
    if (v44 != v46)
    {
      unint64_t v54 = v44 - v46 - 4;
      if (v54 < 0x2C) {
        goto LABEL_872;
      }
      if ((unint64_t)(v44 - v52 - v47) < 0x20) {
        goto LABEL_872;
      }
      uint64_t v55 = (v54 >> 2) + 1;
      uint64_t v56 = 4 * (v55 & 0x7FFFFFFFFFFFFFF8);
      unint64_t v57 = &v44[-v56];
      v53 -= v56;
      v58 = &v52[v47 - 16];
      uint64_t v59 = v44 - 16;
      uint64_t v60 = v55 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v61 = *(_OWORD *)v59;
        *((_OWORD *)v58 - 1) = *((_OWORD *)v59 - 1);
        *(_OWORD *)v58 = v61;
        v58 -= 32;
        v59 -= 32;
        v60 -= 8;
      }
      while (v60);
      v44 = v57;
      if (v55 != (v55 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_872:
        do
        {
          int v62 = *((_DWORD *)v44 - 1);
          v44 -= 4;
          *((_DWORD *)v53 - 1) = v62;
          v53 -= 4;
        }
        while (v44 != v46);
      }
    }
    v588 = v53;
    v589 = v45;
    v590 = &v52[4 * v51];
    if (v46) {
      operator delete(v46);
    }
  }
  else
  {
    *(_DWORD *)v589 = 1;
    v45 = v44 + 4;
  }
  v589 = v45;
  v63 = v586;
  if (v586 >= v587)
  {
    long long v65 = (char *)v585;
    int64_t v66 = v586 - (unsigned char *)v585;
    uint64_t v67 = (v586 - (unsigned char *)v585) >> 2;
    unint64_t v68 = v67 + 1;
    if ((unint64_t)(v67 + 1) >> 62) {
      sub_24C667470();
    }
    uint64_t v69 = v587 - (unsigned char *)v585;
    if ((v587 - (unsigned char *)v585) >> 1 > v68) {
      unint64_t v68 = v69 >> 1;
    }
    if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v70 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v70 = v68;
    }
    if (v70)
    {
      if (v70 >> 62) {
        sub_24C66DB48();
      }
      v71 = (char *)operator new(4 * v70);
    }
    else
    {
      v71 = 0;
    }
    int64_t v72 = &v71[4 * v67];
    *(_DWORD *)int64_t v72 = 1;
    unint64_t v64 = v72 + 4;
    if (v63 != v65)
    {
      unint64_t v73 = v63 - v65 - 4;
      if (v73 < 0x2C) {
        goto LABEL_873;
      }
      if ((unint64_t)(v63 - v71 - v66) < 0x20) {
        goto LABEL_873;
      }
      uint64_t v74 = (v73 >> 2) + 1;
      uint64_t v75 = 4 * (v74 & 0x7FFFFFFFFFFFFFF8);
      v76 = &v63[-v75];
      v72 -= v75;
      v77 = &v71[v66 - 16];
      v78 = v63 - 16;
      uint64_t v79 = v74 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v80 = *(_OWORD *)v78;
        *((_OWORD *)v77 - 1) = *((_OWORD *)v78 - 1);
        *(_OWORD *)v77 = v80;
        v77 -= 32;
        v78 -= 32;
        v79 -= 8;
      }
      while (v79);
      v63 = v76;
      if (v74 != (v74 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_873:
        do
        {
          int v81 = *((_DWORD *)v63 - 1);
          v63 -= 4;
          *((_DWORD *)v72 - 1) = v81;
          v72 -= 4;
        }
        while (v63 != v65);
      }
    }
    v585 = v72;
    v586 = v64;
    v587 = &v71[4 * v70];
    if (v65) {
      operator delete(v65);
    }
  }
  else
  {
    *(_DWORD *)v586 = 1;
    unint64_t v64 = v63 + 4;
  }
  uint64_t v82 = 0;
  v586 = v64;
  do
  {
    v84 = off_2652E8158[v82];
    size_t v85 = strlen(v84);
    if (v85 > 0x7FFFFFFFFFFFFFF7) {
      sub_24C6673C8();
    }
    uint64_t v86 = (void *)v85;
    if (v85 >= 0x17)
    {
      uint64_t v101 = (v85 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v85 | 7) != 0x17) {
        uint64_t v101 = v85 | 7;
      }
      uint64_t v102 = v101 + 1;
      v87 = operator new(v101 + 1);
      __p[1] = v86;
      __p[2] = (void *)(v102 | 0x8000000000000000);
      __p[0] = v87;
    }
    else
    {
      HIBYTE(__p[2]) = v85;
      v87 = __p;
      if (!v85)
      {
        LOBYTE(__p[0]) = 0;
        v88 = (void **)v591[1];
        if (v591[1] < v592) {
          goto LABEL_94;
        }
        goto LABEL_109;
      }
    }
    memmove(v87, v84, (size_t)v86);
    *((unsigned char *)v86 + (void)v87) = 0;
    v88 = (void **)v591[1];
    if (v591[1] < v592)
    {
LABEL_94:
      long long v89 = *(_OWORD *)__p;
      v88[2] = __p[2];
      *(_OWORD *)v88 = v89;
      v591[1] = v88 + 3;
      v91 = v597;
      v90 = v598;
      if (v597 < v598) {
        goto LABEL_111;
      }
      goto LABEL_95;
    }
LABEL_109:
    v591[1] = sub_24C693F34(v591, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      v91 = v597;
      v90 = v598;
      if (v597 < v598)
      {
LABEL_111:
        *(_DWORD *)v91 = 1;
        v100 = v91 + 4;
        goto LABEL_123;
      }
    }
    else
    {
      v91 = v597;
      v90 = v598;
      if (v597 < v598) {
        goto LABEL_111;
      }
    }
LABEL_95:
    v92 = (char *)v596;
    int64_t v93 = v91 - (unsigned char *)v596;
    uint64_t v94 = (v91 - (unsigned char *)v596) >> 2;
    unint64_t v95 = v94 + 1;
    if ((unint64_t)(v94 + 1) >> 62) {
      sub_24C667470();
    }
    uint64_t v96 = v90 - (unsigned char *)v596;
    if (v96 >> 1 > v95) {
      unint64_t v95 = v96 >> 1;
    }
    if ((unint64_t)v96 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v97 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v97 = v95;
    }
    if (v97)
    {
      if (v97 >> 62) {
        sub_24C66DB48();
      }
      v98 = operator new(4 * v97);
      v99 = &v98[4 * v94];
      *(_DWORD *)v99 = 1;
      v100 = v99 + 4;
      if (v91 == v92) {
        goto LABEL_121;
      }
LABEL_115:
      unint64_t v104 = v91 - 4 - v92;
      if (v104 < 0x2C) {
        goto LABEL_874;
      }
      if ((unint64_t)(v91 - &v98[v93]) < 0x20) {
        goto LABEL_874;
      }
      uint64_t v105 = (v104 >> 2) + 1;
      uint64_t v106 = 4 * (v105 & 0x7FFFFFFFFFFFFFF8);
      int64_t v107 = &v91[-v106];
      v99 -= v106;
      int64_t v108 = &v98[v93 - 16];
      v109 = v91 - 16;
      uint64_t v110 = v105 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v111 = *(_OWORD *)v109;
        *(v108 - 1) = *((_OWORD *)v109 - 1);
        *int64_t v108 = v111;
        v108 -= 2;
        v109 -= 32;
        v110 -= 8;
      }
      while (v110);
      v91 = v107;
      if (v105 != (v105 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_874:
        do
        {
          int v112 = *((_DWORD *)v91 - 1);
          v91 -= 4;
          *((_DWORD *)v99 - 1) = v112;
          v99 -= 4;
        }
        while (v91 != v92);
      }
      goto LABEL_121;
    }
    v98 = 0;
    v99 = (char *)(4 * v94);
    v103 = (_DWORD *)(4 * v94);
    _DWORD *v103 = 1;
    v100 = (char *)(v103 + 1);
    if (v91 != v92) {
      goto LABEL_115;
    }
LABEL_121:
    v596 = v99;
    v597 = v100;
    v598 = &v98[4 * v97];
    if (v92) {
      operator delete(v92);
    }
LABEL_123:
    v597 = v100;
    v113 = v594;
    if (v594 < v595)
    {
      *(_DWORD *)v594 = 1;
      long long v114 = v113 + 4;
      goto LABEL_144;
    }
    v115 = (char *)v593;
    int64_t v116 = v594 - (unsigned char *)v593;
    uint64_t v117 = (v594 - (unsigned char *)v593) >> 2;
    unint64_t v118 = v117 + 1;
    if ((unint64_t)(v117 + 1) >> 62) {
      sub_24C667470();
    }
    uint64_t v119 = v595 - (unsigned char *)v593;
    if ((v595 - (unsigned char *)v593) >> 1 > v118) {
      unint64_t v118 = v119 >> 1;
    }
    if ((unint64_t)v119 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v120 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v120 = v118;
    }
    if (v120)
    {
      if (v120 >> 62) {
        sub_24C66DB48();
      }
      char v121 = (char *)operator new(4 * v120);
      char v122 = &v121[4 * v117];
      *(_DWORD *)char v122 = 1;
      long long v114 = v122 + 4;
      if (v113 == v115) {
        goto LABEL_142;
      }
LABEL_136:
      unint64_t v124 = v113 - 4 - v115;
      if (v124 < 0x2C) {
        goto LABEL_875;
      }
      if ((unint64_t)(v113 - &v121[v116]) < 0x20) {
        goto LABEL_875;
      }
      uint64_t v125 = (v124 >> 2) + 1;
      uint64_t v126 = 4 * (v125 & 0x7FFFFFFFFFFFFFF8);
      char v127 = &v113[-v126];
      v122 -= v126;
      char v128 = &v121[v116 - 16];
      long long v129 = (long long *)(v113 - 16);
      uint64_t v130 = v125 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v131 = *v129;
        *((_OWORD *)v128 - 1) = *(v129 - 1);
        *(_OWORD *)char v128 = v131;
        v128 -= 32;
        v129 -= 2;
        v130 -= 8;
      }
      while (v130);
      v113 = v127;
      if (v125 != (v125 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_875:
        do
        {
          int v132 = *((_DWORD *)v113 - 1);
          v113 -= 4;
          *((_DWORD *)v122 - 1) = v132;
          v122 -= 4;
        }
        while (v113 != v115);
      }
      goto LABEL_142;
    }
    char v121 = 0;
    char v122 = (char *)(4 * v117);
    char v123 = (_DWORD *)(4 * v117);
    *char v123 = 1;
    long long v114 = (char *)(v123 + 1);
    if (v113 != v115) {
      goto LABEL_136;
    }
LABEL_142:
    v593 = v122;
    v594 = v114;
    v595 = &v121[4 * v120];
    if (v115) {
      operator delete(v115);
    }
LABEL_144:
    v594 = v114;
    char v133 = v589;
    if (v589 < v590)
    {
      *(_DWORD *)v589 = 1;
      v134 = v133 + 4;
      goto LABEL_165;
    }
    v135 = (char *)v588;
    int64_t v136 = v589 - (unsigned char *)v588;
    uint64_t v137 = (v589 - (unsigned char *)v588) >> 2;
    unint64_t v138 = v137 + 1;
    if ((unint64_t)(v137 + 1) >> 62) {
      sub_24C667470();
    }
    uint64_t v139 = v590 - (unsigned char *)v588;
    if ((v590 - (unsigned char *)v588) >> 1 > v138) {
      unint64_t v138 = v139 >> 1;
    }
    if ((unint64_t)v139 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v140 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v140 = v138;
    }
    if (v140)
    {
      if (v140 >> 62) {
        sub_24C66DB48();
      }
      v141 = (char *)operator new(4 * v140);
      v142 = &v141[4 * v137];
      *(_DWORD *)v142 = 1;
      v134 = v142 + 4;
      if (v133 == v135) {
        goto LABEL_163;
      }
LABEL_157:
      unint64_t v144 = v133 - 4 - v135;
      if (v144 < 0x2C) {
        goto LABEL_876;
      }
      if ((unint64_t)(v133 - &v141[v136]) < 0x20) {
        goto LABEL_876;
      }
      uint64_t v145 = (v144 >> 2) + 1;
      uint64_t v146 = 4 * (v145 & 0x7FFFFFFFFFFFFFF8);
      v147 = &v133[-v146];
      v142 -= v146;
      v148 = &v141[v136 - 16];
      v149 = v133 - 16;
      uint64_t v150 = v145 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v151 = *(_OWORD *)v149;
        *((_OWORD *)v148 - 1) = *((_OWORD *)v149 - 1);
        *(_OWORD *)v148 = v151;
        v148 -= 32;
        v149 -= 32;
        v150 -= 8;
      }
      while (v150);
      char v133 = v147;
      if (v145 != (v145 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_876:
        do
        {
          int v152 = *((_DWORD *)v133 - 1);
          v133 -= 4;
          *((_DWORD *)v142 - 1) = v152;
          v142 -= 4;
        }
        while (v133 != v135);
      }
      goto LABEL_163;
    }
    v141 = 0;
    v142 = (char *)(4 * v137);
    v143 = (_DWORD *)(4 * v137);
    _DWORD *v143 = 1;
    v134 = (char *)(v143 + 1);
    if (v133 != v135) {
      goto LABEL_157;
    }
LABEL_163:
    v588 = v142;
    v589 = v134;
    v590 = &v141[4 * v140];
    if (v135) {
      operator delete(v135);
    }
LABEL_165:
    v589 = v134;
    v153 = v586;
    if (v586 < v587)
    {
      *(_DWORD *)v586 = 1;
      unint64_t v83 = v153 + 4;
      goto LABEL_89;
    }
    v154 = (char *)v585;
    int64_t v155 = v586 - (unsigned char *)v585;
    uint64_t v156 = (v586 - (unsigned char *)v585) >> 2;
    unint64_t v157 = v156 + 1;
    if ((unint64_t)(v156 + 1) >> 62) {
      sub_24C667470();
    }
    uint64_t v158 = v587 - (unsigned char *)v585;
    if ((v587 - (unsigned char *)v585) >> 1 > v157) {
      unint64_t v157 = v158 >> 1;
    }
    if ((unint64_t)v158 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v159 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v159 = v157;
    }
    if (v159)
    {
      if (v159 >> 62) {
        sub_24C66DB48();
      }
      v160 = (char *)operator new(4 * v159);
      v161 = &v160[4 * v156];
      *(_DWORD *)v161 = 1;
      unint64_t v83 = v161 + 4;
      if (v153 == v154) {
        goto LABEL_183;
      }
LABEL_177:
      unint64_t v163 = v153 - 4 - v154;
      if (v163 < 0x2C) {
        goto LABEL_877;
      }
      if ((unint64_t)(v153 - &v160[v155]) < 0x20) {
        goto LABEL_877;
      }
      uint64_t v164 = (v163 >> 2) + 1;
      uint64_t v165 = 4 * (v164 & 0x7FFFFFFFFFFFFFF8);
      v166 = &v153[-v165];
      v161 -= v165;
      v167 = &v160[v155 - 16];
      v168 = v153 - 16;
      uint64_t v169 = v164 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v170 = *(_OWORD *)v168;
        *((_OWORD *)v167 - 1) = *((_OWORD *)v168 - 1);
        *(_OWORD *)v167 = v170;
        v167 -= 32;
        v168 -= 32;
        v169 -= 8;
      }
      while (v169);
      v153 = v166;
      if (v164 != (v164 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_877:
        do
        {
          int v171 = *((_DWORD *)v153 - 1);
          v153 -= 4;
          *((_DWORD *)v161 - 1) = v171;
          v161 -= 4;
        }
        while (v153 != v154);
      }
      goto LABEL_183;
    }
    v160 = 0;
    v161 = (char *)(4 * v156);
    v162 = (_DWORD *)(4 * v156);
    _DWORD *v162 = 1;
    unint64_t v83 = (char *)(v162 + 1);
    if (v153 != v154) {
      goto LABEL_177;
    }
LABEL_183:
    v585 = v161;
    v586 = v83;
    v587 = &v160[4 * v159];
    if (v154) {
      operator delete(v154);
    }
LABEL_89:
    v586 = v83;
    ++v82;
  }
  while (v82 != 4);
  for (int __val = 0; __val != 4; ++__val)
  {
    uint64_t v172 = 0;
    v609 = "self_attention";
    v610 = "vanilla_attention";
    do
    {
      v173 = (&v609)[v172];
      std::to_string(&v605, __val);
      std::string::size_type size = HIBYTE(v605.__r_.__value_.__r.__words[2]);
      if ((v605.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        size_t v175 = 22;
      }
      else {
        size_t v175 = (v605.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      }
      if ((v605.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type size = v605.__r_.__value_.__l.__size_;
      }
      if (v175 == size)
      {
        if (v175 == 0x7FFFFFFFFFFFFFF6) {
          sub_24C6673C8();
        }
        unint64_t v176 = v175 + 1;
        if ((v605.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v177 = &v605;
        }
        else {
          v177 = (std::string *)v605.__r_.__value_.__r.__words[0];
        }
        size_t v178 = 0x7FFFFFFFFFFFFFF7;
        if (v175 < 0x3FFFFFFFFFFFFFF3)
        {
          unint64_t v179 = 2 * v175;
          if (v176 > 2 * v175) {
            unint64_t v179 = v175 + 1;
          }
          if (v179 >= 0x17)
          {
            unint64_t v183 = (v179 & 0xFFFFFFFFFFFFFFF8) + 8;
            uint64_t v184 = v179 | 7;
            if (v184 == 23) {
              uint64_t v184 = v183;
            }
            size_t v178 = v184 + 1;
          }
          else
          {
            size_t v178 = 23;
          }
        }
        v185 = operator new(v178);
        std::string::size_type v186 = (std::string::size_type)v185;
        if (v175)
        {
          memmove(v185, v177, v175);
          *(unsigned char *)(v186 + v175) = 47;
          if (v175 == 22) {
            goto LABEL_217;
          }
        }
        else
        {
          unsigned char *v185 = 47;
        }
        operator delete(v177);
LABEL_217:
        v605.__r_.__value_.__l.__size_ = v175 + 1;
        v605.__r_.__value_.__r.__words[2] = v178 | 0x8000000000000000;
        v605.__r_.__value_.__r.__words[0] = v186;
        v182 = (unsigned char *)(v186 + v176);
        goto LABEL_218;
      }
      v180 = &v605;
      if ((v605.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        v180 = (std::string *)v605.__r_.__value_.__r.__words[0];
      }
      v180->__r_.__value_.__s.__data_[size] = 47;
      std::string::size_type v181 = size + 1;
      if (SHIBYTE(v605.__r_.__value_.__r.__words[2]) < 0) {
        v605.__r_.__value_.__l.__size_ = v181;
      }
      else {
        *((unsigned char *)&v605.__r_.__value_.__s + 23) = v181 & 0x7F;
      }
      v182 = (char *)v180 + v181;
LABEL_218:
      unsigned char *v182 = 0;
      *(std::string *)v582 = v605;
      memset(&v605, 0, sizeof(v605));
      size_t v187 = strlen(v173);
      size_t v188 = v187;
      if (v582[23] >= 0) {
        unint64_t v189 = 22;
      }
      else {
        unint64_t v189 = (*(void *)&v582[16] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      }
      if (v582[23] >= 0) {
        size_t v190 = v582[23];
      }
      else {
        size_t v190 = *(void *)&v582[8];
      }
      if (v189 - v190 >= v187)
      {
        if (!v187) {
          goto LABEL_250;
        }
        if (v582[23] >= 0) {
          v195 = v582;
        }
        else {
          v195 = *(unsigned char **)v582;
        }
        memmove(&v195[v190], v173, v187);
        size_t v196 = v190 + v188;
        if ((v582[23] & 0x80000000) != 0) {
          *(void *)&v582[8] = v190 + v188;
        }
        else {
          v582[23] = v196 & 0x7F;
        }
        v197 = &v195[v196];
      }
      else
      {
        unint64_t v191 = v190 + v187;
        if (0x7FFFFFFFFFFFFFF6 - v189 < v190 + v187 - v189) {
          sub_24C6673C8();
        }
        if (v582[23] >= 0) {
          v192 = v582;
        }
        else {
          v192 = *(unsigned char **)v582;
        }
        size_t v193 = 0x7FFFFFFFFFFFFFF7;
        if (v189 < 0x3FFFFFFFFFFFFFF3)
        {
          unint64_t v194 = 2 * v189;
          if (v191 > 2 * v189) {
            unint64_t v194 = v190 + v187;
          }
          if (v194 >= 0x17)
          {
            unint64_t v198 = (v194 & 0xFFFFFFFFFFFFFFF8) + 8;
            uint64_t v199 = v194 | 7;
            if (v199 == 23) {
              uint64_t v199 = v198;
            }
            size_t v193 = v199 + 1;
          }
          else
          {
            size_t v193 = 23;
          }
        }
        v200 = (char *)operator new(v193);
        v201 = v200;
        if (v190) {
          memmove(v200, v192, v190);
        }
        memcpy(&v201[v190], v173, v188);
        if (v189 != 22) {
          operator delete(v192);
        }
        *(void *)&v582[8] = v190 + v188;
        *(void *)&v582[16] = v193 | 0x8000000000000000;
        *(void *)v582 = v201;
        v197 = &v201[v191];
      }
      char *v197 = 0;
LABEL_250:
      __p[2] = *(void **)&v582[16];
      *(_OWORD *)__p = *(_OWORD *)v582;
      memset(v582, 0, 24);
      if (SHIBYTE(__p[2]) >= 0) {
        unint64_t v202 = 22;
      }
      else {
        unint64_t v202 = ((unint64_t)__p[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      }
      if (SHIBYTE(__p[2]) >= 0) {
        v203 = (char *)((unint64_t)__p[2] >> 56);
      }
      else {
        v203 = (char *)__p[1];
      }
      if (v202 - (unint64_t)v203 >= 7)
      {
        v208 = __p;
        if (SHIBYTE(__p[2]) < 0) {
          v208 = (void **)__p[0];
        }
        v209 = &v203[(void)v208];
        *(_DWORD *)(v209 + 3) = 1852399475;
        *(_DWORD *)v209 = 1935633247;
        v210 = v203 + 7;
        if (SHIBYTE(__p[2]) < 0) {
          __p[1] = v203 + 7;
        }
        else {
          HIBYTE(__p[2]) = v210 & 0x7F;
        }
        v211 = &v210[(void)v208];
      }
      else
      {
        unint64_t v204 = (unint64_t)(v203 + 7);
        if (0x7FFFFFFFFFFFFFF6 - v202 < (unint64_t)&v203[-v202 + 7]) {
          sub_24C6673C8();
        }
        if (SHIBYTE(__p[2]) >= 0) {
          v205 = __p;
        }
        else {
          v205 = (void **)__p[0];
        }
        size_t v206 = 0x7FFFFFFFFFFFFFF7;
        if (v202 < 0x3FFFFFFFFFFFFFF3)
        {
          unint64_t v207 = 2 * v202;
          if (v204 > 2 * v202) {
            unint64_t v207 = (unint64_t)(v203 + 7);
          }
          if (v207 >= 0x17)
          {
            unint64_t v212 = (v207 & 0xFFFFFFFFFFFFFFF8) + 8;
            uint64_t v213 = v207 | 7;
            if (v213 == 23) {
              uint64_t v213 = v212;
            }
            size_t v206 = v213 + 1;
          }
          else
          {
            size_t v206 = 23;
          }
        }
        v214 = (char *)operator new(v206);
        v215 = v214;
        if (v203) {
          memmove(v214, v205, (size_t)v203);
        }
        v216 = &v203[(void)v215];
        *(_DWORD *)(v216 + 3) = 1852399475;
        *(_DWORD *)v216 = 1935633247;
        if (v202 != 22) {
          operator delete(v205);
        }
        __p[1] = v203 + 7;
        __p[2] = (void *)(v206 | 0x8000000000000000);
        __p[0] = v215;
        v211 = (char *)v215 + v204;
      }
      char *v211 = 0;
      *(_OWORD *)__dst = *(_OWORD *)__p;
      *(void **)&__dst[16] = __p[2];
      memset(__p, 0, sizeof(__p));
      if ((v582[23] & 0x80000000) != 0)
      {
        operator delete(*(void **)v582);
        if ((SHIBYTE(v605.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_282;
        }
      }
      else if ((SHIBYTE(v605.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_282;
      }
      operator delete(v605.__r_.__value_.__l.__data_);
LABEL_282:
      if (espresso_network_query_blob_dimensions()) {
        goto LABEL_596;
      }
      v220 = v591[1];
      if (v591[1] >= v592)
      {
        v591[1] = sub_24C6D58A8((char **)v591, (uint64_t)__dst);
        int v222 = (int)__p[0];
        v224 = v589;
        v223 = v590;
        if (v589 < v590) {
          goto LABEL_297;
        }
      }
      else if ((__dst[23] & 0x80000000) != 0)
      {
        sub_24C66E0A8((unsigned char *)v591[1], *(void **)__dst, *(unint64_t *)&__dst[8]);
        v591[1] = (char *)v220 + 24;
        int v222 = (int)__p[0];
        v224 = v589;
        v223 = v590;
        if (v589 < v590)
        {
LABEL_297:
          *(_DWORD *)v224 = v222;
          v233 = v224 + 4;
          goto LABEL_311;
        }
      }
      else
      {
        long long v221 = *(_OWORD *)__dst;
        *((void *)v591[1] + 2) = *(void *)&__dst[16];
        _OWORD *v220 = v221;
        v591[1] = (char *)v220 + 24;
        int v222 = (int)__p[0];
        v224 = v589;
        v223 = v590;
        if (v589 < v590) {
          goto LABEL_297;
        }
      }
      v225 = (char *)v588;
      int64_t v226 = v224 - (unsigned char *)v588;
      uint64_t v227 = (v224 - (unsigned char *)v588) >> 2;
      unint64_t v228 = v227 + 1;
      if ((unint64_t)(v227 + 1) >> 62) {
        sub_24C667470();
      }
      uint64_t v229 = v223 - (unsigned char *)v588;
      if (v229 >> 1 > v228) {
        unint64_t v228 = v229 >> 1;
      }
      if ((unint64_t)v229 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v230 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v230 = v228;
      }
      if (v230)
      {
        if (v230 >> 62) {
          sub_24C66DB48();
        }
        v231 = operator new(4 * v230);
        v232 = &v231[4 * v227];
        *(_DWORD *)v232 = v222;
        v233 = v232 + 4;
        if (v224 == v225) {
          goto LABEL_309;
        }
LABEL_303:
        unint64_t v235 = v224 - 4 - v225;
        if (v235 < 0x2C) {
          goto LABEL_878;
        }
        if ((unint64_t)(v224 - &v231[v226]) < 0x20) {
          goto LABEL_878;
        }
        uint64_t v236 = (v235 >> 2) + 1;
        uint64_t v237 = 4 * (v236 & 0x7FFFFFFFFFFFFFF8);
        v238 = &v224[-v237];
        v232 -= v237;
        v239 = &v231[v226 - 16];
        v240 = v224 - 16;
        uint64_t v241 = v236 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v242 = *(_OWORD *)v240;
          *(v239 - 1) = *((_OWORD *)v240 - 1);
          _OWORD *v239 = v242;
          v239 -= 2;
          v240 -= 32;
          v241 -= 8;
        }
        while (v241);
        v224 = v238;
        if (v236 != (v236 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_878:
          do
          {
            int v243 = *((_DWORD *)v224 - 1);
            v224 -= 4;
            *((_DWORD *)v232 - 1) = v243;
            v232 -= 4;
          }
          while (v224 != v225);
        }
        goto LABEL_309;
      }
      v231 = 0;
      v232 = (char *)(4 * v227);
      v234 = (_DWORD *)(4 * v227);
      _DWORD *v234 = v222;
      v233 = (char *)(v234 + 1);
      if (v224 != v225) {
        goto LABEL_303;
      }
LABEL_309:
      v588 = v232;
      v589 = v233;
      v590 = &v231[4 * v230];
      if (v225) {
        operator delete(v225);
      }
LABEL_311:
      v589 = v233;
      v582[23] = 17;
      strcpy(v582, "vanilla_attention");
      int v244 = v580;
      if (strlen(v173) == 17)
      {
        unint64_t v245 = bswap64(*(unint64_t *)v582);
        unint64_t v246 = bswap64(*(void *)v173);
        if (v245 == v246
          && (unint64_t v245 = bswap64(*(unint64_t *)&v582[8]), v246 = bswap64(*((void *)v173 + 1)), v245 == v246))
        {
          int v247 = v582[16] - v173[16];
        }
        else if (v245 < v246)
        {
          int v247 = -1;
        }
        else
        {
          int v247 = 1;
        }
        if (v247) {
          int v244 = v580;
        }
        else {
          int v244 = 0;
        }
      }
      v248 = v586;
      if (v586 < v587)
      {
        *(_DWORD *)v586 = v244;
        v249 = v248 + 4;
        goto LABEL_342;
      }
      v250 = (char *)v585;
      int64_t v251 = v586 - (unsigned char *)v585;
      uint64_t v252 = (v586 - (unsigned char *)v585) >> 2;
      unint64_t v253 = v252 + 1;
      if ((unint64_t)(v252 + 1) >> 62) {
        sub_24C667470();
      }
      uint64_t v254 = v587 - (unsigned char *)v585;
      if ((v587 - (unsigned char *)v585) >> 1 > v253) {
        unint64_t v253 = v254 >> 1;
      }
      if ((unint64_t)v254 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v255 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v255 = v253;
      }
      if (v255)
      {
        if (v255 >> 62) {
          sub_24C66DB48();
        }
        v256 = (char *)operator new(4 * v255);
        v257 = &v256[4 * v252];
        *(_DWORD *)v257 = v244;
        v249 = v257 + 4;
        if (v248 == v250) {
          goto LABEL_340;
        }
LABEL_334:
        unint64_t v259 = v248 - 4 - v250;
        if (v259 < 0x2C) {
          goto LABEL_879;
        }
        if ((unint64_t)(v248 - &v256[v251]) < 0x20) {
          goto LABEL_879;
        }
        uint64_t v260 = (v259 >> 2) + 1;
        uint64_t v261 = 4 * (v260 & 0x7FFFFFFFFFFFFFF8);
        v262 = &v248[-v261];
        v257 -= v261;
        v263 = &v256[v251 - 16];
        v264 = v248 - 16;
        uint64_t v265 = v260 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v266 = *(_OWORD *)v264;
          *((_OWORD *)v263 - 1) = *((_OWORD *)v264 - 1);
          *(_OWORD *)v263 = v266;
          v263 -= 32;
          v264 -= 32;
          v265 -= 8;
        }
        while (v265);
        v248 = v262;
        if (v260 != (v260 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_879:
          do
          {
            int v267 = *((_DWORD *)v248 - 1);
            v248 -= 4;
            *((_DWORD *)v257 - 1) = v267;
            v257 -= 4;
          }
          while (v248 != v250);
        }
        goto LABEL_340;
      }
      v256 = 0;
      v257 = (char *)(4 * v252);
      v258 = (_DWORD *)(4 * v252);
      _DWORD *v258 = v244;
      v249 = (char *)(v258 + 1);
      if (v248 != v250) {
        goto LABEL_334;
      }
LABEL_340:
      v585 = v257;
      v586 = v249;
      v587 = &v256[4 * v255];
      if (v250) {
        operator delete(v250);
      }
LABEL_342:
      v586 = v249;
      if ((v582[23] & 0x80000000) != 0)
      {
        operator delete(*(void **)v582);
        int v268 = (int)__p[2];
        v270 = v597;
        v269 = v598;
        if (v597 < v598)
        {
LABEL_344:
          *(_DWORD *)v270 = v268;
          v271 = v270 + 4;
          goto LABEL_365;
        }
      }
      else
      {
        int v268 = (int)__p[2];
        v270 = v597;
        v269 = v598;
        if (v597 < v598) {
          goto LABEL_344;
        }
      }
      v272 = (char *)v596;
      int64_t v273 = v270 - (unsigned char *)v596;
      uint64_t v274 = (v270 - (unsigned char *)v596) >> 2;
      unint64_t v275 = v274 + 1;
      if ((unint64_t)(v274 + 1) >> 62) {
        sub_24C667470();
      }
      uint64_t v276 = v269 - (unsigned char *)v596;
      if (v276 >> 1 > v275) {
        unint64_t v275 = v276 >> 1;
      }
      if ((unint64_t)v276 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v277 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v277 = v275;
      }
      if (v277)
      {
        if (v277 >> 62) {
          sub_24C66DB48();
        }
        v278 = operator new(4 * v277);
        v279 = &v278[4 * v274];
        *(_DWORD *)v279 = v268;
        v271 = v279 + 4;
        if (v270 == v272) {
          goto LABEL_363;
        }
LABEL_357:
        unint64_t v281 = v270 - 4 - v272;
        if (v281 < 0x2C) {
          goto LABEL_880;
        }
        if ((unint64_t)(v270 - &v278[v273]) < 0x20) {
          goto LABEL_880;
        }
        uint64_t v282 = (v281 >> 2) + 1;
        uint64_t v283 = 4 * (v282 & 0x7FFFFFFFFFFFFFF8);
        v284 = &v270[-v283];
        v279 -= v283;
        v285 = &v278[v273 - 16];
        v286 = v270 - 16;
        uint64_t v287 = v282 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v288 = *(_OWORD *)v286;
          *(v285 - 1) = *((_OWORD *)v286 - 1);
          _OWORD *v285 = v288;
          v285 -= 2;
          v286 -= 32;
          v287 -= 8;
        }
        while (v287);
        v270 = v284;
        if (v282 != (v282 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_880:
          do
          {
            int v289 = *((_DWORD *)v270 - 1);
            v270 -= 4;
            *((_DWORD *)v279 - 1) = v289;
            v279 -= 4;
          }
          while (v270 != v272);
        }
        goto LABEL_363;
      }
      v278 = 0;
      v279 = (char *)(4 * v274);
      v280 = (_DWORD *)(4 * v274);
      _DWORD *v280 = v268;
      v271 = (char *)(v280 + 1);
      if (v270 != v272) {
        goto LABEL_357;
      }
LABEL_363:
      v596 = v279;
      v597 = v271;
      v598 = &v278[4 * v277];
      if (v272) {
        operator delete(v272);
      }
LABEL_365:
      v597 = v271;
      v290 = v594;
      if (v594 < v595)
      {
        *(_DWORD *)v594 = 1;
        uint64_t v291 = (uint64_t)(v290 + 4);
        goto LABEL_386;
      }
      v292 = (char *)v593;
      int64_t v293 = v594 - (unsigned char *)v593;
      uint64_t v294 = (v594 - (unsigned char *)v593) >> 2;
      unint64_t v295 = v294 + 1;
      if ((unint64_t)(v294 + 1) >> 62) {
        sub_24C667470();
      }
      uint64_t v296 = v595 - (unsigned char *)v593;
      if ((v595 - (unsigned char *)v593) >> 1 > v295) {
        unint64_t v295 = v296 >> 1;
      }
      if ((unint64_t)v296 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v297 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v297 = v295;
      }
      if (v297)
      {
        if (v297 >> 62) {
          sub_24C66DB48();
        }
        v298 = (char *)operator new(4 * v297);
        v299 = &v298[4 * v294];
        *(_DWORD *)v299 = 1;
        uint64_t v291 = (uint64_t)(v299 + 4);
        if (v290 == v292) {
          goto LABEL_384;
        }
LABEL_378:
        unint64_t v300 = v290 - 4 - v292;
        if (v300 < 0x2C) {
          goto LABEL_881;
        }
        if ((unint64_t)(v290 - &v298[v293]) < 0x20) {
          goto LABEL_881;
        }
        uint64_t v301 = (v300 >> 2) + 1;
        uint64_t v302 = 4 * (v301 & 0x7FFFFFFFFFFFFFF8);
        v303 = &v290[-v302];
        v299 -= v302;
        v304 = &v298[v293 - 16];
        v305 = v290 - 16;
        uint64_t v306 = v301 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v307 = *(_OWORD *)v305;
          *((_OWORD *)v304 - 1) = *((_OWORD *)v305 - 1);
          *(_OWORD *)v304 = v307;
          v304 -= 32;
          v305 -= 32;
          v306 -= 8;
        }
        while (v306);
        v290 = v303;
        if (v301 != (v301 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_881:
          do
          {
            int v308 = *((_DWORD *)v290 - 1);
            v290 -= 4;
            *((_DWORD *)v299 - 1) = v308;
            v299 -= 4;
          }
          while (v290 != v292);
        }
        goto LABEL_384;
      }
      v298 = 0;
      v299 = (char *)(4 * v294);
      *(_DWORD *)(4 * v294) = 1;
      uint64_t v291 = 4 * v294 + 4;
      if (v290 != v292) {
        goto LABEL_378;
      }
LABEL_384:
      v593 = v299;
      v594 = (char *)v291;
      v595 = &v298[4 * v297];
      if (v292) {
        operator delete(v292);
      }
LABEL_386:
      v594 = (char *)v291;
      std::to_string(&v584, __val);
      std::string::size_type v309 = HIBYTE(v584.__r_.__value_.__r.__words[2]);
      if ((v584.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        size_t v310 = 22;
      }
      else {
        size_t v310 = (v584.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      }
      if ((v584.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v309 = v584.__r_.__value_.__l.__size_;
      }
      if (v310 == v309)
      {
        if (v310 == 0x7FFFFFFFFFFFFFF6) {
          sub_24C6673C8();
        }
        unint64_t v311 = v310 + 1;
        if ((v584.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v312 = &v584;
        }
        else {
          v312 = (std::string *)v584.__r_.__value_.__r.__words[0];
        }
        size_t v313 = 0x7FFFFFFFFFFFFFF7;
        if (v310 < 0x3FFFFFFFFFFFFFF3)
        {
          unint64_t v314 = 2 * v310;
          if (v311 > 2 * v310) {
            unint64_t v314 = v310 + 1;
          }
          if (v314 >= 0x17)
          {
            unint64_t v318 = (v314 & 0xFFFFFFFFFFFFFFF8) + 8;
            uint64_t v319 = v314 | 7;
            if (v319 == 23) {
              uint64_t v319 = v318;
            }
            size_t v313 = v319 + 1;
          }
          else
          {
            size_t v313 = 23;
          }
        }
        v320 = operator new(v313);
        std::string::size_type v321 = (std::string::size_type)v320;
        if (v310)
        {
          memmove(v320, v312, v310);
          *(unsigned char *)(v321 + v310) = 47;
          if (v310 == 22) {
            goto LABEL_415;
          }
        }
        else
        {
          unsigned char *v320 = 47;
        }
        operator delete(v312);
LABEL_415:
        v584.__r_.__value_.__l.__size_ = v310 + 1;
        v584.__r_.__value_.__r.__words[2] = v313 | 0x8000000000000000;
        v584.__r_.__value_.__r.__words[0] = v321;
        v317 = (unsigned char *)(v321 + v311);
        goto LABEL_416;
      }
      v315 = &v584;
      if ((v584.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        v315 = (std::string *)v584.__r_.__value_.__r.__words[0];
      }
      v315->__r_.__value_.__s.__data_[v309] = 47;
      std::string::size_type v316 = v309 + 1;
      if (SHIBYTE(v584.__r_.__value_.__r.__words[2]) < 0) {
        v584.__r_.__value_.__l.__size_ = v316;
      }
      else {
        *((unsigned char *)&v584.__r_.__value_.__s + 23) = v316 & 0x7F;
      }
      v317 = (char *)v315 + v316;
LABEL_416:
      unsigned char *v317 = 0;
      std::string v605 = v584;
      memset(&v584, 0, sizeof(v584));
      size_t v322 = strlen(v173);
      size_t v323 = v322;
      if ((v605.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v324 = 22;
      }
      else {
        std::string::size_type v324 = (v605.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      }
      if ((v605.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v325 = HIBYTE(v605.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v325 = v605.__r_.__value_.__l.__size_;
      }
      if (v324 - v325 >= v322)
      {
        if (!v322) {
          goto LABEL_448;
        }
        if ((v605.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v330 = &v605;
        }
        else {
          v330 = (std::string *)v605.__r_.__value_.__r.__words[0];
        }
        memmove((char *)v330 + v325, v173, v322);
        std::string::size_type v331 = v325 + v323;
        if (SHIBYTE(v605.__r_.__value_.__r.__words[2]) < 0) {
          v605.__r_.__value_.__l.__size_ = v325 + v323;
        }
        else {
          *((unsigned char *)&v605.__r_.__value_.__s + 23) = v331 & 0x7F;
        }
        v332 = (char *)v330 + v331;
      }
      else
      {
        unint64_t v326 = v325 + v322;
        if (0x7FFFFFFFFFFFFFF6 - v324 < v325 + v322 - v324) {
          sub_24C6673C8();
        }
        if ((v605.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v327 = &v605;
        }
        else {
          v327 = (std::string *)v605.__r_.__value_.__r.__words[0];
        }
        size_t v328 = 0x7FFFFFFFFFFFFFF7;
        if (v324 < 0x3FFFFFFFFFFFFFF3)
        {
          unint64_t v329 = 2 * v324;
          if (v326 > 2 * v324) {
            unint64_t v329 = v325 + v322;
          }
          if (v329 >= 0x17)
          {
            unint64_t v333 = (v329 & 0xFFFFFFFFFFFFFFF8) + 8;
            uint64_t v334 = v329 | 7;
            if (v334 == 23) {
              uint64_t v334 = v333;
            }
            size_t v328 = v334 + 1;
          }
          else
          {
            size_t v328 = 23;
          }
        }
        v335 = operator new(v328);
        std::string::size_type v336 = (std::string::size_type)v335;
        if (v325) {
          memmove(v335, v327, v325);
        }
        memcpy((void *)(v336 + v325), v173, v323);
        if (v324 != 22) {
          operator delete(v327);
        }
        v605.__r_.__value_.__l.__size_ = v325 + v323;
        v605.__r_.__value_.__r.__words[2] = v328 | 0x8000000000000000;
        v605.__r_.__value_.__r.__words[0] = v336;
        v332 = (unsigned char *)(v336 + v326);
      }
      unsigned char *v332 = 0;
LABEL_448:
      *(std::string *)v582 = v605;
      int64_t v337 = v605.__r_.__value_.__r.__words[2];
      memset(&v605, 0, sizeof(v605));
      if (v337 >= 0) {
        unint64_t v338 = 22;
      }
      else {
        unint64_t v338 = (v337 & 0x7FFFFFFFFFFFFFFFLL) - 1;
      }
      if (v337 >= 0) {
        size_t v339 = HIBYTE(v337);
      }
      else {
        size_t v339 = *(void *)&v582[8];
      }
      if (v338 - v339 >= 7)
      {
        v344 = v582;
        if (v337 < 0) {
          v344 = *(unsigned char **)v582;
        }
        v345 = &v344[v339];
        *(_DWORD *)((char *)v345 + 3) = 1852399475;
        _DWORD *v345 = 1935636063;
        size_t v346 = v339 + 7;
        if ((v582[23] & 0x80000000) != 0) {
          *(void *)&v582[8] = v339 + 7;
        }
        else {
          v582[23] = v346 & 0x7F;
        }
        v347 = &v344[v346];
      }
      else
      {
        unint64_t v340 = v339 + 7;
        if (0x7FFFFFFFFFFFFFF6 - v338 < v339 + 7 - v338) {
          sub_24C6673C8();
        }
        if (v337 >= 0) {
          v341 = v582;
        }
        else {
          v341 = *(unsigned char **)v582;
        }
        size_t v342 = 0x7FFFFFFFFFFFFFF7;
        if (v338 < 0x3FFFFFFFFFFFFFF3)
        {
          unint64_t v343 = 2 * v338;
          if (v340 > 2 * v338) {
            unint64_t v343 = v339 + 7;
          }
          if (v343 >= 0x17)
          {
            unint64_t v348 = (v343 & 0xFFFFFFFFFFFFFFF8) + 8;
            uint64_t v349 = v343 | 7;
            if (v349 == 23) {
              uint64_t v349 = v348;
            }
            size_t v342 = v349 + 1;
          }
          else
          {
            size_t v342 = 23;
          }
        }
        v350 = (char *)operator new(v342);
        v351 = v350;
        if (v339) {
          memmove(v350, v341, v339);
        }
        v352 = &v351[v339];
        *(_DWORD *)(v352 + 3) = 1852399475;
        *(_DWORD *)v352 = 1935636063;
        if (v338 != 22) {
          operator delete(v341);
        }
        *(void *)&v582[8] = v339 + 7;
        *(void *)&v582[16] = v342 | 0x8000000000000000;
        *(void *)v582 = v351;
        v347 = &v351[v340];
      }
      char *v347 = 0;
      uint64_t v353 = *(void *)v582;
      *(void *)v612 = *(void *)&v582[8];
      *(void *)&v612[7] = *(void *)&v582[15];
      char v354 = v582[23];
      memset(v582, 0, 24);
      if ((__dst[23] & 0x80000000) != 0)
      {
        operator delete(*(void **)__dst);
        *(void *)__dst = v353;
        *(void *)&__dst[8] = *(void *)v612;
        *(void *)&__dst[15] = *(void *)&v612[7];
        __dst[23] = v354;
        if ((v582[23] & 0x80000000) != 0)
        {
          operator delete(*(void **)v582);
          if (SHIBYTE(v605.__r_.__value_.__r.__words[2]) < 0)
          {
LABEL_480:
            operator delete(v605.__r_.__value_.__l.__data_);
            if ((SHIBYTE(v584.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
              goto LABEL_485;
            }
LABEL_481:
            operator delete(v584.__r_.__value_.__l.__data_);
            goto LABEL_485;
          }
        }
        else if (SHIBYTE(v605.__r_.__value_.__r.__words[2]) < 0)
        {
          goto LABEL_480;
        }
      }
      else
      {
        *(void *)__dst = v353;
        *(void *)&__dst[8] = *(void *)v612;
        *(void *)&__dst[15] = *(void *)&v612[7];
        __dst[23] = v354;
        if (SHIBYTE(v605.__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_480;
        }
      }
      if (SHIBYTE(v584.__r_.__value_.__r.__words[2]) < 0) {
        goto LABEL_481;
      }
LABEL_485:
      if (espresso_network_query_blob_dimensions())
      {
LABEL_596:
        if (a4)
        {
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v217, @"Not able to fetch decoder input names!", v218, v219);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        if ((__dst[23] & 0x80000000) == 0) {
          goto LABEL_601;
        }
        v451 = *(void **)__dst;
LABEL_600:
        operator delete(v451);
        goto LABEL_601;
      }
      v355 = v591[1];
      if (v591[1] >= v592)
      {
        v591[1] = sub_24C6D58A8((char **)v591, (uint64_t)__dst);
        int v357 = (int)__p[0];
        v359 = v589;
        v358 = v590;
        if (v589 < v590) {
          goto LABEL_500;
        }
      }
      else if ((__dst[23] & 0x80000000) != 0)
      {
        sub_24C66E0A8((unsigned char *)v591[1], *(void **)__dst, *(unint64_t *)&__dst[8]);
        v591[1] = (char *)v355 + 24;
        int v357 = (int)__p[0];
        v359 = v589;
        v358 = v590;
        if (v589 < v590)
        {
LABEL_500:
          *(_DWORD *)v359 = v357;
          v368 = v359 + 4;
          goto LABEL_512;
        }
      }
      else
      {
        long long v356 = *(_OWORD *)__dst;
        *((void *)v591[1] + 2) = *(void *)&__dst[16];
        _OWORD *v355 = v356;
        v591[1] = (char *)v355 + 24;
        int v357 = (int)__p[0];
        v359 = v589;
        v358 = v590;
        if (v589 < v590) {
          goto LABEL_500;
        }
      }
      v360 = (char *)v588;
      int64_t v361 = v359 - (unsigned char *)v588;
      uint64_t v362 = (v359 - (unsigned char *)v588) >> 2;
      unint64_t v363 = v362 + 1;
      if ((unint64_t)(v362 + 1) >> 62) {
        sub_24C667470();
      }
      uint64_t v364 = v358 - (unsigned char *)v588;
      if (v364 >> 1 > v363) {
        unint64_t v363 = v364 >> 1;
      }
      if ((unint64_t)v364 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v365 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v365 = v363;
      }
      if (v365)
      {
        if (v365 >> 62) {
          sub_24C66DB48();
        }
        v366 = operator new(4 * v365);
        v367 = &v366[4 * v362];
        *(_DWORD *)v367 = v357;
        v368 = v367 + 4;
        if (v359 == v360) {
          goto LABEL_510;
        }
LABEL_504:
        unint64_t v370 = v359 - 4 - v360;
        if (v370 < 0x2C) {
          goto LABEL_882;
        }
        if ((unint64_t)(v359 - &v366[v361]) < 0x20) {
          goto LABEL_882;
        }
        uint64_t v371 = (v370 >> 2) + 1;
        uint64_t v372 = 4 * (v371 & 0x7FFFFFFFFFFFFFF8);
        v373 = &v359[-v372];
        v367 -= v372;
        v374 = &v366[v361 - 16];
        v375 = v359 - 16;
        uint64_t v376 = v371 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v377 = *(_OWORD *)v375;
          *(v374 - 1) = *((_OWORD *)v375 - 1);
          _OWORD *v374 = v377;
          v374 -= 2;
          v375 -= 32;
          v376 -= 8;
        }
        while (v376);
        v359 = v373;
        if (v371 != (v371 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_882:
          do
          {
            int v378 = *((_DWORD *)v359 - 1);
            v359 -= 4;
            *((_DWORD *)v367 - 1) = v378;
            v367 -= 4;
          }
          while (v359 != v360);
        }
        goto LABEL_510;
      }
      v366 = 0;
      v367 = (char *)(4 * v362);
      v369 = (_DWORD *)(4 * v362);
      _DWORD *v369 = v357;
      v368 = (char *)(v369 + 1);
      if (v359 != v360) {
        goto LABEL_504;
      }
LABEL_510:
      v588 = v367;
      v589 = v368;
      v590 = &v366[4 * v365];
      if (v360) {
        operator delete(v360);
      }
LABEL_512:
      v589 = v368;
      v582[23] = 17;
      strcpy(v582, "vanilla_attention");
      int v379 = v580;
      if (strlen(v173) == 17)
      {
        unint64_t v380 = bswap64(*(unint64_t *)v582);
        unint64_t v381 = bswap64(*(void *)v173);
        if (v380 == v381
          && (unint64_t v380 = bswap64(*(unint64_t *)&v582[8]), v381 = bswap64(*((void *)v173 + 1)), v380 == v381))
        {
          int v382 = v582[16] - v173[16];
        }
        else if (v380 < v381)
        {
          int v382 = -1;
        }
        else
        {
          int v382 = 1;
        }
        if (v382) {
          int v379 = v580;
        }
        else {
          int v379 = 0;
        }
      }
      v383 = v586;
      if (v586 < v587)
      {
        *(_DWORD *)v586 = v379;
        v384 = v383 + 4;
        goto LABEL_543;
      }
      v385 = (char *)v585;
      int64_t v386 = v586 - (unsigned char *)v585;
      uint64_t v387 = (v586 - (unsigned char *)v585) >> 2;
      unint64_t v388 = v387 + 1;
      if ((unint64_t)(v387 + 1) >> 62) {
        sub_24C667470();
      }
      uint64_t v389 = v587 - (unsigned char *)v585;
      if ((v587 - (unsigned char *)v585) >> 1 > v388) {
        unint64_t v388 = v389 >> 1;
      }
      if ((unint64_t)v389 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v390 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v390 = v388;
      }
      if (v390)
      {
        if (v390 >> 62) {
          sub_24C66DB48();
        }
        v391 = (char *)operator new(4 * v390);
        v392 = &v391[4 * v387];
        *(_DWORD *)v392 = v379;
        v384 = v392 + 4;
        if (v383 == v385) {
          goto LABEL_541;
        }
LABEL_535:
        unint64_t v394 = v383 - 4 - v385;
        if (v394 < 0x2C) {
          goto LABEL_883;
        }
        if ((unint64_t)(v383 - &v391[v386]) < 0x20) {
          goto LABEL_883;
        }
        uint64_t v395 = (v394 >> 2) + 1;
        uint64_t v396 = 4 * (v395 & 0x7FFFFFFFFFFFFFF8);
        v397 = &v383[-v396];
        v392 -= v396;
        v398 = &v391[v386 - 16];
        v399 = v383 - 16;
        uint64_t v400 = v395 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v401 = *(_OWORD *)v399;
          *((_OWORD *)v398 - 1) = *((_OWORD *)v399 - 1);
          *(_OWORD *)v398 = v401;
          v398 -= 32;
          v399 -= 32;
          v400 -= 8;
        }
        while (v400);
        v383 = v397;
        if (v395 != (v395 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_883:
          do
          {
            int v402 = *((_DWORD *)v383 - 1);
            v383 -= 4;
            *((_DWORD *)v392 - 1) = v402;
            v392 -= 4;
          }
          while (v383 != v385);
        }
        goto LABEL_541;
      }
      v391 = 0;
      v392 = (char *)(4 * v387);
      v393 = (_DWORD *)(4 * v387);
      _DWORD *v393 = v379;
      v384 = (char *)(v393 + 1);
      if (v383 != v385) {
        goto LABEL_535;
      }
LABEL_541:
      v585 = v392;
      v586 = v384;
      v587 = &v391[4 * v390];
      if (v385) {
        operator delete(v385);
      }
LABEL_543:
      v586 = v384;
      if ((v582[23] & 0x80000000) != 0)
      {
        operator delete(*(void **)v582);
        int v403 = (int)__p[2];
        v405 = v597;
        v404 = v598;
        if (v597 < v598)
        {
LABEL_545:
          *(_DWORD *)v405 = v403;
          v406 = v405 + 4;
          goto LABEL_566;
        }
      }
      else
      {
        int v403 = (int)__p[2];
        v405 = v597;
        v404 = v598;
        if (v597 < v598) {
          goto LABEL_545;
        }
      }
      v407 = (char *)v596;
      int64_t v408 = v405 - (unsigned char *)v596;
      uint64_t v409 = (v405 - (unsigned char *)v596) >> 2;
      unint64_t v410 = v409 + 1;
      if ((unint64_t)(v409 + 1) >> 62) {
        sub_24C667470();
      }
      uint64_t v411 = v404 - (unsigned char *)v596;
      if (v411 >> 1 > v410) {
        unint64_t v410 = v411 >> 1;
      }
      if ((unint64_t)v411 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v412 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v412 = v410;
      }
      if (v412)
      {
        if (v412 >> 62) {
          sub_24C66DB48();
        }
        v413 = operator new(4 * v412);
        v414 = &v413[4 * v409];
        *(_DWORD *)v414 = v403;
        v406 = v414 + 4;
        if (v405 == v407) {
          goto LABEL_564;
        }
LABEL_558:
        unint64_t v416 = v405 - 4 - v407;
        if (v416 < 0x2C) {
          goto LABEL_884;
        }
        if ((unint64_t)(v405 - &v413[v408]) < 0x20) {
          goto LABEL_884;
        }
        uint64_t v417 = (v416 >> 2) + 1;
        uint64_t v418 = 4 * (v417 & 0x7FFFFFFFFFFFFFF8);
        v419 = &v405[-v418];
        v414 -= v418;
        v420 = &v413[v408 - 16];
        v421 = v405 - 16;
        uint64_t v422 = v417 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v423 = *(_OWORD *)v421;
          *(v420 - 1) = *((_OWORD *)v421 - 1);
          _OWORD *v420 = v423;
          v420 -= 2;
          v421 -= 32;
          v422 -= 8;
        }
        while (v422);
        v405 = v419;
        if (v417 != (v417 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_884:
          do
          {
            int v424 = *((_DWORD *)v405 - 1);
            v405 -= 4;
            *((_DWORD *)v414 - 1) = v424;
            v414 -= 4;
          }
          while (v405 != v407);
        }
        goto LABEL_564;
      }
      v413 = 0;
      v414 = (char *)(4 * v409);
      v415 = (_DWORD *)(4 * v409);
      _DWORD *v415 = v403;
      v406 = (char *)(v415 + 1);
      if (v405 != v407) {
        goto LABEL_558;
      }
LABEL_564:
      v596 = v414;
      v597 = v406;
      v598 = &v413[4 * v412];
      if (v407) {
        operator delete(v407);
      }
LABEL_566:
      v597 = v406;
      v425 = v594;
      if (v594 < v595)
      {
        *(_DWORD *)v594 = 1;
        uint64_t v426 = (uint64_t)(v425 + 4);
        goto LABEL_587;
      }
      v427 = (char *)v593;
      int64_t v428 = v594 - (unsigned char *)v593;
      uint64_t v429 = (v594 - (unsigned char *)v593) >> 2;
      unint64_t v430 = v429 + 1;
      if ((unint64_t)(v429 + 1) >> 62) {
        sub_24C667470();
      }
      uint64_t v431 = v595 - (unsigned char *)v593;
      if ((v595 - (unsigned char *)v593) >> 1 > v430) {
        unint64_t v430 = v431 >> 1;
      }
      if ((unint64_t)v431 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v432 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v432 = v430;
      }
      if (v432)
      {
        if (v432 >> 62) {
          sub_24C66DB48();
        }
        v433 = (char *)operator new(4 * v432);
        v434 = &v433[4 * v429];
        *(_DWORD *)v434 = 1;
        uint64_t v426 = (uint64_t)(v434 + 4);
        if (v425 == v427) {
          goto LABEL_585;
        }
LABEL_579:
        unint64_t v435 = v425 - 4 - v427;
        if (v435 < 0x2C) {
          goto LABEL_885;
        }
        if ((unint64_t)(v425 - &v433[v428]) < 0x20) {
          goto LABEL_885;
        }
        uint64_t v436 = (v435 >> 2) + 1;
        uint64_t v437 = 4 * (v436 & 0x7FFFFFFFFFFFFFF8);
        v438 = &v425[-v437];
        v434 -= v437;
        v439 = &v433[v428 - 16];
        v440 = v425 - 16;
        uint64_t v441 = v436 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v442 = *(_OWORD *)v440;
          *((_OWORD *)v439 - 1) = *((_OWORD *)v440 - 1);
          *(_OWORD *)v439 = v442;
          v439 -= 32;
          v440 -= 32;
          v441 -= 8;
        }
        while (v441);
        v425 = v438;
        if (v436 != (v436 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_885:
          do
          {
            int v443 = *((_DWORD *)v425 - 1);
            v425 -= 4;
            *((_DWORD *)v434 - 1) = v443;
            v434 -= 4;
          }
          while (v425 != v427);
        }
        goto LABEL_585;
      }
      v433 = 0;
      v434 = (char *)(4 * v429);
      *(_DWORD *)(4 * v429) = 1;
      uint64_t v426 = 4 * v429 + 4;
      if (v425 != v427) {
        goto LABEL_579;
      }
LABEL_585:
      v593 = v434;
      v594 = (char *)v426;
      v595 = &v433[4 * v432];
      if (v427) {
        operator delete(v427);
      }
LABEL_587:
      v594 = (char *)v426;
      if ((__dst[23] & 0x80000000) != 0) {
        operator delete(*(void **)__dst);
      }
      ++v172;
    }
    while (v172 != 2);
  }
  v444 = (char *)v591[0];
  unint64_t v445 = ((char *)v591[1] - (char *)v591[0]) / 24;
  memset(&v584, 0, sizeof(v584));
  if (v445 >> 62) {
    sub_24C667470();
  }
  size_t v446 = 4 * v445;
  v447 = operator new(4 * v445);
  std::string::size_type v448 = (std::string::size_type)v447 + 4 * v445;
  v584.__r_.__value_.__r.__words[0] = (std::string::size_type)v447;
  v584.__r_.__value_.__r.__words[2] = v448;
  memset_pattern16(v447, &unk_24C7304D0, v446);
  v584.__r_.__value_.__l.__size_ = v448;
  v572 = operator new(v446);
  memset_pattern16(v572, &unk_24C7304E0, v446);
  v449 = 0;
  unint64_t v450 = 0;
  v609 = 0;
  v610 = 0;
  v611 = 0;
  while (2)
  {
    v455 = &v444[24 * v450];
    if (v455[23] < 0)
    {
      v455 = *(char **)v455;
      v456 = v611;
      if (v449 >= v611) {
        goto LABEL_624;
      }
      goto LABEL_618;
    }
    v456 = v611;
    if (v449 < v611)
    {
LABEL_618:
      *(void *)v449 = v455;
      v449 += 8;
      goto LABEL_619;
    }
LABEL_624:
    v457 = v609;
    int64_t v458 = v449 - v609;
    uint64_t v459 = (v449 - v609) >> 3;
    unint64_t v460 = v459 + 1;
    if ((unint64_t)(v459 + 1) >> 61) {
      sub_24C667470();
    }
    uint64_t v461 = v456 - v609;
    if (v461 >> 2 > v460) {
      unint64_t v460 = v461 >> 2;
    }
    if ((unint64_t)v461 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v462 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v462 = v460;
    }
    if (!v462)
    {
      v463 = 0;
      v464 = (char *)(8 * v459);
      v469 = (char **)(8 * v459);
      *v469 = v455;
      v465 = (const char *)(v469 + 1);
      if (v449 != v457) {
        goto LABEL_633;
      }
LABEL_639:
      v609 = v464;
      v610 = v465;
      v611 = &v463[8 * v462];
      if (!v449) {
        goto LABEL_641;
      }
      goto LABEL_640;
    }
    if (v462 >> 61) {
      sub_24C66DB48();
    }
    v463 = operator new(8 * v462);
    v464 = &v463[8 * v459];
    *(void *)v464 = v455;
    v465 = v464 + 8;
    if (v449 == v457) {
      goto LABEL_639;
    }
LABEL_633:
    unint64_t v466 = v449 - 8 - v457;
    if (v466 < 0x168)
    {
      v467 = v449;
      goto LABEL_635;
    }
    if (&v463[v458 - 8 - (v466 & 0xFFFFFFFFFFFFFFF8)] > &v463[v458 - 8])
    {
      v467 = v449;
      goto LABEL_635;
    }
    if (&v449[-(v466 & 0xFFFFFFFFFFFFFFF8) - 8] > v449 - 8)
    {
      v467 = v449;
      goto LABEL_635;
    }
    if ((unint64_t)(v457 - v463) < 0x20)
    {
      v467 = v449;
      goto LABEL_635;
    }
    uint64_t v470 = (v466 >> 3) + 1;
    uint64_t v471 = 8 * (v470 & 0x3FFFFFFFFFFFFFFCLL);
    v467 = &v449[-v471];
    v464 -= v471;
    v472 = &v463[v458 - 16];
    v473 = v449 - 16;
    uint64_t v474 = v470 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v475 = *(_OWORD *)v473;
      *(v472 - 1) = *((_OWORD *)v473 - 1);
      _OWORD *v472 = v475;
      v472 -= 2;
      v473 -= 32;
      v474 -= 4;
    }
    while (v474);
    if (v470 != (v470 & 0x3FFFFFFFFFFFFFFCLL))
    {
      do
      {
LABEL_635:
        uint64_t v468 = *((void *)v467 - 1);
        v467 -= 8;
        *((void *)v464 - 1) = v468;
        v464 -= 8;
      }
      while (v467 != v457);
    }
    v449 = v609;
    v609 = v464;
    v610 = v465;
    v611 = &v463[8 * v462];
    if (v449) {
LABEL_640:
    }
      operator delete(v449);
LABEL_641:
    v449 = (char *)v465;
LABEL_619:
    v610 = v449;
    ++v450;
    v444 = (char *)v591[0];
    if (v450 < 0xAAAAAAAAAAAAAAABLL * (((char *)v591[1] - (char *)v591[0]) >> 3)) {
      continue;
    }
    break;
  }
  v571 = v572;
  espresso_network_change_input_blob_shapes_seq_rank();
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v579->_stateOutputEspressoBuffers.__tree_.__begin_node_;
  p_stateOutputEspressoBuffers = (uint64_t **)&v579->_stateOutputEspressoBuffers;
  if (begin_node != &v579->_stateOutputEspressoBuffers.__tree_.__pair1_)
  {
    while (2)
    {
      sub_24C6D5A80(__p, (long long *)&begin_node[4]);
      espresso_network_declare_output();
      if (v600)
      {
        v601 = v600;
        operator delete(v600);
      }
      if (SHIBYTE(__p[2]) < 0)
      {
        operator delete(__p[0]);
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[1].__value_.__left_;
        if (left) {
          goto LABEL_661;
        }
        do
        {
LABEL_663:
          v478 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v479 = v478->__value_.__left_ == begin_node;
          begin_node = v478;
        }
        while (!v479);
      }
      else
      {
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[1].__value_.__left_;
        if (!left) {
          goto LABEL_663;
        }
        do
        {
LABEL_661:
          v478 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      begin_node = v478;
      if (v478 == &v579->_stateOutputEspressoBuffers.__tree_.__pair1_) {
        break;
      }
      continue;
    }
  }
  p_pair1 = &v579->_stateOutputEspressoBuffers.__tree_.__pair1_;
  v480 = v579;
  espresso_plan_build();
  v481 = (long long *)v579->_stateInputEspressoBuffers.__tree_.__begin_node_;
  p_stateInputEspressoBuffers = (uint64_t **)&v579->_stateInputEspressoBuffers;
  v482 = &v579->_stateInputEspressoBuffers.__tree_.__pair1_;
  if (v481 != (long long *)&v579->_stateInputEspressoBuffers.__tree_.__pair1_)
  {
    __vala = &v579->_stateInputEspressoBuffersShape.__tree_.__pair1_;
    do
    {
      sub_24C6D5A80(__p, v481 + 2);
      int blob_shape = espresso_network_query_blob_shape();
      if (blob_shape)
      {
        if (a4)
        {
          v487 = __p;
          if (SHIBYTE(__p[2]) < 0) {
            v487 = (void **)__p[0];
          }
          v488 = objc_msgSend_stringWithFormat_(NSString, v483, @"Not able to fetch shape for blob %s!", v484, v485, v487, v571);
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v489, (uint64_t)v488, v490, v491);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        std::string::size_type v492 = v605.__r_.__value_.__r.__words[0];
        if (v605.__r_.__value_.__r.__words[0])
        {
          std::string::size_type v493 = 0;
          unint64_t v494 = 1;
          while (1)
          {
            uint64_t v581 = *(void *)&__dst[8 * v493];
            v495 = &v579->_stateInputEspressoBuffersShape.__tree_.__pair1_;
            v496 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)__vala->__value_.__left_;
            v497 = &v579->_stateInputEspressoBuffersShape.__tree_.__pair1_;
            if (__vala->__value_.__left_) {
              break;
            }
LABEL_708:
            v509 = (char *)operator new(0x50uLL);
            v510 = v509 + 32;
            if (SHIBYTE(__p[2]) < 0)
            {
              sub_24C66E0A8(v510, __p[0], (unint64_t)__p[1]);
            }
            else
            {
              *(_OWORD *)v510 = *(_OWORD *)__p;
              *((void **)v509 + 6) = __p[2];
            }
            *((void *)v509 + 7) = 0;
            *((void *)v509 + 8) = 0;
            *((void *)v509 + 9) = 0;
            *(void *)v509 = 0;
            *((void *)v509 + 1) = 0;
            *((void *)v509 + 2) = v495;
            v497->__value_.__left_ = v509;
            v511 = *(void **)v579->_stateInputEspressoBuffersShape.__tree_.__begin_node_;
            v512 = v509;
            if (v511)
            {
              v579->_stateInputEspressoBuffersShape.__tree_.__begin_node_ = v511;
              v512 = (char *)v497->__value_.__left_;
            }
            v513 = (char *)__vala->__value_.__left_;
            BOOL v479 = v512 == __vala->__value_.__left_;
            v512[24] = v479;
            if (!v479)
            {
              do
              {
                uint64_t v514 = *((void *)v512 + 2);
                if (*(unsigned char *)(v514 + 24)) {
                  break;
                }
                v515 = *(char **)(v514 + 16);
                uint64_t v516 = *(void *)v515;
                if (*(void *)v515 == v514)
                {
                  uint64_t v519 = *((void *)v515 + 1);
                  if (!v519 || (int v520 = *(unsigned __int8 *)(v519 + 24), v517 = (unsigned char *)(v519 + 24), v520))
                  {
                    if (*(char **)v514 == v512)
                    {
                      *(unsigned char *)(v514 + 24) = 1;
                      v515[24] = 0;
                      uint64_t v523 = *(void *)(v514 + 8);
                      *(void *)v515 = v523;
                      if (v523) {
                        goto LABEL_728;
                      }
                    }
                    else
                    {
                      v521 = *(uint64_t **)(v514 + 8);
                      uint64_t v522 = *v521;
                      *(void *)(v514 + 8) = *v521;
                      if (v522)
                      {
                        *(void *)(v522 + 16) = v514;
                        v515 = *(char **)(v514 + 16);
                      }
                      v521[2] = (uint64_t)v515;
                      *(void *)(*(void *)(v514 + 16) + 8 * (**(void **)(v514 + 16) != v514)) = v521;
                      uint64_t *v521 = v514;
                      *(void *)(v514 + 16) = v521;
                      v515 = (char *)v521[2];
                      uint64_t v514 = *(void *)v515;
                      *((unsigned char *)v521 + 24) = 1;
                      v515[24] = 0;
                      uint64_t v523 = *(void *)(v514 + 8);
                      *(void *)v515 = v523;
                      if (v523) {
LABEL_728:
                      }
                        *(void *)(v523 + 16) = v515;
                    }
                    *(void *)(v514 + 16) = *((void *)v515 + 2);
                    *(void *)(*((void *)v515 + 2) + 8 * (**((void **)v515 + 2) != (void)v515)) = v514;
                    *(void *)(v514 + 8) = v515;
LABEL_678:
                    *((void *)v515 + 2) = v514;
                    break;
                  }
                }
                else if (!v516 || (int v518 = *(unsigned __int8 *)(v516 + 24), v517 = (unsigned char *)(v516 + 24), v518))
                {
                  if (*(char **)v514 == v512)
                  {
                    uint64_t v525 = *((void *)v512 + 1);
                    *(void *)uint64_t v514 = v525;
                    if (v525)
                    {
                      *(void *)(v525 + 16) = v514;
                      v515 = *(char **)(v514 + 16);
                    }
                    *((void *)v512 + 2) = v515;
                    *(void *)(*(void *)(v514 + 16) + 8 * (**(void **)(v514 + 16) != v514)) = v512;
                    *((void *)v512 + 1) = v514;
                    *(void *)(v514 + 16) = v512;
                    v515 = (char *)*((void *)v512 + 2);
                    v512[24] = 1;
                    v515[24] = 0;
                    uint64_t v514 = *((void *)v515 + 1);
                    v524 = *(char **)v514;
                    *((void *)v515 + 1) = *(void *)v514;
                    if (!v524) {
                      goto LABEL_677;
                    }
                  }
                  else
                  {
                    *(unsigned char *)(v514 + 24) = 1;
                    v515[24] = 0;
                    uint64_t v514 = *((void *)v515 + 1);
                    v524 = *(char **)v514;
                    *((void *)v515 + 1) = *(void *)v514;
                    if (!v524) {
                      goto LABEL_677;
                    }
                  }
                  *((void *)v524 + 2) = v515;
LABEL_677:
                  *(void *)(v514 + 16) = *((void *)v515 + 2);
                  *(void *)(*((void *)v515 + 2) + 8 * (**((void **)v515 + 2) != (void)v515)) = v514;
                  *(void *)uint64_t v514 = v515;
                  goto LABEL_678;
                }
                *(unsigned char *)(v514 + 24) = 1;
                v512 = v515;
                v515[24] = v515 == v513;
                unsigned char *v517 = 1;
              }
              while (v515 != v513);
            }
            ++v579->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_;
            std::string::size_type v492 = v605.__r_.__value_.__r.__words[0];
LABEL_680:
            v494 *= v581;
            *(void *)(*((void *)v509 + 7) + 8 * (v492 + ~v493++)) = v581;
            std::string::size_type v492 = v605.__r_.__value_.__r.__words[0];
            if (v493 >= v605.__r_.__value_.__r.__words[0]) {
              goto LABEL_741;
            }
          }
          if (SHIBYTE(__p[2]) >= 0) {
            v498 = __p;
          }
          else {
            v498 = (void **)__p[0];
          }
          if (SHIBYTE(__p[2]) >= 0) {
            v499 = (void *)HIBYTE(__p[2]);
          }
          else {
            v499 = __p[1];
          }
          while (1)
          {
            v495 = v496;
            v502 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v496[4].__value_.__left_;
            v500 = v496 + 4;
            v501 = v502;
            int left_high = SHIBYTE(v500[2].__value_.__left_);
            if (left_high >= 0) {
              v504 = v500;
            }
            else {
              v504 = v501;
            }
            if (left_high >= 0) {
              size_t v505 = HIBYTE(v500[2].__value_.__left_);
            }
            else {
              size_t v505 = (size_t)v500[1].__value_.__left_;
            }
            if (v505 >= (unint64_t)v499) {
              size_t v506 = (size_t)v499;
            }
            else {
              size_t v506 = v505;
            }
            int v507 = memcmp(v498, v504, v506);
            if (v507)
            {
              if (v507 < 0) {
                goto LABEL_688;
              }
            }
            else if ((unint64_t)v499 < v505)
            {
LABEL_688:
              v496 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v495->__value_.__left_;
              v497 = v495;
              if (!v495->__value_.__left_) {
                goto LABEL_708;
              }
              continue;
            }
            int v508 = memcmp(v504, v498, v506);
            if (v508)
            {
              if ((v508 & 0x80000000) == 0) {
                goto LABEL_730;
              }
            }
            else if (v505 >= (unint64_t)v499)
            {
LABEL_730:
              v509 = (char *)v495;
              goto LABEL_680;
            }
            v496 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v495[1].__value_.__left_;
            if (!v496)
            {
              v497 = v495 + 1;
              goto LABEL_708;
            }
          }
        }
        unint64_t v494 = 1;
LABEL_741:
        *(void *)v582 = __p;
        v526 = sub_24C6D6830(p_stateInputEspressoBuffers, (const void **)__p, (uint64_t)&unk_24C72FF38, (long long **)v582);
        v482 = &v579->_stateInputEspressoBuffers.__tree_.__pair1_;
        int blob_shape = 0;
        if (v494 > ((char *)v526[8] - (char *)v526[7]) >> 2)
        {
          *(void *)v582 = __p;
          v527 = sub_24C6D6830(p_stateInputEspressoBuffers, (const void **)__p, (uint64_t)&unk_24C72FF38, (long long **)v582);
          v528 = v527[7];
          unint64_t v529 = ((char *)v527[8] - (char *)v528) >> 2;
          if (v494 <= v529)
          {
            if (v494 < v529) {
              v527[8] = (uint64_t *)((char *)v528 + 4 * v494);
            }
          }
          else
          {
            sub_24C6D5B74((uint64_t)(v527 + 7), v494 - v529);
          }
        }
      }
      if (v600)
      {
        v601 = v600;
        operator delete(v600);
      }
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
      v480 = v579;
      if (blob_shape) {
        goto LABEL_822;
      }
      v530 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)*((void *)v481 + 1);
      if (v530)
      {
        do
        {
          v531 = v530;
          v530 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v530->__value_.__left_;
        }
        while (v530);
      }
      else
      {
        do
        {
          v531 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)*((void *)v481 + 2);
          BOOL v479 = v531->__value_.__left_ == v481;
          v481 = (long long *)v531;
        }
        while (!v479);
      }
      v481 = (long long *)v531;
    }
    while (v531 != v482);
  }
  memset(v582, 0, sizeof(v582));
  int v583 = 1065353216;
  v532 = *p_stateOutputEspressoBuffers;
  if (*p_stateOutputEspressoBuffers != (uint64_t *)p_pair1)
  {
    while (2)
    {
      sub_24C6D5A80(__dst, (long long *)v532 + 2);
      int v536 = espresso_network_query_blob_shape();
      if (v536)
      {
        if (a4)
        {
          if (__dst[23] >= 0) {
            objc_msgSend_stringWithFormat_(NSString, v533, @"Not able to fetch shape for blob %s!", v534, v535, __dst);
          }
          else {
          v537 = objc_msgSend_stringWithFormat_(NSString, v533, @"Not able to fetch shape for blob %s!", v534, v535, *(void *)__dst);
          }
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v538, (uint64_t)v537, v539, v540);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_792:
        if (v607)
        {
          v608 = v607;
          operator delete(v607);
        }
        if ((__dst[23] & 0x80000000) != 0) {
          operator delete(*(void **)__dst);
        }
        if (v536) {
          goto LABEL_821;
        }
        v562 = (uint64_t *)v532[1];
        if (v562)
        {
          do
          {
            v563 = v562;
            v562 = (uint64_t *)*v562;
          }
          while (v562);
        }
        else
        {
          do
          {
            v563 = (uint64_t *)v532[2];
            BOOL v479 = *v563 == (void)v532;
            v532 = v563;
          }
          while (!v479);
        }
        v532 = v563;
        if (v563 == (uint64_t *)p_pair1) {
          goto LABEL_803;
        }
        continue;
      }
      break;
    }
    if (v604)
    {
      if (v604 == 1)
      {
        unint64_t v541 = 0;
        unint64_t v542 = 1;
        goto LABEL_773;
      }
      unint64_t v541 = v604 & 0xFFFFFFFFFFFFFFFELL;
      unint64_t v543 = v604 & 0xFFFFFFFFFFFFFFFELL;
      p_std::string::size_type size = &v605.__r_.__value_.__l.__size_;
      uint64_t v545 = 1;
      uint64_t v546 = 1;
      do
      {
        v545 *= *(p_size - 1);
        v546 *= *p_size;
        p_size += 2;
        v543 -= 2;
      }
      while (v543);
      unint64_t v542 = v546 * v545;
      if (v604 != v541)
      {
LABEL_773:
        uint64_t v547 = v604 - v541;
        v548 = &v605.__r_.__value_.__r.__words[v541];
        do
        {
          uint64_t v549 = *v548++;
          v542 *= v549;
          --v547;
        }
        while (v547);
      }
    }
    else
    {
      unint64_t v542 = 1;
    }
    __p[0] = __dst;
    v550 = sub_24C6D6830(p_stateOutputEspressoBuffers, (const void **)__dst, (uint64_t)&unk_24C72FF38, (long long **)__p);
    if (v542 > ((char *)v550[8] - (char *)v550[7]) >> 2)
    {
      __p[0] = __dst;
      v551 = sub_24C6D6830(p_stateOutputEspressoBuffers, (const void **)__dst, (uint64_t)&unk_24C72FF38, (long long **)__p);
      v552 = v551[7];
      unint64_t v553 = ((char *)v551[8] - (char *)v552) >> 2;
      if (v542 <= v553)
      {
        if (v542 < v553) {
          v551[8] = (uint64_t *)((char *)v552 + 4 * v542);
        }
      }
      else
      {
        sub_24C6D5B74((uint64_t)(v551 + 7), v542 - v553);
      }
    }
    v554 = (uint64_t *)*((void *)v579->_decoderNet.__ptr_ + 1);
    *(void *)v612 = __dst;
    v555 = sub_24C6D6830(p_stateOutputEspressoBuffers, (const void **)__dst, (uint64_t)&unk_24C72FF38, (long long **)v612);
    sub_24C6D2768((uint64_t)__p, *v554, v554[1], (uint64_t)__dst, (uint64_t)v555[7]);
    *(void *)v612 = __dst;
    v556 = sub_24C6707E0((uint64_t)v582, (uint64_t)__dst, (uint64_t)&unk_24C72FF38, (long long **)v612);
    v557 = v556;
    *((_DWORD *)v556 + 12) = __p[1];
    if (v556 + 5 != (uint64_t *)__p) {
      sub_24C670F38(v556 + 7, (char *)__p[2], (char *)v600, (int64_t)((uint64_t)v600 - (unint64_t)__p[2]) >> 3);
    }
    uint64_t v559 = v602;
    v558 = v603;
    v480 = v579;
    if (v603) {
      atomic_fetch_add_explicit(&v603->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v560 = (std::__shared_weak_count *)v557[11];
    v557[10] = v559;
    v557[11] = (uint64_t)v558;
    if (v560 && !atomic_fetch_add(&v560->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v560->__on_zero_shared)(v560);
      std::__shared_weak_count::__release_weak(v560);
    }
    __p[0] = &unk_26FEDD950;
    v561 = v603;
    if (v603 && !atomic_fetch_add(&v603->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v561->__on_zero_shared)(v561);
      std::__shared_weak_count::__release_weak(v561);
    }
    if (__p[2])
    {
      v600 = __p[2];
      operator delete(__p[2]);
    }
    goto LABEL_792;
  }
LABEL_803:
  v564 = (uint64_t *)*((void *)v480->_decoderNet.__ptr_ + 1);
  __dst[23] = 10;
  strcpy(__dst, "word_probs");
  sub_24C6D2768((uint64_t)__p, *v564, v564[1], (uint64_t)__dst, (uint64_t)v480->_wordProbs.__begin_);
  *((unsigned char *)&v605.__r_.__value_.__s + 23) = 10;
  strcpy((char *)&v605, "word_probs");
  *(void *)v612 = &v605;
  v565 = sub_24C67DB18((uint64_t)v582, (uint64_t)&v605, (uint64_t)&unk_24C72FF38, (long long **)v612);
  v566 = v565;
  *((_DWORD *)v565 + 12) = __p[1];
  if (v565 + 40 != (unsigned __int8 *)__p) {
    sub_24C670F38((void *)v565 + 7, (char *)__p[2], (char *)v600, (int64_t)((uint64_t)v600 - (unint64_t)__p[2]) >> 3);
  }
  uint64_t v568 = v602;
  v567 = v603;
  if (v603) {
    atomic_fetch_add_explicit(&v603->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v569 = (std::__shared_weak_count *)*((void *)v566 + 11);
  *((void *)v566 + 10) = v568;
  *((void *)v566 + 11) = v567;
  if (v569 && !atomic_fetch_add(&v569->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v569->__on_zero_shared)(v569);
    std::__shared_weak_count::__release_weak(v569);
  }
  if (SHIBYTE(v605.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v605.__r_.__value_.__l.__data_);
  }
  __p[0] = &unk_26FEDD950;
  v570 = v603;
  if (v603 && !atomic_fetch_add(&v603->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v570->__on_zero_shared)(v570);
    std::__shared_weak_count::__release_weak(v570);
  }
  if (__p[2])
  {
    v600 = __p[2];
    operator delete(__p[2]);
  }
  if ((__dst[23] & 0x80000000) != 0) {
    operator delete(*(void **)__dst);
  }
  if (&v579->_outputTensors != (unordered_map<std::string, ik::EspressoTensor, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, ik::EspressoTensor>>> *)v582)
  {
    LODWORD(v579->_outputTensors.__table_.__p3_.__value_) = v583;
    sub_24C6D7300(&v579->_outputTensors.__table_.__bucket_list_.__ptr_.__value_, *(void **)&v582[16], 0);
  }
LABEL_821:
  sub_24C6717DC((uint64_t)v582);
LABEL_822:
  if (v609) {
    operator delete(v609);
  }
  operator delete(v572);
  v451 = (void *)v584.__r_.__value_.__r.__words[0];
  if (v584.__r_.__value_.__r.__words[0]) {
    goto LABEL_600;
  }
LABEL_601:
  if (v585)
  {
    v586 = (char *)v585;
    operator delete(v585);
  }
  if (v588)
  {
    v589 = (char *)v588;
    operator delete(v588);
  }
  v452 = (void **)v591[0];
  if (v591[0])
  {
    v453 = (void **)v591[1];
    v454 = v591[0];
    if (v591[1] != v591[0])
    {
      do
      {
        if (*((char *)v453 - 1) < 0) {
          operator delete(*(v453 - 3));
        }
        v453 -= 3;
      }
      while (v453 != v452);
      v454 = v591[0];
    }
    v591[1] = v452;
    operator delete(v454);
  }
  if (v593)
  {
    v594 = (char *)v593;
    operator delete(v593);
  }
  if (v596)
  {
    v597 = (char *)v596;
    operator delete(v596);
  }
}

- (void)copyInputContextIDs:(const void *)a3 EncoderFeatures:(const void *)a4 KVCache:(const void *)a5 MaskPosition:(unint64_t)a6
{
  long long v80 = 0u;
  long long v81 = 0u;
  float v82 = 1.0;
  __p[23] = 21;
  strcpy(__p, "att_feats_placeholder");
  v77 = __p;
  unint64_t v11 = sub_24C6D7E88((uint64_t)&v80, (uint64_t)__p, (uint64_t)&unk_24C72FF38, (long long **)&v77);
  uint64_t v12 = v11;
  *((_DWORD *)v11 + 12) = *((_DWORD *)a4 + 2);
  if (v11 + 40 != a4) {
    sub_24C670F38((void *)v11 + 7, *((char **)a4 + 2), *((char **)a4 + 3), (uint64_t)(*((void *)a4 + 3) - *((void *)a4 + 2)) >> 3);
  }
  uint64_t v14 = *((void *)a4 + 5);
  uint64_t v13 = *((void *)a4 + 6);
  if (v13) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
  }
  v15 = (std::__shared_weak_count *)*((void *)v12 + 11);
  *((void *)v12 + 10) = v14;
  *((void *)v12 + 11) = v13;
  if (!v15 || atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((__p[23] & 0x80000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
  std::__shared_weak_count::__release_weak(v15);
  if ((__p[23] & 0x80000000) != 0) {
LABEL_8:
  }
    operator delete(*(void **)__p);
LABEL_9:
  unint64_t v16 = a6 + 1;
  v77 = 0;
  v78 = 0;
  uint64_t v79 = 0;
  if ((a6 + 1) >> 62) {
    sub_24C667470();
  }
  uint64_t v17 = operator new(4 * v16);
  uint64_t v18 = &v17[v16];
  v77 = v17;
  uint64_t v79 = v18;
  bzero(v17, 4 * a6 + 4);
  v78 = (float *)v18;
  _DWORD *v17 = 0;
  uint64_t v19 = *(uint32x4_t **)a3;
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    if (a6)
    {
      unint64_t v20 = (a6 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      v21 = v17;
      uint64_t v22 = *(unsigned int **)a3;
      if (v20 < 7) {
        goto LABEL_16;
      }
      unint64_t v23 = v20 + 1;
      uint64_t v24 = v23 & 0x7FFFFFFFFFFFFFF8;
      v21 = &v17[v24];
      uint64_t v22 = &v19->u32[v24];
      v25 = v19 + 1;
      v26 = (float32x4_t *)(v17 + 5);
      uint64_t v27 = v23 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        float32x4_t v28 = vcvtq_f32_u32(*v25);
        v26[-1] = vcvtq_f32_u32(v25[-1]);
        float32x4_t *v26 = v28;
        v25 += 2;
        v26 += 2;
        v27 -= 8;
      }
      while (v27);
      if (v23 != (v23 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_16:
        uint64_t v29 = (unsigned int *)v19 + a6;
        unint64_t v30 = (float *)(v21 + 1);
        do
        {
          unsigned int v31 = *v22++;
          *v30++ = (float)v31;
        }
        while (v22 != v29);
      }
    }
  }
  *(_DWORD *)__p = v17[a6];
  sub_24C69DCB4(&self->_inWords.__begin_, __p, &__p[4], 1uLL);
  unint64_t v32 = (uint64_t *)*((void *)self->_decoderNet.__ptr_ + 1);
  HIBYTE(v72[2]) = 11;
  strcpy((char *)v72, "in_word_ids");
  sub_24C6D2768((uint64_t)__p, *v32, v32[1], (uint64_t)v72, (uint64_t)self->_inWords.__begin_);
  HIBYTE(v71[2]) = 11;
  strcpy((char *)v71, "in_word_ids");
  unint64_t v83 = v71;
  v33 = sub_24C6D7E88((uint64_t)&v80, (uint64_t)v71, (uint64_t)&unk_24C72FF38, (long long **)&v83);
  v34 = v33;
  *((_DWORD *)v33 + 12) = *(_DWORD *)&__p[8];
  if (v33 + 40 != __p) {
    sub_24C670F38((void *)v33 + 7, *(char **)&__p[16], v74, (uint64_t)&v74[-*(void *)&__p[16]] >> 3);
  }
  uint64_t v36 = v75;
  unint64_t v35 = v76;
  if (v76) {
    atomic_fetch_add_explicit(&v76->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v37 = (std::__shared_weak_count *)*((void *)v34 + 11);
  *((void *)v34 + 10) = v36;
  *((void *)v34 + 11) = v35;
  if (v37 && !atomic_fetch_add(&v37->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
    std::__shared_weak_count::__release_weak(v37);
    if ((SHIBYTE(v71[2]) & 0x80000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (SHIBYTE(v71[2]) < 0) {
LABEL_25:
  }
    operator delete(v71[0]);
LABEL_26:
  *(void *)__p = &unk_26FEDD950;
  id v38 = v76;
  if (v76 && !atomic_fetch_add(&v76->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
    std::__shared_weak_count::__release_weak(v38);
  }
  if (*(void *)&__p[16])
  {
    uint64_t v74 = *(char **)&__p[16];
    operator delete(*(void **)&__p[16]);
  }
  if (SHIBYTE(v72[2]) < 0) {
    operator delete(v72[0]);
  }
  v39 = (char *)operator new(4uLL);
  uint64_t v40 = v39;
  *(_DWORD *)v39 = 1065353216;
  float v41 = 0.0;
  if (*(v78 - 1) != 0.0) {
    float v41 = 1.0;
  }
  *(float *)v39 = v41;
  sub_24C69DCB4(&self->_inputMask.__begin_, v39, v39 + 4, 1uLL);
  long long v42 = (uint64_t *)*((void *)self->_decoderNet.__ptr_ + 1);
  HIBYTE(v72[2]) = 16;
  strcpy((char *)v72, "in_word_ids_mask");
  sub_24C6D2768((uint64_t)__p, *v42, v42[1], (uint64_t)v72, (uint64_t)self->_inputMask.__begin_);
  HIBYTE(v71[2]) = 16;
  strcpy((char *)v71, "in_word_ids_mask");
  unint64_t v83 = v71;
  int v43 = sub_24C6D7E88((uint64_t)&v80, (uint64_t)v71, (uint64_t)&unk_24C72FF38, (long long **)&v83);
  v44 = v43;
  *((_DWORD *)v43 + 12) = *(_DWORD *)&__p[8];
  if (v43 + 40 != __p) {
    sub_24C670F38((void *)v43 + 7, *(char **)&__p[16], v74, (uint64_t)&v74[-*(void *)&__p[16]] >> 3);
  }
  uint64_t v46 = v75;
  v45 = v76;
  if (v76) {
    atomic_fetch_add_explicit(&v76->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int64_t v47 = (std::__shared_weak_count *)*((void *)v44 + 11);
  *((void *)v44 + 10) = v46;
  *((void *)v44 + 11) = v45;
  if (v47 && !atomic_fetch_add(&v47->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
    std::__shared_weak_count::__release_weak(v47);
    if ((SHIBYTE(v71[2]) & 0x80000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  if (SHIBYTE(v71[2]) < 0) {
LABEL_42:
  }
    operator delete(v71[0]);
LABEL_43:
  *(void *)__p = &unk_26FEDD950;
  uint64_t v48 = v76;
  if (v76 && !atomic_fetch_add(&v76->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
    std::__shared_weak_count::__release_weak(v48);
  }
  if (*(void *)&__p[16])
  {
    uint64_t v74 = *(char **)&__p[16];
    operator delete(*(void **)&__p[16]);
  }
  if (SHIBYTE(v72[2]) < 0) {
    operator delete(v72[0]);
  }
  uint64_t v50 = v77;
  unint64_t v49 = v78;
  unint64_t v51 = (char *)operator new(4uLL);
  *(float *)unint64_t v51 = (float)(unint64_t)((((char *)v49 - v50) >> 2) - 1);
  sub_24C69DCB4(&self->_positionInput.__begin_, v51, v51 + 4, 1uLL);
  uint64_t v52 = (uint64_t *)*((void *)self->_decoderNet.__ptr_ + 1);
  HIBYTE(v72[2]) = 8;
  strcpy((char *)v72, "position");
  sub_24C6D2768((uint64_t)__p, *v52, v52[1], (uint64_t)v72, (uint64_t)self->_positionInput.__begin_);
  HIBYTE(v71[2]) = 8;
  strcpy((char *)v71, "position");
  unint64_t v83 = v71;
  v53 = sub_24C6D7E88((uint64_t)&v80, (uint64_t)v71, (uint64_t)&unk_24C72FF38, (long long **)&v83);
  unint64_t v54 = v53;
  *((_DWORD *)v53 + 12) = *(_DWORD *)&__p[8];
  if (v53 + 40 != __p) {
    sub_24C670F38((void *)v53 + 7, *(char **)&__p[16], v74, (uint64_t)&v74[-*(void *)&__p[16]] >> 3);
  }
  uint64_t v56 = v75;
  uint64_t v55 = v76;
  if (v76) {
    atomic_fetch_add_explicit(&v76->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v57 = (std::__shared_weak_count *)*((void *)v54 + 11);
  *((void *)v54 + 10) = v56;
  *((void *)v54 + 11) = v55;
  if (v57 && !atomic_fetch_add(&v57->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
    std::__shared_weak_count::__release_weak(v57);
    if ((SHIBYTE(v71[2]) & 0x80000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
  if (SHIBYTE(v71[2]) < 0) {
LABEL_57:
  }
    operator delete(v71[0]);
LABEL_58:
  *(void *)__p = &unk_26FEDD950;
  v58 = v76;
  if (v76 && !atomic_fetch_add(&v76->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
    std::__shared_weak_count::__release_weak(v58);
  }
  if (*(void *)&__p[16])
  {
    uint64_t v74 = *(char **)&__p[16];
    operator delete(*(void **)&__p[16]);
  }
  if (SHIBYTE(v72[2]) < 0) {
    operator delete(v72[0]);
  }
  uint64_t v59 = (char *)operator new(4uLL);
  *(_DWORD *)uint64_t v59 = 1102382323;
  sub_24C69DCB4(&self->_scaleInput.__begin_, v59, v59 + 4, 1uLL);
  uint64_t v60 = (uint64_t *)*((void *)self->_decoderNet.__ptr_ + 1);
  HIBYTE(v72[2]) = 5;
  strcpy((char *)v72, "scale");
  sub_24C6D2768((uint64_t)__p, *v60, v60[1], (uint64_t)v72, (uint64_t)self->_scaleInput.__begin_);
  HIBYTE(v71[2]) = 5;
  strcpy((char *)v71, "scale");
  unint64_t v83 = v71;
  long long v61 = sub_24C6D7E88((uint64_t)&v80, (uint64_t)v71, (uint64_t)&unk_24C72FF38, (long long **)&v83);
  long long v65 = v61;
  *((_DWORD *)v61 + 12) = *(_DWORD *)&__p[8];
  if (v61 + 40 != __p) {
    sub_24C670F38((void *)v61 + 7, *(char **)&__p[16], v74, (uint64_t)&v74[-*(void *)&__p[16]] >> 3);
  }
  uint64_t v67 = v75;
  int64_t v66 = v76;
  if (v76) {
    atomic_fetch_add_explicit(&v76->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v68 = (std::__shared_weak_count *)*((void *)v65 + 11);
  *((void *)v65 + 10) = v67;
  *((void *)v65 + 11) = v66;
  if (v68 && !atomic_fetch_add(&v68->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
    std::__shared_weak_count::__release_weak(v68);
    if ((SHIBYTE(v71[2]) & 0x80000000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }
  if (SHIBYTE(v71[2]) < 0) {
LABEL_72:
  }
    operator delete(v71[0]);
LABEL_73:
  *(void *)__p = &unk_26FEDD950;
  uint64_t v69 = v76;
  if (v76 && !atomic_fetch_add(&v76->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
    std::__shared_weak_count::__release_weak(v69);
  }
  if (*(void *)&__p[16])
  {
    uint64_t v74 = *(char **)&__p[16];
    operator delete(*(void **)&__p[16]);
  }
  if (SHIBYTE(v72[2]) < 0)
  {
    operator delete(v72[0]);
    p_inputTensors = &self->_inputTensors;
    if (&self->_inputTensors == (unordered_map<std::string, ik::Tensor, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, ik::Tensor>>> *)&v80) {
      goto LABEL_83;
    }
    goto LABEL_82;
  }
  p_inputTensors = &self->_inputTensors;
  if (&self->_inputTensors != (unordered_map<std::string, ik::Tensor, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, ik::Tensor>>> *)&v80)
  {
LABEL_82:
    self->_inputTensors.__table_.__p3_.__value_ = v82;
    sub_24C6D82EC(p_inputTensors, (void *)v81, 0);
  }
LABEL_83:
  objc_msgSend_copyInputState_(self, v62, (uint64_t)a5, v63, v64, *(void *)"in_word_ids_mask", *(void *)"ids_mask");
  operator delete(v59);
  operator delete(v51);
  operator delete(v40);
  if (v77) {
    operator delete(v77);
  }
  sub_24C6717DC((uint64_t)&v80);
}

- (void)copyInputState:(const void *)a3
{
  if (!*(void *)a3)
  {
    unint64_t v95 = sub_24C69662C();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24C664000, v95, OS_LOG_TYPE_INFO, "No input state to be copied!", buf, 2u);
    }

    return;
  }
  sub_24C6D86B4((uint64_t)&v111, *(void *)a3);
  v4 = v112;
  if (!v112) {
    goto LABEL_175;
  }
  p_pair1 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
  p_stateInputEspressoBuffers = (uint64_t **)&self->_stateInputEspressoBuffers;
  while (2)
  {
    unint64_t v97 = (char **)v4;
    sub_24C6D5F34(v107, (long long *)v4 + 1);
    int v6 = (char)v108;
    if ((v108 & 0x80u) == 0) {
      size_t v7 = v108;
    }
    else {
      size_t v7 = (size_t)v107[1];
    }
    unint64_t v8 = v7 + 3;
    if (v7 + 3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_24C6673C8();
    }
    if (v8 >= 0x17)
    {
      uint64_t v10 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v8 | 7) != 0x17) {
        uint64_t v10 = v8 | 7;
      }
      uint64_t v11 = v10 + 1;
      p_dst = (long long *)operator new(v10 + 1);
      *((void *)&__dst + 1) = v7 + 3;
      int64_t v106 = v11 | 0x8000000000000000;
      *(void *)&long long __dst = p_dst;
    }
    else
    {
      int64_t v106 = 0;
      long long __dst = 0uLL;
      p_dst = &__dst;
      HIBYTE(v106) = v7 + 3;
      if (!v7) {
        goto LABEL_19;
      }
    }
    if (v6 >= 0) {
      uint64_t v12 = v107;
    }
    else {
      uint64_t v12 = (void **)v107[0];
    }
    memmove(p_dst, v12, v7);
LABEL_19:
    unint64_t v13 = 0;
    *(_DWORD *)((char *)p_dst + v7) = 7235935;
    unint64_t v98 = 1;
LABEL_25:
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)p_pair1->__value_.__left_;
    v15 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
    unint64_t v16 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
    if (!p_pair1->__value_.__left_) {
      goto LABEL_52;
    }
    if (v106 >= 0) {
      uint64_t v17 = &__dst;
    }
    else {
      uint64_t v17 = (long long *)__dst;
    }
    if (v106 >= 0) {
      unint64_t v18 = HIBYTE(v106);
    }
    else {
      unint64_t v18 = *((void *)&__dst + 1);
    }
    while (1)
    {
      while (1)
      {
        unint64_t v16 = left;
        v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)left[4].__value_.__left_;
        uint64_t v19 = left + 4;
        unint64_t v20 = v21;
        int left_high = SHIBYTE(v19[2].__value_.__left_);
        unint64_t v23 = left_high >= 0 ? v19 : v20;
        uint64_t v24 = left_high >= 0 ? (void *)HIBYTE(v19[2].__value_.__left_) : v19[1].__value_.__left_;
        size_t v25 = (unint64_t)v24 >= v18 ? v18 : (size_t)v24;
        int v26 = memcmp(v17, v23, v25);
        if (v26) {
          break;
        }
        if (v18 >= (unint64_t)v24) {
          goto LABEL_46;
        }
LABEL_32:
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v16->__value_.__left_;
        v15 = v16;
        if (!v16->__value_.__left_) {
          goto LABEL_52;
        }
      }
      if (v26 < 0) {
        goto LABEL_32;
      }
LABEL_46:
      int v27 = memcmp(v23, v17, v25);
      if (v27)
      {
        if ((v27 & 0x80000000) == 0) {
          break;
        }
        goto LABEL_50;
      }
      if ((unint64_t)v24 >= v18) {
        break;
      }
LABEL_50:
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v16[1].__value_.__left_;
      if (!left)
      {
        v15 = v16 + 1;
LABEL_52:
        float32x4_t v28 = operator new(0x50uLL);
        uint64_t v29 = v28 + 4;
        if (SHIBYTE(v106) < 0)
        {
          sub_24C66E0A8(v29, (void *)__dst, *((unint64_t *)&__dst + 1));
        }
        else
        {
          *(_OWORD *)uint64_t v29 = __dst;
          v28[6] = v106;
        }
        v28[7] = 0;
        v28[8] = 0;
        v28[9] = 0;
        *float32x4_t v28 = 0;
        v28[1] = 0;
        v28[2] = v16;
        v15->__value_.__left_ = v28;
        unint64_t v30 = *(void **)self->_stateInputEspressoBuffersShape.__tree_.__begin_node_;
        unsigned int v31 = v28;
        if (v30)
        {
          self->_stateInputEspressoBuffersShape.__tree_.__begin_node_ = v30;
          unsigned int v31 = v15->__value_.__left_;
        }
        unint64_t v32 = (uint64_t *)p_pair1->__value_.__left_;
        BOOL v33 = v31 == p_pair1->__value_.__left_;
        *((unsigned char *)v31 + 24) = v33;
        if (!v33)
        {
          do
          {
            uint64_t v34 = v31[2];
            if (*(unsigned char *)(v34 + 24)) {
              break;
            }
            unint64_t v35 = *(uint64_t **)(v34 + 16);
            uint64_t v36 = *v35;
            if (*v35 == v34)
            {
              uint64_t v39 = v35[1];
              if (!v39 || (int v40 = *(unsigned __int8 *)(v39 + 24), v37 = (unsigned char *)(v39 + 24), v40))
              {
                if (*(void **)v34 == v31)
                {
                  *(unsigned char *)(v34 + 24) = 1;
                  *((unsigned char *)v35 + 24) = 0;
                  uint64_t v43 = *(void *)(v34 + 8);
                  *unint64_t v35 = v43;
                  if (v43) {
                    goto LABEL_72;
                  }
                }
                else
                {
                  float v41 = *(uint64_t **)(v34 + 8);
                  uint64_t v42 = *v41;
                  *(void *)(v34 + 8) = *v41;
                  if (v42)
                  {
                    *(void *)(v42 + 16) = v34;
                    unint64_t v35 = *(uint64_t **)(v34 + 16);
                  }
                  v41[2] = (uint64_t)v35;
                  *(void *)(*(void *)(v34 + 16) + 8 * (**(void **)(v34 + 16) != v34)) = v41;
                  *float v41 = v34;
                  *(void *)(v34 + 16) = v41;
                  unint64_t v35 = (uint64_t *)v41[2];
                  uint64_t v34 = *v35;
                  *((unsigned char *)v41 + 24) = 1;
                  *((unsigned char *)v35 + 24) = 0;
                  uint64_t v43 = *(void *)(v34 + 8);
                  *unint64_t v35 = v43;
                  if (v43) {
LABEL_72:
                  }
                    *(void *)(v43 + 16) = v35;
                }
                *(void *)(v34 + 16) = v35[2];
                *(void *)(v35[2] + 8 * (*(void *)v35[2] != (void)v35)) = v34;
                *(void *)(v34 + 8) = v35;
LABEL_80:
                v35[2] = v34;
                break;
              }
            }
            else if (!v36 || (int v38 = *(unsigned __int8 *)(v36 + 24), v37 = (unsigned char *)(v36 + 24), v38))
            {
              if (*(void **)v34 == v31)
              {
                uint64_t v75 = v31[1];
                *(void *)uint64_t v34 = v75;
                if (v75)
                {
                  *(void *)(v75 + 16) = v34;
                  unint64_t v35 = *(uint64_t **)(v34 + 16);
                }
                v31[2] = v35;
                *(void *)(*(void *)(v34 + 16) + 8 * (**(void **)(v34 + 16) != v34)) = v31;
                v31[1] = v34;
                *(void *)(v34 + 16) = v31;
                unint64_t v35 = (uint64_t *)v31[2];
                *((unsigned char *)v31 + 24) = 1;
                *((unsigned char *)v35 + 24) = 0;
                uint64_t v34 = v35[1];
                v44 = *(void **)v34;
                v35[1] = *(void *)v34;
                if (v44) {
LABEL_78:
                }
                  v44[2] = v35;
              }
              else
              {
                *(unsigned char *)(v34 + 24) = 1;
                *((unsigned char *)v35 + 24) = 0;
                uint64_t v34 = v35[1];
                v44 = *(void **)v34;
                v35[1] = *(void *)v34;
                if (v44) {
                  goto LABEL_78;
                }
              }
              *(void *)(v34 + 16) = v35[2];
              *(void *)(v35[2] + 8 * (*(void *)v35[2] != (void)v35)) = v34;
              *(void *)uint64_t v34 = v35;
              goto LABEL_80;
            }
            *(unsigned char *)(v34 + 24) = 1;
            unsigned int v31 = v35;
            *((unsigned char *)v35 + 24) = v35 == v32;
            *uint64_t v37 = 1;
          }
          while (v35 != v32);
        }
        ++self->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_;
        if (v13 >= (uint64_t)(v28[8] - v28[7]) >> 3) {
          goto LABEL_147;
        }
LABEL_82:
        v45 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)p_pair1->__value_.__left_;
        uint64_t v46 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
        int64_t v47 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
        if (p_pair1->__value_.__left_)
        {
          if (v106 >= 0) {
            uint64_t v48 = &__dst;
          }
          else {
            uint64_t v48 = (long long *)__dst;
          }
          if (v106 >= 0) {
            size_t v49 = HIBYTE(v106);
          }
          else {
            size_t v49 = *((void *)&__dst + 1);
          }
          while (1)
          {
            int64_t v47 = v45;
            uint64_t v52 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v45[4].__value_.__left_;
            uint64_t v50 = v45 + 4;
            unint64_t v51 = v52;
            int v53 = SHIBYTE(v50[2].__value_.__left_);
            if (v53 >= 0) {
              unint64_t v54 = v50;
            }
            else {
              unint64_t v54 = v51;
            }
            if (v53 >= 0) {
              size_t v55 = HIBYTE(v50[2].__value_.__left_);
            }
            else {
              size_t v55 = (size_t)v50[1].__value_.__left_;
            }
            if (v55 >= v49) {
              size_t v56 = v49;
            }
            else {
              size_t v56 = v55;
            }
            int v57 = memcmp(v48, v54, v56);
            if (v57)
            {
              if (v57 < 0) {
                goto LABEL_89;
              }
LABEL_103:
              int v58 = memcmp(v54, v48, v56);
              if (v58)
              {
                if ((v58 & 0x80000000) == 0) {
                  goto LABEL_131;
                }
              }
              else if (v55 >= v49)
              {
LABEL_131:
                p_left = &v47->__value_.__left_;
                goto LABEL_24;
              }
              v45 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v47[1].__value_.__left_;
              if (!v45)
              {
                uint64_t v46 = v47 + 1;
                break;
              }
            }
            else
            {
              if (v49 >= v55) {
                goto LABEL_103;
              }
LABEL_89:
              v45 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v47->__value_.__left_;
              uint64_t v46 = v47;
              if (!v47->__value_.__left_) {
                break;
              }
            }
          }
        }
        p_left = operator new(0x50uLL);
        uint64_t v60 = p_left + 4;
        if (SHIBYTE(v106) < 0)
        {
          sub_24C66E0A8(v60, (void *)__dst, *((unint64_t *)&__dst + 1));
        }
        else
        {
          *(_OWORD *)uint64_t v60 = __dst;
          p_left[6] = v106;
        }
        p_left[7] = 0;
        p_left[8] = 0;
        p_left[9] = 0;
        void *p_left = 0;
        p_left[1] = 0;
        p_left[2] = v47;
        v46->__value_.__left_ = p_left;
        long long v61 = *(void **)self->_stateInputEspressoBuffersShape.__tree_.__begin_node_;
        int v62 = p_left;
        if (v61)
        {
          self->_stateInputEspressoBuffersShape.__tree_.__begin_node_ = v61;
          int v62 = v46->__value_.__left_;
        }
        uint64_t v63 = (uint64_t *)p_pair1->__value_.__left_;
        BOOL v33 = v62 == p_pair1->__value_.__left_;
        *((unsigned char *)v62 + 24) = v33;
        if (!v33)
        {
          do
          {
            uint64_t v64 = v62[2];
            if (*(unsigned char *)(v64 + 24)) {
              break;
            }
            long long v65 = *(uint64_t **)(v64 + 16);
            uint64_t v66 = *v65;
            if (*v65 == v64)
            {
              uint64_t v69 = v65[1];
              if (!v69 || (v70 = *(unsigned __int8 *)(v69 + 24), uint64_t v67 = (unsigned char *)(v69 + 24), v70))
              {
                if (*(void **)v64 == v62)
                {
                  *(unsigned char *)(v64 + 24) = 1;
                  *((unsigned char *)v65 + 24) = 0;
                  uint64_t v73 = *(void *)(v64 + 8);
                  *long long v65 = v73;
                  if (v73) {
                    goto LABEL_129;
                  }
                }
                else
                {
                  v71 = *(uint64_t **)(v64 + 8);
                  uint64_t v72 = *v71;
                  *(void *)(v64 + 8) = *v71;
                  if (v72)
                  {
                    *(void *)(v72 + 16) = v64;
                    long long v65 = *(uint64_t **)(v64 + 16);
                  }
                  v71[2] = (uint64_t)v65;
                  *(void *)(*(void *)(v64 + 16) + 8 * (**(void **)(v64 + 16) != v64)) = v71;
                  uint64_t *v71 = v64;
                  *(void *)(v64 + 16) = v71;
                  long long v65 = (uint64_t *)v71[2];
                  uint64_t v64 = *v65;
                  *((unsigned char *)v71 + 24) = 1;
                  *((unsigned char *)v65 + 24) = 0;
                  uint64_t v73 = *(void *)(v64 + 8);
                  *long long v65 = v73;
                  if (v73) {
LABEL_129:
                  }
                    *(void *)(v73 + 16) = v65;
                }
                *(void *)(v64 + 16) = v65[2];
                *(void *)(v65[2] + 8 * (*(void *)v65[2] != (void)v65)) = v64;
                *(void *)(v64 + 8) = v65;
LABEL_22:
                v65[2] = v64;
                break;
              }
            }
            else if (!v66 || (v68 = *(unsigned __int8 *)(v66 + 24), uint64_t v67 = (unsigned char *)(v66 + 24), v68))
            {
              if (*(void **)v64 == v62)
              {
                uint64_t v76 = v62[1];
                *(void *)uint64_t v64 = v76;
                if (v76)
                {
                  *(void *)(v76 + 16) = v64;
                  long long v65 = *(uint64_t **)(v64 + 16);
                }
                v62[2] = v65;
                *(void *)(*(void *)(v64 + 16) + 8 * (**(void **)(v64 + 16) != v64)) = v62;
                v62[1] = v64;
                *(void *)(v64 + 16) = v62;
                long long v65 = (uint64_t *)v62[2];
                *((unsigned char *)v62 + 24) = 1;
                *((unsigned char *)v65 + 24) = 0;
                uint64_t v64 = v65[1];
                uint64_t v74 = *(void **)v64;
                v65[1] = *(void *)v64;
                if (!v74) {
                  goto LABEL_21;
                }
              }
              else
              {
                *(unsigned char *)(v64 + 24) = 1;
                *((unsigned char *)v65 + 24) = 0;
                uint64_t v64 = v65[1];
                uint64_t v74 = *(void **)v64;
                v65[1] = *(void *)v64;
                if (!v74) {
                  goto LABEL_21;
                }
              }
              v74[2] = v65;
LABEL_21:
              *(void *)(v64 + 16) = v65[2];
              *(void *)(v65[2] + 8 * (*(void *)v65[2] != (void)v65)) = v64;
              *(void *)uint64_t v64 = v65;
              goto LABEL_22;
            }
            *(unsigned char *)(v64 + 24) = 1;
            int v62 = v65;
            *((unsigned char *)v65 + 24) = v65 == v63;
            *uint64_t v67 = 1;
          }
          while (v65 != v63);
        }
        ++self->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_;
LABEL_24:
        v98 *= *(void *)(p_left[7] + 8 * v13++);
        goto LABEL_25;
      }
    }
    if (v13 < ((char *)v16[8].__value_.__left_ - (char *)v16[7].__value_.__left_) >> 3) {
      goto LABEL_82;
    }
LABEL_147:
    if (v98)
    {
      *(void *)buf = &__dst;
      v77 = sub_24C6D6830(p_stateInputEspressoBuffers, (const void **)&__dst, (uint64_t)&unk_24C72FF38, (long long **)buf);
      if (v98 > ((char *)v77[8] - (char *)v77[7]) >> 2)
      {
        *(void *)buf = &__dst;
        v78 = sub_24C6D6830(p_stateInputEspressoBuffers, (const void **)&__dst, (uint64_t)&unk_24C72FF38, (long long **)buf);
        uint64_t v79 = v78[7];
        unint64_t v80 = ((char *)v78[8] - (char *)v79) >> 2;
        if (v98 <= v80)
        {
          if (v98 < v80) {
            v78[8] = (uint64_t *)((char *)v79 + 4 * v98);
          }
        }
        else
        {
          sub_24C6D5B74((uint64_t)(v78 + 7), v98 - v80);
        }
      }
      *(void *)buf = &__dst;
      long long v81 = sub_24C6D6830(p_stateInputEspressoBuffers, (const void **)&__dst, (uint64_t)&unk_24C72FF38, (long long **)buf)
          + 7;
      if (v81 != (uint64_t **)&v109) {
        sub_24C69DCB4(v81, (char *)v109, v110, (v110 - (unsigned char *)v109) >> 2);
      }
      float v82 = (uint64_t *)*((void *)self->_decoderNet.__ptr_ + 1);
      v113[0] = &__dst;
      unint64_t v83 = sub_24C6D6830(p_stateInputEspressoBuffers, (const void **)&__dst, (uint64_t)&unk_24C72FF38, v113);
      sub_24C6D2768((uint64_t)buf, *v82, v82[1], (uint64_t)&__dst, (uint64_t)v83[7]);
      v113[0] = &__dst;
      v84 = sub_24C6D8CAC((uint64_t)&self->_inputTensors, (uint64_t)&__dst, (uint64_t)&unk_24C72FF38, v113);
      size_t v85 = v84;
      *((_DWORD *)v84 + 12) = v100;
      if (v84 + 5 != (uint64_t *)buf) {
        sub_24C670F38(v84 + 7, (char *)__p, v102, (v102 - (unsigned char *)__p) >> 3);
      }
      uint64_t v87 = v103;
      uint64_t v86 = v104;
      if (v104) {
        atomic_fetch_add_explicit(&v104->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v88 = (std::__shared_weak_count *)v85[11];
      v85[10] = v87;
      v85[11] = (uint64_t)v86;
      if (v88 && !atomic_fetch_add(&v88->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
        std::__shared_weak_count::__release_weak(v88);
        *(void *)buf = &unk_26FEDD950;
        long long v89 = v104;
        if (v104) {
          goto LABEL_162;
        }
      }
      else
      {
        *(void *)buf = &unk_26FEDD950;
        long long v89 = v104;
        if (v104)
        {
LABEL_162:
          if (!atomic_fetch_add(&v89->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
            std::__shared_weak_count::__release_weak(v89);
          }
        }
      }
      if (__p)
      {
        uint64_t v102 = (char *)__p;
        operator delete(__p);
      }
    }
    if (SHIBYTE(v106) < 0)
    {
      operator delete((void *)__dst);
      v90 = (char *)v109;
      if (v109)
      {
LABEL_169:
        uint64_t v110 = v90;
        operator delete(v90);
      }
    }
    else
    {
      v90 = (char *)v109;
      if (v109) {
        goto LABEL_169;
      }
    }
    if ((char)v108 < 0) {
      operator delete(v107[0]);
    }
    v4 = *v97;
    if (*v97) {
      continue;
    }
    break;
  }
  v91 = v112;
  if (v112)
  {
    do
    {
      int64_t v93 = *(char **)v91;
      uint64_t v94 = (void *)*((void *)v91 + 5);
      if (v94)
      {
        *((void *)v91 + 6) = v94;
        operator delete(v94);
      }
      if (v91[39] < 0) {
        operator delete(*((void **)v91 + 2));
      }
      operator delete(v91);
      v91 = v93;
    }
    while (v93);
  }
LABEL_175:
  v92 = v111;
  long long v111 = 0;
  if (v92) {
    operator delete(v92);
  }
}

- (ModelOutput)predict
{
  sub_24C6D4254((uint64_t)self->_decoderNet.__ptr_, (uint64_t)&self->_outputTensors);
  sub_24C66D4AC((uint64_t)self->_decoderNet.__ptr_, (uint64_t)&self->_inputTensors, (uint64_t)v26);
  sub_24C6717DC((uint64_t)v26);
  begin = self->_wordProbs.__begin_;
  unint64_t vocabSize = self->_vocabSize;
  size_t v25 = 0;
  if (vocabSize)
  {
    if ((vocabSize & 0x8000000000000000) != 0) {
      sub_24C667470();
    }
    size_t v11 = 4 * vocabSize;
    uint64_t v12 = (ModelOutput *)operator new(4 * vocabSize);
    unint64_t vocabSize = (unint64_t)v12 + 4 * vocabSize;
    size_t v25 = v12;
    memcpy(v12, begin, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  objc_msgSend_getOutputState(self, v5, v6, v7, v8);
  __p = 0;
  uint64_t v13 = vocabSize - (void)v12;
  if ((ModelOutput *)vocabSize == v12)
  {
    v15 = 0;
    uint64_t v14 = 0;
    uint64_t v17 = v23;
    unint64_t v16 = v24;
    if (v24) {
LABEL_8:
    }
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    if (v13 < 0) {
      sub_24C667470();
    }
    uint64_t v14 = (char *)operator new(vocabSize - (void)v12);
    v15 = &v14[4 * (v13 >> 2)];
    __p = v14;
    memcpy(v14, v12, vocabSize - (void)v12);
    uint64_t v17 = v23;
    unint64_t v16 = v24;
    if (v24) {
      goto LABEL_8;
    }
  }
  retstr->var0.__begin_ = 0;
  retstr->var0.__end_ = 0;
  retstr->var0.__end_cap_.__value_ = 0;
  int64_t v18 = v15 - v14;
  if (v18)
  {
    if (v18 < 0) {
      sub_24C667470();
    }
    uint64_t v19 = (float *)operator new(v18);
    retstr->var0.__begin_ = v19;
    unint64_t v20 = &v19[v18 >> 2];
    retstr->var0.__end_cap_.__value_ = v20;
    memcpy(v19, v14, v18);
    retstr->var0.__end_ = v20;
  }
  retstr->var1.var0 = v17;
  retstr->var1.var1 = (__shared_weak_count *)v16;
  if (v16)
  {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    retstr->var2 = 1;
    if (!atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  else
  {
    retstr->var2 = 1;
  }
  if (__p) {
    operator delete(__p);
  }
  if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v24->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v24);
  }
  result = v25;
  if (v25) {
    operator delete(v25);
  }
  return result;
}

- (shared_ptr<std::unordered_map<std::string,)getOutputState
{
  long long v111 = v2;
  long long v129 = 0u;
  long long v130 = 0u;
  int v131 = 1065353216;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)self->_stateOutputEspressoBuffers.__tree_.__begin_node_;
  p_pair1 = &self->_stateOutputEspressoBuffers.__tree_.__pair1_;
  if (begin_node != &self->_stateOutputEspressoBuffers.__tree_.__pair1_)
  {
    p_stateInputEspressoBuffersShape = (uint64_t **)&self->_stateInputEspressoBuffersShape;
    int64_t v116 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
    do
    {
      left = (char *)&begin_node[4];
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
      {
        left = (char *)begin_node[4].__value_.__left_;
        int left_high = (char *)begin_node[5].__value_.__left_;
      }
      else
      {
        int left_high = (char *)HIBYTE(begin_node[6].__value_.__left_);
      }
      uint64_t v6 = (uint64_t)&left_high[(void)left - 4];
      unint64_t v7 = (unint64_t)(left_high - 4);
      if ((unint64_t)(left_high - 4) > 0x7FFFFFFFFFFFFFF7) {
        sub_24C6673C8();
      }
      if (v7 > 0x16)
      {
        uint64_t v15 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v7 | 7) != 0x17) {
          uint64_t v15 = v7 | 7;
        }
        uint64_t v16 = v15 + 1;
        uint64_t v8 = operator new(v15 + 1);
        size_t v127 = v7;
        int64_t v128 = v16 | 0x8000000000000000;
        uint64_t v126 = v8;
        if (left == (char *)v6)
        {
LABEL_19:
          int64_t v9 = v8;
          goto LABEL_22;
        }
      }
      else
      {
        HIBYTE(v128) = (_BYTE)left_high - 4;
        uint64_t v8 = &v126;
        if (left == (char *)v6) {
          goto LABEL_19;
        }
      }
      if (v7 < 0x20 || (unint64_t)((char *)v8 - left) < 0x20)
      {
        int64_t v9 = v8;
        uint64_t v10 = left;
      }
      else
      {
        int64_t v9 = (char *)v8 + (v7 & 0xFFFFFFFFFFFFFFE0);
        uint64_t v10 = &left[v7 & 0xFFFFFFFFFFFFFFE0];
        size_t v11 = (long long *)(left + 16);
        uint64_t v12 = v8 + 1;
        unint64_t v13 = v7 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v14 = *v11;
          *(v12 - 1) = *(v11 - 1);
          *uint64_t v12 = v14;
          v11 += 2;
          v12 += 2;
          v13 -= 32;
        }
        while (v13);
        if (v7 == (v7 & 0xFFFFFFFFFFFFFFE0)) {
          goto LABEL_22;
        }
      }
      do
      {
        char v17 = *v10++;
        *v9++ = v17;
      }
      while (v10 != (char *)v6);
LABEL_22:
      *int64_t v9 = 0;
      int v18 = SHIBYTE(v128);
      if (v128 >= 0) {
        size_t v19 = HIBYTE(v128);
      }
      else {
        size_t v19 = v127;
      }
      unint64_t v20 = v19 + 3;
      if (v19 + 3 > 0x7FFFFFFFFFFFFFF7) {
        sub_24C6673C8();
      }
      if (v20 >= 0x17)
      {
        uint64_t v22 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v20 | 7) != 0x17) {
          uint64_t v22 = v20 | 7;
        }
        uint64_t v23 = v22 + 1;
        p_dst = (long long *)operator new(v22 + 1);
        *((void *)&__dst + 1) = v19 + 3;
        int64_t v125 = v23 | 0x8000000000000000;
        *(void *)&long long __dst = p_dst;
      }
      else
      {
        int64_t v125 = 0;
        long long __dst = 0uLL;
        p_dst = &__dst;
        HIBYTE(v125) = v19 + 3;
        if (!v19) {
          goto LABEL_36;
        }
      }
      if (v18 >= 0) {
        uint64_t v24 = &v126;
      }
      else {
        uint64_t v24 = v126;
      }
      memmove(p_dst, v24, v19);
LABEL_36:
      *(_DWORD *)((char *)p_dst + v19) = 7235935;
      __p = &__dst;
      uint64_t v25 = sub_24C6D669C(p_stateInputEspressoBuffersShape, (const void **)&__dst, (uint64_t)&unk_24C72FF38, (long long **)&__p)[7][1];
      __p = &__dst;
      uint64_t v26 = sub_24C6D669C(p_stateInputEspressoBuffersShape, (const void **)&__dst, (uint64_t)&unk_24C72FF38, (long long **)&__p)[7][2];
      __p = &__dst;
      uint64_t v27 = v25 + 1;
      uint64_t v117 = *sub_24C6D669C(p_stateInputEspressoBuffersShape, (const void **)&__dst, (uint64_t)&unk_24C72FF38, (long long **)&__p)[7];
      unint64_t v28 = v26 * (v25 + 1) * v117;
      __p = 0;
      char v122 = 0;
      char v123 = 0;
      if (v28)
      {
        if (v28 >> 62) {
          sub_24C667470();
        }
        uint64_t v29 = (char *)operator new(4 * v28);
        unint64_t v30 = &v29[4 * v28];
        __p = v29;
        char v123 = v30;
        bzero(v29, 4 * v26 * v117 * v27);
        char v122 = v30;
      }
      unsigned int v31 = self;
      if (v26)
      {
        uint64_t v32 = 0;
        uint64_t v33 = v117 * v25;
        uint64_t v118 = v117 * v27;
        uint64_t v119 = v117 * v25;
        uint64_t v113 = 4 * v117 * v25;
        uint64_t v114 = v26;
        while (1)
        {
          if (v33)
          {
            uint64_t v34 = v116;
            unint64_t v35 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v116->__value_.__left_;
            uint64_t v36 = v116;
            if (v116->__value_.__left_)
            {
              if (v125 >= 0) {
                uint64_t v37 = &__dst;
              }
              else {
                uint64_t v37 = (long long *)__dst;
              }
              if (v125 >= 0) {
                size_t v38 = HIBYTE(v125);
              }
              else {
                size_t v38 = *((void *)&__dst + 1);
              }
              while (1)
              {
                uint64_t v34 = v35;
                float v41 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v35[4].__value_.__left_;
                uint64_t v39 = v35 + 4;
                int v40 = v41;
                int v42 = SHIBYTE(v39[2].__value_.__left_);
                if (v42 >= 0) {
                  uint64_t v43 = v39;
                }
                else {
                  uint64_t v43 = v40;
                }
                if (v42 >= 0) {
                  size_t v44 = HIBYTE(v39[2].__value_.__left_);
                }
                else {
                  size_t v44 = (size_t)v39[1].__value_.__left_;
                }
                if (v44 >= v38) {
                  size_t v45 = v38;
                }
                else {
                  size_t v45 = v44;
                }
                int v46 = memcmp(v37, v43, v45);
                if (v46)
                {
                  if (v46 < 0) {
                    goto LABEL_54;
                  }
LABEL_68:
                  int v47 = memcmp(v43, v37, v45);
                  if (v47)
                  {
                    if ((v47 & 0x80000000) == 0) {
                      goto LABEL_96;
                    }
                  }
                  else if (v44 >= v38)
                  {
LABEL_96:
                    p_left = &v34->__value_.__left_;
                    uint64_t v52 = v119;
                    goto LABEL_103;
                  }
                  unint64_t v35 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v34[1].__value_.__left_;
                  if (!v35)
                  {
                    uint64_t v36 = v34 + 1;
                    break;
                  }
                }
                else
                {
                  if (v38 >= v44) {
                    goto LABEL_68;
                  }
LABEL_54:
                  unint64_t v35 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v34->__value_.__left_;
                  uint64_t v36 = v34;
                  if (!v34->__value_.__left_) {
                    break;
                  }
                }
              }
            }
            p_left = operator new(0x50uLL);
            size_t v49 = p_left + 4;
            if (SHIBYTE(v125) < 0)
            {
              sub_24C66E0A8(v49, (void *)__dst, *((unint64_t *)&__dst + 1));
            }
            else
            {
              *(_OWORD *)size_t v49 = __dst;
              p_left[6] = v125;
            }
            p_left[7] = 0;
            p_left[8] = 0;
            p_left[9] = 0;
            void *p_left = 0;
            p_left[1] = 0;
            p_left[2] = v34;
            v36->__value_.__left_ = p_left;
            uint64_t v50 = *(void **)v31->_stateInputEspressoBuffers.__tree_.__begin_node_;
            unint64_t v51 = p_left;
            uint64_t v52 = v119;
            if (v50)
            {
              v31->_stateInputEspressoBuffers.__tree_.__begin_node_ = v50;
              unint64_t v51 = v36->__value_.__left_;
            }
            int v53 = (uint64_t *)v116->__value_.__left_;
            BOOL v54 = v51 == v116->__value_.__left_;
            *((unsigned char *)v51 + 24) = v54;
            if (!v54)
            {
              do
              {
                uint64_t v55 = v51[2];
                if (*(unsigned char *)(v55 + 24)) {
                  break;
                }
                size_t v56 = *(uint64_t **)(v55 + 16);
                uint64_t v57 = *v56;
                if (*v56 == v55)
                {
                  uint64_t v60 = v56[1];
                  if (!v60 || (int v61 = *(unsigned __int8 *)(v60 + 24), v58 = (unsigned char *)(v60 + 24), v61))
                  {
                    if (*(void **)v55 == v51)
                    {
                      *(unsigned char *)(v55 + 24) = 1;
                      *((unsigned char *)v56 + 24) = 0;
                      uint64_t v64 = *(void *)(v55 + 8);
                      *size_t v56 = v64;
                      if (v64) {
                        goto LABEL_94;
                      }
                    }
                    else
                    {
                      int v62 = *(uint64_t **)(v55 + 8);
                      uint64_t v63 = *v62;
                      *(void *)(v55 + 8) = *v62;
                      if (v63)
                      {
                        *(void *)(v63 + 16) = v55;
                        size_t v56 = *(uint64_t **)(v55 + 16);
                      }
                      v62[2] = (uint64_t)v56;
                      *(void *)(*(void *)(v55 + 16) + 8 * (**(void **)(v55 + 16) != v55)) = v62;
                      uint64_t *v62 = v55;
                      *(void *)(v55 + 16) = v62;
                      size_t v56 = (uint64_t *)v62[2];
                      uint64_t v55 = *v56;
                      *((unsigned char *)v62 + 24) = 1;
                      *((unsigned char *)v56 + 24) = 0;
                      uint64_t v64 = *(void *)(v55 + 8);
                      *size_t v56 = v64;
                      if (v64) {
LABEL_94:
                      }
                        *(void *)(v64 + 16) = v56;
                    }
                    *(void *)(v55 + 16) = v56[2];
                    *(void *)(v56[2] + 8 * (*(void *)v56[2] != (void)v56)) = v55;
                    *(void *)(v55 + 8) = v56;
LABEL_101:
                    v56[2] = v55;
                    break;
                  }
                }
                else if (!v57 || (int v59 = *(unsigned __int8 *)(v57 + 24), v58 = (unsigned char *)(v57 + 24), v59))
                {
                  if (*(void **)v55 == v51)
                  {
                    uint64_t v101 = v51[1];
                    *(void *)uint64_t v55 = v101;
                    if (v101)
                    {
                      *(void *)(v101 + 16) = v55;
                      size_t v56 = *(uint64_t **)(v55 + 16);
                    }
                    v51[2] = v56;
                    *(void *)(*(void *)(v55 + 16) + 8 * (**(void **)(v55 + 16) != v55)) = v51;
                    v51[1] = v55;
                    *(void *)(v55 + 16) = v51;
                    size_t v56 = (uint64_t *)v51[2];
                    *((unsigned char *)v51 + 24) = 1;
                    *((unsigned char *)v56 + 24) = 0;
                    uint64_t v55 = v56[1];
                    long long v65 = *(void **)v55;
                    v56[1] = *(void *)v55;
                    if (v65) {
LABEL_99:
                    }
                      v65[2] = v56;
                  }
                  else
                  {
                    *(unsigned char *)(v55 + 24) = 1;
                    *((unsigned char *)v56 + 24) = 0;
                    uint64_t v55 = v56[1];
                    long long v65 = *(void **)v55;
                    v56[1] = *(void *)v55;
                    if (v65) {
                      goto LABEL_99;
                    }
                  }
                  *(void *)(v55 + 16) = v56[2];
                  *(void *)(v56[2] + 8 * (*(void *)v56[2] != (void)v56)) = v55;
                  *(void *)uint64_t v55 = v56;
                  goto LABEL_101;
                }
                *(unsigned char *)(v55 + 24) = 1;
                unint64_t v51 = v56;
                *((unsigned char *)v56 + 24) = v56 == v53;
                unsigned char *v58 = 1;
              }
              while (v56 != v53);
            }
            ++v31->_stateInputEspressoBuffers.__tree_.__pair3_.__value_;
LABEL_103:
            memcpy((char *)__p + 4 * v118 * v32, (const void *)(p_left[7] + 4 * v32 * v52), v113);
          }
          uint64_t v67 = p_pair1;
          uint64_t v66 = (char *)__p;
          int v68 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)p_pair1->__value_.__left_;
          uint64_t v69 = p_pair1;
          if (p_pair1->__value_.__left_) {
            break;
          }
LABEL_131:
          float v82 = operator new(0x50uLL);
          unint64_t v83 = v82 + 4;
          if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
          {
            sub_24C66E0A8(v83, begin_node[4].__value_.__left_, (unint64_t)begin_node[5].__value_.__left_);
          }
          else
          {
            long long v84 = *(_OWORD *)&begin_node[4].__value_.__left_;
            v82[6] = begin_node[6].__value_.__left_;
            *(_OWORD *)unint64_t v83 = v84;
          }
          unsigned int v31 = self;
          v82[7] = 0;
          v82[8] = 0;
          v82[9] = 0;
          void *v82 = 0;
          v82[1] = 0;
          v82[2] = v67;
          v69->__value_.__left_ = v82;
          size_t v85 = *(void **)self->_stateOutputEspressoBuffers.__tree_.__begin_node_;
          uint64_t v86 = v82;
          uint64_t v33 = v119;
          if (v85)
          {
            self->_stateOutputEspressoBuffers.__tree_.__begin_node_ = v85;
            uint64_t v86 = v69->__value_.__left_;
          }
          uint64_t v87 = (uint64_t *)p_pair1->__value_.__left_;
          BOOL v54 = v86 == p_pair1->__value_.__left_;
          *((unsigned char *)v86 + 24) = v54;
          uint64_t v88 = v114;
          if (!v54)
          {
            do
            {
              uint64_t v89 = v86[2];
              if (*(unsigned char *)(v89 + 24)) {
                break;
              }
              v90 = *(uint64_t **)(v89 + 16);
              uint64_t v91 = *v90;
              if (*v90 == v89)
              {
                uint64_t v94 = v90[1];
                if (!v94 || (int v95 = *(unsigned __int8 *)(v94 + 24), v92 = (unsigned char *)(v94 + 24), v95))
                {
                  if (*(void **)v89 == v86)
                  {
                    *(unsigned char *)(v89 + 24) = 1;
                    *((unsigned char *)v90 + 24) = 0;
                    uint64_t v98 = *(void *)(v89 + 8);
                    uint64_t *v90 = v98;
                    if (v98) {
                      goto LABEL_151;
                    }
                  }
                  else
                  {
                    uint64_t v96 = *(uint64_t **)(v89 + 8);
                    uint64_t v97 = *v96;
                    *(void *)(v89 + 8) = *v96;
                    if (v97)
                    {
                      *(void *)(v97 + 16) = v89;
                      v90 = *(uint64_t **)(v89 + 16);
                    }
                    v96[2] = (uint64_t)v90;
                    *(void *)(*(void *)(v89 + 16) + 8 * (**(void **)(v89 + 16) != v89)) = v96;
                    uint64_t *v96 = v89;
                    *(void *)(v89 + 16) = v96;
                    v90 = (uint64_t *)v96[2];
                    uint64_t v89 = *v90;
                    *((unsigned char *)v96 + 24) = 1;
                    *((unsigned char *)v90 + 24) = 0;
                    uint64_t v98 = *(void *)(v89 + 8);
                    uint64_t *v90 = v98;
                    if (v98) {
LABEL_151:
                    }
                      *(void *)(v98 + 16) = v90;
                  }
                  *(void *)(v89 + 16) = v90[2];
                  *(void *)(v90[2] + 8 * (*(void *)v90[2] != (void)v90)) = v89;
                  *(void *)(v89 + 8) = v90;
LABEL_43:
                  v90[2] = v89;
                  break;
                }
              }
              else if (!v91 || (int v93 = *(unsigned __int8 *)(v91 + 24), v92 = (unsigned char *)(v91 + 24), v93))
              {
                if (*(void **)v89 == v86)
                {
                  uint64_t v100 = v86[1];
                  *(void *)uint64_t v89 = v100;
                  if (v100)
                  {
                    *(void *)(v100 + 16) = v89;
                    v90 = *(uint64_t **)(v89 + 16);
                  }
                  v86[2] = v90;
                  *(void *)(*(void *)(v89 + 16) + 8 * (**(void **)(v89 + 16) != v89)) = v86;
                  v86[1] = v89;
                  *(void *)(v89 + 16) = v86;
                  v90 = (uint64_t *)v86[2];
                  *((unsigned char *)v86 + 24) = 1;
                  *((unsigned char *)v90 + 24) = 0;
                  uint64_t v89 = v90[1];
                  v99 = *(void **)v89;
                  v90[1] = *(void *)v89;
                  if (!v99) {
                    goto LABEL_42;
                  }
                }
                else
                {
                  *(unsigned char *)(v89 + 24) = 1;
                  *((unsigned char *)v90 + 24) = 0;
                  uint64_t v89 = v90[1];
                  v99 = *(void **)v89;
                  v90[1] = *(void *)v89;
                  if (!v99) {
                    goto LABEL_42;
                  }
                }
                v99[2] = v90;
LABEL_42:
                *(void *)(v89 + 16) = v90[2];
                *(void *)(v90[2] + 8 * (*(void *)v90[2] != (void)v90)) = v89;
                *(void *)uint64_t v89 = v90;
                goto LABEL_43;
              }
              *(unsigned char *)(v89 + 24) = 1;
              uint64_t v86 = v90;
              *((unsigned char *)v90 + 24) = v90 == v87;
              unsigned char *v92 = 1;
            }
            while (v90 != v87);
          }
          ++self->_stateOutputEspressoBuffers.__tree_.__pair3_.__value_;
LABEL_45:
          memcpy(&v66[4 * v118 * v32 + 4 * v33], (const void *)(v82[7] + 4 * v32 * v117), 4 * v117);
          if (++v32 == v88) {
            goto LABEL_169;
          }
        }
        char v70 = HIBYTE(begin_node[6].__value_.__left_);
        if (v70 >= 0) {
          v71 = begin_node + 4;
        }
        else {
          v71 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[4].__value_.__left_;
        }
        if (v70 >= 0) {
          size_t v72 = HIBYTE(begin_node[6].__value_.__left_);
        }
        else {
          size_t v72 = (size_t)begin_node[5].__value_.__left_;
        }
        while (1)
        {
          uint64_t v67 = v68;
          uint64_t v75 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v68[4].__value_.__left_;
          uint64_t v73 = v68 + 4;
          uint64_t v74 = v75;
          int v76 = SHIBYTE(v73[2].__value_.__left_);
          if (v76 >= 0) {
            v77 = v73;
          }
          else {
            v77 = v74;
          }
          if (v76 >= 0) {
            size_t v78 = HIBYTE(v73[2].__value_.__left_);
          }
          else {
            size_t v78 = (size_t)v73[1].__value_.__left_;
          }
          if (v78 >= v72) {
            size_t v79 = v72;
          }
          else {
            size_t v79 = v78;
          }
          int v80 = memcmp(v71, v77, v79);
          if (v80)
          {
            if (v80 < 0) {
              goto LABEL_111;
            }
          }
          else if (v72 < v78)
          {
LABEL_111:
            int v68 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v67->__value_.__left_;
            uint64_t v69 = v67;
            if (!v67->__value_.__left_) {
              goto LABEL_131;
            }
            continue;
          }
          int v81 = memcmp(v77, v71, v79);
          if (v81)
          {
            if ((v81 & 0x80000000) == 0) {
              goto LABEL_153;
            }
          }
          else if (v78 >= v72)
          {
LABEL_153:
            float v82 = &v67->__value_.__left_;
            unsigned int v31 = self;
            uint64_t v88 = v114;
            uint64_t v33 = v119;
            goto LABEL_45;
          }
          int v68 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v67[1].__value_.__left_;
          if (!v68)
          {
            uint64_t v69 = v67 + 1;
            goto LABEL_131;
          }
        }
      }
LABEL_169:
      int v132 = &v126;
      uint64_t v102 = sub_24C6D915C((uint64_t)&v129, (uint64_t)&v126, (uint64_t)&unk_24C72FF38, (long long **)&v132) + 5;
      if (v102 != (uint64_t *)&__p) {
        sub_24C69DCB4(v102, (char *)__p, v122, (v122 - (unsigned char *)__p) >> 2);
      }
      if (__p)
      {
        char v122 = (char *)__p;
        operator delete(__p);
      }
      if (SHIBYTE(v125) < 0)
      {
        operator delete((void *)__dst);
        if ((SHIBYTE(v128) & 0x80000000) == 0)
        {
LABEL_175:
          uint64_t v103 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[1].__value_.__left_;
          if (v103) {
            goto LABEL_179;
          }
          goto LABEL_181;
        }
      }
      else if ((SHIBYTE(v128) & 0x80000000) == 0)
      {
        goto LABEL_175;
      }
      operator delete(v126);
      uint64_t v103 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[1].__value_.__left_;
      if (v103)
      {
        do
        {
LABEL_179:
          unint64_t v104 = v103;
          uint64_t v103 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v103->__value_.__left_;
        }
        while (v103);
        goto LABEL_3;
      }
      do
      {
LABEL_181:
        unint64_t v104 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[2].__value_.__left_;
        BOOL v54 = v104->__value_.__left_ == begin_node;
        begin_node = v104;
      }
      while (!v54);
LABEL_3:
      begin_node = v104;
    }
    while (v104 != p_pair1);
  }
  uint64_t v105 = operator new(0x40uLL);
  v105[1] = 0;
  v105[2] = 0;
  *uint64_t v105 = &unk_26FEDBC28;
  uint64_t *v111 = sub_24C6D86B4((uint64_t)(v105 + 3), (uint64_t)&v129);
  v111[1] = (uint64_t)v105;
  int64_t v107 = (char *)v130;
  if ((void)v130)
  {
    do
    {
      v109 = *(char **)v107;
      uint64_t v110 = (void *)*((void *)v107 + 5);
      if (v110)
      {
        *((void *)v107 + 6) = v110;
        operator delete(v110);
      }
      if (v107[39] < 0) {
        operator delete(*((void **)v107 + 2));
      }
      operator delete(v107);
      int64_t v107 = v109;
    }
    while (v109);
  }
  unsigned __int8 v108 = (void *)v129;
  *(void *)&long long v129 = 0;
  if (v108) {
    operator delete(v108);
  }
  result.var1 = v106;
  result.var0 = v108;
  return result;
}

- (shared_ptr<ik::EspressoNet>)decoderNet
{
  cntrl = self->_decoderNet.__cntrl_;
  uint64_t *v2 = self->_decoderNet.__ptr_;
  v2[1] = (EspressoNet *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (EspressoNet *)self;
  return result;
}

- (EspressoTensor)inputTokens
{
  v3 = self;
  retstr->_vptr$Tensor = (void **)&unk_26FEDD950;
  int ptr = (int)self[5].storage_.__ptr_;
  retstr->shape_.sizes_.__begin_ = 0;
  retstr->type_ = ptr;
  retstr->shape_.sizes_.__end_ = 0;
  retstr->shape_.sizes_.__end_cap_.__value_ = 0;
  cntrl = self[5].storage_.__cntrl_;
  uint64_t v6 = self[6]._vptr$Tensor;
  int64_t v8 = (char *)v6 - (char *)cntrl;
  if (v6 != (void **)cntrl)
  {
    if (v8 < 0) {
      sub_24C667470();
    }
    int64_t v9 = (unint64_t *)operator new((char *)v6 - (char *)cntrl);
    retstr->shape_.sizes_.__begin_ = v9;
    retstr->shape_.sizes_.__end_ = v9;
    uint64_t v10 = &v9[v8 >> 3];
    retstr->shape_.sizes_.__end_cap_.__value_ = v10;
    self = (EspressoTensor *)memcpy(v9, cntrl, v8);
    retstr->shape_.sizes_.__end_ = v10;
  }
  end = v3[6].shape_.sizes_.__end_;
  retstr->storage_.__ptr_ = (TensorStorage *)v3[6].shape_.sizes_.__begin_;
  retstr->storage_.__cntrl_ = (__shared_weak_count *)end;
  if (end) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)end + 1, 1uLL, memory_order_relaxed);
  }
  retstr->_vptr$Tensor = (void **)&unk_26FEDD7F0;
  return self;
}

- (map<std::string,)stateOutputEspressoBuffers
{
  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  p_pair1 = (uint64_t *)&retstr->__tree_.__pair1_;
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)self[5].__tree_.__begin_node_;
  id v5 = &self[5].__tree_.__pair1_;
  if (begin_node != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)&self[5].__tree_.__pair1_)
  {
    do
    {
      self = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)sub_24C6D6108((uint64_t **)retstr, p_pair1, (const void **)&begin_node[1].__tree_.__pair1_.__value_.__left_, (long long *)&begin_node[1].__tree_.__pair1_);
      left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)begin_node->__tree_.__pair1_.__value_.__left_;
      if (left)
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)left;
          left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)left->__tree_.__begin_node_;
        }
        while (left);
      }
      else
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)begin_node->__tree_.__pair3_.__value_;
          BOOL v9 = *value == begin_node;
          begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
        }
        while (!v9);
      }
      begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
    }
    while (value != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)v5);
  }
  return self;
}

- (map<std::string,)stateInputEspressoBuffers
{
  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  p_pair1 = (uint64_t *)&retstr->__tree_.__pair1_;
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)self[6].__tree_.__begin_node_;
  id v5 = &self[6].__tree_.__pair1_;
  if (begin_node != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)&self[6].__tree_.__pair1_)
  {
    do
    {
      self = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)sub_24C6D6108((uint64_t **)retstr, p_pair1, (const void **)&begin_node[1].__tree_.__pair1_.__value_.__left_, (long long *)&begin_node[1].__tree_.__pair1_);
      left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)begin_node->__tree_.__pair1_.__value_.__left_;
      if (left)
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)left;
          left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)left->__tree_.__begin_node_;
        }
        while (left);
      }
      else
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)begin_node->__tree_.__pair3_.__value_;
          BOOL v9 = *value == begin_node;
          begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
        }
        while (!v9);
      }
      begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
    }
    while (value != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)v5);
  }
  return self;
}

- (map<std::string,)stateInputEspressoBuffersShape
{
  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  p_pair1 = (uint64_t *)&retstr->__tree_.__pair1_;
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  begin_node = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)self[7].__tree_.__begin_node_;
  id v5 = &self[7].__tree_.__pair1_;
  if (begin_node != (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)&self[7].__tree_.__pair1_)
  {
    do
    {
      self = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)sub_24C6D62D8((uint64_t **)retstr, p_pair1, (const void **)&begin_node[1].__tree_.__pair1_.__value_.__left_, (long long *)&begin_node[1].__tree_.__pair1_);
      left = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)begin_node->__tree_.__pair1_.__value_.__left_;
      if (left)
      {
        do
        {
          value = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> **)left;
          left = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)left->__tree_.__begin_node_;
        }
        while (left);
      }
      else
      {
        do
        {
          value = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> **)begin_node->__tree_.__pair3_.__value_;
          BOOL v9 = *value == begin_node;
          begin_node = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)value;
        }
        while (!v9);
      }
      begin_node = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)value;
    }
    while (value != (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> **)v5);
  }
  return self;
}

- (vector<float,)inWords
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[8].__begin_;
  end = self[8].__end_;
  int64_t v6 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v6 < 0) {
      sub_24C667470();
    }
    unint64_t v7 = (float *)operator new((char *)end - (char *)begin);
    retstr->__begin_ = v7;
    int64_t v8 = &v7[v6 >> 2];
    retstr->__end_cap_.__value_ = v8;
    self = (vector<float, std::allocator<float>> *)memcpy(v7, begin, v6);
    retstr->__end_ = v8;
  }
  return self;
}

- (vector<float,)inputMask
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[9].__begin_;
  end = self[9].__end_;
  int64_t v6 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v6 < 0) {
      sub_24C667470();
    }
    unint64_t v7 = (float *)operator new((char *)end - (char *)begin);
    retstr->__begin_ = v7;
    int64_t v8 = &v7[v6 >> 2];
    retstr->__end_cap_.__value_ = v8;
    self = (vector<float, std::allocator<float>> *)memcpy(v7, begin, v6);
    retstr->__end_ = v8;
  }
  return self;
}

- (vector<float,)positionInput
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[10].__begin_;
  end = self[10].__end_;
  int64_t v6 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v6 < 0) {
      sub_24C667470();
    }
    unint64_t v7 = (float *)operator new((char *)end - (char *)begin);
    retstr->__begin_ = v7;
    int64_t v8 = &v7[v6 >> 2];
    retstr->__end_cap_.__value_ = v8;
    self = (vector<float, std::allocator<float>> *)memcpy(v7, begin, v6);
    retstr->__end_ = v8;
  }
  return self;
}

- (vector<float,)scaleInput
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[11].__begin_;
  end = self[11].__end_;
  int64_t v6 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v6 < 0) {
      sub_24C667470();
    }
    unint64_t v7 = (float *)operator new((char *)end - (char *)begin);
    retstr->__begin_ = v7;
    int64_t v8 = &v7[v6 >> 2];
    retstr->__end_cap_.__value_ = v8;
    self = (vector<float, std::allocator<float>> *)memcpy(v7, begin, v6);
    retstr->__end_ = v8;
  }
  return self;
}

- (vector<float,)wordProbs
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[12].__begin_;
  end = self[12].__end_;
  int64_t v6 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v6 < 0) {
      sub_24C667470();
    }
    unint64_t v7 = (float *)operator new((char *)end - (char *)begin);
    retstr->__begin_ = v7;
    int64_t v8 = &v7[v6 >> 2];
    retstr->__end_cap_.__value_ = v8;
    self = (vector<float, std::allocator<float>> *)memcpy(v7, begin, v6);
    retstr->__end_ = v8;
  }
  return self;
}

- (unint64_t)sequenceLength
{
  return self->_sequenceLength;
}

- (unint64_t)vocabSize
{
  return self->_vocabSize;
}

- (void).cxx_destruct
{
  self->_inputTokens._vptr$Tensor = (void **)&unk_26FEDD950;
  cntrl = self->_inputTokens.storage_.__cntrl_;
  if (!cntrl || atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    begin = self->_inputTokens.shape_.sizes_.__begin_;
    if (!begin) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  begin = self->_inputTokens.shape_.sizes_.__begin_;
  if (begin)
  {
LABEL_4:
    self->_inputTokens.shape_.sizes_.__end_ = begin;
    operator delete(begin);
  }
LABEL_5:
  id v5 = self->_wordProbs.__begin_;
  if (v5)
  {
    self->_wordProbs.__end_ = v5;
    operator delete(v5);
  }
  int64_t v6 = self->_scaleInput.__begin_;
  if (v6)
  {
    self->_scaleInput.__end_ = v6;
    operator delete(v6);
  }
  unint64_t v7 = self->_positionInput.__begin_;
  if (v7)
  {
    self->_positionInput.__end_ = v7;
    operator delete(v7);
  }
  int64_t v8 = self->_inputMask.__begin_;
  if (v8)
  {
    self->_inputMask.__end_ = v8;
    operator delete(v8);
  }
  BOOL v9 = self->_inWords.__begin_;
  if (v9)
  {
    self->_inWords.__end_ = v9;
    operator delete(v9);
  }
  sub_24C6D6244((uint64_t)&self->_stateInputEspressoBuffersShape, (char *)self->_stateInputEspressoBuffersShape.__tree_.__pair1_.__value_.__left_);
  sub_24C6D6244((uint64_t)&self->_stateInputEspressoBuffers, (char *)self->_stateInputEspressoBuffers.__tree_.__pair1_.__value_.__left_);
  sub_24C6D6244((uint64_t)&self->_stateOutputEspressoBuffers, (char *)self->_stateOutputEspressoBuffers.__tree_.__pair1_.__value_.__left_);
  uint64_t v10 = self->_decoderNet.__cntrl_;
  if (v10 && !atomic_fetch_add((atomic_ullong *volatile)v10 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v10 + 16))(v10);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v10);
  }
  sub_24C6717DC((uint64_t)&self->_outputTensors);
  sub_24C6717DC((uint64_t)&self->_inputTensors);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 15) = (char *)self + 128;
  *((void *)self + 19) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = (char *)self + 152;
  *((void *)self + 23) = 0;
  *((void *)self + 22) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 21) = (char *)self + 176;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_DWORD *)self + 80) = 4;
  *((void *)self + 45) = 0;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *((void *)self + 38) = 0;
  *((void *)self + 39) = &unk_26FEDD7F0;
  return self;
}

@end