@interface CHCTCRecognitionModel
- (BOOL)normalizeFeatures;
- (BOOL)reachesActivationThreshold:(double)a3 inCharacterSet:(id)a4 resultArray:(id)a5 indexArray:(id)a6;
- (BOOL)shouldUseArabicVisualOrderFeatureExtraction;
- (BOOL)shouldUseCPPFeatureExtraction;
- (BOOL)shouldUseStrokeDirectionFeature;
- (CHCTCRecognitionModel)initWithModelName:(id)a3 decodingPruningPolicy:(CVNLPTextDecodingPruningPolicy *)a4;
- (CHCodeMap)codeMap;
- (CVNLPTextDecodingPruningPolicy)decodingPruningPolicy;
- (NSString)characterProbabilityOutputName;
- (NSString)directionalFeaturesInputName;
- (double)distMean;
- (double)distStd;
- (double)highestSymbolActivationWithResultArray:(id)a3 indexArray:(id)a4 symbol:(id *)a5;
- (double)interpointDistance;
- (id).cxx_construct;
- (id)_extractFeaturesFromDrawing:(id)a3 inputName:(id)a4 interpointDistance:(double)a5 error:(id *)a6;
- (id)featureProviderForDrawing:(id)a3 initialVectorAnchorPoint:(CGPoint)a4 normalizeFeatures:(BOOL)a5 padFeatures:(BOOL)a6 outStrokeEndings:(void *)a7 outInputSequenceLength:(int64_t *)a8 outOutputSequenceLength:(int64_t *)a9;
- (id)recognizeDrawing:(id)a3 minimumDrawingSize:(CGSize)a4 initialVectorAnchorPoint:(CGPoint)a5 activeCharacterSet:(id)a6 outStrokeIndexMapping:(void *)a7 outStrokeEndings:(void *)a8 outFallbackSymbol:(id *)a9 outFallbackSymbolScore:(double *)a10;
- (int64_t)blankIndex;
- (int64_t)cosAlphaFeatureIndex;
- (int64_t)distanceFeatureIndex;
- (int64_t)gapFeatureIndex;
- (int64_t)pseudospaceIndex;
- (int64_t)sequenceCompression;
- (int64_t)sinAlphaFeatureIndex;
- (int64_t)spaceIndex;
- (unint64_t)strokeOrdering;
- (void)dealloc;
- (void)enumerateActivationsInResultArray:(id)a3 indexArray:(id)a4 block:(id)a5;
- (void)setDecodingPruningPolicy:(CVNLPTextDecodingPruningPolicy *)a3;
- (void)setDistMean:(double)a3;
- (void)setDistStd:(double)a3;
- (void)setInterpointDistance:(double)a3;
- (void)setNormalizeFeatures:(BOOL)a3;
- (void)setShouldUseArabicVisualOrderFeatureExtraction:(BOOL)a3;
- (void)setShouldUseCPPFeatureExtraction:(BOOL)a3;
- (void)setShouldUseStrokeDirectionFeature:(BOOL)a3;
- (void)setStrokeOrdering:(unint64_t)a3;
- (void)updateActivationsWithActiveCharacterSet:(id)a3 resultArray:(id)a4 indexArray:(id)a5;
@end

@implementation CHCTCRecognitionModel

- (CHCTCRecognitionModel)initWithModelName:(id)a3 decodingPruningPolicy:(CVNLPTextDecodingPruningPolicy *)a4
{
  id v6 = a3;
  v105.receiver = self;
  v105.super_class = (Class)CHCTCRecognitionModel;
  v7 = [(CHRecurrentNeuralNetworkCoreML *)&v105 initWithModelName:v6];
  v13 = v7;
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v14 = *(void *)&a4->maxNumberOfCandidates;
  *(_OWORD *)&v7->_decodingPruningPolicy.strategy = *(_OWORD *)&a4->strategy;
  *(void *)&v7->_decodingPruningPolicy.maxNumberOfCandidates = v14;
  v7->_sequenceCompression = 4;
  v7->_distanceFeatureIndex = 0;
  v7->_sinAlphaFeatureIndex = 1;
  v7->_cosAlphaFeatureIndex = 2;
  v7->_gapFeatureIndex = 3;
  v7->_normalizeFeatures = 1;
  v7->_shouldUseCPPFeatureExtraction = 0;
  v7->_shouldUseArabicVisualOrderFeatureExtraction = 0;
  v7->_strokeOrdering = 0;
  v7->_shouldUseStrokeDirectionFeature = 0;
  v15 = objc_msgSend_inputNames(v7, v8, v9, v10, v11, v12);
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(v15, v16, 0, v17, v18, v19);
  directionalFeaturesInputName = v13->_directionalFeaturesInputName;
  v13->_directionalFeaturesInputName = (NSString *)v20;

  v27 = objc_msgSend_outputNames(v13, v22, v23, v24, v25, v26);
  uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(v27, v28, 0, v29, v30, v31);
  characterProbabilityOutputName = v13->_characterProbabilityOutputName;
  v13->_characterProbabilityOutputName = (NSString *)v32;

  uint64_t v34 = objc_opt_new();
  powerLogger = v13->_powerLogger;
  v13->_powerLogger = (CHPowerLogger *)v34;

  v41 = objc_msgSend_resourcePath(v13, v36, v37, v38, v39, v40);
  v47 = objc_msgSend_stringByDeletingLastPathComponent(v41, v42, v43, v44, v45, v46);
  v53 = objc_msgSend_modelName(v13, v48, v49, v50, v51, v52);
  v58 = objc_msgSend_stringByAppendingString_(v53, v54, @".codemap", v55, v56, v57);
  v63 = objc_msgSend_stringByAppendingPathComponent_(v47, v59, (uint64_t)v58, v60, v61, v62);

  id v102 = v63;
  v68 = (const char *)objc_msgSend_cStringUsingEncoding_(v102, v64, 4, v65, v66, v67);
  size_t v69 = strlen(v68);
  if (v69 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1C4949B7C();
  }
  v70 = (void *)v69;
  if (v69 >= 0x17)
  {
    uint64_t v72 = (v69 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v69 | 7) != 0x17) {
      uint64_t v72 = v69 | 7;
    }
    uint64_t v73 = v72 + 1;
    v71 = (void **)operator new(v72 + 1);
    __dst[1] = v70;
    unint64_t v104 = v73 | 0x8000000000000000;
    __dst[0] = v71;
  }
  else
  {
    HIBYTE(v104) = v69;
    v71 = __dst;
    if (!v69) {
      goto LABEL_10;
    }
  }
  memmove(v71, v68, (size_t)v70);
LABEL_10:
  *((unsigned char *)v70 + (void)v71) = 0;
  uint64_t codeMap = sub_1C4B3BC90((uint64_t *)__dst);
  v13->_uint64_t codeMap = (CHCodeMap *)codeMap;
  if (SHIBYTE(v104) < 0)
  {
    operator delete(__dst[0]);
    uint64_t codeMap = (uint64_t)v13->_codeMap;
  }
  v79 = objc_msgSend_orderedSetWithCapacity_(MEMORY[0x1E4F1CA70], v75, *(unsigned int *)(codeMap + 24), v76, v77, v78, 89);
  if (v13->_codeMap->var3)
  {
    unint64_t v80 = 0;
    while (1)
    {
      v81 = (void *)MEMORY[0x1C8786C20]();
      uint64_t v87 = objc_msgSend_codeMap(v13, v82, v83, v84, v85, v86);
      int v88 = *(_DWORD *)CHCodeMap::operator[](v87, v80);
      if (v88 == 32)
      {
        v94 = &OBJC_IVAR___CHCTCRecognitionModel__spaceIndex;
        goto LABEL_20;
      }
      if (v88 == 57426) {
        break;
      }
      if (v88 == 57427)
      {
        v94 = &OBJC_IVAR___CHCTCRecognitionModel__pseudospaceIndex;
LABEL_20:
        *(Class *)((char *)&v13->super.super.super.isa + *v94) = (Class)v80;
      }
      v95 = unicodeToNSString(v88, v89, v90, v91, v92, v93);
      objc_msgSend_addObject_(v79, v96, (uint64_t)v95, v97, v98, v99);

      if (++v80 >= v13->_codeMap->var3) {
        goto LABEL_22;
      }
    }
    v94 = &OBJC_IVAR___CHCTCRecognitionModel__blankIndex;
    goto LABEL_20;
  }
LABEL_22:
  objc_storeStrong((id *)&v13->__stringCodeMap, v79);
  if (*((unsigned char *)&v13->super.super.super.isa + v101))
  {
    sub_1C4A7A7D8((uint64_t)v13);
    sub_1C4A7ABB0((uint64_t)v13);
  }

LABEL_25:
  return v13;
}

- (void)setInterpointDistance:(double)a3
{
  self->_interpointDistance = a3;
  if (self->_shouldUseCPPFeatureExtraction) {
    sub_1C4A7A7D8((uint64_t)self);
  }
}

- (void)setShouldUseArabicVisualOrderFeatureExtraction:(BOOL)a3
{
  if (self->_shouldUseArabicVisualOrderFeatureExtraction != a3)
  {
    self->_shouldUseArabicVisualOrderFeatureExtraction = a3;
    sub_1C4A7A7D8((uint64_t)self);
    sub_1C4A7ABB0((uint64_t)self);
  }
}

- (void)setShouldUseStrokeDirectionFeature:(BOOL)a3
{
  if (self->_shouldUseStrokeDirectionFeature != a3)
  {
    self->_shouldUseStrokeDirectionFeature = a3;
    sub_1C4A7A7D8((uint64_t)self);
    sub_1C4A7ABB0((uint64_t)self);
  }
}

- (void)setShouldUseCPPFeatureExtraction:(BOOL)a3
{
  BOOL shouldUseCPPFeatureExtraction = self->_shouldUseCPPFeatureExtraction;
  self->_BOOL shouldUseCPPFeatureExtraction = a3;
  if (shouldUseCPPFeatureExtraction || !a3)
  {
    if (!a3)
    {
      value = self->_preprocessor.__ptr_.__value_;
      self->_preprocessor.__ptr_.__value_ = 0;
      if (value)
      {
        v7 = *(void **)value;
        if (*(void *)value)
        {
          v8 = (void *)*((void *)value + 1);
          uint64_t v9 = *(void **)value;
          if (v8 != v7)
          {
            do
            {
              uint64_t v11 = *--v8;
              uint64_t v10 = v11;
              void *v8 = 0;
              if (v11) {
                (*(void (**)(uint64_t, SEL))(*(void *)v10 + 8))(v10, a2);
              }
            }
            while (v8 != v7);
            uint64_t v9 = *(void **)value;
          }
          *((void *)value + 1) = v7;
          operator delete(v9);
        }
        MEMORY[0x1C8786460](value, 0x20C40960023A9);
      }
      uint64_t v12 = self->_featureExtractor.__ptr_.__value_;
      self->_featureExtractor.__ptr_.__value_ = 0;
      if (v12)
      {
        v13 = *(void **)v12;
        if (*(void *)v12)
        {
          uint64_t v14 = (void *)*((void *)v12 + 1);
          v15 = *(void **)v12;
          if (v14 != v13)
          {
            do
            {
              uint64_t v17 = *--v14;
              uint64_t v16 = v17;
              *uint64_t v14 = 0;
              if (v17) {
                (*(void (**)(uint64_t, SEL))(*(void *)v16 + 8))(v16, a2);
              }
            }
            while (v14 != v13);
            v15 = *(void **)v12;
          }
          *((void *)v12 + 1) = v13;
          operator delete(v15);
        }
        JUMPOUT(0x1C8786460);
      }
    }
  }
  else
  {
    sub_1C4A7A7D8((uint64_t)self);
    sub_1C4A7ABB0((uint64_t)self);
  }
}

- (void)dealloc
{
  uint64_t codeMap = self->_codeMap;
  if (codeMap)
  {
    if (codeMap->var0) {
      munmap(codeMap->var0, codeMap->var1);
    }
    MEMORY[0x1C8786460](codeMap, 0x1010C40A749B91FLL);
  }
  v4.receiver = self;
  v4.super_class = (Class)CHCTCRecognitionModel;
  [(CHRecurrentNeuralNetworkCoreML *)&v4 dealloc];
}

- (id)featureProviderForDrawing:(id)a3 initialVectorAnchorPoint:(CGPoint)a4 normalizeFeatures:(BOOL)a5 padFeatures:(BOOL)a6 outStrokeEndings:(void *)a7 outInputSequenceLength:(int64_t *)a8 outOutputSequenceLength:(int64_t *)a9
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v130 = v16;
  v22 = objc_msgSend_directionalFeaturesInputName(self, v17, v18, v19, v20, v21);
  id v132 = 0;
  sub_1C4A7B6E8(self, v16, v22, a5, a6, &v132, x, y);
  id v126 = (id)objc_claimAutoreleasedReturnValue();
  id v125 = v132;

  uint64_t v23 = v126;
  if (!v126)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v24 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      uint64_t v30 = objc_msgSend_modelName(self, v25, v26, v27, v28, v29);
      v36 = objc_msgSend_localizedDescription(v125, v31, v32, v33, v34, v35);
      *(_DWORD *)buf = 138412546;
      v134 = v30;
      __int16 v135 = 2112;
      v136 = v36;
      _os_log_impl(&dword_1C492D000, v24, OS_LOG_TYPE_FAULT, "An error occurred in the %@ model when extracting features: %@", buf, 0x16u);
    }
    uint64_t v23 = 0;
  }
  id v127 = v23;
  uint64_t v129 = objc_msgSend_dataPointer(v127, v37, v38, v39, v40, v41);
  v47 = objc_msgSend_featureCounts(self, v42, v43, v44, v45, v46);
  v53 = objc_msgSend_directionalFeaturesInputName(self, v48, v49, v50, v51, v52);
  v58 = objc_msgSend_objectForKeyedSubscript_(v47, v54, (uint64_t)v53, v55, v56, v57);
  uint64_t v128 = objc_msgSend_integerValue(v58, v59, v60, v61, v62, v63);

  size_t v69 = objc_msgSend_shape(v127, v64, v65, v66, v67, v68);
  v74 = objc_msgSend_objectAtIndexedSubscript_(v69, v70, 1, v71, v72, v73);
  *a8 = objc_msgSend_integerValue(v74, v75, v76, v77, v78, v79);

  unint64_t v90 = vcvtpd_s64_f64((double)*a8 / (double)objc_msgSend_sequenceCompression(self, v80, v81, v82, v83, v84));
  *a9 = v90;
  uint64_t v91 = *(char **)a7;
  *((void *)a7 + 1) = *(void *)a7;
  if (v90 > (uint64_t)(*((void *)a7 + 2) - (void)v91) >> 3)
  {
    if (v90 >> 61) {
      sub_1C494A220();
    }
    uint64_t v92 = (char *)operator new(8 * v90);
    *(void *)a7 = v92;
    *((void *)a7 + 1) = v92;
    *((void *)a7 + 2) = &v92[8 * v90];
    if (v91) {
      operator delete(v91);
    }
  }
  if (*a8 >= 1)
  {
    uint64_t v93 = 0;
    uint64_t v94 = 0;
    while (1)
    {
      if (v93
        && *(float *)(v129 + 4 * (objc_msgSend_gapFeatureIndex(self, v85, v86, v87, v88, v89) + v93 * v128)) == 1.0)
      {
        ++v94;
      }
      uint64_t v97 = objc_msgSend_sequenceCompression(self, v85, v86, v87, v88, v89, v125);
      if (v93 % v97 != objc_msgSend_sequenceCompression(self, v98, v99, v100, v101, v102) - 1)
      {
        int64_t v96 = *a8;
        if (v93 != *a8 - 1) {
          goto LABEL_15;
        }
      }
      unint64_t v104 = (char *)*((void *)a7 + 1);
      unint64_t v103 = *((void *)a7 + 2);
      if ((unint64_t)v104 >= v103) {
        break;
      }
      *(void *)unint64_t v104 = v94;
      uint64_t v95 = (uint64_t)(v104 + 8);
LABEL_14:
      uint64_t v94 = 0;
      *((void *)a7 + 1) = v95;
      id v16 = v130;
      int64_t v96 = *a8;
LABEL_15:
      if (++v93 >= v96) {
        goto LABEL_41;
      }
    }
    objc_super v105 = *(char **)a7;
    uint64_t v106 = (uint64_t)&v104[-*(void *)a7];
    uint64_t v107 = v106 >> 3;
    unint64_t v108 = (v106 >> 3) + 1;
    if (v108 >> 61) {
      sub_1C494A220();
    }
    uint64_t v109 = v103 - (void)v105;
    if (v109 >> 2 > v108) {
      unint64_t v108 = v109 >> 2;
    }
    if ((unint64_t)v109 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v110 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v110 = v108;
    }
    if (v110)
    {
      if (v110 >> 61) {
        sub_1C4949AA8();
      }
      v111 = operator new(8 * v110);
      v112 = &v111[8 * v107];
      void *v112 = v94;
      uint64_t v95 = (uint64_t)(v112 + 1);
      int64_t v113 = v104 - v105;
      if (v104 == v105) {
        goto LABEL_39;
      }
    }
    else
    {
      v111 = 0;
      v112 = (void *)(8 * v107);
      *(void *)(8 * v107) = v94;
      uint64_t v95 = 8 * v107 + 8;
      int64_t v113 = v104 - v105;
      if (v104 == v105)
      {
LABEL_39:
        *(void *)a7 = v112;
        *((void *)a7 + 1) = v95;
        *((void *)a7 + 2) = &v111[8 * v110];
        if (v105) {
          operator delete(v105);
        }
        goto LABEL_14;
      }
    }
    unint64_t v114 = v113 - 8;
    if (v114 < 0x58) {
      goto LABEL_49;
    }
    if ((unint64_t)(v104 - v111 - v106) < 0x20) {
      goto LABEL_49;
    }
    uint64_t v115 = (v114 >> 3) + 1;
    uint64_t v116 = 8 * (v115 & 0x3FFFFFFFFFFFFFFCLL);
    v117 = &v104[-v116];
    v112 = (void *)((char *)v112 - v116);
    v118 = &v111[8 * v107 - 16];
    v119 = v104 - 16;
    uint64_t v120 = v115 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v121 = *(_OWORD *)v119;
      *(v118 - 1) = *((_OWORD *)v119 - 1);
      _OWORD *v118 = v121;
      v118 -= 2;
      v119 -= 32;
      v120 -= 4;
    }
    while (v120);
    unint64_t v104 = v117;
    if (v115 != (v115 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_49:
      do
      {
        uint64_t v122 = *((void *)v104 - 1);
        v104 -= 8;
        *--v112 = v122;
      }
      while (v104 != v105);
    }
    goto LABEL_39;
  }
LABEL_41:
  ++*(void *)(*((void *)a7 + 1) - 8);
  v123 = sub_1C4A7BFB0(self, v127);

  return v123;
}

- (id)recognizeDrawing:(id)a3 minimumDrawingSize:(CGSize)a4 initialVectorAnchorPoint:(CGPoint)a5 activeCharacterSet:(id)a6 outStrokeIndexMapping:(void *)a7 outStrokeEndings:(void *)a8 outFallbackSymbol:(id *)a9 outFallbackSymbolScore:(double *)a10
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v948 = *MEMORY[0x1E4F143B8];
  v945.super.Class isa = *(Class *)&a5.x;
  *(CGFloat *)v945._anon_8 = a5.y;
  v887 = (CoreHandwriting *)a3;
  id v885 = a6;
  id v14 = objc_alloc(MEMORY[0x1E4F1E9E0]);
  v886 = objc_msgSend_initWithUsesCPUOnly_(v14, v15, 1, v16, v17, v18);
  unint64_t v944 = 0;
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v19, v20, v21, v22, v23);
  double v25 = v24;
  if (!self->_shouldUseCPPFeatureExtraction)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v34 = (id)qword_1EA3C9F98;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v34, OS_LOG_TYPE_DEBUG, "Running legacy preprocessing and feature extraction", buf, 2u);
    }

    unint64_t strokeOrdering = self->_strokeOrdering;
    if (strokeOrdering)
    {
      id v933 = 0;
      uint64_t v39 = objc_msgSend_sortedDrawingUsingStrokeMidPointHorizontalOverlapAware_shouldSortRTL_(v887, v35, (uint64_t)&v933, strokeOrdering == 2, v36, v37);
      id v903 = v933;

      uint64_t v40 = v39;
    }
    else
    {
      id v903 = 0;
      uint64_t v40 = (uint64_t)v887;
    }
    v887 = (CoreHandwriting *)v40;
    v935 = (void *)0x3FF0000000000000;
    memset(buf, 0, sizeof(buf));
    v178 = objc_msgSend_normalizedDrawing_targetHeight_minimumDrawingSize_interpolationDistance_outScaleFactor_outputPointMap_(self, v35, v40, (uint64_t)&v935, (uint64_t)buf, v37, 1.0, width, height, self->_interpointDistance);
    __asm { FMOV            V1.2D, #-1.5 }
    float64x2_t v184 = vmaxnmq_f64(vmulq_n_f64(*(float64x2_t *)&v945.super.isa, *(double *)&v935), _Q1);
    __asm { FMOV            V1.2D, #1.5 }
    *(float64x2_t *)&v945.super.Class isa = vminnmq_f64(v184, _Q1);
    *((void *)a7 + 1) = *(void *)a7;
    os_log_t v909 = v178;
    unint64_t v191 = objc_msgSend_strokeCount(v178, v186, v187, v188, v189, v190);
    unint64_t v197 = v191;
    v198 = *(unsigned char **)a7;
    if (v191 <= (uint64_t)(*((void *)a7 + 2) - *(void *)a7) >> 3) {
      goto LABEL_158;
    }
    if (v191 >> 61) {
      sub_1C494A220();
    }
    v199 = (unsigned char *)*((void *)a7 + 1);
    v200 = (char *)operator new(8 * v191);
    uint64_t v201 = v199 - v198;
    v202 = &v200[(v199 - v198) & 0xFFFFFFFFFFFFFFF8];
    v203 = v202;
    if (v199 != v198)
    {
      if ((unint64_t)(v201 - 8) < 0x58)
      {
        v203 = &v200[(v199 - v198) & 0xFFFFFFFFFFFFFFF8];
        do
        {
LABEL_155:
          uint64_t v212 = *((void *)v199 - 1);
          v199 -= 8;
          *((void *)v203 - 1) = v212;
          v203 -= 8;
        }
        while (v199 != v198);
        goto LABEL_156;
      }
      v203 = &v200[(v199 - v198) & 0xFFFFFFFFFFFFFFF8];
      if ((unint64_t)(&v199[-(v201 & 0xFFFFFFFFFFFFFFF8)] - v200) < 0x20) {
        goto LABEL_155;
      }
      uint64_t v204 = v201 >> 3;
      unint64_t v205 = ((unint64_t)(v201 - 8) >> 3) + 1;
      uint64_t v206 = 8 * (v205 & 0x3FFFFFFFFFFFFFFCLL);
      v207 = &v199[-v206];
      v203 = &v202[-v206];
      v208 = &v200[8 * v204 - 16];
      v209 = (long long *)(v199 - 16);
      uint64_t v210 = v205 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v211 = *v209;
        *((_OWORD *)v208 - 1) = *(v209 - 1);
        *(_OWORD *)v208 = v211;
        v208 -= 32;
        v209 -= 2;
        v210 -= 4;
      }
      while (v210);
      v199 = v207;
      if (v205 != (v205 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_155;
      }
    }
LABEL_156:
    *(void *)a7 = v203;
    *((void *)a7 + 1) = v202;
    *((void *)a7 + 2) = &v200[8 * v197];
    if (v198) {
      operator delete(v198);
    }
LABEL_158:
    if (v903)
    {
      for (unint64_t i = 0; ; ++i)
      {
        if (i >= objc_msgSend_strokeCount(v178, v192, v193, v194, v195, v196)) {
          goto LABEL_207;
        }
        v214 = objc_msgSend_objectAtIndexedSubscript_(v903, v192, i, v194, v195, v196);
        uint64_t v220 = objc_msgSend_integerValue(v214, v215, v216, v217, v218, v219);
        uint64_t v221 = v220;
        v223 = (uint64_t *)*((void *)a7 + 1);
        unint64_t v222 = *((void *)a7 + 2);
        if ((unint64_t)v223 < v222)
        {
          uint64_t *v223 = v220;
          uint64_t v224 = (uint64_t)(v223 + 1);
          goto LABEL_182;
        }
        v225 = *(uint64_t **)a7;
        uint64_t v226 = (uint64_t)v223 - *(void *)a7;
        uint64_t v227 = v226 >> 3;
        unint64_t v228 = (v226 >> 3) + 1;
        if (v228 >> 61) {
          sub_1C494A220();
        }
        uint64_t v229 = v222 - (void)v225;
        if (v229 >> 2 > v228) {
          unint64_t v228 = v229 >> 2;
        }
        unint64_t v230 = (unint64_t)v229 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v228;
        if (v230) {
          break;
        }
        v231 = 0;
        v232 = (uint64_t *)(8 * v227);
        *(void *)(8 * v227) = v221;
        uint64_t v224 = 8 * v227 + 8;
        int64_t v233 = (char *)v223 - (char *)v225;
        if (v223 != v225) {
          goto LABEL_174;
        }
LABEL_180:
        *(void *)a7 = v232;
        *((void *)a7 + 1) = v224;
        *((void *)a7 + 2) = &v231[8 * v230];
        if (v225) {
          operator delete(v225);
        }
LABEL_182:
        v178 = v909;
        *((void *)a7 + 1) = v224;
      }
      if (v230 >> 61) {
        sub_1C4949AA8();
      }
      v231 = operator new(8 * v230);
      v232 = (uint64_t *)&v231[8 * v227];
      uint64_t *v232 = v221;
      uint64_t v224 = (uint64_t)(v232 + 1);
      int64_t v233 = (char *)v223 - (char *)v225;
      if (v223 == v225) {
        goto LABEL_180;
      }
LABEL_174:
      unint64_t v234 = v233 - 8;
      if (v234 < 0x58) {
        goto LABEL_332;
      }
      if ((unint64_t)((char *)v223 - v231 - v226) < 0x20) {
        goto LABEL_332;
      }
      uint64_t v235 = (v234 >> 3) + 1;
      uint64_t v236 = 8 * (v235 & 0x3FFFFFFFFFFFFFFCLL);
      v237 = &v223[v236 / 0xFFFFFFFFFFFFFFF8];
      v232 = (uint64_t *)((char *)v232 - v236);
      v238 = &v231[8 * v227 - 16];
      v239 = v223 - 2;
      uint64_t v240 = v235 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v241 = *(_OWORD *)v239;
        *(v238 - 1) = *((_OWORD *)v239 - 1);
        _OWORD *v238 = v241;
        v238 -= 2;
        v239 -= 4;
        v240 -= 4;
      }
      while (v240);
      v223 = v237;
      if (v235 != (v235 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_332:
        do
        {
          uint64_t v242 = *--v223;
          *--v232 = v242;
        }
        while (v223 != v225);
      }
      goto LABEL_180;
    }
    for (unint64_t j = 0; ; ++j)
    {
      if (j >= objc_msgSend_strokeCount(v178, v192, v193, v194, v195, v196))
      {
LABEL_207:
        *(void *)&v945._anon_8[16] = 0;
        Class isa = v945.super.isa;
        double v266 = *(double *)v945._anon_8;
        uint64_t v267 = objc_msgSend_normalizeFeatures(self, v192, v193, v194, v195, v196);
        v274 = objc_msgSend_featureProviderForDrawing_initialVectorAnchorPoint_normalizeFeatures_padFeatures_outStrokeEndings_outInputSequenceLength_outOutputSequenceLength_(self, v268, (uint64_t)v178, v267, 1, (uint64_t)a8, &v945._anon_8[16], &v944, *(double *)&isa, v266);
        BOOL v170 = v274 != 0;
        if (v274)
        {
          v275 = objc_msgSend_model(self, v269, v270, v271, v272, v273);
          id v932 = 0;
          v895 = objc_msgSend_predictionFromFeatures_options_error_(v275, v276, (uint64_t)v274, (uint64_t)v886, (uint64_t)&v932, v277);
          id v157 = v932;
        }
        else
        {
          v895 = 0;
          id v157 = 0;
        }

        uint64_t v278 = *(void *)buf;
        if (*(void *)buf)
        {
          uint64_t v279 = *(void *)&buf[8];
          v280 = *(void **)buf;
          if (*(void *)&buf[8] != *(void *)buf)
          {
            do
            {
              uint64_t v281 = v279 - 24;
              sub_1C4999C7C(v279 - 24, *(void **)(v279 - 16));
              uint64_t v279 = v281;
            }
            while (v281 != v278);
            v280 = *(void **)buf;
          }
          *(void *)&buf[8] = v278;
          operator delete(v280);
        }

        goto LABEL_216;
      }
      v246 = (unint64_t *)*((void *)a7 + 1);
      unint64_t v245 = *((void *)a7 + 2);
      if ((unint64_t)v246 < v245)
      {
        unint64_t *v246 = j;
        uint64_t v244 = (uint64_t)(v246 + 1);
        goto LABEL_185;
      }
      v247 = *(unint64_t **)a7;
      uint64_t v248 = (uint64_t)v246 - *(void *)a7;
      uint64_t v249 = v248 >> 3;
      unint64_t v250 = (v248 >> 3) + 1;
      if (v250 >> 61) {
        sub_1C494A220();
      }
      uint64_t v251 = v245 - (void)v247;
      if (v251 >> 2 > v250) {
        unint64_t v250 = v251 >> 2;
      }
      unint64_t v252 = (unint64_t)v251 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v250;
      if (v252) {
        break;
      }
      v253 = 0;
      v254 = (unint64_t *)(8 * v249);
      *(void *)(8 * v249) = j;
      uint64_t v244 = 8 * v249 + 8;
      int64_t v255 = (char *)v246 - (char *)v247;
      if (v246 != v247) {
        goto LABEL_199;
      }
LABEL_205:
      *(void *)a7 = v254;
      *((void *)a7 + 1) = v244;
      *((void *)a7 + 2) = &v253[8 * v252];
      if (v247) {
        operator delete(v247);
      }
LABEL_185:
      *((void *)a7 + 1) = v244;
      v178 = v909;
    }
    if (v252 >> 61) {
      sub_1C4949AA8();
    }
    v253 = operator new(8 * v252);
    v254 = (unint64_t *)&v253[8 * v249];
    unint64_t *v254 = j;
    uint64_t v244 = (uint64_t)(v254 + 1);
    int64_t v255 = (char *)v246 - (char *)v247;
    if (v246 == v247) {
      goto LABEL_205;
    }
LABEL_199:
    unint64_t v256 = v255 - 8;
    if (v256 < 0x58) {
      goto LABEL_333;
    }
    if ((unint64_t)((char *)v246 - v253 - v248) < 0x20) {
      goto LABEL_333;
    }
    uint64_t v257 = (v256 >> 3) + 1;
    uint64_t v258 = 8 * (v257 & 0x3FFFFFFFFFFFFFFCLL);
    v259 = &v246[v258 / 0xFFFFFFFFFFFFFFF8];
    v254 = (unint64_t *)((char *)v254 - v258);
    v260 = &v253[8 * v249 - 16];
    v261 = v246 - 2;
    uint64_t v262 = v257 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v263 = *(_OWORD *)v261;
      *(v260 - 1) = *((_OWORD *)v261 - 1);
      _OWORD *v260 = v263;
      v260 -= 2;
      v261 -= 4;
      v262 -= 4;
    }
    while (v262);
    v246 = v259;
    if (v257 != (v257 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_333:
      do
      {
        unint64_t v264 = *--v246;
        *--v254 = v264;
      }
      while (v246 != v247);
    }
    goto LABEL_205;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v26 = (id)qword_1EA3C9F98;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v26, OS_LOG_TYPE_DEBUG, "Running C++ preprocessor and feature extraction", buf, 2u);
  }

  v942 = 0;
  v941 = 0;
  uint64_t v943 = 0;
  value = self->_preprocessor.__ptr_.__value_;
  CoreHandwriting::drawingToInk(v887, &v945, (uint64_t *)&v935);
  CoreHandwriting::PreprocessingManager::process((CoreHandwriting::PreprocessingManager *)value, (const CoreHandwriting::Ink *)&v935, (CoreHandwriting::InkMapping *)&v941, (uint64_t)buf);
  if (__p) {
    operator delete(__p);
  }
  uint64_t v28 = (char *)v935;
  if (v935)
  {
    uint64_t v29 = v936;
    uint64_t v30 = v935;
    if (v936 != v935)
    {
      uint64_t v31 = v936;
      do
      {
        uint64_t v33 = (void *)*((void *)v31 - 3);
        v31 -= 24;
        uint64_t v32 = v33;
        if (v33)
        {
          *((void *)v29 - 2) = v32;
          operator delete(v32);
        }
        uint64_t v29 = v31;
      }
      while (v31 != v28);
      uint64_t v30 = v935;
    }
    v936 = v28;
    operator delete(v30);
  }
  CoreHandwriting::FeatureExtractionProcessor::process((CoreHandwriting::FeatureExtractionProcessor *)self->_featureExtractor.__ptr_.__value_, (char **)&v935);
  uint64_t v46 = *(uint64_t **)a7;
  *((void *)a7 + 1) = *(void *)a7;
  uint64_t v48 = *(void *)buf;
  uint64_t v47 = *(void *)&buf[8];
  unint64_t v49 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
  if (v49 > (uint64_t)(*((void *)a7 + 2) - (void)v46) >> 3)
  {
    if (v49 >> 61) {
      sub_1C494A220();
    }
    uint64_t v50 = (char *)operator new(0x5555555555555558 * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3));
    *(void *)a7 = v50;
    *((void *)a7 + 1) = v50;
    *((void *)a7 + 2) = &v50[0x5555555555555558 * ((v47 - v48) >> 3)];
    if (v46)
    {
      operator delete(v46);
      uint64_t v48 = *(void *)buf;
      uint64_t v47 = *(void *)&buf[8];
    }
  }
  if (v47 != v48)
  {
    unint64_t v51 = 0;
    while (1)
    {
      unint64_t v53 = v51;
      if (0xAAAAAAAAAAAAAAABLL * ((v942 - (unsigned char *)v941) >> 3) > v51)
      {
        v54 = (char *)v941 + 24 * v51;
        memset(&v945._anon_8[16], 0, 24);
        uint64_t v56 = *(unsigned char **)v54;
        uint64_t v55 = (unsigned char *)*((void *)v54 + 1);
        unint64_t v53 = v51;
        unint64_t v57 = v55 - v56;
        if (v55 != v56)
        {
          if ((v57 & 0x8000000000000000) != 0) {
            sub_1C4A38810();
          }
          v58 = operator new(v55 - v56);
          memcpy(v58, v56, v57 & 0xFFFFFFFFFFFFFFF0);
          unint64_t v53 = v51;
          if (v57 >= 0x10) {
            unint64_t v53 = *v58;
          }
          operator delete(v58);
        }
      }
      uint64_t v60 = (char *)*((void *)a7 + 1);
      unint64_t v59 = *((void *)a7 + 2);
      if ((unint64_t)v60 >= v59) {
        break;
      }
      *(void *)uint64_t v60 = v53;
      uint64_t v52 = (uint64_t)(v60 + 8);
LABEL_29:
      *((void *)a7 + 1) = v52;
      if (++v51 >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3)) {
        goto LABEL_56;
      }
    }
    uint64_t v61 = *(char **)a7;
    uint64_t v62 = (uint64_t)&v60[-*(void *)a7];
    uint64_t v63 = v62 >> 3;
    unint64_t v64 = (v62 >> 3) + 1;
    if (v64 >> 61) {
      sub_1C494A220();
    }
    uint64_t v65 = v59 - (void)v61;
    if (v65 >> 2 > v64) {
      unint64_t v64 = v65 >> 2;
    }
    if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v66 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v66 = v64;
    }
    if (v66)
    {
      if (v66 >> 61) {
        sub_1C4949AA8();
      }
      uint64_t v67 = operator new(8 * v66);
      uint64_t v68 = (unint64_t *)&v67[8 * v63];
      unint64_t *v68 = v53;
      uint64_t v52 = (uint64_t)(v68 + 1);
      int64_t v69 = v60 - v61;
      if (v60 == v61) {
        goto LABEL_54;
      }
    }
    else
    {
      uint64_t v67 = 0;
      uint64_t v68 = (unint64_t *)(8 * v63);
      *(void *)(8 * v63) = v53;
      uint64_t v52 = 8 * v63 + 8;
      int64_t v69 = v60 - v61;
      if (v60 == v61)
      {
LABEL_54:
        *(void *)a7 = v68;
        *((void *)a7 + 1) = v52;
        *((void *)a7 + 2) = &v67[8 * v66];
        if (v61) {
          operator delete(v61);
        }
        goto LABEL_29;
      }
    }
    unint64_t v70 = v69 - 8;
    if (v70 < 0x58) {
      goto LABEL_334;
    }
    if ((unint64_t)(v60 - &v67[v62]) < 0x20) {
      goto LABEL_334;
    }
    uint64_t v71 = (v70 >> 3) + 1;
    uint64_t v72 = 8 * (v71 & 0x3FFFFFFFFFFFFFFCLL);
    uint64_t v73 = &v60[-v72];
    uint64_t v68 = (unint64_t *)((char *)v68 - v72);
    v74 = &v67[8 * v63 - 16];
    v75 = v60 - 16;
    uint64_t v76 = v71 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v77 = *(_OWORD *)v75;
      *(v74 - 1) = *((_OWORD *)v75 - 1);
      _OWORD *v74 = v77;
      v74 -= 2;
      v75 -= 32;
      v76 -= 4;
    }
    while (v76);
    uint64_t v60 = v73;
    if (v71 != (v71 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_334:
      do
      {
        unint64_t v78 = *((void *)v60 - 1);
        v60 -= 8;
        *--uint64_t v68 = v78;
      }
      while (v60 != v61);
    }
    goto LABEL_54;
  }
LABEL_56:
  int v79 = objc_msgSend_sequenceCompression(self, v41, v42, v43, v44, v45);
  int v85 = v79;
  uint64_t v87 = *(NSObject **)buf;
  uint64_t v86 = *(NSObject **)&buf[8];
  if (*(void *)buf == *(void *)&buf[8])
  {
    unint64_t v89 = 0;
  }
  else
  {
    unint64_t v88 = *(void *)&buf[8] - *(void *)buf - 24;
    if (v88 >= 0x60)
    {
      unint64_t v91 = v88 / 0x18 + 1;
      uint64_t v92 = v91 & 3;
      if ((v91 & 3) == 0) {
        uint64_t v92 = 4;
      }
      unint64_t v93 = v91 - v92;
      unint64_t v90 = (uint64_t *)(*(void *)buf + 24 * v93);
      int64x2_t v94 = 0uLL;
      uint64_t v95 = *(const double **)buf;
      int64x2_t v96 = 0uLL;
      do
      {
        uint64_t v97 = v95 + 12;
        float64x2x3_t v950 = vld3q_f64(v95);
        uint64_t v98 = v95 + 6;
        int64x2_t v94 = vsraq_n_s64(v94, vsubq_s64((int64x2_t)v950.val[1], (int64x2_t)v950.val[0]), 5uLL);
        float64x2x3_t v951 = vld3q_f64(v98);
        int64x2_t v96 = vsraq_n_s64(v96, vsubq_s64((int64x2_t)v951.val[1], (int64x2_t)v951.val[0]), 5uLL);
        uint64_t v95 = v97;
        v93 -= 4;
      }
      while (v93);
      unint64_t v89 = vaddvq_s64(vaddq_s64(v96, v94));
    }
    else
    {
      unint64_t v89 = 0;
      unint64_t v90 = *(uint64_t **)buf;
    }
    do
    {
      uint64_t v99 = *v90;
      uint64_t v100 = v90[1];
      v90 += 3;
      v89 += (v100 - v99) >> 5;
    }
    while (v90 != *(uint64_t **)&buf[8]);
  }
  unint64_t v101 = vcvtpd_u64_f64((double)v89 / (double)v79);
  memset(&v945._anon_8[16], 0, 24);
  if (v101)
  {
    if (v101 >> 61) {
      sub_1C494A220();
    }
    uint64_t v102 = (char *)operator new(8 * v101);
    unint64_t v103 = &v102[8 * v101];
    *(void *)&v945._anon_8[16] = v102;
    *(void *)&v945._anon_8[24] = v102;
    *(void *)&v945._anon_8[32] = v103;
    if (v87 != v86) {
      goto LABEL_69;
    }
LABEL_107:
    uint64_t v105 = 0;
    uint64_t v109 = v102;
    unint64_t v110 = v102;
    int64_t v137 = 0;
    unint64_t v138 = 0;
    if (!v101) {
      goto LABEL_108;
    }
LABEL_104:
    if (v110 < v103)
    {
      *(void *)unint64_t v110 = v105;
      uint64_t v102 = v110 + 8;
      goto LABEL_314;
    }
    unint64_t v171 = v138 + 1;
    if ((v138 + 1) >> 61) {
      sub_1C494A220();
    }
    if ((v103 - v109) >> 2 > v171) {
      unint64_t v171 = (v103 - v109) >> 2;
    }
    if ((unint64_t)(v103 - v109) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v172 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v172 = v171;
    }
    if (v172)
    {
      if (v172 >> 61) {
        sub_1C4949AA8();
      }
      uint64_t v173 = v105;
      v174 = operator new(8 * v172);
      v175 = &v174[8 * v138];
      v176 = &v174[8 * v172];
      void *v175 = v173;
      uint64_t v102 = (char *)(v175 + 1);
      v177 = (char *)(v110 - v109);
      if (v110 == v109) {
        goto LABEL_312;
      }
    }
    else
    {
      v174 = 0;
      v175 = (void *)(8 * v138);
      v176 = 0;
      *(void *)(8 * v138) = v105;
      uint64_t v102 = (char *)(8 * v138 + 8);
      v177 = (char *)(v110 - v109);
      if (v110 == v109) {
        goto LABEL_312;
      }
    }
    unint64_t v870 = (unint64_t)(v177 - 8);
    if (v870 >= 0x58)
    {
      if ((unint64_t)(v110 - &v174[v137]) >= 0x20)
      {
        uint64_t v872 = (v870 >> 3) + 1;
        uint64_t v873 = 8 * (v872 & 0x3FFFFFFFFFFFFFFCLL);
        v871 = &v110[-v873];
        v175 = (void *)((char *)v175 - v873);
        v874 = &v174[8 * v138 - 16];
        v875 = v110 - 16;
        uint64_t v876 = v872 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v877 = *(_OWORD *)v875;
          *(v874 - 1) = *((_OWORD *)v875 - 1);
          _OWORD *v874 = v877;
          v874 -= 2;
          v875 -= 32;
          v876 -= 4;
        }
        while (v876);
        if (v872 == (v872 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_312:
          *(void *)&v945._anon_8[16] = v175;
          *(void *)&v945._anon_8[32] = v176;
          if (v109)
          {
            v879 = v109;
            v880 = v102;
            operator delete(v879);
            uint64_t v102 = v880;
          }
LABEL_314:
          v139 = a8;
          *(void *)&v945._anon_8[24] = v102;
          v140 = *(void **)a8;
          if (*(void *)a8) {
            goto LABEL_109;
          }
          goto LABEL_110;
        }
      }
      else
      {
        v871 = v110;
      }
    }
    else
    {
      v871 = v110;
    }
    do
    {
      uint64_t v878 = *((void *)v871 - 1);
      v871 -= 8;
      *--v175 = v878;
    }
    while (v871 != v109);
    goto LABEL_312;
  }
  unint64_t v103 = 0;
  uint64_t v102 = 0;
  if (*(void *)buf == *(void *)&buf[8]) {
    goto LABEL_107;
  }
LABEL_69:
  unint64_t v894 = v101;
  unint64_t v104 = 0;
  uint64_t v105 = 0;
  unint64_t v106 = v85;
  int v107 = v85 - 1;
  uint64_t v108 = v85 - 1;
  uint64_t v109 = v102;
  unint64_t v110 = v102;
  uint64_t v904 = v107;
  obunint64_t j = v86;
  do
  {
    v112.Class isa = v87->isa;
    v111 = v87[1].isa;
    if (v111 != v87->isa)
    {
      unint64_t v113 = 0;
      os_log_t v908 = v87;
      while (1)
      {
        if (v104 % v106 != v108) {
          goto LABEL_75;
        }
        if (v110 >= v103) {
          break;
        }
        *(void *)unint64_t v110 = v105;
        uint64_t v102 = v110 + 8;
LABEL_74:
        uint64_t v105 = 0;
        v111 = v87[1].isa;
        unint64_t v110 = v102;
LABEL_75:
        ++v113;
        ++v104;
        if (v113 >= (v111 - v112.isa) >> 5) {
          goto LABEL_70;
        }
      }
      uint64_t v114 = (v110 - v109) >> 3;
      unint64_t v115 = v114 + 1;
      if ((unint64_t)(v114 + 1) >> 61)
      {
        *(void *)&v945._anon_8[32] = v103;
        *(void *)&v945._anon_8[16] = v109;
        *(void *)&v945._anon_8[24] = v102;
        sub_1C494A220();
      }
      if ((v103 - v109) >> 2 > v115) {
        unint64_t v115 = (v103 - v109) >> 2;
      }
      if ((unint64_t)(v103 - v109) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v116 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v116 = v115;
      }
      if (v116)
      {
        if (v116 >> 61)
        {
          *(void *)&v945._anon_8[32] = v103;
          *(void *)&v945._anon_8[16] = v109;
          *(void *)&v945._anon_8[24] = v102;
          sub_1C4949AA8();
        }
        unint64_t v117 = v106;
        uint64_t v118 = v105;
        v119 = v112.isa;
        unint64_t v120 = v116;
        long long v121 = (char *)operator new(8 * v116);
        v112.Class isa = v119;
        uint64_t v122 = v118;
        unint64_t v106 = v117;
        unint64_t v116 = v120;
        v123 = &v121[8 * v114];
        *(void *)v123 = v122;
        uint64_t v102 = v123 + 8;
        v124 = (char *)(v110 - v109);
        if (v110 != v109)
        {
LABEL_87:
          unint64_t v125 = (unint64_t)(v124 - 8);
          if (v125 < 0x168
            || (unint64_t v130 = (v110 - 8 - v109) & 0xFFFFFFFFFFFFFFF8, &v121[v110 - v109 - 8 - v130] > &v121[v110 - v109 - 8])
            || &v110[-v130 - 8] > v110 - 8
            || (unint64_t)(v109 - v121) < 0x20)
          {
            id v126 = v110;
            uint64_t v87 = v908;
          }
          else
          {
            uint64_t v131 = (v125 >> 3) + 1;
            uint64_t v132 = 8 * (v131 & 0x3FFFFFFFFFFFFFFCLL);
            id v126 = &v110[-v132];
            v123 -= v132;
            v133 = &v121[8 * v114 - 16];
            v134 = v110 - 16;
            uint64_t v135 = v131 & 0x3FFFFFFFFFFFFFFCLL;
            uint64_t v87 = v908;
            do
            {
              long long v136 = *(_OWORD *)v134;
              *((_OWORD *)v133 - 1) = *((_OWORD *)v134 - 1);
              *(_OWORD *)v133 = v136;
              v133 -= 32;
              v134 -= 32;
              v135 -= 4;
            }
            while (v135);
            if (v131 == (v131 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_90:
              unint64_t v103 = &v121[8 * v116];
              if (!v109)
              {
LABEL_92:
                uint64_t v109 = v123;
                uint64_t v108 = v904;
                goto LABEL_74;
              }
LABEL_91:
              uint64_t v128 = v109;
              uint64_t v129 = v102;
              operator delete(v128);
              uint64_t v102 = v129;
              v112.Class isa = v87->isa;
              goto LABEL_92;
            }
          }
          do
          {
            uint64_t v127 = *((void *)v126 - 1);
            v126 -= 8;
            *((void *)v123 - 1) = v127;
            v123 -= 8;
          }
          while (v126 != v109);
          goto LABEL_90;
        }
      }
      else
      {
        long long v121 = 0;
        v123 = (char *)(8 * v114);
        *(void *)(8 * v114) = v105;
        uint64_t v102 = (char *)(8 * v114 + 8);
        v124 = (char *)(v110 - v109);
        if (v110 != v109) {
          goto LABEL_87;
        }
      }
      uint64_t v87 = v908;
      unint64_t v103 = &v121[8 * v116];
      if (!v109) {
        goto LABEL_92;
      }
      goto LABEL_91;
    }
LABEL_70:
    ++v105;
    v87 += 3;
  }
  while (v87 != obj);
  *(void *)&v945._anon_8[32] = v103;
  *(void *)&v945._anon_8[16] = v109;
  *(void *)&v945._anon_8[24] = v102;
  int64_t v137 = v110 - v109;
  unint64_t v138 = (v110 - v109) >> 3;
  if (v138 < v894) {
    goto LABEL_104;
  }
LABEL_108:
  ++*((void *)v110 - 1);
  v139 = a8;
  v140 = *(void **)a8;
  if (*(void *)a8)
  {
LABEL_109:
    v139[1] = v140;
    operator delete(v140);
    void *v139 = 0;
    v139[1] = 0;
    v139[2] = 0;
    uint64_t v102 = *(char **)&v945._anon_8[24];
  }
LABEL_110:
  uint64_t v141 = *(void *)&v945._anon_8[32];
  void *v139 = *(void *)&v945._anon_8[16];
  v139[1] = v102;
  v139[2] = v141;
  unint64_t v944 = vcvtps_s32_f32((float)*(unint64_t *)v935 / (float)objc_msgSend_sequenceCompression(self, v80, v81, v82, v83, v84));
  v147 = objc_msgSend_model(self, v142, v143, v144, v145, v146);
  v153 = CoreHandwriting::getMLMultiArrayView((CoreHandwriting *)&v935, v148, v149, v150, v151, v152);
  v154 = sub_1C4A7BFB0(self, v153);
  id v934 = 0;
  v895 = objc_msgSend_predictionFromFeatures_options_error_(v147, v155, (uint64_t)v154, (uint64_t)v886, (uint64_t)&v934, v156);
  id v157 = v934;

  if (v939)
  {
    v940 = v939;
    operator delete(v939);
  }
  if (__p)
  {
    v938 = __p;
    operator delete(__p);
  }
  if (v935)
  {
    v936 = (char *)v935;
    operator delete(v935);
  }
  if (v947) {
    operator delete(v947);
  }
  uint64_t v158 = *(void *)buf;
  if (*(void *)buf)
  {
    uint64_t v159 = *(void *)&buf[8];
    v160 = *(void **)buf;
    if (*(void *)&buf[8] != *(void *)buf)
    {
      uint64_t v161 = *(void *)&buf[8];
      do
      {
        v163 = *(void **)(v161 - 24);
        v161 -= 24;
        v162 = v163;
        if (v163)
        {
          *(void *)(v159 - 16) = v162;
          operator delete(v162);
        }
        uint64_t v159 = v161;
      }
      while (v161 != v158);
      v160 = *(void **)buf;
    }
    *(void *)&buf[8] = v158;
    operator delete(v160);
  }
  v164 = (char *)v941;
  if (v941)
  {
    v165 = v942;
    v166 = v941;
    if (v942 != v941)
    {
      v167 = v942;
      do
      {
        v169 = (void *)*((void *)v167 - 3);
        v167 -= 24;
        v168 = v169;
        if (v169)
        {
          *((void *)v165 - 2) = v168;
          operator delete(v168);
        }
        v165 = v167;
      }
      while (v167 != v164);
      v166 = v941;
    }
    v942 = v164;
    operator delete(v166);
  }
  BOOL v170 = 1;
LABEL_216:
  if (!v895)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v282 = (id)qword_1EA3C9F98;
    if (os_log_type_enabled(v282, OS_LOG_TYPE_ERROR))
    {
      v288 = objc_msgSend_modelName(self, v283, v284, v285, v286, v287);
      objc_msgSend_localizedDescription(v157, v289, v290, v291, v292, v293);
      id v294 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v288;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v294;
      _os_log_impl(&dword_1C492D000, v282, OS_LOG_TYPE_ERROR, "An error occurred in the %@ model: %@", buf, 0x16u);
    }
    BOOL v170 = 0;
  }
  v931[0] = MEMORY[0x1E4F143A8];
  v931[1] = 3221225472;
  v931[2] = sub_1C4A7EB94;
  v931[3] = &unk_1E64E0D48;
  v931[4] = self;
  v295 = v931;
  if (qword_1EA3C8FB8 != -1) {
    dispatch_once(&qword_1EA3C8FB8, v295);
  }

  v301 = objc_msgSend_model(self, v296, v297, v298, v299, v300);
  id v930 = v157;
  id v304 = (id)objc_msgSend_predictionFromFeatures_options_error_(v301, v302, qword_1EA3C8FC0, (uint64_t)v886, (uint64_t)&v930, v303);
  id v884 = v930;

  if (v170)
  {
    v310 = objc_msgSend_outputNames(self, v305, v306, v307, v308, v309);
    v316 = objc_msgSend_firstObject(v310, v311, v312, v313, v314, v315);
    v321 = objc_msgSend_featureValueForName_(v895, v317, (uint64_t)v316, v318, v319, v320);
    v327 = objc_msgSend_multiArrayValue(v321, v322, v323, v324, v325, v326);

    v928[0] = MEMORY[0x1E4F143A8];
    v928[1] = 3221225472;
    v928[2] = nullsub_30;
    v928[3] = &unk_1E64E3088;
    id v888 = v327;
    id v929 = v888;
    v881 = (void *)MEMORY[0x1C8786E90](v928);
    long long v926 = 0u;
    long long v927 = 0u;
    long long v924 = 0u;
    long long v925 = 0u;
    v333 = objc_msgSend_outputNames(self, v328, v329, v330, v331, v332);
    id obja = v333;
    uint64_t v336 = objc_msgSend_countByEnumeratingWithState_objects_count_(v333, v334, (uint64_t)&v924, (uint64_t)&v945._drawing.strokes.__end_cap_, 16, v335);
    id v341 = 0;
    if (v336)
    {
      uint64_t v900 = *(void *)v925;
      do
      {
        uint64_t v905 = v336;
        for (uint64_t k = 0; k != v905; ++k)
        {
          if (*(void *)v925 != v900) {
            objc_enumerationMutation(obja);
          }
          v343 = *(void **)(*((void *)&v924 + 1) + 8 * k);
          if (objc_msgSend_isEqualToString_(v343, v337, @"output_topk_indices", v338, v339, v340))
          {
            v344 = objc_msgSend_featureValueForName_(v895, v337, (uint64_t)v343, v338, v339, v340);
            v350 = objc_msgSend_multiArrayValue(v344, v345, v346, v347, v348, v349);

            v922[0] = MEMORY[0x1E4F143A8];
            v922[1] = 3221225472;
            v922[2] = nullsub_31;
            v922[3] = &unk_1E64E3088;
            id v341 = v350;
            id v923 = v341;
            os_log_t v910 = (os_log_t)MEMORY[0x1C8786E90](v922);
            v356 = objc_msgSend_shape(v341, v351, v352, v353, v354, v355);
            LODWORD(v344) = (unint64_t)objc_msgSend_count(v356, v357, v358, v359, v360, v361) > 2;

            if (v344)
            {
              v367 = objc_msgSend_shape(v341, v362, v363, v364, v365, v366);
              BOOL v373 = objc_msgSend_count(v367, v368, v369, v370, v371, v372) == 3;

              if (v373)
              {
                id v379 = objc_alloc(MEMORY[0x1E4F1E9A8]);
                id v380 = v341;
                uint64_t v386 = objc_msgSend_dataPointer(v380, v381, v382, v383, v384, v385);
                objc_msgSend_shape(v380, v387, v388, v389, v390, v391);
                os_log_t loga = (os_log_t)objc_claimAutoreleasedReturnValue();
                v892 = objc_msgSend_objectAtIndexedSubscript_(loga, v392, 1, v393, v394, v395);
                v945._drawing.strokes.__begin_ = v892;
                v890 = objc_msgSend_shape(v380, v396, v397, v398, v399, v400);
                v405 = objc_msgSend_objectAtIndexedSubscript_(v890, v401, 2, v402, v403, v404);
                v945._drawing.strokes.__end_ = v405;
                v409 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v406, (uint64_t)&v945._drawing.strokes, 2, v407, v408);
                uint64_t v415 = objc_msgSend_dataType(v380, v410, v411, v412, v413, v414);
                v421 = objc_msgSend_shape(v380, v416, v417, v418, v419, v420);
                objc_msgSend_objectAtIndexedSubscript_(v421, v422, 2, v423, v424, v425);
                v426 = (double *)objc_claimAutoreleasedReturnValue();
                v945._drawing.endTimes.__end_ = v426;
                v945._drawing.endTimes.__end_cap_.__value_ = (double *)&unk_1F203E640;
                v430 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v427, (uint64_t)&v945._drawing.endTimes.__end_, 2, v428, v429);
                id v921 = 0;
                id v341 = (id)objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v379, v431, v386, (uint64_t)v409, v415, (uint64_t)v430, v910, &v921);
                id v432 = v921;
              }
              else
              {
                v433 = objc_msgSend_shape(v341, v374, v375, v376, v377, v378);
                BOOL v439 = objc_msgSend_count(v433, v434, v435, v436, v437, v438) == 5;

                if (v439)
                {
                  id v440 = objc_alloc(MEMORY[0x1E4F1E9A8]);
                  id v441 = v341;
                  uint64_t v447 = objc_msgSend_dataPointer(v441, v442, v443, v444, v445, v446);
                  objc_msgSend_shape(v441, v448, v449, v450, v451, v452);
                  os_log_t loga = (os_log_t)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectAtIndexedSubscript_(loga, v453, 3, v454, v455, v456);
                  v893 = (double *)objc_claimAutoreleasedReturnValue();
                  v945._drawing.startTimes.__end_cap_.__value_ = v893;
                  v891 = objc_msgSend_shape(v441, v457, v458, v459, v460, v461);
                  objc_msgSend_objectAtIndexedSubscript_(v891, v462, 4, v463, v464, v465);
                  v466 = (double *)objc_claimAutoreleasedReturnValue();
                  v945._drawing.endTimes.__begin_ = v466;
                  v470 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v467, (uint64_t)&v945._drawing.startTimes.__end_cap_, 2, v468, v469);
                  uint64_t v476 = objc_msgSend_dataType(v441, v471, v472, v473, v474, v475);
                  v482 = objc_msgSend_shape(v441, v477, v478, v479, v480, v481);
                  objc_msgSend_objectAtIndexedSubscript_(v482, v483, 4, v484, v485, v486);
                  v487 = (double *)objc_claimAutoreleasedReturnValue();
                  v945._drawing.startTimes.__begin_ = v487;
                  v945._drawing.startTimes.__end_ = (double *)&unk_1F203E640;
                  v491 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v488, (uint64_t)&v945._drawing.startTimes, 2, v489, v490);
                  id v920 = 0;
                  id v341 = (id)objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v440, v492, v447, (uint64_t)v470, v476, (uint64_t)v491, v910, &v920);
                  id v432 = v920;
                }
                else
                {
                  if (qword_1EA3CA000 != -1) {
                    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                  }
                  os_log_t loga = (os_log_t)(id)qword_1EA3C9F98;
                  if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
                  {
                    v498 = objc_msgSend_shape(v341, v493, v494, v495, v496, v497);
                    uint64_t v504 = objc_msgSend_count(v498, v499, v500, v501, v502, v503);
                    *(_DWORD *)buf = 134217984;
                    *(void *)&uint8_t buf[4] = v504;
                    _os_log_impl(&dword_1C492D000, loga, OS_LOG_TYPE_ERROR, "Unexpect rank of the CoreML output array: %lu", buf, 0xCu);
                  }
                  id v432 = 0;
                }
              }

              if (!v341)
              {
                if (qword_1EA3CA000 != -1) {
                  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                }
                v505 = (id)qword_1EA3C9F98;
                if (os_log_type_enabled(v505, OS_LOG_TYPE_ERROR))
                {
                  v511 = objc_msgSend_localizedDescription(v432, v506, v507, v508, v509, v510);
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v511;
                  _os_log_impl(&dword_1C492D000, v505, OS_LOG_TYPE_ERROR, "An error occurred in defining a new shape for the output: %@", buf, 0xCu);
                }
              }
            }
          }
        }
        v333 = obja;
        uint64_t v336 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v337, (uint64_t)&v924, (uint64_t)&v945._drawing.strokes.__end_cap_, 16, v340);
      }
      while (v336);
    }

    v517 = objc_msgSend_shape(v888, v512, v513, v514, v515, v516);
    BOOL v523 = objc_msgSend_count(v517, v518, v519, v520, v521, v522) == 1;

    if (v523)
    {
      id v529 = objc_alloc(MEMORY[0x1E4F1E9A8]);
      id v530 = v888;
      uint64_t v536 = objc_msgSend_dataPointer(v530, v531, v532, v533, v534, v535);
      v945._drawing.strokeBoundsValidity.__size_ = (unint64_t)&unk_1F203E640;
      objc_msgSend_shape(v530, v537, v538, v539, v540, v541);
      os_log_t v911 = (os_log_t)objc_claimAutoreleasedReturnValue();
      v547 = objc_msgSend_firstObject(v911, v542, v543, v544, v545, v546);
      v945._drawing.strokeBoundsValidity.__cap_alloc_.__value_ = (unint64_t)v547;
      v551 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v548, (uint64_t)&v945._drawing.strokeBoundsValidity.__size_, 2, v549, v550);
      uint64_t v557 = objc_msgSend_dataType(v530, v552, v553, v554, v555, v556);
      v563 = objc_msgSend_shape(v530, v558, v559, v560, v561, v562);
      v569 = objc_msgSend_firstObject(v563, v564, v565, v566, v567, v568);
      v945._drawing.strokeBounds.__end_cap_.__value_ = v569;
      v945._drawing.strokeBoundsValidity.__begin_ = (unint64_t *)&unk_1F203E640;
      v573 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v570, (uint64_t)&v945._drawing.strokeBounds.__end_cap_, 2, v571, v572);
      id v919 = 0;
      id v888 = (id)objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v529, v574, v536, (uint64_t)v551, v557, (uint64_t)v573, v881, &v919);
      id v575 = v919;

      if (!v888)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v576 = (id)qword_1EA3C9F98;
        if (os_log_type_enabled(v576, OS_LOG_TYPE_ERROR))
        {
          v582 = objc_msgSend_localizedDescription(v575, v577, v578, v579, v580, v581);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v582;
          _os_log_impl(&dword_1C492D000, v576, OS_LOG_TYPE_ERROR, "An error occurred in defining a new shape for the output: %@", buf, 0xCu);
        }
      }
    }
    v583 = objc_msgSend_shape(v888, v524, v525, v526, v527, v528);
    BOOL v589 = (unint64_t)objc_msgSend_count(v583, v584, v585, v586, v587, v588) > 2;

    if (v589)
    {
      v595 = objc_msgSend_shape(v888, v590, v591, v592, v593, v594);
      BOOL v601 = objc_msgSend_count(v595, v596, v597, v598, v599, v600) == 3;

      if (v601)
      {
        id v607 = objc_alloc(MEMORY[0x1E4F1E9A8]);
        id v608 = v888;
        uint64_t v614 = objc_msgSend_dataPointer(v608, v609, v610, v611, v612, v613);
        objc_msgSend_shape(v608, v615, v616, v617, v618, v619);
        os_log_t v912 = (os_log_t)objc_claimAutoreleasedReturnValue();
        v906 = objc_msgSend_objectAtIndexedSubscript_(v912, v620, 1, v621, v622, v623);
        v945._drawing.strokeBounds.__begin_ = v906;
        v901 = objc_msgSend_shape(v608, v624, v625, v626, v627, v628);
        v633 = objc_msgSend_objectAtIndexedSubscript_(v901, v629, 2, v630, v631, v632);
        v945._drawing.strokeBounds.__end_ = v633;
        v637 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v634, (uint64_t)&v945._drawing, 2, v635, v636);
        uint64_t v643 = objc_msgSend_dataType(v608, v638, v639, v640, v641, v642);
        v649 = objc_msgSend_shape(v608, v644, v645, v646, v647, v648);
        v654 = objc_msgSend_objectAtIndexedSubscript_(v649, v650, 2, v651, v652, v653);
        *(void *)&v945._anon_8[104] = v654;
        *(void *)&v945._anon_8[112] = &unk_1F203E640;
        v658 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v655, (uint64_t)&v945._anon_8[104], 2, v656, v657);
        id v918 = 0;
        id v888 = (id)objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v607, v659, v614, (uint64_t)v637, v643, (uint64_t)v658, v881, &v918);
        id v660 = v918;
      }
      else
      {
        v662 = objc_msgSend_shape(v888, v602, v603, v604, v605, v606);
        BOOL v668 = objc_msgSend_count(v662, v663, v664, v665, v666, v667) == 5;

        if (v668)
        {
          id v669 = objc_alloc(MEMORY[0x1E4F1E9A8]);
          id v670 = v888;
          uint64_t v676 = objc_msgSend_dataPointer(v670, v671, v672, v673, v674, v675);
          objc_msgSend_shape(v670, v677, v678, v679, v680, v681);
          os_log_t v912 = (os_log_t)objc_claimAutoreleasedReturnValue();
          *(void *)&v945._anon_8[88] = objc_msgSend_objectAtIndexedSubscript_(v912, v682, 3, v683, v684, v685);
          v902 = *(void **)&v945._anon_8[88];
          v907 = objc_msgSend_shape(v670, v686, v687, v688, v689, v690);
          v695 = objc_msgSend_objectAtIndexedSubscript_(v907, v691, 4, v692, v693, v694);
          *(void *)&v945._anon_8[96] = v695;
          v699 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v696, (uint64_t)&v945._anon_8[88], 2, v697, v698);
          uint64_t v705 = objc_msgSend_dataType(v670, v700, v701, v702, v703, v704);
          v711 = objc_msgSend_shape(v670, v706, v707, v708, v709, v710);
          v716 = objc_msgSend_objectAtIndexedSubscript_(v711, v712, 4, v713, v714, v715);
          *(void *)&v945._anon_8[72] = v716;
          *(void *)&v945._anon_8[80] = &unk_1F203E640;
          v720 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v717, (uint64_t)&v945._anon_8[72], 2, v718, v719);
          id v917 = 0;
          id v888 = (id)objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v669, v721, v676, (uint64_t)v699, v705, (uint64_t)v720, v881, &v917);
          id v660 = v917;
        }
        else
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          os_log_t v912 = (os_log_t)(id)qword_1EA3C9F98;
          if (os_log_type_enabled(v912, OS_LOG_TYPE_ERROR))
          {
            v727 = objc_msgSend_shape(v888, v722, v723, v724, v725, v726);
            uint64_t v733 = objc_msgSend_count(v727, v728, v729, v730, v731, v732);
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v733;
            _os_log_impl(&dword_1C492D000, v912, OS_LOG_TYPE_ERROR, "Unexpect rank of the CoreML output array: %lu", buf, 0xCu);
          }
          id v660 = 0;
        }
      }

      if (!v888)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v734 = (id)qword_1EA3C9F98;
        if (os_log_type_enabled(v734, OS_LOG_TYPE_ERROR))
        {
          v740 = objc_msgSend_localizedDescription(v660, v735, v736, v737, v738, v739);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v740;
          _os_log_impl(&dword_1C492D000, v734, OS_LOG_TYPE_ERROR, "An error occurred in defining a new shape for the output: %@", buf, 0xCu);
        }
      }
    }
    v741 = objc_msgSend_shape(v888, v590, v591, v592, v593, v594);
    v746 = objc_msgSend_objectAtIndexedSubscript_(v741, v742, 0, v743, v744, v745);
    v752 = objc_msgSend_integerValue(v746, v747, v748, v749, v750, v751);

    if ((void *)v944 != v752)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v753 = (id)qword_1EA3C9F98;
      if (os_log_type_enabled(v753, OS_LOG_TYPE_ERROR))
      {
        v759 = objc_msgSend_modelName(self, v754, v755, v756, v757, v758);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v759;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v944;
        *(_WORD *)&buf[22] = 2048;
        v947 = v752;
        _os_log_impl(&dword_1C492D000, v753, OS_LOG_TYPE_ERROR, "Error in model %@. Expected output length: %lu, actual output length: %lu", buf, 0x20u);
      }
    }
    if (v888)
    {
      id v760 = objc_alloc(MEMORY[0x1E4F56748]);
      if (v341)
      {
        stringCodeMap = self->__stringCodeMap;
        blankIndedouble x = self->_blankIndex;
        long long v913 = *(_OWORD *)&self->_decodingPruningPolicy.strategy;
        uint64_t v914 = *(void *)&self->_decodingPruningPolicy.maxNumberOfCandidates;
        uint64_t v764 = objc_msgSend_initWithMultiArray_indexArray_domainType_characterObservations_blankIndex_pruningPolicy_(v760, v761, (uint64_t)v888, (uint64_t)v341, 1, (uint64_t)stringCodeMap, blankIndex, &v913);
      }
      else
      {
        v766 = self->__stringCodeMap;
        int64_t v767 = self->_blankIndex;
        long long v915 = *(_OWORD *)&self->_decodingPruningPolicy.strategy;
        uint64_t v916 = *(void *)&self->_decodingPruningPolicy.maxNumberOfCandidates;
        uint64_t v764 = objc_msgSend_initWithMultiArray_domainType_characterObservations_blankIndex_pruningPolicy_(v760, v761, (uint64_t)v888, 1, (uint64_t)v766, v767, &v915);
      }
      v765 = v764;
      v768 = [CHActivationMatrix alloc];
      v661 = objc_msgSend_initWithActivations_(v768, v769, (uint64_t)v765, v770, v771, v772);
      v778 = objc_msgSend_modelName(self, v773, v774, v775, v776, v777);
      v784 = objc_msgSend_modelNameLatin(CHRecognizerConfiguration, v779, v780, v781, v782, v783);
      char isEqualToString = objc_msgSend_isEqualToString_(v778, v785, (uint64_t)v784, v786, v787, v788);

      if ((isEqualToString & 1) == 0)
      {
        objc_msgSend_skipLatinActivationThreshold(CHRecognizerConfiguration, v790, v791, v792, v793, v794);
        double v796 = v795;
        v802 = objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E4F28B88], v797, v798, v799, v800, v801);
        int v805 = objc_msgSend_reachesActivationThreshold_inCharacterSet_resultArray_indexArray_(self, v803, (uint64_t)v802, (uint64_t)v888, (uint64_t)v341, v804, v796);
        objc_msgSend_setUnlikelyHasLatinContents_(v661, v806, v805 ^ 1u, v807, v808, v809);
      }
    }
    else
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v765 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v765, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v765, OS_LOG_TYPE_FAULT, "Unable to initialize resultArray and create activation matrix.", buf, 2u);
      }
      v661 = 0;
    }

    if (v885) {
      objc_msgSend_updateActivationsWithActiveCharacterSet_resultArray_indexArray_(self, v810, (uint64_t)v885, (uint64_t)v888, (uint64_t)v341, v811);
    }
    if (a9)
    {
      objc_msgSend_highestSymbolActivationWithResultArray_indexArray_symbol_(self, v810, (uint64_t)v888, (uint64_t)v341, (uint64_t)a9, v811);
      if (a10) {
        *(void *)a10 = v812;
      }
    }
  }
  else
  {
    v661 = 0;
  }
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v305, v306, v307, v308, v309);
  double v814 = v813;
  v820 = objc_msgSend_model(self, v815, v816, v817, v818, v819);
  v826 = objc_msgSend_modelKey(v820, v821, v822, v823, v824, v825);
  uint64_t v831 = objc_msgSend_powerLogModelNameForModelKey_(CHSingletonMLModel, v827, (uint64_t)v826, v828, v829, v830);

  *(void *)&v945._anon_8[40] = @"inputStrokeCount";
  v832 = NSNumber;
  uint64_t v838 = objc_msgSend_strokeCount(v887, v833, v834, v835, v836, v837);
  v843 = objc_msgSend_numberWithUnsignedInteger_(v832, v839, v838, v840, v841, v842);
  *(void *)&v945._anon_8[56] = v843;
  *(void *)&v945._anon_8[48] = @"outputActivationCount";
  v844 = NSNumber;
  v850 = objc_msgSend_activations(v661, v845, v846, v847, v848, v849);
  uint64_t v856 = objc_msgSend_timestepCount(v850, v851, v852, v853, v854, v855);
  v861 = objc_msgSend_numberWithInteger_(v844, v857, v856, v858, v859, v860);
  *(void *)&v945._anon_8[64] = v861;
  v864 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v862, (uint64_t)&v945._anon_8[56], (uint64_t)&v945._anon_8[40], 2, v863);

  objc_msgSend_logModelInference_startTimestamp_endTimestamp_data_(self->_powerLogger, v865, v831, (uint64_t)v864, v866, v867, v25, v814);
  id v868 = v661;

  return v868;
}

- (void)enumerateActivationsInResultArray:(id)a3 indexArray:(id)a4 block:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, __int16 *, char *))a5;
  id v10 = v7;
  uint64_t v16 = objc_msgSend_dataPointer(v10, v11, v12, v13, v14, v15);
  uint64_t v22 = objc_msgSend_shape(v10, v17, v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_objectAtIndexedSubscript_(v22, v23, 0, v24, v25, v26);
  uint64_t v70 = objc_msgSend_integerValue(v27, v28, v29, v30, v31, v32);

  uint64_t v38 = objc_msgSend_shape(v10, v33, v34, v35, v36, v37);
  int64_t v69 = v10;
  uint64_t v43 = objc_msgSend_objectAtIndexedSubscript_(v38, v39, 1, v40, v41, v42);
  uint64_t v49 = objc_msgSend_integerValue(v43, v44, v45, v46, v47, v48);

  HIBYTE(v71) = 0;
  if (v70 >= 1 && v49 >= 1)
  {
    if (v8)
    {
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v52 = 4 * v49;
      do
      {
        uint64_t v54 = 0;
        uint64_t v55 = v16;
        while (1)
        {
          id v56 = v8;
          uint64_t v62 = (uint64_t)*(float *)(objc_msgSend_dataPointer(v56, v57, v58, v59, v60, v61) + v50 + 4 * v54);
          LOBYTE(v71) = 0;
          v9[2](v9, v51, v54, v55, v62, &v71, (char *)&v71 + 1);
          BOOL v63 = HIBYTE(v71) == 0;
          if (v71) {
            break;
          }
          ++v54;
          v55 += 4;
          if (v49 == v54)
          {
            BOOL v63 = 1;
            break;
          }
        }
        ++v51;
        v16 += v52;
        v50 += v52;
      }
      while (v63 && v51 < v70);
    }
    else
    {
      uint64_t v64 = 0;
      do
      {
        uint64_t v66 = 0;
        uint64_t v67 = v16;
        while (1)
        {
          LOBYTE(v71) = 0;
          v9[2](v9, v64, v66, v67, (uint64_t)(float)v66, &v71, (char *)&v71 + 1);
          BOOL v68 = HIBYTE(v71) == 0;
          if (v71) {
            break;
          }
          ++v66;
          v67 += 4;
          if (v49 == v66)
          {
            BOOL v68 = 1;
            break;
          }
        }
        ++v64;
        v16 += 4 * v49;
      }
      while (v68 && v64 < v70);
    }
  }
}

- (BOOL)reachesActivationThreshold:(double)a3 inCharacterSet:(id)a4 resultArray:(id)a5 indexArray:(id)a6
{
  id v10 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = (double *)&v21;
  uint64_t v23 = 0x2020000000;
  unint64_t v24 = 0xC05F800000000000;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C4A7F1C8;
  v15[3] = &unk_1E64E30B0;
  v15[4] = self;
  id v16 = v10;
  double v19 = a3;
  uint64_t v17 = v20;
  uint64_t v18 = &v21;
  id v11 = v10;
  objc_msgSend_enumerateActivationsInResultArray_indexArray_block_(self, v12, (uint64_t)a5, (uint64_t)a6, (uint64_t)v15, v13);
  LOBYTE(a6) = v22[3] >= a3;

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);
  return (char)a6;
}

- (double)highestSymbolActivationWithResultArray:(id)a3 indexArray:(id)a4 symbol:(id *)a5
{
  uint64_t v20 = 0;
  uint64_t v21 = (double *)&v20;
  uint64_t v22 = 0x2020000000;
  unint64_t v23 = 0xC05F800000000000;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4A7F3DC;
  v14[3] = &unk_1E64E30D8;
  v14[4] = self;
  v14[5] = v19;
  v14[6] = &v20;
  v14[7] = &v15;
  objc_msgSend_enumerateActivationsInResultArray_indexArray_block_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)v14, v5);
  if (a5)
  {
    unicodeToNSString(*((_DWORD *)v16 + 6), v7, v8, v9, v10, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v12 = v21[3];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v20, 8);
  return v12;
}

- (void)updateActivationsWithActiveCharacterSet:(id)a3 resultArray:(id)a4 indexArray:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0;
  id v16 = objc_msgSend_shape(v9, v11, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(v16, v17, 1, v18, v19, v20);
  uint64_t v27 = objc_msgSend_integerValue(v21, v22, v23, v24, v25, v26);

  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x4812000000;
  v40[3] = sub_1C4A7F784;
  v40[4] = sub_1C4A7F7A8;
  v40[5] = &unk_1C4CB5C62;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  __p = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1C4A7F7C0;
  v34[3] = &unk_1E64E3100;
  uint64_t v36 = v45;
  uint64_t v37 = v44;
  v34[4] = self;
  id v28 = v8;
  uint64_t v38 = v40;
  uint64_t v39 = v27;
  id v35 = v28;
  objc_msgSend_enumerateActivationsInResultArray_indexArray_block_(self, v29, (uint64_t)v9, (uint64_t)v10, (uint64_t)v34, v30);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1C4A7FA60;
  v33[3] = &unk_1E64E3128;
  v33[4] = self;
  v33[5] = v40;
  objc_msgSend_enumerateActivationsInResultArray_indexArray_block_(self, v31, (uint64_t)v9, (uint64_t)v10, (uint64_t)v33, v32);

  _Block_object_dispose(v40, 8);
  if (__p)
  {
    uint64_t v42 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v45, 8);
}

- (id)_extractFeaturesFromDrawing:(id)a3 inputName:(id)a4 interpointDistance:(double)a5 error:(id *)a6
{
  id v6 = sub_1C4A7B6E8(self, a3, a4, 1, 1, a6, 0.0, 0.0);
  return v6;
}

- (int64_t)sequenceCompression
{
  return self->_sequenceCompression;
}

- (int64_t)distanceFeatureIndex
{
  return self->_distanceFeatureIndex;
}

- (int64_t)sinAlphaFeatureIndex
{
  return self->_sinAlphaFeatureIndex;
}

- (int64_t)cosAlphaFeatureIndex
{
  return self->_cosAlphaFeatureIndex;
}

- (int64_t)gapFeatureIndex
{
  return self->_gapFeatureIndex;
}

- (NSString)directionalFeaturesInputName
{
  return self->_directionalFeaturesInputName;
}

- (NSString)characterProbabilityOutputName
{
  return self->_characterProbabilityOutputName;
}

- (CHCodeMap)codeMap
{
  return self->_codeMap;
}

- (int64_t)blankIndex
{
  return self->_blankIndex;
}

- (int64_t)spaceIndex
{
  return self->_spaceIndex;
}

- (int64_t)pseudospaceIndex
{
  return self->_pseudospaceIndex;
}

- (BOOL)normalizeFeatures
{
  return self->_normalizeFeatures;
}

- (void)setNormalizeFeatures:(BOOL)a3
{
  self->_normalizeFeatures = a3;
}

- (double)distMean
{
  return self->_distMean;
}

- (void)setDistMean:(double)a3
{
  self->_distMean = a3;
}

- (double)distStd
{
  return self->_distStd;
}

- (void)setDistStd:(double)a3
{
  self->_distStd = a3;
}

- (double)interpointDistance
{
  return self->_interpointDistance;
}

- (unint64_t)strokeOrdering
{
  return self->_strokeOrdering;
}

- (void)setStrokeOrdering:(unint64_t)a3
{
  self->_unint64_t strokeOrdering = a3;
}

- (BOOL)shouldUseCPPFeatureExtraction
{
  return self->_shouldUseCPPFeatureExtraction;
}

- (BOOL)shouldUseArabicVisualOrderFeatureExtraction
{
  return self->_shouldUseArabicVisualOrderFeatureExtraction;
}

- (BOOL)shouldUseStrokeDirectionFeature
{
  return self->_shouldUseStrokeDirectionFeature;
}

- (CVNLPTextDecodingPruningPolicy)decodingPruningPolicy
{
  *retstr = *(CVNLPTextDecodingPruningPolicy *)((char *)self + 224);
  return self;
}

- (void)setDecodingPruningPolicy:(CVNLPTextDecodingPruningPolicy *)a3
{
  uint64_t v3 = *(void *)&a3->maxNumberOfCandidates;
  *(_OWORD *)&self->_decodingPruningPolicy.strategdouble y = *(_OWORD *)&a3->strategy;
  *(void *)&self->_decodingPruningPolicy.maxNumberOfCandidates = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__stringCodeMap, 0);
  objc_storeStrong((id *)&self->_characterProbabilityOutputName, 0);
  objc_storeStrong((id *)&self->_directionalFeaturesInputName, 0);
  objc_storeStrong((id *)&self->_powerLogger, 0);
  value = self->_featureExtractor.__ptr_.__value_;
  self->_featureExtractor.__ptr_.__value_ = 0;
  if (value)
  {
    objc_super v4 = *(void **)value;
    if (*(void *)value)
    {
      uint64_t v5 = (void *)*((void *)value + 1);
      id v6 = *(void **)value;
      if (v5 != v4)
      {
        do
        {
          uint64_t v8 = *--v5;
          uint64_t v7 = v8;
          *uint64_t v5 = 0;
          if (v8) {
            (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
          }
        }
        while (v5 != v4);
        id v6 = *(void **)value;
      }
      *((void *)value + 1) = v4;
      operator delete(v6);
    }
    MEMORY[0x1C8786460](value, 0x20C40960023A9);
  }
  id v9 = self->_preprocessor.__ptr_.__value_;
  self->_preprocessor.__ptr_.__value_ = 0;
  if (v9)
  {
    id v10 = *(void **)v9;
    if (*(void *)v9)
    {
      uint64_t v11 = (void *)*((void *)v9 + 1);
      uint64_t v12 = *(void **)v9;
      if (v11 != v10)
      {
        do
        {
          uint64_t v14 = *--v11;
          uint64_t v13 = v14;
          *uint64_t v11 = 0;
          if (v14) {
            (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
          }
        }
        while (v11 != v10);
        uint64_t v12 = *(void **)v9;
      }
      *((void *)v9 + 1) = v10;
      operator delete(v12);
    }
    JUMPOUT(0x1C8786460);
  }
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  return self;
}

@end