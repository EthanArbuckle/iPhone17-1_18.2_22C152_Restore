@interface _SFSettingsAlertItemBackgroundView
- (_SFSettingsAlertItemBackgroundView)initWithFrame:(CGRect)a3;
- (id)_highlightEffect;
- (int64_t)mode;
- (void)setMode:(int64_t)a3;
- (void)updateConstraints;
@end

@implementation _SFSettingsAlertItemBackgroundView

- (_SFSettingsAlertItemBackgroundView)initWithFrame:(CGRect)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)_SFSettingsAlertItemBackgroundView;
  v3 = -[_SFSettingsAlertItemBackgroundView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1F00]);
    v5 = [(_SFSettingsAlertItemBackgroundView *)v3 _highlightEffect];
    uint64_t v6 = [v4 initWithEffect:v5];
    highlightView = v3->_highlightView;
    v3->_highlightView = (UIVisualEffectView *)v6;

    [(UIVisualEffectView *)v3->_highlightView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_SFSettingsAlertItemBackgroundView *)v3 bounds];
    -[UIVisualEffectView setFrame:](v3->_highlightView, "setFrame:");
    [(UIVisualEffectView *)v3->_highlightView setHidden:1];
    v8 = [(UIVisualEffectView *)v3->_highlightView contentView];
    v9 = [v8 tintColor];
    v10 = [(UIVisualEffectView *)v3->_highlightView contentView];
    [v10 setBackgroundColor:v9];

    [(_SFSettingsAlertItemBackgroundView *)v3 addSubview:v3->_highlightView];
    v11 = [(UIVisualEffectView *)v3->_highlightView topAnchor];
    v12 = [(_SFSettingsAlertItemBackgroundView *)v3 topAnchor];
    uint64_t v13 = [v11 constraintEqualToAnchor:v12];
    highlightToTopConstraint = v3->_highlightToTopConstraint;
    v3->_highlightToTopConstraint = (NSLayoutConstraint *)v13;

    v15 = [(UIVisualEffectView *)v3->_highlightView bottomAnchor];
    v16 = [(_SFSettingsAlertItemBackgroundView *)v3 bottomAnchor];
    uint64_t v17 = [v15 constraintEqualToAnchor:v16];
    highlightToBottomConstraint = v3->_highlightToBottomConstraint;
    v3->_highlightToBottomConstraint = (NSLayoutConstraint *)v17;

    v19 = [(UIVisualEffectView *)v3->_highlightView leadingAnchor];
    v20 = [(_SFSettingsAlertItemBackgroundView *)v3 leadingAnchor];
    uint64_t v21 = [v19 constraintEqualToAnchor:v20];
    highlightToLeadingConstraint = v3->_highlightToLeadingConstraint;
    v3->_highlightToLeadingConstraint = (NSLayoutConstraint *)v21;

    v23 = [(UIVisualEffectView *)v3->_highlightView leadingAnchor];
    v24 = [(_SFSettingsAlertItemBackgroundView *)v3 leadingAnchor];
    uint64_t v25 = [v23 constraintEqualToSystemSpacingAfterAnchor:v24 multiplier:1.0];
    highlightToLeadingWithSpaceConstraint = v3->_highlightToLeadingWithSpaceConstraint;
    v3->_highlightToLeadingWithSpaceConstraint = (NSLayoutConstraint *)v25;

    v27 = [(UIVisualEffectView *)v3->_highlightView heightAnchor];
    _SFOnePixel();
    uint64_t v28 = objc_msgSend(v27, "constraintEqualToConstant:");
    highlightPixelHeightConstraint = v3->_highlightPixelHeightConstraint;
    v3->_highlightPixelHeightConstraint = (NSLayoutConstraint *)v28;

    v30 = [(UIVisualEffectView *)v3->_highlightView widthAnchor];
    _SFOnePixel();
    uint64_t v31 = objc_msgSend(v30, "constraintEqualToConstant:");
    highlightPixelWidthConstraint = v3->_highlightPixelWidthConstraint;
    v3->_highlightPixelWidthConstraint = (NSLayoutConstraint *)v31;

    v33 = [(UIVisualEffectView *)v3->_highlightView trailingAnchor];
    v34 = [(_SFSettingsAlertItemBackgroundView *)v3 trailingAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    v40[0] = v35;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    [(_SFSettingsAlertItemBackgroundView *)v3 addConstraints:v36];

    [(_SFSettingsAlertItemBackgroundView *)v3 setUserInteractionEnabled:0];
    v37 = v3;
  }

  return v3;
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    id v4 = [(_SFSettingsAlertItemBackgroundView *)self _highlightEffect];
    [(UIVisualEffectView *)self->_highlightView setEffect:v4];

    [(_SFSettingsAlertItemBackgroundView *)self setNeedsUpdateConstraints];
  }
}

- (id)_highlightEffect
{
  unint64_t mode = self->_mode;
  if (mode > 6) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_1A6A8A7D0[mode];
  }
  id v4 = (void *)MEMORY[0x1E4FB1EA0];
  v5 = objc_msgSend(MEMORY[0x1E4FB14C8], "_sf_defaultPopoverBackgroundEffect");
  uint64_t v6 = [v4 effectForBlurEffect:v5 style:v3];

  return v6;
}

- (void)updateConstraints
{
  v27[6] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)_SFSettingsAlertItemBackgroundView;
  [(_SFSettingsAlertItemBackgroundView *)&v20 updateConstraints];
  uint64_t v3 = (void *)MEMORY[0x1E4F28DC8];
  highlightToBottomConstraint = self->_highlightToBottomConstraint;
  v27[0] = self->_highlightToTopConstraint;
  v27[1] = highlightToBottomConstraint;
  highlightToLeadingWithSpaceConstraint = self->_highlightToLeadingWithSpaceConstraint;
  v27[2] = self->_highlightToLeadingConstraint;
  v27[3] = highlightToLeadingWithSpaceConstraint;
  highlightPixelHeightConstraint = self->_highlightPixelHeightConstraint;
  v27[4] = self->_highlightPixelWidthConstraint;
  v27[5] = highlightPixelHeightConstraint;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:6];
  [v3 deactivateConstraints:v7];

  [(UIVisualEffectView *)self->_highlightView setHidden:self->_mode == 0];
  [(_SFSettingsAlertItemBackgroundView *)self setBackgroundColor:0];
  if ([MEMORY[0x1E4F98AF8] isBrowsingAssistantEnabled])
  {
    int64_t mode = self->_mode;
    if (mode != 1) {
      goto LABEL_5;
    }
    [(UIVisualEffectView *)self->_highlightView setHidden:1];
    v9 = [MEMORY[0x1E4FB1618] systemGray4Color];
    [(_SFSettingsAlertItemBackgroundView *)self setBackgroundColor:v9];
  }
  int64_t mode = self->_mode;
LABEL_5:
  switch(mode)
  {
    case 0:
    case 1:
      v10 = (void *)MEMORY[0x1E4F28DC8];
      highlightToTopConstraint = self->_highlightToTopConstraint;
      v21[0] = self->_highlightToLeadingConstraint;
      v21[1] = highlightToTopConstraint;
      v21[2] = self->_highlightToBottomConstraint;
      v12 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v13 = v21;
      goto LABEL_12;
    case 2:
      v10 = (void *)MEMORY[0x1E4F28DC8];
      v15 = self->_highlightPixelHeightConstraint;
      v26[0] = self->_highlightToTopConstraint;
      v26[1] = v15;
      v26[2] = self->_highlightToLeadingWithSpaceConstraint;
      v12 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v13 = v26;
      goto LABEL_12;
    case 3:
      v10 = (void *)MEMORY[0x1E4F28DC8];
      v14 = self->_highlightPixelHeightConstraint;
      v25[0] = self->_highlightToTopConstraint;
      v25[1] = v14;
      v25[2] = self->_highlightToLeadingConstraint;
      v12 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v13 = v25;
      goto LABEL_12;
    case 4:
      v10 = (void *)MEMORY[0x1E4F28DC8];
      v16 = self->_highlightPixelHeightConstraint;
      v24[0] = self->_highlightToBottomConstraint;
      v24[1] = v16;
      v24[2] = self->_highlightToLeadingWithSpaceConstraint;
      v12 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v13 = v24;
      goto LABEL_12;
    case 5:
      v10 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v17 = self->_highlightPixelHeightConstraint;
      v23[0] = self->_highlightToBottomConstraint;
      v23[1] = v17;
      v23[2] = self->_highlightToLeadingConstraint;
      v12 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v13 = v23;
      goto LABEL_12;
    case 6:
      v10 = (void *)MEMORY[0x1E4F28DC8];
      v18 = self->_highlightToBottomConstraint;
      v22[0] = self->_highlightToTopConstraint;
      v22[1] = v18;
      v22[2] = self->_highlightPixelWidthConstraint;
      v12 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v13 = v22;
LABEL_12:
      v19 = [v12 arrayWithObjects:v13 count:3];
      [v10 activateConstraints:v19];

      break;
    default:
      return;
  }
}

- (int64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightPixelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_highlightPixelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_highlightToLeadingWithSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_highlightToLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_highlightToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_highlightToTopConstraint, 0);

  objc_storeStrong((id *)&self->_highlightView, 0);
}

@end