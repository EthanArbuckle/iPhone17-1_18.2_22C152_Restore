@interface AVOutputDevice(AirPLayKit)
- (uint64_t)supportsCommunicationChannelToDestination:()AirPLayKit;
- (void)openCommunicationChannelToDestination:()AirPLayKit completionHandler:;
@end

@implementation AVOutputDevice(AirPLayKit)

- (uint64_t)supportsCommunicationChannelToDestination:()AirPLayKit
{
  int v4 = [a3 isEqualToString:@"APKOutputDeviceCommunicationChannelDataDestinationFitness"];
  return v4 & [a1 supportsFitnessDataDestination];
}

- (void)openCommunicationChannelToDestination:()AirPLayKit completionHandler:
{
  v6 = a3;
  id v7 = a4;
  if ([a1 supportsCommunicationChannelToDestination:v6])
  {
    v8 = AVDataDestinationForAPKDataDestination(v6);
    if (v8)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __86__AVOutputDevice_AirPLayKit__openCommunicationChannelToDestination_completionHandler___block_invoke;
      v10[3] = &unk_264D84DB0;
      id v11 = v7;
      [a1 openCommunicationChannelToDestination:v8 options:0 completionHandler:v10];
    }
    else
    {
      v9 = [MEMORY[0x263F087E8] errorWithDomain:@"APKOutputDeviceErrorDomain" code:0 userInfo:0];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
    }
  }
  else
  {
    v8 = [MEMORY[0x263F087E8] errorWithDomain:@"APKOutputDeviceErrorDomain" code:1 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v8);
  }
}

@end