@interface BPSRemoteWatchView
- (BPSRemoteWatchView)initWithFrame:(CGRect)a3;
- (BPSWatchView)watch;
- (NSString)advertisingName;
- (PBBridgeAssetsManager)assetManager;
- (UIImageView)watchScreen;
- (id)_imageForSize:(unint64_t)a3;
- (unint64_t)material;
- (unint64_t)size;
- (unint64_t)style;
- (void)layoutSubviews;
- (void)setAdvertisingIdentifier:(id)a3;
- (void)setAdvertisingIdentifier:(id)a3 andStyle:(unint64_t)a4;
- (void)setAdvertisingName:(id)a3;
- (void)setAdvertisingName:(id)a3 andStyle:(unint64_t)a4;
- (void)setAssetManager:(id)a3;
- (void)setMaterial:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setWatch:(id)a3;
- (void)setWatchScreen:(id)a3;
- (void)setupWatchView;
@end

@implementation BPSRemoteWatchView

- (BPSRemoteWatchView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BPSRemoteWatchView;
  v3 = -[BPSRemoteWatchView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (PBBridgeAssetsManager *)objc_alloc_init(MEMORY[0x263F5B968]);
    assetManager = v3->_assetManager;
    v3->_assetManager = v4;
  }
  return v3;
}

- (void)setAdvertisingName:(id)a3
{
}

- (void)setAdvertisingIdentifier:(id)a3
{
}

- (void)setupWatchView
{
  watch = self->_watch;
  if (watch) {
    [(BPSWatchView *)watch removeFromSuperview];
  }
  v4 = [MEMORY[0x263F5B978] sharedDeviceController];
  [v4 setMaterial:self->_material];

  v5 = [MEMORY[0x263F5B978] sharedDeviceController];
  [v5 setInternalSize:self->_size];

  v6 = [[BPSWatchView alloc] initWithStyle:self->_style];
  objc_super v7 = self->_watch;
  self->_watch = v6;

  [(BPSRemoteWatchView *)self addSubview:self->_watch];
  id v10 = [(BPSRemoteWatchView *)self _imageForSize:self->_size];
  v8 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v10];
  watchScreen = self->_watchScreen;
  self->_watchScreen = v8;

  [(BPSWatchView *)self->_watch addSubview:self->_watchScreen];
}

- (void)setAdvertisingIdentifier:(id)a3 andStyle:(unint64_t)a4
{
  id v6 = a3;
  self->_unint64_t material = [v6 enclosureMaterial];
  unsigned int v7 = [v6 deviceSize];

  self->_unint64_t size = v7;
  self->_style = a4;
  [(BPSRemoteWatchView *)self setupWatchView];
  assetManager = self->_assetManager;
  if (!assetManager)
  {
    v9 = (PBBridgeAssetsManager *)objc_alloc_init(MEMORY[0x263F5B968]);
    id v10 = self->_assetManager;
    self->_assetManager = v9;

    assetManager = self->_assetManager;
  }
  unint64_t material = self->_material;
  unint64_t size = self->_size;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__BPSRemoteWatchView_setAdvertisingIdentifier_andStyle___block_invoke;
  v13[3] = &unk_264408A20;
  v13[4] = self;
  [(PBBridgeAssetsManager *)assetManager beginPullingAssetsForDeviceMaterial:material size:size branding:0 completion:v13];
  [(BPSRemoteWatchView *)self layoutIfNeeded];
}

void __56__BPSRemoteWatchView_setAdvertisingIdentifier_andStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = pbb_mobileasset_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 456);
    uint64_t v7 = *(void *)(v5 + 448);
    v8 = [NSNumber numberWithBool:a2];
    int v9 = 134218498;
    uint64_t v10 = v6;
    __int16 v11 = 2048;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_21C513000, v4, OS_LOG_TYPE_DEFAULT, "Pulled Assets for material: %lu size:%lu? Success:%@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)setAdvertisingName:(id)a3 andStyle:(unint64_t)a4
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_advertisingName, a3);
  watch = self->_watch;
  if (watch) {
    [(BPSWatchView *)watch removeFromSuperview];
  }
  int v9 = PBAdvertisingInfoFromPayload();
  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F5B998]];
  self->_unint64_t material = [v10 integerValue];

  __int16 v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F5B9B0]];
  self->_unint64_t size = [v11 integerValue];

  self->_style = a4;
  [(BPSRemoteWatchView *)self setupWatchView];
  assetManager = self->_assetManager;
  if (!assetManager)
  {
    __int16 v13 = (PBBridgeAssetsManager *)objc_alloc_init(MEMORY[0x263F5B968]);
    v14 = self->_assetManager;
    self->_assetManager = v13;

    assetManager = self->_assetManager;
  }
  advertisingName = self->_advertisingName;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__BPSRemoteWatchView_setAdvertisingName_andStyle___block_invoke;
  v16[3] = &unk_264408A20;
  v16[4] = self;
  [(PBBridgeAssetsManager *)assetManager beginPullingAssetsForAdvertisingName:advertisingName completion:v16];
  [(BPSRemoteWatchView *)self layoutIfNeeded];
}

void __50__BPSRemoteWatchView_setAdvertisingName_andStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = pbb_mobileasset_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 408);
    uint64_t v6 = [NSNumber numberWithBool:a2];
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_21C513000, v4, OS_LOG_TYPE_DEFAULT, "Pulled Assets for material: %@? (%@)", (uint8_t *)&v7, 0x16u);
  }
}

- (id)_imageForSize:(unint64_t)a3
{
  if (a3 == 24 || a3 == 19)
  {
    v3 = (void *)MEMORY[0x263F1C6B0];
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = @"Prox_Modular_Ultra";
  }
  else
  {
    unint64_t size = self->_size;
    if (size - 20 >= 4)
    {
      v3 = (void *)MEMORY[0x263F1C6B0];
      if (size - 1 > 1)
      {
        v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v5 = @"Prox_Simple-Edition";
      }
      else
      {
        v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v5 = @"Prox_Simple";
      }
    }
    else
    {
      v3 = (void *)MEMORY[0x263F1C6B0];
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v5 = @"Prox-Reflections-496h";
    }
  }
  int v7 = [v3 imageNamed:v5 inBundle:v4];

  return v7;
}

- (void)layoutSubviews
{
  [(BPSRemoteWatchView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v30 = *MEMORY[0x263F001B0];
  double v31 = *(double *)(MEMORY[0x263F001B0] + 8);
  -[BPSWatchView sizeThatFits:](self->_watch, "sizeThatFits:");
  double v12 = v11;
  double v14 = v13;
  double v15 = 0.79;
  if (self->_style != 2) {
    double v15 = 1.0;
  }
  CGFloat sx = v15;
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  double v16 = floor((CGRectGetWidth(v35) - v12) * 0.5);
  v36.origin.x = v4;
  v36.origin.y = v6;
  v36.size.width = v8;
  v36.size.height = v10;
  -[BPSWatchView setFrame:](self->_watch, "setFrame:", v16, floor((CGRectGetHeight(v36) - v14) * 0.5), v12, v14);
  v17 = [(BPSWatchView *)self->_watch layer];
  v18 = [(BPSWatchView *)self->_watch layer];
  v19 = v18;
  if (v18) {
    [v18 transform];
  }
  else {
    memset(&v33, 0, sizeof(v33));
  }
  CATransform3DScale(&v34, &v33, sx, sx, sx);
  [v17 setTransform:&v34];

  v20 = [(UIImageView *)self->_watchScreen image];
  [v20 scale];
  double v22 = v21;

  switch(self->_size)
  {
    case 7uLL:
      if (v22 <= 2.0)
      {
        double v27 = 18.0;
        double v26 = 76.0;
        double v24 = 64.0;
        *(double *)&uint64_t v29 = 48.0;
      }
      else
      {
        double v26 = 90.0;
        double v24 = 76.0;
        double v27 = 21.5;
        *(double *)&uint64_t v29 = 56.0;
      }
      goto LABEL_26;
    case 8uLL:
      if (v22 > 2.0)
      {
        double v26 = 94.0;
        double v24 = 76.0;
        double v27 = 21.5;
        *(double *)&uint64_t v29 = 54.0;
        goto LABEL_26;
      }
      double v27 = 16.0;
      double v26 = 81.0;
      double v24 = 68.0;
      goto LABEL_28;
    case 0xDuLL:
    case 0xEuLL:
      if (v22 <= 2.0)
      {
        double v27 = 16.0;
        double v26 = 82.0;
        double v24 = 69.0;
LABEL_28:
        double v28 = 47.0;
      }
      else
      {
        double v26 = 100.0;
        double v24 = 82.0;
        double v27 = 18.5;
        double v28 = 51.0;
      }
LABEL_29:
      -[UIImageView setFrame:](self->_watchScreen, "setFrame:", v27, v28, v24, v26);
      return;
    case 0x13uLL:
    case 0x18uLL:
      if (v22 <= 2.0) {
        goto LABEL_19;
      }
      double v27 = 19.0;
      double v26 = 100.0;
      double v24 = 81.0;
      goto LABEL_18;
    case 0x14uLL:
    case 0x15uLL:
      if (v22 <= 2.0)
      {
LABEL_19:
        double v27 = 14.0;
        double v26 = 88.0;
        double v24 = 70.5;
        *(double *)&uint64_t v29 = 44.0;
LABEL_26:
        double v28 = *(double *)&v29;
      }
      else
      {
        double v26 = 100.0;
        double v24 = 81.0;
        double v27 = 17.5;
LABEL_18:
        double v28 = 50.5;
      }
      goto LABEL_29;
    default:
      -[UIImageView sizeThatFits:](self->_watchScreen, "sizeThatFits:", v30, v31);
      double v24 = v23;
      double v26 = v25;
      double v27 = 24.5;
      if (v22 <= 2.0) {
        double v27 = 21.0;
      }
      double v28 = 50.0;
      if (v22 > 2.0) {
        double v28 = 59.0;
      }
      goto LABEL_29;
  }
}

- (NSString)advertisingName
{
  return self->_advertisingName;
}

- (PBBridgeAssetsManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (BPSWatchView)watch
{
  return self->_watch;
}

- (void)setWatch:(id)a3
{
}

- (UIImageView)watchScreen
{
  return self->_watchScreen;
}

- (void)setWatchScreen:(id)a3
{
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_unint64_t size = a3;
}

- (unint64_t)material
{
  return self->_material;
}

- (void)setMaterial:(unint64_t)a3
{
  self->_unint64_t material = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchScreen, 0);
  objc_storeStrong((id *)&self->_watch, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_advertisingName, 0);
}

@end