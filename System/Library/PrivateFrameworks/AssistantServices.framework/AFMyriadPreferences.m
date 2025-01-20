@interface AFMyriadPreferences
- (AFMyriadPreferences)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4;
- (BOOL)BLEActivityEnabled;
- (BOOL)coordinationEnabled;
- (BOOL)coordinationEnabledForAccessoryLogging;
- (BOOL)ignoreAdjustedBoost;
- (BOOL)ignorePlatformBias;
- (BOOL)myriadServerHasProvisioned;
- (double)deviceDelay;
- (double)deviceSlowDown;
- (double)deviceTrumpDelay;
- (double)maxNoOperationDelay;
- (double)testDeviceDelay;
- (double)voiceTriggerEndtimeDelayThreshold;
- (float)deviceAdjust;
- (int)constantGoodnessScore;
- (unsigned)deviceClass;
- (unsigned)deviceGroup;
- (void)enableCoordination:(BOOL)a3;
- (void)setConstantGoodnessScore:(int)a3;
- (void)setDeviceAdjust:(float)a3;
- (void)setDeviceClass:(unsigned __int8)a3;
- (void)setDeviceDelay:(double)a3;
- (void)setDeviceGroup:(unsigned __int8)a3 completion:(id)a4;
- (void)setDeviceSlowDown:(double)a3;
- (void)setDeviceTrumpDelay:(double)a3;
- (void)setIgnoreAdjustedBoost:(BOOL)a3;
- (void)setIgnorePlatformBias:(BOOL)a3;
- (void)setMaxNoOperationDelay:(double)a3;
- (void)setTestDeviceDelay:(double)a3;
- (void)setVoiceTriggerEndtimeDelayThreshold:(double)a3;
@end

@implementation AFMyriadPreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pref, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
}

- (double)maxNoOperationDelay
{
  [(AFPreferences *)self->_pref myriadMaxNoOperationDelay];
  return result;
}

- (void)setMaxNoOperationDelay:(double)a3
{
}

- (double)deviceSlowDown
{
  [(AFPreferences *)self->_pref myriadDeviceDelay];
  return result;
}

- (void)setDeviceSlowDown:(double)a3
{
}

- (double)voiceTriggerEndtimeDelayThreshold
{
  [(AFPreferences *)self->_pref myriadDeviceVTEndTimeDistanceThreshold];
  return result;
}

- (void)setVoiceTriggerEndtimeDelayThreshold:(double)a3
{
}

- (BOOL)BLEActivityEnabled
{
  return ![(AFPreferences *)self->_pref disableMyriadBLEActivity];
}

- (BOOL)coordinationEnabledForAccessoryLogging
{
  return [(AFPreferences *)self->_pref myriadCoordinationEnabledForAccessoryLogging];
}

- (BOOL)coordinationEnabled
{
  return [(AFPreferences *)self->_pref myriadCoordinationEnabled];
}

- (void)enableCoordination:(BOOL)a3
{
}

- (double)deviceTrumpDelay
{
  [(AFPreferences *)self->_pref myriadDeviceTrumpDelay];
  return result;
}

- (void)setDeviceTrumpDelay:(double)a3
{
}

- (double)testDeviceDelay
{
  [(AFPreferences *)self->_pref myriadTestDeviceDelay];
  return result;
}

- (void)setTestDeviceDelay:(double)a3
{
}

- (double)deviceDelay
{
  [(AFPreferences *)self->_pref myriadDeviceDelay];
  return result;
}

- (void)setDeviceDelay:(double)a3
{
}

- (float)deviceAdjust
{
  [(AFPreferences *)self->_pref myriadDeviceAdjust];
  return result;
}

- (void)setDeviceAdjust:(float)a3
{
}

- (BOOL)myriadServerHasProvisioned
{
  return [(AFPreferences *)self->_pref myriadServerHasProvisioned];
}

- (int)constantGoodnessScore
{
  return [(AFPreferences *)self->_pref myriadConstantGoodness];
}

- (void)setConstantGoodnessScore:(int)a3
{
}

- (BOOL)ignorePlatformBias
{
  return [(AFPreferences *)self->_pref ignoreMyriadPlatformBias];
}

- (void)setIgnorePlatformBias:(BOOL)a3
{
}

- (BOOL)ignoreAdjustedBoost
{
  return [(AFPreferences *)self->_pref myriadShouldIgnoreAdjustedBoost];
}

- (void)setIgnoreAdjustedBoost:(BOOL)a3
{
}

- (unsigned)deviceClass
{
  return [(AFPreferences *)self->_pref myriadDeviceClass];
}

- (void)setDeviceClass:(unsigned __int8)a3
{
}

- (unsigned)deviceGroup
{
  v2 = [(AFPreferences *)self->_pref myriadDeviceGroup];
  unsigned __int8 v3 = [v2 intValue];

  return v3;
}

- (void)setDeviceGroup:(unsigned __int8)a3 completion:(id)a4
{
  uint64_t v4 = a3;
  id v9 = a4;
  pref = self->_pref;
  v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:v4];
  [(AFPreferences *)pref setMyriadDeviceGroup:v7];

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, v4);
    v8 = v9;
  }
}

- (AFMyriadPreferences)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFMyriadPreferences;
  id v9 = [(AFMyriadPreferences *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_instanceContext, a3);
    if (v8) {
      v11 = (AFPreferences *)v8;
    }
    else {
      v11 = [[AFPreferences alloc] initWithInstanceContext:v10->_instanceContext];
    }
    pref = v10->_pref;
    v10->_pref = v11;
  }
  return v10;
}

@end