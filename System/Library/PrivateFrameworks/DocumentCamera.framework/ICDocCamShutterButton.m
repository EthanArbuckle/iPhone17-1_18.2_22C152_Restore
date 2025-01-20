@interface ICDocCamShutterButton
- (BOOL)isPseudoDisabled;
- (ICDocCamShutterButton)initWithCoder:(id)a3;
- (ICDocCamShutterButton)initWithFrame:(CGRect)a3;
- (id)innerCircle;
- (id)outerRingImage;
- (void)commonInit;
- (void)setPseudoDisabled:(BOOL)a3;
@end

@implementation ICDocCamShutterButton

- (ICDocCamShutterButton)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICDocCamShutterButton;
  v3 = [(ICDocCamShutterButton *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ICDocCamShutterButton *)v3 commonInit];
  }
  return v4;
}

- (ICDocCamShutterButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICDocCamShutterButton;
  v3 = -[ICDocCamShutterButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ICDocCamShutterButton *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v3 = [MEMORY[0x263F1C550] whiteColor];
  [(ICDocCamShutterButton *)self setTintColor:v3];

  id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
  v5 = [(ICDocCamShutterButton *)self outerRingImage];
  id v8 = (id)[v4 initWithImage:v5];

  objc_super v6 = [MEMORY[0x263F1C550] whiteColor];
  [v8 setTintColor:v6];

  [(ICDocCamShutterButton *)self insertSubview:v8 atIndex:0];
  v7 = [(ICDocCamShutterButton *)self innerCircle];
  [(ICDocCamShutterButton *)self setBackgroundImage:v7 forState:0];
}

- (id)outerRingImage
{
  v2 = (void *)MEMORY[0x263F1C6B0];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v2 imageNamed:@"ios_doccam_shutter_ring" inBundle:v3 compatibleWithTraitCollection:0];

  return v4;
}

- (id)innerCircle
{
  v2 = (void *)MEMORY[0x263F1C6B0];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v2 imageNamed:@"ios_doccam_shutter_center" inBundle:v3 compatibleWithTraitCollection:0];

  return v4;
}

- (void)setPseudoDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_pseudoDisabled = a3;
  id v4 = [(ICDocCamShutterButton *)self layer];
  id v6 = v4;
  LODWORD(v5) = 1.0;
  if (v3) {
    *(float *)&double v5 = 0.5;
  }
  [v4 setOpacity:v5];
}

- (BOOL)isPseudoDisabled
{
  return self->_pseudoDisabled;
}

@end