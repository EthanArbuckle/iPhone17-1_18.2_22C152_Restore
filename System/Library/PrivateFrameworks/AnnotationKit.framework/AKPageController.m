@interface AKPageController
+ (AKPageController)pageControllerWithController:(id)a3 andPageModelController:(id)a4;
- (AKController)controller;
- (AKControllerDelegateProtocol)delegate;
- (AKGeometryHelper)geometryHelper;
- (AKHighlightColorEditorController)highlightColorEditorController;
- (AKInkPageOverlayController)inkPageOverlayController;
- (AKLayerPresentationManager)layerPresentationManager;
- (AKPageModelController)pageModelController;
- (BOOL)editorController:(id)a3 isRightArrowEnabledForAnnotation:(id)a4;
- (BOOL)handleEditAnnotation:(id)a3;
- (BOOL)relinquishablesAreLoaded;
- (BOOL)shouldPixelate;
- (BOOL)superviewDependentThingsWereSetUp;
- (CGPoint)convertPointFromModelToOverlay:(CGPoint)a3;
- (CGPoint)convertPointFromOverlayToModel:(CGPoint)a3;
- (CGRect)convertRectFromModelToOverlay:(CGRect)a3;
- (CGRect)convertRectFromOverlayToModel:(CGRect)a3;
- (CGRect)maxPageRect;
- (CGRect)stickyViewFrameForNoteEditor:(id)a3;
- (CGRect)visibleRectOfOverlay;
- (NSMutableDictionary)noteEditors;
- (UIView)overlayView;
- (double)currentModelToScreenScaleFactor;
- (double)modelBaseScaleFactor;
- (id)_initWithController:(id)a3 andPageModelController:(id)a4;
- (id)_popoverPresentingViewController;
- (id)annotationsBeneathLoupe:(id)a3;
- (id)initForTesting;
- (id)inkOverlayDrawingUndoTarget;
- (id)newContentSnapshotPDFDataAtScale:(double)a3 inRect:(CGRect)a4 forLoupeAnnotation:(id)a5;
- (id)stickyContainerForNoteEditor:(id)a3;
- (int64_t)currentModelToScreenExifOrientation;
- (unint64_t)edgeForNoteEditor:(id)a3;
- (unint64_t)pageIndex;
- (void)_updateOverlayVisibilityWithToolPicker:(id)a3 visible:(BOOL)a4;
- (void)addPopupToAnnotation:(id)a3 openPopup:(BOOL)a4;
- (void)editorController:(id)a3 deleteAnnotation:(id)a4;
- (void)editorController:(id)a3 editNote:(id)a4;
- (void)editorController:(id)a3 setTheme:(id)a4 forAnnotation:(id)a5;
- (void)noteEditorDidFinishEditing:(id)a3;
- (void)noteEditorWillDismissFromFullScreen:(id)a3;
- (void)noteEditorWillPresentFullScreen:(id)a3;
- (void)openPopoverForHighlightAnnotation:(id)a3;
- (void)openPopupAnnotation:(id)a3;
- (void)overlayWasAddedToSuperview;
- (void)releaseRelinquishables;
- (void)removeNoteFromAnnotation:(id)a3;
- (void)setController:(id)a3;
- (void)setGeometryHelper:(id)a3;
- (void)setInkOverlayDrawingUndoTarget:(id)a3;
- (void)setInkPageOverlayController:(id)a3;
- (void)setLayerPresentationManager:(id)a3;
- (void)setNoteEditors:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setPageIndex:(unint64_t)a3;
- (void)setPageModelController:(id)a3;
- (void)setShouldPixelate:(BOOL)a3;
- (void)setSuperviewDependentThingsWereSetUp:(BOOL)a3;
- (void)setupRelinquishables;
- (void)teardown;
- (void)unregisterFromUndoManager:(id)a3;
- (void)updateOverlayViewLayers;
- (void)updateScaleFactor:(double)a3 isLiveUpdate:(BOOL)a4 forceUpdate:(BOOL)a5;
@end

@implementation AKPageController

+ (AKPageController)pageControllerWithController:(id)a3 andPageModelController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithController:v7 andPageModelController:v6];

  return (AKPageController *)v8;
}

- (id)_initWithController:(id)a3 andPageModelController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AKPageController;
  v8 = [(AKPageController *)&v14 init];
  v9 = v8;
  if (v8)
  {
    [(AKPageController *)v8 setController:v6];
    [(AKPageController *)v9 setPageModelController:v7];
    v10 = [v6 statisticsLogger];
    [v7 setStatisticsLogger:v10];

    [(AKPageController *)v9 setPageIndex:0x7FFFFFFFFFFFFFFFLL];
    v11 = objc_opt_new();
    [(AKPageController *)v9 setNoteEditors:v11];

    id v12 = +[AKInkPageOverlayController newInkOverlayDrawingUndoTargetWithPageController:v9];
    [(AKPageController *)v9 setInkOverlayDrawingUndoTarget:v12];

    [(AKPageController *)v9 setGeometryHelper:0];
    [(AKPageController *)v9 setLayerPresentationManager:0];
    [(AKPageController *)v9 setInkPageOverlayController:0];
    [(AKPageController *)v9 setOverlayView:0];
  }

  return v9;
}

- (id)initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)AKPageController;
  return [(AKPageController *)&v3 init];
}

- (void)unregisterFromUndoManager:(id)a3
{
  id v6 = a3;
  v4 = [(AKPageController *)self inkOverlayDrawingUndoTarget];

  if (v4)
  {
    v5 = [(AKPageController *)self inkOverlayDrawingUndoTarget];
    [v6 removeAllActionsWithTarget:v5];
  }
}

- (void)teardown
{
  [(AKPageController *)self setNoteEditors:0];

  [(AKPageController *)self setPageModelController:0];
}

- (void)setupRelinquishables
{
  objc_super v3 = [(AKPageController *)self geometryHelper];

  if (!v3)
  {
    v4 = [[AKGeometryHelper alloc] initWithPageController:self];
    [(AKPageController *)self setGeometryHelper:v4];

    [(AKPageController *)self setSuperviewDependentThingsWereSetUp:0];
    v5 = [[AKLayerPresentationManager alloc] initWithPageController:self];
    [(AKPageController *)self setLayerPresentationManager:v5];

    BOOL v6 = [(AKPageController *)self shouldPixelate];
    id v7 = [(AKPageController *)self layerPresentationManager];
    [v7 setShouldPixelate:v6];

    v8 = [[AKOverlayView alloc] initWithPageController:self];
    [(AKPageController *)self setOverlayView:v8];

    v9 = [[AKInkPageOverlayController alloc] initWithPageController:self];
    [(AKPageController *)self setInkPageOverlayController:v9];
  }
}

- (void)releaseRelinquishables
{
  id v11 = [(AKPageController *)self controller];
  objc_super v3 = [v11 textEditorController];
  v4 = [v3 annotation];

  if (v4)
  {
    v5 = [(AKPageController *)self pageModelController];
    BOOL v6 = [v5 annotations];
    int v7 = [v6 containsObject:v4];

    if (v7)
    {
      v8 = [v11 textEditorController];
      [v8 endEditing];
    }
  }
  if ([(AKPageController *)self superviewDependentThingsWereSetUp])
  {
    v9 = [(AKPageController *)self layerPresentationManager];
    [v9 teardown];

    v10 = [(AKPageController *)self inkPageOverlayController];
    [v10 teardown];

    [(AKPageController *)self setSuperviewDependentThingsWereSetUp:0];
  }
  [(AKPageController *)self setOverlayView:0];
  [(AKPageController *)self setInkPageOverlayController:0];
  [(AKPageController *)self setLayerPresentationManager:0];
  [(AKPageController *)self setGeometryHelper:0];
}

- (BOOL)relinquishablesAreLoaded
{
  v2 = [(AKPageController *)self overlayView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)overlayWasAddedToSuperview
{
  if (![(AKPageController *)self superviewDependentThingsWereSetUp])
  {
    BOOL v3 = [(AKPageController *)self layerPresentationManager];
    [v3 setup];

    v4 = [(AKPageController *)self inkPageOverlayController];
    [v4 setup];

    [(AKPageController *)self setSuperviewDependentThingsWereSetUp:1];
  }
}

- (void)updateOverlayViewLayers
{
  id v2 = [(AKPageController *)self overlayView];
  [v2 updateLayers];
}

- (void)updateScaleFactor:(double)a3 isLiveUpdate:(BOOL)a4 forceUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = [(AKPageController *)self layerPresentationManager];
  [v8 updateScaleFactor:v6 isLiveUpdate:v5 forceUpdate:a3];
}

- (int64_t)currentModelToScreenExifOrientation
{
  BOOL v3 = [(AKPageController *)self overlayView];
  v4 = [v3 window];

  if (v4)
  {
    BOOL v5 = [(AKPageController *)self overlayView];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_23768A16C;
    v9[3] = &unk_264CDB810;
    v9[4] = self;
    id v10 = v5;
    BOOL v6 = v5;
    int64_t v7 = +[AKGeometryHelper exifOrientationWithConversionBlock:v9];
  }
  else
  {
    BOOL v6 = os_log_create("com.apple.annotationkit", "Page Controller");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_2376DA324(self);
    }

    int64_t v7 = 1;
  }

  return v7;
}

- (double)currentModelToScreenScaleFactor
{
  BOOL v3 = [(AKPageController *)self overlayView];
  v4 = [v3 window];

  if (!v4)
  {
    BOOL v5 = os_log_create("com.apple.annotationkit", "Page Controller");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_2376DA3A8(self);
    }
  }
  -[AKPageController convertRectFromModelToOverlay:](self, "convertRectFromModelToOverlay:", 0.0, 0.0, 1.0, 1.0);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  objc_super v14 = [(AKPageController *)self overlayView];
  v15 = [v14 superview];
  objc_msgSend(v14, "convertRect:toView:", v15, v7, v9, v11, v13);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [v15 window];
  v25 = [v24 screen];
  v26 = [v25 coordinateSpace];
  objc_msgSend(v15, "convertRect:toCoordinateSpace:", v26, v17, v19, v21, v23);
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;

  v39.origin.x = v28;
  v39.origin.y = v30;
  v39.size.width = v32;
  v39.size.height = v34;
  double Width = CGRectGetWidth(v39);
  v40.origin.x = v28;
  v40.origin.y = v30;
  v40.size.width = v32;
  v40.size.height = v34;
  double Height = CGRectGetHeight(v40);
  if (Width >= Height) {
    double v37 = Width;
  }
  else {
    double v37 = Height;
  }

  return v37;
}

- (AKControllerDelegateProtocol)delegate
{
  id v2 = [(AKPageController *)self controller];
  BOOL v3 = [v2 delegate];

  return (AKControllerDelegateProtocol *)v3;
}

- (CGPoint)convertPointFromOverlayToModel:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v6 = [(AKPageController *)self pageIndex];
  double v7 = [(AKPageController *)self controller];
  double v8 = [v7 delegate];
  double v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "convertPoint:fromOverlayToModelWithPageIndex:forAnnotationController:", v6, v7, x, y);
    double x = v10;
    double y = v11;
  }
  else
  {
    double v12 = os_log_create("com.apple.annotationkit", "Page Controller");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23760E000, v12, OS_LOG_TYPE_INFO, "AKController instance did not have a delegate.", v15, 2u);
    }
  }
  double v13 = x;
  double v14 = y;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGPoint)convertPointFromModelToOverlay:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v6 = [(AKPageController *)self pageIndex];
  double v7 = [(AKPageController *)self controller];
  double v8 = [v7 delegate];
  double v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "convertPoint:fromModelToOverlayWithPageIndex:forAnnotationController:", v6, v7, x, y);
    double x = v10;
    double y = v11;
  }
  else
  {
    double v12 = os_log_create("com.apple.annotationkit", "Page Controller");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23760E000, v12, OS_LOG_TYPE_INFO, "AKController instance did not have a delegate.", v15, 2u);
    }
  }
  double v13 = x;
  double v14 = y;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGRect)convertRectFromOverlayToModel:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  unint64_t v8 = [(AKPageController *)self pageIndex];
  double v9 = [(AKPageController *)self controller];
  double v10 = [v9 delegate];
  if (v10)
  {
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v27);
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v28);
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v30);
    objc_msgSend(v10, "convertPoint:fromOverlayToModelWithPageIndex:forAnnotationController:", v8, v9, MinX, MinY);
    double v16 = v15;
    double v18 = v17;
    objc_msgSend(v10, "convertPoint:fromOverlayToModelWithPageIndex:forAnnotationController:", v8, v9, MaxX, MaxY);
    v31.size.CGFloat width = v19 - v16;
    v31.size.CGFloat height = v20 - v18;
    v31.origin.CGFloat x = v16;
    v31.origin.CGFloat y = v18;
    CGRect v32 = CGRectStandardize(v31);
    CGFloat x = v32.origin.x;
    CGFloat y = v32.origin.y;
    CGFloat width = v32.size.width;
    CGFloat height = v32.size.height;
  }
  else
  {
    double v21 = os_log_create("com.apple.annotationkit", "Page Controller");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_23760E000, v21, OS_LOG_TYPE_INFO, "AKController instance did not have a delegate.", v26, 2u);
    }
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)convertRectFromModelToOverlay:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  unint64_t v8 = [(AKPageController *)self pageIndex];
  double v9 = [(AKPageController *)self controller];
  double v10 = [v9 delegate];
  if (v10)
  {
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v27);
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v28);
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v30);
    objc_msgSend(v10, "convertPoint:fromModelToOverlayWithPageIndex:forAnnotationController:", v8, v9, MinX, MinY);
    double v16 = v15;
    double v18 = v17;
    objc_msgSend(v10, "convertPoint:fromModelToOverlayWithPageIndex:forAnnotationController:", v8, v9, MaxX, MaxY);
    v31.size.CGFloat width = v19 - v16;
    v31.size.CGFloat height = v20 - v18;
    v31.origin.CGFloat x = v16;
    v31.origin.CGFloat y = v18;
    CGRect v32 = CGRectStandardize(v31);
    CGFloat x = v32.origin.x;
    CGFloat y = v32.origin.y;
    CGFloat width = v32.size.width;
    CGFloat height = v32.size.height;
  }
  else
  {
    double v21 = os_log_create("com.apple.annotationkit", "Page Controller");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_23760E000, v21, OS_LOG_TYPE_INFO, "AKController instance did not have a delegate.", v26, 2u);
    }
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)maxPageRect
{
  BOOL v3 = [(AKPageController *)self controller];
  v4 = [v3 delegate];
  objc_msgSend(v4, "maxPageRectWithPageIndex:forAnnotationController:", -[AKPageController pageIndex](self, "pageIndex"), v3);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (id)newContentSnapshotPDFDataAtScale:(double)a3 inRect:(CGRect)a4 forLoupeAnnotation:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v11 = a5;
  double v12 = [(AKPageController *)self controller];
  double v13 = [v12 delegate];
  double v14 = objc_msgSend(v13, "newContentSnapshotPDFDataIncludingAdornments:atScale:inRect:onOverlayAtPageIndex:forAnnotationController:", 1, -[AKPageController pageIndex](self, "pageIndex"), v12, a3, x, y, width, height);
  double v15 = [(AKPageController *)self annotationsBeneathLoupe:v11];
  if (![v15 count])
  {
    double v17 = v14;
    goto LABEL_30;
  }
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  double v17 = Mutable;
  if (Mutable)
  {
    CGDataConsumerRef v18 = CGDataConsumerCreateWithCFData(Mutable);
    if (v18)
    {
      double v19 = v18;
      memset(&mediaBox, 0, sizeof(mediaBox));
      double v20 = CGDataProviderCreateWithCFData((CFDataRef)v14);
      provider = v20;
      if (v20 && (double v21 = CGPDFDocumentCreateWithProvider(v20)) != 0)
      {
        document = v21;
        Page = CGPDFDocumentGetPage(v21, 1uLL);
        if (Page)
        {
          double v23 = Page;
          char v24 = 0;
          mediaBodouble x = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
LABEL_13:
          consumer = v19;
          v26 = CGPDFContextCreate(v19, &mediaBox, 0);
          if (v26)
          {
            CGRect v27 = v26;
            v44 = v14;
            v45 = v13;
            id v46 = v11;
            CGPDFContextBeginPage(v26, 0);
            CGContextSaveGState(v27);
            if ((v24 & 1) == 0) {
              CGContextDrawPDFPage(v27, v23);
            }
            CGContextTranslateCTM(v27, mediaBox.origin.x, mediaBox.origin.y);
            CGContextScaleCTM(v27, mediaBox.size.width, mediaBox.size.height);
            -[AKPageController convertRectFromOverlayToModel:](self, "convertRectFromOverlayToModel:", x, y, width, height);
            double v29 = v28;
            double v31 = v30;
            CGContextScaleCTM(v27, 1.0 / v32, 1.0 / v33);
            CGContextTranslateCTM(v27, -v29, -v31);
            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            id v34 = v15;
            uint64_t v35 = [v34 countByEnumeratingWithState:&v50 objects:v55 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v51;
              do
              {
                for (uint64_t i = 0; i != v36; ++i)
                {
                  if (*(void *)v51 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  CGRect v39 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                  CGContextSaveGState(v27);
                  [v39 integralDrawingBounds];
                  CGFloat v40 = v57.origin.x;
                  CGFloat v41 = v57.origin.y;
                  if (!CGRectIsInfinite(v57)) {
                    CGContextTranslateCTM(v27, v40, v41);
                  }
                  +[AKController renderAnnotation:inContext:](AKController, "renderAnnotation:inContext:", v39, v27, v44, v45, v46);
                  CGContextRestoreGState(v27);
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v50 objects:v55 count:16];
              }
              while (v36);
            }

            CGContextRestoreGState(v27);
            CGPDFContextEndPage(v27);
            CGPDFContextClose(v27);
            CGContextRelease(v27);
            double v13 = v45;
            id v11 = v46;
            double v14 = v44;
          }
          CGDataConsumerRelease(consumer);
          if (document) {
            CGPDFDocumentRelease(document);
          }
          if (provider) {
            CGDataProviderRelease(provider);
          }
          goto LABEL_30;
        }
      }
      else
      {
        document = 0;
      }
      mediaBox.origin.double x = 0.0;
      mediaBox.origin.double y = 0.0;
      mediaBox.size.double width = width;
      mediaBox.size.double height = height;
      double v25 = os_log_create("com.apple.annotationkit", "Page Controller");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        sub_2376DA42C(v25);
      }

      double v23 = 0;
      char v24 = 1;
      goto LABEL_13;
    }
  }
LABEL_30:
  v42 = v17;

  return v42;
}

- (id)annotationsBeneathLoupe:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [MEMORY[0x263EFF9B0] orderedSet];
  double v6 = [(AKPageController *)self pageModelController];
  double v7 = [v6 annotations];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v28 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(id *)(*((void *)&v27 + 1) + 8 * v12);
      if (v13 == v4) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v13, "drawingBounds", (void)v27);
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          CGFloat v21 = v20;
          [v4 drawingBounds];
          v35.origin.double x = v22;
          v35.origin.double y = v23;
          v35.size.double width = v24;
          v35.size.double height = v25;
          v34.origin.double x = v15;
          v34.origin.double y = v17;
          v34.size.double width = v19;
          v34.size.double height = v21;
          if (CGRectIntersectsRect(v34, v35)) {
            [v5 addObject:v13];
          }
        }
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v5;
}

- (double)modelBaseScaleFactor
{
  unint64_t v3 = [(AKPageController *)self pageIndex];
  id v4 = [(AKPageController *)self controller];
  double v5 = [v4 delegate];
  double v6 = 1.0;
  if (objc_opt_respondsToSelector())
  {
    [v5 modelBaseScaleFactorOfPageAtIndex:v3 forAnnotationController:v4];
    double v6 = v7;
  }

  return v6;
}

- (CGRect)visibleRectOfOverlay
{
  unint64_t v3 = [(AKPageController *)self controller];
  id v4 = [v3 delegate];
  double v5 = [(AKPageController *)self overlayView];
  [v5 akVisibleRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[AKPageController convertRectFromOverlayToModel:](self, "convertRectFromOverlayToModel:", v7, v9, v11, v13);
  CGFloat x = v14;
  CGFloat y = v16;
  CGFloat width = v18;
  CGFloat height = v20;
  if (+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
  {
    [(AKPageController *)self maxPageRect];
    CGFloat x = v22;
    CGFloat y = v23;
    CGFloat width = v24;
    CGFloat height = v25;
  }
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v4, "visibleRectOfOverlayAtPageIndex:forAnnotationController:", -[AKPageController pageIndex](self, "pageIndex"), v3);
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
    {
      v38.origin.CGFloat x = v27;
      v38.origin.CGFloat y = v29;
      v38.size.CGFloat width = v31;
      v38.size.CGFloat height = v33;
      v41.origin.CGFloat x = x;
      v41.origin.CGFloat y = y;
      v41.size.CGFloat width = width;
      v41.size.CGFloat height = height;
      CGRect v39 = CGRectIntersection(v38, v41);
      CGFloat x = v39.origin.x;
      CGFloat y = v39.origin.y;
      CGFloat width = v39.size.width;
      CGFloat height = v39.size.height;
    }
  }

  double v34 = x;
  double v35 = y;
  double v36 = width;
  double v37 = height;
  result.size.CGFloat height = v37;
  result.size.CGFloat width = v36;
  result.origin.CGFloat y = v35;
  result.origin.CGFloat x = v34;
  return result;
}

- (void)openPopoverForHighlightAnnotation:(id)a3
{
  id v4 = a3;
  double v5 = [v4 color];
  int64_t v6 = +[AKHighlightAppearanceHelper attributeTagForHighlightOfColor:v5];

  unsigned int v7 = +[AKHighlightAppearanceHelper annotationStyleForHighlightAttributeWithTag:v6];
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 3;
  }
  +[AKAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AKAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", v8, 0, [v4 style] == 2);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  double v9 = [(AKPageController *)self _popoverPresentingViewController];
  double v10 = [v9 view];
  [v4 integralDrawingBounds];
  -[AKPageController convertRectFromModelToOverlay:](self, "convertRectFromModelToOverlay:");
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  CGFloat v19 = [(AKPageController *)self overlayView];
  objc_msgSend(v19, "convertRect:toView:", v10, v12, v14, v16, v18);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  double v28 = [[AKHighlightColorEditorController alloc] initWithNibName:0 bundle:0];
  [(AKHighlightColorEditorController *)v28 setDelegate:self];
  [(AKAnnotationPopoverViewController *)v28 setAnnotationTheme:v29];
  [(AKHighlightColorEditorController *)v28 setPageTheme:0];
  [(AKAnnotationPopoverViewController *)v28 setAnnotation:v4];

  [(AKAnnotationPopoverViewController *)v28 setAnnotationPageController:self];
  -[AKHighlightColorEditorController presentFromRect:view:](v28, "presentFromRect:view:", v10, v21, v23, v25, v27);
}

- (void)editorController:(id)a3 editNote:(id)a4
{
  id v5 = a4;
  int64_t v6 = [v5 childAnnotation];
  if (!v6)
  {
    [(AKPageController *)self addPopupToAnnotation:v5 openPopup:0];
    int64_t v6 = [v5 childAnnotation];
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_23768B474;
  v8[3] = &unk_264CDB110;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

- (void)editorController:(id)a3 setTheme:(id)a4 forAnnotation:(id)a5
{
  uint64_t v6 = 765200;
  id v21 = a4;
  id v7 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = 765201;
  }
  else
  {
    id v9 = self;
    char v10 = objc_opt_isKindOfClass();

    if (v10)
    {
      uint64_t v6 = 765202;
    }
    else
    {
      double v11 = self;
      char v12 = objc_opt_isKindOfClass();

      if ((v12 & 1) == 0)
      {
        double v13 = self;
        char v14 = objc_opt_isKindOfClass();

        if (v14)
        {
          uint64_t v6 = 765203;
        }
        else
        {
          double v15 = self;
          char v16 = objc_opt_isKindOfClass();

          if (v16)
          {
            uint64_t v6 = 765204;
          }
          else
          {
            double v17 = self;
            char v18 = objc_opt_isKindOfClass();

            if ((v18 & 1) == 0) {
              goto LABEL_13;
            }
            uint64_t v6 = 765206;
          }
        }
      }
    }
  }
  CGFloat v19 = [[AKMinimalUserInterfaceItem alloc] initWithTag:v6];
  double v20 = [(AKPageController *)self controller];
  [v20 performActionForSender:v19];

LABEL_13:
}

- (void)editorController:(id)a3 deleteAnnotation:(id)a4
{
  id v9 = a4;
  id v5 = [(AKPageController *)self pageModelController];
  uint64_t v6 = [v5 mutableArrayValueForKey:@"annotations"];
  [v6 removeObject:v9];

  if ([v9 conformsToAKParentAnnotationProtocol])
  {
    id v7 = [v9 childAnnotation];
    if (v7)
    {
      uint64_t v8 = [v5 mutableArrayValueForKey:@"annotations"];
      [v8 removeObject:v7];
    }
  }
}

- (BOOL)editorController:(id)a3 isRightArrowEnabledForAnnotation:(id)a4
{
  return 0;
}

- (void)addPopupToAnnotation:(id)a3 openPopup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[AKNoteAnnotationHelper newPopupAnnotationWithParent:v6 onPageController:self];
  if (v7)
  {
    uint64_t v8 = [(AKPageController *)self controller];
    id v9 = [v8 toolController];
    [v9 addNewAnnotation:v7 onPageController:self shouldSelect:0 shouldCascade:0];

    [v7 setParentAnnotation:v6];
    [v6 setChildAnnotation:v7];
    if (v4)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23768B830;
      v10[3] = &unk_264CDB110;
      v10[4] = self;
      id v11 = v7;
      dispatch_async(MEMORY[0x263EF83A0], v10);
    }
  }
}

- (void)removeNoteFromAnnotation:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 childAnnotation];
  if (v4)
  {
    id v5 = [(AKPageController *)self pageModelController];
    id v6 = [v5 mutableArrayValueForKey:@"annotations"];
    [v6 removeObject:v4];

    [v7 setChildAnnotation:0];
  }
}

- (void)openPopupAnnotation:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(AKPageController *)self noteEditors];
  id v5 = [v9 UUID];
  id v6 = [v4 objectForKey:v5];

  if (!v6)
  {
    id v6 = objc_alloc_init(AKNoteEditorController);
    id v7 = [(AKPageController *)self noteEditors];
    uint64_t v8 = [v9 UUID];
    [v7 setObject:v6 forKey:v8];

    [(AKNoteEditorController *)v6 setAnnotation:v9];
    [(AKNoteEditorController *)v6 setDelegate:self];
  }
  [(AKNoteEditorController *)v6 show:1];
  [(AKNoteEditorController *)v6 beginEditing:1];
}

- (void)noteEditorDidFinishEditing:(id)a3
{
  id v11 = a3;
  BOOL v4 = [v11 annotation];
  id v5 = [v11 editedText];
  [v4 setContents:v5];

  id v6 = [v4 contents];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    uint64_t v8 = [v4 parentAnnotation];
    [(AKPageController *)self removeNoteFromAnnotation:v8];
  }
  id v9 = [(AKPageController *)self noteEditors];
  char v10 = [v4 UUID];
  [v9 removeObjectForKey:v10];

  [v11 hide];
}

- (unint64_t)edgeForNoteEditor:(id)a3
{
  return 1;
}

- (id)stickyContainerForNoteEditor:(id)a3
{
  unint64_t v3 = [(AKPageController *)self _popoverPresentingViewController];
  BOOL v4 = [v3 view];

  return v4;
}

- (CGRect)stickyViewFrameForNoteEditor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 annotation];
  id v6 = [v5 parentAnnotation];
  if ([v5 visualStyle])
  {
    uint64_t v7 = v5;
  }
  else
  {
    uint64_t v8 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      double v10 = *MEMORY[0x263F001A8];
      double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
      goto LABEL_7;
    }
    uint64_t v7 = v6;
  }
  [v7 rectangle];
LABEL_7:
  -[AKPageController convertRectFromModelToOverlay:](self, "convertRectFromModelToOverlay:", v10, v11, v12, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v22 = [(AKPageController *)self overlayView];
  double v23 = [(AKPageController *)self stickyContainerForNoteEditor:v4];

  objc_msgSend(v22, "convertRect:toView:", v23, v15, v17, v19, v21);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  double v32 = v25;
  double v33 = v27;
  double v34 = v29;
  double v35 = v31;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (void)noteEditorWillPresentFullScreen:(id)a3
{
  id v4 = [(AKPageController *)self controller];
  unint64_t v3 = [v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 controllerWillShowSignatureCaptureView:v4];
  }
}

- (void)noteEditorWillDismissFromFullScreen:(id)a3
{
  id v4 = [(AKPageController *)self controller];
  unint64_t v3 = [v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 controllerWillDismissSignatureCaptureView:v4];
  }
}

- (BOOL)handleEditAnnotation:(id)a3
{
  return 0;
}

- (void)_updateOverlayVisibilityWithToolPicker:(id)a3 visible:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = [(AKPageController *)self overlayView];

  if (v8)
  {
    id v9 = [(AKPageController *)self overlayView];
    [v7 addObject:v9];
  }
  double v10 = [(AKPageController *)self inkPageOverlayController];
  double v11 = [v10 inkOverlayView];

  if (v11)
  {
    double v12 = [(AKPageController *)self inkPageOverlayController];
    double v13 = [v12 inkOverlayView];
    [v7 addObject:v13];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v24;
    *(void *)&long long v16 = 138412802;
    long long v22 = v16;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v6, "setVisible:forFirstResponder:", v4, v20, v22, (void)v23);
        double v21 = os_log_create("com.apple.annotationkit", "AKPageController");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v22;
          uint64_t v28 = v20;
          __int16 v29 = 2112;
          id v30 = v6;
          __int16 v31 = 1024;
          BOOL v32 = v4;
          _os_log_impl(&dword_23760E000, v21, OS_LOG_TYPE_DEFAULT, "Updated visibility for overlay: %@, with toolpicker: %@, to visible: %d", buf, 0x1Cu);
        }
      }
      uint64_t v17 = [v14 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v17);
  }
}

- (id)_popoverPresentingViewController
{
  id v2 = [(AKPageController *)self controller];
  unint64_t v3 = [v2 delegate];
  BOOL v4 = [v3 popoverPresentingViewControllerForAnnotationController:v2];

  return v4;
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (AKPageModelController)pageModelController
{
  return (AKPageModelController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPageModelController:(id)a3
{
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->_pageIndeCGFloat x = a3;
}

- (BOOL)shouldPixelate
{
  return self->_shouldPixelate;
}

- (void)setShouldPixelate:(BOOL)a3
{
  self->_shouldPixelate = a3;
}

- (AKGeometryHelper)geometryHelper
{
  return self->_geometryHelper;
}

- (void)setGeometryHelper:(id)a3
{
}

- (AKLayerPresentationManager)layerPresentationManager
{
  return self->_layerPresentationManager;
}

- (void)setLayerPresentationManager:(id)a3
{
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (AKInkPageOverlayController)inkPageOverlayController
{
  return self->_inkPageOverlayController;
}

- (void)setInkPageOverlayController:(id)a3
{
}

- (id)inkOverlayDrawingUndoTarget
{
  return self->_inkOverlayDrawingUndoTarget;
}

- (void)setInkOverlayDrawingUndoTarget:(id)a3
{
}

- (AKHighlightColorEditorController)highlightColorEditorController
{
  return self->_highlightColorEditorController;
}

- (BOOL)superviewDependentThingsWereSetUp
{
  return self->_superviewDependentThingsWereSetUp;
}

- (void)setSuperviewDependentThingsWereSetUp:(BOOL)a3
{
  self->_superviewDependentThingsWereSetUp = a3;
}

- (NSMutableDictionary)noteEditors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNoteEditors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteEditors, 0);
  objc_storeStrong((id *)&self->_highlightColorEditorController, 0);
  objc_storeStrong(&self->_inkOverlayDrawingUndoTarget, 0);
  objc_storeStrong((id *)&self->_inkPageOverlayController, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_layerPresentationManager, 0);
  objc_storeStrong((id *)&self->_geometryHelper, 0);
  objc_storeStrong((id *)&self->_pageModelController, 0);

  objc_destroyWeak((id *)&self->_controller);
}

@end