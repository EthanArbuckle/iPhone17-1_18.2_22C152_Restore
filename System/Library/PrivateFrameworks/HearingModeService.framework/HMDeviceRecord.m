@interface HMDeviceRecord
+ (BOOL)supportsSecureCoding;
+ (char)getHMMultiStateFromPMEState:(unsigned __int8)a3;
+ (char)multiStateForAAFeatureCapability:(unsigned __int8)a3;
- (AudioAccessoryDevice)aaDevice;
- (BOOL)cloudRecordLoaded;
- (BOOL)occlusionResultReady;
- (BOOL)setOcclusionResult:(int)a3 forFeatureID:(int)a4;
- (BOOL)updateWithAADevice:(id)a3;
- (BOOL)updateWithCloudRecordInfo:(id)a3;
- (BOOL)updateWithHearingAidConfigData:(id)a3;
- (BOOL)updateWithHearingProtectionValue:(unsigned __int8)a3;
- (BOOL)updateWithPMEConfigData:(id)a3;
- (HMDeviceCloudRecordInfo)cloudRecord;
- (HMDeviceRecord)init;
- (HMDeviceRecord)initWithCoder:(id)a3;
- (NSArray)earLossArrayLeft;
- (NSArray)earLossArrayRight;
- (NSArray)pmeMediaLossPresetsLeft;
- (NSArray)pmeMediaLossPresetsRight;
- (NSArray)pmeVoiceLossPresetsLeft;
- (NSArray)pmeVoiceLossPresetsRight;
- (NSData)bluetoothAddressData;
- (NSData)configDataHearingAid;
- (NSData)configDataPME;
- (NSData)earLossDataLeft;
- (NSData)earLossDataRight;
- (NSData)pmeMediaLossDataLeft;
- (NSData)pmeMediaLossDataRight;
- (NSData)pmeVoiceLossDataLeft;
- (NSData)pmeVoiceLossDataRight;
- (NSDate)audiogramEnrolledTimestamp;
- (NSMutableDictionary)pendingOcclusionCompletionsMap;
- (NSNumber)amplification;
- (NSNumber)balance;
- (NSNumber)beamFormer;
- (NSNumber)noiseSuppression;
- (NSNumber)tone;
- (NSString)bluetoothAddress;
- (NSString)bluetoothUUID;
- (char)hearingAidEnabled;
- (char)hearingAssistCapability;
- (char)hearingAssistEnabled;
- (char)hearingAssistEnrolled;
- (char)hearingProtectionCapability;
- (char)hearingProtectionEnabled;
- (char)hearingTestCapability;
- (char)hideOffModeCapability;
- (char)listeningModeOffAllowed;
- (char)mediaAssistEnabled;
- (char)pmeMediaEnabled;
- (char)pmeVoiceEnabled;
- (char)pmeVoiceEnrolled;
- (char)swipeGainEnabled;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)getOcclusionResultForFeatureID:(int)a3;
- (int)hearingProtectionOcclusionResult;
- (int)hearingTestOcclusionResult;
- (unsigned)currentNoiseLevel;
- (unsigned)hearingAssistRegionStatus;
- (unsigned)hearingProtectionRegionStatus;
- (unsigned)hearingTestRegionStatus;
- (void)_deriveMediaAssistStateIfNeeded;
- (void)encodeWithCoder:(id)a3;
- (void)invokePendingOcclusionCompletionsWithError:(id)a3;
- (void)setAaDevice:(id)a3;
- (void)setCloudRecord:(id)a3;
- (void)setCloudRecordLoaded:(BOOL)a3;
- (void)setConfigDataHearingAid:(id)a3;
- (void)setConfigDataPME:(id)a3;
- (void)setCurrentNoiseLevel:(unsigned int)a3;
- (void)setEarLossDataLeft:(id)a3;
- (void)setEarLossDataRight:(id)a3;
- (void)setHearingAssistRegionStatus:(unsigned __int8)a3;
- (void)setHearingProtectionOcclusionResult:(int)a3;
- (void)setHearingProtectionRegionStatus:(unsigned __int8)a3;
- (void)setHearingTestOcclusionResult:(int)a3;
- (void)setHearingTestRegionStatus:(unsigned __int8)a3;
- (void)setMediaAssistEnabled:(char)a3;
- (void)setOcclusionResultReady:(BOOL)a3;
- (void)setPendingOcclusionCompletionsMap:(id)a3;
- (void)setPmeMediaLossDataLeft:(id)a3;
- (void)setPmeMediaLossDataRight:(id)a3;
- (void)setPmeVoiceLossDataLeft:(id)a3;
- (void)setPmeVoiceLossDataRight:(id)a3;
@end

@implementation HMDeviceRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (char)getHMMultiStateFromPMEState:(unsigned __int8)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

+ (char)multiStateForAAFeatureCapability:(unsigned __int8)a3
{
  if (a3 == 2) {
    return 1;
  }
  else {
    return 2 * (a3 == 1);
  }
}

- (HMDeviceRecord)init
{
  v9.receiver = self;
  v9.super_class = (Class)HMDeviceRecord;
  v2 = [(HMDeviceRecord *)&v9 init];
  v3 = v2;
  if (v2)
  {
    amplification = v2->_amplification;
    v2->_amplification = (NSNumber *)&unk_270211128;

    balance = v3->_balance;
    v3->_balance = (NSNumber *)&unk_270211128;

    tone = v3->_tone;
    v3->_tone = (NSNumber *)&unk_270211128;

    v7 = v3;
  }

  return v3;
}

- (HMDeviceRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDeviceRecord *)self init];
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    p_earLossDataRight = (void **)&v5->_earLossDataRight;
    NSDecodeObjectIfPresent();
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingAidEnabled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingAssistCapability = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingAssistEnabled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingAssistEnrolled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingAssistRegionStatus = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingProtectionCapability = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingProtectionEnabled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingProtectionOcclusionResult = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingProtectionRegionStatus = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingTestCapability = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingTestRegionStatus = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hideOffModeCapability = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_listeningModeOffAllowed = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_mediaAssistEnabled = 0;
    }
    objc_opt_class();
    NSDecodeObjectIfPresent();
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_pmeMediaEnabled = 0;
    }
    objc_opt_class();
    p_pmeMediaLossDataLeft = (void **)&v5->_pmeMediaLossDataLeft;
    NSDecodeObjectIfPresent();
    objc_opt_class();
    p_pmeMediaLossDataRight = (void **)&v5->_pmeMediaLossDataRight;
    NSDecodeObjectIfPresent();
    objc_opt_class();
    p_pmeVoiceLossDataLeft = (void **)&v5->_pmeVoiceLossDataLeft;
    NSDecodeObjectIfPresent();
    objc_opt_class();
    p_pmeVoiceLossDataRight = (void **)&v5->_pmeVoiceLossDataRight;
    NSDecodeObjectIfPresent();
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_pmeVoiceEnabled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_pmeVoiceEnrolled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_swipeGainEnabled = 0;
    }
    objc_opt_class();
    NSDecodeObjectIfPresent();
    earLossDataLeft = v5->_earLossDataLeft;
    if (earLossDataLeft)
    {
      uint64_t v15 = HMEarLossDataToArray(earLossDataLeft);
      earLossArrayLeft = v5->_earLossArrayLeft;
      v5->_earLossArrayLeft = (NSArray *)v15;
    }
    if (*p_earLossDataRight)
    {
      uint64_t v17 = HMEarLossDataToArray(*p_earLossDataRight);
      earLossArrayRight = v5->_earLossArrayRight;
      v5->_earLossArrayRight = (NSArray *)v17;
    }
    if (*p_pmeMediaLossDataLeft)
    {
      uint64_t v19 = HMEarLossDataToArray(*p_pmeMediaLossDataLeft);
      pmeMediaLossPresetsLeft = v5->_pmeMediaLossPresetsLeft;
      v5->_pmeMediaLossPresetsLeft = (NSArray *)v19;
    }
    if (*p_pmeMediaLossDataRight)
    {
      uint64_t v21 = HMEarLossDataToArray(*p_pmeMediaLossDataRight);
      pmeMediaLossPresetsRight = v5->_pmeMediaLossPresetsRight;
      v5->_pmeMediaLossPresetsRight = (NSArray *)v21;
    }
    if (*p_pmeVoiceLossDataLeft)
    {
      uint64_t v23 = HMEarLossDataToArray(*p_pmeVoiceLossDataLeft);
      pmeVoiceLossPresetsLeft = v5->_pmeVoiceLossPresetsLeft;
      v5->_pmeVoiceLossPresetsLeft = (NSArray *)v23;
    }
    if (*p_pmeVoiceLossDataRight)
    {
      uint64_t v25 = HMEarLossDataToArray(*p_pmeVoiceLossDataRight);
      pmeVoiceLossPresetsRight = v5->_pmeVoiceLossPresetsRight;
      v5->_pmeVoiceLossPresetsRight = (NSArray *)v25;
    }
    v27 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  amplification = self->_amplification;
  id v21 = v4;
  if (amplification)
  {
    [v4 encodeObject:amplification forKey:@"ampl"];
    id v4 = v21;
  }
  audiogramEnrolledTimestamp = self->_audiogramEnrolledTimestamp;
  if (audiogramEnrolledTimestamp)
  {
    [v21 encodeObject:audiogramEnrolledTimestamp forKey:@"agET"];
    id v4 = v21;
  }
  balance = self->_balance;
  if (balance)
  {
    [v21 encodeObject:balance forKey:@"balc"];
    id v4 = v21;
  }
  beamFormer = self->_beamFormer;
  if (beamFormer)
  {
    [v21 encodeObject:beamFormer forKey:@"bmFm"];
    id v4 = v21;
  }
  bluetoothUUID = self->_bluetoothUUID;
  if (bluetoothUUID)
  {
    [v21 encodeObject:bluetoothUUID forKey:@"btUUID"];
    id v4 = v21;
  }
  bluetoothAddress = self->_bluetoothAddress;
  if (bluetoothAddress)
  {
    [v21 encodeObject:bluetoothAddress forKey:@"btAdS"];
    id v4 = v21;
  }
  bluetoothAddressData = self->_bluetoothAddressData;
  if (bluetoothAddressData)
  {
    [v21 encodeObject:bluetoothAddressData forKey:@"btAd"];
    id v4 = v21;
  }
  earLossDataLeft = self->_earLossDataLeft;
  if (earLossDataLeft)
  {
    [v21 encodeObject:earLossDataLeft forKey:@"ElLT"];
    id v4 = v21;
  }
  earLossDataRight = self->_earLossDataRight;
  if (earLossDataRight)
  {
    [v21 encodeObject:earLossDataRight forKey:@"ELRT"];
    id v4 = v21;
  }
  if (self->_hearingAidEnabled)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  if (self->_hearingAssistCapability)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  if (self->_hearingAssistEnabled)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  if (self->_hearingAssistEnrolled)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  if (self->_hearingAssistRegionStatus)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  if (self->_hearingProtectionCapability)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  if (self->_hearingProtectionEnabled)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  uint64_t hearingProtectionOcclusionResult = self->_hearingProtectionOcclusionResult;
  if (hearingProtectionOcclusionResult)
  {
    [v21 encodeInteger:hearingProtectionOcclusionResult forKey:@"hPOc"];
    id v4 = v21;
  }
  if (self->_hearingProtectionRegionStatus)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  if (self->_hearingTestCapability)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  if (self->_hearingTestRegionStatus)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  if (self->_hideOffModeCapability)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  if (self->_listeningModeOffAllowed)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  if (self->_mediaAssistEnabled)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  noiseSuppression = self->_noiseSuppression;
  if (noiseSuppression)
  {
    [v21 encodeObject:noiseSuppression forKey:@"nsSp"];
    id v4 = v21;
  }
  if (self->_pmeMediaEnabled)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  pmeMediaLossDataLeft = self->_pmeMediaLossDataLeft;
  if (pmeMediaLossDataLeft)
  {
    [v21 encodeObject:pmeMediaLossDataLeft forKey:@"pmML"];
    id v4 = v21;
  }
  pmeMediaLossDataRight = self->_pmeMediaLossDataRight;
  if (pmeMediaLossDataRight)
  {
    [v21 encodeObject:pmeMediaLossDataRight forKey:@"pmMR"];
    id v4 = v21;
  }
  pmeVoiceLossDataLeft = self->_pmeVoiceLossDataLeft;
  if (pmeVoiceLossDataLeft)
  {
    [v21 encodeObject:pmeVoiceLossDataLeft forKey:@"pmVL"];
    id v4 = v21;
  }
  pmeVoiceLossDataRight = self->_pmeVoiceLossDataRight;
  if (pmeVoiceLossDataRight)
  {
    [v21 encodeObject:pmeVoiceLossDataRight forKey:@"pmVR"];
    id v4 = v21;
  }
  if (self->_pmeVoiceEnabled)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  if (self->_pmeVoiceEnrolled)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  if (self->_swipeGainEnabled)
  {
    objc_msgSend(v21, "encodeInteger:forKey:");
    id v4 = v21;
  }
  tone = self->_tone;
  if (tone)
  {
    [v21 encodeObject:tone forKey:@"tone"];
    id v4 = v21;
  }
}

- (id)description
{
  return [(HMDeviceRecord *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  v44 = [(id)objc_opt_class() description];
  NSAppendPrintF_safe();
  id v5 = 0;

  id v6 = self->_amplification;
  if (v6)
  {
    NSAppendPrintF_safe();
    id v7 = v5;

    id v5 = v7;
  }

  id v8 = self->_audiogramEnrolledTimestamp;
  if (v8)
  {
    NSAppendPrintF_safe();
    id v9 = v5;

    id v5 = v9;
  }

  v10 = self->_balance;
  if (v10)
  {
    NSAppendPrintF_safe();
    id v11 = v5;

    id v5 = v11;
  }

  v12 = self->_beamFormer;
  if (v12)
  {
    NSAppendPrintF_safe();
    id v13 = v5;

    id v5 = v13;
  }

  v14 = self->_bluetoothAddress;
  if (v14)
  {
    NSAppendPrintF_safe();
    id v15 = v5;

    id v5 = v15;
  }

  v16 = self->_bluetoothUUID;
  if (v16)
  {
    NSAppendPrintF_safe();
    id v17 = v5;

    id v5 = v17;
  }

  if (self->_hearingAidEnabled)
  {
    NSAppendPrintF_safe();
    id v18 = v5;

    id v5 = v18;
  }
  if (self->_hearingAssistCapability)
  {
    NSAppendPrintF_safe();
    id v19 = v5;

    id v5 = v19;
  }
  if (self->_hearingAssistEnabled)
  {
    NSAppendPrintF_safe();
    id v20 = v5;

    id v5 = v20;
  }
  if (self->_hearingAssistEnrolled)
  {
    NSAppendPrintF_safe();
    id v21 = v5;

    id v5 = v21;
  }
  if (self->_hearingAssistRegionStatus)
  {
    NSAppendPrintF_safe();
    id v22 = v5;

    id v5 = v22;
  }
  if (self->_hearingProtectionCapability)
  {
    NSAppendPrintF_safe();
    id v23 = v5;

    id v5 = v23;
  }
  if (self->_hearingProtectionEnabled)
  {
    NSAppendPrintF_safe();
    id v24 = v5;

    id v5 = v24;
  }
  if (self->_hearingProtectionOcclusionResult)
  {
    NSAppendPrintF_safe();
    id v25 = v5;

    id v5 = v25;
  }
  if (self->_hearingProtectionRegionStatus)
  {
    NSAppendPrintF_safe();
    id v26 = v5;

    id v5 = v26;
  }
  if (self->_hearingTestCapability)
  {
    NSAppendPrintF_safe();
    id v27 = v5;

    id v5 = v27;
  }
  if (self->_hearingTestOcclusionResult)
  {
    NSAppendPrintF_safe();
    id v28 = v5;

    id v5 = v28;
  }
  if (self->_hearingTestRegionStatus)
  {
    NSAppendPrintF_safe();
    id v29 = v5;

    id v5 = v29;
  }
  if (self->_hideOffModeCapability)
  {
    NSAppendPrintF_safe();
    id v30 = v5;

    id v5 = v30;
  }
  if (self->_listeningModeOffAllowed)
  {
    NSAppendPrintF_safe();
    id v31 = v5;

    id v5 = v31;
  }
  if (self->_mediaAssistEnabled)
  {
    NSAppendPrintF_safe();
    id v32 = v5;

    id v5 = v32;
  }
  v33 = self->_noiseSuppression;
  if (v33)
  {
    NSAppendPrintF_safe();
    id v34 = v5;

    id v5 = v34;
  }

  if (self->_pmeMediaEnabled)
  {
    NSAppendPrintF_safe();
    id v35 = v5;

    id v5 = v35;
  }
  if (self->_pmeVoiceEnabled)
  {
    NSAppendPrintF_safe();
    id v36 = v5;

    id v5 = v36;
  }
  if (self->_pmeVoiceEnrolled)
  {
    NSAppendPrintF_safe();
    id v37 = v5;

    id v5 = v37;
  }
  if (self->_swipeGainEnabled)
  {
    NSAppendPrintF_safe();
    id v38 = v5;

    id v5 = v38;
  }
  v39 = self->_tone;
  if (v39)
  {
    NSAppendPrintF_safe();
    id v40 = v5;

    id v5 = v40;
  }

  if (a3 < 21)
  {
    NSAppendPrintF_safe();
    id v41 = v5;

    id v5 = v41;
  }
  id v42 = v5;

  return v42;
}

- (int)getOcclusionResultForFeatureID:(int)a3
{
  if (a3 == 2) {
    return self->_hearingProtectionOcclusionResult;
  }
  if (a3 == 3) {
    return self->_hearingTestOcclusionResult;
  }
  if (gLogCategory_HMDeviceRecord > 90) {
    return 0;
  }
  if (gLogCategory_HMDeviceRecord != -1 || (int result = _LogCategory_Initialize()) != 0)
  {
    LogPrintF();
    return 0;
  }
  return result;
}

- (BOOL)setOcclusionResult:(int)a3 forFeatureID:(int)a4
{
  if (a4 == 2)
  {
    if (self->_hearingProtectionOcclusionResult != a3)
    {
      self->_uint64_t hearingProtectionOcclusionResult = a3;
      goto LABEL_7;
    }
LABEL_11:
    LOBYTE(v4) = 0;
    return v4;
  }
  if (a4 == 3)
  {
    if (self->_hearingTestOcclusionResult != a3)
    {
      self->_hearingTestOcclusionResult = a3;
LABEL_7:
      LOBYTE(v4) = 1;
      return v4;
    }
    goto LABEL_11;
  }
  if (gLogCategory_HMDeviceRecord > 90) {
    goto LABEL_11;
  }
  if (gLogCategory_HMDeviceRecord != -1 || (int v4 = _LogCategory_Initialize()) != 0)
  {
    LogPrintF();
    goto LABEL_11;
  }
  return v4;
}

- (void)invokePendingOcclusionCompletionsWithError:(id)a3
{
  id v4 = a3;
  pendingOcclusionCompletionsMap = self->_pendingOcclusionCompletionsMap;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __61__HMDeviceRecord_invokePendingOcclusionCompletionsWithError___block_invoke;
  id v11 = &unk_265361290;
  v12 = self;
  id v13 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)pendingOcclusionCompletionsMap enumerateKeysAndObjectsUsingBlock:&v8];
  [(NSMutableDictionary *)self->_pendingOcclusionCompletionsMap removeAllObjects];
  id v7 = self->_pendingOcclusionCompletionsMap;
  self->_pendingOcclusionCompletionsMap = 0;
}

void __61__HMDeviceRecord_invokePendingOcclusionCompletionsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "getOcclusionResultForFeatureID:", objc_msgSend(v5, "unsignedIntValue", v16, v17, v18));
        if (gLogCategory_HMDeviceRecord <= 30
          && (gLogCategory_HMDeviceRecord != -1 || _LogCategory_Initialize()))
        {
          uint64_t v13 = MEMORY[0x253398200](v11);
          v14 = (void *)v13;
          id v15 = "?";
          if (v12 <= 7) {
            id v15 = off_265361300[(int)v12];
          }
          uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 88);
          id v18 = v15;
          uint64_t v16 = v13;
          LogPrintF();
        }
        (*(void (**)(uint64_t, uint64_t, void))(v11 + 16))(v11, v12, *(void *)(a1 + 40));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
}

- (void)_deriveMediaAssistStateIfNeeded
{
  int hearingAssistEnabled = self->_hearingAssistEnabled;
  if ((self->_hearingAssistEnabled || self->_pmeMediaEnabled || self->_pmeVoiceEnabled) && !self->_mediaAssistEnabled)
  {
    char v3 = 1;
    if (self->_pmeMediaEnabled != 1)
    {
      if (self->_pmeVoiceEnabled == 1) {
        char v3 = 1;
      }
      else {
        char v3 = 2;
      }
    }
    if (hearingAssistEnabled == 2)
    {
      char v3 = 2;
    }
    else if (hearingAssistEnabled != 1)
    {
      return;
    }
    self->_mediaAssistEnabled = v3;
    if (gLogCategory_HMDeviceRecord <= 30
      && (gLogCategory_HMDeviceRecord != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (BOOL)updateWithAADevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bluetoothAddressData];
  id v6 = self->_bluetoothAddressData;
  uint64_t v7 = v5;
  p_isa = (NSString *)&v7->super.isa;
  BOOL v9 = v6 != v7;
  if (v6 == v7)
  {

    bluetoothAddress = p_isa;
  }
  else
  {
    if ((v7 != 0) != (v6 == 0))
    {
      char v10 = [(NSData *)v6 isEqual:v7];

      if (v10)
      {
        BOOL v9 = 0;
        goto LABEL_9;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_bluetoothAddressData, v5);
    CUPrintNSDataAddress();
    uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    bluetoothAddress = self->_bluetoothAddress;
    self->_bluetoothAddress = v12;
  }

LABEL_9:
  uint64_t v13 = [v4 identifier];
  v14 = self->_bluetoothUUID;
  id v15 = v13;
  uint64_t v16 = v15;
  if (v14 == v15)
  {

    bluetoothUUID = v16;
  }
  else
  {
    if ((v15 != 0) != (v14 == 0))
    {
      char v17 = [(NSString *)v14 isEqual:v15];

      if (v17) {
        goto LABEL_17;
      }
    }
    else
    {
    }
    long long v19 = v16;
    bluetoothUUID = self->_bluetoothUUID;
    self->_bluetoothUUID = v19;
    BOOL v9 = 1;
  }

LABEL_17:
  long long v20 = [v4 audiogramEnrolledTimestamp];
  long long v21 = v20;
  if (v20 && ([v20 isEqualToDate:self->_audiogramEnrolledTimestamp] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_audiogramEnrolledTimestamp, v21);
    BOOL v9 = 1;
  }
  int v22 = [v4 audioStreamState];
  if (v22 != [(AudioAccessoryDevice *)self->_aaDevice audioStreamState]) {
    BOOL v9 = 1;
  }
  int v23 = [v4 hearingAidCapability];
  if (v23 == 1) {
    int hearingAssistCapability = 2;
  }
  else {
    int hearingAssistCapability = self->_hearingAssistCapability;
  }
  if (v23 == 2) {
    int hearingAssistCapability = 1;
  }
  if (hearingAssistCapability != self->_hearingAssistCapability)
  {
    self->_int hearingAssistCapability = hearingAssistCapability;
    BOOL v9 = 1;
  }
  char v25 = [v4 hearingAidEnabled];
  if (self->_hearingAidEnabled != v25)
  {
    self->_hearingAidEnabled = v25;
    BOOL v9 = 1;
  }
  char v26 = [v4 hearingAssistEnabled];
  if (self->_hearingAssistEnabled != v26)
  {
    self->_int hearingAssistEnabled = v26;
    BOOL v9 = 1;
  }
  char v27 = [v4 hearingAidEnrolled];
  if (self->_hearingAssistEnrolled != v27)
  {
    self->_hearingAssistEnrolled = v27;
    BOOL v9 = 1;
  }
  if ([v4 hearingProtectionCapability] == 2) {
    int v28 = 1;
  }
  else {
    int v28 = 2;
  }
  if (v28 != self->_hearingProtectionCapability)
  {
    self->_hearingProtectionCapability = v28;
    BOOL v9 = 1;
  }
  if ([v4 hearingTestCapability] == 2) {
    int v29 = 1;
  }
  else {
    int v29 = 2;
  }
  if (v29 != self->_hearingTestCapability)
  {
    self->_hearingTestCapability = v29;
    BOOL v9 = 1;
  }
  char v30 = +[HMDeviceRecord multiStateForAAFeatureCapability:](HMDeviceRecord, "multiStateForAAFeatureCapability:", [v4 hideOffListeningModeCapability]);
  if (self->_hideOffModeCapability != v30)
  {
    self->_hideOffModeCapability = v30;
    BOOL v9 = 1;
  }
  char v31 = [v4 listeningModeOffAllowed];
  v45 = v16;
  id v32 = v21;
  v33 = p_isa;
  if (_os_feature_enabled_impl() && self->_listeningModeOffAllowed != v31)
  {
    self->_listeningModeOffAllowed = v31;
    BOOL v9 = 1;
  }
  int v34 = [v4 placementMode];
  int v35 = [(AudioAccessoryDevice *)self->_aaDevice placementMode];
  int v36 = [v4 primaryPlacement];
  int v37 = [(AudioAccessoryDevice *)self->_aaDevice primaryPlacement];
  int v38 = [v4 secondaryPlacement];
  BOOL v41 = v38 != [(AudioAccessoryDevice *)self->_aaDevice secondaryPlacement]
     || v36 != v37
     || v34 != v35
     || v9;
  char v42 = [v4 hearingAidGainSwipeEnabled];
  if (self->_swipeGainEnabled != v42)
  {
    self->_swipeGainEnabled = v42;
    BOOL v41 = 1;
  }
  [(HMDeviceRecord *)self _deriveMediaAssistStateIfNeeded];
  aaDevice = self->_aaDevice;
  self->_aaDevice = (AudioAccessoryDevice *)v4;

  return v41;
}

- (BOOL)updateWithCloudRecordInfo:(id)a3
{
  id v4 = a3;
  if (!self->_cloudRecord)
  {
    id v5 = (HMDeviceCloudRecordInfo *)[objc_alloc(MEMORY[0x263F28968]) initWithBluetoothAddress:self->_bluetoothAddress];
    cloudRecord = self->_cloudRecord;
    self->_cloudRecord = v5;
  }
  int v7 = [v4 mediaAssistEnabled];
  if (v7 && self->_mediaAssistEnabled != v7)
  {
    self->_mediaAssistEnabled = v7;
    -[HMDeviceCloudRecordInfo setMediaAssistEnabled:](self->_cloudRecord, "setMediaAssistEnabled:");
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }
  if ([v4 pmeMediaEnabled]) {
    -[HMDeviceCloudRecordInfo setPmeMediaEnabled:](self->_cloudRecord, "setPmeMediaEnabled:", [v4 pmeMediaEnabled]);
  }
  if ([v4 pmeVoiceEnabled]) {
    -[HMDeviceCloudRecordInfo setPmeVoiceEnabled:](self->_cloudRecord, "setPmeVoiceEnabled:", [v4 pmeVoiceEnabled]);
  }
  if ([v4 swipeGainEnabled]) {
    -[HMDeviceCloudRecordInfo setSwipeGainEnabled:](self->_cloudRecord, "setSwipeGainEnabled:", [v4 swipeGainEnabled]);
  }
  BOOL v9 = [v4 diagnosticMeasurementsCount];

  if (v9)
  {
    char v10 = [v4 diagnosticMeasurementsCount];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setDiagnosticMeasurementsCount:v10];
  }
  uint64_t v11 = [v4 bottomMicFaultCountLeft];

  if (v11)
  {
    uint64_t v12 = [v4 bottomMicFaultCountLeft];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setBottomMicFaultCountLeft:v12];
  }
  uint64_t v13 = [v4 topMicFaultCountLeft];

  if (v13)
  {
    v14 = [v4 topMicFaultCountLeft];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setTopMicFaultCountLeft:v14];
  }
  id v15 = [v4 innerMicFaultCountLeft];

  if (v15)
  {
    uint64_t v16 = [v4 innerMicFaultCountLeft];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setInnerMicFaultCountLeft:v16];
  }
  char v17 = [v4 speakerFaultCountLeft];

  if (v17)
  {
    id v18 = [v4 speakerFaultCountLeft];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setSpeakerFaultCountLeft:v18];
  }
  long long v19 = [v4 frontVentFaultCountLeft];

  if (v19)
  {
    long long v20 = [v4 frontVentFaultCountLeft];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setFrontVentFaultCountLeft:v20];
  }
  long long v21 = [v4 rearVentFaultCountLeft];

  if (v21)
  {
    int v22 = [v4 rearVentFaultCountLeft];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setRearVentFaultCountLeft:v22];
  }
  int v23 = [v4 totalHarmonicDistortionFaultCountLeft];

  if (v23)
  {
    uint64_t v24 = [v4 totalHarmonicDistortionFaultCountLeft];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setTotalHarmonicDistortionFaultCountLeft:v24];
  }
  char v25 = [v4 freqAccuracyFaultCountLeft];

  if (v25)
  {
    char v26 = [v4 freqAccuracyFaultCountLeft];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setFreqAccuracyFaultCountLeft:v26];
  }
  char v27 = [v4 latestDiagnosticTimestampLeft];

  if (v27)
  {
    int v28 = [v4 latestDiagnosticTimestampLeft];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setLatestDiagnosticTimestampLeft:v28];
  }
  int v29 = [v4 bottomMicFaultCountRight];

  if (v29)
  {
    char v30 = [v4 bottomMicFaultCountRight];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setBottomMicFaultCountRight:v30];
  }
  char v31 = [v4 topMicFaultCountRight];

  if (v31)
  {
    id v32 = [v4 topMicFaultCountRight];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setTopMicFaultCountRight:v32];
  }
  v33 = [v4 innerMicFaultCountRight];

  if (v33)
  {
    int v34 = [v4 innerMicFaultCountRight];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setInnerMicFaultCountRight:v34];
  }
  int v35 = [v4 speakerFaultCountRight];

  if (v35)
  {
    int v36 = [v4 speakerFaultCountRight];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setSpeakerFaultCountRight:v36];
  }
  int v37 = [v4 frontVentFaultCountRight];

  if (v37)
  {
    int v38 = [v4 frontVentFaultCountRight];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setFrontVentFaultCountRight:v38];
  }
  v39 = [v4 rearVentFaultCountRight];

  if (v39)
  {
    id v40 = [v4 rearVentFaultCountRight];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setRearVentFaultCountRight:v40];
  }
  BOOL v41 = [v4 totalHarmonicDistortionFaultCountRight];

  if (v41)
  {
    char v42 = [v4 totalHarmonicDistortionFaultCountRight];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setTotalHarmonicDistortionFaultCountRight:v42];
  }
  v43 = [v4 freqAccuracyFaultCountRight];

  if (v43)
  {
    v44 = [v4 freqAccuracyFaultCountRight];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setFreqAccuracyFaultCountRight:v44];
  }
  v45 = [v4 latestDiagnosticTimestampRight];

  if (v45)
  {
    v46 = [v4 latestDiagnosticTimestampRight];
    [(HMDeviceCloudRecordInfo *)self->_cloudRecord setLatestDiagnosticTimestampRight:v46];
  }
  return v8;
}

- (BOOL)updateWithHearingAidConfigData:(id)a3
{
  id v5 = a3;
  if (!_os_feature_enabled_impl()) {
    goto LABEL_77;
  }
  if (!v5)
  {
    if (gLogCategory_HMDeviceRecord > 90
      || gLogCategory_HMDeviceRecord == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_77;
    }
    goto LABEL_12;
  }
  memset(v88, 0, 100);
  [v5 getBytes:v88 length:100];
  if (BYTE1(v88[0]) == 2)
  {
    uint64_t v6 = LOBYTE(v88[0]);
    float v7 = *((float *)&v88[2] + 3);
    float v8 = *(float *)&v88[3];
    float v9 = fmax(fmin(*((float *)&v88[2] + 1), 1.5), -1.5);
    double v10 = fmax(fmin(*((float *)&v88[5] + 1), 1.5), -1.5);
    float v11 = v10;
    float v12 = fmaxf(fminf(*((float *)&v88[5] + 2), 1.0), -1.0);
    float v13 = v11 - v9;
    float v14 = v11 + (float)((float)(v11 - v9) * -0.5);
    if (gLogCategory_HMDeviceRecord <= 10
      && (gLogCategory_HMDeviceRecord != -1 || _LogCategory_Initialize()))
    {
      double v84 = v7;
      double v85 = v8;
      double v82 = v14;
      double v83 = v13;
      double v80 = v11;
      double v81 = v12;
      double v79 = v9;
      bluetoothUUID = self->_bluetoothUUID;
      uint64_t v78 = v6;
      LogPrintF();
    }
    float v15 = (float)(v14 + 1.0) * 0.5;
    float v16 = (float)(v13 + 1.0) * 0.5;
    *(float *)&double v10 = v15;
    id v18 = objc_msgSend(NSNumber, "numberWithFloat:", v10, bluetoothUUID, v78, *(void *)&v79, *(void *)&v80, *(void *)&v81, *(void *)&v82, *(void *)&v83, *(void *)&v84, *(void *)&v85);
    amplification = self->_amplification;
    long long v20 = v18;
    long long v21 = amplification;
    BOOL v22 = v20 != v21;
    if (v20 == v21)
    {
    }
    else
    {
      int v23 = v21;
      if ((v20 == 0) != (v21 != 0))
      {
        char v24 = [(NSNumber *)v20 isEqual:v21];

        if (v24)
        {
          BOOL v22 = 0;
          goto LABEL_24;
        }
      }
      else
      {
      }
      *(float *)&double v25 = v15;
      char v26 = [NSNumber numberWithFloat:v25];
      long long v20 = self->_amplification;
      self->_amplification = v26;
    }

LABEL_24:
    float v17 = v12 + 1.0;
    *(float *)&double v25 = v16;
    char v27 = [NSNumber numberWithFloat:v25];
    balance = self->_balance;
    int v29 = v27;
    char v30 = balance;
    if (v29 == v30)
    {
    }
    else
    {
      char v31 = v30;
      if ((v29 == 0) != (v30 != 0))
      {
        char v32 = [(NSNumber *)v29 isEqual:v30];

        if (v32)
        {
LABEL_32:
          *(float *)&double v33 = v17 * 0.5;
          int v35 = [NSNumber numberWithFloat:v33];
          tone = self->_tone;
          int v37 = v35;
          int v38 = tone;
          if (v37 == v38)
          {
          }
          else
          {
            v39 = v38;
            if ((v37 == 0) != (v38 != 0))
            {
              char v40 = [(NSNumber *)v37 isEqual:v38];

              if (v40)
              {
LABEL_40:
                *(float *)&double v41 = v7;
                v43 = [NSNumber numberWithFloat:v41];
                beamFormer = self->_beamFormer;
                v45 = v43;
                v46 = beamFormer;
                if (v45 == v46)
                {
                }
                else
                {
                  v47 = v46;
                  if ((v45 == 0) != (v46 != 0))
                  {
                    char v48 = [(NSNumber *)v45 isEqual:v46];

                    if (v48)
                    {
LABEL_48:
                      *(float *)&double v49 = v8;
                      v51 = [NSNumber numberWithFloat:v49];
                      noiseSuppression = self->_noiseSuppression;
                      v53 = v51;
                      v54 = noiseSuppression;
                      if (v53 == v54)
                      {
                      }
                      else
                      {
                        v55 = v54;
                        if ((v53 == 0) != (v54 != 0))
                        {
                          char v56 = [(NSNumber *)v53 isEqual:v54];

                          if (v56)
                          {
LABEL_56:
                            v87[0] = *(_OWORD *)((char *)v88 + 4);
                            v87[1] = *(_OWORD *)((char *)&v88[1] + 4);
                            v87[2] = *(_OWORD *)((char *)&v88[2] + 4);
                            v86[0] = *(_OWORD *)((char *)&v88[3] + 4);
                            v86[1] = *(_OWORD *)((char *)&v88[4] + 4);
                            v86[2] = *(_OWORD *)((char *)&v88[5] + 4);
                            v59 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v87 length:32];
                            earLossDataLeft = self->_earLossDataLeft;
                            v61 = v59;
                            v62 = earLossDataLeft;
                            if (v61 == (NSArray *)v62)
                            {

                              earLossArrayLeft = v61;
                            }
                            else
                            {
                              v63 = v62;
                              if ((v61 == 0) != (v62 != 0))
                              {
                                char v64 = [(NSArray *)v61 isEqual:v62];

                                if (v64)
                                {
LABEL_64:
                                  v67 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v86 length:32];
                                  earLossDataRight = self->_earLossDataRight;
                                  v69 = v67;
                                  v70 = earLossDataRight;
                                  if (v69 != v70)
                                  {
                                    v71 = v70;
                                    if ((v69 == 0) != (v70 != 0))
                                    {
                                      char v72 = [(NSData *)v69 isEqual:v70];

                                      if (v72)
                                      {
                                        if (v22)
                                        {
LABEL_73:
                                          if (gLogCategory_HMDeviceRecord <= 30
                                            && (gLogCategory_HMDeviceRecord != -1
                                             || _LogCategory_Initialize()))
                                          {
                                            LogPrintF();
                                          }
                                          BOOL v73 = 1;
                                          goto LABEL_80;
                                        }
LABEL_70:
                                        BOOL v73 = 0;
LABEL_80:
                                        objc_storeStrong((id *)&self->_configDataHearingAid, a3);

                                        goto LABEL_81;
                                      }
                                    }
                                    else
                                    {
                                    }
                                    objc_storeStrong((id *)&self->_earLossDataRight, v67);
                                    HMEarLossDataToArray(self->_earLossDataRight);
                                    v74 = (NSArray *)objc_claimAutoreleasedReturnValue();
                                    earLossArrayRight = self->_earLossArrayRight;
                                    self->_earLossArrayRight = v74;

                                    goto LABEL_73;
                                  }

                                  if (v22) {
                                    goto LABEL_73;
                                  }
                                  goto LABEL_70;
                                }
                              }
                              else
                              {
                              }
                              objc_storeStrong((id *)&self->_earLossDataLeft, v59);
                              HMEarLossDataToArray(self->_earLossDataLeft);
                              v66 = (NSArray *)objc_claimAutoreleasedReturnValue();
                              earLossArrayLeft = self->_earLossArrayLeft;
                              self->_earLossArrayLeft = v66;
                              BOOL v22 = 1;
                            }

                            goto LABEL_64;
                          }
                        }
                        else
                        {
                        }
                        *(float *)&double v57 = v8;
                        v58 = [NSNumber numberWithFloat:v57];
                        v53 = self->_noiseSuppression;
                        self->_noiseSuppression = v58;
                        BOOL v22 = 1;
                      }

                      goto LABEL_56;
                    }
                  }
                  else
                  {
                  }
                  *(float *)&double v49 = v7;
                  v50 = [NSNumber numberWithFloat:v49];
                  v45 = self->_beamFormer;
                  self->_beamFormer = v50;
                  BOOL v22 = 1;
                }

                goto LABEL_48;
              }
            }
            else
            {
            }
            *(float *)&double v41 = v17 * 0.5;
            char v42 = [NSNumber numberWithFloat:v41];
            int v37 = self->_tone;
            self->_tone = v42;
            BOOL v22 = 1;
          }

          goto LABEL_40;
        }
      }
      else
      {
      }
      *(float *)&double v33 = v16;
      int v34 = [NSNumber numberWithFloat:v33];
      int v29 = self->_balance;
      self->_balance = v34;
      BOOL v22 = 1;
    }

    goto LABEL_32;
  }
  if (gLogCategory_HMDeviceRecord <= 90
    && (gLogCategory_HMDeviceRecord != -1 || _LogCategory_Initialize()))
  {
LABEL_12:
    LogPrintF();
  }
LABEL_77:
  BOOL v73 = 0;
LABEL_81:

  return v73;
}

- (BOOL)updateWithHearingProtectionValue:(unsigned __int8)a3
{
  int v3 = a3;
  int v5 = _os_feature_enabled_impl();
  if (v5)
  {
    if (v3 == 1) {
      int v6 = 1;
    }
    else {
      int v6 = 2;
    }
    if (v6 == self->_hearingProtectionEnabled)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      self->_hearingProtectionEnabled = v6;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)updateWithPMEConfigData:(id)a3
{
  id v5 = a3;
  int v6 = v5;
  if (v5)
  {
    int v46 = 0;
    memset(v45, 0, sizeof(v45));
    [v5 getBytes:v45 length:132];
    unsigned __int8 v7 = +[HMDeviceRecord getHMMultiStateFromPMEState:BYTE3(v45[0])];
    int pmeMediaEnabled = self->_pmeMediaEnabled;
    BOOL v9 = v7 != pmeMediaEnabled;
    if (v7 != pmeMediaEnabled) {
      self->_int pmeMediaEnabled = v7;
    }
    char v10 = +[HMDeviceRecord getHMMultiStateFromPMEState:BYTE2(v45[0])];
    if (self->_pmeVoiceEnabled != v10)
    {
      self->_pmeVoiceEnabled = v10;
      BOOL v9 = 1;
    }
    char v11 = +[HMDeviceRecord getHMMultiStateFromPMEState:BYTE1(v45[0])];
    if (self->_pmeVoiceEnrolled != v11)
    {
      self->_pmeVoiceEnrolled = v11;
      BOOL v9 = 1;
    }
    if (self->_hearingAssistEnabled == 1) {
      goto LABEL_45;
    }
    float v12 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:(char *)v45 + 4 length:32];
    pmeVoiceLossDataLeft = self->_pmeVoiceLossDataLeft;
    float v14 = v12;
    float v15 = pmeVoiceLossDataLeft;
    if (v14 == v15)
    {

      id v18 = v14;
    }
    else
    {
      float v16 = v15;
      if ((v14 == 0) != (v15 != 0))
      {
        char v17 = [(NSData *)v14 isEqual:v15];

        if (v17)
        {
LABEL_20:
          long long v20 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:(char *)&v45[2] + 4 length:32];
          pmeMediaLossDataLeft = self->_pmeMediaLossDataLeft;
          BOOL v22 = v20;
          int v23 = pmeMediaLossDataLeft;
          if (v22 == v23)
          {

            char v26 = v22;
          }
          else
          {
            char v24 = v23;
            if ((v22 == 0) != (v23 != 0))
            {
              char v25 = [(NSData *)v22 isEqual:v23];

              if (v25)
              {
LABEL_28:
                int v28 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:(char *)&v45[4] + 4 length:32];
                pmeVoiceLossDataRight = self->_pmeVoiceLossDataRight;
                char v30 = v28;
                char v31 = pmeVoiceLossDataRight;
                if (v30 == v31)
                {

                  int v34 = v30;
                }
                else
                {
                  char v32 = v31;
                  if ((v30 == 0) != (v31 != 0))
                  {
                    char v33 = [(NSData *)v30 isEqual:v31];

                    if (v33)
                    {
LABEL_36:
                      int v36 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:(char *)&v45[6] + 4 length:32];
                      pmeMediaLossDataRight = self->_pmeMediaLossDataRight;
                      int v38 = v36;
                      v39 = pmeMediaLossDataRight;
                      if (v38 == v39)
                      {

                        char v42 = v38;
                      }
                      else
                      {
                        char v40 = v39;
                        if ((v38 == 0) != (v39 != 0))
                        {
                          char v41 = [(NSData *)v38 isEqual:v39];

                          if (v41) {
                            goto LABEL_44;
                          }
                        }
                        else
                        {
                        }
                        v43 = v38;
                        char v42 = self->_pmeMediaLossDataRight;
                        self->_pmeMediaLossDataRight = v43;
                        BOOL v9 = 1;
                      }

LABEL_44:
LABEL_45:
                      objc_storeStrong((id *)&self->_configDataPME, a3);
                      [(HMDeviceRecord *)self _deriveMediaAssistStateIfNeeded];
                      goto LABEL_48;
                    }
                  }
                  else
                  {
                  }
                  int v35 = v30;
                  int v34 = self->_pmeVoiceLossDataRight;
                  self->_pmeVoiceLossDataRight = v35;
                  BOOL v9 = 1;
                }

                goto LABEL_36;
              }
            }
            else
            {
            }
            char v27 = v22;
            char v26 = self->_pmeMediaLossDataLeft;
            self->_pmeMediaLossDataLeft = v27;
            BOOL v9 = 1;
          }

          goto LABEL_28;
        }
      }
      else
      {
      }
      long long v19 = v14;
      id v18 = self->_pmeVoiceLossDataLeft;
      self->_pmeVoiceLossDataLeft = v19;
      BOOL v9 = 1;
    }

    goto LABEL_20;
  }
  if (gLogCategory_HMDeviceRecord <= 90
    && (gLogCategory_HMDeviceRecord != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BOOL v9 = 0;
LABEL_48:

  return v9;
}

- (NSNumber)amplification
{
  return self->_amplification;
}

- (NSDate)audiogramEnrolledTimestamp
{
  return self->_audiogramEnrolledTimestamp;
}

- (NSNumber)balance
{
  return self->_balance;
}

- (NSNumber)beamFormer
{
  return self->_beamFormer;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (NSData)bluetoothAddressData
{
  return self->_bluetoothAddressData;
}

- (NSString)bluetoothUUID
{
  return self->_bluetoothUUID;
}

- (NSArray)earLossArrayLeft
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (NSArray)earLossArrayRight
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (char)hearingAidEnabled
{
  return self->_hearingAidEnabled;
}

- (char)hearingAssistCapability
{
  return self->_hearingAssistCapability;
}

- (char)hearingAssistEnabled
{
  return self->_hearingAssistEnabled;
}

- (char)hearingAssistEnrolled
{
  return self->_hearingAssistEnrolled;
}

- (unsigned)hearingAssistRegionStatus
{
  return self->_hearingAssistRegionStatus;
}

- (void)setHearingAssistRegionStatus:(unsigned __int8)a3
{
  self->_hearingAssistRegionStatus = a3;
}

- (char)hearingProtectionCapability
{
  return self->_hearingProtectionCapability;
}

- (char)hearingProtectionEnabled
{
  return self->_hearingProtectionEnabled;
}

- (int)hearingProtectionOcclusionResult
{
  return self->_hearingProtectionOcclusionResult;
}

- (void)setHearingProtectionOcclusionResult:(int)a3
{
  self->_uint64_t hearingProtectionOcclusionResult = a3;
}

- (unsigned)hearingProtectionRegionStatus
{
  return self->_hearingProtectionRegionStatus;
}

- (void)setHearingProtectionRegionStatus:(unsigned __int8)a3
{
  self->_hearingProtectionRegionStatus = a3;
}

- (char)hearingTestCapability
{
  return self->_hearingTestCapability;
}

- (unsigned)hearingTestRegionStatus
{
  return self->_hearingTestRegionStatus;
}

- (void)setHearingTestRegionStatus:(unsigned __int8)a3
{
  self->_hearingTestRegionStatus = a3;
}

- (char)listeningModeOffAllowed
{
  return self->_listeningModeOffAllowed;
}

- (char)hideOffModeCapability
{
  return self->_hideOffModeCapability;
}

- (char)mediaAssistEnabled
{
  return self->_mediaAssistEnabled;
}

- (void)setMediaAssistEnabled:(char)a3
{
  self->_mediaAssistEnabled = a3;
}

- (NSNumber)noiseSuppression
{
  return self->_noiseSuppression;
}

- (char)pmeMediaEnabled
{
  return self->_pmeMediaEnabled;
}

- (NSArray)pmeMediaLossPresetsLeft
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (NSArray)pmeMediaLossPresetsRight
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)pmeVoiceLossPresetsLeft
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (NSArray)pmeVoiceLossPresetsRight
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (char)pmeVoiceEnabled
{
  return self->_pmeVoiceEnabled;
}

- (char)pmeVoiceEnrolled
{
  return self->_pmeVoiceEnrolled;
}

- (char)swipeGainEnabled
{
  return self->_swipeGainEnabled;
}

- (NSNumber)tone
{
  return self->_tone;
}

- (AudioAccessoryDevice)aaDevice
{
  return self->_aaDevice;
}

- (void)setAaDevice:(id)a3
{
}

- (HMDeviceCloudRecordInfo)cloudRecord
{
  return self->_cloudRecord;
}

- (void)setCloudRecord:(id)a3
{
}

- (BOOL)cloudRecordLoaded
{
  return self->_cloudRecordLoaded;
}

- (void)setCloudRecordLoaded:(BOOL)a3
{
  self->_cloudRecordLoaded = a3;
}

- (NSData)configDataPME
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)setConfigDataPME:(id)a3
{
}

- (unsigned)currentNoiseLevel
{
  return self->_currentNoiseLevel;
}

- (void)setCurrentNoiseLevel:(unsigned int)a3
{
  self->_currentNoiseLevel = a3;
}

- (NSData)configDataHearingAid
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setConfigDataHearingAid:(id)a3
{
}

- (NSData)earLossDataLeft
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
}

- (void)setEarLossDataLeft:(id)a3
{
}

- (NSData)earLossDataRight
{
  return (NSData *)objc_getProperty(self, a2, 200, 1);
}

- (void)setEarLossDataRight:(id)a3
{
}

- (int)hearingTestOcclusionResult
{
  return self->_hearingTestOcclusionResult;
}

- (void)setHearingTestOcclusionResult:(int)a3
{
  self->_hearingTestOcclusionResult = a3;
}

- (BOOL)occlusionResultReady
{
  return self->_occlusionResultReady;
}

- (void)setOcclusionResultReady:(BOOL)a3
{
  self->_occlusionResultReady = a3;
}

- (NSMutableDictionary)pendingOcclusionCompletionsMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPendingOcclusionCompletionsMap:(id)a3
{
}

- (NSData)pmeMediaLossDataLeft
{
  return (NSData *)objc_getProperty(self, a2, 216, 1);
}

- (void)setPmeMediaLossDataLeft:(id)a3
{
}

- (NSData)pmeMediaLossDataRight
{
  return (NSData *)objc_getProperty(self, a2, 224, 1);
}

- (void)setPmeMediaLossDataRight:(id)a3
{
}

- (NSData)pmeVoiceLossDataLeft
{
  return (NSData *)objc_getProperty(self, a2, 232, 1);
}

- (void)setPmeVoiceLossDataLeft:(id)a3
{
}

- (NSData)pmeVoiceLossDataRight
{
  return (NSData *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPmeVoiceLossDataRight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pmeVoiceLossDataRight, 0);
  objc_storeStrong((id *)&self->_pmeVoiceLossDataLeft, 0);
  objc_storeStrong((id *)&self->_pmeMediaLossDataRight, 0);
  objc_storeStrong((id *)&self->_pmeMediaLossDataLeft, 0);
  objc_storeStrong((id *)&self->_pendingOcclusionCompletionsMap, 0);
  objc_storeStrong((id *)&self->_earLossDataRight, 0);
  objc_storeStrong((id *)&self->_earLossDataLeft, 0);
  objc_storeStrong((id *)&self->_configDataHearingAid, 0);
  objc_storeStrong((id *)&self->_configDataPME, 0);
  objc_storeStrong((id *)&self->_cloudRecord, 0);
  objc_storeStrong((id *)&self->_aaDevice, 0);
  objc_storeStrong((id *)&self->_tone, 0);
  objc_storeStrong((id *)&self->_pmeVoiceLossPresetsRight, 0);
  objc_storeStrong((id *)&self->_pmeVoiceLossPresetsLeft, 0);
  objc_storeStrong((id *)&self->_pmeMediaLossPresetsRight, 0);
  objc_storeStrong((id *)&self->_pmeMediaLossPresetsLeft, 0);
  objc_storeStrong((id *)&self->_noiseSuppression, 0);
  objc_storeStrong((id *)&self->_earLossArrayRight, 0);
  objc_storeStrong((id *)&self->_earLossArrayLeft, 0);
  objc_storeStrong((id *)&self->_bluetoothUUID, 0);
  objc_storeStrong((id *)&self->_bluetoothAddressData, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_beamFormer, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_audiogramEnrolledTimestamp, 0);
  objc_storeStrong((id *)&self->_amplification, 0);
}

@end