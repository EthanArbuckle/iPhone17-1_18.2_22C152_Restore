@interface _MKZoomSliderView
- (BOOL)isActive;
- (_MKZoomSliderView)initWithFrame:(CGRect)a3;
- (double)zoomFraction;
- (void)didMoveToWindow;
- (void)setActive:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setZoomFraction:(double)a3;
- (void)updateConstraints;
@end

@implementation _MKZoomSliderView

- (_MKZoomSliderView)initWithFrame:(CGRect)a3
{
  v53.receiver = self;
  v53.super_class = (Class)_MKZoomSliderView;
  v3 = -[_MKZoomSliderView initWithFrame:](&v53, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v5 = [MEMORY[0x1E4F42D90] mainScreen];
    [v5 scale];
    v7 = _trackShadowImage(v6);
    uint64_t v8 = [v4 initWithImage:v7];
    shadowImageView = v3->_shadowImageView;
    v3->_shadowImageView = (UIImageView *)v8;

    v10 = [MEMORY[0x1E4F42D90] mainScreen];
    [v10 scale];
    v3->_lastTrackShadowImageScale = v11;

    [(UIImageView *)v3->_shadowImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MKZoomSliderView *)v3 addSubview:v3->_shadowImageView];
    v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_shadowImageView attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
    [(_MKZoomSliderView *)v3 addConstraint:v12];

    v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_shadowImageView attribute:3 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:-75.0];
    [(_MKZoomSliderView *)v3 addConstraint:v13];

    v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_shadowImageView attribute:4 relatedBy:0 toItem:v3 attribute:4 multiplier:1.0 constant:75.0];
    [(_MKZoomSliderView *)v3 addConstraint:v14];

    v52 = [MEMORY[0x1E4F427D8] effectWithStyle:4001];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v52];
    [v15 _setCornerRadius:1 continuous:15 maskedCorners:6.0];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MKZoomSliderView *)v3 addSubview:v15];
    v16 = [MEMORY[0x1E4F28DC8] constraintWithItem:v15 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:12.0];
    [(_MKZoomSliderView *)v3 addConstraint:v16];

    v17 = (void *)MEMORY[0x1E4F28DC8];
    v18 = _NSDictionaryOfVariableBindings(&cfstr_Track.isa, v15, 0);
    v19 = [v17 constraintsWithVisualFormat:@"H:|[track]|" options:0 metrics:0 views:v18];
    [(_MKZoomSliderView *)v3 addConstraints:v19];

    v20 = (void *)MEMORY[0x1E4F28DC8];
    v21 = _NSDictionaryOfVariableBindings(&cfstr_Track.isa, v15, 0);
    v22 = [v20 constraintsWithVisualFormat:@"V:|[track]|" options:0 metrics:0 views:v21];
    [(_MKZoomSliderView *)v3 addConstraints:v22];

    v23 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(UIView *)v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v24 = [MEMORY[0x1E4F428B8] blackColor];
    uint64_t v25 = [v24 CGColor];
    v26 = [(UIView *)v23 layer];
    [v26 setShadowColor:v25];

    v27 = [(UIView *)v23 layer];
    [v27 setShadowRadius:6.0];

    v28 = [(UIView *)v23 layer];
    LODWORD(v29) = 1053609165;
    [v28 setShadowOpacity:v29];

    v30 = [(UIView *)v23 layer];
    objc_msgSend(v30, "setShadowOffset:", 0.0, 4.0);

    objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:", 0.0, 0.0, 24.0, 24.0);
    id v31 = objc_claimAutoreleasedReturnValue();
    uint64_t v32 = [v31 CGPath];
    v33 = [(UIView *)v23 layer];
    [v33 setShadowPath:v32];

    [(_MKZoomSliderView *)v3 addSubview:v23];
    v34 = [MEMORY[0x1E4F28DC8] constraintWithItem:v23 attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
    [(_MKZoomSliderView *)v3 addConstraint:v34];

    uint64_t v35 = [MEMORY[0x1E4F28DC8] constraintWithItem:v23 attribute:10 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:0.0];
    knobCenterYConstraint = v3->_knobCenterYConstraint;
    v3->_knobCenterYConstraint = (NSLayoutConstraint *)v35;

    [(_MKZoomSliderView *)v3 addConstraint:v3->_knobCenterYConstraint];
    v37 = [MEMORY[0x1E4F28DC8] constraintWithItem:v23 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:24.0];
    [(_MKZoomSliderView *)v3 addConstraint:v37];

    v38 = [MEMORY[0x1E4F28DC8] constraintWithItem:v23 attribute:8 relatedBy:0 toItem:v23 attribute:7 multiplier:1.0 constant:0.0];
    [(_MKZoomSliderView *)v3 addConstraint:v38];

    id v39 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
    v40 = [MEMORY[0x1E4F428B8] whiteColor];
    [v39 setBackgroundColor:v40];

    v41 = [v39 layer];
    [v41 setMasksToBounds:1];

    v42 = [v39 layer];
    [v42 setCornerRadius:12.0];

    [(UIView *)v23 addSubview:v39];
    v43 = (void *)MEMORY[0x1E4F28DC8];
    v44 = _NSDictionaryOfVariableBindings(&cfstr_Knobcircle.isa, v39, 0);
    v45 = [v43 constraintsWithVisualFormat:@"H:|[knobCircle]|" options:0 metrics:0 views:v44];
    [(UIView *)v23 addConstraints:v45];

    v46 = (void *)MEMORY[0x1E4F28DC8];
    v47 = _NSDictionaryOfVariableBindings(&cfstr_Knobcircle.isa, v39, 0);
    v48 = [v46 constraintsWithVisualFormat:@"V:|[knobCircle]|" options:0 metrics:0 views:v47];
    [(UIView *)v23 addConstraints:v48];

    knob = v3->_knob;
    v3->_knob = v23;

    v50 = v3;
  }

  return v3;
}

- (void)didMoveToWindow
{
  v9.receiver = self;
  v9.super_class = (Class)_MKZoomSliderView;
  [(_MKZoomSliderView *)&v9 didMoveToWindow];
  v3 = [(_MKZoomSliderView *)self window];

  if (v3)
  {
    id v4 = [(_MKZoomSliderView *)self window];
    v5 = [v4 screen];
    [v5 scale];
    double v7 = v6;

    if (vabdd_f64(v7, self->_lastTrackShadowImageScale) >= 0.000001)
    {
      self->_lastTrackShadowImageScale = v7;
      uint64_t v8 = _trackShadowImage(v7);
      [(UIImageView *)self->_shadowImageView setImage:v8];
    }
  }
}

- (void)setZoomFraction:(double)a3
{
  self->_zoomFraction = a3;
  [(_MKZoomSliderView *)self setNeedsUpdateConstraints];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_MKZoomSliderView;
  -[_MKZoomSliderView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_MKZoomSliderView *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v9.receiver = self;
  v9.super_class = (Class)_MKZoomSliderView;
  [(_MKZoomSliderView *)&v9 updateConstraints];
  double v3 = 1.0;
  double v4 = 1.0 - self->_zoomFraction;
  BOOL v5 = v4 > 0.0 || v4 >= 1.0;
  BOOL v6 = v4 <= 0.0 || v4 >= 1.0;
  if (!v5) {
    double v3 = 0.0;
  }
  if (v6) {
    double v7 = v3;
  }
  else {
    double v7 = 1.0 - self->_zoomFraction;
  }
  [(_MKZoomSliderView *)self bounds];
  [(NSLayoutConstraint *)self->_knobCenterYConstraint setConstant:v8 * v7];
}

- (void)setActive:(BOOL)a3
{
  v55[3] = *MEMORY[0x1E4F143B8];
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    BOOL v5 = [(UIView *)self->_knob layer];
    BOOL v6 = [v5 currentLayer];

    if (v3)
    {
      memset(&v53, 0, sizeof(v53));
      CATransform3DMakeScale(&v53, 2.0, 2.0, 1.0);
      double v7 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
      [v7 setMass:1.20000005];
      [v7 setStiffness:300.0];
      [v7 setDamping:30.0];
      double v8 = (void *)MEMORY[0x1E4F29238];
      if (v6) {
        [v6 transform];
      }
      else {
        memset(v52, 0, sizeof(v52));
      }
      v10 = [v8 valueWithCATransform3D:v52];
      [v7 setFromValue:v10];

      CATransform3D v51 = v53;
      double v11 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v51];
      [v7 setToValue:v11];

      v12 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"shadowOffset"];
      [v12 setMass:1.20000005];
      [v12 setStiffness:300.0];
      [v12 setDamping:30.0];
      v13 = (void *)MEMORY[0x1E4F29238];
      [v6 shadowOffset];
      v14 = objc_msgSend(v13, "valueWithCGSize:");
      [v12 setFromValue:v14];

      v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", 0.0, 12.0);
      [v12 setToValue:v15];

      v16 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"shadowOpacity"];
      [v16 setMass:1.20000005];
      [v16 setStiffness:300.0];
      [v16 setDamping:30.0];
      v17 = NSNumber;
      [v6 shadowOpacity];
      v18 = objc_msgSend(v17, "numberWithFloat:");
      [v16 setFromValue:v18];

      [v16 setToValue:&unk_1ED97DF60];
      v19 = [MEMORY[0x1E4F39B38] animation];
      [v19 setDuration:0.300000012];
      v55[0] = v7;
      v55[1] = v12;
      v55[2] = v16;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:3];
      [v19 setAnimations:v20];

      v21 = [(UIView *)self->_knob layer];
      [v21 addAnimation:v19 forKey:@"Active"];

      CATransform3D v50 = v53;
      v22 = [(UIView *)self->_knob layer];
      CATransform3D v49 = v50;
      [v22 setTransform:&v49];

      v23 = [(UIView *)self->_knob layer];
      objc_msgSend(v23, "setShadowOffset:", 0.0, 12.0);

      id v24 = [(UIView *)self->_knob layer];
      uint64_t v25 = v24;
      LODWORD(v26) = 1045220557;
    }
    else
    {
      double v7 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
      [v7 setMass:1.20000005];
      [v7 setStiffness:300.0];
      [v7 setDamping:30.0];
      objc_super v9 = (void *)MEMORY[0x1E4F29238];
      if (v6) {
        [v6 transform];
      }
      else {
        memset(v48, 0, sizeof(v48));
      }
      v27 = [v9 valueWithCATransform3D:v48];
      [v7 setFromValue:v27];

      long long v46 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      *(_OWORD *)&v53.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      long long v45 = *(_OWORD *)&v53.m31;
      *(_OWORD *)&v53.m33 = v46;
      long long v44 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      *(_OWORD *)&v53.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      long long v43 = *(_OWORD *)&v53.m41;
      *(_OWORD *)&v53.m43 = v44;
      long long v42 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      *(_OWORD *)&v53.m11 = *MEMORY[0x1E4F39B10];
      long long v41 = *(_OWORD *)&v53.m11;
      *(_OWORD *)&v53.m13 = v42;
      long long v40 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      *(_OWORD *)&v53.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      long long v39 = *(_OWORD *)&v53.m21;
      *(_OWORD *)&v53.m23 = v40;
      v28 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v53];
      [v7 setToValue:v28];

      v12 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"shadowOffset"];
      [v12 setMass:1.20000005];
      [v12 setStiffness:300.0];
      [v12 setDamping:30.0];
      double v29 = (void *)MEMORY[0x1E4F29238];
      [v6 shadowOffset];
      v30 = objc_msgSend(v29, "valueWithCGSize:");
      [v12 setFromValue:v30];

      id v31 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", 0.0, 4.0);
      [v12 setToValue:v31];

      v16 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"shadowOpacity"];
      [v16 setMass:1.20000005];
      [v16 setStiffness:300.0];
      [v16 setDamping:30.0];
      uint64_t v32 = NSNumber;
      [v6 shadowOpacity];
      v33 = objc_msgSend(v32, "numberWithFloat:");
      [v16 setFromValue:v33];

      [v16 setToValue:&unk_1ED97DF70];
      v19 = [MEMORY[0x1E4F39B38] animation];
      [v19 setDuration:0.300000012];
      v54[0] = v7;
      v54[1] = v12;
      v54[2] = v16;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
      [v19 setAnimations:v34];

      uint64_t v35 = [(UIView *)self->_knob layer];
      [v35 removeAnimationForKey:@"Active"];

      v36 = [(UIView *)self->_knob layer];
      [v36 addAnimation:v19 forKey:@"Active"];

      v37 = [(UIView *)self->_knob layer];
      v47[4] = v45;
      v47[5] = v46;
      v47[6] = v43;
      v47[7] = v44;
      v47[0] = v41;
      v47[1] = v42;
      v47[2] = v39;
      v47[3] = v40;
      [v37 setTransform:v47];

      v38 = [(UIView *)self->_knob layer];
      objc_msgSend(v38, "setShadowOffset:", 0.0, 4.0);

      id v24 = [(UIView *)self->_knob layer];
      uint64_t v25 = v24;
      LODWORD(v26) = 1053609165;
    }
    [v24 setShadowOpacity:v26];
  }
}

- (double)zoomFraction
{
  return self->_zoomFraction;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowImageView, 0);
  objc_storeStrong((id *)&self->_knob, 0);

  objc_storeStrong((id *)&self->_knobCenterYConstraint, 0);
}

@end