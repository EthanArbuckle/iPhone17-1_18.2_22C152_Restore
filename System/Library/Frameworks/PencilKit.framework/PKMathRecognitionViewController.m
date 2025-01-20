@interface PKMathRecognitionViewController
- (BOOL)handleSingleTapAtDrawingLocation:(CGPoint)a3;
- (BOOL)handleSingleTapAtDrawingLocation:(CGPoint)a3 fromTapStroke:(BOOL)a4;
- (BOOL)shouldCacheDrawingForResults;
- (CGAffineTransform)contextMenuControllerDrawingTransform:(SEL)a3;
- (CGAffineTransform)overlayControllerDrawingTransform:(SEL)a3;
- (PKMathRecognitionViewController)initWithController:(id)a3 view:(id)a4 delegate:(id)a5;
- (UIViewController)viewControllerForPresentingUI;
- (double)canvasWidth;
- (double)mathRecognitionControllerTimestampForLatestUserInteraction:(id)a3;
- (id)adjustedSelectedStrokes:(id)a3 selectionPath:(id)a4;
- (id)contextMenuController:(id)a3 imageForItemUUID:(id)a4;
- (id)contextMenuController:(id)a3 resultAttributionForItemUUID:(id)a4;
- (id)contextMenuController:(id)a3 resultDrawingForItemUUID:(id)a4;
- (id)contextMenuController:(id)a3 resultForItemUUID:(id)a4;
- (id)drawing;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)hitTest:(CGPoint)a3;
- (id)overlayDrawingController;
- (id)overlayViews;
- (id)recognitionManager;
- (id)resultViewForItemUUID:(id)a3;
- (id)tiledView;
- (id)view;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)solvingStyle;
- (uint64_t)_handleSingleTapAtDrawingLocation:(int)a3 fromHover:(CGFloat)a4 fromTapStroke:(CGFloat)a5;
- (uint64_t)cancelOpenPopoverForAddingGraph;
- (uint64_t)cancelOpenPopoverForHint;
- (void)_cleanupAfterScrubbing;
- (void)_cleanupTypesetViewController;
- (void)_commitSetShouldSolve:(uint64_t)a3 undoable:(void *)a4 item:;
- (void)_emitMathUsageForItem:(uint64_t)a3 usage:(uint64_t)a4 recognitionLatency:(uint64_t)a5 synthesisLatency:(uint64_t)a6 hadOldResult:;
- (void)_imageViewForStrokes:(void *)a3 drawing:(void *)a4 completion:;
- (void)_presentResult:(void *)a3 mathItem:(void *)a4 defaultAnimationType:(int)a5 fromHint:(char)a6 hadOldResult:;
- (void)_scrubVariable:(void *)a3 item:(uint64_t)a4 openAsCompact:;
- (void)_sendUpdatedResult:(void *)a3 strokes:(void *)a4 uuid:;
- (void)_showDetectionAnimationForItem:(void *)a1;
- (void)_triggerAlternativesMenuForToken:(uint64_t)a1;
- (void)_triggerPopupToAddGraphForItem:(uint64_t)a1;
- (void)_triggerPopupToSolveItem:(char)a3 supportCopy:;
- (void)_updateDrawingOverlayCache;
- (void)contextMenuController:(id)a3 addGraphForItemUUID:(id)a4 addToExisting:(BOOL)a5 graphableVariable:(id)a6;
- (void)contextMenuController:(id)a3 dismissErrorForItem:(id)a4 token:(id)a5;
- (void)contextMenuController:(id)a3 removeResultForItemUUID:(id)a4;
- (void)contextMenuController:(id)a3 solveItemUUID:(id)a4;
- (void)contextMenuControllerDidFinish:(id)a3;
- (void)dealloc;
- (void)didBeginDrawing;
- (void)didEraseStrokes:(id)a3;
- (void)dismissPopovers;
- (void)drawingTransform;
- (void)drawingTransformFromDelegate;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)eraserMovedToLocation:(CGPoint)a3;
- (void)hideMathFloatingLabelView;
- (void)hideScrubber;
- (void)hoverController:(id)a3 holdGestureMeanInputPoint:(id *)a4 latestInputPoint:(id *)a5;
- (void)layoutSubviews;
- (void)mathRecognitionController:(id)a3 didEraseStrokesInExpressions:(id)a4;
- (void)mathRecognitionController:(id)a3 didUpdateExpressions:(id)a4 newItems:(id)a5 removedItems:(id)a6 mathItems:(id)a7;
- (void)mathRecognitionController:(id)a3 solveStateChangedForExpressions:(id)a4 mathItems:(id)a5;
- (void)mathResult:(id)a3 itemUUID:(id)a4;
- (void)mathResultAttributionImage:(id)a3 darkModeImage:(id)a4 string:(id)a5 date:(id)a6 itemUUID:(id)a7;
- (void)openPopoverForAddingGraph;
- (void)openPopoverForHint;
- (void)overlayController:(id)a3 imageViewForStrokes:(id)a4 completion:(id)a5;
- (void)overlayController:(id)a3 willUpdateView:(id)a4 animationDuration:(double)a5;
- (void)redrawSubviews;
- (void)regenerateResultsIfNecessary;
- (void)registerRecentlyCreatedLocalStroke:(id)a3;
- (void)removedFromView;
- (void)scrubberController:(id)a3 valueDidChange:(id)a4;
- (void)setCanvasWidth:(double)a3;
- (void)setContextMenuController:(uint64_t)a1;
- (void)setShouldCacheDrawingForResults:(BOOL)a3;
- (void)setSolvingStyle:(int64_t)a3;
- (void)setTokens:(id)a3 forItem:(id)a4;
- (void)setTokens:(id)a3 forItemUUID:(id)a4 graphable:(BOOL)a5;
- (void)setTokens:(id)a3 forItemUUID:(id)a4 graphable:(BOOL)a5 graphableVariables:(id)a6;
- (void)setTokens:(void *)a3 forItem:(int)a4 graphable:(void *)a5 graphableVariables:;
- (void)setViewControllerForPresentingUI:(id)a3;
@end

@implementation PKMathRecognitionViewController

- (PKMathRecognitionViewController)initWithController:(id)a3 view:(id)a4 delegate:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v62.receiver = self;
  v62.super_class = (Class)PKMathRecognitionViewController;
  v12 = [(PKMathRecognitionViewController *)&v62 init];
  if (v12)
  {
    v13 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v64 = v9;
      _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "Creating PKMathRecognitionViewController for: %p", buf, 0xCu);
    }

    v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v12[105] = [v14 BOOLForKey:@"internalSettings.drawing.disableMathAlternatives"];

    v15 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v12[106] = [v15 BOOLForKey:@"internalSettings.drawing.disableMathErrors"];

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    v17 = (void *)*((void *)v12 + 2);
    *((void *)v12 + 2) = v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    v19 = (void *)*((void *)v12 + 4);
    *((void *)v12 + 4) = v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    v21 = (void *)*((void *)v12 + 3);
    *((void *)v12 + 3) = v20;

    [v10 bounds];
    *((void *)v12 + 18) = v22;
    *((void *)v12 + 19) = v23;
    *((void *)v12 + 20) = v24;
    *((void *)v12 + 21) = v25;
    uint64_t v26 = [MEMORY[0x1E4F1CA80] set];
    v27 = (void *)*((void *)v12 + 22);
    *((void *)v12 + 22) = v26;

    uint64_t v28 = [MEMORY[0x1E4F1CA80] set];
    v29 = (void *)*((void *)v12 + 23);
    *((void *)v12 + 23) = v28;

    [v12 setSolvingStyle:0];
    [v12 setShouldCacheDrawingForResults:1];
    objc_storeWeak((id *)v12 + 30, v11);
    objc_storeWeak((id *)v12 + 31, v10);
    objc_storeStrong((id *)v12 + 32, a3);
    uint64_t v30 = [v10 effectiveUserInterfaceLayoutDirection];
    if (v9) {
      v9[88] = v30 == 1;
    }
    [*((id *)v12 + 32) setDelegate:v12];
    v31 = (unsigned int *)(v12 + 192);
    if (objc_opt_respondsToSelector()) {
      int v32 = 8;
    }
    else {
      int v32 = 0;
    }
    unsigned int *v31 = *((_DWORD *)v12 + 48) & 0xFFFFFFF7 | v32;
    unsigned int *v31 = *v31 & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      int v33 = 16;
    }
    else {
      int v33 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFFFFFEF | v33;
    if (objc_opt_respondsToSelector()) {
      int v34 = 2;
    }
    else {
      int v34 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFFFFFFD | v34;
    if (objc_opt_respondsToSelector()) {
      int v35 = 4;
    }
    else {
      int v35 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFFFFFFB | v35;
    if (objc_opt_respondsToSelector()) {
      int v36 = 32;
    }
    else {
      int v36 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFFFFFDF | v36;
    if (objc_opt_respondsToSelector()) {
      int v37 = 64;
    }
    else {
      int v37 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFFFFFBF | v37;
    if (objc_opt_respondsToSelector()) {
      int v38 = 128;
    }
    else {
      int v38 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFFFFF7F | v38;
    if (objc_opt_respondsToSelector()) {
      int v39 = 256;
    }
    else {
      int v39 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFFFFEFF | v39;
    if (objc_opt_respondsToSelector()) {
      int v40 = 512;
    }
    else {
      int v40 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFFFFDFF | v40;
    if (objc_opt_respondsToSelector()) {
      int v41 = 1024;
    }
    else {
      int v41 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFFFFBFF | v41;
    if (objc_opt_respondsToSelector()) {
      int v42 = 2048;
    }
    else {
      int v42 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFFFF7FF | v42;
    if (objc_opt_respondsToSelector()) {
      int v43 = 4096;
    }
    else {
      int v43 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFFFEFFF | v43;
    if (objc_opt_respondsToSelector()) {
      int v44 = 0x2000;
    }
    else {
      int v44 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFFFDFFF | v44;
    char v45 = objc_opt_respondsToSelector();
    unsigned int v46 = *v31;
    if (v45) {
      int v47 = 0x4000;
    }
    else {
      int v47 = 0;
    }
    unsigned int v48 = v46 & 0xFFFF3FFF | v47;
    int v49 = (4 * v46) & 0x8000;
    if (v45) {
      int v49 = 0x8000;
    }
    unsigned int *v31 = v48 | v49;
    if (objc_opt_respondsToSelector()) {
      int v50 = 0x10000;
    }
    else {
      int v50 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFFEFFFF | v50;
    if (objc_opt_respondsToSelector()) {
      int v51 = 0x20000;
    }
    else {
      int v51 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFFDFFFF | v51;
    if (objc_opt_respondsToSelector()) {
      int v52 = 0x40000;
    }
    else {
      int v52 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFFBFFFF | v52;
    if (objc_opt_respondsToSelector()) {
      int v53 = 0x80000;
    }
    else {
      int v53 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFF7FFFF | v53;
    if (objc_opt_respondsToSelector()) {
      int v54 = 0x100000;
    }
    else {
      int v54 = 0;
    }
    unsigned int *v31 = *v31 & 0xFFEFFFFF | v54;
    objc_initWeak((id *)buf, v12);
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __68__PKMathRecognitionViewController_initWithController_view_delegate___block_invoke;
    v60[3] = &unk_1E64C6CE0;
    objc_copyWeak(&v61, (id *)buf);
    +[PKHoverSettings checkIfHoverIsSupported:v60];
    v55 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __68__PKMathRecognitionViewController_initWithController_view_delegate___block_invoke_2;
    v58[3] = &unk_1E64C7008;
    objc_copyWeak(&v59, (id *)buf);
    id v56 = (id)[v10 registerForTraitChanges:v55 withHandler:v58];

    objc_destroyWeak(&v59);
    objc_destroyWeak(&v61);
    objc_destroyWeak((id *)buf);
  }

  return (PKMathRecognitionViewController *)v12;
}

void __68__PKMathRecognitionViewController_initWithController_view_delegate___block_invoke(uint64_t a1, int a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 && WeakRetained)
  {
    v8 = WeakRetained;
    v4 = -[PKMathRecognitionViewController tiledView](WeakRetained);
    v5 = -[PKHoverController initWithDelegate:view:]((int64x2_t *)[PKHoverController alloc], v8, v4);
    id v6 = v8[25];
    v8[25] = v5;

    v7 = v8[25];
    if (v7) {
      v7[427] = 1;
    }

    WeakRetained = v8;
  }
}

- (id)tiledView
{
  id v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 30);
    id v1 = [WeakRetained mathViewControllerTiledView:v1];
  }

  return v1;
}

void __68__PKMathRecognitionViewController_initWithController_view_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained[35];
    if (v2)
    {
      v3 = WeakRetained;
      [*(id *)(v2 + 16) dismissMenu];
      id WeakRetained = v3;
    }
  }
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(PKMathRecognitionViewController *)self removedFromView];
  v3 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      controller = self->_controller;
    }
    else {
      controller = 0;
    }
    *(_DWORD *)buf = 134217984;
    v7 = controller;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Tearing down PKMathRecognitionViewController for: %p", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)PKMathRecognitionViewController;
  [(PKMathRecognitionViewController *)&v5 dealloc];
}

- (id)view
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 31);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (id)overlayDrawingController
{
  if (a1)
  {
    uint64_t v2 = a1;
    if (a1[33] || [a1 solvingStyle] == 2)
    {
      uint64_t v3 = [v2 solvingStyle];
      id v4 = v2[33];
      if (v3 != 2 || !v4) {
        goto LABEL_9;
      }
      -[PKOverlayDrawingController removedFromView]((uint64_t)v4);
      id WeakRetained = v2[33];
      v2[33] = 0;
    }
    else
    {
      id v6 = [PKOverlayDrawingController alloc];
      id WeakRetained = objc_loadWeakRetained(v2 + 31);
      v7 = -[PKOverlayDrawingController initForView:delegate:]((id *)&v6->super.isa, WeakRetained, v2);
      id v8 = v2[33];
      v2[33] = v7;
    }
    id v4 = v2[33];
LABEL_9:
    a1 = (id *)v4;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSolvingStyle:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self->_solvingStyle = a3;
  if ([(PKMathRecognitionViewController *)self solvingStyle] != 2 && !self->_overlayDrawingController)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [(NSMutableDictionary *)self->_currentMathItemsLookup allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          currentResultsLookup = self->_currentResultsLookup;
          id v11 = [v9 uuid];
          v12 = [(NSMutableDictionary *)currentResultsLookup objectForKeyedSubscript:v11];

          if (v12 && [v9 shouldSolveMathFlagIsSet]) {
            -[PKMathRecognitionViewController _presentResult:mathItem:defaultAnimationType:fromHint:hadOldResult:]((uint64_t)self, v12, v9, (void *)2, 0, 1);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  if ([(PKMathRecognitionViewController *)self solvingStyle])
  {
    if ([(PKMathRecognitionViewController *)self solvingStyle] != 1) {
      -[PKOverlayDrawingController removeAllTokens]((uint64_t)self->_overlayDrawingController);
    }
  }
}

- (void)_presentResult:(void *)a3 mathItem:(void *)a4 defaultAnimationType:(int)a5 fromHint:(char)a6 hadOldResult:
{
  HIDWORD(v48) = a5;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id newValue = a2;
  id v56 = a3;
  if (a1)
  {
    id v8 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v56 expression];
      *(_DWORD *)buf = 138478083;
      v74 = v9;
      __int16 v75 = 2113;
      id v76 = newValue;
      _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Presenting result for expression: %{private}@, result: %{private}@", buf, 0x16u);
    }
    int v54 = -[PKMathRecognitionViewController tiledView]((id *)a1);
    int v53 = [v56 uuid];
    id v10 = -[PKMathRecognitionViewController overlayDrawingController]((id *)a1);
    [v56 bounds];
    -[PKOverlayDrawingController viewForUUID:estimatedFrameForNewView:]((uint64_t)v10, v53, v11, v12, v13, v14);
    long long v15 = (double *)objc_claimAutoreleasedReturnValue();

    if (v15) {
      long long v16 = (void *)*((void *)v15 + 53);
    }
    else {
      long long v16 = 0;
    }
    id v17 = v16;
    if ([v17 isEqual:newValue])
    {
      if (v15)
      {
        CGFloat v19 = v15[54];
        CGFloat v18 = v15[55];
        CGFloat v20 = v15[56];
        CGFloat v21 = v15[57];
      }
      else
      {
        CGFloat v18 = 0.0;
        CGFloat v20 = 0.0;
        CGFloat v21 = 0.0;
        CGFloat v19 = 0.0;
      }
      [v56 boundsForTriggerStrokes];
      v79.origin.x = v22;
      v79.origin.y = v23;
      v79.size.width = v24;
      v79.size.height = v25;
      v78.origin.x = v19;
      v78.origin.y = v18;
      v78.size.width = v20;
      v78.size.height = v21;
      BOOL v26 = CGRectEqualToRect(v78, v79);

      if (v26)
      {
        uint64_t v28 = os_log_create("com.apple.pencilkit", "Math");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = [v56 expression];
          *(_DWORD *)buf = 138478083;
          v74 = v29;
          __int16 v75 = 2113;
          id v76 = newValue;
          _os_log_impl(&dword_1C44F8000, v28, OS_LOG_TYPE_DEFAULT, "Already had correct result for expression: %{private}@, result: %{private}@", buf, 0x16u);
        }
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
    }
    [(PKOverlayDrawingView *)(uint64_t)v15 hideImageViewWithDuration:0.1];
    if (v15)
    {
      objc_setProperty_nonatomic_copy(v15, v30, newValue, 424);
      [v56 boundsForTriggerStrokes];
      *((void *)v15 + 54) = v31;
      *((void *)v15 + 55) = v32;
      *((void *)v15 + 56) = v33;
      *((void *)v15 + 57) = v34;
    }
    else
    {
      [v56 boundsForTriggerStrokes];
    }
    LODWORD(v48) = *(void *)(a1 + 88) != 0;
    objc_initWeak((id *)buf, (id)a1);
    [v54 inputScale];
    double v36 = v35;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke;
    aBlock[3] = &unk_1E64C9DC0;
    id v37 = newValue;
    id v72 = v37;
    int v38 = _Block_copy(aBlock);
    if ((*(unsigned char *)(a1 + 194) & 0x10) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 240));
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_2;
      v67[3] = &unk_1E64C9DE8;
      id v68 = WeakRetained;
      uint64_t v69 = a1;
      id v70 = v53;
      id v40 = WeakRetained;
      int v41 = _Block_copy(v67);

      int v38 = v41;
    }
    objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", v48);
    int v43 = v42;
    int v44 = -[PKMathRecognitionViewController recognitionManager](*(id **)(a1 + 256));
    char v45 = -[PKMathRecognitionViewController drawing]((id *)a1);
    id v46 = objc_loadWeakRetained((id *)(a1 + 248));
    int v47 = [v46 tintColor];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_3;
    v57[3] = &unk_1E64C9EB0;
    objc_copyWeak(v63, (id *)buf);
    id v58 = v56;
    id v59 = v37;
    uint64_t v60 = a1;
    char v64 = v49;
    char v65 = v50;
    id v61 = v54;
    objc_super v62 = v15;
    v63[1] = a4;
    char v66 = a6;
    v63[2] = v43;
    -[PKRecognitionSessionManager synthesizeDrawingForMathResultBlock:fallbackText:drawing:mathItem:inkColor:inputScale:completion:]((uint64_t)v44, v38, v59, v45, v58, v47, v57, v36);

    objc_destroyWeak(v63);
    objc_destroyWeak((id *)buf);
    goto LABEL_19;
  }
LABEL_20:
}

- (id)drawing
{
  id v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 30);
    id v1 = [WeakRetained mathViewControllerDrawing:v1];
  }

  return v1;
}

- (void)drawingTransformFromDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)(a2 + 240));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained mathViewControllerDrawingTransform:a2];
    id WeakRetained = v5;
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
}

- (void)drawingTransform
{
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  if (a2)
  {
    [(PKMathRecognitionViewController *)a1 drawingTransformFromDelegate];
    if ((*(unsigned char *)(a2 + 192) & 0x20) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a2 + 240));
      id v5 = -[PKMathRecognitionViewController drawing]((id *)a2);
      uint64_t v6 = [WeakRetained mathViewController:a2 coordinateSpaceForDrawing:v5];

      if (v6)
      {
        id v7 = objc_loadWeakRetained((id *)(a2 + 248));
        PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v6, v7, v9);
        long long v8 = v9[1];
        *a1 = v9[0];
        a1[1] = v8;
        a1[2] = v9[2];
      }
    }
  }
}

- (id)recognitionManager
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 13);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)layoutSubviews
{
  double width = self->_currentViewBounds.size.width;
  id v4 = -[PKMathRecognitionViewController view]((id *)&self->super.isa);
  [v4 bounds];
  self->_currentViewBounds.origin.x = v5;
  self->_currentViewBounds.origin.y = v6;
  self->_currentViewBounds.size.double width = v7;
  self->_currentViewBounds.size.height = v8;

  if (vabdd_f64(width, self->_currentViewBounds.size.width) >= 0.00999999978) {
    [(PKMathRecognitionViewController *)self dismissPopovers];
  }
  -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PKOverlayDrawingController viewDidLayout]((uint64_t)v9);
}

- (void)redrawSubviews
{
  uint64_t v2 = -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
  if (v2)
  {
    id v3 = v2;
    [v2 _updateDrawingViews];
    uint64_t v2 = v3;
  }
}

- (id)overlayViews
{
  -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
  uint64_t v2 = (id *)objc_claimAutoreleasedReturnValue();
  id v3 = -[PKOverlayDrawingController allViews](v2);

  return v3;
}

- (id)resultViewForItemUUID:(id)a3
{
  id v4 = a3;
  -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
  CGFloat v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKOverlayDrawingController existingViewForUUID:](v5, (uint64_t)v4);
  CGFloat v6 = (id *)objc_claimAutoreleasedReturnValue();

  CGFloat v7 = -[PKOverlayDrawingView imageView](v6);

  return v7;
}

- (void)removedFromView
{
  alternativedEditMenuInteraction = self->_alternativedEditMenuInteraction;
  if (alternativedEditMenuInteraction)
  {
    id v4 = [(UIEditMenuInteraction *)alternativedEditMenuInteraction view];
    [v4 removeInteraction:self->_alternativedEditMenuInteraction];

    CGFloat v5 = self->_alternativedEditMenuInteraction;
    self->_alternativedEditMenuInteraction = 0;
  }
  -[PKOverlayDrawingController removedFromView]((uint64_t)self->_overlayDrawingController);
  if (self->_scrubberController) {
    [(PKMathRecognitionViewController *)self hideScrubber];
  }
  if (self->_mathFloatingLabelView) {
    [(PKMathRecognitionViewController *)self hideMathFloatingLabelView];
  }
  if (self->_typesetViewController) {
    -[PKMathRecognitionViewController _cleanupTypesetViewController]((uint64_t)self);
  }
  popoverHintItemUUID = self->_popoverHintItemUUID;
  self->_popoverHintItemUUID = 0;

  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_openPopoverForHint object:0];
  addGraphItemUUID = self->_addGraphItemUUID;
  self->_addGraphItemUUID = 0;

  CGFloat v8 = (void *)MEMORY[0x1E4FBA8A8];

  [v8 cancelPreviousPerformRequestsWithTarget:self selector:sel_openPopoverForAddingGraph object:0];
}

- (void)_cleanupTypesetViewController
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 48);
    if (v2 && (*(unsigned char *)(a1 + 194) & 8) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 240));
      [WeakRetained mathViewControllerDidDismissPopoverUI:a1];

      uint64_t v2 = *(void **)(a1 + 48);
    }
    *(void *)(a1 + 48) = 0;

    [*(id *)(a1 + 56) _setVisibilityUpdatesEnabled:1];
    id v4 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;
  }
}

- (uint64_t)cancelOpenPopoverForHint
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void **)(result + 120);
    *(void *)(result + 120) = 0;

    id v3 = (void *)MEMORY[0x1E4FBA8A8];
    return [v3 cancelPreviousPerformRequestsWithTarget:v1 selector:sel_openPopoverForHint object:0];
  }
  return result;
}

- (uint64_t)cancelOpenPopoverForAddingGraph
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void **)(result + 128);
    *(void *)(result + 128) = 0;

    id v3 = (void *)MEMORY[0x1E4FBA8A8];
    return [v3 cancelPreviousPerformRequestsWithTarget:v1 selector:sel_openPopoverForAddingGraph object:0];
  }
  return result;
}

- (void)_updateDrawingOverlayCache
{
  if ([(PKMathRecognitionViewController *)self shouldCacheDrawingForResults])
  {
    -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
    id v3 = (id *)objc_claimAutoreleasedReturnValue();
    id v4 = -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
    -[PKOverlayDrawingController drawingForAllResultsForSourceDrawing:](v3, v4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    CGFloat v5 = +[PKDrawingOverlayCache sharedCache];
    CGFloat v6 = -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
    CGFloat v7 = [v6 uuid];
    -[PKDrawingOverlayCache setOverlayDrawing:forDrawingUUID:]((uint64_t)v5, v8, v7);
  }
}

- (void)setTokens:(id)a3 forItem:(id)a4
{
}

- (void)setTokens:(void *)a3 forItem:(int)a4 graphable:(void *)a5 graphableVariables:
{
  v107[1] = *MEMORY[0x1E4F143B8];
  obuint64_t j = a2;
  id v9 = a3;
  id v10 = a5;
  if (a1)
  {
    v87 = a1;
    if ([v9 isLowConfidenceMath])
    {
      double v11 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        double v12 = [v9 expression];
        *(_DWORD *)buf = 138477827;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "Set low confidence math for: %{private}@", buf, 0xCu);
      }
      double v13 = v9;
      -[PKMathRecognitionItem _setIsGraphable:graphableVariables:]((uint64_t)v13, 0, MEMORY[0x1E4F1CBF0]);
      double v14 = objc_alloc_init(PKMathRecognitionToken);
      [(PKMathRecognitionToken *)v14 setItem:v13];
      long long v15 = [v13 expression];
      [(PKMathRecognitionToken *)v14 setText:v15];

      long long v16 = [v13 expression];
      -[PKMathRecognitionToken setCharacterRange:](v14, "setCharacterRange:", 0, [v16 length]);

      [v13 bounds];
      -[PKMathRecognitionToken setBounds:](v14, "setBounds:");
      id v17 = _PencilKitBundle();
      CGFloat v18 = [v17 localizedStringForKey:@"Unsupported or unrecognized math" value:@"Unsupported or unrecognized math" table:@"Localizable"];

      CGFloat v19 = objc_alloc_init(PKMathRecognitionError);
      [(PKMathRecognitionError *)v19 setErrorString:v18];
      *(void *)buf = v19;
      CGFloat v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
      [(PKMathRecognitionToken *)v14 setErrors:v20];

      uint64_t v21 = -[PKMathRecognitionItem characterRangeForTriggerSymbol](v13);
      if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v23 = v21;
        uint64_t v24 = v22;
        CGFloat v25 = [(PKMathRecognitionItem *)(uint64_t)v13 _strokeIndexesForCharacterRange:v22];
        v108.origin.double x = -[PKMathRecognitionItem _boundsForStrokeIndexes:](v13, v25);
        double x = v108.origin.x;
        double y = v108.origin.y;
        double width = v108.size.width;
        double height = v108.size.height;
        if (!CGRectIsNull(v108))
        {
          -[PKMathRecognitionToken setCharacterRange:](v14, "setCharacterRange:", v23, v24);
          -[PKMathRecognitionToken setBounds:](v14, "setBounds:", x, y, width, height);
        }
      }
      v107[0] = v14;
      uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:1];
      if (v13) {
        objc_setProperty_nonatomic_copy(v13, v30, v31, 104);
      }

      if ((![a1 solvingStyle] || objc_msgSend(a1, "solvingStyle") == 1)
        && ((-[PKMathRecognitionItem isRecentlyModified]((double *)v13) & 1) != 0
         || (-[PKMathRecognitionViewController overlayDrawingController](a1),
             uint64_t v32 = objc_claimAutoreleasedReturnValue(),
             [v13 uuid],
             uint64_t v33 = objc_claimAutoreleasedReturnValue(),
             BOOL v34 = -[PKOverlayDrawingController hasVisibleTokensForItem:]((uint64_t)v32, (uint64_t)v33),
             v33,
             v32,
             v34)))
      {
        double v35 = -[PKMathRecognitionViewController overlayDrawingController](a1);
        id v36 = v10;
        if (v13) {
          id v37 = (void *)v13[13];
        }
        else {
          id v37 = 0;
        }
        id v38 = v37;
        -[PKOverlayDrawingController setTokens:item:]((uint64_t)v35, v38, v13);

        id v10 = v36;
      }
      else
      {
        double v35 = -[PKMathRecognitionViewController overlayDrawingController](a1);
        -[PKOverlayDrawingController removeTokensFor:]((uint64_t)v35, v13);
      }
    }
    else
    {
      int v83 = a4;
      v84 = v10;
      v86 = [MEMORY[0x1E4F28E60] indexSet];
      int v39 = [v9 expression];
      [v39 length];

      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      obuint64_t j = obj;
      uint64_t v40 = [obj countByEnumeratingWithState:&v92 objects:v106 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = 0;
        uint64_t v43 = *(void *)v93;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v93 != v43) {
              objc_enumerationMutation(obj);
            }
            char v45 = *(void **)(*((void *)&v92 + 1) + 8 * i);
            [v45 setItem:v9];
            uint64_t v47 = [v45 characterRange];
            uint64_t v48 = v46;
            if (v46)
            {
              char v49 = [(PKMathRecognitionItem *)(uint64_t)v9 _strokeIndexesForCharacterRange:v46];
              objc_msgSend(v45, "setBounds:", -[PKMathRecognitionItem _boundsForStrokeIndexes:](v9, v49));
            }
            if (*((unsigned char *)v87 + 106)) {
              [v45 setErrors:0];
            }
            char v50 = [v45 errors];
            uint64_t v51 = [v50 count];

            if (v51)
            {
              ++v42;
              if (v48) {
                BOOL v52 = v47 == 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                BOOL v52 = 1;
              }
              if (v52)
              {
                int v53 = os_log_create("com.apple.pencilkit", "Math");
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1C44F8000, v53, OS_LOG_TYPE_DEFAULT, "Invalid range for error token", buf, 2u);
                }
              }
              else
              {
                uint64_t v54 = [v45 characterRange];
                objc_msgSend(v86, "addIndexesInRange:", v54, v55);
              }
            }
          }
          uint64_t v41 = [obj countByEnumeratingWithState:&v92 objects:v106 count:16];
        }
        while (v41);
      }
      else
      {
        uint64_t v42 = 0;
      }

      id v56 = os_log_create("com.apple.pencilkit", "Math");
      id v10 = v84;
      int v57 = v83;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v58 = [obj count];
        id v59 = [v9 expression];
        uint64_t v60 = [v84 count];
        *(_DWORD *)buf = 134219011;
        *(void *)&uint8_t buf[4] = v58;
        __int16 v98 = 2113;
        v99 = v59;
        __int16 v100 = 1024;
        int v101 = v83;
        __int16 v102 = 2048;
        uint64_t v103 = v60;
        __int16 v104 = 2048;
        uint64_t v105 = v42;
        _os_log_impl(&dword_1C44F8000, v56, OS_LOG_TYPE_DEFAULT, "Set tokens: %lu, %{private}@, graphable: %{BOOL}d, variables: %lu, num errors: %lu", buf, 0x30u);
      }
      objc_super v62 = v87;
      if (!*((unsigned char *)v87 + 105))
      {
        v63 = -[PKMathRecognitionItem alternativesTokens]((uint64_t)v9);
        if ([v63 count])
        {
          char v64 = [MEMORY[0x1E4F1CA48] array];
          long long v88 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id v65 = v63;
          uint64_t v66 = [v65 countByEnumeratingWithState:&v88 objects:v96 count:16];
          if (v66)
          {
            uint64_t v67 = v66;
            uint64_t v68 = *(void *)v89;
            do
            {
              for (uint64_t j = 0; j != v67; ++j)
              {
                if (*(void *)v89 != v68) {
                  objc_enumerationMutation(v65);
                }
                id v70 = *(void **)(*((void *)&v88 + 1) + 8 * j);
                uint64_t v71 = [v70 characterRange];
                if ((objc_msgSend(v86, "containsIndexesInRange:", v71, v72) & 1) == 0) {
                  [v64 addObject:v70];
                }
              }
              uint64_t v67 = [v65 countByEnumeratingWithState:&v88 objects:v96 count:16];
            }
            while (v67);
          }

          if ([v64 count])
          {
            uint64_t v73 = [obj arrayByAddingObjectsFromArray:v64];

            obuint64_t j = (id)v73;
          }
          objc_super v62 = v87;

          id v10 = v84;
          int v57 = v83;
        }
      }
      if (v9) {
        objc_setProperty_nonatomic_copy(v9, v61, obj, 104);
      }
      if ((![v62 solvingStyle] || objc_msgSend(v62, "solvingStyle") == 1)
        && ((-[PKMathRecognitionItem isRecentlyModified]((double *)v9) & 1) != 0
         || (-[PKMathRecognitionViewController overlayDrawingController](v62),
             v74 = objc_claimAutoreleasedReturnValue(),
             [v9 uuid],
             __int16 v75 = objc_claimAutoreleasedReturnValue(),
             BOOL v76 = -[PKOverlayDrawingController hasVisibleTokensForItem:]((uint64_t)v74, (uint64_t)v75),
             v75,
             v74,
             v76)))
      {
        uint64_t v77 = -[PKMathRecognitionViewController overlayDrawingController](v62);
        -[PKOverlayDrawingController setTokens:item:]((uint64_t)v77, obj, v9);
      }
      else
      {
        uint64_t v77 = -[PKMathRecognitionViewController overlayDrawingController](v62);
        -[PKOverlayDrawingController removeTokensFor:]((uint64_t)v77, v9);
      }

      -[PKMathRecognitionItem _setIsGraphable:graphableVariables:]((uint64_t)v9, v57, v10);
      if (v57
        && ![v10 count]
        && -[PKMathRecognitionItem isRecentlyModified]((double *)v9)
        && -[PKMathRecognitionItem isRecentlyCreated](v9)
        && (![v62 solvingStyle] || objc_msgSend(v62, "solvingStyle") == 1))
      {
        id v78 = v62[23];
        CGRect v79 = [v9 uuid];
        LOBYTE(v78) = [v78 containsObject:v79];

        if ((v78 & 1) == 0)
        {
          id v80 = v62[16];
          v62[16] = 0;

          [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:v62 selector:sel_openPopoverForAddingGraph object:0];
          uint64_t v81 = [v9 uuid];
          id v82 = v62[16];
          v62[16] = (id)v81;

          objc_msgSend(v62, "performSelector:withObject:afterDelay:", sel_openPopoverForAddingGraph, 0, -[PKMathRecognitionItem _remainingDelayForTargetDelay:](v9, 1.0));
        }
      }
    }
  }
}

- (void)setTokens:(id)a3 forItemUUID:(id)a4 graphable:(BOOL)a5
{
}

- (void)setTokens:(id)a3 forItemUUID:(id)a4 graphable:(BOOL)a5 graphableVariables:(id)a6
{
  BOOL v7 = a5;
  id v12 = a3;
  id v10 = a6;
  double v11 = [(NSMutableDictionary *)self->_currentMathItemsLookup objectForKeyedSubscript:a4];
  if (v11) {
    -[PKMathRecognitionViewController setTokens:forItem:graphable:graphableVariables:]((id *)&self->super.isa, v12, v11, v7, v10);
  }
}

- (void)_scrubVariable:(void *)a3 item:(uint64_t)a4 openAsCompact:
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  if (a1)
  {
    [(id)a1 hideScrubber];
    id v10 = [v9 expression];
    double v11 = v10;
    obuint64_t j = a2;
    if (v8)
    {
      uint64_t v12 = v8[5];
      uint64_t v13 = v8[6];
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v12 = 0;
    }
    double v14 = objc_msgSend(v10, "substringWithRange:", v12, v13);

    long long v15 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = [v9 expression];
      LODWORD(buf.a) = 138478083;
      *(void *)((char *)&buf.a + 4) = v16;
      WORD2(buf.b) = 2113;
      *(void *)((char *)&buf.b + 6) = v14;
      _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "Opening scrubber for expression: %{private}@, variable: %{private}@", (uint8_t *)&buf, 0x16u);
    }
    memset(&buf, 0, sizeof(buf));
    [(PKMathRecognitionViewController *)&buf drawingTransform];
    id v80 = a3;
    if (v8) {
      id v17 = (void *)v8[4];
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;
    double v19 = -[PKMathRecognitionItem _boundsForStrokeIndexes:](v9, v18);
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;

    CGAffineTransform v82 = buf;
    v85.origin.double x = v19;
    v85.origin.double y = v21;
    v85.size.double width = v23;
    v85.size.double height = v25;
    CGRect v86 = CGRectApplyAffineTransform(v85, &v82);
    double x = v86.origin.x;
    double y = v86.origin.y;
    double width = v86.size.width;
    double height = v86.size.height;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 248));
    uint64_t v31 = [WeakRetained window];
    uint64_t v32 = [v31 rootViewController];
    uint64_t v33 = [v32 view];

    id v34 = objc_loadWeakRetained((id *)(a1 + 240));
    double v35 = [v34 mathViewController:a1 createScrubberControllerForView:v33 delegate:a1];

    id v36 = objc_loadWeakRetained((id *)(a1 + 248));
    uint64_t v81 = (void *)v33;
    objc_msgSend(v36, "convertRect:toView:", v33, x, y, width, height);
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;

    objc_storeStrong((id *)(a1 + 64), v35);
    *(unsigned char *)(a1 + 72) = a4;
    if ((*(unsigned char *)(a1 + 194) & 4) != 0)
    {
      id v45 = objc_loadWeakRetained((id *)(a1 + 240));
      [v45 mathViewController:a1 willPresentPopoverUI:0];
    }
    id v46 = objc_loadWeakRetained((id *)(a1 + 248));
    uint64_t v47 = [v46 window];
    uint64_t v48 = +[PKToolPicker activeToolPickerForWindow:v47];
    char v49 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v48;

    [*(id *)(a1 + 56) _setVisibilityUpdatesEnabled:0];
    char v50 = *(void **)(a1 + 64);
    uint64_t v51 = -[PKMathRecognitionItem _stringForVariable:](v9, v8);
    objc_msgSend(v50, "showScrubberFor:frame:compact:", v51, a4, v38, v40, v42, v44);

    BOOL v52 = [PKLiveMathVariable alloc];
    int v53 = -[PKMathRecognitionViewController drawing]((id *)a1);
    id v54 = v53;
    uint64_t v55 = v8;
    id v56 = v9;
    if (v52)
    {
      *(void *)&v82.a = v52;
      *(void *)&v82.b = PKLiveMathVariable;
      id v57 = [(CGAffineTransform *)(objc_super *)&v82 init];
      BOOL v52 = (PKLiveMathVariable *)v57;
      if (v57)
      {
        id v78 = v9;
        objc_storeStrong((id *)v57 + 2, v53);
        objc_storeStrong((id *)&v52->_variable, obj);
        objc_storeStrong((id *)&v52->_mathItem, v80);
        CGPoint v58 = (CGPoint)*MEMORY[0x1E4F1DB20];
        CGSize v59 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
        v52->_calculatedFitBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
        v52->_calculatedFitBounds.size = v59;
        v52->_calculatedFitBoundsForExtraLeadingSlack.origin = v58;
        v52->_calculatedFitBoundsForExtraLeadingSlack.size = v59;
        uint64_t v77 = v35;
        uint64_t v60 = v14;
        if (v8) {
          id v61 = (void *)v55[4];
        }
        else {
          id v61 = 0;
        }
        id v62 = v61;
        -[PKMathRecognitionItem _strokesForStrokeIndexes:](v56, v62);
        v63 = (NSArray *)objc_claimAutoreleasedReturnValue();

        originalStrokes = v52->_originalStrokes;
        v52->_originalStrokes = v63;
        id v65 = v63;

        uint64_t v66 = [objc_alloc((Class)objc_opt_class()) initWithStrokes:v65 fromDrawing:v54];
        originalStrokesDrawing = v52->_originalStrokesDrawing;
        v52->_originalStrokesDrawing = (PKDrawing *)v66;

        [(PKDrawing *)v52->_originalStrokesDrawing bounds];
        CGFloat v69 = v68;
        CGFloat v71 = v70;
        CGFloat v73 = v72;
        CGFloat v75 = v74;

        v52->_originalStrokesBounds.origin.double x = v69;
        v52->_originalStrokesBounds.origin.double y = v71;
        v52->_originalStrokesBounds.size.double width = v73;
        v52->_originalStrokesBounds.size.double height = v75;
        double v14 = v60;
        double v35 = v77;
        id v9 = v78;
      }
    }

    BOOL v76 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = v52;

    if (*(unsigned char *)(a1 + 72)) {
      [(id)a1 performSelector:sel_hideScrubber withObject:0 afterDelay:3.0];
    }
  }
}

- (void)_triggerAlternativesMenuForToken:(uint64_t)a1
{
  id v4 = a2;
  [v4 bounds];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  if (!CGRectIsNull(v20))
  {
    float64x2_t v18 = 0u;
    float64x2_t v19 = 0u;
    float64x2_t v17 = 0u;
    [(PKMathRecognitionViewController *)&v17 drawingTransform];
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    double MidX = CGRectGetMidX(v21);
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    id v9 = objc_msgSend(MEMORY[0x1E4FB1750], "configurationWithIdentifier:sourcePoint:", @"token", vaddq_f64(v19, vmlaq_n_f64(vmulq_n_f64(v18, CGRectGetMinY(v22)), v17, MidX)));
    objc_storeStrong((id *)(a1 + 96), a2);
    if ((*(unsigned char *)(a1 + 194) & 4) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 240));
      [WeakRetained mathViewController:a1 willPresentPopoverUI:2];
    }
    double v11 = *(void **)(a1 + 272);
    if (!v11)
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB1758]) initWithDelegate:a1];
      uint64_t v13 = *(void **)(a1 + 272);
      *(void *)(a1 + 272) = v12;

      id v14 = objc_loadWeakRetained((id *)(a1 + 248));
      [v14 addInteraction:*(void *)(a1 + 272)];

      double v11 = *(void **)(a1 + 272);
    }
    id v15 = v11;
    [v15 presentEditMenuWithConfiguration:v9];
  }
}

- (void)_triggerPopupToAddGraphForItem:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = 0;

    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a1 selector:sel_openPopoverForAddingGraph object:0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 248));
    CGFloat v6 = [WeakRetained window];

    if (!v6)
    {
      os_log_t v18 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CGAffineTransform buf = 0;
        _os_log_error_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_ERROR, "No window when trying to open popover to graph.", buf, 2u);
      }
      goto LABEL_21;
    }
    if ((*(unsigned char *)(a1 + 192) & 8) != 0)
    {
      v43.origin.CGFloat x = -[PKMathRecognitionItem boundsForAnyEqualSign](v3);
      CGFloat x = v43.origin.x;
      CGFloat y = v43.origin.y;
      CGFloat width = v43.size.width;
      CGFloat height = v43.size.height;
      if (CGRectIsNull(v43)
        || (-[PKMathRecognitionViewController drawing]((id *)a1),
            double v11 = objc_claimAutoreleasedReturnValue(),
            char v12 = [v3 isValidForDrawing:v11],
            v11,
            (v12 & 1) == 0))
      {
        os_log_t v18 = os_log_create("com.apple.pencilkit", "Math");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          float64x2_t v19 = [v3 expression];
          *(_DWORD *)CGAffineTransform buf = 138477827;
          *(void *)&uint8_t buf[4] = v19;
          _os_log_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEFAULT, "Expression is not valid anymore: %{private}@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v13 = os_log_create("com.apple.pencilkit", "Math");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [v3 expression];
          *(_DWORD *)CGAffineTransform buf = 138477827;
          *(void *)&uint8_t buf[4] = v14;
          _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "Open popover to graph: %{private}@", buf, 0xCu);
        }
        v44.origin.CGFloat x = x;
        v44.origin.CGFloat y = y;
        v44.size.CGFloat width = width;
        v44.size.CGFloat height = height;
        double MidX = CGRectGetMidX(v44);
        v45.origin.CGFloat x = x;
        v45.origin.CGFloat y = y;
        v45.size.CGFloat width = width;
        v45.size.CGFloat height = height;
        double MinY = CGRectGetMinY(v45);
        float64x2_t v40 = 0u;
        float64x2_t v41 = 0u;
        *(_OWORD *)CGAffineTransform buf = 0u;
        [(PKMathRecognitionViewController *)buf drawingTransform];
        float64x2_t v34 = v40;
        float64x2_t v35 = v41;
        float64x2_t v36 = *(float64x2_t *)buf;
        id v15 = v3;
        long long v16 = v15;
        if ((*(unsigned char *)(a1 + 192) & 2) != 0)
        {
          v46.origin.CGFloat x = -[PKMathRecognitionItem boundsForAnyEqualSign](v15);
          CGFloat v20 = v46.origin.x;
          CGFloat v21 = v46.origin.y;
          CGFloat v22 = v46.size.width;
          CGFloat v23 = v46.size.height;
          double v33 = CGRectGetMidX(v46);
          v47.origin.CGFloat x = v20;
          v47.origin.CGFloat y = v21;
          v47.size.CGFloat width = v22;
          v47.size.CGFloat height = v23;
          double MidY = CGRectGetMidY(v47);
          id v25 = objc_loadWeakRetained((id *)(a1 + 240));
          BOOL v26 = [v16 uuid];
          v27 = objc_msgSend(v25, "mathViewController:expressionIdentifiersForCompatibleGraphNearLocation:expressionUUID:", a1, v26, v33, MidY);

          if (v27)
          {
            uint64_t v28 = [v16 uuid];
            v29 = [v28 UUIDString];
            char v17 = [v27 containsObject:v29] ^ 1;
          }
          else
          {
            char v17 = 0;
          }
        }
        else
        {
          char v17 = 0;
        }

        id v30 = objc_loadWeakRetained((id *)(a1 + 248));
        uint64_t v31 = +[PKMathContextMenuController insertGraphControllerForItem:tapBounds:alsoShowAddToExisiting:view:delegate:](x, y, width, height, (uint64_t)PKMathContextMenuController, v16, v17, v30, (void *)a1);

        uint64_t v32 = *(void **)(a1 + 280);
        *(void *)(a1 + 280) = v31;
        os_log_t v18 = v31;

        if (v18) {
          [(objc_class *)v18[2].isa _presentMenuAtLocation:vaddq_f64(v35, vmlaq_n_f64(vmulq_n_f64(v34, MinY), v36, MidX))];
        }
      }
LABEL_21:
    }
  }
}

- (void)setContextMenuController:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 280), a2);
  }
}

- (void)openPopoverForAddingGraph
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_addGraphItemUUID)
  {
    uint64_t v3 = -[NSMutableDictionary objectForKeyedSubscript:](self->_currentMathItemsLookup, "objectForKeyedSubscript:");
    addGraphItemUUID = self->_addGraphItemUUID;
    self->_addGraphItemUUID = 0;

    if (self->_contextMenuController)
    {
      CGFloat v5 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Context menu already open when trying to open popover for graphing.", (uint8_t *)&v15, 2u);
      }
    }
    else if (v3)
    {
      if (*(unsigned char *)(v3 + 48)
        || (id v6 = *(id *)(v3 + 56), v7 = [v6 count], v6, v7))
      {
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v9 = v8 - -[PKMathRecognitionItem mostRecentStrokeTimestamp]((void *)v3);
        if (os_variant_has_internal_ui())
        {
          id v10 = _PKSignpostLog();
          if (os_signpost_enabled(v10))
          {
            int v15 = 134217984;
            double v16 = v9;
            _os_signpost_emit_with_name_impl(&dword_1C44F8000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MathRecognitionToInsertGraph", "%f", (uint8_t *)&v15, 0xCu);
          }

          double v11 = os_log_create("com.apple.pencilkit", "");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            LOWORD(v15) = 0;
            _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_INFO, "DISCRETE \"MathRecognitionToInsertGraph\"", (uint8_t *)&v15, 2u);
          }

          char v12 = os_log_create("com.apple.pencilkit", "Math");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 134217984;
            double v16 = v9;
            _os_log_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_DEFAULT, "MathRecognitionToInsertGraph: %g", (uint8_t *)&v15, 0xCu);
          }
        }
        expressionsWeCreatedGraphsFor = self->_expressionsWeCreatedGraphsFor;
        id v14 = [(id)v3 uuid];
        [(NSMutableSet *)expressionsWeCreatedGraphsFor addObject:v14];

        -[PKMathRecognitionViewController _triggerPopupToAddGraphForItem:]((uint64_t)self, (void *)v3);
        -[PKMathRecognitionViewController _emitMathUsageForItem:usage:recognitionLatency:synthesisLatency:hadOldResult:]((uint64_t)self, (void *)v3, 2, (uint64_t)(v9 * 1000.0), 0, 0);
      }
    }
  }
}

- (void)_emitMathUsageForItem:(uint64_t)a3 usage:(uint64_t)a4 recognitionLatency:(uint64_t)a5 synthesisLatency:(uint64_t)a6 hadOldResult:
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  char v12 = v11;
  if (a1)
  {
    uint64_t v13 = -[PKMathRecognitionItem hasAnyErrors]((uint64_t)v11);
    uint64_t v14 = [v12 isVerticalExpression];
    v24[0] = @"error_state";
    int v15 = [NSNumber numberWithBool:v13];
    v25[0] = v15;
    v24[1] = @"event_type";
    double v16 = [NSNumber numberWithInteger:a3];
    v25[1] = v16;
    v24[2] = @"expression_edit_after_result";
    uint64_t v17 = [NSNumber numberWithBool:a6];
    v25[2] = v17;
    v24[3] = @"expression_is_vertical";
    os_log_t v18 = [NSNumber numberWithBool:v14];
    v25[3] = v18;
    float64x2_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
    CGFloat v20 = (void *)[v19 mutableCopy];

    if (a4 >= 1 && -[PKMathRecognitionItem isRecentlyModified]((double *)v12))
    {
      CGFloat v21 = [NSNumber numberWithInteger:a4];
      [v20 setObject:v21 forKeyedSubscript:@"recognition_latency"];
    }
    if (a5 >= 1)
    {
      CGFloat v22 = [NSNumber numberWithInteger:a5];
      [v20 setObject:v22 forKeyedSubscript:@"synthesis_latency"];
    }
    id v23 = v20;
    AnalyticsSendEventLazy();
  }
}

- (void)openPopoverForHint
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_popoverHintItemUUID)
  {
    uint64_t v3 = -[NSMutableDictionary objectForKeyedSubscript:](self->_currentMathItemsLookup, "objectForKeyedSubscript:");
    popoverHintItemUUID = self->_popoverHintItemUUID;
    self->_popoverHintItemUUID = 0;

    if (self->_contextMenuController)
    {
      CGFloat v5 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Context menu already open when trying to open popover for hint.", (uint8_t *)&v11, 2u);
      }
    }
    else if (v3)
    {
      if (os_variant_has_internal_ui())
      {
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v7 = v6;
        double v8 = -[PKMathRecognitionItem mostRecentStrokeTimestamp](v3);
        double v9 = _PKSignpostLog();
        if (os_signpost_enabled(v9))
        {
          int v11 = 134217984;
          double v12 = v7 - v8;
          _os_signpost_emit_with_name_impl(&dword_1C44F8000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MathRecognitionToHint", "%f", (uint8_t *)&v11, 0xCu);
        }

        id v10 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_INFO, "DISCRETE \"MathRecognitionToHint\"", (uint8_t *)&v11, 2u);
        }
      }
      -[PKMathRecognitionViewController _showDetectionAnimationForItem:](self, v3);
      -[PKMathRecognitionViewController _triggerPopupToSolveItem:supportCopy:]((uint64_t)self, v3, 0);
    }
  }
}

- (void)_showDetectionAnimationForItem:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    id v4 = -[PKMathRecognitionViewController tiledView]((id *)a1);
    CGFloat v5 = [v3 strokes];
    if ([v5 count]
      && [v3 shouldBeSolved]
      && -[PKMathRecognitionItem isRecentlyModified]((double *)v3))
    {
      double v6 = -[PKMathRecognitionViewController drawing]((id *)a1);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __66__PKMathRecognitionViewController__showDetectionAnimationForItem___block_invoke;
      v15[3] = &unk_1E64C9D98;
      objc_copyWeak(&v17, &location);
      v15[4] = a1;
      id v16 = v4;
      id v7 = v5;
      id v8 = v6;
      double v9 = v15;
      id v10 = -[PKMathRecognitionViewController tiledView]((id *)a1);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __75__PKMathRecognitionViewController__maskImageForStrokes_drawing_completion___block_invoke;
      v19[3] = &unk_1E64C9D70;
      id v20 = v10;
      id v11 = v7;
      id v21 = v11;
      id v12 = v8;
      id v22 = v12;
      uint64_t v13 = v9;
      id v23 = v13;
      id v14 = v10;
      -[PKMathRecognitionViewController _imageViewForStrokes:drawing:completion:]((uint64_t)a1, v11, v12, v19);

      objc_destroyWeak(&v17);
    }

    objc_destroyWeak(&location);
  }
}

- (void)_triggerPopupToSolveItem:(char)a3 supportCopy:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    double v6 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = 0;

    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a1 selector:sel_openPopoverForHint object:0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 248));
    id v8 = [WeakRetained window];

    os_log_t v9 = os_log_create("com.apple.pencilkit", "Math");
    os_log_t v10 = v9;
    if (v8)
    {
      id v11 = v9;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v5 expression];
        *(_DWORD *)CGAffineTransform buf = 138477827;
        uint64_t v31 = v12;
        _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "Trigger popover to solve: %{private}@", buf, 0xCu);
      }
      [v5 boundsForTriggerStrokes];
      CGFloat x = v33.origin.x;
      CGFloat y = v33.origin.y;
      CGFloat width = v33.size.width;
      CGFloat height = v33.size.height;
      if (CGRectIsNull(v33)
        || (-[PKMathRecognitionViewController drawing]((id *)a1),
            id v17 = objc_claimAutoreleasedReturnValue(),
            char v18 = [v5 isValidForDrawing:v17],
            v17,
            (v18 & 1) == 0))
      {
        os_log_t v10 = os_log_create("com.apple.pencilkit", "Math");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [v5 expression];
          *(_DWORD *)CGAffineTransform buf = 138477827;
          uint64_t v31 = v27;
          _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Expression is not valid anymore: %{private}@", buf, 0xCu);
        }
      }
      else
      {
        [(PKMathRecognitionViewController *)&v29 drawingTransform];
        v34.origin.CGFloat x = x;
        v34.origin.CGFloat y = y;
        v34.size.CGFloat width = width;
        v34.size.CGFloat height = height;
        CGRect v35 = CGRectApplyAffineTransform(v34, &v29);
        CGFloat v19 = v35.origin.x;
        CGFloat v20 = v35.origin.y;
        CGFloat v21 = v35.size.width;
        CGFloat v22 = v35.size.height;
        double MidX = CGRectGetMidX(v35);
        v36.origin.CGFloat x = v19;
        v36.origin.CGFloat y = v20;
        v36.size.CGFloat width = v21;
        v36.size.CGFloat height = v22;
        double MidY = CGRectGetMidY(v36);
        id v24 = objc_loadWeakRetained((id *)(a1 + 248));
        id v25 = +[PKMathContextMenuController mathSolvingControllerForItem:tapBounds:supportCopy:view:delegate:](x, y, width, height, (uint64_t)PKMathContextMenuController, v5, a3, v24, (void *)a1);

        BOOL v26 = *(void **)(a1 + 280);
        *(void *)(a1 + 280) = v25;
        os_log_t v10 = v25;

        if (v10) {
          -[objc_class _presentMenuAtLocation:](v10[2].isa, "_presentMenuAtLocation:", MidX, MidY);
        }
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_error_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_ERROR, "No window when trying to trigger popup to solve.", buf, 2u);
    }
  }
}

- (BOOL)handleSingleTapAtDrawingLocation:(CGPoint)a3
{
  return [(PKMathRecognitionViewController *)(uint64_t)self _handleSingleTapAtDrawingLocation:0 fromHover:a3.x fromTapStroke:a3.y];
}

- (uint64_t)_handleSingleTapAtDrawingLocation:(int)a3 fromHover:(CGFloat)a4 fromTapStroke:(CGFloat)a5
{
  uint64_t v226 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  if ([(id)result solvingStyle] && objc_msgSend((id)v7, "solvingStyle") != 1) {
    return 0;
  }
  id v8 = -[PKMathRecognitionViewController tiledView]((id *)v7);
  os_log_t v9 = [v8 ink];
  if ([v9 _isEraserInk])
  {

    result = 0;
    if (a2 & 1) != 0 || (a3) {
      return result;
    }
  }
  else
  {
  }
  [*(id *)(v7 + 256) processDelayedItemsIfNecessary];
  if (a2) {
    goto LABEL_10;
  }
  if (*(void *)(v7 + 280)) {
    return 1;
  }
  if (*(void *)(v7 + 88))
  {
    [(id)v7 hideScrubber];
    return 1;
  }
  if (*(void *)(v7 + 40))
  {
    [(id)v7 hideMathFloatingLabelView];
    return 1;
  }
  if (*(unsigned char *)(v7 + 104)) {
    return 1;
  }
  -[PKMathRecognitionViewController cancelOpenPopoverForHint](v7);
  -[PKMathRecognitionViewController cancelOpenPopoverForAddingGraph](v7);
LABEL_10:
  [(PKMathRecognitionViewController *)v219 drawingTransform];
  float64x2_t v184 = (float64x2_t)v219[1];
  float64x2_t v185 = (float64x2_t)v219[2];
  float64x2_t v186 = (float64x2_t)v219[0];
  memset(&v218, 0, sizeof(v218));
  [(PKMathRecognitionViewController *)&v218 drawingTransform];
  CGAffineTransform v221 = v218;
  DKD_CGAffineTransformDecompose((uint64_t)&v221, (uint64_t)&buf);
  double a = buf.a;
  long long v214 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  id v11 = [*(id *)(v7 + 8) allValues];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v214 objects:v224 count:16];
  uint64_t v191 = v7;
  unsigned int v187 = a2;
  if (!v12)
  {

    BOOL v58 = 0;
    id v14 = 0;
    uint64_t v57 = 0;
    goto LABEL_60;
  }
  uint64_t v13 = v12;
  v192 = 0;
  id v14 = 0;
  double v15 = a + a;
  int v16 = a2 | a3;
  uint64_t v17 = *(void *)v215;
  double v18 = a * -6.0;
  double v19 = v15 + v15;
  uint64_t v188 = *(void *)v215;
  v189 = v11;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v215 != v17) {
        objc_enumerationMutation(v11);
      }
      CGFloat v21 = *(unsigned char **)(*((void *)&v214 + 1) + 8 * i);
      CGFloat v22 = -[PKMathRecognitionViewController drawing]((id *)v7);
      int v23 = [v21 isValidForDrawing:v22];

      if (!v23) {
        continue;
      }
      id v24 = [v21 tappableStrokes];
      +[PKDrawing _boundingBoxForStrokeArray:v24];
      CGFloat x = v25;
      CGFloat y = v27;
      double width = v29;
      CGFloat height = v31;

      v229.origin.CGFloat x = x;
      v229.origin.CGFloat y = y;
      v229.size.double width = width;
      v229.size.CGFloat height = height;
      if (!CGRectIsNull(v229))
      {
        if (v16)
        {
          if (width <= v15 * 4.0) {
            goto LABEL_22;
          }
          CGFloat v33 = 0.0;
          CGFloat v34 = x;
          CGFloat v35 = y;
          double v36 = width;
          CGFloat v37 = height;
          CGFloat v38 = v15;
        }
        else
        {
          CGFloat v34 = x;
          CGFloat v35 = y;
          double v36 = width;
          CGFloat v37 = height;
          CGFloat v38 = v18;
          CGFloat v33 = v18;
        }
        CGRect v230 = CGRectInset(*(CGRect *)&v34, v38, v33);
        CGFloat x = v230.origin.x;
        CGFloat y = v230.origin.y;
        double width = v230.size.width;
        CGFloat height = v230.size.height;
LABEL_22:
        v231.origin.CGFloat x = x;
        v231.origin.CGFloat y = y;
        v231.size.double width = width;
        v231.size.CGFloat height = height;
        v227.CGFloat y = a5;
        v227.CGFloat x = a4;
        if (CGRectContainsPoint(v231, v227))
        {
          id v56 = v21;

          v192 = v56;
          goto LABEL_55;
        }
      }
      if (_os_feature_enabled_impl() && (~*(_DWORD *)(v7 + 192) & 0x2C0) == 0 && (!v21 || !v21[75]))
      {
        long long v212 = 0u;
        long long v213 = 0u;
        long long v210 = 0u;
        long long v211 = 0u;
        double v39 = objc_msgSend(v21, "scrubbableVariables", *(_OWORD *)&v184, *(_OWORD *)&v185, *(_OWORD *)&v186);
        uint64_t v40 = [v39 countByEnumeratingWithState:&v210 objects:v223 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          v190 = v14;
          uint64_t v42 = *(void *)v211;
LABEL_29:
          uint64_t v43 = 0;
          while (1)
          {
            if (*(void *)v211 != v42) {
              objc_enumerationMutation(v39);
            }
            CGRect v44 = *(void **)(*((void *)&v210 + 1) + 8 * v43);
            if (v44) {
              CGRect v45 = (void *)v44[4];
            }
            else {
              CGRect v45 = 0;
            }
            id v46 = v45;
            double v47 = -[PKMathRecognitionItem _boundsForStrokeIndexes:](v21, v46);
            CGFloat v49 = v48;
            double v51 = v50;
            double v53 = v52;

            if (v16 && v51 > v19 && v53 > v19)
            {
              v232.origin.CGFloat x = v47;
              v232.origin.CGFloat y = v49;
              v232.size.double width = v51;
              v232.size.CGFloat height = v53;
              CGRect v233 = CGRectInset(v232, v15, v15);
              double v47 = v233.origin.x;
              CGFloat v49 = v233.origin.y;
              double v51 = v233.size.width;
              double v53 = v233.size.height;
            }
            v234.origin.CGFloat x = v47;
            v234.origin.CGFloat y = v49;
            v234.size.double width = v51;
            v234.size.CGFloat height = v53;
            v228.CGFloat y = a5;
            v228.CGFloat x = a4;
            if (CGRectContainsPoint(v234, v228)) {
              break;
            }
            if (v41 == ++v43)
            {
              uint64_t v54 = [v39 countByEnumeratingWithState:&v210 objects:v223 count:16];
              uint64_t v41 = v54;
              if (!v54)
              {
                id v14 = v190;
                goto LABEL_45;
              }
              goto LABEL_29;
            }
          }
          uint64_t v55 = v21;

          id v14 = v44;
          v192 = v55;
LABEL_45:
          uint64_t v7 = v191;
          uint64_t v17 = v188;
          id v11 = v189;
        }
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v214 objects:v224 count:16];
    if (v13) {
      continue;
    }
    break;
  }
LABEL_55:

  uint64_t v57 = (uint64_t)v192;
  BOOL v58 = v192 != 0;
  if (v187 && v192)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    if (v59 - -[PKMathRecognitionItem mostRecentStrokeTimestamp](v192) < 1.5)
    {
      long long v90 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.a) = 0;
        _os_log_impl(&dword_1C44F8000, v90, OS_LOG_TYPE_DEFAULT, "Skipping hover and hold action since we just created this math item.", (uint8_t *)&buf, 2u);
      }

      unsigned __int8 v220 = 0;
      goto LABEL_112;
    }
    BOOL v58 = 1;
  }
LABEL_60:
  pointdouble a = (CGPoint)vaddq_f64(v185, vmlaq_n_f64(vmulq_n_f64(v184, a5), v186, a4));
  uint64_t v60 = -[PKMathRecognitionViewController overlayDrawingController]((id *)v7);
  double v61 = pointa.y;
  id v62 = [(PKOverlayDrawingController *)(uint64_t)v60 tokenAtLocation:pointa.y];

  if (v62)
  {
    v63 = [v62 errors];
    char v64 = [v63 firstObject];
    id v65 = [v64 errorString];
    uint64_t v66 = [v65 length];

    if (v66)
    {
      [v62 bounds];
      if (CGRectIsEmpty(v235))
      {
        uint64_t v67 = os_log_create("com.apple.pencilkit", "Math");
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.a) = 0;
          _os_log_error_impl(&dword_1C44F8000, v67, OS_LOG_TYPE_ERROR, "Unable to find bounds for token, using hit test location instead", (uint8_t *)&buf, 2u);
        }
        uint64_t v68 = v57;
        CGFloat v69 = v14;

        double v70 = (id *)v191;
      }
      else
      {
        uint64_t v68 = v57;
        CGFloat v69 = v14;
        [v62 bounds];
        double pointb = CGRectGetMidX(v236);
        [v62 bounds];
        double MinY = CGRectGetMinY(v237);
        double v70 = (id *)v191;
        [(PKMathRecognitionViewController *)v209 drawingTransform];
        pointdouble a = (CGPoint)vaddq_f64(v209[2], vmlaq_n_f64(vmulq_n_f64(v209[1], MinY), v209[0], pointb));
        double v61 = pointa.y;
      }
      CGFloat v73 = objc_msgSend(v62, "errors", *(_OWORD *)&v184, *(_OWORD *)&v185, *(_OWORD *)&v186);
      double v74 = [v73 firstObject];
      CGFloat v75 = [v74 errorString];

      BOOL v76 = [v62 errors];
      uint64_t v77 = [v76 firstObject];
      id v78 = [v77 errorReasonString];

      CGRect v79 = [v62 item];
      [v62 bounds];
      CGFloat v81 = v80;
      CGFloat v83 = v82;
      CGFloat v85 = v84;
      CGFloat v87 = v86;
      long long v88 = -[PKMathRecognitionViewController view](v70);
      +[PKMathContextMenuController mathErrorControllerForItem:token:tapBounds:errorString:errorReasonString:view:delegate:](v81, v83, v85, v87, (uint64_t)PKMathContextMenuController, v79, v62, v75, v78, v88, v70);
      long long v89 = (id *)objc_claimAutoreleasedReturnValue();

      -[PKMathRecognitionViewController setContextMenuController:]((uint64_t)v70, v89);
      if (v89) {
        objc_msgSend(v89[2], "_presentMenuAtLocation:", pointa.x, v61);
      }
      unsigned __int8 v220 = 1;

      id v14 = v69;
      uint64_t v57 = v68;
      goto LABEL_111;
    }
    if ([v62 type] == 4)
    {
      CGFloat v71 = [v62 alternatives];
      uint64_t v72 = [v71 count];

      if (v72)
      {
        -[PKMathRecognitionViewController _triggerAlternativesMenuForToken:](v191, v62);
LABEL_110:
        unsigned __int8 v220 = 1;
        goto LABEL_111;
      }
    }
  }
  if (v14)
  {
    if (*(void *)(v191 + 88))
    {
      [(id)v191 hideScrubber];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __93__PKMathRecognitionViewController__handleSingleTapAtDrawingLocation_fromHover_fromTapStroke___block_invoke;
      block[3] = &unk_1E64C9D20;
      block[4] = v191;
      v206 = v14;
      id v207 = (id)v57;
      char v208 = v187;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      -[PKMathRecognitionViewController _scrubVariable:item:openAsCompact:](v191, v14, (void *)v57, v187);
    }
    goto LABEL_110;
  }
  if (v58)
  {
    if (v57 && *(unsigned char *)(v57 + 48))
    {
      if ((*(unsigned char *)(v191 + 192) & 8) == 0)
      {
LABEL_116:
        v128 = os_log_create("com.apple.pencilkit", "Math");
        if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
        {
          v129 = [(id)v57 expression];
          LODWORD(buf.a) = 138477827;
          *(void *)((char *)&buf.a + 4) = v129;
          _os_log_impl(&dword_1C44F8000, v128, OS_LOG_TYPE_DEFAULT, "Tapped on expression: %{private}@", (uint8_t *)&buf, 0xCu);
        }
        [(id)v191 hideMathFloatingLabelView];
        long long v92 = [(id)v57 expressionToPresent];
        if ([v92 length])
        {
          if (-[PKMathRecognitionItem hasAnyErrorsOrAlternatives](v57))
          {
            v130 = -[PKMathRecognitionViewController overlayDrawingController]((id *)v191);
            v131 = [(id)v57 uuid];
            BOOL v132 = -[PKOverlayDrawingController hasVisibleTokensForItem:]((uint64_t)v130, (uint64_t)v131);

            if (!v132)
            {
              v133 = -[PKMathRecognitionViewController overlayDrawingController]((id *)v191);
              if (v57) {
                v134 = *(void **)(v57 + 104);
              }
              else {
                v134 = 0;
              }
              id v135 = v134;
              -[PKOverlayDrawingController setTokens:item:]((uint64_t)v133, v135, (void *)v57);
            }
          }
          v136 = *(void **)(v191 + 16);
          v137 = objc_msgSend((id)v57, "uuid", *(_OWORD *)&v184, *(_OWORD *)&v185, *(_OWORD *)&v186);
          v138 = [v136 objectForKeyedSubscript:v137];

          if (([(id)v57 shouldSolveMathFlagIsSet] & 1) == 0
            && [(id)v57 shouldBeSolved]
            && [v138 length])
          {
            -[PKMathRecognitionViewController _triggerPopupToSolveItem:supportCopy:](v191, (void *)v57, 1);
            unsigned __int8 v220 = 1;
          }
          else
          {
            -[PKMathRecognitionViewController overlayDrawingController]((id *)v191);
            v139 = (id *)objc_claimAutoreleasedReturnValue();
            v140 = [(id)v57 uuid];
            v141 = -[PKOverlayDrawingController existingViewForUUID:](v139, (uint64_t)v140);

            v193 = (unsigned char *)v57;
            if (v138 && [(id)v57 shouldSolveMathFlagIsSet])
            {
              if (!v141)
              {
                v142 = os_log_create("com.apple.pencilkit", "Math");
                if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(buf.a) = 0;
                  _os_log_impl(&dword_1C44F8000, v142, OS_LOG_TYPE_DEFAULT, "Recreating missing result view", (uint8_t *)&buf, 2u);
                }

                -[PKMathRecognitionViewController _presentResult:mathItem:defaultAnimationType:fromHint:hadOldResult:](v191, v138, (void *)v57, (void *)2, 0, 1);
              }
              if ([(id)v57 isVerticalExpression]) {
                double v143 = -[PKMathRecognitionItem boundsForVerticalExpressionLine]((unsigned char *)v57);
              }
              else {
                double v143 = -[PKMathRecognitionItem boundsForAnyEqualSign]((void *)v57);
              }
              CGFloat v179 = v143;
              CGFloat v180 = v144;
              CGFloat v181 = v145;
              CGFloat v182 = v146;
              v183 = -[PKMathRecognitionViewController view]((id *)v191);
              +[PKMathContextMenuController mathResultControllerForItem:tapBounds:view:delegate:](v179, v180, v181, v182, (uint64_t)PKMathContextMenuController, (void *)v57, v183, (void *)v191);
              v155 = (id *)objc_claimAutoreleasedReturnValue();

              objc_storeStrong((id *)(v191 + 280), v155);
              if (v155) {
                [v155[2] _presentMenuAtLocation:pointa];
              }
              v148 = v62;
            }
            else
            {
              v147 = -[PKMathRecognitionViewController overlayDrawingController]((id *)v191);
              v148 = [(PKOverlayDrawingController *)(uint64_t)v147 tokenAtLocation:pointa.y];

              if (!v148) {
                goto LABEL_157;
              }
              v149 = [v148 errors];
              v150 = [v149 firstObject];
              v151 = [v150 errorString];
              uint64_t v152 = [v151 length];

              if (v152)
              {
                v196 = v141;
                v153 = [v148 errors];
                v154 = [v153 firstObject];
                v155 = [v154 errorString];

                v156 = [v148 errors];
                v157 = [v156 firstObject];
                v158 = [v157 errorReasonString];

                v159 = [v148 item];
                [v148 bounds];
                CGFloat v161 = v160;
                CGFloat v163 = v162;
                CGFloat v165 = v164;
                CGFloat v167 = v166;
                v168 = -[PKMathRecognitionViewController view]((id *)v191);
                +[PKMathContextMenuController mathErrorControllerForItem:token:tapBounds:errorString:errorReasonString:view:delegate:](v161, v163, v165, v167, (uint64_t)PKMathContextMenuController, v159, v148, v155, v158, v168, (void *)v191);
                v169 = (id *)objc_claimAutoreleasedReturnValue();

                objc_storeStrong((id *)(v191 + 280), v169);
                if (v169) {
                  [v169[2] _presentMenuAtLocation:pointa];
                }

                v141 = v196;
              }
              else
              {
LABEL_157:
                if ([v193 isVerticalExpression]) {
                  double v170 = -[PKMathRecognitionItem boundsForVerticalExpressionLine](v193);
                }
                else {
                  double v170 = -[PKMathRecognitionItem boundsForAnyEqualSign](v193);
                }
                CGFloat v174 = v170;
                CGFloat v175 = v171;
                CGFloat v176 = v172;
                CGFloat v177 = v173;
                v178 = -[PKMathRecognitionViewController view]((id *)v191);
                +[PKMathContextMenuController mathCopyControllerForItem:tapBounds:view:delegate:](v174, v175, v176, v177, (uint64_t)PKMathContextMenuController, v193, v178, (void *)v191);
                v155 = (id *)objc_claimAutoreleasedReturnValue();

                objc_storeStrong((id *)(v191 + 280), v155);
                if (v155) {
                  [v155[2] _presentMenuAtLocation:pointa];
                }
              }
            }

            unsigned __int8 v220 = 1;
            id v62 = v148;
            uint64_t v57 = (uint64_t)v193;
          }

          goto LABEL_153;
        }
LABEL_128:

        unsigned __int8 v220 = 0;
LABEL_153:
        id v14 = 0;
        goto LABEL_111;
      }
    }
    else
    {
      v126 = -[PKMathRecognitionItem graphableVariables]((id *)v57);
      if (![v126 count])
      {

        goto LABEL_116;
      }
      int v127 = *(_DWORD *)(v191 + 192);

      if ((v127 & 8) == 0) {
        goto LABEL_116;
      }
    }
    -[PKMathRecognitionViewController _triggerPopupToAddGraphForItem:](v191, (void *)v57);
    goto LABEL_110;
  }
  long long v203 = 0u;
  long long v204 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  -[PKMathRecognitionViewController overlayDrawingController]((id *)v191);
  long long v91 = (id *)objc_claimAutoreleasedReturnValue();
  long long v92 = -[PKOverlayDrawingController allViews](v91);

  uint64_t v93 = [v92 countByEnumeratingWithState:&v201 objects:v222 count:16];
  if (!v93) {
    goto LABEL_128;
  }
  uint64_t v94 = v93;
  uint64_t v95 = v57;
  uint64_t v96 = *(void *)v202;
  while (2)
  {
    uint64_t v97 = 0;
LABEL_90:
    if (*(void *)v202 != v96) {
      objc_enumerationMutation(v92);
    }
    __int16 v98 = *(id **)(*((void *)&v201 + 1) + 8 * v97);
    objc_msgSend(v98, "frame", *(_OWORD *)&v184, *(_OWORD *)&v185, *(_OWORD *)&v186);
    if (!CGRectContainsPoint(v238, pointa))
    {
LABEL_97:
      if (v94 == ++v97)
      {
        uint64_t v101 = [v92 countByEnumeratingWithState:&v201 objects:v222 count:16];
        uint64_t v94 = v101;
        if (!v101)
        {
          uint64_t v57 = v95;
          goto LABEL_128;
        }
        continue;
      }
      goto LABEL_90;
    }
    break;
  }
  if (!v98)
  {
    id v99 = 0;
    goto LABEL_96;
  }
  id v99 = v98[52];
  if (!v99
    || ([*(id *)(v191 + 8) objectForKeyedSubscript:v99],
        (uint64_t v100 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_96:

    goto LABEL_97;
  }
  __int16 v102 = (void *)v100;
  [v98 bounds];
  double v104 = v103;
  double v106 = v105;
  double v108 = v107;
  double v110 = v109;
  v111 = -[PKMathRecognitionViewController view]((id *)v191);
  objc_msgSend(v98, "convertRect:toView:", v111, v104, v106, v108, v110);
  CGFloat v113 = v112;
  CGFloat v115 = v114;
  CGFloat v117 = v116;
  CGFloat v119 = v118;

  memset(&buf, 0, sizeof(buf));
  [(PKMathRecognitionViewController *)&v200 drawingTransform];
  CGAffineTransformInvert(&buf, &v200);
  CGAffineTransform v221 = buf;
  v239.origin.CGFloat x = v113;
  v239.origin.CGFloat y = v115;
  v239.size.double width = v117;
  v239.size.CGFloat height = v119;
  CGRect v240 = CGRectApplyAffineTransform(v239, &v221);
  CGFloat v120 = v240.origin.x;
  CGFloat v121 = v240.origin.y;
  CGFloat v122 = v240.size.width;
  CGFloat v123 = v240.size.height;
  v124 = -[PKMathRecognitionViewController view]((id *)v191);
  +[PKMathContextMenuController mathResultControllerForItem:tapBounds:view:delegate:](v120, v121, v122, v123, (uint64_t)PKMathContextMenuController, v102, v124, (void *)v191);
  v125 = (id *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v191 + 280), v125);
  if (v125) {
    [v125[2] _presentMenuAtLocation:pointa];
  }
  unsigned __int8 v220 = 1;

  id v14 = 0;
  uint64_t v57 = v95;
LABEL_111:

LABEL_112:
  return v220;
}

- (BOOL)handleSingleTapAtDrawingLocation:(CGPoint)a3 fromTapStroke:(BOOL)a4
{
  return [(PKMathRecognitionViewController *)(uint64_t)self _handleSingleTapAtDrawingLocation:a4 fromHover:a3.x fromTapStroke:a3.y];
}

void __93__PKMathRecognitionViewController__handleSingleTapAtDrawingLocation_fromHover_fromTapStroke___block_invoke(uint64_t a1)
{
}

- (void)didEraseStrokes:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v28 + 1) + 8 * i) _strokeUUID];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }

  if (![v5 count])
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_regenerateResultsIfNecessary object:0];
    [(PKMathRecognitionViewController *)self performSelector:sel_regenerateResultsIfNecessary withObject:0 afterDelay:2.0];
    goto LABEL_22;
  }
  id v23 = v6;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = [(NSMutableDictionary *)self->_currentMathItemsLookup allValues];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (!v13) {
    goto LABEL_20;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v25;
  do
  {
    for (uint64_t j = 0; j != v14; ++j)
    {
      if (*(void *)v25 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8 * j);
      expressionsWithActiveAnimations = self->_expressionsWithActiveAnimations;
      double v19 = [v17 uuid];
      if (([(NSMutableSet *)expressionsWithActiveAnimations containsObject:v19] & 1) == 0)
      {
        CGFloat v20 = -[PKMathRecognitionItem strokeUUIDs](v17);
        int v21 = [v5 intersectsSet:v20];

        if (!v21) {
          continue;
        }
        overlayDrawingController = self->_overlayDrawingController;
        double v19 = [v17 uuid];
        -[PKOverlayDrawingController removeViewForUUID:animated:]((id *)&overlayDrawingController->super.isa, v19, 1);
      }
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
  }
  while (v14);
LABEL_20:

  id v6 = v23;
LABEL_22:
}

- (void)regenerateResultsIfNecessary
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = [(NSMutableDictionary *)self->_currentMathItemsLookup allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v21;
    *(void *)&long long v5 = 138477827;
    long long v19 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        currentResultsLookup = self->_currentResultsLookup;
        id v11 = objc_msgSend(v9, "uuid", v19);
        uint64_t v12 = [(NSMutableDictionary *)currentResultsLookup objectForKeyedSubscript:v11];

        -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
        uint64_t v13 = (id *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = [v9 uuid];
        uint64_t v15 = -[PKOverlayDrawingController existingViewForUUID:](v13, (uint64_t)v14);

        if ([v12 length])
        {
          if ([v9 shouldSolveMathFlagIsSet] && v15 == 0)
          {
            uint64_t v17 = os_log_create("com.apple.pencilkit", "Math");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              double v18 = [v9 expression];
              *(_DWORD *)CGAffineTransform buf = v19;
              long long v25 = v18;
              _os_log_impl(&dword_1C44F8000, v17, OS_LOG_TYPE_DEFAULT, "Regenerating missing results view for: %{private}@", buf, 0xCu);
            }
            -[PKMathRecognitionViewController _presentResult:mathItem:defaultAnimationType:fromHint:hadOldResult:]((uint64_t)self, v12, v9, (void *)2, 0, 1);
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }
}

- (void)eraserMovedToLocation:(CGPoint)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)&self->_delegateFlags + 1) & 0x80) != 0)
  {
    double y = a3.y;
    double x = a3.x;
    [(PKMathRecognitionViewController *)v14 drawingTransform];
    float64x2_t v13 = vaddq_f64(v14[2], vmlaq_n_f64(vmulq_n_f64(v14[1], y), v14[0], x));
    -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
    uint64_t v4 = (id *)objc_claimAutoreleasedReturnValue();
    long long v5 = [(PKOverlayDrawingController *)v4 drawingViewAtLocation:v13.f64[1]];

    if (v5)
    {
      id v6 = v5[52];
      if (v6)
      {
        uint64_t v7 = [(NSMutableDictionary *)self->_currentMathItemsLookup objectForKeyedSubscript:v6];
        uint64_t v8 = v7;
        if (v7 && [v7 shouldSolveMathFlagIsSet])
        {
          uint64_t v9 = os_log_create("com.apple.pencilkit", "Math");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            os_log_t v10 = [v8 expression];
            *(_DWORD *)CGAffineTransform buf = 138477827;
            int v16 = v10;
            _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "Remove result for: %{private}@", buf, 0xCu);
          }
          -[PKMathRecognitionViewController _commitSetShouldSolve:undoable:item:]((uint64_t)self, 0, 1, v8);
        }
        goto LABEL_11;
      }
    }
    else
    {
      id v6 = 0;
    }
    uint64_t v8 = 0;
LABEL_11:
  }
}

- (void)_commitSetShouldSolve:(uint64_t)a3 undoable:(void *)a4 item:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a4;
  uint64_t v8 = v7;
  if (a1 && (*(unsigned char *)(a1 + 193) & 0x80) != 0)
  {
    uint64_t v9 = -[PKMathRecognitionItem heroStroke](v7);
    if (v9)
    {
      os_log_t v10 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [v8 expression];
        v15[0] = 67109379;
        v15[1] = a2;
        __int16 v16 = 2113;
        uint64_t v17 = v11;
        _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Commit set should solve: %{BOOL}d, for: %{private}@", (uint8_t *)v15, 0x12u);
      }
      int v12 = *(_DWORD *)(a1 + 192);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 240));
      uint64_t v14 = WeakRetained;
      if ((v12 & 0x4000) != 0) {
        [WeakRetained mathViewController:a1 setShouldSolve:a2 item:v8 heroStroke:v9 flag:0x20000000000 undoable:a3];
      }
      else {
        [WeakRetained mathViewController:a1 setShouldSolve:a2 item:v8 heroStroke:v9 flag:0x20000000000];
      }
    }
  }
}

- (void)didBeginDrawing
{
  -[PKMathRecognitionViewController cancelOpenPopoverForHint]((uint64_t)self);
  -[PKMathRecognitionViewController cancelOpenPopoverForAddingGraph]((uint64_t)self);
  -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKOverlayDrawingController didBeginDrawing]((uint64_t)v3);
}

- (void)dismissPopovers
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PKMathRecognitionViewController_dismissPopovers__block_invoke;
  block[3] = &unk_1E64C61C0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __50__PKMathRecognitionViewController_dismissPopovers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) activeScrubberView];
  BOOL v3 = v2 != 0;
  if (v2) {
    [*(id *)(a1 + 32) hideScrubber];
  }
  uint64_t v4 = *(id **)(a1 + 32);
  if (v4[5])
  {
    [*(id *)(a1 + 32) hideMathFloatingLabelView];
    uint64_t v4 = *(id **)(a1 + 32);
    BOOL v3 = 1;
  }
  if (!v4[6]) {
    goto LABEL_16;
  }
  id v5 = [v4 viewControllerForPresentingUI];
  if (!v5)
  {
    id v6 = v4 + 31;
    id WeakRetained = objc_loadWeakRetained(v6);
    uint64_t v8 = [WeakRetained nextResponder];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = WeakRetained;
LABEL_11:
      id v5 = v8;
      id WeakRetained = v9;
      uint64_t v9 = v5;
    }
    else
    {
      while (1)
      {
        uint64_t v9 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }

        uint64_t v8 = [v8 nextResponder];
        objc_opt_class();
        id WeakRetained = v9;
        if (objc_opt_isKindOfClass()) {
          goto LABEL_11;
        }
      }
      id v5 = 0;
    }

    if (!v5)
    {
      id v10 = objc_loadWeakRetained(v6);
      id v11 = [v10 window];
      id v5 = [v11 rootViewController];
    }
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__PKMathRecognitionViewController_dismissPopovers__block_invoke_2;
  float64x2_t v14[3] = &unk_1E64C61C0;
  v14[4] = *(void *)(a1 + 32);
  [v5 dismissViewControllerAnimated:1 completion:v14];

  uint64_t v4 = *(id **)(a1 + 32);
  if (v4)
  {
LABEL_16:
    int v12 = (id *)v4[35];
    if (v12) {
      [v12[2] dismissMenu];
    }
  }
  if (v3)
  {
    float64x2_t v13 = -[PKMathRecognitionViewController tiledView](*(id **)(a1 + 32));
    [v13 _pauseHoverPreviewForTimeInterval:0.1];
  }
}

void __50__PKMathRecognitionViewController_dismissPopovers__block_invoke_2(uint64_t a1)
{
}

- (id)hitTest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(PKCalculateScrubberController *)self->_scrubberController activeScrubberView];
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
    objc_msgSend(WeakRetained, "convertPoint:toView:", v6, x, y);
    double v9 = v8;
    double v11 = v10;

    int v12 = objc_msgSend(v6, "hitTest:withEvent:", 0, v9, v11);
    float64x2_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __43__PKMathRecognitionViewController_hitTest___block_invoke;
      block[3] = &unk_1E64C61C0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
      id v14 = v6;
    }
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __43__PKMathRecognitionViewController_hitTest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideScrubber];
}

- (id)adjustedSelectedStrokes:(id)a3 selectionPath:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [MEMORY[0x1E4F1CA80] set];
  id v9 = v7;
  if ([v9 CGPath])
  {
    id v59 = v9;
    id v60 = v6;
    [v9 bounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    memset(&v74, 0, sizeof(v74));
    [(PKMathRecognitionViewController *)&v73 drawingTransform];
    CGAffineTransformInvert(&v74, &v73);
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
    uint64_t v18 = (id *)objc_claimAutoreleasedReturnValue();
    long long v19 = -[PKOverlayDrawingController allViews](v18);

    uint64_t v20 = [v19 countByEnumeratingWithState:&v69 objects:v76 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v63 = *(void *)v70;
      double v61 = v19;
      id v62 = self;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v70 != v63) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void *)(*((void *)&v69 + 1) + 8 * v22);
          long long v24 = -[PKOverlayDrawingView imageView]((id *)v23);

          if (v24)
          {
            long long v25 = -[PKMathRecognitionViewController view]((id *)&self->super.isa);
            long long v26 = -[PKOverlayDrawingView imageView]((id *)v23);
            [v26 bounds];
            double v28 = v27;
            double v30 = v29;
            double v32 = v31;
            double v34 = v33;
            CGFloat v35 = -[PKOverlayDrawingView imageView]((id *)v23);
            objc_msgSend(v25, "convertRect:fromView:", v35, v28, v30, v32, v34);
            CGFloat v37 = v36;
            CGFloat v39 = v38;
            CGFloat v41 = v40;
            CGFloat v43 = v42;

            CGAffineTransform v68 = v74;
            v79.origin.double x = v37;
            v79.origin.double y = v39;
            v79.size.double width = v41;
            v79.size.CGFloat height = v43;
            CGRect v80 = CGRectApplyAffineTransform(v79, &v68);
            v81.origin.double x = v11;
            v81.origin.double y = v13;
            v81.size.double width = v15;
            v81.size.CGFloat height = v17;
            if (CGRectIntersectsRect(v80, v81))
            {
              if (CGPathIntersectsRect())
              {
                if (v23) {
                  CGRect v44 = *(void **)(v23 + 416);
                }
                else {
                  CGRect v44 = 0;
                }
                id v45 = v44;
                id v46 = [(NSMutableDictionary *)self->_currentMathItemsLookup objectForKeyedSubscript:v45];
                double v47 = v46;
                if (v46)
                {
                  long long v66 = 0u;
                  long long v67 = 0u;
                  long long v64 = 0u;
                  long long v65 = 0u;
                  double v48 = [v46 strokes];
                  uint64_t v49 = [v48 countByEnumeratingWithState:&v64 objects:v75 count:16];
                  if (v49)
                  {
                    uint64_t v50 = v49;
                    uint64_t v51 = *(void *)v65;
                    do
                    {
                      for (uint64_t i = 0; i != v50; ++i)
                      {
                        if (*(void *)v65 != v51) {
                          objc_enumerationMutation(v48);
                        }
                        double v53 = [*(id *)(*((void *)&v64 + 1) + 8 * i) _strokeUUID];
                        [v8 addObject:v53];
                      }
                      uint64_t v50 = [v48 countByEnumeratingWithState:&v64 objects:v75 count:16];
                    }
                    while (v50);
                  }

                  self = v62;
                  long long v19 = v61;
                }
              }
            }
          }
          ++v22;
        }
        while (v22 != v21);
        uint64_t v54 = [v19 countByEnumeratingWithState:&v69 objects:v76 count:16];
        uint64_t v21 = v54;
      }
      while (v54);
    }

    id v9 = v59;
    id v6 = v60;
  }
  if ([v8 count])
  {
    uint64_t v55 = [v6 allObjects];
    [v8 addObjectsFromArray:v55];

    id v56 = (id)[v8 copy];
  }
  else
  {
    id v56 = v6;
  }
  uint64_t v57 = v56;

  return v57;
}

- (void)overlayController:(id)a3 imageViewForStrokes:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = -[PKMathRecognitionViewController tiledView]((id *)&self->super.isa);
  double v10 = -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__PKMathRecognitionViewController_overlayController_imageViewForStrokes_completion___block_invoke;
  v13[3] = &unk_1E64C9D48;
  id v14 = v9;
  CGFloat v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v9;
  -[PKMathRecognitionViewController _imageViewForStrokes:drawing:completion:]((uint64_t)self, v8, v10, v13);
}

void __84__PKMathRecognitionViewController_overlayController_imageViewForStrokes_completion___block_invoke(uint64_t a1, void *a2)
{
  id v21 = a2;
  [v21 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = *(void **)(a1 + 32);
  id v12 = -[PKMathRecognitionViewController view](*(id **)(a1 + 40));
  objc_msgSend(v11, "convertRect:toView:", v12, v4, v6, v8, v10);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_imageViewForStrokes:(void *)a3 drawing:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    double v10 = -[PKMathRecognitionViewController tiledView]((id *)a1);
    if ((*(unsigned char *)(a1 + 192) & 0x20) != 0
      && (id WeakRetained = objc_loadWeakRetained((id *)(a1 + 240)),
          [WeakRetained mathViewController:a1 coordinateSpaceForDrawing:v8],
          id v12 = objc_claimAutoreleasedReturnValue(),
          WeakRetained,
          v12))
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v16 = 0u;
      [(PKMathRecognitionViewController *)&v16 drawingTransformFromDelegate];
      double v13 = [v10 selectionController];
      v15[0] = v16;
      v15[1] = v17;
      _DWORD v15[2] = v18;
      -[PKSelectionController _imageViewForStrokes:drawing:drawingTransform:coordinateSpace:completion:]((uint64_t)v13, v7, v8, v15, v12, v9);
    }
    else
    {
      double v14 = [v10 selectionController];
      -[PKSelectionController _imageViewForStrokes:drawing:completion:]((uint64_t)v14, v7, v8, v9);
    }
  }
}

- (void)overlayController:(id)a3 willUpdateView:(id)a4 animationDuration:(double)a5
{
  -[PKMathRecognitionViewController tiledView]((id *)&self->super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 _pauseHoverPreviewForTimeInterval:0.5];
}

- (CGAffineTransform)overlayControllerDrawingTransform:(SEL)a3
{
  [(PKMathRecognitionViewController *)retstr drawingTransform];
  return result;
}

void __75__PKMathRecognitionViewController__maskImageForStrokes_drawing_completion___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 selectionController];
  -[PKSelectionController _maskImageForStrokes:drawing:imageView:completion:]((uint64_t)v5, *(void *)(a1 + 40), *(void *)(a1 + 48), v4, *(void **)(a1 + 56));
}

- (void)mathRecognitionController:(id)a3 didUpdateExpressions:(id)a4 newItems:(id)a5 removedItems:(id)a6 mathItems:(id)a7
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v66 = a5;
  id v62 = a6;
  id v12 = a7;
  -[PKMathRecognitionViewController cancelOpenPopoverForHint]((uint64_t)self);
  -[PKMathRecognitionViewController cancelOpenPopoverForAddingGraph]((uint64_t)self);
  double v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obuint64_t j = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
  uint64_t v63 = v11;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v76 != v16) {
          objc_enumerationMutation(obj);
        }
        long long v18 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        currentMathItemsLookup = self->_currentMathItemsLookup;
        double v20 = [v18 uuid];
        id v21 = [(NSMutableDictionary *)currentMathItemsLookup objectForKeyedSubscript:v20];

        uint64_t v22 = [v18 uuid];
        [v13 setObject:v18 forKeyedSubscript:v22];

        if (v21)
        {
          uint64_t v23 = [v18 uuid];
          if ([v11 containsObject:v23])
          {
          }
          else
          {
            long long v24 = [v18 uuid];
            char v25 = [v66 containsObject:v24];

            id v11 = v63;
            if ((v25 & 1) == 0) {
              -[PKMathRecognitionItem _updateFromOldItem:]((uint64_t)v18, v21);
            }
          }
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
    }
    while (v15);
  }

  long long v26 = (NSMutableDictionary *)[v13 copy];
  double v27 = self->_currentMathItemsLookup;
  self->_currentMathItemsLookup = v26;

  double v28 = [v66 setByAddingObjectsFromSet:v11];
  double v29 = (void *)[v28 mutableCopy];

  double v30 = (void *)[v62 mutableCopy];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  double v61 = v29;
  id v64 = (id)[v29 copy];
  uint64_t v31 = [v64 countByEnumeratingWithState:&v71 objects:v84 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v72 != v33) {
          objc_enumerationMutation(v64);
        }
        uint64_t v35 = *(void *)(*((void *)&v71 + 1) + 8 * j);
        double v36 = [v13 objectForKeyedSubscript:v35];
        if (!v36) {
          goto LABEL_31;
        }
        int v37 = [v66 containsObject:v35];
        double v38 = os_log_create("com.apple.pencilkit", "Math");
        BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
        if (v37)
        {
          if (v39)
          {
            double v40 = [v36 expression];
            [v36 sortIndex];
            *(_DWORD *)CGAffineTransform buf = 138478083;
            CGRect v81 = v40;
            __int16 v82 = 2048;
            uint64_t v83 = v41;
            double v42 = v38;
            CGFloat v43 = "New expression: %{private}@, sortOrder: %g";
LABEL_24:
            _os_log_impl(&dword_1C44F8000, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 0x16u);
          }
        }
        else if (v39)
        {
          double v40 = [v36 expression];
          [v36 sortIndex];
          *(_DWORD *)CGAffineTransform buf = 138478083;
          CGRect v81 = v40;
          __int16 v82 = 2048;
          uint64_t v83 = v44;
          double v42 = v38;
          CGFloat v43 = "Updated expression: %{private}@, sortOrder: %g";
          goto LABEL_24;
        }

        if (![v36 shouldBeSolved]
          || (-[PKMathRecognitionViewController drawing]((id *)&self->super.isa),
              id v45 = objc_claimAutoreleasedReturnValue(),
              char v46 = [v36 isValidForDrawing:v45],
              v45,
              (v46 & 1) == 0))
        {
          double v47 = -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
          char v48 = [v36 isValidForDrawing:v47];

          if ((v48 & 1) == 0)
          {
            uint64_t v49 = os_log_create("com.apple.pencilkit", "Math");
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v50 = [v36 expression];
              *(_DWORD *)CGAffineTransform buf = 138477827;
              CGRect v81 = v50;
              _os_log_impl(&dword_1C44F8000, v49, OS_LOG_TYPE_DEFAULT, "Detected stale item: %{private}@", buf, 0xCu);
            }
          }
LABEL_31:
          [v30 addObject:v35];
        }
      }
      uint64_t v32 = [v64 countByEnumeratingWithState:&v71 objects:v84 count:16];
    }
    while (v32);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v51 = v30;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v67 objects:v79 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v68;
    do
    {
      for (uint64_t k = 0; k != v53; ++k)
      {
        if (*(void *)v68 != v54) {
          objc_enumerationMutation(v51);
        }
        id v56 = *(void **)(*((void *)&v67 + 1) + 8 * k);
        -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
        uint64_t v57 = (id *)objc_claimAutoreleasedReturnValue();
        -[PKOverlayDrawingController removeViewForUUID:animated:](v57, v56, 1);
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v67 objects:v79 count:16];
    }
    while (v53);
  }

  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  [WeakRetained mathViewController:self didUpdateExpressions:v63 newExpressions:v66 removedExpressions:v62 mathItems:obj];

  uint64_t v59 = -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
  id v60 = (void *)v59;
  if (v59) {
    -[PKOverlayDrawingController _removeOldTokenViewsExcludeItems:](v59, v63);
  }
}

- (double)mathRecognitionControllerTimestampForLatestUserInteraction:(id)a3
{
  id v4 = -[PKMathRecognitionViewController tiledView]((id *)&self->super.isa);
  [v4 timestampForLatestUserInteraction];
  double v6 = v5;

  if ((*((unsigned char *)&self->_delegateFlags + 2) & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained mathViewControllerTimestampForLatestUserInteraction:self];
    double v6 = v8;
  }
  return v6;
}

- (void)mathRecognitionController:(id)a3 solveStateChangedForExpressions:(id)a4 mathItems:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v16 = [v15 uuid];
        [v9 setObject:v15 forKeyedSubscript:v16];

        currentMathItemsLookup = self->_currentMathItemsLookup;
        long long v18 = [v15 uuid];
        double v19 = [(NSMutableDictionary *)currentMathItemsLookup objectForKeyedSubscript:v18];

        if (v19) {
          -[PKMathRecognitionItem _updateFromOldItem:]((uint64_t)v15, v19);
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v12);
  }
  uint64_t v33 = v10;

  double v20 = (NSMutableDictionary *)[v9 copy];
  id v21 = self->_currentMathItemsLookup;
  self->_currentMathItemsLookup = v20;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v22 = v7;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v22);
        }
        double v27 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        double v28 = [v9 objectForKeyedSubscript:v27];
        if ([v28 shouldSolveMathFlagIsSet])
        {
          double v29 = [(NSMutableDictionary *)self->_currentResultsLookup objectForKeyedSubscript:v27];
          -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
          double v30 = (id *)objc_claimAutoreleasedReturnValue();
          uint64_t v31 = -[PKOverlayDrawingController existingViewForUUID:](v30, (uint64_t)v27);

          if (v31) {
            BOOL v32 = 1;
          }
          else {
            BOOL v32 = v29 == 0;
          }
          if (!v32) {
            -[PKMathRecognitionViewController _presentResult:mathItem:defaultAnimationType:fromHint:hadOldResult:]((uint64_t)self, v29, v28, (void *)2, 0, 0);
          }
        }
        else
        {
          double v29 = -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
          -[PKOverlayDrawingController removeViewForUUID:animated:]((id *)v29, v27, 1);
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v24);
  }
}

- (void)mathRecognitionController:(id)a3 didEraseStrokesInExpressions:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        uuidForLatestLiveVariableExpression = self->_uuidForLatestLiveVariableExpression;
        if (!uuidForLatestLiveVariableExpression
          || ([(NSUUID *)uuidForLatestLiveVariableExpression isEqual:*(void *)(*((void *)&v14 + 1) + 8 * v9)] & 1) == 0)
        {
          uint64_t v12 = [(NSMutableDictionary *)self->_currentMathItemsLookup objectForKeyedSubscript:v10];
          if (v12
            && ([(NSMutableSet *)self->_expressionsWithActiveAnimations containsObject:v10] & 1) == 0)
          {
            -[PKOverlayDrawingController removeViewForUUID:animated:]((id *)&self->_overlayDrawingController->super.isa, v10, 1);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  uint64_t v13 = self->_uuidForLatestLiveVariableExpression;
  self->_uuidForLatestLiveVariableExpression = 0;
}

- (void)hideMathFloatingLabelView
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_hideMathFloatingLabelView object:0];
  [(UIView *)self->_mathFloatingLabelView removeFromSuperview];
  mathFloatingLabelView = self->_mathFloatingLabelView;
  self->_mathFloatingLabelView = 0;
}

void __66__PKMathRecognitionViewController__showDetectionAnimationForItem___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v26 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v12 = -[PKMathRecognitionViewController view](*(id **)(a1 + 32));
    uint64_t v13 = [v12 tintColor];
    long long v14 = [v26 imageWithTintColor:v13];

    long long v15 = *(void **)(a1 + 40);
    id v16 = objc_loadWeakRetained(WeakRetained + 31);
    objc_msgSend(v15, "convertRect:toView:", v16, a3, a4, a5, a6);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    uint64_t v25 = -[PKMathRecognitionViewController overlayDrawingController](WeakRetained);
    -[PKOverlayDrawingController showDetectionAnimationWithImage:frame:]((uint64_t)v25, v14, v18, v20, v22, v24);

    id v26 = v14;
  }
}

- (void)_sendUpdatedResult:(void *)a3 strokes:(void *)a4 uuid:
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 193))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 240));
      [WeakRetained mathViewController:a1 updatedResult:v10 strokes:v7 expressionUUID:v8];
    }
    if ([(id)a1 shouldCacheDrawingForResults])
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a1 selector:sel__updateDrawingOverlayCache object:0];
      [(id)a1 performSelector:sel__updateDrawingOverlayCache withObject:0 afterDelay:0.1];
    }
  }
}

- (void)mathResult:(id)a3 itemUUID:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_currentMathItemsLookup objectForKeyedSubscript:v7];
  uint64_t v9 = v8;
  if (v8 && -[NSObject shouldBeSolved](v8, "shouldBeSolved") && [v6 length])
  {
    id v10 = -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
    if ([v9 isValidForDrawing:v10])
    {
      int v11 = [v9 isLowConfidenceMath];

      if (!v11)
      {
        currentResultsLookup = self->_currentResultsLookup;
        uint64_t v13 = [v9 uuid];
        long long v14 = [(NSMutableDictionary *)currentResultsLookup objectForKeyedSubscript:v13];

        long long v15 = self->_currentResultsLookup;
        id v16 = [v9 uuid];
        [(NSMutableDictionary *)v15 setObject:v6 forKeyedSubscript:v16];

        double v17 = -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
        double v18 = -[PKMathRecognitionItem _heroStrokeInDrawing:](v9, v17);

        if ([(PKMathRecognitionViewController *)self solvingStyle])
        {
          if (([v9 shouldSolveMathFlagIsSet] & 1) == 0)
          {
            if (-[PKMathRecognitionItem isRecentlyModified]((double *)v9)
              && [(PKMathRecognitionViewController *)self solvingStyle] == 1)
            {
              double v19 = [v9 uuid];
              popoverHintItemUUID = self->_popoverHintItemUUID;
              self->_popoverHintItemUUID = v19;

              -[PKMathRecognitionViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_openPopoverForHint, 0, -[PKMathRecognitionItem _remainingDelayForTargetDelay:](v9, 0.7));
            }
            goto LABEL_38;
          }
        }
        else
        {
          int v32 = -[PKMathRecognitionItem isRecentlyModified]((double *)v9);
          int v33 = v32;
          if ((*((unsigned char *)&self->_delegateFlags + 1) & 0x80) != 0
            && v32
            && v18
            && ([v9 shouldSolveMathFlagIsSet] & 1) == 0)
          {
            -[PKMathRecognitionViewController _commitSetShouldSolve:undoable:item:]((uint64_t)self, 1, 0, v9);
          }
          else if ((([v9 shouldSolveMathFlagIsSet] | v33) & 1) == 0)
          {
LABEL_38:
            long long v34 = os_log_create("com.apple.pencilkit", "Math");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              long long v35 = [v9 expression];
              int v37 = 138478083;
              long long v38 = v35;
              __int16 v39 = 2113;
              id v40 = v6;
              _os_log_impl(&dword_1C44F8000, v34, OS_LOG_TYPE_DEFAULT, "Should not show results for expression: %{private}@, result: %{private}@", (uint8_t *)&v37, 0x16u);
            }
            -[PKMathRecognitionItem _logRecentlyModifiedAndCreated](v9);
            long long v36 = -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
            -[PKOverlayDrawingController hideImageForUUID:]((uint64_t)v36, v7);

            -[PKMathRecognitionViewController _sendUpdatedResult:strokes:uuid:]((uint64_t)self, 0, MEMORY[0x1E4F1CBF0], v7);
            goto LABEL_43;
          }
        }
        -[PKMathRecognitionViewController _presentResult:mathItem:defaultAnimationType:fromHint:hadOldResult:]((uint64_t)self, v6, v9, (void *)2, 0, v14 != 0);
LABEL_43:

        goto LABEL_30;
      }
    }
    else
    {
    }
  }
  if ([v9 shouldBeSolved])
  {
    double v21 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      double v22 = [v9 expression];
      double v23 = -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
      int v37 = 138478595;
      long long v38 = v22;
      __int16 v39 = 2113;
      id v40 = v6;
      __int16 v41 = 1024;
      int v42 = [v9 isValidForDrawing:v23];
      __int16 v43 = 1024;
      int v44 = [v9 isLowConfidenceMath];
      _os_log_impl(&dword_1C44F8000, v21, OS_LOG_TYPE_DEFAULT, "Skipping presenting result for expression: %{private}@, result: %{private}@, valid: %{BOOL}d, lowConfidence: %{BOOL}d", (uint8_t *)&v37, 0x22u);
    }
  }
  double v24 = -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
  -[PKOverlayDrawingController hideImageForUUID:]((uint64_t)v24, v7);

  -[PKMathRecognitionViewController _sendUpdatedResult:strokes:uuid:]((uint64_t)self, 0, MEMORY[0x1E4F1CBF0], v7);
  if (v9)
  {
    liveVariable = self->_liveVariable;
    if (liveVariable) {
      liveVariable = (PKLiveMathVariable *)liveVariable->_mathItem;
    }
    id v26 = liveVariable;
    double v27 = v9;
    if (v26 == (PKLiveMathVariable *)v9) {
      goto LABEL_28;
    }
    p_super = &v26->super;
    if (-[PKMathRecognitionItem isRecentlyModified]((double *)v9))
    {
      double v29 = [(NSMutableDictionary *)self->_currentResultsLookup objectForKeyedSubscript:v7];
      if (v29)
      {

LABEL_23:
        double v27 = os_log_create("com.apple.pencilkit", "Math");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          double v30 = [v9 expression];
          int v37 = 138477827;
          long long v38 = v30;
          _os_log_impl(&dword_1C44F8000, v27, OS_LOG_TYPE_DEFAULT, "Detected math item with no result and no error: %{private}@", (uint8_t *)&v37, 0xCu);
        }
        goto LABEL_28;
      }
      if ((-[PKMathRecognitionItem hasAnyErrors]((uint64_t)v9) & 1) == 0)
      {
        int v31 = [v9 shouldBeSolved];

        if (!v31) {
          goto LABEL_29;
        }
        goto LABEL_23;
      }
    }
    double v27 = p_super;
LABEL_28:
  }
LABEL_29:
  [(NSMutableDictionary *)self->_currentResultsLookup setObject:0 forKeyedSubscript:v7];
  [(NSMutableDictionary *)self->_currentResultsAttributionLookup setObject:0 forKeyedSubscript:v7];
  [(NSMutableDictionary *)self->_currentResultsDrawings setObject:0 forKeyedSubscript:v7];
LABEL_30:
}

- (void)mathResultAttributionImage:(id)a3 darkModeImage:(id)a4 string:(id)a5 date:(id)a6 itemUUID:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v18 && v12)
  {
    id v15 = a7;
    id v16 = objc_alloc_init(PKMathResultAttribution);
    -[PKMathResultAttribution setImage:]((uint64_t)v16, v18);
    -[PKMathResultAttribution setDarkModeImage:]((uint64_t)v16, v12);
    -[PKMathResultAttribution setDate:]((uint64_t)v16, v14);
    -[PKMathResultAttribution setString:]((uint64_t)v16, v13);
    [(NSMutableDictionary *)self->_currentResultsAttributionLookup setObject:v16 forKeyedSubscript:v15];
  }
  else
  {
    currentResultsAttributionLookup = self->_currentResultsAttributionLookup;
    id v16 = (PKMathResultAttribution *)a7;
    [(NSMutableDictionary *)currentResultsAttributionLookup setObject:0 forKeyedSubscript:v16];
  }
}

id __112__PKMathRecognitionViewController__emitMathUsageForItem_usage_recognitionLatency_synthesisLatency_hadOldResult___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(a1 + 32) copy];

  return v1;
}

id __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) mathViewController:*(void *)(a1 + 40) resultForLocale:a2 itemUUID:*(void *)(a1 + 48)];
}

void __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id *)(a1 + 72);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v6 = [v3 strokes];
    id v7 = *(void **)(a1 + 32);
    id v8 = -[PKMathRecognitionViewController drawing](WeakRetained);
    LOBYTE(v7) = [v7 isValidForDrawing:v8];

    if (v7)
    {
      id v9 = WeakRetained[4];
      id v10 = [*(id *)(a1 + 32) uuid];
      [v9 setObject:v3 forKeyedSubscript:v10];
    }
    else
    {
      int v11 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        double v12 = [*(id *)(a1 + 32) expression];
        *(_DWORD *)CGAffineTransform buf = 138477827;
        double v73 = v12;
        _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "Synthesize found invalid math item for expression: %{private}@", buf, 0xCu);
      }
      id v13 = WeakRetained[4];
      id v14 = [*(id *)(a1 + 32) uuid];
      [v13 setObject:0 forKeyedSubscript:v14];

      id v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
    +[PKDrawing _boundingBoxForStrokeArray:v6];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    double v23 = -[PKMathRecognitionViewController drawing](WeakRetained);
    double v24 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      double v25 = [*(id *)(a1 + 32) expression];
      double v26 = *(double *)(a1 + 40);
      *(_DWORD *)CGAffineTransform buf = 138478083;
      double v73 = v25;
      __int16 v74 = 2113;
      double v75 = v26;
      _os_log_impl(&dword_1C44F8000, v24, OS_LOG_TYPE_DEFAULT, "Updating drawing view for: %{private}@, result: %{private}@", buf, 0x16u);
    }
    v81.origin.double x = v16;
    v81.origin.double y = v18;
    v81.size.double width = v20;
    v81.size.CGFloat height = v22;
    double MaxX = CGRectGetMaxX(v81);
    [*(id *)(a1 + 48) canvasWidth];
    double v29 = v28;
    [*(id *)(a1 + 48) canvasWidth];
    if (v30 <= 0.0) {
      goto LABEL_48;
    }
    if (![v6 count]) {
      goto LABEL_48;
    }
    int v31 = *(id **)(a1 + 48);
    if (v31)
    {
      int v32 = -[PKMathRecognitionViewController tiledView](v31);
      int v33 = [v32 selectionController];
      char v34 = -[PKSelectionController hasStrokesOrElementsSelection](v33);

      if (v34) {
        goto LABEL_48;
      }
    }
    if (*(unsigned char *)(a1 + 96)
      || (double v35 = MaxX - v29, v35 <= 4.0)
      || (-[PKMathRecognitionItem isRecentlyModified](*(double **)(a1 + 32)) & 1) == 0 && !*(unsigned char *)(a1 + 97))
    {
LABEL_48:
      if (*(unsigned char *)(a1 + 96))
      {
        uint64_t v48 = 0;
      }
      else
      {
        uint64_t v48 = *(void *)(a1 + 80);
        if (-[PKMathRecognitionItem isRecentlyModified](*(double **)(a1 + 32)) && !*(unsigned char *)(a1 + 98))
        {
          if (!*(unsigned char *)(a1 + 97)) {
            -[PKMathRecognitionViewController _showDetectionAnimationForItem:](WeakRetained, *(void **)(a1 + 32));
          }
          uint64_t v48 = 1;
        }
      }
      -[PKMathRecognitionViewController overlayDrawingController](WeakRetained);
      double v47 = (id *)objc_claimAutoreleasedReturnValue();
      -[PKOverlayDrawingController updateDrawingView:strokes:animationType:result:imageView:](v47, *(void **)(a1 + 64), v6, (void *)v48, *(void **)(a1 + 40), 0);
    }
    else
    {
      long long v36 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CGAffineTransform buf = 0;
        _os_log_impl(&dword_1C44F8000, v36, OS_LOG_TYPE_DEFAULT, "Triggering wink animation", buf, 2u);
      }

      double v37 = v35 + 20.0;
      [*(id *)(a1 + 32) bounds];
      double v39 = v38;
      [v3 bounds];
      double v41 = fmax(1.0 - v37 / (v39 + v40), 0.5);
      id v42 = WeakRetained[22];
      __int16 v43 = [*(id *)(a1 + 32) uuid];
      [v42 addObject:v43];

      int v44 = -[PKMathRecognitionViewController overlayDrawingController](WeakRetained);
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_161;
      v62[3] = &unk_1E64C9E88;
      uint64_t v63 = (id *)*(id *)(a1 + 32);
      id v64 = WeakRetained;
      id v65 = *(id *)(a1 + 56);
      id v45 = v23;
      uint64_t v46 = *(void *)(a1 + 48);
      id v66 = v45;
      uint64_t v67 = v46;
      double v71 = v41;
      id v68 = *(id *)(a1 + 64);
      id v69 = v6;
      id v70 = *(id *)(a1 + 40);
      [WeakRetained overlayController:v44 imageViewForStrokes:v69 completion:v62];

      double v47 = v63;
    }

    uint64_t v49 = *(void **)(a1 + 40);
    uint64_t v50 = [*(id *)(a1 + 32) uuid];
    -[PKMathRecognitionViewController _sendUpdatedResult:strokes:uuid:]((uint64_t)WeakRetained, v49, v6, v50);

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v52 = v51;
    double v53 = -[PKMathRecognitionItem mostRecentStrokeTimestamp](*(void **)(a1 + 32));
    if (v52 - v53 < 5.0)
    {
      double v54 = *(double *)(a1 + 88);
      if ([v6 count])
      {
        if (!*(unsigned char *)(a1 + 96) && ![*(id *)(a1 + 48) solvingStyle])
        {
          uint64_t v55 = os_log_create("com.apple.pencilkit", "Math");
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)CGAffineTransform buf = 134284289;
            double v73 = v53;
            __int16 v74 = 2049;
            double v75 = v52;
            __int16 v76 = 2049;
            double v77 = v52 - v53;
            __int16 v78 = 2049;
            double v79 = v52 - v54;
            _os_log_impl(&dword_1C44F8000, v55, OS_LOG_TYPE_DEFAULT, "Most recent stroke timestamp: %{private}f, Synthesized drawing timestamp: %{private}f, MathRecognitionToDrawing: %{private}f, SynthesizeTimeInterval: %{private}f", buf, 0x2Au);
          }

          if (os_variant_has_internal_ui())
          {
            id v56 = _PKSignpostLog();
            if (os_signpost_enabled(v56))
            {
              *(_DWORD *)CGAffineTransform buf = 134217984;
              double v73 = v52 - v53;
              _os_signpost_emit_with_name_impl(&dword_1C44F8000, v56, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MathRecognitionToDrawing", "%f", buf, 0xCu);
            }

            uint64_t v57 = os_log_create("com.apple.pencilkit", "");
            if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)CGAffineTransform buf = 0;
              _os_log_impl(&dword_1C44F8000, v57, OS_LOG_TYPE_INFO, "DISCRETE \"MathRecognitionToDrawing\"", buf, 2u);
            }
          }
          if (*(unsigned char *)(a1 + 96)) {
            uint64_t v58 = 3;
          }
          else {
            uint64_t v58 = 1;
          }
          -[PKMathRecognitionViewController _emitMathUsageForItem:usage:recognitionLatency:synthesisLatency:hadOldResult:](*(void *)(a1 + 48), *(void **)(a1 + 32), v58, (uint64_t)((*(double *)(a1 + 88) - v53) * 1000.0), (uint64_t)((v52 - *(double *)(a1 + 88)) * 1000.0), *(unsigned __int8 *)(a1 + 98));
        }
      }
    }
    dispatch_time_t v59 = dispatch_time(0, 100000000);
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_165;
    v60[3] = &unk_1E64C5998;
    objc_copyWeak(&v61, v4);
    dispatch_after(v59, MEMORY[0x1E4F14428], v60);
    objc_destroyWeak(&v61);
  }
}

void __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_161(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) strokes];
  id v5 = +[PKStroke copyStrokes:v4 hidden:1];

  id v6 = *(id **)(a1 + 40);
  id v7 = -[PKMathRecognitionViewController overlayDrawingController](v6);
  id v8 = [*(id *)(a1 + 32) strokes];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  _DWORD v15[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_2_163;
  long long v15[3] = &unk_1E64C9E60;
  id v16 = *(id *)(a1 + 48);
  id v17 = v5;
  id v9 = *(id *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  int v11 = *(void **)(a1 + 72);
  id v18 = v9;
  uint64_t v19 = v10;
  uint64_t v26 = *(void *)(a1 + 96);
  uint64_t v12 = *(void *)(a1 + 40);
  id v20 = v3;
  uint64_t v21 = v12;
  id v22 = v11;
  id v23 = *(id *)(a1 + 80);
  id v24 = *(id *)(a1 + 88);
  id v25 = *(id *)(a1 + 32);
  id v13 = v3;
  id v14 = v5;
  [v6 overlayController:v7 imageViewForStrokes:v8 completion:v15];
}

void __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_2_163(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _setAdditionalStrokes:*(void *)(a1 + 40) inDrawing:*(void *)(a1 + 48) completion:&__block_literal_global_67];
  id v4 = -[PKMathRecognitionViewController view](*(id **)(a1 + 56));
  [v4 addSubview:v3];

  id v5 = -[PKMathRecognitionViewController view](*(id **)(a1 + 56));
  [v5 addSubview:*(void *)(a1 + 64)];

  [v3 frame];
  double v7 = v6;
  double v9 = v8;
  CGFloat v45 = v11;
  CGFloat v46 = v10;
  DKDScaleRectAroundPoint(v6, v8, v10, v11, v6, v8, *(CGFloat *)(a1 + 112));
  uint64_t v40 = v13;
  uint64_t v41 = v12;
  uint64_t v38 = v15;
  uint64_t v39 = v14;
  [*(id *)(a1 + 64) frame];
  CGFloat v43 = v17;
  CGFloat v44 = v16;
  CGFloat v42 = v18;
  CGFloat v20 = v19;
  DKDScaleRectAroundPoint(v16, v17, v18, v19, v7, v9, *(CGFloat *)(a1 + 112));
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  double v29 = (void *)MEMORY[0x1E4FB1EB0];
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_4;
  v81[3] = &unk_1E64C61C0;
  id v82 = *(id *)(a1 + 64);
  [v29 performWithoutAnimation:v81];
  double v30 = (void *)MEMORY[0x1E4FB1EB0];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_5;
  v79[3] = &unk_1E64C61C0;
  id v80 = *(id *)(a1 + 64);
  [v30 animateWithDuration:v79 animations:0.2];
  int v31 = (void *)MEMORY[0x1E4FB1EB0];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_6;
  v68[3] = &unk_1E64C9E10;
  id v69 = *(id *)(a1 + 64);
  uint64_t v71 = v22;
  uint64_t v72 = v24;
  uint64_t v73 = v26;
  uint64_t v74 = v28;
  id v32 = v3;
  id v70 = v32;
  uint64_t v75 = v41;
  uint64_t v76 = v40;
  uint64_t v77 = v39;
  uint64_t v78 = v38;
  [v31 _animateUsingSpringWithDuration:0 delay:v68 options:0 mass:0.57 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:30.0 completion:0.0];
  int v33 = (void *)MEMORY[0x1E4FB1EB0];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_7;
  v57[3] = &unk_1E64C9E10;
  id v58 = *(id *)(a1 + 64);
  CGFloat v60 = v44;
  CGFloat v61 = v43;
  CGFloat v62 = v42;
  CGFloat v63 = v20;
  id v59 = v32;
  double v64 = v7;
  double v65 = v9;
  CGFloat v66 = v46;
  CGFloat v67 = v45;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_8;
  v47[3] = &unk_1E64C9E38;
  id v48 = *(id *)(a1 + 32);
  id v49 = *(id *)(a1 + 48);
  id v50 = v59;
  id v34 = *(id *)(a1 + 64);
  uint64_t v35 = *(void *)(a1 + 72);
  long long v36 = *(void **)(a1 + 80);
  id v51 = v34;
  uint64_t v52 = v35;
  id v53 = v36;
  id v54 = *(id *)(a1 + 88);
  id v55 = *(id *)(a1 + 96);
  id v56 = *(id *)(a1 + 104);
  id v37 = v59;
  [v33 _animateUsingSpringWithDuration:0 delay:v57 options:v47 mass:0.57 stiffness:0.97 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
}

uint64_t __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v2 = *(double *)(a1 + 80);
  double v3 = *(double *)(a1 + 88);
  double v4 = *(double *)(a1 + 96);
  double v5 = *(double *)(a1 + 104);
  CGFloat v6 = *(void **)(a1 + 40);

  return objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
}

uint64_t __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v2 = *(double *)(a1 + 80);
  double v3 = *(double *)(a1 + 88);
  double v4 = *(double *)(a1 + 96);
  double v5 = *(double *)(a1 + 104);
  CGFloat v6 = *(void **)(a1 + 40);

  return objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
}

void __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_8(uint64_t a1, int a2)
{
  if (a2)
  {
    double v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_9;
    v12[3] = &unk_1E64C61C0;
    id v13 = *(id *)(a1 + 48);
    [v3 _setAdditionalStrokes:MEMORY[0x1E4F1CBF0] inDrawing:v4 completion:v12];
    [*(id *)(a1 + 56) removeFromSuperview];
    -[PKMathRecognitionViewController overlayDrawingController](*(id **)(a1 + 64));
    double v5 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKOverlayDrawingController updateDrawingView:strokes:animationType:result:imageView:](v5, *(void **)(a1 + 72), *(void **)(a1 + 80), 0, *(void **)(a1 + 88), *(void **)(a1 + 56));

    CGFloat v6 = *(void **)(*(void *)(a1 + 64) + 176);
    double v7 = [*(id *)(a1 + 96) uuid];
    [v6 removeObject:v7];

    uint64_t v8 = *(void *)(a1 + 64);
    if (*(unsigned char *)(v8 + 194))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v8 + 240));
      uint64_t v10 = *(void *)(a1 + 64);
      CGFloat v11 = [*(id *)(a1 + 96) strokes];
      [WeakRetained mathViewController:v10 selectStrokes:v11];
    }
  }
}

uint64_t __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

void __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_165(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && ((_BYTE)WeakRetained[24] & 1) != 0)
  {
    double v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 30);
    [v2 mathViewControllerUpdateFrameForContainer:v3];

    id WeakRetained = v3;
  }
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  uint64_t v8 = (UIEditMenuInteraction *)a3;
  id v9 = a4;
  id v10 = a5;
  CGFloat v11 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, self);
  if (self->_alternativedEditMenuInteraction == v8)
  {
    uint64_t v12 = [(PKMathRecognitionToken *)self->_currentMenuToken alternatives];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      id v35 = v10;
      id v36 = v9;
      id v37 = v8;
      uint64_t v14 = self->_currentMenuToken;
      uint64_t v38 = [(PKMathRecognitionToken *)v14 item];
      for (unint64_t i = 0; ; ++i)
      {
        CGFloat v16 = [(PKMathRecognitionToken *)self->_currentMenuToken alternatives];
        unint64_t v17 = [v16 count];

        if (i >= v17) {
          break;
        }
        CGFloat v18 = [(PKMathRecognitionToken *)self->_currentMenuToken alternatives];
        CGFloat v19 = [v18 objectAtIndexedSubscript:i];

        CGFloat v20 = v19;
        uint64_t v21 = [(PKMathRecognitionToken *)self->_currentMenuToken renderableAlternatives];
        unint64_t v22 = [v21 count];

        uint64_t v23 = v20;
        if (i < v22)
        {
          uint64_t v24 = [(PKMathRecognitionToken *)self->_currentMenuToken renderableAlternatives];
          uint64_t v23 = [v24 objectAtIndexedSubscript:i];
        }
        id v25 = v23;
        if ((*((unsigned char *)&self->_delegateFlags + 1) & 8) != 0)
        {
          double v27 = +[PKMathTypesetViewController fontSize]();
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          uint64_t v26 = [WeakRetained mathViewController:self createTypesetImageForExpression:v25 latex:1 fontSize:v27];
        }
        else
        {
          uint64_t v26 = 0;
        }

        double v29 = (void *)MEMORY[0x1E4FB13F0];
        if (v26) {
          double v30 = &stru_1F1FB2C00;
        }
        else {
          double v30 = v20;
        }
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __93__PKMathRecognitionViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke;
        v39[3] = &unk_1E64C9ED8;
        objc_copyWeak(&v43, &location);
        uint64_t v40 = v14;
        id v41 = v38;
        int v31 = v20;
        CGFloat v42 = v31;
        id v32 = [v29 actionWithTitle:v30 image:v26 identifier:0 handler:v39];
        [v11 addObject:v32];

        objc_destroyWeak(&v43);
      }

      id v9 = v36;
      uint64_t v8 = v37;
      id v10 = v35;
    }
  }
  int v33 = [MEMORY[0x1E4FB1970] menuWithChildren:v11];
  objc_destroyWeak(&location);

  return v33;
}

void __93__PKMathRecognitionViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = *(void **)(a1 + 40);
  double v5 = *(void **)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  double v7 = v4;
  id v8 = v5;
  if (WeakRetained)
  {
    id v9 = [v7 uuid];
    id v10 = [*((id *)WeakRetained + 1) objectForKeyedSubscript:v9];

    if (v10 == v7)
    {
      uint64_t v12 = [v7 expression];
      os_log_t v11 = (os_log_t)[v12 mutableCopy];

      uint64_t v13 = [v6 characterRange];
      uint64_t v15 = -[NSObject substringWithRange:](v11, "substringWithRange:", v13, v14);
      CGFloat v16 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CGAffineTransform buf = 138478339;
        id v35 = v8;
        __int16 v36 = 2113;
        uint64_t v37 = v15;
        __int16 v38 = 2113;
        os_log_t v39 = v11;
        _os_log_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_DEFAULT, "Selected alternative: %{private}@, original: %{private}@, in: %{private}@", buf, 0x20u);
      }
      double v29 = (void *)v15;
      id v32 = v2;

      uint64_t v17 = [v6 characterRange];
      -[NSObject replaceCharactersInRange:withString:](v11, "replaceCharactersInRange:withString:", v17, v18, v8);
      uint64_t v19 = -[PKMathRecognitionItem heroStroke](v7);
      CGFloat v20 = (void *)v19;
      if ((*((unsigned char *)WeakRetained + 193) & 0x80) != 0
        && v19
        && ([v7 shouldSolveMathFlagIsSet] & 1) == 0)
      {
        -[PKMathRecognitionViewController _commitSetShouldSolve:undoable:item:]((uint64_t)WeakRetained, 1, 1, v7);
      }
      -[PKMathRecognitionItem _updatePreferredTranscriptionChangingToken:withAlternative:]((uint64_t)v7, v6, v8);
      -[PKMathRecognitionController _updateExpressionForItem:expression:](*((void *)WeakRetained + 32), v7, v11);
      uint64_t v21 = [*((id *)WeakRetained + 1) allValues];
      id v31 = v6;
      id v22 = objc_loadWeakRetained((id *)WeakRetained + 30);
      uint64_t v28 = v20;
      [MEMORY[0x1E4F1CAD0] setWithObject:v9];
      uint64_t v23 = v30 = v8;
      [MEMORY[0x1E4F1CAD0] set];
      v25 = uint64_t v24 = v9;
      uint64_t v26 = [MEMORY[0x1E4F1CAD0] set];
      [v22 mathViewController:WeakRetained didUpdateExpressions:v23 newExpressions:v25 removedExpressions:v26 mathItems:v21];

      id v9 = v24;
      id v8 = v30;

      id v6 = v31;
      id v2 = v32;
    }
    else
    {
      os_log_t v11 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CGAffineTransform buf = 0;
        _os_log_error_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_ERROR, "Math item changed before selecting alternative.", buf, 2u);
      }
    }
  }
  int v33 = (id *)objc_loadWeakRetained(v2);
  double v27 = -[PKMathRecognitionViewController overlayDrawingController](v33);
  -[PKOverlayDrawingController removeToken:]((uint64_t)v27, *(void **)(a1 + 32));
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  self->_menuIsVisible = 1;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__PKMathRecognitionViewController_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke;
  v7[3] = &unk_1E64C61C0;
  v7[4] = self;
  objc_msgSend(a5, "addCompletion:", v7, a4);
  currentMenuToken = self->_currentMenuToken;
  self->_currentMenuToken = 0;
}

void __96__PKMathRecognitionViewController_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 104) = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 48) && (*(unsigned char *)(v1 + 194) & 8) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 240));
    [WeakRetained mathViewControllerDidDismissPopoverUI:*(void *)(a1 + 32)];
  }
}

void __79__PKMathRecognitionViewController__fitBoundsForVariable_needExtraLeadingSlack___block_invoke(uint64_t a1, void *a2)
{
}

BOOL __79__PKMathRecognitionViewController__fitBoundsForVariable_needExtraLeadingSlack___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  return *(unsigned char *)(a1[6] * a2 + a1[5] * a3 + a1[4] + 3) != 0;
}

BOOL __79__PKMathRecognitionViewController__fitBoundsForVariable_needExtraLeadingSlack___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 >= a4) {
    return 0;
  }
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))()) {
    return 1;
  }
  uint64_t v8 = a3 + 1;
  do
  {
    uint64_t v9 = v8;
    if (a4 == v8) {
      break;
    }
    int v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v8 = v9 + 1;
  }
  while (!v10);
  return v9 < a4;
}

- (void)scrubberController:(id)a3 valueDidChange:(id)a4
{
  id v6 = a3;
  id v125 = a4;
  objc_msgSend(MEMORY[0x1E4FBA8A8], "cancelPreviousPerformRequestsWithTarget:selector:object:", self);
  if (!self->_scrubberController) {
    goto LABEL_61;
  }
  double v7 = -[PKMathRecognitionViewController tiledView]((id *)&self->super.isa);
  [v7 _pauseHoverPreviewForTimeInterval:0.5];
  double v116 = v7;
  [v7 inputScale];
  uint64_t v122 = v8;
  objc_initWeak(&location, self);
  int v123 = [v125 hasPrefix:@"-"];
  uint64_t v9 = self->_controller;
  int v10 = v9;
  if (v9) {
    id WeakRetained = objc_loadWeakRetained((id *)&v9[1].super.isa);
  }
  else {
    id WeakRetained = 0;
  }
  liveVariable = self->_liveVariable;
  if (liveVariable) {
    liveVariable = (PKLiveMathVariable *)liveVariable->_originalStrokesDrawing;
  }
  CGFloat v121 = liveVariable;
  uint64_t v13 = self->_liveVariable;
  v126 = self;
  if (v13)
  {
    double y = v13->_originalStrokesBounds.origin.y;
    double x = v13->_originalStrokesBounds.origin.x;
    double width = v13->_originalStrokesBounds.size.width;
    double height = v13->_originalStrokesBounds.size.height;
    uint64_t v14 = v13;
    if (v123)
    {
      CGFloat v15 = v14->_calculatedFitBoundsForExtraLeadingSlack.origin.x;
      CGFloat v16 = v14->_calculatedFitBoundsForExtraLeadingSlack.origin.y;
      CGFloat v17 = v14->_calculatedFitBoundsForExtraLeadingSlack.size.width;
      CGFloat v18 = v14->_calculatedFitBoundsForExtraLeadingSlack.size.height;
      goto LABEL_9;
    }
    CGFloat v24 = v14->_calculatedFitBounds.origin.x;
    CGFloat v23 = v14->_calculatedFitBounds.origin.y;
    CGFloat v25 = v14->_calculatedFitBounds.size.width;
    CGFloat v26 = v14->_calculatedFitBounds.size.height;
LABEL_13:
    v142.origin.double x = v24;
    v142.origin.double y = v23;
    v142.size.double width = v25;
    v142.size.double height = v26;
    if (!CGRectIsNull(v142))
    {
      if (v13)
      {
        double v19 = v13->_calculatedFitBounds.origin.x;
        double v20 = v13->_calculatedFitBounds.origin.y;
        double v22 = v13->_calculatedFitBounds.size.width;
        double v21 = v13->_calculatedFitBounds.size.height;
        goto LABEL_54;
      }
LABEL_69:
      double v21 = 0.0;
      double v22 = 0.0;
      double v20 = 0.0;
      double v19 = 0.0;
      goto LABEL_54;
    }
LABEL_14:
    if (v13)
    {
      CGFloat v113 = v13->_originalStrokes;
      mathItem = v13->_mathItem;
    }
    else
    {
      CGFloat v113 = 0;
      mathItem = 0;
    }
    double v114 = [(PKMathRecognitionItem *)mathItem strokes];
    if (v13)
    {
      [(PKMathRecognitionItem *)v13->_mathItem bounds];
      double v29 = v28;
      CGFloat v31 = v30;
      double v33 = v32;
      CGFloat v35 = v34;
      CGFloat v105 = v13->_originalStrokesBounds.origin.x;
      CGFloat rect = v13->_originalStrokesBounds.origin.y;
      double v36 = v13->_originalStrokesBounds.size.width;
      double v37 = v13->_originalStrokesBounds.size.height;
    }
    else
    {
      [0 bounds];
      double v29 = v99;
      CGFloat v31 = v100;
      double v33 = v101;
      CGFloat v35 = v102;
      double v36 = 0.0;
      CGFloat rect = 0.0;
      double v37 = 0.0;
      CGFloat v105 = 0.0;
    }
    CGFloat v107 = v36;
    if (v36 >= v37) {
      double v38 = v36;
    }
    else {
      double v38 = v37;
    }
    CGFloat v115 = (void *)[v114 mutableCopy];
    [v115 removeObjectsInArray:v113];
    memset(&v141, 0, sizeof(v141));
    [(PKMathRecognitionViewController *)&v141 drawingTransform];
    memset(&v140, 0, sizeof(v140));
    CGAffineTransform v139 = v141;
    CGAffineTransformInvert(&v140, &v139);
    CGAffineTransform v139 = v141;
    v143.origin.double x = v29 - v38;
    v143.origin.double y = v31;
    v143.size.double width = v33 + v38 * 2.0;
    v143.size.double height = v35;
    CGRect v144 = CGRectApplyAffineTransform(v143, &v139);
    v145.origin.double x = DKDRoundedRectForScale(v144.origin.x, v144.origin.y, v144.size.width, v144.size.height, 1.0);
    CGRect v146 = CGRectInset(v145, -1.0, -1.0);
    double v39 = v146.size.width;
    double v40 = v146.size.height;
    CGAffineTransform v139 = v140;
    CGRect v147 = CGRectApplyAffineTransform(v146, &v139);
    double v41 = v147.origin.x;
    double v42 = v147.origin.y;
    double v43 = v147.size.width;
    double v44 = v147.size.height;
    id v45 = objc_loadWeakRetained((id *)&self->_parentView);
    CGFloat v46 = [v45 traitCollection];
    [v46 displayScale];
    double v48 = v47;

    double v49 = fmax(v48, 1.0);
    id v50 = -[PKImageRenderer initSyncWithSize:scale:]([PKImageRenderer alloc], "initSyncWithSize:scale:", v39, v40, v49);
    v139.double a = 0.0;
    *(void *)&v139.b = &v139;
    *(void *)&v139.c = 0x3032000000;
    *(void *)&v139.d = __Block_byref_object_copy__23;
    *(void *)&v139.tdouble x = __Block_byref_object_dispose__23;
    v139.tdouble y = 0.0;
    v138[0] = MEMORY[0x1E4F143A8];
    v138[1] = 3221225472;
    v138[2] = __79__PKMathRecognitionViewController__fitBoundsForVariable_needExtraLeadingSlack___block_invoke;
    v138[3] = &unk_1E64C9F00;
    v138[4] = &v139;
    objc_msgSend(v50, "renderStrokes:clippedToStrokeSpaceRect:scale:completion:", v115, v138, v41, v42, v43, v44, v49);
    id v51 = (CGImage *)[*(id *)(*(void *)&v139.b + 40) CGImage];
    size_t v52 = CGImageGetWidth(v51);
    unint64_t v53 = CGImageGetHeight(v51);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    uint64_t v55 = 4 * v52;
    v111 = malloc_type_calloc(v53 * 4 * v52, 1uLL, 0x100004077774924uLL);
    unint64_t v112 = v52;
    id v56 = CGBitmapContextCreate(v111, v52, v53, 8uLL, 4 * v52, DeviceRGB, 0x4001u);
    CGColorSpaceRelease(DeviceRGB);
    v148.size.double height = (double)v53;
    v148.origin.double x = 0.0;
    v148.origin.double y = 0.0;
    v148.size.double width = (double)v112;
    CGContextDrawImage(v56, v148, v51);
    CGContextRelease(v56);
    memset(&v137, 0, sizeof(v137));
    CGAffineTransformMakeScale(&t1, v43 / (double)v112, v43 / (double)v112);
    CGAffineTransformMakeTranslation(&t2, v41, v42);
    CGAffineTransformConcat(&v137, &t1, &t2);
    CGAffineTransform v133 = v137;
    memset(&v134, 0, sizeof(v134));
    CGAffineTransformInvert(&v134, &v133);
    CGAffineTransform v133 = v134;
    v149.origin.double x = v105;
    v149.size.double width = v107;
    v149.origin.double y = rect;
    v149.size.double height = v37;
    CGRect v150 = CGRectApplyAffineTransform(v149, &v133);
    double v57 = DKDRoundedRectForScale(v150.origin.x, v150.origin.y, v150.size.width, v150.size.height, 1.0);
    CGFloat v59 = v58;
    double v61 = v60;
    double v63 = v62;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__PKMathRecognitionViewController__fitBoundsForVariable_needExtraLeadingSlack___block_invoke_2;
    aBlock[3] = &__block_descriptor_56_e11_B24__0q8q16l;
    void aBlock[4] = v111;
    aBlock[5] = v55;
    aBlock[6] = 4;
    double v64 = _Block_copy(aBlock);
    v130[0] = MEMORY[0x1E4F143A8];
    v130[1] = 3221225472;
    v130[2] = __79__PKMathRecognitionViewController__fitBoundsForVariable_needExtraLeadingSlack___block_invoke_3;
    v130[3] = &unk_1E64C9F48;
    id v65 = v64;
    id v131 = v65;
    CGFloat v66 = (unsigned int (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(v130);
    if (v61 >= v63) {
      double v67 = v61;
    }
    else {
      double v67 = v63;
    }
    if (v49 * 8.0 >= v67) {
      double v68 = v49 * 8.0;
    }
    else {
      double v68 = v67;
    }
    v151.origin.double x = v57;
    v151.origin.double y = v59;
    v151.size.double width = v61;
    v151.size.double height = v63;
    double MinX = CGRectGetMinX(v151);
    v152.origin.double x = v57;
    v152.origin.double y = v59;
    v152.size.double width = v61;
    v152.size.double height = v63;
    double MinY = CGRectGetMinY(v152);
    id v108 = WeakRetained;
    rectdouble a = v10;
    v153.origin.double x = v57;
    v153.origin.double y = v59;
    v153.size.double width = v61;
    v153.size.double height = v63;
    double v103 = v65;
    double v104 = v50;
    id v106 = v6;
    uint64_t v71 = (uint64_t)MinX;
    uint64_t MaxY = (uint64_t)CGRectGetMaxY(v153);
    uint64_t v73 = ((uint64_t)MinX - (uint64_t)v68) & ~(((uint64_t)MinX - (uint64_t)v68) >> 63);
    double v74 = 2.0;
    if (v123) {
      double v74 = 6.0;
    }
    if (v73 <= v71)
    {
      uint64_t v124 = (uint64_t)(v74 * v49);
      uint64_t v76 = (uint64_t)MinX;
      while (!v66[2](v66, v76, (uint64_t)MinY, MaxY))
      {
        uint64_t v75 = v76 - 1;
        if (v76-- <= v73) {
          goto LABEL_41;
        }
      }
      if (v124 + v76 >= v71) {
        uint64_t v75 = (uint64_t)MinX;
      }
      else {
        uint64_t v75 = v124 + v76;
      }
    }
    else
    {
      uint64_t v75 = (uint64_t)MinX;
    }
LABEL_41:
    v154.origin.double x = v57;
    v154.origin.double y = v59;
    v154.size.double width = v61;
    v154.size.double height = v63;
    double MaxX = CGRectGetMaxX(v154);
    uint64_t v79 = (uint64_t)MaxX;
    if (v112 >= (uint64_t)MaxX + (uint64_t)v68) {
      uint64_t v80 = (uint64_t)MaxX + (uint64_t)v68;
    }
    else {
      uint64_t v80 = v112;
    }
    if (v80 > v79)
    {
      uint64_t v81 = (uint64_t)(v49 + v49);
      uint64_t v82 = (uint64_t)MaxX;
      while (!v66[2](v66, v82, (uint64_t)MinY, MaxY))
      {
        if (v80 == ++v82)
        {
          uint64_t v79 = v80;
          goto LABEL_51;
        }
      }
      if (v82 - v81 > v79) {
        uint64_t v79 = v82 - v81;
      }
    }
LABEL_51:
    self = v126;
    id WeakRetained = v108;
    int v10 = recta;
    free(v111);
    v155.origin.double x = (double)v75;
    v155.size.double width = (double)(v79 - v75);
    CGAffineTransform v133 = v137;
    v155.origin.double y = v59;
    v155.size.double height = v63;
    CGRect v156 = CGRectApplyAffineTransform(v155, &v133);
    double v19 = v156.origin.x;
    double v20 = v156.origin.y;
    double v22 = v156.size.width;
    double v21 = v156.size.height;
    if (v13) {
      v13->_calculatedFitBounds = v156;
    }

    _Block_object_dispose(&v139, 8);
    id v6 = v106;
    goto LABEL_54;
  }
  CGFloat v15 = 0.0;
  double width = 0.0;
  double y = 0.0;
  double height = 0.0;
  double x = 0.0;
  CGFloat v16 = 0.0;
  CGFloat v17 = 0.0;
  CGFloat v18 = 0.0;
  CGFloat v23 = 0.0;
  CGFloat v25 = 0.0;
  CGFloat v26 = 0.0;
  CGFloat v24 = 0.0;
  if ((v123 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  if (CGRectIsNull(*(CGRect *)&v15)) {
    goto LABEL_14;
  }
  if (!v13) {
    goto LABEL_69;
  }
  double v19 = v13->_calculatedFitBoundsForExtraLeadingSlack.origin.x;
  double v20 = v13->_calculatedFitBoundsForExtraLeadingSlack.origin.y;
  double v22 = v13->_calculatedFitBoundsForExtraLeadingSlack.size.width;
  double v21 = v13->_calculatedFitBoundsForExtraLeadingSlack.size.height;
LABEL_54:

  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __69__PKMathRecognitionViewController_scrubberController_valueDidChange___block_invoke;
  v127[3] = &unk_1E64C9F70;
  objc_copyWeak(&v128, &location);
  -[PKRecognitionSessionManager synthesizeDrawingForText:sourceDrawing:originalBounds:fitInBounds:inputScale:completion:]((uint64_t)WeakRetained, v125, v121, v127, x, y, width, height, v19, v20, v22, v21, v83, v84, v85, v86, v122);

  CGFloat v87 = self->_liveVariable;
  if (v87) {
    CGFloat v87 = (PKLiveMathVariable *)v87->_mathItem;
  }
  long long v88 = v87;
  long long v89 = self->_liveVariable;
  if (v89) {
    long long v89 = (PKLiveMathVariable *)v89->_variable;
  }
  long long v90 = v89;
  -[PKMathRecognitionItem _updateVariable:valueString:]((uint64_t)v88, v90, v125);

  long long v91 = v126->_liveVariable;
  if (v91) {
    long long v91 = (PKLiveMathVariable *)v91->_mathItem;
  }
  long long v92 = v91;
  uint64_t v93 = [(PKLiveMathVariable *)v92 uuid];
  uint64_t v94 = [MEMORY[0x1E4F1CAD0] setWithObject:v93];
  id v95 = objc_loadWeakRetained((id *)&v126->_delegate);
  uint64_t v96 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v97 = [MEMORY[0x1E4F1CAD0] set];
  __int16 v98 = [(NSMutableDictionary *)v126->_currentMathItemsLookup allValues];
  [v95 mathViewController:v126 didUpdateExpressions:v94 newExpressions:v96 removedExpressions:v97 mathItems:v98];

  objc_destroyWeak(&v128);
  objc_destroyWeak(&location);

  self = v126;
LABEL_61:
  if (self->_shouldAutohideScrubber) {
    [(PKMathRecognitionViewController *)self performSelector:sel_hideScrubber withObject:0 afterDelay:3.0];
  }
}

void __69__PKMathRecognitionViewController_scrubberController_valueDidChange___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id val = objc_loadWeakRetained(v6);
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  if (val)
  {
    objc_initWeak(&location, val);
    uint64_t v13 = -[PKMathRecognitionViewController tiledView]((id *)val);
    uint64_t v14 = [v13 selectionController];
    CGFloat v15 = [v10 strokes];
    CGFloat v16 = -[PKMathRecognitionViewController drawing]((id *)val);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __98__PKMathRecognitionViewController__updateLiveVariableWithDrawing_tokenSymbols_tokenStrokeIndexes___block_invoke;
    v18[3] = &unk_1E64C9F98;
    objc_copyWeak(&v22, &location);
    id v19 = v10;
    id v20 = v11;
    id v21 = v12;
    -[PKSelectionController _imageViewForStrokes:drawing:completion:]((uint64_t)v14, v15, v16, v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (void)_cleanupAfterScrubbing
{
  if (a1)
  {
    id v2 = *(void **)(a1 + 64);
    if (v2 && (*(unsigned char *)(a1 + 194) & 8) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 240));
      [WeakRetained mathViewControllerDidDismissPopoverUI:a1];

      id v2 = *(void **)(a1 + 64);
    }
    *(void *)(a1 + 64) = 0;

    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a1 selector:sel_hideScrubber object:0];
    [*(id *)(a1 + 56) _setVisibilityUpdatesEnabled:1];
    uint64_t v4 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;

    uint64_t v5 = *(void *)(a1 + 88);
    if (!v5) {
      goto LABEL_40;
    }
    if (*(unsigned char *)(v5 + 8))
    {
      id v6 = objc_loadWeakRetained((id *)(a1 + 240));
      [v6 mathViewController:a1 setHiddenStrokes:MEMORY[0x1E4F1CBF0]];

      uint64_t v7 = *(void *)(a1 + 88);
      if (!v7) {
        goto LABEL_43;
      }
      *(unsigned char *)(v7 + 8) = 0;
      uint64_t v5 = *(void *)(a1 + 88);
      if (!v5) {
        goto LABEL_43;
      }
    }
    uint64_t v8 = *(void *)(v5 + 32);
    if (!v8
      || (v9 = *(void **)(v8 + 32), *(void *)(v8 + 32) = 0, v9, (uint64_t v5 = *(void *)(a1 + 88)) != 0))
    {
      id v10 = *(void **)(v5 + 56);
    }
    else
    {
LABEL_43:
      id v10 = 0;
    }
    id v11 = [v10 strokes];
    uint64_t v12 = [v11 count];

    if (!v12) {
      goto LABEL_38;
    }
    uint64_t v13 = *(void **)(a1 + 88);
    if (v13) {
      uint64_t v13 = (void *)v13[4];
    }
    uint64_t v14 = v13;
    uint64_t v15 = [v14 uuid];
    CGFloat v16 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = v15;

    id v17 = objc_loadWeakRetained((id *)(a1 + 240));
    CGFloat v18 = *(void **)(a1 + 88);
    if (v18)
    {
      id v19 = (void *)v18[5];
      CGFloat v18 = (void *)v18[7];
    }
    else
    {
      id v19 = 0;
    }
    id v20 = v18;
    id v21 = v19;
    id v22 = [v20 strokes];
    [v17 mathViewController:a1 replaceStrokes:v21 withStrokes:v22];

    CGFloat v23 = *(void **)(a1 + 88);
    if (v23) {
      CGFloat v23 = (void *)v23[4];
    }
    CGFloat v24 = v23;
    CGFloat v25 = -[PKMathRecognitionItem mathResult]((uint64_t)v24);
    char v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) == 0)
    {
LABEL_38:
      uint64_t v54 = *(void *)(a1 + 88);
      if (v54)
      {
        uint64_t v55 = *(void **)(v54 + 64);
LABEL_41:
        [v55 removeFromSuperview];
        id v56 = *(void **)(a1 + 88);
        *(void *)(a1 + 88) = 0;

        return;
      }
LABEL_40:
      uint64_t v55 = 0;
      goto LABEL_41;
    }
    double v27 = *(void **)(a1 + 88);
    if (v27) {
      double v27 = (void *)v27[4];
    }
    double v28 = v27;
    double v29 = -[PKMathRecognitionItem mathResult]((uint64_t)v28);
    uint64_t v30 = *(void *)(a1 + 88);
    if (v30)
    {
      id v31 = *(id *)(v30 + 24);
      double v32 = v31;
      if (v31)
      {
        double v33 = (void *)*((void *)v31 + 4);
LABEL_25:
        id v34 = v33;
        CGFloat v35 = *(void **)(a1 + 88);
        if (v35)
        {
          double v36 = (void *)v35[9];
          double v37 = (void *)v35[10];
          CGFloat v35 = (void *)v35[7];
        }
        else
        {
          double v37 = 0;
          double v36 = 0;
        }
        double v38 = v35;
        id v39 = v37;
        id v40 = v36;
        double v41 = [v38 CHDrawing];
        double v42 = (void *)[v29 newResultWithScrubbedStrokes:v34 scrubbedValueTokens:v40 scrubbedValueStrokeIndexes:v39 scrubbedValueDrawing:v41];

        if (v42)
        {
          uint64_t v43 = *(void *)(a1 + 88);
          if (v43) {
            double v44 = *(void **)(v43 + 32);
          }
          else {
            double v44 = 0;
          }
          id v45 = [v44 strokes];
          os_log_t v46 = (os_log_t)[v45 mutableCopy];

          uint64_t v47 = *(void *)(a1 + 88);
          if (v47) {
            uint64_t v48 = *(void *)(v47 + 40);
          }
          else {
            uint64_t v48 = 0;
          }
          [v46 removeObjectsInArray:v48];
          uint64_t v49 = *(void *)(a1 + 88);
          if (v49) {
            id v50 = *(void **)(v49 + 56);
          }
          else {
            id v50 = 0;
          }
          id v51 = [v50 strokes];
          [v46 addObjectsFromArray:v51];

          size_t v52 = -[PKMathRecognitionViewController recognitionManager](*(id **)(a1 + 256));
          unint64_t v53 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v46];
          -[PKRecognitionSessionManager cacheTranscription:strokeGroup:]((uint64_t)v52, v42, v53);
        }
        else
        {
          os_log_t v46 = os_log_create("com.apple.pencilkit", "");
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)double v57 = 0;
            _os_log_error_impl(&dword_1C44F8000, v46, OS_LOG_TYPE_ERROR, "Unable to add scrubbed expression in the transcription cache.", v57, 2u);
          }
        }

        goto LABEL_38;
      }
    }
    else
    {
      double v32 = 0;
    }
    double v33 = 0;
    goto LABEL_25;
  }
}

void __98__PKMathRecognitionViewController__updateLiveVariableWithDrawing_tokenSymbols_tokenStrokeIndexes___block_invoke(void *a1, void *a2)
{
  uint64_t v4 = (id *)(a1 + 7);
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v4);
  uint64_t v7 = (void *)a1[4];
  id v6 = (void *)a1[5];
  uint64_t v8 = (void *)a1[6];
  id v9 = v7;
  id v10 = v6;
  id v11 = v8;
  id v12 = v5;
  if (WeakRetained && WeakRetained[11])
  {
    uint64_t v13 = -[PKMathRecognitionViewController tiledView](WeakRetained);
    uint64_t v14 = WeakRetained[11];
    if (!v14 || !v14[8])
    {
      id v15 = objc_loadWeakRetained(WeakRetained + 30);
      CGFloat v16 = WeakRetained[11];
      uint64_t v17 = v16 ? v16[5] : 0;
      [v15 mathViewController:WeakRetained setHiddenStrokes:v17];

      CGFloat v18 = WeakRetained[11];
      if (v18) {
        v18[8] = 1;
      }
    }
    objc_msgSend(v12, "frame", v9);
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    id v27 = objc_loadWeakRetained(WeakRetained + 31);
    objc_msgSend(v13, "convertRect:toView:", v27, v20, v22, v24, v26);
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;

    objc_msgSend(v12, "setFrame:", v29, v31, v33, v35);
    double v36 = WeakRetained[11];
    if (v36) {
      double v37 = (void *)v36[8];
    }
    else {
      double v37 = 0;
    }
    [v37 removeFromSuperview];
    id v38 = objc_loadWeakRetained(WeakRetained + 31);
    [v38 addSubview:v12];

    id v39 = (id *)WeakRetained[11];
    if (v39)
    {
      objc_storeStrong(v39 + 8, a2);
      id v40 = (id *)WeakRetained[11];
      if (v40)
      {
        objc_storeStrong(v40 + 7, v7);
        double v41 = (id *)WeakRetained[11];
        if (v41)
        {
          objc_storeStrong(v41 + 9, v6);
          double v42 = (id *)WeakRetained[11];
          if (v42) {
            objc_storeStrong(v42 + 10, v8);
          }
        }
      }
    }

    id v9 = v43;
  }
}

- (void)hideScrubber
{
  [(PKCalculateScrubberController *)self->_scrubberController hideScrubber];

  -[PKMathRecognitionViewController _cleanupAfterScrubbing]((uint64_t)self);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)hoverController:(id)a3 holdGestureMeanInputPoint:(id *)a4 latestInputPoint:(id *)a5
{
  double x = a5->var0.var0.x;
  double y = a5->var0.var0.y;
  uint64_t v8 = -[PKMathRecognitionViewController tiledView]((id *)&self->super.isa);
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  }
  else {
    id WeakRetained = 0;
  }
  objc_msgSend(v8, "convertPoint:toView:", WeakRetained, x, y);
  uint64_t v16 = v11;
  double v18 = v10;

  if (self) {
    id v12 = objc_loadWeakRetained((id *)&self->_parentView);
  }
  else {
    id v12 = 0;
  }
  objc_msgSend(v12, "bounds", v16);
  v21.double y = v17;
  v21.double x = v18;
  BOOL v13 = CGRectContainsPoint(v22, v21);

  if (v13)
  {
    memset(&v20, 0, sizeof(v20));
    [(PKMathRecognitionViewController *)&v19 drawingTransform];
    CGAffineTransformInvert(&v20, &v19);
    float64x2_t v14 = vaddq_f64(*(float64x2_t *)&v20.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v20.c, v17), *(float64x2_t *)&v20.a, v18));
    if ([(PKMathRecognitionViewController *)(uint64_t)self _handleSingleTapAtDrawingLocation:0 fromHover:v14.f64[0] fromTapStroke:v14.f64[1]])
    {
      id v15 = -[PKMathRecognitionViewController tiledView]((id *)&self->super.isa);
      [v15 _pauseHoverPreviewForTimeInterval:0.5];
    }
  }
}

- (void)contextMenuController:(id)a3 removeResultForItemUUID:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    id v5 = [(NSMutableDictionary *)self->_currentMathItemsLookup objectForKeyedSubscript:a4];
    if (v5)
    {
      id v6 = -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
      uint64_t v7 = -[PKMathRecognitionItem _heroStrokeInDrawing:](v5, v6);

      if (v7)
      {
        uint64_t v8 = os_log_create("com.apple.pencilkit", "Math");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [v5 expression];
          int v10 = 138477827;
          uint64_t v11 = v9;
          _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Remove result for: %{private}@", (uint8_t *)&v10, 0xCu);
        }
        if ([v5 shouldSolveMathFlagIsSet])
        {
          if ((*((unsigned char *)&self->_delegateFlags + 1) & 0x80) != 0) {
            -[PKMathRecognitionViewController _commitSetShouldSolve:undoable:item:]((uint64_t)self, 0, 1, v5);
          }
        }
      }
    }
  }
}

- (void)contextMenuController:(id)a3 solveItemUUID:(id)a4
{
  id v9 = a4;
  id v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_currentResultsLookup, "objectForKeyedSubscript:");
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = [(NSMutableDictionary *)self->_currentMathItemsLookup objectForKeyedSubscript:v9];
    if (v8)
    {
      -[PKMathRecognitionViewController _commitSetShouldSolve:undoable:item:]((uint64_t)self, 1, 1, v8);
      -[PKMathRecognitionViewController _presentResult:mathItem:defaultAnimationType:fromHint:hadOldResult:]((uint64_t)self, v7, v8, (void *)1, 1, 1);
    }
  }
}

- (id)contextMenuController:(id)a3 resultDrawingForItemUUID:(id)a4
{
  return (id)[(NSMutableDictionary *)self->_currentResultsDrawings objectForKeyedSubscript:a4];
}

- (id)contextMenuController:(id)a3 resultForItemUUID:(id)a4
{
  return (id)[(NSMutableDictionary *)self->_currentResultsLookup objectForKeyedSubscript:a4];
}

- (id)contextMenuController:(id)a3 resultAttributionForItemUUID:(id)a4
{
  return (id)[(NSMutableDictionary *)self->_currentResultsAttributionLookup objectForKeyedSubscript:a4];
}

- (CGAffineTransform)contextMenuControllerDrawingTransform:(SEL)a3
{
  [(PKMathRecognitionViewController *)retstr drawingTransform];
  return result;
}

- (id)contextMenuController:(id)a3 imageForItemUUID:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->_currentMathItemsLookup objectForKeyedSubscript:a4];
  id v6 = v5;
  if (!v5 || (*((unsigned char *)&self->_delegateFlags + 1) & 0x18) == 0)
  {
    float64x2_t v14 = 0;
    goto LABEL_18;
  }
  id v7 = v5;
  currentResultsLookup = self->_currentResultsLookup;
  id v9 = [v7 uuid];
  int v10 = [(NSMutableDictionary *)currentResultsLookup objectForKeyedSubscript:v9];

  double v11 = +[PKMathTypesetViewController fontSize]();
  $3A85256BFD6204C3C261D6BABEA0205A delegateFlags = self->_delegateFlags;
  if ((*(_WORD *)&delegateFlags & 0x1000) == 0) {
    goto LABEL_10;
  }
  if ([v10 length]) {
    uint64_t v13 = [v7 shouldSolveMathFlagIsSet];
  }
  else {
    uint64_t v13 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v16 = [v7 uuid];
  float64x2_t v14 = [WeakRetained mathViewController:self createTypesetImageForItemUUID:v16 showResult:v13 fontSize:v11];

  if (!v14)
  {
    $3A85256BFD6204C3C261D6BABEA0205A delegateFlags = self->_delegateFlags;
LABEL_10:
    if ((*(_WORD *)&delegateFlags & 0x800) != 0)
    {
      double v17 = [v7 expressionToPresent];
      if ([v10 length]
        && ([v7 isVerticalExpression] & 1) == 0
        && [v7 shouldSolveMathFlagIsSet])
      {
        uint64_t v18 = [NSString stringWithFormat:@"%@ = %@", v17, v10];

        double v17 = (void *)v18;
      }
      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      float64x2_t v14 = [v19 mathViewController:self createTypesetImageForExpression:v17 latex:1 fontSize:v11];
    }
    else
    {
      float64x2_t v14 = 0;
    }
  }

LABEL_18:

  return v14;
}

- (void)contextMenuController:(id)a3 dismissErrorForItem:(id)a4 token:(id)a5
{
  id v6 = a5;
  -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKOverlayDrawingController removeToken:]((uint64_t)v7, v6);
}

- (void)contextMenuController:(id)a3 addGraphForItemUUID:(id)a4 addToExisting:(BOOL)a5 graphableVariable:(id)a6
{
  BOOL v6 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v31 = [a4 UUIDString];
  id v10 = v9;
  if (self)
  {
    double v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v31];
    if (v11 && (*(unsigned char *)&self->_delegateFlags & 8) != 0)
    {
      BOOL v30 = v6;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v12 = [(NSMutableDictionary *)self->_currentMathItemsLookup allValues];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v33;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v33 != v15) {
              objc_enumerationMutation(v12);
            }
            double v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            uint64_t v18 = [v17 uuid];
            int v19 = [v18 isEqual:v11];

            if (v19)
            {
              v41.origin.CGFloat x = -[PKMathRecognitionItem boundsForAnyEqualSign](v17);
              CGFloat x = v41.origin.x;
              CGFloat y = v41.origin.y;
              CGFloat width = v41.size.width;
              CGFloat height = v41.size.height;
              double MidX = CGRectGetMidX(v41);
              v42.origin.CGFloat x = x;
              v42.origin.CGFloat y = y;
              v42.size.CGFloat width = width;
              v42.size.CGFloat height = height;
              double MidY = CGRectGetMidY(v42);
              double v26 = os_log_create("com.apple.pencilkit", "Math");
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                id v27 = [v17 expression];
                *(_DWORD *)CGAffineTransform buf = 138477827;
                double v37 = v27;
                _os_log_impl(&dword_1C44F8000, v26, OS_LOG_TYPE_DEFAULT, "Adding graph for expression: %{private}@", buf, 0xCu);
              }
              id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
              double v29 = [v17 expression];
              objc_msgSend(WeakRetained, "mathViewController:addGraphForExpression:variable:range:identifier:expressionLocation:addToExisting:", self, v29, v10, v31, v30, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), MidX, MidY);

              goto LABEL_16;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
  }
}

- (void)contextMenuControllerDidFinish:(id)a3
{
}

- (void)registerRecentlyCreatedLocalStroke:(id)a3
{
  id v3 = a3;
  +[PKLocalStrokeTracker sharedInstance]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKLocalStrokeTracker addStroke:]((uint64_t)v4, v3);
}

- (int64_t)solvingStyle
{
  return self->_solvingStyle;
}

- (BOOL)shouldCacheDrawingForResults
{
  return self->_shouldCacheDrawingForResults;
}

- (void)setShouldCacheDrawingForResults:(BOOL)a3
{
  self->_shouldCacheDrawingForResults = a3;
}

- (double)canvasWidth
{
  return self->_canvasWidth;
}

- (void)setCanvasWidth:(double)a3
{
  self->_canvasWidth = a3;
}

- (UIViewController)viewControllerForPresentingUI
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerForPresentingUI);

  return (UIViewController *)WeakRetained;
}

- (void)setViewControllerForPresentingUI:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuController, 0);
  objc_storeStrong((id *)&self->_alternativedEditMenuInteraction, 0);
  objc_storeStrong((id *)&self->_overlayDrawingController, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_parentView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_viewControllerForPresentingUI);
  objc_storeStrong((id *)&self->_hoverController, 0);
  objc_storeStrong((id *)&self->_expressionsWeCreatedGraphsFor, 0);
  objc_storeStrong((id *)&self->_expressionsWithActiveAnimations, 0);
  objc_storeStrong((id *)&self->_solveItemUUID, 0);
  objc_storeStrong((id *)&self->_addGraphItemUUID, 0);
  objc_storeStrong((id *)&self->_popoverHintItemUUID, 0);
  objc_storeStrong((id *)&self->_solveResult, 0);
  objc_storeStrong((id *)&self->_currentMenuToken, 0);
  objc_storeStrong((id *)&self->_liveVariable, 0);
  objc_storeStrong((id *)&self->_uuidForLatestLiveVariableExpression, 0);
  objc_storeStrong((id *)&self->_scrubberController, 0);
  objc_storeStrong((id *)&self->_activeToolPickerForPresentedViewController, 0);
  objc_storeStrong((id *)&self->_typesetViewController, 0);
  objc_storeStrong((id *)&self->_mathFloatingLabelView, 0);
  objc_storeStrong((id *)&self->_currentResultsDrawings, 0);
  objc_storeStrong((id *)&self->_currentResultsAttributionLookup, 0);
  objc_storeStrong((id *)&self->_currentResultsLookup, 0);

  objc_storeStrong((id *)&self->_currentMathItemsLookup, 0);
}

@end