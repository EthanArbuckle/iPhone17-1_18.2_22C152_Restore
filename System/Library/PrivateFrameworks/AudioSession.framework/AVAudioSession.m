@interface AVAudioSession
+ (AVAudioSession)sharedInstance;
+ (BOOL)categoryEnablesInput:(id)a3;
+ (id)auxiliarySession;
+ (id)primarySession;
+ (id)retrieveSessionWithID:(unsigned int)a3;
- (AVAudioSession)autorelease;
- (AVAudioSession)init;
- (AVAudioSession)initWithIsolatedAudioUseCaseID:(unsigned int)a3;
- (AVAudioSession)initWithSessionID:(unsigned int)a3;
- (AVAudioSession)initWithSessionType:(unint64_t)a3;
- (AVAudioSession)initWithSiriEndpointIdentifier:(id)a3;
- (AVAudioSession)initWithSpecification:(id)a3;
- (AVAudioSession)retain;
- (AVAudioSessionCategory)category;
- (AVAudioSessionCategoryOptions)categoryOptions;
- (AVAudioSessionDataSourceDescription)inputDataSource;
- (AVAudioSessionDataSourceDescription)outputDataSource;
- (AVAudioSessionImplAtomic)atomicImpl;
- (AVAudioSessionMode)mode;
- (AVAudioSessionPortDescription)preferredInput;
- (AVAudioSessionPromptStyle)promptStyle;
- (AVAudioSessionRecordPermission)recordPermission;
- (AVAudioSessionRouteDescription)currentRoute;
- (AVAudioSessionRouteSharingPolicy)routeSharingPolicy;
- (AVAudioStereoOrientation)inputOrientation;
- (AVAudioStereoOrientation)preferredInputOrientation;
- (BOOL)allowAllBuiltInDataSources;
- (BOOL)allowHapticsAndSystemSoundsDuringRecording;
- (BOOL)allowMixableAudioWhileRecording;
- (BOOL)allowsSpeakerPlayback;
- (BOOL)clearInputPreferences:(id *)a3;
- (BOOL)deactivateAndSetInterruptionPriority:(int64_t)a3 error:(id *)a4;
- (BOOL)decoupledIO;
- (BOOL)eligibleForBTSmartRoutingConsideration;
- (BOOL)eligibleForBTTriangleConsideration;
- (BOOL)enableNotifications:(BOOL)a3 error:(id *)a4;
- (BOOL)fixHardwareFormatToMultiChannel:(BOOL)a3 error:(id *)a4;
- (BOOL)forceSoundCheck;
- (BOOL)getInputAvailable;
- (BOOL)handleRemoteInterruption:(id)a3 postInterruptionNotification:(BOOL)a4 error:(id *)a5;
- (BOOL)iAmTheAssistant;
- (BOOL)inhibitSpeechDetection;
- (BOOL)isActive;
- (BOOL)isDolbyAtmosAvailable;
- (BOOL)isDolbyDigitalEncoderAvailable;
- (BOOL)isEarpieceActiveNoiseCancelationEnabled;
- (BOOL)isEchoCancelledInputAvailable;
- (BOOL)isEchoCancelledInputEnabled;
- (BOOL)isExpanseMediaSession;
- (BOOL)isHardwareFormatFixedToMultiChannel;
- (BOOL)isInputAvailable;
- (BOOL)isInputGainSettable;
- (BOOL)isMicrophoneInjectionAvailable;
- (BOOL)isMicrophoneInjectionServiceEnabledByUser;
- (BOOL)isOtherAudioPlaying;
- (BOOL)isPiPAvailable;
- (BOOL)isPrimary;
- (BOOL)isPropertyCached:(id)a3;
- (BOOL)isRelatedSession:(id)a3;
- (BOOL)isRelatedSessionID:(unsigned int)a3;
- (BOOL)isSessionInputMuted;
- (BOOL)lastActivationStoppedNowPlayingApp;
- (BOOL)muteSessionInput:(BOOL)a3 error:(id *)a4;
- (BOOL)needsHighPowerBudgeting;
- (BOOL)overrideOutputAudioPort:(AVAudioSessionPortOverride)portOverride error:(NSError *)outError;
- (BOOL)participatesInMutePriority;
- (BOOL)participatesInNowPlayingAppPolicy;
- (BOOL)participatesInVolumePolicy;
- (BOOL)preferDecoupledIO:(BOOL)a3 error:(id *)a4;
- (BOOL)prefersAggressiveCaching;
- (BOOL)prefersConcurrentAirPlayAudio;
- (BOOL)prefersEchoCancelledInput;
- (BOOL)prefersInterruptionOnRouteDisconnect;
- (BOOL)prefersMultichannelAudio;
- (BOOL)prefersNoDucking;
- (BOOL)prefersNoInterruptionsFromSystemAlerts;
- (BOOL)prefersNoMicrophoneUsageIndicator;
- (BOOL)prefersToAcquireHWControlFromOtherSessions;
- (BOOL)prefersToVibeWhenVibrationsAreDisabled;
- (BOOL)privateCreateSessionInServerUsingXPC:(void *)a3;
- (BOOL)privateGetInputAvailable:(const void *)a3;
- (BOOL)privateHandleWatchOSActivationAfterRoutePickerSelection:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5 accessor:(const void *)a6;
- (BOOL)privateIsActive:(const void *)a3;
- (BOOL)privateNeedsTranslationForNoSpeakerCategory:(id)a3 accessor:(const void *)a4;
- (BOOL)privateRecreateSessionInServerUsingXPC;
- (BOOL)privateRequiresWatchOSRoutePicker:(unint64_t)a3 accessor:(const void *)a4;
- (BOOL)privateSetActive:(BOOL)a3 withOptions:(unint64_t)a4 error:(id *)a5 accessor:(const void *)a6;
- (BOOL)privateSetPrefersInterruptionOnRouteDisconnect:(BOOL)a3 accessor:(const void *)a4;
- (BOOL)privateSetRouteSharingPolicy:(unint64_t)a3 error:(id *)a4;
- (BOOL)recordingFromRemoteInput;
- (BOOL)requiresNoAudioResources;
- (BOOL)secondaryAudioShouldBeSilencedHint;
- (BOOL)selectIndependentRoutingContext:(id *)a3;
- (BOOL)setActivationContext:(id)a3 error:(id *)a4;
- (BOOL)setActive:(BOOL)active error:(NSError *)outError;
- (BOOL)setActive:(BOOL)active withOptions:(AVAudioSessionSetActiveOptions)options error:(NSError *)outError;
- (BOOL)setAggregatedIOPreference:(AVAudioSessionIOType)inIOType error:(NSError *)outError;
- (BOOL)setAllowHapticsAndSystemSoundsDuringRecording:(BOOL)inValue error:(NSError *)outError;
- (BOOL)setAllowMixableAudioWhileRecording:(BOOL)a3 error:(id *)a4;
- (BOOL)setAudioClockDevice:(id)a3 error:(id *)a4;
- (BOOL)setAudioHardwareControlFlags:(unint64_t)a3 error:(id *)a4;
- (BOOL)setAuditTokensForProcessAssertion:(id)a3 error:(id *)a4;
- (BOOL)setBypassRingerSwitchPolicy:(BOOL)a3 error:(id *)a4;
- (BOOL)setCategory:(AVAudioSessionCategory)category error:(NSError *)outError;
- (BOOL)setCategory:(AVAudioSessionCategory)category mode:(AVAudioSessionMode)mode options:(AVAudioSessionCategoryOptions)options error:(NSError *)outError;
- (BOOL)setCategory:(AVAudioSessionCategory)category mode:(AVAudioSessionMode)mode routeSharingPolicy:(AVAudioSessionRouteSharingPolicy)policy options:(AVAudioSessionCategoryOptions)options error:(NSError *)outError;
- (BOOL)setCategory:(AVAudioSessionCategory)category withOptions:(AVAudioSessionCategoryOptions)options error:(NSError *)outError;
- (BOOL)setCategoryOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)setDefaultChatMode:(id)a3 error:(id *)a4;
- (BOOL)setDisallowedPorts:(id)a3 error:(id *)a4;
- (BOOL)setDuckToLevelDB:(id)a3 error:(id *)a4;
- (BOOL)setDuckToLevelScalar:(id)a3 error:(id *)a4;
- (BOOL)setDuckToLevelScalar:(id)a3 unduckToLevelScalar:(id)a4 error:(id *)a5;
- (BOOL)setDuckingFadeOutDuration:(id)a3 fadeInDuration:(id)a4 error:(id *)a5;
- (BOOL)setEligibleForBTSmartRoutingConsideration:(BOOL)a3 error:(id *)a4;
- (BOOL)setEligibleForBTTriangleConsideration:(BOOL)a3 error:(id *)a4;
- (BOOL)setForceSoundCheck:(BOOL)a3 error:(id *)a4;
- (BOOL)setHapticThermalGain:(float)a3 error:(id *)a4;
- (BOOL)setHostProcessAttribution:(id)a3 error:(id *)a4;
- (BOOL)setIAmTheAssistant:(BOOL)a3 error:(id *)a4;
- (BOOL)setInhibitSpeechDetection:(BOOL)a3 error:(id *)a4;
- (BOOL)setInputDataSource:(AVAudioSessionDataSourceDescription *)dataSource error:(NSError *)outError;
- (BOOL)setInputGain:(float)gain error:(NSError *)outError;
- (BOOL)setInterruptionFadeDuration:(id)a3 error:(id *)a4;
- (BOOL)setInterruptionPriority:(int64_t)a3 error:(id *)a4;
- (BOOL)setIsExpanseMediaSession:(BOOL)a3 error:(id *)a4;
- (BOOL)setMXProperties:(id)a3 propertyErrors:(id *)a4;
- (BOOL)setMXSessionProperty:(id)a3 value:(id)a4 error:(id *)a5;
- (BOOL)setMode:(AVAudioSessionMode)mode error:(NSError *)outError;
- (BOOL)setNeedsHighPowerBudgeting:(BOOL)a3 error:(id *)a4;
- (BOOL)setOutputDataSource:(AVAudioSessionDataSourceDescription *)dataSource error:(NSError *)outError;
- (BOOL)setParticipatesInMutePriority:(BOOL)a3 error:(id *)a4;
- (BOOL)setParticipatesInNowPlayingAppPolicy:(BOOL)a3 error:(id *)a4;
- (BOOL)setParticipatesInVolumePolicy:(BOOL)a3 error:(id *)a4;
- (BOOL)setPowerProfile:(id)a3 error:(id *)a4;
- (BOOL)setPreferredAudioFormat:(int64_t)a3 error:(id *)a4;
- (BOOL)setPreferredIOBufferDuration:(NSTimeInterval)duration error:(NSError *)outError;
- (BOOL)setPreferredIOBufferFrameSize:(unint64_t)a3 error:(id *)a4;
- (BOOL)setPreferredInput:(AVAudioSessionPortDescription *)inPort error:(NSError *)outError;
- (BOOL)setPreferredInputNumberOfChannels:(NSInteger)count error:(NSError *)outError;
- (BOOL)setPreferredInputOrientation:(AVAudioStereoOrientation)orientation error:(NSError *)outError;
- (BOOL)setPreferredInputSampleRate:(double)a3 error:(id *)a4;
- (BOOL)setPreferredMicrophoneInjectionMode:(int64_t)a3 error:(id *)a4;
- (BOOL)setPreferredOutputNumberOfChannels:(NSInteger)count error:(NSError *)outError;
- (BOOL)setPreferredOutputSampleRate:(double)a3 error:(id *)a4;
- (BOOL)setPreferredPersistentInputUIDs:(id)a3 outputUIDs:(id)a4 error:(id *)a5;
- (BOOL)setPreferredRouteControlConfig:(id)a3 error:(id *)a4;
- (BOOL)setPreferredSampleRate:(double)sampleRate error:(NSError *)outError;
- (BOOL)setPrefersAggressiveCaching:(BOOL)a3 error:(id *)a4;
- (BOOL)setPrefersConcurrentAirPlayAudio:(BOOL)a3 error:(id *)a4;
- (BOOL)setPrefersEchoCancelledInput:(BOOL)a3 error:(id *)a4;
- (BOOL)setPrefersInterruptionOnRouteDisconnect:(BOOL)inValue error:(NSError *)outError;
- (BOOL)setPrefersMultichannelAudio:(BOOL)a3 error:(id *)a4;
- (BOOL)setPrefersNoDucking:(BOOL)a3 error:(id *)a4;
- (BOOL)setPrefersNoInterruptionsFromSystemAlerts:(BOOL)inValue error:(NSError *)outError;
- (BOOL)setPrefersNoMicrophoneUsageIndicator:(BOOL)a3 error:(id *)a4;
- (BOOL)setPrefersToAcquireHWControlFromOtherSessions:(BOOL)a3 error:(id *)a4;
- (BOOL)setPrefersToVibeWhenVibrationsAreDisabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setRecordingFromRemoteInput:(BOOL)a3 error:(id *)a4;
- (BOOL)setReporterID:(int64_t)a3 error:(id *)a4;
- (BOOL)setRequiresNoAudioResources:(BOOL)a3 error:(id *)a4;
- (BOOL)setRoutingContextUID:(id)a3 error:(id *)a4;
- (BOOL)setSpeakerThermalGain:(float)a3 error:(id *)a4;
- (BOOL)setSupportsMultichannelContent:(BOOL)inValue error:(NSError *)outError;
- (BOOL)silenceOutput:(unint64_t)a3 error:(id *)a4;
- (BOOL)subscribeToNotifications:(id)a3 error:(id *)a4;
- (BOOL)supportsMultichannelContent;
- (NSArray)availableCategories;
- (NSArray)availableModes;
- (NSArray)inputDataSources;
- (NSArray)outputDataSources;
- (NSInteger)inputNumberOfChannels;
- (NSInteger)maximumInputNumberOfChannels;
- (NSInteger)maximumOutputNumberOfChannels;
- (NSInteger)outputNumberOfChannels;
- (NSInteger)preferredInputNumberOfChannels;
- (NSInteger)preferredOutputNumberOfChannels;
- (NSTimeInterval)IOBufferDuration;
- (NSTimeInterval)inputLatency;
- (NSTimeInterval)outputLatency;
- (NSTimeInterval)preferredIOBufferDuration;
- (double)inputSafetyOffset;
- (double)inputSampleRate;
- (double)outputSafetyOffset;
- (double)outputSampleRate;
- (double)preferredInputSampleRate;
- (double)preferredOutputSampleRate;
- (double)preferredSampleRate;
- (double)sampleRate;
- (double)siriSpeechDetectionDeviceSampleRate;
- (double)speechDetectionDeviceSampleRate;
- (float)defaultCalibratedOutputSPL;
- (float)hapticThermalGain;
- (float)inputGain;
- (float)outputVolume;
- (float)speakerThermalGain;
- (id)IOController;
- (id)activeAudioRoute;
- (id)activeSessionDisplayIDs;
- (id)addObserverForType:(unint64_t)a3 name:(id)a4 block:(id)a5;
- (id)audioClockDevice;
- (id)audioFormats;
- (id)auditTokensForProcessAssertion;
- (id)cachedPropertyValue:(id)a3;
- (id)consolidatedSourceContentInfo;
- (id)decoupledInputIOController;
- (id)defaultChatMode;
- (id)delegate;
- (id)getMXProperties:(id)a3 propertyErrors:(id *)a4;
- (id)getMXSessionProperty:(id)a3 error:(id *)a4;
- (id)getNotificationQueue;
- (id)hostProcessAttribution;
- (id)initAuxiliarySession;
- (id)initSiblingSession:(unsigned int)a3 auditToken:(id *)a4 clientIdentifier:(id)a5;
- (id)initSiblingSession:(unsigned int)a3 auditToken:(id *)a4 clientIdentifier:(id)a5 autoReconnect:(BOOL)a6;
- (id)inputTimeObserver;
- (id)outputTimeObserver;
- (id)pickedRoute;
- (id)powerBudget;
- (id)powerProfile;
- (id)preferredPersistentInputUIDs;
- (id)preferredPersistentOutputUIDs;
- (id)preferredRouteControlConfig;
- (id)privateCreateSessionInServerUsingXPC:;
- (id)privateGetCategory:(const void *)a3;
- (id)privateGetCurrentRoute:(const void *)a3;
- (id)privateGetDataSources:(BOOL)a3 accessor:(const void *)a4;
- (id)privateGetDataSources:accessor:;
- (id)privateGetRouteControlConfigWithDictionaryKey:(id)a3 withFeaturesKey:(id)a4;
- (id)privateGetSelectedDataSource:(BOOL)a3 accessor:(const void *)a4;
- (id)privateMakePreferredPersistentRouteDictWithInputUIDs:(id)a3 outputUIDs:(id)a4;
- (id)privateReadPreferredPersistentRoute;
- (id)privateRefreshAvailableInputs;
- (id)privateRefreshAvailableOutputs;
- (id)routeControlConfig;
- (id)routingContextUID;
- (id)sampleRate;
- (id)spatialPreferences;
- (id)spatialPreferences:(int64_t)a3;
- (id)supportedOutputChannelLayouts;
- (int)privateSetCategoryWithOptions:(id)a3 modes:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6 accessor:(const void *)a7;
- (int64_t)audioFormat;
- (int64_t)getCachedOrFromServerReporterID:(const void *)a3;
- (int64_t)interruptionPriority;
- (int64_t)preferredAudioFormat;
- (int64_t)preferredMicrophoneInjectionMode;
- (int64_t)renderingMode;
- (int64_t)reporterID;
- (shared_ptr<const)accessor;
- (sync_guard<AVAudioSessionImpl,)privateGetGuardOfImplementation;
- (uint64_t)audioFormats;
- (uint64_t)inputGain;
- (uint64_t)inputNumberOfChannels;
- (uint64_t)inputSampleRate;
- (uint64_t)isInputAvailable;
- (uint64_t)isPiPAvailable;
- (uint64_t)outputNumberOfChannels;
- (uint64_t)outputSampleRate;
- (uint64_t)outputVolume;
- (uint64_t)privateCreateSessionInServerUsingXPC:;
- (uint64_t)privateGetDataSources:accessor:;
- (uint64_t)promptStyle;
- (uint64_t)sampleRate;
- (uint64_t)speechDetectionStyle;
- (unint64_t)IOBufferFrameSize;
- (unint64_t)availableRouteControlOptions:(id *)a3;
- (unint64_t)preferredIOBufferFrameSize;
- (unint64_t)privateGetRouteSharingPolicy:(const void *)a3;
- (unint64_t)retainCount;
- (unint64_t)sessionType;
- (unint64_t)speechDetectionStyle;
- (unsigned)opaqueSessionID;
- (unsigned)privateGetSessionID;
- (unsigned)privateShouldSubscribeToMicrophoneInjectionCapabilityChangeNotification;
- (unsigned)sourceSessionID;
- (void)activateWithOptions:(AVAudioSessionActivationOptions)options completionHandler:(void *)handler;
- (void)addCategoryOptionsToDictionary:(id)a3 category:(id)a4 options:(unint64_t)a5;
- (void)addToCache:(id)a3 value:(id)a4;
- (void)audioFormats;
- (void)dealloc;
- (void)handleDeferredMessage:(id)a3 userInfo:(id)a4;
- (void)handleMediaDaemonTerminationEvent:(int)a3 daemonName:(id)a4;
- (void)inputGain;
- (void)inputNumberOfChannels;
- (void)inputSampleRate;
- (void)invalidateCache;
- (void)isInputAvailable;
- (void)isPiPAvailable;
- (void)outputNumberOfChannels;
- (void)outputSampleRate;
- (void)outputVolume;
- (void)privateCreateSessionInServerUsingXPC:;
- (void)privateDispatchPing:(const void *)a3;
- (void)privateGetDataSources:accessor:;
- (void)privateHandleAVOutputContextOutputDeviceChange:(id)a3;
- (void)privateHandleAVOutputContextOutputDevicesChange:(id)a3;
- (void)privateHandleActiveNeroVisualStreamInfoDidChange;
- (void)privateHandleAudioHardwareFormatChange;
- (void)privateHandleAvailableSampleRatesChange:(const void *)a3;
- (void)privateHandleBadgeTypeChange:(id)a3;
- (void)privateHandleBeaconBudgetChange:(id)a3 accessor:(const void *)a4;
- (void)privateHandleCurrentInputDeviceBufferSizeDidChange;
- (void)privateHandleCurrentInputSampleRateDidChange;
- (void)privateHandleCurrentOutputDeviceBufferSizeDidChange;
- (void)privateHandleCurrentOutputSampleRateDidChange;
- (void)privateHandleMicrophoneInjectionCapabilityChange:(id)a3 accessor:(const void *)a4;
- (void)privateHandleOtherPrimaryAudioPlayStateChange:(const void *)a3;
- (void)privateHandlePickableRoutesChange:(const void *)a3;
- (void)privateHandlePing;
- (void)privateHandlePrefersConcurrentAirPlayAudioChange:(id)a3 accessor:(const void *)a4;
- (void)privateHandleRenderingCapabilitiesChange:(const void *)a3;
- (void)privateHandleRouteControlFeaturesChange:(id)a3 accessor:(const void *)a4;
- (void)privateHandleRoutingContextChange:(const void *)a3;
- (void)privateHandleSecondaryAudioHintChange:(id)a3 accessor:(const void *)a4;
- (void)privateInputIsAvailableChanged:(BOOL)a3;
- (void)privateInputMuteWithInfo:(id)a3 accessor:(const void *)a4;
- (void)privateInterruptionWithInfo:(id)a3 accessor:(const void *)a4;
- (void)privatePostNotificationForType:(unint64_t)a3 name:(id)a4 userInfo:(id)a5 accessor:(const void *)a6;
- (void)privateResetCachedPropertyValues:(const void *)a3;
- (void)privateSubscribeToMicrophoneInjectionCapabilityChangeNotification;
- (void)privateUpdateAudioFormat:(id)a3;
- (void)privateUpdateAudioFormats:(id)a3;
- (void)privateUpdateInputAvailable;
- (void)privateUpdateInputChannelCount:(id)a3;
- (void)privateUpdateInputGain:(id)a3;
- (void)privateUpdateOutputChannelCount:(id)a3;
- (void)privateUpdateOutputVolume:(id)a3;
- (void)privateUpdatePiPAvailabilityChange:(id)a3;
- (void)privateUpdatePromptStyle:(id)a3;
- (void)privateUpdateReporterIDs:(id)a3;
- (void)privateUpdateSpeechDetectionStyle:(id)a3;
- (void)promptStyle;
- (void)registerPublishingSessionNotifications:(id)a3;
- (void)release;
- (void)removeObserverForType:(unint64_t)a3 observer:(id)a4 name:(id)a5;
- (void)requestRecordPermission:(void *)response;
- (void)sampleRate;
- (void)setAllowAllBuiltInDataSources:(BOOL)a3;
- (void)setDelegate:(id)delegate;
- (void)speechDetectionStyle;
@end

@implementation AVAudioSession

void __66__AVAudioSession_ClientCommonImplementation__privateDispatchPing___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained privateHandlePing];
  }
}

- (void)handleDeferredMessage:(id)a3 userInfo:(id)a4
{
  v6 = (NSString *)a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  [(AVAudioSession *)self accessor];
  {
    as::ClientSideCachingEnabled(void)::enabled = _os_feature_enabled_impl();
  }
  if (as::ClientSideCachingEnabled(void)::enabled) {
    as::client::cache_util::CacheManager::checkAndRefreshCacheForNotification(v53[9], self, v6);
  }
  v8 = v53[5];
  os_unfair_lock_lock(v8);
  as::client::NotificationStateManager::GetNotificationStateForType((uint64_t)&v8[2], 2uLL, 0, &v51);
  if (v8) {
    os_unfair_lock_unlock(v8);
  }
  if (v51)
  {
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    }
    v10 = v9;
    [(AVAudioSession *)self privatePostNotificationForType:2 name:v6 userInfo:v9 accessor:&v53];
  }
  if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75E18]])
  {
    [(AVAudioSession *)self privateHandleRoutingContextChange:&v53];
    goto LABEL_59;
  }
  if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F76980]])
  {
    [(AVAudioSession *)self privateHandleActiveNeroVisualStreamInfoDidChange];
    goto LABEL_59;
  }
  if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75D78]])
  {
    [(AVAudioSession *)self privateHandleCurrentInputDeviceBufferSizeDidChange];
    goto LABEL_59;
  }
  if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75D88]])
  {
    [(AVAudioSession *)self privateHandleCurrentOutputDeviceBufferSizeDidChange];
    goto LABEL_59;
  }
  if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75D80]])
  {
    [(AVAudioSession *)self privateHandleCurrentInputSampleRateDidChange];
    goto LABEL_59;
  }
  if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75D90]])
  {
    [(AVAudioSession *)self privateHandleCurrentOutputSampleRateDidChange];
    goto LABEL_59;
  }
  if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75D20]])
  {
    goto LABEL_59;
  }
  if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F4EA78]])
  {
    goto LABEL_59;
  }
  if (![(NSString *)v6 isEqualToString:*MEMORY[0x1E4F4EA30]])
  {
    if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F769F0]])
    {
      v12 = [v7 objectForKey:*MEMORY[0x1E4F76950]];
      [(AVAudioSession *)self privateHandleSecondaryAudioHintChange:v12 accessor:&v53];

      goto LABEL_59;
    }
    if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75E20]])
    {
      [(AVAudioSession *)self privateHandleOtherPrimaryAudioPlayStateChange:&v53];
      goto LABEL_59;
    }
    if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75DF8]])
    {
      [(AVAudioSession *)self privateHandlePickableRoutesChange:&v53];
      goto LABEL_59;
    }
    if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75D68]])
    {
      [(AVAudioSession *)self privateHandleAvailableSampleRatesChange:&v53];
      goto LABEL_59;
    }
    if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75DD8]])
    {
      [(AVAudioSession *)self privateHandleBeaconBudgetChange:v7 accessor:&v53];
      goto LABEL_59;
    }
    if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75E00]])
    {
      [(AVAudioSession *)self privateHandlePrefersConcurrentAirPlayAudioChange:v7 accessor:&v53];
      goto LABEL_59;
    }
    if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75E30]])
    {
      [(AVAudioSession *)self privateHandleRenderingCapabilitiesChange:&v53];
      goto LABEL_59;
    }
    if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75E10]])
    {
      [(AVAudioSession *)self privateHandleRouteControlFeaturesChange:v7 accessor:&v53];
      goto LABEL_59;
    }
    if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F4EA68]])
    {
      [(AVAudioSession *)self privateHandleMicrophoneInjectionCapabilityChange:v7 accessor:&v53];
      goto LABEL_59;
    }
    if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75DA0]])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke;
      block[3] = &unk_1E5A82808;
      v13 = &v50;
      objc_copyWeak(&v50, &location);
      id v49 = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);
      v14 = v49;
    }
    else if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75E08]])
    {
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_2;
      v45[3] = &unk_1E5A82808;
      v13 = &v47;
      objc_copyWeak(&v47, &location);
      id v46 = v7;
      dispatch_async(MEMORY[0x1E4F14428], v45);
      v14 = v46;
    }
    else if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75E28]])
    {
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_3;
      v42[3] = &unk_1E5A82808;
      v13 = &v44;
      objc_copyWeak(&v44, &location);
      id v43 = v7;
      dispatch_async(MEMORY[0x1E4F14428], v42);
      v14 = v43;
    }
    else
    {
      if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75E38]])
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_4;
        v40[3] = &unk_1E5A82830;
        v13 = &v41;
        objc_copyWeak(&v41, &location);
        dispatch_async(MEMORY[0x1E4F14428], v40);
        goto LABEL_58;
      }
      if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F76A10]])
      {
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_5;
        v37[3] = &unk_1E5A82808;
        v13 = &v39;
        objc_copyWeak(&v39, &location);
        id v38 = v7;
        dispatch_async(MEMORY[0x1E4F14428], v37);
        v14 = v38;
      }
      else if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75D60]])
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_6;
        v34[3] = &unk_1E5A82808;
        v13 = &v36;
        objc_copyWeak(&v36, &location);
        id v35 = v7;
        dispatch_async(MEMORY[0x1E4F14428], v34);
        v14 = v35;
      }
      else
      {
        if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75D58]])
        {
          [(AVAudioSession *)self privateHandleAudioHardwareFormatChange];
          goto LABEL_59;
        }
        if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75E40]])
        {
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_7;
          v31[3] = &unk_1E5A82808;
          v13 = &v33;
          objc_copyWeak(&v33, &location);
          id v32 = v7;
          dispatch_async(MEMORY[0x1E4F14428], v31);
          v14 = v32;
        }
        else if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75DF0]])
        {
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_8;
          v28[3] = &unk_1E5A82808;
          v13 = &v30;
          objc_copyWeak(&v30, &location);
          id v29 = v7;
          dispatch_async(MEMORY[0x1E4F14428], v28);
          v14 = v29;
        }
        else if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75DE0]])
        {
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_9;
          v25[3] = &unk_1E5A82808;
          v13 = &v27;
          objc_copyWeak(&v27, &location);
          id v26 = v7;
          dispatch_async(MEMORY[0x1E4F14428], v25);
          v14 = v26;
        }
        else if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75DE8]])
        {
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_10;
          v22[3] = &unk_1E5A82808;
          v13 = &v24;
          objc_copyWeak(&v24, &location);
          id v23 = v7;
          dispatch_async(MEMORY[0x1E4F14428], v22);
          v14 = v23;
        }
        else if ([(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75D70]])
        {
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_11;
          v19[3] = &unk_1E5A82808;
          v13 = &v21;
          objc_copyWeak(&v21, &location);
          id v20 = v7;
          dispatch_async(MEMORY[0x1E4F14428], v19);
          v14 = v20;
        }
        else
        {
          if (![(NSString *)v6 isEqualToString:*MEMORY[0x1E4F75DC8]]) {
            goto LABEL_59;
          }
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3321888768;
          v15[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_12;
          v15[3] = &unk_1EF4FB688;
          v13 = v17;
          objc_copyWeak(v17, &location);
          id v16 = v7;
          v17[1] = v53;
          v18 = v54;
          if (v54) {
            atomic_fetch_add_explicit(&v54->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          dispatch_async(MEMORY[0x1E4F14428], v15);
          if (v18) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v18);
          }
          v14 = v16;
        }
      }
    }

LABEL_58:
    objc_destroyWeak(v13);
    goto LABEL_59;
  }
  if (gAudioSessionDelegate) {
  else
  }
    [(AVAudioSession *)self privateInterruptionWithInfo:v7 accessor:&v53];
LABEL_59:
  if (v52) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v52);
  }
  if (v54) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v54);
  }
  objc_destroyWeak(&location);
}

- (void)privateHandlePing
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v37[0] = 1;
  int v38 = 3430;
  uint64_t v39 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::XPCConnection::sync_message<NSArray * {__strong}>(v35[7], &v51);
  v3 = (void *)MEMORY[0x1A6235350]();
  v4 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v51);
  uint64_t v5 = *(unsigned int *)v35;
  v6 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v51);
  [v4 getDeferredMessages:v5 reply:v6];

  if (v53)
  {
    v8 = *(id *)as::client::gSessionClientLog(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v44 = "AVAudioSessionClient_Common.mm";
      __int16 v45 = 1024;
      int v46 = 139;
      __int16 v47 = 2112;
      *(void *)v48 = v53;
      id v9 = v53;
      v10 = v8;
      id v11 = v9;
      v12 = v10;
      _os_log_impl(&dword_1A169D000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Server returned an error:. %@", buf, 0x1Cu);

      v8 = v12;
    }
  }
  else
  {
    unsigned __int8 v13 = atomic_load((unsigned __int8 *)([(AVAudioSession *)self atomicImpl] + 41));
    if ((v13 & 1) == 0) {
      goto LABEL_23;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = v54;
    uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v50 count:16];
    if (v25)
    {
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v49 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v28;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v28 != v17) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * j);
                id v20 = [v15 objectForKey:v19];
                id v21 = *(id *)as::client::gSessionClientLog(v20);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  int v22 = *(_DWORD *)v35;
                  *(_DWORD *)buf = 136315906;
                  id v44 = "AVAudioSessionClient_Common.mm";
                  __int16 v45 = 1024;
                  int v46 = 153;
                  __int16 v47 = 1024;
                  *(_DWORD *)v48 = v22;
                  *(_WORD *)&v48[4] = 2112;
                  *(void *)&v48[6] = v19;
                  _os_log_impl(&dword_1A169D000, v21, OS_LOG_TYPE_INFO, "%25s:%-5d Handling deferred message, sessionID = 0x%x, notificationName = %@", buf, 0x22u);
                }
                [(AVAudioSession *)self handleDeferredMessage:v19 userInfo:v20];
              }
              uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v49 count:16];
            }
            while (v16);
          }
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v50 count:16];
      }
      while (v25);
    }

    v8 = obj;
  }

LABEL_23:
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray * {__strong}> &&)>::~__value_func[abi:ne180100](v52);

  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v37);
}

- (id)addObserverForType:(unint64_t)a3 name:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17[0] = 1;
  int v18 = 3428;
  uint64_t v19 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  v10 = (os_unfair_lock_s *)*((void *)v15 + 5);
  os_unfair_lock_lock(v10);
  as::client::NotificationStateManager::GetNotificationStateForType((uint64_t)&v10[2], a3, 1, (uint64_t *)&v13);
  if (v10) {
    os_unfair_lock_unlock(v10);
  }
  if (a3 == 2 && !as::client::AVAudioSessionNotificationState::RegisterMXNotificationWithServer(v13, v8, &v15))
  {
    id v11 = 0;
  }
  else
  {
    id v11 = as::client::AVAudioSessionNotificationState::AddObserverForName((uint64_t)v13, v8, self, v9);
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);

  return v11;
}

- (shared_ptr<const)accessor
{
  v3 = v2;
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  uint64_t v5 = *(void *)(v8 + 80);
  void *v3 = *(void *)(v8 + 72);
  v3[1] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  v6 = v7;
  if (v7) {
    v6 = (ServerAccessor *)os_unfair_recursive_lock_unlock();
  }
  result.var1 = v4;
  result.var0 = v6;
  return result;
}

- (sync_guard<AVAudioSessionImpl,)privateGetGuardOfImplementation
{
  v3 = v2;
  impl = (char *)self->_impl;
  uint64_t v5 = (unfair_recursive_lock *)os_unfair_recursive_lock_lock_with_options();
  void *v3 = impl;
  v3[1] = impl + 8;
  result.var1.var0 = v6;
  result.var0 = v5;
  return result;
}

- (unsigned)opaqueSessionID
{
  return atomic_load((unsigned int *)[(AVAudioSession *)self atomicImpl]);
}

- (AVAudioSession)retain
{
  v2 = self;
  if (!self->_impl || [(AVAudioSession *)self sessionType] != 1886546285)
  {
    v4.receiver = v2;
    v4.super_class = (Class)AVAudioSession;
    return [(AVAudioSession *)&v4 retain];
  }
  return v2;
}

- (void)release
{
  if (!self->_impl || [(AVAudioSession *)self sessionType] != 1886546285)
  {
    v3.receiver = self;
    v3.super_class = (Class)AVAudioSession;
    [(AVAudioSession *)&v3 release];
  }
}

- (unint64_t)sessionType
{
  return *(void *)([(AVAudioSession *)self atomicImpl] + 16);
}

- (AVAudioSessionImplAtomic)atomicImpl
{
  return (AVAudioSessionImplAtomic)((char *)self->_impl + 8);
}

- (void)privatePostNotificationForType:(unint64_t)a3 name:(id)a4 userInfo:(id)a5 accessor:(const void *)a6
{
  id v10 = a4;
  id v11 = a5;
  id location = 0;
  uint64_t v12 = *(void *)(*(void *)a6 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)v12);
  objc_copyWeak(&to, (id *)(v12 + 8));
  if (v12) {
    os_unfair_lock_unlock((os_unfair_lock_t)v12);
  }
  id v13 = objc_loadWeakRetained(&to);

  if (v13)
  {
    id v14 = objc_loadWeakRetained(&to);
    objc_storeWeak(&location, v14);
  }
  else
  {
    objc_storeWeak(&location, self);
  }
  if (a3 == 1)
  {
    if ([v10 isEqualToString:@"AVAudioSessionRouteChangeNotification"]
      && !dyld_program_sdk_at_least())
    {
      uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 postNotificationName:v10 object:self userInfo:v11];
    }
    else
    {
      int v15 = **(_DWORD **)a6;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __100__AVAudioSession_ClientCommonImplementation__privatePostNotificationForType_name_userInfo_accessor___block_invoke;
      block[3] = &unk_1E5A829F0;
      objc_copyWeak(&v29, &location);
      id v27 = v10;
      int v30 = v15;
      id v28 = v11;
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v29);
    }
  }
  uint64_t v17 = *(os_unfair_lock_s **)(*(void *)a6 + 40);
  os_unfair_lock_lock(v17);
  as::client::NotificationStateManager::GetNotificationStateForType((uint64_t)&v17[2], a3, 1, (uint64_t *)&v24);
  if (v17) {
    os_unfair_lock_unlock(v17);
  }
  if (v24
    && as::client::AVAudioSessionNotificationState::CountRegisteredOfName((os_unfair_lock_s *)v24, (NSString *)v10))
  {
    int v18 = [(AVAudioSession *)self getNotificationQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3321888768;
    v19[2] = __100__AVAudioSession_ClientCommonImplementation__privatePostNotificationForType_name_userInfo_accessor___block_invoke_88;
    v19[3] = &unk_1EF4FC650;
    objc_copyWeak(v22, &location);
    v22[1] = v24;
    id v23 = v25;
    if (v25) {
      atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v20 = v10;
    id v21 = v11;
    dispatch_async(v18, v19);

    if (v23) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v23);
    }
    objc_destroyWeak(v22);
  }
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  objc_destroyWeak(&to);
  objc_destroyWeak(&location);
}

- (void)privateHandlePickableRoutesChange:(const void *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(id *)as::client::gSessionClientLog((as::client *)self);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "AVAudioSession_iOS.mm";
    __int16 v8 = 1024;
    int v9 = 4740;
    _os_log_impl(&dword_1A169D000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Notifying listeners that pickable routes changed", (uint8_t *)&v6, 0x12u);
  }
  [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionPickableRouteChangeNotification" userInfo:0 accessor:a3];
}

- (void)privateHandleAvailableSampleRatesChange:(const void *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(id *)as::client::gSessionClientLog((as::client *)self);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "AVAudioSession_iOS.mm";
    __int16 v8 = 1024;
    int v9 = 4654;
    _os_log_impl(&dword_1A169D000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Notifying listeners that available sample rates changed", (uint8_t *)&v6, 0x12u);
  }
  [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionAvailableSampleRatesChangeNotification" userInfo:0 accessor:a3];
}

- (id)getNotificationQueue
{
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "com.apple.AVAudioSessionNotification");
    as::CreateFixedPriorityDispatchQueue((const void **)__p, QOS_CLASS_USER_INTERACTIVE, &-[AVAudioSession(ClientCommonImplementation) getNotificationQueue]::sNotificationQueue);
    if (v5 < 0) {
      operator delete(__p[0]);
    }
  }
  v2 = applesauce::dispatch::v1::queue::operator*(&-[AVAudioSession(ClientCommonImplementation) getNotificationQueue]::sNotificationQueue);
  return v2;
}

- (id)getMXSessionProperty:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v6 = (NSString *)a3;
  v13[0] = 1;
  int v14 = 3426;
  uint64_t v15 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  id v7 = (as::client *)kdebug_trace();
  if (v6)
  {
    [(AVAudioSession *)self accessor];
    as::client::api_utils::ServerAccessor::GetPropertyMX_GenericPipe(*(as::client::api_utils::ServerAccessor **)buf, v6, (uint64_t)&v11);
    if (v12)
    {
      id v8 = v11;
    }
    else
    {
      id v8 = 0;
      if (a4) {
        *a4 = v11;
      }
    }

    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
  else
  {
    int v9 = *(id *)as::client::gSessionClientLog(v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioSessionClient_Common.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 633;
      _os_log_impl(&dword_1A169D000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d getMXSessionProperty: Invalid MXProperty provided", buf, 0x12u);
    }
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:2003329396 userInfo:0];
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);

  return v8;
}

- (id)getMXProperties:(id)a3 propertyErrors:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    [(AVAudioSession *)self accessor];
    id v7 = as::client::api_utils::ServerAccessor::GetBatchPropertiesMX(*(unsigned int **)v10, v6, a4);
    if (*(void *)&v10[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v10[8]);
    }
  }
  else
  {
    id v8 = *(id *)as::client::gSessionClientLog(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v10 = 136315394;
      *(void *)&v10[4] = "AVAudioSessionClient_Common.mm";
      *(_WORD *)&v10[12] = 1024;
      *(_DWORD *)&v10[14] = 710;
      _os_log_impl(&dword_1A169D000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid mxProperties", v10, 0x12u);
    }
    id v7 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v7;
}

- (BOOL)setMXSessionProperty:(id)a3 value:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v15[0] = 1;
  int v16 = 3427;
  uint64_t v17 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  int v9 = (as::client *)kdebug_trace();
  if (v7)
  {
    [(AVAudioSession *)self accessor];
    if (!v8)
    {
      id v8 = [MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v10 = *(as::client::cache_util::CacheManager ***)buf;
    id v21 = v7;
    id v22 = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    as::client::api_utils::ServerAccessor::SetBatchProperties(v10, v11, 0, 2, 1, 1);

    char v12 = FormatNSErrorForReturn();
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
  else
  {
    id v13 = *(id *)as::client::gSessionClientLog(v9);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioSessionClient_Common.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 667;
      _os_log_impl(&dword_1A169D000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d setMXSessionProperty: Invalid MXProperty provided", buf, 0x12u);
    }
    char v12 = FormatNSErrorForReturn();
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v15);

  return v12;
}

- (BOOL)setActive:(BOOL)active withOptions:(AVAudioSessionSetActiveOptions)options error:(NSError *)outError
{
  BOOL v7 = active;
  [(AVAudioSession *)self accessor];
  BOOL v9 = [(AVAudioSession *)self privateSetActive:v7 withOptions:options error:outError accessor:&v11];
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  return v9;
}

- (BOOL)privateSetActive:(BOOL)a3 withOptions:(unint64_t)a4 error:(id *)a5 accessor:(const void *)a6
{
  BOOL v9 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a3) {
    int v11 = 3087;
  }
  else {
    int v11 = 3088;
  }
  v28[0] = 1;
  int v29 = v11;
  uint64_t v30 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  kdebug_trace();
  v12.var0 = (AVAudioSessionImpl *)[(AVAudioSession *)self atomicImpl];
  if (v9) {
    id v13 = "[AVAudioSession setActive:activate]";
  }
  else {
    id v13 = "[AVAudioSession setActive:deactivate]";
  }
  uint64_t v14 = atomic_load((unint64_t *)v12.var0 + 1);
  PerformanceTracker::PerformanceTracker((uint64_t)v27, (uint64_t)v13, v14, 0);
  unsigned __int8 v15 = atomic_load((unsigned __int8 *)([(AVAudioSession *)self atomicImpl] + 42));
  as::client::XPCConnection::sync_message<>(*(as::client::XPCConnection **)(*(void *)a6 + 56), &v42);
  int v16 = (void *)MEMORY[0x1A6235350]();
  unint64_t v17 = a4 | ((unint64_t)(v15 & 1) << 26);
  uint64_t v18 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v42);
  uint64_t v19 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v20 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v42);
  if (v9) {
    [v18 activateSession:v19 options:v17 deviceInfo:0 requestID:0 reply:v20];
  }
  else {
    [v18 deactivateSession:v19 options:v17 priority:0 requestID:0 reply:v20];
  }

  id v22 = v44;
  if (v44)
  {
    if (a5) {
      *a5 = v44;
    }
  }
  else
  {
    id v23 = *(id *)as::client::gSessionClientLog(v21);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v24 = [(AVAudioSession *)self opaqueSessionID];
      uint64_t v25 = "Deactivated";
      id v35 = "AVAudioSession_iOS.mm";
      int v37 = 1928;
      __int16 v38 = 2080;
      *(_DWORD *)buf = 136315906;
      __int16 v36 = 1024;
      if (v9) {
        uint64_t v25 = "Activated";
      }
      uint64_t v39 = v25;
      __int16 v40 = 1024;
      unsigned int v41 = v24;
      _os_log_impl(&dword_1A169D000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s session 0x%x", buf, 0x22u);
    }
  }
  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v43);

  PerformanceTracker::~PerformanceTracker((PerformanceTracker *)v27);
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v28);
  return v22 == 0;
}

void __100__AVAudioSession_ClientCommonImplementation__privatePostNotificationForType_name_userInfo_accessor___block_invoke_88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    [*(id *)(*(void *)(a1 + 56) + 8) postNotificationName:*(void *)(a1 + 32) object:WeakRetained userInfo:*(void *)(a1 + 40)];
  }
}

void __100__AVAudioSession_ClientCommonImplementation__privatePostNotificationForType_name_userInfo_accessor___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) isEqualToString:@"AVAudioSessionMediaServicesWereLostNotification"];
    if ((v3 & 1) != 0
      || (uint64_t v3 = [*(id *)(a1 + 32) isEqualToString:@"AVAudioSessionMediaServicesWereResetNotification"], v3))
    {
      objc_super v4 = *(id *)as::client::gSessionClientLog((as::client *)v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v6 = *(_DWORD *)(a1 + 56);
        int v8 = 136315906;
        BOOL v9 = "AVAudioSessionClient_Common.mm";
        __int16 v10 = 1024;
        int v11 = 221;
        __int16 v12 = 2112;
        uint64_t v13 = v5;
        __int16 v14 = 1024;
        int v15 = v6;
        _os_log_impl(&dword_1A169D000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Posting inner %@ notification for session with ID 0x%x", (uint8_t *)&v8, 0x22u);
      }
    }
    BOOL v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:*(void *)(a1 + 32) object:WeakRetained userInfo:*(void *)(a1 + 40)];
  }
}

- (void)privateHandleRoutingContextChange:(const void *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(id *)as::client::gSessionClientLog((as::client *)self);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    int v8 = "AVAudioSession_iOS.mm";
    __int16 v9 = 1024;
    int v10 = 4814;
    __int16 v11 = 1024;
    unsigned int v12 = [(AVAudioSession *)self opaqueSessionID];
    _os_log_impl(&dword_1A169D000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Notifying listeners that routing context changed session 0x%x", (uint8_t *)&v7, 0x18u);
  }

  int v6 = [(AVAudioSession *)self routingContextUID];
  [(AVAudioSession *)self initializeAVOutputContextObject:v6 updateCache:1];

  atomic_store([(AVAudioSession *)self privateGetRouteSharingPolicy:a3], (unint64_t *)([(AVAudioSession *)self atomicImpl] + 32));
  [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionRoutingContextChangeNotification" userInfo:0 accessor:a3];
}

- (int)privateSetCategoryWithOptions:(id)a3 modes:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6 accessor:(const void *)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  unsigned int v12 = (NSString *)a3;
  uint64_t v13 = (NSString *)a4;
  v25[0] = 1;
  int v26 = 3072;
  uint64_t v27 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  kdebug_trace();
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v14)
  {
    if (a5 != 0xFFFFFFFFLL) {
      atomic_store(a5, (unint64_t *)([(AVAudioSession *)self atomicImpl] + 32));
    }
    atomic_load((unint64_t *)([(AVAudioSession *)self atomicImpl] + 32));
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v12)
    {
      uint64_t v16 = TranslateAVASCategoryToMXCategoryString(v12);
      if (!v16) {
        goto LABEL_15;
      }
      [v15 setObject:v16 forKey:*MEMORY[0x1E4F75EC8]];
    }
    if (!v13)
    {
LABEL_10:
      if (a5 != 0xFFFFFFFFLL)
      {
        uint64_t v18 = [NSNumber numberWithUnsignedInteger:a5];
        [v15 setObject:v18 forKey:*MEMORY[0x1E4F765C0]];
      }
      atomic_store((a5 & 0xFFFFFFFFFFFFFFFDLL) == 1, (unsigned __int8 *)([(AVAudioSession *)self atomicImpl] + 42));
      if (a6 != -1) {
        [(AVAudioSession *)self addCategoryOptionsToDictionary:v15 category:v12 options:a6];
      }
      uint64_t v21 = atomic_load((unint64_t *)([(AVAudioSession *)self atomicImpl] + 8));
      PerformanceTracker::PerformanceTracker((uint64_t)buf, (uint64_t)"-[AVAudioSession(CommonAPI) privateSetCategoryWithOptions:modes:routeSharingPolicy:options:accessor:]", v21, 1);
      id v22 = (as::client *)as::client::api_utils::ServerAccessor::SetBatchProperties(*(as::client::cache_util::CacheManager ***)a7, v15, 0, 1, 1, 0);
      unsigned int v19 = v22;
      if (v22)
      {
        id v23 = *(id *)as::client::gSessionClientLog(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          CAX4CCString::CAX4CCString((CAX4CCString *)v31, v19);
          *(_DWORD *)uint64_t v32 = 136315650;
          uint64_t v33 = "AVAudioSessionClient_Common.mm";
          __int16 v34 = 1024;
          int v35 = 597;
          __int16 v36 = 2080;
          int v37 = v31;
          _os_log_impl(&dword_1A169D000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set properties, error: %s", v32, 0x1Cu);
        }
      }
      as::client::KVOManager::markPropertiesDirtyAll(*(as::client::KVOManager **)(*(void *)a7 + 24));
      PerformanceTracker::~PerformanceTracker((PerformanceTracker *)buf);
      goto LABEL_23;
    }
    unint64_t v17 = TranslateAVASModeToMXModeString(v13);
    if (v17)
    {
      [v15 setObject:v17 forKey:*MEMORY[0x1E4F75F00]];

      goto LABEL_10;
    }
LABEL_15:
    unsigned int v19 = -50;
LABEL_23:

    goto LABEL_24;
  }
  unsigned int v19 = 2003329396;
  uint64_t v20 = *(id *)as::client::gSessionClientLog(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v39 = "AVAudioSessionClient_Common.mm";
    __int16 v40 = 1024;
    int v41 = 538;
    _os_log_impl(&dword_1A169D000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Error while allocating for propertyData", buf, 0x12u);
  }
LABEL_24:

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v25);
  return v19;
}

- (AVAudioSession)initWithSpecification:(id)a3
{
  id v4 = a3;
  PerformanceTracker::PerformanceTracker((uint64_t)v9, (uint64_t)"-[AVAudioSession initWithSpecification:]", 0, 1);
  std::mutex::lock(&GetSessionInitMutex(void)::sMutex);
  if ([v4 sessionType] == 1886546285 && avfaudio::gAVAudioSession)
  {

    unint64_t v5 = atomic_load((unint64_t *)([(id)avfaudio::gAVAudioSession atomicImpl] + 8));
    unint64_t v10 = v5;
    int v6 = (AVAudioSession *)(id)avfaudio::gAVAudioSession;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVAudioSession;
    int v6 = [(AVAudioSession *)&v8 init];
    if (v6) {
      operator new();
    }
  }
  std::mutex::unlock(&GetSessionInitMutex(void)::sMutex);
  PerformanceTracker::~PerformanceTracker((PerformanceTracker *)v9);

  return v6;
}

- (id)routingContextUID
{
  v11[0] = 1;
  int v12 = 3397;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = v9;
  id v4 = (id)*MEMORY[0x1E4F765D8];
  uint64_t v5 = atomic_load((unint64_t *)([(AVAudioSession *)self atomicImpl] + 8));
  int v6 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero_WithAnalytics<NSString * {__strong}>(v3, v4, v5, (uint64_t)"-[AVAudioSession routingContextUID]");

  if (v6) {
    int v7 = v6;
  }
  else {
    int v7 = &stru_1EF4FCC40;
  }

  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)privateCreateSessionInServerUsingXPC:(void *)a3
{
  char v4 = 0;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  char v5 = 1;
  do
  {
    char v6 = v5;
    if (v4) {
      usleep(0x186A0u);
    }
    as::client::XPCConnection::sync_message<unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int>(*(as::client::XPCConnection **)(*((void *)a3 + 1) + 48), (uint64_t)buf);
    int v7 = (void *)MEMORY[0x1A6235350]();
    objc_super v8 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int>::sync_proxy((void **)buf);
    uint64_t v9 = *((void *)a3 + 1);
    uint64_t v10 = *(void *)(v9 + 16);
    long long v11 = *(_OWORD *)(v9 + 300);
    v54[0] = *(_OWORD *)(v9 + 284);
    v54[1] = v11;
    uint64_t v12 = *(unsigned int *)(v9 + 24);
    uint64_t v13 = *(void *)(v9 + 320);
    uint64_t v14 = *(void *)(v9 + 328);
    uint64_t v15 = *(unsigned int *)(v9 + 336);
    uint64_t v16 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int>::reply((uint64_t)buf);
    [v8 createSession:v10 sourceAuditToken:v54 sourceSessionID:v12 nameOrDeviceUID:v13 clientProcessName:v14 useCaseIdentifier:v15 reply:v16];

    if (!v63)
    {
      unsigned int v29 = v64;
      int v30 = v67;
      uint64_t v31 = *(id *)as::client::gSessionClientLog(v17);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id location = 136315906;
        *(void *)&location[4] = "AVAudioSession_iOS.mm";
        *(_WORD *)&location[12] = 1024;
        *(_DWORD *)&location[14] = 1141;
        __int16 v56 = 2048;
        *(void *)v57 = self;
        *(_WORD *)&v57[8] = 1024;
        *(_DWORD *)&v57[10] = v29;
        _os_log_impl(&dword_1A169D000, v31, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created session %p with ID: 0x%x", location, 0x22u);
      }
      AVAudioSessionImpl::setSessionID(*((AVAudioSessionImpl **)a3 + 1), v29);
      uint64_t v32 = *((void *)a3 + 1);
      *(_DWORD *)(v32 + 24) = v30;
      uint64_t v33 = as::client::XPCConnection::getConnection(*(as::client::XPCConnection **)(v32 + 48));
      unsigned int v34 = [v33 processIdentifier];

      int v35 = (as::client::DeviceTimeGlobalState *)v65;
      __int16 v36 = v35;
      if (v35)
      {
        int v37 = as::client::DeviceTimeGlobalState::instance(v35);
        as::client::DeviceTimeGlobalState::obtainedNewSharedBlock((uint64_t)v37, v34, v36);
        uint64_t v38 = v66;
        uint64_t v39 = *((void *)a3 + 1);
        *(_DWORD *)(v39 + 192) = v66;
        atomic_store(v38, (unsigned int *)(*(void *)(v39 + 200) + 16));
        atomic_store(v38, (unsigned int *)(*(void *)(*((void *)a3 + 1) + 216) + 16));
        uint64_t v40 = *((void *)a3 + 1);
        int v41 = *(void **)(v40 + 248);
        if (v41)
        {
          [v41 setTimingSlot:v38];
          uint64_t v40 = *((void *)a3 + 1);
        }
        uint64_t v42 = *(void **)(v40 + 256);
        if (v42) {
          [v42 setTimingSlot:v38];
        }
      }

      if (*(void *)(*((void *)a3 + 1) + 16) != 1702392942)
      {
        id v43 = (os_unfair_lock_s *)CADeprecated::TSingleton<avfaudio::SessionMap>::instance();
        avfaudio::SessionMap::AddSession(v43, self, v29);
        objc_initWeak(&to, self);
        objc_copyWeak(&from, &to);
        uint64_t v44 = *(void *)(*((void *)a3 + 1) + 48);
        objc_copyWeak(&v51, &from);
        *(void *)&v57[4] = 0;
        *(void *)id location = &unk_1EF4FBBC8;
        objc_moveWeak((id *)&location[8], &v51);
        *(void *)&v57[4] = location;
        objc_destroyWeak(&v51);
        as::client::XPCConnection::setServerTerminatedCallback(v44, (uint64_t)location, *(unsigned char *)(*((void *)a3 + 1) + 316));
        std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](location);
        if (*(unsigned char *)(*((void *)a3 + 1) + 316))
        {
          objc_copyWeak(&v50, &to);
          uint64_t v45 = *(void *)(*((void *)a3 + 1) + 48);
          objc_copyWeak(&v49, &v50);
          *(void *)&v57[4] = 0;
          *(void *)id location = &unk_1EF4FBC10;
          objc_moveWeak((id *)&location[8], &v49);
          *(void *)&v57[4] = location;
          objc_destroyWeak(&v49);
          as::client::XPCConnection::setServerRestartedCallback(v45, (uint64_t)location);
          std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](location);
          objc_destroyWeak(&v50);
        }
        [(AVAudioSession *)self accessor];
        [(AVAudioSession *)self privateDispatchPing:location];
        if (*(void *)&location[8]) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&location[8]);
        }
        objc_destroyWeak(&from);
        objc_destroyWeak(&to);
      }

      std::__function::__value_func<void ()(NSError *,std::tuple<unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int> &&)>::~__value_func[abi:ne180100](&buf[8]);
      return 1;
    }

    std::__function::__value_func<void ()(NSError *,std::tuple<unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int> &&)>::~__value_func[abi:ne180100](&buf[8]);
    char v5 = 0;
    char v4 = 1;
  }
  while ((v6 & 1) != 0);
  BOOL result = 0;
  uint64_t v19 = *(void *)(*((void *)a3 + 1) + 16);
  if (v19 != 1702392942 && v19 != 1935830119)
  {
    uint64_t v20 = *(id *)as::client::gSessionClientLog(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVAudioSession_iOS.mm";
      __int16 v59 = 1024;
      int v60 = 1222;
      __int16 v61 = 2048;
      uint64_t v62 = 3;
      _os_log_impl(&dword_1A169D000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Session creation did not succeed, will retry after %lld seconds", buf, 0x1Cu);
    }
    objc_initWeak((id *)location, self);
    objc_copyWeak(&to, (id *)location);
    uint64_t v21 = (char *)operator new(0x38uLL);
    *((void *)v21 + 1) = 0;
    *((void *)v21 + 2) = 0;
    *(void *)uint64_t v21 = &unk_1EF4FC168;
    objc_copyWeak((id *)buf, &to);
    *((void *)v21 + 6) = 0;
    *((void *)v21 + 3) = &unk_1EF4FBC58;
    objc_moveWeak((id *)v21 + 4, (id *)buf);
    *((void *)v21 + 6) = v21 + 24;
    objc_destroyWeak((id *)buf);
    uint64_t v22 = *((void *)a3 + 1);
    id v23 = *(std::__shared_weak_count **)(v22 + 128);
    *(void *)(v22 + 120) = v21 + 24;
    *(void *)(v22 + 128) = v21;
    if (v23) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v23);
    }
    uint64_t v24 = *((void *)a3 + 1);
    uint64_t v26 = *(void *)(v24 + 120);
    uint64_t v25 = *(std::__shared_weak_count **)(v24 + 128);
    if (v25) {
      atomic_fetch_add_explicit(&v25->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    dispatch_time_t v27 = dispatch_time(0, 3000000000);
    uint64_t v28 = *(id *)(*(void *)(*((void *)a3 + 1) + 48) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3321888768;
    block[2] = __55__AVAudioSession_privateCreateSessionInServerUsingXPC___block_invoke;
    block[3] = &__block_descriptor_48_ea8_32c42_ZTSNSt3__18weak_ptrINS_8functionIFvvEEEEE_e5_v8__0l;
    void block[4] = v26;
    v48 = v25;
    if (v25) {
      atomic_fetch_add_explicit(&v25->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    dispatch_after(v27, v28, block);
    if (v48) {
      std::__shared_weak_count::__release_weak(v48);
    }

    if (v25) {
      std::__shared_weak_count::__release_weak(v25);
    }
    objc_destroyWeak(&to);
    objc_destroyWeak((id *)location);
    return 1;
  }
  return result;
}

- (AVAudioSession)autorelease
{
  v2 = self;
  if (!self->_impl || [(AVAudioSession *)self sessionType] != 1886546285)
  {
    v4.receiver = v2;
    v4.super_class = (Class)AVAudioSession;
    return [(AVAudioSession *)&v4 autorelease];
  }
  return v2;
}

- (void)privateDispatchPing:(const void *)a3
{
  id v4 = *(id *)(*(void *)(*(void *)a3 + 56) + 16);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__AVAudioSession_ClientCommonImplementation__privateDispatchPing___block_invoke;
  v6[3] = &unk_1E5A82830;
  char v5 = v4;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)privateCreateSessionInServerUsingXPC:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained privateGetGuardOfImplementation];
    [v2 privateCreateSessionInServerUsingXPC:&v3];
    if (v3) {
      os_unfair_recursive_lock_unlock();
    }
  }
}

+ (id)auxiliarySession
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___AVAudioSession;
  v2 = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "initWithSessionType:", 1635088489);
  return v2;
}

- (id)initAuxiliarySession
{
  v5[0] = 1;
  int v6 = 3432;
  long long v7 = 0u;
  long long v8 = 0u;
  kdebug_trace();
  uint64_t v3 = [(AVAudioSession *)self initWithSessionType:1635088489];
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v5);
  return v3;
}

void __32__AVAudioSession_sharedInstance__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___AVAudioSession;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "initWithSessionType:", 1886546285);
  v2 = (void *)avfaudio::gAVAudioSession;
  avfaudio::gAVAudioSession = v1;
}

- (id)initSiblingSession:(unsigned int)a3 auditToken:(id *)a4 clientIdentifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  uint64_t v9 = objc_opt_new();
  [v9 setSessionType:1935830119];
  long long v10 = *(_OWORD *)&a4->var0[4];
  v19[0] = *(_OWORD *)a4->var0;
  v19[1] = v10;
  [v9 setClientAuditToken:v19];
  [v9 setSourceSessionID:v6];
  [v9 setClientIdentifier:v8];
  [v9 setAutoReconnect:0];
  v13[0] = 1;
  int v14 = 3431;
  uint64_t v15 = [v9 sourceSessionID];
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  kdebug_trace();
  long long v11 = [(AVAudioSession *)self initWithSpecification:v9];
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);

  return v11;
}

- (id)initSiblingSession:(unsigned int)a3 auditToken:(id *)a4 clientIdentifier:(id)a5 autoReconnect:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  *(void *)&v20[9] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  long long v11 = objc_opt_new();
  [v11 setSessionType:1935830119];
  long long v12 = *(_OWORD *)&a4->var0[4];
  v18[0] = *(_OWORD *)a4->var0;
  v18[1] = v12;
  [v11 setClientAuditToken:v18];
  [v11 setSourceSessionID:v8];
  [v11 setClientIdentifier:v10];
  uint64_t v13 = (as::client *)[v11 setAutoReconnect:v6];
  if (v8 == -1 || !v6)
  {
    unsigned int v16 = [v11 sourceSessionID];
    buf[0] = 1;
    v20[0] = 3431;
    *(_OWORD *)&v20[1] = v16;
    *(void *)&v20[5] = 0;
    *(void *)&v20[7] = 0;
    kdebug_trace();
    self = [(AVAudioSession *)self initWithSpecification:v11];
    as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)buf);
    uint64_t v15 = self;
  }
  else
  {
    int v14 = *(id *)as::client::gSessionClientLog(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)uint64_t v20 = "AVAudioSession_iOS.mm";
      LOWORD(v20[2]) = 1024;
      *(_DWORD *)((char *)&v20[2] + 2) = 1571;
      _os_log_impl(&dword_1A169D000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Sibling session creation with an explicit ID and auto-reconnect is not yet supported.", buf, 0x12u);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (AVAudioSession)initWithSessionType:(unint64_t)a3
{
  char v5 = objc_opt_new();
  [v5 setSessionType:a3];
  [v5 setAutoReconnect:1];
  BOOL v6 = [(AVAudioSession *)self initWithSpecification:v5];

  return v6;
}

- (id)spatialPreferences:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v13[0] = 1;
  int v14 = 3440;
  uint64_t v15 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::XPCConnection::sync_message<AVAudioSessionSpatialPreferences * {__strong}>(v11[7], &v19);
  char v5 = (void *)MEMORY[0x1A6235350]();
  BOOL v6 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},AVAudioSessionSpatialPreferences * {__strong}>::sync_proxy(&v19);
  uint64_t v7 = *(unsigned int *)v11;
  uint64_t v8 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},AVAudioSessionSpatialPreferences * {__strong}>::reply((uint64_t)&v19);
  [v6 getSpatialPreferencesForSession:v7 contentType:a3 reply:v8];

  if (v21) {
    id v9 = 0;
  }
  else {
    id v9 = v22;
  }

  std::__function::__value_func<void ()(NSError *,std::tuple<AVAudioSessionSpatialPreferences * {__strong}> &&)>::~__value_func[abi:ne180100](v20);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v9;
}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_super v3 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F75CF8]];
    [v4 privateUpdatePiPAvailabilityChange:v3];

    id WeakRetained = v4;
  }
}

- (void)privateUpdatePiPAvailabilityChange:(id)a3
{
  id v4 = a3;
  [(AVAudioSession *)self accessor];
  uint64_t v5 = *(void *)(v7 + 24);
  int v6 = [v4 BOOLValue];
  as::client::KVOProperty<unsigned int>::UpdateAndNotify(v5 + 440, &v6, 0);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

- (BOOL)isActive
{
  v7[0] = 1;
  int v8 = 3328;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL v3 = [(AVAudioSession *)self privateIsActive:v5];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return v3;
}

- (BOOL)privateIsActive:(const void *)a3
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(*(os_unfair_lock_s ***)a3, (void *)*MEMORY[0x1E4F76258], 1) != 0;
}

- (AVAudioSessionRouteSharingPolicy)routeSharingPolicy
{
  v7[0] = 1;
  int v8 = 3075;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  unsigned int Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v5, (void *)*MEMORY[0x1E4F765C0], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return (unint64_t)Property_DefaultTo;
}

- (unint64_t)privateGetRouteSharingPolicy:(const void *)a3
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(*(os_unfair_lock_s ***)a3, (void *)*MEMORY[0x1E4F765C0], 1);
}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    BOOL v3 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F75D08]];
    [v4 privateUpdateReporterIDs:v3];

    id WeakRetained = v4;
  }
}

- (void)privateUpdateReporterIDs:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (as::client *)a3;
  uint64_t v5 = v4;
  if (v4 && (id v4 = (as::client *)[(as::client *)v4 count]) != 0)
  {
    int v6 = [(as::client *)v5 objectAtIndex:0];
    atomic_store([v6 longLongValue], (unint64_t *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 8));
  }
  else
  {
    uint64_t v7 = *(id *)as::client::gSessionClientLog(v4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "AVAudioSession_iOS.mm";
      __int16 v10 = 1024;
      int v11 = 4981;
      _os_log_impl(&dword_1A169D000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d inValue is nil for new reporter IDs", (uint8_t *)&v8, 0x12u);
    }
  }
}

- (int64_t)getCachedOrFromServerReporterID:(const void *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = atomic_load((unint64_t *)([(AVAudioSession *)self atomicImpl] + 8));
  if (!v5)
  {
    int v6 = *(os_unfair_lock_s ***)a3;
    id v7 = (id)*MEMORY[0x1E4F76590];
    int v8 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray<NSNumber *> * {__strong}>(v6, v7);

    if (v8 && (uint64_t v9 = (as::client *)[v8 count]) != 0)
    {
      __int16 v10 = [v8 objectAtIndex:0];
      uint64_t v5 = [v10 longLongValue];

      atomic_store(v5, (unint64_t *)([(AVAudioSession *)self atomicImpl] + 8));
    }
    else
    {
      int v11 = *(id *)as::client::gSessionClientLog(v9);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315394;
        int v14 = "AVAudioSession_iOS.mm";
        __int16 v15 = 1024;
        int v16 = 4601;
        _os_log_impl(&dword_1A169D000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get reporterIDs", (uint8_t *)&v13, 0x12u);
      }

      return 0;
    }
  }
  return v5;
}

- (BOOL)allowAllBuiltInDataSources
{
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  int v2 = *(unsigned __int8 *)(v5 + 280);
  if (v4) {
    os_unfair_recursive_lock_unlock();
  }
  return v2 != 0;
}

- (BOOL)setActive:(BOOL)active error:(NSError *)outError
{
  return [(AVAudioSession *)self setActive:active withOptions:0 error:outError];
}

- (id)outputTimeObserver
{
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  if (!*(void *)(v11 + 240))
  {
    int v2 = [AVAudioTimeObserverImpl alloc];
    BOOL v3 = *(std::__shared_weak_count **)(v11 + 224);
    uint64_t v8 = *(void *)(v11 + 216);
    uint64_t v9 = v3;
    if (v3) {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v4 = [(AVAudioTimeObserverImpl *)v2 initWithDeviceTimeClient:&v8];
    uint64_t v5 = *(void **)(v11 + 240);
    *(void *)(v11 + 240) = v4;

    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  id v6 = *(id *)(v11 + 240);
  if (v10) {
    os_unfair_recursive_lock_unlock();
  }
  return v6;
}

- (id)inputTimeObserver
{
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  if (!*(void *)(v11 + 232))
  {
    int v2 = [AVAudioTimeObserverImpl alloc];
    BOOL v3 = *(std::__shared_weak_count **)(v11 + 208);
    uint64_t v8 = *(void *)(v11 + 200);
    uint64_t v9 = v3;
    if (v3) {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v4 = [(AVAudioTimeObserverImpl *)v2 initWithDeviceTimeClient:&v8];
    uint64_t v5 = *(void **)(v11 + 232);
    *(void *)(v11 + 232) = v4;

    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  id v6 = *(id *)(v11 + 232);
  if (v10) {
    os_unfair_recursive_lock_unlock();
  }
  return v6;
}

uint64_t __40__AVAudioSession_initWithSpecification___block_invoke(as::client *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(id *)as::client::gSessionClientLog(a1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315394;
    uint64_t v4 = "AVAudioSession_iOS.mm";
    __int16 v5 = 1024;
    int v6 = 310;
    _os_log_impl(&dword_1A169D000, v1, OS_LOG_TYPE_INFO, "%25s:%-5d Registering to CFNotificationCenter to notify of Observers of MicrophoneInjectionCapabilityChangeNotification", (uint8_t *)&v3, 0x12u);
  }
  return _CFNotificationCenterRegisterDependentNotificationList();
}

- (void)requestRecordPermission:(void *)response
{
  uint64_t v4 = response;
  LODWORD(location) = 3081;
  unsigned int v11 = [(AVAudioSession *)self opaqueSessionID];
  std::allocate_shared[abi:ne180100]<as::ScopedTrace,std::allocator<as::ScopedTrace>,as::AudioSessionTraceCode,unsigned int,void>((int *)&location, &v11, &v12);
  AVAudioSessionRecordPermission v5 = [(AVAudioSession *)self recordPermission];
  if (v5 == AVAudioSessionRecordPermissionDenied)
  {
    uint64_t v6 = 0;
    goto LABEL_5;
  }
  if (v5 == AVAudioSessionRecordPermissionGranted)
  {
    uint64_t v6 = 1;
LABEL_5:
    v4[2](v4, v6);
    goto LABEL_7;
  }
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__AVAudioSession_requestRecordPermission___block_invoke;
  v7[3] = &unk_1E5A828A0;
  objc_copyWeak(&v9, &location);
  uint64_t v8 = v4;
  makeTCCAccessRequest(1, 0, 1919119972, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
LABEL_7:
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
}

- (AVAudioSessionRecordPermission)recordPermission
{
  v9[0] = 1;
  int v10 = 3080;
  uint64_t v11 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  kdebug_trace();
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 1970168948;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__AVAudioSession_recordPermission__block_invoke;
  v4[3] = &unk_1E5A82878;
  v4[4] = &v5;
  makeTCCAccessRequest(0, 2, 1919119972, v4);
  AVAudioSessionRecordPermission v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return v2;
}

+ (AVAudioSession)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AVAudioSession_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (+[AVAudioSession sharedInstance]::onceToken != -1) {
    dispatch_once(&+[AVAudioSession sharedInstance]::onceToken, block);
  }
  AVAudioSessionRecordPermission v2 = (void *)avfaudio::gAVAudioSession;
  return (AVAudioSession *)v2;
}

- (AVAudioSessionRouteDescription)currentRoute
{
  v7[0] = 1;
  int v8 = 3124;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  int v3 = [(AVAudioSession *)self privateGetCurrentRoute:v5];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return (AVAudioSessionRouteDescription *)v3;
}

- (id)privateGetCurrentRoute:(const void *)a3
{
  uint64_t v4 = *(os_unfair_lock_s ***)a3;
  uint64_t v5 = atomic_load((unint64_t *)([(AVAudioSession *)self atomicImpl] + 8));
  uint64_t v6 = as::client::api_utils::ServerAccessor::GetPropertyAVAS_DefaultToZero_WithAnalytics<NSDictionary * {__strong}>(v4, @"AS_DetailedActiveAudioRoute", v5, (uint64_t)"-[AVAudioSession privateGetCurrentRoute:]");
  uint64_t v7 = [[AVAudioSessionRouteDescription alloc] initWithRawDescription:v6 owningSession:self];

  return v7;
}

- (NSTimeInterval)inputLatency
{
  v7[0] = 1;
  int v8 = 3116;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  float Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(v5, (void *)*MEMORY[0x1E4F76058], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (double)inputSampleRate
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E4F76070], 1);
}

- (unint64_t)IOBufferFrameSize
{
  v9[0] = 1;
  int v10 = 3375;
  uint64_t v11 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  int v3 = [(AVAudioSession *)self privateGetCategory:&v7];

  if (v3 == @"AVAudioSessionCategoryRecord") {
    uint64_t Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned long>(v7, (void *)*MEMORY[0x1E4F76050], 1);
  }
  else {
    uint64_t Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned long>(v7, (void *)*MEMORY[0x1E4F76078], 1);
  }
  unint64_t v5 = Property_DefaultTo;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return v5;
}

- (BOOL)setMode:(AVAudioSessionMode)mode error:(NSError *)outError
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = mode;
  v15[0] = 1;
  int v16 = 3076;
  uint64_t v17 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  kdebug_trace();
  uint64_t v7 = TranslateAVASModeToMXModeString(v6);
  if (v7)
  {
    [(AVAudioSession *)self accessor];
    int v8 = (as::client *)as::client::api_utils::ServerAccessor::SetProperty(v13, (void *)*MEMORY[0x1E4F75F00], v7, 1);
    int v9 = (int)v8;
    if (v8)
    {
      int v10 = *(id *)as::client::gSessionClientLog(v8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v22 = "AVAudioSession_iOS.mm";
        __int16 v23 = 1024;
        int v24 = 3431;
        __int16 v25 = 1024;
        int v26 = v9;
        _os_log_impl(&dword_1A169D000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set mode: %d", buf, 0x18u);
      }
    }
    int v11 = FormatNSErrorForReturn();
    if (v11) {
      as::client::KVOManager::markPropertiesDirty(v13[3], -33);
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
  else if (outError)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
    LOBYTE(v11) = 0;
    *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v15);
  return v11;
}

- (double)sampleRate
{
  int v2 = [*(id *)(a1 + 16) isEqualToString:@"AVAudioSessionCategoryRecord"];
  int v3 = (void **)MEMORY[0x1E4F76070];
  if (!v2) {
    int v3 = (void **)MEMORY[0x1E4F76090];
  }
  uint64_t v4 = *v3;
  unint64_t v5 = **(os_unfair_lock_s ****)(a1 + 8);
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(v5, v4, 1);
}

- (AVAudioSessionMode)mode
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v10[0] = 1;
  int v11 = 3077;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v8, (void *)*MEMORY[0x1E4F75F00]);
  int v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v3;
  if (v3)
  {
    TranslateMXModeToAVASModeString(v3);
    unint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = *(id *)as::client::gSessionClientLog(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "AVAudioSession_iOS.mm";
      __int16 v18 = 1024;
      int v19 = 3409;
      _os_log_impl(&dword_1A169D000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get mode", buf, 0x12u);
    }
    unint64_t v5 = &stru_1EF4FCC40;
  }

  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return (AVAudioSessionMode)v5;
}

- (AVAudioSessionCategory)category
{
  v7[0] = 1;
  int v8 = 3073;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  int v3 = [(AVAudioSession *)self privateGetCategory:v5];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return (AVAudioSessionCategory)v3;
}

- (id)privateGetCategory:(const void *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = *(os_unfair_lock_s ***)a3;
  id v6 = (id)*MEMORY[0x1E4F75EC8];
  uint64_t v7 = atomic_load((unint64_t *)([(AVAudioSession *)self atomicImpl] + 8));
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero_WithAnalytics<NSString * {__strong}>(v5, v6, v7, (uint64_t)"-[AVAudioSession privateGetCategory:]");
  int v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    uint64_t v17 = *(id *)as::client::gSessionClientLog(v9);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      uint64_t v20 = "AVAudioSession_iOS.mm";
      __int16 v21 = 1024;
      int v22 = 4579;
      uint64_t v14 = "%25s:%-5d Failed to get category";
      uint64_t v15 = v17;
      uint32_t v16 = 18;
      goto LABEL_9;
    }
LABEL_10:
    uint64_t v10 = &stru_1EF4FCC40;
    goto LABEL_11;
  }
  TranslateMXCategoryToAVASCategoryString(v8);
  uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (as::client *)[(AVAudioSession *)self privateNeedsTranslationForNoSpeakerCategory:v10 accessor:a3];
  if (v11)
  {
    uint64_t v12 = @"AVAudioSessionCategoryPlayback";

    uint64_t v10 = v12;
  }
  if (!v10)
  {
    uint64_t v13 = *(id *)as::client::gSessionClientLog(v11);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315650;
      uint64_t v20 = "AVAudioSession_iOS.mm";
      __int16 v21 = 1024;
      int v22 = 4587;
      __int16 v23 = 2112;
      int v24 = v8;
      uint64_t v14 = "%25s:%-5d No valid string for category: %@";
      uint64_t v15 = v13;
      uint32_t v16 = 28;
LABEL_9:
      _os_log_impl(&dword_1A169D000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v19, v16);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:

  return v10;
}

- (BOOL)privateNeedsTranslationForNoSpeakerCategory:(id)a3 accessor:(const void *)a4
{
  return 0;
}

- (void)sampleRate
{
  operator delete(a1);
}

- (int64_t)reporterID
{
  v7[0] = 1;
  int v8 = 3390;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  int64_t v3 = [(AVAudioSession *)self getCachedOrFromServerReporterID:v5];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return v3;
}

uint64_t __34__AVAudioSession_recordPermission__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = 1684369017;
  if (a2 == 1) {
    uint64_t v2 = 1970168948;
  }
  if (a2 == 2) {
    uint64_t v2 = 1735552628;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v2;
  return result;
}

- (BOOL)isOtherAudioPlaying
{
  v7[0] = 1;
  int v8 = 3119;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76630], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)setPreferredIOBufferFrameSize:(unint64_t)a3 error:(id *)a4
{
  v11[0] = 1;
  int v12 = 3373;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76430], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)setCategory:(AVAudioSessionCategory)category mode:(AVAudioSessionMode)mode options:(AVAudioSessionCategoryOptions)options error:(NSError *)outError
{
  uint64_t v9 = category;
  uint64_t v10 = mode;
  [(AVAudioSession *)self accessor];
  [(AVAudioSession *)self privateSetCategoryWithOptions:v9 modes:v10 routeSharingPolicy:-1 options:options accessor:&v13];
  char v11 = FormatNSErrorForReturn();
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }

  return v11;
}

- (BOOL)setCategory:(AVAudioSessionCategory)category mode:(AVAudioSessionMode)mode routeSharingPolicy:(AVAudioSessionRouteSharingPolicy)policy options:(AVAudioSessionCategoryOptions)options error:(NSError *)outError
{
  char v11 = category;
  int v12 = mode;
  if (as::client::api_utils::ValidateRouteSharingPolicyParameters((as::client::api_utils *)v11, v12, (NSString *)policy, (AVAudioSessionRouteSharingPolicy)options))
  {
    [(AVAudioSession *)self accessor];
    [(AVAudioSession *)self privateSetCategoryWithOptions:v11 modes:v12 routeSharingPolicy:policy options:options accessor:&v15];
    char v13 = FormatNSErrorForReturn();
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
  }
  else
  {
    char v13 = FormatNSErrorForReturn();
  }

  return v13;
}

- (BOOL)setCategory:(AVAudioSessionCategory)category error:(NSError *)outError
{
  unint64_t v5 = category;
  [(AVAudioSession *)self accessor];
  [(AVAudioSession *)self privateSetCategoryWithOptions:v5 modes:0 routeSharingPolicy:-1 options:-1 accessor:&v8];
  char v6 = FormatNSErrorForReturn();
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }

  return v6;
}

- (id)consolidatedSourceContentInfo
{
  v9[0] = 1;
  int v10 = 3331;
  uint64_t v11 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  int64_t v3 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray * {__strong}>(v7, (void *)*MEMORY[0x1E4F75FE8]);
  uint64_t v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }

  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return v5;
}

- (id)privateRefreshAvailableInputs
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(AVAudioSession *)self accessor];
  int64_t v3 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray * {__strong}>(v7, (void *)*MEMORY[0x1E4F765E0]);
  if (v3)
  {
    id v4 = +[AVAudioSessionPortDescription privateCreateArray:v3 owningSession:self];
  }
  else
  {
    id v5 = *(id *)as::client::gSessionClientLog(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v10 = "AVAudioSession_iOS.mm";
      __int16 v11 = 1024;
      int v12 = 3951;
      _os_log_impl(&dword_1A169D000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Get SelectableInputs failed", buf, 0x12u);
    }
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }

  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  return v4;
}

- (BOOL)isRelatedSessionID:(unsigned int)a3
{
  id v4 = self;
  id v5 = v4;
  unsigned int v18 = a3;
  if (v4)
  {
    [(AVAudioSession *)v4 accessor];
    uint64_t v6 = v16;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v13 = 0;
  std::allocate_shared[abi:ne180100]<as::client::api_utils::ServerAccessor const,std::allocator<as::client::api_utils::ServerAccessor const>,unsigned int &,AVAudioSessionType const&,decltype(nullptr),decltype(nullptr),decltype(nullptr),std::shared_ptr<as::client::XPCConnection> const&,void>(&v18, (void *)(v6 + 8), (uint64_t)&v15, (uint64_t)&v14, (uint64_t)&v13, (void *)(v6 + 56), &v11);
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  char v7 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSNumber * {__strong}>(v11, (void *)*MEMORY[0x1E4F76000]);
  if (v7)
  {
    unsigned int v8 = [(AVAudioSession *)v5 sourceSessionID];
    BOOL v9 = [v7 unsignedLongValue] == v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }

  return v9;
}

- (unsigned)sourceSessionID
{
  [(AVAudioSession *)self accessor];
  if (*(void *)(v5 + 8) == 1935830119) {
    unsigned int v3 = *(_DWORD *)([(AVAudioSession *)self atomicImpl] + 24);
  }
  else {
    unsigned int v3 = atomic_load((unsigned int *)[(AVAudioSession *)self atomicImpl]);
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return v3;
}

- (BOOL)subscribeToNotifications:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  v20[0] = 1;
  int v21 = 3396;
  uint64_t v22 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  kdebug_trace();
  if (v18)
  {
    uint64_t v16 = self;
    uint64_t v17 = a4;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = v18;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:&v30 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v27;
      uint64_t v19 = *MEMORY[0x1E4F75E10];
      uint64_t v10 = *MEMORY[0x1E4F75E00];
      uint64_t v11 = *MEMORY[0x1E4F75DD8];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v13, "isEqual:", @"AVAudioSessionBeaconBudgetChangeNotification", v16, v17))
          {
            [v6 addObject:v11];
          }
          else if ([v13 isEqual:@"AVAudioSessionConcurrentAirPlayAudioPreferenceChangeNotification"])
          {
            [v6 addObject:v10];
          }
          else if ([v13 isEqual:@"AVAudioSessionRouteControlChangeNotification"])
          {
            [v6 addObject:v19];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:&v30 count:16];
      }
      while (v8);
    }

    self = v16;
  }
  else
  {
    id v6 = 0;
  }
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetProperty(v30, (void *)*MEMORY[0x1E4F76658], v6, 1);
  char v14 = FormatNSErrorForReturn();
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v20);
  return v14;
}

- (BOOL)setAudioHardwareControlFlags:(unint64_t)a3 error:(id *)a4
{
  int v4 = a3;
  v11[0] = 1;
  int v12 = 3384;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v6 = [NSNumber numberWithUnsignedInt:as::client::api_utils::MapToMxHWCtrlFlags(v4)];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F75EE8], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (void)addCategoryOptionsToDictionary:(id)a3 category:(id)a4 options:(unint64_t)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  atomic_store(BYTE2(a5) & 1, (unsigned __int8 *)([(AVAudioSession *)self atomicImpl] + 40));
  if ((a5 & 4) != 0
    || ([v9 isEqualToString:@"AVAudioSessionCategoryPlayAndRecord"] & 1) != 0
    || [v9 isEqualToString:@"AVAudioSessionCategoryRecord"])
  {
    uint64_t v10 = [NSNumber numberWithBool:(a5 >> 2) & 1];
    [v8 setObject:v10 forKey:*MEMORY[0x1E4F75F90]];
  }
  uint64_t v11 = (as::client *)[v9 isEqualToString:@"AVAudioSessionCategoryPlayAndRecord"];
  if ((a5 & 8) != 0) {
    char v12 = (char)v11;
  }
  else {
    char v12 = 1;
  }
  if (v12)
  {
    if (((a5 >> 3) & 1 | v11) != 1) {
      goto LABEL_17;
    }
    if ((a5 & 8) == 0)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v14 = *(id *)as::client::gSessionClientLog(v11);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v33 = 136315394;
      unsigned int v34 = "AVAudioSessionClient_Common.mm";
      __int16 v35 = 1024;
      int v36 = 424;
      _os_log_impl(&dword_1A169D000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: category option 'defaultToSpeaker' is only applicable with category 'playAndRecord'", (uint8_t *)&v33, 0x12u);
    }
  }
  uint64_t v13 = @"Speaker";
LABEL_15:
  [v8 setObject:v13 forKey:*MEMORY[0x1E4F75F80]];
  if ((a5 & 8) == 0) {

  }
LABEL_17:
  if ((a5 & 2) != 0)
  {
    [v8 setObject:&unk_1EF500128 forKey:*MEMORY[0x1E4F76248]];
  }
  else
  {
    uint64_t v15 = [NSNumber numberWithUnsignedInt:16 * (a5 & 1)];
    [v8 setObject:v15 forKey:*MEMORY[0x1E4F76248]];
  }
  uint64_t v16 = [NSNumber numberWithBool:(~a5 & 0x11) == 0];
  [v8 setObject:v16 forKey:*MEMORY[0x1E4F766E0]];

  int v17 = [v9 isEqualToString:@"AVAudioSessionCategoryPlayAndRecord"];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v19 = v18;
  if ((a5 & 0x20) != 0) {
    [v18 addObject:@"HeadphonesBT"];
  }
  if ((a5 & 0x40) != 0)
  {
    [v19 addObject:@"AirTunes"];
LABEL_28:
    [v8 setObject:v19 forKey:*MEMORY[0x1E4F75E90]];
    goto LABEL_29;
  }
  char v20 = v17 ^ 1;
  if ((a5 & 0x60) != 0) {
    char v20 = 0;
  }
  if ((v20 & 1) == 0) {
    goto LABEL_28;
  }
LABEL_29:
  if ([v9 isEqualToString:@"AVAudioSessionCategoryPlayAndRecord"]) {
    goto LABEL_33;
  }
  int v21 = [v9 isEqualToString:@"AVAudioSessionCategoryMultiRoute"] ^ 1;
  if ((a5 & 0x80) != 0) {
    LOBYTE(v21) = 0;
  }
  if ((v21 & 1) == 0)
  {
LABEL_33:
    uint64_t v22 = [NSNumber numberWithBool:(a5 >> 7) & 1];
    [v8 setObject:v22 forKey:*MEMORY[0x1E4F76518]];
  }
  if (([v9 isEqualToString:@"AVAudioSessionCategoryRecord"] | v17) == 1)
  {
    unint64_t v23 = a5 & 0x20000;
    if ((a5 & 0x20000) != 0)
    {
      atomic_store(1u, (unsigned __int8 *)([(AVAudioSession *)self atomicImpl] + 43));
    }
    else
    {
      unsigned __int8 v24 = atomic_load((unsigned __int8 *)([(AVAudioSession *)self atomicImpl] + 43));
      if ((v24 & 1) == 0)
      {
LABEL_40:
        long long v28 = [(AVAudioSession *)self preferredRouteControlConfig];
        if (!v23 && ![(AVAudioSession *)self prefersEchoCancelledInput]) {
          goto LABEL_45;
        }
        {
          as::OverdubRecordingEnabled(void)::enabled = _os_feature_enabled_impl();
        }
        if (as::OverdubRecordingEnabled(void)::enabled) {
          BOOL v29 = ([v28 routeControlOptions] & 1) == 0;
        }
        else {
LABEL_45:
        }
          BOOL v29 = 0;
        int v30 = [NSNumber numberWithBool:v29];
        [v8 setObject:v30 forKey:*MEMORY[0x1E4F76548]];

        uint64_t v32 = *(id *)as::client::gSessionClientLog(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = 136315650;
          unsigned int v34 = "AVAudioSessionClient_Common.mm";
          __int16 v35 = 1024;
          int v36 = 523;
          __int16 v37 = 1024;
          int v38 = v29;
          _os_log_impl(&dword_1A169D000, v32, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting PrefersToInterruptActiveRecordingSessions to %u", (uint8_t *)&v33, 0x18u);
        }

        goto LABEL_49;
      }
    }
    uint64_t v25 = [NSNumber numberWithBool:v23 != 0];
    [v8 setObject:v25 forKey:*MEMORY[0x1E4F764E8]];

    long long v27 = *(id *)as::client::gSessionClientLog(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136315650;
      unsigned int v34 = "AVAudioSessionClient_Common.mm";
      __int16 v35 = 1024;
      int v36 = 508;
      __int16 v37 = 1024;
      int v38 = v23 >> 17;
      _os_log_impl(&dword_1A169D000, v27, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting echo cancelled input: %u", (uint8_t *)&v33, 0x18u);
    }
    goto LABEL_40;
  }
LABEL_49:
}

- (BOOL)setPreferredInputSampleRate:(double)a3 error:(id *)a4
{
  v11[0] = 1;
  int v12 = 3412;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v6 = [NSNumber numberWithDouble:a3];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76460], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)setRequiresNoAudioResources:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3339;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76138], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)setReporterID:(int64_t)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v12[0] = 1;
  int v13 = 3389;
  uint64_t v14 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v6 = [NSNumber numberWithLongLong:a3];
  v18[0] = v6;
  char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

  if (!as::client::api_utils::ServerAccessor::SetProperty(v10, (void *)*MEMORY[0x1E4F76590], v7, 1)) {
    atomic_store(a3, (unint64_t *)([(AVAudioSession *)self atomicImpl] + 8));
  }
  char v8 = FormatNSErrorForReturn();

  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v8;
}

- (int64_t)renderingMode
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v8, (void *)*MEMORY[0x1E4F75F48]);
  uint64_t v2 = (as::client::api_utils *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v2;
  if (v2)
  {
    int64_t v5 = as::client::api_utils::TranslateFromMXBadgingType(v2, v3);
  }
  else
  {
    id v6 = *(id *)as::client::gSessionClientLog(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "AVAudioSession_iOS.mm";
      __int16 v12 = 1024;
      int v13 = 4248;
      _os_log_impl(&dword_1A169D000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Get renderingMode failed", buf, 0x12u);
    }
    int64_t v5 = 0;
  }

  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return v5;
}

+ (id)retrieveSessionWithID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v16[0] = 1;
  int v17 = 3418;
  uint64_t v18 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  kdebug_trace();
  GetPendingSessionDestroySet();
  os_unfair_lock_lock((os_unfair_lock_t)&GetPendingSessionDestroySet(void)::sSet);
  uint64_t v5 = qword_1EB3B9540;
  if (!qword_1EB3B9540) {
    goto LABEL_12;
  }
  id v6 = &qword_1EB3B9540;
  do
  {
    unsigned int v7 = *(_DWORD *)(v5 + 28);
    BOOL v8 = v7 >= v3;
    if (v7 >= v3) {
      id v9 = (uint64_t *)v5;
    }
    else {
      id v9 = (uint64_t *)(v5 + 8);
    }
    if (v8) {
      id v6 = (uint64_t *)v5;
    }
    uint64_t v5 = *v9;
  }
  while (*v9);
  if (v6 != &qword_1EB3B9540 && *((_DWORD *)v6 + 7) <= v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&GetPendingSessionDestroySet(void)::sSet);
    int v13 = 0;
  }
  else
  {
LABEL_12:
    os_unfair_lock_unlock((os_unfair_lock_t)&GetPendingSessionDestroySet(void)::sSet);
    uint64_t v10 = (os_unfair_lock_s *)CADeprecated::TSingleton<avfaudio::SessionMap>::instance();
    avfaudio::SessionMap::LookupSession(v10, v3);
    uint64_t v11 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v15.receiver = a1;
      v15.super_class = (Class)&OBJC_METACLASS___AVAudioSession;
      uint64_t v11 = (AVAudioSession *)objc_msgSend(objc_msgSendSuper2(&v15, sel_allocWithZone_, 0), "initWithSessionID:", v3);
      if (v11)
      {
        __int16 v12 = (os_unfair_lock_s *)CADeprecated::TSingleton<avfaudio::SessionMap>::instance();
        avfaudio::SessionMap::AddSession(v12, v11, v3);
      }
    }
    int v13 = v11;
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v16);
  return v13;
}

- (BOOL)setParticipatesInNowPlayingAppPolicy:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3343;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76288], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)preferDecoupledIO:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3410;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76450], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)enableNotifications:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v9[0] = 1;
  int v10 = 3403;
  uint64_t v11 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  id v6 = (as::client *)kdebug_trace();
  char v7 = *(id *)as::client::gSessionClientLog(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "AVAudioSession_iOS.mm";
    __int16 v17 = 1024;
    int v18 = 4916;
    __int16 v19 = 1024;
    BOOL v20 = v4;
    _os_log_impl(&dword_1A169D000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d enableNotifications: inValue = %d", buf, 0x18u);
  }
  atomic_store(v4, (unsigned __int8 *)([(AVAudioSession *)self atomicImpl] + 41));
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return 1;
}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F75CC0]];
    [v4 privateUpdateInputGain:v3];

    id WeakRetained = v4;
  }
}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F75D18]];
    [v4 privateUpdateSpeechDetectionStyle:v3];

    id WeakRetained = v4;
  }
}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained privateUpdateInputAvailable];
  }
}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F76970]];
    [v4 privateUpdateOutputVolume:v3];

    id WeakRetained = v4;
  }
}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F75CB0]];
    [v4 privateUpdateAudioFormats:v3];

    id WeakRetained = v4;
  }
}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F74FE0]];
    uint64_t v3 = [NSNumber numberWithUnsignedInteger:TranslateMXVoicePromptStyleToAVASVoicePromptStyle(v2)];
    [WeakRetained privateUpdatePromptStyle:v3];
  }
}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F75CE8]];
    [v4 privateUpdateInputChannelCount:v3];

    id WeakRetained = v4;
  }
}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F75CF0]];
    [v4 privateUpdateOutputChannelCount:v3];

    id WeakRetained = v4;
  }
}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F75CB8]];
    [v4 privateHandleBadgeTypeChange:v3];

    id WeakRetained = v4;
  }
}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained privateInputMuteWithInfo:*(void *)(a1 + 32) accessor:a1 + 48];
  }
}

- (BOOL)isPropertyCached:(id)a3
{
  id v4 = (NSString *)a3;
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  BOOL isPropertyCached = as::client::cache_util::CacheManager::isPropertyCached(*(os_unfair_lock_s **)(v8 + 176), v4);
  if (v7) {
    os_unfair_recursive_lock_unlock();
  }

  return isPropertyCached;
}

- (id)cachedPropertyValue:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = (NSString *)a3;
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  as::client::cache_util::CacheManager::getCachedValue(*(os_unfair_lock_s **)(v11 + 176), v4, (uint64_t)&v8);
  uint64_t v5 = [NSNumber numberWithInt:v8];
  v12[0] = v5;
  v12[1] = v9;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  if (v10) {
    os_unfair_recursive_lock_unlock();
  }

  return v6;
}

- (void)invalidateCache
{
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  as::client::cache_util::CacheManager::invalidateCache(*(os_unfair_lock_t *)(v3 + 176));
  if (v2) {
    os_unfair_recursive_lock_unlock();
  }
}

- (void)addToCache:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  as::client::cache_util::CacheManager::updateCache(*(os_unfair_lock_s **)(v9 + 176), v6, v7);
  if (v8) {
    os_unfair_recursive_lock_unlock();
  }
}

- (BOOL)privateRequiresWatchOSRoutePicker:(unint64_t)a3 accessor:(const void *)a4
{
  return 0;
}

- (BOOL)privateHandleWatchOSActivationAfterRoutePickerSelection:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5 accessor:(const void *)a6
{
  return a3
      && [(AVAudioSession *)self privateSetActive:1 withOptions:a4 error:a5 accessor:a6];
}

- (AVAudioSession)init
{
  uint64_t v2 = self;
  if (avfaudio::gAVAudioSession)
  {

    uint64_t v2 = 0;
  }
  uint64_t v3 = +[AVAudioSession sharedInstance];

  return v3;
}

void __55__AVAudioSession_privateCreateSessionInServerUsingXPC___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5)
      {
        uint64_t v6 = *(void *)(v5 + 24);
        if (!v6) {
          std::__throw_bad_function_call[abi:ne180100]();
        }
        (*(void (**)(uint64_t))(*(void *)v6 + 48))(v6);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
}

- (BOOL)privateRecreateSessionInServerUsingXPC
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  PerformanceTracker::PerformanceTracker((uint64_t)v55, (uint64_t)"-[AVAudioSession privateRecreateSessionInServerUsingXPC]", 0, 1);
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  id v4 = (as::client::XPCConnection *)*((void *)v54 + 6);
  uint64_t v3 = (std::__shared_weak_count *)*((void *)v54 + 7);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v46 = v3;
  as::client::XPCConnection::sync_message<unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int>(v4, (uint64_t)&v64);
  uint64_t v5 = (void *)MEMORY[0x1A6235350]();
  uint64_t v6 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int>::sync_proxy(&v64);
  uint64_t v7 = *((void *)v54 + 2);
  long long v8 = *(_OWORD *)((char *)v54 + 300);
  v52[0] = *(_OWORD *)((char *)v54 + 284);
  v52[1] = v8;
  uint64_t v9 = *((unsigned int *)v54 + 6);
  uint64_t v10 = *((void *)v54 + 40);
  uint64_t v11 = *((void *)v54 + 41);
  uint64_t v12 = *((unsigned int *)v54 + 84);
  uint64_t v13 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int>::reply((uint64_t)&v64);
  [v6 createSession:v7 sourceAuditToken:v52 sourceSessionID:v9 nameOrDeviceUID:v10 clientProcessName:v11 useCaseIdentifier:v12 reply:v13];

  id v15 = v66;
  if (v66)
  {
    uint64_t v16 = *(id *)as::client::gSessionClientLog(v14);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v59 = "AVAudioSession_iOS.mm";
      __int16 v60 = 1024;
      int v61 = 1361;
      __int16 v62 = 2048;
      *(void *)id v63 = self;
      _os_log_impl(&dword_1A169D000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to retrieve session after session restart, session %p", buf, 0x1Cu);
    }
    char v57 = 1;
  }
  else
  {
    unsigned int v17 = v67;
    int v18 = v70;
    __int16 v19 = *(id *)as::client::gSessionClientLog(v14);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v59 = "AVAudioSession_iOS.mm";
      __int16 v60 = 1024;
      int v61 = 1283;
      __int16 v62 = 1024;
      *(_DWORD *)id v63 = v17;
      _os_log_impl(&dword_1A169D000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Recreated session with ID: 0x%x", buf, 0x18u);
    }
    AVAudioSessionImpl::setSessionID(v54, v17);
    *((_DWORD *)v54 + 6) = v18;
    BOOL v20 = as::client::XPCConnection::getConnection(v4);
    unsigned int v21 = [v20 processIdentifier];

    uint64_t v22 = (as::client::DeviceTimeGlobalState *)v68;
    unint64_t v23 = v22;
    if (v22)
    {
      unsigned __int8 v24 = as::client::DeviceTimeGlobalState::instance(v22);
      as::client::DeviceTimeGlobalState::obtainedNewSharedBlock((uint64_t)v24, v21, v23);
      uint64_t v25 = v69;
      long long v26 = v54;
      *((_DWORD *)v54 + 48) = v69;
      atomic_store(v25, (unsigned int *)(*((void *)v26 + 25) + 16));
      atomic_store(v25, (unsigned int *)(*((void *)v26 + 27) + 16));
      long long v27 = (void *)*((void *)v26 + 31);
      if (v27)
      {
        [v27 setTimingSlot:v25];
        long long v26 = v54;
      }
      long long v28 = (void *)*((void *)v26 + 32);
      if (v28) {
        [v28 setTimingSlot:v25];
      }
    }

    BOOL v29 = v54;
    int v30 = (std::__shared_weak_count *)*((void *)v54 + 10);
    id v50 = (int *)*((void *)v54 + 9);
    id v51 = v30;
    if (v30)
    {
      atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
      BOOL v29 = v54;
    }
    if (*((void *)v29 + 2) != 1702392942)
    {
      uint64_t v31 = (os_unfair_lock_s *)CADeprecated::TSingleton<avfaudio::SessionMap>::instance();
      avfaudio::SessionMap::UpdateSessionID(v31, self, v17);
      {
        as::AudioSessionMuteEnabled(void)::enabled = _os_feature_enabled_impl();
      }
      if (as::AudioSessionMuteEnabled(void)::enabled)
      {
        uint64_t v32 = *((unsigned __int8 *)v54 + 144);
        id v49 = 0;
        BOOL v33 = [(AVAudioSession *)self muteSessionInput:v32 error:&v49];
        unsigned int v34 = (as::client *)v49;
        __int16 v35 = v34;
        if (!v33)
        {
          int v36 = *(id *)as::client::gSessionClientLog(v34);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            int v37 = *((unsigned __int8 *)v54 + 144);
            int v38 = [(as::client *)v35 description];
            *(_DWORD *)buf = 136315906;
            __int16 v59 = "AVAudioSession_iOS.mm";
            __int16 v60 = 1024;
            int v61 = 1312;
            __int16 v62 = 1024;
            *(_DWORD *)id v63 = v37;
            *(_WORD *)&v63[4] = 2112;
            *(void *)&v63[6] = v38;
            _os_log_impl(&dword_1A169D000, v36, OS_LOG_TYPE_DEFAULT, "%25s:%-5d failed to re-apply mute state, muted: %d, err: %@", buf, 0x22u);
          }
        }
      }
      else
      {
        __int16 v35 = 0;
      }
      uint64_t v39 = (os_unfair_lock_s *)*((void *)v50 + 5);
      os_unfair_lock_lock(v39);
      as::client::NotificationStateManager::GetNotificationStateForType((uint64_t)&v39[2], 2uLL, 0, &v47);
      if (v39) {
        os_unfair_lock_unlock(v39);
      }
      if (v47)
      {
        uint64_t v40 = as::client::AVAudioSessionNotificationState::RegisterAllMXNotificationsWithServer(v47, &v50);
        if ((v40 & 1) == 0)
        {
          int v41 = *(id *)as::client::gSessionClientLog((as::client *)v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v59 = "AVAudioSession_iOS.mm";
            __int16 v60 = 1024;
            int v61 = 1338;
            __int16 v62 = 2048;
            *(void *)id v63 = self;
            _os_log_impl(&dword_1A169D000, v41, OS_LOG_TYPE_ERROR, "%25s:%-5d Error with RegisterAllNotificationsWithServer, session %p", buf, 0x1Cu);
          }
        }
      }
      uint64_t v42 = +[AVAudioSession sharedInstance];
      BOOL v43 = [v42 privateShouldSubscribeToMicrophoneInjectionCapabilityChangeNotification] == 0;

      if (!v43)
      {
        uint64_t v44 = +[AVAudioSession sharedInstance];
        [v44 privateSubscribeToMicrophoneInjectionCapabilityChangeNotification];
      }
      [(AVAudioSession *)self privateResetCachedPropertyValues:&v50];
      {
        as::ClientSideCachingEnabled(void)::enabled = _os_feature_enabled_impl();
      }
      if (as::ClientSideCachingEnabled(void)::enabled) {
        as::client::cache_util::CacheManager::invalidateCache(*((os_unfair_lock_t *)v54 + 22));
      }
      as::client::AVAudioSessionDaemonsStateManager::processServiceReset((uint64_t)v54 + 88, @"audiomxd", &v50);
      [(AVAudioSession *)self privateDispatchPing:&v50];
      if (v48) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v48);
      }
    }
    int64_t v56 = [(AVAudioSession *)self getCachedOrFromServerReporterID:&v50];
    if (v51) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v51);
    }
  }

  std::__function::__value_func<void ()(NSError *,std::tuple<unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int> &&)>::~__value_func[abi:ne180100](v65);
  if (v46) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v46);
  }
  if (v53) {
    os_unfair_recursive_lock_unlock();
  }
  PerformanceTracker::~PerformanceTracker((PerformanceTracker *)v55);
  return v15 == 0;
}

- (AVAudioSession)initWithSessionID:(unsigned int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  PerformanceTracker::PerformanceTracker((uint64_t)v13, (uint64_t)"-[AVAudioSession initWithSessionID:]", 0, 1);
  std::mutex::lock(&GetSessionInitMutex(void)::sMutex);
  uint64_t v5 = (os_unfair_lock_s *)CADeprecated::TSingleton<avfaudio::SessionMap>::instance();
  uint64_t v6 = avfaudio::SessionMap::LookupSession(v5, a3);
  uint64_t v7 = v6;
  if (v6)
  {
    unint64_t v8 = atomic_load((unint64_t *)([v6 atomicImpl] + 8));
    unint64_t v14 = v8;
    uint64_t v9 = v7;

    uint64_t v10 = v9;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)AVAudioSession;
    uint64_t v10 = [(AVAudioSession *)&v12 init];
    if (v10) {
      operator new();
    }
  }

  std::mutex::unlock(&GetSessionInitMutex(void)::sMutex);
  PerformanceTracker::~PerformanceTracker((PerformanceTracker *)v13);
  return v10;
}

+ (id)primarySession
{
  return +[AVAudioSession sharedInstance];
}

- (AVAudioSession)initWithIsolatedAudioUseCaseID:(unsigned int)a3
{
  uint64_t v3 = self;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = *(void *)&a3;
    uint64_t v5 = *(id *)as::client::gSessionClientLog((as::client *)self);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315650;
      uint64_t v11 = "AVAudioSession_iOS.mm";
      __int16 v12 = 1024;
      int v13 = 1608;
      __int16 v14 = 1024;
      int v15 = v4;
      _os_log_impl(&dword_1A169D000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Creating secure session for use case id: %d", (uint8_t *)&v10, 0x18u);
    }
    uint64_t v6 = objc_opt_new();
    [v6 setSessionType:1935897189];
    [v6 setUseCaseIdentifier:v4];
    [v6 setAutoReconnect:1];
    uint64_t v3 = [(AVAudioSession *)v3 initWithSpecification:v6];

    uint64_t v7 = v3;
  }
  else
  {
    unint64_t v8 = *(id *)as::client::gSessionClientLog((as::client *)self);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      uint64_t v11 = "AVAudioSession_iOS.mm";
      __int16 v12 = 1024;
      int v13 = 1604;
      _os_log_impl(&dword_1A169D000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot create secure session: Invalid useCaseID", (uint8_t *)&v10, 0x12u);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)registerPublishingSessionNotifications:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(AVAudioSession *)self privateGetGuardOfImplementation];
    objc_storeWeak((id *)(*(void *)&v6[8] + 64), v4);
    if (*(void *)v6) {
      os_unfair_recursive_lock_unlock();
    }
  }
  else
  {
    uint64_t v5 = *(id *)as::client::gSessionClientLog(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v6 = 136315394;
      *(void *)&void v6[4] = "AVAudioSession_iOS.mm";
      *(_WORD *)&v6[12] = 1024;
      *(_DWORD *)&v6[14] = 1619;
      _os_log_impl(&dword_1A169D000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid object passed.", v6, 0x12u);
    }
  }
}

- (AVAudioSession)initWithSiriEndpointIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (as::client *)a3;
  uint64_t v5 = v4;
  if (v4 && (id v4 = (as::client *)[(as::client *)v4 length]) != 0)
  {
    uint64_t v6 = *(id *)as::client::gSessionClientLog(v4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315650;
      __int16 v12 = "AVAudioSession_iOS.mm";
      __int16 v13 = 1024;
      int v14 = 1633;
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1A169D000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d Creating side kick session for end point id: %@", (uint8_t *)&v11, 0x1Cu);
    }
    uint64_t v7 = objc_opt_new();
    [v7 setSessionType:1936286827];
    [v7 setClientIdentifier:v5];
    [v7 setAutoReconnect:1];
    self = [(AVAudioSession *)self initWithSpecification:v7];

    unint64_t v8 = self;
  }
  else
  {
    uint64_t v9 = *(id *)as::client::gSessionClientLog(v4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      __int16 v12 = "AVAudioSession_iOS.mm";
      __int16 v13 = 1024;
      int v14 = 1629;
      _os_log_impl(&dword_1A169D000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot create side kick session: Invalid device ID", (uint8_t *)&v11, 0x12u);
    }
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  void v19[4] = *MEMORY[0x1E4F143B8];
  if (self->_impl && ![(AVAudioSession *)self isPrimary])
  {
    [(AVAudioSession *)self privateGetGuardOfImplementation];
    uint64_t v3 = (void *)v19[0];
    id v4 = *(std::__shared_weak_count **)(v19[0] + 128);
    *(void *)(v19[0] + 120) = 0;
    v3[16] = 0;
    if (v4)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      uint64_t v3 = (void *)v19[0];
    }
    uint64_t v6 = (unsigned int *)v3[9];
    uint64_t v5 = (std::__shared_weak_count *)v3[10];
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v18) {
      os_unfair_recursive_lock_unlock();
    }
    if ([(AVAudioSession *)self sessionType] != 1702392942)
    {
      uint64_t v7 = (as::client::XPCConnection *)*((void *)v6 + 7);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3321888768;
      v14[2] = __25__AVAudioSession_dealloc__block_invoke;
      v14[3] = &__block_descriptor_48_ea8_32c65_ZTSNSt3__110shared_ptrIKN2as6client9api_utils14ServerAccessorEEE_e21_v24__0__NSError_8_v16l;
      v14[4] = v6;
      __int16 v15 = v5;
      if (v5) {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v17 = 0;
      v16[0] = &unk_1EF4FBA18;
      v16[1] = MEMORY[0x1A6235570](v14);
      uint64_t v17 = v16;
      as::client::XPCConnection::message<>(v7, (uint64_t)v16, &v18);
      _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v16);
      GetPendingSessionDestroySet();
      os_unfair_lock_lock((os_unfair_lock_t)&GetPendingSessionDestroySet(void)::sSet);
      std::__tree<unsigned int>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t **)&qword_1EB3B9538, v6, v6);
      os_unfair_lock_unlock((os_unfair_lock_t)&GetPendingSessionDestroySet(void)::sSet);
      unint64_t v8 = (void *)MEMORY[0x1A6235350]();
      uint64_t v9 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::async_proxy(&v18);
      uint64_t v10 = *v6;
      int v11 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v18);
      [v9 destroySession:v10 reply:v11];

      _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v19);

      if (v15) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v15);
      }
    }
    impl = (char *)self->_impl;
    if (impl)
    {
      AVAudioSessionImpl::~AVAudioSessionImpl((AVAudioSessionImpl *)(impl + 8));
      MEMORY[0x1A6235030](impl, 0x10E0C401A66470FLL);
    }
    self->_impl = 0;
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)AVAudioSession;
  [(AVAudioSession *)&v13 dealloc];
}

void __25__AVAudioSession_dealloc__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (*(void *)(*(void *)(a1 + 32) + 8) != 1935830119)
    {
      uint64_t v5 = *(id *)as::client::gSessionClientLog(v3);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315650;
        uint64_t v7 = "AVAudioSession_iOS.mm";
        __int16 v8 = 1024;
        int v9 = 1669;
        __int16 v10 = 2112;
        int v11 = v4;
        _os_log_impl(&dword_1A169D000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Server returned an error from destroySession:. %@", (uint8_t *)&v6, 0x1Cu);
      }
    }
  }
  GetPendingSessionDestroySet();
  os_unfair_lock_lock((os_unfair_lock_t)&GetPendingSessionDestroySet(void)::sSet);
  std::__tree<unsigned int>::__erase_unique<unsigned int>((uint64_t)&qword_1EB3B9538, *(unsigned int **)(a1 + 32));
  os_unfair_lock_unlock((os_unfair_lock_t)&GetPendingSessionDestroySet(void)::sSet);
}

+ (BOOL)categoryEnablesInput:(id)a3
{
  return as::CategoryRequiresInput((as *)a3, (NSString *)a2);
}

- (AVAudioSessionCategoryOptions)categoryOptions
{
  uint64_t v2 = self;
  v22[0] = 1;
  int v23 = 3074;
  uint64_t v24 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  kdebug_trace();
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)([(AVAudioSession *)v2 atomicImpl] + 40));
  [(AVAudioSession *)v2 accessor];
  LODWORD(v2) = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v20, (void *)*MEMORY[0x1E4F76248], 1);
  int Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v20, (void *)*MEMORY[0x1E4F75F90], 1);
  LODWORD(v5) = (v2 >> 4) & 1;
  if ((v2 & 0x20) != 0) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = v5;
  }
  if (Property_DefaultTo) {
    unint64_t v6 = ((unint64_t)(v3 & 1) << 16) | v5 | 4;
  }
  else {
    unint64_t v6 = ((unint64_t)(v3 & 1) << 16) | v5;
  }
  uint64_t v7 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v20, (void *)*MEMORY[0x1E4F75F80]);
  __int16 v8 = v7;
  if (v7 && [v7 isEqualToString:@"Speaker"]) {
    v6 |= 8uLL;
  }
  if (as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v20, (void *)*MEMORY[0x1E4F766E0], 1))uint64_t v9 = v6 | 0x11; {
  else
  }
    uint64_t v9 = v6;
  __int16 v10 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray * {__strong}>(v20, (void *)*MEMORY[0x1E4F75E90]);
  int v11 = v10;
  if (v10)
  {
    int v12 = [v10 containsObject:@"HeadphonesBT"];
    int v13 = [v11 containsObject:@"AirTunes"];
    uint64_t v14 = v9 | 0x20;
    if (!v12) {
      uint64_t v14 = v9;
    }
    if (v13) {
      uint64_t v9 = v14 | 0x40;
    }
    else {
      uint64_t v9 = v14;
    }
  }
  int v15 = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v20, (void *)*MEMORY[0x1E4F76518], 1);
  BOOL v16 = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v20, (void *)*MEMORY[0x1E4F76198], 1);

  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  uint64_t v17 = v9 | 0x80;
  if (!v15) {
    uint64_t v17 = v9;
  }
  if (v16) {
    AVAudioSessionCategoryOptions v18 = v17 | 0x20000;
  }
  else {
    AVAudioSessionCategoryOptions v18 = v17;
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v22);
  return v18;
}

- (NSArray)availableCategories
{
  v8[2] = *MEMORY[0x1E4F143B8];
  if ([(AVAudioSession *)self sessionType] == 1936286827)
  {
    v8[0] = @"AVAudioSessionCategoryAlarm";
    v8[1] = @"AVAudioSessionCategoryPlayback";
    uint64_t v2 = (void *)MEMORY[0x1E4F1C978];
    unsigned __int8 v3 = v8;
    uint64_t v4 = 2;
  }
  else
  {
    v7[0] = @"AVAudioSessionCategoryAmbient";
    v7[1] = @"AVAudioSessionCategorySoloAmbient";
    v7[2] = @"AVAudioSessionCategoryPlayback";
    v7[3] = @"AVAudioSessionCategoryRecord";
    char v7[4] = @"AVAudioSessionCategoryPlayAndRecord";
    v7[5] = @"AVAudioSessionCategoryMultiRoute";
    uint64_t v2 = (void *)MEMORY[0x1E4F1C978];
    unsigned __int8 v3 = v7;
    uint64_t v4 = 6;
  }
  uint64_t v5 = [v2 arrayWithObjects:v3 count:v4];
  return (NSArray *)v5;
}

- (BOOL)setCategory:(AVAudioSessionCategory)category withOptions:(AVAudioSessionCategoryOptions)options error:(NSError *)outError
{
  uint64_t v7 = category;
  [(AVAudioSession *)self accessor];
  [(AVAudioSession *)self privateSetCategoryWithOptions:v7 modes:0 routeSharingPolicy:-1 options:options accessor:&v10];
  char v8 = FormatNSErrorForReturn();
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }

  return v8;
}

- (BOOL)setCategoryOptions:(unint64_t)a3 error:(id *)a4
{
  v12[0] = 1;
  int v13 = 3443;
  uint64_t v14 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  kdebug_trace();
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(AVAudioSession *)self accessor];
  uint64_t v7 = [(AVAudioSession *)self privateGetCategory:&v10];
  [(AVAudioSession *)self addCategoryOptionsToDictionary:v6 category:v7 options:a3];
  as::client::api_utils::ServerAccessor::SetBatchProperties(v10, v6, 0, 1, 1, 0);
  char v8 = FormatNSErrorForReturn();

  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v8;
}

- (void)activateWithOptions:(AVAudioSessionActivationOptions)options completionHandler:(void *)handler
{
  void v34[4] = *MEMORY[0x1E4F143B8];
  id v6 = handler;
  LODWORD(v33) = 3089;
  unsigned int v28 = [(AVAudioSession *)self opaqueSessionID];
  std::allocate_shared[abi:ne180100]<as::ScopedTrace,std::allocator<as::ScopedTrace>,as::AudioSessionTraceCode,unsigned int,void>((int *)&v33, &v28, &v29);
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)([(AVAudioSession *)self atomicImpl] + 42));
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  uint64_t v9 = *(as::client::XPCConnection **)(v34[0] + 48);
  char v8 = *(std::__shared_weak_count **)(v34[0] + 56);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = v7 & 1;
  if (v33) {
    os_unfair_recursive_lock_unlock();
  }
  AVAudioSessionActivationOptions v11 = options | (v10 << 26);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3321888768;
  BOOL v20 = __56__AVAudioSession_activateWithOptions_completionHandler___block_invoke;
  unsigned int v21 = &unk_1EF4FB5E8;
  uint64_t v22 = self;
  uint64_t v24 = v29;
  uint64_t v25 = v30;
  if (v30) {
    atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v26 = 0;
  AVAudioSessionActivationOptions v27 = v11;
  id v12 = v6;
  id v23 = v12;
  uint64_t v32 = 0;
  v31[0] = &unk_1EF4FBA18;
  v31[1] = MEMORY[0x1A6235570](&v18);
  uint64_t v32 = v31;
  as::client::XPCConnection::message<>(v9, (uint64_t)v31, &v33);
  int v13 = _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v31);
  uint64_t v14 = (void *)MEMORY[0x1A6235350](v13);
  uint64_t v15 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::async_proxy(&v33);
  uint64_t v16 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v17 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v33);
  [v15 activateSession:v16 options:v11 deviceInfo:0 requestID:0 reply:v17];

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v34);

  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
}

void __56__AVAudioSession_activateWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v4 = (void *)[v4 accessor];
  }
  else
  {
    uint64_t v26 = 0;
    AVAudioSessionActivationOptions v27 = 0;
  }
  uint64_t v5 = *(std::__shared_weak_count **)(a1 + 56);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v3)
  {
    id v12 = *(id *)as::client::gSessionClientLog((as::client *)v4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [*(id *)(a1 + 32) opaqueSessionID];
      *(_DWORD *)buf = 136315650;
      uint64_t v29 = "AVAudioSession_iOS.mm";
      __int16 v30 = 1024;
      int v31 = 2015;
      __int16 v32 = 1024;
      LODWORD(v33) = v13;
      _os_log_impl(&dword_1A169D000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Activated session 0x%x", buf, 0x18u);
    }

    if (*(void *)(a1 + 64) && (objc_opt_respondsToSelector() & 1) != 0) {
      [*(id *)(a1 + 64) requestSessionForNetworkStreamingInitialization];
    }
    goto LABEL_25;
  }
  id v6 = *(id *)as::client::gSessionClientLog((as::client *)v4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v29 = "AVAudioSession_iOS.mm";
    __int16 v30 = 1024;
    int v31 = 1983;
    __int16 v32 = 2112;
    id v33 = v3;
    _os_log_impl(&dword_1A169D000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Server returned an error:. %@", buf, 0x1Cu);
  }
  if (!*(void *)(a1 + 64)
    || ![*(id *)(a1 + 32) privateRequiresWatchOSRoutePicker:*(void *)(a1 + 72) accessor:&v26])
  {
LABEL_25:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_26;
  }
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3321888768;
  uint64_t v16 = __56__AVAudioSession_activateWithOptions_completionHandler___block_invoke_122;
  uint64_t v17 = &unk_1EF4FB620;
  unsigned __int8 v7 = *(std::__shared_weak_count **)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 48);
  unsigned int v21 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v22 = v8;
  uint64_t v23 = v26;
  uint64_t v24 = v27;
  if (v27) {
    atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v9 = (id *)(a1 + 64);
  uint64_t v25 = v10;
  id v19 = *(v9 - 3);
  AVAudioSessionActivationOptions v11 = (void *)MEMORY[0x1A6235570](&v14);
  objc_msgSend(*v9, "presentRoutePickerAlertWithOptions:completionHandler:", 0, v11, v14, v15, v16, v17, v18);

  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
LABEL_26:
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
}

void __56__AVAudioSession_activateWithOptions_completionHandler___block_invoke_122(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(std::__shared_weak_count **)(a1 + 56);
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unsigned __int8 v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 64);
  id v11 = 0;
  int v9 = [v7 privateHandleWatchOSActivationAfterRoutePickerSelection:a2 options:v8 error:&v11 accessor:a1 + 72];
  id v10 = v11;
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(a1 + 88) requestSessionForNetworkStreamingInitialization];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

- (BOOL)deactivateAndSetInterruptionPriority:(int64_t)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v19[0] = 1;
  int v20 = 3419;
  uint64_t v21 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::XPCConnection::sync_message<>(v17[7], &v31);
  unsigned __int8 v7 = (void *)MEMORY[0x1A6235350]();
  uint64_t v8 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v31);
  uint64_t v9 = *(unsigned int *)v17;
  id v10 = [NSNumber numberWithInteger:a3];
  id v11 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v31);
  [v8 deactivateSession:v9 options:0 priority:v10 requestID:0 reply:v11];

  id v13 = v33;
  if (v33)
  {
    if (a4) {
      *a4 = v33;
    }
  }
  else
  {
    uint64_t v14 = *(id *)as::client::gSessionClientLog(v12);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = *(_DWORD *)v17;
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = "AVAudioSession_iOS.mm";
      __int16 v27 = 1024;
      int v28 = 2075;
      __int16 v29 = 1024;
      int v30 = v15;
      _os_log_impl(&dword_1A169D000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Deactivated session 0x%x", buf, 0x18u);
    }
    as::client::KVOManager::markPropertiesDirtyAll(v17[3]);
  }

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v32);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v19);
  return v13 == 0;
}

void __42__AVAudioSession_requestRecordPermission___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(id *)as::client::gSessionClientLog((as::client *)a1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVAudioSession_iOS.mm";
    __int16 v23 = 1024;
    int v24 = 2154;
    __int16 v25 = 1024;
    BOOL v26 = a2 == 2;
    _os_log_impl(&dword_1A169D000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Got Permission value %d", buf, 0x18u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained accessor];
    as::client::XPCConnection::sync_message<>(*(as::client::XPCConnection **)(v14 + 56), buf);
    unsigned __int8 v7 = (void *)MEMORY[0x1A6235350]();
    uint64_t v8 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy((void **)buf);
    uint64_t v9 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)buf);
    [v8 updateMicrophonePermission:1919119972 reply:v9];

    if (v27)
    {
      id v11 = *(id *)as::client::gSessionClientLog(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = v27;
        *(_DWORD *)uint64_t v16 = 136315650;
        uint64_t v17 = "AVAudioSession_iOS.mm";
        __int16 v18 = 1024;
        int v19 = 2169;
        __int16 v20 = 2112;
        id v21 = v12;
        _os_log_impl(&dword_1A169D000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Server returned an error from -updateMicrophonePermission:. %@", v16, 0x1Cu);
      }
    }

    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(&buf[8]);
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }
  else
  {
    id v13 = *(id *)as::client::gSessionClientLog(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioSession_iOS.mm";
      __int16 v23 = 1024;
      int v24 = 2173;
      _os_log_impl(&dword_1A169D000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d Session object is no longer valid while returning TCC permission value", buf, 0x12u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)setPreferredSampleRate:(double)sampleRate error:(NSError *)outError
{
  id v22[2] = *MEMORY[0x1E4F143B8];
  v15[0] = 1;
  int v16 = 3090;
  uint64_t v17 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v6 = (id)*MEMORY[0x1E4F76460];
  v21[0] = v6;
  unsigned __int8 v7 = [NSNumber numberWithDouble:sampleRate];
  v22[0] = v7;
  id v8 = (id)*MEMORY[0x1E4F76498];
  v21[1] = v8;
  uint64_t v9 = [NSNumber numberWithDouble:sampleRate];
  v22[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  as::client::api_utils::ServerAccessor::SetBatchProperties(v13, v10, 0, 1, 1, 0);
  char v11 = FormatNSErrorForReturn();

  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v15);
  return v11;
}

- (BOOL)setPreferredIOBufferDuration:(NSTimeInterval)duration error:(NSError *)outError
{
  v11[0] = 1;
  int v12 = 3092;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v6 = [NSNumber numberWithDouble:duration];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76428], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)setInterruptionPriority:(int64_t)a3 error:(id *)a4
{
  v11[0] = 1;
  int v12 = 3380;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v6 = [NSNumber numberWithInteger:a3];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F75FC8], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)setPreferredInputNumberOfChannels:(NSInteger)count error:(NSError *)outError
{
  v11[0] = 1;
  int v12 = 3094;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v6 = [NSNumber numberWithInteger:count];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76480], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)setPreferredOutputNumberOfChannels:(NSInteger)count error:(NSError *)outError
{
  v11[0] = 1;
  int v12 = 3096;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v6 = [NSNumber numberWithUnsignedInt:count];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76490], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)setInputGain:(float)gain error:(NSError *)outError
{
  v16[0] = 1;
  int v17 = 3103;
  uint64_t v18 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  *(float *)&double v6 = gain;
  char v7 = [NSNumber numberWithFloat:v6];
  id v8 = (void *)*MEMORY[0x1E4F76228];
  int v9 = as::client::api_utils::ServerAccessor::SetProperty(v14, (void *)*MEMORY[0x1E4F76228], v7, 1);

  if (!v9)
  {
    *(float *)&double v10 = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>((os_unfair_lock_s **)v14, v8, 1);
    char v11 = [NSNumber numberWithFloat:v10];
    [(AVAudioSession *)self privateUpdateInputGain:v11];
  }
  char v12 = FormatNSErrorForReturn();
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v16);
  return v12;
}

- (BOOL)setInputDataSource:(AVAudioSessionDataSourceDescription *)dataSource error:(NSError *)outError
{
  double v6 = dataSource;
  v15[0] = 1;
  int v16 = 3109;
  uint64_t v17 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  kdebug_trace();
  char v7 = [(AVAudioSession *)self currentRoute];
  id v8 = [v7 inputs];

  if ([v8 count])
  {
    int v9 = [v8 objectAtIndex:0];
  }
  else
  {
    int v9 = 0;
  }
  int v10 = [v9 setPreferredDataSource:v6 error:outError];
  if (v10)
  {
    [(AVAudioSession *)self accessor];
    uint64_t v11 = *(void *)(v13 + 24);
    os_unfair_recursive_lock_lock_with_options();
    *(unsigned char *)(v11 + 144) = 1;
    os_unfair_recursive_lock_unlock();
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v15);
  return v10;
}

- (BOOL)setOutputDataSource:(AVAudioSessionDataSourceDescription *)dataSource error:(NSError *)outError
{
  double v6 = dataSource;
  v17[0] = 1;
  int v18 = 3112;
  uint64_t v19 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  kdebug_trace();
  char v7 = [(AVAudioSession *)self currentRoute];
  id v8 = [v7 outputs];
  if ([v8 count])
  {
    int v9 = [(AVAudioSession *)self currentRoute];
    int v10 = [v9 outputs];
    uint64_t v11 = [v10 objectAtIndex:0];
  }
  else
  {
    uint64_t v11 = 0;
  }

  int v12 = [v11 setPreferredDataSource:v6 error:outError];
  if (v12)
  {
    [(AVAudioSession *)self accessor];
    uint64_t v13 = *(void *)(v15 + 24);
    os_unfair_recursive_lock_lock_with_options();
    *(unsigned char *)(v13 + 192) = 1;
    os_unfair_recursive_lock_unlock();
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);
  return v12;
}

- (BOOL)setPreferredInputOrientation:(AVAudioStereoOrientation)orientation error:(NSError *)outError
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(AVAudioSession *)self accessor];
  v12[0] = 1;
  int v13 = 3098;
  uint64_t v14 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  double v6 = (as::client *)kdebug_trace();
  if ((unint64_t)(orientation - 1) > 3)
  {
    int v9 = *(id *)as::client::gSessionClientLog(v6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "AVAudioSession_iOS.mm";
      __int16 v22 = 1024;
      int v23 = 2313;
      _os_log_impl(&dword_1A169D000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid value for input orientation.", buf, 0x12u);
    }
    char v8 = FormatNSErrorForReturn();
  }
  else
  {
    char v7 = [NSNumber numberWithInteger:orientation];
    as::client::api_utils::ServerAccessor::SetProperty(v18, (void *)*MEMORY[0x1E4F764C8], v7, 1);

    char v8 = FormatNSErrorForReturn();
  }
  BOOL v10 = v8;
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  return v10;
}

- (AVAudioStereoOrientation)preferredInputOrientation
{
  [(AVAudioSession *)self accessor];
  v5[0] = 1;
  int v6 = 3099;
  uint64_t v7 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  kdebug_trace();
  unsigned int Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v11, (void *)*MEMORY[0x1E4F764C8], 1);
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v5);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  return (unint64_t)Property_DefaultTo;
}

- (AVAudioStereoOrientation)inputOrientation
{
  [(AVAudioSession *)self accessor];
  v5[0] = 1;
  int v6 = 3100;
  uint64_t v7 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  kdebug_trace();
  unsigned int Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v11, (void *)*MEMORY[0x1E4F760B0], 1);
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v5);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  return (unint64_t)Property_DefaultTo;
}

- (float)outputVolume
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E4F76698], 1);
}

- (AVAudioSessionPromptStyle)promptStyle
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v8[0] = 1;
  int v9 = 3122;
  uint64_t v10 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = *(void *)(v6 + 24);
  v14[0] = &unk_1EF4FBAA8;
  v14[1] = &v6;
  v14[3] = v14;
  unsigned int updated = as::client::KVOProperty<unsigned int>::UpdateIfDirty(v3 + 296, (uint64_t)v14);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](v14);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v8);
  return (unint64_t)updated;
}

- (BOOL)setAllowHapticsAndSystemSoundsDuringRecording:(BOOL)inValue error:(NSError *)outError
{
  BOOL v4 = inValue;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v13[0] = 1;
  int v14 = 3078;
  uint64_t v15 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v6 = (as::client *)kdebug_trace();
  uint64_t v7 = *(id *)as::client::gSessionClientLog(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = "FALSE";
    *(void *)&uint8_t buf[4] = "AVAudioSession_iOS.mm";
    *(_DWORD *)buf = 136315650;
    if (v4) {
      uint64_t v8 = "TRUE";
    }
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2366;
    __int16 v20 = 2080;
    uint64_t v21 = v8;
    _os_log_impl(&dword_1A169D000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d ---> %s", buf, 0x1Cu);
  }
  [(AVAudioSession *)self accessor];
  int v9 = *(as::client::cache_util::CacheManager ***)buf;
  uint64_t v10 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F75E80], v10, 1);

  char v11 = FormatNSErrorForReturn();
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v11;
}

- (BOOL)allowHapticsAndSystemSoundsDuringRecording
{
  v7[0] = 1;
  int v8 = 3079;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F75E80], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (id)audioFormats
{
  return as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray * {__strong}>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E4F763C8]);
}

- (void)privateSubscribeToMicrophoneInjectionCapabilityChangeNotification
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v4 = [v3 bundleIdentifier];

  uint64_t v6 = *(id *)as::client::gSessionClientLog(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVAudioSession_iOS.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2411;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1A169D000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d Subscribing to MicrophoneInjectionCapabilityChangeNotification for process:%@", buf, 0x1Cu);
  }
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetProperty(*(as::client::cache_util::CacheManager ***)buf, @"SubscribeToMicrophoneInjectionCapabilityChangeNotification", v4, 0);
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  *(unsigned char *)(v8 + 340) = 1;
  if (v7) {
    os_unfair_recursive_lock_unlock();
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
}

- (unsigned)privateShouldSubscribeToMicrophoneInjectionCapabilityChangeNotification
{
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  unsigned __int8 v2 = *(unsigned char *)(v5 + 340);
  if (v4) {
    os_unfair_recursive_lock_unlock();
  }
  return v2;
}

- (void)handleMediaDaemonTerminationEvent:(int)a3 daemonName:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v4);
  }
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  uint64_t v8 = v20;
  shared_owners = (std::__shared_weak_count *)v20[3].__shared_owners_;
  id location = v20[3].__vftable;
  uint64_t v18 = shared_owners;
  if (shared_owners)
  {
    atomic_fetch_add_explicit(&shared_owners->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v8 = v20;
  }
  as::client::AVAudioSessionDaemonsStateManager::processServiceTermination((uint64_t)&v8[3].__shared_weak_owners_, v7, (int **)&location);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  if (v19) {
    os_unfair_recursive_lock_unlock();
  }
  [(AVAudioSession *)self accessor];
  dispatch_time_t v10 = dispatch_time(0, 500000000);
  id v11 = *(id *)(*(void *)(v19 + 56) + 16);
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AVAudioSession_handleMediaDaemonTerminationEvent_daemonName___block_invoke;
  block[3] = &unk_1E5A82808;
  uint64_t v12 = v11;
  objc_copyWeak(&v16, &location);
  id v13 = v7;
  id v15 = v13;
  dispatch_after(v10, v12, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
}

void __63__AVAudioSession_handleMediaDaemonTerminationEvent_daemonName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained privateGetGuardOfImplementation];
    uint64_t v4 = v9;
    uint64_t v5 = *(std::__shared_weak_count **)(v9 + 80);
    id v6 = *(int **)(v9 + 72);
    uint64_t v7 = v5;
    if (v5)
    {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v4 = v9;
    }
    as::client::AVAudioSessionDaemonsStateManager::processServiceReset(v4 + 88, *(void **)(a1 + 32), &v6);
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
    if (v8) {
      os_unfair_recursive_lock_unlock();
    }
  }
}

- (int64_t)audioFormat
{
  v9[0] = 1;
  int v10 = 3330;
  uint64_t v11 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v7, (void *)*MEMORY[0x1E4F76010]);
  uint64_t v3 = (as::client::api_utils *)objc_claimAutoreleasedReturnValue();
  int64_t v5 = as::client::api_utils::TranslateFromMXAudioHardwareFormat(v3, v4);

  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return v5;
}

- (BOOL)setPreferredAudioFormat:(int64_t)a3 error:(id *)a4
{
  v11[0] = 1;
  int v12 = 3456;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v6 = as::client::api_utils::TranslateToMXAudioHardwareFormat((as::client::api_utils *)a3);
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76418], v6, 1);
  char v7 = FormatNSErrorForReturn();

  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (int64_t)preferredAudioFormat
{
  v9[0] = 1;
  int v10 = 3457;
  uint64_t v11 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v7, (void *)*MEMORY[0x1E4F76418]);
  uint64_t v3 = (as::client::api_utils *)objc_claimAutoreleasedReturnValue();
  int64_t v5 = as::client::api_utils::TranslateFromMXAudioHardwareFormat(v3, v4);

  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return v5;
}

- (BOOL)isDolbyDigitalEncoderAvailable
{
  v7[0] = 1;
  int v8 = 3332;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, @"DolbyDigitalEncoderAvailable", 0);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)isEarpieceActiveNoiseCancelationEnabled
{
  v7[0] = 1;
  int v8 = 3334;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, @"EarpieceANCEnabled", 0);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)isPiPAvailable
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v8[0] = 1;
  int v9 = 3335;
  uint64_t v10 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = *(void *)(v6 + 24);
  v14[0] = &unk_1EF4FBB80;
  v14[1] = &v6;
  v14[3] = v14;
  int updated = as::client::KVOProperty<unsigned int>::UpdateIfDirty(v3 + 440, (uint64_t)v14);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](v14);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v8);
  return updated != 0;
}

- (BOOL)isEchoCancelledInputAvailable
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v7[0] = 1;
  int v8 = 3458;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v3 = (as::client *)kdebug_trace();
  uint64_t v4 = *(id *)as::client::gSessionClientLog(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "AVAudioSession_iOS.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2556;
    _os_log_impl(&dword_1A169D000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Getting echo cancelled input availability", buf, 0x12u);
  }
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(*(os_unfair_lock_s ***)buf, @"SupportsEchoCancelledInput", 1);
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)forceSoundCheck
{
  v7[0] = 1;
  int v8 = 3336;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76180], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)setForceSoundCheck:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3337;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76180], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)lastActivationStoppedNowPlayingApp
{
  v7[0] = 1;
  int v8 = 3382;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76388], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)requiresNoAudioResources
{
  v7[0] = 1;
  int v8 = 3338;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76138], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)allowMixableAudioWhileRecording
{
  v7[0] = 1;
  int v8 = 3340;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F75E78], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)setAllowMixableAudioWhileRecording:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3341;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F75E78], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)participatesInNowPlayingAppPolicy
{
  v7[0] = 1;
  int v8 = 3342;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76288], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)eligibleForBTSmartRoutingConsideration
{
  v7[0] = 1;
  int v8 = 3344;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76270], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)setEligibleForBTSmartRoutingConsideration:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3345;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76270], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)eligibleForBTTriangleConsideration
{
  v7[0] = 1;
  int v8 = 3433;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76278], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)setEligibleForBTTriangleConsideration:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3434;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76278], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)prefersToAcquireHWControlFromOtherSessions
{
  v7[0] = 1;
  int v8 = 3346;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76560], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)setPrefersToAcquireHWControlFromOtherSessions:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3347;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76560], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)inhibitSpeechDetection
{
  v7[0] = 1;
  int v8 = 3447;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76530], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return !Property_DefaultTo;
}

- (BOOL)setInhibitSpeechDetection:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3448;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v6 = [NSNumber numberWithBool:!v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76530], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)prefersNoMicrophoneUsageIndicator
{
  v7[0] = 1;
  int v8 = 3348;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76538], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)setPrefersNoMicrophoneUsageIndicator:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3349;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76538], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)participatesInMutePriority
{
  v7[0] = 1;
  int v8 = 3350;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76398], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return !Property_DefaultTo;
}

- (BOOL)setParticipatesInMutePriority:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3351;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v6 = [NSNumber numberWithBool:!v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76398], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)recordingFromRemoteInput
{
  v7[0] = 1;
  int v8 = 3352;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, @"RecordingFromRemoteInput", 0);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)setRecordingFromRemoteInput:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3353;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, @"RecordingFromRemoteInput", v6, 0);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (void)setAllowAllBuiltInDataSources:(BOOL)a3
{
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  uint64_t v4 = v5;
  *(unsigned char *)(v6 + 280) = a3;
  if (v4) {
    os_unfair_recursive_lock_unlock();
  }
}

- (BOOL)setBypassRingerSwitchPolicy:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3383;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F761E0], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)setInterruptionFadeDuration:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v10[0] = 1;
  int v11 = 3385;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetProperty(v8, (void *)*MEMORY[0x1E4F76238], v5, 1);
  char v6 = FormatNSErrorForReturn();
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);

  return v6;
}

- (BOOL)setDuckingFadeOutDuration:(id)a3 fadeInDuration:(id)a4 error:(id *)a5
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v18[0] = 1;
  int v19 = 3386;
  uint64_t v20 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  kdebug_trace();
  id v9 = (id)*MEMORY[0x1E4F76140];
  v24[0] = v9;
  uint64_t v10 = v7;
  if (!v7)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[0] = v10;
  id v11 = (id)*MEMORY[0x1E4F76678];
  v24[1] = v11;
  uint64_t v12 = v8;
  if (!v8)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  if (!v8) {

  }
  if (!v7) {
  [(AVAudioSession *)self accessor];
  }
  as::client::api_utils::ServerAccessor::SetBatchProperties(v16, v13, 0, 1, 1, 0);
  char v14 = FormatNSErrorForReturn();
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v18);
  return v14;
}

- (BOOL)setDuckToLevelScalar:(id)a3 unduckToLevelScalar:(id)a4 error:(id *)a5
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  v17[0] = 1;
  int v18 = 3446;
  uint64_t v19 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  kdebug_trace();
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = v9;
  if (v7 | v8)
  {
    if (v7) {
      [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F76160]];
    }
    if (v8) {
      [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F76688]];
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CA98] null];
    [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F76160]];

    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
    [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F76688]];
  }
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetBatchProperties(v15, v10, 0, 1, 1, 0);
  char v13 = FormatNSErrorForReturn();
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);
  return v13;
}

- (BOOL)setDuckToLevelDB:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v10[0] = 1;
  int v11 = 3387;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetProperty(v8, (void *)*MEMORY[0x1E4F76158], v5, 1);
  char v6 = FormatNSErrorForReturn();
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);

  return v6;
}

- (BOOL)setDuckToLevelScalar:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v10[0] = 1;
  int v11 = 3388;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetProperty(v8, (void *)*MEMORY[0x1E4F76160], v5, 1);
  char v6 = FormatNSErrorForReturn();
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);

  return v6;
}

- (BOOL)isExpanseMediaSession
{
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v4, (void *)*MEMORY[0x1E4F76298], 1);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return Property_DefaultTo;
}

- (BOOL)setIsExpanseMediaSession:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  [(AVAudioSession *)self accessor];
  id v5 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v8, (void *)*MEMORY[0x1E4F76298], v5, 1);

  char v6 = FormatNSErrorForReturn();
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return v6;
}

- (BOOL)prefersAggressiveCaching
{
  [(AVAudioSession *)self accessor];
  char CachingPreference = as::client::cache_util::CacheManager::getCachingPreference(*(os_unfair_lock_s **)(v4 + 72));
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return CachingPreference;
}

- (BOOL)setPrefersAggressiveCaching:(BOOL)a3 error:(id *)a4
{
  [(AVAudioSession *)self accessor];
  as::client::cache_util::CacheManager::setCachingPreference(*(os_unfair_lock_s **)(v6 + 72), a3);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return FormatNSErrorForReturn();
}

- (BOOL)prefersConcurrentAirPlayAudio
{
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v4, (void *)*MEMORY[0x1E4F764E0], 1);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return Property_DefaultTo;
}

- (BOOL)setPrefersConcurrentAirPlayAudio:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  [(AVAudioSession *)self accessor];
  id v5 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v8, (void *)*MEMORY[0x1E4F764E0], v5, 1);

  char v6 = FormatNSErrorForReturn();
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return v6;
}

- (BOOL)isHardwareFormatFixedToMultiChannel
{
  v7[0] = 1;
  int v8 = 3354;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76108], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)fixHardwareFormatToMultiChannel:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3355;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  char v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76108], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (float)inputGain
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E4F76228], 1);
}

- (id)privateGetDataSources:(BOOL)a3 accessor:(const void *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(*(void *)a4 + 24);
  uint64_t v6 = v5 + 104;
  uint64_t v7 = v5 + 152;
  if (a3) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t v9 = self;
  v12[0] = &unk_1EF4FB480;
  v12[1] = v9;
  BOOL v13 = a3;
  uint64_t v14 = v12;
  uint64_t v10 = as::client::KVOProperty<NSArray * {__strong}>::UpdateIfDirty(v8, (uint64_t)v12);
  std::__function::__value_func<NSArray * ()(void)>::~__value_func[abi:ne180100](v12);

  return v10;
}

- (id)privateGetSelectedDataSource:(BOOL)a3 accessor:(const void *)a4
{
  BOOL v4 = a3;
  uint64_t v6 = [(AVAudioSession *)self privateGetCurrentRoute:a4];
  uint64_t v7 = v6;
  if (v4) {
    [v6 inputs];
  }
  else {
  uint64_t v8 = [v6 outputs];
  }
  if ([v8 count])
  {
    uint64_t v9 = [v8 objectAtIndex:0];
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  uint64_t v10 = [v9 selectedDataSource];
  if (v12) {
    os_unfair_recursive_lock_unlock();
  }

  return v10;
}

- (NSArray)inputDataSources
{
  v7[0] = 1;
  int v8 = 3107;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = [(AVAudioSession *)self privateGetDataSources:1 accessor:v5];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return (NSArray *)v3;
}

- (AVAudioSessionDataSourceDescription)inputDataSource
{
  v7[0] = 1;
  int v8 = 3108;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = [(AVAudioSession *)self privateGetSelectedDataSource:1 accessor:v5];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return (AVAudioSessionDataSourceDescription *)v3;
}

- (NSArray)outputDataSources
{
  v7[0] = 1;
  int v8 = 3110;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = [(AVAudioSession *)self privateGetDataSources:0 accessor:v5];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return (NSArray *)v3;
}

- (AVAudioSessionDataSourceDescription)outputDataSource
{
  v7[0] = 1;
  int v8 = 3111;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = [(AVAudioSession *)self privateGetSelectedDataSource:0 accessor:v5];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return (AVAudioSessionDataSourceDescription *)v3;
}

- (BOOL)isInputGainSettable
{
  v7[0] = 1;
  int v8 = 3105;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76218], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)getInputAvailable
{
  [(AVAudioSession *)self accessor];
  BOOL v3 = [(AVAudioSession *)self privateGetInputAvailable:&v5];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return v3;
}

- (BOOL)isInputAvailable
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E4F76668], 1);
}

- (BOOL)secondaryAudioShouldBeSilencedHint
{
  v7[0] = 1;
  int v8 = 3120;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76638], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (NSTimeInterval)outputLatency
{
  v7[0] = 1;
  int v8 = 3117;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  float Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(v5, (void *)*MEMORY[0x1E4F76088], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (double)inputSafetyOffset
{
  v7[0] = 1;
  int v8 = 3371;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  float Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(v5, (void *)*MEMORY[0x1E4F75030], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (double)outputSafetyOffset
{
  v7[0] = 1;
  int v8 = 3372;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  float Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(v5, (void *)*MEMORY[0x1E4F75048], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (id)activeSessionDisplayIDs
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v10[0] = 1;
  int v11 = 3368;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray<NSString *> * {__strong}>(v8, (void *)*MEMORY[0x1E4F75060]);
  BOOL v3 = (as::client *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v3;
  if (v3 && (BOOL v3 = (as::client *)[(as::client *)v3 count]) != 0)
  {
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v6 = *(id *)as::client::gSessionClientLog(v3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "AVAudioSession_iOS.mm";
      __int16 v18 = 1024;
      int v19 = 3184;
      _os_log_impl(&dword_1A169D000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get DisplayIDsOfActiveSessions", buf, 0x12u);
    }
    uint64_t v5 = (as::client *)MEMORY[0x1E4F1CBF0];
  }

  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return v5;
}

- (NSTimeInterval)IOBufferDuration
{
  v6[0] = 1;
  int v7 = 3118;
  uint64_t v8 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  kdebug_trace();
  [(AVAudioSession *)self sampleRate];
  double v4 = 0.0;
  if (v3 > 0.0) {
    double v4 = (double)[(AVAudioSession *)self IOBufferFrameSize] / v3;
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v6);
  return v4;
}

- (id)supportedOutputChannelLayouts
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v10[0] = 1;
  int v11 = 3135;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  double v3 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray * {__strong}>(v8, (void *)*MEMORY[0x1E4F76660]);
  double v4 = v3;
  if (v3)
  {
    uint64_t v5 = as::client::api_utils::TranslateOutputChannelLayoutsFromMX(v3);
  }
  else
  {
    uint64_t v6 = *(id *)as::client::gSessionClientLog(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "AVAudioSession_iOS.mm";
      __int16 v18 = 1024;
      int v19 = 3226;
      _os_log_impl(&dword_1A169D000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Get SupportedOutputChannelLayouts failed", buf, 0x12u);
    }
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return v5;
}

- (unint64_t)speechDetectionStyle
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v8[0] = 1;
  int v9 = 3449;
  uint64_t v10 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = *(void *)(v6 + 24);
  v14[0] = &unk_1EF4FB3A8;
  v14[1] = &v6;
  v14[3] = v14;
  unsigned int updated = as::client::KVOProperty<unsigned int>::UpdateIfDirty(v3 + 536, (uint64_t)v14);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](v14);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v8);
  return updated;
}

- (int64_t)interruptionPriority
{
  v7[0] = 1;
  int v8 = 3381;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  int Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<int>(v5, (void *)*MEMORY[0x1E4F75FC8], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (double)preferredSampleRate
{
  v9[0] = 1;
  int v10 = 3091;
  uint64_t v11 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = [(AVAudioSession *)self privateGetCategory:&v7];

  if (v3 == @"AVAudioSessionCategoryRecord") {
    double Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(v7, (void *)*MEMORY[0x1E4F76460], 1);
  }
  else {
    double Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(v7, (void *)*MEMORY[0x1E4F76498], 1);
  }
  double v5 = Property_DefaultTo;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return v5;
}

- (NSTimeInterval)preferredIOBufferDuration
{
  v7[0] = 1;
  int v8 = 3093;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  double Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(v5, (void *)*MEMORY[0x1E4F76428], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (unint64_t)preferredIOBufferFrameSize
{
  v7[0] = 1;
  int v8 = 3374;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  unint64_t Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned long>(v5, (void *)*MEMORY[0x1E4F76430], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (NSInteger)preferredInputNumberOfChannels
{
  v7[0] = 1;
  int v8 = 3095;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  NSInteger Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<long>(v5, (void *)*MEMORY[0x1E4F76480], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (NSInteger)preferredOutputNumberOfChannels
{
  v7[0] = 1;
  int v8 = 3097;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  NSInteger Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<long>(v5, (void *)*MEMORY[0x1E4F76490], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (NSInteger)inputNumberOfChannels
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v8[0] = 1;
  int v9 = 3114;
  uint64_t v10 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = *(void *)(v6 + 24);
  v14[0] = &unk_1EF4FB3F0;
  v14[1] = &v6;
  v14[3] = v14;
  unsigned int updated = as::client::KVOProperty<unsigned int>::UpdateIfDirty(v3 + 344, (uint64_t)v14);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](v14);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v8);
  return updated;
}

- (NSInteger)outputNumberOfChannels
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v8[0] = 1;
  int v9 = 3115;
  uint64_t v10 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = *(void *)(v6 + 24);
  v14[0] = &unk_1EF4FB438;
  v14[1] = &v6;
  v14[3] = v14;
  unsigned int updated = as::client::KVOProperty<unsigned int>::UpdateIfDirty(v3 + 392, (uint64_t)v14);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](v14);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v8);
  return updated;
}

- (NSInteger)maximumInputNumberOfChannels
{
  v7[0] = 1;
  int v8 = 3101;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  NSInteger Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<long>(v5, (void *)*MEMORY[0x1E4F76340], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (NSInteger)maximumOutputNumberOfChannels
{
  v7[0] = 1;
  int v8 = 3102;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  NSInteger Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<long>(v5, (void *)*MEMORY[0x1E4F76358], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (NSArray)availableModes
{
  v4[8] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AVAudioSessionModeDefault";
  v4[1] = @"AVAudioSessionModeVoiceChat";
  v4[2] = @"AVAudioSessionModeVideoRecording";
  v4[3] = @"AVAudioSessionModeMeasurement";
  v4[4] = @"AVAudioSessionModeMoviePlayback";
  void v4[5] = @"AVAudioSessionModeVideoChat";
  v4[6] = @"AVAudioSessionModeSpokenAudio";
  v4[7] = @"AVAudioSessionModeVoicePrompt";
  unsigned __int8 v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:8];
  return (NSArray *)v2;
}

- (BOOL)privateSetRouteSharingPolicy:(unint64_t)a3 error:(id *)a4
{
  [(AVAudioSession *)self accessor];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F765C0], v6, 1);

  atomic_store((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1, (unsigned __int8 *)([(AVAudioSession *)self atomicImpl] + 42));
  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  return v7;
}

- (id)auditTokensForProcessAssertion
{
  v9[0] = 1;
  int v10 = 3391;
  uint64_t v11 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray<NSData *> * {__strong}>(v7, (void *)*MEMORY[0x1E4F76578]);
  double v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }

  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return v5;
}

- (BOOL)setAuditTokensForProcessAssertion:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v10[0] = 1;
  int v11 = 3392;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetProperty(v8, (void *)*MEMORY[0x1E4F76578], v5, 1);
  char v6 = FormatNSErrorForReturn();
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);

  return v6;
}

- (id)powerBudget
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v10[0] = 1;
  int v11 = 3395;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSDictionary * {__strong}>(v8, (void *)*MEMORY[0x1E4F76400]);
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    char v6 = *(id *)as::client::gSessionClientLog(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "AVAudioSession_iOS.mm";
      __int16 v18 = 1024;
      int v19 = 3504;
      _os_log_impl(&dword_1A169D000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Get powerBudget failed", buf, 0x12u);
    }
    id v5 = (id)MEMORY[0x1E4F1CC08];
  }

  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return v5;
}

- (id)powerProfile
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v10[0] = 1;
  int v11 = 3393;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSDictionary * {__strong}>(v8, (void *)*MEMORY[0x1E4F76408]);
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    char v6 = *(id *)as::client::gSessionClientLog(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "AVAudioSession_iOS.mm";
      __int16 v18 = 1024;
      int v19 = 3518;
      _os_log_impl(&dword_1A169D000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Get powerProfile failed", buf, 0x12u);
    }
    id v5 = (id)MEMORY[0x1E4F1CC08];
  }

  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return v5;
}

- (BOOL)setPowerProfile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v10[0] = 1;
  int v11 = 3394;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetProperty(v8, (void *)*MEMORY[0x1E4F76408], v5, 1);
  char v6 = FormatNSErrorForReturn();
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);

  return v6;
}

- (BOOL)setRoutingContextUID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v10[0] = 1;
  int v11 = 3398;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  if (!as::client::api_utils::ServerAccessor::SetProperty(v8, (void *)*MEMORY[0x1E4F765D8], v5, 1)) {
    [(AVAudioSession *)self initializeAVOutputContextObject:v5 updateCache:1];
  }
  char v6 = FormatNSErrorForReturn();
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);

  return v6;
}

- (id)hostProcessAttribution
{
  v9[0] = 1;
  int v10 = 3399;
  uint64_t v11 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = as::client::api_utils::ServerAccessor::GetPropertyAVAS_DefaultToZero<NSArray<NSString *> * {__strong}>(v7, @"AS_HostProcessAttribution");
  double v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }

  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return v5;
}

- (BOOL)setHostProcessAttribution:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v10[0] = 1;
  int v11 = 3400;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetProperty(v8, @"AS_HostProcessAttribution", v5, 0);
  char v6 = FormatNSErrorForReturn();
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);

  return v6;
}

- (BOOL)selectIndependentRoutingContext:(id *)a3
{
  v6[0] = 1;
  int v7 = 3401;
  uint64_t v8 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  kdebug_trace();
  LOBYTE(a3) = [(AVAudioSession *)self privateSetRouteSharingPolicy:2 error:a3];
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v6);
  return (char)a3;
}

- (BOOL)overrideOutputAudioPort:(AVAudioSessionPortOverride)portOverride error:(NSError *)outError
{
  v12[0] = 1;
  int v13 = 3082;
  uint64_t v14 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  kdebug_trace();
  if (portOverride == AVAudioSessionPortOverrideSpeaker) {
    char v6 = @"Speaker";
  }
  else {
    char v6 = 0;
  }
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetProperty((as::client::cache_util::CacheManager **)v10, (void *)*MEMORY[0x1E4F763B0], v6, 1);
  int v7 = FormatNSErrorForReturn();
  if (v7)
  {
    uint64_t v8 = *(void *)(v10 + 24);
    os_unfair_recursive_lock_lock_with_options();
    *(unsigned char *)(v8 + 192) = 1;
    *(unsigned char *)(v8 + 240) = 1;
    os_unfair_recursive_lock_unlock();
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v7;
}

- (BOOL)setPreferredInput:(AVAudioSessionPortDescription *)inPort error:(NSError *)outError
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  char v6 = inPort;
  v23[0] = 1;
  int v24 = 3083;
  uint64_t v25 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  int v7 = (as::client *)kdebug_trace();
  uint64_t v8 = *(id *)as::client::gSessionClientLog(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [(AVAudioSessionPortDescription *)v6 portName];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVAudioSession_iOS.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3715;
    __int16 v30 = 2112;
    int v31 = v9;
    _os_log_impl(&dword_1A169D000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d ---> inPort: %@", buf, 0x1Cu);
  }
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  uint64_t v11 = *(void *)(*(void *)&buf[8] + 72);
  uint64_t v10 = *(std::__shared_weak_count **)(*(void *)&buf[8] + 80);
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v6)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    int v13 = [(AVAudioSessionPortDescription *)v6 privateGetID];
    uint64_t v14 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, @"SelectedRouteDescription_RouteID", 0);
    uint64_t v15 = (id *)MEMORY[0x1E4F76468];
LABEL_9:

    id v18 = *v15;
    int v19 = [MEMORY[0x1E4F1C978] arrayWithObject:v14];
    as::client::api_utils::ServerAccessor::SetProperty((as::client::cache_util::CacheManager **)v11, v18, v19, 1);
    int v20 = FormatNSErrorForReturn();
    if (v20 && ([*(id *)(*(void *)&buf[8] + 136) isEqual:v6] & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)&buf[8] + 136), inPort);
      uint64_t v21 = *(void *)(v11 + 24);
      os_unfair_recursive_lock_lock_with_options();
      *(unsigned char *)(v21 + 144) = 1;
      os_unfair_recursive_lock_unlock();
    }

    if (v10) {
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v16 = *(void **)(*(void *)&buf[8] + 136);
  if (v16)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
    int v13 = [v16 privateGetID];
    uint64_t v14 = objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v13, @"SelectedRouteDescription_RouteID", 0);
    uint64_t v15 = (id *)MEMORY[0x1E4F760F0];
    goto LABEL_9;
  }
  LOBYTE(v20) = 1;
  if (v10) {
LABEL_13:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
LABEL_14:
  if (*(void *)buf) {
    os_unfair_recursive_lock_unlock();
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v23);

  return v20;
}

- (AVAudioSessionPortDescription)preferredInput
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v17[0] = 1;
  int v18 = 3084;
  uint64_t v19 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  kdebug_trace();
  uint64_t v3 = copyInputPortPreference((as::client *)[(AVAudioSession *)self opaqueSessionID]);
  double v4 = *(id *)as::client::gSessionClientLog((as::client *)[(AVAudioSession *)self privateGetGuardOfImplementation]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [*(id *)(v16 + 136) portName];
    *(_DWORD *)buf = 136315650;
    int v24 = "AVAudioSession_iOS.mm";
    __int16 v25 = 1024;
    int v26 = 3756;
    __int16 v27 = 2112;
    uint64_t v28 = v5;
    _os_log_impl(&dword_1A169D000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d Current input port preference: %@", buf, 0x1Cu);
  }
  char v6 = *(void **)(v16 + 136);
  if (v6)
  {
    int v7 = [v6 privateGetID];
    char v8 = [v3 isEqualToNumber:v7];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = *(void **)(v16 + 136);
      *(void *)(v16 + 136) = 0;

      if (v3)
      {
        uint64_t v10 = *(id *)as::client::gSessionClientLog((as::client *)v6);
        char v6 = (void *)os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
        if (v6)
        {
          *(_DWORD *)buf = 136315394;
          int v24 = "AVAudioSession_iOS.mm";
          __int16 v25 = 1024;
          int v26 = 3766;
          _os_log_impl(&dword_1A169D000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Unexpected input port preference", buf, 0x12u);
        }
      }
    }
  }
  uint64_t v11 = *(id *)as::client::gSessionClientLog((as::client *)v6);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [*(id *)(v16 + 136) portName];
    *(_DWORD *)buf = 136315650;
    int v24 = "AVAudioSession_iOS.mm";
    __int16 v25 = 1024;
    int v26 = 3769;
    __int16 v27 = 2112;
    uint64_t v28 = v12;
    _os_log_impl(&dword_1A169D000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d Returning: %@", buf, 0x1Cu);
  }
  id v13 = *(id *)(v16 + 136);
  if (v15) {
    os_unfair_recursive_lock_unlock();
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);
  return (AVAudioSessionPortDescription *)v13;
}

- (id)pickedRoute
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v10[0] = 1;
  int v11 = 3402;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSDictionary * {__strong}>(v8, (void *)*MEMORY[0x1E4F763F0]);
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    char v6 = *(id *)as::client::gSessionClientLog(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "AVAudioSession_iOS.mm";
      __int16 v18 = 1024;
      int v19 = 3797;
      _os_log_impl(&dword_1A169D000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Get PickedRoute failed", buf, 0x12u);
    }
    id v5 = (id)MEMORY[0x1E4F1CC08];
  }

  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return v5;
}

- (id)activeAudioRoute
{
  [(AVAudioSession *)self accessor];
  unsigned __int8 v2 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v4, (void *)*MEMORY[0x1E4F75E58]);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v2;
}

- (BOOL)setSupportsMultichannelContent:(BOOL)inValue error:(NSError *)outError
{
  BOOL v4 = inValue;
  v12[0] = 1;
  int v13 = 3126;
  uint64_t v14 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  kdebug_trace();
  char v6 = (id *)MEMORY[0x1E4F768E8];
  if (!v4) {
    char v6 = (id *)MEMORY[0x1E4F768F0];
  }
  id v7 = *v6;
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetProperty(v10, (void *)*MEMORY[0x1E4F75F50], v7, 1);
  char v8 = FormatNSErrorForReturn();
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v8;
}

- (BOOL)supportsMultichannelContent
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v10[0] = 1;
  int v11 = 3127;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v8, (void *)*MEMORY[0x1E4F75F50]);
  BOOL v4 = v3;
  if (v3)
  {
    int v5 = [v3 isEqualToString:*MEMORY[0x1E4F768F0]] ^ 1;
  }
  else
  {
    char v6 = *(id *)as::client::gSessionClientLog(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "AVAudioSession_iOS.mm";
      __int16 v18 = 1024;
      int v19 = 3832;
      _os_log_impl(&dword_1A169D000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Get supportsMultichannelContent failed", buf, 0x12u);
    }
    LOBYTE(v5) = 0;
  }

  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return v5;
}

- (BOOL)setPrefersInterruptionOnRouteDisconnect:(BOOL)inValue error:(NSError *)outError
{
  BOOL v4 = inValue;
  v10[0] = 1;
  int v11 = 3133;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  [(AVAudioSession *)self privateSetPrefersInterruptionOnRouteDisconnect:v4 accessor:v8];
  char v6 = FormatNSErrorForReturn();
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return v6;
}

- (BOOL)prefersInterruptionOnRouteDisconnect
{
  v7[0] = 1;
  int v8 = 3134;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F764F0], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)setAudioClockDevice:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v10[0] = 1;
  int v11 = 3421;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetProperty(v8, (void *)*MEMORY[0x1E4F75EE0], v5, 1);
  char v6 = FormatNSErrorForReturn();
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);

  return v6;
}

- (id)audioClockDevice
{
  v9[0] = 1;
  int v10 = 3420;
  uint64_t v11 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v7, (void *)*MEMORY[0x1E4F75EE0]);
  BOOL v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = &stru_1EF4FCC40;
  }

  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return v5;
}

- (double)speechDetectionDeviceSampleRate
{
  v7[0] = 1;
  int v8 = 3379;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  double Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(v5, (void *)*MEMORY[0x1E4F760A0], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (double)siriSpeechDetectionDeviceSampleRate
{
  v7[0] = 1;
  int v8 = 3379;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  double Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(v5, (void *)*MEMORY[0x1E4F760A0], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (id)privateRefreshAvailableOutputs
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(AVAudioSession *)self accessor];
  uint64_t v3 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray * {__strong}>(v7, (void *)*MEMORY[0x1E4F765F0]);
  if (v3)
  {
    id v4 = +[AVAudioSessionPortDescription privateCreateArray:v3 owningSession:self];
  }
  else
  {
    id v5 = *(id *)as::client::gSessionClientLog(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v10 = "AVAudioSession_iOS.mm";
      __int16 v11 = 1024;
      int v12 = 3996;
      _os_log_impl(&dword_1A169D000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Get SelectableOutputs failed", buf, 0x12u);
    }
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }

  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  return v4;
}

- (id)privateMakePreferredPersistentRouteDictWithInputUIDs:(id)a3 outputUIDs:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    int v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    id v7 = v8;
    if (v5) {
      [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F767E0]];
    }
    if (v6) {
      [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F767E8]];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)privateReadPreferredPersistentRoute
{
  v7[0] = 1;
  int v8 = 3445;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v3 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSDictionary * {__strong}>(v5, (void *)*MEMORY[0x1E4F764A8]);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return v3;
}

- (BOOL)setPreferredPersistentInputUIDs:(id)a3 outputUIDs:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = 1;
  int v15 = 3444;
  uint64_t v16 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  kdebug_trace();
  uint64_t v9 = [(AVAudioSession *)self privateMakePreferredPersistentRouteDictWithInputUIDs:v7 outputUIDs:v8];
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetProperty(v12, (void *)*MEMORY[0x1E4F764A8], v9, 1);
  char v10 = FormatNSErrorForReturn();
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v14);
  return v10;
}

- (id)preferredPersistentInputUIDs
{
  unsigned __int8 v2 = [(AVAudioSession *)self privateReadPreferredPersistentRoute];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F767E0]];

  return v3;
}

- (id)preferredPersistentOutputUIDs
{
  unsigned __int8 v2 = [(AVAudioSession *)self privateReadPreferredPersistentRoute];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F767E8]];

  return v3;
}

- (id)delegate
{
  return (id)gAudioSessionDelegate;
}

- (void)setDelegate:(id)delegate
{
}

- (BOOL)setActivationContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v15[0] = 1;
  int v16 = 3367;
  uint64_t v17 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  kdebug_trace();
  if (as::client::api_utils::ValidateActivationContext((as::client::api_utils *)v5, v6))
  {
    [(AVAudioSession *)self accessor];
    id v7 = (as::client::api_utils *)[v5 mutableCopy];
    uint64_t v9 = as::client::api_utils::TranslateActivationContextForMX(v7, v8);
    as::client::api_utils::ServerAccessor::SetProperty((as::client::cache_util::CacheManager **)v13, (void *)*MEMORY[0x1E4F75E50], v9, 1);

    int v10 = FormatNSErrorForReturn();
    if (v10)
    {
      uint64_t v11 = *(void *)(v13 + 24);
      os_unfair_recursive_lock_lock_with_options();
      *(unsigned char *)(v11 + 144) = 1;
      *(unsigned char *)(v11 + 192) = 1;
      os_unfair_recursive_lock_unlock();
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
  else
  {
    LOBYTE(v10) = FormatNSErrorForReturn();
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v15);

  return v10;
}

- (BOOL)setDisallowedPorts:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v10[0] = 1;
  int v11 = 3370;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetProperty(v8, (void *)*MEMORY[0x1E4F76170], v5, 1);
  char v6 = FormatNSErrorForReturn();
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);

  return v6;
}

- (BOOL)silenceOutput:(unint64_t)a3 error:(id *)a4
{
  char v4 = (char)a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v19[0] = 1;
  int v20 = 3376;
  uint64_t v21 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  kdebug_trace();
  uint64_t v7 = atomic_load((unint64_t *)([(AVAudioSession *)self atomicImpl] + 8));
  PerformanceTracker::PerformanceTracker((uint64_t)v18, (uint64_t)"-[AVAudioSession silenceOutput:error:]", v7, 1);
  [(AVAudioSession *)self accessor];
  as::client::XPCConnection::sync_message<>(*(as::client::XPCConnection **)(v16 + 56), &v31);
  id v8 = (void *)MEMORY[0x1A6235350]();
  uint64_t v9 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v31);
  uint64_t v10 = [(AVAudioSession *)self opaqueSessionID];
  int v11 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v31);
  [v9 silenceOutput:v10 options:a3 reply:v11];

  uint64_t v12 = (as::client *)v33;
  uint64_t v13 = v12;
  if (v12)
  {
    uint64_t v14 = *(id *)as::client::gSessionClientLog(v12);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      int v26 = "AVAudioSession_iOS.mm";
      __int16 v27 = 1024;
      int v28 = 4130;
      __int16 v29 = 2112;
      __int16 v30 = v13;
      _os_log_impl(&dword_1A169D000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Server returned an error: %@", buf, 0x1Cu);
    }
    [(as::client *)v13 code];
    char v4 = FormatNSErrorForReturn();
  }

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v32);
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  PerformanceTracker::~PerformanceTracker((PerformanceTracker *)v18);
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v19);
  return (v13 == 0) | v4 & 1;
}

- (BOOL)isSessionInputMuted
{
  v8[0] = 1;
  int v9 = 3377;
  uint64_t v10 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  {
    as::AudioSessionMuteEnabled(void)::enabled = _os_feature_enabled_impl();
  }
  if (as::AudioSessionMuteEnabled(void)::enabled) {
    BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v6, (void *)*MEMORY[0x1E4F762F0], 1);
  }
  else {
    BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v6, @"MuteSessionInputs", 0);
  }
  BOOL v4 = Property_DefaultTo;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v8);
  return v4;
}

- (BOOL)muteSessionInput:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3378;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  char v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, @"MuteSessionInputs", v6, 0);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (id)defaultChatMode
{
  v10[0] = 1;
  int v11 = 3441;
  uint64_t v12 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v8, (void *)*MEMORY[0x1E4F760D8]);
  uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v3;
  if (v3)
  {
    TranslateMXModeToAVASModeString(v3);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = @"AVAudioSessionModeDefault";
  }
  char v6 = v5;

  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return v6;
}

- (BOOL)setDefaultChatMode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13[0] = 1;
  int v14 = 3366;
  uint64_t v15 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  kdebug_trace();
  if ([v6 compare:@"AVAudioSessionModeVoiceChat"])
  {
    if ([v6 compare:@"AVAudioSessionModeGameChat"])
    {
      if ([v6 compare:@"AVAudioSessionModeVideoChat"])
      {
        if ([v6 compare:@"AVAudioSessionModeVideoChatForMedia"])
        {
          if (a4)
          {
            [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
            char v7 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            char v7 = 0;
          }
          goto LABEL_14;
        }
        id v8 = (id *)MEMORY[0x1E4F75BA0];
      }
      else
      {
        id v8 = (id *)MEMORY[0x1E4F75B90];
      }
    }
    else
    {
      id v8 = (id *)MEMORY[0x1E4F75A80];
    }
  }
  else
  {
    id v8 = (id *)MEMORY[0x1E4F75BC0];
  }
  id v9 = *v8;
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E4F760D8], v9, 1);
  char v7 = FormatNSErrorForReturn();
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }

LABEL_14:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);

  return v7;
}

- (BOOL)prefersNoInterruptionsFromSystemAlerts
{
  v7[0] = 1;
  int v8 = 3086;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76528], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)setPrefersNoInterruptionsFromSystemAlerts:(BOOL)inValue error:(NSError *)outError
{
  BOOL v4 = inValue;
  v11[0] = 1;
  int v12 = 3085;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76528], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)setPreferredMicrophoneInjectionMode:(int64_t)a3 error:(id *)a4
{
  [(AVAudioSession *)self accessor];
  id v5 = [NSNumber numberWithInteger:a3];
  as::client::api_utils::ServerAccessor::SetProperty(v8, @"PreferredMicrophoneInjectionMode", v5, 0);

  char v6 = FormatNSErrorForReturn();
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return v6;
}

- (int64_t)preferredMicrophoneInjectionMode
{
  [(AVAudioSession *)self accessor];
  unsigned int Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v4, @"PreferredMicrophoneInjectionMode", 0);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return Property_DefaultTo;
}

- (BOOL)isMicrophoneInjectionAvailable
{
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v4, @"MicrophoneInjectionIsEnabled", 0);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return Property_DefaultTo;
}

- (BOOL)isMicrophoneInjectionServiceEnabledByUser
{
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v4, @"MicrophoneInjectionIsAllowedByUser", 0);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return Property_DefaultTo;
}

- (BOOL)prefersNoDucking
{
  v7[0] = 1;
  int v8 = 3358;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76510], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)setPrefersNoDucking:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3359;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  char v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76510], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)needsHighPowerBudgeting
{
  v7[0] = 1;
  int v8 = 3360;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76368], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)setNeedsHighPowerBudgeting:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3361;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  char v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76368], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)participatesInVolumePolicy
{
  v7[0] = 1;
  int v8 = 3362;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F766D0], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)setParticipatesInVolumePolicy:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3363;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  char v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F766D0], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)prefersToVibeWhenVibrationsAreDisabled
{
  v7[0] = 1;
  int v8 = 3364;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76570], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)setPrefersToVibeWhenVibrationsAreDisabled:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3365;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  char v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76570], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (float)defaultCalibratedOutputSPL
{
  v7[0] = 1;
  int v8 = 3435;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  float Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(v5, (void *)*MEMORY[0x1E4F760D0], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)allowsSpeakerPlayback
{
  return 0;
}

- (BOOL)clearInputPreferences:(id *)a3
{
  v12[0] = 1;
  int v13 = 3369;
  uint64_t v14 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::SetProperty((as::client::cache_util::CacheManager **)v10, (void *)*MEMORY[0x1E4F760F0], MEMORY[0x1E4F1CBF0], 1);
  int v4 = FormatNSErrorForReturn();
  if (v4)
  {
    [(AVAudioSession *)self privateGetGuardOfImplementation];
    id v5 = *(void **)(v9 + 136);
    *(void *)(v9 + 136) = 0;

    if (v8) {
      os_unfair_recursive_lock_unlock();
    }
    uint64_t v6 = *(void *)(v10 + 24);
    os_unfair_recursive_lock_lock_with_options();
    *(unsigned char *)(v6 + 144) = 1;
    os_unfair_recursive_lock_unlock();
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v4;
}

- (BOOL)setAggregatedIOPreference:(AVAudioSessionIOType)inIOType error:(NSError *)outError
{
  v11[0] = 1;
  int v12 = 3125;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v6 = [NSNumber numberWithBool:inIOType != AVAudioSessionIOTypeNotSpecified];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76598], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)decoupledIO
{
  v7[0] = 1;
  int v8 = 3411;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F762A8], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (double)preferredInputSampleRate
{
  v7[0] = 1;
  int v8 = 3414;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  double Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(v5, (void *)*MEMORY[0x1E4F76460], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (BOOL)setPreferredOutputSampleRate:(double)a3 error:(id *)a4
{
  v11[0] = 1;
  int v12 = 3413;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  uint64_t v6 = [NSNumber numberWithDouble:a3];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F76498], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (double)preferredOutputSampleRate
{
  v7[0] = 1;
  int v8 = 3415;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  double Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(v5, (void *)*MEMORY[0x1E4F76498], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (double)outputSampleRate
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E4F76090], 1);
}

- (BOOL)setSpeakerThermalGain:(float)a3 error:(id *)a4
{
  v12[0] = 1;
  int v13 = 3406;
  uint64_t v14 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  *(float *)&double v6 = a3;
  char v7 = [NSNumber numberWithFloat:v6];
  as::client::api_utils::ServerAccessor::SetProperty(v10, (void *)*MEMORY[0x1E4F75080], v7, 1);

  char v8 = FormatNSErrorForReturn();
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v8;
}

- (BOOL)setHapticThermalGain:(float)a3 error:(id *)a4
{
  v12[0] = 1;
  int v13 = 3408;
  uint64_t v14 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  *(float *)&double v6 = a3;
  char v7 = [NSNumber numberWithFloat:v6];
  as::client::api_utils::ServerAccessor::SetProperty(v10, (void *)*MEMORY[0x1E4F75078], v7, 1);

  char v8 = FormatNSErrorForReturn();
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v8;
}

- (float)speakerThermalGain
{
  v7[0] = 1;
  int v8 = 3407;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  float Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(v5, (void *)*MEMORY[0x1E4F75080], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (float)hapticThermalGain
{
  v7[0] = 1;
  int v8 = 3409;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  float Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(v5, (void *)*MEMORY[0x1E4F75078], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (void)privateInputIsAvailableChanged:(BOOL)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AVAudioSession_privateInputIsAvailableChanged___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __49__AVAudioSession_privateInputIsAvailableChanged___block_invoke(uint64_t a1)
{
  uint64_t result = gAudioSessionDelegate;
  if (gAudioSessionDelegate)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v3 = (void *)gAudioSessionDelegate;
      uint64_t v4 = *(unsigned __int8 *)(a1 + 32);
      return [v3 inputIsAvailableChanged:v4];
    }
  }
  return result;
}

- (BOOL)privateGetInputAvailable:(const void *)a3
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(*(os_unfair_lock_s ***)a3, (void *)*MEMORY[0x1E4F76668], 1);
}

- (BOOL)privateSetPrefersInterruptionOnRouteDisconnect:(BOOL)a3 accessor:(const void *)a4
{
  uint64_t v4 = *(as::client::cache_util::CacheManager ***)a4;
  id v5 = (void *)*MEMORY[0x1E4F764F0];
  double v6 = [NSNumber numberWithBool:a3];
  LOBYTE(v4) = as::client::api_utils::ServerAccessor::SetProperty(v4, v5, v6, 1) != 0;

  return (char)v4;
}

- (void)privateResetCachedPropertyValues:(const void *)a3
{
  atomic_store(0, (unsigned __int16 *)([(AVAudioSession *)self atomicImpl] + 28));
  uint64_t v4 = *(as::client::KVOManager **)(*(void *)a3 + 24);
  as::client::KVOManager::markPropertiesDirtyAll(v4);
}

- (void)privateHandleBeaconBudgetChange:(id)a3 accessor:(const void *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v6 = (as::client *)a3;
  char v7 = *(id *)as::client::gSessionClientLog(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "AVAudioSession_iOS.mm";
    __int16 v10 = 1024;
    int v11 = 4664;
    _os_log_impl(&dword_1A169D000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d Notifying listeners that available Beacon Budget changed", (uint8_t *)&v8, 0x12u);
  }
  [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionBeaconBudgetChangeNotification" userInfo:v6 accessor:a4];
}

- (void)privateHandlePrefersConcurrentAirPlayAudioChange:(id)a3 accessor:(const void *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v6 = (as::client *)a3;
  char v7 = *(id *)as::client::gSessionClientLog(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "AVAudioSession_iOS.mm";
    __int16 v15 = 1024;
    int v16 = 4674;
    _os_log_impl(&dword_1A169D000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d Notifying listeners that available Concurrent Airplay Audio changed", buf, 0x12u);
  }
  int v11 = @"AVAudioSessionConcurrentAirPlayAudioPreferredKey";
  id v8 = (id)*MEMORY[0x1E4F75D00];
  uint64_t v9 = [(as::client *)v6 objectForKeyedSubscript:v8, @"AVAudioSessionConcurrentAirPlayAudioPreferredKey"];
  uint64_t v12 = v9;
  __int16 v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionConcurrentAirPlayAudioPreferenceChangeNotification" userInfo:v10 accessor:a4];
}

- (void)privateHandleRouteControlFeaturesChange:(id)a3 accessor:(const void *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  __int16 v10 = @"AVAudioSessionRouteControlChangeOptionsKey";
  id v7 = (id)*MEMORY[0x1E4F75D10];
  id v8 = [v6 objectForKeyedSubscript:v7];
  v11[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionRouteControlChangeNotification" userInfo:v9 accessor:a4];
}

- (void)privateHandleMicrophoneInjectionCapabilityChange:(id)a3 accessor:(const void *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = (as::client *)a3;
  id v7 = *(id *)as::client::gSessionClientLog(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "AVAudioSession_iOS.mm";
    __int16 v10 = 1024;
    int v11 = 4706;
    _os_log_impl(&dword_1A169D000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d Notifying listeners that MicrophoneInjection capability changed", (uint8_t *)&v8, 0x12u);
  }
  [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionMicrophoneInjectionCapabilitiesChangeNotification" userInfo:v6 accessor:a4];
}

- (void)privateHandleSecondaryAudioHintChange:(id)a3 accessor:(const void *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned int v7 = [v6 BOOLValue];
  uint64_t v18 = @"AVAudioSessionSilenceSecondaryAudioHintTypeKey";
  int v8 = [NSNumber numberWithUnsignedInteger:v7];
  v19[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

  int v11 = *(id *)as::client::gSessionClientLog(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    int v13 = "AVAudioSession_iOS.mm";
    __int16 v14 = 1024;
    int v15 = 4758;
    __int16 v16 = 1024;
    unsigned int v17 = [(AVAudioSession *)self opaqueSessionID];
    _os_log_impl(&dword_1A169D000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Session 0x%x posting AVAudioSessionSilenceSecondaryAudioHintNotification", (uint8_t *)&v12, 0x18u);
  }

  [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionSilenceSecondaryAudioHintNotification" userInfo:v9 accessor:a4];
}

- (void)privateHandleOtherPrimaryAudioPlayStateChange:(const void *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = *(id *)as::client::gSessionClientLog((as::client *)self);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    unsigned int v7 = "AVAudioSession_iOS.mm";
    __int16 v8 = 1024;
    int v9 = 4767;
    _os_log_impl(&dword_1A169D000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Notifying listeners that play state for other primary audio sessions changed", (uint8_t *)&v6, 0x12u);
  }
  [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionOtherPrimaryAudioPlayStateChangeNotification" userInfo:0 accessor:a3];
}

- (void)privateHandleAVOutputContextOutputDeviceChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(id *)as::client::gSessionClientLog((as::client *)self);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v5 = 136315650;
    *(void *)&char v5[4] = "AVAudioSession_iOS.mm";
    *(_WORD *)&v5[12] = 1024;
    *(_DWORD *)&v5[14] = 4786;
    __int16 v6 = 1024;
    unsigned int v7 = [(AVAudioSession *)self opaqueSessionID];
    _os_log_impl(&dword_1A169D000, v4, OS_LOG_TYPE_INFO, "%25s:%-5d Received privateHandleAVOutputContextOutputDeviceChange for session 0x%x", v5, 0x18u);
  }

  [(AVAudioSession *)self accessor];
  {
    as::ClientSideCachingEnabled(void)::enabled = _os_feature_enabled_impl();
  }
  if (as::ClientSideCachingEnabled(void)::enabled) {
    as::client::cache_util::CacheManager::refreshCachedProperties(*(os_unfair_lock_s **)(*(void *)v5 + 72), self);
  }
  if (*(void *)&v5[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v5[8]);
  }
}

- (void)privateHandleAVOutputContextOutputDevicesChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(id *)as::client::gSessionClientLog((as::client *)self);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v5 = 136315650;
    *(void *)&char v5[4] = "AVAudioSession_iOS.mm";
    *(_WORD *)&v5[12] = 1024;
    *(_DWORD *)&v5[14] = 4801;
    __int16 v6 = 1024;
    unsigned int v7 = [(AVAudioSession *)self opaqueSessionID];
    _os_log_impl(&dword_1A169D000, v4, OS_LOG_TYPE_INFO, "%25s:%-5d Received privateHandleAVOutputContextOutputDevicesChange for session 0x%x", v5, 0x18u);
  }

  [(AVAudioSession *)self accessor];
  {
    as::ClientSideCachingEnabled(void)::enabled = _os_feature_enabled_impl();
  }
  if (as::ClientSideCachingEnabled(void)::enabled) {
    as::client::cache_util::CacheManager::refreshCachedProperties(*(os_unfair_lock_s **)(*(void *)v5 + 72), self);
  }
  if (*(void *)&v5[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v5[8]);
  }
}

- (void)privateHandleActiveNeroVisualStreamInfoDidChange
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = *(id *)as::client::gSessionClientLog((as::client *)self);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315394;
    uint64_t v4 = "AVAudioSession_iOS.mm";
    __int16 v5 = 1024;
    int v6 = 4825;
    _os_log_impl(&dword_1A169D000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d Notifying listeners that ActiveNeroVisualStreamInfo changed", (uint8_t *)&v3, 0x12u);
  }
}

- (void)privateHandleCurrentInputDeviceBufferSizeDidChange
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = *(id *)as::client::gSessionClientLog((as::client *)self);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315394;
    uint64_t v4 = "AVAudioSession_iOS.mm";
    __int16 v5 = 1024;
    int v6 = 4830;
    _os_log_impl(&dword_1A169D000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d Notifying listeners that CurrentInputDeviceBufferSize changed", (uint8_t *)&v3, 0x12u);
  }
}

- (void)privateHandleCurrentOutputDeviceBufferSizeDidChange
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = *(id *)as::client::gSessionClientLog((as::client *)self);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315394;
    uint64_t v4 = "AVAudioSession_iOS.mm";
    __int16 v5 = 1024;
    int v6 = 4835;
    _os_log_impl(&dword_1A169D000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d Notifying listeners that CurrentOutputDeviceBufferSize changed", (uint8_t *)&v3, 0x12u);
  }
}

- (void)privateHandleCurrentInputSampleRateDidChange
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *(id *)as::client::gSessionClientLog((as::client *)self);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "AVAudioSession_iOS.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4840;
    _os_log_impl(&dword_1A169D000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d Notifying listeners that CurrentInputSampleRate changed", buf, 0x12u);
  }
  [(AVAudioSession *)self accessor];
  [(AVAudioSession *)self accessor];
  [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionInputSampleRateChangeNotification" userInfo:0 accessor:&v9];
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  [(AVAudioSession *)self inputSampleRate];
  uint64_t v9 = v4;
  as::client::KVOProperty<double>::UpdateAndNotify(*(void *)(*(void *)buf + 24) + 584, &v9, 0);
  __int16 v5 = [(AVAudioSession *)self category];
  int v6 = [v5 isEqualToString:@"AVAudioSessionCategoryRecord"];

  if (v6)
  {
    [(AVAudioSession *)self sampleRate];
    uint64_t v8 = v7;
    as::client::KVOProperty<double>::UpdateAndNotify(*(void *)(*(void *)buf + 24) + 680, &v8, 0);
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
}

- (void)privateHandleCurrentOutputSampleRateDidChange
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *(id *)as::client::gSessionClientLog((as::client *)self);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "AVAudioSession_iOS.mm";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4859;
    _os_log_impl(&dword_1A169D000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d Notifying listeners that CurrentOutputSampleRate changed", buf, 0x12u);
  }
  [(AVAudioSession *)self accessor];
  [(AVAudioSession *)self accessor];
  [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionOutputSampleRateChangeNotification" userInfo:0 accessor:&v9];
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  [(AVAudioSession *)self outputSampleRate];
  uint64_t v9 = v4;
  as::client::KVOProperty<double>::UpdateAndNotify(*(void *)(*(void *)buf + 24) + 632, &v9, 0);
  __int16 v5 = [(AVAudioSession *)self category];
  char v6 = [v5 isEqualToString:@"AVAudioSessionCategoryRecord"];

  if ((v6 & 1) == 0)
  {
    [(AVAudioSession *)self sampleRate];
    uint64_t v8 = v7;
    as::client::KVOProperty<double>::UpdateAndNotify(*(void *)(*(void *)buf + 24) + 680, &v8, 0);
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
}

- (void)privateHandleBadgeTypeChange:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (as::client::api_utils *)a3;
  __int16 v14 = @"AVAudioSessionRenderingModeNewRenderingModeKey";
  char v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", as::client::api_utils::TranslateFromMXBadgingType(v4, v5));
  v15[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

  uint64_t v9 = *(id *)as::client::gSessionClientLog(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    *(void *)int v11 = "AVAudioSession_iOS.mm";
    *(_WORD *)&v11[8] = 1024;
    *(_DWORD *)&v11[10] = 4885;
    __int16 v12 = 1024;
    unsigned int v13 = [(AVAudioSession *)self opaqueSessionID];
    _os_log_impl(&dword_1A169D000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Session 0x%x posting AVAudioSessionRenderingModeChangeNotification", (uint8_t *)&v10, 0x18u);
  }

  [(AVAudioSession *)self accessor];
  [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionRenderingModeChangeNotification" userInfo:v7 accessor:&v10];
  if (*(void *)&v11[4]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v11[4]);
  }
}

- (void)privateHandleRenderingCapabilitiesChange:(const void *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  __int16 v5 = *(id *)as::client::gSessionClientLog((as::client *)self);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    uint64_t v7 = "AVAudioSession_iOS.mm";
    __int16 v8 = 1024;
    int v9 = 4896;
    __int16 v10 = 1024;
    unsigned int v11 = [(AVAudioSession *)self opaqueSessionID];
    _os_log_impl(&dword_1A169D000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Session 0x%x posting AVAudioSessionRenderingCapabilitiesChangeNotification", (uint8_t *)&v6, 0x18u);
  }

  [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionRenderingCapabilitiesChangeNotification" userInfo:0 accessor:a3];
}

- (void)privateHandleAudioHardwareFormatChange
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = *(id *)as::client::gSessionClientLog((as::client *)self);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    *(void *)__int16 v5 = "AVAudioSession_iOS.mm";
    *(_WORD *)&unsigned char v5[8] = 1024;
    *(_DWORD *)&v5[10] = 4906;
    __int16 v6 = 1024;
    unsigned int v7 = [(AVAudioSession *)self opaqueSessionID];
    _os_log_impl(&dword_1A169D000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Session 0x%x posting AVAudioSessionAudioHardwareFormatChangeNotification", (uint8_t *)&v4, 0x18u);
  }

  [(AVAudioSession *)self accessor];
  [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionAudioHardwareFormatChangeNotification" userInfo:0 accessor:&v4];
  if (*(void *)&v5[4]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v5[4]);
  }
}

- (BOOL)setPrefersMultichannelAudio:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v14[0] = 1;
  int v15 = 3404;
  uint64_t v16 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  kdebug_trace();
  __int16 v6 = [(AVAudioSession *)self atomicImpl];
  unsigned int v7 = atomic_load(v6 + 14);
  if (v7 >= 0x100 && v4 == v7)
  {
    uint64_t v8 = *(id *)as::client::gSessionClientLog((as::client *)v6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVAudioSession_iOS.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 4928;
      __int16 v21 = 1024;
      BOOL v22 = v4;
      _os_log_impl(&dword_1A169D000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d prefersMultichannelAudio: inValue = %d matches cached value", buf, 0x18u);
    }
    char v9 = FormatNSErrorForReturn();
  }
  else
  {
    __int16 v10 = *(id *)as::client::gSessionClientLog((as::client *)v6);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVAudioSession_iOS.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 4931;
      __int16 v21 = 1024;
      BOOL v22 = v4;
      _os_log_impl(&dword_1A169D000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d prefersMultichannelAudio: inValue = %d", buf, 0x18u);
    }
    [(AVAudioSession *)self accessor];
    unsigned int v11 = *(as::client::cache_util::CacheManager ***)buf;
    uint64_t v12 = [NSNumber numberWithBool:v4];
    LODWORD(v11) = as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E4F76500], v12, 1);

    if (!v11) {
      atomic_store(v4 | 0x100, (unsigned __int16 *)([(AVAudioSession *)self atomicImpl] + 28));
    }
    char v9 = FormatNSErrorForReturn();
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v14);
  return v9;
}

- (BOOL)prefersMultichannelAudio
{
  v7[0] = 1;
  int v8 = 3405;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  __int16 Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v5, (void *)*MEMORY[0x1E4F76500], 1);
  atomic_store(Property_DefaultTo | 0x100, (unsigned __int16 *)([(AVAudioSession *)self atomicImpl] + 28));
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo;
}

- (void)privateUpdateOutputVolume:(id)a3
{
  id v4 = a3;
  [(AVAudioSession *)self accessor];
  [v4 floatValue];
  float v7 = v5;
  int v6 = v5 == 1.0 || v5 == 0.0;
  as::client::KVOProperty<float>::UpdateAndNotify(*(void *)(v8 + 24) + 8, &v7, v6);
  {
    as::ClientSideCachingEnabled(void)::enabled = _os_feature_enabled_impl();
  }
  if (as::ClientSideCachingEnabled(void)::enabled) {
    as::client::cache_util::CacheManager::updateCache(*(os_unfair_lock_s **)(v8 + 72), (void *)*MEMORY[0x1E4F76698], v4);
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

- (void)privateUpdatePromptStyle:(id)a3
{
  id v4 = a3;
  [(AVAudioSession *)self accessor];
  uint64_t v5 = *(void *)(v7 + 24);
  int v6 = [v4 unsignedIntValue];
  as::client::KVOProperty<unsigned int>::UpdateAndNotify(v5 + 296, &v6, 0);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

- (void)privateUpdateInputGain:(id)a3
{
  id v4 = a3;
  [(AVAudioSession *)self accessor];
  uint64_t v5 = *(void *)(v8 + 24);
  [v4 floatValue];
  int v7 = v6;
  as::client::KVOProperty<float>::UpdateAndNotify(v5 + 56, &v7, 0);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

- (void)privateUpdateSpeechDetectionStyle:(id)a3
{
  id v4 = a3;
  [(AVAudioSession *)self accessor];
  uint64_t v5 = *(void *)(v7 + 24);
  int v6 = [v4 unsignedIntValue];
  as::client::KVOProperty<unsigned int>::UpdateAndNotify(v5 + 536, &v6, 0);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

- (void)privateUpdateInputAvailable
{
  [(AVAudioSession *)self accessor];
  BOOL v3 = [(AVAudioSession *)self privateGetInputAvailable:&v6];
  uint64_t v4 = *(void *)(v6 + 24) + 488;
  BOOL v5 = v3;
  as::client::KVOProperty<unsigned int>::UpdateAndNotify(v4, &v5, 0);
  [(AVAudioSession *)self privateInputIsAvailableChanged:v3];
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
}

- (void)privateUpdateAudioFormats:(id)a3
{
  id v6 = a3;
  [(AVAudioSession *)self accessor];
  as::client::KVOProperty<NSArray * {__strong}>::UpdateAndNotify(*(void *)(v4 + 24) + 200, &v6, 0);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

- (void)privateUpdateAudioFormat:(id)a3
{
  id v4 = a3;
  [(AVAudioSession *)self accessor];
  uint64_t v5 = *(void *)(v7 + 24);
  int v6 = [v4 unsignedIntValue];
  as::client::KVOProperty<unsigned int>::UpdateAndNotify(v5 + 248, &v6, 0);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

- (void)privateUpdateInputChannelCount:(id)a3
{
  id v4 = a3;
  [(AVAudioSession *)self accessor];
  uint64_t v5 = *(void *)(v7 + 24);
  int v6 = [v4 unsignedIntValue];
  as::client::KVOProperty<unsigned int>::UpdateAndNotify(v5 + 344, &v6, 0);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

- (void)privateUpdateOutputChannelCount:(id)a3
{
  id v4 = a3;
  [(AVAudioSession *)self accessor];
  uint64_t v5 = *(void *)(v7 + 24);
  int v6 = [v4 unsignedIntValue];
  as::client::KVOProperty<unsigned int>::UpdateAndNotify(v5 + 392, &v6, 0);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

- (unint64_t)availableRouteControlOptions:(id *)a3
{
  v12[0] = 1;
  int v13 = 3452;
  uint64_t v14 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  kdebug_trace();
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  [(AVAudioSession *)self accessor];
  id v4 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSDictionary * {__strong}>(v10, (void *)*MEMORY[0x1E4F75F38]);
  uint64_t v5 = v4;
  if (v4)
  {
    int v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F75F40]];
    NSLog(&cfstr_Availableroute.isa, v6);
  }
  else
  {
    unint64_t v8 = 0;
  }

  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return v8;
}

- (BOOL)setPreferredRouteControlConfig:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v19[0] = 1;
  int v20 = 3453;
  uint64_t v21 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  kdebug_trace();
  id v6 = v5;
  uint64_t v8 = [v6 routeControlOptions];
  uint64_t v7 = [v6 constantOutputVolumeLeveldB];
  LODWORD(v8) = v8 == 1;

  if (v7) {
    uint64_t v8 = v8 | 2;
  }
  else {
    uint64_t v8 = v8;
  }

  id v9 = (id)*MEMORY[0x1E4F764B8];
  id v25 = v9;
  uint64_t v10 = [NSNumber numberWithUnsignedInt:v8];
  v26[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

  [(AVAudioSession *)self accessor];
  if (!as::client::api_utils::ServerAccessor::SetProperty(v17, (void *)*MEMORY[0x1E4F764B0], v11, 1))
  {
    uint64_t v12 = [v6 constantOutputVolumeLeveldB];
    BOOL v13 = v12 == 0;

    if (!v13)
    {
      uint64_t v14 = [v6 constantOutputVolumeLeveldB];
      as::client::api_utils::ServerAccessor::SetProperty(v17, (void *)*MEMORY[0x1E4F75FF0], v14, 1);
    }
  }
  char v15 = FormatNSErrorForReturn();
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v19);
  return v15;
}

- (id)privateGetRouteControlConfigWithDictionaryKey:(id)a3 withFeaturesKey:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(AVAudioSession *)self accessor];
  uint64_t v8 = as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSDictionary * {__strong}>((os_unfair_lock_s **)v19, v6);
  id v9 = v8;
  if (!v8)
  {
    char v15 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = [v8 objectForKeyedSubscript:v7];
  uint64_t v11 = objc_alloc_init(AVAudioSessionRouteControl);
  if (([(AVAudioSessionRouteControl *)v11 routeControlOptions] & 2) != 0)
  {
    as::client::api_utils::ServerAccessor::GetProperty((os_unfair_lock_s **)v19, (NSString *)*MEMORY[0x1E4F75FF0], 1, (uint64_t)&v17);
    if (v17)
    {
      uint64_t v14 = *(id *)as::client::gSessionClientLog(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v22 = "AVAudioSession_iOS.mm";
        __int16 v23 = 1024;
        int v24 = 5096;
        __int16 v25 = 1024;
        int v26 = v17;
        _os_log_impl(&dword_1A169D000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Reading ConstantOutputVolumeLeveldB failed with error: %d", buf, 0x18u);
      }

      char v15 = 0;
      goto LABEL_10;
    }
    [(AVAudioSessionRouteControl *)v11 setConstantOutputVolumeLeveldB:v18];
  }
  char v15 = v11;
LABEL_10:

LABEL_11:
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }

  return v15;
}

- (id)preferredRouteControlConfig
{
  v5[0] = 1;
  int v6 = 3455;
  uint64_t v7 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  kdebug_trace();
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v5);
  BOOL v3 = [(AVAudioSession *)self privateGetRouteControlConfigWithDictionaryKey:*MEMORY[0x1E4F764B0] withFeaturesKey:*MEMORY[0x1E4F764B8]];
  return v3;
}

- (id)routeControlConfig
{
  v5[0] = 1;
  int v6 = 3454;
  uint64_t v7 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  kdebug_trace();
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v5);
  BOOL v3 = [(AVAudioSession *)self privateGetRouteControlConfigWithDictionaryKey:*MEMORY[0x1E4F765A8] withFeaturesKey:*MEMORY[0x1E4F765B0]];
  return v3;
}

- (BOOL)isDolbyAtmosAvailable
{
  return 0;
}

- (id)IOController
{
  v17[0] = 1;
  int v18 = 3438;
  uint64_t v19 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  kdebug_trace();
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  if (!*(void *)(v16 + 248))
  {
    BOOL v3 = [AVAudioIOController_iOS alloc];
    uint64_t v4 = v16;
    id v5 = *(std::__shared_weak_count **)(v16 + 56);
    uint64_t v13 = *(void *)(v16 + 48);
    uint64_t v14 = v5;
    if (v5)
    {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v4 = v16;
    }
    int v6 = *(std::__shared_weak_count **)(v4 + 224);
    uint64_t v11 = *(void *)(v4 + 216);
    uint64_t v12 = v6;
    if (v6)
    {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v4 = v16;
    }
    uint64_t v7 = [(AVAudioIOController_iOS *)v3 initWithSession:self xpcConnection:&v13 deviceTimeClient:&v11 timingSlot:*(unsigned int *)(v4 + 192) isDecoupledInput:0];
    uint64_t v8 = *(void **)(v16 + 248);
    *(void *)(v16 + 248) = v7;

    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
  id v9 = *(id *)(v16 + 248);
  if (v15) {
    os_unfair_recursive_lock_unlock();
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);
  return v9;
}

- (id)decoupledInputIOController
{
  v17[0] = 1;
  int v18 = 3439;
  uint64_t v19 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  kdebug_trace();
  [(AVAudioSession *)self privateGetGuardOfImplementation];
  if (!*(void *)(v16 + 256))
  {
    BOOL v3 = [AVAudioIOController_iOS alloc];
    uint64_t v4 = v16;
    id v5 = *(std::__shared_weak_count **)(v16 + 56);
    uint64_t v13 = *(void *)(v16 + 48);
    uint64_t v14 = v5;
    if (v5)
    {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v4 = v16;
    }
    int v6 = *(std::__shared_weak_count **)(v4 + 208);
    uint64_t v11 = *(void *)(v4 + 200);
    uint64_t v12 = v6;
    if (v6)
    {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v4 = v16;
    }
    uint64_t v7 = [(AVAudioIOController_iOS *)v3 initWithSession:self xpcConnection:&v13 deviceTimeClient:&v11 timingSlot:*(unsigned int *)(v4 + 192) isDecoupledInput:1];
    uint64_t v8 = *(void **)(v16 + 256);
    *(void *)(v16 + 256) = v7;

    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
  id v9 = *(id *)(v16 + 256);
  if (v15) {
    os_unfair_recursive_lock_unlock();
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);
  return v9;
}

- (id)spatialPreferences
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v11[0] = 1;
  int v12 = 3440;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::XPCConnection::sync_message<AVAudioSessionSpatialPreferences * {__strong}>(v9[7], &v17);
  BOOL v3 = (void *)MEMORY[0x1A6235350]();
  uint64_t v4 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},AVAudioSessionSpatialPreferences * {__strong}>::sync_proxy(&v17);
  uint64_t v5 = *(unsigned int *)v9;
  int v6 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},AVAudioSessionSpatialPreferences * {__strong}>::reply((uint64_t)&v17);
  [v4 getSpatialPreferencesForSession:v5 reply:v6];

  if (v19) {
    id v7 = 0;
  }
  else {
    id v7 = v20;
  }

  std::__function::__value_func<void ()(NSError *,std::tuple<AVAudioSessionSpatialPreferences * {__strong}> &&)>::~__value_func[abi:ne180100](v18);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)handleRemoteInterruption:(id)a3 postInterruptionNotification:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v17[0] = 1;
  int v18 = 3442;
  uint64_t v19 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  as::client::XPCConnection::sync_message<>(v15[7], &v23);
  uint64_t v8 = (void *)MEMORY[0x1A6235350]();
  id v9 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v23);
  uint64_t v10 = *(unsigned int *)v15;
  uint64_t v11 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v23);
  [v9 handleRemoteInterruption:v10 interruptionStatus:v7 postInterruptionNotification:v5 reply:v11];

  id v12 = v25;
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 code];
    FormatNSErrorForReturn();
  }
  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v24);

  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);

  return v13 == 0;
}

- (BOOL)isRelatedSession:(id)a3
{
  id v4 = a3;
  LODWORD(self) = [(AVAudioSession *)self sourceSessionID];
  LOBYTE(self) = self == [v4 sourceSessionID];

  return (char)self;
}

- (BOOL)setPrefersEchoCancelledInput:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  [(AVAudioSession *)self accessor];
  BOOL v5 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v7, (void *)*MEMORY[0x1E4F764E8], v5, 1);

  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  return FormatNSErrorForReturn();
}

- (BOOL)prefersEchoCancelledInput
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(AVAudioSession *)self accessor];
  as::client::api_utils::ServerAccessor::GetProperty((os_unfair_lock_s **)v11, (NSString *)*MEMORY[0x1E4F764E8], 1, (uint64_t)&v9);
  if (v9 || (BOOL v3 = (as::client *)v10) == 0)
  {
    BOOL v4 = *(id *)as::client::gSessionClientLog(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = v9;
      unsigned int v6 = [(AVAudioSession *)self opaqueSessionID];
      *(_DWORD *)buf = 136315906;
      uint64_t v14 = "AVAudioSession_iOS.mm";
      __int16 v15 = 1024;
      int v16 = 6014;
      __int16 v17 = 1024;
      int v18 = v5;
      __int16 v19 = 1024;
      unsigned int v20 = v6;
      _os_log_impl(&dword_1A169D000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get prefersEchoCancelledInput, error: %d, session 0x%x", buf, 0x1Eu);
    }

    char v7 = 0;
  }
  else
  {
    char v7 = [v10 BOOLValue];
  }

  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  return v7;
}

- (BOOL)isEchoCancelledInputEnabled
{
  [(AVAudioSession *)self accessor];
  BOOL Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v4, (void *)*MEMORY[0x1E4F76198], 1);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return Property_DefaultTo;
}

- (uint64_t)privateCreateSessionInServerUsingXPC:
{
  return a1;
}

- (id)privateCreateSessionInServerUsingXPC:
{
  uint64_t v1 = (id *)(a1 + 8);
  unsigned __int8 v2 = (id *)operator new(0x10uLL);
  id *v2 = &unk_1EF4FBC58;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (void)outputVolume
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EF4FBB38;
  result[1] = v3;
  return result;
}

- (uint64_t)outputVolume
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EF4FBB38;
  a2[1] = v2;
  return result;
}

- (void)promptStyle
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EF4FBAA8;
  result[1] = v3;
  return result;
}

- (uint64_t)promptStyle
{
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E4F75090]);
  uint64_t v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = TranslateMXVoicePromptStyleToAVASVoicePromptStyle(v1);

  return v2;
}

- (void)audioFormats
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EF4FBAF0;
  result[1] = v3;
  return result;
}

- (uint64_t)audioFormats
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EF4FBAF0;
  a2[1] = v2;
  return result;
}

- (void)isPiPAvailable
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EF4FBB80;
  result[1] = v3;
  return result;
}

- (uint64_t)isPiPAvailable
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E4F763E0], 1);
}

- (void)inputGain
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EF4FBA60;
  result[1] = v3;
  return result;
}

- (uint64_t)inputGain
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EF4FBA60;
  a2[1] = v2;
  return result;
}

- (uint64_t)privateGetDataSources:accessor:
{
  return a1;
}

- (void)privateGetDataSources:accessor:
{
  operator delete(a1);
}

- (id)privateGetDataSources:accessor:
{
  uint64_t v2 = [*(id *)(a1 + 8) currentRoute];
  uint64_t v3 = v2;
  if (*(unsigned char *)(a1 + 16)) {
    [v2 inputs];
  }
  else {
  BOOL v4 = [v2 outputs];
  }
  if ([v4 count])
  {
    int v5 = [v4 objectAtIndex:0];
  }
  else
  {
    int v5 = 0;
  }
  unsigned int v6 = [v5 dataSources];

  return v6;
}

- (void)isInputAvailable
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1EF4FB2D0;
  result[1] = v3;
  return result;
}

- (uint64_t)isInputAvailable
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EF4FB2D0;
  a2[1] = v2;
  return result;
}

- (uint64_t)sampleRate
{
  return a1;
}

- (id)sampleRate
{
  uint64_t v3 = *(void *)(a1 + 8);
  BOOL v4 = *(void **)(a1 + 16);
  *a2 = &unk_1EF4FB240;
  a2[1] = v3;
  id result = v4;
  a2[2] = result;
  return result;
}

- (void)speechDetectionStyle
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *id result = &unk_1EF4FB3A8;
  result[1] = v3;
  return result;
}

- (uint64_t)speechDetectionStyle
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E4F76648], 1);
}

- (void)inputNumberOfChannels
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *id result = &unk_1EF4FB3F0;
  result[1] = v3;
  return result;
}

- (uint64_t)inputNumberOfChannels
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E4F76020], 1);
}

- (void)outputNumberOfChannels
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *id result = &unk_1EF4FB438;
  result[1] = v3;
  return result;
}

- (uint64_t)outputNumberOfChannels
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E4F76038], 1);
}

- (void)inputSampleRate
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *id result = &unk_1EF4FB288;
  result[1] = v3;
  return result;
}

- (uint64_t)inputSampleRate
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EF4FB288;
  a2[1] = v2;
  return result;
}

- (void)outputSampleRate
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *id result = &unk_1EF4FB318;
  result[1] = v3;
  return result;
}

- (uint64_t)outputSampleRate
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EF4FB318;
  a2[1] = v2;
  return result;
}

- (unsigned)privateGetSessionID
{
  return atomic_load((unsigned int *)[(AVAudioSession *)self atomicImpl]);
}

- (void)removeObserverForType:(unint64_t)a3 observer:(id)a4 name:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15[0] = 1;
  int v16 = 3429;
  uint64_t v17 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v10 = (os_unfair_lock_s *)*((void *)v13 + 5);
  os_unfair_lock_lock(v10);
  as::client::NotificationStateManager::GetNotificationStateForType((uint64_t)&v10[2], a3, 0, &v11);
  if (v10) {
    os_unfair_lock_unlock(v10);
  }
  if (v11) {
    as::client::AVAudioSessionNotificationState::RemoveObserverForType(v11, a3, v9, v8, self, &v13);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v15);
}

- (void)privateInterruptionWithInfo:(id)a3 accessor:(const void *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [v6 objectForKey:*MEMORY[0x1E4F4EA50]];
  int v8 = [v7 unsignedIntValue];

  uint64_t v32 = [v6 objectForKey:*MEMORY[0x1E4F4EA48]];
  id v9 = [v6 objectForKey:*MEMORY[0x1E4F4EA40]];
  id v10 = [v6 objectForKey:*MEMORY[0x1E4F4EA60]];
  if (v8 == 1)
  {
    int v31 = a4;
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:1];
    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v11, @"AVAudioSessionInterruptionTypeKey", 0);
    uint64_t v13 = v12;
    if (v32) {
      [v12 setObject:v32 forKey:@"AVAudioSessionInterruptorNameKey"];
    }
    if (v9) {
      [v13 setObject:v9 forKey:@"AVAudioSessionInterruptorBundleIDKey"];
    }
    if (v10) {
      [v13 setObject:v10 forKey:@"AVAudioSessionInterruptionWasSuspendedKey"];
    }
    uint64_t v14 = [v6 objectForKey:*MEMORY[0x1E4F4EA38]];
    __int16 v15 = v14;
    if (v14) {
      uint64_t v16 = [v14 unsignedIntValue];
    }
    else {
      uint64_t v16 = 0;
    }
    id v25 = [NSNumber numberWithUnsignedLong:v16];
    [v13 setObject:v25 forKey:@"AVAudioSessionInterruptionReasonKey"];

    if (v10)
    {
      uint64_t v26 = (as::client *)[v10 BOOLValue];
      int v27 = (int)v26;
    }
    else
    {
      int v27 = 0;
    }
    int v28 = *(id *)as::client::gSessionClientLog(v26);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      int v36 = "AVAudioSessionClient_Common.mm";
      __int16 v37 = 1024;
      int v38 = 306;
      __int16 v39 = 1024;
      unsigned int v40 = [(AVAudioSession *)self opaqueSessionID];
      __int16 v41 = 1024;
      BOOL v42 = v27;
      _os_log_impl(&dword_1A169D000, v28, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Session 0x%x posting AVAudioSessionInterruptionNotification (Begin Interruption). Was suspended:%d", buf, 0x1Eu);
    }

    __int16 v29 = [v6 objectForKey:@"TimeStamp"];
    uint64_t v30 = atomic_load((unint64_t *)([(AVAudioSession *)self atomicImpl] + 8));
    PerformanceTracker::PerformanceTracker((uint64_t)v34, @"AudioSessionBeginInterruptionNotification", v30, v29, 1);
    PerformanceTracker::~PerformanceTracker((PerformanceTracker *)v34);
    [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionInterruptionNotification" userInfo:v13 accessor:v31];
  }
  else
  {
    uint64_t v17 = [v6 objectForKey:*MEMORY[0x1E4F4EA58]];
    int v18 = [v17 unsignedIntValue];
    uint64_t v19 = a4;

    uint64_t v11 = [NSNumber numberWithUnsignedInteger:0];
    id v20 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v21 = [NSNumber numberWithUnsignedInteger:v18 == 1769108333];
    uint64_t v13 = objc_msgSend(v20, "initWithObjectsAndKeys:", v11, @"AVAudioSessionInterruptionTypeKey", v21, @"AVAudioSessionInterruptionOptionKey", 0);

    if (v32) {
      uint64_t v22 = (as::client *)[v13 setObject:v32 forKey:@"AVAudioSessionInterruptorNameKey"];
    }
    if (v9) {
      uint64_t v22 = (as::client *)[v13 setObject:v9 forKey:@"AVAudioSessionInterruptorBundleIDKey"];
    }
    __int16 v23 = *(id *)as::client::gSessionClientLog(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      int v36 = "AVAudioSessionClient_Common.mm";
      __int16 v37 = 1024;
      int v38 = 340;
      __int16 v39 = 1024;
      unsigned int v40 = [(AVAudioSession *)self opaqueSessionID];
      __int16 v41 = 1024;
      BOOL v42 = v18 == 1769108333;
      _os_log_impl(&dword_1A169D000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Session 0x%x posting AVAudioSessionInterruptionNotification (End Interruption). Resumable:%d", buf, 0x1Eu);
    }

    __int16 v15 = [v6 objectForKey:@"TimeStamp"];
    uint64_t v24 = atomic_load((unint64_t *)([(AVAudioSession *)self atomicImpl] + 8));
    PerformanceTracker::PerformanceTracker((uint64_t)v33, @"AudioSessionEndInterruptionNotification", v24, v15, 1);
    PerformanceTracker::~PerformanceTracker((PerformanceTracker *)v33);
    [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionInterruptionNotification" userInfo:v13 accessor:v19];
  }
}

- (void)privateInputMuteWithInfo:(id)a3 accessor:(const void *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = objc_opt_new();
  TypeID = [v6 objectForKey:*MEMORY[0x1E4F75CE0]];
  id v9 = TypeID;
  if (TypeID && (CFTypeID v10 = CFGetTypeID(TypeID), TypeID = (as::client *)CFBooleanGetTypeID(), (as::client *)v10 == TypeID))
  {
    [v7 setObject:v9 forKey:@"AVAudioSessionInputMuteKey"];
  }
  else
  {
    uint64_t v11 = *(id *)as::client::gSessionClientLog(TypeID);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315650;
      __int16 v15 = "AVAudioSessionClient_Common.mm";
      __int16 v16 = 1024;
      int v17 = 363;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1A169D000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Received ill formed input mute change notification %@", (uint8_t *)&v14, 0x1Cu);
    }
  }

  id v12 = [v6 objectForKey:*MEMORY[0x1E4F75CD8]];
  uint64_t v13 = v12;
  if (v12 && [v12 isEqualToString:*MEMORY[0x1E4F75DD0]]) {
    [v7 setObject:@"AVAudioSessionInputMuteContextExternalProvenance" forKey:@"AVAudioSessionInputMuteContextInfoKey"];
  }

  [(AVAudioSession *)self privatePostNotificationForType:1 name:@"AVAudioSessionInputMuteChangeNotification" userInfo:v7 accessor:a4];
}

- (BOOL)setMXProperties:(id)a3 propertyErrors:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    [(AVAudioSession *)self accessor];
    char v7 = (as::client *)as::client::api_utils::ServerAccessor::SetBatchProperties(v13, v6, a4, 2, 1, 0);
    int v8 = (int)v7;
    BOOL v9 = v7 == 0;
    if (v7)
    {
      CFTypeID v10 = *(id *)as::client::gSessionClientLog(v7);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v16 = "AVAudioSessionClient_Common.mm";
        __int16 v17 = 1024;
        int v18 = 695;
        __int16 v19 = 1024;
        int v20 = v8;
        _os_log_impl(&dword_1A169D000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d setProperties failed with code: %d", buf, 0x18u);
      }
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
  else
  {
    uint64_t v11 = *(id *)as::client::gSessionClientLog(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v16 = "AVAudioSessionClient_Common.mm";
      __int16 v17 = 1024;
      int v18 = 688;
      _os_log_impl(&dword_1A169D000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid propertiesDictionary", buf, 0x12u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)iAmTheAssistant
{
  v7[0] = 1;
  int v8 = 3356;
  uint64_t v9 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  int Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v5, (void *)*MEMORY[0x1E4F761C8], 1);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v7);
  return Property_DefaultTo != 0;
}

- (BOOL)setIAmTheAssistant:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v11[0] = 1;
  int v12 = 3357;
  uint64_t v13 = [(AVAudioSession *)self opaqueSessionID];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  [(AVAudioSession *)self accessor];
  id v6 = [NSNumber numberWithBool:v4];
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E4F761C8], v6, 1);

  char v7 = FormatNSErrorForReturn();
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v7;
}

- (BOOL)isPrimary
{
  return [(AVAudioSession *)self sessionType] == 1886546285;
}

- (unint64_t)retainCount
{
  if (self->_impl && [(AVAudioSession *)self sessionType] == 1886546285) {
    return -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAudioSession;
  return [(AVAudioSession *)&v4 retainCount];
}

@end