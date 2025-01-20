@interface WFSettingsIntentHandler
- (void)createSettingsClientForIntent:(id)a3 completionHandler:(id)a4;
- (void)handleSetAirplaneMode:(id)a3 completion:(id)a4;
- (void)handleSetAlwaysOnDisplay:(id)a3 completion:(id)a4;
- (void)handleSetAnnounceNotifications:(id)a3 completion:(id)a4;
- (void)handleSetAppearance:(id)a3 completion:(id)a4;
- (void)handleSetBluetooth:(id)a3 completion:(id)a4;
- (void)handleSetBrightness:(id)a3 completion:(id)a4;
- (void)handleSetCellularData:(id)a3 completion:(id)a4;
- (void)handleSetFlashlight:(id)a3 completion:(id)a4;
- (void)handleSetLowPowerMode:(id)a3 completion:(id)a4;
- (void)handleSetNightShift:(id)a3 completion:(id)a4;
- (void)handleSetOrientationLock:(id)a3 completion:(id)a4;
- (void)handleSetPersonalHotspot:(id)a3 completion:(id)a4;
- (void)handleSetSilenceUnknownCallers:(id)a3 completion:(id)a4;
- (void)handleSetStageManager:(id)a3 completion:(id)a4;
- (void)handleSetTrueTone:(id)a3 completion:(id)a4;
- (void)handleSetWiFi:(id)a3 completion:(id)a4;
- (void)performSettingIntent:(id)a3 completionHandler:(id)a4;
- (void)resolveOperationForSetAirplaneMode:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForSetAlwaysOnDisplay:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForSetAppearance:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForSetBluetooth:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForSetCellularData:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForSetFlashlight:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForSetLowPowerMode:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForSetWiFi:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForSetAirplaneMode:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForSetAlwaysOnDisplay:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForSetBluetooth:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForSetCellularData:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForSetFlashlight:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForSetLowPowerMode:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForSetWiFi:(id)a3 withCompletion:(id)a4;
- (void)resolveStyleForSetAppearance:(id)a3 withCompletion:(id)a4;
- (void)resolveValueForSetBrightness:(id)a3 withCompletion:(id)a4;
- (void)resolveValueForSetFlashlight:(id)a3 withCompletion:(id)a4;
@end

@implementation WFSettingsIntentHandler

- (void)handleSetAlwaysOnDisplay:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__WFSettingsIntentHandler_handleSetAlwaysOnDisplay_completion___block_invoke;
  v8[3] = &unk_264E5CA00;
  id v9 = v6;
  id v7 = v6;
  [(WFSettingsIntentHandler *)self performSettingIntent:a3 completionHandler:v8];
}

void __63__WFSettingsIntentHandler_handleSetAlwaysOnDisplay_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 4;
  }
  v4 = [[WFSetAlwaysOnDisplayIntentResponse alloc] initWithCode:v3 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resolveStateForSetAlwaysOnDisplay:(id)a3 withCompletion:(id)a4
{
  id v6 = (void *)MEMORY[0x263F0F9D0];
  id v7 = a4;
  id v9 = [a3 state];
  v8 = objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)resolveOperationForSetAlwaysOnDisplay:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleSetStageManager:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__WFSettingsIntentHandler_handleSetStageManager_completion___block_invoke;
  v8[3] = &unk_264E5CA00;
  id v9 = v6;
  id v7 = v6;
  [(WFSettingsIntentHandler *)self performSettingIntent:a3 completionHandler:v8];
}

void __60__WFSettingsIntentHandler_handleSetStageManager_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 4;
  }
  v4 = [[WFSetStageManagerIntentResponse alloc] initWithCode:v3 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleSetAnnounceNotifications:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__WFSettingsIntentHandler_handleSetAnnounceNotifications_completion___block_invoke;
  v8[3] = &unk_264E5CA00;
  id v9 = v6;
  id v7 = v6;
  [(WFSettingsIntentHandler *)self performSettingIntent:a3 completionHandler:v8];
}

void __69__WFSettingsIntentHandler_handleSetAnnounceNotifications_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 4;
  }
  v4 = [[WFSetAnnounceNotificationsIntentResponse alloc] initWithCode:v3 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleSetTrueTone:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__WFSettingsIntentHandler_handleSetTrueTone_completion___block_invoke;
  v8[3] = &unk_264E5CA00;
  id v9 = v6;
  id v7 = v6;
  [(WFSettingsIntentHandler *)self performSettingIntent:a3 completionHandler:v8];
}

void __56__WFSettingsIntentHandler_handleSetTrueTone_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 code];
    uint64_t v4 = 5;
    if (v3 == 5) {
      uint64_t v4 = 101;
    }
    if (v3 == 4) {
      uint64_t v5 = 100;
    }
    else {
      uint64_t v5 = v4;
    }
  }
  else
  {
    uint64_t v5 = 4;
  }
  id v6 = [[WFSetTrueToneIntentResponse alloc] initWithCode:v5 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleSetNightShift:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__WFSettingsIntentHandler_handleSetNightShift_completion___block_invoke;
  v8[3] = &unk_264E5CA00;
  id v9 = v6;
  id v7 = v6;
  [(WFSettingsIntentHandler *)self performSettingIntent:a3 completionHandler:v8];
}

void __58__WFSettingsIntentHandler_handleSetNightShift_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = [a2 code];
    uint64_t v4 = 5;
    if (v3 == 5) {
      uint64_t v4 = 101;
    }
    if (v3 == 4) {
      uint64_t v5 = 100;
    }
    else {
      uint64_t v5 = v4;
    }
  }
  else
  {
    uint64_t v5 = 4;
  }
  id v6 = [[WFSetNightShiftIntentResponse alloc] initWithCode:v5 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleSetSilenceUnknownCallers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__WFSettingsIntentHandler_handleSetSilenceUnknownCallers_completion___block_invoke;
  v8[3] = &unk_264E5CA00;
  id v9 = v6;
  id v7 = v6;
  [(WFSettingsIntentHandler *)self performSettingIntent:a3 completionHandler:v8];
}

void __69__WFSettingsIntentHandler_handleSetSilenceUnknownCallers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 4;
  }
  uint64_t v4 = [[WFSetSilenceUnknownCallersIntentResponse alloc] initWithCode:v3 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleSetPersonalHotspot:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__WFSettingsIntentHandler_handleSetPersonalHotspot_completion___block_invoke;
  v8[3] = &unk_264E5CA00;
  id v9 = v6;
  id v7 = v6;
  [(WFSettingsIntentHandler *)self performSettingIntent:a3 completionHandler:v8];
}

void __63__WFSettingsIntentHandler_handleSetPersonalHotspot_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 4;
  }
  uint64_t v4 = [[WFSetPersonalHotspotIntentResponse alloc] initWithCode:v3 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleSetOrientationLock:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__WFSettingsIntentHandler_handleSetOrientationLock_completion___block_invoke;
  v8[3] = &unk_264E5CA00;
  id v9 = v6;
  id v7 = v6;
  [(WFSettingsIntentHandler *)self performSettingIntent:a3 completionHandler:v8];
}

void __63__WFSettingsIntentHandler_handleSetOrientationLock_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 4;
  }
  uint64_t v4 = [[WFSetOrientationLockIntentResponse alloc] initWithCode:v3 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resolveOperationForSetAppearance:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleSetAppearance:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__WFSettingsIntentHandler_handleSetAppearance_completion___block_invoke;
  v8[3] = &unk_264E5CA00;
  id v9 = v6;
  id v7 = v6;
  [(WFSettingsIntentHandler *)self performSettingIntent:a3 completionHandler:v8];
}

void __58__WFSettingsIntentHandler_handleSetAppearance_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 4;
  }
  uint64_t v4 = [[WFSetAppearanceIntentResponse alloc] initWithCode:v3 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resolveStyleForSetAppearance:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[WFDeviceAppearanceTypeResolutionResult successWithResolvedDeviceAppearanceType:](WFDeviceAppearanceTypeResolutionResult, "successWithResolvedDeviceAppearanceType:", [a3 style]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleSetFlashlight:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__WFSettingsIntentHandler_handleSetFlashlight_completion___block_invoke;
  v8[3] = &unk_264E5CA00;
  id v9 = v6;
  id v7 = v6;
  [(WFSettingsIntentHandler *)self performSettingIntent:a3 completionHandler:v8];
}

void __58__WFSettingsIntentHandler_handleSetFlashlight_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    uint64_t v4 = [v3 code];
    if ((unint64_t)(v4 - 4) > 3) {
      uint64_t v5 = 5;
    }
    else {
      uint64_t v5 = qword_23C71D120[v4 - 4];
    }
  }
  else
  {
    uint64_t v5 = 4;
  }
  id v6 = [[WFSetFlashlightIntentResponse alloc] initWithCode:v5 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resolveStateForSetFlashlight:(id)a3 withCompletion:(id)a4
{
  id v6 = (void *)MEMORY[0x263F0F9D0];
  id v7 = a4;
  id v9 = [a3 state];
  v8 = objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)resolveOperationForSetFlashlight:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveValueForSetFlashlight:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v8 = [a3 value];
  [v8 doubleValue];
  id v7 = +[WFSetFlashlightValueResolutionResult successWithResolvedValue:](WFSetFlashlightValueResolutionResult, "successWithResolvedValue:");
  (*((void (**)(id, void *))a4 + 2))(v6, v7);
}

- (void)handleSetBrightness:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__WFSettingsIntentHandler_handleSetBrightness_completion___block_invoke;
  v8[3] = &unk_264E5CA00;
  id v9 = v6;
  id v7 = v6;
  [(WFSettingsIntentHandler *)self performSettingIntent:a3 completionHandler:v8];
}

void __58__WFSettingsIntentHandler_handleSetBrightness_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if ([a2 code] == 4) {
      uint64_t v3 = 100;
    }
    else {
      uint64_t v3 = 5;
    }
  }
  else
  {
    uint64_t v3 = 4;
  }
  uint64_t v4 = [[WFSetBrightnessIntentResponse alloc] initWithCode:v3 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resolveValueForSetBrightness:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v8 = [a3 value];
  [v8 doubleValue];
  id v7 = +[WFSetBrightnessValueResolutionResult successWithResolvedValue:](WFSetBrightnessValueResolutionResult, "successWithResolvedValue:");
  (*((void (**)(id, void *))a4 + 2))(v6, v7);
}

- (void)handleSetLowPowerMode:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__WFSettingsIntentHandler_handleSetLowPowerMode_completion___block_invoke;
  v8[3] = &unk_264E5CA00;
  id v9 = v6;
  id v7 = v6;
  [(WFSettingsIntentHandler *)self performSettingIntent:a3 completionHandler:v8];
}

void __60__WFSettingsIntentHandler_handleSetLowPowerMode_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 4;
  }
  uint64_t v4 = [[WFSetLowPowerModeIntentResponse alloc] initWithCode:v3 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resolveStateForSetLowPowerMode:(id)a3 withCompletion:(id)a4
{
  id v6 = (void *)MEMORY[0x263F0F9D0];
  id v7 = a4;
  id v9 = [a3 state];
  id v8 = objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)resolveOperationForSetLowPowerMode:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleSetCellularData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__WFSettingsIntentHandler_handleSetCellularData_completion___block_invoke;
  v8[3] = &unk_264E5CA00;
  id v9 = v6;
  id v7 = v6;
  [(WFSettingsIntentHandler *)self performSettingIntent:a3 completionHandler:v8];
}

void __60__WFSettingsIntentHandler_handleSetCellularData_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 4;
  }
  uint64_t v4 = [[WFSetCellularDataIntentResponse alloc] initWithCode:v3 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resolveStateForSetCellularData:(id)a3 withCompletion:(id)a4
{
  id v6 = (void *)MEMORY[0x263F0F9D0];
  id v7 = a4;
  id v9 = [a3 state];
  id v8 = objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)resolveOperationForSetCellularData:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleSetBluetooth:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F338E8] defaultProfile];
  char v9 = [v8 isBluetoothModificationAllowed];

  if (v9)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__WFSettingsIntentHandler_handleSetBluetooth_completion___block_invoke;
    v11[3] = &unk_264E5CA00;
    id v12 = v7;
    [(WFSettingsIntentHandler *)self performSettingIntent:v6 completionHandler:v11];
  }
  else
  {
    v10 = [[WFSetBluetoothIntentResponse alloc] initWithCode:100 userActivity:0];
    (*((void (**)(id, WFSetBluetoothIntentResponse *))v7 + 2))(v7, v10);
  }
}

void __57__WFSettingsIntentHandler_handleSetBluetooth_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 4;
  }
  uint64_t v4 = [[WFSetBluetoothIntentResponse alloc] initWithCode:v3 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resolveStateForSetBluetooth:(id)a3 withCompletion:(id)a4
{
  id v6 = (void *)MEMORY[0x263F0F9D0];
  id v7 = a4;
  id v9 = [a3 state];
  id v8 = objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)resolveOperationForSetBluetooth:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleSetWiFi:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F338E8] defaultProfile];
  char v9 = [v8 isWiFiPowerModificationAllowed];

  if (v9)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __52__WFSettingsIntentHandler_handleSetWiFi_completion___block_invoke;
    v13[3] = &unk_264E5CA00;
    id v14 = v7;
    [(WFSettingsIntentHandler *)self performSettingIntent:v6 completionHandler:v13];
  }
  else
  {
    v10 = [MEMORY[0x263F85258] currentDevice];
    if ([v10 hasCapability:*MEMORY[0x263F85698]]) {
      uint64_t v11 = 102;
    }
    else {
      uint64_t v11 = 100;
    }

    id v12 = [[WFSetWiFiIntentResponse alloc] initWithCode:v11 userActivity:0];
    (*((void (**)(id, WFSetWiFiIntentResponse *))v7 + 2))(v7, v12);
  }
}

void __52__WFSettingsIntentHandler_handleSetWiFi_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [MEMORY[0x263F85258] currentDevice];
    if ([v3 hasCapability:*MEMORY[0x263F85698]]) {
      uint64_t v4 = 101;
    }
    else {
      uint64_t v4 = 5;
    }
  }
  else
  {
    uint64_t v4 = 4;
  }
  uint64_t v5 = [[WFSetWiFiIntentResponse alloc] initWithCode:v4 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resolveStateForSetWiFi:(id)a3 withCompletion:(id)a4
{
  id v6 = (void *)MEMORY[0x263F0F9D0];
  id v7 = a4;
  id v9 = [a3 state];
  id v8 = objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)resolveOperationForSetWiFi:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleSetAirplaneMode:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__WFSettingsIntentHandler_handleSetAirplaneMode_completion___block_invoke;
  v8[3] = &unk_264E5CA00;
  id v9 = v6;
  id v7 = v6;
  [(WFSettingsIntentHandler *)self performSettingIntent:a3 completionHandler:v8];
}

void __60__WFSettingsIntentHandler_handleSetAirplaneMode_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if ([a2 code] == 4) {
      uint64_t v3 = 100;
    }
    else {
      uint64_t v3 = 5;
    }
  }
  else
  {
    uint64_t v3 = 4;
  }
  uint64_t v4 = [[WFSetAirplaneModeIntentResponse alloc] initWithCode:v3 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resolveStateForSetAirplaneMode:(id)a3 withCompletion:(id)a4
{
  id v6 = (void *)MEMORY[0x263F0F9D0];
  id v7 = a4;
  id v9 = [a3 state];
  id v8 = objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)resolveOperationForSetAirplaneMode:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[WFBooleanSettingOperationResolutionResult successWithResolvedBooleanSettingOperation:](WFBooleanSettingOperationResolutionResult, "successWithResolvedBooleanSettingOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)performSettingIntent:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__WFSettingsIntentHandler_performSettingIntent_completionHandler___block_invoke;
  v10[3] = &unk_264E5C130;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  [(WFSettingsIntentHandler *)self createSettingsClientForIntent:v8 completionHandler:v10];
}

void __66__WFSettingsIntentHandler_performSettingIntent_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __66__WFSettingsIntentHandler_performSettingIntent_completionHandler___block_invoke_2;
    v5[3] = &unk_264E5CA00;
    uint64_t v3 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    [v3 applyWithSettingsClient:a2 completionHandler:v5];
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void __66__WFSettingsIntentHandler_performSettingIntent_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = getWFBundledIntentsLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "-[WFSettingsIntentHandler performSettingIntent:completionHandler:]_block_invoke_2";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_23C364000, v4, OS_LOG_TYPE_ERROR, "%s Performing setting intent failed with error %@", (uint8_t *)&v5, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createSettingsClientForIntent:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[a3 settingsClientClass];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__WFSettingsIntentHandler_createSettingsClientForIntent_completionHandler___block_invoke;
  v8[3] = &unk_264E5C108;
  id v9 = v5;
  v10 = v6;
  id v7 = v5;
  [v6 createClientWithCompletionHandler:v8];
}

void __75__WFSettingsIntentHandler_createSettingsClientForIntent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = getWFBundledIntentsLogObject();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = NSStringFromClass(*(Class *)(a1 + 40));
      int v11 = 136315394;
      id v12 = "-[WFSettingsIntentHandler createSettingsClientForIntent:completionHandler:]_block_invoke";
      __int16 v13 = 2114;
      id v14 = v9;
      _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_INFO, "%s Created client for setting %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v10 = NSStringFromClass(*(Class *)(a1 + 40));
    int v11 = 136315650;
    id v12 = "-[WFSettingsIntentHandler createSettingsClientForIntent:completionHandler:]_block_invoke";
    __int16 v13 = 2114;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_ERROR, "%s Creating client for setting %{public}@ failed with error %@", (uint8_t *)&v11, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end