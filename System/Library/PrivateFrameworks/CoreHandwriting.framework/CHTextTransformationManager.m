@interface CHTextTransformationManager
+ ($9936F71585EAE7D8081FB1B234834B3F)convertToCHPrincipalLines:(SEL)a3;
+ (BOOL)shouldAdjustRenderString:(id)a3;
+ (BOOL)shouldDeformAscendersDescenders:(id)a3;
+ (CGAffineTransform)adjustTransformForAnchorPoint:(SEL)a3 transform:(CGPoint)a4;
+ (CGAffineTransform)getInsertSpaceTransform:(SEL)a3 spaceSize:(id)a4;
+ (CGAffineTransform)getItalicsTransformForTextLine:(SEL)a3 skew:(id)a4;
+ (CGAffineTransform)getResizeTransformForTextLine:(SEL)a3 targetSize:(id)a4;
+ (CGAffineTransform)getTranslateTransformForAnchorPoint:(SEL)a3 targetPoint:(CGPoint)a4;
+ (CGAffineTransform)rotationTransformForTextLine:(SEL)a3 targetAngle:(id)a4;
+ (CGAffineTransform)transformForInsertingToken:(SEL)a3 inLineWithTokens:(id)a4;
+ (CGSize)estimatedRenderedTextSize:(id)a3 fullDeformValue:(double)a4 ascenderDeformValue:(double)a5 descenderDeformValue:(double)a6;
+ (PrincipalLines)convertFromCHPrincipalLines:(SEL)a3;
+ (PrincipalLines)fixPrincipalLinesOrientation:(SEL)a3 useAltString:(id)a4 skipAmbiguousCharacters:(BOOL)a5;
+ (PrincipalLines)fixPrincipalLinesPosition:(SEL)a3 useAltString:(id)a4 skipAmbiguousCharacters:(BOOL)a5;
+ (PrincipalLines)flipPrincipalLine:(SEL)a3 points:(PrincipalLines *)a4 string:(const void *)a5 outWasFlipped:(id)a6;
+ (PrincipalLines)principalLinesForPoints:(SEL)a3 writtenAlphaShape:(const void *)a4 imgPointsAndPrincipalLines:(const void *)a5 shouldCancel:(const void *)a6;
+ (PrincipalLines)principalLinesFromToken:(SEL)a3 strokes:(id)a4;
+ (PrincipalLines)principalLinesFromTokens:(SEL)a3 strokes:(id)a4 strokePoints:(id)a5 orientation:(const void *)a6 useAltString:(double)a7;
+ (PrincipalLines)refinedPrincipalLinesForTextLine:(SEL)a3 points:(id)a4 alphaShape:(const void *)a5 renderedTextPointsAndLines:(const void *)a6 useAltString:(PointsAndPrincipalLines *)a7 shouldCancel:(BOOL)a8;
+ (double)blindAscenderDeformValue:(id)a3;
+ (double)blindDescenderDeformValue:(id)a3;
+ (double)estimatedLeadingForPrincipalLines:(const void *)a3 transcription:(id)a4;
+ (double)principalLinesFitScore:(const void *)a3 points:(const void *)a4 transcription:(id)a5;
+ (double)textLineFitScore:(id)a3 useAltString:(BOOL)a4;
+ (id)_nontextGroupStrokes:(id)a3 remainingStrokes:(id)a4 strokeProvider:(id)a5;
+ (id)adjustLeadingForReflowableLines:(id)a3;
+ (id)applyMergeToTextLines:(id)a3 alignmentBehavior:(unint64_t)a4 leftMargin:(unint64_t)a5 rightMargin:(unint64_t)a6 insertionPoint:(CGPoint)a7;
+ (id)applyWrapToTextLines:(id)a3 lineSpaceBehavior:(unint64_t)a4 alignmentBehavior:(unint64_t)a5 leftMargin:(unint64_t)a6 rightMargin:(unint64_t)a7 insertionPoint:(CGPoint)a8;
+ (id)changeTokensToVisualOrder:(id)a3;
+ (id)charactersForRendering;
+ (id)checkAvailableInterceptsForString:(id)a3 skipAmbiguousCharacters:(BOOL)a4;
+ (id)drawingForTransformedTextLines:(id)a3;
+ (id)principalLineInterceptsForString:(id)a3 skipAmbiguousCharacters:(BOOL)a4 strokes:(id)a5 strokePoints:(const void *)a6 orientation:(double)a7 medianFallbackThreshold:(double)a8;
+ (id)principalLinePointsForString:(id)a3 skipAmbiguousCharacters:(BOOL)a4 strokes:(id)a5 strokePoints:(const void *)a6 orientation:(double)a7 medianFallbackThreshold:(double)a8;
+ (id)reflowableTextLinesFromTransformedTextLines:(id)a3 mergeUnacceptableLines:(BOOL)a4 progress:(id)a5;
+ (id)reflowableTextTokensFromTransformedTextLines:(id)a3;
+ (id)reflowableTokensFromSynthesisResult:(id)a3 shouldCancel:(id)a4;
+ (id)splitTextLine:(id)a3 maxLength:(double)a4;
+ (id)stringForRendering:(id)a3 useAltChars:(BOOL)a4;
+ (id)textLineCandidate:(id)a3 tokens:(id)a4 locale:(id)a5 strokeClassification:(int64_t)a6 string:(id)a7 points:(const void *)a8 strokePoints:(const void *)a9 alphaShape:(const void *)a10 initialOrientationEstimate:(double)a11 useAltString:(BOOL)a12 outFitScore:(double *)a13 shouldCancel:(id)a14;
+ (id)textLineForDrawing:(id)a3 transcriptions:(id)a4 strokeIndexes:(id)a5 fullText:(id)a6 locale:(id)a7 strokeClassification:(int64_t)a8 shouldCancel:(id)a9;
+ (id)textLineForStrokes:(id)a3 tokens:(id)a4 locale:(id)a5 strokeClassification:(int64_t)a6 initialOrientationEstimate:(double)a7 shouldCancel:(id)a8;
+ (id)textLineForTokensWithPrincipalLines:(id)a3 strokes:(id)a4 locale:(id)a5 strokeClassification:(int64_t)a6;
+ (id)textLineFromCachedResults:(id)a3 tokens:(id)a4 strokes:(id)a5 estimatedOrientation:(double)a6 locale:(id)a7 strokeClassification:(int64_t)a8;
+ (id)textStrokePointTransformationFromAffineTransformation:(CGAffineTransform *)a3;
+ (void)adjustLineSpacingWithBaselines:(id)a3 lineSpace:(unint64_t)a4;
+ (void)adjustLineSpacingWithBounds:(id)a3 lineSpace:(unint64_t)a4;
+ (void)applyAlignmentToTextLines:(id)a3 alignmentBehavior:(unint64_t)a4 leftMargin:(unint64_t)a5 rightMargin:(unint64_t)a6 alignFirstLine:(BOOL)a7;
+ (void)applyLineSpacingToTextLines:(id)a3 lineSpaceBehavior:(unint64_t)a4 lineSpaceTarget:(unint64_t)a5 linesAreParallel:(BOOL)a6;
+ (void)applyOrientationToTextLines:(id)a3 orientationBehavior:(unint64_t)a4 orientationTarget:(double)a5;
+ (void)applyResizeToTextLines:(id)a3 resizeBehavior:(unint64_t)a4 resizeTarget:(unint64_t)a5 resizeModifier:(double)a6;
+ (void)getDeformValuesForTextLine:(id)a3 useAltString:(BOOL)a4 outfullDeform:(double *)a5 outAscenderDeform:(double *)a6 outDescenderDeform:(double *)a7;
+ (void)transformTextLines:(id)a3 withParameters:(id)a4;
- (BOOL)usingInsertionPoint;
- (CHStrokeClassificationResult)strokeClassificationResult;
- (CHStrokeGroupingResult)strokeGroupingResult;
- (CHStrokeProvider)strokeProvider;
- (CHTextTransformationManager)initWithContextStrokes:(id)a3 relatedNonTextStrokes:(id)a4 contextResults:(id)a5 strokeGroupingResult:(id)a6 strokeClassificationResult:(id)a7 strokeProvider:(id)a8 excludedStrokeTypes:(id)a9 extractFromRefinablePath:(BOOL)a10;
- (CHTextTransformationManager)initWithContextStrokes:(id)a3 relatedNonTextStrokes:(id)a4 parameters:(id)a5 contextResults:(id)a6 strokeGroupingResult:(id)a7 strokeClassificationResult:(id)a8 strokeProvider:(id)a9 excludedStrokeTypes:(id)a10 extractFromRefinablePath:(BOOL)a11;
- (CHTextTransformationManager)initWithContextStrokes:(id)a3 relatedNonTextStrokes:(id)a4 parameters:(id)a5 contextResults:(id)a6 strokeGroupingResult:(id)a7 strokeClassificationResult:(id)a8 strokeProvider:(id)a9 excludedStrokeTypes:(id)a10 extractFromRefinablePath:(BOOL)a11 initialStrokes:(id)a12;
- (CHTextTransformationResult)transformWithProgress:(SEL)a3 shouldCancel:(id)a4;
- (CHTransformationParameters)transformationParameters;
- (NSArray)contextResults;
- (NSArray)contextStrokes;
- (NSArray)initialStrokes;
- (NSArray)relatedNonTextStrokes;
- (NSMutableArray)correctionAngles;
- (NSSet)excludedStrokeTypes;
- (id)_transformedTextLinesWithCancel:(id)a3 skipLineOrientationEstimate:(BOOL)a4 useCache:(BOOL)a5 progress:(id)a6;
- (id)addNonTextSegmentsAndLines:(id)a3 remainingStrokes:(id)a4 outNonTextStrokes:(id *)a5;
- (id)createTelemetryDictionary:(double)a3 nonTextRatio:(double)a4;
- (id)majorityScriptId;
- (id)meanRotationCorrectionAngle;
- (id)numCharacters;
- (id)reflowableTextLinesWithProgress:(id)a3 mergeUnacceptableLines:(BOOL)a4 shouldCancel:(id)a5;
- (id)reflowableTokensSkipLineOrientationEstimate:(BOOL)a3 useCache:(BOOL)a4 preserveTokenOrder:(BOOL)a5 shouldCancel:(id)a6;
- (id)revertTokenOrder:(id)a3 textResult:(id)a4;
- (id)tokenSupportRangesForNonTextStrokes;
- (id)tokensAlignedWithInitialStrokesForTextResult:(id)a3;
- (void)assignRemainingStrokes:(id)a3 toTextLines:(id)a4;
- (void)setContextResults:(id)a3;
- (void)setContextStrokes:(id)a3;
- (void)setCorrectionAngles:(id)a3;
- (void)setExcludedStrokeTypes:(id)a3;
- (void)setInitialStrokes:(id)a3;
- (void)setRelatedNonTextStrokes:(id)a3;
- (void)setStrokeClassificationResult:(id)a3;
- (void)setStrokeGroupingResult:(id)a3;
- (void)setStrokeProvider:(id)a3;
- (void)setTransformationParameters:(id)a3;
- (void)setUsingInsertionPoint:(BOOL)a3;
@end

@implementation CHTextTransformationManager

- (CHTextTransformationManager)initWithContextStrokes:(id)a3 relatedNonTextStrokes:(id)a4 contextResults:(id)a5 strokeGroupingResult:(id)a6 strokeClassificationResult:(id)a7 strokeProvider:(id)a8 excludedStrokeTypes:(id)a9 extractFromRefinablePath:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v23 = objc_alloc_init(CHTransformationParameters);
  v25 = (CHTextTransformationManager *)objc_msgSend_initWithContextStrokes_relatedNonTextStrokes_parameters_contextResults_strokeGroupingResult_strokeClassificationResult_strokeProvider_excludedStrokeTypes_extractFromRefinablePath_initialStrokes_(self, v24, (uint64_t)v16, (uint64_t)v17, (uint64_t)v23, (uint64_t)v18, v19, v20, v21, v22, a10, 0);

  return v25;
}

- (CHTextTransformationManager)initWithContextStrokes:(id)a3 relatedNonTextStrokes:(id)a4 parameters:(id)a5 contextResults:(id)a6 strokeGroupingResult:(id)a7 strokeClassificationResult:(id)a8 strokeProvider:(id)a9 excludedStrokeTypes:(id)a10 extractFromRefinablePath:(BOOL)a11
{
  return (CHTextTransformationManager *)objc_msgSend_initWithContextStrokes_relatedNonTextStrokes_parameters_contextResults_strokeGroupingResult_strokeClassificationResult_strokeProvider_excludedStrokeTypes_extractFromRefinablePath_initialStrokes_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8, a9, a10, a11, 0);
}

- (CHTextTransformationManager)initWithContextStrokes:(id)a3 relatedNonTextStrokes:(id)a4 parameters:(id)a5 contextResults:(id)a6 strokeGroupingResult:(id)a7 strokeClassificationResult:(id)a8 strokeProvider:(id)a9 excludedStrokeTypes:(id)a10 extractFromRefinablePath:(BOOL)a11 initialStrokes:(id)a12
{
  id v37 = a3;
  id v36 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v32 = a8;
  id v31 = a9;
  id v30 = a10;
  id v29 = a12;
  v38.receiver = self;
  v38.super_class = (Class)CHTextTransformationManager;
  id v19 = [(CHTextTransformationManager *)&v38 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_contextStrokes, a3);
    objc_storeStrong((id *)&v20->_transformationParameters, a5);
    objc_storeStrong((id *)&v20->_contextResults, a6);
    objc_storeStrong((id *)&v20->_strokeProvider, a9);
    objc_storeStrong((id *)&v20->_strokeGroupingResult, a7);
    objc_storeStrong((id *)&v20->_strokeClassificationResult, a8);
    uint64_t v26 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v21, v22, v23, v24, v25);
    correctionAngles = v20->_correctionAngles;
    v20->_correctionAngles = (NSMutableArray *)v26;

    v20->_usingInsertionPoint = 0;
    objc_storeStrong((id *)&v20->_relatedNonTextStrokes, a4);
    objc_storeStrong((id *)&v20->_excludedStrokeTypes, a10);
    v20->_shouldExtractFromRefinablePath = a11;
    objc_storeStrong((id *)&v20->_initialStrokes, a12);
  }

  return v20;
}

- (id)majorityScriptId
{
  v12 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4, v5);
  for (unint64_t i = 0; i < objc_msgSend_count(self->_contextResults, v7, v8, v9, v10, v11); ++i)
  {
    id v18 = objc_msgSend_objectAtIndexedSubscript_(self->_contextResults, v14, i, v15, v16, v17);
    uint64_t v24 = objc_msgSend_textResult(v18, v19, v20, v21, v22, v23);
    id v30 = objc_msgSend_topTranscription(v24, v25, v26, v27, v28, v29);
    objc_msgSend_appendString_(v12, v31, (uint64_t)v30, v32, v33, v34);
  }
  id v35 = objc_msgSend_scriptHistogramForString_(CHTextInputScriptSpec, v14, (uint64_t)v12, v15, v16, v17);
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v49[3] = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_1C4AE954C;
  v47 = sub_1C4AE955C;
  v48 = @"Zund";
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = sub_1C4AE9564;
  v42[3] = &unk_1E64E39C0;
  v42[4] = v49;
  v42[5] = &v43;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v35, v36, (uint64_t)v42, v37, v38, v39);
  id v40 = (id)v44[5];
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(v49, 8);
  return v40;
}

- (id)numCharacters
{
  if (objc_msgSend_count(self->_contextResults, a2, v2, v3, v4, v5))
  {
    unint64_t v11 = 0;
    uint64_t v12 = 0;
    do
    {
      v13 = objc_msgSend_objectAtIndexedSubscript_(self->_contextResults, v7, v11, v8, v9, v10);
      id v19 = objc_msgSend_textResult(v13, v14, v15, v16, v17, v18);
      uint64_t v25 = objc_msgSend_topTranscription(v19, v20, v21, v22, v23, v24);
      v12 += objc_msgSend_countSubstringsWithOptions_(v25, v26, 2, v27, v28, v29);

      ++v11;
    }
    while (v11 < objc_msgSend_count(self->_contextResults, v30, v31, v32, v33, v34));
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v35 = NSNumber;
  return (id)objc_msgSend_numberWithInteger_(v35, v7, v12, v8, v9, v10);
}

- (id)meanRotationCorrectionAngle
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v3 = self->_correctionAngles;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v34, (uint64_t)v38, 16, v5);
  if (v11)
  {
    uint64_t v12 = *(void *)v35;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend_floatValue(*(void **)(*((void *)&v34 + 1) + 8 * i), v6, v7, v8, v9, v10, (void)v34);
        double v13 = v13 + v15;
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v34, (uint64_t)v38, 16, v10);
    }
    while (v11);
  }
  else
  {
    double v13 = 0.0;
  }

  if (objc_msgSend_count(self->_correctionAngles, v16, v17, v18, v19, v20))
  {
    double v26 = v13 / (double)(unint64_t)objc_msgSend_count(self->_correctionAngles, v21, v22, v23, v24, v25);
    *(float *)&double v26 = v26;
    objc_msgSend_numberWithFloat_(NSNumber, v27, v28, v29, v30, v31, v26, (void)v34);
  }
  else
  {
    objc_msgSend_numberWithFloat_(NSNumber, v21, v22, v23, v24, v25, 0.0, (void)v34);
  uint64_t v32 = };
  return v32;
}

- (id)createTelemetryDictionary:(double)a3 nonTextRatio:(double)a4
{
  v71[7] = *MEMORY[0x1E4F143B8];
  v70[0] = @"num_characters";
  uint64_t v11 = objc_msgSend_numCharacters(self, a2, v4, v5, v6, v7);
  v71[0] = v11;
  v70[1] = @"num_strokes";
  uint64_t v12 = NSNumber;
  uint64_t v18 = objc_msgSend_count(self->_contextStrokes, v13, v14, v15, v16, v17);
  uint64_t v23 = objc_msgSend_numberWithUnsignedInteger_(v12, v19, v18, v20, v21, v22);
  v71[1] = v23;
  v70[2] = @"num_groups";
  uint64_t v24 = NSNumber;
  uint64_t v30 = objc_msgSend_count(self->_contextResults, v25, v26, v27, v28, v29);
  long long v35 = objc_msgSend_numberWithUnsignedInteger_(v24, v31, v30, v32, v33, v34);
  v71[2] = v35;
  v70[3] = @"majority_script";
  v41 = objc_msgSend_majorityScriptId(self, v36, v37, v38, v39, v40);
  v71[3] = v41;
  v70[4] = @"nontext_ratio";
  v47 = objc_msgSend_numberWithDouble_(NSNumber, v42, v43, v44, v45, v46, a4);
  v71[4] = v47;
  v70[5] = @"rotation_angle";
  v53 = objc_msgSend_meanRotationCorrectionAngle(self, v48, v49, v50, v51, v52);
  v71[5] = v53;
  v70[6] = @"time_for_straightening_ms";
  v59 = objc_msgSend_numberWithDouble_(NSNumber, v54, v55, v56, v57, v58, a3);
  v71[6] = v59;
  v62 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v60, (uint64_t)v71, (uint64_t)v70, 7, v61);
  v68 = objc_msgSend_mutableCopy(v62, v63, v64, v65, v66, v67);

  return v68;
}

- (id)reflowableTextLinesWithProgress:(id)a3 mergeUnacceptableLines:(BOOL)a4 shouldCancel:(id)a5
{
  BOOL v6 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v41 = a5;
  uint64_t v43 = v8;
  uint64_t v44 = objc_msgSend__transformedTextLinesWithCancel_skipLineOrientationEstimate_useCache_progress_(self, v9, (uint64_t)v41, 0, 1, (uint64_t)v8);
  uint64_t v10 = objc_opt_class();
  v42 = objc_msgSend_reflowableTextLinesFromTransformedTextLines_mergeUnacceptableLines_progress_(v10, v11, (uint64_t)v44, v6, (uint64_t)v8, v12);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  double v13 = (id)qword_1EA3C9FE0;
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_10;
  }
  contextResults = self->_contextResults;
  if (!contextResults)
  {
    uint64_t v20 = 0;
    relatedNonTextStrokes = self->_relatedNonTextStrokes;
    if (relatedNonTextStrokes) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v22 = 0;
    goto LABEL_9;
  }
  uint64_t v20 = objc_msgSend_count(contextResults, v14, v15, v16, v17, v18);
  relatedNonTextStrokes = self->_relatedNonTextStrokes;
  if (!relatedNonTextStrokes) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v22 = objc_msgSend_count(relatedNonTextStrokes, v14, v15, v16, v17, v18);
LABEL_9:
  *(_DWORD *)buf = 134218496;
  uint64_t v51 = v20;
  __int16 v52 = 2048;
  uint64_t v53 = v22;
  __int16 v54 = 2048;
  uint64_t v55 = objc_msgSend_count(v42, v14, v15, v16, v17, v18);
  _os_log_impl(&dword_1C492D000, v13, OS_LOG_TYPE_DEBUG, "Computed reflowable results from %ld context results, and %ld related non-text strokes: created %ld reflowable lines", buf, 0x20u);
LABEL_10:

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v23 = v42;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v45, (uint64_t)v49, 16, v25);
  if (!v26) {
    goto LABEL_23;
  }
  uint64_t v27 = *(void *)v46;
  do
  {
    uint64_t v28 = 0;
    do
    {
      if (*(void *)v46 != v27) {
        objc_enumerationMutation(v23);
      }
      uint64_t v29 = *(void **)(*((void *)&v45 + 1) + 8 * v28);
      if (qword_1EA3CA000 == -1)
      {
        uint64_t v30 = (id)qword_1EA3C9FE0;
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_18;
        }
LABEL_17:
        long long v36 = objc_msgSend_description(v29, v31, v32, v33, v34, v35);
        *(_DWORD *)buf = 138412290;
        uint64_t v51 = (uint64_t)v36;
        _os_log_impl(&dword_1C492D000, v30, OS_LOG_TYPE_DEBUG, "%@\n", buf, 0xCu);

        goto LABEL_18;
      }
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v30 = (id)qword_1EA3C9FE0;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
LABEL_18:

      ++v28;
    }
    while (v26 != v28);
    uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v37, (uint64_t)&v45, (uint64_t)v49, 16, v38);
    uint64_t v26 = v39;
  }
  while (v39);
LABEL_23:

  return v23;
}

- (CHTextTransformationResult)transformWithProgress:(SEL)a3 shouldCancel:(id)a4
{
  uint64_t v266 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v229 = a5;
  v234 = v7;
  v226 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v8, v9, v10, v11, v12);
  objc_msgSend_becomeCurrentWithPendingUnitCount_(v7, v13, 100, v14, v15, v16);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v17 = (id)qword_1EA3C9FC8;
  os_signpost_id_t spid = os_signpost_id_generate(v17);

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v230 = retstr;
  uint64_t v18 = (id)qword_1EA3C9FC8;
  uint64_t v19 = v18;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v19, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CHTextTransform", "", buf, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v20 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v20, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextTransform\"", buf, 2u);
  }

  uint64_t v22 = objc_msgSend__transformedTextLinesWithCancel_skipLineOrientationEstimate_useCache_progress_(self, v21, (uint64_t)v229, 0, 0, (uint64_t)v7);
  v233 = objc_msgSend_mutableCopy(v22, v23, v24, v25, v26, v27);

  uint64_t v28 = objc_opt_class();
  objc_msgSend_transformTextLines_withParameters_(v28, v29, (uint64_t)v233, (uint64_t)self->_transformationParameters, v30, v31);
  uint64_t v37 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v32, v33, v34, v35, v36);
  v230->var0 = v37;
  uint64_t v43 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v38, v39, v40, v41, v42);
  v230->var1 = v43;
  v231 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v44, v45, v46, v47, v48);
  v230->var2 = v231;
  long long v256 = 0u;
  long long v257 = 0u;
  long long v258 = 0u;
  long long v259 = 0u;
  obuint64_t j = v233;
  uint64_t v224 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v256, (uint64_t)v265, 16, v50);
  if (v224)
  {
    unint64_t v239 = 0;
    uint64_t v225 = *(void *)v257;
    do
    {
      for (uint64_t i = 0; i != v224; ++i)
      {
        if (*(void *)v257 != v225) {
          objc_enumerationMutation(obj);
        }
        uint64_t v56 = *(void **)(*((void *)&v256 + 1) + 8 * i);
        long long v252 = 0u;
        long long v253 = 0u;
        long long v254 = 0u;
        long long v255 = 0u;
        objc_msgSend_segments(v56, v51, v52, v53, v54, v55);
        id v235 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v235, v57, (uint64_t)&v252, (uint64_t)v264, 16, v58);
        if (v59)
        {
          uint64_t v236 = *(void *)v253;
          do
          {
            uint64_t v240 = 0;
            uint64_t v237 = v59;
            do
            {
              if (*(void *)v253 != v236) {
                objc_enumerationMutation(v235);
              }
              v60 = *(void **)(*((void *)&v252 + 1) + 8 * v240);
              uint64_t v66 = objc_opt_class();
              if (v60) {
                objc_msgSend_transform(v60, v61, v62, v63, v64, v65);
              }
              else {
                memset(v251, 0, sizeof(v251));
              }
              uint64_t v67 = objc_msgSend_textStrokePointTransformationFromAffineTransformation_(v66, v61, (uint64_t)v251, v63, v64, v65);
              objc_msgSend_addObject_(v43, v68, (uint64_t)v67, v69, v70, v71);

              v77 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v72, v73, v74, v75, v76);
              long long v249 = 0u;
              long long v250 = 0u;
              long long v247 = 0u;
              long long v248 = 0u;
              v83 = objc_msgSend_textStrokes(v60, v78, v79, v80, v81, v82);
              uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v84, (uint64_t)&v247, (uint64_t)v263, 16, v85);
              if (v91)
              {
                uint64_t v92 = *(void *)v248;
                do
                {
                  for (uint64_t j = 0; j != v91; ++j)
                  {
                    if (*(void *)v248 != v92) {
                      objc_enumerationMutation(v83);
                    }
                    v94 = objc_msgSend_strokeIdentifier(*(void **)(*((void *)&v247 + 1) + 8 * j), v86, v87, v88, v89, v90);
                    objc_msgSend_addObject_(v77, v95, (uint64_t)v94, v96, v97, v98);
                  }
                  uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v86, (uint64_t)&v247, (uint64_t)v263, 16, v90);
                }
                while (v91);
              }

              objc_msgSend_addObject_(v37, v99, (uint64_t)v77, v100, v101, v102);
              v108 = objc_msgSend_supportStrokes(v60, v103, v104, v105, v106, v107);
              uint64_t v238 = objc_msgSend_count(v108, v109, v110, v111, v112, v113);

              long long v245 = 0u;
              long long v246 = 0u;
              long long v243 = 0u;
              long long v244 = 0u;
              v119 = objc_msgSend_supportStrokes(v60, v114, v115, v116, v117, v118);
              uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v120, (uint64_t)&v243, (uint64_t)v262, 16, v121);
              if (v122)
              {
                uint64_t v123 = *(void *)v244;
                if (v60)
                {
                  do
                  {
                    for (uint64_t k = 0; k != v122; ++k)
                    {
                      if (*(void *)v244 != v123) {
                        objc_enumerationMutation(v119);
                      }
                      v125 = *(void **)(*((void *)&v243 + 1) + 8 * k);
                      v126 = objc_opt_class();
                      objc_msgSend_transform(v60, v127, v128, v129, v130, v131);
                      v136 = objc_msgSend_textStrokePointTransformationFromAffineTransformation_(v126, v132, (uint64_t)v242, v133, v134, v135);
                      objc_msgSend_addObject_(v43, v137, (uint64_t)v136, v138, v139, v140);

                      v146 = objc_msgSend_strokeIdentifier(v125, v141, v142, v143, v144, v145);
                      v261 = v146;
                      v150 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v147, (uint64_t)&v261, 1, v148, v149);
                      objc_msgSend_addObject_(v37, v151, (uint64_t)v150, v152, v153, v154);
                    }
                    uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v155, (uint64_t)&v243, (uint64_t)v262, 16, v156);
                  }
                  while (v122);
                }
                else
                {
                  do
                  {
                    for (uint64_t m = 0; m != v122; ++m)
                    {
                      if (*(void *)v244 != v123) {
                        objc_enumerationMutation(v119);
                      }
                      v158 = *(void **)(*((void *)&v243 + 1) + 8 * m);
                      v159 = objc_opt_class();
                      memset(v242, 0, sizeof(v242));
                      v164 = objc_msgSend_textStrokePointTransformationFromAffineTransformation_(v159, v160, (uint64_t)v242, v161, v162, v163);
                      objc_msgSend_addObject_(v43, v165, (uint64_t)v164, v166, v167, v168);

                      v174 = objc_msgSend_strokeIdentifier(v158, v169, v170, v171, v172, v173);
                      v261 = v174;
                      v178 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v175, (uint64_t)&v261, 1, v176, v177);
                      objc_msgSend_addObject_(v37, v179, (uint64_t)v178, v180, v181, v182);
                    }
                    uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v183, (uint64_t)&v243, (uint64_t)v262, 16, v184);
                  }
                  while (v122);
                }
              }

              v239 += v238;
              ++v240;
            }
            while (v240 != v237);
            uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v235, v185, (uint64_t)&v252, (uint64_t)v264, 16, v186);
          }
          while (v59);
        }
      }
      uint64_t v224 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v256, (uint64_t)v265, 16, v55);
    }
    while (v224);
  }
  else
  {
    unint64_t v239 = 0;
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v187 = (id)qword_1EA3C9FC8;
  v188 = v187;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v187))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v188, OS_SIGNPOST_INTERVAL_END, spid, "CHTextTransform", "", buf, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v189 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v189, OS_LOG_TYPE_DEFAULT, "END \"CHTextTransform\"", buf, 2u);
  }

  objc_msgSend_timeIntervalSinceNow(v226, v190, v191, v192, v193, v194);
  double v196 = v195;
  uint64_t v202 = objc_msgSend_count(self->_contextStrokes, v197, v198, v199, v200, v201);
  objc_msgSend_createTelemetryDictionary_nonTextRatio_(self, v203, v204, v205, v206, v207, v196 * -1000.0, (double)v239 / (double)(unint64_t)v202);
  v230->var2 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v213 = objc_msgSend_totalUnitCount(v234, v208, v209, v210, v211, v212);
  objc_msgSend_setCompletedUnitCount_(v234, v214, v213, v215, v216, v217);
  objc_msgSend_resignCurrent(v234, v218, v219, v220, v221, v222);

  return result;
}

- (id)reflowableTokensSkipLineOrientationEstimate:(BOOL)a3 useCache:(BOOL)a4 preserveTokenOrder:(BOOL)a5 shouldCancel:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v73 = a6;
  uint64_t v74 = objc_msgSend__transformedTextLinesWithCancel_skipLineOrientationEstimate_useCache_progress_(self, v10, (uint64_t)v73, v8, v7, 0);
  uint64_t v11 = objc_opt_class();
  uint64_t v16 = objc_msgSend_reflowableTextTokensFromTransformedTextLines_(v11, v12, (uint64_t)v74, v13, v14, v15);
  uint64_t v22 = (void *)v16;
  if (v6)
  {
    id v23 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v17, v18, v19, v20, v21);
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v24 = self->_contextResults;
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v79, (uint64_t)v90, 16, v26);
    if (v32)
    {
      uint64_t v33 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v80 != v33) {
            objc_enumerationMutation(v24);
          }
          uint64_t v35 = objc_msgSend_textResult(*(void **)(*((void *)&v79 + 1) + 8 * i), v27, v28, v29, v30, v31);
          uint64_t v39 = objc_msgSend_revertTokenOrder_textResult_(self, v36, (uint64_t)v22, (uint64_t)v35, v37, v38);
          objc_msgSend_addObjectsFromArray_(v23, v40, (uint64_t)v39, v41, v42, v43);
        }
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v79, (uint64_t)v90, 16, v31);
      }
      while (v32);
    }
  }
  else
  {
    id v23 = (void *)v16;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v44 = (id)qword_1EA3C9FE0;
  if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_20;
  }
  contextResults = self->_contextResults;
  if (!contextResults)
  {
    uint64_t v51 = 0;
    relatedNonTextStrokes = self->_relatedNonTextStrokes;
    if (relatedNonTextStrokes) {
      goto LABEL_16;
    }
LABEL_18:
    uint64_t v53 = 0;
    goto LABEL_19;
  }
  uint64_t v51 = objc_msgSend_count(contextResults, v45, v46, v47, v48, v49);
  relatedNonTextStrokes = self->_relatedNonTextStrokes;
  if (!relatedNonTextStrokes) {
    goto LABEL_18;
  }
LABEL_16:
  uint64_t v53 = objc_msgSend_count(relatedNonTextStrokes, v45, v46, v47, v48, v49);
LABEL_19:
  uint64_t v54 = objc_msgSend_count(v23, v45, v46, v47, v48, v49);
  *(_DWORD *)buf = 134218496;
  uint64_t v85 = v51;
  __int16 v86 = 2048;
  uint64_t v87 = v53;
  __int16 v88 = 2048;
  uint64_t v89 = v54;
  _os_log_impl(&dword_1C492D000, v44, OS_LOG_TYPE_DEBUG, "Computed reflowable results from %ld context results, and %ld related non-text strokes: created %ld reflowable tokens", buf, 0x20u);
LABEL_20:

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v55 = v23;
  uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v75, (uint64_t)v83, 16, v57);
  if (!v58) {
    goto LABEL_33;
  }
  uint64_t v59 = *(void *)v76;
  do
  {
    uint64_t v60 = 0;
    do
    {
      if (*(void *)v76 != v59) {
        objc_enumerationMutation(v55);
      }
      uint64_t v61 = *(void **)(*((void *)&v75 + 1) + 8 * v60);
      if (qword_1EA3CA000 == -1)
      {
        uint64_t v62 = (id)qword_1EA3C9FE0;
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
LABEL_27:
        v68 = objc_msgSend_description(v61, v63, v64, v65, v66, v67);
        *(_DWORD *)buf = 138412290;
        uint64_t v85 = (uint64_t)v68;
        _os_log_impl(&dword_1C492D000, v62, OS_LOG_TYPE_DEBUG, "%@\n", buf, 0xCu);

        goto LABEL_28;
      }
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v62 = (id)qword_1EA3C9FE0;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_27;
      }
LABEL_28:

      ++v60;
    }
    while (v58 != v60);
    uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v69, (uint64_t)&v75, (uint64_t)v83, 16, v70);
    uint64_t v58 = v71;
  }
  while (v71);
LABEL_33:

  return v55;
}

- (id)tokensAlignedWithInitialStrokesForTextResult:(id)a3
{
  id v4 = a3;
  uint64_t v10 = v4;
  if (self->_shouldExtractFromRefinablePath) {
    objc_msgSend_refinableTranscriptionPath(v4, v5, v6, v7, v8, v9);
  }
  else {
  uint64_t v11 = objc_msgSend_topModelTranscriptionPath(v4, v5, v6, v7, v8, v9);
  }
  uint64_t v14 = objc_msgSend_tokensAlignedWithStrokes_transcriptionPath_strokeProvider_(v10, v12, (uint64_t)self->_initialStrokes, (uint64_t)v11, (uint64_t)self->_strokeProvider, v13);

  return v14;
}

- (id)tokenSupportRangesForNonTextStrokes
{
  uint64_t v208 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_count(self->_relatedNonTextStrokes, a2, v2, v3, v4, v5))
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v13 = objc_msgSend_count(self->_relatedNonTextStrokes, v7, v8, v9, v10, v11);
    objc_msgSend_arrayWithCapacity_(v12, v14, v13, v15, v16, v17);
    id v183 = (id)objc_claimAutoreleasedReturnValue();
    long long v204 = 0u;
    long long v205 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    obuint64_t j = self->_relatedNonTextStrokes;
    uint64_t v184 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v202, (uint64_t)v207, 16, v19);
    if (v184)
    {
      uint64_t v182 = *(void *)v203;
      uint64_t v180 = v187;
      do
      {
        for (uint64_t i = 0; i != v184; ++i)
        {
          if (*(void *)v203 != v182) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void **)(*((void *)&v202 + 1) + 8 * i);
          uint64_t v26 = objc_msgSend_supportingStrokeIdentifiers(v25, v20, v21, v22, v23, v24, v180);
          uint64_t v32 = objc_msgSend_mutableCopy(v26, v27, v28, v29, v30, v31);

          unint64_t v38 = 0;
          uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
          double v40 = -1.79769313e308;
          while (v38 < objc_msgSend_count(self->_contextResults, v33, v34, v35, v36, v37))
          {
            uint64_t v45 = objc_msgSend_objectAtIndexedSubscript_(self->_contextResults, v41, v38, v42, v43, v44);
            uint64_t v51 = objc_msgSend_strokeGroup(v45, v46, v47, v48, v49, v50);
            uint64_t v57 = objc_msgSend_strokeIdentifiers(v51, v52, v53, v54, v55, v56);
            uint64_t v63 = objc_msgSend_allObjects(v57, v58, v59, v60, v61, v62);

            objc_msgSend_supportFromStrokes_(v25, v64, (uint64_t)v63, v65, v66, v67);
            double v69 = v68;
            objc_msgSend_averageSupportFromStrokes_(v25, v70, (uint64_t)v63, v71, v72, v73);
            if (v69 > v40)
            {
              double v80 = v79;
              uint64_t v81 = objc_msgSend_nonTextClassification(v25, v74, v75, v76, v77, v78);
              if (v80 >= 0.1 || v81 == 7)
              {
                uint64_t v39 = v38;
                double v40 = v69;
              }
            }
            objc_msgSend_removeObjectsInArray_(v32, v74, (uint64_t)v63, v76, v77, v78);

            ++v38;
          }
          objc_msgSend_supportFromStrokes_(v25, v41, (uint64_t)v32, v42, v43, v44);
          uint64_t v195 = 0;
          double v196 = &v195;
          uint64_t v197 = 0x4012000000;
          uint64_t v198 = sub_1C4AEB454;
          uint64_t v199 = nullsub_33;
          uint64_t v200 = &unk_1C4CB5C62;
          long long v201 = xmmword_1C4C3B320;
          if (v39 == 0x7FFFFFFFFFFFFFFFLL || v40 <= fmax(v87, 0.0))
          {
            objc_msgSend_addObject_(v183, v83, (uint64_t)&unk_1F203DC98, v84, v85, v86);
          }
          else
          {
            __int16 v88 = objc_opt_class();
            v94 = objc_msgSend_strokeIdentifier(v25, v89, v90, v91, v92, v93);
            uint64_t v100 = objc_msgSend_strokeProvider(self, v95, v96, v97, v98, v99);
            uint64_t v104 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(v88, v101, (uint64_t)v94, (uint64_t)v100, v102, v103);
            objc_msgSend_bounds(v104, v105, v106, v107, v108, v109);
            uint64_t v111 = v110;
            uint64_t v113 = v112;
            uint64_t v115 = v114;
            uint64_t v117 = v116;

            uint64_t v122 = objc_msgSend_objectAtIndexedSubscript_(self->_contextResults, v118, v39, v119, v120, v121);
            uint64_t v128 = objc_msgSend_textResult(v122, v123, v124, v125, v126, v127);
            uint64_t v134 = objc_msgSend_inputStrokeIdentifiers(v128, v129, v130, v131, v132, v133);

            uint64_t v139 = objc_msgSend_objectAtIndexedSubscript_(self->_contextResults, v135, v39, v136, v137, v138);
            uint64_t v145 = objc_msgSend_textResult(v139, v140, v141, v142, v143, v144);

            v150 = objc_msgSend_tokensAlignedWithInitialStrokesForTextResult_(self, v146, (uint64_t)v145, v147, v148, v149);
            v186[0] = MEMORY[0x1E4F143A8];
            v186[1] = 3221225472;
            v187[0] = sub_1C4AEB464;
            v187[1] = &unk_1E64E39E8;
            id v151 = v134;
            id v188 = v151;
            v189 = self;
            uint64_t v191 = v111;
            uint64_t v192 = v113;
            uint64_t v193 = v115;
            uint64_t v194 = v117;
            v190 = &v195;
            objc_msgSend_enumerateObjectsUsingBlock_(v150, v152, (uint64_t)v186, v153, v154, v155);
            if (v196[6] == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend_addObject_(v183, v156, (uint64_t)&unk_1F203DC80, v157, v158, v159);
            }
            else
            {
              v160 = objc_msgSend_numberWithInteger_(NSNumber, v156, v39, v157, v158, v159);
              v206[0] = v160;
              v165 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v161, v196[6], v162, v163, v164);
              v206[1] = v165;
              uint64_t v170 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v166, v196[7], v167, v168, v169);
              v206[2] = v170;
              v174 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v171, (uint64_t)v206, 3, v172, v173);
              objc_msgSend_addObject_(v183, v175, (uint64_t)v174, v176, v177, v178);
            }
          }
          _Block_object_dispose(&v195, 8);
        }
        uint64_t v184 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v202, (uint64_t)v207, 16, v24);
      }
      while (v184);
    }
  }
  else
  {
    id v183 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v183;
}

- (id)_transformedTextLinesWithCancel:(id)a3 skipLineOrientationEstimate:(BOOL)a4 useCache:(BOOL)a5 progress:(id)a6
{
  BOOL v7 = a5;
  uint64_t v516 = *MEMORY[0x1E4F143B8];
  v459 = (uint64_t (**)(void))a3;
  id v451 = a6;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11, v12, v13);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    BOOL v19 = !self->_shouldExtractFromRefinablePath;
    if (!self->_contextResults) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v19 = 0;
    if (!self->_contextResults)
    {
LABEL_8:
      uint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_141;
    }
  }
  if (!self->_strokeProvider || v459 && (v459[2]() & 1) != 0) {
    goto LABEL_8;
  }
  if (v451)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28F90];
    uint64_t v22 = objc_msgSend_count(self->_contextResults, v14, v15, v16, v17, v18);
    v447 = objc_msgSend_progressWithTotalUnitCount_parent_pendingUnitCount_(v21, v23, v22, (uint64_t)v451, 50, v24);
  }
  else
  {
    v447 = 0;
  }
  BOOL v446 = v19;
  v471 = self;
  v462 = objc_msgSend_tokenSupportRangesForNonTextStrokes(self, v14, v15, v16, v17, v18);
  id v25 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v30 = objc_msgSend_initWithArray_(v25, v26, (uint64_t)self->_contextStrokes, v27, v28, v29);
  long long v506 = 0u;
  long long v507 = 0u;
  long long v504 = 0u;
  long long v505 = 0u;
  uint64_t v31 = self->_relatedNonTextStrokes;
  uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v504, (uint64_t)v515, 16, v33);
  if (v39)
  {
    uint64_t v40 = *(void *)v505;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v505 != v40) {
          objc_enumerationMutation(v31);
        }
        uint64_t v42 = objc_msgSend_strokeIdentifier(*(void **)(*((void *)&v504 + 1) + 8 * i), v34, v35, v36, v37, v38);
        objc_msgSend_addObject_(v30, v43, (uint64_t)v42, v44, v45, v46);
      }
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v504, (uint64_t)v515, 16, v38);
    }
    while (v39);
  }

  unint64_t v467 = 0;
  *(void *)&long long v52 = 138412290;
  long long v445 = v52;
  while (v467 < objc_msgSend_count(v471->_contextResults, v47, v48, v49, v50, v51, v445))
  {
    if (v459 && v459[2]())
    {
      objc_msgSend_removeAllObjects(obj, v47, v53, v49, v50, v51);
      goto LABEL_118;
    }
    uint64_t v54 = objc_msgSend_objectAtIndexedSubscript_(v471->_contextResults, v47, v467, v49, v50, v51);
    v465 = objc_msgSend_strokeGroup(v54, v55, v56, v57, v58, v59);

    uint64_t v64 = objc_msgSend_objectAtIndexedSubscript_(v471->_contextResults, v60, v467, v61, v62, v63);
    v463 = objc_msgSend_textResult(v64, v65, v66, v67, v68, v69);

    v464 = objc_msgSend_inputStrokeIdentifiers(v463, v70, v71, v72, v73, v74);
    if (!v463
      || !v464
      || !v465
      || (excludedStrokeTypes = v471->_excludedStrokeTypes,
          uint64_t v81 = NSNumber,
          uint64_t v82 = objc_msgSend_classification(v465, v75, v76, v77, v78, v79),
          objc_msgSend_numberWithInteger_(v81, v83, v82, v84, v85, v86),
          double v87 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(excludedStrokeTypes) = objc_msgSend_containsObject_(excludedStrokeTypes, v88, (uint64_t)v87, v89, v90, v91), v87, (excludedStrokeTypes & 1) != 0))
    {

      goto LABEL_20;
    }
    if (a4)
    {
      BOOL v97 = 0;
      double v98 = 1.79769313e308;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v99 = v465;
        uint64_t v105 = objc_msgSend_writingDirectionSortedSubstrokes(v99, v100, v101, v102, v103, v104);
        BOOL v97 = (unint64_t)objc_msgSend_count(v105, v106, v107, v108, v109, v110) > 6;

        double v98 = 0.0;
        if (v97)
        {
          objc_msgSend_averageWritingOrientation(v99, v111, v112, v113, v114, v115);
          long double v117 = v116;
          objc_msgSend_averageWritingOrientation(v99, v118, v119, v120, v121, v122);
          double v98 = -atan2(v117, v123);
        }
      }
      else
      {
        BOOL v97 = 0;
        double v98 = 0.0;
      }
    }
    v457 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v92, v93, v94, v95, v96);
    v472 = 0;
    v473 = &v472;
    uint64_t v474 = 0x2020000000;
    LOBYTE(v475) = 1;
    uint64_t v500 = 0;
    v501 = &v500;
    uint64_t v502 = 0x2020000000;
    char v503 = 0;
    uint64_t v128 = objc_msgSend_tokensAlignedWithInitialStrokesForTextResult_(v471, v124, (uint64_t)v463, v125, v126, v127);
    v496[0] = MEMORY[0x1E4F143A8];
    v496[1] = 3221225472;
    v496[2] = sub_1C4AECBEC;
    v496[3] = &unk_1E64E3A10;
    id v458 = v457;
    id v497 = v458;
    v498 = &v472;
    v499 = &v500;
    v450 = v128;
    objc_msgSend_enumerateObjectsUsingBlock_(v128, v129, (uint64_t)v496, v130, v131, v132);
    if (*((unsigned char *)v501 + 24))
    {
      uint64_t v136 = objc_opt_class();
      uint64_t v141 = objc_msgSend_changeTokensToVisualOrder_(v136, v137, (uint64_t)v458, v138, v139, v140);
      uint64_t v147 = objc_msgSend_mutableCopy(v141, v142, v143, v144, v145, v146);

      id v458 = (id)v147;
    }
    uint64_t v148 = objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v133, (uint64_t)v464, (uint64_t)v471->_strokeProvider, v134, v135);
    uint64_t v452 = objc_msgSend_count(v148, v149, v150, v151, v152, v153);
    uint64_t v449 = objc_msgSend_count(v464, v154, v155, v156, v157, v158);
    if (v452 == v449)
    {
      if (v473[24])
      {
        uint64_t v159 = objc_opt_class();
        v165 = objc_msgSend_locale(v463, v160, v161, v162, v163, v164);
        uint64_t v171 = objc_msgSend_classification(v465, v166, v167, v168, v169, v170);
        v456 = objc_msgSend_textLineForTokensWithPrincipalLines_strokes_locale_strokeClassification_(v159, v172, (uint64_t)v458, (uint64_t)v148, (uint64_t)v165, v171);

        if (v456)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v173 = (id)qword_1EA3C9FE0;
          if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v174 = v173;
            v175 = "Succesfully loaded principal lines from recognition result tokens.";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v215 = (id)qword_1EA3C9FE0;
        if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v216 = v215;
          uint64_t v217 = "Failed to load principal lines from recognition result tokens.";
          goto LABEL_64;
        }
        goto LABEL_65;
      }
      if (v446 && v97)
      {
        uint64_t v195 = objc_opt_class();
        long long v201 = objc_msgSend_strokeProvider(v471, v196, v197, v198, v199, v200);
        uint64_t v207 = objc_msgSend_locale(v463, v202, v203, v204, v205, v206);
        uint64_t v213 = objc_msgSend_classification(v465, v208, v209, v210, v211, v212);
        v456 = objc_msgSend_textLineFromCachedResults_tokens_strokes_estimatedOrientation_locale_strokeClassification_(v195, v214, (uint64_t)v201, (uint64_t)v458, (uint64_t)v148, (uint64_t)v207, v213, v98);

        if (v456)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v173 = (id)qword_1EA3C9FE0;
          if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v174 = v173;
            v175 = "Succesfully loaded principal lines from cached results.";
            goto LABEL_71;
          }
LABEL_72:

          unint64_t v468 = 0;
          while (2)
          {
            if (v468 >= objc_msgSend_count(v471->_relatedNonTextStrokes, v232, v233, v234, v235, v236))
            {
              objc_msgSend_addObject_(obj, v237, (uint64_t)v456, v238, v239, v240);
              long long v490 = 0u;
              long long v491 = 0u;
              long long v488 = 0u;
              long long v489 = 0u;
              v368 = v464;
              uint64_t v375 = objc_msgSend_countByEnumeratingWithState_objects_count_(v368, v369, (uint64_t)&v488, (uint64_t)v509, 16, v370);
              if (v375)
              {
                uint64_t v376 = *(void *)v489;
                do
                {
                  for (uint64_t j = 0; j != v375; ++j)
                  {
                    if (*(void *)v489 != v376) {
                      objc_enumerationMutation(v368);
                    }
                    objc_msgSend_removeObject_(v30, v371, *(void *)(*((void *)&v488 + 1) + 8 * j), v372, v373, v374);
                  }
                  uint64_t v375 = objc_msgSend_countByEnumeratingWithState_objects_count_(v368, v371, (uint64_t)&v488, (uint64_t)v509, 16, v374);
                }
                while (v375);
              }
              goto LABEL_107;
            }
            v241 = objc_msgSend_objectAtIndexedSubscript_(v462, v237, v468, v238, v239, v240);
            v466 = v241;
            long long v247 = objc_msgSend_firstObject(v241, v242, v243, v244, v245, v246);
            objc_msgSend_numberWithInteger_(NSNumber, v248, v467, v249, v250, v251);
            id v252 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_isEqualToNumber_(v247, v253, (uint64_t)v252, v254, v255, v256))
            {
              BOOL v262 = objc_msgSend_count(v241, v257, v258, v259, v260, v261) == 3;

              if (v262)
              {
                v267 = objc_msgSend_objectAtIndexedSubscript_(v471->_relatedNonTextStrokes, v263, v468, v264, v265, v266);
                v273 = objc_msgSend_strokeIdentifier(v267, v268, v269, v270, v271, v272);
                long long v247 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v274, (uint64_t)v273, (uint64_t)v471->_strokeProvider, v275, v276);

                objc_msgSend_bounds(v247, v277, v278, v279, v280, v281);
                double v460 = v283;
                double v461 = v282;
                CGFloat v285 = v284;
                CGFloat v287 = v286;
                objc_msgSend_lineHeight(v456, v288, v289, v290, v291, v292);
                double v294 = v293;
                v299 = objc_msgSend_objectAtIndexedSubscript_(v466, v295, 1, v296, v297, v298);
                int v305 = objc_msgSend_intValue(v299, v300, v301, v302, v303, v304);
                v310 = objc_msgSend_objectAtIndexedSubscript_(v466, v306, 2, v307, v308, v309);
                LODWORD(v273) = objc_msgSend_intValue(v310, v311, v312, v313, v314, v315);

                uint64_t v453 = (int)v273;
                uint64_t v454 = v305;
                v319 = objc_msgSend_subarrayWithRange_(v458, v316, v305, (int)v273, v317, v318);
                CGFloat x = *MEMORY[0x1E4F1DB20];
                CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
                double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
                double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
                long long v492 = 0u;
                long long v493 = 0u;
                long long v494 = 0u;
                long long v495 = 0u;
                id v252 = v319;
                uint64_t v331 = objc_msgSend_countByEnumeratingWithState_objects_count_(v252, v324, (uint64_t)&v492, (uint64_t)v510, 16, v325);
                if (v331)
                {
                  uint64_t v332 = *(void *)v493;
                  do
                  {
                    for (uint64_t k = 0; k != v331; ++k)
                    {
                      if (*(void *)v493 != v332) {
                        objc_enumerationMutation(v252);
                      }
                      v334 = objc_msgSend_strokeIndexes(*(void **)(*((void *)&v492 + 1) + 8 * k), v326, v327, v328, v329, v330);
                      v339 = objc_msgSend_objectsAtIndexes_(v148, v335, (uint64_t)v334, v336, v337, v338);

                      objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v340, (uint64_t)v339, v341, v342, v343);
                      v524.origin.CGFloat x = v344;
                      v524.origin.CGFloat y = v345;
                      v524.size.double width = v346;
                      v524.size.double height = v347;
                      v518.origin.CGFloat x = x;
                      v518.origin.CGFloat y = y;
                      v518.size.double width = width;
                      v518.size.double height = height;
                      CGRect v519 = CGRectUnion(v518, v524);
                      CGFloat x = v519.origin.x;
                      CGFloat y = v519.origin.y;
                      double width = v519.size.width;
                      double height = v519.size.height;
                    }
                    uint64_t v331 = objc_msgSend_countByEnumeratingWithState_objects_count_(v252, v326, (uint64_t)&v492, (uint64_t)v510, 16, v330);
                  }
                  while (v331);
                }

                double v455 = v294;
                v520.origin.CGFloat x = x;
                v520.origin.CGFloat y = y;
                v520.size.double width = width;
                v520.size.double height = height;
                double MinY = CGRectGetMinY(v520);
                CGFloat v349 = v285;
                v521.origin.CGFloat x = v285;
                v521.origin.CGFloat y = v287;
                v521.size.double height = v460;
                v521.size.double width = v461;
                double MaxY = CGRectGetMaxY(v521);
                v522.origin.CGFloat x = v349;
                v522.origin.CGFloat y = v287;
                v522.size.double height = v460;
                v522.size.double width = v461;
                double v351 = CGRectGetMinY(v522);
                v523.origin.CGFloat x = x;
                v523.origin.CGFloat y = y;
                v523.size.double width = width;
                v523.size.double height = height;
                double v354 = CGRectGetMaxY(v523);
                BOOL v355 = v460 / height < 2.5 && v461 / width < 1.75;
                double v356 = fmax(MinY - MaxY, v351 - v354) / v455;
                if (v355 && v356 < 1.25)
                {
                  objc_msgSend_addSupportStroke_tokenRange_(v456, v352, (uint64_t)v247, v454, v453, v353, v356);
                  v363 = objc_msgSend_encodedStrokeIdentifier(v247, v358, v359, v360, v361, v362);
                  objc_msgSend_removeObject_(v30, v364, (uint64_t)v363, v365, v366, v367);
                }
                goto LABEL_92;
              }
            }
            else
            {
LABEL_92:
            }
            ++v468;
            continue;
          }
        }
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v215 = (id)qword_1EA3C9FE0;
        if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v216 = v215;
          uint64_t v217 = "Failed to load principal lines from cached results.";
LABEL_64:
          _os_log_impl(&dword_1C492D000, v216, OS_LOG_TYPE_DEFAULT, v217, buf, 2u);
        }
LABEL_65:
      }
      v218 = objc_opt_class();
      uint64_t v224 = objc_msgSend_locale(v463, v219, v220, v221, v222, v223);
      uint64_t v230 = objc_msgSend_classification(v465, v225, v226, v227, v228, v229);
      v456 = objc_msgSend_textLineForStrokes_tokens_locale_strokeClassification_initialOrientationEstimate_shouldCancel_(v218, v231, (uint64_t)v148, (uint64_t)v458, (uint64_t)v224, v230, v459, v98);

      if (v456)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v173 = (id)qword_1EA3C9FE0;
        if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v174 = v173;
          v175 = "Succesfully found principal lines from alpha shape matching.";
LABEL_71:
          _os_log_impl(&dword_1C492D000, v174, OS_LOG_TYPE_DEFAULT, v175, buf, 2u);
        }
        goto LABEL_72;
      }
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v368 = (id)qword_1EA3C9FE0;
      if (os_log_type_enabled(v368, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v368, OS_LOG_TYPE_DEFAULT, "Failed to find principal lines from alpha shape matching.", buf, 2u);
      }
      v456 = 0;
LABEL_107:

      if (v451)
      {
        uint64_t v383 = objc_msgSend_completedUnitCount(v447, v378, v379, v380, v381, v382);
        objc_msgSend_setCompletedUnitCount_(v447, v384, v383 + 1, v385, v386, v387);
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v388 = (id)qword_1EA3C9FE0;
        if (os_log_type_enabled(v388, OS_LOG_TYPE_DEBUG))
        {
          v394 = objc_msgSend_localizedDescription(v447, v389, v390, v391, v392, v393);
          *(_DWORD *)buf = v445;
          uint64_t v512 = (uint64_t)v394;
          _os_log_impl(&dword_1C492D000, v388, OS_LOG_TYPE_DEBUG, "Reflow Task Progress (transform): %@", buf, 0xCu);
        }
      }

      uint64_t v194 = v449;
      goto LABEL_114;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v176 = (id)qword_1EA3C9FE0;
    if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
    {
      uint64_t v182 = objc_msgSend_count(v464, v177, v178, v179, v180, v181);
      uint64_t v188 = objc_msgSend_count(v148, v183, v184, v185, v186, v187);
      *(_DWORD *)buf = 134218240;
      uint64_t v512 = v182;
      __int16 v513 = 2048;
      uint64_t v514 = v188;
      _os_log_impl(&dword_1C492D000, v176, OS_LOG_TYPE_ERROR, "Incorrect number of strokes in text line: %ld strokes expected, %ld strokes retrieved from the provider.", buf, 0x16u);
    }

    objc_msgSend_removeAllObjects(obj, v189, v190, v191, v192, v193);
    uint64_t v194 = v449;
LABEL_114:
    BOOL v395 = v452 == v194;

    _Block_object_dispose(&v500, 8);
    _Block_object_dispose(&v472, 8);

    if (!v395) {
      break;
    }
LABEL_20:
    ++v467;
  }
  if (v459)
  {
LABEL_118:
    if (v459[2]()) {
      objc_msgSend_removeAllObjects(obj, v47, v48, v49, v50, v51);
    }
  }
  if (objc_msgSend_count(obj, v47, v48, v49, v50, v51) && objc_msgSend_count(v30, v396, v397, v398, v399, v400))
  {
    id v487 = 0;
    v401 = objc_msgSend_addNonTextSegmentsAndLines_remainingStrokes_outNonTextStrokes_(v471, v396, (uint64_t)obj, (uint64_t)v30, (uint64_t)&v487, v400);
    id v402 = v487;
    uint64_t v408 = objc_msgSend_mutableCopy(v401, v403, v404, v405, v406, v407);

    v485[0] = MEMORY[0x1E4F143A8];
    v485[1] = 3221225472;
    v485[2] = sub_1C4AECD48;
    v485[3] = &unk_1E64E3A38;
    id v409 = v30;
    id v486 = v409;
    objc_msgSend_enumerateObjectsUsingBlock_(v402, v410, (uint64_t)v485, v411, v412, v413);
    objc_msgSend_assignRemainingStrokes_toTextLines_(v471, v414, (uint64_t)v409, v408, v415, v416);

    obuint64_t j = (id)v408;
  }
  if (v447)
  {
    uint64_t v417 = objc_msgSend_totalUnitCount(v447, v396, v397, v398, v399, v400);
    objc_msgSend_setCompletedUnitCount_(v447, v418, v417, v419, v420, v421);
  }
  long long v483 = 0u;
  long long v484 = 0u;
  long long v481 = 0u;
  long long v482 = 0u;
  id obja = obj;
  uint64_t v429 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v422, (uint64_t)&v481, (uint64_t)v508, 16, v423);
  if (v429)
  {
    uint64_t v430 = *(void *)v482;
    do
    {
      for (uint64_t m = 0; m != v429; ++m)
      {
        if (*(void *)v482 != v430) {
          objc_enumerationMutation(obja);
        }
        objc_msgSend_principalLines(*(void **)(*((void *)&v481 + 1) + 8 * m), v424, v425, v426, v427, v428);
        long double v432 = atan2(*((double *)v475 + 3) - *((double *)v475 + 1), *((double *)v475 + 2) - *(double *)v475);
        correctionAngles = v471->_correctionAngles;
        v439 = objc_msgSend_numberWithDouble_(NSNumber, v434, v435, v436, v437, v438, (double)(v432 * 57.2957795));
        objc_msgSend_addObject_(correctionAngles, v440, (uint64_t)v439, v441, v442, v443);

        if (__p)
        {
          v480 = __p;
          operator delete(__p);
        }
        if (v477)
        {
          v478 = v477;
          operator delete(v477);
        }
        if (v475)
        {
          v476 = v475;
          operator delete(v475);
        }
        if (v472)
        {
          v473 = v472;
          operator delete(v472);
        }
      }
      uint64_t v429 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v424, (uint64_t)&v481, (uint64_t)v508, 16, v428);
    }
    while (v429);
  }

  obuint64_t j = obja;
  uint64_t v20 = obj;
LABEL_141:

  return v20;
}

+ (void)transformTextLines:(id)a3 withParameters:(id)a4
{
  uint64_t v264 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_orientationBehavior(v6, v7, v8, v9, v10, v11))
  {
    uint64_t v17 = objc_opt_class();
    uint64_t v23 = objc_msgSend_orientationBehavior(v6, v18, v19, v20, v21, v22);
    objc_msgSend_orientationTarget(v6, v24, v25, v26, v27, v28);
    objc_msgSend_applyOrientationToTextLines_orientationBehavior_orientationTarget_(v17, v29, (uint64_t)v5, v23, v30, v31);
  }
  if (objc_msgSend_resizeBehavior(v6, v12, v13, v14, v15, v16))
  {
    uint64_t v37 = objc_opt_class();
    uint64_t v43 = objc_msgSend_resizeBehavior(v6, v38, v39, v40, v41, v42);
    uint64_t v49 = objc_msgSend_textSizeTarget(v6, v44, v45, v46, v47, v48);
    objc_msgSend_textSizeModifier(v6, v50, v51, v52, v53, v54);
    objc_msgSend_applyResizeToTextLines_resizeBehavior_resizeTarget_resizeModifier_(v37, v55, (uint64_t)v5, v43, v49, v56);
  }
  objc_msgSend_italicsModifier(v6, v32, v33, v34, v35, v36);
  if (v62 > 0.0)
  {
    long long v261 = 0u;
    long long v262 = 0u;
    long long v259 = 0u;
    long long v260 = 0u;
    id v63 = v5;
    uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v259, (uint64_t)v263, 16, v65);
    if (v66)
    {
      uint64_t v67 = *(void *)v260;
      do
      {
        uint64_t v68 = 0;
        do
        {
          if (*(void *)v260 != v67) {
            objc_enumerationMutation(v63);
          }
          uint64_t v69 = *(void **)(*((void *)&v259 + 1) + 8 * v68);
          long long v257 = 0u;
          long long v258 = 0u;
          long long v256 = 0u;
          uint64_t v70 = objc_opt_class();
          objc_msgSend_italicsModifier(v6, v71, v72, v73, v74, v75);
          if (v70)
          {
            objc_msgSend_getItalicsTransformForTextLine_skew_(v70, v76, (uint64_t)v69, v77, v78, v79, -v80);
          }
          else
          {
            long long v257 = 0u;
            long long v258 = 0u;
            long long v256 = 0u;
          }
          v255[0] = v256;
          v255[1] = v257;
          v255[2] = v258;
          objc_msgSend_addTransform_(v69, v76, (uint64_t)v255, v77, v78, v79);
          ++v68;
        }
        while (v66 != v68);
        uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v81, (uint64_t)&v259, (uint64_t)v263, 16, v82);
      }
      while (v66);
    }
  }
  objc_msgSend_insertionPoint(v6, v57, v58, v59, v60, v61);
  if (v88 != -1.0)
  {
    objc_msgSend_insertionPoint(v6, v83, v84, v85, v86, v87);
    if (v89 != -1.0)
    {
      long long v257 = 0u;
      long long v258 = 0u;
      long long v256 = 0u;
      uint64_t v90 = objc_opt_class();
      uint64_t v96 = objc_msgSend_firstObject(v5, v91, v92, v93, v94, v95);
      objc_msgSend_anchorPoint(v96, v97, v98, v99, v100, v101);
      double v103 = v102;
      double v105 = v104;
      objc_msgSend_insertionPoint(v6, v106, v107, v108, v109, v110);
      if (v90)
      {
        objc_msgSend_getTranslateTransformForAnchorPoint_targetPoint_(v90, v111, v112, v113, v114, v115, v103, v105, v116, v117);
      }
      else
      {
        long long v257 = 0u;
        long long v258 = 0u;
        long long v256 = 0u;
      }

      long double v123 = objc_msgSend_firstObject(v5, v118, v119, v120, v121, v122);
      v254[0] = v256;
      v254[1] = v257;
      v254[2] = v258;
      objc_msgSend_addTransform_(v123, v124, (uint64_t)v254, v125, v126, v127);
    }
  }
  if (objc_msgSend_wrapLines(v6, v83, v84, v85, v86, v87))
  {
    uint64_t v133 = objc_opt_class();
    uint64_t v139 = objc_msgSend_lineSpaceBehavior(v6, v134, v135, v136, v137, v138);
    uint64_t v145 = objc_msgSend_alignmentBehavior(v6, v140, v141, v142, v143, v144);
    uint64_t v151 = objc_msgSend_leftMargin(v6, v146, v147, v148, v149, v150);
    uint64_t v157 = objc_msgSend_rightMargin(v6, v152, v153, v154, v155, v156);
    objc_msgSend_insertionPoint(v6, v158, v159, v160, v161, v162);
    uint64_t v164 = objc_msgSend_applyWrapToTextLines_lineSpaceBehavior_alignmentBehavior_leftMargin_rightMargin_insertionPoint_(v133, v163, (uint64_t)v5, v139, v145, v151, v157);

    id v5 = (id)v164;
  }
  if ((unint64_t)objc_msgSend_count(v5, v128, v129, v130, v131, v132) >= 2
    && objc_msgSend_mergeLines(v6, v165, v166, v167, v168, v169))
  {
    uint64_t v170 = objc_opt_class();
    uint64_t v176 = objc_msgSend_alignmentBehavior(v6, v171, v172, v173, v174, v175);
    uint64_t v182 = objc_msgSend_leftMargin(v6, v177, v178, v179, v180, v181);
    uint64_t v188 = objc_msgSend_rightMargin(v6, v183, v184, v185, v186, v187);
    objc_msgSend_insertionPoint(v6, v189, v190, v191, v192, v193);
    uint64_t v195 = objc_msgSend_applyMergeToTextLines_alignmentBehavior_leftMargin_rightMargin_insertionPoint_(v170, v194, (uint64_t)v5, v176, v182, v188);

    id v5 = (id)v195;
  }
  if (objc_msgSend_alignmentBehavior(v6, v165, v166, v167, v168, v169))
  {
    objc_msgSend_insertionPoint(v6, v196, v197, v198, v199, v200);
    if (v206 == -1.0)
    {
      BOOL v208 = 1;
    }
    else
    {
      objc_msgSend_insertionPoint(v6, v201, v202, v203, v204, v205);
      BOOL v208 = v207 == -1.0;
    }
    uint64_t v209 = objc_opt_class();
    uint64_t v215 = objc_msgSend_alignmentBehavior(v6, v210, v211, v212, v213, v214);
    uint64_t v221 = objc_msgSend_leftMargin(v6, v216, v217, v218, v219, v220);
    uint64_t v227 = objc_msgSend_rightMargin(v6, v222, v223, v224, v225, v226);
    objc_msgSend_applyAlignmentToTextLines_alignmentBehavior_leftMargin_rightMargin_alignFirstLine_(v209, v228, (uint64_t)v5, v215, v221, v227, v208);
  }
  if ((unint64_t)objc_msgSend_count(v5, v196, v197, v198, v199, v200) >= 2
    && objc_msgSend_lineSpaceBehavior(v6, v229, v230, v231, v232, v233))
  {
    uint64_t v239 = objc_msgSend_orientationBehavior(v6, v234, v235, v236, v237, v238);
    uint64_t v240 = objc_opt_class();
    uint64_t v246 = objc_msgSend_lineSpaceBehavior(v6, v241, v242, v243, v244, v245);
    uint64_t v252 = objc_msgSend_lineSpaceTarget(v6, v247, v248, v249, v250, v251);
    objc_msgSend_applyLineSpacingToTextLines_lineSpaceBehavior_lineSpaceTarget_linesAreParallel_(v240, v253, (uint64_t)v5, v246, v252, v239 != 0);
  }
}

+ (void)applyOrientationToTextLines:(id)a3 orientationBehavior:(unint64_t)a4 orientationTarget:(double)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v12 = v7;
  if (a4)
  {
    if (a4 != 3)
    {
      if (a4 == 1)
      {
        uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, 0, v9, v10, v11);
        objc_msgSend_orientation(v13, v14, v15, v16, v17, v18);
        a5 = v19;
      }
      else
      {
        a5 = 0.0;
      }
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v20 = v12;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v38, (uint64_t)v42, 16, v22);
    if (v23)
    {
      uint64_t v24 = *(void *)v39;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v39 != v24) {
            objc_enumerationMutation(v20);
          }
          uint64_t v26 = *(void **)(*((void *)&v38 + 1) + 8 * v25);
          long long v36 = 0u;
          long long v37 = 0u;
          long long v35 = 0u;
          uint64_t v27 = objc_opt_class();
          if (v27)
          {
            objc_msgSend_rotationTransformForTextLine_targetAngle_(v27, v28, (uint64_t)v26, v29, v30, v31, a5);
          }
          else
          {
            long long v36 = 0u;
            long long v37 = 0u;
            long long v35 = 0u;
          }
          v34[0] = v35;
          v34[1] = v36;
          v34[2] = v37;
          objc_msgSend_addTransform_(v26, v28, (uint64_t)v34, v29, v30, v31);
          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v32, (uint64_t)&v38, (uint64_t)v42, 16, v33);
      }
      while (v23);
    }
  }
}

+ (void)applyResizeToTextLines:(id)a3 resizeBehavior:(unint64_t)a4 resizeTarget:(unint64_t)a5 resizeModifier:(double)a6
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v15 = v9;
  if (a4 == 4)
  {
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v24 = v9;
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v80, (uint64_t)v85, 16, v26);
    if (v32)
    {
      uint64_t v33 = *(void *)v81;
      double v34 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v81 != v33) {
            objc_enumerationMutation(v24);
          }
          objc_msgSend_lineHeight(*(void **)(*((void *)&v80 + 1) + 8 * i), v27, v28, v29, v30, v31);
          double v34 = v34 + v36;
        }
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v80, (uint64_t)v85, 16, v31);
      }
      while (v32);
    }
    else
    {
      double v34 = 0.0;
    }

    double v16 = v34 / (double)(unint64_t)objc_msgSend_count(v24, v37, v38, v39, v40, v41);
    goto LABEL_16;
  }
  if (a4 == 3)
  {
    double v16 = (double)a5;
    goto LABEL_17;
  }
  double v16 = 18.0;
  if (a4 != 1)
  {
LABEL_16:
    if (!a4) {
      goto LABEL_37;
    }
    goto LABEL_17;
  }
  uint64_t v17 = objc_msgSend_firstObject(v9, v10, v11, v12, v13, v14);
  objc_msgSend_lineHeight(v17, v18, v19, v20, v21, v22);
  double v16 = v23;

LABEL_17:
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v42 = v15;
  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v76, (uint64_t)v84, 16, v44);
  if (v50)
  {
    uint64_t v51 = *(void *)v77;
    if (a4 == 2)
    {
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v77 != v51) {
            objc_enumerationMutation(v42);
          }
          uint64_t v53 = *(void **)(*((void *)&v76 + 1) + 8 * j);
          objc_msgSend_lineHeight(v53, v45, v46, v47, v48, v49);
          double v55 = v54;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v73 = 0u;
          uint64_t v56 = objc_opt_class();
          if (v56)
          {
            objc_msgSend_getResizeTransformForTextLine_targetSize_(v56, v57, (uint64_t)v53, v58, v59, v60, v55 * a6);
          }
          else
          {
            long long v74 = 0u;
            long long v75 = 0u;
            long long v73 = 0u;
          }
          long long v70 = v73;
          long long v71 = v74;
          long long v72 = v75;
          objc_msgSend_addTransform_(v53, v57, (uint64_t)&v70, v58, v59, v60);
        }
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v76, (uint64_t)v84, 16, v49);
      }
      while (v50);
    }
    else
    {
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v77 != v51) {
            objc_enumerationMutation(v42);
          }
          double v62 = *(void **)(*((void *)&v76 + 1) + 8 * k);
          long long v74 = 0u;
          long long v75 = 0u;
          long long v73 = 0u;
          id v63 = objc_opt_class();
          if (v63)
          {
            objc_msgSend_getResizeTransformForTextLine_targetSize_(v63, v64, (uint64_t)v62, v65, v66, v67, v16);
          }
          else
          {
            long long v74 = 0u;
            long long v75 = 0u;
            long long v73 = 0u;
          }
          long long v70 = v73;
          long long v71 = v74;
          long long v72 = v75;
          objc_msgSend_addTransform_(v62, v64, (uint64_t)&v70, v65, v66, v67);
        }
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v68, (uint64_t)&v76, (uint64_t)v84, 16, v69);
      }
      while (v50);
    }
  }

LABEL_37:
}

+ (id)applyWrapToTextLines:(id)a3 lineSpaceBehavior:(unint64_t)a4 alignmentBehavior:(unint64_t)a5 leftMargin:(unint64_t)a6 rightMargin:(unint64_t)a7 insertionPoint:(CGPoint)a8
{
  double y = a8.y;
  double x = a8.x;
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v118 = a3;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v14, v15, v16, v17, v18);
  id v121 = (id)objc_claimAutoreleasedReturnValue();
  double v23 = (double)a6;
  double v24 = (double)a7;
  double v25 = (double)a7;
  double v26 = (double)a6;
  if (a5 == 1)
  {
    uint64_t v27 = objc_msgSend_objectAtIndexedSubscript_(v118, v19, 0, v20, v21, v22);
    uint64_t v33 = objc_msgSend_strokeClassification(v27, v28, v29, v30, v31, v32);

    uint64_t v38 = objc_msgSend_objectAtIndexedSubscript_(v118, v34, 0, v35, v36, v37);
    objc_msgSend_anchorPoint(v38, v39, v40, v41, v42, v43);
    if (v33 == 2)
    {
      double v25 = v44;
      double v26 = (double)a6;
    }
    else
    {
      double v26 = v44;
      double v25 = (double)a7;
    }
  }
  unint64_t v119 = a6;
  unint64_t v120 = a7;
  long long v124 = 0u;
  long long v125 = 0u;
  BOOL v45 = y != -1.0 && x != -1.0;
  long long v122 = 0uLL;
  long long v123 = 0uLL;
  id v46 = v118;
  unint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v122, (uint64_t)v126, 16, v48);
  if (v54)
  {
    uint64_t v55 = *(void *)v123;
    do
    {
      if (*(void *)v123 != v55) {
        objc_enumerationMutation(v46);
      }
      uint64_t v56 = (void *)**((void **)&v122 + 1);
      if (a5)
      {
        if (v45)
        {
          if (objc_msgSend_strokeClassification(**((void ***)&v122 + 1), v49, v50, v51, v52, v53) == 2) {
            double v25 = x;
          }
          else {
            double v26 = x;
          }
        }
      }
      else
      {
        uint64_t v57 = objc_msgSend_objectAtIndexedSubscript_(v46, v49, 0, v51, v52, v53);
        BOOL v63 = objc_msgSend_strokeClassification(v57, v58, v59, v60, v61, v62) == 2;

        objc_msgSend_anchorPoint(v56, v64, v65, v66, v67, v68);
        if (v63)
        {
          double v25 = v69;
          double v26 = v23;
        }
        else
        {
          double v26 = v69;
          double v25 = v24;
        }
      }
      long long v70 = objc_opt_class();
      long long v79 = objc_msgSend_splitTextLine_maxLength_(v70, v71, (uint64_t)v56, v72, v73, v74, v25 - v26);
      if (!a5)
      {
        long long v80 = objc_opt_class();
        objc_msgSend_applyAlignmentToTextLines_alignmentBehavior_leftMargin_rightMargin_alignFirstLine_(v80, v81, (uint64_t)v79, 1, v119, v120, !v45);
      }
      if (!a4)
      {
        long long v82 = objc_opt_class();
        objc_msgSend_applyLineSpacingToTextLines_lineSpaceBehavior_lineSpaceTarget_linesAreParallel_(v82, v83, (uint64_t)v79, 1, 0, 1);
      }
      objc_msgSend_addObjectsFromArray_(v121, v75, (uint64_t)v79, v76, v77, v78);

      if (v54 >= 2)
      {
        for (uint64_t i = 1; i != v54; ++i)
        {
          if (*(void *)v123 != v55) {
            objc_enumerationMutation(v46);
          }
          double v89 = *(void **)(*((void *)&v122 + 1) + 8 * i);
          if (!a5)
          {
            uint64_t v90 = objc_msgSend_objectAtIndexedSubscript_(v46, v84, 0, v85, v86, v87);
            BOOL v96 = objc_msgSend_strokeClassification(v90, v91, v92, v93, v94, v95) == 2;

            objc_msgSend_anchorPoint(v89, v97, v98, v99, v100, v101);
            if (v96)
            {
              double v25 = v102;
              double v26 = v23;
            }
            else
            {
              double v26 = v102;
              double v25 = v24;
            }
          }
          double v103 = objc_opt_class();
          uint64_t v112 = objc_msgSend_splitTextLine_maxLength_(v103, v104, (uint64_t)v89, v105, v106, v107, v25 - v26);
          if (!a5)
          {
            uint64_t v113 = objc_opt_class();
            objc_msgSend_applyAlignmentToTextLines_alignmentBehavior_leftMargin_rightMargin_alignFirstLine_(v113, v114, (uint64_t)v112, 1, v119, v120, 1);
          }
          if (!a4)
          {
            uint64_t v115 = objc_opt_class();
            objc_msgSend_applyLineSpacingToTextLines_lineSpaceBehavior_lineSpaceTarget_linesAreParallel_(v115, v116, (uint64_t)v112, 1, 0, 1);
          }
          objc_msgSend_addObjectsFromArray_(v121, v108, (uint64_t)v112, v109, v110, v111);
        }
      }
      unint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v84, (uint64_t)&v122, (uint64_t)v126, 16, v87);
      BOOL v45 = 0;
    }
    while (v54);
  }

  return v121;
}

+ (id)applyMergeToTextLines:(id)a3 alignmentBehavior:(unint64_t)a4 leftMargin:(unint64_t)a5 rightMargin:(unint64_t)a6 insertionPoint:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  uint64_t v292 = *MEMORY[0x1E4F143B8];
  id v271 = a3;
  if ((unint64_t)objc_msgSend_count(v271, v11, v12, v13, v14, v15) > 1)
  {
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v16, v17, v18, v19, v20);
    id v275 = (id)objc_claimAutoreleasedReturnValue();
    double v27 = (double)a5;
    double v28 = (double)a6;
    double v272 = (double)a6;
    double v273 = (double)a5;
    if (a4 <= 1)
    {
      uint64_t v29 = objc_msgSend_objectAtIndexedSubscript_(v271, v22, 0, v24, v25, v26);
      uint64_t v35 = objc_msgSend_strokeClassification(v29, v30, v31, v32, v33, v34);

      uint64_t v40 = objc_msgSend_objectAtIndexedSubscript_(v271, v36, 0, v37, v38, v39);
      objc_msgSend_anchorPoint(v40, v41, v42, v43, v44, v45);
      if (v35 == 2)
      {
        double v28 = v46;
        double v27 = v273;
      }
      else
      {
        double v27 = v46;
        double v28 = v272;
      }
    }
    double v47 = v28 - v27;
    if (x != -1.0)
    {
      double v47 = v28 - v27;
      if (y != -1.0)
      {
        uint64_t v48 = objc_msgSend_firstObject(v271, v22, v23, v24, v25, v26);
        uint64_t v54 = objc_msgSend_strokeClassification(v48, v49, v50, v51, v52, v53);

        double v47 = x - v27;
        if (v54 != 2) {
          double v47 = v28 - x;
        }
      }
    }
    double v280 = v47;
    uint64_t v55 = objc_msgSend_objectAtIndexedSubscript_(v271, v22, 0, v24, v25, v26);
    long long v289 = 0u;
    long long v290 = 0u;
    long long v287 = 0u;
    long long v288 = 0u;
    uint64_t v61 = objc_msgSend_count(v271, v56, v57, v58, v59, v60);
    objc_msgSend_subarrayWithRange_(v271, v62, 1, v61 - 1, v63, v64);
    obunint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v65, (uint64_t)&v287, (uint64_t)v291, 16, v66);
    if (v67)
    {
      uint64_t v277 = *(void *)v288;
      uint64_t v73 = MEMORY[0x1E4F1DAB8];
      do
      {
        uint64_t v278 = v67;
        for (uint64_t i = 0; i != v278; ++i)
        {
          if (*(void *)v288 != v277) {
            objc_enumerationMutation(obj);
          }
          uint64_t v279 = *(void **)(*((void *)&v287 + 1) + 8 * i);
          long long v75 = objc_msgSend_splitIntoTokens(v279, v68, v69, v70, v71, v72);
          if (objc_msgSend_count(v75, v76, v77, v78, v79, v80))
          {
            uint64_t v85 = objc_msgSend_objectAtIndexedSubscript_(v75, v81, 0, v82, v83, v84);
            uint64_t v91 = objc_msgSend_tokens(v85, v86, v87, v88, v89, v90);
            BOOL v97 = objc_msgSend_lastObject(v91, v92, v93, v94, v95, v96);
            BOOL v103 = (objc_msgSend_properties(v97, v98, v99, v100, v101, v102) & 0x20) == 0;

            if (!v103) {
              goto LABEL_20;
            }
            uint64_t v109 = objc_msgSend_segments(v55, v104, v105, v106, v107, v108);
            uint64_t v115 = objc_msgSend_lastObject(v109, v110, v111, v112, v113, v114);
            id v121 = objc_msgSend_locale(v115, v116, v117, v118, v119, v120);
            uint64_t v126 = objc_msgSend_defaultWordTerminationCharacterForLocale_(CHContextualTextResult, v122, (uint64_t)v121, v123, v124, v125);
            int isEqualToString = objc_msgSend_isEqualToString_(v126, v127, @" ", v128, v129, v130);

            if (!isEqualToString)
            {
              double v143 = *(double *)(v73 + 40);
            }
            else
            {
LABEL_20:
              uint64_t v137 = objc_opt_class();
              objc_msgSend_lineHeight(v55, v138, v139, v140, v141, v142);
              if (v137)
              {
                objc_msgSend_getInsertSpaceTransform_spaceSize_(v137, v132, (uint64_t)v55, v134, v135, v136);
                double v143 = *((double *)&v286 + 1);
              }
              else
              {
                double v143 = 0.0;
              }
            }
            objc_msgSend_boundingBox(v55, v132, v133, v134, v135, v136);
            double v145 = v144;
            double v147 = v146;
            objc_msgSend_boundingBox(v85, v148, v149, v150, v151, v152);
            if (v143 + v147 - v145 + v159 - v158 >= v280)
            {
              unint64_t k = 0;
LABEL_28:
              objc_msgSend_addObject_(v275, v153, (uint64_t)v55, v155, v156, v157);
              id v172 = v85;
              for (unint64_t j = k + 1; ; ++j)
              {

                if (j >= objc_msgSend_count(v75, v174, v175, v176, v177, v178)) {
                  break;
                }
                uint64_t v55 = objc_msgSend_objectAtIndexedSubscript_(v75, v179, j, v181, v182, v183);
                objc_msgSend_mergeTransformedText_(v172, v184, (uint64_t)v55, v185, v186, v187);
              }
              double v280 = v28 - v27;
              if (!a4)
              {
                if (objc_msgSend_strokeClassification(v279, v179, v180, v181, v182, v183) == 2)
                {
                  objc_msgSend_anchorPoint(v279, v188, v189, v190, v191, v192);
                  double v194 = v193 - v273;
                }
                else
                {
                  objc_msgSend_anchorPoint(v172, v188, v189, v190, v191, v192);
                  double v194 = v272 - v265;
                }
                double v280 = v194;
              }

              uint64_t v55 = v172;
            }
            else
            {
              objc_msgSend_insertionPoint(v55, v153, v154, v155, v156, v157);
              long long v285 = 0u;
              long long v286 = 0u;
              long long v284 = 0u;
              uint64_t v160 = objc_opt_class();
              objc_msgSend_anchorPoint(v85, v161, v162, v163, v164, v165);
              if (v160)
              {
                objc_msgSend_getTranslateTransformForAnchorPoint_targetPoint_(v160, v166, v167, v168, v169, v170);
              }
              else
              {
                long long v285 = 0u;
                long long v286 = 0u;
                long long v284 = 0u;
              }
              long long v281 = v284;
              long long v282 = v285;
              long long v283 = v286;
              objc_msgSend_addTransform_(v85, v166, (uint64_t)&v281, v168, v169, v170);
              objc_msgSend_mergeTransformedText_(v55, v195, (uint64_t)v85, v196, v197, v198);

              for (unint64_t k = 1; k < objc_msgSend_count(v75, v199, v200, v201, v202, v203); ++k)
              {
                uint64_t v85 = objc_msgSend_objectAtIndexedSubscript_(v75, v204, k, v205, v206, v207);
                uint64_t v213 = objc_msgSend_tokens(v85, v208, v209, v210, v211, v212);
                uint64_t v219 = objc_msgSend_lastObject(v213, v214, v215, v216, v217, v218);
                BOOL v225 = (objc_msgSend_properties(v219, v220, v221, v222, v223, v224) & 0x20) == 0;

                if (v225)
                {
                  double v231 = *(double *)(v73 + 40);
                }
                else
                {
                  uint64_t v232 = objc_opt_class();
                  objc_msgSend_lineHeight(v55, v233, v234, v235, v236, v237);
                  if (v232)
                  {
                    objc_msgSend_getInsertSpaceTransform_spaceSize_(v232, v226, (uint64_t)v55, v228, v229, v230);
                    double v231 = *((double *)&v286 + 1);
                  }
                  else
                  {
                    double v231 = 0.0;
                  }
                }
                objc_msgSend_boundingBox(v55, v226, v227, v228, v229, v230);
                double v239 = v238;
                double v241 = v240;
                objc_msgSend_boundingBox(v85, v242, v243, v244, v245, v246);
                if (v231 + v241 - v239 + v249 - v248 >= v280) {
                  goto LABEL_28;
                }
                objc_msgSend_insertionPoint(v55, v153, v247, v155, v156, v157);
                long long v285 = 0u;
                long long v286 = 0u;
                long long v284 = 0u;
                uint64_t v250 = objc_opt_class();
                objc_msgSend_anchorPoint(v85, v251, v252, v253, v254, v255);
                if (v250)
                {
                  objc_msgSend_getTranslateTransformForAnchorPoint_targetPoint_(v250, v256, v257, v258, v259, v260);
                }
                else
                {
                  long long v285 = 0u;
                  long long v286 = 0u;
                  long long v284 = 0u;
                }
                long long v281 = v284;
                long long v282 = v285;
                long long v283 = v286;
                objc_msgSend_addTransform_(v85, v256, (uint64_t)&v281, v258, v259, v260);
                objc_msgSend_mergeTransformedText_(v55, v261, (uint64_t)v85, v262, v263, v264);
              }
            }
          }
        }
        uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v68, (uint64_t)&v287, (uint64_t)v291, 16, v72);
      }
      while (v67);
    }

    objc_msgSend_addObject_(v275, v266, (uint64_t)v55, v267, v268, v269);
    uint64_t v21 = v271;
  }
  else
  {
    uint64_t v21 = v271;
    id v275 = v271;
  }

  return v275;
}

+ (void)applyAlignmentToTextLines:(id)a3 alignmentBehavior:(unint64_t)a4 leftMargin:(unint64_t)a5 rightMargin:(unint64_t)a6 alignFirstLine:(BOOL)a7
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v70 = a3;
  if (objc_msgSend_count(v70, v13, v14, v15, v16, v17))
  {
    switch(a4)
    {
      case 0uLL:
        break;
      case 1uLL:
        uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(v70, v18, 0, v19, v20, v21);
        objc_msgSend_anchorPoint(v22, v23, v24, v25, v26, v27);
        double v29 = v28;

        uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(v70, v30, 0, v31, v32, v33);
        BOOL v40 = objc_msgSend_strokeClassification(v34, v35, v36, v37, v38, v39) == 2;

        goto LABEL_8;
      case 2uLL:
        BOOL v40 = 0;
        double v29 = (double)a5;
        goto LABEL_8;
      case 3uLL:
        BOOL v40 = 0;
        double v29 = (double)((a6 + a5) >> 1);
        goto LABEL_8;
      case 4uLL:
        BOOL v40 = 0;
        double v29 = (double)a6;
        goto LABEL_8;
      default:
        BOOL v40 = 0;
        double v29 = 0.0;
LABEL_8:
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        id v41 = v70;
        unint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v80, (uint64_t)v84, 16, v43);
        if (v49)
        {
          BOOL v50 = !a7;
          uint64_t v51 = *(void *)v81;
          unint64_t v52 = a4 - 1;
          while (2)
          {
            if (*(void *)v81 != v51) {
              objc_enumerationMutation(v41);
            }
            uint64_t v53 = (void *)**((void **)&v80 + 1);
            if (**((void **)&v80 + 1))
            {
              objc_msgSend_principalLines(**((void ***)&v80 + 1), v44, v45, v46, v47, v48);
              uint64_t v54 = (double *)*((void *)&v75 + 1);
              long long v76 = 0uLL;
              *((void *)&v75 + 1) = 0;
              if (*((void *)&v78 + 1))
              {
                *(void *)&long long v79 = *((void *)&v78 + 1);
                operator delete(*((void **)&v78 + 1));
              }
              if (v77[0])
              {
                v77[1] = v77[0];
                operator delete(v77[0]);
              }
            }
            else
            {
              uint64_t v54 = 0;
              long long v78 = 0u;
              long long v79 = 0u;
              long long v76 = 0u;
              *(_OWORD *)uint64_t v77 = 0u;
              *(_OWORD *)uint64_t v74 = 0u;
              long long v75 = 0u;
            }
            if (*((void *)&v75 + 1))
            {
              *(void *)&long long v76 = *((void *)&v75 + 1);
              operator delete(*((void **)&v75 + 1));
            }
            if (v74[0])
            {
              v74[1] = v74[0];
              operator delete(v74[0]);
            }
            switch(v52)
            {
              case 0uLL:
                if (!v40) {
                  goto LABEL_26;
                }
                goto LABEL_23;
              case 1uLL:
LABEL_26:
                double v7 = *v54;
                double v8 = v54[1];
                goto LABEL_27;
              case 2uLL:
                double v7 = (*v54 + v54[2]) * 0.5;
                double v8 = (v54[1] + v54[3]) * 0.5;
                if (v50) {
                  goto LABEL_34;
                }
                goto LABEL_28;
              case 3uLL:
LABEL_23:
                double v7 = v54[2];
                double v8 = v54[3];
                if (v50) {
                  goto LABEL_34;
                }
                goto LABEL_28;
              default:
LABEL_27:
                if (!v50)
                {
LABEL_28:
                  long long v75 = 0u;
                  long long v76 = 0u;
                  *(_OWORD *)uint64_t v74 = 0u;
                  uint64_t v55 = objc_opt_class();
                  if (v55)
                  {
                    objc_msgSend_getTranslateTransformForAnchorPoint_targetPoint_(v55, v56, v57, v58, v59, v60, v7, v8, v29, v8);
                  }
                  else
                  {
                    long long v75 = 0u;
                    long long v76 = 0u;
                    *(_OWORD *)uint64_t v74 = 0u;
                  }
                  long long v71 = *(_OWORD *)v74;
                  long long v72 = v75;
                  long long v73 = v76;
                  objc_msgSend_addTransform_(v53, v56, (uint64_t)&v71, v58, v59, v60);
                }
LABEL_34:
                if (v54) {
                  operator delete(v54);
                }
                if (v49 >= 2)
                {
                  for (uint64_t i = 1; i != v49; ++i)
                  {
                    if (*(void *)v81 != v51) {
                      objc_enumerationMutation(v41);
                    }
                    uint64_t v62 = *(void **)(*((void *)&v80 + 1) + 8 * i);
                    if (v62)
                    {
                      objc_msgSend_principalLines(*(void **)(*((void *)&v80 + 1) + 8 * i), v44, v45, v46, v47, v48);
                      uint64_t v63 = (double *)*((void *)&v75 + 1);
                      long long v76 = 0uLL;
                      *((void *)&v75 + 1) = 0;
                      if (*((void *)&v78 + 1))
                      {
                        *(void *)&long long v79 = *((void *)&v78 + 1);
                        operator delete(*((void **)&v78 + 1));
                      }
                      if (v77[0])
                      {
                        v77[1] = v77[0];
                        operator delete(v77[0]);
                      }
                    }
                    else
                    {
                      uint64_t v63 = 0;
                      long long v78 = 0u;
                      long long v79 = 0u;
                      long long v76 = 0u;
                      *(_OWORD *)uint64_t v77 = 0u;
                      *(_OWORD *)uint64_t v74 = 0u;
                      long long v75 = 0u;
                    }
                    if (*((void *)&v75 + 1))
                    {
                      *(void *)&long long v76 = *((void *)&v75 + 1);
                      operator delete(*((void **)&v75 + 1));
                    }
                    if (v74[0])
                    {
                      v74[1] = v74[0];
                      operator delete(v74[0]);
                    }
                    switch(v52)
                    {
                      case 0uLL:
                        if (!v40) {
                          goto LABEL_56;
                        }
                        goto LABEL_54;
                      case 1uLL:
LABEL_56:
                        double v7 = *v63;
                        double v8 = v63[1];
                        break;
                      case 2uLL:
                        double v7 = (*v63 + v63[2]) * 0.5;
                        double v8 = (v63[1] + v63[3]) * 0.5;
                        break;
                      case 3uLL:
LABEL_54:
                        double v7 = v63[2];
                        double v8 = v63[3];
                        break;
                      default:
                        break;
                    }
                    long long v75 = 0u;
                    long long v76 = 0u;
                    *(_OWORD *)uint64_t v74 = 0u;
                    uint64_t v64 = objc_opt_class();
                    if (v64)
                    {
                      objc_msgSend_getTranslateTransformForAnchorPoint_targetPoint_(v64, v65, v66, v67, v68, v69, v7, v8, v29, v8);
                    }
                    else
                    {
                      long long v75 = 0u;
                      long long v76 = 0u;
                      *(_OWORD *)uint64_t v74 = 0u;
                    }
                    long long v71 = *(_OWORD *)v74;
                    long long v72 = v75;
                    long long v73 = v76;
                    objc_msgSend_addTransform_(v62, v65, (uint64_t)&v71, v67, v68, v69);
                    if (v63) {
                      operator delete(v63);
                    }
                  }
                }
                unint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v80, (uint64_t)v84, 16, v48);
                BOOL v50 = 0;
                if (!v49) {
                  break;
                }
                continue;
            }
            break;
          }
        }

        break;
    }
  }
}

+ (void)applyLineSpacingToTextLines:(id)a3 lineSpaceBehavior:(unint64_t)a4 lineSpaceTarget:(unint64_t)a5 linesAreParallel:(BOOL)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  unint64_t v15 = objc_msgSend_count(v9, v10, v11, v12, v13, v14);
  if (a4 && v15 >= 2)
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v16 = v9;
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v61, (uint64_t)v66, 16, v18);
    if (v24)
    {
      uint64_t v25 = *(void *)v62;
      double v26 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v62 != v25) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend_lineHeight(*(void **)(*((void *)&v61 + 1) + 8 * i), v19, v20, v21, v22, v23);
          double v26 = v26 + v28;
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v61, (uint64_t)v66, 16, v23);
      }
      while (v24);
    }
    else
    {
      double v26 = 0.0;
    }

    double v34 = v26 / (double)(unint64_t)objc_msgSend_count(v16, v29, v30, v31, v32, v33);
    if (a4 == 2)
    {
      a5 = (unint64_t)(v34 * 1.5);
      if (!a6) {
        goto LABEL_21;
      }
    }
    else
    {
      if (a4 != 3)
      {
        if (a4 != 4) {
          a5 = 0;
        }
        if (a6) {
          goto LABEL_35;
        }
LABEL_21:
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v35 = v16;
        uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v57, (uint64_t)v65, 16, v37);
        if (v43)
        {
          uint64_t v44 = *(void *)v58;
          double v45 = -1.79769313e308;
          double v46 = 1.79769313e308;
          do
          {
            for (uint64_t j = 0; j != v43; ++j)
            {
              if (*(void *)v58 != v44) {
                objc_enumerationMutation(v35);
              }
              objc_msgSend_orientation(*(void **)(*((void *)&v57 + 1) + 8 * j), v38, v39, v40, v41, v42, (void)v57);
              if (v48 < v46) {
                double v46 = v48;
              }
              if (v48 > v45) {
                double v45 = v48;
              }
            }
            uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v57, (uint64_t)v65, 16, v42);
          }
          while (v43);
        }
        else
        {
          double v45 = -1.79769313e308;
          double v46 = 1.79769313e308;
        }

        if (v45 - v46 >= 0.05)
        {
          uint64_t v53 = objc_opt_class();
          objc_msgSend_adjustLineSpacingWithBounds_lineSpace_(v53, v54, (uint64_t)v35, a5, v55, v56);
          goto LABEL_37;
        }
        goto LABEL_35;
      }
      a5 = (unint64_t)(v34 * 2.5);
      if (!a6) {
        goto LABEL_21;
      }
    }
LABEL_35:
    unint64_t v49 = objc_opt_class();
    objc_msgSend_adjustLineSpacingWithBaselines_lineSpace_(v49, v50, (uint64_t)v16, a5, v51, v52);
  }
LABEL_37:
}

+ (void)adjustLineSpacingWithBaselines:(id)a3 lineSpace:(unint64_t)a4
{
  id v5 = a3;
  double v6 = (double)a4;
  unint64_t v7 = 1;
  for (unint64_t i = objc_msgSend_count(v5, v8, v9, v10, v11, v12); v7 < i; unint64_t i = objc_msgSend_count(v5, v18, v19, v20, v21, v22))
  {
    unint64_t v23 = v7 - 1;
    uint64_t v24 = objc_msgSend_objectAtIndexedSubscript_(v5, v14, v7 - 1, v15, v16, v17);
    unint64_t v25 = v23 + 1;
    uint64_t v30 = objc_msgSend_objectAtIndexedSubscript_(v5, v26, v23 + 1, v27, v28, v29);
    uint64_t v36 = (void *)v30;
    if (v24)
    {
      objc_msgSend_principalLines(v24, v31, v32, v33, v34, v35);
      if (v36) {
        goto LABEL_6;
      }
    }
    else
    {
      *(_OWORD *)long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      *(_OWORD *)long long v62 = 0u;
      *(_OWORD *)long long v59 = 0u;
      *(_OWORD *)long long v60 = 0u;
      if (v30)
      {
LABEL_6:
        objc_msgSend_principalLines(v36, v31, v32, v33, v34, v35);
        goto LABEL_9;
      }
    }
    *(_OWORD *)__p = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    *(_OWORD *)uint64_t v56 = 0u;
    *(_OWORD *)uint64_t v53 = 0u;
    *(_OWORD *)uint64_t v54 = 0u;
LABEL_9:
    objc_msgSend_orientation(v24, v31, v32, v33, v34, v35);
    double v38 = tan(v37);
    double v40 = *(double *)v59[0];
    double v39 = *((double *)v59[0] + 1);
    double v41 = *(double *)__p[1];
    double v42 = *((double *)__p[1] + 1);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v50 = 0u;
    uint64_t v43 = objc_opt_class();
    if (v43)
    {
      objc_msgSend_getTranslateTransformForAnchorPoint_targetPoint_(v43, v44, v45, v46, v47, v48, v41, v42, v41, v39 + v40 * v38 - v41 * v38 + v6);
    }
    else
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v50 = 0u;
    }
    v49[0] = v50;
    v49[1] = v51;
    v49[2] = v52;
    objc_msgSend_addTransform_(v36, v44, (uint64_t)v49, v46, v47, v48);
    if (__p[1])
    {
      *(void **)&long long v58 = __p[1];
      operator delete(__p[1]);
    }
    if (v56[0])
    {
      v56[1] = v56[0];
      operator delete(v56[0]);
    }
    if (v54[1])
    {
      *(void **)&long long v55 = v54[1];
      operator delete(v54[1]);
    }
    if (v53[0])
    {
      v53[1] = v53[0];
      operator delete(v53[0]);
    }
    if (v63[1])
    {
      *(void **)&long long v64 = v63[1];
      operator delete(v63[1]);
    }
    if (v62[0])
    {
      v62[1] = v62[0];
      operator delete(v62[0]);
    }
    if (v60[1])
    {
      *(void **)&long long v61 = v60[1];
      operator delete(v60[1]);
    }
    if (v59[0])
    {
      v59[1] = v59[0];
      operator delete(v59[0]);
    }

    unint64_t v7 = v25 + 1;
  }
}

+ (void)adjustLineSpacingWithBounds:(id)a3 lineSpace:(unint64_t)a4
{
  id v10 = a3;
  double v11 = (double)a4;
  for (unint64_t i = 1; i < objc_msgSend_count(v10, v5, v6, v7, v8, v9); unint64_t i = v19 + 1)
  {
    unint64_t v17 = i - 1;
    uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(v10, v13, i - 1, v14, v15, v16);
    unint64_t v19 = v17 + 1;
    uint64_t v24 = objc_msgSend_objectAtIndexedSubscript_(v10, v20, v17 + 1, v21, v22, v23);
    objc_msgSend_boundingBox(v24, v25, v26, v27, v28, v29);
    double v31 = v30;
    objc_msgSend_boundingBox(v18, v32, v33, v34, v35, v36);
    double v38 = v37;
    objc_msgSend_boundingBox(v24, v39, v40, v41, v42, v43);
    double v45 = v44;
    objc_msgSend_boundingBox(v24, v46, v47, v48, v49, v50);
    double v52 = v51;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v60 = 0u;
    uint64_t v53 = objc_opt_class();
    if (v53)
    {
      objc_msgSend_getTranslateTransformForAnchorPoint_targetPoint_(v53, v54, v55, v56, v57, v58, v45, v52, v31, v38 + v11);
    }
    else
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v60 = 0u;
    }
    v59[0] = v60;
    v59[1] = v61;
    v59[2] = v62;
    objc_msgSend_addTransform_(v24, v54, (uint64_t)v59, v56, v57, v58);
  }
}

+ (id)splitTextLine:(id)a3 maxLength:(double)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9, v10);
  objc_msgSend_splitIntoTokens(v5, v12, v13, v14, v15, v16);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v51, (uint64_t)v55, 16, v19);
  if (v25)
  {
    id v26 = 0;
    uint64_t v27 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v52 != v27) {
          objc_enumerationMutation(v17);
        }
        uint64_t v29 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if (v26)
        {
          objc_msgSend_boundingBox(v26, v20, v21, v22, v23, v24, (void)v51);
          double v31 = v30;
          double v33 = v32;
          objc_msgSend_boundingBox(v29, v34, v35, v36, v37, v38);
          if (v31 <= v43) {
            double v43 = v31;
          }
          if (v33 >= v44) {
            double v44 = v33;
          }
          if (v44 - v43 >= a4)
          {
            objc_msgSend_addObject_(v11, v39, (uint64_t)v26, v40, v41, v42);
            id v45 = v29;

            id v26 = v45;
          }
          else
          {
            objc_msgSend_mergeTransformedText_(v26, v39, (uint64_t)v29, v40, v41, v42);
          }
        }
        else
        {
          id v26 = v29;
        }
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v51, (uint64_t)v55, 16, v24);
    }
    while (v25);

    if (v26) {
      objc_msgSend_addObject_(v11, v46, (uint64_t)v26, v47, v48, v49);
    }
  }
  else
  {

    id v26 = 0;
  }

  return v11;
}

+ (CGAffineTransform)rotationTransformForTextLine:(SEL)a3 targetAngle:(id)a4
{
  uint64_t v7 = (CoreHandwriting *)a4;
  uint64_t v8 = MEMORY[0x1E4F1DAB8];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v8 + 32);
  CoreHandwriting::getDesiredPrincipalLines(v7, a5, (uint64_t)v40);
  memset(&v39, 0, sizeof(v39));
  if (v7)
  {
    objc_msgSend_principalLines(v7, v10, v11, v12, v13, v14);
  }
  else
  {
    *(_OWORD *)__p = 0uLL;
    long long v38 = 0uLL;
    long long v35 = 0uLL;
    *(_OWORD *)uint64_t v36 = 0uLL;
    *(_OWORD *)double v33 = 0uLL;
    *(_OWORD *)uint64_t v34 = 0uLL;
  }
  CoreHandwriting::getAffineTransformation((double **)v33, v40, (uint64_t)&v39);
  if (__p[1])
  {
    *(void **)&long long v38 = __p[1];
    operator delete(__p[1]);
  }
  if (v36[0])
  {
    v36[1] = v36[0];
    operator delete(v36[0]);
  }
  if (v34[1])
  {
    *(void **)&long long v35 = v34[1];
    operator delete(v34[1]);
  }
  if (v33[0])
  {
    v33[1] = v33[0];
    operator delete(v33[0]);
  }
  long long v15 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v15;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransform t2 = v39;
  CGAffineTransformConcat(retstr, &t1, &t2);
  uint64_t v16 = objc_opt_class();
  objc_msgSend_anchorPoint(v7, v17, v18, v19, v20, v21);
  long long v26 = *(_OWORD *)&retstr->c;
  v30[0] = *(_OWORD *)&retstr->a;
  v30[1] = v26;
  v30[2] = *(_OWORD *)&retstr->tx;
  if (v16)
  {
    objc_msgSend_adjustTransformForAnchorPoint_transform_(v16, v22, (uint64_t)v30, v23, v24, v25);
    long long v27 = *(_OWORD *)v34;
    *(_OWORD *)&retstr->a = *(_OWORD *)v33;
    *(_OWORD *)&retstr->c = v27;
    *(_OWORD *)&retstr->tdouble x = v35;
    uint64_t v28 = v45;
    if (!v45) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  *(_OWORD *)uint64_t v34 = 0u;
  long long v35 = 0u;
  *(_OWORD *)double v33 = 0u;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = v35;
  uint64_t v28 = v45;
  if (v45)
  {
LABEL_14:
    uint64_t v46 = v28;
    operator delete(v28);
  }
LABEL_15:
  if (v43)
  {
    double v44 = v43;
    operator delete(v43);
  }
  if (v41)
  {
    uint64_t v42 = v41;
    operator delete(v41);
  }
  if (v40[0])
  {
    v40[1] = v40[0];
    operator delete(v40[0]);
  }

  return result;
}

+ (CGAffineTransform)getResizeTransformForTextLine:(SEL)a3 targetSize:(id)a4
{
  id v7 = a4;
  uint64_t v8 = MEMORY[0x1E4F1DAB8];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v8 + 32);
  objc_msgSend_lineHeight(v7, v10, v11, v12, v13, v14);
  long long v16 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v34.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v34.c = v16;
  *(_OWORD *)&v34.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformScale(retstr, &v34, a5 / (v15 + 1.0e-10), a5 / (v15 + 1.0e-10));
  id v17 = objc_opt_class();
  objc_msgSend_anchorPoint(v7, v18, v19, v20, v21, v22);
  long long v27 = *(_OWORD *)&retstr->c;
  v30[0] = *(_OWORD *)&retstr->a;
  v30[1] = v27;
  v30[2] = *(_OWORD *)&retstr->tx;
  if (v17)
  {
    objc_msgSend_adjustTransformForAnchorPoint_transform_(v17, v23, (uint64_t)v30, v24, v25, v26);
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v31 = 0u;
  }
  long long v28 = v32;
  *(_OWORD *)&retstr->a = v31;
  *(_OWORD *)&retstr->c = v28;
  *(_OWORD *)&retstr->tdouble x = v33;

  return result;
}

+ (CGAffineTransform)getItalicsTransformForTextLine:(SEL)a3 skew:(id)a4
{
  id v7 = a4;
  uint64_t v8 = MEMORY[0x1E4F1DAB8];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v8 + 32);
  retstr->c = a5;
  uint64_t v10 = objc_opt_class();
  objc_msgSend_anchorPoint(v7, v11, v12, v13, v14, v15);
  long long v20 = *(_OWORD *)&retstr->c;
  v23[0] = *(_OWORD *)&retstr->a;
  v23[1] = v20;
  v23[2] = *(_OWORD *)&retstr->tx;
  if (v10)
  {
    objc_msgSend_adjustTransformForAnchorPoint_transform_(v10, v16, (uint64_t)v23, v17, v18, v19);
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
  }
  long long v21 = v25;
  *(_OWORD *)&retstr->a = v24;
  *(_OWORD *)&retstr->c = v21;
  *(_OWORD *)&retstr->tdouble x = v26;

  return result;
}

+ (CGAffineTransform)getTranslateTransformForAnchorPoint:(SEL)a3 targetPoint:(CGPoint)a4
{
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v5;
  retstr->tdouble x = a5.x - a4.x;
  retstr->tdouble y = a5.y - a4.y;
  return result;
}

+ (CGAffineTransform)adjustTransformForAnchorPoint:(SEL)a3 transform:(CGPoint)a4
{
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v10.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v10.c = v5;
  float64x2_t v6 = *(float64x2_t *)&a5->c;
  CGFloat y = a4.y;
  float64x2_t v8 = vsubq_f64((float64x2_t)a4, vaddq_f64(*(float64x2_t *)&a5->tx, vmlaq_n_f64(vmulq_n_f64(v6, a4.y), *(float64x2_t *)&a5->a, a4.x)));
  *(_OWORD *)&t1.a = *(_OWORD *)&a5->a;
  *(float64x2_t *)&t1.c = v6;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a5->tx;
  *(float64x2_t *)&v10.tdouble x = v8;
  return CGAffineTransformConcat(retstr, &t1, &v10);
}

+ (CGAffineTransform)getInsertSpaceTransform:(SEL)a3 spaceSize:(id)a4
{
  id v24 = a4;
  objc_msgSend_orientation(v24, v7, v8, v9, v10, v11);
  double v13 = v12;
  uint64_t v19 = objc_msgSend_strokeClassification(v24, v14, v15, v16, v17, v18);
  double v20 = -v13;
  if (v19 != 2) {
    double v20 = v13;
  }
  __double2 v21 = __sincos_stret(v20);
  long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v22;
  retstr->tdouble x = v21.__cosval * a5;
  retstr->tCGFloat y = -(v21.__sinval * a5);

  return result;
}

+ (BOOL)shouldDeformAscendersDescenders:(id)a3
{
  float64x2_t v6 = objc_msgSend_languageCode(a3, a2, (uint64_t)a3, v3, v4, v5);
  char v11 = objc_msgSend_containsObject_(&unk_1F203DCB0, v7, (uint64_t)v6, v8, v9, v10);

  return v11;
}

+ (BOOL)shouldAdjustRenderString:(id)a3
{
  float64x2_t v6 = objc_msgSend_languageCode(a3, a2, (uint64_t)a3, v3, v4, v5);
  char v11 = objc_msgSend_containsObject_(&unk_1F203DCC8, v7, (uint64_t)v6, v8, v9, v10);

  return v11;
}

+ (double)blindAscenderDeformValue:(id)a3
{
  return 1.0;
}

+ (double)blindDescenderDeformValue:(id)a3
{
  return 1.5;
}

+ (id)charactersForRendering
{
  if (qword_1EA3C9310 == -1)
  {
    uint64_t v2 = (void *)qword_1EA3C9318;
  }
  else
  {
    dispatch_once(&qword_1EA3C9310, &unk_1F2012DF0);
    uint64_t v2 = (void *)qword_1EA3C9318;
  }
  return v2;
}

+ (id)stringForRendering:(id)a3 useAltChars:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  float64x2_t v6 = objc_opt_class();
  objc_msgSend_charactersForRendering(v6, v7, v8, v9, v10, v11);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v61, (uint64_t)v66, 16, v14);
  double v20 = v5;
  if (v19)
  {
    uint64_t v21 = *(void *)v62;
    double v20 = v5;
    do
    {
      uint64_t v22 = 0;
      uint64_t v23 = v20;
      do
      {
        if (*(void *)v62 != v21) {
          objc_enumerationMutation(v12);
        }
        uint64_t v24 = *(void *)(*((void *)&v61 + 1) + 8 * v22);
        long long v25 = objc_msgSend_objectForKeyedSubscript_(v12, v15, v24, v16, v17, v18);
        double v20 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v23, v26, v24, (uint64_t)v25, v27, v28);

        ++v22;
        uint64_t v23 = v20;
      }
      while (v19 != v22);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v61, (uint64_t)v66, 16, v18);
    }
    while (v19);
  }

  if (v4)
  {
    objc_msgSend_alternativeCharacterForms(NSString, v29, v30, v31, v32, v33);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v57, (uint64_t)v65, 16, v36);
    if (v41)
    {
      uint64_t v42 = *(void *)v58;
      do
      {
        uint64_t v43 = 0;
        double v44 = v20;
        do
        {
          if (*(void *)v58 != v42) {
            objc_enumerationMutation(v34);
          }
          uint64_t v45 = *(void *)(*((void *)&v57 + 1) + 8 * v43);
          uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v34, v37, v45, v38, v39, v40, (void)v57);
          double v20 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v44, v47, v45, (uint64_t)v46, v48, v49);

          ++v43;
          double v44 = v20;
        }
        while (v41 != v43);
        uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v57, (uint64_t)v65, 16, v40);
      }
      while (v41);
    }
  }
  uint64_t v50 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v29, v30, v31, v32, v33, (void)v57);
  uint64_t v55 = objc_msgSend_stringByTrimmingCharactersInSet_(v20, v51, (uint64_t)v50, v52, v53, v54);

  return v55;
}

+ (CGSize)estimatedRenderedTextSize:(id)a3 fullDeformValue:(double)a4 ascenderDeformValue:(double)a5 descenderDeformValue:(double)a6
{
  id v9 = a3;
  int hasDescender = objc_msgSend_hasDescender(v9, v10, v11, v12, v13, v14);
  int hasAscender = objc_msgSend_hasAscender(v9, v16, v17, v18, v19, v20);
  double RenderedTextSizeForString = CoreHandwriting::getRenderedTextSizeForString((CoreHandwriting *)v9, (NSString *)0x64);
  double v23 = a4 * 18.5 * a5 + a4 * 18.5;
  if (!hasAscender) {
    double v23 = -0.0;
  }
  double v24 = a4 * 52.5 + v23;
  double v25 = a4 * 17.0 * a6 + a4 * 17.0;
  if (!hasDescender) {
    double v25 = -0.0;
  }
  double v26 = v25 + v24;
  double v27 = RenderedTextSizeForString + -15.0;

  double v28 = v27;
  double v29 = v26;
  result.double height = v29;
  result.double width = v28;
  return result;
}

+ ($9936F71585EAE7D8081FB1B234834B3F)convertToCHPrincipalLines:(SEL)a3
{
  BOOL v4 = (CGPoint *)*((void *)a4 + 9);
  id v5 = (CGPoint *)*((void *)a4 + 3);
  float64x2_t v6 = (CGPoint *)*((void *)a4 + 6);
  CGPoint v7 = *(CGPoint *)(*(void *)a4 + 16);
  retstr->var0.var0 = *(CGPoint *)*(void *)a4;
  retstr->var0.var1 = v7;
  CGPoint v8 = v5[1];
  retstr->var1.var0 = *v5;
  retstr->var1.var1 = v8;
  CGPoint v9 = v6[1];
  retstr->var2.var0 = *v6;
  retstr->var2.var1 = v9;
  CGPoint v10 = v4[1];
  retstr->var3.var0 = *v4;
  retstr->var3.var1 = v10;
  return result;
}

+ (PrincipalLines)convertFromCHPrincipalLines:(SEL)a3
{
  *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
  *(_OWORD *)&retstr->top.__end_ = 0u;
  *(_OWORD *)&retstr->base.__end_ = 0u;
  *(_OWORD *)&retstr->median.__begin_ = 0u;
  *(_OWORD *)&retstr->descender.__begin_ = 0u;
  *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
  CGPoint var0 = a4->var0.var0;
  CGPoint var1 = a4->var0.var1;
  float64x2_t v6 = (CGPoint *)operator new(0x20uLL);
  CGPoint *v6 = var0;
  v6[1] = var1;
  retstr->descender.__begin_ = v6;
  retstr->descender.__end_ = v6 + 2;
  retstr->descender.__end_cap_.__value_ = v6 + 2;
  $D9ACD5A945031E604089763E4FBE0988 v11 = a4->var1;
  CGPoint v7 = (CGPoint *)operator new(0x20uLL);
  *($D9ACD5A945031E604089763E4FBE0988 *)&v7->double x = v11;
  retstr->base.__begin_ = v7;
  retstr->base.__end_ = v7 + 2;
  retstr->base.__end_cap_.__value_ = v7 + 2;
  $D9ACD5A945031E604089763E4FBE0988 var2 = a4->var2;
  CGPoint v8 = (CGPoint *)operator new(0x20uLL);
  *($D9ACD5A945031E604089763E4FBE0988 *)&v8->double x = var2;
  retstr->median.__begin_ = v8;
  retstr->median.__end_ = v8 + 2;
  retstr->median.__end_cap_.__value_ = v8 + 2;
  $D9ACD5A945031E604089763E4FBE0988 var3 = a4->var3;
  CGSize result = (PrincipalLines *)operator new(0x20uLL);
  *($D9ACD5A945031E604089763E4FBE0988 *)&result->descender.__begin_ = var3;
  retstr->top.__begin_ = (CGPoint *)result;
  retstr->top.__end_ = (CGPoint *)&result->base.__end_;
  retstr->top.__end_cap_.__value_ = (CGPoint *)&result->base.__end_;
  return result;
}

+ (id)changeTokensToVisualOrder:(id)a3
{
  float64x2_t v6 = objc_msgSend_sortedArrayUsingComparator_(a3, a2, (uint64_t)&unk_1F2010A80, v3, v4, v5);
  return v6;
}

- (id)revertTokenOrder:(id)a3 textResult:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
  uint64_t v19 = objc_msgSend_inputStrokeIdentifiers(v7, v14, v15, v16, v17, v18);
  double v24 = objc_msgSend_tokensAlignedWithInitialStrokesForTextResult_(self, v20, (uint64_t)v7, v21, v22, v23);
  uint64_t v59 = MEMORY[0x1E4F143A8];
  uint64_t v60 = 3221225472;
  long long v61 = sub_1C4AF0318;
  long long v62 = &unk_1E64E3A80;
  id v25 = v19;
  id v63 = v25;
  id v26 = v6;
  id v64 = v26;
  uint64_t v65 = self;
  id v27 = v13;
  id v66 = v27;
  objc_msgSend_enumerateObjectsUsingBlock_(v24, v28, (uint64_t)&v59, v29, v30, v31);
  uint64_t v37 = objc_msgSend_count(v27, v32, v33, v34, v35, v36, v59, v60, v61, v62);
  if (v37 != objc_msgSend_count(v26, v38, v39, v40, v41, v42))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v43 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
    {
      uint64_t v49 = objc_msgSend_count(v26, v44, v45, v46, v47, v48);
      uint64_t v55 = objc_msgSend_count(v27, v50, v51, v52, v53, v54);
      *(_DWORD *)buf = 134218240;
      uint64_t v68 = v49;
      __int16 v69 = 2048;
      uint64_t v70 = v55;
      _os_log_impl(&dword_1C492D000, v43, OS_LOG_TYPE_FAULT, "Reflowable token count (%lu) is different from the reordered token count (%lu)", buf, 0x16u);
    }
  }
  uint64_t v56 = v66;
  id v57 = v27;

  return v57;
}

+ (double)estimatedLeadingForPrincipalLines:(const void *)a3 transcription:(id)a4
{
  id v5 = a4;
  int hasDescender = objc_msgSend_hasDescender(v5, v6, v7, v8, v9, v10);
  int hasAscender = objc_msgSend_hasAscender(v5, v12, v13, v14, v15, v16);
  if ((hasDescender & hasAscender) != 1)
  {
    if (hasAscender)
    {
      uint64_t v19 = (double **)((char *)a3 + 24);
      uint64_t v20 = (double **)((char *)a3 + 72);
    }
    else
    {
      if (!hasDescender)
      {
        double v21 = sub_1C4B49EEC((double **)a3 + 3, (double **)a3 + 6);
        double v22 = 3.0;
        goto LABEL_9;
      }
      uint64_t v20 = (double **)((char *)a3 + 48);
      uint64_t v19 = (double **)a3;
    }
    double v21 = sub_1C4B49EEC(v19, v20);
    double v22 = 1.5;
LABEL_9:
    double v18 = v21 * v22;
    goto LABEL_10;
  }
  double v18 = sub_1C4B49EEC((double **)a3, (double **)a3 + 9);
LABEL_10:
  double v23 = v18 * 1.25;

  return v23;
}

+ (id)textLineForStrokes:(id)a3 tokens:(id)a4 locale:(id)a5 strokeClassification:(int64_t)a6 initialOrientationEstimate:(double)a7 shouldCancel:(id)a8
{
  uint64_t v256 = *MEMORY[0x1E4F143B8];
  id v212 = a3;
  id v12 = a4;
  id v211 = a5;
  uint64_t v213 = (uint64_t (**)(void))a8;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v13 = (id)qword_1EA3C9FC8;
  os_signpost_id_t spid = os_signpost_id_generate(v13);

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v14 = (id)qword_1EA3C9FC8;
  uint64_t v15 = v14;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v15, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CHPrincipalLines", "", buf, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v16 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHPrincipalLines\"", buf, 2u);
  }

  long long v248 = 0u;
  long long v249 = 0u;
  long long v246 = 0u;
  long long v247 = 0u;
  obuint64_t j = v12;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v246, (uint64_t)v255, 16, v18);
  if (v24)
  {
    uint64_t v25 = *(void *)v247;
    id v26 = &stru_1F20141C8;
    do
    {
      uint64_t v27 = 0;
      double v28 = v26;
      do
      {
        if (*(void *)v247 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void **)(*((void *)&v246 + 1) + 8 * v27);
        if ((objc_msgSend_properties(v29, v19, v20, v21, v22, v23) & 0x20) != 0)
        {
          uint64_t v35 = objc_msgSend_stringByAppendingString_(v28, v30, @" ", v32, v33, v34);

          double v28 = (void *)v35;
        }
        uint64_t v36 = objc_msgSend_string(v29, v30, v31, v32, v33, v34);
        uint64_t v220 = objc_msgSend_stringByAppendingString_(v28, v37, (uint64_t)v36, v38, v39, v40);

        ++v27;
        id v26 = (__CFString *)v220;
        double v28 = (void *)v220;
      }
      while (v24 != v27);
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v246, (uint64_t)v255, 16, v23);
    }
    while (v24);
  }
  else
  {
    id v26 = &stru_1F20141C8;
  }

  uint64_t v41 = v26;
  uint64_t v221 = v41;
  uint64_t v42 = objc_opt_class();
  uint64_t v52 = v41;
  if (objc_msgSend_shouldAdjustRenderString_(v42, v43, (uint64_t)v211, v44, v45, v46))
  {
    uint64_t v53 = objc_opt_class();
    uint64_t v57 = objc_msgSend_stringForRendering_useAltChars_(v53, v54, (uint64_t)v41, 0, v55, v56);

    uint64_t v52 = (void *)v57;
  }
  if (v213 && (v213[2]() & 1) != 0)
  {
    id v58 = 0;
    goto LABEL_164;
  }
  uint64_t v243 = 0;
  uint64_t v244 = 0;
  unint64_t v245 = 0;
  double v240 = 0;
  double v241 = 0;
  unint64_t v242 = 0;
  unint64_t v59 = objc_msgSend_count(v212, v47, v48, v49, v50, v51);
  sub_1C4AF17A8((uint64_t)&v240, v59);
  uint64_t v209 = (uint64_t)v52;
  __p = 0;
  double v238 = 0;
  double v239 = 0;
  long long v233 = 0u;
  long long v234 = 0u;
  long long v235 = 0u;
  long long v236 = 0u;
  id v218 = v212;
  uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v218, v60, (uint64_t)&v233, (uint64_t)v254, 16, v61);
  if (v65)
  {
    uint64_t v66 = *(void *)v234;
    do
    {
      uint64_t v67 = 0;
      uint64_t v216 = v65;
      do
      {
        if (*(void *)v234 != v66) {
          objc_enumerationMutation(v218);
        }
        uint64_t v253 = *(void *)(*((void *)&v233 + 1) + 8 * v67);
        uint64_t v68 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v62, (uint64_t)&v253, 1, v63, v64);
        CoreHandwriting::getPointSet(v68, buf);

        __int16 v69 = *(long long **)buf;
        if ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >= 1)
        {
          uint64_t v70 = (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 4;
          uint64_t v71 = v238;
          int64_t v72 = v238 - (unsigned char *)__p;
          long long v73 = (char *)__p + ((v238 - (unsigned char *)__p) & 0xFFFFFFFFFFFFFFF0);
          if (v70 > (v239 - v238) >> 4)
          {
            uint64_t v74 = v72 >> 4;
            unint64_t v75 = (v72 >> 4) + v70;
            if (v75 >> 60) {
              sub_1C494A220();
            }
            uint64_t v76 = v66;
            uint64_t v77 = v239 - (unsigned char *)__p;
            if ((v239 - (unsigned char *)__p) >> 3 > v75) {
              unint64_t v75 = v77 >> 3;
            }
            if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v78 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v78 = v75;
            }
            if (v78)
            {
              if (v78 >> 60) {
                sub_1C4949AA8();
              }
              long long v79 = (char *)operator new(16 * v78);
            }
            else
            {
              long long v79 = 0;
            }
            uint64_t v90 = &v79[16 * v74];
            uint64_t v91 = 16 * v70;
            uint64_t v92 = &v90[16 * v70];
            uint64_t v93 = v90;
            do
            {
              long long v94 = *v69++;
              *(_OWORD *)uint64_t v93 = v94;
              v93 += 16;
              v91 -= 16;
            }
            while (v91);
            uint64_t v95 = (char *)__p;
            if (__p != v73)
            {
              uint64_t v96 = v73;
              do
              {
                *((_OWORD *)v90 - 1) = *((_OWORD *)v96 - 1);
                v90 -= 16;
                v96 -= 16;
              }
              while (v96 != v95);
              uint64_t v71 = v238;
            }
            if (v71 != v73) {
              memmove(v92, v73, v71 - v73);
            }
            BOOL v97 = __p;
            __p = v90;
            double v238 = &v92[v71 - v73];
            double v239 = &v79[16 * v78];
            uint64_t v66 = v76;
            uint64_t v65 = v216;
            if (v97) {
              operator delete(v97);
            }
            goto LABEL_68;
          }
          uint64_t v80 = v238 - v73;
          uint64_t v81 = (v238 - v73) >> 4;
          if (v81 >= v70)
          {
            uint64_t v82 = *(void *)buf + 16 * v70;
            uint64_t v84 = v238;
            uint64_t v85 = 16 * v70;
            uint64_t v86 = &v238[-16 * v70];
            uint64_t v87 = v238;
            if (v86 >= v238) {
              goto LABEL_51;
            }
            goto LABEL_50;
          }
          uint64_t v82 = *(void *)buf + 16 * v81;
          uint64_t v83 = *(void *)&buf[8] - v82;
          if (*(void *)&buf[8] != v82) {
            memmove(v238, (const void *)(*(void *)buf + 16 * v81), *(void *)&buf[8] - v82);
          }
          uint64_t v84 = &v71[v83];
          double v238 = &v71[v83];
          if (v80 >= 1)
          {
            uint64_t v85 = 16 * v70;
            uint64_t v86 = &v84[-16 * v70];
            uint64_t v87 = &v71[v83];
            if (v86 >= v71)
            {
LABEL_51:
              uint64_t v89 = &v73[v85];
              double v238 = v87;
              if (v84 != v89) {
                memmove(&v84[-16 * ((v84 - v89) >> 4)], v73, v84 - v89);
              }
              if ((long long *)v82 != v69) {
                memmove(v73, v69, v82 - (void)v69);
              }
              goto LABEL_68;
            }
            do
            {
LABEL_50:
              long long v88 = *(_OWORD *)v86;
              v86 += 16;
              *(_OWORD *)uint64_t v87 = v88;
              v87 += 16;
            }
            while (v86 < v71);
            goto LABEL_51;
          }
        }
LABEL_68:
        if (*(void *)buf)
        {
          *(void *)&uint8_t buf[8] = *(void *)buf;
          operator delete(*(void **)buf);
        }
        ++v67;
      }
      while (v67 != v65);
      uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v218, v62, (uint64_t)&v233, (uint64_t)v254, 16, v64);
    }
    while (v65);
  }

  v232[3] = 0;
  objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v98, (uint64_t)v218, v99, v100, v101);
  double v104 = -a7;
  if (a7 == 1.79769313e308) {
    double v104 = 1.79769313e308;
  }
  sub_1C4B4A294((uint64_t *)&__p, v221, v232, v102, v103, v104);
  long long v230 = 0u;
  long long v231 = 0u;
  long long v228 = 0u;
  long long v229 = 0u;
  id v214 = v218;
  uint64_t v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v214, v105, (uint64_t)&v228, (uint64_t)v252, 16, v106);
  if (v110)
  {
    unint64_t v111 = 0;
    uint64_t v217 = *(void *)v229;
    do
    {
      uint64_t v112 = 0;
      id v219 = (id)v110;
      do
      {
        if (*(void *)v229 != v217) {
          objc_enumerationMutation(v214);
        }
        uint64_t v251 = *(void *)(*((void *)&v228 + 1) + 8 * (void)v112);
        uint64_t v113 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v107, (uint64_t)&v251, 1, v108, v109);
        CoreHandwriting::getPointSet(v113, buf);

        BOOL v225 = 0;
        uint64_t v226 = 0;
        unint64_t v227 = 0;
        uint64_t v114 = *(_OWORD **)buf;
        uint64_t v115 = *(_OWORD **)&buf[8];
        while (v114 != v115)
        {
          *(_OWORD *)uint64_t v224 = *v114;
          if ((*(void *)((char *)v232[0] + ((v111 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v111))
          {
            uint64_t v117 = v226;
            if ((unint64_t)v226 < v227)
            {
              *(_OWORD *)uint64_t v226 = *v114;
              uint64_t v118 = v117 + 16;
              goto LABEL_103;
            }
            uint64_t v119 = (char *)v225;
            uint64_t v120 = (v226 - (unsigned char *)v225) >> 4;
            unint64_t v121 = v120 + 1;
            if ((unint64_t)(v120 + 1) >> 60) {
              goto LABEL_192;
            }
            uint64_t v122 = v227 - (void)v225;
            if ((uint64_t)(v227 - (void)v225) >> 3 > v121) {
              unint64_t v121 = v122 >> 3;
            }
            if ((unint64_t)v122 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v123 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v123 = v121;
            }
            if (v123)
            {
              if (v123 >> 60) {
                goto LABEL_191;
              }
              uint64_t v124 = (char *)operator new(16 * v123);
              uint64_t v125 = &v124[16 * v120];
              *(_OWORD *)uint64_t v125 = *(_OWORD *)v224;
              uint64_t v126 = v125;
              if (v117 == v119)
              {
LABEL_101:
                uint64_t v128 = &v124[16 * v123];
                uint64_t v118 = v125 + 16;
                BOOL v225 = v126;
                uint64_t v226 = v125 + 16;
                unint64_t v227 = (unint64_t)v128;
                if (v117) {
                  goto LABEL_102;
                }
                goto LABEL_103;
              }
            }
            else
            {
              uint64_t v124 = 0;
              uint64_t v125 = (char *)(16 * v120);
              *(_OWORD *)(16 * v120) = *(_OWORD *)v224;
              uint64_t v126 = (char *)(16 * v120);
              if (v117 == v119) {
                goto LABEL_101;
              }
            }
            do
            {
              *((_OWORD *)v126 - 1) = *((_OWORD *)v117 - 1);
              v126 -= 16;
              v117 -= 16;
            }
            while (v117 != v119);
            uint64_t v117 = (char *)v225;
            uint64_t v127 = &v124[16 * v123];
            uint64_t v118 = v125 + 16;
            BOOL v225 = v126;
            uint64_t v226 = v125 + 16;
            unint64_t v227 = (unint64_t)v127;
            if (v117) {
LABEL_102:
            }
              operator delete(v117);
LABEL_103:
            uint64_t v226 = v118;
            uint64_t v129 = v244;
            if ((unint64_t)v244 < v245)
            {
              *(_OWORD *)uint64_t v244 = *(_OWORD *)v224;
              double v116 = v129 + 16;
              goto LABEL_81;
            }
            uint64_t v130 = (char *)v243;
            uint64_t v131 = (v244 - (unsigned char *)v243) >> 4;
            unint64_t v132 = v131 + 1;
            if ((unint64_t)(v131 + 1) >> 60) {
LABEL_192:
            }
              sub_1C494A220();
            uint64_t v133 = v245 - (void)v243;
            if ((uint64_t)(v245 - (void)v243) >> 3 > v132) {
              unint64_t v132 = v133 >> 3;
            }
            if ((unint64_t)v133 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v134 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v134 = v132;
            }
            if (v134)
            {
              if (v134 >> 60) {
LABEL_191:
              }
                sub_1C4949AA8();
              uint64_t v135 = (char *)operator new(16 * v134);
              uint64_t v136 = &v135[16 * v131];
              *(_OWORD *)uint64_t v136 = *(_OWORD *)v224;
              uint64_t v137 = v136;
              if (v129 == v130)
              {
LABEL_118:
                uint64_t v139 = &v135[16 * v134];
                double v116 = v136 + 16;
                uint64_t v243 = v137;
                uint64_t v244 = v136 + 16;
                unint64_t v245 = (unint64_t)v139;
                if (v129) {
                  goto LABEL_119;
                }
                goto LABEL_81;
              }
            }
            else
            {
              uint64_t v135 = 0;
              uint64_t v136 = (char *)(16 * v131);
              *(_OWORD *)(16 * v131) = *(_OWORD *)v224;
              uint64_t v137 = (char *)(16 * v131);
              if (v129 == v130) {
                goto LABEL_118;
              }
            }
            do
            {
              *((_OWORD *)v137 - 1) = *((_OWORD *)v129 - 1);
              v137 -= 16;
              v129 -= 16;
            }
            while (v129 != v130);
            uint64_t v129 = (char *)v243;
            uint64_t v138 = &v135[16 * v134];
            double v116 = v136 + 16;
            uint64_t v243 = v137;
            uint64_t v244 = v136 + 16;
            unint64_t v245 = (unint64_t)v138;
            if (v129) {
LABEL_119:
            }
              operator delete(v129);
LABEL_81:
            uint64_t v244 = v116;
          }
          ++v111;
          ++v114;
        }
        uint64_t v140 = v241;
        if ((unint64_t)v241 >= v242)
        {
          double v145 = sub_1C4AAAB38((char **)&v240, (uint64_t)&v225);
          id v146 = v219;
        }
        else
        {
          *(void *)double v241 = 0;
          *((void *)v140 + 1) = 0;
          *((void *)v140 + 2) = 0;
          uint64_t v141 = v225;
          int64_t v142 = v226 - (unsigned char *)v225;
          if (v226 != v225)
          {
            if (v142 < 0) {
              sub_1C494A220();
            }
            double v143 = (char *)operator new(v226 - (unsigned char *)v225);
            *(void *)uint64_t v140 = v143;
            *((void *)v140 + 1) = v143;
            double v144 = &v143[16 * (v142 >> 4)];
            *((void *)v140 + 2) = v144;
            memcpy(v143, v141, v142);
            *((void *)v140 + 1) = v144;
          }
          double v145 = v140 + 24;
          id v146 = v219;
        }
        double v241 = v145;
        if (v225)
        {
          uint64_t v226 = (char *)v225;
          operator delete(v225);
        }
        if (*(void *)buf)
        {
          *(void *)&uint8_t buf[8] = *(void *)buf;
          operator delete(*(void **)buf);
        }
        uint64_t v112 = (char *)v112 + 1;
      }
      while (v112 != v146);
      uint64_t v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v214, v107, (uint64_t)&v228, (uint64_t)v252, 16, v109);
    }
    while (v110);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  double v147 = (id)qword_1EA3C9FE0;
  if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void **)&uint8_t buf[4] = v232[1];
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = (v244 - (unsigned char *)v243) >> 4;
    _os_log_impl(&dword_1C492D000, v147, OS_LOG_TYPE_DEFAULT, "Clipping: initial point count = %ld, final count = %ld", buf, 0x16u);
  }

  *(_OWORD *)buf = xmmword_1C4C3B2A0;
  *(_OWORD *)&buf[16] = xmmword_1C4C3B2A0;
  uint64_t v148 = (double *)v243;
  if (v243 == v244)
  {
LABEL_148:
    id v58 = 0;
    goto LABEL_149;
  }
  double v149 = 1.79769313e308;
  double v150 = -1.79769313e308;
  double v151 = -1.79769313e308;
  double v152 = 1.79769313e308;
  do
  {
    double v153 = *v148;
    if (v152 <= *v148)
    {
      if (v151 >= v153)
      {
LABEL_140:
        double v154 = v148[1];
        if (v149 <= v154) {
          goto LABEL_145;
        }
        goto LABEL_141;
      }
    }
    else
    {
      *(double *)buf = *v148;
      double v152 = v153;
      if (v151 >= v153) {
        goto LABEL_140;
      }
    }
    *(double *)&uint8_t buf[8] = v153;
    double v151 = v153;
    double v154 = v148[1];
    if (v149 <= v154)
    {
LABEL_145:
      if (v150 >= v154) {
        goto LABEL_137;
      }
      goto LABEL_146;
    }
LABEL_141:
    *(double *)&buf[16] = v154;
    double v149 = v154;
    if (v150 >= v154) {
      goto LABEL_137;
    }
LABEL_146:
    *(double *)&buf[24] = v154;
    double v150 = v154;
LABEL_137:
    v148 += 2;
  }
  while (v148 != (double *)v244);
  if (v150 - v149 == 0.0) {
    goto LABEL_148;
  }
  sub_1C4B5226C((double **)&v243, (double *)buf, (double **)&v225);
  sub_1C4B4AD64((char **)&v225, (double **)v224, 4.0);
  double v223 = 0.0;
  uint64_t v162 = objc_opt_class();
  uint64_t v164 = objc_msgSend_textLineCandidate_tokens_locale_strokeClassification_string_points_strokePoints_alphaShape_initialOrientationEstimate_useAltString_outFitScore_shouldCancel_(v162, v163, (uint64_t)v214, (uint64_t)obj, (uint64_t)v211, a6, v209, &v243, a7, &v240, v224, 0, &v223, v213);
  if ((unint64_t)objc_msgSend_count(obj, v165, v166, v167, v168, v169) <= 4)
  {
    uint64_t v170 = objc_opt_class();
    if (objc_msgSend_shouldAdjustRenderString_(v170, v171, (uint64_t)v211, v172, v173, v174))
    {
      uint64_t v175 = objc_opt_class();
      uint64_t v179 = objc_msgSend_stringForRendering_useAltChars_(v175, v176, (uint64_t)v221, 1, v177, v178);
      if ((objc_msgSend_isEqualToString_(v179, v180, v209, v181, v182, v183) & 1) == 0)
      {
        *(double *)uint64_t v222 = 0.0;
        uint64_t v184 = objc_opt_class();
        LOBYTE(v207) = 1;
        uint64_t v186 = objc_msgSend_textLineCandidate_tokens_locale_strokeClassification_string_points_strokePoints_alphaShape_initialOrientationEstimate_useAltString_outFitScore_shouldCancel_(v184, v185, (uint64_t)v214, (uint64_t)obj, (uint64_t)v211, a6, v179, &v243, a7, &v240, v224, v207, v222, v213);
        double v187 = *(double *)v222;
        double v188 = v223;
        objc_msgSend_orientation(v186, v189, v190, v191, v192, v193);
        double v195 = v194;
        objc_msgSend_orientation(v164, v196, v197, v198, v199, v200);
        if (!v164) {
          goto LABEL_175;
        }
        BOOL v202 = vabdd_f64(v223, *(double *)v222) > 4.0;
        if (fabs(v195) < fabs(v201)) {
          BOOL v202 = 1;
        }
        if (v187 < v188 && v202)
        {
LABEL_175:
          id v203 = v186;

          double v223 = *(double *)v222;
          uint64_t v164 = v203;
        }
      }
    }
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v204 = (id)qword_1EA3C9FC8;
  uint64_t v205 = v204;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v204))
  {
    *(_WORD *)uint64_t v222 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v205, OS_SIGNPOST_INTERVAL_END, spid, "CHPrincipalLines", "", v222, 2u);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v206 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v222 = 0;
    _os_log_impl(&dword_1C492D000, v206, OS_LOG_TYPE_DEFAULT, "END \"CHPrincipalLines\"", v222, 2u);
  }

  id v58 = v164;
  if (v224[0])
  {
    v224[1] = v224[0];
    operator delete(v224[0]);
  }
  if (v225)
  {
    uint64_t v226 = (char *)v225;
    operator delete(v225);
  }
LABEL_149:
  if (v232[0]) {
    operator delete(v232[0]);
  }
  if (__p)
  {
    double v238 = (char *)__p;
    operator delete(__p);
  }
  uint64_t v155 = (char *)v240;
  if (v240)
  {
    uint64_t v156 = v241;
    uint64_t v157 = v240;
    if (v241 != v240)
    {
      double v158 = v241;
      do
      {
        uint64_t v160 = (void *)*((void *)v158 - 3);
        v158 -= 24;
        double v159 = v160;
        if (v160)
        {
          *((void *)v156 - 2) = v159;
          operator delete(v159);
        }
        uint64_t v156 = v158;
      }
      while (v158 != v155);
      uint64_t v157 = v240;
    }
    double v241 = v155;
    operator delete(v157);
  }
  if (v243)
  {
    uint64_t v244 = (char *)v243;
    operator delete(v243);
  }

  uint64_t v52 = (void *)v209;
LABEL_164:

  return v58;
}

+ (PrincipalLines)principalLinesFromToken:(SEL)a3 strokes:(id)a4
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v14 = objc_msgSend_strokeIndexes(v7, v9, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_objectsAtIndexes_(v8, v15, (uint64_t)v14, v16, v17, v18);

  objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v20, (uint64_t)v19, v21, v22, v23);
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  if (v7)
  {
    objc_msgSend_principalLines(v7, v24, v25, v26, v27, v28);
    double v58 = *((double *)&v62 + 1);
    double v59 = *(double *)&v62;
    double v56 = *((double *)&v63 + 1);
    double v57 = *(double *)&v63;
    double v54 = *((double *)&v64 + 1);
    double v55 = *(double *)&v64;
    double v52 = *((double *)&v65 + 1);
    double v53 = *(double *)&v65;
    double v50 = *((double *)&v66 + 1);
    double v51 = *(double *)&v66;
    double v37 = *((double *)&v67 + 1);
    double v49 = *(double *)&v67;
    double v39 = *((double *)&v68 + 1);
    double v38 = *(double *)&v68;
    double v40 = *((double *)&v69 + 1);
    double v60 = *(double *)&v69;
  }
  else
  {
    double v40 = 0.0;
    long long v68 = 0u;
    long long v69 = 0u;
    double v39 = 0.0;
    double v38 = 0.0;
    double v37 = 0.0;
    long long v66 = 0u;
    long long v67 = 0u;
    double v49 = 0.0;
    double v50 = 0.0;
    double v51 = 0.0;
    double v52 = 0.0;
    long long v64 = 0u;
    long long v65 = 0u;
    double v53 = 0.0;
    double v54 = 0.0;
    long long v62 = 0u;
    long long v63 = 0u;
    double v55 = 0.0;
    double v56 = 0.0;
    double v57 = 0.0;
    double v58 = 0.0;
    double v59 = 0.0;
    double v60 = 0.0;
  }
  uint64_t v41 = objc_opt_class();
  double v46 = 1.0;
  if (v36 == 0.0) {
    double v47 = 1.0;
  }
  else {
    double v47 = v36;
  }
  if (v34 != 0.0) {
    double v46 = v34;
  }
  v61[0] = v30 + v59 * v46;
  v61[1] = v32 + v58 * v47;
  v61[2] = v30 + v57 * v46;
  v61[3] = v32 + v56 * v47;
  v61[4] = v30 + v55 * v46;
  v61[5] = v32 + v54 * v47;
  v61[6] = v30 + v53 * v46;
  v61[7] = v32 + v52 * v47;
  v61[8] = v30 + v51 * v46;
  v61[9] = v32 + v50 * v47;
  v61[10] = v30 + v49 * v46;
  v61[11] = v32 + v37 * v47;
  v61[12] = v30 + v38 * v46;
  v61[13] = v32 + v39 * v47;
  v61[14] = v30 + v60 * v46;
  v61[15] = v32 + v40 * v47;
  if (v41)
  {
    objc_msgSend_convertFromCHPrincipalLines_(v41, v42, (uint64_t)v61, v43, v44, v45);
  }
  else
  {
    *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->top.__end_ = 0u;
    *(_OWORD *)&retstr->base.__end_ = 0u;
    *(_OWORD *)&retstr->median.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
  }

  return result;
}

+ (id)textLineFromCachedResults:(id)a3 tokens:(id)a4 strokes:(id)a5 estimatedOrientation:(double)a6 locale:(id)a7 strokeClassification:(int64_t)a8
{
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  id v146 = a3;
  id v12 = a4;
  id v147 = a5;
  id v141 = a7;
  int64_t v142 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v13, v14, v15, v16, v17);
  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  obuint64_t j = v12;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v167, (uint64_t)v173, 16, v19);
  if (v20)
  {
    uint64_t v145 = *(void *)v168;
    do
    {
      uint64_t v26 = 0;
      uint64_t v144 = v20;
      do
      {
        if (*(void *)v168 != v145) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void **)(*((void *)&v167 + 1) + 8 * v26);
        uint64_t v28 = objc_msgSend_strokeIndexes(v27, v21, v22, v23, v24, v25);
        double v33 = objc_msgSend_objectsAtIndexes_(v147, v29, (uint64_t)v28, v30, v31, v32);

        double v34 = (void *)MEMORY[0x1E4F1CA48];
        uint64_t v40 = objc_msgSend_count(v33, v35, v36, v37, v38, v39);
        uint64_t v45 = objc_msgSend_arrayWithCapacity_(v34, v41, v40, v42, v43, v44);
        long long v165 = 0u;
        long long v166 = 0u;
        long long v163 = 0u;
        long long v164 = 0u;
        id v46 = v33;
        uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v163, (uint64_t)v172, 16, v48);
        if (v54)
        {
          uint64_t v55 = *(void *)v164;
          do
          {
            for (uint64_t i = 0; i != v54; ++i)
            {
              if (*(void *)v164 != v55) {
                objc_enumerationMutation(v46);
              }
              double v57 = objc_msgSend_strokeIdentifier(*(void **)(*((void *)&v163 + 1) + 8 * i), v49, v50, v51, v52, v53);
              objc_msgSend_addObject_(v45, v58, (uint64_t)v57, v59, v60, v61);
            }
            uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v163, (uint64_t)v172, 16, v53);
          }
          while (v54);
        }

        long long v66 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v62, (uint64_t)v45, v63, v64, v65);
        uint64_t v71 = objc_msgSend_cachedTranscriptionForStrokeGroup_(v146, v67, (uint64_t)v66, v68, v69, v70);

        if (!v71) {
          goto LABEL_26;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_26;
        }
        id v72 = v71;
        unint64_t v78 = objc_msgSend_topModelTranscriptionPath(v72, v73, v74, v75, v76, v77);
        uint64_t v82 = objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v72, v79, (uint64_t)v78, 0, v80, v81);
        long long v88 = objc_msgSend_firstObject(v82, v83, v84, v85, v86, v87);

        if (!v88)
        {
LABEL_26:
          int v98 = 1;
          goto LABEL_27;
        }
        uint64_t v89 = objc_opt_class();
        objc_msgSend_principalLinesFromToken_strokes_(v89, v90, (uint64_t)v88, (uint64_t)v147, v91, v92);
        if (vabdd_f64(-atan2(*((double *)v157 + 3) - *((double *)v157 + 1), *((double *)v157 + 2) - *(double *)v157), a6) <= 0.04)
        {
          uint64_t v100 = objc_msgSend_mutableCopy(v27, v93, v94, v95, v96, v97);
          uint64_t v101 = (void *)MEMORY[0x1E4F28D60];
          uint64_t v107 = objc_msgSend_count(v46, v102, v103, v104, v105, v106);
          unint64_t v111 = objc_msgSend_indexSetWithIndexesInRange_(v101, v108, 0, v107, v109, v110);
          objc_msgSend_setStrokeIndexes_(v100, v112, (uint64_t)v111, v113, v114, v115);

          double v116 = [CHTransformedTextSegment alloc];
          uint64_t v171 = v100;
          uint64_t v120 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v117, (uint64_t)&v171, 1, v118, v119);
          sub_1C4AAA458(v149, (uint64_t)v156);
          long long v121 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          v148[0] = *MEMORY[0x1E4F1DAB8];
          v148[1] = v121;
          v148[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
          unint64_t v123 = objc_msgSend_initWithStrokes_tokens_locale_strokeClassification_principalLines_transform_(v116, v122, (uint64_t)v46, (uint64_t)v120, (uint64_t)v141, a8, v149, v148);
          if (v154)
          {
            uint64_t v155 = v154;
            operator delete(v154);
          }
          if (v152)
          {
            double v153 = v152;
            operator delete(v152);
          }
          if (v150)
          {
            double v151 = v150;
            operator delete(v150);
          }
          if (v149[0])
          {
            v149[1] = v149[0];
            operator delete(v149[0]);
          }

          objc_msgSend_addObject_(v142, v124, (uint64_t)v123, v125, v126, v127);
          int v98 = 0;
          uint64_t v99 = __p;
          if (!__p) {
            goto LABEL_19;
          }
LABEL_18:
          uint64_t v162 = v99;
          operator delete(v99);
          goto LABEL_19;
        }
        int v98 = 1;
        uint64_t v99 = __p;
        if (__p) {
          goto LABEL_18;
        }
LABEL_19:
        if (v159)
        {
          uint64_t v160 = v159;
          operator delete(v159);
        }
        if (v157)
        {
          double v158 = v157;
          operator delete(v157);
        }
        if (v156[0])
        {
          v156[1] = v156[0];
          operator delete(v156[0]);
        }

LABEL_27:
        if (v98)
        {

          goto LABEL_44;
        }
        ++v26;
      }
      while (v26 != v144);
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v167, (uint64_t)v173, 16, v25);
    }
    while (v20);
  }

  if (objc_msgSend_count(v142, v128, v129, v130, v131, v132))
  {
    uint64_t v133 = [CHTransformedTextLine alloc];
    uint64_t v138 = objc_msgSend_initWithSegments_(v133, v134, (uint64_t)v142, v135, v136, v137);
  }
  else
  {
LABEL_44:
    uint64_t v138 = 0;
  }

  return v138;
}

+ (id)textLineForTokensWithPrincipalLines:(id)a3 strokes:(id)a4 locale:(id)a5 strokeClassification:(int64_t)a6
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v85 = a5;
  uint64_t v86 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v11, v12, v13, v14, v15, v9);
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  obuint64_t j = v9;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v101, (uint64_t)v106, 16, v17);
  if (v23)
  {
    uint64_t v24 = *(void *)v102;
    uint64_t v25 = (_OWORD *)MEMORY[0x1E4F1DAB8];
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v102 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void **)(*((void *)&v101 + 1) + 8 * i);
        uint64_t v28 = objc_msgSend_strokeIndexes(v27, v18, v19, v20, v21, v22);
        double v33 = objc_msgSend_objectsAtIndexes_(v10, v29, (uint64_t)v28, v30, v31, v32);

        double v34 = objc_opt_class();
        if (v34)
        {
          objc_msgSend_principalLinesFromToken_strokes_(v34, v35, (uint64_t)v27, (uint64_t)v10, v38, v39);
        }
        else
        {
          *(_OWORD *)uint64_t v99 = 0u;
          long long v100 = 0u;
          long long v97 = 0u;
          *(_OWORD *)int v98 = 0u;
          *(_OWORD *)uint64_t v95 = 0u;
          *(_OWORD *)uint64_t v96 = 0u;
        }
        uint64_t v40 = objc_msgSend_mutableCopy(v27, v35, v36, v37, v38, v39);
        uint64_t v41 = (void *)MEMORY[0x1E4F28D60];
        uint64_t v47 = objc_msgSend_count(v33, v42, v43, v44, v45, v46);
        uint64_t v51 = objc_msgSend_indexSetWithIndexesInRange_(v41, v48, 0, v47, v49, v50);
        objc_msgSend_setStrokeIndexes_(v40, v52, (uint64_t)v51, v53, v54, v55);

        double v56 = [CHTransformedTextSegment alloc];
        uint64_t v105 = v40;
        uint64_t v60 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v57, (uint64_t)&v105, 1, v58, v59);
        sub_1C4AAA458(v88, (uint64_t)v95);
        long long v61 = v25[1];
        v87[0] = *v25;
        v87[1] = v61;
        v87[2] = v25[2];
        uint64_t v63 = objc_msgSend_initWithStrokes_tokens_locale_strokeClassification_principalLines_transform_(v56, v62, (uint64_t)v33, (uint64_t)v60, (uint64_t)v85, a6, v88, v87);
        if (__p)
        {
          uint64_t v94 = __p;
          operator delete(__p);
        }
        if (v91)
        {
          uint64_t v92 = v91;
          operator delete(v91);
        }
        if (v89)
        {
          uint64_t v90 = v89;
          operator delete(v89);
        }
        if (v88[0])
        {
          v88[1] = v88[0];
          operator delete(v88[0]);
        }

        objc_msgSend_addObject_(v86, v64, (uint64_t)v63, v65, v66, v67);
        if (v99[1])
        {
          *(void **)&long long v100 = v99[1];
          operator delete(v99[1]);
        }
        if (v98[0])
        {
          v98[1] = v98[0];
          operator delete(v98[0]);
        }
        if (v96[1])
        {
          *(void **)&long long v97 = v96[1];
          operator delete(v96[1]);
        }
        if (v95[0])
        {
          v95[1] = v95[0];
          operator delete(v95[0]);
        }
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v101, (uint64_t)v106, 16, v22);
    }
    while (v23);
  }

  if (objc_msgSend_count(v86, v68, v69, v70, v71, v72))
  {
    long long v73 = [CHTransformedTextLine alloc];
    unint64_t v78 = objc_msgSend_initWithSegments_(v73, v74, (uint64_t)v86, v75, v76, v77);
    objc_msgSend_setFromCachedTokens_(v78, v79, 1, v80, v81, v82);
  }
  else
  {
    unint64_t v78 = 0;
  }

  return v78;
}

+ (id)textLineForDrawing:(id)a3 transcriptions:(id)a4 strokeIndexes:(id)a5 fullText:(id)a6 locale:(id)a7 strokeClassification:(int64_t)a8 shouldCancel:(id)a9
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  id v151 = a3;
  id v13 = a4;
  id v155 = a5;
  id v154 = a6;
  id v153 = a7;
  id v149 = a9;
  uint64_t v156 = v13;
  uint64_t v19 = objc_msgSend_count(v13, v14, v15, v16, v17, v18);
  if (v19 == objc_msgSend_count(v155, v20, v21, v22, v23, v24))
  {
    uint64_t v30 = objc_msgSend_count(v13, v25, v26, v27, v28, v29);
    if (v30 != objc_msgSend_count(v155, v31, v32, v33, v34, v35))
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v36 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v158 = objc_msgSend_count(v13, v37, v38, v39, v40, v41);
        __int16 v159 = 2048;
        uint64_t v160 = objc_msgSend_count(v155, v42, v43, v44, v45, v46);
        _os_log_impl(&dword_1C492D000, v36, OS_LOG_TYPE_FAULT, "The number of transcriptions (%lu) does not equal the number of index sets (%lu)", buf, 0x16u);
      }
    }
    uint64_t v47 = objc_opt_class();
    objc_msgSend_strokesFromDrawing_classification_(v47, v48, (uint64_t)v151, a8, v49, v50);
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(log, v51, v52, v53, v54, v55))
    {
      double v152 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v56, v57, v58, v59, v60);
      unint64_t v66 = 0;
      uint64_t v67 = 0;
      uint64_t v68 = (double *)MEMORY[0x1E4F1DB28];
      while (1)
      {
        if (v66 >= objc_msgSend_count(v156, v61, v62, v63, v64, v65))
        {
          if (objc_msgSend_count(v152, v69, v70, v71, v72, v73))
          {
            uint64_t v136 = objc_opt_class();
            uint64_t v138 = objc_msgSend_textLineForStrokes_tokens_locale_strokeClassification_initialOrientationEstimate_shouldCancel_(v136, v137, (uint64_t)log, (uint64_t)v152, (uint64_t)v153, a8, v149, 1.79769313e308);
          }
          else
          {
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            id v146 = (id)qword_1EA3C9FE0;
            if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C492D000, v146, OS_LOG_TYPE_ERROR, "There are no valid tokens from the drawing to create a transformed text line.", buf, 2u);
            }

            uint64_t v138 = 0;
          }
          uint64_t v139 = v138;

          uint64_t v135 = v139;
          goto LABEL_47;
        }
        uint64_t v74 = objc_msgSend_objectAtIndexedSubscript_(v156, v69, v66, v71, v72, v73);
        long long v79 = objc_msgSend_objectAtIndexedSubscript_(v155, v75, v66, v76, v77, v78);
        uint64_t v85 = objc_msgSend_length(v154, v80, v81, v82, v83, v84);
        uint64_t v87 = objc_msgSend_rangeOfString_options_range_(v154, v86, (uint64_t)v74, 0, v67, v85 - v67);
        uint64_t v89 = v88;
        if (objc_msgSend_hasPrefix_(v74, v88, @" ", v90, v91, v92))
        {
          objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v93, v94, v95, v96, v97);
          int v98 = (NSString *)objc_claimAutoreleasedReturnValue();
          uint64_t v103 = objc_msgSend_stringByTrimmingCharactersInSet_(v74, v99, (uint64_t)v98, v100, v101, v102);

          uint64_t v74 = (void *)v103;
          uint64_t v104 = 33;
        }
        else
        {
          if (!v87 || v87 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v104 = 1;
            goto LABEL_20;
          }
          objc_msgSend_composedCharacterAtIndex_(v154, v93, v87 - 1, v95, v96, v97);
          int v98 = (NSString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v105, v106, v107, v108, v109);
          uint64_t v110 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
          BOOL v111 = isStringEntirelyFromSet(v98, v110);

          if (v111) {
            uint64_t v104 = 33;
          }
          else {
            uint64_t v104 = 1;
          }
        }

LABEL_20:
        if (objc_msgSend_count(v79, v93, v94, v95, v96, v97))
        {
          uint64_t v112 = [CHTokenizedTextResultToken alloc];
          uint64_t v118 = objc_msgSend_count(v79, v113, v114, v115, v116, v117);
          uint64_t v120 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v112, v119, (uint64_t)v74, (uint64_t)v79, 0, v104, v153, 1, 1.0, 1.0, 1.0, 1.0, *v68, v68[1], v68[2], v68[3], v118);
          objc_msgSend_addObject_(v152, v121, (uint64_t)v120, v122, v123, v124);
        }
        else
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v120 = (id)qword_1EA3C9FE0;
          if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C492D000, v120, OS_LOG_TYPE_ERROR, "Empty stroke indexes for segment of drawing.", buf, 2u);
          }
        }

        if (v87 != 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v67 = (uint64_t)&v89[v87];
        }

        ++v66;
      }
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v139 = (id)qword_1EA3C9FE0;
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
    {
      uint64_t v145 = objc_msgSend_strokeCount(v151, v140, v141, v142, v143, v144);
      *(_DWORD *)buf = 134217984;
      uint64_t v158 = v145;
      _os_log_impl(&dword_1C492D000, v139, OS_LOG_TYPE_ERROR, "Unable to create reflowable text line from drawing, drawing has %ld strokes, no extracted strokes.", buf, 0xCu);
    }
    uint64_t v135 = 0;
LABEL_47:
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    os_log_t log = (os_log_t)(id)qword_1EA3C9FE0;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v158 = objc_msgSend_count(v13, v125, v126, v127, v128, v129);
      __int16 v159 = 2048;
      uint64_t v160 = objc_msgSend_count(v155, v130, v131, v132, v133, v134);
      _os_log_impl(&dword_1C492D000, log, OS_LOG_TYPE_ERROR, "Unable to build textLineForDrawing because the number of transcriptions (%lu) does not equal the number of index sets (%lu)", buf, 0x16u);
    }
    uint64_t v135 = 0;
  }

  return v135;
}

+ (id)drawingForTransformedTextLines:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  uint64_t v3 = objc_alloc_init(CHDrawing);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = v53;
  uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v64, (uint64_t)v69, 16, v5, v53);
  if (v56)
  {
    uint64_t v55 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v65 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        objc_msgSend_segments(v11, v6, v7, v8, v9, v10);
        id v58 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v12, (uint64_t)&v60, (uint64_t)v68, 16, v13);
        if (v19)
        {
          uint64_t v20 = *(void *)v61;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v61 != v20) {
                objc_enumerationMutation(v58);
              }
              uint64_t v22 = *(void **)(*((void *)&v60 + 1) + 8 * j);
              uint64_t v23 = objc_msgSend_textStrokes(v22, v14, v15, v16, v17, v18);
              uint64_t v29 = objc_msgSend_supportStrokes(v22, v24, v25, v26, v27, v28);
              uint64_t v34 = objc_msgSend_arrayByAddingObjectsFromArray_(v23, v30, (uint64_t)v29, v31, v32, v33);
              uint64_t v35 = CoreHandwriting::getUnprocessedDrawing(v34);

              uint64_t v41 = objc_opt_class();
              if (v22) {
                objc_msgSend_transform(v22, v36, v37, v38, v39, v40);
              }
              else {
                memset(v59, 0, sizeof(v59));
              }
              uint64_t v42 = objc_msgSend_textStrokePointTransformationFromAffineTransformation_(v41, v36, (uint64_t)v59, v38, v39, v40);
              uint64_t v47 = objc_msgSend_newDrawingWithTransform_(v35, v43, (uint64_t)v42, v44, v45, v46);

              objc_msgSend_appendDrawing_(v3, v48, (uint64_t)v47, v49, v50, v51);
            }
            uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v14, (uint64_t)&v60, (uint64_t)v68, 16, v18);
          }
          while (v19);
        }
      }
      uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v64, (uint64_t)v69, 16, v10);
    }
    while (v56);
  }

  return v3;
}

+ (id)reflowableTokensFromSynthesisResult:(id)a3 shouldCancel:(id)a4
{
  uint64_t v177 = *MEMORY[0x1E4F143B8];
  id v149 = a3;
  id v150 = a4;
  id v151 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v5, @"en_US", v6, v7, v8);
  uint64_t v9 = objc_opt_class();
  uint64_t v15 = objc_msgSend_drawing(v149, v10, v11, v12, v13, v14);
  uint64_t v21 = objc_msgSend_segmentContents(v149, v16, v17, v18, v19, v20);
  uint64_t v27 = objc_msgSend_segmentStrokeIndexes(v149, v22, v23, v24, v25, v26);
  uint64_t v33 = objc_msgSend_content(v149, v28, v29, v30, v31, v32);
  uint64_t v35 = objc_msgSend_textLineForDrawing_transcriptions_strokeIndexes_fullText_locale_strokeClassification_shouldCancel_(v9, v34, (uint64_t)v15, (uint64_t)v21, (uint64_t)v27, (uint64_t)v33, v151, 1, v150);

  uint64_t v148 = v35;
  if (!v35) {
    goto LABEL_38;
  }
  objc_msgSend_principalLines(v35, v36, v37, v38, v39, v40);
  uint64_t v46 = v159;
  if (__p[1])
  {
    *(void **)&long long v162 = __p[1];
    operator delete(__p[1]);
  }
  if (v160[0])
  {
    v160[1] = v160[0];
    operator delete(v160[0]);
  }
  if (v158[1])
  {
    *(void **)&long long v159 = v158[1];
    operator delete(v158[1]);
  }
  uint64_t v47 = v46 - (unint64_t)v158[1];
  if (v157[0])
  {
    v157[1] = v157[0];
    operator delete(v157[0]);
  }
  if (v47 == 32)
  {
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v41, v42, v43, v44, v45);
    id v154 = (id)objc_claimAutoreleasedReturnValue();
    long long v174 = 0u;
    long long v175 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    objc_msgSend_splitIntoTokens(v35, v48, v49, v50, v51, v52);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v172, (uint64_t)v176, 16, v54);
    if (v60)
    {
      uint64_t v61 = *(void *)v173;
      do
      {
        for (uint64_t i = 0; i != v60; ++i)
        {
          if (*(void *)v173 != v61) {
            objc_enumerationMutation(obj);
          }
          long long v63 = *(void **)(*((void *)&v172 + 1) + 8 * i);
          long long v64 = objc_msgSend_textStrokes(v63, v55, v56, v57, v58, v59);
          objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v65, (uint64_t)v64, v66, v67, v68);
          double v70 = v69;
          double v72 = v71;
          double v74 = v73;
          double v76 = v75;

          objc_msgSend_fixPrincipalLinesPosition_useAltString_skipAmbiguousCharacters_(a1, v77, (uint64_t)v63, 0, 1, v78);
          uint64_t v84 = objc_msgSend_string(v63, v79, v80, v81, v82, v83);
          uint64_t v90 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v85, v86, v87, v88, v89);
          uint64_t v95 = objc_msgSend_stringByTrimmingCharactersInSet_(v84, v91, (uint64_t)v90, v92, v93, v94);

          long long v163 = 0u;
          long long v164 = 0u;
          *(_OWORD *)__p = 0u;
          long long v162 = 0u;
          long long v159 = 0u;
          *(_OWORD *)uint64_t v160 = 0u;
          *(_OWORD *)uint64_t v157 = 0u;
          *(_OWORD *)uint64_t v158 = 0u;
          uint64_t v96 = objc_opt_class();
          if (v96)
          {
            objc_msgSend_convertToCHPrincipalLines_(v96, v97, (uint64_t)v165, v98, v99, v100);
          }
          else
          {
            long long v163 = 0u;
            long long v164 = 0u;
            *(_OWORD *)__p = 0u;
            long long v162 = 0u;
            long long v159 = 0u;
            *(_OWORD *)uint64_t v160 = 0u;
            *(_OWORD *)uint64_t v157 = 0u;
            *(_OWORD *)uint64_t v158 = 0u;
          }
          uint64_t v101 = objc_opt_class();
          v156[4] = *(_OWORD *)__p;
          v156[5] = v162;
          v156[6] = v163;
          v156[7] = v164;
          v156[0] = *(_OWORD *)v157;
          v156[1] = *(_OWORD *)v158;
          v156[2] = v159;
          v156[3] = *(_OWORD *)v160;
          uint64_t v105 = objc_msgSend_textSizeFromPrincipalLines_string_(v101, v102, (uint64_t)v156, (uint64_t)v95, v103, v104);
          if (v74 == 0.0) {
            double v106 = 1.0;
          }
          else {
            double v106 = v74;
          }
          if (v76 == 0.0) {
            double v107 = 1.0;
          }
          else {
            double v107 = v76;
          }
          *(double *)uint64_t v157 = (*(double *)v157 - v70) / v106;
          *(double *)&v157[1] = (*(double *)&v157[1] - v72) / v107;
          *(double *)uint64_t v158 = (*(double *)v158 - v70) / v106;
          *(double *)&v158[1] = (*(double *)&v158[1] - v72) / v107;
          *(double *)&long long v159 = (*(double *)&v159 - v70) / v106;
          *((double *)&v159 + 1) = (*((double *)&v159 + 1) - v72) / v107;
          *(double *)uint64_t v160 = (*(double *)v160 - v70) / v106;
          *(double *)&v160[1] = (*(double *)&v160[1] - v72) / v107;
          *(double *)__p = (*(double *)__p - v70) / v106;
          *(double *)&__p[1] = (*(double *)&__p[1] - v72) / v107;
          *(double *)&long long v162 = (*(double *)&v162 - v70) / v106;
          *((double *)&v162 + 1) = (*((double *)&v162 + 1) - v72) / v107;
          *(double *)&long long v163 = (*(double *)&v163 - v70) / v106;
          *((double *)&v163 + 1) = (*((double *)&v163 + 1) - v72) / v107;
          *(double *)&long long v164 = (*(double *)&v164 - v70) / v106;
          *((double *)&v164 + 1) = (*((double *)&v164 + 1) - v72) / v107;
          uint64_t v108 = objc_opt_class();
          double v113 = 1.0 / v76;
          if (v76 == 0.0) {
            double v113 = 1.0;
          }
          uint64_t v114 = objc_msgSend_scaledSize_scale_(v108, v109, (uint64_t)v105, v110, v111, v112, v113);

          uint64_t v120 = objc_msgSend_textStrokes(v63, v115, v116, v117, v118, v119);
          long long v121 = CoreHandwriting::getUnprocessedDrawing(v120);

          uint64_t v127 = objc_msgSend_tokens(v63, v122, v123, v124, v125, v126);
          uint64_t v133 = objc_msgSend_firstObject(v127, v128, v129, v130, v131, v132);
          unint64_t v139 = objc_msgSend_properties(v133, v134, v135, v136, v137, v138);

          uint64_t v140 = [CHReflowableSynthesisResultToken alloc];
          v155[4] = *(_OWORD *)__p;
          v155[5] = v162;
          v155[6] = v163;
          v155[7] = v164;
          v155[0] = *(_OWORD *)v157;
          v155[1] = *(_OWORD *)v158;
          v155[2] = v159;
          v155[3] = *(_OWORD *)v160;
          hasPrecedingSpace = objc_msgSend_initWithDrawing_string_principalLines_textSize_bounds_hasPrecedingSpace_(v140, v141, (uint64_t)v121, (uint64_t)v95, (uint64_t)v155, (uint64_t)v114, (v139 >> 5) & 1, v70, v72, v74, v76);
          objc_msgSend_addObject_(v154, v143, (uint64_t)hasPrecedingSpace, v144, v145, v146);

          if (v170)
          {
            uint64_t v171 = v170;
            operator delete(v170);
          }
          if (v168)
          {
            long long v169 = v168;
            operator delete(v168);
          }
          if (v166)
          {
            long long v167 = v166;
            operator delete(v166);
          }
          if (v165[0])
          {
            v165[1] = v165[0];
            operator delete(v165[0]);
          }
        }
        uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v55, (uint64_t)&v172, (uint64_t)v176, 16, v59);
      }
      while (v60);
    }
  }
  else
  {
LABEL_38:
    id v154 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v154;
}

+ (id)textLineCandidate:(id)a3 tokens:(id)a4 locale:(id)a5 strokeClassification:(int64_t)a6 string:(id)a7 points:(const void *)a8 strokePoints:(const void *)a9 alphaShape:(const void *)a10 initialOrientationEstimate:(double)a11 useAltString:(BOOL)a12 outFitScore:(double *)a13 shouldCancel:(id)a14
{
  uint64_t v317 = *MEMORY[0x1E4F143B8];
  id v217 = a3;
  id v18 = a4;
  id v219 = a5;
  uint64_t v19 = (CoreHandwriting *)a7;
  uint64_t v20 = v18;
  id v218 = v19;
  uint64_t v220 = (uint64_t (**)(void))a14;
  uint64_t v21 = MEMORY[0x1C8786C20]();
  unint64_t v31 = objc_msgSend_count(v20, v22, v23, v24, v25, v26);
  context = (void *)v21;
  if (a11 == 1.79769313e308)
  {
    id v36 = &unk_1F203DCE0;
  }
  else
  {
    uint64_t v32 = objc_opt_class();
    objc_msgSend_checkAvailableInterceptsForString_skipAmbiguousCharacters_(v32, v33, (uint64_t)v218, v31 > 4, v34, v35);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v300 = 0;
  *(_OWORD *)v299 = 0u;
  long long v298 = 0u;
  *(_OWORD *)uint64_t v297 = 0u;
  *(_OWORD *)uint64_t v296 = 0u;
  long long v295 = 0u;
  *(_OWORD *)double v294 = 0u;
  *(_OWORD *)__p = 0u;
  uint64_t v215 = v36;
  if (*((void *)a10 + 1) != *(void *)a10)
  {
    if (a11 == 1.79769313e308) {
      goto LABEL_6;
    }
    uint64_t v60 = objc_msgSend_objectAtIndexedSubscript_(v36, v27, 1, v28, v29, v30);
    if (objc_msgSend_unsignedIntegerValue(v60, v61, v62, v63, v64, v65))
    {
      double v70 = objc_msgSend_objectAtIndexedSubscript_(v36, v66, 2, v67, v68, v69);
      uint64_t v76 = objc_msgSend_unsignedIntegerValue(v70, v71, v72, v73, v74, v75);

      if (v76) {
        goto LABEL_39;
      }
    }
    else
    {
    }
LABEL_6:
    CoreHandwriting::getPointsAndPrincipalLinesForText(v218, (NSString *)0x64, (uint64_t)v285);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    *(_OWORD *)__p = *(_OWORD *)v285;
    v294[0] = __src[0];
    __src[0] = 0;
    v285[1] = 0;
    v285[0] = 0;
    sub_1C49B7D84(&v294[1], (char *)__src[1], *(char **)v287, (uint64_t)(*(void *)v287 - (unint64_t)__src[1]) >> 4);
    sub_1C49B7D84(v296, (char *)v288[0], (char *)v288[1], ((char *)v288[1] - (char *)v288[0]) >> 4);
    sub_1C49B7D84(&v297[1], *((char **)&v289 + 1), *(char **)v290, (uint64_t)(*(void *)v290 - *((void *)&v289 + 1)) >> 4);
    sub_1C49B7D84(v299, (char *)v291, *(char **)v292, (uint64_t)(*(void *)v292 - (void)v291) >> 4);
    if (v291)
    {
      *(void *)uint64_t v292 = v291;
      operator delete(v291);
    }
    if (*((void *)&v289 + 1))
    {
      *(void *)long long v290 = *((void *)&v289 + 1);
      operator delete(*((void **)&v289 + 1));
    }
    if (v288[0])
    {
      v288[1] = v288[0];
      operator delete(v288[0]);
    }
    if (__src[1])
    {
      *(void **)long long v287 = __src[1];
      operator delete(__src[1]);
    }
    if (v285[0])
    {
      v285[1] = v285[0];
      operator delete(v285[0]);
    }
    v285[1] = 0;
    v285[0] = 0;
    __src[0] = 0;
    uint64_t v37 = __p[0];
    int64_t v38 = (char *)__p[1] - (char *)__p[0];
    if (__p[1] != __p[0])
    {
      if (v38 < 0) {
        sub_1C494A220();
      }
      v285[0] = operator new((char *)__p[1] - (char *)__p[0]);
      v285[1] = v285[0];
      uint64_t v39 = (char *)v285[0] + 16 * (v38 >> 4);
      __src[0] = v39;
      memcpy(v285[0], v37, v38);
      v285[1] = v39;
    }
    sub_1C4AAA458(&__src[1], (uint64_t)&v294[1]);
    uint64_t v40 = objc_opt_class();
    if (objc_msgSend_shouldDeformAscendersDescenders_(v40, v41, (uint64_t)v219, v42, v43, v44))
    {
      uint64_t v45 = objc_opt_class();
      objc_msgSend_blindAscenderDeformValue_(v45, v46, (uint64_t)v219, v47, v48, v49);
      double v51 = v50;
      uint64_t v52 = objc_opt_class();
      objc_msgSend_blindDescenderDeformValue_(v52, v53, (uint64_t)v219, v54, v55, v56);
      CoreHandwriting::deformImagePointsAndLines((CoreHandwriting *)v285, 1.0, v51, v57, (uint64_t)buf);
      if (v285[0])
      {
        v285[1] = v285[0];
        operator delete(v285[0]);
      }
      *(_OWORD *)long long v285 = *(_OWORD *)buf;
      __src[0] = *(void **)&buf[16];
      memset(buf, 0, 24);
      sub_1C49B7D84(&__src[1], *(char **)&buf[24], (char *)v311, (uint64_t)(v311 - *(void *)&buf[24]) >> 4);
      sub_1C49B7D84(v288, (char *)v312, *((char **)&v312 + 1), (uint64_t)(*((void *)&v312 + 1) - v312) >> 4);
      sub_1C49B7D84((void *)&v289 + 1, *((char **)&v313 + 1), (char *)v314, (uint64_t)(v314 - *((void *)&v313 + 1)) >> 4);
      sub_1C49B7D84(&v291, v315, v316, (v316 - v315) >> 4);
      if (v315)
      {
        v316 = v315;
        operator delete(v315);
      }
      if (*((void *)&v313 + 1))
      {
        *(void *)&long long v314 = *((void *)&v313 + 1);
        operator delete(*((void **)&v313 + 1));
      }
      if ((void)v312)
      {
        *((void *)&v312 + 1) = v312;
        operator delete((void *)v312);
      }
      if (*(void *)&buf[24])
      {
        *(void *)&long long v311 = *(void *)&buf[24];
        operator delete(*(void **)&buf[24]);
      }
      if (*(void *)buf)
      {
        *(void *)&uint8_t buf[8] = *(void *)buf;
        operator delete(*(void **)buf);
      }
    }
    uint64_t v58 = objc_opt_class();
    if (v58)
    {
      objc_msgSend_principalLinesForPoints_writtenAlphaShape_imgPointsAndPrincipalLines_shouldCancel_(v58, v59, (uint64_t)a8, (uint64_t)a10, (uint64_t)v285, (uint64_t)v220);
      if ((void)v311 - *(void *)&buf[24] == 32 && (!v220 || (v220[2]() & 1) == 0))
      {
        uint64_t v101 = objc_opt_class();
        sub_1C4AAA458(v278, (uint64_t)buf);
        if (v101)
        {
          objc_msgSend_flipPrincipalLine_points_string_outWasFlipped_(v101, v102, (uint64_t)v278, (uint64_t)a8, (uint64_t)v218, 0);
          uint64_t v103 = *(char **)v305;
          uint64_t v104 = *(char **)&v305[8];
        }
        else
        {
          uint64_t v104 = 0;
          uint64_t v103 = 0;
          *(_OWORD *)uint64_t v309 = 0u;
          *(_OWORD *)uint64_t v308 = 0u;
          *(_OWORD *)uint64_t v307 = 0u;
          *(_OWORD *)v306 = 0u;
          memset(v305, 0, sizeof(v305));
        }
        sub_1C49B7D84(buf, v103, v104, (v104 - v103) >> 4);
        sub_1C49B7D84(&buf[24], *(char **)&v305[24], *(char **)v306, (uint64_t)(*(void *)v306 - *(void *)&v305[24]) >> 4);
        sub_1C49B7D84(&v312, (char *)v307[0], (char *)v307[1], ((char *)v307[1] - (char *)v307[0]) >> 4);
        sub_1C49B7D84((void *)&v313 + 1, (char *)v308[1], *(char **)v309, (uint64_t)(*(void *)v309 - (unint64_t)v308[1]) >> 4);
        if (v308[1])
        {
          *(void **)uint64_t v309 = v308[1];
          operator delete(v308[1]);
        }
        if (v307[0])
        {
          v307[1] = v307[0];
          operator delete(v307[0]);
        }
        if (*(void *)&v305[24])
        {
          *(void *)v306 = *(void *)&v305[24];
          operator delete(*(void **)&v305[24]);
        }
        if (*(void *)v305)
        {
          *(void *)&v305[8] = *(void *)v305;
          operator delete(*(void **)v305);
        }
        if (v283)
        {
          long long v284 = v283;
          operator delete(v283);
        }
        if (v281)
        {
          long long v282 = v281;
          operator delete(v281);
        }
        if (v279)
        {
          double v280 = v279;
          operator delete(v279);
        }
        if (v278[0])
        {
          v278[1] = v278[0];
          operator delete(v278[0]);
        }
        uint64_t v178 = [CHTransformedTextLine alloc];
        sub_1C4AAA458(v271, (uint64_t)buf);
        uint64_t v179 = (_OWORD *)MEMORY[0x1E4F1DAB8];
        long long v180 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        v270[0] = *MEMORY[0x1E4F1DAB8];
        v270[1] = v180;
        v270[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        uint64_t v182 = objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v178, v181, (uint64_t)v217, (uint64_t)v20, (uint64_t)a8, (uint64_t)a9, v219, a6, v271, v270);
        if (v276)
        {
          uint64_t v277 = v276;
          operator delete(v276);
        }
        if (v274)
        {
          id v275 = v274;
          operator delete(v274);
        }
        if (v272)
        {
          double v273 = v272;
          operator delete(v272);
        }
        if (v271[0])
        {
          v271[1] = v271[0];
          operator delete(v271[0]);
        }
        uint64_t v183 = objc_opt_class();
        if (v183)
        {
          objc_msgSend_fixPrincipalLinesOrientation_useAltString_skipAmbiguousCharacters_(v183, v184, (uint64_t)v182, a12, v31 > 4, v185);
        }
        else
        {
          *(_OWORD *)uint64_t v309 = 0u;
          *(_OWORD *)uint64_t v308 = 0u;
          *(_OWORD *)uint64_t v307 = 0u;
          *(_OWORD *)v306 = 0u;
          memset(v305, 0, sizeof(v305));
        }
        uint64_t v186 = [CHTransformedTextLine alloc];
        sub_1C4AAA458(v263, (uint64_t)v305);
        long long v187 = v179[1];
        v262[0] = *v179;
        v262[1] = v187;
        v262[2] = v179[2];
        uint64_t v80 = objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v186, v188, (uint64_t)v217, (uint64_t)v20, (uint64_t)a8, (uint64_t)a9, v219, a6, v263, v262);

        if (v268)
        {
          uint64_t v269 = v268;
          operator delete(v268);
        }
        if (v266)
        {
          uint64_t v267 = v266;
          operator delete(v266);
        }
        if (v264)
        {
          double v265 = v264;
          operator delete(v264);
        }
        if (v263[0])
        {
          v263[1] = v263[0];
          operator delete(v263[0]);
        }
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v189 = (id)qword_1EA3C9FE0;
        if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v200 = objc_msgSend_length(v218, v190, v191, v192, v193, v194);
          if (v80) {
            objc_msgSend_orientation(v80, v195, v196, v197, v198, v199);
          }
          else {
            uint64_t v201 = 0x7FEFFFFFFFFFFFFFLL;
          }
          *(_DWORD *)uint64_t v301 = 134218240;
          uint64_t v302 = v200;
          __int16 v303 = 2048;
          uint64_t v304 = v201;
          _os_log_impl(&dword_1C492D000, v189, OS_LOG_TYPE_DEBUG, "Created initial transformed text line of length %lu and orientation %4.2f using alpha shape matching.", v301, 0x16u);
        }

        if (v308[1])
        {
          *(void **)uint64_t v309 = v308[1];
          operator delete(v308[1]);
        }
        if (v307[0])
        {
          v307[1] = v307[0];
          operator delete(v307[0]);
        }
        if (*(void *)&v305[24])
        {
          *(void *)v306 = *(void *)&v305[24];
          operator delete(*(void **)&v305[24]);
        }
        if (*(void *)v305)
        {
          *(void *)&v305[8] = *(void *)v305;
          operator delete(*(void **)v305);
        }
        char v79 = 1;
        uint64_t v81 = (void *)*((void *)&v313 + 1);
        if (!*((void *)&v313 + 1))
        {
LABEL_49:
          if ((void)v312)
          {
            *((void *)&v312 + 1) = v312;
            operator delete((void *)v312);
          }
          if (*(void *)&buf[24])
          {
            *(void *)&long long v311 = *(void *)&buf[24];
            operator delete(*(void **)&buf[24]);
          }
          if (*(void *)buf)
          {
            *(void *)&uint8_t buf[8] = *(void *)buf;
            operator delete(*(void **)buf);
          }
          if (v291)
          {
            *(void *)uint64_t v292 = v291;
            operator delete(v291);
          }
          if (*((void *)&v289 + 1))
          {
            *(void *)long long v290 = *((void *)&v289 + 1);
            operator delete(*((void **)&v289 + 1));
          }
          if (v288[0])
          {
            v288[1] = v288[0];
            operator delete(v288[0]);
          }
          if (__src[1])
          {
            *(void **)long long v287 = __src[1];
            operator delete(__src[1]);
          }
          if (v285[0])
          {
            v285[1] = v285[0];
            operator delete(v285[0]);
          }
          if (v79) {
            goto LABEL_66;
          }
LABEL_100:
          int v107 = 1;
          goto LABEL_238;
        }
LABEL_48:
        *(void *)&long long v314 = v81;
        operator delete(v81);
        goto LABEL_49;
      }
    }
    else
    {
      long long v313 = 0u;
      long long v314 = 0u;
      long long v311 = 0u;
      long long v312 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    char v79 = 0;
    uint64_t v80 = 0;
    uint64_t v81 = (void *)*((void *)&v313 + 1);
    if (!*((void *)&v313 + 1)) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_39:
  if (a11 == 1.79769313e308) {
    a11 = 0.0;
  }
  uint64_t v77 = objc_opt_class();
  if (!v77)
  {
    *(_OWORD *)long long v290 = 0u;
    long long v289 = 0u;
    *(_OWORD *)long long v288 = 0u;
    *(_OWORD *)long long v287 = 0u;
    *(_OWORD *)__src = 0u;
    *(_OWORD *)long long v285 = 0u;
    goto LABEL_91;
  }
  objc_msgSend_principalLinesFromTokens_strokes_strokePoints_orientation_useAltString_(v77, v78, (uint64_t)v20, (uint64_t)v217, (uint64_t)a9, a12, a11);
  if (*(void *)v287 - (unint64_t)__src[1] != 32
    || v220 && (((uint64_t (*)(double))v220[2])(*(double *)__src[1]) & 1) != 0)
  {
LABEL_91:
    char v105 = 0;
    uint64_t v80 = 0;
    double v106 = (void *)*((void *)&v289 + 1);
    if (!*((void *)&v289 + 1)) {
      goto LABEL_93;
    }
    goto LABEL_92;
  }
  uint64_t v108 = [CHTransformedTextLine alloc];
  sub_1C4AAA458(v255, (uint64_t)v285);
  long long v109 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v254[0] = *MEMORY[0x1E4F1DAB8];
  v254[1] = v109;
  v254[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  uint64_t v80 = objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v108, v110, (uint64_t)v217, (uint64_t)v20, (uint64_t)a8, (uint64_t)a9, v219, a6, v255, v254);
  if (v260)
  {
    long long v261 = v260;
    operator delete(v260);
  }
  if (v258)
  {
    uint64_t v259 = v258;
    operator delete(v258);
  }
  if (v256)
  {
    uint64_t v257 = v256;
    operator delete(v256);
  }
  if (v255[0])
  {
    v255[1] = v255[0];
    operator delete(v255[0]);
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v111 = (id)qword_1EA3C9FE0;
  if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v117 = objc_msgSend_length(v218, v112, v113, v114, v115, v116);
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v117;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a11;
    _os_log_impl(&dword_1C492D000, v111, OS_LOG_TYPE_DEBUG, "Created initial transformed text line of length %lu and orientation %4.2f using initial orientation estimate.", buf, 0x16u);
  }

  char v105 = 1;
  double v106 = (void *)*((void *)&v289 + 1);
  if (*((void *)&v289 + 1))
  {
LABEL_92:
    *(void *)long long v290 = v106;
    operator delete(v106);
  }
LABEL_93:
  if (v288[0])
  {
    v288[1] = v288[0];
    operator delete(v288[0]);
  }
  if (__src[1])
  {
    *(void **)long long v287 = __src[1];
    operator delete(__src[1]);
  }
  if (v285[0])
  {
    v285[1] = v285[0];
    operator delete(v285[0]);
  }
  if ((v105 & 1) == 0) {
    goto LABEL_100;
  }
LABEL_66:
  uint64_t v82 = objc_opt_class();
  objc_msgSend_textLineFitScore_useAltString_(v82, v83, (uint64_t)v80, a12, v84, v85);
  double v87 = v86;
  uint64_t v88 = objc_opt_class();
  unint64_t v245 = 0;
  uint64_t v244 = 0;
  long long v246 = 0;
  uint64_t v89 = __p[0];
  int64_t v90 = (char *)__p[1] - (char *)__p[0];
  if (__p[1] != __p[0])
  {
    if (v90 < 0) {
      sub_1C494A220();
    }
    uint64_t v244 = operator new((char *)__p[1] - (char *)__p[0]);
    long long v246 = (char *)v244 + 16 * (v90 >> 4);
    memcpy(v244, v89, v90);
    unint64_t v245 = v246;
  }
  sub_1C4AAA458(v247, (uint64_t)&v294[1]);
  if (v88)
  {
    objc_msgSend_refinedPrincipalLinesForTextLine_points_alphaShape_renderedTextPointsAndLines_useAltString_shouldCancel_(v88, v91, (uint64_t)v80, (uint64_t)a8, (uint64_t)a10, (uint64_t)&v244, a12, v220);
    uint64_t v92 = v252;
    if (!v252) {
      goto LABEL_72;
    }
    goto LABEL_71;
  }
  *(_OWORD *)long long v290 = 0u;
  long long v289 = 0u;
  *(_OWORD *)long long v288 = 0u;
  *(_OWORD *)long long v287 = 0u;
  *(_OWORD *)__src = 0u;
  *(_OWORD *)long long v285 = 0u;
  uint64_t v92 = v252;
  if (v252)
  {
LABEL_71:
    uint64_t v253 = v92;
    operator delete(v92);
  }
LABEL_72:
  if (v250)
  {
    uint64_t v251 = v250;
    operator delete(v250);
  }
  if (v248)
  {
    long long v249 = v248;
    operator delete(v248);
  }
  if (v247[0])
  {
    v247[1] = v247[0];
    operator delete(v247[0]);
  }
  if (v244)
  {
    unint64_t v245 = v244;
    operator delete(v244);
  }
  if (*(void *)v287 - (unint64_t)__src[1] == 32)
  {
    id v212 = v20;
    uint64_t v93 = objc_opt_class();
    sub_1C4AAA458(v237, (uint64_t)v285);
    if (v80)
    {
      objc_msgSend_points(v80, v94, v95, v96, v97, v98);
      if (v93)
      {
LABEL_83:
        objc_msgSend_flipPrincipalLine_points_string_outWasFlipped_(v93, v94, (uint64_t)v237, (uint64_t)v305, (uint64_t)v218, 0);
        uint64_t v99 = *(char **)buf;
        uint64_t v100 = *(char **)&buf[8];
LABEL_117:
        sub_1C49B7D84(v285, v99, v100, (v100 - v99) >> 4);
        sub_1C49B7D84(&__src[1], *(char **)&buf[24], (char *)v311, (uint64_t)(v311 - *(void *)&buf[24]) >> 4);
        sub_1C49B7D84(v288, (char *)v312, *((char **)&v312 + 1), (uint64_t)(*((void *)&v312 + 1) - v312) >> 4);
        sub_1C49B7D84((void *)&v289 + 1, *((char **)&v313 + 1), (char *)v314, (uint64_t)(v314 - *((void *)&v313 + 1)) >> 4);
        if (*((void *)&v313 + 1))
        {
          *(void *)&long long v314 = *((void *)&v313 + 1);
          operator delete(*((void **)&v313 + 1));
        }
        if ((void)v312)
        {
          *((void *)&v312 + 1) = v312;
          operator delete((void *)v312);
        }
        if (*(void *)&buf[24])
        {
          *(void *)&long long v311 = *(void *)&buf[24];
          operator delete(*(void **)&buf[24]);
        }
        if (*(void *)buf)
        {
          *(void *)&uint8_t buf[8] = *(void *)buf;
          operator delete(*(void **)buf);
        }
        if (*(void *)v305)
        {
          *(void *)&v305[8] = *(void *)v305;
          operator delete(*(void **)v305);
        }
        if (v242)
        {
          uint64_t v243 = v242;
          operator delete(v242);
        }
        if (v240)
        {
          double v241 = v240;
          operator delete(v240);
        }
        if (v238)
        {
          double v239 = v238;
          operator delete(v238);
        }
        if (v237[0])
        {
          v237[1] = v237[0];
          operator delete(v237[0]);
        }
        uint64_t v118 = [CHTransformedTextLine alloc];
        uint64_t v124 = objc_msgSend_textStrokes(v80, v119, v120, v121, v122, v123);
        uint64_t v135 = objc_msgSend_tokens(v80, v125, v126, v127, v128, v129);
        if (v80)
        {
          objc_msgSend_points(v80, v130, v131, v132, v133, v134);
          objc_msgSend_strokePoints(v80, v136, v137, v138, v139, v140);
        }
        else
        {
          memset(buf, 0, 24);
          memset(v305, 0, 24);
        }
        uint64_t v141 = objc_msgSend_locale(v80, v130, v131, v132, v133, v134);
        uint64_t v147 = objc_msgSend_strokeClassification(v80, v142, v143, v144, v145, v146);
        sub_1C4AAA458(v230, (uint64_t)v285);
        uint64_t v148 = (_OWORD *)MEMORY[0x1E4F1DAB8];
        long long v149 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        v229[0] = *MEMORY[0x1E4F1DAB8];
        v229[1] = v149;
        v229[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        id v151 = objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v118, v150, (uint64_t)v124, (uint64_t)v135, (uint64_t)buf, (uint64_t)v305, v141, v147, v230, v229);
        if (v235)
        {
          long long v236 = v235;
          operator delete(v235);
        }
        if (v233)
        {
          long long v234 = v233;
          operator delete(v233);
        }
        if (v231)
        {
          uint64_t v232 = v231;
          operator delete(v231);
        }
        if (v230[0])
        {
          v230[1] = v230[0];
          operator delete(v230[0]);
        }

        uint64_t v152 = *(void *)v305;
        if (*(void *)v305)
        {
          uint64_t v153 = *(void *)&v305[8];
          id v154 = *(void **)v305;
          if (*(void *)&v305[8] != *(void *)v305)
          {
            uint64_t v155 = *(void *)&v305[8];
            do
            {
              uint64_t v157 = *(void **)(v155 - 24);
              v155 -= 24;
              uint64_t v156 = v157;
              if (v157)
              {
                *(void *)(v153 - 16) = v156;
                operator delete(v156);
              }
              uint64_t v153 = v155;
            }
            while (v155 != v152);
            id v154 = *(void **)v305;
            uint64_t v20 = v212;
          }
          *(void *)&v305[8] = v152;
          operator delete(v154);
        }
        if (*(void *)buf)
        {
          *(void *)&uint8_t buf[8] = *(void *)buf;
          operator delete(*(void **)buf);
        }

        uint64_t v158 = objc_opt_class();
        if (v158)
        {
          objc_msgSend_fixPrincipalLinesOrientation_useAltString_skipAmbiguousCharacters_(v158, v159, (uint64_t)v151, a12, v31 > 4, v160);
        }
        else
        {
          long long v313 = 0u;
          long long v314 = 0u;
          long long v311 = 0u;
          long long v312 = 0u;
          memset(buf, 0, sizeof(buf));
        }
        uint64_t v161 = [CHTransformedTextLine alloc];
        sub_1C4AAA458(v222, (uint64_t)buf);
        long long v162 = v148[1];
        v221[0] = *v148;
        v221[1] = v162;
        v221[2] = v148[2];
        long long v164 = objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v161, v163, (uint64_t)v217, (uint64_t)v20, (uint64_t)a8, (uint64_t)a9, v219, a6, v222, v221);

        if (v227)
        {
          long long v228 = v227;
          operator delete(v227);
        }
        if (v225)
        {
          uint64_t v226 = v225;
          operator delete(v225);
        }
        if (v223)
        {
          uint64_t v224 = v223;
          operator delete(v223);
        }
        if (v222[0])
        {
          v222[1] = v222[0];
          operator delete(v222[0]);
        }
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        long long v165 = (id)qword_1EA3C9FE0;
        if (os_log_type_enabled(v165, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v176 = objc_msgSend_length(v218, v166, v167, v168, v169, v170);
          if (v80) {
            objc_msgSend_orientation(v80, v171, v172, v173, v174, v175);
          }
          else {
            uint64_t v177 = 0x7FEFFFFFFFFFFFFFLL;
          }
          *(_DWORD *)int v305 = 134218240;
          *(void *)&v305[4] = v176;
          *(_WORD *)&v305[12] = 2048;
          *(void *)&v305[14] = v177;
          _os_log_impl(&dword_1C492D000, v165, OS_LOG_TYPE_DEBUG, "Created refined transformed text line of length %lu and orientation %4.2f.", v305, 0x16u);
        }

        BOOL v202 = objc_opt_class();
        objc_msgSend_textLineFitScore_useAltString_(v202, v203, (uint64_t)v164, a12, v204, v205);
        double v207 = v206;
        if (v206 < v87)
        {
          id v208 = v164;

          uint64_t v80 = v208;
          double v87 = v207;
        }
        if (*((void *)&v313 + 1))
        {
          *(void *)&long long v314 = *((void *)&v313 + 1);
          operator delete(*((void **)&v313 + 1));
        }
        if ((void)v312)
        {
          *((void *)&v312 + 1) = v312;
          operator delete((void *)v312);
        }
        if (*(void *)&buf[24])
        {
          *(void *)&long long v311 = *(void *)&buf[24];
          operator delete(*(void **)&buf[24]);
        }
        if (*(void *)buf)
        {
          *(void *)&uint8_t buf[8] = *(void *)buf;
          operator delete(*(void **)buf);
        }

        goto LABEL_227;
      }
    }
    else
    {
      memset(v305, 0, 24);
      if (v93) {
        goto LABEL_83;
      }
    }
    uint64_t v100 = 0;
    uint64_t v99 = 0;
    long long v313 = 0u;
    long long v314 = 0u;
    long long v311 = 0u;
    long long v312 = 0u;
    memset(buf, 0, sizeof(buf));
    goto LABEL_117;
  }
LABEL_227:
  if (v80 && (!v220 || (v220[2]() & 1) == 0))
  {
    if (a13)
    {
      int v107 = 0;
      *a13 = v87;
      uint64_t v209 = (void *)*((void *)&v289 + 1);
      if (!*((void *)&v289 + 1)) {
        goto LABEL_232;
      }
    }
    else
    {
      int v107 = 0;
      uint64_t v209 = (void *)*((void *)&v289 + 1);
      if (!*((void *)&v289 + 1)) {
        goto LABEL_232;
      }
    }
    goto LABEL_231;
  }
  int v107 = 1;
  uint64_t v209 = (void *)*((void *)&v289 + 1);
  if (*((void *)&v289 + 1))
  {
LABEL_231:
    *(void *)long long v290 = v209;
    operator delete(v209);
  }
LABEL_232:
  if (v288[0])
  {
    v288[1] = v288[0];
    operator delete(v288[0]);
  }
  if (__src[1])
  {
    *(void **)long long v287 = __src[1];
    operator delete(__src[1]);
  }
  if (v285[0])
  {
    v285[1] = v285[0];
    operator delete(v285[0]);
  }
LABEL_238:
  if (v299[0])
  {
    v299[1] = v299[0];
    operator delete(v299[0]);
  }
  if (v297[1])
  {
    *(void **)&long long v298 = v297[1];
    operator delete(v297[1]);
  }
  if (v296[0])
  {
    v296[1] = v296[0];
    operator delete(v296[0]);
  }
  if (v294[1])
  {
    *(void **)&long long v295 = v294[1];
    operator delete(v294[1]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  if (v107) {
    id v210 = 0;
  }
  else {
    id v210 = v80;
  }

  return v210;
}

+ (PrincipalLines)refinedPrincipalLinesForTextLine:(SEL)a3 points:(id)a4 alphaShape:(const void *)a5 renderedTextPointsAndLines:(const void *)a6 useAltString:(PointsAndPrincipalLines *)a7 shouldCancel:(BOOL)a8
{
  BOOL v175 = a8;
  long long v164 = a5;
  long long v165 = a6;
  uint64_t v201 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v168 = a9;
  uint64_t v172 = v10;
  uint64_t v11 = objc_opt_class();
  uint64_t v17 = objc_msgSend_string(v10, v12, v13, v14, v15, v16);
  uint64_t v167 = objc_msgSend_stringForRendering_useAltChars_(v11, v18, (uint64_t)v17, v175, v19, v20);

  double v197 = 0.0;
  double v198 = 0.0;
  double v196 = 0.0;
  uint64_t v21 = objc_opt_class();
  objc_msgSend_getDeformValuesForTextLine_useAltString_outfullDeform_outAscenderDeform_outDescenderDeform_(v21, v22, (uint64_t)v172, v175, (uint64_t)&v198, (uint64_t)&v197, &v196);
  uint64_t v169 = objc_msgSend_tokenDistanceSizes_(v172, v23, 0, v24, v25, v26);
  uint64_t v171 = v167;
  uint64_t v176 = v171;
  if (!objc_msgSend_count(v169, v27, v28, v29, v30, v31)) {
    goto LABEL_37;
  }
  id v36 = objc_opt_class();
  objc_msgSend_estimatedRenderedTextSize_fullDeformValue_ascenderDeformValue_descenderDeformValue_(v36, v37, (uint64_t)v171, v38, v39, v40, v198, v197, v196);
  double v42 = v41;
  objc_msgSend_orientation(v172, v43, v44, v45, v46, v47);
  double v54 = tan(v48);
  if (!v172) {
    goto LABEL_16;
  }
  objc_msgSend_points(v172, v49, v50, v51, v52, v53);
  int64_t v55 = (char *)v178[1] - (char *)v178[0];
  if (v178[1] != v178[0])
  {
    uint64_t v56 = v55 >> 4;
    if ((unint64_t)(v55 >> 4) <= 1) {
      uint64_t v56 = 1;
    }
    double v57 = (double *)((char *)v178[0] + 8);
    double v58 = 1.79769313e308;
    double v59 = -1.79769313e308;
    do
    {
      double v60 = *v57 + *(v57 - 1) * v54;
      if (v60 <= v58) {
        double v58 = *v57 + *(v57 - 1) * v54;
      }
      if (v60 >= v59) {
        double v59 = *v57 + *(v57 - 1) * v54;
      }
      v57 += 2;
      --v56;
    }
    while (v56);
    goto LABEL_15;
  }
  if (!v178[1])
  {
LABEL_16:
    double v61 = -INFINITY;
    goto LABEL_17;
  }
  double v58 = 1.79769313e308;
  double v59 = -1.79769313e308;
LABEL_15:
  v178[1] = v178[0];
  operator delete(v178[0]);
  double v61 = v59 - v58;
LABEL_17:
  uint64_t v177 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v49, v50, v51, v52, v53, v164, v165);
  long long v194 = 0u;
  long long v195 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  id v62 = v169;
  uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v192, (uint64_t)v200, 16, v64);
  if (v70)
  {
    double v71 = fabs(v61) / sqrt(v54 * v54 + 1.0) + 1.0e-10;
    uint64_t v72 = *(void *)v193;
    do
    {
      for (uint64_t i = 0; i != v70; ++i)
      {
        if (*(void *)v193 != v72) {
          objc_enumerationMutation(v62);
        }
        objc_msgSend_floatValue(*(void **)(*((void *)&v192 + 1) + 8 * i), v65, v66, v67, v68, v69);
        char v79 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v75, (unint64_t)fmax(fmin(round(v42 * (v74 / v71) / 10.0), 24.0), 0.0), v76, v77, v78);
        objc_msgSend_addObject_(v177, v80, (uint64_t)v79, v81, v82, v83);
      }
      uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v192, (uint64_t)v200, 16, v69);
    }
    while (v70);
  }

  objc_msgSend_string(MEMORY[0x1E4F28E78], v84, v85, v86, v87, v88);
  uint64_t v176 = (CoreHandwriting *)objc_claimAutoreleasedReturnValue();
  uint64_t v94 = objc_msgSend_splitIntoTokens(v172, v89, v90, v91, v92, v93);
  long long v190 = 0u;
  long long v191 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  obuint64_t j = v94;
  uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v95, (uint64_t)&v188, (uint64_t)v199, 16, v96);
  if (v102)
  {
    unint64_t v103 = 0;
    uint64_t v174 = *(void *)v189;
    do
    {
      for (uint64_t j = 0; j != v102; ++j)
      {
        if (*(void *)v189 != v174) {
          objc_enumerationMutation(obj);
        }
        char v105 = objc_msgSend_string(*(void **)(*((void *)&v188 + 1) + 8 * j), v97, v98, v99, v100, v101);
        uint64_t v111 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], v106, v107, v108, v109, v110);
        uint64_t v116 = objc_msgSend_stringByTrimmingCharactersInSet_(v105, v112, (uint64_t)v111, v113, v114, v115);

        uint64_t v117 = objc_opt_class();
        uint64_t v121 = objc_msgSend_stringForRendering_useAltChars_(v117, v118, (uint64_t)v116, v175, v119, v120);
        objc_msgSend_appendString_(v176, v122, (uint64_t)v121, v123, v124, v125);
        if (v103 < objc_msgSend_count(v177, v126, v127, v128, v129, v130))
        {
          uint64_t v135 = objc_msgSend_objectAtIndexedSubscript_(v177, v131, v103, v132, v133, v134);
          uint64_t v141 = objc_msgSend_unsignedIntegerValue(v135, v136, v137, v138, v139, v140);

          uint64_t v144 = objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(&stru_1F20141C8, v142, v141, @" ", 0, v143);
          uint64_t v150 = objc_msgSend_rangeOfString_(v144, v145, @"    ", v146, v147, v148);
          while (v150 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v154 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v144, v149, v150, (uint64_t)v149, @" : ", v153);

            uint64_t v150 = objc_msgSend_rangeOfString_(v154, v155, @"    ", v156, v157, v158);
            uint64_t v144 = v154;
          }
          objc_msgSend_appendString_(v176, v149, (uint64_t)v144, v151, v152, v153);
        }
        ++v103;
      }
      uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v97, (uint64_t)&v188, (uint64_t)v199, 16, v101);
    }
    while (v102);
  }

LABEL_37:
  if (a7->var0.__end_ == a7->var0.__begin_
    || (objc_msgSend_isEqualToString_(v176, v32, (uint64_t)v171, v33, v34, v35) & 1) == 0)
  {
    CoreHandwriting::getPointsAndPrincipalLinesForText(v176, (NSString *)0x64, (uint64_t)v178);
    begin = a7->var0.__begin_;
    if (a7->var0.__begin_)
    {
      a7->var0.__end_ = begin;
      operator delete(begin);
      a7->var0.__begin_ = 0;
      a7->var0.__end_ = 0;
      a7->var0.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&a7->var0.__begin_ = *(_OWORD *)v178;
    a7->var0.__end_cap_.__value_ = v179;
    v178[1] = 0;
    uint64_t v179 = 0;
    v178[0] = 0;
    if (v178 != (void **)a7)
    {
      sub_1C49B7D84(&a7->var1.descender.__begin_, (char *)v180, v181, (v181 - (unsigned char *)v180) >> 4);
      sub_1C49B7D84(&a7->var1.base.__begin_, (char *)v182, v183, (v183 - (unsigned char *)v182) >> 4);
      sub_1C49B7D84(&a7->var1.median.__begin_, (char *)v184, v185, (v185 - (unsigned char *)v184) >> 4);
      sub_1C49B7D84(&a7->var1.top.__begin_, (char *)__p, v187, (v187 - (unsigned char *)__p) >> 4);
    }
    if (__p)
    {
      long long v187 = (char *)__p;
      operator delete(__p);
    }
    if (v184)
    {
      uint64_t v185 = (char *)v184;
      operator delete(v184);
    }
    if (v182)
    {
      uint64_t v183 = (char *)v182;
      operator delete(v182);
    }
    if (v180)
    {
      uint64_t v181 = (char *)v180;
      operator delete(v180);
    }
    if (v178[0])
    {
      v178[1] = v178[0];
      operator delete(v178[0]);
    }
  }
  CoreHandwriting::deformImagePointsAndLines((CoreHandwriting *)a7, v198, v197, v196, (uint64_t)v178);
  uint64_t v160 = objc_opt_class();
  if (v160)
  {
    objc_msgSend_principalLinesForPoints_writtenAlphaShape_imgPointsAndPrincipalLines_shouldCancel_(v160, v161, (uint64_t)v164, (uint64_t)v165, (uint64_t)v178, (uint64_t)v168);
    long long v162 = (char *)__p;
    if (!__p) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
  *(_OWORD *)&retstr->top.__end_ = 0u;
  *(_OWORD *)&retstr->base.__end_ = 0u;
  *(_OWORD *)&retstr->median.__begin_ = 0u;
  *(_OWORD *)&retstr->descender.__begin_ = 0u;
  *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
  long long v162 = (char *)__p;
  if (__p)
  {
LABEL_55:
    long long v187 = v162;
    operator delete(v162);
  }
LABEL_56:
  if (v184)
  {
    uint64_t v185 = (char *)v184;
    operator delete(v184);
  }
  if (v182)
  {
    uint64_t v183 = (char *)v182;
    operator delete(v182);
  }
  if (v180)
  {
    uint64_t v181 = (char *)v180;
    operator delete(v180);
  }
  if (v178[0])
  {
    v178[1] = v178[0];
    operator delete(v178[0]);
  }

  return result;
}

+ (void)getDeformValuesForTextLine:(id)a3 useAltString:(BOOL)a4 outfullDeform:(double *)a5 outAscenderDeform:(double *)a6 outDescenderDeform:(double *)a7
{
  BOOL v7 = a4;
  uint64_t v377 = *MEMORY[0x1E4F143B8];
  id v352 = a3;
  double v354 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
  uint64_t v353 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v13, v14, v15, v16, v17);
  BOOL v355 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v18, v19, v20, v21, v22);
  uint64_t v28 = objc_msgSend_string(v352, v23, v24, v25, v26, v27);
  uint64_t v34 = objc_msgSend_string(v352, v29, v30, v31, v32, v33);
  uint64_t v40 = objc_msgSend_uppercaseString(v34, v35, v36, v37, v38, v39);
  if (objc_msgSend_isEqualToString_(v28, v41, (uint64_t)v40, v42, v43, v44))
  {
    uint64_t v50 = objc_msgSend_string(v352, v45, v46, v47, v48, v49);
    uint64_t v56 = objc_msgSend_string(v352, v51, v52, v53, v54, v55);
    id v62 = objc_msgSend_lowercaseString(v56, v57, v58, v59, v60, v61);
    int v67 = objc_msgSend_isEqualToString_(v50, v63, (uint64_t)v62, v64, v65, v66) ^ 1;
  }
  else
  {
    int v67 = 0;
  }

  uint64_t v68 = objc_opt_class();
  float v74 = objc_msgSend_locale(v352, v69, v70, v71, v72, v73);
  int shouldDeformAscendersDescenders = objc_msgSend_shouldDeformAscendersDescenders_(v68, v75, (uint64_t)v74, v76, v77, v78);

  objc_msgSend_splitIntoTokens(v352, v80, v81, v82, v83, v84);
  long long v374 = 0u;
  long long v375 = 0u;
  long long v372 = 0u;
  long long v373 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v85, (uint64_t)&v372, (uint64_t)v376, 16, v86);
  if (!v87) {
    goto LABEL_176;
  }
  int v356 = shouldDeformAscendersDescenders ^ 1 | v67;
  uint64_t v88 = *(void *)v373;
  do
  {
    for (uint64_t i = 0; i != v87; ++i)
    {
      if (*(void *)v373 != v88) {
        objc_enumerationMutation(obj);
      }
      uint64_t v90 = *(void **)(*((void *)&v372 + 1) + 8 * i);
      uint64_t v91 = objc_opt_class();
      uint64_t v97 = objc_msgSend_string(v90, v92, v93, v94, v95, v96);
      uint64_t v101 = objc_msgSend_stringForRendering_useAltChars_(v91, v98, (uint64_t)v97, v7, v99, v100);

      uint64_t v107 = objc_msgSend_ch_smallCharacterSet(MEMORY[0x1E4F28B88], v102, v103, v104, v105, v106);
      uint64_t v112 = objc_msgSend_indexesOfCharacters_(v101, v108, (uint64_t)v107, v109, v110, v111);
      uint64_t v118 = objc_msgSend_count(v112, v113, v114, v115, v116, v117);
      BOOL v124 = v118 == objc_msgSend_length(v101, v119, v120, v121, v122, v123);

      if (!v124 && v90)
      {
        objc_msgSend_points(v90, v125, v126, v127, v128, v129);
        unint64_t v135 = (char *)v365 - (char *)v364;
        if (v364)
        {
          uint64_t v365 = v364;
          operator delete(v364);
        }
        if (v135 >= 0x20)
        {
          objc_msgSend_orientation(v90, v130, v131, v132, v133, v134);
          double v137 = tan(v136);
          objc_msgSend_points(v90, v138, v139, v140, v141, v142);
          unint64_t v148 = ((char *)v365 - (char *)v364) >> 4;
          double v149 = (double)v148;
          if (v365 == v364)
          {
            double v153 = 1.79769313e308;
            double v154 = -1.79769313e308;
            double v156 = 0.0 / v149;
            if (v365) {
              goto LABEL_26;
            }
          }
          else
          {
            if (v148 <= 1) {
              uint64_t v150 = 1;
            }
            else {
              uint64_t v150 = ((char *)v365 - (char *)v364) >> 4;
            }
            uint64_t v151 = v364 + 1;
            double v152 = 0.0;
            double v153 = 1.79769313e308;
            double v154 = -1.79769313e308;
            do
            {
              double v155 = *v151 + *(v151 - 1) * v137;
              if (v155 <= v153) {
                double v153 = *v151 + *(v151 - 1) * v137;
              }
              if (v155 >= v154) {
                double v154 = *v151 + *(v151 - 1) * v137;
              }
              double v152 = v152 + v155;
              v151 += 2;
              --v150;
            }
            while (v150);
            double v156 = v152 / v149;
LABEL_26:
            uint64_t v365 = v364;
            operator delete(v364);
          }
          objc_msgSend_principalLines(v90, v143, v144, v145, v146, v147);
          uint64_t v157 = *v368;
          objc_msgSend_principalLines(v90, v158, v159, v160, v161, v162);
          double v163 = -v137;
          double v164 = v153 + *v363 * v163;
          uint64_t v170 = (double *)operator new(0x10uLL);
          *(void *)uint64_t v170 = v157;
          v170[1] = v164;
          uint64_t v171 = v170 + 2;
          __p = v170;
          v371 = v170 + 2;
          if (v363) {
            operator delete(v363);
          }
          if (v362) {
            operator delete(v362);
          }
          if (v361) {
            operator delete(v361);
          }
          if (v360) {
            operator delete(v360);
          }
          if (v368) {
            operator delete(v368);
          }
          if (v367) {
            operator delete(v367);
          }
          if (v366) {
            operator delete(v366);
          }
          if (v364)
          {
            uint64_t v365 = v364;
            operator delete(v364);
          }
          objc_msgSend_principalLines(v90, v165, v166, v167, v168, v169);
          uint64_t v172 = v368[2];
          objc_msgSend_principalLines(v90, v173, v174, v175, v176, v177);
          double v183 = v153 + v363[2] * v163;
          uint64_t v184 = v171;
          if (v171 < v371)
          {
            *(void *)uint64_t v171 = v172;
            v171[1] = v183;
            uint64_t v185 = (char *)(v171 + 2);
            goto LABEL_61;
          }
          uint64_t v186 = ((char *)v171 - (char *)__p) >> 4;
          unint64_t v187 = v186 + 1;
          if ((unint64_t)(v186 + 1) >> 60) {
            sub_1C494A220();
          }
          uint64_t v188 = (char *)v371 - (char *)__p;
          if (v371 - __p > v187) {
            unint64_t v187 = v188 >> 3;
          }
          if ((unint64_t)v188 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v189 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v189 = v187;
          }
          if (v189)
          {
            if (v189 >> 60) {
              sub_1C4949AA8();
            }
            long long v190 = (double *)((char *)operator new(16 * v189) + 16 * v186);
            *(void *)long long v190 = v172;
            v190[1] = v183;
            uint64_t v191 = (uint64_t)v190;
            if (v171 == __p)
            {
LABEL_59:
              uint64_t v185 = (char *)(v190 + 2);
              __p = (double *)v191;
              if (v184) {
                goto LABEL_60;
              }
              goto LABEL_61;
            }
          }
          else
          {
            long long v190 = (double *)(16 * v186);
            *(void *)long long v190 = v172;
            v190[1] = v183;
            uint64_t v191 = 16 * v186;
            if (v171 == __p) {
              goto LABEL_59;
            }
          }
          do
          {
            *(_OWORD *)(v191 - 16) = *((_OWORD *)v184 - 1);
            v191 -= 16;
            v184 -= 2;
          }
          while (v184 != __p);
          uint64_t v184 = __p;
          uint64_t v185 = (char *)(v190 + 2);
          __p = (double *)v191;
          if (v184) {
LABEL_60:
          }
            operator delete(v184);
LABEL_61:
          uint64_t v370 = (double *)v185;
          if (v363) {
            operator delete(v363);
          }
          if (v362) {
            operator delete(v362);
          }
          if (v361) {
            operator delete(v361);
          }
          if (v360) {
            operator delete(v360);
          }
          if (v368) {
            operator delete(v368);
          }
          if (v367) {
            operator delete(v367);
          }
          if (v366) {
            operator delete(v366);
          }
          if (v364)
          {
            uint64_t v365 = v364;
            operator delete(v364);
          }
          objc_msgSend_principalLines(v90, v178, v179, v180, v181, v182);
          uint64_t v192 = *(void *)v364;
          objc_msgSend_principalLines(v90, v193, v194, v195, v196, v197);
          double v198 = v154 + *v360 * v163;
          uint64_t v204 = (double *)operator new(0x10uLL);
          *(void *)uint64_t v204 = v192;
          v204[1] = v198;
          uint64_t v205 = v204 + 2;
          v358 = v204;
          uint64_t v359 = v204 + 2;
          if (v363) {
            operator delete(v363);
          }
          if (v362) {
            operator delete(v362);
          }
          if (v361) {
            operator delete(v361);
          }
          if (v360) {
            operator delete(v360);
          }
          if (v368) {
            operator delete(v368);
          }
          if (v367) {
            operator delete(v367);
          }
          if (v366) {
            operator delete(v366);
          }
          if (v364)
          {
            uint64_t v365 = v364;
            operator delete(v364);
          }
          objc_msgSend_principalLines(v90, v199, v200, v201, v202, v203);
          uint64_t v206 = *((void *)v364 + 2);
          objc_msgSend_principalLines(v90, v207, v208, v209, v210, v211);
          double v217 = v154 + v360[2] * v163;
          id v218 = v205;
          if (v205 < v359)
          {
            *(void *)uint64_t v205 = v206;
            v205[1] = v217;
            id v219 = v205 + 2;
            goto LABEL_111;
          }
          uint64_t v220 = ((char *)v205 - (char *)v358) >> 4;
          unint64_t v221 = v220 + 1;
          if ((unint64_t)(v220 + 1) >> 60) {
            sub_1C494A220();
          }
          uint64_t v222 = (char *)v359 - (char *)v358;
          if (v359 - v358 > v221) {
            unint64_t v221 = v222 >> 3;
          }
          if ((unint64_t)v222 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v223 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v223 = v221;
          }
          if (v223)
          {
            if (v223 >> 60) {
              sub_1C4949AA8();
            }
            uint64_t v224 = (double *)((char *)operator new(16 * v223) + 16 * v220);
            *(void *)uint64_t v224 = v206;
            v224[1] = v217;
            uint64_t v225 = (uint64_t)v224;
            if (v205 == v358)
            {
LABEL_109:
              id v219 = v224 + 2;
              v358 = (double *)v225;
              if (v218) {
                goto LABEL_110;
              }
              goto LABEL_111;
            }
          }
          else
          {
            uint64_t v224 = (double *)(16 * v220);
            *(void *)uint64_t v224 = v206;
            v224[1] = v217;
            uint64_t v225 = 16 * v220;
            if (v205 == v358) {
              goto LABEL_109;
            }
          }
          do
          {
            *(_OWORD *)(v225 - 16) = *((_OWORD *)v218 - 1);
            v225 -= 16;
            v218 -= 2;
          }
          while (v218 != v358);
          id v218 = v358;
          id v219 = v224 + 2;
          v358 = (double *)v225;
          if (v218) {
LABEL_110:
          }
            operator delete(v218);
LABEL_111:
          if (v363) {
            operator delete(v363);
          }
          if (v362) {
            operator delete(v362);
          }
          if (v361) {
            operator delete(v361);
          }
          if (v360) {
            operator delete(v360);
          }
          if (v368) {
            operator delete(v368);
          }
          if (v367) {
            operator delete(v367);
          }
          if (v366) {
            operator delete(v366);
          }
          if (v364)
          {
            uint64_t v365 = v364;
            operator delete(v364);
          }
          if ((char *)v370 - (char *)__p == (char *)v219 - (char *)v358)
          {
            uint64_t v226 = v358;
            unint64_t v227 = __p;
            if (__p != v370)
            {
              uint64_t v226 = v358;
              unint64_t v227 = __p;
              if (v358 != v219)
              {
                unint64_t v227 = __p;
                uint64_t v226 = v358;
                while (*v227 == *v226 && v227[1] == v226[1])
                {
                  v227 += 2;
                  v226 += 2;
                  if (v227 == v370 || v226 == v219) {
                    goto LABEL_138;
                  }
                }
                goto LABEL_140;
              }
            }
LABEL_138:
            if (v227 != v370) {
              goto LABEL_140;
            }
            double v229 = 0.0;
            if (v226 != v219) {
              goto LABEL_140;
            }
          }
          else
          {
LABEL_140:
            double v231 = *__p;
            double v230 = __p[1];
            double v232 = (__p[3] - v230) / (__p[2] - *__p);
            double v233 = v358[1];
            double v234 = (v358[3] - v233) / (v358[2] - *v358);
            double v235 = v233 - v234 * *v358;
            double v236 = *__p;
            if (v232 != 0.0) {
              double v236 = (v230 - -1.0 / v232 * v231 - v235) / (v234 - -1.0 / v232);
            }
            double v229 = sqrt((v230 - (v235 + v234 * v236)) * (v230 - (v235 + v234 * v236)) + (v231 - v236) * (v231 - v236));
          }
          objc_msgSend_principalLines(v90, v212, v213, v214, v215, v216);
          objc_msgSend_principalLines(v90, v237, v238, v239, v240, v241);
          double v247 = v361[2];
          double v248 = v361[3];
          double v249 = *v366;
          double v250 = v366[1];
          if (v363) {
            operator delete(v363);
          }
          if (v362) {
            operator delete(v362);
          }
          if (v361) {
            operator delete(v361);
          }
          if (v360) {
            operator delete(v360);
          }
          if (v368) {
            operator delete(v368);
          }
          if (v367) {
            operator delete(v367);
          }
          if (v366) {
            operator delete(v366);
          }
          if (v364)
          {
            uint64_t v365 = v364;
            operator delete(v364);
          }
          int hasDescender = objc_msgSend_hasDescender(v101, v242, v243, v244, v245, v246);
          int hasAscender = objc_msgSend_hasAscender(v101, v252, v253, v254, v255, v256);
          uint64_t v258 = objc_opt_class();
          objc_msgSend_estimatedRenderedTextSize_fullDeformValue_ascenderDeformValue_descenderDeformValue_(v258, v259, (uint64_t)v101, v260, v261, v262, 1.0, 0.0, 0.0);
          if (v269 >= 12.0 && v268 >= 12.0)
          {
            double v270 = v268
                 / v269
                 / (sqrt((v250 - v248) * (v250 - v248) + (v249 - v247) * (v249 - v247)) / (v229 + 1.0e-10) + 1.0e-10);
            if (v356)
            {
              id v271 = objc_msgSend_numberWithDouble_(NSNumber, v263, v264, v265, v266, v267, v270);
              objc_msgSend_addObject_(v355, v272, (uint64_t)v271, v273, v274, v275);
              goto LABEL_169;
            }
            if ((hasAscender & hasDescender) == 1)
            {
              double v276 = v269 * v270 + -52.5;
              double v277 = v154 - v156 + v156 - v153;
              uint64_t v278 = objc_msgSend_numberWithDouble_(NSNumber, v263, v264, v265, v266, v267, (v156 - v153) / v277 * v276 / 18.5 + -1.0);
              objc_msgSend_addObject_(v354, v279, (uint64_t)v278, v280, v281, v282);

              id v271 = objc_msgSend_numberWithDouble_(NSNumber, v283, v284, v285, v286, v287, (v154 - v156) / v277 * v276 / 17.0 + -1.0);
              objc_msgSend_addObject_(v353, v288, (uint64_t)v271, v289, v290, v291);
              goto LABEL_169;
            }
            if (hasAscender)
            {
              id v271 = objc_msgSend_numberWithDouble_(NSNumber, v263, v264, v265, v266, v267, -(v269 + -18.5 - v269 * v270) / 18.5 + -1.0);
              objc_msgSend_addObject_(v354, v292, (uint64_t)v271, v293, v294, v295);
              goto LABEL_169;
            }
            if (hasDescender)
            {
              id v271 = objc_msgSend_numberWithDouble_(NSNumber, v263, v264, v265, v266, v267, -(v269 + -17.0 - v269 * v270) / 17.0 + -1.0);
              objc_msgSend_addObject_(v353, v296, (uint64_t)v271, v297, v298, v299);
LABEL_169:
            }
          }
          if (v358) {
            operator delete(v358);
          }
          if (__p) {
            operator delete(__p);
          }
        }
      }
    }
    uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v300, (uint64_t)&v372, (uint64_t)v376, 16, v301);
  }
  while (v87);
LABEL_176:

  if (objc_msgSend_count(v354, v302, v303, v304, v305, v306))
  {
    long long v312 = objc_msgSend_valueForKeyPath_(v354, v307, @"@avg.floatValue", v309, v310, v311);
    objc_msgSend_floatValue(v312, v313, v314, v315, v316, v317);
    float v319 = v318;

    double v320 = v319;
  }
  else
  {
    double v320 = 0.0;
  }
  if (objc_msgSend_count(v353, v307, v308, v309, v310, v311))
  {
    v326 = objc_msgSend_valueForKeyPath_(v353, v321, @"@avg.floatValue", v323, v324, v325);
    objc_msgSend_floatValue(v326, v327, v328, v329, v330, v331);
    float v333 = v332;

    double v334 = v333;
  }
  else
  {
    double v334 = 0.0;
  }
  if (objc_msgSend_count(v355, v321, v322, v323, v324, v325))
  {
    v339 = objc_msgSend_valueForKeyPath_(v355, v335, @"@avg.floatValue", v336, v337, v338);
    objc_msgSend_floatValue(v339, v340, v341, v342, v343, v344);
    float v346 = v345;

    double v347 = v346;
    v348 = a5;
    if (a5) {
      goto LABEL_184;
    }
  }
  else
  {
    double v347 = 1.0;
    v348 = a5;
    if (a5) {
LABEL_184:
    }
      double *v348 = v347;
  }
  if (a6) {
    *a6 = fmax(v320, -0.5);
  }
  if (a7) {
    *a7 = fmax(v334, -0.5);
  }
}

+ (id)_nontextGroupStrokes:(id)a3 remainingStrokes:(id)a4 strokeProvider:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v57 = a5;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11, v12, v13, v7);
  id v58 = (id)objc_claimAutoreleasedReturnValue();
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = v7;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v63, (uint64_t)v68, 16, v15);
  if (v21)
  {
    uint64_t v22 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v64 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        uint64_t v25 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v16, v17, v18, v19, v20);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        uint64_t v31 = objc_msgSend_strokeIdentifiers(v24, v26, v27, v28, v29, v30);
        uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v59, (uint64_t)v67, 16, v33);
        if (v38)
        {
          uint64_t v39 = *(void *)v60;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v60 != v39) {
                objc_enumerationMutation(v31);
              }
              uint64_t v41 = *(void *)(*((void *)&v59 + 1) + 8 * j);
              if (objc_msgSend_containsObject_(v8, v34, v41, v35, v36, v37)) {
                objc_msgSend_addObject_(v25, v34, v41, v35, v36, v37);
              }
            }
            uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v59, (uint64_t)v67, 16, v37);
          }
          while (v38);
        }

        if (objc_msgSend_count(v25, v42, v43, v44, v45, v46))
        {
          uint64_t v50 = objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v47, (uint64_t)v25, (uint64_t)v57, v48, v49);
          objc_msgSend_addObject_(v58, v51, (uint64_t)v50, v52, v53, v54);
        }
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v63, (uint64_t)v68, 16, v20);
    }
    while (v21);
  }

  return v58;
}

- (id)addNonTextSegmentsAndLines:(id)a3 remainingStrokes:(id)a4 outNonTextStrokes:(id *)a5
{
  uint64_t v360 = *MEMORY[0x1E4F143B8];
  id v306 = a3;
  id v308 = a4;
  id v318 = (id)objc_msgSend_mutableCopy(v306, v7, v8, v9, v10, v11);
  uint64_t v12 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v18 = objc_msgSend_count(v308, v13, v14, v15, v16, v17);
  objc_msgSend_setWithCapacity_(v12, v19, v18, v20, v21, v22);
  id v314 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = objc_opt_class();
  uint64_t v29 = objc_msgSend_nontextStrokeGroups(self->_strokeGroupingResult, v24, v25, v26, v27, v28);
  uint64_t v32 = objc_msgSend__nontextGroupStrokes_remainingStrokes_strokeProvider_(v23, v30, (uint64_t)v29, (uint64_t)v308, (uint64_t)self->_strokeProvider, v31);

  long long v355 = 0u;
  long long v356 = 0u;
  long long v353 = 0u;
  long long v354 = 0u;
  obuint64_t j = v32;
  uint64_t v311 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v353, (uint64_t)v359, 16, v34);
  if (v311)
  {
    uint64_t v310 = *(void *)v354;
    do
    {
      for (uint64_t i = 0; i != v311; ++i)
      {
        if (*(void *)v354 != v310) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = *(void **)(*((void *)&v353 + 1) + 8 * i);
        objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v35, (uint64_t)v39, v36, v37, v38);
        CGFloat rect_16 = v41;
        CGFloat rect_24 = v40;
        CGFloat rect_8 = v42;
        double v44 = v43;
        CoreHandwriting::getPointSet(v39, &v351);
        unint64_t v50 = 0;
        uint64_t v313 = 0x7FFFFFFFFFFFFFFFLL;
        double v315 = -1.79769313e308;
        while (v50 < objc_msgSend_count(v318, v45, v46, v47, v48, v49))
        {
          uint64_t v51 = objc_msgSend_objectAtIndexedSubscript_(v318, v35, v50, v36, v37, v38);
          id v57 = objc_msgSend_textStrokes(v51, v52, v53, v54, v55, v56);
          objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v58, (uint64_t)v57, v59, v60, v61);
          double rect = v62;
          uint64_t v64 = v63;
          uint64_t v66 = v65;
          uint64_t v68 = v67;

          objc_msgSend_principalLines(v51, v69, v70, v71, v72, v73);
          float v74 = (double *)v345;
          objc_msgSend_principalLines(v51, v75, v76, v77, v78, v79);
          long double v80 = atan2(*(double *)(*((void *)&v338 + 1) + 24) - v74[1], *(double *)(*((void *)&v338 + 1) + 16) - *v74);
          double v86 = tan(v80);
          if (*((void *)&v341 + 1))
          {
            *(void *)&long long v342 = *((void *)&v341 + 1);
            operator delete(*((void **)&v341 + 1));
          }
          if (v340[0])
          {
            v340[1] = v340[0];
            operator delete(v340[0]);
          }
          if (*((void *)&v338 + 1))
          {
            *(void *)&long long v339 = *((void *)&v338 + 1);
            operator delete(*((void **)&v338 + 1));
          }
          if (v337[0])
          {
            v337[1] = v337[0];
            operator delete(v337[0]);
          }
          if (v349)
          {
            v350 = v349;
            operator delete(v349);
          }
          if (v347)
          {
            v348 = v347;
            operator delete(v347);
          }
          if (v345)
          {
            float v346 = v345;
            operator delete(v345);
          }
          if (v343)
          {
            uint64_t v344 = v343;
            operator delete(v343);
          }
          objc_msgSend_principalLines(v51, v81, v82, v83, v84, v85);
          double v87 = *((double *)v349 + 1);
          objc_msgSend_principalLines(v51, v88, v89, v90, v91, v92);
          double v93 = **((double **)&v341 + 1);
          *(void *)&long long v342 = *((void *)&v341 + 1);
          operator delete(*((void **)&v341 + 1));
          if (v340[0])
          {
            v340[1] = v340[0];
            operator delete(v340[0]);
          }
          if (*((void *)&v338 + 1))
          {
            *(void *)&long long v339 = *((void *)&v338 + 1);
            operator delete(*((void **)&v338 + 1));
          }
          if (v337[0])
          {
            v337[1] = v337[0];
            operator delete(v337[0]);
          }
          if (v349)
          {
            v350 = v349;
            operator delete(v349);
          }
          if (v347)
          {
            v348 = v347;
            operator delete(v347);
          }
          if (v345)
          {
            float v346 = v345;
            operator delete(v345);
          }
          if (v343)
          {
            uint64_t v344 = v343;
            operator delete(v343);
          }
          objc_msgSend_principalLines(v51, v94, v95, v96, v97, v98);
          double v99 = *((double *)v343 + 1);
          objc_msgSend_principalLines(v51, v100, v101, v102, v103, v104);
          double v316 = *(double *)v337[0];
          if (*((void *)&v341 + 1))
          {
            *(void *)&long long v342 = *((void *)&v341 + 1);
            operator delete(*((void **)&v341 + 1));
          }
          if (v340[0])
          {
            v340[1] = v340[0];
            operator delete(v340[0]);
          }
          if (*((void *)&v338 + 1))
          {
            *(void *)&long long v339 = *((void *)&v338 + 1);
            operator delete(*((void **)&v338 + 1));
          }
          if (v337[0])
          {
            v337[1] = v337[0];
            operator delete(v337[0]);
          }
          if (v349)
          {
            v350 = v349;
            operator delete(v349);
          }
          if (v347)
          {
            v348 = v347;
            operator delete(v347);
          }
          if (v345)
          {
            float v346 = v345;
            operator delete(v345);
          }
          if (v343)
          {
            uint64_t v344 = v343;
            operator delete(v343);
          }
          uint64_t v105 = v68;
          uint64_t v106 = v66;
          if (v352 == v351)
          {
            double v110 = -1.79769313e308;
            double v109 = 1.79769313e308;
          }
          else
          {
            unint64_t v107 = (v352 - (unsigned char *)v351) >> 4;
            if (v107 <= 1) {
              unint64_t v107 = 1;
            }
            uint64_t v108 = (double *)((char *)v351 + 8);
            double v109 = 1.79769313e308;
            double v110 = -1.79769313e308;
            do
            {
              double v111 = *v108 - *(v108 - 1) * v86;
              if (v111 <= v109) {
                double v109 = *v108 - *(v108 - 1) * v86;
              }
              if (v111 >= v110) {
                double v110 = *v108 - *(v108 - 1) * v86;
              }
              v108 += 2;
              --v107;
            }
            while (v107);
          }
          double v112 = rect;
          uint64_t v113 = v64;
          double MaxX = CGRectGetMaxX(*(CGRect *)(&v106 - 2));
          v362.origin.double x = v44;
          v362.size.double width = rect_16;
          v362.origin.CGFloat y = rect_24;
          v362.size.double height = rect_8;
          double v115 = CGRectGetMaxX(v362);
          double v116 = v87 - v93 * v86;
          double v117 = v99 - v316 * v86;
          double v118 = fmin(v117, v110) - fmax(v116, v109);
          double v119 = v118 / (v110 - v109);
          double v120 = fmin(MaxX, v115) - fmax(rect, v44);
          if (v119 <= 0.6)
          {
            if (v119 >= 0.4 && v118 / (v117 - v116) > 0.66 && v120 > v315)
            {
LABEL_74:
              double v315 = v120;
              uint64_t v313 = v50;
            }
          }
          else if (v120 > v315)
          {
            goto LABEL_74;
          }

          ++v50;
        }
        if (v313 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v122 = objc_msgSend_objectAtIndexedSubscript_(v318, v35, v313, v36, v37, v38);
          uint64_t v128 = v122;
          if (v122)
          {
            objc_msgSend_principalLines(v122, v123, v124, v125, v126, v127);
          }
          else
          {
            long long v341 = 0u;
            long long v342 = 0u;
            long long v339 = 0u;
            *(_OWORD *)v340 = 0u;
            *(_OWORD *)uint64_t v337 = 0u;
            long long v338 = 0u;
          }
          sub_1C4B52ADC((double **)v337, (double **)&v351, (uint64_t)&v343);
          if (*((void *)&v341 + 1))
          {
            *(void *)&long long v342 = *((void *)&v341 + 1);
            operator delete(*((void **)&v341 + 1));
          }
          if (v340[0])
          {
            v340[1] = v340[0];
            operator delete(v340[0]);
          }
          if (*((void *)&v338 + 1))
          {
            *(void *)&long long v339 = *((void *)&v338 + 1);
            operator delete(*((void **)&v338 + 1));
          }
          recta = v128;
          if (v337[0])
          {
            v337[1] = v337[0];
            operator delete(v337[0]);
          }
          uint64_t v129 = [CHTokenizedTextResultToken alloc];
          uint64_t v130 = (void *)MEMORY[0x1E4F28D60];
          uint64_t v136 = objc_msgSend_count(v39, v131, v132, v133, v134, v135);
          uint64_t v140 = objc_msgSend_indexSetWithIndexesInRange_(v130, v137, 0, v136, v138, v139);
          uint64_t v146 = objc_msgSend_locale(recta, v141, v142, v143, v144, v145);
          uint64_t v152 = objc_msgSend_count(v39, v147, v148, v149, v150, v151);
          double v153 = *MEMORY[0x1E4F1DB20];
          double v154 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
          double v155 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
          double v156 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
          uint64_t v157 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
          v336[0] = *MEMORY[0x1E4F1DAD8];
          v336[1] = v157;
          v336[2] = v336[0];
          v336[3] = v157;
          v336[4] = v336[0];
          v336[5] = v157;
          v336[6] = v336[0];
          v336[7] = v157;
          v336[8] = v336[0];
          v336[9] = v157;
          v336[10] = v336[0];
          v336[11] = v157;
          v336[12] = v336[0];
          v336[13] = v157;
          v336[14] = v336[0];
          v336[15] = v157;
          uint64_t v317 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v129, v158, (uint64_t)&stru_1F20141C8, (uint64_t)v140, 0, 1, v146, 1, 0.0, 0.0, 0.0, 0.0, v153, v154, v155, v156, v152, *(void *)&v44, *(void *)&rect_24,
                           *(void *)&rect_16,
                           *(void *)&rect_8,
                           v336);

          uint64_t v159 = [CHTransformedTextSegment alloc];
          v358 = v317;
          double v163 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v160, (uint64_t)&v358, 1, v161, v162);
          uint64_t v169 = objc_msgSend_locale(recta, v164, v165, v166, v167, v168);
          uint64_t v175 = objc_msgSend_strokeClassification(recta, v170, v171, v172, v173, v174);
          sub_1C4AAA458(v329, (uint64_t)&v343);
          long long v176 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          v328[0] = *MEMORY[0x1E4F1DAB8];
          v328[1] = v176;
          v328[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
          uint64_t v178 = objc_msgSend_initWithStrokes_tokens_locale_strokeClassification_principalLines_transform_(v159, v177, (uint64_t)v39, (uint64_t)v163, (uint64_t)v169, v175, v329, v328);
          if (v334)
          {
            v335 = v334;
            operator delete(v334);
          }
          if (v332)
          {
            float v333 = v332;
            operator delete(v332);
          }
          if (v330)
          {
            uint64_t v331 = v330;
            operator delete(v330);
          }
          if (v329[0])
          {
            v329[1] = v329[0];
            operator delete(v329[0]);
          }

          uint64_t v179 = (void *)MEMORY[0x1E4F1CA48];
          uint64_t v185 = objc_msgSend_tokens(recta, v180, v181, v182, v183, v184);
          uint64_t v191 = objc_msgSend_count(v185, v186, v187, v188, v189, v190);
          uint64_t v196 = objc_msgSend_arrayWithCapacity_(v179, v192, v191 + 1, v193, v194, v195);

          if (v315 > 0.0)
          {
            long long v326 = 0u;
            long long v327 = 0u;
            long long v324 = 0u;
            long long v325 = 0u;
            uint64_t v202 = objc_msgSend_splitIntoTokens(recta, v197, v198, v199, v200, v201);
            uint64_t v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v202, v203, (uint64_t)&v324, (uint64_t)v357, 16, v204);
            if (!v210)
            {

              goto LABEL_118;
            }
            char v211 = 0;
            uint64_t v212 = *(void *)v325;
            while (2)
            {
              uint64_t v213 = 0;
LABEL_100:
              if (*(void *)v325 != v212) {
                objc_enumerationMutation(v202);
              }
              uint64_t v214 = *(void **)(*((void *)&v324 + 1) + 8 * v213);
              if (v211) {
                goto LABEL_108;
              }
              uint64_t v215 = objc_msgSend_textStrokes(*(void **)(*((void *)&v324 + 1) + 8 * v213), v205, v206, v207, v208, v209);
              objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v216, (uint64_t)v215, v217, v218, v219);
              double v221 = v220;
              CGFloat v223 = v222;
              double v225 = v224;
              CGFloat v227 = v226;

              v363.origin.double x = v221;
              v363.origin.CGFloat y = v223;
              v363.size.double width = v225;
              v363.size.double height = v227;
              double v228 = CGRectGetMaxX(v363);
              v364.origin.double x = v44;
              v364.size.double width = rect_16;
              v364.origin.CGFloat y = rect_24;
              v364.size.double height = rect_8;
              double v229 = (fmin(v228, CGRectGetMaxX(v364)) - fmax(v221, v44)) / v225;
              if (v44 < v221 && v229 <= 0.1)
              {
                objc_msgSend_addObject_(v196, v205, (uint64_t)v178, v207, v208, v209);
                objc_msgSend_addObjectsFromArray_(v314, v230, (uint64_t)v39, v231, v232, v233);
                goto LABEL_108;
              }
              if (v229 >= 0.1) {
LABEL_108:
              }
                char v211 = 1;
              else {
                char v211 = 0;
              }
              double v234 = objc_msgSend_segments(v214, v205, v206, v207, v208, v209);
              objc_msgSend_addObjectsFromArray_(v196, v235, (uint64_t)v234, v236, v237, v238);

              if (v210 == ++v213)
              {
                uint64_t v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v202, v205, (uint64_t)&v324, (uint64_t)v357, 16, v209);
                if (!v210)
                {

                  if (v211) {
                    goto LABEL_119;
                  }
LABEL_118:
                  objc_msgSend_addObject_(v196, v239, (uint64_t)v178, v241, v242, v243);
                  objc_msgSend_addObjectsFromArray_(v314, v279, (uint64_t)v39, v280, v281, v282);
                  goto LABEL_119;
                }
                continue;
              }
              goto LABEL_100;
            }
          }
          uint64_t v244 = objc_msgSend_textStrokes(recta, v197, v198, v199, v200, v201, v315);
          objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v245, (uint64_t)v244, v246, v247, v248);
          double v250 = v249;

          v365.origin.double x = v44;
          v365.size.double width = rect_16;
          v365.origin.CGFloat y = rect_24;
          v365.size.double height = rect_8;
          if (CGRectGetMaxX(v365) >= v250)
          {
            double v270 = objc_msgSend_segments(recta, v251, v252, v253, v254, v255);
            objc_msgSend_addObjectsFromArray_(v196, v271, (uint64_t)v270, v272, v273, v274);

            objc_msgSend_addObject_(v196, v275, (uint64_t)v178, v276, v277, v278);
          }
          else
          {
            objc_msgSend_addObject_(v196, v251, (uint64_t)v178, v253, v254, v255);
            uint64_t v261 = objc_msgSend_segments(recta, v256, v257, v258, v259, v260);
            objc_msgSend_addObjectsFromArray_(v196, v262, (uint64_t)v261, v263, v264, v265);
          }
          objc_msgSend_addObjectsFromArray_(v314, v266, (uint64_t)v39, v267, v268, v269);
LABEL_119:
          unint64_t v283 = objc_msgSend_count(v196, v239, v240, v241, v242, v243);
          uint64_t v289 = objc_msgSend_segments(recta, v284, v285, v286, v287, v288);
          BOOL v295 = v283 > objc_msgSend_count(v289, v290, v291, v292, v293, v294);

          if (v295)
          {
            uint64_t v296 = [CHTransformedTextLine alloc];
            uint64_t v301 = objc_msgSend_initWithSegments_(v296, v297, (uint64_t)v196, v298, v299, v300);
            objc_msgSend_setObject_atIndexedSubscript_(v318, v302, (uint64_t)v301, v313, v303, v304);
          }
          if (v349)
          {
            v350 = v349;
            operator delete(v349);
          }
          if (v347)
          {
            v348 = v347;
            operator delete(v347);
          }
          if (v345)
          {
            float v346 = v345;
            operator delete(v345);
          }
          if (v343)
          {
            uint64_t v344 = v343;
            operator delete(v343);
          }
        }
        if (v351)
        {
          id v352 = v351;
          operator delete(v351);
        }
      }
      uint64_t v311 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v353, (uint64_t)v359, 16, v38);
    }
    while (v311);
  }

  if (a5) {
    *a5 = v314;
  }

  return v318;
}

- (void)assignRemainingStrokes:(id)a3 toTextLines:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v76 = a3;
  id v6 = a4;
  id v7 = objc_opt_class();
  uint64_t v13 = objc_msgSend_nontextStrokeGroups(self->_strokeGroupingResult, v8, v9, v10, v11, v12);
  uint64_t v16 = objc_msgSend__nontextGroupStrokes_remainingStrokes_strokeProvider_(v7, v14, (uint64_t)v13, (uint64_t)v76, (uint64_t)self->_strokeProvider, v15);

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obuint64_t j = v16;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v86, (uint64_t)v91, 16, v18);
  if (v19)
  {
    uint64_t v78 = *(void *)v87;
    do
    {
      uint64_t v79 = v19;
      for (uint64_t i = 0; i != v79; ++i)
      {
        if (*(void *)v87 != v78) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v20, (uint64_t)v25, v21, v22, v23);
        CGFloat v80 = v32;
        CGFloat v81 = v31;
        CGFloat v34 = v33;
        double v36 = v35;
        unint64_t v37 = 0;
        double v38 = v33 * v35 + 1.0e-10;
        double v39 = 0.0;
        uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
        while (v37 < objc_msgSend_count(v6, v26, v27, v28, v29, v30))
        {
          double v41 = objc_msgSend_objectAtIndexedSubscript_(v6, v20, v37, v21, v22, v23);
          uint64_t v47 = objc_msgSend_textStrokes(v41, v42, v43, v44, v45, v46);
          objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v48, (uint64_t)v47, v49, v50, v51);
          CGFloat v53 = v52;
          CGFloat v55 = v54;
          CGFloat v57 = v56;
          double v59 = v58;

          v93.origin.double x = v53;
          v93.origin.CGFloat y = v55;
          v93.size.double width = v57;
          v93.size.double height = v59;
          v95.origin.CGFloat y = v80;
          v95.origin.double x = v81;
          v95.size.double width = v34;
          v95.size.double height = v36;
          CGRect v94 = CGRectIntersection(v93, v95);
          if (v94.size.width * v94.size.height / v38 > v39 && v36 / (v59 + 1.0e-10) < 2.0)
          {
            uint64_t v40 = v37;
            double v39 = v94.size.width * v94.size.height / v38;
          }

          ++v37;
        }
        if (v40 != 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          id v60 = v25;
          uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v82, (uint64_t)v90, 16, v62);
          if (v67)
          {
            uint64_t v68 = *(void *)v83;
            do
            {
              for (uint64_t j = 0; j != v67; ++j)
              {
                if (*(void *)v83 != v68) {
                  objc_enumerationMutation(v60);
                }
                uint64_t v70 = *(void *)(*((void *)&v82 + 1) + 8 * j);
                uint64_t v71 = objc_msgSend_objectAtIndexedSubscript_(v6, v63, v40, v64, v65, v66);
                objc_msgSend_addSupportStroke_(v71, v72, v70, v73, v74, v75);
              }
              uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v63, (uint64_t)&v82, (uint64_t)v90, 16, v66);
            }
            while (v67);
          }
        }
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v86, (uint64_t)v91, 16, v23);
    }
    while (v19);
  }
}

+ (id)checkAvailableInterceptsForString:(id)a3 skipAmbiguousCharacters:(BOOL)a4
{
  uint64_t v203 = *MEMORY[0x1E4F143B8];
  id v182 = a3;
  uint64_t v10 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_componentsSeparatedByCharactersInSet_(v182, v11, (uint64_t)v10, v12, v13, v14);

  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  obuint64_t j = v15;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v197, (uint64_t)v202, 16, v17);
  if (!v23)
  {
    uint64_t v25 = 0;
    uint64_t v196 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    goto LABEL_46;
  }
  uint64_t v24 = *(void *)v198;
  uint64_t v183 = *(void *)v198;
  uint64_t v25 = 0;
  if (!a4)
  {
    uint64_t v196 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    while (1)
    {
      uint64_t v99 = 0;
      uint64_t v189 = v23;
      do
      {
        if (*(void *)v198 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v100 = *(void **)(*((void *)&v197 + 1) + 8 * v99);
        unint64_t v101 = objc_msgSend_countCharacters(v100, v18, v19, v20, v21, v22);
        int hasAscender = objc_msgSend_hasAscender(v100, v102, v103, v104, v105, v106);
        char hasDescender = objc_msgSend_hasDescender(v100, v108, v109, v110, v111, v112);
        unsigned int hasMaxHeightOfXHeight = objc_msgSend_hasMaxHeightOfXHeight(v100, v114, v115, v116, v117, v118);
        if (hasAscender)
        {
          ++v27;
          if (hasDescender) {
            goto LABEL_39;
          }
        }
        else
        {
          if (v101 <= 2) {
            v26 += hasMaxHeightOfXHeight;
          }
          if (hasDescender)
          {
LABEL_39:
            ++v25;
            if (v101 < 3) {
              goto LABEL_29;
            }
            goto LABEL_40;
          }
        }
        if (v101 <= 2)
        {
          ++v196;
          goto LABEL_29;
        }
LABEL_40:
        uint64_t v191 = v99;
        uint64_t v120 = v27;
        uint64_t v121 = v26;
        uint64_t v187 = v25;
        uint64_t v122 = 0;
        unint64_t v193 = v101 - 1;
        uint64_t v195 = v100;
        double v123 = (double)(uint64_t)(v101 - 1);
        uint64_t v124 = 1;
        do
        {
          uint64_t v125 = objc_msgSend_substringWithComposedCharacterRange_(v195, v18, v122 - (v122 != 0), (unint64_t)fmin(v123, (double)(unint64_t)(v122 + 2)) + (v122 != 0) + v124, v21, v22);
          uint64_t v131 = objc_msgSend_countCharacters(v125, v126, v127, v128, v129, v130);
          uint64_t v137 = objc_msgSend_ascendersCount(v125, v132, v133, v134, v135, v136);
          int v143 = objc_msgSend_hasAscender(v125, v138, v139, v140, v141, v142);
          int v149 = objc_msgSend_hasDescender(v125, v144, v145, v146, v147, v148);
          int v155 = objc_msgSend_hasMaxHeightOfXHeight(v125, v150, v151, v152, v153, v154);
          if ((double)(unint64_t)v137 / (double)(unint64_t)v131 >= 0.66) {
            ++v120;
          }

          v121 += v155 & ~v143;
          v196 += v149 ^ 1u;
          ++v122;
          --v124;
        }
        while (v193 != v122);
        uint64_t v25 = v187;
        uint64_t v26 = v121;
        uint64_t v27 = v120;
        uint64_t v24 = v183;
        uint64_t v99 = v191;
LABEL_29:
        ++v99;
      }
      while (v99 != v189);
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v197, (uint64_t)v202, 16, v22);
      if (!v23) {
        goto LABEL_46;
      }
    }
  }
  uint64_t v196 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  do
  {
    uint64_t v28 = 0;
    uint64_t v188 = v23;
    do
    {
      if (*(void *)v198 != v24) {
        objc_enumerationMutation(obj);
      }
      uint64_t v185 = v28;
      uint64_t v29 = *(void **)(*((void *)&v197 + 1) + 8 * v28);
      unint64_t v30 = objc_msgSend_countCharacters(v29, v18, v19, v20, v21, v22);
      char v36 = objc_msgSend_hasAscender(v29, v31, v32, v33, v34, v35);
      char v42 = objc_msgSend_hasDescender(v29, v37, v38, v39, v40, v41);
      unsigned int v48 = objc_msgSend_hasMaxHeightOfXHeight(v29, v43, v44, v45, v46, v47);
      uint64_t v192 = v29;
      int hasAmbiguousCharacter = objc_msgSend_hasAmbiguousCharacter(v29, v49, v50, v51, v52, v53);
      uint64_t v55 = v26 + v48;
      if (v30 > 2) {
        uint64_t v55 = v26;
      }
      if (v36) {
        ++v27;
      }
      else {
        uint64_t v26 = v55;
      }
      if (v42)
      {
        ++v25;
        double v56 = v29;
        if (v30 < 3) {
          goto LABEL_6;
        }
      }
      else
      {
        double v56 = v29;
        if (v30 <= 2)
        {
          v196 += hasAmbiguousCharacter ^ 1u;
          goto LABEL_6;
        }
      }
      uint64_t v194 = v27;
      uint64_t v57 = v26;
      uint64_t v186 = v25;
      uint64_t v58 = 0;
      unint64_t v190 = v30 - 1;
      double v59 = (double)(uint64_t)(v30 - 1);
      uint64_t v60 = 1;
      do
      {
        uint64_t v61 = objc_msgSend_substringWithComposedCharacterRange_(v56, v18, v58 - (v58 != 0), (unint64_t)fmin(v59, (double)(unint64_t)(v58 + 2)) + (v58 != 0) + v60, v21, v22);
        uint64_t v67 = objc_msgSend_countCharacters(v61, v62, v63, v64, v65, v66);
        uint64_t v73 = objc_msgSend_ascendersCount(v61, v68, v69, v70, v71, v72);
        int v79 = objc_msgSend_hasAscender(v61, v74, v75, v76, v77, v78);
        int v85 = objc_msgSend_hasDescender(v61, v80, v81, v82, v83, v84);
        int v91 = objc_msgSend_hasMaxHeightOfXHeight(v61, v86, v87, v88, v89, v90);
        int v97 = objc_msgSend_hasAmbiguousCharacter(v61, v92, v93, v94, v95, v96);
        uint64_t v98 = v194;
        if ((double)(unint64_t)v73 / (double)(unint64_t)v67 >= 0.66) {
          uint64_t v98 = v194 + 1;
        }
        uint64_t v194 = v98;

        v57 += v91 & ~v79;
        v196 += (v85 | v97) ^ 1u;
        ++v58;
        --v60;
        double v56 = v192;
      }
      while (v190 != v58);
      uint64_t v25 = v186;
      uint64_t v26 = v57;
      uint64_t v27 = v194;
      uint64_t v24 = v183;
LABEL_6:
      uint64_t v28 = v185 + 1;
    }
    while (v185 + 1 != v188);
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v197, (uint64_t)v202, 16, v22);
  }
  while (v23);
LABEL_46:
  uint64_t v156 = v25;

  uint64_t v161 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v157, v27, v158, v159, v160);
  v201[0] = v161;
  uint64_t v166 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v162, v26, v163, v164, v165);
  v201[1] = v166;
  uint64_t v171 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v167, v196, v168, v169, v170);
  v201[2] = v171;
  long long v176 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v172, v156, v173, v174, v175);
  v201[3] = v176;
  uint64_t v180 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v177, (uint64_t)v201, 4, v178, v179);

  return v180;
}

+ (id)principalLinePointsForString:(id)a3 skipAmbiguousCharacters:(BOOL)a4 strokes:(id)a5 strokePoints:(const void *)a6 orientation:(double)a7 medianFallbackThreshold:(double)a8
{
  BOOL v299 = a4;
  v310[4] = *MEMORY[0x1E4F143B8];
  id v302 = a3;
  id v300 = a5;
  uint64_t v15 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12, v13, v14);
  v310[0] = v15;
  uint64_t v21 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v16, v17, v18, v19, v20);
  v310[1] = v21;
  uint64_t v27 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v22, v23, v24, v25, v26);
  v310[2] = v27;
  uint64_t v33 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v28, v29, v30, v31, v32);
  v310[3] = v33;
  uint64_t v296 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v34, (uint64_t)v310, 4, v35, v36);

  uint64_t v291 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v37, v38, v39, v40, v41);
  double v42 = tan(a7);
  unint64_t v48 = objc_msgSend_countCharacters(v302, v43, v44, v45, v46, v47);
  uint64_t v307 = 0;
  *(void *)id v308 = 0;
  uint64_t v309 = 0;
  uint64_t v49 = *(void *)a6;
  if (*((void *)a6 + 1) == *(void *)a6)
  {
    double v54 = 1.79769313e308;
    double v55 = -1.79769313e308;
    double v52 = -1.79769313e308;
    double v53 = 1.79769313e308;
    double v56 = -1.79769313e308;
    double v57 = 1.79769313e308;
  }
  else
  {
    uint64_t v50 = 0;
    unint64_t v51 = 0;
    do
    {
      sub_1C4B01DF8((uint64_t)&v307, *(uint64_t *)v308, *(char **)(v49 + v50), *(char **)(v49 + v50 + 8), (uint64_t)(*(void *)(v49 + v50 + 8) - *(void *)(v49 + v50)) >> 4);
      ++v51;
      uint64_t v49 = *(void *)a6;
      v50 += 24;
    }
    while (v51 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a6 + 1) - *(void *)a6) >> 3));
    double v52 = -1.79769313e308;
    double v53 = 1.79769313e308;
    double v54 = 1.79769313e308;
    double v55 = -1.79769313e308;
    double v56 = -1.79769313e308;
    double v57 = 1.79769313e308;
    if (v307 != *(void **)v308)
    {
      double v58 = -1.79769313e308;
      double v59 = 1.79769313e308;
      uint64_t v60 = (double *)v307;
      do
      {
        double v61 = *v60;
        double v62 = v60[1];
        v60 += 2;
        if (v59 > v61)
        {
          double v53 = v61;
          double v59 = v61;
        }
        if (v58 < v61)
        {
          double v52 = v61;
          double v58 = v61;
        }
        if (v57 > v62)
        {
          double v54 = v62;
          double v57 = v62;
        }
        if (v56 < v62)
        {
          double v55 = v62;
          double v56 = v62;
        }
      }
      while (v60 != *(double **)v308);
    }
    if (v42 != 0.0)
    {
      if (v307 == *(void **)v308)
      {
        double v57 = 1.79769313e308;
        double v56 = -1.79769313e308;
      }
      else
      {
        unint64_t v63 = (uint64_t)(*(void *)v308 - (void)v307) >> 4;
        if (v63 <= 1) {
          unint64_t v63 = 1;
        }
        uint64_t v64 = (double *)((char *)v307 + 8);
        double v57 = 1.79769313e308;
        double v56 = -1.79769313e308;
        double v65 = 1.0 / v42;
        do
        {
          double v66 = *v64 - *(v64 - 1) * v65;
          if (v66 <= v57) {
            double v57 = *v64 - *(v64 - 1) * v65;
          }
          if (v66 >= v56) {
            double v56 = *v64 - *(v64 - 1) * v65;
          }
          v64 += 2;
          --v63;
        }
        while (v63);
      }
    }
  }
  double v298 = -v42;
  double v67 = v52;
  double v68 = v55;
  double v69 = v54;
  if (v42 != 0.0)
  {
    double v70 = 1.0 / v42;
    double v71 = v42 + 1.0 / v42;
    if (v57 * v298 >= v56 * v298)
    {
      double v69 = v56 + v53 * v70;
      double v73 = v69 + v42 * v53;
      double v67 = (v73 - v57) / v71;
      double v68 = v73 + v67 * v298;
    }
    else
    {
      double v69 = v57 + v53 * v70;
      double v72 = v69 + v42 * v53;
      double v67 = (v72 - v56) / v71;
      double v68 = v72 + v67 * v298;
    }
  }
  double v297 = fmin(v52 - v53, v55 - v54) / 5.0;
  sub_1C4B48B24(v300, a6, (uint64_t *)&v305, a7, v297, v297, v53, v69, v67, v68);
  uint64_t v81 = (char *)v305;
  if (v306 == v305)
  {
    sub_1C49B7D84(&v305, (char *)v307, *(char **)v308, (uint64_t)(*(void *)v308 - (void)v307) >> 4);
    uint64_t v81 = (char *)v305;
    uint64_t v82 = v306 - (unsigned char *)v305;
    if (v306 != v305) {
      goto LABEL_34;
    }
LABEL_44:
    double v88 = 0.0;
    double v87 = 0.0;
    double v86 = 0.0;
    double v85 = 0.0;
    goto LABEL_45;
  }
  uint64_t v82 = v306 - (unsigned char *)v305;
  if (v306 == v305) {
    goto LABEL_44;
  }
LABEL_34:
  unint64_t v83 = v82 >> 4;
  if (v83 <= 1) {
    unint64_t v83 = 1;
  }
  uint64_t v84 = (double *)(v81 + 8);
  double v85 = 0.0;
  double v79 = -1.79769313e308;
  double v80 = 1.79769313e308;
  double v86 = 0.0;
  double v87 = 0.0;
  double v88 = 0.0;
  do
  {
    double v89 = *(v84 - 1);
    double v90 = *v84 + v89 * v42;
    if (v90 <= v80)
    {
      double v88 = *(v84 - 1);
      double v87 = *v84;
      double v80 = *v84 + v89 * v42;
    }
    if (v90 >= v79)
    {
      double v79 = *v84 + v89 * v42;
      double v86 = *v84;
      double v85 = *(v84 - 1);
    }
    v84 += 2;
    --v83;
  }
  while (v83);
LABEL_45:
  int hasAscender = objc_msgSend_hasAscender(v302, v74, v75, v76, v77, v78, v79, v80);
  int hasDescender = objc_msgSend_hasDescender(v302, v92, v93, v94, v95, v96);
  int hasMaxHeightOfXHeight = objc_msgSend_hasMaxHeightOfXHeight(v302, v98, v99, v100, v101, v102);
  if (v299)
  {
    char hasAmbiguousCharacter = objc_msgSend_hasAmbiguousCharacter(v302, v103, v104, v105, v106, v107);
    double v110 = v86 + v85 * v42;
    double v111 = v87 + v88 * v42;
    if ((hasDescender & hasAscender) != 1) {
      goto LABEL_47;
    }
LABEL_51:
    uint64_t v113 = (uint64_t)v111;
    double v116 = ceil((v110 - v111) * 0.125);
    uint64_t v112 = (uint64_t)(v111 + v116 + 1.0);
    uint64_t v114 = (uint64_t)(v110 - v116);
    uint64_t v115 = (uint64_t)(v110 + 1.0);
    if (!hasAscender) {
      goto LABEL_52;
    }
    goto LABEL_59;
  }
  char hasAmbiguousCharacter = 0;
  double v110 = v86 + v85 * v42;
  double v111 = v87 + v88 * v42;
  if ((hasDescender & hasAscender) == 1) {
    goto LABEL_51;
  }
LABEL_47:
  if (hasDescender)
  {
    uint64_t v112 = 0;
    uint64_t v113 = 0;
    uint64_t v114 = (uint64_t)(v110 - ceil((v110 - v111) * 0.25));
    uint64_t v115 = (uint64_t)(v110 + 1.0);
    if (!hasAscender)
    {
LABEL_52:
      if (v48 < 3) {
        int v117 = hasMaxHeightOfXHeight;
      }
      else {
        int v117 = 0;
      }
      if (v117 != 1) {
        goto LABEL_66;
      }
      goto LABEL_64;
    }
LABEL_59:
    uint64_t v118 = objc_msgSend_objectAtIndexedSubscript_(v296, v103, 0, v105, v106, v107);
    v312.double x = v88;
    v312.CGFloat y = v87;
    uint64_t v124 = pointToString(v312, (uint64_t)v118, v119, v120, v121, v122, v123);
    objc_msgSend_addObject_(v118, v125, (uint64_t)v124, v126, v127, v128);
LABEL_65:

    goto LABEL_66;
  }
  uint64_t v114 = 0;
  uint64_t v115 = 0;
  if (hasAscender)
  {
    uint64_t v113 = (uint64_t)v111;
    uint64_t v112 = (uint64_t)(v111 + ceil((v110 - v111) * 0.25) + 1.0);
    goto LABEL_59;
  }
  uint64_t v113 = 0;
  uint64_t v112 = 0;
  if (v48 < 3) {
    int v129 = hasMaxHeightOfXHeight;
  }
  else {
    int v129 = 0;
  }
  if (v129 == 1)
  {
LABEL_64:
    uint64_t v118 = objc_msgSend_objectAtIndexedSubscript_(v296, v103, 1, v105, v106, v107);
    v313.double x = v88;
    v313.CGFloat y = v87;
    uint64_t v124 = pointToString(v313, (uint64_t)v118, v130, v131, v132, v133, v134);
    objc_msgSend_addObject_(v118, v135, (uint64_t)v124, v136, v137, v138);
    goto LABEL_65;
  }
LABEL_66:
  if (hasDescender)
  {
    uint64_t v139 = objc_msgSend_objectAtIndexedSubscript_(v296, v103, 3, v105, v106, v107);
    v314.double x = v85;
    v314.CGFloat y = v86;
    uint64_t v145 = pointToString(v314, (uint64_t)v139, v140, v141, v142, v143, v144);
    objc_msgSend_addObject_(v139, v146, (uint64_t)v145, v147, v148, v149);
  }
  else
  {
    if (v48 > 2) {
      char v150 = 1;
    }
    else {
      char v150 = hasAmbiguousCharacter;
    }
    if ((v150 & 1) == 0)
    {
      uint64_t v258 = objc_msgSend_objectAtIndexedSubscript_(v296, v103, 2, v105, v106, v107);
      v319.double x = v85;
      v319.CGFloat y = v86;
      uint64_t v264 = pointToString(v319, (uint64_t)v258, v259, v260, v261, v262, v263);
      objc_msgSend_addObject_(v258, v265, (uint64_t)v264, v266, v267, v268);

      goto LABEL_120;
    }
  }
  if (v48 >= 3)
  {
    uint64_t v151 = v113;
    unint64_t v152 = 0;
    double v153 = v69 + v53 * v42;
    double v154 = (v67 - v53) / (double)(uint64_t)v48;
    unint64_t v293 = v48 - 1;
    double v295 = (double)(uint64_t)(v48 - 1);
    double v289 = (double)v112;
    double v290 = (double)v151;
    unint64_t v294 = v48 - 2;
    double v287 = (double)v115;
    double v288 = (double)v114;
    while (1)
    {
      uint64_t v158 = (void *)MEMORY[0x1C8786C20]();
      if (v152) {
        uint64_t v159 = v152 - 1;
      }
      else {
        uint64_t v159 = 0;
      }
      uint64_t v160 = objc_msgSend_substringWithComposedCharacterRange_(v302, v155, v159, (unint64_t)fmin(v295, (double)(v152 + 2)) - v159 + 1, v156, v157);
      uint64_t v166 = objc_msgSend_countCharacters(v160, v161, v162, v163, v164, v165);
      uint64_t v172 = objc_msgSend_ascendersCount(v160, v167, v168, v169, v170, v171);
      int v178 = objc_msgSend_hasAscender(v160, v173, v174, v175, v176, v177);
      int v184 = objc_msgSend_hasDescender(v160, v179, v180, v181, v182, v183);
      int v195 = objc_msgSend_hasMaxHeightOfXHeight(v160, v185, v186, v187, v188, v189);
      if (v299) {
        int v196 = objc_msgSend_hasAmbiguousCharacter(v160, v190, v191, v192, v193, v194);
      }
      else {
        int v196 = 0;
      }
      double v197 = (double)v152 + 0.05;
      if (!v152) {
        double v197 = 0.0;
      }
      BOOL v198 = v152 == v294 || v152 == 0;
      double v199 = v53 + v197 * v154;
      double v200 = 1.9;
      if (v198) {
        double v200 = 1.95;
      }
      sub_1C4B48B24(v300, a6, (uint64_t *)&__p, a7, v297, v297, v199, v153 + v199 * v298, v199 + v154 * v200, v153 + (v199 + v154 * v200) * v298);
      uint64_t v206 = v304;
      if (v304 == __p) {
        goto LABEL_115;
      }
      unint64_t v207 = ((unsigned char *)v304 - (unsigned char *)__p) >> 4;
      if (v207 <= 1) {
        unint64_t v207 = 1;
      }
      uint64_t v208 = (double *)((char *)__p + 8);
      double v209 = 0.0;
      double v210 = -1.79769313e308;
      double v211 = 1.79769313e308;
      double v212 = 0.0;
      double v213 = 0.0;
      double v214 = 0.0;
      do
      {
        double v215 = *(v208 - 1);
        double v216 = *v208 + v215 * v42;
        if (v216 <= v211)
        {
          double v214 = *(v208 - 1);
          double v213 = *v208;
          double v211 = *v208 + v215 * v42;
        }
        if (v216 >= v210)
        {
          double v210 = *v208 + v215 * v42;
          double v212 = *v208;
          double v209 = *(v208 - 1);
        }
        v208 += 2;
        --v207;
      }
      while (v207);
      if ((double)(unint64_t)v172 / (double)(unint64_t)v166 >= 0.66)
      {
        uint64_t v217 = objc_msgSend_objectAtIndexedSubscript_(v296, v201, 0, v203, v204, v205);
        v315.double x = v214;
        v315.CGFloat y = v213;
        CGFloat v223 = pointToString(v315, (uint64_t)v217, v218, v219, v220, v221, v222);
        objc_msgSend_addObject_(v217, v224, (uint64_t)v223, v225, v226, v227);
      }
      double v228 = v213 + v214 * v42;
      if (((v178 | v195 ^ 1) & 1) == 0 && (v228 < v290 || v228 >= v289)) {
        break;
      }
      if (a8 != 0.0 && v228 > a8)
      {
        v317.double x = v214;
        v317.CGFloat y = v213;
        double v230 = pointToString(v317, (uint64_t)v206, v201, v202, v203, v204, v205);
        objc_msgSend_addObject_(v291, v241, (uint64_t)v230, v242, v243, v244);
        goto LABEL_107;
      }
LABEL_108:
      if (((v184 | v196) & 1) == 0)
      {
        double v245 = v212 + v209 * v42;
        if (v245 < v288 || v245 >= v287)
        {
          uint64_t v247 = objc_msgSend_objectAtIndexedSubscript_(v296, v201, 2, v203, v204, v205);
          v318.double x = v209;
          v318.CGFloat y = v212;
          uint64_t v253 = pointToString(v318, (uint64_t)v247, v248, v249, v250, v251, v252);
          objc_msgSend_addObject_(v247, v254, (uint64_t)v253, v255, v256, v257);
        }
      }
      uint64_t v206 = __p;
LABEL_115:
      if (v206)
      {
        uint64_t v304 = v206;
        operator delete(v206);
      }

      if (++v152 == v293) {
        goto LABEL_120;
      }
    }
    double v230 = objc_msgSend_objectAtIndexedSubscript_(v296, v201, 1, v203, v204, v205);
    v316.double x = v214;
    v316.CGFloat y = v213;
    uint64_t v236 = pointToString(v316, (uint64_t)v230, v231, v232, v233, v234, v235);
    objc_msgSend_addObject_(v230, v237, (uint64_t)v236, v238, v239, v240);

LABEL_107:
    goto LABEL_108;
  }
LABEL_120:
  uint64_t v269 = objc_msgSend_objectAtIndexedSubscript_(v296, v103, 1, v105, v106, v107);
  BOOL v275 = objc_msgSend_count(v269, v270, v271, v272, v273, v274) == 0;

  if (v275)
  {
    uint64_t v280 = objc_msgSend_objectAtIndexedSubscript_(v296, v276, 1, v277, v278, v279);
    objc_msgSend_addObjectsFromArray_(v280, v281, (uint64_t)v291, v282, v283, v284);
  }
  id v285 = v296;
  if (v305)
  {
    id v306 = v305;
    operator delete(v305);
  }
  if (v307)
  {
    *(void *)id v308 = v307;
    operator delete(v307);
  }

  return v285;
}

+ (id)principalLineInterceptsForString:(id)a3 skipAmbiguousCharacters:(BOOL)a4 strokes:(id)a5 strokePoints:(const void *)a6 orientation:(double)a7 medianFallbackThreshold:(double)a8
{
  BOOL v12 = a4;
  v91[4] = *MEMORY[0x1E4F143B8];
  id v81 = a3;
  id v82 = a5;
  uint64_t v18 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v13, v14, v15, v16, v17);
  v91[0] = v18;
  uint64_t v24 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v19, v20, v21, v22, v23);
  v91[1] = v24;
  uint64_t v30 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v25, v26, v27, v28, v29);
  v91[2] = v30;
  uint64_t v36 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v31, v32, v33, v34, v35);
  v91[3] = v36;
  uint64_t v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v37, (uint64_t)v91, 4, v38, v39);

  double v41 = tan(a7);
  double v42 = objc_opt_class();
  unint64_t v83 = objc_msgSend_principalLinePointsForString_skipAmbiguousCharacters_strokes_strokePoints_orientation_medianFallbackThreshold_(v42, v43, (uint64_t)v81, v12, (uint64_t)v82, (uint64_t)a6, a7, a8);
  unint64_t v49 = 0;
  uint64_t v50 = (double *)MEMORY[0x1E4F1DAD8];
LABEL_2:
  if (v49 < objc_msgSend_count(v83, v44, v45, v46, v47, v48))
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    double v55 = objc_msgSend_objectAtIndexedSubscript_(v83, v51, v49, v52, v53, v54);
    uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v84, (uint64_t)v90, 16, v57);
    if (!v58) {
      goto LABEL_14;
    }
    uint64_t v59 = *(void *)v85;
    while (1)
    {
      for (uint64_t i = 0; i != v58; ++i)
      {
        if (*(void *)v85 != v59) {
          objc_enumerationMutation(v55);
        }
        parseFloatsFromString(*(NSString **)(*((void *)&v84 + 1) + 8 * i), (char **)&v88);
        if ((char *)v89 - (char *)v88 == 8)
        {
          double v65 = *v88;
          double v66 = v88[1];
        }
        else
        {
          double v65 = *v50;
          double v66 = v50[1];
          if (!v88) {
            goto LABEL_12;
          }
        }
        double v89 = v88;
        operator delete(v88);
LABEL_12:
        double v67 = objc_msgSend_objectAtIndexedSubscript_(v40, v61, v49, v62, v63, v64);
        double v73 = objc_msgSend_numberWithDouble_(NSNumber, v68, v69, v70, v71, v72, v66 + v65 * v41);
        objc_msgSend_addObject_(v67, v74, (uint64_t)v73, v75, v76, v77);
      }
      uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v78, (uint64_t)&v84, (uint64_t)v90, 16, v79);
      if (!v58)
      {
LABEL_14:

        ++v49;
        goto LABEL_2;
      }
    }
  }

  return v40;
}

+ (PrincipalLines)fixPrincipalLinesPosition:(SEL)a3 useAltString:(id)a4 skipAmbiguousCharacters:(BOOL)a5
{
  BOOL v422 = a6;
  BOOL v6 = a5;
  uint64_t v447 = *MEMORY[0x1E4F143B8];
  id v417 = a4;
  uint64_t v7 = objc_opt_class();
  uint64_t v13 = objc_msgSend_string(v417, v8, v9, v10, v11, v12);
  objc_msgSend_stringForRendering_useAltChars_((void *)v7, v14, (uint64_t)v13, v6, v15, v16);
  v418 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_ch_smallCharacterSet(MEMORY[0x1E4F28B88], v17, v18, v19, v20, v21);
  uint64_t v22 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = isStringEntirelyFromSet(v418, v22);

  if ((v7 & 1) != 0 || !objc_msgSend_length(v418, v23, v24, v25, v26, v27))
  {
    if (v417)
    {
      objc_msgSend_principalLines(v417, v23, v24, v25, v26, v27);
    }
    else
    {
      *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
      *(_OWORD *)&retstr->top.__end_ = 0u;
      *(_OWORD *)&retstr->base.__end_ = 0u;
      *(_OWORD *)&retstr->median.__begin_ = 0u;
      *(_OWORD *)&retstr->descender.__begin_ = 0u;
      *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
    }
    goto LABEL_90;
  }
  objc_msgSend_orientation(v417, v23, v24, v25, v26, v27);
  double v34 = tan(v28);
  if (!v417)
  {
    *(_OWORD *)v444 = 0u;
    long long v445 = 0u;
    long long v442 = 0u;
    *(_OWORD *)uint64_t v443 = 0u;
    *(_OWORD *)v440 = 0u;
    *(_OWORD *)uint64_t v441 = 0u;
    goto LABEL_25;
  }
  double v35 = v34;
  objc_msgSend_principalLines(v417, v29, v30, v31, v32, v33);
  objc_msgSend_points(v417, v36, v37, v38, v39, v40);
  uint64_t v41 = v427 - (unsigned char *)__p;
  if (v427 == __p)
  {
    if (!v427) {
      goto LABEL_25;
    }
    double v44 = 1.79769313e308;
    double v45 = -1.79769313e308;
  }
  else
  {
    uint64_t v42 = v41 >> 4;
    if ((unint64_t)(v41 >> 4) <= 1) {
      uint64_t v42 = 1;
    }
    uint64_t v43 = (double *)((char *)__p + 8);
    double v44 = 1.79769313e308;
    double v45 = -1.79769313e308;
    do
    {
      double v46 = *v43 + *(v43 - 1) * v35;
      if (v46 <= v44) {
        double v44 = *v43 + *(v43 - 1) * v35;
      }
      if (v46 >= v45) {
        double v45 = *v43 + *(v43 - 1) * v35;
      }
      v43 += 2;
      --v42;
    }
    while (v42);
  }
  uint64_t v427 = (char *)__p;
  operator delete(__p);
  if (v44 != 1.79769313e308 && v45 != -1.79769313e308)
  {
    uint64_t v421 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v29, v30, v31, v32, v33);
    v424 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v48, v49, v50, v51, v52);
    uint64_t v419 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v53, v54, v55, v56, v57);
    uint64_t v420 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v58, v59, v60, v61, v62);
    double v68 = objc_msgSend_numberWithDouble_(NSNumber, v63, v64, v65, v66, v67, *((double *)v444[1] + 1) + *(double *)v444[1] * v35);
    objc_msgSend_addObject_(v421, v69, (uint64_t)v68, v70, v71, v72);

    uint64_t v78 = objc_msgSend_numberWithDouble_(NSNumber, v73, v74, v75, v76, v77, fmax(v44, *((double *)v443[0] + 1) + *(double *)v443[0] * v35));
    objc_msgSend_addObject_(v424, v79, (uint64_t)v78, v80, v81, v82);

    double v88 = objc_msgSend_numberWithDouble_(NSNumber, v83, v84, v85, v86, v87, fmin(v45, *((double *)v441[1] + 1) + *(double *)v441[1] * v35));
    objc_msgSend_addObject_(v419, v89, (uint64_t)v88, v90, v91, v92);

    uint64_t v98 = objc_msgSend_numberWithDouble_(NSNumber, v93, v94, v95, v96, v97, *((double *)v440[0] + 1) + *(double *)v440[0] * v35);
    objc_msgSend_addObject_(v420, v99, (uint64_t)v98, v100, v101, v102);

    uint64_t v108 = objc_msgSend_splitIntoTokens(v417, v103, v104, v105, v106, v107);
    long long v438 = 0u;
    long long v439 = 0u;
    long long v436 = 0u;
    long long v437 = 0u;
    obuint64_t j = v108;
    uint64_t v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v109, (uint64_t)&v436, (uint64_t)v446, 16, v110);
    uint64_t v112 = v111;
    if (v111)
    {
      uint64_t v113 = *(void *)v437;
      do
      {
        uint64_t v114 = 0;
        do
        {
          if (*(void *)v437 != v113) {
            objc_enumerationMutation(obj);
          }
          uint64_t v115 = *(void **)(*((void *)&v436 + 1) + 8 * v114);
          double v116 = objc_opt_class();
          uint64_t v122 = objc_msgSend_string(v115, v117, v118, v119, v120, v121);
          uint64_t v126 = objc_msgSend_stringForRendering_useAltChars_(v116, v123, (uint64_t)v122, v6, v124, v125);

          uint64_t v132 = objc_msgSend_ch_smallCharacterSet(MEMORY[0x1E4F28B88], v127, v128, v129, v130, v131);
          uint64_t v137 = objc_msgSend_indexesOfCharacters_(v126, v133, (uint64_t)v132, v134, v135, v136);
          uint64_t v143 = objc_msgSend_count(v137, v138, v139, v140, v141, v142);
          LOBYTE(v143) = v143 == objc_msgSend_length(v126, v144, v145, v146, v147, v148);

          if ((v143 & 1) == 0 && v115)
          {
            objc_msgSend_points(v115, v149, v150, v151, v152, v153);
            double v154 = (char *)__p;
            int v155 = v427;
            if (__p)
            {
              uint64_t v427 = (char *)__p;
              operator delete(__p);
            }
            if (v155 != v154)
            {
              uint64_t v156 = objc_opt_class();
              uint64_t v162 = objc_msgSend_textStrokes(v115, v157, v158, v159, v160, v161);
              objc_msgSend_strokePoints(v115, v163, v164, v165, v166, v167);
              objc_msgSend_orientation(v115, v168, v169, v170, v171, v172);
              double v174 = v173;
              uint64_t v180 = objc_msgSend_firstObject(v424, v175, v176, v177, v178, v179);
              objc_msgSend_floatValue(v180, v181, v182, v183, v184, v185);
              uint64_t v188 = objc_msgSend_principalLineInterceptsForString_skipAmbiguousCharacters_strokes_strokePoints_orientation_medianFallbackThreshold_(v156, v187, (uint64_t)v126, v422, (uint64_t)v162, (uint64_t)&__p, v174, v186);

              uint64_t v189 = (char *)__p;
              if (__p)
              {
                unint64_t v190 = v427;
                uint64_t v191 = __p;
                if (v427 != __p)
                {
                  uint64_t v192 = v427;
                  do
                  {
                    uint64_t v194 = (void *)*((void *)v192 - 3);
                    v192 -= 24;
                    uint64_t v193 = v194;
                    if (v194)
                    {
                      *((void *)v190 - 2) = v193;
                      operator delete(v193);
                    }
                    unint64_t v190 = v192;
                  }
                  while (v192 != v189);
                  uint64_t v191 = __p;
                }
                uint64_t v427 = v189;
                operator delete(v191);
              }

              double v199 = objc_msgSend_objectAtIndexedSubscript_(v188, v195, 0, v196, v197, v198);
              objc_msgSend_addObjectsFromArray_(v421, v200, (uint64_t)v199, v201, v202, v203);

              uint64_t v208 = objc_msgSend_objectAtIndexedSubscript_(v188, v204, 1, v205, v206, v207);
              objc_msgSend_addObjectsFromArray_(v424, v209, (uint64_t)v208, v210, v211, v212);

              uint64_t v217 = objc_msgSend_objectAtIndexedSubscript_(v188, v213, 2, v214, v215, v216);
              objc_msgSend_addObjectsFromArray_(v419, v218, (uint64_t)v217, v219, v220, v221);

              uint64_t v226 = objc_msgSend_objectAtIndexedSubscript_(v188, v222, 3, v223, v224, v225);
              objc_msgSend_addObjectsFromArray_(v420, v227, (uint64_t)v226, v228, v229, v230);

              uint64_t v235 = objc_msgSend_objectAtIndexedSubscript_(v188, v231, 0, v232, v233, v234);
              v434[0] = MEMORY[0x1E4F143A8];
              v434[1] = 3221225472;
              v434[2] = sub_1C4AFA1B8;
              v434[3] = &unk_1E64E3AA8;
              id v236 = v424;
              id v435 = v236;
              uint64_t v241 = objc_msgSend_indexesOfObjectsPassingTest_(v235, v237, (uint64_t)v434, v238, v239, v240);

              uint64_t v246 = objc_msgSend_objectAtIndexedSubscript_(v188, v242, 0, v243, v244, v245);
              uint64_t v251 = objc_msgSend_objectsAtIndexes_(v246, v247, (uint64_t)v241, v248, v249, v250);
              objc_msgSend_addObjectsFromArray_(v236, v252, (uint64_t)v251, v253, v254, v255);
            }
          }

          ++v114;
        }
        while (v114 != v112);
        uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v256, (uint64_t)&v436, (uint64_t)v446, 16, v257);
      }
      while (v112);
    }

    if ((unint64_t)objc_msgSend_count(v421, v258, v259, v260, v261, v262) >= 2) {
      objc_msgSend_removeObjectAtIndex_(v421, v263, 0, v265, v266, v267);
    }
    if ((unint64_t)objc_msgSend_count(v420, v263, v264, v265, v266, v267, retstr) >= 2) {
      objc_msgSend_removeObjectAtIndex_(v420, v268, 0, v269, v270, v271);
    }
    uint64_t v272 = objc_msgSend_valueForKeyPath_(v421, v268, @"@avg.floatValue", v269, v270, v271);
    objc_msgSend_floatValue(v272, v273, v274, v275, v276, v277);
    float v279 = v278;

    uint64_t v284 = objc_msgSend_valueForKeyPath_(v424, v280, @"@avg.floatValue", v281, v282, v283);
    objc_msgSend_floatValue(v284, v285, v286, v287, v288, v289);
    float v291 = v290;

    uint64_t v296 = objc_msgSend_valueForKeyPath_(v419, v292, @"@avg.floatValue", v293, v294, v295);
    objc_msgSend_floatValue(v296, v297, v298, v299, v300, v301);
    float v303 = v302;

    id v308 = objc_msgSend_valueForKeyPath_(v420, v304, @"@avg.floatValue", v305, v306, v307);
    objc_msgSend_floatValue(v308, v309, v310, v311, v312, v313);
    float v315 = v314;

    double v326 = v279;
    double v327 = v291;
    if (objc_msgSend_count(v421, v316, v317, v318, v319, v320) == 1
      && (unint64_t)objc_msgSend_count(v424, v321, v322, v323, v324, v325) >= 2)
    {
      uint64_t v328 = objc_msgSend_firstObject(v424, v321, v322, v323, v324, v325);
      objc_msgSend_floatValue(v328, v329, v330, v331, v332, v333);
      float v335 = v334;
      long long v341 = objc_msgSend_firstObject(v421, v336, v337, v338, v339, v340);
      objc_msgSend_floatValue(v341, v342, v343, v344, v345, v346);
      float v348 = v347;

      double v326 = v327 - (float)(v335 - v348);
    }
    double v354 = v303;
    double v355 = v315;
    if (objc_msgSend_count(v420, v321, v322, v323, v324, v325) == 1
      && (unint64_t)objc_msgSend_count(v419, v349, v350, v351, v352, v353) >= 2)
    {
      uint64_t v361 = objc_msgSend_firstObject(v420, v356, v357, v358, v359, v360);
      objc_msgSend_floatValue(v361, v362, v363, v364, v365, v366);
      float v368 = v367;
      long long v374 = objc_msgSend_firstObject(v419, v369, v370, v371, v372, v373);
      objc_msgSend_floatValue(v374, v375, v376, v377, v378, v379);
      float v381 = v380;

      double v355 = v354 + (float)(v368 - v381);
    }
    double v382 = (v354 - v327) * 0.5;
    if (v326 <= v327) {
      double v383 = v326;
    }
    else {
      double v383 = v327 - v382;
    }
    double v384 = v382 + v354;
    if (v355 < v354) {
      double v355 = v384;
    }
    double v385 = vabdd_f64(v355, v383);
    double v386 = vabdd_f64(v354, v327);
    if (v386 / v385 < 0.15)
    {
      double v387 = -(v386 - v385 * 0.15) * 0.5;
      if (v303 > v291 || v35 == 0.0)
      {
        double v354 = v387 + v354;
        double v327 = v327 - v387;
      }
      else
      {
        double v354 = v354 - v387;
        double v327 = v387 + v327;
      }
    }
    *(_OWORD *)(*(void *)v416 + 64) = 0u;
    *(_OWORD *)(*(void *)v416 + 80) = 0u;
    *(_OWORD *)(*(void *)v416 + 32) = 0u;
    *(_OWORD *)(*(void *)v416 + 48) = 0u;
    **(_OWORD **)uint64_t v416 = 0u;
    *(_OWORD *)(*(void *)v416 + 16) = 0u;
    v388 = (double *)v444[1];
    double v389 = *(double *)v444[1];
    uint64_t v390 = (double *)operator new(0x10uLL);
    double v391 = -v35;
    *uint64_t v390 = v389;
    v390[1] = v383 + v389 * v391;
    double v392 = v388[2];
    uint64_t v393 = operator new(0x20uLL);
    *((double *)v393 + 2) = v392;
    *((double *)v393 + 3) = v383 + v392 * v391;
    *(_OWORD *)uint64_t v393 = *(_OWORD *)v390;
    operator delete(v390);
    sub_1C49B7D84((void *)(*(void *)v416 + 72), (char *)v393, (char *)v393 + 32, 2uLL);
    v394 = (double *)v443[0];
    double v395 = *(double *)v443[0];
    v396 = (double *)operator new(0x10uLL);
    double *v396 = v395;
    v396[1] = v327 + v395 * v391;
    double v397 = v394[2];
    uint64_t v398 = operator new(0x20uLL);
    *((double *)v398 + 2) = v397;
    *((double *)v398 + 3) = v327 + v397 * v391;
    *(_OWORD *)uint64_t v398 = *(_OWORD *)v396;
    operator delete(v396);
    sub_1C49B7D84((void *)(*(void *)v416 + 48), (char *)v398, (char *)v398 + 32, 2uLL);
    uint64_t v399 = (double *)v441[1];
    double v400 = *(double *)v441[1];
    v401 = (double *)operator new(0x10uLL);
    double *v401 = v400;
    v401[1] = v354 + v400 * v391;
    double v402 = v399[2];
    v403 = operator new(0x20uLL);
    *((double *)v403 + 2) = v402;
    *((double *)v403 + 3) = v354 + v402 * v391;
    *(_OWORD *)v403 = *(_OWORD *)v401;
    operator delete(v401);
    sub_1C49B7D84((void *)(*(void *)v416 + 24), (char *)v403, (char *)v403 + 32, 2uLL);
    uint64_t v404 = (double *)v440[0];
    double v405 = *(double *)v440[0];
    uint64_t v406 = (double *)operator new(0x10uLL);
    *uint64_t v406 = v405;
    v406[1] = v355 + v405 * v391;
    double v407 = v404[2];
    uint64_t v408 = operator new(0x20uLL);
    *((double *)v408 + 2) = v407;
    *((double *)v408 + 3) = v355 + v407 * v391;
    *(_OWORD *)uint64_t v408 = *(_OWORD *)v406;
    operator delete(v406);
    sub_1C49B7D84(*(void **)v416, (char *)v408, (char *)v408 + 32, 2uLL);
    objc_msgSend_points(v417, v409, v410, v411, v412, v413);
    sub_1C4B52ADC(*(double ***)v416, (double **)v425, (uint64_t)&__p);
    if (&__p != *(void ***)v416)
    {
      sub_1C49B7D84(*(void **)v416, (char *)__p, v427, (v427 - (unsigned char *)__p) >> 4);
      sub_1C49B7D84((void *)(*(void *)v416 + 24), (char *)v428, v429, (v429 - (unsigned char *)v428) >> 4);
      sub_1C49B7D84((void *)(*(void *)v416 + 48), (char *)v430, v431, (v431 - (unsigned char *)v430) >> 4);
      sub_1C49B7D84((void *)(*(void *)v416 + 72), (char *)v432, v433, (v433 - (unsigned char *)v432) >> 4);
    }
    if (v432)
    {
      v433 = (char *)v432;
      operator delete(v432);
    }
    if (v430)
    {
      v431 = (char *)v430;
      operator delete(v430);
    }
    if (v428)
    {
      uint64_t v429 = (char *)v428;
      operator delete(v428);
    }
    if (__p)
    {
      uint64_t v427 = (char *)__p;
      operator delete(__p);
    }
    if (v425[0])
    {
      v425[1] = v425[0];
      operator delete(v425[0]);
    }
    operator delete(v408);
    operator delete(v403);
    operator delete(v398);
    operator delete(v393);

    goto LABEL_82;
  }
LABEL_25:
  if (v417)
  {
    objc_msgSend_principalLines(v417, v29, v30, v31, v32, v33);
  }
  else
  {
    *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->top.__end_ = 0u;
    *(_OWORD *)&retstr->base.__end_ = 0u;
    *(_OWORD *)&retstr->median.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
  }
LABEL_82:
  if (v444[1])
  {
    *(void **)&long long v445 = v444[1];
    operator delete(v444[1]);
  }
  if (v443[0])
  {
    v443[1] = v443[0];
    operator delete(v443[0]);
  }
  if (v441[1])
  {
    *(void **)&long long v442 = v441[1];
    operator delete(v441[1]);
  }
  if (v440[0])
  {
    v440[1] = v440[0];
    operator delete(v440[0]);
  }
LABEL_90:

  return result;
}

+ (PrincipalLines)fixPrincipalLinesOrientation:(SEL)a3 useAltString:(id)a4 skipAmbiguousCharacters:(BOOL)a5
{
  BOOL v364 = a6;
  BOOL v367 = a5;
  uint64_t v393 = *MEMORY[0x1E4F143B8];
  id v360 = a4;
  uint64_t v6 = objc_opt_class();
  uint64_t v12 = objc_msgSend_string(v360, v7, v8, v9, v10, v11);
  objc_msgSend_stringForRendering_useAltChars_((void *)v6, v13, (uint64_t)v12, v367, v14, v15);
  uint64_t v359 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_ch_smallCharacterSet(MEMORY[0x1E4F28B88], v16, v17, v18, v19, v20);
  uint64_t v21 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = isStringEntirelyFromSet(v359, v21);

  if ((v6 & 1) != 0 || !objc_msgSend_length(v359, v22, v23, v24, v25, v26))
  {
    if (v360)
    {
      objc_msgSend_principalLines(v360, v22, v23, v24, v25, v26);
    }
    else
    {
      *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
      *(_OWORD *)&retstr->top.__end_ = 0u;
      *(_OWORD *)&retstr->base.__end_ = 0u;
      *(_OWORD *)&retstr->median.__begin_ = 0u;
      *(_OWORD *)&retstr->descender.__begin_ = 0u;
      *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
    }
    goto LABEL_170;
  }
  objc_msgSend_orientation(v360, v22, v23, v24, v25, v26);
  double v28 = v27;
  objc_msgSend_orientation(v360, v29, v30, v31, v32, v33);
  double v40 = tan(v34);
  if (v360)
  {
    objc_msgSend_principalLines(v360, v35, v36, v37, v38, v39);
  }
  else
  {
    *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->top.__end_ = 0u;
    *(_OWORD *)&retstr->base.__end_ = 0u;
    *(_OWORD *)&retstr->median.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
  }
  CGRect v362 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v35, v36, v37, v38, v39);
  uint64_t v366 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v41, v42, v43, v44, v45);
  uint64_t v363 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v46, v47, v48, v49, v50);
  if (v360)
  {
    objc_msgSend_points(v360, v51, v52, v53, v54, v55);
    int64_t v56 = (char *)__p[1] - (char *)__p[0];
    if (__p[1] != __p[0])
    {
      uint64_t v57 = v56 >> 4;
      if ((unint64_t)(v56 >> 4) <= 1) {
        uint64_t v57 = 1;
      }
      uint64_t v58 = (double *)((char *)__p[0] + 8);
      double v59 = 0.0;
      double v60 = 1.79769313e308;
      double v61 = 0.0;
      do
      {
        double v62 = *(v58 - 1);
        if (*v58 + v62 * v40 <= v60)
        {
          double v61 = *(v58 - 1);
          double v59 = *v58;
          double v60 = *v58 + v62 * v40;
        }
        v58 += 2;
        --v57;
      }
      while (v57);
      goto LABEL_20;
    }
    double v59 = 0.0;
    double v61 = 0.0;
    double v63 = 0.0;
    if (__p[1])
    {
LABEL_20:
      __p[1] = __p[0];
      operator delete(__p[0]);
      double v63 = v61;
    }
  }
  else
  {
    double v59 = 0.0;
    double v63 = 0.0;
  }
  begin = retstr->median.__begin_;
  p_median = &retstr->median;
  double x = begin->x;
  double y = begin->y;
  uint64_t v67 = objc_msgSend_splitIntoTokens(v360, v51, v52, v53, v54, v55);
  long long v390 = 0u;
  long long v391 = 0u;
  long long v388 = 0u;
  long long v389 = 0u;
  obuint64_t j = v67;
  unint64_t v70 = 0;
  unint64_t v71 = 0;
  uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v68, (uint64_t)&v388, (uint64_t)v392, 16, v69);
  if (!v72) {
    goto LABEL_45;
  }
  double v73 = -v40;
  double v74 = fmax(v59 + v63 * v40, y + x * v40);
  uint64_t v75 = *(void *)v389;
  do
  {
    for (uint64_t i = 0; i != v72; ++i)
    {
      if (*(void *)v389 != v75) {
        objc_enumerationMutation(obj);
      }
      uint64_t v77 = *(void **)(*((void *)&v388 + 1) + 8 * i);
      uint64_t v78 = objc_opt_class();
      uint64_t v84 = objc_msgSend_string(v77, v79, v80, v81, v82, v83);
      double v88 = objc_msgSend_stringForRendering_useAltChars_(v78, v85, (uint64_t)v84, v367, v86, v87);

      uint64_t v94 = objc_msgSend_ch_smallCharacterSet(MEMORY[0x1E4F28B88], v89, v90, v91, v92, v93);
      uint64_t v99 = objc_msgSend_indexesOfCharacters_(v88, v95, (uint64_t)v94, v96, v97, v98);
      uint64_t v105 = objc_msgSend_count(v99, v100, v101, v102, v103, v104);
      LOBYTE(v105) = v105 == objc_msgSend_length(v88, v106, v107, v108, v109, v110);

      if ((v105 & 1) == 0)
      {
        uint64_t v111 = objc_opt_class();
        uint64_t v122 = objc_msgSend_textStrokes(v77, v112, v113, v114, v115, v116);
        if (v77)
        {
          objc_msgSend_strokePoints(v77, v117, v118, v119, v120, v121);
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          v381[0] = 0;
        }
        objc_msgSend_orientation(v77, v117, v118, v119, v120, v121);
        uint64_t v124 = objc_msgSend_principalLinePointsForString_skipAmbiguousCharacters_strokes_strokePoints_orientation_medianFallbackThreshold_(v111, v123, (uint64_t)v88, v364, (uint64_t)v122, (uint64_t)__p);
        uint64_t v125 = (char *)__p[0];
        if (__p[0])
        {
          uint64_t v126 = __p[1];
          uint64_t v127 = __p[0];
          if (__p[1] != __p[0])
          {
            uint64_t v128 = (char *)__p[1];
            do
            {
              uint64_t v130 = (void *)*((void *)v128 - 3);
              v128 -= 24;
              uint64_t v129 = v130;
              if (v130)
              {
                *(v126 - 2) = v129;
                operator delete(v129);
              }
              uint64_t v126 = v128;
            }
            while (v128 != v125);
            uint64_t v127 = __p[0];
          }
          __p[1] = v125;
          operator delete(v127);
        }

        uint64_t v135 = objc_msgSend_objectAtIndexedSubscript_(v124, v131, 0, v132, v133, v134);
        objc_msgSend_addObjectsFromArray_(v362, v136, (uint64_t)v135, v137, v138, v139);

        uint64_t v144 = objc_msgSend_objectAtIndexedSubscript_(v124, v140, 1, v141, v142, v143);
        objc_msgSend_addObjectsFromArray_(v366, v145, (uint64_t)v144, v146, v147, v148);

        uint64_t v153 = objc_msgSend_objectAtIndexedSubscript_(v124, v149, 2, v150, v151, v152);
        objc_msgSend_addObjectsFromArray_(v363, v154, (uint64_t)v153, v155, v156, v157);

        uint64_t v162 = objc_msgSend_objectAtIndexedSubscript_(v124, v158, 0, v159, v160, v161);
        v387[0] = MEMORY[0x1E4F143A8];
        v387[1] = 3221225472;
        v387[2] = sub_1C4AFB3E0;
        v387[3] = &unk_1E64E3AC8;
        *(double *)&v387[4] = v73;
        *(double *)&v387[5] = v74;
        uint64_t v167 = objc_msgSend_indexesOfObjectsPassingTest_(v162, v163, (uint64_t)v387, v164, v165, v166);

        uint64_t v172 = objc_msgSend_objectAtIndexedSubscript_(v124, v168, 0, v169, v170, v171);
        uint64_t v177 = objc_msgSend_objectsAtIndexes_(v172, v173, (uint64_t)v167, v174, v175, v176);
        objc_msgSend_addObjectsFromArray_(v366, v178, (uint64_t)v177, v179, v180, v181);

        float v186 = objc_msgSend_objectAtIndexedSubscript_(v124, v182, 0, v183, v184, v185);
        objc_msgSend_count(v186, v187, v188, v189, v190, v191);

        uint64_t v196 = objc_msgSend_objectAtIndexedSubscript_(v124, v192, 1, v193, v194, v195);
        if (objc_msgSend_count(v196, v197, v198, v199, v200, v201))
        {

          goto LABEL_41;
        }
        BOOL v211 = objc_msgSend_count(v167, v202, v203, v204, v205, v206) == 0;

        if (!v211) {
LABEL_41:
        }
          ++v71;
        uint64_t v212 = objc_msgSend_objectAtIndexedSubscript_(v124, v207, 2, v208, v209, v210);
        BOOL v218 = objc_msgSend_count(v212, v213, v214, v215, v216, v217) != 0;

        v70 += v218;
      }
    }
    uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v219, (uint64_t)&v388, (uint64_t)v392, 16, v220);
  }
  while (v72);
LABEL_45:

  if (objc_msgSend_count(obj, v221, v222, v223, v224, v225) == 1
    && (unint64_t)objc_msgSend_count(v363, v226, v227, v228, v229, v230) > 2
    || (unint64_t)objc_msgSend_count(obj, v226, v227, v228, v229, v230) >= 2
    && (float)((float)v70 / (float)(unint64_t)objc_msgSend_count(obj, v231, v232, v233, v234, v235)) >= 0.75)
  {
    CoreHandwriting::getPointSetFromStrings(v363, __p);
    int64_t v236 = (char *)__p[1] - (char *)__p[0];
    double v361 = 0.0;
    if ((void *)((char *)__p[1] - (char *)__p[0]) >= (void *)0x20)
    {
      if (__p[0] == __p[1])
      {
        *(double *)&uint64_t v256 = NAN;
      }
      else
      {
        uint64_t v237 = v236 >> 4;
        unint64_t v238 = v236 - 16;
        unint64_t v239 = (unint64_t)(v236 - 16) >> 4;
        float64x2_t v240 = 0uLL;
        uint64_t v241 = (float64x2_t *)__p[0];
        if (v238 < 0x10) {
          goto LABEL_173;
        }
        uint64_t v242 = (v239 + 1) & 0x1FFFFFFFFFFFFFFELL;
        uint64_t v241 = (float64x2_t *)((char *)__p[0] + 16 * v242);
        uint64_t v243 = (float64x2_t *)((char *)__p[0] + 16);
        uint64_t v244 = v242;
        do
        {
          float64x2_t v240 = vaddq_f64(vaddq_f64(v240, v243[-1]), *v243);
          v243 += 2;
          v244 -= 2;
        }
        while (v244);
        if (v239 + 1 != v242)
        {
LABEL_173:
          do
          {
            float64x2_t v245 = *v241++;
            float64x2_t v240 = vaddq_f64(v240, v245);
          }
          while (v241 != __p[1]);
        }
        float64x2_t v246 = vdivq_f64(v240, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)(unint64_t)v237), 0));
        float64x2_t v247 = 0uLL;
        uint64_t v248 = (float64x2_t *)__p[0];
        if (v238 < 0x10) {
          goto LABEL_174;
        }
        unint64_t v249 = v239 + 1;
        uint64_t v248 = (float64x2_t *)((char *)__p[0] + 16 * (v249 & 0x1FFFFFFFFFFFFFFELL));
        uint64_t v250 = (float64x2_t *)((char *)__p[0] + 16);
        uint64_t v251 = v249 & 0x1FFFFFFFFFFFFFFELL;
        do
        {
          float64x2_t v252 = vsubq_f64(v250[-1], v246);
          float64x2_t v253 = vsubq_f64(*v250, v246);
          float64x2_t v247 = vaddq_f64(vaddq_f64(v247, vmulq_n_f64(v252, v252.f64[0])), vmulq_n_f64(v253, v253.f64[0]));
          v250 += 2;
          v251 -= 2;
        }
        while (v251);
        if (v249 != (v249 & 0x1FFFFFFFFFFFFFFELL))
        {
LABEL_174:
          do
          {
            float64x2_t v254 = *v248++;
            float64x2_t v255 = vsubq_f64(v254, v246);
            float64x2_t v247 = vmlaq_n_f64(v247, v255, v255.f64[0]);
          }
          while (v248 != __p[1]);
        }
        uint64_t v256 = *(_OWORD *)&vdivq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)v247, 1), v247);
      }
      double v361 = *(double *)&v256;
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  else
  {
    double v361 = 1.79769313e308;
  }
  if (objc_msgSend_count(obj, v231, v232, v233, v234, v235) == 1
    && (unint64_t)objc_msgSend_count(v366, v257, v258, v259, v260, v261) > 2
    || (unint64_t)objc_msgSend_count(obj, v257, v258, v259, v260, v261) >= 2
    && (float)((float)v71 / (float)(unint64_t)objc_msgSend_count(obj, v262, v263, v264, v265, v266)) >= 0.75)
  {
    CoreHandwriting::getPointSetFromStrings(v366, __p);
    int64_t v269 = (char *)__p[1] - (char *)__p[0];
    __double x = 0.0;
    if ((void *)((char *)__p[1] - (char *)__p[0]) >= (void *)0x20)
    {
      if (__p[0] == __p[1])
      {
        *(double *)&uint64_t v289 = NAN;
      }
      else
      {
        uint64_t v270 = v269 >> 4;
        unint64_t v271 = v269 - 16;
        unint64_t v272 = (unint64_t)(v269 - 16) >> 4;
        float64x2_t v273 = 0uLL;
        uint64_t v274 = (float64x2_t *)__p[0];
        if (v271 < 0x10) {
          goto LABEL_175;
        }
        uint64_t v275 = (v272 + 1) & 0x1FFFFFFFFFFFFFFELL;
        uint64_t v274 = (float64x2_t *)((char *)__p[0] + 16 * v275);
        uint64_t v276 = (float64x2_t *)((char *)__p[0] + 16);
        uint64_t v277 = v275;
        do
        {
          float64x2_t v273 = vaddq_f64(vaddq_f64(v273, v276[-1]), *v276);
          v276 += 2;
          v277 -= 2;
        }
        while (v277);
        if (v272 + 1 != v275)
        {
LABEL_175:
          do
          {
            float64x2_t v278 = *v274++;
            float64x2_t v273 = vaddq_f64(v273, v278);
          }
          while (v274 != __p[1]);
        }
        float64x2_t v279 = vdivq_f64(v273, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)(unint64_t)v270), 0));
        float64x2_t v280 = 0uLL;
        uint64_t v281 = (float64x2_t *)__p[0];
        if (v271 < 0x10) {
          goto LABEL_176;
        }
        unint64_t v282 = v272 + 1;
        uint64_t v281 = (float64x2_t *)((char *)__p[0] + 16 * (v282 & 0x1FFFFFFFFFFFFFFELL));
        uint64_t v283 = (float64x2_t *)((char *)__p[0] + 16);
        uint64_t v284 = v282 & 0x1FFFFFFFFFFFFFFELL;
        do
        {
          float64x2_t v285 = vsubq_f64(v283[-1], v279);
          float64x2_t v286 = vsubq_f64(*v283, v279);
          float64x2_t v280 = vaddq_f64(vaddq_f64(v280, vmulq_n_f64(v285, v285.f64[0])), vmulq_n_f64(v286, v286.f64[0]));
          v283 += 2;
          v284 -= 2;
        }
        while (v284);
        if (v282 != (v282 & 0x1FFFFFFFFFFFFFFELL))
        {
LABEL_176:
          do
          {
            float64x2_t v287 = *v281++;
            float64x2_t v288 = vsubq_f64(v287, v279);
            float64x2_t v280 = vmlaq_n_f64(v280, v288, v288.f64[0]);
          }
          while (v281 != __p[1]);
        }
        uint64_t v289 = *(_OWORD *)&vdivq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)v280, 1), v280);
      }
      __double x = *(double *)&v289;
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v361 == 1.79769313e308 || __x == 1.79769313e308)
    {
      if (__x == 1.79769313e308) {
        goto LABEL_71;
      }
      unint64_t v267 = objc_msgSend_count(v366, v262, v263, v264, v265, v266, 1.79769313e308, __x);
      long double v268 = __x;
LABEL_98:
      double v290 = -atan(v268);
      if (vabdd_f64(v290, v28) <= 0.1) {
        goto LABEL_101;
      }
    }
    else
    {
      double v291 = atan((v361 + __x) * 0.5);
      uint64_t v297 = objc_msgSend_count(v363, v292, v293, v294, v295, v296);
      uint64_t v303 = objc_msgSend_count(v366, v298, v299, v300, v301, v302);
      double v290 = -v291;
      unint64_t v267 = (unint64_t)fmax((double)(unint64_t)v297, (double)(unint64_t)v303);
      if (vabdd_f64(-v291, v28) <= 0.1) {
        goto LABEL_101;
      }
    }
  }
  else
  {
LABEL_71:
    if (v361 != 1.79769313e308)
    {
      unint64_t v267 = objc_msgSend_count(v363, v262, v263, v264, v265, v266, 1.79769313e308, v361);
      long double v268 = v361;
      goto LABEL_98;
    }
    unint64_t v267 = 0;
    double v290 = v28;
    if (vabdd_f64(v28, v28) <= 0.1)
    {
LABEL_101:
      uint64_t v304 = objc_opt_class();
      if (v304)
      {
        objc_msgSend_fixPrincipalLinesPosition_useAltString_skipAmbiguousCharacters_(v304, v305, (uint64_t)v360, v367, v364, v306);
        uint64_t v307 = retstr;
        if (__p == (void **)retstr)
        {
LABEL_106:
          if (v384[1])
          {
            *(void **)&long long v385 = v384[1];
            operator delete(v384[1]);
          }
          if (v383[0])
          {
            v383[1] = v383[0];
            operator delete(v383[0]);
          }
          if (v381[1])
          {
            *(void **)&long long v382 = v381[1];
            operator delete(v381[1]);
          }
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          goto LABEL_169;
        }
      }
      else
      {
        *(_OWORD *)double v384 = 0u;
        long long v385 = 0u;
        long long v382 = 0u;
        *(_OWORD *)double v383 = 0u;
        *(_OWORD *)__p = 0u;
        *(_OWORD *)float v381 = 0u;
        uint64_t v307 = retstr;
        if (__p == (void **)retstr) {
          goto LABEL_106;
        }
      }
      sub_1C49B7D84(v307, (char *)__p[0], (char *)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 4);
      sub_1C49B7D84(&v307->base.__begin_, (char *)v381[1], (char *)v382, (uint64_t)(v382 - (unint64_t)v381[1]) >> 4);
      sub_1C49B7D84(p_median, (char *)v383[0], (char *)v383[1], ((char *)v383[1] - (char *)v383[0]) >> 4);
      sub_1C49B7D84(&v307->top.__begin_, (char *)v384[1], (char *)v385, (uint64_t)(v385 - (unint64_t)v384[1]) >> 4);
      goto LABEL_106;
    }
  }
  if (fabs(v290) >= fabs(v28) && v267 < 4) {
    goto LABEL_101;
  }
  double v308 = v290 - v28;
  p_base = &retstr->base;
  uint64_t v309 = retstr->base.__begin_;
  double v311 = v309->x;
  double v312 = v309->y;
  memset(&v386, 0, sizeof(v386));
  CGAffineTransformMakeRotation(&v386, -v308);
  CoreHandwriting::transformPrincipalLines((double **)retstr, (float64x2_t *)&v386, (uint64_t)__p);
  if (__p != (void **)retstr)
  {
    sub_1C49B7D84(retstr, (char *)__p[0], (char *)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 4);
    sub_1C49B7D84(p_base, (char *)v381[1], (char *)v382, (uint64_t)(v382 - (unint64_t)v381[1]) >> 4);
    sub_1C49B7D84(p_median, (char *)v383[0], (char *)v383[1], ((char *)v383[1] - (char *)v383[0]) >> 4);
    sub_1C49B7D84(&retstr->top.__begin_, (char *)v384[1], (char *)v385, (uint64_t)(v385 - (unint64_t)v384[1]) >> 4);
  }
  if (v384[1])
  {
    *(void **)&long long v385 = v384[1];
    operator delete(v384[1]);
  }
  if (v383[0])
  {
    v383[1] = v383[0];
    operator delete(v383[0]);
  }
  if (v381[1])
  {
    *(void **)&long long v382 = v381[1];
    operator delete(v381[1]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  memset(&v379, 0, sizeof(v379));
  CGAffineTransformMakeTranslation(&v379, v311 - retstr->base.__begin_->x, v312 - retstr->base.__begin_->y);
  CoreHandwriting::transformPrincipalLines((double **)retstr, (float64x2_t *)&v379, (uint64_t)__p);
  if (__p != (void **)retstr)
  {
    sub_1C49B7D84(retstr, (char *)__p[0], (char *)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 4);
    sub_1C49B7D84(p_base, (char *)v381[1], (char *)v382, (uint64_t)(v382 - (unint64_t)v381[1]) >> 4);
    sub_1C49B7D84(p_median, (char *)v383[0], (char *)v383[1], ((char *)v383[1] - (char *)v383[0]) >> 4);
    sub_1C49B7D84(&retstr->top.__begin_, (char *)v384[1], (char *)v385, (uint64_t)(v385 - (unint64_t)v384[1]) >> 4);
  }
  if (v384[1])
  {
    *(void **)&long long v385 = v384[1];
    operator delete(v384[1]);
  }
  if (v383[0])
  {
    v383[1] = v383[0];
    operator delete(v383[0]);
  }
  if (v381[1])
  {
    *(void **)&long long v382 = v381[1];
    operator delete(v381[1]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  uint64_t v313 = [CHTransformedTextLine alloc];
  uint64_t v319 = objc_msgSend_textStrokes(v360, v314, v315, v316, v317, v318);
  uint64_t v330 = objc_msgSend_tokens(v360, v320, v321, v322, v323, v324);
  if (v360)
  {
    objc_msgSend_points(v360, v325, v326, v327, v328, v329);
    objc_msgSend_strokePoints(v360, v331, v332, v333, v334, v335);
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v381[0] = 0;
    uint64_t v376 = 0;
    uint64_t v377 = 0;
    uint64_t v378 = 0;
  }
  uint64_t v336 = objc_msgSend_locale(v360, v325, v326, v327, v328, v329);
  uint64_t v342 = objc_msgSend_strokeClassification(v360, v337, v338, v339, v340, v341);
  sub_1C4AAA458(v369, (uint64_t)retstr);
  long long v343 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v368[0] = *MEMORY[0x1E4F1DAB8];
  v368[1] = v343;
  v368[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  uint64_t v345 = objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v313, v344, (uint64_t)v319, (uint64_t)v330, (uint64_t)__p, (uint64_t)&v376, v336, v342, v369, v368);
  if (v374)
  {
    long long v375 = v374;
    operator delete(v374);
  }
  if (v372)
  {
    uint64_t v373 = v372;
    operator delete(v372);
  }
  if (v370)
  {
    uint64_t v371 = v370;
    operator delete(v370);
  }
  if (v369[0])
  {
    v369[1] = v369[0];
    operator delete(v369[0]);
  }

  uint64_t v346 = (char *)v376;
  if (v376)
  {
    float v347 = v377;
    float v348 = v376;
    if (v377 != v376)
    {
      CGFloat v349 = v377;
      do
      {
        uint64_t v351 = (void *)*((void *)v349 - 3);
        v349 -= 24;
        uint64_t v350 = v351;
        if (v351)
        {
          *((void *)v347 - 2) = v350;
          operator delete(v350);
        }
        float v347 = v349;
      }
      while (v349 != v346);
      float v348 = v376;
    }
    uint64_t v377 = v346;
    operator delete(v348);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  uint64_t v352 = objc_opt_class();
  if (v352)
  {
    objc_msgSend_fixPrincipalLinesPosition_useAltString_skipAmbiguousCharacters_(v352, v353, (uint64_t)v345, v367, v364, v354);
    if (__p == (void **)retstr) {
      goto LABEL_160;
    }
LABEL_159:
    sub_1C49B7D84(retstr, (char *)__p[0], (char *)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 4);
    sub_1C49B7D84(p_base, (char *)v381[1], (char *)v382, (uint64_t)(v382 - (unint64_t)v381[1]) >> 4);
    sub_1C49B7D84(p_median, (char *)v383[0], (char *)v383[1], ((char *)v383[1] - (char *)v383[0]) >> 4);
    sub_1C49B7D84(&retstr->top.__begin_, (char *)v384[1], (char *)v385, (uint64_t)(v385 - (unint64_t)v384[1]) >> 4);
  }
  else
  {
    *(_OWORD *)double v384 = 0u;
    long long v385 = 0u;
    long long v382 = 0u;
    *(_OWORD *)double v383 = 0u;
    *(_OWORD *)__p = 0u;
    *(_OWORD *)float v381 = 0u;
    if (__p != (void **)retstr) {
      goto LABEL_159;
    }
  }
LABEL_160:
  if (v384[1])
  {
    *(void **)&long long v385 = v384[1];
    operator delete(v384[1]);
  }
  if (v383[0])
  {
    v383[1] = v383[0];
    operator delete(v383[0]);
  }
  if (v381[1])
  {
    *(void **)&long long v382 = v381[1];
    operator delete(v381[1]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

LABEL_169:
LABEL_170:

  return result;
}

+ (PrincipalLines)principalLinesFromTokens:(SEL)a3 strokes:(id)a4 strokePoints:(id)a5 orientation:(const void *)a6 useAltString:(double)a7
{
  BOOL v267 = a8;
  uint64_t v292 = *MEMORY[0x1E4F143B8];
  id v257 = a4;
  id v263 = a5;
  double v16 = tan(a7);
  float64x2_t v288 = 0;
  *(void *)uint64_t v289 = 0;
  uint64_t v290 = 0;
  uint64_t v17 = *(void *)a6;
  uint64_t v264 = (uint64_t *)a6;
  if (*((void *)a6 + 1) == *(void *)a6) {
    goto LABEL_21;
  }
  uint64_t v18 = 0;
  unint64_t v19 = 0;
  do
  {
    sub_1C4B01DF8((uint64_t)&v288, *(uint64_t *)v289, *(char **)(v17 + v18), *(char **)(v17 + v18 + 8), (uint64_t)(*(void *)(v17 + v18 + 8) - *(void *)(v17 + v18)) >> 4);
    ++v19;
    uint64_t v17 = *v264;
    v18 += 24;
  }
  while (v19 < 0xAAAAAAAAAAAAAAABLL * ((v264[1] - *v264) >> 3));
  if (v288 == *(void **)v289)
  {
LABEL_21:
    double v21 = -1.79769313e308;
    double v20 = 1.79769313e308;
    double v29 = 1.79769313e308;
    double v30 = -1.79769313e308;
  }
  else
  {
    double v20 = 1.79769313e308;
    double v21 = -1.79769313e308;
    double v22 = -1.79769313e308;
    double v23 = 1.79769313e308;
    uint64_t v24 = (double *)v288;
    do
    {
      double v25 = *v24;
      v24 += 2;
      double v26 = v25;
      if (v23 > v25)
      {
        double v20 = v26;
        double v23 = v26;
      }
      if (v22 < v26)
      {
        double v21 = v26;
        double v22 = v26;
      }
    }
    while (v24 != *(double **)v289);
    if (v288 == *(void **)v289)
    {
      double v30 = -1.79769313e308;
      double v29 = 1.79769313e308;
    }
    else
    {
      unint64_t v27 = (uint64_t)(*(void *)v289 - (void)v288) >> 4;
      if (v27 <= 1) {
        unint64_t v27 = 1;
      }
      double v28 = (double *)((char *)v288 + 8);
      double v29 = 1.79769313e308;
      double v30 = -1.79769313e308;
      do
      {
        double v31 = *v28 + *(v28 - 1) * v16;
        if (v31 <= v29) {
          double v29 = *v28 + *(v28 - 1) * v16;
        }
        if (v31 >= v30) {
          double v30 = *v28 + *(v28 - 1) * v16;
        }
        v28 += 2;
        --v27;
      }
      while (v27);
    }
  }
  uint64_t v262 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v11, v12, v13, v14, v15);
  uint64_t v260 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v32, v33, v34, v35, v36);
  uint64_t v259 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v37, v38, v39, v40, v41);
  uint64_t v261 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v42, v43, v44, v45, v46);
  long long v286 = 0u;
  long long v287 = 0u;
  long long v284 = 0u;
  long long v285 = 0u;
  obuint64_t j = v257;
  uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v284, (uint64_t)v291, 16, v48);
  if (v49)
  {
    uint64_t v266 = *(void *)v285;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v285 != v266) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = *(void **)(*((void *)&v284 + 1) + 8 * i);
        uint64_t v52 = objc_opt_class();
        uint64_t v58 = objc_msgSend_string(v51, v53, v54, v55, v56, v57);
        double v62 = objc_msgSend_stringForRendering_useAltChars_(v52, v59, (uint64_t)v58, v267, v60, v61);

        double v68 = objc_msgSend_ch_smallCharacterSet(MEMORY[0x1E4F28B88], v63, v64, v65, v66, v67);
        double v73 = objc_msgSend_indexesOfCharacters_(v62, v69, (uint64_t)v68, v70, v71, v72);
        uint64_t v79 = objc_msgSend_count(v73, v74, v75, v76, v77, v78);
        LOBYTE(v79) = v79 == objc_msgSend_length(v62, v80, v81, v82, v83, v84);

        if ((v79 & 1) == 0)
        {
          uint64_t v90 = objc_msgSend_strokeIndexes(v51, v85, v86, v87, v88, v89);
          uint64_t v95 = objc_msgSend_objectsAtIndexes_(v263, v91, (uint64_t)v90, v92, v93, v94);

          long double v268 = 0;
          int64_t v269 = (char *)&v268;
          uint64_t v270 = 0x4812000000;
          unint64_t v271 = sub_1C4AFC098;
          unint64_t v272 = (char *)sub_1C4AFC0BC;
          float64x2_t v273 = &unk_1C4CB5C62;
          uint64_t v275 = 0;
          uint64_t v276 = 0;
          __p = 0;
          uint64_t v280 = 0;
          uint64_t v281 = &v280;
          uint64_t v282 = 0x2020000000;
          uint64_t v283 = 0;
          uint64_t v101 = objc_msgSend_strokeIndexes(v51, v96, v97, v98, v99, v100);
          v279[0] = MEMORY[0x1E4F143A8];
          v279[1] = 3221225472;
          v279[2] = sub_1C4AFC14C;
          v279[3] = &unk_1E64E3AF0;
          v279[5] = &v280;
          v279[6] = v264;
          v279[4] = &v268;
          objc_msgSend_enumerateIndexesUsingBlock_(v101, v102, (uint64_t)v279, v103, v104, v105);

          if (v281[3])
          {
            uint64_t v106 = objc_opt_class();
            uint64_t v108 = objc_msgSend_principalLineInterceptsForString_skipAmbiguousCharacters_strokes_strokePoints_orientation_medianFallbackThreshold_(v106, v107, (uint64_t)v62, 1, (uint64_t)v95, (uint64_t)(v269 + 48), a7, 0.0);
            uint64_t v113 = objc_msgSend_objectAtIndexedSubscript_(v108, v109, 0, v110, v111, v112);
            objc_msgSend_addObjectsFromArray_(v262, v114, (uint64_t)v113, v115, v116, v117);

            uint64_t v122 = objc_msgSend_objectAtIndexedSubscript_(v108, v118, 1, v119, v120, v121);
            objc_msgSend_addObjectsFromArray_(v260, v123, (uint64_t)v122, v124, v125, v126);

            uint64_t v131 = objc_msgSend_objectAtIndexedSubscript_(v108, v127, 2, v128, v129, v130);
            objc_msgSend_addObjectsFromArray_(v259, v132, (uint64_t)v131, v133, v134, v135);

            uint64_t v140 = objc_msgSend_objectAtIndexedSubscript_(v108, v136, 3, v137, v138, v139);
            objc_msgSend_addObjectsFromArray_(v261, v141, (uint64_t)v140, v142, v143, v144);
          }
          _Block_object_dispose(&v280, 8);
          _Block_object_dispose(&v268, 8);
          uint64_t v145 = (char *)__p;
          if (__p)
          {
            uint64_t v146 = v275;
            uint64_t v147 = __p;
            if (v275 != __p)
            {
              uint64_t v148 = v275;
              do
              {
                uint64_t v150 = (void *)*((void *)v148 - 3);
                v148 -= 24;
                uint64_t v149 = v150;
                if (v150)
                {
                  *((void *)v146 - 2) = v149;
                  operator delete(v149);
                }
                uint64_t v146 = v148;
              }
              while (v148 != v145);
              uint64_t v147 = __p;
            }
            uint64_t v275 = v145;
            operator delete(v147);
          }
        }
      }
      uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v151, (uint64_t)&v284, (uint64_t)v291, 16, v152);
    }
    while (v49);
  }

  if (!objc_msgSend_count(v262, v153, v154, v155, v156, v157))
  {
    uint64_t v163 = objc_msgSend_numberWithDouble_(NSNumber, v158, v159, v160, v161, v162, v29);
    objc_msgSend_addObject_(v262, v164, (uint64_t)v163, v165, v166, v167);
  }
  if (!objc_msgSend_count(v260, v158, v159, v160, v161, v162, *(void *)&v16))
  {
    double v173 = objc_msgSend_valueForKeyPath_(v262, v168, @"@max.floatValue", v170, v171, v172);
    objc_msgSend_addObject_(v260, v174, (uint64_t)v173, v175, v176, v177);
  }
  if (!objc_msgSend_count(v261, v168, v169, v170, v171, v172))
  {
    uint64_t v183 = objc_msgSend_numberWithDouble_(NSNumber, v178, v179, v180, v181, v182, v30);
    objc_msgSend_addObject_(v261, v184, (uint64_t)v183, v185, v186, v187);
  }
  if (!objc_msgSend_count(v259, v178, v179, v180, v181, v182))
  {
    uint64_t v192 = objc_msgSend_valueForKeyPath_(v261, v188, @"@min.floatValue", v189, v190, v191);
    objc_msgSend_addObject_(v259, v193, (uint64_t)v192, v194, v195, v196);
  }
  uint64_t v197 = objc_msgSend_valueForKeyPath_(v262, v188, @"@avg.floatValue", v189, v190, v191);
  objc_msgSend_floatValue(v197, v198, v199, v200, v201, v202);
  float v204 = v203;

  uint64_t v209 = objc_msgSend_valueForKeyPath_(v260, v205, @"@avg.floatValue", v206, v207, v208);
  objc_msgSend_floatValue(v209, v210, v211, v212, v213, v214);
  float v216 = v215;

  uint64_t v221 = objc_msgSend_valueForKeyPath_(v259, v217, @"@avg.floatValue", v218, v219, v220);
  objc_msgSend_floatValue(v221, v222, v223, v224, v225, v226);
  float v228 = v227;

  uint64_t v233 = objc_msgSend_valueForKeyPath_(v261, v229, @"@avg.floatValue", v230, v231, v232);
  objc_msgSend_floatValue(v233, v234, v235, v236, v237, v238);
  float v240 = v239;

  double v241 = v228;
  *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
  *(_OWORD *)&retstr->top.__end_ = 0u;
  if (v240 >= v228) {
    double v242 = v240;
  }
  else {
    double v242 = v228;
  }
  *(_OWORD *)&retstr->base.__end_ = 0uLL;
  *(_OWORD *)&retstr->median.__begin_ = 0uLL;
  *(_OWORD *)&retstr->descender.__begin_ = 0uLL;
  *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0uLL;
  uint64_t v243 = (double *)operator new(0x10uLL);
  uint64_t v244 = v243;
  double v245 = -v256;
  double v246 = v216;
  if (v204 <= v216) {
    double v247 = v204;
  }
  else {
    double v247 = v216;
  }
  *uint64_t v243 = v20;
  v243[1] = v247 + v20 * v245;
  uint64_t v248 = operator new(0x20uLL);
  *((double *)v248 + 2) = v21;
  *((double *)v248 + 3) = v247 + v21 * v245;
  *(_OWORD *)uint64_t v248 = *(_OWORD *)v244;
  operator delete(v244);
  sub_1C49B7D84(&retstr->top.__begin_, (char *)v248, (char *)v248 + 32, 2uLL);
  unint64_t v249 = (double *)operator new(0x10uLL);
  *unint64_t v249 = v20;
  v249[1] = v246 + v20 * v245;
  uint64_t v250 = operator new(0x20uLL);
  *((double *)v250 + 2) = v21;
  *((double *)v250 + 3) = v246 + v21 * v245;
  *(_OWORD *)uint64_t v250 = *(_OWORD *)v249;
  operator delete(v249);
  sub_1C49B7D84(&retstr->median.__begin_, (char *)v250, (char *)v250 + 32, 2uLL);
  uint64_t v251 = (double *)operator new(0x10uLL);
  *uint64_t v251 = v20;
  v251[1] = v241 + v20 * v245;
  float64x2_t v252 = operator new(0x20uLL);
  *((double *)v252 + 2) = v21;
  *((double *)v252 + 3) = v241 + v21 * v245;
  *(_OWORD *)float64x2_t v252 = *(_OWORD *)v251;
  operator delete(v251);
  sub_1C49B7D84(&retstr->base.__begin_, (char *)v252, (char *)v252 + 32, 2uLL);
  float64x2_t v253 = (double *)operator new(0x10uLL);
  *float64x2_t v253 = v20;
  v253[1] = v242 + v20 * v245;
  float64x2_t v254 = operator new(0x20uLL);
  *((double *)v254 + 2) = v21;
  *((double *)v254 + 3) = v242 + v21 * v245;
  *(_OWORD *)float64x2_t v254 = *(_OWORD *)v253;
  operator delete(v253);
  sub_1C49B7D84(retstr, (char *)v254, (char *)v254 + 32, 2uLL);
  sub_1C4B52ADC((double **)retstr, (double **)&v288, (uint64_t)&v268);
  if (&v268 != (void **)retstr)
  {
    sub_1C49B7D84(retstr, (char *)v268, v269, (v269 - (unsigned char *)v268) >> 4);
    sub_1C49B7D84(&retstr->base.__begin_, (char *)v271, v272, (v272 - (unsigned char *)v271) >> 4);
    sub_1C49B7D84(&retstr->median.__begin_, (char *)__p, v275, (v275 - (unsigned char *)__p) >> 4);
    sub_1C49B7D84(&retstr->top.__begin_, (char *)v277, v278, (v278 - (unsigned char *)v277) >> 4);
  }
  if (v277)
  {
    float64x2_t v278 = (char *)v277;
    operator delete(v277);
  }
  if (__p)
  {
    uint64_t v275 = (char *)__p;
    operator delete(__p);
  }
  if (v271)
  {
    unint64_t v272 = (char *)v271;
    operator delete(v271);
  }
  if (v268)
  {
    int64_t v269 = (char *)v268;
    operator delete(v268);
  }
  operator delete(v254);
  operator delete(v252);
  operator delete(v250);
  operator delete(v248);

  if (v288)
  {
    *(void *)uint64_t v289 = v288;
    operator delete(v288);
  }

  return result;
}

+ (PrincipalLines)flipPrincipalLine:(SEL)a3 points:(PrincipalLines *)a4 string:(const void *)a5 outWasFlipped:(id)a6
{
  id v11 = a6;
  begin = a4->base.__begin_;
  double y = begin->y;
  double v19 = atan2(begin[1].y - y, begin[1].x - begin->x);
  if (v19 <= 2.2 && y >= a4->median.__begin_->y)
  {
    BOOL v64 = 0;
    if (!a7) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
  int hasAscender = objc_msgSend_hasAscender(v11, v14, v15, v16, v17, v18);
  int hasDescender = objc_msgSend_hasDescender(v11, v21, v22, v23, v24, v25);
  double v27 = v19 + -3.1415;
  if (v19 <= 2.2) {
    double v27 = v19;
  }
  double v28 = tan(v27);
  double v30 = *(double **)a5;
  double v29 = (double *)*((void *)a5 + 1);
  double v68 = (double **)a5;
  if (v29 == *(double **)a5)
  {
    double v34 = -1.79769313e308;
    double v33 = 1.79769313e308;
  }
  else
  {
    unint64_t v31 = ((uint64_t)v29 - *(void *)a5) >> 4;
    if (v31 <= 1) {
      unint64_t v31 = 1;
    }
    uint64_t v32 = v30 + 1;
    double v33 = 1.79769313e308;
    double v34 = -1.79769313e308;
    do
    {
      double v35 = *v32 - *(v32 - 1) * v28;
      if (v35 <= v33) {
        double v33 = *v32 - *(v32 - 1) * v28;
      }
      if (v35 >= v34) {
        double v34 = *v32 - *(v32 - 1) * v28;
      }
      v32 += 2;
      --v31;
    }
    while (v31);
  }
  double v36 = a4->top.__begin_->y - a4->top.__begin_->x * v28;
  double v37 = a4->median.__begin_->y - a4->median.__begin_->x * v28;
  double v38 = a4->base.__begin_->y - a4->base.__begin_->x * v28;
  double v39 = a4->descender.__begin_->y - a4->descender.__begin_->x * v28;
  if (v29 == v30)
  {
    double v40 = 1.79769313e308;
    double v41 = -1.79769313e308;
  }
  else
  {
    double v40 = 1.79769313e308;
    double v41 = -1.79769313e308;
    double v42 = -1.79769313e308;
    double v43 = 1.79769313e308;
    do
    {
      double v44 = *v30;
      v30 += 2;
      double v45 = v44;
      if (v43 > v44)
      {
        double v40 = v45;
        double v43 = v45;
      }
      if (v42 < v45)
      {
        double v41 = v45;
        double v42 = v45;
      }
    }
    while (v30 != v29);
  }
  *(_OWORD *)uint64_t v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  *(_OWORD *)uint64_t v82 = 0u;
  *(_OWORD *)uint64_t v79 = 0u;
  *(_OWORD *)uint64_t v80 = 0u;
  double v46 = vabdd_f64(v36, v37);
  double v47 = -0.0;
  if (hasAscender) {
    double v48 = v46;
  }
  else {
    double v48 = -0.0;
  }
  double v49 = vabdd_f64(v39, v38);
  if (hasDescender) {
    double v50 = v49;
  }
  else {
    double v50 = 0.0;
  }
  if (!hasDescender) {
    double v47 = v49;
  }
  double v69 = v47;
  double v70 = v50;
  uint64_t v51 = (double *)operator new(0x10uLL);
  uint64_t v52 = v51;
  uint64_t v67 = a7;
  if (hasAscender) {
    double v53 = 0.0;
  }
  else {
    double v53 = v46;
  }
  double v54 = v33 - v53;
  *uint64_t v51 = v40;
  v51[1] = v33 - v53 + v40 * v28;
  uint64_t v55 = operator new(0x20uLL);
  *((double *)v55 + 2) = v41;
  *((double *)v55 + 3) = v54 + v41 * v28;
  *(_OWORD *)uint64_t v55 = *(_OWORD *)v52;
  operator delete(v52);
  sub_1C49B7D84(&v83[1], (char *)v55, (char *)v55 + 32, 2uLL);
  uint64_t v66 = retstr;
  uint64_t v56 = (double *)operator new(0x10uLL);
  double v57 = v33 + v48;
  *uint64_t v56 = v40;
  v56[1] = v57 + v40 * v28;
  uint64_t v58 = operator new(0x20uLL);
  *((double *)v58 + 2) = v41;
  *((double *)v58 + 3) = v57 + v41 * v28;
  *(_OWORD *)uint64_t v58 = *(_OWORD *)v56;
  operator delete(v56);
  sub_1C49B7D84(v82, (char *)v58, (char *)v58 + 32, 2uLL);
  double v59 = (double *)operator new(0x10uLL);
  double *v59 = v40;
  v59[1] = v34 - v70 + v40 * v28;
  uint64_t v60 = operator new(0x20uLL);
  *((double *)v60 + 2) = v41;
  *((double *)v60 + 3) = v34 - v70 + v41 * v28;
  *(_OWORD *)uint64_t v60 = *(_OWORD *)v59;
  operator delete(v59);
  sub_1C49B7D84(&v80[1], (char *)v60, (char *)v60 + 32, 2uLL);
  uint64_t v61 = (double *)operator new(0x10uLL);
  double v62 = v34 + v69;
  *uint64_t v61 = v40;
  v61[1] = v62 + v40 * v28;
  double v63 = operator new(0x20uLL);
  *((double *)v63 + 2) = v41;
  *((double *)v63 + 3) = v62 + v41 * v28;
  *(_OWORD *)double v63 = *(_OWORD *)v61;
  operator delete(v61);
  sub_1C49B7D84(v79, (char *)v63, (char *)v63 + 32, 2uLL);
  if (v79 != (void **)a4)
  {
    sub_1C49B7D84(a4, (char *)v79[0], (char *)v79[1], ((char *)v79[1] - (char *)v79[0]) >> 4);
    sub_1C49B7D84(&a4->base.__begin_, (char *)v80[1], (char *)v81, (uint64_t)(v81 - (unint64_t)v80[1]) >> 4);
    sub_1C49B7D84(&a4->median.__begin_, (char *)v82[0], (char *)v82[1], ((char *)v82[1] - (char *)v82[0]) >> 4);
    sub_1C49B7D84(&a4->top.__begin_, (char *)v83[1], (char *)v84, (uint64_t)(v84 - (unint64_t)v83[1]) >> 4);
  }
  sub_1C4B52ADC((double **)a4, v68, (uint64_t)&v71);
  if (&v71 != (void **)a4)
  {
    sub_1C49B7D84(a4, (char *)v71, v72, (v72 - (unsigned char *)v71) >> 4);
    sub_1C49B7D84(&a4->base.__begin_, (char *)v73, v74, (v74 - (unsigned char *)v73) >> 4);
    sub_1C49B7D84(&a4->median.__begin_, (char *)v75, v76, (v76 - (unsigned char *)v75) >> 4);
    sub_1C49B7D84(&a4->top.__begin_, (char *)__p, v78, (v78 - (unsigned char *)__p) >> 4);
  }
  if (__p)
  {
    uint64_t v78 = (char *)__p;
    operator delete(__p);
  }
  if (v75)
  {
    uint64_t v76 = (char *)v75;
    operator delete(v75);
  }
  if (v73)
  {
    double v74 = (char *)v73;
    operator delete(v73);
  }
  if (v71)
  {
    uint64_t v72 = (char *)v71;
    operator delete(v71);
  }
  operator delete(v63);
  operator delete(v60);
  operator delete(v58);
  operator delete(v55);
  if (v83[1])
  {
    *(void **)&long long v84 = v83[1];
    operator delete(v83[1]);
  }
  retstr = v66;
  a7 = v67;
  if (v82[0])
  {
    v82[1] = v82[0];
    operator delete(v82[0]);
  }
  if (v80[1])
  {
    *(void **)&long long v81 = v80[1];
    operator delete(v80[1]);
  }
  if (v79[0])
  {
    v79[1] = v79[0];
    operator delete(v79[0]);
  }
  BOOL v64 = 1;
  if (v67) {
LABEL_57:
  }
    *a7 = v64;
LABEL_58:
  sub_1C4AAA458(retstr, (uint64_t)a4);

  return result;
}

+ (double)textLineFitScore:(id)a3 useAltString:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_msgSend_splitIntoTokens(v5, v6, v7, v8, v9, v10);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v63 = 0u;
  long long v62 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v62, (uint64_t)v66, 16, v13);
  if (v14)
  {
    uint64_t v15 = *(void *)v63;
    double v16 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v63 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        double v19 = objc_opt_class();
        uint64_t v25 = objc_msgSend_string(v18, v20, v21, v22, v23, v24);
        double v29 = objc_msgSend_stringForRendering_useAltChars_(v19, v26, (uint64_t)v25, v4, v27, v28);

        double v35 = objc_opt_class();
        if (v18)
        {
          objc_msgSend_principalLines(v18, v30, v31, v32, v33, v34);
          objc_msgSend_points(v18, v36, v37, v38, v39, v40);
        }
        else
        {
          *(_OWORD *)uint64_t v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          *(_OWORD *)double v59 = 0u;
          *(_OWORD *)uint64_t v56 = 0u;
          *(_OWORD *)double v57 = 0u;
          __p = 0;
          double v54 = 0;
          uint64_t v55 = 0;
        }
        objc_msgSend_principalLinesFitScore_points_transcription_(v35, v30, (uint64_t)v56, (uint64_t)&__p, (uint64_t)v29, v34);
        double v42 = v41;
        if (__p)
        {
          double v54 = __p;
          operator delete(__p);
        }
        if (v60[1])
        {
          *(void **)&long long v61 = v60[1];
          operator delete(v60[1]);
        }
        if (v59[0])
        {
          v59[1] = v59[0];
          operator delete(v59[0]);
        }
        if (v57[1])
        {
          *(void **)&long long v58 = v57[1];
          operator delete(v57[1]);
        }
        if (v56[0])
        {
          v56[1] = v56[0];
          operator delete(v56[0]);
        }

        double v16 = v16 + v42;
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v43, (uint64_t)&v62, (uint64_t)v66, 16, v44);
    }
    while (v14);
  }
  else
  {
    double v16 = 0.0;
  }

  objc_msgSend_lineHeight(v5, v45, v46, v47, v48, v49);
  double v51 = v50;

  return v16 / v51;
}

+ (double)principalLinesFitScore:(const void *)a3 points:(const void *)a4 transcription:(id)a5
{
  id v12 = a5;
  if (*((void *)a3 + 4) - *((void *)a3 + 3) != 32)
  {
    double v36 = 1.79769313e308;
    goto LABEL_36;
  }
  uint64_t v13 = objc_msgSend_ch_smallCharacterSet(MEMORY[0x1E4F28B88], v7, v8, v9, v10, v11);
  uint64_t v18 = objc_msgSend_indexesOfCharacters_(v12, v14, (uint64_t)v13, v15, v16, v17);
  uint64_t v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23);
  uint64_t v30 = objc_msgSend_length(v12, v25, v26, v27, v28, v29);

  double v36 = 0.0;
  if (v24 != v30)
  {
    uint64_t v97 = 0;
    uint64_t v98 = 0;
    uint64_t v99 = 0;
    uint64_t v38 = (unsigned char *)*((void *)a3 + 6);
    uint64_t v37 = (unsigned char *)*((void *)a3 + 7);
    int64_t v39 = v37 - v38;
    if (v37 != v38)
    {
      if (v39 < 0) {
        sub_1C494A220();
      }
      uint64_t v40 = (char *)operator new(v37 - v38);
      double v41 = &v40[16 * (v39 >> 4)];
      uint64_t v97 = v40;
      uint64_t v99 = v41;
      memcpy(v40, v38, v39);
      uint64_t v98 = v41;
    }
    uint64_t v94 = 0;
    uint64_t v95 = 0;
    uint64_t v96 = 0;
    double v43 = (unsigned char *)*((void *)a3 + 3);
    double v42 = (unsigned char *)*((void *)a3 + 4);
    int64_t v44 = v42 - v43;
    if (v42 != v43)
    {
      if (v44 < 0) {
        sub_1C494A220();
      }
      double v45 = (char *)operator new(v42 - v43);
      uint64_t v46 = &v45[16 * (v44 >> 4)];
      uint64_t v94 = v45;
      uint64_t v96 = v46;
      memcpy(v45, v43, v44);
      uint64_t v95 = v46;
    }
    unint64_t v47 = objc_msgSend_ascendersCount(v12, v31, v32, v33, v34, v35);
    if (objc_msgSend_countCharacters(v12, v48, v49, v50, v51, v52) <= v47 && &v97 != (void **)((char *)a3 + 72)) {
      sub_1C49B7D84(&v97, *((char **)a3 + 9), *((char **)a3 + 10), (uint64_t)(*((void *)a3 + 10) - *((void *)a3 + 9)) >> 4);
    }
    long double v53 = atan2(*(double *)(*((void *)a3 + 3) + 24) - *(double *)(*((void *)a3 + 3) + 8), *(double *)(*((void *)a3 + 3) + 16) - **((double **)a3 + 3));
    double v54 = tan(v53);
    uint64_t v60 = objc_msgSend_countCharacters(v12, v55, v56, v57, v58, v59);
    uint64_t v66 = v60;
    if (v60)
    {
      unint64_t v67 = 0;
      double v68 = *((double *)v94 + 1) - *(double *)v94 * v54;
      double v69 = (*((double *)v94 + 2) - *(double *)v94) / (double)(unint64_t)v60;
      while (1)
      {
        double v70 = *(double *)v94 + (double)v67++ * v69;
        sub_1C4B48FE8((double **)a4, (uint64_t *)&__p, v54, v70, v68 + v70 * v54, *(double *)v94 + (double)v67 * v69, v68 + (*(double *)v94 + (double)v67 * v69) * v54);
        uint64_t v71 = v93;
        if (v93 != __p) {
          break;
        }
        double v74 = sub_1C4B49EEC((double **)a3, (double **)a3 + 9);
        double v36 = v36 + v74 * v74 * 2.0;
        if (v71) {
          goto LABEL_19;
        }
LABEL_14:
        if (v66 == v67) {
          goto LABEL_21;
        }
      }
      double v72 = sub_1C4B49FD0(&__p, (double **)&v97);
      double v73 = sub_1C4B49FD0(&__p, (double **)&v94);
      double v36 = v36 + v72 * v72 + v73 * v73;
      uint64_t v71 = __p;
      if (!__p) {
        goto LABEL_14;
      }
LABEL_19:
      uint64_t v93 = v71;
      operator delete(v71);
      goto LABEL_14;
    }
LABEL_21:
    char hasAscender = objc_msgSend_hasAscender(v12, v61, v62, v63, v64, v65);
    char hasDescender = objc_msgSend_hasDescender(v12, v76, v77, v78, v79, v80);
    uint64_t v82 = *((void *)a4 + 1) - *(void *)a4;
    if (v82)
    {
      unint64_t v83 = v82 >> 4;
      if (v83 <= 1) {
        unint64_t v83 = 1;
      }
      long long v84 = (double *)(*(void *)a4 + 8);
      double v85 = 1.79769313e308;
      double v86 = -1.79769313e308;
      do
      {
        double v87 = *v84 - *(v84 - 1) * v54;
        if (v87 <= v85) {
          double v85 = *v84 - *(v84 - 1) * v54;
        }
        if (v87 >= v86) {
          double v86 = *v84 - *(v84 - 1) * v54;
        }
        v84 += 2;
        --v83;
      }
      while (v83);
      if (hasAscender)
      {
LABEL_31:
        if (hasDescender) {
          goto LABEL_32;
        }
        goto LABEL_39;
      }
    }
    else
    {
      double v86 = -1.79769313e308;
      double v85 = 1.79769313e308;
      if (hasAscender) {
        goto LABEL_31;
      }
    }
    double v90 = *(double *)(*((void *)a3 + 6) + 8) - **((double **)a3 + 6) * v54 - v85;
    double v36 = v36 + v90 * v90;
    if (hasDescender)
    {
LABEL_32:
      uint64_t v88 = (char *)v94;
      if (!v94) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }
LABEL_39:
    double v91 = *(double *)(*((void *)a3 + 3) + 8) - **((double **)a3 + 3) * v54 - v86;
    double v36 = v36 + v91 * v91;
    uint64_t v88 = (char *)v94;
    if (!v94)
    {
LABEL_34:
      if (v97)
      {
        uint64_t v98 = v97;
        operator delete(v97);
      }
      goto LABEL_36;
    }
LABEL_33:
    uint64_t v95 = v88;
    operator delete(v88);
    goto LABEL_34;
  }
LABEL_36:

  return v36;
}

+ (PrincipalLines)principalLinesForPoints:(SEL)a3 writtenAlphaShape:(const void *)a4 imgPointsAndPrincipalLines:(const void *)a5 shouldCancel:(const void *)a6
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (unsigned int (**)(void))a7;
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  uint64_t v13 = *(const void **)a4;
  uint64_t v12 = *((void *)a4 + 1);
  int64_t v14 = v12 - *(void *)a4;
  if (v12 == *(void *)a4)
  {
    long long v56 = xmmword_1C4C3B2A0;
    long long v57 = xmmword_1C4C3B2A0;
    goto LABEL_21;
  }
  if (v14 < 0) {
    sub_1C494A220();
  }
  uint64_t v15 = (double *)operator new(v12 - *(void *)a4);
  uint64_t v16 = &v15[2 * (v14 >> 4)];
  uint64_t v58 = v15;
  uint64_t v60 = v16;
  memcpy(v15, v13, v14);
  uint64_t v59 = v16;
  long long v56 = xmmword_1C4C3B2A0;
  long long v57 = xmmword_1C4C3B2A0;
  double v17 = 1.79769313e308;
  double v18 = -1.79769313e308;
  double v19 = -1.79769313e308;
  double v20 = 1.79769313e308;
  do
  {
    double v21 = *v15;
    if (v20 > *v15)
    {
      *(double *)&long long v56 = *v15;
      double v20 = v21;
      if (v19 >= v21)
      {
LABEL_7:
        double v22 = v15[1];
        if (v17 > v22) {
          goto LABEL_12;
        }
        goto LABEL_8;
      }
    }
    else if (v19 >= v21)
    {
      goto LABEL_7;
    }
    *((double *)&v56 + 1) = v21;
    double v19 = v21;
    double v22 = v15[1];
    if (v17 > v22)
    {
LABEL_12:
      *(double *)&long long v57 = v22;
      double v17 = v22;
      if (v18 >= v22) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
LABEL_8:
    if (v18 >= v22) {
      goto LABEL_4;
    }
LABEL_13:
    *((double *)&v57 + 1) = v22;
    double v18 = v22;
LABEL_4:
    v15 += 2;
  }
  while (v15 != v16);
  if (v18 - v17 == 0.0)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v23 = (id)qword_1EA3C9FE0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v14 >> 4;
      _os_log_impl(&dword_1C492D000, v23, OS_LOG_TYPE_ERROR, "Degenerate set of %lu points with zero height", (uint8_t *)&buf, 0xCu);
    }

    *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->top.__end_ = 0u;
    *(_OWORD *)&retstr->base.__end_ = 0u;
    *(_OWORD *)&retstr->median.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
    goto LABEL_75;
  }
LABEL_21:
  sub_1C4B5226C(&v58, (double *)&v56, (double **)v55);
  uint64_t v52 = 0;
  long double v53 = 0;
  double v54 = 0;
  uint64_t v25 = *(const void **)a5;
  uint64_t v24 = *((void *)a5 + 1);
  int64_t v26 = v24 - *(void *)a5;
  if (v24 == *(void *)a5)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    double v36 = (id)qword_1EA3C9FE0;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = ((char *)v59 - (char *)v58) >> 4;
      _os_log_impl(&dword_1C492D000, v36, OS_LOG_TYPE_ERROR, "Empty alphashape from ink with %lu points.", (uint8_t *)&buf, 0xCu);
    }

    *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->top.__end_ = 0u;
    *(_OWORD *)&retstr->base.__end_ = 0u;
    *(_OWORD *)&retstr->median.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
    uint64_t v37 = v55[0];
    if (v55[0]) {
      goto LABEL_74;
    }
    goto LABEL_75;
  }
  if (v26 < 0) {
    sub_1C494A220();
  }
  uint64_t v27 = (char *)operator new(v24 - *(void *)a5);
  uint64_t v52 = v27;
  double v54 = &v27[16 * (v26 >> 4)];
  memcpy(v27, v25, v26);
  long double v53 = v54;
  if (v11 && v11[2](v11))
  {
LABEL_57:
    *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->top.__end_ = 0u;
    *(_OWORD *)&retstr->base.__end_ = 0u;
    *(_OWORD *)&retstr->median.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
    goto LABEL_73;
  }
  uint64_t v29 = *(double **)a6;
  uint64_t v28 = (double *)*((void *)a6 + 1);
  if (v28 == *(double **)a6)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    int64_t v39 = (id)qword_1EA3C9FE0;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1C492D000, v39, OS_LOG_TYPE_ERROR, "Empty img points. TextLineStraightening not possible.", (uint8_t *)&buf, 2u);
    }

    goto LABEL_57;
  }
  long long v50 = xmmword_1C4C3B2A0;
  long long v51 = xmmword_1C4C3B2A0;
  double v30 = 1.79769313e308;
  double v31 = -1.79769313e308;
  double v32 = -1.79769313e308;
  double v33 = 1.79769313e308;
  do
  {
    double v34 = *v29;
    if (v33 > *v29)
    {
      *(double *)&long long v50 = *v29;
      double v33 = v34;
      if (v32 >= v34)
      {
LABEL_30:
        double v35 = v29[1];
        if (v30 > v35) {
          goto LABEL_35;
        }
        goto LABEL_31;
      }
    }
    else if (v32 >= v34)
    {
      goto LABEL_30;
    }
    *((double *)&v50 + 1) = v34;
    double v32 = v34;
    double v35 = v29[1];
    if (v30 > v35)
    {
LABEL_35:
      *(double *)&long long v51 = v35;
      double v30 = v35;
      if (v31 >= v35) {
        goto LABEL_27;
      }
      goto LABEL_36;
    }
LABEL_31:
    if (v31 >= v35) {
      goto LABEL_27;
    }
LABEL_36:
    *((double *)&v51 + 1) = v35;
    double v31 = v35;
LABEL_27:
    v29 += 2;
  }
  while (v29 != v28);
  sub_1C4B5226C((double **)a6, (double *)&v50, (double **)v49);
  double v38 = CoreHandwriting::adjust_for_scaling((double **)a6 + 3, (uint64_t)&buf, *(double *)&v50, *((double *)&v50 + 1), *(double *)&v51, *((double *)&v51 + 1));
  if (v11 && ((unsigned int (*)(unsigned int (**)(void), double))v11[2])(v11, v38))
  {
    *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->top.__end_ = 0u;
    *(_OWORD *)&retstr->base.__end_ = 0u;
    *(_OWORD *)&retstr->median.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
    goto LABEL_63;
  }
  sub_1C4B4AD64((char **)v49, (double **)&__p, 4.0);
  if (__p == v48)
  {
    uint64_t v40 = CHOSLogForCategory(10);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v45 = 0;
      _os_log_impl(&dword_1C492D000, v40, OS_LOG_TYPE_ERROR, "Empty alphashape from img.", v45, 2u);
    }

LABEL_61:
    *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->top.__end_ = 0u;
    *(_OWORD *)&retstr->base.__end_ = 0u;
    *(_OWORD *)&retstr->median.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
    double v41 = __p;
    if (!__p) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
  if (v11 && v11[2](v11)) {
    goto LABEL_61;
  }
  memset(v46, 0, sizeof(v46));
  sub_1C4B4D280((unint64_t *)&v52, (unint64_t *)&__p, v46);
  if (v11)
  {
    if (v11[2](v11)) {
      goto LABEL_61;
    }
  }
  CoreHandwriting::transformPrincipalLines((double **)&buf, v46, (uint64_t)v45);
  CoreHandwriting::adjust_back_for_scaling((double **)v45, (uint64_t)v44, *(double *)&v56, *((double *)&v56 + 1), *(double *)&v57, *((double *)&v57 + 1));
  sub_1C4B52ADC(v44, &v58, (uint64_t)v43);
  sub_1C4AF4D94((char **)v44, v43);
  sub_1C4A2F114((uint64_t)v43);
  sub_1C4AAA458(retstr, (uint64_t)v44);
  sub_1C4A2F114((uint64_t)v44);
  sub_1C4A2F114((uint64_t)v45);
  double v41 = __p;
  if (__p)
  {
LABEL_62:
    uint64_t v48 = v41;
    operator delete(v41);
  }
LABEL_63:
  if (v66)
  {
    unint64_t v67 = v66;
    operator delete(v66);
  }
  if (v64)
  {
    uint64_t v65 = v64;
    operator delete(v64);
  }
  if (v62)
  {
    uint64_t v63 = v62;
    operator delete(v62);
  }
  if ((void)buf)
  {
    *((void *)&buf + 1) = buf;
    operator delete((void *)buf);
  }
  if (v49[0])
  {
    v49[1] = v49[0];
    operator delete(v49[0]);
  }
LABEL_73:
  operator delete(v27);
  uint64_t v37 = v55[0];
  if (v55[0])
  {
LABEL_74:
    v55[1] = v37;
    operator delete(v37);
  }
LABEL_75:
  if (v58)
  {
    uint64_t v59 = v58;
    operator delete(v58);
  }

  return result;
}

+ (id)textStrokePointTransformationFromAffineTransformation:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  long long v8 = *(_OWORD *)&a3->a;
  long long v9 = v3;
  long long v10 = *(_OWORD *)&a3->tx;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4AFD9C8;
  v7[3] = &unk_1E64E3B10;
  BOOL v4 = (void *)MEMORY[0x1C8786E90](v7, a2);
  id v5 = (void *)MEMORY[0x1C8786E90]();

  return v5;
}

+ (id)reflowableTextLinesFromTransformedTextLines:(id)a3 mergeUnacceptableLines:(BOOL)a4 progress:(id)a5
{
  BOOL v679 = a4;
  uint64_t v748 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  v681 = v6;
  if (!objc_msgSend_count(v6, v8, v9, v10, v11, v12))
  {
    id v677 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_5;
  }
  uint64_t v672 = (uint64_t)v7;
  if (v7)
  {
    double v18 = (void *)MEMORY[0x1E4F28F90];
    uint64_t v19 = objc_msgSend_count(v6, v13, v14, v15, v16, v17);
    v669 = objc_msgSend_progressWithTotalUnitCount_parent_pendingUnitCount_(v18, v20, v19, v672, 50, v21);
  }
  else
  {
    v669 = 0;
  }
  long long v734 = 0u;
  long long v733 = 0u;
  long long v732 = 0u;
  long long v731 = 0u;
  id v23 = v6;
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v731, (uint64_t)v747, 16, v25);
  if (v31)
  {
    uint64_t v32 = *(void *)v732;
    double v33 = 1.79769313e308;
    double v34 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v732 != v32) {
          objc_enumerationMutation(v23);
        }
        double v36 = *(void **)(*((void *)&v731 + 1) + 8 * i);
        objc_msgSend_boundingBox(v36, v26, v27, v28, v29, v30);
        double v38 = v37;
        objc_msgSend_boundingBox(v36, v39, v40, v41, v42, v43);
        double v33 = fmin(v33, v38);
        double v34 = fmax(v34, v44);
      }
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v731, (uint64_t)v747, 16, v30);
    }
    while (v31);
  }
  else
  {
    double v33 = 1.79769313e308;
    double v34 = -1.79769313e308;
  }

  v695 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v45, v46, v47, v48, v49);
  long long v730 = 0u;
  long long v729 = 0u;
  long long v728 = 0u;
  long long v727 = 0u;
  obuint64_t j = v23;
  uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v727, (uint64_t)v746, 16, v51);
  if (v57)
  {
    uint64_t v687 = *(void *)v728;
    double v685 = v34 - v33 + 1.0e-10;
    double v58 = -1.79769313e308;
    double v59 = 1.79769313e308;
    double v60 = 1.79769313e308;
    double v61 = -1.79769313e308;
    do
    {
      uint64_t v62 = 0;
      uint64_t v689 = v57;
      do
      {
        while (1)
        {
          if (*(void *)v728 != v687) {
            objc_enumerationMutation(obj);
          }
          uint64_t v63 = *(void **)(*((void *)&v727 + 1) + 8 * v62);
          if (objc_msgSend_count(v695, v52, v53, v54, v55, v56)) {
            break;
          }
          objc_msgSend_addObject_(v695, v64, (uint64_t)v63, v66, v67, v68);
          objc_msgSend_boundingBox(v63, v192, v193, v194, v195, v196);
          double v59 = v197;
          double v58 = v198;
          double v60 = v199;
          double v61 = v200;
          if (++v62 == v57) {
            goto LABEL_123;
          }
        }
        objc_msgSend_boundingBox(v63, v64, v65, v66, v67, v68);
        double v70 = v69;
        objc_msgSend_boundingBox(v63, v71, v72, v73, v74, v75);
        double v77 = v76;
        objc_msgSend_boundingBox(v63, v78, v79, v80, v81, v82);
        double v84 = v83;
        objc_msgSend_boundingBox(v63, v85, v86, v87, v88, v89);
        double v91 = v90;
        objc_msgSend_boundingBox(v63, v92, v93, v94, v95, v96);
        double v102 = fmin(v70, v61) - fmax(v77, v60);
        double v105 = (v104 - v103) / v685;
        BOOL v106 = v105 >= 0.7 || v102 <= 0.0;
        if (v106 && v105 >= 0.4 && fmin(v84, v58) - fmax(v91, v59) >= 0.0 || !v63) {
          goto LABEL_110;
        }
        objc_msgSend_points(v63, v97, v98, v99, v100, v101);
        uint64_t v108 = __p[1];
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        if (v108 == __p[0])
        {
LABEL_110:
          objc_msgSend_addObject_(v695, v97, (uint64_t)v63, v99, v100, v101);
          goto LABEL_111;
        }
        unint64_t v109 = 0;
        uint64_t v110 = -1;
        double v111 = 0.25;
        uint64_t v691 = v62;
        while (v109 < objc_msgSend_count(v695, v97, v107, v99, v100, v101))
        {
          uint64_t v112 = objc_msgSend_objectAtIndexedSubscript_(v695, v97, v109, v99, v100, v101);
          objc_msgSend_boundingBox(v63, v113, v114, v115, v116, v117);
          double v119 = v118;
          objc_msgSend_boundingBox(v112, v120, v121, v122, v123, v124);
          double v126 = v125;
          objc_msgSend_boundingBox(v63, v127, v128, v129, v130, v131);
          double v133 = v132;
          objc_msgSend_boundingBox(v112, v134, v135, v136, v137, v138);
          if (fmin(v119, v126) - fmax(v133, v144) > 0.0) {
            goto LABEL_102;
          }
          objc_msgSend_principalLines(v112, v139, v140, v141, v142, v143);
          objc_msgSend_principalLines(v112, v145, v146, v147, v148, v149);
          long double v150 = atan2(*(double *)(*(void *)&buf[24] + 24) - *((double *)__src[1] + 1), *(double *)(*(void *)&buf[24] + 16) - *(double *)__src[1]);
          double v156 = tan(v150);
          if (v744[1])
          {
            *(void **)&long long v745 = v744[1];
            operator delete(v744[1]);
          }
          if (*(void *)&v743[1])
          {
            *((void *)&v743[1] + 1) = *(void *)&v743[1];
            operator delete(*(void **)&v743[1]);
          }
          if (*(void *)&buf[24])
          {
            *(void *)&v743[0] = *(void *)&buf[24];
            operator delete(*(void **)&buf[24]);
          }
          if (*(void *)buf)
          {
            *(void *)&uint8_t buf[8] = *(void *)buf;
            operator delete(*(void **)buf);
          }
          if (v707[1])
          {
            *(void **)v708 = v707[1];
            operator delete(v707[1]);
          }
          if (v706[0])
          {
            v706[1] = v706[0];
            operator delete(v706[0]);
          }
          if (__src[1])
          {
            *(void **)v705 = __src[1];
            operator delete(__src[1]);
          }
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          objc_msgSend_points(v112, v151, v152, v153, v154, v155);
          int64_t v162 = (char *)__p[1] - (char *)__p[0];
          if (__p[1] != __p[0])
          {
            uint64_t v163 = v162 >> 4;
            if ((unint64_t)(v162 >> 4) <= 1) {
              uint64_t v163 = 1;
            }
            uint64_t v164 = (double *)((char *)__p[0] + 8);
            double v165 = 1.79769313e308;
            double v166 = -1.79769313e308;
            do
            {
              double v167 = *v164 - *(v164 - 1) * v156;
              if (v167 <= v165) {
                double v165 = *v164 - *(v164 - 1) * v156;
              }
              if (v167 >= v166) {
                double v166 = *v164 - *(v164 - 1) * v156;
              }
              v164 += 2;
              --v163;
            }
            while (v163);
LABEL_65:
            __p[1] = __p[0];
            operator delete(__p[0]);
            goto LABEL_66;
          }
          double v165 = 1.79769313e308;
          double v166 = -1.79769313e308;
          if (__p[1]) {
            goto LABEL_65;
          }
LABEL_66:
          objc_msgSend_points(v63, v157, v158, v159, v160, v161);
          id v693 = (id)v110;
          __p[1] = 0;
          __p[0] = 0;
          __src[0] = 0;
          double v173 = *(double **)buf;
          uint64_t v174 = *(double **)&buf[8];
          if (*(void *)buf != *(void *)&buf[8])
          {
            uint64_t v175 = 0;
            uint64_t v176 = 0;
            uint64_t v177 = 0;
            while (1)
            {
              double v178 = v173[1] - *v173 * v156;
              if (v178 < v165 || v178 > v166) {
                goto LABEL_69;
              }
              if (v175 >= v177) {
                break;
              }
              *(_OWORD *)uint64_t v175 = *(_OWORD *)v173;
              v175 += 16;
LABEL_69:
              v173 += 2;
              if (v173 == v174)
              {
                __src[0] = v177;
                __p[0] = v176;
                double v173 = *(double **)buf;
                uint64_t v57 = v689;
                uint64_t v62 = v691;
                if (*(void *)buf) {
                  goto LABEL_93;
                }
                goto LABEL_94;
              }
            }
            uint64_t v180 = (v175 - v176) >> 4;
            unint64_t v181 = v180 + 1;
            if ((unint64_t)(v180 + 1) >> 60)
            {
              __src[0] = v177;
              __p[0] = v176;
              __p[1] = v175;
              sub_1C494A220();
            }
            if ((v177 - v176) >> 3 > v181) {
              unint64_t v181 = (v177 - v176) >> 3;
            }
            if ((unint64_t)(v177 - v176) >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v182 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v182 = v181;
            }
            if (v182)
            {
              if (v182 >> 60)
              {
                __src[0] = v177;
                __p[0] = v176;
                __p[1] = v175;
                sub_1C4949AA8();
              }
              uint64_t v183 = (char *)operator new(16 * v182);
              uint64_t v184 = &v183[16 * v180];
              *(_OWORD *)uint64_t v184 = *(_OWORD *)v173;
              if (v175 != v176)
              {
LABEL_84:
                uint64_t v185 = v184;
                do
                {
                  uint64_t v186 = v185 - 16;
                  *((_OWORD *)v185 - 1) = *((_OWORD *)v175 - 1);
                  v175 -= 16;
                  v185 -= 16;
                }
                while (v175 != v176);
                uint64_t v177 = &v183[16 * v182];
                uint64_t v175 = v184 + 16;
                if (v176) {
LABEL_87:
                }
                  operator delete(v176);
LABEL_88:
                uint64_t v176 = v186;
                goto LABEL_69;
              }
            }
            else
            {
              uint64_t v183 = 0;
              uint64_t v184 = (char *)(16 * v180);
              *(_OWORD *)(16 * v180) = *(_OWORD *)v173;
              if (v175 != v176) {
                goto LABEL_84;
              }
            }
            uint64_t v186 = v184;
            uint64_t v177 = &v183[16 * v182];
            uint64_t v175 = v184 + 16;
            if (v176) {
              goto LABEL_87;
            }
            goto LABEL_88;
          }
          uint64_t v176 = 0;
          uint64_t v175 = 0;
          if (*(void *)buf)
          {
LABEL_93:
            *(void *)&uint8_t buf[8] = v173;
            operator delete(v173);
          }
LABEL_94:
          objc_msgSend_points(v63, v168, v169, v170, v171, v172);
          uint64_t v187 = *(void *)buf;
          uint64_t v188 = *(void *)&buf[8];
          if (*(void *)buf)
          {
            *(void *)&uint8_t buf[8] = *(void *)buf;
            operator delete(*(void **)buf);
          }
          uint64_t v189 = (v188 - v187) >> 4;
          double v190 = (double)(unint64_t)((v175 - v176) >> 4) / (double)(unint64_t)v189;
          BOOL v191 = v190 <= v111;
          if (v190 > v111) {
            double v111 = (double)(unint64_t)((v175 - v176) >> 4) / (double)(unint64_t)v189;
          }
          uint64_t v110 = (uint64_t)v693;
          if (!v191) {
            uint64_t v110 = v109;
          }
          if (v176)
          {
            __p[1] = v176;
            operator delete(v176);
          }
LABEL_102:

          ++v109;
        }
        if (v110 < 0) {
          goto LABEL_110;
        }
        uint64_t v201 = objc_msgSend_objectAtIndexedSubscript_(v695, v97, v110, v99, v100, v101);
        objc_msgSend_boundingBox(v63, v202, v203, v204, v205, v206);
        double v208 = v207;
        objc_msgSend_boundingBox(v201, v209, v210, v211, v212, v213);
        if (v208 >= v218)
        {
          objc_msgSend_mergeTransformedText_(v201, v214, (uint64_t)v63, v215, v216, v217);
        }
        else
        {
          objc_msgSend_mergeTransformedText_(v63, v214, (uint64_t)v201, v215, v216, v217);
          objc_msgSend_setObject_atIndexedSubscript_(v695, v219, (uint64_t)v63, v110, v220, v221);
        }

LABEL_111:
        objc_msgSend_boundingBox(v63, v222, v223, v224, v225, v226);
        if (v59 > v227) {
          double v59 = v227;
        }
        if (v58 < v228) {
          double v58 = v228;
        }
        if (v60 > v229) {
          double v60 = v229;
        }
        if (v61 < v230) {
          double v61 = v230;
        }
        ++v62;
      }
      while (v62 != v57);
LABEL_123:
      uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v727, (uint64_t)v746, 16, v56);
    }
    while (v57);
  }

  objc_msgSend_array(MEMORY[0x1E4F1CA48], v231, v232, v233, v234, v235);
  id v677 = (id)objc_claimAutoreleasedReturnValue();
  id obja = &stru_1F20141C8;
  unint64_t v686 = 0;
  double v670 = 1.0;
  while (v686 < objc_msgSend_count(v695, v236, v237, v238, v239, v240))
  {
    v692 = objc_msgSend_objectAtIndexedSubscript_(v695, v241, v686, v242, v243, v244);
    objc_msgSend_orientation(v692, v245, v246, v247, v248, v249);
    double v251 = v250;
    objc_msgSend_lineHeight(v692, v252, v253, v254, v255, v256);
    double v258 = v257;
    uint64_t v264 = objc_msgSend_locale(v692, v259, v260, v261, v262, v263);
    v673 = objc_msgSend_languageCode(v264, v265, v266, v267, v268, v269);

    uint64_t v270 = objc_opt_class();
    uint64_t v276 = objc_msgSend_locale(v692, v271, v272, v273, v274, v275);
    int v676 = objc_msgSend_supportsReflowForLocale_(v270, v277, (uint64_t)v276, v278, v279, v280);

    uint64_t v281 = objc_opt_class();
    uint64_t v287 = objc_msgSend_strokeClassification(v692, v282, v283, v284, v285, v286);
    unsigned int isStrokeClassificationMath = objc_msgSend_isStrokeClassificationMath_(v281, v288, v287, v289, v290, v291);
    if (!v679) {
      goto LABEL_131;
    }
    int v297 = v676 ^ 1;
    if (fabs(v251) > 0.2) {
      int v297 = 1;
    }
    if ((v297 | isStrokeClassificationMath) == 1)
    {
      v741 = v692;
      uint64_t v298 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v292, (uint64_t)&v741, 1, v295, v296);
    }
    else
    {
LABEL_131:
      uint64_t v298 = objc_msgSend_splitIntoTokens(v692, v292, v293, v294, v295, v296);
    }
    uint64_t v304 = (void *)v298;
    v682 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v299, v300, v301, v302, v303);
    long long v725 = 0u;
    long long v726 = 0u;
    long long v723 = 0u;
    long long v724 = 0u;
    id v680 = v304;
    uint64_t v674 = objc_msgSend_countByEnumeratingWithState_objects_count_(v680, v305, (uint64_t)&v723, (uint64_t)v740, 16, v306);
    if (v674)
    {
      uint64_t v678 = *(void *)v724;
      do
      {
        for (uint64_t j = 0; j != v674; ++j)
        {
          if (*(void *)v724 != v678) {
            objc_enumerationMutation(v680);
          }
          v690 = *(void **)(*((void *)&v723 + 1) + 8 * j);
          double v312 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v307, v308, v309, v310, v311);
          uint64_t v318 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v313, v314, v315, v316, v317);
          long long v721 = 0u;
          long long v722 = 0u;
          long long v719 = 0u;
          long long v720 = 0u;
          uint64_t v324 = objc_msgSend_textStrokes(v690, v319, v320, v321, v322, v323);
          uint64_t v332 = objc_msgSend_countByEnumeratingWithState_objects_count_(v324, v325, (uint64_t)&v719, (uint64_t)v739, 16, v326);
          if (v332)
          {
            uint64_t v333 = *(void *)v720;
            do
            {
              for (uint64_t k = 0; k != v332; ++k)
              {
                if (*(void *)v720 != v333) {
                  objc_enumerationMutation(v324);
                }
                uint64_t v335 = objc_msgSend_strokeIdentifier(*(void **)(*((void *)&v719 + 1) + 8 * k), v327, v328, v329, v330, v331);
                objc_msgSend_addObject_(v312, v336, (uint64_t)v335, v337, v338, v339);
              }
              uint64_t v332 = objc_msgSend_countByEnumeratingWithState_objects_count_(v324, v327, (uint64_t)&v719, (uint64_t)v739, 16, v331);
            }
            while (v332);
          }

          long long v717 = 0u;
          long long v718 = 0u;
          long long v715 = 0u;
          long long v716 = 0u;
          objc_msgSend_segments(v690, v340, v341, v342, v343, v344);
          id v694 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v352 = objc_msgSend_countByEnumeratingWithState_objects_count_(v694, v345, (uint64_t)&v715, (uint64_t)v738, 16, v346);
          if (v352)
          {
            uint64_t v353 = *(void *)v716;
            do
            {
              for (uint64_t m = 0; m != v352; ++m)
              {
                if (*(void *)v716 != v353) {
                  objc_enumerationMutation(v694);
                }
                double v355 = *(void **)(*((void *)&v715 + 1) + 8 * m);
                long long v711 = 0u;
                long long v712 = 0u;
                long long v713 = 0u;
                long long v714 = 0u;
                long long v356 = objc_msgSend_supportStrokes(v355, v347, v348, v349, v350, v351);
                uint64_t v364 = objc_msgSend_countByEnumeratingWithState_objects_count_(v356, v357, (uint64_t)&v711, (uint64_t)v737, 16, v358);
                if (v364)
                {
                  uint64_t v365 = *(void *)v712;
                  do
                  {
                    for (uint64_t n = 0; n != v364; ++n)
                    {
                      if (*(void *)v712 != v365) {
                        objc_enumerationMutation(v356);
                      }
                      BOOL v367 = objc_msgSend_strokeIdentifier(*(void **)(*((void *)&v711 + 1) + 8 * n), v359, v360, v361, v362, v363);
                      objc_msgSend_addObject_(v318, v368, (uint64_t)v367, v369, v370, v371);
                    }
                    uint64_t v364 = objc_msgSend_countByEnumeratingWithState_objects_count_(v356, v359, (uint64_t)&v711, (uint64_t)v737, 16, v363);
                  }
                  while (v364);
                }
              }
              uint64_t v352 = objc_msgSend_countByEnumeratingWithState_objects_count_(v694, v347, (uint64_t)&v715, (uint64_t)v738, 16, v351);
            }
            while (v352);
          }

          uint64_t v377 = objc_msgSend_textStrokes(v690, v372, v373, v374, v375, v376);
          objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v378, (uint64_t)v377, v379, v380, v381);
          double v383 = v382;
          double v385 = v384;
          double v387 = v386;
          double v389 = v388;

          if (v690)
          {
            objc_msgSend_principalLines(v690, v390, v391, v392, v393, v394);
          }
          else
          {
            long long v745 = 0u;
            *(_OWORD *)v744 = 0u;
            memset(v743, 0, sizeof(v743));
            memset(buf, 0, sizeof(buf));
          }
          if ((objc_msgSend_fromCachedTokens(v692, v390, v391, v392, v393, v394) & 1) == 0)
          {
            objc_msgSend_fixPrincipalLinesPosition_useAltString_skipAmbiguousCharacters_(a1, v395, (uint64_t)v690, 0, 1, v399);
            sub_1C49B7D84(buf, (char *)__p[0], (char *)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 4);
            sub_1C49B7D84(&buf[24], (char *)__src[1], *(char **)v705, (uint64_t)(*(void *)v705 - (unint64_t)__src[1]) >> 4);
            sub_1C49B7D84(&v743[1], (char *)v706[0], (char *)v706[1], ((char *)v706[1] - (char *)v706[0]) >> 4);
            sub_1C49B7D84(&v744[1], (char *)v707[1], *(char **)v708, (uint64_t)(*(void *)v708 - (unint64_t)v707[1]) >> 4);
            if (v707[1])
            {
              *(void **)v708 = v707[1];
              operator delete(v707[1]);
            }
            if (v706[0])
            {
              v706[1] = v706[0];
              operator delete(v706[0]);
            }
            if (__src[1])
            {
              *(void **)v705 = __src[1];
              operator delete(__src[1]);
            }
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          double v400 = objc_msgSend_string(v690, v395, v396, v397, v398, v399);
          uint64_t v406 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v401, v402, v403, v404, v405);
          uint64_t v411 = objc_msgSend_stringByTrimmingCharactersInSet_(v400, v407, (uint64_t)v406, v408, v409, v410);

          long long v709 = 0u;
          long long v710 = 0u;
          *(_OWORD *)v707 = 0u;
          *(_OWORD *)v708 = 0u;
          *(_OWORD *)v705 = 0u;
          *(_OWORD *)v706 = 0u;
          *(_OWORD *)__p = 0u;
          *(_OWORD *)__src = 0u;
          uint64_t v412 = objc_opt_class();
          if (v412)
          {
            objc_msgSend_convertToCHPrincipalLines_(v412, v413, (uint64_t)buf, v414, v415, v416);
          }
          else
          {
            long long v709 = 0u;
            long long v710 = 0u;
            *(_OWORD *)v707 = 0u;
            *(_OWORD *)v708 = 0u;
            *(_OWORD *)v705 = 0u;
            *(_OWORD *)v706 = 0u;
            *(_OWORD *)__p = 0u;
            *(_OWORD *)__src = 0u;
          }
          id v417 = objc_opt_class();
          v702[4] = *(_OWORD *)v707;
          v702[5] = *(_OWORD *)v708;
          v702[6] = v709;
          v702[7] = v710;
          v702[0] = *(_OWORD *)__p;
          v702[1] = *(_OWORD *)__src;
          v702[2] = *(_OWORD *)v705;
          v702[3] = *(_OWORD *)v706;
          uint64_t v421 = objc_msgSend_textSizeFromPrincipalLines_string_(v417, v418, (uint64_t)v702, (uint64_t)v411, v419, v420);
          if (v387 == 0.0) {
            double v422 = 1.0;
          }
          else {
            double v422 = v387;
          }
          if (v389 == 0.0) {
            double v423 = 1.0;
          }
          else {
            double v423 = v389;
          }
          *(double *)__p = (*(double *)__p - v383) / v422;
          *(double *)&__p[1] = (*(double *)&__p[1] - v385) / v423;
          *(double *)__src = (*(double *)__src - v383) / v422;
          *(double *)&__src[1] = (*(double *)&__src[1] - v385) / v423;
          *(double *)v705 = (*(double *)v705 - v383) / v422;
          *(double *)&v705[2] = (*(double *)&v705[2] - v385) / v423;
          *(double *)v706 = (*(double *)v706 - v383) / v422;
          *(double *)&v706[1] = (*(double *)&v706[1] - v385) / v423;
          *(double *)v707 = (*(double *)v707 - v383) / v422;
          *(double *)&v707[1] = (*(double *)&v707[1] - v385) / v423;
          *(double *)v708 = (*(double *)v708 - v383) / v422;
          *(double *)&v708[2] = (*(double *)&v708[2] - v385) / v423;
          *(double *)&long long v709 = (*(double *)&v709 - v383) / v422;
          *((double *)&v709 + 1) = (*((double *)&v709 + 1) - v385) / v423;
          *(double *)&long long v710 = (*(double *)&v710 - v383) / v422;
          *((double *)&v710 + 1) = (*((double *)&v710 + 1) - v385) / v423;
          v424 = objc_opt_class();
          double v429 = 1.0 / v389;
          if (v389 == 0.0) {
            double v429 = 1.0;
          }
          uint64_t v430 = objc_msgSend_scaledSize_scale_(v424, v425, (uint64_t)v421, v426, v427, v428, v429);

          long long v436 = objc_msgSend_tokens(v690, v431, v432, v433, v434, v435);
          long long v442 = objc_msgSend_firstObject(v436, v437, v438, v439, v440, v441);
          unint64_t v448 = objc_msgSend_properties(v442, v443, v444, v445, v446, v447);

          uint64_t v449 = [CHReflowableTextResultToken alloc];
          v701[4] = *(_OWORD *)v707;
          v701[5] = *(_OWORD *)v708;
          v701[6] = v709;
          v701[7] = v710;
          v701[0] = *(_OWORD *)__p;
          v701[1] = *(_OWORD *)__src;
          v701[2] = *(_OWORD *)v705;
          v701[3] = *(_OWORD *)v706;
          hasPrecedingSpace = objc_msgSend_initWithString_strokeIdentifiers_nonTextStrokeIdentifiers_principalLines_textSize_bounds_hasPrecedingSpace_(v449, v450, (uint64_t)v411, (uint64_t)v312, (uint64_t)v318, (uint64_t)v701, v430, (v448 >> 5) & 1, v383, v385, v387, v389);
          objc_msgSend_addObject_(v682, v452, (uint64_t)hasPrecedingSpace, v453, v454, v455);

          if (v744[1])
          {
            *(void **)&long long v745 = v744[1];
            operator delete(v744[1]);
          }
          if (*(void *)&v743[1])
          {
            *((void *)&v743[1] + 1) = *(void *)&v743[1];
            operator delete(*(void **)&v743[1]);
          }
          if (*(void *)&buf[24])
          {
            *(void *)&v743[0] = *(void *)&buf[24];
            operator delete(*(void **)&buf[24]);
          }
          if (*(void *)buf)
          {
            *(void *)&uint8_t buf[8] = *(void *)buf;
            operator delete(*(void **)buf);
          }
        }
        uint64_t v674 = objc_msgSend_countByEnumeratingWithState_objects_count_(v680, v307, (uint64_t)&v723, (uint64_t)v740, 16, v311);
      }
      while (v674);
    }

    if (v686 + 1 >= objc_msgSend_count(v695, v456, v457, v458, v459, v460))
    {
      v555 = objc_opt_class();
      if (v692)
      {
        objc_msgSend_principalLines(v692, v550, v551, v552, v553, v554);
      }
      else
      {
        *(_OWORD *)v707 = 0u;
        *(_OWORD *)v708 = 0u;
        *(_OWORD *)v705 = 0u;
        *(_OWORD *)v706 = 0u;
        *(_OWORD *)__p = 0u;
        *(_OWORD *)__src = 0u;
      }
      v572 = objc_msgSend_string(v692, v550, v551, v552, v553, v554);
      objc_msgSend_estimatedLeadingForPrincipalLines_transcription_(v555, v573, (uint64_t)__p, (uint64_t)v572, v574, v575);
      double v517 = v576;

      if (v707[1])
      {
        *(void **)v708 = v707[1];
        operator delete(v707[1]);
      }
      if (v706[0])
      {
        v706[1] = v706[0];
        operator delete(v706[0]);
      }
      if (__src[1])
      {
        *(void **)v705 = __src[1];
        operator delete(__src[1]);
      }
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    else
    {
      v465 = objc_msgSend_objectAtIndexedSubscript_(v695, v461, v686 + 1, v462, v463, v464);
      objc_msgSend_principalLines(v692, v466, v467, v468, v469, v470);
      double v471 = *(double *)__src[1];
      objc_msgSend_principalLines(v465, v472, v473, v474, v475, v476);
      double v482 = **(double **)&buf[24];
      if (v744[1])
      {
        *(void **)&long long v745 = v744[1];
        operator delete(v744[1]);
      }
      if (*(void *)&v743[1])
      {
        *((void *)&v743[1] + 1) = *(void *)&v743[1];
        operator delete(*(void **)&v743[1]);
      }
      if (*(void *)&buf[24])
      {
        *(void *)&v743[0] = *(void *)&buf[24];
        operator delete(*(void **)&buf[24]);
      }
      if (*(void *)buf)
      {
        *(void *)&uint8_t buf[8] = *(void *)buf;
        operator delete(*(void **)buf);
      }
      if (v707[1])
      {
        *(void **)v708 = v707[1];
        operator delete(v707[1]);
      }
      if (v706[0])
      {
        v706[1] = v706[0];
        operator delete(v706[0]);
      }
      if (__src[1])
      {
        *(void **)v705 = __src[1];
        operator delete(__src[1]);
      }
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      objc_msgSend_principalLines(v692, v477, v478, v479, v480, v481);
      double v483 = *((double *)__src[1] + 2);
      objc_msgSend_principalLines(v465, v484, v485, v486, v487, v488);
      double v494 = *(double *)(*(void *)&buf[24] + 16);
      if (v744[1])
      {
        *(void **)&long long v745 = v744[1];
        operator delete(v744[1]);
      }
      if (*(void *)&v743[1])
      {
        *((void *)&v743[1] + 1) = *(void *)&v743[1];
        operator delete(*(void **)&v743[1]);
      }
      if (*(void *)&buf[24])
      {
        *(void *)&v743[0] = *(void *)&buf[24];
        operator delete(*(void **)&buf[24]);
      }
      if (*(void *)buf)
      {
        *(void *)&uint8_t buf[8] = *(void *)buf;
        operator delete(*(void **)buf);
      }
      if (v707[1])
      {
        *(void **)v708 = v707[1];
        operator delete(v707[1]);
      }
      if (v706[0])
      {
        v706[1] = v706[0];
        operator delete(v706[0]);
      }
      if (__src[1])
      {
        *(void **)v705 = __src[1];
        operator delete(__src[1]);
      }
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      double v495 = fmax(v471, v482);
      double v496 = fmax(v483, v494);
      if (v495 < v496)
      {
        long long v699 = 0u;
        long long v700 = 0u;
        long long v697 = 0u;
        long long v698 = 0u;
        id v497 = objc_msgSend_numberWithDouble_(NSNumber, v489, v490, v491, v492, v493);
        v735[0] = v497;
        char v503 = objc_msgSend_numberWithDouble_(NSNumber, v498, v499, v500, v501, v502, v496);
        v735[1] = v503;
        long long v507 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v504, (uint64_t)v735, 2, v505, v506);

        uint64_t v515 = objc_msgSend_countByEnumeratingWithState_objects_count_(v507, v508, (uint64_t)&v697, (uint64_t)v736, 16, v509);
        if (!v515)
        {
          double v517 = 0.0;
          goto LABEL_277;
        }
        uint64_t v516 = *(void *)v698;
        double v517 = 0.0;
        while (1)
        {
          for (iuint64_t i = 0; ii != v515; ++ii)
          {
            if (*(void *)v698 != v516) {
              objc_enumerationMutation(v507);
            }
            CGRect v520 = *(void **)(*((void *)&v697 + 1) + 8 * ii);
            objc_msgSend_principalLines(v692, v510, v511, v512, v513, v514);
            objc_msgSend_floatValue(v520, v521, v522, v523, v524, v525);
            double v532 = *(double *)__src[1];
            double v533 = *((double *)__src[1] + 2);
            if (*(double *)__src[1] == v533)
            {
              double v534 = *((double *)__src[1] + 1);
              v535 = v707[1];
              if (!v707[1]) {
                goto LABEL_236;
              }
LABEL_235:
              *(void *)v708 = v535;
              operator delete(v535);
              goto LABEL_236;
            }
            double v546 = *((double *)__src[1] + 1);
            double v547 = (*((double *)__src[1] + 3) - v546) / (v533 - v532);
            double v534 = v546 - v532 * v547 + v547 * v531;
            v535 = v707[1];
            if (v707[1]) {
              goto LABEL_235;
            }
LABEL_236:
            if (v706[0])
            {
              v706[1] = v706[0];
              operator delete(v706[0]);
            }
            if (__src[1])
            {
              *(void **)v705 = __src[1];
              operator delete(__src[1]);
            }
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
            objc_msgSend_principalLines(v465, v526, v527, v528, v529, v530);
            objc_msgSend_floatValue(v520, v536, v537, v538, v539, v540);
            double v542 = *(double *)__src[1];
            double v543 = *((double *)__src[1] + 2);
            if (*(double *)__src[1] == v543)
            {
              double v544 = *((double *)__src[1] + 1);
              v545 = v707[1];
              if (!v707[1]) {
                goto LABEL_245;
              }
LABEL_244:
              *(void *)v708 = v545;
              operator delete(v545);
              goto LABEL_245;
            }
            double v548 = *((double *)__src[1] + 1);
            double v549 = (*((double *)__src[1] + 3) - v548) / (v543 - v542);
            double v544 = v548 - v542 * v549 + v549 * v541;
            v545 = v707[1];
            if (v707[1]) {
              goto LABEL_244;
            }
LABEL_245:
            if (v706[0])
            {
              v706[1] = v706[0];
              operator delete(v706[0]);
            }
            if (__src[1])
            {
              *(void **)v705 = __src[1];
              operator delete(__src[1]);
            }
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
            double v519 = vabdd_f64(v534, v544);
            if (v519 > v517) {
              double v517 = v519;
            }
          }
          uint64_t v515 = objc_msgSend_countByEnumeratingWithState_objects_count_(v507, v510, (uint64_t)&v697, (uint64_t)v736, 16, v514);
          if (!v515)
          {
LABEL_277:

            goto LABEL_278;
          }
        }
      }
      v556 = objc_opt_class();
      objc_msgSend_principalLines(v692, v557, v558, v559, v560, v561);
      v567 = objc_msgSend_string(v692, v562, v563, v564, v565, v566);
      objc_msgSend_estimatedLeadingForPrincipalLines_transcription_(v556, v568, (uint64_t)__p, (uint64_t)v567, v569, v570);
      double v517 = v571;

      if (v707[1])
      {
        *(void **)v708 = v707[1];
        operator delete(v707[1]);
      }
      if (v706[0])
      {
        v706[1] = v706[0];
        operator delete(v706[0]);
      }
      if (__src[1])
      {
        *(void **)v705 = __src[1];
        operator delete(__src[1]);
      }
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
LABEL_278:
    }
    v582 = objc_msgSend_textStrokes(v692, v577, v578, v579, v580, v581);
    objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v583, (uint64_t)v582, v584, v585, v586);
    double v588 = v587;
    double v590 = v589;
    double v592 = v591;
    double v594 = v593;

    long long v709 = 0u;
    long long v710 = 0u;
    *(_OWORD *)v707 = 0u;
    *(_OWORD *)v708 = 0u;
    *(_OWORD *)v705 = 0u;
    *(_OWORD *)v706 = 0u;
    *(_OWORD *)__p = 0u;
    *(_OWORD *)__src = 0u;
    v600 = objc_opt_class();
    if (v692)
    {
      objc_msgSend_principalLines(v692, v595, v596, v597, v598, v599);
      if (v600) {
        goto LABEL_281;
      }
    }
    else
    {
      long long v745 = 0u;
      *(_OWORD *)v744 = 0u;
      memset(v743, 0, sizeof(v743));
      memset(buf, 0, sizeof(buf));
      if (v600)
      {
LABEL_281:
        objc_msgSend_convertToCHPrincipalLines_(v600, v595, (uint64_t)buf, v597, v598, v599);
        v601 = v744[1];
        if (!v744[1]) {
          goto LABEL_283;
        }
LABEL_282:
        *(void *)&long long v745 = v601;
        operator delete(v601);
        goto LABEL_283;
      }
    }
    long long v709 = 0u;
    long long v710 = 0u;
    *(_OWORD *)v707 = 0u;
    *(_OWORD *)v708 = 0u;
    *(_OWORD *)v705 = 0u;
    *(_OWORD *)v706 = 0u;
    *(_OWORD *)__p = 0u;
    *(_OWORD *)__src = 0u;
    v601 = v744[1];
    if (v744[1]) {
      goto LABEL_282;
    }
LABEL_283:
    if (*(void *)&v743[1])
    {
      *((void *)&v743[1] + 1) = *(void *)&v743[1];
      operator delete(*(void **)&v743[1]);
    }
    if (*(void *)&buf[24])
    {
      *(void *)&v743[0] = *(void *)&buf[24];
      operator delete(*(void **)&buf[24]);
    }
    if (*(void *)buf)
    {
      *(void *)&uint8_t buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
    }
    if (v592 == 0.0) {
      double v602 = 1.0;
    }
    else {
      double v602 = v592;
    }
    if (v594 == 0.0) {
      double v603 = 1.0;
    }
    else {
      double v603 = v594;
    }
    *(double *)__p = (*(double *)__p - v588) / v602;
    *(double *)&__p[1] = (*(double *)&__p[1] - v590) / v603;
    *(double *)__src = (*(double *)__src - v588) / v602;
    *(double *)&__src[1] = (*(double *)&__src[1] - v590) / v603;
    *(double *)v705 = (*(double *)v705 - v588) / v602;
    *(double *)&v705[2] = (*(double *)&v705[2] - v590) / v603;
    *(double *)v706 = (*(double *)v706 - v588) / v602;
    *(double *)&v706[1] = (*(double *)&v706[1] - v590) / v603;
    *(double *)v707 = (*(double *)v707 - v588) / v602;
    *(double *)&v707[1] = (*(double *)&v707[1] - v590) / v603;
    *(double *)v708 = (*(double *)v708 - v588) / v602;
    *(double *)&v708[2] = (*(double *)&v708[2] - v590) / v603;
    *(double *)&long long v709 = (*(double *)&v709 - v588) / v602;
    *((double *)&v709 + 1) = (*((double *)&v709 + 1) - v590) / v603;
    *(double *)&long long v710 = (*(double *)&v710 - v588) / v602;
    *((double *)&v710 + 1) = (*((double *)&v710 + 1) - v590) / v603;
    if (objc_msgSend_strokeClassification(v692, v595, v596, v597, v598, v599) == 2) {
      uint64_t v609 = 2;
    }
    else {
      uint64_t v609 = 1;
    }
    uint64_t v610 = v676 ^ 1 | isStrokeClassificationMath;
    uint64_t v611 = v610;
    if (v686)
    {
      if (v258 / v670 > 2.0
        || v258 / v670 < 0.5
        || (uint64_t v611 = v676 ^ 1 | isStrokeClassificationMath,
            (objc_msgSend_isEqualToString_(v673, v604, (uint64_t)obja, v606, v607, v608) & 1) == 0))
      {
        v612 = objc_msgSend_lastObject(v677, v604, v605, v606, v607, v608);
        objc_msgSend_setHasEndingLineBreak_(v612, v613, 1, v614, v615, v616);

        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v617 = (id)qword_1EA3C9FE0;
        if (os_log_type_enabled(v617, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v623 = objc_msgSend_count(v695, v618, v619, v620, v621, v622);
          *(_DWORD *)long long buf = 134219778;
          *(void *)&uint8_t buf[4] = v686 + 1;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v623;
          *(_WORD *)&buf[22] = 2048;
          *(double *)&buf[24] = v258 / v670;
          LOWORD(v743[0]) = 2048;
          *(double *)((char *)v743 + 2) = v258;
          WORD5(v743[0]) = 2048;
          *(double *)((char *)v743 + 12) = v670;
          WORD2(v743[1]) = 2112;
          *(void *)((char *)&v743[1] + 6) = v673;
          HIWORD(v743[1]) = 2112;
          v744[0] = obja;
          LOWORD(v744[1]) = 1024;
          *(_DWORD *)((char *)&v744[1] + 2) = v676;
          _os_log_impl(&dword_1C492D000, v617, OS_LOG_TYPE_DEBUG, "Line breaking detected at the beginning of line %lu/%lu (heightDifference:%lf=%lf/%lf lang:%@=>%@ acceptableLang:%d)", buf, 0x4Eu);
        }

        uint64_t v611 = 1;
      }
    }
    v624 = [CHReflowableTextLine alloc];
    v696[4] = *(_OWORD *)v707;
    v696[5] = *(_OWORD *)v708;
    v696[6] = v709;
    v696[7] = v710;
    v696[0] = *(_OWORD *)__p;
    v696[1] = *(_OWORD *)__src;
    v696[2] = *(_OWORD *)v705;
    v696[3] = *(_OWORD *)v706;
    v630 = objc_msgSend_locale(v692, v625, v626, v627, v628, v629);
    hasEndingLineBreak_alignmentType_writingDirection_locale = objc_msgSend_initWithTokens_principalLines_bounds_headIndent_leading_hasStartingLineBreak_hasEndingLineBreak_alignmentType_writingDirection_locale_(v624, v631, (uint64_t)v682, (uint64_t)v696, v611, v610, 1, v609, v588, v590, v592, v594, 0.0, v517, v630);

    objc_msgSend_addObject_(v677, v633, (uint64_t)hasEndingLineBreak_alignmentType_writingDirection_locale, v634, v635, v636);
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v637 = (id)qword_1EA3C9FE0;
    if (os_log_type_enabled(v637, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v643 = objc_msgSend_count(v682, v638, v639, v640, v641, v642);
      objc_msgSend_orientation(v692, v644, v645, v646, v647, v648);
      v650 = "NO";
      if (v610) {
        v650 = "YES";
      }
      *(_DWORD *)long long buf = 134218498;
      *(void *)&uint8_t buf[4] = v643;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v649;
      *(_WORD *)&buf[22] = 2080;
      *(void *)&buf[24] = v650;
      _os_log_impl(&dword_1C492D000, v637, OS_LOG_TYPE_DEBUG, "Adding CHReflowableTextLine with %ld tokens, lineOrientation = %.2f, hasEndingLineBreauint64_t k = %s", buf, 0x20u);
    }

    v651 = v673;
    if (v672)
    {
      uint64_t v657 = objc_msgSend_completedUnitCount(v669, v652, v653, v654, v655, v656);
      objc_msgSend_setCompletedUnitCount_(v669, v658, v657 + 1, v659, v660, v661);
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v662 = (id)qword_1EA3C9FE0;
      if (os_log_type_enabled(v662, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_localizedDescription(v669, v663, v664, v665, v666, v667);
        id v668 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v668;
        _os_log_impl(&dword_1C492D000, v662, OS_LOG_TYPE_DEBUG, "Reflow Task Progress (token): %@", buf, 0xCu);
      }
    }

    double v670 = fmax(v258, 1.0);
    id obja = v651;
    ++v686;
  }

  id v7 = (id)v672;
LABEL_5:

  return v677;
}

+ (id)reflowableTextTokensFromTransformedTextLines:(id)a3
{
  uint64_t v269 = *MEMORY[0x1E4F143B8];
  id v185 = a3;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v3, v4, v5, v6, v7);
  id v211 = (id)objc_claimAutoreleasedReturnValue();
  long long v263 = 0u;
  long long v261 = 0u;
  long long v262 = 0u;
  long long v260 = 0u;
  obuint64_t j = v185;
  uint64_t v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v260, (uint64_t)v268, 16, v9);
  if (v188)
  {
    uint64_t v190 = *(void *)v261;
    do
    {
      for (uint64_t i = 0; i != v188; ++i)
      {
        if (*(void *)v261 != v190) {
          objc_enumerationMutation(obj);
        }
        uint64_t v189 = *(void **)(*((void *)&v260 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend_splitIntoTokens(v189, v10, v11, v12, v13, v14);
        long long v258 = 0u;
        long long v259 = 0u;
        long long v256 = 0u;
        long long v257 = 0u;
        id v214 = v15;
        uint64_t v207 = objc_msgSend_countByEnumeratingWithState_objects_count_(v214, v16, (uint64_t)&v256, (uint64_t)v267, 16, v17);
        if (v207)
        {
          uint64_t v210 = *(void *)v257;
          do
          {
            for (uint64_t j = 0; j != v207; ++j)
            {
              if (*(void *)v257 != v210) {
                objc_enumerationMutation(v214);
              }
              uint64_t v217 = *(void **)(*((void *)&v256 + 1) + 8 * j);
              id v23 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v18, v19, v20, v21, v22);
              uint64_t v29 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v24, v25, v26, v27, v28);
              long long v254 = 0u;
              long long v255 = 0u;
              long long v252 = 0u;
              long long v253 = 0u;
              double v35 = objc_msgSend_textStrokes(v217, v30, v31, v32, v33, v34);
              uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v252, (uint64_t)v266, 16, v37);
              if (v43)
              {
                uint64_t v44 = *(void *)v253;
                do
                {
                  for (uint64_t k = 0; k != v43; ++k)
                  {
                    if (*(void *)v253 != v44) {
                      objc_enumerationMutation(v35);
                    }
                    uint64_t v46 = objc_msgSend_strokeIdentifier(*(void **)(*((void *)&v252 + 1) + 8 * k), v38, v39, v40, v41, v42);
                    objc_msgSend_addObject_(v23, v47, (uint64_t)v46, v48, v49, v50);
                  }
                  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v252, (uint64_t)v266, 16, v42);
                }
                while (v43);
              }

              long long v250 = 0u;
              long long v251 = 0u;
              long long v248 = 0u;
              long long v249 = 0u;
              objc_msgSend_segments(v217, v51, v52, v53, v54, v55);
              id v218 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v218, v56, (uint64_t)&v248, (uint64_t)v265, 16, v57);
              if (v63)
              {
                uint64_t v64 = *(void *)v249;
                do
                {
                  for (uint64_t m = 0; m != v63; ++m)
                  {
                    if (*(void *)v249 != v64) {
                      objc_enumerationMutation(v218);
                    }
                    uint64_t v66 = *(void **)(*((void *)&v248 + 1) + 8 * m);
                    long long v244 = 0u;
                    long long v245 = 0u;
                    long long v246 = 0u;
                    long long v247 = 0u;
                    uint64_t v67 = objc_msgSend_supportStrokes(v66, v58, v59, v60, v61, v62);
                    uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v244, (uint64_t)v264, 16, v69);
                    if (v75)
                    {
                      uint64_t v76 = *(void *)v245;
                      do
                      {
                        for (uint64_t n = 0; n != v75; ++n)
                        {
                          if (*(void *)v245 != v76) {
                            objc_enumerationMutation(v67);
                          }
                          uint64_t v78 = objc_msgSend_strokeIdentifier(*(void **)(*((void *)&v244 + 1) + 8 * n), v70, v71, v72, v73, v74);
                          objc_msgSend_addObject_(v29, v79, (uint64_t)v78, v80, v81, v82);
                        }
                        uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v70, (uint64_t)&v244, (uint64_t)v264, 16, v74);
                      }
                      while (v75);
                    }
                  }
                  uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v218, v58, (uint64_t)&v248, (uint64_t)v265, 16, v62);
                }
                while (v63);
              }

              uint64_t v88 = objc_msgSend_string(v217, v83, v84, v85, v86, v87);
              uint64_t v94 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v89, v90, v91, v92, v93);
              uint64_t v99 = objc_msgSend_stringByTrimmingCharactersInSet_(v88, v95, (uint64_t)v94, v96, v97, v98);

              double v105 = objc_msgSend_textStrokes(v217, v100, v101, v102, v103, v104);
              objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v106, (uint64_t)v105, v107, v108, v109);
              double v208 = v111;
              double v209 = v110;
              id v219 = v112;
              double v215 = v113;

              double v114 = *MEMORY[0x1E4F1DAD8];
              double v115 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
              uint64_t v121 = objc_alloc_init(CHTextSize);
              double v122 = *MEMORY[0x1E4F1DB30];
              double v123 = *(double *)&v219;
              if (*(double *)&v219 == *MEMORY[0x1E4F1DB30]
                && (double v122 = *(double *)(MEMORY[0x1E4F1DB30] + 8), v123 = v215, v215 == v122))
              {
                double v124 = v115;
                double v125 = v114;
                double v126 = v115;
                double v127 = v114;
                double v128 = v115;
                double v129 = v114;
                double v203 = v114;
                double v205 = v115;
                double v199 = v114;
                double v201 = v115;
                double v195 = v114;
                double v197 = v115;
                double v191 = v114;
                double v193 = v115;
              }
              else
              {
                if (v217)
                {
                  objc_msgSend_principalLines(v217, v116, v117, v118, v119, v120, v122, v123);
                }
                else
                {
                  *(_OWORD *)uint64_t v242 = 0u;
                  long long v243 = 0u;
                  long long v240 = 0u;
                  *(_OWORD *)double v241 = 0u;
                  *(_OWORD *)uint64_t v238 = 0u;
                  *(_OWORD *)uint64_t v239 = 0u;
                }
                if ((objc_msgSend_fromCachedTokens(v189, v116, v117, v118, v119, v120) & 1) == 0)
                {
                  objc_msgSend_fixPrincipalLinesPosition_useAltString_skipAmbiguousCharacters_(a1, v130, (uint64_t)v217, 0, 1, v131);
                  sub_1C49B7D84(v238, (char *)__src, *(char **)v223, (uint64_t)(*(void *)v223 - (void)__src) >> 4);
                  sub_1C49B7D84(&v239[1], (char *)v225, *(char **)v226, (uint64_t)(*(void *)v226 - (void)v225) >> 4);
                  sub_1C49B7D84(v241, (char *)v228, *(char **)v229, (uint64_t)(*(void *)v229 - (void)v228) >> 4);
                  sub_1C49B7D84(&v242[1], (char *)__p, *(char **)v232, (uint64_t)(*(void *)v232 - (void)__p) >> 4);
                  if (*(double *)&__p != 0.0)
                  {
                    *(double *)uint64_t v232 = *(double *)&__p;
                    operator delete(__p);
                  }
                  if (*(double *)&v228 != 0.0)
                  {
                    *(double *)double v229 = *(double *)&v228;
                    operator delete(v228);
                  }
                  if (*(double *)&v225 != 0.0)
                  {
                    *(double *)uint64_t v226 = *(double *)&v225;
                    operator delete(v225);
                  }
                  if (*(double *)&__src != 0.0)
                  {
                    *(double *)uint64_t v223 = *(double *)&__src;
                    operator delete(__src);
                  }
                }
                double v132 = objc_opt_class();
                if (v132)
                {
                  objc_msgSend_convertToCHPrincipalLines_(v132, v133, (uint64_t)v238, v134, v135, v136);
                  double v192 = *(double *)&__src;
                  double v194 = *(double *)v223;
                  double v196 = v224;
                  double v198 = *(double *)&v225;
                  double v200 = *(double *)v226;
                  double v202 = v227;
                  double v204 = *(double *)&v228;
                  double v206 = *(double *)v229;
                  double v187 = v230;
                  double v137 = *(double *)&__p;
                  double v138 = *(double *)v232;
                  double v139 = v233;
                  double v140 = v234;
                  uint64_t v141 = v235;
                  uint64_t v142 = v236;
                  uint64_t v143 = v237;
                }
                else
                {
                  uint64_t v143 = 0;
                  uint64_t v142 = 0;
                  uint64_t v141 = 0;
                  double v140 = 0.0;
                  double v139 = 0.0;
                  double v138 = 0.0;
                  double v137 = 0.0;
                  double v187 = 0.0;
                  double v204 = 0.0;
                  double v206 = 0.0;
                  double v200 = 0.0;
                  double v202 = 0.0;
                  double v196 = 0.0;
                  double v198 = 0.0;
                  double v192 = 0.0;
                  double v194 = 0.0;
                }
                double v144 = objc_opt_class();
                *(double *)uint64_t v221 = v192;
                *(double *)&v221[1] = v194;
                *(double *)&v221[2] = v196;
                *(double *)&_OWORD v221[3] = v198;
                *(double *)&v221[4] = v200;
                *(double *)&v221[5] = v202;
                *(double *)&v221[6] = v204;
                *(double *)&v221[7] = v206;
                *(double *)&v221[8] = v187;
                *(double *)&v221[9] = v137;
                *(double *)&v221[10] = v138;
                *(double *)&v221[11] = v139;
                *(double *)&v221[12] = v140;
                v221[13] = v141;
                v221[14] = v142;
                v221[15] = v143;
                uint64_t v148 = objc_msgSend_textSizeFromPrincipalLines_string_(v144, v145, (uint64_t)v221, (uint64_t)v99, v146, v147);
                uint64_t v181 = v142;
                uint64_t v183 = v143;

                if (*(double *)&v219 == 0.0) {
                  double v149 = 1.0;
                }
                else {
                  double v149 = *(double *)&v219;
                }
                if (v215 == 0.0) {
                  double v150 = 1.0;
                }
                else {
                  double v150 = v215;
                }
                uint64_t v151 = objc_opt_class();
                double v156 = 1.0 / v215;
                if (v215 == 0.0) {
                  double v156 = 1.0;
                }
                objc_msgSend_scaledSize_scale_(v151, v152, (uint64_t)v148, v153, v154, v155, v156, v141, v181, v183);
                uint64_t v121 = (CHTextSize *)objc_claimAutoreleasedReturnValue();

                if (v242[1])
                {
                  *(void **)&long long v243 = v242[1];
                  operator delete(v242[1]);
                }
                if (v241[0])
                {
                  v241[1] = v241[0];
                  operator delete(v241[0]);
                }
                if (v239[1])
                {
                  *(void **)&long long v240 = v239[1];
                  operator delete(v239[1]);
                }
                if (v238[0])
                {
                  v238[1] = v238[0];
                  operator delete(v238[0]);
                }
                double v191 = (v192 - v209) / v149;
                double v193 = (v194 - v208) / v150;
                double v195 = (v196 - v209) / v149;
                double v197 = (v198 - v208) / v150;
                double v199 = (v200 - v209) / v149;
                double v201 = (v202 - v208) / v150;
                double v203 = (v204 - v209) / v149;
                double v205 = (v206 - v208) / v150;
                double v157 = (v187 - v209) / v149;
                double v127 = (v138 - v209) / v149;
                double v126 = (v139 - v208) / v150;
                double v158 = v140 - v209;
                double v128 = (v137 - v208) / v150;
                double v125 = v158 / v149;
                double v124 = (v180 - v208) / v150;
                double v114 = (v182 - v209) / v149;
                double v115 = (v184 - v208) / v150;
                double v129 = v157;
              }
              uint64_t v159 = objc_msgSend_tokens(v217, v116, v117, v118, v119, v120);
              double v165 = objc_msgSend_firstObject(v159, v160, v161, v162, v163, v164);
              unint64_t v171 = objc_msgSend_properties(v165, v166, v167, v168, v169, v170);

              uint64_t v172 = [CHReflowableTextResultToken alloc];
              *(double *)uint64_t v220 = v191;
              *(double *)&v220[1] = v193;
              *(double *)&v220[2] = v195;
              *(double *)&v220[3] = v197;
              *(double *)&v220[4] = v199;
              *(double *)&v220[5] = v201;
              *(double *)&v220[6] = v203;
              *(double *)&v220[7] = v205;
              *(double *)&v220[8] = v129;
              *(double *)&v220[9] = v128;
              *(double *)&v220[10] = v127;
              *(double *)&v220[11] = v126;
              *(double *)&v220[12] = v125;
              *(double *)&v220[13] = v124;
              *(double *)&v220[14] = v114;
              *(double *)&v220[15] = v115;
              hasPrecedingSpace = objc_msgSend_initWithString_strokeIdentifiers_nonTextStrokeIdentifiers_principalLines_textSize_bounds_hasPrecedingSpace_(v172, v173, (uint64_t)v99, (uint64_t)v23, (uint64_t)v29, (uint64_t)v220, v121, (v171 >> 5) & 1, v209, v208, *(double *)&v219, v215);
              objc_msgSend_addObject_(v211, v175, (uint64_t)hasPrecedingSpace, v176, v177, v178);
            }
            uint64_t v207 = objc_msgSend_countByEnumeratingWithState_objects_count_(v214, v18, (uint64_t)&v256, (uint64_t)v267, 16, v22);
          }
          while (v207);
        }
      }
      uint64_t v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v260, (uint64_t)v268, 16, v14);
    }
    while (v188);
  }

  return v211;
}

+ (id)adjustLeadingForReflowableLines:(id)a3
{
  uint64_t v516 = *MEMORY[0x1E4F143B8];
  id v443 = a3;
  if ((unint64_t)objc_msgSend_count(v443, v3, v4, v5, v6, v7) > 1)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v15 = objc_msgSend_count(v443, v8, v9, v10, v11, v12);
    unint64_t v448 = objc_msgSend_arrayWithCapacity_(v14, v16, v15, v17, v18, v19);
    uint64_t v20 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v26 = objc_msgSend_count(v443, v21, v22, v23, v24, v25);
    uint64_t v458 = objc_msgSend_arrayWithCapacity_(v20, v27, v26, v28, v29, v30);
    long long v510 = 0u;
    long long v509 = 0u;
    long long v508 = 0u;
    long long v507 = 0u;
    id v31 = v443;
    uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v507, (uint64_t)v515, 16, v33);
    if (v38)
    {
      uint64_t v39 = *(void *)v508;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v508 != v39) {
            objc_enumerationMutation(v31);
          }
          uint64_t v41 = *(void **)(*((void *)&v507 + 1) + 8 * i);
          objc_msgSend_addObject_(v458, v34, (uint64_t)v41, v35, v36, v37);
          if (objc_msgSend_hasEndingLineBreak(v41, v42, v43, v44, v45, v46))
          {
            objc_msgSend_addObject_(v448, v34, (uint64_t)v458, v35, v36, v37);
            uint64_t v47 = (void *)MEMORY[0x1E4F1CA48];
            uint64_t v53 = objc_msgSend_count(v31, v48, v49, v50, v51, v52);
            uint64_t v58 = objc_msgSend_arrayWithCapacity_(v47, v54, v53, v55, v56, v57);

            uint64_t v458 = (void *)v58;
          }
        }
        uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v507, (uint64_t)v515, 16, v37);
      }
      while (v38);
    }

    uint64_t v59 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v65 = objc_msgSend_count(v31, v60, v61, v62, v63, v64);
    objc_msgSend_arrayWithCapacity_(v59, v66, v65, v67, v68, v69);
    id v461 = (id)objc_claimAutoreleasedReturnValue();
    long long v506 = 0u;
    long long v505 = 0u;
    long long v504 = 0u;
    long long v503 = 0u;
    obuint64_t j = v448;
    uint64_t v446 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v503, (uint64_t)v514, 16, v71);
    if (v446)
    {
      uint64_t v445 = *(void *)v504;
      do
      {
        for (uint64_t j = 0; j != v446; ++j)
        {
          if (*(void *)v504 != v445) {
            objc_enumerationMutation(obj);
          }
          double v77 = *(void **)(*((void *)&v503 + 1) + 8 * j);
          if (objc_msgSend_count(v77, v72, v73, v74, v75, v76) == 1)
          {
            double v83 = objc_opt_class();
            uint64_t v89 = objc_msgSend_firstObject(v77, v84, v85, v86, v87, v88);
            uint64_t v95 = v89;
            if (v89)
            {
              objc_msgSend_principalLines(v89, v90, v91, v92, v93, v94);
            }
            else
            {
              long long v494 = 0u;
              long long v495 = 0u;
              long long v492 = 0u;
              long long v493 = 0u;
              long long v490 = 0u;
              long long v491 = 0u;
              long long v488 = 0u;
              long long v489 = 0u;
            }
            uint64_t v298 = objc_msgSend_firstObject(v77, v90, v91, v92, v93, v94);
            objc_msgSend_bounds(v298, v299, v300, v301, v302, v303);
            if (v310 == 0.0) {
              double v310 = 1.0;
            }
            if (v311 == 0.0) {
              double v311 = 1.0;
            }
            v496[0] = v308 + *(double *)&v488 * v310;
            v496[1] = v309 + *((double *)&v488 + 1) * v311;
            v496[2] = v308 + *(double *)&v489 * v310;
            v496[3] = v309 + *((double *)&v489 + 1) * v311;
            void v496[4] = v308 + *(double *)&v490 * v310;
            v496[5] = v309 + *((double *)&v490 + 1) * v311;
            v496[6] = v308 + *(double *)&v491 * v310;
            v496[7] = v309 + *((double *)&v491 + 1) * v311;
            v496[8] = v308 + *(double *)&v492 * v310;
            v496[9] = v309 + *((double *)&v492 + 1) * v311;
            v496[10] = v308 + *(double *)&v493 * v310;
            v496[11] = v309 + *((double *)&v493 + 1) * v311;
            v496[12] = v308 + *(double *)&v494 * v310;
            v496[13] = v309 + *((double *)&v494 + 1) * v311;
            v496[14] = v308 + *(double *)&v495 * v310;
            v496[15] = v309 + *((double *)&v495 + 1) * v311;
            if (v83)
            {
              objc_msgSend_convertFromCHPrincipalLines_(v83, v304, (uint64_t)v496, v305, v306, v307);
            }
            else
            {
              long long v502 = 0u;
              *(_OWORD *)__p = 0u;
              *(_OWORD *)uint64_t v500 = 0u;
              long long v499 = 0u;
              *(_OWORD *)v498 = 0u;
              *(_OWORD *)id v497 = 0u;
            }

            double v312 = objc_opt_class();
            uint64_t v318 = objc_msgSend_firstObject(v77, v313, v314, v315, v316, v317);
            uint64_t v324 = objc_msgSend_string(v318, v319, v320, v321, v322, v323);
            objc_msgSend_estimatedLeadingForPrincipalLines_transcription_(v312, v325, (uint64_t)v497, (uint64_t)v324, v326, v327);
            double v329 = v328;

            uint64_t v457 = [CHReflowableTextLine alloc];
            v450 = objc_msgSend_firstObject(v77, v330, v331, v332, v333, v334);
            objc_msgSend_tokens(v450, v335, v336, v337, v338, v339);
            id v460 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v345 = objc_msgSend_firstObject(v77, v340, v341, v342, v343, v344);
            uint64_t v455 = v345;
            if (v345) {
              objc_msgSend_principalLines(v345, v346, v347, v348, v349, v350);
            }
            else {
              memset(v487, 0, sizeof(v487));
            }
            uint64_t v453 = objc_msgSend_firstObject(v77, v346, v347, v348, v349, v350);
            objc_msgSend_bounds(v453, v351, v352, v353, v354, v355);
            double v357 = v356;
            double v359 = v358;
            double v361 = v360;
            double v363 = v362;
            id v451 = objc_msgSend_firstObject(v77, v364, v365, v366, v367, v368);
            objc_msgSend_headIndent(v451, v369, v370, v371, v372, v373);
            double v375 = v374;
            uint64_t v381 = objc_msgSend_firstObject(v77, v376, v377, v378, v379, v380);
            hasStartingLineBreaunint64_t k = objc_msgSend_hasStartingLineBreak(v381, v382, v383, v384, v385, v386);
            uint64_t v393 = objc_msgSend_firstObject(v77, v388, v389, v390, v391, v392);
            hasEndingLineBreaunint64_t k = objc_msgSend_hasEndingLineBreak(v393, v394, v395, v396, v397, v398);
            uint64_t v405 = objc_msgSend_firstObject(v77, v400, v401, v402, v403, v404);
            uint64_t v411 = objc_msgSend_alignmentType(v405, v406, v407, v408, v409, v410);
            id v417 = objc_msgSend_firstObject(v77, v412, v413, v414, v415, v416);
            uint64_t v423 = objc_msgSend_writingDirection(v417, v418, v419, v420, v421, v422);
            double v429 = objc_msgSend_firstObject(v77, v424, v425, v426, v427, v428);
            uint64_t v435 = objc_msgSend_locale(v429, v430, v431, v432, v433, v434);
            hasEndingLineBreak_alignmentType_writingDirection_locale = objc_msgSend_initWithTokens_principalLines_bounds_headIndent_leading_hasStartingLineBreak_hasEndingLineBreak_alignmentType_writingDirection_locale_(v457, v436, (uint64_t)v460, (uint64_t)v487, hasStartingLineBreak, hasEndingLineBreak, v411, v423, v357, v359, v361, v363, v375, v329, v435);

            objc_msgSend_addObject_(v461, v438, (uint64_t)hasEndingLineBreak_alignmentType_writingDirection_locale, v439, v440, v441);
            if (__p[1])
            {
              *(void **)&long long v502 = __p[1];
              operator delete(__p[1]);
            }
            if (v500[0])
            {
              v500[1] = v500[0];
              operator delete(v500[0]);
            }
            if (v498[1])
            {
              *(void **)&long long v499 = v498[1];
              operator delete(v498[1]);
            }
            if (v497[0])
            {
              v497[1] = v497[0];
              operator delete(v497[0]);
            }
          }
          else
          {
            double v456 = 0.0;
            for (unint64_t k = 1; k < objc_msgSend_count(v77, v78, v79, v80, v81, v82); ++k)
            {
              uint64_t v102 = objc_msgSend_objectAtIndexedSubscript_(v77, v97, k - 1, v99, v100, v101);
              uint64_t v108 = v102;
              if (v102)
              {
                objc_msgSend_principalLines(v102, v103, v104, v105, v106, v107);
              }
              else
              {
                long long v485 = 0u;
                long long v486 = 0u;
                long long v483 = 0u;
                long long v484 = 0u;
                long long v481 = 0u;
                long long v482 = 0u;
                long long v479 = 0u;
                long long v480 = 0u;
              }
              uint64_t v109 = objc_msgSend_objectAtIndexedSubscript_(v77, v103, k - 1, v105, v106, v107);
              objc_msgSend_bounds(v109, v110, v111, v112, v113, v114);
              double v119 = v118;
              double v120 = 1.0;
              if (v116 == 0.0) {
                double v121 = 1.0;
              }
              else {
                double v121 = v116;
              }
              if (v117 != 0.0) {
                double v120 = v117;
              }
              double v452 = v120;
              double v454 = v115;
              long long v122 = v481;
              long long v123 = v482;

              double v128 = objc_msgSend_objectAtIndexedSubscript_(v77, v124, k, v125, v126, v127);
              uint64_t v134 = v128;
              if (v128)
              {
                objc_msgSend_principalLines(v128, v129, v130, v131, v132, v133);
              }
              else
              {
                long long v477 = 0u;
                long long v478 = 0u;
                long long v475 = 0u;
                long long v476 = 0u;
                long long v473 = 0u;
                long long v474 = 0u;
                long long v471 = 0u;
                long long v472 = 0u;
              }
              uint64_t v135 = objc_msgSend_objectAtIndexedSubscript_(v77, v129, k, v131, v132, v133);
              objc_msgSend_bounds(v135, v136, v137, v138, v139, v140);
              double v145 = v144;
              if (v142 == 0.0) {
                double v146 = 1.0;
              }
              else {
                double v146 = v142;
              }
              if (v143 == 0.0) {
                double v147 = 1.0;
              }
              else {
                double v147 = v143;
              }
              long long v148 = v473;
              double v449 = v141;
              long long v149 = v474;

              double v150 = v119 + *(double *)&v122 * v121;
              double v151 = v145 + *(double *)&v148 * v146;
              long long v469 = 0u;
              long long v470 = 0u;
              long long v467 = 0u;
              long long v468 = 0u;
              double v157 = objc_msgSend_numberWithDouble_(NSNumber, v152, v153, v154, v155, v156, fmin(v150, v151));
              double v158 = v119 + *(double *)&v123 * v121;
              double v159 = v145 + *(double *)&v149 * v146;
              v512[0] = v157;
              double v165 = objc_msgSend_numberWithDouble_(NSNumber, v160, v161, v162, v163, v164, fmax(v158, v159));
              v512[1] = v165;
              uint64_t v169 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v166, (uint64_t)v512, 2, v167, v168);

              uint64_t v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(v169, v170, (uint64_t)&v467, (uint64_t)v513, 16, v171);
              if (v177)
              {
                double v178 = v454 + *((double *)&v122 + 1) * v452;
                double v179 = v449 + *((double *)&v148 + 1) * v147;
                uint64_t v180 = *(void *)v468;
                BOOL v181 = v151 == v159;
                double v182 = (v449 + *((double *)&v149 + 1) * v147 - v179) / (v159 - v151);
                double v183 = v179 - v151 * v182;
                if (*(double *)&v122 == v158)
                {
                  if (v181)
                  {
                    double v184 = vabdd_f64(v178, v179);
                    double v185 = 0.0;
                    do
                    {
                      for (uint64_t m = 0; m != v177; ++m)
                      {
                        if (*(void *)v468 != v180) {
                          objc_enumerationMutation(v169);
                        }
                        double v187 = *(void **)(*((void *)&v467 + 1) + 8 * m);
                        objc_msgSend_floatValue(v187, v172, v173, v174, v175, v176);
                        objc_msgSend_floatValue(v187, v188, v189, v190, v191, v192);
                        if (v184 > v185) {
                          double v185 = v184;
                        }
                      }
                      uint64_t v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(v169, v172, (uint64_t)&v467, (uint64_t)v513, 16, v176);
                    }
                    while (v177);
                  }
                  else
                  {
                    double v185 = 0.0;
                    do
                    {
                      for (uint64_t n = 0; n != v177; ++n)
                      {
                        if (*(void *)v468 != v180) {
                          objc_enumerationMutation(v169);
                        }
                        uint64_t v217 = *(void **)(*((void *)&v467 + 1) + 8 * n);
                        objc_msgSend_floatValue(v217, v172, v173, v174, v175, v176);
                        objc_msgSend_floatValue(v217, v218, v219, v220, v221, v222);
                        double v224 = vabdd_f64(v178, v183 + v182 * v223);
                        if (v224 > v185) {
                          double v185 = v224;
                        }
                      }
                      uint64_t v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(v169, v172, (uint64_t)&v467, (uint64_t)v513, 16, v176);
                    }
                    while (v177);
                  }
                }
                else
                {
                  double v193 = (v454 + *((double *)&v123 + 1) * v452 - v178) / (v158 - v150);
                  double v194 = v178 - v150 * v193;
                  double v185 = 0.0;
                  if (v181)
                  {
                    do
                    {
                      for (iuint64_t i = 0; ii != v177; ++ii)
                      {
                        if (*(void *)v468 != v180) {
                          objc_enumerationMutation(v169);
                        }
                        double v196 = *(void **)(*((void *)&v467 + 1) + 8 * ii);
                        objc_msgSend_floatValue(v196, v172, v173, v174, v175, v176);
                        float v198 = v197;
                        objc_msgSend_floatValue(v196, v199, v200, v201, v202, v203);
                        double v204 = vabdd_f64(v194 + v193 * v198, v179);
                        if (v204 > v185) {
                          double v185 = v204;
                        }
                      }
                      uint64_t v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(v169, v172, (uint64_t)&v467, (uint64_t)v513, 16, v176);
                    }
                    while (v177);
                  }
                  else
                  {
                    do
                    {
                      for (juint64_t j = 0; jj != v177; ++jj)
                      {
                        if (*(void *)v468 != v180) {
                          objc_enumerationMutation(v169);
                        }
                        double v206 = *(void **)(*((void *)&v467 + 1) + 8 * jj);
                        objc_msgSend_floatValue(v206, v172, v173, v174, v175, v176);
                        float v208 = v207;
                        objc_msgSend_floatValue(v206, v209, v210, v211, v212, v213);
                        double v215 = vabdd_f64(v194 + v193 * v208, v183 + v182 * v214);
                        if (v215 > v185) {
                          double v185 = v215;
                        }
                      }
                      uint64_t v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(v169, v172, (uint64_t)&v467, (uint64_t)v513, 16, v176);
                    }
                    while (v177);
                  }
                }
              }
              else
              {
                double v185 = 0.0;
              }

              double v456 = v456 + v185;
            }
            uint64_t v225 = objc_msgSend_count(v77, v97, v98, v99, v100, v101);
            long long v465 = 0u;
            long long v466 = 0u;
            long long v463 = 0u;
            long long v464 = 0u;
            id v459 = v77;
            uint64_t v228 = objc_msgSend_countByEnumeratingWithState_objects_count_(v459, v226, (uint64_t)&v463, (uint64_t)v511, 16, v227);
            if (v228)
            {
              double v229 = v456 / (double)(unint64_t)(v225 - 1);
              uint64_t v230 = *(void *)v464;
              do
              {
                for (kunint64_t k = 0; kk != v228; ++kk)
                {
                  if (*(void *)v464 != v230) {
                    objc_enumerationMutation(v459);
                  }
                  uint64_t v232 = *(void **)(*((void *)&v463 + 1) + 8 * kk);
                  double v233 = [CHReflowableTextLine alloc];
                  long long v244 = objc_msgSend_tokens(v232, v234, v235, v236, v237, v238);
                  if (v232) {
                    objc_msgSend_principalLines(v232, v239, v240, v241, v242, v243);
                  }
                  else {
                    memset(v462, 0, sizeof(v462));
                  }
                  objc_msgSend_bounds(v232, v239, v240, v241, v242, v243);
                  double v246 = v245;
                  double v248 = v247;
                  double v250 = v249;
                  double v252 = v251;
                  objc_msgSend_headIndent(v232, v253, v254, v255, v256, v257);
                  double v259 = v258;
                  uint64_t v265 = objc_msgSend_hasStartingLineBreak(v232, v260, v261, v262, v263, v264);
                  uint64_t v271 = objc_msgSend_hasEndingLineBreak(v232, v266, v267, v268, v269, v270);
                  uint64_t v277 = objc_msgSend_alignmentType(v232, v272, v273, v274, v275, v276);
                  uint64_t v283 = objc_msgSend_writingDirection(v232, v278, v279, v280, v281, v282);
                  uint64_t v289 = objc_msgSend_locale(v232, v284, v285, v286, v287, v288);
                  uint64_t v291 = objc_msgSend_initWithTokens_principalLines_bounds_headIndent_leading_hasStartingLineBreak_hasEndingLineBreak_alignmentType_writingDirection_locale_(v233, v290, (uint64_t)v244, (uint64_t)v462, v265, v271, v277, v283, v246, v248, v250, v252, v259, v229, v289);

                  objc_msgSend_addObject_(v461, v292, (uint64_t)v291, v293, v294, v295);
                }
                uint64_t v228 = objc_msgSend_countByEnumeratingWithState_objects_count_(v459, v296, (uint64_t)&v463, (uint64_t)v511, 16, v297);
              }
              while (v228);
            }
          }
        }
        uint64_t v446 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v72, (uint64_t)&v503, (uint64_t)v514, 16, v76);
      }
      while (v446);
    }

    uint64_t v13 = v443;
  }
  else
  {
    uint64_t v13 = v443;
    id v461 = v443;
  }

  return v461;
}

+ (CGAffineTransform)transformForInsertingToken:(SEL)a3 inLineWithTokens:(id)a4
{
  v188[1] = *MEMORY[0x1E4F143B8];
  id v155 = a4;
  id v7 = a5;
  if (!objc_msgSend_count(v7, v8, v9, v10, v11, v12))
  {
    uint64_t v23 = MEMORY[0x1E4F1DAB8];
    long long v24 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v24;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v23 + 32);
    goto LABEL_82;
  }
  uint64_t v154 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v13, @"en_US", v14, v15, v16);
  uint64_t v22 = objc_opt_class();
  if (v155)
  {
    objc_msgSend_principalLines(v155, v17, v18, v19, v20, v21);
    if (v22)
    {
LABEL_4:
      objc_msgSend_convertFromCHPrincipalLines_(v22, v17, (uint64_t)v181, v19, v20, v21);
      goto LABEL_8;
    }
  }
  else
  {
    memset(v181, 0, sizeof(v181));
    if (v22) {
      goto LABEL_4;
    }
  }
  long long v184 = 0u;
  long long v185 = 0u;
  long long v183 = 0u;
  memset(&v182, 0, sizeof(v182));
LABEL_8:
  if (objc_msgSend_hasPrecedingSpace(v155, v17, v18, v19, v20, v21)) {
    uint64_t v25 = 32;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v26 = [CHTokenizedTextResultToken alloc];
  uint64_t v32 = objc_msgSend_string(v155, v27, v28, v29, v30, v31);
  uint64_t v38 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v33, v34, v35, v36, v37);
  uint64_t v39 = (double *)MEMORY[0x1E4F1DB28];
  uint64_t v41 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v26, v40, (uint64_t)v32, (uint64_t)v38, 0, v25, v154, 1, 1.0, 1.0, 1.0, 1.0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), 0);

  uint64_t v42 = [CHTransformedTextLine alloc];
  v188[0] = v41;
  uint64_t v46 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v43, (uint64_t)v188, 1, v44, v45);
  double v179 = 0;
  *(void *)long long buf = 0;
  uint64_t v180 = 0;
  uint64_t v176 = 0;
  uint64_t v175 = 0;
  uint64_t v177 = 0;
  sub_1C4AAA458(v168, (uint64_t)&v182);
  uint64_t v47 = (_OWORD *)MEMORY[0x1E4F1DAB8];
  long long v48 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v167[0] = *MEMORY[0x1E4F1DAB8];
  v167[1] = v48;
  v167[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  uint64_t v50 = objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v42, v49, MEMORY[0x1E4F1CBF0], (uint64_t)v46, (uint64_t)buf, (uint64_t)&v175, v154, 1, v168, v167);
  if (__p)
  {
    uint64_t v174 = __p;
    operator delete(__p);
  }
  if (v171)
  {
    uint64_t v172 = v171;
    operator delete(v171);
  }
  if (v169)
  {
    uint64_t v170 = v169;
    operator delete(v169);
  }
  if (v168[0])
  {
    v168[1] = v168[0];
    operator delete(v168[0]);
  }
  uint64_t v51 = (char *)v175;
  if (v175)
  {
    uint64_t v52 = v176;
    uint64_t v53 = v175;
    if (v176 != v175)
    {
      uint64_t v54 = v176;
      do
      {
        uint64_t v56 = (void *)*((void *)v54 - 3);
        v54 -= 24;
        uint64_t v55 = v56;
        if (v56)
        {
          *((void *)v52 - 2) = v55;
          operator delete(v55);
        }
        uint64_t v52 = v54;
      }
      while (v54 != v51);
      uint64_t v53 = v175;
      uint64_t v47 = (_OWORD *)MEMORY[0x1E4F1DAB8];
    }
    uint64_t v176 = v51;
    operator delete(v53);
  }
  if (*(void *)buf)
  {
    double v179 = *(void **)buf;
    operator delete(*(void **)buf);
  }

  if (*((void *)&v184 + 1))
  {
    *(void *)&long long v185 = *((void *)&v184 + 1);
    operator delete(*((void **)&v184 + 1));
  }
  if ((void)v183)
  {
    *((void *)&v183 + 1) = v183;
    operator delete((void *)v183);
  }
  if (*(void *)&v182.d)
  {
    v182.tdouble x = v182.d;
    operator delete(*(void **)&v182.d);
  }
  if (*(void *)&v182.a)
  {
    v182.b = v182.a;
    operator delete(*(void **)&v182.a);
  }
  uint64_t v62 = objc_msgSend_lastObject(v7, v57, v58, v59, v60, v61);
  uint64_t v63 = objc_opt_class();
  uint64_t v69 = objc_msgSend_lastObject(v7, v64, v65, v66, v67, v68);
  uint64_t v75 = v69;
  if (!v69)
  {
    memset(v166, 0, sizeof(v166));
    if (v63) {
      goto LABEL_39;
    }
LABEL_41:
    long long v184 = 0u;
    long long v185 = 0u;
    long long v183 = 0u;
    memset(&v182, 0, sizeof(v182));
    goto LABEL_42;
  }
  objc_msgSend_principalLines(v69, v70, v71, v72, v73, v74);
  if (!v63) {
    goto LABEL_41;
  }
LABEL_39:
  objc_msgSend_convertFromCHPrincipalLines_(v63, v70, (uint64_t)v166, v72, v73, v74);
LABEL_42:

  if (objc_msgSend_hasPrecedingSpace(v62, v76, v77, v78, v79, v80)) {
    uint64_t v81 = 32;
  }
  else {
    uint64_t v81 = 0;
  }
  uint64_t v82 = [CHTokenizedTextResultToken alloc];
  uint64_t v88 = objc_msgSend_string(v62, v83, v84, v85, v86, v87);
  uint64_t v94 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v89, v90, v91, v92, v93);
  uint64_t v96 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v82, v95, (uint64_t)v88, (uint64_t)v94, 0, v81, v154, 1, 1.0, 1.0, 1.0, 1.0, *v39, v39[1], v39[2], v39[3], 0);

  uint64_t v97 = [CHTransformedTextLine alloc];
  double v187 = v96;
  uint64_t v101 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v98, (uint64_t)&v187, 1, v99, v100);
  double v179 = 0;
  *(void *)long long buf = 0;
  uint64_t v180 = 0;
  uint64_t v176 = 0;
  uint64_t v175 = 0;
  uint64_t v177 = 0;
  sub_1C4AAA458(v159, (uint64_t)&v182);
  long long v102 = v47[1];
  v158[0] = *v47;
  v158[1] = v102;
  v158[2] = v47[2];
  uint64_t v104 = objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v97, v103, MEMORY[0x1E4F1CBF0], (uint64_t)v101, (uint64_t)buf, (uint64_t)&v175, v154, 1, v159, v158);
  if (v164)
  {
    double v165 = v164;
    operator delete(v164);
  }
  if (v162)
  {
    uint64_t v163 = v162;
    operator delete(v162);
  }
  if (v160)
  {
    uint64_t v161 = v160;
    operator delete(v160);
  }
  if (v159[0])
  {
    v159[1] = v159[0];
    operator delete(v159[0]);
  }
  uint64_t v105 = (char *)v175;
  if (v175)
  {
    uint64_t v106 = v176;
    uint64_t v107 = v175;
    if (v176 != v175)
    {
      uint64_t v108 = v176;
      do
      {
        double v110 = (void *)*((void *)v108 - 3);
        v108 -= 24;
        uint64_t v109 = v110;
        if (v110)
        {
          *((void *)v106 - 2) = v109;
          operator delete(v109);
        }
        uint64_t v106 = v108;
      }
      while (v108 != v105);
      uint64_t v107 = v175;
    }
    uint64_t v176 = v105;
    operator delete(v107);
  }
  if (*(void *)buf)
  {
    double v179 = *(void **)buf;
    operator delete(*(void **)buf);
  }

  if (*((void *)&v184 + 1))
  {
    *(void *)&long long v185 = *((void *)&v184 + 1);
    operator delete(*((void **)&v184 + 1));
  }
  if ((void)v183)
  {
    *((void *)&v183 + 1) = v183;
    operator delete((void *)v183);
  }
  if (*(void *)&v182.d)
  {
    v182.tdouble x = v182.d;
    operator delete(*(void **)&v182.d);
  }
  if (*(void *)&v182.a)
  {
    v182.b = v182.a;
    operator delete(*(void **)&v182.a);
  }

  uint64_t v111 = objc_alloc_init(CHTransformationParameters);
  objc_msgSend_setOrientationBehavior_(v111, v112, 1, v113, v114, v115);
  objc_msgSend_setResizeBehavior_(v111, v116, 1, v117, v118, v119);
  objc_msgSend_setMergeLines_(v111, v120, 1, v121, v122, v123);
  double v124 = objc_opt_class();
  v186[0] = v104;
  v186[1] = v50;
  double v128 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v125, (uint64_t)v186, 2, v126, v127);
  objc_msgSend_transformTextLines_withParameters_(v124, v129, (uint64_t)v128, (uint64_t)v111, v130, v131);

  memset(&v182, 0, sizeof(v182));
  uint64_t v137 = objc_msgSend_segments(v50, v132, v133, v134, v135, v136);
  double v143 = objc_msgSend_firstObject(v137, v138, v139, v140, v141, v142);
  long long v149 = v143;
  if (v143) {
    objc_msgSend_transform(v143, v144, v145, v146, v147, v148);
  }
  else {
    memset(&v182, 0, sizeof(v182));
  }

  CGAffineTransform t1 = v182;
  memset(&t2, 0, sizeof(t2));
  if (CGAffineTransformEqualToTransform(&t1, &t2))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    double v150 = (id)qword_1EA3C9FE0;
    if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C492D000, v150, OS_LOG_TYPE_ERROR, "transformForInsertingToken resulted in an invalid transform, retuning identity transform instead.", buf, 2u);
    }

    double v151 = (CGAffineTransform *)MEMORY[0x1E4F1DAB8];
  }
  else
  {
    double v151 = &v182;
  }
  long long v152 = *(_OWORD *)&v151->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v151->a;
  *(_OWORD *)&retstr->c = v152;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v151->tx;

LABEL_82:
  return result;
}

- (NSArray)contextStrokes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContextStrokes:(id)a3
{
}

- (CHTransformationParameters)transformationParameters
{
  return (CHTransformationParameters *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTransformationParameters:(id)a3
{
}

- (NSArray)contextResults
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContextResults:(id)a3
{
}

- (NSSet)excludedStrokeTypes
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExcludedStrokeTypes:(id)a3
{
}

- (CHStrokeProvider)strokeProvider
{
  return (CHStrokeProvider *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStrokeProvider:(id)a3
{
}

- (CHStrokeGroupingResult)strokeGroupingResult
{
  return (CHStrokeGroupingResult *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStrokeGroupingResult:(id)a3
{
}

- (CHStrokeClassificationResult)strokeClassificationResult
{
  return (CHStrokeClassificationResult *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStrokeClassificationResult:(id)a3
{
}

- (NSMutableArray)correctionAngles
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCorrectionAngles:(id)a3
{
}

- (NSArray)relatedNonTextStrokes
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRelatedNonTextStrokes:(id)a3
{
}

- (BOOL)usingInsertionPoint
{
  return self->_usingInsertionPoint;
}

- (void)setUsingInsertionPoint:(BOOL)a3
{
  self->_usingInsertionPoint = a3;
}

- (NSArray)initialStrokes
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInitialStrokes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialStrokes, 0);
  objc_storeStrong((id *)&self->_relatedNonTextStrokes, 0);
  objc_storeStrong((id *)&self->_correctionAngles, 0);
  objc_storeStrong((id *)&self->_strokeClassificationResult, 0);
  objc_storeStrong((id *)&self->_strokeGroupingResult, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
  objc_storeStrong((id *)&self->_excludedStrokeTypes, 0);
  objc_storeStrong((id *)&self->_contextResults, 0);
  objc_storeStrong((id *)&self->_transformationParameters, 0);
  objc_storeStrong((id *)&self->_contextStrokes, 0);
}

@end