@interface CKKTEnhancedProtectionStatusCell
+ (BOOL)shouldHighlight;
+ (id)reuseIdentifier;
- (BOOL)shouldShowMacHeader;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKKTEnhancedProtectionStatusCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 state:(int64_t)a5 delegate:(id)a6 handlesInChat:(id)a7 verifiedHandles:(id)a8 titleString:(id)a9 shouldShowMacHeader:(BOOL)a10;
- (CKKTEnhancedProtectionStatusCellDelegate)delegate;
- (NSMutableArray)horizontalLayoutConstraints;
- (NSMutableArray)verticalLayoutConstraints;
- (NSString)titleString;
- (UIButton)ktStatusButton;
- (UILabel)ktTitleLabel;
- (UILabel)macHeaderLabel;
- (id)clearWarningAction;
- (id)ktStatusMenu;
- (id)learnMoreAction;
- (id)menuForKTStatusError;
- (id)menuForKTStatusTurnedOff;
- (id)menuForKTStatusUnavailable;
- (id)reportToAppleAction;
- (id)statusButtonConfiguration;
- (id)verifyConversationAction;
- (int64_t)enhancedProtectionStatusCellState;
- (unint64_t)handlesInChatCount;
- (unint64_t)verifiedHandlesCount;
- (void)activateConstraints;
- (void)layoutSubviews;
- (void)reconfigureStatusButton;
- (void)setDelegate:(id)a3;
- (void)setEnhancedProtectionStatusCellState:(int64_t)a3;
- (void)setHandlesInChatCount:(unint64_t)a3;
- (void)setHorizontalLayoutConstraints:(id)a3;
- (void)setKtStatusButton:(id)a3;
- (void)setKtTitleLabel:(id)a3;
- (void)setMacHeaderLabel:(id)a3;
- (void)setTitleString:(id)a3;
- (void)setVerifiedHandlesCount:(unint64_t)a3;
- (void)setVerticalLayoutConstraints:(id)a3;
- (void)setupConstraintsForLayouts;
- (void)setupSeparators;
- (void)setupStatusButton;
- (void)setupTitleLabel;
- (void)setupView;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTitleAndStatusButtonConfiguration;
@end

@implementation CKKTEnhancedProtectionStatusCell

+ (id)reuseIdentifier
{
  return @"CKKTEnhancedProtectionStatusCell_reuseIdentifier";
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (CKKTEnhancedProtectionStatusCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 state:(int64_t)a5 delegate:(id)a6 handlesInChat:(id)a7 verifiedHandles:(id)a8 titleString:(id)a9 shouldShowMacHeader:(BOOL)a10
{
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v23.receiver = self;
  v23.super_class = (Class)CKKTEnhancedProtectionStatusCell;
  v20 = [(CKDetailsCell *)&v23 initWithStyle:a3 reuseIdentifier:a4];
  v21 = v20;
  if (v20)
  {
    v20->_enhancedProtectionStatusCellState = a5;
    objc_storeWeak((id *)&v20->_delegate, v16);
    v21->_handlesInChatCount = [v17 count];
    v21->_verifiedHandlesCount = [v18 count];
    objc_storeStrong((id *)&v21->_titleString, a9);
    v21->_shouldShowMacHeader = a10;
    [(CKKTEnhancedProtectionStatusCell *)v21 setupView];
  }

  return v21;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKKTEnhancedProtectionStatusCell;
  [(CKKTEnhancedProtectionStatusCell *)&v4 traitCollectionDidChange:a3];
  [(CKKTEnhancedProtectionStatusCell *)self activateConstraints];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKKTEnhancedProtectionStatusCell;
  [(CKDetailsCell *)&v3 layoutSubviews];
  [(CKKTEnhancedProtectionStatusCell *)self activateConstraints];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v5 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  [v5 layoutMargins];
  double v7 = v6;
  v8 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  [v8 layoutMargins];
  double v10 = v7 + v9;

  v11 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  [v11 frame];
  double v13 = v12 - v10;

  -[UIButton sizeThatFits:](self->_ktStatusButton, "sizeThatFits:", v13, 1.79769313e308);
  double v15 = v14;
  double v17 = v16;
  -[UILabel sizeThatFits:](self->_macHeaderLabel, "sizeThatFits:", v13, 1.79769313e308);
  double v19 = v18;
  -[UILabel sizeThatFits:](self->_ktTitleLabel, "sizeThatFits:", v13, 1.79769313e308);
  if (v15 + v21 <= v13)
  {
    double v22 = fmax(v17, v20);
    objc_super v23 = +[CKUIBehavior sharedBehaviors];
    [v23 detailsCellLabelPadding];
    double v25 = 2.0;
  }
  else
  {
    double v22 = v17 + 0.0 + v20;
    objc_super v23 = +[CKUIBehavior sharedBehaviors];
    [v23 detailsCellLabelPadding];
    double v25 = 4.0;
  }
  double v26 = v22 + v24 * v25;

  if (self->_macHeaderLabel && self->_shouldShowMacHeader)
  {
    v27 = +[CKUIBehavior sharedBehaviors];
    [v27 detailsSectionHeaderPaddingAbove];
    double v26 = v19 + v26 + v28;
  }
  v29 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  [v29 layoutMargins];
  double v31 = v26 + v30;
  v32 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  [v32 layoutMargins];
  double v34 = v31 + v33;

  double v35 = width;
  double v36 = v34;
  result.height = v36;
  result.CGFloat width = v35;
  return result;
}

- (void)setupView
{
  [(CKKTEnhancedProtectionStatusCell *)self setupVibrancyEffectView];
  [(CKKTEnhancedProtectionStatusCell *)self setupTitleLabel];
  [(CKKTEnhancedProtectionStatusCell *)self setupStatusButton];
  [(CKKTEnhancedProtectionStatusCell *)self setupSeparators];
  if (self->_shouldShowMacHeader) {
    [(CKKTEnhancedProtectionStatusCell *)self setupMacHeaderLabel];
  }
  objc_super v3 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  [v3 setBackgroundColor:0];

  [(CKKTEnhancedProtectionStatusCell *)self setupConstraintsForLayouts];
}

- (void)setupTitleLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4F42B38]);
  objc_super v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  ktTitleLabel = self->_ktTitleLabel;
  self->_ktTitleLabel = v4;

  [(UILabel *)self->_ktTitleLabel setText:self->_titleString];
  double v6 = self->_ktTitleLabel;
  double v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [(UILabel *)v6 setFont:v7];

  [(UILabel *)self->_ktTitleLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_ktTitleLabel setLineBreakMode:0];
  [(UILabel *)self->_ktTitleLabel setNumberOfLines:0];
  [(UILabel *)self->_ktTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  [v8 addSubview:self->_ktTitleLabel];
}

- (id)statusButtonConfiguration
{
  switch(self->_enhancedProtectionStatusCellState)
  {
    case 1:
      unint64_t v7 = [(CKKTEnhancedProtectionStatusCell *)self handlesInChatCount];
      id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
      double v9 = CKFrameworkBundle();
      double v10 = v9;
      if (v7 == 1) {
        v11 = @"KT_SINGLE_VERIFIED";
      }
      else {
        v11 = @"KT_MULTIPLE_VERIFIED";
      }
      double v12 = [v9 localizedStringForKey:v11 value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
      double v13 = (void *)[v8 initWithString:v12];

      double v14 = +[CKUIBehavior sharedBehaviors];
      double v15 = [v14 theme];
      double v16 = [v15 secondaryLabelColor];

      double v17 = (void *)MEMORY[0x1E4F42A80];
      double v18 = @"checkmark.circle.fill";
      goto LABEL_14;
    case 2:
      unint64_t handlesInChatCount = self->_handlesInChatCount;
      id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
      if (handlesInChatCount < 2)
      {
        double v20 = CKFrameworkBundle();
        double v21 = v20;
        double v22 = @"KT_ENHANCED_PROTECTION_STATE_NOT_VERIFIED";
LABEL_21:
        v45 = [v20 localizedStringForKey:v22 value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
        double v13 = (void *)[v19 initWithString:v45];
      }
      else
      {
        v38 = NSString;
        v39 = CKFrameworkBundle();
        v40 = [v39 localizedStringForKey:@"N_OF_N_VERIFIED" value:&stru_1EDE4CA38 table:@"ChatKitFormats-Key-Transparency"];
        v41 = objc_msgSend(v38, "localizedStringWithFormat:", v40, -[CKKTEnhancedProtectionStatusCell verifiedHandlesCount](self, "verifiedHandlesCount"), -[CKKTEnhancedProtectionStatusCell handlesInChatCount](self, "handlesInChatCount"));

        v42 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v43 = [v42 userInterfaceLayoutDirection];

        if (v43 == 1) {
          v44 = @"\u200F";
        }
        else {
          v44 = @"\u200E";
        }
        double v21 = [(__CFString *)v44 stringByAppendingString:v41];

        double v13 = (void *)[v19 initWithString:v21];
      }

      v46 = +[CKUIBehavior sharedBehaviors];
      v47 = [v46 theme];
      double v16 = [v47 secondaryLabelColor];

      double v36 = 0;
      goto LABEL_23;
    case 3:
      id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
      double v20 = CKFrameworkBundle();
      double v21 = v20;
      double v22 = @"KT_ENHANCED_PROTECTION_STATE_VERIFICATION_OFF";
      goto LABEL_21;
    case 4:
      if (!CKIsRunningInMacCatalyst()) {
        goto LABEL_10;
      }
      id v23 = objc_alloc(MEMORY[0x1E4F28E48]);
      double v24 = CKFrameworkBundle();
      double v25 = [v24 localizedStringForKey:@"KT_ENHANCED_PROTECTION_STATE_WARNING" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
      v5 = (void *)[v23 initWithString:v25];

      double v26 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.down"];
      v27 = [MEMORY[0x1E4F42A98] configurationWithScale:1];
      double v28 = [v26 imageWithSymbolConfiguration:v27];

      v29 = [MEMORY[0x1E4F428B8] redColor];
      double v30 = [v28 imageWithTintColor:v29];

      id v31 = objc_alloc_init(MEMORY[0x1E4FB0870]);
      [v31 setImage:v30];
      [v31 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
      id v32 = objc_alloc_init(MEMORY[0x1E4FB0870]);
      double v33 = +[CKUIBehavior sharedBehaviors];
      [v33 ktStringAttachmentPadding];
      objc_msgSend(v32, "setBounds:");

      double v34 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v32];
      [v5 appendAttributedString:v34];

      double v35 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v31];
      [v5 appendAttributedString:v35];

      double v13 = (void *)[v5 copy];
      goto LABEL_13;
    case 5:
      id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
      objc_super v4 = CKFrameworkBundle();
      v5 = v4;
      double v6 = @"KT_ENHANCED_PROTECTION_STATE_TURNED_OFF";
      goto LABEL_12;
    case 6:
    case 7:
      id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
      objc_super v4 = CKFrameworkBundle();
      v5 = v4;
      double v6 = @"KT_STATE_UNAVAILABLE";
      goto LABEL_12;
    default:
LABEL_10:
      id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
      objc_super v4 = CKFrameworkBundle();
      v5 = v4;
      double v6 = @"KT_ENHANCED_PROTECTION_STATE_WARNING";
LABEL_12:
      double v30 = [v4 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
      double v13 = (void *)[v3 initWithString:v30];
LABEL_13:

      double v16 = [MEMORY[0x1E4F428B8] systemRedColor];
      double v17 = (void *)MEMORY[0x1E4F42A80];
      double v18 = @"exclamationmark.triangle.fill";
LABEL_14:
      double v36 = [v17 systemImageNamed:v18];
LABEL_23:
      v48 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
      objc_msgSend(v48, "setContentInsets:", *MEMORY[0x1E4F424F0], *(double *)(MEMORY[0x1E4F424F0] + 8), *(double *)(MEMORY[0x1E4F424F0] + 16), *(double *)(MEMORY[0x1E4F424F0] + 24));
      [v48 setAttributedTitle:v13];
      [v48 setBaseForegroundColor:v16];
      [v48 setBaseBackgroundColor:v16];
      v49 = [MEMORY[0x1E4F42A98] configurationWithScale:1];
      v50 = [v36 imageWithSymbolConfiguration:v49];

      [v48 setImage:v50];
      v51 = +[CKUIBehavior sharedBehaviors];
      [v51 ktStatusCellImagePadding];
      objc_msgSend(v48, "setImagePadding:");

      [v48 setImagePlacement:2];
      [v48 setTitleAlignment:1];

      return v48;
  }
}

- (void)setupStatusButton
{
  id v3 = (void *)MEMORY[0x1E4F427E0];
  objc_super v4 = [(CKKTEnhancedProtectionStatusCell *)self statusButtonConfiguration];
  v5 = [v3 buttonWithConfiguration:v4 primaryAction:0];
  ktStatusButton = self->_ktStatusButton;
  self->_ktStatusButton = v5;

  [(UIButton *)self->_ktStatusButton setPreferredBehavioralStyle:1];
  unint64_t v7 = self->_ktStatusButton;
  id v8 = [(CKKTEnhancedProtectionStatusCell *)self ktStatusMenu];
  [(UIButton *)v7 setMenu:v8];

  [(UIButton *)self->_ktStatusButton setShowsMenuAsPrimaryAction:1];
  if ((unint64_t)(self->_enhancedProtectionStatusCellState - 1) <= 2) {
    [(UIButton *)self->_ktStatusButton setUserInteractionEnabled:0];
  }
  [(UIButton *)self->_ktStatusButton setTranslatesAutoresizingMaskIntoConstraints:0];
  id v9 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  [v9 addSubview:self->_ktStatusButton];
}

- (void)reconfigureStatusButton
{
  ktStatusButton = self->_ktStatusButton;
  objc_super v4 = [(CKKTEnhancedProtectionStatusCell *)self statusButtonConfiguration];
  [(UIButton *)ktStatusButton setConfiguration:v4];

  double v6 = self->_ktStatusButton;
  v5 = [(CKKTEnhancedProtectionStatusCell *)self ktStatusMenu];
  [(UIButton *)v6 setMenu:v5];

  [(UIButton *)v6 setUserInteractionEnabled:(unint64_t)(self->_enhancedProtectionStatusCellState - 4) < 0xFFFFFFFFFFFFFFFDLL];
}

- (void)setupSeparators
{
  id v3 = [(CKDetailsCell *)self topSeperator];
  [v3 setHidden:1];

  objc_super v4 = [(CKDetailsCell *)self bottomSeperator];
  [v4 setHidden:1];

  [(CKDetailsCell *)self setIndentTopSeperator:1];

  [(CKDetailsCell *)self setIndentBottomSeperator:1];
}

- (void)setupConstraintsForLayouts
{
  v135[4] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  horizontalLayoutConstraints = self->_horizontalLayoutConstraints;
  self->_horizontalLayoutConstraints = v3;

  v5 = [MEMORY[0x1E4F1CA48] array];
  verticalLayoutConstraints = self->_verticalLayoutConstraints;
  self->_verticalLayoutConstraints = v5;

  if (CKIsRunningInMacCatalyst())
  {
    macHeaderLabel = self->_macHeaderLabel;
    if (macHeaderLabel)
    {
      if (self->_shouldShowMacHeader)
      {
        v90 = self->_horizontalLayoutConstraints;
        v120 = [(UILabel *)macHeaderLabel topAnchor];
        v128 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
        v125 = [v128 layoutMarginsGuide];
        v110 = [v125 topAnchor];
        v115 = +[CKUIBehavior sharedBehaviors];
        [v115 detailsSectionHeaderPaddingAbove];
        v105 = objc_msgSend(v120, "constraintEqualToAnchor:constant:", v110);
        v135[0] = v105;
        v95 = [(UILabel *)self->_macHeaderLabel heightAnchor];
        v100 = [(UILabel *)self->_macHeaderLabel font];
        [v100 pointSize];
        v85 = objc_msgSend(v95, "constraintEqualToConstant:");
        v135[1] = v85;
        v73 = [(UILabel *)self->_macHeaderLabel leadingAnchor];
        v82 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
        v78 = [v82 layoutMarginsGuide];
        v71 = [v78 leadingAnchor];
        id v8 = +[CKUIBehavior sharedBehaviors];
        [v8 detailsSectionHeaderPaddingLeading];
        id v9 = objc_msgSend(v73, "constraintEqualToAnchor:constant:", v71);
        v135[2] = v9;
        double v10 = [(UILabel *)self->_macHeaderLabel trailingAnchor];
        v11 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
        double v12 = [v11 layoutMarginsGuide];
        double v13 = [v12 trailingAnchor];
        double v14 = [v10 constraintEqualToAnchor:v13];
        v135[3] = v14;
        double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:4];
        [(NSMutableArray *)v90 addObjectsFromArray:v15];

        v101 = self->_verticalLayoutConstraints;
        v121 = [(UILabel *)self->_macHeaderLabel topAnchor];
        v129 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
        v126 = [v129 layoutMarginsGuide];
        v111 = [v126 topAnchor];
        v116 = +[CKUIBehavior sharedBehaviors];
        [v116 detailsSectionHeaderPaddingAbove];
        v106 = objc_msgSend(v121, "constraintEqualToAnchor:constant:", v111);
        v134[0] = v106;
        v91 = [(UILabel *)self->_macHeaderLabel heightAnchor];
        v96 = [(UILabel *)self->_macHeaderLabel font];
        [v96 pointSize];
        v86 = objc_msgSend(v91, "constraintEqualToConstant:");
        v134[1] = v86;
        v77 = [(UILabel *)self->_macHeaderLabel leadingAnchor];
        v81 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
        v74 = [v81 layoutMarginsGuide];
        double v16 = [v74 leadingAnchor];
        double v17 = [v77 constraintEqualToAnchor:v16];
        v134[2] = v17;
        double v18 = [(UILabel *)self->_macHeaderLabel trailingAnchor];
        id v19 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
        double v20 = [v19 layoutMarginsGuide];
        double v21 = [v20 trailingAnchor];
        double v22 = [v18 constraintEqualToAnchor:v21];
        v134[3] = v22;
        id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:4];
        [(NSMutableArray *)v101 addObjectsFromArray:v23];
      }
    }
  }
  v117 = self->_verticalLayoutConstraints;
  double v24 = [(UILabel *)self->_ktTitleLabel topAnchor];
  double v25 = self->_macHeaderLabel;
  v122 = v25;
  if (v25)
  {
    [(UILabel *)v25 bottomAnchor];
  }
  else
  {
    v81 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
    v77 = [v81 layoutMarginsGuide];
    [v77 topAnchor];
  uint64_t v26 = };
  v112 = +[CKUIBehavior sharedBehaviors];
  [v112 detailsCellLabelPadding];
  v102 = objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26);
  v133[0] = v102;
  v92 = [(UILabel *)self->_ktTitleLabel leadingAnchor];
  v97 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  [v97 layoutMarginsGuide];
  v87 = v107 = v24;
  v27 = [v87 leadingAnchor];
  double v28 = [v92 constraintEqualToAnchor:v27];
  v133[1] = v28;
  v29 = [(UILabel *)self->_ktTitleLabel trailingAnchor];
  double v30 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  [v30 layoutMarginsGuide];
  v32 = id v31 = (void *)v26;
  double v33 = [v32 trailingAnchor];
  double v34 = [v29 constraintLessThanOrEqualToAnchor:v33];
  v133[2] = v34;
  double v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:3];
  [(NSMutableArray *)v117 addObjectsFromArray:v35];

  if (!v122)
  {

    id v31 = v81;
  }

  v88 = self->_verticalLayoutConstraints;
  v123 = [(UIButton *)self->_ktStatusButton topAnchor];
  v113 = [(UILabel *)self->_ktTitleLabel bottomAnchor];
  v118 = +[CKUIBehavior sharedBehaviors];
  [v118 detailsCellLabelPadding];
  v108 = [v123 constraintEqualToAnchor:v113 constant:v36 + v36];
  v132[0] = v108;
  v98 = [(UIButton *)self->_ktStatusButton leadingAnchor];
  v103 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  v93 = [v103 layoutMarginsGuide];
  v83 = [v93 leadingAnchor];
  v79 = [v98 constraintEqualToAnchor:v83];
  v132[1] = v79;
  v72 = [(UIButton *)self->_ktStatusButton trailingAnchor];
  v75 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  v70 = [v75 layoutMarginsGuide];
  v37 = [v70 trailingAnchor];
  v38 = [v72 constraintLessThanOrEqualToAnchor:v37];
  v132[2] = v38;
  v39 = [(UIButton *)self->_ktStatusButton bottomAnchor];
  v40 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  v41 = [v40 layoutMarginsGuide];
  v42 = [v41 bottomAnchor];
  uint64_t v43 = +[CKUIBehavior sharedBehaviors];
  [v43 detailsCellLabelPadding];
  v45 = [v39 constraintEqualToAnchor:v42 constant:-v44];
  v132[3] = v45;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:4];
  [(NSMutableArray *)v88 addObjectsFromArray:v46];

  v119 = self->_horizontalLayoutConstraints;
  v47 = [(UILabel *)self->_ktTitleLabel topAnchor];
  v48 = self->_macHeaderLabel;
  v127 = v48;
  if (v48)
  {
    [(UILabel *)v48 bottomAnchor];
  }
  else
  {
    v72 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
    v70 = [v72 layoutMarginsGuide];
    [v70 topAnchor];
  uint64_t v49 = };
  v124 = +[CKUIBehavior sharedBehaviors];
  [v124 detailsCellLabelPadding];
  v114 = objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49);
  v131[0] = v114;
  v99 = [(UILabel *)self->_ktTitleLabel bottomAnchor];
  v109 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  v104 = [v109 layoutMarginsGuide];
  v84 = [v104 bottomAnchor];
  v89 = +[CKUIBehavior sharedBehaviors];
  [v89 detailsCellLabelPadding];
  v80 = [v99 constraintEqualToAnchor:v84 constant:-v50];
  v131[1] = v80;
  v76 = [(UILabel *)self->_ktTitleLabel leadingAnchor];
  v51 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  v52 = [v51 layoutMarginsGuide];
  v53 = [v52 leadingAnchor];
  [v76 constraintEqualToAnchor:v53];
  v54 = v94 = v47;
  v131[2] = v54;
  [(UILabel *)self->_ktTitleLabel trailingAnchor];
  v56 = v55 = (void *)v49;
  v57 = [(UIButton *)self->_ktStatusButton leadingAnchor];
  v58 = [v56 constraintLessThanOrEqualToAnchor:v57];
  v131[3] = v58;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:4];
  [(NSMutableArray *)v119 addObjectsFromArray:v59];

  if (!v127)
  {

    v55 = v72;
  }

  v60 = self->_horizontalLayoutConstraints;
  v61 = [(UIButton *)self->_ktStatusButton trailingAnchor];
  v62 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  v63 = [v62 layoutMarginsGuide];
  v64 = [v63 trailingAnchor];
  v65 = [v61 constraintEqualToAnchor:v64];
  v130[0] = v65;
  v66 = [(UIButton *)self->_ktStatusButton centerYAnchor];
  v67 = [(UILabel *)self->_ktTitleLabel centerYAnchor];
  v68 = [v66 constraintEqualToAnchor:v67];
  v130[1] = v68;
  v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:2];
  [(NSMutableArray *)v60 addObjectsFromArray:v69];
}

- (void)activateConstraints
{
  ktStatusButton = self->_ktStatusButton;
  objc_super v4 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  [v4 frame];
  -[UIButton sizeThatFits:](ktStatusButton, "sizeThatFits:", v5, 1.79769313e308);
  double v7 = v6;

  ktTitleLabel = self->_ktTitleLabel;
  id v9 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  [v9 frame];
  -[UILabel sizeThatFits:](ktTitleLabel, "sizeThatFits:", v10, 1.79769313e308);
  double v12 = v11;

  double v13 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  [v13 layoutMargins];
  double v15 = v14;
  double v16 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  [v16 layoutMargins];
  double v18 = v15 + v17;

  id v19 = [(CKKTEnhancedProtectionStatusCell *)self contentView];
  [v19 frame];
  double v21 = v20 - v18;

  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_horizontalLayoutConstraints];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_verticalLayoutConstraints];
  double v22 = (void *)MEMORY[0x1E4F28DC8];
  if (v7 + v12 <= v21) {
    uint64_t v23 = 1112;
  }
  else {
    uint64_t v23 = 1120;
  }
  uint64_t v24 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v23);

  objc_msgSend(v22, "activateConstraints:", v24, v7 + v12);
}

- (void)updateTitleAndStatusButtonConfiguration
{
  [(UILabel *)self->_ktTitleLabel setText:self->_titleString];

  [(CKKTEnhancedProtectionStatusCell *)self reconfigureStatusButton];
}

- (id)ktStatusMenu
{
  int64_t enhancedProtectionStatusCellState = self->_enhancedProtectionStatusCellState;
  if ((unint64_t)(enhancedProtectionStatusCellState - 6) < 2)
  {
    id v3 = [(CKKTEnhancedProtectionStatusCell *)self menuForKTStatusUnavailable];
  }
  else if (enhancedProtectionStatusCellState == 4)
  {
    id v3 = [(CKKTEnhancedProtectionStatusCell *)self menuForKTStatusError];
  }
  else if (enhancedProtectionStatusCellState == 5)
  {
    id v3 = [(CKKTEnhancedProtectionStatusCell *)self menuForKTStatusTurnedOff];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)menuForKTStatusError
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  objc_super v4 = [(CKKTEnhancedProtectionStatusCell *)self learnMoreAction];
  double v5 = [(CKKTEnhancedProtectionStatusCell *)self reportToAppleAction];
  double v6 = [(CKKTEnhancedProtectionStatusCell *)self verifyConversationAction];
  double v7 = [(CKKTEnhancedProtectionStatusCell *)self clearWarningAction];
  id v8 = (void *)MEMORY[0x1E4F42B80];
  v17[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  double v10 = [v8 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v9];

  v16[0] = v10;
  v16[1] = v6;
  v16[2] = v5;
  v16[3] = v4;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  [v3 addObjectsFromArray:v11];

  double v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v13 = [v12 isKeyTransparencyReportToAppleEnabled];

  if ((v13 & 1) == 0) {
    [v3 removeObject:v5];
  }
  if (self->_handlesInChatCount >= 2) {
    [v3 removeObject:v6];
  }
  double v14 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 children:v3];

  return v14;
}

- (id)menuForKTStatusUnavailable
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  objc_super v4 = [(CKKTEnhancedProtectionStatusCell *)self learnMoreAction];
  double v5 = [(CKKTEnhancedProtectionStatusCell *)self reportToAppleAction];
  double v6 = [(CKKTEnhancedProtectionStatusCell *)self clearWarningAction];
  double v7 = (void *)MEMORY[0x1E4F42B80];
  v16[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v9 = [v7 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v8];

  v15[0] = v9;
  v15[1] = v5;
  v15[2] = v4;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  [v3 addObjectsFromArray:v10];

  double v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v12 = [v11 isKeyTransparencyReportToAppleEnabled];

  if ((v12 & 1) == 0) {
    [v3 removeObject:v5];
  }
  char v13 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 children:v3];

  return v13;
}

- (id)menuForKTStatusTurnedOff
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  objc_super v4 = [(CKKTEnhancedProtectionStatusCell *)self learnMoreAction];
  double v5 = [(CKKTEnhancedProtectionStatusCell *)self clearWarningAction];
  double v6 = (void *)MEMORY[0x1E4F42B80];
  v13[0] = v5;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v8 = [v6 menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v7];

  v12[0] = v8;
  v12[1] = v4;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v3 addObjectsFromArray:v9];

  double v10 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 children:v3];

  return v10;
}

- (id)learnMoreAction
{
  id location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4F426E8];
  id v3 = CKFrameworkBundle();
  objc_super v4 = [v3 localizedStringForKey:@"KT_LEARN_MORE_ELLIPSES" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
  double v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"info.circle"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__CKKTEnhancedProtectionStatusCell_learnMoreAction__block_invoke;
  v8[3] = &unk_1E5620ED8;
  objc_copyWeak(&v9, &location);
  double v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __51__CKKTEnhancedProtectionStatusCell_learnMoreAction__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 keyTransparencyDetailsStatusCellDidSelectLearnMore:v3];
}

- (id)reportToAppleAction
{
  id location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4F426E8];
  id v3 = CKFrameworkBundle();
  objc_super v4 = [v3 localizedStringForKey:@"KT_REPORT_TO_APPLE_ELLIPSES" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
  double v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"exclamationmark.bubble"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__CKKTEnhancedProtectionStatusCell_reportToAppleAction__block_invoke;
  v8[3] = &unk_1E5620ED8;
  objc_copyWeak(&v9, &location);
  double v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __55__CKKTEnhancedProtectionStatusCell_reportToAppleAction__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 keyTransparencyDetailsStatusCellDidRequestReportToApple:v3];
}

- (id)verifyConversationAction
{
  id location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4F426E8];
  id v3 = CKFrameworkBundle();
  objc_super v4 = [v3 localizedStringForKey:@"KT_VERIFY_CONVERSATION_ELLIPSES" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
  double v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"person.crop.circle.badge.checkmark"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__CKKTEnhancedProtectionStatusCell_verifyConversationAction__block_invoke;
  v8[3] = &unk_1E5620ED8;
  objc_copyWeak(&v9, &location);
  double v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __60__CKKTEnhancedProtectionStatusCell_verifyConversationAction__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 keyTransparencyDetailsStatusCellDidRequestVerification:v3];
}

- (id)clearWarningAction
{
  id location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4F426E8];
  id v3 = CKFrameworkBundle();
  objc_super v4 = [v3 localizedStringForKey:@"KT_CLEAR_WARNING" value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
  double v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"xmark"];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  double v10 = __54__CKKTEnhancedProtectionStatusCell_clearWarningAction__block_invoke;
  double v11 = &unk_1E5620ED8;
  objc_copyWeak(&v12, &location);
  double v6 = [v2 actionWithTitle:v4 image:v5 identifier:0 handler:&v8];

  objc_msgSend(v6, "setAttributes:", 2, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __54__CKKTEnhancedProtectionStatusCell_clearWarningAction__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 keyTransparencyDetailsStatusCellDidSelectIgnoreFailures:v3];
}

- (int64_t)enhancedProtectionStatusCellState
{
  return self->_enhancedProtectionStatusCellState;
}

- (void)setEnhancedProtectionStatusCellState:(int64_t)a3
{
  self->_int64_t enhancedProtectionStatusCellState = a3;
}

- (unint64_t)verifiedHandlesCount
{
  return self->_verifiedHandlesCount;
}

- (void)setVerifiedHandlesCount:(unint64_t)a3
{
  self->_verifiedHandlesCount = a3;
}

- (unint64_t)handlesInChatCount
{
  return self->_handlesInChatCount;
}

- (void)setHandlesInChatCount:(unint64_t)a3
{
  self->_unint64_t handlesInChatCount = a3;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
}

- (UILabel)macHeaderLabel
{
  return self->_macHeaderLabel;
}

- (void)setMacHeaderLabel:(id)a3
{
}

- (UIButton)ktStatusButton
{
  return self->_ktStatusButton;
}

- (void)setKtStatusButton:(id)a3
{
}

- (UILabel)ktTitleLabel
{
  return self->_ktTitleLabel;
}

- (void)setKtTitleLabel:(id)a3
{
}

- (CKKTEnhancedProtectionStatusCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKKTEnhancedProtectionStatusCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldShowMacHeader
{
  return self->_shouldShowMacHeader;
}

- (NSMutableArray)horizontalLayoutConstraints
{
  return self->_horizontalLayoutConstraints;
}

- (void)setHorizontalLayoutConstraints:(id)a3
{
}

- (NSMutableArray)verticalLayoutConstraints
{
  return self->_verticalLayoutConstraints;
}

- (void)setVerticalLayoutConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_horizontalLayoutConstraints, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ktTitleLabel, 0);
  objc_storeStrong((id *)&self->_ktStatusButton, 0);
  objc_storeStrong((id *)&self->_macHeaderLabel, 0);

  objc_storeStrong((id *)&self->_titleString, 0);
}

@end