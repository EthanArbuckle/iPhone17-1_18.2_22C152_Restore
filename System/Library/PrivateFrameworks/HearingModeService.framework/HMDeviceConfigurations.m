@interface HMDeviceConfigurations
+ (BOOL)supportsSecureCoding;
- (BOOL)needsUpdateToAHPSConnectionManagerForDevice:(id)a3;
- (BOOL)needsUpdateToDeviceManagerForDevice:(id)a3;
- (BOOL)needsUpdateToPMEConfigurationForDevice:(id)a3;
- (BOOL)needsUpdateToPersonalAudioForDevice:(id)a3;
- (BOOL)restoreConfigsFromCloudRecordIfNeeded:(id)a3;
- (BOOL)setEnableHearingAssistIfNeeded:(id)a3;
- (HKAudiogramSample)selectedAudiogram;
- (HMDeviceConfigurations)init;
- (HMDeviceConfigurations)initWithCoder:(id)a3;
- (NSArray)mediaLossArrayLeft;
- (NSArray)mediaLossArrayRight;
- (NSArray)voiceLossArrayLeft;
- (NSArray)voiceLossArrayRight;
- (NSData)mediaLossDataLeft;
- (NSData)mediaLossDataRight;
- (NSData)voiceLossDataLeft;
- (NSData)voiceLossDataRight;
- (NSNumber)amplification;
- (NSNumber)balance;
- (NSNumber)beamFormer;
- (NSNumber)noiseSuppression;
- (NSNumber)tone;
- (char)allowListeningModeOff;
- (char)enableHearingAid;
- (char)enableHearingAssist;
- (char)enableHearingProtection;
- (char)enableMediaAssist;
- (char)enablePMEMedia;
- (char)enablePMEVoice;
- (char)enableSwipeGain;
- (char)enrollHearingAssist;
- (char)enrollPMEVoice;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowListeningModeOff:(char)a3;
- (void)setAmplification:(id)a3;
- (void)setBalance:(id)a3;
- (void)setBeamFormer:(id)a3;
- (void)setEnableHearingAid:(char)a3;
- (void)setEnableHearingAssist:(char)a3;
- (void)setEnableHearingProtection:(char)a3;
- (void)setEnableMediaAssist:(char)a3;
- (void)setEnablePMEMedia:(char)a3;
- (void)setEnablePMEVoice:(char)a3;
- (void)setEnableSwipeGain:(char)a3;
- (void)setEnrollHearingAssist:(char)a3;
- (void)setEnrollPMEVoice:(char)a3;
- (void)setMediaLossArrayLeft:(id)a3;
- (void)setMediaLossArrayRight:(id)a3;
- (void)setMediaLossDataLeft:(id)a3;
- (void)setMediaLossDataRight:(id)a3;
- (void)setNoiseSuppression:(id)a3;
- (void)setSelectedAudiogram:(id)a3;
- (void)setTone:(id)a3;
- (void)setVoiceLossArrayLeft:(id)a3;
- (void)setVoiceLossArrayRight:(id)a3;
- (void)setVoiceLossDataLeft:(id)a3;
- (void)setVoiceLossDataRight:(id)a3;
@end

@implementation HMDeviceConfigurations

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMDeviceConfigurations)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDeviceConfigurations;
  v2 = [(HMDeviceConfigurations *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (HMDeviceConfigurations)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDeviceConfigurations *)self init];
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_allowListeningModeOff = 0;
    }
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_enableHearingAid = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_enableHearingAssist = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_enableHearingProtection = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_enableMediaAssist = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_enablePMEMedia = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_enablePMEVoice = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_enableSwipeGain = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_enrollHearingAssist = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_enrollPMEVoice = 0;
    }
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    uint64_t v6 = HMEarLossDataToArray(v5->_mediaLossDataLeft);
    mediaLossArrayLeft = v5->_mediaLossArrayLeft;
    v5->_mediaLossArrayLeft = (NSArray *)v6;

    uint64_t v8 = HMEarLossDataToArray(v5->_mediaLossDataRight);
    mediaLossArrayRight = v5->_mediaLossArrayRight;
    v5->_mediaLossArrayRight = (NSArray *)v8;

    uint64_t v10 = HMEarLossDataToArray(v5->_voiceLossDataLeft);
    voiceLossArrayLeft = v5->_voiceLossArrayLeft;
    v5->_voiceLossArrayLeft = (NSArray *)v10;

    uint64_t v12 = HMEarLossDataToArray(v5->_voiceLossDataRight);
    voiceLossArrayRight = v5->_voiceLossArrayRight;
    v5->_voiceLossArrayRight = (NSArray *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v23 = a3;
  HMEarLossArrayToData(self->_mediaLossArrayLeft);
  id v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  mediaLossDataLeft = self->_mediaLossDataLeft;
  self->_mediaLossDataLeft = v4;

  HMEarLossArrayToData(self->_mediaLossArrayRight);
  uint64_t v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  mediaLossDataRight = self->_mediaLossDataRight;
  self->_mediaLossDataRight = v6;

  HMEarLossArrayToData(self->_voiceLossArrayLeft);
  uint64_t v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  voiceLossDataLeft = self->_voiceLossDataLeft;
  self->_voiceLossDataLeft = v8;

  HMEarLossArrayToData(self->_voiceLossArrayRight);
  uint64_t v10 = (NSData *)objc_claimAutoreleasedReturnValue();
  voiceLossDataRight = self->_voiceLossDataRight;
  self->_voiceLossDataRight = v10;

  if (self->_allowListeningModeOff) {
    objc_msgSend(v23, "encodeInteger:forKey:");
  }
  amplification = self->_amplification;
  if (amplification) {
    [v23 encodeObject:amplification forKey:@"ampl"];
  }
  balance = self->_balance;
  v14 = v23;
  if (balance)
  {
    [v23 encodeObject:balance forKey:@"balc"];
    v14 = v23;
  }
  beamFormer = self->_beamFormer;
  if (beamFormer)
  {
    [v23 encodeObject:beamFormer forKey:@"bmFm"];
    v14 = v23;
  }
  if (self->_enableHearingAid)
  {
    objc_msgSend(v23, "encodeInteger:forKey:");
    v14 = v23;
  }
  if (self->_enableHearingAssist)
  {
    objc_msgSend(v23, "encodeInteger:forKey:");
    v14 = v23;
  }
  if (self->_enableHearingProtection)
  {
    objc_msgSend(v23, "encodeInteger:forKey:");
    v14 = v23;
  }
  if (self->_enableMediaAssist)
  {
    objc_msgSend(v23, "encodeInteger:forKey:");
    v14 = v23;
  }
  if (self->_enablePMEMedia)
  {
    objc_msgSend(v23, "encodeInteger:forKey:");
    v14 = v23;
  }
  if (self->_enablePMEVoice)
  {
    objc_msgSend(v23, "encodeInteger:forKey:");
    v14 = v23;
  }
  if (self->_enableSwipeGain)
  {
    objc_msgSend(v23, "encodeInteger:forKey:");
    v14 = v23;
  }
  if (self->_enrollHearingAssist)
  {
    objc_msgSend(v23, "encodeInteger:forKey:");
    v14 = v23;
  }
  if (self->_enrollPMEVoice)
  {
    objc_msgSend(v23, "encodeInteger:forKey:");
    v14 = v23;
  }
  v16 = self->_mediaLossDataLeft;
  if (v16)
  {
    [v23 encodeObject:v16 forKey:@"mLDL"];
    v14 = v23;
  }
  v17 = self->_mediaLossDataRight;
  if (v17)
  {
    [v23 encodeObject:v17 forKey:@"mLDR"];
    v14 = v23;
  }
  noiseSuppression = self->_noiseSuppression;
  if (noiseSuppression)
  {
    [v23 encodeObject:noiseSuppression forKey:@"nsSp"];
    v14 = v23;
  }
  selectedAudiogram = self->_selectedAudiogram;
  if (selectedAudiogram)
  {
    [v23 encodeObject:selectedAudiogram forKey:@"Agrm"];
    v14 = v23;
  }
  tone = self->_tone;
  if (tone)
  {
    [v23 encodeObject:tone forKey:@"tone"];
    v14 = v23;
  }
  v21 = self->_voiceLossDataLeft;
  if (v21)
  {
    [v23 encodeObject:v21 forKey:@"vLDL"];
    v14 = v23;
  }
  v22 = self->_voiceLossDataRight;
  if (v22)
  {
    [v23 encodeObject:v22 forKey:@"vLDR"];
    v14 = v23;
  }
}

- (id)description
{
  return [(HMDeviceConfigurations *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  v66 = [(id)objc_opt_class() description];
  NSAppendPrintF_safe();
  id v5 = 0;

  uint64_t allowListeningModeOff = self->_allowListeningModeOff;
  if (self->_allowListeningModeOff)
  {
    if (allowListeningModeOff > 2) {
      v7 = "?";
    }
    else {
      v7 = off_265361128[allowListeningModeOff];
    }
    v66 = (void *)v7;
    NSAppendPrintF_safe();
    id v8 = v5;

    id v5 = v8;
  }
  v9 = self->_amplification;
  uint64_t v10 = v9;
  if (v9)
  {
    v66 = v9;
    NSAppendPrintF_safe();
    id v11 = v5;

    id v5 = v11;
  }

  uint64_t v12 = self->_balance;
  v13 = v12;
  if (v12)
  {
    v66 = v12;
    NSAppendPrintF_safe();
    id v14 = v5;

    id v5 = v14;
  }

  v15 = self->_beamFormer;
  v16 = v15;
  if (v15)
  {
    v66 = v15;
    NSAppendPrintF_safe();
    id v17 = v5;

    id v5 = v17;
  }

  uint64_t enableHearingAid = self->_enableHearingAid;
  if (self->_enableHearingAid)
  {
    if (enableHearingAid > 2) {
      v19 = "?";
    }
    else {
      v19 = off_265361128[enableHearingAid];
    }
    v66 = (void *)v19;
    NSAppendPrintF_safe();
    id v20 = v5;

    id v5 = v20;
  }
  uint64_t enableHearingAssist = self->_enableHearingAssist;
  if (self->_enableHearingAssist)
  {
    if (enableHearingAssist > 2) {
      v22 = "?";
    }
    else {
      v22 = off_265361128[enableHearingAssist];
    }
    v66 = (void *)v22;
    NSAppendPrintF_safe();
    id v23 = v5;

    id v5 = v23;
  }
  uint64_t enableHearingProtection = self->_enableHearingProtection;
  if (self->_enableHearingProtection)
  {
    if (enableHearingProtection > 2) {
      v25 = "?";
    }
    else {
      v25 = off_265361128[enableHearingProtection];
    }
    v66 = (void *)v25;
    NSAppendPrintF_safe();
    id v26 = v5;

    id v5 = v26;
  }
  uint64_t enableMediaAssist = self->_enableMediaAssist;
  if (self->_enableMediaAssist)
  {
    if (enableMediaAssist > 2) {
      v28 = "?";
    }
    else {
      v28 = off_265361128[enableMediaAssist];
    }
    v66 = (void *)v28;
    NSAppendPrintF_safe();
    id v29 = v5;

    id v5 = v29;
  }
  uint64_t enablePMEMedia = self->_enablePMEMedia;
  if (self->_enablePMEMedia)
  {
    if (enablePMEMedia > 2) {
      v31 = "?";
    }
    else {
      v31 = off_265361128[enablePMEMedia];
    }
    v66 = (void *)v31;
    NSAppendPrintF_safe();
    id v32 = v5;

    id v5 = v32;
  }
  uint64_t enablePMEVoice = self->_enablePMEVoice;
  if (self->_enablePMEVoice)
  {
    if (enablePMEVoice > 2) {
      v34 = "?";
    }
    else {
      v34 = off_265361128[enablePMEVoice];
    }
    v66 = (void *)v34;
    NSAppendPrintF_safe();
    id v35 = v5;

    id v5 = v35;
  }
  uint64_t enableSwipeGain = self->_enableSwipeGain;
  if (self->_enableSwipeGain)
  {
    if (enableSwipeGain > 2) {
      v37 = "?";
    }
    else {
      v37 = off_265361128[enableSwipeGain];
    }
    v66 = (void *)v37;
    NSAppendPrintF_safe();
    id v38 = v5;

    id v5 = v38;
  }
  uint64_t enrollHearingAssist = self->_enrollHearingAssist;
  if (self->_enrollHearingAssist)
  {
    if (enrollHearingAssist > 2) {
      v40 = "?";
    }
    else {
      v40 = off_265361128[enrollHearingAssist];
    }
    v66 = (void *)v40;
    NSAppendPrintF_safe();
    id v41 = v5;

    id v5 = v41;
  }
  uint64_t enrollPMEVoice = self->_enrollPMEVoice;
  if (self->_enrollPMEVoice)
  {
    if (enrollPMEVoice > 2) {
      v43 = "?";
    }
    else {
      v43 = off_265361128[enrollPMEVoice];
    }
    v66 = (void *)v43;
    NSAppendPrintF_safe();
    id v44 = v5;

    id v5 = v44;
  }
  v45 = self->_mediaLossArrayLeft;
  v46 = v45;
  if (v45)
  {
    v67 = [(NSArray *)v45 firstObject];
    NSAppendPrintF_safe();
    id v47 = v5;

    id v5 = v47;
  }

  v48 = self->_mediaLossArrayRight;
  v49 = v48;
  if (v48)
  {
    v68 = [(NSArray *)v48 firstObject];
    NSAppendPrintF_safe();
    id v50 = v5;

    id v5 = v50;
  }

  v51 = self->_noiseSuppression;
  if (v51)
  {
    NSAppendPrintF_safe();
    id v52 = v5;

    id v5 = v52;
  }

  v53 = self->_selectedAudiogram;
  if (v53)
  {
    NSAppendPrintF_safe();
    id v54 = v5;

    id v5 = v54;
  }

  v55 = self->_tone;
  if (v55)
  {
    NSAppendPrintF_safe();
    id v56 = v5;

    id v5 = v56;
  }

  v57 = self->_voiceLossArrayLeft;
  v58 = v57;
  if (v57)
  {
    v69 = [(NSArray *)v57 firstObject];
    NSAppendPrintF_safe();
    id v59 = v5;

    id v5 = v59;
  }

  v60 = self->_voiceLossArrayRight;
  v61 = v60;
  if (v60)
  {
    v70 = [(NSArray *)v60 firstObject];
    NSAppendPrintF_safe();
    id v62 = v5;

    id v5 = v62;
  }

  if (a3 < 21)
  {
    NSAppendPrintF_safe();
    id v63 = v5;

    id v5 = v63;
  }
  id v64 = v5;

  return v64;
}

- (BOOL)needsUpdateToAHPSConnectionManagerForDevice:(id)a3
{
  id v4 = a3;
  selectedAudiogram = self->_selectedAudiogram;
  BOOL v6 = selectedAudiogram != 0;
  if (selectedAudiogram)
  {
    amplification = self->_amplification;
    self->_amplification = (NSNumber *)&unk_270211118;

    balance = self->_balance;
    self->_balance = (NSNumber *)&unk_270211118;

    tone = self->_tone;
    self->_tone = (NSNumber *)&unk_270211118;

    noiseSuppression = self->_noiseSuppression;
    self->_noiseSuppression = (NSNumber *)&unk_2702111B8;

    beamFormer = self->_beamFormer;
    self->_beamFormer = (NSNumber *)&unk_2702111B8;
  }
  uint64_t v12 = self->_amplification;
  if (v12)
  {
    [(NSNumber *)v12 floatValue];
    float v14 = v13;
    v15 = [v4 amplification];
    [v15 floatValue];
    float v17 = v16;

    if (v14 != v17)
    {
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        v43 = [v4 amplification];
        v45 = self->_amplification;
        LogPrintF();
      }
      BOOL v6 = 1;
    }
  }
  v18 = self->_balance;
  if (v18)
  {
    [(NSNumber *)v18 floatValue];
    float v20 = v19;
    v21 = [v4 balance];
    [v21 floatValue];
    float v23 = v22;

    if (v20 != v23)
    {
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        v43 = objc_msgSend(v4, "balance", v43, v45);
        v45 = self->_balance;
        LogPrintF();
      }
      BOOL v6 = 1;
    }
  }
  v24 = self->_beamFormer;
  if (v24)
  {
    [(NSNumber *)v24 floatValue];
    float v26 = v25;
    v27 = [v4 beamFormer];
    [v27 floatValue];
    float v29 = v28;

    if (v26 != v29)
    {
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        v43 = objc_msgSend(v4, "beamFormer", v43, v45);
        v45 = self->_beamFormer;
        LogPrintF();
      }
      BOOL v6 = 1;
    }
  }
  v30 = self->_noiseSuppression;
  if (v30)
  {
    [(NSNumber *)v30 floatValue];
    float v32 = v31;
    v33 = [v4 noiseSuppression];
    [v33 floatValue];
    float v35 = v34;

    if (v32 != v35)
    {
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        v43 = objc_msgSend(v4, "noiseSuppression", v43, v45);
        v45 = self->_noiseSuppression;
        LogPrintF();
      }
      BOOL v6 = 1;
    }
  }
  v36 = self->_tone;
  if (v36)
  {
    [(NSNumber *)v36 floatValue];
    float v38 = v37;
    v39 = [v4 tone];
    [v39 floatValue];
    float v41 = v40;

    if (v38 != v41)
    {
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        id v44 = objc_msgSend(v4, "tone", v43, v45);
        LogPrintF();
      }
      BOOL v6 = 1;
    }
  }

  return v6;
}

- (BOOL)needsUpdateToDeviceManagerForDevice:(id)a3
{
  id v4 = a3;
  if (!_os_feature_enabled_impl()) {
    goto LABEL_4;
  }
  int allowListeningModeOff = self->_allowListeningModeOff;
  if (self->_allowListeningModeOff)
  {
    if (allowListeningModeOff == [v4 listeningModeOffAllowed])
    {
LABEL_4:
      LOBYTE(allowListeningModeOff) = 0;
      goto LABEL_5;
    }
    if (gLogCategory_HMDeviceConfigurations <= 30
      && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
    {
      unsigned int v9 = [v4 listeningModeOffAllowed];
      if (v9 > 2) {
        uint64_t v10 = "?";
      }
      else {
        uint64_t v10 = off_265361128[v9];
      }
      unint64_t v26 = self->_allowListeningModeOff;
      if (v26 > 2) {
        v27 = "?";
      }
      else {
        v27 = off_265361128[v26];
      }
      float v28 = v10;
      float v29 = (void *)v27;
      LogPrintF();
    }
    LOBYTE(allowListeningModeOff) = 1;
  }
LABEL_5:
  if (self->_enrollHearingAssist)
  {
    int enrollHearingAssist = self->_enrollHearingAssist;
    if (enrollHearingAssist != [v4 hearingAssistEnrolled])
    {
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        unsigned int v7 = objc_msgSend(v4, "hearingAssistEnrolled", v28, v29);
        if (v7 > 2) {
          id v8 = "?";
        }
        else {
          id v8 = off_265361128[v7];
        }
        unint64_t v11 = self->_enrollHearingAssist;
        if (v11 > 2) {
          uint64_t v12 = "?";
        }
        else {
          uint64_t v12 = off_265361128[v11];
        }
        float v28 = v8;
        float v29 = (void *)v12;
        LogPrintF();
      }
      LOBYTE(allowListeningModeOff) = 1;
    }
  }
  if (self->_enableHearingAid)
  {
    int enableHearingAid = self->_enableHearingAid;
    if (enableHearingAid != [v4 hearingAidEnabled])
    {
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        unsigned int v14 = objc_msgSend(v4, "hearingAidEnabled", v28, v29);
        if (v14 > 2) {
          v15 = "?";
        }
        else {
          v15 = off_265361128[v14];
        }
        unint64_t v16 = self->_enableHearingAid;
        if (v16 > 2) {
          float v17 = "?";
        }
        else {
          float v17 = off_265361128[v16];
        }
        float v28 = v15;
        float v29 = (void *)v17;
        LogPrintF();
      }
      if (self->_enableHearingAid == 2) {
        self->_int enableSwipeGain = 2;
      }
      LOBYTE(allowListeningModeOff) = 1;
    }
  }
  if (self->_enableSwipeGain)
  {
    int enableSwipeGain = self->_enableSwipeGain;
    if (enableSwipeGain != [v4 swipeGainEnabled])
    {
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        unsigned int v19 = objc_msgSend(v4, "swipeGainEnabled", v28, v29);
        if (v19 > 2) {
          float v20 = "?";
        }
        else {
          float v20 = off_265361128[v19];
        }
        unint64_t v21 = self->_enableSwipeGain;
        if (v21 > 2) {
          float v22 = "?";
        }
        else {
          float v22 = off_265361128[v21];
        }
        float v28 = v20;
        float v29 = (void *)v22;
        LogPrintF();
      }
      LOBYTE(allowListeningModeOff) = 1;
    }
  }
  if (self->_selectedAudiogram)
  {
    if (gLogCategory_HMDeviceConfigurations <= 30
      && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v4, "audiogramEnrolledTimestamp", v28, v29);
      float v23 = (char *)objc_claimAutoreleasedReturnValue();
      [(HKAudiogramSample *)self->_selectedAudiogram startDate];
      float v29 = v28 = v23;
      LogPrintF();
    }
    LOBYTE(allowListeningModeOff) = 1;
  }
  char v24 = allowListeningModeOff | -[HMDeviceConfigurations setEnableHearingAssistIfNeeded:](self, "setEnableHearingAssistIfNeeded:", v4, v28, v29);

  return v24;
}

- (BOOL)needsUpdateToPMEConfigurationForDevice:(id)a3
{
  id v4 = a3;
  int enableMediaAssist = self->_enableMediaAssist;
  BOOL v6 = self->_enableMediaAssist != 0;
  if (self->_enableMediaAssist)
  {
    if (gLogCategory_HMDeviceConfigurations <= 30)
    {
      if (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize())
      {
        unsigned int v7 = [v4 mediaAssistEnabled];
        if (v7 > 2) {
          id v8 = "?";
        }
        else {
          id v8 = off_265361128[v7];
        }
        unint64_t v9 = self->_enableMediaAssist;
        if (v9 > 2) {
          uint64_t v10 = "?";
        }
        else {
          uint64_t v10 = off_265361128[v9];
        }
        id v47 = v8;
        v48 = v10;
        LogPrintF();
      }
      int enableMediaAssist = self->_enableMediaAssist;
    }
    if (enableMediaAssist == 2) {
      *(_WORD *)&self->_int enablePMEMedia = 514;
    }
  }
  if (self->_enablePMEMedia)
  {
    int enablePMEMedia = self->_enablePMEMedia;
    if (enablePMEMedia != [v4 pmeMediaEnabled])
    {
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        unsigned int v12 = objc_msgSend(v4, "pmeMediaEnabled", v47, v48);
        if (v12 > 2) {
          float v13 = "?";
        }
        else {
          float v13 = off_265361128[v12];
        }
        unint64_t v14 = self->_enablePMEMedia;
        if (v14 > 2) {
          v15 = "?";
        }
        else {
          v15 = off_265361128[v14];
        }
        id v47 = v13;
        v48 = v15;
        LogPrintF();
      }
      BOOL v6 = 1;
    }
  }
  if (self->_enablePMEVoice)
  {
    int enablePMEVoice = self->_enablePMEVoice;
    if (enablePMEVoice != [v4 pmeVoiceEnabled])
    {
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        unsigned int v17 = objc_msgSend(v4, "pmeVoiceEnabled", v47, v48);
        if (v17 > 2) {
          v18 = "?";
        }
        else {
          v18 = off_265361128[v17];
        }
        unint64_t v19 = self->_enablePMEVoice;
        if (v19 > 2) {
          float v20 = "?";
        }
        else {
          float v20 = off_265361128[v19];
        }
        id v47 = v18;
        v48 = v20;
        LogPrintF();
      }
      BOOL v6 = 1;
    }
  }
  if (self->_enrollPMEVoice)
  {
    int enrollPMEVoice = self->_enrollPMEVoice;
    if (enrollPMEVoice != [v4 pmeVoiceEnrolled])
    {
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v4, "pmeVoiceEnrolled", v47, v48);
        LogPrintF();
      }
      BOOL v6 = 1;
    }
  }
  mediaLossDataLeft = self->_mediaLossDataLeft;
  if (mediaLossDataLeft)
  {
    float v23 = [v4 pmeMediaLossDataLeft];
    char v24 = mediaLossDataLeft;
    float v25 = v23;
    if (v24 == v25)
    {

      goto LABEL_63;
    }
    unint64_t v26 = v25;
    if (v25)
    {
      char v27 = [(NSData *)v24 isEqual:v25];

      if (v27) {
        goto LABEL_63;
      }
    }
    else
    {
    }
    if (gLogCategory_HMDeviceConfigurations <= 30
      && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    BOOL v6 = 1;
  }
LABEL_63:
  mediaLossDataRight = self->_mediaLossDataRight;
  if (!mediaLossDataRight) {
    goto LABEL_75;
  }
  float v29 = [v4 pmeMediaLossDataRight];
  v30 = mediaLossDataRight;
  float v31 = v29;
  if (v30 == v31)
  {

    goto LABEL_75;
  }
  float v32 = v31;
  if (v31)
  {
    char v33 = [(NSData *)v30 isEqual:v31];

    if (v33) {
      goto LABEL_75;
    }
  }
  else
  {
  }
  if (gLogCategory_HMDeviceConfigurations <= 30
    && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BOOL v6 = 1;
LABEL_75:
  voiceLossDataLeft = self->_voiceLossDataLeft;
  if (!voiceLossDataLeft) {
    goto LABEL_87;
  }
  float v35 = [v4 pmeVoiceLossDataLeft];
  v36 = voiceLossDataLeft;
  float v37 = v35;
  if (v36 == v37)
  {

    goto LABEL_87;
  }
  float v38 = v37;
  if (v37)
  {
    char v39 = [(NSData *)v36 isEqual:v37];

    if (v39) {
      goto LABEL_87;
    }
  }
  else
  {
  }
  if (gLogCategory_HMDeviceConfigurations <= 30
    && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BOOL v6 = 1;
LABEL_87:
  voiceLossDataRight = self->_voiceLossDataRight;
  if (voiceLossDataRight)
  {
    float v41 = [v4 pmeVoiceLossDataRight];
    v42 = voiceLossDataRight;
    v43 = v41;
    if (v42 == v43)
    {
    }
    else
    {
      id v44 = v43;
      if (v43)
      {
        char v45 = [(NSData *)v42 isEqual:v43];

        if (v45) {
          goto LABEL_99;
        }
      }
      else
      {
      }
      if (gLogCategory_HMDeviceConfigurations <= 30
        && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      BOOL v6 = 1;
    }
  }
LABEL_99:

  return v6;
}

- (BOOL)needsUpdateToPersonalAudioForDevice:(id)a3
{
  int v4 = [a3 hearingAssistEnabled];
  return self->_selectedAudiogram || v4 == 1;
}

- (BOOL)restoreConfigsFromCloudRecordIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 cloudRecord];

  if (v5)
  {
    if (self->_enableHearingAid == 1
      && !self->_enableSwipeGain
      && ([v4 cloudRecord],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 swipeGainEnabled],
          v10,
          v11))
    {
      p_int enableMediaAssist = &self->_enableMediaAssist;
      int enableMediaAssist = self->_enableMediaAssist;
      self->_int enableSwipeGain = v11;
      if (enableMediaAssist != 1)
      {
LABEL_22:
        if (gLogCategory_HMDeviceConfigurations <= 30
          && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        LOBYTE(v6) = 1;
        goto LABEL_27;
      }
      BOOL v6 = 1;
    }
    else
    {
      BOOL v6 = 0;
      p_int enableMediaAssist = &self->_enableMediaAssist;
      if (self->_enableMediaAssist != 1) {
        goto LABEL_27;
      }
    }
    if (!self->_enablePMEMedia)
    {
      id v8 = [v4 cloudRecord];
      int v9 = [v8 pmeMediaEnabled];

      if (v9)
      {
        self->_int enablePMEMedia = v9;
        BOOL v6 = 1;
      }
    }
    if (*p_enableMediaAssist == 1
      && !self->_enablePMEVoice
      && ([v4 cloudRecord],
          float v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 pmeVoiceEnabled],
          v13,
          v14))
    {
      self->_int enablePMEVoice = v14;
    }
    else if (!v6)
    {
      goto LABEL_27;
    }
    goto LABEL_22;
  }
  if (gLogCategory_HMDeviceConfigurations <= 90
    && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
  {
    unint64_t v16 = [v4 bluetoothUUID];
    LogPrintF();
  }
  LOBYTE(v6) = 0;
LABEL_27:

  return v6;
}

- (BOOL)setEnableHearingAssistIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  int enableMediaAssist = self->_enableMediaAssist;
  int enableHearingAid = self->_enableHearingAid;
  if (self->_enableMediaAssist)
  {
    if (!self->_enableHearingAid)
    {
      LOBYTE(enableHearingAid) = 1;
      if (enableMediaAssist != 1)
      {
        if ([v4 hearingAidEnabled] == 1) {
          LOBYTE(enableHearingAid) = 1;
        }
        else {
          LOBYTE(enableHearingAid) = 2;
        }
      }
      goto LABEL_12;
    }
    BOOL v8 = enableHearingAid == 1 || enableMediaAssist == 1;
    goto LABEL_9;
  }
  if (self->_enableHearingAid)
  {
    if (enableHearingAid == 1)
    {
LABEL_12:
      self->_int enableHearingAssist = enableHearingAid;
      goto LABEL_13;
    }
    BOOL v8 = [v4 mediaAssistEnabled] == 1;
LABEL_9:
    if (v8) {
      LOBYTE(enableHearingAid) = 1;
    }
    else {
      LOBYTE(enableHearingAid) = 2;
    }
    goto LABEL_12;
  }
LABEL_13:
  if (self->_enableHearingAssist
    && (int enableHearingAssist = self->_enableHearingAssist,
        enableHearingAssist != [v5 hearingAssistEnabled]))
  {
    if (gLogCategory_HMDeviceConfigurations <= 30
      && (gLogCategory_HMDeviceConfigurations != -1 || _LogCategory_Initialize()))
    {
      [v5 hearingAssistEnabled];
      LogPrintF();
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (char)allowListeningModeOff
{
  return self->_allowListeningModeOff;
}

- (void)setAllowListeningModeOff:(char)a3
{
  self->_int allowListeningModeOff = a3;
}

- (NSNumber)amplification
{
  return self->_amplification;
}

- (void)setAmplification:(id)a3
{
}

- (NSNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
}

- (NSNumber)beamFormer
{
  return self->_beamFormer;
}

- (void)setBeamFormer:(id)a3
{
}

- (char)enableHearingAid
{
  return self->_enableHearingAid;
}

- (void)setEnableHearingAid:(char)a3
{
  self->_int enableHearingAid = a3;
}

- (char)enableHearingAssist
{
  return self->_enableHearingAssist;
}

- (void)setEnableHearingAssist:(char)a3
{
  self->_int enableHearingAssist = a3;
}

- (char)enableHearingProtection
{
  return self->_enableHearingProtection;
}

- (void)setEnableHearingProtection:(char)a3
{
  self->_uint64_t enableHearingProtection = a3;
}

- (char)enableMediaAssist
{
  return self->_enableMediaAssist;
}

- (void)setEnableMediaAssist:(char)a3
{
  self->_int enableMediaAssist = a3;
}

- (char)enablePMEMedia
{
  return self->_enablePMEMedia;
}

- (void)setEnablePMEMedia:(char)a3
{
  self->_int enablePMEMedia = a3;
}

- (char)enablePMEVoice
{
  return self->_enablePMEVoice;
}

- (void)setEnablePMEVoice:(char)a3
{
  self->_int enablePMEVoice = a3;
}

- (char)enableSwipeGain
{
  return self->_enableSwipeGain;
}

- (void)setEnableSwipeGain:(char)a3
{
  self->_int enableSwipeGain = a3;
}

- (char)enrollHearingAssist
{
  return self->_enrollHearingAssist;
}

- (void)setEnrollHearingAssist:(char)a3
{
  self->_int enrollHearingAssist = a3;
}

- (char)enrollPMEVoice
{
  return self->_enrollPMEVoice;
}

- (void)setEnrollPMEVoice:(char)a3
{
  self->_int enrollPMEVoice = a3;
}

- (NSArray)mediaLossArrayLeft
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMediaLossArrayLeft:(id)a3
{
}

- (NSArray)mediaLossArrayRight
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMediaLossArrayRight:(id)a3
{
}

- (NSNumber)noiseSuppression
{
  return self->_noiseSuppression;
}

- (void)setNoiseSuppression:(id)a3
{
}

- (HKAudiogramSample)selectedAudiogram
{
  return self->_selectedAudiogram;
}

- (void)setSelectedAudiogram:(id)a3
{
}

- (NSArray)voiceLossArrayLeft
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setVoiceLossArrayLeft:(id)a3
{
}

- (NSArray)voiceLossArrayRight
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setVoiceLossArrayRight:(id)a3
{
}

- (NSNumber)tone
{
  return self->_tone;
}

- (void)setTone:(id)a3
{
}

- (NSData)mediaLossDataLeft
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMediaLossDataLeft:(id)a3
{
}

- (NSData)mediaLossDataRight
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMediaLossDataRight:(id)a3
{
}

- (NSData)voiceLossDataLeft
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setVoiceLossDataLeft:(id)a3
{
}

- (NSData)voiceLossDataRight
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setVoiceLossDataRight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceLossDataRight, 0);
  objc_storeStrong((id *)&self->_voiceLossDataLeft, 0);
  objc_storeStrong((id *)&self->_mediaLossDataRight, 0);
  objc_storeStrong((id *)&self->_mediaLossDataLeft, 0);
  objc_storeStrong((id *)&self->_tone, 0);
  objc_storeStrong((id *)&self->_voiceLossArrayRight, 0);
  objc_storeStrong((id *)&self->_voiceLossArrayLeft, 0);
  objc_storeStrong((id *)&self->_selectedAudiogram, 0);
  objc_storeStrong((id *)&self->_noiseSuppression, 0);
  objc_storeStrong((id *)&self->_mediaLossArrayRight, 0);
  objc_storeStrong((id *)&self->_mediaLossArrayLeft, 0);
  objc_storeStrong((id *)&self->_beamFormer, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_amplification, 0);
}

@end