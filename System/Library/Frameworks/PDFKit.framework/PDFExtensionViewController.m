@interface PDFExtensionViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (PDFExtensionViewController)init;
- (uint64_t)updatePDFViewLayout:(double)a3 scrollViewFrame:(double)a4 safeAreaInsets:(double)a5 zoomScale:(double)a6;
- (void)_annotationHitNotification:(id)a3;
- (void)_annotationLongPressNotification:(id)a3;
- (void)_goToDestination:(id)a3;
- (void)_goToPage:(id)a3;
- (void)_pageChangedNotification:(id)a3;
- (void)_pdfViewZoomToRect:(id)a3;
- (void)_selectionChangedNotification:(id)a3;
- (void)_selectionPointsChangedNotification:(id)a3;
- (void)_setupDocumentViewSize;
- (void)_textSelectionDidCopyNotification:(id)a3;
- (void)_textSelectionShowTextSelectionMenu:(id)a3;
- (void)_updateDocumentIsLocked;
- (void)_updatePageCount;
- (void)_updateTextSelectionPoints;
- (void)_zoomToRect:(CGRect)a3;
- (void)cancelFindString;
- (void)cancelFindStringWithHighlightsCleared:(BOOL)a3;
- (void)clearSearchHighlights;
- (void)copy;
- (void)didMatchString:(id)a3;
- (void)documentDidEndDocumentFind:(id)a3;
- (void)findString:(id)a3 withOptions:(unint64_t)a4;
- (void)focusOnSearchResultAtIndex:(unint64_t)a3;
- (void)goToPageIndex:(int64_t)a3;
- (void)handleGesture:(unint64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 isIndirectTouch:(BOOL)a7;
- (void)pointerRegionForLocation:(CGPoint)a3;
- (void)selectAll;
- (void)setDocumentData:(id)a3;
- (void)setMaximumZoomScale:(double)a3;
- (void)setMinimumZoomScale:(double)a3;
- (void)setupPDFView;
- (void)snapshotViewRect:(CGRect)a3 forWidth:(double)a4 afterScreenUpdates:(BOOL)a5;
- (void)unlockWithPassword:(id)a3;
- (void)viewDidLoad;
@end

@implementation PDFExtensionViewController

- (PDFExtensionViewController)init
{
  v24.receiver = self;
  v24.super_class = (Class)PDFExtensionViewController;
  v2 = [(PDFExtensionViewController *)&v24 init];
  if (v2)
  {
    v3 = objc_alloc_init(PDFExtensionViewControllerPrivate);
    v4 = v2->_private;
    v2->_private = v3;

    v5 = v2->_private;
    searchString = v5->searchString;
    v5->searchString = 0;

    v7 = v2->_private;
    searchSelection = v7->searchSelection;
    v7->searchSelection = 0;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    v10 = v2->_private;
    searchResults = v10->searchResults;
    v10->searchResults = (NSMutableArray *)v9;

    v2->_private->didCancelActiveSearch = 0;
    v2->_private->currentGestureState = 3;
    v2->_private->hasSelection = 0;
    CGPoint v12 = (CGPoint)*MEMORY[0x263F00148];
    v2->_private->topLeftSelectionPoint = (CGPoint)*MEMORY[0x263F00148];
    v2->_private->bottomRightSelectionPoint = v12;
    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v2 selector:sel__pageChangedNotification_ name:@"PDFViewChangedPage" object:0];

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v2 selector:sel__goToPage_ name:@"PDFExtensionViewGoToPage" object:0];

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v2 selector:sel__goToDestination_ name:@"PDFExtensionViewGoToDestination" object:0];

    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v2 selector:sel__pdfViewZoomToRect_ name:@"PDFExtensionViewZoomToRect" object:0];

    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v2 selector:sel__selectionChangedNotification_ name:@"PDFViewSelectionChanged" object:0];

    v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v2 selector:sel__selectionPointsChangedNotification_ name:@"PDFTextSelectionDidChangeTextSelectionPoints" object:0];

    v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:v2 selector:sel__textSelectionShowTextSelectionMenu_ name:@"PDFTextSelectionShowTextSelectionMenu" object:0];

    v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:v2 selector:sel__textSelectionDidCopyNotification_ name:@"PDFTextSelectionDidCopy" object:0];

    v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v2 selector:sel__annotationHitNotification_ name:@"PDFViewAnnotationHit" object:0];

    v22 = [MEMORY[0x263F08A00] defaultCenter];
    [v22 addObserver:v2 selector:sel__annotationLongPressNotification_ name:@"PDFExtensionViewAnnotationLongPress" object:0];
  }
  return v2;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PDFExtensionViewController;
  [(PDFExtensionViewController *)&v16 viewDidLoad];
  v3 = [(PDFExtensionViewController *)self view];
  v4 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = [(PDFExtensionViewController *)self extensionContext];
  [v5 setExtensionViewController:self];
  v6 = [v5 _auxiliaryConnection];
  uint64_t v7 = [v6 remoteObjectProxy];
  v8 = self->_private;
  hostProxy = v8->hostProxy;
  v8->hostProxy = (PDFHostProtocol *)v7;

  v10 = [PDFView alloc];
  v11 = [(PDFExtensionViewController *)self view];
  [v11 bounds];
  uint64_t v12 = -[PDFView initWithFrame:](v10, "initWithFrame:");
  v13 = self->_private;
  pdfView = v13->pdfView;
  v13->pdfView = (PDFView *)v12;

  v15 = [(PDFExtensionViewController *)self view];
  [v15 addSubview:self->_private->pdfView];

  [(PDFView *)self->_private->pdfView setDisplayMode:1];
  [(PDFView *)self->_private->pdfView setAutoScales:0];
  [(PDFView *)self->_private->pdfView setScrollViewScrollEnabled:0];
  -[PDFView setPageBreakMargins:](self->_private->pdfView, "setPageBreakMargins:", 6.0, 4.0, 6.0, 4.0);
  -[PDFView setDocumentMargins:](self->_private->pdfView, "setDocumentMargins:", 6.0, 8.0, 6.0, 8.0);
  [(PDFView *)self->_private->pdfView setIsUsingPDFExtensionView:1];
}

- (void)setupPDFView
{
  v3 = self->_private;
  [(PDFView *)v3->pdfView pdfDocumentViewSize];
  v3->documentViewSize.width = v4;
  v3->documentViewSize.height = v5;
  v6.n128_u64[0] = 0;
  v7.n128_u64[0] = 0;
  double v8 = PDFRectMake(v6, v7, self->_private->documentViewSize.width, self->_private->documentViewSize.height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(PDFExtensionViewController *)self view];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  -[PDFView setFrame:](self->_private->pdfView, "setFrame:", v8, v10, v12, v14);
  [(PDFExtensionViewController *)self _setupDocumentViewSize];

  [(PDFExtensionViewController *)self _updatePageCount];
}

- (void)setDocumentData:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  CGFloat v5 = [[PDFDocument alloc] initWithData:v4];

  if (v5)
  {
    [(PDFDocument *)v5 setDelegate:self];
    [(PDFView *)self->_private->pdfView setDocument:v5];
    [(PDFView *)self->_private->pdfView setMinScaleFactor:1.0];
    [(PDFView *)self->_private->pdfView setMaxScaleFactor:5.0];
    __n128 v6 = [(PDFView *)self->_private->pdfView document];
    char v7 = [v6 isLocked];

    if (v7)
    {
      hostProxy = self->_private->hostProxy;
      v11[0] = @"function";
      v11[1] = @"isLocked";
      v12[0] = @"documentIsLocked";
      double v9 = [NSNumber numberWithBool:1];
      v12[1] = v9;
      double v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
      [(PDFHostProtocol *)hostProxy extensionToHost:v10];
    }
    else
    {
      [(PDFExtensionViewController *)self setupPDFView];
    }
  }
  else
  {
    [(PDFHostProtocol *)self->_private->hostProxy extensionToHost:&unk_26C52E5D8];
  }
}

- (void)findString:(id)a3 withOptions:(unint64_t)a4
{
  id v10 = a3;
  if (([v10 isEqualToString:self->_private->searchString] & 1) == 0)
  {
    char v7 = self->_private;
    searchSelection = v7->searchSelection;
    v7->searchSelection = 0;

    objc_storeStrong((id *)&self->_private->searchString, a3);
    [(PDFExtensionViewController *)self clearSearchHighlights];
  }
  double v9 = [(PDFView *)self->_private->pdfView document];
  [v9 beginFindString:self->_private->searchString withOptions:a4];
}

- (void)cancelFindString
{
  self->_private->didCancelActiveSearch = 1;
  v3 = [(PDFView *)self->_private->pdfView document];
  [v3 cancelFindString];

  self->_private->didCancelActiveSearch = 0;

  [(PDFExtensionViewController *)self clearSearchHighlights];
}

- (void)cancelFindStringWithHighlightsCleared:(BOOL)a3
{
  BOOL v3 = a3;
  self->_private->didCancelActiveSearch = 1;
  CGFloat v5 = [(PDFView *)self->_private->pdfView document];
  [v5 cancelFindString];

  self->_private->didCancelActiveSearch = 0;
  if (v3)
  {
    [(PDFExtensionViewController *)self clearSearchHighlights];
  }
}

- (void)focusOnSearchResultAtIndex:(unint64_t)a3
{
  v40[1] = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_private->searchResults count] > a3)
  {
    uint64_t v5 = [(NSMutableArray *)self->_private->searchResults objectAtIndex:a3];
    __n128 v6 = self->_private;
    searchSelection = v6->searchSelection;
    v6->searchSelection = (PDFSelection *)v5;

    double v8 = self->_private;
    pdfView = v8->pdfView;
    v40[0] = v8->searchSelection;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
    [(PDFView *)pdfView setHighlightedSelections:v10];

    double v11 = [(PDFSelection *)self->_private->searchSelection pages];
    double v12 = [v11 firstObject];

    if (v12)
    {
      [(PDFSelection *)self->_private->searchSelection boundsForPage:v12];
      -[PDFView convertRect:fromPage:](self->_private->pdfView, "convertRect:fromPage:", v12);
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      v21 = [(PDFExtensionViewController *)self view];
      objc_msgSend(v21, "convertRect:fromView:", self->_private->pdfView, v14, v16, v18, v20);
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;

      v30 = [NSNumber numberWithDouble:v23];
      v39[0] = v30;
      v31 = [NSNumber numberWithDouble:v25];
      v39[1] = v31;
      v32 = [NSNumber numberWithDouble:v27];
      v39[2] = v32;
      v33 = [NSNumber numberWithDouble:v29];
      v39[3] = v33;
      v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:4];

      hostProxy = self->_private->hostProxy;
      v37[0] = @"function";
      v37[1] = @"selectionRect";
      v38[0] = @"showSelectionRect";
      v38[1] = v34;
      v36 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
      [(PDFHostProtocol *)hostProxy extensionToHost:v36];
    }
  }
}

- (void)clearSearchHighlights
{
  BOOL v3 = self->_private;
  searchSelection = v3->searchSelection;
  v3->searchSelection = 0;

  [(NSMutableArray *)self->_private->searchResults removeAllObjects];
  pdfView = self->_private->pdfView;

  [(PDFView *)pdfView setHighlightedSelections:0];
}

- (void)goToPageIndex:(int64_t)a3
{
  uint64_t v5 = [(PDFView *)self->_private->pdfView document];
  id v7 = [v5 pageAtIndex:a3];

  __n128 v6 = v7;
  if (v7)
  {
    [(PDFView *)self->_private->pdfView goToPage:v7];
    __n128 v6 = v7;
  }
}

- (uint64_t)updatePDFViewLayout:(double)a3 scrollViewFrame:(double)a4 safeAreaInsets:(double)a5 zoomScale:(double)a6
{
  double v23 = PDFRectScale(a10, a11, a12, a13, 1.0 / a14);
  double v25 = v24;
  uint64_t v26 = a1[122];
  double v28 = v27 + v24 + *(double *)(v26 + 24);
  v30.n128_u64[0] = 0;
  v31.n128_u64[0] = 0;
  double v32 = PDFRectMake(v30, v31, v28, v29 + v23 + *(double *)(v26 + 32));
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  v39 = [a1 view];
  [v39 frame];
  v68.origin.x = v40;
  v68.origin.y = v41;
  v68.size.width = v42;
  v68.size.height = v43;
  v67.origin.x = v32;
  v67.origin.y = v34;
  v67.size.width = v36;
  v67.size.height = v38;
  BOOL v44 = PDFRectEqualToRect(v67, v68);

  if (!v44)
  {
    v45 = [a1 view];
    objc_msgSend(v45, "setFrame:", v32, v34, v36, v38);

    [*(id *)(a1[122] + 8) extensionToHost:&unk_26C52E600];
  }
  [*(id *)(a1[122] + 16) frame];
  if (vabdd_f64(v25, v46.n128_f64[0]) > 0.00000011920929
    || ([*(id *)(a1[122] + 16) frame], vabdd_f64(v23, v47.n128_f64[0]) > 0.00000011920929))
  {
    v46.n128_f64[0] = v25;
    v47.n128_f64[0] = v23;
    objc_msgSend(*(id *)(a1[122] + 16), "setFrame:", PDFRectMake(v46, v47, *(double *)(a1[122] + 24), *(double *)(a1[122] + 32)));
  }
  v48 = [a1 view];
  objc_msgSend(v48, "convertRect:toView:", *(void *)(a1[122] + 16), a2, a3, a4, a5);
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;

  v57 = *(void **)(a1[122] + 16);

  return objc_msgSend(v57, "updatePDFViewLayout:scrollViewFrame:zoomScale:", v50, v52, v54, v56, a6, a7, a8, a9);
}

- (void)setMinimumZoomScale:(double)a3
{
}

- (void)setMaximumZoomScale:(double)a3
{
}

- (void)handleGesture:(unint64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 isIndirectTouch:(BOOL)a7
{
  BOOL v7 = a7;
  double y = a6.y;
  double x = a6.x;
  double v10 = a5.y;
  double v11 = a5.x;
  self->_private->currentGestureState = a4;
  double v15 = [(PDFExtensionViewController *)self view];
  objc_msgSend(v15, "convertPoint:toView:", self->_private->pdfView, v11, v10);
  double v17 = v16;
  double v19 = v18;

  double v20 = [(PDFExtensionViewController *)self view];
  objc_msgSend(v20, "convertPoint:toView:", self->_private->pdfView, x, y);
  double v22 = v21;
  double v24 = v23;

  pdfView = self->_private->pdfView;

  -[PDFView handleGesture:state:location:locationOfFirstTouch:isIndirectTouch:](pdfView, "handleGesture:state:location:locationOfFirstTouch:isIndirectTouch:", a3, a4, v7, v17, v19, v22, v24);
}

- (void)snapshotViewRect:(CGRect)a3 forWidth:(double)a4 afterScreenUpdates:(BOOL)a5
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v31[4] = *MEMORY[0x263EF8340];
  double v10 = a3.size.height / a3.size.width * a4;
  double v11 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", a5);
  double v12 = [v11 traitCollection];
  uint64_t v13 = [v12 displayGamut];

  double v14 = [MEMORY[0x263F82B60] mainScreen];
  double v15 = [v14 traitCollection];
  [v15 displayScale];
  double v17 = v16;

  if (v17 == 0.0) {
    double v17 = 1.0;
  }
  uint64_t v18 = vcvtpd_s64_f64(v10 * v17);
  v30[0] = *MEMORY[0x263F0ECF8];
  double v19 = [NSNumber numberWithLong:vcvtpd_s64_f64(v17 * a4)];
  v31[0] = v19;
  v30[1] = *MEMORY[0x263F0ECC0];
  double v20 = [NSNumber numberWithLong:v18];
  v31[1] = v20;
  v30[2] = *MEMORY[0x263F0ECC8];
  if (v13 == 1) {
    uint64_t v21 = 1999843442;
  }
  else {
    uint64_t v21 = 1111970369;
  }
  double v22 = [NSNumber numberWithInt:v21];
  v30[3] = *MEMORY[0x263F0ECA0];
  v31[2] = v22;
  v31[3] = &unk_26C52E4A8;
  double v23 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];

  double v24 = (void *)[objc_alloc(MEMORY[0x263F0ED00]) initWithProperties:v23];
  double v25 = v24;
  if (v24)
  {
    [v24 lockWithOptions:0 seed:0];
    if (v13 == 1) {
      uint64_t v26 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00238]);
    }
    else {
      uint64_t v26 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
    }
    double v27 = (CGContext *)CGIOSurfaceContextCreate();
    CGColorSpaceRelease(v26);
    if (v27)
    {
      CGContextTranslateCTM(v27, 0.0, (double)v18);
      CGContextScaleCTM(v27, v17, -v17);
      CGContextScaleCTM(v27, a4 / width, a4 / width);
      CGContextTranslateCTM(v27, -x, -y);
      double v28 = [(PDFExtensionViewController *)self view];
      double v29 = [v28 layer];
      [v29 renderInContext:v27];

      CGContextFlush(v27);
      [v25 unlockWithOptions:0 seed:0];
      [(PDFHostProtocol *)self->_private->hostProxy extensionSnapshotToHost:v25 scale:v17];
      CGContextRelease(v27);
    }
  }
}

- (void)copy
{
}

- (void)selectAll
{
}

- (void)unlockWithPassword:(id)a3
{
  pdfView = self->_private->pdfView;
  id v5 = a3;
  __n128 v6 = [(PDFView *)pdfView document];
  [v6 unlockWithPassword:v5];

  [(PDFExtensionViewController *)self _updateDocumentIsLocked];
}

- (void)pointerRegionForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v30[3] = *MEMORY[0x263EF8340];
  __n128 v6 = [(PDFExtensionViewController *)self view];
  objc_msgSend(v6, "convertPoint:toView:", self->_private->pdfView, x, y);
  double v8 = v7;
  double v10 = v9;

  double v11 = -[PDFView pointerRegionForLocation:](self->_private->pdfView, "pointerRegionForLocation:", v8, v10);
  double v12 = [(PDFExtensionViewController *)self view];
  [v11 rect];
  objc_msgSend(v12, "convertRect:fromView:", self->_private->pdfView);
  objc_msgSend(v11, "setRect:");

  hostProxdouble y = self->_private->hostProxy;
  v30[0] = @"pointerRegionForLocation";
  v29[0] = @"function";
  v29[1] = @"regionRect";
  double v14 = NSNumber;
  [v11 rect];
  double v15 = objc_msgSend(v14, "numberWithDouble:");
  v28[0] = v15;
  double v16 = NSNumber;
  [v11 rect];
  uint64_t v18 = [v16 numberWithDouble:v17];
  v28[1] = v18;
  double v19 = NSNumber;
  [v11 rect];
  uint64_t v21 = [v19 numberWithDouble:v20];
  v28[2] = v21;
  double v22 = NSNumber;
  [v11 rect];
  double v24 = [v22 numberWithDouble:v23];
  v28[3] = v24;
  double v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
  v30[1] = v25;
  v29[2] = @"regionIdentifier";
  uint64_t v26 = [v11 identifier];
  v30[2] = v26;
  double v27 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
  [(PDFHostProtocol *)hostProxy extensionToHost:v27];
}

- (void)_setupDocumentViewSize
{
  v10[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [NSNumber numberWithDouble:self->_private->documentViewSize.width];
  v10[0] = v3;
  id v4 = [NSNumber numberWithDouble:self->_private->documentViewSize.height];
  v10[1] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  if (v5)
  {
    hostProxdouble y = self->_private->hostProxy;
    v8[0] = @"function";
    v8[1] = @"documentViewSize";
    v9[0] = @"setupDocumentViewSize";
    v9[1] = v5;
    double v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
    [(PDFHostProtocol *)hostProxy extensionToHost:v7];
  }
}

- (void)_updateDocumentIsLocked
{
  void v9[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [(PDFView *)self->_private->pdfView document];
  uint64_t v4 = [v3 isLocked];

  hostProxdouble y = self->_private->hostProxy;
  v8[0] = @"function";
  v8[1] = @"isLocked";
  v9[0] = @"updateDocumentIsLocked";
  __n128 v6 = [NSNumber numberWithBool:v4];
  v9[1] = v6;
  double v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  [(PDFHostProtocol *)hostProxy extensionToHost:v7];

  if ((v4 & 1) == 0) {
    [(PDFExtensionViewController *)self setupPDFView];
  }
}

- (void)_zoomToRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v26[4] = *MEMORY[0x263EF8340];
  double v8 = [(PDFExtensionViewController *)self view];
  objc_msgSend(v8, "convertRect:fromView:", self->_private->pdfView, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = [NSNumber numberWithDouble:v10];
  v26[0] = v17;
  uint64_t v18 = [NSNumber numberWithDouble:v12];
  v26[1] = v18;
  double v19 = [NSNumber numberWithDouble:v14];
  v26[2] = v19;
  double v20 = [NSNumber numberWithDouble:v16];
  v26[3] = v20;
  uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:4];

  if (v21)
  {
    hostProxdouble y = self->_private->hostProxy;
    v24[0] = @"function";
    v24[1] = @"visibleRect";
    v25[0] = @"zoomToRect";
    v25[1] = v21;
    double v23 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    [(PDFHostProtocol *)hostProxy extensionToHost:v23];
  }
}

- (void)_updatePageCount
{
  void v9[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [(PDFView *)self->_private->pdfView document];
  uint64_t v4 = [v3 pageCount];

  hostProxdouble y = self->_private->hostProxy;
  v8[0] = @"function";
  v8[1] = @"pageCount";
  v9[0] = @"updatePageCount";
  __n128 v6 = [NSNumber numberWithInteger:v4];
  v9[1] = v6;
  double v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  [(PDFHostProtocol *)hostProxy extensionToHost:v7];
}

- (void)_updateTextSelectionPoints
{
  void v24[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [(PDFExtensionViewController *)self view];
  objc_msgSend(v3, "convertPoint:fromView:", self->_private->pdfView, self->_private->topLeftSelectionPoint.x, self->_private->topLeftSelectionPoint.y);
  double v5 = v4;
  double v7 = v6;

  double v8 = [NSNumber numberWithDouble:v5];
  v24[0] = v8;
  double v9 = [NSNumber numberWithDouble:v7];
  v24[1] = v9;
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];

  double v11 = [(PDFExtensionViewController *)self view];
  objc_msgSend(v11, "convertPoint:fromView:", self->_private->pdfView, self->_private->bottomRightSelectionPoint.x, self->_private->bottomRightSelectionPoint.y);
  double v13 = v12;
  double v15 = v14;

  double v16 = [NSNumber numberWithDouble:v13];
  v23[0] = v16;
  double v17 = [NSNumber numberWithDouble:v15];
  v23[1] = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];

  hostProxdouble y = self->_private->hostProxy;
  v21[0] = @"function";
  v21[1] = @"topLeftSelectionPoint";
  v22[0] = @"setTextSelectionPoints";
  v22[1] = v10;
  v21[2] = @"bottomRightSelectionPoint";
  v22[2] = v18;
  double v20 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  [(PDFHostProtocol *)hostProxy extensionToHost:v20];
}

- (void)didMatchString:(id)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  if (a3)
  {
    double v4 = (void *)MEMORY[0x263F825C8];
    id v5 = a3;
    double v6 = [v4 colorWithRed:1.0 green:0.89 blue:0.22 alpha:1.0];
    [v5 setColor:v6];

    [(NSMutableArray *)self->_private->searchResults addObject:v5];
  }
  double v7 = self->_private;
  hostProxdouble y = v7->hostProxy;
  v15[0] = @"findStringUpdate";
  v14[0] = @"function";
  v14[1] = @"numFound";
  double v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](v7->searchResults, "count"));
  v15[1] = v9;
  v14[2] = @"done";
  double v10 = NSNumber;
  double v11 = [(PDFView *)self->_private->pdfView document];
  double v12 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "isFinding") ^ 1);
  v15[2] = v12;
  double v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  [(PDFHostProtocol *)hostProxy extensionToHost:v13];
}

- (void)documentDidEndDocumentFind:(id)a3
{
  v8[3] = *MEMORY[0x263EF8340];
  BOOL v3 = self->_private;
  if (!v3->didCancelActiveSearch)
  {
    hostProxdouble y = v3->hostProxy;
    v8[0] = @"findStringUpdate";
    v7[0] = @"function";
    v7[1] = @"numFound";
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](v3->searchResults, "count", a3));
    v7[2] = @"done";
    v8[1] = v5;
    void v8[2] = MEMORY[0x263EFFA88];
    double v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
    [(PDFHostProtocol *)hostProxy extensionToHost:v6];
  }
}

- (void)_pageChangedNotification:(id)a3
{
  void v11[2] = *MEMORY[0x263EF8340];
  double v4 = [(PDFView *)self->_private->pdfView document];
  id v5 = [(PDFView *)self->_private->pdfView currentPage];
  uint64_t v6 = [v4 indexForPage:v5];

  hostProxdouble y = self->_private->hostProxy;
  v10[0] = @"function";
  v10[1] = @"pageIndex";
  v11[0] = @"updateCurrentPageIndex";
  double v8 = [NSNumber numberWithInteger:v6];
  v11[1] = v8;
  double v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  [(PDFHostProtocol *)hostProxy extensionToHost:v9];
}

- (void)_goToPage:(id)a3
{
  v37[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:@"pageIndex"];
  uint64_t v7 = [v6 integerValue];

  double v8 = [v4 userInfo];

  double v9 = [v8 objectForKey:@"pageFrame"];
  [v9 PDFKitPDFRectValue];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  uint64_t v18 = [(PDFExtensionViewController *)self view];
  objc_msgSend(v18, "convertRect:fromView:", self->_private->pdfView, v11, v13, v15, v17);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = [NSNumber numberWithDouble:v20];
  v37[0] = v27;
  double v28 = [NSNumber numberWithDouble:v22];
  v37[1] = v28;
  double v29 = [NSNumber numberWithDouble:v24];
  void v37[2] = v29;
  __n128 v30 = [NSNumber numberWithDouble:v26];
  v37[3] = v30;
  __n128 v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];

  hostProxdouble y = self->_private->hostProxy;
  v36[0] = @"goToPage";
  v35[0] = @"function";
  v35[1] = @"pageIndex";
  double v33 = [NSNumber numberWithInteger:v7];
  v35[2] = @"pageFrame";
  v36[1] = v33;
  v36[2] = v31;
  double v34 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
  [(PDFHostProtocol *)hostProxy extensionToHost:v34];
}

- (void)_goToDestination:(id)a3
{
  v27[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:@"pageIndex"];
  uint64_t v7 = [v6 integerValue];

  double v8 = [v4 userInfo];

  double v9 = [v8 objectForKey:@"point"];
  [v9 PDFKitPDFPointValue];
  double v11 = v10;
  double v13 = v12;

  double v14 = [(PDFExtensionViewController *)self view];
  objc_msgSend(v14, "convertPoint:fromView:", self->_private->pdfView, v11, v13);
  double v16 = v15;
  double v18 = v17;

  double v19 = [NSNumber numberWithDouble:v16];
  v27[0] = v19;
  double v20 = [NSNumber numberWithDouble:v18];
  v27[1] = v20;
  double v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];

  hostProxdouble y = self->_private->hostProxy;
  v26[0] = @"goToDestination";
  v25[0] = @"function";
  v25[1] = @"pageIndex";
  double v23 = [NSNumber numberWithInteger:v7];
  void v25[2] = @"point";
  v26[1] = v23;
  v26[2] = v21;
  double v24 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
  [(PDFHostProtocol *)hostProxy extensionToHost:v24];
}

- (void)_pdfViewZoomToRect:(id)a3
{
  id v13 = [a3 userInfo];
  id v4 = [v13 objectForKey:@"rect"];
  [v4 PDFKitPDFRectValue];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[PDFExtensionViewController _zoomToRect:](self, "_zoomToRect:", v6, v8, v10, v12);
}

- (void)_selectionChangedNotification:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = [(PDFView *)self->_private->pdfView currentSelection];
  double v5 = v4;
  if (v4) {
    int v6 = [v4 isEmpty] ^ 1;
  }
  else {
    int v6 = 0;
  }
  double v7 = self->_private;
  if (v7->hasSelection != v6)
  {
    v7->hasSelection = v6;
    hostProxdouble y = self->_private->hostProxy;
    v11[0] = @"function";
    v11[1] = @"hasSelection";
    v12[0] = @"setHasSelection";
    double v9 = objc_msgSend(NSNumber, "numberWithBool:");
    v12[1] = v9;
    double v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    [(PDFHostProtocol *)hostProxy extensionToHost:v10];
  }
}

- (void)_selectionPointsChangedNotification:(id)a3
{
  id v4 = a3;
  double v5 = [v4 userInfo];
  id v22 = [v5 objectForKey:@"topLeftSelectionPoint"];

  int v6 = self->_private;
  double v7 = [v22 objectAtIndex:0];
  [v7 floatValue];
  double v9 = v8;
  double v10 = [v22 objectAtIndex:1];
  [v10 floatValue];
  v6->topLeftSelectionPoint.double x = PDFPointMake(v9, v11);
  v6->topLeftSelectionPoint.double y = v12;

  id v13 = [v4 userInfo];

  double v14 = [v13 objectForKey:@"bottomRightSelectionPoint"];

  double v15 = self->_private;
  double v16 = [v14 objectAtIndex:0];
  [v16 floatValue];
  double v18 = v17;
  double v19 = [v14 objectAtIndex:1];
  [v19 floatValue];
  v15->bottomRightSelectionPoint.double x = PDFPointMake(v18, v20);
  v15->bottomRightSelectionPoint.double y = v21;

  [(PDFExtensionViewController *)self _updateTextSelectionPoints];
}

- (void)_textSelectionShowTextSelectionMenu:(id)a3
{
  v37[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [v4 userInfo];
  int v6 = [v5 objectForKey:@"visible"];
  uint64_t v7 = [v6 BOOLValue];

  float v8 = [v4 userInfo];

  double v9 = [v8 objectForKey:@"selectionRect"];
  [v9 PDFKitPDFRectValue];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = [(PDFExtensionViewController *)self view];
  objc_msgSend(v18, "convertRect:fromView:", self->_private->pdfView, v11, v13, v15, v17);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = [NSNumber numberWithDouble:v20];
  v37[0] = v27;
  double v28 = [NSNumber numberWithDouble:v22];
  v37[1] = v28;
  double v29 = [NSNumber numberWithDouble:v24];
  void v37[2] = v29;
  __n128 v30 = [NSNumber numberWithDouble:v26];
  v37[3] = v30;
  __n128 v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];

  hostProxdouble y = self->_private->hostProxy;
  v36[0] = @"showTextSelectionMenu";
  v35[0] = @"function";
  v35[1] = @"visible";
  double v33 = [NSNumber numberWithBool:v7];
  v35[2] = @"selectionRect";
  v36[1] = v33;
  v36[2] = v31;
  double v34 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
  [(PDFHostProtocol *)hostProxy extensionToHost:v34];
}

- (void)_textSelectionDidCopyNotification:(id)a3
{
  void v9[2] = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  double v5 = [v4 objectForKey:@"items"];

  hostProxdouble y = self->_private->hostProxy;
  v8[0] = @"function";
  v8[1] = @"items";
  v9[0] = @"didCopy";
  v9[1] = v5;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  [(PDFHostProtocol *)hostProxy extensionToHost:v7];
}

- (void)_annotationHitNotification:(id)a3
{
  void v29[3] = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  double v5 = [v4 valueForKey:@"PDFAnnotationHit"];
  uint64_t v6 = [v4 valueForKey:@"location"];
  uint64_t v7 = (void *)v6;
  if (v5)
  {
    if (v6)
    {
      float v8 = [v5 valueForAnnotationKey:@"/Subtype"];
      int v9 = [v8 isEqualToString:@"/Link"];

      if (v9)
      {
        [v7 PDFKitPDFPointValue];
        double v11 = v10;
        double v13 = v12;
        double v14 = [(PDFExtensionViewController *)self view];
        objc_msgSend(v14, "convertPoint:fromView:", self->_private->pdfView, v11, v13);
        double v16 = v15;
        double v18 = v17;

        double v19 = [v5 action];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v20 = [v19 URL];
          double v21 = [v20 absoluteString];

          if (v21)
          {
            hostProxdouble y = self->_private->hostProxy;
            v28[0] = @"function";
            v28[1] = @"urlString";
            v29[0] = @"goToURL";
            v29[1] = v21;
            v28[2] = @"location";
            double v23 = [NSNumber numberWithDouble:v16];
            v27[0] = v23;
            double v24 = [NSNumber numberWithDouble:v18];
            v27[1] = v24;
            double v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
            v29[2] = v25;
            double v26 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
            [(PDFHostProtocol *)hostProxy extensionToHost:v26];
          }
        }
      }
    }
  }
}

- (void)_annotationLongPressNotification:(id)a3
{
  v73[4] = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  double v5 = [v4 valueForKey:@"annotation"];
  uint64_t v6 = [v4 valueForKey:@"location"];
  uint64_t v7 = (void *)v6;
  if (v5)
  {
    if (v6)
    {
      float v8 = [v5 valueForAnnotationKey:@"/Subtype"];
      int v9 = [v8 isEqualToString:@"/Link"];

      if (v9)
      {
        [v7 PDFKitPDFPointValue];
        double v11 = v10;
        double v13 = v12;
        double v14 = [(PDFExtensionViewController *)self view];
        objc_msgSend(v14, "convertPoint:fromView:", self->_private->pdfView, v11, v13);
        double v16 = v15;
        double v18 = v17;

        double v19 = [v5 action];
        [v5 bounds];
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        double v28 = [v5 page];
        -[PDFView convertRect:fromPage:](self->_private->pdfView, "convertRect:fromPage:", v28, v21, v23, v25, v27);
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        double v37 = [(PDFExtensionViewController *)self view];
        objc_msgSend(v37, "convertRect:fromView:", self->_private->pdfView, v30, v32, v34, v36);
        double v39 = v38;
        double v41 = v40;
        double v43 = v42;
        double v45 = v44;

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __n128 v46 = [v19 URL];
          uint64_t v47 = [v46 absoluteString];

          if (!v47)
          {
LABEL_11:

            goto LABEL_12;
          }
          v64 = (void *)v47;
          v65 = v28;
          hostProxdouble y = self->_private->hostProxy;
          v72[0] = @"function";
          v72[1] = @"urlString";
          v73[0] = @"didLongPressLink";
          v73[1] = v47;
          v72[2] = @"location";
          v63 = [NSNumber numberWithDouble:v16];
          v71[0] = v63;
          v62 = [NSNumber numberWithDouble:v18];
          v71[1] = v62;
          v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
          v73[2] = v61;
          v72[3] = @"annotationRect";
          v60 = [NSNumber numberWithDouble:v39];
          v70[0] = v60;
          v48 = [NSNumber numberWithDouble:v41];
          v70[1] = v48;
          double v49 = [NSNumber numberWithDouble:v43];
          v70[2] = v49;
          double v50 = [NSNumber numberWithDouble:v45];
          v70[3] = v50;
          double v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:4];
          v73[3] = v51;
          double v52 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:4];
          [(PDFHostProtocol *)hostProxy extensionToHost:v52];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_11;
          }
          double v53 = [v19 destination];
          uint64_t v54 = [v53 page];

          if (!v54) {
            goto LABEL_11;
          }
          v65 = v28;
          double v55 = [(PDFView *)self->_private->pdfView document];
          v64 = (void *)v54;
          uint64_t v56 = [v55 indexForPage:v54];

          v59 = self->_private->hostProxy;
          v69[0] = @"didLongPressLink";
          v68[0] = @"function";
          v68[1] = @"pageIndex";
          v63 = [NSNumber numberWithInteger:v56];
          v69[1] = v63;
          v68[2] = @"location";
          v62 = [NSNumber numberWithDouble:v16];
          v67[0] = v62;
          v61 = [NSNumber numberWithDouble:v18];
          v67[1] = v61;
          v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:2];
          v69[2] = v60;
          v68[3] = @"annotationRect";
          v48 = [NSNumber numberWithDouble:v39];
          v66[0] = v48;
          double v49 = [NSNumber numberWithDouble:v41];
          v66[1] = v49;
          double v50 = [NSNumber numberWithDouble:v43];
          v66[2] = v50;
          double v51 = [NSNumber numberWithDouble:v45];
          v66[3] = v51;
          double v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:4];
          v69[3] = v52;
          v57 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:4];
          [(PDFHostProtocol *)v59 extensionToHost:v57];
        }
        double v28 = v65;
        goto LABEL_11;
      }
    }
  }
LABEL_12:
}

+ (id)_remoteViewControllerInterface
{
  return +[XPCExtensionInterface extensionInterface];
}

+ (id)_exportedInterface
{
  return +[XPCExtensionInterface hostInterface];
}

- (void).cxx_destruct
{
}

@end