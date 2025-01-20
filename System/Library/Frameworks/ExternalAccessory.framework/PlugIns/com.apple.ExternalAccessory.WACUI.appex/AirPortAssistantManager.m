@interface AirPortAssistantManager
- (AirPortAssistantController)airportAssistantController;
- (AirPortAssistantManager)init;
- (AirPortAssistantManagerDelegate)delegate;
- (void)airPortAssistantComplete:(id)a3 result:(int)a4 context:(id)a5 animated:(BOOL)a6;
- (void)setAirportAssistantController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startSearchingForUnconfiguredAccessories;
- (void)stopSearchingForUnconfiguredAccessories;
- (void)wacDevicesAdded:(id)a3 andWACDevicesRemoved:(id)a4 withController:(id)a5;
@end

@implementation AirPortAssistantManager

- (AirPortAssistantManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AirPortAssistantManager;
  v2 = [(AirPortAssistantManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[AirPortAssistantController sharedInstance];
    airportAssistantController = v2->_airportAssistantController;
    v2->_airportAssistantController = (AirPortAssistantController *)v3;

    [(AirPortAssistantController *)v2->_airportAssistantController setDelegate:v2];
    v2->__debugLog = +[WACLogging isEnabled];
  }
  return v2;
}

- (void)startSearchingForUnconfiguredAccessories
{
  if (self->__debugLog) {
    NSLog(@"Plugin: AirPortAssistantManager startSearchingForUnconfiguredAccessories", a2);
  }
  id v3 = [(AirPortAssistantController *)self->_airportAssistantController start2_4WiFiScan];
  int v4 = (int)v3;
  if (self->__debugLog) {
    NSLog(@"Plugin: Start Scan status: %d", v3);
  }
  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v10 = WeakRetained;
LABEL_12:
    uint64_t v9 = 2;
    goto LABEL_14;
  }
  id v6 = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = v6;
  if (v4 == -6709)
  {
    [v6 updateState:1];

    [(AirPortAssistantController *)self->_airportAssistantController stop2_4WiFiScan];
    id v7 = [(AirPortAssistantController *)self->_airportAssistantController start2_4WiFiScan];
    int v8 = (int)v7;
    if (self->__debugLog) {
      NSLog(@"Plugin: Start Scan status: %d", v7);
    }
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    if (!v8)
    {
      id WeakRetained = v10;
      goto LABEL_12;
    }
  }
  id WeakRetained = v10;
  uint64_t v9 = 0;
LABEL_14:
  [WeakRetained updateState:v9];
}

- (void)stopSearchingForUnconfiguredAccessories
{
  if (self->__debugLog) {
    NSLog(@"Plugin: AirPortAssistantManager stopSearchingForUnconfiguredAccessories", a2);
  }
  [(AirPortAssistantController *)self->_airportAssistantController stop2_4WiFiScan];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained updateState:1];
}

- (void)wacDevicesAdded:(id)a3 andWACDevicesRemoved:(id)a4 withController:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self->__debugLog)
  {
    NSLog(@"Plugin: AirPortAssistantManager wacDevicesAdded:andWACDevicesRemoved:withController");
    if (self->__debugLog)
    {
      NSLog(@"Plugin: Devices Added: %@", v11);
      if (self->__debugLog) {
        NSLog(@"Plugin: Devices Removed: %@", v8);
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained wacDevicesAdded:v11 andWACDevicesRemoved:v8];
}

- (void)airPortAssistantComplete:(id)a3 result:(int)a4 context:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a4;
  id v12 = a5;
  if (self->__debugLog) {
    NSLog(@"Plugin: Scan Complete, Result: %d", v7);
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained airPortAssistantCompleteWithResult:v7 context:v12 animated:v6];

  id v11 = objc_loadWeakRetained((id *)p_delegate);
  [v11 updateState:1];
}

- (AirPortAssistantManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AirPortAssistantManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AirPortAssistantController)airportAssistantController
{
  return (AirPortAssistantController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAirportAssistantController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airportAssistantController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end