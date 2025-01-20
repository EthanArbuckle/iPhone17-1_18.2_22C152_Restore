@interface CUICalibration
+ (void)dismissCalibrationAlert;
+ (void)showCalibrationAlert;
@end

@implementation CUICalibration

+ (void)showCalibrationAlert
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.compass"];
  v3 = [MEMORY[0x263F41B90] sharedPlatform];
  if (![v3 isInternalInstall])
  {

    goto LABEL_5;
  }
  int v4 = [v2 BOOLForKey:@"CalibrationDisabled"];

  if (!v4)
  {
LABEL_5:
    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E9BF490];
    v6 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.CompassCalibration"];
    [v6 setRemoteObjectInterface:v5];
    [v6 resume];
    v7 = [v6 remoteObjectProxy];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_236735A08;
    v9[3] = &unk_264CAC108;
    id v10 = v6;
    id v8 = v6;
    [v7 showCalibrationAlert:v9];

    goto LABEL_6;
  }
  NSLog(&cfstr_TheCalibration.isa);
LABEL_6:
}

+ (void)dismissCalibrationAlert
{
}

@end