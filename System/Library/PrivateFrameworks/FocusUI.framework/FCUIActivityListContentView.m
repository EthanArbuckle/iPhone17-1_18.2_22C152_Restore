@interface FCUIActivityListContentView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isContentDetached;
- (BOOL)isFooterPinnedToBottom;
- (CGSize)_sizeThatFits:(CGSize)a3 collapsedToPill:(BOOL)a4 includingFooter:(BOOL)a5 forceMeasurement:(BOOL)a6;
- (CGSize)collapsedSize;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFitsCollapsedToPill:(CGSize)a3;
- (FCUIActivityDisplaying)compactActivityView;
- (NSArray)activityViews;
- (UIView)footerView;
- (UIView)headerView;
- (id)_contentSizeCategoryAdjustingViews;
- (id)subviewFramesInBounds:(CGRect)a3;
- (void)layoutSubviews;
- (void)setActivityViews:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setCollapsedSize:(CGSize)a3;
- (void)setCompactActivityView:(id)a3;
- (void)setContentDetached:(BOOL)a3;
- (void)setFooterPinnedToBottom:(BOOL)a3;
- (void)setFooterView:(id)a3;
- (void)setHeaderView:(id)a3;
@end

@implementation FCUIActivityListContentView

- (void)setHeaderView:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    if (v5)
    {
      [(UIView *)self->_headerView removeFromSuperview];
      objc_storeStrong((id *)&self->_headerView, a3);
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __45__FCUIActivityListContentView_setHeaderView___block_invoke;
      v6[3] = &unk_264542B68;
      v6[4] = self;
      [MEMORY[0x263F82E00] performWithoutAnimation:v6];
      self->_headerViewValid = 1;
    }
    else
    {
      self->_headerViewValid = 0;
    }
    [(FCUIActivityListContentView *)self setNeedsLayout];
  }
}

uint64_t __45__FCUIActivityListContentView_setHeaderView___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.0];
}

- (void)setFooterView:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    if (v5)
    {
      [(UIView *)self->_footerView removeFromSuperview];
      objc_storeStrong((id *)&self->_footerView, a3);
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __45__FCUIActivityListContentView_setFooterView___block_invoke;
      v6[3] = &unk_264542B68;
      v6[4] = self;
      [MEMORY[0x263F82E00] performWithoutAnimation:v6];
      self->_footerViewValid = 1;
    }
    else
    {
      self->_footerViewValid = 0;
    }
    [(FCUIActivityListContentView *)self setNeedsLayout];
  }
}

uint64_t __45__FCUIActivityListContentView_setFooterView___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:0.0];
}

- (void)setActivityViews:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    p_activityViews = &self->_activityViews;
    id v21 = a3;
    v6 = (void *)[(NSArray *)self->_activityViews mutableCopy];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v22 = v5;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v24 = *(void *)v27;
      do
      {
        uint64_t v9 = 0;
        do
        {
          v10 = self;
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
          if ([v6 count])
          {
            uint64_t v12 = 0;
            while (1)
            {
              v13 = [v6 objectAtIndex:v12];
              v14 = [v13 activityUniqueIdentifier];
              v15 = [v11 activityUniqueIdentifier];
              int v16 = BSEqualObjects();

              if (v16) {
                break;
              }

              if (++v12 >= (unint64_t)[v6 count]) {
                goto LABEL_11;
              }
            }
            [v6 removeObjectAtIndex:v12];

            self = v10;
          }
          else
          {
LABEL_11:
            v25[0] = MEMORY[0x263EF8330];
            v25[1] = 3221225472;
            v25[2] = __48__FCUIActivityListContentView_setActivityViews___block_invoke;
            v25[3] = &unk_264542B68;
            v25[4] = v11;
            [MEMORY[0x263F82E00] performWithoutAnimation:v25];
            self = v10;
            [(FCUIActivityListContentView *)v10 addSubview:v11];
            if (objc_opt_respondsToSelector()) {
              [v11 setAdjustsFontForContentSizeCategory:v10->_adjustsFontForContentSizeCategory];
            }
          }
          ++v9;
        }
        while (v9 != v8);
        uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);
    }

    objc_storeStrong((id *)p_activityViews, v21);
    outgoingActivityViews = self->_outgoingActivityViews;
    if (!outgoingActivityViews)
    {
      v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v19 = self->_outgoingActivityViews;
      self->_outgoingActivityViews = v18;

      outgoingActivityViews = self->_outgoingActivityViews;
    }
    [(NSMutableArray *)outgoingActivityViews addObjectsFromArray:v6];
    [(FCUIActivityListContentView *)self setNeedsLayout];

    id v5 = v22;
  }
}

uint64_t __48__FCUIActivityListContentView_setActivityViews___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (void)setCompactActivityView:(id)a3
{
  id v4 = a3;
  if (-[NSArray containsObject:](self->_activityViews, "containsObject:")) {
    [(FCUIActivityListContentView *)self bringSubviewToFront:v4];
  }
}

- (CGSize)sizeThatFitsCollapsedToPill:(CGSize)a3
{
  -[FCUIActivityListContentView _sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:](self, "_sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:", 1, 1, 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)subviewFramesInBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v85 = *MEMORY[0x263EF8340];
  uint64_t v8 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  -[FCUIActivityListContentView _sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:](self, "_sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:", 0, !self->_footerPinnedToBottom, 0, width, height);
  v87.origin.CGFloat x = x;
  v87.origin.CGFloat y = y;
  v87.size.double width = width;
  v87.size.double height = height;
  CGRectGetWidth(v87);
  BSRectWithSize();
  BOOL footerPinnedToBottom = self->_footerPinnedToBottom;
  double v71 = *MEMORY[0x263F001B0];
  double v69 = *(double *)(MEMORY[0x263F001B0] + 8);
  CGFloat v10 = v88.origin.x;
  CGFloat rect = v88.origin.y;
  CGFloat v74 = v88.size.width;
  double v11 = v88.size.height;
  double v12 = CGRectGetHeight(v88);
  v89.origin.CGFloat x = x;
  v89.origin.CGFloat y = y;
  v89.size.double width = width;
  double v76 = height;
  v89.size.double height = height;
  if (v12 >= CGRectGetHeight(v89))
  {
    BOOL v70 = 1;
    double v26 = v74;
    double v28 = height;
    double v25 = rect;
    CGFloat v27 = v10;
  }
  else
  {
    int v13 = !footerPinnedToBottom;
    if (self->_footerViewValid && self->_footerPinnedToBottom)
    {
      -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", width, height);
      double v71 = v14;
      double v16 = v15;
      v90.size.double height = v11 + v15 + 48.0;
      v90.origin.CGFloat x = v10;
      v90.origin.CGFloat y = rect;
      v90.size.double width = v74;
      double v17 = CGRectGetHeight(v90);
      v91.origin.CGFloat x = x;
      CGFloat v73 = y;
      v91.origin.CGFloat y = y;
      v91.size.double width = width;
      v91.size.double height = height;
      double v69 = v16;
      if (v17 >= CGRectGetHeight(v91)) {
        goto LABEL_9;
      }
      UIRectCenteredYInRectScale();
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v67 = v23;
      CGFloat v68 = v22;
      v92.origin.CGFloat x = x;
      v92.origin.CGFloat y = v73;
      v92.size.double width = width;
      v92.size.double height = height;
      v93.origin.CGFloat y = CGRectGetMaxY(v92) + -48.0 - v16;
      v93.origin.CGFloat x = 0.0;
      v93.size.double width = v71;
      v93.size.double height = v16;
      double MinY = CGRectGetMinY(v93);
      double v66 = v19;
      v94.origin.CGFloat x = v19;
      v94.origin.CGFloat y = v21;
      double v11 = v67;
      v94.size.double width = v68;
      v94.size.double height = v67;
      if (MinY <= CGRectGetMaxY(v94) + 48.0)
      {
LABEL_9:
        CGFloat y = v73;
        UIRectCenteredYInRectScale();
        CGFloat v27 = v31;
        double v11 = v32;
        int v13 = 1;
        double v28 = height;
      }
      else
      {
        double v25 = v21;
        double v26 = v68;
        CGFloat v27 = v66;
        double v28 = height;
        CGFloat y = v73;
      }
    }
    else
    {
      double v28 = height;
      UIRectCenteredYInRectScale();
      CGFloat v27 = v29;
      double v11 = v30;
    }
    BOOL v70 = v13 != 0;
  }
  CGFloat v33 = v27;
  CGFloat v34 = v25;
  CGFloat v75 = v26;
  CGFloat v35 = v11;
  double v36 = v11;
  double v37 = CGRectGetMinY(*(CGRect *)(&v25 - 1));
  v95.origin.CGFloat x = x;
  v95.origin.CGFloat y = y;
  v95.size.double width = width;
  v95.size.double height = v28;
  double v38 = CGRectGetWidth(v95);
  double v39 = width;
  if (self->_headerViewValid)
  {
    -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", width, v28);
    BSRectWithSize();
    v96.origin.CGFloat x = v27;
    v96.origin.CGFloat y = v34;
    v96.size.double width = v75;
    v96.size.double height = v35;
    CGRectGetMinY(v96);
    double v28 = v76;
    double v40 = width;
    UIRectCenteredXInRectScale();
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    *(double *)v83 = v41;
    *(double *)&v83[1] = v47;
    double v37 = v47 + 24.0;
    *(double *)&v83[2] = v43;
    *(double *)&v83[3] = v45;
    v48 = objc_msgSend(MEMORY[0x263F08D40], "valueWithBytes:objCType:", v83, "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
    [v8 setObject:v48 forKey:self->_headerView];
  }
  else
  {
    CGFloat v44 = v38;
    double v40 = v39;
    CGFloat v42 = 0.0;
    CGFloat v46 = 0.0;
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v49 = self->_activityViews;
  uint64_t v50 = [(NSArray *)v49 countByEnumeratingWithState:&v79 objects:v84 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v80 != v52) {
          objc_enumerationMutation(v49);
        }
        v54 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        v97.origin.CGFloat x = v42;
        v97.origin.CGFloat y = v37;
        v97.size.double width = v44;
        v97.size.double height = v46;
        CGRectGetMaxY(v97);
        objc_msgSend(v54, "sizeThatFits:", v40, v28);
        if (objc_opt_respondsToSelector()) {
          [v54 isContracted];
        }
        double v28 = v76;
        UIRectCenteredXInRectScale();
        CGFloat v42 = v55;
        CGFloat v44 = v56;
        CGFloat v46 = v57;
        double v37 = v58 + 12.0;
        *(double *)v78 = v55;
        *(double *)&v78[1] = v58;
        *(double *)&v78[2] = v56;
        *(double *)&v78[3] = v57;
        v59 = objc_msgSend(MEMORY[0x263F08D40], "valueWithBytes:objCType:", v78, "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
        [v8 setObject:v59 forKey:v54];
      }
      uint64_t v51 = [(NSArray *)v49 countByEnumeratingWithState:&v79 objects:v84 count:16];
    }
    while (v51);
  }

  if (self->_footerViewValid)
  {
    if (v70)
    {
      if (v71 == 0.0 && v69 == 0.0) {
        -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", v40, v28);
      }
      BSRectWithSize();
      v98.origin.CGFloat x = v42;
      v98.origin.CGFloat y = v37;
      v98.size.double width = v44;
      v98.size.double height = v46;
      CGRectGetMaxY(v98);
    }
    UIRectCenteredXInRectScale();
    v77[0] = v60;
    v77[1] = v61;
    v77[2] = v62;
    v77[3] = v63;
    v64 = objc_msgSend(MEMORY[0x263F08D40], "valueWithBytes:objCType:", v77, "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
    [v8 setObject:v64 forKey:self->_footerView];
  }
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[FCUIActivityListContentView _sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:](self, "_sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:", 0, 1, 0, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[FCUIActivityListContentView _sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:](self, "_sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:", 0, 1, 1, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  v77.receiver = self;
  v77.super_class = (Class)FCUIActivityListContentView;
  [(FCUIActivityListContentView *)&v77 layoutSubviews];
  if (!self->_contentDetached)
  {
    [(FCUIActivityListContentView *)self bounds];
    if (self->_collapsedSize.width == 0.0 && self->_collapsedSize.height == 0.0)
    {
      double v7 = *MEMORY[0x263F001A8];
      double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
      double v11 = -[FCUIActivityListContentView subviewFramesInBounds:](self, "subviewFramesInBounds:", v3, v4, v5, v6);
    }
    else
    {
      BSRectWithSize();
      uint64_t v54 = 0;
      UIRectCenteredXInRectScale();
      double v7 = v12;
      double v8 = v13;
      double v9 = v14;
      double v10 = v15;
      double v11 = 0;
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__FCUIActivityListContentView_layoutSubviews__block_invoke;
    aBlock[3] = &unk_264543088;
    id v16 = v11;
    double v73 = v7;
    double v74 = v8;
    double v75 = v9;
    double v76 = v10;
    id v71 = v16;
    v72 = self;
    double v17 = (void (**)(void *, UIView *))_Block_copy(aBlock);
    double v55 = v17;
    if (self->_headerViewValid)
    {
      v17[2](v17, self->_headerView);
    }
    else
    {
      int v18 = [MEMORY[0x263F82E00] _isInAnimationBlockWithAnimationsEnabled];
      headerView = self->_headerView;
      if (v18)
      {
        [(UIView *)headerView setAlpha:0.0];
      }
      else
      {
        [(UIView *)headerView removeFromSuperview];
        double v20 = self->_headerView;
        self->_headerView = 0;
      }
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    double v56 = self;
    CGFloat v21 = self->_activityViews;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v66 objects:v80 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v67 != v24) {
            objc_enumerationMutation(v21);
          }
          double v26 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          double v27 = v10;
          double v28 = v9;
          double v29 = v8;
          double v30 = v7;
          if (v16)
          {
            double v31 = [v16 objectForKey:*(void *)(*((void *)&v66 + 1) + 8 * i)];
            [v31 CGRectValue];
            double v30 = v32;
            double v29 = v33;
            double v28 = v34;
            double v27 = v35;
          }
          objc_msgSend(v26, "alpha", v54);
          if (v36 == 0.0)
          {
            v65[0] = MEMORY[0x263EF8330];
            v65[1] = 3221225472;
            v65[2] = __45__FCUIActivityListContentView_layoutSubviews__block_invoke_3;
            v65[3] = &unk_264542E38;
            v65[4] = v26;
            *(double *)&v65[5] = v30;
            *(double *)&v65[6] = v29;
            *(double *)&v65[7] = v28;
            *(double *)&v65[8] = v27;
            [MEMORY[0x263F82E00] performWithoutAnimation:v65];
          }
          else
          {
            objc_msgSend(v26, "setFrame:", v30, v29, v28, v27);
          }
          [v26 setAlpha:1.0];
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v66 objects:v80 count:16];
      }
      while (v23);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    double v37 = self->_outgoingActivityViews;
    uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v61 objects:v79 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v62;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v62 != v40) {
            objc_enumerationMutation(v37);
          }
          objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * j), "setAlpha:", 0.0, v54);
        }
        uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v61 objects:v79 count:16];
      }
      while (v39);
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    p_purgeableActivityViews = (id *)&v56->_purgeableActivityViews;
    double v43 = v56->_purgeableActivityViews;
    uint64_t v44 = [(NSArray *)v43 countByEnumeratingWithState:&v57 objects:v78 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v58;
      do
      {
        for (uint64_t k = 0; k != v45; ++k)
        {
          if (*(void *)v58 != v46) {
            objc_enumerationMutation(v43);
          }
          objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * k), "removeFromSuperview", v54);
        }
        uint64_t v45 = [(NSArray *)v43 countByEnumeratingWithState:&v57 objects:v78 count:16];
      }
      while (v45);
    }

    objc_storeStrong((id *)&v56->_purgeableActivityViews, v56->_outgoingActivityViews);
    outgoingActivityViews = v56->_outgoingActivityViews;
    v56->_outgoingActivityViews = 0;

    if (![*p_purgeableActivityViews count])
    {
      id v49 = *p_purgeableActivityViews;
      id *p_purgeableActivityViews = 0;
    }
    if (v56->_footerViewValid)
    {
      uint64_t v50 = v55;
      v55[2](v55, v56->_footerView);
    }
    else
    {
      int v51 = [MEMORY[0x263F82E00] _isInAnimationBlockWithAnimationsEnabled];
      footerView = v56->_footerView;
      uint64_t v50 = v55;
      if (v51)
      {
        [(UIView *)footerView setAlpha:0.0];
      }
      else
      {
        [(UIView *)footerView removeFromSuperview];
        v53 = v56->_footerView;
        v56->_footerView = 0;
      }
    }
  }
}

void __45__FCUIActivityListContentView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(void **)(a1 + 32);
  if (v4)
  {
    double v5 = [v4 objectForKey:v3];
    [v5 CGRectValue];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *(double *)(a1 + 48);
    double v9 = *(double *)(a1 + 56);
    double v11 = *(double *)(a1 + 64);
    double v13 = *(double *)(a1 + 72);
  }
  double v14 = [v3 superview];
  double v15 = *(void **)(a1 + 40);

  if (v14 == v15)
  {
    objc_msgSend(v3, "setFrame:", v7, v9, v11, v13);
  }
  else
  {
    [*(id *)(a1 + 40) addSubview:v3];
    id v16 = (void *)MEMORY[0x263F82E00];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __45__FCUIActivityListContentView_layoutSubviews__block_invoke_2;
    v18[3] = &unk_264542E38;
    id v17 = v3;
    id v19 = v17;
    double v20 = v7;
    double v21 = v9;
    double v22 = v11;
    double v23 = v13;
    [v16 performWithoutAnimation:v18];
    [v17 setAlpha:1.0];
  }
}

uint64_t __45__FCUIActivityListContentView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __45__FCUIActivityListContentView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategorCGFloat y = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v4 = [(FCUIActivityListContentView *)self _contentSizeCategoryAdjustingViews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = [(FCUIActivityListContentView *)self adjustsFontForContentSizeCategory];
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v4 = [(FCUIActivityListContentView *)self _contentSizeCategoryAdjustingViews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      int v7 = 0;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            int v7 = ([v10 adjustForContentSizeCategoryChange] | v7) & 1;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      LOBYTE(v7) = 0;
    }

    LOBYTE(v3) = v7 & 1;
  }
  return v3;
}

- (CGSize)_sizeThatFits:(CGSize)a3 collapsedToPill:(BOOL)a4 includingFooter:(BOOL)a5 forceMeasurement:(BOOL)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  double height = a3.height;
  double width = a3.width;
  uint64_t v32 = *MEMORY[0x263EF8340];
  double v11 = *MEMORY[0x263F001B0];
  double v12 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (a3.width != 0.0 || (a3.height == 0.0 ? (BOOL v13 = !a6) : (BOOL v13 = 0), !v13))
  {
    if (!a4)
    {
      if (self->_headerViewValid)
      {
        -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", a3.width, a3.height);
        double v12 = v12 + v14;
        if ([(NSArray *)self->_activityViews count]) {
          double v12 = v12 + 24.0;
        }
      }
      if (v6 && self->_footerViewValid)
      {
        -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", width, height);
        double v12 = v12 + v15 + 48.0;
      }
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v16 = self->_activityViews;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          double v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_msgSend(v21, "sizeThatFits:", width, height, (void)v27);
          if (v11 < v22) {
            double v11 = v22;
          }
          if (v7)
          {
            if (v12 < v23) {
              double v12 = v23;
            }
          }
          else
          {
            double v12 = v12 + v23;
            uint64_t v24 = [(NSArray *)self->_activityViews lastObject];

            if (v21 != v24) {
              double v12 = v12 + 12.0;
            }
          }
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v18);
    }
  }
  double v25 = v11;
  double v26 = v12;
  result.double height = v26;
  result.double width = v25;
  return result;
}

- (id)_contentSizeCategoryAdjustingViews
{
  BOOL v3 = (void *)[(NSArray *)self->_activityViews mutableCopy];
  double v4 = v3;
  if (self->_headerView) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_footerView) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (BOOL)isFooterPinnedToBottom
{
  return self->_footerPinnedToBottom;
}

- (void)setFooterPinnedToBottom:(BOOL)a3
{
  self->_BOOL footerPinnedToBottom = a3;
}

- (NSArray)activityViews
{
  return self->_activityViews;
}

- (FCUIActivityDisplaying)compactActivityView
{
  return self->_compactActivityView;
}

- (CGSize)collapsedSize
{
  double width = self->_collapsedSize.width;
  double height = self->_collapsedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCollapsedSize:(CGSize)a3
{
  self->_collapsedSize = a3;
}

- (BOOL)isContentDetached
{
  return self->_contentDetached;
}

- (void)setContentDetached:(BOOL)a3
{
  self->_contentDetached = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactActivityView, 0);
  objc_storeStrong((id *)&self->_activityViews, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_purgeableActivityViews, 0);
  objc_storeStrong((id *)&self->_outgoingActivityViews, 0);
}

@end