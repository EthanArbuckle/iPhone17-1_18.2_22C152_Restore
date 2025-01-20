@interface PDFAKDocumentAdaptor
+ (BOOL)isHandlingEditDetected;
+ (void)setIsHandlingEditDetected:(BOOL)a3;
- (AKController)akMainController;
- (AKModelController)akDocumentModelController;
- (BOOL)controllerShouldDetectFormElements:(id)a3;
- (BOOL)handleBackTabInTextEditorForAnnotation:(id)a3 forAnnotationController:(id)a4;
- (BOOL)handleTabInTextEditorForAnnotation:(id)a3 forAnnotationController:(id)a4;
- (BOOL)hasHighlightableSelectionForAnnotationController:(id)a3;
- (BOOL)rulerHostWantsSharedRuler;
- (BOOL)shouldAddTabControlsToTextEditorForAnnotation:(id)a3 forAnnotationController:(id)a4;
- (BOOL)shouldPlaceFormElementAtPoint:(CGPoint)a3 onOverlayAtPageIndex:(unint64_t)a4 forAnnotationController:(id)a5;
- (BOOL)shouldPlaceProposedFormElementAtRect:(CGRect)a3 onOverlayAtPageIndex:(unint64_t)a4 forAnnotationController:(id)a5;
- (CGAffineTransform)_compensatingAffineTransformForPage:(SEL)a3;
- (CGPoint)convertPoint:(CGPoint)a3 fromModelToOverlayWithPageIndex:(unint64_t)a4 forAnnotationController:(id)a5;
- (CGPoint)convertPoint:(CGPoint)a3 fromOverlayToModelWithPageIndex:(unint64_t)a4 forAnnotationController:(id)a5;
- (CGRect)maxPageRectWithPageIndex:(unint64_t)a3 forAnnotationController:(id)a4;
- (CGRect)positioningRectForCandidatePicker;
- (PDFAKControllerDelegateProtocol)PDFAKControllerDelegate;
- (PDFAKDocumentAdaptor)initWithPDFDocument:(id)a3 andView:(id)a4;
- (PDFDocument)pdfDocument;
- (PDFView)pdfView;
- (UIView)akToolbarView;
- (double)modelBaseScaleFactorOfPageAtIndex:(unint64_t)a3 forAnnotationController:(id)a4;
- (id)_scrollViewRecognizersForPageAtIndex:(unint64_t)a3;
- (id)controller:(id)a3 willSetToolbarItems:(id)a4;
- (id)layerContainingQuickBackgroundForLoupeOnOverlayAtPageIndex:(unint64_t)a3 forAnnotationController:(id)a4;
- (id)newContentSnapshotPDFDataIncludingAdornments:(BOOL)a3 atScale:(double)a4 inRect:(CGRect)a5 onOverlayAtPageIndex:(unint64_t)a6 forAnnotationController:(id)a7;
- (id)popoverPresentingViewControllerForAnnotationController:(id)a3;
- (id)rulerHostingView;
- (id)undoManagerForAnnotationController:(id)a3;
- (unint64_t)pageIndexForAnnotation:(id)a3;
- (void)_adjustScrollViewWithAnimationProperties:(TextAnnotationAnimationProperties *)a3 delta:(double)a4;
- (void)_delayedModelBaseScaleFactorCalculation;
- (void)_pdfDocumentDidUnlock:(id)a3;
- (void)_resetAnimationProperties;
- (void)_scheduleDelayedModelBaseScaleFactorCalculation;
- (void)_teardown;
- (void)_updatePDFScrollViewMinimumNumberOfTouches;
- (void)adjustScrollViewForKeyboardNotification:(id)a3;
- (void)annotationDidEndEditing:(id)a3;
- (void)annotationWillBeginEditing:(id)a3;
- (void)controllerDidEnterToolMode:(id)a3;
- (void)controllerDidExitToolMode:(id)a3;
- (void)controllerWillDismissSignatureCaptureView:(id)a3;
- (void)controllerWillDismissSignatureManagerView:(id)a3;
- (void)controllerWillEnterToolMode:(id)a3;
- (void)controllerWillExitToolMode:(id)a3;
- (void)controllerWillShowSignatureCaptureView:(id)a3;
- (void)controllerWillShowSignatureManagerView:(id)a3;
- (void)dealloc;
- (void)editCheckpointReachedForAnnotationController:(id)a3;
- (void)editDetectedForAnnotationController:(id)a3;
- (void)handleTextSuggestion:(id)a3 forAnnotationController:(id)a4 completionHandler:(id)a5;
- (void)installDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pdfDocument:(id)a3 didExchangePage:(id)a4 atIndex:(unint64_t)a5 withPage:(id)a6 atIndex:(unint64_t)a7;
- (void)pdfDocument:(id)a3 didInsertPage:(id)a4 atIndex:(unint64_t)a5;
- (void)pdfDocument:(id)a3 didRemovePage:(id)a4 atIndex:(unint64_t)a5;
- (void)pdfDocument:(id)a3 didReplacePagePlaceholder:(id)a4 atIndex:(unint64_t)a5 withPage:(id)a6;
- (void)pdfDocumentDidRemoveAllPagesOrPlaceholders:(id)a3;
- (void)penStrokeCompletedForAnnotationController:(id)a3;
- (void)positionSketchOverlay:(id)a3 forAnnotationController:(id)a4;
- (void)rotateLeft:(id)a3;
- (void)rotateRight:(id)a3;
- (void)setPDFAKControllerDelegate:(id)a3;
- (void)setPdfView:(id)a3;
- (void)teardown;
- (void)uninstallDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5;
- (void)updateDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 withPriority:(BOOL)a5 forAnnotationController:(id)a6;
@end

@implementation PDFAKDocumentAdaptor

- (PDFAKDocumentAdaptor)initWithPDFDocument:(id)a3 andView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (GetDefaultsWriteAKEnabled())
  {
    v21.receiver = self;
    v21.super_class = (Class)PDFAKDocumentAdaptor;
    v8 = [(PDFAKDocumentAdaptor *)&v21 init];
    p_isa = (id *)&v8->super.isa;
    if (v8)
    {
      v8->_modelBaseScaleFactor = 9.22337204e18;
      objc_storeWeak((id *)&v8->_pdfDocument, v6);
      objc_storeWeak(p_isa + 3, v7);
      v10 = [AKControllerClass() controllerWithDelegate:p_isa];
      objc_storeStrong(p_isa + 4, v10);
      [p_isa[4] setRulerHostingDelegate:p_isa];
      [(id)objc_opt_class() addObserver:p_isa forKeyPath:@"prefersPencilOnlyDrawing" options:0 context:0];
      [p_isa _resetAnimationProperties];
      v11 = [MEMORY[0x263F08A00] defaultCenter];
      [v11 addObserver:p_isa selector:sel_adjustScrollViewForKeyboardNotification_ name:*MEMORY[0x263F83808] object:0];

      v12 = [MEMORY[0x263F08A00] defaultCenter];
      v13 = AKDidEndEditingTextAnnotationNotificationString();
      [v12 addObserver:p_isa selector:sel_annotationDidEndEditing_ name:v13 object:0];

      v14 = [MEMORY[0x263F08A00] defaultCenter];
      v15 = AKWillBeginEditingTextAnnotationNotificationString();
      [v14 addObserver:p_isa selector:sel_annotationWillBeginEditing_ name:v15 object:0];

      objc_storeWeak(p_isa + 5, 0);
      [v10 setAnnotationEditingEnabled:0];
      if ([v6 isLocked] && !objc_msgSend(v6, "pageCount"))
      {
        v16 = [MEMORY[0x263F08A00] defaultCenter];
        [v16 addObserver:p_isa selector:sel__pdfDocumentDidUnlock_ name:@"PDFDocumentDidUnlock" object:v6];
      }
      v17 = [MEMORY[0x263F08A00] defaultCenter];
      [v17 addObserver:p_isa selector:sel__pdfViewDidLayout_ name:@"PDFViewDidLayoutDocumentView" object:v7];

      v18 = [MEMORY[0x263F08A00] defaultCenter];
      [v18 addObserver:p_isa selector:sel__pdfViewDidChangeScale_ name:@"PDFViewScaleChanged" object:v7];
    }
    self = p_isa;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)dealloc
{
  if (!self->_isTornDown)
  {
    if ([MEMORY[0x263F08B88] isMainThread]) {
      [(PDFAKDocumentAdaptor *)self _teardown];
    }
    else {
      NSLog(&cfstr_SCalledFromABa.isa, "-[PDFAKDocumentAdaptor dealloc]");
    }
  }
  v3.receiver = self;
  v3.super_class = (Class)PDFAKDocumentAdaptor;
  [(PDFAKDocumentAdaptor *)&v3 dealloc];
}

- (void)teardown
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    [(PDFAKDocumentAdaptor *)self _teardown];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__PDFAKDocumentAdaptor_teardown__block_invoke;
    block[3] = &unk_264203940;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __32__PDFAKDocumentAdaptor_teardown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _teardown];
}

- (void)_teardown
{
  if (!self->_isTornDown)
  {
    self->_isTornDown = 1;
    objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self];

    [(id)objc_opt_class() removeObserver:self forKeyPath:@"prefersPencilOnlyDrawing"];
    [(AKController *)self->_akController teardown];
    akController = self->_akController;
    self->_akController = 0;

    objc_storeWeak((id *)&self->_pdfAKControllerDelegate, 0);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"prefersPencilOnlyDrawing"])
  {
    [(PDFAKDocumentAdaptor *)self _updatePDFScrollViewMinimumNumberOfTouches];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PDFAKDocumentAdaptor;
    [(PDFAKDocumentAdaptor *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
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

- (AKController)akMainController
{
  return self->_akController;
}

- (AKModelController)akDocumentModelController
{
  return (AKModelController *)[(AKController *)self->_akController modelController];
}

- (UIView)akToolbarView
{
  akToolbarView = self->_akToolbarView;
  if (!akToolbarView)
  {
    v4 = objc_msgSend(objc_alloc((Class)AKToolbarViewClass()), "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v4 setShareButtonHidden:1];
    v5 = self->_akToolbarView;
    self->_akToolbarView = (AKToolbarView *)v4;

    akToolbarView = self->_akToolbarView;
  }
  [(AKToolbarView *)akToolbarView setAnnotationController:self->_akController];
  id v6 = self->_akToolbarView;

  return (UIView *)v6;
}

- (PDFAKControllerDelegateProtocol)PDFAKControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);

  return (PDFAKControllerDelegateProtocol *)WeakRetained;
}

- (void)setPDFAKControllerDelegate:(id)a3
{
}

- (void)pdfDocument:(id)a3 didInsertPage:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = objc_msgSend(a4, "akPageAdaptor", a3);
  id v13 = [v7 akPageModelController];

  v8 = [(PDFAKDocumentAdaptor *)self akDocumentModelController];
  v9 = [v8 mutableArrayValueForKey:@"pageModelControllers"];

  [v9 insertObject:v13 atIndex:a5];
  id v10 = [(PDFAKDocumentAdaptor *)self akMainController];
  uint64_t v11 = [v10 currentPageIndex];

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = [(PDFAKDocumentAdaptor *)self akMainController];
    [v12 setCurrentPageIndex:a5];
  }
}

- (void)pdfDocument:(id)a3 didRemovePage:(id)a4 atIndex:(unint64_t)a5
{
  id v6 = [(PDFAKDocumentAdaptor *)self akDocumentModelController];
  id v7 = [v6 mutableArrayValueForKey:@"pageModelControllers"];

  [v7 removeObjectAtIndex:a5];
}

- (void)pdfDocumentDidRemoveAllPagesOrPlaceholders:(id)a3
{
  objc_super v3 = [(PDFAKDocumentAdaptor *)self akDocumentModelController];
  id v4 = [v3 mutableArrayValueForKey:@"pageModelControllers"];

  [v4 removeAllObjects];
}

- (void)pdfDocument:(id)a3 didExchangePage:(id)a4 atIndex:(unint64_t)a5 withPage:(id)a6 atIndex:(unint64_t)a7
{
  v9 = [(PDFAKDocumentAdaptor *)self akDocumentModelController];
  id v10 = [v9 mutableArrayValueForKey:@"pageModelControllers"];

  [v10 exchangeObjectAtIndex:a5 withObjectAtIndex:a7];
}

- (void)pdfDocument:(id)a3 didReplacePagePlaceholder:(id)a4 atIndex:(unint64_t)a5 withPage:(id)a6
{
  v8 = objc_msgSend(a6, "akPageAdaptor", a3, a4);
  id v15 = [v8 akPageModelController];

  v9 = [(PDFAKDocumentAdaptor *)self akDocumentModelController];
  id v10 = [v9 mutableArrayValueForKey:@"pageModelControllers"];

  if ([v10 count] <= a5)
  {
    [v10 insertObject:v15 atIndex:a5];
  }
  else
  {
    id v11 = [v10 objectAtIndexedSubscript:a5];

    if (v11 != v15) {
      [v10 setObject:v15 atIndexedSubscript:a5];
    }
  }
  id v12 = [(PDFAKDocumentAdaptor *)self akMainController];
  uint64_t v13 = [v12 currentPageIndex];

  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = [(PDFAKDocumentAdaptor *)self akMainController];
    [v14 setCurrentPageIndex:a5];
  }
}

- (id)rulerHostingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);

  return WeakRetained;
}

- (BOOL)rulerHostWantsSharedRuler
{
  return 1;
}

- (id)undoManagerForAnnotationController:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = [WeakRetained undoManagerForAnnotationController:v4];
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)&self->_pdfView);
    id v6 = [v7 undoManager];
  }

  return v6;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromModelToOverlayWithPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  v9 = objc_msgSend(a5, "overlayViewAtIndex:");
  id v10 = [(PDFAKDocumentAdaptor *)self pdfView];
  double v11 = PDFPointFromCGPoint(x, y);
  double v13 = v12;
  v14 = [(PDFAKDocumentAdaptor *)self pdfDocument];
  id v15 = [v14 pageAtIndex:a4];
  objc_msgSend(v10, "convertPoint:fromPage:", v15, v11, v13);
  double v17 = v16;
  double v19 = v18;

  objc_msgSend(v10, "convertPoint:toView:", v9, v17, v19);
  double v22 = PDFPointToCGPoint(v20, v21);
  double v24 = v23;

  double v25 = v22;
  double v26 = v24;
  result.double y = v26;
  result.double x = v25;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromOverlayToModelWithPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  v9 = objc_msgSend(a5, "overlayViewAtIndex:");
  id v10 = [(PDFAKDocumentAdaptor *)self pdfView];
  objc_msgSend(v10, "convertPoint:fromView:", v9, PDFPointFromCGPoint(x, y));
  double v12 = v11;
  double v14 = v13;
  id v15 = [(PDFAKDocumentAdaptor *)self pdfDocument];
  double v16 = [v15 pageAtIndex:a4];
  objc_msgSend(v10, "convertPoint:toPage:", v16, v12, v14);
  double v19 = PDFPointToCGPoint(v17, v18);
  double v21 = v20;

  double v22 = v19;
  double v23 = v21;
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (CGRect)maxPageRectWithPageIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  v5 = [(PDFAKDocumentAdaptor *)self pdfDocument];
  id v6 = [v5 pageAtIndex:a3];
  [v6 boundsForBox:1];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (id)newContentSnapshotPDFDataIncludingAdornments:(BOOL)a3 atScale:(double)a4 inRect:(CGRect)a5 onOverlayAtPageIndex:(unint64_t)a6 forAnnotationController:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v13 = a3;
  double v15 = [(PDFAKDocumentAdaptor *)self akMainController];
  double v16 = [(PDFAKDocumentAdaptor *)self pdfView];
  uint64_t v17 = [(PDFAKDocumentAdaptor *)self pdfDocument];
  double v18 = (void *)v17;
  double v19 = 0;
  if (v16 && v17)
  {
    double v20 = [v15 overlayViewAtIndex:a6];
    double v21 = [v18 pageAtIndex:a6];
    uint64_t v22 = [v21 displaysAnnotations];
    [v21 setDisplaysAnnotations:v13];
    objc_msgSend(v16, "convertRect:fromView:", v20, x, y, width, height);
    objc_msgSend(v16, "convertRect:toPage:", v21);
    double v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    double v30 = v29 - PDFRectToCGRect([v21 boundsForBox:1]);
    double v32 = v24 - v31;
    v51.origin.double x = v30;
    v51.origin.double y = v32;
    v51.size.double width = v26;
    v51.size.double height = v28;
    double v33 = CGRectGetWidth(v51);
    v52.origin.double x = v30;
    v52.origin.double y = v32;
    v52.size.double width = v26;
    v52.size.double height = v28;
    mediaBox.origin.double x = 0.0;
    mediaBox.origin.double y = 0.0;
    double v34 = v33 * a4;
    double v35 = CGRectGetHeight(v52) * a4;
    mediaBox.size.double width = v34;
    mediaBox.size.double height = v35;
    if (CGDisplayListCreateWithRect())
    {
      CGDisplayListSetBoundingBox();
      v36 = (CGContext *)CGDisplayListContextCreate();
      if (v36)
      {
        v37 = v36;
        CGContextSaveGState(v36);
        id v38 = [MEMORY[0x263F825C8] whiteColor];
        CGContextSetFillColorWithColor(v37, (CGColorRef)[v38 CGColor]);

        v53.origin.double x = 0.0;
        v53.origin.double y = 0.0;
        v53.size.double width = v34;
        v53.size.double height = v35;
        CGContextFillRect(v37, v53);
        CGContextScaleCTM(v37, a4, a4);
        v54.origin.double x = v30;
        v54.origin.double y = v32;
        v54.size.double width = v26;
        v54.size.double height = v28;
        CGFloat v39 = -CGRectGetMinX(v54);
        v55.origin.double x = v30;
        v55.origin.double y = v32;
        v55.size.double width = v26;
        v55.size.double height = v28;
        CGFloat MinY = CGRectGetMinY(v55);
        CGContextTranslateCTM(v37, v39, -MinY);
        [(PDFAKDocumentAdaptor *)self _compensatingAffineTransformForPage:v21];
        CGContextConcatCTM(v37, &v49);
        BOOL v41 = +[PDFPage isExcludingAKAnnotationRenderingForThisThread];
        +[PDFPage setExcludingAKAnnotationRenderingForThisThread:1];
        [v21 drawWithBox:1 toContext:v37];
        +[PDFPage setExcludingAKAnnotationRenderingForThisThread:v41];
        CGContextRestoreGState(v37);
        CGContextRelease(v37);
        Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
        v43 = Mutable;
        if (Mutable)
        {
          v44 = CGDataConsumerCreateWithCFData(Mutable);
          if (v44)
          {
            v45 = v44;
            v46 = CGPDFContextCreate(v44, &mediaBox, 0);
            if (v46)
            {
              v47 = v46;
              CGPDFContextBeginPage(v46, 0);
              CGContextSaveGState(v47);
              CGDisplayListDrawInContext();
              CGContextRestoreGState(v47);
              CGPDFContextEndPage(v47);
              CGPDFContextClose(v47);
              CGContextRelease(v47);
            }
            CGDataConsumerRelease(v45);
          }
        }
      }
      else
      {
        v43 = 0;
      }
      CGDisplayListRelease();
    }
    else
    {
      v43 = 0;
    }
    [v21 setDisplaysAnnotations:v22];
    double v19 = v43;
  }
  return v19;
}

- (CGAffineTransform)_compensatingAffineTransformForPage:(SEL)a3
{
  id v5 = a4;
  uint64_t v6 = [v5 rotation];
  double v7 = PDFDegToRad((double)v6);
  [v5 boundsForBox:1];

  PDFRectToCGRect(v8);
  double v10 = v9;
  double v12 = v11;
  memset(&v20, 0, sizeof(v20));
  CGAffineTransformMakeRotation(&v20, v7);
  long long v13 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v19.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v19.c = v13;
  *(_OWORD *)&v19.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  switch(v6)
  {
    case 270:
      CGFloat v15 = 0.0;
LABEL_7:
      CGFloat v14 = v12;
      goto LABEL_8;
    case 180:
      CGFloat v15 = v10;
      goto LABEL_7;
    case 90:
      CGFloat v14 = 0.0;
      CGFloat v15 = v10;
LABEL_8:
      CGAffineTransformMakeTranslation(&v19, v15, v14);
      break;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransform t1 = v20;
  CGAffineTransform v17 = v19;
  return CGAffineTransformConcat(retstr, &t1, &v17);
}

- (id)popoverPresentingViewControllerForAnnotationController:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = [WeakRetained popoverPresentingViewControllerForAnnotationController:v4];
  }
  else
  {
    double v7 = [(PDFAKDocumentAdaptor *)self pdfView];
    uint64_t v8 = [v7 window];
    uint64_t v6 = [v8 rootViewController];
  }

  return v6;
}

- (void)installDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  id v9 = a3;
  uint64_t v6 = [(PDFAKDocumentAdaptor *)self akMainController];
  double v7 = [(PDFAKDocumentAdaptor *)self pdfView];
  uint64_t v8 = v7;
  if (v7) {
    [v7 addGestureRecognizer:v9];
  }
}

- (void)uninstallDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  id v6 = a3;
  id v9 = [(PDFAKDocumentAdaptor *)self akMainController];
  double v7 = [(PDFAKDocumentAdaptor *)self pdfView];
  uint64_t v8 = [v6 view];
  [v8 removeGestureRecognizer:v6];

  if (!v7) {
    NSLog(&cfstr_SCalledWhenPdf.isa, "-[PDFAKDocumentAdaptor uninstallDrawingGestureRecognizer:forPageAtIndex:forAnnotationController:]");
  }
}

- (void)updateDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 withPriority:(BOOL)a5 forAnnotationController:(id)a6
{
  BOOL v7 = a5;
  v71[5] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  double v12 = [(PDFAKDocumentAdaptor *)self akMainController];
  long long v13 = [(PDFAKDocumentAdaptor *)self pdfView];
  if (v13)
  {
    unint64_t v46 = a4;
    BOOL v47 = v7;
    CGAffineTransform v49 = v12;
    CGFloat v14 = [v11 doubleTapGestureRecognizer];
    CGFloat v15 = [v11 tapGestureRecognizer];
    v71[0] = v15;
    v71[1] = v14;
    double v16 = [v11 pressGestureRecognizer];
    v71[2] = v16;
    CGAffineTransform v17 = [v11 panGestureRecognizer];
    v71[3] = v17;
    id v50 = v11;
    double v18 = [v11 rotationGestureRecognizer];
    v71[4] = v18;
    CGAffineTransform v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:5];

    CGAffineTransform v20 = objc_opt_new();
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v48 = v13;
    double v21 = [v13 gestureRecognizers];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v63 objects:v70 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v64 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v63 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [v20 addObject:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v63 objects:v70 count:16];
      }
      while (v23);
    }

    double v27 = [(PDFAKDocumentAdaptor *)self _scrollViewRecognizersForPageAtIndex:v46];
    [v20 addObjectsFromArray:v27];

    CGFloat v28 = [MEMORY[0x263EFFA08] setWithArray:v19];
    [v20 minusSet:v28];

    [v20 removeObject:v10];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v29 = v19;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v59 objects:v69 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v60 != v32) {
            objc_enumerationMutation(v29);
          }
          if (*(void **)(*((void *)&v59 + 1) + 8 * j) != v14) {
            objc_msgSend(v10, "requireGestureRecognizerToFail:");
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v59 objects:v69 count:16];
      }
      while (v31);
    }

    if (v47)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v34 = v20;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v55 objects:v68 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v56;
        do
        {
          for (uint64_t k = 0; k != v36; ++k)
          {
            if (*(void *)v56 != v37) {
              objc_enumerationMutation(v34);
            }
            CGFloat v39 = *(void **)(*((void *)&v55 + 1) + 8 * k);
            [v10 removeFailureRequirement:v39];
            [v39 requireGestureRecognizerToFail:v10];
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v55 objects:v68 count:16];
        }
        while (v36);
      }
    }
    else
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v40 = v20;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v51 objects:v67 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v52;
        do
        {
          for (uint64_t m = 0; m != v42; ++m)
          {
            if (*(void *)v52 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = *(void **)(*((void *)&v51 + 1) + 8 * m);
            [v45 removeFailureRequirement:v10];
            [v10 requireGestureRecognizerToFail:v45];
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v51 objects:v67 count:16];
        }
        while (v42);
      }
    }

    double v12 = v49;
    id v11 = v50;
    long long v13 = v48;
  }
}

- (double)modelBaseScaleFactorOfPageAtIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [WeakRetained modelBaseScaleFactorOfPageAtIndex:a3 forAnnotationController:v6];
    double modelBaseScaleFactor = v8;
  }
  else
  {
    double modelBaseScaleFactor = self->_modelBaseScaleFactor;
    if (modelBaseScaleFactor == 9.22337204e18)
    {
      id v10 = [(PDFAKDocumentAdaptor *)self pdfView];
      [v10 scaleFactor];
      double v12 = v11;

      double modelBaseScaleFactor = 1.0 / v12;
      self->_double modelBaseScaleFactor = modelBaseScaleFactor;
    }
  }

  return modelBaseScaleFactor;
}

- (BOOL)controllerShouldDetectFormElements:(id)a3
{
  return 0;
}

- (BOOL)shouldPlaceFormElementAtPoint:(CGPoint)a3 onOverlayAtPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  double v8 = [a5 overlayViewAtIndex:a4];
  id v9 = [(PDFAKDocumentAdaptor *)self pdfView];
  objc_msgSend(v9, "convertPoint:fromView:", v8, x, y);
  double v11 = v10;
  double v13 = v12;
  CGFloat v14 = objc_msgSend(v9, "pageForPoint:nearest:", 0);
  if (v14)
  {
    objc_msgSend(v9, "convertPoint:toPage:", v14, v11, v13);
    CGFloat v15 = objc_msgSend(v14, "annotationAtPoint:");
    double v16 = v15;
    if (v15)
    {
      CGAffineTransform v17 = [v15 valueForAnnotationKey:@"/Subtype"];
      int v18 = [v17 isEqualToString:@"/Widget"] ^ 1;
    }
    else
    {
      LOBYTE(v18) = 1;
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)shouldPlaceProposedFormElementAtRect:(CGRect)a3 onOverlayAtPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v57 = *MEMORY[0x263EF8340];
  double v10 = [a5 overlayViewAtIndex:a4];
  double v11 = [(PDFAKDocumentAdaptor *)self pdfView];
  objc_msgSend(v11, "convertRect:fromView:", v10, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [v10 frame];
  double MidX = CGRectGetMidX(v58);
  [v10 frame];
  CGAffineTransform v49 = v10;
  objc_msgSend(v11, "convertPoint:fromView:", v10, MidX, CGRectGetMidY(v59));
  double v21 = objc_msgSend(v11, "pageForPoint:nearest:", 0);
  v48 = v11;
  objc_msgSend(v11, "convertRect:toPage:", v21, v13, v15, v17, v19);
  CGRect v61 = CGRectInset(v60, 4.0, 0.0);
  CGFloat v22 = v61.origin.x;
  CGFloat v23 = v61.origin.y;
  CGFloat v24 = v61.size.width;
  CGFloat v25 = v61.size.height;
  double v26 = CGRectGetWidth(v61);
  v62.origin.double x = v22;
  v62.origin.double y = v23;
  v62.size.double width = v24;
  v62.size.double height = v25;
  double v27 = CGRectGetHeight(v62);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  BOOL v47 = v21;
  CGFloat v28 = [v21 annotations];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    double v50 = v26 * 0.25 * v27;
    uint64_t v31 = *(void *)v53;
    char v32 = 1;
    double v51 = v25;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v53 != v31) {
          objc_enumerationMutation(v28);
        }
        id v34 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v35 = [v34 valueForAnnotationKey:@"/Subtype"];
        int v36 = [v35 isEqualToString:@"/Widget"];

        if (v36)
        {
          [v34 bounds];
          v67.origin.double x = v22;
          v67.origin.double y = v23;
          v67.size.double width = v24;
          v67.size.double height = v25;
          CGRect v64 = CGRectIntersection(v63, v67);
          CGFloat v37 = v64.origin.x;
          CGFloat v38 = v64.origin.y;
          CGFloat v39 = v64.size.width;
          CGFloat v40 = v64.size.height;
          if (!CGRectIsEmpty(v64))
          {
            v65.origin.double x = v37;
            v65.origin.double y = v38;
            v65.size.double width = v39;
            v65.size.double height = v40;
            double v41 = v24;
            double v42 = v23;
            double v43 = v22;
            double v44 = CGRectGetWidth(v65);
            v66.origin.double x = v37;
            v66.origin.double y = v38;
            v66.size.double width = v39;
            v66.size.double height = v40;
            double v45 = v44 * CGRectGetHeight(v66);
            CGFloat v22 = v43;
            CGFloat v23 = v42;
            CGFloat v24 = v41;
            CGFloat v25 = v51;
            v32 &= v45 <= v50;
          }
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v30);
  }
  else
  {
    char v32 = 1;
  }

  return v32 & 1;
}

- (CGRect)positioningRectForCandidatePicker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [WeakRetained positioningRectForCandidatePicker];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v4 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)editCheckpointReachedForAnnotationController:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained editCheckpointReachedForAnnotationController:v5];
  }
}

- (void)editDetectedForAnnotationController:(id)a3
{
  id v4 = a3;
  if (!+[PDFAKDocumentAdaptor isHandlingEditDetected])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);
    BOOL v6 = [WeakRetained permissionsStatus] != 0;
    double v7 = [(PDFAKDocumentAdaptor *)self pdfView];
    objc_initWeak(&location, v7);

    objc_copyWeak(&to, (id *)&self->_pdfAKControllerDelegate);
    id v8 = objc_loadWeakRetained(&location);
    double v9 = [v8 currentPage];
    double v10 = [v9 akPageAdaptor];
    double v11 = [v10 akPageModelController];
    objc_initWeak(&from, v11);

    id v12 = objc_loadWeakRetained(&from);
    double v13 = [v12 selectedAnnotations];
    double v14 = (void *)[v13 mutableCopy];

    double v15 = [v8 window];
    double v16 = [v15 firstResponder];
    objc_initWeak(&v34, v16);

    double v17 = [v8 parentViewController];
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    CGFloat v24 = __60__PDFAKDocumentAdaptor_editDetectedForAnnotationController___block_invoke;
    CGFloat v25 = &unk_264204690;
    double v26 = self;
    id v27 = v4;
    objc_copyWeak(&v29, &location);
    BOOL v33 = v6;
    objc_copyWeak(&v30, &from);
    id v18 = v14;
    id v28 = v18;
    objc_copyWeak(&v31, &v34);
    objc_copyWeak(&v32, &to);
    double v19 = (void (**)(void *, uint64_t))_Block_copy(&v22);
    char v20 = GetDefaultsWriteAKEnabled();
    if (v8) {
      char v21 = v20;
    }
    else {
      char v21 = 0;
    }
    if (v21) {
      objc_msgSend(WeakRetained, "requirePasswordsIfNeededUsingPresentingViewController:completion:", v17, v19, v22, v23, v24, v25, v26, v27, v28);
    }
    else {
      v19[2](v19, 2);
    }

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v31);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&from);

    objc_destroyWeak(&to);
    objc_destroyWeak(&location);
  }
}

void __60__PDFAKDocumentAdaptor_editDetectedForAnnotationController___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = [*(id *)(a1 + 32) undoManagerForAnnotationController:*(void *)(a1 + 40)];
  p_info = PDFAKAnnotationAdaptorPrivate.info;
  +[PDFAKDocumentAdaptor setIsHandlingEditDetected:1];
  if (!a2)
  {
    if (*(unsigned char *)(a1 + 88) && [v4 canUndo])
    {
      [v4 undoNestedGroup];
      [v4 redo];
    }
LABEL_10:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    double v9 = WeakRetained;
    if (WeakRetained)
    {
      double v10 = [WeakRetained annotations];
      if (v10)
      {
        uint64_t v11 = *(void *)(a1 + 48);

        if (v11)
        {
          id v12 = (void *)MEMORY[0x263EFFA08];
          double v13 = [v9 annotations];
          double v14 = [v12 setWithArray:v13];

          [*(id *)(a1 + 48) intersectSet:v14];
          double v15 = [v9 mutableSetValueForKey:@"selectedAnnotations"];
          [v15 setSet:*(void *)(a1 + 48)];
        }
      }
    }
    id v16 = objc_loadWeakRetained((id *)(a1 + 72));
    [v16 becomeFirstResponder];

    if (a2 == 1) {
      goto LABEL_30;
    }
    goto LABEL_15;
  }
  if (a2 != 2)
  {
    if (a2 == 1)
    {
      if ([v4 canUndo]) {
        [v4 undoNestedGroup];
      }
      id v6 = objc_loadWeakRetained((id *)(a1 + 56));
      double v7 = [v6 activeAnnotation];
      [v6 removeControlForAnnotation:v7];
    }
    goto LABEL_10;
  }
LABEL_15:
  id v17 = objc_loadWeakRetained((id *)(a1 + 80));
  if (objc_opt_respondsToSelector())
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = +[PDFAnnotation PDFKitAnnotationUndoManagerDisplayNames];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      uint64_t v28 = 1;
LABEL_18:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * v22);
        CGFloat v24 = [v4 undoActionName];
        char v25 = [v24 containsString:v23];

        double v26 = [v4 redoActionName];
        char v27 = [v26 containsString:v23];

        if (v25 & 1) != 0 || (v27) {
          break;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v20) {
            goto LABEL_18;
          }
          goto LABEL_25;
        }
      }
    }
    else
    {
LABEL_25:
      uint64_t v28 = 0;
    }

    [v17 annotationController:*(void *)(a1 + 40) detectedEditOfType:v28];
    p_info = (__objc2_class_ro **)(PDFAKAnnotationAdaptorPrivate + 32);
  }
  else if (objc_opt_respondsToSelector())
  {
    [v17 editDetectedForAnnotationController:*(void *)(a1 + 40)];
  }

LABEL_30:
  [p_info + 6 setIsHandlingEditDetected:0];
}

+ (void)setIsHandlingEditDetected:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F08B88] currentThread];
  id v6 = [v4 threadDictionary];

  id v5 = [NSNumber numberWithBool:v3];
  [v6 setObject:v5 forKeyedSubscript:@"PDFKitIsHandlingEditDetected"];
}

+ (BOOL)isHandlingEditDetected
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  BOOL v3 = [v2 threadDictionary];

  id v4 = [v3 objectForKeyedSubscript:@"PDFKitIsHandlingEditDetected"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)penStrokeCompletedForAnnotationController:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained penStrokeCompletedForAnnotationController:v5];
  }
}

- (void)controllerWillShowSignatureCaptureView:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained controllerWillShowSignatureCaptureView:v5];
  }
}

- (void)controllerWillDismissSignatureCaptureView:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained controllerWillDismissSignatureCaptureView:v5];
  }
}

- (void)controllerWillShowSignatureManagerView:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained controllerWillShowSignatureManagerView:v5];
  }
}

- (void)controllerWillDismissSignatureManagerView:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained controllerWillDismissSignatureManagerView:v5];
  }
}

- (void)controllerWillEnterToolMode:(id)a3
{
  id v6 = a3;
  id v4 = [(PDFAKDocumentAdaptor *)self pdfView];
  [v4 endEditing:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained controllerWillEnterToolMode:v6];
  }
}

- (void)controllerDidEnterToolMode:(id)a3
{
  id v11 = a3;
  id v4 = [(PDFAKDocumentAdaptor *)self pdfView];
  _PDFLog(OS_LOG_TYPE_DEFAULT, (uint64_t)"PDFAKDocumentAdaptor", (uint64_t)"Did enter Markup editing mode for PDFView: %@", v5, v6, v7, v8, v9, (uint64_t)v4);
  if (v4)
  {
    [(PDFAKDocumentAdaptor *)self _updatePDFScrollViewMinimumNumberOfTouches];
    [v4 clearSelection];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained controllerDidEnterToolMode:v11];
  }
}

- (void)controllerWillExitToolMode:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained controllerWillExitToolMode:v5];
  }
}

- (void)controllerDidExitToolMode:(id)a3
{
  id v11 = a3;
  id v4 = [(PDFAKDocumentAdaptor *)self pdfView];
  _PDFLog(OS_LOG_TYPE_DEFAULT, (uint64_t)"PDFAKDocumentAdaptor", (uint64_t)"Did exit Markup editing mode for PDFView: %@", v5, v6, v7, v8, v9, (uint64_t)v4);
  if (v4) {
    [(PDFAKDocumentAdaptor *)self _updatePDFScrollViewMinimumNumberOfTouches];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained controllerDidExitToolMode:v11];
  }
}

- (BOOL)shouldAddTabControlsToTextEditorForAnnotation:(id)a3 forAnnotationController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v8 = [v7 modelController];
  uint64_t v9 = [v8 pageModelControllers];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = __94__PDFAKDocumentAdaptor_shouldAddTabControlsToTextEditorForAnnotation_forAnnotationController___block_invoke;
  uint64_t v19 = &unk_2642046B8;
  id v10 = v6;
  id v20 = v10;
  uint64_t v21 = &v22;
  [v9 enumerateObjectsUsingBlock:&v16];

  if (v23[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v11 = 0;
  }
  else
  {
    id v12 = [(PDFAKDocumentAdaptor *)self pdfDocument];
    double v13 = [v12 pageAtIndex:v23[3]];

    double v14 = [v13 detectedForm];
    BOOL v11 = (unint64_t)[v14 count] > 1;
  }
  _Block_object_dispose(&v22, 8);

  return v11;
}

uint64_t __94__PDFAKDocumentAdaptor_shouldAddTabControlsToTextEditorForAnnotation_forAnnotationController___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 containsAnnotation:*(void *)(a1 + 32)];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (BOOL)handleTabInTextEditorForAnnotation:(id)a3 forAnnotationController:(id)a4
{
  id v4 = [(PDFAKDocumentAdaptor *)self pdfView];
  char v5 = [v4 handleTabInDetectedFormField];

  return v5;
}

- (BOOL)handleBackTabInTextEditorForAnnotation:(id)a3 forAnnotationController:(id)a4
{
  id v4 = [(PDFAKDocumentAdaptor *)self pdfView];
  char v5 = [v4 handleBackTabInDetectedFormField];

  return v5;
}

- (void)handleTextSuggestion:(id)a3 forAnnotationController:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [(PDFAKDocumentAdaptor *)self pdfView];
  [v9 handleTextSuggestion:v8 completionHandler:v7];
}

- (void)positionSketchOverlay:(id)a3 forAnnotationController:(id)a4
{
  id v58 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [WeakRetained positionSketchOverlay:v58 forAnnotationController:v6];
  }
  else
  {
    id v8 = [(PDFAKDocumentAdaptor *)self pdfView];
    id v9 = [v6 toolbarView];
    id v10 = [v9 superview];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    uint64_t v19 = [v8 documentScrollView];
    [(id)v19 contentInset];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    double v28 = v12 + v23;
    double v29 = v14 + v21;
    double v30 = v16 - (v23 + v27);
    double v31 = v18 - (v21 + v25);
    [v8 bounds];
    objc_msgSend(v8, "convertRect:toCoordinateSpace:", v10);
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v40 = [(PDFAKDocumentAdaptor *)self pdfDocument];
    LOBYTE(v19) = [v40 isLocked];

    if ((v19 & 1) == 0)
    {
      double v41 = objc_msgSend(v8, "pageViewForPageAtIndex:", objc_msgSend(v6, "currentPageIndex"));
      double v42 = v41;
      if (v41)
      {
        [v41 bounds];
        objc_msgSend(v42, "convertRect:toCoordinateSpace:", v10);
        CGFloat v33 = v43;
        CGFloat v35 = v44;
        CGFloat v37 = v45;
        CGFloat v39 = v46;
      }
    }
    v60.origin.double x = v28;
    v60.origin.double y = v29;
    v60.size.double width = v30;
    v60.size.double height = v31;
    v64.origin.double x = v33;
    v64.origin.double y = v35;
    v64.size.double width = v37;
    v64.size.double height = v39;
    CGRect v61 = CGRectIntersection(v60, v64);
    double x = v61.origin.x;
    double y = v61.origin.y;
    double width = v61.size.width;
    double height = v61.size.height;
    BOOL IsNull = CGRectIsNull(v61);
    if (IsNull) {
      double v52 = v28;
    }
    else {
      double v52 = x;
    }
    if (IsNull) {
      double v53 = v29;
    }
    else {
      double v53 = y;
    }
    if (IsNull) {
      double v54 = v30;
    }
    else {
      double v54 = width;
    }
    if (IsNull) {
      double v55 = v31;
    }
    else {
      double v55 = height;
    }
    objc_msgSend(v10, "convertRect:toView:", 0, v52, v53, v54, v55);
    CGRect v63 = CGRectIntegral(v62);
    objc_msgSend(v10, "convertRect:fromView:", 0, v63.origin.x, v63.origin.y, v63.size.width, v63.size.height);
    objc_msgSend(v58, "setFrame:");
    long long v56 = [v58 superview];

    if (v56 != v10)
    {
      [v58 setAutoresizingMask:18];
      uint64_t v57 = [v9 superview];
      [v57 addSubview:v58];
    }
  }
}

- (id)controller:(id)a3 willSetToolbarItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v9 = [WeakRetained controller:v6 willSetToolbarItems:v7];
  }
  else
  {
    id v9 = v7;
  }
  id v10 = v9;

  return v10;
}

- (BOOL)hasHighlightableSelectionForAnnotationController:(id)a3
{
  BOOL v3 = [(PDFAKDocumentAdaptor *)self pdfView];
  id v4 = [v3 currentSelection];
  char v5 = [v4 string];
  BOOL v6 = [v5 length] != 0;

  return v6;
}

- (void)rotateRight:(id)a3
{
  BOOL v3 = [(PDFAKDocumentAdaptor *)self pdfView];
  id v4 = [v3 currentPage];

  objc_msgSend(v4, "setRotation:", objc_msgSend(v4, "rotation") + 90);
}

- (void)rotateLeft:(id)a3
{
  BOOL v3 = [(PDFAKDocumentAdaptor *)self pdfView];
  id v4 = [v3 currentPage];

  objc_msgSend(v4, "setRotation:", objc_msgSend(v4, "rotation") - 90);
}

- (id)layerContainingQuickBackgroundForLoupeOnOverlayAtPageIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  char v5 = [(PDFAKDocumentAdaptor *)self pdfView];
  BOOL v6 = [v5 pageViewForPageAtIndex:a3];

  id v7 = [v6 layer];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [v7 sublayers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v8);
      }
      double v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v13;

    if (v14) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  NSLog(&cfstr_SCouldnTFindPd.isa, "-[PDFAKDocumentAdaptor layerContainingQuickBackgroundForLoupeOnOverlayAtPageIndex:forAnnotationController:]");
  id v14 = v7;
LABEL_12:

  return v14;
}

- (void)_pdfDocumentDidUnlock:(id)a3
{
  id v9 = [a3 object];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);
  if (WeakRetained)
  {
    if (v9 == WeakRetained)
    {
      char v5 = [(PDFAKDocumentAdaptor *)self akMainController];
      uint64_t v6 = [v5 currentPageIndex];

      if (v6 == 0x7FFFFFFFFFFFFFFFLL && [v9 pageCount])
      {
        id v7 = [(PDFAKDocumentAdaptor *)self akMainController];
        [v7 setCurrentPageIndex:0];
      }
      id v8 = [MEMORY[0x263F08A00] defaultCenter];
      [v8 removeObserver:self name:@"PDFDocumentDidUnlock" object:v9];
    }
    else
    {
      NSLog(&cfstr_SNotificationD.isa, "-[PDFAKDocumentAdaptor _pdfDocumentDidUnlock:]", v9, WeakRetained);
    }
  }
}

- (void)_scheduleDelayedModelBaseScaleFactorCalculation
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedModelBaseScaleFactorCalculation object:0];

  [(PDFAKDocumentAdaptor *)self performSelector:sel__delayedModelBaseScaleFactorCalculation withObject:0 afterDelay:0.25];
}

- (void)_delayedModelBaseScaleFactorCalculation
{
  if (!self->_isTornDown && self->_modelBaseScaleFactor == 9.22337204e18)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfDocument);
    char v4 = [WeakRetained isLocked];

    if ((v4 & 1) == 0)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegate);
      if (!v7 || (objc_opt_respondsToSelector() & 1) == 0) {
        [(PDFAKDocumentAdaptor *)self modelBaseScaleFactorOfPageAtIndex:0 forAnnotationController:self->_akController];
      }
      char v5 = [MEMORY[0x263F08A00] defaultCenter];
      [v5 removeObserver:self name:@"PDFViewDidLayoutDocumentView" object:0];

      uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
      [v6 removeObserver:self name:@"PDFViewScaleChanged" object:0];
    }
  }
}

- (void)_updatePDFScrollViewMinimumNumberOfTouches
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [(PDFAKDocumentAdaptor *)self pdfView];
  uint64_t v3 = [v2 scrollViewMinimumNumberOfTouches];
  if ([v2 isUsingPageViewController])
  {
    char v4 = [v2 documentViewController];
    char v5 = [v4 scrollView];
    uint64_t v6 = [v5 panGestureRecognizer];
    [v6 setMinimumNumberOfTouches:v3];

    id v7 = [v4 viewControllers];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v19 + 1) + 8 * v11) scrollView];
          double v13 = [v12 panGestureRecognizer];
          [v13 setMinimumNumberOfTouches:v3];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }
  }
  else
  {
    char v4 = [v2 documentScrollView];
    char v5 = [v4 panGestureRecognizer];
    [v5 setMinimumNumberOfTouches:v3];
  }

  _PDFLog(OS_LOG_TYPE_DEFAULT, (uint64_t)"PDFAKOverlayAdaptor", (uint64_t)"Number of touches required to scroll is %lu for PDFView: %@", v14, v15, v16, v17, v18, v3);
}

- (id)_scrollViewRecognizersForPageAtIndex:(unint64_t)a3
{
  char v5 = objc_opt_new();
  uint64_t v6 = [(PDFAKDocumentAdaptor *)self pdfView];
  id v7 = v6;
  if (v6)
  {
    if ([v6 isUsingPageViewController])
    {
      uint64_t v8 = [v7 documentViewController];
      uint64_t v9 = [v8 scrollView];
      uint64_t v10 = v9;
      if (v9)
      {
        uint64_t v11 = [v9 panGestureRecognizer];
        if (v11) {
          [v5 addObject:v11];
        }
        uint64_t v12 = [v10 pinchGestureRecognizer];

        if (v12) {
          [v5 addObject:v12];
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
      if (a3 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v15 = [v8 findPageViewControllerForPageIndex:a3];
        uint64_t v16 = [v15 scrollView];
        uint64_t v17 = v16;
        if (v16)
        {
          uint64_t v18 = [v16 panGestureRecognizer];

          if (v18) {
            [v5 addObject:v18];
          }
          uint64_t v12 = [v17 pinchGestureRecognizer];

          if (v12) {
            [v5 addObject:v12];
          }
        }
      }
    }
    else
    {
      double v13 = [v7 documentScrollView];
      uint64_t v8 = v13;
      if (v13)
      {
        uint64_t v14 = [v13 panGestureRecognizer];
        if (v14) {
          [v5 addObject:v14];
        }
        uint64_t v12 = [v8 pinchGestureRecognizer];

        if (v12) {
          [v5 addObject:v12];
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
  }
  long long v19 = [v5 allObjects];

  return v19;
}

- (void)_resetAnimationProperties
{
  CGSize v2 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  self->_animationProperties.visibleTextViewRectInScrollView.origin = (CGPoint)*MEMORY[0x263F001A0];
  self->_animationProperties.visibleTextViewRectInScrollView.size = v2;
  self->_animationProperties.animationDuration = 0.0;
  self->_animationProperties.originDelta = 0.0;
}

- (void)annotationWillBeginEditing:(id)a3
{
  char v4 = [a3 userInfo];
  char v5 = AKEditingTextAnnotationKeyString();
  uint64_t v6 = [v4 objectForKey:v5];

  editingAnnotaiton = self->_editingAnnotaiton;
  self->_editingAnnotaiton = v6;
  uint64_t v8 = v6;

  id v11 = +[PDFAKAnnotationAdaptor getPDFAnnotationAssociatedWith:v8];

  uint64_t v9 = [(PDFAKDocumentAdaptor *)self pdfView];
  uint64_t v10 = [v9 controller];
  [v10 interactWithAnnotation:v11];
}

- (void)annotationDidEndEditing:(id)a3
{
  double v4 = -self->_animationProperties.originDelta;
  CGSize size = self->_animationProperties.visibleTextViewRectInScrollView.size;
  v9[0] = self->_animationProperties.visibleTextViewRectInScrollView.origin;
  v9[1] = size;
  v9[2] = *(_OWORD *)&self->_animationProperties.animationDuration;
  [(PDFAKDocumentAdaptor *)self _adjustScrollViewWithAnimationProperties:v9 delta:v4];
  [(PDFAKDocumentAdaptor *)self _resetAnimationProperties];
  editingAnnotaiton = self->_editingAnnotaiton;
  self->_editingAnnotaiton = 0;

  id v7 = [(PDFAKDocumentAdaptor *)self pdfView];
  uint64_t v8 = [v7 controller];
  [v8 setActiveAnnotation:0];
}

- (unint64_t)pageIndexForAnnotation:(id)a3
{
  id v4 = a3;
  char v5 = [(PDFAKDocumentAdaptor *)self pdfDocument];
  uint64_t v6 = [v5 akDocumentAdaptor];

  id v7 = [v6 akMainController];
  uint64_t v8 = [v7 modelController];
  uint64_t v9 = [v8 pageModelControllerForAnnotation:v4];

  uint64_t v10 = [v7 modelController];
  id v11 = [v10 pageModelControllers];
  unint64_t v12 = [v11 indexOfObject:v9];

  return v12;
}

- (void)adjustScrollViewForKeyboardNotification:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (self->_editingAnnotaiton)
  {
    uint64_t v6 = [v4 userInfo];
    id v7 = [v6 valueForKey:*MEMORY[0x263F837B0]];
    [v7 CGRectValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    uint64_t v16 = [v5 userInfo];
    uint64_t v17 = [v16 valueForKey:*MEMORY[0x263F837B8]];
    [v17 CGRectValue];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    double v26 = self->_editingAnnotaiton;
    unint64_t v27 = [(PDFAKDocumentAdaptor *)self pageIndexForAnnotation:v26];
    if (v26)
    {
      unint64_t v28 = v27;
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        double v29 = [(PDFAKDocumentAdaptor *)self pdfView];
        double v30 = [v29 documentScrollView];
        double v31 = [v29 document];
        double v32 = [v31 pageAtIndex:v28];

        [(AKRectAnnotation *)v26 rectangle];
        objc_msgSend(v29, "convertRect:fromPage:", v32);
        objc_msgSend(v29, "convertRect:toView:", 0);
        double v63 = v34;
        double v64 = v33;
        double v61 = v36;
        double v62 = v35;
        CGFloat v37 = [v30 window];
        objc_msgSend(v30, "convertRect:fromView:", v37, v9, v11, v13, v15);
        double v39 = v38;

        CGFloat v40 = [v30 window];
        objc_msgSend(v30, "convertRect:fromView:", v40, v19, v21, v23, v25);
        double v42 = v41;

        double v43 = 0.0;
        if (v39 - v42 >= 0.0) {
          double v43 = v39 - v42;
        }
        double v65 = v43;
        self->_animationProperties.originDelta = self->_animationProperties.originDelta + v43;
        [v30 bounds];
        objc_msgSend(v30, "convertRect:toView:", 0);
        double x = v67.origin.x;
        double y = v67.origin.y;
        CGFloat width = v67.size.width;
        double height = v67.size.height;
        v71.origin.double x = v19;
        v71.origin.double y = v21;
        v71.size.CGFloat width = v23;
        v71.size.double height = v25;
        if (CGRectIntersectsRect(v67, v71))
        {
          v68.origin.double x = x;
          v68.origin.double y = y;
          v68.size.CGFloat width = width;
          v68.size.double height = height;
          v72.origin.double x = v19;
          v72.origin.double y = v21;
          v72.size.CGFloat width = v23;
          v72.size.double height = v25;
          CGRect v69 = CGRectIntersection(v68, v72);
          CGFloat v48 = height - (CGRectGetHeight(v69) + 0.0);
          objc_msgSend(v30, "convertRect:fromView:", 0, v64, v63, v62, v61);
          CGFloat v59 = v50;
          CGFloat v60 = v49;
          CGFloat v57 = v52;
          CGFloat v58 = v51;
          v70.origin.double x = x + 0.0;
          v70.origin.double y = y + 0.0;
          v70.size.CGFloat width = width;
          v70.size.double height = v48;
          v73.origin.double x = v64;
          v73.origin.double y = v63;
          v73.size.CGFloat width = v62;
          v73.size.double height = v61;
          if (!CGRectContainsRect(v70, v73))
          {
            self->_animationProperties.visibleTextViewRectInScrollView.origin.double x = v60;
            self->_animationProperties.visibleTextViewRectInScrollView.origin.double y = v59;
            self->_animationProperties.visibleTextViewRectInScrollView.size.CGFloat width = v58;
            self->_animationProperties.visibleTextViewRectInScrollView.size.double height = v57;
          }
        }
        double v53 = [v5 userInfo];
        double v54 = [v53 valueForKey:*MEMORY[0x263F83780]];
        [v54 floatValue];
        self->_animationProperties.animationDuration = v55;

        CGSize size = self->_animationProperties.visibleTextViewRectInScrollView.size;
        v66[0] = self->_animationProperties.visibleTextViewRectInScrollView.origin;
        v66[1] = size;
        v66[2] = *(_OWORD *)&self->_animationProperties.animationDuration;
        [(PDFAKDocumentAdaptor *)self _adjustScrollViewWithAnimationProperties:v66 delta:v65];
      }
    }
  }
}

- (void)_adjustScrollViewWithAnimationProperties:(TextAnnotationAnimationProperties *)a3 delta:(double)a4
{
  id v7 = [MEMORY[0x263F82438] sharedApplication];
  [v7 beginIgnoringInteractionEvents];

  double animationDuration = a3->animationDuration;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__PDFAKDocumentAdaptor__adjustScrollViewWithAnimationProperties_delta___block_invoke;
  v10[3] = &unk_2642046E0;
  v10[4] = self;
  *(double *)&v10[5] = a4;
  CGSize size = a3->visibleTextViewRectInScrollView.size;
  CGPoint origin = a3->visibleTextViewRectInScrollView.origin;
  CGSize v12 = size;
  long long v13 = *(_OWORD *)&a3->animationDuration;
  [MEMORY[0x263F82E00] animateWithDuration:v10 animations:&__block_literal_global_9 completion:animationDuration];
}

void __71__PDFAKDocumentAdaptor__adjustScrollViewWithAnimationProperties_delta___block_invoke(uint64_t a1)
{
  CGSize v2 = [*(id *)(a1 + 32) pdfView];
  id v3 = [v2 documentScrollView];

  [v3 contentInset];
  objc_msgSend(v3, "setContentInset:");
  if (!CGRectIsNull(*(CGRect *)(a1 + 48))) {
    objc_msgSend(v3, "scrollRectToVisible:animated:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
}

void __71__PDFAKDocumentAdaptor__adjustScrollViewWithAnimationProperties_delta___block_invoke_2()
{
  id v0 = [MEMORY[0x263F82438] sharedApplication];
  [v0 endIgnoringInteractionEvents];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingAnnotaiton, 0);
  objc_storeStrong((id *)&self->_akToolbarView, 0);
  objc_destroyWeak((id *)&self->_pdfAKControllerDelegate);
  objc_storeStrong((id *)&self->_akController, 0);
  objc_destroyWeak((id *)&self->_pdfView);

  objc_destroyWeak((id *)&self->_pdfDocument);
}

@end