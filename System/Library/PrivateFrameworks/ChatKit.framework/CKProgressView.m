@interface CKProgressView
- (CKProgressView)initWithProgressViewStyle:(int64_t)a3;
- (UIView)__ck_progressView;
- (UIView)__ck_trackView;
- (void)_createInternalProgressBar;
- (void)_createInternalTrackView;
- (void)layoutSubviews;
- (void)setTintColor:(id)a3;
- (void)setTrackTintColor:(id)a3;
- (void)set__ck_progressView:(id)a3;
- (void)set__ck_trackView:(id)a3;
@end

@implementation CKProgressView

- (CKProgressView)initWithProgressViewStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKProgressView;
  v3 = [(CKProgressView *)&v6 initWithProgressViewStyle:a3];
  [(CKProgressView *)v3 setProgress:0.0];
  v4 = [(CKProgressView *)v3 subviews];
  [v4 setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"hidden"];

  [(CKProgressView *)v3 _createInternalTrackView];
  [(CKProgressView *)v3 _createInternalProgressBar];
  return v3;
}

- (void)_createInternalTrackView
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  v3 = [MEMORY[0x1E4F428B8] systemGrayColor];
  [v5 setBackgroundColor:v3];

  [(CKProgressView *)self set__ck_trackView:v5];
  v4 = [(CKProgressView *)self __ck_trackView];
  [(CKProgressView *)self addSubview:v4];
}

- (void)_createInternalProgressBar
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 theme];
  id v5 = [v4 appTintColor];
  [v7 setBackgroundColor:v5];

  [(CKProgressView *)self set__ck_progressView:v7];
  objc_super v6 = [(CKProgressView *)self __ck_progressView];
  [(CKProgressView *)self addSubview:v6];
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)CKProgressView;
  [(CKProgressView *)&v16 layoutSubviews];
  double v3 = *(float *)&__ck_progressViewHeight;
  [(CKProgressView *)self bounds];
  double v4 = CGRectGetHeight(v17) - v3;
  [(CKProgressView *)self progress];
  double v6 = v5;
  [(CKProgressView *)self bounds];
  CGFloat v7 = CGRectGetWidth(v18) * v6;
  v8 = [(CKProgressView *)self __ck_trackView];
  double v9 = 0.0;
  objc_msgSend(v8, "setFrame:", 0.0, v4, v7, v3);

  [(CKProgressView *)self progress];
  float v11 = v10;
  [(CKProgressView *)self bounds];
  double Width = CGRectGetWidth(v19);
  if ([(CKProgressView *)self _shouldReverseLayoutDirection])
  {
    [(CKProgressView *)self progress];
    double v14 = 1.0 - v13;
    [(CKProgressView *)self bounds];
    double v9 = v14 * CGRectGetWidth(v20);
  }
  v15 = [(CKProgressView *)self __ck_progressView];
  objc_msgSend(v15, "setFrame:", v9, v4, Width * v11, v3);
}

- (void)setTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [(CKProgressView *)self __ck_progressView];
  [v5 setBackgroundColor:v4];
}

- (void)setTrackTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [(CKProgressView *)self __ck_trackView];
  [v5 setBackgroundColor:v4];
}

- (UIView)__ck_progressView
{
  return self->___ck_progressView;
}

- (void)set__ck_progressView:(id)a3
{
}

- (UIView)__ck_trackView
{
  return self->___ck_trackView;
}

- (void)set__ck_trackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->___ck_trackView, 0);

  objc_storeStrong((id *)&self->___ck_progressView, 0);
}

@end