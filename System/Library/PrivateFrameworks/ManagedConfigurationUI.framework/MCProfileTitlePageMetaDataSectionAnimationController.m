@interface MCProfileTitlePageMetaDataSectionAnimationController
- (BOOL)_putBackViewIfNeeded:(id)a3 toView:(id)a4;
- (BOOL)_relocateViewIfNeeded:(id)a3 fromView:(id)a4 toView:(id)a5;
- (CGRect)iconViewOriginFrame;
- (CGRect)titleLabelOriginFrame;
- (MCProfileTitlePageMetaDataSectionController)sectionController;
- (UITableView)tableView;
- (UIView)iconView;
- (UIView)orgView;
- (UIView)subtitleView;
- (UIView)titleView;
- (UIView)topBar;
- (double)_alphaWithProgress:(double)a3 keys:(id)a4 values:(id)a5;
- (unint64_t)_binarySearch:(id)a3 target:(double)a4;
- (void)_animateView:(id)a3 progress:(double)a4 startFrame:(CGRect)a5 endY:(double)a6 endScale:(double)a7 extraYOffset:(double)a8;
- (void)setIconView:(id)a3;
- (void)setIconViewOriginFrame:(CGRect)a3;
- (void)setOrgView:(id)a3;
- (void)setSectionController:(id)a3;
- (void)setSubtitleView:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTitleLabelOriginFrame:(CGRect)a3;
- (void)setTitleView:(id)a3;
- (void)setTopBar:(id)a3;
- (void)startTrackingWithMetaDataSectionController:(id)a3 topBar:(id)a4;
- (void)updateProgressWithTranslationDistance:(double)a3 referenceDistance:(double)a4 isScrolling:(BOOL)a5;
@end

@implementation MCProfileTitlePageMetaDataSectionAnimationController

- (void)startTrackingWithMetaDataSectionController:(id)a3 topBar:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MCProfileTitlePageMetaDataSectionAnimationController *)self setSectionController:v7];
  v8 = [v7 titleCell];
  v9 = [v8 titleLabel];
  [(MCProfileTitlePageMetaDataSectionAnimationController *)self setTitleView:v9];

  v10 = [v7 subtitleCell];
  v11 = [v10 titleLabel];
  [(MCProfileTitlePageMetaDataSectionAnimationController *)self setSubtitleView:v11];

  v12 = [v7 iconCell];
  v13 = [v12 iconImageView];
  [(MCProfileTitlePageMetaDataSectionAnimationController *)self setIconView:v13];

  v14 = [v7 orgCell];
  v15 = [v14 contentView];
  [(MCProfileTitlePageMetaDataSectionAnimationController *)self setOrgView:v15];

  [(MCProfileTitlePageMetaDataSectionAnimationController *)self setTopBar:v6];
  id v16 = [v7 tableView];

  [(MCProfileTitlePageMetaDataSectionAnimationController *)self setTableView:v16];
}

- (void)updateProgressWithTranslationDistance:(double)a3 referenceDistance:(double)a4 isScrolling:(BOOL)a5
{
  BOOL v5 = a5;
  id v68 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self titleView];
  v9 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self iconView];
  v10 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self subtitleView];
  v11 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self orgView];
  if (a3 != 0.0 || v5)
  {
    double v66 = a4;
    double v24 = a3 / a4;
    double v25 = 1.0;
    if (a3 / a4 <= 1.0) {
      double v25 = a3 / a4;
    }
    double v26 = fmax(v25, 0.0);
    v27 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self sectionController];
    v28 = [v27 titleCell];
    v29 = [v28 contentView];
    v30 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self topBar];
    BOOL v31 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self _relocateViewIfNeeded:v68 fromView:v29 toView:v30];

    if (v31)
    {
      [v68 frame];
      -[MCProfileTitlePageMetaDataSectionAnimationController setTitleLabelOriginFrame:](self, "setTitleLabelOriginFrame:");
    }
    else
    {
      [(MCProfileTitlePageMetaDataSectionAnimationController *)self titleLabelOriginFrame];
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      v40 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self topBar];
      [v40 frame];
      double MidY = CGRectGetMidY(v70);
      if (v24 >= 0.0) {
        double v42 = 0.0;
      }
      else {
        double v42 = a3;
      }
      -[MCProfileTitlePageMetaDataSectionAnimationController _animateView:progress:startFrame:endY:endScale:extraYOffset:](self, "_animateView:progress:startFrame:endY:endScale:extraYOffset:", v68, v26, v33, v35, v37, v39, MidY, 0.6, v42);
    }
    double v43 = fmax(a3, 0.0);
    v44 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self sectionController];
    v45 = [v44 iconCell];
    v46 = [v45 contentView];
    v47 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self topBar];
    BOOL v48 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self _relocateViewIfNeeded:v9 fromView:v46 toView:v47];

    if (v48)
    {
      [v9 frame];
      -[MCProfileTitlePageMetaDataSectionAnimationController setIconViewOriginFrame:](self, "setIconViewOriginFrame:");
    }
    else
    {
      [(MCProfileTitlePageMetaDataSectionAnimationController *)self iconViewOriginFrame];
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;
      double v56 = v55;
      v57 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self topBar];
      [v57 frame];
      double MinY = CGRectGetMinY(v71);
      if (v24 >= 0.0) {
        double v59 = 0.0;
      }
      else {
        double v59 = a3;
      }
      -[MCProfileTitlePageMetaDataSectionAnimationController _animateView:progress:startFrame:endY:endScale:extraYOffset:](self, "_animateView:progress:startFrame:endY:endScale:extraYOffset:", v9, v26, v50, v52, v54, v56, MinY, 1.0, v59);
    }
    v60 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self sectionController];
    v61 = [v60 subtitleCell];
    [v61 updateProgressWithTranslationDistance:v5 referenceDistance:v43 isScrolling:v67];

    v62 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self sectionController];
    v63 = [v62 orgCell];
    [v63 updateProgressWithTranslationDistance:v5 referenceDistance:v43 isScrolling:v67];

    if (updateProgressWithTranslationDistance_referenceDistance_isScrolling__onceToken != -1) {
      dispatch_once(&updateProgressWithTranslationDistance_referenceDistance_isScrolling__onceToken, &__block_literal_global);
    }
    [(MCProfileTitlePageMetaDataSectionAnimationController *)self _alphaWithProgress:updateProgressWithTranslationDistance_referenceDistance_isScrolling__iconViewAlphaKeyArray keys:updateProgressWithTranslationDistance_referenceDistance_isScrolling__iconViewAlphaValueArray values:v26];
    objc_msgSend(v9, "setAlpha:");
    [(MCProfileTitlePageMetaDataSectionAnimationController *)self _alphaWithProgress:updateProgressWithTranslationDistance_referenceDistance_isScrolling__subtitleViewAlphaKeyArray keys:updateProgressWithTranslationDistance_referenceDistance_isScrolling__subtitleViewAlphaValueArray values:v26];
    objc_msgSend(v10, "setAlpha:");
    [(MCProfileTitlePageMetaDataSectionAnimationController *)self _alphaWithProgress:updateProgressWithTranslationDistance_referenceDistance_isScrolling__orgViewAlphaKeyArray keys:updateProgressWithTranslationDistance_referenceDistance_isScrolling__orgViewAlphaValueArray values:v26];
    objc_msgSend(v11, "setAlpha:");
    v64 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self topBar];
    v65 = [v64 backgroundColor];
    [(MCProfileTitlePageMetaDataSectionAnimationController *)self _alphaWithProgress:updateProgressWithTranslationDistance_referenceDistance_isScrolling__topBarAlphaKeyArray keys:updateProgressWithTranslationDistance_referenceDistance_isScrolling__topBarAlphaValueArray values:v26];
    v22 = objc_msgSend(v65, "colorWithAlphaComponent:");

    v23 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self topBar];
    [v23 setBackgroundColor:v22];
    goto LABEL_24;
  }
  v12 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self sectionController];
  v13 = [v12 iconCell];
  v14 = [v13 contentView];
  BOOL v15 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self _putBackViewIfNeeded:v9 toView:v14];

  if (v15)
  {
    id v16 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self sectionController];
    v17 = [v16 iconCell];
    [v17 setNeedsLayout];
  }
  v18 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self sectionController];
  v19 = [v18 titleCell];
  v20 = [v19 contentView];
  BOOL v21 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self _putBackViewIfNeeded:v68 toView:v20];

  if (v21)
  {
    v22 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self sectionController];
    v23 = [v22 titleCell];
    [v23 setNeedsLayout];
LABEL_24:
  }
}

void __124__MCProfileTitlePageMetaDataSectionAnimationController_updateProgressWithTranslationDistance_referenceDistance_isScrolling___block_invoke()
{
  v0 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__iconViewAlphaKeyArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__iconViewAlphaKeyArray = (uint64_t)&unk_1F40B5438;

  v1 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__iconViewAlphaValueArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__iconViewAlphaValueArray = (uint64_t)&unk_1F40B5450;

  v2 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__subtitleViewAlphaKeyArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__subtitleViewAlphaKeyArray = (uint64_t)&unk_1F40B5468;

  v3 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__subtitleViewAlphaValueArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__subtitleViewAlphaValueArray = (uint64_t)&unk_1F40B5480;

  v4 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__orgViewAlphaKeyArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__orgViewAlphaKeyArray = (uint64_t)&unk_1F40B5498;

  BOOL v5 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__orgViewAlphaValueArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__orgViewAlphaValueArray = (uint64_t)&unk_1F40B54B0;

  id v6 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__topBarAlphaKeyArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__topBarAlphaKeyArray = (uint64_t)&unk_1F40B54C8;

  id v7 = (void *)updateProgressWithTranslationDistance_referenceDistance_isScrolling__topBarAlphaValueArray;
  updateProgressWithTranslationDistance_referenceDistance_isScrolling__topBarAlphaValueArray = (uint64_t)&unk_1F40B54E0;
}

- (BOOL)_putBackViewIfNeeded:(id)a3 toView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 superview];

  if (v7 != v6)
  {
    [v5 removeFromSuperview];
    [v6 addSubview:v5];
  }

  return v7 != v6;
}

- (BOOL)_relocateViewIfNeeded:(id)a3 fromView:(id)a4 toView:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 superview];

  if (v10 == v8)
  {
    [v7 frame];
    objc_msgSend(v8, "convertRect:toView:", v9);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [v7 removeFromSuperview];
    [v9 addSubview:v7];
    objc_msgSend(v7, "setFrame:", v12, v14, v16, v18);
  }

  return v10 == v8;
}

- (void)_animateView:(id)a3 progress:(double)a4 startFrame:(CGRect)a5 endY:(double)a6 endScale:(double)a7 extraYOffset:(double)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v16 = a3;
  v20.origin.double x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  CGFloat v17 = (CGRectGetMidY(v20) - a6) * a4;
  CGAffineTransformMakeScale(&v19, 1.0 - (1.0 - a7) * a4, 1.0 - (1.0 - a7) * a4);
  CGAffineTransform v18 = v19;
  [v16 setTransform:&v18];
  objc_msgSend(v16, "setFrame:", x, y - (v17 + a8), width, height);
}

- (double)_alphaWithProgress:(double)a3 keys:(id)a4 values:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([v8 count] == 2)
  {
    unint64_t v10 = 0;
    uint64_t v11 = 1;
  }
  else
  {
    unint64_t v10 = [(MCProfileTitlePageMetaDataSectionAnimationController *)self _binarySearch:v8 target:a3];
    if (v10 == [v8 count] - 1) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = v10 + 1;
    }
  }
  double v12 = [v8 objectAtIndexedSubscript:v10];
  [v12 floatValue];
  float v14 = v13;

  double v15 = [v8 objectAtIndexedSubscript:v11];
  [v15 floatValue];
  float v17 = v16;

  CGAffineTransform v18 = [v9 objectAtIndexedSubscript:v10];
  [v18 floatValue];
  float v20 = v19;
  double v21 = v19;

  v22 = [v9 objectAtIndexedSubscript:v11];

  [v22 floatValue];
  float v24 = v23;

  if (v20 != v24) {
    double v21 = v21 + (v24 - v21) * ((a3 - v14) / (v17 - v14));
  }

  return v21;
}

- (unint64_t)_binarySearch:(id)a3 target:(double)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 count] - 1;
  if (v6 < 2)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    do
    {
      id v8 = [v5 objectAtIndexedSubscript:v7 + ((v6 - v7) >> 1)];
      [v8 floatValue];
      double v10 = v9;

      if (v10 > a4) {
        unint64_t v6 = v7 + ((v6 - v7) >> 1);
      }
      else {
        v7 += (v6 - v7) >> 1;
      }
    }
    while (v7 + 1 < v6);
  }
  uint64_t v11 = [v5 objectAtIndexedSubscript:v6];
  [v11 floatValue];
  double v13 = v12;

  if (v13 > a4) {
    unint64_t v6 = v7;
  }

  return v6;
}

- (MCProfileTitlePageMetaDataSectionController)sectionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionController);
  return (MCProfileTitlePageMetaDataSectionController *)WeakRetained;
}

- (void)setSectionController:(id)a3
{
}

- (UIView)iconView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);
  return (UIView *)WeakRetained;
}

- (void)setIconView:(id)a3
{
}

- (UIView)titleView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleView);
  return (UIView *)WeakRetained;
}

- (void)setTitleView:(id)a3
{
}

- (UIView)subtitleView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subtitleView);
  return (UIView *)WeakRetained;
}

- (void)setSubtitleView:(id)a3
{
}

- (UIView)orgView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_orgView);
  return (UIView *)WeakRetained;
}

- (void)setOrgView:(id)a3
{
}

- (UIView)topBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topBar);
  return (UIView *)WeakRetained;
}

- (void)setTopBar:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (CGRect)iconViewOriginFrame
{
  double x = self->_iconViewOriginFrame.origin.x;
  double y = self->_iconViewOriginFrame.origin.y;
  double width = self->_iconViewOriginFrame.size.width;
  double height = self->_iconViewOriginFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setIconViewOriginFrame:(CGRect)a3
{
  self->_iconViewOriginFrame = a3;
}

- (CGRect)titleLabelOriginFrame
{
  double x = self->_titleLabelOriginFrame.origin.x;
  double y = self->_titleLabelOriginFrame.origin.y;
  double width = self->_titleLabelOriginFrame.size.width;
  double height = self->_titleLabelOriginFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTitleLabelOriginFrame:(CGRect)a3
{
  self->_titleLabelOriginFrame = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_topBar);
  objc_destroyWeak((id *)&self->_orgView);
  objc_destroyWeak((id *)&self->_subtitleView);
  objc_destroyWeak((id *)&self->_titleView);
  objc_destroyWeak((id *)&self->_iconView);
  objc_destroyWeak((id *)&self->_sectionController);
}

@end