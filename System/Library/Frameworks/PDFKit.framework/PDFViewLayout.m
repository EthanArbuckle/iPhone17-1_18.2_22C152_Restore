@interface PDFViewLayout
- (CGPoint)convertPoint:(CGPoint)a3 fromPage:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 fromPage:(id)a4 forScaleFactor:(double)a5;
- (CGPoint)convertPoint:(CGPoint)a3 toPage:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toPage:(id)a4 forScaleFactor:(double)a5;
- (CGRect)boundsForPage:(id)a3;
- (CGRect)convertRect:(CGRect)a3 fromPage:(id)a4 forScaleFactor:(double)a5;
- (CGRect)normalizedPageBounds:(id)a3;
- (CGSize)contentSizeWithCurrentPage:(id)a3;
- (PDFDocument)document;
- (PDFViewLayout)init;
- (_NSRange)visiblePageRangeInBounds:(CGRect)a3 currentPage:(id)a4;
- (id)delegate;
- (id)facingPageForPage:(id)a3;
- (id)pageNearestPoint:(CGPoint)a3 currentPage:(id)a4;
- (id)visiblePagesInBounds:(CGRect)a3 currentPage:(id)a4;
- (int64_t)functionalDisplayMode;
- (void)dealloc;
- (void)generateInternalDocumentGeometry;
- (void)invalidateInternalDocumentGeometry;
- (void)setDelegate:(id)a3;
- (void)setDocument:(id)a3;
@end

@implementation PDFViewLayout

- (PDFViewLayout)init
{
  v10.receiver = self;
  v10.super_class = (Class)PDFViewLayout;
  v2 = [(PDFViewLayout *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(PDFViewLayoutPrivate);
    v4 = v2->_private;
    v2->_private = v3;

    objc_storeWeak(&v2->_private->delegate, 0);
    v2->_private->delegateKnowsMargins = 0;
    v2->_private->delegateKnowsDisplayMode = 0;
    v2->_private->delegateKnowsDisplayAsBook = 0;
    v2->_private->delegateKnowsDisplayBox = 0;
    v2->_private->delegateKnowsDisplayRTL = 0;
    v2->_private->delegateKnowsDisplaysDirection = 0;
    v2->_private->delegateKnowsDocumentMargins = 0;
    v2->_private->delegateKnowsIsUsingPageViewController = 0;
    objc_storeWeak((id *)&v2->_private->document, 0);
    v2->_private->pageCount = 0;
    v5 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    v6 = v2->_private;
    pageLayoutLock = v6->pageLayoutLock;
    v6->pageLayoutLock = v5;

    v2->_private->pageLayoutBounds = 0;
    CGSize v8 = (CGSize)*MEMORY[0x263F001B0];
    v2->_private->singlePageContinuousSize = (CGSize)*MEMORY[0x263F001B0];
    v2->_private->twoUpContinousSize = v8;
    v2->_private->cachedContinuousSizeDisplayDirection = 0;
  }
  return v2;
}

- (void)dealloc
{
  free(self->_private->pageLayoutBounds);
  v3.receiver = self;
  v3.super_class = (Class)PDFViewLayout;
  [(PDFViewLayout *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_private->delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak(&self->_private->delegate, obj);
    self->_private->delegateKnowsMargins = objc_opt_respondsToSelector() & 1;
    self->_private->delegateKnowsDisplayMode = objc_opt_respondsToSelector() & 1;
    self->_private->delegateKnowsDisplayAsBook = objc_opt_respondsToSelector() & 1;
    self->_private->delegateKnowsDisplayBox = objc_opt_respondsToSelector() & 1;
    self->_private->delegateKnowsDisplayRTL = objc_opt_respondsToSelector() & 1;
    self->_private->delegateKnowsDisplaysDirection = objc_opt_respondsToSelector() & 1;
    self->_private->delegateKnowsDocumentMargins = objc_opt_respondsToSelector() & 1;
    self->_private->delegateKnowsIsUsingPageViewController = objc_opt_respondsToSelector() & 1;
    [(PDFViewLayout *)self invalidateInternalDocumentGeometry];
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_private->delegate);

  return WeakRetained;
}

- (void)setDocument:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_private->document, obj);
    self->_private->pageCount = [obj pageCount];
    [(PDFViewLayout *)self invalidateInternalDocumentGeometry];
  }
}

- (PDFDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);

  return (PDFDocument *)WeakRetained;
}

- (CGSize)contentSizeWithCurrentPage:(id)a3
{
  id v4 = a3;
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  CGSize v8 = WeakRetained;
  if (v4 && WeakRetained)
  {
    id v9 = objc_loadWeakRetained(&self->_private->delegate);
    objc_super v10 = v9;
    double v11 = *MEMORY[0x263F834E8];
    double v12 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v13 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v14 = *(double *)(MEMORY[0x263F834E8] + 24);
    v15 = self->_private;
    if (v15->delegateKnowsMargins)
    {
      [v9 pageBreakMargins];
      uint64_t v80 = v16;
      uint64_t v82 = v17;
      double v19 = v18;
      double v21 = v20;
      v15 = self->_private;
    }
    else
    {
      double v21 = *(double *)(MEMORY[0x263F834E8] + 24);
      uint64_t v80 = *MEMORY[0x263F834E8];
      uint64_t v82 = *(void *)(MEMORY[0x263F834E8] + 16);
      double v19 = *(double *)(MEMORY[0x263F834E8] + 8);
    }
    if (v15->delegateKnowsDocumentMargins)
    {
      [v10 documentMargins];
      double v11 = v22;
      double v12 = v23;
      double v13 = v24;
      double v14 = v25;
      v15 = self->_private;
    }
    if (v15->delegateKnowsDisplaysDirection)
    {
      int64_t v26 = [v10 displayDirection];
      v15 = self->_private;
    }
    else
    {
      int64_t v26 = 0;
    }
    [(NSLock *)v15->pageLayoutLock lock];
    v27 = self->_private;
    if (!v27->pageLayoutBounds || (unint64_t pageCount = v27->pageCount, pageCount != [v8 pageCount])) {
      [(PDFViewLayout *)self generateInternalDocumentGeometry];
    }
    v29 = [v4 document];
    uint64_t v30 = [v29 indexForPage:v4];

    v31 = self->_private;
    if (v30 != 0x7FFFFFFFFFFFFFFFLL && v31->pageCount)
    {
      int64_t v32 = [(PDFViewLayout *)self functionalDisplayMode];
      double v33 = v21 + v19;
      double v34 = v21;
      double v35 = v33 + v14 + v12;
      double v36 = v83 + v81 + v13 + v11;
      switch(v32)
      {
        case 0:
          v37 = &self->_private->pageLayoutBounds[v30];
          double x = v37->origin.x;
          double y = v37->origin.y;
          double width = v37->size.width;
          double height = v37->size.height;
          double v5 = v35 + PDFRectGetMaxX(v37->origin.x, y, width);
          double v6 = v36 + PDFRectGetMaxY(x, y, width, height);
          break;
        case 1:
          v57 = self->_private;
          double v5 = v57->singlePageContinuousSize.width;
          if (v5 <= 0.0 || v57->cachedContinuousSizeDisplayDirection != v26)
          {
            double v63 = PDFRectToCGRect(v32);
            double v66 = v65;
            double v68 = v67;
            if (self->_private->pageCount >= 2)
            {
              CGFloat v69 = v63;
              CGFloat v70 = v64;
              uint64_t v71 = 0;
              unint64_t v72 = 1;
              do
              {
                v87.origin.double x = PDFRectToCGRect(v62);
                v87.origin.double y = v73;
                v87.size.double width = v74;
                v87.size.double height = v75;
                v85.origin.double x = v69;
                v85.origin.double y = v70;
                v85.size.double width = v66;
                v85.size.double height = v68;
                CGRect v86 = CGRectUnion(v85, v87);
                CGFloat v69 = v86.origin.x;
                CGFloat v70 = v86.origin.y;
                double v66 = v86.size.width;
                double v68 = v86.size.height;
                ++v72;
                v71 += 32;
              }
              while (self->_private->pageCount > v72);
            }
            double v5 = PDFSizeFromCGSize(v35 + v66, v36 + v68);
            double v6 = v76;
            v77 = self->_private;
            v77->singlePageContinuousSize.double width = v5;
            v77->singlePageContinuousSize.double height = v76;
            goto LABEL_35;
          }
          double v6 = v57->singlePageContinuousSize.height;
          break;
        case 2:
          v42 = &self->_private->pageLayoutBounds[v30];
          double v43 = v42->origin.x;
          double v44 = v42->origin.y;
          double v45 = v42->size.width;
          double v46 = v42->size.height;
          double v5 = v35 + PDFRectGetMaxX(v42->origin.x, v44, v45);
          double v6 = v36 + PDFRectGetMaxY(v43, v44, v45, v46);
          v47 = [(PDFViewLayout *)self facingPageForPage:v4];
          v48 = v47;
          if (v47)
          {
            v49 = [v47 document];
            uint64_t v50 = [v49 indexForPage:v48];

            v51 = &self->_private->pageLayoutBounds[v50];
            double v52 = v51->origin.x;
            double v53 = v51->origin.y;
            double v54 = v51->size.width;
            double v55 = v51->size.height;
            double v5 = fmax(v5, v35 + PDFRectGetMaxX(v51->origin.x, v53, v54));
            double v6 = fmax(v6, v36 + PDFRectGetMaxY(v52, v53, v54, v55));
          }

          break;
        case 3:
          v56 = self->_private;
          double v5 = v56->twoUpContinousSize.width;
          if (v5 > 0.0 && v56->cachedContinuousSizeDisplayDirection == v26)
          {
            double v6 = v56->twoUpContinousSize.height;
          }
          else
          {
            double v58 = v36
                + PDFRectGetMaxY(v56->pageLayoutBounds->origin.x, v56->pageLayoutBounds->origin.y, v56->pageLayoutBounds->size.width, v56->pageLayoutBounds->size.height);
            double v6 = fmax(v58, v36+ PDFRectGetMaxY(self->_private->pageLayoutBounds[1].origin.x, self->_private->pageLayoutBounds[1].origin.y, self->_private->pageLayoutBounds[1].size.width, self->_private->pageLayoutBounds[1].size.height));
            double v5 = v34
               + PDFRectGetMaxX(self->_private->pageLayoutBounds->origin.x, self->_private->pageLayoutBounds->origin.y, self->_private->pageLayoutBounds->size.width);
            v59 = self->_private;
            if (v59->pageCount >= 2)
            {
              uint64_t v60 = 0;
              unint64_t v61 = 1;
              do
              {
                double v5 = fmax(v5, v34+ PDFRectGetMaxX(v59->pageLayoutBounds[v60 + 1].origin.x, v59->pageLayoutBounds[v60 + 1].origin.y, v59->pageLayoutBounds[v60 + 1].size.width));
                ++v61;
                v59 = self->_private;
                ++v60;
              }
              while (v59->pageCount > v61);
            }
            v59->twoUpContinousSize.double width = v5;
            v59->twoUpContinousSize.double height = v6;
LABEL_35:
            self->_private->cachedContinuousSizeDisplayDirection = v26;
          }
          break;
        default:
          break;
      }
      double v5 = ceil(v5);
      double v6 = ceil(v6);
      v31 = self->_private;
    }
    [(NSLock *)v31->pageLayoutLock unlock];
  }
  double v78 = v5;
  double v79 = v6;
  result.double height = v79;
  result.double width = v78;
  return result;
}

- (_NSRange)visiblePageRangeInBounds:(CGRect)a3 currentPage:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  NSUInteger v11 = 0;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9 && self->_private->pageCount)
  {
    switch([(PDFViewLayout *)self functionalDisplayMode])
    {
      case 0:
        unint64_t v13 = [WeakRetained indexForPage:v9];
        unint64_t v14 = v13;
        goto LABEL_16;
      case 1:
        double MaxY = PDFRectGetMaxY(x, y, width, height);
        uint64_t v16 = [(PDFViewLayout *)self pageNearestPoint:v9 currentPage:PDFPointMake(0.0, MaxY)];
        unint64_t v14 = [WeakRetained indexForPage:v16];

        double MinY = PDFRectGetMinY(x, y, width, height);
        double v18 = [(PDFViewLayout *)self pageNearestPoint:v9 currentPage:PDFPointMake(0.0, MinY)];
        goto LABEL_8;
      case 2:
        unint64_t v14 = [WeakRetained indexForPage:v9];
        double v18 = [(PDFViewLayout *)self facingPageForPage:v9];
        unint64_t v13 = v14;
        if (v18) {
LABEL_8:
        }
          unint64_t v13 = [WeakRetained indexForPage:v18];
        goto LABEL_15;
      case 3:
        double v19 = PDFRectGetMaxY(x, y, width, height);
        double v20 = [(PDFViewLayout *)self pageNearestPoint:v9 currentPage:PDFPointMake(0.0, v19)];
        unint64_t v14 = [WeakRetained indexForPage:v20];
        double v21 = [(PDFViewLayout *)self facingPageForPage:v20];

        if (v21)
        {
          unint64_t v22 = [WeakRetained indexForPage:v9];
          if (v22 < v14) {
            unint64_t v14 = v22;
          }
        }
        double v23 = PDFRectGetMinY(x, y, width, height);
        double v24 = [(PDFViewLayout *)self pageNearestPoint:v9 currentPage:PDFPointMake(0.0, v23)];

        unint64_t v13 = [WeakRetained indexForPage:v24];
        double v18 = [(PDFViewLayout *)self facingPageForPage:v24];

        if (v18)
        {
          unint64_t v25 = [WeakRetained indexForPage:v18];
          if (v25 > v13) {
            unint64_t v13 = v25;
          }
        }
LABEL_15:

LABEL_16:
        if (v13 <= v14) {
          unint64_t v26 = v14;
        }
        else {
          unint64_t v26 = v13;
        }
        if (v13 >= v14) {
          uint64_t v27 = v14;
        }
        else {
          uint64_t v27 = v13;
        }
        unint64_t v28 = v26 - v27;
        if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
          NSUInteger v29 = 0;
        }
        else {
          NSUInteger v29 = v28 + 1;
        }
        if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
        }
        BOOL v30 = v14 == 0x7FFFFFFFFFFFFFFFLL;
        if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
          NSUInteger v11 = 0;
        }
        else {
          NSUInteger v11 = v29;
        }
        if (v30) {
          uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v12 = v27;
        }
        break;
      default:
        NSUInteger v11 = 0;
        break;
    }
  }

  NSUInteger v31 = v12;
  NSUInteger v32 = v11;
  result.length = v32;
  result.location = v31;
  return result;
}

- (id)visiblePagesInBounds:(CGRect)a3 currentPage:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v11 = -[PDFViewLayout visiblePageRangeInBounds:currentPage:](self, "visiblePageRangeInBounds:currentPage:", v9, x, y, width, height);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v13 = v11;
    uint64_t v14 = v12;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
    if (v13 < v13 + v14)
    {
      do
      {
        uint64_t v16 = [WeakRetained pageAtIndex:v13];
        if (v16) {
          [v10 addObject:v16];
        }

        ++v13;
        --v14;
      }
      while (v14);
    }
  }

  return v10;
}

- (CGRect)boundsForPage:(id)a3
{
  id v4 = a3;
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  if (WeakRetained)
  {
    unint64_t pageCount = self->_private->pageCount;

    if (pageCount)
    {
      [(NSLock *)self->_private->pageLayoutLock lock];
      if (!self->_private->pageLayoutBounds) {
        [(PDFViewLayout *)self generateInternalDocumentGeometry];
      }
      uint64_t v11 = [v4 document];
      uint64_t v12 = [v11 indexForPage:v4];

      unint64_t v13 = self->_private;
      if (v4 && v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        p_double x = &v13->pageLayoutBounds[v12].origin.x;
        double v5 = *p_x;
        double v6 = p_x[1];
        double v7 = p_x[2];
        double v8 = p_x[3];
      }
      [(NSLock *)v13->pageLayoutLock unlock];
    }
  }

  double v15 = v5;
  double v16 = v6;
  double v17 = v7;
  double v18 = v8;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (id)pageNearestPoint:(CGPoint)a3 currentPage:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (!v7)
  {
    id v20 = 0;
    goto LABEL_58;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  id v9 = objc_loadWeakRetained(&self->_private->delegate);
  id v10 = v9;
  double v12 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v11 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v13 = *(double *)(MEMORY[0x263F834E8] + 24);
  uint64_t v14 = self->_private;
  if (v14->delegateKnowsMargins)
  {
    [v9 pageBreakMargins];
    double v16 = v15;
    double v18 = v17;
    double v69 = v19;
    uint64_t v14 = self->_private;
  }
  else
  {
    double v69 = *(double *)(MEMORY[0x263F834E8] + 24);
    double v18 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v16 = *(double *)(MEMORY[0x263F834E8] + 8);
  }
  if (v14->delegateKnowsDocumentMargins)
  {
    [v10 documentMargins];
    double v12 = v21;
    double v11 = v22;
    double v13 = v23;
    uint64_t v14 = self->_private;
  }
  if (v14->delegateKnowsDisplaysDirection)
  {
    uint64_t v24 = [v10 displayDirection];
    uint64_t v14 = self->_private;
  }
  else
  {
    uint64_t v24 = 0;
  }
  [(NSLock *)v14->pageLayoutLock lock];
  unint64_t v25 = self->_private;
  if (!v25->pageLayoutBounds)
  {
    [(PDFViewLayout *)self generateInternalDocumentGeometry];
    unint64_t v25 = self->_private;
  }
  if (!v25->pageCount) {
    goto LABEL_27;
  }
  int64_t v26 = [(PDFViewLayout *)self functionalDisplayMode];
  if (!v26)
  {
    id v20 = v7;
    goto LABEL_57;
  }
  int64_t v27 = v26;
  if (v26 != 1)
  {
    id v20 = 0;
    goto LABEL_30;
  }
  unint64_t v28 = self->_private;
  if (!v28->pageCount)
  {
LABEL_27:
    id v20 = 0;
    goto LABEL_57;
  }
  uint64_t v29 = 0;
  unint64_t v30 = 0;
  NSUInteger v31 = 0;
  double v32 = v16 + v12;
  do
  {
    double v33 = &v28->pageLayoutBounds[v29];
    double v34 = v33->origin.x;
    double v35 = v33->origin.y;
    double width = v33->size.width;
    if (v24) {
      double v37 = PDFRectGetMaxX(v34, v35, width) - v32;
    }
    else {
      double v37 = PDFRectGetMinY(v34, v35, width, v33->size.height) - (v18 + v11);
    }
    id v20 = [WeakRetained pageAtIndex:v30];

    if (v24)
    {
      if (v37 > x) {
        break;
      }
    }
    else if (v37 < y)
    {
      break;
    }
    ++v30;
    unint64_t v28 = self->_private;
    ++v29;
    NSUInteger v31 = v20;
  }
  while (v28->pageCount > v30);
LABEL_30:
  if (v27 == 2)
  {
    id v44 = v7;

    double v45 = [(PDFViewLayout *)self facingPageForPage:v44];
    if (v45)
    {
      uint64_t v46 = [WeakRetained indexForPage:v44];
      uint64_t v47 = [WeakRetained indexForPage:v45];
      v48 = &self->_private->pageLayoutBounds[v46];
      double MaxX = PDFRectGetMaxX(v48->origin.x, v48->origin.y, v48->size.width);
      uint64_t v50 = &self->_private->pageLayoutBounds[v47];
      double v51 = PDFRectGetMaxX(v50->origin.x, v50->origin.y, v50->size.width);
      if (MaxX >= v51) {
        uint64_t v52 = v47;
      }
      else {
        uint64_t v52 = v46;
      }
      if (MaxX >= v51) {
        id v54 = v45;
      }
      else {
        id v54 = v44;
      }
      if (MaxX >= v51) {
        id v55 = v44;
      }
      else {
        id v55 = v45;
      }
      double v53 = &self->_private->pageLayoutBounds[v52];
      if (x >= v69 + v13 + PDFRectGetMaxX(v53->origin.x, v53->origin.y, v53->size.width)) {
        v56 = v55;
      }
      else {
        v56 = v54;
      }
      id v57 = v56;

      id v44 = v57;
    }

    id v20 = v44;
    goto LABEL_57;
  }
  if (v27 == 3)
  {
    v38 = self->_private;
    if (v38->pageCount)
    {
      uint64_t v39 = 0;
      unint64_t v40 = 0;
      double v41 = v18 + v11;
      while (1)
      {
        v42 = v20;
        double v43 = PDFRectGetMinY(v38->pageLayoutBounds[v39].origin.x, v38->pageLayoutBounds[v39].origin.y, v38->pageLayoutBounds[v39].size.width, v38->pageLayoutBounds[v39].size.height)- v41;
        id v20 = [WeakRetained pageAtIndex:v40];

        if (v43 < y) {
          break;
        }
        ++v40;
        v38 = self->_private;
        ++v39;
        if (v38->pageCount <= v40) {
          goto LABEL_57;
        }
      }
      double v58 = [(PDFViewLayout *)self facingPageForPage:v20];
      if (!v58) {
        goto LABEL_56;
      }
      uint64_t v59 = [WeakRetained indexForPage:v20];
      uint64_t v60 = [WeakRetained indexForPage:v58];
      unint64_t v61 = &self->_private->pageLayoutBounds[v59];
      double v62 = PDFRectGetMaxX(v61->origin.x, v61->origin.y, v61->size.width);
      double v63 = &self->_private->pageLayoutBounds[v60];
      double v64 = PDFRectGetMaxX(v63->origin.x, v63->origin.y, v63->size.width);
      pageLayoutBounds = self->_private->pageLayoutBounds;
      double v66 = v69 + v13;
      if (v62 >= v64)
      {
        if (x >= v66
                + PDFRectGetMaxX(pageLayoutBounds[v60].origin.x, pageLayoutBounds[v60].origin.y, pageLayoutBounds[v60].size.width))goto LABEL_56;
      }
      else if (x < v66 {
                  + PDFRectGetMaxX(pageLayoutBounds[v59].origin.x, pageLayoutBounds[v59].origin.y, pageLayoutBounds[v59].size.width))
      }
      {
LABEL_56:

        goto LABEL_57;
      }
      id v67 = v58;

      id v20 = v67;
      goto LABEL_56;
    }
  }
LABEL_57:
  [(NSLock *)self->_private->pageLayoutLock unlock];

LABEL_58:

  return v20;
}

- (CGPoint)convertPoint:(CGPoint)a3 toPage:(id)a4 forScaleFactor:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  if (v9)
  {
    [(NSLock *)self->_private->pageLayoutLock lock];
    id v10 = self->_private;
    if (!v10->pageLayoutBounds)
    {
      [(PDFViewLayout *)self generateInternalDocumentGeometry];
      id v10 = self->_private;
    }
    if (!v10->pageCount) {
      goto LABEL_21;
    }
    double v11 = [v9 document];
    uint64_t v12 = [v11 indexForPage:v9];

    double v13 = self->_private;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      p_double x = (double *)MEMORY[0x263F00148];
    }
    else {
      p_double x = &v13->pageLayoutBounds[v12].origin.x;
    }
    double v15 = *p_x;
    double v16 = p_x[1];
    double v17 = x / a5;
    double v18 = y / a5;
    if (v13->delegateKnowsDisplayBox)
    {
      id WeakRetained = objc_loadWeakRetained(&v13->delegate);
      objc_msgSend(v9, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox"));
      double v54 = v21;
      double v55 = v20;
      uint64_t v51 = v23;
      double v53 = v22;
    }
    else
    {
      [v9 boundsForBox:1];
      double v54 = v25;
      double v55 = v24;
      uint64_t v51 = v27;
      double v53 = v26;
    }
    double x = v17 - v15;
    double y = v18 - v16;
    int v28 = objc_msgSend(v9, "rotation", v51);
    CGFloat v30 = *MEMORY[0x263F000D0];
    CGFloat v29 = *(double *)(MEMORY[0x263F000D0] + 8);
    CGFloat v32 = *(double *)(MEMORY[0x263F000D0] + 16);
    CGFloat v31 = *(double *)(MEMORY[0x263F000D0] + 24);
    CGFloat v34 = *(double *)(MEMORY[0x263F000D0] + 32);
    CGFloat v33 = *(double *)(MEMORY[0x263F000D0] + 40);
    if (v28 > 179)
    {
      if (v28 == 180)
      {
        double v39 = PDFDegToRad(180.0);
        v56.double a = v30;
        v56.double b = v29;
        v56.double c = v32;
        v56.double d = v31;
        v56.tdouble x = v34;
        v56.tdouble y = v33;
        CGAffineTransformRotate(&v57, &v56, v39);
        double v37 = -v53 - v55;
        double v36 = -v52 - v54;
        CGAffineTransform v56 = v57;
        goto LABEL_20;
      }
      if (v28 == 270)
      {
        double v38 = PDFDegToRad(270.0);
        v56.double a = v30;
        v56.double b = v29;
        v56.double c = v32;
        v56.double d = v31;
        v56.tdouble x = v34;
        v56.tdouble y = v33;
        CGAffineTransformRotate(&v57, &v56, v38);
        double v37 = -v52 - v54;
        CGAffineTransform v56 = v57;
        double v36 = v55;
        goto LABEL_20;
      }
    }
    else
    {
      if (!v28)
      {
        v56.double a = *(CGFloat *)MEMORY[0x263F000D0];
        v56.double b = v29;
        v56.double c = v32;
        v56.double d = v31;
        v56.tdouble x = v34;
        v56.tdouble y = v33;
        double v36 = v54;
        double v37 = v55;
        goto LABEL_20;
      }
      if (v28 == 90)
      {
        double v35 = PDFDegToRad(90.0);
        v56.double a = v30;
        v56.double b = v29;
        v56.double c = v32;
        v56.double d = v31;
        v56.tdouble x = v34;
        v56.tdouble y = v33;
        CGAffineTransformRotate(&v57, &v56, v35);
        double v36 = -v53 - v55;
        CGAffineTransform v56 = v57;
        double v37 = v54;
LABEL_20:
        CGAffineTransformTranslate(&v57, &v56, v37, v36);
        double a = v57.a;
        double b = v57.b;
        double c = v57.c;
        double d = v57.d;
        tdouble x = v57.tx;
        tdouble y = v57.ty;
        double v46 = PDFPointToCGPoint(x, y);
        double x = PDFPointFromCGPoint(tx + c * v47 + a * v46, ty + d * v47 + b * v46);
        double y = v48;
      }
    }
LABEL_21:
    [(NSLock *)self->_private->pageLayoutLock unlock];
  }

  double v49 = x;
  double v50 = y;
  result.double y = v50;
  result.double x = v49;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toPage:(id)a4
{
  -[PDFViewLayout convertPoint:toPage:forScaleFactor:](self, "convertPoint:toPage:forScaleFactor:", a4, a3.x, a3.y, 1.0);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromPage:(id)a4 forScaleFactor:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  if (v9)
  {
    [(NSLock *)self->_private->pageLayoutLock lock];
    id v10 = self->_private;
    if (!v10->pageLayoutBounds)
    {
      [(PDFViewLayout *)self generateInternalDocumentGeometry];
      id v10 = self->_private;
    }
    if (!v10->pageCount) {
      goto LABEL_23;
    }
    if (v10->delegateKnowsDisplayBox)
    {
      id WeakRetained = objc_loadWeakRetained(&v10->delegate);
      objc_msgSend(v9, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox"));
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
    }
    else
    {
      [v9 boundsForBox:1];
      double v13 = v20;
      double v15 = v21;
      double v17 = v22;
      double v19 = v23;
    }
    int v24 = [v9 rotation];
    CGFloat v25 = *(double *)(MEMORY[0x263F000D0] + 8);
    CGFloat v27 = *(double *)(MEMORY[0x263F000D0] + 16);
    CGFloat v26 = *(double *)(MEMORY[0x263F000D0] + 24);
    CGFloat v29 = *(double *)(MEMORY[0x263F000D0] + 32);
    CGFloat v28 = *(double *)(MEMORY[0x263F000D0] + 40);
    if (v24 > 179)
    {
      if (v24 == 180)
      {
        v63.double a = *(CGFloat *)MEMORY[0x263F000D0];
        v63.double b = v25;
        v63.double c = v27;
        v63.double d = v26;
        v63.tdouble x = v29;
        v63.tdouble y = v28;
        CGAffineTransformTranslate(&v64, &v63, v17 + v13, v19 + v15);
        long long v60 = *(_OWORD *)&v64.a;
        long long v59 = *(_OWORD *)&v64.c;
        double v61 = a5;
        tdouble x = v64.tx;
        tdouble y = v64.ty;
        double v32 = 180.0;
      }
      else
      {
        if (v24 != 270) {
          goto LABEL_19;
        }
        v63.double a = *(CGFloat *)MEMORY[0x263F000D0];
        v63.double b = v25;
        v63.double c = v27;
        v63.double d = v26;
        v63.tdouble x = v29;
        v63.tdouble y = v28;
        CGAffineTransformTranslate(&v64, &v63, v19 + v15, -v13);
        long long v60 = *(_OWORD *)&v64.a;
        long long v59 = *(_OWORD *)&v64.c;
        double v61 = a5;
        tdouble x = v64.tx;
        tdouble y = v64.ty;
        double v32 = 90.0;
      }
    }
    else
    {
      if (!v24)
      {
        v63.double a = *(CGFloat *)MEMORY[0x263F000D0];
        v63.double b = v25;
        v63.double c = v27;
        v63.double d = v26;
        v63.tdouble x = v29;
        v63.tdouble y = v28;
        CGAffineTransformTranslate(&v64, &v63, -v13, -v15);
        double a = v64.a;
        double b = v64.b;
        double c = v64.c;
        double d = v64.d;
        double v36 = a5;
        double v38 = v64.tx;
        double v37 = v64.ty;
        double v39 = PDFPointToCGPoint(x, y);
        double v41 = v38 + c * v40 + a * v39;
        double v42 = v37 + d * v40 + b * v39;
        a5 = v36;
LABEL_18:
        double x = PDFPointFromCGPoint(v41, v42);
        double y = v53;
LABEL_19:
        double v54 = objc_msgSend(v9, "document", v59, v60);
        unint64_t v55 = [v54 indexForPage:v9];

        id v10 = self->_private;
        if (v55 != 0x7FFFFFFFFFFFFFFFLL && v55 < v10->pageCount)
        {
          p_double x = &v10->pageLayoutBounds[v55].origin.x;
          double x = x + *p_x;
          double y = y + p_x[1];
        }
        double x = x * a5;
        double y = y * a5;
LABEL_23:
        [(NSLock *)v10->pageLayoutLock unlock];
        goto LABEL_24;
      }
      if (v24 != 90) {
        goto LABEL_19;
      }
      v63.double a = *(CGFloat *)MEMORY[0x263F000D0];
      v63.double b = v25;
      v63.double c = v27;
      v63.double d = v26;
      v63.tdouble x = v29;
      v63.tdouble y = v28;
      CGAffineTransformTranslate(&v64, &v63, -v15, v17 + v13);
      long long v60 = *(_OWORD *)&v64.a;
      long long v59 = *(_OWORD *)&v64.c;
      double v61 = a5;
      tdouble x = v64.tx;
      tdouble y = v64.ty;
      double v32 = 270.0;
    }
    double v43 = PDFDegToRad(v32);
    *(_OWORD *)&v63.double a = v60;
    *(_OWORD *)&v63.double c = v59;
    v63.tdouble x = tx;
    v63.tdouble y = ty;
    CGAffineTransformRotate(&v64, &v63, v43);
    double v44 = v64.a;
    double v45 = v64.b;
    double v46 = v64.c;
    double v47 = v64.d;
    double v48 = v64.tx;
    double v49 = v64.ty;
    double v50 = PDFPointToCGPoint(x, y);
    double v52 = v46 * v51 + v44 * v50;
    a5 = v61;
    double v41 = v48 + v52;
    double v42 = v49 + v47 * v51 + v45 * v50;
    goto LABEL_18;
  }
LABEL_24:

  double v57 = x;
  double v58 = y;
  result.double y = v58;
  result.double x = v57;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromPage:(id)a4 forScaleFactor:(double)a5
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  uint64_t v10 = -[PDFViewLayout convertPoint:fromPage:forScaleFactor:](self, "convertPoint:fromPage:forScaleFactor:", v9, x, y, a5);
  double v12 = v11;
  double v14 = v13;
  v28.origin.double x = PDFRectToCGRect(v10);
  CGFloat v15 = v28.origin.x;
  CGFloat v16 = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;
  double MaxX = CGRectGetMaxX(v28);
  v29.origin.double x = v15;
  v29.origin.double y = v16;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v29);
  -[PDFViewLayout convertPoint:fromPage:forScaleFactor:](self, "convertPoint:fromPage:forScaleFactor:", v9, PDFPointMake(MaxX, MaxY));
  double v22 = v21;

  double v23 = PDFRectFromPDFPoints(v12, v14, v22);
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromPage:(id)a4
{
  -[PDFViewLayout convertPoint:fromPage:forScaleFactor:](self, "convertPoint:fromPage:forScaleFactor:", a4, a3.x, a3.y, 1.0);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (int64_t)functionalDisplayMode
{
  id WeakRetained = objc_loadWeakRetained(&self->_private->delegate);
  double v4 = WeakRetained;
  double v5 = self->_private;
  if (v5->delegateKnowsDisplayMode)
  {
    int64_t v6 = [WeakRetained displayMode];
    double v5 = self->_private;
  }
  else
  {
    int64_t v6 = 1;
  }
  id v7 = objc_loadWeakRetained((id *)&v5->document);

  if (!v7) {
    goto LABEL_27;
  }
  double v8 = self->_private;
  unint64_t pageCount = v8->pageCount;
  if (pageCount == 1)
  {
    v6 &= 1u;
    goto LABEL_27;
  }
  if (pageCount == 2 && v6 == 2)
  {
    if (v8->delegateKnowsDisplayAsBook)
    {
      if ([v4 displaysAsBook]) {
        int64_t v6 = 0;
      }
      else {
        int64_t v6 = 2;
      }
      goto LABEL_27;
    }
LABEL_26:
    int64_t v6 = 2;
    goto LABEL_27;
  }
  if (pageCount == 2 && v6 == 3)
  {
    if (v8->delegateKnowsDisplayAsBook && ([v4 displaysAsBook] & 1) != 0)
    {
      int64_t v6 = 1;
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (v8->delegateKnowsIsUsingPageViewController && [v4 isUsingPageViewController]) {
    int64_t v6 = 0;
  }
LABEL_27:

  return v6;
}

- (void)invalidateInternalDocumentGeometry
{
  [(NSLock *)self->_private->pageLayoutLock lock];
  objc_super v3 = self->_private;
  pageLayoutBounds = v3->pageLayoutBounds;
  if (pageLayoutBounds)
  {
    free(pageLayoutBounds);
    self->_private->pageLayoutBounds = 0;
    objc_super v3 = self->_private;
  }
  CGSize v5 = (CGSize)*MEMORY[0x263F001B0];
  v3->singlePageContinuousSize = (CGSize)*MEMORY[0x263F001B0];
  self->_private->twoUpContinousSize = v5;
  pageLayoutLock = self->_private->pageLayoutLock;

  [(NSLock *)pageLayoutLock unlock];
}

- (id)facingPageForPage:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  if (!v4
    || ([v4 document], id v6 = (id)objc_claimAutoreleasedReturnValue(), v6, v6 != WeakRetained)
    || (unint64_t)[(PDFViewLayout *)self functionalDisplayMode] < 2)
  {
    id v7 = 0;
    goto LABEL_5;
  }
  id v9 = objc_loadWeakRetained(&self->_private->delegate);
  uint64_t v10 = [WeakRetained indexForPage:v4];
  if (self->_private->delegateKnowsDisplayAsBook && [v9 displaysAsBook])
  {
    if (!v10)
    {
LABEL_18:
      id v7 = 0;
      goto LABEL_19;
    }
    unint64_t v11 = v10 & 0x8000000000000001;
    if ((v10 & 0x8000000000000001) != 1) {
      unint64_t v11 = -1;
    }
  }
  else
  {
    unint64_t v11 = -1;
    if ((v10 & 0x8000000000000001) != 1) {
      unint64_t v11 = 1;
    }
  }
  if (v10 + v11 >= self->_private->pageCount) {
    goto LABEL_18;
  }
  id v7 = objc_msgSend(WeakRetained, "pageAtIndex:");
LABEL_19:

LABEL_5:

  return v7;
}

- (void)generateInternalDocumentGeometry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  if (!WeakRetained) {
    goto LABEL_98;
  }
  id v132 = WeakRetained;
  self->_private->unint64_t pageCount = [WeakRetained pageCount];
  size_t v4 = 32 * self->_private->pageCount;
  self->_private->pageLayoutBounds = (CGRect *)malloc_type_malloc(v4, 0xB91005F7uLL);
  bzero(self->_private->pageLayoutBounds, v4);
  id WeakRetained = v132;
  CGSize v5 = self->_private;
  if (!v5->pageCount) {
    goto LABEL_98;
  }
  id v6 = objc_loadWeakRetained(&v5->delegate);
  id v7 = v6;
  double v9 = *MEMORY[0x263F834E8];
  double v8 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v10 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v11 = *(double *)(MEMORY[0x263F834E8] + 24);
  double v12 = self->_private;
  if (v12->delegateKnowsMargins)
  {
    [v6 pageBreakMargins];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v12 = self->_private;
  }
  else
  {
    double v20 = *(double *)(MEMORY[0x263F834E8] + 24);
    double v18 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v16 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v14 = *MEMORY[0x263F834E8];
  }
  if (v12->delegateKnowsDocumentMargins)
  {
    [v7 documentMargins];
    double v9 = v21;
    double v8 = v22;
    double v10 = v23;
    double v11 = v24;
    double v12 = self->_private;
  }
  if (v12->delegateKnowsDisplaysDirection)
  {
    uint64_t v25 = [v7 displayDirection];
    double v12 = self->_private;
  }
  else
  {
    uint64_t v25 = 0;
  }
  if (v12->delegateKnowsDisplayAsBook)
  {
    int v26 = [v7 displaysAsBook];
    double v12 = self->_private;
  }
  else
  {
    int v26 = 0;
  }
  if (v12->delegateKnowsDisplayRTL) {
    int v27 = [v7 displaysRTL];
  }
  else {
    int v27 = 0;
  }
  int64_t v28 = [(PDFViewLayout *)self functionalDisplayMode];
  double v29 = v10 + v9;
  double v30 = v20 + v16 + v11 + v8;
  double v31 = v18 + v14 + v29;
  switch(v28)
  {
    case 0:
      double v32 = self->_private;
      if (v32->pageCount)
      {
        uint64_t v33 = 0;
        unint64_t v34 = 0;
        do
        {
          p_double x = (void *)&v32->pageLayoutBounds[v33].origin.x;
          double v36 = [v132 pageAtIndex:v34];
          [(PDFViewLayout *)self normalizedPageBounds:v36];
          *p_double x = v37;
          p_x[1] = v38;
          p_x[2] = v39;
          p_x[3] = v40;

          self->_private->pageLayoutBounds[v33].origin.double x = v30 + self->_private->pageLayoutBounds[v33].origin.x;
          double v41 = &self->_private->pageLayoutBounds[v33];
          v41->origin.double y = v31 + v41->origin.y;
          ++v34;
          double v32 = self->_private;
          ++v33;
        }
        while (v34 < v32->pageCount);
      }
      goto LABEL_97;
    case 1:
      v130 = v7;
      [v132 beginBatchPageChanges];
      double v42 = self->_private;
      unint64_t pageCount = v42->pageCount;
      if (pageCount)
      {
        uint64_t v44 = 0;
        unint64_t v45 = 0;
        double v46 = v16 + v8;
        double v47 = 0.0;
        uint64_t v48 = -1;
        double v49 = 0.0;
        double v50 = v132;
        do
        {
          unint64_t v51 = pageCount + v48;
          if (v25) {
            unint64_t v52 = v45;
          }
          else {
            unint64_t v52 = pageCount + v48;
          }
          double v53 = (void *)&v42->pageLayoutBounds[v52].origin.x;
          double v54 = [v50 pageAtIndex:v52];
          [(PDFViewLayout *)self normalizedPageBounds:v54];
          *double v53 = v55;
          v53[1] = v56;
          v53[2] = v57;
          v53[3] = v58;

          pageLayoutBounds = self->_private->pageLayoutBounds;
          if (v25) {
            double v47 = fmax(v47, pageLayoutBounds[v44].size.height);
          }
          else {
            double v49 = fmax(v49, pageLayoutBounds[v51].size.width);
          }
          pageLayoutBounds[v52].origin.double x = v46 + pageLayoutBounds[v52].origin.x;
          long long v60 = &self->_private->pageLayoutBounds[v52];
          v60->origin.double y = v18 + v60->origin.y;
          double v61 = self->_private->pageLayoutBounds;
          if (v45)
          {
            if (v25)
            {
              double v62 = v16 + PDFRectGetMaxX(v61[v44 - 1].origin.x, v61[v44 - 1].origin.y, v61[v44 - 1].size.width);
              p_double y = &self->_private->pageLayoutBounds[v44];
            }
            else
            {
              double v62 = v14
                  + PDFRectGetMaxY(v61[pageCount + 1 + v48].origin.x, v61[pageCount + 1 + v48].origin.y, v61[pageCount + 1 + v48].size.width, v61[pageCount + 1 + v48].size.height);
              p_double y = (CGRect *)&self->_private->pageLayoutBounds[v51].origin.y;
            }
          }
          else
          {
            p_double y = (CGRect *)&v61[v52].origin.y;
            double v62 = v10;
          }
          double v50 = v132;
          p_y->origin.double x = v62 + p_y->origin.x;
          ++v45;
          double v42 = self->_private;
          unint64_t pageCount = v42->pageCount;
          --v48;
          ++v44;
        }
        while (v45 < pageCount);
      }
      else
      {
        double v49 = 0.0;
        double v47 = 0.0;
        double v50 = v132;
      }
      [v50 endBatchPageChanges];
      v124 = self->_private;
      id v7 = v130;
      if (v124->pageCount)
      {
        uint64_t v125 = 0;
        unint64_t v126 = 0;
        do
        {
          v127 = v124->pageLayoutBounds;
          if (v25)
          {
            double v128 = floor((v47 - v127[v125].size.height) * 0.5);
            v129 = &v127[v126].origin.y;
          }
          else
          {
            v129 = &v127[v125].origin.x;
            double v128 = floor((v49 - v129[2]) * 0.5);
          }
          double *v129 = *v129 + v128;
          ++v126;
          v124 = self->_private;
          ++v125;
        }
        while (v126 < v124->pageCount);
      }
      goto LABEL_97;
    case 2:
      CGAffineTransform v64 = self->_private;
      if (v64->pageCount)
      {
        uint64_t v65 = 0;
        unint64_t v66 = 0;
        do
        {
          id v67 = (void *)&v64->pageLayoutBounds[v65].origin.x;
          double v68 = [v132 pageAtIndex:v66];
          [(PDFViewLayout *)self normalizedPageBounds:v68];
          *id v67 = v69;
          v67[1] = v70;
          v67[2] = v71;
          v67[3] = v72;

          self->_private->pageLayoutBounds[v65].origin.double x = v30 + self->_private->pageLayoutBounds[v65].origin.x;
          CGFloat v73 = &self->_private->pageLayoutBounds[v65];
          v73->origin.double y = v31 + v73->origin.y;
          BOOL v74 = (v66 & 1) == 0;
          if (v26) {
            BOOL v74 = v66;
          }
          if (v66 && !v74)
          {
            CGFloat v75 = &self->_private->pageLayoutBounds[v65];
            CGFloat v76 = v75->size.height - v75[-1].size.height;
            double v77 = v76 * 0.5;
            if (v76 <= 0.0) {
              v75->origin.double y = v75->origin.y - v77;
            }
            else {
              v75[-1].origin.double y = v77 + v75[-1].origin.y;
            }
            double width = self->_private->pageLayoutBounds[v65 - 1].size.width;
            self->_private->pageLayoutBounds[v65].origin.double x = width
                                                           + PDFScreenGetBackingScaleFactor() * -0.5
                                                           + self->_private->pageLayoutBounds[v65].origin.x;
            self->_private->pageLayoutBounds[v65].origin.double x = v30 + self->_private->pageLayoutBounds[v65].origin.x;
            if (v27)
            {
              double v79 = &self->_private->pageLayoutBounds[v65];
              CGPoint origin = v79[-1].origin;
              CGSize size = v79[-1].size;
              CGSize v82 = v79->size;
              v79[-1].CGPoint origin = v79->origin;
              v79[-1].CGSize size = v82;
              double v83 = &self->_private->pageLayoutBounds[v65];
              v83->CGPoint origin = origin;
              v83->CGSize size = size;
            }
          }
          ++v66;
          CGAffineTransform v64 = self->_private;
          ++v65;
        }
        while (v66 < v64->pageCount);
      }
      goto LABEL_97;
    case 3:
      v84 = self->_private;
      unint64_t v85 = v84->pageCount;
      if (!v85) {
        goto LABEL_97;
      }
      v131 = v7;
      uint64_t v86 = 0;
      unint64_t v87 = 0;
      double v88 = v16 + v8;
      double v89 = v18 + v10;
      double v90 = 0.0;
      double v91 = 0.0;
      break;
    default:
      goto LABEL_97;
  }
  do
  {
    uint64_t v92 = v85 + v86;
    uint64_t v93 = v85 + v86 - 1;
    v94 = (void *)&v84->pageLayoutBounds[v93].origin.x;
    v95 = [v132 pageAtIndex:v93];
    [(PDFViewLayout *)self normalizedPageBounds:v95];
    void *v94 = v96;
    v94[1] = v97;
    v94[2] = v98;
    v94[3] = v99;

    v100 = &self->_private->pageLayoutBounds[v93];
    double v101 = v100->size.width;
    v100->origin.double x = v88 + v100->origin.x;
    v102 = &self->_private->pageLayoutBounds[v93];
    v102->origin.double y = v89 + v102->origin.y;
    if (v87)
    {
      unint64_t v103 = v85 - 1;
      BOOL v104 = (v93 & 1) == 0;
      if (v26) {
        BOOL v104 = v93;
      }
      if (v103 == v87) {
        char v105 = v26;
      }
      else {
        char v105 = 0;
      }
      if ((v105 & 1) != 0 || v104)
      {
        if (v90 > 0.0)
        {
          BOOL v106 = v103 == v87;
          v107 = &self->_private->pageLayoutBounds[v93];
          v107->origin.double y = v90 + v107->origin.y;
          char v108 = v106 ? v26 : 0;
          if ((v108 & 1) == 0)
          {
            v109 = &self->_private->pageLayoutBounds[v92];
            v109->origin.double y = v90 + v109->origin.y;
          }
        }
        v110 = &self->_private->pageLayoutBounds[v93];
        double v111 = v14 + PDFRectGetMaxY(v110->origin.x, v110->origin.y, v110->size.width, v110->size.height);
        v112 = &self->_private->pageLayoutBounds[v92];
        double v90 = fmax(v111, v14 + PDFRectGetMaxY(v112->origin.x, v112->origin.y, v112->size.width, v112->size.height));
      }
    }
    else
    {
      v113 = &self->_private->pageLayoutBounds[v93];
      v113->origin.double y = v14 + v113->origin.y;
      v114 = self->_private;
      unint64_t v115 = v114->pageCount;
      if (!v26)
      {
        if ((v115 & 1) == 0) {
          goto LABEL_72;
        }
LABEL_71:
        double v90 = v14
            + PDFRectGetMaxY(v114->pageLayoutBounds[v93].origin.x, v114->pageLayoutBounds[v93].origin.y, v114->pageLayoutBounds[v93].size.width, v114->pageLayoutBounds[v93].size.height);
        goto LABEL_72;
      }
      if ((v115 & 1) == 0) {
        goto LABEL_71;
      }
    }
LABEL_72:
    double v91 = fmax(v91, v101);
    ++v87;
    v84 = self->_private;
    unint64_t v85 = v84->pageCount;
    --v86;
  }
  while (v87 < v85);
  id v7 = v131;
  if (v85)
  {
    uint64_t v116 = 0;
    unint64_t v117 = 0;
    do
    {
      if (v26)
      {
        if (v117 && (v117 != v85 - 1 || (v85 & 1) != 0)) {
          goto LABEL_83;
        }
      }
      else if (v117 != v85 - 1 || (v85 & 1) == 0)
      {
LABEL_83:
        v84->pageLayoutBounds[v116].origin.double x = v84->pageLayoutBounds[v116].origin.x
                                             + (v91 - v84->pageLayoutBounds[v116].size.width) * 0.5;
        BOOL v118 = (v117 & 1) == 0;
        if (!v26) {
          BOOL v118 = v117;
        }
        if (v118)
        {
          self->_private->pageLayoutBounds[v116].origin.double x = v91 + self->_private->pageLayoutBounds[v116].origin.x;
          self->_private->pageLayoutBounds[v116].origin.double x = v20 + v16 + self->_private->pageLayoutBounds[v116].origin.x;
          if (v27)
          {
            v119 = &self->_private->pageLayoutBounds[v116];
            CGPoint v120 = v119[-1].origin;
            CGSize v121 = v119[-1].size;
            CGSize v122 = v119->size;
            v119[-1].CGPoint origin = v119->origin;
            v119[-1].CGSize size = v122;
            v123 = &self->_private->pageLayoutBounds[v116];
            v123->CGPoint origin = v120;
            v123->CGSize size = v121;
          }
        }
        goto LABEL_88;
      }
      v84->pageLayoutBounds[v116].origin.double x = v16
                                           + floor(-(v20+ v16+ v84->pageLayoutBounds[v116].size.width- (v20 + v16 + v91) * 2.0)* 0.5);
LABEL_88:
      ++v117;
      v84 = self->_private;
      unint64_t v85 = v84->pageCount;
      ++v116;
    }
    while (v117 < v85);
  }
LABEL_97:

  id WeakRetained = v132;
LABEL_98:
}

- (CGRect)normalizedPageBounds:(id)a3
{
  id v4 = a3;
  CGSize v5 = v4;
  id v6 = self->_private;
  if (v6->delegateKnowsDisplayBox)
  {
    id WeakRetained = objc_loadWeakRetained(&v6->delegate);
    objc_msgSend(v5, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox"));
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    [v4 boundsForBox:1];
    double v9 = v12;
    double v11 = v13;
  }
  double v14 = PDFPointMake(0.0, 0.0);
  double v16 = v15;
  int v17 = [v5 rotation];
  if (v17 == 270 || v17 == 90)
  {
    double v18 = v9;
  }
  else
  {
    double v18 = v11;
    double v11 = v9;
  }

  double v19 = v14;
  double v20 = v16;
  double v21 = v11;
  double v22 = v18;
  result.size.CGFloat height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (void).cxx_destruct
{
}

@end