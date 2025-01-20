@interface LACUIFaceIDSpinnerView
- (CALayer)faceLayer;
- (LACUIFaceIDSpinnerView)init;
- (LACUIFaceIDSpinnerView)initWithInitialState:(int64_t)a3;
- (int64_t)state;
- (void)_setup;
- (void)setState:(int64_t)a3;
@end

@implementation LACUIFaceIDSpinnerView

- (LACUIFaceIDSpinnerView)init
{
  return [(LACUIFaceIDSpinnerView *)self initWithInitialState:0];
}

- (LACUIFaceIDSpinnerView)initWithInitialState:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)LACUIFaceIDSpinnerView;
  v4 = -[LACUIFaceIDSpinnerView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v4)
  {
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 URLForResource:@"face-id-spinner" withExtension:@"ca"];

    v7 = [[LACUIPackagedView alloc] initWithURL:v6 error:0];
    packagedView = v4->_packagedView;
    v4->_packagedView = v7;

    if ((unint64_t)a3 > 3) {
      v9 = @"Invalid";
    }
    else {
      v9 = off_2653BCD60[a3];
    }
    [(LACUIPackagedView *)v4->_packagedView setStateNamed:v9 animated:0];
    v10 = [(LACUIPackagedView *)v4->_packagedView rootLayer];
    uint64_t v11 = LACUILayerFindSublayerWithName(v10, @"face-rounder");
    faceLayer = v4->_faceLayer;
    v4->_faceLayer = (CALayer *)v11;

    [(LACUIFaceIDSpinnerView *)v4 _setup];
  }
  return v4;
}

- (void)_setup
{
  v17[4] = *MEMORY[0x263EF8340];
  [(LACUIFaceIDSpinnerView *)self addSubview:self->_packagedView];
  [(LACUIPackagedView *)self->_packagedView setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = (void *)MEMORY[0x263F08938];
  v16 = [(LACUIPackagedView *)self->_packagedView leadingAnchor];
  v15 = [(LACUIFaceIDSpinnerView *)self leadingAnchor];
  objc_super v14 = [v16 constraintEqualToAnchor:v15];
  v17[0] = v14;
  v3 = [(LACUIPackagedView *)self->_packagedView trailingAnchor];
  v4 = [(LACUIFaceIDSpinnerView *)self trailingAnchor];
  v5 = [v3 constraintEqualToAnchor:v4];
  v17[1] = v5;
  v6 = [(LACUIPackagedView *)self->_packagedView topAnchor];
  v7 = [(LACUIFaceIDSpinnerView *)self topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v17[2] = v8;
  v9 = [(LACUIPackagedView *)self->_packagedView bottomAnchor];
  v10 = [(LACUIFaceIDSpinnerView *)self bottomAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10];
  v17[3] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
  [v13 activateConstraints:v12];
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
  packagedView = self->_packagedView;
  if ((unint64_t)a3 > 3) {
    v4 = @"Invalid";
  }
  else {
    v4 = off_2653BCD60[a3];
  }
  [(LACUIPackagedView *)packagedView setStateNamed:v4 animated:1 completion:&__block_literal_global_4];
}

- (int64_t)state
{
  return self->_state;
}

- (CALayer)faceLayer
{
  return self->_faceLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceLayer, 0);
  objc_storeStrong((id *)&self->_packagedView, 0);
}

@end