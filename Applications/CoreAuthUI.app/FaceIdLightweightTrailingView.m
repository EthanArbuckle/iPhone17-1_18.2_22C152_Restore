@interface FaceIdLightweightTrailingView
- (FaceIdLightweightTrailingView)init;
- (NSNumber)remainingSecurityDelay;
- (int64_t)state;
- (void)_setup;
- (void)_setupSecureView;
- (void)_setupSpinnerView;
- (void)setState:(int64_t)a3;
@end

@implementation FaceIdLightweightTrailingView

- (FaceIdLightweightTrailingView)init
{
  v5.receiver = self;
  v5.super_class = (Class)FaceIdLightweightTrailingView;
  v2 = -[FaceIdLightweightTrailingView initWithFrame:](&v5, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = v2;
  if (v2) {
    [(FaceIdLightweightTrailingView *)v2 _setup];
  }
  return v3;
}

- (void)_setup
{
  id v7 = +[LACSecureFaceIDUIUtilities sharedInstance];
  if ([v7 isSupported]
    && [v7 isEnabled]
    && (v3 = (LAUISecureFaceIDView *)[objc_alloc((Class)LAUISecureFaceIDView) initWithType:1], secureFaceIdView = self->_secureFaceIdView, self->_secureFaceIdView = v3, secureFaceIdView, self->_secureFaceIdView))
  {
    [(FaceIdLightweightTrailingView *)self _setupSecureView];
  }
  else
  {
    objc_super v5 = (LACUIFaceIDSpinnerView *)objc_opt_new();
    faceIDSpinnerView = self->_faceIDSpinnerView;
    self->_faceIDSpinnerView = v5;

    [(FaceIdLightweightTrailingView *)self _setupSpinnerView];
  }
}

- (void)_setupSpinnerView
{
  [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(FaceIdLightweightTrailingView *)self addSubview:self->_faceIDSpinnerView];
  [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView setState:1];
  v15 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView leadingAnchor];
  v14 = [(FaceIdLightweightTrailingView *)self leadingAnchor];
  v13 = [v15 constraintEqualToAnchor:v14];
  v16[0] = v13;
  v3 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView trailingAnchor];
  v4 = [(FaceIdLightweightTrailingView *)self trailingAnchor];
  objc_super v5 = [v3 constraintEqualToAnchor:v4];
  v16[1] = v5;
  v6 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView topAnchor];
  id v7 = [(FaceIdLightweightTrailingView *)self topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v16[2] = v8;
  v9 = [(LACUIFaceIDSpinnerView *)self->_faceIDSpinnerView bottomAnchor];
  v10 = [(FaceIdLightweightTrailingView *)self bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v16[3] = v11;
  v12 = +[NSArray arrayWithObjects:v16 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_setupSecureView
{
  [(LAUISecureFaceIDView *)self->_secureFaceIdView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(FaceIdLightweightTrailingView *)self addSubview:self->_secureFaceIdView];
  [(LAUISecureFaceIDView *)self->_secureFaceIdView setState:0];
  v3 = [(LAUISecureFaceIDView *)self->_secureFaceIdView centerXAnchor];
  v4 = [(FaceIdLightweightTrailingView *)self centerXAnchor];
  objc_super v5 = [v3 constraintEqualToAnchor:v4];
  v10[0] = v5;
  v6 = [(LAUISecureFaceIDView *)self->_secureFaceIdView centerYAnchor];
  id v7 = [(FaceIdLightweightTrailingView *)self centerYAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v10[1] = v8;
  v9 = +[NSArray arrayWithObjects:v10 count:2];
  +[NSLayoutConstraint activateConstraints:v9];
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    if (self->_secureFaceIdView)
    {
      [(LAUISecureFaceIDView *)self->_secureFaceIdView setState:sub_100005A28(a3)];
      secureFaceIdView = self->_secureFaceIdView;
      [(LAUISecureFaceIDView *)secureFaceIdView setHidden:a3 == 0];
    }
    else
    {
      unint64_t v6 = sub_100005A90(a3);
      faceIDSpinnerView = self->_faceIDSpinnerView;
      [(LACUIFaceIDSpinnerView *)faceIDSpinnerView setState:v6];
    }
  }
}

- (NSNumber)remainingSecurityDelay
{
  return (NSNumber *)[(LAUISecureFaceIDView *)self->_secureFaceIdView remainingMinDisplayTimeInterval];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureFaceIdView, 0);

  objc_storeStrong((id *)&self->_faceIDSpinnerView, 0);
}

@end