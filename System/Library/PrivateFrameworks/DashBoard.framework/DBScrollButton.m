@interface DBScrollButton
+ (id)buttonWithDirection:(unint64_t)a3;
- (BOOL)canBecomeFocused;
- (UIImage)scrollImage;
- (void)_updateImage;
- (void)setEnabled:(BOOL)a3;
- (void)setScrollImage:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBScrollButton

+ (id)buttonWithDirection:(unint64_t)a3
{
  v4 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceIdiom:3];
  v5 = +[DBScrollButton buttonWithType:0];
  v6 = @"chevron.forward";
  if (!a3) {
    v6 = @"chevron.backward";
  }
  v7 = (void *)MEMORY[0x263F82818];
  v8 = v6;
  v9 = [v7 configurationWithPointSize:6 weight:15.0];
  v10 = [MEMORY[0x263F827E8] systemImageNamed:v8 compatibleWithTraitCollection:v4];

  v11 = [v10 imageWithConfiguration:v9];

  [v5 setScrollImage:v11];
  return v5;
}

- (void)setScrollImage:(id)a3
{
  objc_storeStrong((id *)&self->_scrollImage, a3);
  [(DBScrollButton *)self _updateImage];
}

- (void)setEnabled:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DBScrollButton;
  -[DBScrollButton setEnabled:](&v6, sel_setEnabled_);
  if (a3) {
    [MEMORY[0x263F825C8] _labelColor];
  }
  else {
  v5 = [MEMORY[0x263F825C8] _carSystemTertiaryColor];
  }
  [(DBScrollButton *)self setTintColor:v5];
}

- (void)_updateImage
{
  v3 = [(DBScrollButton *)self scrollImage];
  v4 = [MEMORY[0x263F825C8] _labelColor];
  v5 = [v3 _flatImageWithColor:v4];
  [(DBScrollButton *)self setImage:v5 forState:0];

  id v8 = [(DBScrollButton *)self scrollImage];
  objc_super v6 = [MEMORY[0x263F825C8] _carSystemTertiaryColor];
  v7 = [v8 _flatImageWithColor:v6];
  [(DBScrollButton *)self setImage:v7 forState:2];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DBScrollButton;
  [(DBScrollButton *)&v4 traitCollectionDidChange:a3];
  [(DBScrollButton *)self _updateImage];
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (UIImage)scrollImage
{
  return self->_scrollImage;
}

- (void).cxx_destruct
{
}

@end