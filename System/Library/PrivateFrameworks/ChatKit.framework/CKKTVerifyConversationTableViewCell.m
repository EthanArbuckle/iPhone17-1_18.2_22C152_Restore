@interface CKKTVerifyConversationTableViewCell
+ (id)reuseIdentifier;
- (BOOL)shouldShowMacHeader;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKKTVerifyConversationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 numberOfRowsInSection:(int64_t)a5 shouldShowMacHeader:(BOOL)a6 ktStatus:(unint64_t)a7;
- (UILabel)macHeaderLabel;
- (UILabel)verifyConversationLabel;
- (id)verifyTitleString;
- (int64_t)numberOfRowsInSection;
- (unint64_t)ktStatus;
- (void)addConstraints;
- (void)setEnabled:(BOOL)a3;
- (void)setKtStatus:(unint64_t)a3;
- (void)setMacHeaderLabel:(id)a3;
- (void)setNumberOfRowsInSection:(int64_t)a3;
- (void)setShouldShowMacHeader:(BOOL)a3;
- (void)setVerifyConversationLabel:(id)a3;
- (void)setupSeparators;
- (void)setupTitleLabel;
- (void)setupView;
- (void)updateForNewKTState;
@end

@implementation CKKTVerifyConversationTableViewCell

+ (id)reuseIdentifier
{
  return @"CKKTVerifyConversationTableViewCell_reuseIdentifier";
}

- (CKKTVerifyConversationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 numberOfRowsInSection:(int64_t)a5 shouldShowMacHeader:(BOOL)a6 ktStatus:(unint64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)CKKTVerifyConversationTableViewCell;
  v10 = [(CKDetailsCell *)&v13 initWithStyle:a3 reuseIdentifier:a4];
  v11 = v10;
  if (v10)
  {
    v10->_numberOfRowsInSection = a5;
    v10->_shouldShowMacHeader = a6;
    v10->_ktStatus = a7;
    [(CKKTVerifyConversationTableViewCell *)v10 setupView];
  }
  return v11;
}

- (void)setupView
{
  [(CKKTVerifyConversationTableViewCell *)self setupTitleLabel];
  [(CKKTVerifyConversationTableViewCell *)self setupSeparators];
  if (self->_shouldShowMacHeader) {
    [(CKKTVerifyConversationTableViewCell *)self setupMacHeaderLabel];
  }
  v3 = [(CKKTVerifyConversationTableViewCell *)self contentView];
  [v3 setBackgroundColor:0];

  [(CKKTVerifyConversationTableViewCell *)self addConstraints];
}

- (void)setupSeparators
{
  BOOL v3 = self->_numberOfRowsInSection < 2;
  v4 = [(CKDetailsCell *)self topSeperator];
  [v4 setHidden:v3];

  v5 = [(CKDetailsCell *)self bottomSeperator];
  [v5 setHidden:1];

  [(CKDetailsCell *)self setIndentTopSeperator:1];

  [(CKDetailsCell *)self setIndentBottomSeperator:1];
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)setupTitleLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4F42B38]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  verifyConversationLabel = self->_verifyConversationLabel;
  self->_verifyConversationLabel = v4;

  v6 = self->_verifyConversationLabel;
  v7 = [(CKKTVerifyConversationTableViewCell *)self verifyTitleString];
  [(UILabel *)v6 setText:v7];

  v8 = self->_verifyConversationLabel;
  v9 = [(CKKTVerifyConversationTableViewCell *)self textLabel];
  v10 = [v9 font];
  [(UILabel *)v8 setFont:v10];

  v11 = self->_verifyConversationLabel;
  v12 = +[CKUIBehavior sharedBehaviors];
  objc_super v13 = [v12 theme];
  v14 = [v13 detailsTextColor];
  [(UILabel *)v11 setTextColor:v14];

  [(UILabel *)self->_verifyConversationLabel setNumberOfLines:0];
  [(UILabel *)self->_verifyConversationLabel setLineBreakMode:4];
  [(UILabel *)self->_verifyConversationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v15 = [(CKKTVerifyConversationTableViewCell *)self contentView];
  [v15 addSubview:self->_verifyConversationLabel];
}

- (void)addConstraints
{
  v55[4] = *MEMORY[0x1E4F143B8];
  v53 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v3 = 0x1E4F1C000;
  if (CKIsRunningInMacCatalyst() && self->_shouldShowMacHeader)
  {
    v47 = [(UILabel *)self->_macHeaderLabel topAnchor];
    v51 = [(CKKTVerifyConversationTableViewCell *)self contentView];
    v49 = [v51 layoutMarginsGuide];
    v43 = [v49 topAnchor];
    v45 = +[CKUIBehavior sharedBehaviors];
    [v45 detailsSectionHeaderPaddingAbove];
    v41 = objc_msgSend(v47, "constraintEqualToAnchor:constant:", v43);
    v55[0] = v41;
    v37 = [(UILabel *)self->_macHeaderLabel heightAnchor];
    v39 = [(UILabel *)self->_macHeaderLabel font];
    [v39 pointSize];
    v35 = objc_msgSend(v37, "constraintEqualToConstant:");
    v55[1] = v35;
    v29 = [(UILabel *)self->_macHeaderLabel leadingAnchor];
    v33 = [(CKKTVerifyConversationTableViewCell *)self contentView];
    v31 = [v33 layoutMarginsGuide];
    v4 = [v31 leadingAnchor];
    v5 = +[CKUIBehavior sharedBehaviors];
    [v5 detailsSectionHeaderPaddingLeading];
    v6 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v4);
    v55[2] = v6;
    v7 = [(UILabel *)self->_macHeaderLabel trailingAnchor];
    v8 = [(CKKTVerifyConversationTableViewCell *)self contentView];
    v9 = [v8 layoutMarginsGuide];
    v10 = [v9 trailingAnchor];
    v11 = [v7 constraintEqualToAnchor:v10];
    v55[3] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:4];
    [v53 addObjectsFromArray:v12];

    unint64_t v3 = 0x1E4F1C000uLL;
  }
  objc_super v13 = [(UILabel *)self->_verifyConversationLabel leadingAnchor];
  v50 = [(CKKTVerifyConversationTableViewCell *)self contentView];
  v48 = [v50 layoutMarginsGuide];
  [v48 leadingAnchor];
  v46 = v52 = v13;
  v44 = objc_msgSend(v13, "constraintEqualToAnchor:");
  v54[0] = v44;
  v14 = [(UILabel *)self->_verifyConversationLabel trailingAnchor];
  v40 = [(CKKTVerifyConversationTableViewCell *)self contentView];
  v38 = [v40 layoutMarginsGuide];
  [v38 trailingAnchor];
  v36 = v42 = v14;
  v34 = objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:");
  v54[1] = v34;
  id v15 = [(UILabel *)self->_verifyConversationLabel topAnchor];
  macHeaderLabel = self->_macHeaderLabel;
  v32 = macHeaderLabel;
  if (macHeaderLabel)
  {
    [(UILabel *)macHeaderLabel bottomAnchor];
  }
  else
  {
    v28 = [(CKKTVerifyConversationTableViewCell *)self contentView];
    v27 = [v28 layoutMarginsGuide];
    [v27 topAnchor];
  v17 = };
  v30 = +[CKUIBehavior sharedBehaviors];
  [v30 detailsCellLabelPadding];
  v18 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17);
  v54[2] = v18;
  v19 = [(UILabel *)self->_verifyConversationLabel bottomAnchor];
  v20 = [(CKKTVerifyConversationTableViewCell *)self contentView];
  v21 = [v20 layoutMarginsGuide];
  v22 = [v21 bottomAnchor];
  v23 = +[CKUIBehavior sharedBehaviors];
  [v23 detailsCellLabelPadding];
  v25 = [v19 constraintEqualToAnchor:v22 constant:-v24];
  v54[3] = v25;
  v26 = [*(id *)(v3 + 2424) arrayWithObjects:v54 count:4];
  [v53 addObjectsFromArray:v26];

  if (!v32)
  {

    v17 = v28;
  }

  [MEMORY[0x1E4F28DC8] activateConstraints:v53];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v5 = [(CKKTVerifyConversationTableViewCell *)self contentView];
  [v5 layoutMargins];
  double v7 = v6;
  v8 = [(CKKTVerifyConversationTableViewCell *)self contentView];
  [v8 layoutMargins];
  double v10 = v7 + v9;

  v11 = [(CKKTVerifyConversationTableViewCell *)self contentView];
  [v11 frame];
  double v13 = v12 - v10;

  double v14 = 0.0;
  if (self->_shouldShowMacHeader)
  {
    macHeaderLabel = self->_macHeaderLabel;
    if (macHeaderLabel)
    {
      -[UILabel sizeThatFits:](macHeaderLabel, "sizeThatFits:", v13, 1.79769313e308);
      double v17 = v16;
      v18 = +[CKUIBehavior sharedBehaviors];
      [v18 detailsSectionHeaderPaddingAbove];
      double v14 = v17 + v19;
    }
  }
  -[UILabel sizeThatFits:](self->_verifyConversationLabel, "sizeThatFits:", v13, 1.79769313e308);
  double v21 = v14 + v20;
  v22 = +[CKUIBehavior sharedBehaviors];
  [v22 detailsCellLabelPadding];
  double v24 = v21 + v23 * 2.0;

  v25 = [(CKKTVerifyConversationTableViewCell *)self contentView];
  [v25 layoutMargins];
  double v27 = v24 + v26;
  v28 = [(CKKTVerifyConversationTableViewCell *)self contentView];
  [v28 layoutMargins];
  double v30 = v27 + v29;

  double v31 = width;
  double v32 = v30;
  result.height = v32;
  result.CGFloat width = v31;
  return result;
}

- (void)updateForNewKTState
{
  [(CKKTVerifyConversationTableViewCell *)self setupSeparators];
  if (self->_shouldShowMacHeader) {
    [(CKKTVerifyConversationTableViewCell *)self setupMacHeaderLabel];
  }
  id v4 = [(CKKTVerifyConversationTableViewCell *)self verifyConversationLabel];
  unint64_t v3 = [(CKKTVerifyConversationTableViewCell *)self verifyTitleString];
  [v4 setText:v3];
}

- (id)verifyTitleString
{
  unint64_t v3 = CKFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"KT_VERIFY_CONVERSATION_CELL_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];

  if ([(CKKTVerifyConversationTableViewCell *)self ktStatus] == 4)
  {
    v5 = CKFrameworkBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"KT_SHOW_VREIFICATION_CODE_CELL_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];

    id v4 = (void *)v6;
  }

  return v4;
}

- (unint64_t)ktStatus
{
  return self->_ktStatus;
}

- (void)setKtStatus:(unint64_t)a3
{
  self->_ktStatus = a3;
}

- (BOOL)shouldShowMacHeader
{
  return self->_shouldShowMacHeader;
}

- (void)setShouldShowMacHeader:(BOOL)a3
{
  self->_shouldShowMacHeader = a3;
}

- (int64_t)numberOfRowsInSection
{
  return self->_numberOfRowsInSection;
}

- (void)setNumberOfRowsInSection:(int64_t)a3
{
  self->_numberOfRowsInSection = a3;
}

- (UILabel)verifyConversationLabel
{
  return self->_verifyConversationLabel;
}

- (void)setVerifyConversationLabel:(id)a3
{
}

- (UILabel)macHeaderLabel
{
  return self->_macHeaderLabel;
}

- (void)setMacHeaderLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macHeaderLabel, 0);

  objc_storeStrong((id *)&self->_verifyConversationLabel, 0);
}

@end