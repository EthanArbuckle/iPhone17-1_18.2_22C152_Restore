@interface IMDeviceConditions
+ (id)sharedInstance;
- (BOOL)isDeviceCharging;
- (BOOL)isDeviceOnData;
- (BOOL)isDeviceOnWifi;
- (BOOL)isOnLowBandwidthCellular;
- (id)_batteryStatus;
- (id)_mobileNetworkManager;
@end

@implementation IMDeviceConditions

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A085AA94;
  block[3] = &unk_1E5A10168;
  block[4] = a1;
  if (qword_1EB4A6590 != -1) {
    dispatch_once(&qword_1EB4A6590, block);
  }
  v2 = (void *)qword_1EB4A66C0;

  return v2;
}

- (id)_mobileNetworkManager
{
  return (id)[MEMORY[0x1E4F6C378] sharedInstance];
}

- (BOOL)isDeviceOnWifi
{
  v2 = [(IMDeviceConditions *)self _mobileNetworkManager];
  char v3 = [v2 isWiFiUsable];

  return v3;
}

- (BOOL)isDeviceOnData
{
  v2 = [MEMORY[0x1E4F61758] sharedInstance];
  char v3 = [v2 dataActiveAndReachable];

  return v3;
}

- (BOOL)isOnLowBandwidthCellular
{
  if ([(IMDeviceConditions *)self isDeviceOnWifi]) {
    return 0;
  }

  return MEMORY[0x1F4181798](self, sel_isDeviceOnData);
}

- (id)_batteryStatus
{
  if (qword_1EB4A5D78 != -1) {
    dispatch_once(&qword_1EB4A5D78, &unk_1EF2BFB00);
  }
  v2 = (void *)qword_1EB4A5D70;

  return v2;
}

- (BOOL)isDeviceCharging
{
  v2 = [(IMDeviceConditions *)self _batteryStatus];
  char v3 = [v2 isCharging];

  return v3;
}

@end