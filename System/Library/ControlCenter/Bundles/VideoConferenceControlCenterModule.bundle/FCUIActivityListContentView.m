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
- (FCUIActivityListContentView)initWithFrame:(CGRect)a3;
- (NSArray)activityViews;
- (RPCCUIActivityDisplaying)compactActivityView;
- (UIView)appNameView;
- (UIView)footerView;
- (UIView)headerView;
- (id)_contentSizeCategoryAdjustingViews;
- (id)subviewFramesInBounds:(CGRect)a3;
- (void)addVideoView;
- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)layoutSubviews;
- (void)removeVideoView;
- (void)setActivityViews:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAppNameView:(id)a3;
- (void)setCollapsedSize:(CGSize)a3;
- (void)setCompactActivityView:(id)a3;
- (void)setContentDetached:(BOOL)a3;
- (void)setFooterPinnedToBottom:(BOOL)a3;
- (void)setFooterView:(id)a3;
- (void)setHeaderView:(id)a3;
@end

@implementation FCUIActivityListContentView

- (FCUIActivityListContentView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FCUIActivityListContentView;
  v3 = -[FCUIActivityListContentView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    displayView = v3->_displayView;
    v3->_displayView = 0;
  }
  return v4;
}

- (void)setHeaderView:(id)a3
{
  id v5 = a3;
  p_headerView = (id *)&self->_headerView;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_super v7 = RPCCUILogModule;
    if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *p_headerView;
      *(_DWORD *)buf = 134218240;
      id v11 = v8;
      __int16 v12 = 2048;
      id v13 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "FCUIActivityListContentView activityListView setHeaderView previous=%p new=%p", buf, 0x16u);
    }
    if (v5)
    {
      [*p_headerView removeFromSuperview];
      objc_storeStrong((id *)&self->_headerView, a3);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1C82C;
      v9[3] = &unk_68F10;
      v9[4] = self;
      +[UIView performWithoutAnimation:v9];
      self->_headerViewValid = 1;
    }
    else
    {
      self->_headerViewValid = 0;
    }
    [(FCUIActivityListContentView *)self setNeedsLayout];
  }
}

- (void)setAppNameView:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    if (v5)
    {
      [(UIView *)self->_appNameView removeFromSuperview];
      objc_storeStrong((id *)&self->_appNameView, a3);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1C934;
      v6[3] = &unk_68F10;
      v6[4] = self;
      +[UIView performWithoutAnimation:v6];
      self->_appNameViewValid = 1;
    }
    else
    {
      self->_appNameViewValid = 0;
    }
    [(FCUIActivityListContentView *)self setNeedsLayout];
  }
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
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1CA3C;
      v6[3] = &unk_68F10;
      v6[4] = self;
      +[UIView performWithoutAnimation:v6];
      self->_footerViewValid = 1;
    }
    else
    {
      self->_footerViewValid = 0;
    }
    [(FCUIActivityListContentView *)self setNeedsLayout];
  }
}

- (void)setActivityViews:(id)a3
{
  id v5 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    p_activityViews = &self->_activityViews;
    id v21 = a3;
    id v6 = [(NSArray *)self->_activityViews mutableCopy];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v22 = v5;
    id obj = v5;
    id v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v24 = *(void *)v27;
      do
      {
        v9 = 0;
        do
        {
          v10 = self;
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v9);
          if ([v6 count])
          {
            uint64_t v12 = 0;
            while (1)
            {
              id v13 = [v6 objectAtIndex:v12];
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
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_1CD1C;
            v25[3] = &unk_68F10;
            v25[4] = v11;
            +[UIView performWithoutAnimation:v25];
            self = v10;
            [(FCUIActivityListContentView *)v10 addSubview:v11];
            if (objc_opt_respondsToSelector()) {
              [v11 setAdjustsFontForContentSizeCategory:v10->_adjustsFontForContentSizeCategory];
            }
          }
          v9 = (char *)v9 + 1;
        }
        while (v9 != v8);
        id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);
    }

    objc_storeStrong((id *)p_activityViews, v21);
    outgoingActivityViews = self->_outgoingActivityViews;
    if (!outgoingActivityViews)
    {
      v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v19 = self->_outgoingActivityViews;
      self->_outgoingActivityViews = v18;

      outgoingActivityViews = self->_outgoingActivityViews;
    }
    [(NSMutableArray *)outgoingActivityViews addObjectsFromArray:v6];
    [(FCUIActivityListContentView *)self setNeedsLayout];

    id v5 = v22;
  }
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
  id v7 = +[NSMapTable weakToStrongObjectsMapTable];
  id v8 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "FCUIActivityListContentView subviewFramesInBounds", buf, 2u);
  }
  -[FCUIActivityListContentView _sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:](self, "_sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:", 0, !self->_footerPinnedToBottom, 0, width, height);
  v101.origin.CGFloat x = x;
  v101.origin.CGFloat y = y;
  v101.size.double width = width;
  v101.size.double height = height;
  CGRectGetWidth(v101);
  BSRectWithSize();
  CGFloat v9 = v102.origin.x;
  CGFloat v10 = v102.origin.y;
  double v11 = v102.size.height;
  CGFloat v84 = v102.size.width;
  double v12 = CGRectGetHeight(v102);
  CGFloat v86 = x;
  v103.origin.CGFloat x = x;
  v103.origin.CGFloat y = y;
  v103.size.double width = width;
  v103.size.double height = height;
  if (v12 >= CGRectGetHeight(v103))
  {
    CGFloat v18 = x;
    CGFloat v26 = y;
    CGFloat v25 = v84;
  }
  else
  {
    if (self->_footerViewValid && self->_footerPinnedToBottom)
    {
      -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", width, height);
      CGFloat rect = v13;
      CGFloat v14 = v9;
      double v16 = v15;
      v104.size.double height = v11 + v15 + 36.0;
      v104.origin.CGFloat x = v14;
      v104.origin.CGFloat y = v10;
      v104.size.double width = v84;
      double v17 = CGRectGetHeight(v104);
      CGFloat v18 = v86;
      v105.origin.CGFloat y = y;
      v105.origin.CGFloat x = v86;
      v105.size.double width = width;
      v105.size.double height = height;
      if (v17 < CGRectGetHeight(v105))
      {
        UIRectCenteredYInRectScale();
        CGFloat v77 = v19;
        CGFloat v78 = v20;
        CGFloat v22 = v21;
        double v11 = v23;
        v106.origin.CGFloat x = v86;
        v106.origin.CGFloat y = y;
        v106.size.double width = width;
        v106.size.double height = height;
        v107.origin.CGFloat y = CGRectGetMaxY(v106) + -36.0 - v16;
        v107.origin.CGFloat x = 0.0;
        v107.size.double width = rect;
        v107.size.double height = v16;
        CGFloat v9 = v77;
        double MinY = CGRectGetMinY(v107);
        v108.origin.CGFloat x = v77;
        double recta = v22;
        v108.origin.CGFloat y = v22;
        v108.size.double width = v78;
        v108.size.double height = v11;
        if (MinY > CGRectGetMaxY(v108) + 36.0)
        {
          CGFloat v25 = v78;
          CGFloat v10 = recta;
          CGFloat v26 = y;
          goto LABEL_12;
        }
      }
    }
    else
    {
      CGFloat v18 = x;
    }
    CGFloat v26 = y;
    UIRectCenteredYInRectScale();
    CGFloat v9 = v27;
    CGFloat v10 = v28;
    CGFloat v25 = v29;
    double v11 = v30;
  }
LABEL_12:
  CGFloat v83 = v11;
  v109.origin.CGFloat x = v9;
  v109.origin.CGFloat y = v10;
  v109.size.double width = v25;
  v109.size.double height = v11;
  double v31 = CGRectGetMinY(v109);
  v110.origin.CGFloat x = v18;
  v110.origin.CGFloat y = v26;
  v110.size.double width = width;
  v110.size.double height = height;
  double v32 = CGRectGetWidth(v110);
  CGFloat v85 = v25;
  CGFloat v81 = v10;
  CGFloat v82 = v9;
  if (self->_appNameViewValid)
  {
    -[UIView sizeThatFits:](self->_appNameView, "sizeThatFits:", width, height);
    BSRectWithSize();
    v111.origin.CGFloat x = v9;
    v111.origin.CGFloat y = v10;
    v111.size.double width = v25;
    CGFloat v33 = v83;
    v111.size.double height = v83;
    CGRectGetMinY(v111);
    UIRectCenteredXInRectScale();
    CGFloat v35 = v34;
    double v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    v42 = (void *)RPCCUILogModule;
    if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v42;
      v112.origin.CGFloat x = v35;
      v112.origin.CGFloat y = v37;
      v112.size.double width = v39;
      v112.size.double height = v41;
      v44 = NSStringFromCGRect(v112);
      *(_DWORD *)buf = 138412290;
      v99 = v44;
      _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "FCUIActivityListContentView subviewFramesInBounds appViewFrame=%@", buf, 0xCu);
    }
    double v45 = v37;
    double v31 = v37 + -50.0;
    *(CGFloat *)v96 = v35;
    *(double *)&v96[1] = v45;
    *(CGFloat *)&v96[2] = v39;
    *(CGFloat *)&v96[3] = v41;
    v46 = +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v96, "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
    [v7 setObject:v46 forKey:self->_appNameView];
  }
  else
  {
    CGFloat v39 = v32;
    CGFloat v41 = 0.0;
    CGFloat v35 = 0.0;
    CGFloat v33 = v83;
  }
  if (self->_footerViewValid)
  {
    -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", width, height);
    BSRectWithSize();
    v113.origin.CGFloat y = v81;
    v113.origin.CGFloat x = v82;
    v113.size.double width = v85;
    v113.size.double height = v33;
    CGRectGetMinY(v113);
    UIRectCenteredXInRectScale();
    CGFloat v35 = v47;
    double v49 = v48;
    CGFloat v39 = v50;
    CGFloat v41 = v51;
    v52 = (void *)RPCCUILogModule;
    if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
    {
      v53 = v52;
      v114.origin.CGFloat x = v35;
      v114.origin.CGFloat y = v49;
      v114.size.double width = v39;
      v114.size.double height = v41;
      v54 = NSStringFromCGRect(v114);
      *(_DWORD *)buf = 138412290;
      v99 = v54;
      _os_log_impl(&dword_0, v53, OS_LOG_TYPE_DEFAULT, "FCUIActivityListContentView subviewFramesInBounds footerViewFrame=%@", buf, 0xCu);
    }
    double v31 = v49 + -24.0;
    *(CGFloat *)v95 = v35;
    *(double *)&v95[1] = v49;
    *(CGFloat *)&v95[2] = v39;
    *(CGFloat *)&v95[3] = v41;
    v55 = +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v95, "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
    [v7 setObject:v55 forKey:self->_footerView];

    CGFloat v33 = v83;
  }
  if (self->_headerViewValid)
  {
    -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", width, height);
    BSRectWithSize();
    v115.origin.CGFloat y = v81;
    v115.origin.CGFloat x = v82;
    v115.size.double width = v85;
    v115.size.double height = v33;
    CGRectGetMinY(v115);
    UIRectCenteredXInRectScale();
    CGFloat v35 = v56;
    double v58 = v57;
    CGFloat v39 = v59;
    CGFloat v41 = v60;
    v61 = (void *)RPCCUILogModule;
    if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
    {
      v62 = v61;
      v116.origin.CGFloat x = v35;
      v116.origin.CGFloat y = v58;
      v116.size.double width = v39;
      v116.size.double height = v41;
      v63 = NSStringFromCGRect(v116);
      *(_DWORD *)buf = 138412290;
      v99 = v63;
      _os_log_impl(&dword_0, v62, OS_LOG_TYPE_DEFAULT, "FCUIActivityListContentView subviewFramesInBounds headerViewFrame=%@", buf, 0xCu);
    }
    v94[0] = _NSConcreteStackBlock;
    double v31 = v58 + 24.0;
    v94[1] = 3221225472;
    v94[2] = sub_1D6A0;
    v94[3] = &unk_69358;
    v94[4] = self;
    *(CGFloat *)&v94[5] = v35;
    *(double *)&v94[6] = v58;
    *(CGFloat *)&v94[7] = v39;
    *(CGFloat *)&v94[8] = v41;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v94, 0);
    *(CGFloat *)v93 = v35;
    *(double *)&v93[1] = v58;
    *(CGFloat *)&v93[2] = v39;
    *(CGFloat *)&v93[3] = v41;
    v64 = +[NSValue valueWithBytes:v93 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    [v7 setObject:v64 forKey:self->_headerView];
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  v65 = self->_activityViews;
  id v66 = [(NSArray *)v65 countByEnumeratingWithState:&v89 objects:v97 count:16];
  if (v66)
  {
    id v67 = v66;
    uint64_t v68 = *(void *)v90;
    do
    {
      for (i = 0; i != v67; i = (char *)i + 1)
      {
        if (*(void *)v90 != v68) {
          objc_enumerationMutation(v65);
        }
        v70 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        v117.origin.CGFloat x = v35;
        v117.origin.CGFloat y = v31;
        v117.size.double width = v39;
        v117.size.double height = v41;
        CGRectGetMaxY(v117);
        objc_msgSend(v70, "sizeThatFits:", width, height);
        if (objc_opt_respondsToSelector()) {
          [v70 isContracted];
        }
        UIRectCenteredXInRectScale();
        CGFloat v35 = v71;
        CGFloat v39 = v72;
        CGFloat v41 = v73;
        double v31 = v74 + 12.0;
        *(double *)v88 = v71;
        *(double *)&v88[1] = v74;
        *(double *)&v88[2] = v72;
        *(double *)&v88[3] = v73;
        v75 = +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v88, "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
        [v7 setObject:v75 forKey:v70];
      }
      id v67 = [(NSArray *)v65 countByEnumeratingWithState:&v89 objects:v97 count:16];
    }
    while (v67);
  }

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v6 = (void *)RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG)) {
    sub_4ADC4(v6, width, height);
  }
  -[FCUIActivityListContentView _sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:](self, "_sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:", 0, 1, 0, width, height);
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG)) {
    sub_4AE6C();
  }
  -[FCUIActivityListContentView _sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:](self, "_sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:", 0, 1, 1, CGSizeZero.width, CGSizeZero.height);
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "FCUIActivityListContentView layoutSubviews", buf, 2u);
  }
  v83.receiver = self;
  v83.super_class = (Class)FCUIActivityListContentView;
  [(FCUIActivityListContentView *)&v83 layoutSubviews];
  if (!self->_contentDetached)
  {
    [(FCUIActivityListContentView *)self bounds];
    if (self->_collapsedSize.width == 0.0 && self->_collapsedSize.height == 0.0)
    {
      CGFloat x = CGRectZero.origin.x;
      CGFloat y = CGRectZero.origin.y;
      CGFloat width = CGRectZero.size.width;
      CGFloat height = CGRectZero.size.height;
      double v12 = -[FCUIActivityListContentView subviewFramesInBounds:](self, "subviewFramesInBounds:", v4, v5, v6, v7);
    }
    else
    {
      BSRectWithSize();
      uint64_t v60 = 0;
      UIRectCenteredXInRectScale();
      CGFloat x = v13;
      CGFloat y = v14;
      CGFloat width = v15;
      CGFloat height = v16;
      double v12 = 0;
    }
    double v17 = (void *)RPCCUILogModule;
    if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG)) {
      sub_4AF70(v17, v12);
    }
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1DE6C;
    v76[3] = &unk_694F8;
    id v18 = v12;
    CGFloat v79 = x;
    CGFloat v80 = y;
    CGFloat v81 = width;
    CGFloat v82 = height;
    id v77 = v18;
    CGFloat v78 = self;
    double v19 = objc_retainBlock(v76);
    BOOL headerViewValid = self->_headerViewValid;
    BOOL v21 = os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG);
    v61 = (void (**)(void, void))v19;
    if (headerViewValid)
    {
      if (v21) {
        sub_4AF3C();
      }
      ((void (*)(void *, UIView *))v19[2])(v19, self->_headerView);
    }
    else
    {
      if (v21) {
        sub_4AF08();
      }
      unsigned int v22 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
      headerView = self->_headerView;
      if (v22)
      {
        [(UIView *)headerView setAlpha:0.0];
      }
      else
      {
        [(UIView *)headerView removeFromSuperview];
        uint64_t v24 = self->_headerView;
        self->_headerView = 0;
      }
    }
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v62 = self;
    CGFloat v25 = self->_activityViews;
    id v26 = [(NSArray *)v25 countByEnumeratingWithState:&v72 objects:v87 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v73;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v73 != v28) {
            objc_enumerationMutation(v25);
          }
          double v30 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          double v31 = height;
          double v32 = width;
          double v33 = y;
          double v34 = x;
          if (v18)
          {
            CGFloat v35 = [v18 objectForKey:*(void *)(*((void *)&v72 + 1) + 8 * i)];
            [v35 CGRectValue];
            double v34 = v36;
            double v33 = v37;
            double v32 = v38;
            double v31 = v39;
          }
          objc_msgSend(v30, "alpha", v60);
          if (v40 == 0.0)
          {
            v71[0] = _NSConcreteStackBlock;
            v71[1] = 3221225472;
            v71[2] = sub_1E118;
            v71[3] = &unk_69358;
            v71[4] = v30;
            *(double *)&v71[5] = v34;
            *(double *)&v71[6] = v33;
            *(double *)&v71[7] = v32;
            *(double *)&v71[8] = v31;
            +[UIView performWithoutAnimation:v71];
          }
          else
          {
            objc_msgSend(v30, "setFrame:", v34, v33, v32, v31);
          }
          [v30 setAlpha:1.0];
        }
        id v27 = [(NSArray *)v25 countByEnumeratingWithState:&v72 objects:v87 count:16];
      }
      while (v27);
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    CGFloat v41 = v62->_outgoingActivityViews;
    id v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v67 objects:v86 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v68;
      do
      {
        for (j = 0; j != v43; j = (char *)j + 1)
        {
          if (*(void *)v68 != v44) {
            objc_enumerationMutation(v41);
          }
          objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * (void)j), "setAlpha:", 0.0, v60);
        }
        id v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v67 objects:v86 count:16];
      }
      while (v43);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    p_purgeableActivityViews = (id *)&v62->_purgeableActivityViews;
    double v47 = v62->_purgeableActivityViews;
    id v48 = [(NSArray *)v47 countByEnumeratingWithState:&v63 objects:v85 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v64;
      do
      {
        for (k = 0; k != v49; k = (char *)k + 1)
        {
          if (*(void *)v64 != v50) {
            objc_enumerationMutation(v47);
          }
          objc_msgSend(*(id *)(*((void *)&v63 + 1) + 8 * (void)k), "removeFromSuperview", v60);
        }
        id v49 = [(NSArray *)v47 countByEnumeratingWithState:&v63 objects:v85 count:16];
      }
      while (v49);
    }

    objc_storeStrong((id *)&v62->_purgeableActivityViews, v62->_outgoingActivityViews);
    outgoingActivityViews = v62->_outgoingActivityViews;
    v62->_outgoingActivityViews = 0;

    if (![*p_purgeableActivityViews count])
    {
      id v53 = *p_purgeableActivityViews;
      id *p_purgeableActivityViews = 0;
    }
    if (v62->_footerViewValid)
    {
      if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG)) {
        sub_4AED4();
      }
      ((void (**)(void, UIView *))v61)[2](v61, v62->_footerView);
    }
    else
    {
      unsigned int v54 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
      footerView = v62->_footerView;
      if (v54)
      {
        [(UIView *)footerView setAlpha:0.0];
      }
      else
      {
        [(UIView *)footerView removeFromSuperview];
        double v56 = v62->_footerView;
        v62->_footerView = 0;
      }
    }
    if (v62->_appNameViewValid)
    {
      if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG)) {
        sub_4AEA0();
      }
      ((void (**)(void, UIView *))v61)[2](v61, v62->_appNameView);
    }
    else
    {
      unsigned int v57 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
      appNameView = v62->_appNameView;
      if (v57)
      {
        [(UIView *)appNameView setAlpha:0.0];
      }
      else
      {
        [(UIView *)appNameView removeFromSuperview];
        double v59 = v62->_appNameView;
        v62->_appNameView = 0;
      }
    }
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategorCGFloat y = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v4 = [(FCUIActivityListContentView *)self _contentSizeCategoryAdjustingViews];
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        double v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          CGFloat v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
          if (objc_opt_respondsToSelector()) {
            [v9 setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
          }
          double v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(FCUIActivityListContentView *)self adjustsFontForContentSizeCategory];
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v4 = [(FCUIActivityListContentView *)self _contentSizeCategoryAdjustingViews];
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      unsigned int v7 = 0;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            unsigned int v7 = ([v10 adjustForContentSizeCategoryChange] | v7) & 1;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  double height = a3.height;
  double width = a3.width;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG)) {
    sub_4B00C();
  }
  double v12 = CGSizeZero.width;
  double v13 = CGSizeZero.height;
  if (width != 0.0 || height != 0.0 || v6)
  {
    BOOL v32 = v6;
    if (!v8)
    {
      if (self->_headerViewValid)
      {
        -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", width, height);
        double v13 = v13 + v14;
        if ([(NSArray *)self->_activityViews count]) {
          double v13 = v13 + 24.0;
        }
      }
      if (v7 && self->_footerViewValid)
      {
        -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", width, height);
        double v13 = v13 + v15 + 36.0;
      }
    }
    BOOL v16 = v7;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    double v17 = self->_activityViews;
    id v18 = [(NSArray *)v17 countByEnumeratingWithState:&v33 objects:v47 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v34;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v17);
          }
          unsigned int v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          objc_msgSend(v22, "sizeThatFits:", width, height);
          if (v12 < v23) {
            double v12 = v23;
          }
          if (v8)
          {
            if (v13 < v24) {
              double v13 = v24;
            }
          }
          else
          {
            double v13 = v13 + v24;
            CGFloat v25 = [(NSArray *)self->_activityViews lastObject];

            if (v22 != v25) {
              double v13 = v13 + 12.0;
            }
          }
        }
        id v19 = [(NSArray *)v17 countByEnumeratingWithState:&v33 objects:v47 count:16];
      }
      while (v19);
    }

    BOOL v7 = v16;
    BOOL v6 = v32;
  }
  id v26 = (void *)RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG))
  {
    double v29 = v26;
    v48.double width = v12;
    v48.double height = v13;
    double v30 = NSStringFromCGSize(v48);
    v49.double width = width;
    v49.double height = height;
    double v31 = NSStringFromCGSize(v49);
    *(_DWORD *)buf = 138413314;
    double v38 = v30;
    __int16 v39 = 2112;
    double v40 = v31;
    __int16 v41 = 1024;
    BOOL v42 = v8;
    __int16 v43 = 1024;
    BOOL v44 = v7;
    __int16 v45 = 1024;
    BOOL v46 = v6;
    _os_log_debug_impl(&dword_0, v29, OS_LOG_TYPE_DEBUG, "FCUIActivityListContentView sizeThatFits=%@, OGsize=%@ collapsedToPill=%d includeFooter=%d forceMeasurement=%d", buf, 0x28u);
  }
  double v27 = v12;
  double v28 = v13;
  result.double height = v28;
  result.double width = v27;
  return result;
}

- (id)_contentSizeCategoryAdjustingViews
{
  id v3 = [(NSArray *)self->_activityViews mutableCopy];
  double v4 = v3;
  if (self->_headerView) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_footerView) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_appNameView) {
    objc_msgSend(v4, "addObject:");
  }

  return v4;
}

- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  displayView = self->_displayView;
  if (displayView)
  {
    BOOL v6 = [(RPCCUIVideoView *)displayView layer];
    BOOL v7 = (char *)[v6 status];

    if (v7 == (unsigned char *)&dword_0 + 2)
    {
      id v8 = [(RPCCUIVideoView *)self->_displayView layer];
      [v8 flush];
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1E888;
      block[3] = &unk_69520;
      block[4] = self;
      block[5] = a3;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)addVideoView
{
  id v3 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "FCUIActivityListContentView addVideoview", v7, 2u);
  }
  double v4 = objc_alloc_init(RPCCUIVideoView);
  displayView = self->_displayView;
  self->_displayView = v4;

  -[RPCCUIVideoView setFrame:](self->_displayView, "setFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  BOOL v6 = [(RPCCUIVideoView *)self->_displayView layer];
  [v6 setVideoGravity:AVLayerVideoGravityResizeAspectFill];

  [(RPCCUIVideoView *)self->_displayView setAutoresizingMask:18];
  [(RPCCUIVideoView *)self->_displayView _setContinuousCornerRadius:37.0];
  [(FCUIActivityListContentView *)self addSubview:self->_displayView];
}

- (void)removeVideoView
{
  id v3 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "FCUIActivityListContentView removeVideoview", v5, 2u);
  }
  [(RPCCUIVideoView *)self->_displayView flushVideoView];
  [(RPCCUIVideoView *)self->_displayView removeFromSuperview];
  displayView = self->_displayView;
  self->_displayView = 0;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (UIView)appNameView
{
  return self->_appNameView;
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
  self->_footerPinnedToBottom = a3;
}

- (NSArray)activityViews
{
  return self->_activityViews;
}

- (RPCCUIActivityDisplaying)compactActivityView
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
  objc_storeStrong((id *)&self->_appNameView, 0);
  objc_storeStrong((id *)&self->_displayView, 0);
  objc_storeStrong((id *)&self->_purgeableActivityViews, 0);

  objc_storeStrong((id *)&self->_outgoingActivityViews, 0);
}

@end