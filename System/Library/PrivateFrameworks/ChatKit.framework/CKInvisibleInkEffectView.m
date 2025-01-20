@interface CKInvisibleInkEffectView
+ (double)updateInterval;
+ (void)initialize;
- (BOOL)isPaused;
- (BOOL)isSuspended;
- (CKInvisibleInkEffectCoverageTracker)coverageTracker;
- (CKInvisibleInkEffectView)initWithFrame:(CGRect)a3;
- (CKInvisibleInkEffectViewDelegate)delegate;
- (UIImage)image;
- (void)invisibleInkEffectCoverageTrackerDidUncover:(id)a3;
- (void)layoutSubviews;
- (void)reset;
- (void)setCoverageTracker:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setSuspended:(BOOL)a3;
@end

@implementation CKInvisibleInkEffectView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v4 = [v2 objectForKey:@"DebugInvisibleInkUpdateInterval"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 doubleValue];
    }
    else {
      uint64_t v3 = 0x3FA0842108421084;
    }
    updateInterval = v3;
  }
}

+ (double)updateInterval
{
  return *(double *)&updateInterval;
}

- (CKInvisibleInkEffectView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKInvisibleInkEffectView;
  uint64_t v3 = -[CKInvisibleInkEffectView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [CKInvisibleInkEffectCoverageTracker alloc];
    [(CKInvisibleInkEffectView *)v3 bounds];
    v7 = -[CKInvisibleInkEffectCoverageTracker initWithSize:touchLifetime:](v4, "initWithSize:touchLifetime:", v5, v6, 3.0);
    [(CKInvisibleInkEffectView *)v3 setCoverageTracker:v7];

    v8 = [(CKInvisibleInkEffectView *)v3 coverageTracker];
    [v8 setDelegate:v3];
  }
  return v3;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)CKInvisibleInkEffectView;
  [(CKInvisibleInkEffectView *)&v6 layoutSubviews];
  uint64_t v3 = [(CKInvisibleInkEffectView *)self coverageTracker];
  [(CKInvisibleInkEffectView *)self bounds];
  objc_msgSend(v3, "setSize:", v4, v5);
}

- (void)reset
{
  id v2 = [(CKInvisibleInkEffectView *)self coverageTracker];
  [v2 reset];
}

- (void)invisibleInkEffectCoverageTrackerDidUncover:(id)a3
{
  double v4 = [(CKInvisibleInkEffectView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKInvisibleInkEffectView *)self delegate];
    [v6 invisibleInkEffectViewWasUncovered:self];
  }
}

- (CKInvisibleInkEffectViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKInvisibleInkEffectViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (CKInvisibleInkEffectCoverageTracker)coverageTracker
{
  return self->_coverageTracker;
}

- (void)setCoverageTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverageTracker, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end