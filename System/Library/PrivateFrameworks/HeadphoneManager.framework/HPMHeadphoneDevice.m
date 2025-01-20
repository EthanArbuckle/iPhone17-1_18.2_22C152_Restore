@interface HPMHeadphoneDevice
- (AudioAccessoryDevice)aaDevice;
- (BOOL)adaptiveVolume;
- (BOOL)batteryCharging;
- (BOOL)caseSound;
- (BOOL)conversationDetect;
- (BOOL)findMyNetworkEnable;
- (BOOL)findMyNetworkSupport;
- (BOOL)findMyNetworkValueUpdated;
- (BOOL)inEarDetection;
- (BOOL)isAirpods;
- (BOOL)isCaseSoundSupported;
- (BOOL)isResettingCaseSoundOnError;
- (BOOL)isResettingFindMyNetworkOnError;
- (BOOL)isServiceSupported:(unsigned int)a3;
- (BOOL)isSettingCaseSoundValue;
- (BOOL)isSettingFindMyNetworkValue;
- (BOOL)isUpdatingDeviceConfig;
- (BOOL)isiCloudSignedIn;
- (BOOL)pressHoldAuto;
- (BOOL)pressHoldNoiseCancel;
- (BOOL)pressHoldOff;
- (BOOL)pressHoldTransparency;
- (BOOL)selectiveSpeechListening;
- (BOOL)shouldShowFindMyNetworkAlert;
- (BOOL)spatialProfileExists;
- (BOOL)supportsFeatureWithFeature:(int64_t)a3;
- (BOOL)validatePressHoldCombination;
- (BOOL)volumeControlToggle;
- (BOOL)volumeControlView;
- (BTAirPodsControlServiceClient)airPodsServiceClient;
- (CBDevice)cbDevice;
- (CBProductInfo)productInfo;
- (HPMHeadphoneDevice)init;
- (HPMHeadphoneDevice)initWithCbDevice:(id)a3 delegate:(id)a4;
- (HPMHeadphoneDevice)initWith_aaDevice:(id)a3 cbDevice:(id)a4 delegate:(id)a5;
- (NSDictionary)serialNumbers;
- (NSString)btAddress;
- (NSString)name;
- (SPOwnerSessionProtocol)findMyNetworkSession;
- (UIImage)icon;
- (char)doubleTapActionLeft;
- (char)doubleTapActionRight;
- (char)microphoneMode;
- (char)smartRoutingMode;
- (float)batteryLevelCase;
- (float)batteryLevelLeft;
- (float)batteryLevelMain;
- (float)batteryLevelRight;
- (id)getFindMyUrlWithHpDevice:(id)a3;
- (id)getModelName;
- (int)listeningMode;
- (unsigned)accessorySettingFeatureBitMask;
- (unsigned)batteryStateCase;
- (unsigned)batteryStateLeft;
- (unsigned)batteryStateMain;
- (unsigned)batteryStateRight;
- (unsigned)clickHoldModeLeft;
- (unsigned)clickHoldModeRight;
- (unsigned)crownRotationDirection;
- (unsigned)deviceColor;
- (unsigned)endCallGesture;
- (unsigned)listeningModeConfigs;
- (unsigned)muteControlGesture;
- (void)featureUpdateListenerWithCbDevice:(id)a3;
- (void)featureUpdateListenerWith_aaDevice:(id)a3 cbDevice:(id)a4;
- (void)getCaseSilentMode;
- (void)isSpatialProfileRecordPresent;
- (void)populateSerialNumbers;
- (void)removeSpatialProfileRecord;
- (void)resetToggle;
- (void)setAaDevice:(id)a3;
- (void)setAccessorySettingFeatureBitMask:(unsigned int)a3;
- (void)setAdaptiveVolume:(BOOL)a3;
- (void)setAirPodsServiceClient:(id)a3;
- (void)setBatteryCharging:(BOOL)a3;
- (void)setBatteryLevelCase:(float)a3;
- (void)setBatteryLevelLeft:(float)a3;
- (void)setBatteryLevelMain:(float)a3;
- (void)setBatteryLevelRight:(float)a3;
- (void)setBatteryStateCase:(unsigned __int8)a3;
- (void)setBatteryStateLeft:(unsigned __int8)a3;
- (void)setBatteryStateMain:(unsigned __int8)a3;
- (void)setBatteryStateRight:(unsigned __int8)a3;
- (void)setCaseSilentMode;
- (void)setCaseSound:(BOOL)a3;
- (void)setCbDevice:(id)a3;
- (void)setClickHoldModeLeft:(unsigned __int8)a3;
- (void)setClickHoldModeRight:(unsigned __int8)a3;
- (void)setConversationDetect:(BOOL)a3;
- (void)setCrownRotationDirection:(unsigned __int8)a3;
- (void)setDeviceColor:(unsigned int)a3;
- (void)setDoubleTapActionLeft:(char)a3;
- (void)setDoubleTapActionRight:(char)a3;
- (void)setEndCallGesture:(unsigned __int8)a3;
- (void)setFindMyNetworkEnable:(BOOL)a3;
- (void)setFindMyNetworkSession:(id)a3;
- (void)setFindMyNetworkSupport:(BOOL)a3;
- (void)setFindMyNetworkValueUpdated:(BOOL)a3;
- (void)setFindMyStatus;
- (void)setInEarDetection:(BOOL)a3;
- (void)setIsAirpods:(BOOL)a3;
- (void)setIsCaseSoundSupported:(BOOL)a3;
- (void)setIsResettingCaseSoundOnError:(BOOL)a3;
- (void)setIsResettingFindMyNetworkOnError:(BOOL)a3;
- (void)setIsSettingCaseSoundValue:(BOOL)a3;
- (void)setIsSettingFindMyNetworkValue:(BOOL)a3;
- (void)setIsUpdatingDeviceConfig:(BOOL)a3;
- (void)setListeningMode:(int)a3;
- (void)setListeningModeConfigs:(unsigned int)a3;
- (void)setMicrophoneMode:(char)a3;
- (void)setMuteControlGesture:(unsigned __int8)a3;
- (void)setName:(id)a3;
- (void)setPressHoldAuto:(BOOL)a3;
- (void)setPressHoldDefaults;
- (void)setPressHoldNoiseCancel:(BOOL)a3;
- (void)setPressHoldOff:(BOOL)a3;
- (void)setPressHoldTransparency:(BOOL)a3;
- (void)setProductInfo:(id)a3;
- (void)setSelectiveSpeechListening:(BOOL)a3;
- (void)setSerialNumbers:(id)a3;
- (void)setSmartRoutingMode:(char)a3;
- (void)setSpatialProfileExists:(BOOL)a3;
- (void)setVolumeControlToggle:(BOOL)a3;
- (void)setVolumeControlView:(BOOL)a3;
- (void)updateFeatureValuesWithFeature:(int64_t)a3;
@end

@implementation HPMHeadphoneDevice

- (CBDevice)cbDevice
{
  v2 = self;
  id v5 = HeadphoneDevice.cbDevice.getter();

  return (CBDevice *)v5;
}

- (void)setCbDevice:(id)a3
{
  id v4 = a3;
  id v5 = self;
  HeadphoneDevice.cbDevice.setter(a3);
}

- (CBProductInfo)productInfo
{
  v2 = self;
  id v5 = HeadphoneDevice.productInfo.getter();

  return (CBProductInfo *)v5;
}

- (void)setProductInfo:(id)a3
{
  id v4 = a3;
  id v5 = self;
  HeadphoneDevice.productInfo.setter(a3);
}

- (AudioAccessoryDevice)aaDevice
{
  v2 = self;
  id v5 = HeadphoneDevice.aaDevice.getter();

  return (AudioAccessoryDevice *)v5;
}

- (void)setAaDevice:(id)a3
{
  id v4 = a3;
  id v5 = self;
  HeadphoneDevice.aaDevice.setter(a3);
}

- (UIImage)icon
{
  v2 = self;
  id v5 = HeadphoneDevice.icon.getter();

  return (UIImage *)v5;
}

- (NSString)btAddress
{
  v2 = self;
  uint64_t v6 = HeadphoneDevice.btAddress.getter();
  uint64_t v7 = v3;

  id v8 = (id)MEMORY[0x253385EB0](v6, v7);
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (BOOL)isUpdatingDeviceConfig
{
  v2 = self;
  HeadphoneDevice.isUpdatingDeviceConfig.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setIsUpdatingDeviceConfig:(BOOL)a3
{
  uint64_t v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  HeadphoneDevice.isUpdatingDeviceConfig.setter(v4 & 1);
}

- (BOOL)isAirpods
{
  v2 = self;
  HeadphoneDevice.isAirpods.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setIsAirpods:(BOOL)a3
{
  uint64_t v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  HeadphoneDevice.isAirpods.setter(v4 & 1);
}

- (BOOL)findMyNetworkSupport
{
  v2 = self;
  HeadphoneDevice.findMyNetworkSupport.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setFindMyNetworkSupport:(BOOL)a3
{
  uint64_t v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  HeadphoneDevice.findMyNetworkSupport.setter(v4 & 1);
}

- (BOOL)isResettingFindMyNetworkOnError
{
  v2 = self;
  HeadphoneDevice.isResettingFindMyNetworkOnError.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setIsResettingFindMyNetworkOnError:(BOOL)a3
{
  uint64_t v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  HeadphoneDevice.isResettingFindMyNetworkOnError.setter(v4 & 1);
}

- (BOOL)findMyNetworkEnable
{
  v2 = self;
  HeadphoneDevice.findMyNetworkEnable.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setFindMyNetworkEnable:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.findMyNetworkEnable.setter();
}

- (SPOwnerSessionProtocol)findMyNetworkSession
{
  v2 = self;
  id v5 = (id)HeadphoneDevice.findMyNetworkSession.getter();

  return (SPOwnerSessionProtocol *)v5;
}

- (void)setFindMyNetworkSession:(id)a3
{
  swift_unknownObjectRetain();
  char v4 = self;
  HeadphoneDevice.findMyNetworkSession.setter((uint64_t)a3);
}

- (BOOL)findMyNetworkValueUpdated
{
  v2 = self;
  HeadphoneDevice.findMyNetworkValueUpdated.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setFindMyNetworkValueUpdated:(BOOL)a3
{
  uint64_t v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  HeadphoneDevice.findMyNetworkValueUpdated.setter(v4 & 1);
}

- (BOOL)isSettingFindMyNetworkValue
{
  v2 = self;
  HeadphoneDevice.isSettingFindMyNetworkValue.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setIsSettingFindMyNetworkValue:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.isSettingFindMyNetworkValue.setter();
}

- (NSString)name
{
  v2 = self;
  uint64_t v6 = HeadphoneDevice.name.getter();
  uint64_t v7 = v3;

  id v8 = (id)MEMORY[0x253385EB0](v6, v7);
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  id v5 = self;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  HeadphoneDevice.name.setter();
}

- (int)listeningMode
{
  v2 = self;
  int v5 = HeadphoneDevice.listeningMode.getter();

  return v5;
}

- (void)setListeningMode:(int)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.listeningMode.setter();
}

- (unsigned)clickHoldModeLeft
{
  v2 = self;
  unsigned __int8 v5 = HeadphoneDevice.clickHoldModeLeft.getter();

  return v5;
}

- (void)setClickHoldModeLeft:(unsigned __int8)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.clickHoldModeLeft.setter();
}

- (unsigned)clickHoldModeRight
{
  v2 = self;
  unsigned __int8 v5 = HeadphoneDevice.clickHoldModeRight.getter();

  return v5;
}

- (void)setClickHoldModeRight:(unsigned __int8)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.clickHoldModeRight.setter();
}

- (unsigned)listeningModeConfigs
{
  v2 = self;
  unsigned int v5 = HeadphoneDevice.listeningModeConfigs.getter();

  return v5;
}

- (void)setListeningModeConfigs:(unsigned int)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.listeningModeConfigs.setter(a3);
}

- (BOOL)pressHoldAuto
{
  v2 = self;
  HeadphoneDevice.pressHoldAuto.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setPressHoldAuto:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.pressHoldAuto.setter();
}

- (BOOL)pressHoldTransparency
{
  v2 = self;
  HeadphoneDevice.pressHoldTransparency.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setPressHoldTransparency:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.pressHoldTransparency.setter();
}

- (BOOL)pressHoldOff
{
  v2 = self;
  HeadphoneDevice.pressHoldOff.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setPressHoldOff:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.pressHoldOff.setter();
}

- (BOOL)pressHoldNoiseCancel
{
  v2 = self;
  HeadphoneDevice.pressHoldNoiseCancel.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setPressHoldNoiseCancel:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.pressHoldNoiseCancel.setter();
}

- (char)doubleTapActionLeft
{
  v2 = self;
  char v5 = HeadphoneDevice.doubleTapActionLeft.getter();

  return v5;
}

- (void)setDoubleTapActionLeft:(char)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.doubleTapActionLeft.setter();
}

- (char)doubleTapActionRight
{
  v2 = self;
  char v5 = HeadphoneDevice.doubleTapActionRight.getter();

  return v5;
}

- (void)setDoubleTapActionRight:(char)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.doubleTapActionRight.setter();
}

- (unsigned)crownRotationDirection
{
  v2 = self;
  unsigned __int8 v5 = HeadphoneDevice.crownRotationDirection.getter();

  return v5;
}

- (void)setCrownRotationDirection:(unsigned __int8)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.crownRotationDirection.setter();
}

- (BOOL)inEarDetection
{
  v2 = self;
  HeadphoneDevice.inEarDetection.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setInEarDetection:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.inEarDetection.setter();
}

- (BOOL)batteryCharging
{
  v2 = self;
  HeadphoneDevice.batteryCharging.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setBatteryCharging:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.batteryCharging.setter();
}

- (char)smartRoutingMode
{
  v2 = self;
  char v5 = HeadphoneDevice.smartRoutingMode.getter();

  return v5;
}

- (void)setSmartRoutingMode:(char)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.smartRoutingMode.setter();
}

- (char)microphoneMode
{
  v2 = self;
  char v5 = HeadphoneDevice.microphoneMode.getter();

  return v5;
}

- (void)setMicrophoneMode:(char)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.microphoneMode.setter();
}

- (BOOL)volumeControlToggle
{
  v2 = self;
  HeadphoneDevice.volumeControlToggle.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setVolumeControlToggle:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.volumeControlToggle.setter();
}

- (BOOL)volumeControlView
{
  v2 = self;
  HeadphoneDevice.volumeControlView.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setVolumeControlView:(BOOL)a3
{
  uint64_t v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  HeadphoneDevice.volumeControlView.setter(v4 & 1);
}

- (BOOL)spatialProfileExists
{
  v2 = self;
  HeadphoneDevice.spatialProfileExists.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setSpatialProfileExists:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.spatialProfileExists.setter();
}

- (BOOL)isCaseSoundSupported
{
  v2 = self;
  HeadphoneDevice.isCaseSoundSupported.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setIsCaseSoundSupported:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.isCaseSoundSupported.setter();
}

- (BOOL)caseSound
{
  v2 = self;
  HeadphoneDevice.caseSound.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setCaseSound:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.caseSound.setter();
}

- (BTAirPodsControlServiceClient)airPodsServiceClient
{
  v2 = self;
  id v5 = HeadphoneDevice.airPodsServiceClient.getter();

  return (BTAirPodsControlServiceClient *)v5;
}

- (void)setAirPodsServiceClient:(id)a3
{
  id v4 = a3;
  id v5 = self;
  HeadphoneDevice.airPodsServiceClient.setter(a3);
}

- (BOOL)isResettingCaseSoundOnError
{
  v2 = self;
  HeadphoneDevice.isResettingCaseSoundOnError.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setIsResettingCaseSoundOnError:(BOOL)a3
{
  uint64_t v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  HeadphoneDevice.isResettingCaseSoundOnError.setter(v4 & 1);
}

- (BOOL)isSettingCaseSoundValue
{
  v2 = self;
  HeadphoneDevice.isSettingCaseSoundValue.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setIsSettingCaseSoundValue:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.isSettingCaseSoundValue.setter();
}

- (unsigned)endCallGesture
{
  v2 = self;
  unsigned __int8 v5 = HeadphoneDevice.endCallGesture.getter();

  return v5;
}

- (void)setEndCallGesture:(unsigned __int8)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.endCallGesture.setter();
}

- (unsigned)muteControlGesture
{
  v2 = self;
  unsigned __int8 v5 = HeadphoneDevice.muteControlGesture.getter();

  return v5;
}

- (void)setMuteControlGesture:(unsigned __int8)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.muteControlGesture.setter();
}

- (NSDictionary)serialNumbers
{
  v2 = self;
  HeadphoneDevice.serialNumbers.getter();

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (void)setSerialNumbers:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  HeadphoneDevice.serialNumbers.setter(v6);
}

- (BOOL)selectiveSpeechListening
{
  v2 = self;
  HeadphoneDevice.selectiveSpeechListening.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setSelectiveSpeechListening:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.selectiveSpeechListening.setter();
}

- (BOOL)conversationDetect
{
  v2 = self;
  HeadphoneDevice.conversationDetect.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setConversationDetect:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.conversationDetect.setter();
}

- (BOOL)adaptiveVolume
{
  v2 = self;
  HeadphoneDevice.adaptiveVolume.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setAdaptiveVolume:(BOOL)a3
{
  uint64_t v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.adaptiveVolume.setter();
}

- (float)batteryLevelMain
{
  v2 = self;
  float v5 = HeadphoneDevice.batteryLevelMain.getter();

  return v5;
}

- (void)setBatteryLevelMain:(float)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.batteryLevelMain.setter();
}

- (unsigned)batteryStateMain
{
  v2 = self;
  unsigned __int8 v5 = HeadphoneDevice.batteryStateMain.getter();

  return v5;
}

- (void)setBatteryStateMain:(unsigned __int8)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.batteryStateMain.setter();
}

- (float)batteryLevelLeft
{
  v2 = self;
  float v5 = HeadphoneDevice.batteryLevelLeft.getter();

  return v5;
}

- (void)setBatteryLevelLeft:(float)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.batteryLevelLeft.setter();
}

- (unsigned)batteryStateLeft
{
  v2 = self;
  unsigned __int8 v5 = HeadphoneDevice.batteryStateLeft.getter();

  return v5;
}

- (void)setBatteryStateLeft:(unsigned __int8)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.batteryStateLeft.setter();
}

- (float)batteryLevelRight
{
  v2 = self;
  float v5 = HeadphoneDevice.batteryLevelRight.getter();

  return v5;
}

- (void)setBatteryLevelRight:(float)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.batteryLevelRight.setter();
}

- (unsigned)batteryStateRight
{
  v2 = self;
  unsigned __int8 v5 = HeadphoneDevice.batteryStateRight.getter();

  return v5;
}

- (void)setBatteryStateRight:(unsigned __int8)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.batteryStateRight.setter();
}

- (float)batteryLevelCase
{
  v2 = self;
  float v5 = HeadphoneDevice.batteryLevelCase.getter();

  return v5;
}

- (void)setBatteryLevelCase:(float)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.batteryLevelCase.setter();
}

- (unsigned)batteryStateCase
{
  v2 = self;
  unsigned __int8 v5 = HeadphoneDevice.batteryStateCase.getter();

  return v5;
}

- (void)setBatteryStateCase:(unsigned __int8)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.batteryStateCase.setter();
}

- (HPMHeadphoneDevice)initWithCbDevice:(id)a3 delegate:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  return (HPMHeadphoneDevice *)HeadphoneDevice.init(cbDevice:delegate:)(a3);
}

- (HPMHeadphoneDevice)initWith_aaDevice:(id)a3 cbDevice:(id)a4 delegate:(id)a5
{
  id v5 = a3;
  id v6 = a4;
  swift_unknownObjectRetain();
  return (HPMHeadphoneDevice *)HeadphoneDevice.init(_aaDevice:cbDevice:delegate:)(a3, a4, (uint64_t)a5);
}

- (BOOL)supportsFeatureWithFeature:(int64_t)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.supportsFeature(feature:)(a3);

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)updateFeatureValuesWithFeature:(int64_t)a3
{
  uint64_t v3 = self;
  HeadphoneDevice.updateFeatureValues(feature:)(a3, v4);
}

- (id)getFindMyUrlWithHpDevice:(id)a3
{
  v12 = self;
  v13 = a3;
  uint64_t v16 = type metadata accessor for URL();
  uint64_t v14 = *(void *)(v16 - 8);
  uint64_t v15 = v16 - 8;
  unint64_t v11 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v17 = (uint64_t)&v11 - v11;
  id v5 = (id)MEMORY[0x270FA5388](v13, v4);
  id v6 = self;
  HeadphoneDevice.getFindMyUrl(hpDevice:)(v13, v17);

  URL._bridgeToObjectiveC()(v7);
  v18 = v8;
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v17, v16);
  v9 = v18;
  return v9;
}

- (void)featureUpdateListenerWith_aaDevice:(id)a3 cbDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  HeadphoneDevice.featureUpdateListener(_aaDevice:cbDevice:)(a3, (uint64_t)a4);
}

- (void)featureUpdateListenerWithCbDevice:(id)a3
{
  id v4 = a3;
  id v5 = self;
  HeadphoneDevice.featureUpdateListener(cbDevice:)((uint64_t)a3, v6);
}

- (id)getModelName
{
  v2 = self;
  Swift::String v3 = HeadphoneDevice.getModelName()();

  id v6 = (id)MEMORY[0x253385EB0](v3._countAndFlagsBits, v3._object);
  swift_bridgeObjectRelease();
  return v6;
}

- (void)setFindMyStatus
{
  v2 = self;
  HeadphoneDevice.setFindMyStatus()();
}

- (void)resetToggle
{
  v2 = self;
  HeadphoneDevice.resetToggle()();
}

- (void)setCaseSilentMode
{
  v2 = self;
  HeadphoneDevice.setCaseSilentMode()();
}

- (BOOL)isiCloudSignedIn
{
  v2 = self;
  HeadphoneDevice.isiCloudSignedIn()();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setPressHoldDefaults
{
  v2 = self;
  HeadphoneDevice.setPressHoldDefaults()();
}

- (void)isSpatialProfileRecordPresent
{
  v2 = self;
  HeadphoneDevice.isSpatialProfileRecordPresent()();
}

- (void)removeSpatialProfileRecord
{
  v2 = self;
  HeadphoneDevice.removeSpatialProfileRecord()();
}

- (void)getCaseSilentMode
{
  v2 = self;
  HeadphoneDevice.getCaseSilentMode()();
}

- (void)populateSerialNumbers
{
  v2 = self;
  HeadphoneDevice.populateSerialNumbers()();
}

- (BOOL)validatePressHoldCombination
{
  v2 = self;
  HeadphoneDevice.validatePressHoldCombination()();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (BOOL)shouldShowFindMyNetworkAlert
{
  v2 = self;
  HeadphoneDevice.shouldShowFindMyNetworkAlert()();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (unsigned)accessorySettingFeatureBitMask
{
  v2 = self;
  unsigned int v5 = HeadphoneDevice.accessorySettingFeatureBitMask.getter();

  return v5;
}

- (void)setAccessorySettingFeatureBitMask:(unsigned int)a3
{
  Swift::String v3 = self;
  HeadphoneDevice.accessorySettingFeatureBitMask.setter(a3);
}

- (unsigned)deviceColor
{
  v2 = self;
  unsigned int v5 = HeadphoneDevice.deviceColor.getter();

  return v5;
}

- (void)setDeviceColor:(unsigned int)a3
{
  Swift::String v3 = self;
  HeadphoneDevice.deviceColor.setter(a3);
}

- (BOOL)isServiceSupported:(unsigned int)a3
{
  Swift::String v3 = self;
  HeadphoneDevice.isServiceSupported(_:)(a3);

  return _convertBoolToObjCBool(_:)() & 1;
}

- (HPMHeadphoneDevice)init
{
  return (HPMHeadphoneDevice *)HeadphoneDevice.init()();
}

- (void).cxx_destruct
{
  outlined destroy of AudioAccessoryDevice?((id *)((char *)&self->super.isa + OBJC_IVAR___HPMHeadphoneDevice_aaDevice));
  outlined destroy of UIImage?((id *)((char *)&self->super.isa + OBJC_IVAR___HPMHeadphoneDevice_icon));
  outlined destroy of String();
  uint64_t v9 = OBJC_IVAR___HPMHeadphoneDevice__findMyNetworkEnable;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Bool>);
  v25 = *(void (**)(char *))(*(void *)(v24 - 8) + 8);
  v25((char *)self + v9);
  swift_unknownObjectRelease();
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__isSettingFindMyNetworkValue, v24);
  uint64_t v10 = OBJC_IVAR___HPMHeadphoneDevice__name;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<String>);
  (*(void (**)(char *))(*(void *)(v2 - 8) + 8))((char *)self + v10);
  uint64_t v11 = OBJC_IVAR___HPMHeadphoneDevice__listeningMode;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBListeningMode>);
  (*(void (**)(char *))(*(void *)(v3 - 8) + 8))((char *)self + v11);
  uint64_t v12 = OBJC_IVAR___HPMHeadphoneDevice__clickHoldModeLeft;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBPeerUIGestureMode>);
  uint64_t v14 = *(void (**)(char *))(*(void *)(v13 - 8) + 8);
  v14((char *)self + v12);
  ((void (*)(char *, uint64_t))v14)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__clickHoldModeRight, v13);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__pressHoldAuto, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__pressHoldTransparency, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__pressHoldOff, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__pressHoldNoiseCancel, v24);
  uint64_t v15 = OBJC_IVAR___HPMHeadphoneDevice__doubleTapActionLeft;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBDoubleTapAction>);
  uint64_t v17 = *(void (**)(char *))(*(void *)(v16 - 8) + 8);
  v17((char *)self + v15);
  ((void (*)(char *, uint64_t))v17)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__doubleTapActionRight, v16);
  uint64_t v18 = OBJC_IVAR___HPMHeadphoneDevice__crownRotationDirection;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBPeerCrownRotationDirection>);
  (*(void (**)(char *))(*(void *)(v4 - 8) + 8))((char *)self + v18);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__inEarDetection, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__batteryCharging, v24);
  uint64_t v19 = OBJC_IVAR___HPMHeadphoneDevice__smartRoutingMode;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBSmartRoutingMode>);
  (*(void (**)(char *))(*(void *)(v5 - 8) + 8))((char *)self + v19);
  uint64_t v20 = OBJC_IVAR___HPMHeadphoneDevice__microphoneMode;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBMicrophoneMode>);
  (*(void (**)(char *))(*(void *)(v6 - 8) + 8))((char *)self + v20);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__volumeControlToggle, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__spatialProfileExists, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__isCaseSoundSupported, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__caseSound, v24);
  outlined destroy of BTAirPodsControlServiceClient?((id *)((char *)&self->super.isa
                                                          + OBJC_IVAR___HPMHeadphoneDevice_airPodsServiceClient));
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__isSettingCaseSoundValue, v24);
  uint64_t v21 = OBJC_IVAR___HPMHeadphoneDevice__endCallGesture;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBPeerCallConfig>);
  v23 = *(void (**)(char *))(*(void *)(v22 - 8) + 8);
  v23((char *)self + v21);
  ((void (*)(char *, uint64_t))v23)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__muteControlGesture, v22);
  outlined destroy of [Int : String]();
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__selectiveSpeechListening, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__conversationDetect, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__adaptiveVolume, v24);
  uint64_t v26 = OBJC_IVAR___HPMHeadphoneDevice__batteryLevelMain;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Float>);
  v29 = *(void (**)(char *))(*(void *)(v28 - 8) + 8);
  v29((char *)self + v26);
  uint64_t v27 = OBJC_IVAR___HPMHeadphoneDevice__batteryStateMain;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBBatteryState>);
  v31 = *(void (**)(char *))(*(void *)(v30 - 8) + 8);
  v31((char *)self + v27);
  ((void (*)(char *, uint64_t))v29)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__batteryLevelLeft, v28);
  ((void (*)(char *, uint64_t))v31)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__batteryStateLeft, v30);
  ((void (*)(char *, uint64_t))v29)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__batteryLevelRight, v28);
  ((void (*)(char *, uint64_t))v31)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__batteryStateRight, v30);
  ((void (*)(char *, uint64_t))v29)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__batteryLevelCase, v28);
  ((void (*)(char *, uint64_t))v31)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__batteryStateCase, v30);
  uint64_t v32 = OBJC_IVAR___HPMHeadphoneDevice__hearingRecord;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<HearingRecord>);
  (*(void (**)(char *))(*(void *)(v7 - 8) + 8))((char *)self + v32);
  uint64_t v33 = OBJC_IVAR___HPMHeadphoneDevice__audioAccessoryDevice;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<AADevice>);
  (*(void (**)(char *))(*(void *)(v8 - 8) + 8))((char *)self + v33);
  outlined destroy of weak HeadphoneDeviceDelegate?();
}

@end