@interface PDFDocumentView
- (CGSize)documentViewSize;
- (CGVector)_scaleFromLayerTransforms;
- (PDFDocumentView)initWithPDFView:(id)a3;
- (id)_createPageView:(id)a3;
- (id)backgroundImageForPage:(id)a3 withQuality:(int *)a4;
- (id)createPageViewForPageAtIndex:(unint64_t)a3 withFrame:(CGRect)a4;
- (id)document;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)pageBackgroundManager;
- (id)pageViewForPageAtIndex:(unint64_t)a3;
- (id)pageViews;
- (id)pdfView;
- (void)_reAddPageOverlaysStartingAtIndex:(unint64_t)a3;
- (void)_removePageOverlaysStartingAtIndex:(unint64_t)a3;
- (void)_shiftPagesAtIndex:(unint64_t)a3 downwards:(BOOL)a4;
- (void)_updateVisibility;
- (void)_updateVisibilityDelegateForVisiblePageView:(id)a3 atIndex:(unint64_t)a4;
- (void)changedBoundsForBoxNotification:(id)a3;
- (void)dealloc;
- (void)didInsertPage:(id)a3 atIndex:(unint64_t)a4;
- (void)didRemovePage:(id)a3 atIndex:(unint64_t)a4;
- (void)didRotatePageNotification:(id)a3;
- (void)didSwapPage:(id)a3 atIndex:(unint64_t)a4 forPage:(id)a5 atIndex:(unint64_t)a6;
- (void)forceUpdateActivePageIndex:(unint64_t)a3 withMaxDuration:(double)a4;
- (void)layoutDocumentView;
- (void)previewRotateShiftPages:(double)a3;
- (void)recieveBackgroundImage:(id)a3 atBackgroundQuality:(int)a4 forPage:(id)a5;
- (void)removePageViewForPageAtIndex:(unint64_t)a3;
- (void)setDocument:(id)a3;
- (void)updateNotificationsForDocument;
- (void)updateVisibility;
- (void)willForceUpdate;
- (void)willInsertPage:(id)a3 atIndex:(unint64_t)a4;
- (void)willRemovePage:(id)a3 atIndex:(unint64_t)a4;
- (void)willSwapPage:(id)a3 atIndex:(unint64_t)a4 forPage:(id)a5 atIndex:(unint64_t)a6;
@end

@implementation PDFDocumentView

- (PDFDocumentView)initWithPDFView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFDocumentView;
  v5 = [(PDFTextInputView *)&v11 initWithDelegate:self];
  if (v5)
  {
    v6 = objc_alloc_init(PDFDocumentViewPrivate);
    v7 = v5->_private;
    v5->_private = v6;

    objc_storeWeak((id *)&v5->_private->pdfView, v4);
    v8 = [v4 renderingProperties];
    objc_storeWeak((id *)&v5->_private->renderingProperties, v8);
    v5->_private->ignoreChangedBoundsForBoxNotification = 1;
    [(PDFDocumentView *)v5 updateNotificationsForDocument];
    if (([v8 isUsingPDFExtensionView] & 1) == 0) {
      [(PDFDocumentView *)v5 becomeFirstResponder];
    }
    [(PDFTextInputView *)v5 updateGestureRecognizerDependencies];
    v9 = [(PDFDocumentView *)v5 layer];
    [v9 setAllowsEdgeAntialiasing:0];
  }
  return v5;
}

- (void)dealloc
{
  pageBackgroundManager = self->_private->pageBackgroundManager;
  if (pageBackgroundManager)
  {
    [(PDFPageBackgroundManager *)pageBackgroundManager cancel];
    id v4 = self->_private;
    v5 = v4->pageBackgroundManager;
    v4->pageBackgroundManager = 0;
  }
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)PDFDocumentView;
  [(PDFDocumentView *)&v7 dealloc];
}

- (void)setDocument:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  if (WeakRetained != v4)
  {
    id v31 = WeakRetained;
    v6 = [(NSMutableDictionary *)self->_private->pageViews allValues];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_super v11 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
          id v12 = objc_loadWeakRetained((id *)&self->_private->pdfView);
          uint64_t v13 = [v11 visibilityDelegateIndex];
          [v12 callPageVisibilityDelegateMethod:2 forPageView:v11 atPageIndex:v13];
          [v11 removeFromSuperview];
          [v12 callPageVisibilityDelegateMethod:3 forPageView:v11 atPageIndex:v13];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v8);
    }
    objc_storeWeak((id *)&self->_private->document, v4);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v15 = self->_private;
    pageViews = v15->pageViews;
    v15->pageViews = v14;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v18 = self->_private;
    pageFrames = v18->pageFrames;
    v18->pageFrames = v17;

    [v4 setPageChangeDelegate:self];
    v20 = [PDFDocumentContentView alloc];
    [(PDFDocumentView *)self frame];
    uint64_t v21 = -[PDFDocumentContentView initWithFrame:](v20, "initWithFrame:");
    v22 = self->_private;
    contentView = v22->contentView;
    v22->contentView = (PDFDocumentContentView *)v21;

    [(PDFDocumentView *)self addSubview:self->_private->contentView];
    pageBackgroundManager = self->_private->pageBackgroundManager;
    if (pageBackgroundManager) {
      [(PDFPageBackgroundManager *)pageBackgroundManager cancel];
    }
    if (v4)
    {
      if [v4 isLinearized] && (objc_msgSend(v4, "hasHighLatencyDataProvider")) {
        goto LABEL_17;
      }
      v25 = [PDFPageBackgroundManager alloc];
      id v26 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
      uint64_t v27 = [(PDFPageBackgroundManager *)v25 initWithDelegate:self andRenderingProperties:v26];
      v28 = self->_private;
      v29 = v28->pageBackgroundManager;
      v28->pageBackgroundManager = (PDFPageBackgroundManager *)v27;
    }
    else
    {
      [(PDFPageBackgroundManager *)self->_private->pageBackgroundManager cancel];
      v30 = self->_private;
      id v26 = v30->pageBackgroundManager;
      v30->pageBackgroundManager = 0;
    }

LABEL_17:
    [(PDFDocumentContentView *)self->_private->contentView setUserInteractionEnabled:0];
    [(PDFDocumentView *)self updateNotificationsForDocument];

    id WeakRetained = v31;
  }
}

- (id)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);

  return WeakRetained;
}

- (void)updateNotificationsForDocument
{
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  [v4 removeObserver:self name:@"PDFPageChangedBoundsForBox" object:0];
  [v4 removeObserver:self name:@"PDFPageDidRotate" object:0];
  [v4 removeObserver:self name:@"PDFPageDidChangeBounds" object:0];
  if (WeakRetained)
  {
    [v4 addObserver:self selector:sel_changedBoundsForBoxNotification_ name:@"PDFPageChangedBoundsForBox" object:WeakRetained];
    [v4 addObserver:self selector:sel_didRotatePageNotification_ name:@"PDFPageDidRotate" object:WeakRetained];
    [v4 addObserver:self selector:sel_didRotatePageNotification_ name:@"PDFPageDidChangeBounds" object:WeakRetained];
  }
}

- (id)pageViewForPageAtIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || ![(NSMutableDictionary *)self->_private->pageViews count])
  {
    uint64_t v7 = 0;
  }
  else
  {
    pageViews = self->_private->pageViews;
    v6 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v7 = [(NSMutableDictionary *)pageViews objectForKey:v6];
  }

  return v7;
}

- (id)createPageViewForPageAtIndex:(unint64_t)a3 withFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  if (WeakRetained)
  {
    pageFrames = self->_private->pageFrames;
    unint64_t v27 = a3;
    id v12 = [NSNumber numberWithUnsignedInteger:a3];
    v28 = [(NSMutableDictionary *)pageFrames objectForKey:v12];

    if (v28)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_private->document);
      v14 = [v13 pageAtIndex:a3];

      [v14 setView:WeakRetained];
      v15 = [(PDFDocumentView *)self _createPageView:v14];
      v16 = self->_private->pageViews;
      objc_sync_enter(v16);
      [WeakRetained callPageVisibilityDelegateMethod:0 forPageView:v15 atPageIndex:a3];
      pageViews = self->_private->pageViews;
      v18 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)pageViews setObject:v15 forKey:v18];

      [(PDFDocumentView *)self insertSubview:v15 aboveSubview:self->_private->contentView];
      [(PDFTextInputView *)self updateTextSelectionGraphics];
      objc_sync_exit(v16);

      objc_msgSend(v15, "setFrame:", x, y, width, height);
      v19 = [WeakRetained highlightedSelections];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v19);
            }
            v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v24 = [v23 pages];
            int v25 = [v24 containsObject:v14];

            if (v25) {
              [v15 addSearchSelection:v23];
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v20);
      }
      [WeakRetained callPageVisibilityDelegateMethod:1 forPageView:v15 atPageIndex:v27];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)removePageViewForPageAtIndex:(unint64_t)a3
{
  obj = self->_private->pageViews;
  objc_sync_enter(obj);
  pageViews = self->_private->pageViews;
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = [(NSMutableDictionary *)pageViews objectForKey:v6];

  uint64_t v8 = [v7 visibilityDelegateIndex];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  [WeakRetained callPageVisibilityDelegateMethod:2 forPageView:v7 atPageIndex:v8];
  uint64_t v10 = self->_private->pageViews;
  objc_super v11 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)v10 removeObjectForKey:v11];

  [v7 removeFromSuperview];
  [WeakRetained callPageVisibilityDelegateMethod:3 forPageView:v7 atPageIndex:v8];

  objc_sync_exit(obj);
}

- (id)pageViews
{
  return (id)[(NSMutableDictionary *)self->_private->pageViews allValues];
}

- (void)layoutDocumentView
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  self->_private->ignoreChangedBoundsForBoxNotification = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  id v4 = [WeakRetained PDFLayout];
  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v6 = self->_private;
  pageFrames = v6->pageFrames;
  v6->pageFrames = v5;

  id v8 = objc_loadWeakRetained((id *)&self->_private->document);
  uint64_t v9 = [WeakRetained currentPage];
  if (!v9)
  {
    uint64_t v9 = [v8 pageAtIndex:0];
  }
  objc_msgSend(v4, "contentSizeWithCurrentPage:", v9, v9);
  uint64_t v10 = self->_private;
  v10->documentViewSize.double width = v11;
  v10->documentViewSize.double height = v12;
  v13.n128_u64[0] = 0;
  v14.n128_u64[0] = 0;
  [(PDFDocumentView *)self setFrame:PDFRectMake(v13, v14, self->_private->documentViewSize.width, self->_private->documentViewSize.height)];
  v15.n128_u64[0] = 0;
  v16.n128_u64[0] = 0;
  [(PDFDocumentView *)self setBounds:PDFRectMake(v15, v16, self->_private->documentViewSize.width, self->_private->documentViewSize.height)];
  v39 = WeakRetained;
  v17 = [WeakRetained documentScrollView];
  [(PDFDocumentView *)self frame];
  objc_msgSend(v17, "setContentSize:", v18, v19);
  [v17 centerAlign];

  int v20 = [v8 pageCount];
  id v21 = v8;
  if (v20 >= 1)
  {
    uint64_t v22 = 0;
    uint64_t v23 = v20;
    do
    {
      v24 = [v8 pageAtIndex:v22];
      if (v24)
      {
        [v4 boundsForPage:v24];
        -[PDFDocumentView _pixelAlignPageFrameOrigin:](self, "_pixelAlignPageFrameOrigin:");
        int v25 = self->_private->pageFrames;
        id v26 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:");
        unint64_t v27 = [NSNumber numberWithInt:v22];
        [(NSMutableDictionary *)v25 setObject:v26 forKey:v27];

        id v8 = v21;
      }

      ++v22;
    }
    while (v23 != v22);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [(NSMutableDictionary *)self->_private->pageViews allValues];
  uint64_t v28 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v42 != v30) {
          objc_enumerationMutation(obj);
        }
        long long v32 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        long long v33 = [v32 page];
        uint64_t v34 = [v8 indexForPage:v33];
        long long v35 = self->_private->pageFrames;
        v36 = [NSNumber numberWithInt:v34];
        uint64_t v37 = [(NSMutableDictionary *)v35 objectForKey:v36];

        if (v37)
        {
          [v37 PDFKitPDFRectValue];
          objc_msgSend(v32, "setFrame:");
        }

        id v8 = v21;
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v29);
  }

  [(PDFTextInputView *)self updateTextSelectionGraphics];
  self->_private->ignoreChangedBoundsForBoxNotification = 0;
}

- (CGSize)documentViewSize
{
  v2 = self->_private;
  double width = v2->documentViewSize.width;
  double height = v2->documentViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)updateVisibility
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    [(PDFDocumentView *)self _updateVisibility];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__PDFDocumentView_updateVisibility__block_invoke;
    block[3] = &unk_264203940;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __35__PDFDocumentView_updateVisibility__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVisibility];
}

- (void)_updateVisibility
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  if (WeakRetained)
  {
    id v66 = WeakRetained;
    v64 = [WeakRetained PDFLayout];
    uint64_t v65 = [v64 functionalDisplayMode];
    [v66 bounds];
    objc_msgSend(v66, "convertRect:toView:", self);
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v12 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
    if ([v12 isUsingPDFExtensionView])
    {
      [v66 extensionViewBoundsInDocument];
      CGFloat v5 = v13;
      CGFloat v7 = v14;
      double v9 = v15;
      double v11 = v16;
    }

    v70.origin.double x = v5;
    v70.origin.double y = v7;
    v70.size.double width = v9;
    v70.size.double height = v11;
    PDFRectInset(v70, -(v9 - v9 * 2.0) * -0.5, -(v11 - v11 * 3.0) * -0.5);
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
      [MEMORY[0x263F158F8] activateBackground:1];
    }
    id v67 = objc_loadWeakRetained((id *)&self->_private->document);
    int v17 = [v67 pageCount];
    if (v17 >= 1)
    {
      uint64_t v18 = 0;
      uint64_t v68 = v17;
      while (1)
      {
        pageFrames = self->_private->pageFrames;
        int v20 = [NSNumber numberWithInt:v18];
        id v21 = [(NSMutableDictionary *)pageFrames objectForKey:v20];

        if (v21) {
          break;
        }
LABEL_41:

        if (v68 == ++v18) {
          goto LABEL_42;
        }
      }
      pageViews = self->_private->pageViews;
      uint64_t v23 = [NSNumber numberWithInt:v18];
      v24 = [(NSMutableDictionary *)pageViews objectForKey:v23];

      int v25 = [v67 pageAtIndex:v18];
      id v26 = self->_private->pageFrames;
      unint64_t v27 = [NSNumber numberWithInt:v18];
      uint64_t v28 = [(NSMutableDictionary *)v26 objectForKey:v27];
      [v28 PDFKitPDFRectValue];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;

      uint64_t v37 = -[PDFDocumentView _pixelAlignPageFrameOrigin:](self, "_pixelAlignPageFrameOrigin:", v30, v32, v34, v36);
      double v39 = v38;
      double v41 = v40;
      CGFloat v42 = PDFRectToCGRect(v37);
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      CGFloat v48 = v47;
      v72.origin.double x = PDFRectToCGRect(v49);
      v72.origin.double y = v50;
      v72.size.double width = v51;
      v72.size.double height = v52;
      v71.origin.double x = v42;
      v71.origin.double y = v44;
      v71.size.double width = v46;
      v71.size.double height = v48;
      if (!CGRectIntersectsRect(v71, v72))
      {
        LOBYTE(v55) = 0;
        BOOL v56 = v24 == 0;
        goto LABEL_37;
      }
      if (v65 == 2)
      {
        int v57 = [v66 displaysAsBook];
        uint64_t v58 = [v66 currentPage];
        v53 = (void *)v58;
        if (v18 || !v57)
        {
          uint64_t v59 = [v64 facingPageForPage:v58];

          v60 = [v66 currentPage];
          BOOL v55 = v60 == v25 || v59 == (void)v25;

          v53 = (void *)v59;
          goto LABEL_28;
        }
        BOOL v54 = v58 == (void)v25;
      }
      else
      {
        if (v65)
        {
          BOOL v55 = 1;
          goto LABEL_29;
        }
        v53 = [v66 currentPage];
        BOOL v54 = v53 == v25;
      }
      BOOL v55 = v54;
LABEL_28:

LABEL_29:
      BOOL v56 = v24 == 0;
      if (v24 && v55)
      {
        objc_msgSend(v24, "setFrame:", v39, v41, v34, v36);
        [(PDFDocumentView *)self _updateVisibilityDelegateForVisiblePageView:v24 atIndex:v18];
LABEL_40:

        goto LABEL_41;
      }
      if (v24) {
        BOOL v62 = 0;
      }
      else {
        BOOL v62 = v55;
      }
      if (v62)
      {
        v24 = -[PDFDocumentView createPageViewForPageAtIndex:withFrame:](self, "createPageViewForPageAtIndex:withFrame:", v18, v39, v41, v34, v36);
        goto LABEL_40;
      }
LABEL_37:
      if (!v56 && !v55) {
        [(PDFDocumentView *)self removePageViewForPageAtIndex:v18];
      }
      goto LABEL_40;
    }
LABEL_42:
    [MEMORY[0x263F158F8] commit];
    id v63 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
    if ([v63 isUsingPDFExtensionView]) {
      [v66 syncPageIndexToScrollView];
    }

    id WeakRetained = v66;
  }
}

- (void)previewRotateShiftPages:(double)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = [(NSMutableDictionary *)self->_private->pageViews allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v9 frame];
        [v9 setFrame:v10 + a3];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)willForceUpdate
{
}

- (void)forceUpdateActivePageIndex:(unint64_t)a3 withMaxDuration:(double)a4
{
  [(PDFDocumentView *)self updateVisibility];
  pageBackgroundManager = self->_private->pageBackgroundManager;

  [(PDFPageBackgroundManager *)pageBackgroundManager forceUpdateActivePageIndex:a3 withMaxDuration:a4];
}

- (id)pageBackgroundManager
{
  return self->_private->pageBackgroundManager;
}

- (id)_createPageView:(id)a3
{
  p_pdfView = &self->_private->pdfView;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pdfView);
  uint64_t v7 = [PDFPageView alloc];
  id v8 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
  double v9 = [(PDFPageView *)v7 initWithPage:v5 geometryInterface:WeakRetained andRenderingProperties:v8];

  double v10 = [(PDFDocumentView *)self document];
  uint64_t v11 = [v10 indexForPage:v5];

  unsigned int v14 = 0;
  long long v12 = [(PDFPageBackgroundManager *)self->_private->pageBackgroundManager backgroundImageForPageIndex:v11 withFoundQuality:&v14];
  if (v12) {
    [(PDFPageView *)v9 setBackgroundImage:v12 atBackgroundQuality:v14];
  }

  return v9;
}

- (void)willInsertPage:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)didInsertPage:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [(PDFDocumentView *)self _shiftPagesAtIndex:a4 downwards:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  [v6 setView:WeakRetained];
  uint64_t v7 = [(PDFDocumentView *)self _createPageView:v6];

  [WeakRetained callPageVisibilityDelegateMethod:0 forPageView:v7 atPageIndex:a4];
  [(PDFDocumentView *)self addSubview:v7];
  pageViews = self->_private->pageViews;
  double v9 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)pageViews setObject:v7 forKey:v9];

  [(PDFPageBackgroundManager *)self->_private->pageBackgroundManager didInsertPageAtIndex:a4];
  double v10 = [WeakRetained PDFLayout];
  [v10 invalidateInternalDocumentGeometry];
  [(PDFDocumentView *)self layoutDocumentView];
  [WeakRetained callPageVisibilityDelegateMethod:1 forPageView:v7 atPageIndex:a4];
  [(PDFDocumentView *)self _reAddPageOverlaysStartingAtIndex:a4 + 1];
  [(PDFDocumentView *)self updateVisibility];
}

- (void)willRemovePage:(id)a3 atIndex:(unint64_t)a4
{
  [(PDFDocumentView *)self _removePageOverlaysStartingAtIndex:a4 + 1];
  pageViews = self->_private->pageViews;
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a4];
  id v10 = [(NSMutableDictionary *)pageViews objectForKey:v7];

  uint64_t v8 = [v10 visibilityDelegateIndex];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  [WeakRetained callPageVisibilityDelegateMethod:2 forPageView:v10 atPageIndex:v8];
}

- (void)didRemovePage:(id)a3 atIndex:(unint64_t)a4
{
  [a3 setView:0];
  pageViews = self->_private->pageViews;
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a4];
  id v14 = [(NSMutableDictionary *)pageViews objectForKey:v7];

  uint64_t v8 = [v14 visibilityDelegateIndex];
  double v9 = self->_private->pageViews;
  id v10 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)v9 removeObjectForKey:v10];

  [v14 removeFromSuperview];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  [WeakRetained callPageVisibilityDelegateMethod:3 forPageView:v14 atPageIndex:v8];

  [(PDFDocumentView *)self _shiftPagesAtIndex:a4 + 1 downwards:0];
  [(PDFPageBackgroundManager *)self->_private->pageBackgroundManager didRemovePageAtIndex:a4];
  id v12 = objc_loadWeakRetained((id *)&self->_private->pdfView);
  long long v13 = [v12 PDFLayout];
  [v13 invalidateInternalDocumentGeometry];
  [(PDFDocumentView *)self layoutDocumentView];
  [(PDFDocumentView *)self _reAddPageOverlaysStartingAtIndex:a4];
  [(PDFDocumentView *)self updateVisibility];
}

- (void)willSwapPage:(id)a3 atIndex:(unint64_t)a4 forPage:(id)a5 atIndex:(unint64_t)a6
{
  pageViews = self->_private->pageViews;
  double v9 = [NSNumber numberWithUnsignedInteger:a4];
  id v16 = [(NSMutableDictionary *)pageViews objectForKey:v9];

  id v10 = self->_private->pageViews;
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:a6];
  id v12 = [(NSMutableDictionary *)v10 objectForKey:v11];

  uint64_t v13 = [v16 visibilityDelegateIndex];
  uint64_t v14 = [v12 visibilityDelegateIndex];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  [WeakRetained callPageVisibilityDelegateMethod:2 forPageView:v16 atPageIndex:v13];
  [WeakRetained callPageVisibilityDelegateMethod:3 forPageView:v16 atPageIndex:v13];
  [WeakRetained callPageVisibilityDelegateMethod:2 forPageView:v12 atPageIndex:v14];
  [WeakRetained callPageVisibilityDelegateMethod:3 forPageView:v12 atPageIndex:v14];
}

- (void)didSwapPage:(id)a3 atIndex:(unint64_t)a4 forPage:(id)a5 atIndex:(unint64_t)a6
{
  pageViews = self->_private->pageViews;
  id v10 = [NSNumber numberWithUnsignedInteger:a4];
  id v24 = [(NSMutableDictionary *)pageViews objectForKey:v10];

  uint64_t v11 = self->_private->pageViews;
  id v12 = [NSNumber numberWithUnsignedInteger:a6];
  uint64_t v13 = [(NSMutableDictionary *)v11 objectForKey:v12];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  [WeakRetained callPageVisibilityDelegateMethod:0 forPageView:v24 atPageIndex:a6];
  [WeakRetained callPageVisibilityDelegateMethod:0 forPageView:v13 atPageIndex:a4];
  double v15 = self->_private->pageViews;
  id v16 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)v15 removeObjectForKey:v16];

  int v17 = self->_private->pageViews;
  uint64_t v18 = [NSNumber numberWithUnsignedInteger:a6];
  [(NSMutableDictionary *)v17 removeObjectForKey:v18];

  if (v24)
  {
    double v19 = self->_private->pageViews;
    int v20 = [NSNumber numberWithUnsignedInteger:a6];
    [(NSMutableDictionary *)v19 setObject:v24 forKey:v20];
  }
  if (v13)
  {
    id v21 = self->_private->pageViews;
    uint64_t v22 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v21 setObject:v13 forKey:v22];
  }
  [(PDFPageBackgroundManager *)self->_private->pageBackgroundManager didSwapPageAtIndex:a4 withIndex:a6];
  uint64_t v23 = [WeakRetained PDFLayout];
  [v23 invalidateInternalDocumentGeometry];
  [(PDFDocumentView *)self layoutDocumentView];
  if (v24) {
    [WeakRetained callPageVisibilityDelegateMethod:1 forPageView:v24 atPageIndex:a6];
  }
  if (v13) {
    [WeakRetained callPageVisibilityDelegateMethod:1 forPageView:v13 atPageIndex:a4];
  }
  [(PDFDocumentView *)self updateVisibility];
}

- (void)_shiftPagesAtIndex:(unint64_t)a3 downwards:(BOOL)a4
{
  BOOL v26 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v7 = [(NSMutableDictionary *)self->_private->pageViews allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v12 unsignedIntegerValue] >= a3)
        {
          uint64_t v13 = [(NSMutableDictionary *)self->_private->pageViews objectForKey:v12];
          [v6 setObject:v13 forKey:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v9);
  }

  pageViews = self->_private->pageViews;
  double v15 = [v6 allKeys];
  [(NSMutableDictionary *)pageViews removeObjectsForKeys:v15];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [v6 allKeys];
  uint64_t v16 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    if (v26) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = -1;
    }
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        uint64_t v22 = [v21 unsignedIntegerValue] + v19;
        uint64_t v23 = [v6 objectForKey:v21];
        id v24 = self->_private->pageViews;
        int v25 = [NSNumber numberWithUnsignedInteger:v22];
        [(NSMutableDictionary *)v24 setObject:v23 forKey:v25];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v17);
  }
}

- (void)_removePageOverlaysStartingAtIndex:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(NSMutableDictionary *)self->_private->pageViews allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 unsignedIntegerValue] >= a3)
        {
          uint64_t v11 = [(NSMutableDictionary *)self->_private->pageViews objectForKey:v10];
          uint64_t v12 = [v11 visibilityDelegateIndex];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
          [WeakRetained callPageVisibilityDelegateMethod:2 forPageView:v11 atPageIndex:v12];
          [WeakRetained callPageVisibilityDelegateMethod:3 forPageView:v11 atPageIndex:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_reAddPageOverlaysStartingAtIndex:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(NSMutableDictionary *)self->_private->pageViews allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v11 = [v10 unsignedIntegerValue];
        if (v11 >= a3)
        {
          unint64_t v12 = v11;
          uint64_t v13 = [(NSMutableDictionary *)self->_private->pageViews objectForKey:v10];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
          [WeakRetained callPageVisibilityDelegateMethod:0 forPageView:v13 atPageIndex:v12];
          [WeakRetained callPageVisibilityDelegateMethod:1 forPageView:v13 atPageIndex:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)_updateVisibilityDelegateForVisiblePageView:(id)a3 atIndex:(unint64_t)a4
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = [WeakRetained delegate];

    if (v8)
    {
      uint64_t v9 = [v11 visibilityDelegateIndex];
      uint64_t v10 = v9;
      if (v9 == 0x7FFFFFFFFFFFFFFFLL || v9 != a4)
      {
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v7 callPageVisibilityDelegateMethod:2 forPageView:v11 atPageIndex:v9];
          [v7 callPageVisibilityDelegateMethod:3 forPageView:v11 atPageIndex:v10];
        }
        [v7 callPageVisibilityDelegateMethod:0 forPageView:v11 atPageIndex:a4];
        [v7 callPageVisibilityDelegateMethod:1 forPageView:v11 atPageIndex:a4];
      }
    }
  }
}

- (void)changedBoundsForBoxNotification:(id)a3
{
  if (!self->_private->ignoreChangedBoundsForBoxNotification) {
    [(PDFDocumentView *)self updateVisibility];
  }
}

- (void)didRotatePageNotification:(id)a3
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__PDFDocumentView_didRotatePageNotification___block_invoke;
  block[3] = &unk_264204088;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__PDFDocumentView_didRotatePageNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = objc_loadWeakRetained((id *)(WeakRetained[62] + 8));
    double v4 = [v3 PDFLayout];

    [v4 invalidateInternalDocumentGeometry];
    [*(id *)(a1 + 32) layoutDocumentView];

    id WeakRetained = v5;
  }
}

- (id)backgroundImageForPage:(id)a3 withQuality:(int *)a4
{
  id v6 = a3;
  uint64_t v7 = self->_private->pageViews;
  objc_sync_enter(v7);
  uint64_t v8 = [(PDFDocumentView *)self document];
  uint64_t v9 = [v8 indexForPage:v6];

  pageViews = self->_private->pageViews;
  id v11 = [NSNumber numberWithUnsignedInteger:v9];
  unint64_t v12 = [(NSMutableDictionary *)pageViews objectForKey:v11];

  if (v12 && [v12 hasBackgroundImage])
  {
    *a4 = [v12 backgroundImageQuality];
    uint64_t v13 = [v12 backgroundImage];
  }
  else
  {
    uint64_t v13 = 0;
  }

  objc_sync_exit(v7);

  return v13;
}

- (void)recieveBackgroundImage:(id)a3 atBackgroundQuality:(int)a4 forPage:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v15 = a3;
  id v8 = a5;
  uint64_t v9 = self->_private->pageViews;
  objc_sync_enter(v9);
  uint64_t v10 = [(PDFDocumentView *)self document];
  uint64_t v11 = [v10 indexForPage:v8];

  pageViews = self->_private->pageViews;
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:v11];
  long long v14 = [(NSMutableDictionary *)pageViews objectForKey:v13];

  if (v14) {
    [v14 setBackgroundImage:v15 atBackgroundQuality:v6];
  }

  objc_sync_exit(v9);
}

- (id)pdfView
{
  v2 = self->_private;
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)&v2->pdfView);
  }
  else {
    id WeakRetained = 0;
  }

  return WeakRetained;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PDFDocumentView;
  id v8 = -[PDFDocumentView hitTest:withEvent:](&v32, sel_hitTest_withEvent_, v7, x, y);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  id v10 = objc_loadWeakRetained((id *)&self->_private->pointerTrackingView);
  if ([v7 type] == 11)
  {
    -[PDFDocumentView convertPoint:toView:](self, "convertPoint:toView:", WeakRetained, x, y);
    double v12 = v11;
    double v14 = v13;
    id v15 = objc_msgSend(WeakRetained, "pageForPoint:nearest:", 0);
    objc_msgSend(WeakRetained, "convertPoint:toPage:", v15, v12, v14);
    double v17 = v16;
    double v19 = v18;
    uint64_t v20 = objc_msgSend(v15, "annotationAtPoint:");
    if (v20
      || (objc_msgSend(v15, "scannedAnnotationAtPoint:", v17, v19),
          (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v21 = [v10 annotation];

      if (v20 != v21)
      {
        [v10 removeFromSuperview];
        [v20 bounds];
        objc_msgSend(WeakRetained, "convertRect:fromPage:", v15);
        objc_msgSend(WeakRetained, "convertRect:toView:", self);
        BOOL v26 = -[PDFAnnotationPointerTrackingView initWithFrame:annotation:]([PDFAnnotationPointerTrackingView alloc], "initWithFrame:annotation:", v20, v22, v23, v24, v25);

        [(PDFDocumentView *)self addSubview:v26];
        objc_storeWeak((id *)&self->_private->pointerTrackingView, v26);
        id v10 = v26;
      }
    }
  }
  else
  {
    [v10 removeFromSuperview];
  }
  if (([WeakRetained isInMarkupMode] & 1) != 0
    || ([WeakRetained isFormDetectionEnabled] & 1) != 0)
  {
    uint64_t v27 = objc_msgSend(WeakRetained, "hitTestForSubviewsOfView:atLocation:withEvent:", self, v7, x, y);
    long long v28 = (void *)v27;
    if (v27) {
      long long v29 = (void *)v27;
    }
    else {
      long long v29 = v8;
    }
    id v30 = v29;
  }
  else
  {
    id v30 = v8;
  }

  return v30;
}

- (CGVector)_scaleFromLayerTransforms
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pdfView);
  id v4 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
  int v5 = [v4 isUsingPDFExtensionView];

  if (v5)
  {
    [WeakRetained extensionViewZoomScale];
    double v7 = v6;
  }
  else
  {
    id v8 = [WeakRetained documentScrollView];
    [v8 zoomScale];
    double v7 = v9;
  }
  double v10 = v7;
  double v11 = v7;
  result.ddouble y = v11;
  result.ddouble x = v10;
  return result;
}

- (void).cxx_destruct
{
}

@end