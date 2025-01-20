@interface HMDMPCAssistantRemoteControlDestinationFactory
- (id)mutableCopyForMPCDestination:(id)a3;
- (id)nowPlayingApplicationDestination;
- (id)systemMediaApplicationDestination;
- (void)resolveMPCDestination:(id)a3 withHashedRouteIdentifiers:(id)a4 audioRoutingInfo:(id)a5 completion:(id)a6;
@end

@implementation HMDMPCAssistantRemoteControlDestinationFactory

- (id)mutableCopyForMPCDestination:(id)a3
{
  return (id)[a3 mutableCopy];
}

- (void)resolveMPCDestination:(id)a3 withHashedRouteIdentifiers:(id)a4 audioRoutingInfo:(id)a5 completion:(id)a6
{
}

- (id)systemMediaApplicationDestination
{
  return (id)[MEMORY[0x263F547D0] systemMediaApplicationDestination];
}

- (id)nowPlayingApplicationDestination
{
  return (id)[MEMORY[0x263F547D0] nowPlayingApplicationDestination];
}

@end