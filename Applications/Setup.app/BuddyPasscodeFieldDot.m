@interface BuddyPasscodeFieldDot
- (BOOL)isFilled;
- (BuddyPasscodeFieldDot)init;
- (CGSize)intrinsicContentSize;
- (void)_updateView;
- (void)setFilled:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BuddyPasscodeFieldDot

- (BuddyPasscodeFieldDot)init
{
  SEL v8 = a2;
  id location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyPasscodeFieldDot;
  id location = -[BuddyPasscodeFieldDot initWithFrame:](&v7, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    id v2 = [location layer];
    [v2 setCornerRadius:10.0];

    id v3 = [location layer];
    [v3 setMasksToBounds:1];

    id v4 = [location layer];
    [v4 setBorderWidth:2.0];

    [location _updateView];
  }
  v5 = (BuddyPasscodeFieldDot *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)setFilled:(BOOL)a3
{
  if (self->_filled != a3)
  {
    self->_filled = a3;
    [(BuddyPasscodeFieldDot *)self _updateView];
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = sub_1000C167C();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)BuddyPasscodeFieldDot;
  [(BuddyPasscodeFieldDot *)&v3 traitCollectionDidChange:location[0]];
  [(BuddyPasscodeFieldDot *)v5 _updateView];
  objc_storeStrong(location, 0);
}

- (void)_updateView
{
  v9 = self;
  v8[1] = (id)a2;
  id v2 = [(BuddyPasscodeFieldDot *)self traitCollection];
  objc_super v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_1000C17F4;
  objc_super v7 = &unk_1002B0D20;
  v8[0] = v9;
  [v2 performAsCurrentTraitCollection:&v3];

  objc_storeStrong(v8, 0);
}

- (BOOL)isFilled
{
  return self->_filled;
}

@end