@interface VCAudioTransmitterConfig
- (AVCStatisticsCollector)statisticsCollector;
- (BOOL)allowAudioSwitching;
- (BOOL)alwaysOnAudioRedundancyEnabled;
- (BOOL)audioDumpEnabled;
- (BOOL)audioIssueDetectorEnabled;
- (BOOL)cellularAllowRedLowBitratesEnabled;
- (BOOL)ignoreSilence;
- (BOOL)includeRedSequenceOffset;
- (BOOL)isCurrentDTXEnabled;
- (BOOL)isHigherAudioREDCutoverU1Enabled;
- (BOOL)isRedEnabled;
- (BOOL)isUseCaseWatchContinuity;
- (BOOL)needsPacketThread;
- (BOOL)ramStadSRCEnabled;
- (BOOL)sendActiveVoiceOnly;
- (BOOL)shouldApplyRedAsBoolean;
- (BOOL)shouldCreateRedundancyController;
- (BOOL)supportsAdaptation;
- (BOOL)supportsCodecBandwidthUpdate;
- (BOOL)targetBitrateIsAudioOnly;
- (BOOL)transmitROC;
- (BOOL)useChannelDataFormat;
- (BOOL)useRateControl;
- (BOOL)useWifiTiers;
- (BOOL)wifiAllowRedLowBitratesEnabled;
- (NSArray)streamIDs;
- (NSArray)supportedNumRedundantPayload;
- (NSMutableArray)audioPayloads;
- (VCAudioPayload)chosenAudioPayload;
- (VCAudioPayload)chosenDTXPayload;
- (VCTransportSession)transportSession;
- (id)description;
- (int)bundlingScheme;
- (int)chosenRedPayloadType;
- (int)operatingMode;
- (int)ratType;
- (int)reportingParentID;
- (opaqueRTCReporting)reportingAgent;
- (tagHANDLE)afrcHandle;
- (tagHANDLE)mediaQueue;
- (tagHANDLE)rtpHandle;
- (tagHANDLE)rtpVideo;
- (tagVCAudioFrameFormat)inputFormat;
- (tagVCCryptor)sframeCryptor;
- (unint64_t)remoteIDSParticipantID;
- (unsigned)constantTransportOverhead;
- (unsigned)maxAudioPacketSize;
- (unsigned)maxIDSStreamIdCount;
- (unsigned)mediaControlInfoVersion;
- (unsigned)packetExpirationTime;
- (unsigned)packetsPerBundle;
- (unsigned)qualityIndex;
- (unsigned)redMaxDelay20ms;
- (unsigned)redNumPayloads;
- (unsigned)tierNetworkBitrate;
- (unsigned)tierPickerMode;
- (void)controlInfoGenerator;
- (void)dealloc;
- (void)setAfrcHandle:(tagHANDLE *)a3;
- (void)setAllowAudioSwitching:(BOOL)a3;
- (void)setAlwaysOnAudioRedundancyEnabled:(BOOL)a3;
- (void)setAudioDumpEnabled:(BOOL)a3;
- (void)setAudioIssueDetectorEnabled:(BOOL)a3;
- (void)setAudioPayloads:(id)a3;
- (void)setBundlingScheme:(int)a3;
- (void)setCellularAllowRedLowBitratesEnabled:(BOOL)a3;
- (void)setChosenAudioPayload:(id)a3;
- (void)setChosenDTXPayload:(id)a3;
- (void)setChosenRedPayloadType:(int)a3;
- (void)setConstantTransportOverhead:(unsigned int)a3;
- (void)setControlInfoGenerator:(void *)a3;
- (void)setCurrentDTXEnable:(BOOL)a3;
- (void)setIgnoreSilence:(BOOL)a3;
- (void)setIncludeRedSequenceOffset:(BOOL)a3;
- (void)setInputFormat:(tagVCAudioFrameFormat *)a3;
- (void)setIsHigherAudioREDCutoverU1Enabled:(BOOL)a3;
- (void)setIsUseCaseWatchContinuity:(BOOL)a3;
- (void)setMaxAudioPacketSize:(unsigned int)a3;
- (void)setMaxIDSStreamIdCount:(unsigned int)a3;
- (void)setMediaControlInfoVersion:(unsigned __int8)a3;
- (void)setMediaQueue:(tagHANDLE *)a3;
- (void)setNeedsPacketThread:(BOOL)a3;
- (void)setOperatingMode:(int)a3;
- (void)setPacketExpirationTime:(unsigned int)a3;
- (void)setPacketsPerBundle:(unsigned __int8)a3;
- (void)setQualityIndex:(unsigned int)a3;
- (void)setRamStadSRCEnabled:(BOOL)a3;
- (void)setRatType:(int)a3;
- (void)setRedEnabled:(BOOL)a3;
- (void)setRedMaxDelay20ms:(unsigned int)a3;
- (void)setRedNumPayloads:(unsigned int)a3;
- (void)setRemoteIDSParticipantID:(unint64_t)a3;
- (void)setReportingAgent:(opaqueRTCReporting *)a3;
- (void)setReportingParentID:(int)a3;
- (void)setRtpHandle:(tagHANDLE *)a3;
- (void)setRtpVideo:(tagHANDLE *)a3;
- (void)setSendActiveVoiceOnly:(BOOL)a3;
- (void)setSframeCryptor:(tagVCCryptor *)a3;
- (void)setShouldApplyRedAsBoolean:(BOOL)a3;
- (void)setShouldCreateRedundancyController:(BOOL)a3;
- (void)setStatisticsCollector:(id)a3;
- (void)setStreamIDs:(id)a3;
- (void)setSupportedNumRedundantPayload:(id)a3;
- (void)setSupportsAdaptation:(BOOL)a3;
- (void)setSupportsCodecBandwidthUpdate:(BOOL)a3;
- (void)setTargetBitrateIsAudioOnly:(BOOL)a3;
- (void)setTierNetworkBitrate:(unsigned int)a3;
- (void)setTierPickerMode:(unsigned __int8)a3;
- (void)setTransmitROC:(BOOL)a3;
- (void)setTransportSession:(id)a3;
- (void)setUseChannelDataFormat:(BOOL)a3;
- (void)setUseRateControl:(BOOL)a3;
- (void)setUseWifiTiers:(BOOL)a3;
- (void)setWifiAllowRedLowBitratesEnabled:(BOOL)a3;
@end

@implementation VCAudioTransmitterConfig

- (void)setSframeCryptor:(tagVCCryptor *)a3
{
  sframeCryptor = self->_sframeCryptor;
  self->_sframeCryptor = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (sframeCryptor)
  {
    CFRelease(sframeCryptor);
  }
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  sframeCryptor = self->_sframeCryptor;
  if (sframeCryptor) {
    CFRelease(sframeCryptor);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCAudioTransmitterConfig;
  [(VCAudioTransmitterConfig *)&v4 dealloc];
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)VCAudioTransmitterConfig;
  id v4 = [(VCAudioTransmitterConfig *)&v15 description];
  uint64_t v5 = "YES";
  if (self->_useRateControl) {
    v6 = "YES";
  }
  else {
    v6 = "NO";
  }
  if (self->_allowAudioSwitching) {
    v7 = "YES";
  }
  else {
    v7 = "NO";
  }
  if (self->_supportsAdaptation) {
    v8 = "YES";
  }
  else {
    v8 = "NO";
  }
  if (self->_redEnabled) {
    v9 = "YES";
  }
  else {
    v9 = "NO";
  }
  if (self->_transmitROC) {
    v10 = "YES";
  }
  else {
    v10 = "NO";
  }
  if (self->_ignoreSilence) {
    v11 = "YES";
  }
  else {
    v11 = "NO";
  }
  if (self->_useWifiTiers) {
    v12 = "YES";
  }
  else {
    v12 = "NO";
  }
  if (self->_ramStadSRCEnabled) {
    v13 = "YES";
  }
  else {
    v13 = "NO";
  }
  if (!self->_isHigherAudioREDCutoverU1Enabled) {
    uint64_t v5 = "NO";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"{ %@ audioPayloads=%@ chosenAudioPayload=%@ chosenDTXPayload=%@ chosenRedPayloadType=%d packetsPerBundle=%d useRateControl=%s bundlingScheme=%d allowAudioSwitching=%s supportsAdaptation=%s operatingMode=%d isRedEnabled=%s transmitROC=%s ignoreSilence=%s useWifiTiers=%s qualityIndex=%d ramStadSRCEnabled=%s isHigherAudioREDCutoverU1Enabled=%s }", v4, *(_OWORD *)&self->_audioPayloads, self->_chosenDTXPayload, self->_chosenRedPayloadType, self->_packetsPerBundle, v6, self->_bundlingScheme, v7, v8, self->_operatingMode, v9, v10, v11, v12, self->_qualityIndex, v13,
               v5);
}

- (tagHANDLE)rtpHandle
{
  return self->_rtpHandle;
}

- (void)setRtpHandle:(tagHANDLE *)a3
{
  self->_rtpHandle = a3;
}

- (tagHANDLE)rtpVideo
{
  return self->_rtpVideo;
}

- (void)setRtpVideo:(tagHANDLE *)a3
{
  self->_rtpVideo = a3;
}

- (void)controlInfoGenerator
{
  return self->_controlInfoGenerator;
}

- (void)setControlInfoGenerator:(void *)a3
{
  self->_controlInfoGenerator = a3;
}

- (tagHANDLE)mediaQueue
{
  return self->_mediaQueue;
}

- (void)setMediaQueue:(tagHANDLE *)a3
{
  self->_mediaQueue = a3;
}

- (tagHANDLE)afrcHandle
{
  return self->_afrcHandle;
}

- (void)setAfrcHandle:(tagHANDLE *)a3
{
  self->_afrcHandle = a3;
}

- (NSMutableArray)audioPayloads
{
  return self->_audioPayloads;
}

- (void)setAudioPayloads:(id)a3
{
}

- (VCAudioPayload)chosenAudioPayload
{
  return self->_chosenAudioPayload;
}

- (void)setChosenAudioPayload:(id)a3
{
}

- (VCAudioPayload)chosenDTXPayload
{
  return self->_chosenDTXPayload;
}

- (void)setChosenDTXPayload:(id)a3
{
}

- (int)chosenRedPayloadType
{
  return self->_chosenRedPayloadType;
}

- (void)setChosenRedPayloadType:(int)a3
{
  self->_chosenRedPayloadType = a3;
}

- (unsigned)packetsPerBundle
{
  return self->_packetsPerBundle;
}

- (void)setPacketsPerBundle:(unsigned __int8)a3
{
  self->_packetsPerBundle = a3;
}

- (BOOL)useRateControl
{
  return self->_useRateControl;
}

- (void)setUseRateControl:(BOOL)a3
{
  self->_useRateControl = a3;
}

- (int)bundlingScheme
{
  return self->_bundlingScheme;
}

- (void)setBundlingScheme:(int)a3
{
  self->_bundlingScheme = a3;
}

- (BOOL)isUseCaseWatchContinuity
{
  return self->_isUseCaseWatchContinuity;
}

- (void)setIsUseCaseWatchContinuity:(BOOL)a3
{
  self->_isUseCaseWatchContinuity = a3;
}

- (BOOL)allowAudioSwitching
{
  return self->_allowAudioSwitching;
}

- (void)setAllowAudioSwitching:(BOOL)a3
{
  self->_allowAudioSwitching = a3;
}

- (BOOL)supportsAdaptation
{
  return self->_supportsAdaptation;
}

- (void)setSupportsAdaptation:(BOOL)a3
{
  self->_supportsAdaptation = a3;
}

- (int)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(int)a3
{
  self->_operatingMode = a3;
}

- (tagVCAudioFrameFormat)inputFormat
{
  long long v3 = *(_OWORD *)&self[3].format.mSampleRate;
  *(_OWORD *)&retstr->format.mSampleRate = *(_OWORD *)&self[2].format.mBitsPerChannel;
  *(_OWORD *)&retstr->format.mBytesPerPacket = v3;
  *(_OWORD *)&retstr->format.mBitsPerChannel = *(_OWORD *)&self[3].format.mBytesPerPacket;
  return self;
}

- (void)setInputFormat:(tagVCAudioFrameFormat *)a3
{
  long long v3 = *(_OWORD *)&a3->format.mSampleRate;
  long long v4 = *(_OWORD *)&a3->format.mBitsPerChannel;
  *(_OWORD *)&self->_inputFormat.format.mBytesPerPacket = *(_OWORD *)&a3->format.mBytesPerPacket;
  *(_OWORD *)&self->_inputFormat.format.mBitsPerChannel = v4;
  *(_OWORD *)&self->_inputFormat.format.mSampleRate = v3;
}

- (opaqueRTCReporting)reportingAgent
{
  return self->_reportingAgent;
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  self->_reportingAgent = a3;
}

- (VCTransportSession)transportSession
{
  return self->_transportSession;
}

- (void)setTransportSession:(id)a3
{
}

- (BOOL)isRedEnabled
{
  return self->_redEnabled;
}

- (void)setRedEnabled:(BOOL)a3
{
  self->_redEnabled = a3;
}

- (BOOL)includeRedSequenceOffset
{
  return self->_includeRedSequenceOffset;
}

- (void)setIncludeRedSequenceOffset:(BOOL)a3
{
  self->_includeRedSequenceOffset = a3;
}

- (unsigned)redNumPayloads
{
  return self->_redNumPayloads;
}

- (void)setRedNumPayloads:(unsigned int)a3
{
  self->_redNumPayloads = a3;
}

- (unsigned)redMaxDelay20ms
{
  return self->_redMaxDelay20ms;
}

- (void)setRedMaxDelay20ms:(unsigned int)a3
{
  self->_redMaxDelay20ms = a3;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (void)setStatisticsCollector:(id)a3
{
}

- (BOOL)transmitROC
{
  return self->_transmitROC;
}

- (void)setTransmitROC:(BOOL)a3
{
  self->_transmitROC = a3;
}

- (BOOL)ignoreSilence
{
  return self->_ignoreSilence;
}

- (void)setIgnoreSilence:(BOOL)a3
{
  self->_ignoreSilence = a3;
}

- (BOOL)needsPacketThread
{
  return self->_needsPacketThread;
}

- (void)setNeedsPacketThread:(BOOL)a3
{
  self->_needsPacketThread = a3;
}

- (NSArray)streamIDs
{
  return self->_streamIDs;
}

- (void)setStreamIDs:(id)a3
{
}

- (unsigned)tierNetworkBitrate
{
  return self->_tierNetworkBitrate;
}

- (void)setTierNetworkBitrate:(unsigned int)a3
{
  self->_tierNetworkBitrate = a3;
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

- (BOOL)sendActiveVoiceOnly
{
  return self->_sendActiveVoiceOnly;
}

- (void)setSendActiveVoiceOnly:(BOOL)a3
{
  self->_sendActiveVoiceOnly = a3;
}

- (int)reportingParentID
{
  return self->_reportingParentID;
}

- (void)setReportingParentID:(int)a3
{
  self->_reportingParentID = a3;
}

- (BOOL)isCurrentDTXEnabled
{
  return self->_currentDTXEnable;
}

- (void)setCurrentDTXEnable:(BOOL)a3
{
  self->_currentDTXEnable = a3;
}

- (unsigned)mediaControlInfoVersion
{
  return self->_mediaControlInfoVersion;
}

- (void)setMediaControlInfoVersion:(unsigned __int8)a3
{
  self->_mediaControlInfoVersion = a3;
}

- (BOOL)alwaysOnAudioRedundancyEnabled
{
  return self->_alwaysOnAudioRedundancyEnabled;
}

- (void)setAlwaysOnAudioRedundancyEnabled:(BOOL)a3
{
  self->_alwaysOnAudioRedundancyEnabled = a3;
}

- (BOOL)cellularAllowRedLowBitratesEnabled
{
  return self->_cellularAllowRedLowBitratesEnabled;
}

- (void)setCellularAllowRedLowBitratesEnabled:(BOOL)a3
{
  self->_cellularAllowRedLowBitratesEnabled = a3;
}

- (BOOL)wifiAllowRedLowBitratesEnabled
{
  return self->_wifiAllowRedLowBitratesEnabled;
}

- (void)setWifiAllowRedLowBitratesEnabled:(BOOL)a3
{
  self->_wifiAllowRedLowBitratesEnabled = a3;
}

- (unint64_t)remoteIDSParticipantID
{
  return self->_remoteIDSParticipantID;
}

- (void)setRemoteIDSParticipantID:(unint64_t)a3
{
  self->_remoteIDSParticipantID = a3;
}

- (BOOL)shouldCreateRedundancyController
{
  return self->_shouldCreateRedundancyController;
}

- (void)setShouldCreateRedundancyController:(BOOL)a3
{
  self->_shouldCreateRedundancyController = a3;
}

- (BOOL)useChannelDataFormat
{
  return self->_useChannelDataFormat;
}

- (void)setUseChannelDataFormat:(BOOL)a3
{
  self->_useChannelDataFormat = a3;
}

- (BOOL)shouldApplyRedAsBoolean
{
  return self->_shouldApplyRedAsBoolean;
}

- (void)setShouldApplyRedAsBoolean:(BOOL)a3
{
  self->_shouldApplyRedAsBoolean = a3;
}

- (unsigned)qualityIndex
{
  return self->_qualityIndex;
}

- (void)setQualityIndex:(unsigned int)a3
{
  self->_qualityIndex = a3;
}

- (BOOL)useWifiTiers
{
  return self->_useWifiTiers;
}

- (void)setUseWifiTiers:(BOOL)a3
{
  self->_useWifiTiers = a3;
}

- (tagVCCryptor)sframeCryptor
{
  return self->_sframeCryptor;
}

- (unsigned)packetExpirationTime
{
  return self->_packetExpirationTime;
}

- (void)setPacketExpirationTime:(unsigned int)a3
{
  self->_packetExpirationTime = a3;
}

- (BOOL)supportsCodecBandwidthUpdate
{
  return self->_supportsCodecBandwidthUpdate;
}

- (void)setSupportsCodecBandwidthUpdate:(BOOL)a3
{
  self->_supportsCodecBandwidthUpdate = a3;
}

- (int)ratType
{
  return self->_ratType;
}

- (void)setRatType:(int)a3
{
  self->_ratType = a3;
}

- (BOOL)ramStadSRCEnabled
{
  return self->_ramStadSRCEnabled;
}

- (void)setRamStadSRCEnabled:(BOOL)a3
{
  self->_ramStadSRCEnabled = a3;
}

- (unsigned)maxAudioPacketSize
{
  return self->_maxAudioPacketSize;
}

- (void)setMaxAudioPacketSize:(unsigned int)a3
{
  self->_maxAudioPacketSize = a3;
}

- (unsigned)constantTransportOverhead
{
  return self->_constantTransportOverhead;
}

- (void)setConstantTransportOverhead:(unsigned int)a3
{
  self->_constantTransportOverhead = a3;
}

- (BOOL)isHigherAudioREDCutoverU1Enabled
{
  return self->_isHigherAudioREDCutoverU1Enabled;
}

- (void)setIsHigherAudioREDCutoverU1Enabled:(BOOL)a3
{
  self->_isHigherAudioREDCutoverU1Enabled = a3;
}

- (BOOL)audioIssueDetectorEnabled
{
  return self->_audioIssueDetectorEnabled;
}

- (void)setAudioIssueDetectorEnabled:(BOOL)a3
{
  self->_audioIssueDetectorEnabled = a3;
}

- (BOOL)targetBitrateIsAudioOnly
{
  return self->_targetBitrateIsAudioOnly;
}

- (void)setTargetBitrateIsAudioOnly:(BOOL)a3
{
  self->_targetBitrateIsAudioOnly = a3;
}

- (BOOL)audioDumpEnabled
{
  return self->_audioDumpEnabled;
}

- (void)setAudioDumpEnabled:(BOOL)a3
{
  self->_audioDumpEnabled = a3;
}

- (unsigned)tierPickerMode
{
  return self->_tierPickerMode;
}

- (void)setTierPickerMode:(unsigned __int8)a3
{
  self->_tierPickerMode = a3;
}

@end