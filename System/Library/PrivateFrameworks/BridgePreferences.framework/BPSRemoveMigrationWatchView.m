@interface BPSRemoveMigrationWatchView
- (BPSRemoveMigrationWatchView)initWithFrame:(CGRect)a3;
- (BPSWatchView)watch;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)advertisingName;
- (PBBridgeAssetsManager)assetManager;
- (void)layoutSubviews;
- (void)setAdvertisingName:(id)a3;
- (void)setAssetManager:(id)a3;
- (void)setWatch:(id)a3;
@end

@implementation BPSRemoveMigrationWatchView

- (BPSRemoveMigrationWatchView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BPSRemoveMigrationWatchView;
  v3 = -[BPSRemoveMigrationWatchView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
  v4 = (NSString *)[a3 copy];
  advertisingName = self->_advertisingName;
  self->_advertisingName = v4;

  watch = self->_watch;
  if (watch) {
    [(BPSWatchView *)watch removeFromSuperview];
  }
  objc_super v7 = PBAdvertisingInfoFromPayload();
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F5B998]];
  uint64_t v9 = [v8 integerValue];

  v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263F5B9B0]];
  uint64_t v11 = [v10 integerValue];

  v12 = [MEMORY[0x263F5B978] sharedDeviceController];
  [v12 setMaterial:v9];

  v13 = [MEMORY[0x263F5B978] sharedDeviceController];
  [v13 setInternalSize:v11];

  v14 = [[BPSWatchView alloc] initWithStyle:6];
  v15 = self->_watch;
  self->_watch = v14;

  [(BPSRemoveMigrationWatchView *)self addSubview:self->_watch];
  assetManager = self->_assetManager;
  v17 = self->_advertisingName;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __50__BPSRemoveMigrationWatchView_setAdvertisingName___block_invoke;
  v18[3] = &unk_264408A20;
  v18[4] = self;
  [(PBBridgeAssetsManager *)assetManager beginPullingAssetsForAdvertisingName:v17 completion:v18];
}

void __50__BPSRemoveMigrationWatchView_setAdvertisingName___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 408);
  id v3 = [NSNumber numberWithBool:a2];
  NSLog(&cfstr_PulledAssetsFo.isa, v2, v3);
}

- (void)layoutSubviews
{
  [(BPSRemoveMigrationWatchView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[BPSWatchView sizeThatFits:](self->_watch, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v12 = v11;
  double v14 = v13;
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  float v15 = (CGRectGetWidth(v21) - v12) * 0.5;
  double v16 = floorf(v15);
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  float v17 = (CGRectGetHeight(v22) - v14) * 0.5;
  watch = self->_watch;
  double v19 = floorf(v17);
  -[BPSWatchView setFrame:](watch, "setFrame:", v16, v19, v12, v14);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[BPSWatchView sizeThatFits:](self->_watch, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watch, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_advertisingName, 0);
}

@end