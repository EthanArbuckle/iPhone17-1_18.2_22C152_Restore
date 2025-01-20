@interface CSAudioInjectionDevice
- (BOOL)enableAlwaysOnVoiceTrigger;
- (BOOL)isConnected;
- (BOOL)isPluginDevice;
- (BOOL)speakAudio:(id)a3;
- (BOOL)speakAudio:(id)a3 withScaleFactor:(float)a4 outASBD:(AudioStreamBasicDescription *)a5 playbackStarted:(id)a6 completion:(id)a7;
- (BOOL)speakAudio:(id)a3 withScaleFactor:(float)a4 outASBD:(AudioStreamBasicDescription *)a5 playbackStarted:(id)a6 userIntentOptions:(id)a7 completion:(id)a8;
- (BOOL)speakAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6;
- (CSAudioInjectionDevice)initWithDeviceType:(int64_t)a3 deviceName:(id)a4 deviceID:(id)a5 productID:(id)a6;
- (CSAudioInjectionEngine)injectionEngine;
- (NSString)deviceID;
- (NSString)deviceName;
- (NSString)productIdentifier;
- (NSUUID)deviceUID;
- (int64_t)deviceType;
- (void)setEnableAlwaysOnVoiceTrigger:(BOOL)a3;
- (void)setInjectionEngine:(id)a3;
- (void)setIsConnected:(BOOL)a3;
@end

@implementation CSAudioInjectionDevice

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_injectionEngine);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

- (void)setInjectionEngine:(id)a3
{
}

- (CSAudioInjectionEngine)injectionEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_injectionEngine);
  return (CSAudioInjectionEngine *)WeakRetained;
}

- (BOOL)enableAlwaysOnVoiceTrigger
{
  return self->_enableAlwaysOnVoiceTrigger;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (NSUUID)deviceUID
{
  return self->_deviceUID;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setEnableAlwaysOnVoiceTrigger:(BOOL)a3
{
  BOOL v3 = a3;
  self->_enableAlwaysOnVoiceTrigger = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_injectionEngine);
  [WeakRetained setAlwaysOnVoiceTriggerEnabled:v3];
}

- (BOOL)speakAudio:(id)a3 withScaleFactor:(float)a4 outASBD:(AudioStreamBasicDescription *)a5 playbackStarted:(id)a6 userIntentOptions:(id)a7 completion:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  v18 = [(CSAudioInjectionDevice *)self injectionEngine];
  [v18 setUserIntentOptions:v15];

  v19 = [(CSAudioInjectionDevice *)self injectionEngine];
  long long v20 = *(_OWORD *)&a5->mBytesPerPacket;
  v22[0] = *(_OWORD *)&a5->mSampleRate;
  v22[1] = v20;
  uint64_t v23 = *(void *)&a5->mBitsPerChannel;
  LOBYTE(a5) = objc_msgSend(v19, "injectAudio:withScaleFactor:outASBD:playbackStarted:completion:", v17, v22, v16, v14, COERCE_DOUBLE(__PAIR64__(DWORD1(v22[0]), LODWORD(a4))));

  return (char)a5;
}

- (BOOL)speakAudio:(id)a3 withScaleFactor:(float)a4 outASBD:(AudioStreamBasicDescription *)a5 playbackStarted:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  id v15 = [(CSAudioInjectionDevice *)self injectionEngine];
  long long v16 = *(_OWORD *)&a5->mBytesPerPacket;
  v18[0] = *(_OWORD *)&a5->mSampleRate;
  v18[1] = v16;
  uint64_t v19 = *(void *)&a5->mBitsPerChannel;
  LOBYTE(a5) = objc_msgSend(v15, "injectAudio:withScaleFactor:outASBD:playbackStarted:completion:", v14, v18, v13, v12, COERCE_DOUBLE(__PAIR64__(DWORD1(v18[0]), LODWORD(a4))));

  return (char)a5;
}

- (BOOL)speakAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(CSAudioInjectionDevice *)self injectionEngine];
  *(float *)&double v14 = a4;
  unsigned __int8 v15 = [v13 injectAudio:v12 withScaleFactor:v11 playbackStarted:v10 completion:v14];

  return v15;
}

- (BOOL)speakAudio:(id)a3
{
  id v4 = a3;
  v5 = [(CSAudioInjectionDevice *)self injectionEngine];
  unsigned __int8 v6 = [v5 injectAudio:v4];

  return v6;
}

- (BOOL)isPluginDevice
{
  return (unint64_t)(self->_deviceType - 5) < 4;
}

- (CSAudioInjectionDevice)initWithDeviceType:(int64_t)a3 deviceName:(id)a4 deviceID:(id)a5 productID:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CSAudioInjectionDevice;
  id v13 = [(CSAudioInjectionDevice *)&v25 init];
  double v14 = v13;
  if (v13)
  {
    v13->_deviceType = a3;
    id v15 = [v10 copy];
    uint64_t v16 = +[NSString stringWithFormat:@"%@_%@", v15, @"injectionDevice"];
    deviceName = v14->_deviceName;
    v14->_deviceName = (NSString *)v16;

    v18 = (NSString *)[v11 copy];
    deviceID = v14->_deviceID;
    v14->_deviceID = v18;

    long long v20 = (NSString *)[v12 copy];
    productIdentifier = v14->_productIdentifier;
    v14->_productIdentifier = v20;

    uint64_t v22 = +[NSUUID UUID];
    deviceUID = v14->_deviceUID;
    v14->_deviceUID = (NSUUID *)v22;
  }
  return v14;
}

@end