@interface CHMathRecognizer
- (BOOL)enableCachingIfAvailable;
- (CGSize)minimumDrawingSize;
- (CHMathPostProcessingManager)postProcessor;
- (CHMathRecognizer)init;
- (CHRecognitionInsight)recordedInsightFromLastRequest;
- (NSArray)locales;
- (NSSet)declaredVariables;
- (id)mathRecognitionResultForDrawing:(id)a3 options:(id)a4 shouldCancel:(id)a5;
- (unint64_t)maxRecognitionResultCount;
- (void)recordInsightWithRequest:(id)a3;
- (void)setDeclaredVariables:(id)a3;
- (void)setLocales:(id)a3;
- (void)setMaxRecognitionResultCount:(unint64_t)a3;
- (void)setMinimumDrawingSize:(CGSize)a3;
- (void)setPostProcessor:(id)a3;
@end

@implementation CHMathRecognizer

- (CHMathRecognizer)init
{
  v172.receiver = self;
  v172.super_class = (Class)CHMathRecognizer;
  v2 = [(CHMathRecognizer *)&v172 init];
  if (v2)
  {
    v3 = [CHEncoderDecoderNetwork alloc];
    uint64_t v7 = objc_msgSend_initWithModelNames_decoderName_(v3, v4, @"math_encoder.bundle", @"math_decoder.bundle", v5, v6);
    recognitionModel = v2->_recognitionModel;
    v2->_recognitionModel = (CHEncoderDecoderNetwork *)v7;

    v9 = objc_opt_class();
    v15 = objc_msgSend_definedMathFunctionNameSet(v9, v10, v11, v12, v13, v14);
    objc_msgSend_setDefinedMathFunctionNameSet_(v2->_recognitionModel, v16, (uint64_t)v15, v17, v18, v19);

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.CoreHandwriting.mathRecognizerQueue", v20);
    recognitionQueue = v2->_recognitionQueue;
    v2->_recognitionQueue = (OS_dispatch_queue *)v21;

    __asm { FMOV            V0.2D, #3.0 }
    v2->_minimumDrawingSize = _Q0;
    v2->_enableCachingIfAvailable = 0;
    v2->_maxRecognitionResultCount = 1;
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v171 = objc_alloc_init(CHMergeColumnsStep);
    v170 = objc_alloc_init(CHRemoveInvalidSegmentationCandidatesStep);
    objc_msgSend_addObject_(v28, v29, (uint64_t)v170, v30, v31, v32);
    v169 = objc_alloc_init(CHPruneCandidatesComparingColumnScoresStep);
    objc_msgSend_addObject_(v28, v33, (uint64_t)v169, v34, v35, v36);
    v168 = objc_alloc_init(CHPrimeTransliterationStep);
    objc_msgSend_addObject_(v28, v37, (uint64_t)v168, v38, v39, v40);
    v167 = objc_alloc_init(CHTransliterateExponentsStep);
    objc_msgSend_addObject_(v28, v41, (uint64_t)v167, v42, v43, v44);
    v45 = [CHBracketsMatchingStep alloc];
    v51 = objc_msgSend_codeMap(v2->_recognitionModel, v46, v47, v48, v49, v50);
    uint64_t v56 = objc_msgSend_initWithCodemap_(v45, v52, (uint64_t)v51, v53, v54, v55);

    v166 = (void *)v56;
    objc_msgSend_addObject_(v28, v57, v56, v58, v59, v60);
    v165 = objc_alloc_init(CHDecodeMathFunctionStep);
    objc_msgSend_addObject_(v28, v61, (uint64_t)v165, v62, v63, v64);
    v164 = objc_alloc_init(CHRemoveVariableCasingAlternativesStep);
    objc_msgSend_addObject_(v28, v65, (uint64_t)v164, v66, v67, v68);
    v163 = objc_alloc_init(CHRemoveSubscriptFromVariableStep);
    objc_msgSend_addObject_(v28, v69, (uint64_t)v163, v70, v71, v72);
    v162 = objc_alloc_init(CHDotTransliterationStep);
    objc_msgSend_addObject_(v28, v73, (uint64_t)v162, v74, v75, v76);
    v77 = objc_alloc_init(CHCombineAlternativesStep);
    objc_msgSend_addObject_(v28, v78, (uint64_t)v171, v79, v80, v81);
    objc_msgSend_addObject_(v28, v82, (uint64_t)v77, v83, v84, v85);
    v161 = objc_alloc_init(CHInsertPrecedingSpaceForUnitsStep);
    objc_msgSend_addObject_(v28, v86, (uint64_t)v161, v87, v88, v89);
    v90 = objc_alloc_init(CHRemoveSpacingAlternativesStep);
    objc_msgSend_addObject_(v28, v91, (uint64_t)v90, v92, v93, v94);
    v95 = [CHRemoveInvalidExpressionCandidatesStep alloc];
    v101 = objc_msgSend_codeMap(v2->_recognitionModel, v96, v97, v98, v99, v100);
    v106 = objc_msgSend_initWithCodemap_(v95, v102, (uint64_t)v101, v103, v104, v105);

    objc_msgSend_addObject_(v28, v107, (uint64_t)v106, v108, v109, v110);
    v111 = [CHTransliterateUnmatchedConfusablesStep alloc];
    v117 = objc_msgSend_codeMap(v2->_recognitionModel, v112, v113, v114, v115, v116);
    v122 = objc_msgSend_initWithCodemap_(v111, v118, (uint64_t)v117, v119, v120, v121);

    objc_msgSend_addObject_(v28, v123, (uint64_t)v122, v124, v125, v126);
    v127 = objc_alloc_init(CHRemoveInvalidStringCandidatesStep);
    objc_msgSend_addObject_(v28, v128, (uint64_t)v127, v129, v130, v131);
    v132 = objc_alloc_init(CHDecorateSpecialSymbolsStep);
    objc_msgSend_addObject_(v28, v133, (uint64_t)v132, v134, v135, v136);
    v137 = objc_alloc_init(CHRemoveIdenticalCandidatesStep);
    objc_msgSend_addObject_(v28, v138, (uint64_t)v171, v139, v140, v141);
    objc_msgSend_addObject_(v28, v142, (uint64_t)v137, v143, v144, v145);
    objc_msgSend_addObject_(v28, v146, (uint64_t)v171, v147, v148, v149);
    v150 = [CHMathPostProcessingManager alloc];
    v155 = objc_msgSend_initWithSequence_(v150, v151, (uint64_t)v28, v152, v153, v154);
    objc_msgSend_setPostProcessor_(v2, v156, (uint64_t)v155, v157, v158, v159);
  }
  return v2;
}

- (id)mathRecognitionResultForDrawing:(id)a3 options:(id)a4 shouldCancel:(id)a5
{
  uint64_t v236 = *MEMORY[0x1E4F143B8];
  id v214 = a3;
  id v208 = a4;
  id v209 = a5;
  if (self)
  {
    activeRecognitionInsight = self->_activeRecognitionInsight;
    self->_activeRecognitionInsight = 0;

    if (self->_nextRecognitionInsightRequest)
    {
      v9 = objc_alloc_init(CHRecognitionInsight);
      v10 = self->_activeRecognitionInsight;
      self->_activeRecognitionInsight = v9;

      objc_msgSend_recordInsightRequest_(self->_activeRecognitionInsight, v11, (uint64_t)self->_nextRecognitionInsightRequest, v12, v13, v14);
      nextRecognitionInsightRequest = self->_nextRecognitionInsightRequest;
      self->_nextRecognitionInsightRequest = 0;
    }
  }
  v16 = self->_activeRecognitionInsight;
  v215 = v16;
  if (v16) {
    objc_msgSend_recordInputDrawing_(v16, v17, (uint64_t)v214, v18, v19, v20);
  }
  uint64_t v223 = 0;
  v224 = &v223;
  uint64_t v225 = 0x3032000000;
  v226 = sub_1C4A9E504;
  v227 = sub_1C4A9E514;
  id v228 = 0;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  dispatch_queue_t v21 = (id)qword_1EA3C9FC8;
  os_signpost_id_t spid = os_signpost_id_generate(v21);

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v22 = (id)qword_1EA3C9FC8;
  v23 = v22;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v23, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CHMathRecognition", "", buf, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v24 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v24, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHMathRecognition\"", buf, 2u);
  }

  recognitionQueue = self->_recognitionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4A9E51C;
  block[3] = &unk_1E64E35A0;
  id v212 = v214;
  id v218 = v212;
  v219 = self;
  id v211 = v208;
  id v220 = v211;
  v222 = &v223;
  v26 = (uint64_t (**)(void))v209;
  v221 = v26;
  dispatch_sync(recognitionQueue, block);
  uint64_t v32 = (void *)v224[5];
  v216 = v26;
  if (v32)
  {
    if (v26)
    {
      if (((uint64_t (*)(uint64_t (**)(void)))v26[2])(v26))
      {
        v33 = 0;
        goto LABEL_54;
      }
      uint64_t v32 = (void *)v224[5];
    }
    id v35 = v32;
    id v36 = v212;
    unint64_t v42 = objc_msgSend_count(v35, v37, v38, v39, v40, v41);
    id v48 = v35;
    uint64_t v49 = v48;
    if (v42 >= 2)
    {
      __int16 v231 = 0;
      char v230 = 0;
      v206 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v43, v44, v45, v46, v47);
      uint64_t v55 = objc_msgSend_firstObject(v48, v50, v51, v52, v53, v54);
      sub_1C4A9EC34(v55, v36, (unsigned char *)&v231 + 1, &v231, &v230, v206);

      id v207 = v206;
      id v210 = v207;
      uint64_t v49 = v48;
      if (!v230)
      {
        id v210 = v207;
        uint64_t v49 = v48;
        if ((_BYTE)v231)
        {
          uint64_t v49 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v56, v57, v58, v59, v60);
          v61 = (void *)MEMORY[0x1E4F1CA48];
          uint64_t v67 = objc_msgSend_firstObject(v48, v62, v63, v64, v65, v66);
          uint64_t v72 = objc_msgSend_arrayWithObject_(v61, v68, (uint64_t)v67, v69, v70, v71);

          int v78 = HIBYTE(v231);
          unint64_t v79 = 1;
          id v210 = v207;
          while (1)
          {
            if (v79 >= objc_msgSend_count(v48, v73, v74, v75, v76, v77))
            {
              objc_msgSend_addObjectsFromArray_(v49, v80, (uint64_t)v72, v82, v83, v84);

              goto LABEL_44;
            }
            buf[0] = 0;
            __int16 v229 = 0;
            uint64_t v85 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v80, v81, v82, v83, v84);
            v90 = objc_msgSend_objectAtIndexedSubscript_(v48, v86, v79, v87, v88, v89);
            sub_1C4A9EC34(v90, v36, buf, (unsigned char *)&v229 + 1, &v229, v85);

            if (!HIBYTE(v229)) {
              break;
            }
            BOOL v95 = v78 || buf[0] == 0;
            BOOL v96 = v95;
            if (!(_BYTE)v229 && v96) {
              break;
            }
            v102 = objc_msgSend_objectAtIndexedSubscript_(v48, v91, v79, v92, v93, v94);
            objc_msgSend_addObject_(v49, v103, (uint64_t)v102, v104, v105, v106);

            if (objc_msgSend_count(v49, v107, v108, v109, v110, v111) == 1)
            {
              uint64_t v97 = v210;
              id v210 = v85;
              goto LABEL_39;
            }
LABEL_40:

            ++v79;
          }
          uint64_t v97 = objc_msgSend_objectAtIndexedSubscript_(v48, v91, v79, v92, v93, v94);
          objc_msgSend_addObject_(v72, v98, (uint64_t)v97, v99, v100, v101);
LABEL_39:

          goto LABEL_40;
        }
      }
LABEL_44:
      v112 = (void *)MEMORY[0x1E4F28D60];
      uint64_t v113 = objc_msgSend_strokeCount(v36, v56, v57, v58, v59, v60);
      v117 = objc_msgSend_indexSetWithIndexesInRange_(v112, v114, 0, v113, v115, v116);
      char isEqualToIndexSet = objc_msgSend_isEqualToIndexSet_(v210, v118, (uint64_t)v117, v119, v120, v121);

      if ((isEqualToIndexSet & 1) == 0)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v123 = (id)qword_1EA3C9F98;
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        {
          uint64_t v129 = objc_msgSend_strokeCount(v36, v124, v125, v126, v127, v128);
          uint64_t v135 = objc_msgSend_description(v210, v130, v131, v132, v133, v134);
          *(_DWORD *)buf = 134218242;
          uint64_t v233 = v129;
          __int16 v234 = 2112;
          v235 = v135;
          _os_log_impl(&dword_1C492D000, v123, OS_LOG_TYPE_ERROR, "Math recognition result doesn't cover all the strokes. Strokes in drawing: %lu, Covergae: %@", buf, 0x16u);
        }
      }
    }
    uint64_t v136 = (void *)v224[5];
    v224[5] = (uint64_t)v49;

    v137 = [CHTokenizedMathResult alloc];
    uint64_t v34 = objc_msgSend_initWithBestPathTokens_(v137, v138, v224[5], v139, v140, v141);
    uint64_t v147 = objc_msgSend_declaredVariables(self, v142, v143, v144, v145, v146);
    objc_msgSend_setDeclaredVariablesWhileRecognized_(v34, v148, (uint64_t)v147, v149, v150, v151);

    if (v215)
    {
      objc_msgSend_recordMathResult_(v215, v27, (uint64_t)v34, v29, v30, v31);
      v26 = v216;
      if (v216) {
        goto LABEL_53;
      }
    }
    else
    {
      v26 = v216;
      if (v216) {
        goto LABEL_53;
      }
    }
LABEL_57:
    char v153 = 1;
    v33 = v34;
    goto LABEL_58;
  }
  uint64_t v34 = 0;
  if (!v26) {
    goto LABEL_57;
  }
LABEL_53:
  v33 = v34;
LABEL_54:
  char v152 = ((uint64_t (*)(uint64_t (**)(void)))v26[2])(v26);
  char v153 = 0;
  if ((v152 & 1) == 0) {
LABEL_58:
  }
    objc_msgSend_transformNotationToInternal(v33, v27, v28, v29, v30, v31);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v154 = (id)qword_1EA3C9FC8;
  v155 = v154;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v154))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v155, OS_SIGNPOST_INTERVAL_END, spid, "CHMathRecognition", "", buf, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v156 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v156, OS_LOG_TYPE_DEFAULT, "END \"CHMathRecognition\"", buf, 2u);
  }

  if (!self->_postProcessor || !v33 || (v153 & 1) == 0 && (v216[2]() & 1) != 0)
  {
    uint64_t v157 = v33;
    goto LABEL_93;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v158 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v159 = os_signpost_id_generate(v158);

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v160 = (id)qword_1EA3C9FC8;
  v161 = v160;
  unint64_t v162 = v159 - 1;
  if (v159 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v160))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v161, OS_SIGNPOST_INTERVAL_BEGIN, v159, "CHMathRecognizerPostProcessingBlock", "", buf, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v163 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v163, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHMathRecognizerPostProcessingBlock\"", buf, 2u);
  }

  v164 = [CHMathResultWithContext alloc];
  v170 = objc_msgSend_declaredVariables(self, v165, v166, v167, v168, v169);
  v174 = objc_msgSend_initWithResult_declaredVariables_(v164, v171, (uint64_t)v33, (uint64_t)v170, v172, v173);

  v180 = objc_msgSend_mutableCopy(v211, v175, v176, v177, v178, v179);
  objc_msgSend_setObject_forKeyedSubscript_(v180, v181, (uint64_t)self->_locales, (uint64_t)CHMathPostProcessingOptionLocales, v182, v183);
  v187 = objc_msgSend_process_options_(self->_postProcessor, v184, (uint64_t)v174, (uint64_t)v180, v185, v186);
  uint64_t v157 = objc_msgSend_result(v187, v188, v189, v190, v191, v192);

  v198 = objc_msgSend_declaredVariables(self, v193, v194, v195, v196, v197);
  objc_msgSend_setDeclaredVariablesWhileRecognized_(v157, v199, (uint64_t)v198, v200, v201, v202);

  if (qword_1EA3CA000 == -1)
  {
    v203 = (id)qword_1EA3C9FC8;
    if (v162 <= 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_86;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v203 = (id)qword_1EA3C9FC8;
    if (v162 <= 0xFFFFFFFFFFFFFFFDLL)
    {
LABEL_86:
      if (os_signpost_enabled(v203))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C492D000, v203, OS_SIGNPOST_INTERVAL_END, v159, "CHMathRecognizerPostProcessingBlock", "", buf, 2u);
      }
    }
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v204 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v204, OS_LOG_TYPE_DEFAULT, "END \"CHMathRecognizerPostProcessingBlock\"", buf, 2u);
  }

LABEL_93:
  _Block_object_dispose(&v223, 8);

  return v157;
}

- (NSSet)declaredVariables
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_1C4A9E504;
  v9 = sub_1C4A9E514;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4A9F23C;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  v4[5] = &v5;
  sub_1C4A9F038((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSSet *)v2;
}

- (void)setDeclaredVariables:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4A9F2FC;
  v6[3] = &unk_1E64E11E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  sub_1C4A9F038((uint64_t)self, v6);
}

- (NSArray)locales
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_1C4A9E504;
  v9 = sub_1C4A9E514;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4A9F424;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  v4[5] = &v5;
  sub_1C4A9F038((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (void)setLocales:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4A9F4E4;
  v6[3] = &unk_1E64E11E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  sub_1C4A9F038((uint64_t)self, v6);
}

- (CGSize)minimumDrawingSize
{
  double width = self->_minimumDrawingSize.width;
  double height = self->_minimumDrawingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinimumDrawingSize:(CGSize)a3
{
  self->_minimumDrawingSize = a3;
}

- (BOOL)enableCachingIfAvailable
{
  return self->_enableCachingIfAvailable;
}

- (unint64_t)maxRecognitionResultCount
{
  return self->_maxRecognitionResultCount;
}

- (void)setMaxRecognitionResultCount:(unint64_t)a3
{
  self->_maxRecognitionResultCount = a3;
}

- (CHMathPostProcessingManager)postProcessor
{
  return self->_postProcessor;
}

- (void)setPostProcessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessor, 0);
  objc_storeStrong((id *)&self->_recognitionQueue, 0);
  objc_storeStrong((id *)&self->_recognitionModel, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_declaredVariables, 0);
  objc_storeStrong((id *)&self->_activeRecognitionInsight, 0);
  objc_storeStrong((id *)&self->_nextRecognitionInsightRequest, 0);
}

- (void)recordInsightWithRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4A9F66C;
  v6[3] = &unk_1E64E11E0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  sub_1C4A9F038((uint64_t)self, v6);
}

- (CHRecognitionInsight)recordedInsightFromLastRequest
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_1C4A9E504;
  v9 = sub_1C4A9E514;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4A9F78C;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  v4[5] = &v5;
  sub_1C4A9F038((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CHRecognitionInsight *)v2;
}

@end