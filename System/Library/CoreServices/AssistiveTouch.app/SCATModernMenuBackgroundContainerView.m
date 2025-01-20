@interface SCATModernMenuBackgroundContainerView
- (BOOL)isShowingFooterView;
- (BOOL)shouldUseDockContentPadding;
- (NSArray)dockVerticalConstraints;
- (NSArray)dockVerticalPortraitConstraints;
- (NSArray)verticalConstraints;
- (NSLayoutConstraint)dockBottomConstraint;
- (NSLayoutConstraint)dockBottomSafeConstraint;
- (NSLayoutConstraint)dockTopConstraint;
- (NSLayoutConstraint)dockTopSafeConstraint;
- (NSLayoutConstraint)footerToContainerVerticalConstraint;
- (NSLayoutConstraint)footerViewHiddenConstraint;
- (NSLayoutConstraint)viewBottomConstraint;
- (NSLayoutConstraint)viewLeadingConstraint;
- (NSLayoutConstraint)viewTopConstraint;
- (NSLayoutConstraint)viewTrailingConstraint;
- (SCATModernMenuBackgroundContainerView)initWithFrame:(CGRect)a3;
- (SCATModernMenuContentViewContainer)contentViewContainer;
- (SCATModernMenuFooterView)footerView;
- (UIEdgeInsets)contentPadding;
- (int64_t)dockPosition;
- (void)_setupSubviewConstraints;
- (void)orientationDidChange;
- (void)setContentViewContainer:(id)a3;
- (void)setDockBottomConstraint:(id)a3;
- (void)setDockBottomSafeConstraint:(id)a3;
- (void)setDockPosition:(int64_t)a3;
- (void)setDockTopConstraint:(id)a3;
- (void)setDockTopSafeConstraint:(id)a3;
- (void)setDockVerticalConstraints:(id)a3;
- (void)setDockVerticalPortraitConstraints:(id)a3;
- (void)setFooterToContainerVerticalConstraint:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setShouldUseDockContentPadding:(BOOL)a3;
- (void)setShowingFooterView:(BOOL)a3;
- (void)setVerticalConstraints:(id)a3;
- (void)setViewBottomConstraint:(id)a3;
- (void)setViewLeadingConstraint:(id)a3;
- (void)setViewTopConstraint:(id)a3;
- (void)setViewTrailingConstraint:(id)a3;
- (void)updateConstraints;
@end

@implementation SCATModernMenuBackgroundContainerView

- (SCATModernMenuBackgroundContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)SCATModernMenuBackgroundContainerView;
  v7 = -[SCATModernMenuBackgroundContainerView initWithFrame:](&v11, "initWithFrame:");
  if (v7)
  {
    v8 = -[SCATModernMenuContentViewContainer initWithFrame:]([SCATModernMenuContentViewContainer alloc], "initWithFrame:", x, y, width, height);
    [(SCATModernMenuContentViewContainer *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SCATModernMenuBackgroundContainerView *)v7 setContentViewContainer:v8];
    [(SCATModernMenuBackgroundContainerView *)v7 addSubview:v8];
    v9 = -[SCATModernMenuFooterView initWithFrame:]([SCATModernMenuFooterView alloc], "initWithFrame:", x, y, width, height);
    [(SCATModernMenuFooterView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SCATModernMenuBackgroundContainerView *)v7 setFooterView:v9];
    [(SCATModernMenuBackgroundContainerView *)v7 addSubview:v9];
    [(SCATModernMenuBackgroundContainerView *)v7 setShowingFooterView:1];
    [(SCATModernMenuBackgroundContainerView *)v7 _setupSubviewConstraints];
  }
  return v7;
}

- (void)_setupSubviewConstraints
{
  v76 = [(SCATModernMenuBackgroundContainerView *)self contentViewContainer];
  v75 = [v76 topAnchor];
  v74 = [(SCATModernMenuBackgroundContainerView *)self topAnchor];
  v3 = [v75 constraintEqualToAnchor:v74 constant:0.0];
  viewTopConstraint = self->_viewTopConstraint;
  self->_viewTopConstraint = v3;

  v80[0] = v3;
  v72 = [(SCATModernMenuBackgroundContainerView *)self bottomAnchor];
  v73 = [(SCATModernMenuBackgroundContainerView *)self footerView];
  v71 = [v73 bottomAnchor];
  v5 = [v72 constraintEqualToAnchor:v71 constant:0.0];
  viewBottomConstraint = self->_viewBottomConstraint;
  self->_viewBottomConstraint = v5;

  v80[1] = v5;
  v70 = [(SCATModernMenuBackgroundContainerView *)self contentViewContainer];
  v69 = [v70 leadingAnchor];
  v68 = [(SCATModernMenuBackgroundContainerView *)self leadingAnchor];
  v7 = [v69 constraintGreaterThanOrEqualToAnchor:v68 constant:0.0];
  viewLeadingConstraint = self->_viewLeadingConstraint;
  self->_viewLeadingConstraint = v7;

  v80[2] = v7;
  v67 = [(SCATModernMenuBackgroundContainerView *)self contentViewContainer];
  v66 = [v67 trailingAnchor];
  v65 = [(SCATModernMenuBackgroundContainerView *)self trailingAnchor];
  v9 = [v66 constraintLessThanOrEqualToAnchor:v65 constant:0.0];
  viewTrailingConstraint = self->_viewTrailingConstraint;
  self->_viewTrailingConstraint = v9;

  v80[3] = v9;
  v64 = [(SCATModernMenuBackgroundContainerView *)self contentViewContainer];
  v63 = [v64 centerXAnchor];
  v62 = [(SCATModernMenuBackgroundContainerView *)self centerXAnchor];
  v61 = [v63 constraintEqualToAnchor:v62];
  v80[4] = v61;
  v60 = [(SCATModernMenuBackgroundContainerView *)self footerView];
  v58 = [v60 topAnchor];
  v59 = [(SCATModernMenuBackgroundContainerView *)self contentViewContainer];
  v57 = [v59 bottomAnchor];
  objc_super v11 = [v58 constraintEqualToAnchor:v57];
  footerToContainerVerticalConstraint = self->_footerToContainerVerticalConstraint;
  self->_footerToContainerVerticalConstraint = v11;

  v80[5] = v11;
  v56 = [(SCATModernMenuBackgroundContainerView *)self footerView];
  v55 = [v56 centerXAnchor];
  v54 = [(SCATModernMenuBackgroundContainerView *)self centerXAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v80[6] = v53;
  v13 = [(SCATModernMenuBackgroundContainerView *)self footerView];
  v14 = [v13 leadingAnchor];
  v15 = [(SCATModernMenuBackgroundContainerView *)self leadingAnchor];
  v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15];
  v80[7] = v16;
  v17 = [(SCATModernMenuBackgroundContainerView *)self footerView];
  v18 = [v17 trailingAnchor];
  v19 = [(SCATModernMenuBackgroundContainerView *)self trailingAnchor];
  v20 = [v18 constraintLessThanOrEqualToAnchor:v19];
  v80[8] = v20;
  v21 = +[NSArray arrayWithObjects:v80 count:9];
  +[NSLayoutConstraint activateConstraints:v21];

  v22 = self->_viewBottomConstraint;
  v79[0] = self->_viewTopConstraint;
  v79[1] = v22;
  v23 = +[NSArray arrayWithObjects:v79 count:2];
  verticalConstraints = self->_verticalConstraints;
  self->_verticalConstraints = v23;

  v25 = [(SCATModernMenuBackgroundContainerView *)self contentViewContainer];
  v26 = [v25 topAnchor];
  v27 = [(SCATModernMenuBackgroundContainerView *)self topAnchor];
  v28 = [v26 constraintEqualToAnchor:v27 constant:0.0];
  dockTopConstraint = self->_dockTopConstraint;
  self->_dockTopConstraint = v28;

  v78[0] = v28;
  v30 = [(SCATModernMenuBackgroundContainerView *)self bottomAnchor];
  v31 = [(SCATModernMenuBackgroundContainerView *)self footerView];
  v32 = [v31 bottomAnchor];
  v33 = [v30 constraintEqualToAnchor:v32 constant:0.0];
  dockBottomConstraint = self->_dockBottomConstraint;
  self->_dockBottomConstraint = v33;

  v78[1] = v33;
  v35 = +[NSArray arrayWithObjects:v78 count:2];
  dockVerticalConstraints = self->_dockVerticalConstraints;
  self->_dockVerticalConstraints = v35;

  v37 = [(SCATModernMenuBackgroundContainerView *)self contentViewContainer];
  v38 = [v37 topAnchor];
  v39 = [(SCATModernMenuBackgroundContainerView *)self safeAreaLayoutGuide];
  v40 = [v39 topAnchor];
  v41 = [v38 constraintGreaterThanOrEqualToAnchor:v40];
  dockTopSafeConstraint = self->_dockTopSafeConstraint;
  self->_dockTopSafeConstraint = v41;

  v77[0] = v41;
  v43 = [(SCATModernMenuBackgroundContainerView *)self safeAreaLayoutGuide];
  v44 = [v43 bottomAnchor];
  v45 = [(SCATModernMenuBackgroundContainerView *)self footerView];
  v46 = [v45 bottomAnchor];
  v47 = [v44 constraintGreaterThanOrEqualToAnchor:v46];
  dockBottomSafeConstraint = self->_dockBottomSafeConstraint;
  self->_dockBottomSafeConstraint = v47;

  v77[1] = v47;
  v49 = +[NSArray arrayWithObjects:v77 count:2];
  dockVerticalPortraitConstraints = self->_dockVerticalPortraitConstraints;
  self->_dockVerticalPortraitConstraints = v49;

  LODWORD(v51) = 1144750080;
  [(NSLayoutConstraint *)self->_dockTopConstraint setPriority:v51];
  LODWORD(v52) = 1144750080;
  [(NSLayoutConstraint *)self->_dockBottomConstraint setPriority:v52];
}

- (void)updateConstraints
{
  v24.receiver = self;
  v24.super_class = (Class)SCATModernMenuBackgroundContainerView;
  [(SCATModernMenuBackgroundContainerView *)&v24 updateConstraints];
  [(SCATModernMenuBackgroundContainerView *)self contentPadding];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = [(SCATModernMenuBackgroundContainerView *)self viewTopConstraint];
  [v11 setConstant:v4];

  v12 = [(SCATModernMenuBackgroundContainerView *)self viewBottomConstraint];
  [v12 setConstant:v8];

  v13 = [(SCATModernMenuBackgroundContainerView *)self viewLeadingConstraint];
  [v13 setConstant:v6];

  v14 = [(SCATModernMenuBackgroundContainerView *)self viewTrailingConstraint];
  [v14 setConstant:-v10];

  v15 = [(SCATModernMenuBackgroundContainerView *)self dockTopConstraint];
  [v15 setConstant:v4];

  v16 = [(SCATModernMenuBackgroundContainerView *)self dockBottomConstraint];
  [v16 setConstant:v8];

  if (![(SCATModernMenuBackgroundContainerView *)self shouldUseDockContentPadding])
  {
    +[NSLayoutConstraint deactivateConstraints:self->_dockVerticalPortraitConstraints];
    +[NSLayoutConstraint deactivateConstraints:self->_dockVerticalConstraints];
    verticalConstraints = self->_verticalConstraints;
    goto LABEL_5;
  }
  +[NSLayoutConstraint deactivateConstraints:self->_verticalConstraints];
  +[NSLayoutConstraint activateConstraints:self->_dockVerticalConstraints];
  v17 = +[SCATScannerManager sharedManager];
  unsigned int v18 = [v17 isLandscape];

  verticalConstraints = self->_dockVerticalPortraitConstraints;
  if (!v18)
  {
LABEL_5:
    +[NSLayoutConstraint activateConstraints:verticalConstraints];
    goto LABEL_6;
  }
  +[NSLayoutConstraint deactivateConstraints:verticalConstraints];
LABEL_6:
  v20 = +[SCATMenuLabel titleFont];
  [v20 descender];
  double v22 = v21 + 0.0;
  v23 = [(SCATModernMenuBackgroundContainerView *)self footerToContainerVerticalConstraint];
  [v23 setConstant:v22];
}

- (NSLayoutConstraint)footerViewHiddenConstraint
{
  footerViewHiddenConstraint = self->_footerViewHiddenConstraint;
  if (!footerViewHiddenConstraint)
  {
    double v4 = [(SCATModernMenuBackgroundContainerView *)self footerView];
    double v5 = [v4 heightAnchor];
    double v6 = [v5 constraintEqualToConstant:0.0];
    double v7 = self->_footerViewHiddenConstraint;
    self->_footerViewHiddenConstraint = v6;

    footerViewHiddenConstraint = self->_footerViewHiddenConstraint;
  }

  return footerViewHiddenConstraint;
}

- (void)setShowingFooterView:(BOOL)a3
{
  if (self->_showingFooterView != a3)
  {
    self->_showingFooterView = a3;
    double v4 = [(SCATModernMenuBackgroundContainerView *)self footerViewHiddenConstraint];
    [v4 setActive:!self->_showingFooterView];

    double v5 = [(SCATModernMenuBackgroundContainerView *)self footerView];
    [v5 setHidden:!self->_showingFooterView];

    [(SCATModernMenuBackgroundContainerView *)self setNeedsUpdateConstraints];
  }
}

- (void)setShouldUseDockContentPadding:(BOOL)a3
{
  if (self->_shouldUseDockContentPadding != a3)
  {
    self->_shouldUseDockContentPadding = a3;
    [(SCATModernMenuBackgroundContainerView *)self setNeedsUpdateConstraints];
  }
}

- (void)setDockPosition:(int64_t)a3
{
  if (self->_dockPosition != a3)
  {
    self->_dockPosition = a3;
    [(SCATModernMenuBackgroundContainerView *)self setNeedsUpdateConstraints];
  }
}

- (void)orientationDidChange
{
}

- (UIEdgeInsets)contentPadding
{
  if ([(SCATModernMenuBackgroundContainerView *)self shouldUseDockContentPadding])
  {
    double v3 = +[UIScreen mainScreen];
    [v3 scale];
    double v5 = v4;

    if (v5 == 1.0)
    {
      double v6 = 15.0;
      double v7 = 14.0;
      double v8 = 15.0;
      double v9 = 15.0;
    }
    else
    {
      objc_super v11 = +[SCATScannerManager sharedManager];
      unsigned int v12 = [v11 isLandscape];
      if (v12) {
        double v6 = 15.0;
      }
      else {
        double v6 = 16.0;
      }
      if (v12) {
        double v7 = 13.0;
      }
      else {
        double v7 = 14.0;
      }

      double v8 = v6;
      double v9 = v6;
    }
  }
  else
  {
    unsigned int v10 = [(SCATModernMenuBackgroundContainerView *)self isShowingFooterView];
    double v6 = 15.0;
    if (v10) {
      double v8 = 10.0;
    }
    else {
      double v8 = 15.0;
    }
    if (v10) {
      double v7 = 0.0;
    }
    else {
      double v7 = 15.0;
    }
    double v9 = v8;
  }
  double v13 = v6;
  double v14 = v7;
  result.right = v9;
  result.bottom = v14;
  result.left = v8;
  result.top = v13;
  return result;
}

- (SCATModernMenuContentViewContainer)contentViewContainer
{
  return self->_contentViewContainer;
}

- (void)setContentViewContainer:(id)a3
{
}

- (SCATModernMenuFooterView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (BOOL)isShowingFooterView
{
  return self->_showingFooterView;
}

- (BOOL)shouldUseDockContentPadding
{
  return self->_shouldUseDockContentPadding;
}

- (int64_t)dockPosition
{
  return self->_dockPosition;
}

- (NSLayoutConstraint)viewTopConstraint
{
  return self->_viewTopConstraint;
}

- (void)setViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)viewBottomConstraint
{
  return self->_viewBottomConstraint;
}

- (void)setViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)viewLeadingConstraint
{
  return self->_viewLeadingConstraint;
}

- (void)setViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)viewTrailingConstraint
{
  return self->_viewTrailingConstraint;
}

- (void)setViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)footerToContainerVerticalConstraint
{
  return self->_footerToContainerVerticalConstraint;
}

- (void)setFooterToContainerVerticalConstraint:(id)a3
{
}

- (NSArray)verticalConstraints
{
  return self->_verticalConstraints;
}

- (void)setVerticalConstraints:(id)a3
{
}

- (NSArray)dockVerticalConstraints
{
  return self->_dockVerticalConstraints;
}

- (void)setDockVerticalConstraints:(id)a3
{
}

- (NSArray)dockVerticalPortraitConstraints
{
  return self->_dockVerticalPortraitConstraints;
}

- (void)setDockVerticalPortraitConstraints:(id)a3
{
}

- (NSLayoutConstraint)dockTopConstraint
{
  return self->_dockTopConstraint;
}

- (void)setDockTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)dockBottomConstraint
{
  return self->_dockBottomConstraint;
}

- (void)setDockBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)dockTopSafeConstraint
{
  return self->_dockTopSafeConstraint;
}

- (void)setDockTopSafeConstraint:(id)a3
{
}

- (NSLayoutConstraint)dockBottomSafeConstraint
{
  return self->_dockBottomSafeConstraint;
}

- (void)setDockBottomSafeConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockBottomSafeConstraint, 0);
  objc_storeStrong((id *)&self->_dockTopSafeConstraint, 0);
  objc_storeStrong((id *)&self->_dockBottomConstraint, 0);
  objc_storeStrong((id *)&self->_dockTopConstraint, 0);
  objc_storeStrong((id *)&self->_dockVerticalPortraitConstraints, 0);
  objc_storeStrong((id *)&self->_dockVerticalConstraints, 0);
  objc_storeStrong((id *)&self->_verticalConstraints, 0);
  objc_storeStrong((id *)&self->_footerToContainerVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_viewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_viewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_viewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_viewTopConstraint, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_contentViewContainer, 0);

  objc_storeStrong((id *)&self->_footerViewHiddenConstraint, 0);
}

@end