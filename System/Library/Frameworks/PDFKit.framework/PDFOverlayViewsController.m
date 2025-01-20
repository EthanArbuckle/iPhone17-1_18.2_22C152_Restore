@interface PDFOverlayViewsController
+ (id)instanceForPlatformWithPDFView:(id)a3;
- (PDFDocument)pdfDocument;
- (PDFOverlayViewsController)initWithPDFView:(id)a3;
- (PDFPageOverlayViewProvider)viewProvider;
- (PDFView)pdfView;
- (id)_cachedOverlayViewForPage:(id)a3;
- (id)_callOverlayViewForPage:(id)a3;
- (void)_callWillEndDisplayingOverlayViewForPage:(id)a3;
- (void)_pageRotationChanged:(id)a3;
- (void)_setupRotationNotificationObservationForPageAtIndex:(unint64_t)a3;
- (void)_teardown;
- (void)_teardownRotationNotificationObservationForPageAtIndex:(unint64_t)a3;
- (void)_uninstallAllOverlays;
- (void)dealloc;
- (void)pdfView:(id)a3 didAddView:(id)a4 forPage:(id)a5 atIndex:(unint64_t)a6;
- (void)pdfView:(id)a3 didSetDocument:(id)a4;
- (void)pdfView:(id)a3 willRemoveView:(id)a4 forPage:(id)a5 atIndex:(unint64_t)a6;
- (void)pdfView:(id)a3 willSetDocument:(id)a4;
- (void)setPdfDocument:(id)a3;
- (void)setPdfView:(id)a3;
- (void)setViewProvider:(id)a3;
- (void)teardown;
@end

@implementation PDFOverlayViewsController

+ (id)instanceForPlatformWithPDFView:(id)a3
{
  id v3 = a3;
  v4 = [[PDFOverlayViewsController_ios alloc] initWithPDFView:v3];

  return v4;
}

- (PDFOverlayViewsController)initWithPDFView:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PDFOverlayViewsController;
  v5 = [(PDFOverlayViewsController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_pdfView, v4);
    uint64_t v7 = objc_opt_new();
    observedPageIndices = v6->_observedPageIndices;
    v6->_observedPageIndices = (NSMutableIndexSet *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    pageToOverlayMap = v6->_pageToOverlayMap;
    v6->_pageToOverlayMap = (NSMapTable *)v9;
  }
  return v6;
}

- (void)dealloc
{
  if (!self->_isTornDown)
  {
    if ([MEMORY[0x263F08B88] isMainThread]) {
      [(PDFOverlayViewsController *)self _teardown];
    }
    else {
      NSLog(&cfstr_SCalledFromABa.isa, "-[PDFOverlayViewsController dealloc]");
    }
  }
  v3.receiver = self;
  v3.super_class = (Class)PDFOverlayViewsController;
  [(PDFOverlayViewsController *)&v3 dealloc];
}

- (void)teardown
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    [(PDFOverlayViewsController *)self _teardown];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__PDFOverlayViewsController_teardown__block_invoke;
    block[3] = &unk_264203940;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __37__PDFOverlayViewsController_teardown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _teardown];
}

- (void)_teardown
{
  if (!self->_isTornDown)
  {
    self->_isTornDown = 1;
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self];
  }
}

- (void)pdfView:(id)a3 willSetDocument:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);

  if (WeakRetained != v6 && WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_viewProvider);
    if (objc_opt_respondsToSelector()) {
      [v8 teardownGestureRecognizersForView:v9];
    }
    [(PDFOverlayViewsController *)self _uninstallAllOverlays];
  }
}

- (void)pdfView:(id)a3 didSetDocument:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);

  if (WeakRetained != v6)
  {
    objc_storeWeak((id *)&self->_pdfDocument, v6);
    if (v6)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_viewProvider);
      if (objc_opt_respondsToSelector()) {
        [v8 setupGestureRecognizersForView:v9];
      }
    }
  }
}

- (void)pdfView:(id)a3 didAddView:(id)a4 forPage:(id)a5 atIndex:(unint64_t)a6
{
  id v11 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);

  if (WeakRetained)
  {
    [(PDFOverlayViewsController *)self _installOverlayForPageView:v11 ofPage:v9 atIndex:a6];
    [(PDFOverlayViewsController *)self _setupRotationNotificationObservationForPageAtIndex:a6];
  }
}

- (void)pdfView:(id)a3 willRemoveView:(id)a4 forPage:(id)a5 atIndex:(unint64_t)a6
{
  id v11 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);

  if (WeakRetained)
  {
    [(PDFOverlayViewsController *)self _teardownRotationNotificationObservationForPageAtIndex:a6];
    [(PDFOverlayViewsController *)self _uninstallOverlayForPageView:v11 ofPage:v9 atIndex:a6];
  }
}

- (id)_cachedOverlayViewForPage:(id)a3
{
  return [(NSMapTable *)self->_pageToOverlayMap objectForKey:a3];
}

- (id)_callOverlayViewForPage:(id)a3
{
  id v4 = a3;
  v5 = [(NSMapTable *)self->_pageToOverlayMap objectForKey:v4];
  if (!v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
    uint64_t v7 = [(PDFOverlayViewsController *)self pdfView];
    v5 = [WeakRetained pdfView:v7 overlayViewForPage:v4];

    if (v5) {
      [(NSMapTable *)self->_pageToOverlayMap setObject:v5 forKey:v4];
    }
  }

  return v5;
}

- (void)_callWillEndDisplayingOverlayViewForPage:(id)a3
{
  id v7 = a3;
  id v4 = [(PDFOverlayViewsController *)self viewProvider];
  v5 = [(PDFOverlayViewsController *)self _cachedOverlayViewForPage:v7];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(PDFOverlayViewsController *)self pdfView];
    [v4 pdfView:v6 willEndDisplayingOverlayView:v5 forPage:v7];
  }
  [(NSMapTable *)self->_pageToOverlayMap removeObjectForKey:v7];
}

- (void)_uninstallAllOverlays
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    uint64_t v4 = [WeakRetained pageCount];
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    if (v4)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        [(PDFOverlayViewsController *)self _teardownRotationNotificationObservationForPageAtIndex:i];
        id v6 = objc_loadWeakRetained((id *)&self->_pdfView);
        id v7 = [v6 pageViewForPageAtIndex:i];

        id v8 = [v9 pageAtIndex:i];
        [(PDFOverlayViewsController *)self _uninstallOverlayForPageView:v7 ofPage:v8 atIndex:i];
      }
    }
    [MEMORY[0x263F158F8] commit];
    id WeakRetained = v9;
  }
}

- (void)_setupRotationNotificationObservationForPageAtIndex:(unint64_t)a3
{
  if ((-[NSMutableIndexSet containsIndex:](self->_observedPageIndices, "containsIndex:") & 1) == 0)
  {
    if (![(NSMutableIndexSet *)self->_observedPageIndices count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);
      id v6 = [MEMORY[0x263F08A00] defaultCenter];
      [v6 addObserver:self selector:sel__pageRotationChanged_ name:@"PDFPageDidRotate" object:WeakRetained];
    }
    observedPageIndices = self->_observedPageIndices;
    [(NSMutableIndexSet *)observedPageIndices addIndex:a3];
  }
}

- (void)_teardownRotationNotificationObservationForPageAtIndex:(unint64_t)a3
{
  if (-[NSMutableIndexSet containsIndex:](self->_observedPageIndices, "containsIndex:"))
  {
    [(NSMutableIndexSet *)self->_observedPageIndices removeIndex:a3];
    if (![(NSMutableIndexSet *)self->_observedPageIndices count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);
      v5 = [MEMORY[0x263F08A00] defaultCenter];
      [v5 removeObserver:self name:@"PDFPageDidRotate" object:WeakRetained];
    }
  }
}

- (void)_pageRotationChanged:(id)a3
{
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);
  id v5 = [v12 object];
  if (v5 == WeakRetained)
  {
    id v6 = [v12 userInfo];
    id v7 = [v6 objectForKey:@"page"];
    unint64_t v8 = [WeakRetained indexForPage:v7];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v9 = v8;
      if (v8 < [WeakRetained pageCount])
      {
        id v10 = objc_loadWeakRetained((id *)&self->_pdfView);
        id v11 = [v10 pageViewForPageAtIndex:v9];
        [v11 setEnableTileUpdates:0];
        [MEMORY[0x263F158F8] begin];
        [MEMORY[0x263F158F8] setDisableActions:1];
        [(PDFOverlayViewsController *)self _uninstallOverlayForPageView:v11 ofPage:v7 atIndex:v9];
        [v10 layoutDocumentView];
        [(PDFOverlayViewsController *)self _installOverlayForPageView:v11 ofPage:v7 atIndex:v9];
        [MEMORY[0x263F158F8] commit];
        [v11 setEnableTileUpdates:1];
      }
    }
  }
}

- (PDFView)pdfView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);

  return (PDFView *)WeakRetained;
}

- (void)setPdfView:(id)a3
{
}

- (PDFDocument)pdfDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);

  return (PDFDocument *)WeakRetained;
}

- (void)setPdfDocument:(id)a3
{
}

- (PDFPageOverlayViewProvider)viewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);

  return (PDFPageOverlayViewProvider *)WeakRetained;
}

- (void)setViewProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_destroyWeak((id *)&self->_pdfDocument);
  objc_destroyWeak((id *)&self->_pdfView);
  objc_storeStrong((id *)&self->_observedPageIndices, 0);

  objc_storeStrong((id *)&self->_pageToOverlayMap, 0);
}

@end