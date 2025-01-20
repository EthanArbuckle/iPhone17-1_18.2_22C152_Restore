@interface HUClipScrubberSelectionView
+ (id)selectionView;
- (HUClipScrubberSelectionView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)updateFrameToMatchView:(id)a3;
@end

@implementation HUClipScrubberSelectionView

- (HUClipScrubberSelectionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUClipScrubberSelectionView;
  v3 = -[HUClipScrubberSelectionView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HUClipScrubberSelectionView *)v3 setOpaque:0];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 8.0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 setUsesEvenOddFillRule:1];
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRect v12 = CGRectInset(v11, 5.0, 4.0);
  v7 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height, 8.0);
  [v9 appendPath:v7];
  v8 = [MEMORY[0x1E4F428B8] systemYellowColor];
  [v8 setFill];

  [v9 fill];
}

- (void)updateFrameToMatchView:(id)a3
{
  id v8 = a3;
  [v8 frame];
  CGRect v11 = CGRectInset(v10, -4.0, 4.0);
  -[HUClipScrubberSelectionView setFrame:](self, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
  [v8 center];
  -[HUClipScrubberSelectionView setCenter:](self, "setCenter:");
  v4 = [(HUClipScrubberSelectionView *)self superview];
  v5 = [v8 superview];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    v7 = [v8 superview];
    [v7 insertSubview:self below:v8];
  }
  [(HUClipScrubberSelectionView *)self setNeedsDisplay];
}

+ (id)selectionView
{
  v2 = [HUClipScrubberSelectionView alloc];
  v3 = -[HUClipScrubberSelectionView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v3;
}

@end