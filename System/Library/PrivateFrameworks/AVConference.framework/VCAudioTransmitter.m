@interface VCAudioTransmitter
- ($630EEFBF570FF8F3C5E9582E2A557BD5)currentChannelMetrics;
- (BOOL)allocateLastInputSampleBuffer:(unsigned int)a3;
- (BOOL)chooseAudioNetworkBitrate;
- (BOOL)ignoreSilence;
- (BOOL)isAudioStalled;
- (BOOL)isCodecModeChangeRequestValid:(_VCAudioCodecModeChangeEvent *)a3;
- (BOOL)isCurrentDTXEnabled;
- (BOOL)isRedEnabled;
- (BOOL)isStandaloneStreamMode;
- (BOOL)periodicReportingEnabled;
- (BOOL)sendActiveVoiceOnly;
- (BOOL)sendCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3;
- (BOOL)setupAudio:(id *)a3;
- (BOOL)setupAudioEncoders;
- (BOOL)setupAudioTierPicker;
- (BOOL)setupEncoderBuffer;
- (BOOL)shouldUpdateCodecBandwidth:(_VCAudioCodecModeChangeEvent *)a3;
- (BOOL)shouldUpdateCodecBitrate:(_VCAudioCodecModeChangeEvent *)a3;
- (BOOL)useWiFiTiers;
- (NSArray)audioPayloads;
- (NSArray)supportedNumRedundantPayload;
- (NSDictionary)dtxMetrics;
- (VCAudioPayloadConfig)currentAudioPayloadConfig;
- (VCAudioTier)currentAudioTier;
- (VCAudioTierPicker)audioTierPicker;
- (VCAudioTransmitter)initWithConfig:(id)a3;
- (VCAudioTransmitterDelegate)delegate;
- (VCPacketBundler)audioBundler;
- (VCPacketBundler)audioBundlerShortRED;
- (float)nextAudioInterval:(int)a3;
- (id)packetsPerBundle;
- (int)actualAudioSendingBitrate;
- (int)actualAudioSendingBitrateNoRED;
- (int)audioTxBitrate;
- (int)operatingMode;
- (int)qualityIndicator;
- (unsigned)encodedBytes;
- (unsigned)inputMeter;
- (unsigned)lastSentAudioSampleTime;
- (unsigned)maxIDSStreamIdCount;
- (unsigned)maximumSamplesPerFrame;
- (unsigned)mediaControlInfoVersion;
- (unsigned)rateChangeCounter;
- (unsigned)redMaxDelay20ms;
- (unsigned)redNumPayloads;
- (unsigned)redundancyControllerModeForOperatingMode:(int)a3 isRedEnabled:(BOOL)a4 isHigherAudioREDCutoverU1Enabled:(BOOL)a5;
- (unsigned)sentAudioBytes;
- (unsigned)sentAudioBytesShort;
- (unsigned)targetBitrate;
- (void)audioIssueDetectorCreateAndConfigure;
- (void)audioIssueDetectorStopAndFinalize;
- (void)currentPayloadUsed:(int)a3 payloadUsed:(id *)a4;
- (void)dealloc;
- (void)gatherRealtimeStats:(__CFDictionary *)a3;
- (void)handleActiveConnectionChange:(id)a3;
- (void)handleActiveConnectionChangeDefault:(id)a3;
- (void)handleActiveConnectionChangeMultiway:(id)a3;
- (void)handleCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3 didUpdateBandwidth:(BOOL *)a4 didUpdateBitrate:(BOOL *)a5;
- (void)initAudioValues;
- (void)logNWConnectionNotification:(tagVCNWConnectionNotification *)a3;
- (void)logTierInfo:(int)a3;
- (void)process5GRATInNWConnectionNotification:(tagVCNWConnectionNotification *)a3;
- (void)processCDRXInNWConnectionNotification:(tagVCNWConnectionNotification *)a3;
- (void)processNWConnectionNotification:(tagVCNWConnectionNotification *)a3;
- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3;
- (void)redundancyController:(id)a3 redundancyIntervalDidChange:(double)a4;
- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4;
- (void)registerReportingTask;
- (void)removeUnusedAudioPayloads;
- (void)reportRTCPPacket;
- (void)reportRedundancyConfigChange;
- (void)setAudioTierPicker:(id)a3;
- (void)setCellTech:(int)a3 remoteCellular:(int)a4 isIPV6:(int)a5 audioCap:(unsigned int)a6;
- (void)setCurrentChannelMetrics:(id *)a3;
- (void)setCurrentDTXEnable:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInputMeter:(unsigned __int8)a3;
- (void)setIsAudioStalled:(BOOL)a3;
- (void)setMaxIDSStreamIdCount:(unsigned int)a3;
- (void)setMediaControlInfoVersion:(unsigned __int8)a3;
- (void)setOperatingMode:(int)a3;
- (void)setPeriodicReportingEnabled:(BOOL)a3;
- (void)setQualityIndicator:(int)a3;
- (void)setRateChangeCounter:(unsigned int)a3;
- (void)setRedNumPayloads:(int)a3 withMaxDelay:(int)a4 shouldResetHistory:(BOOL)a5 shouldEnableShortRED:(BOOL)a6;
- (void)setSendActiveVoiceOnly:(BOOL)a3;
- (void)setStreamIDs:(id)a3;
- (void)setSupportedNumRedundantPayload:(id)a3;
- (void)setTargetBitrate:(unsigned int)a3;
- (void)setUseWiFiTiers:(BOOL)a3;
- (void)setupAudioHeaderSize;
- (void)start;
- (void)stop;
- (void)updateAudioTxBitrate;
- (void)updateAudioTxRate;
- (void)useAudioPayload:(id)a3 withBitrate:(unsigned int)a4 redNumPayloads:(unsigned int)a5;
- (void)useAudioTier:(id)a3;
@end

@implementation VCAudioTransmitter

- (void)redundancyController:(id)a3 redundancyIntervalDidChange:(double)a4
{
  self->_redundancyInterval = a4;
  int v5 = [+[VCDefaults sharedInstance] forceRedMaxDelay];
  if (v5) {
    self->_redundancyInterval = (double)(20 * v5);
  }
}

- (VCAudioTransmitter)initWithConfig:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)VCAudioTransmitter;
  v4 = [(VCAudioTransmitter *)&v41 init];
  if (!v4) {
    return (VCAudioTransmitter *)v4;
  }
  if ((char *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_28;
    }
    __str = 0;
    v6 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "Initializing with config=%s", v6);
    if (!__str) {
      goto LABEL_28;
    }
    __lasts = 0;
    v13 = strtok_r(__str, "\n", &__lasts);
    v14 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAudioTransmitter initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 159;
          *(_WORD *)&buf[28] = 2080;
          *(void *)&buf[30] = "";
          *(_WORD *)&buf[38] = 2080;
          *(void *)&buf[40] = v13;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v13 = strtok_r(0, "\n", &__lasts);
    }
    while (v13);
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v5 = (__CFString *)[v4 performSelector:sel_logPrefix];
    }
    else {
      int v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_28;
    }
    __str = 0;
    v7 = (const char *)[(__CFString *)v5 UTF8String];
    v8 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "%s(%p) Initializing with config=%s", v7, v4, v8);
    if (!__str) {
      goto LABEL_28;
    }
    __lasts = 0;
    v9 = strtok_r(__str, "\n", &__lasts);
    v10 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAudioTransmitter initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 159;
          *(_WORD *)&buf[28] = 2080;
          *(void *)&buf[30] = "";
          *(_WORD *)&buf[38] = 2080;
          *(void *)&buf[40] = v9;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v9 = strtok_r(0, "\n", &__lasts);
    }
    while (v9);
  }
  free(__str);
LABEL_28:
  *((void *)v4 + 36) = [a3 rtpHandle];
  CFTypeRef v17 = (CFTypeRef)[a3 controlInfoGenerator];
  if (v17) {
    CFTypeRef v17 = CFRetain(v17);
  }
  *((void *)v4 + 40) = v17;
  *((void *)v4 + 44) = objc_msgSend((id)objc_msgSend(a3, "audioPayloads"), "mutableCopy");
  *((void *)v4 + 46) = [a3 chosenAudioPayload];
  *((void *)v4 + 45) = [a3 chosenDTXPayload];
  v4[336] = [a3 isRedEnabled];
  *((_DWORD *)v4 + 94) = [a3 chosenRedPayloadType];
  v4[337] = [a3 includeRedSequenceOffset];
  *((_DWORD *)v4 + 85) = [a3 redNumPayloads];
  *((_DWORD *)v4 + 86) = [a3 redMaxDelay20ms];
  v4[328] = [a3 useRateControl];
  v4[329] = [a3 isUseCaseWatchContinuity];
  v4[330] = [a3 allowAudioSwitching];
  *((void *)v4 + 37) = [a3 afrcHandle];
  *((_DWORD *)v4 + 111) = [a3 operatingMode];
  v4[331] = [a3 supportsAdaptation];
  v4[332] = [a3 needsPacketThread];
  *((void *)v4 + 56) = [a3 transportSession];
  *((void *)v4 + 38) = [a3 mediaQueue];
  *((void *)v4 + 39) = [a3 rtpVideo];
  v18 = v4 + 384;
  if (a3) {
    [a3 inputFormat];
  }
  else {
    memset(buf, 0, 48);
  }
  long long v19 = *(_OWORD *)&buf[16];
  _OWORD *v18 = *(_OWORD *)buf;
  *((_OWORD *)v4 + 25) = v19;
  *((_OWORD *)v4 + 26) = *(_OWORD *)&buf[32];
  *((void *)v4 + 31) = [a3 statisticsCollector];
  v4[348] = [a3 transmitROC];
  v4[464] = [a3 ignoreSilence];
  *((_DWORD *)v4 + 52) = 100000;
  *((_DWORD *)v4 + 117) = [a3 tierNetworkBitrate];
  *((_DWORD *)v4 + 172) = [a3 maxIDSStreamIdCount];
  *((void *)v4 + 87) = (id)[a3 supportedNumRedundantPayload];
  v4[472] = [a3 sendActiveVoiceOnly];
  v4[704] = [a3 isCurrentDTXEnabled];
  v4[705] = [a3 mediaControlInfoVersion];
  v4[706] = [a3 alwaysOnAudioRedundancyEnabled];
  v4[707] = [a3 cellularAllowRedLowBitratesEnabled];
  v4[708] = [a3 wifiAllowRedLowBitratesEnabled];
  *((void *)v4 + 90) = [a3 remoteIDSParticipantID];
  v4[728] = [a3 useChannelDataFormat];
  *((_DWORD *)v4 + 119) = [a3 qualityIndex];
  v4[729] = [a3 useWifiTiers];
  v4[730] = [a3 supportsCodecBandwidthUpdate];
  v4[916] = [a3 tierPickerMode];
  v4[972] = [a3 targetBitrateIsAudioOnly];
  if ([a3 maxAudioPacketSize]) {
    int v20 = [a3 maxAudioPacketSize];
  }
  else {
    int v20 = 1280;
  }
  *((_DWORD *)v4 + 24) = v20;
  int v21 = [a3 constantTransportOverhead];
  *((_DWORD *)v4 + 25) = v21;
  if (v4[728])
  {
    if (v21) {
      int v22 = *((_DWORD *)v4 + 25)
    }
          + VCNetworkUtils_AdditionalOverheadForIDSOptions(*((_DWORD *)v4 + 172), 1, 0);
    else {
      int v22 = VCNetworkUtils_WorstCaseIDSOverheadForOptions(*((_DWORD *)v4 + 172), 1, 0);
    }
    *((_DWORD *)v4 + 25) = v22;
    v4[687] = 1;
  }
  uint64_t v23 = *((void *)v4 + 90);
  if (v23)
  {
    v4[638] = 1;
    *((void *)v4 + 80) = v23;
  }
  CFTypeRef v24 = (CFTypeRef)[a3 sframeCryptor];
  if (v24) {
    CFTypeRef v24 = CFRetain(v24);
  }
  *((void *)v4 + 105) = v24;
  *((_DWORD *)v4 + 242) = [a3 packetExpirationTime];
  *((_DWORD *)v4 + 120) = [a3 ratType];
  v25 = (const void *)*((void *)v4 + 54);
  v26 = (const void *)[a3 reportingAgent];
  *((void *)v4 + 54) = v26;
  if (v26) {
    CFRetain(v26);
  }
  if (v25) {
    CFRelease(v25);
  }
  *((_DWORD *)v4 + 110) = VCReporting_GetDynamicReportingModuleID();
  [a3 reportingParentID];
  reportingInheritModuleSpecificInfoFromParent();
  *((void *)v4 + 89) = VCMemoryPool_Create(0x640uLL);
  id v27 = *((id *)v4 + 45);
  id v28 = *((id *)v4 + 56);
  id v29 = *((id *)v4 + 31);
  *((void *)v4 + 1) = -[VCPacketBundler initWithOperatingMode:bundlingScheme:]([VCPacketBundler alloc], "initWithOperatingMode:bundlingScheme:", *((unsigned int *)v4 + 111), [a3 bundlingScheme]);
  objc_msgSend(*((id *)v4 + 1), "setPacketsPerBundle:", objc_msgSend(a3, "packetsPerBundle"));
  *((void *)v4 + 2) = -[VCPacketBundler initWithOperatingMode:bundlingScheme:]([VCPacketBundler alloc], "initWithOperatingMode:bundlingScheme:", *((unsigned int *)v4 + 111), [a3 bundlingScheme]);
  objc_msgSend(*((id *)v4 + 2), "setPacketsPerBundle:", objc_msgSend(a3, "packetsPerBundle"));
  v4[908] = 0;
  *((_DWORD *)v4 + 228) = 0;
  *((_DWORD *)v4 + 226) = 128;
  [v4 initAudioValues];
  *((void *)v4 + 3) = [[VCAudioRedBuilder alloc] initWithRedPayloadType:*((unsigned int *)v4 + 94) sampleRate:*((double *)v4 + 48) samplesPerFrame:*((unsigned int *)v4 + 106) numPayloads:*((unsigned int *)v4 + 85) maxDelay:*((unsigned int *)v4 + 86) includeSequenceOffset:v4[337]];
  if ([a3 shouldCreateRedundancyController]) {
    *((void *)v4 + 4) = -[VCRedundancyControllerAudio initWithDelegate:statisticsCollector:mode:]([VCRedundancyControllerAudio alloc], "initWithDelegate:statisticsCollector:mode:", v4, *((void *)v4 + 31), objc_msgSend(v4, "redundancyControllerModeForOperatingMode:isRedEnabled:isHigherAudioREDCutoverU1Enabled:", *((unsigned int *)v4 + 111), v4[336], objc_msgSend(a3, "isHigherAudioREDCutoverU1Enabled")));
  }
  int v30 = [+[VCDefaults sharedInstance] forceRedNumPayloads];
  if (v30) {
    *((_DWORD *)v4 + 56) = 100 * v30;
  }
  int v31 = [+[VCDefaults sharedInstance] forceRedMaxDelay];
  if (v31) {
    *((double *)v4 + 29) = (double)(20 * v31);
  }
  float v32 = *((double *)v4 + 48);
  *((float *)v4 + 28) = (float)*((unsigned int *)v4 + 106) / v32;
  [*((id *)v4 + 1) setMaxPacketSize:1600];
  [*((id *)v4 + 2) setMaxPacketSize:1600];
  *((_DWORD *)v4 + 239) = RTPGetTimestampBase();
  objc_msgSend(v4, "setStreamIDs:", objc_msgSend(a3, "streamIDs"));
  v4[960] = VCDefaults_GetBoolValueForKey(@"shouldApplyRedAsBoolean", [a3 shouldApplyRedAsBoolean]);
  *((void *)v4 + 106) = 0;
  if ([a3 audioIssueDetectorEnabled]) {
    [v4 audioIssueDetectorCreateAndConfigure];
  }
  v4[880] = [a3 audioDumpEnabled];
  *((void *)v4 + 112) = v18;
  *((_DWORD *)v4 + 221) = objc_msgSend((id)objc_msgSend(*((id *)v4 + 46), "config"), "payload");
  v4[888] = objc_msgSend((id)objc_msgSend(*((id *)v4 + 46), "config"), "payloadOctetAligned");
  v4[889] = objc_msgSend((id)objc_msgSend(*((id *)v4 + 46), "config"), "evsHeaderFullOnly");
  v4[600] = 0;
  *((_OWORD *)v4 + 54) = 0u;
  v4[917] = [a3 ramStadSRCEnabled];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    v33 = objc_opt_class()
        ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String")
        : "<nil>";
    asprintf(&__str, "%s[%p] %s", v33, v4, (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String"));
    if (__str)
    {
      __lasts = 0;
      v34 = strtok_r(__str, "\n", &__lasts);
      v35 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v36 = VRTraceErrorLogLevelToCSTR();
          v37 = *v35;
          if (os_log_type_enabled(*v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            *(void *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCAudioTransmitter initWithConfig:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 280;
            *(_WORD *)&buf[28] = 2080;
            *(void *)&buf[30] = "-[VCAudioTransmitter initWithConfig:]";
            *(_WORD *)&buf[38] = 2080;
            *(void *)&buf[40] = v34;
            _os_log_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v34 = strtok_r(0, "\n", &__lasts);
      }
      while (v34);
      free(__str);
    }
  }
  return (VCAudioTransmitter *)v4;
}

- (unsigned)redundancyControllerModeForOperatingMode:(int)a3 isRedEnabled:(BOOL)a4 isHigherAudioREDCutoverU1Enabled:(BOOL)a5
{
  int v5 = 1 << a3;
  if (a5) {
    int v6 = 3;
  }
  else {
    int v6 = 2;
  }
  if (!a4) {
    int v6 = 1;
  }
  if ((v5 & 0x86) != 0) {
    int v7 = v6;
  }
  else {
    int v7 = 4;
  }
  if ((v5 & 0x3F39) != 0) {
    unsigned int v8 = 0;
  }
  else {
    unsigned int v8 = v7;
  }
  if (a3 <= 0xD) {
    return v8;
  }
  else {
    return 4;
  }
}

- (void)initAudioValues
{
  self->_lastIsTalking = 1;
  self->_lastUpdateQualityIndicator = 0.0;
  self->_qualityIndicator = 0;
  self->_audioTierChangeRequestCount = 0;
  self->_lastTierSwitch = 0.0;
  self->_audioTxBitrate = 32000;
  LODWORD(v2) = self->_inputFormat.samplesPerFrame;
  self->_audioInterval = (double)v2 / self->_inputFormat.format.mSampleRate;
  self->_lastSentAudioSampleTime = 0;
  self->_inputMeter = 0;
  self->_audioHeaderSize = -1;
  self->_audioTierChangeCount = 0;
  self->_sendSilenceSamplesEnabled = 0;
  self->_firstSilencePacketTimeStamp = NAN;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  reportingUnregisterPeriodicTask();
  reportingCacheModuleSpecificInfo();
  reportingAgent = self->_reportingAgent;
  if (reportingAgent) {
    CFRelease(reportingAgent);
  }

  objc_storeWeak(&self->_delegate, 0);
  lastInputSampleBuffer = self->_lastInputSampleBuffer;
  if (lastInputSampleBuffer) {
    free(lastInputSampleBuffer);
  }

  [(VCRedundancyControllerAudio *)self->_redundancyController unregisterStatistics];
  controlInfoGenerator = self->_controlInfoGenerator;
  if (controlInfoGenerator) {
    CFRelease(controlInfoGenerator);
  }
  sframeCryptor = self->_sframeCryptor;
  if (sframeCryptor) {
    CFRelease(sframeCryptor);
  }
  VCAudioBufferList_Destroy((uint64_t *)&self->_encodeBuffer);
  audioBundlePool = (OSQueueHead *)self->_audioBundlePool;
  if (audioBundlePool)
  {
    VCMemoryPool_Destroy(audioBundlePool);
    self->_audioBundlePool = 0;
  }
  if (self->_audioIssueDetector) {
    [(VCAudioTransmitter *)self audioIssueDetectorStopAndFinalize];
  }
  VCAudioDump_Finalize((void **)&self->_encoderOutAudioDump);
  VCAudioDump_Finalize((void **)&self->_encoderInAudioDump);
  v8.receiver = self;
  v8.super_class = (Class)VCAudioTransmitter;
  [(VCAudioTransmitter *)&v8 dealloc];
}

- (VCAudioTransmitterDelegate)delegate
{
  return (VCAudioTransmitterDelegate *)objc_loadWeak(&self->_delegate);
}

- (VCAudioPayloadConfig)currentAudioPayloadConfig
{
  return [(VCAudioPayload *)self->_currentAudioPayload config];
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldUpdateCodecBitrate:(_VCAudioCodecModeChangeEvent *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a3->codecBitrate)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_18;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    int codecRateMode = a3->codecRateMode;
    unsigned int codecBitrate = a3->codecBitrate;
    int v24 = 136316418;
    uint64_t v25 = v8;
    __int16 v26 = 2080;
    id v27 = "-[VCAudioTransmitter shouldUpdateCodecBitrate:]";
    __int16 v28 = 1024;
    int v29 = 379;
    __int16 v30 = 2048;
    int v31 = self;
    __int16 v32 = 1024;
    int v33 = codecRateMode;
    __int16 v34 = 1024;
    LODWORD(v35) = codecBitrate;
    v12 = " [%s] %s:%d VCAudioTransmitter[%p] Codec rate mode change request had incorrect bitrate: mode=%u, bitrate=%u";
LABEL_13:
    v16 = v9;
    uint32_t v17 = 50;
LABEL_17:
    _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v24, v17);
    goto LABEL_18;
  }
  if ([(VCAudioPayload *)self->_currentAudioPayload bitrate] == a3->codecBitrate) {
    goto LABEL_18;
  }
  int payload = a3->payload;
  if (payload != [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] payload])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_18;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    int v14 = a3->payload;
    int v15 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] payload];
    int v24 = 136316418;
    uint64_t v25 = v13;
    __int16 v26 = 2080;
    id v27 = "-[VCAudioTransmitter shouldUpdateCodecBitrate:]";
    __int16 v28 = 1024;
    int v29 = 382;
    __int16 v30 = 2048;
    int v31 = self;
    __int16 v32 = 1024;
    int v33 = v14;
    __int16 v34 = 1024;
    LODWORD(v35) = v15;
    v12 = " [%s] %s:%d VCAudioTransmitter[%p] Payload in codec mode change event does not match current payload: payload="
          "%d, currentPayload=%d";
    goto LABEL_13;
  }
  int v6 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] supportedBitrates];
  if (-[NSArray containsObject:](v6, "containsObject:", [NSNumber numberWithUnsignedInt:a3->codecBitrate]))
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    long long v19 = *MEMORY[0x1E4F47A50];
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    int v20 = a3->payload;
    int v21 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] supportedBitrates];
    unsigned int v22 = a3->codecBitrate;
    int v24 = 136316674;
    uint64_t v25 = v18;
    __int16 v26 = 2080;
    id v27 = "-[VCAudioTransmitter shouldUpdateCodecBitrate:]";
    __int16 v28 = 1024;
    int v29 = 385;
    __int16 v30 = 2048;
    int v31 = self;
    __int16 v32 = 1024;
    int v33 = v20;
    __int16 v34 = 2112;
    v35 = v21;
    __int16 v36 = 1024;
    unsigned int v37 = v22;
    v12 = " [%s] %s:%d VCAudioTransmitter[%p] Attempting to update to an unsupported codec bitrate: payload=%d, supported"
          "Bitrates=%@, bitrate=%d";
    v16 = v19;
    uint32_t v17 = 60;
    goto LABEL_17;
  }
LABEL_18:
  LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)shouldUpdateCodecBandwidth:(_VCAudioCodecModeChangeEvent *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int payload = a3->payload;
  if (payload == [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] payload])
  {
    int codecBandwidth = a3->codecBandwidth;
    if (codecBandwidth != [(VCAudioPayload *)self->_currentAudioPayload bandwidth])
    {
      BOOL v7 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] supportedBandwidths];
      if (-[NSArray containsObject:](v7, "containsObject:", [NSNumber numberWithUnsignedInt:a3->codecBandwidth]))
      {
        LOBYTE(v8) = 1;
        return v8;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        uint32_t v17 = *MEMORY[0x1E4F47A50];
        BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v8) {
          return v8;
        }
        int v18 = a3->payload;
        long long v19 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] supportedBandwidths];
        int v20 = a3->codecBandwidth;
        int v22 = 136316674;
        uint64_t v23 = v16;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCAudioTransmitter shouldUpdateCodecBandwidth:]";
        __int16 v26 = 1024;
        int v27 = 400;
        __int16 v28 = 2048;
        int v29 = self;
        __int16 v30 = 1024;
        int v31 = v18;
        __int16 v32 = 2112;
        int v33 = v19;
        __int16 v34 = 1024;
        int v35 = v20;
        uint64_t v13 = " [%s] %s:%d VCAudioTransmitter[%p] Attempting to update to an unsupported codec bandwidth: payload=%d, sup"
              "portedBandwidths=%@, bitrate=%d";
        int v14 = v17;
        uint32_t v15 = 60;
LABEL_12:
        _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v22, v15);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v8) {
      return v8;
    }
    int v11 = a3->payload;
    int v12 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] payload];
    int v22 = 136316418;
    uint64_t v23 = v9;
    __int16 v24 = 2080;
    uint64_t v25 = "-[VCAudioTransmitter shouldUpdateCodecBandwidth:]";
    __int16 v26 = 1024;
    int v27 = 396;
    __int16 v28 = 2048;
    int v29 = self;
    __int16 v30 = 1024;
    int v31 = v11;
    __int16 v32 = 1024;
    LODWORD(v33) = v12;
    uint64_t v13 = " [%s] %s:%d VCAudioTransmitter[%p] Payload in codec mode change event does not match current payload: payload="
          "%d currentPayload=%d";
    int v14 = v10;
    uint32_t v15 = 50;
    goto LABEL_12;
  }
  LOBYTE(v8) = 0;
  return v8;
}

- (BOOL)isCodecModeChangeRequestValid:(_VCAudioCodecModeChangeEvent *)a3
{
  BOOL v5 = +[VCPayloadUtils isCodecModeSupported:a3->codecRateMode forBandwidth:a3->codecBandwidth withPayload:a3->payload];
  BOOL v6 = +[VCPayloadUtils skipBandWidthCheckForCodecRateModes:a3->payload supportedBitrates:[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] supportedBitrates]];
  BOOL result = v6 && v5;
  if (!v6 && v5)
  {
    if ([(VCAudioPayload *)self->_currentAudioPayload bandwidth] == a3->codecBandwidth)
    {
      return 1;
    }
    else
    {
      BOOL v8 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] supportedBandwidths];
      uint64_t v9 = [NSNumber numberWithUnsignedInt:a3->codecBandwidth];
      return [(NSArray *)v8 containsObject:v9];
    }
  }
  return result;
}

- (void)handleCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3 didUpdateBandwidth:(BOOL *)a4 didUpdateBitrate:(BOOL *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  _VCAudioCodecModeChangeEvent v33 = *a3;
  if ([(VCAudioTransmitter *)self isCodecModeChangeRequestValid:&v33])
  {
    BOOL v9 = +[VCPayloadUtils isEVSPayload:a3->payload];
    unsigned int offset = a3->RFParams.offset;
    BOOL v11 = offset > 7;
    int v12 = (1 << offset) & 0xAC;
    if (!v11 && v12 != 0 && a3->RFParams.indicator < 2 && v9)
    {
      if ([(VCAudioPayload *)self->_currentAudioPayload setEVSRFParams:&a3->RFParams])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          uint64_t v16 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v17 = a3->RFParams.offset;
            unsigned int indicator = a3->RFParams.indicator;
            v33.int payload = 136316418;
            *(void *)&v33.int codecRateMode = v15;
            LOWORD(v33.codecBitrate) = 2080;
            *(void *)((char *)&v33.codecBitrate + 2) = "-[VCAudioTransmitter handleCodecModeChangeEvent:didUpdateBandwi"
                                                         "dth:didUpdateBitrate:]";
            HIWORD(v33.RFParams.indicator) = 1024;
            int v34 = 439;
            __int16 v35 = 2048;
            uint64_t v36 = self;
            __int16 v37 = 1024;
            unsigned int v38 = v17;
            __int16 v39 = 1024;
            unsigned int v40 = indicator;
            _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioTransmitter[%p] EVSCodec rfparams change requested offset=%u indicator=%u ", (uint8_t *)&v33, 0x32u);
          }
        }
      }
    }
    if (self->_supportsCodecBandwidthUpdate)
    {
      _VCAudioCodecModeChangeEvent v33 = *a3;
      if ([(VCAudioTransmitter *)self shouldUpdateCodecBandwidth:&v33])
      {
        BOOL v19 = [(VCAudioPayload *)self->_currentAudioPayload setBandwidth:a3->codecBandwidth];
        if (a4)
        {
          if (v19)
          {
            *a4 = 1;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              uint64_t v20 = VRTraceErrorLogLevelToCSTR();
              int v21 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                int payload = a3->payload;
                int codecRateMode = a3->codecRateMode;
                int codecBandwidth = a3->codecBandwidth;
                v33.int payload = 136316674;
                *(void *)&v33.int codecRateMode = v20;
                LOWORD(v33.codecBitrate) = 2080;
                *(void *)((char *)&v33.codecBitrate + 2) = "-[VCAudioTransmitter handleCodecModeChangeEvent:didUpdateBa"
                                                             "ndwidth:didUpdateBitrate:]";
                HIWORD(v33.RFParams.indicator) = 1024;
                int v34 = 446;
                __int16 v35 = 2048;
                uint64_t v36 = self;
                __int16 v37 = 1024;
                unsigned int v38 = payload;
                __int16 v39 = 1024;
                unsigned int v40 = codecRateMode;
                __int16 v41 = 1024;
                unsigned int v42 = codecBandwidth;
                _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioTransmitter[%p] Codec bandwidth change requested for payload=%u: mode=%u bandwidth=%u", (uint8_t *)&v33, 0x38u);
              }
            }
          }
        }
      }
    }
    _VCAudioCodecModeChangeEvent v33 = *a3;
    if ([(VCAudioTransmitter *)self shouldUpdateCodecBitrate:&v33])
    {
      BOOL v25 = [(VCAudioPayload *)self->_currentAudioPayload setBitrate:a3->codecBitrate];
      if (a5)
      {
        if (v25)
        {
          *a5 = 1;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v26 = VRTraceErrorLogLevelToCSTR();
            int v27 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v28 = a3->payload;
              int v29 = a3->codecRateMode;
              unsigned int codecBitrate = a3->codecBitrate;
              v33.int payload = 136316674;
              *(void *)&v33.int codecRateMode = v26;
              LOWORD(v33.codecBitrate) = 2080;
              *(void *)((char *)&v33.codecBitrate + 2) = "-[VCAudioTransmitter handleCodecModeChangeEvent:didUpdateBand"
                                                           "width:didUpdateBitrate:]";
              HIWORD(v33.RFParams.indicator) = 1024;
              int v34 = 453;
              __int16 v35 = 2048;
              uint64_t v36 = self;
              __int16 v37 = 1024;
              unsigned int v38 = v28;
              __int16 v39 = 1024;
              unsigned int v40 = v29;
              __int16 v41 = 1024;
              unsigned int v42 = codecBitrate;
              _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioTransmitter[%p] Codec rate mode change requested for payload=%u: mode=%u bitrate=%u", (uint8_t *)&v33, 0x38u);
            }
          }
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v31 = VRTraceErrorLogLevelToCSTR();
    __int16 v32 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioTransmitter handleCodecModeChangeEvent:didUpdateBandwidth:didUpdateBitrate:](v31, &a3->payload, v32);
    }
  }
}

- (BOOL)sendCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  currentAudioPayload = self->_currentAudioPayload;
  _VCAudioCodecModeChangeEvent v17 = *a3;
  BOOL v6 = [(VCAudioPayload *)currentAudioPayload setCodecModeRequest:&v17];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v6)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      BOOL v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int codecRateMode = a3->codecRateMode;
        int codecBandwidth = a3->codecBandwidth;
        v17.int payload = 136316418;
        *(void *)&v17.int codecRateMode = v8;
        LOWORD(v17.codecBitrate) = 2080;
        *(void *)((char *)&v17.codecBitrate + 2) = "-[VCAudioTransmitter sendCodecModeChangeEvent:]";
        HIWORD(v17.RFParams.indicator) = 1024;
        int v18 = 463;
        __int16 v19 = 2048;
        uint64_t v20 = self;
        __int16 v21 = 1024;
        int v22 = codecRateMode;
        __int16 v23 = 1024;
        int v24 = codecBandwidth;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioTransmitter[%p] Requested codec rate mode change: mode=%u bandwidth=%u", (uint8_t *)&v17, 0x32u);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v15 = a3->codecRateMode;
      int v16 = a3->codecBandwidth;
      v17.int payload = 136316418;
      *(void *)&v17.int codecRateMode = v12;
      LOWORD(v17.codecBitrate) = 2080;
      *(void *)((char *)&v17.codecBitrate + 2) = "-[VCAudioTransmitter sendCodecModeChangeEvent:]";
      HIWORD(v17.RFParams.indicator) = 1024;
      int v18 = 465;
      __int16 v19 = 2048;
      uint64_t v20 = self;
      __int16 v21 = 1024;
      int v22 = v15;
      __int16 v23 = 1024;
      int v24 = v16;
      _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCAudioTransmitter[%p] Failed requesting codec rate mode change: mode=%u bandwidth=%u", (uint8_t *)&v17, 0x32u);
    }
  }
  return v6;
}

- (void)setCellTech:(int)a3 remoteCellular:(int)a4 isIPV6:(int)a5 audioCap:(unsigned int)a6
{
  BOOL v6 = self->_isLocalCellular_LowestConnectionQuality != a3
    || self->_isRemoteCellular_LowestConnectionQuality != a4
    || self->_isConnectedOnIPv6_LowestConnectionQuality != a5
    || self->_currentAudioCap != a6;
  self->_isConnectedOnIPv6_LowestConnectionQuality = a5 != 0;
  self->_isLocalCellular_LowestConnectionQuality = a3 != 0;
  self->_isRemoteCellular_LowestConnectionQuality = a4 != 0;
  self->_currentAudioCap = a6;
  if (v6) {
    atomic_fetch_add(&self->_audioTierChangeRequestCount, 1u);
  }
}

- (BOOL)setupEncoderBuffer
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  audioPayloads = self->_audioPayloads;
  uint64_t v4 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (!v4) {
    goto LABEL_14;
  }
  uint64_t v5 = v4;
  unsigned int v6 = 0;
  uint64_t v7 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(audioPayloads);
      }
      unsigned int v9 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "config"), "samplesPerFrame");
      if (v9 > v6) {
        unsigned int v6 = v9;
      }
    }
    uint64_t v5 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v16 objects:v15 count:16];
  }
  while (v5);
  if (v6)
  {
    for (unsigned int j = 0; j < v6; j += self->_inputFormat.samplesPerFrame)
      ;
  }
  else
  {
LABEL_14:
    unsigned int j = 0;
  }
  VCAudioBufferList_Destroy((uint64_t *)&self->_encodeBuffer);
  long long v11 = *(_OWORD *)&self->_inputFormat.format.mBytesPerPacket;
  v13[0] = *(_OWORD *)&self->_inputFormat.format.mSampleRate;
  v13[1] = v11;
  uint64_t v14 = *(void *)&self->_inputFormat.format.mBitsPerChannel;
  return VCAudioBufferList_Allocate(v13, j, &self->_encodeBuffer);
}

- (BOOL)setupAudio:(id *)a3
{
  p_payloadInfo = &self->_payloadInfo;
  self->_encoderOutAudioDump = (tagVCAudioDump *)VCAudioDump_Create(1u, (uint64_t)&self->_payloadInfo);
  self->_encoderInAudioDump = (tagVCAudioDump *)VCAudioDump_Create(0, (uint64_t)p_payloadInfo);
  [(VCAudioTransmitter *)self setupAudioHeaderSize];
  if (![(VCAudioTransmitter *)self setupAudioTierPicker])
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioTransmitter.m", 512);
    uint64_t v8 = @"Couldn't setup audio selector";
    unsigned int v9 = @"Bad audio payload?";
LABEL_12:
    v10 = a3;
    uint64_t v11 = 227;
    goto LABEL_13;
  }
  [(VCAudioTransmitter *)self logTierInfo:0];
  if ([(VCAudioTransmitter *)self setupAudioEncoders])
  {
    if ([(VCPacketBundler *)self->_audioBundler allocateBundleBuffer:1600]
      && [(VCPacketBundler *)self->_audioBundlerShortRED allocateBundleBuffer:1600]
      && [(VCAudioTransmitter *)self allocateLastInputSampleBuffer:[(VCAudioTransmitter *)self maximumSamplesPerFrame]])
    {
      if ([(VCAudioTransmitter *)self setupEncoderBuffer]) {
        return 1;
      }
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioTransmitter.m", 545);
      uint64_t v8 = @"Couldn't allocate encode buffer for audio";
    }
    else
    {
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioTransmitter.m", 535);
      uint64_t v8 = @"Couldn't allocate memory for audio";
    }
    unsigned int v9 = @"Malloc?";
    goto LABEL_12;
  }
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioTransmitter.m", 524);
  uint64_t v8 = @"Couldn't setup encoder.";
  unsigned int v9 = @"Bad remote payload?";
  v10 = a3;
  uint64_t v11 = 226;
LABEL_13:
  +[GKVoiceChatError getNSError:v10 code:32016 detailedCode:v11 filePath:v7 description:v8 reason:v9];
  return 0;
}

- (void)updateAudioTxRate
{
  double v3 = micro();
  double lastReportingCallbackTimeShort = self->_lastReportingCallbackTimeShort;
  double v5 = v3 - lastReportingCallbackTimeShort;
  self->_double lastReportingCallbackTimeShort = v3;
  networkBitrate = self->_currentChannelMetrics.networkBitrate;
  *(_OWORD *)&self->_currentChannelMetrics.networkBitrate[1] = *(_OWORD *)self->_currentChannelMetrics.networkBitrate;
  if (v3 - lastReportingCallbackTimeShort >= 0.5)
  {
    unsigned int v8 = [(VCAudioTransmitter *)self sentAudioBytesShort];
    HIDWORD(lastReportingCallbackTimeShort) = 1083129856;
    unsigned int v7 = ((double)(8 * v8) / v5 / 1000.0 + 0.5);
  }
  else
  {
    unsigned int v7 = 0;
  }
  uint64_t v9 = 0;
  unsigned int *networkBitrate = v7;
  double v10 = 0.0;
  do
  {
    LODWORD(lastReportingCallbackTimeShort) = networkBitrate[v9];
    double lastReportingCallbackTimeShort = (double)*(unint64_t *)&lastReportingCallbackTimeShort;
    double v10 = v10 + lastReportingCallbackTimeShort;
    ++v9;
  }
  while (v9 != 5);
  self->_currentChannelMetrics.averageNetworkBitrate = (v10 / 5.0);
}

- (BOOL)isStandaloneStreamMode
{
  return (self->_operatingMode < 0xDu) & (0x1820u >> self->_operatingMode);
}

- (void)gatherRealtimeStats:(__CFDictionary *)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  [(VCAudioTransmitter *)self updateAudioTxRate];
  if (a3)
  {
    double v5 = micro();
    double v6 = v5 - self->_lastReportingCallbackTime;
    self->_lastReportingCallbackTime = v5;
    if (v6 >= 0.5)
    {
      uint64_t v10 = ((double)(8 * [(VCAudioTransmitter *)self encodedBytes]) / v6 / 1000.0 + 0.5);
      uint64_t v9 = ((double)(8 * [(VCAudioTransmitter *)self sentAudioBytes]) / v6 / 1000.0 + 0.5);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        unsigned int v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v35 = v7;
          __int16 v36 = 2080;
          __int16 v37 = "-[VCAudioTransmitter gatherRealtimeStats:]";
          __int16 v38 = 1024;
          int v39 = 592;
          __int16 v40 = 2048;
          __int16 v41 = self;
          __int16 v42 = 2048;
          *(double *)uint64_t v43 = v6;
          *(_WORD *)&v43[8] = 2048;
          *(void *)&v43[10] = 0x3FE0000000000000;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d [%p] Failed to compute audio Tx bit rate because timePeriod=%fs < (AUDIO_TRANSMITTER_MIN_BITRATE_REPORT_PERIOD=%fs)", buf, 0x3Au);
        }
      }
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
    self->_currentChannelMetrics.averageMediaBitrate = 0;
    unint64_t v33 = 0;
    RTPGetUplinkReportingStats((uint64_t)self->_rtpHandle, &v33);
    unint64_t lastReportedRTPIngresspackets = self->_lastReportedRTPIngresspackets;
    if (v33 <= lastReportedRTPIngresspackets) {
      unint64_t lastReportedRTPIngresspackets = 0;
    }
    unint64_t v12 = v33 - lastReportedRTPIngresspackets;
    uint64_t v13 = (__CFDictionary *)selectDestinationForRTMetrics();
    CFDictionaryAddValue(v13, @"RTPUplinkIngressAudioPkts", (const void *)[NSNumber numberWithUnsignedLongLong:v12]);
    CFDictionaryAddValue(v13, @"ATxR", (const void *)[NSNumber numberWithUnsignedInt:v9]);
    LODWORD(v14) = self->_currentDuplication;
    CFDictionaryAddValue(v13, @"AFEC", (const void *)[NSNumber numberWithDouble:(double)v14 / 100.0]);
    CFDictionaryAddValue(v13, @"ATxRPrimary", (const void *)[NSNumber numberWithUnsignedInt:v10]);
    CFDictionaryAddValue(v13, @"ATxEncodedBitrate", (const void *)[NSNumber numberWithInt:self->_actualAudioSendingBitrateNoRED]);
    CFDictionaryAddValue(v13, @"VCASRedundancyLevel", (const void *)[NSNumber numberWithUnsignedInt:self->_redNumPayloads]);
    CFDictionaryAddValue(v13, @"QID", (const void *)[NSNumber numberWithUnsignedInt:self->_qualityIndex]);
    CFDictionaryAddValue(v13, @"ATCC", (const void *)[NSNumber numberWithUnsignedInt:self->_inputFormat.format.mChannelsPerFrame]);
    CFDictionaryAddValue(v13, @"RedPayloadsAlt", (const void *)[NSNumber numberWithUnsignedInt:self->_tierInfo.redPayloads]);
    CFDictionaryAddValue(v13, @"RedMaxDelayAlt", (const void *)[NSNumber numberWithUnsignedInt:self->_tierInfo.redMaxDelay]);
    CFDictionaryAddValue(v13, @"REDPayloadBitrate", (const void *)[NSNumber numberWithUnsignedInt:self->_tierInfo.redPayloadBitrate]);
    CFDictionaryAddValue(v13, @"PayloadAlt", (const void *)[NSNumber numberWithUnsignedInt:self->_tierInfo.codecPayload]);
    CFDictionaryAddValue(v13, @"BitRateAlt", (const void *)[NSNumber numberWithUnsignedInt:self->_tierInfo.codecBitrate]);
    CFDictionaryAddValue(v13, @"BundleAlt", (const void *)[NSNumber numberWithUnsignedInt:self->_tierInfo.bundling]);
    int v15 = NSNumber;
    atomic_exchange((atomic_uint *volatile)&self->_audioTierChangeCount, 0);
    CFDictionaryAddValue(v13, @"ATierChangeCount", (const void *)objc_msgSend(v15, "numberWithUnsignedInt:"));
    if ([(VCAudioTransmitter *)self isStandaloneStreamMode])
    {
      LODWORD(v16) = self->_targetBitrate;
      CFDictionaryAddValue(v13, @"TTxR", (const void *)[NSNumber numberWithDouble:(double)v16 / 1000.0]);
    }
    unsigned int v32 = 0;
    RTPGetPacketSent((uint64_t)self->_rtpHandle, &v32);
    double v31 = 0.0;
    AFRCGetAudioPauseTime((uint64_t)self->_afrc, &v31);
    double v30 = NAN;
    AFRCGetAudioMaxPauseTimes((uint64_t)self->_afrc, &v30);
    CFDictionaryAddValue(v13, @"APT", (const void *)[NSNumber numberWithDouble:v31]);
    CFDictionaryAddValue(v13, @"APSM", (const void *)[NSNumber numberWithDouble:v30]);
    CFDictionaryAddValue(v13, @"APS", (const void *)[NSNumber numberWithUnsignedInt:v32]);
    audioIssueDetector = (int *)self->_audioIssueDetector;
    if (audioIssueDetector)
    {
      *(_WORD *)buf = 0;
      VCAudioIssueDetector_GetReportingStats(audioIssueDetector, buf);
    }
    self->_unint64_t lastReportedRTPIngresspackets = v33;
    long long v18 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"streamIDsCount=%d ", self->_idsChannelDataFormat.numOfStreamIDs);
    if (self->_idsChannelDataFormat.numOfStreamIDs)
    {
      unint64_t v19 = 0;
      do
      {
        objc_msgSend(v18, "appendFormat:", @"StreamID%d=%d ", v19, self->_idsChannelDataFormat.streamIDs[v19]);
        ++v19;
      }
      while (v19 < self->_idsChannelDataFormat.numOfStreamIDs);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() > 5)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      __int16 v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v22) = self->_currentDuplication;
        unsigned int redNumPayloads = self->_redNumPayloads;
        unsigned int qualityIndex = self->_qualityIndex;
        double v25 = (double)v22 / 100.0;
        int v26 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] payload];
        unsigned int targetBitrate = self->_targetBitrate;
        unsigned int currentTargetBitrate = self->_currentTargetBitrate;
        BOOL supportsAdaptation = self->_supportsAdaptation;
        *(_DWORD *)buf = 136318722;
        uint64_t v35 = v20;
        __int16 v36 = 2080;
        __int16 v37 = "-[VCAudioTransmitter gatherRealtimeStats:]";
        __int16 v38 = 1024;
        int v39 = 651;
        __int16 v40 = 2048;
        __int16 v41 = self;
        __int16 v42 = 1024;
        *(_DWORD *)uint64_t v43 = v9;
        *(_WORD *)&v43[4] = 2048;
        *(double *)&v43[6] = v25;
        *(_WORD *)&v43[14] = 1024;
        *(_DWORD *)&v43[16] = v10;
        __int16 v44 = 1024;
        unsigned int v45 = redNumPayloads;
        __int16 v46 = 1024;
        unsigned int v47 = qualityIndex;
        __int16 v48 = 1024;
        int v49 = v26;
        __int16 v50 = 1024;
        unsigned int v51 = v32;
        __int16 v52 = 2112;
        v53 = v18;
        __int16 v54 = 1024;
        unsigned int v55 = targetBitrate;
        __int16 v56 = 1024;
        unsigned int v57 = currentTargetBitrate;
        __int16 v58 = 1024;
        BOOL v59 = supportsAdaptation;
        _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: VCAudioTransmitter [%p] audioTxBitrate=%ukbps, audioFecTx=%f, primaryAudioTxRate=%ukbps, audioStreamRedundancyLevel=%u, _qualityIndex=%u, payload=%u, totalPacketsSent=%d %@ _targetBitrate=%u _currentTargetBitrate=%u _supportsAdaptation=%d", buf, 0x70u);
      }
    }
  }
}

- (void)registerReportingTask
{
}

uint64_t __43__VCAudioTransmitter_registerReportingTask__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 periodicReportingEnabled];
  if (result)
  {
    return [a2 gatherRealtimeStats:a3];
  }
  return result;
}

- (void)reportRedundancyConfigChange
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate redundancy delay value", v2, v3, v4, v5, v6);
}

- (NSDictionary)dtxMetrics
{
  v8[5] = *MEMORY[0x1E4F143B8];
  if (!self->_currentDTXPayload) {
    return 0;
  }
  unsigned int audioFrameCounter = self->_audioFrameCounter;
  if (audioFrameCounter) {
    float v4 = (float)self->_silenceFrameCounter / (float)audioFrameCounter;
  }
  else {
    float v4 = 0.0;
  }
  v7[0] = @"DtxFramesTotal";
  v8[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  v7[1] = @"DtxFrameSilent";
  v8[1] = [NSNumber numberWithUnsignedInt:self->_silenceFrameCounter];
  v7[2] = @"DtxCompRatio";
  *(float *)&double v6 = v4;
  v8[2] = [NSNumber numberWithFloat:v6];
  v7[3] = @"TxBytesActual";
  v8[3] = [NSNumber numberWithUnsignedInt:self->_totalTxAudioBytes];
  v7[4] = @"TxBytesEstimate";
  v8[4] = [NSNumber numberWithUnsignedInt:self->_estimateTxAudioBytes];
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
}

- (float)nextAudioInterval:(int)a3
{
  unsigned int v5 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] samplesPerFrame];
  signed int v6 = [(VCPacketBundler *)self->_audioBundler packetsPerBundle] * v5 - a3;
  if (v6 < 1) {
    return 0.0;
  }
  else {
    return self->_blockSeconds * (float)(int)ceilf((float)v6 / (float)self->_inputFormat.samplesPerFrame);
  }
}

- (void)removeUnusedAudioPayloads
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v4 = [(VCAudioTierPicker *)self->_audioTierPicker allPayloadsFromAllTierTables];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v51 objects:v50 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v52;
    *(void *)&long long v6 = 136316930;
    long long v29 = v6;
    id v30 = v3;
    id v31 = v4;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v51 + 1) + 8 * v9);
        uint64_t v11 = _VCAudioTransmitter_UsedAudioPayloadForType((uint64_t)self, objc_msgSend(v10, "unsignedIntValue", v29));
        if (v11)
        {
          [v3 addObject:v11];
          goto LABEL_8;
        }
        if ((VCAudioTransmitter *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v22 = VRTraceErrorLogLevelToCSTR();
            __int16 v23 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v33 = [v10 unsignedIntValue];
              audioTierPicker = self->_audioTierPicker;
              uint64_t v25 = objc_msgSend(-[VCAudioTierPicker allPayloadsFromAllTierTables](audioTierPicker, "allPayloadsFromAllTierTables"), "count");
              audioPayloads = self->_audioPayloads;
              uint64_t v27 = [(NSMutableArray *)audioPayloads count];
              *(_DWORD *)buf = v29;
              uint64_t v35 = v22;
              __int16 v36 = 2080;
              __int16 v37 = "-[VCAudioTransmitter removeUnusedAudioPayloads]";
              __int16 v38 = 1024;
              int v39 = 765;
              __int16 v40 = 1024;
              *(_DWORD *)__int16 v41 = v33;
              *(_WORD *)&v41[4] = 2048;
              *(void *)&v41[6] = audioTierPicker;
              *(_WORD *)&v41[14] = 2048;
              *(void *)&v41[16] = v25;
              id v4 = v31;
              __int16 v42 = 2048;
              uint64_t v43 = audioPayloads;
              __int16 v44 = 2048;
              uint64_t v45 = v27;
              unint64_t v19 = v23;
              uint64_t v20 = " [%s] %s:%d payload=%u from _audioTierPicker=%p (count=%lu) was not found in the audio transmitter's"
                    " _audioPayloads=%p (count=%lu)";
              uint32_t v21 = 74;
              goto LABEL_19;
            }
          }
        }
        else
        {
          unint64_t v12 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            unint64_t v12 = (__CFString *)[(VCAudioTransmitter *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v13 = VRTraceErrorLogLevelToCSTR();
            unint64_t v14 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v32 = [v10 unsignedIntValue];
              int v15 = self->_audioTierPicker;
              uint64_t v16 = objc_msgSend(-[VCAudioTierPicker allPayloadsFromAllTierTables](v15, "allPayloadsFromAllTierTables"), "count");
              long long v17 = self->_audioPayloads;
              uint64_t v18 = [(NSMutableArray *)v17 count];
              *(_DWORD *)buf = 136317442;
              uint64_t v35 = v13;
              __int16 v36 = 2080;
              __int16 v37 = "-[VCAudioTransmitter removeUnusedAudioPayloads]";
              __int16 v38 = 1024;
              int v39 = 765;
              __int16 v40 = 2112;
              *(void *)__int16 v41 = v12;
              *(_WORD *)&v41[8] = 2048;
              *(void *)&v41[10] = self;
              *(_WORD *)&v41[18] = 1024;
              *(_DWORD *)&v41[20] = v32;
              __int16 v42 = 2048;
              uint64_t v43 = v15;
              __int16 v44 = 2048;
              uint64_t v45 = v16;
              __int16 v46 = 2048;
              unsigned int v47 = v17;
              id v3 = v30;
              id v4 = v31;
              __int16 v48 = 2048;
              uint64_t v49 = v18;
              unint64_t v19 = v14;
              uint64_t v20 = " [%s] %s:%d %@(%p) payload=%u from _audioTierPicker=%p (count=%lu) was not found in the audio transm"
                    "itter's _audioPayloads=%p (count=%lu)";
              uint32_t v21 = 94;
LABEL_19:
              _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
            }
          }
        }
LABEL_8:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v28 = [v4 countByEnumeratingWithState:&v51 objects:v50 count:16];
      uint64_t v7 = v28;
    }
    while (v28);
  }
  if (self->_currentDTXPayload) {
    objc_msgSend(v3, "addObject:");
  }
  [(NSMutableArray *)self->_audioPayloads removeAllObjects];
  -[NSMutableArray addObjectsFromArray:](self->_audioPayloads, "addObjectsFromArray:", [v3 allObjects]);
}

- (BOOL)setupAudioEncoders
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_supportsAdaptation) {
    [(VCAudioTransmitter *)self removeUnusedAudioPayloads];
  }
  int v3 = [(NSMutableArray *)self->_audioPayloads count];
  size_t v4 = 4 * v3;
  uint64_t v5 = (v4 + 15) & 0x7FFFFFFF0;
  long long v6 = &v15[-v5];
  if (v3) {
    memset(&v15[-v5], 170, v4);
  }
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
      *(_DWORD *)&v6[4 * i] = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_audioPayloads, "objectAtIndex:", i), "config"), "payload");
  }
  RTPSetTxPayloadList((uint64_t)self->_rtpHandle, v3, v6);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  audioPayloads = self->_audioPayloads;
  uint64_t v9 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(audioPayloads);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * j);
        [v13 setRamStadSRCEnabled:self->_ramStadSRCEnabled];
        [v13 createEncoderWithInputFormat:&self->_inputFormat];
        [v13 setCurrentDTXEnable:self->_currentDTXEnable];
      }
      uint64_t v10 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v10);
  }
  return 1;
}

- (BOOL)allocateLastInputSampleBuffer:(unsigned int)a3
{
  size_t v3 = self->_inputFormat.format.mBytesPerFrame * a3;
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      LODWORD(v5) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v5) {
        return (char)v5;
      }
      -[VCAudioTransmitter allocateLastInputSampleBuffer:]();
    }
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  if (self->_lastInputSampleBuffer && v3 <= self->_lastInputSampleBufferSize)
  {
LABEL_13:
    LOBYTE(v5) = 1;
    return (char)v5;
  }
  uint64_t v5 = (char *)malloc_type_calloc(1uLL, v3, 0x21A16158uLL);
  if (v5)
  {
    long long v6 = v5;
    lastInputSampleBuffer = self->_lastInputSampleBuffer;
    if (lastInputSampleBuffer)
    {
      memcpy(&v5[(v3 - self->_lastInputSampleBufferSize)], lastInputSampleBuffer, self->_lastInputSampleBufferSize);
      uint64_t v8 = self->_lastInputSampleBuffer;
    }
    else
    {
      uint64_t v8 = 0;
    }
    free(v8);
    self->_lastInputSampleBuffer = v6;
    self->_lastInputSampleBufferSize = v3;
    goto LABEL_13;
  }
  return (char)v5;
}

- (unsigned)maximumSamplesPerFrame
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  audioPayloads = self->_audioPayloads;
  uint64_t v3 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(audioPayloads);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v5 < objc_msgSend((id)objc_msgSend(v8, "config"), "samplesPerFrame")) {
          unint64_t v5 = objc_msgSend((id)objc_msgSend(v8, "config"), "samplesPerFrame");
        }
      }
      uint64_t v4 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v4);
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return v5;
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
}

- (void)setCurrentDTXEnable:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_currentDTXEnable = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  audioPayloads = self->_audioPayloads;
  uint64_t v5 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(audioPayloads);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) setCurrentDTXEnable:self->_currentDTXEnable];
      }
      uint64_t v6 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (void)currentPayloadUsed:(int)a3 payloadUsed:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    audioPayloads = self->_audioPayloads;
    uint64_t v7 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(audioPayloads);
          }
          long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v11, "config"), "samplesPerFrame") == a3)
          {
            *a4 = v11;
            return;
          }
        }
        uint64_t v8 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v13 objects:v12 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
}

- (BOOL)chooseAudioNetworkBitrate
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  if (!self->_supportsAdaptation) {
    return 1;
  }
  unsigned int rateChangeCounter = self->_rateChangeCounter;
  unsigned int targetBitrate = self->_targetBitrate;
  unsigned int v82 = rateChangeCounter;
  BOOL isAudioStalled = self->_isAudioStalled;
  int v81 = 0;
  uint64_t v80 = 0;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  if (self->_statisticsCollector)
  {
LABEL_5:
    unsigned int redundancyPercentage = self->_redundancyPercentage;
    unsigned int v6 = redundancyPercentage / 0x64;
    unsigned int v7 = (self->_redundancyInterval / 20.0);
    BOOL v8 = redundancyPercentage / 0x64 != self->_redundancyControllerNumPayloads
      || self->_redundancyControllerMaxDelay20ms != v7;
    if (v81) {
      RTPResetConnectionStats();
    }
    int operatingMode = self->_operatingMode;
    if (operatingMode == 7 || operatingMode == 2) {
      RTPUpdateAudioOnlyRateChange((uint64_t)self->_rtpHandle, v82);
    }
    double v11 = micro();
    if (self->_isLocalCellular_LowestConnectionQuality && v11 - self->_lastUpdateQualityIndicator > 5.0)
    {
      self->_lastUpdateQualityIndicator = v11;
      global_queue = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__VCAudioTransmitter_chooseAudioNetworkBitrate__block_invoke;
      block[3] = &unk_1E6DB3DC8;
      block[4] = self;
      dispatch_async(global_queue, block);
    }
    if (isAudioStalled != self->_lastAudioStalled)
    {
      if (self->_isLocalCellular_LowestConnectionQuality)
      {
        RTPSetCellularAudioStallState((uint64_t)self->_rtpVideo, isAudioStalled);
        RTPSetCellularAudioStallState((uint64_t)self->_rtpHandle, isAudioStalled);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        long long v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          BOOL lastAudioStalled = self->_lastAudioStalled;
          BOOL isConnectedOnIPv6_LowestConnectionQuality = self->_isConnectedOnIPv6_LowestConnectionQuality;
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = v13;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAudioTransmitter chooseAudioNetworkBitrate]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 1133;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = lastAudioStalled;
          *(_WORD *)&buf[34] = 1024;
          *(_DWORD *)&buf[36] = isAudioStalled;
          *(_WORD *)&buf[40] = 1024;
          *(_DWORD *)&buf[42] = isConnectedOnIPv6_LowestConnectionQuality;
          _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d UNEXPECTED: audio stall change (%d -> %d) while not in cellular(IPv6 :%d)", buf, 0x2Eu);
        }
      }
      self->_BOOL lastAudioStalled = isAudioStalled;
    }
    BOOL isAudioStalled = 0;
    if (self->_audioTierChangeRequestCount >= 1)
    {
      [(VCAudioTransmitter *)self setupAudioHeaderSize];
      [(VCAudioTransmitter *)self setupAudioTierPicker];
      atomic_fetch_add(&self->_audioTierChangeRequestCount, 0xFFFFFFFF);
    }
    unsigned int v15 = redundancyPercentage + 100;
    if (targetBitrate == self->_currentTargetBitrate)
    {
      BOOL v16 = v15 != self->_currentDuplication || v8;
      if (!v16 && !self->_audioTierHysteresis) {
        return !isAudioStalled;
      }
    }
    self->_unsigned int currentTargetBitrate = targetBitrate;
    if (self->_isRedEnabled)
    {
      audioTierPicker = self->_audioTierPicker;
      if (self->_targetBitrateIsAudioOnly) {
        uint64_t v18 = -[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:](audioTierPicker, "tierForAudioBitrate:withRedNumPayloads:");
      }
      else {
        uint64_t v18 = -[VCAudioTierPicker tierForNetworkBitrate:withRedNumPayloads:](audioTierPicker, "tierForNetworkBitrate:withRedNumPayloads:");
      }
      long long v19 = (VCAudioTier *)v18;
      unsigned int v21 = [(VCAudioTier *)self->_currentAudioTier redNumPayloads];
      BOOL v20 = v21 != [(VCAudioTier *)v19 redNumPayloads];
    }
    else
    {
      long long v19 = -[VCAudioTierPicker tierForNetworkBitrate:withLegacyDuplication:](self->_audioTierPicker, "tierForNetworkBitrate:withLegacyDuplication:");
      BOOL v20 = 0;
    }
    if (([(VCAudioPayloadConfig *)[(VCAudioTier *)v19 payloadConfig] isEqual:[(VCAudioPayload *)self->_currentAudioPayload config]] & 1) != 0|| (v15 != self->_currentDuplication ? (char v22 = 1) : (char v22 = v8), (v22 & 1) != 0|| (v23 = [(VCAudioTier *)v19 audioCodecBitrate], v23 == [(VCAudioPayload *)self->_currentAudioPayload bitrate])|| ([(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] qualityForBitRate:[(VCAudioTier *)v19 audioCodecBitrate]], v24 <= 0.5)))
    {
      if (([(VCAudioPayloadConfig *)[(VCAudioTier *)v19 payloadConfig] isEqual:[(VCAudioPayload *)self->_currentAudioPayload config]] & 1) == 0)
      {
        unsigned int v29 = [(VCAudioTier *)v19 audioCodecBitrate];
        if (v29 > [(VCAudioPayload *)self->_currentAudioPayload bitrate]
          && v15 <= self->_currentDuplication
          && v6 <= self->_redNumPayloads
          && self->_lastTierSwitch != 0.0
          && micro() - self->_lastTierSwitch < 2.0)
        {
          if (!self->_audioTierHysteresis)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v30 = VRTraceErrorLogLevelToCSTR();
              id v31 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                int v32 = [(VCAudioPayloadConfig *)[(VCAudioTier *)self->_currentAudioTier payloadConfig] payload];
                int v33 = [(VCAudioPayloadConfig *)[(VCAudioTier *)v19 payloadConfig] payload];
                double lastTierSwitch = self->_lastTierSwitch;
                *(_DWORD *)buf = 136316418;
                *(void *)&uint8_t buf[4] = v30;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "-[VCAudioTransmitter chooseAudioNetworkBitrate]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 1192;
                *(_WORD *)&buf[28] = 1024;
                *(_DWORD *)&buf[30] = v32;
                *(_WORD *)&buf[34] = 1024;
                *(_DWORD *)&buf[36] = v33;
                *(_WORD *)&buf[40] = 2048;
                *(double *)&buf[42] = lastTierSwitch;
                _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Time Hysteresis preventing tier upgrade from %d to %d, last upgrade at %6.3f", buf, 0x32u);
              }
            }
            self->_audioTierHysteresis = 1;
          }
          return !isAudioStalled;
        }
      }
      if (v19 == self->_currentAudioTier
        || (unsigned int v35 = [(VCAudioTier *)v19 audioCodecBitrate],
            v35 == [(VCAudioPayload *)self->_currentAudioPayload bitrate])
        && (v15 != self->_currentDuplication ? (char v36 = 1) : (char v36 = v8),
            (v36 & 1) == 0
         && ((unsigned int v37 = [(VCAudioTier *)self->_currentAudioTier packetsPerBundle],
              v37 != [(VCAudioTier *)v19 packetsPerBundle])
           ? (int v38 = 1)
           : (int v38 = v20),
             v38 != 1)))
      {
        int v56 = v15 != self->_currentDuplication || v8;
        if (v56 == 1)
        {
          self->_currentDuplication = v15;
          self->_redundancyControllerNumPayloads = v6;
          self->_unsigned int redundancyControllerMaxDelay20ms = v7;
          if (self->_isRedEnabled
            && [(VCAudioTier *)v19 redNumPayloads] != v6
            && (int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v57 = VRTraceErrorLogLevelToCSTR();
            __int16 v58 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v59 = [(VCAudioTier *)v19 redNumPayloads];
              *(_DWORD *)buf = 136316162;
              *(void *)&uint8_t buf[4] = v57;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[VCAudioTransmitter chooseAudioNetworkBitrate]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 1237;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = v6;
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = v59;
              _os_log_impl(&dword_1E1EA4000, v58, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Overriding suggested red value %d with red value %u", buf, 0x28u);
            }
          }
          unsigned int v60 = [(VCAudioTier *)v19 redMaxDelay20ms];
          unsigned int redundancyControllerMaxDelay20ms = self->_redundancyControllerMaxDelay20ms;
          if (v60 > redundancyControllerMaxDelay20ms) {
            unsigned int redundancyControllerMaxDelay20ms = v60;
          }
          unsigned int redMaxDelay20ms = self->_redMaxDelay20ms;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&self->_redMaxDelay20ms, &redMaxDelay20ms, redundancyControllerMaxDelay20ms, memory_order_relaxed, memory_order_relaxed);
          [(VCAudioTransmitter *)self setRedNumPayloads:[(VCAudioTier *)self->_currentAudioTier redNumPayloads] withMaxDelay:self->_redMaxDelay20ms shouldResetHistory:0 shouldEnableShortRED:[(VCAudioTier *)self->_currentAudioTier shortREDEnabled]];
        }
        else
        {
          self->_audioTierHysteresis = 0;
        }
        return !isAudioStalled;
      }
      if (v19 != self->_requestedAudioTier
        || (self->_currentDuplication != v15 ? (int v39 = 1) : (int v39 = v8), (v39 | v20) == 1))
      {
        self->_requestedAudioTier = v19;
        self->_currentDuplication = v15;
        self->_redundancyControllerNumPayloads = v6;
        self->_unsigned int redundancyControllerMaxDelay20ms = v7;
        unsigned int redNumPayloads = self->_redNumPayloads;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&self->_redNumPayloads, &redNumPayloads, [(VCAudioTier *)v19 redNumPayloads], memory_order_relaxed, memory_order_relaxed);
        unsigned int v41 = [(VCAudioTier *)v19 redMaxDelay20ms];
        unsigned int v42 = self->_redundancyControllerMaxDelay20ms;
        if (v41 > v42) {
          unsigned int v42 = v41;
        }
        unsigned int v43 = self->_redMaxDelay20ms;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&self->_redMaxDelay20ms, &v43, v42, memory_order_relaxed, memory_order_relaxed);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v44 = VRTraceErrorLogLevelToCSTR();
          uint64_t v45 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v66 = [(VCAudioPayloadConfig *)[(VCAudioTier *)self->_currentAudioTier payloadConfig] payload];
            int v46 = [(VCAudioPayloadConfig *)[(VCAudioTier *)v19 payloadConfig] payload];
            unsigned int v65 = targetBitrate;
            unsigned int v47 = [(VCAudioTier *)self->_currentAudioTier networkBitrate];
            unsigned int v48 = [(VCAudioTier *)v19 networkBitrate];
            unsigned int v49 = [(VCAudioTier *)self->_currentAudioTier packetsPerBundle];
            unsigned int v50 = [(VCAudioTier *)v19 packetsPerBundle];
            *(_DWORD *)buf = 136317442;
            *(void *)&uint8_t buf[4] = v44;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCAudioTransmitter chooseAudioNetworkBitrate]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 1215;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v66;
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = v46;
            *(_WORD *)&buf[40] = 1024;
            *(_DWORD *)&buf[42] = v65;
            *(_WORD *)&buf[46] = 1024;
            *(_DWORD *)&buf[48] = v47;
            *(_WORD *)&buf[52] = 1024;
            *(_DWORD *)&buf[54] = v48;
            *(_WORD *)&buf[58] = 1024;
            *(_DWORD *)&buf[60] = v49;
            LOWORD(v86) = 1024;
            *(_DWORD *)((char *)&v86 + 2) = v50;
            _os_log_impl(&dword_1E1EA4000, v45, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Switching audio bitrate tier payload %d -> %d for total tx %d: netBitrate %d -> %d, bundle %d -> %d", buf, 0x46u);
          }
        }
        if (self->_isRedEnabled
          && [(VCAudioTier *)v19 redNumPayloads] != v6
          && (int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v51 = VRTraceErrorLogLevelToCSTR();
          long long v52 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v53 = [(VCAudioTier *)v19 redNumPayloads];
            *(_DWORD *)buf = 136316162;
            *(void *)&uint8_t buf[4] = v51;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCAudioTransmitter chooseAudioNetworkBitrate]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 1217;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v6;
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = v53;
            _os_log_impl(&dword_1E1EA4000, v52, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Overriding suggested red value %d with red value %u", buf, 0x28u);
          }
        }
        unsigned int v54 = [(VCAudioTier *)v19 redPayloadSize];
        BOOL v55 = v54 < [(VCAudioTier *)self->_currentAudioTier redPayloadSize];
        [(VCAudioTransmitter *)self useAudioTier:v19];
        [(VCAudioTransmitter *)self setRedNumPayloads:self->_redNumPayloads withMaxDelay:self->_redMaxDelay20ms shouldResetHistory:v55 shouldEnableShortRED:[(VCAudioTier *)v19 shortREDEnabled]];
        [(VCAudioTransmitter *)self reportRedundancyConfigChange];
        goto LABEL_87;
      }
    }
    else if (v19 != self->_requestedAudioTier)
    {
      self->_requestedAudioTier = v19;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        int v26 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v27 = [(VCAudioPayload *)self->_currentAudioPayload bitrate];
          unsigned int v28 = [(VCAudioTier *)v19 audioCodecBitrate];
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = v25;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAudioTransmitter chooseAudioNetworkBitrate]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 1177;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v27;
          *(_WORD *)&buf[34] = 1024;
          *(_DWORD *)&buf[36] = v28;
          _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Switching audio bitrates without changing tier %d -> %d", buf, 0x28u);
        }
      }
      [(VCAudioTransmitter *)self useAudioPayload:self->_currentAudioPayload withBitrate:[(VCAudioTier *)v19 audioCodecBitrate] redNumPayloads:[(VCAudioTier *)v19 redNumPayloads]];
      [(VCAudioTransmitter *)self updateAudioTxBitrate];
LABEL_87:
      self->_double lastTierSwitch = micro();
      self->_audioTierHysteresis = 0;
      [(VCAudioTransmitter *)self logTierInfo:1];
    }
    return !isAudioStalled;
  }
  if ((AFRCGetAudioTxInfo((uint64_t)self->_afrc, &targetBitrate, 0, 0, 0, 0, &isAudioStalled, &v82, &v81, (uint64_t)&v68) & 0x80000000) == 0)
  {
    redundancyController = self->_redundancyController;
    long long v92 = v78;
    long long v93 = v79;
    uint64_t v94 = v80;
    long long v88 = v74;
    long long v89 = v75;
    long long v90 = v76;
    long long v91 = v77;
    *(_OWORD *)&buf[32] = v70;
    *(_OWORD *)&buf[48] = v71;
    long long v86 = v72;
    long long v87 = v73;
    *(_OWORD *)buf = v68;
    *(_OWORD *)&buf[16] = v69;
    [(VCRedundancyControllerAudio *)redundancyController updateRedundancyStrategyWithNetworkStatistics:buf];
    goto LABEL_5;
  }
  return 0;
}

uint64_t __47__VCAudioTransmitter_chooseAudioNetworkBitrate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 248))
  {
    AFRCGetQualityIndication(*(void *)(v1 + 296), (_DWORD *)(v1 + 128));
    uint64_t v1 = *(void *)(a1 + 32);
  }
  uint64_t v3 = *(void **)(v1 + 448);
  uint64_t v4 = *(unsigned int *)(v1 + 128);
  uint64_t v5 = *(unsigned __int8 *)(v1 + 335);

  return [v3 updateQualityIndicator:v4 isIPv6:v5];
}

- (void)setupAudioHeaderSize
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  self->_int audioHeaderSize = 0;
  if (self->_useChannelDataFormat)
  {
    uint64_t v17 = 0;
    BOOL BoolValueForKey = VCDefaults_GetBoolValueForKey(@"disableDynamicMediaPacketHeaderCalculations", 0);
    unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
    LODWORD(v16) = VCMediaControlInfoGeneratorGetType(self->_controlInfoGenerator);
    BYTE4(v16) = VCMediaControlInfoGeneratorGetVersion(self->_controlInfoGenerator);
    int v4 = VCFramingOverheadCalculationUtils_PerPacketMediaFramingOverheadWithRTPHandle((uint64_t)self->_rtpHandle, (unsigned int *)&v16, &v17);
    if (v4 < 0)
    {
      int v11 = v4;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          rtpHandle = self->_rtpHandle;
          *(_DWORD *)buf = 136316674;
          uint64_t v19 = v12;
          __int16 v20 = 2080;
          unsigned int v21 = "-[VCAudioTransmitter setupAudioHeaderSize]";
          __int16 v22 = 1024;
          int v23 = 1384;
          __int16 v24 = 1024;
          int v25 = v11;
          __int16 v26 = 2048;
          uint64_t v27 = (uint64_t)rtpHandle;
          __int16 v28 = 1024;
          int v29 = v16;
          __int16 v30 = 1024;
          int v31 = BYTE4(v16);
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to get media framing overhead. result=0x%08x rtpHandle=%p mediaControlInfoGeneratorType=%u version=%u", buf, 0x38u);
        }
      }
    }
    else
    {
      self->_int audioHeaderSize = self->_constantTransportOverhead + v17;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        unsigned int v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int audioHeaderSize = self->_audioHeaderSize;
          unsigned int constantTransportOverhead = self->_constantTransportOverhead;
          *(_DWORD *)buf = 136316418;
          uint64_t v19 = v5;
          __int16 v20 = 2080;
          unsigned int v21 = "-[VCAudioTransmitter setupAudioHeaderSize]";
          __int16 v22 = 1024;
          int v23 = 1387;
          __int16 v24 = 1024;
          int v25 = audioHeaderSize;
          __int16 v26 = 2048;
          uint64_t v27 = v17;
          __int16 v28 = 1024;
          int v29 = constantTransportOverhead;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio header size=%d, framingOverhead=%lu, _constantTransportOverhead=%u", buf, 0x32u);
        }
      }
      if (!BoolValueForKey)
      {
        unsigned int v9 = self->_audioHeaderSize;
LABEL_14:
        unsigned int v15 = self->_constantTransportOverhead;
        goto LABEL_20;
      }
    }
    unsigned int v9 = +[VCConnectionIDS worstCaseNetworkOverheadInBytesWithNumOfStreamId:isPriorityIncluded:](VCConnectionIDS, "worstCaseNetworkOverheadInBytesWithNumOfStreamId:isPriorityIncluded:", self->_maxIDSStreamIdCount, 1, v16)+ 12;
    self->_int audioHeaderSize = v9;
    goto LABEL_14;
  }
  if (self->_isUseCaseWatchContinuity)
  {
    int v10 = 0;
  }
  else if (self->_isConnectedOnIPv6_LowestConnectionQuality)
  {
    int v10 = 40;
  }
  else
  {
    int v10 = 20;
  }
  unsigned int v15 = v10 + 8;
  unsigned int v9 = v10 + 20;
  self->_int audioHeaderSize = v9;
  if (self->_useRateControl)
  {
    unsigned int v9 = VCMediaControlInfoGeneratorGetFeedbackSize(self->_controlInfoGenerator, a2) + self->_audioHeaderSize + 10;
    self->_int audioHeaderSize = v9;
  }
LABEL_20:
  -[VCAudioRedBuilder setMaxREDPayloadSize:](self->_redBuilder, "setMaxREDPayloadSize:", self->_maxAudioPacketSize + v15 - v9, v16);
}

- (id)packetsPerBundle
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [+[VCDefaults sharedInstance] forceAudioPacketsPerBundle];
  if (v3)
  {
    v16[0] = [NSNumber numberWithInt:v3];
    return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }
  else if (self->_isUseCaseWatchContinuity)
  {
    return &unk_1F3DC88C8;
  }
  else if (self->_operatingMode == 6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    audioPayloads = self->_audioPayloads;
    uint64_t v6 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v12 objects:v11 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      int v4 = &unk_1F3DC88E0;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(audioPayloads);
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "config"), "payload") == 101) {
            return &unk_1F3DC88F8;
          }
        }
        uint64_t v7 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v12 objects:v11 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      return &unk_1F3DC88E0;
    }
  }
  else
  {
    return &unk_1F3DC8910;
  }
  return v4;
}

- (BOOL)setupAudioTierPicker
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!self->_supportsAdaptation) {
    return 1;
  }
  id v24 = [(VCAudioTransmitter *)self packetsPerBundle];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_audioPayloads, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  audioPayloads = self->_audioPayloads;
  uint64_t v5 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(audioPayloads);
        }
        objc_msgSend(v3, "setObject:atIndexedSubscript:", objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "config"), objc_msgSend(v3, "count"));
      }
      uint64_t v6 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v35 objects:v34 count:16];
    }
    while (v6);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int operatingMode = self->_operatingMode;
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioTransmitter setupAudioTierPicker]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)__int16 v26 = 1450;
      *(_WORD *)&v26[4] = 1024;
      *(_DWORD *)&v26[6] = operatingMode;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Tier Table for Operating Mode %d", buf, 0x22u);
    }
  }
  unsigned int currentAudioCap = self->_currentAudioCap;
  self->_currentAudioTier = 0;
  unsigned __int8 tierPickerMode = self->_tierPickerMode;
  supportedNumRedundantPayload = self->_supportedNumRedundantPayload;
  int audioHeaderSize = self->_audioHeaderSize;
  BOOL v15 = !self->_useWiFiTiers;
  BOOL isUseCaseWatchContinuity = self->_isUseCaseWatchContinuity;
  if (self->_operatingMode == 6) {
    unsigned int currentAudioCap = self->_tierNetworkBitrate;
  }
  __int16 v17 = *(_WORD *)&self->_alwaysOnAudioRedundancyEnabled;
  BOOL wifiAllowRedLowBitratesEnabled = self->_wifiAllowRedLowBitratesEnabled;
  BOOL v19 = !self->_isConnectedOnIPv6_LowestConnectionQuality;

  __int16 v20 = [VCAudioTierPicker alloc];
  buf[0] = tierPickerMode;
  *(_DWORD *)&buf[1] = 0;
  *(_DWORD *)&uint8_t buf[4] = 0;
  *(void *)&buf[8] = v3;
  *(void *)&buf[16] = v24;
  *(void *)__int16 v26 = supportedNumRedundantPayload;
  *(_DWORD *)&v26[8] = audioHeaderSize;
  BOOL v27 = v15;
  BOOL v28 = isUseCaseWatchContinuity;
  __int16 v29 = 0;
  unsigned int v30 = currentAudioCap;
  __int16 v31 = v17;
  BOOL v32 = wifiAllowRedLowBitratesEnabled;
  BOOL v33 = v19;
  unsigned int v21 = [(VCAudioTierPicker *)v20 initWithConfig:buf];
  self->_audioTierPicker = v21;
  [(VCAudioTransmitter *)self useAudioTier:[(VCAudioTierPicker *)v21 defaultTier]];
  if (self->_statisticsCollector) {
    self->_currentDuplication = self->_redundancyPercentage + 100;
  }
  else {
    AFRCGetAudioTxInfo((uint64_t)self->_afrc, 0, (int *)&self->_currentDuplication, 0, 0, 0, 0, 0, 0, 0);
  }
  [(VCAudioTransmitter *)self updateAudioTxBitrate];
  return self->_audioTierPicker != 0;
}

- (void)updateAudioTxBitrate
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  int audioTxBitrate = self->_audioTxBitrate;
  int v4 = [(VCAudioPayload *)self->_currentAudioPayload config];
  double v5 = (double)(8 * self->_audioHeaderSize);
  double mSampleRate = self->_inputFormat.format.mSampleRate;
  int v7 = (int)(mSampleRate / (double)[(VCAudioPayloadConfig *)v4 samplesPerFrame] * v5);
  p_info = VCMediaControlInfo.info;
  if (+[VCPayloadUtils canBundleExternallyForPayload:[(VCAudioPayloadConfig *)v4 payload] forBundlingScheme:[(VCPacketBundler *)self->_audioBundler bundlingScheme] operatingMode:self->_operatingMode])
  {
    int v9 = (int)((double)v7 / (double)[(VCPacketBundler *)self->_audioBundler packetsPerBundle]);
    double v10 = (double)(8 * [(VCAudioPayloadConfig *)v4 bundleHeaderBytes]);
    double v11 = self->_inputFormat.format.mSampleRate;
    int v7 = (int)((double)v9 + v10 * (v11 / (double)[(VCAudioPayloadConfig *)v4 samplesPerFrame]));
  }
  self->_int audioTxBitrate = [(VCAudioPayload *)self->_currentAudioPayload bitrate] + v7;
  if ((VCAudioTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      long long v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v41 = self->_audioTxBitrate;
        unsigned int v15 = [(VCAudioPayload *)self->_currentAudioPayload bitrate];
        int audioHeaderSize = self->_audioHeaderSize;
        unsigned int v16 = [(VCPacketBundler *)self->_audioBundler packetsPerBundle];
        unsigned int v17 = [(VCAudioPayloadConfig *)v4 bundleHeaderBytes];
        int v18 = (int)self->_inputFormat.format.mSampleRate;
        unsigned int v19 = [(VCAudioPayloadConfig *)v4 samplesPerFrame];
        int operatingMode = self->_operatingMode;
        *(_DWORD *)buf = 136317954;
        uint64_t v44 = v13;
        __int16 v45 = 2080;
        int v46 = "-[VCAudioTransmitter updateAudioTxBitrate]";
        __int16 v47 = 1024;
        int v48 = 1505;
        __int16 v49 = 1024;
        *(_DWORD *)unsigned int v50 = v41;
        *(_WORD *)&v50[4] = 1024;
        *(_DWORD *)&v50[6] = v15;
        LOWORD(v51) = 1024;
        *(_DWORD *)((char *)&v51 + 2) = v7;
        HIWORD(v51) = 1024;
        *(_DWORD *)long long v52 = audioHeaderSize;
        *(_WORD *)&v52[4] = 1024;
        *(_DWORD *)unsigned int v53 = v16;
        p_info = (__objc2_class_ro **)(VCMediaControlInfo + 32);
        *(_WORD *)&v53[4] = 1024;
        *(_DWORD *)unsigned int v54 = v17;
        *(_WORD *)&v54[4] = 1024;
        *(_DWORD *)BOOL v55 = v18;
        *(_WORD *)&v55[4] = 1024;
        *(_DWORD *)int v56 = v19;
        *(_WORD *)&v56[4] = 1024;
        *(_DWORD *)uint64_t v57 = operatingMode;
        unsigned int v21 = " [%s] %s:%d Setting audioTxBitrate to %d, %d audio + %d ((%d/%d+%d)*%d/%d) header for mode=%d";
        __int16 v22 = v14;
        uint32_t v23 = 82;
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v12 = (__CFString *)[(VCAudioTransmitter *)self performSelector:sel_logPrefix];
    }
    else {
      long long v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      int v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v42 = self->_audioTxBitrate;
        unsigned int v38 = [(VCAudioPayload *)self->_currentAudioPayload bitrate];
        int v40 = self->_audioHeaderSize;
        unsigned int v26 = [(VCPacketBundler *)self->_audioBundler packetsPerBundle];
        unsigned int v27 = [(VCAudioPayloadConfig *)v4 bundleHeaderBytes];
        int v28 = (int)self->_inputFormat.format.mSampleRate;
        unsigned int v29 = [(VCAudioPayloadConfig *)v4 samplesPerFrame];
        int v30 = self->_operatingMode;
        *(_DWORD *)buf = 136318466;
        uint64_t v44 = v24;
        __int16 v45 = 2080;
        int v46 = "-[VCAudioTransmitter updateAudioTxBitrate]";
        __int16 v47 = 1024;
        int v48 = 1505;
        __int16 v49 = 2112;
        *(void *)unsigned int v50 = v12;
        *(_WORD *)&v50[8] = 2048;
        uint64_t v51 = self;
        *(_WORD *)long long v52 = 1024;
        *(_DWORD *)&v52[2] = v42;
        *(_WORD *)unsigned int v53 = 1024;
        *(_DWORD *)&v53[2] = v38;
        *(_WORD *)unsigned int v54 = 1024;
        *(_DWORD *)&v54[2] = v7;
        *(_WORD *)BOOL v55 = 1024;
        *(_DWORD *)&v55[2] = v40;
        *(_WORD *)int v56 = 1024;
        *(_DWORD *)&v56[2] = v26;
        *(_WORD *)uint64_t v57 = 1024;
        *(_DWORD *)&v57[2] = v27;
        __int16 v58 = 1024;
        int v59 = v28;
        p_info = VCMediaControlInfo.info;
        __int16 v60 = 1024;
        unsigned int v61 = v29;
        __int16 v62 = 1024;
        int v63 = v30;
        unsigned int v21 = " [%s] %s:%d %@(%p) Setting audioTxBitrate to %d, %d audio + %d ((%d/%d+%d)*%d/%d) header for mode=%d";
        __int16 v22 = v25;
        uint32_t v23 = 102;
        goto LABEL_13;
      }
    }
  }
  if (self->_mediaQueue != (tagHANDLE *)0xFFFFFFFFLL)
  {
    double v31 = (double)[(VCAudioPayloadConfig *)v4 samplesPerFrame] / self->_inputFormat.format.mSampleRate;
    if (objc_msgSend(p_info + 416, "canBundleExternallyForPayload:forBundlingScheme:operatingMode:", -[VCAudioPayloadConfig payload](v4, "payload"), -[VCPacketBundler bundlingScheme](self->_audioBundler, "bundlingScheme"), self->_operatingMode))double v31 = v31 * (double)-[VCPacketBundler packetsPerBundle](self->_audioBundler, "packetsPerBundle"); {
    if (v31 != self->_audioInterval)
    }
    {
      MediaQueue_SetThrottlingAudioInterval(v31);
      self->_audioInterval = v31;
    }
  }
  int v32 = self->_audioTxBitrate;
  if (v32 != audioTxBitrate)
  {
    afrc = self->_afrc;
    if (afrc != (tagHANDLE *)0xFFFFFFFFLL) {
      AFRCSetAudioBitRate((uint64_t)afrc, v32);
    }
  }
  if (self->_isRedEnabled)
  {
    BOOL v34 = [(VCAudioPayload *)self->_currentAudioPayload shortREDEnabled];
    unsigned int v35 = [(VCAudioPayload *)self->_currentAudioPayload bitrate];
    if (v34) {
      unsigned int v36 = v35
    }
          + self->_redNumPayloads * [(VCAudioPayload *)self->_currentAudioPayload shortREDBitrate];
    else {
      unsigned int v36 = v35 + v35 * self->_redNumPayloads;
    }
    self->_actualAudioSendingBitrate = v36 + v7;
    unsigned int v37 = [(VCAudioPayload *)self->_currentAudioPayload bitrate];
  }
  else
  {
    unsigned int v37 = self->_audioTxBitrate;
    self->_actualAudioSendingBitrate = (self->_redundancyPercentage + 100) * v37 / 0x64;
  }
  self->_actualAudioSendingBitrateNoRED = v37;
}

- (void)useAudioPayload:(id)a3 withBitrate:(unsigned int)a4 redNumPayloads:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_allowAudioSwitching)
  {
    currentAudioPayload = self->_currentAudioPayload;
    if (currentAudioPayload != a3)
    {
      int v10 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)currentAudioPayload config] payload];
      if (VCPayloadUtils_SupportsShortREDForPayload())
      {
        objc_msgSend((id)objc_msgSend(a3, "config"), "payload");
        if ((VCPayloadUtils_SupportsShortREDForPayload() & 1) == 0) {
          [(VCAudioRedBuilder *)self->_redBuilder resetShortREDHistoryAndPrimaryPayloadHistory:0];
        }
      }
      self->_currentAudioPayload = (VCAudioPayload *)a3;
      [a3 resetEncoder];
      if ((VCAudioTransmitter *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_17;
        }
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        int v14 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] payload];
        unsigned int v15 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] samplesPerFrame];
        *(_DWORD *)uint32_t v23 = 136316418;
        *(void *)&v23[4] = v12;
        *(_WORD *)&v23[12] = 2080;
        *(void *)&v23[14] = "-[VCAudioTransmitter useAudioPayload:withBitrate:redNumPayloads:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 1545;
        WORD2(v24) = 1024;
        *(_DWORD *)((char *)&v24 + 6) = v10;
        WORD5(v24) = 1024;
        HIDWORD(v24) = v14;
        LOWORD(v25) = 1024;
        *(_DWORD *)((char *)&v25 + 2) = v15;
        unsigned int v16 = " [%s] %s:%d Switching payloads from payload=%d -> %d %d samplesPerFrame";
        unsigned int v17 = v13;
        uint32_t v18 = 46;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          double v11 = (__CFString *)[(VCAudioTransmitter *)self performSelector:sel_logPrefix];
        }
        else {
          double v11 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_17;
        }
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        __int16 v20 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        int v21 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] payload];
        unsigned int v22 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] samplesPerFrame];
        *(_DWORD *)uint32_t v23 = 136316930;
        *(void *)&v23[4] = v19;
        *(_WORD *)&v23[12] = 2080;
        *(void *)&v23[14] = "-[VCAudioTransmitter useAudioPayload:withBitrate:redNumPayloads:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 1545;
        WORD2(v24) = 2112;
        *(void *)((char *)&v24 + 6) = v11;
        HIWORD(v24) = 2048;
        int v25 = self;
        LOWORD(v26) = 1024;
        *(_DWORD *)((char *)&v26 + 2) = v10;
        HIWORD(v26) = 1024;
        LODWORD(v27) = v21;
        WORD2(v27) = 1024;
        *(_DWORD *)((char *)&v27 + 6) = v22;
        unsigned int v16 = " [%s] %s:%d %@(%p) Switching payloads from payload=%d -> %d %d samplesPerFrame";
        unsigned int v17 = v20;
        uint32_t v18 = 66;
      }
      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, v23, v18);
LABEL_17:
      AFRCSetAudioPayload((uint64_t)self->_afrc, [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->_currentAudioPayload config] payload], [(VCAudioPayload *)self->_currentAudioPayload bitrate]);
    }
  }
  [(VCAudioPayload *)self->_currentAudioPayload setShortREDEnabled:a5 != 0];
  if (!a5) {
    [(VCPacketBundler *)self->_audioBundlerShortRED resetBuffer];
  }
  [(VCAudioPayload *)self->_currentAudioPayload setBitrate:v6];
}

- (void)useAudioTier:(id)a3
{
  self->_currentAudioTier = (VCAudioTier *)a3;
  -[VCAudioTransmitter useAudioPayload:withBitrate:redNumPayloads:](self, "useAudioPayload:withBitrate:redNumPayloads:", _VCAudioTransmitter_UsedAudioPayloadForType((uint64_t)self, objc_msgSend((id)objc_msgSend(a3, "payloadConfig"), "payload")), objc_msgSend(a3, "audioCodecBitrate"), objc_msgSend(a3, "redNumPayloads"));
  -[VCPacketBundler setPacketsPerBundle:](self->_audioBundler, "setPacketsPerBundle:", [a3 packetsPerBundle]);
  -[VCPacketBundler setPacketsPerBundle:](self->_audioBundlerShortRED, "setPacketsPerBundle:", [a3 packetsPerBundle]);
  [(VCAudioTransmitter *)self updateAudioTxBitrate];
  atomic_fetch_add((atomic_uint *volatile)&self->_audioTierChangeCount, 1u);
}

- (void)start
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(VCAudioTransmitter *)self setPeriodicReportingEnabled:1];
  [(VCAudioTransmitter *)self registerReportingTask];
  if (self->_needsPacketThread)
  {
    uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __27__VCAudioTransmitter_start__block_invoke;
    v16[3] = &unk_1E6DB99B8;
    v16[4] = self;
    v16[5] = v3;
    int v4 = (void *)PacketThread_Create(48, 2048, 0x10u, 19, (uint64_t)"rtpsend", v16);
    self->_packetThread = v4;
    PacketThread_ReceiverIsReady((uint64_t)v4);
  }
  audioIssueDetector = self->_audioIssueDetector;
  if (audioIssueDetector)
  {
    VCAudioIssueDetector_Start((uint64_t)audioIssueDetector);
    if ((VCAudioTransmitter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v9 = self->_audioIssueDetector;
          *(_DWORD *)buf = 136316162;
          uint64_t v18 = v7;
          __int16 v19 = 2080;
          __int16 v20 = "-[VCAudioTransmitter start]";
          __int16 v21 = 1024;
          int v22 = 1598;
          __int16 v23 = 2048;
          long long v24 = v9;
          __int16 v25 = 2048;
          uint64_t v26 = self;
          int v10 = " [%s] %s:%d Audio issue detector=%p is started in audio transmitter=%p";
          double v11 = v8;
          uint32_t v12 = 48;
LABEL_14:
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCAudioTransmitter *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        int v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v15 = self->_audioIssueDetector;
          *(_DWORD *)buf = 136316674;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          __int16 v20 = "-[VCAudioTransmitter start]";
          __int16 v21 = 1024;
          int v22 = 1598;
          __int16 v23 = 2112;
          long long v24 = v6;
          __int16 v25 = 2048;
          uint64_t v26 = self;
          __int16 v27 = 2048;
          uint64_t v28 = v15;
          __int16 v29 = 2048;
          int v30 = self;
          int v10 = " [%s] %s:%d %@(%p) Audio issue detector=%p is started in audio transmitter=%p";
          double v11 = v14;
          uint32_t v12 = 68;
          goto LABEL_14;
        }
      }
    }
  }
}

unint64_t __27__VCAudioTransmitter_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = 0;
  *(_DWORD *)(a2 + 32) = 0;
  *(_DWORD *)(a2 + 36) = *(unsigned __int8 *)(*(void *)(a1 + 32) + 328);
  long long v4 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v4;
  v7[2] = *(_OWORD *)(a2 + 32);
  uint64_t v8 = a3;
  uint64_t v9 = a4;
  return _VCAudioTransmitter_SendAudioPacketImpl([*(id *)(a1 + 40) strong], (int *)v7, &v6);
}

- (void)stop
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(VCAudioTransmitter *)self setPeriodicReportingEnabled:0];
  reportingUnregisterPeriodicTask();
  audioIssueDetector = self->_audioIssueDetector;
  if (!audioIssueDetector) {
    goto LABEL_13;
  }
  VCAudioIssueDetector_Stop((uint64_t)audioIssueDetector);
  if ((VCAudioTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_13;
    }
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    uint64_t v7 = self->_audioIssueDetector;
    int v15 = 136316162;
    uint64_t v16 = v5;
    __int16 v17 = 2080;
    uint64_t v18 = "-[VCAudioTransmitter stop]";
    __int16 v19 = 1024;
    int v20 = 1607;
    __int16 v21 = 2048;
    int v22 = v7;
    __int16 v23 = 2048;
    long long v24 = self;
    uint64_t v8 = " [%s] %s:%d Audio issue detector=%p is stopped in audio transmitter=%p";
    uint64_t v9 = v6;
    uint32_t v10 = 48;
    goto LABEL_12;
  }
  if (objc_opt_respondsToSelector()) {
    long long v4 = (__CFString *)[(VCAudioTransmitter *)self performSelector:sel_logPrefix];
  }
  else {
    long long v4 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint32_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = self->_audioIssueDetector;
      int v15 = 136316674;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCAudioTransmitter stop]";
      __int16 v19 = 1024;
      int v20 = 1607;
      __int16 v21 = 2112;
      int v22 = v4;
      __int16 v23 = 2048;
      long long v24 = self;
      __int16 v25 = 2048;
      uint64_t v26 = v13;
      __int16 v27 = 2048;
      uint64_t v28 = self;
      uint64_t v8 = " [%s] %s:%d %@(%p) Audio issue detector=%p is stopped in audio transmitter=%p";
      uint64_t v9 = v12;
      uint32_t v10 = 68;
LABEL_12:
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, v10);
    }
  }
LABEL_13:
  VCAudioDump_Finalize((void **)&self->_encoderOutAudioDump);
  VCAudioDump_Finalize((void **)&self->_encoderInAudioDump);
  packetThread = (int *)self->_packetThread;
  if (packetThread)
  {
    PacketThread_Destroy(packetThread);
    self->_packetThread = 0;
  }
}

- (unsigned)sentAudioBytes
{
  return atomic_fetch_and_explicit((atomic_uint *volatile)&self->_sentAudioBytes, 0, memory_order_relaxed);
}

- (unsigned)sentAudioBytesShort
{
  return atomic_fetch_and_explicit((atomic_uint *volatile)&self->_sentAudioBytesShort, 0, memory_order_relaxed);
}

- (unsigned)encodedBytes
{
  return atomic_fetch_and_explicit((atomic_uint *volatile)&self->_encodedBytes, 0, memory_order_relaxed);
}

- (unsigned)redNumPayloads
{
  return atomic_fetch_or_explicit((atomic_uint *volatile)&self->_redNumPayloads, 0, memory_order_relaxed);
}

- (unsigned)redMaxDelay20ms
{
  return atomic_fetch_or_explicit((atomic_uint *volatile)&self->_redMaxDelay20ms, 0, memory_order_relaxed);
}

- (void)logTierInfo:(int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unsigned int v8 = -1431655766;
  int v9 = -1431655766;
  if (self->_statisticsCollector)
  {
    unsigned int targetBitrate = self->_targetBitrate;
    unsigned int v5 = self->_redundancyPercentage + 100;
    unsigned int v8 = v5;
    int v9 = targetBitrate;
  }
  else
  {
    AFRCGetAudioTxInfo((uint64_t)self->_afrc, &v9, (int *)&v8, 0, 0, 0, 0, 0, 0, 0);
    unsigned int v5 = v8;
    unsigned int targetBitrate = v9;
  }
  *(void *)&long long v6 = __PAIR64__(v5, targetBitrate);
  DWORD2(v6) = [(VCAudioTransmitter *)self redNumPayloads];
  HIDWORD(v6) = 20 * [(VCAudioTransmitter *)self redMaxDelay20ms];
  LODWORD(v7) = [(VCAudioTier *)self->_currentAudioTier packetsPerBundle];
  DWORD1(v7) = [(VCAudioPayloadConfig *)[(VCAudioTier *)self->_currentAudioTier payloadConfig] payload];
  DWORD2(v7) = [(VCAudioTier *)self->_currentAudioTier audioCodecBitrate];
  HIDWORD(v7) = [(VCAudioTier *)self->_currentAudioTier redPayloadBitrate];
  *(_OWORD *)&self->_tierInfo.tier = v6;
  *(_OWORD *)&self->_tierInfo.bundling = v7;
  reportingTierLog();
}

- (void)setRedNumPayloads:(int)a3 withMaxDelay:(int)a4 shouldResetHistory:(BOOL)a5 shouldEnableShortRED:(BOOL)a6
{
  LODWORD(v6) = a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint32_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136316418;
      uint64_t v14 = v11;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCAudioTransmitter setRedNumPayloads:withMaxDelay:shouldResetHistory:shouldEnableShortRED:]";
      __int16 v17 = 1024;
      int v18 = 1839;
      __int16 v19 = 1024;
      int v20 = v9;
      __int16 v21 = 1024;
      int v22 = v8;
      __int16 v23 = 1024;
      BOOL v24 = v7;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d numPayloads:%d maxDelay(in20ms):%d shouldResetHistory=%d", (uint8_t *)&v13, 0x2Eu);
    }
  }
  if ((int)v9 > 0) {
    uint64_t v6 = v6;
  }
  else {
    uint64_t v6 = 0;
  }
  [(VCAudioPayload *)self->_currentAudioPayload setShortREDEnabled:v6];
  if ((v6 & 1) == 0) {
    [(VCPacketBundler *)self->_audioBundlerShortRED resetBuffer];
  }
  [(VCAudioRedBuilder *)self->_redBuilder setNumPayloads:v9];
  [(VCAudioRedBuilder *)self->_redBuilder setMaxDelay:v8];
  if (v7) {
    [(VCAudioRedBuilder *)self->_redBuilder resetShortREDHistoryAndPrimaryPayloadHistory:1];
  }
}

- (void)setStreamIDs:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self->_idsChannelDataFormat.uint64_t numOfStreamIDs = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        unsigned __int16 v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) unsignedShortValue];
        uint64_t numOfStreamIDs = self->_idsChannelDataFormat.numOfStreamIDs;
        self->_idsChannelDataFormat.uint64_t numOfStreamIDs = numOfStreamIDs + 1;
        self->_idsChannelDataFormat.streamIDs[numOfStreamIDs] = v9;
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v6);
  }
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  int v6 = [+[VCDefaults sharedInstance] forceRedNumPayloads];
  if (v6)
  {
    int v7 = 100 * v6;
  }
  else
  {
    int v7 = a4;
    if (self->_shouldApplyRedAsBoolean)
    {
      int v8 = objc_msgSend(-[NSArray lastObject](self->_supportedNumRedundantPayload, "lastObject"), "unsignedIntegerValue");
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      supportedNumRedundantPayload = self->_supportedNumRedundantPayload;
      uint64_t v10 = [(NSArray *)supportedNumRedundantPayload countByEnumeratingWithState:&v39 objects:v38 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v40;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v40 != v12) {
              objc_enumerationMutation(supportedNumRedundantPayload);
            }
            long long v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if ([v14 unsignedIntegerValue] >= a4 / 0x64uLL)
            {
              int v8 = [v14 unsignedIntValue];
              goto LABEL_14;
            }
          }
          uint64_t v11 = [(NSArray *)supportedNumRedundantPayload countByEnumeratingWithState:&v39 objects:v38 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_14:
      int v7 = 100 * v8;
    }
  }
  self->_unsigned int redundancyPercentage = v7;
  if ((VCAudioTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int redundancyPercentage = self->_redundancyPercentage;
        int v25 = 136316162;
        uint64_t v26 = v16;
        __int16 v27 = 2080;
        uint64_t v28 = "-[VCAudioTransmitter redundancyController:redundancyPercentageDidChange:]";
        __int16 v29 = 1024;
        int v30 = 1881;
        __int16 v31 = 1024;
        *(_DWORD *)int v32 = a4;
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)&v32[6] = redundancyPercentage;
        __int16 v19 = " [%s] %s:%d Changed redundancyPercentage=%d applying _redundancyPercentage=%d";
        int v20 = v17;
        uint32_t v21 = 40;
LABEL_25:
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v25, v21);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v15 = (__CFString *)[(VCAudioTransmitter *)self performSelector:sel_logPrefix];
    }
    else {
      long long v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      __int16 v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v24 = self->_redundancyPercentage;
        int v25 = 136316674;
        uint64_t v26 = v22;
        __int16 v27 = 2080;
        uint64_t v28 = "-[VCAudioTransmitter redundancyController:redundancyPercentageDidChange:]";
        __int16 v29 = 1024;
        int v30 = 1881;
        __int16 v31 = 2112;
        *(void *)int v32 = v15;
        *(_WORD *)&v32[8] = 2048;
        BOOL v33 = self;
        __int16 v34 = 1024;
        unsigned int v35 = a4;
        __int16 v36 = 1024;
        unsigned int v37 = v24;
        __int16 v19 = " [%s] %s:%d %@(%p) Changed redundancyPercentage=%d applying _redundancyPercentage=%d";
        int v20 = v23;
        uint32_t v21 = 60;
        goto LABEL_25;
      }
    }
  }
}

- (void)processCDRXInNWConnectionNotification:(tagVCNWConnectionNotification *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unsigned __int16 v9 = 0;
  unsigned __int8 v8 = 0;
  unsigned __int16 v7 = 0;
  unsigned __int8 v6 = 0;
  VCNWConnectionMonitorUtils_GetCDRXCycleFromNWNotification((uint64_t)&self->_lastNWConnectionNotification, &v9, &v8);
  VCNWConnectionMonitorUtils_GetCDRXCycleFromNWNotification((uint64_t)a3, &v7, &v6);
  if (v9 != v7 || v8 != v6) {
    VCPacketBundler_StoreAndEnqueueCdrxInfo((uint64_t)self->_audioBundler, v6, v7);
  }
}

- (void)process5GRATInNWConnectionNotification:(tagVCNWConnectionNotification *)a3
{
  int RATFromNWNotification = VCNWConnectionMonitorUtils_GetRATFromNWNotification((uint64_t)&self->_lastNWConnectionNotification);
  int v6 = VCNWConnectionMonitorUtils_GetRATFromNWNotification((uint64_t)a3);
  if (!RATFromNWNotification && VCNWConnectionMonitorUtils_IsBasebandRAT5G(v6))
  {
    self->_ratType = 6;
    audioIssueDetector = self->_audioIssueDetector;
    VCAudioIssueDetector_UpdateConnectionType((uint64_t)audioIssueDetector, 6);
  }
}

- (void)logNWConnectionNotification:(tagVCNWConnectionNotification *)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  p_lastNWConnectionNotification = &self->_lastNWConnectionNotification;
  int RATFromNWNotification = VCNWConnectionMonitorUtils_GetRATFromNWNotification((uint64_t)&self->_lastNWConnectionNotification);
  int v7 = VCNWConnectionMonitorUtils_GetRATFromNWNotification((uint64_t)a3);
  LODWORD(p_lastNWConnectionNotification) = VCNWConnectionMonitorUtils_GetSignalLevelFromNWNotification((uint64_t)p_lastNWConnectionNotification);
  BOOL v8 = p_lastNWConnectionNotification == VCNWConnectionMonitorUtils_GetSignalLevelFromNWNotification((uint64_t)a3)
    && RATFromNWNotification == v7;
  int basebandAdvisoryType = a3->var0.basebandAdvisoryType;
  if (!v8 && basebandAdvisoryType == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int frequency_band = a3->var1.advisory.frequency_band;
    int reference_signal_level = a3->var1.advisory.cell_context.reference_signal_level;
    int signal_level = a3->var1.advisory.cell_context.signal_level;
    int signal_quality = a3->var1.advisory.cell_context.signal_quality;
    int bt_coex = a3->var1.advisory.bt_coex;
    int quality_score_loss = a3->var1.advisory.quality_score_loss;
    int cdrx_cycle = a3->var1.advisory.cell_context.cdrx_cycle;
    int v35 = 136317698;
    uint64_t v36 = v15;
    __int16 v37 = 2080;
    unsigned int v38 = "-[VCAudioTransmitter logNWConnectionNotification:]";
    __int16 v39 = 1024;
    int v40 = 1919;
    __int16 v41 = 2048;
    long long v42 = self;
    __int16 v43 = 1024;
    int v44 = frequency_band;
    __int16 v45 = 1024;
    int v46 = reference_signal_level;
    __int16 v47 = 1024;
    int v48 = signal_level;
    __int16 v49 = 1024;
    int v50 = signal_quality;
    __int16 v51 = 1024;
    int v52 = bt_coex;
    __int16 v53 = 1024;
    int v54 = quality_score_loss;
    __int16 v55 = 1024;
    int v56 = cdrx_cycle;
    long long v14 = " [%s] %s:%d VCAudioTransmitter[%p] Cellular Network Notification: radioAccessTechnology=%u referenceSignalLeve"
          "l=%d signalLevel=%d signalQuality=%d uplinkBler=%u bandwidthLimitationIndication=%u cdrxCycleLength=%u";
    unsigned int v24 = v16;
    uint32_t v25 = 80;
LABEL_24:
    _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v35, v25);
    return;
  }
  if (basebandAdvisoryType == 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    __int16 v27 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int radioAccessTechnology = a3->var1.codecRateAdaptation.radioAccessTechnology;
    int referenceSignalLevel = a3->var1.linkMeasurement.referenceSignalLevel;
    int signalLevel = a3->var1.linkMeasurement.signalLevel;
    int signalQuality = a3->var1.linkMeasurement.signalQuality;
    int uplinkBler = a3->var1.linkMeasurement.uplinkBler;
    int v35 = 136317186;
    uint64_t v36 = v26;
    __int16 v37 = 2080;
    unsigned int v38 = "-[VCAudioTransmitter logNWConnectionNotification:]";
    __int16 v39 = 1024;
    int v40 = 1923;
    __int16 v41 = 2048;
    long long v42 = self;
    __int16 v43 = 1024;
    int v44 = radioAccessTechnology;
    __int16 v45 = 1024;
    int v46 = referenceSignalLevel;
    __int16 v47 = 1024;
    int v48 = signalLevel;
    __int16 v49 = 1024;
    int v50 = signalQuality;
    __int16 v51 = 1024;
    int v52 = uplinkBler;
    long long v14 = " [%s] %s:%d VCAudioTransmitter[%p] Cellular Link Measurement Notification: radioAccessTechnology=%u referenceS"
          "ignalLevel=%d signalLevel=%d signalQuality=%d uplinkBler=%u";
    unsigned int v24 = v27;
    uint32_t v25 = 68;
    goto LABEL_24;
  }
  if (basebandAdvisoryType == 4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int reserved = a3->var1.advisory._reserved;
        int v35 = 136316162;
        uint64_t v36 = v33;
        __int16 v37 = 2080;
        unsigned int v38 = "-[VCAudioTransmitter logNWConnectionNotification:]";
        __int16 v39 = 1024;
        int v40 = 1925;
        __int16 v41 = 2048;
        long long v42 = self;
        __int16 v43 = 1024;
        int v44 = reserved;
        long long v14 = " [%s] %s:%d VCAudioTransmitter[%p] Cellular CDRX Notification: cdrxCycleLength=%u";
        goto LABEL_23;
      }
    }
  }
  else if (basebandAdvisoryType == 3 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int version = a3->var1.advisory.version;
      int v35 = 136316162;
      uint64_t v36 = v11;
      __int16 v37 = 2080;
      unsigned int v38 = "-[VCAudioTransmitter logNWConnectionNotification:]";
      __int16 v39 = 1024;
      int v40 = 1921;
      __int16 v41 = 2048;
      long long v42 = self;
      __int16 v43 = 1024;
      int v44 = version;
      long long v14 = " [%s] %s:%d VCAudioTransmitter[%p] Cellular BW Limitation: bandwidthLimitationIndication=%u";
LABEL_23:
      unsigned int v24 = v12;
      uint32_t v25 = 44;
      goto LABEL_24;
    }
  }
}

- (void)processNWConnectionNotification:(tagVCNWConnectionNotification *)a3
{
  if (a3)
  {
    -[VCAudioTransmitter process5GRATInNWConnectionNotification:](self, "process5GRATInNWConnectionNotification:");
    [(VCAudioTransmitter *)self processCDRXInNWConnectionNotification:a3];
    [(VCAudioTransmitter *)self logNWConnectionNotification:a3];
    long long v5 = *(_OWORD *)&a3->version;
    long long v6 = *(_OWORD *)(&a3->var1.thermalUpdate + 6);
    *(_OWORD *)(&self->_lastNWConnectionNotification.var1.thermalUpdate + 2) = *(_OWORD *)(&a3->var1.thermalUpdate + 2);
    *(_OWORD *)(&self->_lastNWConnectionNotification.var1.thermalUpdate + 6) = v6;
    *(_OWORD *)&self->_lastNWConnectionNotification.int version = v5;
    long long v7 = *(_OWORD *)(&a3->var1.thermalUpdate + 10);
    long long v8 = *(_OWORD *)(&a3->var1.thermalUpdate + 14);
    long long v9 = *(_OWORD *)(&a3->var1.thermalUpdate + 18);
    *((void *)&self->_lastNWConnectionNotification.var1.thermalUpdate + 11) = *((void *)&a3->var1.thermalUpdate + 11);
    *(_OWORD *)(&self->_lastNWConnectionNotification.var1.thermalUpdate + 14) = v8;
    *(_OWORD *)(&self->_lastNWConnectionNotification.var1.thermalUpdate + 18) = v9;
    *(_OWORD *)(&self->_lastNWConnectionNotification.var1.thermalUpdate + 10) = v7;
    audioIssueDetector = self->_audioIssueDetector;
    if (audioIssueDetector)
    {
      VCAudioIssueDetector_ProcessCellularNetworkNotification((uint64_t)audioIssueDetector, (uint64_t)a3);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioTransmitter processNWConnectionNotification:]();
    }
  }
}

- (void)reportRTCPPacket
{
  audioIssueDetector = self->_audioIssueDetector;
  if (audioIssueDetector) {
    VCAudioIssueDetector_ReportRTCPTraffic((uint64_t)audioIssueDetector);
  }
}

- (void)audioIssueDetectorCreateAndConfigure
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  double mSampleRate = self->_inputFormat.format.mSampleRate;
  reportingAgent = self->_reportingAgent;
  v17[0] = 0xAAAAAAAAAAAAAAAALL;
  v17[1] = reportingAgent;
  WORD1(v17[0]) = (int)mSampleRate;
  LOWORD(v17[0]) = self->_inputFormat.samplesPerFrame;
  int ratType = self->_ratType;
  int reportingModuleID = self->_reportingModuleID;
  int v19 = ratType;
  long long v6 = VCAudioIssueDetector_Create(0);
  self->_audioIssueDetector = (tagVCAudioIssueDetector *)v6;
  VCAudioIssueDetector_Configure((uint64_t)v6, (unsigned __int16 *)v17);
  if ((VCAudioTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      long long v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        audioIssueDetector = self->_audioIssueDetector;
        *(_DWORD *)buf = 136316674;
        uint64_t v21 = v8;
        __int16 v22 = 2080;
        __int16 v23 = "-[VCAudioTransmitter audioIssueDetectorCreateAndConfigure]";
        __int16 v24 = 1024;
        int v25 = 1962;
        __int16 v26 = 2048;
        __int16 v27 = audioIssueDetector;
        __int16 v28 = 2048;
        __int16 v29 = self;
        __int16 v30 = 1024;
        *(_DWORD *)__int16 v31 = WORD1(v17[0]);
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = LOWORD(v17[0]);
        uint64_t v11 = " [%s] %s:%d Audio issue detector=%p is configured in audioTransmitter=%p with audioIOSampleRate=%d, audioIOSampleCount=%d";
        uint64_t v12 = v9;
        uint32_t v13 = 60;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v7 = (__CFString *)[(VCAudioTransmitter *)self performSelector:sel_logPrefix];
    }
    else {
      long long v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = self->_audioIssueDetector;
        *(_DWORD *)buf = 136317186;
        uint64_t v21 = v14;
        __int16 v22 = 2080;
        __int16 v23 = "-[VCAudioTransmitter audioIssueDetectorCreateAndConfigure]";
        __int16 v24 = 1024;
        int v25 = 1962;
        __int16 v26 = 2112;
        __int16 v27 = v7;
        __int16 v28 = 2048;
        __int16 v29 = self;
        __int16 v30 = 2048;
        *(void *)__int16 v31 = v16;
        *(_WORD *)&v31[8] = 2048;
        int v32 = self;
        __int16 v33 = 1024;
        int v34 = WORD1(v17[0]);
        __int16 v35 = 1024;
        int v36 = LOWORD(v17[0]);
        uint64_t v11 = " [%s] %s:%d %@(%p) Audio issue detector=%p is configured in audioTransmitter=%p with audioIOSampleRate=%d,"
              " audioIOSampleCount=%d";
        uint64_t v12 = v15;
        uint32_t v13 = 80;
        goto LABEL_11;
      }
    }
  }
}

- (void)audioIssueDetectorStopAndFinalize
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  p_audioIssueDetector = (int32x2_t ***)&self->_audioIssueDetector;
  VCAudioIssueDetector_Stop((uint64_t)self->_audioIssueDetector);
  VCAudioIssueDetector_Finalize(p_audioIssueDetector);
  if ((VCAudioTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      long long v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        audioIssueDetector = self->_audioIssueDetector;
        int v14 = 136316162;
        uint64_t v15 = v5;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCAudioTransmitter audioIssueDetectorStopAndFinalize]";
        __int16 v18 = 1024;
        int v19 = 1982;
        __int16 v20 = 2048;
        uint64_t v21 = audioIssueDetector;
        __int16 v22 = 2048;
        __int16 v23 = self;
        uint64_t v8 = " [%s] %s:%d Audio issue detector=%p is stopped and destroyed in audio transmitter=%p";
        long long v9 = v6;
        uint32_t v10 = 48;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v4 = (__CFString *)[(VCAudioTransmitter *)self performSelector:sel_logPrefix];
    }
    else {
      long long v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v13 = self->_audioIssueDetector;
        int v14 = 136316674;
        uint64_t v15 = v11;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCAudioTransmitter audioIssueDetectorStopAndFinalize]";
        __int16 v18 = 1024;
        int v19 = 1982;
        __int16 v20 = 2112;
        uint64_t v21 = v4;
        __int16 v22 = 2048;
        __int16 v23 = self;
        __int16 v24 = 2048;
        int v25 = v13;
        __int16 v26 = 2048;
        __int16 v27 = self;
        uint64_t v8 = " [%s] %s:%d %@(%p) Audio issue detector=%p is stopped and destroyed in audio transmitter=%p";
        long long v9 = v12;
        uint32_t v10 = 68;
        goto LABEL_11;
      }
    }
  }
}

- (void)handleActiveConnectionChangeMultiway:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  self->_unsigned int maxAudioPacketSize = [a3 maxConnectionMTU];
  int v5 = VCNetworkUtils_AdditionalOverheadForIDSOptions(LOBYTE(self->_maxIDSStreamIdCount), 1, 0);
  self->_maxAudioPacketSize -= v5;
  if ((VCAudioTransmitter *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      long long v6 = (__CFString *)[(VCAudioTransmitter *)self performSelector:sel_logPrefix];
    }
    else {
      long long v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    int v14 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    unsigned int maxAudioPacketSize = self->_maxAudioPacketSize;
    int v16 = 136316418;
    uint64_t v17 = v13;
    __int16 v18 = 2080;
    int v19 = "-[VCAudioTransmitter handleActiveConnectionChangeMultiway:]";
    __int16 v20 = 1024;
    int v21 = 2025;
    __int16 v22 = 2112;
    __int16 v23 = v6;
    __int16 v24 = 2048;
    int v25 = self;
    __int16 v26 = 1024;
    unsigned int v27 = maxAudioPacketSize;
    uint32_t v10 = " [%s] %s:%d %@(%p) Setting _maxAudioPacketSize=%u for multiway connection";
    uint64_t v11 = v14;
    uint32_t v12 = 54;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = self->_maxAudioPacketSize;
      int v16 = 136315906;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      int v19 = "-[VCAudioTransmitter handleActiveConnectionChangeMultiway:]";
      __int16 v20 = 1024;
      int v21 = 2025;
      __int16 v22 = 1024;
      LODWORD(v23) = v9;
      uint32_t v10 = " [%s] %s:%d Setting _maxAudioPacketSize=%u for multiway connection";
      uint64_t v11 = v8;
      uint32_t v12 = 34;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, v12);
    }
  }
LABEL_12:
  self->_unsigned int constantTransportOverhead = VCConnection_PerPacketConnectionOverhead((uint64_t)a3);
  if (!VCDefaults_GetBoolValueForKey(@"disableDynamicMediaPacketHeaderCalculations", 0)) {
    RTPUpdateConstantTransportOverhead((uint64_t)self->_rtpHandle, self->_constantTransportOverhead);
  }
  self->_constantTransportOverhead += v5;
  atomic_fetch_add(&self->_audioTierChangeRequestCount, 1u);
}

- (void)handleActiveConnectionChangeDefault:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  self->_BOOL useWiFiTiers = [a3 isWifiToWifi];
  self->_unsigned int maxAudioPacketSize = [a3 connectionMTU];
  if ((VCAudioTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    unsigned int maxAudioPacketSize = self->_maxAudioPacketSize;
    BOOL useWiFiTiers = self->_useWiFiTiers;
    int v21 = 136316162;
    uint64_t v22 = v6;
    __int16 v23 = 2080;
    __int16 v24 = "-[VCAudioTransmitter handleActiveConnectionChangeDefault:]";
    __int16 v25 = 1024;
    int v26 = 2042;
    __int16 v27 = 1024;
    *(_DWORD *)uint64_t v28 = maxAudioPacketSize;
    *(_WORD *)&v28[4] = 1024;
    *(_DWORD *)&v28[6] = useWiFiTiers;
    uint32_t v10 = " [%s] %s:%d Setting _maxAudioPacketSize=%u for default mode, useWiFiTiers=%{BOOL}d";
    uint64_t v11 = v7;
    uint32_t v12 = 40;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    int v5 = (__CFString *)[(VCAudioTransmitter *)self performSelector:sel_logPrefix];
  }
  else {
    int v5 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    int v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = self->_maxAudioPacketSize;
      BOOL v16 = self->_useWiFiTiers;
      int v21 = 136316674;
      uint64_t v22 = v13;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCAudioTransmitter handleActiveConnectionChangeDefault:]";
      __int16 v25 = 1024;
      int v26 = 2042;
      __int16 v27 = 2112;
      *(void *)uint64_t v28 = v5;
      *(_WORD *)&v28[8] = 2048;
      __int16 v29 = self;
      __int16 v30 = 1024;
      unsigned int v31 = v15;
      __int16 v32 = 1024;
      BOOL v33 = v16;
      uint32_t v10 = " [%s] %s:%d %@(%p) Setting _maxAudioPacketSize=%u for default mode, useWiFiTiers=%{BOOL}d";
      uint64_t v11 = v14;
      uint32_t v12 = 60;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v21, v12);
    }
  }
LABEL_12:
  if (self->_useRateControl) {
    uint64_t v17 = [a3 uplinkAudioBitrateCapOneToOne];
  }
  else {
    uint64_t v17 = [a3 uplinkBitrateCap];
  }
  uint64_t v18 = v17;
  uint64_t IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
  uint64_t IsRemoteOnCellular = VCConnection_IsRemoteOnCellular((uint64_t)a3);
  [(VCAudioTransmitter *)self setCellTech:IsLocalOnCellular remoteCellular:IsRemoteOnCellular isIPV6:VCConnection_IsIPv6((uint64_t)a3) audioCap:v18];
}

- (void)handleActiveConnectionChange:(id)a3
{
  if (self->_operatingMode == 6) {
    [(VCAudioTransmitter *)self handleActiveConnectionChangeMultiway:a3];
  }
  else {
    [(VCAudioTransmitter *)self handleActiveConnectionChangeDefault:a3];
  }
}

- (VCPacketBundler)audioBundler
{
  return self->_audioBundler;
}

- (VCAudioTier)currentAudioTier
{
  return self->_currentAudioTier;
}

- (int)audioTxBitrate
{
  return self->_audioTxBitrate;
}

- (int)actualAudioSendingBitrate
{
  return self->_actualAudioSendingBitrate;
}

- (unsigned)inputMeter
{
  return self->_inputMeter;
}

- (void)setInputMeter:(unsigned __int8)a3
{
  self->_inputMeter = a3;
}

- (unsigned)lastSentAudioSampleTime
{
  return self->_lastSentAudioSampleTime;
}

- (int)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(int)a3
{
  self->_int operatingMode = a3;
}

- (BOOL)isRedEnabled
{
  return self->_isRedEnabled;
}

- (BOOL)ignoreSilence
{
  return self->_ignoreSilence;
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (void)setTargetBitrate:(unsigned int)a3
{
  self->_unsigned int targetBitrate = a3;
}

- (unsigned)rateChangeCounter
{
  return self->_rateChangeCounter;
}

- (void)setRateChangeCounter:(unsigned int)a3
{
  self->_unsigned int rateChangeCounter = a3;
}

- (BOOL)isAudioStalled
{
  return self->_isAudioStalled;
}

- (void)setIsAudioStalled:(BOOL)a3
{
  self->_BOOL isAudioStalled = a3;
}

- (int)qualityIndicator
{
  return self->_qualityIndicator;
}

- (void)setQualityIndicator:(int)a3
{
  self->_qualityIndicator = a3;
}

- (unsigned)maxIDSStreamIdCount
{
  return self->_maxIDSStreamIdCount;
}

- (void)setMaxIDSStreamIdCount:(unsigned int)a3
{
  self->_maxIDSStreamIdCount = a3;
}

- (NSArray)supportedNumRedundantPayload
{
  return self->_supportedNumRedundantPayload;
}

- (void)setSupportedNumRedundantPayload:(id)a3
{
}

- ($630EEFBF570FF8F3C5E9582E2A557BD5)currentChannelMetrics
{
  long long v3 = *(_OWORD *)&self[6].var3;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&self[6].var1[3];
  *(_OWORD *)&retstr->var4.height = v3;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[6].var4.height;
  *(void *)&retstr->var8 = *(void *)&self[6].var6;
  long long v4 = *(_OWORD *)&self[6].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[5].var7;
  *(_OWORD *)&retstr->var1[3] = v4;
  return self;
}

- (void)setCurrentChannelMetrics:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var1[3];
  *(_OWORD *)&self->_currentChannelMetrics.averageNetworkBitrate = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_currentChannelMetrics.networkBitrate[3] = v3;
  long long v4 = *(_OWORD *)&a3->var3;
  long long v5 = *(_OWORD *)&a3->var4.height;
  long long v6 = *(_OWORD *)&a3->var6;
  *(void *)&self->_currentChannelMetrics.lastVideoSampleTime = *(void *)&a3->var8;
  *(_OWORD *)&self->_currentChannelMetrics.frameResolution.height = v5;
  *(_OWORD *)&self->_currentChannelMetrics.lastAudioSampleTime = v6;
  *(_OWORD *)&self->_currentChannelMetrics.averageFramerate = v4;
}

- (BOOL)sendActiveVoiceOnly
{
  return self->_sendActiveVoiceOnly;
}

- (void)setSendActiveVoiceOnly:(BOOL)a3
{
  self->_sendActiveVoiceOnly = a3;
}

- (BOOL)isCurrentDTXEnabled
{
  return self->_currentDTXEnable;
}

- (BOOL)useWiFiTiers
{
  return self->_useWiFiTiers;
}

- (void)setUseWiFiTiers:(BOOL)a3
{
  self->_BOOL useWiFiTiers = a3;
}

- (VCAudioTierPicker)audioTierPicker
{
  return self->_audioTierPicker;
}

- (void)setAudioTierPicker:(id)a3
{
}

- (BOOL)periodicReportingEnabled
{
  return self->_periodicReportingEnabled;
}

- (void)setPeriodicReportingEnabled:(BOOL)a3
{
  self->_periodicReportingEnabled = a3;
}

- (NSArray)audioPayloads
{
  return &self->_audioPayloads->super;
}

- (VCPacketBundler)audioBundlerShortRED
{
  return self->_audioBundlerShortRED;
}

- (int)actualAudioSendingBitrateNoRED
{
  return self->_actualAudioSendingBitrateNoRED;
}

- (unsigned)mediaControlInfoVersion
{
  return self->_mediaControlInfoVersion;
}

- (void)setMediaControlInfoVersion:(unsigned __int8)a3
{
  self->_mediaControlInfoVersion = a3;
}

- (void)handleCodecModeChangeEvent:(uint64_t)a1 didUpdateBandwidth:(int *)a2 didUpdateBitrate:(os_log_t)log .cold.1(uint64_t a1, int *a2, os_log_t log)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v3 = *a2;
  int v4 = a2[1];
  int v5 = a2[2];
  int v6 = 136316418;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  unsigned int v9 = "-[VCAudioTransmitter handleCodecModeChangeEvent:didUpdateBandwidth:didUpdateBitrate:]";
  __int16 v10 = 1024;
  int v11 = 434;
  __int16 v12 = 1024;
  int v13 = v3;
  __int16 v14 = 1024;
  int v15 = v4;
  __int16 v16 = 1024;
  int v17 = v5;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Coded rate mode and bandwidth combination is not supported for payload=%u. mode=%u bandwidth=%u", (uint8_t *)&v6, 0x2Eu);
}

- (void)allocateLastInputSampleBuffer:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d error zero sampleBufferSize requested", v2, v3, v4, v5, v6);
}

- (void)processNWConnectionNotification:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Notification is null", v2, v3, v4, v5, v6);
}

@end