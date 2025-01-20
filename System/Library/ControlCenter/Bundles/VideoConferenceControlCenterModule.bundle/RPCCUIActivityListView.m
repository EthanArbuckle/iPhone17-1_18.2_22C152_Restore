@interface RPCCUIActivityListView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isFooterPinnedToBottom;
- (BOOL)touchesShouldCancelInContentView:(id)a3;
- (CGRect)_contentViewFrameForContentSize:(CGSize)a3 inBounds:(CGRect)a4;
- (CGRect)_setContractedFrame:(CGRect)a3 viaResizeWithRepresentedActivity:(id)a4 transitionCoordinator:(id)a5;
- (CGRect)_setContractedFrame:(CGRect)a3 viaScaleWithRepresentedActivity:(id)a4 transitionCoordinator:(id)a5;
- (CGRect)_setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 representedActivity:(id)a5 anchorActivityView:(id)a6 collapsedSizeBlock:(id)a7 preludeBlock:(id)a8 activityViewAnimationBlock:(id)a9 transitionCoordinator:(id)a10;
- (CGRect)_setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 viaResizeWithRepresentedActivity:(id)a5 transitionCoordinator:(id)a6;
- (CGRect)_setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 viaScaleWithRepresentedActivity:(id)a5 transitionCoordinator:(id)a6;
- (CGRect)setContractedFrame:(CGRect)a3 representedActivity:(id)a4 presentationStyle:(int64_t)a5 transitionCoordinator:(id)a6;
- (CGRect)setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 representedActivity:(id)a5 presentationStyle:(int64_t)a6 transitionCoordinator:(id)a7;
- (CGSize)_contentSizeForBounds:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)activityViews;
- (RPCCUIActivityListView)initWithFrame:(CGRect)a3;
- (UIView)appNameView;
- (UIView)footerView;
- (UIView)headerView;
- (id)_activityViewForRepresentedActivity:(id)a3;
- (id)_orderedSubviewsIncludingHeader:(BOOL)a3 andFooter:(BOOL)a4;
- (void)_configureContentViewIfNecessary;
- (void)_invalidateContentSize;
- (void)_recalculateContentSize;
- (void)addVideoView;
- (void)endIsolation;
- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)isolateActivityView:(id)a3 withInset:(UIEdgeInsets)a4;
- (void)layoutSubviews;
- (void)removeVideoView;
- (void)setActivityViews:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAppNameView:(id)a3;
- (void)setFooterPinnedToBottom:(BOOL)a3;
- (void)setFooterView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHeaderView:(id)a3;
- (void)setNeedsLayout;
- (void)toggleExpandedActivityView:(id)a3 withTransitionCoordinator:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation RPCCUIActivityListView

- (RPCCUIActivityListView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RPCCUIActivityListView;
  v3 = -[RPCCUIActivityListView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(RPCCUIActivityListView *)v3 setClipsToBounds:0];
    [(RPCCUIActivityListView *)v4 setAlwaysBounceVertical:1];
    [(RPCCUIActivityListView *)v4 setShowsVerticalScrollIndicator:0];
    [(RPCCUIActivityListView *)v4 setShowsHorizontalScrollIndicator:0];
    [(RPCCUIActivityListView *)v4 setScrollEnabled:0];
    [(RPCCUIActivityListView *)v4 setAccessibilityIdentifier:@"focus-modes-ui"];
    v5 = (void *)RPCCUILogModule;
    if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      [(RPCCUIActivityListView *)v4 frame];
      v7 = NSStringFromCGRect(v12);
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "ActivityListView initWithframe=%@", buf, 0xCu);
    }
    v4->_footerPinnedToBottom = 1;
  }
  return v4;
}

- (void)viewDidLoad
{
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG)) {
    sub_4AB64();
  }
}

- (NSArray)activityViews
{
  return [(FCUIActivityListContentView *)self->_contentView activityViews];
}

- (void)setActivityViews:(id)a3
{
  id v6 = a3;
  v4 = [(RPCCUIActivityListView *)self activityViews];
  char v5 = BSEqualArrays();

  if ((v5 & 1) == 0)
  {
    [(RPCCUIActivityListView *)self _configureContentViewIfNecessary];
    [(FCUIActivityListContentView *)self->_contentView setActivityViews:v6];
    [(RPCCUIActivityListView *)self _invalidateContentSize];
    [(FCUIActivityListContentView *)self->_contentView setNeedsLayout];
  }
}

- (UIView)headerView
{
  return [(FCUIActivityListContentView *)self->_contentView headerView];
}

- (void)setHeaderView:(id)a3
{
  id v4 = a3;
  char v5 = [(RPCCUIActivityListView *)self headerView];
  char v6 = BSEqualObjects();

  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG))
    {
      sub_4AB98();
      if (!v4) {
        goto LABEL_5;
      }
    }
    else if (!v4)
    {
LABEL_5:
      [(FCUIActivityListContentView *)self->_contentView setHeaderView:v4];
      [(RPCCUIActivityListView *)self _invalidateContentSize];
      goto LABEL_6;
    }
    [(RPCCUIActivityListView *)self _configureContentViewIfNecessary];
    goto LABEL_5;
  }
LABEL_6:
}

- (UIView)footerView
{
  return [(FCUIActivityListContentView *)self->_contentView footerView];
}

- (UIView)appNameView
{
  return [(FCUIActivityListContentView *)self->_contentView appNameView];
}

- (void)setAppNameView:(id)a3
{
  id v7 = a3;
  id v4 = [(RPCCUIActivityListView *)self appNameView];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    id v6 = v7;
    if (v7)
    {
      [(RPCCUIActivityListView *)self _configureContentViewIfNecessary];
      id v6 = v7;
    }
    [(FCUIActivityListContentView *)self->_contentView setAppNameView:v6];
    [(RPCCUIActivityListView *)self _invalidateContentSize];
  }
}

- (void)setFooterView:(id)a3
{
  id v7 = a3;
  id v4 = [(RPCCUIActivityListView *)self footerView];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    id v6 = v7;
    if (v7)
    {
      [(RPCCUIActivityListView *)self _configureContentViewIfNecessary];
      id v6 = v7;
    }
    [(FCUIActivityListContentView *)self->_contentView setFooterView:v6];
    [(RPCCUIActivityListView *)self _invalidateContentSize];
  }
}

- (void)setFooterPinnedToBottom:(BOOL)a3
{
  if (self->_footerPinnedToBottom != a3)
  {
    self->_footerPinnedToBottom = a3;
    -[FCUIActivityListContentView setFooterPinnedToBottom:](self->_contentView, "setFooterPinnedToBottom:");
    [(RPCCUIActivityListView *)self _invalidateContentSize];
  }
}

- (CGRect)_setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 representedActivity:(id)a5 anchorActivityView:(id)a6 collapsedSizeBlock:(id)a7 preludeBlock:(id)a8 activityViewAnimationBlock:(id)a9 transitionCoordinator:(id)a10
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v105 = a5;
  id v100 = a6;
  id v20 = a7;
  v107 = (void (**)(double, double))a8;
  v21 = (void (**)(id, uint64_t, int64_t, void *, double, double, double, double, double, double, double, double))a9;
  id v22 = a10;
  [(RPCCUIActivityListView *)self _configureContentViewIfNecessary];
  contentView = self->_contentView;
  BSRectWithSize();
  -[RPCCUIActivityListView _contentSizeForBounds:](self, "_contentSizeForBounds:");
  double v25 = v24;
  double v27 = v26;
  BSRectWithSize();
  -[RPCCUIActivityListView _contentViewFrameForContentSize:inBounds:](self, "_contentViewFrameForContentSize:inBounds:", v25, v27, v28, v29, v30, v31);
  v110 = -[FCUIActivityListContentView subviewFramesInBounds:](contentView, "subviewFramesInBounds:");
  v32 = [(FCUIActivityListContentView *)self->_contentView activityViews];
  v108 = v22;
  [v22 transitionDuration];
  double v34 = v33;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id obj = v32;
  id v35 = [obj countByEnumeratingWithState:&v125 objects:v130 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v126;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v126 != v37) {
          objc_enumerationMutation(obj);
        }
        if (v34 > 0.0)
        {
          v39 = *(void **)(*((void *)&v125 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            v40 = v39;
          }
          else {
            v40 = 0;
          }
          id v41 = v40;
          BSRectWithSize();
          objc_msgSend(v41, "willPresent:withTargetContainerBounds:transitionCoordinator:", 1, v108);
        }
      }
      id v36 = [obj countByEnumeratingWithState:&v125 objects:v130 count:16];
    }
    while (v36);
  }

  v123[0] = _NSConcreteStackBlock;
  v123[1] = 3221225472;
  v123[2] = sub_1A294;
  v123[3] = &unk_691A0;
  id v103 = v105;
  id v124 = v103;
  uint64_t v42 = objc_msgSend(obj, "bs_firstObjectPassingTest:", v123);
  [(FCUIActivityListContentView *)self->_contentView setCompactActivityView:v42];
  id v43 = [obj mutableCopy];
  v44 = [(FCUIActivityListContentView *)self->_contentView headerView];

  if (v44)
  {
    v45 = [(FCUIActivityListContentView *)self->_contentView headerView];
    [v43 insertObject:v45 atIndex:0];
  }
  v46 = [(FCUIActivityListContentView *)self->_contentView footerView];
  v47 = v46;
  if (v46)
  {
    v121[0] = _NSConcreteStackBlock;
    v121[1] = 3221225472;
    v121[2] = sub_1A304;
    v121[3] = &unk_68F10;
    id v122 = v46;
    +[UIView performWithoutAnimation:v121];
  }
  v99 = v47;
  v106 = v20;
  double v48 = (*((double (**)(id))v20 + 2))(v20);
  double v50 = v49;
  -[FCUIActivityListContentView setCollapsedSize:](self->_contentView, "setCollapsedSize:");
  v107[2](v48, v50);
  -[RPCCUIActivityListView setFrame:](self, "setFrame:", x, y, width, height);
  [(RPCCUIActivityListView *)self _recalculateContentSize];
  -[FCUIActivityListContentView setCollapsedSize:](self->_contentView, "setCollapsedSize:", CGSizeZero.width, CGSizeZero.height);
  v120[0] = _NSConcreteStackBlock;
  v120[1] = 3221225472;
  v120[2] = sub_1A310;
  v120[3] = &unk_69378;
  double v104 = v34;
  *(double *)&v120[4] = v34;
  v51 = objc_retainBlock(v120);
  v102 = (void *)v42;
  if (v100) {
    v52 = v100;
  }
  else {
    v52 = (void *)v42;
  }
  id v53 = v52;

  v54 = [v43 indexOfObject:v53];
  v101 = v53;
  v55 = [v110 objectForKey:v53];
  [v55 CGRectValue];
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;

  long long v119 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v116 = 0u;
  id v64 = v43;
  id v65 = [v64 countByEnumeratingWithState:&v116 objects:v129 count:16];
  if (v65)
  {
    id v66 = v65;
    uint64_t v67 = *(void *)v117;
    do
    {
      for (j = 0; j != v66; j = (char *)j + 1)
      {
        if (*(void *)v117 != v67) {
          objc_enumerationMutation(v64);
        }
        uint64_t v69 = *(void *)(*((void *)&v116 + 1) + 8 * (void)j);
        v70 = [v110 objectForKey:v69];
        [v70 CGRectValue];
        double v72 = v71;
        double v74 = v73;
        double v76 = v75;
        double v78 = v77;

        v79 = [v64 indexOfObject:v69];
        if (v54 - v79 >= 0) {
          int64_t v80 = v54 - v79;
        }
        else {
          int64_t v80 = v79 - v54;
        }
        v21[2](v21, v69, v80, v51, v72, v74, v76, v78, v57, v59, v61, v63);
      }
      id v66 = [v64 countByEnumeratingWithState:&v116 objects:v129 count:16];
    }
    while (v66);
  }

  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472;
  v113[2] = sub_1A418;
  v113[3] = &unk_69088;
  id v81 = v99;
  id v114 = v81;
  id v82 = v110;
  id v115 = v82;
  v83 = objc_retainBlock(v113);
  v84 = v83;
  if (v104 <= 0.0)
  {
    ((void (*)(void *, double))v83[2])(v83, v104);
    v85 = v108;
  }
  else
  {
    v111[0] = _NSConcreteStackBlock;
    v111[1] = 3221225472;
    v111[2] = sub_1A524;
    v111[3] = &unk_693A0;
    v112 = v83;
    v85 = v108;
    [v108 animateAlongsideTransition:0 completion:v111];
  }
  v86 = [v102 superview];
  [v102 frame];
  objc_msgSend(v86, "convertRect:toView:", 0);
  double v88 = v87;
  double v90 = v89;
  double v92 = v91;
  double v94 = v93;

  double v95 = v88;
  double v96 = v90;
  double v97 = v92;
  double v98 = v94;
  result.size.double height = v98;
  result.size.double width = v97;
  result.origin.double y = v96;
  result.origin.double x = v95;
  return result;
}

- (CGRect)_setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 viaScaleWithRepresentedActivity:(id)a5 transitionCoordinator:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v11 = a3.size.height;
  double v12 = a3.size.width;
  double v13 = a3.origin.y;
  double v14 = a3.origin.x;
  id v16 = a5;
  id v17 = a6;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x5010000000;
  v33[3] = "";
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1A774;
  v32[3] = &unk_693C8;
  v32[4] = self;
  *(double *)&v32[5] = v14;
  *(double *)&v32[6] = v13;
  *(double *)&v32[7] = v12;
  *(double *)&v32[8] = v11;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1A790;
  v31[3] = &unk_693F0;
  *(double *)&v31[6] = x;
  *(double *)&v31[7] = y;
  *(double *)&v31[8] = width;
  *(double *)&v31[9] = height;
  v31[4] = self;
  v31[5] = v33;
  *(double *)&v31[10] = v14;
  *(double *)&v31[11] = v13;
  *(double *)&v31[12] = v12;
  *(double *)&v31[13] = v11;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1A8C0;
  v30[3] = &unk_69440;
  *(double *)&v30[6] = x;
  *(double *)&v30[7] = y;
  *(double *)&v30[8] = width;
  *(double *)&v30[9] = height;
  v30[4] = self;
  v30[5] = v33;
  -[RPCCUIActivityListView _setExpandedFrame:initialFrame:representedActivity:anchorActivityView:collapsedSizeBlock:preludeBlock:activityViewAnimationBlock:transitionCoordinator:](self, "_setExpandedFrame:initialFrame:representedActivity:anchorActivityView:collapsedSizeBlock:preludeBlock:activityViewAnimationBlock:transitionCoordinator:", v16, 0, v32, v31, v30, v17, v14, v13, v12, v11, x, y, width, height);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  _Block_object_dispose(v33, 8);

  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (CGRect)_setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 viaResizeWithRepresentedActivity:(id)a5 transitionCoordinator:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1AC60;
  v14[3] = &unk_69460;
  CGRect v15 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1AC68;
  v12[3] = &unk_69488;
  v12[4] = self;
  CGRect v13 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1AD50;
  v10[3] = &unk_694A8;
  CGRect v11 = a4;
  -[RPCCUIActivityListView _setExpandedFrame:initialFrame:representedActivity:anchorActivityView:collapsedSizeBlock:preludeBlock:activityViewAnimationBlock:transitionCoordinator:](self, "_setExpandedFrame:initialFrame:representedActivity:anchorActivityView:collapsedSizeBlock:preludeBlock:activityViewAnimationBlock:transitionCoordinator:", a5, 0, v14, v12, v10, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (CGRect)setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 representedActivity:(id)a5 presentationStyle:(int64_t)a6 transitionCoordinator:(id)a7
{
  if (a6 == 1) {
    -[RPCCUIActivityListView _setExpandedFrame:initialFrame:viaScaleWithRepresentedActivity:transitionCoordinator:](self, "_setExpandedFrame:initialFrame:viaScaleWithRepresentedActivity:transitionCoordinator:", a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
  else {
    -[RPCCUIActivityListView _setExpandedFrame:initialFrame:viaResizeWithRepresentedActivity:transitionCoordinator:](self, "_setExpandedFrame:initialFrame:viaResizeWithRepresentedActivity:transitionCoordinator:", a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGRect)setContractedFrame:(CGRect)a3 representedActivity:(id)a4 presentationStyle:(int64_t)a5 transitionCoordinator:(id)a6
{
  if (a5 == 1) {
    -[RPCCUIActivityListView _setContractedFrame:viaScaleWithRepresentedActivity:transitionCoordinator:](self, "_setContractedFrame:viaScaleWithRepresentedActivity:transitionCoordinator:", a4, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  else {
    -[RPCCUIActivityListView _setContractedFrame:viaResizeWithRepresentedActivity:transitionCoordinator:](self, "_setContractedFrame:viaResizeWithRepresentedActivity:transitionCoordinator:", a4, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (void)toggleExpandedActivityView:(id)a3 withTransitionCoordinator:(id)a4
{
  id v5 = a3;
  id v7 = a3;
  id v8 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(RPCCUIActivityListView *)self activityViews];
  id v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    id v20 = v8;
    do
    {
      double v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        CGRect v13 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector()) {
          double v14 = v13;
        }
        else {
          double v14 = 0;
        }
        id v15 = v14;
        if (v15 == v7)
        {
          [(RPCCUIActivityDisplaying *)self->_currentExpandedActivityView setExpanded:0 withTransitionCoordinator:v8];
          objc_storeStrong((id *)&self->_currentExpandedActivityView, v5);
          objc_msgSend(v7, "setExpanded:withTransitionCoordinator:", objc_msgSend(v7, "isExpanded") ^ 1, v8);
          if ([v7 isExpanded])
          {
            if (objc_opt_respondsToSelector())
            {
              id v16 = [v7 gestureRecognizerForExclusionRelationships];
              [(RPCCUIActivityListView *)self panGestureRecognizer];
              id v17 = v5;
              v19 = double v18 = self;
              [v16 requireGestureRecognizerToFail:v19];

              self = v18;
              id v5 = v17;
              id v8 = v20;
            }
          }
        }

        double v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1B25C;
  v22[3] = &unk_694D0;
  v22[4] = self;
  [v8 animateAlongsideTransition:v22 completion:0];
}

- (void)isolateActivityView:(id)a3 withInset:(UIEdgeInsets)a4
{
  double bottom = a4.bottom;
  id v7 = a3;
  id v8 = [(RPCCUIActivityListView *)self activityViews];
  id v9 = v8;
  p_isolatedActivityView = &self->_isolatedActivityView;
  if (!self->_isolatedActivityView && [v8 containsObject:v7])
  {
    objc_storeStrong((id *)&self->_isolatedActivityView, a3);
    [(RPCCUIActivityDisplaying *)*p_isolatedActivityView setContracted:1];
    [(RPCCUIActivityListView *)self setNeedsLayout];
    [(RPCCUIActivityListView *)self layoutIfNeeded];
    [(RPCCUIActivityListView *)self contentSize];
    double v12 = v11;
    [(RPCCUIActivityDisplaying *)*p_isolatedActivityView frame];
    -[RPCCUIActivityListView setContentOffset:](self, "setContentOffset:", 0.0, bottom - (v12 - CGRectGetMaxY(v25) + -16.0));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = v9;
    id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        id v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          double v18 = *(RPCCUIActivityDisplaying **)(*((void *)&v20 + 1) + 8 * (void)v17);
          if (v18 == *p_isolatedActivityView) {
            double v19 = 1.0;
          }
          else {
            double v19 = 0.0;
          }
          -[RPCCUIActivityDisplaying setAlpha:](v18, "setAlpha:", v19, (void)v20);
          id v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }
  }
}

- (void)endIsolation
{
  isolatedActivityView = self->_isolatedActivityView;
  if (isolatedActivityView)
  {
    [(RPCCUIActivityDisplaying *)isolatedActivityView setExpanded:1];
    id v4 = self->_isolatedActivityView;
    self->_isolatedActivityView = 0;

    [(RPCCUIActivityListView *)self setNeedsLayout];
    [(RPCCUIActivityListView *)self layoutIfNeeded];
    -[RPCCUIActivityListView setContentOffset:](self, "setContentOffset:", CGPointZero.x, CGPointZero.y);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = [(RPCCUIActivityListView *)self activityViews];
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setAlpha:1.0];
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  -[FCUIActivityListContentView sizeThatFits:](self->_contentView, "sizeThatFits:", a3.width, a3.height);
  if (width >= v4) {
    double v4 = width;
  }
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGSize)intrinsicContentSize
{
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG)) {
    sub_4ABCC();
  }
  [(FCUIActivityListContentView *)self->_contentView intrinsicContentSize];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)setNeedsLayout
{
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG)) {
    sub_4AC00();
  }
  v3.receiver = self;
  v3.super_class = (Class)RPCCUIActivityListView;
  [(RPCCUIActivityListView *)&v3 setNeedsLayout];
  [(FCUIActivityListContentView *)self->_contentView setNeedsLayout];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG)) {
    sub_4AC34();
  }
  [(RPCCUIActivityListView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)RPCCUIActivityListView;
  -[RPCCUIActivityListView setFrame:](&v16, "setFrame:", x, y, width, height);
  v17.origin.double x = v9;
  v17.origin.double y = v11;
  v17.size.double width = v13;
  v17.size.double height = v15;
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  if (!CGRectEqualToRect(v17, v18)) {
    [(RPCCUIActivityListView *)self _invalidateContentSize];
  }
}

- (void)viewWillLayoutSubviews
{
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG)) {
    sub_4AC68();
  }
}

- (void)layoutSubviews
{
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG)) {
    sub_4AC9C();
  }
  v3.receiver = self;
  v3.super_class = (Class)RPCCUIActivityListView;
  [(RPCCUIActivityListView *)&v3 layoutSubviews];
  if (!self->_contentSizeValid) {
    [(RPCCUIActivityListView *)self _recalculateContentSize];
  }
}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RPCCUIActivityListView;
  if ([(RPCCUIActivityListView *)&v7 touchesShouldCancelInContentView:v4])
  {
    if (objc_opt_respondsToSelector()) {
      unsigned int v5 = [v4 isMenuElement] ^ 1;
    }
    else {
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  [(RPCCUIActivityListView *)self _configureContentViewIfNecessary];
  contentView = self->_contentView;

  return [(FCUIActivityListContentView *)contentView adjustsFontForContentSizeCategory];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  [(RPCCUIActivityListView *)self _configureContentViewIfNecessary];
  contentView = self->_contentView;

  [(FCUIActivityListContentView *)contentView setAdjustsFontForContentSizeCategory:v3];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(RPCCUIActivityListView *)self adjustsFontForContentSizeCategory];
  if (v3)
  {
    BOOL v3 = [(FCUIActivityListContentView *)self->_contentView adjustForContentSizeCategoryChange];
    if (v3)
    {
      [(FCUIActivityListContentView *)self->_contentView setNeedsLayout];
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_configureContentViewIfNecessary
{
  if (!self->_contentView)
  {
    BOOL v3 = [FCUIActivityListContentView alloc];
    [(RPCCUIActivityListView *)self bounds];
    id v4 = -[FCUIActivityListContentView initWithFrame:](v3, "initWithFrame:");
    contentView = self->_contentView;
    self->_contentView = v4;

    [(FCUIActivityListContentView *)self->_contentView setFooterPinnedToBottom:self->_footerPinnedToBottom];
    id v6 = self->_contentView;
    [(RPCCUIActivityListView *)self addSubview:v6];
  }
}

- (CGSize)_contentSizeForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[FCUIActivityListContentView sizeThatFits:](self->_contentView, "sizeThatFits:", a3.size.width, a3.size.height);
  double v8 = v7;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double v9 = CGRectGetWidth(v12);
  double v10 = v8;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (CGRect)_contentViewFrameForContentSize:(CGSize)a3 inBounds:(CGRect)a4
{
  CGRectGetHeight(a4);

  BSRectWithSize();
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (void)_recalculateContentSize
{
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG)) {
    sub_4AD90();
  }
  self->_contentSizeValid = 1;
  [(RPCCUIActivityListView *)self bounds];
  -[RPCCUIActivityListView _contentSizeForBounds:](self, "_contentSizeForBounds:");
  double v4 = v3;
  -[RPCCUIActivityListView _contentViewFrameForContentSize:inBounds:](self, "_contentViewFrameForContentSize:inBounds:");
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;
  -[FCUIActivityListContentView setFrame:](self->_contentView, "setFrame:");
  -[RPCCUIActivityListView setContentSize:](self, "setContentSize:", v10, v12);
  if (self->_footerPinnedToBottom)
  {
    [(RPCCUIActivityListView *)self safeAreaInsets];
    double bottom = v16 + 12.0;
    if (v12 >= v4 + top + bottom)
    {
      double y = CGPointZero.y;
      double top = UIEdgeInsetsZero.top;
      double left = UIEdgeInsetsZero.left;
      double bottom = UIEdgeInsetsZero.bottom;
      double right = UIEdgeInsetsZero.right;
    }
    else
    {
      double y = -top;
    }
    -[RPCCUIActivityListView setContentInset:](self, "setContentInset:", top, left, bottom, right);
    BOOL v19 = y == self->_initialContentOffset.y && CGPointZero.x == self->_initialContentOffset.x;
    if (!v19 && v4 > 0.0)
    {
      self->_initialContentOffset.CGFloat x = CGPointZero.x;
      self->_initialContentOffset.double y = y;
      -[RPCCUIActivityListView setContentOffset:](self, "setContentOffset:", CGPointZero.x, y);
    }
  }
  long long v20 = (void *)RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEBUG)) {
    sub_4ACD0(v20, v6, v8, v10, v12);
  }
}

- (void)_invalidateContentSize
{
  self->_contentSizeValid = 0;
  [(RPCCUIActivityListView *)self invalidateIntrinsicContentSize];

  [(RPCCUIActivityListView *)self setNeedsLayout];
}

- (id)_activityViewForRepresentedActivity:(id)a3
{
  id v4 = a3;
  double v5 = [(FCUIActivityListContentView *)self->_contentView activityViews];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1BDE8;
  v9[3] = &unk_691A0;
  id v10 = v4;
  id v6 = v4;
  double v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);

  return v7;
}

- (id)_orderedSubviewsIncludingHeader:(BOOL)a3 andFooter:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(FCUIActivityListContentView *)self->_contentView activityViews];
  id v8 = [v7 mutableCopy];

  if (v5)
  {
    double v9 = [(FCUIActivityListContentView *)self->_contentView headerView];

    if (v9)
    {
      id v10 = [(FCUIActivityListContentView *)self->_contentView headerView];
      [v8 insertObject:v10 atIndex:0];
    }
  }
  if (v4)
  {
    double v11 = [(FCUIActivityListContentView *)self->_contentView footerView];

    if (v11)
    {
      double v12 = [(FCUIActivityListContentView *)self->_contentView footerView];
      [v8 insertObject:v12 atIndex:0];
    }
  }

  return v8;
}

- (CGRect)_setContractedFrame:(CGRect)a3 viaScaleWithRepresentedActivity:(id)a4 transitionCoordinator:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  double v12 = [(RPCCUIActivityListView *)self _activityViewForRepresentedActivity:a4];
  CGFloat v13 = [v12 superview];
  [v12 frame];
  objc_msgSend(v13, "convertRect:toView:", 0);
  double v39 = v15;
  double v40 = v14;
  double v37 = v17;
  double v38 = v16;

  v44 = v12;
  [(FCUIActivityListContentView *)self->_contentView setCompactActivityView:v12];
  contentView = self->_contentView;
  [(RPCCUIActivityListView *)self bounds];
  -[FCUIActivityListContentView sizeThatFitsCollapsedToPill:](contentView, "sizeThatFitsCollapsedToPill:", v19, v20);
  sdouble x = v21;
  double v43 = v22;
  -[FCUIActivityListContentView convertRect:fromView:](self->_contentView, "convertRect:fromView:", 0, x, y, width, height);
  memset(&v52, 0, sizeof(v52));
  v54.origin.double x = x;
  v54.origin.double y = y;
  v54.size.double width = width;
  v54.size.double height = height;
  CGFloat sxa = CGRectGetWidth(v54) / sx;
  v55.origin.double x = x;
  v55.origin.double y = y;
  v55.size.double width = width;
  v55.size.double height = height;
  CGFloat v23 = CGRectGetHeight(v55);
  CGAffineTransformMakeScale(&v52, sxa, v23 / v43);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v24 = [(RPCCUIActivityListView *)self _orderedSubviewsIncludingHeader:1 andFooter:1];
  id v25 = [v24 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v49;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v49 != v27) {
          objc_enumerationMutation(v24);
        }
        double v29 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          double v30 = v29;
        }
        else {
          double v30 = 0;
        }
        id v31 = v30;
        BSRectWithSize();
        objc_msgSend(v31, "willPresent:withTargetContainerBounds:transitionCoordinator:", 0, v11);
        [v29 frame];
        UIRectCenteredIntegralRectScale();
        [v29 setFrame:0];
        CGAffineTransform v47 = v52;
        [v29 setTransform:&v47];
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_1C30C;
        v46[3] = &unk_694D0;
        v46[4] = v29;
        [v11 animateAlongsideTransition:0 completion:v46];
      }
      id v26 = [v24 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v26);
  }

  [(FCUIActivityListContentView *)self->_contentView setContentDetached:1];
  [v11 transitionDuration];
  if (v32 <= 0.0)
  {
    [(FCUIActivityListContentView *)self->_contentView setContentDetached:0];
  }
  else
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1C34C;
    v45[3] = &unk_694D0;
    v45[4] = self;
    [v11 animateAlongsideTransition:0 completion:v45];
  }

  double v34 = v39;
  double v33 = v40;
  double v36 = v37;
  double v35 = v38;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

- (CGRect)_setContractedFrame:(CGRect)a3 viaResizeWithRepresentedActivity:(id)a4 transitionCoordinator:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  double v12 = [(RPCCUIActivityListView *)self _activityViewForRepresentedActivity:a4];
  CGFloat v13 = [v12 superview];
  [v12 frame];
  objc_msgSend(v13, "convertRect:toView:", 0);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v34 = v12;
  [(FCUIActivityListContentView *)self->_contentView setCompactActivityView:v12];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  double v22 = [(FCUIActivityListContentView *)self->_contentView activityViews];
  id v23 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v36;
    do
    {
      id v26 = 0;
      do
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v26);
        if (objc_opt_respondsToSelector()) {
          double v28 = v27;
        }
        else {
          double v28 = 0;
        }
        id v29 = v28;
        BSRectWithSize();
        objc_msgSend(v29, "willPresent:withTargetContainerBounds:transitionCoordinator:", 0, v11);

        id v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v24);
  }

  -[FCUIActivityListContentView setCollapsedSize:](self->_contentView, "setCollapsedSize:", width, height);
  -[RPCCUIActivityListView setFrame:](self, "setFrame:", x, y, width, height);
  [(RPCCUIActivityListView *)self _invalidateContentSize];
  [(FCUIActivityListContentView *)self->_contentView setNeedsLayout];
  [(RPCCUIActivityListView *)self layoutIfNeeded];

  double v30 = v15;
  double v31 = v17;
  double v32 = v19;
  double v33 = v21;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3
{
}

- (void)addVideoView
{
}

- (void)removeVideoView
{
}

- (BOOL)isFooterPinnedToBottom
{
  return self->_footerPinnedToBottom;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentExpandedActivityView, 0);
  objc_storeStrong((id *)&self->_isolatedActivityView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end