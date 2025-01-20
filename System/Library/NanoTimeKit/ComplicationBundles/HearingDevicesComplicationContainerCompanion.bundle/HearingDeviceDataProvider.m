@interface HearingDeviceDataProvider
- (AXHADeviceProtocol)hearingDevice;
- (AXHearingAidMode)selectedMode;
- (BOOL)supportProperty:(unint64_t)a3;
- (HearingDeviceDataProvider)init;
- (NSArray)modes;
- (NSString)deviceName;
- (NSString)displayName;
- (NSString)shortDeviceName;
- (NSString)shortDeviceNameColon;
- (double)batteryLevel;
- (double)micLevel;
- (double)volumeLevel;
- (int)hearingEar;
- (int64_t)micSteps;
- (int64_t)volumeSteps;
- (void)setHearingDevice:(id)a3;
- (void)setHearingEar:(int)a3;
- (void)setMicLevel:(double)a3;
- (void)setSelectedMode:(id)a3;
- (void)setVolumeLevel:(double)a3;
@end

@implementation HearingDeviceDataProvider

- (HearingDeviceDataProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)HearingDeviceDataProvider;
  v2 = [(HearingDeviceDataProvider *)&v9 init];
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    numberFormatter = v2->_numberFormatter;
    v2->_numberFormatter = v3;

    [(NSNumberFormatter *)v2->_numberFormatter setNumberStyle:3];
    [(NSNumberFormatter *)v2->_numberFormatter setMaximumFractionDigits:0];
    v5 = v2->_numberFormatter;
    v6 = +[NSNumber numberWithInt:0];
    v7 = [(NSNumberFormatter *)v5 stringFromNumber:v6];
    [(NSNumberFormatter *)v5 setNotANumberSymbol:v7];
  }
  return v2;
}

- (void)setHearingDevice:(id)a3
{
  objc_storeStrong((id *)&self->_hearingDevice, a3);
  id v5 = a3;
  id v6 = [v5 availableEars];

  [(HearingDeviceDataProvider *)self setHearingEar:v6];
}

- (NSString)displayName
{
  v3 = [(HearingDeviceDataProvider *)self deviceName];
  v4 = [(HearingDeviceDataProvider *)self shortDeviceName];
  numberFormatter = self->_numberFormatter;
  [(HearingDeviceDataProvider *)self batteryLevel];
  id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v7 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v6];
  v8 = +[NSString stringWithFormat:@"%@\n%@\n%@ battery", v3, v4, v7];

  return (NSString *)v8;
}

- (NSString)deviceName
{
  unsigned int v4 = [(HearingDeviceDataProvider *)self hearingEar];
  if (v4 <= 6 && ((1 << v4) & 0x55) != 0)
  {
    id v5 = [(HearingDeviceDataProvider *)self hearingDevice];
    v2 = [v5 name];
  }

  return (NSString *)v2;
}

- (NSString)shortDeviceName
{
  unsigned int v2 = [(HearingDeviceDataProvider *)self hearingEar];
  if (v2 == 2 || v2 == 6 || v2 == 4)
  {
    v3 = hearingLocString();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)shortDeviceNameColon
{
  unsigned int v2 = [(HearingDeviceDataProvider *)self hearingEar];
  if (v2 == 2 || v2 == 6 || v2 == 4)
  {
    v3 = hearingLocString();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (double)batteryLevel
{
  unsigned int v3 = [(HearingDeviceDataProvider *)self hearingEar];
  if (v3 == 4)
  {
    id v5 = [(HearingDeviceDataProvider *)self hearingDevice];
    [v5 rightBatteryLevel];
    goto LABEL_5;
  }
  double v4 = 0.0;
  if (v3 == 2)
  {
    id v5 = [(HearingDeviceDataProvider *)self hearingDevice];
    [v5 leftBatteryLevel];
LABEL_5:
    double v4 = v6;
  }
  return v4;
}

- (double)volumeLevel
{
  unsigned int v3 = [(HearingDeviceDataProvider *)self hearingEar];
  if (v3 == 4)
  {
    id v5 = [(HearingDeviceDataProvider *)self hearingDevice];
    [v5 rightMixedVolume];
    goto LABEL_5;
  }
  double v4 = 0.0;
  if (v3 == 2)
  {
    id v5 = [(HearingDeviceDataProvider *)self hearingDevice];
    [v5 leftMixedVolume];
LABEL_5:
    double v4 = v6;
  }
  return v4;
}

- (void)setVolumeLevel:(double)a3
{
  unsigned int v5 = [(HearingDeviceDataProvider *)self hearingEar];
  if (v5 == 4)
  {
    id v6 = [(HearingDeviceDataProvider *)self hearingDevice];
    [v6 setRightMixedVolume:a3];
  }
  else
  {
    if (v5 != 2) {
      return;
    }
    id v6 = [(HearingDeviceDataProvider *)self hearingDevice];
    [v6 setLeftMixedVolume:a3];
  }
}

- (double)micLevel
{
  unsigned int v3 = [(HearingDeviceDataProvider *)self hearingEar];
  double v4 = 0.0;
  switch(v3)
  {
    case 6u:
      v7 = [(HearingDeviceDataProvider *)self hearingDevice];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        unsigned int v5 = [(HearingDeviceDataProvider *)self hearingDevice];
        [v5 combinedVolumeForProperty:64];
        goto LABEL_8;
      }
      break;
    case 4u:
      unsigned int v5 = [(HearingDeviceDataProvider *)self hearingDevice];
      [v5 rightMicrophoneVolume];
      goto LABEL_8;
    case 2u:
      unsigned int v5 = [(HearingDeviceDataProvider *)self hearingDevice];
      [v5 leftMicrophoneVolume];
LABEL_8:
      double v4 = v6;

      break;
  }
  return v4;
}

- (void)setMicLevel:(double)a3
{
  unsigned int v5 = [(HearingDeviceDataProvider *)self hearingEar];
  if (v5 == 4)
  {
    id v6 = [(HearingDeviceDataProvider *)self hearingDevice];
    [v6 setRightMicrophoneVolume:a3];
  }
  else
  {
    if (v5 != 2) {
      return;
    }
    id v6 = [(HearingDeviceDataProvider *)self hearingDevice];
    [v6 setLeftMicrophoneVolume:a3];
  }
}

- (NSArray)modes
{
  unsigned int v3 = [(HearingDeviceDataProvider *)self hearingEar];
  switch(v3)
  {
    case 6u:
      goto LABEL_4;
    case 4u:
      double v4 = [(HearingDeviceDataProvider *)self hearingDevice];
      uint64_t v5 = [v4 rightPrograms];
      goto LABEL_6;
    case 2u:
LABEL_4:
      double v4 = [(HearingDeviceDataProvider *)self hearingDevice];
      uint64_t v5 = [v4 leftPrograms];
LABEL_6:
      id v6 = (void *)v5;

      goto LABEL_8;
  }
  id v6 = 0;
LABEL_8:

  return (NSArray *)v6;
}

- (AXHearingAidMode)selectedMode
{
  unsigned int v3 = [(HearingDeviceDataProvider *)self hearingEar];
  switch(v3)
  {
    case 6u:
      goto LABEL_4;
    case 4u:
      double v4 = [(HearingDeviceDataProvider *)self hearingDevice];
      uint64_t v5 = [v4 rightSelectedProgram];
      goto LABEL_6;
    case 2u:
LABEL_4:
      double v4 = [(HearingDeviceDataProvider *)self hearingDevice];
      uint64_t v5 = [v4 leftSelectedProgram];
LABEL_6:
      id v6 = (void *)v5;

      goto LABEL_8;
  }
  id v6 = 0;
LABEL_8:

  return (AXHearingAidMode *)v6;
}

- (void)setSelectedMode:(id)a3
{
  id v4 = a3;
  id v5 = [(HearingDeviceDataProvider *)self hearingDevice];
  objc_msgSend(v5, "selectProgram:forEar:", v4, -[HearingDeviceDataProvider hearingEar](self, "hearingEar"));
}

- (int64_t)volumeSteps
{
  unsigned int v3 = [(HearingDeviceDataProvider *)self hearingEar];
  if (v3 == 4)
  {
    id v4 = [(HearingDeviceDataProvider *)self hearingDevice];
    signed int v5 = [v4 rightMixedVolumeSteps];
  }
  else
  {
    if (v3 != 2) {
      return 0;
    }
    id v4 = [(HearingDeviceDataProvider *)self hearingDevice];
    signed int v5 = [v4 leftMixedVolumeSteps];
  }
  int64_t v6 = v5;

  return v6;
}

- (int64_t)micSteps
{
  unsigned int v3 = [(HearingDeviceDataProvider *)self hearingEar];
  if (v3 == 4)
  {
    id v4 = [(HearingDeviceDataProvider *)self hearingDevice];
    signed int v5 = [v4 rightMicrophoneVolumeSteps];
  }
  else
  {
    if (v3 != 2) {
      return 0;
    }
    id v4 = [(HearingDeviceDataProvider *)self hearingDevice];
    signed int v5 = [v4 leftMicrophoneVolumeSteps];
  }
  int64_t v6 = v5;

  return v6;
}

- (BOOL)supportProperty:(unint64_t)a3
{
  signed int v5 = [(HearingDeviceDataProvider *)self hearingDevice];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  v7 = [(HearingDeviceDataProvider *)self hearingDevice];
  unsigned __int8 v8 = objc_msgSend(v7, "propertyIsAvailable:forEar:", a3, -[HearingDeviceDataProvider hearingEar](self, "hearingEar"));

  return v8;
}

- (AXHADeviceProtocol)hearingDevice
{
  return self->_hearingDevice;
}

- (int)hearingEar
{
  return self->_hearingEar;
}

- (void)setHearingEar:(int)a3
{
  self->_hearingEar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hearingDevice, 0);

  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

@end