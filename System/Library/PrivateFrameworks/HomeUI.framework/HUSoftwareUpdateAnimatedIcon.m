@interface HUSoftwareUpdateAnimatedIcon
- (HUSoftwareUpdateAnimatedIcon)initWithFrame:(CGRect)a3;
- (UIImageView)innerGearView;
- (UIImageView)outerGearShadowView;
- (UIImageView)outerGearView;
- (void)createConstraints;
- (void)setAnimating:(BOOL)a3;
@end

@implementation HUSoftwareUpdateAnimatedIcon

- (HUSoftwareUpdateAnimatedIcon)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HUSoftwareUpdateAnimatedIcon;
  v3 = -[HUSoftwareUpdateAnimatedIcon initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(HUSoftwareUpdateAnimatedIcon *)v3 innerGearView];
    innerGearView = v4->_innerGearView;
    v4->_innerGearView = (UIImageView *)v5;

    [(UIImageView *)v4->_innerGearView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUSoftwareUpdateAnimatedIcon *)v4 addSubview:v4->_innerGearView];
    uint64_t v7 = [(HUSoftwareUpdateAnimatedIcon *)v4 outerGearShadowView];
    outerGearShadowView = v4->_outerGearShadowView;
    v4->_outerGearShadowView = (UIImageView *)v7;

    [(UIImageView *)v4->_outerGearShadowView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUSoftwareUpdateAnimatedIcon *)v4 addSubview:v4->_outerGearShadowView];
    uint64_t v9 = [(HUSoftwareUpdateAnimatedIcon *)v4 outerGearView];
    outerGearView = v4->_outerGearView;
    v4->_outerGearView = (UIImageView *)v9;

    [(UIImageView *)v4->_outerGearView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUSoftwareUpdateAnimatedIcon *)v4 addSubview:v4->_outerGearView];
    [(HUSoftwareUpdateAnimatedIcon *)v4 createConstraints];
  }
  return v4;
}

- (void)createConstraints
{
  v3 = [(UIImageView *)self->_innerGearView centerXAnchor];
  v4 = [(HUSoftwareUpdateAnimatedIcon *)self centerXAnchor];
  uint64_t v5 = [v3 constraintEqualToAnchor:v4];
  [v5 setActive:1];

  v6 = [(UIImageView *)self->_innerGearView centerYAnchor];
  uint64_t v7 = [(HUSoftwareUpdateAnimatedIcon *)self centerYAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  uint64_t v9 = [(UIImageView *)self->_outerGearView centerXAnchor];
  v10 = [(HUSoftwareUpdateAnimatedIcon *)self centerXAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  objc_super v12 = [(UIImageView *)self->_outerGearView centerYAnchor];
  v13 = [(HUSoftwareUpdateAnimatedIcon *)self centerYAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  v15 = [MEMORY[0x1E4F42D90] mainScreen];
  [v15 scale];
  double v17 = 1.0 / v16;

  v18 = [(UIImageView *)self->_outerGearShadowView centerXAnchor];
  v19 = [(HUSoftwareUpdateAnimatedIcon *)self centerXAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  id v23 = [(UIImageView *)self->_outerGearShadowView centerYAnchor];
  v21 = [(HUSoftwareUpdateAnimatedIcon *)self centerYAnchor];
  v22 = [v23 constraintEqualToAnchor:v21 constant:v17];
  [v22 setActive:1];
}

- (UIImageView)innerGearView
{
  id v2 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v3 = HUImageNamed(@"HUSoftwareUpdateIconInnerGear");
  v4 = (void *)[v2 initWithImage:v3];

  [v4 setOpaque:1];

  return (UIImageView *)v4;
}

- (UIImageView)outerGearShadowView
{
  id v2 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v3 = HUImageNamed(@"HUSoftwareUpdateIconOuterGearShadow");
  v4 = (void *)[v2 initWithImage:v3];

  return (UIImageView *)v4;
}

- (UIImageView)outerGearView
{
  id v2 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v3 = HUImageNamed(@"HUSoftwareUpdateIconOuterGear");
  v4 = (void *)[v2 initWithImage:v3];

  return (UIImageView *)v4;
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (a3)
    {
      id v14 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation"];
      LODWORD(v4) = 1086918619;
      uint64_t v5 = [NSNumber numberWithFloat:v4];
      [v14 setByValue:v5];

      [v14 setFillMode:*MEMORY[0x1E4F39FA8]];
      [v14 setRemovedOnCompletion:0];
      [v14 setDuration:10.0];
      [v14 setRepeatDuration:INFINITY];
      v6 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
      [v14 setTimingFunction:v6];

      uint64_t v7 = [(UIImageView *)self->_outerGearView layer];
      [v7 addAnimation:v14 forKey:@"outerRotation"];

      v8 = [(UIImageView *)self->_outerGearShadowView layer];
      [v8 addAnimation:v14 forKey:@"shadowRotation"];

      LODWORD(v9) = -1060565029;
      v10 = [NSNumber numberWithFloat:v9];
      [v14 setByValue:v10];

      v11 = [(UIImageView *)self->_innerGearView layer];
      [v11 addAnimation:v14 forKey:@"innerRotation"];
    }
    else
    {
      objc_super v12 = [(UIImageView *)self->_innerGearView layer];
      [v12 removeAllAnimations];

      v13 = [(UIImageView *)self->_outerGearShadowView layer];
      [v13 removeAllAnimations];

      id v14 = [(UIImageView *)self->_outerGearView layer];
      [v14 removeAllAnimations];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerGearView, 0);
  objc_storeStrong((id *)&self->_outerGearShadowView, 0);

  objc_storeStrong((id *)&self->_innerGearView, 0);
}

@end