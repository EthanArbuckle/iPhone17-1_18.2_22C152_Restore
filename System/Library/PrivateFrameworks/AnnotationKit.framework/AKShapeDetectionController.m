@interface AKShapeDetectionController
+ (BOOL)drawingIsValidForRecognition:(id)a3 withPath:(CGPath *)a4;
- (AKAnnotation)candidateAnnotation;
- (AKCandidatePickerView_iOS)candidatePickerView;
- (AKController)controller;
- (AKPageModelController)modelControllerToObserveForAnnotationsAndSelections;
- (AKShapeDetectionController)initWithController:(id)a3;
- (AKShapeDetectionControllerDelegate)delegate;
- (BOOL)_isResultVeryHighConfidence:(id)a3;
- (BOOL)coalescesDoodles;
- (BOOL)isPreviousCandidateAnnotationUndecided;
- (BOOL)isShowingCandidatePicker;
- (BOOL)preferDoodle;
- (BOOL)shapeDetectionEnabled;
- (CHDrawing)candidateDrawing;
- (CHDrawing)lastDrawing;
- (CHRecognizer)shapeRecognizer;
- (NSMutableArray)candidateAKTags;
- (NSMutableDictionary)candidateAKTagsToAnnotationInfoMap;
- (double)veryHighConfidenceLevel;
- (id)_createAnnotationWithRecognizerResult:(id)a3 forDrawingBoundsInInputView:(CGRect)a4 shouldGoToPageController:(id *)a5;
- (id)_createDoodleShapeResultWithPath:(CGPath *)a3 withDrawingCenter:(CGPoint)a4 pathIsPrestroked:(BOOL)a5;
- (id)_createFlippedCHDrawingFromCHDrawing:(id)a3 withDrawingCenter:(CGPoint)a4;
- (id)convertDrawingBoundsInInputView:(CGRect)a3 outBoundsInPageModel:(CGRect *)a4;
- (id)createInkResultFromInkDrawing:(id)a3 annotation:(id)a4;
- (int64_t)_matchingBlurEffectStyleForCurrentTintColor:(id)a3;
- (int64_t)_toolTagForCHRecognitionResult:(id)a3;
- (void)_performRecognitionOnDrawing:(id)a3 withInkDrawing:(id)a4 orWithDoodlePath:(CGPath *)a5 boundsInInputView:(CGRect)a6 center:(CGPoint)a7 isPrestroked:(BOOL)a8 optionalAnnotation:(id)a9;
- (void)_pickCandidateResult:(id)a3;
- (void)_pickCandidateResultWithAnnotationType:(int64_t)a3;
- (void)_presentCandidatePickerBarWithCandidates:(id)a3 ofDrawing:(id)a4;
- (void)_shouldDismissNotification:(id)a3;
- (void)_showCandidatePickerWithTypes:(id)a3 forDrawingInInputView:(id)a4 shouldSurfaceDoodle:(BOOL)a5;
- (void)_teardownCandidatePicker;
- (void)_teardownCandidatePickerBar;
- (void)clearPreviousCandidateAnnotation;
- (void)dealloc;
- (void)dismissCandidatePicker;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performRecognitionOnDrawing:(id)a3 withDrawing:(id)a4 annotation:(id)a5 boundsInInputView:(CGRect)a6 center:(CGPoint)a7;
- (void)performRecognitionOnDrawing:(id)a3 withPath:(CGPath *)a4 boundsInInputView:(CGRect)a5 center:(CGPoint)a6 isPrestroked:(BOOL)a7;
- (void)setCandidateAKTags:(id)a3;
- (void)setCandidateAKTagsToAnnotationInfoMap:(id)a3;
- (void)setCandidateAnnotation:(id)a3;
- (void)setCandidateDrawing:(id)a3;
- (void)setCandidatePickerView:(id)a3;
- (void)setCoalescesDoodles:(BOOL)a3;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsPreviousCandidateAnnotationUndecided:(BOOL)a3;
- (void)setLastDrawing:(id)a3;
- (void)setModelControllerToObserveForAnnotationsAndSelections:(id)a3;
- (void)setPreferDoodle:(BOOL)a3;
- (void)setShapeDetectionEnabled:(BOOL)a3;
- (void)setShapeRecognizer:(id)a3;
- (void)setVeryHighConfidenceLevel:(double)a3;
@end

@implementation AKShapeDetectionController

- (AKShapeDetectionController)initWithController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKShapeDetectionController;
  v5 = [(AKShapeDetectionController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(AKShapeDetectionController *)v5 setController:v4];
    [(AKShapeDetectionController *)v6 setVeryHighConfidenceLevel:0.7];
    [(AKShapeDetectionController *)v6 setIsPreviousCandidateAnnotationUndecided:0];
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v6 selector:sel__shouldDismissNotification_ name:@"AKShapeDetectionController.shouldDismissCandidatePicker" object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AKShapeDetectionController;
  [(AKShapeDetectionController *)&v4 dealloc];
}

- (CHRecognizer)shapeRecognizer
{
  shapeRecognizer = self->_shapeRecognizer;
  if (!shapeRecognizer)
  {
    objc_super v4 = (CHRecognizer *)[objc_alloc(MEMORY[0x263F35CA0]) initWithMode:3 locale:0];
    v5 = self->_shapeRecognizer;
    self->_shapeRecognizer = v4;

    v6 = [(CHRecognizer *)self->_shapeRecognizer supportedStrings];
    v7 = (void *)[v6 mutableCopy];

    [v7 removeObject:@"Manhattan Line"];
    v8 = [(CHRecognizer *)self->_shapeRecognizer characterSetForStrings:v7];
    [(CHRecognizer *)self->_shapeRecognizer setActiveCharacterSet:v8];

    shapeRecognizer = self->_shapeRecognizer;
  }

  return shapeRecognizer;
}

- (BOOL)isShowingCandidatePicker
{
  v2 = [(AKShapeDetectionController *)self candidatePickerView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_shouldDismissNotification:(id)a3
{
  if ([(AKShapeDetectionController *)self isShowingCandidatePicker])
  {
    [(AKShapeDetectionController *)self dismissCandidatePicker];
  }
}

- (void)dismissCandidatePicker
{
  if ([(AKShapeDetectionController *)self isPreviousCandidateAnnotationUndecided])
  {
    BOOL v3 = [(AKShapeDetectionController *)self delegate];
    char v4 = [v3 isWaitingToCoalesceStrokes];

    if ((v4 & 1) == 0) {
      [(AKShapeDetectionController *)self clearPreviousCandidateAnnotation];
    }
  }

  [(AKShapeDetectionController *)self _teardownCandidatePicker];
}

- (void)clearPreviousCandidateAnnotation
{
  id v9 = [(AKShapeDetectionController *)self controller];
  BOOL v3 = [(AKShapeDetectionController *)self candidateAnnotation];
  char v4 = [(AKShapeDetectionController *)self delegate];
  v5 = v4;
  if (v3)
  {
    [v4 beginIgnoringAnnotationSelectionObservation:self];
    v6 = [v9 modelController];
    v7 = [v6 pageModelControllerForAnnotation:v3];

    v8 = [v7 mutableArrayValueForKeyPath:@"annotations"];
    [v8 removeObjectIdenticalTo:v3];
    [v5 endIgnoringAnnotationSelectionObservation:self];
  }
  [(AKShapeDetectionController *)self setCandidateAnnotation:0];
  [(AKShapeDetectionController *)self setIsPreviousCandidateAnnotationUndecided:0];
}

- (void)_showCandidatePickerWithTypes:(id)a3 forDrawingInInputView:(id)a4 shouldSurfaceDoodle:(BOOL)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v25 = [(AKShapeDetectionController *)self controller];
  id v9 = [MEMORY[0x263EFF980] array];
  [(AKShapeDetectionController *)self setCandidateAKTags:v9];

  v10 = [MEMORY[0x263EFF9A0] dictionary];
  [(AKShapeDetectionController *)self setCandidateAKTagsToAnnotationInfoMap:v10];

  v28 = v8;
  v11 = (void *)[v8 copy];
  [(AKShapeDetectionController *)self setCandidateDrawing:v11];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v7;
  uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v27 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v16 = [(AKShapeDetectionController *)self candidateAKTags];
        v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "tag"));
        [v16 addObject:v17];

        [v28 bounds];
        id v29 = 0;
        v18 = -[AKShapeDetectionController _createAnnotationWithRecognizerResult:forDrawingBoundsInInputView:shouldGoToPageController:](self, "_createAnnotationWithRecognizerResult:forDrawingBoundsInInputView:shouldGoToPageController:", v15, &v29);
        id v19 = v29;
        v20 = v19;
        if (v19)
        {
          v34[0] = @"AKShapeDetectionController.candidateAnnotation";
          v34[1] = @"AKShapeDetectionController.candidatePageController";
          v35[0] = v18;
          v35[1] = v19;
          v21 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
          v22 = [(AKShapeDetectionController *)self candidateAKTagsToAnnotationInfoMap];
          v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "tag"));
          [v22 setObject:v21 forKey:v23];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v13);
  }

  if ((unint64_t)[obj count] >= 2)
  {
    [(AKShapeDetectionController *)self _presentCandidatePickerBarWithCandidates:obj ofDrawing:v28];
    v24 = [v25 statisticsLogger];
    [v24 logShapeDetectionHUDShown];
  }
}

- (void)_teardownCandidatePicker
{
  [(AKShapeDetectionController *)self _teardownCandidatePickerBar];
  [(AKShapeDetectionController *)self setCandidateAKTags:0];
  [(AKShapeDetectionController *)self setCandidateAKTagsToAnnotationInfoMap:0];
  [(AKShapeDetectionController *)self setCandidateDrawing:0];
  [(AKShapeDetectionController *)self setCandidateAnnotation:0];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"AKShapeDetectionController.didDismissCandidatePicker" object:self];
}

- (int64_t)_toolTagForCHRecognitionResult:(id)a3
{
  int64_t v3 = 763000;
  char v4 = [a3 string];
  v5 = [v4 lowercaseString];

  if ([v5 isEqualToString:@"arrow"])
  {
    int64_t v3 = 764005;
  }
  else if ([v5 isEqualToString:@"outline arrow"])
  {
    int64_t v3 = 764006;
  }
  else if ([v5 isEqualToString:@"line"])
  {
    int64_t v3 = 764003;
  }
  else if ([v5 isEqualToString:@"star"])
  {
    int64_t v3 = 764008;
  }
  else if ([v5 isEqualToString:@"rectangle"])
  {
    int64_t v3 = 764000;
  }
  else if ([v5 isEqualToString:@"rounded rectangle"])
  {
    int64_t v3 = 764001;
  }
  else if ([v5 isEqualToString:@"oval"])
  {
    int64_t v3 = 764002;
  }
  else if ([v5 isEqualToString:@"chat bubble"])
  {
    int64_t v3 = 764007;
  }
  else if ([v5 isEqualToString:@"pentagon"])
  {
    int64_t v3 = 764009;
  }
  else if ([v5 isEqualToString:@"triangle"])
  {
    int64_t v3 = 764010;
  }
  else if ([v5 isEqualToString:@"freeform"])
  {
    int64_t v3 = 764018;
  }
  else if ([v5 isEqualToString:@"heart"])
  {
    int64_t v3 = 764011;
  }
  else if ([v5 isEqualToString:@"cloud"])
  {
    int64_t v3 = 764013;
  }
  else
  {
    NSLog(&cfstr_CouldNotMapChr.isa, v5);
  }

  return v3;
}

- (void)setModelControllerToObserveForAnnotationsAndSelections:(id)a3
{
  v5 = (AKPageModelController *)a3;
  p_modelControllerToObserveForAnnotationsAndSelections = &self->_modelControllerToObserveForAnnotationsAndSelections;
  modelControllerToObserveForAnnotationsAndSelections = self->_modelControllerToObserveForAnnotationsAndSelections;
  id v8 = v5;
  if (modelControllerToObserveForAnnotationsAndSelections != v5)
  {
    if (modelControllerToObserveForAnnotationsAndSelections)
    {
      [(AKPageModelController *)modelControllerToObserveForAnnotationsAndSelections removeObserver:self forKeyPath:@"annotations"];
      [(AKPageModelController *)self->_modelControllerToObserveForAnnotationsAndSelections removeObserver:self forKeyPath:@"selectedAnnotations"];
    }
    objc_storeStrong((id *)&self->_modelControllerToObserveForAnnotationsAndSelections, a3);
    if (*p_modelControllerToObserveForAnnotationsAndSelections)
    {
      [(AKPageModelController *)*p_modelControllerToObserveForAnnotationsAndSelections addObserver:self forKeyPath:@"annotations" options:3 context:@"AKShapeDetectionController.annotationsChangeObservationContext"];
      [(AKPageModelController *)self->_modelControllerToObserveForAnnotationsAndSelections addObserver:self forKeyPath:@"selectedAnnotations" options:0 context:@"AKShapeDetectionController.selectedAnnotationsObservationContext"];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(AKShapeDetectionController *)self delegate];
  v14 = v13;
  if (a6 == @"AKShapeDetectionController.annotationsChangeObservationContext")
  {
    if (([v13 isIgnoringAnnotationAndSelectionKVO:self] & 1) == 0)
    {
      v15 = [v12 objectForKey:*MEMORY[0x263F081C8]];
      v16 = [v12 objectForKey:*MEMORY[0x263F081B8]];
      if ([v15 count] || objc_msgSend(v16, "count")) {
        [(AKShapeDetectionController *)self _teardownCandidatePicker];
      }
    }
  }
  else if (a6 == @"AKShapeDetectionController.selectedAnnotationsObservationContext")
  {
    if (([v13 isIgnoringAnnotationAndSelectionKVO:self] & 1) == 0)
    {
      v17 = [(AKShapeDetectionController *)self modelControllerToObserveForAnnotationsAndSelections];
      v18 = [v17 selectedAnnotations];
      uint64_t v19 = [v18 count];

      if (v19 != 1) {
        [(AKShapeDetectionController *)self _teardownCandidatePicker];
      }
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)AKShapeDetectionController;
    [(AKShapeDetectionController *)&v20 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_presentCandidatePickerBarWithCandidates:(id)a3 ofDrawing:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AKShapeDetectionController *)self candidatePickerView];

  if (!v8)
  {
    id v9 = [(AKShapeDetectionController *)self controller];
    id v10 = [v9 modernToolbarView];
    id v11 = [v10 superview];

    if (v11)
    {
      uint64_t v12 = [v9 modernToolbarView];
      if (!v12)
      {
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v13 = [v9 toolbarView];
      v14 = [v13 superview];

      if (!v14) {
        goto LABEL_23;
      }
      uint64_t v12 = [v9 toolbarView];
      if (!v12) {
        goto LABEL_23;
      }
    }
    v50 = v9;
    v15 = (void *)v12;
    v16 = [MEMORY[0x263EFF980] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v17 = v6;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v52 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          [v7 bounds];
          v23 = -[AKShapeDetectionController _createAnnotationWithRecognizerResult:forDrawingBoundsInInputView:shouldGoToPageController:](self, "_createAnnotationWithRecognizerResult:forDrawingBoundsInInputView:shouldGoToPageController:", v22, 0);
          [v16 addObject:v23];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v19);
    }

    v24 = [v50 delegate];
    v49 = v24;
    if (objc_opt_respondsToSelector())
    {
      v25 = [v24 popoverPresentingViewControllerForAnnotationController:v50];
      v26 = v25;
      if (v25) {
        id v27 = v25;
      }
    }
    else
    {
      v26 = 0;
    }
    v28 = [v26 view];
    id v29 = [v28 superview];

    v48 = v26;
    if (v29) {
      [v26 view];
    }
    else {
    long long v30 = [v15 superview];
    }
    int64_t v31 = -[AKShapeDetectionController _matchingBlurEffectStyleForCurrentTintColor:](self, "_matchingBlurEffectStyleForCurrentTintColor:", v15, v30);
    long long v32 = [AKCandidatePickerView_iOS alloc];
    long long v33 = [(AKShapeDetectionController *)self candidateAKTags];
    v34 = -[AKCandidatePickerView_iOS initWithFrame:items:annotations:target:action:visualStyle:](v32, "initWithFrame:items:annotations:target:action:visualStyle:", v33, v16, self, sel__pickCandidateResult_, v31, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(AKShapeDetectionController *)self setCandidatePickerView:v34];

    v35 = [(AKShapeDetectionController *)self candidatePickerView];
    [v30 addSubview:v35];

    v36 = [(AKShapeDetectionController *)self candidatePickerView];
    uint64_t v37 = [v36 bottomAnchor];
    v38 = [v15 topAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];

    [v39 setConstant:-16.0];
    v40 = [(AKShapeDetectionController *)self candidatePickerView];
    v41 = [v40 centerXAnchor];
    v42 = [v15 centerXAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];

    v44 = (void *)MEMORY[0x263F08938];
    v55[0] = v43;
    v55[1] = v39;
    v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
    [v44 activateConstraints:v45];

    v46 = [(AKShapeDetectionController *)self candidatePickerView];
    [v46 setBarHidden:0 animated:1 completion:&unk_26EA57578];

    id v9 = v50;
    goto LABEL_23;
  }
LABEL_24:
}

- (int64_t)_matchingBlurEffectStyleForCurrentTintColor:(id)a3
{
  return 1;
}

- (void)_teardownCandidatePickerBar
{
  v2 = self;
  int64_t v3 = [(AKShapeDetectionController *)v2 candidatePickerView];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_23763ACD0;
  v5[3] = &unk_264CDAE40;
  id v6 = v2;
  char v4 = v2;
  [v3 setBarHidden:1 animated:0 completion:v5];
}

- (void)_pickCandidateResult:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_S.isa, "-[AKShapeDetectionController _pickCandidateResult:]", v4);
  [v4 tag];

  MEMORY[0x270F9A6D0](self, sel__pickCandidateResultWithAnnotationType_);
}

- (void)_pickCandidateResultWithAnnotationType:(int64_t)a3
{
  id v13 = [(AKShapeDetectionController *)self controller];
  v5 = [(AKShapeDetectionController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 shapeDetectionControllerWillPickCandidate:self isInk:a3 == 764017];
  }
  [(AKShapeDetectionController *)self clearPreviousCandidateAnnotation];
  id v6 = [(AKShapeDetectionController *)self candidateAKTagsToAnnotationInfoMap];
  id v7 = [NSNumber numberWithInteger:a3];
  id v8 = [v6 objectForKey:v7];

  id v9 = [v8 objectForKeyedSubscript:@"AKShapeDetectionController.candidatePageController"];
  id v10 = [v8 objectForKeyedSubscript:@"AKShapeDetectionController.candidateAnnotation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    id v10 = 0;
  }
  else if (v10)
  {
    [v5 beginIgnoringAnnotationSelectionObservation:self];
    id v11 = [v13 toolController];
    objc_msgSend(v11, "addNewAnnotation:onPageController:shouldSelect:shouldCascade:", v10, v9, objc_msgSend(v5, "shapeDetectionController:shouldSelectCandidateAnnotation:", self, v10), 0);

    [v5 endIgnoringAnnotationSelectionObservation:self];
  }
  [(AKShapeDetectionController *)self setCandidateAnnotation:v10];
  [(AKShapeDetectionController *)self setIsPreviousCandidateAnnotationUndecided:0];
  uint64_t v12 = [v13 statisticsLogger];
  [v12 logShapeDetectionHUDPickedShape:v10];

  [(AKShapeDetectionController *)self dismissCandidatePicker];
}

- (void)performRecognitionOnDrawing:(id)a3 withDrawing:(id)a4 annotation:(id)a5 boundsInInputView:(CGRect)a6 center:(CGPoint)a7
{
}

- (void)performRecognitionOnDrawing:(id)a3 withPath:(CGPath *)a4 boundsInInputView:(CGRect)a5 center:(CGPoint)a6 isPrestroked:(BOOL)a7
{
}

- (void)_performRecognitionOnDrawing:(id)a3 withInkDrawing:(id)a4 orWithDoodlePath:(CGPath *)a5 boundsInInputView:(CGRect)a6 center:(CGPoint)a7 isPrestroked:(BOOL)a8 optionalAnnotation:(id)a9
{
  BOOL v10 = a8;
  double y = a7.y;
  double x = a7.x;
  double height = a6.size.height;
  double width = a6.size.width;
  double v15 = a6.origin.y;
  double v16 = a6.origin.x;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v20 = a4;
  id v21 = a9;
  uint64_t v22 = -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", 0, v16, v15, width, height);
  if (!v22) {
    goto LABEL_29;
  }
  BOOL v48 = v10;
  uint64_t v23 = -[AKShapeDetectionController _createFlippedCHDrawingFromCHDrawing:withDrawingCenter:](self, "_createFlippedCHDrawingFromCHDrawing:withDrawingCenter:", v19, x, y);
  v24 = [(AKShapeDetectionController *)self shapeRecognizer];
  uint64_t v57 = (void *)v23;
  v25 = [v24 recognitionResultsForDrawing:v23 options:0];
  v26 = (void *)[v25 mutableCopy];

  uint64_t v27 = [v26 count];
  uint64_t v28 = v27;
  if (v27)
  {
    uint64_t v50 = v27;
    long long v51 = v22;
    long long v52 = self;
    id v53 = v21;
    id v54 = v20;
    id v55 = v19;
    id v29 = [v26 firstObject];
    long long v30 = [v29 string];
    int64_t v31 = [v30 lowercaseString];
    unsigned int v32 = [v31 isEqualToString:@"freeform"];

    unsigned int v58 = v32;
    if (v32) {
      [v26 removeObject:v29];
    }
    v49 = v29;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v33 = (void *)[v26 copy];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v60 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          v39 = [v38 string];
          v40 = [v39 lowercaseString];
          int v41 = [v40 isEqualToString:@"freeform"];

          if (v41) {
            [v26 removeObject:v38];
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v59 objects:v63 count:16];
      }
      while (v35);
    }

    id v20 = v54;
    id v19 = v55;
    self = v52;
    id v21 = v53;
    uint64_t v28 = v50;
    uint64_t v22 = v51;
  }
  else
  {
    unsigned int v58 = 1;
  }
  v42 = [MEMORY[0x263EFF980] array];
  if (v20)
  {
    uint64_t v43 = [(AKShapeDetectionController *)self createInkResultFromInkDrawing:v20 annotation:v21];
LABEL_20:
    v44 = (void *)v43;
    [v42 addObject:v43];

    goto LABEL_21;
  }
  if (a5)
  {
    uint64_t v43 = -[AKShapeDetectionController _createDoodleShapeResultWithPath:withDrawingCenter:pathIsPrestroked:](self, "_createDoodleShapeResultWithPath:withDrawingCenter:pathIsPrestroked:", a5, v48, x, y);
    goto LABEL_20;
  }
LABEL_21:
  if (v28)
  {
    v45 = [v26 objectAtIndex:0];
  }
  else
  {
    v45 = 0;
  }
  if ((v58 & 1) == 0)
  {
    if ([(AKShapeDetectionController *)self _isResultVeryHighConfidence:v45])
    {
      int64_t v46 = [(AKShapeDetectionController *)self _toolTagForCHRecognitionResult:v45];
      if (v46 != 763000)
      {
        id v47 = [[AKShapeToCHRecognitionResult alloc] initWith:v46 result:v45];
        [v42 addObject:v47];
      }
    }
  }
  [(AKShapeDetectionController *)self _showCandidatePickerWithTypes:v42 forDrawingInInputView:v19 shouldSurfaceDoodle:v58];

LABEL_29:
}

- (BOOL)_isResultVeryHighConfidence:(id)a3
{
  [a3 score];
  double v5 = __exp10(v4);
  [(AKShapeDetectionController *)self veryHighConfidenceLevel];
  return v5 > v6;
}

- (id)_createAnnotationWithRecognizerResult:(id)a3 forDrawingBoundsInInputView:(CGRect)a4 shouldGoToPageController:(id *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  uint64_t v12 = [v11 tag];
  id v13 = [v11 result];
  v14 = [(AKShapeDetectionController *)self controller];
  double v15 = [v11 annotation];
  if (v15)
  {
    double v16 = [v11 annotation];
  }
  else
  {
    id v17 = [v14 toolController];
    double v16 = objc_msgSend(v17, "createAnnotationOfType:centeredAtPoint:", v12, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  }
  uint64_t v18 = [(AKShapeDetectionController *)self delegate];
  id v19 = [v18 overlayView:self];

  v252.origin.double x = x;
  v252.origin.double y = y;
  v252.size.double width = width;
  v252.size.double height = height;
  double MidX = CGRectGetMidX(v252);
  v253.origin.double x = x;
  v253.origin.double y = y;
  v253.size.double width = width;
  v253.size.double height = height;
  id v21 = 0;
  double MidY = CGRectGetMidY(v253);
  double v23 = fmax(width, 1.0);
  double v24 = fmax(height, 1.0);
  switch(v12)
  {
    case 764000:
    case 764001:
      id v25 = v16;
      [v13 lowerLeftPoint];
      double v69 = v68;
      double v71 = v70;
      [v13 lowerRightPoint];
      double v238 = v73;
      double v242 = v72;
      [v13 upperRightPoint];
      double v75 = v74;
      double v77 = v76;
      double v78 = (v69 + v74) * 0.5;
      [v13 rotation];
      memset(&m, 0, sizeof(m));
      +[AKGeometryHelper rotationTransformAroundPoint:withAngle:](AKGeometryHelper, "rotationTransformAroundPoint:withAngle:", v78, (v71 + v77) * 0.5, v79 * 3.14159265 / -180.0);
      v254.origin.double x = m.tx + v71 * m.c + m.a * v69;
      v254.origin.double y = m.ty + v71 * m.d + m.b * v69;
      v254.size.double width = m.tx + v238 * m.c + m.a * v242 - v254.origin.x;
      v254.size.double height = m.ty + v77 * m.d + m.b * v75 - (m.ty + v238 * m.d + m.b * v242);
      CGRect v255 = CGRectStandardize(v254);
      memset(&v248, 0, 32);
      id v21 = -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &v248, MidX + v255.origin.x, MidY + v255.origin.y, v255.size.width, v255.size.height);
      [v13 rotation];
      double v81 = v80;
      CGFloat a = v248.a;
      CGFloat b = v248.b;
      CGFloat c = v248.c;
      CGFloat d = v248.d;
      goto LABEL_16;
    case 764002:
      id v25 = v16;
      [v13 center];
      double v87 = v86;
      double v89 = v88;
      [v13 size];
      v256.size.double width = v90;
      v256.size.double height = v91;
      v256.origin.double x = v87 - v90 * 0.5;
      v256.origin.double y = v89 - v91 * 0.5;
      CGRect v257 = CGRectStandardize(v256);
      memset(&m, 0, 32);
      id v21 = -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, MidX + v257.origin.x, MidY + v257.origin.y, v257.size.width, v257.size.height);
      [v13 rotation];
      double v81 = v92;
      CGFloat a = m.a;
      CGFloat b = m.b;
      CGFloat c = m.c;
      CGFloat d = m.d;
LABEL_16:
      sub_23763C2D4(v25, a, b, c, d, v81);
      goto LABEL_29;
    case 764003:
    case 764004:
    case 764005:
      id v25 = v16;
      memset(&m, 0, 32);
      id v21 = -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, x, y, v23, v24);
      v26 = [v21 overlayView];
      [v13 startLocation];
      double v28 = v27;
      double v30 = v29;
      [v13 midpointLocation];
      double v32 = v31;
      double v34 = v33;
      [v13 endLocation];
      double v35 = MidX + v28;
      double v36 = MidY + v30;
      double v37 = MidX + v32;
      double v38 = MidY + v34;
      double v40 = MidX + v39;
      double v42 = MidY + v41;
      objc_msgSend(v19, "convertPoint:toView:", v26, v35, v36);
      double v44 = v43;
      double v46 = v45;
      objc_msgSend(v19, "convertPoint:toView:", v26, v37, v38);
      double v48 = v47;
      double v50 = v49;
      objc_msgSend(v19, "convertPoint:toView:", v26, v40, v42);
      double v52 = v51;
      double v54 = v53;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v44, v46);
      double v56 = v55;
      double v58 = v57;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v48, v50);
      double v60 = v59;
      double v62 = v61;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v52, v54);
      double v64 = v63;
      double v66 = v65;
      objc_msgSend(v25, "setStartPoint:", v56, v58);
      objc_msgSend(v25, "setMidPoint:", v60, v62);
      objc_msgSend(v25, "setEndPoint:", v64, v66);
      [v25 setArrowHeadStyle:0];
      if ([v13 startEndpointType] == 1
        && [v13 endEndpointType] == 1)
      {
        uint64_t v67 = 3;
      }
      else if ([v13 startEndpointType] == 1)
      {
        uint64_t v67 = 1;
      }
      else
      {
        if ([v13 endEndpointType] != 1) {
          goto LABEL_14;
        }
        uint64_t v67 = 2;
      }
      [v25 setArrowHeadStyle:v67];
LABEL_14:

LABEL_29:
LABEL_30:
      if (![v16 originalExifOrientation]) {
        objc_msgSend(v16, "setOriginalExifOrientation:", objc_msgSend(v21, "currentModelToScreenExifOrientation"));
      }
      [v16 originalModelBaseScaleFactor];
      if (v230 == 0.0)
      {
        [v21 modelBaseScaleFactor];
        objc_msgSend(v16, "setOriginalModelBaseScaleFactor:");
      }
      if (a5) {
        *a5 = v21;
      }

      return v16;
    case 764006:
      memset(&m, 0, 32);
      id v93 = v16;
      id v21 = -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, x, y, v23, v24);
      v94 = [v21 overlayView];
      [v13 size];
      double v96 = v95;
      double v243 = v97;
      [v13 center];
      double v99 = v98;
      double v101 = v100;
      [v13 controlPoint];
      double v103 = v102;
      double v105 = v104;
      [v13 rotation];
      __double2 v107 = __sincos_stret(v106 * 3.14159265 / -180.0 + 3.14159265);
      double v108 = v99 + v107.__cosval * (v96 * 0.5);
      double v109 = v101 + v107.__sinval * (v96 * 0.5);
      double v110 = v99 - v107.__cosval * (v96 * 0.5);
      double v111 = v101 - v107.__sinval * (v96 * 0.5);
      double v112 = MidX + v99;
      double v113 = MidY + v101;
      double v114 = MidX + v103;
      double v115 = MidY + v105;
      double v116 = MidX + v108;
      double v117 = MidY + v109;
      double v118 = MidX + v110;
      double v119 = MidY + v111;
      objc_msgSend(v19, "convertPoint:toView:", v94, v112, v113);
      double v121 = v120;
      double v239 = v122;
      objc_msgSend(v19, "convertPoint:toView:", v94, v114, v115);
      double v124 = v123;
      double v126 = v125;
      objc_msgSend(v19, "convertPoint:toView:", v94, v116, v117);
      double v128 = v127;
      double v237 = v129;
      objc_msgSend(v19, "convertPoint:toView:", v94, v118, v119);
      double v235 = v131;
      double v236 = v130;
      objc_msgSend(v19, "convertRect:toView:", v94, 0.0, 0.0, v96, v243);
      double v244 = v132;
      double v233 = v134;
      double v234 = v133;
      double v232 = v135;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v121, v239);
      double v137 = v136;
      double v240 = v138;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v124, v126);
      double v140 = v139;
      double v142 = v141;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v128, v237);
      double v144 = v143;
      double v146 = v145;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v236, v235);
      double v148 = v147;
      double v150 = v149;
      objc_msgSend(v21, "convertRectFromOverlayToModel:", v244, v234, v233, v232);
      double v152 = v151;
      double v154 = v137 + v153 * 0.5 - v140;
      objc_msgSend(v93, "setStartPoint:", v144, v146);
      objc_msgSend(v93, "setEndPoint:", v148, v150);
      [v93 setArrowHeadLength:v154];
      [v93 setArrowHeadWidth:v152];
      [v93 setArrowLineWidth:fabs(v142 - v240 + v142 - v240)];
      goto LABEL_19;
    case 764007:
      id v93 = v16;
      [v13 stemWidth];
      double v156 = v155;
      [v13 size];
      double v158 = v157;
      double v160 = v159;
      [v13 stemLocation];
      double v162 = v161;
      double v164 = v163;
      [v13 center];
      memset(&m, 0, 32);
      id v21 = -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, MidX + v165 - v158 * 0.5, MidY + v166 - v160 * 0.5, v158, v160);
      objc_msgSend(v93, "setRectangle:", m.a, m.b, m.c, m.d);
      v94 = [v21 overlayView];
      objc_msgSend(v19, "convertPoint:toView:", v94, MidX + v162, MidY + v164);
      objc_msgSend(v21, "convertPointFromOverlayToModel:");
      +[AKAnnotationPointOfInterestHelper validatePoint:ofDraggableArea:forAnnotation:onPageController:](AKAnnotationPointOfInterestHelper, "validatePoint:ofDraggableArea:forAnnotation:onPageController:", 10, v93, v21);
      objc_msgSend(v93, "setPointyBitPoint:");
      [v93 setPointyBitBaseWidthAngle:v156 * 180.0 / 3.14159265];
LABEL_19:

      goto LABEL_30;
    case 764008:
      memset(&m, 0, 32);
      id v25 = v16;
      id v21 = -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, x, y, v23, v24);
      v258.size.double width = m.c;
      v258.size.double height = m.d;
      CGFloat v167 = (m.c + m.d) * 0.5;
      v258.origin.double x = m.a;
      v258.origin.double y = m.b;
      CGFloat v168 = CGRectGetMidX(v258) - v167 * 0.5;
      v259.origin.double x = m.a;
      v259.origin.double y = m.b;
      v259.size.double width = m.c;
      v259.size.double height = m.d;
      double v169 = CGRectGetMidY(v259) - v167 * 0.5;
      v170 = v25;
      double v171 = v168;
      double v172 = v167;
      double v173 = v167;
      goto LABEL_24;
    case 764009:
      memset(&m, 0, 32);
      id v25 = v16;
      id v21 = -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, x, y, v23, v24);
      v260.size.double width = m.c;
      v260.size.double height = m.d;
      CGFloat v174 = (m.c + m.d) * 0.5;
      v260.origin.double x = m.a;
      v260.origin.double y = m.b;
      CGFloat v175 = CGRectGetMidX(v260) - v174 * 0.5;
      v261.origin.double x = m.a;
      v261.origin.double y = m.b;
      v261.size.double width = m.c;
      v261.size.double height = m.d;
      objc_msgSend(v25, "setRectangle:", v175, CGRectGetMidY(v261) - v174 * 0.5, v174, v174);
      [v25 setPointCount:5];
      goto LABEL_29;
    case 764010:
      memset(&v249, 0, sizeof(v249));
      id v245 = v16;
      id v21 = -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &v249, x, y, v23, v24);
      [v13 vertex1];
      double v177 = v176;
      double v179 = v178;
      [v13 vertex2];
      double v181 = v180;
      double v183 = v182;
      [v13 vertex3];
      double v184 = MidX + v177;
      double v185 = MidY + v179;
      double v186 = MidX + v181;
      double v187 = MidY + v183;
      double v189 = MidX + v188;
      double v191 = MidY + v190;
      v241 = [v21 overlayView];
      objc_msgSend(v19, "convertPoint:toView:", v241, v184, v185);
      double v193 = v192;
      double v195 = v194;
      objc_msgSend(v19, "convertPoint:toView:", v241, v186, v187);
      double v197 = v196;
      double v199 = v198;
      objc_msgSend(v19, "convertPoint:toView:", v241, v189, v191);
      double v201 = v200;
      double v203 = v202;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v193, v195);
      CGFloat v205 = v204;
      CGFloat v207 = v206;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v197, v199);
      CGFloat v209 = v208;
      CGFloat v211 = v210;
      objc_msgSend(v21, "convertPointFromOverlayToModel:", v201, v203);
      CGFloat v213 = v212;
      CGFloat v215 = v214;
      memset(&m, 0, sizeof(m));
      uint64_t v216 = [v21 currentModelToScreenExifOrientation];
      double v217 = CGRectGetMidX(v249);
      +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v216, v217, CGRectGetMidY(v249));
      CGAffineTransform v247 = m;
      memset(&v248, 0, sizeof(v248));
      CGAffineTransformInvert(&v248, &v247);
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, &m, v205, v207);
      CGPathAddLineToPoint(Mutable, &m, v209, v211);
      CGPathAddLineToPoint(Mutable, &m, v213, v215);
      CGPathCloseSubpath(Mutable);
      BoundingBodouble x = CGPathGetBoundingBox(Mutable);
      CGAffineTransform v247 = v248;
      CGRect v263 = CGRectApplyAffineTransform(BoundingBox, &v247);
      objc_msgSend(v245, "setRectangle:", v263.origin.x, v263.origin.y, fmax(v263.size.width, 1.0), fmax(v263.size.height, 1.0));
      v219 = [MEMORY[0x263F1C478] bezierPathWithCGPath:Mutable];
      [v245 setPath:v219];

      CGPathRelease(Mutable);
      goto LABEL_30;
    case 764011:
      memset(&m, 0, 32);
      id v25 = v16;
      id v21 = -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, x, y, v23, v24);
      double v171 = m.a;
      double v169 = m.b;
      double v172 = m.c;
      double v173 = m.d;
      v170 = v25;
LABEL_24:
      objc_msgSend(v170, "setRectangle:", v171, v169, v172, v173);
      goto LABEL_29;
    case 764013:
      memset(&v249, 0, sizeof(v249));
      id v25 = v16;
      id v21 = -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &v249, x, y, v23, v24);
      double v220 = CGRectGetMidX(v249);
      double v221 = CGRectGetMidY(v249);
      memset(&m, 0, sizeof(m));
      +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", [v21 currentModelToScreenExifOrientation], v220, v221);
      CGAffineTransform v247 = m;
      memset(&v248, 0, sizeof(v248));
      CGAffineTransformInvert(&v248, &v247);
      CGAffineTransform v247 = m;
      CGRect v264 = CGRectApplyAffineTransform(v249, &v247);
      CGFloat v222 = v264.origin.x;
      CGFloat v223 = v264.origin.y;
      CGFloat v224 = v264.size.width;
      CGFloat v225 = v264.size.height;
      double MinX = CGRectGetMinX(v264);
      v265.origin.double x = v222;
      v265.origin.double y = v223;
      v265.size.double width = v224;
      v265.size.double height = v225;
      CGFloat MinY = CGRectGetMinY(v265);
      float64x2_t v246 = vaddq_f64(*(float64x2_t *)&v248.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v248.c, MinY + (MinY - (m.ty + v221 * m.d + m.b * v220)) * 0.3), *(float64x2_t *)&v248.a, MinX + (MinX - (m.tx + v221 * m.c + m.a * v220)) * -0.1));
      objc_msgSend(v25, "setRectangle:", *(_OWORD *)&v249.origin, *(_OWORD *)&v249.size);
      [v25 setPointyBitPoint:*(_OWORD *)&v246];
      goto LABEL_29;
    case 764017:
      memset(&m, 0, 32);
      id v21 = -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m, x, y, v23, v24);
      goto LABEL_30;
    case 764018:
      id v25 = v16;
      id v21 = [v11 doodlePath];

      if (v21)
      {
        [v11 doodlePathBoundsInInputView];
        long long v228 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
        *(_OWORD *)&m.CGFloat a = *MEMORY[0x263F001A8];
        *(_OWORD *)&m.CGFloat c = v228;
        id v21 = -[AKShapeDetectionController convertDrawingBoundsInInputView:outBoundsInPageModel:](self, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &m);
        objc_msgSend(v25, "setRectangle:", m.a, m.b, m.c, m.d);
        v229 = [v11 doodlePath];
        [v25 setPath:v229];

        objc_msgSend(v25, "setPathIsPrestroked:", objc_msgSend(v11, "doodlePathIsPrestroked"));
      }
      goto LABEL_29;
    default:
      goto LABEL_30;
  }
}

- (id)_createFlippedCHDrawingFromCHDrawing:(id)a3 withDrawingCenter:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263F35C88]);
  if ([v6 strokeCount])
  {
    unint64_t v8 = 0;
    do
    {
      if ([v6 pointCountForStrokeIndex:v8])
      {
        unint64_t v9 = 0;
        do
        {
          [v6 pointForStrokeIndex:v8 pointIndex:v9];
          objc_msgSend(v7, "addPoint:", v10 - x, v11 - y);
          ++v9;
        }
        while (v9 < [v6 pointCountForStrokeIndex:v8]);
      }
      [v7 endStroke];
      ++v8;
    }
    while (v8 < [v6 strokeCount]);
  }

  return v7;
}

- (id)_createDoodleShapeResultWithPath:(CGPath *)a3 withDrawingCenter:(CGPoint)a4 pathIsPrestroked:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  unint64_t v9 = [[AKShapeToCHRecognitionResult alloc] initWith:764018 result:0];
  +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", 4, x, y, 0, 0, 0, 0, 0, 0);
  double v10 = (const CGPath *)MEMORY[0x237E1D700](a3, &v18);
  double v11 = [MEMORY[0x263F1C478] bezierPathWithCGPath:v10];
  CGPathRelease(v10);
  [(AKShapeToCHRecognitionResult *)v9 setDoodlePath:v11];
  [(AKShapeToCHRecognitionResult *)v9 setDoodlePathIsPrestroked:v5];
  BoundingBodouble x = CGPathGetBoundingBox(a3);
  double v12 = BoundingBox.origin.x;
  double v13 = BoundingBox.origin.y;
  double width = BoundingBox.size.width;
  double height = BoundingBox.size.height;
  if (CGRectGetHeight(BoundingBox) == 0.0) {
    double height = 1.0;
  }
  v21.origin.double x = v12;
  v21.origin.double y = v13;
  v21.size.double width = width;
  v21.size.double height = height;
  if (CGRectGetWidth(v21) == 0.0) {
    double v16 = 1.0;
  }
  else {
    double v16 = width;
  }
  -[AKShapeToCHRecognitionResult setDoodlePathBoundsInInputView:](v9, "setDoodlePathBoundsInInputView:", v12, v13, v16, height);

  return v9;
}

- (id)createInkResultFromInkDrawing:(id)a3 annotation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[AKShapeToCHRecognitionResult alloc] initWith:764017 result:0];
  [(AKShapeToCHRecognitionResult *)v7 setInkDrawing:v6];

  [(AKShapeToCHRecognitionResult *)v7 setAnnotation:v5];

  return v7;
}

- (id)convertDrawingBoundsInInputView:(CGRect)a3 outBoundsInPageModel:(CGRect *)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = [(AKShapeDetectionController *)self controller];
  id v7 = [(AKShapeDetectionController *)self delegate];
  unint64_t v8 = [v7 overlayView:self];

  CGFloat v46 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v47 = *MEMORY[0x263F001A8];
  CGFloat v44 = *(double *)(MEMORY[0x263F001A8] + 24);
  CGFloat v45 = *(double *)(MEMORY[0x263F001A8] + 16);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  unint64_t v9 = [v6 pageControllers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    double v12 = 0;
    uint64_t v13 = *(void *)v52;
    double v14 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(v9);
        }
        double v16 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if (objc_msgSend(v16, "relinquishablesAreLoaded", *(void *)&v44, *(void *)&v45, *(void *)&v46, *(void *)&v47))
        {
          double v50 = v14;
          id v17 = [v16 overlayView];
          [v17 bounds];
          CGFloat v19 = v18;
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          CGFloat v25 = v24;
          objc_msgSend(v8, "convertRect:toView:", v17, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;
          double v33 = v32;
          v58.origin.CGFloat x = v19;
          v58.origin.CGFloat y = v21;
          v58.size.CGFloat width = v23;
          v58.size.CGFloat height = v25;
          v62.origin.CGFloat x = v27;
          v62.origin.CGFloat y = v29;
          v62.size.CGFloat width = v31;
          v62.size.CGFloat height = v33;
          if (CGRectIntersectsRect(v58, v62))
          {
            v59.origin.CGFloat x = v19;
            v59.origin.CGFloat y = v21;
            v59.size.CGFloat width = v23;
            v59.size.CGFloat height = v25;
            v63.origin.CGFloat x = v27;
            v63.origin.CGFloat y = v29;
            v63.size.CGFloat width = v31;
            v63.size.CGFloat height = v33;
            CGRect v60 = CGRectIntersection(v59, v63);
            CGFloat x = v60.origin.x;
            CGFloat y = v60.origin.y;
            CGFloat width = v60.size.width;
            CGFloat height = v60.size.height;
            double v48 = CGRectGetWidth(v60);
            v61.origin.CGFloat x = x;
            v61.origin.CGFloat y = y;
            v61.size.CGFloat width = width;
            v61.size.CGFloat height = height;
            double v14 = v48 * CGRectGetHeight(v61);
            if (v14 <= v50)
            {
              double v14 = v50;
            }
            else
            {
              objc_msgSend(v16, "convertRectFromOverlayToModel:", v27, v29, v31, v33);
              CGFloat v46 = v39;
              CGFloat v47 = v38;
              CGFloat v44 = v41;
              CGFloat v45 = v40;
              id v42 = v16;

              double v12 = v42;
            }
          }
          else
          {
            double v14 = v50;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v11);
  }
  else
  {
    double v12 = 0;
  }

  if (a4)
  {
    a4->origin.CGFloat x = v47;
    a4->origin.CGFloat y = v46;
    a4->size.CGFloat width = v45;
    a4->size.CGFloat height = v44;
  }

  return v12;
}

+ (BOOL)drawingIsValidForRecognition:(id)a3 withPath:(CGPath *)a4
{
  id v5 = a3;
  BOOL v6 = a4 && !CGPathIsEmpty(a4) && (!v5 || [v5 strokeCount]);

  return v6;
}

- (AKShapeDetectionControllerDelegate)delegate
{
  WeakRetaineCGFloat d = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKShapeDetectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AKController)controller
{
  WeakRetaineCGFloat d = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (AKAnnotation)candidateAnnotation
{
  WeakRetaineCGFloat d = objc_loadWeakRetained((id *)&self->_candidateAnnotation);

  return (AKAnnotation *)WeakRetained;
}

- (void)setCandidateAnnotation:(id)a3
{
}

- (void)setShapeRecognizer:(id)a3
{
}

- (BOOL)preferDoodle
{
  return self->_preferDoodle;
}

- (void)setPreferDoodle:(BOOL)a3
{
  self->_preferDoodle = a3;
}

- (BOOL)coalescesDoodles
{
  return self->_coalescesDoodles;
}

- (void)setCoalescesDoodles:(BOOL)a3
{
  self->_coalescesDoodles = a3;
}

- (BOOL)shapeDetectionEnabled
{
  return self->_shapeDetectionEnabled;
}

- (void)setShapeDetectionEnabled:(BOOL)a3
{
  self->_shapeDetectionEnableCGFloat d = a3;
}

- (BOOL)isPreviousCandidateAnnotationUndecided
{
  return self->_isPreviousCandidateAnnotationUndecided;
}

- (void)setIsPreviousCandidateAnnotationUndecided:(BOOL)a3
{
  self->_isPreviousCandidateAnnotationUndecideCGFloat d = a3;
}

- (AKPageModelController)modelControllerToObserveForAnnotationsAndSelections
{
  return self->_modelControllerToObserveForAnnotationsAndSelections;
}

- (CHDrawing)lastDrawing
{
  return self->_lastDrawing;
}

- (void)setLastDrawing:(id)a3
{
}

- (double)veryHighConfidenceLevel
{
  return self->_veryHighConfidenceLevel;
}

- (void)setVeryHighConfidenceLevel:(double)a3
{
  self->_veryHighConfidenceLevel = a3;
}

- (CHDrawing)candidateDrawing
{
  return self->_candidateDrawing;
}

- (void)setCandidateDrawing:(id)a3
{
}

- (NSMutableArray)candidateAKTags
{
  return self->_candidateAKTags;
}

- (void)setCandidateAKTags:(id)a3
{
}

- (NSMutableDictionary)candidateAKTagsToAnnotationInfoMap
{
  return self->_candidateAKTagsToAnnotationInfoMap;
}

- (void)setCandidateAKTagsToAnnotationInfoMap:(id)a3
{
}

- (AKCandidatePickerView_iOS)candidatePickerView
{
  return self->_candidatePickerView;
}

- (void)setCandidatePickerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidatePickerView, 0);
  objc_storeStrong((id *)&self->_candidateAKTagsToAnnotationInfoMap, 0);
  objc_storeStrong((id *)&self->_candidateAKTags, 0);
  objc_storeStrong((id *)&self->_candidateDrawing, 0);
  objc_storeStrong((id *)&self->_lastDrawing, 0);
  objc_storeStrong((id *)&self->_modelControllerToObserveForAnnotationsAndSelections, 0);
  objc_storeStrong((id *)&self->_shapeRecognizer, 0);
  objc_destroyWeak((id *)&self->_candidateAnnotation);
  objc_destroyWeak((id *)&self->_controller);

  objc_destroyWeak((id *)&self->_delegate);
}

@end