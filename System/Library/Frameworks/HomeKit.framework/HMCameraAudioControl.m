@interface HMCameraAudioControl
- (HMCameraAudioControl)initWithAudioControl:(id)a3;
- (HMCharacteristic)mute;
- (HMCharacteristic)volume;
- (_HMCameraAudioControl)audioControl;
@end

@implementation HMCameraAudioControl

- (HMCameraAudioControl)initWithAudioControl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMCameraAudioControl;
  v6 = [(HMCameraControl *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_audioControl, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (_HMCameraAudioControl)audioControl
{
  return self->_audioControl;
}

- (HMCharacteristic)volume
{
  v2 = [(HMCameraAudioControl *)self audioControl];
  v3 = [v2 volume];

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)mute
{
  v2 = [(HMCameraAudioControl *)self audioControl];
  v3 = [v2 mute];

  return (HMCharacteristic *)v3;
}

@end