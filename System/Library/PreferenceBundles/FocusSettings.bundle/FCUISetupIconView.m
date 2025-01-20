@interface FCUISetupIconView
- (void)layoutSubviews;
- (void)setBackgroundColorForModeColorName:(id)a3;
@end

@implementation FCUISetupIconView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)FCUISetupIconView;
  [(FCUISetupIconView *)&v3 layoutSubviews];
  [(FCUISetupIconView *)self frame];
  [(FCUISetupIconView *)self _setCornerRadius:CGRectGetHeight(v4) * 0.5];
  [(FCUISetupIconView *)self setClipsToBounds:1];
}

- (void)setBackgroundColorForModeColorName:(id)a3
{
  aSelectorName = (NSString *)a3;
  if ([(NSString *)aSelectorName length])
  {
    SEL v4 = NSSelectorFromString(aSelectorName);
    if (objc_opt_respondsToSelector())
    {
      id v5 = +[UIColor performSelector:v4];
    }
    else
    {
      id v5 = +[UIColor systemDarkGrayColor];
    }
    v6 = v5;
    [(FCUISetupIconView *)self setBackgroundColor:v5];
  }

  _objc_release_x1();
}

@end