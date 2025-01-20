@interface PKTextInputHandwritingShot
+ (int)_contentTypeFromKeyboardType:(int64_t)a3;
+ (int)_contentTypeFromTextContentType:(id)a3;
- (BOOL)_didRequestTextInputElements;
- (BOOL)_shouldTargetFirstResponderElement:(id)a3 strokeIdentifiers:(id)a4;
- (BOOL)cursorIsForcedStrongAtStart;
- (BOOL)cursorIsWeakAtStart;
- (BOOL)isCancelled;
- (BOOL)isPotentiallyTargetingElement:(id)a3;
- (BOOL)writingIsActiveAtStart;
- (NSArray)_submittedTextInputTargets;
- (NSArray)resultQueryItems;
- (NSArray)textInputTargets;
- (NSDictionary)_inputElementsByRecognitionID;
- (NSDictionary)_submittedTargetContentInfoByTargetID;
- (NSMutableDictionary)_inputElementsContentByRecognitionID;
- (NSMutableIndexSet)_potentiallyTargetedElementRecognitionIDs;
- (NSNumber)writingSessionIdentifier;
- (NSString)description;
- (PKDrawing)inputDrawing;
- (PKStroke)inputInProgressStroke;
- (PKTextInputCanvasController)canvasController;
- (PKTextInputElementsController)elementsController;
- (PKTextInputHandwritingShot)initWithCanvasController:(id)a3 elementsController:(id)a4 languageSpec:(id)a5;
- (PKTextInputHandwritingShotDelegate)delegate;
- (PKTextInputLanguageSpec)languageSpec;
- (PKTextInputStrokeProvider)strokeProvider;
- (_NSRange)_correctableTextRangeIntersectingStrokesWithIdentifiers:(id)a3 inInputTarget:(id)a4 elementContent:(id)a5;
- (_NSRange)_editingGestureCorrectableRangeForStrokeBounds:(CGRect)a3 InInputTarget:(id)a4 elementContent:(id)a5;
- (_NSRange)_selectedTextRangeForElementContent:(id)a3 textInputTarget:(id)a4 strokeSliceIdentifiers:(id)a5;
- (_NSRange)_substringReferenceRangeForStrokeCoveredRange:(_NSRange)a3 contentLength:(int64_t)a4 selectedRange:(_NSRange)a5;
- (double)_lastDrawingUpdateTimestamp;
- (double)recognitionDuration;
- (id)_closestInputElementForStrokeIdentifiers:(id)a3;
- (id)_contentInfoFromElementContent:(id)a3 textInputTarget:(id)a4 strokeIdentifiers:(id)a5;
- (id)_protectedCharacterIndexesInRange:(_NSRange)a3 forElementContent:(id)a4;
- (id)_textContentSubstringInRange:(_NSRange)a3 forElementContent:(id)a4;
- (id)recognitionManager:(id)a3 textInputTargetForItemStableIdentifier:(id)a4 strokeIdentifiers:(id)a5 simultaneousItemStableIdentifiers:(id)a6;
- (id)submittedTargetContentInfoForRecognitionIdentifier:(id)a3;
- (id)textInputElementContentForRecognitionIdentifier:(id)a3;
- (id)textInputElementForRecognitionIdentifier:(id)a3;
- (int)_autoCapitalizationModeForTextInputTraits:(id)a3;
- (int)_autoCorrectionModeForTextInputTraits:(id)a3;
- (int)_contentTypeForElementContent:(id)a3;
- (int)chWritingDirectionFrom:(int64_t)a3 useDefault:(BOOL)a4;
- (int64_t)shotState;
- (void)_evaluateSubmissionReadyness;
- (void)_fetchTextInputElementsIfNeededWithReferenceHitPoint:(CGPoint)a3 referenceSearchArea:(CGRect)a4 referenceCoordSpace:(id)a5;
- (void)_loadAndSaveContentFocusingIfNeededForElement:(id)a3 referenceCanvasPoint:(CGPoint)a4 strokesBounds:(CGRect)a5 completion:(id)a6;
- (void)_saveSubmittedTargetContentInfo:(id)a3;
- (void)_setDidRequestTextInputElements:(BOOL)a3;
- (void)_setInputElementsByRecognitionID:(id)a3;
- (void)_setResultQueryItems:(id)a3;
- (void)_setShotState:(int64_t)a3;
- (void)_setupStrokeProvider;
- (void)beginRecognitionWithRecognitionManager:(id)a3;
- (void)recognitionManager:(id)a3 fetchContentInfoForTextInputTarget:(id)a4 strokeIdentifiers:(id)a5 completion:(id)a6;
- (void)recognitionManager:(id)a3 recognitionDidFinishWithQueryItems:(id)a4 duration:(double)a5;
- (void)reportDebugStateDescription:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCursorIsForcedStrongAtStart:(BOOL)a3;
- (void)setCursorIsWeakAtStart:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInputDrawing:(id)a3 inputInProgressStroke:(id)a4;
- (void)setRecognitionDuration:(double)a3;
- (void)setStrokeProvider:(id)a3;
- (void)setWritingIsActiveAtStart:(BOOL)a3;
- (void)setWritingSessionIdentifier:(id)a3;
- (void)set_lastDrawingUpdateTimestamp:(double)a3;
- (void)set_potentiallyTargetedElementRecognitionIDs:(id)a3;
- (void)set_submittedTargetContentInfoByTargetID:(id)a3;
- (void)set_submittedTextInputTargets:(id)a3;
@end

@implementation PKTextInputHandwritingShot

- (PKTextInputHandwritingShot)initWithCanvasController:(id)a3 elementsController:(id)a4 languageSpec:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKTextInputHandwritingShot;
  v12 = [(PKTextInputHandwritingShot *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_canvasController, a3);
    objc_storeStrong((id *)&v13->_elementsController, a4);
    objc_storeStrong((id *)&v13->_languageSpec, a5);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    inputElementsContentByRecognitionID = v13->__inputElementsContentByRecognitionID;
    v13->__inputElementsContentByRecognitionID = v14;
  }
  return v13;
}

- (NSString)description
{
  v3 = +[PKTextInputDebugStateIntrospector debugStateLineDescriptionForIntrospectable:self];
  v7.receiver = self;
  v7.super_class = (Class)PKTextInputHandwritingShot;
  v4 = [(PKTextInputHandwritingShot *)&v7 description];
  v5 = [v4 stringByAppendingFormat:@" %@", v3];

  return (NSString *)v5;
}

- (void)setInputDrawing:(id)a3 inputInProgressStroke:(id)a4
{
  unint64_t v37 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (*(_OWORD *)&self->_inputDrawing != __PAIR128__(v6, v37))
  {
    [(PKTextInputHandwritingShot *)self shotState];
    if (!v6 || !self->_inputInProgressStroke)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      -[PKTextInputHandwritingShot set_lastDrawingUpdateTimestamp:](self, "set_lastDrawingUpdateTimestamp:");
    }
    objc_super v7 = (PKDrawing *)[(id)v37 copy];
    inputDrawing = self->_inputDrawing;
    self->_inputDrawing = v7;

    id v9 = (PKStroke *)[(id)v6 copy];
    inputInProgressStroke = self->_inputInProgressStroke;
    self->_inputInProgressStroke = v9;

    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    if (v37 | v6)
    {
      if (v6) {
        [(id)v6 _bounds];
      }
      else {
        [(id)v37 bounds];
      }
      CGFloat v22 = v15;
      CGFloat v23 = v16;
      CGFloat v24 = v17;
      CGFloat v25 = v18;
      CGFloat MidX = CGRectGetMidX(*(CGRect *)&v15);
      v39.origin.double x = v22;
      v39.origin.double y = v23;
      v39.size.double width = v24;
      v39.size.double height = v25;
      double MidY = CGRectGetMidY(v39);
      if (v37)
      {
        [(id)v37 bounds];
        double x = v26;
        double y = v27;
        double width = v28;
        double height = v29;
      }
      if (v6)
      {
        [(id)v6 _bounds];
        v42.origin.double x = v30;
        v42.origin.double y = v31;
        v42.size.double width = v32;
        v42.size.double height = v33;
        v40.origin.double x = x;
        v40.origin.double y = y;
        v40.size.double width = width;
        v40.size.double height = height;
        CGRect v41 = CGRectUnion(v40, v42);
        double x = v41.origin.x;
        double y = v41.origin.y;
        double width = v41.size.width;
        double height = v41.size.height;
      }
      v34 = [(PKTextInputHandwritingShot *)self canvasController];
      v19 = -[PKTextInputCanvasController canvasCoordinateSpace](v34);

      double v20 = v36;
    }
    else
    {
      v19 = 0;
      double v20 = *MEMORY[0x1E4F1DAD8];
      double MidY = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    -[PKTextInputHandwritingShot _fetchTextInputElementsIfNeededWithReferenceHitPoint:referenceSearchArea:referenceCoordSpace:](self, "_fetchTextInputElementsIfNeededWithReferenceHitPoint:referenceSearchArea:referenceCoordSpace:", v19, v20, MidY, x, y, width, height);
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
    [(PKTextInputHandwritingShot *)self _evaluateSubmissionReadyness];
  }
}

- (void)_setInputElementsByRecognitionID:(id)a3
{
  v5 = (NSDictionary *)a3;
  if (self->__inputElementsByRecognitionID != v5)
  {
    unint64_t v6 = v5;
    objc_storeStrong((id *)&self->__inputElementsByRecognitionID, a3);
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
    [(PKTextInputHandwritingShot *)self _evaluateSubmissionReadyness];
    v5 = v6;
  }
}

- (void)_setShotState:(int64_t)a3
{
  self->_shotState = a3;
  v4 = [(PKTextInputHandwritingShot *)self delegate];
  [v4 handwritingShotDidChangeState:self];

  +[PKTextInputDebugStateIntrospector debugStateDidChange];
}

- (void)_setDidRequestTextInputElements:(BOOL)a3
{
  if (self->__didRequestTextInputElements != a3)
  {
    self->__didRequestTextInputElements = a3;
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
  }
}

- (void)_fetchTextInputElementsIfNeededWithReferenceHitPoint:(CGPoint)a3 referenceSearchArea:(CGRect)a4 referenceCoordSpace:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v9 = a3.y;
  CGFloat v10 = a3.x;
  id v12 = a5;
  v13 = [(PKTextInputHandwritingShot *)self _inputElementsByRecognitionID];
  if (v13)
  {
  }
  else if (![(PKTextInputHandwritingShot *)self _didRequestTextInputElements])
  {
    [(PKTextInputHandwritingShot *)self _setDidRequestTextInputElements:1];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v15 = v14;
    double v16 = [(PKTextInputHandwritingShot *)self elementsController];
    if (v16) {
      double v17 = v16[6];
    }
    else {
      double v17 = 0.0;
    }
    double v18 = v15 - v17;

    if (v18 <= 1.0
      && (([(PKTextInputHandwritingShot *)self elementsController],
           uint64_t v19 = objc_claimAutoreleasedReturnValue(),
           (double v20 = (void *)v19) == 0)
        ? (v21 = 0)
        : (v21 = *(void **)(v19 + 40)),
          id v22 = v21,
          v20,
          v22))
    {
      [(PKTextInputHandwritingShot *)self _setInputElementsByRecognitionID:v22];
    }
    else
    {
      CGFloat v23 = [(PKTextInputHandwritingShot *)self elementsController];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __123__PKTextInputHandwritingShot__fetchTextInputElementsIfNeededWithReferenceHitPoint_referenceSearchArea_referenceCoordSpace___block_invoke;
      v24[3] = &unk_1E64C61C0;
      v24[4] = self;
      -[PKTextInputElementsController updateTextInputElementsWithReferenceHitPoint:referenceSearchArea:referenceCoordSpace:completion:]((uint64_t)v23, v12, v24, v10, v9, x, y, width, height);
    }
  }
}

void __123__PKTextInputHandwritingShot__fetchTextInputElementsIfNeededWithReferenceHitPoint_referenceSearchArea_referenceCoordSpace___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) elementsController];
  v3 = (void *)v2;
  if (v2) {
    v4 = *(void **)(v2 + 40);
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  [*(id *)(a1 + 32) _setInputElementsByRecognitionID:v5];
}

- (void)beginRecognitionWithRecognitionManager:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(PKTextInputHandwritingShot *)self _setShotState:3];
  [(PKTextInputHandwritingShot *)self _setupStrokeProvider];
  uint64_t v6 = [(PKTextInputHandwritingShot *)self languageSpec];
  objc_super v7 = (void *)v6;
  if (v6) {
    -[PKTextInputRecognitionManager setRecognitionLocales:]((uint64_t)v5, *(void **)(v6 + 24));
  }

  v8 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v9 = NSStringFromSelector(a2);
    CGFloat v10 = [(PKTextInputHandwritingShot *)self strokeProvider];
    int v15 = 134218754;
    double v16 = self;
    __int16 v17 = 2112;
    double v18 = v9;
    __int16 v19 = 2112;
    double v20 = v10;
    __int16 v21 = 2112;
    id v22 = self;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "HWShot %p %@, will begin recognition request, strokeProvider: %@, shot: <%@>", (uint8_t *)&v15, 0x2Au);
  }
  id v11 = _PKSignpostLog();
  id v12 = _PKSignpostLog();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "HandwritingShot", (const char *)&unk_1C48540E6, (uint8_t *)&v15, 2u);
  }

  double v14 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_INFO, "BEGIN \"HandwritingShot\"", (uint8_t *)&v15, 2u);
  }

  -[PKTextInputRecognitionManager beginRecognitionRequestWithDataSource:](v5, self);
}

- (void)recognitionManager:(id)a3 recognitionDidFinishWithQueryItems:(id)a4 duration:(double)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v8 = objc_msgSend(a4, "copy", a3);
  [(PKTextInputHandwritingShot *)self _setResultQueryItems:v8];

  [(PKTextInputHandwritingShot *)self setRecognitionDuration:a5];
  CGFloat v9 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v10 = NSStringFromSelector(a2);
    [(PKTextInputHandwritingShot *)self recognitionDuration];
    int v18 = 134218754;
    __int16 v19 = self;
    __int16 v20 = 2112;
    __int16 v21 = v10;
    __int16 v22 = 2048;
    uint64_t v23 = v11;
    __int16 v24 = 2112;
    CGFloat v25 = self;
    _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "HWShot %p %@, finished recognition request in %0.3fs. Shot: <%@>", (uint8_t *)&v18, 0x2Au);
  }
  id v12 = _PKSignpostLog();
  os_signpost_id_t v13 = _PKSignpostLog();
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, self);

  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v12, OS_SIGNPOST_INTERVAL_END, v14, "HandwritingShot", (const char *)&unk_1C48540E6, (uint8_t *)&v18, 2u);
  }

  int v15 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_INFO, "END \"HandwritingShot\"", (uint8_t *)&v18, 2u);
  }

  [(PKTextInputHandwritingShot *)self _setShotState:4];
  double v16 = os_log_create("com.apple.pencilkit", "Latency");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    [(PKTextInputHandwritingShot *)self recognitionDuration];
    int v18 = 134217984;
    __int16 v19 = v17;
    _os_log_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_DEFAULT, "Last recognition duration: %g", (uint8_t *)&v18, 0xCu);
  }
}

- (void)_evaluateSubmissionReadyness
{
  if ((unint64_t)([(PKTextInputHandwritingShot *)self shotState] - 2) >= 3)
  {
    v3 = [(PKTextInputHandwritingShot *)self _inputElementsByRecognitionID];

    if (v3)
    {
      v4 = [(PKTextInputHandwritingShot *)self inputDrawing];
      if (v4)
      {
      }
      else
      {
        id v5 = [(PKTextInputHandwritingShot *)self inputInProgressStroke];

        if (!v5) {
          return;
        }
      }
      if (![(PKTextInputHandwritingShot *)self shotState]) {
        [(PKTextInputHandwritingShot *)self _setShotState:1];
      }
      uint64_t v6 = +[PKTextInputSettings sharedSettings];
      char v7 = [v6 continuousRecognition];

      double v8 = 0.0;
      if ((v7 & 1) == 0)
      {
        CGFloat v9 = +[PKTextInputSettings sharedSettings];
        [v9 recognitionCoalescingDelay];
        double v8 = v10;
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v12 = v11;
      [(PKTextInputHandwritingShot *)self _lastDrawingUpdateTimestamp];
      double v14 = v12 - v13;
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__evaluateSubmissionReadyness object:0];
      if (v14 >= v8)
      {
        [(PKTextInputHandwritingShot *)self _setShotState:2];
      }
      else
      {
        [(PKTextInputHandwritingShot *)self performSelector:sel__evaluateSubmissionReadyness withObject:0 afterDelay:v8 - v14];
      }
    }
  }
}

- (id)textInputElementForRecognitionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTextInputHandwritingShot *)self _inputElementsByRecognitionID];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    uint64_t v7 = [(PKTextInputHandwritingShot *)self elementsController];
    double v8 = (void *)v7;
    if (v7) {
      CGFloat v9 = *(void **)(v7 + 40);
    }
    else {
      CGFloat v9 = 0;
    }
    id v10 = v9;
    uint64_t v6 = [v10 objectForKeyedSubscript:v4];
  }

  return v6;
}

- (id)textInputElementContentForRecognitionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTextInputHandwritingShot *)self _inputElementsContentByRecognitionID];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (BOOL)isPotentiallyTargetingElement:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTextInputHandwritingShot *)self _potentiallyTargetedElementRecognitionIDs];

  if (v5)
  {
    if (v4) {
      uint64_t v6 = (void *)v4[14];
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      double v8 = [(PKTextInputHandwritingShot *)self _potentiallyTargetedElementRecognitionIDs];
      if (v4) {
        CGFloat v9 = (void *)v4[14];
      }
      else {
        CGFloat v9 = 0;
      }
      id v10 = v9;
      LOBYTE(v7) = objc_msgSend(v8, "containsIndex:", objc_msgSend(v10, "unsignedIntegerValue"));
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return (char)v7;
}

- (id)_closestInputElementForStrokeIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTextInputHandwritingShot *)self _inputElementsByRecognitionID];
  uint64_t v6 = [(PKTextInputHandwritingShot *)self strokeProvider];
  [v6 centroidForSlicesWithIdentifiers:v4];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [v6 boundsForSliceIdentifiers:v4];
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x3032000000;
  __int16 v22 = __Block_byref_object_copy__7;
  uint64_t v23 = __Block_byref_object_dispose__7;
  id v24 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0x7FEFFFFFFFFFFFFFLL;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__PKTextInputHandwritingShot__closestInputElementForStrokeIdentifiers___block_invoke;
  v17[3] = &unk_1E64C70F8;
  v17[7] = v8;
  v17[8] = v10;
  v17[9] = v11;
  v17[10] = v12;
  v17[11] = v13;
  v17[12] = v14;
  v17[4] = self;
  v17[5] = &v19;
  v17[6] = v18;
  [v5 enumerateKeysAndObjectsUsingBlock:v17];
  id v15 = (id)v20[5];
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);

  return v15;
}

void __71__PKTextInputHandwritingShot__closestInputElementForStrokeIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  CGRect v42 = a3;
  id v5 = -[PKTextInputElement coordinateSpace]((uint64_t)v42);

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) canvasController];
    double v7 = -[PKTextInputElement frame]((uint64_t)v42);
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = -[PKTextInputElement coordinateSpace]((uint64_t)v42);
    double v15 = -[PKTextInputCanvasController convertRect:toCanvasFromCoordinateSpace:](v6, v14, v7, v9, v11, v13);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    v44.origin.CGFloat x = v15;
    v44.origin.CGFloat y = v17;
    v44.size.CGFloat width = v19;
    v44.size.CGFloat height = v21;
    double v22 = 0.0;
    if (!CGRectContainsPoint(v44, *(CGPoint *)(a1 + 56)))
    {
      double v23 = -[PKTextInputElement hitToleranceFrameFromElementFrame:](v42, v15, v17, v19, v21);
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      if ((-[PKTextInputElement isFocused]((uint64_t)v42) & 1) != 0
        || (v45.origin.CGFloat x = v23,
            v45.origin.CGFloat y = v25,
            v45.size.CGFloat width = v27,
            v45.size.CGFloat height = v29,
            CGRectIntersectsRect(v45, *(CGRect *)(a1 + 72))))
      {
        double v30 = *(double *)(a1 + 56);
        double v31 = *(double *)(a1 + 64);
        if (v30 >= v15)
        {
          double v32 = v15 + v19;
          BOOL v33 = v30 <= v15 + v19;
          double v15 = *(double *)(a1 + 56);
          if (!v33) {
            double v15 = v32;
          }
        }
        if (v31 >= v17)
        {
          double v34 = v17 + v21;
          BOOL v33 = v31 <= v17 + v21;
          double v17 = *(double *)(a1 + 64);
          if (!v33) {
            double v17 = v34;
          }
        }
        double v22 = (v31 - v17) * (v31 - v17) + (v30 - v15) * (v30 - v15);
      }
      else
      {
        double v22 = 1.79769313e308;
      }
    }
    uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 8);
    v38 = *(void **)(v35 + 40);
    double v36 = (id *)(v35 + 40);
    unint64_t v37 = v38;
    if (v38)
    {
      uint64_t v39 = a1 + 48;
      if (vabdd_f64(v22, *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) < 0.00999999978)
      {
        if (!-[PKTextInputElement isInFrontOfElement:]((uint64_t)v42, v37)) {
          goto LABEL_21;
        }
        double v36 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        goto LABEL_20;
      }
    }
    if (v22 != 1.79769313e308)
    {
      uint64_t v41 = *(void *)(a1 + 48);
      uint64_t v40 = a1 + 48;
      if (v22 <= *(double *)(*(void *)(v41 + 8) + 24))
      {
        uint64_t v39 = v40;
LABEL_20:
        objc_storeStrong(v36, a3);
        *(double *)(*(void *)(*(void *)v39 + 8) + 24) = v22;
      }
    }
  }
LABEL_21:
}

- (void)_loadAndSaveContentFocusingIfNeededForElement:(id)a3 referenceCanvasPoint:(CGPoint)a4 strokesBounds:(CGRect)a5 completion:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = a4.y;
  double v12 = a4.x;
  uint64_t v14 = a3;
  double v15 = (void (**)(id, void *))a6;
  double v16 = [(PKTextInputHandwritingShot *)self _inputElementsContentByRecognitionID];
  if (v14) {
    double v17 = (void *)v14[14];
  }
  else {
    double v17 = 0;
  }
  id v18 = v17;
  double v19 = [v16 objectForKeyedSubscript:v18];

  if (v19)
  {
    v15[2](v15, v19);
  }
  else
  {
    double v20 = -[PKTextInputElement coordinateSpace]((uint64_t)v14);

    if (v20)
    {
      double v21 = [(PKTextInputHandwritingShot *)self delegate];
      [v21 handwritingShot:self willFocusAndLoadDataForTargetElement:v14];

      double v22 = [(PKTextInputHandwritingShot *)self canvasController];
      double v23 = -[PKTextInputCanvasController canvasCoordinateSpace](v22);
      double v24 = -[PKTextInputElement coordinateSpace]((uint64_t)v14);
      double v25 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v23, v24, v12, v11, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

      double v26 = -[PKTextInputElement clampedReferencePoint:]((uint64_t)v14, v25);
      double v28 = v27;
      CGFloat v29 = [(PKTextInputHandwritingShot *)self canvasController];
      double v30 = -[PKTextInputCanvasController canvasCoordinateSpace](v29);
      double v31 = -[PKTextInputElement coordinateSpace]((uint64_t)v14);
      double v32 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v30, v31, x, y, width, height);
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      CGFloat v38 = v37;

      if ([(PKTextInputHandwritingShot *)self cursorIsWeakAtStart]) {
        int v39 = ![(PKTextInputHandwritingShot *)self writingIsActiveAtStart];
      }
      else {
        int v39 = 0;
      }
      char v41 = -[PKTextInputElement isFocused]((uint64_t)v14);
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __122__PKTextInputHandwritingShot__loadAndSaveContentFocusingIfNeededForElement_referenceCanvasPoint_strokesBounds_completion___block_invoke;
      v42[3] = &unk_1E64C7148;
      char v49 = v41;
      char v50 = v39;
      v42[4] = self;
      double v45 = v12;
      double v46 = v11;
      v43 = v14;
      double v47 = v26;
      double v48 = v28;
      CGRect v44 = v15;
      -[PKTextInputElement loadContentFocusingIfNeededWithReferencePoint:alwaysSetSelectionFromReferencePoint:rectOfInterest:completion:]((uint64_t)v43, v39, v42, v26, v28, v32, v34, v36, v38);
    }
    else
    {
      uint64_t v40 = -[PKTextInputElementContent initWithElement:]((id *)[PKTextInputElementContent alloc], v14);
      v15[2](v15, v40);
    }
  }
}

void __122__PKTextInputHandwritingShot__loadAndSaveContentFocusingIfNeededForElement_referenceCanvasPoint_strokesBounds_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(a1 + 88))
  {
LABEL_14:
    int v5 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)(a1 + 89))
  {
LABEL_3:
    int v5 = 1;
    goto LABEL_15;
  }
  uint64_t v6 = -[PKTextInputElementContent selectedRange]((uint64_t)v3);
  uint64_t v8 = v7;
  int v5 = 0;
  if (![*(id *)(a1 + 32) writingIsActiveAtStart] && !v8 && v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (([*(id *)(a1 + 32) cursorIsForcedStrongAtStart] & 1) == 0)
    {
      double v9 = [*(id *)(a1 + 32) canvasController];
      double v10 = -[PKTextInputCanvasController canvasCoordinateSpace](v9);
      double v11 = -[PKTextInputElementContent caretRectInCoordinateSpace:]((uint64_t)v4, v10);
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;

      v31.origin.double x = v11;
      v31.origin.double y = v13;
      v31.size.double width = v15;
      v31.size.double height = v17;
      if (!CGRectIsNull(v31))
      {
        v32.origin.double x = v11;
        v32.origin.double y = v13;
        v32.size.double width = v15;
        v32.size.double height = v17;
        double v18 = CGRectGetMidY(v32) - *(double *)(a1 + 64);
        double v19 = v18 >= 0.0 ? v18 : -v18;
        double v20 = +[PKTextInputSettings sharedSettings];
        [v20 strongCursorMaximumYDistance];
        double v22 = v21;

        if (v19 > v22)
        {
          double v23 = [*(id *)(a1 + 32) delegate];
          [v23 handwritingShotDidOverrideStrongCursor:*(void *)(a1 + 32)];

          goto LABEL_3;
        }
      }
    }
    goto LABEL_14;
  }
LABEL_15:
  double v24 = [*(id *)(a1 + 32) _inputElementsContentByRecognitionID];
  double v25 = *(void **)(a1 + 40);
  if (v25) {
    double v25 = (void *)v25[14];
  }
  double v26 = v25;
  [v24 setObject:v4 forKeyedSubscript:v26];

  if (v5)
  {
    objc_initWeak(&location, v4);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __122__PKTextInputHandwritingShot__loadAndSaveContentFocusingIfNeededForElement_referenceCanvasPoint_strokesBounds_completion___block_invoke_2;
    v27[3] = &unk_1E64C7120;
    id v28 = *(id *)(a1 + 48);
    objc_copyWeak(&v29, &location);
    [(PKTextInputElementContent *)(id *)v4 setSelectionWithReferencePoint:*(double *)(a1 + 72) completionHandler:*(double *)(a1 + 80)];
    objc_destroyWeak(&v29);

    objc_destroyWeak(&location);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __122__PKTextInputHandwritingShot__loadAndSaveContentFocusingIfNeededForElement_referenceCanvasPoint_strokesBounds_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);
}

- (void)_setupStrokeProvider
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKTextInputHandwritingShot *)self inputDrawing];
  double v16 = [(PKTextInputHandwritingShot *)self inputInProgressStroke];
  id v4 = [(PKTextInputHandwritingShot *)self delegate];
  int v5 = [v4 handwritingShotStrokeIdentifiersToExcludeFromRecognition:self];

  uint64_t v6 = objc_alloc_init(PKDrawing);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  CGFloat v17 = v3;
  uint64_t v7 = [v3 strokes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        CGFloat v13 = [v12 _strokeUUID];
        char v14 = [v5 containsObject:v13];

        if ((v14 & 1) == 0) {
          [(PKDrawing *)v6 addNewStroke:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  if (v16) {
    [(PKDrawing *)v6 addNewStroke:v16];
  }
  CGFloat v15 = [[PKTextInputStrokeProvider alloc] initWithDrawing:v6];
  [(PKTextInputHandwritingShot *)self setStrokeProvider:v15];
}

- (NSArray)textInputTargets
{
  id v3 = [(PKTextInputHandwritingShot *)self _submittedTextInputTargets];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    int v5 = [(PKTextInputHandwritingShot *)self _inputElementsByRecognitionID];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    double v11 = __46__PKTextInputHandwritingShot_textInputTargets__block_invoke;
    double v12 = &unk_1E64C58C0;
    CGFloat v13 = self;
    id v14 = v4;
    id v6 = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:&v9];
    -[PKTextInputHandwritingShot set_submittedTextInputTargets:](self, "set_submittedTextInputTargets:", v6, v9, v10, v11, v12, v13);
  }
  uint64_t v7 = [(PKTextInputHandwritingShot *)self _submittedTextInputTargets];

  return (NSArray *)v7;
}

void __46__PKTextInputHandwritingShot_textInputTargets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  id v6 = -[PKTextInputElement coordinateSpace]((uint64_t)v5);
  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) canvasController];
    double v8 = -[PKTextInputElement frame]((uint64_t)v5);
    double v12 = -[PKTextInputCanvasController convertRect:toCanvasFromCoordinateSpace:](v7, v6, v8, v9, v10, v11);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    long long v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F5C0A8]), "initWithIdentifier:frame:", v20, v12, v14, v16, v18);
    [*(id *)(a1 + 40) addObject:v19];
  }
}

- (id)recognitionManager:(id)a3 textInputTargetForItemStableIdentifier:(id)a4 strokeIdentifiers:(id)a5 simultaneousItemStableIdentifiers:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([v10 count])
  {
    id v12 = v10;
    [(PKTextInputHandwritingShot *)self _inputElementsByRecognitionID];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v51 = long long v55 = 0u;
    double v13 = [v51 allValues];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v53;
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v53 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v52 + 1) + 8 * v17);
        if (-[PKTextInputElement isFocused]((uint64_t)v18)) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v52 objects:v56 count:16];
          if (v15) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v19 = v18;

      if (v19)
      {
        id v20 = [v12 allObjects];
        BOOL v21 = [(PKTextInputHandwritingShot *)self _shouldTargetFirstResponderElement:v19 strokeIdentifiers:v20];

        if (v21)
        {
          id v19 = v19;
          double v22 = (id *)v19;
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_10:

      id v19 = 0;
    }
    uint64_t v23 = [v12 allObjects];
    double v22 = [(PKTextInputHandwritingShot *)self _closestInputElementForStrokeIdentifiers:v23];

LABEL_15:
    double v24 = [(PKTextInputHandwritingShot *)self delegate];

    if (v24)
    {
      double v25 = [(PKTextInputHandwritingShot *)self delegate];
      uint64_t v26 = [v25 handwritingShot:self preferredTargetElementForQueryItemStableIdentifier:v9 simultaneousItemStableIdentifiers:v11 proposedTargetElement:v22];

      double v22 = (id *)v26;
    }
    if (v22)
    {
      double v27 = -[PKTextInputElement coordinateSpace]((uint64_t)v22);

      if (v27)
      {
        id v28 = [(PKTextInputHandwritingShot *)self canvasController];
        double v29 = -[PKTextInputElement frame]((uint64_t)v22);
        double v31 = v30;
        double v33 = v32;
        double v35 = v34;
        CGFloat v36 = -[PKTextInputElement coordinateSpace]((uint64_t)v22);
        double v37 = -[PKTextInputCanvasController convertRect:toCanvasFromCoordinateSpace:](v28, v36, v29, v31, v33, v35);
        double v39 = v38;
        double v41 = v40;
        double v43 = v42;

        id v44 = objc_alloc(MEMORY[0x1E4F5C0A8]);
        id v45 = v22[14];
        double v27 = objc_msgSend(v44, "initWithIdentifier:frame:", v45, v37, v39, v41, v43);

        double v46 = [(PKTextInputHandwritingShot *)self _potentiallyTargetedElementRecognitionIDs];

        if (!v46)
        {
          id v47 = objc_alloc_init(MEMORY[0x1E4F28E60]);
          [(PKTextInputHandwritingShot *)self set_potentiallyTargetedElementRecognitionIDs:v47];
        }
        double v48 = [(PKTextInputHandwritingShot *)self _potentiallyTargetedElementRecognitionIDs];
        id v49 = v22[14];
        objc_msgSend(v48, "addIndex:", objc_msgSend(v49, "unsignedIntegerValue"));
      }
    }
    else
    {
      double v27 = 0;
    }
  }
  else
  {
    double v27 = 0;
  }

  return v27;
}

- (BOOL)_shouldTargetFirstResponderElement:(id)a3 strokeIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v28 = 0;
  double v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  double v8 = [(PKTextInputHandwritingShot *)self strokeProvider];
  [v8 boundsForSliceIdentifiers:v7];
  if (*((unsigned char *)v29 + 24)) {
    goto LABEL_3;
  }
  uint64_t v13 = v9;
  uint64_t v14 = v10;
  uint64_t v15 = v11;
  uint64_t v16 = v12;
  uint64_t v17 = [(PKTextInputHandwritingShot *)self _inputElementsByRecognitionID];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__PKTextInputHandwritingShot__shouldTargetFirstResponderElement_strokeIdentifiers___block_invoke;
  v20[3] = &unk_1E64C7170;
  double v22 = self;
  uint64_t v23 = &v28;
  id v21 = v6;
  uint64_t v24 = v13;
  uint64_t v25 = v14;
  uint64_t v26 = v15;
  uint64_t v27 = v16;
  [v17 enumerateKeysAndObjectsUsingBlock:v20];

  if (*((unsigned char *)v29 + 24))
  {
LABEL_3:
    if ([(PKTextInputHandwritingShot *)self cursorIsWeakAtStart])
    {
      BOOL v18 = 0;
      *((unsigned char *)v29 + 24) = 0;
    }
    else
    {
      BOOL v18 = *((unsigned char *)v29 + 24) != 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  _Block_object_dispose(&v28, 8);
  return v18;
}

void __83__PKTextInputHandwritingShot__shouldTargetFirstResponderElement_strokeIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v31 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = a2;
  if (v7) {
    uint64_t v9 = *(void **)(v7 + 112);
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;
  int v11 = [v8 isEqualToNumber:v10];

  if (v11)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v12 = v31;
  }
  else
  {
    uint64_t v13 = -[PKTextInputElement coordinateSpace]((uint64_t)v31);

    uint64_t v12 = v31;
    if (v13)
    {
      uint64_t v14 = [*(id *)(a1 + 40) canvasController];
      double v15 = -[PKTextInputElement frame]((uint64_t)v31);
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v22 = -[PKTextInputElement coordinateSpace]((uint64_t)v31);
      double v23 = -[PKTextInputCanvasController convertRect:toCanvasFromCoordinateSpace:](v14, v22, v15, v17, v19, v21);
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;

      v33.origin.double x = v23;
      v33.origin.double y = v25;
      v33.size.double width = v27;
      v33.size.double height = v29;
      CGRect v34 = CGRectIntersection(v33, *(CGRect *)(a1 + 56));
      BOOL IsNull = CGRectIsNull(v34);
      uint64_t v12 = v31;
      if (!IsNull)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        *a4 = 1;
      }
    }
  }
}

- (void)recognitionManager:(id)a3 fetchContentInfoForTextInputTarget:(id)a4 strokeIdentifiers:(id)a5 completion:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, void *))a6;
  uint64_t v13 = [(PKTextInputHandwritingShot *)self _submittedTargetContentInfoByTargetID];
  uint64_t v14 = [v10 inputTargetIdentifier];
  double v15 = [v13 objectForKeyedSubscript:v14];

  if (v15)
  {
    v12[2](v12, v15);
  }
  else
  {
    double v16 = [v10 inputTargetIdentifier];
    double v17 = [(PKTextInputHandwritingShot *)self textInputElementForRecognitionIdentifier:v16];

    if (v17
      && (-[PKTextInputElement coordinateSpace]((uint64_t)v17),
          double v18 = objc_claimAutoreleasedReturnValue(),
          v18,
          v18))
    {
      double v19 = [v11 allObjects];
      double v20 = [(PKTextInputHandwritingShot *)self strokeProvider];
      [v20 startingPointForSlicesWithIdentifiers:v19];
      double v22 = v21;
      double v24 = v23;

      CGFloat v25 = [(PKTextInputHandwritingShot *)self strokeProvider];
      [v25 boundsForSliceIdentifiers:v19];
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;

      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __113__PKTextInputHandwritingShot_recognitionManager_fetchContentInfoForTextInputTarget_strokeIdentifiers_completion___block_invoke;
      v36[3] = &unk_1E64C7198;
      v36[4] = self;
      id v37 = v10;
      id v38 = v11;
      double v39 = v12;
      -[PKTextInputHandwritingShot _loadAndSaveContentFocusingIfNeededForElement:referenceCanvasPoint:strokesBounds:completion:](self, "_loadAndSaveContentFocusingIfNeededForElement:referenceCanvasPoint:strokesBounds:completion:", v17, v36, v22, v24, v27, v29, v31, v33);
    }
    else
    {
      CGRect v34 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        double v35 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 134218754;
        double v41 = self;
        __int16 v42 = 2112;
        double v43 = v35;
        __int16 v44 = 2112;
        id v45 = v10;
        __int16 v46 = 2112;
        id v47 = self;
        _os_log_error_impl(&dword_1C44F8000, v34, OS_LOG_TYPE_ERROR, "HWShot %p %@, no element found for text input target %@. Returning nil content info. Shot: %@", buf, 0x2Au);
      }
      v12[2](v12, 0);
    }
  }
}

void __113__PKTextInputHandwritingShot_recognitionManager_fetchContentInfoForTextInputTarget_strokeIdentifiers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _contentInfoFromElementContent:a2 textInputTarget:*(void *)(a1 + 40) strokeIdentifiers:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _saveSubmittedTargetContentInfo:v3];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)submittedTargetContentInfoForRecognitionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTextInputHandwritingShot *)self _submittedTargetContentInfoByTargetID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)_saveSubmittedTargetContentInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTextInputHandwritingShot *)self _submittedTargetContentInfoByTargetID];
  id v8 = (id)[v5 mutableCopy];

  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v6 = [v4 textInputTarget];
  uint64_t v7 = [v6 inputTargetIdentifier];
  [v8 setObject:v4 forKeyedSubscript:v7];

  [(PKTextInputHandwritingShot *)self set_submittedTargetContentInfoByTargetID:v8];
}

- (_NSRange)_selectedTextRangeForElementContent:(id)a3 textInputTarget:(id)a4 strokeSliceIdentifiers:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (id *)a3;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = -[PKTextInputElementContent selectedRange]((uint64_t)v9);
  NSUInteger v14 = v13;
  double v15 = [(PKTextInputHandwritingShot *)self delegate];
  double v16 = [v11 inputTargetIdentifier];

  NSUInteger v17 = [v15 handwritingShot:self inProgressGestureInitialSelectedRangeForElementRecognitionIdentifier:v16];
  NSUInteger v19 = v18;

  if (v17 == 0x7FFFFFFFFFFFFFFFLL || v17 + v19 > -[PKTextInputElementContent contentLength]((uint64_t)v9))
  {
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v9) {
        id v20 = v9[1];
      }
      else {
        id v20 = 0;
      }
      id v21 = v20;
      char v22 = -[PKTextInputElement isFocused]((uint64_t)v21);

      if (v22) {
        goto LABEL_14;
      }
      double v23 = [(PKTextInputHandwritingShot *)self strokeProvider];
      [v23 centroidForSlicesWithIdentifiers:v10];
      double v25 = v24;
      double v27 = v26;

      double v28 = [(PKTextInputHandwritingShot *)self canvasController];
      double v29 = -[PKTextInputCanvasController canvasCoordinateSpace](v28);
      double v30 = v29;
      if (v9)
      {
        NSUInteger v17 = [(PKTextInputElementContent *)v9 characterIndexClosestToPoint:1 inCoordinateSpace:1 forInsertingText:v25 adjustForLastCharacter:v27];

        NSUInteger v19 = 0;
        uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
        if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_16;
        }
      }
      else
      {

        NSUInteger v17 = 0;
        NSUInteger v19 = 0;
      }
    }
    else
    {
      NSUInteger v17 = v12;
      NSUInteger v19 = v14;
    }
  }
  if (v19 + v17 <= -[PKTextInputElementContent contentLength]((uint64_t)v9))
  {
    uint64_t v31 = v17;
    goto LABEL_16;
  }
  double v32 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    double v35 = NSStringFromSelector(a2);
    v53.id location = v17;
    v53.length = v19;
    CGFloat v36 = NSStringFromRange(v53);
    uint64_t v37 = -[PKTextInputElementContent contentLength]((uint64_t)v9);
    if (v9) {
      id v38 = v9[1];
    }
    else {
      id v38 = 0;
    }
    id v39 = v38;
    int v40 = 134219266;
    double v41 = self;
    __int16 v42 = 2112;
    double v43 = v35;
    __int16 v44 = 2112;
    id v45 = v36;
    __int16 v46 = 2048;
    uint64_t v47 = v37;
    __int16 v48 = 2112;
    id v49 = v39;
    __int16 v50 = 2112;
    v51 = self;
    _os_log_error_impl(&dword_1C44F8000, v32, OS_LOG_TYPE_ERROR, "HWShot %p %@, Invalid selected range %@ for content length %ld. Reverting to undefined. Element: %@. Shot: %@.", (uint8_t *)&v40, 0x3Eu);
  }
LABEL_14:
  NSUInteger v19 = 0;
  uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_16:

  NSUInteger v33 = v31;
  NSUInteger v34 = v19;
  result.length = v34;
  result.id location = v33;
  return result;
}

- (id)_contentInfoFromElementContent:(id)a3 textInputTarget:(id)a4 strokeIdentifiers:(id)a5
{
  uint64_t v9 = (id *)a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc_init(MEMORY[0x1E4F5C058]);
  [v12 setTextInputTarget:v10];
  [v12 setTextContentLength:-[PKTextInputElementContent contentLength]((uint64_t)v9)];
  objc_msgSend(v12, "setActivePreviewRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  objc_msgSend(v12, "setContentType:", -[PKTextInputHandwritingShot _contentTypeForElementContent:](self, "_contentTypeForElementContent:", v9));
  NSUInteger v13 = [(PKTextInputHandwritingShot *)self delegate];
  NSUInteger v14 = [v10 inputTargetIdentifier];
  objc_msgSend(v12, "setLastCharacterLevelPosition:", objc_msgSend(v13, "handwritingShot:lastCharacterLevelPositionForElementRecognitionIdentifier:", self, v14));

  uint64_t v15 = -[PKTextInputElementContent isSingleLineDocumentContent]((uint64_t)v9);
  [v12 setIsSingleLine:v15];
  if (objc_opt_respondsToSelector())
  {
    if (v15) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = -[PKTextInputElementContent supportsAutoLineBreaks]((uint64_t)v9);
    }
    [v12 setSupportsAutoLineBreaks:v16];
  }
  objc_msgSend(v12, "setIsCursorStrong:", -[PKTextInputHandwritingShot cursorIsWeakAtStart](self, "cursorIsWeakAtStart") ^ 1);
  if (v9)
  {
    id v17 = v9[2];
    objc_msgSend(v12, "setAutoCapitalizationMode:", -[PKTextInputHandwritingShot _autoCapitalizationModeForTextInputTraits:](self, "_autoCapitalizationModeForTextInputTraits:", v17));

    id v18 = v9[2];
  }
  else
  {
    objc_msgSend(v12, "setAutoCapitalizationMode:", -[PKTextInputHandwritingShot _autoCapitalizationModeForTextInputTraits:](self, "_autoCapitalizationModeForTextInputTraits:", 0));
    id v18 = 0;
  }
  id v19 = v18;
  objc_msgSend(v12, "setAutoCorrectionMode:", -[PKTextInputHandwritingShot _autoCorrectionModeForTextInputTraits:](self, "_autoCorrectionModeForTextInputTraits:", v19));

  uint64_t v20 = [v11 allObjects];
  uint64_t v21 = [(PKTextInputHandwritingShot *)self _selectedTextRangeForElementContent:v9 textInputTarget:v10 strokeSliceIdentifiers:v20];
  objc_msgSend(v12, "setSelectedTextRange:", v21, v22);
  double v23 = [v10 inputTargetIdentifier];
  uint64_t v24 = [(PKTextInputHandwritingShot *)self textInputElementForRecognitionIdentifier:v23];

  v72 = v11;
  SEL v66 = a2;
  v68 = (void *)v24;
  if (v24) {
    id WeakRetained = objc_loadWeakRetained((id *)(v24 + 104));
  }
  else {
    id WeakRetained = 0;
  }
  double v26 = (void *)MEMORY[0x1E4FB0850];
  double v27 = [MEMORY[0x1E4F1CA20] currentLocale];
  double v28 = [v27 languageIdentifier];
  uint64_t v29 = [v26 defaultWritingDirectionForLanguage:v28];

  if (v9) {
    id v30 = v9[1];
  }
  else {
    id v30 = 0;
  }
  id v31 = v30;
  uint64_t v32 = [v31 activeAffectedRange];

  v71 = (void *)v20;
  v67 = WeakRetained;
  if (v32 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9) {
      id v33 = v9[9];
    }
    else {
      id v33 = 0;
    }
    id v34 = v33;
    double v35 = [v34 contextBefore];

    uint64_t v36 = [v35 length];
    if (v36) {
      uint64_t v29 = [v35 _isNaturallyRTL];
    }
    objc_msgSend(v12, "setBaseWritingDirection:", -[PKTextInputHandwritingShot chWritingDirectionFrom:useDefault:](self, "chWritingDirectionFrom:useDefault:", v29, v36 == 0));
  }
  else
  {
    uint64_t v37 = [WeakRetained beginningOfDocument];
    double v35 = [WeakRetained positionFromPosition:v37 offset:v32];

    id v38 = [WeakRetained tokenizer];
    id v39 = [v38 rangeEnclosingPosition:v35 withGranularity:4 inDirection:v29];
    int v40 = [WeakRetained textInRange:v39];
    uint64_t v41 = [v40 length];
    if (v41) {
      uint64_t v29 = [v40 _isNaturallyRTL];
    }
    objc_msgSend(v12, "setBaseWritingDirection:", -[PKTextInputHandwritingShot chWritingDirectionFrom:useDefault:](self, "chWritingDirectionFrom:useDefault:", v29, v41 == 0));

    uint64_t v20 = (uint64_t)v71;
  }

  __int16 v42 = [(PKTextInputHandwritingShot *)self strokeProvider];
  [v10 frame];
  int v43 = objc_msgSend(v42, "slicesWithIdentifiers:significantlyOverlapRect:", v20);

  objc_msgSend(v12, "setStrokeCoveredTextRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  if (v43)
  {
    uint64_t v44 = [(PKTextInputHandwritingShot *)self _correctableTextRangeIntersectingStrokesWithIdentifiers:v72 inInputTarget:v10 elementContent:v9];
    objc_msgSend(v12, "setStrokeCoveredTextRange:", v44, v45);
  }
  v69 = v10;
  uint64_t v46 = [v12 strokeCoveredTextRange];
  uint64_t v48 = v47;
  uint64_t v49 = [v12 textContentLength];
  uint64_t v50 = [v12 selectedTextRange];
  uint64_t v52 = -[PKTextInputHandwritingShot _substringReferenceRangeForStrokeCoveredRange:contentLength:selectedRange:](self, "_substringReferenceRangeForStrokeCoveredRange:contentLength:selectedRange:", v46, v48, v49, v50, v51);
  size_t v54 = v53;
  -[PKTextInputHandwritingShot _textContentSubstringInRange:forElementContent:](self, "_textContentSubstringInRange:forElementContent:", v52, v53, v9);
  long long v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v54 == [(__CFString *)v55 length])
  {
    v56 = 0;
  }
  else
  {
    v56 = [MEMORY[0x1E4F28E78] string];
  }
  uint64_t v57 = malloc_type_calloc(v54, 0x20uLL, 0x1000040E0EAB150uLL);
  v70 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 65532);
  if (v52 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v82[0] = 0;
    v82[1] = v82;
    v82[2] = 0x2020000000;
    v82[3] = 0;
    v58 = [(PKTextInputHandwritingShot *)self canvasController];
    v59 = -[PKTextInputCanvasController canvasCoordinateSpace](v58);
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __95__PKTextInputHandwritingShot__contentInfoFromElementContent_textInputTarget_strokeIdentifiers___block_invoke;
    v73[3] = &unk_1E64C71C0;
    uint64_t v78 = v52;
    size_t v79 = v54;
    v77 = v82;
    v73[4] = self;
    SEL v80 = v66;
    v81 = v57;
    id v74 = v56;
    v75 = v9;
    v76 = v70;
    [(PKTextInputElementContent *)(uint64_t)v75 enumerateBoundsForCharactersInRange:v54 inCoordinateSpace:v59 reverse:0 block:v73];

    _Block_object_dispose(v82, 8);
  }
  if (v56)
  {
    v60 = v56;
  }
  else if (v55)
  {
    v60 = v55;
  }
  else
  {
    v60 = &stru_1F1FB2C00;
  }
  objc_msgSend(v12, "setReferenceSubstring:range:characterRects:", v60, v52, v54, v57);
  free(v57);
  v61 = -[PKTextInputHandwritingShot _protectedCharacterIndexesInRange:forElementContent:](self, "_protectedCharacterIndexesInRange:forElementContent:", v52, v54, v9);
  [v12 setProtectedCharacterIndexes:v61];

  v62 = [(PKTextInputHandwritingShot *)self delegate];
  v63 = [v69 inputTargetIdentifier];
  objc_msgSend(v12, "setContainsCommittedStrokes:", objc_msgSend(v62, "handwritingShot:hasCommittedResultsInSessionToElementRecognitionIdentifier:", self, v63));

  v64 = (void *)[v12 copy];

  return v64;
}

void __95__PKTextInputHandwritingShot__contentInfoFromElementContent_textInputTarget_strokeIdentifiers___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v8 >= *(void *)(a1 + 80))
  {
    NSUInteger v13 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 88));
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      id v17 = NSStringFromRange(*(NSRange *)(a1 + 72));
      uint64_t v18 = *(void *)(a1 + 32);
      int v19 = 134219010;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      double v26 = v17;
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      _os_log_error_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_ERROR, "HWShot %p %@, character offset %ld beyond range %@ when enumerating char bounds. Shot: %@", (uint8_t *)&v19, 0x34u);
    }
    *a3 = 1;
  }
  else
  {
    uint64_t v9 = (double *)(*(void *)(a1 + 96) + 32 * v8);
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    if (*(void *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_textContentSubstringInRange:forElementContent:", a2, 1, *(void *)(a1 + 48));
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = v10;
      if ([v10 length] != 1)
      {
        id v11 = *(id *)(a1 + 56);
      }
      [*(id *)(a1 + 40) appendString:v11];
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
}

- (int)chWritingDirectionFrom:(int64_t)a3 useDefault:(BOOL)a4
{
  int v4 = 254;
  int v5 = 255;
  if (!a4) {
    int v5 = 1;
  }
  int v6 = 254;
  if (!a4) {
    int v6 = 0;
  }
  if (!a3) {
    int v4 = v6;
  }
  if (a3 == 1) {
    return v5;
  }
  else {
    return v4;
  }
}

- (_NSRange)_substringReferenceRangeForStrokeCoveredRange:(_NSRange)a3 contentLength:(int64_t)a4 selectedRange:(_NSRange)a5
{
  BOOL v7 = a3.location != 0x7FFFFFFFFFFFFFFFLL && a3.length != 0;
  BOOL v8 = v7 && a3.location + a3.length <= a4;
  if (v8) {
    NSUInteger length = a3.length;
  }
  else {
    NSUInteger length = 0;
  }
  if (v7 && a3.location + a3.length <= a4) {
    NSUInteger location = a3.location;
  }
  else {
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a5.location == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_18:
    if (location == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v11 = 0;
    }
    else {
      NSUInteger v11 = length;
    }
    if (location == 0x7FFFFFFFFFFFFFFFLL) {
      a5.NSUInteger location = a4;
    }
    else {
      a5.NSUInteger location = location;
    }
    goto LABEL_24;
  }
  NSUInteger v11 = 2000;
  if (a5.length < 0x7D0) {
    NSUInteger v11 = a5.length;
  }
  if (v8)
  {
    v18.NSUInteger location = a5.location;
    v18.NSUInteger length = v11;
    NSRange v12 = NSUnionRange(a3, v18);
    NSUInteger length = v12.length;
    NSUInteger location = v12.location;
    goto LABEL_18;
  }
LABEL_24:
  NSUInteger v13 = 60;
  if (a5.location < 0x3C) {
    NSUInteger v13 = a5.location;
  }
  NSUInteger v14 = a5.location - v13;
  NSUInteger v15 = v11 + v13 + 60 - ((v11 + 60 - a4 + a5.location) & ~((uint64_t)(v11 + 60 - a4 + a5.location) >> 63));
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

- (int)_contentTypeForElementContent:(id)a3
{
  id v3 = (id *)a3;
  int v4 = -[PKTextInputElementContent textContentType](v3);
  if (v4)
  {
    int v5 = [(id)objc_opt_class() _contentTypeFromTextContentType:v4];
  }
  else
  {
    if (v3) {
      uint64_t v6 = [v3[2] keyboardType];
    }
    else {
      uint64_t v6 = 0;
    }
    int v5 = [(id)objc_opt_class() _contentTypeFromKeyboardType:v6];
  }
  int v7 = v5;

  return v7;
}

- (int)_autoCapitalizationModeForTextInputTraits:(id)a3
{
  unint64_t v3 = [a3 autocapitalizationType];
  if (v3 > 3) {
    return 3;
  }
  else {
    return dword_1C4829760[v3];
  }
}

- (int)_autoCorrectionModeForTextInputTraits:(id)a3
{
  if ([a3 autocorrectionType] == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)_textContentSubstringInRange:(_NSRange)a3 forElementContent:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  int v7 = v6;
  if (location == 0x7FFFFFFFFFFFFFFFLL
    || !length
    || ([(PKTextInputElementContent *)(uint64_t)v6 stringInRange:length],
        (BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v8 = &stru_1F1FB2C00;
  }

  return v8;
}

- (id)_protectedCharacterIndexesInRange:(_NSRange)a3 forElementContent:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  int v7 = v6;
  if (location == 0x7FFFFFFFFFFFFFFFLL
    || !length
    || ([(PKTextInputElementContent *)(uint64_t)v6 protectedCharacterIndexesInRange:length],
        (BOOL v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v8 = [MEMORY[0x1E4F28D60] indexSet];
  }

  return v8;
}

- (_NSRange)_correctableTextRangeIntersectingStrokesWithIdentifiers:(id)a3 inInputTarget:(id)a4 elementContent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  NSUInteger v11 = [(PKTextInputHandwritingShot *)self delegate];
  NSRange v12 = [v9 inputTargetIdentifier];
  uint64_t v13 = [v11 handwritingShot:self activePreviewRangeForElementRecognitionIdentifier:v12 queryItemStableIdentifier:0];
  uint64_t v15 = v14;

  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  if ((v13 == 0x7FFFFFFFFFFFFFFFLL || !v15) && -[PKTextInputElementContent contentLength]((uint64_t)v10))
  {
    id v17 = [(PKTextInputHandwritingShot *)self strokeProvider];
    NSRange v18 = [v8 allObjects];
    [v17 boundsForSliceIdentifiers:v18];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    __int16 v27 = [(PKTextInputHandwritingShot *)self canvasController];
    uint64_t v28 = -[PKTextInputCanvasController canvasCoordinateSpace](v27);

    uint64_t v29 = [(PKTextInputHandwritingShot *)self delegate];
    char v30 = objc_msgSend(v29, "handwritingShot:shouldSuppressGesturesForStrokesBounds:coordinateSpace:", self, v28, v20, v22, v24, v26);

    if ((v30 & 1) != 0
      || (!v10 ? (id v31 = 0) : (id v31 = (void *)v10[1]),
          id v32 = v31,
          -[PKTextInputElement coordinateSpace]((uint64_t)v32),
          id v33 = objc_claimAutoreleasedReturnValue(),
          v33,
          v32,
          !v33))
    {
      NSUInteger v35 = 0;
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v16 = -[PKTextInputHandwritingShot _editingGestureCorrectableRangeForStrokeBounds:InInputTarget:elementContent:](self, "_editingGestureCorrectableRangeForStrokeBounds:InInputTarget:elementContent:", v9, v10, v20, v22, v24, v26);
      NSUInteger v35 = v34;
    }
  }
  else
  {
    NSUInteger v35 = 0;
  }
  if (v35) {
    uint64_t v36 = v16;
  }
  else {
    uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v37 = v36;
  NSUInteger v38 = v35;
  result.NSUInteger length = v38;
  result.NSUInteger location = v37;
  return result;
}

- (_NSRange)_editingGestureCorrectableRangeForStrokeBounds:(CGRect)a3 InInputTarget:(id)a4 elementContent:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  NSRange v12 = a5;
  uint64_t v13 = (uint64_t)v12;
  if (v12) {
    uint64_t v14 = (void *)v12[1];
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;
  uint64_t v16 = -[PKTextInputElement coordinateSpace]((uint64_t)v15);

  if (v16)
  {
    id v17 = [(PKTextInputHandwritingShot *)self canvasController];
    NSRange v18 = -[PKTextInputCanvasController canvasCoordinateSpace](v17);

    double v19 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v18, v16, x, y, width, height);
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    double v64 = width;
    double v65 = height;
    if (v13) {
      double v26 = *(void **)(v13 + 8);
    }
    else {
      double v26 = 0;
    }
    id v27 = v26;
    double v28 = -[PKTextInputElement frame]((uint64_t)v27);
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;

    v92.origin.double x = v19;
    v92.origin.double y = v21;
    v92.size.double width = v23;
    v92.size.double height = v25;
    v98.origin.double x = v28;
    v98.origin.double y = v30;
    v98.size.double width = v32;
    v98.size.double height = v34;
    CGRect v93 = CGRectIntersection(v92, v98);
    double v35 = v93.origin.x;
    double v36 = v93.origin.y;
    CGFloat v37 = v93.size.width;
    CGFloat v38 = v93.size.height;
    unint64_t v39 = -[PKTextInputElementContent contentLength](v13);
    if (v13) {
      uint64_t v40 = [(PKTextInputElementContent *)(id *)v13 characterIndexClosestToPoint:0 inCoordinateSpace:1 forInsertingText:v35 adjustForLastCharacter:v36];
    }
    else {
      uint64_t v40 = 0;
    }
    v94.origin.double x = v35;
    v94.origin.double y = v36;
    v94.size.double width = v37;
    v94.size.double height = v38;
    double MaxX = CGRectGetMaxX(v94);
    if (v13) {
      uint64_t v42 = [(PKTextInputElementContent *)(id *)v13 characterIndexClosestToPoint:0 inCoordinateSpace:1 forInsertingText:MaxX adjustForLastCharacter:v36];
    }
    else {
      uint64_t v42 = 0;
    }
    uint64_t v87 = 0;
    v88 = &v87;
    uint64_t v89 = 0x2020000000;
    if (v40 >= v42) {
      uint64_t v43 = v42;
    }
    else {
      uint64_t v43 = v40;
    }
    uint64_t v90 = v43;
    v95.origin.double x = v35;
    v95.origin.double y = v36;
    v95.size.double width = v37;
    v95.size.double height = v38;
    double MaxY = CGRectGetMaxY(v95);
    if (v13) {
      uint64_t v45 = [(PKTextInputElementContent *)(id *)v13 characterIndexClosestToPoint:0 inCoordinateSpace:1 forInsertingText:v35 adjustForLastCharacter:MaxY];
    }
    else {
      uint64_t v45 = 0;
    }
    v96.origin.double x = v35;
    v96.origin.double y = v36;
    v96.size.double width = v37;
    v96.size.double height = v38;
    double v46 = CGRectGetMaxX(v96);
    v97.origin.double x = v35;
    v97.origin.double y = v36;
    v97.size.double width = v37;
    v97.size.double height = v38;
    double v47 = CGRectGetMaxY(v97);
    if (v13) {
      uint64_t v48 = [(PKTextInputElementContent *)(id *)v13 characterIndexClosestToPoint:0 inCoordinateSpace:1 forInsertingText:v46 adjustForLastCharacter:v47];
    }
    else {
      uint64_t v48 = 0;
    }
    uint64_t v49 = 0;
    uint64_t v83 = 0;
    v84 = &v83;
    uint64_t v85 = 0x2020000000;
    if (v45 <= v48) {
      uint64_t v50 = v48;
    }
    else {
      uint64_t v50 = v45;
    }
    uint64_t v86 = v50;
    uint64_t v51 = v88[3];
    uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
    if (v51 != 0x7FFFFFFFFFFFFFFFLL && v50 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke;
      v82[3] = &unk_1E64C71E8;
      if (v51 <= 20) {
        uint64_t v53 = 20;
      }
      else {
        uint64_t v53 = v51;
      }
      *(double *)&void v82[5] = v35;
      *(double *)&v82[6] = v36;
      *(CGFloat *)&v82[7] = v37;
      *(CGFloat *)&v82[8] = v38;
      v82[4] = &v87;
      [(PKTextInputElementContent *)v13 enumerateBoundsForCharactersInRange:v51 - v53 + 21 inCoordinateSpace:v16 reverse:1 block:v82];
      uint64_t v54 = v84[3];
      v81[0] = MEMORY[0x1E4F143A8];
      if ((uint64_t)(v39 - v54) >= 20) {
        uint64_t v55 = 20;
      }
      else {
        uint64_t v55 = v39 - v54;
      }
      v81[1] = 3221225472;
      v81[2] = __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke_2;
      v81[3] = &unk_1E64C71E8;
      *(double *)&v81[5] = v35;
      *(double *)&v81[6] = v36;
      *(CGFloat *)&v81[7] = v37;
      *(CGFloat *)&v81[8] = v38;
      v81[4] = &v83;
      [(PKTextInputElementContent *)v13 enumerateBoundsForCharactersInRange:v55 inCoordinateSpace:v16 reverse:0 block:v81];
      uint64_t v56 = v88[3];
      uint64_t v57 = v84[3] - v56 + 1;
      uint64_t v77 = 0;
      uint64_t v78 = &v77;
      uint64_t v79 = 0x2020000000;
      uint64_t v80 = 0x7FFFFFFFFFFFFFFFLL;
      v76[0] = 0;
      v76[1] = v76;
      v76[2] = 0x2020000000;
      v76[3] = 0;
      uint64_t v72 = 0;
      v73 = &v72;
      uint64_t v74 = 0x2020000000;
      uint64_t v75 = 0x7FFFFFFFFFFFFFFFLL;
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke_3;
      v71[3] = &unk_1E64C7210;
      *(double *)&v71[7] = v35;
      *(double *)&v71[8] = v36;
      *(CGFloat *)&v71[9] = v37;
      *(CGFloat *)&v71[10] = v38;
      v71[4] = v76;
      v71[5] = &v77;
      v71[6] = &v72;
      [(PKTextInputElementContent *)v13 enumerateBoundsForCharactersInRange:v57 inCoordinateSpace:v16 reverse:0 block:v71];
      uint64_t v67 = 0;
      v68 = &v67;
      uint64_t v69 = 0x2020000000;
      uint64_t v70 = 0x7FFFFFFFFFFFFFFFLL;
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke_4;
      v66[3] = &unk_1E64C7210;
      *(double *)&v66[7] = v35;
      *(double *)&v66[8] = v36;
      *(CGFloat *)&v66[9] = v37;
      *(CGFloat *)&v66[10] = v38;
      v66[4] = v76;
      v66[5] = &v77;
      v66[6] = &v67;
      [(PKTextInputElementContent *)v13 enumerateBoundsForCharactersInRange:v57 inCoordinateSpace:v16 reverse:1 block:v66];
      uint64_t v58 = v68[3];
      if (v58 == 0x7FFFFFFFFFFFFFFFLL
        || v73[3] == 0x7FFFFFFFFFFFFFFFLL
        || v58 >= -[PKTextInputElementContent contentLength](v13))
      {
        if (v64 >= v65) {
          double v59 = v64;
        }
        else {
          double v59 = v65;
        }
        uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v49 = 0;
        if (v59 <= 10.0)
        {
          unint64_t v60 = v78[3];
          if (v60 != 0x7FFFFFFFFFFFFFFFLL && v60 < v39)
          {
            uint64_t v52 = -[PKTextInputElementContent rangeOfCharacterAtIndex:](v13, v60);
            uint64_t v49 = v61;
          }
        }
      }
      else
      {
        uint64_t v52 = v73[3];
        uint64_t v49 = v68[3] - v52 + 1;
      }
      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(&v72, 8);
      _Block_object_dispose(v76, 8);
      _Block_object_dispose(&v77, 8);
    }
    _Block_object_dispose(&v83, 8);
    _Block_object_dispose(&v87, 8);
  }
  else
  {
    uint64_t v49 = 0;
    uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v62 = v52;
  NSUInteger v63 = v49;
  result.NSUInteger length = v63;
  result.NSUInteger location = v62;
  return result;
}

BOOL __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  v11.size.double height = a7;
  v11.size.double width = a6;
  v11.origin.double y = a5;
  v11.origin.double x = a4;
  BOOL result = CGRectIntersectsRect(*(CGRect *)(a1 + 40), v11);
  if (result) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  else {
    *a3 = 1;
  }
  return result;
}

BOOL __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke_2(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v9.size.double height = a6;
  v9.size.double width = a5;
  v9.origin.double y = a4;
  v9.origin.double x = a3;
  BOOL result = CGRectIntersectsRect(*(CGRect *)(a1 + 40), v9);
  if (result) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  return result;
}

void __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke_3(uint64_t a1, uint64_t a2, unsigned char *a3, double a4, double a5, double a6, double a7)
{
  CGRect v15 = CGRectIntersection(*(CGRect *)&a4, *(CGRect *)(a1 + 56));
  if (v15.size.width >= v15.size.height) {
    double width = v15.size.width;
  }
  else {
    double width = v15.size.height;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  if (width > (double)*(unint64_t *)(v13 + 24))
  {
    *(void *)(v13 + 24) = (unint64_t)width;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  if (v15.size.width > a6 * 0.5 || v15.size.height > a7 * 0.5)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
    *a3 = 1;
  }
}

void __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke_4(uint64_t a1, uint64_t a2, unsigned char *a3, double a4, double a5, double a6, double a7)
{
  CGRect v15 = CGRectIntersection(*(CGRect *)&a4, *(CGRect *)(a1 + 56));
  if (v15.size.width >= v15.size.height) {
    double width = v15.size.width;
  }
  else {
    double width = v15.size.height;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  if (width > (double)*(unint64_t *)(v13 + 24))
  {
    *(void *)(v13 + 24) = (unint64_t)width;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  if (v15.size.width > a6 * 0.5 || v15.size.height > a7 * 0.5)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
    *a3 = 1;
  }
}

+ (int)_contentTypeFromTextContentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4FB2FE8]])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FB2F60]])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FB2F68]])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FB2FE0]])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FB2FD8]])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FB2F70]])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (int)_contentTypeFromKeyboardType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA) {
    return 0;
  }
  else {
    return dword_1C4829770[a3 - 1];
  }
}

- (void)reportDebugStateDescription:(id)a3
{
  double v20 = (void (**)(id, __CFString *, __CFString *))a3;
  unint64_t v4 = [(PKTextInputHandwritingShot *)self shotState];
  if (v4 > 4) {
    int v5 = &stru_1F1FB2C00;
  }
  else {
    int v5 = off_1E64C7230[v4];
  }
  v20[2](v20, @"state", v5);
  id v6 = [(PKTextInputHandwritingShot *)self _inputElementsByRecognitionID];
  if (v6)
  {
    int v7 = NSString;
    id v8 = [(PKTextInputHandwritingShot *)self _inputElementsByRecognitionID];
    objc_msgSend(v7, "stringWithFormat:", @"%ld", objc_msgSend(v8, "count"));
    CGRect v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CGRect v9 = @"Not ready";
  }

  v20[2](v20, @"inputElements", v9);
  if ([(PKTextInputHandwritingShot *)self _didRequestTextInputElements]) {
    id v10 = @"Yes";
  }
  else {
    id v10 = @"No";
  }
  v20[2](v20, @"requestedElements", v10);
  CGRect v11 = [(PKTextInputHandwritingShot *)self inputDrawing];
  if (v11)
  {
    NSRange v12 = NSString;
    uint64_t v13 = [(PKTextInputHandwritingShot *)self inputDrawing];
    uint64_t v14 = [v13 strokes];
    objc_msgSend(v12, "stringWithFormat:", @"%ld visible strokes", objc_msgSend(v14, "count"));
    CGRect v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, @"inputDrawing", v15);
  }
  else
  {
    v20[2](v20, @"inputDrawing", @"None");
  }

  uint64_t v16 = [(PKTextInputHandwritingShot *)self inputInProgressStroke];
  if (v16)
  {
    id v17 = NSString;
    NSRange v18 = [(PKTextInputHandwritingShot *)self inputInProgressStroke];
    objc_msgSend(v17, "stringWithFormat:", @"%lu points", objc_msgSend(v18, "_pointsCount"));
    double v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, @"inProgressStroke", v19);
  }
  else
  {
    v20[2](v20, @"inProgressStroke", @"None");
  }
}

- (PKTextInputCanvasController)canvasController
{
  return self->_canvasController;
}

- (PKTextInputElementsController)elementsController
{
  return self->_elementsController;
}

- (PKTextInputHandwritingShotDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTextInputHandwritingShotDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKDrawing)inputDrawing
{
  return self->_inputDrawing;
}

- (PKStroke)inputInProgressStroke
{
  return self->_inputInProgressStroke;
}

- (BOOL)writingIsActiveAtStart
{
  return self->_writingIsActiveAtStart;
}

- (void)setWritingIsActiveAtStart:(BOOL)a3
{
  self->_writingIsActiveAtStart = a3;
}

- (BOOL)cursorIsWeakAtStart
{
  return self->_cursorIsWeakAtStart;
}

- (void)setCursorIsWeakAtStart:(BOOL)a3
{
  self->_cursorIsWeakAtStart = a3;
}

- (BOOL)cursorIsForcedStrongAtStart
{
  return self->_cursorIsForcedStrongAtStart;
}

- (void)setCursorIsForcedStrongAtStart:(BOOL)a3
{
  self->_cursorIsForcedStrongAtStart = a3;
}

- (NSNumber)writingSessionIdentifier
{
  return self->_writingSessionIdentifier;
}

- (void)setWritingSessionIdentifier:(id)a3
{
}

- (int64_t)shotState
{
  return self->_shotState;
}

- (PKTextInputStrokeProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (void)setStrokeProvider:(id)a3
{
}

- (NSArray)resultQueryItems
{
  return self->_resultQueryItems;
}

- (void)_setResultQueryItems:(id)a3
{
}

- (double)recognitionDuration
{
  return self->_recognitionDuration;
}

- (void)setRecognitionDuration:(double)a3
{
  self->_recognitionDuration = a3;
}

- (PKTextInputLanguageSpec)languageSpec
{
  return self->_languageSpec;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (NSDictionary)_inputElementsByRecognitionID
{
  return self->__inputElementsByRecognitionID;
}

- (NSMutableDictionary)_inputElementsContentByRecognitionID
{
  return self->__inputElementsContentByRecognitionID;
}

- (NSMutableIndexSet)_potentiallyTargetedElementRecognitionIDs
{
  return self->__potentiallyTargetedElementRecognitionIDs;
}

- (void)set_potentiallyTargetedElementRecognitionIDs:(id)a3
{
}

- (NSArray)_submittedTextInputTargets
{
  return self->__submittedTextInputTargets;
}

- (void)set_submittedTextInputTargets:(id)a3
{
}

- (NSDictionary)_submittedTargetContentInfoByTargetID
{
  return self->__submittedTargetContentInfoByTargetID;
}

- (void)set_submittedTargetContentInfoByTargetID:(id)a3
{
}

- (double)_lastDrawingUpdateTimestamp
{
  return self->__lastDrawingUpdateTimestamp;
}

- (void)set_lastDrawingUpdateTimestamp:(double)a3
{
  self->__lastDrawingUpdateTimestamp = a3;
}

- (BOOL)_didRequestTextInputElements
{
  return self->__didRequestTextInputElements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__submittedTargetContentInfoByTargetID, 0);
  objc_storeStrong((id *)&self->__submittedTextInputTargets, 0);
  objc_storeStrong((id *)&self->__potentiallyTargetedElementRecognitionIDs, 0);
  objc_storeStrong((id *)&self->__inputElementsContentByRecognitionID, 0);
  objc_storeStrong((id *)&self->__inputElementsByRecognitionID, 0);
  objc_storeStrong((id *)&self->_languageSpec, 0);
  objc_storeStrong((id *)&self->_resultQueryItems, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
  objc_storeStrong((id *)&self->_writingSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_inputInProgressStroke, 0);
  objc_storeStrong((id *)&self->_inputDrawing, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_elementsController, 0);

  objc_storeStrong((id *)&self->_canvasController, 0);
}

@end