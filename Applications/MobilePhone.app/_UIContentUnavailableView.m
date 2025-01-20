@interface _UIContentUnavailableView
- (_UIContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4;
@end

@implementation _UIContentUnavailableView

- (_UIContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4
{
  v4 = -[_UIContentUnavailableView initWithFrame:title:style:](self, "initWithFrame:title:style:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4) {
    [(_UIContentUnavailableView *)v4 setVibrantOptions:0];
  }
  return v5;
}

@end