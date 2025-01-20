@interface HSTPadFirmwareManager
- (void)_setEnabledInputsReport;
- (void)_setUSBChargingState:(id)a3;
@end

@implementation HSTPadFirmwareManager

- (void)_setEnabledInputsReport
{
  p_state = &self->super.super._state;
  unsigned __int16 touchMode = self->super.super._state.touchMode;
  [(HSTiOSFirmwareManager *)self setPowerState:touchMode];
  createEnabledInputsReport(touchMode, p_state->screenOrientation);
  setReport<HSTPipeline::FirmwareInterface::FeatureReport::EnabledInputs::Awake>((uint64_t)self->super.super._deviceObj);
}

- (void)_setUSBChargingState:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 usbChargingState];
  if (self->super.super._state.usbChargingState != v5)
  {
    self->super.super._state.usbChargingState = v5;
    v6 = MTLoggingPlugin();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self->super.super._state.usbChargingState == 1) {
        v7 = "Connected";
      }
      else {
        v7 = "NotConnected";
      }
      int v10 = 136446210;
      v11 = v7;
      _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_DEFAULT, "Setting USB charging state: %{public}s", (uint8_t *)&v10, 0xCu);
    }

    id deviceObj = self->super.super._deviceObj;
    if (self->super.super._state.usbChargingState == 1) {
      __int16 v9 = 6256;
    }
    else {
      __int16 v9 = 6512;
    }
    LOWORD(v10) = v9;
    setReport<HSTPipeline::FirmwareInterface::FeatureReport::HostEvent>((uint64_t)deviceObj);
  }
}

@end