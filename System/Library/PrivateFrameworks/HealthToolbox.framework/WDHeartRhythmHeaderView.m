@interface WDHeartRhythmHeaderView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSAttributedString)bodyTextAttributedString;
- (NSAttributedString)bodyURLAttributedString;
- (NSLayoutConstraint)bodyFirstBaslineToTitleLastBaslineConstraint;
- (NSLayoutConstraint)bottomMarginToBodyLastBaselineConstraint;
- (NSLayoutConstraint)titleFirstBaselineToTopMarginConstraint;
- (NSString)bodyText;
- (NSString)bodyURLText;
- (NSString)titleText;
- (NSURL)bodyURL;
- (UILabel)titleLabel;
- (UITextView)bodyTextView;
- (WDHeartRhythmHeaderView)initWithReuseIdentifier:(id)a3;
- (void)setBodyFirstBaslineToTitleLastBaslineConstraint:(id)a3;
- (void)setBodyText:(id)a3;
- (void)setBodyText:(id)a3 URLText:(id)a4 URL:(id)a5;
- (void)setBodyTextView:(id)a3;
- (void)setBodyURL:(id)a3;
- (void)setBodyURLText:(id)a3;
- (void)setBottomMarginToBodyLastBaselineConstraint:(id)a3;
- (void)setTitleFirstBaselineToTopMarginConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setUpUI;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBodyTextView;
- (void)updateConstraintConstants;
@end

@implementation WDHeartRhythmHeaderView

- (WDHeartRhythmHeaderView)initWithReuseIdentifier:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)WDHeartRhythmHeaderView;
  v3 = [(WDHeartRhythmHeaderView *)&v14 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v9;

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1CAC8]), "initWithFrame:textContainer:", 0, v5, v6, v7, v8);
    bodyTextView = v3->_bodyTextView;
    v3->_bodyTextView = (UITextView *)v11;

    [(WDHeartRhythmHeaderView *)v3 setUpUI];
  }
  return v3;
}

- (void)setUpUI
{
  v92[7] = *MEMORY[0x263EF8340];
  v3 = [(WDHeartRhythmHeaderView *)self titleLabel];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(WDHeartRhythmHeaderView *)self titleLabel];
  [v4 setAdjustsFontForContentSizeCategory:1];

  double v5 = [(WDHeartRhythmHeaderView *)self titleLabel];
  [v5 setTextAlignment:4];

  double v6 = [(WDHeartRhythmHeaderView *)self titleLabel];
  [v6 setNumberOfLines:0];

  v91 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D300] addingSymbolicTraits:2 options:0];
  double v7 = [MEMORY[0x263F1C658] fontWithDescriptor:v91 size:0.0];
  double v8 = [(WDHeartRhythmHeaderView *)self titleLabel];
  [v8 setFont:v7];

  uint64_t v9 = [(WDHeartRhythmHeaderView *)self titleLabel];
  LODWORD(v10) = 1144766464;
  [v9 setContentHuggingPriority:1 forAxis:v10];

  uint64_t v11 = [(WDHeartRhythmHeaderView *)self titleLabel];
  LODWORD(v12) = 1148829696;
  [v11 setContentHuggingPriority:0 forAxis:v12];

  v13 = [(WDHeartRhythmHeaderView *)self titleLabel];
  LODWORD(v14) = 1144766464;
  [v13 setContentCompressionResistancePriority:1 forAxis:v14];

  v15 = [(WDHeartRhythmHeaderView *)self contentView];
  v16 = [(WDHeartRhythmHeaderView *)self titleLabel];
  [v15 addSubview:v16];

  v17 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  [v18 setAdjustsFontForContentSizeCategory:1];

  v19 = [MEMORY[0x263F1C550] clearColor];
  v20 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  [v20 setBackgroundColor:v19];

  v21 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  [v21 setTextAlignment:4];

  v22 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  v23 = [v22 textContainer];
  [v23 setLineFragmentPadding:0.0];

  v24 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  [v24 setScrollEnabled:0];

  v25 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  [v25 setEditable:0];

  v26 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  v27 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  [v27 setFont:v26];

  v28 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  [v28 setDelegate:self];

  v29 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  LODWORD(v30) = 1144750080;
  [v29 setContentHuggingPriority:1 forAxis:v30];

  v31 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  LODWORD(v32) = 1144750080;
  [v31 setContentCompressionResistancePriority:1 forAxis:v32];

  v33 = [(WDHeartRhythmHeaderView *)self contentView];
  v34 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  [v33 addSubview:v34];

  v35 = [(WDHeartRhythmHeaderView *)self contentView];
  [v35 layoutMargins];
  double v37 = v36;
  double v39 = v38;

  v40 = [(WDHeartRhythmHeaderView *)self contentView];
  objc_msgSend(v40, "setLayoutMargins:", 0.0, v37, 0.0, v39);

  v41 = [(WDHeartRhythmHeaderView *)self titleLabel];
  v42 = [v41 firstBaselineAnchor];
  v43 = [(WDHeartRhythmHeaderView *)self contentView];
  v44 = [v43 layoutMarginsGuide];
  v45 = [v44 topAnchor];
  v46 = [v42 constraintEqualToAnchor:v45];
  titleFirstBaselineToTopMarginConstraint = self->_titleFirstBaselineToTopMarginConstraint;
  self->_titleFirstBaselineToTopMarginConstraint = v46;

  LODWORD(v48) = 1144733696;
  [(NSLayoutConstraint *)self->_titleFirstBaselineToTopMarginConstraint setPriority:v48];
  v49 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  v50 = [v49 firstBaselineAnchor];
  v51 = [(WDHeartRhythmHeaderView *)self titleLabel];
  v52 = [v51 lastBaselineAnchor];
  v53 = [v50 constraintEqualToAnchor:v52];
  bodyFirstBaslineToTitleLastBaslineConstraint = self->_bodyFirstBaslineToTitleLastBaslineConstraint;
  self->_bodyFirstBaslineToTitleLastBaslineConstraint = v53;

  LODWORD(v55) = 1144717312;
  [(NSLayoutConstraint *)self->_bodyFirstBaslineToTitleLastBaslineConstraint setPriority:v55];
  v56 = [(WDHeartRhythmHeaderView *)self contentView];
  v57 = [v56 layoutMarginsGuide];
  v58 = [v57 bottomAnchor];
  v59 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  v60 = [v59 lastBaselineAnchor];
  v61 = [v58 constraintEqualToAnchor:v60];
  bottomMarginToBodyLastBaselineConstraint = self->_bottomMarginToBodyLastBaselineConstraint;
  self->_bottomMarginToBodyLastBaselineConstraint = v61;

  LODWORD(v63) = 1132068864;
  [(NSLayoutConstraint *)self->_bottomMarginToBodyLastBaselineConstraint setPriority:v63];
  [(WDHeartRhythmHeaderView *)self updateConstraintConstants];
  v64 = self->_bodyFirstBaslineToTitleLastBaslineConstraint;
  v80 = (void *)MEMORY[0x263F08938];
  v92[0] = self->_titleFirstBaselineToTopMarginConstraint;
  v92[1] = v64;
  v92[2] = self->_bottomMarginToBodyLastBaselineConstraint;
  v90 = [(WDHeartRhythmHeaderView *)self titleLabel];
  v88 = [v90 leadingAnchor];
  v89 = [(WDHeartRhythmHeaderView *)self contentView];
  v87 = [v89 layoutMarginsGuide];
  v86 = [v87 leadingAnchor];
  v85 = [v88 constraintEqualToAnchor:v86];
  v92[3] = v85;
  v84 = [(WDHeartRhythmHeaderView *)self titleLabel];
  v82 = [v84 trailingAnchor];
  v83 = [(WDHeartRhythmHeaderView *)self contentView];
  v81 = [v83 layoutMarginsGuide];
  v79 = [v81 trailingAnchor];
  v78 = [v82 constraintEqualToAnchor:v79];
  v92[4] = v78;
  v77 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  v75 = [v77 leadingAnchor];
  v76 = [(WDHeartRhythmHeaderView *)self contentView];
  v65 = [v76 layoutMarginsGuide];
  v66 = [v65 leadingAnchor];
  v67 = [v75 constraintEqualToAnchor:v66];
  v92[5] = v67;
  v68 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  v69 = [v68 trailingAnchor];
  v70 = [(WDHeartRhythmHeaderView *)self contentView];
  v71 = [v70 layoutMarginsGuide];
  v72 = [v71 trailingAnchor];
  v73 = [v69 constraintEqualToAnchor:v72];
  v92[6] = v73;
  v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:v92 count:7];
  [v80 activateConstraints:v74];
}

- (void)updateConstraintConstants
{
  id v3 = objc_alloc(MEMORY[0x263F1C668]);
  id v15 = (id)[v3 initForTextStyle:*MEMORY[0x263F1D300]];
  [v15 scaledValueForValue:44.0];
  double v5 = v4;
  double v6 = [(WDHeartRhythmHeaderView *)self titleFirstBaselineToTopMarginConstraint];
  [v6 setConstant:v5];

  [v15 scaledValueForValue:28.0];
  double v8 = v7;
  uint64_t v9 = [(WDHeartRhythmHeaderView *)self bodyFirstBaslineToTitleLastBaslineConstraint];
  [v9 setConstant:v8];

  id v10 = objc_alloc(MEMORY[0x263F1C668]);
  uint64_t v11 = (void *)[v10 initForTextStyle:*MEMORY[0x263F1D260]];
  [v11 scaledValueForValue:30.0];
  double v13 = v12;
  double v14 = [(WDHeartRhythmHeaderView *)self bottomMarginToBodyLastBaselineConstraint];
  [v14 setConstant:v13];
}

- (void)updateBodyTextView
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = [(WDHeartRhythmHeaderView *)self bodyTextAttributedString];
  uint64_t v4 = [(WDHeartRhythmHeaderView *)self bodyURLAttributedString];
  double v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v15 = *MEMORY[0x263F1C238];
    double v7 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    v16[0] = v7;
    double v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v9 = (void *)[v6 initWithString:@" " attributes:v8];

    v14[0] = v3;
    v14[1] = v9;
    v14[2] = v5;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
    HKUIJoinAttributedStringsForLocale();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3) {
      double v12 = v3;
    }
    else {
      double v12 = (void *)v4;
    }
    id v11 = v12;
  }
  double v13 = [(WDHeartRhythmHeaderView *)self bodyTextView];
  [v13 setAttributedText:v11];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v8 = a3;
  if (!v8) {
    goto LABEL_3;
  }
  uint64_t v4 = [(WDHeartRhythmHeaderView *)self traitCollection];
  double v5 = [v4 preferredContentSizeCategory];
  id v6 = [v8 preferredContentSizeCategory];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0) {
LABEL_3:
  }
    [(WDHeartRhythmHeaderView *)self updateConstraintConstants];
}

- (void)setTitleText:(id)a3
{
  id v4 = a3;
  id v5 = [(WDHeartRhythmHeaderView *)self titleLabel];
  [v5 setText:v4];
}

- (NSString)titleText
{
  v2 = [(WDHeartRhythmHeaderView *)self titleLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setBodyText:(id)a3 URLText:(id)a4 URL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (NSString *)[a3 copy];
  bodyText = self->_bodyText;
  self->_bodyText = v10;

  double v12 = (NSString *)[v9 copy];
  bodyURLText = self->_bodyURLText;
  self->_bodyURLText = v12;

  double v14 = (NSURL *)[v8 copy];
  bodyURL = self->_bodyURL;
  self->_bodyURL = v14;

  [(WDHeartRhythmHeaderView *)self updateBodyTextView];
}

- (NSAttributedString)bodyTextAttributedString
{
  v12[2] = *MEMORY[0x263EF8340];
  id v3 = [(WDHeartRhythmHeaderView *)self bodyText];

  if (v3)
  {
    v11[0] = *MEMORY[0x263F1C238];
    id v4 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    v12[0] = v4;
    v11[1] = *MEMORY[0x263F1C240];
    id v5 = [MEMORY[0x263F1C550] labelColor];
    v12[1] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

    id v7 = objc_alloc(MEMORY[0x263F086A0]);
    id v8 = [(WDHeartRhythmHeaderView *)self bodyText];
    id v9 = (void *)[v7 initWithString:v8 attributes:v6];
  }
  else
  {
    id v9 = 0;
  }

  return (NSAttributedString *)v9;
}

- (NSAttributedString)bodyURLAttributedString
{
  v15[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WDHeartRhythmHeaderView *)self bodyURLText];
  if (v3
    && (id v4 = (void *)v3,
        [(WDHeartRhythmHeaderView *)self bodyURL],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v14[0] = *MEMORY[0x263F1C238];
    id v6 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    v15[0] = v6;
    v14[1] = *MEMORY[0x263F1C240];
    id v7 = objc_msgSend(MEMORY[0x263F1C550], "hk_appKeyColor");
    v15[1] = v7;
    v14[2] = *MEMORY[0x263F1C258];
    id v8 = [(WDHeartRhythmHeaderView *)self bodyURL];
    v15[2] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

    id v10 = objc_alloc(MEMORY[0x263F086A0]);
    id v11 = [(WDHeartRhythmHeaderView *)self bodyURLText];
    double v12 = (void *)[v10 initWithString:v11 attributes:v9];
  }
  else
  {
    double v12 = 0;
  }

  return (NSAttributedString *)v12;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v6 = objc_msgSend(a4, "scheme", a3);
  char v7 = [v6 isEqualToString:@"https"];

  return v7;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UITextView)bodyTextView
{
  return self->_bodyTextView;
}

- (void)setBodyTextView:(id)a3
{
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (void)setBodyText:(id)a3
{
}

- (NSString)bodyURLText
{
  return self->_bodyURLText;
}

- (void)setBodyURLText:(id)a3
{
}

- (NSURL)bodyURL
{
  return self->_bodyURL;
}

- (void)setBodyURL:(id)a3
{
}

- (NSLayoutConstraint)titleFirstBaselineToTopMarginConstraint
{
  return self->_titleFirstBaselineToTopMarginConstraint;
}

- (void)setTitleFirstBaselineToTopMarginConstraint:(id)a3
{
}

- (NSLayoutConstraint)bodyFirstBaslineToTitleLastBaslineConstraint
{
  return self->_bodyFirstBaslineToTitleLastBaslineConstraint;
}

- (void)setBodyFirstBaslineToTitleLastBaslineConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomMarginToBodyLastBaselineConstraint
{
  return self->_bottomMarginToBodyLastBaselineConstraint;
}

- (void)setBottomMarginToBodyLastBaselineConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomMarginToBodyLastBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_bodyFirstBaslineToTitleLastBaslineConstraint, 0);
  objc_storeStrong((id *)&self->_titleFirstBaselineToTopMarginConstraint, 0);
  objc_storeStrong((id *)&self->_bodyURL, 0);
  objc_storeStrong((id *)&self->_bodyURLText, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_bodyTextView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end