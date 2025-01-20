@interface FCUIActivityListView
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
- (FCUIActivityListView)initWithFrame:(CGRect)a3;
- (NSArray)activityViews;
- (UIView)footerView;
- (UIView)headerView;
- (id)_activityViewForRepresentedActivity:(id)a3;
- (id)_orderedSubviewsIncludingHeader:(BOOL)a3 andFooter:(BOOL)a4;
- (void)_configureContentViewIfNecessary;
- (void)_invalidateContentSize;
- (void)_recalculateContentSize;
- (void)endIsolation;
- (void)isolateActivityView:(id)a3 withInset:(UIEdgeInsets)a4;
- (void)layoutSubviews;
- (void)resetScrollForStaticPresentation;
- (void)setActivityViews:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setExpandedActivityView:(id)a3 withTransitionCoordinator:(id)a4;
- (void)setFooterPinnedToBottom:(BOOL)a3;
- (void)setFooterView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHeaderView:(id)a3;
- (void)setNeedsLayout;
@end

@implementation FCUIActivityListView

- (FCUIActivityListView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FCUIActivityListView;
  v3 = -[FCUIActivityListView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(FCUIActivityListView *)v3 setClipsToBounds:0];
    [(FCUIActivityListView *)v4 setAlwaysBounceVertical:1];
    [(FCUIActivityListView *)v4 setShowsVerticalScrollIndicator:0];
    [(FCUIActivityListView *)v4 setShowsHorizontalScrollIndicator:0];
    [(FCUIActivityListView *)v4 setAccessibilityIdentifier:@"focus-modes-ui"];
    v4->_footerPinnedToBottom = 1;
  }
  return v4;
}

- (NSArray)activityViews
{
  return [(FCUIActivityListContentView *)self->_contentView activityViews];
}

- (void)resetScrollForStaticPresentation
{
  p_initialContentOffset = &self->_initialContentOffset;
  [(FCUIActivityListView *)self contentOffset];
  p_initialContentOffset->x = v4;
  p_initialContentOffset->y = v5;
  [(FCUIActivityListView *)self _recalculateContentSize];
}

- (void)setActivityViews:(id)a3
{
  id v6 = a3;
  CGFloat v4 = [(FCUIActivityListView *)self activityViews];
  char v5 = BSEqualArrays();

  if ((v5 & 1) == 0)
  {
    [(FCUIActivityListView *)self _configureContentViewIfNecessary];
    [(FCUIActivityListContentView *)self->_contentView setActivityViews:v6];
    [(FCUIActivityListView *)self _invalidateContentSize];
    [(FCUIActivityListContentView *)self->_contentView setNeedsLayout];
  }
}

- (UIView)headerView
{
  return [(FCUIActivityListContentView *)self->_contentView headerView];
}

- (void)setHeaderView:(id)a3
{
  id v7 = a3;
  CGFloat v4 = [(FCUIActivityListView *)self headerView];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    id v6 = v7;
    if (v7)
    {
      [(FCUIActivityListView *)self _configureContentViewIfNecessary];
      id v6 = v7;
    }
    [(FCUIActivityListContentView *)self->_contentView setHeaderView:v6];
    [(FCUIActivityListView *)self _invalidateContentSize];
  }
}

- (UIView)footerView
{
  return [(FCUIActivityListContentView *)self->_contentView footerView];
}

- (void)setFooterView:(id)a3
{
  id v7 = a3;
  CGFloat v4 = [(FCUIActivityListView *)self footerView];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    id v6 = v7;
    if (v7)
    {
      [(FCUIActivityListView *)self _configureContentViewIfNecessary];
      id v6 = v7;
    }
    [(FCUIActivityListContentView *)self->_contentView setFooterView:v6];
    [(FCUIActivityListView *)self _invalidateContentSize];
  }
}

- (void)setFooterPinnedToBottom:(BOOL)a3
{
  if (self->_footerPinnedToBottom != a3)
  {
    self->_footerPinnedToBottom = a3;
    -[FCUIActivityListContentView setFooterPinnedToBottom:](self->_contentView, "setFooterPinnedToBottom:");
    [(FCUIActivityListView *)self _invalidateContentSize];
  }
}

- (CGRect)_setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 representedActivity:(id)a5 anchorActivityView:(id)a6 collapsedSizeBlock:(id)a7 preludeBlock:(id)a8 activityViewAnimationBlock:(id)a9 transitionCoordinator:(id)a10
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v104 = a5;
  id v99 = a6;
  id v20 = a7;
  v106 = (void (**)(double, double))a8;
  v21 = (void (**)(id, void, uint64_t, void *, double, double, double, double, double, double, double, double))a9;
  id v22 = a10;
  [(FCUIActivityListView *)self _configureContentViewIfNecessary];
  contentView = self->_contentView;
  BSRectWithSize();
  -[FCUIActivityListView _contentSizeForBounds:](self, "_contentSizeForBounds:");
  double v25 = v24;
  double v27 = v26;
  BSRectWithSize();
  -[FCUIActivityListView _contentViewFrameForContentSize:inBounds:](self, "_contentViewFrameForContentSize:inBounds:", v25, v27, v28, v29, v30, v31);
  v109 = -[FCUIActivityListContentView subviewFramesInBounds:](contentView, "subviewFramesInBounds:");
  v32 = [(FCUIActivityListContentView *)self->_contentView activityViews];
  v107 = v22;
  [v22 transitionDuration];
  double v34 = v33;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  obuint64_t j = v32;
  uint64_t v35 = [obj countByEnumeratingWithState:&v124 objects:v129 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v125;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v125 != v37) {
          objc_enumerationMutation(obj);
        }
        if (v34 > 0.0)
        {
          v39 = *(void **)(*((void *)&v124 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            v40 = v39;
          }
          else {
            v40 = 0;
          }
          id v41 = v40;
          BSRectWithSize();
          objc_msgSend(v41, "willPresent:withTargetContainerBounds:transitionCoordinator:", 1, v107);
        }
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v124 objects:v129 count:16];
    }
    while (v36);
  }

  v122[0] = MEMORY[0x263EF8330];
  v122[1] = 3221225472;
  v122[2] = __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke;
  v122[3] = &unk_264542AC8;
  id v102 = v104;
  id v123 = v102;
  uint64_t v42 = objc_msgSend(obj, "bs_firstObjectPassingTest:", v122);
  [(FCUIActivityListContentView *)self->_contentView setCompactActivityView:v42];
  v43 = [(FCUIActivityListView *)self _orderedSubviewsIncludingHeader:1 andFooter:1];
  v44 = [(FCUIActivityListContentView *)self->_contentView footerView];
  v45 = v44;
  if (v44)
  {
    v46 = (void *)MEMORY[0x263F82E00];
    v120[0] = MEMORY[0x263EF8330];
    v120[1] = 3221225472;
    v120[2] = __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_2;
    v120[3] = &unk_264542B68;
    id v121 = v44;
    [v46 performWithoutAnimation:v120];
  }
  v98 = v45;
  v105 = v20;
  double v47 = (*((double (**)(id))v20 + 2))(v20);
  double v49 = v48;
  -[FCUIActivityListContentView setCollapsedSize:](self->_contentView, "setCollapsedSize:");
  v106[2](v47, v49);
  -[FCUIActivityListView setFrame:](self, "setFrame:", x, y, width, height);
  [(FCUIActivityListView *)self _recalculateContentSize];
  -[FCUIActivityListContentView setCollapsedSize:](self->_contentView, "setCollapsedSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_3;
  aBlock[3] = &__block_descriptor_40_e23_v40__0d8d16q24___v___32l;
  double v103 = v34;
  *(double *)&aBlock[4] = v34;
  v50 = _Block_copy(aBlock);
  v101 = (void *)v42;
  if (v99) {
    v51 = v99;
  }
  else {
    v51 = (void *)v42;
  }
  id v52 = v51;

  uint64_t v53 = [v43 indexOfObject:v52];
  v100 = v52;
  v54 = [v109 objectForKey:v52];
  [v54 CGRectValue];
  double v56 = v55;
  double v58 = v57;
  double v60 = v59;
  double v62 = v61;

  long long v118 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v115 = 0u;
  id v63 = v43;
  uint64_t v64 = [v63 countByEnumeratingWithState:&v115 objects:v128 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v116;
    do
    {
      for (uint64_t j = 0; j != v65; ++j)
      {
        if (*(void *)v116 != v66) {
          objc_enumerationMutation(v63);
        }
        uint64_t v68 = *(void *)(*((void *)&v115 + 1) + 8 * j);
        v69 = [v109 objectForKey:v68];
        [v69 CGRectValue];
        double v71 = v70;
        double v73 = v72;
        double v75 = v74;
        double v77 = v76;

        uint64_t v78 = [v63 indexOfObject:v68];
        if (v53 - v78 >= 0) {
          uint64_t v79 = v53 - v78;
        }
        else {
          uint64_t v79 = v78 - v53;
        }
        v21[2](v21, v68, v79, v50, v71, v73, v75, v77, v56, v58, v60, v62);
      }
      uint64_t v65 = [v63 countByEnumeratingWithState:&v115 objects:v128 count:16];
    }
    while (v65);
  }

  v112[0] = MEMORY[0x263EF8330];
  v112[1] = 3221225472;
  v112[2] = __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_4;
  v112[3] = &unk_264542A78;
  id v80 = v98;
  id v113 = v80;
  id v81 = v109;
  id v114 = v81;
  v82 = (void (**)(void, double))_Block_copy(v112);
  v83 = v82;
  if (v103 <= 0.0)
  {
    v82[2](v82, v103);
    v84 = v107;
  }
  else
  {
    v110[0] = MEMORY[0x263EF8330];
    v110[1] = 3221225472;
    v110[2] = __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_6;
    v110[3] = &unk_264542F30;
    v111 = v82;
    v84 = v107;
    [v107 animateAlongsideTransition:0 completion:v110];
  }
  v85 = [v101 superview];
  [v101 frame];
  objc_msgSend(v85, "convertRect:toView:", 0);
  double v87 = v86;
  double v89 = v88;
  double v91 = v90;
  double v93 = v92;

  double v94 = v87;
  double v95 = v89;
  double v96 = v91;
  double v97 = v93;
  result.size.double height = v97;
  result.size.double width = v96;
  result.origin.double y = v95;
  result.origin.double x = v94;
  return result;
}

uint64_t __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  CGFloat v4 = [v2 activityIdentifier];
  char v5 = [v3 activityIdentifier];

  uint64_t v6 = BSEqualObjects();
  return v6;
}

uint64_t __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, double a4, double a5)
{
  v9 = a3;
  if (*(double *)(a1 + 32) <= 0.0)
  {
    if (!v9) {
      goto LABEL_9;
    }
    v15 = v9;
    v9[2]();
  }
  else
  {
    if (a2 <= 0) {
      double v10 = 0.0;
    }
    else {
      double v10 = a4 + a5 * (double)a2;
    }
    v15 = v9;
    id v11 = objc_alloc(MEMORY[0x263F82E30]);
    double v12 = *(double *)(a1 + 32);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x263F82BF0]), "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 38.0, 0.0, 0.0);
    v14 = (void *)[v11 initWithDuration:v13 timingParameters:v12];

    [v14 addAnimations:v15];
    [v14 startAnimationAfterDelay:v10];
  }
  v9 = v15;
LABEL_9:
}

void __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F82E00];
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = 3221225472;
  char v5 = __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_5;
  uint64_t v6 = &unk_264542A78;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  [v2 performWithoutAnimation:&v3];
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0, v3, v4, v5, v6);
}

void __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) objectForKey:v1];
  [v2 CGRectValue];
  objc_msgSend(v1, "setFrame:");
}

uint64_t __175__FCUIActivityListView__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator___block_invoke_6(uint64_t a1)
{
  return [MEMORY[0x263F82E00] _animateUsingDefaultDampedSpringWithDelay:0 initialSpringVelocity:*(void *)(a1 + 32) options:0 animations:0.0 completion:0.0];
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
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke;
  v32[3] = &unk_264542F58;
  v32[4] = self;
  *(double *)&v32[5] = v14;
  *(double *)&v32[6] = v13;
  *(double *)&v32[7] = v12;
  *(double *)&v32[8] = v11;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_2;
  v31[3] = &unk_264542F80;
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
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_4;
  v30[3] = &unk_264542FD0;
  *(double *)&v30[6] = x;
  *(double *)&v30[7] = y;
  *(double *)&v30[8] = width;
  *(double *)&v30[9] = height;
  v30[4] = self;
  v30[5] = v33;
  -[FCUIActivityListView _setExpandedFrame:initialFrame:representedActivity:anchorActivityView:collapsedSizeBlock:preludeBlock:activityViewAnimationBlock:transitionCoordinator:](self, "_setExpandedFrame:initialFrame:representedActivity:anchorActivityView:collapsedSizeBlock:preludeBlock:activityViewAnimationBlock:transitionCoordinator:", v16, 0, v32, v31, v30, v17, v14, v13, v12, v11, x, y, width, height);
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

uint64_t __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 2064), "sizeThatFitsCollapsedToPill:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_2(uint64_t a1, double a2, double a3)
{
  CGFloat v5 = CGRectGetWidth(*(CGRect *)(a1 + 48)) / a2;
  CGFloat Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
  CGAffineTransformMakeScale(&v15, v5, Height / a3);
  id v7 = *(_OWORD **)(*(void *)(a1 + 40) + 8);
  long long v8 = *(_OWORD *)&v15.tx;
  long long v9 = *(_OWORD *)&v15.a;
  v7[3] = *(_OWORD *)&v15.c;
  v7[4] = v8;
  v7[2] = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  long long v10 = *(_OWORD *)(a1 + 96);
  long long v13 = *(_OWORD *)(a1 + 80);
  long long v14 = v10;
  v12[2] = __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_3;
  v12[3] = &unk_264542E38;
  v12[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F82E00] performWithoutAnimation:v12];
}

uint64_t __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(a1 + 32) _invalidateContentSize];
  id v2 = *(void **)(a1 + 32);
  return [v2 layoutSubviews];
}

void __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_4(_OWORD *a1, void *a2, uint64_t a3, void *a4, double a5, double a6, double a7, double a8)
{
  id v15 = a2;
  id v16 = (void *)MEMORY[0x263F82E00];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_5;
  v28[3] = &unk_264542FA8;
  id v17 = v15;
  id v29 = v17;
  double v31 = a5;
  double v32 = a6;
  double v33 = a7;
  double v34 = a8;
  long long v18 = a1[2];
  long long v35 = a1[3];
  long long v36 = a1[4];
  long long v30 = v18;
  double v19 = a4;
  [v16 performWithoutAnimation:v28];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_6;
  v22[3] = &unk_264542E38;
  id v23 = v17;
  double v24 = a5;
  double v25 = a6;
  double v26 = a7;
  double v27 = a8;
  double v20 = (void (*)(void *, uint64_t, void *, double, double))v19[2];
  id v21 = v17;
  v20(v19, a3, v22, 0.045, 0.025);
}

uint64_t __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_5(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 2064), "convertRect:fromView:", 0, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  UIRectCenteredIntegralRectScale();
  [v2 setFrame:0];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(_OWORD **)(*(void *)(a1 + 48) + 8);
  long long v5 = v4[3];
  v7[0] = v4[2];
  v7[1] = v5;
  v7[2] = v4[4];
  [v3 setTransform:v7];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_6(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F82E00];
  CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v13.minimum;
  float maximum = v13.maximum;
  float preferred = v13.preferred;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_7;
  v9[3] = &unk_264542E38;
  id v10 = *(id *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 56);
  long long v11 = *(_OWORD *)(a1 + 40);
  long long v12 = v6;
  *(float *)&long long v6 = minimum;
  *(float *)&double v7 = maximum;
  *(float *)&double v8 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1703937, v9, *(double *)&v6, v7, v8);
}

uint64_t __109__FCUIActivityListView__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_7(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v5];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (CGRect)_setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 viaResizeWithRepresentedActivity:(id)a5 transitionCoordinator:(id)a6
{
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke;
  v14[3] = &__block_descriptor_64_e15__CGSize_dd_8__0l;
  CGRect v15 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_2;
  v12[3] = &unk_264543018;
  v12[4] = self;
  CGRect v13 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_4;
  v10[3] = &__block_descriptor_64_e106_v96__0__UIView_8_CGRect__CGPoint_dd__CGSize_dd__16_CGRect__CGPoint_dd__CGSize_dd__48q80___v__ddq___v____88l;
  CGRect v11 = a4;
  -[FCUIActivityListView _setExpandedFrame:initialFrame:representedActivity:anchorActivityView:collapsedSizeBlock:preludeBlock:activityViewAnimationBlock:transitionCoordinator:](self, "_setExpandedFrame:initialFrame:representedActivity:anchorActivityView:collapsedSizeBlock:preludeBlock:activityViewAnimationBlock:transitionCoordinator:", a5, 0, v14, v12, v10, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

double __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 48);
}

uint64_t __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_3;
  v3[3] = &unk_264542E38;
  v3[4] = *(void *)(a1 + 32);
  long long v1 = *(_OWORD *)(a1 + 56);
  long long v4 = *(_OWORD *)(a1 + 40);
  long long v5 = v1;
  return [MEMORY[0x263F82E00] performWithoutAnimation:v3];
}

uint64_t __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(a1 + 32) _invalidateContentSize];
  [*(id *)(*(void *)(a1 + 32) + 2064) setNeedsLayout];
  id v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

void __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  id v20 = a2;
  id v21 = a4;
  double v22 = (void *)MEMORY[0x263F82E00];
  CAFrameRateRange v48 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v48.minimum;
  float maximum = v48.maximum;
  float preferred = v48.preferred;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_5;
  v34[3] = &unk_264543040;
  double v37 = a9;
  double v38 = a10;
  double v39 = a11;
  double v40 = a12;
  uint64_t v41 = a3;
  *(_OWORD *)&v48.float maximum = *(_OWORD *)(a1 + 48);
  long long v42 = *(_OWORD *)(a1 + 32);
  long long v43 = *(_OWORD *)&v48.maximum;
  id v35 = v20;
  id v36 = v21;
  double v44 = a5;
  double v45 = a6;
  double v46 = a7;
  double v47 = a8;
  id v26 = v21;
  id v27 = v20;
  *(float *)&double v28 = minimum;
  *(float *)&double v29 = maximum;
  *(float *)&double v30 = preferred;
  objc_msgSend(v22, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1703937, v34, v28, v29, v30);
}

void __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = 64;
  if (*(uint64_t *)(a1 + 80) > 0) {
    uint64_t v2 = 104;
  }
  uint64_t v3 = 72;
  if (*(uint64_t *)(a1 + 80) > 0) {
    uint64_t v3 = 112;
  }
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + v2), *(double *)(a1 + v3));
  long long v4 = (void *)MEMORY[0x263F82E00];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_6;
  v14[3] = &unk_264542B68;
  id v15 = *(id *)(a1 + 32);
  [v4 performWithoutAnimation:v14];
  uint64_t v5 = *(void *)(a1 + 80);
  if (v5 >= 1)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_7;
    v10[3] = &unk_264542E38;
    uint64_t v6 = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 32);
    long long v12 = *(_OWORD *)(a1 + 120);
    long long v13 = *(_OWORD *)(a1 + 136);
    (*(void (**)(uint64_t, uint64_t, void *, double, double))(v6 + 16))(v6, v5, v10, 0.045, 0.025);

    uint64_t v5 = *(void *)(a1 + 80);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_9;
  v8[3] = &unk_264542B68;
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, uint64_t, void *, double, double))(v7 + 16))(v7, v5, v8, 0.115, 0.025);
}

uint64_t __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F82E00];
  CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v13.minimum;
  float maximum = v13.maximum;
  float preferred = v13.preferred;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_8;
  v9[3] = &unk_264542E38;
  id v10 = *(id *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 56);
  long long v11 = *(_OWORD *)(a1 + 40);
  long long v12 = v6;
  *(float *)&long long v6 = minimum;
  *(float *)&double v7 = maximum;
  *(float *)&double v8 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1703937, v9, *(double *)&v6, v7, v8);
}

uint64_t __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __110__FCUIActivityListView__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (CGRect)setExpandedFrame:(CGRect)a3 initialFrame:(CGRect)a4 representedActivity:(id)a5 presentationStyle:(int64_t)a6 transitionCoordinator:(id)a7
{
  if (a6 == 1) {
    -[FCUIActivityListView _setExpandedFrame:initialFrame:viaScaleWithRepresentedActivity:transitionCoordinator:](self, "_setExpandedFrame:initialFrame:viaScaleWithRepresentedActivity:transitionCoordinator:", a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
  else {
    -[FCUIActivityListView _setExpandedFrame:initialFrame:viaResizeWithRepresentedActivity:transitionCoordinator:](self, "_setExpandedFrame:initialFrame:viaResizeWithRepresentedActivity:transitionCoordinator:", a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
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
    -[FCUIActivityListView _setContractedFrame:viaScaleWithRepresentedActivity:transitionCoordinator:](self, "_setContractedFrame:viaScaleWithRepresentedActivity:transitionCoordinator:", a4, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  else {
    -[FCUIActivityListView _setContractedFrame:viaResizeWithRepresentedActivity:transitionCoordinator:](self, "_setContractedFrame:viaResizeWithRepresentedActivity:transitionCoordinator:", a4, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (void)setExpandedActivityView:(id)a3 withTransitionCoordinator:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v25 = self;
  double v8 = [(FCUIActivityListView *)self activityViews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    uint64_t v24 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      CAFrameRateRange v13 = sel_gestureRecognizerForExclusionRelationships;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          id v15 = v14;
        }
        else {
          id v15 = 0;
        }
        id v16 = v15;
        id v17 = v16;
        if (v16)
        {
          [v16 setExpanded:v16 == v6 withTransitionCoordinator:v7];
          if ([v17 isExpanded])
          {
            if (objc_opt_respondsToSelector())
            {
              [v17 gestureRecognizerForExclusionRelationships];
              long long v18 = v8;
              id v19 = v7;
              id v20 = v6;
              double v22 = v21 = v13;
              id v23 = [(FCUIActivityListView *)v25 panGestureRecognizer];
              [v22 requireGestureRecognizerToFail:v23];

              CAFrameRateRange v13 = v21;
              id v6 = v20;
              id v7 = v19;
              double v8 = v18;
              uint64_t v11 = v24;
            }
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __74__FCUIActivityListView_setExpandedActivityView_withTransitionCoordinator___block_invoke;
  v26[3] = &unk_264542AF0;
  v26[4] = v25;
  [v7 animateAlongsideTransition:v26 completion:0];
}

uint64_t __74__FCUIActivityListView_setExpandedActivityView_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateContentSize];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)isolateActivityView:(id)a3 withInset:(UIEdgeInsets)a4
{
  double bottom = a4.bottom;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  double v8 = [(FCUIActivityListView *)self activityViews];
  uint64_t v9 = v8;
  p_isolatedActivityView = &self->_isolatedActivityView;
  if (!self->_isolatedActivityView && [v8 containsObject:v7])
  {
    objc_storeStrong((id *)&self->_isolatedActivityView, a3);
    [(FCUIActivityDisplaying *)*p_isolatedActivityView setContracted:1];
    [(FCUIActivityListView *)self setNeedsLayout];
    [(FCUIActivityListView *)self layoutIfNeeded];
    [(FCUIActivityListView *)self contentSize];
    double v12 = v11;
    [(FCUIActivityDisplaying *)*p_isolatedActivityView frame];
    -[FCUIActivityListView setContentOffset:](self, "setContentOffset:", 0.0, bottom - (v12 - CGRectGetMaxY(v26) + -16.0));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(FCUIActivityDisplaying **)(*((void *)&v20 + 1) + 8 * v17);
          if (v18 == *p_isolatedActivityView) {
            double v19 = 1.0;
          }
          else {
            double v19 = 0.0;
          }
          -[FCUIActivityDisplaying setAlpha:](v18, "setAlpha:", v19, (void)v20);
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }
  }
}

- (void)endIsolation
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  isolatedActivityView = self->_isolatedActivityView;
  if (isolatedActivityView)
  {
    [(FCUIActivityDisplaying *)isolatedActivityView setExpanded:1];
    long long v4 = self->_isolatedActivityView;
    self->_isolatedActivityView = 0;

    [(FCUIActivityListView *)self setNeedsLayout];
    [(FCUIActivityListView *)self layoutIfNeeded];
    -[FCUIActivityListView setContentOffset:](self, "setContentOffset:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [(FCUIActivityListView *)self activityViews];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setAlpha:1.0];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
  [(FCUIActivityListContentView *)self->_contentView intrinsicContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setNeedsLayout
{
  v3.receiver = self;
  v3.super_class = (Class)FCUIActivityListView;
  [(FCUIActivityListView *)&v3 setNeedsLayout];
  [(FCUIActivityListContentView *)self->_contentView setNeedsLayout];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(FCUIActivityListView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)FCUIActivityListView;
  -[FCUIActivityListView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  v17.origin.double x = v9;
  v17.origin.double y = v11;
  v17.size.double width = v13;
  v17.size.double height = v15;
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  if (!CGRectEqualToRect(v17, v18)) {
    [(FCUIActivityListView *)self _invalidateContentSize];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)FCUIActivityListView;
  [(FCUIActivityListView *)&v3 layoutSubviews];
  if (!self->_contentSizeValid) {
    [(FCUIActivityListView *)self _recalculateContentSize];
  }
}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCUIActivityListView;
  if ([(FCUIActivityListView *)&v7 touchesShouldCancelInContentView:v4])
  {
    if (objc_opt_respondsToSelector()) {
      int v5 = [v4 isMenuElement] ^ 1;
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
  [(FCUIActivityListView *)self _configureContentViewIfNecessary];
  contentView = self->_contentView;
  return [(FCUIActivityListContentView *)contentView adjustsFontForContentSizeCategory];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  [(FCUIActivityListView *)self _configureContentViewIfNecessary];
  contentView = self->_contentView;
  [(FCUIActivityListContentView *)contentView setAdjustsFontForContentSizeCategory:v3];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(FCUIActivityListView *)self adjustsFontForContentSizeCategory];
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
    [(FCUIActivityListView *)self bounds];
    id v4 = -[FCUIActivityListContentView initWithFrame:](v3, "initWithFrame:");
    contentView = self->_contentView;
    self->_contentView = v4;

    [(FCUIActivityListContentView *)self->_contentView setFooterPinnedToBottom:self->_footerPinnedToBottom];
    uint64_t v6 = self->_contentView;
    [(FCUIActivityListView *)self addSubview:v6];
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
  self->_contentSizeValid = 1;
  [(FCUIActivityListView *)self bounds];
  -[FCUIActivityListView _contentSizeForBounds:](self, "_contentSizeForBounds:");
  double v4 = v3;
  -[FCUIActivityListView _contentViewFrameForContentSize:inBounds:](self, "_contentViewFrameForContentSize:inBounds:");
  double v6 = v5;
  double v8 = v7;
  -[FCUIActivityListContentView setFrame:](self->_contentView, "setFrame:");
  -[FCUIActivityListView setContentSize:](self, "setContentSize:", v6, v8);
  if (self->_footerPinnedToBottom)
  {
    uint64_t v9 = MEMORY[0x263F00148];
    double v10 = *MEMORY[0x263F00148];
    [(FCUIActivityListView *)self safeAreaInsets];
    double v15 = v14 + 12.0;
    if (v11 == 0.0) {
      double v11 = 12.0;
    }
    if (v8 >= v15 + v4 + v11)
    {
      double v16 = *(double *)(v9 + 8);
      double v11 = *MEMORY[0x263F834E8];
      double v12 = *(double *)(MEMORY[0x263F834E8] + 8);
      double v15 = *(double *)(MEMORY[0x263F834E8] + 16);
      double v13 = *(double *)(MEMORY[0x263F834E8] + 24);
    }
    else
    {
      double v16 = -v11;
    }
    -[FCUIActivityListView setContentInset:](self, "setContentInset:", v11, v12, v15, v13);
    BOOL v17 = v16 == self->_initialContentOffset.y && v10 == self->_initialContentOffset.x;
    if (!v17 && v4 > 0.0)
    {
      self->_initialContentOffset.CGFloat x = v10;
      self->_initialContentOffset.CGFloat y = v16;
      -[FCUIActivityListView setContentOffset:](self, "setContentOffset:", v10, v16);
    }
  }
}

- (void)_invalidateContentSize
{
  self->_contentSizeValid = 0;
  [(FCUIActivityListView *)self invalidateIntrinsicContentSize];
  [(FCUIActivityListView *)self setNeedsLayout];
}

- (id)_activityViewForRepresentedActivity:(id)a3
{
  id v4 = a3;
  double v5 = [(FCUIActivityListContentView *)self->_contentView activityViews];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__FCUIActivityListView__activityViewForRepresentedActivity___block_invoke;
  v9[3] = &unk_264542AC8;
  id v10 = v4;
  id v6 = v4;
  double v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __60__FCUIActivityListView__activityViewForRepresentedActivity___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 activityIdentifier];
  double v5 = [v3 activityIdentifier];

  uint64_t v6 = BSEqualObjects();
  return v6;
}

- (id)_orderedSubviewsIncludingHeader:(BOOL)a3 andFooter:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(FCUIActivityListContentView *)self->_contentView activityViews];
  double v8 = (void *)[v7 mutableCopy];

  if (v5)
  {
    uint64_t v9 = [(FCUIActivityListContentView *)self->_contentView headerView];

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
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v11 = a5;
  double v12 = [(FCUIActivityListView *)self _activityViewForRepresentedActivity:a4];
  double v13 = [v12 superview];
  [v12 frame];
  objc_msgSend(v13, "convertRect:toView:", 0);
  double v39 = v15;
  double v40 = v14;
  double v37 = v17;
  double v38 = v16;

  double v44 = v12;
  [(FCUIActivityListContentView *)self->_contentView setCompactActivityView:v12];
  contentView = self->_contentView;
  [(FCUIActivityListView *)self bounds];
  -[FCUIActivityListContentView sizeThatFitsCollapsedToPill:](contentView, "sizeThatFitsCollapsedToPill:", v19, v20);
  sdouble x = v21;
  double v43 = v22;
  -[FCUIActivityListContentView convertRect:fromView:](self->_contentView, "convertRect:fromView:", 0, x, y, width, height);
  memset(&v52, 0, sizeof(v52));
  v55.origin.double x = x;
  v55.origin.double y = y;
  v55.size.double width = width;
  v55.size.double height = height;
  CGFloat sxa = CGRectGetWidth(v55) / sx;
  v56.origin.double x = x;
  v56.origin.double y = y;
  v56.size.double width = width;
  v56.size.double height = height;
  CGFloat v23 = CGRectGetHeight(v56);
  CGAffineTransformMakeScale(&v52, sxa, v23 / v43);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v24 = [(FCUIActivityListView *)self _orderedSubviewsIncludingHeader:1 andFooter:1];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v49 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          long long v30 = v29;
        }
        else {
          long long v30 = 0;
        }
        id v31 = v30;
        BSRectWithSize();
        objc_msgSend(v31, "willPresent:withTargetContainerBounds:transitionCoordinator:", 0, v11);
        [v29 frame];
        UIRectCenteredIntegralRectScale();
        [v29 setFrame:0];
        CGAffineTransform v47 = v52;
        [v29 setTransform:&v47];
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __98__FCUIActivityListView__setContractedFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke;
        v46[3] = &unk_264542AF0;
        v46[4] = v29;
        [v11 animateAlongsideTransition:0 completion:v46];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v53 count:16];
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
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __98__FCUIActivityListView__setContractedFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_2;
    v45[3] = &unk_264542AF0;
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

uint64_t __98__FCUIActivityListView__setContractedFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke(uint64_t a1)
{
  long long v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [v1 setTransform:v4];
}

uint64_t __98__FCUIActivityListView__setContractedFrame_viaScaleWithRepresentedActivity_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 2064) setContentDetached:0];
}

- (CGRect)_setContractedFrame:(CGRect)a3 viaResizeWithRepresentedActivity:(id)a4 transitionCoordinator:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v11 = a5;
  double v12 = [(FCUIActivityListView *)self _activityViewForRepresentedActivity:a4];
  double v13 = [v12 superview];
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
  uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v36;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v35 + 1) + 8 * v26);
        if (objc_opt_respondsToSelector()) {
          long long v28 = v27;
        }
        else {
          long long v28 = 0;
        }
        id v29 = v28;
        BSRectWithSize();
        objc_msgSend(v29, "willPresent:withTargetContainerBounds:transitionCoordinator:", 0, v11);

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v24);
  }

  -[FCUIActivityListContentView setCollapsedSize:](self->_contentView, "setCollapsedSize:", width, height);
  -[FCUIActivityListView setFrame:](self, "setFrame:", x, y, width, height);
  [(FCUIActivityListView *)self _invalidateContentSize];
  [(FCUIActivityListContentView *)self->_contentView setNeedsLayout];
  [(FCUIActivityListView *)self layoutIfNeeded];

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

- (BOOL)isFooterPinnedToBottom
{
  return self->_footerPinnedToBottom;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolatedActivityView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end