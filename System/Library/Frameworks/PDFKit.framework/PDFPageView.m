@interface PDFPageView
- (BOOL)_allowsFormFieldEntry;
- (BOOL)_shouldReplaceStringOnAnnotation:(id)a3 withTextView:(id)a4;
- (BOOL)enablesTileUpdates;
- (BOOL)hasBackgroundImage;
- (BOOL)isOverlayViewInstalled;
- (BOOL)isVisible;
- (BOOL)shouldRegisterUndo;
- (CGAffineTransform)_rotationTransformForPageView;
- (CGAffineTransform)layerEffectTransform;
- (CGPoint)convertPointToPageView:(CGPoint)a3;
- (CGRect)convertRectToPageView:(CGRect)a3;
- (PDFPageView)initWithPage:(id)a3 geometryInterface:(id)a4 andRenderingProperties:(id)a5;
- (id)activeAnnotation;
- (id)backgroundImage;
- (id)geometryInterface;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)markupAnnotationsForIndexSet:(id)a3;
- (id)page;
- (id)pageLayer;
- (id)pageLayerEffectForID:(id)a3;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (id)renderingProperties;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int)backgroundImageQuality;
- (int64_t)displayBox;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)visibilityDelegateIndex;
- (void)_addPDFAnnotation:(id)a3;
- (void)_addPDFAnnotationChoiceWidget:(id)a3;
- (void)_addPDFAnnotationStampSignature:(id)a3;
- (void)_addPDFAnnotationTextWidget:(id)a3;
- (void)_choiceWidgetDone;
- (void)_formChanged:(id)a3;
- (void)_rotateActiveAnnotation;
- (void)_setAttributedStringForAnnotation:(id)a3 stringValue:(id)a4 textView:(id)a5;
- (void)_setupBookmarkLayer;
- (void)_setuppageAnnotationEffects;
- (void)_updateAnnotationVisibility:(id)a3;
- (void)_updateBackgroundColor;
- (void)_updateWidgetControl:(id)a3 forBounds:(CGRect)a4;
- (void)addBookmark;
- (void)addControlForAnnotation:(id)a3;
- (void)addMarkupWithStyle:(unint64_t)a3 forIndexSet:(id)a4;
- (void)addPageLayerEffect:(id)a3;
- (void)addSearchSelection:(id)a3;
- (void)applyTileLayoutScale:(double)a3;
- (void)clearTiles;
- (void)colorWidgetBackgrounds:(BOOL)a3;
- (void)dealloc;
- (void)enableHighlightDetectedFormFields:(BOOL)a3;
- (void)forceTileUpdate;
- (void)hideTileLayer:(BOOL)a3;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)populateFormFieldsWithAutoFillSuggestion:(id)a3 completionHandler:(id)a4;
- (void)previewRotatePage:(double)a3;
- (void)removeAnnotation:(id)a3;
- (void)removeBookmark;
- (void)removeControlForAnnotation:(id)a3;
- (void)removePageLayerEffectForID:(id)a3;
- (void)restoreOriginalTileLayout;
- (void)saveOriginalTileLayout;
- (void)scalePageLayerEffects:(double)a3;
- (void)setBackgroundImage:(id)a3 atBackgroundQuality:(int)a4;
- (void)setEnableTileUpdates:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setNeedsTilesUpdate;
- (void)setOverlayViewInstalled:(BOOL)a3;
- (void)setSearchSelections:(id)a3;
- (void)setState:(int64_t)a3 onButtonWidgetAnnotation:(id)a4;
- (void)setStringValue:(id)a3 onChoiceWidgetAnnotation:(id)a4 withTableView:(id)a5;
- (void)setStringValue:(id)a3 onChoiceWidgetAnnotation:(id)a4 withTextField:(id)a5;
- (void)setStringValue:(id)a3 onTextAnnotation:(id)a4;
- (void)setStringValue:(id)a3 onTextWidgetAnnotation:(id)a4;
- (void)setStringValue:(id)a3 onTextWidgetAnnotation:(id)a4 withTextView:(id)a5;
- (void)setVisibilityDelegateIndex:(unint64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateAnnotation:(id)a3;
- (void)updateBookmark;
- (void)updatePageLayerEffectForID:(id)a3;
- (void)updatePageLayerEffects;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation PDFPageView

- (PDFPageView)initWithPage:(id)a3 geometryInterface:(id)a4 andRenderingProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_msgSend(v8, "boundsForBox:", objc_msgSend(v10, "displayBox"));
  double v11 = *MEMORY[0x263F00148];
  double v12 = *(double *)(MEMORY[0x263F00148] + 8);
  v41.receiver = self;
  v41.super_class = (Class)PDFPageView;
  v13 = -[PDFPageView initWithFrame:](&v41, sel_initWithFrame_, v11, v12);
  if (v13)
  {
    v14 = objc_alloc_init(PDFPageViewPrivate);
    v15 = v13->_private;
    v13->_private = v14;

    objc_storeWeak((id *)&v13->_private->page, v8);
    objc_storeWeak((id *)&v13->_private->geometryInterface, v9);
    objc_storeWeak((id *)&v13->_private->renderingProperties, v10);
    v16 = [[PDFPageLayer alloc] initWithPage:v8 geometryInterface:v9 andRenderingProperties:v10];
    objc_storeWeak((id *)&v13->_private->pageLayer, v16);
    [(PDFPageLayer *)v16 setZPosition:-1100.0];
    v17 = [(PDFPageView *)v13 layer];
    [v17 addSublayer:v16];

    objc_storeWeak((id *)&v13->_private->activeAnnotation, 0);
    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    v19 = v13->_private;
    activeControls = v19->activeControls;
    v19->activeControls = (NSMutableDictionary *)v18;

    v13->_private->isPerformingUndo = 0;
    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v22 = v13->_private;
    pageSignatures = v22->pageSignatures;
    v22->pageSignatures = v21;

    v24 = [[PDFPageViewAnnotationController alloc] initWithPDFPageView:v13];
    v25 = v13->_private;
    annotationController = v25->annotationController;
    v25->annotationController = v24;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v28 = v13->_private;
    pageAnnotationEffects = v28->pageAnnotationEffects;
    v28->pageAnnotationEffects = v27;

    v13->_private->visibilityDelegateIndex = 0x7FFFFFFFFFFFFFFFLL;
    v30 = v13->_private;
    bookmarkLayer = v30->bookmarkLayer;
    v30->bookmarkLayer = 0;

    v13->_private->bookmarkSize = (CGSize)*MEMORY[0x263F001B0];
    v32 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    v33 = v13->_private;
    backgroundLayer = v33->backgroundLayer;
    v33->backgroundLayer = v32;

    v13->_private->backgroundQuality = 2;
    [(CALayer *)v13->_private->backgroundLayer setFrame:PDFRectToCGRect([(PDFPageView *)v13 bounds])];
    [(PDFPageLayer *)v16 addSublayer:v13->_private->backgroundLayer];
    [(CALayer *)v13->_private->backgroundLayer setZPosition:-900.0];
    [(CALayer *)v13->_private->backgroundLayer setMinificationFilter:*MEMORY[0x263F15CC8]];
    [(PDFPageView *)v13 _updateBackgroundColor];
    uint64_t v35 = +[PDFPageLayerEffect createPDFSelectionLayerEffectsForSelections:0 withLayer:v16];
    v36 = v13->_private;
    searchLayer = v36->searchLayer;
    v36->searchLayer = (PDFPageLayerEffect *)v35;

    [(PDFPageLayerEffect *)v13->_private->searchLayer setZPosition:-500.0];
    [(PDFPageView *)v13 _setupBookmarkLayer];
    [(PDFPageView *)v13 _setuppageAnnotationEffects];
    [(PDFPageView *)v13 setUserInteractionEnabled:0];
    if (GetDefaultsWriteHighlightDetectedAnnotations()) {
      [(PDFPageView *)v13 enableHighlightDetectedFormFields:1];
    }
    v38 = [MEMORY[0x263F08A00] defaultCenter];
    [v38 addObserver:v13 selector:sel__didRotatePageNotification_ name:@"PDFPageDidRotate" object:v8];
    [v38 addObserver:v13 selector:sel__didRotatePageNotification_ name:@"PDFPageDidChangeBounds" object:v8];
    v39 = [v8 document];
    [v38 addObserver:v13 selector:sel__formChanged_ name:@"PDFFormDidChangeValue" object:v39];
  }
  return v13;
}

- (void)dealloc
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    [MEMORY[0x263F158F8] activateBackground:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  v5 = [(PDFPageLayerEffect *)self->_private->searchLayer UUID];
  [WeakRetained removePageLayerEffectForID:v5];

  v6 = self->_private;
  searchLayer = v6->searchLayer;
  v6->searchLayer = 0;

  [(CALayer *)self->_private->backgroundLayer removeFromSuperlayer];
  id v8 = self->_private;
  backgroundLayer = v8->backgroundLayer;
  v8->backgroundLayer = 0;

  [WeakRetained removeFromSuperlayer];
  objc_storeWeak((id *)&self->_private->pageLayer, 0);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = self->_private->pageSignatures;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*(void *)(*((void *)&v31 + 1) + 8 * v14++) + 16) removeFromSuperlayer];
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v12);
  }

  [(NSMutableArray *)self->_private->pageSignatures removeAllObjects];
  id v15 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  if (v15)
  {
    [(PDFPageView *)self removeControlForAnnotation:v15];
    id v16 = objc_loadWeakRetained((id *)&self->_private->page);
    v17 = [v16 view];
    [v17 setActiveAnnotation:0];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v18 = self->_private->pageAnnotationEffects;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        [(PDFPageView *)self removePageLayerEffectForID:*(void *)(*((void *)&v27 + 1) + 8 * v22++)];
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }

  [(NSMutableArray *)self->_private->pageAnnotationEffects removeAllObjects];
  bookmarkLayer = self->_private->bookmarkLayer;
  if (bookmarkLayer)
  {
    [(CALayer *)bookmarkLayer removeFromSuperlayer];
    v24 = self->_private;
    v25 = v24->bookmarkLayer;
    v24->bookmarkLayer = 0;
  }
  [MEMORY[0x263F158F8] commit];

  v26.receiver = self;
  v26.super_class = (Class)PDFPageView;
  [(PDFPageView *)&v26 dealloc];
}

- (void)willMoveToSuperview:(id)a3
{
  if (!a3)
  {
    id v5 = [(PDFPageView *)self undoManager];
    [v5 removeAllActionsWithTarget:self];
  }
}

- (id)renderingProperties
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->renderingProperties);

  return WeakRetained;
}

- (void)setNeedsTilesUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  [WeakRetained setNeedsTilesUpdate];

  [(PDFPageView *)self _updateBackgroundColor];
}

- (int64_t)displayBox
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
  int64_t v3 = [WeakRetained displayBox];

  return v3;
}

- (BOOL)isVisible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  char v3 = [WeakRetained isVisible];

  return v3;
}

- (void)addPageLayerEffect:(id)a3
{
  p_pageLayer = &self->_private->pageLayer;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pageLayer);
  [WeakRetained addPageLayerEffect:v4];
}

- (void)removePageLayerEffectForID:(id)a3
{
  p_pageLayer = &self->_private->pageLayer;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pageLayer);
  [WeakRetained removePageLayerEffectForID:v4];
}

- (id)pageLayerEffectForID:(id)a3
{
  p_pageLayer = &self->_private->pageLayer;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pageLayer);
  v6 = [WeakRetained pageLayerEffectForID:v4];

  return v6;
}

- (void)updatePageLayerEffectForID:(id)a3
{
  p_pageLayer = &self->_private->pageLayer;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pageLayer);
  [WeakRetained updatePageLayerEffectForID:v4];
}

- (void)updatePageLayerEffects
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  [WeakRetained updatePageLayerEffects];
}

- (CGAffineTransform)layerEffectTransform
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained layerEffectTransform];
    id WeakRetained = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (void)scalePageLayerEffects:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  [WeakRetained scalePageLayerEffects:a3];
}

- (void)setEnableTileUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  [WeakRetained setEnableTileUpdates:v3];
}

- (BOOL)enablesTileUpdates
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  char v3 = [WeakRetained enablesTileUpdates];

  return v3;
}

- (void)forceTileUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  [WeakRetained forceTileUpdate];
}

- (void)clearTiles
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  [WeakRetained clearTiles];
}

- (void)saveOriginalTileLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  [WeakRetained saveOriginalTileLayout];
}

- (void)restoreOriginalTileLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  [WeakRetained restoreOriginalTileLayout];
}

- (void)applyTileLayoutScale:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  [WeakRetained applyTileLayoutScale:a3];
}

- (void)setVisibilityDelegateIndex:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  [WeakRetained setVisibilityDelegateIndex:a3];
}

- (unint64_t)visibilityDelegateIndex
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  unint64_t v3 = [WeakRetained visibilityDelegateIndex];

  return v3;
}

- (void)_updateBackgroundColor
{
  unint64_t v3 = [(CALayer *)self->_private->backgroundLayer contents];

  if (!v3)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
    uint64_t v4 = [WeakRetained pageBackgroundColorHint];
    backgroundLayer = self->_private->backgroundLayer;
    if (v4)
    {
      -[CALayer setBackgroundColor:](backgroundLayer, "setBackgroundColor:", [WeakRetained pageBackgroundColorHint]);
    }
    else
    {
      id v6 = [MEMORY[0x263F825C8] whiteColor];
      -[CALayer setBackgroundColor:](backgroundLayer, "setBackgroundColor:", [v6 CGColor]);
    }
    [MEMORY[0x263F158F8] commit];
  }
}

- (id)page
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);

  return WeakRetained;
}

- (id)geometryInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->geometryInterface);

  return WeakRetained;
}

- (id)pageLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);

  return WeakRetained;
}

- (void)setBackgroundImage:(id)a3 atBackgroundQuality:(int)a4
{
  id v6 = a3;
  v7 = self->_private->backgroundImage;
  objc_sync_enter(v7);
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    [MEMORY[0x263F158F8] activateBackground:1];
  }
  id v8 = self->_private;
  backgroundLayer = v8->backgroundLayer;
  id WeakRetained = objc_loadWeakRetained((id *)&v8->page);
  double v11 = PDFDegToRad((double)[WeakRetained rotation]);
  CGAffineTransformMakeRotation(&v17, v11);
  [(CALayer *)backgroundLayer setAffineTransform:&v17];

  uint64_t v12 = self->_private->backgroundLayer;
  [(PDFPageView *)self frame];
  double v14 = v13;
  [(PDFPageView *)self frame];
  -[CALayer setFrame:](v12, "setFrame:", 0.0, 0.0, v14);
  id v15 = v6;
  -[CALayer setContents:](self->_private->backgroundLayer, "setContents:", [v15 CGImage]);
  objc_storeStrong((id *)&self->_private->backgroundImage, v15);
  self->_private->backgroundQuality = a4;
  id v16 = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  [v16 setMasksToBounds:0];

  [MEMORY[0x263F158F8] commit];
  objc_sync_exit(v7);
}

- (BOOL)hasBackgroundImage
{
  v2 = self;
  unint64_t v3 = self->_private->backgroundImage;
  objc_sync_enter(v3);
  LOBYTE(v2) = v2->_private->backgroundImage != 0;
  objc_sync_exit(v3);

  return (char)v2;
}

- (id)backgroundImage
{
  unint64_t v3 = self->_private->backgroundImage;
  objc_sync_enter(v3);
  uint64_t v4 = self->_private->backgroundImage;
  objc_sync_exit(v3);

  return v4;
}

- (int)backgroundImageQuality
{
  v2 = self;
  unint64_t v3 = self->_private->backgroundImage;
  objc_sync_enter(v3);
  LODWORD(v2) = v2->_private->backgroundQuality;
  objc_sync_exit(v3);

  return (int)v2;
}

- (void)setSearchSelections:(id)a3
{
}

- (void)addSearchSelection:(id)a3
{
  if (a3) {
    -[PDFPageLayerEffect addSelection:](self->_private->searchLayer, "addSelection:");
  }
}

- (void)previewRotatePage:(double)a3
{
  double v4 = PDFDegToRad(a3);
  [(PDFPageView *)self frame];
  double v6 = v5;
  double v8 = v7;
  CGFloat v9 = v7 * 0.5;
  long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v14.c = v10;
  *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v13.a = *(_OWORD *)&v14.a;
  *(_OWORD *)&v13.c = v10;
  *(_OWORD *)&v13.tx = *(_OWORD *)&v14.tx;
  CGAffineTransformTranslate(&v14, &v13, v5 * 0.5, v9);
  CGAffineTransform v12 = v14;
  CGAffineTransformRotate(&v13, &v12, v4);
  CGAffineTransform v14 = v13;
  CGAffineTransform v12 = v13;
  CGAffineTransformTranslate(&v13, &v12, -(v6 * 0.5), -(v8 * 0.5));
  CGAffineTransform v14 = v13;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  CGAffineTransform v13 = v14;
  [WeakRetained setAffineTransform:&v13];

  [MEMORY[0x263F158F8] commit];
}

- (void)hideTileLayer:(BOOL)a3
{
}

- (void)colorWidgetBackgrounds:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    double v6 = [WeakRetained annotations];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          CGAffineTransform v12 = [v11 valueForAnnotationKey:@"/Subtype"];
          if ([v12 isEqualToString:@"/Widget"]) {
            [(PDFPageView *)self updateAnnotation:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)enableHighlightDetectedFormFields:(BOOL)a3
{
  detectedFormFieldBoundingBoxesLayer = self->_private->detectedFormFieldBoundingBoxesLayer;
  if (a3)
  {
    if (!detectedFormFieldBoundingBoxesLayer)
    {
      double v5 = [PDFHighlightDetectedFormFieldsEffectLayer alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
      uint64_t v7 = [(PDFHighlightDetectedFormFieldsEffectLayer *)v5 initWithPage:WeakRetained];
      uint64_t v8 = self->_private;
      uint64_t v9 = v8->detectedFormFieldBoundingBoxesLayer;
      v8->detectedFormFieldBoundingBoxesLayer = (PDFHighlightDetectedFormFieldsEffectLayer *)v7;

      [(PDFHighlightDetectedFormFieldsEffectLayer *)self->_private->detectedFormFieldBoundingBoxesLayer setDisplayBox:1];
      long long v10 = [(PDFPageView *)self layer];
      [v10 addSublayer:self->_private->detectedFormFieldBoundingBoxesLayer];

      [(PDFHighlightDetectedFormFieldsEffectLayer *)self->_private->detectedFormFieldBoundingBoxesLayer setFrame:PDFRectToCGRect([(PDFPageView *)self bounds])];
      [(PDFHighlightDetectedFormFieldsEffectLayer *)self->_private->detectedFormFieldBoundingBoxesLayer setZPosition:0.0];
      detectedFormFieldBoundingBoxesLayer = self->_private->detectedFormFieldBoundingBoxesLayer;
    }
    [(PDFHighlightDetectedFormFieldsEffectLayer *)detectedFormFieldBoundingBoxesLayer updateVisibleLayers];
  }
  else if (detectedFormFieldBoundingBoxesLayer)
  {
    [(PDFHighlightDetectedFormFieldsEffectLayer *)detectedFormFieldBoundingBoxesLayer removeFromSuperlayer];
    double v11 = self->_private;
    CGAffineTransform v12 = v11->detectedFormFieldBoundingBoxesLayer;
    v11->detectedFormFieldBoundingBoxesLayer = 0;
  }
}

- (void)updateAnnotation:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  id v6 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  if (WeakRetained)
  {
    uint64_t v7 = [v4 valueForAnnotationKey:@"/Subtype"];
    if ([v7 isEqualToString:@"/Popup"] && ShouldRenderAnnotationsInPDFKit())
    {
      [WeakRetained annotations];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
LABEL_6:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "popup", (void)v15);
          id v13 = (id)objc_claimAutoreleasedReturnValue();

          if (v13 == v4) {
            break;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
            if (v10) {
              goto LABEL_6;
            }
            break;
          }
        }
      }

      [(PDFPageView *)self _updateAnnotationVisibility:v4];
      long long v14 = [v4 pdfAnnotationUUID];
      [(PDFPageView *)self updatePageLayerEffectForID:v14];
    }
    else
    {
      if (![v4 handledByPDFKit])
      {
LABEL_16:

        goto LABEL_17;
      }
      [(PDFPageView *)self _updateAnnotationVisibility:v4];
      id v8 = [v4 pdfAnnotationUUID];
      [(PDFPageView *)self updatePageLayerEffectForID:v8];
    }

    goto LABEL_16;
  }
LABEL_17:
}

- (void)_updateAnnotationVisibility:(id)a3
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  if (WeakRetained)
  {
    double v5 = [v11 pdfAnnotationUUID];
    id v6 = [(PDFPageView *)self pageLayerEffectForID:v5];
    if (!v6)
    {
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v7 = [v11 valueForAnnotationKey:@"/Subtype"];
    int v8 = [v7 isEqualToString:@"/Widget"];

    if (v8)
    {
      if ([v11 isTextWidget])
      {
        int v8 = 0;
      }
      else
      {
        uint64_t v9 = [v11 control];
        int v8 = v9 != 0;
      }
    }
    if ([v11 shouldDisplay])
    {
      uint64_t v10 = [WeakRetained displaysAnnotations] ^ 1 | v8;
      if ([v6 isHidden] != v10) {
        goto LABEL_14;
      }
    }
    else if (([v6 isHidden] & 1) == 0)
    {
      uint64_t v10 = 1;
LABEL_14:
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
      [v6 setHidden:v10];
      [MEMORY[0x263F158F8] commit];
      goto LABEL_15;
    }
    if ((v8 & 1) == 0) {
      [v6 setNeedsDisplay];
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (void)removeAnnotation:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [v4 valueForAnnotationKey:@"/Subtype"];
  if ([v5 isEqualToString:@"/Stamp"]
    && [v4 isSignature])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = self->_private->pageSignatures;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ((id)v11[1] == v4)
          {
            id v13 = v11;

            [(objc_class *)v13[2].super.super.isa removeFromSuperlayer];
            [(NSMutableArray *)self->_private->pageSignatures removeObject:v13];
            id v6 = v13;
            goto LABEL_14;
          }
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    uint64_t v12 = [v4 pdfAnnotationUUID];
    [(PDFPageView *)self removePageLayerEffectForID:v12];

    [MEMORY[0x263F158F8] commit];
  }
}

- (id)activeAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  if (!WeakRetained)
  {
    id WeakRetained = [(PDFPageViewAnnotationController *)self->_private->annotationController activeAnnotation];
  }

  return WeakRetained;
}

- (void)addControlForAnnotation:(id)a3
{
  id v4 = a3;
  activeControls = self->_private->activeControls;
  id v14 = v4;
  id v6 = [v4 pdfAnnotationUUID];
  uint64_t v7 = [(NSMutableDictionary *)activeControls objectForKey:v6];

  if (!v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
    uint64_t v9 = [WeakRetained view];

    if ([v14 isSynthesizedFormField])
    {
      id v10 = objc_loadWeakRetained((id *)&self->_private->page);
      id v11 = [v10 view];
      uint64_t v12 = [v11 controller];

      [v12 activateAnnotation:v14];
    }
    else
    {
      id v10 = [v9 activeAnnotation];
      [(PDFPageViewAnnotationController *)self->_private->annotationController addControlForAnnotation:v14];
      if (v10) {
        BOOL v13 = v10 == v14;
      }
      else {
        BOOL v13 = 1;
      }
      if (!v13) {
        [v9 removeControlForAnnotation:v10];
      }
    }
  }
}

- (void)_rotateActiveAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v4 = [WeakRetained pdfAnnotationUUID];
    if (v4)
    {
      double v5 = [(NSMutableDictionary *)self->_private->activeControls objectForKey:v4];
      if (v5)
      {
        [v6 bounds];
        -[PDFPageView _updateWidgetControl:forBounds:](self, "_updateWidgetControl:forBounds:", v5);
      }
    }
    id WeakRetained = v6;
  }
}

- (void)removeControlForAnnotation:(id)a3
{
  id v8 = a3;
  [(PDFPageViewAnnotationController *)self->_private->annotationController removeControlForAnnotation:v8];
  id v4 = v8;
  if (v8)
  {
    double v5 = [v8 pdfAnnotationUUID];
    if (v5)
    {
      id v6 = [(NSMutableDictionary *)self->_private->activeControls objectForKey:v5];
      if (v6)
      {
        [MEMORY[0x263F158F8] begin];
        [MEMORY[0x263F158F8] setDisableActions:1];
        [v8 setControl:0];
        [v6 removeFromSuperview];
        [MEMORY[0x263F158F8] commit];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);

        if (WeakRetained == v8) {
          objc_storeWeak((id *)&self->_private->activeAnnotation, 0);
        }
        [(NSMutableDictionary *)self->_private->activeControls removeObjectForKey:v5];
      }
    }
    id v4 = v8;
  }
}

- (void)addMarkupWithStyle:(unint64_t)a3 forIndexSet:(id)a4
{
}

- (id)markupAnnotationsForIndexSet:(id)a3
{
  return [(PDFPageViewAnnotationController *)self->_private->annotationController markupAnnotationsForIndexSet:a3];
}

- (void)populateFormFieldsWithAutoFillSuggestion:(id)a3 completionHandler:(id)a4
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v48 = a3;
  v49 = (void (**)(id, void *))a4;
  v61 = [v48 contents];
  double v5 = (void *)MEMORY[0x263EFF9C0];
  id v6 = [v61 allKeys];
  v51 = [v5 setWithArray:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  id v7 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  id v8 = v7;
  if (v7 && [v7 isTextWidget])
  {
    uint64_t v9 = v8;
    id v10 = [v8 control];
    v59 = [v10 textView];
  }
  else
  {
    id v11 = v8;
    uint64_t v12 = [WeakRetained view];
    id v10 = [v12 controller];

    uint64_t v9 = [v10 activeAnnotation];

    if ([v9 isSynthesizedFormField])
    {
      v59 = 0;
    }
    else
    {

      v59 = 0;
      uint64_t v9 = 0;
    }
  }

  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x2050000000;
  BOOL v13 = (void *)getAFInsertionManagerClass_softClass;
  uint64_t v94 = getAFInsertionManagerClass_softClass;
  if (!getAFInsertionManagerClass_softClass)
  {
    uint64_t v86 = MEMORY[0x263EF8330];
    uint64_t v87 = 3221225472;
    uint64_t v88 = (uint64_t)__getAFInsertionManagerClass_block_invoke;
    uint64_t v89 = (uint64_t)&unk_264203C20;
    v90 = &v91;
    __getAFInsertionManagerClass_block_invoke((uint64_t)&v86);
    BOOL v13 = (void *)v92[3];
  }
  v62 = v9;
  id v14 = v13;
  _Block_object_dispose(&v91, 8);
  long long v15 = [v14 preferredInsertionOrder];
  long long v16 = [WeakRetained annotations];
  long long v17 = v16;
  if (v9 && (uint64_t v18 = objc_msgSend(v16, "indexOfObjectIdenticalTo:")) != 0)
  {
    uint64_t v19 = objc_msgSend(v17, "subarrayWithRange:", v18, objc_msgSend(v17, "count") - v18);

    uint64_t v20 = (void *)v19;
  }
  else
  {
    uint64_t v20 = v17;
  }
  v55 = v20;
  if ((unint64_t)[v20 count] >= 2)
  {
    uint64_t v86 = 0;
    uint64_t v87 = (uint64_t)&v86;
    uint64_t v88 = 0x2020000000;
    uint64_t v89 = 0x7FFFFFFFFFFFFFFFLL;
    v85[0] = MEMORY[0x263EF8330];
    v85[1] = 3221225472;
    v85[2] = __74__PDFPageView_populateFormFieldsWithAutoFillSuggestion_completionHandler___block_invoke;
    v85[3] = &unk_2642044C0;
    v85[4] = &v86;
    [v55 enumerateObjectsUsingBlock:v85];
    if (*(void *)(v87 + 24) != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v21 = [v55 subarrayWithRange:0];

      v55 = (void *)v21;
    }
    _Block_object_dispose(&v86, 8);
  }
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  obuint64_t j = v15;
  uint64_t v56 = [obj countByEnumeratingWithState:&v81 objects:v97 count:16];
  if (v56)
  {
    uint64_t v54 = *(void *)v82;
    uint64_t v50 = *MEMORY[0x263F839F0];
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v82 != v54)
        {
          uint64_t v23 = v22;
          objc_enumerationMutation(obj);
          uint64_t v22 = v23;
        }
        uint64_t v57 = v22;
        uint64_t v24 = *(void *)(*((void *)&v81 + 1) + 8 * v22);
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v64 = v55;
        uint64_t v25 = [v64 countByEnumeratingWithState:&v77 objects:v96 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v78;
          while (2)
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v78 != v26) {
                objc_enumerationMutation(v64);
              }
              long long v28 = *(void **)(*((void *)&v77 + 1) + 8 * i);
              if ([v28 isActivatableTextField])
              {
                long long v29 = [v28 autoFillTextContentType];
                v68 = v29;
                long long v30 = v29;
                if (v29)
                {
                  int v31 = [v29 isEqualToString:v24];
                  long long v30 = v68;
                  if (v31)
                  {
                    aBlock[0] = MEMORY[0x263EF8330];
                    aBlock[1] = 3221225472;
                    aBlock[2] = __74__PDFPageView_populateFormFieldsWithAutoFillSuggestion_completionHandler___block_invoke_2;
                    aBlock[3] = &unk_2642044E8;
                    id v74 = v62;
                    v75 = self;
                    id v76 = v59;
                    v66 = (void (**)(void *, void *, void))_Block_copy(aBlock);
                    v63 = [v28 autoFillTextContentType];
                    v67 = [v61 objectForKeyedSubscript:v63];
                    if ([v67 length])
                    {
                      v58 = [WeakRetained formFieldGroupForAnnotation:v28];
                      int v32 = [v63 isEqualToString:v50];
                      if (v58) {
                        int v33 = v32;
                      }
                      else {
                        int v33 = 0;
                      }
                      if (v33 == 1)
                      {
                        uint64_t v34 = [v67 length];
                        uint64_t v35 = [v58 count];
                        unint64_t v36 = [v58 count];
                        NSUInteger v37 = [v67 length];
                        long long v71 = 0u;
                        long long v72 = 0u;
                        long long v69 = 0u;
                        long long v70 = 0u;
                        id v65 = v58;
                        uint64_t v38 = [v65 countByEnumeratingWithState:&v69 objects:v95 count:16];
                        if (v38)
                        {
                          NSUInteger v39 = 0;
                          unint64_t v40 = v34 + v35 - 1;
                          uint64_t v41 = *(void *)v70;
                          NSUInteger v42 = v40 / v36;
                          do
                          {
                            for (uint64_t j = 0; j != v38; ++j)
                            {
                              if (*(void *)v70 != v41) {
                                objc_enumerationMutation(v65);
                              }
                              uint64_t v44 = *(void *)(*((void *)&v69 + 1) + 8 * j);
                              v99.location = v39;
                              v99.length = v42;
                              v100.location = 0;
                              v100.length = v37;
                              NSRange v45 = NSIntersectionRange(v99, v100);
                              if (v45.length)
                              {
                                v46 = objc_msgSend(v67, "substringWithRange:", v45.location, v45.length);
                                v66[2](v66, v46, v44);
                              }
                              v39 += v42;
                            }
                            uint64_t v38 = [v65 countByEnumeratingWithState:&v69 objects:v95 count:16];
                          }
                          while (v38);
                        }
                      }
                      else
                      {
                        ((void (**)(void *, void *, void *))v66)[2](v66, v67, v28);
                      }
                      v47 = [v28 autoFillTextContentType];
                      [v51 removeObject:v47];

                      goto LABEL_52;
                    }

                    long long v30 = v68;
                  }
                }
              }
            }
            uint64_t v25 = [v64 countByEnumeratingWithState:&v77 objects:v96 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }
LABEL_52:

        uint64_t v22 = v57 + 1;
      }
      while (v57 + 1 != v56);
      uint64_t v56 = [obj countByEnumeratingWithState:&v81 objects:v97 count:16];
    }
    while (v56);
  }

  if (v49) {
    v49[2](v49, v51);
  }
}

uint64_t __74__PDFPageView_populateFormFieldsWithAutoFillSuggestion_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = v7;
  if (a3)
  {
    id v10 = v7;
    id v7 = (id)[v7 isAutofillNewContextStart];
    id v8 = v10;
    if (v7)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
      *a4 = 1;
    }
  }

  return MEMORY[0x270F9A758](v7, v8);
}

void __74__PDFPageView_populateFormFieldsWithAutoFillSuggestion_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 isTextWidget] && *(id *)(a1 + 32) == v5)
  {
    [*(id *)(a1 + 40) setStringValue:v6 onTextWidgetAnnotation:v5 withTextView:*(void *)(a1 + 48)];
  }
  else if ([v5 isTextWidget])
  {
    [*(id *)(a1 + 40) setStringValue:v6 onTextWidgetAnnotation:v5];
  }
  else if ([v5 isSynthesizedFormField])
  {
    [*(id *)(a1 + 40) setStringValue:v6 onTextAnnotation:v5];
  }
  [v5 setAutofillEntryType:3];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v10.receiver = self;
  v10.super_class = (Class)PDFPageView;
  -[PDFPageView setFrame:](&v10, sel_setFrame_, a3.origin.x, a3.origin.y);
  if (self->_private)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    double v6 = PDFPointMake(0.0, 0.0);
    double v8 = v7;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
    objc_msgSend(WeakRetained, "setFrame:", v6, v8, width, height);

    -[CALayer setFrame:](self->_private->backgroundLayer, "setFrame:", v6, v8, width, height);
    [MEMORY[0x263F158F8] commit];
    [(PDFPageView *)self setNeedsTilesUpdate];
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PDFPageView;
  -[PDFPageView setHidden:](&v6, sel_setHidden_);
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  [WeakRetained setHidden:v3];

  [MEMORY[0x263F158F8] commit];
}

- (void)_setupBookmarkLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  BOOL v3 = [WeakRetained view];
  if ([v3 displaysBookmarksForPages]
    && [WeakRetained isBookmarked])
  {
    [(PDFPageView *)self addBookmark];
  }
}

- (void)addBookmark
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  id v19 = [WeakRetained document];

  if (v19 && ([v19 allowsDocumentAssembly] & 1) == 0)
  {
    uint64_t v5 = [v19 permissionsStatus];
    objc_super v6 = @"user";
    if (v5 == 2) {
      objc_super v6 = @"owner";
    }
    NSLog(&cfstr_CannotAddBookm.isa, v6);
  }
  else
  {
    bookmarkLayer = self->_private->bookmarkLayer;
    if (bookmarkLayer)
    {
      [(CALayer *)bookmarkLayer setHidden:0];
      [(PDFPageView *)self updateBookmark];
    }
    else
    {
      double v7 = (void *)MEMORY[0x263F827E8];
      double v8 = PDFKitBundle();
      uint64_t v9 = [v7 imageNamed:@"ib_bookmark_on_page" inBundle:v8 compatibleWithTraitCollection:0];

      objc_super v10 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
      id v11 = self->_private;
      uint64_t v12 = v11->bookmarkLayer;
      v11->bookmarkLayer = v10;

      BOOL v13 = self->_private;
      v13->bookmarkSize.double width = PDFSizeMake(v14, 34.0, 44.0);
      v13->bookmarkSize.double height = v15;
      long long v16 = self->_private->bookmarkLayer;
      id v17 = v9;
      -[CALayer setContents:](v16, "setContents:", [v17 CGImage]);
      [(CALayer *)self->_private->bookmarkLayer setZPosition:-700.0];
      uint64_t v18 = [(PDFPageView *)self layer];
      [v18 addSublayer:self->_private->bookmarkLayer];

      [(PDFPageView *)self updateBookmark];
    }
  }
}

- (void)removeBookmark
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  id v11 = [WeakRetained document];

  id v4 = v11;
  if (v11 && (char v5 = [v11 allowsDocumentAssembly], v4 = v11, (v5 & 1) == 0))
  {
    uint64_t v9 = [v11 permissionsStatus];
    objc_super v10 = @"user";
    if (v9 == 2) {
      objc_super v10 = @"owner";
    }
    NSLog(&cfstr_CannotRemoveBo.isa, v10);
  }
  else
  {
    bookmarkLayer = self->_private->bookmarkLayer;
    if (!bookmarkLayer) {
      goto LABEL_9;
    }
    [(CALayer *)bookmarkLayer removeFromSuperlayer];
    double v7 = self->_private;
    double v8 = v7->bookmarkLayer;
    v7->bookmarkLayer = 0;
  }
  id v4 = v11;
LABEL_9:

  MEMORY[0x270F9A758](bookmarkLayer, v4);
}

- (void)updateBookmark
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  id v3 = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  id v4 = v3;
  if (self->_private->bookmarkLayer) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    [WeakRetained boundsForBox:1];
    double v7 = v6;
    double v8 = [WeakRetained view];
    [v8 frame];
    double v10 = v7 / v9;
    unint64_t v11 = (unint64_t)(COERCE__INT64(fabs(v7 / v9)) - 0x10000000000000) >> 53;
    if ((COERCE__INT64(v7 / v9) <= -1 || v11 >= 0x3FF)
      && (unint64_t)(COERCE__INT64(v7 / v9) - 1) >= 0xFFFFFFFFFFFFFLL)
    {
      [v8 frame];
      uint64_t v23 = PDFRectToString(v19, v20, v21, v22);
      NSLog(&cfstr_BookmarkBeingS.isa, v23);
    }
    else
    {
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
      -[CALayer setFrame:](self->_private->bookmarkLayer, "setFrame:", v7 - v10 * self->_private->bookmarkSize.width + v10 * -8.0, 0.0, v10 * self->_private->bookmarkSize.width, v10 * self->_private->bookmarkSize.height);
      id v14 = objc_loadWeakRetained((id *)&self->_private->geometryInterface);
      v15.n128_u64[0] = 0;
      v16.n128_u64[0] = 0;
      objc_msgSend(v14, "convertRectToRootView:fromPageLayer:", v4, PDFRectMake(v15, v16, self->_private->bookmarkSize.width, self->_private->bookmarkSize.height));
      double v18 = v17;

      [(CALayer *)self->_private->bookmarkLayer setContentsScale:fmin(v18 / self->_private->bookmarkSize.width, 4.0)];
      [MEMORY[0x263F158F8] commit];
    }
  }
}

- (void)_setuppageAnnotationEffects
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = self->_private->pageSignatures;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*(void *)(*((void *)&v20 + 1) + 8 * v7++) + 16) removeFromSuperlayer];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_private->pageSignatures removeAllObjects];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  [(PDFPageView *)self removeControlForAnnotation:WeakRetained];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v9 = self->_private->pageAnnotationEffects;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        [(PDFPageView *)self removePageLayerEffectForID:*(void *)(*((void *)&v16 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }

  [(NSMutableArray *)self->_private->pageAnnotationEffects removeAllObjects];
  id v14 = objc_loadWeakRetained((id *)&self->_private->page);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __42__PDFPageView__setuppageAnnotationEffects__block_invoke;
  v15[3] = &unk_264204510;
  v15[4] = self;
  [v14 fetchAnnotationsWithCompletion:v15 deliveredOnQueue:MEMORY[0x263EF83A0]];
  if (GetDefaultsWriteColorWidgetBackgrounds()) {
    [(PDFPageView *)self colorWidgetBackgrounds:1];
  }
}

void __42__PDFPageView__setuppageAnnotationEffects__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        double v9 = [v8 page];

        if (v9)
        {
          uint64_t v10 = [v8 valueForAnnotationKey:@"/Subtype"];
          if ([v10 isEqualToString:@"/Stamp"]
            && [v8 isSignature])
          {
            [*(id *)(a1 + 32) _addPDFAnnotationStampSignature:v8];
          }
          else
          {
            [*(id *)(a1 + 32) _addPDFAnnotation:v8];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_updateWidgetControl:(id)a3 forBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  -[PDFPageView convertRectToPageView:](self, "convertRectToPageView:", x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  [(PDFPageView *)self _rotationTransformForPageView];
  long long v18 = [v9 layer];
  long long v19 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v21 = *MEMORY[0x263F000D0];
  long long v22 = v19;
  long long v23 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v18 setAffineTransform:&v21];

  objc_msgSend(v9, "setFrame:", v11, v13, v15, v17);
  long long v20 = [v9 layer];

  long long v21 = v24;
  long long v22 = v25;
  long long v23 = v26;
  [v20 setAffineTransform:&v21];
}

- (CGRect)convertRectToPageView:(CGRect)a3
{
  double width = a3.size.width;
  double CenterPoint = PDFRectGetCenterPoint(a3.origin.x, a3.origin.y, a3.size.width);
  double v7 = v6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "layerEffectTransform", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  }
  else
  {
    float64x2_t v33 = 0u;
    float64x2_t v34 = 0u;
    float64x2_t v32 = 0u;
  }

  double v10 = PDFPointToCGPoint(CenterPoint, v7);
  float64x2_t v12 = vaddq_f64(v34, vmlaq_n_f64(vmulq_n_f64(v33, v11), v32, v10));
  double v13 = PDFPointFromCGPoint(v12.f64[0], v12.f64[1]);
  double v15 = PDFRectMakeFromCenter(v13, v14, width);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  id v22 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
  long long v23 = [(PDFPageView *)self page];
  objc_msgSend(v23, "boundsForBox:", objc_msgSend(v22, "displayBox"));
  PDFRectRotate([v23 rotation], v24, v25);
  double v27 = v26 - v21 - v17;

  double v28 = v15;
  double v29 = v27;
  double v30 = v19;
  double v31 = v21;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (CGAffineTransform)_rotationTransformForPageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  uint64_t v4 = [WeakRetained rotation];
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  double v5 = PDFDegToRad((double)v4);
  CGAffineTransformMakeRotation(retstr, v5);

  return result;
}

- (CGPoint)convertPointToPageView:(CGPoint)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  CGFloat v5 = PDFRectToCGRect([WeakRetained boundsForBox:0]);
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  id v12 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
  CGFloat v13 = PDFRectToCGRect(objc_msgSend(WeakRetained, "boundsForBox:", objc_msgSend(v12, "displayBox")));
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat rect = v16;
  CGFloat v19 = v18;

  v33.origin.double x = v13;
  v33.origin.double y = v15;
  v33.size.double width = v17;
  v33.size.double height = v19;
  double MinX = CGRectGetMinX(v33);
  v34.origin.double x = v5;
  v34.origin.double y = v7;
  v34.size.double width = v9;
  v34.size.double height = v11;
  double v21 = MinX - CGRectGetMinX(v34);
  v35.origin.double x = v5;
  v35.origin.double y = v7;
  v35.size.double width = v9;
  v35.size.double height = v11;
  double v22 = v21 + CGRectGetMinX(v35);
  v36.origin.double x = v13;
  v36.origin.double y = v15;
  v36.size.double width = rect;
  v36.size.double height = v19;
  double MinY = CGRectGetMinY(v36);
  v37.origin.double x = v5;
  v37.origin.double y = v7;
  v37.size.double width = v9;
  v37.size.double height = v11;
  double v24 = MinY - CGRectGetMinY(v37);
  v38.origin.double x = v5;
  v38.origin.double y = v7;
  v38.size.double width = v9;
  v38.size.double height = v11;
  double v25 = v24 + CGRectGetMinY(v38);
  [(PDFPageView *)self frame];
  double v27 = v25 + v26 - a3.y;

  double v28 = a3.x - v22;
  double v29 = v27;
  result.double y = v29;
  result.double x = v28;
  return result;
}

- (void)_addPDFAnnotationTextWidget:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [PDFKitTextView alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  CGFloat v7 = [WeakRetained view];
  double v10 = [(PDFKitTextView *)v5 initWithAnnotation:v4 pdfPageView:self pdfView:v7];

  [v4 bounds];
  -[PDFPageView _updateWidgetControl:forBounds:](self, "_updateWidgetControl:forBounds:", v10);
  objc_storeWeak((id *)&self->_private->activeAnnotation, v4);
  activeControls = self->_private->activeControls;
  CGFloat v9 = [v4 pdfAnnotationUUID];

  [(NSMutableDictionary *)activeControls setObject:v10 forKey:v9];
}

- (void)_addPDFAnnotationChoiceWidget:(id)a3
{
  v45[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [v4 choices];
  uint64_t v14 = [v4 widgetStringValue];
  int v15 = [v4 isListChoice];
  double v16 = [v4 font];
  [v16 pointSize];
  double v18 = v17;
  BOOL v19 = [(PDFPageView *)self _allowsFormFieldEntry];
  double v20 = [v4 pdfAnnotationUUID];
  if (v13 | v14)
  {
    if (!v13) {
      uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v14, 0);
    }
    v43 = v20;
    uint64_t v44 = v16;
    if (v15)
    {
      id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F82C78]), "initWithFrame:", v6, v8, v10, v12);
      -[PDFPageView _updateWidgetControl:forBounds:](self, "_updateWidgetControl:forBounds:", v21, v6, v8, v10, v12);
      [v21 setDataSource:self];
      [v21 setDelegate:self];
      [v21 setScrollEnabled:1];
      [v21 setUserInteractionEnabled:v19];
      [v21 setRowHeight:v18 + 2.0];
      objc_msgSend(v21, "setSeparatorInset:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
      double v22 = [v21 layer];
      [v22 setBorderWidth:1.0];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
      double v24 = [WeakRetained view];
      char v25 = [v24 isUsingPageViewController];

      if ((v25 & 1) == 0)
      {
        double v26 = [v21 panGestureRecognizer];
        id v42 = WeakRetained;
        double v27 = [WeakRetained view];
        double v28 = [v27 documentScrollView];
        double v29 = [v28 panGestureRecognizer];

        if (v26 && v29) {
          [v29 requireGestureRecognizerToFail:v26];
        }

        id WeakRetained = v42;
      }
      [(PDFPageView *)self addSubview:v21];
      double v30 = [v21 layer];
      [v30 setZPosition:-200.0];

      objc_storeWeak((id *)&self->_private->activeAnnotation, v4);
      double v20 = v43;
      [(NSMutableDictionary *)self->_private->activeControls setObject:v21 forKey:v43];
      [v21 reloadData];
      uint64_t v31 = [(id)v13 indexOfObject:v14];
      float64x2_t v32 = [MEMORY[0x263F088C8] indexPathForRow:v31 inSection:0];
      [v21 selectRowAtIndexPath:v32 animated:0 scrollPosition:0];
    }
    else
    {
      double v33 = v8 + -2.0;
      id WeakRetained = (id)objc_msgSend(objc_alloc(MEMORY[0x263F82CF0]), "initWithFrame:", v6, v33, v10, v12);
      -[PDFPageView _updateWidgetControl:forBounds:](self, "_updateWidgetControl:forBounds:", WeakRetained, v6, v33, v10, v12);
      [WeakRetained setFont:v16];
      CGRect v34 = [MEMORY[0x263F825C8] clearColor];
      [WeakRetained setTintColor:v34];

      [WeakRetained setText:v14];
      [WeakRetained setUserInteractionEnabled:v19];
      id v21 = objc_alloc_init(MEMORY[0x263F82A38]);
      [WeakRetained setInputView:v21];
      objc_storeWeak((id *)&self->_private->activeAnnotation, v4);
      [(NSMutableDictionary *)self->_private->activeControls setObject:WeakRetained forKey:v20];
      [v21 setDelegate:self];
      [v21 setDataSource:self];
      [(PDFPageView *)self addSubview:WeakRetained];
      CGRect v35 = [WeakRetained layer];
      [v35 setZPosition:-200.0];

      id v36 = objc_alloc_init(MEMORY[0x263F82D70]);
      [v36 sizeToFit];
      CGRect v37 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
      id v38 = objc_alloc(MEMORY[0x263F824A8]);
      NSUInteger v39 = PDFKitLocalizedString(@"Done");
      unint64_t v40 = (void *)[v38 initWithTitle:v39 style:2 target:self action:sel__choiceWidgetDone];

      v45[0] = v37;
      v45[1] = v40;
      uint64_t v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
      [v36 setItems:v41];

      [WeakRetained setInputAccessoryView:v36];
      [WeakRetained becomeFirstResponder];

      double v20 = v43;
    }

    [v4 setControl:v21];
    double v16 = v44;
  }
}

- (void)_choiceWidgetDone
{
  [(PDFPageView *)self endEditing:1];
  id v5 = [(PDFPageView *)self page];
  id v3 = [v5 view];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  [v3 removeControlForAnnotation:WeakRetained];
}

- (void)_addPDFAnnotationStampSignature:(id)a3
{
  id v5 = a3;
  [v5 bounds];
  -[PDFPageView convertRectToPageView:](self, "convertRectToPageView:");
  [(PDFPageView *)self _rotationTransformForPageView];
  CGColorSpaceRef v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F001D8]);
  if (v6)
  {
    double v7 = v6;
    [(PDFPageView *)self frame];
    double v9 = v8;
    [(PDFPageView *)self frame];
    double v11 = v10;
    CGColorSpaceGetNumberOfComponents(v7);
    uint64_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    [(PDFPageView *)self contentScaleFactor];
    CGFloat v14 = v13;
    int v15 = CGBitmapContextCreate(0, (unint64_t)(v13 * (double)(unint64_t)v9), (unint64_t)(v13 * (double)(unint64_t)v11), 8uLL, (unint64_t)(v13 * (double)(unint64_t)AlignedBytesPerRow), v7, 0x2002u);
    if (v15)
    {
      double v16 = v15;
      CGContextScaleCTM(v15, v14, v14);
      [v5 drawWithBox:0 inContext:v16];
      CGImageRef Image = CGBitmapContextCreateImage(v16);
      if (Image)
      {
        double v18 = Image;
        memset(&v31, 0, sizeof(v31));
        long long v19 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
        *(_OWORD *)&v30.a = *MEMORY[0x263F000D0];
        *(_OWORD *)&v30.c = v19;
        *(_OWORD *)&v30.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
        double v20 = CGAffineTransformScale(&v31, &v30, v14, v14);
        v35.origin.double x = PDFRectToCGRect(v20);
        CGAffineTransform v30 = v31;
        CGRect v36 = CGRectApplyAffineTransform(v35, &v30);
        PDFRectFromCGRect(v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
        v37.origin.double x = PDFRectToCGRect(v21);
        CGImageRef v22 = CGImageCreateWithImageInRect(v18, v37);
        if (v22)
        {
          long long v23 = v22;
          double v24 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
          [(CALayer *)v24 setFrame:PDFRectToCGRect(v24)];
          [(CALayer *)v24 setContents:v23];
          [(CALayer *)v24 setZPosition:-200.0];
          v29[0] = v32;
          v29[1] = v33;
          v29[2] = v34;
          [(CALayer *)v24 setAffineTransform:v29];
          char v25 = [(PDFPageView *)self layer];
          [v25 addSublayer:v24];

          double v26 = objc_alloc_init(PageSignature);
          objc_storeStrong((id *)&v26->annotation, a3);
          signatureLayer = v26->signatureLayer;
          v26->signatureLayer = v24;
          double v28 = v24;

          [(NSMutableArray *)self->_private->pageSignatures addObject:v26];
          CGImageRelease(v18);
          CGImageRelease(v23);
        }
        else
        {
          CGImageRelease(v18);
        }
      }
      CGContextRelease(v16);
    }
    CGColorSpaceRelease(v7);
  }
}

- (void)_addPDFAnnotation:(id)a3
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  if (WeakRetained)
  {
    id v5 = [v10 akAnnotationAdaptor];
    CGColorSpaceRef v6 = [v5 akAnnotation];

    if (!v6)
    {
      if ([v10 isMarkupAnnotationSubtype] && (objc_msgSend(v10, "isRedaction") & 1) == 0)
      {
        double v9 = +[PDFPageLayerEffect createPDFMarkupLayerEffectsForAnnotation:v10 withLayer:WeakRetained];
      }
      else
      {
        double v7 = [v10 valueForAnnotationKey:@"/Subtype"];
        char v8 = [v7 isEqualToString:@"/Popup"];

        if (v8) {
          goto LABEL_9;
        }
        double v9 = +[PDFPageLayerEffect createPDFAnnotationLayerEffectForAnnotation:v10 withLayer:WeakRetained];
      }
    }
  }
LABEL_9:
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  id v5 = [WeakRetained valueForAnnotationKey:@"/FT"];
  CGColorSpaceRef v6 = v5;
  if (WeakRetained && [v5 isEqualToString:@"/Ch"])
  {
    double v7 = [WeakRetained choices];
    int64_t v8 = [v7 count];
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"MyCell"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  double v9 = WeakRetained;
  if (v7)
  {
    if (!WeakRetained) {
      goto LABEL_8;
    }
  }
  else
  {
    double v7 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"MyCell"];
    if (!v9) {
      goto LABEL_8;
    }
  }
  id v10 = [v9 choices];
  double v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v6, "row"));

  double v12 = [v9 font];
  double v13 = [v7 textLabel];
  [v13 setText:v11];

  if (v12)
  {
    CGFloat v14 = [v7 textLabel];
    [v14 setFont:v12];
  }
LABEL_8:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  double v7 = self->_private;
  if (!v7->isPerformingUndo)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v7->activeAnnotation);
    double v9 = [WeakRetained valueForAnnotationKey:@"/FT"];
    id v10 = v9;
    if (WeakRetained && [v9 isEqualToString:@"/Ch"])
    {
      double v11 = [WeakRetained choices];
      double v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v6, "row"));
      [(PDFPageView *)self setStringValue:v12 onChoiceWidgetAnnotation:WeakRetained withTableView:v13];
    }
  }
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  activeControls = self->_private->activeControls;
  int64_t v8 = [WeakRetained pdfAnnotationUUID];
  double v9 = [(NSMutableDictionary *)activeControls objectForKey:v8];

  if (WeakRetained)
  {
    id v10 = [WeakRetained choices];
    double v11 = [v10 objectAtIndex:a4];

    [WeakRetained setWidgetStringValue:v11];
    if (v9) {
      [(PDFPageView *)self setStringValue:v11 onChoiceWidgetAnnotation:WeakRetained withTextField:v9];
    }
  }
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = v10;
  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v11 setAdjustsFontSizeToFitWidth:1];
    [v11 setTextAlignment:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  id v13 = WeakRetained;
  if (WeakRetained)
  {
    CGFloat v14 = [WeakRetained choices];
    int v15 = [v14 objectAtIndex:a4];
  }
  else
  {
    int v15 = &stru_26C516768;
  }
  [v11 setText:v15];

  return v11;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained choices];
    int64_t v7 = [v6 count];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (void)_formChanged:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"PDFFormFieldName"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  int64_t v7 = [WeakRetained document];
  double v17 = (void *)v5;
  int64_t v8 = [v7 annotationsForFieldName:v5];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        CGFloat v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v15 = [v14 valueForAnnotationKey:@"/FT"];
        if ([v15 isEqualToString:@"/Ch"]) {
          [v14 removeValueForAnnotationKey:@"/AP"];
        }
        double v16 = [v14 pdfAnnotationUUID];
        [(PDFPageView *)self updatePageLayerEffectForID:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (BOOL)_allowsFormFieldEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  id v3 = [WeakRetained document];

  if (v3) {
    char v4 = [v3 allowsFormFieldEntry];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)shouldRegisterUndo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  id v3 = [WeakRetained view];
  char v4 = [v3 allowsUndo];

  return v4;
}

- (void)setStringValue:(id)a3 onTextWidgetAnnotation:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (v19)
  {
    int64_t v7 = [v6 valueForAnnotationKey:@"/FT"];
    int64_t v8 = v7;
    if (v6 && [v7 isEqualToString:@"/Tx"])
    {
      uint64_t v9 = [v6 widgetStringValue];
      if (v9) {
        uint64_t v10 = (__CFString *)v9;
      }
      else {
        uint64_t v10 = &stru_26C516768;
      }
      [v6 setWidgetStringValue:v19];
      if ([(PDFPageView *)self shouldRegisterUndo])
      {
        uint64_t v11 = NSString;
        uint64_t v12 = PDFKitLocalizedString(@"Change of %@");
        id v13 = [v6 displayName];
        CGFloat v14 = objc_msgSend(v11, "stringWithFormat:", v12, v13);

        int v15 = [(PDFPageView *)self undoManager];
        double v16 = [v15 prepareWithInvocationTarget:self];
        [v16 setStringValue:v10 onTextWidgetAnnotation:v6];

        double v17 = [(PDFPageView *)self undoManager];
        long long v18 = PDFKitLocalizedString(v14);
        [v17 setActionName:v18];
      }
    }
  }
}

- (void)setStringValue:(id)a3 onTextAnnotation:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  if (v27)
  {
    if (v6)
    {
      int64_t v7 = [v6 valueForAnnotationKey:@"/Subtype"];
      int v8 = [v7 isEqualToString:@"/FreeText"];

      if (v8)
      {
        uint64_t v9 = [v6 widgetStringValue];
        if (v9) {
          uint64_t v10 = (__CFString *)v9;
        }
        else {
          uint64_t v10 = &stru_26C516768;
        }
        [v6 setValue:v27 forAnnotationKey:@"/Contents"];
        uint64_t v11 = [v6 akAnnotation];

        if (v11)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
          id v13 = [WeakRetained document];

          CGFloat v14 = [v13 akController];
          if (objc_opt_respondsToSelector())
          {
            int v15 = [v14 textEditorController];
            double v16 = [v15 annotation];
            double v17 = [v6 akAnnotation];

            if (v16 == v17)
            {
              long long v18 = [v15 textView];
              [v18 setText:v27];

              [v15 updateForTextAttributeChange];
            }
          }
        }
        if ([(PDFPageView *)self shouldRegisterUndo])
        {
          id v19 = NSString;
          long long v20 = PDFKitLocalizedString(@"Change of %@");
          long long v21 = [v6 displayName];
          CGImageRef v22 = objc_msgSend(v19, "stringWithFormat:", v20, v21);

          uint64_t v23 = [(PDFPageView *)self undoManager];
          double v24 = [v23 prepareWithInvocationTarget:self];
          [v24 setStringValue:v10 onTextAnnotation:v6];

          char v25 = [(PDFPageView *)self undoManager];
          double v26 = PDFKitLocalizedString(v22);
          [v25 setActionName:v26];
        }
      }
    }
  }
}

- (void)_setAttributedStringForAnnotation:(id)a3 stringValue:(id)a4 textView:(id)a5
{
  v30[1] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v9 font];
  uint64_t v11 = [v9 valueForAnnotationKey:@"/MaxLen"];

  uint64_t v12 = [v11 integerValue];
  if (!v10)
  {
    id v13 = (void *)MEMORY[0x263F82760];
    [v7 frame];
    uint64_t v10 = [v13 systemFontOfSize:v14 + -2.0];
  }
  double v15 = (double)v12;
  uint64_t v29 = *MEMORY[0x263F82270];
  uint64_t v16 = v29;
  v30[0] = v10;
  double v17 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
  [v8 sizeWithAttributes:v17];
  double v19 = v18;

  double v20 = (double)(unint64_t)[v8 length];
  [v7 frame];
  double v22 = (v21 + -v19 / v20 * v15) / v15;
  uint64_t v23 = [v8 length];
  double v24 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v8];

  uint64_t v25 = *MEMORY[0x263F82288];
  double v26 = [NSNumber numberWithDouble:v22];
  objc_msgSend(v24, "addAttribute:value:range:", v25, v26, 0, v23);

  objc_msgSend(v24, "addAttribute:value:range:", v16, v10, 0, v23);
  id v27 = [MEMORY[0x263F82370] defaultParagraphStyle];
  double v28 = (void *)[v27 mutableCopy];

  [v28 setLineBreakMode:2];
  objc_msgSend(v24, "addAttribute:value:range:", *MEMORY[0x263F822A8], v28, 0, v23);
  [v7 setAttributedText:v24];
}

- (BOOL)_shouldReplaceStringOnAnnotation:(id)a3 withTextView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 text];
  id v9 = [v6 replaceTextWidgetWithString:v8];
  char v10 = [v8 isEqualToString:v9];
  if ((v10 & 1) == 0) {
    [(PDFPageView *)self _setAttributedStringForAnnotation:v6 stringValue:v9 textView:v7];
  }

  return v10;
}

- (void)setStringValue:(id)a3 onTextWidgetAnnotation:(id)a4 withTextView:(id)a5
{
  id v21 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v21)
  {
    if (v8)
    {
      char v10 = [v8 valueForAnnotationKey:@"/FT"];
      int v11 = [v10 isEqualToString:@"/Tx"];

      if (v11)
      {
        if ([(PDFPageView *)self _shouldReplaceStringOnAnnotation:v8 withTextView:v9])
        {
          uint64_t v12 = [v8 widgetStringValue];
          [v8 setWidgetStringValue:v21];
          if ([v8 shouldComb]) {
            [(PDFPageView *)self _setAttributedStringForAnnotation:v8 stringValue:v21 textView:v9];
          }
          else {
            [v9 setText:v21];
          }
          [v9 setNeedsDisplay];
          if (!v12) {
            uint64_t v12 = &stru_26C516768;
          }
          if ([(PDFPageView *)self shouldRegisterUndo])
          {
            id v13 = NSString;
            double v14 = PDFKitLocalizedString(@"Change of %@");
            double v15 = [v8 displayName];
            uint64_t v16 = objc_msgSend(v13, "stringWithFormat:", v14, v15);

            double v17 = [(PDFPageView *)self undoManager];
            double v18 = [v17 prepareWithInvocationTarget:self];
            [v18 setStringValue:v12 onTextWidgetAnnotation:v8 withTextView:v9];

            double v19 = [(PDFPageView *)self undoManager];
            double v20 = PDFKitLocalizedString(v16);
            [v19 setActionName:v20];
          }
        }
      }
    }
  }
}

- (void)setStringValue:(id)a3 onChoiceWidgetAnnotation:(id)a4 withTextField:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = [v8 valueForAnnotationKey:@"/FT"];
  if (v20 && v8 && [v10 isEqualToString:@"/Ch"])
  {
    int v11 = [v8 widgetStringValue];
    [v8 setWidgetStringValue:v20];
    [v9 setText:v20];
    [v9 setNeedsDisplay];
    if (!v11) {
      int v11 = &stru_26C516768;
    }
    if ([(PDFPageView *)self shouldRegisterUndo])
    {
      uint64_t v12 = NSString;
      id v13 = PDFKitLocalizedString(@"Change of %@");
      double v14 = [v8 displayName];
      double v15 = objc_msgSend(v12, "stringWithFormat:", v13, v14);

      uint64_t v16 = [(PDFPageView *)self undoManager];
      double v17 = [v16 prepareWithInvocationTarget:self];
      [v17 setStringValue:v11 onChoiceWidgetAnnotation:v8 withTextField:v9];

      double v18 = [(PDFPageView *)self undoManager];
      double v19 = PDFKitLocalizedString(v15);
      [v18 setActionName:v19];
    }
  }
}

- (void)setStringValue:(id)a3 onChoiceWidgetAnnotation:(id)a4 withTableView:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  self->_private->isPerformingUndo = 1;
  char v10 = [v8 valueForAnnotationKey:@"/FT"];
  if (v24)
  {
    if (v8 && [v10 isEqualToString:@"/Ch"])
    {
      int v11 = [v8 widgetStringValue];
      [v8 setWidgetStringValue:v24];
      uint64_t v12 = [v8 choices];
      uint64_t v13 = [v12 indexOfObject:v24];
      double v14 = [MEMORY[0x263F088C8] indexPathForRow:v13 inSection:0];
      [v9 selectRowAtIndexPath:v14 animated:1 scrollPosition:0];
      [(PDFPageView *)self tableView:v9 didSelectRowAtIndexPath:v14];
      if (!v11) {
        int v11 = &stru_26C516768;
      }
      if ([(PDFPageView *)self shouldRegisterUndo])
      {
        uint64_t v23 = v12;
        double v15 = NSString;
        uint64_t v16 = PDFKitLocalizedString(@"Change of %@");
        double v17 = [v8 displayName];
        double v18 = objc_msgSend(v15, "stringWithFormat:", v16, v17);

        double v19 = [(PDFPageView *)self undoManager];
        id v20 = [v19 prepareWithInvocationTarget:self];
        [v20 setStringValue:v11 onChoiceWidgetAnnotation:v8 withTableView:v9];

        id v21 = [(PDFPageView *)self undoManager];
        double v22 = PDFKitLocalizedString(v18);
        [v21 setActionName:v22];

        uint64_t v12 = v23;
      }
    }
    self->_private->isPerformingUndo = 0;
  }
}

- (void)setState:(int64_t)a3 onButtonWidgetAnnotation:(id)a4
{
  id v16 = a4;
  id v6 = [v16 valueForAnnotationKey:@"/FT"];
  if (v16)
  {
    if ([v6 isEqualToString:@"/Btn"])
    {
      uint64_t v7 = [v16 buttonWidgetState];
      [v16 setButtonWidgetState:a3];
      if ([(PDFPageView *)self shouldRegisterUndo])
      {
        id v8 = NSString;
        id v9 = PDFKitLocalizedString(@"Change of %@");
        char v10 = [v16 displayName];
        int v11 = objc_msgSend(v8, "stringWithFormat:", v9, v10);

        uint64_t v12 = [(PDFPageView *)self undoManager];
        uint64_t v13 = [v12 prepareWithInvocationTarget:self];
        [v13 setState:v7 onButtonWidgetAnnotation:v16];

        double v14 = [(PDFPageView *)self undoManager];
        double v15 = PDFKitLocalizedString(v11);
        [v14 setActionName:v15];
      }
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PDFPageView;
  id v8 = -[PDFPageView hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  char v10 = [WeakRetained view];

  if ([v10 isInMarkupMode] & 1) != 0 || (objc_msgSend(v10, "isFormDetectionEnabled"))
  {
    uint64_t v11 = objc_msgSend(v10, "hitTestForSubviewsOfView:atLocation:withEvent:", self, v7, x, y);
    uint64_t v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = (void *)v11;
    }
    else {
      uint64_t v13 = v8;
    }
    id v14 = v13;
  }
  else
  {
    id v14 = v8;
  }

  return v14;
}

- (BOOL)isOverlayViewInstalled
{
  return self->_overlayViewInstalled;
}

- (void)setOverlayViewInstalled:(BOOL)a3
{
  self->_overlayViewInstalled = a3;
}

- (void).cxx_destruct
{
}

@end