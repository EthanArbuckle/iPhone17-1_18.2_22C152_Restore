@interface VCAudioStream
+ (BOOL)isTelephony:(int64_t)a3;
+ (BOOL)isVoLTE:(int64_t)a3;
+ (BOOL)isVoWiFi:(int64_t)a3;
+ (BOOL)shouldUseAACELDSBRForMode:(int64_t)a3;
+ (BOOL)shouldUseRandomRTPTimestampForMode:(int)a3;
+ (id)capabilities;
+ (id)newPayloadConfigForCodecConfig:(id)a3 streamConfig:(id)a4 inputSampleRate:(unsigned int)a5;
+ (id)supportedAudioPayloads;
+ (int)operatingModeForAudioStreamMode:(int64_t)a3;
+ (unsigned)audioChannelCountForMode:(id)a3;
+ (unsigned)audioIODirectionWithMediaStreamDirection:(int64_t)a3;
+ (unsigned)audioIOTypeForMode:(int64_t)a3;
+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5;
- (BOOL)bitrateIsAudioOnly;
- (BOOL)createAudioReceiver;
- (BOOL)createAudioTransmitter:(int64_t)a3 streamIDs:(id)a4;
- (BOOL)generateRTCPXRSummaryReports:(tagVCRTCPXRSummaryReport *)a3 reportCount:(char *)a4;
- (BOOL)generateRTCPXRVoIPMetricsReports:(tagVCRTCPXRVoIPMetricsReport *)a3 reportCount:(char *)a4;
- (BOOL)generateReceptionReportList:(_RTCP_RECEPTION_REPORT *)a3 reportCount:(char *)a4;
- (BOOL)getCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3 forCodecBitrate:(unsigned int)a4 payload:(int)a5;
- (BOOL)handleUplinkBitrateChange:(_VCAudioCodecModeChangeEvent *)a3 reason:(unsigned __int8)a4;
- (BOOL)isCurrentDTXEnabled;
- (BOOL)isFrequencyMeteringEnabled:(int)a3;
- (BOOL)isMuted;
- (BOOL)isRemoteMuted;
- (BOOL)isStandaloneStreamClientSpecificUserInfoSupported;
- (BOOL)isValid;
- (BOOL)isVoLTERateAdaptationEnabled;
- (BOOL)networkUplinkClockUsesBaseband:(int64_t)a3;
- (BOOL)onConfigureStreamWithConfiguration:(id)a3 error:(id *)a4;
- (BOOL)sendActiveVoiceOnly;
- (BOOL)setReceiverPayloads;
- (BOOL)setupAudioStreamWithClientPid:(int)a3 enableAudioPowerSpectrum:(BOOL)a4;
- (BOOL)setupPayloads;
- (BOOL)setupSourceTransport:(id)a3;
- (BOOL)shouldRegisterReportingPeriodicTask;
- (BOOL)shouldReportNetworkInterfaceType;
- (BOOL)shouldResetRTPTimestampOnStart;
- (BOOL)shouldUseNWConnectionBackingSocket;
- (BOOL)validateAudioStreamConfigurations:(id)a3;
- (NSNumber)targetStreamID;
- (VCAudioIO)audioIO;
- (VCAudioStream)initWithClientPid:(int)a3;
- (VCAudioStream)initWithClientPid:(int)a3 ssrc:(unsigned int)a4 transportSessionID:(unsigned int)a5 streamToken:(int64_t)a6;
- (VCAudioTransmitter)audioTransmitter;
- (_METER_INFO)meterWithType:(int)a3;
- (__CFDictionary)getClientSpecificUserInfo:(id)a3;
- (__CFString)getReportingClientName;
- (double)lastReceivedRTCPPacketTime;
- (double)lastReceivedRTPPacketTime;
- (double)rtcpHeartbeatLeeway;
- (float)volume;
- (id)addAudioPayload:(int)a3;
- (id)codecConfigForOpusWithStreamConfig:(id)a3;
- (id)configForPayloadType:(int)a3;
- (id)createTransportWithStreamConfig:(id)a3;
- (id)getReportingServiceID;
- (id)getSupportedPayloads;
- (id)setLocalParticipantInfo:(id)a3 networkSockets:(id)a4 withError:(id *)a5;
- (id)streamIDsFromTransport;
- (id)supportedPayloads;
- (int)deviceRole;
- (int)getConnectionTypeForStreamMode:(int64_t)a3;
- (int)getPacketsPerBundleForStreamConfig:(id)a3;
- (int)getRTPTimeStampRateScaleFactor;
- (int)getReportingClientType;
- (int)preferredAudioCodecWithStreamConfig:(id)a3;
- (int)selectCodecBandwidthForCodecRateMode:(int)a3;
- (int64_t)getSyncSourceSampleRate;
- (int64_t)overlayToken;
- (unsigned)actualAudioSendingBitrate;
- (unsigned)computePacketTimestampWithInputTimestamp:(unsigned int)a3 numSamples:(int)a4 hostTime:(double)a5;
- (unsigned)conferenceID;
- (unsigned)internalSampleRateForCodecType:(int64_t)a3;
- (unsigned)lastNoVoiceActivityPacketCount;
- (unsigned)packetExpirationTimeForStreamConfig:(id)a3 codecType:(int64_t)a4;
- (unsigned)preferredAudioBitrateForPayload:(int)a3;
- (void)_computeInternalFormatForStreamConfigurations:(id)a3;
- (void)addStreamStartingMetricsToReport:(const __CFDictionary *)a3;
- (void)addSyncSourceDelegate:(id)a3;
- (void)cleanUpCaptionsCoordinators;
- (void)cleanUpMediaRecorder;
- (void)cleanupAudio;
- (void)cleanupBeforeReconfigure:(id)a3;
- (void)collectRxChannelMetrics:(id *)a3;
- (void)collectTxChannelMetrics:(id *)a3;
- (void)configureAudioJBAlgos:(tagVCAudioReceiverConfig *)a3;
- (void)configureCellularFeatures;
- (void)createAudioReceiver;
- (void)createReportSSRCListWithStreamConfigs:(id)a3;
- (void)dealloc;
- (void)didEnterState:(int)a3 oldState:(int)a4;
- (void)didResumeAudioIO:(id)a3;
- (void)didSuspendAudioIO:(id)a3;
- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3;
- (void)gatherRealtimeStats:(__CFDictionary *)a3;
- (void)getCodecConfigForPayload:(int)a3 block:(id)a4;
- (void)handleANBR:(unsigned int)a3 forDirection:(int64_t)a4;
- (void)handleActiveConnectionChange:(id)a3;
- (void)handleBasebandRateTrendSuggestion:(int)a3;
- (void)handleCellularToWiFiHandover;
- (void)handleCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3;
- (void)handleDownlinkANBR:(_VCAudioCodecModeChangeEvent *)a3;
- (void)handleThermalPressureNotification:(id)a3;
- (void)handleUplinkANBR:(_VCAudioCodecModeChangeEvent *)a3;
- (void)handleWiFiToCelluarHandover;
- (void)notifyCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3 didUpdateBandwidth:(BOOL)a4 didUpdateBitrate:(BOOL)a5;
- (void)notifyCodecModeChangeToCT:(_VCAudioCodecModeChangeEvent *)a3;
- (void)onCallIDChanged;
- (void)onPauseWithCompletionHandler:(id)a3;
- (void)onRTCPTimeout;
- (void)onResumeWithCompletionHandler:(id)a3;
- (void)onSendRTCPPacket;
- (void)onStartWithCompletionHandler:(id)a3;
- (void)onStopWithCompletionHandler:(id)a3;
- (void)prepareAudio;
- (void)pullAudioSamples:(opaqueVCAudioBufferList *)a3;
- (void)pullSamplesCallback;
- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3;
- (void)queryAnbrBitrate:(unsigned int)a3 forDirection:(int64_t)a4;
- (void)rateAdaptation:(id)a3 targetBitrateDidChange:(unsigned int)a4 rateChangeCounter:(unsigned int)a5;
- (void)realtimeSourceContext;
- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4;
- (void)registerActiveAudioStreamChangeNotifications;
- (void)registerCodecRateModeChangeNotifications;
- (void)registerForThermalNotifications;
- (void)removeSyncSourceDelegate:(id)a3;
- (void)reportTimestampJumpsWithReportingDictionary:(__CFDictionary *)a3;
- (void)reportingAlgosAudioStreamEvent:(unsigned __int16)a3;
- (void)reportingAudioStreamEvent:(unsigned __int16)a3;
- (void)sendDTMFEvent:(id)a3;
- (void)serverDidDie;
- (void)setAudioIO:(id)a3;
- (void)setAudioTransmitter:(id)a3;
- (void)setCurrentDTXEnable:(BOOL)a3;
- (void)setDTXPayload:(id)a3;
- (void)setDeviceRole:(int)a3;
- (void)setDeviceRoleForAudioStreamMode:(int64_t)a3 direction:(int64_t)a4;
- (void)setFrequencyMeteringEnabled:(BOOL)a3 meterType:(int)a4;
- (void)setIsLocalCelluar:(unsigned int)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setJitterBufferMode:(int)a3;
- (void)setLastNoVoiceActivityPacketCount:(unsigned int)a3;
- (void)setMuted:(BOOL)a3;
- (void)setOverlayToken:(int64_t)a3;
- (void)setPreferredMediaBitrateWithConfiguration:(id)a3;
- (void)setReceiverPayloads;
- (void)setRemoteCodecTypeAndSampleRate:(_VCAudioCodecModeChangeEvent *)a3;
- (void)setRemoteMuted:(BOOL)a3;
- (void)setSendActiveVoiceOnly:(BOOL)a3;
- (void)setStreamDirection:(int64_t)a3;
- (void)setStreamIDs:(id)a3 repairStreamIDs:(id)a4;
- (void)setTargetBitrate:(unsigned int)a3 rateChangeCounter:(unsigned int)a4;
- (void)setTargetStreamID:(id)a3;
- (void)setUpMediaRecorder;
- (void)setVCStatistics:(tagVCStatisticsMessage *)a3;
- (void)setVolume:(float)a3;
- (void)setupAudioPowerSpectrum;
- (void)setupCaptionsCoordinatorsWithFormat:(tagVCAudioFrameFormat *)a3 direction:(int64_t)a4;
- (void)setupPayloads;
- (void)setupPeriodicReporting;
- (void)setupReportingAgent:(id)a3;
- (void)startAudioWithCompletionHandler:(id)a3;
- (void)stopAudioWithCompletionHandler:(id)a3;
- (void)stopSendDTMFEvent;
- (void)storeLastCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3;
- (void)telephonyInterface:(id)a3 anbrActivationUpdate:(BOOL)a4;
- (void)telephonyInterface:(id)a3 anbrRecommendation:(unsigned int)a4 forDirection:(int64_t)a5;
- (void)unregisterCodecRateModeChangeNotifications;
- (void)unregisterForThermalNotifications;
- (void)updateCodecPayloadAndBitrateForStartEvent:(int *)a3 bitrate:(unsigned int *)a4;
- (void)updateRateAdaptationWithNetworkNotification:(tagVCNWConnectionNotification *)a3;
- (void)updateSyncSourceState:(int)a3;
- (void)waitIdleForSyncSourceDelegates;
- (void)willExitState:(int)a3 newState:(int)a4;
@end

@implementation VCAudioStream

- (void)setOverlayToken:(int64_t)a3
{
  if (self->_overlayToken != a3)
  {
    self->_int64_t overlayToken = a3;
    if (VCOverlayManager_isOverlayEnabled())
    {
      audioReceiver = self->_sourceContext.audioReceiver;
      if (audioReceiver)
      {
        int64_t overlayToken = self->_overlayToken;
        VCAudioReceiver_SetOverlayToken((uint64_t)audioReceiver, overlayToken);
      }
    }
  }
}

- (unsigned)computePacketTimestampWithInputTimestamp:(unsigned int)a3 numSamples:(int)a4 hostTime:(double)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (self->super._operatingMode != 6)
  {
    double dAudioHostTime = self->dAudioHostTime;
    if (dAudioHostTime == 0.0)
    {
      int v14 = 0;
    }
    else
    {
      double v9 = a5 - dAudioHostTime;
      float v10 = self->_vpioFormat.format.mSampleRate / (double)a4;
      int v11 = llround(v9 * v10) * a4;
      if (v11 != a4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            unsigned int lastInputAudioTimeStamp = self->lastInputAudioTimeStamp;
            double v17 = self->dAudioHostTime;
            int v18 = 136317954;
            uint64_t v19 = v12;
            __int16 v20 = 2080;
            v21 = "-[VCAudioStream computePacketTimestampWithInputTimestamp:numSamples:hostTime:]";
            __int16 v22 = 1024;
            int v23 = 251;
            __int16 v24 = 2080;
            v25 = "-[VCAudioStream computePacketTimestampWithInputTimestamp:numSamples:hostTime:]";
            __int16 v26 = 1024;
            unsigned int v27 = a3 - lastInputAudioTimeStamp;
            __int16 v28 = 1024;
            unsigned int v29 = lastInputAudioTimeStamp;
            __int16 v30 = 1024;
            unsigned int v31 = a3;
            __int16 v32 = 2048;
            double v33 = v9;
            __int16 v34 = 1024;
            int v35 = v11;
            __int16 v36 = 2048;
            double v37 = v17;
            __int16 v38 = 2048;
            double v39 = a5;
            __int16 v40 = 1024;
            int v41 = v11;
            _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %s Timestamp jumped: %u (%u to %u), host time: %f (%d samples) (%f to %f). Adjustment: %d", (uint8_t *)&v18, 0x62u);
          }
        }
        a4 = v11;
      }
      int v14 = (int)((double)([(VCAudioPayloadConfig *)[(VCAudioTransmitter *)[(VCAudioStream *)self audioTransmitter] currentAudioPayloadConfig] codecSampleRate]* (uint64_t)a4)/ self->_vpioFormat.format.mSampleRate);
    }
    return self->lastSentAudioSampleTime + v14;
  }
  return a3;
}

- (unsigned)internalSampleRateForCodecType:(int64_t)a3
{
  int operatingMode = self->super._operatingMode;
  if (operatingMode == 6 || self->_isVoiceProcessingAt24KSupported) {
    return 24000;
  }
  unsigned int result = 8000;
  switch(a3)
  {
    case 1:
    case 5:
    case 6:
    case 13:
    case 14:
    case 17:
      return result;
    case 2:
    case 3:
    case 7:
    case 12:
    case 15:
      unsigned int result = 16000;
      break;
    case 4:
      if (operatingMode == 3) {
        unsigned int result = 32000;
      }
      else {
        unsigned int result = 24000;
      }
      break;
    case 8:
    case 11:
    case 18:
    case 20:
      return 24000;
    case 16:
    case 19:
      unsigned int result = 48000;
      break;
    default:
      unsigned int result = 0;
      break;
  }
  return result;
}

- (void)_computeInternalFormatForStreamConfigurations:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v21 = +[VCAudioStream audioChannelCountForMode:](VCAudioStream, "audioChannelCountForMode:", [a3 firstObject]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = 0;
    uint64_t v8 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(a3);
        }
        float v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v10 useExternalIO])
        {
          double v17 = (_OWORD *)[v10 externalIOFormat];
          long long v19 = v17[1];
          long long v18 = v17[2];
          *(_OWORD *)&self->_vpioFormat.format.mSampleRate = *v17;
          *(_OWORD *)&self->_vpioFormat.format.mBytesPerPacket = v19;
          *(_OWORD *)&self->_vpioFormat.format.mBitsPerChannel = v18;
          BOOL v20 = 1;
          goto LABEL_24;
        }
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        int v11 = objc_msgSend((id)objc_msgSend(v10, "allCodecConfigurations"), "allValues");
        uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v22 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v11);
              }
              unsigned int v16 = -[VCAudioStream internalSampleRateForCodecType:](self, "internalSampleRateForCodecType:", [*(id *)(*((void *)&v23 + 1) + 8 * j) codecType]);
              if (v7 <= v16) {
                unsigned int v7 = v16;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v22 count:16];
          }
          while (v13);
        }
        if (self->super._operatingMode == 11) {
          int v21 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "channelCount");
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    unsigned int v7 = 0;
  }
  Format_Float((uint64_t)&self->_vpioFormat, v21, v7);
  BOOL v20 = 0;
LABEL_24:
  self->_useExternalIO = v20;
}

- (BOOL)generateRTCPXRSummaryReports:(tagVCRTCPXRSummaryReport *)a3 reportCount:(char *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  char v6 = *a4;
  *a4 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  transportArray = self->super._transportArray;
  uint64_t v8 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v28 objects:v27 count:16];
  if (!v8) {
    return 0;
  }
  uint64_t v10 = v8;
  BOOL v11 = 0;
  uint64_t v12 = *(void *)v29;
  *(void *)&long long v9 = 136315650;
  long long v18 = v9;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v29 != v12) {
        objc_enumerationMutation(transportArray);
      }
      uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      if (objc_msgSend(v14, "isRTCPXREnabled", v18))
      {
        unsigned __int8 v20 = v6;
        if ([v14 generateRTCPXRSummaryReport:a3 reportCount:&v20])
        {
          unsigned __int8 v15 = v20;
          a3 += v20;
          *a4 += v20;
          v6 -= v15;
          BOOL v11 = 1;
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v19 = VRTraceErrorLogLevelToCSTR();
          unsigned int v16 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            uint64_t v22 = v19;
            __int16 v23 = 2080;
            long long v24 = "-[VCAudioStream generateRTCPXRSummaryReports:reportCount:]";
            __int16 v25 = 1024;
            int v26 = 546;
            _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d Failed to generate the RTCP XR statistics summary report.", buf, 0x1Cu);
          }
        }
      }
    }
    uint64_t v10 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v28 objects:v27 count:16];
  }
  while (v10);
  return v11;
}

- (BOOL)generateRTCPXRVoIPMetricsReports:(tagVCRTCPXRVoIPMetricsReport *)a3 reportCount:(char *)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  audioReceiver = self->_sourceContext.audioReceiver;
  if (!audioReceiver)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStream generateRTCPXRVoIPMetricsReports:reportCount:]();
      }
    }
    return 0;
  }
  char v7 = *a4;
  *a4 = 0;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  transportArray = self->super._transportArray;
  uint64_t v9 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v49 objects:v48 count:16];
  if (!v9) {
    return 0;
  }
  uint64_t v11 = v9;
  v46 = a4;
  BOOL v12 = 0;
  uint64_t v13 = *(void *)v50;
  *(void *)&long long v10 = 136315650;
  long long v44 = v10;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v50 != v13) {
        objc_enumerationMutation(transportArray);
      }
      unsigned __int8 v15 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      if (objc_msgSend(v15, "isRTCPXREnabled", v44))
      {
        unsigned __int8 v47 = v7;
        if ([v15 generateRTCPXRVoIPMetricsReport:a3 reportCount:&v47])
        {
          double DiscardRate = VCJitterBuffer_GetDiscardRate((uint64_t)audioReceiver->var2);
          float v17 = *(float *)&DiscardRate;
          int TargetTime = VCJitterBuffer_GetTargetTime(audioReceiver->var2);
          a3->int var1 = (int)(float)(v17 * 255.0);
          *(void *)buf = -1;
          int v19 = *(_DWORD *)&a3->var20;
          *(_DWORD *)&buf[8] = -1431655766;
          *(_DWORD *)v54 = v19;
          VCJitterBuffer_GetBurstMetrics((uint64_t)audioReceiver->var2, (uint64_t)buf);
          unsigned int v20 = vcvtd_n_s64_f64(*(float *)buf, 8uLL);
          unsigned int v21 = vcvtd_n_s64_f64(*(float *)&buf[4], 8uLL);
          if (v20 >= 0xFF) {
            LOBYTE(v20) = -1;
          }
          a3->var2 = v20;
          if (v21 >= 0xFF) {
            unsigned __int8 v22 = -1;
          }
          else {
            unsigned __int8 v22 = v21;
          }
          a3->var3 = v22;
          *(_DWORD *)&a3->int var4 = *(_DWORD *)&buf[8];
          unsigned __int16 v23 = TargetTime + 3;
          if ((TargetTime + 3) >= 0xFFFF) {
            unsigned __int16 v23 = -1;
          }
          a3->int var7 = v23;
          *(_DWORD *)&a3->var12 = 2139062143;
          *(_DWORD *)&a3->var8 = 276791167;
          a3->int var16 = -16;
          VCJitterBuffer_GetRTCPXRJitterBufferParameters((uint64_t)audioReceiver->var2, &a3->var17, &a3->var18, &a3->var19);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v24 = VRTraceErrorLogLevelToCSTR();
            __int16 v25 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int var20 = a3->var20;
              int var21 = a3->var21;
              int var0 = a3->var0;
              int var1 = a3->var1;
              LOBYTE(v26) = a3->var2;
              LOBYTE(v27) = a3->var3;
              int var4 = a3->var4;
              int var5 = a3->var5;
              int var6 = a3->var6;
              int var7 = a3->var7;
              int var11 = a3->var11;
              int var16 = a3->var16;
              int var17 = a3->var17;
              int var18 = a3->var18;
              int var19 = a3->var19;
              *(_DWORD *)buf = 136319746;
              *(void *)&uint8_t buf[4] = v24;
              *(_WORD *)v54 = 2080;
              *(void *)&v54[2] = "_VCAudioStream_FillRTCPXRVoIPMetricsReport";
              __int16 v55 = 1024;
              int v56 = 615;
              __int16 v57 = 2048;
              v58 = audioReceiver;
              __int16 v59 = 1024;
              int v60 = var20;
              __int16 v61 = 1024;
              int v62 = var21;
              __int16 v63 = 1024;
              int v64 = var0;
              __int16 v65 = 1024;
              int v66 = var1;
              __int16 v67 = 2048;
              double v68 = (double)v26 * 0.00390625 * 100.0;
              __int16 v69 = 2048;
              double v70 = (double)v27 * 0.00390625 * 100.0;
              __int16 v71 = 1024;
              int v72 = var4;
              __int16 v73 = 1024;
              int v74 = var5;
              __int16 v75 = 1024;
              int v76 = var6;
              __int16 v77 = 1024;
              int v78 = var7;
              __int16 v79 = 1024;
              int v80 = var11;
              __int16 v81 = 1024;
              int v82 = var16;
              __int16 v83 = 1024;
              int v84 = var17;
              __int16 v85 = 1024;
              int v86 = var18;
              __int16 v87 = 1024;
              int v88 = var19;
              _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d RTCP XR VOIP Metrics report audioReceiver=%p startSeq=%d endSeq=%d lossRate=%d discardRate=%d burstDensity=%f gapDensity=%f burstDuration=%d gapDuration=%d roundTripDelay=%d endSystemDelay=%d gmin=%d rxConfig=%d jbNominal=%d jbMax=%d jbAbsMax=%d", buf, 0x88u);
            }
          }
          unsigned __int8 v41 = v47;
          a3 += v47;
          *v46 += v47;
          v7 -= v41;
          BOOL v12 = 1;
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v45 = VRTraceErrorLogLevelToCSTR();
          uint64_t v42 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v44;
            *(void *)&uint8_t buf[4] = v45;
            *(_WORD *)v54 = 2080;
            *(void *)&v54[2] = "-[VCAudioStream generateRTCPXRVoIPMetricsReports:reportCount:]";
            __int16 v55 = 1024;
            int v56 = 634;
            _os_log_error_impl(&dword_1E1EA4000, v42, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d Failed to generate the RTCP XR VoIP metrics report.", buf, 0x1Cu);
          }
        }
      }
    }
    uint64_t v11 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v49 objects:v48 count:16];
  }
  while (v11);
  return v12;
}

- (void)startAudioWithCompletionHandler:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  VCMediaStream_Lock((uint64_t)self);
  uint64_t v12 = 0;
  currentAudioPayload = self->currentAudioPayload;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (currentAudioPayload)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v7;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAudioStream startAudioWithCompletionHandler:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 664;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = [(VCMediaStream *)self state] == 2;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d alreadyStarted = %d", buf, 0x22u);
      }
    }
    if ([(VCAudioStream *)self audioTransmitter]
      && ![(VCAudioTransmitter *)[(VCAudioStream *)self audioTransmitter] setupAudio:&v12])
    {
      VCMediaStream_Unlock((uint64_t)self);
      if (a3) {
        (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, v12);
      }
    }
    else
    {

      self->_allowedAudioPayloads = (NSMutableArray *)[(NSArray *)[(VCAudioTransmitter *)[(VCAudioStream *)self audioTransmitter] audioPayloads] mutableCopy];
      if (self->super._operatingMode == 6)
      {
        if (a3) {
          (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
        }
      }
      else
      {
        UInt32 v29 = 0;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v26 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        memset(buf, 0, sizeof(buf));
        AUIOGetAUNumber(&v29);
        [(VCAudioIO *)self->_audioIO setFarEndVersionInfo:buf];
        [(VCAudioIO *)self->_audioIO setRemoteCodecType:+[VCPayloadUtils audioCodecTypeForPayload:[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload]] sampleRate:(double)[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] codecSampleRate]];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          long long v10 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            audioIO = self->_audioIO;
            *(_DWORD *)uint64_t v13 = 136316162;
            uint64_t v14 = v9;
            __int16 v15 = 2080;
            unsigned int v16 = "-[VCAudioStream startAudioWithCompletionHandler:]";
            __int16 v17 = 1024;
            int v18 = 683;
            __int16 v19 = 2048;
            unsigned int v20 = self;
            __int16 v21 = 2048;
            unsigned __int8 v22 = audioIO;
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d (%p) starting audioIO=%p", v13, 0x30u);
          }
        }
        [(VCAudioIO *)self->_audioIO startWithCompletionHandler:a3];
      }
      [(VCAudioStream *)self reportingAlgosAudioStreamEvent:0];
      [(VCAudioTransmitter *)[(VCAudioStream *)self audioTransmitter] start];
      VCMediaStream_Unlock((uint64_t)self);
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStream startAudioWithCompletionHandler:]();
      }
    }
    VCMediaStream_Unlock((uint64_t)self);
    if (a3) {
      (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
    }
  }
}

- (void)stopAudioWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  VCMediaStream_Lock((uint64_t)self);
  if (self->super._operatingMode == 6)
  {
    (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
  }
  else
  {
    if ([(VCAudioIO *)self->_audioIO state])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        char v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          audioIO = self->_audioIO;
          int v8 = 136316162;
          uint64_t v9 = v5;
          __int16 v10 = 2080;
          uint64_t v11 = "-[VCAudioStream stopAudioWithCompletionHandler:]";
          __int16 v12 = 1024;
          int v13 = 701;
          __int16 v14 = 2048;
          __int16 v15 = self;
          __int16 v16 = 2048;
          __int16 v17 = audioIO;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d [%p] stopping audioIO=%p", (uint8_t *)&v8, 0x30u);
        }
      }
      [(VCAudioIO *)self->_audioIO stopWithCompletionHandler:a3];
    }
    else
    {
      (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
    }
    if ((self->super._operatingMode - 1) >= 2) {
      [(VCMediaStream *)self deregisterAggregationHandlers];
    }
  }
  [(VCAudioTransmitter *)[(VCAudioStream *)self audioTransmitter] stop];
  VCMediaStream_Unlock((uint64_t)self);
}

- (id)getSupportedPayloads
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = self->super._transportArray;
  uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v30 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v32;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = v4;
        uint64_t v5 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * v4) streamConfig];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        char v6 = objc_msgSend((id)objc_msgSend(v5, "allCodecConfigurations"), "allValues");
        uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v25 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v27 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [*(id *)(*((void *)&v26 + 1) + 8 * i) codecType]);
              if (v11 == 117)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v12 = VRTraceErrorLogLevelToCSTR();
                  int v13 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v20 = v12;
                    __int16 v21 = 2080;
                    unsigned __int8 v22 = "-[VCAudioStream getSupportedPayloads]";
                    __int16 v23 = 1024;
                    int v24 = 725;
                    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d Skip DTMF from supported payloads for AudioStream", buf, 0x1Cu);
                  }
                }
              }
              else
              {
                objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v11));
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v25 count:16];
          }
          while (v8);
        }
        uint64_t v4 = v18 + 1;
      }
      while (v18 + 1 != v17);
      uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v30 count:16];
    }
    while (v17);
  }
  return v3;
}

- (BOOL)setupPayloads
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(VCAudioStream *)self getSupportedPayloads];
  [(NSMutableArray *)self->audioPayloads removeAllObjects];
  self->currentAudioPayload = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v18 + 1) + 8 * i) unsignedIntValue];
        uint64_t v9 = [(VCAudioStream *)self addAudioPayload:v8];
        if (v8 == self->preferredAudioCodec) {
          self->currentAudioPayload = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v5);
  }
  currentAudioPayload = self->currentAudioPayload;
  if (currentAudioPayload) {
    goto LABEL_13;
  }
  if ([(NSMutableArray *)self->audioPayloads count])
  {
    currentAudioPayload = (VCAudioPayload *)[(NSMutableArray *)self->audioPayloads objectAtIndexedSubscript:0];
    self->currentAudioPayload = currentAudioPayload;
LABEL_13:
    if (!self->_useExternalIO)
    {
      double v11 = (double)[(VCAudioPayloadConfig *)[(VCAudioPayload *)currentAudioPayload config] samplesPerFrame];
      if (v11
         / (double)[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] inputSampleRate] >= 0.02)
      {
        unsigned int v13 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] samplesPerFrame];
      }
      else
      {
        int v12 = [(VCAudioStream *)self getPacketsPerBundleForStreamConfig:[(VCMediaStream *)self defaultStreamConfig]];
        unsigned int v13 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] samplesPerFrame]* v12;
      }
      self->_vpioFormat.samplesPerFrame = v13;
    }
    uint64_t v14 = [(VCAudioStream *)self preferredAudioBitrateForPayload:[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload]];
    if (v14) {
      [(VCAudioPayload *)self->currentAudioPayload setBitrate:v14];
    }
    LOBYTE(v15) = self->currentAudioPayload != 0;
    return v15;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v15) {
      return v15;
    }
    -[VCAudioStream setupPayloads]();
  }
  LOBYTE(v15) = 0;
  return v15;
}

- (id)codecConfigForOpusWithStreamConfig:(id)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend(a3, "codecConfigurations"), "objectForKeyedSubscript:", &unk_1F3DC35E8);
  if (!result)
  {
    uint64_t v5 = (void *)[a3 codecConfigurations];
    return (id)[v5 objectForKeyedSubscript:&unk_1F3DC3600];
  }
  return result;
}

- (void)getCodecConfigForPayload:(int)a3 block:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int64_t v6 = +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:");
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  transportArray = self->super._transportArray;
  uint64_t v8 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v31 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(transportArray);
        }
        int v12 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * i) streamConfig];
        unsigned int v13 = (void *)[v12 allCodecConfigurations];
        uint64_t v14 = objc_msgSend(v13, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v6));
        id v15 = (id)v14;
        if (a3 == 119 && !v14) {
          id v15 = [(VCAudioStream *)self codecConfigForOpusWithStreamConfig:v12];
        }
        if (v15)
        {
          (*((void (**)(id, void *))a4 + 2))(a4, v12);
          return;
        }
      }
      uint64_t v9 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v31 objects:v30 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  if ((VCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStream getCodecConfigForPayload:block:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v16 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      long long v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v21 = v17;
        __int16 v22 = 2080;
        __int16 v23 = "-[VCAudioStream getCodecConfigForPayload:block:]";
        __int16 v24 = 1024;
        int v25 = 805;
        __int16 v26 = 2112;
        long long v27 = v16;
        __int16 v28 = 2048;
        long long v29 = self;
        _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Failed to retrieve codec config.", buf, 0x30u);
      }
    }
  }
}

- (unsigned)preferredAudioBitrateForPayload:(int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unsigned int preferredMediaBitrate = self->_preferredMediaBitrate;
  if (!preferredMediaBitrate)
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x2020000000;
    int v9 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__VCAudioStream_preferredAudioBitrateForPayload___block_invoke;
    v5[3] = &unk_1E6DB57E8;
    v5[4] = &v6;
    [(VCAudioStream *)self getCodecConfigForPayload:*(void *)&a3 block:v5];
    unsigned int preferredMediaBitrate = *((_DWORD *)v7 + 6);
    _Block_object_dispose(&v6, 8);
  }
  return preferredMediaBitrate;
}

uint64_t __49__VCAudioStream_preferredAudioBitrateForPayload___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = +[VCPayloadUtils bitrateForCodecType:mode:](VCPayloadUtils, "bitrateForCodecType:mode:", [a3 codecType], objc_msgSend(a3, "preferredMode"));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (BOOL)shouldUseAACELDSBRForMode:(int64_t)a3
{
  return a3 != 11 && (a3 & 0xFFFFFFFFFFFFFFFELL) != 8;
}

+ (unsigned)audioChannelCountForMode:(id)a3
{
  uint64_t v4 = [a3 audioStreamMode];
  if (v4 != 8)
  {
    if (v4 == 11 || v4 == 9) {
      return 2;
    }
    return 1;
  }
  if (![a3 channelCount]) {
    return 1;
  }

  return [a3 channelCount];
}

+ (unsigned)audioIOTypeForMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 0xB) {
    return dword_1E259DE38[a3 - 1];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    unsigned int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    +[VCAudioStream audioIOTypeForMode:]();
  }
  return 0;
}

+ (id)newPayloadConfigForCodecConfig:(id)a3 streamConfig:(id)a4 inputSampleRate:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [a3 codecType]);
  uint64_t v10 = v9;
  if (v9 == 108)
  {
    int v11 = [a4 forceEVSWideBand];
    int v12 = kVCAudioPayloadConfigKeyPayloadType;
    uint64_t v13 = v10;
    if (v11)
    {
      [v8 setObject:&unk_1F3DC3618 forKeyedSubscript:@"vcAudioPayloadConfigKeyPayloadType"];
      int v12 = kVCAudioPayloadConfigKeyPayloadTypeOverride;
      uint64_t v13 = 108;
    }
  }
  else
  {
    int v12 = kVCAudioPayloadConfigKeyPayloadType;
    uint64_t v13 = v9;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v13), *v12);
  if ([a3 codecType] == 12)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", 320), @"vcAudioPayloadConfigKeyBlockSize");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", 16000), @"vcPayloadConfigKeySampleRate");
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v5), @"vcAudioPayloadConfigKeyInputSampleRate");
  if ((v10 - 97) <= 0x16 && ((1 << (v10 - 97)) & 0x404C03) != 0) {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "pTime") / 0x14uLL), @"vcPayloadConfigKeyInternalBundleFactor");
  }
  if ([a3 codecType] == 19)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", 480), @"vcAudioPayloadConfigKeyBlockSize");
    [v8 setObject:&unk_1F3DC3630 forKeyedSubscript:@"vcPayloadConfigKeySampleRate"];
    [v8 setObject:&unk_1F3DC3648 forKeyedSubscript:@"vcPayloadConfigKeyInternalBundleFactor"];
  }
  if ((v10 - 107) <= 4 && ((1 << (v10 - 107)) & 0x13) != 0)
  {
    if (+[VCAudioStream isTelephony:](VCAudioStream, "isTelephony:", [a4 audioStreamMode])) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = 8;
    }
    uint64_t IntValueForKey = VCDefaults_GetIntValueForKey(@"EVSSIDDuration", v15);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(a3, "evsChannelAwareOffset")), @"vcPayloadConfigKeyEVSChannelAwareOffset");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "evsHeaderFullOnly")), @"vcPayloadConfigKeyEVSHeaderFullOnly");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", IntValueForKey), @"vcPayloadConfigKeyEVSSIDPeriod");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "evsCMRMode")), @"vcPayloadConfigKeyEVSCMRMode");
  }
  if (VCPayloadUtils_supportsInternalDTXForPayload(v10)) {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isDTXEnabled")), @"vcPayloadConfigKeyDTXEnabled");
  }
  if ((v10 - 97) <= 1) {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isOctetAligned")), @"vcPayloadConfigKeyOctetAligned");
  }
  if ((v10 - 101) <= 5 && ((1 << (v10 - 101)) & 0x39) != 0)
  {
    BOOL v17 = +[VCAudioStream shouldUseAACELDSBRForMode:](VCAudioStream, "shouldUseAACELDSBRForMode:", [a4 audioStreamMode]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v17), @"vcPayloadConfigKeyUseSBR");
  }
  if ([a3 supportedModes]
    && +[VCPayloadUtils supportsCodecRateModesForCodecType:](VCPayloadUtils, "supportsCodecRateModesForCodecType:", [a3 codecType]))
  {
    int v33 = v10;
    long long v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "supportedModes"), "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v19 = (void *)[a3 supportedModes];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = +[VCPayloadUtils bitrateForCodecType:mode:](VCPayloadUtils, "bitrateForCodecType:mode:", [a3 codecType], objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "unsignedIntValue"));
          objc_msgSend(v18, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v24), objc_msgSend(v18, "count"));
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:v39 count:16];
      }
      while (v21);
    }
    [v8 setObject:v18 forKeyedSubscript:@"vcPayloadConfigKeyCodecBitrates"];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[VCPayloadUtils bitrateForCodecType:mode:](VCPayloadUtils, "bitrateForCodecType:mode:", objc_msgSend(a3, "codecType"), objc_msgSend(a3, "preferredMode"))), @"vcPayloadConfigKeyPreferredBitrate");

    LODWORD(v10) = v33;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "supportedBandwidths"), "count")
    && +[VCPayloadUtils supportsCodecBandwidthUpdateForCodecType:](VCPayloadUtils, "supportsCodecBandwidthUpdateForCodecType:", [a3 codecType]))
  {
    int v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "supportedBandwidths"), "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    __int16 v26 = (void *)[a3 supportedBandwidths];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v34 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(v26);
          }
          objc_msgSend(v25, "setObject:atIndexedSubscript:", *(void *)(*((void *)&v35 + 1) + 8 * j), objc_msgSend(v25, "count"));
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v35 objects:v34 count:16];
      }
      while (v28);
    }
    [v8 setObject:v25 forKeyedSubscript:@"vcAudioPayloadConfigKeySupportedBandwidths"];
  }
  if (v10 == 119) {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isOpusInBandFecEnabled")), @"vcAudioPayloadConfigKeyOPUSInBandFecEnabled");
  }
  long long v31 = [[VCAudioPayloadConfig alloc] initWithConfigDict:v8];

  return v31;
}

- (id)configForPayloadType:(int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__VCAudioStream_configForPayloadType___block_invoke;
  v5[3] = &unk_1E6DB5810;
  v5[4] = self;
  void v5[5] = &v6;
  [(VCAudioStream *)self getCodecConfigForPayload:*(void *)&a3 block:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __38__VCAudioStream_configForPayloadType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result = +[VCAudioStream newPayloadConfigForCodecConfig:a3 streamConfig:a2 inputSampleRate:*(double *)(*(void *)(a1 + 32) + 1072)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)addAudioPayload:(int)a3
{
  uint64_t v4 = [[VCAudioPayload alloc] initWithConfig:[(VCAudioStream *)self configForPayloadType:*(void *)&a3]];
  if (v4) {
    [(NSMutableArray *)self->audioPayloads addObject:v4];
  }

  return v4;
}

- (void)setDTXPayload:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "codecConfigurations"), "allValues");
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v9 isComfortNoise])
        {
          int v10 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [v9 codecType]);
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          audioPayloads = self->audioPayloads;
          uint64_t v12 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v18 objects:v17 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v19;
            while (2)
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v19 != v14) {
                  objc_enumerationMutation(audioPayloads);
                }
                uint64_t v16 = *(VCAudioPayload **)(*((void *)&v18 + 1) + 8 * j);
                if ([(VCAudioPayloadConfig *)[(VCAudioPayload *)v16 config] payload] == v10)
                {
                  self->currentDTXPayload = v16;
                  goto LABEL_20;
                }
              }
              uint64_t v13 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v18 objects:v17 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
LABEL_20:
          if (!self->currentDTXPayload) {
            self->currentDTXPayload = (VCAudioPayload *)-[VCAudioStream addAudioPayload:](self, "addAudioPayload:", +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [v9 codecType]));
          }
          return;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
}

- (BOOL)setReceiverPayloads
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  transportArray = self->super._transportArray;
  uint64_t v4 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v67 objects:v66 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  long long v38 = self;
  int v6 = 0;
  uint64_t v7 = *(void *)v68;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v68 != v7) {
        objc_enumerationMutation(transportArray);
      }
      v6 += objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * i), "streamConfig"), "codecConfigurations"), "count");
    }
    uint64_t v5 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v67 objects:v66 count:16];
  }
  while (v5);
  if (!v6) {
    return 0;
  }
  uint64_t v9 = (int *)malloc_type_calloc(v6, 0x24uLL, 0x1000040A310BA97uLL);
  if (!v9) {
    return 0;
  }
  int v10 = v9;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v38->super._transportArray;
  uint64_t v36 = [(NSMutableArray *)obj countByEnumeratingWithState:&v62 objects:v61 count:16];
  int v33 = v10;
  if (v36)
  {
    int v46 = 0;
    double v39 = v10 + 1;
    uint64_t v35 = *(void *)v63;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v63 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v11;
        uint64_t v12 = (void *)[*(id *)(*((void *)&v62 + 1) + 8 * v11) streamConfig];
        BOOL BoolValueForKey = VCDefaults_GetBoolValueForKey(@"dtmfTonePlaybackEnabled", [v12 dtmfTonePlaybackEnabled]);
        BOOL v14 = VCDefaults_GetBoolValueForKey(@"dtmfEventCallbacksEnabled", [v12 dtmfEventCallbacksEnabled]);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        uint64_t v45 = v12;
        id v44 = (id)objc_msgSend((id)objc_msgSend(v12, "codecConfigurations"), "allValues");
        uint64_t v15 = [v44 countByEnumeratingWithState:&v57 objects:v56 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v58;
          BOOL v41 = v14;
          BOOL v42 = BoolValueForKey;
          uint64_t v40 = *(void *)v58;
          do
          {
            uint64_t v18 = 0;
            uint64_t v43 = v16;
            do
            {
              if (*(void *)v58 != v17) {
                objc_enumerationMutation(v44);
              }
              long long v19 = *(void **)(*((void *)&v57 + 1) + 8 * v18);
              if (([v19 isDTMF] ^ 1 | (BoolValueForKey || v14)) == 1)
              {
                int v20 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [v19 codecType]);
                int v21 = v20;
                if ([v19 networkPayload] != 0xFFFF) {
                  int v21 = [v19 networkPayload];
                }
                if (v20 == 117) {
                  id v22 = 0;
                }
                else {
                  id v22 = +[VCAudioStream newPayloadConfigForCodecConfig:v19 streamConfig:v45 inputSampleRate:v38->_vpioFormat.format.mSampleRate];
                }
                if (v46 >= 1)
                {
                  uint64_t v23 = v46;
                  long long v24 = v39;
                  do
                  {
                    if (*(v24 - 1) == v20)
                    {
                      if (*v24 == v21) {
                        goto LABEL_38;
                      }
                      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                      {
                        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
                        long long v26 = *MEMORY[0x1E4F47A50];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                        {
                          int v27 = *v24;
                          *(_DWORD *)buf = 136316418;
                          uint64_t v48 = v25;
                          __int16 v49 = 2080;
                          long long v50 = "-[VCAudioStream setReceiverPayloads]";
                          __int16 v51 = 1024;
                          int v52 = 1050;
                          __int16 v53 = 1024;
                          *(_DWORD *)v54 = v27;
                          *(_WORD *)&v54[4] = 1024;
                          *(_DWORD *)&v54[6] = v21;
                          LOWORD(v55) = 1024;
                          *(_DWORD *)((char *)&v55 + 2) = v20;
                          _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d Multiple network payloads=%d, %d for internal payload=%d. Creating decoders for both", buf, 0x2Eu);
                        }
                      }
                    }
                    v24 += 9;
                    --v23;
                  }
                  while (v23);
                }
                *int v10 = v20;
                v10[1] = v21;
                *((unsigned char *)v10 + 16) = [v19 isOctetAligned];
                *((unsigned char *)v10 + 32) = [v19 evsHeaderFullOnly];
                *((unsigned char *)v10 + 25) = [v19 isOpusInBandFecEnabled];
                v10[7] = 0;
                if (v20 == 119 && [v22 codecSampleRate] == 48000) {
                  v10[7] = [v22 codecSampleRate];
                }
                v10[5] = [v45 bundlingScheme];
                v10[3] = [v22 flags];
                v10[2] = [v22 samplesPerFrame];
                *((unsigned char *)v10 + 24) = [v45 forceEVSWideBand];
                *((unsigned char *)v10 + 17) = v38->_sourceContext.audioReceiver->var0.var21;
                ++v46;
                v10 += 9;
LABEL_38:
                BOOL v14 = v41;
                BOOL BoolValueForKey = v42;
                uint64_t v17 = v40;
                uint64_t v16 = v43;
              }
              ++v18;
            }
            while (v18 != v16);
            uint64_t v16 = [v44 countByEnumeratingWithState:&v57 objects:v56 count:16];
          }
          while (v16);
        }
        uint64_t v11 = v37 + 1;
      }
      while (v37 + 1 != v36);
      uint64_t v36 = [(NSMutableArray *)obj countByEnumeratingWithState:&v62 objects:v61 count:16];
    }
    while (v36);
  }
  else
  {
    int v46 = 0;
  }
  BOOL v28 = VCAudioReceiver_SetupDecoders((uint64_t)v38->_sourceContext.audioReceiver, (uint64_t)v33, v46, (long long *)&v38->_vpioFormat, 0);
  if (!v28)
  {
    if ((VCAudioStream *)objc_opt_class() == v38)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStream setReceiverPayloads]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v29 = (__CFString *)[(VCAudioStream *)v38 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v29 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v30 = VRTraceErrorLogLevelToCSTR();
        long long v31 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v48 = v30;
          __int16 v49 = 2080;
          long long v50 = "-[VCAudioStream setReceiverPayloads]";
          __int16 v51 = 1024;
          int v52 = 1078;
          __int16 v53 = 2112;
          *(void *)v54 = v29;
          *(_WORD *)&v54[8] = 2048;
          __int16 v55 = v38;
          _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Failed to setup receiver decoders.", buf, 0x30u);
        }
      }
    }
  }
  free(v33);
  return v28;
}

- (double)lastReceivedRTPPacketTime
{
  return VCAudioReceiver_GetLatestAudioTimestamp((uint64_t)self->_sourceContext.audioReceiver);
}

- (double)lastReceivedRTCPPacketTime
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  transportArray = self->super._transportArray;
  uint64_t v3 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (!v3) {
    return NAN;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v14;
  double v6 = NAN;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v14 != v5) {
        objc_enumerationMutation(transportArray);
      }
      uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      [v8 lastReceivedRTCPPacketTime];
      [v8 lastReceivedRTCPPacketTime];
      if (v9 > v6)
      {
        [v8 lastReceivedRTCPPacketTime];
        double v6 = v10;
      }
    }
    uint64_t v4 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v13 objects:v12 count:16];
  }
  while (v4);
  return v6;
}

- (void)updateSyncSourceState:(int)a3
{
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  syncSourceDelegates = self->_syncSourceDelegates;
  if (syncSourceDelegates)
  {
    int Count = CFArrayGetCount(syncSourceDelegates);
    CFIndex v8 = (Count - 1);
    if (Count - 1 >= 0)
    {
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(self->_syncSourceDelegates, v8);
        VCMediaStreamSyncSourceDelegate_updateSourceState((uint64_t)ValueAtIndex, a3);
        --v8;
        --Count;
      }
      while (Count);
    }
  }

  os_unfair_lock_unlock(p_delegateLock);
}

- (void)willExitState:(int)a3 newState:(int)a4
{
  if (a3 == 2) {
    -[VCAudioStream updateSyncSourceState:](self, "updateSyncSourceState:", 1, *(void *)&a4);
  }
}

- (void)didEnterState:(int)a3 oldState:(int)a4
{
  if (a3 == 2 && self->super._operatingMode != 5) {
    -[VCAudioStream updateSyncSourceState:](self, "updateSyncSourceState:", 0, *(void *)&a4);
  }
}

+ (int)operatingModeForAudioStreamMode:(int64_t)a3
{
  if ((unint64_t)a3 < 0xC) {
    return dword_1E259DE64[a3];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    +[VCAudioStream operatingModeForAudioStreamMode:]();
  }
  return 0;
}

+ (unsigned)audioIODirectionWithMediaStreamDirection:(int64_t)a3
{
  unsigned int v3 = 0x3010200u >> (8 * a3);
  if ((unint64_t)a3 >= 4) {
    LOBYTE(v3) = 0;
  }
  return v3 & 3;
}

- (void)setDeviceRoleForAudioStreamMode:(int64_t)a3 direction:(int64_t)a4
{
  if ((unint64_t)a3 <= 0xB)
  {
    if (((1 << a3) & 0xAB2) != 0)
    {
LABEL_3:
      uint64_t v4 = 0;
LABEL_6:
      [(VCAudioStream *)self setDeviceRole:v4];
      return;
    }
    if (((1 << a3) & 0x44C) != 0)
    {
      uint64_t v4 = 3;
      goto LABEL_6;
    }
    if (a3 == 8)
    {
      if ((unint64_t)(a4 - 2) < 2)
      {
        uint64_t v4 = 7;
        goto LABEL_6;
      }
      if (a4)
      {
        if (a4 != 1) {
          return;
        }
        uint64_t v4 = 8;
        goto LABEL_6;
      }
      goto LABEL_3;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioStream setDeviceRoleForAudioStreamMode:direction:]();
    }
  }
}

- (void)setupAudioPowerSpectrum
{
  self->_audioPowerSpectrumSourceUplink = [[VCAudioPowerSpectrumSource alloc] initWithStreamToken:self->super._streamTokenUplink delegate:0];
  [+[VCAudioPowerSpectrumManager sharedInstance] registerAudioPowerMeterSource:self->_audioPowerSpectrumSourceUplink];
  self->_audioPowerSpectrumSourceDownlink = [[VCAudioPowerSpectrumSource alloc] initWithStreamToken:self->super._streamTokenDownlink delegate:0];
  unsigned int v3 = +[VCAudioPowerSpectrumManager sharedInstance];
  audioPowerSpectrumSourceDownlink = self->_audioPowerSpectrumSourceDownlink;

  [(VCAudioPowerSpectrumManager *)v3 registerAudioPowerMeterSource:audioPowerSpectrumSourceDownlink];
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
}

- (void)setUpMediaRecorder
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Failed to allocate the media recorder", v2, v3, v4, v5, v6);
}

- (void)cleanUpMediaRecorder
{
  mediaRecorder = self->_mediaRecorder;
  if (mediaRecorder)
  {
    [(VCMediaRecorder *)mediaRecorder invalidate];

    self->_mediaRecorder = 0;
  }
}

- (void)setupCaptionsCoordinatorsWithFormat:(tagVCAudioFrameFormat *)a3 direction:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!self->_shouldSetUpCaptions)
  {
LABEL_22:
    [(VCAudioStream *)self cleanUpCaptionsCoordinators];
    return;
  }
  if (self->_isCaptionsFormatValid)
  {
    if (!memcmp(&self->_captionsFormat, a3, 0x30uLL)) {
      return;
    }
    [(VCAudioStream *)self cleanUpCaptionsCoordinators];
  }
  uint8_t v6 = [[VCAudioCaptionsCoordinator alloc] initWithOneToOneEnabled:1 isLocal:0 taskIdentifier:@"callrecordingcaptions" reportingAgent:[(VCObject *)self reportingAgent]];
  self->_captionsCoordinator = v6;
  if (!v6)
  {
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStream setupCaptionsCoordinatorsWithFormat:direction:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        long long v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = v13;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAudioStream setupCaptionsCoordinatorsWithFormat:direction:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 1280;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v12;
          *(_WORD *)&buf[38] = 2048;
          *(void *)&buf[40] = self;
          _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Failed to allocate the captions coordinator", buf, 0x30u);
        }
      }
    }
    goto LABEL_22;
  }
  self->_isCaptionsFormatValid = 1;
  long long v8 = *(_OWORD *)&self->_vpioFormat.format.mBytesPerPacket;
  long long v7 = *(_OWORD *)&self->_vpioFormat.format.mBitsPerChannel;
  *(_OWORD *)&self->_captionsFormat.format.mSampleRate = *(_OWORD *)&self->_vpioFormat.format.mSampleRate;
  *(_OWORD *)&self->_captionsFormat.format.mBytesPerPacket = v8;
  *(_OWORD *)&self->_captionsFormat.format.mBitsPerChannel = v7;
  double v9 = &OBJC_IVAR___VCMediaStream__streamTokenUplink;
  if (a4 != 1)
  {
    if (a4 == 3)
    {
      memset(&buf[16], 170, 32);
      *(_OWORD *)buf = xmmword_1E259DE00;
      long long v10 = *(_OWORD *)&self->_vpioFormat.format.mSampleRate;
      *(_OWORD *)&buf[24] = *(_OWORD *)&self->_vpioFormat.format.mBytesPerPacket;
      *(void *)buf = self->super._streamTokenUplink;
      *(void *)&buf[40] = *(void *)&self->_vpioFormat.format.mBitsPerChannel;
      unint64_t v18 = 0xAAAAAAAAAAAAAA01;
      *(_OWORD *)&buf[8] = v10;
      [(VCAudioCaptionsCoordinator *)self->_captionsCoordinator registerStreamWithConfig:buf];
    }
    double v9 = &OBJC_IVAR___VCMediaStream__streamTokenDownlink;
  }
  *(_OWORD *)long long v15 = xmmword_1E259DE00;
  memset(&v15[16], 170, 32);
  long long v11 = *(_OWORD *)&self->_captionsFormat.format.mBytesPerPacket;
  *(_OWORD *)&v15[8] = *(_OWORD *)&self->_captionsFormat.format.mSampleRate;
  *(void *)long long v15 = *(Class *)((char *)&self->super.super.super.isa + *v9);
  *(_OWORD *)&v15[24] = v11;
  *(void *)&v15[40] = *(void *)&self->_captionsFormat.format.mBitsPerChannel;
  unint64_t v16 = 0xAAAAAAAAAAAAAA00;
  [(VCAudioCaptionsCoordinator *)self->_captionsCoordinator registerStreamWithConfig:v15];
}

- (void)cleanUpCaptionsCoordinators
{
  self->_captionsCoordinator = 0;
  self->_isCaptionsFormatValid = 0;
}

- (VCAudioStream)initWithClientPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCAudioStream;
  uint64_t v4 = [(VCMediaStream *)&v7 initWithTransportSessionID:0];
  uint64_t v5 = v4;
  if (v4
    && ![(VCAudioStream *)v4 setupAudioStreamWithClientPid:v3 enableAudioPowerSpectrum:1])
  {

    return 0;
  }
  return v5;
}

- (VCAudioStream)initWithClientPid:(int)a3 ssrc:(unsigned int)a4 transportSessionID:(unsigned int)a5 streamToken:(int64_t)a6
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VCAudioStream;
  objc_super v7 = [(VCMediaStream *)&v10 initWithTransportSessionID:*(void *)&a5 localSSRC:*(void *)&a4 streamToken:a6];
  uint64_t v8 = v7;
  if (v7
    && ![(VCAudioStream *)v7 setupAudioStreamWithClientPid:v6 enableAudioPowerSpectrum:0])
  {

    return 0;
  }
  return v8;
}

- (id)setLocalParticipantInfo:(id)a3 networkSockets:(id)a4 withError:(id *)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCAudioStream;
  v12[0] = 0;
  id v8 = [(VCMediaStream *)&v11 setLocalParticipantInfo:a3 networkSockets:a4 withError:v12];
  if (v12[0])
  {
    double v9 = 0;
    if (!a5) {
      return v9;
    }
    goto LABEL_7;
  }
  double v9 = v8;
  if (self->_enableAudioPowerSpectrum)
  {
    double v9 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", self->super._streamTokenUplink), @"avcKeyAudioPowerSpectrumTokenInput");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", self->super._streamTokenDownlink), @"avcKeyAudioPowerSpectrumTokenOutput");
  }
  self->_shouldSetUpCaptions = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamSetUpCaptioning"), "BOOLValue");
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamSetUpRecording"), "BOOLValue"))-[VCAudioStream setUpMediaRecorder](self, "setUpMediaRecorder"); {
  if (a5)
  }
LABEL_7:
    *a5 = (id)v12[0];
  return v9;
}

- (BOOL)setupAudioStreamWithClientPid:(int)a3 enableAudioPowerSpectrum:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  VRTraceReset();
  VRTracePrintLoggingInfo();
  if ((AVConferenceServer_ProcessIsAvconferenced() & 1) == 0) {
    SoundDec_PrepareAudioConverter();
  }
  self->_clientPid = a3;
  self->_currentDTXEnable = 1;
  self->_audioSessionId = VCUniqueIDGenerator_GenerateID();
  pthread_rwlock_init(&self->stateLock, 0);
  +[GKSConnectivitySettings getRemoteMediaStallTimeout];
  self->_remoteMediaStallTimeout = v7;
  self->_sourceContext.volume = -1.0;
  self->_sourceContext.self = self;
  self->_sourceContext.remoteMediaStallTimeout = v7;
  VCSingleLinkedListInitialize((uint64_t)&self->_sourceContext.transports, (uint64_t)_VCAudioStreamSourceContextTransportCompare);
  self->audioPayloads = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  self->_allowedAudioPayloads = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  self->_syncSourceDelegates = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  CMSimpleQueueCreate(v8, 100, &self->_syncSourceDelegateQueue);
  self->_delegateLock._os_unfair_lock_opaque = 0;
  self->_runLock = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  VCSingleLinkedListInitialize((uint64_t)&self->_sourceContext.syncDelegateList, (uint64_t)_VCAudioStreamSyncDelegateCompare);
  if (self->audioPayloads)
  {
    self->preferredAudioCodec = 98;
    double v9 = objc_alloc_init(DTMFEventHandler);
    self->dtmfEventHandler = v9;
    if (v9)
    {
      [(VCObject *)self setReportingAgent:0];
      self->_enableAudioPowerSpectrum = v4;
      if (v4) {
        [(VCAudioStream *)self setupAudioPowerSpectrum];
      }
      [(VCAudioStream *)self registerForThermalNotifications];
      self->super._notificationHandler = _VCAudioStream_NWConnectionNotificationHandler;
      if ((VCAudioStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_27;
        }
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        long long v14 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        int v26 = 136315650;
        uint64_t v27 = v13;
        __int16 v28 = 2080;
        uint64_t v29 = "-[VCAudioStream setupAudioStreamWithClientPid:enableAudioPowerSpectrum:]";
        __int16 v30 = 1024;
        int v31 = 1423;
        long long v15 = "VCAudioStream [%s] %s:%d ";
        unint64_t v16 = v14;
        uint32_t v17 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          objc_super v10 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
        }
        else {
          objc_super v10 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_27;
        }
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        int v20 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        int v26 = 136316162;
        uint64_t v27 = v19;
        __int16 v28 = 2080;
        uint64_t v29 = "-[VCAudioStream setupAudioStreamWithClientPid:enableAudioPowerSpectrum:]";
        __int16 v30 = 1024;
        int v31 = 1423;
        __int16 v32 = 2112;
        int v33 = v10;
        __int16 v34 = 2048;
        uint64_t v35 = self;
        long long v15 = "VCAudioStream [%s] %s:%d %@(%p) ";
        unint64_t v16 = v20;
        uint32_t v17 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v26, v17);
LABEL_27:
      LOBYTE(v18) = 1;
      return v18;
    }
    if ((VCAudioStream *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_40;
      }
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      id v22 = *MEMORY[0x1E4F47A50];
      BOOL v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v18) {
        return v18;
      }
      int v26 = 136316162;
      uint64_t v27 = v24;
      __int16 v28 = 2080;
      uint64_t v29 = "-[VCAudioStream setupAudioStreamWithClientPid:enableAudioPowerSpectrum:]";
      __int16 v30 = 1024;
      int v31 = 1408;
      __int16 v32 = 2112;
      int v33 = v12;
      __int16 v34 = 2048;
      uint64_t v35 = self;
      uint64_t v23 = "VCAudioStream [%s] %s:%d %@(%p) Failed to allocate the DTMF event handler";
      goto LABEL_39;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v18) {
        return v18;
      }
      -[VCAudioStream setupAudioStreamWithClientPid:enableAudioPowerSpectrum:]();
    }
    goto LABEL_40;
  }
  if ((VCAudioStream *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      objc_super v11 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
    }
    else {
      objc_super v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_40;
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    id v22 = *MEMORY[0x1E4F47A50];
    BOOL v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v18) {
      return v18;
    }
    int v26 = 136316162;
    uint64_t v27 = v21;
    __int16 v28 = 2080;
    uint64_t v29 = "-[VCAudioStream setupAudioStreamWithClientPid:enableAudioPowerSpectrum:]";
    __int16 v30 = 1024;
    int v31 = 1401;
    __int16 v32 = 2112;
    int v33 = v11;
    __int16 v34 = 2048;
    uint64_t v35 = self;
    uint64_t v23 = "VCAudioStream [%s] %s:%d %@(%p) Failed to allocate audio payloads";
LABEL_39:
    _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v26, 0x30u);
    goto LABEL_40;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
  {
LABEL_40:
    LOBYTE(v18) = 0;
    return v18;
  }
  VRTraceErrorLogLevelToCSTR();
  BOOL v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v18)
  {
    -[VCAudioStream setupAudioStreamWithClientPid:enableAudioPowerSpectrum:]();
    goto LABEL_40;
  }
  return v18;
}

- (void)dealloc
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ((VCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v4;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCAudioStream dealloc]";
        __int16 v26 = 1024;
        int v27 = 1429;
        uint64_t v6 = "VCAudioStream [%s] %s:%d ";
        double v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      objc_super v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v9;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCAudioStream dealloc]";
        __int16 v26 = 1024;
        int v27 = 1429;
        __int16 v28 = 2112;
        uint64_t v29 = v3;
        __int16 v30 = 2048;
        int v31 = self;
        uint64_t v6 = "VCAudioStream [%s] %s:%d %@(%p) ";
        double v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  [(VCAudioStream *)self reportingAlgosAudioStreamEvent:4];
  while (1)
  {
    objc_super v11 = VCSingleLinkedListPop((uint64_t *)&self->_sourceContext.transports);
    if (!v11) {
      break;
    }
    free(v11);
  }
  _VCAudioStream_ProcessDelegateEventQueue((uint64_t)self);
  while (1)
  {
    *(void *)buf = VCSingleLinkedListPop((uint64_t *)&self->_sourceContext.syncDelegateList);
    if (!*(void *)buf) {
      break;
    }
    _VCAudioStream_ReleaseSyncDelegateEvent((uint64_t *)buf, 0);
  }
  pthread_rwlock_destroy(&self->stateLock);
  pausedAudioHeartBeat = self->pausedAudioHeartBeat;
  if (pausedAudioHeartBeat) {
    dispatch_release(pausedAudioHeartBeat);
  }

  audioReceiver = self->_sourceContext.audioReceiver;
  if (audioReceiver)
  {
    VCAudioReceiver_Finalize(&audioReceiver->var0.var0);
    self->_sourceContext.audioReceiver = 0;
  }
  syncSourceDelegates = self->_syncSourceDelegates;
  if (syncSourceDelegates) {
    CFRelease(syncSourceDelegates);
  }
  syncSourceDelegateQueue = self->_syncSourceDelegateQueue;
  if (syncSourceDelegateQueue) {
    CFRelease(syncSourceDelegateQueue);
  }
  runLock = self->_runLock;
  if (runLock) {
    dispatch_release(runLock);
  }

  reportingSSRCList = self->_reportingSSRCList;
  if (reportingSSRCList)
  {
    free(reportingSSRCList);
    self->_reportingSSRCList = 0;
  }

  [(VCAudioStream *)self setFrequencyMeteringEnabled:0 meterType:0];
  [(VCAudioStream *)self setFrequencyMeteringEnabled:0 meterType:1];
  [(VCObject *)self reportingAgent];
  reportingCacheModuleSpecificInfo();

  unsigned int operatingMode = self->super._operatingMode;
  if (operatingMode > 6 || ((1 << operatingMode) & 0x46) == 0) {
    [(VCMediaStream *)self deregisterAggregationHandlers];
  }
  [(VCAudioStream *)self unregisterForThermalNotifications];
  if (self->_enableAudioPowerSpectrum)
  {
    uint64_t v19 = +[VCAudioPowerSpectrumManager sharedInstance];
    -[VCAudioPowerSpectrumManager unregisterAudioPowerSpectrumSourceForStreamToken:](v19, "unregisterAudioPowerSpectrumSourceForStreamToken:", [NSNumber numberWithInteger:self->super._streamTokenUplink]);
    int v20 = +[VCAudioPowerSpectrumManager sharedInstance];
    -[VCAudioPowerSpectrumManager unregisterAudioPowerSpectrumSourceForStreamToken:](v20, "unregisterAudioPowerSpectrumSourceForStreamToken:", [NSNumber numberWithInteger:self->super._streamTokenDownlink]);
    [(VCAudioPowerSpectrumSource *)self->_audioPowerSpectrumSourceUplink invalidate];

    [(VCAudioPowerSpectrumSource *)self->_audioPowerSpectrumSourceDownlink invalidate];
  }
  statsCollector = self->_statsCollector;
  if (statsCollector)
  {
    CFRelease(statsCollector);
    self->_statsCollector = 0;
  }

  [(VCAudioStream *)self cleanUpCaptionsCoordinators];
  [(VCAudioStream *)self cleanUpMediaRecorder];
  v22.receiver = self;
  v22.super_class = (Class)VCAudioStream;
  [(VCMediaStream *)&v22 dealloc];
}

- (void)handleThermalPressureNotification:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"VCVideoCaptureServer_NotificationKeyThermalPressureLevel"), "intValue");
  uint64_t v4 = @"Thermal";
  v5[0] = [NSNumber numberWithUnsignedInt:v3];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  reportingGenericEvent();
}

- (void)registerForThermalNotifications
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];

  [v3 addObserver:self selector:sel_handleThermalPressureNotification_ name:@"VCVideoCaptureServer_NotificationNameThermalPressureLevel" object:0];
}

- (void)unregisterForThermalNotifications
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];

  [v3 removeObserver:self name:@"VCVideoCaptureServer_NotificationNameThermalPressureLevel" object:0];
}

- (int)getPacketsPerBundleForStreamConfig:(id)a3
{
  int64_t v5 = +[VCPayloadUtils codecTypeForPayload:[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload]];
  uint64_t v6 = (void *)[a3 allCodecConfigurations];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v5)), "pTime");
  if ([(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload] == 106)
  {
    if (v7 == 60) {
      return 2;
    }
    else {
      return 1;
    }
  }
  else if ([(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload] == 104)
  {
    if (v7 == 60) {
      int v9 = 3;
    }
    else {
      int v9 = 1;
    }
    if (v7 == 40) {
      return 2;
    }
    else {
      return v9;
    }
  }
  else
  {
    int v10 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload];
    if (v7 == 40) {
      int v11 = 4;
    }
    else {
      int v11 = 1;
    }
    if (v7 == 20) {
      int v11 = 2;
    }
    if (v10 == 101) {
      return v11;
    }
    else {
      return 1;
    }
  }
}

- (void)configureAudioJBAlgos:(tagVCAudioReceiverConfig *)a3
{
  int64_t v5 = [(VCMediaStream *)self defaultStreamConfig];
  uint64_t v6 = v5;
  BOOL isTelephony = self->_isTelephony;
  uint64_t v8 = 2;
  if (self->_isTelephony)
  {
    BOOL v9 = 1;
  }
  else
  {
    unsigned int v10 = [(VCMediaStreamConfig *)v5 channelCount];
    BOOL v9 = v10 < 2;
    if (v10 >= 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 3;
    }
  }
  a3->int var6 = VCDefaults_GetIntValueForKey(@"audioTimescaleAlgorithm", v8);
  a3->int var20 = VCDefaults_GetIntValueForKey(@"audioJitterBufferQueueManagementAlgo", v9);
  a3->int var18 = VCDefaults_GetBoolValueForKey(@"audioJitterBufferDisableSpikeManagement", isTelephony);
  BOOL var11 = a3->var11;
  if (a3->var11) {
    BOOL var11 = [(VCMediaStreamConfig *)v6 channelCount] < 2;
  }
  a3->int var7 = var11;
  if (+[GKSConnectivitySettings supportsEVSCodec]) {
    BOOL v12 = +[VCAudioStream isVoLTE:[(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] audioStreamMode]];
  }
  else {
    BOOL v12 = 0;
  }
  a3->int var21 = VCDefaults_GetBoolValueForKey(@"enableEVSWidebandDecodeForAMRWideband", v12);
}

- (BOOL)createAudioReceiver
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v81 = 0u;
  memset(v80, 0, sizeof(v80));
  unsigned int v3 = [(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] remoteSSRC];
  long long v4 = 0uLL;
  if (!v3)
  {
    if (self->super._callID)
    {
      *(void *)buf = 0;
      uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"^\\d{1,10}$", 0, buf, 0.0), "numberOfMatchesInString:options:range:", self->super._callID, 0, 0, -[NSString length](self->super._callID, "length"));
      callID = self->super._callID;
      if (v5 == 1) {
        unsigned int v3 = [(NSString *)callID integerValue];
      }
      else {
        unsigned int v3 = [(NSString *)callID hash];
      }
      long long v4 = 0uLL;
    }
    else
    {
      unsigned int v3 = 0;
    }
  }
  unsigned int v62 = v3;
  long long v78 = v4;
  long long v79 = v4;
  long long v76 = v4;
  long long v77 = v4;
  obuint64_t j = self->super._transportArray;
  uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v76 objects:v75 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v77;
    *(void *)&long long v8 = 136315650;
    long long v61 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v77 != v10) {
          objc_enumerationMutation(obj);
        }
        BOOL v12 = *(void **)(*((void *)&v76 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend((id)objc_msgSend(v12, "streamConfig", v61), "multiwayConfig");
        long long v14 = v13;
        if (v13) {
          BOOL v15 = 0;
        }
        else {
          BOOL v15 = !self->_sourceContext.isMultiwayConfig;
        }
        BOOL v16 = !v15;
        self->_sourceContext.isMultiwayConfig = v16;
        char v17 = [v13 hasIdsStreamID];
        *((unsigned char *)&v80[1] + 56 * LODWORD(v80[0]) + 2) = v17;
        if ([v14 hasIdsStreamID])
        {
          __int16 v18 = [v12 idsStreamId];
          *((_WORD *)&v80[1] + 28 * LODWORD(v80[0])) = v18;
        }
        char v19 = [v14 isOneToOne];
        int v20 = (char *)v80 + 56 * LODWORD(v80[0]) + 8;
        v20[11] = v19;
        *((_DWORD *)v20 + 6) = 1;
        uint64_t v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "streamConfig"), "rateControlConfig"), "mediaControlInfoGenerator");
        *((void *)&v80[3] + 7 * LODWORD(v80[0])) = v21;
        uint64_t v22 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "streamConfig"), "rateControlConfig"), "statisticsCollector");
        *((void *)&v80[3] + 7 * LODWORD(v80[0]) + 1) = v22;
        if ([v14 isOneToOne])
        {
          *((_DWORD *)&v80[2] + 14 * LODWORD(v80[0])) = 0;
          char v23 = [v14 shouldIgnoreRTPHeaderExtensions];
          *((unsigned char *)&v80[2] + 56 * LODWORD(v80[0]) + 4) = v23;
          self->_sourceContext.oneToOneStreamID = [v12 idsStreamId];
          self->_sourceContext.oneToOneStatisticsCollector = [(VCMediaStreamRateControlConfig *)[(VCMediaStreamConfig *)[(VCMediaStream *)self oneToOneStreamConfig] rateControlConfig] statisticsCollector];
          __int16 v24 = [(VCMediaStreamRateControlConfig *)[(VCMediaStreamConfig *)[(VCMediaStream *)self oneToOneStreamConfig] rateControlConfig] statisticsCollector];
          *((void *)&v80[3] + 7 * LODWORD(v80[0]) + 1) = v24;
          if (!self->super._isWRMinitialized)
          {
            if ([(VCMediaStream *)self networkFeedbackController])
            {
              -[VCMediaStream initializeWRMUsingRtpHandle:](self, "initializeWRMUsingRtpHandle:", [v12 rtpHandle]);
              self->super._isWRMinitialized = 1;
            }
            else if (!self->super._isWRMinitialized {
                   && ![(VCMediaStream *)self networkFeedbackController]
            }
                   && (int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v28 = VRTraceErrorLogLevelToCSTR();
              uint64_t v29 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v61;
                *(void *)&uint8_t buf[4] = v28;
                __int16 v65 = 2080;
                int v66 = "-[VCAudioStream createAudioReceiver]";
                __int16 v67 = 1024;
                int v68 = 1629;
                _os_log_error_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d NetworkFeedbackController is nil in AudioStream", buf, 0x1Cu);
              }
            }
          }
        }
        else
        {
          *((void *)&v89 + 1) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "streamConfig"), "rateControlConfig"), "statisticsCollector");
        }
        uint64_t v25 = [v12 rtpHandle];
        *((void *)v80 + 7 * LODWORD(v80[0]) + 1) = v25;
        uint64_t v26 = [v12 receiverSframeCryptor];
        unsigned int v27 = LODWORD(v80[0])++;
        *((void *)&v80[1] + 7 * v27 + 1) = v26;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v30 = [(NSMutableArray *)obj countByEnumeratingWithState:&v76 objects:v75 count:16];
      uint64_t v9 = v30;
    }
    while (v30);
  }
  int v31 = [(VCMediaStream *)self defaultStreamConfig];
  BOOL BoolValueForKey = VCDefaults_GetBoolValueForKey(@"useErasureSensitiveMode", 0);
  int v33 = 0;
  if (!BoolValueForKey) {
    int v33 = [(VCMediaStreamConfig *)v31 jitterBufferMode];
  }
  DWORD1(v82) = v33;
  if (+[VCAudioStream isVoWiFi:[(VCMediaStreamConfig *)v31 audioStreamMode]])
  {
    if (self->_shouldEnableJBLatencySenstiveModeForVoWiFi)
    {
      DWORD1(v82) = 1;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v34 = VRTraceErrorLogLevelToCSTR();
        uint64_t v35 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = v34;
          __int16 v65 = 2080;
          int v66 = "-[VCAudioStream createAudioReceiver]";
          __int16 v67 = 1024;
          int v68 = 1642;
          _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d Using the jitter buffer latency sensitive mode for VoWiFi", buf, 0x1Cu);
        }
      }
    }
  }
  DWORD2(v82) = [(VCMediaStreamConfig *)v31 fixedJitterBufferSize];
  BOOL v36 = ([(VCMediaStreamConfig *)v31 isLowLatency] & 1) != 0
     || [(VCMediaStreamConfig *)v31 audioStreamMode] == 9;
  BYTE8(v91) = v36;
  LODWORD(v82) = v62;
  *((void *)&v81 + 1) = [(VCMediaStream *)self mediaControlInfoGenerator];
  BYTE4(v83) = self->super._operatingMode == 6;
  *((void *)&v83 + 1) = [(VCObject *)self reportingAgent];
  BYTE4(v84) = self->super._operatingMode == 6;
  LODWORD(v84) = self->_reportingModuleID;
  BYTE11(v85) = [(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] enableMaxBitrateOnNoChangeCMR];
  BYTE10(v85) = 0;
  *((void *)&v86 + 1) = self;
  *(void *)&long long v87 = _VCAudioStream_UpdateSourceNTPToRTPTimeMappingCallback;
  *((void *)&v87 + 1) = _VCAudioStream_StreamSwitchCallback;
  *(void *)&long long v88 = VCMediaStream_RTCPPacketsCallback;
  *(void *)&long long v89 = [(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] jbTargetEstimatorSynchronizer];
  BYTE14(v85) = VCDefaults_GetBoolValueForKey(@"dtmfTonePlaybackEnabled", [(VCMediaStreamConfig *)v31 dtmfTonePlaybackEnabled]);
  BOOL v37 = VCDefaults_GetBoolValueForKey(@"dtmfEventCallbacksEnabled", [(VCMediaStreamConfig *)v31 dtmfEventCallbacksEnabled]);
  BYTE9(v93) = v37;
  if (v37)
  {
    [(VCMediaStream *)self delegate];
    if (objc_opt_respondsToSelector()) {
      *((void *)&v88 + 1) = _VCAudioStream_DTMFEventCallback;
    }
  }
  LODWORD(v91) = [(VCMediaStreamConfig *)v31 dtmfSampleRate];
  BYTE9(v92) = [(VCMediaStreamConfig *)v31 outOfProcessCodecsEnabled];
  *(void *)&long long v93 = self->super._callID;
  WORD4(v85) = [(VCMediaStreamConfig *)v31 direction];
  BYTE11(v93) = +[VCAudioStream isVoLTE:[(VCMediaStreamConfig *)v31 audioStreamMode]];
  [(VCAudioStream *)self configureAudioJBAlgos:v80];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v38 = VRTraceErrorLogLevelToCSTR();
    double v39 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v38;
      __int16 v65 = 2080;
      int v66 = "-[VCAudioStream createAudioReceiver]";
      __int16 v67 = 1024;
      int v68 = 1672;
      __int16 v69 = 2048;
      long long v70 = (void *)v89;
      _os_log_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d Creating Audio Receiver with jbTargetEstimatorSynchronizer=%p", buf, 0x26u);
    }
  }
  if (BYTE4(v84))
  {
    DWORD2(v90) = [(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v31 multiwayConfig] streamGroupID];
    *((void *)&v84 + 1) = [(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v31 multiwayConfig] participantId];
    *(void *)&long long v85 = [(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v31 multiwayConfig] sessionId];
    BYTE12(v85) = [(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v31 multiwayConfig] shouldIgnoreRTPHeaderExtensions];
    *(void *)&long long v92 = [(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v31 multiwayConfig] remoteIDSParticipantID];
  }
  if (self->_isTelephony) {
    BYTE12(v90) = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:@"vc-audio-issue-detector-enabled" userDefaultKey:@"audioIssueDetectorEnabled" featureFlagDomain:"AVConference" featureFlagName:"UseAudioIssueDetectors"];
  }
  int v40 = [(VCAudioStream *)self getConnectionTypeForStreamMode:[(VCMediaStreamConfig *)v31 audioStreamMode]];
  BOOL isNWMonitorSignalEnabled = self->super._isNWMonitorSignalEnabled;
  DWORD1(v91) = v40;
  BYTE9(v91) = isNWMonitorSignalEnabled;
  BOOL isVoiceProcessingAt24KSupported = self->_isVoiceProcessingAt24KSupported;
  if (isVoiceProcessingAt24KSupported) {
    BOOL isVoiceProcessingAt24KSupported = self->_isRamStadSRCEnabled;
  }
  BYTE8(v93) = isVoiceProcessingAt24KSupported;
  BYTE8(v92) = VCDefaults_GetBoolValueForKey(@"audioDumpEnabled", 0);
  BYTE10(v93) = [(VCMediaStreamConfig *)v31 isEnhancedJBAdaptationsEnabled];
  HIDWORD(v93) = objc_msgSend(+[GKSConnectivitySettings readStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "readStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-reporting-audio-erasure-percentage-symptom-threshold", 0, &unk_1F3DC3660, 0), "intValue");
  Receiver = (tagVCAudioReceiver *)VCAudioReceiver_CreateReceiver((uint64_t)v80);
  self->_sourceContext.audioReceiver = Receiver;
  if (Receiver)
  {
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v46 = VRTraceErrorLogLevelToCSTR();
        unsigned __int8 v47 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          audioReceiver = self->_sourceContext.audioReceiver;
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v46;
          __int16 v65 = 2080;
          int v66 = "-[VCAudioStream createAudioReceiver]";
          __int16 v67 = 1024;
          int v68 = 1699;
          __int16 v69 = 2048;
          long long v70 = audioReceiver;
          __int16 v49 = "VCAudioStream [%s] %s:%d audioReceiver=%p";
          long long v50 = v47;
          uint32_t v51 = 38;
LABEL_71:
          _os_log_impl(&dword_1E1EA4000, v50, OS_LOG_TYPE_DEFAULT, v49, buf, v51);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        id v44 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
      }
      else {
        id v44 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v52 = VRTraceErrorLogLevelToCSTR();
        __int16 v53 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          v54 = self->_sourceContext.audioReceiver;
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = v52;
          __int16 v65 = 2080;
          int v66 = "-[VCAudioStream createAudioReceiver]";
          __int16 v67 = 1024;
          int v68 = 1699;
          __int16 v69 = 2112;
          long long v70 = v44;
          __int16 v71 = 2048;
          int v72 = self;
          __int16 v73 = 2048;
          int v74 = v54;
          __int16 v49 = "VCAudioStream [%s] %s:%d %@(%p) audioReceiver=%p";
          long long v50 = v53;
          uint32_t v51 = 58;
          goto LABEL_71;
        }
      }
    }
    self->_sourceContext.audioReceiver->var66 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload];
    self->_sourceContext.audioReceiver->var70 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] codecSampleRate];
    if (self->_sourceContext.isSendOnly || [(VCAudioStream *)self setReceiverPayloads])
    {
      int operatingMode = self->super._operatingMode;
      if (operatingMode == 6)
      {
        [(VCAudioStream *)self registerActiveAudioStreamChangeNotifications];
      }
      else if (operatingMode == 3)
      {
        [(VCAudioStream *)self registerCodecRateModeChangeNotifications];
      }
      int isOverlayEnabled = VCOverlayManager_isOverlayEnabled();
      long long v58 = self->_sourceContext.audioReceiver;
      if (isOverlayEnabled)
      {
        if (v58)
        {
          int64_t overlayToken = self->_overlayToken;
          if (overlayToken)
          {
            VCAudioReceiver_SetOverlayToken((uint64_t)v58, overlayToken);
            long long v58 = self->_sourceContext.audioReceiver;
          }
        }
      }
      VCAudioReceiver_SetAudioPlayoutDelay((uint64_t)v58, self->_audioPlayoutDelay, v57);
      LOBYTE(v45) = 1;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStream createAudioReceiver]();
        }
      }
      VCAudioReceiver_Finalize(&self->_sourceContext.audioReceiver->var0.var0);
      LOBYTE(v45) = 0;
      self->_sourceContext.audioReceiver = 0;
    }
    return v45;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v45 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v45) {
      return v45;
    }
    -[VCAudioStream createAudioReceiver]();
  }
  LOBYTE(v45) = 0;
  return v45;
}

- (unsigned)packetExpirationTimeForStreamConfig:(id)a3 codecType:(int64_t)a4
{
  if ([a3 audioStreamMode] != 8) {
    return 0;
  }
  uint64_t v7 = (void *)[a3 allCodecConfigurations];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a4)), "pTime");
  if (!v8)
  {
    if ([(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload] == 119) {
      LODWORD(v8) = objc_msgSend(-[VCAudioStream codecConfigForOpusWithStreamConfig:](self, "codecConfigForOpusWithStreamConfig:", a3), "pTime");
    }
    else {
      LODWORD(v8) = 0;
    }
  }
  if (self->_preferredMediaBitrate == 900000) {
    return 50;
  }
  else {
    return 2 * v8;
  }
}

- (BOOL)createAudioTransmitter:(int64_t)a3 streamIDs:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_alloc_init(VCAudioTransmitterConfig);
  uint64_t v8 = [(VCMediaStream *)self defaultStreamConfig];
  unsigned __int8 v9 = [(VCAudioStream *)self getPacketsPerBundleForStreamConfig:v8];
  int64_t v10 = +[VCPayloadUtils codecTypeForPayload:[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload]];
  [(VCAudioTransmitterConfig *)v7 setRtpHandle:[(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] rtpHandle]];
  [(VCAudioTransmitterConfig *)v7 setControlInfoGenerator:[(VCMediaStream *)self mediaControlInfoGenerator]];
  [(VCAudioTransmitterConfig *)v7 setAudioPayloads:self->audioPayloads];
  [(VCAudioTransmitterConfig *)v7 setChosenAudioPayload:self->currentAudioPayload];
  [(VCAudioTransmitterConfig *)v7 setChosenDTXPayload:self->currentDTXPayload];
  long long v11 = *(_OWORD *)&self->_vpioFormat.format.mBytesPerPacket;
  v32[0] = *(_OWORD *)&self->_vpioFormat.format.mSampleRate;
  v32[1] = v11;
  v32[2] = *(_OWORD *)&self->_vpioFormat.format.mBitsPerChannel;
  [(VCAudioTransmitterConfig *)v7 setInputFormat:v32];
  [(VCAudioTransmitterConfig *)v7 setAfrcHandle:0xFFFFFFFFLL];
  [(VCAudioTransmitterConfig *)v7 setUseRateControl:[(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v8 multiwayConfig] isOneToOne]];
  [(VCAudioTransmitterConfig *)v7 setBundlingScheme:[(VCMediaStreamConfig *)v8 bundlingScheme]];
  [(VCAudioTransmitterConfig *)v7 setAllowAudioSwitching:self->super._operatingMode == 6];
  if ([(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v8 multiwayConfig] isOneToOne])
  {
    uint64_t operatingMode = [(VCMediaStreamConfig *)v8 oneToOneOperatingMode];
  }
  else
  {
    uint64_t operatingMode = self->super._operatingMode;
  }
  [(VCAudioTransmitterConfig *)v7 setOperatingMode:operatingMode];
  uint64_t cachedConnectionMTU = self->_cachedConnectionMTU;
  if (!cachedConnectionMTU) {
    uint64_t cachedConnectionMTU = [(VCMediaStreamConfig *)v8 recommendedMTU];
  }
  [(VCAudioTransmitterConfig *)v7 setMaxAudioPacketSize:cachedConnectionMTU];
  if (self->super._operatingMode == 6) {
    uint64_t constantTransportOverhead = self->_constantTransportOverhead;
  }
  else {
    uint64_t constantTransportOverhead = 0;
  }
  [(VCAudioTransmitterConfig *)v7 setConstantTransportOverhead:constantTransportOverhead];
  [(VCAudioTransmitterConfig *)v7 setSupportsAdaptation:[(VCMediaStreamConfig *)v8 supportsAdaptation]];
  [(VCAudioTransmitterConfig *)v7 setNeedsPacketThread:0];
  [(VCAudioTransmitterConfig *)v7 setReportingAgent:[(VCObject *)self reportingAgent]];
  [(VCAudioTransmitterConfig *)v7 setReportingParentID:self->_reportingModuleID];
  [(VCAudioTransmitterConfig *)v7 setPacketsPerBundle:v9];
  uint64_t v15 = 0;
  if (self->super._operatingMode == 6) {
    uint64_t v15 = [(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v8 multiwayConfig] isOneToOne] ^ 1;
  }
  [(VCAudioTransmitterConfig *)v7 setTransmitROC:v15];
  [(VCAudioTransmitterConfig *)v7 setIgnoreSilence:0];
  [(VCAudioTransmitterConfig *)v7 setChosenRedPayloadType:20];
  [(VCAudioTransmitterConfig *)v7 setRedEnabled:[(VCMediaStreamConfig *)v8 isRedEnabled]];
  [(VCAudioTransmitterConfig *)v7 setIncludeRedSequenceOffset:self->super._operatingMode == 6];
  [(VCAudioTransmitterConfig *)v7 setRedNumPayloads:[(VCMediaStreamConfig *)v8 numRedundantPayloads]];
  [(VCAudioTransmitterConfig *)v7 setRedMaxDelay20ms:[(VCMediaStreamConfig *)v8 numRedundantPayloads]];
  [(VCAudioTransmitterConfig *)v7 setStatisticsCollector:[(VCMediaStreamRateControlConfig *)[(VCMediaStreamConfig *)v8 rateControlConfig] statisticsCollector]];
  [(VCAudioTransmitterConfig *)v7 setStreamIDs:a4];
  [(VCAudioTransmitterConfig *)v7 setTierNetworkBitrate:[(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v8 multiwayConfig] maxNetworkBitrate]];
  [(VCAudioTransmitterConfig *)v7 setMaxIDSStreamIdCount:[(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v8 multiwayConfig] maxIDSStreamIdCount]];
  [(VCAudioTransmitterConfig *)v7 setSupportedNumRedundantPayload:[(VCMediaStreamConfig *)v8 supportedNumRedundantPayload]];
  [(VCAudioTransmitterConfig *)v7 setSendActiveVoiceOnly:self->_sendActiveVoiceOnly];
  [(VCAudioTransmitterConfig *)v7 setCurrentDTXEnable:self->_currentDTXEnable];
  [(VCAudioTransmitterConfig *)v7 setAlwaysOnAudioRedundancyEnabled:1];
  [(VCAudioTransmitterConfig *)v7 setCellularAllowRedLowBitratesEnabled:0];
  [(VCAudioTransmitterConfig *)v7 setWifiAllowRedLowBitratesEnabled:0];
  [(VCAudioTransmitterConfig *)v7 setRemoteIDSParticipantID:[(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v8 multiwayConfig] remoteIDSParticipantID]];
  if ([(VCMediaStreamConfig *)v8 rateControlConfig]) {
    uint64_t v16 = [(VCMediaStreamRateControlConfig *)[(VCMediaStreamConfig *)v8 rateControlConfig] mediaQueue];
  }
  else {
    uint64_t v16 = 0xFFFFFFFFLL;
  }
  [(VCAudioTransmitterConfig *)v7 setMediaQueue:v16];
  [(VCAudioTransmitterConfig *)v7 setShouldCreateRedundancyController:self->super._operatingMode != 6];
  [(VCAudioTransmitterConfig *)v7 setUseChannelDataFormat:self->super._operatingMode == 6];
  [(VCAudioTransmitterConfig *)v7 setPacketExpirationTime:[(VCAudioStream *)self packetExpirationTimeForStreamConfig:v8 codecType:v10]];
  uint64_t IntValueForKey = VCDefaults_GetIntValueForKey(@"forceAudioPacketExpirationTime", 0xFFFFFFFFLL);
  if ((IntValueForKey & 0x80000000) == 0) {
    [(VCAudioTransmitterConfig *)v7 setPacketExpirationTime:IntValueForKey];
  }
  if (+[VCAudioStream isVoLTE:a3]) {
    BOOL v18 = +[VCPayloadUtils supportsCodecBandwidthUpdateForCodecType:v10];
  }
  else {
    BOOL v18 = 0;
  }
  [(VCAudioTransmitterConfig *)v7 setSupportsCodecBandwidthUpdate:v18];
  if ([(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v8 multiwayConfig] isOneToOne])
  {
    [(VCAudioTransmitterConfig *)v7 setUseChannelDataFormat:0];
  }
  [(VCAudioTransmitterConfig *)v7 setShouldApplyRedAsBoolean:[(VCMediaStreamConfig *)v8 shouldApplyRedAsBoolean]];
  [(VCAudioTransmitterConfig *)v7 setUseWifiTiers:[(VCMediaStreamConfig *)v8 useWifiTiers]];
  if ([(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v8 multiwayConfig] hasQualityIndex])
  {
    [(VCAudioTransmitterConfig *)v7 setQualityIndex:[(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v8 multiwayConfig] qualityIndex]];
  }
  [(VCAudioTransmitterConfig *)v7 setSframeCryptor:[(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] transmitterSframeCryptor]];
  [(VCAudioTransmitterConfig *)v7 setRatType:[(VCAudioStream *)self getConnectionTypeForStreamMode:[(VCMediaStreamConfig *)v8 audioStreamMode]]];
  if (self->_isTelephony) {
    [(VCAudioTransmitterConfig *)v7 setAudioIssueDetectorEnabled:+[GKSConnectivitySettings isFeatureEnabledForStorebagKey:@"vc-audio-issue-detector-enabled" userDefaultKey:@"audioIssueDetectorEnabled" featureFlagDomain:"AVConference" featureFlagName:"UseAudioIssueDetectors"]];
  }
  [(VCAudioTransmitterConfig *)v7 setTargetBitrateIsAudioOnly:[(VCAudioStream *)self bitrateIsAudioOnly]];
  [(VCAudioTransmitterConfig *)v7 setAudioDumpEnabled:VCDefaults_GetBoolValueForKey(@"audioDumpEnabled", 0)];
  [(VCAudioTransmitterConfig *)v7 setTierPickerMode:+[VCAudioTierPicker operatingModeToTierPickerMode:[(VCAudioTransmitterConfig *)v7 operatingMode] isLowLatency:[(VCMediaStreamConfig *)v8 isLowLatency] preferPlistForTierTable:!self->_isTelephony]];
  BOOL v19 = self->_isVoiceProcessingAt24KSupported && self->_isRamStadSRCEnabled;
  [(VCAudioTransmitterConfig *)v7 setRamStadSRCEnabled:v19];
  [(VCAudioTransmitterConfig *)v7 setIsHigherAudioREDCutoverU1Enabled:[(VCMediaStreamConfig *)v8 isHigherAudioREDCutoverU1Enabled]];
  self->_audioTransmitter = [[VCAudioTransmitter alloc] initWithConfig:v7];

  int v20 = [(VCAudioStream *)self audioTransmitter];
  if (v20)
  {
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        char v23 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          audioTransmitter = self->_audioTransmitter;
          *(_DWORD *)buf = 136315906;
          uint64_t v34 = v22;
          __int16 v35 = 2080;
          BOOL v36 = "-[VCAudioStream createAudioTransmitter:streamIDs:]";
          __int16 v37 = 1024;
          int v38 = 1834;
          __int16 v39 = 2048;
          int v40 = audioTransmitter;
          uint64_t v25 = "VCAudioStream [%s] %s:%d audioTransmitter=%p";
          uint64_t v26 = v23;
          uint32_t v27 = 38;
LABEL_42:
          _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v21 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v21 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        uint64_t v29 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = self->_audioTransmitter;
          *(_DWORD *)buf = 136316418;
          uint64_t v34 = v28;
          __int16 v35 = 2080;
          BOOL v36 = "-[VCAudioStream createAudioTransmitter:streamIDs:]";
          __int16 v37 = 1024;
          int v38 = 1834;
          __int16 v39 = 2112;
          int v40 = v21;
          __int16 v41 = 2048;
          BOOL v42 = self;
          __int16 v43 = 2048;
          id v44 = v30;
          uint64_t v25 = "VCAudioStream [%s] %s:%d %@(%p) audioTransmitter=%p";
          uint64_t v26 = v29;
          uint32_t v27 = 58;
          goto LABEL_42;
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioStream createAudioTransmitter:streamIDs:]();
    }
  }
  return v20 != 0;
}

- (BOOL)bitrateIsAudioOnly
{
  return (self->super._operatingMode < 7u) & (0x46u >> self->super._operatingMode);
}

- (void)sendDTMFEvent:(id)a3
{
  dtmfEventHandler = self->dtmfEventHandler;
  uint64_t lastSentAudioSampleTime = self->lastSentAudioSampleTime;
  uint64_t v6 = [(VCAudioPayloadConfig *)[(VCAudioTransmitter *)self->_audioTransmitter currentAudioPayloadConfig] codecSampleRate];

  [(DTMFEventHandler *)dtmfEventHandler sendDTMFEvent:a3 atTimestamp:lastSentAudioSampleTime withSampleRate:v6];
}

- (void)stopSendDTMFEvent
{
  dtmfEventHandler = self->dtmfEventHandler;
  uint64_t lastSentAudioSampleTime = self->lastSentAudioSampleTime;
  uint64_t v4 = [(VCAudioPayloadConfig *)[(VCAudioTransmitter *)self->_audioTransmitter currentAudioPayloadConfig] codecSampleRate];

  [(DTMFEventHandler *)dtmfEventHandler stopDTMFEventAtTimestamp:lastSentAudioSampleTime withSampleRate:v4];
}

+ (id)supportedAudioPayloads
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", &unk_1F3DC3678, &unk_1F3DC3690, &unk_1F3DC36A8, &unk_1F3DC35E8, &unk_1F3DC36C0, &unk_1F3DC36D8, &unk_1F3DC36F0, &unk_1F3DC3708, &unk_1F3DC3720, 0);
  [v2 addObject:&unk_1F3DC3738];
  [v2 addObject:&unk_1F3DC3750];
  [v2 addObject:&unk_1F3DC3768];
  [v2 addObject:&unk_1F3DC3780];
  [v2 addObject:&unk_1F3DC3798];
  return v2;
}

+ (id)capabilities
{
  v4[1] = *MEMORY[0x1E4F143B8];
  unsigned int v3 = @"avcKeySupportedAudioCodecs";
  v4[0] = +[VCAudioStream supportedAudioPayloads];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
}

- (_METER_INFO)meterWithType:(int)a3
{
  if (a3) {
    return &self->_sourceContext.soundMeter;
  }
  else {
    return &self->_sinkContext.soundMeter;
  }
}

- (BOOL)isFrequencyMeteringEnabled:(int)a3
{
  return *(unsigned char *)[(VCAudioStream *)self meterWithType:*(void *)&a3];
}

- (void)setFrequencyMeteringEnabled:(BOOL)a3 meterType:(int)a4
{
  BOOL v4 = a3;
  uint64_t v5 = [(VCAudioStream *)self meterWithType:*(void *)&a4];
  if (v5->frequencyMeteringEnabled != v4)
  {
    uint64_t v6 = v5;
    if (v4)
    {
      v5->fftMeter = (opaqueVCFFTMeter *)VCFFTMeter_Create();
    }
    else
    {
      VCFFTMeter_Destroy((uint64_t *)&v5->fftMeter);
      v6->fftMeter = 0;
    }
    v6->frequencyMeteringEnabled = v4;
  }
}

- (void)prepareAudio
{
  VCMediaStream_Lock((uint64_t)self);
  VCAudioReceiver_Start(&self->_sourceContext.audioReceiver->var0.var0, v3);

  VCMediaStream_Unlock((uint64_t)self);
}

- (void)cleanupAudio
{
  VCMediaStream_Lock((uint64_t)self);
  VCAudioReceiver_Stop((uint64_t)self->_sourceContext.audioReceiver);

  self->_sourceContext.delegate = 0;
  self->_sourceContext.momentsCollectorDelegate = 0;

  VCMediaStream_Unlock((uint64_t)self);
}

- (BOOL)generateReceptionReportList:(_RTCP_RECEPTION_REPORT *)a3 reportCount:(char *)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCAudioStream;
  BOOL v6 = [(VCMediaStream *)&v8 generateReceptionReportList:a3 reportCount:a4];
  if (v6) {
    a3->int var7 = VCAudioReceiver_CalculateBurstLoss((uint64_t)self->_sourceContext.audioReceiver);
  }
  return v6;
}

- (void)setStreamDirection:(int64_t)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  VCMediaStream_Lock((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)VCAudioStream;
  [(VCMediaStream *)&v5 setStreamDirection:a3];
  [(VCAudioIO *)self->_audioIO setDirection:+[VCAudioStream audioIODirectionWithMediaStreamDirection:a3]];
  VCMediaStream_Unlock((uint64_t)self);
}

- (BOOL)sendActiveVoiceOnly
{
  return self->_sendActiveVoiceOnly;
}

- (void)setSendActiveVoiceOnly:(BOOL)a3
{
  BOOL v3 = a3;
  VCMediaStream_Lock((uint64_t)self);
  self->_sendActiveVoiceOnly = v3;
  [(VCAudioTransmitter *)self->_audioTransmitter setSendActiveVoiceOnly:v3];

  VCMediaStream_Unlock((uint64_t)self);
}

- (void)setCurrentDTXEnable:(BOOL)a3
{
  VCMediaStream_Lock((uint64_t)self);
  self->_currentDTXEnable = a3;

  VCMediaStream_Unlock((uint64_t)self);
}

- (void)setMuted:(BOOL)a3
{
  self->_isMuted = a3;
  -[VCAudioIO setMuted:](self->_audioIO, "setMuted:");
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (void)setRemoteMuted:(BOOL)a3
{
  self->_sourceContext.isRemoteMuted = a3;
}

- (BOOL)isRemoteMuted
{
  return self->_sourceContext.isRemoteMuted;
}

- (void)setVolume:(float)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      double volume = self->_sourceContext.volume;
      int v8 = 136316162;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      long long v11 = "-[VCAudioStream setVolume:]";
      __int16 v12 = 1024;
      int v13 = 1980;
      __int16 v14 = 2048;
      double v15 = volume;
      __int16 v16 = 2048;
      double v17 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d Setting volume from %f to %f", (uint8_t *)&v8, 0x30u);
    }
  }
  self->_sourceContext.double volume = a3;
}

- (float)volume
{
  return self->_sourceContext.volume;
}

- (void)realtimeSourceContext
{
  return &self->_sourceContext;
}

- (void)pullSamplesCallback
{
  return VCAudioStream_PullAudioSamples;
}

- (void)setVCStatistics:(tagVCStatisticsMessage *)a3
{
  BOOL v4 = [(VCMediaStreamRateControlConfig *)[(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] rateControlConfig] statisticsCollector];

  AVCStatisticsCollector_SetVCStatistics((uint64_t)v4, (uint64_t)a3);
}

- (void)setTargetBitrate:(unsigned int)a3 rateChangeCounter:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(VCAudioTransmitter *)self->_audioTransmitter setTargetBitrate:*(void *)&a3];
  audioTransmitter = self->_audioTransmitter;

  [(VCAudioTransmitter *)audioTransmitter setRateChangeCounter:v4];
}

- (unsigned)actualAudioSendingBitrate
{
  return [(VCAudioTransmitter *)self->_audioTransmitter actualAudioSendingBitrate];
}

- (BOOL)shouldUseNWConnectionBackingSocket
{
  return 0;
}

- (id)supportedPayloads
{
  return +[VCAudioStream supportedAudioPayloads];
}

- (void)onCallIDChanged
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  NSInteger v3 = [(NSString *)self->super._callID integerValue];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  transportArray = self->super._transportArray;
  uint64_t v5 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(transportArray);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) setWRMCallId:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (BOOL)validateAudioStreamConfigurations:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (![a3 count])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      -[VCAudioStream validateAudioStreamConfigurations:]();
    }
    goto LABEL_20;
  }
  uint64_t v4 = (void *)[a3 objectAtIndexedSubscript:0];
  if ((unint64_t)[a3 count] < 2 || objc_msgSend(v4, "direction") == 2)
  {
    if ((unint64_t)[a3 count] < 2)
    {
LABEL_9:
      LOBYTE(v9) = 1;
    }
    else
    {
      unint64_t v5 = 1;
      while (1)
      {
        uint64_t v6 = (void *)[a3 objectAtIndexedSubscript:v5];
        uint64_t v7 = [v6 audioStreamMode];
        if (v7 != [v4 audioStreamMode]) {
          break;
        }
        uint64_t v8 = [v6 direction];
        if (v8 != [v4 direction]) {
          break;
        }
        unint64_t v5 = (v5 + 1);
        if ([a3 count] <= v5) {
          goto LABEL_9;
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_20;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      long long v11 = *MEMORY[0x1E4F47A50];
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (v9)
      {
        int v18 = 136317698;
        uint64_t v19 = v10;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCAudioStream validateAudioStreamConfigurations:]";
        __int16 v22 = 1024;
        int v23 = 2068;
        __int16 v24 = 1024;
        int v25 = v5;
        __int16 v26 = 1024;
        *(_DWORD *)uint32_t v27 = [a3 count];
        *(_WORD *)&v27[4] = 2048;
        *(void *)&v27[6] = [v6 audioStreamMode];
        __int16 v28 = 2048;
        uint64_t v29 = [v4 audioStreamMode];
        __int16 v30 = 1024;
        int v31 = [v6 jitterBufferMode];
        __int16 v32 = 1024;
        int v33 = [v4 jitterBufferMode];
        __int16 v34 = 2048;
        uint64_t v35 = [v6 direction];
        __int16 v36 = 2048;
        uint64_t v37 = [v4 direction];
        long long v12 = "VCAudioStream [%s] %s:%d Failure at index i=%u of streamConfigArray.count=%u audioStreamConfig.audioStream"
              "Mode=%ld firstAudioStreamConfig.audioStreamMode=%ld audioStreamConfig.jitterBufferMode=%u firstAudioStream"
              "Config.jitterBufferMode=%u audioStreamConfig.direction=%ld firstAudioStreamConfig.direction=%ld";
        long long v13 = v11;
        uint32_t v14 = 92;
LABEL_19:
        _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v18, v14);
        goto LABEL_20;
      }
    }
    return v9;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
  {
LABEL_20:
    LOBYTE(v9) = 0;
    return v9;
  }
  uint64_t v15 = VRTraceErrorLogLevelToCSTR();
  __int16 v16 = *MEMORY[0x1E4F47A50];
  BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v9)
  {
    int v18 = 136316162;
    uint64_t v19 = v15;
    __int16 v20 = 2080;
    uint64_t v21 = "-[VCAudioStream validateAudioStreamConfigurations:]";
    __int16 v22 = 1024;
    int v23 = 2058;
    __int16 v24 = 1024;
    int v25 = [a3 count];
    __int16 v26 = 2048;
    *(void *)uint32_t v27 = [v4 direction];
    long long v12 = "VCAudioStream [%s] %s:%d streamConfigArray.count=%u, but firstAudioStreamConfig.direction=%ld";
    long long v13 = v16;
    uint32_t v14 = 44;
    goto LABEL_19;
  }
  return v9;
}

- (BOOL)setupSourceTransport:(id)a3
{
  unint64_t v5 = malloc_type_calloc(1uLL, 0x10uLL, 0xA0040AFF93C70uLL);
  if (v5)
  {
    uint64_t v6 = v5;
    v5[1] = [a3 realtimeContext];
    if (VCSingleLinkedListPush((uint64_t)&self->_sourceContext.transports, v6))
    {
      LOBYTE(v7) = 1;
      return v7;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStream setupSourceTransport:]();
      }
    }
    free(v6);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    -[VCAudioStream setupSourceTransport:]();
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (id)createTransportWithStreamConfig:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(VCMediaStream *)self createRTPHandleWithStreamConfig:a3 payloadType:0 localSSRC:self->super._localSSRC];
  if (v5 == (tagHANDLE *)0xFFFFFFFFLL)
  {
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStream createTransportWithStreamConfig:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v11 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
      }
      else {
        long long v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v20 = 136316162;
          uint64_t v21 = v14;
          __int16 v22 = 2080;
          int v23 = "-[VCAudioStream createTransportWithStreamConfig:]";
          __int16 v24 = 1024;
          int v25 = 2096;
          __int16 v26 = 2112;
          uint32_t v27 = v11;
          __int16 v28 = 2048;
          uint64_t v29 = self;
          _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Failed to create RTP handle", (uint8_t *)&v20, 0x30u);
        }
      }
    }
    goto LABEL_41;
  }
  uint64_t v6 = (uint64_t)v5;
  if ([a3 rateControlConfig])
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "mediaQueue");
    if (v7 != 0xFFFFFFFFLL) {
      MediaQueue_SetRTPHandle(v7, v6);
    }
  }
  uint64_t v8 = [[VCAudioStreamTransport alloc] initWithHandle:v6 callId:[(NSString *)self->super._callID integerValue] localSSRC:self->super._localSSRC enableNetworkMonitor:self->super._operatingMode != 6];
  if (!v8)
  {
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStream createTransportWithStreamConfig:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v12 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
      }
      else {
        long long v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        double v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v20 = 136316162;
          uint64_t v21 = v16;
          __int16 v22 = 2080;
          int v23 = "-[VCAudioStream createTransportWithStreamConfig:]";
          __int16 v24 = 1024;
          int v25 = 2105;
          __int16 v26 = 2112;
          uint32_t v27 = v12;
          __int16 v28 = 2048;
          uint64_t v29 = self;
          _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Failed to create RTP extension", (uint8_t *)&v20, 0x30u);
        }
      }
    }
    RTPCloseHandle();
    goto LABEL_41;
  }
  BOOL v9 = v8;
  if (![(VCAudioStream *)self setupSourceTransport:v8])
  {
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStream createTransportWithStreamConfig:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v13 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
      }
      else {
        long long v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        uint64_t v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v20 = 136316162;
          uint64_t v21 = v18;
          __int16 v22 = 2080;
          int v23 = "-[VCAudioStream createTransportWithStreamConfig:]";
          __int16 v24 = 1024;
          int v25 = 2108;
          __int16 v26 = 2112;
          uint32_t v27 = v13;
          __int16 v28 = 2048;
          uint64_t v29 = self;
          _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Failed to setup the transport", (uint8_t *)&v20, 0x30u);
        }
      }
    }

LABEL_41:
    BOOL v9 = 0;
    return v9;
  }
  [(NSMutableArray *)self->super._transportArray addObject:v9];
  return v9;
}

- (void)createReportSSRCListWithStreamConfigs:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  reportingSSRCList = self->_reportingSSRCList;
  if (reportingSSRCList)
  {
    free(reportingSSRCList);
    self->_reportingSSRCList = 0;
  }
  self->_reportingSSRCint Count = 0;
  if ([a3 count])
  {
    uint64_t v6 = (unsigned int *)malloc_type_calloc([a3 count], 4uLL, 0x100004052888210uLL);
    self->_reportingSSRCList = v6;
    if (self->super._operatingMode == 6)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v7 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(a3);
            }
            long long v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if ([v11 direction] == 2) {
              unsigned int localSSRC = [v11 remoteSSRC];
            }
            else {
              unsigned int localSSRC = self->super._localSSRC;
            }
            long long v13 = self->_reportingSSRCList;
            reportingSSRCint Count = self->_reportingSSRCCount;
            self->_reportingSSRCint Count = reportingSSRCCount + 1;
            v13[reportingSSRCCount] = localSSRC;
          }
          uint64_t v8 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
        }
        while (v8);
      }
    }
    else
    {
      unsigned int v15 = self->super._localSSRC;
      uint64_t v16 = self->_reportingSSRCCount;
      self->_reportingSSRCint Count = v16 + 1;
      v6[v16] = v15;
    }
  }
}

- (void)cleanupBeforeReconfigure:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(VCAudioStream *)self setAudioTransmitter:0];
  audioReceiver = self->_sourceContext.audioReceiver;
  if (audioReceiver)
  {
    VCAudioReceiver_Finalize(&audioReceiver->var0.var0);
    self->_sourceContext.audioReceiver = 0;
  }
  if ([(NSMutableArray *)self->super._transportArray count]) {
    int v6 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->super._transportArray, "objectAtIndexedSubscript:", 0), "streamConfig"), "localSSRC");
  }
  else {
    int v6 = 0;
  }
  if ([a3 count]) {
    int v7 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "localSSRC");
  }
  else {
    int v7 = 0;
  }
  uint64_t v8 = [a3 count];
  if (v8 != [(NSMutableArray *)self->super._transportArray count] || v7 != v6)
  {
    if ([(NSMutableArray *)self->super._transportArray count])
    {
      if ((VCAudioStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioStream cleanupBeforeReconfigure:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v10 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v10 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          long long v12 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int v14 = 136316162;
            uint64_t v15 = v11;
            __int16 v16 = 2080;
            double v17 = "-[VCAudioStream cleanupBeforeReconfigure:]";
            __int16 v18 = 1024;
            int v19 = 2154;
            __int16 v20 = 2112;
            long long v21 = v10;
            __int16 v22 = 2048;
            int v23 = self;
            _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Reconfiguring VCAudioStream with a different number of transports.", (uint8_t *)&v14, 0x30u);
          }
        }
      }
      [(NSMutableArray *)self->super._transportArray removeAllObjects];
    }
    while (1)
    {
      long long v13 = VCSingleLinkedListPop((uint64_t *)&self->_sourceContext.transports);
      if (!v13) {
        break;
      }
      free(v13);
    }
    [(VCAudioStream *)self createReportSSRCListWithStreamConfigs:a3];
  }
}

- (id)streamIDsFromTransport
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->super._operatingMode != 6) {
    return 0;
  }
  NSInteger v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->super._transportArray, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  transportArray = self->super._transportArray;
  uint64_t v5 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(transportArray);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfig"), "multiwayConfig"), "isOneToOne") & 1) == 0)
        {
          objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfig"), "multiwayConfig"), "idsStreamID")));
          uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfig"), "multiwayConfig"), "v2StreamID");
          if (v10) {
            objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", v10));
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v6);
  }
  return v3;
}

+ (BOOL)shouldUseRandomRTPTimestampForMode:(int)a3
{
  return a3 != 11 && a3 != 6 || VCDefaults_GetBoolValueForKey(@"simulateWebRTCOnlyClient", 0);
}

- (void)setPreferredMediaBitrateWithConfiguration:(id)a3
{
  self->_unsigned int preferredMediaBitrate = 0;
  if ([a3 audioStreamMode] == 5)
  {
    unsigned int v5 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "preferredMediaBitrate");
LABEL_10:
    self->_unsigned int preferredMediaBitrate = v5;
    goto LABEL_11;
  }
  if ([a3 audioStreamMode] == 8)
  {
    self->_unsigned int preferredMediaBitrate = 80000;
    if ([a3 audioStreamMode] == 8 && objc_msgSend(a3, "channelCount") == 4)
    {
      unsigned int v5 = 900000;
      goto LABEL_10;
    }
  }
  else if ([a3 audioStreamMode] == 9 || objc_msgSend(a3, "audioStreamMode") == 11)
  {
    unsigned int v5 = [a3 preferredMediaBitRate];
    goto LABEL_10;
  }
LABEL_11:
  self->_unsigned int preferredMediaBitrate = VCDefaults_GetIntValueForKey(@"audioStreamPreferredMediaBitrate", self->_preferredMediaBitrate);
}

- (int)getRTPTimeStampRateScaleFactor
{
  int v2 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload];
  int result = 5;
  if (v2 <= 106)
  {
    if (v2 != 97)
    {
      if (v2 == 98) {
        return result;
      }
      return 0;
    }
    return 4;
  }
  else
  {
    if (v2 == 107) {
      return result;
    }
    if (v2 != 111)
    {
      if (v2 == 108) {
        return 7;
      }
      return 0;
    }
    return 6;
  }
}

- (BOOL)networkUplinkClockUsesBaseband:(int64_t)a3
{
  BOOL result = +[VCHardwareSettings supportsOptimizedHandoversForTelephony];
  if (a3 != 7) {
    return 0;
  }
  return result;
}

- (int)preferredAudioCodecWithStreamConfig:(id)a3
{
  if (self->super._operatingMode == 6 && ([a3 isLowLatency] & 1) != 0) {
    return 101;
  }
  else {
    return 98;
  }
}

- (BOOL)onConfigureStreamWithConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  if (!-[VCAudioStream validateAudioStreamConfigurations:](self, "validateAudioStreamConfigurations:"))
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioStream.m", 2244), @"Invalid Parameter", @"Called with an invalid parameter");
    if ((VCAudioStream *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
        goto LABEL_156;
      }
      uint64_t v56 = VRTraceErrorLogLevelToCSTR();
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      long long v58 = *MEMORY[0x1E4F47A50];
      if (IsOSFaultDisabled)
      {
        BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (v21)
        {
          if (*a4) {
            long long v59 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          }
          else {
            long long v59 = "<nil>";
          }
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = v56;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 2247;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v10;
          *(_WORD *)&buf[38] = 2048;
          *(void *)&buf[40] = self;
          LOWORD(v117) = 2080;
          *(void *)((char *)&v117 + 2) = v59;
          int v68 = "VCAudioStream [%s] %s:%d %@(%p) error[%s]";
          __int16 v69 = v58;
LABEL_168:
          _os_log_error_impl(&dword_1E1EA4000, v69, OS_LOG_TYPE_ERROR, v68, buf, 0x3Au);
          goto LABEL_156;
        }
      }
      else
      {
        BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
        if (v21)
        {
          if (*a4) {
            long long v61 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          }
          else {
            long long v61 = "<nil>";
          }
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = v56;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 2247;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v10;
          *(_WORD *)&buf[38] = 2048;
          *(void *)&buf[40] = self;
          LOWORD(v117) = 2080;
          *(void *)((char *)&v117 + 2) = v61;
          long long v70 = "VCAudioStream [%s] %s:%d %@(%p) error[%s]";
          __int16 v71 = v58;
          goto LABEL_171;
        }
      }
      return v21;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      uint64_t v52 = VRTraceErrorLogLevelToCSTR();
      char v53 = VRTraceIsOSFaultDisabled();
      v54 = *MEMORY[0x1E4F47A50];
      if (v53)
      {
        BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v21) {
          return v21;
        }
        -[VCAudioStream onConfigureStreamWithConfiguration:error:].cold.5(v52, a4, v54);
      }
      else
      {
        BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
        if (!v21) {
          return v21;
        }
        -[VCAudioStream onConfigureStreamWithConfiguration:error:].cold.6(v52, a4, v54);
      }
    }
    goto LABEL_156;
  }
  uint64_t v7 = (void *)[a3 objectAtIndexedSubscript:0];
  [(VCAudioStream *)self cleanupBeforeReconfigure:a3];
  -[VCAudioStream setDeviceRoleForAudioStreamMode:direction:](self, "setDeviceRoleForAudioStreamMode:direction:", [v7 audioStreamMode], objc_msgSend(v7, "direction"));
  v113 = v7;
  int v8 = +[VCAudioStream isTelephony:](VCAudioStream, "isTelephony:", [v7 audioStreamMode]);
  self->_BOOL isTelephony = v8;
  if (v8) {
    LOBYTE(v8) = VCCarrierBundle_GetForceJBLatencySensitiveModeForVoWiFi();
  }
  self->_shouldEnableJBLatencySenstiveModeForVoWiFuint64_t i = v8;
  -[VCMediaStream setOperatingMode:](self, "setOperatingMode:", +[VCAudioStream operatingModeForAudioStreamMode:](VCAudioStream, "operatingModeForAudioStreamMode:", [v7 audioStreamMode]));
  BOOL v9 = +[VCAudioStream isVoLTE:](VCAudioStream, "isVoLTE:", [v7 audioStreamMode]);
  if (v9) {
    LOBYTE(v9) = +[VCHardwareSettings isVoiceProcessingAt24KSupported];
  }
  self->_BOOL isVoiceProcessingAt24KSupported = v9;
  self->_isRamStadSRCEnabled = VCDefaults_GetBoolValueForKey(@"enableRamStadSRC", 1);
  if (self->super._operatingMode == 6)
  {
    if ((self->_reportingModuleID + 1) <= 1)
    {
      [(VCObject *)self reportingAgent];
      self->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
      [(VCObject *)self reportingAgent];
      [(VCAudioStream *)self getReportingServiceID];
      [(VCAudioStream *)self getClientSpecificUserInfo:a3];
      reportingCacheModuleSpecificInfo();
    }
  }
  else if (![(VCObject *)self reportingAgent])
  {
    [(VCAudioStream *)self setupReportingAgent:a3];
  }
  v111 = a4;
  [(VCAudioStream *)self setPreferredMediaBitrateWithConfiguration:v7];
  self->preferredAudioCodec = [(VCAudioStream *)self preferredAudioCodecWithStreamConfig:v7];
  [(VCAudioStream *)self _computeInternalFormatForStreamConfigurations:a3];
  p_vpioFormat = &self->_vpioFormat;
  self->super._transportSetupInfo.sourceRate = self->_vpioFormat.format.mSampleRate;
  self->super._useRandomTS = +[VCAudioStream shouldUseRandomRTPTimestampForMode:self->super._operatingMode];
  if ([(VCMediaStream *)self networkFeedbackController])
  {
    self->_sourceContext.wrmInfo = [(VCNetworkFeedbackController *)[(VCMediaStream *)self networkFeedbackController] wrmInfo];
    self->_sourceContext.defaultRtpHandle = [(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] rtpHandle];
  }
  uint64_t v11 = [(NSMutableArray *)self->super._transportArray count];
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  obuint64_t j = a3;
  uint64_t v12 = [a3 countByEnumeratingWithState:&v134 objects:v133 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v135;
LABEL_18:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v135 != v14) {
        objc_enumerationMutation(a3);
      }
      long long v16 = *(void **)(*((void *)&v134 + 1) + 8 * v15);
      if (v11) {
        id v17 = (id)[(NSMutableArray *)self->super._transportArray objectAtIndexedSubscript:0];
      }
      else {
        id v17 = [(VCAudioStream *)self createTransportWithStreamConfig:*(void *)(*((void *)&v134 + 1) + 8 * v15)];
      }
      __int16 v18 = v17;
      if (!v17)
      {
        if ((VCAudioStream *)objc_opt_class() == self)
        {
          unsigned int v62 = v111;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAudioStream onConfigureStreamWithConfiguration:error:]();
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            __int16 v55 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
          }
          else {
            __int16 v55 = &stru_1F3D3E450;
          }
          unsigned int v62 = v111;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v63 = VRTraceErrorLogLevelToCSTR();
            long long v64 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              *(void *)&uint8_t buf[4] = v63;
              *(_WORD *)&unsigned char buf[12] = 2080;
              *(void *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 2295;
              *(_WORD *)&buf[28] = 2112;
              *(void *)&buf[30] = v55;
              *(_WORD *)&buf[38] = 2048;
              *(void *)&buf[40] = self;
              _os_log_error_impl(&dword_1E1EA4000, v64, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Failed to create transport", buf, 0x30u);
            }
          }
        }
        +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v62, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioStream.m", 2299), @"Failed to create transport", @"Create transport failed");
        goto LABEL_156;
      }
      int v19 = (AVCStatisticsCollector *)objc_msgSend((id)objc_msgSend(v16, "rateControlConfig"), "statisticsCollector");
      if ((objc_msgSend(v18, "configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:", v16, &self->super._transportSetupInfo, self->super._operatingMode == 6, self->super._operatingMode == 6, v19, objc_msgSend((id)objc_msgSend(v16, "rateControlConfig"), "basebandCongestionDetector"), v111) & 1) == 0)break; {
      statsCollector = self->_statsCollector;
      }
      self->_statsCollector = v19;
      if (v19) {
        CFRetain(v19);
      }
      if (statsCollector) {
        CFRelease(statsCollector);
      }
      VCAudioReceiver_FlushQueues((uint64_t)self->_sourceContext.audioReceiver);
      if (v13 == ++v15)
      {
        uint64_t v13 = [a3 countByEnumeratingWithState:&v134 objects:v133 count:16];
        if (!v13) {
          goto LABEL_32;
        }
        goto LABEL_18;
      }
    }
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
        goto LABEL_156;
      }
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v21) {
          return v21;
        }
        -[VCAudioStream onConfigureStreamWithConfiguration:error:]();
      }
      else
      {
        BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
        if (!v21) {
          return v21;
        }
        -[VCAudioStream onConfigureStreamWithConfiguration:error:].cold.4();
      }
      goto LABEL_156;
    }
    if (objc_opt_respondsToSelector()) {
      long long v60 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
    }
    else {
      long long v60 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
      goto LABEL_156;
    }
    uint64_t v65 = VRTraceErrorLogLevelToCSTR();
    char v66 = VRTraceIsOSFaultDisabled();
    __int16 v67 = *MEMORY[0x1E4F47A50];
    if (v66)
    {
      BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v21) {
        return v21;
      }
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = v65;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 2314;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v60;
      *(_WORD *)&buf[38] = 2048;
      *(void *)&buf[40] = self;
      LOWORD(v117) = 2048;
      *(void *)((char *)&v117 + 2) = v16;
      int v68 = "VCAudioStream [%s] %s:%d %@(%p) Failed to configure transport for streamConfig=%p";
      __int16 v69 = v67;
      goto LABEL_168;
    }
    BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
    if (!v21) {
      return v21;
    }
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = v65;
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 2314;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v60;
    *(_WORD *)&buf[38] = 2048;
    *(void *)&buf[40] = self;
    LOWORD(v117) = 2048;
    *(void *)((char *)&v117 + 2) = v16;
    long long v70 = "VCAudioStream [%s] %s:%d %@(%p) Failed to configure transport for streamConfig=%p";
    __int16 v71 = v67;
LABEL_171:
    _os_log_fault_impl(&dword_1E1EA4000, v71, OS_LOG_TYPE_FAULT, v70, buf, 0x3Au);
    goto LABEL_156;
  }
LABEL_32:
  BOOL v21 = [(VCAudioStream *)self setupPayloads];
  if (!v21) {
    return v21;
  }
  [(VCAudioStream *)self setDTXPayload:v7];
  dtmfEventHandler = self->dtmfEventHandler;
  if (dtmfEventHandler) {
    [(DTMFEventHandler *)dtmfEventHandler setDTMFRTPEventDurationForPayload:[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload]];
  }
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  transportArray = self->super._transportArray;
  uint64_t v23 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v129 objects:v128 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v130;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v130 != v25) {
          objc_enumerationMutation(transportArray);
        }
        uint32_t v27 = *(void **)(*((void *)&v129 + 1) + 8 * i);
        if (self->_isTelephony)
        {
          uint64_t v28 = [*(id *)(*((void *)&v129 + 1) + 8 * i) realtimeContext];
          *(_DWORD *)(v28 + 220) = +[VCAudioStream isVoLTE:](VCAudioStream, "isVoLTE:", [v113 audioStreamMode]);
          if ((VCAudioStream *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
              goto LABEL_51;
            }
            uint64_t v36 = VRTraceErrorLogLevelToCSTR();
            uint64_t v37 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_51;
            }
            int v38 = *(_DWORD *)(v28 + 220);
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v36;
            *(_WORD *)&unsigned char buf[12] = 2080;
            *(void *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 2335;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v38;
            int v33 = v37;
            __int16 v34 = "VCAudioStream [%s] %s:%d Telephony calling isLocalCellular=%d";
            uint32_t v35 = 34;
            goto LABEL_50;
          }
          uint64_t v29 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            uint64_t v29 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v30 = VRTraceErrorLogLevelToCSTR();
            int v31 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v32 = *(_DWORD *)(v28 + 220);
              *(_DWORD *)buf = 136316418;
              *(void *)&uint8_t buf[4] = v30;
              *(_WORD *)&unsigned char buf[12] = 2080;
              *(void *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 2335;
              *(_WORD *)&buf[28] = 2112;
              *(void *)&buf[30] = v29;
              *(_WORD *)&buf[38] = 2048;
              *(void *)&buf[40] = self;
              LOWORD(v117) = 1024;
              *(_DWORD *)((char *)&v117 + 2) = v32;
              int v33 = v31;
              __int16 v34 = "VCAudioStream [%s] %s:%d %@(%p) Telephony calling isLocalCellular=%d";
              uint32_t v35 = 54;
LABEL_50:
              _os_log_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, v35);
            }
          }
        }
LABEL_51:
        int operatingMode = self->super._operatingMode;
        if (operatingMode == 3)
        {
          int v40 = &OBJC_IVAR___VCRedundancyControlAlgorithmVideo__offChannelTimeRatio;
          BOOL v41 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload] == 108;
          int operatingMode = self->super._operatingMode;
          if (operatingMode == 3)
          {
            BOOL v42 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload] == 111;
            int operatingMode = self->super._operatingMode;
          }
          else
          {
            BOOL v42 = 0;
          }
        }
        else
        {
          BOOL v41 = 0;
          BOOL v42 = 0;
          int v40 = &OBJC_IVAR___VCRedundancyControlAlgorithmVideo__offChannelTimeRatio;
        }
        BOOL v43 = operatingMode == 6
           && objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v40[477]), "config"), "inputSampleRate") == 48000&& objc_msgSend((id)objc_msgSend(v27, "streamConfig"), "rtpTimestampRate") == 24000;
        if (self->_isVoiceProcessingAt24KSupported)
        {
          uint64_t v44 = [v27 rtpHandle];
          signed int v45 = [(VCAudioStream *)self getRTPTimeStampRateScaleFactor];
          uint64_t v46 = v44;
        }
        else if (v41 || v43)
        {
          uint64_t v46 = [v27 rtpHandle];
          signed int v45 = 1;
        }
        else if (v42 {
               || (uint64_t v47 = v40[477], self->super._operatingMode != 5)
        }
               && objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v47), "config"), "payload") == 119&& objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v47), "config"), "inputSampleRate") == 24000&& objc_msgSend((id)objc_msgSend(v27, "streamConfig"), "rtpTimestampRate") == 48000)
        {
          uint64_t v46 = [v27 rtpHandle];
          signed int v45 = 2;
        }
        else
        {
          int v48 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v47), "config"), "inputSampleRate");
          uint64_t v46 = [v27 rtpHandle];
          if (v48 == 32000) {
            signed int v45 = 3;
          }
          else {
            signed int v45 = 0;
          }
        }
        RTPSetTimestampRateScale(v46, v45);
      }
      uint64_t v24 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v129 objects:v128 count:16];
    }
    while (v24);
  }
  __int16 v49 = &OBJC_IVAR___VCRedundancyControlAlgorithmVideo__offChannelTimeRatio;
  if (!self->_useExternalIO)
  {
    -[VCAudioStream setupCaptionsCoordinatorsWithFormat:direction:](self, "setupCaptionsCoordinatorsWithFormat:direction:", p_vpioFormat, [v113 direction]);

    self->_remoteDeviceInfo = objc_alloc_init(VCAudioHALPluginRemoteDeviceInfo);
    -[VCAudioHALPluginRemoteDeviceInfo setDeviceName:](self->_remoteDeviceInfo, "setDeviceName:", objc_msgSend((id)objc_msgSend(v113, "remoteDeviceInfo"), "deviceName"));
    -[VCAudioHALPluginRemoteDeviceInfo setDeviceUID:](self->_remoteDeviceInfo, "setDeviceUID:", objc_msgSend((id)objc_msgSend(v113, "remoteDeviceInfo"), "deviceUID"));
    -[VCAudioHALPluginRemoteDeviceInfo setModelUID:](self->_remoteDeviceInfo, "setModelUID:", objc_msgSend((id)objc_msgSend(v113, "remoteDeviceInfo"), "modelUID"));
    int v50 = +[VCAudioStream audioIODirectionWithMediaStreamDirection:](VCAudioStream, "audioIODirectionWithMediaStreamDirection:", [v113 direction]);
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_129;
      }
      uint64_t v72 = VRTraceErrorLogLevelToCSTR();
      __int16 v73 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_129;
      }
      remoteDeviceInfo = self->_remoteDeviceInfo;
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v72;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 2363;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = remoteDeviceInfo;
      __int16 v75 = "VCAudioStream [%s] %s:%d configuring remoteDeviceInfo=%p";
      long long v76 = v73;
      uint32_t v77 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v51 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v51 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_129;
      }
      uint64_t v78 = VRTraceErrorLogLevelToCSTR();
      long long v79 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_129;
      }
      int v80 = self->_remoteDeviceInfo;
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = v78;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 2363;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v51;
      *(_WORD *)&buf[38] = 2048;
      *(void *)&buf[40] = self;
      LOWORD(v117) = 2048;
      *(void *)((char *)&v117 + 2) = v80;
      __int16 v75 = "VCAudioStream [%s] %s:%d %@(%p) configuring remoteDeviceInfo=%p";
      long long v76 = v79;
      uint32_t v77 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v76, OS_LOG_TYPE_DEFAULT, v75, buf, v77);
LABEL_129:
    *(void *)&long long v81 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v81 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v126 = v81;
    long long v127 = v81;
    long long v124 = v81;
    long long v125 = v81;
    long long v122 = v81;
    long long v123 = v81;
    long long v120 = v81;
    long long p_sourceContext = v81;
    long long v118 = v81;
    long long v119 = v81;
    *(_OWORD *)&buf[32] = v81;
    long long v117 = v81;
    *(_OWORD *)buf = v81;
    *(_OWORD *)&buf[16] = v81;
    *(_DWORD *)buf = VCUniqueIDGenerator_GenerateID();
    *(_DWORD *)&uint8_t buf[4] = 0;
    int deviceRole = self->deviceRole;
    *(_DWORD *)&buf[8] = self->super._operatingMode;
    *(_DWORD *)&unsigned char buf[12] = deviceRole;
    *(_DWORD *)&buf[16] = +[VCAudioStream audioIOTypeForMode:](VCAudioStream, "audioIOTypeForMode:", [v113 audioStreamMode]);
    buf[20] = v50;
    buf[21] = 0;
    *(void *)&buf[24] = self;
    *(_DWORD *)&buf[32] = self->_clientPid;
    *(void *)&buf[36] = 0;
    buf[44] = 0;
    *(void *)&long long v117 = self->super._streamToken;
    DWORD2(v117) = +[VCAudioStream audioChannelCountForMode:](VCAudioStream, "audioChannelCountForMode:", [obj firstObject]);
    uint64_t v83 = [v113 streamInputID];
    int64_t streamToken = self->super._streamToken;
    *(void *)&long long v118 = v83;
    *((void *)&v118 + 1) = streamToken;
    *(void *)&long long v119 = [v113 networkClockID];
    WORD4(v119) = 256;
    __int16 v49 = &OBJC_IVAR___VCRedundancyControlAlgorithmVideo__offChannelTimeRatio;
    *(void *)&long long v120 = 0;
    *((void *)&v120 + 1) = VCAudioStream_PullAudioSamples;
    long long p_sourceContext = (unint64_t)&self->_sourceContext;
    *(void *)&long long v122 = 0;
    BYTE8(v122) = 0;
    *(void *)&long long v123 = 0;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    *((void *)&v123 + 1) = self;
    *(void *)&long long v127 = self->_remoteDeviceInfo;
    BYTE8(v127) = -[VCAudioStream networkUplinkClockUsesBaseband:](self, "networkUplinkClockUsesBaseband:", [v113 audioStreamMode]);
    BYTE9(v127) = [v113 audioStreamMode] == 11;
    audioIO = self->_audioIO;
    if (audioIO)
    {
      if (![(VCAudioIO *)audioIO reconfigureWithConfig:buf])
      {
        [(VCAudioStream *)self setAudioIO:0];
        goto LABEL_156;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_139;
      }
      uint64_t v86 = VRTraceErrorLogLevelToCSTR();
      long long v87 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_139;
      }
      long long v88 = self->_audioIO;
      int v89 = self->super._operatingMode;
      int v90 = self->deviceRole;
      *(_DWORD *)v114 = 136316930;
      *(void *)&v114[4] = v86;
      *(_WORD *)&v114[12] = 2080;
      *(void *)&v114[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
      *(_WORD *)&v114[22] = 1024;
      *(_DWORD *)&v114[24] = 2407;
      *(_WORD *)&v114[28] = 2048;
      *(void *)&v114[30] = self;
      *(_WORD *)&v114[38] = 2048;
      *(void *)&v114[40] = v88;
      *(_WORD *)&v114[48] = 1024;
      *(_DWORD *)&v114[50] = v89;
      *(_WORD *)&v114[54] = 1024;
      *(_DWORD *)&v114[56] = v90;
      *(_WORD *)&v114[60] = 1024;
      *(_DWORD *)&v114[62] = v50;
      long long v91 = "VCAudioStream [%s] %s:%d (%p) reconfigured audioIO=%p operatingMode:%d deviceRole:%d direction:%d";
      goto LABEL_138;
    }
    long long v92 = [[VCAudioIO alloc] initWithConfiguration:buf];
    self->_audioIO = v92;
    if (v92)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_139;
      }
      uint64_t v93 = VRTraceErrorLogLevelToCSTR();
      long long v87 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_139;
      }
      uint64_t v94 = self->_audioIO;
      int v95 = self->super._operatingMode;
      int v96 = self->deviceRole;
      *(_DWORD *)v114 = 136316930;
      *(void *)&v114[4] = v93;
      *(_WORD *)&v114[12] = 2080;
      *(void *)&v114[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
      *(_WORD *)&v114[22] = 1024;
      *(_DWORD *)&v114[24] = 2401;
      *(_WORD *)&v114[28] = 2048;
      *(void *)&v114[30] = self;
      *(_WORD *)&v114[38] = 2048;
      *(void *)&v114[40] = v94;
      *(_WORD *)&v114[48] = 1024;
      *(_DWORD *)&v114[50] = v95;
      *(_WORD *)&v114[54] = 1024;
      *(_DWORD *)&v114[56] = v96;
      *(_WORD *)&v114[60] = 1024;
      *(_DWORD *)&v114[62] = v50;
      long long v91 = "VCAudioStream [%s] %s:%d (%p) created audioIO=%p operatingMode:%d deviceRole:%d direction:%d";
LABEL_138:
      _os_log_impl(&dword_1E1EA4000, v87, OS_LOG_TYPE_DEFAULT, v91, v114, 0x42u);
LABEL_139:
      v115[0] = 0;
      memset(v114, 0, sizeof(v114));
      AUIOGetAUNumber(v115);
      [(VCAudioIO *)self->_audioIO setMuted:self->_isMuted];
      [(VCAudioIO *)self->_audioIO setClientFormat:p_vpioFormat];
      [(VCAudioIO *)self->_audioIO setRemoteCodecType:+[VCPayloadUtils audioCodecTypeForPayload:[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload]] sampleRate:(double)[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] codecSampleRate]];
      [(VCAudioIO *)self->_audioIO setFarEndVersionInfo:v114];
      goto LABEL_140;
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v111, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioStream.m", 2395), @"Failed to create VCAudioIO", @"Invalid config caused VCAudioIO init to fail");
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_156;
      }
      uint64_t v101 = VRTraceErrorLogLevelToCSTR();
      v102 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_156;
      }
      *(_DWORD *)v114 = 136315650;
      *(void *)&v114[4] = v101;
      *(_WORD *)&v114[12] = 2080;
      *(void *)&v114[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
      *(_WORD *)&v114[22] = 1024;
      *(_DWORD *)&v114[24] = 2398;
      v103 = "VCAudioStream [%s] %s:%d VCAudioIO initWithConfiguration failed";
      v104 = v102;
      uint32_t v105 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v100 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
      }
      else {
        v100 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_156;
      }
      uint64_t v106 = VRTraceErrorLogLevelToCSTR();
      v107 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_156;
      }
      *(_DWORD *)v114 = 136316162;
      *(void *)&v114[4] = v106;
      *(_WORD *)&v114[12] = 2080;
      *(void *)&v114[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
      *(_WORD *)&v114[22] = 1024;
      *(_DWORD *)&v114[24] = 2398;
      *(_WORD *)&v114[28] = 2112;
      *(void *)&v114[30] = v100;
      *(_WORD *)&v114[38] = 2048;
      *(void *)&v114[40] = self;
      v103 = "VCAudioStream [%s] %s:%d %@(%p) VCAudioIO initWithConfiguration failed";
      v104 = v107;
      uint32_t v105 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v104, OS_LOG_TYPE_DEFAULT, v103, v114, v105);
LABEL_156:
    LOBYTE(v21) = 0;
    return v21;
  }
LABEL_140:
  BOOL v97 = [(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] direction] == 1;
  v98 = (unsigned int **)((char *)self + v49[470]);
  *((unsigned char *)v98 + 41) = v97;
  *((unsigned char *)v98 + 40) = self->super._operatingMode != 6;
  [(VCMediaStream *)self registerMediaControlInfoGeneratorWithConfigs:obj];
  if (![(VCAudioStream *)self createAudioReceiver])
  {
    [(VCAudioStream *)self setAudioIO:0];
LABEL_155:
    [(VCMediaStream *)self unregisterMediaControlInfoGenerator];
    goto LABEL_156;
  }
  if ((self->super._operatingMode != 6 || [(VCMediaStream *)self isSendingMedia])
    && !-[VCAudioStream createAudioTransmitter:streamIDs:](self, "createAudioTransmitter:streamIDs:", [v113 audioStreamMode], -[VCAudioStream streamIDsFromTransport](self, "streamIDsFromTransport")))
  {
    [(VCAudioStream *)self setAudioIO:0];
    VCAudioReceiver_Finalize(v98[3]);
    v98[3] = 0;
    goto LABEL_155;
  }
  if (self->_constantTransportOverhead && self->super._operatingMode == 6) {
    -[VCMediaStream updateTransportsWithConstantConnectionOverhead:](self, "updateTransportsWithConstantConnectionOverhead:");
  }
  if (!self->_isTelephony) {
    goto LABEL_150;
  }
  v99 = -[VCTelephonyInterface initWithTelephonySubscriptionSlot:]([VCTelephonyInterface alloc], "initWithTelephonySubscriptionSlot:", [v113 subscriptionSlot]);
  self->_telephonyInterface = v99;
  if (v99)
  {
    [(VCTelephonyInterface *)v99 setDelegate:self];
LABEL_150:
    if (+[VCAudioStream isVoLTE:[(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] audioStreamMode]])
    {
      [(VCAudioStream *)self configureCellularFeatures];
    }
    [(VCTransportSession *)self->super._transportSession setShouldIgnoreConnectionRefusedError:self->_isTelephony];
    LOBYTE(v21) = 1;
    return v21;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioStream onConfigureStreamWithConfiguration:error:]();
    }
  }
  [(VCAudioStream *)self setAudioIO:0];
  VCAudioReceiver_Finalize(v98[3]);
  v98[3] = 0;
  [(VCMediaStream *)self unregisterMediaControlInfoGenerator];

  LOBYTE(v21) = 0;
  self->_audioTransmitter = 0;
  return v21;
}

- (void)updateRateAdaptationWithNetworkNotification:(tagVCNWConnectionNotification *)a3
{
}

- (BOOL)shouldResetRTPTimestampOnStart
{
  return self->super._operatingMode == 11;
}

- (BOOL)shouldReportNetworkInterfaceType
{
  return self->super._operatingMode == 11;
}

- (BOOL)shouldRegisterReportingPeriodicTask
{
  return (self->super._operatingMode < 0xDu) & (0x1808u >> self->super._operatingMode);
}

- (void)onStartWithCompletionHandler:(id)a3
{
  v8[6] = *MEMORY[0x1E4F143B8];
  [(VCAudioStream *)self prepareAudio];
  if ([(VCAudioStream *)self shouldResetRTPTimestampOnStart])
  {
    self->uint64_t lastSentAudioSampleTime = 0;
    self->unsigned int lastInputAudioTimeStamp = 0;
    self->double dAudioHostTime = 0.0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__VCAudioStream_onStartWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6DB5860;
  v8[4] = self;
  v8[5] = a3;
  [(VCAudioStream *)self startAudioWithCompletionHandler:v8];
  if ([(VCAudioStream *)self shouldRegisterReportingPeriodicTask]) {
    [(VCAudioStream *)self setupPeriodicReporting];
  }
  int operatingMode = self->super._operatingMode;
  if ((operatingMode - 1) < 2) {
    goto LABEL_8;
  }
  if (operatingMode != 6)
  {
    [(VCMediaStream *)self registerAggregationHandlers];
LABEL_8:
    [(VCObject *)self reportingAgent];
    reportingStartTimer();
  }
  [(VCAudioStream *)self reportingAudioStreamEvent:182];
  self->_sourceContext.delegate = [(VCMediaStream *)self delegate];
  self->_sourceContext.delegateFunctions.updateFrequencyLevel = (void *)[(VCMediaStream *)self delegateFunctions];
  self->_sourceContext.momentsCollectorDelegate = [(VCMediaStream *)self momentsCollectorDelegate];
  uint64_t v6 = [(VCAudioTransmitter *)[(VCAudioStream *)self audioTransmitter] currentAudioPayloadConfig];
  audioReceiver = self->_sourceContext.audioReceiver;
  [(VCAudioPayloadConfig *)v6 payload];
  [(VCAudioTransmitter *)[(VCAudioStream *)self audioTransmitter] audioTxBitrate];
  [(VCAudioPayloadConfig *)v6 codecSampleRate];
  VCAudioReceiver_SendStartCallReport((uint64_t)audioReceiver);
  [(VCMediaStream *)self registerStatistics:self->_statsCollector];
}

uint64_t __46__VCAudioStream_onStartWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    [*(id *)(a1 + 32) reportingAgent];
    reportingSymptom();
    [*(id *)(a1 + 32) cleanupAudio];
  }
  if ([*(id *)(a1 + 32) isVoLTERateAdaptationEnabled]) {
    [*(id *)(*(void *)(a1 + 32) + 712) start];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 1704))
  {
    int v4 = VCPayloadUtils_AudioCodecRateModeForBitrate(objc_msgSend((id)objc_msgSend(*(id *)(v3 + 1160), "currentAudioPayloadConfig"), "payload"), objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1160), "currentAudioPayloadConfig"), "bitrate"));
    int v5 = VCPayloadUtils_DefaultAudioCodecBandwidthCodecForSampleRate(objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1160), "currentAudioPayloadConfig"), "codecSampleRate"));
    int v6 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1160), "currentAudioPayloadConfig"), "payload");
    int v7 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1160), "currentAudioPayloadConfig"), "bitrate");
    int v8 = *(void **)(*(void *)(a1 + 32) + 1176);
    v14[0] = v6;
    v14[1] = v4;
    v14[2] = v5;
    v14[3] = v7;
    uint64_t v15 = 0;
    [v8 notifyCodecModeChangeEventToCT:v14];
    uint64_t v9 = *(void *)(a1 + 32) + 1548;
    *(_DWORD *)uint64_t v9 = v6;
    *(_DWORD *)(v9 + 4) = v4;
    *(_DWORD *)(v9 + 8) = v5;
    *(_DWORD *)(v9 + 12) = v7;
    *(void *)(v9 + 16) = 0;
    uint64_t v10 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v10 + 1544))
    {
      uint64_t v11 = *(void **)(v10 + 1176);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __46__VCAudioStream_onStartWithCompletionHandler___block_invoke_2;
      v13[3] = &unk_1E6DB5838;
      uint8_t v13[4] = v10;
      [v11 getAnbrActivationStateWithCompletionHandler:v13];
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __46__VCAudioStream_onStartWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      int v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315906;
        uint64_t v7 = v4;
        __int16 v8 = 2080;
        uint64_t v9 = "-[VCAudioStream onStartWithCompletionHandler:]_block_invoke_2";
        __int16 v10 = 1024;
        int v11 = 2581;
        __int16 v12 = 2112;
        uint64_t v13 = a3;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d VCTelephonyInterface returned error=%@", (uint8_t *)&v6, 0x26u);
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1545) = a2;
  }
}

- (void)onStopWithCompletionHandler:(id)a3
{
  void v5[6] = *MEMORY[0x1E4F143B8];
  if (self->_isTelephony)
  {
    VCAudioTransmitter_ReportAWDMetrics((uint64_t)[(VCAudioStream *)self audioTransmitter]);
    VCAudioReceiver_ReportAWDMetrics(&self->_sourceContext.audioReceiver->var0.var0);
  }
  VCAudioReceiver_SendEndCallReport((uint64_t)self->_sourceContext.audioReceiver);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __45__VCAudioStream_onStopWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E6DB5860;
  v5[4] = self;
  void v5[5] = a3;
  [(VCAudioStream *)self stopAudioWithCompletionHandler:v5];
}

uint64_t __45__VCAudioStream_onStopWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cleanupAudio];
  [*(id *)(*(void *)(a1 + 32) + 712) stop];
  if ([*(id *)(a1 + 32) shouldRegisterReportingPeriodicTask])
  {
    [*(id *)(a1 + 32) reportingAgent];
    reportingUnregisterPeriodicTask();
  }
  if ([*(id *)(a1 + 32) shouldStopReportingTimer])
  {
    [*(id *)(a1 + 32) reportingAgent];
    reportingStopTimer();
  }
  [*(id *)(a1 + 32) reportingAlgosAudioStreamEvent:2];
  [*(id *)(a1 + 32) reportingAudioStreamEvent:183];
  int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
}

- (void)onPauseWithCompletionHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  uint64_t v9 = __46__VCAudioStream_onPauseWithCompletionHandler___block_invoke;
  __int16 v10 = &unk_1E6DB5860;
  int v11 = self;
  id v12 = a3;
  id v4 = (id)[v8 copy];
  if (self->super._operatingMode == 6)
  {
    [(VCAudioTransmitter *)[(VCAudioStream *)self audioTransmitter] setPeriodicReportingEnabled:0];
    ((void (*)(void *, uint64_t, void))v9)(v8, 1, 0);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      int v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        audioIO = self->_audioIO;
        *(_DWORD *)buf = 136316162;
        uint64_t v14 = v5;
        __int16 v15 = 2080;
        uint64_t v16 = "-[VCAudioStream onPauseWithCompletionHandler:]";
        __int16 v17 = 1024;
        int v18 = 2658;
        __int16 v19 = 2048;
        __int16 v20 = self;
        __int16 v21 = 2048;
        __int16 v22 = audioIO;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d (%p) pausing audioIO=%p", buf, 0x30u);
      }
    }
    [(VCAudioIO *)self->_audioIO stopWithCompletionHandler:v8];
  }
}

uint64_t __46__VCAudioStream_onPauseWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __46__VCAudioStream_onPauseWithCompletionHandler___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) reportingAudioStreamEvent:184];
  [*(id *)(a1 + 32) reportingAlgosAudioStreamEvent:2];
  VCMediaStream_Unlock(*(void *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)onResumeWithCompletionHandler:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  transportArray = self->super._transportArray;
  uint64_t v6 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v30 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(transportArray);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * i) reset];
      }
      uint64_t v7 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v30 objects:v29 count:16];
    }
    while (v7);
  }
  VCAudioReceiver_Reset((uint64_t)self->_sourceContext.audioReceiver);
  [(VCPacketBundler *)[(VCAudioTransmitter *)self->_audioTransmitter audioBundler] resetBuffer];
  [(VCPacketBundler *)[(VCAudioTransmitter *)self->_audioTransmitter audioBundlerShortRED] resetBuffer];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  __int16 v15 = __47__VCAudioStream_onResumeWithCompletionHandler___block_invoke;
  uint64_t v16 = &unk_1E6DB5860;
  __int16 v17 = self;
  id v18 = a3;
  if (self->super._operatingMode == 6)
  {
    [(VCAudioTransmitter *)[(VCAudioStream *)self audioTransmitter] setPeriodicReportingEnabled:1];
    ((void (*)(uint64_t *, uint64_t, void))v15)(&v13, 1, 0);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        audioIO = self->_audioIO;
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v10;
        __int16 v21 = 2080;
        __int16 v22 = "-[VCAudioStream onResumeWithCompletionHandler:]";
        __int16 v23 = 1024;
        int v24 = 2689;
        __int16 v25 = 2048;
        __int16 v26 = self;
        __int16 v27 = 2048;
        uint64_t v28 = audioIO;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d (%p) resume audioIO=%p", buf, 0x30u);
      }
    }
    [(VCAudioIO *)self->_audioIO startWithCompletionHandler:&v13];
  }
}

uint64_t __47__VCAudioStream_onResumeWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __47__VCAudioStream_onResumeWithCompletionHandler___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) reportingAudioStreamEvent:185];
  [*(id *)(a1 + 32) reportingAlgosAudioStreamEvent:0];
  VCMediaStream_Unlock(*(void *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)onRTCPTimeout
{
  if (self->super._operatingMode == 11) {
    [(VCAudioStream *)self reportingAudioStreamEvent:242];
  }
}

- (void)onSendRTCPPacket
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  memset(v13, 0, sizeof(v13));
  memset(__b, 170, sizeof(__b));
  memset(v11, 170, sizeof(v11));
  unsigned __int8 v9 = 35;
  BOOL v3 = [(VCAudioStream *)self generateRTCPXRSummaryReports:__b reportCount:&v9];
  uint64_t v4 = v9;
  if (v3)
  {
    *(void *)&long long v16 = __b;
    BYTE8(v16) = v9;
    v13[0] = 256;
  }
  if (v9)
  {
    uint64_t v5 = &__b[14];
    uint64_t v6 = &v11[30];
    do
    {
      *(_DWORD *)(v6 - 2) = *(_DWORD *)(v5 - 2);
      v5 += 44;
      v6 += 32;
      --v4;
    }
    while (v4);
  }
  unsigned __int8 v9 = 35;
  if ([(VCAudioStream *)self generateRTCPXRVoIPMetricsReports:v11 reportCount:&v9])
  {
    *(void *)&long long v17 = v11;
    BYTE8(v17) = v9;
    v13[0] = 256;
  }
  memset(v10, 170, sizeof(v10));
  rtcpReportProvider = self->super._rtcpReportProvider;
  if (rtcpReportProvider)
  {
    unsigned __int8 v9 = 35;
    objc_msgSend((id)-[VCWeakObjectHolder strong](rtcpReportProvider, "strong"), "generateReceptionReportList:reportCount:", v10, &v9);
    if (v9)
    {
      *((void *)&v14 + 1) = v10;
      LOBYTE(v15) = v9;
    }
  }
  [(VCMediaStream *)self sendControlPacketWithParameters:v13];
  audioTransmitter = self->_audioTransmitter;
  if (audioTransmitter) {
    [(VCAudioTransmitter *)audioTransmitter reportRTCPPacket];
  }
}

- (double)rtcpHeartbeatLeeway
{
  return 0.001;
}

- (void)setStreamIDs:(id)a3 repairStreamIDs:(id)a4
{
}

- (void)setTargetStreamID:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (-[NSNumber isEqualToNumber:](self->_targetStreamID, "isEqualToNumber:"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 136315906;
          uint64_t v18 = v5;
          __int16 v19 = 2080;
          long long v20 = "-[VCAudioStream setTargetStreamID:]";
          __int16 v21 = 1024;
          int v22 = 2759;
          __int16 v23 = 2112;
          id v24 = a3;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d TargetStreamID didn't change %@", (uint8_t *)&v17, 0x26u);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[VCAudioStream setTargetStreamID:]();
      }
    }
    return;
  }
  if ((VCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_17;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    int v17 = 136315906;
    uint64_t v18 = v9;
    __int16 v19 = 2080;
    long long v20 = "-[VCAudioStream setTargetStreamID:]";
    __int16 v21 = 1024;
    int v22 = 2762;
    __int16 v23 = 2112;
    id v24 = a3;
    int v11 = "VCAudioStream [%s] %s:%d Setting target stream id: %@";
    id v12 = v10;
    uint32_t v13 = 38;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_17;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    long long v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    int v17 = 136316418;
    uint64_t v18 = v14;
    __int16 v19 = 2080;
    long long v20 = "-[VCAudioStream setTargetStreamID:]";
    __int16 v21 = 1024;
    int v22 = 2762;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2048;
    __int16 v26 = self;
    __int16 v27 = 2112;
    id v28 = a3;
    int v11 = "VCAudioStream [%s] %s:%d %@(%p) Setting target stream id: %@";
    id v12 = v15;
    uint32_t v13 = 58;
  }
  _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
LABEL_17:

  self->_targetStreamID = (NSNumber *)a3;
  VCMediaStream_Lock((uint64_t)self);
  audioReceiver = self->_sourceContext.audioReceiver;
  if (audioReceiver) {
    VCAudioReceiver_SetTargetStreamID((uint64_t)audioReceiver, [a3 unsignedShortValue]);
  }
  VCMediaStream_Unlock((uint64_t)self);
}

- (void)setupPeriodicReporting
{
  if ([(VCObject *)self reportingAgent])
  {
    [(VCObject *)self reportingAgent];
    reportingRegisterPeriodicTaskWeak();
  }
}

uint64_t __39__VCAudioStream_setupPeriodicReporting__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  VCMediaStream_Lock((uint64_t)a2);
  if ([a2 state] == 2) {
    [a2 gatherRealtimeStats:a3];
  }

  return VCMediaStream_Unlock((uint64_t)a2);
}

- (void)setupReportingAgent:(id)a3
{
  self->super._isReportingAgentOwner = 1;
  uint64_t v5 = [(VCAudioStream *)self getReportingClientType];
  -[VCMediaStream applyClientSessionID:clientUserInfo:](self, "applyClientSessionID:clientUserInfo:", v5, [MEMORY[0x1E4F1CA60] dictionary]);
  [(VCAudioStream *)self getReportingClientName];
  [(VCAudioStream *)self getReportingServiceID];
  Agent = (const void *)reportingCreateAgent();
  [(VCObject *)self setReportingAgent:Agent];
  if (Agent) {
    CFRelease(Agent);
  }
  [(VCObject *)self reportingAgent];
  self->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
  [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  [(VCObject *)self reportingAgent];
  [(VCAudioStream *)self getReportingClientName];
  [(VCAudioStream *)self getReportingServiceID];
  [(VCAudioStream *)self getClientSpecificUserInfo:a3];
  reportingSetUserInfo();
}

void __37__VCAudioStream_setupReportingAgent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![a2 count])
  {
    [*(id *)(a1 + 32) strong];
    uint64_t v3 = objc_opt_class();
    if (v3 == [*(id *)(a1 + 32) strong])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __37__VCAudioStream_setupReportingAgent___block_invoke_cold_1();
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) strong];
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "performSelector:", sel_logPrefix);
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v7 = [*(id *)(a1 + 32) strong];
          int v8 = 136316162;
          uint64_t v9 = v5;
          __int16 v10 = 2080;
          int v11 = "-[VCAudioStream setupReportingAgent:]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 2830;
          __int16 v14 = 2112;
          long long v15 = v4;
          __int16 v16 = 2048;
          uint64_t v17 = v7;
          _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Reporting not available (no backends)", (uint8_t *)&v8, 0x30u);
        }
      }
    }
  }
}

- (BOOL)isStandaloneStreamClientSpecificUserInfoSupported
{
  return (self->super._operatingMode < 0xDu) & (0x1820u >> self->super._operatingMode);
}

- (__CFDictionary)getClientSpecificUserInfo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (-[VCAudioStream isStandaloneStreamClientSpecificUserInfoSupported](self, "isStandaloneStreamClientSpecificUserInfoSupported")&& [a3 count])
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", self->super._streamToken), @"VCVSStreamToken");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "direction")), @"VCMSDirection");
    callID = self->super._callID;
    if (callID) {
      [v5 setObject:callID forKeyedSubscript:@"CallID"];
    }
    [(VCMediaStream *)self applyClientSessionID:[(VCAudioStream *)self getReportingClientType] clientUserInfo:v5];
  }
  else if (self->super._operatingMode == 6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v21 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(a3);
          }
          __int16 v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          int v13 = objc_msgSend((id)objc_msgSend(v12, "multiwayConfig"), "idsStreamID");
          __int16 v14 = NSNumber;
          long long v15 = (void *)[v12 multiwayConfig];
          if (v13) {
            uint64_t v16 = objc_msgSend(v14, "numberWithUnsignedShort:", objc_msgSend(v15, "idsStreamID"));
          }
          else {
            uint64_t v16 = objc_msgSend(v14, "numberWithUnsignedInt:", objc_msgSend(v15, "streamGroupID"));
          }
          [v7 addObject:v16];
        }
        uint64_t v9 = [a3 countByEnumeratingWithState:&v21 objects:v20 count:16];
      }
      while (v9);
    }
    uint64_t v17 = (void *)[a3 objectAtIndexedSubscript:0];
    objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "streamGroupID");
    uint64_t v18 = reportingStreamGroupFromStreamGroupID();
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "sessionId"), @"VCSUUID");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "participantId"), @"VCSPUUID");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v7, "componentsJoinedByString:", @","), @"VCASStreamIDs");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "direction")), "stringValue"), @"VCMSDirection");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v18), @"VCMSStreamGroup");
    [(VCMediaStream *)self applyClientSessionID:[(VCAudioStream *)self getReportingClientType] clientUserInfo:v5];
  }
  else
  {
    return 0;
  }
  return (__CFDictionary *)v5;
}

- (int)getReportingClientType
{
  int operatingMode = self->super._operatingMode;
  int result = -1;
  switch(operatingMode)
  {
    case 3:
      int result = 1;
      break;
    case 5:
      int result = 2;
      break;
    case 6:
      int result = 4;
      break;
    case 11:
      if ([(NSString *)self->super._clientName isEqualToString:*MEMORY[0x1E4F47B30]]) {
        int result = 17;
      }
      else {
        int result = 11;
      }
      break;
    case 12:
      if ([(NSString *)self->super._clientName isEqualToString:@"CoreDeviceScreenSharing"])
      {
        int result = 14;
      }
      else if ([(NSString *)self->super._clientName isEqualToString:@"RemoteDesktopScreenSharing"]|| [(NSString *)self->super._clientName isEqualToString:*MEMORY[0x1E4F47AE8]])
      {
        int result = 18;
      }
      else if ([(NSString *)self->super._clientName isEqualToString:@"NearbyScreenSharing"])
      {
        int result = 20;
      }
      else if ([(NSString *)self->super._clientName isEqualToString:@"SidecarSharing"])
      {
        int result = 22;
      }
      else
      {
        int result = -1;
      }
      break;
    default:
      return result;
  }
  return result;
}

- (__CFString)getReportingClientName
{
  int v2 = &stru_1F3D3E450;
  switch(self->super._operatingMode)
  {
    case 3:
      uint64_t v4 = (__CFString **)MEMORY[0x1E4F47B68];
      return *v4;
    case 5:
      uint64_t v4 = (__CFString **)MEMORY[0x1E4F47B10];
      return *v4;
    case 6:
      uint64_t v4 = (__CFString **)MEMORY[0x1E4F47B20];
      return *v4;
    case 8:
      goto LABEL_15;
    case 0xB:
      uint64_t v5 = (__CFString **)MEMORY[0x1E4F47B30];
      if ([(NSString *)self->super._clientName isEqualToString:*MEMORY[0x1E4F47B30]]) {
        return *v5;
      }
      uint64_t v4 = (__CFString **)MEMORY[0x1E4F47B50];
      return *v4;
    case 0xC:
      if ([(NSString *)self->super._clientName isEqualToString:@"CoreDeviceScreenSharing"])
      {
        uint64_t v4 = (__CFString **)MEMORY[0x1E4F47AF8];
        return *v4;
      }
      if ([(NSString *)self->super._clientName isEqualToString:@"RemoteDesktopScreenSharing"])
      {
        uint64_t v4 = (__CFString **)MEMORY[0x1E4F47B48];
        return *v4;
      }
      if ([(NSString *)self->super._clientName isEqualToString:@"NearbyScreenSharing"])
      {
        uint64_t v4 = (__CFString **)MEMORY[0x1E4F47B28];
        return *v4;
      }
      if ([(NSString *)self->super._clientName isEqualToString:@"SidecarSharing"])
      {
LABEL_15:
        uint64_t v4 = (__CFString **)MEMORY[0x1E4F47B58];
        return *v4;
      }
      clientName = self->super._clientName;
      uint64_t v8 = (__CFString **)MEMORY[0x1E4F47AE8];
      if ([(NSString *)clientName isEqualToString:*MEMORY[0x1E4F47AE8]]) {
        return *v8;
      }
      return v2;
    default:
      return v2;
  }
}

- (id)getReportingServiceID
{
  unsigned int operatingMode = self->super._operatingMode;
  id result = &stru_1F3D3E450;
  if (operatingMode <= 0xC)
  {
    if (((1 << operatingMode) & 0x1848) != 0)
    {
      return @"Audio";
    }
    else if (operatingMode == 5)
    {
      return (id)*MEMORY[0x1E4F47B18];
    }
  }
  return result;
}

- (void)reportTimestampJumpsWithReportingDictionary:(__CFDictionary *)a3
{
  uint64_t v4 = NSNumber;
  p_periodicReportingMetrics = &self->_periodicReportingMetrics;
  atomic_exchange((atomic_ullong *volatile)&self->_periodicReportingMetrics.timestampJumpDuration, 0);
  CFDictionaryAddValue(a3, @"VCASTimestampJumpDuration", (const void *)objc_msgSend(v4, "numberWithUnsignedLong:"));
  uint64_t v6 = NSNumber;
  atomic_exchange((atomic_uint *volatile)p_periodicReportingMetrics, 0);
  CFDictionaryAddValue(a3, @"VCASTimestampJumpCount", (const void *)objc_msgSend(v6, "numberWithUnsignedInt:"));
  id v7 = NSNumber;
  unint64_t v8 = atomic_load(&p_periodicReportingMetrics->timestampJumpMax);
  uint64_t v9 = (const void *)[v7 numberWithUnsignedLong:v8];

  CFDictionaryAddValue(a3, @"VCASTimestampJumpMax", v9);
}

- (void)gatherRealtimeStats:(__CFDictionary *)a3
{
  uint64_t v5 = [(VCAudioIO *)self->_audioIO reportingStats];
  if (v5) {
    VCUtil_AppendFromDictionary(a3, (CFDictionaryRef)v5);
  }
  [(VCAudioStream *)self reportTimestampJumpsWithReportingDictionary:a3];

  [(VCMediaStream *)self collectChannelSequenceMetrics:a3];
}

- (void)updateCodecPayloadAndBitrateForStartEvent:(int *)a3 bitrate:(unsigned int *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      obuint64_t j = self->super._transportArray;
      uint64_t v24 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v32 count:16];
      if (v24)
      {
        uint64_t v23 = *(void *)v34;
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v34 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v25 = v6;
            id v7 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * v6) streamConfig];
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            unint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "allCodecConfigurations"), "allValues");
            uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v27 count:16];
            if (v9)
            {
              uint64_t v10 = v9;
              uint64_t v11 = *(void *)v29;
              do
              {
                for (uint64_t i = 0; i != v10; ++i)
                {
                  if (*(void *)v29 != v11) {
                    objc_enumerationMutation(v8);
                  }
                  int v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                  int v14 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [v13 codecType]);
                  unsigned int v15 = +[VCPayloadUtils bitrateForCodecType:mode:](VCPayloadUtils, "bitrateForCodecType:mode:", [v13 codecType], objc_msgSend(v13, "preferredMode"));
                  if (v15 > *a4)
                  {
                    *a4 = v15;
                    *a3 = v14;
                  }
                }
                uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v27 count:16];
              }
              while (v10);
            }
            uint64_t v6 = v25 + 1;
          }
          while (v25 + 1 != v24);
          uint64_t v24 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v32 count:16];
        }
        while (v24);
      }
      return;
    }
    if ((VCAudioStream *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v17 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v38 = v21;
      __int16 v39 = 2080;
      int v40 = "-[VCAudioStream updateCodecPayloadAndBitrateForStartEvent:bitrate:]";
      __int16 v41 = 1024;
      int v42 = 3009;
      __int16 v43 = 2112;
      uint64_t v44 = v17;
      __int16 v45 = 2048;
      uint64_t v46 = self;
      long long v20 = "VCAudioStream [%s] %s:%d %@(%p) Bitrate is null";
      goto LABEL_40;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStream updateCodecPayloadAndBitrateForStartEvent:bitrate:]();
      }
    }
  }
  else
  {
    if ((VCAudioStream *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v16 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v38 = v18;
      __int16 v39 = 2080;
      int v40 = "-[VCAudioStream updateCodecPayloadAndBitrateForStartEvent:bitrate:]";
      __int16 v41 = 1024;
      int v42 = 3008;
      __int16 v43 = 2112;
      uint64_t v44 = v16;
      __int16 v45 = 2048;
      uint64_t v46 = self;
      long long v20 = "VCAudioStream [%s] %s:%d %@(%p) Payload is null";
LABEL_40:
      _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x30u);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStream updateCodecPayloadAndBitrateForStartEvent:bitrate:]();
      }
    }
  }
}

- (void)addStreamStartingMetricsToReport:(const __CFDictionary *)a3
{
  uint64_t v5 = [(VCMediaStream *)self defaultStreamConfig];
  CFDictionaryAddValue(a3, @"VCASMaxNetworkBitRate", (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCMediaStreamMultiwayConfig maxNetworkBitrate](-[VCMediaStreamConfig multiwayConfig](v5, "multiwayConfig"), "maxNetworkBitrate")));
  if (![(VCAudioStream *)self isStandaloneStreamClientSpecificUserInfoSupported])
  {
    if (self->super._operatingMode != 3) {
      return;
    }
    unint64_t v8 = (NSString *)objc_msgSend(NSNumber, "numberWithBool:", -[VCMediaStreamConfig outOfProcessCodecsEnabled](v5, "outOfProcessCodecsEnabled"));
    uint64_t v9 = @"VCMSOOPCodecs";
    goto LABEL_8;
  }
  CFDictionaryAddValue(a3, @"VCVSStreamToken", (const void *)[NSNumber numberWithInteger:self->super._streamToken]);
  CFDictionaryAddValue(a3, @"VCMSDirection", (const void *)objc_msgSend(NSNumber, "numberWithInteger:", -[VCMediaStreamConfig direction](v5, "direction")));
  callID = self->super._callID;
  if (callID) {
    CFDictionaryAddValue(a3, @"CallID", callID);
  }
  remoteEndpointInfo = self->super._remoteEndpointInfo;
  if (remoteEndpointInfo)
  {
    CFDictionaryAddValue(a3, @"VCVSRemoteDeviceModel", [(VCCallInfoBlob *)remoteEndpointInfo deviceType]);
    unint64_t v8 = [(VCCallInfoBlob *)self->super._remoteEndpointInfo osVersion];
    uint64_t v9 = @"VCVSRemoteOSBuildVersion";
LABEL_8:
    CFDictionaryAddValue(a3, v9, v8);
  }
}

- (void)reportingAudioStreamEvent:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  uint64_t v6 = [(VCMediaStream *)self defaultStreamConfig];
  uint64_t v7 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload];
  HIDWORD(v12) = v7;
  LODWORD(v12) = [(VCAudioPayload *)self->currentAudioPayload bitrate];
  if (self->super._operatingMode == 6)
  {
    uint64_t v8 = [(VCMediaStreamConfig *)v6 direction];
    if (v3 == 182 && v8 == 1)
    {
      [(VCAudioStream *)self updateCodecPayloadAndBitrateForStartEvent:(char *)&v12 + 4 bitrate:&v12];
LABEL_8:
      -[VCAudioStream addStreamStartingMetricsToReport:](self, "addStreamStartingMetricsToReport:", Mutable, v12, v13);
      uint64_t v7 = HIDWORD(v12);
      goto LABEL_9;
    }
  }
  if (v3 != 187)
  {
    if (v3 == 183)
    {
      uint64_t v11 = [(VCMediaStream *)self endReason];
      uint64_t v9 = (const void *)[NSNumber numberWithUnsignedInt:v11];
      uint64_t v10 = @"VCMSEndReason";
      goto LABEL_11;
    }
    if (v3 != 182) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
LABEL_9:
  CFDictionaryAddValue(Mutable, @"VCASCurrentPayload", (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", v7, v12));
  CFDictionaryAddValue(Mutable, @"VCASCodecBitRate", (const void *)[NSNumber numberWithUnsignedInt:v12]);
  CFDictionaryAddValue(Mutable, @"VCASRedundancyLevel", (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCAudioTransmitter redNumPayloads](self->_audioTransmitter, "redNumPayloads")));
  uint64_t v9 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCAudioTransmitter redMaxDelay20ms](self->_audioTransmitter, "redMaxDelay20ms"));
  uint64_t v10 = @"VCASRedundancyDelay";
LABEL_11:
  CFDictionaryAddValue(Mutable, v10, v9);
LABEL_12:
  [(VCObject *)self reportingAgent];
  reportingAudioStreamEvent();
  if (Mutable) {
    CFRelease(Mutable);
  }
}

- (void)reportingAlgosAudioStreamEvent:(unsigned __int16)a3
{
  uint64_t v4 = [(VCMediaStream *)self defaultStreamConfig];
  if (self->super._operatingMode == 6)
  {
    uint64_t v5 = v4;
    if ([(VCMediaStreamConfig *)v4 direction] == 2)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFDictionaryAddValue(Mutable, @"VCSPUUID", [(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v5 multiwayConfig] participantId]);
      [(VCObject *)self reportingAgent];
      reportingGenericEvent();
      if (Mutable)
      {
        CFRelease(Mutable);
      }
    }
  }
}

- (int)getConnectionTypeForStreamMode:(int64_t)a3
{
  int result = -1;
  switch(a3)
  {
    case 0:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStream getConnectionTypeForStreamMode:]();
        }
      }
      int result = -1;
      break;
    case 1:
    case 3:
      int result = 3;
      break;
    case 7:
    case 10:
      int result = 2;
      break;
    default:
      return result;
  }
  return result;
}

- (void)pullAudioSamples:(opaqueVCAudioBufferList *)a3
{
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
}

- (void)addSyncSourceDelegate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _VCAudioStream_NewSyncDelegateEvent(0, (uint64_t)self, a3);
  uint64_t v12 = v5;
  VCMediaStream_Lock((uint64_t)self);
  os_unfair_lock_lock(&self->_delegateLock);
  CFArrayAppendValue(self->_syncSourceDelegates, a3);
  int v6 = [(VCMediaStream *)self state];
  if (v6 != 2)
  {
    _VCAudioStream_RegisterSyncDelegateEvent((uint64_t)self, (uint64_t)v5);
LABEL_7:
    if (self->super._operatingMode != 5) {
      VCMediaStreamSyncSourceDelegate_updateSourceState((uint64_t)a3, v6 != 2);
    }
    os_unfair_lock_unlock(&self->_delegateLock);
    VCMediaStream_Unlock((uint64_t)self);
    return;
  }
  OSStatus v7 = CMSimpleQueueEnqueue(self->_syncSourceDelegateQueue, v5);
  if (!v7) {
    goto LABEL_7;
  }
  OSStatus v8 = v7;
  if ((VCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStream addSyncSourceDelegate:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v14 = v10;
        __int16 v15 = 2080;
        uint64_t v16 = "-[VCAudioStream addSyncSourceDelegate:]";
        __int16 v17 = 1024;
        int v18 = 3287;
        __int16 v19 = 2112;
        long long v20 = v9;
        __int16 v21 = 2048;
        long long v22 = self;
        __int16 v23 = 1024;
        OSStatus v24 = v8;
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) CMSimpleQueueEnqueue enqueue failed with error=%d", buf, 0x36u);
      }
    }
  }
  _VCAudioStream_ReleaseSyncDelegateEvent((uint64_t *)&v12, 1);
  os_unfair_lock_unlock(&self->_delegateLock);
  VCMediaStream_Unlock((uint64_t)self);
  [(VCAudioStream *)self waitIdleForSyncSourceDelegates];
}

- (void)removeSyncSourceDelegate:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _VCAudioStream_NewSyncDelegateEvent(1, (uint64_t)self, a3);
  uint64_t v14 = v5;
  VCMediaStream_Lock((uint64_t)self);
  os_unfair_lock_lock(&self->_delegateLock);
  if ([(VCMediaStream *)self state] != 2)
  {
    _VCAudioStream_DeregisterSyncDelegateEvent((uint64_t)self, (uint64_t)v5);
    goto LABEL_7;
  }
  OSStatus v6 = CMSimpleQueueEnqueue(self->_syncSourceDelegateQueue, v5);
  if (!v6)
  {
LABEL_7:
    char v9 = 1;
    goto LABEL_16;
  }
  OSStatus v7 = v6;
  if ((VCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStream removeSyncSourceDelegate:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      OSStatus v8 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
    }
    else {
      OSStatus v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v16 = v10;
        __int16 v17 = 2080;
        int v18 = "-[VCAudioStream removeSyncSourceDelegate:]";
        __int16 v19 = 1024;
        int v20 = 3312;
        __int16 v21 = 2112;
        long long v22 = v8;
        __int16 v23 = 2048;
        OSStatus v24 = self;
        __int16 v25 = 1024;
        OSStatus v26 = v7;
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) CMSimpleQueueEnqueue enqueue failed with error=%d", buf, 0x36u);
      }
    }
  }
  _VCAudioStream_ReleaseSyncDelegateEvent((uint64_t *)&v14, 1);
  char v9 = 0;
LABEL_16:
  int Count = CFArrayGetCount(self->_syncSourceDelegates);
  CFIndex v13 = (Count - 1);
  if (Count - 1 >= 0)
  {
    do
    {
      if (CFArrayGetValueAtIndex(self->_syncSourceDelegates, v13) == a3) {
        CFArrayRemoveValueAtIndex(self->_syncSourceDelegates, v13);
      }
      --Count;
      --v13;
    }
    while (Count > 0);
  }
  VCMediaStreamSyncSourceDelegate_updateSourceState((uint64_t)a3, 1);
  os_unfair_lock_unlock(&self->_delegateLock);
  VCMediaStream_Unlock((uint64_t)self);
  if ((v9 & 1) == 0) {
    [(VCAudioStream *)self waitIdleForSyncSourceDelegates];
  }
}

- (void)waitIdleForSyncSourceDelegates
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!+[VCDefaults BOOLeanValueForKey:@"skipAudioManagerIdleWait" defaultValue:0])
  {
    dispatch_time_t v4 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_runLock, v4))
    {
      if ((VCAudioStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_25;
        }
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        int v20 = 136315650;
        uint64_t v21 = v13;
        __int16 v22 = 2080;
        __int16 v23 = "-[VCAudioStream waitIdleForSyncSourceDelegates]";
        __int16 v24 = 1024;
        int v25 = 3341;
        __int16 v15 = "VCAudioStream [%s] %s:%d Sink run lock semaphore was not signaled!";
        uint64_t v16 = v14;
        uint32_t v17 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v5 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v5 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_25;
        }
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        __int16 v19 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        int v20 = 136316162;
        uint64_t v21 = v18;
        __int16 v22 = 2080;
        __int16 v23 = "-[VCAudioStream waitIdleForSyncSourceDelegates]";
        __int16 v24 = 1024;
        int v25 = 3341;
        __int16 v26 = 2112;
        uint64_t v27 = v5;
        __int16 v28 = 2048;
        long long v29 = self;
        __int16 v15 = "VCAudioStream [%s] %s:%d %@(%p) Sink run lock semaphore was not signaled!";
        uint64_t v16 = v19;
        uint32_t v17 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, v17);
    }
LABEL_25:
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_runLock);
    return;
  }
  if ((VCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      OSStatus v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315906;
        uint64_t v21 = v6;
        __int16 v22 = 2080;
        __int16 v23 = "-[VCAudioStream waitIdleForSyncSourceDelegates]";
        __int16 v24 = 1024;
        int v25 = 3335;
        __int16 v26 = 2112;
        uint64_t v27 = @"skipAudioManagerIdleWait";
        OSStatus v8 = "VCAudioStream [%s] %s:%d %@ set. Skipping idle wait";
        char v9 = v7;
        uint32_t v10 = 38;
LABEL_16:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v20, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v3 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
    }
    else {
      int v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136316418;
        uint64_t v21 = v11;
        __int16 v22 = 2080;
        __int16 v23 = "-[VCAudioStream waitIdleForSyncSourceDelegates]";
        __int16 v24 = 1024;
        int v25 = 3335;
        __int16 v26 = 2112;
        uint64_t v27 = v3;
        __int16 v28 = 2048;
        long long v29 = self;
        __int16 v30 = 2112;
        long long v31 = @"skipAudioManagerIdleWait";
        OSStatus v8 = "VCAudioStream [%s] %s:%d %@(%p) %@ set. Skipping idle wait";
        char v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_16;
      }
    }
  }
}

- (int64_t)getSyncSourceSampleRate
{
  return (uint64_t)self->_vpioFormat.format.mSampleRate;
}

- (void)registerCodecRateModeChangeNotifications
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v2 = self;
  *((void *)&v2 + 1) = MEMORY[0x1E4F1C280];
  uint64_t v3 = MEMORY[0x1E4F1C278];
  VCAudioReceiver_RegisterCodecRateModeRequestCallback((uint64_t)self->_sourceContext.audioReceiver, (uint64_t)CodecRateModeChangeNotificationCallback, &v2);
}

- (void)registerActiveAudioStreamChangeNotifications
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v2 = self;
  *((void *)&v2 + 1) = MEMORY[0x1E4F1C280];
  uint64_t v3 = MEMORY[0x1E4F1C278];
  VCAudioReceiver_RegisterActiveAudioStreamRequestCallback((uint64_t)self->_sourceContext.audioReceiver, (uint64_t)_VCAudioStream_ActiveStreamChangeCallback, &v2);
}

- (void)unregisterCodecRateModeChangeNotifications
{
}

- (void)didSuspendAudioIO:(id)a3
{
  VCMediaStream_Lock((uint64_t)self);
  VCAudioReceiver_Reset((uint64_t)self->_sourceContext.audioReceiver);
  [(VCPacketBundler *)[(VCAudioTransmitter *)self->_audioTransmitter audioBundler] resetBuffer];
  [(VCPacketBundler *)[(VCAudioTransmitter *)self->_audioTransmitter audioBundlerShortRED] resetBuffer];
  self->_rtpEnabledBeforeInterrupt = [(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] isRTPTimeoutEnabled];
  [(VCMediaStream *)self setRtpTimeOutEnabled:0];
  self->_rtcpEnabledBeforeInterrupt = [(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] isRTCPTimeoutEnabled];
  [(VCMediaStream *)self setRtcpTimeOutEnabled:0];
  [(VCAudioStream *)self reportingAudioStreamEvent:184];
  [(VCAudioStream *)self reportingAlgosAudioStreamEvent:2];
  [(VCMediaStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(VCMediaStreamDelegate *)[(VCMediaStream *)self delegate] vcMediaStreamDidInterruptionBegin:self];
  }

  VCMediaStream_Unlock((uint64_t)self);
}

- (void)didResumeAudioIO:(id)a3
{
  VCMediaStream_Lock((uint64_t)self);
  [(VCMediaStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(VCMediaStreamDelegate *)[(VCMediaStream *)self delegate] vcMediaStreamDidInterruptionEnd:self];
  }
  [(VCAudioStream *)self reportingAudioStreamEvent:185];
  [(VCAudioStream *)self reportingAlgosAudioStreamEvent:0];
  [(VCMediaStream *)self setRtpTimeOutEnabled:self->_rtpEnabledBeforeInterrupt];
  [(VCMediaStream *)self setRtcpTimeOutEnabled:self->_rtcpEnabledBeforeInterrupt];

  VCMediaStream_Unlock((uint64_t)self);
}

- (void)serverDidDie
{
  VCMediaStream_Lock((uint64_t)self);
  uint64_t v3 = (void *)MEMORY[0x1E4E56580](&self->super._delegate);
  VCMediaStream_Unlock((uint64_t)self);
  [v3 vcMediaStreamServerDidDie:self];
  if (v3)
  {
    CFRelease(v3);
  }
}

- (void)collectRxChannelMetrics:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long p_sourceContext = &self->_sourceContext;
  VCAudioReceiver_CollectChannelMetrics((uint64_t)self->_sourceContext.audioReceiver, a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int framesProcessed = p_sourceContext->framesProcessed;
      int v8 = [(VCMediaStream *)self state];
      char v9 = [(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] multiwayConfig] participantId];
      audioReceiver = p_sourceContext->audioReceiver;
      int v11 = 136316930;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = "-[VCAudioStream collectRxChannelMetrics:]";
      __int16 v15 = 1024;
      int v16 = 3490;
      __int16 v17 = 2048;
      uint64_t v18 = self;
      __int16 v19 = 1024;
      unsigned int v20 = framesProcessed;
      __int16 v21 = 1024;
      int v22 = v8;
      __int16 v23 = 2112;
      __int16 v24 = v9;
      __int16 v25 = 2048;
      __int16 v26 = audioReceiver;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d VCAudioStream[%p] PullAudioSamples count:%u, state:%d, participantID:[%@], audioReceiver[%p]", (uint8_t *)&v11, 0x46u);
    }
  }
}

- (void)collectTxChannelMetrics:(id *)a3
{
  audioTransmitter = self->_audioTransmitter;
  if (audioTransmitter)
  {
    [(VCAudioTransmitter *)audioTransmitter currentChannelMetrics];
  }
  else
  {
    uint64_t v10 = 0;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v5 = 0u;
  }
  *(_OWORD *)&a3->var3 = v7;
  *(_OWORD *)&a3->var4.height = v8;
  *(_OWORD *)&a3->int var6 = v9;
  *(void *)&a3->var8 = v10;
  *(_OWORD *)&a3->int var0 = v5;
  *(_OWORD *)&a3->var1[3] = v6;
}

- (void)handleActiveConnectionChange:(id)a3
{
  VCMediaStream_Lock((uint64_t)self);
  self->_uint64_t cachedConnectionMTU = [a3 maxConnectionMTU];
  self->_uint64_t constantTransportOverhead = VCConnection_PerPacketConnectionOverhead((uint64_t)a3);
  if (self->super._operatingMode == 6) {
    -[VCMediaStream updateTransportsWithConstantConnectionOverhead:](self, "updateTransportsWithConstantConnectionOverhead:");
  }
  [(VCAudioTransmitter *)self->_audioTransmitter handleActiveConnectionChange:a3];
  audioReceiver = self->_sourceContext.audioReceiver;
  int v6 = VCConnection_LocalCellTech((uint64_t)a3);
  int v7 = VCConnection_RemoteCellTech((uint64_t)a3);
  VCAudioReceiver_UpdateCellTech((uint64_t)audioReceiver, v6, v7);

  VCMediaStream_Unlock((uint64_t)self);
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioStream didUpdateBasebandCodec:]();
    }
  }
}

- (unsigned)conferenceID
{
  return self->conferenceID;
}

- (BOOL)isValid
{
  return self->isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->isValid = a3;
}

- (int)deviceRole
{
  return self->deviceRole;
}

- (void)setDeviceRole:(int)a3
{
  self->int deviceRole = a3;
}

- (VCAudioTransmitter)audioTransmitter
{
  return (VCAudioTransmitter *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setAudioTransmitter:(id)a3
{
}

- (VCAudioIO)audioIO
{
  return (VCAudioIO *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setAudioIO:(id)a3
{
}

- (BOOL)isCurrentDTXEnabled
{
  return self->_currentDTXEnable;
}

- (NSNumber)targetStreamID
{
  return self->_targetStreamID;
}

- (unsigned)lastNoVoiceActivityPacketCount
{
  return self->_lastNoVoiceActivityPacketCount;
}

- (void)setLastNoVoiceActivityPacketCount:(unsigned int)a3
{
  self->_lastNoVoiceActivityPacketint Count = a3;
}

- (int64_t)overlayToken
{
  return self->_overlayToken;
}

void ___VCAudioStream_DTMFEventCallback_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x1E4E56580](*(void *)(a1 + 32) + 256);
  [v2 vcMediaStream:*(void *)(a1 + 32) didReceiveDTMFEventWithDigit:*(char *)(a1 + 40)];
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t ___VCAudioStream_ActiveStreamChangeCallback_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  VCMediaStream_Lock(*(void *)(a1 + 32));
  int Count = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 32) + 1696));
  CFIndex v3 = (Count - 1);
  if (Count - 1 >= 0)
  {
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 32) + 1696), v3);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        int v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v9 = v5;
          __int16 v10 = 2080;
          int v11 = "_VCAudioStream_ActiveStreamChangeCallback_block_invoke";
          __int16 v12 = 1024;
          int v13 = 3416;
          __int16 v14 = 1024;
          int v15 = 3416;
          __int16 v16 = 2048;
          __int16 v17 = ValueAtIndex;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioStream.m:%d: resetting SourceState for syncSourceDelegate=%p", buf, 0x2Cu);
        }
      }
      VCMediaStreamSyncSourceDelegate_resetSourceState((uint64_t)ValueAtIndex);
      --Count;
      --v3;
    }
    while (Count > 0);
  }
  VCMediaStream_Unlock(*(void *)(a1 + 32));
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcMediaStream:didSwitchToAudioStreamWithID:", *(void *)(a1 + 32), *(unsigned __int16 *)(a1 + 40));
  }
  return result;
}

+ (BOOL)isTelephony:(int64_t)a3
{
  return ((unint64_t)a3 < 0xB) & (0x48Au >> a3);
}

+ (BOOL)isVoLTE:(int64_t)a3
{
  return a3 == 7 || a3 == 10;
}

+ (BOOL)isVoWiFi:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (void)setIsLocalCelluar:(unsigned int)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  transportArray = self->super._transportArray;
  uint64_t v6 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v33 objects:v32 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v34;
    *(void *)&long long v7 = 136315906;
    long long v19 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(transportArray);
        }
        *(_DWORD *)(objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "realtimeContext", v19) + 220) = a3;
        if ((VCAudioStream *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v17 = VRTraceErrorLogLevelToCSTR();
            uint64_t v18 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v19;
              uint64_t v21 = v17;
              __int16 v22 = 2080;
              __int16 v23 = "-[VCAudioStream(Telephony) setIsLocalCelluar:]";
              __int16 v24 = 1024;
              int v25 = 37;
              __int16 v26 = 1024;
              LODWORD(v27) = a3;
              __int16 v14 = v18;
              int v15 = " [%s] %s:%d WiFi<->Cellular handover isLocalCellular=%d";
              uint32_t v16 = 34;
              goto LABEL_15;
            }
          }
        }
        else
        {
          int v11 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            int v11 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v12 = VRTraceErrorLogLevelToCSTR();
            int v13 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316418;
              uint64_t v21 = v12;
              __int16 v22 = 2080;
              __int16 v23 = "-[VCAudioStream(Telephony) setIsLocalCelluar:]";
              __int16 v24 = 1024;
              int v25 = 37;
              __int16 v26 = 2112;
              uint64_t v27 = v11;
              __int16 v28 = 2048;
              long long v29 = self;
              __int16 v30 = 1024;
              unsigned int v31 = a3;
              __int16 v14 = v13;
              int v15 = " [%s] %s:%d %@(%p) WiFi<->Cellular handover isLocalCellular=%d";
              uint32_t v16 = 54;
LABEL_15:
              _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
              continue;
            }
          }
        }
      }
      uint64_t v8 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v33 objects:v32 count:16];
    }
    while (v8);
  }
}

- (void)handleCellularToWiFiHandover
{
  [(VCAudioStream *)self setIsLocalCelluar:0];
  [(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] setAudioStreamMode:1];
  VCAudioTransmitter_ProcessConnectionType((uint64_t)self->_audioTransmitter, 3);
  VCAudioReceiver_ProcessConnectionType((uint64_t)self->_sourceContext.audioReceiver, 3);
  [(VCTransportSession *)self->super._transportSession destroyNWMonitor];
  rateAdaptation = self->super._rateAdaptation;

  [(VCMediaStreamRateAdaptation *)rateAdaptation stop];
}

- (void)handleWiFiToCelluarHandover
{
  [(VCAudioStream *)self setIsLocalCelluar:1];
  [(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] setAudioStreamMode:7];
  VCAudioTransmitter_ProcessConnectionType((uint64_t)self->_audioTransmitter, 2);
  VCAudioReceiver_ProcessConnectionType((uint64_t)self->_sourceContext.audioReceiver, 2);
  [(VCAudioStream *)self configureCellularFeatures];
  [(VCTransportSession *)self->super._transportSession setupNWMonitor];
  rateAdaptation = self->super._rateAdaptation;

  [(VCMediaStreamRateAdaptation *)rateAdaptation start];
}

- (void)setJitterBufferMode:(int)a3
{
  VCMediaStream_Lock((uint64_t)self);
  audioReceiver = self->_sourceContext.audioReceiver;
  if (audioReceiver)
  {
    if (!self->_shouldEnableJBLatencySenstiveModeForVoWiFi)
    {
      audioReceiver->var75 = 1;
      audioReceiver->var0.int var4 = a3;
    }
    if (a3 == 1)
    {
      if (self->_isTelephony) {
        [(VCAudioStream *)self handleWiFiToCelluarHandover];
      }
    }
    else if (!a3 && self->_isTelephony)
    {
      [(VCAudioStream *)self handleCellularToWiFiHandover];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioStream(Telephony) setJitterBufferMode:](v6);
    }
  }
  VCMediaStream_Unlock((uint64_t)self);
}

- (BOOL)isVoLTERateAdaptationEnabled
{
  BOOL v3 = [(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] isRateAdaptationEnabled];
  if (v3)
  {
    BOOL v3 = +[VCAudioStream isVoLTE:[(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] audioStreamMode]];
    if (v3)
    {
      BOOL v3 = +[VCPayloadUtils isEVSPayload:[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload]];
      if (v3) {
        LOBYTE(v3) = [(VCAudioPayloadConfig *)[(VCAudioTransmitter *)self->_audioTransmitter currentAudioPayloadConfig] bitrate] == 24400;
      }
    }
  }
  return v3;
}

- (void)configureCellularFeatures
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  self->_anbrEnabled = [(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] anbrEnabled];
  [(VCTransportSession *)self->super._transportSession setShouldSetupNWMonitor:1];
  if ([(VCAudioStream *)self isVoLTERateAdaptationEnabled] && !self->_anbrEnabled)
  {
    uint64_t v6 = 0;
    memset(v5, 0, sizeof(v5));
    long long v4 = 0u;
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"stream_%ld", self->super._streamToken);
    *((void *)&v4 + 1) = [(VCObject *)self reportingAgent];
    LODWORD(v5[0]) = 1;
    [(VCTelephonyInterface *)self->_telephonyInterface setupVCMediaStreamRateAdaptationConfig:(char *)v5 + 8];
    if (*((void *)&v5[0] + 1) == 1)
    {

      self->super._rateAdaptation = [[VCMediaStreamRateAdaptation alloc] initWithDelegate:self params:&v3];
      self->_uplinkRateAdaptationMaxAllowedBitrate = 24400;
    }
  }
}

- (void)notifyCodecModeChangeToCT:(_VCAudioCodecModeChangeEvent *)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_isTelephony)
  {
    telephonyInterface = self->_telephonyInterface;
    _VCAudioCodecModeChangeEvent v4 = *a3;
    [(VCTelephonyInterface *)telephonyInterface notifyCodecModeChangeEventToCT:&v4];
  }
}

- (void)setRemoteCodecTypeAndSampleRate:(_VCAudioCodecModeChangeEvent *)a3
{
  uint64_t v5 = +[VCPayloadUtils audioCodecTypeForPayload:a3->payload];
  double v6 = (double)+[VCPayloadUtils sampleRateForCodecBandwidth:a3->codecBandwidth];
  audioIO = self->_audioIO;

  [(VCAudioIO *)audioIO setRemoteCodecType:v5 sampleRate:v6];
}

- (void)queryAnbrBitrate:(unsigned int)a3 forDirection:(int64_t)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  telephonyInterface = self->_telephonyInterface;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __58__VCAudioStream_Telephony__queryAnbrBitrate_forDirection___block_invoke;
  v5[3] = &unk_1E6DB7EB0;
  unsigned int v6 = a3;
  _OWORD v5[4] = self;
  void v5[5] = a4;
  [(VCTelephonyInterface *)telephonyInterface queryAnbrBitrateRecommendation:*(void *)&a3 direction:a4 completionHandler:v5];
}

void __58__VCAudioStream_Telephony__queryAnbrBitrate_forDirection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return;
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    unsigned int v6 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v7 = *(_DWORD *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 40);
    int v17 = 136316418;
    uint64_t v18 = v5;
    __int16 v19 = 2080;
    unsigned int v20 = "-[VCAudioStream(Telephony) queryAnbrBitrate:forDirection:]_block_invoke";
    __int16 v21 = 1024;
    int v22 = 124;
    __int16 v23 = 1024;
    *(_DWORD *)__int16 v24 = v7;
    *(_WORD *)&v24[4] = 2048;
    *(void *)&v24[6] = v8;
    *(_WORD *)&v24[14] = 2112;
    *(void *)&v24[16] = a2;
    uint64_t v9 = " [%s] %s:%d Failed querying Telephony Interface for ANBR bitrate recommendation, bitrate=%u, direction=%ld, error=%@";
    __int16 v10 = v6;
    uint32_t v11 = 54;
LABEL_13:
    _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v17, v11);
    return;
  }
  if (objc_opt_respondsToSelector()) {
    _VCAudioCodecModeChangeEvent v4 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
  }
  else {
    _VCAudioCodecModeChangeEvent v4 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    int v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v14 = *(_DWORD *)(a1 + 48);
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      int v17 = 136316930;
      uint64_t v18 = v12;
      __int16 v19 = 2080;
      unsigned int v20 = "-[VCAudioStream(Telephony) queryAnbrBitrate:forDirection:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 124;
      __int16 v23 = 2112;
      *(void *)__int16 v24 = v4;
      *(_WORD *)&v24[8] = 2048;
      *(void *)&v24[10] = v15;
      *(_WORD *)&v24[18] = 1024;
      *(_DWORD *)&v24[20] = v14;
      __int16 v25 = 2048;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      uint64_t v28 = a2;
      uint64_t v9 = " [%s] %s:%d %@(%p) Failed querying Telephony Interface for ANBR bitrate recommendation, bitrate=%u, direction=%ld, error=%@";
      __int16 v10 = v13;
      uint32_t v11 = 74;
      goto LABEL_13;
    }
  }
}

- (void)notifyCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3 didUpdateBandwidth:(BOOL)a4 didUpdateBitrate:(BOOL)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    _VCAudioCodecModeChangeEvent v7 = *a3;
    -[VCAudioStream setRemoteCodecTypeAndSampleRate:](self, "setRemoteCodecTypeAndSampleRate:", &v7, a4, a5);
  }
  else if (!a5)
  {
    return;
  }
  _VCAudioCodecModeChangeEvent v7 = *a3;
  [(VCAudioStream *)self notifyCodecModeChangeToCT:&v7];
}

- (void)handleCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  int64_t v5 = +[VCPayloadUtils codecTypeForPayload:a3->payload];
  BOOL v6 = +[VCAudioStream isVoLTE:[(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] audioStreamMode]];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        [(VCAudioStream(Telephony) *)v17 handleCodecModeChangeEvent:v18];
      }
    }
    return;
  }
  if (a3->codecRateMode == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    unsigned int v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    int payload = a3->payload;
    codecRateMode = (NSArray *)a3->codecRateMode;
    *(_DWORD *)unsigned int v31 = 136316162;
    *(void *)&v31[4] = v19;
    *(_WORD *)&v31[12] = 2080;
    *(void *)&v31[14] = "-[VCAudioStream(Telephony) handleCodecModeChangeEvent:]";
    *(_WORD *)&v31[22] = 1024;
    int v32 = 145;
    __int16 v33 = 1024;
    unsigned int v34 = payload;
    __int16 v35 = 2048;
    long long v36 = codecRateMode;
    __int16 v23 = " [%s] %s:%d codecRateMode is invalid for payload=%d, codecRateMode=%ld";
    __int16 v24 = v20;
    uint32_t v25 = 44;
LABEL_32:
    _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, v23, v31, v25);
    return;
  }
  BOOL v7 = v6;
  uint64_t v8 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] supportedBitrates];
  if (!-[NSArray containsObject:](v8, "containsObject:", [NSNumber numberWithUnsignedInt:a3->codecBitrate]))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    __int16 v27 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v28 = a3->payload;
    uint64_t v29 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] supportedBitrates];
    unsigned int codecBitrate = a3->codecBitrate;
    *(_DWORD *)unsigned int v31 = 136316418;
    *(void *)&v31[4] = v26;
    *(_WORD *)&v31[12] = 2080;
    *(void *)&v31[14] = "-[VCAudioStream(Telephony) handleCodecModeChangeEvent:]";
    *(_WORD *)&v31[22] = 1024;
    int v32 = 147;
    __int16 v33 = 1024;
    unsigned int v34 = v28;
    __int16 v35 = 2112;
    long long v36 = v29;
    __int16 v37 = 1024;
    unsigned int v38 = codecBitrate;
    __int16 v23 = " [%s] %s:%d Requested bitrate is not in the configurred bitrates: payload=%d, supportedBitrates=%@, bitrate=%d";
    __int16 v24 = v27;
    uint32_t v25 = 50;
    goto LABEL_32;
  }
  if (v7
    && self->_anbrActive
    && self->_anbrEnabled
    && (unsigned int v9 = a3->codecBitrate, v9 > [(VCAudioPayload *)self->currentAudioPayload bitrate]))
  {
    uint64_t v10 = a3->codecBitrate;
    [(VCAudioStream *)self queryAnbrBitrate:v10 forDirection:1];
  }
  else
  {
    *(_OWORD *)unsigned int v31 = *(_OWORD *)&a3->payload;
    *(EVSRFParams *)&v31[16] = a3->RFParams;
    if ([(VCAudioStream *)self handleUplinkBitrateChange:v31 reason:1]
      && +[VCPayloadUtils isEVSPayload:a3->payload]
      && self->super._rateAdaptation)
    {
      if (VCPayloadUtils_AudioCodecRateModeForBitrate(a3->payload, [(VCAudioPayload *)self->currentAudioPayload bitrate]) > 8)
      {
        self->_unsigned int uplinkRateAdaptationMaxAllowedBitrate = [(VCAudioPayload *)self->currentAudioPayload bitrate];
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          return;
        }
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        unsigned int uplinkRateAdaptationMaxAllowedBitrate = self->_uplinkRateAdaptationMaxAllowedBitrate;
        *(_DWORD *)unsigned int v31 = 136315906;
        *(void *)&v31[4] = v15;
        *(_WORD *)&v31[12] = 2080;
        *(void *)&v31[14] = "-[VCAudioStream(Telephony) handleCodecModeChangeEvent:]";
        *(_WORD *)&v31[22] = 1024;
        int v32 = 163;
        __int16 v33 = 1024;
        unsigned int v34 = uplinkRateAdaptationMaxAllowedBitrate;
        int v14 = " [%s] %s:%d Updated uplink rate adaptation max allowed bitrate=%d";
      }
      else
      {
        [(VCMediaStreamRateAdaptation *)self->super._rateAdaptation stop];
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          return;
        }
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        unsigned int v13 = [(VCAudioPayload *)self->currentAudioPayload bitrate];
        *(_DWORD *)unsigned int v31 = 136315906;
        *(void *)&v31[4] = v11;
        *(_WORD *)&v31[12] = 2080;
        *(void *)&v31[14] = "-[VCAudioStream(Telephony) handleCodecModeChangeEvent:]";
        *(_WORD *)&v31[22] = 1024;
        int v32 = 160;
        __int16 v33 = 1024;
        unsigned int v34 = v13;
        int v14 = " [%s] %s:%d Disabling uplink rate adaptation due to EVS AMRWB-IO bitrate=%u";
      }
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v14, v31, 0x22u);
    }
  }
}

- (void)storeLastCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3
{
  self->_cmrBitrateActive = 1;
  long long v3 = *(_OWORD *)&a3->payload;
  self->_lastCodecModeChangeEvent.RFParams = a3->RFParams;
  *(_OWORD *)&self->_lastCodecModeChangeEvent.int payload = v3;
}

- (BOOL)handleUplinkBitrateChange:(_VCAudioCodecModeChangeEvent *)a3 reason:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  __int16 v23 = 0;
  if (a4 != 4 && self->_basebandThermalMitigationsEnabled) {
    goto LABEL_16;
  }
  BOOL v7 = [(VCAudioStream *)self audioTransmitter];
  *(_OWORD *)buf = *(_OWORD *)&a3->payload;
  *(EVSRFParams *)&buf[16] = a3->RFParams;
  [(VCAudioTransmitter *)v7 handleCodecModeChangeEvent:buf didUpdateBandwidth:&v23 didUpdateBitrate:(char *)&v23 + 1];
  *(_OWORD *)buf = *(_OWORD *)&a3->payload;
  *(EVSRFParams *)&buf[16] = a3->RFParams;
  [(VCAudioStream *)self notifyCodecModeChangeEvent:buf didUpdateBandwidth:v23 didUpdateBitrate:HIBYTE(v23)];
  if (HIBYTE(v23) | v23)
  {
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int payload = a3->payload;
          int codecBandwidth = a3->codecBandwidth;
          unsigned int codecBitrate = a3->codecBitrate;
          *(_DWORD *)buf = 136316674;
          *(void *)&uint8_t buf[4] = v9;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAudioStream(Telephony) handleUplinkBitrateChange:reason:]";
          *(_WORD *)&buf[22] = 1024;
          int v25 = 192;
          __int16 v26 = 1024;
          *(_DWORD *)__int16 v27 = v4;
          *(_WORD *)&v27[4] = 1024;
          *(_DWORD *)&v27[6] = payload;
          LOWORD(v28) = 1024;
          *(_DWORD *)((char *)&v28 + 2) = codecBitrate;
          HIWORD(v28) = 1024;
          *(_DWORD *)uint64_t v29 = codecBandwidth;
          int v14 = " [%s] %s:%d Bitrate adaptation performed: reason=%d, payload=%d, suggestedBitrate=%d, suggestedBandwidth=%d";
          uint64_t v15 = v10;
          uint32_t v16 = 52;
LABEL_14:
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        uint64_t v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v19 = a3->payload;
          int v21 = a3->codecBandwidth;
          unsigned int v20 = a3->codecBitrate;
          *(_DWORD *)buf = 136317186;
          *(void *)&uint8_t buf[4] = v17;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAudioStream(Telephony) handleUplinkBitrateChange:reason:]";
          *(_WORD *)&buf[22] = 1024;
          int v25 = 192;
          __int16 v26 = 2112;
          *(void *)__int16 v27 = v8;
          *(_WORD *)&v27[8] = 2048;
          int v28 = self;
          *(_WORD *)uint64_t v29 = 1024;
          *(_DWORD *)&v29[2] = v4;
          __int16 v30 = 1024;
          int v31 = v19;
          __int16 v32 = 1024;
          unsigned int v33 = v20;
          __int16 v34 = 1024;
          int v35 = v21;
          int v14 = " [%s] %s:%d %@(%p) Bitrate adaptation performed: reason=%d, payload=%d, suggestedBitrate=%d, suggestedBandwidth=%d";
          uint64_t v15 = v18;
          uint32_t v16 = 72;
          goto LABEL_14;
        }
      }
    }
    if (v4 != 4)
    {
LABEL_16:
      *(_OWORD *)buf = *(_OWORD *)&a3->payload;
      *(EVSRFParams *)&buf[16] = a3->RFParams;
      [(VCAudioStream *)self storeLastCodecModeChangeEvent:buf];
    }
  }
  return HIBYTE(v23);
}

- (BOOL)getCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3 forCodecBitrate:(unsigned int)a4 payload:(int)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v11) {
        return v11;
      }
      -[VCAudioStream(Telephony) getCodecModeChangeEvent:forCodecBitrate:payload:](v12);
    }
    goto LABEL_17;
  }
  if (!a4 || a5 == 128)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      int v14 = *MEMORY[0x1E4F47A50];
      BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v11) {
        return v11;
      }
      int v15 = [(VCAudioPayloadConfig *)[(VCAudioTransmitter *)self->_audioTransmitter currentAudioPayloadConfig] payload];
      int v23 = 136316162;
      uint64_t v24 = v13;
      __int16 v25 = 2080;
      __int16 v26 = "-[VCAudioStream(Telephony) getCodecModeChangeEvent:forCodecBitrate:payload:]";
      __int16 v27 = 1024;
      int v28 = 206;
      __int16 v29 = 1024;
      int v30 = v15;
      __int16 v31 = 1024;
      unsigned int v32 = a4;
      uint32_t v16 = " [%s] %s:%d Input parameter error payload=%d, codecBitrate=%u";
      uint64_t v17 = v14;
      uint32_t v18 = 40;
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v9 = VCPayloadUtils_AudioCodecRateModeForBitrate(a5, a4);
    uint64_t v10 = [(VCAudioStream *)self selectCodecBandwidthForCodecRateMode:v9];
    if (+[VCPayloadUtils isCodecModeSupported:v9 forBandwidth:v10 withPayload:[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload]])
    {
      a3->int codecBandwidth = v10;
      a3->unsigned int codecBitrate = a4;
      LOBYTE(v11) = 1;
      a3->int payload = a5;
      a3->codecRateMode = v9;
      return v11;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      unsigned int v20 = *MEMORY[0x1E4F47A50];
      BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v11) {
        return v11;
      }
      int v21 = [(VCAudioPayloadConfig *)[(VCAudioTransmitter *)self->_audioTransmitter currentAudioPayloadConfig] payload];
      int v23 = 136316674;
      uint64_t v24 = v19;
      __int16 v25 = 2080;
      __int16 v26 = "-[VCAudioStream(Telephony) getCodecModeChangeEvent:forCodecBitrate:payload:]";
      __int16 v27 = 1024;
      int v28 = 213;
      __int16 v29 = 1024;
      int v30 = v21;
      __int16 v31 = 1024;
      unsigned int v32 = a4;
      __int16 v33 = 1024;
      int v34 = v9;
      __int16 v35 = 1024;
      int v36 = v10;
      uint32_t v16 = " [%s] %s:%d Codec Rate Mode and Codec Bandwidth selected are not supported for payload=%d, codecBitrate=%u, "
            "codecRateMode=%u, codecBandwidth=%u";
      uint64_t v17 = v20;
      uint32_t v18 = 52;
LABEL_16:
      _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v23, v18);
    }
  }
LABEL_17:
  LOBYTE(v11) = 0;
  return v11;
}

- (void)handleBasebandRateTrendSuggestion:(int)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v21 = 0uLL;
  EVSRFParams RFParams = 0;
  p_audioTransmitter = &self->_audioTransmitter;
  if (+[VCPayloadUtils codecTypeForPayload:[(VCAudioPayloadConfig *)[(VCAudioTransmitter *)self->_audioTransmitter currentAudioPayloadConfig] payload]])
  {
    id v6 = +[VCPayloadUtils allowedBitratesForPayload:[(VCAudioPayloadConfig *)[(VCAudioTransmitter *)*p_audioTransmitter currentAudioPayloadConfig] payload] supportedBitrates:[(VCAudioPayloadConfig *)[(VCAudioTransmitter *)*p_audioTransmitter currentAudioPayloadConfig] supportedBitrates] supportedBandwidths:[(VCAudioPayloadConfig *)[(VCAudioTransmitter *)*p_audioTransmitter currentAudioPayloadConfig] supportedBandwidths]];
    BOOL v7 = v6;
    if (a3 == 0x80000000)
    {
      uint64_t v8 = 0;
    }
    else
    {
      if (a3 != 0x7FFFFFFF)
      {
        BOOL v12 = 0;
        long long v21 = *(_OWORD *)&self->_lastCodecModeChangeEvent.payload;
        EVSRFParams RFParams = self->_lastCodecModeChangeEvent.RFParams;
        goto LABEL_13;
      }
      uint64_t v8 = [v6 count] - 1;
    }
    uint64_t v9 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", v8), "intValue");
    uint64_t v10 = v9;
    if (self->_cmrBitrateActive)
    {
      unsigned int codecBitrate = self->_lastCodecModeChangeEvent.codecBitrate;
      if (v9 >= codecBitrate) {
        uint64_t v10 = codecBitrate;
      }
      else {
        uint64_t v10 = v9;
      }
    }
    BOOL v12 = 1;
    if (![(VCAudioStream *)self getCodecModeChangeEvent:&v21 forCodecBitrate:v10 payload:[(VCAudioPayloadConfig *)[(VCAudioTransmitter *)*p_audioTransmitter currentAudioPayloadConfig] payload]])goto LABEL_25; {
LABEL_13:
    }
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_24;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      int v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136316930;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioStream(Telephony) handleBasebandRateTrendSuggestion:]";
      *(_WORD *)&buf[22] = 1024;
      int v24 = 263;
      __int16 v25 = 1024;
      *(_DWORD *)__int16 v26 = v12;
      *(_WORD *)&v26[4] = 1024;
      *(_DWORD *)&v26[6] = a3;
      LOWORD(v27) = 1024;
      *(_DWORD *)((char *)&v27 + 2) = v21;
      HIWORD(v27) = 1024;
      *(_DWORD *)int v28 = HIDWORD(v21);
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)__int16 v29 = DWORD2(v21);
      uint32_t v16 = " [%s] %s:%d Baseband Thermal Mitigations: enabled=%d suggestion=0x%08x, payload=%d, suggestedBitrate=%d, sug"
            "gestedBandwidth=%d";
      uint64_t v17 = v15;
      uint32_t v18 = 58;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v13 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_24;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      unsigned int v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136317442;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioStream(Telephony) handleBasebandRateTrendSuggestion:]";
      *(_WORD *)&buf[22] = 1024;
      int v24 = 263;
      __int16 v25 = 2112;
      *(void *)__int16 v26 = v13;
      *(_WORD *)&v26[8] = 2048;
      __int16 v27 = self;
      *(_WORD *)int v28 = 1024;
      *(_DWORD *)&v28[2] = v12;
      *(_WORD *)__int16 v29 = 1024;
      *(_DWORD *)&v29[2] = a3;
      __int16 v30 = 1024;
      int v31 = v21;
      __int16 v32 = 1024;
      int v33 = HIDWORD(v21);
      __int16 v34 = 1024;
      int v35 = DWORD2(v21);
      uint32_t v16 = " [%s] %s:%d %@(%p) Baseband Thermal Mitigations: enabled=%d suggestion=0x%08x, payload=%d, suggestedBitrate="
            "%d, suggestedBandwidth=%d";
      uint64_t v17 = v20;
      uint32_t v18 = 78;
    }
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_24:
    *(_OWORD *)buf = v21;
    *(EVSRFParams *)&buf[16] = RFParams;
    -[VCAudioStream handleUplinkBitrateChange:reason:](self, "handleUplinkBitrateChange:reason:", buf, 4, (void)v21);
    goto LABEL_25;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioStream(Telephony) handleBasebandRateTrendSuggestion:]();
    }
  }
  LOBYTE(v12) = 0;
LABEL_25:
  self->_basebandThermalMitigationsEnabled = v12;
}

- (void)handleUplinkANBR:(_VCAudioCodecModeChangeEvent *)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  _VCAudioCodecModeChangeEvent v3 = *a3;
  [(VCAudioStream *)self handleUplinkBitrateChange:&v3 reason:3];
}

- (void)handleDownlinkANBR:(_VCAudioCodecModeChangeEvent *)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(VCAudioStream *)self audioTransmitter];
  _VCAudioCodecModeChangeEvent v5 = *a3;
  [(VCAudioTransmitter *)v4 sendCodecModeChangeEvent:&v5];
}

- (int)selectCodecBandwidthForCodecRateMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  _VCAudioCodecModeChangeEvent v5 = (void *)VCPayloadUtils_DefaultAudioCodecBandwidthCodecForSampleRate([(VCAudioPayloadConfig *)[(VCAudioTransmitter *)self->_audioTransmitter currentAudioPayloadConfig] codecSampleRate]);
  int64_t v6 = +[VCPayloadUtils codecTypeForPayload:[(VCAudioPayloadConfig *)[(VCAudioTransmitter *)self->_audioTransmitter currentAudioPayloadConfig] payload]];
  if (!+[VCPayloadUtils isCodecModeSupported:v3 forBandwidth:v5 withPayload:[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload]])
  {
    if ([(NSArray *)[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] supportedBandwidths] count])
    {
      if (+[VCPayloadUtils supportsCodecBandwidthUpdateForCodecType:v6])
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        BOOL v7 = [(NSArray *)[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] supportedBandwidths] reverseObjectEnumerator];
        uint64_t v8 = [(NSEnumerator *)v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          int v13 = (int)v5;
          uint64_t v10 = *(void *)v16;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v16 != v10) {
                objc_enumerationMutation(v7);
              }
              _VCAudioCodecModeChangeEvent v5 = *(void **)(*((void *)&v15 + 1) + 8 * i);
              if (+[VCPayloadUtils isCodecModeSupported:forBandwidth:withPayload:](VCPayloadUtils, "isCodecModeSupported:forBandwidth:withPayload:", v3, [v5 unsignedIntValue], -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload")))
              {
                LODWORD(v5) = [v5 unsignedIntValue];
                return (int)v5;
              }
            }
            uint64_t v9 = [(NSEnumerator *)v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
            if (v9) {
              continue;
            }
            break;
          }
          LODWORD(v5) = v13;
        }
      }
    }
  }
  return (int)v5;
}

- (void)handleANBR:(unsigned int)a3 forDirection:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  p_audioTransmitter = &self->_audioTransmitter;
  if (+[VCPayloadUtils codecTypeForPayload:[(VCAudioPayloadConfig *)[(VCAudioTransmitter *)self->_audioTransmitter currentAudioPayloadConfig] payload]])
  {
    uint64_t v8 = +[VCPayloadUtils codecRateModeForDesiredANBR:v5 payload:[(VCAudioPayloadConfig *)[(VCAudioTransmitter *)*p_audioTransmitter currentAudioPayloadConfig] payload] supportedBitrates:[(VCAudioPayloadConfig *)[(VCAudioTransmitter *)*p_audioTransmitter currentAudioPayloadConfig] supportedBitrates] supportedBandwidths:[(VCAudioPayloadConfig *)[(VCAudioTransmitter *)*p_audioTransmitter currentAudioPayloadConfig] supportedBandwidths]];
    if (v8 == -1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStream(Telephony) handleANBR:forDirection:]();
        }
      }
    }
    else
    {
      uint64_t v9 = v8;
      int v10 = VCPayloadUtils_BitrateForAudioCodecRateMode([(VCAudioPayloadConfig *)[(VCAudioTransmitter *)*p_audioTransmitter currentAudioPayloadConfig] payload], v8);
      if (v10)
      {
        int v11 = v10;
        uint64_t v12 = [(VCAudioStream *)self selectCodecBandwidthForCodecRateMode:v9];
        if (+[VCPayloadUtils isCodecModeSupported:v9 forBandwidth:v12 withPayload:[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload]])
        {
          int v13 = [(VCAudioPayloadConfig *)[(VCAudioTransmitter *)*p_audioTransmitter currentAudioPayloadConfig] payload];
          if (a4 == 2)
          {
            int v17 = v13;
            unint64_t v18 = __PAIR64__(v12, v9);
            *(_DWORD *)uint64_t v19 = v11;
            *(void *)&v19[4] = 0;
            [(VCAudioStream *)self handleDownlinkANBR:&v17];
          }
          else if (a4 == 1)
          {
            int v17 = v13;
            unint64_t v18 = __PAIR64__(v12, v9);
            *(_DWORD *)uint64_t v19 = v11;
            *(void *)&v19[4] = 0;
            [(VCAudioStream *)self handleUplinkANBR:&v17];
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          long long v15 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int v16 = [(VCAudioPayloadConfig *)[(VCAudioTransmitter *)*p_audioTransmitter currentAudioPayloadConfig] payload];
            int v17 = 136316674;
            unint64_t v18 = v14;
            *(_WORD *)uint64_t v19 = 2080;
            *(void *)&v19[2] = "-[VCAudioStream(Telephony) handleANBR:forDirection:]";
            *(_WORD *)&v19[10] = 1024;
            int v20 = 315;
            __int16 v21 = 1024;
            int v22 = v16;
            __int16 v23 = 1024;
            int v24 = v11;
            __int16 v25 = 1024;
            int v26 = v9;
            __int16 v27 = 1024;
            int v28 = v12;
            _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d Codec Rate Mode and Codec Bandwidth selected are not supported for payload=%d, codecBitrate=%u, codecRateMode=%u, codecBandwidth=%u", (uint8_t *)&v17, 0x34u);
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStream(Telephony) handleANBR:forDirection:]();
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioStream(Telephony) handleANBR:forDirection:]();
    }
  }
}

- (void)telephonyInterface:(id)a3 anbrActivationUpdate:(BOOL)a4
{
  VCMediaStream_Lock((uint64_t)self);
  self->_anbrActive = a4;

  VCMediaStream_Unlock((uint64_t)self);
}

- (void)telephonyInterface:(id)a3 anbrRecommendation:(unsigned int)a4 forDirection:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  VCMediaStream_Lock((uint64_t)self);
  if (self->_anbrEnabled)
  {
    [(VCAudioStream *)self handleANBR:v6 forDirection:a5];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      BOOL anbrEnabled = self->_anbrEnabled;
      BOOL anbrActive = self->_anbrActive;
      int v12 = 136316674;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      long long v15 = "-[VCAudioStream(Telephony) telephonyInterface:anbrRecommendation:forDirection:]";
      __int16 v16 = 1024;
      int v17 = 348;
      __int16 v18 = 1024;
      BOOL v19 = anbrEnabled;
      __int16 v20 = 1024;
      BOOL v21 = anbrActive;
      __int16 v22 = 1024;
      int v23 = v6;
      __int16 v24 = 2048;
      int64_t v25 = a5;
      _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d Received a bitrate recommendation when ANBR is not enabled. anbrEnabled=%d, anbrActive=%d, bitrate=%u, direction=%ld", (uint8_t *)&v12, 0x38u);
    }
  }
  VCMediaStream_Unlock((uint64_t)self);
}

- (void)rateAdaptation:(id)a3 targetBitrateDidChange:(unsigned int)a4 rateChangeCounter:(unsigned int)a5
{
  unsigned int uplinkRateAdaptationMaxAllowedBitrate = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  [(VCMediaStream *)self lock];
  rateAdaptation = self->super._rateAdaptation;
  if (rateAdaptation)
  {
    if (rateAdaptation == a3 && !self->_anbrEnabled)
    {
      uint64_t v10 = [(VCAudioPayloadConfig *)[(VCAudioTransmitter *)self->_audioTransmitter currentAudioPayloadConfig] payload];
      if (+[VCPayloadUtils isEVSPayload:v10]
        && +[VCAudioStream isVoLTE:[(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] audioStreamMode]])
      {
        if (uplinkRateAdaptationMaxAllowedBitrate == 13200 || uplinkRateAdaptationMaxAllowedBitrate == 24400)
        {
          if (self->_uplinkRateAdaptationMaxAllowedBitrate < uplinkRateAdaptationMaxAllowedBitrate) {
            unsigned int uplinkRateAdaptationMaxAllowedBitrate = self->_uplinkRateAdaptationMaxAllowedBitrate;
          }
          unsigned int v11 = [(VCAudioPayload *)self->currentAudioPayload bitrate];
          int v12 = (VCAudioStream *)objc_opt_class();
          if (v11 == uplinkRateAdaptationMaxAllowedBitrate)
          {
            if (v12 == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                uint64_t v45 = VRTraceErrorLogLevelToCSTR();
                uint64_t v46 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                {
                  unsigned int v47 = self->_uplinkRateAdaptationMaxAllowedBitrate;
                  *(_DWORD *)uint32_t v51 = 136316162;
                  *(void *)&v51[4] = v45;
                  *(_WORD *)&v51[12] = 2080;
                  *(void *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
                  *(_WORD *)&v51[22] = 1024;
                  LODWORD(v52) = 363;
                  WORD2(v52) = 1024;
                  *(_DWORD *)((char *)&v52 + 6) = uplinkRateAdaptationMaxAllowedBitrate;
                  WORD5(v52) = 1024;
                  HIDWORD(v52) = v47;
                  __int16 v30 = " [%s] %s:%d Current and target bitrates are same uplinkTargetBitrate=%d maxAllowedBitrate=%d";
                  int v31 = v46;
                  uint32_t v32 = 40;
                  goto LABEL_38;
                }
              }
            }
            else
            {
              if (objc_opt_respondsToSelector()) {
                uint64_t v39 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
              }
              else {
                uint64_t v39 = &stru_1F3D3E450;
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                uint64_t v48 = VRTraceErrorLogLevelToCSTR();
                __int16 v49 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                {
                  unsigned int v50 = self->_uplinkRateAdaptationMaxAllowedBitrate;
                  *(_DWORD *)uint32_t v51 = 136316674;
                  *(void *)&v51[4] = v48;
                  *(_WORD *)&v51[12] = 2080;
                  *(void *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
                  *(_WORD *)&v51[22] = 1024;
                  LODWORD(v52) = 363;
                  WORD2(v52) = 2112;
                  *(void *)((char *)&v52 + 6) = v39;
                  HIWORD(v52) = 2048;
                  char v53 = self;
                  *(_WORD *)v54 = 1024;
                  *(_DWORD *)&v54[2] = uplinkRateAdaptationMaxAllowedBitrate;
                  *(_WORD *)&v54[6] = 1024;
                  *(_DWORD *)&v54[8] = v50;
                  __int16 v30 = " [%s] %s:%d %@(%p) Current and target bitrates are same uplinkTargetBitrate=%d maxAllowedBitrate=%d";
                  int v31 = v49;
                  uint32_t v32 = 60;
                  goto LABEL_38;
                }
              }
            }
            goto LABEL_29;
          }
          if (v12 == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
              goto LABEL_28;
            }
            uint64_t v15 = VRTraceErrorLogLevelToCSTR();
            __int16 v16 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_28;
            }
            unsigned int v17 = [(VCAudioPayload *)self->currentAudioPayload bitrate];
            unsigned int v18 = self->_uplinkRateAdaptationMaxAllowedBitrate;
            *(_DWORD *)uint32_t v51 = 136316418;
            *(void *)&v51[4] = v15;
            *(_WORD *)&v51[12] = 2080;
            *(void *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
            *(_WORD *)&v51[22] = 1024;
            LODWORD(v52) = 364;
            WORD2(v52) = 1024;
            *(_DWORD *)((char *)&v52 + 6) = v17;
            WORD5(v52) = 1024;
            HIDWORD(v52) = v18;
            LOWORD(v53) = 1024;
            *(_DWORD *)((char *)&v53 + 2) = uplinkRateAdaptationMaxAllowedBitrate;
            BOOL v19 = " [%s] %s:%d Applying uplink rate adaptation recommendation currentBitrate=%u maxAllowedBitrate=%d upli"
                  "nkTargetBitrate=%d";
            __int16 v20 = v16;
            uint32_t v21 = 46;
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              uint64_t v13 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
            }
            else {
              uint64_t v13 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
              goto LABEL_28;
            }
            uint64_t v22 = VRTraceErrorLogLevelToCSTR();
            int v23 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_28;
            }
            unsigned int v24 = [(VCAudioPayload *)self->currentAudioPayload bitrate];
            unsigned int v25 = self->_uplinkRateAdaptationMaxAllowedBitrate;
            *(_DWORD *)uint32_t v51 = 136316930;
            *(void *)&v51[4] = v22;
            *(_WORD *)&v51[12] = 2080;
            *(void *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
            *(_WORD *)&v51[22] = 1024;
            LODWORD(v52) = 364;
            WORD2(v52) = 2112;
            *(void *)((char *)&v52 + 6) = v13;
            HIWORD(v52) = 2048;
            char v53 = self;
            *(_WORD *)v54 = 1024;
            *(_DWORD *)&v54[2] = v24;
            *(_WORD *)&v54[6] = 1024;
            *(_DWORD *)&v54[8] = v25;
            *(_WORD *)&v54[12] = 1024;
            *(_DWORD *)&v54[14] = uplinkRateAdaptationMaxAllowedBitrate;
            BOOL v19 = " [%s] %s:%d %@(%p) Applying uplink rate adaptation recommendation currentBitrate=%u maxAllowedBitrate="
                  "%d uplinkTargetBitrate=%d";
            __int16 v20 = v23;
            uint32_t v21 = 66;
          }
          _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, v51, v21);
LABEL_28:
          int v26 = VCPayloadUtils_AudioCodecRateModeForBitrate(v10, uplinkRateAdaptationMaxAllowedBitrate);
          int v27 = [(VCAudioPayload *)self->currentAudioPayload bandwidth];
          *(_DWORD *)uint32_t v51 = v10;
          *(_DWORD *)&v51[4] = v26;
          *(_DWORD *)&v51[8] = v27;
          *(_DWORD *)&v51[12] = uplinkRateAdaptationMaxAllowedBitrate;
          *(void *)&v51[16] = 0;
          [(VCAudioStream *)self handleUplinkBitrateChange:v51 reason:2];
          goto LABEL_29;
        }
        if ((VCAudioStream *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]();
            }
          }
          goto LABEL_29;
        }
        if (objc_opt_respondsToSelector()) {
          __int16 v14 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
        }
        else {
          __int16 v14 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_29;
        }
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        uint64_t v29 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        *(_DWORD *)uint32_t v51 = 136316418;
        *(void *)&v51[4] = v28;
        *(_WORD *)&v51[12] = 2080;
        *(void *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
        *(_WORD *)&v51[22] = 1024;
        LODWORD(v52) = 361;
        WORD2(v52) = 2112;
        *(void *)((char *)&v52 + 6) = v14;
        HIWORD(v52) = 2048;
        char v53 = self;
        *(_WORD *)v54 = 1024;
        *(_DWORD *)&v54[2] = uplinkRateAdaptationMaxAllowedBitrate;
        __int16 v30 = " [%s] %s:%d %@(%p) Target bitrate change not supported targetBitrate=%d";
      }
      else
      {
        if ((VCAudioStream *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]();
            }
          }
          goto LABEL_29;
        }
        if (objc_opt_respondsToSelector()) {
          __int16 v34 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
        }
        else {
          __int16 v34 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_29;
        }
        uint64_t v44 = VRTraceErrorLogLevelToCSTR();
        uint64_t v29 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        *(_DWORD *)uint32_t v51 = 136316418;
        *(void *)&v51[4] = v44;
        *(_WORD *)&v51[12] = 2080;
        *(void *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
        *(_WORD *)&v51[22] = 1024;
        LODWORD(v52) = 360;
        WORD2(v52) = 2112;
        *(void *)((char *)&v52 + 6) = v34;
        HIWORD(v52) = 2048;
        char v53 = self;
        *(_WORD *)v54 = 1024;
        *(_DWORD *)&v54[2] = v10;
        __int16 v30 = " [%s] %s:%d %@(%p) Bitrate adaptation not supported payload=%d";
      }
      int v31 = v29;
      uint32_t v32 = 54;
      goto LABEL_38;
    }
  }
  if ((VCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_29;
    }
    uint64_t v35 = VRTraceErrorLogLevelToCSTR();
    uint64_t v36 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    uint64_t v37 = self->super._rateAdaptation;
    BOOL anbrEnabled = self->_anbrEnabled;
    *(_DWORD *)uint32_t v51 = 136316162;
    *(void *)&v51[4] = v35;
    *(_WORD *)&v51[12] = 2080;
    *(void *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
    *(_WORD *)&v51[22] = 1024;
    LODWORD(v52) = 358;
    WORD2(v52) = 2112;
    *(void *)((char *)&v52 + 6) = v37;
    HIWORD(v52) = 1024;
    LODWORD(v53) = anbrEnabled;
    __int16 v30 = " [%s] %s:%d Received unexpected bitrate change _rateAdaptation=%@, anbrEnabled=%d";
    int v31 = v36;
    uint32_t v32 = 44;
LABEL_38:
    _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, v30, v51, v32);
    goto LABEL_29;
  }
  if (objc_opt_respondsToSelector()) {
    int v33 = (__CFString *)[(VCAudioStream *)self performSelector:sel_logPrefix];
  }
  else {
    int v33 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v40 = VRTraceErrorLogLevelToCSTR();
    __int16 v41 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v42 = self->super._rateAdaptation;
      BOOL v43 = self->_anbrEnabled;
      *(_DWORD *)uint32_t v51 = 136316674;
      *(void *)&v51[4] = v40;
      *(_WORD *)&v51[12] = 2080;
      *(void *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
      *(_WORD *)&v51[22] = 1024;
      LODWORD(v52) = 358;
      WORD2(v52) = 2112;
      *(void *)((char *)&v52 + 6) = v33;
      HIWORD(v52) = 2048;
      char v53 = self;
      *(_WORD *)v54 = 2112;
      *(void *)&v54[2] = v42;
      *(_WORD *)&unsigned char v54[10] = 1024;
      *(_DWORD *)&v54[12] = v43;
      __int16 v30 = " [%s] %s:%d %@(%p) Received unexpected bitrate change _rateAdaptation=%@, anbrEnabled=%d";
      int v31 = v41;
      uint32_t v32 = 64;
      goto LABEL_38;
    }
  }
LABEL_29:
  [(VCMediaStream *)self unlock];
}

- (void)generateRTCPXRVoIPMetricsReports:reportCount:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d audio receiver is not ready", v2, v3, v4, v5, v6);
}

- (void)startAudioWithCompletionHandler:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCAudioStream startAudioWithCompletionHandler:]";
  OUTLINED_FUNCTION_3();
  int v4 = 656;
  __int16 v5 = v0;
  int v6 = 656;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioStream.m:%d: Benign Error (possibly not): We started audio before we negotiated our codec.", v2, 0x22u);
}

- (void)setupPayloads
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d No Audio Payloads, returning false", v2, v3, v4, v5, v6);
}

- (void)getCodecConfigForPayload:block:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Failed to retrieve codec config.", v2, v3, v4, v5, v6);
}

+ (void)audioIOTypeForMode:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v4 = "+[VCAudioStream audioIOTypeForMode:]";
  OUTLINED_FUNCTION_3();
  int v5 = 870;
  __int16 v6 = v0;
  int v7 = v1;
  __int16 v8 = v0;
  int v9 = 0;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d Invalid audioStreamMode=%d defaulting to VCAudioIOAudioType=%d", v3, 0x28u);
}

- (void)setReceiverPayloads
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Failed to setup receiver decoders.", v2, v3, v4, v5, v6);
}

+ (void)operatingModeForAudioStreamMode:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCAudioStream operatingModeForAudioStreamMode:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Invalid mode=%ld", v2, *(const char **)v3, (unint64_t)"+[VCAudioStream operatingModeForAudioStreamMode:]" >> 16, v4);
}

- (void)setDeviceRoleForAudioStreamMode:direction:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCAudioStream setDeviceRoleForAudioStreamMode:direction:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Invalid mode=%ld", v2, *(const char **)v3, (unint64_t)"-[VCAudioStream setDeviceRoleForAudioStreamMode:direction:]" >> 16, v4);
}

- (void)setupCaptionsCoordinatorsWithFormat:direction:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Failed to allocate the captions coordinator", v2, v3, v4, v5, v6);
}

- (void)setupAudioStreamWithClientPid:enableAudioPowerSpectrum:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Failed to allocate audio payloads", v2, v3, v4, v5, v6);
}

- (void)setupAudioStreamWithClientPid:enableAudioPowerSpectrum:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Failed to allocate the DTMF event handler", v2, v3, v4, v5, v6);
}

- (void)createAudioReceiver
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCAudioStream createAudioReceiver]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d VCAudioStream[%p] Failed to set audio receiver payloads", v2, *(const char **)v3, (unint64_t)"-[VCAudioStream createAudioReceiver]" >> 16, v4);
}

- (void)createAudioTransmitter:streamIDs:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCAudioStream createAudioTransmitter:streamIDs:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d VCAudioStream[%p] Failed to create the audio transmitter", v2, *(const char **)v3, (unint64_t)"-[VCAudioStream createAudioTransmitter:streamIDs:]" >> 16, v4);
}

- (void)validateAudioStreamConfigurations:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d The VCMediaStreamConfig array is empty!", v2, v3, v4, v5, v6);
}

- (void)setupSourceTransport:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Failed to allocate source transport", v2, v3, v4, v5, v6);
}

- (void)setupSourceTransport:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Failed to insert source transport", v2, v3, v4, v5, v6);
}

- (void)createTransportWithStreamConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Failed to create RTP handle", v2, v3, v4, v5, v6);
}

- (void)createTransportWithStreamConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Failed to create RTP extension", v2, v3, v4, v5, v6);
}

- (void)createTransportWithStreamConfig:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Failed to setup the transport", v2, v3, v4, v5, v6);
}

- (void)cleanupBeforeReconfigure:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Reconfiguring VCAudioStream with a different number of transports.", v2, v3, v4, v5, v6);
}

- (void)onConfigureStreamWithConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Failed to create telephony interface", v2, v3, v4, v5, v6);
}

- (void)onConfigureStreamWithConfiguration:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Failed to create transport", v2, v3, v4, v5, v6);
}

- (void)onConfigureStreamWithConfiguration:error:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Failed to configure transport for streamConfig=%p", v2, *(const char **)v3, (unint64_t)"-[VCAudioStream onConfigureStreamWithConfiguration:error:]" >> 16, v4);
}

- (void)onConfigureStreamWithConfiguration:error:.cold.4()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
  __int16 v3 = 1024;
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, "VCAudioStream [%s] %s:%d Failed to configure transport for streamConfig=%p", v1, 0x26u);
}

- (void)onConfigureStreamWithConfiguration:(NSObject *)a3 error:.cold.5(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (*a2) {
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_10_1();
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d error[%s]", v4, 0x26u);
}

- (void)onConfigureStreamWithConfiguration:(NSObject *)a3 error:.cold.6(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (*a2) {
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_10_1();
  _os_log_fault_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_FAULT, "VCAudioStream [%s] %s:%d error[%s]", v4, 0x26u);
}

void __46__VCAudioStream_onPauseWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d VCAudioStream[%p] setPauseAudio: error pausing audio", v2, v3, v4, v5);
}

void __47__VCAudioStream_onResumeWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d VCAudioStream[%p] setPauseAudio: error unpausing audio", v2, v3, v4, v5);
}

- (void)setTargetStreamID:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  __int16 v3 = "-[VCAudioStream setTargetStreamID:]";
  OUTLINED_FUNCTION_3();
  int v4 = 2759;
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  _os_log_debug_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEBUG, "VCAudioStream [%s] %s:%d TargetStreamID didn't change %@", v2, 0x26u);
}

void __37__VCAudioStream_setupReportingAgent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Reporting not available (no backends)", v2, v3, v4, v5, v6);
}

- (void)updateCodecPayloadAndBitrateForStartEvent:bitrate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Payload is null", v2, v3, v4, v5, v6);
}

- (void)updateCodecPayloadAndBitrateForStartEvent:bitrate:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Bitrate is null", v2, v3, v4, v5, v6);
}

- (void)getConnectionTypeForStreamMode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Unexpected mode VCAudioStreamModeInvalid", v2, v3, v4, v5, v6);
}

- (void)addSyncSourceDelegate:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCAudioStream addSyncSourceDelegate:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d CMSimpleQueueEnqueue enqueue failed with error=%d", v2, *(const char **)v3, (unint64_t)"-[VCAudioStream addSyncSourceDelegate:]" >> 16, 3287);
}

- (void)removeSyncSourceDelegate:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCAudioStream removeSyncSourceDelegate:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d CMSimpleQueueEnqueue enqueue failed with error=%d", v2, *(const char **)v3, (unint64_t)"-[VCAudioStream removeSyncSourceDelegate:]" >> 16, 3312);
}

- (void)didUpdateBasebandCodec:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioStream [%s] %s:%d Unexpected SPI call", v2, v3, v4, v5, v6);
}

@end