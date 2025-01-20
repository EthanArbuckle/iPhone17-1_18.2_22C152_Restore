@interface BYODCardView
- (BYODCardView)initWithFrame:(CGRect)a3;
- (UIColor)bgColour;
- (void)setBgColour:(id)a3;
@end

@implementation BYODCardView

- (BYODCardView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BYODCardView;
  return -[BYODCardView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIColor)bgColour
{
  return self->_bgColour;
}

- (void)setBgColour:(id)a3
{
}

- (void).cxx_destruct
{
}

@end