@interface AVOutputDevice
@end

@implementation AVOutputDevice

void __86__AVOutputDevice_AirPLayKit__openCommunicationChannelToDestination_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    v3 = [[APKCommunicationChannel alloc] initWithCommunicationChannel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end