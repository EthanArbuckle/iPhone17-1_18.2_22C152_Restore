@interface MRUMediaControlsModuleView
- (BOOL)isExpanded;
- (BOOL)isTransitioning;
- (BOOL)showAlertView;
- (BOOL)showMoreButton;
- (BOOL)showPreviewView;
- (CCUICAPackageView)previewView;
- (CCUIModuleContentMetrics)contentMetrics;
- (CGRect)transitionFrame;
- (MRUMediaControlsModuleBackgroundView)backgroundView;
- (MRUMediaControlsModuleContainerView)containerView;
- (MRUMediaControlsModuleMoreButton)moreButton;
- (MRUMediaControlsModuleView)initWithFrame:(CGRect)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)collectionViewLayout;
- (UIView)alertView;
- (double)contentScale;
- (double)cornerRadius;
- (int64_t)layout;
- (void)layoutSubviews;
- (void)setAlertView:(id)a3;
- (void)setContentMetrics:(id)a3;
- (void)setContentScale:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLayout:(int64_t)a3;
- (void)setPreviewView:(id)a3;
- (void)setShowAlertView:(BOOL)a3;
- (void)setShowMoreButton:(BOOL)a3;
- (void)setShowPreviewView:(BOOL)a3;
- (void)setStylingProvider:(id)a3;
- (void)setTransitionFrame:(CGRect)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)updateCollectionViewContentInset;
- (void)updateVisibility;
@end

@implementation MRUMediaControlsModuleView

- (MRUMediaControlsModuleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)MRUMediaControlsModuleView;
  v7 = -[MRUMediaControlsModuleView initWithFrame:](&v22, sel_initWithFrame_);
  if (v7)
  {
    v8 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E4FB15C0]);
    collectionViewLayout = v7->_collectionViewLayout;
    v7->_collectionViewLayout = v8;

    CCUILayoutGutter();
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v7->_collectionViewLayout, "setMinimumInteritemSpacing:");
    double v10 = MRUExpandedTallWidth();
    -[UICollectionViewFlowLayout setItemSize:](v7->_collectionViewLayout, "setItemSize:", v10, MEMORY[0x1B3E725A0]());
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1568]), "initWithFrame:collectionViewLayout:", v7->_collectionViewLayout, x, y, width, height);
    collectionView = v7->_collectionView;
    v7->_collectionView = (UICollectionView *)v11;

    v13 = [MEMORY[0x1E4FB1618] clearColor];
    [(UICollectionView *)v7->_collectionView setBackgroundColor:v13];

    [(UICollectionView *)v7->_collectionView setShowsVerticalScrollIndicator:0];
    [(UICollectionView *)v7->_collectionView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)v7->_collectionView setAlwaysBounceVertical:1];
    [(MRUMediaControlsModuleView *)v7 addSubview:v7->_collectionView];
    v14 = objc_alloc_init(MRUMediaControlsModuleMoreButton);
    moreButton = v7->_moreButton;
    v7->_moreButton = v14;

    [(MRUMediaControlsModuleView *)v7 addSubview:v7->_moreButton];
    v16 = objc_alloc_init(MRUMediaControlsModuleBackgroundView);
    backgroundView = v7->_backgroundView;
    v7->_backgroundView = v16;

    [(MRUMediaControlsModuleView *)v7 addSubview:v7->_backgroundView];
    v18 = objc_alloc_init(MRUMediaControlsModuleContainerView);
    containerView = v7->_containerView;
    v7->_containerView = v18;

    [(MRUMediaControlsModuleView *)v7 addSubview:v7->_containerView];
    v7->_contentScale = 1.0;
    v20 = [(MRUMediaControlsModuleBackgroundView *)v7->_backgroundView stylingProvider];
    [(MRUMediaControlsModuleView *)v7 setStylingProvider:v20];

    [(MRUMediaControlsModuleView *)v7 updateVisibility];
  }
  return v7;
}

- (void)layoutSubviews
{
  v73.receiver = self;
  v73.super_class = (Class)MRUMediaControlsModuleView;
  [(MRUMediaControlsModuleView *)&v73 layoutSubviews];
  [(MRUMediaControlsModuleView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CCUICAPackageView setFrame:](self->_previewView, "setFrame:");
  switch(self->_layout)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      -[MRUMediaControlsModuleBackgroundView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10);
      -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v4, v6, v8, v10);
      -[MRUMediaControlsModuleContainerView setFrame:](self->_containerView, "setFrame:", v4, v6, v8, v10);
      -[UIView setFrame:](self->_alertView, "setFrame:", v4, v6, v8, v10);
      p_moreButton = (id *)&self->_moreButton;
      moreButton = self->_moreButton;
      v74.origin.CGFloat x = v4;
      v74.origin.CGFloat y = v6;
      v74.size.double width = v8;
      v74.size.CGFloat height = v10;
      double Width = CGRectGetWidth(v74);
      double v14 = Width - MEMORY[0x1B3E725A0]();
      -[MRUMediaControlsModuleMoreButton sizeThatFits:](moreButton, "sizeThatFits:", v14, MEMORY[0x1B3E725A0]());
      v75.origin.CGFloat x = v4;
      v75.origin.CGFloat y = v6;
      v75.size.double width = v8;
      v75.size.CGFloat height = v10;
      CGRectGetMaxY(v75);
      goto LABEL_11;
    case 1:
      -[MRUMediaControlsModuleBackgroundView setFrame:](self->_backgroundView, "setFrame:", self->_transitionFrame.origin.x, self->_transitionFrame.origin.y, self->_transitionFrame.size.width, self->_transitionFrame.size.height);
      -[MRUMediaControlsModuleContainerView setFrame:](self->_containerView, "setFrame:", self->_transitionFrame.origin.x, self->_transitionFrame.origin.y, self->_transitionFrame.size.width, self->_transitionFrame.size.height);
      -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v4, v6, v8, v10);
      -[UIView setFrame:](self->_alertView, "setFrame:", v4, v6, v8, v10);
      CCUINumberOfRowsForGridSizeClass();
      v89.origin.CGFloat x = v4;
      v89.origin.CGFloat y = v6;
      v89.size.double width = v8;
      v89.size.CGFloat height = v10;
      CGRectGetHeight(v89);
      MEMORY[0x1B3E725A0]();
      CCUILayoutGutter();
      uint64_t v50 = CCUILayoutGutter();
      MEMORY[0x1B3E725A0](v50);
      UIRectInset();
      CGFloat x = v90.origin.x;
      CGFloat y = v90.origin.y;
      CGFloat v53 = v90.size.width;
      CGFloat height = v90.size.height;
      p_moreButton = (id *)&self->_moreButton;
      v55 = self->_moreButton;
      double v56 = CGRectGetWidth(v90);
      double v57 = v56 - MEMORY[0x1B3E725A0]();
      -[MRUMediaControlsModuleMoreButton sizeThatFits:](v55, "sizeThatFits:", v57, MEMORY[0x1B3E725A0]());
      v91.origin.CGFloat x = x;
      v91.origin.CGFloat y = y;
      v91.size.double width = v53;
      v91.size.CGFloat height = height;
      CGRectGetMinX(v91);
      v92.origin.CGFloat x = x;
      v92.origin.CGFloat y = y;
      v92.size.double width = v53;
      v92.size.CGFloat height = height;
      CGRectGetMaxY(v92);
      goto LABEL_11;
    case 2:
      -[MRUMediaControlsModuleBackgroundView setFrame:](self->_backgroundView, "setFrame:", self->_transitionFrame.origin.x, self->_transitionFrame.origin.y, self->_transitionFrame.size.width, self->_transitionFrame.size.height);
      -[MRUMediaControlsModuleContainerView setFrame:](self->_containerView, "setFrame:", self->_transitionFrame.origin.x, self->_transitionFrame.origin.y, self->_transitionFrame.size.width, self->_transitionFrame.size.height);
      double v58 = MRUExpandedTallWidth();
      v93.origin.CGFloat x = v4;
      v93.origin.CGFloat y = v6;
      v93.size.double width = v8;
      v93.size.CGFloat height = v10;
      CGRectGetWidth(v93);
      UIRectInset();
      CGFloat v59 = v94.origin.x;
      CGFloat v60 = v94.origin.y;
      CGFloat v61 = v94.size.width;
      CGFloat v62 = v94.size.height;
      double v63 = CGRectGetHeight(v94);
      v95.origin.CGFloat x = v59;
      v95.origin.CGFloat y = v60;
      v95.size.double width = v61;
      v95.size.CGFloat height = v62;
      double MinX = CGRectGetMinX(v95);
      v96.origin.CGFloat x = v59;
      v96.origin.CGFloat y = v60;
      v96.size.double width = v61;
      v96.size.CGFloat height = v62;
      -[UICollectionView setFrame:](self->_collectionView, "setFrame:", MinX, CGRectGetMinY(v96), v58, v63);
      CCUINumberOfRowsForGridSizeClass();
      v97.origin.CGFloat x = v59;
      v97.origin.CGFloat y = v60;
      v97.size.double width = v61;
      v97.size.CGFloat height = v62;
      CGRectGetHeight(v97);
      MEMORY[0x1B3E725A0]();
      CCUILayoutGutter();
      UIRectInset();
      CGFloat v65 = v98.origin.x;
      CGFloat v66 = v98.origin.y;
      CGFloat v67 = v98.size.width;
      CGFloat v68 = v98.size.height;
      p_moreButton = (id *)&self->_moreButton;
      v69 = self->_moreButton;
      double v70 = CGRectGetWidth(v98);
      double v71 = v70 - MEMORY[0x1B3E725A0]();
      -[MRUMediaControlsModuleMoreButton sizeThatFits:](v69, "sizeThatFits:", v71, MEMORY[0x1B3E725A0]());
      v99.origin.CGFloat x = v65;
      v99.origin.CGFloat y = v66;
      v99.size.double width = v67;
      v99.size.CGFloat height = v68;
      CGRectGetMaxY(v99);
      goto LABEL_11;
    case 6:
    case 8:
      -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v4, v6, v8, v10);
      if (self->_expanded)
      {
        CCUINumberOfRowsForGridSizeClass();
        v85.origin.CGFloat x = v4;
        v85.origin.CGFloat y = v6;
        v85.size.double width = v8;
        v85.size.CGFloat height = v10;
        CGRectGetHeight(v85);
        MEMORY[0x1B3E725A0]();
        CCUILayoutGutter();
        UIRectInset();
      }
      uint64_t v38 = CCUILayoutGutter();
      MEMORY[0x1B3E725A0](v38);
      UIRectInset();
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      -[MRUMediaControlsModuleBackgroundView setFrame:](self->_backgroundView, "setFrame:");
      -[MRUMediaControlsModuleContainerView setFrame:](self->_containerView, "setFrame:", v40, v42, v44, v46);
      -[UIView setFrame:](self->_alertView, "setFrame:", v40, v42, v44, v46);
      p_moreButton = (id *)&self->_moreButton;
      v47 = self->_moreButton;
      v86.origin.CGFloat x = v40;
      v86.origin.CGFloat y = v42;
      v86.size.double width = v44;
      v86.size.CGFloat height = v46;
      double v48 = CGRectGetWidth(v86);
      double v49 = v48 - MEMORY[0x1B3E725A0]();
      -[MRUMediaControlsModuleMoreButton sizeThatFits:](v47, "sizeThatFits:", v49, MEMORY[0x1B3E725A0]());
      v87.origin.CGFloat x = v40;
      v87.origin.CGFloat y = v42;
      v87.size.double width = v44;
      v87.size.CGFloat height = v46;
      CGRectGetMinX(v87);
      v88.origin.CGFloat x = v40;
      v88.origin.CGFloat y = v42;
      v88.size.double width = v44;
      v88.size.CGFloat height = v46;
      CGRectGetMaxY(v88);
LABEL_11:
      UIRectCenteredXInRect();
      goto LABEL_12;
    case 7:
    case 9:
      unsigned int v15 = CCUINumberOfRowsForGridSizeClass();
      CCUINumberOfColumnsForGridSizeClass();
      v76.origin.CGFloat x = v4;
      v76.origin.CGFloat y = v6;
      v76.size.double width = v8;
      v76.size.CGFloat height = v10;
      double v16 = CGRectGetHeight(v76);
      double v17 = MEMORY[0x1B3E725A0]();
      CCUILayoutGutter();
      double v72 = (v16 - (v18 * (double)(int)(v15 - 1) + v17 * (double)v15)) * 0.5;
      v77.origin.CGFloat x = v4;
      v77.origin.CGFloat y = v6;
      v77.size.double width = v8;
      v77.size.CGFloat height = v10;
      CGRectGetWidth(v77);
      MEMORY[0x1B3E725A0]();
      CCUILayoutGutter();
      MRUExpandedTallWidth();
      v78.origin.CGFloat x = v4;
      v78.origin.CGFloat y = v6;
      v78.size.double width = v8;
      v78.size.CGFloat height = v10;
      CGRectGetHeight(v78);
      v79.origin.CGFloat x = v4;
      v79.origin.CGFloat y = v6;
      v79.size.double width = v8;
      v79.size.CGFloat height = v10;
      CGRectGetMinY(v79);
      UIRectCenteredXInRect();
      -[UICollectionView setFrame:](self->_collectionView, "setFrame:");
      UIRectInset();
      double v19 = v80.origin.x;
      double v20 = v80.origin.y;
      double v21 = v80.size.width;
      double v22 = v80.size.height;
      v23 = self->_moreButton;
      double v24 = CGRectGetWidth(v80);
      double v25 = v24 - MEMORY[0x1B3E725A0]();
      -[MRUMediaControlsModuleMoreButton sizeThatFits:](v23, "sizeThatFits:", v25, MEMORY[0x1B3E725A0]());
      v81.origin.CGFloat x = v19;
      v81.origin.CGFloat y = v20;
      v81.size.double width = v21;
      v81.size.CGFloat height = v22;
      CGRectGetMaxY(v81);
      UIRectCenteredXInRect();
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      -[MRUMediaControlsModuleMoreButton setFrame:](self->_moreButton, "setFrame:");
      if (self->_showMoreButton)
      {
        v82.origin.CGFloat x = v27;
        v82.origin.CGFloat y = v29;
        v82.size.double width = v31;
        v82.size.CGFloat height = v33;
        CGRectGetHeight(v82);
        UIRectInset();
        double v19 = v34;
        double v20 = v35;
        double v21 = v36;
        double v22 = v37;
      }
      -[MRUMediaControlsModuleBackgroundView setFrame:](self->_backgroundView, "setFrame:", v19, v20, v21, v22, *(void *)&v72);
      -[MRUMediaControlsModuleContainerView setFrame:](self->_containerView, "setFrame:", v19, v20, v21, v22);
      v83.origin.CGFloat x = v19;
      v83.origin.CGFloat y = v20;
      v83.size.double width = v21;
      v83.size.CGFloat height = v22;
      CGRectGetHeight(v83);
      v84.origin.CGFloat x = v19;
      v84.origin.CGFloat y = v20;
      v84.size.double width = v21;
      v84.size.CGFloat height = v22;
      CGRectGetMinY(v84);
      UIRectCenteredXInRect();
      p_moreButton = (id *)&self->_alertView;
LABEL_12:
      objc_msgSend(*p_moreButton, "setFrame:");
      break;
    default:
      return;
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MRUMediaControlsModuleView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)MRUMediaControlsModuleView;
  -[MRUMediaControlsModuleView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  [(MRUMediaControlsModuleView *)self bounds];
  if (v13 != v9 || v12 != v11) {
    [(MRUMediaControlsModuleView *)self updateCollectionViewContentInset];
  }
}

- (void)setAlertView:(id)a3
{
  double v5 = (UIView *)a3;
  alertView = self->_alertView;
  if (alertView != v5)
  {
    double v7 = v5;
    [(UIView *)alertView removeFromSuperview];
    objc_storeStrong((id *)&self->_alertView, a3);
    [(MRUMediaControlsModuleView *)self addSubview:self->_alertView];
    [(MRUMediaControlsModuleView *)self setNeedsLayout];
    [(MRUMediaControlsModuleView *)self updateVisibility];
    double v5 = v7;
  }
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUMediaControlsModuleContainerView *)self->_containerView setStylingProvider:v5];
    [(MRUMediaControlsModuleMoreButton *)self->_moreButton setStylingProvider:v5];
  }
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    [(MRUMediaControlsModuleContainerView *)self->_containerView setLayout:"setLayout:"];
    [(MRUMediaControlsModuleBackgroundView *)self->_backgroundView setLayout:a3];
    [(MRUMediaControlsModuleView *)self updateVisibility];
    [(MRUMediaControlsModuleView *)self setNeedsLayout];
  }
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    [(MRUMediaControlsModuleView *)self setNeedsLayout];
  }
}

- (void)setTransitioning:(BOOL)a3
{
  if (self->_transitioning != a3)
  {
    self->_transitioning = a3;
    [(MRUMediaControlsModuleView *)self updateVisibility];
  }
}

- (void)setTransitionFrame:(CGRect)a3
{
  self->_transitionFrame = a3;
  [(MRUMediaControlsModuleView *)self setNeedsLayout];
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  -[MRUMediaControlsModuleBackgroundView setCornerRadius:](self->_backgroundView, "setCornerRadius:");
  containerView = self->_containerView;

  [(MRUMediaControlsModuleContainerView *)containerView _setContinuousCornerRadius:a3];
}

- (void)setShowMoreButton:(BOOL)a3
{
  if (self->_showMoreButton != a3)
  {
    self->_showMoreButton = a3;
    [(MRUMediaControlsModuleView *)self updateVisibility];
    [(MRUMediaControlsModuleView *)self setNeedsLayout];
  }
}

- (void)setShowAlertView:(BOOL)a3
{
  if (self->_showAlertView != a3)
  {
    self->_showAlertView = a3;
    [(MRUMediaControlsModuleView *)self updateVisibility];
    [(MRUMediaControlsModuleView *)self setNeedsLayout];
  }
}

- (void)setContentMetrics:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_contentMetrics, a3);
  [(MRUMediaControlsModuleContainerView *)self->_containerView setContentMetrics:v6];
  if (v6) {
    [v6 symbolScaleFactor];
  }
  else {
    double v5 = 1.0;
  }
  [(MRUMediaControlsModuleView *)self setContentScale:v5];
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    [(MRUMediaControlsModuleBackgroundView *)self->_backgroundView setContentScale:a3];
    moreButton = self->_moreButton;
    [(MRUMediaControlsModuleMoreButton *)moreButton setContentScale:a3];
  }
}

- (void)updateCollectionViewContentInset
{
  MRUExpandedContentInsets();
  double v4 = v3;
  double v6 = v5;
  [(MRUMediaControlsModuleView *)self bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(UICollectionView *)self->_collectionView contentSize];
  double v16 = v15;
  v22.origin.double x = v8;
  v22.origin.double y = v10;
  v22.size.double width = v12;
  v22.size.double height = v14;
  if (v16 < CGRectGetHeight(v22))
  {
    double v17 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v18 = [v17 userInterfaceIdiom];

    if ((v18 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      v23.origin.double x = v8;
      v23.origin.double y = v10;
      v23.size.double width = v12;
      v23.size.double height = v14;
      double v19 = v16 - CGRectGetHeight(v23);
      if (v19 < 0.0) {
        double v19 = -v19;
      }
      double v4 = v19 * 0.5;
      double v6 = v19 * 0.5;
    }
  }
  collectionView = self->_collectionView;

  -[UICollectionView setContentInset:](collectionView, "setContentInset:", v4, 0.0, v6, 0.0);
}

- (void)setShowPreviewView:(BOOL)a3
{
  if (self->_showPreviewView != a3)
  {
    self->_showPreviewView = a3;
    if (a3)
    {
      double v4 = (CCUICAPackageView *)objc_alloc_init(MEMORY[0x1E4F5ADE0]);
      previewView = self->_previewView;
      self->_previewView = v4;

      double v6 = +[MRUAssetsProvider packageDescriptionWithName:@"NowPlayingPreview2x2"];
      [(CCUICAPackageView *)self->_previewView setPackageDescription:v6];

      [(CCUICAPackageView *)self->_previewView setScale:0.333333333];
      [(MRUMediaControlsModuleView *)self addSubview:self->_previewView];
    }
    else
    {
      [(CCUICAPackageView *)self->_previewView removeFromSuperview];
      double v7 = self->_previewView;
      self->_previewView = 0;
    }
    [(MRUMediaControlsModuleView *)self updateVisibility];
    [(MRUMediaControlsModuleView *)self setNeedsLayout];
  }
}

- (void)updateVisibility
{
  BOOL showPreviewView = self->_showPreviewView;
  backgroundView = self->_backgroundView;
  if (showPreviewView)
  {
    [(MRUMediaControlsModuleBackgroundView *)backgroundView setShowMaterialOnly:1];
    [(MRUMediaControlsModuleBackgroundView *)self->_backgroundView setAlpha:1.0];
    double v5 = 0.0;
    [(MRUMediaControlsModuleContainerView *)self->_containerView setAlpha:0.0];
    alertView = self->_alertView;
LABEL_3:
    [(UIView *)alertView setAlpha:0.0];
    double v7 = 0.0;
LABEL_4:
    [(MRUMediaControlsModuleMoreButton *)self->_moreButton setAlpha:v5];
    collectionView = self->_collectionView;
    [(UICollectionView *)collectionView setAlpha:v7];
  }
  else
  {
    [(MRUMediaControlsModuleBackgroundView *)backgroundView setShowMaterialOnly:0];
    switch(self->_layout)
    {
      case 0:
      case 3:
      case 4:
      case 5:
        [(MRUMediaControlsModuleBackgroundView *)self->_backgroundView setAlpha:1.0];
        [(MRUMediaControlsModuleContainerView *)self->_containerView setAlpha:1.0];
        alertView = self->_alertView;
        double v5 = 0.0;
        goto LABEL_3;
      case 1:
      case 2:
        double v7 = 1.0;
        double v5 = 0.0;
        if (self->_transitioning) {
          double v11 = 1.0;
        }
        else {
          double v11 = 0.0;
        }
        [(MRUMediaControlsModuleBackgroundView *)self->_backgroundView setAlpha:v11];
        if (self->_transitioning) {
          double v12 = 1.0;
        }
        else {
          double v12 = 0.0;
        }
        [(MRUMediaControlsModuleContainerView *)self->_containerView setAlpha:v12];
        [(UIView *)self->_alertView setAlpha:0.0];
        goto LABEL_4;
      case 6:
      case 7:
      case 8:
      case 9:
        [(MRUMediaControlsModuleBackgroundView *)self->_backgroundView setAlpha:1.0];
        double v5 = 0.0;
        if (self->_showAlertView) {
          double v9 = 0.0;
        }
        else {
          double v9 = 1.0;
        }
        [(MRUMediaControlsModuleContainerView *)self->_containerView setAlpha:v9];
        if (self->_showAlertView) {
          double v10 = 1.0;
        }
        else {
          double v10 = 0.0;
        }
        [(UIView *)self->_alertView setAlpha:v10];
        double v7 = 0.0;
        if (self->_showMoreButton)
        {
          if (self->_showAlertView) {
            double v5 = 0.0;
          }
          else {
            double v5 = 1.0;
          }
        }
        goto LABEL_4;
      default:
        return;
    }
  }
}

- (MRUMediaControlsModuleBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (MRUMediaControlsModuleContainerView)containerView
{
  return self->_containerView;
}

- (MRUMediaControlsModuleMoreButton)moreButton
{
  return self->_moreButton;
}

- (UIView)alertView
{
  return self->_alertView;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (CGRect)transitionFrame
{
  double x = self->_transitionFrame.origin.x;
  double y = self->_transitionFrame.origin.y;
  double width = self->_transitionFrame.size.width;
  double height = self->_transitionFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)showMoreButton
{
  return self->_showMoreButton;
}

- (BOOL)showAlertView
{
  return self->_showAlertView;
}

- (BOOL)showPreviewView
{
  return self->_showPreviewView;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (CCUICAPackageView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
}

- (double)contentScale
{
  return self->_contentScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_contentMetrics, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end