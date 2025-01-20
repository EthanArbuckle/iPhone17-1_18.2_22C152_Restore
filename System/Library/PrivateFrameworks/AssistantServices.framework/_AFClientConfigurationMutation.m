@interface _AFClientConfigurationMutation
- (BOOL)getAreAnnouncementRequestsPermittedByPresentationWhileActive;
- (BOOL)getIsDeviceInCarDNDMode;
- (BOOL)getIsDeviceInStarkMode;
- (BOOL)getIsDeviceWatchAuthenticated;
- (BOOL)getSupportsCarPlayVehicleData;
- (BOOL)isDirty;
- (_AFClientConfigurationMutation)initWithBase:(id)a3;
- (float)getOutputVolume;
- (id)getAccessibilityState;
- (id)getDeviceSetupFlowBeginDate;
- (id)getDeviceSetupFlowEndDate;
- (id)getTapToSiriAudioPlaybackRequest;
- (id)getTwoShotAudioPlaybackRequest;
- (int64_t)getDeviceRingerSwitchState;
- (void)setAccessibilityState:(id)a3;
- (void)setAreAnnouncementRequestsPermittedByPresentationWhileActive:(BOOL)a3;
- (void)setDeviceRingerSwitchState:(int64_t)a3;
- (void)setDeviceSetupFlowBeginDate:(id)a3;
- (void)setDeviceSetupFlowEndDate:(id)a3;
- (void)setIsDeviceInCarDNDMode:(BOOL)a3;
- (void)setIsDeviceInStarkMode:(BOOL)a3;
- (void)setIsDeviceWatchAuthenticated:(BOOL)a3;
- (void)setOutputVolume:(float)a3;
- (void)setSupportsCarPlayVehicleData:(BOOL)a3;
- (void)setTapToSiriAudioPlaybackRequest:(id)a3;
- (void)setTwoShotAudioPlaybackRequest:(id)a3;
@end

@implementation _AFClientConfigurationMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSetupFlowEndDate, 0);
  objc_storeStrong((id *)&self->_deviceSetupFlowBeginDate, 0);
  objc_storeStrong((id *)&self->_twoShotAudioPlaybackRequest, 0);
  objc_storeStrong((id *)&self->_tapToSiriAudioPlaybackRequest, 0);
  objc_storeStrong((id *)&self->_accessibilityState, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setDeviceSetupFlowEndDate:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x1001u;
}

- (id)getDeviceSetupFlowEndDate
{
  if ((*(_WORD *)&self->_mutationFlags & 0x1000) != 0)
  {
    v2 = self->_deviceSetupFlowEndDate;
  }
  else
  {
    v2 = [(AFClientConfiguration *)self->_base deviceSetupFlowEndDate];
  }
  return v2;
}

- (void)setDeviceSetupFlowBeginDate:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (id)getDeviceSetupFlowBeginDate
{
  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
  {
    v2 = self->_deviceSetupFlowBeginDate;
  }
  else
  {
    v2 = [(AFClientConfiguration *)self->_base deviceSetupFlowBeginDate];
  }
  return v2;
}

- (void)setTwoShotAudioPlaybackRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getTwoShotAudioPlaybackRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_twoShotAudioPlaybackRequest;
  }
  else
  {
    v2 = [(AFClientConfiguration *)self->_base twoShotAudioPlaybackRequest];
  }
  return v2;
}

- (void)setTapToSiriAudioPlaybackRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getTapToSiriAudioPlaybackRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_tapToSiriAudioPlaybackRequest;
  }
  else
  {
    v2 = [(AFClientConfiguration *)self->_base tapToSiriAudioPlaybackRequest];
  }
  return v2;
}

- (void)setOutputVolume:(float)a3
{
  self->_outputVolume = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (float)getOutputVolume
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0) {
    return self->_outputVolume;
  }
  [(AFClientConfiguration *)self->_base outputVolume];
  return result;
}

- (void)setAreAnnouncementRequestsPermittedByPresentationWhileActive:(BOOL)a3
{
  self->_areAnnouncementRequestsPermittedByPresentationWhileActive = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (BOOL)getAreAnnouncementRequestsPermittedByPresentationWhileActive
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0) {
    return self->_areAnnouncementRequestsPermittedByPresentationWhileActive;
  }
  else {
    return [(AFClientConfiguration *)self->_base areAnnouncementRequestsPermittedByPresentationWhileActive];
  }
}

- (void)setIsDeviceWatchAuthenticated:(BOOL)a3
{
  self->_isDeviceWatchAuthenticated = a3;
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (BOOL)getIsDeviceWatchAuthenticated
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0) {
    return self->_isDeviceWatchAuthenticated;
  }
  else {
    return [(AFClientConfiguration *)self->_base isDeviceWatchAuthenticated];
  }
}

- (void)setSupportsCarPlayVehicleData:(BOOL)a3
{
  self->_supportsCarPlayVehicleData = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (BOOL)getSupportsCarPlayVehicleData
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0) {
    return self->_supportsCarPlayVehicleData;
  }
  else {
    return [(AFClientConfiguration *)self->_base supportsCarPlayVehicleData];
  }
}

- (void)setIsDeviceInStarkMode:(BOOL)a3
{
  self->_isDeviceInStarkMode = a3;
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (BOOL)getIsDeviceInStarkMode
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0) {
    return self->_isDeviceInStarkMode;
  }
  else {
    return [(AFClientConfiguration *)self->_base isDeviceInStarkMode];
  }
}

- (void)setIsDeviceInCarDNDMode:(BOOL)a3
{
  self->_isDeviceInCarDNDMode = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (BOOL)getIsDeviceInCarDNDMode
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0) {
    return self->_isDeviceInCarDNDMode;
  }
  else {
    return [(AFClientConfiguration *)self->_base isDeviceInCarDNDMode];
  }
}

- (void)setDeviceRingerSwitchState:(int64_t)a3
{
  self->_deviceRingerSwitchState = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (int64_t)getDeviceRingerSwitchState
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0) {
    return self->_deviceRingerSwitchState;
  }
  else {
    return [(AFClientConfiguration *)self->_base deviceRingerSwitchState];
  }
}

- (void)setAccessibilityState:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getAccessibilityState
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_accessibilityState;
  }
  else
  {
    v2 = [(AFClientConfiguration *)self->_base accessibilityState];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_AFClientConfigurationMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFClientConfigurationMutation;
  v6 = [(_AFClientConfigurationMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end