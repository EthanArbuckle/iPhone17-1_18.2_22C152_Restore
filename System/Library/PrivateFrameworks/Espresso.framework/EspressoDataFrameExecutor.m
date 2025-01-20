@interface EspressoDataFrameExecutor
- (BOOL)useCVPixelBuffers;
- (BOOL)useCVPixelBuffersForOutputs:(BOOL)a3;
- (NSArray)outputMatchingBuffers;
- (id).cxx_construct;
- (int)bindInput:(id)a3 fromImageAttachment:(id)a4 toNetwork:(id)a5;
- (int)bindInput:(id)a3 fromTensorAttachment:(id)a4 toNetwork:(id)a5;
- (int)bindInputsFromFrame:(id)a3 toNetwork:(id)a4;
- (int)bindOutputsFromFrame:(id)a3 toNetwork:(id)a4;
- (int)bindOutputsFromFrame:(id)a3 toNetwork:(id)a4 executionStatus:(int)a5;
- (int)bindOutputsFromFrame:(id)a3 toNetwork:(id)a4 referenceNetwork:(id)a5;
- (int)use_cvpixelbuffer;
- (void)dealloc;
- (void)freeTemporaryResources;
- (void)setOutputMatchingBuffers:(id)a3;
- (void)setUse_cvpixelbuffer:(int)a3;
@end

@implementation EspressoDataFrameExecutor

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputMatchingBuffers, 0);
  begin = self->pixelbuffers_to_release.__begin_;
  if (begin)
  {
    self->pixelbuffers_to_release.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->pointers_to_free.__begin_;
  if (v4)
  {
    self->pointers_to_free.__end_ = v4;
    operator delete(v4);
  }
}

- (void)setUse_cvpixelbuffer:(int)a3
{
  self->_use_cvpixelbuffer = a3;
}

- (int)use_cvpixelbuffer
{
  return self->_use_cvpixelbuffer;
}

- (void)setOutputMatchingBuffers:(id)a3
{
}

- (NSArray)outputMatchingBuffers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)dealloc
{
  [(EspressoDataFrameExecutor *)self freeTemporaryResources];
  v3.receiver = self;
  v3.super_class = (Class)EspressoDataFrameExecutor;
  [(EspressoDataFrameExecutor *)&v3 dealloc];
}

- (void)freeTemporaryResources
{
  objc_super v3 = (void *)MEMORY[0x192FF2020](self, a2);
  [(EspressoDataFrameExecutor *)self setOutputMatchingBuffers:0];
  begin = self->pointers_to_free.__begin_;
  end = self->pointers_to_free.__end_;
  if (begin != end)
  {
    do
    {
      v6 = *begin++;
      free(v6);
    }
    while (begin != end);
    begin = self->pointers_to_free.__begin_;
  }
  self->pointers_to_free.__end_ = begin;
  v7 = self->pixelbuffers_to_release.__begin_;
  v8 = self->pixelbuffers_to_release.__end_;
  if (v7 != v8)
  {
    do
    {
      v9 = *v7++;
      CVPixelBufferRelease(v9);
    }
    while (v7 != v8);
    v7 = self->pixelbuffers_to_release.__begin_;
  }
  self->pixelbuffers_to_release.__end_ = v7;
}

- (int)bindOutputsFromFrame:(id)a3 toNetwork:(id)a4 executionStatus:(int)a5
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v87 = v6;
  v7 = objc_opt_new();
  long long v125 = 0u;
  long long v124 = 0u;
  long long v123 = 0u;
  long long v122 = 0u;
  id obj = [v6 outputAttachmentNames];
  uint64_t v8 = [obj countByEnumeratingWithState:&v122 objects:v140 count:16];
  if (v8)
  {
    uint64_t v84 = *(void *)v123;
    p_pointers_to_free = &self->pointers_to_free;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v79 = *MEMORY[0x1E4F24D20];
LABEL_3:
    uint64_t v83 = v8;
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v123 != v84) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v122 + 1) + 8 * v9);
      v11 = [v6 getOutputAttachment:v10];
      if ([v11 disabled]) {
        goto LABEL_86;
      }
      if (a5)
      {
        *(_DWORD *)buf = 0;
        int is_dynamic = espresso_blob_is_dynamic((uint64_t)a4.var0, a4.var1, (char *)[v10 cStringUsingEncoding:1], buf);
        if (is_dynamic)
        {
          NSLog(&cfstr_UnableToPerfor_0.isa);
        }
        else
        {
          if (a5 == 2 && *(_DWORD *)buf)
          {
            int v13 = 0x40000;
            goto LABEL_12;
          }
          if (a5 != 1 || *(_DWORD *)buf) {
            goto LABEL_86;
          }
        }
      }
      else
      {
        int is_dynamic = 0;
      }
      int v13 = 0x10000;
LABEL_12:
      objc_opt_class();
      uint64_t isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        v70 = Espresso::espresso_os_log_subsystem((Espresso *)isKindOfClass, v15);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          v75 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v75;
          id v76 = v75;
          _os_log_error_impl(&dword_1920CB000, v70, OS_LOG_TYPE_ERROR, "Wrong type of attachment %@", buf, 0xCu);
        }
        if (!is_dynamic) {
          int is_dynamic = -1;
        }
        goto LABEL_112;
      }
      id v86 = v11;
      v16 = objc_opt_new();
      [v16 setName:v10];
      if (v86)
      {
        [v86 copyAsEspressoBuffer];
      }
      else
      {
        uint64_t v121 = 0;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
      }
      v109[8] = v119;
      v109[9] = v120;
      uint64_t v110 = v121;
      v109[4] = v115;
      v109[5] = v116;
      v109[6] = v117;
      v109[7] = v118;
      v109[0] = v111;
      v109[1] = v112;
      v109[2] = v113;
      v109[3] = v114;
      objc_msgSend(v16, "setReference_buffer:", v109);
      if (v16)
      {
        objc_msgSend(v16, "reference_buffer");
      }
      else
      {
        uint64_t v139 = 0;
        long long v138 = 0u;
        long long v137 = 0u;
        long long v136 = 0u;
        long long v135 = 0u;
        long long v134 = 0u;
        long long v133 = 0u;
        long long v132 = 0u;
        long long v131 = 0u;
        long long v130 = 0u;
        *(_OWORD *)buf = 0u;
      }
      end = self->pointers_to_free.__end_;
      value = self->pointers_to_free.__end_cap_.__value_;
      if (end >= value)
      {
        uint64_t v20 = end - p_pointers_to_free->__begin_;
        if ((unint64_t)(v20 + 1) >> 61) {
          std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v21 = (char *)value - (char *)p_pointers_to_free->__begin_;
        uint64_t v22 = v21 >> 2;
        if (v21 >> 2 <= (unint64_t)(v20 + 1)) {
          uint64_t v22 = v20 + 1;
        }
        if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v22;
        }
        if (v23) {
          unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v23);
        }
        else {
          uint64_t v24 = 0;
        }
        v25 = (void **)(v23 + 8 * v20);
        *v25 = *(void **)buf;
        v19 = v25 + 1;
        begin = self->pointers_to_free.__begin_;
        v26 = self->pointers_to_free.__end_;
        if (v26 != begin)
        {
          do
          {
            v28 = *--v26;
            *--v25 = v28;
          }
          while (v26 != begin);
          v26 = p_pointers_to_free->__begin_;
        }
        self->pointers_to_free.__begin_ = v25;
        self->pointers_to_free.__end_ = v19;
        self->pointers_to_free.__end_cap_.__value_ = (void **)(v23 + 8 * v24);
        if (v26) {
          operator delete(v26);
        }
      }
      else
      {
        *end = *(void **)buf;
        v19 = end + 1;
      }
      self->pointers_to_free.__end_ = v19;
      v29 = [v87 getGroundTruthAttachment:v10];
      v30 = v29;
      if (v29)
      {
        [v29 copyAsEspressoBuffer];
        v96[8] = v106;
        v96[9] = v107;
        uint64_t v97 = v108;
        v96[4] = v102;
        v96[5] = v103;
        v96[6] = v104;
        v96[7] = v105;
        v96[0] = v98;
        v96[1] = v99;
        v96[2] = v100;
        v96[3] = v101;
        objc_msgSend(v16, "setGroundtruth_buffer:", v96);
        if (v16)
        {
          objc_msgSend(v16, "groundtruth_buffer");
        }
        else
        {
          uint64_t v139 = 0;
          long long v138 = 0u;
          long long v137 = 0u;
          long long v136 = 0u;
          long long v135 = 0u;
          long long v134 = 0u;
          long long v133 = 0u;
          long long v132 = 0u;
          long long v131 = 0u;
          long long v130 = 0u;
          *(_OWORD *)buf = 0u;
        }
        v32 = self->pointers_to_free.__end_;
        v31 = self->pointers_to_free.__end_cap_.__value_;
        if (v32 >= v31)
        {
          uint64_t v34 = v32 - p_pointers_to_free->__begin_;
          if ((unint64_t)(v34 + 1) >> 61) {
            std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v35 = (char *)v31 - (char *)p_pointers_to_free->__begin_;
          uint64_t v36 = v35 >> 2;
          if (v35 >> 2 <= (unint64_t)(v34 + 1)) {
            uint64_t v36 = v34 + 1;
          }
          if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v37 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v37 = v36;
          }
          if (v37) {
            unint64_t v37 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v37);
          }
          else {
            uint64_t v38 = 0;
          }
          v39 = (void **)(v37 + 8 * v34);
          *v39 = *(void **)buf;
          v33 = v39 + 1;
          v41 = self->pointers_to_free.__begin_;
          v40 = self->pointers_to_free.__end_;
          if (v40 != v41)
          {
            do
            {
              v42 = *--v40;
              *--v39 = v42;
            }
            while (v40 != v41);
            v40 = p_pointers_to_free->__begin_;
          }
          self->pointers_to_free.__begin_ = v39;
          self->pointers_to_free.__end_ = v33;
          self->pointers_to_free.__end_cap_.__value_ = (void **)(v37 + 8 * v38);
          if (v40) {
            operator delete(v40);
          }
        }
        else
        {
          *v32 = *(void **)buf;
          v33 = v32 + 1;
        }
        self->pointers_to_free.__end_ = v33;
      }

      if ([(EspressoDataFrameExecutor *)self useCVPixelBuffersForOutputs:1])
      {
        id v43 = v10;
        blob_dimensions = (Espresso *)espresso_network_query_blob_dimensions((uint64_t *)a4.var0, *(uint64_t *)&a4.var1, [v43 UTF8String], (uint64_t)buf);
        if (blob_dimensions)
        {
          v72 = Espresso::espresso_os_log_subsystem(blob_dimensions, v45);
          if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
            goto LABEL_109;
          }
          LOWORD(pixelBufferOut[0]) = 0;
          v73 = "Could not get blob dimensions";
          goto LABEL_115;
        }
        if (v130 != __PAIR128__(1, 1))
        {
          v72 = Espresso::espresso_os_log_subsystem(blob_dimensions, v45);
          if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
            goto LABEL_109;
          }
          LOWORD(pixelBufferOut[0]) = 0;
          v73 = "Depth and Batch number must be 1";
LABEL_115:
          _os_log_error_impl(&dword_1920CB000, v72, OS_LOG_TYPE_ERROR, v73, (uint8_t *)pixelBufferOut, 2u);
          goto LABEL_109;
        }
        pixelBufferOut[0] = 0;
        uint64_t v127 = v79;
        uint64_t v128 = MEMORY[0x1E4F1CC08];
        CVPixelBufferCreate(allocator, *(size_t *)buf, *(size_t *)&buf[8], 0x4C303068u, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v128 forKeys:&v127 count:1], pixelBufferOut);
        v47 = self->pixelbuffers_to_release.__end_;
        v46 = self->pixelbuffers_to_release.__end_cap_.__value_;
        if (v47 >= v46)
        {
          v49 = self->pixelbuffers_to_release.__begin_;
          uint64_t v50 = v47 - v49;
          if ((unint64_t)(v50 + 1) >> 61) {
            std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v51 = (char *)v46 - (char *)v49;
          uint64_t v52 = v51 >> 2;
          if (v51 >> 2 <= (unint64_t)(v50 + 1)) {
            uint64_t v52 = v50 + 1;
          }
          if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v53 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v53 = v52;
          }
          if (v53) {
            unint64_t v53 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v53);
          }
          else {
            uint64_t v54 = 0;
          }
          v55 = (__CVBuffer **)(v53 + 8 * v50);
          *v55 = pixelBufferOut[0];
          v48 = v55 + 1;
          v57 = self->pixelbuffers_to_release.__begin_;
          v56 = self->pixelbuffers_to_release.__end_;
          if (v56 != v57)
          {
            do
            {
              v58 = *--v56;
              *--v55 = v58;
            }
            while (v56 != v57);
            v56 = self->pixelbuffers_to_release.__begin_;
          }
          self->pixelbuffers_to_release.__begin_ = v55;
          self->pixelbuffers_to_release.__end_ = v48;
          self->pixelbuffers_to_release.__end_cap_.__value_ = (__CVBuffer **)(v53 + 8 * v54);
          if (v56) {
            operator delete(v56);
          }
        }
        else
        {
          *v47 = pixelBufferOut[0];
          v48 = v47 + 1;
        }
        self->pixelbuffers_to_release.__end_ = v48;
        uint64_t v59 = [v43 UTF8String];
        uint64_t v60 = espresso_network_bind_direct_cvpixelbuffer((uint64_t *)a4.var0, *(uint64_t *)&a4.var1, v59, (uint64_t)pixelBufferOut[0]);
        int v61 = v60;
        NSLog(&cfstr_RetD.isa, v60);
        if (v61)
        {
          v72 = Espresso::espresso_os_log_subsystem(v62, v63);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v94 = 0;
            _os_log_error_impl(&dword_1920CB000, v72, OS_LOG_TYPE_ERROR, "Bind direct cvpixelbuffer failed", v94, 2u);
          }
LABEL_109:

          if (!is_dynamic) {
            int is_dynamic = -1;
          }
LABEL_111:

          v11 = v86;
LABEL_112:

          goto LABEL_113;
        }
        objc_msgSend(v16, "setComputed_pb:", pixelBufferOut[0]);
      }
      else
      {
        int is_dynamic = espresso_network_bind_buffer((uint64_t *)a4.var0, *(uint64_t *)&a4.var1, [v10 UTF8String], (uint64_t)buf, 0x20000, v13, 0x10000);
        v92[8] = v137;
        v92[9] = v138;
        uint64_t v93 = v139;
        v92[4] = v133;
        v92[5] = v134;
        v92[6] = v135;
        v92[7] = v136;
        v92[0] = *(_OWORD *)buf;
        v92[1] = v130;
        v92[2] = v131;
        v92[3] = v132;
        objc_msgSend(v16, "setComputed_buffer:", v92);
      }
      v64 = (Espresso *)[v7 addObject:v16];
      if (is_dynamic)
      {
        v71 = Espresso::espresso_os_log_subsystem(v64, v65);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          uint64_t v77 = [v10 UTF8String];
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v77;
          _os_log_error_impl(&dword_1920CB000, v71, OS_LOG_TYPE_ERROR, "Cannot bind output: %s", buf, 0xCu);
        }

        goto LABEL_111;
      }

LABEL_86:
      ++v9;
      id v6 = v87;
      if (v9 == v83)
      {
        uint64_t v8 = [obj countByEnumeratingWithState:&v122 objects:v140 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v66 = [(EspressoDataFrameExecutor *)self outputMatchingBuffers];
  uint64_t v67 = [v66 countByEnumeratingWithState:&v88 objects:v126 count:16];
  if (v67)
  {
    uint64_t v68 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v67; ++i)
      {
        if (*(void *)v89 != v68) {
          objc_enumerationMutation(v66);
        }
        [v7 addObject:*(void *)(*((void *)&v88 + 1) + 8 * i)];
      }
      uint64_t v67 = [v66 countByEnumeratingWithState:&v88 objects:v126 count:16];
    }
    while (v67);
  }

  [(EspressoDataFrameExecutor *)self setOutputMatchingBuffers:v7];
  int is_dynamic = 0;
LABEL_113:

  return is_dynamic;
}

- (int)bindOutputsFromFrame:(id)a3 toNetwork:(id)a4
{
  return -[EspressoDataFrameExecutor bindOutputsFromFrame:toNetwork:executionStatus:](self, "bindOutputsFromFrame:toNetwork:executionStatus:", a3, a4.var0, *(void *)&a4.var1, 0);
}

- (int)bindOutputsFromFrame:(id)a3 toNetwork:(id)a4 referenceNetwork:(id)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  v42 = objc_opt_new();
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v6 = [v44 outputAttachmentNames];
  id v43 = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v64 objects:v81 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v65;
    p_pointers_to_free = &self->pointers_to_free;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v65 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        v11 = objc_msgSend(v44, "getOutputAttachment:", v10, p_pointers_to_free);
        if (([v11 disabled] & 1) == 0)
        {
          objc_opt_class();
          uint64_t isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) == 0)
          {
            v14 = Espresso::espresso_os_log_subsystem((Espresso *)isKindOfClass, v13);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              uint64_t v36 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v36;
              id v37 = v36;
              _os_log_error_impl(&dword_1920CB000, v14, OS_LOG_TYPE_ERROR, "Wrong type of attachment %@", buf, 0xCu);
            }
            int v31 = -1;
            goto LABEL_40;
          }
          v14 = objc_opt_new();
          [v14 setName:v10];
          v15 = [v44 getGroundTruthAttachment:v10];
          v16 = v15;
          if (v15)
          {
            [v15 copyAsEspressoBuffer];
            v51[8] = v61;
            v51[9] = v62;
            uint64_t v52 = v63;
            v51[4] = v57;
            v51[5] = v58;
            v51[6] = v59;
            v51[7] = v60;
            v51[0] = v53;
            v51[1] = v54;
            v51[2] = v55;
            v51[3] = v56;
            [v14 setGroundtruth_buffer:v51];
            if (v14)
            {
              [v14 groundtruth_buffer];
            }
            else
            {
              uint64_t v80 = 0;
              long long v79 = 0u;
              long long v78 = 0u;
              long long v77 = 0u;
              long long v76 = 0u;
              long long v75 = 0u;
              long long v74 = 0u;
              long long v73 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              *(_OWORD *)buf = 0u;
            }
            end = self->pointers_to_free.__end_;
            value = self->pointers_to_free.__end_cap_.__value_;
            if (end >= value)
            {
              uint64_t v20 = end - p_pointers_to_free->__begin_;
              if ((unint64_t)(v20 + 1) >> 61) {
                std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v21 = (char *)value - (char *)p_pointers_to_free->__begin_;
              uint64_t v22 = v21 >> 2;
              if (v21 >> 2 <= (unint64_t)(v20 + 1)) {
                uint64_t v22 = v20 + 1;
              }
              if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v23 = v22;
              }
              if (v23) {
                unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v23);
              }
              else {
                uint64_t v24 = 0;
              }
              v25 = (void **)(v23 + 8 * v20);
              *v25 = *(void **)buf;
              v19 = v25 + 1;
              begin = self->pointers_to_free.__begin_;
              v26 = self->pointers_to_free.__end_;
              if (v26 != begin)
              {
                do
                {
                  v28 = *--v26;
                  *--v25 = v28;
                }
                while (v26 != begin);
                v26 = p_pointers_to_free->__begin_;
              }
              self->pointers_to_free.__begin_ = v25;
              self->pointers_to_free.__end_ = v19;
              self->pointers_to_free.__end_cap_.__value_ = (void **)(v23 + 8 * v24);
              if (v26) {
                operator delete(v26);
              }
            }
            else
            {
              *end = *(void **)buf;
              v19 = end + 1;
            }
            self->pointers_to_free.__end_ = v19;
          }

          id v29 = v10;
          espresso_network_bind_buffer((uint64_t *)a4.var0, *(uint64_t *)&a4.var1, [v29 UTF8String], (uint64_t)buf, 0x20000, 0x10000, 0x10000);
          v49[8] = v78;
          v49[9] = v79;
          uint64_t v50 = v80;
          v49[4] = v74;
          v49[5] = v75;
          v49[6] = v76;
          v49[7] = v77;
          v49[0] = *(_OWORD *)buf;
          v49[1] = v71;
          v49[2] = v72;
          v49[3] = v73;
          [v14 setComputed_buffer:v49];
          id v30 = v29;
          int v31 = espresso_network_bind_buffer((uint64_t *)a5.var0, *(uint64_t *)&a5.var1, [v30 UTF8String], (uint64_t)v47, 0x20000, 0x10000, 0x10000);
          v45[8] = v47[8];
          v45[9] = v47[9];
          uint64_t v46 = v48;
          v45[4] = v47[4];
          v45[5] = v47[5];
          v45[6] = v47[6];
          v45[7] = v47[7];
          v45[0] = v47[0];
          v45[1] = v47[1];
          v45[2] = v47[2];
          v45[3] = v47[3];
          [v14 setReference_buffer:v45];
          v32 = (Espresso *)[v42 addObject:v14];
          if (v31)
          {
            uint64_t v34 = Espresso::espresso_os_log_subsystem(v32, v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              uint64_t v38 = [v30 UTF8String];
              *(_DWORD *)uint64_t v68 = 136315138;
              uint64_t v69 = v38;
              _os_log_error_impl(&dword_1920CB000, v34, OS_LOG_TYPE_ERROR, "Cannot bind output: %s", v68, 0xCu);
            }

LABEL_40:
            goto LABEL_41;
          }
        }
        id v6 = v43;
      }
      uint64_t v7 = [v43 countByEnumeratingWithState:&v64 objects:v81 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  [(EspressoDataFrameExecutor *)self setOutputMatchingBuffers:v42];
  int v31 = 0;
LABEL_41:

  return v31;
}

- (int)bindInputsFromFrame:(id)a3 toNetwork:(id)a4
{
  uint64_t v152 = *(void *)&a4.var1;
  var0 = (uint64_t *)a4.var0;
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  id v6 = (Espresso *)a3;
  v154 = v6;
  *(_OWORD *)v162 = 0u;
  long long v163 = 0u;
  float v164 = 1.0;
  char v145 = 1;
  uint64_t v8 = 1;
  v149 = self;
  while (1)
  {
    uint64_t v9 = Espresso::espresso_os_log_subsystem(v6, v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 2;
      _os_log_debug_impl(&dword_1920CB000, v9, OS_LOG_TYPE_DEBUG, "bindInputsFromFrame try %zu/%zu\n", buf, 0x16u);
    }

    long long v160 = 0u;
    long long v161 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    v10 = [(Espresso *)v154 inputAttachmentNames];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v158 objects:v181 count:16];
    if (!v11) {
      goto LABEL_63;
    }
    uint64_t v151 = *(void *)v159;
    id obj = v10;
    while (2)
    {
      uint64_t v150 = v11;
      for (uint64_t i = 0; i != v150; ++i)
      {
        if (*(void *)v159 != v151) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v158 + 1) + 8 * i);
        v14 = [(Espresso *)v154 getInputAttachment:v13];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          uint64_t isKindOfClass = objc_opt_isKindOfClass();
          if (isKindOfClass)
          {
            v19 = (Espresso *)[(EspressoDataFrameExecutor *)self useCVPixelBuffers];
            if (!v19)
            {
              uint64_t v21 = v14;
              int v22 = -[EspressoDataFrameExecutor bindInput:fromTensorAttachment:toNetwork:](self, "bindInput:fromTensorAttachment:toNetwork:", v13, v21, var0, v152);
              int v16 = v22;
              if (!v22)
              {
LABEL_60:

                goto LABEL_61;
              }
              if (v22 == -7)
              {
                uint64_t v180 = 0;
                long long v178 = 0u;
                long long v179 = 0u;
                int32x4_t v176 = 0u;
                long long v177 = 0u;
                long long v174 = 0u;
                int32x4_t v175 = 0u;
                long long v172 = 0u;
                long long v173 = 0u;
                memset(buf, 0, sizeof(buf));
                if (v21)
                {
                  [v21 copyAsEspressoBuffer];
                  int32x4_t v146 = v176;
                  int32x4_t v147 = v175;
                  int v23 = v177;
                }
                else
                {
                  int v23 = 0;
                  int32x4_t v146 = 0uLL;
                  int32x4_t v147 = 0uLL;
                }
                std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v13 UTF8String]);
                unint64_t v24 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&__p);
                unint64_t v25 = v24;
                unint64_t v26 = (unint64_t)v162[1];
                if (v162[1])
                {
                  uint8x8_t v27 = (uint8x8_t)vcnt_s8((int8x8_t)v162[1]);
                  v27.i16[0] = vaddlv_u8(v27);
                  unint64_t v28 = v27.u32[0];
                  if (v27.u32[0] > 1uLL)
                  {
                    unint64_t v4 = v24;
                    if ((void *)v24 >= v162[1]) {
                      unint64_t v4 = v24 % (unint64_t)v162[1];
                    }
                  }
                  else
                  {
                    unint64_t v4 = ((unint64_t)v162[1] - 1) & v24;
                  }
                  id v29 = (void **)*((void *)v162[0] + v4);
                  if (v29)
                  {
                    id v30 = (char *)*v29;
                    if (*v29)
                    {
                      while (1)
                      {
                        unint64_t v31 = *((void *)v30 + 1);
                        if (v31 == v25)
                        {
                          if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v30 + 16, (unsigned __int8 *)&__p))
                          {
                            self = v149;
                            goto LABEL_58;
                          }
                        }
                        else
                        {
                          if (v28 > 1)
                          {
                            if (v31 >= v26) {
                              v31 %= v26;
                            }
                          }
                          else
                          {
                            v31 &= v26 - 1;
                          }
                          if (v31 != v4)
                          {
LABEL_35:
                            self = v149;
                            break;
                          }
                        }
                        id v30 = *(char **)v30;
                        if (!v30) {
                          goto LABEL_35;
                        }
                      }
                    }
                  }
                }
                id v30 = (char *)operator new(0x68uLL);
                v170.__begin_ = (std::vector<int>::pointer)v30;
                v170.__end_ = (std::vector<int>::pointer)&v163;
                *(void *)id v30 = 0;
                *((void *)v30 + 1) = v25;
                *(std::vector<int> *)(v30 + 16) = __p;
                memset(&__p, 0, sizeof(__p));
                *((_OWORD *)v30 + 4) = 0u;
                *((_OWORD *)v30 + 5) = 0u;
                *((void *)v30 + 12) = 0;
                *(_OWORD *)(v30 + 40) = xmmword_192DC3600;
                *((void *)v30 + 7) = 0xFFFFFFFF00000001;
                LOBYTE(v170.__end_cap_.__value_) = 1;
                float v32 = (float)(unint64_t)(*((void *)&v163 + 1) + 1);
                if (!v26 || (float)(v164 * (float)v26) < v32)
                {
                  BOOL v33 = (v26 & (v26 - 1)) != 0;
                  if (v26 < 3) {
                    BOOL v33 = 1;
                  }
                  unint64_t v34 = v33 | (2 * v26);
                  unint64_t v35 = vcvtps_u32_f32(v32 / v164);
                  if (v34 <= v35) {
                    size_t v36 = v35;
                  }
                  else {
                    size_t v36 = v34;
                  }
                  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__rehash<true>((uint64_t)v162, v36);
                  unint64_t v26 = (unint64_t)v162[1];
                  if (((unint64_t)v162[1] & ((unint64_t)v162[1] - 1)) != 0)
                  {
                    if ((void *)v25 >= v162[1]) {
                      unint64_t v4 = v25 % (unint64_t)v162[1];
                    }
                    else {
                      unint64_t v4 = v25;
                    }
                  }
                  else
                  {
                    unint64_t v4 = ((unint64_t)v162[1] - 1) & v25;
                  }
                }
                id v37 = v162[0];
                uint64_t v38 = (void *)*((void *)v162[0] + v4);
                if (v38)
                {
                  *(void *)id v30 = *v38;
                }
                else
                {
                  *(void *)id v30 = v163;
                  *(void *)&long long v163 = v30;
                  v37[v4] = &v163;
                  if (!*(void *)v30) {
                    goto LABEL_57;
                  }
                  unint64_t v39 = *(void *)(*(void *)v30 + 8);
                  if ((v26 & (v26 - 1)) != 0)
                  {
                    if (v39 >= v26) {
                      v39 %= v26;
                    }
                  }
                  else
                  {
                    v39 &= v26 - 1;
                  }
                  uint64_t v38 = (char *)v162[0] + 8 * v39;
                }
                *uint64_t v38 = v30;
LABEL_57:
                v170.__begin_ = 0;
                ++*((void *)&v163 + 1);
                std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,Espresso::layer_shape>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,Espresso::layer_shape>,void *>>>>::reset[abi:ne180100]((uint64_t)&v170);
LABEL_58:
                *(int32x4_t *)(v30 + 40) = vuzp1q_s32(v147, v146);
                *((_DWORD *)v30 + 14) = v23;
                *((_DWORD *)v30 + 15) = -1;
                *((void *)v30 + 8) = 0;
                *((void *)v30 + 9) = 0;
                std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>(v30 + 80, 0, 0, 0);
                if (SHIBYTE(__p.__end_cap_.__value_) < 0) {
                  operator delete(__p.__begin_);
                }
                goto LABEL_60;
              }
              v14 = v21;
LABEL_210:

              id v15 = v14;
LABEL_211:

              v129 = obj;
              goto LABEL_212;
            }
            uint64_t v21 = Espresso::espresso_os_log_subsystem(v19, v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1920CB000, v21, OS_LOG_TYPE_ERROR, "Direct binding of tensor attachments is not implemented", buf, 2u);
            }
          }
          else
          {
            uint64_t v21 = Espresso::espresso_os_log_subsystem((Espresso *)isKindOfClass, v18);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              uint64_t v127 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v127;
              id v128 = v127;
              _os_log_error_impl(&dword_1920CB000, v21, OS_LOG_TYPE_ERROR, "Wrong type of attachment %@", buf, 0xCu);
            }
          }
          int v16 = -1;
          goto LABEL_210;
        }
        id v15 = v14;
        int v16 = -[EspressoDataFrameExecutor bindInput:fromImageAttachment:toNetwork:](self, "bindInput:fromImageAttachment:toNetwork:", v13, v15, var0, v152);

        if (v16) {
          goto LABEL_211;
        }
LABEL_61:
      }
      v10 = obj;
      uint64_t v11 = [obj countByEnumeratingWithState:&v158 objects:v181 count:16];
      if (v11) {
        continue;
      }
      break;
    }
LABEL_63:

    if (!*((void *)&v163 + 1))
    {
      int v16 = 0;
      goto LABEL_213;
    }
    if ((v145 & 1) == 0)
    {
      long long v132 = Espresso::espresso_os_log_subsystem(v40, v41);
      if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1920CB000, v132, OS_LOG_TYPE_ERROR, "Cannot find inputs: ", buf, 2u);
      }

      long long v135 = (uint64_t *)v163;
      if ((void)v163)
      {
        int v16 = -7;
        do
        {
          long long v136 = Espresso::espresso_os_log_subsystem(v133, v134);
          if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
          {
            long long v137 = v135 + 2;
            if (*((char *)v135 + 39) < 0) {
              long long v137 = (void *)*v137;
            }
            int v138 = *((_DWORD *)v135 + 10);
            int v139 = *((_DWORD *)v135 + 11);
            int v140 = *((_DWORD *)v135 + 12);
            int v141 = *((_DWORD *)v135 + 13);
            int v142 = *((_DWORD *)v135 + 14);
            int v143 = *((_DWORD *)v135 + 15);
            *(_DWORD *)buf = 136316674;
            *(void *)&buf[4] = v137;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v138;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v139;
            *(_WORD *)&buf[24] = 1024;
            *(_DWORD *)&buf[26] = v140;
            *(_WORD *)&buf[30] = 1024;
            LODWORD(v172) = v141;
            WORD2(v172) = 1024;
            *(_DWORD *)((char *)&v172 + 6) = v142;
            WORD5(v172) = 1024;
            HIDWORD(v172) = v143;
            _os_log_error_impl(&dword_1920CB000, v136, OS_LOG_TYPE_ERROR, "%s (%d, %d, %d, %d, %d)[%d] ", buf, 0x30u);
          }

          long long v135 = (uint64_t *)*v135;
        }
        while (v135);
      }
      else
      {
        int v16 = -7;
      }
      goto LABEL_213;
    }
    v42 = (Espresso *)espresso_plan_build_clean(var0);
    if (v42) {
      break;
    }
    std::unordered_map<std::string,Espresso::layer_shape>::unordered_map((uint64_t)&v155, (uint64_t)v162);
    unint64_t v4 = v157;
    memset(buf, 0, 24);
    memset(&v170, 0, sizeof(v170));
    memset(&__p, 0, sizeof(__p));
    memset(&v168, 0, sizeof(v168));
    memset(&v167, 0, sizeof(v167));
    memset(&v166, 0, sizeof(v166));
    memset(&v165, 0, sizeof(v165));
    std::vector<int>::size_type v44 = (int)v157;
    if (v157 << 32)
    {
      if (((v157 << 32) & 0x8000000000000000) != 0) {
        std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
      }
      v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((int)v157);
      uint64_t v48 = *(char **)buf;
      v47 = *(char **)&buf[8];
      v49 = v45;
      if (*(void *)&buf[8] != *(void *)buf)
      {
        do
        {
          uint64_t v50 = *((void *)v47 - 1);
          v47 -= 8;
          *((void *)v49 - 1) = v50;
          v49 -= 8;
        }
        while (v47 != v48);
        v47 = *(char **)buf;
      }
      *(void *)buf = v49;
      *(void *)&buf[8] = v45;
      *(void *)&uint8_t buf[16] = &v45[8 * v46];
      if (v47) {
        operator delete(v47);
      }
    }
    std::vector<int>::reserve(&v170, v44);
    std::vector<int>::reserve(&__p, v44);
    std::vector<int>::reserve(&v168, v44);
    std::vector<int>::reserve(&v167, v44);
    std::vector<int>::reserve(&v166, v44);
    std::vector<int>::reserve(&v165, v44);
    for (j = v156; j; self = v149)
    {
      std::vector<int>::pointer end = v170.__end_;
      if (v170.__end_ >= v170.__end_cap_.__value_)
      {
        std::vector<int>::pointer begin = v170.__begin_;
        int64_t v55 = v170.__end_ - v170.__begin_;
        unint64_t v56 = v55 + 1;
        if ((unint64_t)(v55 + 1) >> 62) {
          goto LABEL_241;
        }
        int64_t v57 = (char *)v170.__end_cap_.__value_ - (char *)v170.__begin_;
        if (((char *)v170.__end_cap_.__value_ - (char *)v170.__begin_) >> 1 > v56) {
          unint64_t v56 = v57 >> 1;
        }
        BOOL v58 = (unint64_t)v57 >= 0x7FFFFFFFFFFFFFFCLL;
        unint64_t v59 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v58) {
          unint64_t v59 = v56;
        }
        if (v59)
        {
          unint64_t v59 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v59);
          std::vector<int>::pointer begin = v170.__begin_;
          std::vector<int>::pointer end = v170.__end_;
        }
        else
        {
          uint64_t v60 = 0;
        }
        long long v61 = (int *)(v59 + 4 * v55);
        *long long v61 = *((_DWORD *)j + 10);
        long long v53 = v61 + 1;
        while (end != begin)
        {
          int v62 = *--end;
          *--long long v61 = v62;
        }
        v170.__begin_ = v61;
        v170.__end_ = v53;
        v170.__end_cap_.__value_ = (int *)(v59 + 4 * v60);
        if (begin) {
          operator delete(begin);
        }
      }
      else
      {
        *v170.__end_ = *((_DWORD *)j + 10);
        long long v53 = end + 1;
      }
      v170.__end_ = v53;
      std::vector<int>::pointer v63 = __p.__end_;
      if (__p.__end_ >= __p.__end_cap_.__value_)
      {
        std::vector<int>::pointer v65 = __p.__begin_;
        int64_t v66 = __p.__end_ - __p.__begin_;
        unint64_t v67 = v66 + 1;
        if ((unint64_t)(v66 + 1) >> 62) {
          goto LABEL_241;
        }
        int64_t v68 = (char *)__p.__end_cap_.__value_ - (char *)__p.__begin_;
        if (((char *)__p.__end_cap_.__value_ - (char *)__p.__begin_) >> 1 > v67) {
          unint64_t v67 = v68 >> 1;
        }
        BOOL v58 = (unint64_t)v68 >= 0x7FFFFFFFFFFFFFFCLL;
        unint64_t v69 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v58) {
          unint64_t v69 = v67;
        }
        if (v69)
        {
          unint64_t v69 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v69);
          std::vector<int>::pointer v65 = __p.__begin_;
          std::vector<int>::pointer v63 = __p.__end_;
        }
        else
        {
          uint64_t v70 = 0;
        }
        long long v71 = (int *)(v69 + 4 * v66);
        int *v71 = *((_DWORD *)j + 11);
        long long v64 = v71 + 1;
        while (v63 != v65)
        {
          int v72 = *--v63;
          *--long long v71 = v72;
        }
        __p.__begin_ = v71;
        __p.__end_ = v64;
        __p.__end_cap_.__value_ = (int *)(v69 + 4 * v70);
        if (v65) {
          operator delete(v65);
        }
      }
      else
      {
        *__p.__end_ = *((_DWORD *)j + 11);
        long long v64 = v63 + 1;
      }
      __p.__end_ = v64;
      std::vector<int>::pointer v73 = v168.__end_;
      if (v168.__end_ >= v168.__end_cap_.__value_)
      {
        std::vector<int>::pointer v75 = v168.__begin_;
        int64_t v76 = v168.__end_ - v168.__begin_;
        unint64_t v77 = v76 + 1;
        if ((unint64_t)(v76 + 1) >> 62) {
          goto LABEL_241;
        }
        int64_t v78 = (char *)v168.__end_cap_.__value_ - (char *)v168.__begin_;
        if (((char *)v168.__end_cap_.__value_ - (char *)v168.__begin_) >> 1 > v77) {
          unint64_t v77 = v78 >> 1;
        }
        BOOL v58 = (unint64_t)v78 >= 0x7FFFFFFFFFFFFFFCLL;
        unint64_t v79 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v58) {
          unint64_t v79 = v77;
        }
        if (v79)
        {
          unint64_t v79 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v79);
          std::vector<int>::pointer v75 = v168.__begin_;
          std::vector<int>::pointer v73 = v168.__end_;
        }
        else
        {
          uint64_t v80 = 0;
        }
        v81 = (int *)(v79 + 4 * v76);
        int *v81 = *((_DWORD *)j + 12);
        long long v74 = v81 + 1;
        while (v73 != v75)
        {
          int v82 = *--v73;
          *--v81 = v82;
        }
        v168.__begin_ = v81;
        v168.__end_ = v74;
        v168.__end_cap_.__value_ = (int *)(v79 + 4 * v80);
        if (v75) {
          operator delete(v75);
        }
      }
      else
      {
        *v168.__end_ = *((_DWORD *)j + 12);
        long long v74 = v73 + 1;
      }
      v168.__end_ = v74;
      std::vector<int>::pointer v83 = v167.__end_;
      if (v167.__end_ >= v167.__end_cap_.__value_)
      {
        std::vector<int>::pointer v85 = v167.__begin_;
        int64_t v86 = v167.__end_ - v167.__begin_;
        unint64_t v87 = v86 + 1;
        if ((unint64_t)(v86 + 1) >> 62) {
          goto LABEL_241;
        }
        int64_t v88 = (char *)v167.__end_cap_.__value_ - (char *)v167.__begin_;
        if (((char *)v167.__end_cap_.__value_ - (char *)v167.__begin_) >> 1 > v87) {
          unint64_t v87 = v88 >> 1;
        }
        BOOL v58 = (unint64_t)v88 >= 0x7FFFFFFFFFFFFFFCLL;
        unint64_t v89 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v58) {
          unint64_t v89 = v87;
        }
        if (v89)
        {
          unint64_t v89 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v89);
          std::vector<int>::pointer v85 = v167.__begin_;
          std::vector<int>::pointer v83 = v167.__end_;
        }
        else
        {
          uint64_t v90 = 0;
        }
        long long v91 = (int *)(v89 + 4 * v86);
        *long long v91 = *((_DWORD *)j + 13);
        uint64_t v84 = v91 + 1;
        while (v83 != v85)
        {
          int v92 = *--v83;
          *--long long v91 = v92;
        }
        v167.__begin_ = v91;
        v167.__end_ = v84;
        v167.__end_cap_.__value_ = (int *)(v89 + 4 * v90);
        if (v85) {
          operator delete(v85);
        }
      }
      else
      {
        *v167.__end_ = *((_DWORD *)j + 13);
        uint64_t v84 = v83 + 1;
      }
      v167.__end_ = v84;
      std::vector<int>::pointer v93 = v166.__end_;
      if (v166.__end_ >= v166.__end_cap_.__value_)
      {
        std::vector<int>::pointer v95 = v166.__begin_;
        int64_t v96 = v166.__end_ - v166.__begin_;
        unint64_t v97 = v96 + 1;
        if ((unint64_t)(v96 + 1) >> 62) {
          goto LABEL_241;
        }
        int64_t v98 = (char *)v166.__end_cap_.__value_ - (char *)v166.__begin_;
        if (((char *)v166.__end_cap_.__value_ - (char *)v166.__begin_) >> 1 > v97) {
          unint64_t v97 = v98 >> 1;
        }
        BOOL v58 = (unint64_t)v98 >= 0x7FFFFFFFFFFFFFFCLL;
        unint64_t v99 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v58) {
          unint64_t v99 = v97;
        }
        if (v99)
        {
          unint64_t v99 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v99);
          std::vector<int>::pointer v95 = v166.__begin_;
          std::vector<int>::pointer v93 = v166.__end_;
        }
        else
        {
          uint64_t v100 = 0;
        }
        long long v101 = (int *)(v99 + 4 * v96);
        *long long v101 = *((_DWORD *)j + 14);
        v94 = v101 + 1;
        while (v93 != v95)
        {
          int v102 = *--v93;
          *--long long v101 = v102;
        }
        v166.__begin_ = v101;
        v166.__end_ = v94;
        v166.__end_cap_.__value_ = (int *)(v99 + 4 * v100);
        if (v95) {
          operator delete(v95);
        }
      }
      else
      {
        *v166.__end_ = *((_DWORD *)j + 14);
        v94 = v93 + 1;
      }
      v166.__end_ = v94;
      std::vector<int>::pointer v103 = v165.__end_;
      if (v165.__end_ >= v165.__end_cap_.__value_)
      {
        std::vector<int>::pointer v105 = v165.__begin_;
        int64_t v106 = v165.__end_ - v165.__begin_;
        unint64_t v107 = v106 + 1;
        if ((unint64_t)(v106 + 1) >> 62) {
LABEL_241:
        }
          std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
        int64_t v108 = (char *)v165.__end_cap_.__value_ - (char *)v165.__begin_;
        if (((char *)v165.__end_cap_.__value_ - (char *)v165.__begin_) >> 1 > v107) {
          unint64_t v107 = v108 >> 1;
        }
        BOOL v58 = (unint64_t)v108 >= 0x7FFFFFFFFFFFFFFCLL;
        unint64_t v109 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v58) {
          unint64_t v109 = v107;
        }
        if (v109)
        {
          unint64_t v109 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v109);
          std::vector<int>::pointer v105 = v165.__begin_;
          std::vector<int>::pointer v103 = v165.__end_;
        }
        else
        {
          uint64_t v110 = 0;
        }
        long long v111 = (int *)(v109 + 4 * v106);
        *long long v111 = *((_DWORD *)j + 15);
        long long v104 = v111 + 1;
        while (v103 != v105)
        {
          int v112 = *--v103;
          *--long long v111 = v112;
        }
        v165.__begin_ = v111;
        v165.__end_ = v104;
        v165.__end_cap_.__value_ = (int *)(v109 + 4 * v110);
        if (v105) {
          operator delete(v105);
        }
      }
      else
      {
        *v165.__end_ = *((_DWORD *)j + 15);
        long long v104 = v103 + 1;
      }
      long long v113 = j + 2;
      v165.__end_ = v104;
      if (*((char *)j + 39) < 0) {
        long long v113 = (void *)*v113;
      }
      uint64_t v114 = *(void *)&buf[8];
      if (*(void *)&buf[8] >= *(void *)&buf[16])
      {
        uint64_t v116 = (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3;
        if ((unint64_t)(v116 + 1) >> 61) {
          std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v117 = (uint64_t)(*(void *)&buf[16] - *(void *)buf) >> 2;
        if (v117 <= v116 + 1) {
          unint64_t v117 = v116 + 1;
        }
        if (*(void *)&buf[16] - *(void *)buf >= 0x7FFFFFFFFFFFFFF8uLL) {
          unint64_t v118 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v118 = v117;
        }
        if (v118) {
          unint64_t v118 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v118);
        }
        else {
          uint64_t v119 = 0;
        }
        long long v120 = (void *)(v118 + 8 * v116);
        *long long v120 = v113;
        long long v115 = v120 + 1;
        long long v122 = *(char **)buf;
        uint64_t v121 = *(char **)&buf[8];
        if (*(void *)&buf[8] != *(void *)buf)
        {
          do
          {
            uint64_t v123 = *((void *)v121 - 1);
            v121 -= 8;
            *--long long v120 = v123;
          }
          while (v121 != v122);
          uint64_t v121 = *(char **)buf;
        }
        *(void *)buf = v120;
        *(void *)&buf[8] = v115;
        *(void *)&uint8_t buf[16] = v118 + 8 * v119;
        if (v121) {
          operator delete(v121);
        }
      }
      else
      {
        **(void **)&buf[8] = v113;
        long long v115 = (void *)(v114 + 8);
      }
      *(void *)&buf[8] = v115;
      j = (void *)*j;
    }
    espresso_network_change_input_blob_shapes_seq_rank(var0, v152, v4, *(uint64_t *)buf, (uint64_t)v170.__begin_, (uint64_t)__p.__begin_, (uint64_t)v168.__begin_, (uint64_t)v167.__begin_, (uint64_t)v166.__begin_, (uint64_t)v165.__begin_);
    if (v165.__begin_)
    {
      v165.__end_ = v165.__begin_;
      operator delete(v165.__begin_);
    }
    if (v166.__begin_)
    {
      v166.__end_ = v166.__begin_;
      operator delete(v166.__begin_);
    }
    if (v167.__begin_)
    {
      v167.__end_ = v167.__begin_;
      operator delete(v167.__begin_);
    }
    if (v168.__begin_)
    {
      v168.__end_ = v168.__begin_;
      operator delete(v168.__begin_);
    }
    if (__p.__begin_)
    {
      __p.__end_ = __p.__begin_;
      operator delete(__p.__begin_);
    }
    if (v170.__begin_)
    {
      v170.__end_ = v170.__begin_;
      operator delete(v170.__begin_);
    }
    if (*(void *)buf)
    {
      *(void *)&buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
    }
    std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__deallocate_node(v156);
    long long v124 = v155;
    v155 = 0;
    if (v124) {
      operator delete(v124);
    }
    id v6 = (Espresso *)espresso_plan_build(var0);
    if (v6)
    {
      v129 = Espresso::espresso_os_log_subsystem(v6, v7);
      if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v144 = "Input reshape plan build failed";
LABEL_234:
        _os_log_error_impl(&dword_1920CB000, v129, OS_LOG_TYPE_ERROR, v144, buf, 2u);
      }
      goto LABEL_231;
    }
    char v145 = 0;
    uint64_t v8 = 2;
    if (*((void *)&v163 + 1))
    {
      std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__deallocate_node((void *)v163);
      *(void *)&long long v163 = 0;
      long long v125 = (char *)v162[1];
      if (v162[1])
      {
        v126 = 0;
        do
          *((void *)v162[0] + (void)v126++) = 0;
        while (v125 != v126);
      }
      char v145 = 0;
      *((void *)&v163 + 1) = 0;
      uint64_t v8 = 2;
    }
  }
  v129 = Espresso::espresso_os_log_subsystem(v42, v43);
  if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v144 = "Input reshape plan clean failed";
    goto LABEL_234;
  }
LABEL_231:
  int v16 = -1;
LABEL_212:

LABEL_213:
  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__deallocate_node((void *)v163);
  long long v130 = v162[0];
  v162[0] = 0;
  if (v130) {
    operator delete(v130);
  }

  return v16;
}

- (int)bindInput:(id)a3 fromTensorAttachment:(id)a4 toNetwork:(id)a5
{
  uint64_t v5 = *(void *)&a5.var1;
  var0 = (uint64_t *)a5.var0;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  uint64_t v56 = 0;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  memset(v53, 0, sizeof(v53));
  long long v50 = 0u;
  long long v51 = 0u;
  *(_OWORD *)__src = 0u;
  long long v49 = 0u;
  if (v10) {
    [v10 copyAsEspressoBuffer];
  }
  std::vector<int>::pointer end = self->pointers_to_free.__end_;
  value = self->pointers_to_free.__end_cap_.__value_;
  if (end >= value)
  {
    std::vector<int>::pointer begin = self->pointers_to_free.__begin_;
    uint64_t v16 = end - begin;
    if ((unint64_t)(v16 + 1) >> 61) {
      std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v17 = (char *)value - (char *)begin;
    uint64_t v18 = v17 >> 2;
    if (v17 >> 2 <= (unint64_t)(v16 + 1)) {
      uint64_t v18 = v16 + 1;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v19 = v18;
    }
    if (v19) {
      unint64_t v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v19);
    }
    else {
      uint64_t v20 = 0;
    }
    uint64_t v21 = (void **)(v19 + 8 * v16);
    int v22 = (void **)(v19 + 8 * v20);
    *uint64_t v21 = __src[0];
    v14 = v21 + 1;
    unint64_t v24 = self->pointers_to_free.__begin_;
    int v23 = self->pointers_to_free.__end_;
    if (v23 != v24)
    {
      do
      {
        unint64_t v25 = *--v23;
        *--uint64_t v21 = v25;
      }
      while (v23 != v24);
      int v23 = self->pointers_to_free.__begin_;
    }
    self->pointers_to_free.__begin_ = v21;
    self->pointers_to_free.__end_ = v14;
    self->pointers_to_free.__end_cap_.__value_ = v22;
    if (v23) {
      operator delete(v23);
    }
  }
  else
  {
    *std::vector<int>::pointer end = __src[0];
    v14 = end + 1;
  }
  self->pointers_to_free.__end_ = v14;
  id v26 = v9;
  if (espresso_network_bind_buffer(var0, v5, [v26 UTF8String], (uint64_t)__dst, 0x10000, 0x10000, 0x10000) == -6)
  {
    uint8x8_t v27 = (Espresso *)espresso_network_bind_buffer(var0, v5, [v26 UTF8String], (uint64_t)__src, 0x10000, 0x20000, 0x10000);
    int v29 = (int)v27;
    long long v45 = v54;
    long long v46 = v55;
    uint64_t v47 = v56;
    long long v43 = v52;
    *(_OWORD *)std::vector<int>::size_type v44 = v53[0];
    *(_OWORD *)&v44[16] = v53[1];
    *(_OWORD *)&v44[32] = v53[2];
    *(_OWORD *)__dst = *(_OWORD *)__src;
    long long v40 = v49;
    long long v41 = v50;
    long long v42 = v51;
    goto LABEL_21;
  }
  *(void *)int64_t v57 = 0;
  size = (Espresso *)espresso_buffer_get_size((uint64_t)__src, v57);
  if (size)
  {
    float v32 = Espresso::espresso_os_log_subsystem(size, v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1920CB000, v32, OS_LOG_TYPE_ERROR, "Cannot get buffer size", buf, 2u);
    }

LABEL_38:
    int v29 = -1;
    goto LABEL_40;
  }
  *(void *)buf = 0;
  uint8x8_t v27 = (Espresso *)espresso_buffer_get_size((uint64_t)__dst, (char *)buf);
  if (v27)
  {
    unint64_t v34 = Espresso::espresso_os_log_subsystem(v27, v28);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v37 = 0;
      _os_log_error_impl(&dword_1920CB000, v34, OS_LOG_TYPE_ERROR, "Cannot get copy size", v37, 2u);
    }

    goto LABEL_38;
  }
  if (*(void *)v57 == *(void *)buf)
  {
    uint8x8_t v27 = (Espresso *)memcpy(__dst[0], __src[0], *(size_t *)v57);
    int v29 = 0;
  }
  else
  {
    int v29 = -7;
  }
LABEL_21:
  if (v29 != -7)
  {
    if (v29)
    {
      BOOL v33 = Espresso::espresso_os_log_subsystem(v27, v28);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = [v26 UTF8String];
        *(_DWORD *)int64_t v57 = 136315138;
        *(void *)&v57[4] = v36;
        _os_log_error_impl(&dword_1920CB000, v33, OS_LOG_TYPE_ERROR, "Cannot bind input: %s", v57, 0xCu);
      }
    }
    else if (*(void *)v44 == *(void *)&v53[0] {
           && *(_OWORD *)&v44[8] == *(_OWORD *)((char *)v53 + 8)
    }
           && *(_OWORD *)&v44[24] == *(_OWORD *)((char *)&v53[1] + 8))
    {
      int v29 = 0;
    }
    else
    {
      int v29 = -7;
    }
  }
LABEL_40:

  return v29;
}

- (int)bindInput:(id)a3 fromImageAttachment:(id)a4 toNetwork:(id)a5
{
  uint64_t v5 = *(void *)&a5.var1;
  var0 = (uint64_t *)a5.var0;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  long long v62 = 0u;
  long long v63 = 0u;
  if (v10) {
    [v10 copyAsImageGrayscaleOrBGRA];
  }
  if (![(EspressoDataFrameExecutor *)self useCVPixelBuffers])
  {
    std::vector<int>::pointer end = self->pointers_to_free.__end_;
    value = self->pointers_to_free.__end_cap_.__value_;
    if (end >= value)
    {
      std::vector<int>::pointer begin = self->pointers_to_free.__begin_;
      uint64_t v25 = end - begin;
      if ((unint64_t)(v25 + 1) >> 61) {
        std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v26 = (char *)value - (char *)begin;
      uint64_t v27 = v26 >> 2;
      if (v26 >> 2 <= (unint64_t)(v25 + 1)) {
        uint64_t v27 = v25 + 1;
      }
      if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v28 = v27;
      }
      if (v28) {
        unint64_t v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v28);
      }
      else {
        uint64_t v29 = 0;
      }
      long long v42 = (void **)(v28 + 8 * v25);
      long long v43 = (void **)(v28 + 8 * v29);
      Espresso *v42 = (void *)v62;
      int v23 = v42 + 1;
      long long v45 = self->pointers_to_free.__begin_;
      std::vector<int>::size_type v44 = self->pointers_to_free.__end_;
      if (v44 != v45)
      {
        do
        {
          long long v46 = *--v44;
          *--long long v42 = v46;
        }
        while (v44 != v45);
        std::vector<int>::size_type v44 = self->pointers_to_free.__begin_;
      }
      self->pointers_to_free.__begin_ = v42;
      self->pointers_to_free.__end_ = v23;
      self->pointers_to_free.__end_cap_.__value_ = v43;
      if (v44) {
        operator delete(v44);
      }
    }
    else
    {
      *std::vector<int>::pointer end = (void *)v62;
      int v23 = end + 1;
    }
    self->pointers_to_free.__end_ = v23;
    uint64_t v47 = [v9 UTF8String];
    v58[0] = v62;
    v58[1] = v63;
    float v32 = (Espresso *)espresso_network_bind_input_vimagebuffer_bgra8(var0, v5, v47, 0, (uint64_t)v58, 0);
    int v35 = (int)v32;
    goto LABEL_41;
  }
  v12 = (void *)v62;
  if ([v11 nChannels] != 3)
  {
    int v13 = (Espresso *)[v11 nChannels];
    if (v13 != 4)
    {
      id v30 = Espresso::espresso_os_log_subsystem(v13, v14);
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      LOWORD(buf) = 0;
      unint64_t v31 = "Wrong number of channels in vImage";
LABEL_64:
      _os_log_error_impl(&dword_1920CB000, v30, OS_LOG_TYPE_ERROR, v31, (uint8_t *)&buf, 2u);
LABEL_22:

      char v34 = 0;
      int v35 = 0;
      if (!v12) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  v61[0] = v62;
  v61[1] = v63;
  id v15 = +[EspressoDataFrameImageAttachment createCVPixelBufferFromvImage:v61 withPixelFormat:1111970369];
  uint64_t v17 = (uint64_t)v15;
  if (!v15)
  {
    id v30 = Espresso::espresso_os_log_subsystem(0, v16);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    LOWORD(buf) = 0;
    unint64_t v31 = "Could not create pixelbuffer";
    goto LABEL_64;
  }
  unint64_t v19 = self->pixelbuffers_to_release.__end_;
  uint64_t v18 = self->pixelbuffers_to_release.__end_cap_.__value_;
  if (v19 >= v18)
  {
    uint64_t v36 = self->pixelbuffers_to_release.__begin_;
    uint64_t v37 = v19 - v36;
    if ((unint64_t)(v37 + 1) >> 61) {
      std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v38 = (char *)v18 - (char *)v36;
    uint64_t v39 = v38 >> 2;
    if (v38 >> 2 <= (unint64_t)(v37 + 1)) {
      uint64_t v39 = v37 + 1;
    }
    if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v40 = v39;
    }
    if (v40) {
      unint64_t v40 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v40);
    }
    else {
      uint64_t v41 = 0;
    }
    long long v50 = (__CVBuffer **)(v40 + 8 * v37);
    long long v51 = (__CVBuffer **)(v40 + 8 * v41);
    *long long v50 = (__CVBuffer *)v17;
    uint64_t v20 = v50 + 1;
    long long v53 = self->pixelbuffers_to_release.__begin_;
    long long v52 = self->pixelbuffers_to_release.__end_;
    if (v52 != v53)
    {
      do
      {
        long long v54 = *--v52;
        *--long long v50 = v54;
      }
      while (v52 != v53);
      long long v52 = self->pixelbuffers_to_release.__begin_;
    }
    self->pixelbuffers_to_release.__begin_ = v50;
    self->pixelbuffers_to_release.__end_ = v20;
    self->pixelbuffers_to_release.__end_cap_.__value_ = v51;
    if (v52) {
      operator delete(v52);
    }
  }
  else
  {
    Espresso *v19 = v15;
    uint64_t v20 = v19 + 1;
  }
  self->pixelbuffers_to_release.__end_ = v20;
  Espresso::get_internal_network((uint64_t)var0, v5, (uint64_t)&buf);
  if ((void)buf)
  {
    Espresso::get_internal_network((uint64_t)var0, v5, (uint64_t)&v59);
    BOOL v55 = (***(uint64_t (****)(void))(*(void *)(v59 + 16) + 8))() == 10006;
    if (v60) {
      nitro::nitro_function::nitro_function(v60);
    }
  }
  else
  {
    BOOL v55 = 0;
  }
  if (*((void *)&buf + 1)) {
    nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&buf + 1));
  }
  id v56 = v9;
  if (v55) {
    float v32 = (Espresso *)espresso_network_bind_direct_cvpixelbuffer(var0, v5, [v56 UTF8String], v17);
  }
  else {
    float v32 = (Espresso *)espresso_network_bind_cvpixelbuffer(var0, v5, [v56 UTF8String], 0, v17);
  }
  int v35 = (int)v32;
  char v34 = 1;
  if (v12) {
LABEL_23:
  }
    free(v12);
LABEL_24:
  if ((v34 & 1) == 0)
  {
    int v35 = -1;
    goto LABEL_45;
  }
LABEL_41:
  if (v35)
  {
    uint64_t v48 = Espresso::espresso_os_log_subsystem(v32, v33);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      uint64_t v57 = [v9 UTF8String];
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v57;
      _os_log_error_impl(&dword_1920CB000, v48, OS_LOG_TYPE_ERROR, "Cannot bind input image: %s", (uint8_t *)&buf, 0xCu);
    }
  }
LABEL_45:

  return v35;
}

- (BOOL)useCVPixelBuffers
{
  return [(EspressoDataFrameExecutor *)self useCVPixelBuffersForOutputs:0];
}

- (BOOL)useCVPixelBuffersForOutputs:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[EspressoDataFrameExecutor useCVPixelBuffersForOutputs:]::onceToken != -1) {
    dispatch_once(&-[EspressoDataFrameExecutor useCVPixelBuffersForOutputs:]::onceToken, &__block_literal_global_391);
  }
  if ((-[EspressoDataFrameExecutor useCVPixelBuffersForOutputs:]::ESPRESSO_DATAFRAME_USE_CVPIXELBUFFERS_set & 1) != 0
    || v3)
  {
    return -[EspressoDataFrameExecutor useCVPixelBuffersForOutputs:]::ESPRESSO_DATAFRAME_USE_CVPIXELBUFFERS;
  }
  else
  {
    return [(EspressoDataFrameExecutor *)self use_cvpixelbuffer] != 0;
  }
}

char *__57__EspressoDataFrameExecutor_useCVPixelBuffersForOutputs___block_invoke()
{
  result = getenv("ESPRESSO_DATAFRAME_USE_CVPIXELBUFFERS");
  if (result)
  {
    -[EspressoDataFrameExecutor useCVPixelBuffersForOutputs:]::ESPRESSO_DATAFRAME_USE_CVPIXELBUFFERS = 1;
    -[EspressoDataFrameExecutor useCVPixelBuffersForOutputs:]::ESPRESSO_DATAFRAME_USE_CVPIXELBUFFERS_set = 1;
  }
  return result;
}

@end