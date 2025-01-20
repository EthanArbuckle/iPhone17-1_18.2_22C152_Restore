@interface GKBoopHandler
- (GKBoopHandler)init;
- (GKBoopHandler)initWithUrlProvider:(id)a3;
- (void)startNearbyDiscoveryWithCompletionHandler:(id)a3;
- (void)stopWithCompletionHandler:(id)a3;
@end

@implementation GKBoopHandler

- (GKBoopHandler)initWithUrlProvider:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  return (GKBoopHandler *)BoopHandler.init(urlProvider:)((uint64_t)sub_1AF45E1F4, v4);
}

- (void)startNearbyDiscoveryWithCompletionHandler:(id)a3
{
}

- (void)stopWithCompletionHandler:(id)a3
{
}

- (GKBoopHandler)init
{
}

- (void).cxx_destruct
{
}

@end