@interface CPSClipStoreTableViewCell
+ (id)specifierForBundleIdentifier:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CPSClipStoreTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)preferredImageDescriptor;
- (void)createLockupViewWithSpecifier:(id)a3;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation CPSClipStoreTableViewCell

+ (id)specifierForBundleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_14D30 target:0 set:0 get:0 detail:0 cell:3 edit:0];
  if (![v3 length])
  {
    v5 = sub_8C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_CC70(v5);
    }
  }
  objc_msgSend(v4, "cps_setBundleIdentifier:", v3);
  [v4 setProperty:objc_opt_class() forKey:PSCellClassKey];
  objc_msgSend(v4, "cps_isTestFlight");
  v6 = _CPSLocalizedString();
  [v4 setProperty:v6 forKey:PSTitleKey];

  [v4 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

  return v4;
}

- (CPSClipStoreTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CPSClipStoreTableViewCell;
  v5 = [(CPSClipStoreTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(CPSClipStoreTableViewCell *)v5 setSelectionStyle:0];
    v7 = v6;
  }

  return v6;
}

- (id)preferredImageDescriptor
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v2 = (void *)qword_1A208;
  uint64_t v13 = qword_1A208;
  if (!qword_1A208)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_7330;
    v9[3] = &unk_14790;
    v9[4] = &v10;
    sub_7330((uint64_t)v9);
    v2 = (void *)v11[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v10, 8);
  id v4 = [v3 alloc];
  v5 = +[UIScreen mainScreen];
  [v5 scale];
  id v7 = objc_msgSend(v4, "initWithSize:scale:", 62.0, 62.0, v6);

  [v7 setShape:1];

  return v7;
}

- (void)createLockupViewWithSpecifier:(id)a3
{
  id v4 = a3;
  lockupView = self->_lockupView;
  if (lockupView)
  {
    [(ASCLockupView *)lockupView removeFromSuperview];
    double v6 = self->_lockupView;
    self->_lockupView = 0;
  }
  id v7 = objc_msgSend(v4, "cps_bundleIdentifier");
  id v8 = objc_msgSend(v4, "cps_storeItemIdentifier");
  id v9 = [objc_alloc((Class)ASCAdamID) initWithInt64:v8];
  uint64_t v10 = (ASCLockupView *)objc_msgSend(objc_alloc((Class)ASCLockupView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v11 = self->_lockupView;
  self->_lockupView = v10;

  [(ASCLockupView *)self->_lockupView setSize:ASCLockupViewSizeSmall];
  unsigned int v12 = objc_msgSend(v4, "cps_isTestFlight");
  if ((v12 & 1) == 0 && !v8)
  {
    uint64_t v13 = sub_8C68();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_CCB4((uint64_t)v7, v13);
    }
  }
  v14 = self->_lockupView;
  if (v12)
  {
    [(ASCLockupView *)v14 setUserInteractionEnabled:0];
    v15 = [(CPSClipStoreTableViewCell *)self preferredImageDescriptor];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_6FEC;
    v19[3] = &unk_14768;
    v19[4] = self;
    id v20 = v9;
    id v21 = v4;
    +[CPSAppClipRecord getApplicationIconForBundleIdentifier:v7 imageDescriptor:v15 resultHandler:v19];
  }
  else
  {
    [(ASCLockupView *)v14 setUserInteractionEnabled:1];
    id v16 = objc_alloc((Class)ASCLockupRequest);
    id v17 = [v16 initWithID:v9 kind:ASCLockupKindApp context:ASCLockupContextStandard];
    [(ASCLockupView *)self->_lockupView setRequest:v17];
  }
  v18 = [(CPSClipStoreTableViewCell *)self contentView];
  [v18 addSubview:self->_lockupView];
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)CPSClipStoreTableViewCell;
  [(CPSClipStoreTableViewCell *)&v16 layoutSubviews];
  [(CPSClipStoreTableViewCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CPSClipStoreTableViewCell *)self layoutMargins];
  double v12 = v11;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  CGFloat v13 = CGRectGetWidth(v17) - v12;
  [(CPSClipStoreTableViewCell *)self layoutMargins];
  CGFloat v15 = v13 - v14;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  -[ASCLockupView setFrame:](self->_lockupView, "setFrame:", v12, 15.0, v15, CGRectGetHeight(v18) + -30.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  lockupView = self->_lockupView;
  [(CPSClipStoreTableViewCell *)self bounds];
  double Width = CGRectGetWidth(v13);
  [(CPSClipStoreTableViewCell *)self layoutMargins];
  double v7 = Width - v6;
  [(CPSClipStoreTableViewCell *)self layoutMargins];
  -[ASCLockupView sizeThatFits:](lockupView, "sizeThatFits:", v7 - v8, 1.79769313e308);
  double v11 = v10 + 30.0;
  result.height = v11;
  result.width = v9;
  return result;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSClipStoreTableViewCell;
  [(CPSClipStoreTableViewCell *)&v8 refreshCellContentsWithSpecifier:v4];
  double v5 = objc_msgSend(v4, "cps_bundleIdentifier");
  id v6 = [v5 length];

  if (!v6)
  {
    double v7 = sub_8C68();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_CD2C(v7);
    }
  }
  [(CPSClipStoreTableViewCell *)self createLockupViewWithSpecifier:v4];
}

- (void).cxx_destruct
{
}

@end