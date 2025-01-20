@interface CALNGEORouteHypothesizerProvider
+ (CALNGEORouteHypothesizerProvider)sharedInstance;
- (id)hypothesizerForPlannedDestination:(id)a3;
- (void)didDismissUINotification:(unint64_t)a3 forPlannedDestination:(id)a4 dismissalType:(unint64_t)a5;
@end

@implementation CALNGEORouteHypothesizerProvider

+ (CALNGEORouteHypothesizerProvider)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__CALNGEORouteHypothesizerProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_6;
  return (CALNGEORouteHypothesizerProvider *)v2;
}

uint64_t __50__CALNGEORouteHypothesizerProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_6 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (id)hypothesizerForPlannedDestination:(id)a3
{
  v3 = [MEMORY[0x263F41BD8] hypothesizerForPlannedDestination:a3];
  v4 = [[CALNGEORouteHypothesizer alloc] initWithRouteHypothesizer:v3];

  return v4;
}

- (void)didDismissUINotification:(unint64_t)a3 forPlannedDestination:(id)a4 dismissalType:(unint64_t)a5
{
}

@end