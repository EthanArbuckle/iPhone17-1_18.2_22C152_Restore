@interface CHSynthesisRequestOptions
+ (BOOL)supportsSecureCoding;
+ (id)synthesisOptionsWithDictionary:(id)a3;
+ (id)synthesisOptionsWithDrawing:(id)a3 content:(id)a4;
+ (id)synthesisOptionsWithDrawing:(id)a3 content:(id)a4 stylePrediction:(id)a5 isFastPath:(BOOL)a6 fitWidth:(id)a7 fitHeight:(id)a8 synthesizeCharacterInventoryBehavior:(int64_t)a9 xZeroDrawing:(id)a10 fastPathAsXZero:(BOOL)a11 fastPathUseDefaultStyle:(BOOL)a12 styleInventoryQuery:(BOOL)a13 skipStyleInventoryLookup:(BOOL)a14 saveStyleSample:(BOOL)a15 forwardProcessRatio:(id)a16 backwardProcessRatio:(id)a17 seed:(id)a18;
+ (id)synthesisOptionsWithFastPath:(BOOL)a3;
+ (id)synthesisOptionsWithStyleStrength:(id)a3;
+ (id)synthesisOptionsWithSynthesizeCharacterInventoryBehavior:(int64_t)a3;
- (BOOL)fastPathAsXZero;
- (BOOL)fastPathUseDefaultStyle;
- (BOOL)isFastPath;
- (BOOL)saveStyleSample;
- (BOOL)skipStyleInventoryLookup;
- (BOOL)styleInventoryQuery;
- (BOOL)validateSegments;
- (CHDrawing)styleDrawing;
- (CHDrawing)xZeroDrawing;
- (CHSynthesisRequestOptions)initWithCoder:(id)a3;
- (CHSynthesisRequestOptions)initWithStyleDrawing:(id)a3 styleContent:(id)a4 stylePrediction:(id)a5 isFastPath:(BOOL)a6 fitWidth:(id)a7 fitHeight:(id)a8 synthesizeCharacterInventoryBehavior:(int64_t)a9 xZeroDrawing:(id)a10 fastPathAsXZero:(BOOL)a11 fastPathUseDefaultStyle:(BOOL)a12 styleInventoryQuery:(BOOL)a13 skipStyleInventoryLookup:(BOOL)a14 saveStyleSample:(BOOL)a15 distanceBetweenDigits:(id)a16 validateSegments:(BOOL)a17 forwardProcessRatio:(id)a18 backwardProcessRatio:(id)a19 seed:(id)a20;
- (MLMultiArray)stylePrediction;
- (NSNumber)backwardProcessRatio;
- (NSNumber)distanceBetweenDigits;
- (NSNumber)fitHeight;
- (NSNumber)fitWidth;
- (NSNumber)forwardProcessRatio;
- (NSNumber)seed;
- (NSString)styleContent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionary;
- (int64_t)synthesizeCharacterInventoryBehavior;
- (void)encodeWithCoder:(id)a3;
- (void)setBackwardProcessRatio:(id)a3;
- (void)setDistanceBetweenDigits:(id)a3;
- (void)setFastPathAsXZero:(BOOL)a3;
- (void)setFastPathUseDefaultStyle:(BOOL)a3;
- (void)setFitHeight:(id)a3;
- (void)setFitWidth:(id)a3;
- (void)setForwardProcessRatio:(id)a3;
- (void)setIsFastPath:(BOOL)a3;
- (void)setSaveStyleSample:(BOOL)a3;
- (void)setSeed:(id)a3;
- (void)setSkipStyleInventoryLookup:(BOOL)a3;
- (void)setStyleContent:(id)a3;
- (void)setStyleDrawing:(id)a3;
- (void)setStyleInventoryQuery:(BOOL)a3;
- (void)setStylePrediction:(id)a3;
- (void)setSynthesizeCharacterInventoryBehavior:(int64_t)a3;
- (void)setValidateSegments:(BOOL)a3;
- (void)setXZeroDrawing:(id)a3;
@end

@implementation CHSynthesisRequestOptions

- (CHSynthesisRequestOptions)initWithStyleDrawing:(id)a3 styleContent:(id)a4 stylePrediction:(id)a5 isFastPath:(BOOL)a6 fitWidth:(id)a7 fitHeight:(id)a8 synthesizeCharacterInventoryBehavior:(int64_t)a9 xZeroDrawing:(id)a10 fastPathAsXZero:(BOOL)a11 fastPathUseDefaultStyle:(BOOL)a12 styleInventoryQuery:(BOOL)a13 skipStyleInventoryLookup:(BOOL)a14 saveStyleSample:(BOOL)a15 distanceBetweenDigits:(id)a16 validateSegments:(BOOL)a17 forwardProcessRatio:(id)a18 backwardProcessRatio:(id)a19 seed:(id)a20
{
  id v41 = a3;
  id v42 = a4;
  id v34 = a5;
  id v39 = a5;
  id v36 = a7;
  id v38 = a7;
  id v37 = a8;
  id v25 = a8;
  id v26 = a10;
  id v40 = a16;
  id v27 = a18;
  id v28 = a19;
  id v29 = a20;
  v43.receiver = self;
  v43.super_class = (Class)CHSynthesisRequestOptions;
  v30 = [(CHSynthesisRequestOptions *)&v43 init];
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_styleDrawing, a3);
    objc_storeStrong((id *)&v31->_styleContent, a4);
    objc_storeStrong((id *)&v31->_stylePrediction, v34);
    v31->_isFastPath = a6;
    objc_storeStrong((id *)&v31->_fitWidth, v36);
    objc_storeStrong((id *)&v31->_fitHeight, v37);
    v31->_synthesizeCharacterInventoryBehavior = a9;
    objc_storeStrong((id *)&v31->_xZeroDrawing, a10);
    v31->_fastPathAsXZero = a11;
    v31->_fastPathUseDefaultStyle = a12;
    v31->_styleInventoryQuery = a13;
    v31->_skipStyleInventoryLookup = a14;
    v31->_saveStyleSample = a15;
    objc_storeStrong((id *)&v31->_distanceBetweenDigits, a16);
    v31->_validateSegments = a17;
    objc_storeStrong((id *)&v31->_forwardProcessRatio, a18);
    objc_storeStrong((id *)&v31->_backwardProcessRatio, a19);
    objc_storeStrong((id *)&v31->_seed, a20);
  }

  return v31;
}

+ (id)synthesisOptionsWithDrawing:(id)a3 content:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [CHSynthesisRequestOptions alloc];
  char v12 = 0;
  BYTE4(v11) = 0;
  LODWORD(v11) = 0;
  isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed = objc_msgSend_initWithStyleDrawing_styleContent_stylePrediction_isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed_(v7, v8, (uint64_t)v5, (uint64_t)v6, 0, 0, 0, 0, 0, 0, v11, 0, v12, 0, 0, 0);

  return isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed;
}

+ (id)synthesisOptionsWithFastPath:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [CHSynthesisRequestOptions alloc];
  char v9 = 0;
  BYTE4(v8) = 0;
  LODWORD(v8) = 0;
  isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed = objc_msgSend_initWithStyleDrawing_styleContent_stylePrediction_isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed_(v4, v5, 0, 0, 0, v3, 0, 0, 0, 0, v8, 0, v9, 0, 0, 0);
  return isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed;
}

+ (id)synthesisOptionsWithSynthesizeCharacterInventoryBehavior:(int64_t)a3
{
  v4 = [CHSynthesisRequestOptions alloc];
  char v9 = 0;
  BYTE4(v8) = 0;
  LODWORD(v8) = 0;
  isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed = objc_msgSend_initWithStyleDrawing_styleContent_stylePrediction_isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed_(v4, v5, 0, 0, 0, 0, 0, 0, a3, 0, v8, 0, v9, 0, 0, 0);
  return isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed;
}

+ (id)synthesisOptionsWithStyleStrength:(id)a3
{
  id v3 = a3;
  v4 = [CHSynthesisRequestOptions alloc];
  id v5 = NSNumber;
  objc_msgSend_floatValue(v3, v6, v7, v8, v9, v10);
  v17 = objc_msgSend_numberWithDouble_(v5, v12, v13, v14, v15, v16, 1.0 - v11);
  v18 = NSNumber;
  objc_msgSend_floatValue(v3, v19, v20, v21, v22, v23);
  v30 = objc_msgSend_numberWithDouble_(v18, v25, v26, v27, v28, v29, 1.0 - v24);
  char v35 = 0;
  BYTE4(v34) = 0;
  LODWORD(v34) = 0;
  isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed = objc_msgSend_initWithStyleDrawing_styleContent_stylePrediction_isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed_(v4, v31, 0, 0, 0, 0, 0, 0, 0, 0, v34, 0, v35, v17, v30, 0);

  return isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed;
}

+ (id)synthesisOptionsWithDrawing:(id)a3 content:(id)a4 stylePrediction:(id)a5 isFastPath:(BOOL)a6 fitWidth:(id)a7 fitHeight:(id)a8 synthesizeCharacterInventoryBehavior:(int64_t)a9 xZeroDrawing:(id)a10 fastPathAsXZero:(BOOL)a11 fastPathUseDefaultStyle:(BOOL)a12 styleInventoryQuery:(BOOL)a13 skipStyleInventoryLookup:(BOOL)a14 saveStyleSample:(BOOL)a15 forwardProcessRatio:(id)a16 backwardProcessRatio:(id)a17 seed:(id)a18
{
  BOOL v36 = a6;
  id v37 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a7;
  id v25 = a8;
  id v26 = a10;
  id v27 = a16;
  id v28 = a17;
  id v29 = a18;
  v30 = [CHSynthesisRequestOptions alloc];
  char v35 = 0;
  *(_WORD *)((char *)&v34 + 3) = __PAIR16__(a15, a14);
  *(_WORD *)((char *)&v34 + 1) = __PAIR16__(a13, a12);
  LOBYTE(v34) = a11;
  isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed = objc_msgSend_initWithStyleDrawing_styleContent_stylePrediction_isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed_(v30, v31, (uint64_t)v37, (uint64_t)v22, (uint64_t)v23, v36, v24, v25, a9, v26, v34, 0, v35, v27, v28, v29);

  return isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed;
}

+ (id)synthesisOptionsWithDictionary:(id)a3
{
  id v3 = a3;
  v168 = objc_msgSend_valueForKey_(v3, v4, (uint64_t)CHTextSynthesisOptionStyleDrawing, v5, v6, v7);
  v167 = objc_msgSend_valueForKey_(v3, v8, (uint64_t)CHTextSynthesisOptionStyleContent, v9, v10, v11);
  v166 = objc_msgSend_valueForKey_(v3, v12, (uint64_t)CHTextSynthesisOptionStylePrediction, v13, v14, v15);
  uint64_t v20 = objc_msgSend_valueForKey_(v3, v16, (uint64_t)CHTextSynthesisOptionForwardProcessRatio, v17, v18, v19);
  id v25 = objc_msgSend_valueForKey_(v3, v21, (uint64_t)CHTextSynthesisOptionBackwardProcessRatio, v22, v23, v24);
  v30 = objc_msgSend_valueForKey_(v3, v26, (uint64_t)CHTextSynthesisOptionStyleStrength, v27, v28, v29);
  BOOL v36 = v30;
  v163 = v30;
  if (v30)
  {
    id v37 = NSNumber;
    objc_msgSend_floatValue(v30, v31, v32, v33, v34, v35);
    uint64_t v44 = objc_msgSend_numberWithDouble_(v37, v39, v40, v41, v42, v43, 1.0 - v38);

    v45 = NSNumber;
    objc_msgSend_floatValue(v36, v46, v47, v48, v49, v50);
    uint64_t v57 = objc_msgSend_numberWithDouble_(v45, v52, v53, v54, v55, v56, 1.0 - v51);

    uint64_t v20 = (void *)v57;
  }
  else
  {
    uint64_t v44 = (uint64_t)v25;
  }
  v164 = (void *)v44;
  v165 = v20;
  v162 = objc_msgSend_valueForKey_(v3, v31, (uint64_t)CHTextSynthesisOptionFitWidth, v33, v34, v35);
  v161 = objc_msgSend_valueForKey_(v3, v58, (uint64_t)CHTextSynthesisOptionFitHeight, v59, v60, v61);
  v160 = objc_msgSend_valueForKey_(v3, v62, (uint64_t)CHTextSynthesisOptionDistanceBetweenDigitCenters, v63, v64, v65);
  v159 = objc_msgSend_valueForKey_(v3, v66, (uint64_t)CHTextSynthesisOptionFixedSeed, v67, v68, v69);
  v158 = objc_msgSend_valueForKey_(v3, v70, (uint64_t)CHTextSynthesisOptionXZeroDrawing, v71, v72, v73);
  v78 = objc_msgSend_valueForKey_(v3, v74, (uint64_t)CHTextSynthesisOptionFastPath, v75, v76, v77);
  unsigned int v84 = objc_msgSend_BOOLValue(v78, v79, v80, v81, v82, v83);

  v89 = objc_msgSend_valueForKey_(v3, v85, (uint64_t)CHTextSynthesisOptionFastPathAsXZero, v86, v87, v88);
  char v95 = objc_msgSend_BOOLValue(v89, v90, v91, v92, v93, v94);

  v100 = objc_msgSend_valueForKey_(v3, v96, (uint64_t)CHTextSynthesisOptionFastPathUseDefaultStyle, v97, v98, v99);
  char v106 = objc_msgSend_BOOLValue(v100, v101, v102, v103, v104, v105);

  v111 = objc_msgSend_valueForKey_(v3, v107, (uint64_t)CHTextSynthesisStyleInventoryDebugView, v108, v109, v110);
  char v117 = objc_msgSend_BOOLValue(v111, v112, v113, v114, v115, v116);

  v122 = objc_msgSend_valueForKey_(v3, v118, (uint64_t)CHTextSynthesisOptionSkipStyleInventoryLookup, v119, v120, v121);
  char v128 = objc_msgSend_BOOLValue(v122, v123, v124, v125, v126, v127);

  v133 = objc_msgSend_valueForKey_(v3, v129, (uint64_t)CHTextSynthesisOptionSaveStyleSample, v130, v131, v132);
  char v157 = objc_msgSend_BOOLValue(v133, v134, v135, v136, v137, v138);
  unsigned int v139 = v84;

  v144 = objc_msgSend_valueForKey_(v3, v140, (uint64_t)CHTextSynthesisOptionSynthesizeCharacterInventory, v141, v142, v143);
  uint64_t v150 = objc_msgSend_integerValue(v144, v145, v146, v147, v148, v149);

  v151 = [CHSynthesisRequestOptions alloc];
  uint64_t v153 = 2;
  if (v150 < 2) {
    uint64_t v153 = v150;
  }
  BYTE4(v156) = v157;
  BYTE3(v156) = v128;
  BYTE2(v156) = v117;
  BYTE1(v156) = v106;
  LOBYTE(v156) = v95;
  isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed = objc_msgSend_initWithStyleDrawing_styleContent_stylePrediction_isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed_(v151, v152, (uint64_t)v168, (uint64_t)v167, (uint64_t)v166, v139, v162, v161, v153 & ~(v153 >> 63), v158, v156, v160, 0, v165, v164, v159);

  return isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed;
}

- (id)dictionary
{
  uint64_t v7 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3, v4, v5);
  char v12 = v7;
  styleDrawing = self->_styleDrawing;
  if (styleDrawing) {
    objc_msgSend_setValue_forKey_(v7, v8, (uint64_t)styleDrawing, (uint64_t)CHTextSynthesisOptionStyleDrawing, v10, v11);
  }
  styleContent = self->_styleContent;
  if (styleContent) {
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)styleContent, (uint64_t)CHTextSynthesisOptionStyleContent, v10, v11);
  }
  stylePrediction = self->_stylePrediction;
  if (stylePrediction) {
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)stylePrediction, (uint64_t)CHTextSynthesisOptionStylePrediction, v10, v11);
  }
  forwardProcessRatio = self->_forwardProcessRatio;
  if (forwardProcessRatio) {
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)forwardProcessRatio, (uint64_t)CHTextSynthesisOptionForwardProcessRatio, v10, v11);
  }
  backwardProcessRatio = self->_backwardProcessRatio;
  if (backwardProcessRatio) {
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)backwardProcessRatio, (uint64_t)CHTextSynthesisOptionBackwardProcessRatio, v10, v11);
  }
  fitWidth = self->_fitWidth;
  if (fitWidth) {
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)fitWidth, (uint64_t)CHTextSynthesisOptionFitWidth, v10, v11);
  }
  fitHeight = self->_fitHeight;
  if (fitHeight) {
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)fitHeight, (uint64_t)CHTextSynthesisOptionFitHeight, v10, v11);
  }
  distanceBetweenDigits = self->_distanceBetweenDigits;
  if (distanceBetweenDigits) {
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)distanceBetweenDigits, (uint64_t)CHTextSynthesisOptionDistanceBetweenDigitCenters, v10, v11);
  }
  xZeroDrawing = self->_xZeroDrawing;
  if (xZeroDrawing) {
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)xZeroDrawing, (uint64_t)CHTextSynthesisOptionXZeroDrawing, v10, v11);
  }
  seed = self->_seed;
  if (seed) {
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)seed, (uint64_t)CHTextSynthesisOptionFixedSeed, v10, v11);
  }
  uint64_t v23 = objc_msgSend_numberWithBool_(NSNumber, v8, self->_isFastPath, v9, v10, v11);
  objc_msgSend_setValue_forKey_(v12, v24, (uint64_t)v23, (uint64_t)CHTextSynthesisOptionFastPath, v25, v26);

  v31 = objc_msgSend_numberWithInteger_(NSNumber, v27, self->_synthesizeCharacterInventoryBehavior, v28, v29, v30);
  objc_msgSend_setValue_forKey_(v12, v32, (uint64_t)v31, (uint64_t)CHTextSynthesisOptionSynthesizeCharacterInventory, v33, v34);

  id v39 = objc_msgSend_numberWithBool_(NSNumber, v35, self->_fastPathAsXZero, v36, v37, v38);
  objc_msgSend_setValue_forKey_(v12, v40, (uint64_t)v39, (uint64_t)CHTextSynthesisOptionFastPathAsXZero, v41, v42);

  uint64_t v47 = objc_msgSend_numberWithBool_(NSNumber, v43, self->_fastPathUseDefaultStyle, v44, v45, v46);
  objc_msgSend_setValue_forKey_(v12, v48, (uint64_t)v47, (uint64_t)CHTextSynthesisOptionFastPathUseDefaultStyle, v49, v50);

  uint64_t v55 = objc_msgSend_numberWithBool_(NSNumber, v51, self->_styleInventoryQuery, v52, v53, v54);
  objc_msgSend_setValue_forKey_(v12, v56, (uint64_t)v55, (uint64_t)CHTextSynthesisStyleInventoryDebugView, v57, v58);

  uint64_t v63 = objc_msgSend_numberWithBool_(NSNumber, v59, self->_skipStyleInventoryLookup, v60, v61, v62);
  objc_msgSend_setValue_forKey_(v12, v64, (uint64_t)v63, (uint64_t)CHTextSynthesisOptionSkipStyleInventoryLookup, v65, v66);

  uint64_t v71 = objc_msgSend_numberWithBool_(NSNumber, v67, self->_saveStyleSample, v68, v69, v70);
  objc_msgSend_setValue_forKey_(v12, v72, (uint64_t)v71, (uint64_t)CHTextSynthesisOptionSaveStyleSample, v73, v74);

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v10 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8, v9);
  v123 = objc_msgSend_styleDrawing(self, v11, v12, v13, v14, v15);
  v122 = objc_msgSend_styleContent(self, v16, v17, v18, v19, v20);
  uint64_t v121 = objc_msgSend_stylePrediction(self, v21, v22, v23, v24, v25);
  unsigned int isFastPath = objc_msgSend_isFastPath(self, v26, v27, v28, v29, v30);
  uint64_t v120 = objc_msgSend_fitWidth(self, v31, v32, v33, v34, v35);
  uint64_t v119 = objc_msgSend_fitHeight(self, v36, v37, v38, v39, v40);
  uint64_t v46 = objc_msgSend_synthesizeCharacterInventoryBehavior(self, v41, v42, v43, v44, v45);
  v118 = objc_msgSend_xZeroDrawing(self, v47, v48, v49, v50, v51);
  char v114 = objc_msgSend_fastPathAsXZero(self, v52, v53, v54, v55, v56);
  char v62 = objc_msgSend_fastPathUseDefaultStyle(self, v57, v58, v59, v60, v61);
  char v113 = objc_msgSend_styleInventoryQuery(self, v63, v64, v65, v66, v67);
  char v73 = objc_msgSend_skipStyleInventoryLookup(self, v68, v69, v70, v71, v72);
  char v79 = objc_msgSend_saveStyleSample(self, v74, v75, v76, v77, v78);
  uint64_t v115 = objc_msgSend_distanceBetweenDigits(self, v80, v81, v82, v83, v84);
  char v90 = objc_msgSend_validateSegments(self, v85, v86, v87, v88, v89);
  v112 = objc_msgSend_forwardProcessRatio(self, v91, v92, v93, v94, v95);
  v101 = objc_msgSend_backwardProcessRatio(self, v96, v97, v98, v99, v100);
  v107 = objc_msgSend_seed(self, v102, v103, v104, v105, v106);
  char v111 = v90;
  BYTE4(v110) = v79;
  BYTE3(v110) = v73;
  BYTE2(v110) = v113;
  BYTE1(v110) = v62;
  LOBYTE(v110) = v114;
  isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed = objc_msgSend_initWithStyleDrawing_styleContent_stylePrediction_isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed_(v10, v108, (uint64_t)v123, (uint64_t)v122, (uint64_t)v121, isFastPath, v120, v119, v46, v118, v110, v115, v111, v112, v101, v107);

  return isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_seed;
}

- (void)encodeWithCoder:(id)a3
{
  id v58 = a3;
  objc_msgSend_encodeObject_forKey_(v58, v4, (uint64_t)self->_styleDrawing, @"styleDrawing", v5, v6);
  objc_msgSend_encodeObject_forKey_(v58, v7, (uint64_t)self->_styleContent, @"styleContent", v8, v9);
  objc_msgSend_encodeObject_forKey_(v58, v10, (uint64_t)self->_stylePrediction, @"stylePrediction", v11, v12);
  objc_msgSend_encodeBool_forKey_(v58, v13, self->_isFastPath, @"isFastPath", v14, v15);
  objc_msgSend_encodeObject_forKey_(v58, v16, (uint64_t)self->_forwardProcessRatio, @"forwardProcessRatio", v17, v18);
  objc_msgSend_encodeObject_forKey_(v58, v19, (uint64_t)self->_backwardProcessRatio, @"backwardProcessRatio", v20, v21);
  objc_msgSend_encodeObject_forKey_(v58, v22, (uint64_t)self->_fitWidth, @"fitWidth", v23, v24);
  objc_msgSend_encodeObject_forKey_(v58, v25, (uint64_t)self->_fitHeight, @"fitHeight", v26, v27);
  objc_msgSend_encodeInteger_forKey_(v58, v28, self->_synthesizeCharacterInventoryBehavior, @"synthesizeCharacterInventory", v29, v30);
  objc_msgSend_encodeObject_forKey_(v58, v31, (uint64_t)self->_xZeroDrawing, @"xZeroDrawing", v32, v33);
  objc_msgSend_encodeBool_forKey_(v58, v34, self->_fastPathAsXZero, @"fastPathAsXZero", v35, v36);
  objc_msgSend_encodeBool_forKey_(v58, v37, self->_fastPathUseDefaultStyle, @"fastPathUseDefaultStyle", v38, v39);
  objc_msgSend_encodeBool_forKey_(v58, v40, self->_styleInventoryQuery, @"styleInventoryQuery", v41, v42);
  objc_msgSend_encodeBool_forKey_(v58, v43, self->_skipStyleInventoryLookup, @"skipStyleInventoryLookup", v44, v45);
  objc_msgSend_encodeBool_forKey_(v58, v46, self->_saveStyleSample, @"saveStyleSampleLookup", v47, v48);
  objc_msgSend_encodeObject_forKey_(v58, v49, (uint64_t)self->_distanceBetweenDigits, @"distanceBetweenDigits", v50, v51);
  objc_msgSend_encodeBool_forKey_(v58, v52, self->_validateSegments, @"validateSegments", v53, v54);
  objc_msgSend_encodeObject_forKey_(v58, v55, (uint64_t)self->_seed, @"fixedSeed", v56, v57);
}

- (CHSynthesisRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"styleDrawing", v7, v8);
  uint64_t v9 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
  styleDrawing = self->_styleDrawing;
  self->_styleDrawing = v9;

  uint64_t v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"styleContent", v13, v14);
  uint64_t v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  styleContent = self->_styleContent;
  self->_styleContent = v15;

  uint64_t v17 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"stylePrediction", v19, v20);
  uint64_t v21 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
  stylePrediction = self->_stylePrediction;
  self->_stylePrediction = v21;

  self->_unsigned int isFastPath = objc_msgSend_decodeBoolForKey_(v4, v23, @"isFastPath", v24, v25, v26);
  uint64_t v27 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, @"forwardProcessRatio", v29, v30);
  v31 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  forwardProcessRatio = self->_forwardProcessRatio;
  self->_forwardProcessRatio = v31;

  uint64_t v33 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, @"backwardProcessRatio", v35, v36);
  uint64_t v37 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  backwardProcessRatio = self->_backwardProcessRatio;
  self->_backwardProcessRatio = v37;

  uint64_t v39 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, @"fitWidth", v41, v42);
  uint64_t v43 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  fitWidth = self->_fitWidth;
  self->_fitWidth = v43;

  uint64_t v45 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v46, v45, @"fitHeight", v47, v48);
  uint64_t v49 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  fitHeight = self->_fitHeight;
  self->_fitHeight = v49;

  uint64_t v55 = objc_msgSend_decodeIntegerForKey_(v4, v51, @"synthesizeCharacterInventory", v52, v53, v54);
  uint64_t v56 = 2;
  if (v55 < 2) {
    uint64_t v56 = v55;
  }
  self->_synthesizeCharacterInventoryBehavior = v56 & ~(v56 >> 63);
  uint64_t v57 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v58, v57, @"xZeroDrawing", v59, v60);
  uint64_t v61 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
  xZeroDrawing = self->_xZeroDrawing;
  self->_xZeroDrawing = v61;

  self->_fastPathAsXZero = objc_msgSend_decodeBoolForKey_(v4, v63, @"fastPathAsXZero", v64, v65, v66);
  self->_fastPathUseDefaultStyle = objc_msgSend_decodeBoolForKey_(v4, v67, @"fastPathUseDefaultStyle", v68, v69, v70);
  self->_styleInventoryQuery = objc_msgSend_decodeBoolForKey_(v4, v71, @"styleInventoryQuery", v72, v73, v74);
  self->_skipStyleInventoryLookup = objc_msgSend_decodeBoolForKey_(v4, v75, @"skipStyleInventoryLookup", v76, v77, v78);
  self->_saveStyleSample = objc_msgSend_decodeBoolForKey_(v4, v79, @"saveStyleSampleLookup", v80, v81, v82);
  uint64_t v83 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v84, v83, @"distanceBetweenDigits", v85, v86);
  uint64_t v87 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  distanceBetweenDigits = self->_distanceBetweenDigits;
  self->_distanceBetweenDigits = v87;

  self->_validateSegments = objc_msgSend_decodeBoolForKey_(v4, v89, @"validateSegments", v90, v91, v92);
  uint64_t v93 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v94, v93, @"fixedSeed", v95, v96);
  uint64_t v97 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  seed = self->_seed;
  self->_seed = v97;

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHDrawing)styleDrawing
{
  return self->_styleDrawing;
}

- (void)setStyleDrawing:(id)a3
{
}

- (NSString)styleContent
{
  return self->_styleContent;
}

- (void)setStyleContent:(id)a3
{
}

- (MLMultiArray)stylePrediction
{
  return self->_stylePrediction;
}

- (void)setStylePrediction:(id)a3
{
}

- (BOOL)isFastPath
{
  return self->_isFastPath;
}

- (void)setIsFastPath:(BOOL)a3
{
  self->_unsigned int isFastPath = a3;
}

- (NSNumber)forwardProcessRatio
{
  return self->_forwardProcessRatio;
}

- (void)setForwardProcessRatio:(id)a3
{
}

- (NSNumber)backwardProcessRatio
{
  return self->_backwardProcessRatio;
}

- (void)setBackwardProcessRatio:(id)a3
{
}

- (NSNumber)fitWidth
{
  return self->_fitWidth;
}

- (void)setFitWidth:(id)a3
{
}

- (NSNumber)fitHeight
{
  return self->_fitHeight;
}

- (void)setFitHeight:(id)a3
{
}

- (NSNumber)distanceBetweenDigits
{
  return self->_distanceBetweenDigits;
}

- (void)setDistanceBetweenDigits:(id)a3
{
}

- (int64_t)synthesizeCharacterInventoryBehavior
{
  return self->_synthesizeCharacterInventoryBehavior;
}

- (void)setSynthesizeCharacterInventoryBehavior:(int64_t)a3
{
  self->_synthesizeCharacterInventoryBehavior = a3;
}

- (CHDrawing)xZeroDrawing
{
  return self->_xZeroDrawing;
}

- (void)setXZeroDrawing:(id)a3
{
}

- (BOOL)fastPathAsXZero
{
  return self->_fastPathAsXZero;
}

- (void)setFastPathAsXZero:(BOOL)a3
{
  self->_fastPathAsXZero = a3;
}

- (BOOL)fastPathUseDefaultStyle
{
  return self->_fastPathUseDefaultStyle;
}

- (void)setFastPathUseDefaultStyle:(BOOL)a3
{
  self->_fastPathUseDefaultStyle = a3;
}

- (BOOL)styleInventoryQuery
{
  return self->_styleInventoryQuery;
}

- (void)setStyleInventoryQuery:(BOOL)a3
{
  self->_styleInventoryQuery = a3;
}

- (BOOL)skipStyleInventoryLookup
{
  return self->_skipStyleInventoryLookup;
}

- (void)setSkipStyleInventoryLookup:(BOOL)a3
{
  self->_skipStyleInventoryLookup = a3;
}

- (BOOL)saveStyleSample
{
  return self->_saveStyleSample;
}

- (void)setSaveStyleSample:(BOOL)a3
{
  self->_saveStyleSample = a3;
}

- (BOOL)validateSegments
{
  return self->_validateSegments;
}

- (void)setValidateSegments:(BOOL)a3
{
  self->_validateSegments = a3;
}

- (NSNumber)seed
{
  return self->_seed;
}

- (void)setSeed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seed, 0);
  objc_storeStrong((id *)&self->_xZeroDrawing, 0);
  objc_storeStrong((id *)&self->_distanceBetweenDigits, 0);
  objc_storeStrong((id *)&self->_fitHeight, 0);
  objc_storeStrong((id *)&self->_fitWidth, 0);
  objc_storeStrong((id *)&self->_backwardProcessRatio, 0);
  objc_storeStrong((id *)&self->_forwardProcessRatio, 0);
  objc_storeStrong((id *)&self->_stylePrediction, 0);
  objc_storeStrong((id *)&self->_styleContent, 0);
  objc_storeStrong((id *)&self->_styleDrawing, 0);
}

@end