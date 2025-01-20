@interface AudioAccessoryDevice
+ (BOOL)supportsSecureCoding;
- (AudioAccessoryDevice)initWithCoder:(id)a3;
- (AudioAccessoryDevice)initWithIdentifier:(id)a3;
- (BOOL)setDefaultConfigurationsIfNeeded;
- (BOOL)updateWithAADeviceInfo:(id)a3;
- (BOOL)updateWithCBDevice:(id)a3;
- (CBDevice)coreBluetoothDevice;
- (NSData)bluetoothAddressData;
- (NSDate)audiogramEnrolledTimestamp;
- (NSString)bluetoothAddress;
- (NSString)firmwareVersion;
- (NSString)identifier;
- (char)headGestureProxCardShown;
- (char)headGestureToggle;
- (char)hearingAidEnabled;
- (char)hearingAidEnrolled;
- (char)hearingAidGainSwipeEnabled;
- (char)hearingAssistEnabled;
- (char)heartRateMonitorEnabled;
- (char)listeningModeOffAllowed;
- (char)placementMode;
- (char)siriMultitoneEnabled;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)audioStreamState;
- (int)listeningMode;
- (int)primaryPlacement;
- (int)secondaryPlacement;
- (unsigned)acceptReplyPlayPauseConfig;
- (unsigned)autoANCCapability;
- (unsigned)autoANCStrength;
- (unsigned)bobbleCapability;
- (unsigned)bobbleConfig;
- (unsigned)caseSoundCapability;
- (unsigned)declineDismissSkipConfig;
- (unsigned)detectedHeadGesture;
- (unsigned)earTipFitTestCapability;
- (unsigned)frequencyBand;
- (unsigned)hearingAidCapability;
- (unsigned)hearingAidConfig;
- (unsigned)hearingProtectionCapability;
- (unsigned)hearingTestCapability;
- (unsigned)hideEarDetectionCapability;
- (unsigned)hideOffListeningModeCapability;
- (unsigned)listeningModeConfigs;
- (unsigned)siriMultitoneCapability;
- (unsigned)smartRoutingStateFlags;
- (unsigned)streamStateAoS;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptReplyPlayPauseConfig:(unsigned __int8)a3;
- (void)setAudioStreamState:(int)a3;
- (void)setAudiogramEnrolledTimestamp:(id)a3;
- (void)setAutoANCCapability:(unsigned int)a3;
- (void)setAutoANCStrength:(unsigned int)a3;
- (void)setBluetoothAddressData:(id)a3;
- (void)setBobbleCapability:(unsigned __int8)a3;
- (void)setBobbleConfig:(unsigned __int8)a3;
- (void)setCaseSoundCapability:(unsigned __int8)a3;
- (void)setCoreBluetoothDevice:(id)a3;
- (void)setDeclineDismissSkipConfig:(unsigned __int8)a3;
- (void)setDetectedHeadGesture:(unsigned __int8)a3;
- (void)setEarTipFitTestCapability:(unsigned __int8)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setFrequencyBand:(unsigned __int8)a3;
- (void)setHeadGestureProxCardShown:(char)a3;
- (void)setHeadGestureToggle:(char)a3;
- (void)setHearingAidCapability:(unsigned __int8)a3;
- (void)setHearingAidEnabled:(char)a3;
- (void)setHearingAidEnrolled:(char)a3;
- (void)setHearingAidGainSwipeEnabled:(char)a3;
- (void)setHearingAssistEnabled:(char)a3;
- (void)setHearingProtectionCapability:(unsigned __int8)a3;
- (void)setHearingTestCapability:(unsigned __int8)a3;
- (void)setHeartRateMonitorEnabled:(char)a3;
- (void)setHideEarDetectionCapability:(unsigned __int8)a3;
- (void)setHideOffListeningModeCapability:(unsigned __int8)a3;
- (void)setIdentifier:(id)a3;
- (void)setListeningMode:(int)a3;
- (void)setListeningModeConfigs:(unsigned int)a3;
- (void)setListeningModeOffAllowed:(char)a3;
- (void)setPlacementMode:(char)a3;
- (void)setPrimaryPlacement:(int)a3;
- (void)setSecondaryPlacement:(int)a3;
- (void)setSiriMultitoneCapability:(unsigned __int8)a3;
- (void)setSiriMultitoneEnabled:(char)a3;
- (void)setSmartRoutingStateFlags:(unsigned int)a3;
- (void)setStreamStateAoS:(unsigned __int8)a3;
@end

@implementation AudioAccessoryDevice

- (void)setIdentifier:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AudioAccessoryDevice)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v6 = [(AudioAccessoryDevice *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = v7;
  }

  return v7;
}

- (AudioAccessoryDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AudioAccessoryDevice *)self init];

  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_acceptReplyPlayPauseConfig = 0;
    }
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_audioStreamState = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_autoANCCapability = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_autoANCStrength = 0;
    }
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_bobbleCapability = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_bobbleConfig = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_caseSoundCapability = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_declineDismissSkipConfig = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_detectedHeadGesture = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_earTipFitTestCapability = 0;
    }
    objc_opt_class();
    NSDecodeObjectIfPresent();
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_frequencyBand = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_headGestureToggle = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_headGestureProxCardShown = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingAidCapability = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingAidEnabled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingAidEnrolled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingAidGainSwipeEnabled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingAssistEnabled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingProtectionCapability = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingTestCapability = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_heartRateMonitorEnabled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hideEarDetectionCapability = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hideOffListeningModeCapability = 0;
    }
    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_listeningMode = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_listeningModeConfigs = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_listeningModeOffAllowed = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_placementMode = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_primaryPlacement = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_secondaryPlacement = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_siriMultitoneCapability = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_siriMultitoneEnabled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_smartRoutingStateFlags = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_streamStateAoS = 0;
    }
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v18 = v4;
  if (self->_acceptReplyPlayPauseConfig)
  {
    objc_msgSend(v4, "encodeInteger:forKey:");
    id v4 = v18;
  }
  audiogramEnrolledTimestamp = self->_audiogramEnrolledTimestamp;
  if (audiogramEnrolledTimestamp)
  {
    [v18 encodeObject:audiogramEnrolledTimestamp forKey:@"agET"];
    id v4 = v18;
  }
  uint64_t audioStreamState = self->_audioStreamState;
  if (audioStreamState)
  {
    [v18 encodeInteger:audioStreamState forKey:@"auss"];
    id v4 = v18;
  }
  uint64_t autoANCCapability = self->_autoANCCapability;
  if (autoANCCapability)
  {
    [v18 encodeInt64:autoANCCapability forKey:@"aaCp"];
    id v4 = v18;
  }
  uint64_t autoANCStrength = self->_autoANCStrength;
  if (autoANCStrength)
  {
    [v18 encodeInt64:autoANCStrength forKey:@"aaSt"];
    id v4 = v18;
  }
  coreBluetoothDevice = self->_coreBluetoothDevice;
  if (coreBluetoothDevice)
  {
    [v18 encodeObject:coreBluetoothDevice forKey:@"cbd"];
    id v4 = v18;
  }
  bluetoothAddressData = self->_bluetoothAddressData;
  if (bluetoothAddressData)
  {
    [v18 encodeObject:bluetoothAddressData forKey:@"btAd"];
    id v4 = v18;
  }
  if (self->_bobbleCapability)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_bobbleConfig)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_caseSoundCapability)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_declineDismissSkipConfig)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_detectedHeadGesture)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_earTipFitTestCapability)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  firmwareVersion = self->_firmwareVersion;
  if (firmwareVersion)
  {
    [v18 encodeObject:firmwareVersion forKey:@"frmV"];
    id v4 = v18;
  }
  if (self->_frequencyBand)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_headGestureToggle)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_headGestureProxCardShown)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_hearingAidCapability)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_hearingAidEnabled)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_hearingAidEnrolled)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_hearingAidGainSwipeEnabled)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_hearingAssistEnabled)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_hearingProtectionCapability)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_hearingTestCapability)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_heartRateMonitorEnabled)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_hideEarDetectionCapability)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_hideOffListeningModeCapability)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    [v18 encodeObject:identifier forKey:@"did"];
    id v4 = v18;
  }
  uint64_t listeningMode = self->_listeningMode;
  if (listeningMode)
  {
    [v18 encodeInteger:listeningMode forKey:@"lsnM"];
    id v4 = v18;
  }
  uint64_t listeningModeConfigs = self->_listeningModeConfigs;
  if (listeningModeConfigs)
  {
    [v18 encodeInt64:listeningModeConfigs forKey:@"lsMC"];
    id v4 = v18;
  }
  if (self->_listeningModeOffAllowed)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_placementMode)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  uint64_t primaryPlacement = self->_primaryPlacement;
  if (primaryPlacement)
  {
    [v18 encodeInteger:primaryPlacement forKey:@"prpl"];
    id v4 = v18;
  }
  uint64_t secondaryPlacement = self->_secondaryPlacement;
  if (secondaryPlacement)
  {
    [v18 encodeInteger:secondaryPlacement forKey:@"scpl"];
    id v4 = v18;
  }
  if (self->_siriMultitoneCapability)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  if (self->_siriMultitoneEnabled)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
  uint64_t smartRoutingStateFlags = self->_smartRoutingStateFlags;
  if (smartRoutingStateFlags)
  {
    [v18 encodeInt64:smartRoutingStateFlags forKey:@"smRtS"];
    id v4 = v18;
  }
  if (self->_streamStateAoS)
  {
    objc_msgSend(v18, "encodeInteger:forKey:");
    id v4 = v18;
  }
}

- (NSString)bluetoothAddress
{
  bluetoothAddress = (NSData *)self->_bluetoothAddress;
  if (!bluetoothAddress)
  {
    bluetoothAddress = self->_bluetoothAddressData;
    if (bluetoothAddress)
    {
      CUPrintNSDataAddress();
      id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v5 = self->_bluetoothAddress;
      self->_bluetoothAddress = v4;

      bluetoothAddress = (NSData *)self->_bluetoothAddress;
    }
  }

  return (NSString *)bluetoothAddress;
}

- (id)description
{
  return [(AudioAccessoryDevice *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned __int8 v3 = a3;
  NSAppendPrintF_safe();
  id v5 = 0;
  id v6 = v5;
  if (self->_acceptReplyPlayPauseConfig)
  {
    v51 = v5;
    NSAppendPrintF_safe();
    id v7 = v51;

    id v6 = v7;
  }
  v8 = self->_audiogramEnrolledTimestamp;
  if (v8)
  {
    NSAppendPrintF_safe();
    id v9 = v6;

    id v6 = v9;
  }

  if (self->_audioStreamState)
  {
    NSAppendPrintF_safe();
    id v10 = v6;

    id v6 = v10;
  }
  if (self->_autoANCCapability)
  {
    NSAppendPrintF_safe();
    id v11 = v6;

    id v6 = v11;
  }
  if (self->_autoANCStrength)
  {
    NSAppendPrintF_safe();
    id v13 = v6;

    id v6 = v13;
  }
  if (self->_bobbleCapability)
  {
    NSAppendPrintF_safe();
    id v14 = v6;

    id v6 = v14;
  }
  if (self->_bobbleConfig)
  {
    NSAppendPrintF_safe();
    id v15 = v6;

    id v6 = v15;
  }
  if (self->_caseSoundCapability)
  {
    NSAppendPrintF_safe();
    id v16 = v6;

    id v6 = v16;
  }
  if (self->_earTipFitTestCapability)
  {
    NSAppendPrintF_safe();
    id v17 = v6;

    id v6 = v17;
  }
  if (self->_declineDismissSkipConfig)
  {
    NSAppendPrintF_safe();
    id v18 = v6;

    id v6 = v18;
  }
  if (self->_detectedHeadGesture)
  {
    NSAppendPrintF_safe();
    id v19 = v6;

    id v6 = v19;
  }
  if (self->_headGestureToggle)
  {
    NSAppendPrintF_safe();
    id v20 = v6;

    id v6 = v20;
  }
  if (self->_headGestureProxCardShown)
  {
    NSAppendPrintF_safe();
    id v21 = v6;

    id v6 = v21;
  }
  if (self->_hearingAidCapability)
  {
    NSAppendPrintF_safe();
    id v22 = v6;

    id v6 = v22;
  }
  if (self->_hearingAidEnabled)
  {
    NSAppendPrintF_safe();
    id v23 = v6;

    id v6 = v23;
  }
  if (self->_hearingAidEnrolled)
  {
    NSAppendPrintF_safe();
    id v24 = v6;

    id v6 = v24;
  }
  if (self->_hearingAidGainSwipeEnabled)
  {
    NSAppendPrintF_safe();
    id v25 = v6;

    id v6 = v25;
  }
  if (self->_hearingAssistEnabled)
  {
    NSAppendPrintF_safe();
    id v26 = v6;

    id v6 = v26;
  }
  if (self->_hearingProtectionCapability)
  {
    NSAppendPrintF_safe();
    id v27 = v6;

    id v6 = v27;
  }
  if (self->_hearingTestCapability)
  {
    NSAppendPrintF_safe();
    id v28 = v6;

    id v6 = v28;
  }
  if (self->_heartRateMonitorEnabled)
  {
    NSAppendPrintF_safe();
    id v29 = v6;

    id v6 = v29;
  }
  if (self->_hideEarDetectionCapability)
  {
    NSAppendPrintF_safe();
    id v30 = v6;

    id v6 = v30;
  }
  if (self->_hideOffListeningModeCapability)
  {
    NSAppendPrintF_safe();
    id v31 = v6;

    id v6 = v31;
  }
  if (self->_frequencyBand)
  {
    NSAppendPrintF_safe();
    id v32 = v6;

    id v6 = v32;
  }
  if (self->_listeningMode)
  {
    NSAppendPrintF_safe();
    id v33 = v6;

    id v6 = v33;
  }
  if (self->_listeningModeConfigs)
  {
    v49 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v34 = v6;

    id v6 = v34;
  }
  if (self->_listeningModeOffAllowed)
  {
    NSAppendPrintF_safe();
    id v35 = v6;

    id v6 = v35;
  }
  if (self->_placementMode)
  {
    NSAppendPrintF_safe();
    id v36 = v6;

    id v6 = v36;
  }
  if (self->_primaryPlacement)
  {
    NSAppendPrintF_safe();
    id v37 = v6;

    id v6 = v37;
  }
  if (self->_secondaryPlacement)
  {
    NSAppendPrintF_safe();
    id v38 = v6;

    id v6 = v38;
  }
  if (self->_smartRoutingStateFlags)
  {
    v50 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v39 = v6;

    id v6 = v39;
  }
  if (self->_siriMultitoneCapability)
  {
    NSAppendPrintF_safe();
    id v40 = v6;

    id v6 = v40;
  }
  if (self->_siriMultitoneEnabled)
  {
    NSAppendPrintF_safe();
    id v41 = v6;

    id v6 = v41;
  }
  if (self->_streamStateAoS)
  {
    NSAppendPrintF_safe();
    id v42 = v6;

    id v6 = v42;
  }
  unsigned int v43 = v3;
  v44 = self->_coreBluetoothDevice;
  if (v44)
  {
    NSAppendPrintF_safe();
    id v45 = v6;

    id v6 = v45;
  }

  if (v43 < 0x15)
  {
    NSAppendPrintF_safe();
    id v46 = v6;

    id v6 = v46;
  }
  id v47 = v6;

  return v47;
}

- (void)setBluetoothAddressData:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothAddressData, a3);
  id v7 = a3;
  CUPrintNSDataAddress();
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  bluetoothAddress = self->_bluetoothAddress;
  self->_bluetoothAddress = v5;
}

- (BOOL)setDefaultConfigurationsIfNeeded
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    if (self->_bobbleCapability == 2 && !self->_headGestureToggle)
    {
      self->_headGestureToggle = 2;
      LOBYTE(v3) = 1;
      self->_acceptReplyPlayPauseConfig = 1;
      self->_declineDismissSkipConfig = 2;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)updateWithAADeviceInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 autoANCCapability];
  unsigned int v6 = [(AudioAccessoryDevice *)self autoANCCapability];
  BOOL v7 = v5 != v6;
  if (v5 != v6) {
    [(AudioAccessoryDevice *)self setAutoANCCapability:v5];
  }
  uint64_t v8 = [v4 autoANCStrength];
  if (v8 != [(AudioAccessoryDevice *)self autoANCStrength])
  {
    [(AudioAccessoryDevice *)self setAutoANCStrength:v8];
    BOOL v7 = 1;
  }
  uint64_t v9 = [v4 streamStateAoS];
  if (v9 != [(AudioAccessoryDevice *)self streamStateAoS])
  {
    [(AudioAccessoryDevice *)self setStreamStateAoS:v9];
    BOOL v7 = 1;
  }
  uint64_t v10 = [v4 bobbleCapability];
  if (v10 != [(AudioAccessoryDevice *)self bobbleCapability])
  {
    [(AudioAccessoryDevice *)self setBobbleCapability:v10];
    BOOL v7 = 1;
  }
  uint64_t v11 = [v4 caseSoundCapability];
  if (v11 != [(AudioAccessoryDevice *)self caseSoundCapability])
  {
    [(AudioAccessoryDevice *)self setCaseSoundCapability:v11];
    BOOL v7 = 1;
  }
  uint64_t v12 = [v4 earTipFitTestCapability];
  if (v12 != [(AudioAccessoryDevice *)self earTipFitTestCapability])
  {
    [(AudioAccessoryDevice *)self setEarTipFitTestCapability:v12];
    BOOL v7 = 1;
  }
  uint64_t v13 = [v4 frequencyBand];
  if (v13 != [(AudioAccessoryDevice *)self frequencyBand])
  {
    [(AudioAccessoryDevice *)self setFrequencyBand:v13];
    BOOL v7 = 1;
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v14 = [v4 hearingAidCapability];
    if (v14 != [(AudioAccessoryDevice *)self hearingAidCapability])
    {
      [(AudioAccessoryDevice *)self setHearingAidCapability:v14];
      BOOL v7 = 1;
    }
    int v15 = [v4 hearingAidEnabled];
    if (v15 != [(AudioAccessoryDevice *)self hearingAidEnabled])
    {
      [(AudioAccessoryDevice *)self setHearingAidEnabled:(char)v15];
      BOOL v7 = 1;
    }
    int v16 = [v4 hearingAidEnrolled];
    if (v16 != [(AudioAccessoryDevice *)self hearingAidEnrolled])
    {
      [(AudioAccessoryDevice *)self setHearingAidEnrolled:(char)v16];
      BOOL v7 = 1;
    }
    int v17 = [v4 hearingAidGainSwipeEnabled];
    if (v17 != [(AudioAccessoryDevice *)self hearingAidGainSwipeEnabled])
    {
      [(AudioAccessoryDevice *)self setHearingAidGainSwipeEnabled:(char)v17];
      BOOL v7 = 1;
    }
    int v18 = [v4 hearingAssistEnabled];
    if (v18 != [(AudioAccessoryDevice *)self hearingAssistEnabled])
    {
      [(AudioAccessoryDevice *)self setHearingAssistEnabled:(char)v18];
      BOOL v7 = 1;
    }
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v19 = [v4 hearingProtectionCapability];
    if (v19 != [(AudioAccessoryDevice *)self hearingProtectionCapability])
    {
      [(AudioAccessoryDevice *)self setHearingProtectionCapability:v19];
      BOOL v7 = 1;
    }
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v20 = [v4 hearingTestCapability];
    if (v20 != [(AudioAccessoryDevice *)self hearingTestCapability])
    {
      [(AudioAccessoryDevice *)self setHearingTestCapability:v20];
      BOOL v7 = 1;
    }
  }
  int v21 = [v4 heartRateMonitorEnabled];
  if (v21 != [(AudioAccessoryDevice *)self heartRateMonitorEnabled])
  {
    [(AudioAccessoryDevice *)self setHeartRateMonitorEnabled:(char)v21];
    BOOL v7 = 1;
  }
  uint64_t v22 = [v4 hideEarDetectionCapability];
  if (v22 != [(AudioAccessoryDevice *)self hideEarDetectionCapability])
  {
    [(AudioAccessoryDevice *)self setHideEarDetectionCapability:v22];
    BOOL v7 = 1;
  }
  uint64_t v23 = [v4 hideOffListeningModeCapability];
  if (v23 != [(AudioAccessoryDevice *)self hideOffListeningModeCapability])
  {
    [(AudioAccessoryDevice *)self setHideOffListeningModeCapability:v23];
    BOOL v7 = 1;
  }
  uint64_t v24 = [v4 siriMultitoneCapability];
  if (v24 != [(AudioAccessoryDevice *)self siriMultitoneCapability])
  {
    [(AudioAccessoryDevice *)self setSiriMultitoneCapability:v24];
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)updateWithCBDevice:(id)a3
{
  id v4 = a3;
  bluetoothAddressData = self->_bluetoothAddressData;
  unsigned int v6 = [v4 btAddressData];
  BOOL v7 = bluetoothAddressData;
  uint64_t v8 = v6;
  BOOL v9 = v7 != v8;
  if (v7 == v8)
  {

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v10 = v8;
  if ((v7 == 0) == (v8 != 0))
  {

    goto LABEL_7;
  }
  char v11 = [(NSData *)v7 isEqual:v8];

  if ((v11 & 1) == 0)
  {
LABEL_7:
    BOOL v7 = [v4 btAddressData];
    [(AudioAccessoryDevice *)self setBluetoothAddressData:v7];
    goto LABEL_8;
  }
  BOOL v9 = 0;
LABEL_9:
  uint64_t v12 = [v4 audioStreamState];
  if (v12)
  {
    uint64_t v13 = v12;
    if (v12 != [(AudioAccessoryDevice *)self audioStreamState])
    {
      [(AudioAccessoryDevice *)self setAudioStreamState:v13];
      BOOL v9 = 1;
    }
  }
  firmwareVersion = self->_firmwareVersion;
  int v15 = [v4 firmwareVersion];
  int v16 = firmwareVersion;
  int v17 = v15;
  if (v16 == v17)
  {
  }
  else
  {
    int v18 = v17;
    if ((v16 == 0) != (v17 != 0))
    {
      char v19 = [(NSString *)v16 isEqual:v17];

      if (v19) {
        goto LABEL_20;
      }
    }
    else
    {
    }
    int v16 = [v4 firmwareVersion];
    [(AudioAccessoryDevice *)self setFirmwareVersion:v16];
    BOOL v9 = 1;
  }

LABEL_20:
  uint64_t v20 = [v4 listeningMode];
  if (v20)
  {
    uint64_t v21 = v20;
    if (v20 != [(AudioAccessoryDevice *)self listeningMode])
    {
      [(AudioAccessoryDevice *)self setListeningMode:v21];
      BOOL v9 = 1;
    }
  }
  uint64_t v22 = [v4 listeningModeConfigs];
  if (v22)
  {
    uint64_t v23 = v22;
    if (v22 != [(AudioAccessoryDevice *)self listeningModeConfigs])
    {
      [(AudioAccessoryDevice *)self setListeningModeConfigs:v23];
      BOOL v9 = 1;
    }
  }
  uint64_t v24 = [v4 placementMode];
  if (v24)
  {
    uint64_t v25 = v24;
    if (v24 != [(AudioAccessoryDevice *)self placementMode])
    {
      [(AudioAccessoryDevice *)self setPlacementMode:v25];
      BOOL v9 = 1;
    }
  }
  uint64_t v26 = [v4 primaryPlacement];
  if (v26)
  {
    uint64_t v27 = v26;
    if (v26 != [(AudioAccessoryDevice *)self primaryPlacement])
    {
      [(AudioAccessoryDevice *)self setPrimaryPlacement:v27];
      BOOL v9 = 1;
    }
  }
  uint64_t v28 = [v4 secondaryPlacement];
  if (v28)
  {
    uint64_t v29 = v28;
    if (v28 != [(AudioAccessoryDevice *)self secondaryPlacement])
    {
      [(AudioAccessoryDevice *)self setSecondaryPlacement:v29];
      BOOL v9 = 1;
    }
  }
  coreBluetoothDevice = self->_coreBluetoothDevice;
  self->_coreBluetoothDevice = (CBDevice *)v4;

  return v9;
}

- (unsigned)acceptReplyPlayPauseConfig
{
  return self->_acceptReplyPlayPauseConfig;
}

- (void)setAcceptReplyPlayPauseConfig:(unsigned __int8)a3
{
  self->_acceptReplyPlayPauseConfig = a3;
}

- (NSDate)audiogramEnrolledTimestamp
{
  return self->_audiogramEnrolledTimestamp;
}

- (void)setAudiogramEnrolledTimestamp:(id)a3
{
}

- (int)audioStreamState
{
  return self->_audioStreamState;
}

- (void)setAudioStreamState:(int)a3
{
  self->_uint64_t audioStreamState = a3;
}

- (unsigned)autoANCCapability
{
  return self->_autoANCCapability;
}

- (void)setAutoANCCapability:(unsigned int)a3
{
  self->_uint64_t autoANCCapability = a3;
}

- (unsigned)autoANCStrength
{
  return self->_autoANCStrength;
}

- (void)setAutoANCStrength:(unsigned int)a3
{
  self->_uint64_t autoANCStrength = a3;
}

- (NSData)bluetoothAddressData
{
  return self->_bluetoothAddressData;
}

- (unsigned)bobbleCapability
{
  return self->_bobbleCapability;
}

- (void)setBobbleCapability:(unsigned __int8)a3
{
  self->_bobbleCapability = a3;
}

- (unsigned)bobbleConfig
{
  return self->_bobbleConfig;
}

- (void)setBobbleConfig:(unsigned __int8)a3
{
  self->_bobbleConfig = a3;
}

- (unsigned)caseSoundCapability
{
  return self->_caseSoundCapability;
}

- (void)setCaseSoundCapability:(unsigned __int8)a3
{
  self->_caseSoundCapability = a3;
}

- (unsigned)declineDismissSkipConfig
{
  return self->_declineDismissSkipConfig;
}

- (void)setDeclineDismissSkipConfig:(unsigned __int8)a3
{
  self->_declineDismissSkipConfig = a3;
}

- (unsigned)detectedHeadGesture
{
  return self->_detectedHeadGesture;
}

- (void)setDetectedHeadGesture:(unsigned __int8)a3
{
  self->_detectedHeadGesture = a3;
}

- (unsigned)earTipFitTestCapability
{
  return self->_earTipFitTestCapability;
}

- (void)setEarTipFitTestCapability:(unsigned __int8)a3
{
  self->_earTipFitTestCapability = a3;
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (unsigned)frequencyBand
{
  return self->_frequencyBand;
}

- (void)setFrequencyBand:(unsigned __int8)a3
{
  self->_frequencyBand = a3;
}

- (char)headGestureToggle
{
  return self->_headGestureToggle;
}

- (void)setHeadGestureToggle:(char)a3
{
  self->_headGestureToggle = a3;
}

- (char)headGestureProxCardShown
{
  return self->_headGestureProxCardShown;
}

- (void)setHeadGestureProxCardShown:(char)a3
{
  self->_headGestureProxCardShown = a3;
}

- (unsigned)hearingAidCapability
{
  return self->_hearingAidCapability;
}

- (void)setHearingAidCapability:(unsigned __int8)a3
{
  self->_hearingAidCapability = a3;
}

- (char)hearingAidEnrolled
{
  return self->_hearingAidEnrolled;
}

- (void)setHearingAidEnrolled:(char)a3
{
  self->_hearingAidEnrolled = a3;
}

- (unsigned)hearingAidConfig
{
  return self->_hearingAidConfig;
}

- (char)hearingAidEnabled
{
  return self->_hearingAidEnabled;
}

- (void)setHearingAidEnabled:(char)a3
{
  self->_hearingAidEnabled = a3;
}

- (char)hearingAidGainSwipeEnabled
{
  return self->_hearingAidGainSwipeEnabled;
}

- (void)setHearingAidGainSwipeEnabled:(char)a3
{
  self->_hearingAidGainSwipeEnabled = a3;
}

- (char)hearingAssistEnabled
{
  return self->_hearingAssistEnabled;
}

- (void)setHearingAssistEnabled:(char)a3
{
  self->_hearingAssistEnabled = a3;
}

- (unsigned)hearingProtectionCapability
{
  return self->_hearingProtectionCapability;
}

- (void)setHearingProtectionCapability:(unsigned __int8)a3
{
  self->_hearingProtectionCapability = a3;
}

- (unsigned)hearingTestCapability
{
  return self->_hearingTestCapability;
}

- (void)setHearingTestCapability:(unsigned __int8)a3
{
  self->_hearingTestCapability = a3;
}

- (char)heartRateMonitorEnabled
{
  return self->_heartRateMonitorEnabled;
}

- (void)setHeartRateMonitorEnabled:(char)a3
{
  self->_heartRateMonitorEnabled = a3;
}

- (unsigned)hideEarDetectionCapability
{
  return self->_hideEarDetectionCapability;
}

- (void)setHideEarDetectionCapability:(unsigned __int8)a3
{
  self->_hideEarDetectionCapability = a3;
}

- (unsigned)hideOffListeningModeCapability
{
  return self->_hideOffListeningModeCapability;
}

- (void)setHideOffListeningModeCapability:(unsigned __int8)a3
{
  self->_hideOffListeningModeCapability = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int)listeningMode
{
  return self->_listeningMode;
}

- (void)setListeningMode:(int)a3
{
  self->_uint64_t listeningMode = a3;
}

- (unsigned)listeningModeConfigs
{
  return self->_listeningModeConfigs;
}

- (void)setListeningModeConfigs:(unsigned int)a3
{
  self->_uint64_t listeningModeConfigs = a3;
}

- (char)listeningModeOffAllowed
{
  return self->_listeningModeOffAllowed;
}

- (void)setListeningModeOffAllowed:(char)a3
{
  self->_listeningModeOffAllowed = a3;
}

- (char)placementMode
{
  return self->_placementMode;
}

- (void)setPlacementMode:(char)a3
{
  self->_placementMode = a3;
}

- (int)primaryPlacement
{
  return self->_primaryPlacement;
}

- (void)setPrimaryPlacement:(int)a3
{
  self->_uint64_t primaryPlacement = a3;
}

- (int)secondaryPlacement
{
  return self->_secondaryPlacement;
}

- (void)setSecondaryPlacement:(int)a3
{
  self->_uint64_t secondaryPlacement = a3;
}

- (unsigned)siriMultitoneCapability
{
  return self->_siriMultitoneCapability;
}

- (void)setSiriMultitoneCapability:(unsigned __int8)a3
{
  self->_siriMultitoneCapability = a3;
}

- (char)siriMultitoneEnabled
{
  return self->_siriMultitoneEnabled;
}

- (void)setSiriMultitoneEnabled:(char)a3
{
  self->_siriMultitoneEnabled = a3;
}

- (unsigned)smartRoutingStateFlags
{
  return self->_smartRoutingStateFlags;
}

- (void)setSmartRoutingStateFlags:(unsigned int)a3
{
  self->_uint64_t smartRoutingStateFlags = a3;
}

- (unsigned)streamStateAoS
{
  return self->_streamStateAoS;
}

- (void)setStreamStateAoS:(unsigned __int8)a3
{
  self->_streamStateAoS = a3;
}

- (CBDevice)coreBluetoothDevice
{
  return self->_coreBluetoothDevice;
}

- (void)setCoreBluetoothDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreBluetoothDevice, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_bluetoothAddressData, 0);
  objc_storeStrong((id *)&self->_audiogramEnrolledTimestamp, 0);

  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end