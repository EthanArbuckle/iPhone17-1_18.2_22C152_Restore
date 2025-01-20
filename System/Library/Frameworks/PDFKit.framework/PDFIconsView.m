@interface PDFIconsView
- (CGSize)_iconsLayoutSize;
- (id)currentPage;
- (id)initFromThumbnailView:(id)a3;
- (int)_iconsLayoutIconCount;
- (void)_updateScrubberAtViewLocation:(CGPoint)a3;
- (void)_updateScrubberForPageIndex:(int)a3 goToPage:(BOOL)a4;
- (void)currentPageChanged:(id)a3;
- (void)documentMutated:(id)a3;
- (void)layoutSubviews;
- (void)pageChanged:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)updateIconsImages;
@end

@implementation PDFIconsView

- (id)initFromThumbnailView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFIconsView;
  v5 = [(PDFIconsView *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_thumbnailView, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    icons = v6->_icons;
    v6->_icons = v7;

    v9 = [MEMORY[0x263F825C8] tertiarySystemBackgroundColor];
    [(PDFIconsView *)v6 setBackgroundColor:v9];
  }
  return v6;
}

- (void)updateIconsImages
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_icons;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setNeedsUpdate", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)currentPage
{
  if ([(PDFPageIconLayer *)self->_activeIcon isHidden])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = [(PDFPageIconLayer *)self->_activeIcon document];
    uint64_t v3 = objc_msgSend(v4, "pageAtIndex:", -[PDFPageIconLayer pageIndex](self->_activeIcon, "pageIndex"));
  }

  return v3;
}

- (void)documentMutated:(id)a3
{
  [(PDFIconsView *)self updateIconsImages];

  [(PDFIconsView *)self setNeedsLayout];
}

- (void)currentPageChanged:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  uint64_t v5 = [WeakRetained PDFView];
  id v8 = [v5 currentPage];

  uint64_t v6 = [v8 document];
  uint64_t v7 = [v6 indexForPage:v8];

  [(PDFIconsView *)self _updateScrubberForPageIndex:v7 goToPage:0];
}

- (void)pageChanged:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"page"];
  uint64_t v6 = [v5 document];
  uint64_t v7 = [v6 indexForPage:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = self->_icons;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v13, "pageIndex", (void)v14) == v7)
        {
          [v13 setNeedsUpdate];

          [(PDFIconsView *)self setNeedsLayout];
          goto LABEL_11;
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

LABEL_11:
  if ([(PDFPageIconLayer *)self->_activeIcon pageIndex] == v7)
  {
    [(PDFPageIconLayer *)self->_activeIcon setNeedsUpdate];
    [(PDFPageIconLayer *)self->_activeIcon updateAsPageIndex:v7 forDocument:v6];
  }
}

- (void)layoutSubviews
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  v73 = [WeakRetained PDFView];
  uint64_t v3 = [v73 document];
  uint64_t v4 = [WeakRetained layoutMode];
  unsigned int v5 = [(PDFIconsView *)self _iconsLayoutIconCount];
  uint64_t v6 = v5;
  int v7 = [(NSMutableArray *)self->_icons count];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [WeakRetained thumbnailSize];
  double v78 = v9;
  double v79 = v8;
  int v10 = v5 - v7;
  if (v5 != v7)
  {
    if (v10 >= 0) {
      unsigned int v11 = v5 - v7;
    }
    else {
      unsigned int v11 = v7 - v5;
    }
    if (v11 <= 1) {
      int v12 = 1;
    }
    else {
      int v12 = v11;
    }
    do
    {
      if (v10 < 0)
      {
        v13 = [(NSMutableArray *)self->_icons objectAtIndex:0];
        [(PDFPageIconLayer *)v13 removeFromSuperlayer];
        [(NSMutableArray *)self->_icons removeObjectAtIndex:0];
      }
      else
      {
        v13 = -[PDFPageIconLayer initWithSize:]([PDFPageIconLayer alloc], "initWithSize:", v79, v78);
        long long v14 = [(PDFIconsView *)self layer];
        [v14 addSublayer:v13];

        [(NSMutableArray *)self->_icons addObject:v13];
      }

      --v12;
    }
    while (v12);
  }
  [(PDFIconsView *)self bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  [WeakRetained contentInset];
  CGFloat v24 = v16 + v23;
  CGFloat v26 = v18 + v25;
  CGFloat v28 = v20 - (v23 + v27);
  CGFloat v30 = v22 - (v25 + v29);
  v81.origin.x = v16 + v23;
  v81.origin.y = v26;
  v81.size.width = v28;
  v81.size.height = v30;
  double MidX = CGRectGetMidX(v81);
  v82.origin.x = v24;
  v82.origin.y = v26;
  v82.size.width = v28;
  v82.size.height = v30;
  double MidY = CGRectGetMidY(v82);
  [(PDFIconsView *)self _iconsLayoutSize];
  if ((int)v6 >= 1)
  {
    uint64_t v35 = 0;
    double v76 = v79 + 2.0;
    double v77 = MidX - v33 * 0.5 + 1.0;
    double v75 = MidY - v34 * 0.5 + 1.0;
    do
    {
      if (v4) {
        double v36 = v75;
      }
      else {
        double v36 = v75 + (double)(int)v35 * (v78 + 2.0);
      }
      if (v4) {
        double v37 = v77 + (double)(int)v35 * v76;
      }
      else {
        double v37 = v77;
      }
      int v38 = objc_msgSend(v3, "pageCount", v77 + (double)(int)v35 * v76);
      int v39 = v38;
      unsigned int v40 = v38 - 1;
      int v41 = llroundf((float)((float)(int)v35 / (float)(v6 - 1)) * (float)(v38 - 1));
      int v42 = v41 & ~(v41 >> 31);
      if (v42 < v38) {
        unsigned int v40 = v42;
      }
      if (v6 == v38) {
        uint64_t v43 = v35;
      }
      else {
        uint64_t v43 = v40;
      }
      if (v4 == 1)
      {
        if ([v73 displaysRTL]) {
          uint64_t v43 = (~v43 + v39);
        }
        else {
          uint64_t v43 = v43;
        }
      }
      v44 = [v3 pageAtIndex:(int)v43];
      [v44 boundsForBox:1];
      double v49 = PDFRectFromCGRect(v45, v46, v47, v48);
      double v51 = PDFRectRotate([v44 rotation], v49, v50);
      double v53 = v52;
      double v55 = v54;
      double v57 = v56;
      v58.n128_u64[0] = 0;
      v59.n128_u64[0] = 0;
      double v60 = PDFRectMake(v58, v59, v79, v78);
      double v64 = PDFScaleRectToRect(v51, v53, v55, v57, v60, v61, v62, v63);
      double v65 = PDFRectScale(v51, v53, v55, v57, v64);
      double v67 = v66;
      double v69 = v68;
      v70 = -[NSMutableArray objectAtIndex:](self->_icons, "objectAtIndex:", v35, v65);
      v83.size.width = v67;
      v83.size.height = v69;
      v83.origin.x = v37 - (v67 - v79) * 0.5;
      objc_msgSend(v70, "setFrame:", COERCE_DOUBLE(CGRectIntegral(v83)), v36 - (v69 - v78) * 0.5, v67, v69);
      [v70 updateAsPageIndex:v43 forDocument:v3];

      ++v35;
    }
    while (v6 != v35);
  }
  [MEMORY[0x263F158F8] commit];
  v71 = [v73 currentPage];
  uint64_t v72 = [v3 indexForPage:v71];

  [(PDFIconsView *)self _updateScrubberForPageIndex:v72 goToPage:1];
}

- (int)_iconsLayoutIconCount
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  uint64_t v4 = [WeakRetained PDFView];
  unsigned int v5 = [v4 document];
  uint64_t v6 = [WeakRetained layoutMode];
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 || (uint64_t v8 = v6, ([v5 isLocked] & 1) != 0) || !objc_msgSend(v5, "pageCount"))
  {
    int v24 = 0;
  }
  else
  {
    [(PDFIconsView *)self bounds];
    double v10 = v9;
    double v12 = v11;
    [WeakRetained contentInset];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [WeakRetained thumbnailSize];
    if (v8)
    {
      double v23 = v10 - (v16 + v20);
    }
    else
    {
      double v21 = v22;
      double v23 = v12 - (v14 + v18);
    }
    int v24 = vcvtmd_s64_f64(v23 / (v21 + 2.0));
    if ([v5 pageCount] < (unint64_t)v24) {
      int v24 = [v5 pageCount];
    }
  }

  return v24;
}

- (CGSize)_iconsLayoutSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  uint64_t v4 = [WeakRetained layoutMode];
  [WeakRetained thumbnailSize];
  double v6 = v5;
  double v8 = v7;
  int v9 = [(PDFIconsView *)self _iconsLayoutIconCount];
  if (v4) {
    double v10 = (v6 + 2.0) * (double)v9;
  }
  else {
    double v10 = v6 + 2.0;
  }
  if (v4) {
    double v11 = v8 + 2.0;
  }
  else {
    double v11 = (v8 + 2.0) * (double)v9;
  }

  double v12 = v10;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = [a3 anyObject];
  [v5 locationInView:self];
  -[PDFIconsView _updateScrubberAtViewLocation:](self, "_updateScrubberAtViewLocation:");
}

- (void)_updateScrubberAtViewLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  double v6 = [WeakRetained PDFView];
  double v7 = [v6 document];
  uint64_t v8 = [WeakRetained layoutMode];
  if (v7)
  {
    uint64_t v9 = v8;
    [(PDFIconsView *)self bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [WeakRetained contentInset];
    CGFloat v19 = v11 + v18;
    CGFloat v21 = v13 + v20;
    CGFloat v23 = v15 - (v18 + v22);
    CGFloat v25 = v17 - (v20 + v24);
    v38.origin.double x = v19;
    v38.origin.double y = v21;
    v38.size.width = v23;
    v38.size.height = v25;
    double MidX = CGRectGetMidX(v38);
    v39.origin.double x = v19;
    v39.origin.double y = v21;
    v39.size.width = v23;
    v39.size.height = v25;
    double MidY = CGRectGetMidY(v39);
    [(PDFIconsView *)self _iconsLayoutSize];
    double v29 = (x - (MidX - v28 * 0.5)) / (MidX + v28 * 0.5 - (MidX - v28 * 0.5));
    double v31 = (y - (MidY - v30 * 0.5)) / (MidY + v30 * 0.5 - (MidY - v30 * 0.5));
    if (!v9) {
      double v29 = v31;
    }
    if (v29 >= -0.1 && v29 <= 1.1)
    {
      double v32 = CGFloatClamp(v29, 0.0, 1.0);
      int v33 = [v7 pageCount];
      unsigned int v34 = vcvtmd_s64_f64(v32 * (double)v33);
      if ((int)v34 >= v33) {
        uint64_t v35 = (v33 - 1);
      }
      else {
        uint64_t v35 = v34;
      }
      if (v9 == 1)
      {
        if ([v6 displaysRTL]) {
          uint64_t v35 = (~v35 + v33);
        }
        else {
          uint64_t v35 = v35;
        }
      }
      [(PDFIconsView *)self _updateScrubberForPageIndex:v35 goToPage:1];
    }
  }
}

- (void)_updateScrubberForPageIndex:(int)a3 goToPage:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v92 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  uint64_t v8 = [WeakRetained PDFView];
  uint64_t v9 = [v8 document];
  uint64_t v10 = [WeakRetained layoutMode];
  int v11 = [v9 pageCount];
  if (v8) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12 || (int v13 = v11, ([v9 isLocked] & 1) != 0) || v13 <= 0)
  {
    [(PDFPageIconLayer *)self->_activeIcon removeFromSuperlayer];
    activeIcon = self->_activeIcon;
    self->_activeIcon = 0;
  }
  else
  {
    [(PDFIconsView *)self _iconsLayoutSize];
    double v15 = v14;
    double v17 = v16;
    int v18 = [(PDFIconsView *)self _iconsLayoutIconCount];
    [WeakRetained thumbnailSize];
    double v21 = v20;
    double v22 = 2.0;
    double v84 = v17;
    if (v18 >= v13)
    {
      double v83 = v19;
    }
    else
    {
      double v23 = (double)v13;
      if (v10)
      {
        double v83 = v19;
        double v21 = (v15 + -2.0 - v21) / v23;
      }
      else
      {
        double v83 = (v17 + -2.0 - v19) / v23;
      }
      double v22 = 0.0;
    }
    [(PDFIconsView *)self bounds];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    [WeakRetained contentInset];
    CGFloat v34 = v26 + v33;
    CGFloat v36 = v28 + v35;
    CGFloat v38 = v30 - (v33 + v37);
    CGFloat v40 = v32 - (v35 + v39);
    v93.origin.double x = v34;
    v93.origin.double y = v36;
    v93.size.double width = v38;
    v93.size.double height = v40;
    double MidX = CGRectGetMidX(v93);
    v94.origin.double x = v34;
    v94.origin.double y = v36;
    v94.size.double width = v38;
    v94.size.double height = v40;
    double MidY = CGRectGetMidY(v94);
    double v43 = MidY;
    BOOL v86 = v4;
    if (v10)
    {
      int v44 = [v8 displaysRTL];
      int v45 = v13 + ~v5;
      if (!v44) {
        int v45 = v5;
      }
      double v46 = MidX - v15 * 0.5 + 1.0 + (double)v45 * (v22 + v21);
      double v47 = v43 - v84 * 0.5 + 1.0;
    }
    else
    {
      double v46 = MidX - v15 * 0.5 + 1.0;
      double v47 = MidY - v84 * 0.5 + 1.0 + (double)(int)v5 * (v22 + v83);
    }
    [WeakRetained thumbnailSize];
    double v49 = v48 * 1.333;
    double v51 = v50 * 1.333;
    double v52 = v46 - (v48 * 1.333 - v48) * 0.5;
    double v53 = v47 - (v50 * 1.333 - v50) * 0.5;
    objc_msgSend(v9, "pageAtIndex:");
    v85 = (PDFPageIconLayer *)objc_claimAutoreleasedReturnValue();
    [(PDFPageIconLayer *)v85 boundsForBox:1];
    double v55 = v54;
    double v57 = v56;
    double v60 = PDFScaleRectToRect(v58, v59, v54, v56, v52, v53, v49, v51);
    double v61 = v60 * v55;
    double v62 = v60 * v57;
    double v63 = (v49 - v60 * v55) * 0.5;
    if (v49 <= v61) {
      double v63 = -0.0;
    }
    double v64 = v52 + v63;
    if (v49 <= v61) {
      double v65 = v49;
    }
    else {
      double v65 = v61;
    }
    double v66 = (v51 - v62) * 0.5;
    if (v51 <= v62) {
      double v66 = -0.0;
    }
    double v67 = v53 + v66;
    if (v51 <= v62) {
      double v62 = v51;
    }
    CGRect v95 = CGRectIntegral(*(CGRect *)(&v62 - 3));
    double x = v95.origin.x;
    double y = v95.origin.y;
    double width = v95.size.width;
    double height = v95.size.height;
    if (!self->_activeIcon)
    {
      uint64_t v72 = -[PDFPageIconLayer initWithSize:]([PDFPageIconLayer alloc], "initWithSize:", v95.size.width, v95.size.height);
      v73 = self->_activeIcon;
      self->_activeIcon = v72;

      [(PDFPageIconLayer *)self->_activeIcon setZPosition:1.0];
      v74 = [(PDFIconsView *)self layer];
      [v74 addSublayer:self->_activeIcon];
    }
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    -[PDFPageIconLayer setFrame:](self->_activeIcon, "setFrame:", x, y, width, height);
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    double v75 = self->_icons;
    uint64_t v76 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v87 objects:v91 count:16];
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = *(void *)v88;
      while (2)
      {
        for (uint64_t i = 0; i != v77; ++i)
        {
          if (*(void *)v88 != v78) {
            objc_enumerationMutation(v75);
          }
          v80 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          if ([v80 pageIndex] == v5)
          {
            uint64_t v81 = [v80 contents];

            if (v81) {
              [(PDFPageIconLayer *)self->_activeIcon setContents:v81];
            }
            goto LABEL_41;
          }
        }
        uint64_t v77 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v87 objects:v91 count:16];
        if (v77) {
          continue;
        }
        break;
      }
    }

LABEL_41:
    [MEMORY[0x263F158F8] commit];
    [(PDFPageIconLayer *)self->_activeIcon updateAsPageIndex:v5 forDocument:v9];
    if (v86)
    {
      CGRect v82 = [v9 pageAtIndex:(int)v5];
      [v8 goToPage:v82];
    }
    activeIcon = v85;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeIcon, 0);
  objc_storeStrong((id *)&self->_icons, 0);

  objc_destroyWeak((id *)&self->_thumbnailView);
}

@end