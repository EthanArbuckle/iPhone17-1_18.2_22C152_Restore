@interface CALNSyntheticRouteHypothesizerProvider
+ (CALNSyntheticRouteHypothesizerProvider)sharedInstance;
- (CADSyntheticRouteHypothesizerCache)syntheticRouteHypothesizerCache;
- (CALNSyntheticRouteHypothesizerProvider)init;
- (id)hypothesizerForPlannedDestination:(id)a3;
- (void)createdRouteHypothesizer:(id)a3 forEventExternalURL:(id)a4;
- (void)removedRouteHypothesizerForEventExternalURL:(id)a3;
@end

@implementation CALNSyntheticRouteHypothesizerProvider

+ (CALNSyntheticRouteHypothesizerProvider)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CALNSyntheticRouteHypothesizerProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_3;
  return (CALNSyntheticRouteHypothesizerProvider *)v2;
}

uint64_t __56__CALNSyntheticRouteHypothesizerProvider_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_3 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (CALNSyntheticRouteHypothesizerProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)CALNSyntheticRouteHypothesizerProvider;
  v2 = [(CALNSyntheticRouteHypothesizerProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F2FD40] sharedInstance];
    syntheticRouteHypothesizerCache = v2->_syntheticRouteHypothesizerCache;
    v2->_syntheticRouteHypothesizerCache = (CADSyntheticRouteHypothesizerCache *)v3;
  }
  return v2;
}

- (id)hypothesizerForPlannedDestination:(id)a3
{
  uint64_t v3 = objc_alloc_init(CALNSyntheticRouteHypothesizer);
  return v3;
}

- (void)createdRouteHypothesizer:(id)a3 forEventExternalURL:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v9 conformsToProtocol:&unk_26D3C93C8])
  {
    id v7 = v9;
    v8 = [(CALNSyntheticRouteHypothesizerProvider *)self syntheticRouteHypothesizerCache];
    [v8 addSyntheticRouteHypothesizer:v7 forEventExternalURL:v6];
  }
}

- (void)removedRouteHypothesizerForEventExternalURL:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNSyntheticRouteHypothesizerProvider *)self syntheticRouteHypothesizerCache];
  [v5 removeSyntheticRouteHypothesizerForEventExternalURL:v4];
}

- (CADSyntheticRouteHypothesizerCache)syntheticRouteHypothesizerCache
{
  return self->_syntheticRouteHypothesizerCache;
}

- (void).cxx_destruct
{
}

@end