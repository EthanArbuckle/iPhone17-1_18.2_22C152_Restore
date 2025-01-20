@interface DBStatusBarScreenResizeButton
- (DBStatusBarScreenResizeButton)initWithFrame:(CGRect)a3;
- (unint64_t)transitionControlType;
- (void)_updateBackgroundColor;
- (void)_updateImage;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setTransitionControlType:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBStatusBarScreenResizeButton

- (DBStatusBarScreenResizeButton)initWithFrame:(CGRect)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)DBStatusBarScreenResizeButton;
  v3 = -[DBStatusBarScreenResizeButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(DBStatusBarScreenResizeButton *)v3 layer];
    [v5 setCornerCurve:*MEMORY[0x263F15A20]];

    v6 = [(DBStatusBarScreenResizeButton *)v4 layer];
    [v6 setCornerRadius:9.0];

    v7 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    v8 = [v7 localizedStringForKey:@"RESIZE" value:&stru_26E13A820 table:@"CarPlayApp"];
    v12[0] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    [(DBStatusBarScreenResizeButton *)v4 setAccessibilityUserInputLabels:v9];

    [(DBStatusBarScreenResizeButton *)v4 _updateBackgroundColor];
  }
  return v4;
}

- (void)setTransitionControlType:(unint64_t)a3
{
  if (self->_transitionControlType != a3)
  {
    self->_transitionControlType = a3;
    [(DBStatusBarScreenResizeButton *)self _updateImage];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DBStatusBarScreenResizeButton;
  [(DBStatusBarScreenResizeButton *)&v4 traitCollectionDidChange:a3];
  [(DBStatusBarScreenResizeButton *)self _updateBackgroundColor];
  [(DBStatusBarScreenResizeButton *)self _updateImage];
}

- (void)_updateBackgroundColor
{
  if ([(DBStatusBarScreenResizeButton *)self isFocused]) {
    [MEMORY[0x263F825C8] _carSystemFocusColor];
  }
  else {
  id v3 = [MEMORY[0x263F825C8] _carSystemQuaternaryColor];
  }
  [(DBStatusBarScreenResizeButton *)self setBackgroundColor:v3];
}

- (void)_updateImage
{
  unint64_t v3 = [(DBStatusBarScreenResizeButton *)self transitionControlType];
  objc_super v4 = @"arrow.down.right.and.arrow.up.left";
  if (v3 != 2) {
    objc_super v4 = 0;
  }
  if (v3 == 1) {
    v5 = @"arrow.up.left.and.arrow.down.right";
  }
  else {
    v5 = v4;
  }
  id v11 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F83588] scale:-1];
  v6 = (void *)MEMORY[0x263F827E8];
  v7 = [(DBStatusBarScreenResizeButton *)self traitCollection];
  v8 = [v6 systemImageNamed:v5 compatibleWithTraitCollection:v7];

  v9 = [v8 imageWithConfiguration:v11];

  [(DBStatusBarScreenResizeButton *)self setImage:v9 forState:0];
  if ([(DBStatusBarScreenResizeButton *)self isFocused]) {
    [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
  }
  else {
  v10 = [MEMORY[0x263F825C8] _labelColor];
  }
  [(DBStatusBarScreenResizeButton *)self setTintColor:v10];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DBStatusBarScreenResizeButton;
  [(DBStatusBarScreenResizeButton *)&v5 didUpdateFocusInContext:a3 withAnimationCoordinator:a4];
  [(DBStatusBarScreenResizeButton *)self _updateBackgroundColor];
  [(DBStatusBarScreenResizeButton *)self _updateImage];
}

- (unint64_t)transitionControlType
{
  return self->_transitionControlType;
}

@end