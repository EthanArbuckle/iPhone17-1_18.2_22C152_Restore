@interface FMBlurView
- (BOOL)autosizesToFitSuperview;
- (FMBlurView)init;
- (FMBlurView)initWithFrame:(CGRect)a3;
- (FMBlurView)initWithFrame:(CGRect)a3 autosizesToFitSuperview:(BOOL)a4;
- (void)didMoveToSuperview;
- (void)setAutosizesToFitSuperview:(BOOL)a3;
@end

@implementation FMBlurView

- (FMBlurView)initWithFrame:(CGRect)a3 autosizesToFitSuperview:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)FMBlurView;
  v5 = -[FMBlurView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(FMBlurView *)v5 setAutosizesToFitSuperview:v4];
    v7 = [MEMORY[0x263F1C550] colorWithWhite:0.9686 alpha:0.96];
    [(FMBlurView *)v6 setBackgroundColor:v7];

    if ([(FMBlurView *)v6 autosizesToFitSuperview]) {
      [(FMBlurView *)v6 setAutoresizingMask:18];
    }
  }
  return v6;
}

- (FMBlurView)init
{
  return -[FMBlurView initWithFrame:autosizesToFitSuperview:](self, "initWithFrame:autosizesToFitSuperview:", 1, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (FMBlurView)initWithFrame:(CGRect)a3
{
  return -[FMBlurView initWithFrame:autosizesToFitSuperview:](self, "initWithFrame:autosizesToFitSuperview:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)didMoveToSuperview
{
  if ([(FMBlurView *)self autosizesToFitSuperview])
  {
    v3 = [(FMBlurView *)self superview];
    [v3 frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    v14.origin.x = v5;
    v14.origin.y = v7;
    v14.size.width = v9;
    v14.size.height = v11;
    double Width = CGRectGetWidth(v14);
    v15.origin.x = v5;
    v15.origin.y = v7;
    v15.size.width = v9;
    v15.size.height = v11;
    -[FMBlurView setFrame:](self, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v15));
  }
  [(FMBlurView *)self setNeedsLayout];
}

- (BOOL)autosizesToFitSuperview
{
  return self->_autosizesToFitSuperview;
}

- (void)setAutosizesToFitSuperview:(BOOL)a3
{
  self->_autosizesToFitSuperview = a3;
}

@end