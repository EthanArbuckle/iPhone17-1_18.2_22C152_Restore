@interface MKZoomSegmentedControl
- (MKZoomSegmentedControl)initWithFrame:(CGRect)a3;
- (void)_unloadResources;
- (void)dealloc;
- (void)minusPressed:(id)a3;
- (void)plusPressed:(id)a3;
- (void)touchEnded:(id)a3;
- (void)updateAppearance;
@end

@implementation MKZoomSegmentedControl

- (MKZoomSegmentedControl)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v22[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)MKZoomSegmentedControl;
  v5 = -[MKZoomSegmentedControl initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    [(MKZoomSegmentedControl *)v5 setUserInteractionEnabled:1];
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    v9 = [(MKZoomSegmentedControl *)v6 layer];
    v10 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v10 setValue:&unk_1ED97E020 forKey:@"inputRadius"];
    [v10 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
    uint64_t v11 = [MEMORY[0x1E4F39B40] layer];
    blurLayer = v6->_blurLayer;
    v6->_blurLayer = (CABackdropLayer *)v11;

    v22[0] = v10;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [(CABackdropLayer *)v6->_blurLayer setFilters:v13];

    -[CABackdropLayer setFrame:](v6->_blurLayer, "setFrame:", v7, v8, width, height);
    [v9 addSublayer:v6->_blurLayer];
    uint64_t v14 = [MEMORY[0x1E4F39BE8] layer];
    maskLayer = v6->_maskLayer;
    v6->_maskLayer = (CALayer *)v14;

    -[CALayer setFrame:](v6->_maskLayer, "setFrame:", v7, v8, width, height);
    [(CABackdropLayer *)v6->_blurLayer setMask:v6->_maskLayer];
    uint64_t v16 = [MEMORY[0x1E4F39BE8] layer];
    displayLayer = v6->_displayLayer;
    v6->_displayLayer = (CALayer *)v16;

    -[CALayer setFrame:](v6->_displayLayer, "setFrame:", v7, v8, width, height);
    [v9 addSublayer:v6->_displayLayer];
    v18 = [MEMORY[0x1E4F42F80] systemTraitsAffectingImageLookup];
    id v19 = (id)[(MKZoomSegmentedControl *)v6 registerForTraitChanges:v18 withAction:sel_traitEnvironment_didChangeTraitCollection_];

    [(MKZoomSegmentedControl *)v6 updateAppearance];
  }
  return v6;
}

- (void)dealloc
{
  [(MKZoomSegmentedControl *)self _unloadResources];
  v3.receiver = self;
  v3.super_class = (Class)MKZoomSegmentedControl;
  [(MKZoomSegmentedControl *)&v3 dealloc];
}

- (void)_unloadResources
{
  [(CALayer *)self->_displayLayer setContents:0];
  [(CALayer *)self->_maskLayer setContents:0];
  CGImageRelease(self->_backgroundUnselectedImage);
  CGImageRelease(self->_backgroundMinusSelectedImage);
  CGImageRelease(self->_backgroundPlusSelectedImage);
  maskImage = self->_maskImage;

  CGImageRelease(maskImage);
}

- (void)updateAppearance
{
  id v8 = [(MKZoomSegmentedControl *)self traitCollection];
  objc_super v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  [(MKZoomSegmentedControl *)self _unloadResources];
  id v4 = [MEMORY[0x1E4F42A80] imageNamed:@"zoomControl" inBundle:v3 compatibleWithTraitCollection:v8];
  self->_backgroundUnselectedImage = CGImageRetain((CGImageRef)[v4 CGImage]);

  id v5 = [MEMORY[0x1E4F42A80] imageNamed:@"zoomControlMinus" inBundle:v3 compatibleWithTraitCollection:v8];
  self->_backgroundMinusSelectedImage = CGImageRetain((CGImageRef)[v5 CGImage]);

  id v6 = [MEMORY[0x1E4F42A80] imageNamed:@"zoomControlPlus" inBundle:v3 compatibleWithTraitCollection:v8];
  self->_backgroundPlusSelectedImage = CGImageRetain((CGImageRef)[v6 CGImage]);

  id v7 = [MEMORY[0x1E4F42A80] imageNamed:@"zoomControlDarkMask" inBundle:v3 compatibleWithTraitCollection:v8];
  self->_maskImage = CGImageRetain((CGImageRef)[v7 CGImage]);

  -[CABackdropLayer setHidden:](self->_blurLayer, "setHidden:", [v8 userInterfaceStyle] != 2);
  [(CALayer *)self->_maskLayer setContents:self->_maskImage];
  [(CALayer *)self->_displayLayer setContents:self->_backgroundUnselectedImage];
}

- (void)minusPressed:(id)a3
{
}

- (void)plusPressed:(id)a3
{
}

- (void)touchEnded:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_blurLayer, 0);

  objc_storeStrong((id *)&self->_displayLayer, 0);
}

@end