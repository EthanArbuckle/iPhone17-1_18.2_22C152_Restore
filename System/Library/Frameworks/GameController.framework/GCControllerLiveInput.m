@interface GCControllerLiveInput
- (GCControllerLiveInput)unmappedInput;
@end

@implementation GCControllerLiveInput

- (GCControllerLiveInput)unmappedInput
{
  return (GCControllerLiveInput *)[(_GCDevicePhysicalInputFacade *)self alternatePhysicalInputWithAttribute:@"unmapped"];
}

@end