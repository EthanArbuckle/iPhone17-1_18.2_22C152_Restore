@interface AXBLocalizationCaptionController
+ (id)controller;
- (void)_updateFeature;
- (void)initializeMonitor;
@end

@implementation AXBLocalizationCaptionController

+ (id)controller
{
  if (controller_onceToken_1 != -1) {
    dispatch_once(&controller_onceToken_1, &__block_literal_global_14);
  }
  v2 = (void *)controller_SharedManager;

  return v2;
}

uint64_t __46__AXBLocalizationCaptionController_controller__block_invoke()
{
  controller_SharedManager = objc_alloc_init(AXBLocalizationCaptionController);

  return MEMORY[0x270F9A758]();
}

- (void)initializeMonitor
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__updateFeature name:*MEMORY[0x263F8B2F8] object:0];

  [(AXBLocalizationCaptionController *)self _updateFeature];
}

- (void)_updateFeature
{
  v3 = [MEMORY[0x263F22938] sharedInstance];
  int v4 = [v3 localizationQACaptionMode];

  if (v4)
  {
    [MEMORY[0x263F214B8] startService];
    self->_wasEnabled = 1;
  }
  else if (self->_wasEnabled)
  {
    v5 = (void *)MEMORY[0x263F214B8];
    [v5 stopService];
  }
}

@end