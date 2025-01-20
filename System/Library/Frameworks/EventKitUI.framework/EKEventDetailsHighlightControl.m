@interface EKEventDetailsHighlightControl
+ (BOOL)requiresConstraintBasedLayout;
+ (double)bottomMarginConstant;
+ (double)interLabelBaselineDeltaConstant;
+ (double)topMarginConstant;
+ (id)subtitleColor;
+ (id)subtitleFont;
+ (id)titleFont;
- (EKEventDetailsHighlightControl)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)bottomMarginConstraint;
- (NSLayoutConstraint)interLabelPaddingConstraint;
- (NSLayoutConstraint)topMarginConstraint;
- (UIImageView)iconStack;
- (UILabel)actionLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (void)_updateSubtitleAndActionText;
- (void)_updateTitleAndSubtitleConstraints;
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)setActionText:(id)a3 color:(id)a4;
- (void)setIconImage:(id)a3;
- (void)setSubtitleAttributedText:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation EKEventDetailsHighlightControl

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (id)titleFont
{
  v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0] addingSymbolicTraits:2 options:0];
  v3 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (id)subtitleFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
}

+ (id)subtitleColor
{
  return (id)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

+ (double)topMarginConstant
{
  v2 = [a1 titleFont];
  [v2 _bodyLeading];
  double v4 = v3 * 1.11111111;

  return v4;
}

+ (double)interLabelBaselineDeltaConstant
{
  v2 = [(id)objc_opt_class() subtitleFont];
  [v2 _bodyLeading];
  double v4 = v3;

  return v4;
}

+ (double)bottomMarginConstant
{
  v2 = [a1 titleFont];
  [v2 _bodyLeading];
  double v4 = v3 * 0.666666667;

  return v4;
}

- (EKEventDetailsHighlightControl)initWithFrame:(CGRect)a3
{
  v96[1] = *MEMORY[0x1E4F143B8];
  v94.receiver = self;
  v94.super_class = (Class)EKEventDetailsHighlightControl;
  double v3 = -[EKEventDetailsHighlightControl initWithFrame:](&v94, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];

    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(EKEventDetailsHighlightControl *)v3 setBackgroundColor:v5];

    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v11;

    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v13;

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    actionLabel = v3->_actionLabel;
    v3->_actionLabel = (UILabel *)v15;

    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v7, v8, v9, v10);
    iconStack = v3->_iconStack;
    v3->_iconStack = (UIImageView *)v17;

    v19 = v3->_titleLabel;
    v20 = [(id)objc_opt_class() titleFont];
    [(UILabel *)v19 setFont:v20];

    [(UILabel *)v3->_titleLabel setTextAlignment:4];
    v21 = v3->_titleLabel;
    v22 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v21 setTextColor:v22];

    [(UILabel *)v3->_titleLabel setLineBreakMode:0];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    v23 = v3->_subtitleLabel;
    v24 = [(id)objc_opt_class() subtitleFont];
    [(UILabel *)v23 setFont:v24];

    [(UILabel *)v3->_subtitleLabel setTextAlignment:4];
    [(UILabel *)v3->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v3->_subtitleLabel setLineBreakMode:0];
    v25 = v3->_subtitleLabel;
    v26 = [(id)objc_opt_class() subtitleColor];
    [(UILabel *)v25 setTextColor:v26];

    v27 = v3->_actionLabel;
    v28 = [(id)objc_opt_class() subtitleFont];
    [(UILabel *)v27 setFont:v28];

    [(UILabel *)v3->_actionLabel setTextAlignment:4];
    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_actionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_iconStack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(EKEventDetailsHighlightControl *)v3 addSubview:v3->_titleLabel];
    [(EKEventDetailsHighlightControl *)v3 addSubview:v3->_subtitleLabel];
    [(EKEventDetailsHighlightControl *)v3 addSubview:v3->_actionLabel];
    [(EKEventDetailsHighlightControl *)v3 addSubview:v3->_iconStack];
    LODWORD(v29) = 1148846080;
    [(UILabel *)v3->_titleLabel setContentHuggingPriority:1 forAxis:v29];
    LODWORD(v30) = 1148846080;
    [(UILabel *)v3->_subtitleLabel setContentHuggingPriority:1 forAxis:v30];
    LODWORD(v31) = 1148846080;
    [(UILabel *)v3->_actionLabel setContentCompressionResistancePriority:0 forAxis:v31];
    LODWORD(v32) = 1148846080;
    [(UIImageView *)v3->_iconStack setContentHuggingPriority:0 forAxis:v32];
    LODWORD(v33) = 1148846080;
    [(UIImageView *)v3->_iconStack setContentHuggingPriority:1 forAxis:v33];
    LODWORD(v34) = 1148846080;
    [(UIImageView *)v3->_iconStack setContentCompressionResistancePriority:0 forAxis:v34];
    LODWORD(v35) = 1148846080;
    [(UIImageView *)v3->_iconStack setContentCompressionResistancePriority:1 forAxis:v35];
    LODWORD(v36) = 1148846080;
    [(EKEventDetailsHighlightControl *)v3 setContentCompressionResistancePriority:1 forAxis:v36];
    LODWORD(v37) = 1148846080;
    [(EKEventDetailsHighlightControl *)v3 setContentHuggingPriority:1 forAxis:v37];
    v38 = (void *)MEMORY[0x1E4F28DC8];
    v39 = v3->_titleLabel;
    [(id)objc_opt_class() topMarginConstant];
    v41 = [v38 constraintWithItem:v39 attribute:12 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:v40];
    [(NSLayoutConstraint *)v41 setIdentifier:@"MessageSuggestionBannerTitle.topMargin"];
    v42 = (void *)MEMORY[0x1E4F28DC8];
    v43 = v3->_subtitleLabel;
    v44 = v3->_titleLabel;
    [(id)objc_opt_class() interLabelBaselineDeltaConstant];
    v46 = [v42 constraintWithItem:v43 attribute:12 relatedBy:0 toItem:v44 attribute:11 multiplier:1.0 constant:v45];
    [(NSLayoutConstraint *)v46 setIdentifier:@"MessageSuggestionBannerTitle.titleSubtitleBaselineDistance"];
    v47 = (void *)MEMORY[0x1E4F28DC8];
    v48 = v3->_subtitleLabel;
    [(id)objc_opt_class() bottomMarginConstant];
    v50 = [v47 constraintWithItem:v3 attribute:4 relatedBy:0 toItem:v48 attribute:11 multiplier:1.0 constant:v49];
    [(NSLayoutConstraint *)v50 setIdentifier:@"MessageSuggestionBannerTitle.bottomMargin"];
    v93 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_subtitleLabel attribute:5 relatedBy:0 toItem:v3->_titleLabel attribute:5 multiplier:1.0 constant:0.0];
    topMarginConstraint = v3->_topMarginConstraint;
    v3->_topMarginConstraint = v41;
    v92 = v41;

    interLabelPaddingConstraint = v3->_interLabelPaddingConstraint;
    v3->_interLabelPaddingConstraint = v46;
    v90 = v46;

    bottomMarginConstraint = v3->_bottomMarginConstraint;
    v3->_bottomMarginConstraint = v50;
    v91 = v50;

    v89 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelSubt.isa, v3->_titleLabel, v3->_subtitleLabel, v3->_iconStack, v3->_actionLabel, 0);
    v54 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v92, v93, 0);
    v55 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:[_subtitleLabel]-(==subtitleTrailingPadding)-[_actionLabel]" options:2048 metrics:&unk_1F0D03D80 views:v89];
    v56 = [v55 arrayByAddingObject:v91];
    uint64_t v57 = [v56 arrayByAddingObject:v90];
    titleAndSubtitleVisibleContraints = v3->_titleAndSubtitleVisibleContraints;
    v3->_titleAndSubtitleVisibleContraints = (NSArray *)v57;

    v59 = (void *)MEMORY[0x1E4F28DC8];
    v60 = v3->_titleLabel;
    [(id)objc_opt_class() bottomMarginConstant];
    v62 = [v59 constraintWithItem:v3 attribute:4 relatedBy:0 toItem:v60 attribute:11 multiplier:1.0 constant:v61];
    v96[0] = v62;
    uint64_t v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:1];
    justTitleVisibleContraints = v3->_justTitleVisibleContraints;
    v3->_justTitleVisibleContraints = (NSArray *)v63;

    v65 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_actionLabel attribute:5 relatedBy:0 toItem:v3->_titleLabel attribute:5 multiplier:1.0 constant:0.0];
    v95[0] = v65;
    v66 = (void *)MEMORY[0x1E4F28DC8];
    v67 = v3->_actionLabel;
    [(id)objc_opt_class() bottomMarginConstant];
    v69 = [v66 constraintWithItem:v3 attribute:4 relatedBy:0 toItem:v67 attribute:11 multiplier:1.0 constant:v68];
    v95[1] = v69;
    v70 = (void *)MEMORY[0x1E4F28DC8];
    v71 = v3->_actionLabel;
    v72 = v3->_titleLabel;
    [(id)objc_opt_class() interLabelBaselineDeltaConstant];
    v74 = [v70 constraintWithItem:v71 attribute:12 relatedBy:0 toItem:v72 attribute:11 multiplier:1.0 constant:v73];
    v95[2] = v74;
    uint64_t v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:3];
    justTitleAndActionVisibleContraints = v3->_justTitleAndActionVisibleContraints;
    v3->_justTitleAndActionVisibleContraints = (NSArray *)v75;

    v77 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:[_subtitleLabel]-(>=subtitleTrailingPadding)-[_actionLabel]-(==0)-|" options:2048 metrics:&unk_1F0D03D80 views:v89];
    v78 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-[_subtitleLabel]-|" options:0 metrics:&unk_1F0D03D80 views:v89];
    v79 = [v77 arrayByAddingObjectsFromArray:v78];
    v80 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-[_actionLabel]-|" options:0 metrics:&unk_1F0D03D80 views:v89];
    uint64_t v81 = [v79 arrayByAddingObjectsFromArray:v80];
    justSubtitleVisibleContraints = v3->_justSubtitleVisibleContraints;
    v3->_justSubtitleVisibleContraints = (NSArray *)v81;

    [v54 addObjectsFromArray:v3->_titleAndSubtitleVisibleContraints];
    [v54 addObjectsFromArray:v3->_justTitleVisibleContraints];
    [v54 addObjectsFromArray:v3->_justSubtitleVisibleContraints];
    [v54 addObjectsFromArray:v3->_justTitleAndActionVisibleContraints];
    v83 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(iconStackLeading)-[_iconStack]-iconStackTrailing-[_titleLabel]-(>=0)-|" options:0 metrics:&unk_1F0D03D80 views:v89];
    [v54 addObjectsFromArray:v83];

    v84 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:[_actionLabel]-(>=0)-|" options:0 metrics:&unk_1F0D03D80 views:v89];
    [v54 addObjectsFromArray:v84];

    v85 = [(UIImageView *)v3->_iconStack centerYAnchor];
    v86 = [(UILabel *)v3->_titleLabel centerYAnchor];
    v87 = [v85 constraintEqualToAnchor:v86];
    [v54 addObject:v87];

    [(EKEventDetailsHighlightControl *)v3 addConstraints:v54];
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v3->_justTitleVisibleContraints];
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v3->_justSubtitleVisibleContraints];
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v3->_justTitleAndActionVisibleContraints];
  }
  return v3;
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailsHighlightControl;
  [(EKEventDetailsHighlightControl *)&v4 dealloc];
}

- (void)setIconImage:(id)a3
{
}

- (void)_updateTitleAndSubtitleConstraints
{
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_justTitleVisibleContraints];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_justSubtitleVisibleContraints];
  p_titleAndSubtitleVisibleContraints = &self->_titleAndSubtitleVisibleContraints;
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_titleAndSubtitleVisibleContraints];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_justTitleAndActionVisibleContraints];
  objc_super v4 = [(UILabel *)self->_titleLabel text];

  v5 = [(UILabel *)self->_subtitleLabel text];

  if (v4)
  {
    if (!v5)
    {
      id v6 = [(UILabel *)self->_actionLabel text];

      if (v6) {
        p_titleAndSubtitleVisibleContraints = &self->_justTitleAndActionVisibleContraints;
      }
      else {
        p_titleAndSubtitleVisibleContraints = &self->_justTitleVisibleContraints;
      }
    }
  }
  else
  {
    p_titleAndSubtitleVisibleContraints = &self->_justSubtitleVisibleContraints;
    if (!v5) {
      goto LABEL_8;
    }
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:*p_titleAndSubtitleVisibleContraints];
LABEL_8:

  [(EKEventDetailsHighlightControl *)self setNeedsUpdateConstraints];
}

- (void)setTitleText:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];

  [(EKEventDetailsHighlightControl *)self _updateTitleAndSubtitleConstraints];
}

- (void)_updateSubtitleAndActionText
{
  v29[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4FB1000uLL;
  objc_super v4 = [MEMORY[0x1E4FB1E20] _currentTraitCollection];
  v5 = [(EKEventDetailsHighlightControl *)self traitCollection];
  [MEMORY[0x1E4FB1E20] _setCurrentTraitCollection:v5];

  if ([(NSString *)self->_subtitleText length] && self->_actionText)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28E48]);
    double v7 = [(NSString *)self->_subtitleText stringByAppendingString:@" "];
    uint64_t v27 = *MEMORY[0x1E4FB06F8];
    uint64_t v8 = v27;
    double v9 = [(id)objc_opt_class() subtitleFont];
    v29[0] = v9;
    uint64_t v28 = *MEMORY[0x1E4FB0700];
    uint64_t v10 = v28;
    uint64_t v11 = [(id)objc_opt_class() subtitleColor];
    v29[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v27 count:2];
    uint64_t v13 = (void *)[v6 initWithString:v7 attributes:v12];

    id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
    actionText = self->_actionText;
    v25[0] = v8;
    v16 = [(id)objc_opt_class() subtitleFont];
    v25[1] = v10;
    v26[0] = v16;
    v26[1] = self->_actionColor;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    v18 = (void *)[v14 initWithString:actionText attributes:v17];

    unint64_t v3 = 0x1E4FB1000;
    [v13 appendAttributedString:v18];
    [(UILabel *)self->_subtitleLabel setText:0];
    [(UILabel *)self->_subtitleLabel setAttributedText:v13];
    [(UILabel *)self->_actionLabel setText:0];

LABEL_8:
    goto LABEL_9;
  }
  if (self->_subtitleText)
  {
    [(UILabel *)self->_subtitleLabel setAttributedText:0];
    [(UILabel *)self->_subtitleLabel setText:self->_subtitleText];
    [(UILabel *)self->_actionLabel setText:0];
  }
  else if (self->_actionText)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
    v20 = self->_actionText;
    v23[0] = *MEMORY[0x1E4FB06F8];
    v21 = [(id)objc_opt_class() subtitleFont];
    v23[1] = *MEMORY[0x1E4FB0700];
    v24[0] = v21;
    v24[1] = self->_actionColor;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    uint64_t v13 = (void *)[v19 initWithString:v20 attributes:v22];

    [(UILabel *)self->_subtitleLabel setText:0];
    [(UILabel *)self->_subtitleLabel setAttributedText:0];
    [(UILabel *)self->_actionLabel setAttributedText:v13];
    goto LABEL_8;
  }
LABEL_9:
  [(EKEventDetailsHighlightControl *)self _updateTitleAndSubtitleConstraints];
  [*(id *)(v3 + 3616) _setCurrentTraitCollection:v4];
}

- (void)setActionText:(id)a3 color:(id)a4
{
  id v6 = (NSString *)a3;
  double v7 = (UIColor *)a4;
  actionText = self->_actionText;
  self->_actionText = v6;
  double v9 = v6;

  actionColor = self->_actionColor;
  self->_actionColor = v7;

  [(EKEventDetailsHighlightControl *)self _updateSubtitleAndActionText];
}

- (void)setSubtitleText:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleText, a3);

  [(EKEventDetailsHighlightControl *)self _updateSubtitleAndActionText];
}

- (void)setSubtitleAttributedText:(id)a3
{
  [(UILabel *)self->_subtitleLabel setAttributedText:a3];

  [(EKEventDetailsHighlightControl *)self _updateTitleAndSubtitleConstraints];
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  titleLabel = self->_titleLabel;
  v5 = [(id)objc_opt_class() titleFont];
  [(UILabel *)titleLabel setFont:v5];

  subtitleLabel = self->_subtitleLabel;
  double v7 = [(id)objc_opt_class() subtitleFont];
  [(UILabel *)subtitleLabel setFont:v7];

  actionLabel = self->_actionLabel;
  double v9 = [(id)objc_opt_class() subtitleFont];
  [(UILabel *)actionLabel setFont:v9];

  topMarginConstraint = self->_topMarginConstraint;
  [(id)objc_opt_class() topMarginConstant];
  -[NSLayoutConstraint setConstant:](topMarginConstraint, "setConstant:");
  interLabelPaddingConstraint = self->_interLabelPaddingConstraint;
  [(id)objc_opt_class() interLabelBaselineDeltaConstant];
  -[NSLayoutConstraint setConstant:](interLabelPaddingConstraint, "setConstant:");
  bottomMarginConstraint = self->_bottomMarginConstraint;
  [(id)objc_opt_class() bottomMarginConstant];

  -[NSLayoutConstraint setConstant:](bottomMarginConstraint, "setConstant:");
}

- (UIImageView)iconStack
{
  return self->_iconStack;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)actionLabel
{
  return self->_actionLabel;
}

- (NSLayoutConstraint)topMarginConstraint
{
  return self->_topMarginConstraint;
}

- (NSLayoutConstraint)interLabelPaddingConstraint
{
  return self->_interLabelPaddingConstraint;
}

- (NSLayoutConstraint)bottomMarginConstraint
{
  return self->_bottomMarginConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomMarginConstraint, 0);
  objc_storeStrong((id *)&self->_interLabelPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_topMarginConstraint, 0);
  objc_storeStrong((id *)&self->_actionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconStack, 0);
  objc_storeStrong((id *)&self->_actionColor, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_actionText, 0);
  objc_storeStrong((id *)&self->_justTitleAndActionVisibleContraints, 0);
  objc_storeStrong((id *)&self->_justSubtitleVisibleContraints, 0);
  objc_storeStrong((id *)&self->_justTitleVisibleContraints, 0);

  objc_storeStrong((id *)&self->_titleAndSubtitleVisibleContraints, 0);
}

@end