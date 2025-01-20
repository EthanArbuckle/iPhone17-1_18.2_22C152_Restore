@interface CKAppContainerTitleView
- (CKAppContainerTitleView)init;
- (NSLayoutConstraint)iconHeightConstraint;
- (NSLayoutConstraint)iconWidthConstraint;
- (UIButton)closeButton;
- (UIImage)iconImage;
- (UIImageView)iconImageView;
- (UILabel)label;
- (void)setCloseButton:(id)a3;
- (void)setIconHeightConstraint:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setIconWidthConstraint:(id)a3;
- (void)setLabel:(id)a3;
- (void)setup;
@end

@implementation CKAppContainerTitleView

- (CKAppContainerTitleView)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKAppContainerTitleView;
  v2 = [(CKAppContainerTitleView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CKAppContainerTitleView *)v2 setup];
  }
  return v3;
}

- (void)setup
{
  v45[3] = *MEMORY[0x1E4F143B8];
  v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
  iconImageView = self->_iconImageView;
  self->_iconImageView = v3;

  [(UIImageView *)self->_iconImageView setContentMode:1];
  objc_super v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  label = self->_label;
  self->_label = v5;

  v7 = +[CKUIBehavior sharedBehaviors];
  v8 = [v7 appLabelFont];
  [(UILabel *)self->_label setFont:v8];

  v9 = [MEMORY[0x1E4F427E0] buttonWithType:7];
  closeButton = self->_closeButton;
  self->_closeButton = v9;

  v11 = self->_label;
  v45[0] = self->_iconImageView;
  v45[1] = v11;
  v45[2] = self->_closeButton;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __32__CKAppContainerTitleView_setup__block_invoke;
  v43[3] = &unk_1E5627F38;
  v43[4] = self;
  objc_msgSend(v12, "__imForEach:", v43);

  v13 = [(UIImageView *)self->_iconImageView widthAnchor];
  v14 = [v13 constraintEqualToConstant:40.0];
  iconWidthConstraint = self->_iconWidthConstraint;
  self->_iconWidthConstraint = v14;

  v16 = [(UIImageView *)self->_iconImageView heightAnchor];
  v17 = [v16 constraintEqualToConstant:30.0];
  iconHeightConstraint = self->_iconHeightConstraint;
  self->_iconHeightConstraint = v17;

  v34 = (void *)MEMORY[0x1E4F28DC8];
  v42 = [(UIImageView *)self->_iconImageView leadingAnchor];
  v41 = [(CKAppContainerTitleView *)self leadingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41 constant:16.0];
  v19 = self->_iconWidthConstraint;
  v44[0] = v40;
  v44[1] = v19;
  v44[2] = self->_iconHeightConstraint;
  v39 = [(UIImageView *)self->_iconImageView centerYAnchor];
  v38 = [(CKAppContainerTitleView *)self centerYAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v44[3] = v37;
  v36 = [(UILabel *)self->_label leadingAnchor];
  v35 = [(UIImageView *)self->_iconImageView trailingAnchor];
  v33 = [v36 constraintEqualToSystemSpacingAfterAnchor:v35 multiplier:1.0];
  v44[4] = v33;
  v32 = [(UILabel *)self->_label centerYAnchor];
  v31 = [(UIImageView *)self->_iconImageView centerYAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v44[5] = v30;
  v20 = [(UILabel *)self->_label trailingAnchor];
  v21 = [(UIButton *)self->_closeButton leadingAnchor];
  v22 = [v20 constraintLessThanOrEqualToAnchor:v21];
  v44[6] = v22;
  v23 = [(UIButton *)self->_closeButton centerYAnchor];
  v24 = [(CKAppContainerTitleView *)self centerYAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v44[7] = v25;
  v26 = [(UIButton *)self->_closeButton trailingAnchor];
  v27 = [(CKAppContainerTitleView *)self trailingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27 constant:-16.0];
  v44[8] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:9];
  [v34 activateConstraints:v29];
}

void __32__CKAppContainerTitleView_setup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(a1 + 32) addSubview:v3];
}

- (UIImage)iconImage
{
  v2 = [(CKAppContainerTitleView *)self iconImageView];
  id v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setIconImage:(id)a3
{
  id v13 = a3;
  v4 = [(CKAppContainerTitleView *)self iconImageView];
  [v4 setImage:v13];

  if (v13)
  {
    [v13 size];
    double v6 = v5;
    [v13 size];
    BOOL v8 = v6 == v7;
    if (v6 == v7) {
      double v9 = 36.0;
    }
    else {
      double v9 = 30.0;
    }
    if (v8) {
      double v10 = 36.0;
    }
    else {
      double v10 = 40.0;
    }
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  v11 = [(CKAppContainerTitleView *)self iconWidthConstraint];
  [v11 setConstant:v10];

  v12 = [(CKAppContainerTitleView *)self iconHeightConstraint];
  [v12 setConstant:v9];
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (NSLayoutConstraint)iconWidthConstraint
{
  return self->_iconWidthConstraint;
}

- (void)setIconWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)iconHeightConstraint
{
  return self->_iconHeightConstraint;
}

- (void)setIconHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconHeightConstraint, 0);
  objc_storeStrong((id *)&self->_iconWidthConstraint, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end