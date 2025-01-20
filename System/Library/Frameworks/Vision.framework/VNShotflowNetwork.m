@interface VNShotflowNetwork
+ (BOOL)hasFaceBodyAssociation;
+ (BOOL)hasPetFaces;
+ (BOOL)hasPose;
+ (BOOL)inputBGR;
+ (NSString)inputLayerName;
+ (const)defaultBoxesSides;
+ (const)strides;
+ (float)inputImageAspectRatio;
+ (float)inputImageMaxDimension;
+ (float)inputImageMinDimension;
+ (float)inputScale;
+ (float)nonSquareRollDefault;
+ (float)nonSquareYawDefault;
+ (id)processingDeviceDetectorWithEspressoNetwork:(id)a3 espressoPlan:(void *)a4 threshold:(float)a5;
+ (id)processingDeviceNetworkWithModelPath:(id)a3 threshold:(float)a4 preferredDeviceID:(int)a5 engineID:(int)a6 storageType:(int)a7;
+ (tuple<float,)inputBiasRGB;
+ (unint64_t)numberBinsRoll;
+ (unint64_t)numberBinsYaw;
- (VNShotflowNetwork)initWithEspressoNetwork:(id)a3 espressoPlan:(void *)a4 threshold:(float)a5;
- (VNShotflowNetwork)initWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 espressoStorageType:(int)a6 threshold:(float)a7;
- (float)threshold;
- (id).cxx_construct;
- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4;
- (id)resizeAndProcessVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4;
- (int)setInputShape:(unint64_t)a3 height:(unint64_t)a4;
- (unint64_t)preferredSmallSide;
- (void)dealloc;
- (void)initializeBuffers;
- (void)initializeEspressoResourcesWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 espressoStorageType:(int)a6;
- (void)runNetwork:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4;
- (void)setThreshold:(float)a3;
@end

@implementation VNShotflowNetwork

- (id).cxx_construct
{
  *((void *)self + 19) = 0;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

- (void).cxx_destruct
{
  p_yawOutputs = &self->_yawOutputs;
  std::vector<std::shared_ptr<rtcv::Logger::Target>>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_yawOutputs);
  p_yawOutputs = &self->_rollOutputs;
  std::vector<std::shared_ptr<rtcv::Logger::Target>>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_yawOutputs);
  p_yawOutputs = &self->_offsetsOutputs;
  std::vector<std::shared_ptr<rtcv::Logger::Target>>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_yawOutputs);
  p_yawOutputs = &self->_logitsNegOutputs;
  std::vector<std::shared_ptr<rtcv::Logger::Target>>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_yawOutputs);
  p_yawOutputs = &self->_logitsPosOutputs;
  std::vector<std::shared_ptr<rtcv::Logger::Target>>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_yawOutputs);
}

- (unint64_t)preferredSmallSide
{
  return self->_preferredSmallSide;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (float)threshold
{
  return self->_threshold;
}

- (id)resizeAndProcessVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  vImagePixelCount height = a3->height;
  vImagePixelCount width = a3->width;
  if (width) {
    BOOL v6 = height == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 6012;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  BOOL v7 = a4;
  float v10 = (float)width;
  float v11 = (float)height;
  if ((float)height <= (float)width)
  {
    long long v14 = *(_OWORD *)&a3->width;
    *(_OWORD *)&dest.data = *(_OWORD *)&a3->data;
    *(_OWORD *)&dest.vImagePixelCount width = v14;
    float v13 = (float)height;
    float v12 = (float)width;
  }
  else
  {
    LODWORD(backColor.data) = 0;
    if (MEMORY[0x1A6257F80](&dest, v10, v11, 32, 0))
    {
      v73 = __cxa_allocate_exception(8uLL);
      void *v73 = 6010;
      __cxa_throw(v73, MEMORY[0x1E4FBA3E0], 0);
    }
    vImageRotate90_ARGB8888(a3, &dest, 1u, (const uint8_t *)&backColor, 0);
    float v12 = (float)dest.width;
    float v13 = (float)dest.height;
  }
  v15 = objc_opt_class();
  [v15 inputImageMaxDimension];
  float v17 = v16;
  [v15 inputImageMinDimension];
  float v19 = v18;
  [v15 inputImageAspectRatio];
  unint64_t v21 = (unint64_t)v17;
  unint64_t v22 = (unint64_t)v19;
  if ((float)(v12 / v13) < v20) {
    unint64_t v23 = (unint64_t)(float)((float)(v12 / v13) * (float)(unint64_t)v19);
  }
  else {
    unint64_t v23 = (unint64_t)v17;
  }
  if ((float)(v12 / v13) < v20) {
    unint64_t v24 = (unint64_t)v19;
  }
  else {
    unint64_t v24 = (unint64_t)(float)((float)(v13 / v12) * (float)(unint64_t)v17);
  }
  [(id)objc_opt_class() inputImageSize];
  memset(&backColor, 0, sizeof(backColor));
  float v26 = (float)(unint64_t)v25;
  float v28 = (float)(unint64_t)v27;
  if (v12 == v26 && v13 == v28)
  {
    int v75 = 0;
    vImage_Buffer backColor = dest;
    memset(&v82, 0, sizeof(v82));
  }
  else
  {
    if (MEMORY[0x1A6257F80](&backColor, v24, v23, 32, 0))
    {
      v70 = __cxa_allocate_exception(8uLL);
      void *v70 = 6010;
      __cxa_throw(v70, MEMORY[0x1E4FBA3E0], 0);
    }
    vImageScale_ARGB8888(&dest, &backColor, 0, 0x20u);
    memset(&v82, 0, sizeof(v82));
    if (v12 != v26)
    {
      int v75 = 1;
      goto LABEL_25;
    }
    int v75 = 1;
  }
  if (v13 == v28)
  {
    int v74 = 0;
    vImage_Buffer v82 = backColor;
    goto LABEL_31;
  }
LABEL_25:
  if (MEMORY[0x1A6257F80](&v82, v22, v21, 32, 0))
  {
    v71 = __cxa_allocate_exception(8uLL);
    void *v71 = 6010;
    __cxa_throw(v71, MEMORY[0x1E4FBA3E0], 0);
  }
  *(_DWORD *)color = -16777216;
  if (vImageBufferFill_ARGB8888(&v82, color, 0))
  {
    v72 = __cxa_allocate_exception(8uLL);
    void *v72 = 6010;
    __cxa_throw(v72, MEMORY[0x1E4FBA3E0], 0);
  }
  if (SLODWORD(backColor.height) >= 1)
  {
    uint64_t v30 = 0;
    do
    {
      memcpy((char *)v82.data + v82.rowBytes * v30, (char *)backColor.data + backColor.rowBytes * v30, 4 * backColor.width);
      ++v30;
    }
    while (v30 < SLODWORD(backColor.height));
  }
  int v74 = 1;
LABEL_31:
  id v31 = (id)MEMORY[0x1E4F1CBF0];
  if (v21 <= 0x4000 && v22 <= 0x4000)
  {
    vImage_Buffer v80 = v82;
    [(VNShotflowNetwork *)self processVImage:&v80 inputIsBGR:v7];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = [v31 countByEnumeratingWithState:&v76 objects:v85 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v77 != v33) {
            objc_enumerationMutation(v31);
          }
          v35 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          [v35 box];
          double v36 = (double)v82.width / (double)backColor.width;
          double v38 = v37 * v36;
          double v40 = 1.0 - (1.0 - v39) * (double)v82.height / (double)backColor.height;
          double v42 = v41 * v36;
          double v44 = v43 * ((double)v82.height / (double)backColor.height);
          double v45 = 1.0 - (v38 + v42);
          if (v11 <= v10)
          {
            double v46 = v42;
          }
          else
          {
            double v38 = v40;
            double v40 = v45;
            double v46 = v44;
          }
          if (v11 > v10) {
            double v44 = v42;
          }
          objc_msgSend(v35, "setBox:", v38, v40, v46, v44);
          [v35 defaultBox];
          double v47 = (double)v82.width / (double)backColor.width;
          double v49 = v48 * v47;
          double v51 = 1.0 - (1.0 - v50) * (double)v82.height / (double)backColor.height;
          double v53 = v52 * v47;
          double v55 = v54 * ((double)v82.height / (double)backColor.height);
          double v56 = 1.0 - (v49 + v53);
          if (v11 <= v10)
          {
            double v57 = v53;
          }
          else
          {
            double v49 = v51;
            double v51 = v56;
            double v57 = v55;
          }
          if (v11 > v10) {
            double v55 = v53;
          }
          objc_msgSend(v35, "setDefaultBox:", v49, v51, v57, v55);
          if (v11 > v10 && [v15 hasPose])
          {
            [v35 rotationAngle];
            *(float *)&double v59 = fmodf((float)((float)(v58 + -90.0) + 180.0) + 360.0, 360.0) + -180.0;
            [v35 setRotationAngle:v59];
          }
          if ([v15 hasFaceBodyAssociation])
          {
            vImagePixelCount v60 = backColor.width;
            [v35 associatedX];
            double v62 = v61 / (double)v60;
            *(float *)&double v62 = v62;
            [v35 setAssociatedX:v62];
            [v35 associatedY];
            double v64 = 1.0 - v63 / (double)backColor.height;
            *(float *)&double v64 = v64;
            [v35 setAssociatedY:v64];
            if (v11 > v10)
            {
              [v35 associatedX];
              float v66 = v65;
              [v35 associatedY];
              objc_msgSend(v35, "setAssociatedX:");
              *(float *)&double v67 = 1.0 - v66;
              [v35 setAssociatedY:v67];
            }
          }
        }
        uint64_t v32 = [v31 countByEnumeratingWithState:&v76 objects:v85 count:16];
      }
      while (v32);
    }

    if (v74) {
      free(v82.data);
    }
    v82.data = 0;
    if (v75) {
      free(backColor.data);
    }
    backColor.data = 0;
    if (v11 > v10) {
      free(dest.data);
    }
    dest.data = 0;
  }

  return v31;
}

- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = self;
  vImagePixelCount height = a3->height;
  vImagePixelCount width = a3->width;
  if ([(VNShotflowNetwork *)self setInputShape:width height:height])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 6014;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  long long v9 = *(_OWORD *)&a3->width;
  v119[0] = *(_OWORD *)&a3->data;
  v119[1] = v9;
  [(VNShotflowNetwork *)v6 runNetwork:v119 inputIsBGR:v4];
  id v96 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(VNShotflowNetwork *)v6 threshold];
  float v114 = v10;
  if (v10 == 1.0)
  {
    int v75 = __cxa_allocate_exception(8uLL);
    *int v75 = 6012;
    __cxa_throw(v75, MEMORY[0x1E4FBA3E0], 0);
  }
  v108 = objc_opt_class();
  unint64_t v88 = [v108 numberMaxoutLayers];
  unint64_t v11 = 0;
  float v106 = (float)width;
  float v104 = (float)height;
  defaultBoxSizes = v6->_defaultBoxSizes;
  isAnchorSquare = v6->isAnchorSquare;
  long long v77 = v6;
  do
  {
    unint64_t v107 = v11;
    uint64_t v12 = 16 * v11;
    begin = (char *)v6->_rollOutputs.__begin_;
    if (v6->_rollOutputs.__end_ == begin) {
      long long v14 = 0;
    }
    else {
      long long v14 = *(void **)&begin[v12];
    }
    v15 = (char *)v6->_yawOutputs.__begin_;
    if (v6->_yawOutputs.__end_ == v15) {
      float v16 = 0;
    }
    else {
      float v16 = *(uint64_t **)&v15[v12];
    }
    float v17 = *(float ***)((char *)v6->_logitsPosOutputs.__begin_ + v12);
    float v18 = *v17;
    if (v107 >= v88)
    {
      float v20 = *v17;
      v18 += (uint64_t)v17[17];
      v105 = v17[17];
      v110 = v105;
      if (v14)
      {
LABEL_12:
        uint64_t v21 = *v14;
        goto LABEL_15;
      }
    }
    else
    {
      v110 = 0;
      float v19 = *(float ***)((char *)v6->_logitsNegOutputs.__begin_ + v12);
      float v20 = *v19;
      v105 = v19[17];
      if (v14) {
        goto LABEL_12;
      }
    }
    uint64_t v21 = 0;
LABEL_15:
    v112 = v14;
    if (v16) {
      uint64_t v22 = *v16;
    }
    else {
      uint64_t v22 = 0;
    }
    uint64_t v23 = *(void *)((char *)v6->_offsetsOutputs.__begin_ + v12);
    unint64_t v24 = *(float **)v23;
    v90 = v17[10];
    v83 = v17[11];
    uint64_t v25 = [v108 strides];
    memset(v118, 0, sizeof(v118));
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v118, *(const void **)v25, *(void *)(v25 + 8), (uint64_t)(*(void *)(v25 + 8) - *(void *)v25) >> 2);
    v102 = (void *)v118[0];
    float v87 = *(float *)(v118[0] + 4 * v107);
    float v82 = *(float *)(*(void *)[v108 cellStartsY] + 4 * v107);
    float v86 = *(float *)(*(void *)[v108 cellStartsX] + 4 * v107);
    float v26 = (uint64_t *)[v108 ratios];
    double v27 = v102;
    if (v112)
    {
      uint64_t v101 = v112[17];
      if (v16) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v101 = 0;
      if (v16)
      {
LABEL_20:
        uint64_t v98 = v16[17];
        goto LABEL_23;
      }
    }
    uint64_t v98 = 0;
LABEL_23:
    uint64_t v29 = *v26;
    uint64_t v28 = v26[1];
    uint64_t v100 = *(void *)(v23 + 136);
    uint64_t v99 = [v108 numberBinsRoll];
    uint64_t v97 = [v108 numberBinsYaw];
    uint64_t v89 = [v108 mumberBinsNegativeMaxout];
    uint64_t v85 = [v108 mumberPosClasses];
    int v109 = [v108 poseSquare];
    unint64_t v30 = v85 + 1;
    std::vector<float>::vector(v117, v85 + 1);
    if (v28 != v29)
    {
      uint64_t v95 = 0;
      unint64_t v31 = (v28 - v29) >> 2 << (v107 != 5);
      uint64_t v32 = v89 - 1;
      if (v107 >= v88) {
        uint64_t v32 = v85;
      }
      uint64_t v81 = v32 * (void)v105;
      uint64_t v80 = ((__PAIR128__(v85, v107) - v88) >> 64) * (void)v110;
      if (v31 <= 1) {
        unint64_t v31 = 1;
      }
      unint64_t v79 = v31;
      uint64_t v33 = 4 * (void)v110;
      while (1)
      {
        if (v83)
        {
          unint64_t v84 = 0;
          v103 = defaultBoxSizes[v107][v95];
          uint64_t v34 = v89;
          while (!v90)
          {
LABEL_77:
            if ((float *)++v84 == v83) {
              goto LABEL_78;
            }
          }
          unint64_t v93 = 0;
          while (2)
          {
            if (v107 >= v88)
            {
              float v35 = *v20;
            }
            else
            {
              float v35 = 1.1755e-38;
              if (v34)
              {
                double v36 = v20;
                uint64_t v37 = v34;
                do
                {
                  float v35 = fmaxf(v35, *v36);
                  v36 += (uint64_t)v105;
                  --v37;
                }
                while (v37);
              }
            }
            double v38 = (float *)v117[0];
            *(float *)v117[0] = v35;
            if (v30 >= 2)
            {
              double v39 = v38 + 1;
              double v40 = v18;
              uint64_t v41 = v85;
              do
              {
                float v35 = fmaxf(v35, *v40);
                *v39++ = *(_DWORD *)v40;
                double v40 = (float *)((char *)v40 + v33);
                --v41;
              }
              while (v41);
            }
            v92 = v20;
            float v42 = 0.0;
            if (v30)
            {
              unint64_t v43 = v30;
              do
              {
                float v44 = expf(*v38 - v35);
                *v38++ = v44;
                float v42 = v42 + v44;
                --v43;
              }
              while (v43);
            }
            uint64_t v45 = [v108 importantClasses];
            v91 = v18;
            double v47 = *(uint64_t **)v45;
            double v46 = *(uint64_t **)(v45 + 8);
            if (*(uint64_t **)v45 != v46)
            {
              do
              {
                uint64_t v48 = *v47;
                float v49 = *(float *)((char *)v117[0] + (*v47 << 32 >> 30)) / v42;
                if (v49 > v114)
                {
                  float v111 = *v103;
                  float v50 = v103[1];
                  float v113 = v24[v100];
                  float v51 = v24[2 * v100];
                  float v52 = v24[3 * v100];
                  float v53 = *v24;
                  aBlock[0] = MEMORY[0x1E4F143A8];
                  aBlock[1] = 3221225472;
                  aBlock[2] = __46__VNShotflowNetwork_processVImage_inputIsBGR___block_invoke;
                  aBlock[3] = &__block_descriptor_56_e5_f8__0l;
                  aBlock[4] = v99;
                  aBlock[5] = v21;
                  aBlock[6] = v101;
                  double v54 = _Block_copy(aBlock);
                  double v55 = v54;
                  float v56 = 0.0;
                  float v57 = 0.0;
                  if (v21)
                  {
                    if (v109 && !isAnchorSquare[v95]) {
                      [v108 nonSquareRollDefault];
                    }
                    else {
                      float v58 = (*((float (**)(void *))v54 + 2))(v54);
                    }
                    float v57 = v58;
                  }
                  v115[0] = MEMORY[0x1E4F143A8];
                  v115[1] = 3221225472;
                  v115[2] = __46__VNShotflowNetwork_processVImage_inputIsBGR___block_invoke_2;
                  v115[3] = &__block_descriptor_56_e5_f8__0l;
                  v115[4] = v97;
                  v115[5] = v22;
                  v115[6] = v98;
                  double v59 = _Block_copy(v115);
                  vImagePixelCount v60 = v59;
                  if (v22)
                  {
                    if (v109 && !isAnchorSquare[v95]) {
                      [v108 nonSquareYawDefault];
                    }
                    else {
                      float v61 = (*((float (**)(void *))v59 + 2))(v59);
                    }
                    float v56 = v61;
                  }
                  float v62 = expf(v51);
                  float v63 = expf(v52);
                  double v64 = [VNShotflowDetection alloc];
                  float v65 = (void *)[v108 importantClasses];
                  *(float *)&uint64_t v76 = v56;
                  float v66 = -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:hasLabel:label:](v64, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:hasLabel:label:", v107, v65[1] - *v65 > 8uLL, v48, (float)((float)((float)(v86 + (float)((float)v93 * v87)) / v106)+ (float)(v53 * (float)(v111 / v106)))- (float)((float)(v111 / v106) * v62) * 0.5, 1.0- (float)((float)((float)(v82 + (float)((float)v84 * v87)) / v104)+ (float)(v113 * (float)(v50 / v104)))- (float)((float)(v50 / v104) * v63) * 0.5, __PAIR64__(LODWORD(v57), LODWORD(v49)), v76);
                  [v96 addObject:v66];

                  double v27 = v102;
                }
                ++v47;
              }
              while (v47 != v46);
            }
            if (!v21)
            {
              double v67 = v92;
              uint64_t v34 = v89;
              unint64_t v30 = v85 + 1;
              if (!v22) {
                goto LABEL_76;
              }
              goto LABEL_68;
            }
            double v67 = v92;
            uint64_t v34 = v89;
            unint64_t v30 = v85 + 1;
            if (!v109 || isAnchorSquare[v95])
            {
              v21 += 4;
              if (!v22) {
                goto LABEL_76;
              }
LABEL_68:
              if (v109)
              {
                BOOL v68 = isAnchorSquare[v95];
LABEL_72:
                BOOL v69 = !v68;
                char v70 = v109;
                if (!v69) {
                  char v70 = 0;
                }
                if (v70)
                {
LABEL_76:
                  float v18 = v91 + 1;
                  float v20 = v67 + 1;
                  ++v24;
                  if ((float *)++v93 == v90) {
                    goto LABEL_77;
                  }
                  continue;
                }
              }
              v22 += 4;
              goto LABEL_76;
            }
            break;
          }
          if (!v22) {
            goto LABEL_76;
          }
          BOOL v68 = 0;
          goto LABEL_72;
        }
LABEL_78:
        if (!v21) {
          goto LABEL_82;
        }
        if (!v109 || isAnchorSquare[v95]) {
          break;
        }
        if (v22)
        {
          BOOL v71 = 0;
          goto LABEL_87;
        }
LABEL_91:
        v20 += v81;
        v18 += v80;
        v24 += 3 * v100;
        if (++v95 == v79) {
          goto LABEL_92;
        }
      }
      v21 += 4 * (v99 - 1) * v101;
LABEL_82:
      if (v22)
      {
        if (v109)
        {
          BOOL v71 = isAnchorSquare[v95];
LABEL_87:
          BOOL v69 = !v71;
          char v72 = v109;
          if (!v69) {
            char v72 = 0;
          }
          if (v72) {
            goto LABEL_91;
          }
        }
        v22 += 4 * (v97 - 1) * v98;
        goto LABEL_91;
      }
      goto LABEL_91;
    }
LABEL_92:
    if (v117[0])
    {
      v117[1] = v117[0];
      operator delete(v117[0]);
    }
    BOOL v6 = v77;
    if (v27) {
      operator delete(v27);
    }
    unint64_t v11 = v107 + 1;
  }
  while (v107 != 5);

  return v96;
}

float __46__VNShotflowNetwork_processVImage_inputIsBGR___block_invoke(void *a1)
{
  unint64_t v1 = a1[4];
  if (v1)
  {
    unint64_t v2 = 0;
    v3 = (float *)a1[5];
    unint64_t v4 = -1;
    float v5 = 1.1755e-38;
    do
    {
      if (*v3 > v5)
      {
        float v5 = *v3;
        unint64_t v4 = v2;
      }
      ++v2;
      v3 += a1[6];
    }
    while (v1 != v2);
    float v6 = (float)v4;
  }
  else
  {
    float v6 = 1.8447e19;
  }
  return (float)((float)(360.0 / (float)v1) * v6) + -180.0;
}

float __46__VNShotflowNetwork_processVImage_inputIsBGR___block_invoke_2(void *a1)
{
  unint64_t v1 = a1[4];
  if (v1)
  {
    unint64_t v2 = 0;
    v3 = (float *)a1[5];
    unint64_t v4 = -1;
    float v5 = 1.1755e-38;
    do
    {
      if (*v3 > v5)
      {
        float v5 = *v3;
        unint64_t v4 = v2;
      }
      ++v2;
      v3 += a1[6];
    }
    while (v1 != v2);
    float v6 = (float)v4;
  }
  else
  {
    float v6 = 1.8447e19;
  }
  return (float)((float)(225.0 / (float)v1) * v6) + -90.0;
}

- (void)runNetwork:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  unint64_t v4 = objc_opt_class();
  [v4 inputBiasRGB];
  [v4 inputScale];
  [v4 inputBGR];
  id v5 = [v4 inputLayerName];
  [v5 UTF8String];
  int v6 = espresso_network_bind_input_vimagebuffer_bgra8();

  if (v6 || espresso_plan_execute_sync())
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 6014;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
}

- (int)setInputShape:(unint64_t)a3 height:(unint64_t)a4
{
  int v4 = a4;
  int v5 = a3;
  if (*(_OWORD *)&self->_currentNetworkWidth == __PAIR128__(a4, a3)) {
    return 0;
  }
  v8 = objc_opt_class();
  id v9 = [v8 inputLayerName];
  [v9 UTF8String];

  [(id)objc_opt_class() inputImageSize];
  if (v4 != (unint64_t)v11 || v5 != (unint64_t)v10)
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 6005;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  int v7 = espresso_plan_build_clean();
  if (!v7)
  {
    int v7 = espresso_network_change_input_blob_shapes();
    if (!v7)
    {
      int v7 = espresso_plan_build();
      if (!v7)
      {
        unint64_t v21 = [v8 numberMaxoutLayers];
        uint64_t v12 = 0;
        unint64_t v13 = 0;
        while (1)
        {
          if (v13 >= v21)
          {
            id v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"logits_%ld", v13);
            [v14 UTF8String];
            int v16 = espresso_network_bind_buffer();
          }
          else
          {
            id v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"logits_pos_%ld", v13);
            [v14 UTF8String];
            int v7 = espresso_network_bind_buffer();
            if (v7) {
              break;
            }
            v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"logits_neg_%ld", v13);

            id v14 = v15;
            [v14 UTF8String];
            int v16 = espresso_network_bind_buffer();
          }
          int v7 = v16;
          if (v16) {
            break;
          }
          float v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"offsets_%ld", v13);

          id v18 = v17;
          [v18 UTF8String];
          int v7 = espresso_network_bind_buffer();

          if (v7) {
            return v7;
          }
          ++v13;
          v12 += 16;
          if (v13 == 6)
          {
            int v7 = 0;
            self->_currentNetworkWidth = v5;
            self->_currentNetworkHeight = v4;
            return v7;
          }
        }
      }
    }
  }
  return v7;
}

- (void)initializeBuffers
{
  v3 = objc_opt_class();
  *(void *)&long long v51 = 0;
  std::vector<unsigned long>::vector(v54, 4uLL, &v51);
  double v47 = v3;
  uint64_t v48 = self;
  id v4 = [v3 inputLayerName];
  [v4 UTF8String];
  int blob_dimensions = espresso_network_query_blob_dimensions();

  if (blob_dimensions)
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 6014;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  unint64_t v46 = [v47 numberMaxoutLayers];
  unint64_t v6 = 0;
  p_offsetsOutputs = &self->_offsetsOutputs;
  p_logitsPosOutputs = &self->_logitsPosOutputs;
  uint64_t v41 = &self->isAnchorSquare[5];
  p_logitsNegOutputs = &self->_logitsNegOutputs;
  unint64_t v43 = &self->isAnchorSquare[1];
  defaultBoxSizes = self->_defaultBoxSizes;
  v8 = &self->_defaultBoxSizes[0][0][1];
  do
  {
    if (v6 >= v46)
    {
      v15 = (char *)operator new(0xC0uLL);
      *((void *)v15 + 1) = 0;
      *((void *)v15 + 2) = 0;
      *(void *)v15 = &unk_1EF753380;
      *(_OWORD *)(v15 + 24) = 0u;
      *(_OWORD *)(v15 + 40) = 0u;
      *(_OWORD *)(v15 + 56) = 0u;
      *(_OWORD *)(v15 + 72) = 0u;
      *(_OWORD *)(v15 + 88) = 0u;
      *(_OWORD *)(v15 + 104) = 0u;
      *(_OWORD *)(v15 + 120) = 0u;
      *(_OWORD *)(v15 + 136) = 0u;
      *(_OWORD *)(v15 + 152) = 0u;
      *(_OWORD *)(v15 + 168) = 0u;
      *((void *)v15 + 23) = 0;
      *(void *)&long long v51 = v15 + 24;
      *((void *)&v51 + 1) = v15;
      id v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"logits_%ld", v6);
      [v13 UTF8String];
      if (espresso_network_bind_buffer())
      {
        double v38 = __cxa_allocate_exception(8uLL);
        *double v38 = 6014;
        __cxa_throw(v38, MEMORY[0x1E4FBA3E0], 0);
      }
      std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)p_logitsPosOutputs, &v51);
      id v14 = (std::__shared_weak_count *)v15;
    }
    else
    {
      id v9 = (char *)operator new(0xC0uLL);
      *((void *)v9 + 1) = 0;
      *((void *)v9 + 2) = 0;
      *(void *)id v9 = &unk_1EF753380;
      *(_OWORD *)(v9 + 24) = 0u;
      *(_OWORD *)(v9 + 40) = 0u;
      *(_OWORD *)(v9 + 56) = 0u;
      *(_OWORD *)(v9 + 72) = 0u;
      *(_OWORD *)(v9 + 88) = 0u;
      *(_OWORD *)(v9 + 104) = 0u;
      *(_OWORD *)(v9 + 120) = 0u;
      *(_OWORD *)(v9 + 136) = 0u;
      *(_OWORD *)(v9 + 152) = 0u;
      *(_OWORD *)(v9 + 168) = 0u;
      *((void *)v9 + 23) = 0;
      *(void *)&long long v51 = v9 + 24;
      *((void *)&v51 + 1) = v9;
      id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"logits_pos_%ld", v6);
      [v10 UTF8String];
      if (espresso_network_bind_buffer())
      {
        double v39 = __cxa_allocate_exception(8uLL);
        *double v39 = 6014;
        __cxa_throw(v39, MEMORY[0x1E4FBA3E0], 0);
      }
      std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)p_logitsPosOutputs, &v51);
      double v11 = (char *)operator new(0xC0uLL);
      *((void *)v11 + 1) = 0;
      *((void *)v11 + 2) = 0;
      *(void *)double v11 = &unk_1EF753380;
      *(_OWORD *)(v11 + 24) = 0u;
      *(_OWORD *)(v11 + 40) = 0u;
      *(_OWORD *)(v11 + 56) = 0u;
      *(_OWORD *)(v11 + 72) = 0u;
      *(_OWORD *)(v11 + 88) = 0u;
      *(_OWORD *)(v11 + 104) = 0u;
      *(_OWORD *)(v11 + 120) = 0u;
      *(_OWORD *)(v11 + 136) = 0u;
      *(_OWORD *)(v11 + 152) = 0u;
      *(_OWORD *)(v11 + 168) = 0u;
      *((void *)v11 + 23) = 0;
      *(void *)&long long v49 = v11 + 24;
      *((void *)&v49 + 1) = v11;
      uint64_t v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"logits_neg_%ld", v6);

      id v13 = v12;
      [v13 UTF8String];
      if (espresso_network_bind_buffer())
      {
        uint64_t v37 = __cxa_allocate_exception(8uLL);
        *uint64_t v37 = 6014;
        __cxa_throw(v37, MEMORY[0x1E4FBA3E0], 0);
      }
      std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)p_logitsNegOutputs, &v49);
      std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v11);
      id v14 = (std::__shared_weak_count *)v9;
    }
    std::__shared_weak_count::__release_shared[abi:nn180100](v14);
    int v16 = (char *)operator new(0xC0uLL);
    *((void *)v16 + 1) = 0;
    *((void *)v16 + 2) = 0;
    *(void *)int v16 = &unk_1EF753380;
    *(_OWORD *)(v16 + 24) = 0u;
    *(_OWORD *)(v16 + 40) = 0u;
    *(_OWORD *)(v16 + 56) = 0u;
    *(_OWORD *)(v16 + 72) = 0u;
    *(_OWORD *)(v16 + 88) = 0u;
    *(_OWORD *)(v16 + 104) = 0u;
    *(_OWORD *)(v16 + 120) = 0u;
    *(_OWORD *)(v16 + 136) = 0u;
    *(_OWORD *)(v16 + 152) = 0u;
    *(_OWORD *)(v16 + 168) = 0u;
    *((void *)v16 + 23) = 0;
    *(void *)&long long v53 = v16 + 24;
    *((void *)&v53 + 1) = v16;
    float v17 = objc_msgSend(NSString, "stringWithFormat:", @"offsets_%ld", v6);

    id v18 = v17;
    [v18 UTF8String];
    if (espresso_network_bind_buffer())
    {
      double v36 = __cxa_allocate_exception(8uLL);
      *double v36 = 6014;
      __cxa_throw(v36, MEMORY[0x1E4FBA3E0], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)p_offsetsOutputs, &v53);
    uint64_t v19 = [v47 defaultBoxesSides];
    long long v51 = 0uLL;
    uint64_t v52 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v51, *(const void **)v19, *(void *)(v19 + 8), (uint64_t)(*(void *)(v19 + 8) - *(void *)v19) >> 2);
    uint64_t v20 = [v47 ratios];
    long long v49 = 0uLL;
    uint64_t v50 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v49, *(const void **)v20, *(void *)(v20 + 8), (uint64_t)(*(void *)(v20 + 8) - *(void *)v20) >> 2);
    long long v21 = v49;
    unint64_t v22 = (uint64_t)(*((void *)&v49 + 1) - v49) >> 2;
    uint64_t v23 = v43;
    if (v22 != 1)
    {
      if (v22 != 5) {
        goto LABEL_14;
      }
      uint64_t v23 = v41;
    }
    v48->isAnchorSquare[0] = 1;
    *uint64_t v23 = 1;
LABEL_14:
    unint64_t v24 = (void *)v51;
    if (*((void *)&v21 + 1) == (void)v21)
    {
      if (*((void *)&v21 + 1)) {
        operator delete((void *)v21);
      }
LABEL_27:
      operator delete(v24);
      goto LABEL_28;
    }
    uint64_t v25 = 0;
    float v26 = *(float *)(v51 + 4 * v6);
    if (v22 <= 1) {
      uint64_t v27 = 1;
    }
    else {
      uint64_t v27 = v22;
    }
    uint64_t v28 = v8;
    do
    {
      float v29 = sqrtf(*(float *)(v21 + 4 * v25));
      *(v28 - 1) = v26 * v29;
      *uint64_t v28 = v26 / v29;
      ++v25;
      v28 += 2;
    }
    while (*((void *)&v21 + 1) != v25);
    if (v6 < 5)
    {
      float v30 = sqrtf(v26 * *((float *)v24 + v6 + 1));
      uint64_t v31 = 2 * v22;
      uint64_t v32 = (float *)v21;
      do
      {
        float v33 = *v32++;
        float v34 = sqrtf(v33);
        (*defaultBoxSizes)[(unint64_t)v31 / 2][0] = v30 * v34;
        v8[v31] = v30 / v34;
        v31 += 2;
        --v27;
      }
      while (v27);
    }
    operator delete((void *)v21);
    if (v24) {
      goto LABEL_27;
    }
LABEL_28:
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v16);

    ++v6;
    v8 += 20;
    ++defaultBoxSizes;
  }
  while (v6 != 6);
  float v35 = (void *)v54[0];
  v48->_currentNetworkWidth = *(void *)v54[0];
  v48->_currentNetworkHeight = v35[1];
  v54[1] = v35;
  operator delete(v35);
}

- (void)initializeEspressoResourcesWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 espressoStorageType:(int)a6
{
  id v7 = a3;
  context = (void *)espresso_create_context();
  self->_espressoContext = context;
  if (!context)
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 6013;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  self->_releaseEspressoContext = 1;
  plan = (void *)espresso_create_plan();
  self->_espressoPlan = plan;
  if (!plan)
  {
    double v11 = __cxa_allocate_exception(8uLL);
    *double v11 = 6013;
    __cxa_throw(v11, MEMORY[0x1E4FBA3E0], 0);
  }
  self->_releaseEspressoPlan = 1;
  id v14 = v7;
  [v14 UTF8String];
  if (espresso_plan_add_network())
  {
    uint64_t v12 = __cxa_allocate_exception(8uLL);
    *uint64_t v12 = 6014;
    __cxa_throw(v12, MEMORY[0x1E4FBA3E0], 0);
  }
  if (espresso_plan_build())
  {
    id v13 = __cxa_allocate_exception(8uLL);
    *id v13 = 6014;
    __cxa_throw(v13, MEMORY[0x1E4FBA3E0], 0);
  }
}

- (void)dealloc
{
  if (self->_releaseEspressoPlan) {
    espresso_plan_destroy();
  }
  if (self->_releaseEspressoContext) {
    espresso_context_destroy();
  }
  v3.receiver = self;
  v3.super_class = (Class)VNShotflowNetwork;
  [(VNShotflowNetwork *)&v3 dealloc];
}

- (VNShotflowNetwork)initWithEspressoNetwork:(id)a3 espressoPlan:(void *)a4 threshold:(float)a5
{
  uint64_t v7 = *(void *)&a3.var1;
  var0 = a3.var0;
  v14.receiver = self;
  v14.super_class = (Class)VNShotflowNetwork;
  id v9 = [(VNShotflowNetwork *)&v14 init];
  id v10 = v9;
  if (a5 == 1.0 || v9 == 0)
  {
    uint64_t v12 = 0;
  }
  else
  {
    v9->_espressoNetwork.plan = var0;
    *(void *)&v9->_espressoNetwork.network_index = v7;
    v9->_espressoPlan = a4;
    *(_WORD *)&v9->_releaseEspressoContext = 0;
    v9->_threshold = a5;
    [(VNShotflowNetwork *)v9 initializeBuffers];
    uint64_t v12 = v10;
  }

  return v12;
}

- (VNShotflowNetwork)initWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 espressoStorageType:(int)a6 threshold:(float)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VNShotflowNetwork;
  id v13 = [(VNShotflowNetwork *)&v18 init];
  objc_super v14 = v13;
  if (a7 == 1.0 || v13 == 0)
  {
    int v16 = 0;
  }
  else
  {
    v13->_threshold = a7;
    [(VNShotflowNetwork *)v13 initializeEspressoResourcesWithModelPath:v12 espressoEngineID:v10 espressoDeviceID:v9 espressoStorageType:v8];
    [(VNShotflowNetwork *)v14 initializeBuffers];
    int v16 = v14;
  }

  return v16;
}

+ (id)processingDeviceDetectorWithEspressoNetwork:(id)a3 espressoPlan:(void *)a4 threshold:(float)a5
{
  uint64_t v7 = *(void *)&a3.var1;
  var0 = a3.var0;
  id v9 = objc_alloc((Class)a1);
  *(float *)&double v10 = a5;
  double v11 = objc_msgSend(v9, "initWithEspressoNetwork:espressoPlan:threshold:", var0, v7, a4, v10);

  return v11;
}

+ (id)processingDeviceNetworkWithModelPath:(id)a3 threshold:(float)a4 preferredDeviceID:(int)a5 engineID:(int)a6 storageType:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = objc_alloc((Class)a1);
  *(float *)&double v14 = a4;
  v15 = (void *)[v13 initWithModelPath:v12 espressoEngineID:v8 espressoDeviceID:v9 espressoStorageType:v7 threshold:v14];

  return v15;
}

+ (unint64_t)numberBinsYaw
{
  return 5;
}

+ (unint64_t)numberBinsRoll
{
  return 12;
}

+ (BOOL)hasFaceBodyAssociation
{
  return 0;
}

+ (BOOL)hasPetFaces
{
  return 0;
}

+ (BOOL)hasPose
{
  return 1;
}

+ (BOOL)inputBGR
{
  return 0;
}

+ (tuple<float,)inputBiasRGB
{
  float v2 = 0.0;
  float v3 = 0.0;
  float v4 = 0.0;
  result.var0.var2 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

+ (float)inputScale
{
  return 0.0039216;
}

+ (const)defaultBoxesSides
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__VNShotflowNetwork_defaultBoxesSides__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNShotflowNetwork defaultBoxesSides]::onceToken != -1) {
    dispatch_once(&+[VNShotflowNetwork defaultBoxesSides]::onceToken, block);
  }
  return (const void *)+[VNShotflowNetwork defaultBoxesSides]::defaultBoxesSides;
}

void __38__VNShotflowNetwork_defaultBoxesSides__block_invoke(uint64_t a1)
{
}

+ (const)strides
{
  if (+[VNShotflowNetwork strides]::onceToken != -1) {
    dispatch_once(&+[VNShotflowNetwork strides]::onceToken, &__block_literal_global_34271);
  }
  return (const void *)+[VNShotflowNetwork strides]::strides;
}

void __28__VNShotflowNetwork_strides__block_invoke()
{
}

+ (float)nonSquareYawDefault
{
  return 0.0;
}

+ (float)nonSquareRollDefault
{
  return 0.0;
}

+ (float)inputImageAspectRatio
{
  [a1 inputImageMaxDimension];
  float v4 = v3;
  [a1 inputImageMinDimension];
  return v4 / v5;
}

+ (float)inputImageMaxDimension
{
  [a1 inputImageSize];
  if (v2 < v3) {
    return v3;
  }
  return v2;
}

+ (float)inputImageMinDimension
{
  [a1 inputImageSize];
  if (v3 < v2) {
    return v3;
  }
  return v2;
}

+ (NSString)inputLayerName
{
  return (NSString *)@"image";
}

@end