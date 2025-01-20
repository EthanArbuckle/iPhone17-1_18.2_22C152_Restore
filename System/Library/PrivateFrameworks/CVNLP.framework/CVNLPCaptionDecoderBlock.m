@interface CVNLPCaptionDecoderBlock
- ($C4732ECC957FA13B9B3DF4A51A95735B)decoderNet;
- ($FD4688982923A924290ECB669CAF1EC2)attFeatsPlaceholderBlob;
- ($FD4688982923A924290ECB669CAF1EC2)blockInput;
- ($FD4688982923A924290ECB669CAF1EC2)blockOutput;
- ($FD4688982923A924290ECB669CAF1EC2)maskInput;
- ($FD4688982923A924290ECB669CAF1EC2)positionInput;
- ($FD4688982923A924290ECB669CAF1EC2)scaleInput;
- (BOOL)_loadNetwork:(id)a3 modelIndex:(unint64_t)a4;
- (CVNLPCaptionDecoderBlock)initWithOptions:(id)a3 modelIndex:(unint64_t)a4 runTimeParams:(id)a5;
- (CVNLPCaptionDecoderBlock)nextBlock;
- (NSString)metricCopyString;
- (NSString)metricString;
- (OS_dispatch_queue)decoderQueue;
- (id).cxx_construct;
- (map<std::string,)stateInputEspressoBuffers;
- (map<std::string,)stateInputEspressoBuffersShape;
- (map<std::string,)stateOutputEspressoBuffers;
- (unint64_t)modelIndex;
- (vector<std::string,)decoderInputNames;
- (void)_runBlockWithCopyOutputBlock:(id)a3;
- (void)buildNetworkForSequenceLength:(unint64_t)a3 imageFeatures:(id)a4;
- (void)copyInputState:(id)a3;
- (void)copyOutputState:(id)a3;
- (void)dealloc;
- (void)decoderCtx;
- (void)decoderPlan;
- (void)runBlockWithCopyInput:(float *)a3 copyOutputBlock:(id)a4;
- (void)runBlockWithCopyInputBlock:(id)a3 copyOutputBlock:(id)a4;
- (void)setAttFeatsPlaceholderBlob:(id *)a3;
- (void)setBlockInput:(id *)a3;
- (void)setBlockOutput:(id *)a3;
- (void)setDecoderCtx:(void *)a3;
- (void)setDecoderInputNames:()vector<std:(std::allocator<std::string>> *)a3 :string;
- (void)setDecoderNet:(id)a3;
- (void)setDecoderPlan:(void *)a3;
- (void)setDecoderQueue:(id)a3;
- (void)setMaskInput:(id *)a3;
- (void)setMetricCopyString:(id)a3;
- (void)setMetricString:(id)a3;
- (void)setModelIndex:(unint64_t)a3;
- (void)setNextBlock:(id)a3;
- (void)setPositionInput:(id *)a3;
- (void)setScaleInput:(id *)a3;
- (void)setStateInputEspressoBuffers:()map<std:()std:()std:(std:(std::vector<float>>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :vector<float> :string;
- (void)setStateInputEspressoBuffersShape:()map<std:(std:()std:(std:(std::vector<unsigned long>>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :vector<unsigned)long> :string;
- (void)setStateOutputEspressoBuffers:()map<std:()std:()std:(std:(std::vector<float>>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :vector<float> :string;
@end

@implementation CVNLPCaptionDecoderBlock

- (CVNLPCaptionDecoderBlock)initWithOptions:(id)a3 modelIndex:(unint64_t)a4 runTimeParams:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CVNLPCaptionDecoderBlock;
  v10 = [(CVNLPCaptionModelBase *)&v29 initWithOptions:v8 runTimeParams:v9];
  v11 = v10;
  if (v10)
  {
    v10->_modelIndex = a4;
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v13 = dispatch_queue_create("decoder_queue", v12);
    decoderQueue = v11->_decoderQueue;
    v11->_decoderQueue = (OS_dispatch_queue *)v13;

    v17 = objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)CVNLPCaptionModelPath, v16);
    if ((objc_msgSend__loadNetwork_modelIndex_(v11, v18, (uint64_t)v17, a4) & 1) == 0)
    {

      v27 = 0;
      goto LABEL_6;
    }
    uint64_t v21 = objc_msgSend_stringWithFormat_(NSString, v19, @"DecodeBlockExecute:%tu", v20, v11->_modelIndex);
    metricString = v11->_metricString;
    v11->_metricString = (NSString *)v21;

    uint64_t v25 = objc_msgSend_stringWithFormat_(NSString, v23, @"DecodeBlockCopy:%tu", v24, v11->_modelIndex);
    metricCopyString = v11->_metricCopyString;
    v11->_metricCopyString = (NSString *)v25;
  }
  v27 = v11;
LABEL_6:

  return v27;
}

- (void)dealloc
{
  if (self->_decoderPlan) {
    espresso_plan_destroy();
  }
  if (self->_decoderCtx) {
    espresso_context_destroy();
  }
  sub_1B4C59808((uint64_t)&self->_stateInputEspressoBuffers, (char *)self->_stateInputEspressoBuffers.__tree_.__pair1_.__value_.__left_);
  self->_stateInputEspressoBuffers.__tree_.__begin_node_ = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
  self->_stateInputEspressoBuffers.__tree_.__pair3_.__value_ = 0;
  self->_stateInputEspressoBuffers.__tree_.__pair1_.__value_.__left_ = 0;
  sub_1B4C62544((char *)self->_stateInputEspressoBuffersShape.__tree_.__pair1_.__value_.__left_);
  self->_stateInputEspressoBuffersShape.__tree_.__begin_node_ = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
  self->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_ = 0;
  self->_stateInputEspressoBuffersShape.__tree_.__pair1_.__value_.__left_ = 0;
  sub_1B4C59808((uint64_t)&self->_stateOutputEspressoBuffers, (char *)self->_stateOutputEspressoBuffers.__tree_.__pair1_.__value_.__left_);
  self->_stateOutputEspressoBuffers.__tree_.__begin_node_ = &self->_stateOutputEspressoBuffers.__tree_.__pair1_;
  self->_stateOutputEspressoBuffers.__tree_.__pair1_.__value_.__left_ = 0;
  self->_stateOutputEspressoBuffers.__tree_.__pair3_.__value_ = 0;
  v3.receiver = self;
  v3.super_class = (Class)CVNLPCaptionDecoderBlock;
  [(CVNLPCaptionDecoderBlock *)&v3 dealloc];
}

- (BOOL)_loadNetwork:(id)a3 modelIndex:(unint64_t)a4
{
  id v6 = a3;
  v133 = v6;
  self->_decoderCtx = (void *)espresso_create_context();
  self->_decoderPlan = (void *)espresso_create_plan();
  id v9 = objc_msgSend_stringWithFormat_(NSString, v7, @"decoder_block%tu_opt.espresso.net", v8, a4);
  v12 = objc_msgSend_URLByAppendingPathComponent_(v6, v10, (uint64_t)v9, v11);

  uint64_t v16 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v13, v14, v15);
  uint64_t v20 = objc_msgSend_path(v12, v17, v18, v19);
  int v23 = objc_msgSend_fileExistsAtPath_(v16, v21, (uint64_t)v20, v22);

  if (!v23)
  {
    if (!a4)
    {
      v32 = objc_msgSend_URLByAppendingPathComponent_(v133, v24, @"decoder_opt.espresso.net", v26);

      v38 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v35, v36, v37);
      v42 = objc_msgSend_path(v32, v39, v40, v41);
      int v45 = objc_msgSend_fileExistsAtPath_(v38, v43, (uint64_t)v42, v44);

      if (v45)
      {
        objc_msgSend_path(v32, v46, v47, v48);
        id v49 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_UTF8String(v49, v50, v51, v52);
        int v53 = espresso_plan_add_network();

        if (v53)
        {
          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          espresso_plan_get_error_info();
          std::runtime_error::runtime_error(exception, v117);
          __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        if (espresso_plan_build())
        {
          v118 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          espresso_plan_get_error_info();
          std::runtime_error::runtime_error(v118, v119);
          __cxa_throw(v118, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        p_decoderInputNames = &self->_decoderInputNames;
        if (c_network_get_input_names())
        {
          v120 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          espresso_plan_get_error_info();
          std::runtime_error::runtime_error(v120, v121);
          __cxa_throw(v120, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        begin = (char *)p_decoderInputNames->__begin_;
        end = (char *)self->_decoderInputNames.__end_;
        if (end == p_decoderInputNames->__begin_ || 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3) < 5)
        {
LABEL_101:
          if (espresso_network_bind_buffer())
          {
            v122 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            espresso_plan_get_error_info();
            std::runtime_error::runtime_error(v122, v123);
            __cxa_throw(v122, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
          }
          if (espresso_network_bind_buffer())
          {
            v124 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            espresso_plan_get_error_info();
            std::runtime_error::runtime_error(v124, v125);
            __cxa_throw(v124, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
          }
          if (espresso_network_bind_buffer())
          {
            v126 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            espresso_plan_get_error_info();
            std::runtime_error::runtime_error(v126, v127);
            __cxa_throw(v126, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
          }
          if (0xAAAAAAAAAAAAAAABLL
             * (((char *)self->_decoderInputNames.__end_ - (char *)self->_decoderInputNames.__begin_) >> 3) >= 5)
          {
            if (espresso_network_bind_buffer())
            {
              v128 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              espresso_plan_get_error_info();
              std::runtime_error::runtime_error(v128, v129);
              __cxa_throw(v128, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
            }
            if (espresso_network_bind_buffer())
            {
              v130 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              espresso_plan_get_error_info();
              std::runtime_error::runtime_error(v130, v131);
              __cxa_throw(v130, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
            }
            if (espresso_network_bind_buffer())
            {
              v104 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              espresso_plan_get_error_info();
              std::runtime_error::runtime_error(v104, v105);
              __cxa_throw(v104, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
            }
          }
          goto LABEL_8;
        }
        v132 = (char *)self->_decoderInputNames.__end_;
        while (1)
        {
          if (begin[23] < 0)
          {
            sub_1B4BCA11C(__p, *(void **)begin, *((void *)begin + 1));
          }
          else
          {
            long long v59 = *(_OWORD *)begin;
            uint64_t v141 = *((void *)begin + 2);
            *(_OWORD *)__p = v59;
          }
          char v58 = HIBYTE(v141);
          uint64_t v60 = v141 >= 0 ? HIBYTE(v141) : (uint64_t)__p[1];
          v61 = v141 >= 0 ? __p : (void **)__p[0];
          if (v60 >= 5) {
            break;
          }
LABEL_24:
          if (v58 < 0)
          {
            operator delete(__p[0]);
            begin += 24;
            if (begin == end) {
              goto LABEL_101;
            }
          }
          else
          {
            begin += 24;
            if (begin == end) {
              goto LABEL_101;
            }
          }
        }
        v62 = (char *)v61 + v60;
        uint64_t v63 = v60;
        v64 = v61;
        while (1)
        {
          v65 = (char *)memchr(v64, 95, v63 - 4);
          if (!v65) {
            goto LABEL_24;
          }
          if (*(_DWORD *)v65 == 1767863135 && v65[4] == 110) {
            break;
          }
          v64 = (void **)(v65 + 1);
          uint64_t v63 = v62 - (char *)v64;
          if (v62 - (char *)v64 < 5) {
            goto LABEL_24;
          }
        }
        if (v65 == v62 || v65 - (char *)v61 == -1) {
          goto LABEL_24;
        }
        v67 = (void **)(v62 - 3);
        unint64_t v68 = (char *)v67 - (char *)v61;
        if ((unint64_t)((char *)v67 - (char *)v61) > 0x7FFFFFFFFFFFFFF7) {
          sub_1B4BB33D8();
        }
        if (v68 > 0x16)
        {
          uint64_t v77 = (v68 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v68 | 7) != 0x17) {
            uint64_t v77 = v68 | 7;
          }
          uint64_t v78 = v77 + 1;
          v69 = operator new(v77 + 1);
          int64_t v138 = (char *)v67 - (char *)v61;
          int64_t v139 = v78 | 0x8000000000000000;
          v137 = v69;
          if (v61 != v67)
          {
LABEL_51:
            uint64_t v70 = v60 - 3;
            if ((unint64_t)(v60 - 3) < 0x20 || (unint64_t)((char *)v69 - (char *)v61) < 0x20)
            {
              v71 = v69;
              v72 = v61;
            }
            else
            {
              v71 = (char *)v69 + (v70 & 0xFFFFFFFFFFFFFFE0);
              v72 = (void **)((char *)v61 + (v70 & 0xFFFFFFFFFFFFFFE0));
              v73 = (long long *)(v61 + 2);
              v74 = v69 + 1;
              unint64_t v75 = v70 & 0xFFFFFFFFFFFFFFE0;
              do
              {
                long long v76 = *v73;
                *(v74 - 1) = *(v73 - 1);
                _OWORD *v74 = v76;
                v73 += 2;
                v74 += 2;
                v75 -= 32;
              }
              while (v75);
              if (v70 == (v70 & 0xFFFFFFFFFFFFFFE0))
              {
LABEL_63:
                unsigned char *v71 = 0;
                v80 = operator new(0x28uLL);
                v80[4] = 0;
                *(_OWORD *)v80 = 0u;
                *((_OWORD *)v80 + 1) = 0u;
                v81 = sub_1B4C625D0((uint64_t **)&self->_stateInputEspressoBuffersShape, (const void **)__p, (uint64_t)__p);
                v82 = (void *)v81[7];
                if (v82)
                {
                  v81[8] = (uint64_t)v82;
                  operator delete(v82);
                  v81[7] = 0;
                  v81[8] = 0;
                  v81[9] = 0;
                }
                v81[7] = (uint64_t)v80;
                v81[8] = (uint64_t)(v80 + 5);
                v81[9] = (uint64_t)(v80 + 5);
                if (v139 >= 0) {
                  int64_t v83 = HIBYTE(v139);
                }
                else {
                  int64_t v83 = v138;
                }
                if (v139 >= 0) {
                  v84 = (char *)&v137;
                }
                else {
                  v84 = (char *)v137;
                }
                if (v83 >= 17)
                {
                  v85 = &v84[v83];
                  int64_t v86 = v83;
                  v87 = v84;
                  do
                  {
                    v88 = (char *)memchr(v87, 118, v86 - 16);
                    if (!v88) {
                      break;
                    }
                    if (*(void *)v88 == 0x5F616C6C696E6176
                      && *((void *)v88 + 1) == 0x6F69746E65747461
                      && v88[16] == 110)
                    {
                      if (v88 == v85 || v88 - v84 == -1) {
                        break;
                      }
                      __dst = __p;
                      v91 = sub_1B4C385B4((uint64_t **)&self->_stateInputEspressoBuffers, (const void **)__p, (uint64_t)&unk_1B4C9AE0A, (long long **)&__dst);
                      v93 = v91 + 7;
                      v92 = v91[7];
                      if (v92)
                      {
                        v91[8] = v92;
                        operator delete(v92);
                        void *v93 = 0;
                        v93[1] = 0;
                        v93[2] = 0;
                      }
                      void *v93 = 0;
                      v93[1] = 0;
                      v93[2] = 0;
                      goto LABEL_21;
                    }
                    v87 = v88 + 1;
                    int64_t v86 = v85 - (unsigned char *)v87;
                  }
                  while (v85 - (unsigned char *)v87 >= 17);
                }
                unint64_t v94 = v83 + 4;
                if ((unint64_t)(v83 + 4) > 0x7FFFFFFFFFFFFFF7) {
                  sub_1B4BB33D8();
                }
                if (v94 >= 0x17)
                {
                  uint64_t v96 = (v94 & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v94 | 7) != 0x17) {
                    uint64_t v96 = v94 | 7;
                  }
                  uint64_t v97 = v96 + 1;
                  p_dst = (long long *)operator new(v96 + 1);
                  int64_t v135 = v83 + 4;
                  unint64_t v136 = v97 | 0x8000000000000000;
                  __dst = (void **)p_dst;
                }
                else
                {
                  int64_t v135 = 0;
                  unint64_t v136 = 0;
                  __dst = 0;
                  p_dst = (long long *)&__dst;
                  HIBYTE(v136) = v83 + 4;
                  if (!v83)
                  {
LABEL_95:
                    strcpy((char *)p_dst + v83, "_out");
                    v98 = (uint64_t *)operator new(0xB800uLL);
                    bzero(v98, 0xB800uLL);
                    v142 = __p;
                    v99 = sub_1B4C385B4((uint64_t **)&self->_stateInputEspressoBuffers, (const void **)__p, (uint64_t)&unk_1B4C9AE0A, (long long **)&v142);
                    v100 = v99[7];
                    if (v100)
                    {
                      v99[8] = v100;
                      operator delete(v100);
                      v99[7] = 0;
                      v99[8] = 0;
                      v99[9] = 0;
                    }
                    v99[7] = v98;
                    v99[8] = v98 + 5888;
                    v99[9] = v98 + 5888;
                    v101 = (uint64_t *)operator new(0x800uLL);
                    bzero(v101, 0x800uLL);
                    v142 = (void **)&__dst;
                    v102 = sub_1B4C385B4((uint64_t **)&self->_stateOutputEspressoBuffers, (const void **)&__dst, (uint64_t)&unk_1B4C9AE0A, (long long **)&v142);
                    v103 = v102[7];
                    if (v103)
                    {
                      v102[8] = v103;
                      operator delete(v103);
                      v102[7] = 0;
                      v102[8] = 0;
                      v102[9] = 0;
                    }
                    v102[7] = v101;
                    v102[8] = v101 + 256;
                    v102[9] = v101 + 256;
                    if (SHIBYTE(v136) < 0) {
                      operator delete(__dst);
                    }
LABEL_21:
                    end = v132;
                    if (SHIBYTE(v139) < 0) {
                      operator delete(v137);
                    }
                    char v58 = HIBYTE(v141);
                    goto LABEL_24;
                  }
                }
                memmove(p_dst, v84, v83);
                goto LABEL_95;
              }
            }
            do
            {
              char v79 = *(unsigned char *)v72;
              v72 = (void **)((char *)v72 + 1);
              *v71++ = v79;
            }
            while (v72 != v67);
            goto LABEL_63;
          }
        }
        else
        {
          HIBYTE(v139) = (_BYTE)v67 - (_BYTE)v61;
          v69 = &v137;
          if (v61 != v67) {
            goto LABEL_51;
          }
        }
        v71 = v69;
        goto LABEL_63;
      }
      v12 = v32;
    }
    v33 = v133;

    BOOL v34 = 0;
    goto LABEL_19;
  }
  objc_msgSend_path(v12, v24, v25, v26);
  id v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v27, v28, v29, v30);
  int v31 = espresso_plan_add_network();

  if (v31)
  {
    v106 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v106, v107);
    __cxa_throw(v106, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (espresso_plan_build())
  {
    v108 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v108, v109);
    __cxa_throw(v108, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (espresso_network_bind_buffer())
  {
    v110 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v110, v111);
    __cxa_throw(v110, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (espresso_network_bind_buffer())
  {
    v112 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v112, v113);
    __cxa_throw(v112, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (espresso_network_bind_buffer())
  {
    v114 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v114, v115);
    __cxa_throw(v114, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  v32 = v12;
LABEL_8:
  v33 = v133;

  BOOL v34 = 1;
LABEL_19:

  return v34;
}

- (void)buildNetworkForSequenceLength:(unint64_t)a3 imageFeatures:(id)a4
{
  unint64_t p_stateInputEspressoBuffersShape = a3;
  uint64_t v562 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (0xAAAAAAAAAAAAAAABLL
     * (((char *)self->_decoderInputNames.__end_ - (char *)self->_decoderInputNames.__begin_) >> 3) < 5)
    goto LABEL_597;
  espresso_plan_build_clean();
  v540 = 0;
  v541 = 0;
  v542 = 0;
  v537 = 0;
  v538 = 0;
  v539 = 0;
  v534 = 0;
  v535 = 0;
  unint64_t v536 = 0;
  v531 = 0;
  v532 = 0;
  v533 = 0;
  v528 = 0;
  v529 = 0;
  __p[23] = 21;
  v530 = 0;
  strcpy(__p, "att_feats_placeholder");
  id v508 = v5;
  qmemcpy(v503, "ceholderatt_feats_placeh", sizeof(v503));
  v535 = sub_1B4BFB6B0(&v534, (uint64_t)__p);
  if ((__p[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)__p);
    v7 = v538;
    id v6 = v539;
    v507 = self;
    if (v538 < v539) {
      goto LABEL_4;
    }
LABEL_6:
    id v9 = (char *)v537;
    int64_t v10 = v7 - (unsigned char *)v537;
    uint64_t v11 = (v7 - (unsigned char *)v537) >> 2;
    unint64_t v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 62) {
      sub_1B4BB3244();
    }
    uint64_t v13 = v6 - (unsigned char *)v537;
    if (v13 >> 1 > v12) {
      unint64_t v12 = v13 >> 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v14)
    {
      if (v14 >> 62) {
        sub_1B4BB2D38();
      }
      uint64_t v15 = operator new(4 * v14);
    }
    else
    {
      uint64_t v15 = 0;
    }
    uint64_t v16 = &v15[4 * v11];
    v17 = &v15[4 * v14];
    *(_DWORD *)uint64_t v16 = 512;
    uint64_t v8 = v16 + 4;
    if (v7 != v9)
    {
      unint64_t v18 = v7 - v9 - 4;
      if (v18 < 0x2C) {
        goto LABEL_650;
      }
      if ((unint64_t)(v7 - v15 - v10) < 0x20) {
        goto LABEL_650;
      }
      uint64_t v19 = (v18 >> 2) + 1;
      uint64_t v20 = 4 * (v19 & 0x7FFFFFFFFFFFFFF8);
      uint64_t v21 = &v7[-v20];
      v16 -= v20;
      uint64_t v22 = &v15[4 * v11 - 16];
      int v23 = v7 - 16;
      uint64_t v24 = v19 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v25 = *(_OWORD *)v23;
        *(v22 - 1) = *((_OWORD *)v23 - 1);
        *uint64_t v22 = v25;
        v22 -= 2;
        v23 -= 32;
        v24 -= 8;
      }
      while (v24);
      v7 = v21;
      if (v19 != (v19 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_650:
        do
        {
          int v26 = *((_DWORD *)v7 - 1);
          v7 -= 4;
          *((_DWORD *)v16 - 1) = v26;
          v16 -= 4;
        }
        while (v7 != v9);
      }
    }
    v537 = v16;
    v538 = v8;
    v539 = v17;
    if (v9) {
      operator delete(v9);
    }
    goto LABEL_25;
  }
  v7 = v538;
  id v6 = v539;
  v507 = self;
  if (v538 >= v539) {
    goto LABEL_6;
  }
LABEL_4:
  *(_DWORD *)v7 = 512;
  uint64_t v8 = v7 + 4;
LABEL_25:
  v538 = v8;
  id v27 = v541;
  if (v541 >= v542)
  {
    uint64_t v29 = (char *)v540;
    int64_t v30 = v541 - (unsigned char *)v540;
    uint64_t v31 = (v541 - (unsigned char *)v540) >> 2;
    unint64_t v32 = v31 + 1;
    if ((unint64_t)(v31 + 1) >> 62) {
      sub_1B4BB3244();
    }
    uint64_t v33 = v542 - (unsigned char *)v540;
    if ((v542 - (unsigned char *)v540) >> 1 > v32) {
      unint64_t v32 = v33 >> 1;
    }
    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v34 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v34 = v32;
    }
    if (v34)
    {
      if (v34 >> 62) {
        sub_1B4BB2D38();
      }
      v35 = (char *)operator new(4 * v34);
    }
    else
    {
      v35 = 0;
    }
    uint64_t v36 = &v35[4 * v31];
    uint64_t v37 = &v35[4 * v34];
    *(_DWORD *)uint64_t v36 = 144;
    v28 = v36 + 4;
    if (v27 != v29)
    {
      unint64_t v38 = v27 - v29 - 4;
      if (v38 < 0x2C) {
        goto LABEL_651;
      }
      if ((unint64_t)(v27 - v35 - v30) < 0x20) {
        goto LABEL_651;
      }
      uint64_t v39 = (v38 >> 2) + 1;
      uint64_t v40 = 4 * (v39 & 0x7FFFFFFFFFFFFFF8);
      uint64_t v41 = &v27[-v40];
      v36 -= v40;
      v42 = &v35[4 * v31 - 16];
      v43 = v27 - 16;
      uint64_t v44 = v39 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v45 = *(_OWORD *)v43;
        *((_OWORD *)v42 - 1) = *((_OWORD *)v43 - 1);
        *(_OWORD *)v42 = v45;
        v42 -= 32;
        v43 -= 32;
        v44 -= 8;
      }
      while (v44);
      id v27 = v41;
      if (v39 != (v39 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_651:
        do
        {
          int v46 = *((_DWORD *)v27 - 1);
          v27 -= 4;
          *((_DWORD *)v36 - 1) = v46;
          v36 -= 4;
        }
        while (v27 != v29);
      }
    }
    v540 = v36;
    v541 = v28;
    v542 = v37;
    if (v29) {
      operator delete(v29);
    }
  }
  else
  {
    *(_DWORD *)v541 = 144;
    v28 = v27 + 4;
  }
  v541 = v28;
  uint64_t v47 = v532;
  if (v532 >= v533)
  {
    id v49 = (char *)v531;
    int64_t v50 = v532 - (unsigned char *)v531;
    uint64_t v51 = (v532 - (unsigned char *)v531) >> 2;
    unint64_t v52 = v51 + 1;
    if ((unint64_t)(v51 + 1) >> 62) {
      sub_1B4BB3244();
    }
    uint64_t v53 = v533 - (unsigned char *)v531;
    if ((v533 - (unsigned char *)v531) >> 1 > v52) {
      unint64_t v52 = v53 >> 1;
    }
    if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v54 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v54 = v52;
    }
    if (v54)
    {
      if (v54 >> 62) {
        sub_1B4BB2D38();
      }
      v55 = (char *)operator new(4 * v54);
    }
    else
    {
      v55 = 0;
    }
    v56 = &v55[4 * v51];
    v57 = &v55[4 * v54];
    *(_DWORD *)v56 = 1;
    uint64_t v48 = v56 + 4;
    if (v47 != v49)
    {
      unint64_t v58 = v47 - v49 - 4;
      if (v58 < 0x2C) {
        goto LABEL_652;
      }
      if ((unint64_t)(v47 - v55 - v50) < 0x20) {
        goto LABEL_652;
      }
      uint64_t v59 = (v58 >> 2) + 1;
      uint64_t v60 = 4 * (v59 & 0x7FFFFFFFFFFFFFF8);
      v61 = &v47[-v60];
      v56 -= v60;
      v62 = &v55[4 * v51 - 16];
      uint64_t v63 = v47 - 16;
      uint64_t v64 = v59 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v65 = *(_OWORD *)v63;
        *((_OWORD *)v62 - 1) = *((_OWORD *)v63 - 1);
        *(_OWORD *)v62 = v65;
        v62 -= 32;
        v63 -= 32;
        v64 -= 8;
      }
      while (v64);
      uint64_t v47 = v61;
      if (v59 != (v59 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_652:
        do
        {
          int v66 = *((_DWORD *)v47 - 1);
          v47 -= 4;
          *((_DWORD *)v56 - 1) = v66;
          v56 -= 4;
        }
        while (v47 != v49);
      }
    }
    v531 = v56;
    v532 = v48;
    v533 = v57;
    if (v49) {
      operator delete(v49);
    }
  }
  else
  {
    *(_DWORD *)v532 = 1;
    uint64_t v48 = v47 + 4;
  }
  v532 = v48;
  v67 = v529;
  if (v529 >= v530)
  {
    v69 = (char *)v528;
    int64_t v70 = v529 - (unsigned char *)v528;
    uint64_t v71 = (v529 - (unsigned char *)v528) >> 2;
    unint64_t v72 = v71 + 1;
    if ((unint64_t)(v71 + 1) >> 62) {
      sub_1B4BB3244();
    }
    uint64_t v73 = v530 - (unsigned char *)v528;
    if ((v530 - (unsigned char *)v528) >> 1 > v72) {
      unint64_t v72 = v73 >> 1;
    }
    if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v74 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v74 = v72;
    }
    if (v74)
    {
      if (v74 >> 62) {
        sub_1B4BB2D38();
      }
      unint64_t v75 = (char *)operator new(4 * v74);
    }
    else
    {
      unint64_t v75 = 0;
    }
    long long v76 = &v75[4 * v71];
    uint64_t v77 = &v75[4 * v74];
    *(_DWORD *)long long v76 = 1;
    unint64_t v68 = v76 + 4;
    if (v67 != v69)
    {
      unint64_t v78 = v67 - v69 - 4;
      if (v78 < 0x2C) {
        goto LABEL_653;
      }
      if ((unint64_t)(v67 - v75 - v70) < 0x20) {
        goto LABEL_653;
      }
      uint64_t v79 = (v78 >> 2) + 1;
      uint64_t v80 = 4 * (v79 & 0x7FFFFFFFFFFFFFF8);
      v81 = &v67[-v80];
      v76 -= v80;
      v82 = &v75[4 * v71 - 16];
      int64_t v83 = v67 - 16;
      uint64_t v84 = v79 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v85 = *(_OWORD *)v83;
        *((_OWORD *)v82 - 1) = *((_OWORD *)v83 - 1);
        *(_OWORD *)v82 = v85;
        v82 -= 32;
        v83 -= 32;
        v84 -= 8;
      }
      while (v84);
      v67 = v81;
      if (v79 != (v79 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_653:
        do
        {
          int v86 = *((_DWORD *)v67 - 1);
          v67 -= 4;
          *((_DWORD *)v76 - 1) = v86;
          v76 -= 4;
        }
        while (v67 != v69);
      }
    }
    v528 = v76;
    v529 = v68;
    v530 = v77;
    if (v69) {
      operator delete(v69);
    }
  }
  else
  {
    *(_DWORD *)v529 = 1;
    unint64_t v68 = v67 + 4;
  }
  uint64_t v87 = 0;
  v529 = v68;
  do
  {
    v90 = off_1E60A3B50[v87];
    size_t v91 = strlen(v90);
    if (v91 >= 0x7FFFFFFFFFFFFFF8) {
      sub_1B4BB33D8();
    }
    size_t v92 = v91;
    if (v91 >= 0x17)
    {
      uint64_t v109 = (v91 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v91 | 7) != 0x17) {
        uint64_t v109 = v91 | 7;
      }
      uint64_t v110 = v109 + 1;
      v93 = operator new(v109 + 1);
      *(void *)&__p[16] = v110 | 0x8000000000000000;
      *(void *)__p = v93;
      *(void *)&__p[8] = v92;
    }
    else
    {
      __p[23] = v91;
      v93 = __p;
      if (!v91)
      {
        __p[0] = 0;
        unint64_t v94 = v535;
        if ((unint64_t)v535 < v536) {
          goto LABEL_95;
        }
        goto LABEL_111;
      }
    }
    memmove(v93, v90, v92);
    v93[v92] = 0;
    unint64_t v94 = v535;
    if ((unint64_t)v535 < v536)
    {
LABEL_95:
      long long v95 = *(_OWORD *)__p;
      *((void *)v94 + 2) = *(void *)&__p[16];
      *(_OWORD *)unint64_t v94 = v95;
      v535 = v94 + 24;
      uint64_t v97 = v541;
      uint64_t v96 = v542;
      if (v541 < v542) {
        goto LABEL_113;
      }
      goto LABEL_96;
    }
LABEL_111:
    v535 = sub_1B4BFB6B0(&v534, (uint64_t)__p);
    if ((__p[23] & 0x80000000) != 0)
    {
      operator delete(*(void **)__p);
      uint64_t v97 = v541;
      uint64_t v96 = v542;
      if (v541 < v542)
      {
LABEL_113:
        *(_DWORD *)uint64_t v97 = 1;
        uint64_t v106 = (uint64_t)(v97 + 4);
        goto LABEL_125;
      }
    }
    else
    {
      uint64_t v97 = v541;
      uint64_t v96 = v542;
      if (v541 < v542) {
        goto LABEL_113;
      }
    }
LABEL_96:
    v98 = (char *)v540;
    int64_t v99 = v97 - (unsigned char *)v540;
    uint64_t v100 = (v97 - (unsigned char *)v540) >> 2;
    unint64_t v101 = v100 + 1;
    if ((unint64_t)(v100 + 1) >> 62) {
      sub_1B4BB3244();
    }
    uint64_t v102 = v96 - (unsigned char *)v540;
    if (v102 >> 1 > v101) {
      unint64_t v101 = v102 >> 1;
    }
    if ((unint64_t)v102 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v103 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v103 = v101;
    }
    if (v103)
    {
      if (v103 >> 62) {
        sub_1B4BB2D38();
      }
      v104 = operator new(4 * v103);
      v105 = &v104[4 * v100];
      _DWORD *v105 = 1;
      uint64_t v106 = (uint64_t)(v105 + 1);
      int64_t v107 = v97 - v98;
      if (v97 == v98) {
        goto LABEL_123;
      }
LABEL_105:
      unint64_t v108 = v107 - 4;
      if (v108 < 0x2C) {
        goto LABEL_654;
      }
      if ((unint64_t)(v97 - v104 - v99) < 0x20) {
        goto LABEL_654;
      }
      uint64_t v111 = (v108 >> 2) + 1;
      uint64_t v112 = 4 * (v111 & 0x7FFFFFFFFFFFFFF8);
      v113 = &v97[-v112];
      v105 = (_DWORD *)((char *)v105 - v112);
      v114 = &v104[4 * v100 - 16];
      v115 = v97 - 16;
      uint64_t v116 = v111 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v117 = *(_OWORD *)v115;
        *(v114 - 1) = *((_OWORD *)v115 - 1);
        _OWORD *v114 = v117;
        v114 -= 2;
        v115 -= 32;
        v116 -= 8;
      }
      while (v116);
      uint64_t v97 = v113;
      if (v111 != (v111 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_654:
        do
        {
          int v118 = *((_DWORD *)v97 - 1);
          v97 -= 4;
          *--v105 = v118;
        }
        while (v97 != v98);
      }
      goto LABEL_123;
    }
    v104 = 0;
    v105 = (_DWORD *)(4 * v100);
    *(_DWORD *)(4 * v100) = 1;
    uint64_t v106 = 4 * v100 + 4;
    int64_t v107 = v97 - v98;
    if (v97 != v98) {
      goto LABEL_105;
    }
LABEL_123:
    v540 = v105;
    v541 = (char *)v106;
    v542 = &v104[4 * v103];
    if (v98) {
      operator delete(v98);
    }
LABEL_125:
    v541 = (char *)v106;
    v119 = v538;
    if (v538 < v539)
    {
      *(_DWORD *)v538 = 1;
      uint64_t v120 = (uint64_t)(v119 + 4);
      goto LABEL_147;
    }
    v121 = (char *)v537;
    int64_t v122 = v538 - (unsigned char *)v537;
    uint64_t v123 = (v538 - (unsigned char *)v537) >> 2;
    unint64_t v124 = v123 + 1;
    if ((unint64_t)(v123 + 1) >> 62) {
      sub_1B4BB3244();
    }
    uint64_t v125 = v539 - (unsigned char *)v537;
    if ((v539 - (unsigned char *)v537) >> 1 > v124) {
      unint64_t v124 = v125 >> 1;
    }
    if ((unint64_t)v125 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v126 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v126 = v124;
    }
    if (v126)
    {
      if (v126 >> 62) {
        sub_1B4BB2D38();
      }
      v127 = (char *)operator new(4 * v126);
      v128 = &v127[4 * v123];
      *(_DWORD *)v128 = 1;
      uint64_t v120 = (uint64_t)(v128 + 4);
      int64_t v129 = v119 - v121;
      if (v119 == v121) {
        goto LABEL_145;
      }
LABEL_136:
      unint64_t v130 = v129 - 4;
      if (v130 < 0x2C) {
        goto LABEL_655;
      }
      if ((unint64_t)(v119 - v127 - v122) < 0x20) {
        goto LABEL_655;
      }
      uint64_t v131 = (v130 >> 2) + 1;
      uint64_t v132 = 4 * (v131 & 0x7FFFFFFFFFFFFFF8);
      v133 = &v119[-v132];
      v128 -= v132;
      v134 = &v127[4 * v123 - 16];
      int64_t v135 = v119 - 16;
      uint64_t v136 = v131 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v137 = *(_OWORD *)v135;
        *((_OWORD *)v134 - 1) = *((_OWORD *)v135 - 1);
        *(_OWORD *)v134 = v137;
        v134 -= 32;
        v135 -= 32;
        v136 -= 8;
      }
      while (v136);
      v119 = v133;
      if (v131 != (v131 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_655:
        do
        {
          int v138 = *((_DWORD *)v119 - 1);
          v119 -= 4;
          *((_DWORD *)v128 - 1) = v138;
          v128 -= 4;
        }
        while (v119 != v121);
      }
      goto LABEL_145;
    }
    v127 = 0;
    v128 = (char *)(4 * v123);
    *(_DWORD *)(4 * v123) = 1;
    uint64_t v120 = 4 * v123 + 4;
    int64_t v129 = v119 - v121;
    if (v119 != v121) {
      goto LABEL_136;
    }
LABEL_145:
    v537 = v128;
    v538 = (char *)v120;
    v539 = &v127[4 * v126];
    if (v121) {
      operator delete(v121);
    }
LABEL_147:
    v538 = (char *)v120;
    int64_t v139 = v532;
    if (v532 < v533)
    {
      *(_DWORD *)v532 = 1;
      uint64_t v140 = (uint64_t)(v139 + 4);
      goto LABEL_169;
    }
    uint64_t v141 = (char *)v531;
    int64_t v142 = v532 - (unsigned char *)v531;
    uint64_t v143 = (v532 - (unsigned char *)v531) >> 2;
    unint64_t v144 = v143 + 1;
    if ((unint64_t)(v143 + 1) >> 62) {
      sub_1B4BB3244();
    }
    uint64_t v145 = v533 - (unsigned char *)v531;
    if ((v533 - (unsigned char *)v531) >> 1 > v144) {
      unint64_t v144 = v145 >> 1;
    }
    if ((unint64_t)v145 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v146 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v146 = v144;
    }
    if (v146)
    {
      if (v146 >> 62) {
        sub_1B4BB2D38();
      }
      v147 = (char *)operator new(4 * v146);
      v148 = &v147[4 * v143];
      *(_DWORD *)v148 = 1;
      uint64_t v140 = (uint64_t)(v148 + 4);
      int64_t v149 = v139 - v141;
      if (v139 == v141) {
        goto LABEL_167;
      }
LABEL_158:
      unint64_t v150 = v149 - 4;
      if (v150 < 0x2C) {
        goto LABEL_656;
      }
      if ((unint64_t)(v139 - v147 - v142) < 0x20) {
        goto LABEL_656;
      }
      uint64_t v151 = (v150 >> 2) + 1;
      uint64_t v152 = 4 * (v151 & 0x7FFFFFFFFFFFFFF8);
      v153 = &v139[-v152];
      v148 -= v152;
      v154 = &v147[4 * v143 - 16];
      v155 = v139 - 16;
      uint64_t v156 = v151 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v157 = *(_OWORD *)v155;
        *((_OWORD *)v154 - 1) = *((_OWORD *)v155 - 1);
        *(_OWORD *)v154 = v157;
        v154 -= 32;
        v155 -= 32;
        v156 -= 8;
      }
      while (v156);
      int64_t v139 = v153;
      if (v151 != (v151 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_656:
        do
        {
          int v158 = *((_DWORD *)v139 - 1);
          v139 -= 4;
          *((_DWORD *)v148 - 1) = v158;
          v148 -= 4;
        }
        while (v139 != v141);
      }
      goto LABEL_167;
    }
    v147 = 0;
    v148 = (char *)(4 * v143);
    *(_DWORD *)(4 * v143) = 1;
    uint64_t v140 = 4 * v143 + 4;
    int64_t v149 = v139 - v141;
    if (v139 != v141) {
      goto LABEL_158;
    }
LABEL_167:
    v531 = v148;
    v532 = (char *)v140;
    v533 = &v147[4 * v146];
    if (v141) {
      operator delete(v141);
    }
LABEL_169:
    v532 = (char *)v140;
    v159 = v529;
    if (v529 < v530)
    {
      *(_DWORD *)v529 = 1;
      uint64_t v88 = (uint64_t)(v159 + 4);
      goto LABEL_90;
    }
    v160 = (char *)v528;
    int64_t v161 = v529 - (unsigned char *)v528;
    uint64_t v162 = (v529 - (unsigned char *)v528) >> 2;
    unint64_t v163 = v162 + 1;
    if ((unint64_t)(v162 + 1) >> 62) {
      sub_1B4BB3244();
    }
    uint64_t v164 = v530 - (unsigned char *)v528;
    if ((v530 - (unsigned char *)v528) >> 1 > v163) {
      unint64_t v163 = v164 >> 1;
    }
    if ((unint64_t)v164 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v165 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v165 = v163;
    }
    if (v165)
    {
      if (v165 >> 62) {
        sub_1B4BB2D38();
      }
      v166 = (char *)operator new(4 * v165);
      v167 = &v166[4 * v162];
      *(_DWORD *)v167 = 1;
      uint64_t v88 = (uint64_t)(v167 + 4);
      int64_t v168 = v159 - v160;
      if (v159 == v160) {
        goto LABEL_188;
      }
LABEL_179:
      unint64_t v169 = v168 - 4;
      if (v169 < 0x2C) {
        goto LABEL_657;
      }
      if ((unint64_t)(v159 - v166 - v161) < 0x20) {
        goto LABEL_657;
      }
      uint64_t v170 = (v169 >> 2) + 1;
      uint64_t v171 = 4 * (v170 & 0x7FFFFFFFFFFFFFF8);
      v172 = &v159[-v171];
      v167 -= v171;
      v173 = &v166[4 * v162 - 16];
      v174 = v159 - 16;
      uint64_t v175 = v170 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v176 = *(_OWORD *)v174;
        *((_OWORD *)v173 - 1) = *((_OWORD *)v174 - 1);
        *(_OWORD *)v173 = v176;
        v173 -= 32;
        v174 -= 32;
        v175 -= 8;
      }
      while (v175);
      v159 = v172;
      if (v170 != (v170 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_657:
        do
        {
          int v177 = *((_DWORD *)v159 - 1);
          v159 -= 4;
          *((_DWORD *)v167 - 1) = v177;
          v167 -= 4;
        }
        while (v159 != v160);
      }
      goto LABEL_188;
    }
    v166 = 0;
    v167 = (char *)(4 * v162);
    *(_DWORD *)(4 * v162) = 1;
    uint64_t v88 = 4 * v162 + 4;
    int64_t v168 = v159 - v160;
    if (v159 != v160) {
      goto LABEL_179;
    }
LABEL_188:
    v528 = v167;
    v529 = (char *)v88;
    v530 = &v166[4 * v165];
    if (v160) {
      operator delete(v160);
    }
LABEL_90:
    v89 = v507;
    v529 = (char *)v88;
    ++v87;
  }
  while (v87 != 4);
  __val[0] = 0;
  p_stateOutputEspressoBuffers = (uint64_t **)&v511[1];
  do
  {
    char v178 = 0;
    uint64_t v179 = 0;
    v559 = "self_attention";
    v560 = "vanilla_attention";
    do
    {
      char v180 = v178;
      v181 = (&v559)[v179];
      std::to_string(&v546, __val[0]);
      v182 = std::string::append(&v546, "/");
      long long v183 = *(_OWORD *)&v182->__r_.__value_.__l.__data_;
      __dst.__r_.__value_.__r.__words[2] = v182->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v183;
      v182->__r_.__value_.__l.__size_ = 0;
      v182->__r_.__value_.__r.__words[2] = 0;
      v182->__r_.__value_.__r.__words[0] = 0;
      v184 = std::string::append(&__dst, v181);
      long long v185 = *(_OWORD *)&v184->__r_.__value_.__l.__data_;
      *(void *)&__p[16] = *((void *)&v184->__r_.__value_.__l + 2);
      *(_OWORD *)__p = v185;
      v184->__r_.__value_.__l.__size_ = 0;
      v184->__r_.__value_.__r.__words[2] = 0;
      v184->__r_.__value_.__r.__words[0] = 0;
      v186 = std::string::append((std::string *)__p, "_k_s_in");
      long long v187 = *(_OWORD *)&v186->__r_.__value_.__l.__data_;
      *(void *)&long long v512 = *((void *)&v186->__r_.__value_.__l + 2);
      *(_OWORD *)v511 = v187;
      v186->__r_.__value_.__l.__size_ = 0;
      v186->__r_.__value_.__r.__words[2] = 0;
      v186->__r_.__value_.__r.__words[0] = 0;
      if ((__p[23] & 0x80000000) != 0)
      {
        operator delete(*(void **)__p);
        if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
        {
LABEL_214:
          operator delete(__dst.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v546.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_197;
          }
          goto LABEL_215;
        }
      }
      else if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      {
        goto LABEL_214;
      }
      if ((SHIBYTE(v546.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_197;
      }
LABEL_215:
      operator delete(v546.__r_.__value_.__l.__data_);
LABEL_197:
      p_decoderNet = &v89->_decoderNet;
      if (espresso_network_query_blob_dimensions())
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        espresso_plan_get_error_info();
        std::runtime_error::runtime_error(exception, v473);
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      v188 = v535;
      if ((unint64_t)v535 >= v536)
      {
        v535 = sub_1B4C1A83C((char **)&v534, (uint64_t)v511);
        int v190 = *(_DWORD *)__p;
        v192 = v532;
        v191 = v533;
        if (v532 < v533) {
          goto LABEL_212;
        }
      }
      else if (SBYTE7(v512) < 0)
      {
        sub_1B4BCA11C(v535, v511[0], (unint64_t)v511[1]);
        v535 = v188 + 24;
        int v190 = *(_DWORD *)__p;
        v192 = v532;
        v191 = v533;
        if (v532 < v533)
        {
LABEL_212:
          *(_DWORD *)v192 = v190;
          uint64_t v201 = (uint64_t)(v192 + 4);
          goto LABEL_227;
        }
      }
      else
      {
        long long v189 = *(_OWORD *)v511;
        *((void *)v535 + 2) = v512;
        *(_OWORD *)v188 = v189;
        v535 = v188 + 24;
        int v190 = *(_DWORD *)__p;
        v192 = v532;
        v191 = v533;
        if (v532 < v533) {
          goto LABEL_212;
        }
      }
      v193 = (char *)v531;
      int64_t v194 = v192 - (unsigned char *)v531;
      uint64_t v195 = (v192 - (unsigned char *)v531) >> 2;
      unint64_t v196 = v195 + 1;
      if ((unint64_t)(v195 + 1) >> 62) {
        sub_1B4BB3244();
      }
      uint64_t v197 = v191 - (unsigned char *)v531;
      if (v197 >> 1 > v196) {
        unint64_t v196 = v197 >> 1;
      }
      if ((unint64_t)v197 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v198 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v198 = v196;
      }
      if (v198)
      {
        if (v198 >> 62) {
          sub_1B4BB2D38();
        }
        v199 = operator new(4 * v198);
        v200 = &v199[4 * v195];
        _DWORD *v200 = v190;
        uint64_t v201 = (uint64_t)(v200 + 1);
        int64_t v202 = v192 - v193;
        if (v192 == v193) {
          goto LABEL_225;
        }
LABEL_219:
        unint64_t v203 = v202 - 4;
        if (v203 < 0x2C) {
          goto LABEL_658;
        }
        if ((unint64_t)(v192 - v199 - v194) < 0x20) {
          goto LABEL_658;
        }
        uint64_t v204 = (v203 >> 2) + 1;
        uint64_t v205 = 4 * (v204 & 0x7FFFFFFFFFFFFFF8);
        v206 = &v192[-v205];
        v200 = (_DWORD *)((char *)v200 - v205);
        v207 = &v199[4 * v195 - 16];
        v208 = v192 - 16;
        uint64_t v209 = v204 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v210 = *(_OWORD *)v208;
          *(v207 - 1) = *((_OWORD *)v208 - 1);
          _OWORD *v207 = v210;
          v207 -= 2;
          v208 -= 32;
          v209 -= 8;
        }
        while (v209);
        v192 = v206;
        if (v204 != (v204 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_658:
          do
          {
            int v211 = *((_DWORD *)v192 - 1);
            v192 -= 4;
            *--v200 = v211;
          }
          while (v192 != v193);
        }
        goto LABEL_225;
      }
      v199 = 0;
      v200 = (_DWORD *)(4 * v195);
      *(_DWORD *)(4 * v195) = v190;
      uint64_t v201 = 4 * v195 + 4;
      int64_t v202 = v192 - v193;
      if (v192 != v193) {
        goto LABEL_219;
      }
LABEL_225:
      v531 = v200;
      v532 = (char *)v201;
      v533 = &v199[4 * v198];
      if (v193) {
        operator delete(v193);
      }
LABEL_227:
      v532 = (char *)v201;
      if (v181 == "vanilla_attention") {
        int v212 = 0;
      }
      else {
        int v212 = p_stateInputEspressoBuffersShape;
      }
      v213 = v529;
      if (v529 < v530)
      {
        *(_DWORD *)v529 = v212;
        uint64_t v214 = (uint64_t)(v213 + 4);
        goto LABEL_251;
      }
      v215 = (char *)v528;
      int64_t v216 = v529 - (unsigned char *)v528;
      uint64_t v217 = (v529 - (unsigned char *)v528) >> 2;
      unint64_t v218 = v217 + 1;
      if ((unint64_t)(v217 + 1) >> 62) {
        sub_1B4BB3244();
      }
      uint64_t v219 = v530 - (unsigned char *)v528;
      if ((v530 - (unsigned char *)v528) >> 1 > v218) {
        unint64_t v218 = v219 >> 1;
      }
      if ((unint64_t)v219 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v220 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v220 = v218;
      }
      if (v220)
      {
        if (v220 >> 62) {
          sub_1B4BB2D38();
        }
        v221 = (char *)operator new(4 * v220);
        v222 = &v221[4 * v217];
        *(_DWORD *)v222 = v212;
        uint64_t v214 = (uint64_t)(v222 + 4);
        int64_t v223 = v213 - v215;
        if (v213 == v215) {
          goto LABEL_249;
        }
LABEL_243:
        unint64_t v224 = v223 - 4;
        if (v224 < 0x2C) {
          goto LABEL_659;
        }
        if ((unint64_t)(v213 - &v221[v216]) < 0x20) {
          goto LABEL_659;
        }
        uint64_t v225 = (v224 >> 2) + 1;
        uint64_t v226 = 4 * (v225 & 0x7FFFFFFFFFFFFFF8);
        v227 = &v213[-v226];
        v222 -= v226;
        v228 = &v221[4 * v217 - 16];
        v229 = v213 - 16;
        uint64_t v230 = v225 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v231 = *(_OWORD *)v229;
          *((_OWORD *)v228 - 1) = *((_OWORD *)v229 - 1);
          *(_OWORD *)v228 = v231;
          v228 -= 32;
          v229 -= 32;
          v230 -= 8;
        }
        while (v230);
        v213 = v227;
        if (v225 != (v225 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_659:
          do
          {
            int v232 = *((_DWORD *)v213 - 1);
            v213 -= 4;
            *((_DWORD *)v222 - 1) = v232;
            v222 -= 4;
          }
          while (v213 != v215);
        }
        goto LABEL_249;
      }
      v221 = 0;
      v222 = (char *)(4 * v217);
      *(_DWORD *)(4 * v217) = v212;
      uint64_t v214 = 4 * v217 + 4;
      int64_t v223 = v213 - v215;
      if (v213 != v215) {
        goto LABEL_243;
      }
LABEL_249:
      v528 = v222;
      v529 = (char *)v214;
      v530 = &v221[4 * v220];
      if (v215) {
        operator delete(v215);
      }
LABEL_251:
      v529 = (char *)v214;
      int v233 = *(_DWORD *)&__p[16];
      v234 = v541;
      if (v541 < v542)
      {
        *(_DWORD *)v541 = *(_DWORD *)&__p[16];
        uint64_t v235 = (uint64_t)(v234 + 4);
        goto LABEL_273;
      }
      v236 = (char *)v540;
      int64_t v237 = v541 - (unsigned char *)v540;
      uint64_t v238 = (v541 - (unsigned char *)v540) >> 2;
      unint64_t v239 = v238 + 1;
      if ((unint64_t)(v238 + 1) >> 62) {
        sub_1B4BB3244();
      }
      uint64_t v240 = v542 - (unsigned char *)v540;
      if ((v542 - (unsigned char *)v540) >> 1 > v239) {
        unint64_t v239 = v240 >> 1;
      }
      if ((unint64_t)v240 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v241 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v241 = v239;
      }
      if (v241)
      {
        if (v241 >> 62) {
          sub_1B4BB2D38();
        }
        v242 = (char *)operator new(4 * v241);
        v243 = &v242[4 * v238];
        *(_DWORD *)v243 = v233;
        uint64_t v235 = (uint64_t)(v243 + 4);
        int64_t v244 = v234 - v236;
        if (v234 == v236)
        {
LABEL_265:
          v89 = v507;
          goto LABEL_271;
        }
      }
      else
      {
        v242 = 0;
        v243 = (char *)(4 * v238);
        *(_DWORD *)(4 * v238) = *(_DWORD *)&__p[16];
        uint64_t v235 = 4 * v238 + 4;
        int64_t v244 = v234 - v236;
        if (v234 == v236) {
          goto LABEL_265;
        }
      }
      unint64_t v245 = v244 - 4;
      if (v245 < 0x2C)
      {
        v89 = v507;
        do
        {
LABEL_270:
          int v254 = *((_DWORD *)v234 - 1);
          v234 -= 4;
          *((_DWORD *)v243 - 1) = v254;
          v243 -= 4;
        }
        while (v234 != v236);
        goto LABEL_271;
      }
      unint64_t v246 = v234 - &v242[v237];
      v89 = v507;
      if (v246 < 0x20) {
        goto LABEL_270;
      }
      uint64_t v247 = (v245 >> 2) + 1;
      uint64_t v248 = 4 * (v247 & 0x7FFFFFFFFFFFFFF8);
      v249 = &v234[-v248];
      v243 -= v248;
      v250 = &v242[4 * v238 - 16];
      v251 = v234 - 16;
      uint64_t v252 = v247 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v253 = *(_OWORD *)v251;
        *((_OWORD *)v250 - 1) = *((_OWORD *)v251 - 1);
        *(_OWORD *)v250 = v253;
        v250 -= 32;
        v251 -= 32;
        v252 -= 8;
      }
      while (v252);
      v234 = v249;
      if (v247 != (v247 & 0x7FFFFFFFFFFFFFF8)) {
        goto LABEL_270;
      }
LABEL_271:
      v540 = v243;
      v541 = (char *)v235;
      v542 = &v242[4 * v241];
      if (v236) {
        operator delete(v236);
      }
LABEL_273:
      v541 = (char *)v235;
      v255 = v538;
      if (v538 < v539)
      {
        *(_DWORD *)v538 = 1;
        uint64_t v256 = (uint64_t)(v255 + 4);
        goto LABEL_294;
      }
      v257 = (char *)v537;
      int64_t v258 = v538 - (unsigned char *)v537;
      uint64_t v259 = (v538 - (unsigned char *)v537) >> 2;
      unint64_t v260 = v259 + 1;
      if ((unint64_t)(v259 + 1) >> 62) {
        sub_1B4BB3244();
      }
      uint64_t v261 = v539 - (unsigned char *)v537;
      if ((v539 - (unsigned char *)v537) >> 1 > v260) {
        unint64_t v260 = v261 >> 1;
      }
      if ((unint64_t)v261 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v262 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v262 = v260;
      }
      if (v262)
      {
        if (v262 >> 62) {
          sub_1B4BB2D38();
        }
        v263 = (char *)operator new(4 * v262);
        v264 = &v263[4 * v259];
        *(_DWORD *)v264 = 1;
        uint64_t v256 = (uint64_t)(v264 + 4);
        int64_t v265 = v255 - v257;
        if (v255 == v257) {
          goto LABEL_292;
        }
LABEL_286:
        unint64_t v266 = v265 - 4;
        if (v266 < 0x2C) {
          goto LABEL_660;
        }
        if ((unint64_t)(v255 - v263 - v258) < 0x20) {
          goto LABEL_660;
        }
        uint64_t v267 = (v266 >> 2) + 1;
        uint64_t v268 = 4 * (v267 & 0x7FFFFFFFFFFFFFF8);
        v269 = &v255[-v268];
        v264 -= v268;
        v270 = &v263[4 * v259 - 16];
        v271 = v255 - 16;
        uint64_t v272 = v267 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v273 = *(_OWORD *)v271;
          *((_OWORD *)v270 - 1) = *((_OWORD *)v271 - 1);
          *(_OWORD *)v270 = v273;
          v270 -= 32;
          v271 -= 32;
          v272 -= 8;
        }
        while (v272);
        v255 = v269;
        if (v267 != (v267 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_660:
          do
          {
            int v274 = *((_DWORD *)v255 - 1);
            v255 -= 4;
            *((_DWORD *)v264 - 1) = v274;
            v264 -= 4;
          }
          while (v255 != v257);
        }
        goto LABEL_292;
      }
      v263 = 0;
      v264 = (char *)(4 * v259);
      *(_DWORD *)(4 * v259) = 1;
      uint64_t v256 = 4 * v259 + 4;
      int64_t v265 = v255 - v257;
      if (v255 != v257) {
        goto LABEL_286;
      }
LABEL_292:
      v537 = v264;
      v538 = (char *)v256;
      v539 = &v263[4 * v262];
      if (v257) {
        operator delete(v257);
      }
LABEL_294:
      id v5 = v508;
      v538 = (char *)v256;
      std::to_string(&v545, __val[0]);
      v275 = std::string::append(&v545, "/");
      long long v276 = *(_OWORD *)&v275->__r_.__value_.__l.__data_;
      v546.__r_.__value_.__r.__words[2] = v275->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v546.__r_.__value_.__l.__data_ = v276;
      v275->__r_.__value_.__l.__size_ = 0;
      v275->__r_.__value_.__r.__words[2] = 0;
      v275->__r_.__value_.__r.__words[0] = 0;
      v277 = std::string::append(&v546, v181);
      long long v278 = *(_OWORD *)&v277->__r_.__value_.__l.__data_;
      __dst.__r_.__value_.__r.__words[2] = v277->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v278;
      v277->__r_.__value_.__l.__size_ = 0;
      v277->__r_.__value_.__r.__words[2] = 0;
      v277->__r_.__value_.__r.__words[0] = 0;
      v279 = std::string::append(&__dst, "_v_s_in");
      v280 = (void *)v279->__r_.__value_.__r.__words[0];
      *(void *)&long long v557 = v279->__r_.__value_.__l.__size_;
      *(void *)((char *)&v557 + 7) = *(std::string::size_type *)((char *)&v279->__r_.__value_.__r.__words[1] + 7);
      char v281 = HIBYTE(v279->__r_.__value_.__r.__words[2]);
      v279->__r_.__value_.__l.__size_ = 0;
      v279->__r_.__value_.__r.__words[2] = 0;
      v279->__r_.__value_.__r.__words[0] = 0;
      if (SBYTE7(v512) < 0) {
        operator delete(v511[0]);
      }
      v511[0] = v280;
      *p_stateOutputEspressoBuffers = (uint64_t *)v557;
      *(uint64_t **)((char *)p_stateOutputEspressoBuffers + 7) = *(uint64_t **)((char *)&v557 + 7);
      BYTE7(v512) = v281;
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__dst.__r_.__value_.__l.__data_);
        if (SHIBYTE(v546.__r_.__value_.__r.__words[2]) < 0)
        {
LABEL_317:
          operator delete(v546.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v545.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_299;
          }
          goto LABEL_318;
        }
      }
      else if (SHIBYTE(v546.__r_.__value_.__r.__words[2]) < 0)
      {
        goto LABEL_317;
      }
      if ((SHIBYTE(v545.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_299;
      }
LABEL_318:
      operator delete(v545.__r_.__value_.__l.__data_);
LABEL_299:
      if (espresso_network_query_blob_dimensions())
      {
        v474 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        espresso_plan_get_error_info();
        std::runtime_error::runtime_error(v474, v475);
        __cxa_throw(v474, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      v282 = v535;
      if ((unint64_t)v535 >= v536)
      {
        v535 = sub_1B4C1A83C((char **)&v534, (uint64_t)v511);
        int v284 = *(_DWORD *)__p;
        v286 = v532;
        v285 = v533;
        if (v532 < v533) {
          goto LABEL_315;
        }
      }
      else if (SBYTE7(v512) < 0)
      {
        sub_1B4BCA11C(v535, v511[0], (unint64_t)v511[1]);
        v535 = v282 + 24;
        int v284 = *(_DWORD *)__p;
        v286 = v532;
        v285 = v533;
        if (v532 < v533)
        {
LABEL_315:
          *(_DWORD *)v286 = v284;
          uint64_t v295 = (uint64_t)(v286 + 4);
          goto LABEL_330;
        }
      }
      else
      {
        long long v283 = *(_OWORD *)v511;
        *((void *)v535 + 2) = v512;
        *(_OWORD *)v282 = v283;
        v535 = v282 + 24;
        int v284 = *(_DWORD *)__p;
        v286 = v532;
        v285 = v533;
        if (v532 < v533) {
          goto LABEL_315;
        }
      }
      v287 = (char *)v531;
      int64_t v288 = v286 - (unsigned char *)v531;
      uint64_t v289 = (v286 - (unsigned char *)v531) >> 2;
      unint64_t v290 = v289 + 1;
      if ((unint64_t)(v289 + 1) >> 62) {
        sub_1B4BB3244();
      }
      uint64_t v291 = v285 - (unsigned char *)v531;
      if (v291 >> 1 > v290) {
        unint64_t v290 = v291 >> 1;
      }
      if ((unint64_t)v291 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v292 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v292 = v290;
      }
      if (v292)
      {
        if (v292 >> 62) {
          sub_1B4BB2D38();
        }
        v293 = operator new(4 * v292);
        v294 = &v293[4 * v289];
        _DWORD *v294 = v284;
        uint64_t v295 = (uint64_t)(v294 + 1);
        int64_t v296 = v286 - v287;
        if (v286 == v287)
        {
LABEL_322:
          id v5 = v508;
          goto LABEL_328;
        }
      }
      else
      {
        v293 = 0;
        v294 = (_DWORD *)(4 * v289);
        *(_DWORD *)(4 * v289) = v284;
        uint64_t v295 = 4 * v289 + 4;
        int64_t v296 = v286 - v287;
        if (v286 == v287) {
          goto LABEL_322;
        }
      }
      unint64_t v297 = v296 - 4;
      if (v297 < 0x2C)
      {
        id v5 = v508;
        do
        {
LABEL_327:
          int v306 = *((_DWORD *)v286 - 1);
          v286 -= 4;
          *--v294 = v306;
        }
        while (v286 != v287);
        goto LABEL_328;
      }
      unint64_t v298 = v286 - v293 - v288;
      id v5 = v508;
      if (v298 < 0x20) {
        goto LABEL_327;
      }
      uint64_t v299 = (v297 >> 2) + 1;
      uint64_t v300 = 4 * (v299 & 0x7FFFFFFFFFFFFFF8);
      v301 = &v286[-v300];
      v294 = (_DWORD *)((char *)v294 - v300);
      v302 = &v293[4 * v289 - 16];
      v303 = v286 - 16;
      uint64_t v304 = v299 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v305 = *(_OWORD *)v303;
        *(v302 - 1) = *((_OWORD *)v303 - 1);
        _OWORD *v302 = v305;
        v302 -= 2;
        v303 -= 32;
        v304 -= 8;
      }
      while (v304);
      v286 = v301;
      if (v299 != (v299 & 0x7FFFFFFFFFFFFFF8)) {
        goto LABEL_327;
      }
LABEL_328:
      v531 = v294;
      v532 = (char *)v295;
      v533 = &v293[4 * v292];
      if (v287) {
        operator delete(v287);
      }
LABEL_330:
      v532 = (char *)v295;
      v307 = v529;
      if (v529 < v530)
      {
        *(_DWORD *)v529 = v212;
        uint64_t v308 = (uint64_t)(v307 + 4);
        goto LABEL_351;
      }
      v309 = (char *)v528;
      int64_t v310 = v529 - (unsigned char *)v528;
      uint64_t v311 = (v529 - (unsigned char *)v528) >> 2;
      unint64_t v312 = v311 + 1;
      if ((unint64_t)(v311 + 1) >> 62) {
        sub_1B4BB3244();
      }
      uint64_t v313 = v530 - (unsigned char *)v528;
      if ((v530 - (unsigned char *)v528) >> 1 > v312) {
        unint64_t v312 = v313 >> 1;
      }
      if ((unint64_t)v313 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v314 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v314 = v312;
      }
      if (v314)
      {
        if (v314 >> 62) {
          sub_1B4BB2D38();
        }
        v315 = (char *)operator new(4 * v314);
        v316 = &v315[4 * v311];
        *(_DWORD *)v316 = v212;
        uint64_t v308 = (uint64_t)(v316 + 4);
        int64_t v317 = v307 - v309;
        if (v307 == v309) {
          goto LABEL_349;
        }
LABEL_343:
        unint64_t v318 = v317 - 4;
        if (v318 < 0x2C) {
          goto LABEL_661;
        }
        if ((unint64_t)(v307 - &v315[v310]) < 0x20) {
          goto LABEL_661;
        }
        uint64_t v319 = (v318 >> 2) + 1;
        uint64_t v320 = 4 * (v319 & 0x7FFFFFFFFFFFFFF8);
        v321 = &v307[-v320];
        v316 -= v320;
        v322 = &v315[4 * v311 - 16];
        v323 = v307 - 16;
        uint64_t v324 = v319 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v325 = *(_OWORD *)v323;
          *((_OWORD *)v322 - 1) = *((_OWORD *)v323 - 1);
          *(_OWORD *)v322 = v325;
          v322 -= 32;
          v323 -= 32;
          v324 -= 8;
        }
        while (v324);
        v307 = v321;
        if (v319 != (v319 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_661:
          do
          {
            int v326 = *((_DWORD *)v307 - 1);
            v307 -= 4;
            *((_DWORD *)v316 - 1) = v326;
            v316 -= 4;
          }
          while (v307 != v309);
        }
        goto LABEL_349;
      }
      v315 = 0;
      v316 = (char *)(4 * v311);
      *(_DWORD *)(4 * v311) = v212;
      uint64_t v308 = 4 * v311 + 4;
      int64_t v317 = v307 - v309;
      if (v307 != v309) {
        goto LABEL_343;
      }
LABEL_349:
      v528 = v316;
      v529 = (char *)v308;
      v530 = &v315[4 * v314];
      if (v309) {
        operator delete(v309);
      }
LABEL_351:
      v529 = (char *)v308;
      int v327 = *(_DWORD *)&__p[16];
      v328 = v541;
      if (v541 < v542)
      {
        *(_DWORD *)v541 = *(_DWORD *)&__p[16];
        uint64_t v329 = (uint64_t)(v328 + 4);
        goto LABEL_373;
      }
      v330 = (char *)v540;
      int64_t v331 = v541 - (unsigned char *)v540;
      uint64_t v332 = (v541 - (unsigned char *)v540) >> 2;
      unint64_t v333 = v332 + 1;
      if ((unint64_t)(v332 + 1) >> 62) {
        sub_1B4BB3244();
      }
      uint64_t v334 = v542 - (unsigned char *)v540;
      if ((v542 - (unsigned char *)v540) >> 1 > v333) {
        unint64_t v333 = v334 >> 1;
      }
      if ((unint64_t)v334 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v335 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v335 = v333;
      }
      if (v335)
      {
        if (v335 >> 62) {
          sub_1B4BB2D38();
        }
        v336 = (char *)operator new(4 * v335);
        v337 = &v336[4 * v332];
        *(_DWORD *)v337 = v327;
        uint64_t v329 = (uint64_t)(v337 + 4);
        int64_t v338 = v328 - v330;
        if (v328 == v330)
        {
LABEL_365:
          v89 = v507;
          goto LABEL_371;
        }
      }
      else
      {
        v336 = 0;
        v337 = (char *)(4 * v332);
        *(_DWORD *)(4 * v332) = *(_DWORD *)&__p[16];
        uint64_t v329 = 4 * v332 + 4;
        int64_t v338 = v328 - v330;
        if (v328 == v330) {
          goto LABEL_365;
        }
      }
      unint64_t v339 = v338 - 4;
      if (v339 < 0x2C)
      {
        v89 = v507;
        do
        {
LABEL_370:
          int v348 = *((_DWORD *)v328 - 1);
          v328 -= 4;
          *((_DWORD *)v337 - 1) = v348;
          v337 -= 4;
        }
        while (v328 != v330);
        goto LABEL_371;
      }
      unint64_t v340 = v328 - &v336[v331];
      v89 = v507;
      if (v340 < 0x20) {
        goto LABEL_370;
      }
      uint64_t v341 = (v339 >> 2) + 1;
      uint64_t v342 = 4 * (v341 & 0x7FFFFFFFFFFFFFF8);
      v343 = &v328[-v342];
      v337 -= v342;
      v344 = &v336[4 * v332 - 16];
      v345 = v328 - 16;
      uint64_t v346 = v341 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v347 = *(_OWORD *)v345;
        *((_OWORD *)v344 - 1) = *((_OWORD *)v345 - 1);
        *(_OWORD *)v344 = v347;
        v344 -= 32;
        v345 -= 32;
        v346 -= 8;
      }
      while (v346);
      v328 = v343;
      if (v341 != (v341 & 0x7FFFFFFFFFFFFFF8)) {
        goto LABEL_370;
      }
LABEL_371:
      v540 = v337;
      v541 = (char *)v329;
      v542 = &v336[4 * v335];
      if (v330) {
        operator delete(v330);
      }
LABEL_373:
      v541 = (char *)v329;
      v349 = v538;
      if (v538 < v539)
      {
        *(_DWORD *)v538 = 1;
        uint64_t v350 = (uint64_t)(v349 + 4);
        goto LABEL_394;
      }
      v351 = (char *)v537;
      int64_t v352 = v538 - (unsigned char *)v537;
      uint64_t v353 = (v538 - (unsigned char *)v537) >> 2;
      unint64_t v354 = v353 + 1;
      if ((unint64_t)(v353 + 1) >> 62) {
        sub_1B4BB3244();
      }
      uint64_t v355 = v539 - (unsigned char *)v537;
      if ((v539 - (unsigned char *)v537) >> 1 > v354) {
        unint64_t v354 = v355 >> 1;
      }
      if ((unint64_t)v355 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v356 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v356 = v354;
      }
      if (v356)
      {
        if (v356 >> 62) {
          sub_1B4BB2D38();
        }
        v357 = (char *)operator new(4 * v356);
        v358 = &v357[4 * v353];
        *(_DWORD *)v358 = 1;
        uint64_t v350 = (uint64_t)(v358 + 4);
        int64_t v359 = v349 - v351;
        if (v349 == v351) {
          goto LABEL_392;
        }
LABEL_386:
        unint64_t v360 = v359 - 4;
        if (v360 < 0x2C) {
          goto LABEL_662;
        }
        if ((unint64_t)(v349 - v357 - v352) < 0x20) {
          goto LABEL_662;
        }
        uint64_t v361 = (v360 >> 2) + 1;
        uint64_t v362 = 4 * (v361 & 0x7FFFFFFFFFFFFFF8);
        v363 = &v349[-v362];
        v358 -= v362;
        v364 = &v357[4 * v353 - 16];
        v365 = v349 - 16;
        uint64_t v366 = v361 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v367 = *(_OWORD *)v365;
          *((_OWORD *)v364 - 1) = *((_OWORD *)v365 - 1);
          *(_OWORD *)v364 = v367;
          v364 -= 32;
          v365 -= 32;
          v366 -= 8;
        }
        while (v366);
        v349 = v363;
        if (v361 != (v361 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_662:
          do
          {
            int v368 = *((_DWORD *)v349 - 1);
            v349 -= 4;
            *((_DWORD *)v358 - 1) = v368;
            v358 -= 4;
          }
          while (v349 != v351);
        }
        goto LABEL_392;
      }
      v357 = 0;
      v358 = (char *)(4 * v353);
      *(_DWORD *)(4 * v353) = 1;
      uint64_t v350 = 4 * v353 + 4;
      int64_t v359 = v349 - v351;
      if (v349 != v351) {
        goto LABEL_386;
      }
LABEL_392:
      v537 = v358;
      v538 = (char *)v350;
      v539 = &v357[4 * v356];
      if (v351) {
        operator delete(v351);
      }
LABEL_394:
      v538 = (char *)v350;
      if (SBYTE7(v512) < 0) {
        operator delete(v511[0]);
      }
      char v178 = 1;
      uint64_t v179 = 1;
    }
    while ((v180 & 1) == 0);
    ++__val[0];
  }
  while (__val[0] != 4);
  v369 = (char *)v534;
  unint64_t v370 = 0xAAAAAAAAAAAAAAABLL * ((v535 - (unsigned char *)v534) >> 3);
  unint64_t v371 = 0xAAAAAAAB00000000 * ((v535 - (unsigned char *)v534) >> 3);
  v559 = 0;
  v560 = 0;
  v561 = 0;
  if (v371)
  {
    if ((v371 & 0x8000000000000000) != 0) {
      sub_1B4BB3244();
    }
    size_t v372 = (0x2AAAAAAACLL * ((v535 - (unsigned char *)v534) >> 3)) & 0x3FFFFFFFFLL;
    v373 = (char *)operator new(v372);
    v374 = &v373[4 * (int)v370];
    v559 = v373;
    v561 = v374;
    memset_pattern16(v373, &unk_1B4C9AFF0, v372);
    v560 = v374;
    v501 = operator new(v372);
    memset_pattern16(v501, &unk_1B4C9B240, v372);
  }
  else
  {
    v501 = 0;
  }
  v375 = 0;
  unint64_t v376 = 0;
  long long v557 = 0uLL;
  v558 = 0;
  while (2)
  {
    v377 = &v369[24 * v376];
    if (v377[23] < 0)
    {
      v377 = *(char **)v377;
      v378 = v558;
      if (v375 >= v558) {
        goto LABEL_407;
      }
      goto LABEL_401;
    }
    v378 = v558;
    if (v375 < v558)
    {
LABEL_401:
      *(void *)v375 = v377;
      v375 += 8;
      goto LABEL_402;
    }
LABEL_407:
    v379 = (char *)v557;
    uint64_t v380 = (uint64_t)&v375[-v557] >> 3;
    unint64_t v381 = v380 + 1;
    if ((unint64_t)(v380 + 1) >> 61) {
      sub_1B4BB3244();
    }
    uint64_t v382 = (uint64_t)&v378[-v557];
    if (v382 >> 2 > v381) {
      unint64_t v381 = v382 >> 2;
    }
    if ((unint64_t)v382 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v383 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v383 = v381;
    }
    if (!v383)
    {
      v384 = 0;
      v385 = (char *)(8 * v380);
      *(void *)(8 * v380) = v377;
      uint64_t v386 = 8 * v380 + 8;
      v387 = (char *)(v375 - v379);
      if (v375 != v379) {
        goto LABEL_416;
      }
LABEL_422:
      *(void *)&long long v557 = v385;
      *((void *)&v557 + 1) = v386;
      v558 = &v384[8 * v383];
      if (!v375) {
        goto LABEL_424;
      }
      goto LABEL_423;
    }
    if (v383 >> 61) {
      sub_1B4BB2D38();
    }
    v384 = (char *)operator new(8 * v383);
    v385 = &v384[8 * v380];
    *(void *)v385 = v377;
    uint64_t v386 = (uint64_t)(v385 + 8);
    v387 = (char *)(v375 - v379);
    if (v375 == v379) {
      goto LABEL_422;
    }
LABEL_416:
    unint64_t v388 = (unint64_t)(v387 - 8);
    if (v388 < 0x168)
    {
      v389 = v375;
      goto LABEL_418;
    }
    unint64_t v391 = (v375 - 8 - v379) & 0xFFFFFFFFFFFFFFF8;
    if (&v384[v375 - v379 - 8 - v391] > &v384[v375 - v379 - 8])
    {
      v389 = v375;
      goto LABEL_418;
    }
    if (&v375[-v391 - 8] > v375 - 8)
    {
      v389 = v375;
      goto LABEL_418;
    }
    if ((unint64_t)(v379 - v384) < 0x20)
    {
      v389 = v375;
      goto LABEL_418;
    }
    uint64_t v392 = (v388 >> 3) + 1;
    uint64_t v393 = 8 * (v392 & 0x3FFFFFFFFFFFFFFCLL);
    v389 = &v375[-v393];
    v385 -= v393;
    v394 = &v384[8 * v380 - 16];
    v395 = v375 - 16;
    uint64_t v396 = v392 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v397 = *(_OWORD *)v395;
      *((_OWORD *)v394 - 1) = *((_OWORD *)v395 - 1);
      *(_OWORD *)v394 = v397;
      v394 -= 32;
      v395 -= 32;
      v396 -= 4;
    }
    while (v396);
    if (v392 != (v392 & 0x3FFFFFFFFFFFFFFCLL))
    {
      do
      {
LABEL_418:
        uint64_t v390 = *((void *)v389 - 1);
        v389 -= 8;
        *((void *)v385 - 1) = v390;
        v385 -= 8;
      }
      while (v389 != v379);
    }
    v375 = (char *)v557;
    *(void *)&long long v557 = v385;
    *((void *)&v557 + 1) = v386;
    v558 = &v384[8 * v383];
    if (v375) {
LABEL_423:
    }
      operator delete(v375);
LABEL_424:
    v375 = (char *)v386;
    id v5 = v508;
LABEL_402:
    *((void *)&v557 + 1) = v375;
    ++v376;
    v369 = (char *)v534;
    if (0xAAAAAAAAAAAAAAABLL * ((v535 - (unsigned char *)v534) >> 3) > v376) {
      continue;
    }
    break;
  }
  v500 = v537;
  v398 = v507;
  if (espresso_network_change_input_blob_shapes_seq_rank())
  {
    v484 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v484, v485);
    __cxa_throw(v484, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  p_stateOutputEspressoBuffers = (uint64_t **)&v507->_stateOutputEspressoBuffers;
  begin_node = (uint64_t *)v507->_stateOutputEspressoBuffers.__tree_.__begin_node_;
  p_pair1 = (uint64_t *)&v507->_stateOutputEspressoBuffers.__tree_.__pair1_;
  if (begin_node != (uint64_t *)&v507->_stateOutputEspressoBuffers.__tree_.__pair1_)
  {
    while (2)
    {
      sub_1B4C618EC(__p, (long long *)begin_node + 2);
      espresso_network_declare_output();
      if (*(void *)&__p[24])
      {
        *(void *)&long long v548 = *(void *)&__p[24];
        operator delete(*(void **)&__p[24]);
      }
      if ((__p[23] & 0x80000000) != 0)
      {
        operator delete(*(void **)__p);
        v400 = (uint64_t *)begin_node[1];
        if (v400) {
          goto LABEL_445;
        }
        do
        {
LABEL_447:
          v401 = (uint64_t *)begin_node[2];
          BOOL v402 = *v401 == (void)begin_node;
          begin_node = v401;
        }
        while (!v402);
      }
      else
      {
        v400 = (uint64_t *)begin_node[1];
        if (!v400) {
          goto LABEL_447;
        }
        do
        {
LABEL_445:
          v401 = v400;
          v400 = (uint64_t *)*v400;
        }
        while (v400);
      }
      begin_node = v401;
      if (v401 == p_pair1) {
        break;
      }
      continue;
    }
  }
  espresso_plan_build();
  uint64_t v556 = 0;
  long long v554 = 0u;
  long long v555 = 0u;
  long long v552 = 0u;
  long long v553 = 0u;
  long long v550 = 0u;
  long long v551 = 0u;
  long long v548 = 0u;
  long long v549 = 0u;
  memset(__p, 0, sizeof(__p));
  char v527 = 21;
  *(_OWORD *)v525 = *(_OWORD *)&v503[1];
  *(void *)&v525[13] = v503[0];
  char v526 = 0;
  if (espresso_network_query_blob_shape())
  {
    v486 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v486, v487);
    __cxa_throw(v486, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  espresso_buffer_pack_tensor_shape();
  id v403 = v5;
  *(void *)__p = objc_msgSend_bytes(v403, v404, v405, v406, v500, v501);
  LODWORD(v556) = 65568;
  if (espresso_network_bind_buffer())
  {
    v488 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v488, v489);
    __cxa_throw(v488, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (espresso_network_bind_buffer())
  {
    v490 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v490, v491);
    __cxa_throw(v490, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (espresso_network_bind_buffer())
  {
    v492 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v492, v493);
    __cxa_throw(v492, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (espresso_network_bind_buffer())
  {
    v494 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v494, v495);
    __cxa_throw(v494, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (espresso_network_bind_buffer())
  {
    v496 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v496, v497);
    __cxa_throw(v496, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (espresso_network_bind_buffer())
  {
    v498 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v498, v499);
    __cxa_throw(v498, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  v407 = (long long *)v507->_stateInputEspressoBuffers.__tree_.__begin_node_;
  v503[0] = &v507->_stateInputEspressoBuffers.__tree_.__pair1_;
  if (v407 != (long long *)&v507->_stateInputEspressoBuffers.__tree_.__pair1_)
  {
    p_stateInputEspressoBuffers = (uint64_t **)&v507->_stateInputEspressoBuffers;
    do
    {
      sub_1B4C618EC(&__dst, v407 + 2);
      if (espresso_network_query_blob_shape())
      {
        v480 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        espresso_plan_get_error_info();
        std::runtime_error::runtime_error(v480, v481);
        __cxa_throw(v480, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      unint64_t v408 = v544;
      v503[1] = v407;
      if (v544)
      {
        unint64_t v409 = 0;
        unint64_t p_stateInputEspressoBuffersShape = (unint64_t)&v398->_stateInputEspressoBuffersShape;
        v410 = &v398->_stateInputEspressoBuffersShape.__tree_.__pair1_;
        unint64_t v411 = 1;
        do
        {
          *(void *)__val = *((void *)&v545.__r_.__value_.__l.__data_ + v409);
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v410->__value_.__left_;
          v413 = v410;
          v414 = v410;
          if (v410->__value_.__left_)
          {
            if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type size = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type size = __dst.__r_.__value_.__l.__size_;
            }
            if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              p_dst = &__dst;
            }
            else {
              p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
            }
            while (1)
            {
              while (1)
              {
                v414 = left;
                v419 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)left[4].__value_.__left_;
                v417 = left + 4;
                v418 = v419;
                int left_high = SHIBYTE(v417[2].__value_.__left_);
                if (left_high >= 0) {
                  size_t v421 = HIBYTE(v417[2].__value_.__left_);
                }
                else {
                  size_t v421 = (size_t)v417[1].__value_.__left_;
                }
                if (left_high >= 0) {
                  v422 = v417;
                }
                else {
                  v422 = v418;
                }
                if (v421 >= size) {
                  size_t v423 = size;
                }
                else {
                  size_t v423 = v421;
                }
                int v424 = memcmp(p_dst, v422, v423);
                BOOL v425 = size < v421;
                if (v424) {
                  BOOL v425 = v424 < 0;
                }
                if (!v425) {
                  break;
                }
                left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v414->__value_.__left_;
                v413 = v414;
                if (!v414->__value_.__left_) {
                  goto LABEL_493;
                }
              }
              int v426 = memcmp(v422, p_dst, v423);
              BOOL v427 = v421 < size;
              if (v426) {
                BOOL v427 = v426 < 0;
              }
              if (!v427) {
                break;
              }
              left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v414[1].__value_.__left_;
              if (!left)
              {
                v413 = v414 + 1;
                goto LABEL_493;
              }
            }
            p_left = &v414->__value_.__left_;
            id v5 = v508;
          }
          else
          {
LABEL_493:
            p_left = operator new(0x50uLL);
            v429 = p_left + 4;
            if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
            {
              sub_1B4BCA11C(v429, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
            }
            else
            {
              *(_OWORD *)v429 = *(_OWORD *)&__dst.__r_.__value_.__l.__data_;
              p_left[6] = *((void *)&__dst.__r_.__value_.__l + 2);
            }
            unint64_t v430 = p_stateInputEspressoBuffersShape;
            p_left[7] = 0;
            p_left[8] = 0;
            p_left[9] = 0;
            void *p_left = 0;
            p_left[1] = 0;
            p_left[2] = v414;
            v413->__value_.__left_ = p_left;
            uint64_t v431 = **(void **)v430;
            v432 = p_left;
            id v5 = v508;
            if (v431)
            {
              *(void *)unint64_t v430 = v431;
              v432 = v413->__value_.__left_;
            }
            v433 = (uint64_t *)v410->__value_.__left_;
            BOOL v402 = v432 == v410->__value_.__left_;
            *((unsigned char *)v432 + 24) = v402;
            if (!v402)
            {
              do
              {
                uint64_t v434 = v432[2];
                if (*(unsigned char *)(v434 + 24)) {
                  break;
                }
                v435 = *(uint64_t **)(v434 + 16);
                uint64_t v436 = *v435;
                if (*v435 == v434)
                {
                  uint64_t v439 = v435[1];
                  if (!v439 || (int v440 = *(unsigned __int8 *)(v439 + 24), v437 = (unsigned char *)(v439 + 24), v440))
                  {
                    if (*(void **)v434 == v432)
                    {
                      *(unsigned char *)(v434 + 24) = 1;
                      *((unsigned char *)v435 + 24) = 0;
                      uint64_t v443 = *(void *)(v434 + 8);
                      uint64_t *v435 = v443;
                      if (v443) {
                        goto LABEL_513;
                      }
                    }
                    else
                    {
                      v441 = *(uint64_t **)(v434 + 8);
                      uint64_t v442 = *v441;
                      *(void *)(v434 + 8) = *v441;
                      if (v442)
                      {
                        *(void *)(v442 + 16) = v434;
                        v435 = *(uint64_t **)(v434 + 16);
                      }
                      v441[2] = (uint64_t)v435;
                      *(void *)(*(void *)(v434 + 16) + 8 * (**(void **)(v434 + 16) != v434)) = v441;
                      uint64_t *v441 = v434;
                      *(void *)(v434 + 16) = v441;
                      v435 = (uint64_t *)v441[2];
                      uint64_t v434 = *v435;
                      *((unsigned char *)v441 + 24) = 1;
                      *((unsigned char *)v435 + 24) = 0;
                      uint64_t v443 = *(void *)(v434 + 8);
                      uint64_t *v435 = v443;
                      if (v443) {
LABEL_513:
                      }
                        *(void *)(v443 + 16) = v435;
                    }
                    *(void *)(v434 + 16) = v435[2];
                    *(void *)(v435[2] + 8 * (*(void *)v435[2] != (void)v435)) = v434;
                    *(void *)(v434 + 8) = v435;
LABEL_465:
                    v435[2] = v434;
                    break;
                  }
                }
                else if (!v436 || (int v438 = *(unsigned __int8 *)(v436 + 24), v437 = (unsigned char *)(v436 + 24), v438))
                {
                  if (*(void **)v434 == v432)
                  {
                    uint64_t v445 = v432[1];
                    *(void *)uint64_t v434 = v445;
                    if (v445)
                    {
                      *(void *)(v445 + 16) = v434;
                      v435 = *(uint64_t **)(v434 + 16);
                    }
                    v432[2] = v435;
                    *(void *)(*(void *)(v434 + 16) + 8 * (**(void **)(v434 + 16) != v434)) = v432;
                    v432[1] = v434;
                    *(void *)(v434 + 16) = v432;
                    v435 = (uint64_t *)v432[2];
                    *((unsigned char *)v432 + 24) = 1;
                    *((unsigned char *)v435 + 24) = 0;
                    uint64_t v434 = v435[1];
                    v444 = *(void **)v434;
                    v435[1] = *(void *)v434;
                    if (!v444) {
                      goto LABEL_464;
                    }
                  }
                  else
                  {
                    *(unsigned char *)(v434 + 24) = 1;
                    *((unsigned char *)v435 + 24) = 0;
                    uint64_t v434 = v435[1];
                    v444 = *(void **)v434;
                    v435[1] = *(void *)v434;
                    if (!v444) {
                      goto LABEL_464;
                    }
                  }
                  v444[2] = v435;
LABEL_464:
                  *(void *)(v434 + 16) = v435[2];
                  *(void *)(v435[2] + 8 * (*(void *)v435[2] != (void)v435)) = v434;
                  *(void *)uint64_t v434 = v435;
                  goto LABEL_465;
                }
                *(unsigned char *)(v434 + 24) = 1;
                v432 = v435;
                *((unsigned char *)v435 + 24) = v435 == v433;
                unsigned char *v437 = 1;
              }
              while (v435 != v433);
            }
            ++*(void *)(v430 + 16);
            unint64_t v408 = v544;
          }
          v411 *= *(void *)__val;
          *(void *)(p_left[7] + 8 * (v408 + ~v409++)) = *(void *)__val;
          unint64_t v408 = v544;
        }
        while (v544 > v409);
      }
      else
      {
        unint64_t v411 = 1;
      }
      v511[0] = &__dst;
      v446 = sub_1B4C385B4(p_stateInputEspressoBuffers, (const void **)&__dst.__r_.__value_.__l.__data_, (uint64_t)&unk_1B4C9AE0A, (long long **)v511);
      if (v411 > ((char *)v446[8] - (char *)v446[7]) >> 2)
      {
        v511[0] = &__dst;
        v447 = sub_1B4C385B4(p_stateInputEspressoBuffers, (const void **)&__dst.__r_.__value_.__l.__data_, (uint64_t)&unk_1B4C9AE0A, (long long **)v511);
        v448 = v447[7];
        unint64_t v449 = ((char *)v447[8] - (char *)v448) >> 2;
        if (v411 <= v449)
        {
          if (v411 < v449) {
            v447[8] = (uint64_t *)((char *)v448 + 4 * v411);
          }
        }
        else
        {
          sub_1B4C52648((uint64_t)(v447 + 7), v411 - v449);
        }
      }
      uint64_t v521 = 0;
      long long v519 = 0u;
      long long v520 = 0u;
      long long v517 = 0u;
      long long v518 = 0u;
      long long v515 = 0u;
      long long v516 = 0u;
      long long v513 = 0u;
      long long v514 = 0u;
      *(_OWORD *)v511 = 0u;
      long long v512 = 0u;
      espresso_buffer_pack_tensor_shape();
      v543 = &__dst;
      v511[0] = sub_1B4C385B4(p_stateInputEspressoBuffers, (const void **)&__dst.__r_.__value_.__l.__data_, (uint64_t)&unk_1B4C9AE0A, (long long **)&v543)[7];
      LODWORD(v521) = 65568;
      v398 = v507;
      if (espresso_network_bind_buffer())
      {
        v482 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        espresso_plan_get_error_info();
        std::runtime_error::runtime_error(v482, v483);
        __cxa_throw(v482, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      v450 = (void *)v503[1];
      if (v523)
      {
        v524 = v523;
        operator delete(v523);
      }
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__dst.__r_.__value_.__l.__data_);
        v451 = *(void **)(v503[1] + 8);
        if (v451)
        {
          do
          {
LABEL_538:
            v452 = v451;
            v451 = (void *)*v451;
          }
          while (v451);
          goto LABEL_459;
        }
      }
      else
      {
        v451 = *(void **)(v503[1] + 8);
        if (v451) {
          goto LABEL_538;
        }
      }
      do
      {
        v452 = (void *)v450[2];
        BOOL v402 = *v452 == (void)v450;
        v450 = v452;
      }
      while (!v402);
LABEL_459:
      v407 = (long long *)v452;
    }
    while (v452 != (void *)v503[0]);
  }
  v453 = *p_stateOutputEspressoBuffers;
  if (*p_stateOutputEspressoBuffers != p_pair1)
  {
    while (2)
    {
      sub_1B4C618EC(&__dst, (long long *)v453 + 2);
      if (espresso_network_query_blob_shape())
      {
        v478 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        espresso_plan_get_error_info();
        std::runtime_error::runtime_error(v478, v479);
        __cxa_throw(v478, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      if (v544)
      {
        if (v544 == 1)
        {
          unint64_t v454 = 0;
          unint64_t v455 = 1;
          goto LABEL_554;
        }
        unint64_t v454 = v544 & 0xFFFFFFFFFFFFFFFELL;
        unint64_t v456 = v544 & 0xFFFFFFFFFFFFFFFELL;
        p_std::string::size_type size = &v545.__r_.__value_.__l.__size_;
        uint64_t v458 = 1;
        uint64_t v459 = 1;
        do
        {
          v458 *= *(p_size - 1);
          v459 *= *p_size;
          p_size += 2;
          v456 -= 2;
        }
        while (v456);
        unint64_t v455 = v459 * v458;
        if (v544 != v454)
        {
LABEL_554:
          unint64_t v460 = v544 - v454;
          v461 = &v545.__r_.__value_.__r.__words[v454];
          do
          {
            uint64_t v462 = *v461++;
            v455 *= v462;
            --v460;
          }
          while (v460);
        }
      }
      else
      {
        unint64_t v455 = 1;
      }
      v511[0] = &__dst;
      v463 = sub_1B4C385B4(p_stateOutputEspressoBuffers, (const void **)&__dst.__r_.__value_.__l.__data_, (uint64_t)&unk_1B4C9AE0A, (long long **)v511);
      if (v455 > ((char *)v463[8] - (char *)v463[7]) >> 2)
      {
        v511[0] = &__dst;
        v464 = sub_1B4C385B4(p_stateOutputEspressoBuffers, (const void **)&__dst.__r_.__value_.__l.__data_, (uint64_t)&unk_1B4C9AE0A, (long long **)v511);
        v465 = v464[7];
        unint64_t v466 = ((char *)v464[8] - (char *)v465) >> 2;
        if (v455 <= v466)
        {
          if (v455 < v466) {
            v464[8] = (uint64_t *)((char *)v465 + 4 * v455);
          }
        }
        else
        {
          sub_1B4C52648((uint64_t)(v464 + 7), v455 - v466);
        }
      }
      uint64_t v521 = 0;
      long long v519 = 0u;
      long long v520 = 0u;
      long long v517 = 0u;
      long long v518 = 0u;
      long long v515 = 0u;
      long long v516 = 0u;
      long long v513 = 0u;
      long long v514 = 0u;
      *(_OWORD *)v511 = 0u;
      long long v512 = 0u;
      espresso_buffer_pack_tensor_shape();
      v543 = &__dst;
      v511[0] = sub_1B4C385B4(p_stateOutputEspressoBuffers, (const void **)&__dst.__r_.__value_.__l.__data_, (uint64_t)&unk_1B4C9AE0A, (long long **)&v543)[7];
      LODWORD(v521) = 65568;
      if (espresso_network_bind_buffer())
      {
        v476 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        espresso_plan_get_error_info();
        std::runtime_error::runtime_error(v476, v477);
        __cxa_throw(v476, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      if (v523)
      {
        v524 = v523;
        operator delete(v523);
      }
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__dst.__r_.__value_.__l.__data_);
        v467 = (uint64_t *)v453[1];
        if (v467) {
          goto LABEL_568;
        }
        do
        {
LABEL_570:
          v468 = (uint64_t *)v453[2];
          BOOL v402 = *v468 == (void)v453;
          v453 = v468;
        }
        while (!v402);
      }
      else
      {
        v467 = (uint64_t *)v453[1];
        if (!v467) {
          goto LABEL_570;
        }
        do
        {
LABEL_568:
          v468 = v467;
          v467 = (uint64_t *)*v467;
        }
        while (v467);
      }
      v453 = v468;
      if (v468 == p_pair1) {
        break;
      }
      continue;
    }
  }
  if (v527 < 0) {
    operator delete(*(void **)v525);
  }
  if ((void)v557) {
    operator delete((void *)v557);
  }
  if (v501) {
    operator delete(v501);
  }
  if (v559) {
    operator delete(v559);
  }
  if (v528)
  {
    v529 = (char *)v528;
    operator delete(v528);
  }
  if (v531)
  {
    v532 = (char *)v531;
    operator delete(v531);
  }
  v469 = (char *)v534;
  if (v534)
  {
    v470 = v535;
    v471 = v534;
    if (v535 != v534)
    {
      do
      {
        if (*(v470 - 1) < 0) {
          operator delete(*((void **)v470 - 3));
        }
        v470 -= 24;
      }
      while (v470 != v469);
      v471 = v534;
    }
    v535 = v469;
    operator delete(v471);
  }
  if (v537)
  {
    v538 = (char *)v537;
    operator delete(v537);
  }
  if (v540)
  {
    v541 = (char *)v540;
    operator delete(v540);
  }
LABEL_597:
}

- (void)copyInputState:(id)a3
{
  uint64_t v239 = *MEMORY[0x1E4F143B8];
  long long v234 = 0u;
  long long v235 = 0u;
  long long v236 = 0u;
  long long v237 = 0u;
  id obj = a3;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v234, (uint64_t)v238, 16);
  if (v4)
  {
    uint64_t v225 = *(void *)v235;
    do
    {
      uint64_t v5 = 0;
      uint64_t v226 = v4;
      do
      {
        if (*(void *)v235 != v225) {
          objc_enumerationMutation(obj);
        }
        uint64_t v229 = v5;
        id v6 = *(id *)(*((void *)&v234 + 1) + 8 * v5);
        int64_t v10 = (const char *)objc_msgSend_UTF8String(v6, v7, v8, v9);
        size_t v11 = strlen(v10);
        if (v11 >= 0x7FFFFFFFFFFFFFF8) {
          sub_1B4BB33D8();
        }
        std::string::size_type v12 = v11;
        if (v11 >= 0x17)
        {
          uint64_t v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v11 | 7) != 0x17) {
            uint64_t v14 = v11 | 7;
          }
          uint64_t v15 = v14 + 1;
          p_dst = (std::string *)operator new(v14 + 1);
          __dst.__r_.__value_.__l.__size_ = v12;
          __dst.__r_.__value_.__r.__words[2] = v15 | 0x8000000000000000;
          __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
        }
        else
        {
          *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v11;
          p_dst = &__dst;
          if (!v11) {
            goto LABEL_15;
          }
        }
        memmove(p_dst, v10, v12);
LABEL_15:
        p_dst->__r_.__value_.__s.__data_[v12] = 0;
        uint64_t v16 = std::string::append(&__dst, "_in");
        std::string __p = *v16;
        v16->__r_.__value_.__l.__size_ = 0;
        v16->__r_.__value_.__r.__words[2] = 0;
        v16->__r_.__value_.__r.__words[0] = 0;
        if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__dst.__r_.__value_.__l.__data_);
        }
        objc_msgSend_objectForKey_(obj, v17, (uint64_t)v6, v18, v223);
        id v230 = (id)objc_claimAutoreleasedReturnValue();
        unint64_t v19 = 0;
        unint64_t p_stateInputEspressoBuffersShape = &self->_stateInputEspressoBuffersShape;
        p_pair1 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
        for (unint64_t i = 1; ; i *= *(void *)(p_left[7] + 8 * v19++))
        {
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)p_pair1->__value_.__left_;
          int v23 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
          uint64_t v24 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
          if (p_pair1->__value_.__left_) {
            break;
          }
LABEL_48:
          unint64_t v38 = operator new(0x50uLL);
          uint64_t v39 = v38 + 4;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          {
            sub_1B4BCA11C(v39, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)uint64_t v39 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            v38[6] = *((void *)&__p.__r_.__value_.__l + 2);
          }
          v38[7] = 0;
          v38[8] = 0;
          v38[9] = 0;
          void *v38 = 0;
          v38[1] = 0;
          v38[2] = v24;
          v23->__value_.__left_ = v38;
          uint64_t v40 = *(void **)p_stateInputEspressoBuffersShape->__tree_.__begin_node_;
          uint64_t v41 = v38;
          if (v40)
          {
            p_stateInputEspressoBuffersShape->__tree_.__begin_node_ = v40;
            uint64_t v41 = v23->__value_.__left_;
          }
          v42 = (uint64_t *)p_pair1->__value_.__left_;
          BOOL v43 = v41 == p_pair1->__value_.__left_;
          *((unsigned char *)v41 + 24) = v43;
          if (!v43)
          {
            do
            {
              uint64_t v44 = v41[2];
              if (*(unsigned char *)(v44 + 24)) {
                break;
              }
              long long v45 = *(uint64_t **)(v44 + 16);
              uint64_t v46 = *v45;
              if (*v45 == v44)
              {
                uint64_t v49 = v45[1];
                if (!v49 || (v50 = *(unsigned __int8 *)(v49 + 24), uint64_t v47 = (unsigned char *)(v49 + 24), v50))
                {
                  if (*(void **)v44 == v41)
                  {
                    *(unsigned char *)(v44 + 24) = 1;
                    *((unsigned char *)v45 + 24) = 0;
                    uint64_t v53 = *(void *)(v44 + 8);
                    *long long v45 = v53;
                    if (v53) {
                      goto LABEL_68;
                    }
                  }
                  else
                  {
                    uint64_t v51 = *(uint64_t **)(v44 + 8);
                    uint64_t v52 = *v51;
                    *(void *)(v44 + 8) = *v51;
                    if (v52)
                    {
                      *(void *)(v52 + 16) = v44;
                      long long v45 = *(uint64_t **)(v44 + 16);
                    }
                    v51[2] = (uint64_t)v45;
                    *(void *)(*(void *)(v44 + 16) + 8 * (**(void **)(v44 + 16) != v44)) = v51;
                    *uint64_t v51 = v44;
                    *(void *)(v44 + 16) = v51;
                    long long v45 = (uint64_t *)v51[2];
                    uint64_t v44 = *v45;
                    *((unsigned char *)v51 + 24) = 1;
                    *((unsigned char *)v45 + 24) = 0;
                    uint64_t v53 = *(void *)(v44 + 8);
                    *long long v45 = v53;
                    if (v53) {
LABEL_68:
                    }
                      *(void *)(v53 + 16) = v45;
                  }
                  *(void *)(v44 + 16) = v45[2];
                  *(void *)(v45[2] + 8 * (*(void *)v45[2] != (void)v45)) = v44;
                  *(void *)(v44 + 8) = v45;
LABEL_76:
                  v45[2] = v44;
                  break;
                }
              }
              else if (!v46 || (v48 = *(unsigned __int8 *)(v46 + 24), uint64_t v47 = (unsigned char *)(v46 + 24), v48))
              {
                if (*(void **)v44 == v41)
                {
                  uint64_t v87 = v41[1];
                  *(void *)uint64_t v44 = v87;
                  if (v87)
                  {
                    *(void *)(v87 + 16) = v44;
                    long long v45 = *(uint64_t **)(v44 + 16);
                  }
                  v41[2] = v45;
                  *(void *)(*(void *)(v44 + 16) + 8 * (**(void **)(v44 + 16) != v44)) = v41;
                  v41[1] = v44;
                  *(void *)(v44 + 16) = v41;
                  long long v45 = (uint64_t *)v41[2];
                  *((unsigned char *)v41 + 24) = 1;
                  *((unsigned char *)v45 + 24) = 0;
                  uint64_t v44 = v45[1];
                  unint64_t v54 = *(void **)v44;
                  v45[1] = *(void *)v44;
                  if (v54) {
LABEL_74:
                  }
                    v54[2] = v45;
                }
                else
                {
                  *(unsigned char *)(v44 + 24) = 1;
                  *((unsigned char *)v45 + 24) = 0;
                  uint64_t v44 = v45[1];
                  unint64_t v54 = *(void **)v44;
                  v45[1] = *(void *)v44;
                  if (v54) {
                    goto LABEL_74;
                  }
                }
                *(void *)(v44 + 16) = v45[2];
                *(void *)(v45[2] + 8 * (*(void *)v45[2] != (void)v45)) = v44;
                *(void *)uint64_t v44 = v45;
                goto LABEL_76;
              }
              *(unsigned char *)(v44 + 24) = 1;
              uint64_t v41 = v45;
              *((unsigned char *)v45 + 24) = v45 == v42;
              *uint64_t v47 = 1;
            }
            while (v45 != v42);
          }
          ++self->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_;
          if (v19 >= (uint64_t)(v38[8] - v38[7]) >> 3) {
            goto LABEL_141;
          }
LABEL_78:
          v55 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)p_pair1->__value_.__left_;
          v56 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
          v57 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
          if (p_pair1->__value_.__left_)
          {
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type size = __p.__r_.__value_.__l.__size_;
            }
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              p_p = &__p;
            }
            else {
              p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
            }
            while (1)
            {
              while (1)
              {
                v57 = v55;
                v62 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v55[4].__value_.__left_;
                uint64_t v60 = v55 + 4;
                v61 = v62;
                int left_high = SHIBYTE(v60[2].__value_.__left_);
                if (left_high >= 0) {
                  size_t v64 = HIBYTE(v60[2].__value_.__left_);
                }
                else {
                  size_t v64 = (size_t)v60[1].__value_.__left_;
                }
                if (left_high >= 0) {
                  long long v65 = v60;
                }
                else {
                  long long v65 = v61;
                }
                if (v64 >= size) {
                  size_t v66 = size;
                }
                else {
                  size_t v66 = v64;
                }
                int v67 = memcmp(p_p, v65, v66);
                BOOL v68 = size < v64;
                if (v67) {
                  BOOL v68 = v67 < 0;
                }
                if (!v68) {
                  break;
                }
                v55 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v57->__value_.__left_;
                v56 = v57;
                if (!v57->__value_.__left_) {
                  goto LABEL_103;
                }
              }
              int v69 = memcmp(v65, p_p, v66);
              BOOL v70 = v64 < size;
              if (v69) {
                BOOL v70 = v69 < 0;
              }
              if (!v70) {
                break;
              }
              v55 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v57[1].__value_.__left_;
              if (!v55)
              {
                v56 = v57 + 1;
                goto LABEL_103;
              }
            }
            p_left = &v57->__value_.__left_;
          }
          else
          {
LABEL_103:
            p_left = operator new(0x50uLL);
            unint64_t v72 = p_left + 4;
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            {
              sub_1B4BCA11C(v72, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
            }
            else
            {
              *(_OWORD *)unint64_t v72 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
              p_left[6] = *((void *)&__p.__r_.__value_.__l + 2);
            }
            p_left[7] = 0;
            p_left[8] = 0;
            p_left[9] = 0;
            void *p_left = 0;
            p_left[1] = 0;
            p_left[2] = v57;
            v56->__value_.__left_ = p_left;
            uint64_t v73 = *(void **)p_stateInputEspressoBuffersShape->__tree_.__begin_node_;
            unint64_t v74 = p_left;
            if (v73)
            {
              p_stateInputEspressoBuffersShape->__tree_.__begin_node_ = v73;
              unint64_t v74 = v56->__value_.__left_;
            }
            unint64_t v75 = (uint64_t *)p_pair1->__value_.__left_;
            BOOL v43 = v74 == p_pair1->__value_.__left_;
            *((unsigned char *)v74 + 24) = v43;
            if (!v43)
            {
              do
              {
                uint64_t v76 = v74[2];
                if (*(unsigned char *)(v76 + 24)) {
                  break;
                }
                uint64_t v77 = *(uint64_t **)(v76 + 16);
                uint64_t v78 = *v77;
                if (*v77 == v76)
                {
                  uint64_t v81 = v77[1];
                  if (!v81 || (v82 = *(unsigned __int8 *)(v81 + 24), uint64_t v79 = (unsigned char *)(v81 + 24), v82))
                  {
                    if (*(void **)v76 == v74)
                    {
                      *(unsigned char *)(v76 + 24) = 1;
                      *((unsigned char *)v77 + 24) = 0;
                      uint64_t v85 = *(void *)(v76 + 8);
                      *uint64_t v77 = v85;
                      if (v85) {
                        goto LABEL_123;
                      }
                    }
                    else
                    {
                      int64_t v83 = *(uint64_t **)(v76 + 8);
                      uint64_t v84 = *v83;
                      *(void *)(v76 + 8) = *v83;
                      if (v84)
                      {
                        *(void *)(v84 + 16) = v76;
                        uint64_t v77 = *(uint64_t **)(v76 + 16);
                      }
                      v83[2] = (uint64_t)v77;
                      *(void *)(*(void *)(v76 + 16) + 8 * (**(void **)(v76 + 16) != v76)) = v83;
                      *int64_t v83 = v76;
                      *(void *)(v76 + 16) = v83;
                      uint64_t v77 = (uint64_t *)v83[2];
                      uint64_t v76 = *v77;
                      *((unsigned char *)v83 + 24) = 1;
                      *((unsigned char *)v77 + 24) = 0;
                      uint64_t v85 = *(void *)(v76 + 8);
                      *uint64_t v77 = v85;
                      if (v85) {
LABEL_123:
                      }
                        *(void *)(v85 + 16) = v77;
                    }
                    *(void *)(v76 + 16) = v77[2];
                    *(void *)(v77[2] + 8 * (*(void *)v77[2] != (void)v77)) = v76;
                    *(void *)(v76 + 8) = v77;
LABEL_20:
                    v77[2] = v76;
                    break;
                  }
                }
                else if (!v78 || (v80 = *(unsigned __int8 *)(v78 + 24), uint64_t v79 = (unsigned char *)(v78 + 24), v80))
                {
                  if (*(void **)v76 == v74)
                  {
                    uint64_t v88 = v74[1];
                    *(void *)uint64_t v76 = v88;
                    if (v88)
                    {
                      *(void *)(v88 + 16) = v76;
                      uint64_t v77 = *(uint64_t **)(v76 + 16);
                    }
                    v74[2] = v77;
                    *(void *)(*(void *)(v76 + 16) + 8 * (**(void **)(v76 + 16) != v76)) = v74;
                    v74[1] = v76;
                    *(void *)(v76 + 16) = v74;
                    uint64_t v77 = (uint64_t *)v74[2];
                    *((unsigned char *)v74 + 24) = 1;
                    *((unsigned char *)v77 + 24) = 0;
                    uint64_t v76 = v77[1];
                    int v86 = *(void **)v76;
                    v77[1] = *(void *)v76;
                    if (!v86) {
                      goto LABEL_19;
                    }
                  }
                  else
                  {
                    *(unsigned char *)(v76 + 24) = 1;
                    *((unsigned char *)v77 + 24) = 0;
                    uint64_t v76 = v77[1];
                    int v86 = *(void **)v76;
                    v77[1] = *(void *)v76;
                    if (!v86) {
                      goto LABEL_19;
                    }
                  }
                  v86[2] = v77;
LABEL_19:
                  *(void *)(v76 + 16) = v77[2];
                  *(void *)(v77[2] + 8 * (*(void *)v77[2] != (void)v77)) = v76;
                  *(void *)uint64_t v76 = v77;
                  goto LABEL_20;
                }
                *(unsigned char *)(v76 + 24) = 1;
                unint64_t v74 = v77;
                *((unsigned char *)v77 + 24) = v77 == v75;
                *uint64_t v79 = 1;
              }
              while (v77 != v75);
            }
            ++self->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_;
          }
        }
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v25 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v25 = __p.__r_.__value_.__l.__size_;
        }
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          int v26 = &__p;
        }
        else {
          int v26 = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        while (1)
        {
          while (1)
          {
            uint64_t v24 = left;
            uint64_t v29 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)left[4].__value_.__left_;
            id v27 = left + 4;
            v28 = v29;
            int v30 = SHIBYTE(v27[2].__value_.__left_);
            if (v30 >= 0) {
              size_t v31 = HIBYTE(v27[2].__value_.__left_);
            }
            else {
              size_t v31 = (size_t)v27[1].__value_.__left_;
            }
            if (v30 >= 0) {
              unint64_t v32 = v27;
            }
            else {
              unint64_t v32 = v28;
            }
            if (v31 >= v25) {
              size_t v33 = v25;
            }
            else {
              size_t v33 = v31;
            }
            int v34 = memcmp(v26, v32, v33);
            BOOL v35 = v25 < v31;
            if (v34) {
              BOOL v35 = v34 < 0;
            }
            if (!v35) {
              break;
            }
            left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v24->__value_.__left_;
            int v23 = v24;
            if (!v24->__value_.__left_) {
              goto LABEL_48;
            }
          }
          int v36 = memcmp(v32, v26, v33);
          BOOL v37 = v31 < v25;
          if (v36) {
            BOOL v37 = v36 < 0;
          }
          if (!v37) {
            break;
          }
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v24[1].__value_.__left_;
          if (!left)
          {
            int v23 = v24 + 1;
            goto LABEL_48;
          }
        }
        if (v19 < ((char *)v24[8].__value_.__left_ - (char *)v24[7].__value_.__left_) >> 3) {
          goto LABEL_78;
        }
LABEL_141:
        if (!i) {
          goto LABEL_333;
        }
        p_stateInputEspressoBuffers = &self->_stateInputEspressoBuffers;
        size_t v91 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
        v90 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)self->_stateInputEspressoBuffers.__tree_.__pair1_.__value_.__left_;
        size_t v92 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
        v93 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
        if (!v90)
        {
LABEL_167:
          int64_t v107 = operator new(0x50uLL);
          unint64_t v108 = v107 + 4;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          {
            sub_1B4BCA11C(v108, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)unint64_t v108 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            v107[6] = *((void *)&__p.__r_.__value_.__l + 2);
          }
          v107[7] = 0;
          v107[8] = 0;
          v107[9] = 0;
          void *v107 = 0;
          v107[1] = 0;
          v107[2] = v93;
          v92->__value_.__left_ = v107;
          uint64_t v109 = *(void **)p_stateInputEspressoBuffers->__tree_.__begin_node_;
          uint64_t v110 = v107;
          if (v109)
          {
            p_stateInputEspressoBuffers->__tree_.__begin_node_ = v109;
            uint64_t v110 = v92->__value_.__left_;
          }
          uint64_t v111 = (uint64_t *)v91->__value_.__left_;
          BOOL v43 = v110 == v91->__value_.__left_;
          *((unsigned char *)v110 + 24) = v43;
          if (!v43)
          {
            do
            {
              uint64_t v112 = v110[2];
              if (*(unsigned char *)(v112 + 24)) {
                break;
              }
              v113 = *(uint64_t **)(v112 + 16);
              uint64_t v114 = *v113;
              if (*v113 == v112)
              {
                uint64_t v117 = v113[1];
                if (!v117 || (int v118 = *(unsigned __int8 *)(v117 + 24), v115 = (unsigned char *)(v117 + 24), v118))
                {
                  if (*(void **)v112 == v110)
                  {
                    *(unsigned char *)(v112 + 24) = 1;
                    *((unsigned char *)v113 + 24) = 0;
                    uint64_t v121 = *(void *)(v112 + 8);
                    uint64_t *v113 = v121;
                    if (v121) {
                      goto LABEL_187;
                    }
                  }
                  else
                  {
                    v119 = *(uint64_t **)(v112 + 8);
                    uint64_t v120 = *v119;
                    *(void *)(v112 + 8) = *v119;
                    if (v120)
                    {
                      *(void *)(v120 + 16) = v112;
                      v113 = *(uint64_t **)(v112 + 16);
                    }
                    v119[2] = (uint64_t)v113;
                    *(void *)(*(void *)(v112 + 16) + 8 * (**(void **)(v112 + 16) != v112)) = v119;
                    uint64_t *v119 = v112;
                    *(void *)(v112 + 16) = v119;
                    v113 = (uint64_t *)v119[2];
                    uint64_t v112 = *v113;
                    *((unsigned char *)v119 + 24) = 1;
                    *((unsigned char *)v113 + 24) = 0;
                    uint64_t v121 = *(void *)(v112 + 8);
                    uint64_t *v113 = v121;
                    if (v121) {
LABEL_187:
                    }
                      *(void *)(v121 + 16) = v113;
                  }
                  *(void *)(v112 + 16) = v113[2];
                  *(void *)(v113[2] + 8 * (*(void *)v113[2] != (void)v113)) = v112;
                  *(void *)(v112 + 8) = v113;
LABEL_195:
                  v113[2] = v112;
                  break;
                }
              }
              else if (!v114 || (int v116 = *(unsigned __int8 *)(v114 + 24), v115 = (unsigned char *)(v114 + 24), v116))
              {
                if (*(void **)v112 == v110)
                {
                  uint64_t v173 = v110[1];
                  *(void *)uint64_t v112 = v173;
                  if (v173)
                  {
                    *(void *)(v173 + 16) = v112;
                    v113 = *(uint64_t **)(v112 + 16);
                  }
                  v110[2] = v113;
                  *(void *)(*(void *)(v112 + 16) + 8 * (**(void **)(v112 + 16) != v112)) = v110;
                  v110[1] = v112;
                  *(void *)(v112 + 16) = v110;
                  v113 = (uint64_t *)v110[2];
                  *((unsigned char *)v110 + 24) = 1;
                  *((unsigned char *)v113 + 24) = 0;
                  uint64_t v112 = v113[1];
                  int64_t v122 = *(void **)v112;
                  v113[1] = *(void *)v112;
                  if (v122) {
LABEL_193:
                  }
                    v122[2] = v113;
                }
                else
                {
                  *(unsigned char *)(v112 + 24) = 1;
                  *((unsigned char *)v113 + 24) = 0;
                  uint64_t v112 = v113[1];
                  int64_t v122 = *(void **)v112;
                  v113[1] = *(void *)v112;
                  if (v122) {
                    goto LABEL_193;
                  }
                }
                *(void *)(v112 + 16) = v113[2];
                *(void *)(v113[2] + 8 * (*(void *)v113[2] != (void)v113)) = v112;
                *(void *)uint64_t v112 = v113;
                goto LABEL_195;
              }
              *(unsigned char *)(v112 + 24) = 1;
              uint64_t v110 = v113;
              *((unsigned char *)v113 + 24) = v113 == v111;
              unsigned char *v115 = 1;
            }
            while (v113 != v111);
          }
          ++self->_stateInputEspressoBuffers.__tree_.__pair3_.__value_;
          if (i > (uint64_t)(v107[8] - v107[7]) >> 2) {
            goto LABEL_197;
          }
          goto LABEL_278;
        }
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v94 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v94 = __p.__r_.__value_.__l.__size_;
        }
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          long long v95 = &__p;
        }
        else {
          long long v95 = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        while (1)
        {
          while (1)
          {
            v93 = v90;
            v98 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v90[4].__value_.__left_;
            uint64_t v96 = v90 + 4;
            uint64_t v97 = v98;
            int v99 = SHIBYTE(v96[2].__value_.__left_);
            if (v99 >= 0) {
              size_t v100 = HIBYTE(v96[2].__value_.__left_);
            }
            else {
              size_t v100 = (size_t)v96[1].__value_.__left_;
            }
            if (v99 >= 0) {
              unint64_t v101 = v96;
            }
            else {
              unint64_t v101 = v97;
            }
            if (v100 >= v94) {
              size_t v102 = v94;
            }
            else {
              size_t v102 = v100;
            }
            int v103 = memcmp(v95, v101, v102);
            BOOL v104 = v94 < v100;
            if (v103) {
              BOOL v104 = v103 < 0;
            }
            if (!v104) {
              break;
            }
            v90 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v93->__value_.__left_;
            size_t v92 = v93;
            if (!v93->__value_.__left_) {
              goto LABEL_167;
            }
          }
          int v105 = memcmp(v101, v95, v102);
          BOOL v106 = v100 < v94;
          if (v105) {
            BOOL v106 = v105 < 0;
          }
          if (!v106) {
            break;
          }
          v90 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v93[1].__value_.__left_;
          if (!v90)
          {
            size_t v92 = v93 + 1;
            goto LABEL_167;
          }
        }
        if (i <= ((char *)v93[8].__value_.__left_ - (char *)v93[7].__value_.__left_) >> 2) {
          goto LABEL_278;
        }
LABEL_197:
        uint64_t v123 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v91->__value_.__left_;
        unint64_t v124 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
        uint64_t v125 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
        if (v91->__value_.__left_)
        {
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v126 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v126 = __p.__r_.__value_.__l.__size_;
          }
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            v127 = &__p;
          }
          else {
            v127 = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          while (1)
          {
            while (1)
            {
              uint64_t v125 = v123;
              unint64_t v130 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v123[4].__value_.__left_;
              v128 = v123 + 4;
              int64_t v129 = v130;
              int v131 = SHIBYTE(v128[2].__value_.__left_);
              if (v131 >= 0) {
                size_t v132 = HIBYTE(v128[2].__value_.__left_);
              }
              else {
                size_t v132 = (size_t)v128[1].__value_.__left_;
              }
              if (v131 >= 0) {
                v133 = v128;
              }
              else {
                v133 = v129;
              }
              if (v132 >= v126) {
                size_t v134 = v126;
              }
              else {
                size_t v134 = v132;
              }
              int v135 = memcmp(v127, v133, v134);
              BOOL v136 = v126 < v132;
              if (v135) {
                BOOL v136 = v135 < 0;
              }
              if (!v136) {
                break;
              }
              uint64_t v123 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v125->__value_.__left_;
              unint64_t v124 = v125;
              if (!v125->__value_.__left_) {
                goto LABEL_222;
              }
            }
            int v137 = memcmp(v133, v127, v134);
            BOOL v138 = v132 < v126;
            if (v137) {
              BOOL v138 = v137 < 0;
            }
            if (!v138) {
              break;
            }
            uint64_t v123 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v125[1].__value_.__left_;
            if (!v123)
            {
              unint64_t v124 = v125 + 1;
              goto LABEL_222;
            }
          }
          int64_t v139 = (char *)v125;
        }
        else
        {
LABEL_222:
          int64_t v139 = (char *)operator new(0x50uLL);
          uint64_t v140 = v139 + 32;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          {
            sub_1B4BCA11C(v140, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)uint64_t v140 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            *((void *)v139 + 6) = *((void *)&__p.__r_.__value_.__l + 2);
          }
          *((void *)v139 + 7) = 0;
          *((void *)v139 + 8) = 0;
          *((void *)v139 + 9) = 0;
          *(void *)int64_t v139 = 0;
          *((void *)v139 + 1) = 0;
          *((void *)v139 + 2) = v125;
          v124->__value_.__left_ = v139;
          uint64_t v141 = *(void **)p_stateInputEspressoBuffers->__tree_.__begin_node_;
          int64_t v142 = v139;
          if (v141)
          {
            p_stateInputEspressoBuffers->__tree_.__begin_node_ = v141;
            int64_t v142 = v124->__value_.__left_;
          }
          uint64_t v143 = v91->__value_.__left_;
          BOOL v43 = v142 == v91->__value_.__left_;
          v142[24] = v43;
          if (!v43)
          {
            do
            {
              uint64_t v144 = *((void *)v142 + 2);
              if (*(unsigned char *)(v144 + 24)) {
                break;
              }
              uint64_t v145 = *(unsigned char **)(v144 + 16);
              uint64_t v146 = *(void *)v145;
              if (*(void *)v145 == v144)
              {
                uint64_t v149 = *((void *)v145 + 1);
                if (!v149 || (int v150 = *(unsigned __int8 *)(v149 + 24), v147 = (unsigned char *)(v149 + 24), v150))
                {
                  if (*(unsigned char **)v144 == v142)
                  {
                    *(unsigned char *)(v144 + 24) = 1;
                    v145[24] = 0;
                    uint64_t v153 = *(void *)(v144 + 8);
                    *(void *)uint64_t v145 = v153;
                    if (v153) {
                      goto LABEL_242;
                    }
                  }
                  else
                  {
                    uint64_t v151 = *(uint64_t **)(v144 + 8);
                    uint64_t v152 = *v151;
                    *(void *)(v144 + 8) = *v151;
                    if (v152)
                    {
                      *(void *)(v152 + 16) = v144;
                      uint64_t v145 = *(unsigned char **)(v144 + 16);
                    }
                    v151[2] = (uint64_t)v145;
                    *(void *)(*(void *)(v144 + 16) + 8 * (**(void **)(v144 + 16) != v144)) = v151;
                    *uint64_t v151 = v144;
                    *(void *)(v144 + 16) = v151;
                    uint64_t v145 = (unsigned char *)v151[2];
                    uint64_t v144 = *(void *)v145;
                    *((unsigned char *)v151 + 24) = 1;
                    v145[24] = 0;
                    uint64_t v153 = *(void *)(v144 + 8);
                    *(void *)uint64_t v145 = v153;
                    if (v153) {
LABEL_242:
                    }
                      *(void *)(v153 + 16) = v145;
                  }
                  *(void *)(v144 + 16) = *((void *)v145 + 2);
                  *(void *)(*((void *)v145 + 2) + 8 * (**((void **)v145 + 2) != (void)v145)) = v144;
                  *(void *)(v144 + 8) = v145;
LABEL_249:
                  *((void *)v145 + 2) = v144;
                  break;
                }
              }
              else if (!v146 || (int v148 = *(unsigned __int8 *)(v146 + 24), v147 = (unsigned char *)(v146 + 24), v148))
              {
                if (*(unsigned char **)v144 == v142)
                {
                  uint64_t v222 = *((void *)v142 + 1);
                  *(void *)uint64_t v144 = v222;
                  if (v222)
                  {
                    *(void *)(v222 + 16) = v144;
                    uint64_t v145 = *(unsigned char **)(v144 + 16);
                  }
                  *((void *)v142 + 2) = v145;
                  *(void *)(*(void *)(v144 + 16) + 8 * (**(void **)(v144 + 16) != v144)) = v142;
                  *((void *)v142 + 1) = v144;
                  *(void *)(v144 + 16) = v142;
                  uint64_t v145 = (unsigned char *)*((void *)v142 + 2);
                  v142[24] = 1;
                  v145[24] = 0;
                  uint64_t v144 = *((void *)v145 + 1);
                  v154 = *(unsigned char **)v144;
                  *((void *)v145 + 1) = *(void *)v144;
                  if (v154) {
LABEL_247:
                  }
                    *((void *)v154 + 2) = v145;
                }
                else
                {
                  *(unsigned char *)(v144 + 24) = 1;
                  v145[24] = 0;
                  uint64_t v144 = *((void *)v145 + 1);
                  v154 = *(unsigned char **)v144;
                  *((void *)v145 + 1) = *(void *)v144;
                  if (v154) {
                    goto LABEL_247;
                  }
                }
                *(void *)(v144 + 16) = *((void *)v145 + 2);
                *(void *)(*((void *)v145 + 2) + 8 * (**((void **)v145 + 2) != (void)v145)) = v144;
                *(void *)uint64_t v144 = v145;
                goto LABEL_249;
              }
              *(unsigned char *)(v144 + 24) = 1;
              int64_t v142 = v145;
              v145[24] = v145 == v143;
              unsigned char *v147 = 1;
            }
            while (v145 != v143);
          }
          ++self->_stateInputEspressoBuffers.__tree_.__pair3_.__value_;
        }
        v155 = (char *)*((void *)v139 + 7);
        uint64_t v156 = (unsigned char *)*((void *)v139 + 8);
        unint64_t v157 = (v156 - v155) >> 2;
        unint64_t v158 = i - v157;
        if (i <= v157)
        {
          if (i >= v157) {
            goto LABEL_278;
          }
          uint64_t v171 = &v155[4 * i];
          goto LABEL_265;
        }
        uint64_t v159 = *((void *)v139 + 9);
        if (v158 <= (v159 - (uint64_t)v156) >> 2)
        {
          size_t v172 = 4 * v158;
          bzero(*((void **)v139 + 8), v172);
          uint64_t v171 = &v156[v172];
LABEL_265:
          *((void *)v139 + 8) = v171;
          goto LABEL_278;
        }
        if (i >> 62) {
          sub_1B4BB3244();
        }
        uint64_t v160 = v159 - (void)v155;
        unint64_t v161 = v160 >> 1;
        if (v160 >> 1 <= i) {
          unint64_t v161 = i;
        }
        if ((unint64_t)v160 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v161 = 0x3FFFFFFFFFFFFFFFLL;
        }
        if (v161 >> 62) {
          sub_1B4BB2D38();
        }
        unint64_t v162 = v161;
        unint64_t v163 = (char *)operator new(4 * v161);
        size_t v164 = 4 * v158;
        int64_t v223 = v163;
        uint64_t v224 = 4 * v158;
        unint64_t v165 = &v163[4 * v157];
        bzero(v165, v164);
        uint64_t v166 = v156 - v155;
        if (v156 == v155)
        {
          int64_t v168 = v165;
          unint64_t v169 = v223;
          uint64_t v170 = v224;
        }
        else
        {
          unint64_t v167 = v166 - 4;
          if ((unint64_t)(v166 - 4) < 0x2C)
          {
            int64_t v168 = v165;
            unint64_t v169 = v223;
            uint64_t v170 = v224;
            goto LABEL_275;
          }
          unint64_t v169 = v223;
          uint64_t v170 = v224;
          int64_t v168 = v165;
          if ((unint64_t)(v155 - v223) < 0x20) {
            goto LABEL_356;
          }
          uint64_t v174 = (v167 >> 2) + 1;
          uint64_t v175 = 4 * (v174 & 0x7FFFFFFFFFFFFFF8);
          long long v176 = &v156[-v175];
          int64_t v168 = &v165[-v175];
          int v177 = &v223[4 * v157 - 16];
          char v178 = (long long *)(v156 - 16);
          uint64_t v179 = v174 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v180 = *v178;
            *((_OWORD *)v177 - 1) = *(v178 - 1);
            *(_OWORD *)int v177 = v180;
            v177 -= 32;
            v178 -= 2;
            v179 -= 8;
          }
          while (v179);
          uint64_t v156 = v176;
          if (v174 != (v174 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_356:
            do
            {
LABEL_275:
              int v181 = *((_DWORD *)v156 - 1);
              v156 -= 4;
              *((_DWORD *)v168 - 1) = v181;
              v168 -= 4;
            }
            while (v156 != v155);
          }
        }
        *((void *)v139 + 7) = v168;
        *((void *)v139 + 8) = &v165[v170];
        *((void *)v139 + 9) = &v169[4 * v162];
        if (v155) {
          operator delete(v155);
        }
LABEL_278:
        v182 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v91->__value_.__left_;
        long long v183 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
        v184 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
        if (v91->__value_.__left_)
        {
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v185 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v185 = __p.__r_.__value_.__l.__size_;
          }
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            v186 = &__p;
          }
          else {
            v186 = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          while (1)
          {
            while (1)
            {
              v184 = v182;
              long long v189 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v182[4].__value_.__left_;
              long long v187 = v182 + 4;
              v188 = v189;
              int v190 = SHIBYTE(v187[2].__value_.__left_);
              if (v190 >= 0) {
                size_t v191 = HIBYTE(v187[2].__value_.__left_);
              }
              else {
                size_t v191 = (size_t)v187[1].__value_.__left_;
              }
              if (v190 >= 0) {
                v192 = v187;
              }
              else {
                v192 = v188;
              }
              if (v191 >= v185) {
                size_t v193 = v185;
              }
              else {
                size_t v193 = v191;
              }
              int v194 = memcmp(v186, v192, v193);
              BOOL v195 = v185 < v191;
              if (v194) {
                BOOL v195 = v194 < 0;
              }
              if (!v195) {
                break;
              }
              v182 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v184->__value_.__left_;
              long long v183 = v184;
              if (!v184->__value_.__left_) {
                goto LABEL_303;
              }
            }
            int v196 = memcmp(v192, v186, v193);
            BOOL v197 = v191 < v185;
            if (v196) {
              BOOL v197 = v196 < 0;
            }
            if (!v197) {
              break;
            }
            v182 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v184[1].__value_.__left_;
            if (!v182)
            {
              long long v183 = v184 + 1;
              goto LABEL_303;
            }
          }
          unint64_t v198 = &v184->__value_.__left_;
        }
        else
        {
LABEL_303:
          unint64_t v198 = operator new(0x50uLL);
          v199 = v198 + 4;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          {
            sub_1B4BCA11C(v199, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)v199 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            v198[6] = *((void *)&__p.__r_.__value_.__l + 2);
          }
          v198[7] = 0;
          v198[8] = 0;
          v198[9] = 0;
          *unint64_t v198 = 0;
          v198[1] = 0;
          v198[2] = v184;
          v183->__value_.__left_ = v198;
          v200 = *(void **)p_stateInputEspressoBuffers->__tree_.__begin_node_;
          uint64_t v201 = v198;
          if (v200)
          {
            p_stateInputEspressoBuffers->__tree_.__begin_node_ = v200;
            uint64_t v201 = v183->__value_.__left_;
          }
          int64_t v202 = (uint64_t *)v91->__value_.__left_;
          BOOL v43 = v201 == v91->__value_.__left_;
          *((unsigned char *)v201 + 24) = v43;
          if (!v43)
          {
            do
            {
              uint64_t v203 = v201[2];
              if (*(unsigned char *)(v203 + 24)) {
                break;
              }
              uint64_t v204 = *(uint64_t **)(v203 + 16);
              uint64_t v205 = *v204;
              if (*v204 == v203)
              {
                uint64_t v208 = v204[1];
                if (!v208 || (int v209 = *(unsigned __int8 *)(v208 + 24), v206 = (unsigned char *)(v208 + 24), v209))
                {
                  if (*(void **)v203 == v201)
                  {
                    *(unsigned char *)(v203 + 24) = 1;
                    *((unsigned char *)v204 + 24) = 0;
                    uint64_t v212 = *(void *)(v203 + 8);
                    *uint64_t v204 = v212;
                    if (v212) {
                      goto LABEL_323;
                    }
                  }
                  else
                  {
                    long long v210 = *(uint64_t **)(v203 + 8);
                    uint64_t v211 = *v210;
                    *(void *)(v203 + 8) = *v210;
                    if (v211)
                    {
                      *(void *)(v211 + 16) = v203;
                      uint64_t v204 = *(uint64_t **)(v203 + 16);
                    }
                    v210[2] = (uint64_t)v204;
                    *(void *)(*(void *)(v203 + 16) + 8 * (**(void **)(v203 + 16) != v203)) = v210;
                    *long long v210 = v203;
                    *(void *)(v203 + 16) = v210;
                    uint64_t v204 = (uint64_t *)v210[2];
                    uint64_t v203 = *v204;
                    *((unsigned char *)v210 + 24) = 1;
                    *((unsigned char *)v204 + 24) = 0;
                    uint64_t v212 = *(void *)(v203 + 8);
                    *uint64_t v204 = v212;
                    if (v212) {
LABEL_323:
                    }
                      *(void *)(v212 + 16) = v204;
                  }
                  *(void *)(v203 + 16) = v204[2];
                  *(void *)(v204[2] + 8 * (*(void *)v204[2] != (void)v204)) = v203;
                  *(void *)(v203 + 8) = v204;
LABEL_330:
                  v204[2] = v203;
                  break;
                }
              }
              else if (!v205 || (int v207 = *(unsigned __int8 *)(v205 + 24), v206 = (unsigned char *)(v205 + 24), v207))
              {
                if (*(void **)v203 == v201)
                {
                  uint64_t v221 = v201[1];
                  *(void *)uint64_t v203 = v221;
                  if (v221)
                  {
                    *(void *)(v221 + 16) = v203;
                    uint64_t v204 = *(uint64_t **)(v203 + 16);
                  }
                  v201[2] = v204;
                  *(void *)(*(void *)(v203 + 16) + 8 * (**(void **)(v203 + 16) != v203)) = v201;
                  v201[1] = v203;
                  *(void *)(v203 + 16) = v201;
                  uint64_t v204 = (uint64_t *)v201[2];
                  *((unsigned char *)v201 + 24) = 1;
                  *((unsigned char *)v204 + 24) = 0;
                  uint64_t v203 = v204[1];
                  v213 = *(void **)v203;
                  v204[1] = *(void *)v203;
                  if (v213) {
LABEL_328:
                  }
                    v213[2] = v204;
                }
                else
                {
                  *(unsigned char *)(v203 + 24) = 1;
                  *((unsigned char *)v204 + 24) = 0;
                  uint64_t v203 = v204[1];
                  v213 = *(void **)v203;
                  v204[1] = *(void *)v203;
                  if (v213) {
                    goto LABEL_328;
                  }
                }
                *(void *)(v203 + 16) = v204[2];
                *(void *)(v204[2] + 8 * (*(void *)v204[2] != (void)v204)) = v203;
                *(void *)uint64_t v203 = v204;
                goto LABEL_330;
              }
              *(unsigned char *)(v203 + 24) = 1;
              uint64_t v201 = v204;
              *((unsigned char *)v204 + 24) = v204 == v202;
              unsigned char *v206 = 1;
            }
            while (v204 != v202);
          }
          ++self->_stateInputEspressoBuffers.__tree_.__pair3_.__value_;
        }
        uint64_t v214 = (void *)v198[7];
        id v215 = v230;
        uint64_t v219 = (const void *)objc_msgSend_bytes(v215, v216, v217, v218);
        memcpy(v214, v219, 4 * i);
LABEL_333:

        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        uint64_t v5 = v229 + 1;
      }
      while (v229 + 1 != v226);
      uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v220, (uint64_t)&v234, (uint64_t)v238, 16);
    }
    while (v4);
  }
}

- (void)copyOutputState:(id)a3
{
  id v117 = a3;
  uint64_t v120 = self;
  p_stateOutputEspressoBuffers = &self->_stateOutputEspressoBuffers;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)self->_stateOutputEspressoBuffers.__tree_.__begin_node_;
  p_pair1 = &self->_stateOutputEspressoBuffers.__tree_.__pair1_;
  if (begin_node != &self->_stateOutputEspressoBuffers.__tree_.__pair1_)
  {
    int v118 = &self->_stateOutputEspressoBuffers;
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
      uint64_t v8 = (uint64_t)&left_high[(void)left - 4];
      unint64_t v9 = (unint64_t)(left_high - 4);
      if ((unint64_t)(left_high - 4) > 0x7FFFFFFFFFFFFFF7) {
        sub_1B4BB33D8();
      }
      if (v9 > 0x16)
      {
        uint64_t v17 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v9 | 7) != 0x17) {
          uint64_t v17 = v9 | 7;
        }
        uint64_t v18 = v17 + 1;
        int64_t v10 = (void **)operator new(v17 + 1);
        size_t v132 = v9;
        int64_t v133 = v18 | 0x8000000000000000;
        int v131 = v10;
        if (left == (char *)v8)
        {
LABEL_19:
          size_t v11 = v10;
          goto LABEL_22;
        }
      }
      else
      {
        HIBYTE(v133) = (_BYTE)left_high - 4;
        int64_t v10 = (void **)&v131;
        if (left == (char *)v8) {
          goto LABEL_19;
        }
      }
      if (v9 < 0x20 || (unint64_t)((char *)v10 - left) < 0x20)
      {
        size_t v11 = v10;
        std::string::size_type v12 = left;
      }
      else
      {
        size_t v11 = (char *)v10 + (v9 & 0xFFFFFFFFFFFFFFE0);
        std::string::size_type v12 = &left[v9 & 0xFFFFFFFFFFFFFFE0];
        uint64_t v13 = (long long *)(left + 16);
        uint64_t v14 = v10 + 2;
        unint64_t v15 = v9 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v16 = *v13;
          *(v14 - 1) = *(v13 - 1);
          *uint64_t v14 = v16;
          v13 += 2;
          v14 += 2;
          v15 -= 32;
        }
        while (v15);
        if (v9 == (v9 & 0xFFFFFFFFFFFFFFE0)) {
          goto LABEL_22;
        }
      }
      do
      {
        char v19 = *v12++;
        *v11++ = v19;
      }
      while (v12 != (char *)v8);
LABEL_22:
      unsigned char *v11 = 0;
      int v20 = SHIBYTE(v133);
      if (v133 >= 0) {
        size_t v21 = HIBYTE(v133);
      }
      else {
        size_t v21 = v132;
      }
      unint64_t v22 = v21 + 3;
      if (v21 + 3 > 0x7FFFFFFFFFFFFFF7) {
        sub_1B4BB33D8();
      }
      if (v22 >= 0x17)
      {
        uint64_t v24 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v22 | 7) != 0x17) {
          uint64_t v24 = v22 | 7;
        }
        uint64_t v25 = v24 + 1;
        p_dst = (long long *)operator new(v24 + 1);
        *((void *)&__dst + 1) = v21 + 3;
        int64_t v130 = v25 | 0x8000000000000000;
        *(void *)&long long __dst = p_dst;
      }
      else
      {
        int64_t v130 = 0;
        long long __dst = 0uLL;
        p_dst = &__dst;
        HIBYTE(v130) = v21 + 3;
        if (!v21) {
          goto LABEL_36;
        }
      }
      if (v20 >= 0) {
        int v26 = (void **)&v131;
      }
      else {
        int v26 = v131;
      }
      memmove(p_dst, v26, v21);
LABEL_36:
      *(_DWORD *)((char *)p_dst + v21) = 7235935;
      uint64_t v27 = *(void *)(sub_1B4C625D0((uint64_t **)&v120->_stateInputEspressoBuffersShape, (const void **)&__dst, (uint64_t)&__dst)[7]+ 8);
      uint64_t v28 = *(void *)(sub_1B4C625D0((uint64_t **)&v120->_stateInputEspressoBuffersShape, (const void **)&__dst, (uint64_t)&__dst)[7]+ 16);
      uint64_t v29 = v27 + 1;
      uint64_t v122 = *(void *)sub_1B4C625D0((uint64_t **)&v120->_stateInputEspressoBuffersShape, (const void **)&__dst, (uint64_t)&__dst)[7];
      unint64_t v31 = v28 * (v27 + 1) * v122;
      std::string __p = 0;
      v127 = 0;
      HIDWORD(v128) = 0;
      if (!v31)
      {
        size_t v33 = 0;
        unint64_t v32 = 0;
        if (!v28) {
          goto LABEL_168;
        }
LABEL_41:
        uint64_t v34 = 0;
        uint64_t v35 = v122 * v27;
        uint64_t v123 = v122 * v29;
        uint64_t v124 = v122 * v27;
        uint64_t v119 = 4 * v122 * v27;
        uint64_t v121 = v28;
        while (2)
        {
          if (v35)
          {
            p_stateInputEspressoBuffers = &v120->_stateInputEspressoBuffers;
            unint64_t v38 = &v120->_stateInputEspressoBuffers.__tree_.__pair1_;
            BOOL v37 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v120->_stateInputEspressoBuffers.__tree_.__pair1_.__value_.__left_;
            uint64_t v39 = &v120->_stateInputEspressoBuffers.__tree_.__pair1_;
            uint64_t v40 = &v120->_stateInputEspressoBuffers.__tree_.__pair1_;
            if (v37)
            {
              if (v130 >= 0) {
                size_t v41 = HIBYTE(v130);
              }
              else {
                size_t v41 = *((void *)&__dst + 1);
              }
              if (v130 >= 0) {
                v42 = &__dst;
              }
              else {
                v42 = (long long *)__dst;
              }
              while (1)
              {
                while (1)
                {
                  uint64_t v40 = v37;
                  long long v45 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v37[4].__value_.__left_;
                  BOOL v43 = v37 + 4;
                  uint64_t v44 = v45;
                  int v46 = SHIBYTE(v43[2].__value_.__left_);
                  if (v46 >= 0) {
                    size_t v47 = HIBYTE(v43[2].__value_.__left_);
                  }
                  else {
                    size_t v47 = (size_t)v43[1].__value_.__left_;
                  }
                  if (v46 >= 0) {
                    int v48 = v43;
                  }
                  else {
                    int v48 = v44;
                  }
                  if (v47 >= v41) {
                    size_t v49 = v41;
                  }
                  else {
                    size_t v49 = v47;
                  }
                  int v50 = memcmp(v42, v48, v49);
                  BOOL v51 = v41 < v47;
                  if (v50) {
                    BOOL v51 = v50 < 0;
                  }
                  if (!v51) {
                    break;
                  }
                  BOOL v37 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v40->__value_.__left_;
                  uint64_t v39 = v40;
                  if (!v40->__value_.__left_) {
                    goto LABEL_73;
                  }
                }
                int v52 = memcmp(v48, v42, v49);
                BOOL v53 = v47 < v41;
                if (v52) {
                  BOOL v53 = v52 < 0;
                }
                if (!v53) {
                  break;
                }
                BOOL v37 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v40[1].__value_.__left_;
                if (!v37)
                {
                  uint64_t v39 = v40 + 1;
                  goto LABEL_73;
                }
              }
              p_left = &v40->__value_.__left_;
              uint64_t v62 = v124;
            }
            else
            {
LABEL_73:
              p_left = operator new(0x50uLL);
              v55 = p_left + 4;
              if (SHIBYTE(v130) < 0)
              {
                sub_1B4BCA11C(v55, (void *)__dst, *((unint64_t *)&__dst + 1));
              }
              else
              {
                *(_OWORD *)v55 = __dst;
                p_left[6] = v130;
              }
              p_left[7] = 0;
              p_left[8] = 0;
              p_left[9] = 0;
              void *p_left = 0;
              p_left[1] = 0;
              p_left[2] = v40;
              v39->__value_.__left_ = p_left;
              uint64_t v60 = *(void **)p_stateInputEspressoBuffers->__tree_.__begin_node_;
              v61 = p_left;
              uint64_t v62 = v124;
              if (v60)
              {
                p_stateInputEspressoBuffers->__tree_.__begin_node_ = v60;
                v61 = v39->__value_.__left_;
              }
              uint64_t v63 = (uint64_t *)v38->__value_.__left_;
              BOOL v64 = v61 == v38->__value_.__left_;
              *((unsigned char *)v61 + 24) = v64;
              if (!v64)
              {
                do
                {
                  uint64_t v65 = v61[2];
                  if (*(unsigned char *)(v65 + 24)) {
                    break;
                  }
                  size_t v66 = *(uint64_t **)(v65 + 16);
                  uint64_t v67 = *v66;
                  if (*v66 == v65)
                  {
                    uint64_t v70 = v66[1];
                    if (!v70 || (v71 = *(unsigned __int8 *)(v70 + 24), BOOL v68 = (unsigned char *)(v70 + 24), v71))
                    {
                      if (*(void **)v65 == v61)
                      {
                        *(unsigned char *)(v65 + 24) = 1;
                        *((unsigned char *)v66 + 24) = 0;
                        uint64_t v74 = *(void *)(v65 + 8);
                        *size_t v66 = v74;
                        if (v74) {
                          goto LABEL_95;
                        }
                      }
                      else
                      {
                        unint64_t v72 = *(uint64_t **)(v65 + 8);
                        uint64_t v73 = *v72;
                        *(void *)(v65 + 8) = *v72;
                        if (v73)
                        {
                          *(void *)(v73 + 16) = v65;
                          size_t v66 = *(uint64_t **)(v65 + 16);
                        }
                        v72[2] = (uint64_t)v66;
                        *(void *)(*(void *)(v65 + 16) + 8 * (**(void **)(v65 + 16) != v65)) = v72;
                        *unint64_t v72 = v65;
                        *(void *)(v65 + 16) = v72;
                        size_t v66 = (uint64_t *)v72[2];
                        uint64_t v65 = *v66;
                        *((unsigned char *)v72 + 24) = 1;
                        *((unsigned char *)v66 + 24) = 0;
                        uint64_t v74 = *(void *)(v65 + 8);
                        *size_t v66 = v74;
                        if (v74) {
LABEL_95:
                        }
                          *(void *)(v74 + 16) = v66;
                      }
                      *(void *)(v65 + 16) = v66[2];
                      *(void *)(v66[2] + 8 * (*(void *)v66[2] != (void)v66)) = v65;
                      *(void *)(v65 + 8) = v66;
LABEL_102:
                      v66[2] = v65;
                      break;
                    }
                  }
                  else if (!v67 || (v69 = *(unsigned __int8 *)(v67 + 24), BOOL v68 = (unsigned char *)(v67 + 24), v69))
                  {
                    if (*(void **)v65 == v61)
                    {
                      uint64_t v109 = v61[1];
                      *(void *)uint64_t v65 = v109;
                      if (v109)
                      {
                        *(void *)(v109 + 16) = v65;
                        size_t v66 = *(uint64_t **)(v65 + 16);
                      }
                      v61[2] = v66;
                      *(void *)(*(void *)(v65 + 16) + 8 * (**(void **)(v65 + 16) != v65)) = v61;
                      v61[1] = v65;
                      *(void *)(v65 + 16) = v61;
                      size_t v66 = (uint64_t *)v61[2];
                      *((unsigned char *)v61 + 24) = 1;
                      *((unsigned char *)v66 + 24) = 0;
                      uint64_t v65 = v66[1];
                      unint64_t v75 = *(void **)v65;
                      v66[1] = *(void *)v65;
                      if (v75) {
LABEL_100:
                      }
                        v75[2] = v66;
                    }
                    else
                    {
                      *(unsigned char *)(v65 + 24) = 1;
                      *((unsigned char *)v66 + 24) = 0;
                      uint64_t v65 = v66[1];
                      unint64_t v75 = *(void **)v65;
                      v66[1] = *(void *)v65;
                      if (v75) {
                        goto LABEL_100;
                      }
                    }
                    *(void *)(v65 + 16) = v66[2];
                    *(void *)(v66[2] + 8 * (*(void *)v66[2] != (void)v66)) = v65;
                    *(void *)uint64_t v65 = v66;
                    goto LABEL_102;
                  }
                  *(unsigned char *)(v65 + 24) = 1;
                  v61 = v66;
                  *((unsigned char *)v66 + 24) = v66 == v63;
                  *BOOL v68 = 1;
                }
                while (v66 != v63);
              }
              ++v120->_stateInputEspressoBuffers.__tree_.__pair3_.__value_;
            }
            v56 = __p;
            memcpy(&__p[4 * v34 * v123], (const void *)(p_left[7] + 4 * v34 * v62), v119);
            p_stateOutputEspressoBuffers = v118;
            v57 = p_pair1;
            unint64_t v58 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)p_pair1->__value_.__left_;
            uint64_t v59 = p_pair1;
            if (p_pair1->__value_.__left_)
            {
LABEL_105:
              int v76 = SHIBYTE(begin_node[6].__value_.__left_);
              if (v76 >= 0) {
                size_t v77 = HIBYTE(begin_node[6].__value_.__left_);
              }
              else {
                size_t v77 = (size_t)begin_node[5].__value_.__left_;
              }
              if (v76 >= 0) {
                uint64_t v78 = begin_node + 4;
              }
              else {
                uint64_t v78 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[4].__value_.__left_;
              }
              while (1)
              {
                while (1)
                {
                  v57 = v58;
                  uint64_t v81 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v58[4].__value_.__left_;
                  uint64_t v79 = v58 + 4;
                  int v80 = v81;
                  int v82 = SHIBYTE(v79[2].__value_.__left_);
                  if (v82 >= 0) {
                    size_t v83 = HIBYTE(v79[2].__value_.__left_);
                  }
                  else {
                    size_t v83 = (size_t)v79[1].__value_.__left_;
                  }
                  if (v82 >= 0) {
                    uint64_t v84 = v79;
                  }
                  else {
                    uint64_t v84 = v80;
                  }
                  if (v83 >= v77) {
                    size_t v85 = v77;
                  }
                  else {
                    size_t v85 = v83;
                  }
                  int v86 = memcmp(v78, v84, v85);
                  BOOL v87 = v77 < v83;
                  if (v86) {
                    BOOL v87 = v86 < 0;
                  }
                  if (!v87) {
                    break;
                  }
                  unint64_t v58 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v57->__value_.__left_;
                  uint64_t v59 = v57;
                  if (!v57->__value_.__left_) {
                    goto LABEL_129;
                  }
                }
                int v88 = memcmp(v84, v78, v85);
                BOOL v89 = v83 < v77;
                if (v88) {
                  BOOL v89 = v88 < 0;
                }
                if (!v89) {
                  break;
                }
                unint64_t v58 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v57[1].__value_.__left_;
                if (!v58)
                {
                  uint64_t v59 = v57 + 1;
                  goto LABEL_129;
                }
              }
              v90 = &v57->__value_.__left_;
              uint64_t v96 = v121;
              uint64_t v35 = v124;
LABEL_46:
              memcpy(&v56[4 * v34 * v123 + 4 * v35], (const void *)(v90[7] + 4 * v34 * v122), 4 * v122);
              if (++v34 == v96)
              {
                unint64_t v32 = __p;
                size_t v33 = v127;
                goto LABEL_168;
              }
              continue;
            }
          }
          else
          {
            v57 = p_pair1;
            v56 = __p;
            unint64_t v58 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)p_pair1->__value_.__left_;
            uint64_t v59 = p_pair1;
            if (p_pair1->__value_.__left_) {
              goto LABEL_105;
            }
          }
          break;
        }
LABEL_129:
        v90 = operator new(0x50uLL);
        size_t v91 = v90 + 4;
        if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
        {
          sub_1B4BCA11C(v91, begin_node[4].__value_.__left_, (unint64_t)begin_node[5].__value_.__left_);
        }
        else
        {
          long long v92 = *(_OWORD *)&begin_node[4].__value_.__left_;
          v90[6] = begin_node[6].__value_.__left_;
          *(_OWORD *)size_t v91 = v92;
        }
        v90[7] = 0;
        v90[8] = 0;
        v90[9] = 0;
        void *v90 = 0;
        v90[1] = 0;
        v90[2] = v57;
        v59->__value_.__left_ = v90;
        v93 = *(void **)p_stateOutputEspressoBuffers->__tree_.__begin_node_;
        std::string::size_type v94 = v90;
        uint64_t v35 = v124;
        if (v93)
        {
          p_stateOutputEspressoBuffers->__tree_.__begin_node_ = v93;
          std::string::size_type v94 = v59->__value_.__left_;
        }
        long long v95 = (uint64_t *)p_pair1->__value_.__left_;
        BOOL v64 = v94 == p_pair1->__value_.__left_;
        *((unsigned char *)v94 + 24) = v64;
        uint64_t v96 = v121;
        if (!v64)
        {
          do
          {
            uint64_t v97 = v94[2];
            if (*(unsigned char *)(v97 + 24)) {
              break;
            }
            v98 = *(uint64_t **)(v97 + 16);
            uint64_t v99 = *v98;
            if (*v98 == v97)
            {
              uint64_t v102 = v98[1];
              if (!v102 || (v103 = *(unsigned __int8 *)(v102 + 24), size_t v100 = (unsigned char *)(v102 + 24), v103))
              {
                if (*(void **)v97 == v94)
                {
                  *(unsigned char *)(v97 + 24) = 1;
                  *((unsigned char *)v98 + 24) = 0;
                  uint64_t v106 = *(void *)(v97 + 8);
                  uint64_t *v98 = v106;
                  if (v106) {
                    goto LABEL_149;
                  }
                }
                else
                {
                  BOOL v104 = *(uint64_t **)(v97 + 8);
                  uint64_t v105 = *v104;
                  *(void *)(v97 + 8) = *v104;
                  if (v105)
                  {
                    *(void *)(v105 + 16) = v97;
                    v98 = *(uint64_t **)(v97 + 16);
                  }
                  v104[2] = (uint64_t)v98;
                  *(void *)(*(void *)(v97 + 16) + 8 * (**(void **)(v97 + 16) != v97)) = v104;
                  uint64_t *v104 = v97;
                  *(void *)(v97 + 16) = v104;
                  v98 = (uint64_t *)v104[2];
                  uint64_t v97 = *v98;
                  *((unsigned char *)v104 + 24) = 1;
                  *((unsigned char *)v98 + 24) = 0;
                  uint64_t v106 = *(void *)(v97 + 8);
                  uint64_t *v98 = v106;
                  if (v106) {
LABEL_149:
                  }
                    *(void *)(v106 + 16) = v98;
                }
                *(void *)(v97 + 16) = v98[2];
                *(void *)(v98[2] + 8 * (*(void *)v98[2] != (void)v98)) = v97;
                *(void *)(v97 + 8) = v98;
LABEL_44:
                v98[2] = v97;
                break;
              }
            }
            else if (!v99 || (v101 = *(unsigned __int8 *)(v99 + 24), size_t v100 = (unsigned char *)(v99 + 24), v101))
            {
              if (*(void **)v97 == v94)
              {
                uint64_t v108 = v94[1];
                *(void *)uint64_t v97 = v108;
                if (v108)
                {
                  *(void *)(v108 + 16) = v97;
                  v98 = *(uint64_t **)(v97 + 16);
                }
                v94[2] = v98;
                *(void *)(*(void *)(v97 + 16) + 8 * (**(void **)(v97 + 16) != v97)) = v94;
                v94[1] = v97;
                *(void *)(v97 + 16) = v94;
                v98 = (uint64_t *)v94[2];
                *((unsigned char *)v94 + 24) = 1;
                *((unsigned char *)v98 + 24) = 0;
                uint64_t v97 = v98[1];
                int64_t v107 = *(void **)v97;
                v98[1] = *(void *)v97;
                if (!v107) {
                  goto LABEL_43;
                }
              }
              else
              {
                *(unsigned char *)(v97 + 24) = 1;
                *((unsigned char *)v98 + 24) = 0;
                uint64_t v97 = v98[1];
                int64_t v107 = *(void **)v97;
                v98[1] = *(void *)v97;
                if (!v107) {
                  goto LABEL_43;
                }
              }
              v107[2] = v98;
LABEL_43:
              *(void *)(v97 + 16) = v98[2];
              *(void *)(v98[2] + 8 * (*(void *)v98[2] != (void)v98)) = v97;
              *(void *)uint64_t v97 = v98;
              goto LABEL_44;
            }
            *(unsigned char *)(v97 + 24) = 1;
            std::string::size_type v94 = v98;
            *((unsigned char *)v98 + 24) = v98 == v95;
            unsigned char *v100 = 1;
          }
          while (v98 != v95);
        }
        ++p_stateOutputEspressoBuffers->__tree_.__pair3_.__value_;
        goto LABEL_46;
      }
      if (v31 >> 62) {
        sub_1B4BB3244();
      }
      unint64_t v32 = (char *)operator new(4 * v31);
      size_t v33 = &v32[4 * v31];
      std::string __p = v32;
      HIDWORD(v128) = HIDWORD(v33);
      bzero(v32, 4 * v29 * v28 * v122);
      v127 = v33;
      if (v28) {
        goto LABEL_41;
      }
LABEL_168:
      uint64_t v112 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v30, (uint64_t)v32, v33 - v32);
      if (v133 >= 0) {
        objc_msgSend_stringWithUTF8String_(NSString, v110, (uint64_t)&v131, v111);
      }
      else {
      v113 = objc_msgSend_stringWithUTF8String_(NSString, v110, (uint64_t)v131, v111);
      }
      objc_msgSend_setObject_forKeyedSubscript_(v117, v114, (uint64_t)v112, (uint64_t)v113);

      if (__p) {
        operator delete(__p);
      }
      if (SHIBYTE(v130) < 0)
      {
        operator delete((void *)__dst);
        if ((SHIBYTE(v133) & 0x80000000) == 0)
        {
LABEL_175:
          v115 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[1].__value_.__left_;
          if (v115) {
            goto LABEL_179;
          }
          goto LABEL_181;
        }
      }
      else if ((SHIBYTE(v133) & 0x80000000) == 0)
      {
        goto LABEL_175;
      }
      operator delete(v131);
      v115 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[1].__value_.__left_;
      if (v115)
      {
        do
        {
LABEL_179:
          int v116 = v115;
          v115 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v115->__value_.__left_;
        }
        while (v115);
        goto LABEL_3;
      }
      do
      {
LABEL_181:
        int v116 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[2].__value_.__left_;
        BOOL v64 = v116->__value_.__left_ == begin_node;
        begin_node = v116;
      }
      while (!v64);
LABEL_3:
      begin_node = v116;
    }
    while (v116 != p_pair1);
  }
}

- (void)runBlockWithCopyInputBlock:(id)a3 copyOutputBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  size_t v11 = objc_msgSend_decoderQueue(self, v8, v9, v10);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4C60568;
  block[3] = &unk_1E60A3B78;
  id v12 = v6;
  id v21 = v12;
  dispatch_sync(v11, block);

  long long v16 = objc_msgSend_decoderQueue(self, v13, v14, v15);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B4C60578;
  v18[3] = &unk_1E60A3BA0;
  v18[4] = self;
  id v19 = v7;
  id v17 = v7;
  dispatch_async(v16, v18);
}

- (void)runBlockWithCopyInput:(float *)a3 copyOutputBlock:(id)a4
{
  id v6 = a4;
  uint64_t v10 = objc_msgSend_decoderQueue(self, v7, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4C60650;
  block[3] = &unk_1E60A3BC8;
  id v13 = v6;
  uint64_t v14 = a3;
  void block[4] = self;
  id v11 = v6;
  dispatch_async(v10, block);
}

- (void)_runBlockWithCopyOutputBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v8 = objc_msgSend_perfResults(self, v5, v6, v7);
  id v12 = objc_msgSend_metricString(self, v9, v10, v11);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1B4C6097C;
  v24[3] = &unk_1E60A3BF0;
  v24[4] = self;
  objc_msgSend_run_block_(v8, v13, (uint64_t)v12, (uint64_t)v24);

  id v17 = objc_msgSend_nextBlock(self, v14, v15, v16);

  if (v17)
  {
    objc_msgSend_blockOutput(self, v18, v19, v20);
    objc_msgSend__blob_size_(self, v21, (uint64_t)v23, v22);
    operator new[]();
  }
  v4[2](v4);
}

- (unint64_t)modelIndex
{
  return self->_modelIndex;
}

- (void)setModelIndex:(unint64_t)a3
{
  self->_modelIndex = a3;
}

- (void)decoderPlan
{
  return self->_decoderPlan;
}

- (void)setDecoderPlan:(void *)a3
{
  self->_decoderPlan = a3;
}

- (void)decoderCtx
{
  return self->_decoderCtx;
}

- (void)setDecoderCtx:(void *)a3
{
  self->_decoderCtx = a3;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)decoderNet
{
  p_decoderNet = &self->_decoderNet;
  plan = self->_decoderNet.plan;
  uint64_t v4 = *(void *)&p_decoderNet->network_index;
  result.var1 = v4;
  result.var0 = plan;
  return result;
}

- (void)setDecoderNet:(id)a3
{
  self->_decoderNet = ($81D76D3AE0848955339013A8156F227B)a3;
}

- ($FD4688982923A924290ECB669CAF1EC2)attFeatsPlaceholderBlob
{
  long long v3 = *(_OWORD *)&self[2].var1;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[1].var14;
  *(_OWORD *)&retstr->var12 = v3;
  *(void *)&retstr->var14 = self[2].var2[1];
  long long v4 = *(_OWORD *)&self[1].var8;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[1].var6;
  *(_OWORD *)&retstr->var4 = v4;
  long long v5 = *(_OWORD *)&self[1].var12;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[1].var10;
  *(_OWORD *)&retstr->var8 = v5;
  long long v6 = *(_OWORD *)self[1].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var2[2];
  *(_OWORD *)retstr->var2 = v6;
  long long v7 = *(_OWORD *)&self[1].var4;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[1].var3[2];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setAttFeatsPlaceholderBlob:(id *)a3
{
  long long v4 = *(_OWORD *)a3->var2;
  long long v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_attFeatsPlaceholderBlob.dim = v4;
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.dim[2] = v3;
  long long v5 = *(_OWORD *)&a3->var6;
  long long v7 = *(_OWORD *)a3->var3;
  long long v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.channels = v5;
  *(_OWORD *)self->_attFeatsPlaceholderBlob.stride = v7;
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.stride[2] = v6;
  long long v9 = *(_OWORD *)&a3->var10;
  long long v8 = *(_OWORD *)&a3->var12;
  long long v10 = *(_OWORD *)&a3->var8;
  *(void *)&self->_attFeatsPlaceholderBlob.storage_type = *(void *)&a3->var14;
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.stride_height = v9;
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.stride_batch_number = v8;
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.sequence_length = v10;
}

- ($FD4688982923A924290ECB669CAF1EC2)scaleInput
{
  long long v3 = *(_OWORD *)&self[3].var1;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[2].var14;
  *(_OWORD *)&retstr->var12 = v3;
  *(void *)&retstr->var14 = self[3].var2[1];
  long long v4 = *(_OWORD *)&self[2].var8;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[2].var6;
  *(_OWORD *)&retstr->var4 = v4;
  long long v5 = *(_OWORD *)&self[2].var12;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[2].var10;
  *(_OWORD *)&retstr->var8 = v5;
  long long v6 = *(_OWORD *)self[2].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var2[2];
  *(_OWORD *)retstr->var2 = v6;
  long long v7 = *(_OWORD *)&self[2].var4;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[2].var3[2];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setScaleInput:(id *)a3
{
  long long v4 = *(_OWORD *)a3->var2;
  long long v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_scaleInput.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_scaleInput.dim = v4;
  *(_OWORD *)&self->_scaleInput.dim[2] = v3;
  long long v5 = *(_OWORD *)&a3->var6;
  long long v7 = *(_OWORD *)a3->var3;
  long long v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_scaleInput.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_scaleInput.channels = v5;
  *(_OWORD *)self->_scaleInput.stride = v7;
  *(_OWORD *)&self->_scaleInput.stride[2] = v6;
  long long v9 = *(_OWORD *)&a3->var10;
  long long v8 = *(_OWORD *)&a3->var12;
  long long v10 = *(_OWORD *)&a3->var8;
  *(void *)&self->_scaleInput.storage_type = *(void *)&a3->var14;
  *(_OWORD *)&self->_scaleInput.stride_height = v9;
  *(_OWORD *)&self->_scaleInput.stride_batch_number = v8;
  *(_OWORD *)&self->_scaleInput.sequence_length = v10;
}

- ($FD4688982923A924290ECB669CAF1EC2)positionInput
{
  long long v3 = *(_OWORD *)&self[4].var1;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[3].var14;
  *(_OWORD *)&retstr->var12 = v3;
  *(void *)&retstr->var14 = self[4].var2[1];
  long long v4 = *(_OWORD *)&self[3].var8;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[3].var6;
  *(_OWORD *)&retstr->var4 = v4;
  long long v5 = *(_OWORD *)&self[3].var12;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[3].var10;
  *(_OWORD *)&retstr->var8 = v5;
  long long v6 = *(_OWORD *)self[3].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var2[2];
  *(_OWORD *)retstr->var2 = v6;
  long long v7 = *(_OWORD *)&self[3].var4;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[3].var3[2];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setPositionInput:(id *)a3
{
  long long v4 = *(_OWORD *)a3->var2;
  long long v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_positionInput.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_positionInput.dim = v4;
  *(_OWORD *)&self->_positionInput.dim[2] = v3;
  long long v5 = *(_OWORD *)&a3->var6;
  long long v7 = *(_OWORD *)a3->var3;
  long long v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_positionInput.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_positionInput.channels = v5;
  *(_OWORD *)self->_positionInput.stride = v7;
  *(_OWORD *)&self->_positionInput.stride[2] = v6;
  long long v9 = *(_OWORD *)&a3->var10;
  long long v8 = *(_OWORD *)&a3->var12;
  long long v10 = *(_OWORD *)&a3->var8;
  *(void *)&self->_positionInput.storage_type = *(void *)&a3->var14;
  *(_OWORD *)&self->_positionInput.stride_height = v9;
  *(_OWORD *)&self->_positionInput.stride_batch_number = v8;
  *(_OWORD *)&self->_positionInput.sequence_length = v10;
}

- ($FD4688982923A924290ECB669CAF1EC2)maskInput
{
  long long v3 = *(_OWORD *)&self[5].var1;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[4].var14;
  *(_OWORD *)&retstr->var12 = v3;
  *(void *)&retstr->var14 = self[5].var2[1];
  long long v4 = *(_OWORD *)&self[4].var8;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[4].var6;
  *(_OWORD *)&retstr->var4 = v4;
  long long v5 = *(_OWORD *)&self[4].var12;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[4].var10;
  *(_OWORD *)&retstr->var8 = v5;
  long long v6 = *(_OWORD *)self[4].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[4].var2[2];
  *(_OWORD *)retstr->var2 = v6;
  long long v7 = *(_OWORD *)&self[4].var4;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[4].var3[2];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setMaskInput:(id *)a3
{
  long long v4 = *(_OWORD *)a3->var2;
  long long v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_maskInput.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_maskInput.dim = v4;
  *(_OWORD *)&self->_maskInput.dim[2] = v3;
  long long v5 = *(_OWORD *)&a3->var6;
  long long v7 = *(_OWORD *)a3->var3;
  long long v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_maskInput.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_maskInput.channels = v5;
  *(_OWORD *)self->_maskInput.stride = v7;
  *(_OWORD *)&self->_maskInput.stride[2] = v6;
  long long v9 = *(_OWORD *)&a3->var10;
  long long v8 = *(_OWORD *)&a3->var12;
  long long v10 = *(_OWORD *)&a3->var8;
  *(void *)&self->_maskInput.storage_type = *(void *)&a3->var14;
  *(_OWORD *)&self->_maskInput.stride_height = v9;
  *(_OWORD *)&self->_maskInput.stride_batch_number = v8;
  *(_OWORD *)&self->_maskInput.sequence_length = v10;
}

- ($FD4688982923A924290ECB669CAF1EC2)blockInput
{
  long long v3 = *(_OWORD *)&self[6].var1;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[5].var14;
  *(_OWORD *)&retstr->var12 = v3;
  *(void *)&retstr->var14 = self[6].var2[1];
  long long v4 = *(_OWORD *)&self[5].var8;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[5].var6;
  *(_OWORD *)&retstr->var4 = v4;
  long long v5 = *(_OWORD *)&self[5].var12;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[5].var10;
  *(_OWORD *)&retstr->var8 = v5;
  long long v6 = *(_OWORD *)self[5].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[5].var2[2];
  *(_OWORD *)retstr->var2 = v6;
  long long v7 = *(_OWORD *)&self[5].var4;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[5].var3[2];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setBlockInput:(id *)a3
{
  long long v4 = *(_OWORD *)a3->var2;
  long long v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_blockInput.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_blockInput.dim = v4;
  *(_OWORD *)&self->_blockInput.dim[2] = v3;
  long long v5 = *(_OWORD *)&a3->var6;
  long long v7 = *(_OWORD *)a3->var3;
  long long v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_blockInput.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_blockInput.channels = v5;
  *(_OWORD *)self->_blockInput.stride = v7;
  *(_OWORD *)&self->_blockInput.stride[2] = v6;
  long long v9 = *(_OWORD *)&a3->var10;
  long long v8 = *(_OWORD *)&a3->var12;
  long long v10 = *(_OWORD *)&a3->var8;
  *(void *)&self->_blockInput.storage_type = *(void *)&a3->var14;
  *(_OWORD *)&self->_blockInput.stride_height = v9;
  *(_OWORD *)&self->_blockInput.stride_batch_number = v8;
  *(_OWORD *)&self->_blockInput.sequence_length = v10;
}

- ($FD4688982923A924290ECB669CAF1EC2)blockOutput
{
  long long v3 = *(_OWORD *)&self[7].var1;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[6].var14;
  *(_OWORD *)&retstr->var12 = v3;
  *(void *)&retstr->var14 = self[7].var2[1];
  long long v4 = *(_OWORD *)&self[6].var8;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[6].var6;
  *(_OWORD *)&retstr->var4 = v4;
  long long v5 = *(_OWORD *)&self[6].var12;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[6].var10;
  *(_OWORD *)&retstr->var8 = v5;
  long long v6 = *(_OWORD *)self[6].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[6].var2[2];
  *(_OWORD *)retstr->var2 = v6;
  long long v7 = *(_OWORD *)&self[6].var4;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[6].var3[2];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setBlockOutput:(id *)a3
{
  long long v4 = *(_OWORD *)a3->var2;
  long long v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_blockOutput.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_blockOutput.dim = v4;
  *(_OWORD *)&self->_blockOutput.dim[2] = v3;
  long long v5 = *(_OWORD *)&a3->var6;
  long long v7 = *(_OWORD *)a3->var3;
  long long v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_blockOutput.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_blockOutput.channels = v5;
  *(_OWORD *)self->_blockOutput.stride = v7;
  *(_OWORD *)&self->_blockOutput.stride[2] = v6;
  long long v9 = *(_OWORD *)&a3->var10;
  long long v8 = *(_OWORD *)&a3->var12;
  long long v10 = *(_OWORD *)&a3->var8;
  *(void *)&self->_blockOutput.storage_type = *(void *)&a3->var14;
  *(_OWORD *)&self->_blockOutput.stride_height = v9;
  *(_OWORD *)&self->_blockOutput.stride_batch_number = v8;
  *(_OWORD *)&self->_blockOutput.sequence_length = v10;
}

- (map<std::string,)stateOutputEspressoBuffers
{
  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  p_pair3 = &self[4].__tree_.__pair3_;
  left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)self[4].__tree_.__pair1_.__value_.__left_;
  if (left != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)&self[4].__tree_.__pair3_)
  {
    do
    {
      self = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)sub_1B4C619F8((uint64_t *)retstr, (uint64_t)&retstr->__tree_.__pair1_, (const void **)&left[1].__tree_.__pair1_.__value_.__left_, (long long *)&left[1].__tree_.__pair1_);
      begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)left->__tree_.__pair1_.__value_.__left_;
      if (begin_node)
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)begin_node;
          begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)begin_node->__tree_.__begin_node_;
        }
        while (begin_node);
      }
      else
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)left->__tree_.__pair3_.__value_;
          BOOL v8 = *value == left;
          left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
        }
        while (!v8);
      }
      left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
    }
    while (value != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)p_pair3);
  }
  return self;
}

- (void)setStateOutputEspressoBuffers:()map<std:()std:()std:(std:(std::vector<float>>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :vector<float> :string
{
  p_stateOutputEspressoBuffers = &self->_stateOutputEspressoBuffers;
  if (p_stateOutputEspressoBuffers != a3) {
    sub_1B4C61E54((uint64_t)p_stateOutputEspressoBuffers, (long long *)a3->__tree_.__begin_node_, (long long *)&a3->__tree_.__pair1_);
  }
}

- (map<std::string,)stateInputEspressoBuffers
{
  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  p_pair3 = &self[5].__tree_.__pair3_;
  left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)self[5].__tree_.__pair1_.__value_.__left_;
  if (left != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)&self[5].__tree_.__pair3_)
  {
    do
    {
      self = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)sub_1B4C619F8((uint64_t *)retstr, (uint64_t)&retstr->__tree_.__pair1_, (const void **)&left[1].__tree_.__pair1_.__value_.__left_, (long long *)&left[1].__tree_.__pair1_);
      begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)left->__tree_.__pair1_.__value_.__left_;
      if (begin_node)
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)begin_node;
          begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)begin_node->__tree_.__begin_node_;
        }
        while (begin_node);
      }
      else
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)left->__tree_.__pair3_.__value_;
          BOOL v8 = *value == left;
          left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
        }
        while (!v8);
      }
      left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
    }
    while (value != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)p_pair3);
  }
  return self;
}

- (void)setStateInputEspressoBuffers:()map<std:()std:()std:(std:(std::vector<float>>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :vector<float> :string
{
  p_stateInputEspressoBuffers = &self->_stateInputEspressoBuffers;
  if (p_stateInputEspressoBuffers != a3) {
    sub_1B4C61E54((uint64_t)p_stateInputEspressoBuffers, (long long *)a3->__tree_.__begin_node_, (long long *)&a3->__tree_.__pair1_);
  }
}

- (map<std::string,)stateInputEspressoBuffersShape
{
  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  p_pair1 = &retstr->__tree_.__pair1_;
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  left = (__compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *)self[6].__tree_.__pair1_.__value_.__left_;
  p_pair3 = &self[6].__tree_.__pair3_;
  if (left != &self[6].__tree_.__pair3_)
  {
    begin_node = &retstr->__tree_.__pair1_;
    while (1)
    {
      long long v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)p_pair1->__value_.__left_;
      long long v7 = p_pair1;
      if (begin_node == p_pair1) {
        break;
      }
      BOOL v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)p_pair1->__value_.__left_;
      long long v9 = p_pair1;
      if (v6)
      {
        do
        {
          long long v7 = v8;
          BOOL v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v8[1].__value_.__left_;
        }
        while (v8);
      }
      else
      {
        do
        {
          long long v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v9[2].__value_.__left_;
          BOOL v10 = v7->__value_.__left_ == v9;
          long long v9 = v7;
        }
        while (v10);
      }
      int value_high = SHIBYTE(left[6].__value_);
      int left_high = SHIBYTE(v7[6].__value_.__left_);
      if (left_high >= 0) {
        size_t v13 = HIBYTE(v7[6].__value_.__left_);
      }
      else {
        size_t v13 = (size_t)v7[5].__value_.__left_;
      }
      if (left_high >= 0) {
        uint64_t v14 = v7 + 4;
      }
      else {
        uint64_t v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v7[4].__value_.__left_;
      }
      if (value_high >= 0) {
        size_t value = HIBYTE(left[6].__value_);
      }
      else {
        size_t value = left[5].__value_;
      }
      if (value_high >= 0) {
        uint64_t v16 = left + 4;
      }
      else {
        uint64_t v16 = (__compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *)left[4].__value_;
      }
      if (value >= v13) {
        size_t v17 = v13;
      }
      else {
        size_t v17 = value;
      }
      self = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)memcmp(v14, v16, v17);
      BOOL v18 = v13 < value;
      if (self) {
        BOOL v18 = (int)self < 0;
      }
      if (v18) {
        break;
      }
      int v36 = begin_node;
      uint64_t v20 = (uint64_t **)p_pair1;
      uint64_t v19 = p_pair1;
      if (!v6) {
        goto LABEL_55;
      }
      id v21 = v6;
      while (1)
      {
        while (1)
        {
          uint64_t v19 = v21;
          uint64_t v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v21[4].__value_.__left_;
          uint64_t v22 = v21 + 4;
          int v23 = v24;
          int v25 = SHIBYTE(v22[2].__value_.__left_);
          if (v25 >= 0) {
            size_t v26 = HIBYTE(v22[2].__value_.__left_);
          }
          else {
            size_t v26 = (size_t)v22[1].__value_.__left_;
          }
          if (v25 >= 0) {
            uint64_t v27 = v22;
          }
          else {
            uint64_t v27 = v23;
          }
          if (v26 >= value) {
            size_t v28 = value;
          }
          else {
            size_t v28 = v26;
          }
          int v29 = memcmp(v16, v27, v28);
          BOOL v30 = value < v26;
          if (v29) {
            BOOL v30 = v29 < 0;
          }
          if (!v30) {
            break;
          }
          id v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v19->__value_.__left_;
          uint64_t v20 = (uint64_t **)v19;
          if (!v19->__value_.__left_) {
            goto LABEL_55;
          }
        }
        self = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)memcmp(v27, v16, v28);
        BOOL v31 = v26 < value;
        if (self) {
          BOOL v31 = (int)self < 0;
        }
        if (!v31) {
          break;
        }
        id v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v19[1].__value_.__left_;
        if (!v21)
        {
          uint64_t v20 = (uint64_t **)&v19[1];
          goto LABEL_55;
        }
      }
      begin_node = v36;
      uint64_t v34 = (__compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *)left[1].__value_;
      if (!v34)
      {
        do
        {
LABEL_62:
          uint64_t v35 = (__compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *)left[2].__value_;
          BOOL v10 = v35->__value_ == (void)left;
          left = v35;
        }
        while (!v10);
        goto LABEL_3;
      }
      do
      {
LABEL_59:
        uint64_t v35 = v34;
        uint64_t v34 = (__compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *)v34->__value_;
      }
      while (v34);
LABEL_3:
      left = v35;
      if (v35 == p_pair3) {
        return self;
      }
    }
    if (v6) {
      uint64_t v19 = v7;
    }
    else {
      uint64_t v19 = p_pair1;
    }
    if (v6) {
      uint64_t v20 = (uint64_t **)&v7[1];
    }
    else {
      uint64_t v20 = (uint64_t **)p_pair1;
    }
    if (!*v20)
    {
LABEL_55:
      unint64_t v32 = (uint64_t *)operator new(0x50uLL);
      sub_1B4C62438(v32 + 4, (long long *)&left[4]);
      uint64_t *v32 = 0;
      v32[1] = 0;
      v32[2] = (uint64_t)v19;
      *uint64_t v20 = v32;
      size_t v33 = *(void **)retstr->__tree_.__begin_node_;
      if (v33)
      {
        retstr->__tree_.__begin_node_ = v33;
        unint64_t v32 = *v20;
      }
      self = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)sub_1B4BB3DA4((uint64_t *)retstr->__tree_.__pair1_.__value_.__left_, v32);
      ++retstr->__tree_.__pair3_.__value_;
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)retstr->__tree_.__begin_node_;
    }
    uint64_t v34 = (__compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *)left[1].__value_;
    if (!v34) {
      goto LABEL_62;
    }
    goto LABEL_59;
  }
  return self;
}

- (void)setStateInputEspressoBuffersShape:()map<std:(std:()std:(std:(std::vector<unsigned long>>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :vector<unsigned)long> :string
{
  unint64_t p_stateInputEspressoBuffersShape = &self->_stateInputEspressoBuffersShape;
  if (&self->_stateInputEspressoBuffersShape != a3)
  {
    p_pair1 = &a3->__tree_.__pair1_;
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)a3->__tree_.__begin_node_;
    if (!self->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_) {
      goto LABEL_60;
    }
    long long v6 = p_stateInputEspressoBuffersShape->__tree_.__begin_node_;
    BOOL v8 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
    left = self->_stateInputEspressoBuffersShape.__tree_.__pair1_.__value_.__left_;
    self->_stateInputEspressoBuffersShape.__tree_.__begin_node_ = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
    left[2] = 0;
    self->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_ = 0;
    self->_stateInputEspressoBuffersShape.__tree_.__pair1_.__value_.__left_ = 0;
    long long v9 = v6[1]
       ? (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v6[1]
       : (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v6;
    if (v9)
    {
      BOOL v10 = (char *)v9[2].__value_.__left_;
      if (v10)
      {
        uint64_t v11 = *(char **)v10;
        if (*(__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> **)v10 == v9)
        {
          *(void *)BOOL v10 = 0;
          while (1)
          {
            v56 = (char *)*((void *)v10 + 1);
            if (!v56) {
              break;
            }
            do
            {
              BOOL v10 = v56;
              v56 = *(char **)v56;
            }
            while (v56);
          }
        }
        else
        {
          for (*((void *)v10 + 1) = 0; v11; uint64_t v11 = (char *)*((void *)v10 + 1))
          {
            do
            {
              BOOL v10 = v11;
              uint64_t v11 = *(char **)v11;
            }
            while (v11);
          }
        }
      }
      if (begin_node != p_pair1)
      {
        while (1)
        {
          id v12 = v10;
          size_t v13 = v9 + 4;
          std::string::operator=((std::string *)&v9[4], (const std::string *)&begin_node[4]);
          if (v9 != begin_node) {
            sub_1B4C0A420(&v9[7].__value_.__left_, (char *)begin_node[7].__value_.__left_, (char *)begin_node[8].__value_.__left_, ((char *)begin_node[8].__value_.__left_ - (char *)begin_node[7].__value_.__left_) >> 3);
          }
          uint64_t v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v8->__value_.__left_;
          uint64_t v15 = &p_stateInputEspressoBuffersShape->__tree_.__pair1_;
          uint64_t v16 = &p_stateInputEspressoBuffersShape->__tree_.__pair1_;
          if (v8->__value_.__left_) {
            break;
          }
LABEL_36:
          v9->__value_.__left_ = 0;
          v9[1].__value_.__left_ = 0;
          v9[2].__value_.__left_ = v15;
          v16->__value_.__left_ = v9;
          size_t v28 = *(void **)p_stateInputEspressoBuffersShape->__tree_.__begin_node_;
          if (v28) {
            goto LABEL_37;
          }
LABEL_38:
          sub_1B4BB3DA4((uint64_t *)p_stateInputEspressoBuffersShape->__tree_.__pair1_.__value_.__left_, (uint64_t *)v9);
          ++p_stateInputEspressoBuffersShape->__tree_.__pair3_.__value_;
          if (v12)
          {
            BOOL v10 = (char *)*((void *)v12 + 2);
            if (v10)
            {
              unint64_t v32 = *(char **)v10;
              if (*(char **)v10 == v12)
              {
                *(void *)BOOL v10 = 0;
                while (1)
                {
                  size_t v33 = (char *)*((void *)v10 + 1);
                  if (!v33) {
                    break;
                  }
                  do
                  {
                    BOOL v10 = v33;
                    size_t v33 = *(char **)v33;
                  }
                  while (v33);
                }
              }
              else
              {
                for (*((void *)v10 + 1) = 0; v32; unint64_t v32 = (char *)*((void *)v10 + 1))
                {
                  do
                  {
                    BOOL v10 = v32;
                    unint64_t v32 = *(char **)v32;
                  }
                  while (v32);
                }
              }
            }
          }
          else
          {
            BOOL v10 = 0;
          }
          int v29 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)begin_node[1].__value_.__left_;
          if (v29)
          {
            do
            {
              BOOL v30 = v29;
              int v29 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v29->__value_.__left_;
            }
            while (v29);
          }
          else
          {
            do
            {
              BOOL v30 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)begin_node[2].__value_.__left_;
              BOOL v31 = v30->__value_.__left_ == begin_node;
              begin_node = v30;
            }
            while (!v31);
          }
          if (v12)
          {
            long long v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v12;
            begin_node = v30;
            if (v30 != p_pair1) {
              continue;
            }
          }
          goto LABEL_62;
        }
        int left_high = SHIBYTE(v9[6].__value_.__left_);
        if (left_high >= 0) {
          size_t v18 = HIBYTE(v9[6].__value_.__left_);
        }
        else {
          size_t v18 = (size_t)v9[5].__value_.__left_;
        }
        if (left_high < 0) {
          size_t v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v9[4].__value_.__left_;
        }
        do
        {
          while (1)
          {
            uint64_t v15 = v14;
            id v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v14[4].__value_.__left_;
            uint64_t v19 = v14 + 4;
            uint64_t v20 = v21;
            int v22 = SHIBYTE(v19[2].__value_.__left_);
            if (v22 >= 0) {
              size_t v23 = HIBYTE(v19[2].__value_.__left_);
            }
            else {
              size_t v23 = (size_t)v19[1].__value_.__left_;
            }
            if (v22 >= 0) {
              uint64_t v24 = v19;
            }
            else {
              uint64_t v24 = v20;
            }
            if (v23 >= v18) {
              size_t v25 = v18;
            }
            else {
              size_t v25 = v23;
            }
            int v26 = memcmp(v13, v24, v25);
            BOOL v27 = v18 < v23;
            if (v26) {
              BOOL v27 = v26 < 0;
            }
            if (!v27) {
              break;
            }
            uint64_t v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v15->__value_.__left_;
            uint64_t v16 = v15;
            if (!v15->__value_.__left_) {
              goto LABEL_36;
            }
          }
          uint64_t v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v15[1].__value_.__left_;
        }
        while (v14);
        uint64_t v16 = v15 + 1;
        v9->__value_.__left_ = 0;
        v9[1].__value_.__left_ = 0;
        v9[2].__value_.__left_ = v15;
        v15[1].__value_.__left_ = v9;
        size_t v28 = *(void **)p_stateInputEspressoBuffersShape->__tree_.__begin_node_;
        if (!v28) {
          goto LABEL_38;
        }
LABEL_37:
        p_stateInputEspressoBuffersShape->__tree_.__begin_node_ = v28;
        long long v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v16->__value_.__left_;
        goto LABEL_38;
      }
      BOOL v30 = begin_node;
      id v12 = (char *)v9;
LABEL_62:
      sub_1B4C62544(v12);
      if (v10)
      {
        for (unint64_t i = (char *)*((void *)v10 + 2); i; unint64_t i = (char *)*((void *)i + 2))
          BOOL v10 = i;
        sub_1B4C62544(v10);
      }
    }
    else
    {
LABEL_60:
      BOOL v30 = begin_node;
    }
    if (v30 != p_pair1)
    {
      uint64_t v35 = &p_stateInputEspressoBuffersShape->__tree_.__pair1_;
      while (1)
      {
        int v36 = operator new(0x50uLL);
        BOOL v37 = sub_1B4C62438(v36 + 4, (long long *)&v30[4]);
        unint64_t v38 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v35->__value_.__left_;
        uint64_t v39 = &p_stateInputEspressoBuffersShape->__tree_.__pair1_;
        uint64_t v40 = &p_stateInputEspressoBuffersShape->__tree_.__pair1_;
        if (v35->__value_.__left_) {
          break;
        }
LABEL_90:
        *int v36 = 0;
        v36[1] = 0;
        v36[2] = v39;
        v40->__value_.__left_ = v36;
        BOOL v53 = *(void **)p_stateInputEspressoBuffersShape->__tree_.__begin_node_;
        if (v53) {
          goto LABEL_91;
        }
LABEL_92:
        sub_1B4BB3DA4((uint64_t *)p_stateInputEspressoBuffersShape->__tree_.__pair1_.__value_.__left_, v36);
        ++p_stateInputEspressoBuffersShape->__tree_.__pair3_.__value_;
        unint64_t v54 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v30[1].__value_.__left_;
        if (v54)
        {
          do
          {
            v55 = v54;
            unint64_t v54 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v54->__value_.__left_;
          }
          while (v54);
        }
        else
        {
          do
          {
            v55 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v30[2].__value_.__left_;
            BOOL v31 = v55->__value_.__left_ == v30;
            BOOL v30 = v55;
          }
          while (!v31);
        }
        BOOL v30 = v55;
        if (v55 == p_pair1) {
          return;
        }
      }
      int v41 = *((char *)v36 + 55);
      if (v41 >= 0) {
        size_t v42 = *((unsigned __int8 *)v36 + 55);
      }
      else {
        size_t v42 = v36[5];
      }
      if (v41 >= 0) {
        BOOL v43 = v37;
      }
      else {
        BOOL v43 = (const void *)v36[4];
      }
      do
      {
        while (1)
        {
          uint64_t v39 = v38;
          int v46 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v38[4].__value_.__left_;
          uint64_t v44 = v38 + 4;
          long long v45 = v46;
          int v47 = SHIBYTE(v44[2].__value_.__left_);
          if (v47 >= 0) {
            size_t v48 = HIBYTE(v44[2].__value_.__left_);
          }
          else {
            size_t v48 = (size_t)v44[1].__value_.__left_;
          }
          if (v47 >= 0) {
            size_t v49 = v44;
          }
          else {
            size_t v49 = v45;
          }
          if (v48 >= v42) {
            size_t v50 = v42;
          }
          else {
            size_t v50 = v48;
          }
          int v51 = memcmp(v43, v49, v50);
          BOOL v52 = v42 < v48;
          if (v51) {
            BOOL v52 = v51 < 0;
          }
          if (!v52) {
            break;
          }
          unint64_t v38 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v39->__value_.__left_;
          uint64_t v40 = v39;
          if (!v39->__value_.__left_) {
            goto LABEL_90;
          }
        }
        unint64_t v38 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v39[1].__value_.__left_;
      }
      while (v38);
      uint64_t v40 = v39 + 1;
      *int v36 = 0;
      v36[1] = 0;
      v36[2] = v39;
      v39[1].__value_.__left_ = v36;
      BOOL v53 = *(void **)p_stateInputEspressoBuffersShape->__tree_.__begin_node_;
      if (!v53) {
        goto LABEL_92;
      }
LABEL_91:
      p_stateInputEspressoBuffersShape->__tree_.__begin_node_ = v53;
      int v36 = v40->__value_.__left_;
      goto LABEL_92;
    }
  }
}

- (OS_dispatch_queue)decoderQueue
{
  return self->_decoderQueue;
}

- (void)setDecoderQueue:(id)a3
{
}

- (CVNLPCaptionDecoderBlock)nextBlock
{
  return self->_nextBlock;
}

- (void)setNextBlock:(id)a3
{
}

- (NSString)metricString
{
  return self->_metricString;
}

- (void)setMetricString:(id)a3
{
}

- (NSString)metricCopyString
{
  return self->_metricCopyString;
}

- (void)setMetricCopyString:(id)a3
{
}

- (vector<std::string,)decoderInputNames
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<std::string, std::allocator<std::string>> *)sub_1B4BCA340((char *)retstr, (long long *)self->_decoderInputNames.__begin_, (long long *)self->_decoderInputNames.__end_, 0xAAAAAAAAAAAAAAABLL* (((char *)self->_decoderInputNames.__end_- (char *)self->_decoderInputNames.__begin_) >> 3));
}

- (void)setDecoderInputNames:()vector<std:(std::allocator<std::string>> *)a3 :string
{
  p_decoderInputNames = &self->_decoderInputNames;
  if (p_decoderInputNames != a3) {
    sub_1B4C1C2C0((uint64_t)p_decoderInputNames, (std::string *)a3->__begin_, (std::string *)a3->__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->__end_ - (char *)a3->__begin_) >> 3));
  }
}

- (void).cxx_destruct
{
  p_decoderInputNames = &self->_decoderInputNames;
  begin = (void **)self->_decoderInputNames.__begin_;
  if (begin)
  {
    end = (void **)self->_decoderInputNames.__end_;
    long long v6 = self->_decoderInputNames.__begin_;
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
      long long v6 = p_decoderInputNames->__begin_;
    }
    p_decoderInputNames->__end_ = begin;
    operator delete(v6);
  }
  sub_1B4C62544((char *)self->_stateInputEspressoBuffersShape.__tree_.__pair1_.__value_.__left_);
  sub_1B4C59808((uint64_t)&self->_stateInputEspressoBuffers, (char *)self->_stateInputEspressoBuffers.__tree_.__pair1_.__value_.__left_);
  sub_1B4C59808((uint64_t)&self->_stateOutputEspressoBuffers, (char *)self->_stateOutputEspressoBuffers.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_metricCopyString, 0);
  objc_storeStrong((id *)&self->_metricString, 0);
  objc_storeStrong((id *)&self->_nextBlock, 0);
  objc_storeStrong((id *)&self->_decoderQueue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 13) = (char *)self + 112;
  *((void *)self + 18) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 16) = (char *)self + 136;
  *((void *)self + 21) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 19) = (char *)self + 160;
  *((void *)self + 23) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 22) = 0;
  return self;
}

@end