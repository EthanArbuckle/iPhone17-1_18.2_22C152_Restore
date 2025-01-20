@interface CoreCECDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)audioMuteStatus;
- (BOOL)audioReturnChannelControlEnabled;
- (BOOL)deckControlCommandWithMode:(unint64_t)a3 target:(id)a4 error:(id *)a5;
- (BOOL)deckControlPlayWithMode:(unint64_t)a3 target:(id)a4 error:(id *)a5;
- (BOOL)deckControlRefreshStatus:(id)a3 requestType:(unint64_t)a4 error:(id *)a5;
- (BOOL)deckControlSetDeckStatus:(unint64_t)a3 error:(id *)a4;
- (BOOL)isActiveSource;
- (BOOL)isCEC2Device;
- (BOOL)isUnregistered;
- (BOOL)makeActiveSourceWithTVMenus:(BOOL)a3 error:(id *)a4;
- (BOOL)performStandbyWithTargetDevice:(id)a3 error:(id *)a4;
- (BOOL)refreshDevices:(id *)a3;
- (BOOL)refreshProperties:(id)a3 ofDevice:(id)a4 error:(id *)a5;
- (BOOL)refreshPropertiesOfDevice:(id)a3 error:(id *)a4;
- (BOOL)requestActiveSource:(id *)a3;
- (BOOL)requestAudioReturnChannelStatusChangeTo:(unint64_t)a3 error:(id *)a4;
- (BOOL)requestAudioStatus:(id *)a3;
- (BOOL)requestSystemAudioModeStatusChangeTo:(unint64_t)a3 error:(id *)a4;
- (BOOL)resignActiveSource:(id *)a3;
- (BOOL)setAudioMuteStatus:(BOOL)a3 error:(id *)a4;
- (BOOL)setAudioReturnChannelControlEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setAudioVolumeStatus:(unint64_t)a3 error:(id *)a4;
- (BOOL)setPowerStatus:(unint64_t)a3 error:(id *)a4;
- (BOOL)setSupportedAudioFormats:(const CoreCECAudioFormat *)a3 count:(unint64_t)a4 error:(id *)a5;
- (BOOL)setSupportedAudioFormats:(id)a3 error:(id *)a4;
- (BOOL)setSystemAudioControlEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setTrackAudioStatusEnabled:(BOOL)a3 pressTimeout:(int64_t)a4 pollInterval:(int64_t)a5 error:(id *)a6;
- (BOOL)systemAudioControlEnabled;
- (BOOL)systemAudioModeRequest:(unint64_t)a3 error:(id *)a4;
- (CoreCECDevice)initWithBus:(id)a3 local:(BOOL)a4;
- (CoreCECDevice)initWithBus:(id)a3 local:(BOOL)a4 logicalAddress:(unsigned __int8)a5 physicalAddress:(unint64_t)a6 attributes:(id)a7;
- (CoreCECDevice)initWithBus:(id)a3 local:(BOOL)a4 logicalAddress:(unsigned __int8)a5 physicalAddress:(unint64_t)a6 deviceType:(unint64_t)a7;
- (CoreCECDevice)initWithCoder:(id)a3;
- (CoreCECDevice)initWithDevice:(id)a3;
- (NSDictionary)audioFormats;
- (NSDictionary)rcProfile;
- (NSString)analyticsDescription;
- (NSString)analyticsKey;
- (id)delegate;
- (id)description;
- (id)mergeProperties;
- (unint64_t)allDeviceTypes;
- (unint64_t)audioFormatsCount;
- (unint64_t)audioVolumeStatus;
- (unint64_t)cecVersion;
- (unint64_t)deckStatus;
- (unint64_t)defaultKnownDeviceFeaturesMaskForCECVersion:(unint64_t)a3;
- (unint64_t)deviceFeatures;
- (unint64_t)deviceType;
- (unint64_t)featureSupportStatus:(unint64_t)a3;
- (unint64_t)knownDeviceFeatures;
- (unint64_t)physicalAddress;
- (unint64_t)powerStatus;
- (unint64_t)vendorID;
- (unsigned)logicalAddress;
- (void)dealloc;
- (void)deckControlCommandHasBeenReceived:(unint64_t)a3 fromDevice:(id)a4;
- (void)deckControlPlayHasBeenReceived:(unint64_t)a3 fromDevice:(id)a4;
- (void)deckControlStatusHasBeenUpdated:(unint64_t)a3 fromDevice:(id)a4;
- (void)didChangePowerStatus:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)notifyDelegateActiveSourceStatusHasChanged;
- (void)notifyDelegateAudioStatusReceived:(unint64_t)a3 muteStatus:(BOOL)a4;
- (void)notifyDelegateDeckControlCommandHasBeenReceived:(id)a3 command:(unint64_t)a4;
- (void)notifyDelegateDeckControlPlayHasBeenReceived:(id)a3 playMode:(unint64_t)a4;
- (void)notifyDelegateDeckControlStatusHasBeenUpdated:(id)a3 deckInfo:(unint64_t)a4;
- (void)notifyDelegateFeatureAbort:(id)a3;
- (void)notifyDelegateReceivedRequestAudioReturnChannelStatusChangeTo:(unint64_t)a3 fromDevice:(id)a4;
- (void)notifyDelegateReceivedRequestSystemAudioModeStatusChangeTo:(unint64_t)a3 fromDevice:(id)a4;
- (void)notifyDelegateRequestAudioReturnChannelStatusChangeTo:(unint64_t)a3 didFinishWithResult:(BOOL)a4 error:(id)a5;
- (void)notifyDelegateRequestSystemAudioModeStatusChangeTo:(unint64_t)a3 didFinishWithResult:(BOOL)a4 error:(id)a5;
- (void)notifyDelegateShouldAssertActiveSource;
- (void)notifyDelegateStandbyRequestHasBeenReceived:(id)a3;
- (void)receivedRequestAudioReturnChannelStatusChangeTo:(unint64_t)a3 fromDevice:(id)a4;
- (void)receivedRequestSystemAudioModeStatusChangeTo:(unint64_t)a3 fromDevice:(id)a4;
- (void)requestAudioReturnChannelStatusChangeTo:(unint64_t)a3 didFinishWithResult:(BOOL)a4 error:(id)a5;
- (void)requestSystemAudioModeStatusChangeTo:(unint64_t)a3 didFinishWithResult:(BOOL)a4 error:(id)a5;
- (void)sendAnalyticsForErrorString:(id)a3 vendorID:(unsigned __int16)a4 productID:(unsigned __int16)a5 serialNumber:(unsigned int)a6 week:(unsigned __int8)a7 year:(unsigned __int8)a8 monitorName:(id)a9;
- (void)sendLogicalAddressErrorAnalyticsForMessage:(const char *)a3;
- (void)setAllDeviceTypes:(unint64_t)a3;
- (void)setAudioFormats:(id)a3;
- (void)setAudioFormatsCount:(unint64_t)a3;
- (void)setAudioMuteStatus:(BOOL)a3;
- (void)setAudioReturnChannelControlEnabled:(BOOL)a3;
- (void)setAudioVolumeStatus:(unint64_t)a3;
- (void)setCecVersion:(unint64_t)a3;
- (void)setDeckStatus:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceFeatures:(unint64_t)a3;
- (void)setDeviceType:(unint64_t)a3;
- (void)setFeature:(unint64_t)a3 supportStatus:(unint64_t)a4;
- (void)setIsActiveSource:(BOOL)a3;
- (void)setKnownDeviceFeatures:(unint64_t)a3;
- (void)setLogicalAddress:(unsigned __int8)a3;
- (void)setPhysicalAddress:(unint64_t)a3;
- (void)setPowerStatus:(unint64_t)a3;
- (void)setRcProfile:(id)a3;
- (void)setVendorID:(unint64_t)a3;
- (void)standbyRequestHasBeenReceived:(id)a3;
@end

@implementation CoreCECDevice

- (NSString)analyticsKey
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"la%02d", -[CoreCECDevice logicalAddress](self, "logicalAddress"));
}

- (NSString)analyticsDescription
{
  unsigned __int16 v11 = -4370;
  PackedPhysicalAddressForCoreCECPhysicalAddress(&v11, [(CoreCECDevice *)self physicalAddress]);
  v3 = NSString;
  unsigned int v4 = [(CoreCECDevice *)self logicalAddress];
  uint64_t v5 = v11;
  unint64_t v6 = [(CoreCECDevice *)self cecVersion];
  unint64_t v7 = [(CoreCECDevice *)self vendorID];
  BOOL v8 = [(CoreRCDevice *)self isLocalDevice];
  v9 = @"R";
  if (v8) {
    v9 = @"L";
  }
  return (NSString *)[v3 stringWithFormat:@"%02X_%04X_%02lX_%06lX_%@", v4, v5, v6, v7, v9];
}

- (void)sendAnalyticsForErrorString:(id)a3 vendorID:(unsigned __int16)a4 productID:(unsigned __int16)a5 serialNumber:(unsigned int)a6 week:(unsigned __int8)a7 year:(unsigned __int8)a8 monitorName:(id)a9
{
  uint64_t v9 = a8;
  uint64_t v10 = a7;
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = a5;
  v18[7] = *MEMORY[0x263EF8340];
  v14 = (void *)MEMORY[0x263EFF9A0];
  v18[0] = a3;
  v17[0] = @"error";
  v17[1] = @"edidVendorID";
  v18[1] = [NSNumber numberWithUnsignedShort:a4];
  v17[2] = @"edidProductID";
  v18[2] = [NSNumber numberWithUnsignedShort:v12];
  v17[3] = @"edidSerialNumber";
  v18[3] = [NSNumber numberWithUnsignedInt:v11];
  v17[4] = @"edidWeek";
  v18[4] = [NSNumber numberWithUnsignedChar:v10];
  v17[5] = @"edidYear";
  v17[6] = @"edidMonitorName";
  v18[5] = [NSNumber numberWithUnsignedChar:v9];
  v18[6] = a9;
  v15 = objc_msgSend(v14, "dictionaryWithDictionary:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 7));
  objc_msgSend(v15, "addEntriesFromDictionary:", objc_msgSend(-[CoreRCDevice bus](self, "bus"), "analyticsContext"));
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
    objc_msgSend(MEMORY[0x263F087E8], "sendCECErrorAnalyticsWithContext:", v15, v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "sendCECErrorAnalyticsWithContext:", v15, v16);
  }
}

- (void)sendLogicalAddressErrorAnalyticsForMessage:(const char *)a3
{
  unsigned int v4 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:&unk_26FEDA7E8];
  objc_msgSend(v4, "addEntriesFromDictionary:", objc_msgSend(-[CoreRCDevice bus](self, "bus"), "analyticsContext"));
  if (gLogCategory_CoreRCDevice <= 90 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    [(CoreCECDevice *)self logicalAddress];
    LogPrintF();
  }
  uint64_t v5 = (void *)MEMORY[0x263F087E8];
  [v5 sendCECErrorAnalyticsWithContext:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isCEC2Device
{
  return [(CoreCECDevice *)self cecVersion] >= 6 && [(CoreCECDevice *)self cecVersion] < 0x40;
}

- (CoreCECDevice)initWithDevice:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7.receiver = self;
    v7.super_class = (Class)CoreCECDevice;
    uint64_t v5 = [(CoreRCDevice *)&v7 initWithDevice:a3];
    if (v5)
    {
      v5->_logicalAddress = [a3 logicalAddress];
      v5->_physicalAddress = [a3 physicalAddress];
      v5->_deviceType = [a3 deviceType];
      v5->_cecVersion = [a3 cecVersion];
      v5->_vendorID = [a3 vendorID];
      v5->_powerStatus = [a3 powerStatus];
      v5->_deckStatus = [a3 deckStatus];
      v5->_isActiveSource = [a3 isActiveSource];
      v5->_systemAudioControlEnabled = [a3 systemAudioControlEnabled];
      v5->_allDeviceTypes = [a3 allDeviceTypes];
      v5->_deviceFeatures = [a3 deviceFeatures];
      v5->_knownDeviceFeatures = [a3 knownDeviceFeatures];
      v5->_rcProfile = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "rcProfile"), "copy");
      v5->_audioReturnChannelControlEnabled = [a3 audioReturnChannelControlEnabled];
      v5->_audioVolumeStatus = [a3 audioVolumeStatus];
      v5->_audioMuteStatus = [a3 audioMuteStatus];
      v5->_audioFormats = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "audioFormats"), "copy");
      v5->_audioFormatsCount = [a3 audioFormatsCount];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (CoreCECDevice)initWithBus:(id)a3 local:(BOOL)a4
{
  BOOL v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8.receiver = self;
    v8.super_class = (Class)CoreCECDevice;
    result = [(CoreRCDevice *)&v8 initWithBus:a3 local:v4];
    if (result)
    {
      result->_logicalAddress = 15;
      result->_physicalAddress = 252645135;
      result->_deviceType = 0;
      result->_cecVersion = -1;
      result->_vendorID = -1;
      result->_powerStatus = 0;
      result->_deckStatus = 0;
      result->_isActiveSource = 0;
      result->_systemAudioControlEnabled = 0;
      result->_allDeviceTypes = 0;
      result->_deviceFeatures = 0;
      result->_knownDeviceFeatures = 0;
      result->_rcProfile = 0;
      result->_audioReturnChannelControlEnabled = 0;
      result->_audioVolumeStatus = 0;
      result->_audioMuteStatus = 0;
      result->_audioFormats = 0;
      result->_audioFormatsCount = 0;
    }
  }
  else
  {

    return 0;
  }
  return result;
}

- (CoreCECDevice)initWithBus:(id)a3 local:(BOOL)a4 logicalAddress:(unsigned __int8)a5 physicalAddress:(unint64_t)a6 deviceType:(unint64_t)a7
{
  uint64_t v8 = a5;
  BOOL v9 = a4;
  id v12 = +[CoreCECDeviceBasicAttributes deviceAttributesWithPrimaryType:a7 otherTypes:0 features:0 rcProfile:0 vendorID:-1 version:-1];
  return [(CoreCECDevice *)self initWithBus:a3 local:v9 logicalAddress:v8 physicalAddress:a6 attributes:v12];
}

- (CoreCECDevice)initWithBus:(id)a3 local:(BOOL)a4 logicalAddress:(unsigned __int8)a5 physicalAddress:(unint64_t)a6 attributes:(id)a7
{
  uint64_t v10 = [(CoreCECDevice *)self initWithBus:a3 local:a4];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_logicalAddress = a5;
    v10->_physicalAddress = a6;
    v10->_deviceType = [a7 deviceType];
    v11->_allDeviceTypes = [a7 allDeviceTypes];
    v11->_deviceFeatures = [a7 deviceFeatures];
    v11->_cecVersion = [a7 cecVersion];
    v11->_vendorID = [a7 vendorID];
    v11->_rcProfile = (NSDictionary *)objc_msgSend((id)objc_msgSend(a7, "rcProfile"), "copy");
    v11->_knownDeviceFeatures = [(CoreCECDevice *)v11 defaultKnownDeviceFeaturesMaskForCECVersion:v11->_cecVersion];
  }
  return v11;
}

- (CoreCECDevice)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CoreCECDevice;
  BOOL v4 = -[CoreRCDevice initWithCoder:](&v9, sel_initWithCoder_);
  if (v4)
  {
    v4->_logicalAddress = [a3 decodeIntegerForKey:@"logicalAddress"];
    v4->_physicalAddress = [a3 decodeIntegerForKey:@"physicalAddress"];
    v4->_deviceType = [a3 decodeIntegerForKey:@"deviceType"];
    v4->_cecVersion = [a3 decodeIntegerForKey:@"cecVersion"];
    v4->_vendorID = [a3 decodeIntegerForKey:@"vendorID"];
    v4->_powerStatus = [a3 decodeIntegerForKey:@"powerStatus"];
    v4->_deckStatus = [a3 decodeIntegerForKey:@"deckStatus"];
    v4->_isActiveSource = [a3 decodeBoolForKey:@"isActiveSource"];
    v4->_systemAudioControlEnabled = [a3 decodeBoolForKey:@"systemAudioControlEnabled"];
    v4->_allDeviceTypes = [a3 decodeIntegerForKey:@"allDeviceTypes"];
    v4->_deviceFeatures = [a3 decodeIntegerForKey:@"deviceFeatures"];
    v4->_knownDeviceFeatures = [a3 decodeIntegerForKey:@"knownDeviceFeatures"];
    v4->_rcProfile = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(+[CoreCECTypesInternal defaultTypes](CoreCECTypesInternal, "defaultTypes"), "rcProfileClasses"), @"rcProfile"), "copy");
    v4->_audioReturnChannelControlEnabled = [a3 decodeBoolForKey:@"audioReturnChannelControlEnabled"];
    v4->_audioVolumeStatus = [a3 decodeIntegerForKey:@"audioVolumeStatus"];
    v4->_audioMuteStatus = [a3 decodeBoolForKey:@"audioMuteStatus"];
    uint64_t v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v4->_audioFormats = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0), @"audioFormats"), "copy");
    v4->_audioFormatsCount = [a3 decodeIntegerForKey:@"audioFormatsCount"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CoreCECDevice;
  -[CoreRCDevice encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeInteger:self->_logicalAddress forKey:@"logicalAddress"];
  [a3 encodeInteger:self->_physicalAddress forKey:@"physicalAddress"];
  [a3 encodeInteger:self->_deviceType forKey:@"deviceType"];
  [a3 encodeInteger:self->_cecVersion forKey:@"cecVersion"];
  [a3 encodeInteger:self->_vendorID forKey:@"vendorID"];
  [a3 encodeInteger:self->_powerStatus forKey:@"powerStatus"];
  [a3 encodeInteger:self->_deckStatus forKey:@"deckStatus"];
  [a3 encodeBool:self->_isActiveSource forKey:@"isActiveSource"];
  [a3 encodeBool:self->_systemAudioControlEnabled forKey:@"systemAudioControlEnabled"];
  [a3 encodeInteger:self->_allDeviceTypes forKey:@"allDeviceTypes"];
  [a3 encodeInteger:self->_deviceFeatures forKey:@"deviceFeatures"];
  [a3 encodeInteger:self->_knownDeviceFeatures forKey:@"knownDeviceFeatures"];
  [a3 encodeObject:self->_rcProfile forKey:@"rcProfile"];
  [a3 encodeBool:self->_audioReturnChannelControlEnabled forKey:@"audioReturnChannelControlEnabled"];
  [a3 encodeInteger:self->_audioVolumeStatus forKey:@"audioVolumeStatus"];
  [a3 encodeBool:self->_audioMuteStatus forKey:@"audioMuteStatus"];
  [a3 encodeObject:self->_audioFormats forKey:@"audioFormats"];
  [a3 encodeInteger:self->_audioFormatsCount forKey:@"audioFormatsCount"];
}

- (id)mergeProperties
{
  return &unk_26FEDA840;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)CoreCECDevice;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[CoreRCDevice description](&v9, sel_description));
  objc_msgSend(v3, "appendFormat:", @" LA: %u (%@);",
    [(CoreCECDevice *)self logicalAddress],
    CoreCECAddressString([(CoreCECDevice *)self logicalAddress]));
  objc_msgSend(v3, "appendFormat:", @" PA: %@;",
    CoreCECPhysicalAddressString([(CoreCECDevice *)self physicalAddress]));
  objc_msgSend(v3, "appendFormat:", @" Type: %@;",
    CoreCECDeviceTypeString([(CoreCECDevice *)self deviceType]));
  objc_msgSend(v3, "appendFormat:", @" CEC: %@;",
    CoreCECVersionString([(CoreCECDevice *)self cecVersion]));
  objc_msgSend(v3, "appendFormat:", @" Vendor: %@;",
    CoreCECVendorIDString([(CoreCECDevice *)self vendorID]));
  objc_msgSend(v3, "appendFormat:", @" Power: %@;",
    CoreCECPowerStatusString([(CoreCECDevice *)self powerStatus]));
  if ([(CoreCECDevice *)self deviceType] == 2 || [(CoreCECDevice *)self deviceType] == 4) {
    objc_msgSend(v3, "appendFormat:", @" Deck: %@;",
  }
      CoreCECDeckInfoString([(CoreCECDevice *)self deckStatus]));
  if ([(CoreRCDevice *)self isLocalDevice])
  {
    if ([(CoreCECDevice *)self systemAudioControlEnabled]) {
      BOOL v4 = "Y";
    }
    else {
      BOOL v4 = "N";
    }
    objc_msgSend(v3, "appendFormat:", @" System Audio Control: %s;", v4);
  }
  if ([(CoreCECDevice *)self deviceType] == 1)
  {
    objc_msgSend(v3, "appendFormat:", @" Volume: %lu;",
      [(CoreCECDevice *)self audioVolumeStatus]);
    if ([(CoreCECDevice *)self audioMuteStatus]) {
      objc_super v5 = "Y";
    }
    else {
      objc_super v5 = "N";
    }
    objc_msgSend(v3, "appendFormat:", @" Mute: %s;", v5);
    if ([(CoreCECDevice *)self audioReturnChannelControlEnabled]) {
      uint64_t v6 = "Y";
    }
    else {
      uint64_t v6 = "N";
    }
    objc_msgSend(v3, "appendFormat:", @" ARC Enable: %s;", v6);
    objc_msgSend(v3, "appendFormat:", @" AudFmts: %lu;",
      [(CoreCECDevice *)self audioFormatsCount]);
  }
  if (self->_isActiveSource) {
    uint64_t v7 = "Y";
  }
  else {
    uint64_t v7 = "N";
  }
  objc_msgSend(v3, "appendFormat:", @" Active Source: %s;", v7);
  objc_msgSend(v3, "appendFormat:", @" All Device Types: 0x%02X;",
    [(CoreCECDevice *)self allDeviceTypes]);
  objc_msgSend(v3, "appendFormat:", @" Features: 0x%08lX;",
    [(CoreCECDevice *)self deviceFeatures]);
  objc_msgSend(v3, "appendFormat:", @" KnownFeatures: 0x%08lX;",
    [(CoreCECDevice *)self knownDeviceFeatures]);
  objc_msgSend(v3, "appendFormat:", @" RCProfile: %@;",
    CoreCECRCProfileString([(CoreCECDevice *)self rcProfile]));
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CoreCECDevice;
  [(CoreRCDevice *)&v3 dealloc];
}

- (id)delegate
{
  v3.receiver = self;
  v3.super_class = (Class)CoreCECDevice;
  return [(CoreRCDevice *)&v3 delegate];
}

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CoreCECDevice;
  [(CoreRCDevice *)&v3 setDelegate:a3];
}

- (unint64_t)defaultKnownDeviceFeaturesMaskForCECVersion:(unint64_t)a3
{
  if ([(CoreCECDevice *)self cecVersion] < 6
    || [(CoreCECDevice *)self cecVersion] >= 0x40)
  {
    return 0;
  }
  else
  {
    return 0x1FFFFFLL;
  }
}

- (BOOL)isUnregistered
{
  return [(CoreCECDevice *)self logicalAddress] == 15;
}

- (void)setIsActiveSource:(BOOL)a3
{
  if (self->_isActiveSource != a3)
  {
    self->_isActiveSource = a3;
    [(CoreCECDevice *)self notifyDelegateActiveSourceStatusHasChanged];
  }
}

- (void)setDeckStatus:(unint64_t)a3
{
  if (a3) {
    self->_deckStatus = a3;
  }
}

- (BOOL)deckControlSetDeckStatus:(unint64_t)a3 error:(id *)a4
{
  if ([(CoreCECDevice *)self deviceType] != 2 && [(CoreCECDevice *)self deviceType] != 4)
  {
    objc_super v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08410];
    uint64_t v11 = -6756;
LABEL_9:
    uint64_t v7 = (void *)[v9 errorWithDomain:v10 code:v11 userInfo:0];
    if (!a4) {
      return v7 == 0;
    }
    goto LABEL_5;
  }
  if (!a3)
  {
    objc_super v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08410];
    uint64_t v11 = -6705;
    goto LABEL_9;
  }
  uint64_t v7 = 0;
  self->_deckStatus = a3;
  if (a4) {
LABEL_5:
  }
    *a4 = v7;
  return v7 == 0;
}

- (BOOL)deckControlCommandWithMode:(unint64_t)a3 target:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)deckControlPlayWithMode:(unint64_t)a3 target:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)deckControlRefreshStatus:(id)a3 requestType:(unint64_t)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)makeActiveSourceWithTVMenus:(BOOL)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)performStandbyWithTargetDevice:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)refreshDevices:(id *)a3
{
  return 0;
}

- (BOOL)refreshProperties:(id)a3 ofDevice:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)refreshPropertiesOfDevice:(id)a3 error:(id *)a4
{
  return [(CoreCECDevice *)self refreshProperties:0 ofDevice:a3 error:a4];
}

- (BOOL)requestActiveSource:(id *)a3
{
  return 0;
}

- (BOOL)resignActiveSource:(id *)a3
{
  return 0;
}

- (BOOL)setSystemAudioControlEnabled:(BOOL)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_systemAudioControlEnabled = a3;
  return 1;
}

- (BOOL)systemAudioModeRequest:(unint64_t)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 1;
}

- (BOOL)setPowerStatus:(unint64_t)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECPowerStatusString(a3);
    LogPrintF();
  }
  if (self->_powerStatus != a3)
  {
    [(CoreCECDevice *)self willChangePowerStatus:a3];
    self->_powerStatus = a3;
    [(CoreCECDevice *)self didChangePowerStatus:a3];
  }
  return 1;
}

- (void)didChangePowerStatus:(unint64_t)a3
{
  id v4 = [(CoreRCDevice *)self bus];
  [v4 notifyDelegateDeviceUpdated:self];
}

- (BOOL)setAudioReturnChannelControlEnabled:(BOOL)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_audioReturnChannelControlEnabled = a3;
  return 1;
}

- (BOOL)requestAudioReturnChannelStatusChangeTo:(unint64_t)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)setAudioVolumeStatus:(unint64_t)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  if (a3 > 0x64)
  {
    if (a4) {
      *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6737 userInfo:0];
    }
  }
  else
  {
    self->_audioVolumeStatus = a3;
  }
  return a3 < 0x65;
}

- (BOOL)setAudioMuteStatus:(BOOL)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  self->_audioMuteStatus = a3;
  return 1;
}

- (BOOL)setSupportedAudioFormats:(const CoreCECAudioFormat *)a3 count:(unint64_t)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)setSupportedAudioFormats:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v16 = objc_opt_class();
    v17 = self;
    LogPrintF();
  }
  if (a3)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = (void *)[a3 allKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      uint64_t v10 = &stru_26FECF2C8;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          int v18 = 0;
          objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v12, v16, v17), "getBytes:length:", &v18, 3);
          uint64_t v13 = [v12 integerValue];
          uint64_t v10 = (__CFString *)[(__CFString *)v10 stringByAppendingFormat:@"0x%02lx:0x%02x%02x%02x ", v13, (char)v18, SBYTE1(v18), SBYTE2(v18)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      objc_opt_class();
      LogPrintF();
    }

    self->_audioFormats = (NSDictionary *)a3;
    unint64_t v14 = [a3 count];
  }
  else
  {
    unint64_t v14 = 0;
    self->_audioFormats = 0;
  }
  self->_audioFormatsCount = v14;
  return 1;
}

- (BOOL)requestSystemAudioModeStatusChangeTo:(unint64_t)a3 error:(id *)a4
{
  return 0;
}

- (unint64_t)featureSupportStatus:(unint64_t)a3
{
  uint64_t v4 = 1 << a3;
  if (([(CoreCECDevice *)self deviceFeatures] & v4) != 0) {
    return 2;
  }
  if (([(CoreCECDevice *)self knownDeviceFeatures] & v4) != 0)
  {
    if (gLogCategory_CoreRCDevice > 40) {
      return 1;
    }
    if (gLogCategory_CoreRCDevice == -1)
    {
      unint64_t v5 = 1;
      if (!_LogCategory_Initialize()) {
        return v5;
      }
    }
    else
    {
      unint64_t v5 = 1;
    }
  }
  else
  {
    if (gLogCategory_CoreRCDevice > 40) {
      return 0;
    }
    if (gLogCategory_CoreRCDevice == -1)
    {
      unint64_t v5 = 0;
      if (!_LogCategory_Initialize()) {
        return v5;
      }
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  LogPrintF();
  return v5;
}

- (void)setFeature:(unint64_t)a3 supportStatus:(unint64_t)a4
{
  switch(a4)
  {
    case 0uLL:
      uint64_t v7 = ~(1 << a3);
      [(CoreCECDevice *)self setDeviceFeatures:[(CoreCECDevice *)self deviceFeatures] & v7];
      unint64_t v8 = [(CoreCECDevice *)self knownDeviceFeatures] & v7;
LABEL_8:
      [(CoreCECDevice *)self setKnownDeviceFeatures:v8];
      return;
    case 1uLL:
      uint64_t v5 = 1 << a3;
      unint64_t v6 = [(CoreCECDevice *)self deviceFeatures] & ~v5;
      goto LABEL_7;
    case 2uLL:
      uint64_t v5 = 1 << a3;
      unint64_t v6 = [(CoreCECDevice *)self deviceFeatures] | (int)v5;
LABEL_7:
      [(CoreCECDevice *)self setDeviceFeatures:v6];
      unint64_t v8 = [(CoreCECDevice *)self knownDeviceFeatures] | v5;
      goto LABEL_8;
  }
  if (gLogCategory_CoreRCDevice <= 90 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (BOOL)setTrackAudioStatusEnabled:(BOOL)a3 pressTimeout:(int64_t)a4 pollInterval:(int64_t)a5 error:(id *)a6
{
  return 0;
}

- (BOOL)requestAudioStatus:(id *)a3
{
  return 0;
}

- (void)deckControlCommandHasBeenReceived:(unint64_t)a3 fromDevice:(id)a4
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECDeckControlModeString(a3);
    objc_opt_class();
    LogPrintF();
  }
  [(CoreCECDevice *)self notifyDelegateDeckControlCommandHasBeenReceived:a4 command:a3];
}

- (void)deckControlPlayHasBeenReceived:(unint64_t)a3 fromDevice:(id)a4
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECPlayModeString(a3);
    objc_opt_class();
    LogPrintF();
  }
  [(CoreCECDevice *)self notifyDelegateDeckControlPlayHasBeenReceived:a4 playMode:a3];
}

- (void)deckControlStatusHasBeenUpdated:(unint64_t)a3 fromDevice:(id)a4
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECDeckInfoString(a3);
    objc_opt_class();
    LogPrintF();
  }
  [(CoreCECDevice *)self notifyDelegateDeckControlStatusHasBeenUpdated:a4 deckInfo:a3];
}

- (void)standbyRequestHasBeenReceived:(id)a3
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    objc_opt_class();
    LogPrintF();
  }
  [(CoreCECDevice *)self notifyDelegateStandbyRequestHasBeenReceived:a3];
}

- (void)receivedRequestSystemAudioModeStatusChangeTo:(unint64_t)a3 fromDevice:(id)a4
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECActivationStatusString(a3);
    objc_opt_class();
    LogPrintF();
  }
  [(CoreCECDevice *)self notifyDelegateReceivedRequestSystemAudioModeStatusChangeTo:a3 fromDevice:a4];
}

- (void)requestSystemAudioModeStatusChangeTo:(unint64_t)a3 didFinishWithResult:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECActivationStatusString(a3);
    LogPrintF();
  }
  [(CoreCECDevice *)self notifyDelegateRequestSystemAudioModeStatusChangeTo:a3 didFinishWithResult:v6 error:a5];
}

- (void)receivedRequestAudioReturnChannelStatusChangeTo:(unint64_t)a3 fromDevice:(id)a4
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECActivationStatusString(a3);
    objc_opt_class();
    LogPrintF();
  }
  [(CoreCECDevice *)self notifyDelegateReceivedRequestAudioReturnChannelStatusChangeTo:a3 fromDevice:a4];
}

- (void)requestAudioReturnChannelStatusChangeTo:(unint64_t)a3 didFinishWithResult:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECActivationStatusString(a3);
    LogPrintF();
  }
  [(CoreCECDevice *)self notifyDelegateRequestAudioReturnChannelStatusChangeTo:a3 didFinishWithResult:v6 error:a5];
}

- (void)notifyDelegateShouldAssertActiveSource
{
  id v3 = [(CoreCECDevice *)self delegate];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v3 cecDeviceShouldAssertActiveSource:self];
  }
}

- (void)notifyDelegateActiveSourceStatusHasChanged
{
  id v3 = [(CoreCECDevice *)self delegate];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    [(CoreCECDevice *)self isActiveSource];
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [(CoreCECDevice *)self isActiveSource];
    [v3 cecDevice:self activeSourceStatusHasChanged:v4];
  }
}

- (void)notifyDelegateDeckControlCommandHasBeenReceived:(id)a3 command:(unint64_t)a4
{
  id v7 = [(CoreCECDevice *)self delegate];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECDeckControlModeString(a4);
    objc_opt_class();
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v7 cecDevice:self deckControlCommandHasBeenReceived:a4 fromDevice:a3];
  }
}

- (void)notifyDelegateDeckControlPlayHasBeenReceived:(id)a3 playMode:(unint64_t)a4
{
  id v7 = [(CoreCECDevice *)self delegate];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECPlayModeString(a4);
    objc_opt_class();
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v7 cecDevice:self deckControlPlayHasBeenReceived:a4 fromDevice:a3];
  }
}

- (void)notifyDelegateDeckControlStatusHasBeenUpdated:(id)a3 deckInfo:(unint64_t)a4
{
  id v7 = [(CoreCECDevice *)self delegate];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECDeckInfoString(a4);
    objc_opt_class();
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v7 cecDevice:self deckControlStatusHasBeenUpdated:a4 fromDevice:a3];
  }
}

- (void)notifyDelegateFeatureAbort:(id)a3
{
  id v5 = [(CoreCECDevice *)self delegate];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v5 cecDevice:self featureAbort:a3];
  }
}

- (void)notifyDelegateStandbyRequestHasBeenReceived:(id)a3
{
  id v5 = [(CoreCECDevice *)self delegate];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    objc_opt_class();
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v5 cecDevice:self standbyRequestHasBeenReceived:a3];
  }
}

- (void)notifyDelegateReceivedRequestSystemAudioModeStatusChangeTo:(unint64_t)a3 fromDevice:(id)a4
{
  id v7 = [(CoreCECDevice *)self delegate];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECActivationStatusString(a3);
    objc_opt_class();
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v7 cecDevice:self receivedRequestSystemAudioModeStatusChangeTo:a3 fromDevice:a4];
  }
}

- (void)notifyDelegateRequestSystemAudioModeStatusChangeTo:(unint64_t)a3 didFinishWithResult:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v9 = [(CoreCECDevice *)self delegate];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECActivationStatusString(a3);
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v9 cecDevice:self requestSystemAudioModeStatusChangeTo:a3 didFinishWithResult:v6 error:a5];
  }
}

- (void)notifyDelegateReceivedRequestAudioReturnChannelStatusChangeTo:(unint64_t)a3 fromDevice:(id)a4
{
  id v7 = [(CoreCECDevice *)self delegate];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECActivationStatusString(a3);
    objc_opt_class();
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v7 cecDevice:self receivedRequestAudioReturnChannelStatusChangeTo:a3 fromDevice:a4];
  }
}

- (void)notifyDelegateRequestAudioReturnChannelStatusChangeTo:(unint64_t)a3 didFinishWithResult:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v9 = [(CoreCECDevice *)self delegate];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECActivationStatusString(a3);
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v9 cecDevice:self requestAudioReturnChannelStatusChangeTo:a3 didFinishWithResult:v6 error:a5];
  }
}

- (void)notifyDelegateAudioStatusReceived:(unint64_t)a3 muteStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(CoreCECDevice *)self delegate];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  if (objc_opt_respondsToSelector())
  {
    [v7 cecDevice:self audioStatusReceived:a3 muteStatus:v4];
  }
}

- (unsigned)logicalAddress
{
  return self->_logicalAddress;
}

- (void)setLogicalAddress:(unsigned __int8)a3
{
  self->_logicalAddress = a3;
}

- (unint64_t)physicalAddress
{
  return self->_physicalAddress;
}

- (void)setPhysicalAddress:(unint64_t)a3
{
  self->_physicalAddress = a3;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unint64_t)a3
{
  self->_deviceType = a3;
}

- (unint64_t)cecVersion
{
  return self->_cecVersion;
}

- (void)setCecVersion:(unint64_t)a3
{
  self->_cecVersion = a3;
}

- (unint64_t)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(unint64_t)a3
{
  self->_vendorID = a3;
}

- (unint64_t)allDeviceTypes
{
  return self->_allDeviceTypes;
}

- (void)setAllDeviceTypes:(unint64_t)a3
{
  self->_allDeviceTypes = a3;
}

- (NSDictionary)rcProfile
{
  return self->_rcProfile;
}

- (void)setRcProfile:(id)a3
{
}

- (unint64_t)powerStatus
{
  return self->_powerStatus;
}

- (void)setPowerStatus:(unint64_t)a3
{
  self->_powerStatus = a3;
}

- (BOOL)isActiveSource
{
  return self->_isActiveSource;
}

- (BOOL)systemAudioControlEnabled
{
  return self->_systemAudioControlEnabled;
}

- (unint64_t)deckStatus
{
  return self->_deckStatus;
}

- (BOOL)audioReturnChannelControlEnabled
{
  return self->_audioReturnChannelControlEnabled;
}

- (void)setAudioReturnChannelControlEnabled:(BOOL)a3
{
  self->_audioReturnChannelControlEnabled = a3;
}

- (unint64_t)audioVolumeStatus
{
  return self->_audioVolumeStatus;
}

- (void)setAudioVolumeStatus:(unint64_t)a3
{
  self->_audioVolumeStatus = a3;
}

- (BOOL)audioMuteStatus
{
  return self->_audioMuteStatus;
}

- (void)setAudioMuteStatus:(BOOL)a3
{
  self->_audioMuteStatus = a3;
}

- (NSDictionary)audioFormats
{
  return self->_audioFormats;
}

- (void)setAudioFormats:(id)a3
{
}

- (unint64_t)audioFormatsCount
{
  return self->_audioFormatsCount;
}

- (void)setAudioFormatsCount:(unint64_t)a3
{
  self->_audioFormatsCount = a3;
}

- (unint64_t)deviceFeatures
{
  return self->_deviceFeatures;
}

- (void)setDeviceFeatures:(unint64_t)a3
{
  self->_deviceFeatures = a3;
}

- (unint64_t)knownDeviceFeatures
{
  return self->_knownDeviceFeatures;
}

- (void)setKnownDeviceFeatures:(unint64_t)a3
{
  self->_knownDeviceFeatures = a3;
}

@end