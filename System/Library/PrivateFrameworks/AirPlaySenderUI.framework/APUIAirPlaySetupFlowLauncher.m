@interface APUIAirPlaySetupFlowLauncher
+ (BOOL)launchAirPlayAutomaticSetupFlowWithConfiguration:(id)a3;
+ (BOOL)launchAirPlayManualSetupFlowForDiscoveryBroker:(id)a3;
+ (void)launchAirPlaySetupFlowWithUserInfo:(id)a3;
@end

@implementation APUIAirPlaySetupFlowLauncher

+ (BOOL)launchAirPlayAutomaticSetupFlowWithConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F01880] defaultWorkspace];
  if (!APSSettingsIsFeatureEnabled())
  {
    if (gLogCategory_APUIAirPlaySetupFlowLauncher <= 60
      && (gLogCategory_APUIAirPlaySetupFlowLauncher != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_21;
  }
  if (gLogCategory_APUIAirPlaySetupFlowLauncher <= 50
    && (gLogCategory_APUIAirPlaySetupFlowLauncher != -1 || _LogCategory_Initialize()))
  {
    id v11 = v3;
    LogPrintF();
  }
  v5 = objc_msgSend(v3, "urlString", v11);
  if (!v5)
  {
    APSLogErrorAt();
    goto LABEL_15;
  }
  uint64_t v6 = [NSURL URLWithString:v5];
  if (!v6)
  {
    APSLogErrorAt();

LABEL_21:
    LOBYTE(v5) = 0;
    goto LABEL_15;
  }
  v7 = (__CFString *)v6;
  if (gLogCategory_APUIAirPlaySetupFlowLauncher <= 50
    && (gLogCategory_APUIAirPlaySetupFlowLauncher != -1 || _LogCategory_Initialize()))
  {
    int v8 = IsAppleInternalBuild();
    v9 = @"#Redacted#";
    if (v8) {
      v9 = v7;
    }
    v12 = v9;
    LogPrintF();
  }
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v7, 0, v12);

  LOBYTE(v5) = 1;
LABEL_15:

  return (char)v5;
}

+ (BOOL)launchAirPlayManualSetupFlowForDiscoveryBroker:(id)a3
{
  id v3 = a3;
  if (gLogCategory_APUIAirPlaySetupFlowLauncher <= 50
    && (gLogCategory_APUIAirPlaySetupFlowLauncher != -1 || _LogCategory_Initialize()))
  {
    if (v3) {
      IsAppleInternalBuild();
    }
    LogPrintF();
  }

  return 0;
}

+ (void)launchAirPlaySetupFlowWithUserInfo:(id)a3
{
  v9 = (__CFString *)a3;
  id v3 = (void *)[objc_alloc(MEMORY[0x263F79410]) initWithServiceName:@"com.apple.APSUIApp" viewControllerClassName:@"APUISetupViewController"];
  id v4 = objc_alloc_init(MEMORY[0x263F79408]);
  id v5 = objc_alloc_init(MEMORY[0x263F793F8]);
  [v5 setReason:@"Display AirPlay user experience"];
  [v5 setUserInfo:v9];
  if (gLogCategory_APUIAirPlaySetupFlowLauncher <= 50
    && (gLogCategory_APUIAirPlaySetupFlowLauncher != -1 || _LogCategory_Initialize()))
  {
    if (v9 && !IsAppleInternalBuild()) {
      uint64_t v6 = @"#Redacted#";
    }
    else {
      uint64_t v6 = v9;
    }
    int v8 = v6;
    LogPrintF();
  }
  v7 = objc_msgSend(MEMORY[0x263F79428], "newHandleWithDefinition:configurationContext:", v3, v4, v8);
  [v7 activateWithContext:v5];
}

@end