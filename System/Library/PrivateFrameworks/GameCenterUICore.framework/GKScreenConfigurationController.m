@interface GKScreenConfigurationController
+ (double)_scaleForCurrentDisplayConfiguration;
+ (id)sharedController;
- (GKEventEmitter)emitter;
- (GKScreenConfigurationController)init;
- (double)greatestScreenScale;
- (void)_screensDidChange:(id)a3;
- (void)registerListener:(id)a3;
- (void)setEmitter:(id)a3;
- (void)unregisterListener:(id)a3;
@end

@implementation GKScreenConfigurationController

+ (id)sharedController
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__GKScreenConfigurationController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, block);
  }
  v2 = (void *)sharedController_sharedController;
  return v2;
}

uint64_t __51__GKScreenConfigurationController_sharedController__block_invoke()
{
  sharedController_sharedController = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

+ (double)_scaleForCurrentDisplayConfiguration
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [MEMORY[0x263F1C920] screens];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__GKScreenConfigurationController__scaleForCurrentDisplayConfiguration__block_invoke;
  v5[3] = &unk_26478A3B0;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __71__GKScreenConfigurationController__scaleForCurrentDisplayConfiguration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 scale];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 > *(double *)(v5 + 24)) {
    *(double *)(v5 + 24) = v4;
  }
  return result;
}

- (GKScreenConfigurationController)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKScreenConfigurationController;
  v2 = [(GKScreenConfigurationController *)&v5 init];
  if (v2)
  {
    [(id)objc_opt_class() _scaleForCurrentDisplayConfiguration];
    v2->_greatestScreenScale = v3;
  }
  return v2;
}

- (void)registerListener:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__GKScreenConfigurationController_registerListener___block_invoke;
  block[3] = &unk_26478A098;
  block[4] = self;
  if (registerListener__onceToken != -1) {
    dispatch_once(&registerListener__onceToken, block);
  }
  objc_super v5 = [(GKScreenConfigurationController *)self emitter];
  [v5 registerListener:v4];
  if ([v5 listenerRegisteredForSelector:sel_greatestScreenScaleDidChange_])
  {
    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:self selector:sel__screensDidChange_ name:*MEMORY[0x263F1D5A8] object:0];
    [v6 addObserver:self selector:sel__screensDidChange_ name:*MEMORY[0x263F1D5B0] object:0];
    [v6 addObserver:self selector:sel__screensDidChange_ name:*MEMORY[0x263F1D5B8] object:0];
  }
}

void __52__GKScreenConfigurationController_registerListener___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F401C8];
  v5[0] = &unk_26D9F6690;
  double v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v4 = [v2 eventEmitterForProtocols:v3];
  [*(id *)(a1 + 32) setEmitter:v4];
}

- (void)unregisterListener:(id)a3
{
  id v4 = a3;
  id v6 = [(GKScreenConfigurationController *)self emitter];
  [v6 unregisterListener:v4];

  if (([v6 listenerRegisteredForSelector:sel_greatestScreenScaleDidChange_] & 1) == 0)
  {
    objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 removeObserver:self];
  }
}

- (void)_screensDidChange:(id)a3
{
  [(id)objc_opt_class() _scaleForCurrentDisplayConfiguration];
  double v5 = v4;
  if (self->_greatestScreenScale != v4)
  {
    self->_greatestScreenScale = v4;
    id v6 = [(GKScreenConfigurationController *)self emitter];
    [v6 greatestScreenScaleDidChange:v5];
  }
}

- (GKEventEmitter)emitter
{
  return self->_emitter;
}

- (void)setEmitter:(id)a3
{
}

- (double)greatestScreenScale
{
  return self->_greatestScreenScale;
}

- (void).cxx_destruct
{
}

@end