@interface ZWMenuItemSimpleButtonTableViewCell
- (ZWMenuItemSimpleButtonTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_applyTitleLabelColor;
@end

@implementation ZWMenuItemSimpleButtonTableViewCell

- (ZWMenuItemSimpleButtonTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ZWMenuItemSimpleButtonTableViewCell;
  v4 = [(ZWMenuItemSimpleButtonTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(ZWMenuItemSimpleButtonTableViewCell *)v4 textLabel];
    [(ZWMenuItemSimpleButtonTableViewCell *)v5 _applyTitleLabelColor];
    [v6 setTextAlignment:1];
    [v6 setLineBreakMode:4];
    [v6 setNumberOfLines:1];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v5 selector:"_applyTitleLabelColor" name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];
  }
  return v5;
}

- (void)_applyTitleLabelColor
{
  id v4 = +[UIColor whiteColor];
  v3 = [(ZWMenuItemSimpleButtonTableViewCell *)self textLabel];
  [v3 setTextColor:v4];
}

@end