@interface ACUIAppInstallCell
+ (id)specifierForAppWithDescription:(id)a3 target:(id)a4 action:(SEL)a5;
- (ACUIAppInstallCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)_createInstallButton;
- (id)_createLabelForAppName:(id)a3;
- (id)_createLabelForPublisher:(id)a3;
- (int)installState;
- (void)_updateInstallButtonWithState:(int)a3;
- (void)_updateSubviewsWithInstallState:(int)a3;
- (void)layoutSubviews;
- (void)setInstallState:(int)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation ACUIAppInstallCell

+ (id)specifierForAppWithDescription:(id)a3 target:(id)a4 action:(SEL)a5
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  SEL v17 = a5;
  id v16 = (id)[MEMORY[0x1E4F92E70] preferenceSpecifierNamed:&stru_1F39EF5C0 target:v18 set:0 get:a5 detail:0 cell:13 edit:0];
  [v16 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
  id v9 = (id)[location[0] name];
  objc_msgSend(v16, "setProperty:forKey:");

  id v10 = (id)[location[0] publisher];
  objc_msgSend(v16, "setProperty:forKey:");

  id v11 = (id)[location[0] icon];
  objc_msgSend(v16, "setProperty:forKey:");

  [v16 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93130]];
  id v12 = (id)[location[0] bundleID];
  char v14 = 0;
  BOOL v13 = 1;
  if (v12)
  {
    id v15 = (id)[location[0] persistentID];
    char v14 = 1;
    BOOL v13 = v15 == 0;
  }
  if (v14) {

  }
  if (v13) {
    [v16 setProperty:MEMORY[0x1E4F1CC28] forKey:@"ACUIAppIsAvailable"];
  }
  else {
    [v16 setProperty:MEMORY[0x1E4F1CC38] forKey:@"ACUIAppIsAvailable"];
  }
  [v16 setButtonAction:v17];
  id v6 = v16;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (ACUIAppInstallCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v31 = self;
  SEL v30 = a2;
  int64_t v29 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v27 = 0;
  objc_storeStrong(&v27, a5);
  id v5 = v31;
  v31 = 0;
  v26.receiver = v5;
  v26.super_class = (Class)ACUIAppInstallCell;
  v31 = [(PSTableCell *)&v26 initWithStyle:v29 reuseIdentifier:location specifier:v27];
  objc_storeStrong((id *)&v31, v31);
  if (v31)
  {
    id v25 = (id)[v27 propertyForKey:@"ACUIAppInstallIcon"];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v25];
    iconView = v31->_iconView;
    v31->_iconView = (UIImageView *)v6;

    id v17 = (id)[(ACUIAppInstallCell *)v31 contentView];
    [v17 addSubview:v31->_iconView];

    id v24 = (id)[v27 propertyForKey:@"ACUIAppInstallName"];
    v8 = (UILabel *)[(ACUIAppInstallCell *)v31 _createLabelForAppName:v24];
    nameLabel = v31->_nameLabel;
    v31->_nameLabel = v8;

    id v18 = (id)[(ACUIAppInstallCell *)v31 contentView];
    [v18 addSubview:v31->_nameLabel];

    id v23 = (id)[v27 propertyForKey:@"ACUIAppInstallPublisher"];
    id v10 = (UILabel *)[(ACUIAppInstallCell *)v31 _createLabelForPublisher:v23];
    publisherLabel = v31->_publisherLabel;
    v31->_publisherLabel = v10;

    id v19 = (id)[(ACUIAppInstallCell *)v31 contentView];
    [v19 addSubview:v31->_publisherLabel];

    id v20 = (id)[v27 propertyForKey:@"ACUIAppIsAvailable"];
    BOOL v21 = ([v20 BOOLValue] & 1) != 1;

    if (!v21)
    {
      id v12 = (SKUIItemOfferButton *)[(ACUIAppInstallCell *)v31 _createInstallButton];
      installButton = v31->_installButton;
      v31->_installButton = v12;

      id v16 = (id)[(ACUIAppInstallCell *)v31 contentView];
      [v16 addSubview:v31->_installButton];
    }
    [(ACUIAppInstallCell *)v31 setSelectionStyle:0];
    v31->_installState = 0;
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
  }
  id v15 = v31;
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v31, 0);
  return v15;
}

- (void)setInstallState:(int)a3
{
  self->_installState = a3;
  [(ACUIAppInstallCell *)self _updateSubviewsWithInstallState:self->_installState];
}

- (void)layoutSubviews
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)ACUIAppInstallCell;
  [(PSTableCell *)&v2 layoutSubviews];
  [(ACUIAppInstallCell *)v4 _updateSubviewsWithInstallState:v4->_installState];
}

- (id)_createLabelForAppName:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [v6 setOpaque:0];
  [v6 setBackgroundColor:0];
  [v6 setText:location[0]];
  id v4 = (id)[MEMORY[0x1E4F42A30] boldSystemFontOfSize:18.0];
  objc_msgSend(v6, "setFont:");

  [v6 sizeToFit];
  id v5 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)_createLabelForPublisher:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [v6 setOpaque:0];
  [v6 setBackgroundColor:0];
  [v6 setText:location[0]];
  id v4 = (id)[MEMORY[0x1E4F42A30] systemFontOfSize:14.0];
  objc_msgSend(v6, "setFont:");

  [v6 sizeToFit];
  id v5 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)_createInstallButton
{
  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = objc_alloc_init((Class)getSKUIItemOfferButtonClass());
  id v3 = v6[0];
  id v4 = (id)[MEMORY[0x1E4F428B8] clearColor];
  objc_msgSend(v3, "setBackgroundColor:");

  id v5 = v6[0];
  objc_storeStrong(v6, 0);
  return v5;
}

- (void)_updateSubviewsWithInstallState:(int)a3
{
  [(ACUIAppInstallCell *)self _updateInstallButtonWithState:a3];
  char v31 = ([(ACUIAppInstallCell *)self _shouldReverseLayoutDirection] ^ 1) & 1;
  id v19 = (id)[(ACUIAppInstallCell *)self contentView];
  [v19 bounds];
  double v28 = v3;
  double v29 = v4;
  double v30 = v5;

  [(UIImageView *)self->_iconView frame];
  v26.width = v6;
  v26.height = v7;
  if (v31) {
    double v18 = 12.0;
  }
  else {
    double v18 = v29 - v6 - 12.0;
  }
  double v27 = v28 + floor((v30 - v7) / 2.0);
  -[UIImageView setFrame:](self->_iconView, "setFrame:", v18, v27, v6, v7);
  [(UILabel *)self->_nameLabel frame];
  double v24 = v8;
  double v25 = v9;
  if (v31)
  {
    double v17 = v18 + v26.width + 8.0;
  }
  else
  {
    v33.origin.x = v18;
    v33.origin.y = v27;
    v33.size = v26;
    double v17 = CGRectGetMinX(v33) - 8.0 - v24;
  }
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", v17, 22.0, v24, v25);
  [(UILabel *)self->_publisherLabel frame];
  double v22 = v10;
  double v23 = v11;
  if (v31)
  {
    double v16 = v18 + v26.width + 8.0;
  }
  else
  {
    v34.origin.x = v18;
    v34.origin.y = v27;
    v34.size = v26;
    double v16 = CGRectGetMinX(v34) - v22 - 8.0;
  }
  -[UILabel setFrame:](self->_publisherLabel, "setFrame:", v16, 44.0, v22, v23);
  [(SKUIItemOfferButton *)self->_installButton frame];
  double v21 = v28 + floor((v30 - v13) / 2.0);
  if (v31) {
    double v15 = v29 - v12 - 12.0;
  }
  else {
    double v15 = 12.0;
  }
  double v20 = v15;
  if (v12 <= 50.0) {
    double v14 = 50.0;
  }
  else {
    double v14 = v12;
  }
  if (v31) {
    double v20 = v15 - (v14 - v12);
  }
  -[SKUIItemOfferButton setFrame:](self->_installButton, "setFrame:", v20, v21, v14, v13);
}

- (void)_updateInstallButtonWithState:(int)a3
{
  double v23 = self;
  SEL v22 = a2;
  int v21 = a3;
  id v20 = 0;
  if (a3 == 2)
  {
    id v19 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v3 = (id)[v19 localizedStringForKey:@"INSTALLED" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v4 = v20;
    id v20 = v3;
  }
  else if (v21 == 1)
  {
    id v18 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = (id)[v18 localizedStringForKey:@"INSTALLNOW" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v6 = v20;
    id v20 = v5;
  }
  else
  {
    id v17 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v7 = (id)[v17 localizedStringForKey:@"UNAVAILABLE" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v8 = v20;
    id v20 = v7;
  }
  if (v21 == 1)
  {
    installButton = v23->_installButton;
    double v12 = (int *)MEMORY[0x1E4F92F78];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&v23->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x1E4F92F78]));
    id v15 = (id)[WeakRetained target];
    id v14 = objc_loadWeakRetained((id *)((char *)&v23->super.super.super.super.super.isa + *v12));
    -[SKUIItemOfferButton addTarget:action:forControlEvents:](installButton, "addTarget:action:forControlEvents:", v15, [v14 buttonAction], 64);

    [(SKUIItemOfferButton *)v23->_installButton setEnabled:1];
  }
  else
  {
    [(SKUIItemOfferButton *)v23->_installButton setEnabled:0];
    double v10 = v23->_installButton;
    id v11 = (id)[MEMORY[0x1E4F428B8] colorWithWhite:0.68627451 alpha:1.0];
    -[SKUIItemOfferButton setTintColor:](v10, "setTintColor:");
  }
  if (v21 == 3) {
    [(SKUIItemOfferButton *)v23->_installButton setAlpha:0.0];
  }
  else {
    [(SKUIItemOfferButton *)v23->_installButton setAlpha:1.0];
  }
  -[SKUIItemOfferButton setTitle:](v23->_installButton, "setTitle:", v20, 0x1EAB9F000uLL);
  [*(id *)((char *)&v23->super.super.super.super.super.isa + *(int *)(v9 + 2508)) sizeToFit];
  objc_storeStrong(&v20, 0);
}

- (int)installState
{
  return self->_installState;
}

- (void).cxx_destruct
{
}

@end