@interface DMCDevicePINPane
- (DMCDevicePINPane)initWithFrame:(CGRect)a3;
- (NSString)titleText;
- (UIView)descriptionLabel;
- (UIView)passcodeField;
- (id)_textFont;
- (unint64_t)style;
- (void)setStyle:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation DMCDevicePINPane

- (DMCDevicePINPane)initWithFrame:(CGRect)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)DMCDevicePINPane;
  v3 = -[DevicePINPane initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v11[0] = objc_opt_class();
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__DMCDevicePINPane_initWithFrame___block_invoke;
    v7[3] = &unk_2645E8EB0;
    objc_copyWeak(&v8, &location);
    id v5 = (id)[(DMCDevicePINPane *)v3 registerForTraitChanges:v4 withHandler:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __34__DMCDevicePINPane_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained titleText];
  [WeakRetained setTitle:v1];
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  if (a3 == 1)
  {
    id v4 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD40]) setBackgroundColor:v4];
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = (NSString *)[v4 copy];
  titleText = self->_titleText;
  self->_titleText = v5;

  v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD40]);
  id v8 = [(DMCDevicePINPane *)self _textFont];
  [v7 setTitle:v4 font:v8];
}

- (UIView)descriptionLabel
{
  return (UIView *)[(DMCDevicePINPane *)self valueForKeyPath:@"_pinView._titleLabel"];
}

- (UIView)passcodeField
{
  return (UIView *)[(DMCDevicePINPane *)self valueForKeyPath:@"_pinView._passcodeField"];
}

- (id)_textFont
{
  v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D260]];
  v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (unint64_t)style
{
  return self->_style;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end