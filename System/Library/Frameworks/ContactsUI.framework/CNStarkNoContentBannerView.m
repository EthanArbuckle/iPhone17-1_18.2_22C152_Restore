@interface CNStarkNoContentBannerView
- (BOOL)siriButtonEnabled;
- (BOOL)siriButtonSelected;
- (CNStarkNoContentBannerView)initWithFrame:(CGRect)a3;
- (NSMutableArray)constraintsForTitleLabel;
- (NSMutableArray)constraintsForTitleLabelAndSiriButton;
- (NSString)titleString;
- (UIButton)siriButton;
- (UILabel)titleLabel;
- (void)choose;
- (void)clickGestureDidUpdate:(id)a3;
- (void)deselect;
- (void)select;
- (void)setConstraintsForTitleLabel:(id)a3;
- (void)setConstraintsForTitleLabelAndSiriButton:(id)a3;
- (void)setSiriButton:(id)a3;
- (void)setSiriButtonEnabled:(BOOL)a3;
- (void)setSiriButtonSelected:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleString:(id)a3;
- (void)setupClickGestureRecognizer;
- (void)setupConstraintsForTitleLabelAndSiriButton;
- (void)setupConstraintsforTitleLabel;
- (void)setupSiriButton;
- (void)setupTitleLabel;
- (void)stateUpdated;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation CNStarkNoContentBannerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintsForTitleLabelAndSiriButton, 0);
  objc_storeStrong((id *)&self->_constraintsForTitleLabel, 0);
  objc_storeStrong((id *)&self->_siriButton, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (void)setSiriButtonSelected:(BOOL)a3
{
  self->_siriButtonSelected = a3;
}

- (BOOL)siriButtonSelected
{
  return self->_siriButtonSelected;
}

- (void)setConstraintsForTitleLabelAndSiriButton:(id)a3
{
}

- (NSMutableArray)constraintsForTitleLabelAndSiriButton
{
  return (NSMutableArray *)objc_getProperty(self, a2, 440, 1);
}

- (void)setConstraintsForTitleLabel:(id)a3
{
}

- (NSMutableArray)constraintsForTitleLabel
{
  return (NSMutableArray *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSiriButton:(id)a3
{
}

- (UIButton)siriButton
{
  return (UIButton *)objc_getProperty(self, a2, 424, 1);
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 416, 1);
}

- (BOOL)siriButtonEnabled
{
  return self->_siriButtonEnabled;
}

- (void)stateUpdated
{
  if ([(CNStarkNoContentBannerView *)self siriButtonSelected]
    || [(CNStarkNoContentBannerView *)self isFocused])
  {
    v3 = [(CNStarkNoContentBannerView *)self siriButton];
    v4 = +[CNUIColorRepository carPlaySiriButtonTextHighlightedColor];
    [v3 setTitleColor:v4 forState:0];

    uint64_t v5 = +[CNUIColorRepository carPlaySiriButtonBackgroundHighlightedColor];
  }
  else
  {
    v6 = [(CNStarkNoContentBannerView *)self siriButton];
    v7 = +[CNUIColorRepository carPlaySiriButtonTextColor];
    [v6 setTitleColor:v7 forState:0];

    uint64_t v5 = +[CNUIColorRepository carPlaySiriButtonBackgroundColor];
  }
  id v9 = (id)v5;
  v8 = [(CNStarkNoContentBannerView *)self siriButton];
  [v8 setBackgroundColor:v9];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNStarkNoContentBannerView;
  [(CNStarkNoContentBannerView *)&v9 traitCollectionDidChange:a3];
  v4 = +[CNUIFontRepository carPlayNoContentViewTitleFont];
  uint64_t v5 = [(CNStarkNoContentBannerView *)self titleLabel];
  [v5 setFont:v4];

  v6 = +[CNUIFontRepository carPlayNoContentViewSiriButtonFont];
  v7 = [(CNStarkNoContentBannerView *)self siriButton];
  v8 = [v7 titleLabel];
  [v8 setFont:v6];

  [(CNStarkNoContentBannerView *)self stateUpdated];
}

- (void)choose
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = getkAssistantDirectActionEventKey_53975();
  v6 = v2;
  v7[0] = &unk_1ED915980;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  v4 = (void *)[objc_alloc(getSiriDirectActionContextClass_53977()) initWithPayload:v3];
  id v5 = objc_alloc_init(getSiriDirectActionSourceClass_53978());
  [v5 activateWithContext:v4];
}

- (void)deselect
{
  [(CNStarkNoContentBannerView *)self setSiriButtonSelected:0];

  [(CNStarkNoContentBannerView *)self stateUpdated];
}

- (void)select
{
  if ([(CNStarkNoContentBannerView *)self siriButtonEnabled])
  {
    [(CNStarkNoContentBannerView *)self setSiriButtonSelected:1];
    [(CNStarkNoContentBannerView *)self stateUpdated];
  }
}

- (void)clickGestureDidUpdate:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    [(CNStarkNoContentBannerView *)self choose];
  }
  else if ([v4 state] == 4 || objc_msgSend(v4, "state") == 5)
  {
    [(CNStarkNoContentBannerView *)self deselect];
  }
}

- (NSString)titleString
{
  v2 = [(CNStarkNoContentBannerView *)self titleLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitleString:(id)a3
{
  id v4 = a3;
  id v5 = [(CNStarkNoContentBannerView *)self titleLabel];
  [v5 setText:v4];
}

- (void)setSiriButtonEnabled:(BOOL)a3
{
  if (self->_siriButtonEnabled != a3)
  {
    self->_siriButtonEnabled = a3;
    [(CNStarkNoContentBannerView *)self setNeedsUpdateConstraints];
  }
}

- (void)setupClickGestureRecognizer
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_clickGestureDidUpdate_];
  [v3 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
  [v3 setAllowedPressTypes:&unk_1ED915BD8];
  [(CNStarkNoContentBannerView *)self addGestureRecognizer:v3];
}

- (void)updateConstraints
{
  v12.receiver = self;
  v12.super_class = (Class)CNStarkNoContentBannerView;
  [(CNStarkNoContentBannerView *)&v12 updateConstraints];
  BOOL v3 = [(CNStarkNoContentBannerView *)self siriButtonEnabled];
  id v4 = [(CNStarkNoContentBannerView *)self siriButton];
  id v5 = v4;
  if (v3)
  {
    [(CNStarkNoContentBannerView *)self addSubview:v4];

    v6 = (void *)MEMORY[0x1E4F28DC8];
    v7 = [(CNStarkNoContentBannerView *)self constraintsForTitleLabel];
    [v6 deactivateConstraints:v7];

    v8 = (void *)MEMORY[0x1E4F28DC8];
    [(CNStarkNoContentBannerView *)self constraintsForTitleLabelAndSiriButton];
  }
  else
  {
    [v4 removeFromSuperview];

    objc_super v9 = (void *)MEMORY[0x1E4F28DC8];
    v10 = [(CNStarkNoContentBannerView *)self constraintsForTitleLabelAndSiriButton];
    [v9 deactivateConstraints:v10];

    v8 = (void *)MEMORY[0x1E4F28DC8];
    [(CNStarkNoContentBannerView *)self constraintsForTitleLabel];
  v11 = };
  [v8 activateConstraints:v11];
}

- (void)setupConstraintsForTitleLabelAndSiriButton
{
  v38[2] = *MEMORY[0x1E4F143B8];
  v35 = [MEMORY[0x1E4F1CA48] array];
  BOOL v3 = [(UILabel *)self->_titleLabel widthAnchor];
  id v4 = [v3 constraintEqualToConstant:241.0];
  v38[0] = v4;
  id v5 = [(UILabel *)self->_titleLabel centerXAnchor];
  v6 = [(CNStarkNoContentBannerView *)self safeAreaLayoutGuide];
  v7 = [v6 centerXAnchor];
  v8 = [v5 constraintEqualToAnchor:v7];
  v38[1] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  [v35 addObjectsFromArray:v9];

  v10 = [(UIButton *)self->_siriButton widthAnchor];
  v11 = [v10 constraintEqualToConstant:241.0];
  v37[0] = v11;
  objc_super v12 = [(UIButton *)self->_siriButton centerXAnchor];
  v13 = [(CNStarkNoContentBannerView *)self safeAreaLayoutGuide];
  v14 = [v13 centerXAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v37[1] = v15;
  v16 = [(UIButton *)self->_siriButton heightAnchor];
  v17 = [v16 constraintEqualToConstant:40.0];
  v37[2] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];
  [v35 addObjectsFromArray:v18];

  v34 = [(CNStarkNoContentBannerView *)self safeAreaLayoutGuide];
  v32 = [v34 topAnchor];
  v33 = [(CNStarkNoContentBannerView *)self titleLabel];
  v31 = [v33 topAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v36[0] = v30;
  v29 = [(CNStarkNoContentBannerView *)self titleLabel];
  v27 = [v29 bottomAnchor];
  v28 = [(CNStarkNoContentBannerView *)self siriButton];
  v19 = [v28 topAnchor];
  v20 = [v27 constraintEqualToAnchor:v19];
  v36[1] = v20;
  v21 = [(CNStarkNoContentBannerView *)self safeAreaLayoutGuide];
  v22 = [v21 bottomAnchor];
  v23 = [(CNStarkNoContentBannerView *)self siriButton];
  v24 = [v23 bottomAnchor];
  v25 = [v22 constraintEqualToAnchor:v24 constant:24.0];
  v36[2] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  [v35 addObjectsFromArray:v26];

  [(CNStarkNoContentBannerView *)self setConstraintsForTitleLabelAndSiriButton:v35];
}

- (void)setupConstraintsforTitleLabel
{
  v15[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  v14 = [(UILabel *)self->_titleLabel widthAnchor];
  v13 = [v14 constraintEqualToConstant:241.0];
  v15[0] = v13;
  objc_super v12 = [(UILabel *)self->_titleLabel centerXAnchor];
  id v4 = [(CNStarkNoContentBannerView *)self safeAreaLayoutGuide];
  id v5 = [v4 centerXAnchor];
  v6 = [v12 constraintEqualToAnchor:v5];
  v15[1] = v6;
  v7 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  v8 = [(CNStarkNoContentBannerView *)self safeAreaLayoutGuide];
  objc_super v9 = [v8 centerYAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v15[2] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  [v3 addObjectsFromArray:v11];

  [(CNStarkNoContentBannerView *)self setConstraintsForTitleLabel:v3];
}

- (void)setupSiriButton
{
  BOOL v3 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  siriButton = self->_siriButton;
  self->_siriButton = v3;

  [(UIButton *)self->_siriButton setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [(UIButton *)self->_siriButton layer];
  [v5 setCornerRadius:8.0];

  v6 = [(UIButton *)self->_siriButton titleLabel];
  [v6 setTextAlignment:1];

  v7 = +[CNUIFontRepository carPlayNoContentViewSiriButtonFont];
  v8 = [(UIButton *)self->_siriButton titleLabel];
  [v8 setFont:v7];

  objc_super v9 = [(UIButton *)self->_siriButton titleLabel];
  [v9 setNumberOfLines:1];

  v10 = [(UIButton *)self->_siriButton titleLabel];
  [v10 setAdjustsFontSizeToFitWidth:1];

  v11 = self->_siriButton;
  objc_super v12 = CNContactsUIBundle();
  v13 = [v12 localizedStringForKey:@"ASK_SIRI_TO_MAKE_CALL" value:&stru_1ED8AC728 table:@"Localized"];
  [(UIButton *)v11 setTitle:v13 forState:0];

  [(UIButton *)self->_siriButton addTarget:self action:sel_siriButtonTapped_ forControlEvents:64];
  [(UIButton *)self->_siriButton addTarget:self action:sel_siriButtonTouchDown_ forControlEvents:1];
  [(UIButton *)self->_siriButton addTarget:self action:sel_siriButtonTouchUp_ forControlEvents:192];
  v14 = self->_siriButton;

  [(CNStarkNoContentBannerView *)self addSubview:v14];
}

- (void)setupTitleLabel
{
  BOOL v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = +[CNUIFontRepository carPlayNoContentViewTitleFont];
  [(UILabel *)self->_titleLabel setFont:v5];

  v6 = +[CNUIColorRepository carPlayTableViewCellTitleTextColor];
  [(UILabel *)self->_titleLabel setTextColor:v6];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  v7 = self->_titleLabel;

  [(CNStarkNoContentBannerView *)self addSubview:v7];
}

- (CNStarkNoContentBannerView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNStarkNoContentBannerView;
  BOOL v3 = -[CNStarkNoContentBannerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(CNStarkNoContentBannerView *)v3 setAutoresizingMask:18];
    id v5 = +[CNUIColorRepository carPlayTableViewBackgroundColor];
    [(CNStarkNoContentBannerView *)v4 setBackgroundColor:v5];

    v4->_siriButtonEnabled = 1;
    [(CNStarkNoContentBannerView *)v4 setupTitleLabel];
    [(CNStarkNoContentBannerView *)v4 setupSiriButton];
    [(CNStarkNoContentBannerView *)v4 setupConstraintsforTitleLabel];
    [(CNStarkNoContentBannerView *)v4 setupConstraintsForTitleLabelAndSiriButton];
    [(CNStarkNoContentBannerView *)v4 setupClickGestureRecognizer];
    [(CNStarkNoContentBannerView *)v4 stateUpdated];
    v6 = v4;
  }

  return v4;
}

@end