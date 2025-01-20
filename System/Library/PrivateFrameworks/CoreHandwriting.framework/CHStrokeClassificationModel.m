@interface CHStrokeClassificationModel
+ (CHStrokeClassificationModel)modelWithModelName:(id)a3;
+ (id)localesFromModelPrediction:()vector<std:(std:(int64_t)a4 :(int64_t)a5 allocator<std:(id)a6 :vector<float>>> *)a3 :vector<float> maxNumberOfLocales:numberOfOutputClass:scriptCodeMap:;
- (BOOL)_isContentStroke:(int64_t)a3 withinSubtile:(int64_t)a4 withRange:(_NSRange)a5 ofTotal:(int64_t)a6;
- (BOOL)classifyStrokes:(id)a3 outStrokeClassProbabilities:(void *)a4 cancellationBlock:(id)a5;
- (BOOL)classifyStrokes:(id)a3 outTextStrokeProbabilities:(void *)a4 cancellationBlock:(id)a5;
- (NSArray)modelConfigurationsNumPoints;
- (NSArray)modelConfigurationsNumStrokes;
- (NSArray)scriptCodeMap;
- (NSDictionary)codeScriptDictionary;
- (NSDictionary)scriptCodeDictionary;
- (NSIndexSet)textLTRClassIndexes;
- (NSIndexSet)textRTLClassIndexes;
- (NSString)modelSmallestConfig;
- (double)interpointDistance;
- (id).cxx_construct;
- (id)_extractFeaturesFromDrawing:(id)a3 numStrokes:(unint64_t)a4 numPoints:(unint64_t)a5 error:(id *)a6;
- (id)_subTilesForStrokeCount:(int64_t)a3;
- (id)predictedScriptsForDrawing:(id)a3 maxNumberOfLocales:(int64_t)a4;
- (int64_t)contextMaxStrokes;
- (int64_t)cosAngleFeatureIndex;
- (int64_t)distanceFeatureIndex;
- (int64_t)maxInputWidth;
- (int64_t)maxNumberOfInputStrokes;
- (int64_t)maxPointsPerStroke;
- (int64_t)maxStrokeHeight;
- (int64_t)minPointsPerStroke;
- (int64_t)modelDecoderSize;
- (int64_t)nontextClassIndex;
- (int64_t)numInputFeatures;
- (int64_t)numOutputClasses;
- (int64_t)recognitionMaxStrokes;
- (int64_t)sinAngleFeatureIndex;
- (int64_t)weakLabelIndex;
- (void)dealloc;
@end

@implementation CHStrokeClassificationModel

+ (CHStrokeClassificationModel)modelWithModelName:(id)a3
{
  id v3 = a3;
  self;
  if (qword_1EA3C8F58 != -1) {
    dispatch_once(&qword_1EA3C8F58, &unk_1F2012D90);
  }
  v4 = qword_1EA3C8F40;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4AB13D0;
  block[3] = &unk_1E64E0D48;
  id v10 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
  v6 = (void *)qword_1EA3C8F48;
  if (qword_1EA3C8F48) {
    ++*(void *)(qword_1EA3C8F48 + 32);
  }
  v7 = v6;

  return v7;
}

- (void)dealloc
{
  id v3 = (void *)qword_1EA3C8F48;
  if (qword_1EA3C8F48)
  {
    uint64_t v4 = *(void *)(qword_1EA3C8F48 + 32) - 1;
    *(void *)(qword_1EA3C8F48 + 32) = v4;
    if (!v4)
    {
      model = (void **)self->_model;
      if (model)
      {
        CoreHandwriting::EspressoModelWrapper::~EspressoModelWrapper(model);
        MEMORY[0x1C8786460]();
        id v3 = (void *)qword_1EA3C8F48;
      }
      self->_model = 0;
      self->_codeMap.__ptr_.__value_ = 0;
      qword_1EA3C8F48 = 0;

      objc_msgSend_logModelUnloaded_((void *)qword_1EA3C8F50, v6, 0, v7, v8, v9);
      id v10 = (void *)qword_1EA3C8F50;
      qword_1EA3C8F50 = 0;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CHStrokeClassificationModel;
  [(CHStrokeClassificationModel *)&v11 dealloc];
}

- (id)_extractFeaturesFromDrawing:(id)a3 numStrokes:(unint64_t)a4 numPoints:(unint64_t)a5 error:(id *)a6
{
  v139[4] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (objc_msgSend_pointCount(v10, v11, v12, v13, v14, v15))
  {
    objc_msgSend_bounds(v10, v16, v17, v18, v19, v20);
    double v22 = v21;
    double v24 = v23;
  }
  else
  {
    double v22 = *MEMORY[0x1E4F1DAD8];
    double v24 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  id v25 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  v139[0] = &unk_1F203EEB0;
  v30 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v26, a4, v27, v28, v29);
  v139[1] = v30;
  v35 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v31, a5, v32, v33, v34);
  v139[2] = v35;
  v36 = NSNumber;
  uint64_t v42 = objc_msgSend_numInputFeatures(self, v37, v38, v39, v40, v41);
  v47 = objc_msgSend_numberWithInteger_(v36, v43, v42, v44, v45, v46);
  v139[3] = v47;
  v51 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v48, (uint64_t)v139, 4, v49, v50);
  id v134 = 0;
  v54 = objc_msgSend_initWithShape_dataType_error_(v25, v52, (uint64_t)v51, 65568, (uint64_t)&v134, v53);
  id v133 = v134;

  if (v54)
  {
    objc_msgSend_fillWithNumber_(v54, v55, (uint64_t)&unk_1F203F480, v56, v57, v58);
    id v59 = v54;
    uint64_t v70 = objc_msgSend_dataPointer(v59, v60, v61, v62, v63, v64);
    uint64_t v71 = 0;
    for (unint64_t i = 0; i < objc_msgSend_strokeCount(v10, v65, v66, v67, v68, v69, v133); ++i)
    {
      unint64_t v77 = 0;
      double v78 = v24;
      double v79 = v22;
      while (v77 < objc_msgSend_pointCountForStrokeIndex_(v10, v73, i, v74, v75, v76))
      {
        objc_msgSend_pointForStrokeIndex_pointIndex_(v10, v65, i, v77, v68, v69);
        double v81 = v80;
        double v83 = v82;
        uint64_t v89 = objc_msgSend_numInputFeatures(self, v84, v85, v86, v87, v88);
        uint64_t v95 = objc_msgSend_distanceFeatureIndex(self, v90, v91, v92, v93, v94);
        double v96 = v81 - v79;
        double v97 = v83 - v78;
        double v98 = sqrt(v97 * v97 + v96 * v96);
        unint64_t v99 = v89 * (v71 + v77);
        float v100 = v98;
        *(float *)(v70 + 4 * (v95 + v99)) = v100;
        uint64_t v106 = objc_msgSend_sinAngleFeatureIndex(self, v101, v102, v103, v104, v105);
        double v112 = v97 / v98;
        if (v98 == 0.0) {
          double v112 = 0.0;
        }
        float v113 = v112;
        *(float *)(v70 + 4 * (v106 + v99)) = v113;
        uint64_t v114 = objc_msgSend_cosAngleFeatureIndex(self, v107, v108, v109, v110, v111);
        double v115 = v96 / v98;
        if (v98 == 0.0) {
          double v115 = 0.0;
        }
        float v116 = v115;
        *(float *)(v70 + 4 * (v114 + v99)) = v116;
        ++v77;
        double v78 = v83;
        double v79 = v81;
      }
      v71 += a5;
    }
    id v117 = v59;
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v118 = (id)qword_1EA3C9FA8;
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
    {
      v124 = objc_msgSend_modelName(self, v119, v120, v121, v122, v123);
      v130 = objc_msgSend_localizedDescription(v133, v125, v126, v127, v128, v129);
      *(_DWORD *)buf = 138412546;
      v136 = v124;
      __int16 v137 = 2112;
      v138 = v130;
      _os_log_impl(&dword_1C492D000, v118, OS_LOG_TYPE_ERROR, "An error occurred when trying to allocate feature array for the %@ model: %@", buf, 0x16u);
    }
    if (a6) {
      *a6 = v133;
    }
    id v117 = objc_alloc_init(MEMORY[0x1E4F1E9A8]);
  }
  v131 = v117;

  return v131;
}

- (id)_subTilesForStrokeCount:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (objc_msgSend_maxNumberOfInputStrokes(self, v6, v7, v8, v9, v10) >= a3)
  {
    v51 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v11, 0, a3, v14, v15);
    objc_msgSend_addObject_(v5, v52, (uint64_t)v51, v53, v54, v55);
  }
  else
  {
    if (a3 < 1) {
      goto LABEL_10;
    }
    int64_t v16 = 0;
    while (1)
    {
      uint64_t v17 = objc_msgSend_contextMaxStrokes(self, v11, v12, v13, v14, v15);
      uint64_t v23 = objc_msgSend_maxNumberOfInputStrokes(self, v18, v19, v20, v21, v22);
      double v28 = fmax((double)(v16 - v17), 0.0);
      uint64_t v29 = (unint64_t)v28;
      uint64_t v30 = a3 - (unint64_t)v28;
      if (v30 <= v23) {
        break;
      }
      uint64_t v31 = objc_msgSend_recognitionMaxStrokes(self, v24, v25, v30, v26, v27);
      uint64_t v37 = objc_msgSend_contextMaxStrokes(self, v32, v33, v34, v35, v36);
      uint64_t v41 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v38, v29, (unint64_t)(fmin((double)a3, (double)(v31 + v16 + v37)) - (double)(unint64_t)v29), v39, v40);
      objc_msgSend_addObject_(v5, v42, (uint64_t)v41, v43, v44, v45);

      v16 += objc_msgSend_recognitionMaxStrokes(self, v46, v47, v48, v49, v50);
      if (v16 >= a3) {
        goto LABEL_10;
      }
    }
    v51 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v24, (unint64_t)v28, v30, v26, v27);
    objc_msgSend_addObject_(v5, v56, (uint64_t)v51, v57, v58, v59);
  }

LABEL_10:
  return v5;
}

- (BOOL)_isContentStroke:(int64_t)a3 withinSubtile:(int64_t)a4 withRange:(_NSRange)a5 ofTotal:(int64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  int64_t v11 = a6 - 1;
  if (a6 <= 1)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v12 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)double v24 = 0;
      _os_log_impl(&dword_1C492D000, v12, OS_LOG_TYPE_FAULT, "More than one subtiles are required.", v24, 2u);
    }
  }
  int64_t v13 = location + length - objc_msgSend_contextMaxStrokes(self, a2, a3, a4, a5.location, a5.length);
  int64_t v19 = objc_msgSend_contextMaxStrokes(self, v14, v15, v16, v17, v18) + location;
  BOOL v21 = v13 > a3 && v19 <= a3;
  BOOL v22 = v19 <= a3;
  if (v11 != a4) {
    BOOL v22 = v21;
  }
  if (a4) {
    return v22;
  }
  else {
    return v13 > a3;
  }
}

- (BOOL)classifyStrokes:(id)a3 outTextStrokeProbabilities:(void *)a4 cancellationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  __p = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  char v17 = objc_msgSend_classifyStrokes_outStrokeClassProbabilities_cancellationBlock_(self, v10, (uint64_t)v8, (uint64_t)&__p, (uint64_t)v9, v11);
  char v18 = v17 ^ 1;
  int64_t v19 = (char *)__p;
  if (!self) {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
    uint64_t v20 = *(void **)a4;
    *((void *)a4 + 1) = *(void *)a4;
    BOOL v21 = v33;
    unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((v33 - v19) >> 3);
    if (v22 > (uint64_t)(*((void *)a4 + 2) - (void)v20) >> 2)
    {
      if (v22 >> 62) {
        sub_1C494A220();
      }
      uint64_t v23 = (char *)operator new(0xAAAAAAAAAAAAAAACLL * ((v33 - v19) >> 3));
      *(void *)a4 = v23;
      *((void *)a4 + 1) = v23;
      *((void *)a4 + 2) = &v23[4 * v22];
      if (v20)
      {
        operator delete(v20);
        int64_t v19 = (char *)__p;
        BOOL v21 = v33;
      }
    }
    if (v21 != v19)
    {
      uint64_t v24 = 0;
      unint64_t v25 = 0;
      do
      {
        *(float *)(*(void *)a4 + 4 * v25++) = 1.0
                                              - *(float *)(*(void *)&v19[v24]
                                                         + 4
                                                         * objc_msgSend_nontextClassIndex(self, v12, v13, v14, v15, v16));
        int64_t v19 = (char *)__p;
        v24 += 24;
      }
      while (v25 < 0xAAAAAAAAAAAAAAABLL * ((v33 - (unsigned char *)__p) >> 3));
    }
  }
  if (v19)
  {
    uint64_t v26 = v33;
    uint64_t v27 = v19;
    if (v33 != v19)
    {
      double v28 = v33;
      do
      {
        uint64_t v30 = (void *)*((void *)v28 - 3);
        v28 -= 24;
        uint64_t v29 = v30;
        if (v30)
        {
          *((void *)v26 - 2) = v29;
          operator delete(v29);
        }
        uint64_t v26 = v28;
      }
      while (v28 != v19);
      uint64_t v27 = __p;
    }
    uint64_t v33 = v19;
    operator delete(v27);
  }

  return v17;
}

- (BOOL)classifyStrokes:(id)a3 outStrokeClassProbabilities:(void *)a4 cancellationBlock:(id)a5
{
  uint64_t v336 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (unsigned int (**)(void))a5;
  v286 = v8;
  v292 = v9;
  uint64_t v15 = objc_msgSend_count(v8, v10, v11, v12, v13, v14);
  objc_msgSend__subTilesForStrokeCount_(self, v16, v15, v17, v18, v19);
  v285 = v295 = self;
  if (objc_msgSend_count(v285, v20, v21, v22, v23, v24) == 1)
  {
    uint64_t v30 = v9;
    uint64_t v31 = objc_msgSend_createDrawingForStrokes_interpolationType_resolution_cancellationBlock_(CHStrokeUtilities, v25, (uint64_t)v286, 0, 1, (uint64_t)v9);
    *(void *)v324 = 0;
    v325 = v324;
    uint64_t v326 = 0x2020000000;
    LOBYTE(v327) = 0;
    uint64_t v32 = qword_1EA3C8F40;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4AB4148;
    block[3] = &unk_1E64E3688;
    void block[4] = self;
    v315 = v324;
    id v300 = v31;
    id v314 = v300;
    v316 = a4;
    dispatch_sync(v32, block);
    char v33 = ((uint64_t (*)(unsigned int (**)(void)))v30[2])(v30);
    uint64_t v34 = v325;
    if ((v33 & 1) == 0 && !v325[24])
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v35 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        uint64_t v41 = objc_msgSend_modelName(self, v36, v37, v38, v39, v40);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v41;
        _os_log_impl(&dword_1C492D000, v35, OS_LOG_TYPE_FAULT, "An error occurred in the %@ model during prediction", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v34 = v325;
    }
    BOOL v42 = v34[24] != 0;

    _Block_object_dispose(v324, 8);
    goto LABEL_127;
  }
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v25, v26, v27, v28, v29);
  id v300 = (id)objc_claimAutoreleasedReturnValue();
  v293 = (uint64_t *)a4;
  long long v311 = 0u;
  long long v312 = 0u;
  long long v309 = 0u;
  long long v310 = 0u;
  id v43 = v8;
  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v309, (uint64_t)v335, 16, v45);
  if (v50)
  {
    uint64_t v51 = 0;
    uint64_t v52 = *(void *)v310;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v310 != v52) {
          objc_enumerationMutation(v43);
        }
        v334[0] = *(void *)(*((void *)&v309 + 1) + 8 * i);
        uint64_t v54 = objc_msgSend_numberWithInteger_(NSNumber, v46, v51 + i, v47, v48, v49);
        v334[1] = v54;
        uint64_t v58 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v55, (uint64_t)v334, 2, v56, v57);
        objc_msgSend_addObject_(v300, v59, (uint64_t)v58, v60, v61, v62);
      }
      uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v309, (uint64_t)v335, 16, v49);
      v51 += i;
    }
    while (v50);
  }

  v289 = objc_msgSend_sortedArrayUsingComparator_(v300, v63, (uint64_t)&unk_1F20111F0, v64, v65, v66);
  v73 = (void *)*v293;
  v72 = (void *)v293[1];
  if (v72 != (void *)*v293)
  {
    uint64_t v74 = (void *)v293[1];
    do
    {
      uint64_t v76 = (void *)*(v74 - 3);
      v74 -= 3;
      uint64_t v75 = v76;
      if (v76)
      {
        *(v72 - 2) = v75;
        operator delete(v75);
      }
      v72 = v74;
    }
    while (v74 != v73);
  }
  v293[1] = (uint64_t)v73;
  unint64_t v77 = objc_msgSend_count(v43, v67, v68, v69, v70, v71);
  double v79 = (void *)*v293;
  double v78 = (void *)v293[1];
  unint64_t v80 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v78 - *v293) >> 3);
  unint64_t v81 = v77 - v80;
  if (v77 <= v80)
  {
    if (v77 < v80)
    {
      double v97 = &v79[3 * v77];
      if (v78 != v97)
      {
        double v98 = (void *)v293[1];
        do
        {
          float v100 = (void *)*(v98 - 3);
          v98 -= 3;
          unint64_t v99 = v100;
          if (v100)
          {
            *(v78 - 2) = v99;
            operator delete(v99);
          }
          double v78 = v98;
        }
        while (v98 != v97);
      }
      v293[1] = (uint64_t)v97;
    }
  }
  else
  {
    uint64_t v82 = v293[2];
    if (0xAAAAAAAAAAAAAAABLL * ((v82 - (uint64_t)v78) >> 3) >= v81)
    {
      bzero((void *)v293[1], 24 * ((24 * v81 - 24) / 0x18) + 24);
      v293[1] = (uint64_t)&v78[3 * ((24 * v81 - 24) / 0x18) + 3];
    }
    else
    {
      if (v77 > 0xAAAAAAAAAAAAAAALL) {
        sub_1C494A220();
      }
      unint64_t v83 = 0xAAAAAAAAAAAAAAABLL * ((v82 - (uint64_t)v79) >> 3);
      uint64_t v84 = 2 * v83;
      if (2 * v83 <= v77) {
        uint64_t v84 = v77;
      }
      if (v83 >= 0x555555555555555) {
        unint64_t v85 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v85 = v84;
      }
      if (v85 > 0xAAAAAAAAAAAAAAALL) {
        sub_1C4949AA8();
      }
      uint64_t v86 = (char *)operator new(24 * v85);
      uint64_t v87 = &v86[24 * v80];
      uint64_t v88 = &v86[24 * v85];
      size_t v89 = 24 * ((24 * v81 - 24) / 0x18) + 24;
      bzero(v87, v89);
      v90 = &v87[v89];
      if (v78 == v79)
      {
        uint64_t *v293 = (uint64_t)v87;
        v293[1] = (uint64_t)v90;
        v293[2] = (uint64_t)v88;
      }
      else
      {
        do
        {
          uint64_t v91 = v87;
          *((void *)v87 - 2) = 0;
          *((void *)v87 - 1) = 0;
          long long v92 = *(_OWORD *)(v78 - 3);
          v78 -= 3;
          *(_OWORD *)(v87 - 24) = v92;
          v87 -= 24;
          *((void *)v91 - 1) = v78[2];
          *double v78 = 0;
          v78[1] = 0;
          v78[2] = 0;
        }
        while (v78 != v79);
        double v78 = (void *)*v293;
        uint64_t v93 = (void *)v293[1];
        uint64_t *v293 = (uint64_t)v87;
        v293[1] = (uint64_t)v90;
        v293[2] = (uint64_t)v88;
        if (v93 != v78)
        {
          uint64_t v94 = v93;
          do
          {
            double v96 = (void *)*(v94 - 3);
            v94 -= 3;
            uint64_t v95 = v96;
            if (v96)
            {
              *(v93 - 2) = v95;
              operator delete(v95);
            }
            uint64_t v93 = v94;
          }
          while (v94 != v78);
        }
      }
      if (v78) {
        operator delete(v78);
      }
    }
  }
  long long v307 = 0u;
  long long v308 = 0u;
  long long v305 = 0u;
  long long v306 = 0u;
  obuint64_t j = v285;
  uint64_t v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v101, (uint64_t)&v305, (uint64_t)v333, 16, v102);
  if (!v103)
  {
LABEL_120:
    BOOL v42 = 1;
    goto LABEL_126;
  }
  uint64_t v297 = 0;
  uint64_t v288 = *(void *)v306;
  *(void *)&long long v104 = 138412290;
  long long v284 = v104;
LABEL_51:
  uint64_t v291 = 0;
  uint64_t v287 = v103;
  while (1)
  {
    if (*(void *)v306 != v288) {
      objc_enumerationMutation(obj);
    }
    uint64_t v105 = *(void **)(*((void *)&v305 + 1) + 8 * v291);
    if (v292[2]()) {
      break;
    }
    objc_msgSend_rangeValue(v105, v106, v107, v108, v109, v110);
    uint64_t v298 = v111;
    id v296 = obj;
    id v299 = v289;
    if (v295)
    {
      v294 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v112, v113, v114, v115, v116);
      uint64_t v121 = objc_msgSend_objectAtIndexedSubscript_(v296, v117, v297, v118, v119, v120);
      unint64_t v127 = objc_msgSend_rangeValue(v121, v122, v123, v124, v125, v126);
      uint64_t v129 = v128;

      if (v127 < v127 + v129)
      {
        uint64_t v135 = v129;
        uint64_t v136 = v127;
        do
        {
          uint64_t v137 = objc_msgSend_count(v296, v130, v131, v132, v133, v134, v284);
          uint64_t isContentStroke_withinSubtile_withRange_ofTotal = objc_msgSend__isContentStroke_withinSubtile_withRange_ofTotal_(v295, v138, v136, v297, v127, v129, v137);
          v144 = objc_msgSend_objectAtIndexedSubscript_(v299, v140, v136, v141, v142, v143);
          v149 = objc_msgSend_objectAtIndexedSubscript_(v144, v145, 0, v146, v147, v148);
          *(void *)v324 = v149;
          v154 = objc_msgSend_objectAtIndexedSubscript_(v299, v150, v136, v151, v152, v153);
          objc_msgSend_objectAtIndexedSubscript_(v154, v155, 1, v156, v157, v158);
          v159 = (uint8_t *)objc_claimAutoreleasedReturnValue();
          v325 = v159;
          v164 = objc_msgSend_numberWithBool_(NSNumber, v160, isContentStroke_withinSubtile_withRange_ofTotal, v161, v162, v163);
          uint64_t v326 = (uint64_t)v164;
          v168 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v165, (uint64_t)v324, 3, v166, v167);
          objc_msgSend_addObject_(v294, v169, (uint64_t)v168, v170, v171, v172);

          ++v136;
          --v135;
        }
        while (v135);
      }
      v173 = objc_msgSend_sortedArrayUsingComparator_(v294, v130, (uint64_t)&unk_1F20111D0, v132, v133, v134, v284);
    }
    else
    {
      v173 = 0;
    }

    v182 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v174, v298, v175, v176, v177);
    if (v298)
    {
      for (uint64_t j = 0; j != v298; ++j)
      {
        v184 = objc_msgSend_objectAtIndexedSubscript_(v173, v178, j, v179, v180, v181, v284);
        v189 = objc_msgSend_objectAtIndexedSubscript_(v184, v185, 0, v186, v187, v188);
        objc_msgSend_addObject_(v182, v190, (uint64_t)v189, v191, v192, v193);
      }
    }
    v194 = objc_msgSend_createDrawingForStrokes_interpolationType_resolution_cancellationBlock_(CHStrokeUtilities, v178, (uint64_t)v182, 0, 1, (uint64_t)v292, v284);
    *(void *)v324 = 0;
    v325 = v324;
    uint64_t v326 = 0x4812000000;
    v327 = sub_1C4AB5D00;
    v328 = sub_1C4AB5D24;
    v329 = &unk_1C4CB5C62;
    v331 = 0;
    v332 = 0;
    __p = 0;
    unint64_t v200 = objc_msgSend_count(v173, v195, v196, v197, v198, v199);
    unint64_t v201 = v200;
    v202 = (char *)__p;
    if (0xAAAAAAAAAAAAAAABLL * ((v332 - (unsigned char *)__p) >> 3) < v200)
    {
      if (v200 > 0xAAAAAAAAAAAAAAALL) {
        sub_1C494A220();
      }
      v203 = v331;
      v204 = (char *)operator new(24 * v200);
      v205 = &v204[24 * ((v203 - v202) / 24)];
      v206 = v205;
      if (v203 == v202)
      {
        __p = &v204[24 * ((v203 - v202) / 24)];
        v331 = (char *)__p;
        v332 = &v204[24 * v201];
      }
      else
      {
        do
        {
          long long v207 = *(_OWORD *)(v203 - 24);
          v203 -= 24;
          *(_OWORD *)(v206 - 24) = v207;
          v206 -= 24;
          *((void *)v206 + 2) = *((void *)v203 + 2);
          *(void *)v203 = 0;
          *((void *)v203 + 1) = 0;
          *((void *)v203 + 2) = 0;
        }
        while (v203 != v202);
        v202 = (char *)__p;
        v208 = v331;
        __p = v206;
        v331 = v205;
        v332 = &v204[24 * v201];
        if (v208 != v202)
        {
          v209 = v208;
          do
          {
            v211 = (void *)*((void *)v209 - 3);
            v209 -= 24;
            v210 = v211;
            if (v211)
            {
              *((void *)v208 - 2) = v210;
              operator delete(v210);
            }
            v208 = v209;
          }
          while (v209 != v202);
        }
      }
      if (v202) {
        operator delete(v202);
      }
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v322 = 0x2020000000;
    char v323 = 0;
    v212 = qword_1EA3C8F40;
    v301[0] = MEMORY[0x1E4F143A8];
    v301[1] = 3221225472;
    v301[2] = sub_1C4AB5DB4;
    v301[3] = &unk_1E64E36B0;
    v301[4] = v295;
    p_long long buf = &buf;
    id v213 = v194;
    id v302 = v213;
    v304 = v324;
    dispatch_sync(v212, v301);
    uint64_t v215 = *((void *)v325 + 6);
    uint64_t v214 = *((void *)v325 + 7);
    if (0xAAAAAAAAAAAAAAABLL * ((v214 - v215) >> 3) != objc_msgSend_count(v173, v216, v217, v218, v219, v220))
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v226 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v226, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v317 = 0;
        _os_log_impl(&dword_1C492D000, v226, OS_LOG_TYPE_FAULT, "Different number of predicted probabilities than subtileStrokes.", v317, 2u);
      }
    }
    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      uint64_t v227 = 0;
      for (unint64_t k = 0; k < objc_msgSend_count(v173, v221, v222, v223, v224, v225); ++k)
      {
        v233 = objc_msgSend_objectAtIndexedSubscript_(v173, v229, k, v230, v231, v232);
        v238 = objc_msgSend_objectAtIndexedSubscript_(v233, v234, 2, v235, v236, v237);

        if (objc_msgSend_BOOLValue(v238, v239, v240, v241, v242, v243))
        {
          v248 = objc_msgSend_objectAtIndexedSubscript_(v173, v244, k, v245, v246, v247);
          v253 = objc_msgSend_objectAtIndexedSubscript_(v248, v249, 1, v250, v251, v252);
          unsigned int v259 = objc_msgSend_unsignedIntValue(v253, v254, v255, v256, v257, v258);

          if (0xAAAAAAAAAAAAAAABLL * ((v293[1] - *v293) >> 3) <= v259)
          {
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            v263 = (id)qword_1EA3C9F90[0];
            if (os_log_type_enabled(v263, OS_LOG_TYPE_FAULT))
            {
              unint64_t v264 = 0xAAAAAAAAAAAAAAABLL * ((v293[1] - *v293) >> 3);
              *(_DWORD *)v317 = 134218240;
              unint64_t v318 = v259;
              __int16 v319 = 2048;
              unint64_t v320 = v264;
              _os_log_impl(&dword_1C492D000, v263, OS_LOG_TYPE_FAULT, "Trying to assign outputStrokeClassProbabilities[%lu] for  outputStrokeClassProbabilities.size() == %lu", v317, 0x16u);
            }

            unint64_t v261 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v325 + 7) - *((void *)v325 + 6)) >> 3);
          }
          else
          {
            uint64_t v260 = *((void *)v325 + 6);
            unint64_t v261 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v325 + 7) - v260) >> 3);
            if (k < v261)
            {
              v262 = (void *)(*v293 + 24 * v259);
              if ((void *)(v260 + v227) != v262) {
                sub_1C499DEE4(v262, *(char **)(v260 + v227), *(char **)(v260 + v227 + 8), (uint64_t)(*(void *)(v260 + v227 + 8) - *(void *)(v260 + v227)) >> 2);
              }
              goto LABEL_100;
            }
          }
          if (k >= v261)
          {
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            v265 = (id)qword_1EA3C9F90[0];
            if (os_log_type_enabled(v265, OS_LOG_TYPE_FAULT))
            {
              unint64_t v266 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v325 + 7) - *((void *)v325 + 6)) >> 3);
              *(_DWORD *)v317 = 134218240;
              unint64_t v318 = k;
              __int16 v319 = 2048;
              unint64_t v320 = v266;
              _os_log_impl(&dword_1C492D000, v265, OS_LOG_TYPE_FAULT, "Trying to access predictedProbability[%lu] for predictedProbabilities.size() == %lu", v317, 0x16u);
            }
          }
        }
LABEL_100:

        v227 += 24;
      }
    }
    if ((((uint64_t (*)(void))v292[2])() & 1) == 0 && !*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v267 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v267, OS_LOG_TYPE_FAULT))
      {
        v273 = objc_msgSend_modelName(v295, v268, v269, v270, v271, v272);
        *(_DWORD *)v317 = v284;
        unint64_t v318 = (unint64_t)v273;
        _os_log_impl(&dword_1C492D000, v267, OS_LOG_TYPE_FAULT, "An error occurred in the %@ model during prediction", v317, 0xCu);
      }
    }

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(v324, 8);
    v274 = (char *)__p;
    if (__p)
    {
      v275 = v331;
      v276 = __p;
      if (v331 != __p)
      {
        v277 = v331;
        do
        {
          v279 = (void *)*((void *)v277 - 3);
          v277 -= 24;
          v278 = v279;
          if (v279)
          {
            *((void *)v275 - 2) = v278;
            operator delete(v278);
          }
          v275 = v277;
        }
        while (v277 != v274);
        v276 = __p;
      }
      v331 = v274;
      operator delete(v276);
    }

    ++v297;
    if (++v291 == v287)
    {
      uint64_t v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v296, v280, (uint64_t)&v305, (uint64_t)v333, 16, v281);
      if (!v103) {
        goto LABEL_120;
      }
      goto LABEL_51;
    }
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v282 = (id)qword_1EA3C9FA8;
  if (os_log_type_enabled(v282, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v324 = 0;
    _os_log_impl(&dword_1C492D000, v282, OS_LOG_TYPE_DEBUG, "Cancelling stroke classification of chunks", v324, 2u);
  }

  BOOL v42 = 0;
LABEL_126:

LABEL_127:
  return v42;
}

- (id)predictedScriptsForDrawing:(id)a3 maxNumberOfLocales:(int64_t)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_1C4AB615C;
  int64_t inferenceCount = self->_inferenceCount;
  uint64_t v20 = sub_1C4AB616C;
  id v21 = 0;
  self->_int64_t inferenceCount = inferenceCount + 1;
  id v8 = qword_1EA3C8F40;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4AB6174;
  v12[3] = &unk_1E64E2528;
  v12[4] = self;
  id v13 = v6;
  uint64_t v14 = &v16;
  int64_t v15 = a4;
  id v9 = v6;
  dispatch_sync(v8, v12);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

+ (id)localesFromModelPrediction:()vector<std:(std:(int64_t)a4 :(int64_t)a5 allocator<std:(id)a6 :vector<float>>> *)a3 :vector<float> maxNumberOfLocales:numberOfOutputClass:scriptCodeMap:
{
  uint64_t v111 = a3;
  id v7 = a6;
  id v113 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v114 = v7;
  if (!(a5 << 32))
  {
    id v13 = 0;
    uint64_t v14 = (char *)v111->var1 - (char *)v111->var0;
    if (v14 < 1) {
      goto LABEL_30;
    }
    goto LABEL_6;
  }
  if (a5 << 32 < 0) {
    sub_1C494A220();
  }
  id v13 = operator new((4 * a5) & 0x3FFFFFFFFLL);
  bzero(v13, (4 * a5) & 0x3FFFFFFFFLL);
  uint64_t v14 = (char *)v111->var1 - (char *)v111->var0;
  if (v14 >= 1)
  {
LABEL_6:
    uint64_t v15 = 0;
    int64_t v16 = v14 / 0x18uLL;
    if (v16 <= 1) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = v16;
    }
    do
    {
      if (a5 < 1)
      {
        float v21 = 0.0;
        uint64_t v23 = -1;
        uint64_t v20 = -1;
      }
      else
      {
        uint64_t v18 = 0;
        uint64_t v20 = -1;
        float v21 = 0.0;
        double v12 = 0.0;
        uint64_t v22 = -1;
        do
        {
          uint64_t v19 = *((void *)v111->var0 + 3 * v15);
          float v27 = *(float *)(v19 + 4 * v18);
          if (v27 > *(float *)&v12)
          {
            uint64_t v23 = v18;
            float v24 = *(float *)(v19 + 4 * v18);
          }
          else
          {
            uint64_t v23 = v22;
            float v24 = *(float *)&v12;
            uint64_t v22 = v20;
            *(float *)&double v12 = v21;
          }
          BOOL v25 = v27 > *(float *)&v12;
          BOOL v26 = v27 < v24;
          if (v26 && v25) {
            uint64_t v20 = v18;
          }
          else {
            uint64_t v20 = v22;
          }
          if (v26 && v25) {
            float v21 = *(float *)(v19 + 4 * v18);
          }
          else {
            float v21 = *(float *)&v12;
          }
          ++v18;
          *(float *)&double v12 = v24;
          uint64_t v22 = v23;
        }
        while (a5 != v18);
      }
      uint64_t v28 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, v23, v9, v10, v11, v12, v111);
      char v33 = objc_msgSend_containsObject_(&unk_1F203DB60, v29, (uint64_t)v28, v30, v31, v32);

      if ((v33 & 1) == 0) {
        *((_DWORD *)v13 + v23) += 2;
      }
      uint64_t v38 = objc_msgSend_objectAtIndexedSubscript_(v7, v34, v20, v35, v36, v37);
      char v43 = objc_msgSend_containsObject_(&unk_1F203DB60, v39, (uint64_t)v38, v40, v41, v42);
      if (v21 < 0.25) {
        char v44 = 1;
      }
      else {
        char v44 = v43;
      }

      if ((v44 & 1) == 0) {
        ++*((_DWORD *)v13 + v20);
      }
      ++v15;
      id v7 = v114;
    }
    while (v15 != v17);
  }
LABEL_30:
  uint64_t v45 = objc_msgSend_indexOfObject_(v7, v8, (uint64_t)&unk_1F203ED78, v9, v10, v11, v111);
  uint64_t v50 = objc_msgSend_indexOfObject_(v7, v46, (uint64_t)&unk_1F203ED90, v47, v48, v49);
  int v55 = *((_DWORD *)v13 + v45);
  if (v55)
  {
    int v56 = *((_DWORD *)v13 + v50);
    if (v56) {
      *((_DWORD *)v13 + v50) = v56 + v55;
    }
  }
  uint64_t v115 = 0;
  unint64_t v116 = 0;
  if (a5 >= 1)
  {
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    objc_msgSend_objectAtIndexedSubscript_(v114, v51, 0, v52, v53, v54);
    while (1)
      uint64_t v62 = {;
      uint64_t v67 = v62;
      int v68 = *((_DWORD *)v13 + v60);
      if (v59 < v58)
      {
        *(void *)uint64_t v59 = v62;
        *((_DWORD *)v59 + 2) = v68;
        unint64_t v61 = (unint64_t)(v59 + 16);
        unint64_t v116 = (unint64_t)(v59 + 16);
        ++v60;
        v59 += 16;
        if (v60 == a5) {
          goto LABEL_57;
        }
        goto LABEL_36;
      }
      uint64_t v69 = (v59 - v57) >> 4;
      unint64_t v70 = v69 + 1;
      if ((unint64_t)(v69 + 1) >> 60) {
        sub_1C494A220();
      }
      if ((v58 - v57) >> 3 > v70) {
        unint64_t v70 = (v58 - v57) >> 3;
      }
      if ((unint64_t)(v58 - v57) >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v71 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v71 = v70;
      }
      if (v71 >> 60) {
        sub_1C4949AA8();
      }
      v72 = (char *)operator new(16 * v71);
      v73 = &v72[16 * v69];
      uint64_t v58 = &v72[16 * v71];
      *(void *)v73 = v67;
      *((_DWORD *)v73 + 2) = v68;
      unint64_t v61 = (unint64_t)(v73 + 16);
      if (v59 == v57)
      {
        uint64_t v115 = v73;
        if (v57) {
          goto LABEL_51;
        }
      }
      else
      {
        uint64_t v74 = v59;
        do
        {
          uint64_t v75 = *((void *)v74 - 2);
          v74 -= 16;
          *(void *)uint64_t v74 = 0;
          *((void *)v73 - 2) = v75;
          v73 -= 16;
          *((_DWORD *)v73 + 2) = *((_DWORD *)v74 + 2);
        }
        while (v74 != v57);
        uint64_t v115 = v73;
        do
        {
          uint64_t v76 = (void *)*((void *)v59 - 2);
          v59 -= 16;
        }
        while (v59 != v57);
        if (v57) {
LABEL_51:
        }
          operator delete(v57);
      }
      uint64_t v57 = v73;
      unint64_t v116 = v61;
      ++v60;
      uint64_t v59 = (char *)v61;
      if (v60 == a5) {
        goto LABEL_57;
      }
LABEL_36:
      objc_msgSend_objectAtIndexedSubscript_(v114, v63, v60, v64, v65, v66);
    }
  }
  unint64_t v61 = 0;
  uint64_t v57 = 0;
LABEL_57:
  unint64_t v77 = 126 - 2 * __clz((uint64_t)(v61 - (void)v57) >> 4);
  if ((char *)v61 == v57) {
    uint64_t v78 = 0;
  }
  else {
    uint64_t v78 = v77;
  }
  sub_1C4AB6D6C((uint64_t)v57, v61, v78, 1);
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  int v90 = *((_DWORD *)v13 + objc_msgSend_indexOfObject_(v114, v79, (uint64_t)&unk_1F203EDC0, v80, v81, v82));
  while (objc_msgSend_count(v113, v85, v86, v87, v88, v89) < (unint64_t)a4)
  {
    if ((a5 & ~(a5 >> 63)) == v84) {
      break;
    }
    double v96 = &v57[v83];
    if (!*(_DWORD *)&v57[v83 + 8]) {
      break;
    }
    if (objc_msgSend_isEqualToNumber_(*(void **)&v57[v83], v91, (uint64_t)&unk_1F203EDC0, v93, v94, v95)
      && v84 + 1 < a5)
    {
      v101 = &v57[v83];
      if (*(_DWORD *)&v57[v83 + 24] > v90 / 2)
      {
        uint64_t v102 = *(void *)v101;
        *(void *)v101 = *((void *)v101 + 2);
        *((void *)v101 + 2) = v102;
        LODWORD(v102) = *((_DWORD *)v96 + 2);
        *((_DWORD *)v96 + 2) = *((_DWORD *)v101 + 6);
        *((_DWORD *)v101 + 6) = v102;
        uint64_t v57 = v115;
      }
    }
    objc_msgSend_addObject_(v113, v97, *(void *)&v57[v83], v98, v99, v100);
    ++v84;
    v83 += 16;
  }
  if (!objc_msgSend_count(v113, v91, v92, v93, v94, v95)) {
    objc_msgSend_addObject_(v113, v103, (uint64_t)&unk_1F203EDC0, v104, v105, v106);
  }
  id v107 = v113;
  if (v57)
  {
    for (uint64_t i = (char *)v116; i != v57; i -= 16)
    {
      uint64_t v109 = (void *)*((void *)i - 2);
    }
    operator delete(v57);
  }
  if (v13) {
    operator delete(v13);
  }

  return v107;
}

- (NSArray)modelConfigurationsNumStrokes
{
  return self->_modelConfigurationsNumStrokes;
}

- (NSArray)modelConfigurationsNumPoints
{
  return self->_modelConfigurationsNumPoints;
}

- (NSString)modelSmallestConfig
{
  return self->_modelSmallestConfig;
}

- (int64_t)numInputFeatures
{
  return self->_numInputFeatures;
}

- (int64_t)distanceFeatureIndex
{
  return self->_distanceFeatureIndex;
}

- (int64_t)sinAngleFeatureIndex
{
  return self->_sinAngleFeatureIndex;
}

- (int64_t)cosAngleFeatureIndex
{
  return self->_cosAngleFeatureIndex;
}

- (int64_t)modelDecoderSize
{
  return self->_modelDecoderSize;
}

- (int64_t)maxInputWidth
{
  return self->_maxInputWidth;
}

- (int64_t)minPointsPerStroke
{
  return self->_minPointsPerStroke;
}

- (int64_t)maxPointsPerStroke
{
  return self->_maxPointsPerStroke;
}

- (int64_t)recognitionMaxStrokes
{
  return self->_recognitionMaxStrokes;
}

- (int64_t)contextMaxStrokes
{
  return self->_contextMaxStrokes;
}

- (int64_t)maxStrokeHeight
{
  return self->_maxStrokeHeight;
}

- (int64_t)maxNumberOfInputStrokes
{
  return self->_maxNumberOfInputStrokes;
}

- (double)interpointDistance
{
  return self->_interpointDistance;
}

- (int64_t)numOutputClasses
{
  return self->_numOutputClasses;
}

- (int64_t)nontextClassIndex
{
  return self->_nontextClassIndex;
}

- (int64_t)weakLabelIndex
{
  return self->_weakLabelIndex;
}

- (NSIndexSet)textLTRClassIndexes
{
  return self->_textLTRClassIndexes;
}

- (NSIndexSet)textRTLClassIndexes
{
  return self->_textRTLClassIndexes;
}

- (NSArray)scriptCodeMap
{
  return self->_scriptCodeMap;
}

- (NSDictionary)codeScriptDictionary
{
  return self->_codeScriptDictionary;
}

- (NSDictionary)scriptCodeDictionary
{
  return self->_scriptCodeDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptCodeDictionary, 0);
  objc_storeStrong((id *)&self->_codeScriptDictionary, 0);
  objc_storeStrong((id *)&self->_scriptCodeMap, 0);
  objc_storeStrong((id *)&self->_textRTLClassIndexes, 0);
  objc_storeStrong((id *)&self->_textLTRClassIndexes, 0);
  objc_storeStrong((id *)&self->_modelSmallestConfig, 0);
  objc_storeStrong((id *)&self->_modelConfigurationsNumPoints, 0);
  objc_storeStrong((id *)&self->_modelConfigurationsNumStrokes, 0);
  value = self->_codeMap.__ptr_.__value_;
  self->_codeMap.__ptr_.__value_ = 0;
  if (value)
  {
    if (value->var0) {
      munmap(value->var0, value->var1);
    }
    MEMORY[0x1C8786460](value, 0x1010C40A749B91FLL);
  }
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  return self;
}

@end