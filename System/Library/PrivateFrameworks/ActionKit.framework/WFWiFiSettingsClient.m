@interface WFWiFiSettingsClient
+ (void)createClientWithCompletionHandler:(id)a3;
- (CWFInterface)interface;
- (WFWiFiSettingsClient)initWithInterface:(id)a3;
- (id)BSSID;
- (id)RSSI;
- (id)channel;
- (id)hardwareMACAddress;
- (id)networkName;
- (id)noise;
- (id)rxRate;
- (id)txRate;
- (id)wifiStandard;
- (void)dealloc;
- (void)getStateWithCompletionHandler:(id)a3;
- (void)setState:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation WFWiFiSettingsClient

- (void).cxx_destruct
{
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, id))a4;
  v7 = [(WFWiFiSettingsClient *)self interface];
  int v8 = [v7 powerOn];

  if (v8 == v4)
  {
    id v11 = 0;
  }
  else
  {
    v9 = getWFBundledIntentsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFWiFiSettingsClient setState:completionHandler:]";
      __int16 v15 = 1024;
      BOOL v16 = v4;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_INFO, "%s Set Wi-Fi state to %d", buf, 0x12u);
    }

    v10 = [(WFWiFiSettingsClient *)self interface];
    id v12 = 0;
    [v10 setPower:v4 error:&v12];
    id v11 = v12;
  }
  v6[2](v6, v11);
}

- (void)getStateWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(WFWiFiSettingsClient *)self interface];
  uint64_t v6 = [v5 powerOn];

  v7 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    v9 = "-[WFWiFiSettingsClient getStateWithCompletionHandler:]";
    __int16 v10 = 1024;
    int v11 = v6;
    _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_INFO, "%s Retrieved Wi-Fi state: %d", (uint8_t *)&v8, 0x12u);
  }

  v4[2](v4, v6, 0);
}

- (id)wifiStandard
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(WFWiFiSettingsClient *)self interface];
  int v4 = [v3 PHYMode];

  if (v4 > 31)
  {
    if (v4 > 255)
    {
      switch(v4)
      {
        case 256:
          return @"802.11ax";
        case 512:
          return @"802.11be - Wi-Fi 7";
        case 1024:
          return @"802.11ax - Wi-Fi 6E";
      }
    }
    else
    {
      switch(v4)
      {
        case 32:
          return @"802.11a Turbo";
        case 64:
          return @"802.11g Turbo";
        case 128:
          return @"802.11ac";
      }
    }
LABEL_15:
    uint64_t v6 = getWFBundledIntentsLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [(WFWiFiSettingsClient *)self interface];
      int v8 = 136315394;
      v9 = "-[WFWiFiSettingsClient wifiStandard]";
      __int16 v10 = 1024;
      int v11 = [v7 PHYMode];
      _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_ERROR, "%s Unkown Wi-Fi PHYMode: %d", (uint8_t *)&v8, 0x12u);
    }
    return 0;
  }
  else
  {
    id result = 0;
    switch(v4)
    {
      case 0:
        return result;
      case 1:
        id result = @"Auto";
        break;
      case 2:
        id result = @"802.11a";
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_15;
      case 4:
        id result = @"802.11b";
        break;
      case 8:
        id result = @"802.11g";
        break;
      default:
        if (v4 != 16) {
          goto LABEL_15;
        }
        id result = @"802.11n";
        break;
    }
  }
  return result;
}

- (id)channel
{
  v2 = NSNumber;
  v3 = [(WFWiFiSettingsClient *)self interface];
  int v4 = [v3 channel];
  v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "channel"));

  return v5;
}

- (id)hardwareMACAddress
{
  v2 = [(WFWiFiSettingsClient *)self interface];
  v3 = [v2 hardwareMACAddress];

  return v3;
}

- (id)noise
{
  v2 = [(WFWiFiSettingsClient *)self interface];
  uint64_t v3 = [v2 noise];

  if (v3)
  {
    int v4 = [NSNumber numberWithInteger:v3];
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

- (id)RSSI
{
  v2 = [(WFWiFiSettingsClient *)self interface];
  uint64_t v3 = [v2 RSSI];

  if (v3)
  {
    int v4 = [NSNumber numberWithInteger:v3];
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

- (id)rxRate
{
  v2 = [(WFWiFiSettingsClient *)self interface];
  uint64_t v3 = [v2 cachedLinkQualityMetric];
  [v3 rxRate];
  double v5 = v4;

  if (v5 == 0.0)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [NSNumber numberWithDouble:v5];
  }
  return v6;
}

- (id)txRate
{
  v2 = [(WFWiFiSettingsClient *)self interface];
  uint64_t v3 = [v2 cachedLinkQualityMetric];
  [v3 txRate];
  double v5 = v4;

  if (v5 == 0.0)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [NSNumber numberWithDouble:v5];
  }
  return v6;
}

- (id)BSSID
{
  v2 = [(WFWiFiSettingsClient *)self interface];
  uint64_t v3 = [v2 BSSID];

  return v3;
}

- (id)networkName
{
  v2 = [(WFWiFiSettingsClient *)self interface];
  uint64_t v3 = [v2 networkName];

  return v3;
}

- (void)dealloc
{
  [(CWFInterface *)self->_interface invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WFWiFiSettingsClient;
  [(WFWiFiSettingsClient *)&v3 dealloc];
}

- (WFWiFiSettingsClient)initWithInterface:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    int v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFWiFiSettingsClient.m", 48, @"Invalid parameter not satisfying: %@", @"interface" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFWiFiSettingsClient;
  v7 = [(WFWiFiSettingsClient *)&v12 init];
  int v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_interface, a3);
    v9 = v8;
  }

  return v8;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  double v4 = (void (**)(id, void *, void))a3;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2050000000;
  double v5 = (void *)getCWFInterfaceClass_softClass;
  uint64_t v13 = getCWFInterfaceClass_softClass;
  if (!getCWFInterfaceClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getCWFInterfaceClass_block_invoke;
    v9[3] = &unk_264E5EC88;
    v9[4] = &v10;
    __getCWFInterfaceClass_block_invoke((uint64_t)v9);
    double v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  v7 = (void *)[[v6 alloc] initWithServiceType:2];
  [v7 resume];
  int v8 = (void *)[objc_alloc((Class)a1) initWithInterface:v7];
  v4[2](v4, v8, 0);
}

@end