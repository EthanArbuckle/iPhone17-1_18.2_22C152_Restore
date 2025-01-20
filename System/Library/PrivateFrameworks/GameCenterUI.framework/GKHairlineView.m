@interface GKHairlineView
+ (id)hairlineViewForAlignment:(int64_t)a3;
- (CGSize)intrinsicContentSize;
- (GKHairlineView)init;
- (int64_t)alignment;
- (void)setAlignment:(int64_t)a3;
- (void)sizeToFit;
@end

@implementation GKHairlineView

+ (id)hairlineViewForAlignment:(int64_t)a3
{
  v4 = objc_alloc_init(GKHairlineView);
  [(GKHairlineView *)v4 setAlignment:a3];

  return v4;
}

- (GKHairlineView)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKHairlineView;
  v2 = [(GKHairlineView *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F639B0] sharedPalette];
    v4 = [v3 separatorLineColor];
    [(GKHairlineView *)v2 setBackgroundColor:v4];

    [(GKHairlineView *)v2 setAutoresizingMask:2];
    v2->_alignment = 0;
  }
  return v2;
}

- (CGSize)intrinsicContentSize
{
  if (self->_alignment)
  {
    v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v2 scale];
    double v3 = *MEMORY[0x1E4FB30D8];
    double v5 = 1.0 / v4;
  }
  else
  {
    double v5 = *MEMORY[0x1E4FB30D8];
    v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v2 scale];
    double v3 = 1.0 / v6;
  }

  double v7 = v5;
  double v8 = v3;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)sizeToFit
{
  id v13 = [(GKHairlineView *)self superview];
  [(GKHairlineView *)self frame];
  if (v13)
  {
    double v4 = v3;
    int64_t alignment = self->_alignment;
    [v13 bounds];
    double v6 = CGRectGetWidth(v15) + -18.0;
    double v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
    double v9 = 1.0 / v8;

    if (alignment) {
      double v10 = v6;
    }
    else {
      double v10 = v9;
    }
    if (alignment) {
      double v6 = v9;
    }
    [v13 bounds];
    -[GKHairlineView setFrame:](self, "setFrame:", round(v12 + (v11 - v6) * 0.5), v4, v6, v10);
  }
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_int64_t alignment = a3;
}

@end