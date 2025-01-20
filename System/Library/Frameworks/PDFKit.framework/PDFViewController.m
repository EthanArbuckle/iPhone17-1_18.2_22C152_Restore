@interface PDFViewController
- (BOOL)_handleFormFillingEventAtLocation:(CGPoint)a3;
- (BOOL)_shouldUpdateMarkupWithStyle:(unint64_t)a3 onPage:(id)a4 forIndexSet:(id)a5;
- (BOOL)isUpdatingSelectionMarkups;
- (CGPoint)_convertPoint:(CGPoint)a3 toPageView:(id)a4;
- (PDFViewController)initWithView:(id)a3;
- (id)_annotationAtGestureLocation:(CGPoint)a3;
- (id)_annotationsForSelection:(id)a3;
- (id)_findNextActivatableAnnotationOnPage:(id)a3 fromAnnotation:(id)a4 direction:(unint64_t)a5;
- (id)_getPagePoint:(CGPoint *)a3 forGestureLocation:(CGPoint)a4;
- (id)_pageViewForAnnotation:(id)a3;
- (id)activeAnnotation;
- (id)additionalEditMenuElementsForMarkupAnnotation:(id)a3;
- (id)additionalEditMenuElementsForSelection:(id)a3;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (unint64_t)textSelectionMenu;
- (void)_addControlForAnnotation:(id)a3;
- (void)_annotationHit:(id)a3 atLocation:(CGPoint)a4;
- (void)_annotationHitLongPress:(id)a3 gestureState:(int64_t)a4 location:(CGPoint)a5;
- (void)_closeTextEditingMenu;
- (void)_doButtonHit:(id)a3;
- (void)_handleButtonHit:(id)a3;
- (void)_hidePDFMarkupMenuView;
- (void)_hideTextSelectionMenu;
- (void)_performDoubleTapAtLocation:(CGPoint)a3;
- (void)_postAnnotationHitNotification:(id)a3;
- (void)_postAnnotationWillHitNotification:(id)a3;
- (void)activateAnnotation:(id)a3;
- (void)activateNextAnnotation:(unint64_t)a3 withCompletion:(id)a4;
- (void)addDetectedAnnotation:(id)a3 toPage:(id)a4;
- (void)dealloc;
- (void)deleteAnnotation;
- (void)editNoteForAnnotation:(id)a3;
- (void)findNextActivatableAnnotationFromPage:(id)a3 fromAnnotation:(id)a4 direction:(unint64_t)a5 withCompletion:(id)a6;
- (void)handleGesture:(id)a3;
- (void)handleGesture:(unint64_t)a3 state:(int64_t)a4 location:(CGPoint)a5;
- (void)handleTextSuggestion:(id)a3 completionHandler:(id)a4;
- (void)hideActiveMenus;
- (void)highlight:(id)a3;
- (void)interactWithAnnotation:(id)a3;
- (void)populateAnnotationsFromDetectedAnnotationsOnPage:(id)a3;
- (void)removeControlForAnnotation:(id)a3;
- (void)removeNoteForAnnotation:(id)a3;
- (void)setActiveAnnotation:(id)a3;
- (void)setMarkupStyle:(unint64_t)a3;
- (void)setMarkupStyle:(unint64_t)a3 forAnnotation:(id)a4;
- (void)setMarkupStyle:(unint64_t)a3 forSelection:(id)a4 clearSelection:(BOOL)a5;
- (void)showMarkupStyleMenuForMarkupAnnotation;
- (void)showMenuForMarkupAnnotation:(id)a3;
@end

@implementation PDFViewController

- (CGPoint)_convertPoint:(CGPoint)a3 toPageView:(id)a4
{
  id v5 = a4;
  CGFloat v6 = PDFRectToCGRect([v5 boundsForBox:0]);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat rect_8 = v11;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  objc_msgSend(v5, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox"));

  CGFloat rect = PDFRectToCGRect(v13);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v33.origin.x = rect;
  v33.origin.y = v15;
  v33.size.width = v17;
  v33.size.height = v19;
  double MinX = CGRectGetMinX(v33);
  v34.origin.x = v6;
  v34.origin.y = v8;
  v34.size.width = v10;
  v34.size.height = rect_8;
  double v21 = MinX - CGRectGetMinX(v34);
  v35.origin.x = v6;
  v35.origin.y = v8;
  v35.size.width = v10;
  v35.size.height = rect_8;
  double v22 = v21 - CGRectGetMinX(v35);
  v36.origin.x = rect;
  v36.origin.y = v15;
  v36.size.width = v17;
  v36.size.height = v19;
  double MinY = CGRectGetMinY(v36);
  v37.origin.x = v6;
  v37.origin.y = v8;
  v37.size.width = v10;
  v37.size.height = rect_8;
  double v24 = MinY - CGRectGetMinY(v37);
  v38.origin.x = v6;
  v38.origin.y = v8;
  v38.size.width = v10;
  v38.size.height = rect_8;
  double v25 = a3.y - (v24 - CGRectGetMinY(v38));

  double v26 = PDFPointMake(a3.x - v22, v25);
  result.y = v27;
  result.x = v26;
  return result;
}

- (PDFViewController)initWithView:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PDFViewController;
  id v5 = [(PDFViewController *)&v20 init];
  if (v5)
  {
    CGFloat v6 = objc_alloc_init(PDFViewControllerPrivate);
    double v7 = v5->_private;
    v5->_private = v6;

    objc_storeWeak((id *)&v5->_private->view, v4);
    CGFloat v8 = v5->_private;
    v8->viewMarquee.origin.x = PDFRectFromCGRect(*MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v8->viewMarquee.origin.y = v9;
    v8->viewMarquee.size.width = v10;
    v8->viewMarquee.size.height = v11;
    v12 = v5->_private;
    marqueeEffect = v12->marqueeEffect;
    v12->marqueeEffect = 0;

    objc_storeWeak((id *)&v5->_private->activeAnnotation, 0);
    uint64_t v14 = [objc_alloc(MEMORY[0x263F82718]) initWithDelegate:v5];
    CGFloat v15 = v5->_private;
    editMenuInteraction = v15->editMenuInteraction;
    v15->editMenuInteraction = (UIEditMenuInteraction *)v14;

    [v4 addInteraction:v5->_private->editMenuInteraction];
    v5->_private->textSelectionMenu = 0;
    v5->_private->longPressGestureStartTime = 0.0;
    v5->_private->didPostPDFExtensionViewAnnotationLongPress = 0;
    CGFloat v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v5 selector:sel_hideActiveMenus name:@"PDFTextSelectionMenuWillChangeScrollPosition" object:0];

    double v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v5 selector:sel_showActiveMenus name:@"PDFTextSelectionMenuDidChangeScrollPosition" object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PDFViewController;
  [(PDFViewController *)&v4 dealloc];
}

- (id)activeAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);

  return WeakRetained;
}

- (void)findNextActivatableAnnotationFromPage:(id)a3 fromAnnotation:(id)a4 direction:(unint64_t)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [v10 document];
  uint64_t v14 = [v13 pageCount];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  CGFloat v15 = [v13 formFillingQueue];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __99__PDFViewController_findNextActivatableAnnotationFromPage_fromAnnotation_direction_withCompletion___block_invoke;
  v20[3] = &unk_264204978;
  id v21 = v10;
  double v22 = self;
  id v25 = v12;
  double v26 = v29;
  unint64_t v27 = a5;
  uint64_t v28 = v14;
  id v23 = v11;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(v15, v20);

  _Block_object_dispose(v29, 8);
}

void __99__PDFViewController_findNextActivatableAnnotationFromPage_fromAnnotation_direction_withCompletion___block_invoke(uint64_t a1)
{
  v2 = +[PDFPageAnalyzer sharedInstance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __99__PDFViewController_findNextActivatableAnnotationFromPage_fromAnnotation_direction_withCompletion___block_invoke_2;
  v9[3] = &unk_264204950;
  int8x16_t v8 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v8.i64[0];
  int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 80);
  id v11 = v4;
  uint64_t v15 = v5;
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  id v13 = v6;
  uint64_t v14 = v7;
  uint64_t v16 = *(void *)(a1 + 88);
  id v12 = *(id *)(a1 + 56);
  [v2 analyzePage:v3 analysisTypes:2 completionQueue:0 completionBlock:v9];
}

uint64_t __99__PDFViewController_findNextActivatableAnnotationFromPage_fromAnnotation_direction_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _findNextActivatableAnnotationOnPage:*(void *)(a1 + 40) fromAnnotation:*(void *)(a1 + 48) direction:*(void *)(a1 + 80)];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v11 = v2;
    uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
    unint64_t v5 = *(void *)(v4 + 24) + 1;
    *(void *)(v4 + 24) = v5;
    if (v5 >= *(void *)(a1 + 88)) {
      goto LABEL_13;
    }
    uint64_t v11 = 0;
    uint64_t v6 = [*(id *)(a1 + 56) indexForPage:*(void *)(a1 + 40)];
    if (*(void *)(a1 + 80))
    {
      if (v6) {
        uint64_t v7 = v6 - 1;
      }
      else {
        uint64_t v7 = *(void *)(a1 + 88) - 1;
      }
    }
    else if ((unint64_t)(v6 + 1) < *(void *)(a1 + 88))
    {
      uint64_t v7 = v6 + 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
    int8x16_t v8 = *(void **)(a1 + 32);
    CGFloat v9 = [*(id *)(a1 + 56) pageAtIndex:v7];
    [v8 findNextActivatableAnnotationFromPage:v9 fromAnnotation:0 direction:*(void *)(a1 + 80) withCompletion:*(void *)(a1 + 64)];
  }
  uint64_t v3 = v11;
LABEL_13:

  return MEMORY[0x270F9A758](v2, v3);
}

- (id)_findNextActivatableAnnotationOnPage:(id)a3 fromAnnotation:(id)a4 direction:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  id v17 = __83__PDFViewController__findNextActivatableAnnotationOnPage_fromAnnotation_direction___block_invoke;
  id v18 = &unk_2642049A0;
  id v19 = v8;
  unint64_t v20 = a5;
  id v9 = v8;
  int8x16_t v10 = (void (**)(void *, void *))_Block_copy(&v15);
  uint64_t v11 = objc_msgSend(v7, "annotations", v15, v16, v17, v18);
  id v12 = v10[2](v10, v11);

  if (!v12)
  {
    id v13 = [v7 detectedAnnotations];
    id v12 = v10[2](v10, v13);
  }

  return v12;
}

id __83__PDFViewController__findNextActivatableAnnotationOnPage_fromAnnotation_direction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 count];
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = objc_msgSend(v3, "indexOfObjectIdenticalTo:");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
LABEL_4:
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__2;
    uint64_t v16 = __Block_byref_object_dispose__2;
    id v17 = 0;
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v5, v4);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __83__PDFViewController__findNextActivatableAnnotationOnPage_fromAnnotation_direction___block_invoke_109;
    v11[3] = &unk_2642044C0;
    v11[4] = &v12;
    [v3 enumerateObjectsAtIndexes:v8 options:2 * (v7 == 1) usingBlock:v11];

    id v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    goto LABEL_7;
  }
  if (v4 >= 2)
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v5 = 0;
      unint64_t v4 = v6;
      if (v6) {
        goto LABEL_4;
      }
    }
    else if (v6 != v4)
    {
      uint64_t v5 = v6 + 1;
      v4 -= v6 + 1;
      goto LABEL_4;
    }
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

void __83__PDFViewController__findNextActivatableAnnotationOnPage_fromAnnotation_direction___block_invoke_109(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isActivatableTextField])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)setActiveAnnotation:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  objc_storeWeak((id *)&self->_private->activeAnnotation, obj);
  if (WeakRetained != obj) {
    [(PDFViewController *)self removeControlForAnnotation:WeakRetained];
  }
  objc_storeWeak((id *)&self->_private->activeAnnotation, obj);
  id v5 = objc_loadWeakRetained((id *)&self->_private->view);
  if (obj)
  {
    if ([obj isMarkupAnnotationSubtype]) {
      objc_msgSend(v5, "setActiveMarkupStyle:", objc_msgSend(obj, "markupStyle"));
    }
  }
  else
  {
    uint64_t v6 = [v5 document];
    id v7 = [v6 akController];
    if (objc_opt_respondsToSelector()) {
      [v7 endEditingTextAnnotation];
    }
    id v8 = [v7 modelController];
    [v8 deselectAllAnnotations];

    self->_private->textSelectionMenu = 0;
    [(PDFViewController *)self _hidePDFMarkupMenuView];
  }
}

- (void)interactWithAnnotation:(id)a3
{
}

- (void)activateNextAnnotation:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v6 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  id v8 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  id v9 = v8;
  if (v8) {
    [v8 page];
  }
  else {
  int8x16_t v10 = [WeakRetained currentPage];
  }
  uint64_t v11 = [WeakRetained document];
  if ([v11 callDelegateHandleTabFrom:v9 direction:a3])
  {
    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__PDFViewController_activateNextAnnotation_withCompletion___block_invoke;
    v12[3] = &unk_2642049F0;
    v12[4] = self;
    objc_copyWeak(&v14, &location);
    id v13 = v6;
    [(PDFViewController *)self findNextActivatableAnnotationFromPage:v10 fromAnnotation:v9 direction:a3 withCompletion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __59__PDFViewController_activateNextAnnotation_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__PDFViewController_activateNextAnnotation_withCompletion___block_invoke_2;
  v5[3] = &unk_2642049C8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v8);
}

uint64_t __59__PDFViewController_activateNextAnnotation_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) page];
  [v2 populateAnnotationsFromDetectedAnnotationsOnPage:v3];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  id v8 = WeakRetained;
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "activateAnnotation:");
    id v5 = v8;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t, id))(v6 + 16))(v6, v5);
    id v5 = v8;
  }

  return MEMORY[0x270F9A758](v6, v5);
}

- (void)activateAnnotation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id obj = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
    id v6 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
    objc_storeWeak((id *)&self->_private->activeAnnotation, obj);
    id v7 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
    id v8 = [v7 page];
    [v7 bounds];
    CGRect v16 = PDFRectInset(v15, -4.0, -4.0);
    objc_msgSend(WeakRetained, "goToRect:onPage:", v8, v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
    id v9 = [obj valueForAnnotationKey:@"/AAPL:SFF"];

    if (v9)
    {
      int8x16_t v10 = [obj akAnnotation];
      if (v10)
      {
        uint64_t v11 = [WeakRetained document];
        uint64_t v12 = [v11 akController];
        [v12 editTextAnnotation:v10 selectAllText:0];
      }
    }
    else
    {
      [(PDFViewController *)self _addControlForAnnotation:v7];
    }
    [(PDFViewController *)self removeControlForAnnotation:v6];
    [(PDFViewController *)self _postAnnotationHitNotification:v7];

    id v4 = obj;
  }
}

- (void)_addControlForAnnotation:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  id v5 = [WeakRetained document];
  if ([v5 allowsFormFieldEntry])
  {
    int v6 = [WeakRetained isAnnotationEditingEnabled];

    if (!v6) {
      goto LABEL_5;
    }
    [(PDFViewController *)self hideActiveMenus];
    [WeakRetained clearSelection];
    id v5 = [(PDFViewController *)self _pageViewForAnnotation:obj];
    [v5 addControlForAnnotation:obj];
    objc_storeWeak((id *)&self->_private->activeAnnotation, obj);
  }

LABEL_5:
}

- (void)removeControlForAnnotation:(id)a3
{
  if (a3)
  {
    p_activeAnnotation = &self->_private->activeAnnotation;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_activeAnnotation);
    int v6 = [(PDFViewController *)self _pageViewForAnnotation:v5];
    [v6 removeControlForAnnotation:v5];

    if (WeakRetained == v5)
    {
      objc_storeWeak((id *)&self->_private->activeAnnotation, 0);
      [(PDFViewController *)self hideActiveMenus];
    }
  }
}

- (void)handleTextSuggestion:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  if (WeakRetained)
  {
    id v8 = [(PDFViewController *)self _pageViewForAnnotation:WeakRetained];
    [v8 populateFormFieldsWithAutoFillSuggestion:v9 completionHandler:v6];
  }
}

- (void)addDetectedAnnotation:(id)a3 toPage:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263F158F8];
  id v7 = a4;
  [v6 begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [v7 addAnnotation:v5];

  id v8 = [v5 akAnnotation];
  [v8 setOriginalModelBaseScaleFactor:1.0];
  [v8 setShouldUsePlaceholderText:0];
  [v8 setTextIsFixedWidth:1];
  [v8 setTextIsFixedHeight:0];
  [v8 setIsFormField:1];
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v5 autoFillTextContentType];
    [v8 setTextContentType:v9];
  }
  if [v5 hasComb] && (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "setMaximumNumberOfCharacters:", objc_msgSend(v5, "maximumLength"));
  }
  int8x16_t v10 = [v8 typingAttributes];
  uint64_t v11 = (void *)[v10 mutableCopy];

  if ([v5 hasComb])
  {
    [v5 bounds];
    double v13 = v12 / (double)[v5 maximumLength];
    uint64_t v22 = *MEMORY[0x263F82270];
    id v14 = [v5 font];
    v23[0] = v14;
    CGRect v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];

    [@"W" sizeWithAttributes:v15];
    id v17 = [NSNumber numberWithDouble:v13 - v16];
    [v11 setObject:v17 forKeyedSubscript:*MEMORY[0x263F822C8]];

    objc_msgSend(v8, "setMaximumNumberOfCharacters:", objc_msgSend(v5, "maximumLength"));
  }
  uint64_t v18 = *MEMORY[0x263F822A8];
  id v19 = [v11 objectForKeyedSubscript:*MEMORY[0x263F822A8]];
  unint64_t v20 = (void *)[v19 mutableCopy];

  if (!v20)
  {
    id v21 = [MEMORY[0x263F82370] defaultParagraphStyle];
    unint64_t v20 = (void *)[v21 mutableCopy];
  }
  [v20 setAlignment:0];
  if ([v5 isDetectedCheckbox])
  {
    [v20 setAlignment:1];
    [v8 setMaximumNumberOfCharacters:1];
  }
  if ([v5 hasComb]) {
    [v20 setLineBreakMode:2];
  }
  [v11 setObject:v20 forKeyedSubscript:v18];
  [v8 setTypingAttributes:v11];
  [MEMORY[0x263F158F8] commit];
}

- (void)populateAnnotationsFromDetectedAnnotationsOnPage:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = objc_msgSend(v4, "detectedAnnotations", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v11 isActivatableTextField])
        {
          [(PDFViewController *)self addDetectedAnnotation:v11 toPage:v4];
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [v4 removeFromDetectedAnnotations:v5];
}

- (BOOL)_shouldUpdateMarkupWithStyle:(unint64_t)a3 onPage:(id)a4 forIndexSet:(id)a5
{
  id v8 = a5;
  p_view = &self->_private->view;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  long long v12 = [WeakRetained document];
  uint64_t v13 = [v12 indexForPage:v10];

  long long v14 = [WeakRetained pageViewForPageAtIndex:v13];

  long long v15 = [v14 markupAnnotationsForIndexSet:v8];
  if ([v15 count] == 1)
  {
    double v16 = [v15 objectAtIndex:0];
    uint64_t v17 = [v16 markupStyle];
    uint64_t v18 = [v16 indexSetForQuadPoints];
    char v19 = [v8 isEqualToIndexSet:v18];

    if (v17 == a3) {
      char v20 = v19 ^ 1;
    }
    else {
      char v20 = 1;
    }
  }
  else
  {
    char v20 = 1;
  }

  return v20;
}

- (void)setMarkupStyle:(unint64_t)a3 forSelection:(id)a4 clearSelection:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (v8)
  {
    BOOL v20 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
    [v8 pages];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v15 = [v8 rangeAtIndex:0 onPage:v14];
          uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", v15, v16);
          if ([(PDFViewController *)self _shouldUpdateMarkupWithStyle:a3 onPage:v14 forIndexSet:v17])
          {
            uint64_t v18 = [WeakRetained document];
            char v19 = objc_msgSend(WeakRetained, "pageViewForPageAtIndex:", objc_msgSend(v18, "indexForPage:", v14));

            [v19 addMarkupWithStyle:a3 forIndexSet:v17];
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }
    if (v20)
    {
      [WeakRetained clearSelection];
      objc_storeWeak((id *)&self->_private->activeAnnotation, 0);
    }
  }
}

- (void)setMarkupStyle:(unint64_t)a3 forAnnotation:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v11 = v6;
    uint64_t v7 = [v6 indexSetForQuadPoints];
    id v8 = [v11 page];
    BOOL v9 = [(PDFViewController *)self _shouldUpdateMarkupWithStyle:a3 onPage:v8 forIndexSet:v7];

    if (v9)
    {
      uint64_t v10 = [(PDFViewController *)self _pageViewForAnnotation:v11];
      [v10 addMarkupWithStyle:a3 forIndexSet:v7];
    }
    id v6 = v11;
  }
}

- (void)editNoteForAnnotation:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    id v4 = [v5 contents];

    if (!v4) {
      [v5 setContents:&stru_26C516768 withUndo:1];
    }
    [(PDFViewController *)self _addControlForAnnotation:v5];
    [MEMORY[0x263F158F8] commit];
  }
}

- (void)removeNoteForAnnotation:(id)a3
{
  if (a3)
  {
    [a3 setContents:0 withUndo:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
    [WeakRetained clearSelection];

    p_activeAnnotation = &self->_private->activeAnnotation;
    objc_storeWeak((id *)p_activeAnnotation, 0);
  }
}

- (BOOL)isUpdatingSelectionMarkups
{
  return 0;
}

- (id)_pageViewForAnnotation:(id)a3
{
  p_view = &self->_private->view;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  id v6 = [v4 page];

  uint64_t v7 = [WeakRetained document];
  id v8 = objc_msgSend(WeakRetained, "pageViewForPageAtIndex:", objc_msgSend(v7, "indexForPage:", v6));

  return v8;
}

- (void)_postAnnotationWillHitNotification:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    p_view = &self->_private->view;
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_view);
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    id v8 = @"PDFAnnotationWillHit";
    v9[0] = v4;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

    [v6 postNotificationName:@"PDFViewAnnotationWillHit" object:WeakRetained userInfo:v7];
  }
}

- (void)_postAnnotationHitNotification:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    p_view = &self->_private->view;
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_view);
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    id v8 = @"PDFAnnotationHit";
    v9[0] = v4;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

    [v6 postNotificationName:@"PDFViewAnnotationHit" object:WeakRetained userInfo:v7];
  }
}

- (void)_handleButtonHit:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 buttonWidgetState])
  {
    v11[0] = @"annotation";
    v11[1] = @"intValue";
    v12[0] = v4;
    v12[1] = &unk_26C52E430;
    id v5 = NSDictionary;
    id v6 = v12;
    uint64_t v7 = v11;
    goto LABEL_5;
  }
  if ([v4 allowsToggleToOff])
  {
    v9[0] = @"annotation";
    v9[1] = @"intValue";
    v10[0] = v4;
    v10[1] = &unk_26C52E448;
    id v5 = NSDictionary;
    id v6 = v10;
    uint64_t v7 = v9;
LABEL_5:
    id v8 = [v5 dictionaryWithObjects:v6 forKeys:v7 count:2];
    [(PDFViewController *)self _doButtonHit:v8];
  }
}

- (void)_doButtonHit:(id)a3
{
  v28[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKey:@"annotation"];
  if (v5)
  {
    id v6 = [v4 objectForKey:@"intValue"];
    if (v6)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = [v4 objectForKey:@"formValue"];
      if (!v7)
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    uint64_t v22 = [v5 buttonWidgetState];
    if ([v5 widgetControlType] == 1)
    {
      id v8 = [v5 formData];
      if (v8)
      {
        BOOL v9 = [v5 fieldName];
        uint64_t v10 = [v8 stringValueForFieldNamed:v9];

        if (!v10 || [v10 length]) {
          goto LABEL_12;
        }
      }
    }
    else
    {
      id v8 = 0;
    }
    uint64_t v10 = 0;
LABEL_12:
    long long v23 = v8;
    long long v24 = (void *)v7;
    if (v6)
    {
      objc_msgSend(v5, "setButtonWidgetState:", (int)objc_msgSend(v6, "intValue"));
    }
    else if (v8 && v7)
    {
      id v11 = [v5 fieldName];
      [v8 setStringValue:v7 forFieldNamed:v11 postFormChangeNotification:1];
    }
    else
    {
      NSLog(&cfstr_ErrorUndefined.isa);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
    uint64_t v13 = [WeakRetained undoManager];
    if (v10)
    {
      v27[0] = @"annotation";
      v27[1] = @"formValue";
      v28[0] = v5;
      v28[1] = v10;
      uint64_t v14 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
      [v13 registerUndoWithTarget:self selector:sel__doButtonHit_ object:v14];
    }
    else
    {
      v25[1] = @"intValue";
      v26[0] = v5;
      v25[0] = @"annotation";
      uint64_t v14 = [NSNumber numberWithInteger:v22];
      v26[1] = v14;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
      [v13 registerUndoWithTarget:self selector:sel__doButtonHit_ object:v15];
    }
    uint64_t v16 = NSString;
    uint64_t v17 = PDFKitLocalizedString(@"Change of %@");
    uint64_t v18 = [v5 displayName];
    char v19 = objc_msgSend(v16, "stringWithFormat:", v17, v18);

    BOOL v20 = [WeakRetained undoManager];
    id v21 = PDFKitLocalizedString(v19);
    [v20 setActionName:v21];

    goto LABEL_22;
  }
LABEL_23:
}

- (void)_annotationHit:(id)a3 atLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v39[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
    BOOL v9 = [v7 valueForAnnotationKey:@"/Subtype"];
    uint64_t v10 = [WeakRetained renderingProperties];
    int v11 = [v10 isUsingPDFExtensionView];

    if (([v9 isEqualToString:@"/Link"] & 1) == 0 && v11) {
      goto LABEL_36;
    }
    [(PDFViewController *)self _postAnnotationWillHitNotification:v7];
    if ([v9 isEqualToString:@"/Link"])
    {
      uint64_t v12 = [v7 action];
      if (v12)
      {
        id v13 = [(PDFViewController *)self _pageViewForAnnotation:v7];
        uint64_t v14 = [v13 pageLayer];
        if (v11)
        {
          id v15 = +[PDFPageLayerEffect createFlashEffectForPDFLinkAnnotation:v7 withLayer:v14 forType:1];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_24;
          }
        }
        else
        {
          id v23 = +[PDFPageLayerEffect createFlashEffectForPDFLinkAnnotation:v7 withLayer:v14 forType:0];
        }
        objc_initWeak(&location, WeakRetained);
        dispatch_time_t v24 = dispatch_time(0, 400000000);
        uint64_t v31 = MEMORY[0x263EF8330];
        uint64_t v32 = 3221225472;
        CGRect v33 = __47__PDFViewController__annotationHit_atLocation___block_invoke;
        CGRect v34 = &unk_264204088;
        objc_copyWeak(&v36, &location);
        id v35 = v12;
        dispatch_after(v24, MEMORY[0x263EF83A0], &v31);

        objc_destroyWeak(&v36);
        objc_destroyWeak(&location);
        if (v11)
        {
LABEL_24:
          long long v25 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v31, v32, v33, v34);
          v38[0] = @"PDFAnnotationHit";
          v38[1] = @"location";
          v39[0] = v7;
          double v26 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFPoint:", x, y);
          v39[1] = v26;
          uint64_t v27 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
          [v25 postNotificationName:@"PDFViewAnnotationHit" object:WeakRetained userInfo:v27];

LABEL_36:
          goto LABEL_37;
        }
        goto LABEL_33;
      }
LABEL_34:

LABEL_35:
      -[PDFViewController _postAnnotationHitNotification:](self, "_postAnnotationHitNotification:", v7, v31, v32, v33, v34);
      goto LABEL_36;
    }
    if ([v9 isEqualToString:@"/Widget"]
      && ([v7 isReadOnly] & 1) == 0)
    {
      uint64_t v12 = [v7 valueForAnnotationKey:@"/FT"];
      int v28 = [v12 isEqualToString:@"/Btn"];
      char v29 = [v12 isEqualToString:@"/Ch"];
      int v30 = [v12 isEqualToString:@"/Tx"];
      if ((v29 & 1) == 0 && !v30)
      {
        if (!v28) {
          goto LABEL_34;
        }
        if ([v7 widgetControlType])
        {
          [(PDFViewController *)self _handleButtonHit:v7];
          goto LABEL_34;
        }
        id v13 = [v7 action];
        if (v13) {
          [WeakRetained performAction:v13];
        }
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      if (![v7 isMarkupAnnotationSubtype])
      {
        if ([v9 isEqualToString:@"/Text"])
        {
          uint64_t v22 = [v7 popup];

          if (v22) {
            [(PDFViewController *)self _addControlForAnnotation:v7];
          }
        }
        goto LABEL_35;
      }
      uint64_t v12 = [v7 page];
      objc_msgSend(WeakRetained, "convertPoint:toPage:", v12, x, y);
      if (!objc_msgSend(v7, "noteContainsPoint:"))
      {
        id v13 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
        if (v13 != v7)
        {
          uint64_t v16 = [WeakRetained currentSelection];

          if (v16)
          {
            uint64_t v17 = [v7 indexSetForQuadPoints];
            uint64_t v18 = [WeakRetained currentSelection];
            uint64_t v19 = [v18 rangeAtIndex:0 onPage:v12];
            uint64_t v21 = v20;

            if ((objc_msgSend(v17, "containsIndexesInRange:", v19, v21) & 1) == 0) {
              [WeakRetained clearSelection];
            }
          }
          objc_storeWeak((id *)&self->_private->activeAnnotation, v7);
          [(PDFViewController *)self showMenuForMarkupAnnotation:v7];
        }
        goto LABEL_33;
      }
    }
    [(PDFViewController *)self _addControlForAnnotation:v7];
    goto LABEL_34;
  }
LABEL_37:
}

void __47__PDFViewController__annotationHit_atLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained performAction:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)handleGesture:(id)a3
{
  p_activeAnnotation = &self->_private->activeAnnotation;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_activeAnnotation);
  id v6 = objc_loadWeakRetained((id *)&self->_private->view);
  uint64_t v7 = [v6 typeForGestureRecognizer:v5];
  [v5 locationInView:v6];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [v5 state];

  -[PDFViewController handleGesture:state:location:](self, "handleGesture:state:location:", v7, v12, v9, v11);
  if (WeakRetained && (v12 == 1 || !v7)) {
    [(PDFViewController *)self removeControlForAnnotation:WeakRetained];
  }
}

- (void)handleGesture:(unint64_t)a3 state:(int64_t)a4 location:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  uint64_t v10 = -[PDFViewController _annotationAtGestureLocation:](self, "_annotationAtGestureLocation:", x, y);
  double v11 = (void *)v10;
  if (a3 == 2 && v10)
  {
    -[PDFViewController _annotationHitLongPress:gestureState:location:](self, "_annotationHitLongPress:gestureState:location:", v10, a4, x, y);
  }
  else if (a3 == 1)
  {
    [WeakRetained clearSelection];
    -[PDFViewController _performDoubleTapAtLocation:](self, "_performDoubleTapAtLocation:", x, y);
  }
  else if (!a3)
  {
    [WeakRetained clearSelection];
    if (v11) {
      -[PDFViewController _annotationHit:atLocation:](self, "_annotationHit:atLocation:", v11, x, y);
    }
  }
}

- (void)_performDoubleTapAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_private->view);
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    double v8 = (void *)WeakRetained;
    uint64_t WeakRetained = -[PDFViewController _handleFormFillingEventAtLocation:](self, "_handleFormFillingEventAtLocation:", x, y);
    uint64_t v7 = (uint64_t)v8;
    if ((WeakRetained & 1) == 0)
    {
      uint64_t WeakRetained = objc_msgSend(v8, "focusOnColumnAtPoint:", x, y);
      uint64_t v7 = (uint64_t)v8;
    }
  }

  MEMORY[0x270F9A758](WeakRetained, v7);
}

- (unint64_t)textSelectionMenu
{
  return self->_private->textSelectionMenu;
}

- (void)_hideTextSelectionMenu
{
}

- (void)hideActiveMenus
{
  void v10[2] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  id v4 = [WeakRetained renderingProperties];
  int v5 = [v4 isUsingPDFExtensionView];

  if (v5)
  {
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    v9[0] = @"visible";
    v9[1] = @"selectionRect";
    v10[0] = MEMORY[0x263EFFA80];
    uint64_t v7 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v10[1] = v7;
    double v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    [v6 postNotificationName:@"PDFTextSelectionShowTextSelectionMenu" object:self userInfo:v8];
  }
  else
  {
    [(PDFViewController *)self _hideTextSelectionMenu];
    [(PDFViewController *)self _hidePDFMarkupMenuView];
  }
}

- (void)_hidePDFMarkupMenuView
{
}

- (void)showMarkupStyleMenuForMarkupAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  id v3 = [WeakRetained document];
  if ([v3 allowsCommenting])
  {
    int v4 = [WeakRetained isAnnotationEditingEnabled];

    if (!v4) {
      goto LABEL_9;
    }
    id v5 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
    id v3 = v5;
    if (v5)
    {
      id v6 = [v5 page];
      [v3 bounds];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      id v15 = [WeakRetained currentSelection];
      uint64_t v16 = v15;
      if (v15 && ([v15 isEmpty] & 1) == 0)
      {
        [v16 boundsForPage:v6];
        double v8 = v17;
        double v10 = v18;
        double v12 = v19;
        double v14 = v20;
      }
      objc_msgSend(WeakRetained, "convertRect:fromPage:", v6, v8, v10, v12, v14);
      CGFloat x = v29.origin.x;
      CGFloat y = v29.origin.y;
      CGFloat width = v29.size.width;
      CGFloat height = v29.size.height;
      double MidX = CGRectGetMidX(v29);
      v30.origin.CGFloat x = x;
      v30.origin.CGFloat y = y;
      v30.size.CGFloat width = width;
      v30.size.CGFloat height = height;
      double v26 = +[PDFAnnotationEditMenuConfiguration configurationWithIdentifier:@"com.apple.pdfkit.menu.markupstyle", MidX, CGRectGetMinY(v30) sourcePoint];
      [v26 setAnnotation:v3];
      self->_private->textSelectionMenu = 2;
      [(UIEditMenuInteraction *)self->_private->editMenuInteraction presentEditMenuWithConfiguration:v26];
    }
  }

LABEL_9:
}

- (void)showMenuForMarkupAnnotation:(id)a3
{
  id v27 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  id v5 = [WeakRetained document];
  if ([v5 allowsCommenting])
  {
    int v6 = [WeakRetained isAnnotationEditingEnabled];

    if (!v6) {
      goto LABEL_8;
    }
    id v5 = [v27 page];
    [v27 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    id v15 = [WeakRetained currentSelection];
    uint64_t v16 = v15;
    if (v15 && ([v15 isEmpty] & 1) == 0)
    {
      [v16 boundsForPage:v5];
      double v8 = v17;
      double v10 = v18;
      double v12 = v19;
      double v14 = v20;
    }
    objc_msgSend(WeakRetained, "convertRect:fromPage:", v5, v8, v10, v12, v14);
    CGFloat x = v29.origin.x;
    CGFloat y = v29.origin.y;
    CGFloat width = v29.size.width;
    CGFloat height = v29.size.height;
    double MidX = CGRectGetMidX(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double v26 = +[PDFAnnotationEditMenuConfiguration configurationWithIdentifier:@"com.apple.pdfkit.menu.markup", MidX, CGRectGetMinY(v30) sourcePoint];
    [v26 setAnnotation:v27];
    self->_private->textSelectionMenu = 2;
    [(UIEditMenuInteraction *)self->_private->editMenuInteraction presentEditMenuWithConfiguration:v26];
  }
LABEL_8:
}

- (void)highlight:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  uint64_t v4 = [WeakRetained activeMarkupStyle];
  id v5 = [WeakRetained currentSelection];
  [(PDFViewController *)self setMarkupStyle:v4 forSelection:v5 clearSelection:1];
  int v6 = [v5 firstPage];
  double v7 = [WeakRetained document];
  double v8 = objc_msgSend(WeakRetained, "pageViewForPageAtIndex:", objc_msgSend(v7, "indexForPage:", v6));

  id v9 = objc_alloc(MEMORY[0x263F088D0]);
  uint64_t v10 = [v5 rangeAtIndex:0 onPage:v6];
  double v12 = objc_msgSend(v9, "initWithIndexesInRange:", v10, v11);
  double v13 = [v8 markupAnnotationsForIndexSet:v12];

  if ([v13 count])
  {
    double v14 = [v13 firstObject];
    if (v14)
    {
      objc_storeWeak((id *)&self->_private->activeAnnotation, v14);
      [(PDFViewController *)self showMarkupStyleMenuForMarkupAnnotation];
    }
  }
}

- (id)additionalEditMenuElementsForSelection:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  int v6 = [WeakRetained allowsMarkupAnnotationEditing];
  double v7 = (void *)MEMORY[0x263EFFA68];
  if (!v4 || !v6 || ([v4 isEmpty] & 1) != 0) {
    goto LABEL_20;
  }
  id v31 = WeakRetained;
  val = self;
  [(PDFViewController *)self _annotationsForSelection:v4];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (!v9)
  {
LABEL_17:

    objc_initWeak(&location, val);
    id v18 = 0;
LABEL_18:
    double v19 = (void *)MEMORY[0x263F82648];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __60__PDFViewController_additionalEditMenuElementsForSelection___block_invoke;
    v35[3] = &unk_264204A40;
    objc_copyWeak(&v36, &location);
    double v20 = [v19 elementWithViewProvider:v35];
    uint64_t v21 = (void *)MEMORY[0x263F823D0];
    uint64_t v22 = PDFKitLocalizedString(@"Highlight");
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __60__PDFViewController_additionalEditMenuElementsForSelection___block_invoke_3;
    v33[3] = &unk_264204128;
    objc_copyWeak(&v34, &location);
    v33[4] = val;
    id v23 = [v21 actionWithTitle:v22 image:0 identifier:@"com.apple.pdfkit.action.highlight" handler:v33];
    [v20 setMenuElementRepresentation:v23];

    v42 = v20;
    double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
    objc_destroyWeak(&v34);

    objc_destroyWeak(&v36);
    goto LABEL_19;
  }
  uint64_t v10 = *(void *)v39;
LABEL_6:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v39 != v10) {
      objc_enumerationMutation(v8);
    }
    double v12 = *(void **)(*((void *)&v38 + 1) + 8 * v11);
    if (![v12 isMarkupAnnotationSubtype]) {
      goto LABEL_12;
    }
    double v13 = [v12 indexSetForQuadPoints];
    double v14 = [v12 page];
    uint64_t v15 = [v4 rangeAtIndex:0 onPage:v14];
    uint64_t v17 = v16;

    if (objc_msgSend(v13, "containsIndexesInRange:", v15, v17)) {
      break;
    }

LABEL_12:
    if (v9 == ++v11)
    {
      uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v9) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  id v18 = v12;
  objc_storeWeak((id *)&val->_private->activeAnnotation, v18);

  objc_initWeak(&location, val);
  if (!v18) {
    goto LABEL_18;
  }
  double v7 = [(PDFViewController *)val additionalEditMenuElementsForMarkupAnnotation:v18];
LABEL_19:
  objc_destroyWeak(&location);

  id WeakRetained = v31;
LABEL_20:
  dispatch_time_t v24 = WeakRetained;
  long long v25 = [WeakRetained delegate];
  char v26 = objc_opt_respondsToSelector();

  if (v26)
  {
    id v27 = [v24 delegate];
    int v28 = [v27 additionalEditMenuElementsForSelection:v4];
    if (v28)
    {
      uint64_t v29 = [v7 arrayByAddingObjectsFromArray:v28];

      double v7 = (void *)v29;
    }
  }

  return v7;
}

PDFMarkupStyleView *__60__PDFViewController_additionalEditMenuElementsForSelection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [PDFMarkupStyleView alloc];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __60__PDFViewController_additionalEditMenuElementsForSelection___block_invoke_2;
  v9[3] = &unk_264204A18;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v5 = [(PDFMarkupStyleView *)v4 initWithHandler:v9];
  int v6 = [(PDFMarkupStyleView *)v5 heightAnchor];
  double v7 = [v6 constraintEqualToConstant:40.0];
  [v7 setActive:1];

  objc_destroyWeak(&v10);

  return v5;
}

void __60__PDFViewController_additionalEditMenuElementsForSelection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setMarkupStyle:a2];
  [WeakRetained _closeTextEditingMenu];
}

void __60__PDFViewController_additionalEditMenuElementsForSelection___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained highlight:*(void *)(a1 + 32)];
}

- (id)additionalEditMenuElementsForMarkupAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  objc_initWeak(location, self);
  int v6 = (void *)MEMORY[0x263F82648];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke;
  v35[3] = &unk_264204A40;
  objc_copyWeak(&v36, location);
  double v7 = [v6 elementWithViewProvider:v35];
  id v8 = (void *)MEMORY[0x263F823D0];
  uint64_t v9 = PDFKitLocalizedString(@"Highlight");
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_3;
  v33[3] = &unk_264204A68;
  objc_copyWeak(&v34, location);
  id v10 = [v8 actionWithTitle:v9 image:0 identifier:@"com.apple.pdfkit.action.highlight" handler:v33];
  [v7 setMenuElementRepresentation:v10];

  [v5 addObject:v7];
  uint64_t v11 = [MEMORY[0x263F827E8] systemImageNamed:@"trash"];
  double v12 = (void *)MEMORY[0x263F823D0];
  double v13 = PDFKitLocalizedString(@"Remove");
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_4;
  v31[3] = &unk_264204A90;
  id v14 = v4;
  id v32 = v14;
  uint64_t v15 = [v12 actionWithTitle:v13 image:v11 identifier:@"com.apple.pdfkit.action.removeMarkup" handler:v31];

  objc_msgSend(v15, "setAttributes:", objc_msgSend(v15, "attributes") | 2);
  [v5 addObject:v15];
  uint64_t v16 = [v14 popup];

  if (v16)
  {
    uint64_t v17 = [MEMORY[0x263F827E8] systemImageNamed:@"trash"];

    id v18 = (void *)MEMORY[0x263F823D0];
    double v19 = PDFKitLocalizedString(@"Remove Note");
    double v20 = v29;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_5;
    v29[3] = &unk_264204128;
    uint64_t v21 = &v30;
    objc_copyWeak(&v30, location);
    void v29[4] = v14;
    uint64_t v22 = [v18 actionWithTitle:v19 image:v17 identifier:@"com.apple.pdfkit.action.removeNote" handler:v29];

    objc_msgSend(v22, "setAttributes:", objc_msgSend(v22, "attributes") | 2);
    [v5 addObject:v22];
  }
  else
  {
    uint64_t v17 = [MEMORY[0x263F827E8] systemImageNamed:@"note.text"];

    id v23 = (void *)MEMORY[0x263F823D0];
    dispatch_time_t v24 = PDFKitLocalizedString(@"Add Note");
    double v20 = v27;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    void v27[2] = __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_6;
    v27[3] = &unk_264204128;
    uint64_t v21 = &v28;
    objc_copyWeak(&v28, location);
    v27[4] = v14;
    uint64_t v22 = [v23 actionWithTitle:v24 image:v17 identifier:@"com.apple.pdfkit.action.addNote" handler:v27];

    [v5 addObject:v22];
  }

  objc_destroyWeak(v21);
  long long v25 = (void *)[v5 copy];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);

  objc_destroyWeak(location);

  return v25;
}

PDFMarkupStyleView *__67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [PDFMarkupStyleView alloc];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_2;
  v9[3] = &unk_264204A18;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v5 = [(PDFMarkupStyleView *)v4 initWithHandler:v9];
  int v6 = [(PDFMarkupStyleView *)v5 heightAnchor];
  double v7 = [v6 constraintEqualToConstant:40.0];
  [v7 setActive:1];

  objc_destroyWeak(&v10);

  return v5;
}

void __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setMarkupStyle:a2];
  [WeakRetained _closeTextEditingMenu];
}

void __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showMarkupStyleMenuForMarkupAnnotation];
}

void __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) page];
  [v2 removeAnnotation:*(void *)(a1 + 32) withUndo:1];
}

void __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeNoteForAnnotation:*(void *)(a1 + 32)];
}

void __67__PDFViewController_additionalEditMenuElementsForMarkupAnnotation___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained editNoteForAnnotation:*(void *)(a1 + 32)];
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v30 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF980] arrayWithArray:v9];
  uint64_t v11 = [v8 identifier];
  id v12 = v8;
  id v32 = (void *)v11;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    double v13 = 0;
    goto LABEL_11;
  }
  double v13 = objc_msgSend(v12, "annotation", v30);
  if (!v13) {
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![v32 isEqual:@"com.apple.pdfkit.menu.markup"])
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ![v32 isEqual:@"com.apple.pdfkit.menu.markupstyle"])
    {
      goto LABEL_11;
    }
    objc_initWeak(&location, self);
    [v10 removeAllObjects];
    double v19 = 0;
    while (1)
    {
      uint64_t v20 = PDFMarkupMenuColorMenuIconForMarkupStyle((uint64_t)v19);
      if ((unint64_t)v19 >= 5)
      {
        if (v19 == (char *)5)
        {
          uint64_t v26 = [MEMORY[0x263F827E8] smallUnderlinePot];
        }
        else
        {
          if (v19 != (char *)6)
          {
            long long v25 = 0;
            goto LABEL_25;
          }
          uint64_t v26 = [MEMORY[0x263F827E8] smallStrikeOutPot];
        }
        long long v25 = (void *)v26;
      }
      else
      {
        uint64_t v21 = v20;
        uint64_t v22 = (void *)MEMORY[0x263F827E8];
        id v23 = PDFMarkupMenuColorForMenuIcon(v20);
        dispatch_time_t v24 = PDFMarkupMenuString(v21);
        long long v25 = [v22 smallColorPotForColor:v23 withAccessibilityLabel:v24];
      }
LABEL_25:
      id v27 = (void *)MEMORY[0x263F823D0];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __79__PDFViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2;
      v33[3] = &unk_264204AB8;
      objc_copyWeak(v35, &location);
      v35[1] = v19;
      id v28 = v13;
      id v34 = v28;
      uint64_t v29 = [v27 actionWithTitle:&stru_26C516768 image:v25 identifier:0 handler:v33];
      [v10 addObject:v29];

      objc_destroyWeak(v35);
      if (++v19 == (char *)7)
      {
        objc_destroyWeak(&location);
        double v13 = v28;
        goto LABEL_11;
      }
    }
  }
  id v14 = [(PDFViewController *)self additionalEditMenuElementsForMarkupAnnotation:v13];
  if ([v14 count])
  {
    uint64_t v15 = [v9 indexOfObjectPassingTest:&__block_literal_global_11];
    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v15 = [v9 count] - 1;
    }
    uint64_t v16 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v15 + 1, objc_msgSend(v14, "count"));
    [v10 insertObjects:v14 atIndexes:v16];
  }
LABEL_11:
  uint64_t v17 = objc_msgSend(MEMORY[0x263F82940], "menuWithChildren:", v10, v30);

  return v17;
}

uint64_t __79__PDFViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    int v6 = [v5 identifier];
    uint64_t v7 = [v6 isEqual:*MEMORY[0x263F838A8]];
    if (v7) {
      *a4 = 1;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __79__PDFViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setMarkupStyle:*(void *)(a1 + 48) forAnnotation:*(void *)(a1 + 32)];
}

- (void)_closeTextEditingMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  id v6 = [WeakRetained documentView];

  id v3 = [v6 interactions];
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_207];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [v3 objectAtIndex:v4];
    [v5 dismissMenu];
  }
}

uint64_t __42__PDFViewController__closeTextEditingMenu__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  id v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [v5 dismissMenu];
    *a4 = 1;
  }

  return isKindOfClass & 1;
}

- (void)setMarkupStyle:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  [WeakRetained setActiveMarkupStyle:a3];
  id v5 = [WeakRetained currentSelection];
  if (v5)
  {
    [(PDFViewController *)self setMarkupStyle:a3 forSelection:v5 clearSelection:0];
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
    if (v6)
    {
      uint64_t v7 = v6;
      [(PDFViewController *)self setMarkupStyle:a3 forAnnotation:v6];
    }
  }
}

- (void)deleteAnnotation
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  id v36 = [WeakRetained document];
  CGRect v37 = WeakRetained;
  uint64_t v4 = [WeakRetained currentSelection];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v34 = self;
  id v35 = v4;
  if (v4)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v6 = [v4 pages];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v47 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v35, "rangeAtIndex:onPage:", 0, v11, v34);
          id v14 = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", v12, v13);
          uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v36, "indexForPage:", v11));
          [v5 setObject:v14 forKey:v15];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v16 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
    id v6 = v16;
    if (v16)
    {
      uint64_t v17 = [v16 indexSetForQuadPoints];
      id v18 = NSNumber;
      double v19 = [v6 page];
      uint64_t v20 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v36, "indexForPage:", v19));
      [v5 setObject:v17 forKey:v20];
    }
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v21 = v5;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v43 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        id v27 = objc_msgSend(v21, "objectForKey:", v26, v34);
        id v28 = objc_msgSend(v37, "pageViewForPageAtIndex:", objc_msgSend(v26, "integerValue"));
        uint64_t v29 = [v28 markupAnnotationsForIndexSet:v27];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v38 objects:v50 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v39;
          do
          {
            for (uint64_t k = 0; k != v31; ++k)
            {
              if (*(void *)v39 != v32) {
                objc_enumerationMutation(v29);
              }
              objc_msgSend(v28, "addMarkupWithStyle:forIndexSet:", objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * k), "markupStyle"), v27);
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v38 objects:v50 count:16];
          }
          while (v31);
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v23);
  }

  [(PDFViewController *)v34 _hidePDFMarkupMenuView];
}

- (void)_annotationHitLongPress:(id)a3 gestureState:(int64_t)a4 location:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  v22[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  uint64_t v11 = [WeakRetained renderingProperties];
  int v12 = [v11 isUsingPDFExtensionView];

  if (v12)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    id v14 = self->_private;
    if (a4 == 1)
    {
      v14->longPressGestureStartTime = v13;
      self->_private->didPostPDFExtensionViewAnnotationLongPress = 0;
      uint64_t v15 = [(PDFViewController *)self _pageViewForAnnotation:v9];
      id v16 = [v15 pageLayer];
      id v17 = +[PDFPageLayerEffect createFlashEffectForPDFLinkAnnotation:v9 withLayer:v16 forType:2];
    }
    else if (v13 - v14->longPressGestureStartTime > 0.75 && !v14->didPostPDFExtensionViewAnnotationLongPress)
    {
      id v18 = [MEMORY[0x263F08A00] defaultCenter];
      v21[0] = @"annotation";
      v21[1] = @"location";
      v22[0] = v9;
      double v19 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFPoint:", x, y);
      v22[1] = v19;
      uint64_t v20 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
      [v18 postNotificationName:@"PDFExtensionViewAnnotationLongPress" object:self userInfo:v20];

      self->_private->didPostPDFExtensionViewAnnotationLongPress = 1;
    }
  }
}

- (id)_annotationAtGestureLocation:(CGPoint)a3
{
  double v7 = 0.0;
  double v8 = 0.0;
  id v3 = -[PDFViewController _getPagePoint:forGestureLocation:](self, "_getPagePoint:forGestureLocation:", &v7, a3.x, a3.y);
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(v3, "annotationAtPoint:", v7, v8);
    if (!v5)
    {
      id v5 = objc_msgSend(v4, "scannedAnnotationAtPoint:", v7, v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_annotationsForSelection:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  id v6 = [v4 pages];
  if ((unint64_t)[v6 count] <= 1)
  {
    double v8 = [v6 firstObject];
    id v9 = [WeakRetained document];
    id v10 = objc_msgSend(WeakRetained, "pageViewForPageAtIndex:", objc_msgSend(v9, "indexForPage:", v8));

    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x263F088D0]);
      uint64_t v12 = [v4 rangeAtIndex:0 onPage:v8];
      id v14 = objc_msgSend(v11, "initWithIndexesInRange:", v12, v13);
      double v7 = [v10 markupAnnotationsForIndexSet:v14];
    }
    else
    {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)_getPagePoint:(CGPoint *)a3 forGestureLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  uint64_t v8 = objc_msgSend(WeakRetained, "pageForPoint:nearest:", 0, x, y);
  id v9 = (void *)v8;
  if (a3 && v8)
  {
    objc_msgSend(WeakRetained, "convertPoint:toPage:", v8, x, y);
    a3->double x = v10;
    a3->double y = v11;
  }

  return v9;
}

- (BOOL)_handleFormFillingEventAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    double v7 = objc_msgSend(WeakRetained, "pageForPoint:nearest:", 0, x, y);
    if (v7 && [v6 isInFormFillingMode] && GetDefaultsWriteAKEnabled())
    {
      objc_msgSend(v6, "insertFormFieldAtBestLocationNearPoint:onPage:", v7, x, y);
      BOOL v8 = 1;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end