@interface UINavigationBar
- (id)_largeTitleColorForTintColor:(id)a3;
- (void)_updateLargeTitleTextAttributes;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)tintColorDidChange;
@end

@implementation UINavigationBar

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UINavigationBar;
  [(UINavigationBar *)&v3 tintColorDidChange];
  [(UINavigationBar *)self _updateLargeTitleTextAttributes];
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UINavigationBar;
  [(UINavigationBar *)&v6 effectiveAppearanceDidChange:a3];
  if ((_UIBarsApplyChromelessEverywhere() & 1) == 0)
  {
    id v4 = objc_alloc_init((Class)UINavigationBarAppearance);
    [v4 configureWithDefaultBackground];
    v5 = +[UIBlurEffect effectWithStyle:4];
    [v4 setBackgroundEffect:v5];

    [(UINavigationBar *)self setStandardAppearance:v4];
  }
  [(UINavigationBar *)self _updateLargeTitleTextAttributes];
}

- (void)_updateLargeTitleTextAttributes
{
  objc_super v3 = [(UINavigationBar *)self tintColor];
  id v4 = [(UINavigationBar *)self _largeTitleColorForTintColor:v3];

  if (v4)
  {
    NSAttributedStringKey v10 = NSForegroundColorAttributeName;
    v11 = v4;
    v5 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    objc_super v6 = [(UINavigationBar *)self standardAppearance];
    [v6 setLargeTitleTextAttributes:v5];

    v7 = [(UINavigationBar *)self scrollEdgeAppearance];
    [v7 setLargeTitleTextAttributes:v5];
  }
  else
  {
    v8 = [(UINavigationBar *)self standardAppearance];
    [v8 setLargeTitleTextAttributes:&__NSDictionary0__struct];

    v9 = [(UINavigationBar *)self scrollEdgeAppearance];
    [v9 setLargeTitleTextAttributes:&__NSDictionary0__struct];
  }
}

- (id)_largeTitleColorForTintColor:(id)a3
{
  id v3 = a3;
  id v4 = +[UIColor linkColor];
  if ([v3 isEqual:v4])
  {
    v5 = 0;
  }
  else
  {
    objc_super v6 = +[UIColor systemBlueColor];
    if ([v3 isEqual:v6])
    {
      v5 = 0;
    }
    else
    {
      v7 = +[UIColor systemDarkBlueColor];
      if ([v3 isEqual:v7]) {
        v5 = 0;
      }
      else {
        v5 = v3;
      }
    }
  }

  id v8 = v5;
  return v8;
}

@end