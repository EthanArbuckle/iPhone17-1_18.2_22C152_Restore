@interface AFSpeechRequestOptions
+ (BOOL)supportsSecureCoding;
- (AFLanguageDetectionUserContext)languageDetectionUserContext;
- (AFMyriadContext)myriadContext;
- (AFSpeechRecordingAlertPolicy)recordingAlertPolicy;
- (AFSpeechRequestOptions)initWithActivationEvent:(int64_t)a3;
- (AFSpeechRequestOptions)initWithCoder:(id)a3;
- (AFSpeechSynthesisRecord)speechSynthesisRecord;
- (AFSpeechTestRequestOptions)testRequestOptions;
- (BOOL)acousticIdEnabled;
- (BOOL)disableInputAudioPowerUpdate;
- (BOOL)disableOutputAudioPowerUpdate;
- (BOOL)hasPlayedStartAlert;
- (BOOL)isEyesFree;
- (BOOL)isHeadphonesAuthenticated;
- (BOOL)isHybridUODEnabled;
- (BOOL)isInAmbient;
- (BOOL)isInitialBringUp;
- (BOOL)isLiveActivitiesSupported;
- (BOOL)isMediaPlaying;
- (BOOL)isOnPhoneCall;
- (BOOL)isRaiseToSpeak;
- (BOOL)isSystemApertureEnabled;
- (BOOL)isTest;
- (BOOL)isVoiceTrigger;
- (BOOL)pendCallbacksUntilAfterContinuation;
- (BOOL)releaseAudioSessionOnRecordingCompletion;
- (BOOL)reloadSmartSiriVolume;
- (BOOL)skipGeneratingSpeechPacket;
- (BOOL)skipPersonalizedASR;
- (BOOL)suppressStartAlert;
- (BOOL)suppressStopAlert;
- (BOOL)useAutomaticEndpointing;
- (BOOL)useBorealisBuffer;
- (BOOL)usePrelisteningMode;
- (BOOL)useStreamingDictation;
- (NSDictionary)clientAnalyticsContext;
- (NSDictionary)continuousConversationInfo;
- (NSDictionary)raiseToSpeakEventInfo;
- (NSDictionary)startContext;
- (NSDictionary)stopContext;
- (NSDictionary)voiceTriggerEventInfo;
- (NSFileHandle)audioFileHandle;
- (NSNumber)homeButtonUpFromBeep;
- (NSNumber)notifyState;
- (NSString)activationDeviceIdentifier;
- (NSString)applicationBundleIdentifier;
- (NSString)applicationDisplayName;
- (NSString)preheatLanguage;
- (NSString)recordDeviceIdentifier;
- (NSString)serverCommandId;
- (NSURL)audioFileURL;
- (NSURL)preheatTestModelPath;
- (NSUUID)intuitiveConversationRequestId;
- (NSUUID)turnIdentifier;
- (NSXPCListenerEndpoint)speechRecordingEventListeningEndpoint;
- (SCDAContext)scdaContext;
- (double)activationEventTime;
- (double)expectedActivationEventTime;
- (double)homeButtonDownEventTime;
- (float)mediaPlaybackVolume;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForTestWithTestRequestOptions:(id)a3;
- (int64_t)activationEvent;
- (int64_t)announcementPlatform;
- (int64_t)audioFileType;
- (int64_t)dictationInputOrigin;
- (int64_t)endpointerOperationMode;
- (int64_t)presentationMode;
- (unint64_t)activationEventMachAbsoluteTime;
- (unint64_t)bargeInOptions;
- (unint64_t)dictationVoiceTriggerAbsStartSampleId;
- (unint64_t)homeButtonDownEventMachAbsoluteTime;
- (unint64_t)smartSiriVolumeTTSType;
- (unint64_t)stopRecordingHostTime;
- (void)encodeWithCoder:(id)a3;
- (void)setAcousticIdEnabled:(BOOL)a3;
- (void)setActivationDeviceIdentifier:(id)a3;
- (void)setActivationEvent:(int64_t)a3;
- (void)setActivationEventMachAbsoluteTime:(unint64_t)a3;
- (void)setActivationEventTime:(double)a3;
- (void)setAnnouncementPlatform:(int64_t)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setApplicationDisplayName:(id)a3;
- (void)setAudioFileHandle:(id)a3;
- (void)setAudioFileType:(int64_t)a3;
- (void)setAudioFileURL:(id)a3;
- (void)setBargeInOptions:(unint64_t)a3;
- (void)setClientAnalyticsContext:(id)a3;
- (void)setContinuousConversationInfo:(id)a3;
- (void)setDictationInputOrigin:(int64_t)a3;
- (void)setDictationVoiceTriggerAbsStartSampleId:(unint64_t)a3;
- (void)setDisableInputAudioPowerUpdate:(BOOL)a3;
- (void)setDisableOutputAudioPowerUpdate:(BOOL)a3;
- (void)setEndpointerOperationMode:(int64_t)a3;
- (void)setExpectedActivationEventTime:(double)a3;
- (void)setHasPlayedStartAlert:(BOOL)a3;
- (void)setHomeButtonDownEventMachAbsoluteTime:(unint64_t)a3;
- (void)setHomeButtonDownEventTime:(double)a3;
- (void)setHomeButtonUpFromBeep:(id)a3;
- (void)setHybridUODEnabled:(BOOL)a3;
- (void)setIntuitiveConversationRequestId:(id)a3;
- (void)setIsEyesFree:(BOOL)a3;
- (void)setIsHeadphonesAuthenticated:(BOOL)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInitialBringUp:(BOOL)a3;
- (void)setIsLiveActivitiesSupported:(BOOL)a3;
- (void)setIsMediaPlaying:(BOOL)a3;
- (void)setIsOnPhoneCall:(BOOL)a3;
- (void)setIsSystemApertureEnabled:(BOOL)a3;
- (void)setIsTest:(BOOL)a3;
- (void)setLanguageDetectionUserContext:(id)a3;
- (void)setMediaPlaybackVolume:(float)a3;
- (void)setMyriadContext:(id)a3;
- (void)setNotifyState:(id)a3;
- (void)setPendCallbacksUntilAfterContinuation:(BOOL)a3;
- (void)setPreheatLanguage:(id)a3;
- (void)setPreheatTestModelPath:(id)a3;
- (void)setPresentationMode:(int64_t)a3;
- (void)setRaiseToSpeakEventInfo:(id)a3;
- (void)setRecordDeviceIdentifier:(id)a3;
- (void)setRecordingAlertPolicy:(id)a3;
- (void)setReleaseAudioSessionOnRecordingCompletion:(BOOL)a3;
- (void)setReloadSmartSiriVolume:(BOOL)a3;
- (void)setScdaContext:(id)a3;
- (void)setServerCommandId:(id)a3;
- (void)setSkipGeneratingSpeechPacket:(BOOL)a3;
- (void)setSkipPersonalizedASR:(BOOL)a3;
- (void)setSmartSiriVolumeTTSType:(unint64_t)a3;
- (void)setSpeechRecordingEventListeningEndpoint:(id)a3;
- (void)setSpeechSynthesisRecord:(id)a3;
- (void)setStartContext:(id)a3;
- (void)setStopContext:(id)a3;
- (void)setStopRecordingHostTime:(unint64_t)a3;
- (void)setSuppressStartAlert:(BOOL)a3;
- (void)setSuppressStopAlert:(BOOL)a3;
- (void)setTestRequestOptions:(id)a3;
- (void)setTurnIdentifier:(id)a3;
- (void)setUseAutomaticEndpointing:(BOOL)a3;
- (void)setUseBorealisBuffer:(BOOL)a3;
- (void)setUsePrelisteningMode:(BOOL)a3;
- (void)setUseStreamingDictation:(BOOL)a3;
- (void)setVoiceTriggerEventInfo:(id)a3;
@end

@implementation AFSpeechRequestOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testRequestOptions, 0);
  objc_storeStrong((id *)&self->_intuitiveConversationRequestId, 0);
  objc_storeStrong((id *)&self->_continuousConversationInfo, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_preheatTestModelPath, 0);
  objc_storeStrong((id *)&self->_preheatLanguage, 0);
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
  objc_storeStrong((id *)&self->_languageDetectionUserContext, 0);
  objc_storeStrong((id *)&self->_stopContext, 0);
  objc_storeStrong((id *)&self->_startContext, 0);
  objc_storeStrong((id *)&self->_clientAnalyticsContext, 0);
  objc_storeStrong((id *)&self->_speechSynthesisRecord, 0);
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_notifyState, 0);
  objc_storeStrong((id *)&self->_speechRecordingEventListeningEndpoint, 0);
  objc_storeStrong((id *)&self->_recordDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_scdaContext, 0);
  objc_storeStrong((id *)&self->_myriadContext, 0);
  objc_storeStrong((id *)&self->_raiseToSpeakEventInfo, 0);
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_audioFileHandle, 0);
  objc_storeStrong((id *)&self->_homeButtonUpFromBeep, 0);
  objc_storeStrong((id *)&self->_recordingAlertPolicy, 0);
  objc_storeStrong((id *)&self->_serverCommandId, 0);
  objc_storeStrong((id *)&self->_activationDeviceIdentifier, 0);
}

- (void)setIsHeadphonesAuthenticated:(BOOL)a3
{
  self->_isHeadphonesAuthenticated = a3;
}

- (BOOL)isHeadphonesAuthenticated
{
  return self->_isHeadphonesAuthenticated;
}

- (void)setTestRequestOptions:(id)a3
{
}

- (AFSpeechTestRequestOptions)testRequestOptions
{
  return self->_testRequestOptions;
}

- (void)setIsTest:(BOOL)a3
{
  self->_isTest = a3;
}

- (BOOL)isTest
{
  return self->_isTest;
}

- (void)setSmartSiriVolumeTTSType:(unint64_t)a3
{
  self->_smartSiriVolumeTTSType = a3;
}

- (unint64_t)smartSiriVolumeTTSType
{
  return self->_smartSiriVolumeTTSType;
}

- (void)setAnnouncementPlatform:(int64_t)a3
{
  self->_announcementPlatform = a3;
}

- (int64_t)announcementPlatform
{
  return self->_announcementPlatform;
}

- (void)setIntuitiveConversationRequestId:(id)a3
{
}

- (NSUUID)intuitiveConversationRequestId
{
  return self->_intuitiveConversationRequestId;
}

- (void)setContinuousConversationInfo:(id)a3
{
}

- (NSDictionary)continuousConversationInfo
{
  return self->_continuousConversationInfo;
}

- (void)setHybridUODEnabled:(BOOL)a3
{
  self->_hybridUODEnabled = a3;
}

- (BOOL)isHybridUODEnabled
{
  return self->_hybridUODEnabled;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationDisplayName:(id)a3
{
}

- (NSString)applicationDisplayName
{
  return self->_applicationDisplayName;
}

- (void)setDictationVoiceTriggerAbsStartSampleId:(unint64_t)a3
{
  self->_dictationVoiceTriggerAbsStartSampleId = a3;
}

- (unint64_t)dictationVoiceTriggerAbsStartSampleId
{
  return self->_dictationVoiceTriggerAbsStartSampleId;
}

- (void)setPreheatTestModelPath:(id)a3
{
}

- (NSURL)preheatTestModelPath
{
  return self->_preheatTestModelPath;
}

- (void)setPreheatLanguage:(id)a3
{
}

- (NSString)preheatLanguage
{
  return self->_preheatLanguage;
}

- (void)setPresentationMode:(int64_t)a3
{
  self->_presentationMode = a3;
}

- (int64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setTurnIdentifier:(id)a3
{
}

- (NSUUID)turnIdentifier
{
  return self->_turnIdentifier;
}

- (void)setDictationInputOrigin:(int64_t)a3
{
  self->_dictationInputOrigin = a3;
}

- (int64_t)dictationInputOrigin
{
  return self->_dictationInputOrigin;
}

- (void)setLanguageDetectionUserContext:(id)a3
{
}

- (AFLanguageDetectionUserContext)languageDetectionUserContext
{
  return self->_languageDetectionUserContext;
}

- (void)setMediaPlaybackVolume:(float)a3
{
  self->_mediaPlaybackVolume = a3;
}

- (float)mediaPlaybackVolume
{
  return self->_mediaPlaybackVolume;
}

- (void)setIsMediaPlaying:(BOOL)a3
{
  self->_isMediaPlaying = a3;
}

- (BOOL)isMediaPlaying
{
  return self->_isMediaPlaying;
}

- (void)setSkipGeneratingSpeechPacket:(BOOL)a3
{
  self->_skipGeneratingSpeechPacket = a3;
}

- (BOOL)skipGeneratingSpeechPacket
{
  return self->_skipGeneratingSpeechPacket;
}

- (void)setIsOnPhoneCall:(BOOL)a3
{
  self->_isOnPhoneCall = a3;
}

- (BOOL)isOnPhoneCall
{
  return self->_isOnPhoneCall;
}

- (void)setStopContext:(id)a3
{
}

- (NSDictionary)stopContext
{
  return self->_stopContext;
}

- (void)setStartContext:(id)a3
{
}

- (NSDictionary)startContext
{
  return self->_startContext;
}

- (void)setClientAnalyticsContext:(id)a3
{
}

- (NSDictionary)clientAnalyticsContext
{
  return self->_clientAnalyticsContext;
}

- (void)setSpeechSynthesisRecord:(id)a3
{
}

- (AFSpeechSynthesisRecord)speechSynthesisRecord
{
  return self->_speechSynthesisRecord;
}

- (void)setBargeInOptions:(unint64_t)a3
{
  self->_bargeInOptions = a3;
}

- (unint64_t)bargeInOptions
{
  return self->_bargeInOptions;
}

- (void)setHasPlayedStartAlert:(BOOL)a3
{
  self->_hasPlayedStartAlert = a3;
}

- (BOOL)hasPlayedStartAlert
{
  return self->_hasPlayedStartAlert;
}

- (void)setSuppressStopAlert:(BOOL)a3
{
  self->_suppressStopAlert = a3;
}

- (BOOL)suppressStopAlert
{
  return self->_suppressStopAlert;
}

- (void)setSuppressStartAlert:(BOOL)a3
{
  self->_suppressStartAlert = a3;
}

- (BOOL)suppressStartAlert
{
  return self->_suppressStartAlert;
}

- (void)setAudioFileURL:(id)a3
{
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setNotifyState:(id)a3
{
}

- (NSNumber)notifyState
{
  return self->_notifyState;
}

- (void)setSkipPersonalizedASR:(BOOL)a3
{
  self->_skipPersonalizedASR = a3;
}

- (BOOL)skipPersonalizedASR
{
  return self->_skipPersonalizedASR;
}

- (void)setReloadSmartSiriVolume:(BOOL)a3
{
  self->_reloadSmartSiriVolume = a3;
}

- (BOOL)reloadSmartSiriVolume
{
  return self->_reloadSmartSiriVolume;
}

- (void)setUseBorealisBuffer:(BOOL)a3
{
  self->_useBorealisBuffer = a3;
}

- (BOOL)useBorealisBuffer
{
  return self->_useBorealisBuffer;
}

- (void)setPendCallbacksUntilAfterContinuation:(BOOL)a3
{
  self->_pendCallbacksUntilAfterContinuation = a3;
}

- (BOOL)pendCallbacksUntilAfterContinuation
{
  return self->_pendCallbacksUntilAfterContinuation;
}

- (void)setUsePrelisteningMode:(BOOL)a3
{
  self->_usePrelisteningMode = a3;
}

- (BOOL)usePrelisteningMode
{
  return self->_usePrelisteningMode;
}

- (void)setSpeechRecordingEventListeningEndpoint:(id)a3
{
}

- (NSXPCListenerEndpoint)speechRecordingEventListeningEndpoint
{
  return self->_speechRecordingEventListeningEndpoint;
}

- (void)setRecordDeviceIdentifier:(id)a3
{
}

- (NSString)recordDeviceIdentifier
{
  return self->_recordDeviceIdentifier;
}

- (void)setReleaseAudioSessionOnRecordingCompletion:(BOOL)a3
{
  self->_releaseAudioSessionOnRecordingCompletion = a3;
}

- (BOOL)releaseAudioSessionOnRecordingCompletion
{
  return self->_releaseAudioSessionOnRecordingCompletion;
}

- (void)setScdaContext:(id)a3
{
}

- (SCDAContext)scdaContext
{
  return self->_scdaContext;
}

- (void)setMyriadContext:(id)a3
{
}

- (AFMyriadContext)myriadContext
{
  return self->_myriadContext;
}

- (void)setRaiseToSpeakEventInfo:(id)a3
{
}

- (NSDictionary)raiseToSpeakEventInfo
{
  return self->_raiseToSpeakEventInfo;
}

- (void)setVoiceTriggerEventInfo:(id)a3
{
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (void)setAudioFileHandle:(id)a3
{
}

- (NSFileHandle)audioFileHandle
{
  return self->_audioFileHandle;
}

- (void)setAudioFileType:(int64_t)a3
{
  self->_audioFileType = a3;
}

- (int64_t)audioFileType
{
  return self->_audioFileType;
}

- (void)setAcousticIdEnabled:(BOOL)a3
{
  self->_acousticIdEnabled = a3;
}

- (BOOL)acousticIdEnabled
{
  return self->_acousticIdEnabled;
}

- (void)setHomeButtonUpFromBeep:(id)a3
{
}

- (NSNumber)homeButtonUpFromBeep
{
  return self->_homeButtonUpFromBeep;
}

- (void)setIsInitialBringUp:(BOOL)a3
{
  self->_isInitialBringUp = a3;
}

- (BOOL)isInitialBringUp
{
  return self->_isInitialBringUp;
}

- (void)setStopRecordingHostTime:(unint64_t)a3
{
  self->_stopRecordingHostTime = a3;
}

- (unint64_t)stopRecordingHostTime
{
  return self->_stopRecordingHostTime;
}

- (void)setExpectedActivationEventTime:(double)a3
{
  self->_expectedActivationEventTime = a3;
}

- (double)expectedActivationEventTime
{
  return self->_expectedActivationEventTime;
}

- (void)setActivationEventMachAbsoluteTime:(unint64_t)a3
{
  self->_activationEventMachAbsoluteTime = a3;
}

- (unint64_t)activationEventMachAbsoluteTime
{
  return self->_activationEventMachAbsoluteTime;
}

- (void)setActivationEventTime:(double)a3
{
  self->_activationEventTime = a3;
}

- (double)activationEventTime
{
  return self->_activationEventTime;
}

- (void)setHomeButtonDownEventMachAbsoluteTime:(unint64_t)a3
{
  self->_homeButtonDownEventMachAbsoluteTime = a3;
}

- (unint64_t)homeButtonDownEventMachAbsoluteTime
{
  return self->_homeButtonDownEventMachAbsoluteTime;
}

- (void)setHomeButtonDownEventTime:(double)a3
{
  self->_homeButtonDownEventTime = a3;
}

- (double)homeButtonDownEventTime
{
  return self->_homeButtonDownEventTime;
}

- (void)setUseStreamingDictation:(BOOL)a3
{
  self->_useStreamingDictation = a3;
}

- (BOOL)useStreamingDictation
{
  return self->_useStreamingDictation;
}

- (void)setDisableOutputAudioPowerUpdate:(BOOL)a3
{
  self->_disableOutputAudioPowerUpdate = a3;
}

- (BOOL)disableOutputAudioPowerUpdate
{
  return self->_disableOutputAudioPowerUpdate;
}

- (void)setDisableInputAudioPowerUpdate:(BOOL)a3
{
  self->_disableInputAudioPowerUpdate = a3;
}

- (BOOL)disableInputAudioPowerUpdate
{
  return self->_disableInputAudioPowerUpdate;
}

- (void)setRecordingAlertPolicy:(id)a3
{
}

- (AFSpeechRecordingAlertPolicy)recordingAlertPolicy
{
  return self->_recordingAlertPolicy;
}

- (void)setEndpointerOperationMode:(int64_t)a3
{
  self->_endpointerOperationMode = a3;
}

- (int64_t)endpointerOperationMode
{
  return self->_endpointerOperationMode;
}

- (void)setUseAutomaticEndpointing:(BOOL)a3
{
  self->_useAutomaticEndpointing = a3;
}

- (BOOL)useAutomaticEndpointing
{
  return self->_useAutomaticEndpointing;
}

- (void)setServerCommandId:(id)a3
{
}

- (NSString)serverCommandId
{
  return self->_serverCommandId;
}

- (void)setIsInAmbient:(BOOL)a3
{
  self->_isInAmbient = a3;
}

- (void)setIsLiveActivitiesSupported:(BOOL)a3
{
  self->_isLiveActivitiesSupported = a3;
}

- (void)setIsSystemApertureEnabled:(BOOL)a3
{
  self->_isSystemApertureEnabled = a3;
}

- (void)setIsEyesFree:(BOOL)a3
{
  self->_isEyesFree = a3;
}

- (BOOL)isEyesFree
{
  return self->_isEyesFree;
}

- (void)setActivationDeviceIdentifier:(id)a3
{
}

- (NSString)activationDeviceIdentifier
{
  return self->_activationDeviceIdentifier;
}

- (void)setActivationEvent:(int64_t)a3
{
  self->_activationEvent = a3;
}

- (int64_t)activationEvent
{
  return self->_activationEvent;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[AFSpeechRequestOptions alloc] initWithActivationEvent:self->_activationEvent];
  [(AFSpeechRequestOptions *)v4 setActivationDeviceIdentifier:self->_activationDeviceIdentifier];
  [(AFSpeechRequestOptions *)v4 setIsEyesFree:self->_isEyesFree];
  [(AFSpeechRequestOptions *)v4 setIsSystemApertureEnabled:self->_isSystemApertureEnabled];
  [(AFSpeechRequestOptions *)v4 setIsLiveActivitiesSupported:self->_isLiveActivitiesSupported];
  [(AFSpeechRequestOptions *)v4 setIsInAmbient:self->_isInAmbient];
  [(AFSpeechRequestOptions *)v4 setServerCommandId:self->_serverCommandId];
  [(AFSpeechRequestOptions *)v4 setUseAutomaticEndpointing:self->_useAutomaticEndpointing];
  [(AFSpeechRequestOptions *)v4 setEndpointerOperationMode:self->_endpointerOperationMode];
  [(AFSpeechRequestOptions *)v4 setRecordingAlertPolicy:self->_recordingAlertPolicy];
  [(AFSpeechRequestOptions *)v4 setDisableInputAudioPowerUpdate:self->_disableInputAudioPowerUpdate];
  [(AFSpeechRequestOptions *)v4 setDisableOutputAudioPowerUpdate:self->_disableOutputAudioPowerUpdate];
  [(AFSpeechRequestOptions *)v4 setUseStreamingDictation:self->_useStreamingDictation];
  [(AFSpeechRequestOptions *)v4 setHomeButtonDownEventTime:self->_homeButtonDownEventTime];
  [(AFSpeechRequestOptions *)v4 setHomeButtonDownEventMachAbsoluteTime:self->_homeButtonDownEventMachAbsoluteTime];
  [(AFSpeechRequestOptions *)v4 setActivationEventTime:self->_activationEventTime];
  [(AFSpeechRequestOptions *)v4 setActivationEventMachAbsoluteTime:self->_activationEventMachAbsoluteTime];
  [(AFSpeechRequestOptions *)v4 setExpectedActivationEventTime:self->_expectedActivationEventTime];
  [(AFSpeechRequestOptions *)v4 setStopRecordingHostTime:self->_stopRecordingHostTime];
  [(AFSpeechRequestOptions *)v4 setIsInitialBringUp:self->_isInitialBringUp];
  [(AFSpeechRequestOptions *)v4 setHomeButtonUpFromBeep:self->_homeButtonUpFromBeep];
  [(AFSpeechRequestOptions *)v4 setAcousticIdEnabled:self->_acousticIdEnabled];
  [(AFSpeechRequestOptions *)v4 setAudioFileType:self->_audioFileType];
  [(AFSpeechRequestOptions *)v4 setAudioFileHandle:self->_audioFileHandle];
  [(AFSpeechRequestOptions *)v4 setVoiceTriggerEventInfo:self->_voiceTriggerEventInfo];
  [(AFSpeechRequestOptions *)v4 setRaiseToSpeakEventInfo:self->_raiseToSpeakEventInfo];
  [(AFSpeechRequestOptions *)v4 setMyriadContext:self->_myriadContext];
  [(AFSpeechRequestOptions *)v4 setScdaContext:self->_scdaContext];
  [(AFSpeechRequestOptions *)v4 setReleaseAudioSessionOnRecordingCompletion:self->_releaseAudioSessionOnRecordingCompletion];
  [(AFSpeechRequestOptions *)v4 setRecordDeviceIdentifier:self->_recordDeviceIdentifier];
  [(AFSpeechRequestOptions *)v4 setSpeechRecordingEventListeningEndpoint:self->_speechRecordingEventListeningEndpoint];
  [(AFSpeechRequestOptions *)v4 setPendCallbacksUntilAfterContinuation:self->_pendCallbacksUntilAfterContinuation];
  [(AFSpeechRequestOptions *)v4 setUseBorealisBuffer:self->_useBorealisBuffer];
  [(AFSpeechRequestOptions *)v4 setNotifyState:self->_notifyState];
  [(AFSpeechRequestOptions *)v4 setAudioFileURL:self->_audioFileURL];
  [(AFSpeechRequestOptions *)v4 setSuppressStartAlert:self->_suppressStartAlert];
  [(AFSpeechRequestOptions *)v4 setSuppressStopAlert:self->_suppressStopAlert];
  [(AFSpeechRequestOptions *)v4 setHasPlayedStartAlert:self->_hasPlayedStartAlert];
  [(AFSpeechRequestOptions *)v4 setBargeInOptions:self->_bargeInOptions];
  [(AFSpeechRequestOptions *)v4 setSpeechSynthesisRecord:self->_speechSynthesisRecord];
  [(AFSpeechRequestOptions *)v4 setReloadSmartSiriVolume:self->_reloadSmartSiriVolume];
  [(AFSpeechRequestOptions *)v4 setSkipPersonalizedASR:self->_skipPersonalizedASR];
  [(AFSpeechRequestOptions *)v4 setClientAnalyticsContext:self->_clientAnalyticsContext];
  [(AFSpeechRequestOptions *)v4 setStartContext:self->_startContext];
  [(AFSpeechRequestOptions *)v4 setStopContext:self->_stopContext];
  [(AFSpeechRequestOptions *)v4 setIsOnPhoneCall:self->_isOnPhoneCall];
  [(AFSpeechRequestOptions *)v4 setIsMediaPlaying:self->_isMediaPlaying];
  *(float *)&double v5 = self->_mediaPlaybackVolume;
  [(AFSpeechRequestOptions *)v4 setMediaPlaybackVolume:v5];
  [(AFSpeechRequestOptions *)v4 setTurnIdentifier:self->_turnIdentifier];
  [(AFSpeechRequestOptions *)v4 setLanguageDetectionUserContext:self->_languageDetectionUserContext];
  [(AFSpeechRequestOptions *)v4 setDictationInputOrigin:self->_dictationInputOrigin];
  [(AFSpeechRequestOptions *)v4 setApplicationDisplayName:self->_applicationDisplayName];
  [(AFSpeechRequestOptions *)v4 setApplicationBundleIdentifier:self->_applicationBundleIdentifier];
  [(AFSpeechRequestOptions *)v4 setPresentationMode:self->_presentationMode];
  [(AFSpeechRequestOptions *)v4 setPreheatLanguage:self->_preheatLanguage];
  [(AFSpeechRequestOptions *)v4 setPreheatTestModelPath:self->_preheatTestModelPath];
  [(AFSpeechRequestOptions *)v4 setDictationVoiceTriggerAbsStartSampleId:self->_dictationVoiceTriggerAbsStartSampleId];
  [(AFSpeechRequestOptions *)v4 setContinuousConversationInfo:self->_continuousConversationInfo];
  [(AFSpeechRequestOptions *)v4 setIntuitiveConversationRequestId:self->_intuitiveConversationRequestId];
  [(AFSpeechRequestOptions *)v4 setAnnouncementPlatform:self->_announcementPlatform];
  [(AFSpeechRequestOptions *)v4 setSmartSiriVolumeTTSType:self->_smartSiriVolumeTTSType];
  [(AFSpeechRequestOptions *)v4 setIsTest:self->_isTest];
  [(AFSpeechRequestOptions *)v4 setTestRequestOptions:self->_testRequestOptions];
  [(AFSpeechRequestOptions *)v4 setIsHeadphonesAuthenticated:self->_isHeadphonesAuthenticated];
  return v4;
}

- (AFSpeechRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v75.receiver = self;
  v75.super_class = (Class)AFSpeechRequestOptions;
  double v5 = [(AFSpeechRequestOptions *)&v75 init];
  if (v5)
  {
    v5->_activationEvent = [v4 decodeIntegerForKey:@"_activationEvent"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_activationDeviceIdentifier"];
    activationDeviceIdentifier = v5->_activationDeviceIdentifier;
    v5->_activationDeviceIdentifier = (NSString *)v6;

    v5->_isEyesFree = [v4 decodeBoolForKey:@"_isEyesFree"];
    v5->_isSystemApertureEnabled = [v4 decodeBoolForKey:@"_isSystemApertureEnabled"];
    v5->_isLiveActivitiesSupported = [v4 decodeBoolForKey:@"_isLiveActivitiesSupported"];
    v5->_isInAmbient = [v4 decodeBoolForKey:@"_isInAmbient"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serverCommandId"];
    serverCommandId = v5->_serverCommandId;
    v5->_serverCommandId = (NSString *)v8;

    v5->_useAutomaticEndpointing = [v4 decodeBoolForKey:@"_useAutomaticEndpointing"];
    v5->_endpointerOperationMode = [v4 decodeIntegerForKey:@"_endpointerOperationMode"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recordingAlertPolicy"];
    recordingAlertPolicy = v5->_recordingAlertPolicy;
    v5->_recordingAlertPolicy = (AFSpeechRecordingAlertPolicy *)v10;

    v5->_disableInputAudioPowerUpdate = [v4 decodeBoolForKey:@"_disableInputAudioPowerUpdate"];
    v5->_disableOutputAudioPowerUpdate = [v4 decodeBoolForKey:@"_disableOutputAudioPowerUpdate"];
    v5->_useStreamingDictation = [v4 decodeBoolForKey:@"_useStreamingDictation"];
    [v4 decodeDoubleForKey:@"_homeButtonDownEventTime"];
    v5->_homeButtonDownEventTime = v12;
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_homeButtonDownEventMachAbsoluteTime"];
    v5->_homeButtonDownEventMachAbsoluteTime = [v13 unsignedLongLongValue];

    [v4 decodeDoubleForKey:@"_activationEventTime"];
    v5->_activationEventTime = v14;
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_activationEventMachAbsoluteTime"];
    v5->_activationEventMachAbsoluteTime = [v15 unsignedLongLongValue];

    [v4 decodeDoubleForKey:@"_expectedActivationEventTime"];
    v5->_expectedActivationEventTime = v16;
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_stopRecordingHostTime"];
    v5->_stopRecordingHostTime = [v17 unsignedLongLongValue];

    v5->_isInitialBringUp = [v4 decodeBoolForKey:@"_isInitialBringUp"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_homeButtonUpFromBeep"];
    homeButtonUpFromBeep = v5->_homeButtonUpFromBeep;
    v5->_homeButtonUpFromBeep = (NSNumber *)v18;

    v5->_acousticIdEnabled = [v4 decodeBoolForKey:@"_acousticIdEnabled"];
    v5->_audioFileType = [v4 decodeIntegerForKey:@"_audioFileType"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_audioFileHandle"];
    audioFileHandle = v5->_audioFileHandle;
    v5->_audioFileHandle = (NSFileHandle *)v20;

    uint64_t v22 = [v4 decodePropertyListForKey:@"_voiceTriggerEventInfo"];
    voiceTriggerEventInfo = v5->_voiceTriggerEventInfo;
    v5->_voiceTriggerEventInfo = (NSDictionary *)v22;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = v5->_voiceTriggerEventInfo;
      v5->_voiceTriggerEventInfo = 0;
    }
    uint64_t v25 = [v4 decodePropertyListForKey:@"_raiseToSpeakEventInfo"];
    raiseToSpeakEventInfo = v5->_raiseToSpeakEventInfo;
    v5->_raiseToSpeakEventInfo = (NSDictionary *)v25;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v27 = v5->_raiseToSpeakEventInfo;
      v5->_raiseToSpeakEventInfo = 0;
    }
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_myriadContext"];
    myriadContext = v5->_myriadContext;
    v5->_myriadContext = (AFMyriadContext *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_scdaContext"];
    scdaContext = v5->_scdaContext;
    v5->_scdaContext = (SCDAContext *)v30;

    v5->_releaseAudioSessionOnRecordingCompletion = [v4 decodeBoolForKey:@"_releaseAudioSessionOnRecordingCompletion"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recordDeviceIdentifier"];
    recordDeviceIdentifier = v5->_recordDeviceIdentifier;
    v5->_recordDeviceIdentifier = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_speechRecordingEventListeningEndpoint"];
    speechRecordingEventListeningEndpoint = v5->_speechRecordingEventListeningEndpoint;
    v5->_speechRecordingEventListeningEndpoint = (NSXPCListenerEndpoint *)v34;

    v5->_usePrelisteningMode = [v4 decodeBoolForKey:@"_usePrelisteningMode"];
    v5->_pendCallbacksUntilAfterContinuation = [v4 decodeBoolForKey:@"_pendCallbacksUntilAfterContinuation"];
    v5->_useBorealisBuffer = [v4 decodeBoolForKey:@"_useBorealisBuffer"];
    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_notifyState"];
    notifyState = v5->_notifyState;
    v5->_notifyState = (NSNumber *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_audioFileURL"];
    audioFileURL = v5->_audioFileURL;
    v5->_audioFileURL = (NSURL *)v38;

    v5->_suppressStartAlert = [v4 decodeBoolForKey:@"_suppressStartAlert"];
    v5->_suppressStopAlert = [v4 decodeBoolForKey:@"_suppressStopAlert"];
    v5->_hasPlayedStartAlert = [v4 decodeBoolForKey:@"_hasPlayedStartAlert"];
    v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bargeInOptions"];
    v5->_bargeInOptions = [v40 unsignedIntegerValue];

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_speechSynthesisRecord"];
    speechSynthesisRecord = v5->_speechSynthesisRecord;
    v5->_speechSynthesisRecord = (AFSpeechSynthesisRecord *)v41;

    v5->_reloadSmartSiriVolume = [v4 decodeBoolForKey:@"_reloadSmartSiriVolume"];
    v5->_skipPersonalizedASR = [v4 decodeBoolForKey:@"_skipPersonalizedASR"];
    uint64_t v43 = [v4 decodePropertyListForKey:@"_clientAnalyticsContext"];
    clientAnalyticsContext = v5->_clientAnalyticsContext;
    v5->_clientAnalyticsContext = (NSDictionary *)v43;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v45 = v5->_clientAnalyticsContext;
      v5->_clientAnalyticsContext = 0;
    }
    uint64_t v46 = [v4 decodePropertyListForKey:@"_startContext"];
    startContext = v5->_startContext;
    v5->_startContext = (NSDictionary *)v46;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v48 = v5->_startContext;
      v5->_startContext = 0;
    }
    uint64_t v49 = [v4 decodePropertyListForKey:@"_stopContext"];
    stopContext = v5->_stopContext;
    v5->_stopContext = (NSDictionary *)v49;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v51 = v5->_stopContext;
      v5->_stopContext = 0;
    }
    v5->_isOnPhoneCall = [v4 decodeBoolForKey:@"_isOnPhoneCall"];
    v5->_isMediaPlaying = [v4 decodeBoolForKey:@"_isMediaPlaying"];
    [v4 decodeFloatForKey:@"_mediaPlaybackVolume"];
    v5->_mediaPlaybackVolume = v52;
    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_turnIdentifier"];
    turnIdentifier = v5->_turnIdentifier;
    v5->_turnIdentifier = (NSUUID *)v53;

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_languageDetectionUserContext"];
    languageDetectionUserContext = v5->_languageDetectionUserContext;
    v5->_languageDetectionUserContext = (AFLanguageDetectionUserContext *)v55;

    v5->_dictationInputOrigin = [v4 decodeIntegerForKey:@"_dictationInputOrigin"];
    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_applicationDisplayName"];
    applicationDisplayName = v5->_applicationDisplayName;
    v5->_applicationDisplayName = (NSString *)v57;

    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_applicationBundleIdentifier"];
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v59;

    v5->_presentationMode = [v4 decodeIntegerForKey:@"_presentationMode"];
    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_preheatLanguage"];
    preheatLanguage = v5->_preheatLanguage;
    v5->_preheatLanguage = (NSString *)v61;

    uint64_t v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_preheatTestModelPath"];
    preheatTestModelPath = v5->_preheatTestModelPath;
    v5->_preheatTestModelPath = (NSURL *)v63;

    v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dictationVoiceTriggerAbsStartSampleId"];
    v5->_dictationVoiceTriggerAbsStartSampleId = [v65 unsignedLongLongValue];

    uint64_t v66 = [v4 decodePropertyListForKey:@"_continuousConversationInfo"];
    continuousConversationInfo = v5->_continuousConversationInfo;
    v5->_continuousConversationInfo = (NSDictionary *)v66;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v68 = v5->_continuousConversationInfo;
      v5->_continuousConversationInfo = 0;
    }
    uint64_t v69 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_intuitiveConversationRequestId"];
    intuitiveConversationRequestId = v5->_intuitiveConversationRequestId;
    v5->_intuitiveConversationRequestId = (NSUUID *)v69;

    v5->_announcementPlatform = [v4 decodeIntegerForKey:@"_announcementPlatform"];
    v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_smartSiriVolumeTTSType"];
    v5->_smartSiriVolumeTTSType = [v71 unsignedIntegerValue];

    v5->_isTest = [v4 decodeBoolForKey:@"_isTest"];
    uint64_t v72 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_testRequestOptions"];
    testRequestOptions = v5->_testRequestOptions;
    v5->_testRequestOptions = (AFSpeechTestRequestOptions *)v72;

    v5->_isHeadphonesAuthenticated = [v4 decodeBoolForKey:@"_isHeadphonesAuthenticated"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t activationEvent = self->_activationEvent;
  id v12 = a3;
  [v12 encodeInteger:activationEvent forKey:@"_activationEvent"];
  [v12 encodeObject:self->_activationDeviceIdentifier forKey:@"_activationDeviceIdentifier"];
  [v12 encodeBool:self->_isEyesFree forKey:@"_isEyesFree"];
  [v12 encodeBool:self->_isSystemApertureEnabled forKey:@"_isSystemApertureEnabled"];
  [v12 encodeBool:self->_isLiveActivitiesSupported forKey:@"_isLiveActivitiesSupported"];
  [v12 encodeBool:self->_isInAmbient forKey:@"_isInAmbient"];
  [v12 encodeObject:self->_serverCommandId forKey:@"_serverCommandId"];
  [v12 encodeBool:self->_useAutomaticEndpointing forKey:@"_useAutomaticEndpointing"];
  [v12 encodeInteger:self->_endpointerOperationMode forKey:@"_endpointerOperationMode"];
  [v12 encodeObject:self->_recordingAlertPolicy forKey:@"_recordingAlertPolicy"];
  [v12 encodeBool:self->_disableInputAudioPowerUpdate forKey:@"_disableInputAudioPowerUpdate"];
  [v12 encodeBool:self->_disableOutputAudioPowerUpdate forKey:@"_disableOutputAudioPowerUpdate"];
  [v12 encodeBool:self->_useStreamingDictation forKey:@"_useStreamingDictation"];
  [v12 encodeDouble:@"_homeButtonDownEventTime" forKey:self->_homeButtonDownEventTime];
  double v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_homeButtonDownEventMachAbsoluteTime];
  [v12 encodeObject:v5 forKey:@"_homeButtonDownEventMachAbsoluteTime"];

  [v12 encodeDouble:@"_activationEventTime" forKey:self->_activationEventTime];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_activationEventMachAbsoluteTime];
  [v12 encodeObject:v6 forKey:@"_activationEventMachAbsoluteTime"];

  [v12 encodeDouble:@"_expectedActivationEventTime" forKey:self->_expectedActivationEventTime];
  v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_stopRecordingHostTime];
  [v12 encodeObject:v7 forKey:@"_stopRecordingHostTime"];

  [v12 encodeBool:self->_isInitialBringUp forKey:@"_isInitialBringUp"];
  [v12 encodeObject:self->_homeButtonUpFromBeep forKey:@"_homeButtonUpFromBeep"];
  [v12 encodeBool:self->_acousticIdEnabled forKey:@"_acousticIdEnabled"];
  [v12 encodeInteger:self->_audioFileType forKey:@"_audioFileType"];
  [v12 encodeObject:self->_audioFileHandle forKey:@"_audioFileHandle"];
  [v12 encodeObject:self->_voiceTriggerEventInfo forKey:@"_voiceTriggerEventInfo"];
  [v12 encodeObject:self->_raiseToSpeakEventInfo forKey:@"_raiseToSpeakEventInfo"];
  [v12 encodeObject:self->_myriadContext forKey:@"_myriadContext"];
  [v12 encodeObject:self->_scdaContext forKey:@"_scdaContext"];
  [v12 encodeBool:self->_releaseAudioSessionOnRecordingCompletion forKey:@"_releaseAudioSessionOnRecordingCompletion"];
  [v12 encodeObject:self->_recordDeviceIdentifier forKey:@"_recordDeviceIdentifier"];
  [v12 encodeObject:self->_speechRecordingEventListeningEndpoint forKey:@"_speechRecordingEventListeningEndpoint"];
  [v12 encodeBool:self->_usePrelisteningMode forKey:@"_usePrelisteningMode"];
  [v12 encodeBool:self->_pendCallbacksUntilAfterContinuation forKey:@"_pendCallbacksUntilAfterContinuation"];
  [v12 encodeBool:self->_useBorealisBuffer forKey:@"_useBorealisBuffer"];
  [v12 encodeObject:self->_notifyState forKey:@"_notifyState"];
  [v12 encodeObject:self->_audioFileURL forKey:@"_audioFileURL"];
  [v12 encodeBool:self->_suppressStartAlert forKey:@"_suppressStartAlert"];
  [v12 encodeBool:self->_suppressStopAlert forKey:@"_suppressStopAlert"];
  [v12 encodeBool:self->_hasPlayedStartAlert forKey:@"_hasPlayedStartAlert"];
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_bargeInOptions];
  [v12 encodeObject:v8 forKey:@"_bargeInOptions"];

  [v12 encodeObject:self->_speechSynthesisRecord forKey:@"_speechSynthesisRecord"];
  [v12 encodeBool:self->_reloadSmartSiriVolume forKey:@"_reloadSmartSiriVolume"];
  [v12 encodeBool:self->_skipPersonalizedASR forKey:@"_skipPersonalizedASR"];
  [v12 encodeObject:self->_clientAnalyticsContext forKey:@"_clientAnalyticsContext"];
  [v12 encodeObject:self->_startContext forKey:@"_startContext"];
  [v12 encodeObject:self->_stopContext forKey:@"_stopContext"];
  [v12 encodeBool:self->_isOnPhoneCall forKey:@"_isOnPhoneCall"];
  [v12 encodeBool:self->_isMediaPlaying forKey:@"_isMediaPlaying"];
  *(float *)&double v9 = self->_mediaPlaybackVolume;
  [v12 encodeFloat:@"_mediaPlaybackVolume" forKey:v9];
  [v12 encodeObject:self->_turnIdentifier forKey:@"_turnIdentifier"];
  [v12 encodeObject:self->_languageDetectionUserContext forKey:@"_languageDetectionUserContext"];
  [v12 encodeInteger:self->_dictationInputOrigin forKey:@"_dictationInputOrigin"];
  [v12 encodeObject:self->_applicationDisplayName forKey:@"_applicationDisplayName"];
  [v12 encodeObject:self->_applicationBundleIdentifier forKey:@"_applicationBundleIdentifier"];
  [v12 encodeInteger:self->_presentationMode forKey:@"_presentationMode"];
  [v12 encodeObject:self->_preheatLanguage forKey:@"_preheatLanguage"];
  [v12 encodeObject:self->_preheatTestModelPath forKey:@"_preheatTestModelPath"];
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_dictationVoiceTriggerAbsStartSampleId];
  [v12 encodeObject:v10 forKey:@"_dictationVoiceTriggerAbsStartSampleId"];

  [v12 encodeObject:self->_continuousConversationInfo forKey:@"_continuousConversationInfo"];
  [v12 encodeObject:self->_intuitiveConversationRequestId forKey:@"_intuitiveConversationRequestId"];
  [v12 encodeInteger:self->_announcementPlatform forKey:@"_announcementPlatform"];
  v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_smartSiriVolumeTTSType];
  [v12 encodeObject:v11 forKey:@"_smartSiriVolumeTTSType"];

  [v12 encodeBool:self->_isTest forKey:@"_isTest"];
  [v12 encodeObject:self->_testRequestOptions forKey:@"_testRequestOptions"];
  [v12 encodeBool:self->_isHeadphonesAuthenticated forKey:@"_isHeadphonesAuthenticated"];
}

- (id)description
{
  if (self->_audioFileURL)
  {
    uint64_t v3 = [[NSString alloc] initWithFormat:@"audioFileURL = %@", self->_audioFileURL];
LABEL_3:
    id v4 = (void *)v3;
    goto LABEL_11;
  }
  if (self->_endpointerOperationMode)
  {
    id v5 = [NSString alloc];
    unint64_t endpointerOperationMode = self->_endpointerOperationMode;
    if (endpointerOperationMode > 4) {
      v7 = @"(unknown)";
    }
    else {
      v7 = off_1E5925E18[endpointerOperationMode];
    }
    uint64_t v8 = v7;
    id v4 = (void *)[v5 initWithFormat:@"endpointerOperationMode = %@", v8];
  }
  else
  {
    if (self->_useAutomaticEndpointing)
    {
      uint64_t v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"useAutomaticEndpointing = %d", self->_useAutomaticEndpointing);
      goto LABEL_3;
    }
    id v4 = 0;
  }
LABEL_11:
  id v9 = [NSString alloc];
  v22.receiver = self;
  v22.super_class = (Class)AFSpeechRequestOptions;
  uint64_t v10 = [(AFSpeechRequestOptions *)&v22 description];
  unint64_t activationEvent = self->_activationEvent;
  if (activationEvent > 0x24) {
    id v12 = @"Unknown";
  }
  else {
    id v12 = off_1E5925980[activationEvent];
  }
  v13 = v12;
  turnIdentifier = self->_turnIdentifier;
  int64_t presentationMode = self->_presentationMode;
  activationDeviceIdentifier = self->_activationDeviceIdentifier;
  double activationEventTime = self->_activationEventTime;
  unint64_t activationEventMachAbsoluteTime = self->_activationEventMachAbsoluteTime;
  if ([v4 length])
  {
    v19 = (void *)[[NSString alloc] initWithFormat:@" %@", v4];
    uint64_t v20 = (void *)[v9 initWithFormat:@"%@, {event = %ld (%@), presentationMode = %ld, turnId = %@, deviceIdentifier = %@, time = %f, hostTime = %llu%@}", v10, activationEvent, v13, presentationMode, turnIdentifier, activationDeviceIdentifier, *(void *)&activationEventTime, activationEventMachAbsoluteTime, v19];
  }
  else
  {
    uint64_t v20 = (void *)[v9 initWithFormat:@"%@, {event = %ld (%@), presentationMode = %ld, turnId = %@, deviceIdentifier = %@, time = %f, hostTime = %llu%@}", v10, activationEvent, v13, presentationMode, turnIdentifier, activationDeviceIdentifier, *(void *)&activationEventTime, activationEventMachAbsoluteTime, &stru_1EEE35D28];
  }

  return v20;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isLiveActivitiesSupported
{
  return self->_isLiveActivitiesSupported;
}

- (BOOL)isSystemApertureEnabled
{
  return self->_isSystemApertureEnabled;
}

- (BOOL)isRaiseToSpeak
{
  return self->_activationEvent == 13;
}

- (BOOL)isVoiceTrigger
{
  return (self->_activationEvent < 0x20uLL) & (0x80018900 >> self->_activationEvent);
}

- (id)initForTestWithTestRequestOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSpeechRequestOptions;
  uint64_t v6 = [(AFSpeechRequestOptions *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_isTest = 1;
    objc_storeStrong((id *)&v6->_testRequestOptions, a3);
  }

  return v7;
}

- (AFSpeechRequestOptions)initWithActivationEvent:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFSpeechRequestOptions;
  result = [(AFSpeechRequestOptions *)&v5 init];
  if (result) {
    result->_unint64_t activationEvent = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end