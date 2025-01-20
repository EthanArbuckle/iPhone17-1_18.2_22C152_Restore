@interface CKPinningOnboardingTitleCell
+ (NSString)reuseIdentifier;
- (BOOL)isInCollapsedState;
- (CKPinningOnboardingTitleCell)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)leadingMarginLayoutConstraint;
- (NSLayoutConstraint)subtitleSpacingConstraint;
- (NSLayoutConstraint)trailingMarginLayoutConstraint;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UILayoutGuide)labelMarginGuide;
- (double)pinningOnboardingMarginForPinnedConversationViewLayoutStyle:(int64_t)a3;
- (double)pinningOnboardingSubtitleSpacingForPinnedConversationViewLayoutStyle:(int64_t)a3;
- (id)pinningOnboardingTitleLabelFontForPinnedConversationViewLayoutStyle:(int64_t)a3 inCollapsedState:(BOOL)a4;
- (int64_t)pinnedConversationViewLayoutStyle;
- (void)setIsInCollapsedState:(BOOL)a3;
- (void)setLabelMarginGuide:(id)a3;
- (void)setLeadingMarginLayoutConstraint:(id)a3;
- (void)setPinnedConversationViewLayoutStyle:(int64_t)a3;
- (void)setPinnedConversationViewLayoutStyle:(int64_t)a3 collapsedState:(BOOL)a4;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleSpacingConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTrailingMarginLayoutConstraint:(id)a3;
- (void)updateConstraints;
@end

@implementation CKPinningOnboardingTitleCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"CKPinningOnboardingTitleCellReuseIdentifier";
}

- (CKPinningOnboardingTitleCell)initWithFrame:(CGRect)a3
{
  v95[9] = *MEMORY[0x1E4F143B8];
  v94.receiver = self;
  v94.super_class = (Class)CKPinningOnboardingTitleCell;
  v3 = -[CKPinningOnboardingTitleCell initWithFrame:](&v94, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CKPinningOnboardingTitleCell *)v3 setIsInCollapsedState:1];
    id v5 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(CKPinningOnboardingTitleCell *)v4 setTitleLabel:v5];

    v6 = [(CKPinningOnboardingTitleCell *)v4 titleLabel];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v7 = [(CKPinningOnboardingTitleCell *)v4 titleLabel];
    [v7 setTextAlignment:1];

    v8 = [(CKPinningOnboardingTitleCell *)v4 titleLabel];
    [v8 setNumberOfLines:0];

    v9 = [(CKPinningOnboardingTitleCell *)v4 pinningOnboardingTitleLabelFontForPinnedConversationViewLayoutStyle:[(CKPinningOnboardingTitleCell *)v4 pinnedConversationViewLayoutStyle] inCollapsedState:[(CKPinningOnboardingTitleCell *)v4 isInCollapsedState]];
    v10 = [(CKPinningOnboardingTitleCell *)v4 titleLabel];
    [v10 setFont:v9];

    v11 = +[CKUIBehavior sharedBehaviors];
    v12 = [v11 theme];
    v13 = [v12 conversationListPinningOnboardingTitleColor];
    v14 = [(CKPinningOnboardingTitleCell *)v4 titleLabel];
    [v14 setTextColor:v13];

    v15 = CKFrameworkBundle();
    v16 = [v15 localizedStringForKey:@"PINNING_ONBOARDING_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v17 = [(CKPinningOnboardingTitleCell *)v4 titleLabel];
    [v17 setText:v16];

    id v18 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(CKPinningOnboardingTitleCell *)v4 setSubtitleLabel:v18];

    v19 = [(CKPinningOnboardingTitleCell *)v4 subtitleLabel];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

    v20 = [(CKPinningOnboardingTitleCell *)v4 subtitleLabel];
    [v20 setTextAlignment:1];

    v21 = [(CKPinningOnboardingTitleCell *)v4 subtitleLabel];
    [v21 setNumberOfLines:0];

    v22 = +[CKUIBehavior sharedBehaviors];
    v23 = [v22 pinningOnboardingSubtitleLabelFont];
    v24 = [(CKPinningOnboardingTitleCell *)v4 subtitleLabel];
    [v24 setFont:v23];

    v25 = +[CKUIBehavior sharedBehaviors];
    v26 = [v25 theme];
    v27 = [v26 conversationListPinningOnboardingSubtitleColor];
    v28 = [(CKPinningOnboardingTitleCell *)v4 subtitleLabel];
    [v28 setTextColor:v27];

    v29 = CKFrameworkBundle();
    v30 = [v29 localizedStringForKey:@"PINNING_ONBOARDING_SUBTITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v31 = [(CKPinningOnboardingTitleCell *)v4 subtitleLabel];
    [v31 setText:v30];

    v32 = [(CKPinningOnboardingTitleCell *)v4 contentView];
    v33 = [(CKPinningOnboardingTitleCell *)v4 titleLabel];
    [v32 addSubview:v33];

    v34 = [(CKPinningOnboardingTitleCell *)v4 contentView];
    v35 = [(CKPinningOnboardingTitleCell *)v4 subtitleLabel];
    [v34 addSubview:v35];

    id v36 = objc_alloc_init(MEMORY[0x1E4F42B48]);
    [(CKPinningOnboardingTitleCell *)v4 setLabelMarginGuide:v36];

    v37 = [(CKPinningOnboardingTitleCell *)v4 contentView];
    v38 = [(CKPinningOnboardingTitleCell *)v4 labelMarginGuide];
    [v37 addLayoutGuide:v38];

    [(CKPinningOnboardingTitleCell *)v4 pinningOnboardingMarginForPinnedConversationViewLayoutStyle:[(CKPinningOnboardingTitleCell *)v4 pinnedConversationViewLayoutStyle]];
    double v40 = v39;
    v41 = [(CKPinningOnboardingTitleCell *)v4 labelMarginGuide];
    v42 = [v41 leadingAnchor];
    v43 = [(CKPinningOnboardingTitleCell *)v4 contentView];
    v44 = [v43 leadingAnchor];
    v45 = [v42 constraintEqualToAnchor:v44 constant:v40];
    [(CKPinningOnboardingTitleCell *)v4 setLeadingMarginLayoutConstraint:v45];

    v46 = [(CKPinningOnboardingTitleCell *)v4 labelMarginGuide];
    v47 = [v46 trailingAnchor];
    v48 = [(CKPinningOnboardingTitleCell *)v4 contentView];
    v49 = [v48 trailingAnchor];
    v50 = [v47 constraintEqualToAnchor:v49 constant:-v40];
    [(CKPinningOnboardingTitleCell *)v4 setTrailingMarginLayoutConstraint:v50];

    [(CKPinningOnboardingTitleCell *)v4 pinningOnboardingSubtitleSpacingForPinnedConversationViewLayoutStyle:[(CKPinningOnboardingTitleCell *)v4 pinnedConversationViewLayoutStyle]];
    double v52 = v51;
    v53 = [(CKPinningOnboardingTitleCell *)v4 titleLabel];
    v54 = [v53 bottomAnchor];
    v55 = [(CKPinningOnboardingTitleCell *)v4 subtitleLabel];
    v56 = [v55 topAnchor];
    v57 = [v54 constraintEqualToAnchor:v56 constant:-v52];
    [(CKPinningOnboardingTitleCell *)v4 setSubtitleSpacingConstraint:v57];

    v79 = (void *)MEMORY[0x1E4F28DC8];
    v93 = [(CKPinningOnboardingTitleCell *)v4 leadingMarginLayoutConstraint];
    v95[0] = v93;
    v92 = [(CKPinningOnboardingTitleCell *)v4 trailingMarginLayoutConstraint];
    v95[1] = v92;
    v91 = [(CKPinningOnboardingTitleCell *)v4 subtitleSpacingConstraint];
    v95[2] = v91;
    v90 = [(CKPinningOnboardingTitleCell *)v4 titleLabel];
    v88 = [v90 topAnchor];
    v89 = [(CKPinningOnboardingTitleCell *)v4 contentView];
    v87 = [v89 topAnchor];
    v86 = [v88 constraintEqualToAnchor:v87 constant:16.0];
    v95[3] = v86;
    v85 = [(CKPinningOnboardingTitleCell *)v4 subtitleLabel];
    v83 = [v85 bottomAnchor];
    v84 = [(CKPinningOnboardingTitleCell *)v4 contentView];
    v82 = [v84 bottomAnchor];
    v81 = [v83 constraintEqualToAnchor:v82 constant:-16.0];
    v95[4] = v81;
    v80 = [(CKPinningOnboardingTitleCell *)v4 titleLabel];
    v77 = [v80 leadingAnchor];
    v78 = [(CKPinningOnboardingTitleCell *)v4 labelMarginGuide];
    v76 = [v78 leadingAnchor];
    v75 = [v77 constraintEqualToAnchor:v76];
    v95[5] = v75;
    v74 = [(CKPinningOnboardingTitleCell *)v4 titleLabel];
    v72 = [v74 trailingAnchor];
    v73 = [(CKPinningOnboardingTitleCell *)v4 labelMarginGuide];
    v71 = [v73 trailingAnchor];
    v70 = [v72 constraintEqualToAnchor:v71];
    v95[6] = v70;
    v69 = [(CKPinningOnboardingTitleCell *)v4 subtitleLabel];
    v68 = [v69 leadingAnchor];
    v58 = [(CKPinningOnboardingTitleCell *)v4 labelMarginGuide];
    v59 = [v58 leadingAnchor];
    v60 = [v68 constraintEqualToAnchor:v59];
    v95[7] = v60;
    v61 = [(CKPinningOnboardingTitleCell *)v4 subtitleLabel];
    v62 = [v61 trailingAnchor];
    v63 = [(CKPinningOnboardingTitleCell *)v4 labelMarginGuide];
    v64 = [v63 trailingAnchor];
    v65 = [v62 constraintEqualToAnchor:v64];
    v95[8] = v65;
    v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:9];
    [v79 activateConstraints:v66];
  }
  return v4;
}

- (void)updateConstraints
{
  [(CKPinningOnboardingTitleCell *)self pinningOnboardingMarginForPinnedConversationViewLayoutStyle:[(CKPinningOnboardingTitleCell *)self pinnedConversationViewLayoutStyle]];
  double v4 = v3;
  id v5 = [(CKPinningOnboardingTitleCell *)self pinningOnboardingTitleLabelFontForPinnedConversationViewLayoutStyle:[(CKPinningOnboardingTitleCell *)self pinnedConversationViewLayoutStyle] inCollapsedState:[(CKPinningOnboardingTitleCell *)self isInCollapsedState]];
  v6 = [(CKPinningOnboardingTitleCell *)self titleLabel];
  [v6 setFont:v5];

  v7 = [(CKPinningOnboardingTitleCell *)self leadingMarginLayoutConstraint];
  [v7 setConstant:v4];

  v8 = [(CKPinningOnboardingTitleCell *)self trailingMarginLayoutConstraint];
  [v8 setConstant:-v4];

  [(CKPinningOnboardingTitleCell *)self pinningOnboardingSubtitleSpacingForPinnedConversationViewLayoutStyle:[(CKPinningOnboardingTitleCell *)self pinnedConversationViewLayoutStyle]];
  double v10 = -v9;
  v11 = [(CKPinningOnboardingTitleCell *)self subtitleSpacingConstraint];
  [v11 setConstant:v10];

  v12.receiver = self;
  v12.super_class = (Class)CKPinningOnboardingTitleCell;
  [(CKPinningOnboardingTitleCell *)&v12 updateConstraints];
}

- (void)setPinnedConversationViewLayoutStyle:(int64_t)a3 collapsedState:(BOOL)a4
{
  [(CKPinningOnboardingTitleCell *)self setIsInCollapsedState:a4];
  [(CKPinningOnboardingTitleCell *)self setPinnedConversationViewLayoutStyle:a3];

  [(CKPinningOnboardingTitleCell *)self updateConstraintsIfNeeded];
}

- (id)pinningOnboardingTitleLabelFontForPinnedConversationViewLayoutStyle:(int64_t)a3 inCollapsedState:(BOOL)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (a4) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 32770;
    }
    id v5 = (void **)MEMORY[0x1E4F438F8];
    if (!a4) {
      id v5 = (void **)MEMORY[0x1E4F438E8];
    }
    v6 = *v5;
  }
  else
  {
    v6 = (void *)*MEMORY[0x1E4F438B8];
    uint64_t v4 = 2;
  }
  id v7 = v6;
  v8 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v7 addingSymbolicTraits:v4 options:0];
  double v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];

  return v9;
}

- (double)pinningOnboardingSubtitleSpacingForPinnedConversationViewLayoutStyle:(int64_t)a3
{
  double result = 15.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return 11.0;
  }
  return result;
}

- (double)pinningOnboardingMarginForPinnedConversationViewLayoutStyle:(int64_t)a3
{
  double result = 16.0;
  if ((unint64_t)a3 <= 4) {
    return dbl_18F81D050[a3];
  }
  return result;
}

- (int64_t)pinnedConversationViewLayoutStyle
{
  return self->_pinnedConversationViewLayoutStyle;
}

- (void)setPinnedConversationViewLayoutStyle:(int64_t)a3
{
  self->_pinnedConversationViewLayoutStyle = a3;
}

- (BOOL)isInCollapsedState
{
  return self->_isInCollapsedState;
}

- (void)setIsInCollapsedState:(BOOL)a3
{
  self->_isInCollapsedState = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILayoutGuide)labelMarginGuide
{
  return self->_labelMarginGuide;
}

- (void)setLabelMarginGuide:(id)a3
{
}

- (NSLayoutConstraint)leadingMarginLayoutConstraint
{
  return self->_leadingMarginLayoutConstraint;
}

- (void)setLeadingMarginLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingMarginLayoutConstraint
{
  return self->_trailingMarginLayoutConstraint;
}

- (void)setTrailingMarginLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)subtitleSpacingConstraint
{
  return self->_subtitleSpacingConstraint;
}

- (void)setSubtitleSpacingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_trailingMarginLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_labelMarginGuide, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end