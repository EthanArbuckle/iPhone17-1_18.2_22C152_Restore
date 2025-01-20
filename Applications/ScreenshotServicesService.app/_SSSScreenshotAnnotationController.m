@interface _SSSScreenshotAnnotationController
+ (id)annotationDataFromAnnotations:(id)a3;
+ (id)annotationsFromAnnotationData:(id)a3;
- (BOOL)_isEditingScreenshotImage;
- (BOOL)_updateAnnotationsForViewState:(id)a3;
- (BOOL)_updateAnnotationsForViewState:(id)a3 createUndoCommand:(BOOL)a4;
- (BOOL)didDrawPenStroke;
- (CGRect)maxPageRectWithPageIndex:(unint64_t)a3 forAnnotationController:(id)a4;
- (CGRect)rectToCenterAboveKeyboard;
- (CGRect)visibleRectOfOverlayAtPageIndex:(unint64_t)a3 forAnnotationController:(id)a4;
- (NSString)originalImageDescription;
- (_SSSScreenshotAnnotationController)init;
- (double)modelBaseScaleFactorOfPageAtIndex:(unint64_t)a3 forAnnotationController:(id)a4;
- (id)contentSnapshot;
- (id)doubleTapGestureRecognizer;
- (id)gestureRecognizers;
- (id)layerContainingQuickBackgroundForLoupeOnOverlayAtPageIndex:(unint64_t)a3 forAnnotationController:(id)a4;
- (id)longPressGestureRecognizer;
- (id)newContentSnapshotPDFDataIncludingAdornments:(BOOL)a3 atScale:(double)a4 inRect:(CGRect)a5 onOverlayAtPageIndex:(unint64_t)a6 forAnnotationController:(id)a7;
- (id)overlayView;
- (id)pageModelController;
- (id)panGestureRecognizer;
- (id)popoverPresentingViewControllerForAnnotationController:(id)a3;
- (id)rotationGestureRecognizer;
- (id)tapGestureRecognizer;
- (id)undoManagerForAnnotationController:(id)a3;
- (void)_enableInkingOnAKController:(BOOL)a3;
- (void)_prepareAKController;
- (void)_updateAnnotations;
- (void)_updateAnnotationsCreateUndoCommand:(BOOL)a3;
- (void)controllerDidDismissPopover:(id)a3;
- (void)dealloc;
- (void)editCheckpointReachedForAnnotationController:(id)a3;
- (void)editDetectedForAnnotationController:(id)a3;
- (void)endedEditingWithOverlay;
- (void)handleDrawingGestureRecognizerUpdate:(id)a3;
- (void)installDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5;
- (void)logDidEnterEditingWithOverlay;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)penStrokeCompletedForAnnotationController:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAnnotationKitController:(id)a3;
- (void)setAnnotationKitController:(id)a3 didAllocate:(BOOL)a4;
- (void)setGesturesEnabled:(BOOL)a3;
- (void)setScreenshot:(id)a3;
- (void)uninstallDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5;
- (void)updateDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 withPriority:(BOOL)a5 forAnnotationController:(id)a6;
- (void)updateUndoState;
@end

@implementation _SSSScreenshotAnnotationController

- (_SSSScreenshotAnnotationController)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SSSScreenshotAnnotationController;
  v2 = [(_SSSScreenshotAnnotationController *)&v6 init];
  v3 = objc_alloc_init(_SSSScreenshotAnnotationControllerAKOverlayContainerView);
  overlayView = v2->_overlayView;
  v2->_overlayView = v3;

  return v2;
}

- (void)dealloc
{
  v3 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  if (v3)
  {
    if ([(_SSSScreenshotAnnotationController *)self _isEditingScreenshotImage]
      && [v3 isOverlayViewLoadedAtIndex:0])
    {
      [v3 relinquishOverlayAtIndex:0];
    }
    [(_SSSScreenshotAnnotationController *)self setAnnotationKitController:0];
  }

  v4.receiver = self;
  v4.super_class = (Class)_SSSScreenshotAnnotationController;
  [(_SSSScreenshotAnnotationController *)&v4 dealloc];
}

- (BOOL)_isEditingScreenshotImage
{
  return [(_SSSScreenshotContentOverlayController *)self viewState] == 0;
}

- (id)pageModelController
{
  if ([(_SSSScreenshotAnnotationController *)self _isEditingScreenshotImage])
  {
    v3 = self->_pageModelController;
  }
  else
  {
    objc_super v4 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
    v5 = [v4 modelController];
    [(_SSSScreenshotContentOverlayController *)self viewState];
    v3 = [v5 pageModelControllerForPage:v6];
  }

  return v3;
}

- (void)setAnnotationKitController:(id)a3
{
}

- (void)setAnnotationKitController:(id)a3 didAllocate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  v8 = v7;
  if (v7 != v6)
  {
    if (self->_shouldTeardownAnnotationController)
    {
      [v7 removeObserver:self forKeyPath:@"modifiedImageDescription" context:off_1000B4AA0];
      [v8 teardown];
    }
    v9.receiver = self;
    v9.super_class = (Class)_SSSScreenshotAnnotationController;
    [(_SSSScreenshotContentOverlayController *)&v9 setAnnotationKitController:v6];
    self->_shouldTeardownAnnotationController = v4;
    if (v6 && v4) {
      [v6 addObserver:self forKeyPath:@"modifiedImageDescription" options:1 context:off_1000B4AA0];
    }
  }
}

- (void)_prepareAKController
{
  v3 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];

  if (v3) {
    [(_SSSScreenshotAnnotationController *)self setAnnotationKitController:0];
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  BOOL v4 = (void *)qword_1000B57F0;
  uint64_t v31 = qword_1000B57F0;
  if (!qword_1000B57F0)
  {
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_100039980;
    v26 = &unk_100099928;
    v27 = &v28;
    sub_100039980((uint64_t)&v23);
    BOOL v4 = (void *)v29[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v28, 8);
  id v6 = [v5 controllerWithDelegate:self];
  [(_SSSScreenshotAnnotationController *)self setAnnotationKitController:v6 didAllocate:1];

  id v7 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  [v7 setAnnotationEditingEnabled:1];

  v8 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  [v8 setPencilAlwaysDraws:1];

  objc_super v9 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  [v9 setUseHighVisibilityDefaultInks:1];

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v10 = (void *)qword_1000B5800;
  uint64_t v31 = qword_1000B5800;
  if (!qword_1000B5800)
  {
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_100039B4C;
    v26 = &unk_100099928;
    v27 = &v28;
    sub_100039B4C((uint64_t)&v23);
    v10 = (void *)v29[3];
  }
  v11 = v10;
  _Block_object_dispose(&v28, 8);
  v12 = (AKPageModelController *)objc_alloc_init(v11);
  pageModelController = self->_pageModelController;
  self->_pageModelController = v12;

  v14 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  v15 = [v14 modelController];
  v16 = [v15 mutableArrayValueForKey:@"pageModelControllers"];
  [v16 addObject:self->_pageModelController];

  v17 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  [v17 setCurrentPageIndex:0];

  [(_SSSScreenshotAnnotationController *)self _enableInkingOnAKController:1];
  v18 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  [v18 prepareOverlayAtIndex:0];

  overlayView = self->_overlayView;
  v20 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  v21 = [v20 overlayViewAtIndex:0];
  [(_SSSScreenshotAnnotationControllerAKOverlayContainerView *)overlayView setManagedView:v21];

  v22 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  [v22 setRulerHostingDelegate:self];
}

- (void)_enableInkingOnAKController:(BOOL)a3
{
  id v3 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  [v3 setToolMode:4];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_SSSScreenshotContentOverlayController *)self active] != a3)
  {
    id v5 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];

    if (v5)
    {
      v14.receiver = self;
      v14.super_class = (Class)_SSSScreenshotAnnotationController;
      [(_SSSScreenshotContentOverlayController *)&v14 setActive:v3];
      unsigned int v6 = [(_SSSScreenshotAnnotationController *)self _isEditingScreenshotImage];
      if (v3)
      {
        if (v6)
        {
          id v7 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
          [v7 prepareOverlayAtIndex:0];

          overlayView = self->_overlayView;
          objc_super v9 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
          v10 = [v9 overlayViewAtIndex:0];
          [(_SSSScreenshotAnnotationControllerAKOverlayContainerView *)overlayView setManagedView:v10];
        }
        v11 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
        [v11 setRulerHostingDelegate:self];

        [(_SSSScreenshotAnnotationController *)self _enableInkingOnAKController:1];
      }
      else
      {
        if (v6)
        {
          [(_SSSScreenshotAnnotationControllerAKOverlayContainerView *)self->_overlayView setManagedView:0];
          v12 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
          [v12 relinquishOverlayAtIndex:0];
        }
        v13 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
        [v13 setRulerHostingDelegate:0];
      }
    }
  }
}

- (void)setScreenshot:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SSSScreenshotAnnotationController;
  [(_SSSScreenshotContentOverlayController *)&v11 setScreenshot:v4];
  id v5 = +[NSNotificationCenter defaultCenter];
  unsigned int v6 = sub_100037564();
  [v5 removeObserver:self name:v6 object:0];

  if ([(_SSSScreenshotAnnotationController *)self _isEditingScreenshotImage])
  {
    if ((_os_feature_enabled_impl() & 1) == 0) {
      [(_SSSScreenshotAnnotationController *)self _prepareAKController];
    }
  }
  else if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v7 = [v4 representation];
    v8 = [v7 screenshotRepresentationAKControllerForPDF];

    objc_super v9 = +[NSNotificationCenter defaultCenter];
    v10 = sub_100037564();
    [v9 addObserver:self selector:"handleDrawingGestureRecognizerUpdate:" name:v10 object:v8];

    [v8 _updateGestureDependencyPriority];
  }
}

- (id)overlayView
{
  if ([(_SSSScreenshotAnnotationController *)self _isEditingScreenshotImage]) {
    BOOL v3 = self->_overlayView;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (CGRect)rectToCenterAboveKeyboard
{
  v43.receiver = self;
  v43.super_class = (Class)_SSSScreenshotAnnotationController;
  [(_SSSScreenshotContentOverlayController *)&v43 rectToCenterAboveKeyboard];
  CGFloat x = v2;
  CGFloat y = v4;
  CGFloat width = v6;
  CGFloat height = v8;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v10 = [(_SSSScreenshotAnnotationController *)self pageModelController];
  objc_super v11 = [v10 selectedAnnotations];

  id v12 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v40;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        t1.a = 0.0;
        *(void *)&t1.b = &t1;
        *(void *)&t1.c = 0x2050000000;
        v16 = (void *)qword_1000B5810;
        *(void *)&t1.d = qword_1000B5810;
        if (!qword_1000B5810)
        {
          *(void *)&v38.a = _NSConcreteStackBlock;
          *(void *)&v38.b = 3221225472;
          *(void *)&v38.c = sub_100039BF4;
          *(void *)&v38.d = &unk_100099928;
          *(void *)&v38.tCGFloat x = &t1;
          sub_100039BF4((uint64_t)&v38);
          v16 = *(void **)(*(void *)&t1.b + 24);
        }
        id v17 = v16;
        _Block_object_dispose(&t1, 8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v15 drawingBounds];
          CGFloat x = v18;
          CGFloat y = v19;
          CGFloat width = v20;
          CGFloat height = v21;
          goto LABEL_13;
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  if (!CGRectIsNull(v45))
  {
    v22 = [(_SSSScreenshotContentOverlayController *)self screenshot];
    v23 = [v22 environmentDescription];
    [v23 imagePointSize];
    CGFloat v25 = v24;

    long long v33 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v38.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v31 = *(_OWORD *)&v38.a;
    *(_OWORD *)&v38.c = v33;
    *(_OWORD *)&v38.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    long long v30 = *(_OWORD *)&v38.tx;
    CGAffineTransformMakeScale(&t2, 1.0, -1.0);
    *(_OWORD *)&t1.a = v31;
    *(_OWORD *)&t1.c = v33;
    *(_OWORD *)&t1.tCGFloat x = v30;
    CGAffineTransformConcat(&v38, &t1, &t2);
    CGAffineTransformMakeTranslation(&v35, 0.0, v25);
    CGAffineTransform v34 = v38;
    CGAffineTransformConcat(&t1, &v34, &v35);
    CGAffineTransform v38 = t1;
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    CGRect v47 = CGRectApplyAffineTransform(v46, &t1);
    CGFloat x = v47.origin.x;
    CGFloat y = v47.origin.y;
    CGFloat width = v47.size.width;
    CGFloat height = v47.size.height;
  }
  double v26 = x;
  double v27 = y;
  double v28 = width;
  double v29 = height;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (id)gestureRecognizers
{
  BOOL v3 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];

  if (v3)
  {
    v15 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
    double v4 = [v15 tapGestureRecognizer];
    v16[0] = v4;
    id v5 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
    double v6 = [v5 pressGestureRecognizer];
    v16[1] = v6;
    id v7 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
    double v8 = [v7 doubleTapGestureRecognizer];
    v16[2] = v8;
    objc_super v9 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
    v10 = [v9 panGestureRecognizer];
    v16[3] = v10;
    objc_super v11 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
    id v12 = [v11 rotationGestureRecognizer];
    v16[4] = v12;
    uint64_t v13 = +[NSArray arrayWithObjects:v16 count:5];
  }
  else
  {
    uint64_t v13 = &__NSArray0__struct;
  }

  return v13;
}

- (id)tapGestureRecognizer
{
  double v2 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  BOOL v3 = [v2 tapGestureRecognizer];

  return v3;
}

- (id)doubleTapGestureRecognizer
{
  double v2 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  BOOL v3 = [v2 doubleTapGestureRecognizer];

  return v3;
}

- (id)longPressGestureRecognizer
{
  double v2 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  BOOL v3 = [v2 pressGestureRecognizer];

  return v3;
}

- (id)panGestureRecognizer
{
  double v2 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  BOOL v3 = [v2 panGestureRecognizer];

  return v3;
}

- (id)rotationGestureRecognizer
{
  double v2 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  BOOL v3 = [v2 rotationGestureRecognizer];

  return v3;
}

- (void)setGesturesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SSSScreenshotAnnotationController;
  -[_SSSScreenshotContentOverlayController setGesturesEnabled:](&v6, "setGesturesEnabled:");
  id v5 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  [v5 setAnnotationEditingEnabled:v3];
}

- (void)updateUndoState
{
  BOOL v3 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  [v3 validateUndo:0];

  id v4 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  [v4 validateRedo:0];
}

- (void)logDidEnterEditingWithOverlay
{
  double v2 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  BOOL v3 = (void *)qword_1000B5818;
  uint64_t v9 = qword_1000B5818;
  if (!qword_1000B5818)
  {
    id v4 = (void *)sub_1000399D8();
    v7[3] = (uint64_t)dlsym(v4, "AKStatisticsDocumentTypeImage");
    qword_1000B5818 = v7[3];
    BOOL v3 = (void *)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
  {
    id v5 = (_Unwind_Exception *)sub_10005F674();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  [v2 beginLogging:@"screenshotservices" documentType:*v3];
}

- (void)endedEditingWithOverlay
{
  id v2 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  [v2 endLogging];
}

- (void)_updateAnnotations
{
}

- (void)_updateAnnotationsCreateUndoCommand:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_SSSScreenshotAnnotationController *)self _isEditingScreenshotImage])
  {
    id v6 = [(_SSSScreenshotContentOverlayController *)self viewState];
    -[_SSSScreenshotAnnotationController _updateAnnotationsForViewState:createUndoCommand:](self, "_updateAnnotationsForViewState:createUndoCommand:", v6, v5, v3);
    return;
  }
  id v7 = [(_SSSScreenshotContentOverlayController *)self screenshot];
  uint64_t v8 = [v7 PDFDocument];
  id v9 = [v8 pageCount];

  if ((unint64_t)v9 <= 1 && !v3)
  {
    id v22 = [(_SSSScreenshotContentOverlayController *)self delegate];
    v10 = [(_SSSScreenshotContentOverlayController *)self screenshot];
    objc_super v11 = v22;
    id v12 = v10;
    uint64_t v13 = 0;
LABEL_16:
    [v11 screenshot:v12 didHaveChangeOnPage:v13];

    return;
  }
  objc_super v14 = [(_SSSScreenshotContentOverlayController *)self screenshot];
  v15 = [v14 PDFDocument];
  id v16 = [v15 pageCount];

  if (v16)
  {
    unint64_t v17 = 0;
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (-[_SSSScreenshotAnnotationController _updateAnnotationsForViewState:createUndoCommand:](self, "_updateAnnotationsForViewState:createUndoCommand:", [(_SSSScreenshotContentOverlayController *)self viewState], v17, v3))
      {
        uint64_t v18 = v17;
      }
      ++v17;
      double v19 = [(_SSSScreenshotContentOverlayController *)self screenshot];
      double v20 = [v19 PDFDocument];
      id v21 = [v20 pageCount];
    }
    while (v17 < (unint64_t)v21);
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v22 = [(_SSSScreenshotContentOverlayController *)self delegate];
      v10 = [(_SSSScreenshotContentOverlayController *)self screenshot];
      objc_super v11 = v22;
      id v12 = v10;
      uint64_t v13 = v18;
      goto LABEL_16;
    }
  }
}

- (BOOL)_updateAnnotationsForViewState:(id)a3
{
  return -[_SSSScreenshotAnnotationController _updateAnnotationsForViewState:createUndoCommand:](self, "_updateAnnotationsForViewState:createUndoCommand:", a3.var0, a3.var1, 1);
}

- (BOOL)_updateAnnotationsForViewState:(id)a3 createUndoCommand:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v8 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
  id v9 = [v8 modelController];
  v10 = [v9 pageModelControllerForPage:var1];

  if (v10)
  {
    objc_super v11 = [(_SSSScreenshotContentOverlayController *)self screenshot];
    id v12 = [v11 viewModificationInfoForState:var0, var1];

    uint64_t v13 = [v10 annotations];
    objc_super v14 = +[_SSSScreenshotAnnotationController annotationDataFromAnnotations:v13];

    v15 = [v12 annotationNSDatas];
    unsigned __int8 v16 = [v14 isEqual:v15];
    char v17 = v16 ^ 1;
    if ((v16 & 1) == 0)
    {
      long long v30 = v15;
      long long v31 = v14;
      char v32 = v16 ^ 1;
      long long v33 = v12;
      int64_t v34 = var0;
      int64_t v35 = var1;
      BOOL v36 = v4;
      uint64_t v18 = +[NSMutableArray array];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v37 = v10;
      double v19 = [v10 annotations];
      id v20 = [v19 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v39;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v39 != v22) {
              objc_enumerationMutation(v19);
            }
            double v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            id v25 = [v24 copy];
            if (v25)
            {
              [v18 addObject:v25];
            }
            else
            {
              double v26 = os_log_create("com.apple.screenshotservices", "AnnotationEditing");
              if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
              {
                double v27 = [v24 displayName];
                *(_DWORD *)buf = 138412546;
                objc_super v43 = v27;
                __int16 v44 = 2112;
                CGRect v45 = v24;
                _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Copied annotation was nil for annotation %@ %@", buf, 0x16u);
              }
            }
          }
          id v21 = [v19 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v21);
      }

      id v12 = v33;
      [v33 setOriginalAnnotations:v18];
      objc_super v14 = v31;
      [v33 setAnnotationNSDatas:v31];
      double v28 = [(_SSSScreenshotContentOverlayController *)self screenshot];
      [v28 promoteViewValueToModelValueForKey:1 forState:v34 createUndoCommand:v35];

      v10 = v37;
      char v17 = v32;
      v15 = v30;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

+ (id)annotationDataFromAnnotations:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) dataRepresentation:v12];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)annotationsFromAnnotationData:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v19 = 0;
        id v20 = &v19;
        uint64_t v21 = 0x2050000000;
        v10 = (void *)qword_1000B5820;
        uint64_t v22 = qword_1000B5820;
        if (!qword_1000B5820)
        {
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_100039C9C;
          v18[3] = &unk_100099928;
          v18[4] = &v19;
          sub_100039C9C((uint64_t)v18);
          v10 = (void *)v20[3];
        }
        id v11 = v10;
        _Block_object_dispose(&v19, 8);
        long long v12 = [v11 annotationWithData:v9, v14];
        [v4 addObject:v12];
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v23 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)editDetectedForAnnotationController:(id)a3
{
  [(_SSSScreenshotAnnotationController *)self _updateAnnotationsCreateUndoCommand:0];
  if ([(_SSSScreenshotAnnotationController *)self _isEditingScreenshotImage])
  {
    id v4 = [(_SSSScreenshotContentOverlayController *)self delegate];
    [v4 screenshotDidMakeAnnotationEditOnImage];
  }
}

- (void)editCheckpointReachedForAnnotationController:(id)a3
{
}

- (void)penStrokeCompletedForAnnotationController:(id)a3
{
  self->_didDrawPenStroke = 1;
  [(_SSSScreenshotAnnotationController *)self _updateAnnotations];
  if ([(_SSSScreenshotAnnotationController *)self _isEditingScreenshotImage])
  {
    id v4 = [(_SSSScreenshotContentOverlayController *)self delegate];
    [v4 screenshotDidMakeAnnotationEditOnImage];
  }
}

- (CGRect)maxPageRectWithPageIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  CGFloat y = CGRectZero.origin.y;
  id v5 = [(_SSSScreenshotContentOverlayController *)self screenshot];
  id v6 = [v5 environmentDescription];
  [v6 imagePointSize];
  double v8 = v7;
  double v10 = v9;

  double x = CGRectZero.origin.x;
  double v12 = y;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.double x = x;
  return result;
}

- (CGRect)visibleRectOfOverlayAtPageIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  long long v23 = 0u;
  CGSize v24 = (CGSize)0;
  long long v22 = 0u;
  id v5 = [(_SSSScreenshotContentOverlayController *)self screenshot];
  id v6 = [(_SSSScreenshotContentOverlayController *)self viewState];
  double v8 = [v5 modelModificationInfoForState:v6, v7];
  double v9 = v8;
  if (v8)
  {
    [v8 cropInfo];
  }
  else
  {
    long long v23 = 0u;
    CGSize v24 = (CGSize)0;
    long long v22 = 0u;
  }

  CGFloat v10 = *((double *)&v23 + 1);
  CGSize v11 = v24;
  CGFloat v13 = *((double *)&v22 + 1);
  CGFloat v12 = *(double *)&v23;
  long long v16 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v21.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v15 = *(_OWORD *)&v21.a;
  *(_OWORD *)&v21.c = v16;
  *(_OWORD *)&v21.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v14 = *(_OWORD *)&v21.tx;
  CGAffineTransformMakeScale(&t2, 1.0, -1.0);
  *(_OWORD *)&t1.a = v15;
  *(_OWORD *)&t1.c = v16;
  *(_OWORD *)&t1.tdouble x = v14;
  CGAffineTransformConcat(&v21, &t1, &t2);
  CGAffineTransformMakeTranslation(&v18, 0.0, v13);
  CGAffineTransform v17 = v21;
  CGAffineTransformConcat(&t1, &v17, &v18);
  CGAffineTransform v21 = t1;
  v25.origin.double x = v12;
  v25.origin.CGFloat y = v10;
  v25.size = v11;
  return CGRectApplyAffineTransform(v25, &t1);
}

- (double)modelBaseScaleFactorOfPageAtIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  id v5 = [(_SSSScreenshotAnnotationController *)self overlayView];
  id v6 = [v5 window];

  double v7 = 1.0;
  if ([(_SSSScreenshotContentOverlayController *)self active] && v6)
  {
    double v8 = [(_SSSScreenshotAnnotationController *)self overlayView];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    CGAffineTransform v17 = [(_SSSScreenshotAnnotationController *)self overlayView];
    [v6 convertRect:v17 fromView:v10, v12, v14, v16];
    double v19 = v18;

    [v6 bounds];
    if (v19 <= 0.0) {
      double v7 = 1.0;
    }
    else {
      double v7 = v20 / v19;
    }
  }

  return v7;
}

- (id)newContentSnapshotPDFDataIncludingAdornments:(BOOL)a3 atScale:(double)a4 inRect:(CGRect)a5 onOverlayAtPageIndex:(unint64_t)a6 forAnnotationController:(id)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v14 = a7;
  double v15 = [(_SSSScreenshotContentOverlayController *)self screenshot];
  double v16 = [v15 imageProvider];
  id v17 = [v16 requestCGImageBackedUneditedImageForUIBlocking];
  double v18 = (CGImage *)[v17 CGImage];

  double v19 = [v14 overlayViewAtIndex:a6];

  double v20 = [(_SSSScreenshotContentOverlayController *)self screenshot];
  CGAffineTransform v21 = [v20 environmentDescription];
  [v21 imageScale];
  CGFloat v23 = v22;

  CGAffineTransformMakeScale(&v64, v23, v23);
  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.CGFloat width = width;
  v65.size.CGFloat height = height;
  CGRect v66 = CGRectApplyAffineTransform(v65, &v64);
  CGFloat v24 = v66.origin.x;
  CGFloat v25 = v66.origin.y;
  CGFloat v62 = v66.origin.y;
  CGFloat v26 = v66.size.width;
  CGFloat v27 = v66.size.height;
  mediaBox.origin = CGPointZero;
  sCGFloat x = a4;
  mediaBox.size.CGFloat width = v66.size.width * a4;
  mediaBox.size.CGFloat height = v66.size.height * a4;
  size_t v28 = CGImageGetWidth(v18);
  size_t v29 = CGImageGetHeight(v18);
  v67.origin.CGFloat x = v24;
  v67.origin.CGFloat y = v25;
  v67.size.CGFloat width = v26;
  v67.size.CGFloat height = v27;
  CGRect v68 = CGRectIntegral(v67);
  CGFloat v30 = v68.origin.x;
  double v31 = v68.origin.y;
  CGFloat v32 = v68.size.width;
  CGFloat v33 = v68.size.height;
  double v34 = CGRectGetWidth(v68);
  double v60 = v30;
  v69.origin.CGFloat x = v30;
  v69.origin.CGFloat y = v31;
  CGFloat v61 = v33;
  v69.size.CGFloat width = v32;
  v69.size.CGFloat height = v33;
  double v35 = CGRectGetHeight(v69);
  v70.origin.CGFloat x = v24;
  v70.origin.CGFloat y = v62;
  v70.size.CGFloat width = v26;
  v70.size.CGFloat height = v27;
  if (CGRectIsEmpty(v70)) {
    goto LABEL_16;
  }
  double v56 = v34;
  size_t v36 = vcvtad_u64_f64(v34);
  size_t v37 = vcvtad_u64_f64(v35);
  ColorSpace = CGImageGetColorSpace(v18);
  if (!ColorSpace || (long long v39 = ColorSpace, CGColorSpaceUsesExtendedRange(ColorSpace)) || CGColorSpaceIsWideGamutRGB(v39))
  {
    long long v40 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
    long long v39 = v40;
  }
  else
  {
    long long v40 = 0;
  }
  uint32_t v41 = CGColorSpaceGetNumberOfComponents(v39) != 1;
  CGContextRef v42 = CGBitmapContextCreate(0, v36, v37, 8uLL, 0, v39, v41);
  if (v42)
  {
    objc_super v43 = v42;
    CGFloat v44 = (double)v28;
    id v45 = +[UIColor whiteColor];
    CGContextSetFillColorWithColor(v43, (CGColorRef)[v45 CGColor]);

    v71.origin.CGFloat x = v60;
    v71.origin.CGFloat y = v31;
    v71.size.CGFloat width = v32;
    v71.size.CGFloat height = v61;
    CGContextFillRect(v43, v71);
    CGContextTranslateCTM(v43, -v60, -v31);
    CGContextSetInterpolationQuality(v43, kCGInterpolationNone);
    v72.origin.CGFloat x = 0.0;
    v72.origin.CGFloat y = 0.0;
    v72.size.CGFloat width = v44;
    v72.size.CGFloat height = (double)v29;
    CGContextDrawImage(v43, v72, v18);
    Image = CGBitmapContextCreateImage(v43);
    CGContextRelease(v43);
    if (!v40) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  Image = 0;
  if (v40) {
LABEL_8:
  }
    CGColorSpaceRelease(v40);
LABEL_9:
  if (!Image)
  {
LABEL_16:
    v48 = 0;
    goto LABEL_17;
  }
  Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
  v48 = Mutable;
  if (Mutable)
  {
    v49 = CGDataConsumerCreateWithCFData(Mutable);
    if (v49)
    {
      v50 = v49;
      v51 = CGPDFContextCreate(v49, &mediaBox, 0);
      if (v51)
      {
        v52 = v51;
        CGPDFContextBeginPage(v51, 0);
        CGContextSaveGState(v52);
        CGContextScaleCTM(v52, sx, sx);
        v73.origin.CGFloat x = v24;
        v73.origin.CGFloat y = v62;
        v73.size.CGFloat width = v26;
        v73.size.CGFloat height = v27;
        double sxa = CGRectGetMinX(v73);
        v74.origin.CGFloat x = v60;
        v74.origin.CGFloat y = v31;
        v74.size.CGFloat width = v32;
        v74.size.CGFloat height = v61;
        CGFloat sxb = sxa - CGRectGetMinX(v74);
        v75.origin.CGFloat x = v24;
        v75.origin.CGFloat y = v62;
        v75.size.CGFloat width = v26;
        v75.size.CGFloat height = v27;
        double MinY = CGRectGetMinY(v75);
        v76.origin.CGFloat x = v60;
        v76.origin.CGFloat y = v31;
        v76.size.CGFloat width = v32;
        v76.size.CGFloat height = v61;
        CGFloat v54 = CGRectGetMinY(v76);
        CGContextTranslateCTM(v52, -sxb, -(MinY - v54));
        CGContextSetInterpolationQuality(v52, kCGInterpolationNone);
        v77.origin.CGFloat x = 0.0;
        v77.origin.CGFloat y = 0.0;
        v77.size.CGFloat height = (double)(unint64_t)round(v35);
        v77.size.CGFloat width = (double)(unint64_t)round(v56);
        CGContextDrawImage(v52, v77, Image);
        CGContextRestoreGState(v52);
        CGPDFContextEndPage(v52);
        CGPDFContextClose(v52);
        CGContextRelease(v52);
      }
      CGDataConsumerRelease(v50);
    }
  }
  CGImageRelease(Image);
LABEL_17:

  return v48;
}

- (id)contentSnapshot
{
  id v2 = [(_SSSScreenshotContentOverlayController *)self delegate];
  id v3 = [v2 contentSnapshot];

  return v3;
}

- (id)undoManagerForAnnotationController:(id)a3
{
  id v4 = [(_SSSScreenshotContentOverlayController *)self screenshot];
  id v5 = [v4 undoManagerForEditMode:[self viewState]];

  return v5;
}

- (id)popoverPresentingViewControllerForAnnotationController:(id)a3
{
  id v3 = [(_SSSScreenshotContentOverlayController *)self delegate];
  id v4 = [v3 viewControllerForOverlayPresentations];

  return v4;
}

- (void)controllerDidDismissPopover:(id)a3
{
  id v4 = [(_SSSScreenshotAnnotationController *)self popoverPresentingViewControllerForAnnotationController:a3];
  id v3 = [v4 view];
  [v3 setNeedsLayout];
}

- (id)layerContainingQuickBackgroundForLoupeOnOverlayAtPageIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  id v4 = [(_SSSScreenshotContentOverlayController *)self delegate];
  id v5 = [v4 viewContainingScreenshotContents];
  id v6 = [v5 layer];

  return v6;
}

- (void)installDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  id v6 = a3;
  id v7 = [(_SSSScreenshotContentOverlayController *)self delegate];
  [v7 installInterstitialGesture:v6];
}

- (void)uninstallDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  id v6 = a3;
  id v7 = [(_SSSScreenshotContentOverlayController *)self delegate];
  [v7 uninstallInterstitialGesture:v6];
}

- (void)updateDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 withPriority:(BOOL)a5 forAnnotationController:(id)a6
{
  BOOL v6 = a5;
  id v8 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v9 = [(_SSSScreenshotAnnotationController *)self gestureRecognizers];
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        [v8 requireGestureRecognizerToFail:*(void *)(*((void *)&v16 + 1) + 8 * i)];
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  id v14 = [(_SSSScreenshotContentOverlayController *)self delegate];
  double v15 = v14;
  if (v6) {
    [v14 requireAllOtherGestureRecognizersToFailBeforeGestureRecognizer:v8];
  }
  else {
    [v14 requireGestureRecognizerToFailBeforeAllOtherGestureRecognizers:v8];
  }
}

- (void)handleDrawingGestureRecognizerUpdate:(id)a3
{
  id v9 = [a3 userInfo];
  id v4 = [v9 objectForKeyedSubscript:@"drawingGestureRecognizer"];
  id v5 = [v9 objectForKeyedSubscript:@"highPriority"];
  unsigned int v6 = [v5 BOOLValue];

  id v7 = [(_SSSScreenshotContentOverlayController *)self delegate];
  id v8 = v7;
  if (v6) {
    [v7 requireAllOtherGestureRecognizersToFailBeforeGestureRecognizer:v4];
  }
  else {
    [v7 requireGestureRecognizerToFailBeforeAllOtherGestureRecognizers:v4];
  }
}

- (NSString)originalImageDescription
{
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1000B4AA0 == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", @"modifiedImageDescription", a4, a5))
    {
      id v7 = [(_SSSScreenshotContentOverlayController *)self screenshot];
      id v8 = [v7 viewModificationInfo];
      id v9 = [(_SSSScreenshotContentOverlayController *)self annotationKitController];
      id v10 = [v9 modifiedImageDescription];
      [v8 setImageDescription:v10];

      id v13 = [(_SSSScreenshotContentOverlayController *)self screenshot];
      id v11 = [(_SSSScreenshotContentOverlayController *)self viewState];
      [v13 promoteViewValueToModelValueForKey:4 forState:v11 createUndoCommand:0];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_SSSScreenshotAnnotationController;
    -[_SSSScreenshotAnnotationController observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (BOOL)didDrawPenStroke
{
  return self->_didDrawPenStroke;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);

  objc_storeStrong((id *)&self->_pageModelController, 0);
}

@end