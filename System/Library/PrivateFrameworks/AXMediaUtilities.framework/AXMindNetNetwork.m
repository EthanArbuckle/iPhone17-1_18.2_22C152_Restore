@interface AXMindNetNetwork
+ (id)networkWithModelPath:(id)a3 configuration:(id)a4 modelType:(int64_t)a5;
- (AXMindNetNetwork)initWithModelPath:(id)a3 configuration:(id)a4 modelType:(int64_t)a5;
- (NSArray)filterThresholds;
- (float)nmsThreshold;
- (float)threshold;
- (id).cxx_construct;
- (id)processCIImage:(id)a3;
- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4;
- (id)resizeAndProcessVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4;
- (int)version;
- (unint64_t)preferredSmallSide;
- (void)setNmsThreshold:(float)a3;
- (void)setThreshold:(float)a3;
- (void)setVersion:(int)a3;
@end

@implementation AXMindNetNetwork

- (unint64_t)preferredSmallSide
{
  return (unint64_t)self->_input_height;
}

+ (id)networkWithModelPath:(id)a3 configuration:(id)a4 modelType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)[objc_alloc((Class)a1) initWithModelPath:v8 configuration:v9 modelType:a5];

  return v10;
}

- (AXMindNetNetwork)initWithModelPath:(id)a3 configuration:(id)a4 modelType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v68.receiver = self;
  v68.super_class = (Class)AXMindNetNetwork;
  v10 = [(AXMindNetNetwork *)&v68 init];
  if (v10)
  {
    v11 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    id v67 = 0;
    v12 = [MEMORY[0x1E4F1E968] compileModelAtURL:v11 error:&v67];
    id v13 = v67;
    if (v13)
    {
      v14 = v13;
      v15 = 0;
    }
    else
    {
      v69 = 0;
      v70 = &v69;
      uint64_t v71 = 0x2050000000;
      v16 = (void **)getMLModelClass(void)::softClass;
      uint64_t v72 = getMLModelClass(void)::softClass;
      id v65 = v8;
      v62 = v12;
      v63 = v11;
      if (!getMLModelClass(void)::softClass)
      {
        *(void *)v73 = MEMORY[0x1E4F143A8];
        *(void *)&v73[8] = 3221225472;
        *(void *)&v73[16] = ___ZL15getMLModelClassv_block_invoke;
        v74 = (char *)&unk_1E6117478;
        p_unint64_t value = &v69;
        ___ZL15getMLModelClassv_block_invoke((uint64_t)v73);
        v16 = v70[3];
      }
      v17 = v16;
      _Block_object_dispose(&v69, 8);
      id v66 = 0;
      uint64_t v18 = [v17 modelWithContentsOfURL:v12 error:&v66];
      id v19 = v66;
      mindNetModel = v10->_mindNetModel;
      v10->_mindNetModel = (MLModel *)v18;

      v10->_modelType = a5;
      *(_WORD *)&v10->_keep_aspect_ratio = 257;
      v10->_input_height = 488.0;
      v21 = [v9 filterThresholds];
      id v64 = v19;
      v10->_num_pos_classes = [v21 count];

      v22 = [v9 nmsThreshold];
      [v22 floatValue];
      v10->_nmsThreshold = v23;

      uint64_t v24 = [v9 filterThresholds];
      filterThresholds = v10->_filterThresholds;
      v10->_filterThresholds = (NSArray *)v24;

      p_important_classes = &v10->_important_classes;
      begin = v10->_important_classes.__begin_;
      if (begin)
      {
        v10->_important_classes.__end_ = begin;
        operator delete(begin);
        p_important_classes->__begin_ = 0;
        v10->_important_classes.__end_ = 0;
        v10->_important_classes.__end_cap_.__value_ = 0;
      }
      p_important_classes->__begin_ = 0;
      v10->_important_classes.__end_ = 0;
      v10->_important_classes.__end_cap_.__value_ = 0;
      memset(v73, 0, sizeof(v73));
      p_model_labels = (int64x2_t *)&v10->_model_labels;
      std::vector<NSString * {__strong}>::__vdeallocate((void **)&v10->_model_labels.__begin_);
      v10->_model_labels.var1.__value_ = *(id **)&v73[16];
      *(_OWORD *)&v10->_model_labels.__begin_ = *(_OWORD *)v73;
      memset(v73, 0, sizeof(v73));
      v69 = (void **)v73;
      std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v69);
      unint64_t v29 = 0;
      while (1)
      {
        v30 = [v9 filterThresholds];
        unint64_t v31 = [v30 count];

        if (v31 <= v29) {
          break;
        }
        ++v29;
        end = v10->_important_classes.__end_;
        unint64_t value = (unint64_t)v10->_important_classes.__end_cap_.__value_;
        if ((unint64_t)end >= value)
        {
          v35 = p_important_classes->__begin_;
          uint64_t v36 = end - p_important_classes->__begin_;
          unint64_t v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62) {
            std::vector<BOOL>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v38 = value - (void)v35;
          if (v38 >> 1 > v37) {
            unint64_t v37 = v38 >> 1;
          }
          if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v39 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v39 = v37;
          }
          if (v39)
          {
            v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v10->_important_classes.__end_cap_, v39);
            v35 = v10->_important_classes.__begin_;
            end = v10->_important_classes.__end_;
          }
          else
          {
            v40 = 0;
          }
          v41 = (int *)&v40[4 * v36];
          int *v41 = v29;
          v34 = v41 + 1;
          while (end != v35)
          {
            int v42 = *--end;
            *--v41 = v42;
          }
          v10->_important_classes.__begin_ = v41;
          v10->_important_classes.__end_ = v34;
          v10->_important_classes.__end_cap_.__value_ = (int *)&v40[4 * v39];
          if (v35) {
            operator delete(v35);
          }
        }
        else
        {
          int *end = v29;
          v34 = end + 1;
        }
        v10->_important_classes.__end_ = v34;
        uint64_t v43 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v29);
        uint64_t v44 = v43;
        var0 = (uint64_t *)v10->_model_labels.var0;
        unint64_t v45 = (unint64_t)v10->_model_labels.var1.__value_;
        if ((unint64_t)var0 >= v45)
        {
          uint64_t v48 = ((uint64_t)var0 - p_model_labels->i64[0]) >> 3;
          if ((unint64_t)(v48 + 1) >> 61) {
            std::vector<BOOL>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v49 = v45 - p_model_labels->i64[0];
          uint64_t v50 = v49 >> 2;
          if (v49 >> 2 <= (unint64_t)(v48 + 1)) {
            uint64_t v50 = v48 + 1;
          }
          if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v51 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v51 = v50;
          }
          p_unint64_t value = &v10->_model_labels.var1.__value_;
          if (v51) {
            v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v10->_model_labels.var1, v51);
          }
          else {
            v52 = 0;
          }
          v53 = (uint64_t *)&v52[8 * v48];
          v54 = &v52[8 * v51];
          v74 = v54;
          uint64_t *v53 = v44;
          v47 = (__end_cap_ **)(v53 + 1);
          *(void *)&v73[16] = v53 + 1;
          v56 = v10->_model_labels.__begin_;
          v55 = v10->_model_labels.var0;
          if (v55 == v56)
          {
            int64x2_t v58 = vdupq_n_s64((unint64_t)v55);
          }
          else
          {
            do
            {
              uint64_t v57 = (uint64_t)*--v55;
              *v55 = 0;
              *--v53 = v57;
            }
            while (v55 != v56);
            int64x2_t v58 = *p_model_labels;
            v47 = *(__end_cap_ ***)&v73[16];
            v54 = v74;
          }
          v10->_model_labels.__begin_ = (__end_ **)v53;
          v10->_model_labels.var0 = v47;
          *(int64x2_t *)&v73[8] = v58;
          v59 = v10->_model_labels.var1.__value_;
          v10->_model_labels.var1.__value_ = (id *)v54;
          v74 = (char *)v59;
          *(void *)v73 = v58.i64[0];
          std::__split_buffer<NSString * {__strong}>::~__split_buffer((uint64_t)v73);
        }
        else
        {
          uint64_t *var0 = v43;
          v47 = (__end_cap_ **)(var0 + 1);
        }
        v10->_model_labels.var0 = v47;
      }
      v14 = v64;
      id v8 = v65;
      v12 = v62;
      v11 = v63;
      if (AXDeviceIsPad())
      {
        int v60 = 1065353216;
      }
      else if (v10->_modelType)
      {
        int v60 = 1056964608;
      }
      else
      {
        int v60 = 1055766235;
      }
      LODWORD(v10->_input_aspect_ratio) = v60;
      *(_WORD *)&v10->_keep_aspect_ratio = 0;
      *(int32x2_t *)&v10->_input_height = vdup_n_s32(0x44600000u);
      v10->_screenshot_height = 896.0;
      v15 = v10;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  v122[1] = *MEMORY[0x1E4F143B8];
  id v103 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v102 = [MEMORY[0x1E4F1C9C8] now];
  [(AXMindNetNetwork *)self threshold];
  if (v6 == 1.0)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1BA9A0B00](exception, "esp error");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  float width = (float)a3->width;
  data = a3->data;
  float height = (float)a3->height;
  float rowBytes = (float)a3->rowBytes;
  CVPixelBufferRef v118 = 0;
  CVPixelBufferCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (unint64_t)width, (unint64_t)height, 0x42475241u, data, (unint64_t)rowBytes, 0, 0, 0, &v118);
  if (v118)
  {
    v11 = [(MLModel *)self->_mindNetModel modelDescription];
    v12 = [v11 inputDescriptionsByName];
    id v13 = [v12 allKeys];
    v99 = [v13 objectAtIndexedSubscript:0];

    id v14 = objc_alloc(MEMORY[0x1E4F1E930]);
    v121 = v99;
    v15 = [MEMORY[0x1E4F1E950] featureValueWithPixelBuffer:v118];
    v122[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v122 forKeys:&v121 count:1];
    id v117 = 0;
    v100 = (void *)[v14 initWithDictionary:v16 error:&v117];
    id v17 = v117;

    mindNetModel = self->_mindNetModel;
    id v116 = v17;
    v98 = [(MLModel *)mindNetModel predictionFromFeatures:v100 error:&v116];
    id v101 = v116;

    if (v101)
    {
      id v19 = AXMediaLogElementVision();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[AXMindNetNetwork processVImage:inputIsBGR:]((uint64_t)v101, v19);
      }

      id v20 = v103;
    }
    else
    {
      id v106 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v22 = [v98 featureValueForName:@"decoded_1"];
      v97 = [v22 multiArrayValue];

      if (self->_modelType == 1)
      {
        [(AXMindNetNetwork *)self nmsThreshold];
        int v24 = v23;
        v25 = [(AXMindNetNetwork *)self filterThresholds];
        LODWORD(v26) = v24;
        v27 = +[AXBoundingBox postComputeClickabilityWithDecoded:v97 nmsThreshold:v25 filterThresholds:v26];

        long long v114 = 0u;
        long long v115 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        obuint64_t j = v27;
        uint64_t v28 = [obj countByEnumeratingWithState:&v112 objects:v120 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v113;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v113 != v29) {
                objc_enumerationMutation(obj);
              }
              unint64_t v31 = *(void **)(*((void *)&v112 + 1) + 8 * i);
              [v31 resultBox];
              if (CGRectGetWidth(v124) <= 0.9)
              {
                [v31 resultBox];
                if (CGRectGetHeight(v125) <= 0.9)
                {
                  v32 = [AXElementDetection alloc];
                  [v31 resultBox];
                  double v104 = v33;
                  double v35 = v34;
                  double v37 = v36;
                  double v39 = v38;
                  [v31 resultBox];
                  double v41 = v40;
                  double v43 = v42;
                  double v45 = v44;
                  double v47 = v46;
                  [v31 resultConfidence];
                  double v49 = v48;
                  begin = self->_important_classes.__begin_;
                  end = self->_important_classes.__end_;
                  uint64_t v52 = [v31 resultLabel];
                  v53 = [v31 resultLabelName];
                  float v54 = v49;
                  *(float *)&CFDictionaryRef pixelBufferAttributes = v54;
                  v55 = -[AXElementDetection initWithBox:defaultBox:confidence:scale:hasLabel:label:labelName:](v32, "initWithBox:defaultBox:confidence:scale:hasLabel:label:labelName:", 0, (unint64_t)((char *)end - (char *)begin) > 4, v52, v53, v104, v35, v37, v39, v41, v43, v45, v47, pixelBufferAttributes);

                  [v106 addObject:v55];
                }
              }
            }
            uint64_t v28 = [obj countByEnumeratingWithState:&v112 objects:v120 count:16];
          }
          while (v28);
        }
      }
      else
      {
        [(AXMindNetNetwork *)self nmsThreshold];
        int v57 = v56;
        int64x2_t v58 = [(AXMindNetNetwork *)self filterThresholds];
        LODWORD(v59) = v57;
        int v60 = +[AXBoundingBox postComputeWithDecoded:v97 nmsThreshold:v58 filterThresholds:v59];

        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        obuint64_t j = v60;
        uint64_t v61 = [obj countByEnumeratingWithState:&v108 objects:v119 count:16];
        if (v61)
        {
          uint64_t v62 = *(void *)v109;
          do
          {
            for (uint64_t j = 0; j != v61; ++j)
            {
              if (*(void *)v109 != v62) {
                objc_enumerationMutation(obj);
              }
              id v64 = *(void **)(*((void *)&v108 + 1) + 8 * j);
              id v65 = [AXElementDetection alloc];
              [v64 resultBox];
              double v107 = v66;
              double v68 = v67;
              double v70 = v69;
              double v72 = v71;
              [v64 resultBox];
              double v74 = v73;
              double v76 = v75;
              double v78 = v77;
              double v80 = v79;
              [v64 resultConfidence];
              double v82 = v81;
              v84 = self->_important_classes.__begin_;
              v83 = self->_important_classes.__end_;
              uint64_t v85 = [v64 resultLabel];
              v86 = [v64 resultLabelName];
              float v87 = v82;
              *(float *)&CFDictionaryRef pixelBufferAttributes = v87;
              v88 = -[AXElementDetection initWithBox:defaultBox:confidence:scale:hasLabel:label:labelName:](v65, "initWithBox:defaultBox:confidence:scale:hasLabel:label:labelName:", 0, (unint64_t)((char *)v83 - (char *)v84) > 4, v85, v86, v107, v68, v70, v72, v74, v76, v78, v80, pixelBufferAttributes);

              [v106 addObject:v88];
            }
            uint64_t v61 = [obj countByEnumeratingWithState:&v108 objects:v119 count:16];
          }
          while (v61);
        }
      }

      v89 = [MEMORY[0x1E4F1C9C8] now];
      [v89 timeIntervalSinceDate:v102];
      double v91 = v90;

      [v103 setValue:v106 forKey:@"boxes"];
      v92 = [NSNumber numberWithDouble:v91 * 1000.0];
      [v103 setValue:v92 forKey:@"timing"];

      id v93 = v103;
    }
  }
  else
  {
    id v21 = v103;
  }

  return v103;
}

- (id)resizeAndProcessVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  vImagePixelCount height = a3->height;
  vImagePixelCount width = a3->width;
  if (width) {
    BOOL v8 = height == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1BA9A0B00](exception, "Invalid input");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  BOOL v9 = a4;
  v5.n128_f32[0] = (float)width;
  v4.n128_f32[0] = (float)height;
  if (self->_can_rotate && v4.n128_f32[0] > v5.n128_f32[0])
  {
    LODWORD(backColor.data) = 0;
    if (MEMORY[0x1BA9A1800](&dest, v5.n128_f32[0], v4.n128_f32[0], 32, 0))
    {
      double v66 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1BA9A0B00](v66, "Intermediate buffer allocation failed");
      __cxa_throw(v66, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    vImageRotate90_ARGB8888(a3, &dest, 1u, (const uint8_t *)&backColor, 0);
    v5.n128_f32[0] = (float)dest.width;
    v4.n128_f32[0] = (float)dest.height;
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
    long long v13 = *(_OWORD *)&a3->width;
    *(_OWORD *)&dest.data = *(_OWORD *)&a3->data;
    *(_OWORD *)&dest.vImagePixelCount width = v13;
  }
  input_vImagePixelCount height = self->_input_height;
  float input_aspect_ratio = self->_input_aspect_ratio;
  unint64_t v16 = (unint64_t)(float)(input_height * input_aspect_ratio);
  unint64_t v17 = (unint64_t)input_height;
  unint64_t v18 = v16;
  unint64_t v19 = (unint64_t)input_height;
  if (self->_keep_aspect_ratio)
  {
    if ((float)(v5.n128_f32[0] / v4.n128_f32[0]) >= input_aspect_ratio)
    {
      v4.n128_f32[0] = (float)(v4.n128_f32[0] / v5.n128_f32[0]) * (float)v16;
      unint64_t v19 = (unint64_t)v4.n128_f32[0];
      unint64_t v18 = (unint64_t)(float)(input_height * input_aspect_ratio);
    }
    else
    {
      v4.n128_f32[0] = (float)(v5.n128_f32[0] / v4.n128_f32[0]) * (float)v17;
      unint64_t v18 = (unint64_t)v4.n128_f32[0];
      unint64_t v19 = (unint64_t)input_height;
    }
  }
  if (MEMORY[0x1BA9A1800](&backColor, v19, v18, 32, 0, v4, v5))
  {
    v63 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1BA9A0B00](v63, "Intermediate buffer allocation failed");
    __cxa_throw(v63, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  vImageScale_ARGB8888(&dest, &backColor, 0, 0x20u);
  if (MEMORY[0x1BA9A1800](&v75, v17, v16, 32, 0))
  {
    id v64 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1BA9A0B00](v64, "Intermediate buffer allocation failed");
    __cxa_throw(v64, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  *(_DWORD *)color = -16777216;
  if (vImageBufferFill_ARGB8888(&v75, color, 0))
  {
    id v65 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1BA9A0B00](v65, "esp error");
    __cxa_throw(v65, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (SLODWORD(backColor.height) >= 1)
  {
    uint64_t v20 = 0;
    do
    {
      memcpy((char *)v75.data + v75.rowBytes * v20, (char *)backColor.data + backColor.rowBytes * v20, 4 * backColor.width);
      ++v20;
    }
    while (v20 < SLODWORD(backColor.height));
  }
  if (v16 > 0x4000 || v17 > 0x4000)
  {
    id v67 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  else
  {
    vImage_Buffer v73 = v75;
    id v67 = [(AXMindNetNetwork *)self processVImage:&v73 inputIsBGR:v9];
    [v67 objectForKeyedSubscript:@"boxes"];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v70 != v22) {
            objc_enumerationMutation(obj);
          }
          int v24 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          [v24 box];
          double v26 = v25;
          double v28 = v27;
          double v30 = v29;
          double v32 = v31;
          vImagePixelCount v34 = v75.height;
          vImagePixelCount v33 = v75.width;
          vImagePixelCount v36 = backColor.height;
          vImagePixelCount v35 = backColor.width;
          int IsPad = AXDeviceIsPad();
          double v38 = (float)((float)v33 / (float)v35);
          double v39 = v26 * v38;
          double v40 = 1.0 - (1.0 - v28) * (float)v34 / (float)v36;
          double v41 = v30 * v38;
          double v42 = v32 * (float)((float)v34 / (float)v36);
          if (!IsPad) {
            goto LABEL_30;
          }
          screenshot_vImagePixelCount width = self->_screenshot_width;
          screenshot_vImagePixelCount height = self->_screenshot_height;
          double v45 = screenshot_height;
          double v46 = screenshot_width;
          if (screenshot_width < screenshot_height)
          {
            double v39 = (v39 + -0.5) * v45 / v46 + 0.5;
            double v41 = v41 * (float)(screenshot_height / screenshot_width);
LABEL_30:
            if (v12) {
              goto LABEL_31;
            }
            goto LABEL_33;
          }
          double v40 = (v40 + -0.5) * v46 / v45 + 0.5;
          double v42 = v42 * (float)(screenshot_width / screenshot_height);
          if (v12)
          {
LABEL_31:
            double v47 = 1.0 - (v41 + v39);
            double v48 = v42;
            goto LABEL_34;
          }
LABEL_33:
          double v48 = v41;
          double v41 = v42;
          double v47 = v40;
          double v40 = v39;
LABEL_34:
          objc_msgSend(v24, "setBox:", v40, v47, v48, v41);
          [v24 defaultBox];
          double v51 = v50;
          double v52 = (float)((float)v75.width / (float)backColor.width);
          double v54 = v53 * v52;
          double v55 = 1.0 - (1.0 - v49) * (float)v75.height / (float)backColor.height;
          double v57 = v56 * v52;
          double v58 = v51 * (float)((float)v75.height / (float)backColor.height);
          if (v12)
          {
            double v59 = 1.0 - (v54 + v57);
            double v60 = v58;
          }
          else
          {
            double v60 = v57;
            double v57 = v58;
            double v59 = 1.0 - (1.0 - v49) * (float)v75.height / (float)backColor.height;
            double v55 = v54;
          }
          objc_msgSend(v24, "setDefaultBox:", v55, v59, v60, v57);
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
      }
      while (v21);
    }

    free(v75.data);
    v75.data = 0;
    free(backColor.data);
    backColor.data = 0;
    if (v12)
    {
      free(dest.data);
      dest.data = 0;
    }
  }

  return v67;
}

- (id)processCIImage:(id)a3
{
  id v4 = a3;
  [v4 extent];
  float v7 = v6;
  if (v7 == 0.0 || (float v8 = v5, v8 == 0.0))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1BA9A0B00](exception, "esp error");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (!AXDeviceIsPad())
  {
    double v29 = v4;
    goto LABEL_23;
  }
  self->_screenshot_double width = v7;
  self->_screenshot_double height = v8;
  if (v8 <= v7) {
    float v9 = v7;
  }
  else {
    float v9 = v8;
  }
  uint64_t v44 = 0;
  double v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v10 = (void (*)(double, double))getUIGraphicsBeginImageContextSymbolLoc(void)::ptr;
  double v47 = getUIGraphicsBeginImageContextSymbolLoc(void)::ptr;
  if (!getUIGraphicsBeginImageContextSymbolLoc(void)::ptr)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    double v41 = ___ZL39getUIGraphicsBeginImageContextSymbolLocv_block_invoke;
    double v42 = &unk_1E6117478;
    double v43 = &v44;
    v11 = (void *)UIKitLibrary();
    v45[3] = (uint64_t)dlsym(v11, "UIGraphicsBeginImageContext");
    getUIGraphicsBeginImageContextSymbolLoc(void)::ptr = *(_UNKNOWN **)(v43[1] + 24);
    v10 = (void (*)(double, double))v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v10) {
    goto LABEL_28;
  }
  double v12 = v9;
  v10(v12, v12);
  uint64_t v44 = 0;
  double v45 = &v44;
  uint64_t v46 = 0x2020000000;
  long long v13 = (uint64_t (*)(void))getUIGraphicsGetCurrentContextSymbolLoc(void)::ptr;
  double v47 = getUIGraphicsGetCurrentContextSymbolLoc(void)::ptr;
  if (!getUIGraphicsGetCurrentContextSymbolLoc(void)::ptr)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    double v41 = ___ZL39getUIGraphicsGetCurrentContextSymbolLocv_block_invoke;
    double v42 = &unk_1E6117478;
    double v43 = &v44;
    id v14 = (void *)UIKitLibrary();
    v45[3] = (uint64_t)dlsym(v14, "UIGraphicsGetCurrentContext");
    getUIGraphicsGetCurrentContextSymbolLoc(void)::ptr = *(_UNKNOWN **)(v43[1] + 24);
    long long v13 = (uint64_t (*)(void))v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v13)
  {
LABEL_28:
    dlerror();
    id result = (id)abort_report_np();
LABEL_33:
    __break(1u);
    return result;
  }
  v15 = (CGContext *)v13();
  GenericRGB = CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0);
  CGContextSetFillColorWithColor(v15, GenericRGB);
  v49.origin.double x = 0.0;
  v49.origin.double y = 0.0;
  v49.size.double width = v12;
  v49.size.double height = v12;
  CGContextFillRect(v15, v49);
  CGColorRelease(GenericRGB);
  v50.origin.double x = 0.0;
  v50.origin.double y = 0.0;
  v50.size.double width = v12;
  v50.size.double height = v12;
  CGRect v51 = CGRectInset(v50, (v12 - v7) * 0.5, (v12 - v8) * 0.5);
  double x = v51.origin.x;
  double y = v51.origin.y;
  double width = v51.size.width;
  double height = v51.size.height;
  uint64_t v44 = 0;
  double v45 = &v44;
  uint64_t v46 = 0x2050000000;
  uint64_t v21 = (void *)getUIImageClass(void)::softClass;
  double v47 = (void *)getUIImageClass(void)::softClass;
  if (!getUIImageClass(void)::softClass)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    double v41 = ___ZL15getUIImageClassv_block_invoke;
    double v42 = &unk_1E6117478;
    double v43 = &v44;
    ___ZL15getUIImageClassv_block_invoke((uint64_t)&v39);
    uint64_t v21 = (void *)v45[3];
  }
  id v22 = v21;
  _Block_object_dispose(&v44, 8);
  int v23 = [v22 imageWithCIImage:v4];
  objc_msgSend(v23, "drawInRect:blendMode:alpha:", 0, x, y, width, height, 1.0);

  int v24 = (void *)MEMORY[0x1E4F1E050];
  uint64_t v44 = 0;
  double v45 = &v44;
  uint64_t v46 = 0x2020000000;
  double v25 = (void (*)(void))getUIGraphicsGetImageFromCurrentImageContextSymbolLoc(void)::ptr;
  double v47 = getUIGraphicsGetImageFromCurrentImageContextSymbolLoc(void)::ptr;
  if (!getUIGraphicsGetImageFromCurrentImageContextSymbolLoc(void)::ptr)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    double v41 = ___ZL53getUIGraphicsGetImageFromCurrentImageContextSymbolLocv_block_invoke;
    double v42 = &unk_1E6117478;
    double v43 = &v44;
    double v26 = (void *)UIKitLibrary();
    double v27 = dlsym(v26, "UIGraphicsGetImageFromCurrentImageContext");
    *(void *)(v43[1] + 24) = v27;
    getUIGraphicsGetImageFromCurrentImageContextSymbolLoc(void)::ptr = *(_UNKNOWN **)(v43[1] + 24);
    double v25 = (void (*)(void))v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v25) {
    goto LABEL_30;
  }
  v25();
  id v28 = objc_claimAutoreleasedReturnValue();
  double v29 = objc_msgSend(v24, "imageWithCGImage:", objc_msgSend(v28, "CGImage"));

  uint64_t v44 = 0;
  double v45 = &v44;
  uint64_t v46 = 0x2020000000;
  double v30 = (void (*)(void))getUIGraphicsEndImageContextSymbolLoc(void)::ptr;
  double v47 = getUIGraphicsEndImageContextSymbolLoc(void)::ptr;
  if (!getUIGraphicsEndImageContextSymbolLoc(void)::ptr)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    double v41 = ___ZL37getUIGraphicsEndImageContextSymbolLocv_block_invoke;
    double v42 = &unk_1E6117478;
    double v43 = &v44;
    double v31 = (void *)UIKitLibrary();
    double v32 = dlsym(v31, "UIGraphicsEndImageContext");
    *(void *)(v43[1] + 24) = v32;
    getUIGraphicsEndImageContextSymbolLoc(void)::ptr = *(_UNKNOWN **)(v43[1] + 24);
    double v30 = (void (*)(void))v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v30)
  {
LABEL_30:
    dlerror();
    id result = (id)abort_report_np();
    goto LABEL_33;
  }
  v30();
LABEL_23:
  vImagePixelCount v33 = +[AXMindNetHelpers createVImageBuffer:v29];
  long long v34 = *(_OWORD *)&v33->width;
  v38[0] = *(_OWORD *)&v33->data;
  v38[1] = v34;
  vImagePixelCount v35 = [(AXMindNetNetwork *)self resizeAndProcessVImage:v38 inputIsBGR:0];
  if (v33->data) {
    free(v33->data);
  }
  MEMORY[0x1BA9A0B70](v33, 0x1080C40ABB4582ELL);

  return v35;
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (float)nmsThreshold
{
  return self->_nmsThreshold;
}

- (void)setNmsThreshold:(float)a3
{
  self->_nmsThreshold = a3;
}

- (NSArray)filterThresholds
{
  return self->_filterThresholds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterThresholds, 0);
  objc_storeStrong((id *)&self->_filterThreshold, 0);
  p_model_labels = &self->_model_labels;
  std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_model_labels);
  begin = self->_important_classes.__begin_;
  if (begin)
  {
    self->_important_classes.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_mindNetModel, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

- (void)processVImage:(uint64_t)a1 inputIsBGR:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "MindNet Model Error %@", (uint8_t *)&v2, 0xCu);
}

@end