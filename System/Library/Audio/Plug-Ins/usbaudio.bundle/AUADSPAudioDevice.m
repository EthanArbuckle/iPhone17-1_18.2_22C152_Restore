@interface AUADSPAudioDevice
- (AUADSPAudioDevice)initWithDeviceUID:(id)a3 underlyingDevice:(id)a4 deviceDSPDatabase:(id)a5 plugin:(id)a6;
- (unsigned)transportType;
@end

@implementation AUADSPAudioDevice

- (unsigned)transportType
{
  return *(_DWORD *)&self->ASDDSPAudioDevice_opaque[OBJC_IVAR___AUADSPAudioDevice__transportType];
}

- (AUADSPAudioDevice)initWithDeviceUID:(id)a3 underlyingDevice:(id)a4 deviceDSPDatabase:(id)a5 plugin:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  result = (AUADSPAudioDevice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end