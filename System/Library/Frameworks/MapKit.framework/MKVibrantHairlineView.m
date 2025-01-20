@interface MKVibrantHairlineView
- (MKVibrantHairlineView)initWithFrame:(CGRect)a3;
@end

@implementation MKVibrantHairlineView

- (MKVibrantHairlineView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKVibrantHairlineView;
  v3 = -[MKVibrantView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:1.0];
    v5 = [(MKVibrantHairlineView *)v3 contentView];
    [v5 setBackgroundColor:v4];

    [(MKVibrantView *)v3 setStyle:7];
  }
  return v3;
}

@end