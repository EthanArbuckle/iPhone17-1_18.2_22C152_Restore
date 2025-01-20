@interface AVTSimpleAvatarPickerHeaderView
+ (id)reuseIdentifier;
- (AVTCircularButton)button;
- (AVTSimpleAvatarPickerHeaderView)initWithFrame:(CGRect)a3;
- (NSString)currentSymbolName;
- (UIImageSymbolConfiguration)ellipsisSymbolConfiguration;
- (UIImageSymbolConfiguration)plusSymbolConfiguration;
- (id)buttonPressedBlock;
- (void)buttonPressed:(id)a3;
- (void)setButtonPressedBlock:(id)a3;
- (void)setCurrentSymbolName:(id)a3;
- (void)setEllipsisSymbolConfiguration:(id)a3;
- (void)setPlusSymbolConfiguration:(id)a3;
- (void)setupLayout;
- (void)updateForEditMode:(BOOL)a3 animated:(BOOL)a4;
- (void)updateWithSymbolNamed:(id)a3 configuration:(id)a4 animated:(BOOL)a5;
@end

@implementation AVTSimpleAvatarPickerHeaderView

+ (id)reuseIdentifier
{
  return @"AVTSimpleAvatarPickerHeaderView";
}

- (AVTSimpleAvatarPickerHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)AVTSimpleAvatarPickerHeaderView;
  v7 = -[AVTSimpleAvatarPickerHeaderView initWithFrame:](&v12, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[AVTCircularButton initWithFrame:]([AVTCircularButton alloc], "initWithFrame:", x, y, width, height);
    [(AVTCircularButton *)v8 addTarget:v7 action:sel_buttonPressed_ forControlEvents:64];
    [(AVTCircularButton *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    button = v7->_button;
    v7->_button = v8;
    v10 = v8;

    [(AVTSimpleAvatarPickerHeaderView *)v7 addSubview:v10];
    [(AVTSimpleAvatarPickerHeaderView *)v7 setupLayout];
    [(AVTSimpleAvatarPickerHeaderView *)v7 updateForEditMode:0 animated:0];
  }
  return v7;
}

- (void)setupLayout
{
  v22[4] = *MEMORY[0x263EF8340];
  v14 = (void *)MEMORY[0x263F08938];
  v21 = [(AVTSimpleAvatarPickerHeaderView *)self button];
  v20 = [v21 heightAnchor];
  v19 = [(AVTSimpleAvatarPickerHeaderView *)self heightAnchor];
  v18 = [v20 constraintEqualToAnchor:v19 multiplier:0.64 constant:0.0];
  v22[0] = v18;
  v17 = [(AVTSimpleAvatarPickerHeaderView *)self button];
  v15 = [v17 widthAnchor];
  v16 = [(AVTSimpleAvatarPickerHeaderView *)self button];
  v13 = [v16 heightAnchor];
  v3 = [v15 constraintEqualToAnchor:v13];
  v22[1] = v3;
  v4 = [(AVTSimpleAvatarPickerHeaderView *)self button];
  v5 = [v4 centerXAnchor];
  v6 = [(AVTSimpleAvatarPickerHeaderView *)self centerXAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  v22[2] = v7;
  v8 = [(AVTSimpleAvatarPickerHeaderView *)self button];
  v9 = [v8 centerYAnchor];
  v10 = [(AVTSimpleAvatarPickerHeaderView *)self centerYAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v22[3] = v11;
  objc_super v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  [v14 activateConstraints:v12];
}

- (UIImageSymbolConfiguration)ellipsisSymbolConfiguration
{
  ellipsisSymbolConfiguration = self->_ellipsisSymbolConfiguration;
  if (!ellipsisSymbolConfiguration)
  {
    v4 = [MEMORY[0x263F1C6C8] configurationWithPointSize:5 weight:21.0];
    v5 = self->_ellipsisSymbolConfiguration;
    self->_ellipsisSymbolConfiguration = v4;

    ellipsisSymbolConfiguration = self->_ellipsisSymbolConfiguration;
  }
  return ellipsisSymbolConfiguration;
}

- (UIImageSymbolConfiguration)plusSymbolConfiguration
{
  plusSymbolConfiguration = self->_plusSymbolConfiguration;
  if (!plusSymbolConfiguration)
  {
    v4 = [MEMORY[0x263F1C6C8] configurationWithPointSize:5 weight:18.0];
    v5 = self->_plusSymbolConfiguration;
    self->_plusSymbolConfiguration = v4;

    plusSymbolConfiguration = self->_plusSymbolConfiguration;
  }
  return plusSymbolConfiguration;
}

- (void)updateForEditMode:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = kAVTCircularButtonEllipsisImageName;
  if (!a3) {
    v7 = kAVTCircularButtonPlusImageName;
  }
  v8 = *v7;
  if (a3) {
    [(AVTSimpleAvatarPickerHeaderView *)self ellipsisSymbolConfiguration];
  }
  else {
  id v9 = [(AVTSimpleAvatarPickerHeaderView *)self plusSymbolConfiguration];
  }
  [(AVTSimpleAvatarPickerHeaderView *)self updateWithSymbolNamed:v8 configuration:v9 animated:v4];
}

- (void)updateWithSymbolNamed:(id)a3 configuration:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(AVTSimpleAvatarPickerHeaderView *)self currentSymbolName];
  char v11 = [v10 isEqualToString:v8];

  if ((v11 & 1) == 0)
  {
    [(AVTSimpleAvatarPickerHeaderView *)self setCurrentSymbolName:v8];
    objc_super v12 = [(AVTSimpleAvatarPickerHeaderView *)self button];
    [v12 setSymbolImageWithName:v8 configuration:v9];

    if (v5)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __80__AVTSimpleAvatarPickerHeaderView_updateWithSymbolNamed_configuration_animated___block_invoke;
      v14[3] = &unk_263FF03D8;
      v14[4] = self;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __80__AVTSimpleAvatarPickerHeaderView_updateWithSymbolNamed_configuration_animated___block_invoke_2;
      v13[3] = &unk_263FF04A0;
      v13[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v14 usingSpringWithDamping:v13 initialSpringVelocity:0.15 options:0.0 animations:0.25 completion:0.0];
    }
  }
}

void __80__AVTSimpleAvatarPickerHeaderView_updateWithSymbolNamed_configuration_animated___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) button];
  CGAffineTransformMakeScale(&v2, 1.15, 1.15);
  [v1 setTransform:&v2];
}

uint64_t __80__AVTSimpleAvatarPickerHeaderView_updateWithSymbolNamed_configuration_animated___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __80__AVTSimpleAvatarPickerHeaderView_updateWithSymbolNamed_configuration_animated___block_invoke_3;
  v2[3] = &unk_263FF03D8;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v2 usingSpringWithDamping:0 initialSpringVelocity:1.0 options:0.0 animations:0.25 completion:0.0];
}

void __80__AVTSimpleAvatarPickerHeaderView_updateWithSymbolNamed_configuration_animated___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) button];
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v3[0] = *MEMORY[0x263F000D0];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v1 setTransform:v3];
}

- (void)buttonPressed:(id)a3
{
  BOOL v4 = [(AVTSimpleAvatarPickerHeaderView *)self buttonPressedBlock];

  if (v4)
  {
    BOOL v5 = [(AVTSimpleAvatarPickerHeaderView *)self buttonPressedBlock];
    v5[2]();
  }
}

- (AVTCircularButton)button
{
  return self->_button;
}

- (id)buttonPressedBlock
{
  return self->_buttonPressedBlock;
}

- (void)setButtonPressedBlock:(id)a3
{
}

- (NSString)currentSymbolName
{
  return self->_currentSymbolName;
}

- (void)setCurrentSymbolName:(id)a3
{
}

- (void)setPlusSymbolConfiguration:(id)a3
{
}

- (void)setEllipsisSymbolConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ellipsisSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_plusSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_currentSymbolName, 0);
  objc_storeStrong(&self->_buttonPressedBlock, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end