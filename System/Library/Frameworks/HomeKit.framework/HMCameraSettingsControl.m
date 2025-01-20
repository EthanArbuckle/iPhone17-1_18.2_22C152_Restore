@interface HMCameraSettingsControl
- (HMCameraSettingsControl)initWithSettingsControl:(id)a3;
- (HMCharacteristic)currentHorizontalTilt;
- (HMCharacteristic)currentVerticalTilt;
- (HMCharacteristic)digitalZoom;
- (HMCharacteristic)imageMirroring;
- (HMCharacteristic)imageRotation;
- (HMCharacteristic)nightVision;
- (HMCharacteristic)opticalZoom;
- (HMCharacteristic)targetHorizontalTilt;
- (HMCharacteristic)targetVerticalTilt;
- (_HMCameraSettingsControl)settingsControl;
- (void)setSettingsControl:(id)a3;
@end

@implementation HMCameraSettingsControl

- (void).cxx_destruct
{
}

- (void)setSettingsControl:(id)a3
{
}

- (_HMCameraSettingsControl)settingsControl
{
  return self->_settingsControl;
}

- (HMCharacteristic)imageMirroring
{
  v2 = [(HMCameraSettingsControl *)self settingsControl];
  v3 = [v2 imageMirroring];

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)imageRotation
{
  v2 = [(HMCameraSettingsControl *)self settingsControl];
  v3 = [v2 imageRotation];

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)digitalZoom
{
  v2 = [(HMCameraSettingsControl *)self settingsControl];
  v3 = [v2 digitalZoom];

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)opticalZoom
{
  v2 = [(HMCameraSettingsControl *)self settingsControl];
  v3 = [v2 opticalZoom];

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)targetVerticalTilt
{
  v2 = [(HMCameraSettingsControl *)self settingsControl];
  v3 = [v2 targetVerticalTilt];

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)currentVerticalTilt
{
  v2 = [(HMCameraSettingsControl *)self settingsControl];
  v3 = [v2 currentVerticalTilt];

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)targetHorizontalTilt
{
  v2 = [(HMCameraSettingsControl *)self settingsControl];
  v3 = [v2 targetHorizontalTilt];

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)currentHorizontalTilt
{
  v2 = [(HMCameraSettingsControl *)self settingsControl];
  v3 = [v2 currentHorizontalTilt];

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)nightVision
{
  v2 = [(HMCameraSettingsControl *)self settingsControl];
  v3 = [v2 nightVision];

  return (HMCharacteristic *)v3;
}

- (HMCameraSettingsControl)initWithSettingsControl:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)HMCameraSettingsControl;
    v6 = [(HMCameraControl *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_settingsControl, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end