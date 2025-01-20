@interface MKSmallCalloutView
- (BOOL)canDisplayCompleteTitleWhenExpanded;
- (BOOL)parallaxEnabled;
- (CGSize)preferredContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MKSmallCalloutView)initWithFrame:(CGRect)a3;
- (MKSmallCalloutView)initWithFrame:(CGRect)a3 metrics:(id *)a4;
- (NSString)calloutSubtitle;
- (NSString)calloutTitle;
- (UIView)detailView;
- (UIView)leftView;
- (UIView)rightView;
- (UIView)titlesContainerView;
- (double)maximumWidth;
- (double)minimumWidth;
- (id)_maskedContainerView;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_setNeedsUpdatePreferredContentSize;
- (void)_updatePreferredContentSize;
- (void)_updatePreferredContentSizeIfNeeded;
- (void)beginMapsTransitionMovingSideways;
- (void)dealloc;
- (void)reset;
- (void)setCalloutSubtitle:(id)a3;
- (void)setCalloutSubtitle:(id)a3 animated:(BOOL)a4;
- (void)setCalloutTitle:(id)a3;
- (void)setDetailView:(id)a3;
- (void)setDetailView:(id)a3 animated:(BOOL)a4;
- (void)setLeftView:(id)a3;
- (void)setLeftView:(id)a3 animated:(BOOL)a4;
- (void)setMaximumWidth:(double)a3;
- (void)setMinimumWidth:(double)a3;
- (void)setParallaxEnabled:(BOOL)a3;
- (void)setRightView:(id)a3;
- (void)setRightView:(id)a3 animated:(BOOL)a4;
@end

@implementation MKSmallCalloutView

- (MKSmallCalloutView)initWithFrame:(CGRect)a3
{
  v4[0] = xmmword_18BD1AF70;
  v4[1] = xmmword_18BD1AF60;
  char v5 = 0;
  long long v6 = xmmword_18BD1C670;
  __int16 v7 = 257;
  long long v8 = xmmword_18BD1AF50;
  long long v9 = xmmword_18BD1AF50;
  return -[MKSmallCalloutView initWithFrame:metrics:](self, "initWithFrame:metrics:", v4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MKSmallCalloutView)initWithFrame:(CGRect)a3 metrics:(id *)a4
{
  v135.receiver = self;
  v135.super_class = (Class)MKSmallCalloutView;
  char v5 = -[MKSmallCalloutView initWithFrame:](&v135, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  long long v6 = v5;
  if (v5)
  {
    long long v7 = *(_OWORD *)&a4->var2;
    *(_OWORD *)&v5->_metrics.margin = *(_OWORD *)&a4->var0;
    *(_OWORD *)&v5->_metrics.arrowBase = v7;
    long long v8 = *(_OWORD *)&a4->var8.bottom;
    long long v10 = *(_OWORD *)&a4->var4;
    long long v9 = *(_OWORD *)&a4->var5.var1.var1;
    *(_OWORD *)&v5->_metrics.padding.top = *(_OWORD *)&a4->var8.top;
    *(_OWORD *)&v5->_metrics.padding.bottom = v8;
    *(_OWORD *)&v5->_metrics.useRadialSmoothing = v10;
    *(_OWORD *)&v5->_metrics.var0.nonRadialSmoothing.arrowPointFactor = v9;
    v11 = [MEMORY[0x1E4F428B8] clearColor];
    [(MKSmallCalloutView *)v6 setBackgroundColor:v11];

    [(MKSmallCalloutView *)v6 setClipsToBounds:0];
    v12 = [_MKSmallCalloutPassthroughButton alloc];
    [(MKSmallCalloutView *)v6 bounds];
    uint64_t v13 = -[_MKSmallCalloutPassthroughButton initWithFrame:](v12, "initWithFrame:");
    maskedContainerView = v6->_maskedContainerView;
    v6->_maskedContainerView = (_MKSmallCalloutPassthroughButton *)v13;

    [(_MKSmallCalloutPassthroughButton *)v6->_maskedContainerView setClipsToBounds:0];
    [(_MKSmallCalloutPassthroughButton *)v6->_maskedContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKSmallCalloutView *)v6 addSubview:v6->_maskedContainerView];
    v15 = [_MKSmallCalloutContainerView alloc];
    [(MKSmallCalloutView *)v6 bounds];
    uint64_t v16 = -[_MKSmallCalloutContainerView initWithFrame:](v15, "initWithFrame:", 0.0, 0.0);
    unmaskedContainerView = v6->_unmaskedContainerView;
    v6->_unmaskedContainerView = (UIView *)v16;

    [(UIView *)v6->_unmaskedContainerView setClipsToBounds:1];
    double cornerRadius = v6->_metrics.cornerRadius;
    v19 = [(UIView *)v6->_unmaskedContainerView layer];
    [v19 setCornerRadius:cornerRadius];

    [(UIView *)v6->_unmaskedContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKSmallCalloutView *)v6 addSubview:v6->_unmaskedContainerView];
    v20 = (void *)MEMORY[0x1E4F28DC8];
    v21 = v6->_unmaskedContainerView;
    v22 = [(MKSmallCalloutView *)v6 layoutMarginsGuide];
    uint64_t v23 = [v20 constraintWithItem:v21 attribute:1 relatedBy:0 toItem:v22 attribute:1 multiplier:1.0 constant:0.0];
    unmaskedContainerLeadingConstraint = v6->_unmaskedContainerLeadingConstraint;
    v6->_unmaskedContainerLeadingConstraint = (NSLayoutConstraint *)v23;

    [(MKSmallCalloutView *)v6 addConstraint:v6->_unmaskedContainerLeadingConstraint];
    v25 = (void *)MEMORY[0x1E4F28DC8];
    v26 = v6->_unmaskedContainerView;
    v27 = [(MKSmallCalloutView *)v6 layoutMarginsGuide];
    v28 = [v25 constraintWithItem:v26 attribute:3 relatedBy:0 toItem:v27 attribute:3 multiplier:1.0 constant:0.0];
    [(MKSmallCalloutView *)v6 addConstraint:v28];

    v29 = (void *)MEMORY[0x1E4F28DC8];
    v30 = v6->_unmaskedContainerView;
    v31 = [(MKSmallCalloutView *)v6 layoutMarginsGuide];
    uint64_t v32 = [v29 constraintWithItem:v30 attribute:2 relatedBy:0 toItem:v31 attribute:2 multiplier:1.0 constant:0.0];
    unmaskedContainerTrailingConstraint = v6->_unmaskedContainerTrailingConstraint;
    v6->_unmaskedContainerTrailingConstraint = (NSLayoutConstraint *)v32;

    [(MKSmallCalloutView *)v6 addConstraint:v6->_unmaskedContainerTrailingConstraint];
    v34 = (void *)MEMORY[0x1E4F28DC8];
    v35 = v6->_unmaskedContainerView;
    v36 = [(MKSmallCalloutView *)v6 layoutMarginsGuide];
    v37 = [v34 constraintWithItem:v35 attribute:4 relatedBy:0 toItem:v36 attribute:4 multiplier:1.0 constant:0.0];
    [(MKSmallCalloutView *)v6 addConstraint:v37];

    v38 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6->_maskedContainerView attribute:5 relatedBy:0 toItem:v6 attribute:5 multiplier:1.0 constant:0.0];
    [(MKSmallCalloutView *)v6 addConstraint:v38];

    v39 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6->_maskedContainerView attribute:3 relatedBy:0 toItem:v6 attribute:3 multiplier:1.0 constant:0.0];
    [(MKSmallCalloutView *)v6 addConstraint:v39];

    v40 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6->_maskedContainerView attribute:6 relatedBy:0 toItem:v6 attribute:6 multiplier:1.0 constant:0.0];
    [(MKSmallCalloutView *)v6 addConstraint:v40];

    v41 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6->_maskedContainerView attribute:4 relatedBy:0 toItem:v6 attribute:4 multiplier:1.0 constant:0.0];
    [(MKSmallCalloutView *)v6 addConstraint:v41];

    v42 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
    centerContentLeadingGuide = v6->_centerContentLeadingGuide;
    v6->_centerContentLeadingGuide = v42;

    [(MKSmallCalloutView *)v6 addLayoutGuide:v6->_centerContentLeadingGuide];
    v44 = (void *)MEMORY[0x1E4F28DC8];
    v45 = v6->_centerContentLeadingGuide;
    v46 = [(MKSmallCalloutView *)v6 layoutMarginsGuide];
    v47 = [v44 constraintWithItem:v45 attribute:3 relatedBy:0 toItem:v46 attribute:3 multiplier:1.0 constant:0.0];
    [(MKSmallCalloutView *)v6 addConstraint:v47];

    v48 = (void *)MEMORY[0x1E4F28DC8];
    v49 = v6->_centerContentLeadingGuide;
    v50 = [(MKSmallCalloutView *)v6 layoutMarginsGuide];
    v51 = [v48 constraintWithItem:v49 attribute:4 relatedBy:0 toItem:v50 attribute:4 multiplier:1.0 constant:0.0];
    [(MKSmallCalloutView *)v6 addConstraint:v51];

    v52 = (void *)MEMORY[0x1E4F28DC8];
    v53 = v6->_centerContentLeadingGuide;
    v54 = [(MKSmallCalloutView *)v6 layoutMarginsGuide];
    v55 = [v52 constraintWithItem:v53 attribute:5 relatedBy:0 toItem:v54 attribute:5 multiplier:1.0 constant:0.0];
    [(MKSmallCalloutView *)v6 addConstraint:v55];

    v56 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6->_centerContentLeadingGuide attribute:7 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    [(MKSmallCalloutView *)v6 addConstraint:v56];

    v57 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6->_centerContentLeadingGuide attribute:7 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:v6->_metrics.padding.left];
    LODWORD(v58) = 1148829696;
    [v57 setPriority:v58];
    [(MKSmallCalloutView *)v6 addConstraint:v57];
    v59 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
    centerContentTrailingGuide = v6->_centerContentTrailingGuide;
    v6->_centerContentTrailingGuide = v59;

    [(MKSmallCalloutView *)v6 addLayoutGuide:v6->_centerContentTrailingGuide];
    v61 = (void *)MEMORY[0x1E4F28DC8];
    v62 = v6->_centerContentTrailingGuide;
    v63 = [(MKSmallCalloutView *)v6 layoutMarginsGuide];
    v64 = [v61 constraintWithItem:v62 attribute:3 relatedBy:0 toItem:v63 attribute:3 multiplier:1.0 constant:0.0];
    [(MKSmallCalloutView *)v6 addConstraint:v64];

    v65 = (void *)MEMORY[0x1E4F28DC8];
    v66 = v6->_centerContentTrailingGuide;
    v67 = [(MKSmallCalloutView *)v6 layoutMarginsGuide];
    v68 = [v65 constraintWithItem:v66 attribute:4 relatedBy:0 toItem:v67 attribute:4 multiplier:1.0 constant:0.0];
    [(MKSmallCalloutView *)v6 addConstraint:v68];

    v69 = (void *)MEMORY[0x1E4F28DC8];
    v70 = v6->_centerContentTrailingGuide;
    v71 = [(MKSmallCalloutView *)v6 layoutMarginsGuide];
    v72 = [v69 constraintWithItem:v70 attribute:6 relatedBy:0 toItem:v71 attribute:6 multiplier:1.0 constant:0.0];
    [(MKSmallCalloutView *)v6 addConstraint:v72];

    v73 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6->_centerContentTrailingGuide attribute:7 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    [(MKSmallCalloutView *)v6 addConstraint:v73];

    v74 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6->_centerContentTrailingGuide attribute:7 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:v6->_metrics.padding.right];

    LODWORD(v75) = 1148829696;
    [v74 setPriority:v75];
    [(MKSmallCalloutView *)v6 addConstraint:v74];
    v76 = [_MKUILabel alloc];
    uint64_t v77 = -[_MKUILabel initWithFrame:](v76, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = (_MKUILabel *)v77;

    v79 = [MEMORY[0x1E4F428B8] clearColor];
    [(_MKUILabel *)v6->_titleLabel setBackgroundColor:v79];

    v80 = (void *)MEMORY[0x1E4F42A30];
    uint64_t v81 = *MEMORY[0x1E4F43870];
    v82 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43870] addingSymbolicTraits:0x8000 options:0];
    v83 = [v80 fontWithDescriptor:v82 size:0.0];
    [(_MKUILabel *)v6->_titleLabel setFont:v83];

    v84 = [MEMORY[0x1E4F428B8] labelColor];
    [(_MKUILabel *)v6->_titleLabel setTextColor:v84];

    [(_MKUILabel *)v6->_titleLabel setLineBreakMode:4];
    [(_MKUILabel *)v6->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v85) = 1132068864;
    [(UIView *)v6->_titleLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v85];
    LODWORD(v86) = 1148829696;
    [(UIView *)v6->_titleLabel _mapkit_setContentCompressionResistancePriority:1 forAxis:v86];
    [(MKSmallCalloutView *)v6 addSubview:v6->_titleLabel];
    v87 = [MEMORY[0x1E4F1CA48] array];
    v88 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6->_titleLabel attribute:5 relatedBy:0 toItem:v6->_centerContentLeadingGuide attribute:6 multiplier:1.0 constant:0.0];
    [(NSArray *)v87 addObject:v88];

    v89 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6->_titleLabel attribute:6 relatedBy:-1 toItem:v6->_centerContentTrailingGuide attribute:5 multiplier:1.0 constant:0.0];
    [(NSArray *)v87 addObject:v89];

    v90 = (void *)MEMORY[0x1E4F28DC8];
    v91 = _NSDictionaryOfVariableBindings(&cfstr_Titlelabel_0.isa, v6->_titleLabel, 0);
    v92 = [v90 constraintsWithVisualFormat:@"V:|-(>=0)-[_titleLabel]-(>=0)-|" options:0 metrics:0 views:v91];
    [(NSArray *)v87 addObjectsFromArray:v92];

    v93 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v81];
    v94 = (void *)MEMORY[0x1E4F28DC8];
    v95 = v6->_titleLabel;
    v96 = [(MKSmallCalloutView *)v6 layoutMarginsGuide];
    [v93 _scaledValueForValue:30.0];
    uint64_t v98 = [v94 constraintWithItem:v95 attribute:12 relatedBy:1 toItem:v96 attribute:3 multiplier:1.0 constant:v97];
    titleBaselineFromTopMinimumConstraint = v6->_titleBaselineFromTopMinimumConstraint;
    v6->_titleBaselineFromTopMinimumConstraint = (NSLayoutConstraint *)v98;

    LODWORD(v100) = 1148829696;
    [(NSLayoutConstraint *)v6->_titleBaselineFromTopMinimumConstraint setPriority:v100];
    [(NSArray *)v87 addObject:v6->_titleBaselineFromTopMinimumConstraint];
    v101 = (void *)MEMORY[0x1E4F28DC8];
    v102 = v6->_titleLabel;
    v103 = [(MKSmallCalloutView *)v6 layoutMarginsGuide];
    [v93 _scaledValueForValue:30.0];
    uint64_t v105 = [v101 constraintWithItem:v102 attribute:12 relatedBy:0 toItem:v103 attribute:3 multiplier:1.0 constant:v104];
    titleBaselineFromTopConstraint = v6->_titleBaselineFromTopConstraint;
    v6->_titleBaselineFromTopConstraint = (NSLayoutConstraint *)v105;

    LODWORD(v107) = 1144750080;
    [(NSLayoutConstraint *)v6->_titleBaselineFromTopConstraint setPriority:v107];
    [(NSArray *)v87 addObject:v6->_titleBaselineFromTopConstraint];
    v108 = (void *)MEMORY[0x1E4F28DC8];
    v109 = v6->_titleLabel;
    v110 = v6->_unmaskedContainerView;
    [v93 _scaledValueForValue:20.0];
    uint64_t v112 = [v108 constraintWithItem:v109 attribute:11 relatedBy:-1 toItem:v110 attribute:4 multiplier:1.0 constant:-v111];
    titleMinimumBaselineToBottomConstraint = v6->_titleMinimumBaselineToBottomConstraint;
    v6->_titleMinimumBaselineToBottomConstraint = (NSLayoutConstraint *)v112;

    LODWORD(v114) = 1148829696;
    [(NSLayoutConstraint *)v6->_titleMinimumBaselineToBottomConstraint setPriority:v114];
    [(NSArray *)v87 addObject:v6->_titleMinimumBaselineToBottomConstraint];
    [(MKSmallCalloutView *)v6 addConstraints:v87];
    titleLabelConstraints = v6->_titleLabelConstraints;
    v6->_titleLabelConstraints = v87;
    v116 = v87;

    [MEMORY[0x1E4F28DC8] deactivateConstraints:v6->_titleLabelConstraints];
    v117 = [MEMORY[0x1E4F42D90] mainScreen];
    [v117 bounds];
    CGFloat v119 = v118;
    CGFloat v121 = v120;
    CGFloat v123 = v122;
    CGFloat v125 = v124;

    v136.origin.x = v119;
    v136.origin.y = v121;
    v136.size.width = v123;
    v136.size.height = v125;
    double Width = CGRectGetWidth(v136);
    v137.origin.x = v119;
    v137.origin.y = v121;
    v137.size.width = v123;
    v137.size.height = v125;
    if (Width >= CGRectGetHeight(v137))
    {
      v139.origin.x = v119;
      v139.origin.y = v121;
      v139.size.width = v123;
      v139.size.height = v125;
      double Height = CGRectGetHeight(v139);
    }
    else
    {
      v138.origin.x = v119;
      v138.origin.y = v121;
      v138.size.width = v123;
      v138.size.height = v125;
      double Height = CGRectGetWidth(v138);
    }
    double v128 = fmin(Height + v6->_metrics.margin * -2.0, 390.0);
    uint64_t v129 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6 attribute:7 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:39.0];
    minWidthConstraint = v6->_minWidthConstraint;
    v6->_minWidthConstraint = (NSLayoutConstraint *)v129;

    [(MKSmallCalloutView *)v6 addConstraint:v6->_minWidthConstraint];
    uint64_t v131 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6 attribute:7 relatedBy:-1 toItem:0 attribute:0 multiplier:1.0 constant:v128];
    maxWidthConstraint = v6->_maxWidthConstraint;
    v6->_maxWidthConstraint = (NSLayoutConstraint *)v131;

    [(MKSmallCalloutView *)v6 addConstraint:v6->_maxWidthConstraint];
    v133 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v133 addObserver:v6 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4F43788] object:0];
  }
  return v6;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F42A30];
  uint64_t v5 = *MEMORY[0x1E4F43870];
  long long v6 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43870] addingSymbolicTraits:0x8000 options:0];
  long long v7 = [v4 fontWithDescriptor:v6 size:0.0];
  [(_MKUILabel *)self->_titleLabel setFont:v7];

  long long v8 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
  [(_MKUILabel *)self->_subtitleLabel setFont:v8];

  id v11 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v5];
  [v11 _scaledValueForValue:30.0];
  -[NSLayoutConstraint setConstant:](self->_titleBaselineFromTopConstraint, "setConstant:");
  [(NSLayoutConstraint *)self->_titleBaselineFromTopConstraint constant];
  -[NSLayoutConstraint setConstant:](self->_titleBaselineFromTopMinimumConstraint, "setConstant:");
  double top = self->_metrics.padding.top;
  if (self->_metrics.scaleVerticalPaddingForDynamicType) {
    [v11 _scaledValueForValue:top];
  }
  [(NSLayoutConstraint *)self->_detailViewMinTopConstraint setConstant:top];
  double bottom = self->_metrics.padding.bottom;
  if (self->_metrics.scaleVerticalPaddingForDynamicType) {
    [v11 _scaledValueForValue:bottom];
  }
  [(NSLayoutConstraint *)self->_detailViewBottomConstraint setConstant:-bottom];
  [(MKSmallCalloutView *)self setNeedsUpdateConstraints];
  [(MKSmallCalloutView *)self _setNeedsUpdatePreferredContentSize];
}

- (double)minimumWidth
{
  [(NSLayoutConstraint *)self->_minWidthConstraint constant];
  return result;
}

- (void)setMinimumWidth:(double)a3
{
  [(NSLayoutConstraint *)self->_minWidthConstraint setConstant:a3];

  [(MKSmallCalloutView *)self _setNeedsUpdatePreferredContentSize];
}

- (double)maximumWidth
{
  [(NSLayoutConstraint *)self->_maxWidthConstraint constant];
  return result;
}

- (void)setMaximumWidth:(double)a3
{
  [(NSLayoutConstraint *)self->_maxWidthConstraint setConstant:a3];

  [(MKSmallCalloutView *)self _setNeedsUpdatePreferredContentSize];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MKSmallCalloutView;
  [(MKSmallCalloutView *)&v4 dealloc];
}

- (void)reset
{
  [(MKSmallCalloutView *)self setLeftView:0];
  [(MKSmallCalloutView *)self setRightView:0];
  [(MKSmallCalloutView *)self setDetailView:0];
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = 0;

  self->_shouldPositionTitleForMapsTransitionMovingSideways = 0;
}

- (void)beginMapsTransitionMovingSideways
{
  self->_shouldPositionTitleForMapsTransitionMovingSideways = 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(MKSmallCalloutView *)self _updatePreferredContentSizeIfNeeded];
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setNeedsUpdatePreferredContentSize
{
  self->_needsPreferredContentSizeUpdate = 1;
}

- (void)_updatePreferredContentSizeIfNeeded
{
  if (self->_needsPreferredContentSizeUpdate) {
    [(MKSmallCalloutView *)self _updatePreferredContentSize];
  }
}

- (void)_updatePreferredContentSize
{
  self->_needsPreferredContentSizeUpdate = 0;
  [(UIView *)self _mapkit_updateConstraintsIfNeeded];
  LODWORD(v3) = 1112014848;
  LODWORD(v4) = 1112014848;
  -[MKSmallCalloutView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8), v3, v4);
  self->_preferredContentSize.double width = v5;
  self->_preferredContentSize.double height = v6;
}

- (CGSize)preferredContentSize
{
  [(MKSmallCalloutView *)self _updatePreferredContentSizeIfNeeded];
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)_maskedContainerView
{
  return self->_maskedContainerView;
}

- (void)setCalloutTitle:(id)a3
{
  id v11 = a3;
  double v4 = [(_MKUILabel *)self->_titleLabel text];
  if ([v11 isEqualToString:v4])
  {

    goto LABEL_10;
  }
  CGFloat v5 = [(_MKUILabel *)self->_titleLabel text];
  if (v5)
  {

LABEL_6:
    [(_MKUILabel *)self->_titleLabel setText:v11];
    long long v7 = [(_MKUILabel *)self->_titleLabel text];
    uint64_t v8 = [v7 length];

    titleLabelConstraints = self->_titleLabelConstraints;
    if (v8)
    {
      [MEMORY[0x1E4F28DC8] activateConstraints:titleLabelConstraints];
      double v10 = 1.0;
    }
    else
    {
      [MEMORY[0x1E4F28DC8] deactivateConstraints:titleLabelConstraints];
      double v10 = 0.0;
    }
    [(_MKUILabel *)self->_titleLabel setAlpha:v10];
    [(UIView *)self _mapkit_setNeedsUpdateConstraints];
    [(MKSmallCalloutView *)self _setNeedsUpdatePreferredContentSize];
    goto LABEL_10;
  }
  uint64_t v6 = [v11 length];

  if (v6) {
    goto LABEL_6;
  }
LABEL_10:
}

- (NSString)calloutTitle
{
  return (NSString *)[(_MKUILabel *)self->_titleLabel text];
}

- (void)setCalloutSubtitle:(id)a3
{
}

- (void)setCalloutSubtitle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v20 = a3;
  uint64_t v6 = [(_MKUILabel *)self->_subtitleLabel text];
  if ([v20 isEqualToString:v6])
  {

    goto LABEL_17;
  }
  if (self->_subtitleLabel)
  {
  }
  else
  {
    uint64_t v7 = [v20 length];

    if (!v7) {
      goto LABEL_17;
    }
  }
  detailView = (_MKUILabel *)self->_detailView;
  if (detailView) {
    BOOL v9 = detailView != self->_subtitleLabel;
  }
  else {
    BOOL v9 = 0;
  }
  if ([v20 length])
  {
    if (!v4)
    {
      subtitleLabel = self->_subtitleLabel;
      if (subtitleLabel)
      {
        id v11 = self->_detailView;
        if (v11)
        {
          if (v11 == (_MKCalloutAccessoryView *)subtitleLabel)
          {
            [(_MKUILabel *)subtitleLabel setText:v20];
            [(UIView *)self _mapkit_setNeedsUpdateConstraints];
            [(MKSmallCalloutView *)self _setNeedsUpdatePreferredContentSize];
            goto LABEL_17;
          }
        }
      }
    }
    v12 = [_MKUILabel alloc];
    uint64_t v13 = -[_MKUILabel initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v14 = self->_subtitleLabel;
    self->_subtitleLabel = v13;

    v15 = [MEMORY[0x1E4F428B8] clearColor];
    [(_MKUILabel *)self->_subtitleLabel setBackgroundColor:v15];

    uint64_t v16 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
    [(_MKUILabel *)self->_subtitleLabel setFont:v16];

    v17 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(_MKUILabel *)self->_subtitleLabel setTextColor:v17];

    [(_MKUILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MKUILabel *)self->_subtitleLabel setLineBreakMode:4];
    LODWORD(v18) = 1132068864;
    [(UIView *)self->_subtitleLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v18];
    [(_MKUILabel *)self->_subtitleLabel setText:v20];
    if (!v9) {
      goto LABEL_16;
    }
  }
  else
  {
    v19 = self->_subtitleLabel;
    self->_subtitleLabel = 0;

    if (!v9) {
LABEL_16:
    }
      [(MKSmallCalloutView *)self setDetailView:0 animated:v4];
  }
LABEL_17:
}

- (NSString)calloutSubtitle
{
  return (NSString *)[(_MKUILabel *)self->_subtitleLabel text];
}

- (UIView)leftView
{
  return (UIView *)self->_externalLeftView;
}

- (UIView)rightView
{
  return (UIView *)self->_externalRightView;
}

- (void)setLeftView:(id)a3
{
}

- (void)setRightView:(id)a3
{
}

- (void)setLeftView:(id)a3 animated:(BOOL)a4
{
  BOOL v70 = a4;
  v86[3] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (_MKCalloutAccessoryView *)a3;
  if (self->_externalLeftView != v6)
  {
    uint64_t v7 = self->_leftView;
    v68 = self->_leftViewMinCalloutWidthConstraint;
    location = (id *)&self->_leftViewHorizontalPositionConstraint;
    v67 = self->_leftViewHorizontalPositionConstraint;
    p_leftViewCenterContentMarginConstraint = (id *)&self->_leftViewCenterContentMarginConstraint;
    v66 = self->_leftViewCenterContentMarginConstraint;
    v69 = self->_leftViewTopSpacerBottomConstraint;
    v65 = self->_leftViewLeftSpacer;
    v64 = self->_leftViewTopSpacer;
    objc_storeStrong((id *)&self->_externalLeftView, a3);
    if (v6)
    {
      uint64_t v8 = [[_MKCalloutAccessoryWrapperView alloc] initWithView:self->_externalLeftView];
      leftView = self->_leftView;
      self->_leftView = (_MKCalloutAccessoryView *)v8;

      [(_MKCalloutAccessoryView *)self->_leftView setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    else
    {
      double v10 = self->_leftView;
      self->_leftView = 0;
    }
    id v11 = self->_leftView;
    if (v11)
    {
      v60 = v7;
      v61 = v6;
      [(_MKCalloutAccessoryView *)v11 frame];
      if ((50.0 - v12) * 0.5 > 0.0) {
        [(_MKCalloutAccessoryView *)self->_leftView frame];
      }
      UIRoundToViewScale();
      uint64_t v13 = 2;
      if (v14 == 0.0) {
        uint64_t v13 = 1;
      }
      id v59 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MKSmallCalloutView__metrics[v13]);
      [v59 addSubview:self->_leftView];
      v15 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_leftView attribute:10 relatedBy:1 toItem:self->_unmaskedContainerView attribute:10 multiplier:1.0 constant:0.0];
      LODWORD(v16) = 1144750080;
      [v15 setPriority:v16];
      v17 = (void *)MEMORY[0x1E4F28DC8];
      double v18 = self->_leftView;
      v19 = [(MKSmallCalloutView *)self layoutMarginsGuide];
      id v20 = [v17 constraintWithItem:v18 attribute:3 relatedBy:1 toItem:v19 attribute:3 multiplier:1.0 constant:0.0];

      LODWORD(v21) = 1148846080;
      [v20 setPriority:v21];
      double v58 = v15;
      [(MKSmallCalloutView *)self addConstraint:v15];
      [(MKSmallCalloutView *)self addConstraint:v20];
      v22 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
      leftViewTopSpacer = self->_leftViewTopSpacer;
      self->_leftViewTopSpacer = v22;

      [(MKSmallCalloutView *)self addLayoutGuide:self->_leftViewTopSpacer];
      v24 = (void *)MEMORY[0x1E4F28DC8];
      v25 = self->_leftViewTopSpacer;
      v26 = [(MKSmallCalloutView *)self layoutMarginsGuide];
      v27 = [v24 constraintWithItem:v25 attribute:3 relatedBy:0 toItem:v26 attribute:3 multiplier:1.0 constant:0.0];
      [(MKSmallCalloutView *)self addConstraint:v27];

      v28 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_leftViewTopSpacer attribute:4 relatedBy:0 toItem:self->_leftView attribute:3 multiplier:1.0 constant:0.0];
      leftViewTopSpacerBottomConstraint = self->_leftViewTopSpacerBottomConstraint;
      self->_leftViewTopSpacerBottomConstraint = v28;

      [(MKSmallCalloutView *)self addConstraint:self->_leftViewTopSpacerBottomConstraint];
      v30 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
      leftViewLeftSpacer = self->_leftViewLeftSpacer;
      self->_leftViewLeftSpacer = v30;

      [(MKSmallCalloutView *)self addLayoutGuide:self->_leftViewLeftSpacer];
      uint64_t v32 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_leftViewLeftSpacer attribute:5 relatedBy:0 toItem:self->_unmaskedContainerView attribute:5 multiplier:1.0 constant:0.0];
      [(MKSmallCalloutView *)self addConstraint:v32];

      v33 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_leftViewLeftSpacer attribute:7 relatedBy:0 toItem:self->_leftViewTopSpacer attribute:8 multiplier:1.0 constant:0.0];
      LODWORD(v34) = 1144733696;
      [v33 setPriority:v34];
      [(MKSmallCalloutView *)self addConstraint:v33];
      v35 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_leftViewLeftSpacer attribute:7 relatedBy:-1 toItem:0 attribute:0 multiplier:1.0 constant:16.0];
      [(MKSmallCalloutView *)self addConstraint:v35];

      v36 = [(_MKCalloutAccessoryView *)self->_leftView leadingAnchor];
      v37 = [(UILayoutGuide *)self->_leftViewLeftSpacer trailingAnchor];
      v38 = [v36 constraintEqualToAnchor:v37];

      [(MKSmallCalloutView *)self addConstraint:v38];
      v39 = [(UILayoutGuide *)self->_centerContentLeadingGuide trailingAnchor];
      v40 = [(_MKCalloutAccessoryView *)self->_leftView trailingAnchor];
      v41 = [v39 constraintGreaterThanOrEqualToAnchor:v40 constant:self->_metrics.padding.left];

      [(MKSmallCalloutView *)self addConstraint:v41];
      v42 = self->_leftViewTopSpacerBottomConstraint;
      v86[0] = v38;
      v86[1] = v42;
      v86[2] = v41;
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:3];
      objc_storeStrong(location, v38);
      objc_storeStrong(p_leftViewCenterContentMarginConstraint, v41);
      v44 = self->_leftView;
      if (v70)
      {
        [(_MKCalloutAccessoryView *)v44 setAlpha:0.0];
        [MEMORY[0x1E4F28DC8] deactivateConstraints:v43];
        [(NSLayoutConstraint *)self->_leftViewMinCalloutWidthConstraint setActive:0];
        v45 = [(_MKCalloutAccessoryView *)self->_leftView trailingAnchor];
        v46 = [(MKSmallCalloutView *)self leadingAnchor];
        v47 = [v45 constraintEqualToAnchor:v46];

        [v47 setActive:1];
        double v85 = v47;
        v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
        [(UIView *)self _mapkit_updateConstraintsIfNeeded];
        [(UIView *)self _mapkit_layoutIfNeeded];
      }
      else
      {
        [(_MKCalloutAccessoryView *)v44 setAlpha:1.0];
        v48 = 0;
      }
      v55 = v67;
      v54 = v68;

      uint64_t v7 = v60;
      uint64_t v6 = v61;
    }
    else
    {
      leftViewMinCalloutWidthConstraint = self->_leftViewMinCalloutWidthConstraint;
      self->_leftViewMinCalloutWidthConstraint = 0;

      id v50 = *location;
      id *location = 0;

      id v51 = *p_leftViewCenterContentMarginConstraint;
      id *p_leftViewCenterContentMarginConstraint = 0;

      v52 = self->_leftViewTopSpacer;
      self->_leftViewTopSpacer = 0;

      v53 = self->_leftViewLeftSpacer;
      self->_leftViewLeftSpacer = 0;

      v43 = 0;
      v48 = 0;
      v55 = v67;
      v54 = v68;
    }
    [(UIView *)self _mapkit_setNeedsLayout];
    [(UIView *)self _mapkit_setNeedsUpdateConstraints];
    if (v70)
    {
      v71 = (void *)MEMORY[0x1E4F42FF0];
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __43__MKSmallCalloutView_setLeftView_animated___block_invoke;
      v77[3] = &unk_1E54BF540;
      v77[4] = self;
      v78 = v7;
      id v79 = v48;
      id v80 = v43;
      uint64_t v81 = v55;
      v82 = v69;
      v83 = v66;
      v84 = v54;
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __43__MKSmallCalloutView_setLeftView_animated___block_invoke_2;
      v72[3] = &unk_1E54BF568;
      v73 = v78;
      v74 = self;
      v56 = v65;
      double v75 = v65;
      v57 = v64;
      v76 = v64;
      objc_msgSend(v71, "_mapkit_animateWithDuration:animations:completion:", v77, v72, 0.349999994);
    }
    else
    {
      [(_MKCalloutAccessoryView *)v7 removeFromSuperview];
      v56 = v65;
      if (v65) {
        [(MKSmallCalloutView *)self removeLayoutGuide:v65];
      }
      v57 = v64;
      if (v64) {
        [(MKSmallCalloutView *)self removeLayoutGuide:v64];
      }
    }
    [(MKSmallCalloutView *)self _setNeedsUpdatePreferredContentSize];
  }
}

uint64_t __43__MKSmallCalloutView_setLeftView_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:1.0];
  [*(id *)(a1 + 40) setAlpha:0.0];
  if (*(void *)(a1 + 48)) {
    objc_msgSend(*(id *)(a1 + 32), "removeConstraints:");
  }
  if (*(void *)(a1 + 56)) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "activateConstraints:");
  }
  [*(id *)(*(void *)(a1 + 32) + 696) setActive:1];
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 64) setActive:0];
    [*(id *)(a1 + 72) setActive:0];
    [*(id *)(a1 + 80) setActive:0];
    v2 = *(void **)(a1 + 32);
    double v3 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(a1 + 40) attribute:6 relatedBy:0 toItem:v2 attribute:5 multiplier:1.0 constant:0.0];
    [v2 addConstraint:v3];
  }
  if (*(void *)(a1 + 88)) {
    objc_msgSend(*(id *)(a1 + 32), "removeConstraint:");
  }
  objc_msgSend(*(id *)(a1 + 32), "_mapkit_updateConstraintsIfNeeded");
  BOOL v4 = *(void **)(a1 + 32);

  return objc_msgSend(v4, "_mapkit_layoutIfNeeded");
}

uint64_t __43__MKSmallCalloutView_setLeftView_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_mapkit_isDescendantOfView:", *(void *)(a1 + 40));
  if (result) {
    uint64_t result = [*(id *)(a1 + 32) removeFromSuperview];
  }
  if (*(void *)(a1 + 48)) {
    uint64_t result = objc_msgSend(*(id *)(a1 + 40), "removeLayoutGuide:");
  }
  if (*(void *)(a1 + 56))
  {
    double v3 = *(void **)(a1 + 40);
    return objc_msgSend(v3, "removeLayoutGuide:");
  }
  return result;
}

- (void)setRightView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v82[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (_MKCalloutAccessoryView *)a3;
  if (self->_externalRightView != v7)
  {
    uint64_t v8 = self->_rightView;
    location = (id *)&self->_rightViewHorizontalPositionConstraint;
    v67 = self->_rightViewHorizontalPositionConstraint;
    p_rightViewCenterContentMarginConstraint = (id *)&self->_rightViewCenterContentMarginConstraint;
    v66 = self->_rightViewCenterContentMarginConstraint;
    v65 = self->_rightViewTopSpacerBottomConstraint;
    v64 = self->_rightViewTopSpacer;
    v63 = self->_rightViewRightSpacer;
    objc_storeStrong((id *)&self->_externalRightView, a3);
    if (v7)
    {
      BOOL v9 = [[_MKCalloutAccessoryWrapperView alloc] initWithView:self->_externalRightView];
      rightView = self->_rightView;
      self->_rightView = (_MKCalloutAccessoryView *)v9;

      [(_MKCalloutAccessoryView *)self->_rightView setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    else
    {
      id v11 = self->_rightView;
      self->_rightView = 0;
    }
    uint64_t v12 = [(_MKCalloutAccessoryView *)self->_rightView _mapkit_accessoryControlToExtendWithCallout];
    v62 = (void *)v12;
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    [(_MKSmallCalloutPassthroughButton *)self->_maskedContainerView setTargetControl:v13];
    double v14 = self->_rightView;
    if (v14)
    {
      BOOL v57 = v4;
      double v58 = v8;
      id v59 = v7;
      [(_MKCalloutAccessoryView *)v14 frame];
      if ((50.0 - v15) * 0.5 > 0.0) {
        [(_MKCalloutAccessoryView *)self->_rightView frame];
      }
      UIRoundToViewScale();
      uint64_t v16 = 2;
      if (v17 == 0.0) {
        uint64_t v16 = 1;
      }
      id v56 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MKSmallCalloutView__metrics[v16]);
      [v56 addSubview:self->_rightView];
      double v18 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_rightView attribute:10 relatedBy:1 toItem:self->_unmaskedContainerView attribute:10 multiplier:1.0 constant:0.0];
      LODWORD(v19) = 1144750080;
      [v18 setPriority:v19];
      id v20 = (void *)MEMORY[0x1E4F28DC8];
      double v21 = self->_rightView;
      v22 = [(MKSmallCalloutView *)self layoutMarginsGuide];
      uint64_t v23 = [v20 constraintWithItem:v21 attribute:3 relatedBy:1 toItem:v22 attribute:3 multiplier:1.0 constant:0.0];

      LODWORD(v24) = 1148846080;
      [v23 setPriority:v24];
      v55 = v18;
      [(MKSmallCalloutView *)self addConstraint:v18];
      v54 = v23;
      [(MKSmallCalloutView *)self addConstraint:v23];
      v25 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
      rightViewTopSpacer = self->_rightViewTopSpacer;
      self->_rightViewTopSpacer = v25;

      [(MKSmallCalloutView *)self addLayoutGuide:self->_rightViewTopSpacer];
      v27 = (void *)MEMORY[0x1E4F28DC8];
      v28 = self->_rightViewTopSpacer;
      v29 = [(MKSmallCalloutView *)self layoutMarginsGuide];
      v30 = [v27 constraintWithItem:v28 attribute:3 relatedBy:0 toItem:v29 attribute:3 multiplier:1.0 constant:0.0];
      [(MKSmallCalloutView *)self addConstraint:v30];

      v31 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_rightViewTopSpacer attribute:4 relatedBy:0 toItem:self->_rightView attribute:3 multiplier:1.0 constant:0.0];
      rightViewTopSpacerBottomConstraint = self->_rightViewTopSpacerBottomConstraint;
      self->_rightViewTopSpacerBottomConstraint = v31;

      [(MKSmallCalloutView *)self addConstraint:self->_rightViewTopSpacerBottomConstraint];
      v33 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
      rightViewRightSpacer = self->_rightViewRightSpacer;
      self->_rightViewRightSpacer = v33;

      [(MKSmallCalloutView *)self addLayoutGuide:self->_rightViewRightSpacer];
      v35 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_rightViewRightSpacer attribute:6 relatedBy:0 toItem:self->_unmaskedContainerView attribute:6 multiplier:1.0 constant:0.0];
      [(MKSmallCalloutView *)self addConstraint:v35];

      v36 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_rightViewRightSpacer attribute:7 relatedBy:0 toItem:self->_rightViewTopSpacer attribute:8 multiplier:1.0 constant:0.0];
      LODWORD(v37) = 1144733696;
      [v36 setPriority:v37];
      [(MKSmallCalloutView *)self addConstraint:v36];
      v38 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_rightViewRightSpacer attribute:7 relatedBy:-1 toItem:0 attribute:0 multiplier:1.0 constant:16.0];
      [(MKSmallCalloutView *)self addConstraint:v38];

      v39 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_rightView attribute:6 relatedBy:0 toItem:self->_rightViewRightSpacer attribute:5 multiplier:1.0 constant:0.0];
      [(MKSmallCalloutView *)self addConstraint:v39];
      v40 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_centerContentTrailingGuide attribute:5 relatedBy:-1 toItem:self->_rightView attribute:5 multiplier:1.0 constant:-self->_metrics.padding.right];
      [(MKSmallCalloutView *)self addConstraint:v40];
      v41 = self->_rightViewTopSpacerBottomConstraint;
      v82[0] = v39;
      v82[1] = v41;
      v82[2] = v40;
      uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:3];
      objc_storeStrong(location, v39);
      objc_storeStrong(p_rightViewCenterContentMarginConstraint, v40);
      v43 = self->_rightView;
      BOOL v4 = v57;
      v68 = (void *)v42;
      if (v57)
      {
        [(_MKCalloutAccessoryView *)v43 setAlpha:0.0];
        [MEMORY[0x1E4F28DC8] deactivateConstraints:v42];
        v44 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_rightView attribute:5 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:0.0];
        [(MKSmallCalloutView *)self addConstraint:v44];
        uint64_t v81 = v44;
        v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
        [(UIView *)self _mapkit_updateConstraintsIfNeeded];
        [(UIView *)self _mapkit_layoutIfNeeded];
      }
      else
      {
        [(_MKCalloutAccessoryView *)v43 setAlpha:1.0];
        v45 = 0;
      }
      uint64_t v7 = v59;
      id v50 = v67;

      uint64_t v8 = v58;
    }
    else
    {
      id v46 = *location;
      id *location = 0;

      id v47 = *p_rightViewCenterContentMarginConstraint;
      id *p_rightViewCenterContentMarginConstraint = 0;

      v48 = self->_rightViewTopSpacer;
      self->_rightViewTopSpacer = 0;

      v49 = self->_rightViewRightSpacer;
      self->_rightViewRightSpacer = 0;

      v68 = 0;
      v45 = 0;
      id v50 = v67;
    }
    [(UIView *)self _mapkit_setNeedsLayout];
    [(UIView *)self _mapkit_setNeedsUpdateConstraints];
    if (v4)
    {
      id v51 = (void *)MEMORY[0x1E4F42FF0];
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __44__MKSmallCalloutView_setRightView_animated___block_invoke;
      v74[3] = &unk_1E54B96C8;
      v74[4] = self;
      double v75 = v8;
      id v76 = v45;
      id v77 = v68;
      v78 = v50;
      id v79 = v66;
      id v80 = v65;
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __44__MKSmallCalloutView_setRightView_animated___block_invoke_2;
      v69[3] = &unk_1E54BF568;
      BOOL v70 = v75;
      v71 = self;
      v52 = v64;
      v72 = v64;
      v53 = v63;
      v73 = v63;
      objc_msgSend(v51, "_mapkit_animateWithDuration:animations:completion:", v74, v69, 0.349999994);
    }
    else
    {
      [(_MKCalloutAccessoryView *)v8 removeFromSuperview];
      v52 = v64;
      if (v64) {
        [(MKSmallCalloutView *)self removeLayoutGuide:v64];
      }
      v53 = v63;
      if (v63) {
        [(MKSmallCalloutView *)self removeLayoutGuide:v63];
      }
    }
    [(MKSmallCalloutView *)self _setNeedsUpdatePreferredContentSize];
  }
}

uint64_t __44__MKSmallCalloutView_setRightView_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:1.0];
  [*(id *)(a1 + 40) setAlpha:0.0];
  if (*(void *)(a1 + 48)) {
    objc_msgSend(*(id *)(a1 + 32), "removeConstraints:");
  }
  if (*(void *)(a1 + 56)) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "activateConstraints:");
  }
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 64) setActive:0];
    [*(id *)(a1 + 72) setActive:0];
    [*(id *)(a1 + 80) setActive:0];
    v2 = *(void **)(a1 + 32);
    double v3 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(a1 + 40) attribute:5 relatedBy:0 toItem:v2 attribute:6 multiplier:1.0 constant:0.0];
    [v2 addConstraint:v3];
  }
  objc_msgSend(*(id *)(a1 + 32), "_mapkit_updateConstraintsIfNeeded");
  BOOL v4 = *(void **)(a1 + 32);

  return objc_msgSend(v4, "_mapkit_layoutIfNeeded");
}

uint64_t __44__MKSmallCalloutView_setRightView_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_mapkit_isDescendantOfView:", *(void *)(a1 + 40));
  if (result) {
    uint64_t result = [*(id *)(a1 + 32) removeFromSuperview];
  }
  if (*(void *)(a1 + 48)) {
    uint64_t result = objc_msgSend(*(id *)(a1 + 40), "removeLayoutGuide:");
  }
  if (*(void *)(a1 + 56))
  {
    double v3 = *(void **)(a1 + 40);
    return objc_msgSend(v3, "removeLayoutGuide:");
  }
  return result;
}

- (UIView)detailView
{
  return (UIView *)self->_externalDetailView;
}

- (void)setDetailView:(id)a3
{
}

- (void)setDetailView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (_MKUILabel *)a3;
  if (!v6)
  {
    uint64_t v7 = [(_MKUILabel *)self->_subtitleLabel text];
    uint64_t v8 = [v7 length];

    if (v8) {
      uint64_t v6 = self->_subtitleLabel;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  if (v6 != (_MKUILabel *)self->_externalDetailView)
  {
    p_detailView = &self->_detailView;
    double v10 = self->_detailView;
    id v11 = self->_detailViewBottomConstraint;
    uint64_t v12 = self->_detailViewTrailingConstraint;
    objc_storeStrong((id *)&self->_externalDetailView, v6);
    objc_storeStrong((id *)&self->_detailView, v6);
    [(_MKCalloutAccessoryView *)self->_detailView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v13) = 1132068864;
    [(_MKCalloutAccessoryView *)self->_detailView _mapkit_setContentCompressionResistancePriority:0 forAxis:v13];
    LODWORD(v14) = 1148846080;
    [(_MKCalloutAccessoryView *)self->_detailView _mapkit_setContentCompressionResistancePriority:1 forAxis:v14];
    if (self->_detailView)
    {
      -[UIView addSubview:](self->_unmaskedContainerView, "addSubview:");
      [(_MKCalloutAccessoryView *)*p_detailView updateConstraintsIfNeeded];
      double v15 = *p_detailView;
    }
    else
    {
      double v15 = 0;
    }
    double v16 = 1.0;
    if (v4) {
      double v16 = 0.0;
    }
    [(_MKCalloutAccessoryView *)v15 setAlpha:v16];
    if (*p_detailView)
    {
      BOOL v46 = v4;
      v43 = v12;
      v44 = v11;
      v45 = v10;
      double v17 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
      double v18 = (void *)MEMORY[0x1E4F28DC8];
      double v19 = *p_detailView;
      titleLabel = self->_titleLabel;
      uint64_t v42 = v17;
      [(NSLayoutConstraint *)v17 _scaledValueForValue:18.0];
      v22 = [v18 constraintWithItem:v19 attribute:12 relatedBy:0 toItem:titleLabel attribute:11 multiplier:1.0 constant:v21];
      LODWORD(v23) = 1148813312;
      [v22 setPriority:v23];
      [(MKSmallCalloutView *)self addConstraint:v22];
      double v24 = [MEMORY[0x1E4F28DC8] constraintWithItem:*p_detailView attribute:3 relatedBy:1 toItem:self->_titleLabel attribute:11 multiplier:1.0 constant:5.0];
      LODWORD(v25) = 1148829696;
      [v24 setPriority:v25];
      [(MKSmallCalloutView *)self addConstraint:v24];
      if (self->_metrics.scaleVerticalPaddingForDynamicType)
      {
        v26 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
        [v26 _scaledValueForValue:self->_metrics.padding.top];
        double top = v27;
      }
      else
      {
        double top = self->_metrics.padding.top;
      }
      v31 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v32 = *p_detailView;
      v33 = [(MKSmallCalloutView *)self layoutMarginsGuide];
      double v34 = [v31 constraintWithItem:v32 attribute:3 relatedBy:1 toItem:v33 attribute:3 multiplier:1.0 constant:top];
      detailViewMinTopConstraint = self->_detailViewMinTopConstraint;
      self->_detailViewMinTopConstraint = v34;

      [(MKSmallCalloutView *)self addConstraint:self->_detailViewMinTopConstraint];
      v36 = [MEMORY[0x1E4F28DC8] constraintWithItem:*p_detailView attribute:5 relatedBy:0 toItem:self->_centerContentLeadingGuide attribute:6 multiplier:1.0 constant:0.0];
      [(MKSmallCalloutView *)self addConstraint:v36];

      double v37 = [MEMORY[0x1E4F28DC8] constraintWithItem:*p_detailView attribute:6 relatedBy:-1 toItem:self->_centerContentTrailingGuide attribute:5 multiplier:1.0 constant:0.0];
      detailViewTrailingConstraint = self->_detailViewTrailingConstraint;
      self->_detailViewTrailingConstraint = v37;

      [(MKSmallCalloutView *)self addConstraint:self->_detailViewTrailingConstraint];
      if (v46)
      {
        [(MKSmallCalloutView *)self updateConstraintsIfNeeded];
        [(MKSmallCalloutView *)self layoutIfNeeded];
      }

      id v11 = v44;
      double v10 = v45;
      v30 = v42;
      uint64_t v12 = v43;
      BOOL v4 = v46;
    }
    else
    {
      v29 = self->_detailViewMinTopConstraint;
      self->_detailViewMinTopConstraint = 0;

      v30 = self->_detailViewTrailingConstraint;
      self->_detailViewTrailingConstraint = 0;
    }

    [(UIView *)self _mapkit_setNeedsLayout];
    [(UIView *)self _mapkit_setNeedsUpdateConstraints];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __45__MKSmallCalloutView_setDetailView_animated___block_invoke;
    v55[3] = &unk_1E54B8188;
    v55[4] = self;
    uint64_t v39 = MEMORY[0x18C139AE0](v55);
    v40 = (void *)v39;
    if (v4)
    {
      v41 = (void *)MEMORY[0x1E4F42FF0];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __45__MKSmallCalloutView_setDetailView_animated___block_invoke_2;
      v50[3] = &unk_1E54BF590;
      v50[4] = self;
      id v51 = v10;
      v52 = v11;
      v53 = v12;
      id v54 = v40;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __45__MKSmallCalloutView_setDetailView_animated___block_invoke_3;
      v47[3] = &unk_1E54B8930;
      v48 = v51;
      v49 = self;
      objc_msgSend(v41, "_mapkit_animateWithDuration:animations:completion:", v50, v47, 0.349999994);
    }
    else
    {
      (*(void (**)(uint64_t))(v39 + 16))(v39);
      [(_MKCalloutAccessoryView *)v10 removeFromSuperview];
    }
    [(MKSmallCalloutView *)self _setNeedsUpdatePreferredContentSize];
  }
}

void __45__MKSmallCalloutView_setDetailView_animated___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  id v15 = v2;
  if (*(void *)(*(void *)(a1 + 32) + 464))
  {
    [v2 _scaledValueForValue:22.0];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 664), "setConstant:");
    [*(id *)(*(void *)(a1 + 32) + 664) constant];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 656), "setConstant:");
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v3 + 568)) {
      uint64_t v4 = 11;
    }
    else {
      uint64_t v4 = 4;
    }
    uint64_t v5 = *(void *)(v3 + 464);
    uint64_t v6 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v7 = *(void *)(v3 + 504);
    double v8 = *(double *)(v3 + 592);
    if (*(unsigned char *)(v3 + 569)) {
      [v15 _scaledValueForValue:v8];
    }
    uint64_t v9 = [v6 constraintWithItem:v5 attribute:v4 relatedBy:0 toItem:v7 attribute:4 multiplier:1.0 constant:-v8];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 792);
    *(void *)(v10 + 792) = v9;

    LODWORD(v12) = 1148813312;
    [*(id *)(*(void *)(a1 + 32) + 792) setPriority:v12];
    [*(id *)(a1 + 32) addConstraint:*(void *)(*(void *)(a1 + 32) + 792)];
  }
  else
  {
    [v2 _scaledValueForValue:30.0];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 664), "setConstant:");
    [*(id *)(*(void *)(a1 + 32) + 664) constant];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 656), "setConstant:");
    uint64_t v13 = *(void *)(a1 + 32);
    double v14 = *(void **)(v13 + 792);
    *(void *)(v13 + 792) = 0;
  }
}

uint64_t __45__MKSmallCalloutView_setDetailView_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 464) setAlpha:1.0];
  [*(id *)(a1 + 40) setAlpha:0.0];
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) removeConstraint:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) removeConstraint:*(void *)(a1 + 56)];
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_mapkit_updateConstraintsIfNeeded");
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_mapkit_layoutIfNeeded");
}

uint64_t __45__MKSmallCalloutView_setDetailView_animated___block_invoke_3(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_mapkit_isDescendantOfView:", *(void *)(a1 + 40));
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 removeFromSuperview];
  }
  return result;
}

- (BOOL)canDisplayCompleteTitleWhenExpanded
{
  return 1;
}

- (UIView)titlesContainerView
{
  return self->_titlesContainerView;
}

- (BOOL)parallaxEnabled
{
  return self->_parallaxEnabled;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  self->_parallaxEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titlesContainerView, 0);
  objc_storeStrong((id *)&self->_detailViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_detailViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_detailViewMinTopConstraint, 0);
  objc_storeStrong((id *)&self->_rightViewRightSpacer, 0);
  objc_storeStrong((id *)&self->_rightViewTopSpacer, 0);
  objc_storeStrong((id *)&self->_rightViewCenterContentMarginConstraint, 0);
  objc_storeStrong((id *)&self->_rightViewTopSpacerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_rightViewHorizontalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_leftViewLeftSpacer, 0);
  objc_storeStrong((id *)&self->_leftViewTopSpacer, 0);
  objc_storeStrong((id *)&self->_leftViewCenterContentMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leftViewTopSpacerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_leftViewHorizontalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_leftViewMinCalloutWidthConstraint, 0);
  objc_storeStrong((id *)&self->_centerContentTrailingGuide, 0);
  objc_storeStrong((id *)&self->_centerContentLeadingGuide, 0);
  objc_storeStrong((id *)&self->_titleMinimumBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleBaselineFromTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleBaselineFromTopMinimumConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelConstraints, 0);
  objc_storeStrong((id *)&self->_unmaskedContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_unmaskedContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_maxWidthConstraint, 0);
  objc_storeStrong((id *)&self->_minWidthConstraint, 0);
  objc_storeStrong((id *)&self->_unmaskedContainerView, 0);
  objc_storeStrong((id *)&self->_maskedContainerView, 0);
  objc_storeStrong((id *)&self->_detailView, 0);
  objc_storeStrong((id *)&self->_externalDetailView, 0);
  objc_storeStrong((id *)&self->_externalRightView, 0);
  objc_storeStrong((id *)&self->_externalLeftView, 0);
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end