@interface MPCPlaybackEngineEventTypeIsCacheable
@end

@implementation MPCPlaybackEngineEventTypeIsCacheable

uint64_t ___MPCPlaybackEngineEventTypeIsCacheable_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:512 capacity:30];
  v1 = (void *)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes;
  _MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes = v0;

  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"session-begin"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"session-restore-begin"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"session-end"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"remote-control-begin"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"remote-control-end"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"queue-load-begin"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"queue-add"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"queue-load-end"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"container-begin"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"container-end"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"item-begin"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"item-end"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"asset-load-begin"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"asset-load-end"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"playback-behavior-changed"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"item-hls-stream-begin"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"item-hls-stream-end"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"device-changed"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"network-type-changed"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"network-reachability-changed"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"account-begin"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"account-update"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"item-update"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"item-key-request-begin"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"item-configuration-begin"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"time-control-status-changed"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"player-operation-begin"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"reload-current-item-begin"];
  [(id)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes addObject:@"session-activation-begin"];
  v2 = (void *)_MPCPlaybackEngineEventTypeIsCacheable_cacheableTypes;

  return [v2 addObject:@"session-activation-end"];
}

@end