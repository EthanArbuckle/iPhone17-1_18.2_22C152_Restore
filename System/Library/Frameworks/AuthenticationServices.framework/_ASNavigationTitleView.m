@interface _ASNavigationTitleView
- (_ASNavigationTitleView)initWithFrame:(CGRect)a3;
@end

@implementation _ASNavigationTitleView

- (_ASNavigationTitleView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_ASNavigationTitleView;
  v3 = -[_UINavigationBarTitleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[ASViewServiceInterfaceUtilities navigationBarHeight];
    -[_UINavigationBarTitleView setHeight:](v3, "setHeight:");
    [(_UINavigationBarTitleView *)v3 setPreferredContentAlignment:2];
    v4 = v3;
  }

  return v3;
}

@end