@interface CBWiFiTableViewCell
- (BOOL)networkStateChanged;
- (BOOL)showLockIcon;
- (CBWiFiTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)rssiBarImages;
- (UIImageView)lockView;
- (UIImageView)rssiBarsView;
- (UIStackView)accessoryIcons;
- (UIView)hiddenLockView;
- (double)networkScaledRSSIStrength;
- (void)dealloc;
- (void)hideRSSIStrength:(BOOL)a3;
- (void)layoutSubviews;
- (void)setAccessoryIcons:(id)a3;
- (void)setHiddenLockView:(id)a3;
- (void)setLockView:(id)a3;
- (void)setNetworkScaledRSSIStrength:(double)a3;
- (void)setNetworkStateChanged:(BOOL)a3;
- (void)setRssiBarImages:(id)a3;
- (void)setRssiBarsView:(id)a3;
- (void)setShowLockIcon:(BOOL)a3;
- (void)showPasswordLock:(BOOL)a3;
@end

@implementation CBWiFiTableViewCell

- (CBWiFiTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v27.receiver = self;
  v27.super_class = (Class)CBWiFiTableViewCell;
  v4 = [(CBWiFiTableViewCell *)&v27 initWithStyle:1 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v4->_networkStateChanged = 1;
    v6 = [objc_alloc((Class)UIStackView) initWithFrame:0.0, 0.0, 42.0, 24.0];
    accessoryIcons = v5->_accessoryIcons;
    v5->_accessoryIcons = v6;

    [(UIStackView *)v5->_accessoryIcons setAlignment:3];
    [(UIStackView *)v5->_accessoryIcons setDistribution:0];
    [(UIStackView *)v5->_accessoryIcons setSpacing:8.0];
    v5->_showLockIcon = 0;
    id v8 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v12 = [v8 initWithFrame:CGRectZero.origin.x, y, width, height];
    lockView = v5->_lockView;
    v5->_lockView = v12;

    v14 = +[UIImage imageNamed:@"Lock"];
    [(UIImageView *)v5->_lockView setImage:v14];

    [(UIImageView *)v5->_lockView setContentMode:6];
    v15 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 8.0, 11.0];
    hiddenLockView = v5->_hiddenLockView;
    v5->_hiddenLockView = v15;

    v17 = +[UIImage imageNamed:@"WiFiBars0"];
    v18 = +[UIImage imageNamed:@"WiFiBars1"];
    v19 = +[UIImage imageNamed:@"WiFiBars2"];
    v20 = +[UIImage imageNamed:@"WiFiBars3"];
    uint64_t v21 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v17, v18, v19, v20, 0);
    rssiBarImages = v5->_rssiBarImages;
    v5->_rssiBarImages = (NSArray *)v21;

    v23 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
    rssiBarsView = v5->_rssiBarsView;
    v5->_rssiBarsView = v23;

    [(UIImageView *)v5->_rssiBarsView setContentMode:6];
    id v25 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 42.0, 24.0];
    [v25 addSubview:v5->_accessoryIcons];
    [(CBWiFiTableViewCell *)v5 setAccessoryView:v25];
  }
  return v5;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)CBWiFiTableViewCell;
  [(CBWiFiTableViewCell *)&v19 layoutSubviews];
  if ([(CBWiFiTableViewCell *)self networkStateChanged])
  {
    [(CBWiFiTableViewCell *)self setNetworkStateChanged:0];
    v3 = [(CBWiFiTableViewCell *)self rssiBarsView];
    unsigned __int8 v4 = [v3 isHidden];

    if ((v4 & 1) == 0)
    {
      [(CBWiFiTableViewCell *)self networkScaledRSSIStrength];
      int v5 = WFSignalBarsFromScaledRSSI();
      v6 = [(CBWiFiTableViewCell *)self rssiBarImages];
      v7 = [v6 objectAtIndexedSubscript:v5];
      id v8 = [(CBWiFiTableViewCell *)self rssiBarsView];
      [v8 setImage:v7];

      v9 = [(CBWiFiTableViewCell *)self rssiBarsView];
      [v9 sizeToFit];
    }
    v10 = [(CBWiFiTableViewCell *)self rssiBarsView];
    [v10 removeFromSuperview];

    if ([(CBWiFiTableViewCell *)self showLockIcon])
    {
      v11 = [(CBWiFiTableViewCell *)self hiddenLockView];
      [v11 removeFromSuperview];

      v12 = [(CBWiFiTableViewCell *)self accessoryIcons];
      v13 = [(CBWiFiTableViewCell *)self lockView];
      [v12 addArrangedSubview:v13];

      v14 = [(CBWiFiTableViewCell *)self lockView];
      [v14 sizeToFit];
    }
    else
    {
      v15 = [(CBWiFiTableViewCell *)self lockView];
      [v15 removeFromSuperview];

      v14 = [(CBWiFiTableViewCell *)self accessoryIcons];
      v16 = [(CBWiFiTableViewCell *)self hiddenLockView];
      [v14 addArrangedSubview:v16];
    }
    v17 = [(CBWiFiTableViewCell *)self accessoryIcons];
    v18 = [(CBWiFiTableViewCell *)self rssiBarsView];
    [v17 addArrangedSubview:v18];
  }
}

- (void)dealloc
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dealloc was called by table view cell", buf, 2u);
  }

  [(UIImageView *)self->_lockView removeFromSuperview];
  [(UIImageView *)self->_rssiBarsView removeFromSuperview];
  v4.receiver = self;
  v4.super_class = (Class)CBWiFiTableViewCell;
  [(CBWiFiTableViewCell *)&v4 dealloc];
}

- (void)showPasswordLock:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CBWiFiTableViewCell *)self showLockIcon] != a3)
  {
    [(CBWiFiTableViewCell *)self setShowLockIcon:v3];
    [(CBWiFiTableViewCell *)self setNetworkStateChanged:1];
  }
}

- (void)hideRSSIStrength:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CBWiFiTableViewCell *)self rssiBarsView];
  unsigned int v6 = [v5 isHidden];

  if (v6 != v3)
  {
    v7 = [(CBWiFiTableViewCell *)self rssiBarsView];
    [v7 setHidden:v3];

    [(CBWiFiTableViewCell *)self setNetworkStateChanged:1];
  }
}

- (double)networkScaledRSSIStrength
{
  return self->_networkScaledRSSIStrength;
}

- (void)setNetworkScaledRSSIStrength:(double)a3
{
  self->_networkScaledRSSIStrength = a3;
}

- (BOOL)showLockIcon
{
  return self->_showLockIcon;
}

- (void)setShowLockIcon:(BOOL)a3
{
  self->_showLockIcon = a3;
}

- (UIImageView)lockView
{
  return self->_lockView;
}

- (void)setLockView:(id)a3
{
}

- (UIImageView)rssiBarsView
{
  return self->_rssiBarsView;
}

- (void)setRssiBarsView:(id)a3
{
}

- (UIStackView)accessoryIcons
{
  return self->_accessoryIcons;
}

- (void)setAccessoryIcons:(id)a3
{
}

- (UIView)hiddenLockView
{
  return self->_hiddenLockView;
}

- (void)setHiddenLockView:(id)a3
{
}

- (NSArray)rssiBarImages
{
  return self->_rssiBarImages;
}

- (void)setRssiBarImages:(id)a3
{
}

- (BOOL)networkStateChanged
{
  return self->_networkStateChanged;
}

- (void)setNetworkStateChanged:(BOOL)a3
{
  self->_networkStateChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rssiBarImages, 0);
  objc_storeStrong((id *)&self->_hiddenLockView, 0);
  objc_storeStrong((id *)&self->_accessoryIcons, 0);
  objc_storeStrong((id *)&self->_rssiBarsView, 0);

  objc_storeStrong((id *)&self->_lockView, 0);
}

@end