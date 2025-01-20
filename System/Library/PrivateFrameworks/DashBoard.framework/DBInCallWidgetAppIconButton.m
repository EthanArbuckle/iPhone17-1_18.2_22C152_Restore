@interface DBInCallWidgetAppIconButton
- (DBInCallWidgetAppIconButton)initWithFrame:(CGRect)a3;
- (NSString)applicationBundleIdentifier;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBInCallWidgetAppIconButton

- (DBInCallWidgetAppIconButton)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DBInCallWidgetAppIconButton;
  v3 = -[DBInCallWidgetAppIconButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[DBInCallWidgetAppIconButton setImageEdgeInsets:](v3, "setImageEdgeInsets:", 4.0, 4.0, 4.0, 4.0);
    id v5 = [MEMORY[0x263F825C8] _carSystemFocusColor];
    uint64_t v6 = [v5 CGColor];
    v7 = [(DBInCallWidgetAppIconButton *)v4 layer];
    [v7 setBorderColor:v6];

    v8 = [(DBInCallWidgetAppIconButton *)v4 layer];
    [v8 setCornerRadius:12.0];
  }
  return v4;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  v4 = (NSString *)[a3 copy];
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  self->_applicationBundleIdentifier = v4;

  if (self->_applicationBundleIdentifier)
  {
    uint64_t v6 = [MEMORY[0x263F4B558] imageDescriptorNamed:*MEMORY[0x263F4B570]];
    [v6 size];
    double v8 = v7;
    double v10 = v9;
    v11 = [(DBInCallWidgetAppIconButton *)self traitCollection];
    [v11 displayScale];
    double v13 = v12;

    DBIconImageForBundleIdentifierWithInfoAndBorder(self->_applicationBundleIdentifier, 0, v8, v10, v13, 13.5);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = 0;
  }
  [(DBInCallWidgetAppIconButton *)self setImage:v14 forState:0];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = [a3 nextFocusedItem];

  if (v5 == self) {
    double v6 = 2.0;
  }
  else {
    double v6 = 0.0;
  }
  id v7 = [(DBInCallWidgetAppIconButton *)self layer];
  [v7 setBorderWidth:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DBInCallWidgetAppIconButton;
  [(DBInCallWidgetAppIconButton *)&v7 traitCollectionDidChange:a3];
  id v4 = [MEMORY[0x263F825C8] _carSystemFocusColor];
  uint64_t v5 = [v4 CGColor];
  double v6 = [(DBInCallWidgetAppIconButton *)self layer];
  [v6 setBorderColor:v5];
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void).cxx_destruct
{
}

@end