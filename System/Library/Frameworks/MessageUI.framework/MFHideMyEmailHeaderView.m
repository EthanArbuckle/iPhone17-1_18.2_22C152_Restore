@interface MFHideMyEmailHeaderView
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MFHideMyEmailHeaderView)initWithFrame:(CGRect)a3 address:(id)a4;
- (NSString)address;
- (UIEditMenuInteraction)editInteraction;
- (void)copy:(id)a3;
- (void)didTriggerEditGesture:(id)a3;
- (void)infoButtonPressed:(id)a3;
- (void)setAddress:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setEditInteraction:(id)a3;
@end

@implementation MFHideMyEmailHeaderView

- (MFHideMyEmailHeaderView)initWithFrame:(CGRect)a3 address:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v38.receiver = self;
  v38.super_class = (Class)MFHideMyEmailHeaderView;
  v10 = -[MFHideMyEmailHeaderView initWithFrame:](&v38, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(MFHideMyEmailHeaderView *)v10 setAddress:v9];
    [(MFHideMyEmailHeaderView *)v11 setAxis:0];
    [(MFHideMyEmailHeaderView *)v11 setAlignment:3];
    [(MFHideMyEmailHeaderView *)v11 setDistribution:0];
    [(MFHideMyEmailHeaderView *)v11 setSpacing:8.0];
    [(MFHideMyEmailHeaderView *)v11 setLayoutMarginsRelativeArrangement:1];
    -[MFHideMyEmailHeaderView setDirectionalLayoutMargins:](v11, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, 16.0);
    v12 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
    [v12 setTextToSecondaryTextVerticalPadding:4.0];
    v13 = [MEMORY[0x1E4F28B50] mainBundle];
    v14 = [v13 localizedStringForKey:@"HIDE_MY_EMAIL_TITLE" value:&stru_1F0817A00 table:@"Main"];
    [v12 setText:v14];

    v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    v16 = [v12 textProperties];
    [v16 setFont:v15];

    v17 = [v12 textProperties];
    [v17 setNumberOfLines:0];

    v18 = [v12 textProperties];
    [v18 setAdjustsFontForContentSizeCategory:1];

    [v12 setSecondaryText:v9];
    v19 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    v20 = [v12 secondaryTextProperties];
    [v20 setFont:v19];

    v21 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v22 = [v12 secondaryTextProperties];
    [v22 setColor:v21];

    v23 = [v12 secondaryTextProperties];
    [v23 setNumberOfLines:0];

    v24 = [v12 secondaryTextProperties];
    [v24 setAdjustsFontForContentSizeCategory:1];

    [v12 directionalLayoutMargins];
    objc_msgSend(v12, "setDirectionalLayoutMargins:");
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4FB1950]) initWithConfiguration:v12];
    contentView = v11->_contentView;
    v11->_contentView = (UIListContentView *)v25;

    [(UIListContentView *)v11->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFHideMyEmailHeaderView *)v11 addArrangedSubview:v11->_contentView];
    v27 = (void *)MEMORY[0x1E4FB14D0];
    v28 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:", @"info.circle", 21);
    uint64_t v29 = [v27 systemButtonWithImage:v28 target:v11 action:sel_infoButtonPressed_];
    infoButton = v11->_infoButton;
    v11->_infoButton = (UIButton *)v29;

    [(UIButton *)v11->_infoButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFHideMyEmailHeaderView *)v11 addArrangedSubview:v11->_infoButton];
    v31 = [(UIButton *)v11->_infoButton widthAnchor];
    v32 = [(UIButton *)v11->_infoButton heightAnchor];
    v33 = [v31 constraintEqualToAnchor:v32 constant:1.0];
    [v33 setActive:1];

    v34 = (void *)[objc_alloc(MEMORY[0x1E4FB1758]) initWithDelegate:v11];
    [(MFHideMyEmailHeaderView *)v11 setEditInteraction:v34];

    v35 = [(MFHideMyEmailHeaderView *)v11 editInteraction];
    [(MFHideMyEmailHeaderView *)v11 addInteraction:v35];

    v36 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v11 action:sel_didTriggerEditGesture_];
    [v36 setAllowedTouchTypes:&unk_1F08419F8];
    [(MFHideMyEmailHeaderView *)v11 addGestureRecognizer:v36];
  }
  return v11;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(UIListContentView *)self->_contentView frame];
  double v5 = v4 + 14.0;
  double v6 = width;
  result.double height = v5;
  result.CGFloat width = v6;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(MFHideMyEmailHeaderView *)self bounds];

  -[MFHideMyEmailHeaderView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.double height = v6;
  result.CGFloat width = v5;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MFHideMyEmailHeaderView *)self bounds];
  if (width != v8) {
    [(MFHideMyEmailHeaderView *)self invalidateIntrinsicContentSize];
  }
  v9.receiver = self;
  v9.super_class = (Class)MFHideMyEmailHeaderView;
  -[MFHideMyEmailHeaderView setBounds:](&v9, sel_setBounds_, x, y, width, height);
}

- (void)infoButtonPressed:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  double v3 = +[MFPreferencesURL hideMyEmailURL];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return sel_copy_ == a3;
}

- (void)copy:(id)a3
{
  objc_msgSend(MEMORY[0x1E4FB1A78], "generalPasteboard", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(MFHideMyEmailHeaderView *)self address];
  [v5 setString:v4];
}

- (void)didTriggerEditGesture:(id)a3
{
  [a3 locationInView:self];
  objc_msgSend(MEMORY[0x1E4FB1750], "configurationWithIdentifier:sourcePoint:", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(MFHideMyEmailHeaderView *)self editInteraction];
  [v4 presentEditMenuWithConfiguration:v5];
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  id v4 = [a3 view];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (UIEditMenuInteraction)editInteraction
{
  return self->_editInteraction;
}

- (void)setEditInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editInteraction, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end