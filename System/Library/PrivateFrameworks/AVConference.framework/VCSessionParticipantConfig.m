@interface VCSessionParticipantConfig
- (BOOL)audioEnabled;
- (BOOL)audioMuted;
- (BOOL)audioPaused;
- (BOOL)enableMaxCameraBitrateVideoQualityNewTier;
- (BOOL)frequencyMeteringEnabled;
- (BOOL)isEnhancedJBAdaptationsEnabled;
- (BOOL)isGKVoiceChat;
- (BOOL)isHigherAudioREDCutoverU1Enabled;
- (BOOL)isLowLatencyAudio;
- (BOOL)isOneToOneAuthenticationTagEnabled;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isServerRTxEnabled;
- (BOOL)isUplinkRetransmissionEnabled;
- (BOOL)outOfProcessCodecsEnabled;
- (BOOL)screenControlEnabled;
- (BOOL)screenEnabled;
- (BOOL)videoEnabled;
- (BOOL)videoPaused;
- (NSData)participantData;
- (NSData)positionalInfo;
- (NSDictionary)mediaStates;
- (NSString)idsDestination;
- (NSString)sessionUUID;
- (NSString)uuid;
- (OS_nw_activity)nwActivity;
- (VCAudioCaptionsCoordinator)captionsCoordinator;
- (VCNetworkFeedbackController)networkFeedbackController;
- (VCSecurityKeyManager)securityKeyManager;
- (VCSessionMediaNegotiator)mediaNegotiator;
- (__CFDictionary)spatialMetadataEntryMap;
- (float)audioPosition;
- (float)volume;
- (id)description;
- (int)processId;
- (int64_t)sessionMode;
- (unint64_t)idsParticipantID;
- (unsigned)prominenceIndex;
- (unsigned)transportSessionID;
- (unsigned)videoQuality;
- (unsigned)visibilityIndex;
- (void)cleanupNwActivity;
- (void)dealloc;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setAudioMuted:(BOOL)a3;
- (void)setAudioPaused:(BOOL)a3;
- (void)setAudioPosition:(float)a3;
- (void)setCaptionsCoordinator:(id)a3;
- (void)setEnableMaxCameraBitrateVideoQualityNewTier:(BOOL)a3;
- (void)setFrequencyMeteringEnabled:(BOOL)a3;
- (void)setIdsDestination:(id)a3;
- (void)setIdsParticipantID:(unint64_t)a3;
- (void)setIsEnhancedJBAdaptationsEnabled:(BOOL)a3;
- (void)setIsGKVoiceChat:(BOOL)a3;
- (void)setIsHigherAudioREDCutoverU1Enabled:(BOOL)a3;
- (void)setIsLowLatencyAudio:(BOOL)a3;
- (void)setIsOneToOneModeEnabled:(BOOL)a3;
- (void)setIsServerRTxEnabled:(BOOL)a3;
- (void)setIsUplinkRetransmissionEnabled:(BOOL)a3;
- (void)setMediaNegotiator:(id)a3;
- (void)setMediaStates:(id)a3;
- (void)setNetworkFeedbackController:(id)a3;
- (void)setNwActivity:(id)a3;
- (void)setOneToOneAuthenticationTagEnabled:(BOOL)a3;
- (void)setOutOfProcessCodecsEnabled:(BOOL)a3;
- (void)setParticipantData:(id)a3;
- (void)setPositionalInfo:(id)a3;
- (void)setProcessId:(int)a3;
- (void)setProminenceIndex:(unsigned int)a3;
- (void)setScreenControlEnabled:(BOOL)a3;
- (void)setScreenEnabled:(BOOL)a3;
- (void)setSecurityKeyManager:(id)a3;
- (void)setSessionMode:(int64_t)a3;
- (void)setSessionUUID:(id)a3;
- (void)setSpatialMetadata:(void *)a3;
- (void)setSpatialMetadataEntryMap:(__CFDictionary *)a3;
- (void)setTransportSessionID:(unsigned int)a3;
- (void)setUuid:(id)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)setVideoQuality:(unsigned __int8)a3;
- (void)setVisibilityIndex:(unsigned int)a3;
- (void)setVolume:(float)a3;
- (void)spatialMetadata;
@end

@implementation VCSessionParticipantConfig

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  spatialMetadata = self->_spatialMetadata;
  if (spatialMetadata) {
    CFRelease(spatialMetadata);
  }

  [(VCSessionParticipantConfig *)self cleanupNwActivity];
  spatialMetadataEntryMap = self->_spatialMetadataEntryMap;
  if (spatialMetadataEntryMap) {
    CFRelease(spatialMetadataEntryMap);
  }

  v5.receiver = self;
  v5.super_class = (Class)VCSessionParticipantConfig;
  [(VCSessionParticipantConfig *)&v5 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@[%p] idsParticipantID[%llu] participantUUID[%@] audioEnabled[%d] videoEnabled[%d] screenEnabled[%d] videoPaused[%d] videoQuality[%d] visibilityIndex[%d] prominenceIndex[%d] positionalInfo[%p] mediaStates[%p]", NSStringFromClass(v4), self, self->_idsParticipantID, self->_uuid, self->_audioEnabled, self->_videoEnabled, self->_screenEnabled, self->_videoPaused, self->_videoQuality, self->_visibilityIndex, self->_prominenceIndex, self->_positionalInfo, self->_mediaStates];
}

- (void)spatialMetadata
{
  return self->_spatialMetadata;
}

- (void)setSpatialMetadata:(void *)a3
{
  spatialMetadata = self->_spatialMetadata;
  if (spatialMetadata != a3)
  {
    if (spatialMetadata) {
      CFRelease(spatialMetadata);
    }
    if (a3) {
      uint64_t v6 = (void *)CFRetain(a3);
    }
    else {
      uint64_t v6 = 0;
    }
    self->_spatialMetadata = v6;
  }
}

- (void)setNwActivity:(id)a3
{
  nwActivity = self->_nwActivity;
  if (nwActivity) {
    nw_release(nwActivity);
  }
  self->_nwActivity = (OS_nw_activity *)a3;
  if (a3)
  {
    nw_retain(a3);
  }
}

- (void)cleanupNwActivity
{
  nwActivity = self->_nwActivity;
  if (nwActivity)
  {
    nw_release(nwActivity);
    self->_nwActivity = 0;
  }
}

- (__CFDictionary)spatialMetadataEntryMap
{
  return self->_spatialMetadataEntryMap;
}

- (void)setSpatialMetadataEntryMap:(__CFDictionary *)a3
{
  spatialMetadataEntryMap = self->_spatialMetadataEntryMap;
  if (spatialMetadataEntryMap) {
    CFRelease(spatialMetadataEntryMap);
  }
  self->_spatialMetadataEntryMap = a3;
  if (a3)
  {
    CFRetain(a3);
  }
}

- (NSData)participantData
{
  return self->_participantData;
}

- (void)setParticipantData:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (unint64_t)idsParticipantID
{
  return self->_idsParticipantID;
}

- (void)setIdsParticipantID:(unint64_t)a3
{
  self->_idsParticipantID = a3;
}

- (BOOL)audioEnabled
{
  return self->_audioEnabled;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
}

- (BOOL)videoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)screenEnabled
{
  return self->_screenEnabled;
}

- (void)setScreenEnabled:(BOOL)a3
{
  self->_screenEnabled = a3;
}

- (BOOL)frequencyMeteringEnabled
{
  return self->_frequencyMeteringEnabled;
}

- (void)setFrequencyMeteringEnabled:(BOOL)a3
{
  self->_frequencyMeteringEnabled = a3;
}

- (BOOL)audioMuted
{
  return self->_audioMuted;
}

- (void)setAudioMuted:(BOOL)a3
{
  self->_audioMuted = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (float)audioPosition
{
  return self->_audioPosition;
}

- (void)setAudioPosition:(float)a3
{
  self->_audioPosition = a3;
}

- (BOOL)audioPaused
{
  return self->_audioPaused;
}

- (void)setAudioPaused:(BOOL)a3
{
  self->_audioPaused = a3;
}

- (BOOL)videoPaused
{
  return self->_videoPaused;
}

- (void)setVideoPaused:(BOOL)a3
{
  self->_videoPaused = a3;
}

- (unsigned)videoQuality
{
  return self->_videoQuality;
}

- (void)setVideoQuality:(unsigned __int8)a3
{
  self->_videoQuality = a3;
}

- (unsigned)visibilityIndex
{
  return self->_visibilityIndex;
}

- (void)setVisibilityIndex:(unsigned int)a3
{
  self->_visibilityIndex = a3;
}

- (unsigned)prominenceIndex
{
  return self->_prominenceIndex;
}

- (void)setProminenceIndex:(unsigned int)a3
{
  self->_prominenceIndex = a3;
}

- (NSData)positionalInfo
{
  return self->_positionalInfo;
}

- (void)setPositionalInfo:(id)a3
{
}

- (OS_nw_activity)nwActivity
{
  return self->_nwActivity;
}

- (NSDictionary)mediaStates
{
  return self->_mediaStates;
}

- (void)setMediaStates:(id)a3
{
}

- (VCSessionMediaNegotiator)mediaNegotiator
{
  return self->_mediaNegotiator;
}

- (void)setMediaNegotiator:(id)a3
{
}

- (VCSecurityKeyManager)securityKeyManager
{
  return self->_securityKeyManager;
}

- (void)setSecurityKeyManager:(id)a3
{
}

- (int)processId
{
  return self->_processId;
}

- (void)setProcessId:(int)a3
{
  self->_processId = a3;
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (unsigned)transportSessionID
{
  return self->_transportSessionID;
}

- (void)setTransportSessionID:(unsigned int)a3
{
  self->_transportSessionID = a3;
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (void)setIdsDestination:(id)a3
{
}

- (BOOL)isGKVoiceChat
{
  return self->_isGKVoiceChat;
}

- (void)setIsGKVoiceChat:(BOOL)a3
{
  self->_isGKVoiceChat = a3;
}

- (BOOL)isLowLatencyAudio
{
  return self->_isLowLatencyAudio;
}

- (void)setIsLowLatencyAudio:(BOOL)a3
{
  self->_isLowLatencyAudio = a3;
}

- (int64_t)sessionMode
{
  return self->_sessionMode;
}

- (void)setSessionMode:(int64_t)a3
{
  self->_sessionMode = a3;
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_isOneToOneModeEnabled;
}

- (void)setIsOneToOneModeEnabled:(BOOL)a3
{
  self->_isOneToOneModeEnabled = a3;
}

- (VCNetworkFeedbackController)networkFeedbackController
{
  return self->_networkFeedbackController;
}

- (void)setNetworkFeedbackController:(id)a3
{
}

- (VCAudioCaptionsCoordinator)captionsCoordinator
{
  return self->_captionsCoordinator;
}

- (void)setCaptionsCoordinator:(id)a3
{
}

- (BOOL)isUplinkRetransmissionEnabled
{
  return self->_isUplinkRetransmissionEnabled;
}

- (void)setIsUplinkRetransmissionEnabled:(BOOL)a3
{
  self->_isUplinkRetransmissionEnabled = a3;
}

- (BOOL)isOneToOneAuthenticationTagEnabled
{
  return self->_oneToOneAuthenticationTagEnabled;
}

- (void)setOneToOneAuthenticationTagEnabled:(BOOL)a3
{
  self->_oneToOneAuthenticationTagEnabled = a3;
}

- (BOOL)isEnhancedJBAdaptationsEnabled
{
  return self->_isEnhancedJBAdaptationsEnabled;
}

- (void)setIsEnhancedJBAdaptationsEnabled:(BOOL)a3
{
  self->_isEnhancedJBAdaptationsEnabled = a3;
}

- (BOOL)enableMaxCameraBitrateVideoQualityNewTier
{
  return self->_enableMaxCameraBitrateVideoQualityNewTier;
}

- (void)setEnableMaxCameraBitrateVideoQualityNewTier:(BOOL)a3
{
  self->_enableMaxCameraBitrateVideoQualityNewTier = a3;
}

- (BOOL)isHigherAudioREDCutoverU1Enabled
{
  return self->_isHigherAudioREDCutoverU1Enabled;
}

- (void)setIsHigherAudioREDCutoverU1Enabled:(BOOL)a3
{
  self->_isHigherAudioREDCutoverU1Enabled = a3;
}

- (BOOL)screenControlEnabled
{
  return self->_screenControlEnabled;
}

- (void)setScreenControlEnabled:(BOOL)a3
{
  self->_screenControlEnabled = a3;
}

- (BOOL)outOfProcessCodecsEnabled
{
  return self->_outOfProcessCodecsEnabled;
}

- (void)setOutOfProcessCodecsEnabled:(BOOL)a3
{
  self->_outOfProcessCodecsEnabled = a3;
}

- (BOOL)isServerRTxEnabled
{
  return self->_isServerRTxEnabled;
}

- (void)setIsServerRTxEnabled:(BOOL)a3
{
  self->_isServerRTxEnabled = a3;
}

@end