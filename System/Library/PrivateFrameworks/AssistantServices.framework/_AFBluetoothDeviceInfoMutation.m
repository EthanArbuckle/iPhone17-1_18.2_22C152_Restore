@interface _AFBluetoothDeviceInfoMutation
- (BOOL)getIsAdvancedAppleAudioDevice;
- (BOOL)getSupportsAnnounceCall;
- (BOOL)getSupportsConversationAwareness;
- (BOOL)getSupportsInEarDetection;
- (BOOL)getSupportsJustSiri;
- (BOOL)getSupportsListeningModeANC;
- (BOOL)getSupportsListeningModeAutomatic;
- (BOOL)getSupportsListeningModeTransparency;
- (BOOL)getSupportsPersonalVolume;
- (BOOL)getSupportsSpokenNotification;
- (BOOL)getSupportsVoiceTrigger;
- (BOOL)isDirty;
- (_AFBluetoothDeviceInfoMutation)initWithBase:(id)a3;
- (id)getAddress;
- (id)getDeviceUID;
- (id)getHeadGestureConfiguration;
- (id)getName;
- (unsigned)getProductID;
- (unsigned)getVendorID;
- (void)setAddress:(id)a3;
- (void)setDeviceUID:(id)a3;
- (void)setHeadGestureConfiguration:(id)a3;
- (void)setIsAdvancedAppleAudioDevice:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setSupportsAnnounceCall:(BOOL)a3;
- (void)setSupportsConversationAwareness:(BOOL)a3;
- (void)setSupportsInEarDetection:(BOOL)a3;
- (void)setSupportsJustSiri:(BOOL)a3;
- (void)setSupportsListeningModeANC:(BOOL)a3;
- (void)setSupportsListeningModeAutomatic:(BOOL)a3;
- (void)setSupportsListeningModeTransparency:(BOOL)a3;
- (void)setSupportsPersonalVolume:(BOOL)a3;
- (void)setSupportsSpokenNotification:(BOOL)a3;
- (void)setSupportsVoiceTrigger:(BOOL)a3;
- (void)setVendorID:(unsigned int)a3;
@end

@implementation _AFBluetoothDeviceInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headGestureConfiguration, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setHeadGestureConfiguration:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x20001u;
}

- (id)getHeadGestureConfiguration
{
  if ((*((unsigned char *)&self->_mutationFlags + 2) & 2) != 0)
  {
    v2 = self->_headGestureConfiguration;
  }
  else
  {
    v2 = [(AFBluetoothDeviceInfo *)self->_base headGestureConfiguration];
  }
  return v2;
}

- (void)setSupportsAnnounceCall:(BOOL)a3
{
  self->_supportsAnnounceCall = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x10001u;
}

- (BOOL)getSupportsAnnounceCall
{
  if (*((unsigned char *)&self->_mutationFlags + 2)) {
    return self->_supportsAnnounceCall;
  }
  else {
    return [(AFBluetoothDeviceInfo *)self->_base supportsAnnounceCall];
  }
}

- (void)setSupportsPersonalVolume:(BOOL)a3
{
  self->_supportsPersonalVolume = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x8001u;
}

- (BOOL)getSupportsPersonalVolume
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x80) != 0) {
    return self->_supportsPersonalVolume;
  }
  else {
    return [(AFBluetoothDeviceInfo *)self->_base supportsPersonalVolume];
  }
}

- (void)setSupportsConversationAwareness:(BOOL)a3
{
  self->_supportsConversationAwareness = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x4001u;
}

- (BOOL)getSupportsConversationAwareness
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x40) != 0) {
    return self->_supportsConversationAwareness;
  }
  else {
    return [(AFBluetoothDeviceInfo *)self->_base supportsConversationAwareness];
  }
}

- (void)setSupportsListeningModeAutomatic:(BOOL)a3
{
  self->_supportsListeningModeAutomatic = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x2001u;
}

- (BOOL)getSupportsListeningModeAutomatic
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x20) != 0) {
    return self->_supportsListeningModeAutomatic;
  }
  else {
    return [(AFBluetoothDeviceInfo *)self->_base supportsListeningModeAutomatic];
  }
}

- (void)setSupportsListeningModeTransparency:(BOOL)a3
{
  self->_supportsListeningModeTransparency = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x1001u;
}

- (BOOL)getSupportsListeningModeTransparency
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x10) != 0) {
    return self->_supportsListeningModeTransparency;
  }
  else {
    return [(AFBluetoothDeviceInfo *)self->_base supportsListeningModeTransparency];
  }
}

- (void)setSupportsListeningModeANC:(BOOL)a3
{
  self->_supportsListeningModeANC = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x801u;
}

- (BOOL)getSupportsListeningModeANC
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 8) != 0) {
    return self->_supportsListeningModeANC;
  }
  else {
    return [(AFBluetoothDeviceInfo *)self->_base supportsListeningModeANC];
  }
}

- (void)setSupportsSpokenNotification:(BOOL)a3
{
  self->_supportsSpokenNotification = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x401u;
}

- (BOOL)getSupportsSpokenNotification
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 4) != 0) {
    return self->_supportsSpokenNotification;
  }
  else {
    return [(AFBluetoothDeviceInfo *)self->_base supportsSpokenNotification];
  }
}

- (void)setSupportsJustSiri:(BOOL)a3
{
  self->_supportsJustSiri = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x201u;
}

- (BOOL)getSupportsJustSiri
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 2) != 0) {
    return self->_supportsJustSiri;
  }
  else {
    return [(AFBluetoothDeviceInfo *)self->_base supportsJustSiri];
  }
}

- (void)setSupportsVoiceTrigger:(BOOL)a3
{
  self->_supportsVoiceTrigger = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x101u;
}

- (BOOL)getSupportsVoiceTrigger
{
  if (*((unsigned char *)&self->_mutationFlags + 1)) {
    return self->_supportsVoiceTrigger;
  }
  else {
    return [(AFBluetoothDeviceInfo *)self->_base supportsVoiceTrigger];
  }
}

- (void)setSupportsInEarDetection:(BOOL)a3
{
  self->_supportsInEarDetection = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x81u;
}

- (BOOL)getSupportsInEarDetection
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x80) != 0) {
    return self->_supportsInEarDetection;
  }
  else {
    return [(AFBluetoothDeviceInfo *)self->_base supportsInEarDetection];
  }
}

- (void)setIsAdvancedAppleAudioDevice:(BOOL)a3
{
  self->_isAdvancedAppleAudioDevice = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x41u;
}

- (BOOL)getIsAdvancedAppleAudioDevice
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x40) != 0) {
    return self->_isAdvancedAppleAudioDevice;
  }
  else {
    return [(AFBluetoothDeviceInfo *)self->_base isAdvancedAppleAudioDevice];
  }
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x21u;
}

- (unsigned)getProductID
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0) {
    return self->_productID;
  }
  else {
    return [(AFBluetoothDeviceInfo *)self->_base productID];
  }
}

- (void)setVendorID:(unsigned int)a3
{
  self->_vendorID = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x11u;
}

- (unsigned)getVendorID
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
    return self->_vendorID;
  }
  else {
    return [(AFBluetoothDeviceInfo *)self->_base vendorID];
  }
}

- (void)setDeviceUID:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 9u;
}

- (id)getDeviceUID
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_deviceUID;
  }
  else
  {
    v2 = [(AFBluetoothDeviceInfo *)self->_base deviceUID];
  }
  return v2;
}

- (void)setName:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 5u;
}

- (id)getName
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_name;
  }
  else
  {
    v2 = [(AFBluetoothDeviceInfo *)self->_base name];
  }
  return v2;
}

- (void)setAddress:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 3u;
}

- (id)getAddress
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_address;
  }
  else
  {
    v2 = [(AFBluetoothDeviceInfo *)self->_base address];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_DWORD *)&self->_mutationFlags & 1;
}

- (_AFBluetoothDeviceInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFBluetoothDeviceInfoMutation;
  v6 = [(_AFBluetoothDeviceInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end