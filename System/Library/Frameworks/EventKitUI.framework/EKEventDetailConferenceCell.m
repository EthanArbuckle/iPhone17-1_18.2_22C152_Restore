@interface EKEventDetailConferenceCell
- (BOOL)_buttonsShouldUseSeparateLine;
- (BOOL)update;
- (ConferenceCellDelegate)delegate;
- (EKEventDetailConferenceCell)initWithEvent:(id)a3 editable:(BOOL)a4;
- (double)_separatorHeight;
- (id)_buttonConfigForCurrentTime;
- (id)_defaultListConfiguration;
- (void)_createConstraints;
- (void)_createViews;
- (void)_openURL;
- (void)_share:(id)a3;
- (void)_updateActionButtonWithType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)tintColorDidChange;
- (void)updateListConfigWithImage:(id)a3 title:(id)a4 subtitle:(id)a5;
@end

@implementation EKEventDetailConferenceCell

- (EKEventDetailConferenceCell)initWithEvent:(id)a3 editable:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)EKEventDetailConferenceCell;
  v4 = [(EKEventDetailCell *)&v8 initWithEvent:a3 editable:a4 style:0];
  v5 = v4;
  if (v4)
  {
    constraints = v4->_constraints;
    v4->_constraints = (NSArray *)MEMORY[0x1E4F1CBF0];

    [(EKEventDetailConferenceCell *)v5 _createViews];
    [(EKEventDetailConferenceCell *)v5 update];
  }
  return v5;
}

- (BOOL)_buttonsShouldUseSeparateLine
{
  double v3 = EKUICurrentWindowWidthWithViewHierarchy(self);
  double v4 = EKUIWidthForWindowSizeParadigm(16);
  v5 = [(EKEventDetailConferenceCell *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E4FB27C0]);

  objc_super v8 = [(EKEventDetailConferenceCell *)self traitCollection];
  BOOL v9 = EKUIUsesLargeTextLayout(v8) || v3 < v4 && v7 != NSOrderedAscending;

  return v9;
}

- (double)_separatorHeight
{
  v2 = [(EKEventDetailConferenceCell *)self traitCollection];
  BOOL v3 = EKUIUsesLargeTextLayout(v2);

  if (v3) {
    return 1.0;
  }

  return CalOnePixelInPoints();
}

- (id)_defaultListConfiguration
{
  BOOL v3 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  double v4 = [MEMORY[0x1E4FB1618] systemGray2Color];
  v5 = [v3 imageProperties];
  [v5 setTintColor:v4];

  [v3 setImageToTextPadding:12.0];
  v6 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  NSComparisonResult v7 = [v3 imageProperties];
  [v7 setPreferredSymbolConfiguration:v6];

  objc_super v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  BOOL v9 = [v3 secondaryTextProperties];
  [v9 setColor:v8];

  if (![(EKEventDetailConferenceCell *)self _buttonsShouldUseSeparateLine])
  {
    v10 = [v3 textProperties];
    [v10 setNumberOfLines:1];

    v11 = [v3 secondaryTextProperties];
    [v11 setNumberOfLines:1];
  }

  return v3;
}

- (void)_createViews
{
  BOOL v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(EKEventDetailConferenceCell *)self setBackgroundColor:v3];

  id v4 = objc_alloc(MEMORY[0x1E4FB1950]);
  v5 = [(EKEventDetailConferenceCell *)self _defaultListConfiguration];
  v6 = (UIListContentView *)[v4 initWithConfiguration:v5];
  listView = self->_listView;
  self->_listView = v6;

  [(UIListContentView *)self->_listView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v8 = [(EKEventDetailConferenceCell *)self contentView];
  [v8 addSubview:self->_listView];

  BOOL v9 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  openURLButton = self->_openURLButton;
  self->_openURLButton = v9;

  [(UIButton *)self->_openURLButton setRole:1];
  [(UIButton *)self->_openURLButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v11) = 1148829696;
  [(UIButton *)self->_openURLButton setContentHuggingPriority:0 forAxis:v11];
  LODWORD(v12) = 1148846080;
  [(UIButton *)self->_openURLButton setContentHuggingPriority:1 forAxis:v12];
  LODWORD(v13) = 1148846080;
  [(UIButton *)self->_openURLButton setContentCompressionResistancePriority:0 forAxis:v13];
  LODWORD(v14) = 1148846080;
  [(UIButton *)self->_openURLButton setContentCompressionResistancePriority:1 forAxis:v14];
  [(UIButton *)self->_openURLButton addTarget:self action:sel__openURL forControlEvents:64];
  v15 = [(EKEventDetailConferenceCell *)self contentView];
  [v15 addSubview:self->_openURLButton];

  id v32 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
  [v32 setCornerStyle:4];
  v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
  [v32 setImage:v16];

  objc_msgSend(v32, "setContentInsets:", 2.0, 2.0, 5.0, 2.0);
  v17 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:-1];
  [v32 setPreferredSymbolConfigurationForImage:v17];

  [v32 setButtonSize:1];
  v18 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  shareButton = self->_shareButton;
  self->_shareButton = v18;

  [(UIButton *)self->_shareButton setConfiguration:v32];
  [(UIButton *)self->_shareButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v20) = 1148846080;
  [(UIButton *)self->_shareButton setContentHuggingPriority:0 forAxis:v20];
  LODWORD(v21) = 1148829696;
  [(UIButton *)self->_shareButton setContentHuggingPriority:1 forAxis:v21];
  LODWORD(v22) = 1148846080;
  [(UIButton *)self->_shareButton setContentCompressionResistancePriority:0 forAxis:v22];
  [(UIButton *)self->_shareButton addTarget:self action:sel__share_ forControlEvents:64];
  v23 = [(EKEventDetailConferenceCell *)self contentView];
  [v23 addSubview:self->_shareButton];

  v24 = (UIView *)objc_opt_new();
  topSeparator = self->_topSeparator;
  self->_topSeparator = v24;

  [(UIView *)self->_topSeparator setTranslatesAutoresizingMaskIntoConstraints:0];
  v26 = [MEMORY[0x1E4FB1618] separatorColor];
  [(UIView *)self->_topSeparator setBackgroundColor:v26];

  v27 = [(EKEventDetailConferenceCell *)self contentView];
  [v27 addSubview:self->_topSeparator];

  v28 = (UIView *)objc_opt_new();
  bottomSeparator = self->_bottomSeparator;
  self->_bottomSeparator = v28;

  [(UIView *)self->_bottomSeparator setTranslatesAutoresizingMaskIntoConstraints:0];
  v30 = [MEMORY[0x1E4FB1618] separatorColor];
  [(UIView *)self->_bottomSeparator setBackgroundColor:v30];

  v31 = [(EKEventDetailConferenceCell *)self contentView];
  [v31 addSubview:self->_bottomSeparator];

  [(EKEventDetailConferenceCell *)self _createConstraints];
}

- (void)_createConstraints
{
  v96[16] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
  v93 = [MEMORY[0x1E4F1CA48] array];
  v91 = [(UIView *)self->_topSeparator heightAnchor];
  [(EKEventDetailConferenceCell *)self _separatorHeight];
  v89 = objc_msgSend(v91, "constraintEqualToConstant:");
  v96[0] = v89;
  v85 = [(UIView *)self->_topSeparator topAnchor];
  v87 = [(EKEventDetailConferenceCell *)self contentView];
  v83 = [v87 topAnchor];
  v81 = [v85 constraintEqualToAnchor:v83];
  v96[1] = v81;
  v77 = [(UIView *)self->_topSeparator leadingAnchor];
  v79 = [(EKEventDetailConferenceCell *)self contentView];
  v75 = [v79 layoutMarginsGuide];
  v73 = [v75 leadingAnchor];
  v72 = [v77 constraintEqualToAnchor:v73];
  v96[2] = v72;
  v70 = [(UIView *)self->_topSeparator trailingAnchor];
  v71 = [(EKEventDetailConferenceCell *)self contentView];
  v69 = [v71 trailingAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v96[3] = v68;
  v67 = [(UIView *)self->_bottomSeparator heightAnchor];
  [(EKEventDetailConferenceCell *)self _separatorHeight];
  v66 = objc_msgSend(v67, "constraintEqualToConstant:");
  v96[4] = v66;
  v64 = [(UIView *)self->_bottomSeparator bottomAnchor];
  v65 = [(EKEventDetailConferenceCell *)self contentView];
  v63 = [v65 bottomAnchor];
  v62 = [v64 constraintEqualToAnchor:v63];
  v96[5] = v62;
  v60 = [(UIView *)self->_bottomSeparator leadingAnchor];
  v61 = [(EKEventDetailConferenceCell *)self contentView];
  v59 = [v61 layoutMarginsGuide];
  v58 = [v59 leadingAnchor];
  v57 = [v60 constraintEqualToAnchor:v58];
  v96[6] = v57;
  v55 = [(UIView *)self->_bottomSeparator trailingAnchor];
  v56 = [(EKEventDetailConferenceCell *)self contentView];
  v54 = [v56 trailingAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v96[7] = v53;
  v51 = [(UIListContentView *)self->_listView leadingAnchor];
  v52 = [(EKEventDetailConferenceCell *)self contentView];
  v50 = [v52 leadingAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v96[8] = v49;
  v47 = [(UIListContentView *)self->_listView topAnchor];
  v48 = [(EKEventDetailConferenceCell *)self contentView];
  v46 = [v48 topAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v96[9] = v45;
  v44 = [(UIButton *)self->_shareButton topAnchor];
  v43 = [(UIButton *)self->_openURLButton topAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v96[10] = v42;
  v41 = [(UIButton *)self->_shareButton bottomAnchor];
  v40 = [(UIButton *)self->_openURLButton bottomAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v96[11] = v39;
  v38 = [(UIButton *)self->_shareButton leadingAnchor];
  v37 = [(UIButton *)self->_openURLButton trailingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37 constant:12.0];
  v96[12] = v36;
  v34 = [(UIButton *)self->_shareButton trailingAnchor];
  v35 = [(EKEventDetailConferenceCell *)self contentView];
  BOOL v3 = [v35 layoutMarginsGuide];
  id v4 = [v3 trailingAnchor];
  v5 = [v34 constraintEqualToAnchor:v4];
  v96[13] = v5;
  v6 = [(UIButton *)self->_shareButton widthAnchor];
  NSComparisonResult v7 = [(UIButton *)self->_shareButton heightAnchor];
  objc_super v8 = [v6 constraintEqualToAnchor:v7];
  v96[14] = v8;
  openURLButton = self->_openURLButton;
  v10 = (void *)MEMORY[0x1E4F28DC8];
  double v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v11 _scaledValueForValue:62.0];
  double v13 = [v10 constraintWithItem:openURLButton attribute:7 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:v12];
  v96[15] = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:16];
  [(NSArray *)v93 addObjectsFromArray:v14];

  BOOL v15 = [(EKEventDetailConferenceCell *)self _buttonsShouldUseSeparateLine];
  listView = self->_listView;
  if (v15)
  {
    v17 = [(UIListContentView *)listView trailingAnchor];
    v18 = [(EKEventDetailConferenceCell *)self contentView];
    v19 = [v18 trailingAnchor];
    double v20 = [v17 constraintEqualToAnchor:v19];
    v95[0] = v20;
    double v21 = [(UIButton *)self->_openURLButton topAnchor];
    v92 = [(UIListContentView *)self->_listView bottomAnchor];
    v90 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", 10.0);
    v95[1] = v90;
    double v22 = [(UIButton *)self->_openURLButton bottomAnchor];
    v88 = [(EKEventDetailConferenceCell *)self contentView];
    v86 = [v88 layoutMarginsGuide];
    v23 = [v86 bottomAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v95[2] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:3];
    [(NSArray *)v93 addObjectsFromArray:v25];
  }
  else
  {
    v82 = [(UIListContentView *)listView bottomAnchor];
    v84 = [(EKEventDetailConferenceCell *)self contentView];
    uint64_t v80 = [v84 bottomAnchor];
    uint64_t v78 = [v82 constraintEqualToAnchor:v80];
    v94[0] = v78;
    v76 = [(UIListContentView *)self->_listView trailingAnchor];
    v92 = [(UIButton *)self->_openURLButton leadingAnchor];
    v90 = objc_msgSend(v76, "constraintEqualToAnchor:");
    v94[1] = v90;
    v74 = [(UIButton *)self->_openURLButton centerYAnchor];
    v88 = [(UIListContentView *)self->_listView centerYAnchor];
    v86 = objc_msgSend(v74, "constraintEqualToAnchor:");
    v94[2] = v86;
    v23 = [(UIButton *)self->_openURLButton topAnchor];
    v24 = [(EKEventDetailConferenceCell *)self contentView];
    v25 = [v24 topAnchor];
    v26 = [v23 constraintGreaterThanOrEqualToAnchor:v25 constant:10.0];
    v94[3] = v26;
    v27 = [(EKEventDetailConferenceCell *)self contentView];
    v28 = [v27 bottomAnchor];
    v29 = [(UIButton *)self->_openURLButton bottomAnchor];
    v30 = [v28 constraintGreaterThanOrEqualToAnchor:v29 constant:10.0];
    v94[4] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:5];
    [(NSArray *)v93 addObjectsFromArray:v31];

    double v22 = v74;
    double v21 = v76;

    double v20 = (void *)v78;
    v19 = (void *)v80;

    v18 = v84;
    v17 = v82;
  }

  constraints = self->_constraints;
  self->_constraints = v93;
  v33 = v93;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
}

- (BOOL)update
{
  [(EKEventDetailConferenceCell *)self _createConstraints];
  BOOL v3 = [(EKEvent *)self->super._event virtualConference];
  id v4 = [v3 joinMethods];
  v5 = [v4 firstObject];

  v6 = [(EKEvent *)self->super._event conferenceURLForDisplay];
  NSComparisonResult v7 = v6;
  if (v5)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __37__EKEventDetailConferenceCell_update__block_invoke;
    v13[3] = &unk_1E60877E8;
    v13[4] = self;
    [MEMORY[0x1E4F57B50] displayDetailsForJoinMethod:v5 completionHandler:v13];
  }
  else if (v6)
  {
    objc_super v8 = (void *)MEMORY[0x1E4F57B50];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__EKEventDetailConferenceCell_update__block_invoke_3;
    v10[3] = &unk_1E6087838;
    id v11 = v6;
    double v12 = self;
    [v8 displayDetailsForURL:v11 completionHandler:v10];
  }
  return 1;
}

void __37__EKEventDetailConferenceCell_update__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__EKEventDetailConferenceCell_update__block_invoke_2;
  v11[3] = &unk_1E60877C0;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v8;
  id v13 = v7;
  uint64_t v14 = a4;
  id v9 = v7;
  id v10 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __37__EKEventDetailConferenceCell_update__block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F57B50];
  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 1080) virtualConference];
  id v4 = [v2 subtitleForVirtualConference:v3 displayedWithTitle:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) updateListConfigWithImage:*(void *)(a1 + 48) title:*(void *)(a1 + 40) subtitle:v4];
  *(void *)(*(void *)(a1 + 32) + 1128) = *(void *)(a1 + 56);
  [*(id *)(a1 + 32) _updateActionButtonWithType:*(void *)(a1 + 56)];
}

void __37__EKEventDetailConferenceCell_update__block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EKEventDetailConferenceCell_update__block_invoke_4;
  block[3] = &unk_1E6087810;
  id v12 = *(id *)(a1 + 32);
  id v13 = v8;
  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = v7;
  uint64_t v16 = a4;
  id v9 = v7;
  id v10 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __37__EKEventDetailConferenceCell_update__block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F57B50] subtitleForURL:*(void *)(a1 + 32) displayedWithTitle:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) updateListConfigWithImage:*(void *)(a1 + 56) title:*(void *)(a1 + 40) subtitle:v2];
  *(void *)(*(void *)(a1 + 48) + 1128) = *(void *)(a1 + 64);
  [*(id *)(a1 + 48) _updateActionButtonWithType:*(void *)(a1 + 64)];
}

- (void)updateListConfigWithImage:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UIListContentView *)self->_listView configuration];
  id v11 = [v10 secondaryText];

  id v12 = [(UIListContentView *)self->_listView configuration];
  id v13 = [v12 text];
  if (![v8 isEqualToString:v13])
  {

    goto LABEL_6;
  }
  if ((v9 == 0) != (v11 != 0))
  {
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v14 = [(UIListContentView *)self->_listView configuration];
  id v15 = [v14 secondaryText];
  char v16 = [v9 isEqualToString:v15];

  if ((v16 & 1) == 0)
  {
LABEL_6:
    id v12 = [(EKEventDetailConferenceCell *)self _defaultListConfiguration];
    [v12 setImage:v17];
    [v12 setText:v8];
    if (v9) {
      [v12 setSecondaryText:v9];
    }
    [(UIListContentView *)self->_listView setConfiguration:v12];
    id v13 = [(EKEventDetailConferenceCell *)self delegate];
    [v13 conferenceCellUpdated:self];
    goto LABEL_9;
  }
LABEL_10:
}

- (id)_buttonConfigForCurrentTime
{
  BOOL v3 = [MEMORY[0x1E4F1C9C8] now];
  id v4 = CUIKCalendar();
  v5 = [(EKEvent *)self->super._event startDate];
  v6 = [v4 dateByAddingUnit:64 value:-15 toDate:v5 options:0];

  id v7 = [(EKEvent *)self->super._event endDateUnadjustedForLegacyClients];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F576D0]) initWithStartDate:v6 endDate:v7];
  if ([v8 containsDate:v3])
  {
    id v9 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
    id v10 = [MEMORY[0x1E4FB1618] systemGreenColor];
    [v9 setBaseBackgroundColor:v10];

    id v11 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    [v9 setBaseForegroundColor:v11];
  }
  else
  {
    id v9 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
  }

  return v9;
}

- (void)_updateActionButtonWithType:(unint64_t)a3
{
  id v19 = [(EKEventDetailConferenceCell *)self _buttonConfigForCurrentTime];
  v5 = [(EKEvent *)self->super._event virtualConference];
  v6 = [v5 joinMethods];
  uint64_t v7 = [v6 firstObject];
  if (!v7)
  {

    goto LABEL_5;
  }
  id v8 = (void *)v7;
  id v9 = [(EKEvent *)self->super._event virtualConference];
  id v10 = [v9 urlWithAllowedScheme];

  if (v10)
  {
LABEL_5:
    switch(a3)
    {
      case 0uLL:
        char v16 = EventKitUIBundle();
        id v13 = v16;
        id v17 = @"Join";
        goto LABEL_11;
      case 1uLL:
        id v11 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];

        id v12 = EventKitUIBundle();
        id v13 = v12;
        uint64_t v14 = @"View";
        id v15 = &stru_1F0CC2140;
        goto LABEL_8;
      case 2uLL:
        char v16 = EventKitUIBundle();
        id v13 = v16;
        id v17 = @"Watch";
        goto LABEL_11;
      case 3uLL:
        char v16 = EventKitUIBundle();
        id v13 = v16;
        id v17 = @"Call";
LABEL_11:
        v18 = [v16 localizedStringForKey:v17 value:&stru_1F0CC2140 table:0];
        [v19 setTitle:v18];
        goto LABEL_12;
      default:
        goto LABEL_13;
    }
  }
  id v11 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];

  id v12 = EventKitUIBundle();
  id v13 = v12;
  uint64_t v14 = @"Open - conference cell";
  id v15 = @"Open";
LABEL_8:
  v18 = [v12 localizedStringForKey:v14 value:v15 table:0];
  [v11 setTitle:v18];
  id v19 = v11;
LABEL_12:

LABEL_13:
  [v19 setButtonSize:1];
  [v19 setCornerStyle:4];
  [(UIButton *)self->_openURLButton setConfiguration:v19];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailConferenceCell;
  [(EKEventDetailConferenceCell *)&v3 tintColorDidChange];
  [(EKEventDetailConferenceCell *)self _updateActionButtonWithType:self->_actionButtonType];
}

- (void)_openURL
{
  objc_super v3 = [(EKEvent *)self->super._event virtualConference];
  id v4 = [v3 joinMethods];
  v5 = [v4 firstObject];

  if (!v5)
  {
    v6 = [(EKEvent *)self->super._event conferenceURLForDisplay];
    goto LABEL_7;
  }
  v6 = [v5 URL];
  uint64_t v7 = [(EKEvent *)self->super._event virtualConference];
  id v8 = [v7 urlWithAllowedScheme];

  if (v8)
  {
LABEL_7:
    v28 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __39__EKEventDetailConferenceCell__openURL__block_invoke_2_72;
    v29[3] = &unk_1E6087860;
    id v20 = v6;
    id v30 = v20;
    [v28 openURL:v20 configuration:0 completionHandler:v29];

    id v13 = v30;
    goto LABEL_8;
  }
  id v9 = NSString;
  id v10 = EventKitUIBundle();
  id v11 = [v10 localizedStringForKey:@"Open “%@”?" value:&stru_1F0CC2140 table:0];
  id v12 = [v6 absoluteString];
  id v13 = objc_msgSend(v9, "localizedStringWithFormat:", v11, v12);

  uint64_t v14 = EventKitUIBundle();
  id v15 = [v14 localizedStringForKey:@"The format of this link is not recognized. iOS cannot verify that it is free from malware." value:&stru_1F0CC2140 table:0];

  char v16 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v13 message:v15 preferredStyle:1];
  id v17 = (void *)MEMORY[0x1E4FB1410];
  v18 = EventKitUIBundle();
  id v19 = [v18 localizedStringForKey:@"Open - conference cell" value:@"Open" table:0];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __39__EKEventDetailConferenceCell__openURL__block_invoke;
  v31[3] = &unk_1E60874A8;
  id v20 = v6;
  id v32 = v20;
  double v21 = [v17 actionWithTitle:v19 style:2 handler:v31];
  [v16 addAction:v21];

  double v22 = (void *)MEMORY[0x1E4FB1410];
  v23 = EventKitUIBundle();
  v24 = [v23 localizedStringForKey:@"Cancel - conference join dialog" value:@"Cancel" table:0];
  v25 = [v22 actionWithTitle:v24 style:1 handler:&__block_literal_global_2];
  [v16 addAction:v25];

  v26 = [(EKEventDetailConferenceCell *)self delegate];
  v27 = [v26 owningViewController];

  if (v27) {
    [v27 presentViewController:v16 animated:1 completion:0];
  }

LABEL_8:
}

void __39__EKEventDetailConferenceCell__openURL__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  objc_super v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__EKEventDetailConferenceCell__openURL__block_invoke_2;
  v4[3] = &unk_1E6087860;
  id v5 = v3;
  [v2 openURL:v5 configuration:0 completionHandler:v4];
}

void __39__EKEventDetailConferenceCell__openURL__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_ERROR, "Unable to open URL from conference detail cell after allowing unallowed scheme %@, error = %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

void __39__EKEventDetailConferenceCell__openURL__block_invoke_2_72(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_ERROR, "Unable to open URL from conference detail cell %@, error = %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_share:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(EKEvent *)self->super._event virtualConference];

  event = self->super._event;
  if (v5)
  {
    uint64_t v7 = [(EKEvent *)event virtualConference];
    uint64_t v8 = [v7 joinMethods];
    int v9 = [v8 firstObject];

    uint64_t v10 = [v9 URL];
  }
  else
  {
    uint64_t v10 = [(EKEvent *)event conferenceURLForDisplay];
  }
  __int16 v11 = [(EKEventDetailConferenceCell *)self delegate];
  int v12 = [v11 conferenceCellShouldPresentShareSheet:self];

  uint64_t v13 = [(EKEventDetailConferenceCell *)self delegate];
  uint64_t v14 = v13;
  if (!v12)
  {
    double v22 = v10;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    [v14 conferenceCell:self requestPresentShareSheetWithActivityItems:v18 withPopoverSourceView:v4];
    id v15 = v14;
    goto LABEL_8;
  }
  id v15 = [v13 owningViewController];

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F9F2E8]);
    v24[0] = v10;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    v18 = (void *)[v16 initWithActivityItems:v17 applicationActivities:0];

    uint64_t v23 = *MEMORY[0x1E4F9F340];
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [v18 setExcludedActivityTypes:v19];

    id v20 = [(EKEvent *)self->super._event calendar];
    objc_msgSend(v18, "setIsContentManaged:", objc_msgSend(v20, "isManaged"));

    double v21 = [v18 popoverPresentationController];
    [v21 setSourceView:v4];

    [v15 presentViewController:v18 animated:1 completion:0];
LABEL_8:
  }
}

- (ConferenceCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ConferenceCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);

  objc_storeStrong((id *)&self->_openURLButton, 0);
}

@end