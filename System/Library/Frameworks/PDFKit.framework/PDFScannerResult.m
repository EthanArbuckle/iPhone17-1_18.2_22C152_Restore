@interface PDFScannerResult
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)containsPoint:(CGPoint)a3 onPageLayer:(id)a4;
- (BOOL)hasActionsForResult;
- (BOOL)pointIsOnButton:(CGPoint)a3;
- (BOOL)pointIsOnButton:(CGPoint)a3 onPageLayer:(id)a4;
- (BOOL)resultIsPastDate;
- (CGRect)bounds;
- (PDFScannerResult)initWithDDScannerResult:(id)a3 foundOnPage:(id)a4;
- (__DDHighlight)highlightRef;
- (double)displayScaleOnPageLayer:(id)a3;
- (id)ddResult;
- (id)rects;
- (void)setButtonPressed:(BOOL)a3;
- (void)setHighlightRef:(__DDHighlight *)a3;
@end

@implementation PDFScannerResult

- (PDFScannerResult)initWithDDScannerResult:(id)a3 foundOnPage:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)PDFScannerResult;
  v9 = [(PDFScannerResult *)&v44 init];
  if (v9)
  {
    v10 = [v7 url];
    char v11 = PDFURLLooksSuspicious(v10);

    if ((v11 & 1) != 0
      || (uint64_t v12 = [v7 urlificationRange],
          objc_msgSend(v8, "selectionForRange:", v12, v13),
          (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v37 = 0;
      goto LABEL_14;
    }
    v15 = (void *)v14;
    v16 = objc_alloc_init(PDFScannerResultPrivate);
    v17 = v9->_private;
    v9->_private = v16;

    objc_storeStrong((id *)&v9->_private->ddResult, a3);
    objc_storeWeak((id *)&v9->_private->page, v8);
    v18 = v9->_private;
    [v15 boundsForPage:v8];
    v18->bounds.origin.x = v19;
    v18->bounds.origin.y = v20;
    v18->bounds.size.width = v21;
    v18->bounds.size.height = v22;
    v23 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v24 = v9->_private;
    rects = v24->rects;
    v24->rects = v23;

    v39 = v15;
    v26 = [v15 selectionsByLine];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v41;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v41 != v29) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * v30) boundsForPage:v8];
          v31 = v9->_private->rects;
          v32 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:");
          [(NSArray *)v31 addObject:v32];

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v28);
    }
    v33 = [v8 document];
    v34 = [v33 documentAttributes];
    v35 = [v34 objectForKey:@"CreationDate"];

    [(DDScannerResult *)v9->_private->ddResult coreResult];
    v36 = [MEMORY[0x263EFFA18] localTimeZone];
    v9->_private->resultIsPastDate = DDResultIsPastDate() != 0;

    v9->_private->hasRunActionsForResult = 0;
    v9->_private->hasActionsForResult = 0;
  }
  v37 = v9;
LABEL_14:

  return v37;
}

- (id)ddResult
{
  return self->_private->ddResult;
}

- (CGRect)bounds
{
  v2 = self->_private;
  double x = v2->bounds.origin.x;
  double y = v2->bounds.origin.y;
  double width = v2->bounds.size.width;
  double height = v2->bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)rects
{
  return self->_private->rects;
}

- (BOOL)resultIsPastDate
{
  return self->_private->resultIsPastDate;
}

- (BOOL)hasActionsForResult
{
  v2 = self->_private;
  if (!v2->hasRunActionsForResult)
  {
    v2->hasActionsForResult = 0;
    self->_private->hasRunActionsForResult = 1;
    v2 = self->_private;
  }
  return v2->hasActionsForResult;
}

- (__DDHighlight)highlightRef
{
  return self->_private->highlightRef;
}

- (void)setHighlightRef:(__DDHighlight *)a3
{
  highlightRef = self->_private->highlightRef;
  if (highlightRef != a3)
  {
    if (highlightRef) {
      CFRelease(highlightRef);
    }
    if (a3) {
      CFRetain(a3);
    }
    self->_private->highlightRef = a3;
  }
}

- (double)displayScaleOnPageLayer:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 geometryInterface];
    [v5 targetBackingScaleFactor];
    double BackingScaleFactor = v6;
    v8.n128_u64[0] = 0;
    v9.n128_u64[0] = 0;
    objc_msgSend(v5, "convertRectToRootView:fromPageLayer:", v4, PDFRectMake(v8, v9, 1.0, 1.0));
    double v11 = floor(v10 * 0.75);
    if (BackingScaleFactor < v11) {
      double BackingScaleFactor = v11;
    }
  }
  else
  {
    double BackingScaleFactor = PDFScreenGetBackingScaleFactor();
  }

  return BackingScaleFactor;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  id v7 = WeakRetained;
  if (self->_private->highlightRef) {
    BOOL v8 = WeakRetained == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    BOOL v13 = 0;
  }
  else
  {
    __n128 v9 = [WeakRetained view];
    double v10 = [v7 document];
    double v11 = objc_msgSend(v9, "pageViewForPageAtIndex:", objc_msgSend(v10, "indexForPage:", v7));
    uint64_t v12 = [v11 layer];

    BOOL v13 = -[PDFScannerResult containsPoint:onPageLayer:](self, "containsPoint:onPageLayer:", v12, x, y);
  }

  return v13;
}

- (BOOL)containsPoint:(CGPoint)a3 onPageLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  BOOL v8 = v7;
  BOOL v9 = 0;
  if (v7 && self->_private->highlightRef)
  {
    double v10 = [v7 geometryInterface];
    v11.n128_u64[0] = 0;
    v12.n128_u64[0] = 0;
    objc_msgSend(v10, "convertRectToRootView:fromPageLayer:", v8, PDFRectMake(v11, v12, 1.0, 1.0));
    double v14 = v13;

    double v15 = PDFPointScale(x, y, v14);
    double v17 = v16;
    v18 = (double *)malloc_type_malloc(32 * [(NSArray *)self->_private->rects count], 0x1000040E0EAB150uLL);
    [(NSArray *)self->_private->rects count];
    if (loadReveal_onceToken != -1) {
      dispatch_once(&loadReveal_onceToken, &__block_literal_global_10);
    }
    [(PDFScannerResult *)self displayScaleOnPageLayer:v8];
    double v20 = v19;
    if ([(NSArray *)self->_private->rects count])
    {
      unint64_t v21 = 0;
      double v22 = v17 / v20;
      v23 = v18 + 2;
      double v24 = v15 / v20;
      do
      {
        v27.origin.double x = PDFRectFromCGRect(*(v23 - 2), *(v23 - 1), *v23, v23[1]);
        v26.double x = v24;
        v26.double y = v22;
        BOOL v9 = PDFRectContainsPoint(v27, v26);
        if (v9) {
          break;
        }
        ++v21;
        v23 += 4;
      }
      while ([(NSArray *)self->_private->rects count] > v21);
      goto LABEL_11;
    }
    BOOL v9 = 0;
    if (v18) {
LABEL_11:
    }
      free(v18);
  }

  return v9;
}

- (BOOL)pointIsOnButton:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  id v7 = WeakRetained;
  if (self->_private->highlightRef) {
    BOOL v8 = WeakRetained == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    BOOL v13 = 0;
  }
  else
  {
    BOOL v9 = [WeakRetained view];
    double v10 = [v7 document];
    __n128 v11 = objc_msgSend(v9, "pageViewForPageAtIndex:", objc_msgSend(v10, "indexForPage:", v7));
    __n128 v12 = [v11 layer];

    BOOL v13 = -[PDFScannerResult pointIsOnButton:onPageLayer:](self, "pointIsOnButton:onPageLayer:", v12, x, y);
  }

  return v13;
}

- (BOOL)pointIsOnButton:(CGPoint)a3 onPageLayer:(id)a4
{
  if (a4)
  {
    if (self->_private->highlightRef)
    {
      double y = a3.y;
      double x = a3.x;
      id v7 = a4;
      BOOL v8 = [v7 geometryInterface];
      v9.n128_u64[0] = 0;
      v10.n128_u64[0] = 0;
      objc_msgSend(v8, "convertRectToRootView:fromPageLayer:", v7, PDFRectMake(v9, v10, 1.0, 1.0));
      double v12 = v11;

      [(PDFScannerResult *)self displayScaleOnPageLayer:v7];
      double v14 = v13;

      double v15 = PDFPointScale(x, y, v12 / v14);
      PDFPointToCGPoint(v15, v16);
      if (loadReveal_onceToken != -1) {
        dispatch_once(&loadReveal_onceToken, &__block_literal_global_10);
      }
    }
  }
  return 0;
}

- (void)setButtonPressed:(BOOL)a3
{
  if (self->_private->highlightRef)
  {
    if (loadReveal_onceToken != -1) {
      dispatch_once(&loadReveal_onceToken, &__block_literal_global_10);
    }
  }
}

- (void).cxx_destruct
{
}

@end