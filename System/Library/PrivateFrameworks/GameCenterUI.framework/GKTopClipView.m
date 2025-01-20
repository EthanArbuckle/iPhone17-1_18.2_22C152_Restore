@interface GKTopClipView
- (GKTopClipView)initWithFrame:(CGRect)a3;
@end

@implementation GKTopClipView

- (GKTopClipView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKTopClipView;
  v3 = -[GKTopClipView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F639B0] sharedPalette];
    v5 = [v4 windowBackgroundColor];
    [(GKTopClipView *)v3 setBackgroundColor:v5];
  }
  return v3;
}

@end