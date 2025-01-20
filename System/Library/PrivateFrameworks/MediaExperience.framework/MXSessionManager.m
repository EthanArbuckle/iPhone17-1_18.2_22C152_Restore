@interface MXSessionManager
+ (BOOL)getSilentModeStateFromDisk;
+ (id)copyDefaultMusicAppFromPlist;
+ (id)copySilentModeUntilTimeFromDisk;
+ (id)sharedInstance;
- (BOOL)appendContextToMuteNotification;
- (BOOL)areBothBudsInEarForA2DPPort;
- (BOOL)areDuckerAndDuckeePlayingOnDifferentVADs:(id)a3 duckerSession:(id)a4;
- (BOOL)areSessionsWithAudioModesActive:(id)a3;
- (BOOL)canSessionsCoexistDueToIndependentRecording:(id)a3 victim:(id)a4;
- (BOOL)carPlayIsConnected;
- (BOOL)clientTypeOverridesHardwareSwitch:(unsigned int)a3;
- (BOOL)doesActiveSessionHaveInput;
- (BOOL)doesSessionPreferInterruptionOnRouteDisconnect:(id)a3;
- (BOOL)duckSessionForVoiceOverIfNeeded:(id)a3 voiceOverSession:(id)a4;
- (BOOL)getQuiesceableWiredPortAutoRouteOnConnectPreference:(unsigned int)a3;
- (BOOL)isAirPlaySession:(id)a3;
- (BOOL)isAnExistingDuckingSource:(id)a3;
- (BOOL)isAnyOtherUnduckedPlayingSessionMatchingVolumeRampCategory:(id)a3;
- (BOOL)isAnySessionWithMappedVolumeCategoryPlaying:(id)a3;
- (BOOL)isAtleastOneBudNotInEarForA2DPPort;
- (BOOL)isAudioCategoryAllowedForSharePlayMedia:(id)a3;
- (BOOL)isAudioCategoryMuteable:(id)a3;
- (BOOL)isAuditTokenEqual:(id *)a3 compareTo:(id *)a4;
- (BOOL)isAuditTokenValid:(id *)a3;
- (BOOL)isBTRouteSameDeviceWithDifferentProfile:(unsigned int)a3 newNumRoutes:(unsigned int)a4 oldRouteTypes:(id)a5 newRouteTypes:(id)a6 oldRouteIdentifiers:(id)a7 newRouteIdentifiers:(id)a8;
- (BOOL)isCurrentPortTypeMuteable:(unsigned int)a3;
- (BOOL)isLongFormVideoApp:(id)a3;
- (BOOL)isMixableSessionBeingInterruptedByNextRecordingClient:(id)a3 victim:(id)a4;
- (BOOL)isPIDAllowedToBeNowPlayingApp:(int)a3;
- (BOOL)isPotentialSharePlayMediaSessionActive;
- (BOOL)isSessionAllowedToStartRecordingTemporarily:(id)a3;
- (BOOL)isSessionDucked:(id)a3 duckingSource:(id)a4;
- (BOOL)isSessionUsingBuiltInMic:(id)a3;
- (BOOL)isSessionWithAudioCategoryActive:(id)a3;
- (BOOL)isSessionWithAudioModeActive:(id)a3;
- (BOOL)isSessionWithAudioModePlaying:(id)a3;
- (BOOL)isSessionWithAudioModeRecording:(id)a3;
- (BOOL)isSiriSessionActive:(BOOL *)a3 andMixable:(BOOL *)a4;
- (BOOL)isSiriSessionActiveAndRoutedToSiriOutputVAD;
- (BOOL)isSmartRoutingEligibleSessionAvailable;
- (BOOL)isSpeechDetectCategory:(id)a3;
- (BOOL)isVADIDRoutedToOutputPortType:(unsigned int)a3 portType:(unsigned int)a4;
- (BOOL)isVoiceOverDuckingActive:(id)a3 outDuckScalar:(float *)a4 outDuckFadeDuration:(float *)a5;
- (BOOL)mostRecentDuckOperation;
- (BOOL)phoneCallBehaviorSessionShouldResumeForCarPlay;
- (BOOL)sessionCanBecomeSharePlayMedia:(id)a3;
- (BOOL)sessionUtilizesIndependentRecordingOnly:(id)a3;
- (BOOL)shouldBlurOnHomePod:(id)a3 duckerSession:(id)a4;
- (BOOL)shouldDuckSessionForSpeakerVolumeLimit:(id)a3;
- (BOOL)shouldDuckSessionForVoiceOver:(id)a3;
- (BOOL)shouldResetWaitingToResume:(id)a3 currentSession:(id)a4;
- (BOOL)shouldSetDeviceFormatAndSampleRate:(id)a3;
- (BOOL)shouldSkipDuckingForVoiceOver:(id)a3 inActiveVoiceOverSession:(id)a4;
- (BOOL)silentModeEnabled;
- (BOOL)starkMainAudioIsOwnedByiOSButBorrowedByCar;
- (BOOL)unblurOnHomePod:(id)a3 unduckDuration:(float)a4;
- (BOOL)updateDuckVolumeForDucker:(id)a3 duckVolume:(float)a4 duckFadeDuration:(float)a5;
- (BOOL)updateUnduckVolume:(id)a3 duckerSession:(id)a4 unduckVolume:(float)a5 unduckFadeDuration:(float)a6;
- (BOOL)updateUnduckVolumeForDucker:(id)a3 unduckVolume:(float)a4 unduckFadeDuration:(float)a5;
- (BOOL)uplinkMute;
- (BOOL)uplinkMuteSetByClient;
- (BOOL)voiceOverSessionWantsRelativeDucking:(id)a3;
- (BOOL)voiceOverVADVolumeNeedsUpdate;
- (BOOL)wombatEnabled;
- (MXSessionManager)init;
- (NSArray)longFormVideoApps;
- (NSArray)recordingClientPIDs;
- (NSDate)appAllowedToInitiateRecordingTemporarilyTimestamp;
- (NSDate)silentModeEnabledUntilTime;
- (NSDictionary)audioDeviceInfo;
- (NSDictionary)detailedRoutesDescription;
- (NSDictionary)devicesSampleRates;
- (NSDictionary)figCategoryToMuteabilityDict;
- (NSDictionary)figCategoryToOutputOverridabilityDict;
- (NSDictionary)figCategoryToVADCategoryDict;
- (NSDictionary)figCustomizedCategoryWithBluetooth_Dict;
- (NSDictionary)figCustomizedCategoryWithDefaultBuiltIn_Default_Dict;
- (NSDictionary)figCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict;
- (NSDictionary)figCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict;
- (NSDictionary)figCustomizedCategoryWithoutBluetooth_Dict;
- (NSDictionary)figModeTypeToVADModeType;
- (NSDictionary)figRouteToVADInputPortTypeDict;
- (NSDictionary)figRouteToVADOutputPortTypeDict;
- (NSDictionary)figUncustomizedCategory_Dict;
- (NSDictionary)vadInputPortTypeToFigInputDeviceNameDict;
- (NSDictionary)vadOutputPortTypeToFigOutputDeviceNameDict;
- (NSDictionary)vadOutputPortTypeToMuteabilityDict;
- (NSLock)mxCoreSessionListReadLock;
- (NSMutableDictionary)pickableRoutesDescriptions;
- (NSMutableDictionary)quiesceableWiredPortsAutoRouteOnConnectPreference;
- (NSNumber)applyUplinkMuteToPhoneCallBehaviorSession;
- (NSPointerArray)mxCoreSessionList;
- (NSPointerArray)sessionsThatWantToSuspendNeroScreenMirroring;
- (NSRecursiveLock)propertiesLock;
- (NSSet)audioCategoriesWithInput;
- (NSSet)audioModesWithShortVoicePromptStyle;
- (NSSet)mutedSessionBundleIDs;
- (NSString)appAllowedToFadeInTemporarily;
- (NSString)appAllowedToInitiatePlaybackTemporarily;
- (NSString)appAllowedToInitiateRecordingTemporarily;
- (NSString)currentAudioCategory;
- (NSString)currentAudioMode;
- (NSString)defaultMusicApp;
- (NSString)silentModeReason;
- (NSString)systemMirroringRoutingContextUUID;
- (NSString)uplinkMutedBundleID;
- (OS_dispatch_semaphore)mxCoreSessionListWriteSemaphore;
- (float)duckScalarForVoiceOver;
- (float)duckVolumeForSpeakerVolumeLimit;
- (float)getDuckVolumeForBlurEffect:(id)a3 duckeeSession:(id)a4;
- (float)getScalarVolume:(float)a3;
- (float)getSleepDurationForDuckFadeDuration:(float)a3;
- (float)mostRecentDuckFadeDuration;
- (id)copyActiveSessionWithAudioCategory:(id)a3 andAudioMode:(id)a4;
- (id)copyActiveSessionsInfoForAdditiveRouting;
- (id)copyActiveVoiceOverSession;
- (id)copyAudioBehaviorForCategory:(id)a3 mode:(id)a4;
- (id)copyEvaluatedBadgeType:(id)a3;
- (id)copyHighestPriorityActiveSession:(id)a3 deviceIdentifier:(id)a4;
- (id)copyInterruptedSessions:(id)a3;
- (id)copyMXCoreSessionList;
- (id)copyPhoneCallBehaviorRecordingSession;
- (id)copyPotentialActiveSharePlayMediaSession;
- (id)copySessionEligibleForNowPlayingAppConsideration:(int)a3;
- (id)copySessionToBeMuted:(id *)a3;
- (id)copySessionWithAudioSessionID:(unsigned int)a3;
- (id)copySessionWithPID:(int)a3;
- (id)copySessionsWithAuditToken:(id *)a3;
- (id)copySpeechDetectSession;
- (id)copyVoiceOverSession;
- (id)getAvailableAudioDestination:(id)a3;
- (id)getBluetoothCustomizedAlternateCategory:(id)a3 enableBluetooth:(BOOL)a4;
- (id)getCleanupSessionAssertionReasonString:(int64_t)a3;
- (id)getClientPriorityAsString:(unsigned int)a3;
- (id)getDefaultBuiltInCustomizedAlternateCategory:(id)a3 defaultBuiltInRoute:(id)a4;
- (id)getDisallowedRecordingReasonString:(unint64_t)a3;
- (id)getDuckingSource:(id)a3 duckerSession:(id)a4;
- (id)getProjectedAudioDestinationForCategory:(id)a3 mode:(id)a4;
- (id)getRouteSharingPolicyAsString:(int)a3;
- (id)getSilentModeClientTypeAsString:(unsigned int)a3;
- (id)getUncustomizedCategory:(id)a3;
- (int)blurOnHomePod:(id)a3 duckerSession:(id)a4 duckVolume:(float)a5 duckFadeDuration:(float)a6;
- (int)clearUplinkMutedCache;
- (int)getMuteState:(id *)a3 outMuteValue:(BOOL *)a4;
- (int)getSessionPriority:(MXSessionPlayingInfo *)a3 forTipi:(BOOL)a4;
- (int)getVolumeButtonDelta:(id)a3 outVolumeDelta:(float *)a4;
- (int)updateDuckToLevelScalarSetByClient:(BOOL)a3 session:(id)a4 newLevel:(float)a5 newLevelSetByClient:(BOOL)a6 currentLevel:(float)a7 currentLevelSetByClient:(BOOL)a8;
- (int)updateMuteState:(id *)a3 muteValue:(id)a4;
- (int)updateSecureSpeakerMuteState:(BOOL)a3;
- (unint64_t)addSessionThatWantsToSuspendNeroScreenMirroring:(id)a3;
- (unint64_t)mxCoreSessionListAddSession:(id)a3;
- (unint64_t)mxCoreSessionListRemoveSession:(id)a3;
- (unint64_t)removeSessionThatWantsToSuspendNeroScreenMirroring:(id)a3;
- (unsigned)actuatorVADID;
- (unsigned)currentSpeechDetectStyle:(id)a3;
- (unsigned)currentStream0;
- (unsigned)decoupledInputVADID;
- (unsigned)defaultVADID;
- (unsigned)getSpeechDetectStyleForSessionConfiguration:(id)a3;
- (unsigned)lowLatencyVADID;
- (unsigned)musicVADID;
- (unsigned)mxCoreSessionListActiveReaders;
- (unsigned)perAppAirPlayVADID;
- (unsigned)silentModeClient;
- (unsigned)siriOutputVADID;
- (unsigned)speakerAlertVADID;
- (unsigned)speechDetectionVADID;
- (unsigned)systemSoundLocalVADID;
- (unsigned)systemSoundRemoteVADID;
- (void)addDuckerToSession:(id)a3 duckerSession:(id)a4 duckingSource:(id)a5;
- (void)appToInterruptCurrentNowPlayingSession:(id)a3;
- (void)applyUplinkMute:(id)a3;
- (void)cancelAnyInProgressRampIfNeeded:(id)a3 reason:(unsigned __int16)a4;
- (void)cleanupSessionAssertionsIfNeeded:(id)a3 cleanupReason:(int64_t)a4;
- (void)dealloc;
- (void)duckSessionIfDuckerIsActive:(id)a3;
- (void)duckSessionsForDucker:(id)a3 sessionsToDuck:(id)a4;
- (void)duckVolume:(id)a3 duckerSession:(id)a4 duckingSource:(id)a5;
- (void)dumpDebugInfo;
- (void)endAsyncDuckingOperation;
- (void)endAsyncDuckingOperationForSession:(id)a3;
- (void)getAndResetAsyncDuckingParameters:(BOOL *)a3 mostRecentDuckFadeDuration:(float *)a4;
- (void)getUpdatedDuckVolume:(id)a3 outDuckVolume:(float *)a4;
- (void)handleSilentModeTimerDidFire;
- (void)interruptActiveSessionsNotOptedIntoWombat;
- (void)interruptAllSessionsAndSystemSounds:(id)a3;
- (void)interruptEligibleSessionsOnContinuityScreenOutputPortAvailableDidChange;
- (void)interruptRecordingSessionsOnContinuityScreenOutputPortAvailableDidChange;
- (void)interruptSessionsForCategoryNoLongerRoutable;
- (void)interruptSessionsOnRouteDisconnect:(id)a3;
- (void)makeStarkPortRoutableForPhoneCall:(BOOL)a3;
- (void)makeStarkPortRoutableForPlayingSession:(BOOL)a3;
- (void)mxCoreSessionListBeginIteration;
- (void)mxCoreSessionListEndIteration;
- (void)nowPlayingAppShouldResumeForCarPlay:(BOOL)a3;
- (void)postDisallowedActivationDueToContinuityCaptureNotification:(BOOL)a3 videoPlaybackWasIntended:(BOOL)a4;
- (void)postDisallowedRecordingNotification:(unint64_t)a3;
- (void)postStopCommandToSessionsWithAudioMode:(id)a3;
- (void)processContinuityScreenOutputPortAvailableDidChange:(BOOL)a3;
- (void)pvmStateDidChangeCallback:(id)a3;
- (void)refreshDeviceSampleRateCache;
- (void)remoteDeviceControlIsAllowed:(unsigned int *)a3;
- (void)removeDuckerForSession:(id)a3 sessionCausingUnduck:(id)a4 duckingSource:(id)a5 outLastDuckingSourceWasRemoved:(BOOL *)a6;
- (void)removeEntryFromMutedBundleIDCache:(int)a3 bundleID:(id)a4;
- (void)removeSilentModeTimer;
- (void)replaceMutedBundleIDwithHostID;
- (void)resetDefaultMusicApp;
- (void)resetWaitingToResume:(id)a3;
- (void)ringerIsOnChanged:(BOOL)a3;
- (void)setActuatorVADID:(unsigned int)a3;
- (void)setAppAllowedToFadeInTemporarily:(id)a3;
- (void)setAppAllowedToInitiatePlaybackTemporarily:(id)a3;
- (void)setAppAllowedToInitiateRecordingTemporarily:(id)a3;
- (void)setAppendContextToMuteNotification:(BOOL)a3;
- (void)setApplyUplinkMuteToPhoneCallBehaviorSession:(id)a3;
- (void)setAudioDeviceInfo:(id)a3;
- (void)setCarPlayIsConnected:(BOOL)a3;
- (void)setCurrentAudioCategory:(id)a3;
- (void)setCurrentAudioMode:(id)a3;
- (void)setCurrentStream0:(unsigned int)a3;
- (void)setDecoupledInputVADID:(unsigned int)a3;
- (void)setDefaultMusicApp:(id)a3;
- (void)setDefaultVADID:(unsigned int)a3;
- (void)setDetailedRoutesDescription:(id)a3;
- (void)setDevicesSampleRates:(id)a3;
- (void)setDuckScalarForVoiceOver:(float)a3;
- (void)setFigCategoryToMuteabilityDict:(id)a3;
- (void)setFigCategoryToOutputOverridabilityDict:(id)a3;
- (void)setFigCategoryToVADCategoryDict:(id)a3;
- (void)setFigCustomizedCategoryWithBluetooth_Dict:(id)a3;
- (void)setFigCustomizedCategoryWithDefaultBuiltIn_Default_Dict:(id)a3;
- (void)setFigCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict:(id)a3;
- (void)setFigCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict:(id)a3;
- (void)setFigCustomizedCategoryWithoutBluetooth_Dict:(id)a3;
- (void)setFigModeTypeToVADModeType:(id)a3;
- (void)setFigRouteToVADInputPortTypeDict:(id)a3;
- (void)setFigRouteToVADOutputPortTypeDict:(id)a3;
- (void)setFigUncustomizedCategory_Dict:(id)a3;
- (void)setLongFormVideoApps:(id)a3;
- (void)setLowLatencyVADID:(unsigned int)a3;
- (void)setMostRecentDuckFadeDuration:(float)a3;
- (void)setMostRecentDuckOperation:(BOOL)a3;
- (void)setMusicVADID:(unsigned int)a3;
- (void)setMutedSessionBundleIDs:(id)a3;
- (void)setMxCoreSessionList:(id)a3;
- (void)setMxCoreSessionListActiveReaders:(unsigned int)a3;
- (void)setMxCoreSessionListReadLock:(id)a3;
- (void)setMxCoreSessionListWriteSemaphore:(id)a3;
- (void)setPerAppAirPlayVADID:(unsigned int)a3;
- (void)setPhoneCallBehaviorSessionShouldResumeForCarPlay:(BOOL)a3;
- (void)setPickableRoutesDescriptions:(id)a3;
- (void)setPropertiesLock:(id)a3;
- (void)setQuiesceableWiredPortPreference:(unsigned int)a3 autoRouteOnConnect:(BOOL)a4;
- (void)setQuiesceableWiredPortsAutoRouteOnConnectPreference:(id)a3;
- (void)setRecordingClientPIDs:(id)a3;
- (void)setSessionsThatWantToSuspendNeroScreenMirroring:(id)a3;
- (void)setSilentModeClient:(unsigned int)a3;
- (void)setSilentModeEnabled:(BOOL)a3;
- (void)setSilentModeEnabledUntilTime:(id)a3;
- (void)setSilentModeReason:(id)a3;
- (void)setSiriOutputVADID:(unsigned int)a3;
- (void)setSpeakerAlertVADID:(unsigned int)a3;
- (void)setSpeechDetectionVADID:(unsigned int)a3;
- (void)setStarkMainAudioIsOwnedByiOSButBorrowedByCar:(BOOL)a3;
- (void)setSystemMirroringRoutingContextUUID:(id)a3;
- (void)setSystemSoundLocalVADID:(unsigned int)a3;
- (void)setSystemSoundRemoteVADID:(unsigned int)a3;
- (void)setUpStringConversionDictionaries;
- (void)setUplinkMute:(BOOL)a3;
- (void)setUplinkMuteSetByClient:(BOOL)a3;
- (void)setUplinkMutedBundleID:(id)a3;
- (void)setVADID:(unsigned int)a3 forVADName:(id)a4;
- (void)setVadInputPortTypeToFigInputDeviceNameDict:(id)a3;
- (void)setVadOutputPortTypeToFigOutputDeviceNameDict:(id)a3;
- (void)setVadOutputPortTypeToMuteabilityDict:(id)a3;
- (void)setVoiceOverVADVolumeNeedsUpdate:(BOOL)a3;
- (void)setWombatEnabled:(BOOL)a3;
- (void)sleepForAsyncDucking:(BOOL)a3 duration:(float)a4;
- (void)startAsyncDuckingOperation;
- (void)unduckSessionsForDucker:(id)a3;
- (void)unduckSessionsForDuckingSource:(id)a3;
- (void)unduckSessionsForVoiceOverDuckingSource;
- (void)unduckVolume:(id)a3 sessionCausingUnduck:(id)a4 duckingSource:(id)a5;
- (void)updateActiveSessionsOnDeviceRelinquished;
- (void)updateBadgeType:(id)a3 matchingPID:(int)a4;
- (void)updateBluetoothFrameworkToPlayMuteChime:(id)a3 playRejectTone:(BOOL)a4;
- (void)updateCachedContinuityScreenOutputPortID;
- (void)updateDeviceSampleRate:(unsigned int)a3;
- (void)updateDuckVolume:(id)a3 duckerSession:(id)a4 duckVolume:(float)a5 duckFadeDuration:(float)a6;
- (void)updateDuckedSessionsForVoiceOver:(id)a3;
- (void)updateDuckedSessionsForVoiceOverIfNeededOnRouteChange;
- (void)updateDuckingSourceInfoForSession:(id)a3 duckerSession:(id)a4 duckVolume:(float)a5 duckFadeDuration:(float)a6;
- (void)updateExclaveSensorStatusIfNeeded;
- (void)updateMostRecentDuckFadeDuration:(float)a3 duckOperation:(BOOL)a4 duckerSession:(id)a5 sessionToDuck:(id)a6;
- (void)updateMutedBundleIDs:(id)a3 muteValue:(BOOL)a4;
- (void)updateNeroScreenState:(id)a3 suspendScreen:(BOOL)a4;
- (void)updateSilentModeState:(BOOL)a3 untilTime:(id)a4 withReason:(id)a5 forClientType:(unsigned int)a6 updateForStartup:(BOOL)a7;
- (void)updateSilentModeTimer:(BOOL)a3 untilTime:(id)a4 clientType:(unsigned int)a5;
- (void)updateSupportedOutputChannelLayouts;
- (void)updateSupportedOutputChannelLayouts:(id)a3 matchingPID:(int)a4;
- (void)volumePreferenceDidChangeCallback:(id)a3;
@end

@implementation MXSessionManager

- (id)copyMXCoreSessionList
{
  v3 = (void *)MEMORY[0x1997179E0](self, a2);
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  v4 = [(NSPointerArray *)[(MXSessionManager *)self mxCoreSessionList] allObjects];
  [(MXSessionManager *)self mxCoreSessionListEndIteration];
  return v4;
}

- (NSPointerArray)mxCoreSessionList
{
  return self->_mxCoreSessionList;
}

- (void)mxCoreSessionListBeginIteration
{
  [(NSLock *)[(MXSessionManager *)self mxCoreSessionListReadLock] lock];
  [(MXSessionManager *)self setMxCoreSessionListActiveReaders:[(MXSessionManager *)self mxCoreSessionListActiveReaders] + 1];
  if ([(MXSessionManager *)self mxCoreSessionListActiveReaders] == 1) {
    dispatch_semaphore_wait((dispatch_semaphore_t)[(MXSessionManager *)self mxCoreSessionListWriteSemaphore], 0xFFFFFFFFFFFFFFFFLL);
  }
  v3 = [(MXSessionManager *)self mxCoreSessionListReadLock];
  [(NSLock *)v3 unlock];
}

- (NSLock)mxCoreSessionListReadLock
{
  return self->_mxCoreSessionListReadLock;
}

- (unsigned)mxCoreSessionListActiveReaders
{
  return self->_mxCoreSessionListActiveReaders;
}

- (void)setMxCoreSessionListActiveReaders:(unsigned int)a3
{
  self->_mxCoreSessionListActiveReaders = a3;
}

- (OS_dispatch_semaphore)mxCoreSessionListWriteSemaphore
{
  return self->_mxCoreSessionListWriteSemaphore;
}

- (void)mxCoreSessionListEndIteration
{
  [(NSLock *)[(MXSessionManager *)self mxCoreSessionListReadLock] lock];
  [(MXSessionManager *)self setMxCoreSessionListActiveReaders:[(MXSessionManager *)self mxCoreSessionListActiveReaders] - 1];
  if (![(MXSessionManager *)self mxCoreSessionListActiveReaders]) {
    dispatch_semaphore_signal((dispatch_semaphore_t)[(MXSessionManager *)self mxCoreSessionListWriteSemaphore]);
  }
  v3 = [(MXSessionManager *)self mxCoreSessionListReadLock];
  [(NSLock *)v3 unlock];
}

- (NSString)currentAudioCategory
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (id)copySpeechDetectSession
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v4 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 hasAudioCategory:@"SpeechDetect"])
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v8 = 0;
LABEL_11:
  [(MXSessionManager *)self mxCoreSessionListEndIteration];
  return v8;
}

- (unsigned)currentSpeechDetectStyle:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t CurrentOutputPortAtIndex = CMSMUtility_GetCurrentOutputPortAtIndex(0);
  int DoesBluetoothSupportFeature = vaeDoesBluetoothSupportFeature(CurrentOutputPortAtIndex);
  BOOL v6 = [+[MXSessionManager sharedInstance] wombatEnabled];
  char v7 = v6;
  if (v6) {
    unsigned int v8 = 4;
  }
  else {
    unsigned int v8 = 0;
  }
  if (!v6 && DoesBluetoothSupportFeature) {
    unsigned int v8 = [a3 hasAudioCategory:@"SpeechDetect"];
  }
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v10 = [(NSPointerArray *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v24 = 0;
    uint64_t v12 = *(void *)v26;
LABEL_9:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v9);
      }
      char v14 = v8 ? v7 : 1;
      if (v14 & 1 | (DoesBluetoothSupportFeature == 0)) {
        break;
      }
      v15 = *(void **)(*((void *)&v25 + 1) + 8 * v13);
      if (([v15 hasAudioCategory:@"SpeechDetect"] & 1) == 0
        && [v15 isActive]
        && !CMSUtility_DoesSessionRemainActiveAfterStoppingPlaying(v15))
      {
        unsigned int v16 = [(MXSessionManager *)self getSpeechDetectStyleForSessionConfiguration:v15];
        switch(v16)
        {
          case 2u:
            v17 = v24;
            if (v8 != 2) {
              v17 = v15;
            }
            v24 = v17;
            unsigned int v8 = 2;
            break;
          case 3u:
            v18 = v24;
            if ((v8 & 0xFFFFFFFE) != 2) {
              v18 = v15;
            }
            v24 = v18;
            if ((v8 & 0xFFFFFFFE) != 2) {
              unsigned int v8 = 3;
            }
            break;
          case 4u:
            unsigned int v8 = 4;
            goto LABEL_33;
        }
      }
      if (v11 == ++v13)
      {
        uint64_t v19 = [(NSPointerArray *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        uint64_t v11 = v19;
        if (v19) {
          goto LABEL_9;
        }
        break;
      }
    }
  }
LABEL_33:
  [(MXSessionManager *)self mxCoreSessionListEndIteration];
  if (v8 != currentSpeechDetectStyle__sPreviousSpeechDetectStyle && dword_1E9359ED0 != 0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  currentSpeechDetectStyle__sPreviousSpeechDetectStyle = v8;
  return v8;
}

- (BOOL)wombatEnabled
{
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];
  BOOL wombatEnabled = self->_wombatEnabled;
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
  return wombatEnabled;
}

- (BOOL)isSpeechDetectCategory:(id)a3
{
  int IsSpeechDetectEnabled = MX_FeatureFlags_IsSpeechDetectEnabled();
  if (IsSpeechDetectEnabled)
  {
    LOBYTE(IsSpeechDetectEnabled) = [a3 isEqualToString:@"SpeechDetect"];
  }
  return IsSpeechDetectEnabled;
}

- (int)getSessionPriority:(MXSessionPlayingInfo *)a3 forTipi:(BOOL)a4
{
  BOOL v4 = a4;
  if (mxsmInteruptionActionMapper_setUpInterruptionPriorityDictionaries_onceToken != -1) {
    dispatch_once(&mxsmInteruptionActionMapper_setUpInterruptionPriorityDictionaries_onceToken, &__block_literal_global_6);
  }
  if (!a3->var4) {
    goto LABEL_30;
  }
  if (v4)
  {
    uint64_t v6 = objc_msgSend((id)sCategoryToCategoryMapForTipi, "objectForKey:");
    if (v6)
    {
      uint64_t v7 = v6;
      unsigned int v8 = &sCategoryToPriorityMapForTipi;
      goto LABEL_10;
    }
LABEL_30:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 100;
  }
  uint64_t v9 = objc_msgSend((id)sCategoryToCategoryMapForTriangle, "objectForKey:");
  if (!v9) {
    goto LABEL_30;
  }
  uint64_t v7 = v9;
  unsigned int v8 = &sCategoryToPriorityMapForTriangle;
LABEL_10:
  uint64_t v10 = (void *)[(id)*v8 objectForKey:v7];
  if (!v10) {
    goto LABEL_30;
  }
  uint64_t v11 = v10;
  uint64_t v12 = [v10 count];
  if (v12 < 1) {
    return 100;
  }
  uint64_t v13 = v12;
  uint64_t v14 = 0;
  while (1)
  {
    v15 = (void *)[v11 objectAtIndex:v14];
    unsigned int v16 = (void *)[v15 objectForKey:@"AudioMode"];
    v17 = (void *)[v15 objectForKey:@"Priority"];
    v18 = (void *)[v15 objectForKey:@"InterruptionStyle"];
    if (v18)
    {
      uint64_t v19 = v18;
      unsigned int var2 = a3->var2;
      if ([v18 isEqualToString:@"NonMixable"])
      {
        int v21 = 15;
      }
      else if ([v19 isEqualToString:@"Mixable"])
      {
        int v21 = 48;
      }
      else
      {
        int v21 = 0;
      }
      BOOL v22 = (v21 & var2) != 0;
      if (!v16) {
        goto LABEL_27;
      }
    }
    else
    {
      BOOL v22 = 1;
      if (!v16) {
        goto LABEL_27;
      }
    }
    id var5 = a3->var5;
    uint64_t v24 = [v16 count];
    if (v24 >= 1)
    {
      uint64_t v25 = v24;
      uint64_t v26 = 0;
      while (!objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", v26), "isEqualToString:", var5))
      {
        if (v25 == ++v26) {
          goto LABEL_28;
        }
      }
    }
LABEL_27:
    if (v22) {
      break;
    }
LABEL_28:
    if (++v14 == v13) {
      return 100;
    }
  }
  int v30 = [v17 unsignedIntValue];
  int v28 = v30;
  if (a3->var3 == 10 && v30 != 100 && ([a3->var4 isEqualToString:@"Ringtone"] & 1) == 0)
  {
    if (dword_1E9359ED0)
    {
      v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 501;
  }
  return v28;
}

- (BOOL)uplinkMute
{
  return self->_uplinkMute;
}

- (NSSet)audioCategoriesWithInput
{
  return self->_audioCategoriesWithInput;
}

- (id)getAvailableAudioDestination:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"VirtualAudioDevice_Default";
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (vaemIsAudioDestinationAvailable((uint64_t)v9)) {
          return v9;
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v4;
}

- (unsigned)decoupledInputVADID
{
  id v2 = [(NSDictionary *)[(MXSessionManager *)self audioDeviceInfo] objectForKey:0x1EE5EFAC8];
  return [v2 unsignedIntValue];
}

- (NSDictionary)audioDeviceInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)figCategoryToVADCategoryDict
{
  return self->_figCategoryToVADCategoryDict;
}

- (NSDictionary)figModeTypeToVADModeType
{
  return self->_figModeTypeToVADModeType;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_21);
  }
  return (id)sharedInstance_sSharedInstance_3;
}

- (NSRecursiveLock)propertiesLock
{
  return self->_propertiesLock;
}

- (NSMutableDictionary)pickableRoutesDescriptions
{
  return self->_pickableRoutesDescriptions;
}

- (BOOL)isPIDAllowedToBeNowPlayingApp:(int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [+[MXSessionManager sharedInstance] copyMXCoreSessionList];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v10, "clientPID"), "intValue") == a3)
        {
          if (CMSUtility_GetIsEligibleForNowPlayingAppConsideration(v10))
          {
            ++v7;
            if (![v10 allowedToBeNowPlayingApp])
            {
              BOOL v11 = 0;
              goto LABEL_15;
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v7 = 0;
  }
  BOOL v11 = 1;
LABEL_15:

  return v7 && v11;
}

- (void)updateSupportedOutputChannelLayouts:(id)a3 matchingPID:(int)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = [+[MXSessionManager sharedInstance] copyMXCoreSessionList];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "clientPID"), "intValue") == a4) {
          [v11 setSupportedOutputChannelLayouts:a3];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)updateBadgeType:(id)a3 matchingPID:(int)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = [+[MXSessionManager sharedInstance] copyMXCoreSessionList];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "clientPID"), "intValue") == a4) {
          [v11 setBadgeType:a3];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)refreshDeviceSampleRateCache
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];
  if (dword_1E9359ED0)
  {
    unsigned int v30 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[MXSessionManager setDevicesSampleRates:](self, "setDevicesSampleRates:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionary", v17, v19));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [(MXSessionManager *)self audioDeviceInfo];
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        -[MXSessionManager updateDeviceSampleRate:](self, "updateDeviceSampleRate:", objc_msgSend(-[NSDictionary objectForKey:](-[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo"), "objectForKey:", *(void *)(*((void *)&v25 + 1) + 8 * i)), "unsignedIntValue"));
      }
      uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v6);
  }
  if (CMSMVAUtility_IsAdditiveRoutingEnabled())
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [+[MXAdditiveRoutingManager sharedInstance] vadNameToID];
    uint64_t v10 = [(NSDictionary *)v9 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          -[MXSessionManager updateDeviceSampleRate:](self, "updateDeviceSampleRate:", objc_msgSend(-[NSDictionary objectForKey:](-[MXAdditiveRoutingManager vadNameToID](+[MXAdditiveRoutingManager sharedInstance](MXAdditiveRoutingManager, "sharedInstance"), "vadNameToID"), "objectForKey:", *(void *)(*((void *)&v21 + 1) + 8 * j)), "unsignedIntValue"));
        }
        uint64_t v11 = [(NSDictionary *)v9 countByEnumeratingWithState:&v21 objects:v31 count:16];
      }
      while (v11);
    }
  }
  if (dword_1E9359ED0)
  {
    unsigned int v30 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    long long v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v15 = v30;
    if (os_log_type_enabled(v14, type)) {
      unsigned int v16 = v15;
    }
    else {
      unsigned int v16 = v15 & 0xFFFFFFFE;
    }
    if (v16)
    {
      int v33 = 136315138;
      v34 = "-[MXSessionManager refreshDeviceSampleRateCache]";
      LODWORD(v20) = 12;
      uint64_t v18 = &v33;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
}

- (void)setVADID:(unsigned int)a3 forVADName:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithDictionary:", -[MXSessionManager audioDeviceInfo](self, "audioDeviceInfo"));
  objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", v5), a4);
  [(MXSessionManager *)self updateDeviceSampleRate:v5];
  -[MXSessionManager setAudioDeviceInfo:](self, "setAudioDeviceInfo:", [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7]);
}

- (void)updateDeviceSampleRate:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];
    id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithDictionary:", -[MXSessionManager devicesSampleRates](self, "devicesSampleRates"));
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", vaemGetSampleRateForDevice(v3)), objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", v3));
    -[MXSessionManager setDevicesSampleRates:](self, "setDevicesSampleRates:", [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v5]);
    [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
  }
}

- (NSDictionary)devicesSampleRates
{
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];
  uint64_t v3 = self->_devicesSampleRates;
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
  return v3;
}

- (void)setAudioDeviceInfo:(id)a3
{
}

- (id)copySessionWithAudioSessionID:(unsigned int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 audioSessionID] == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_11:
  [(MXSessionManager *)self mxCoreSessionListEndIteration];
  return v10;
}

- (void)setDevicesSampleRates:(id)a3
{
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];

  self->_devicesSampleRates = (NSDictionary *)a3;
  id v5 = [(MXSessionManager *)self propertiesLock];
  [(NSRecursiveLock *)v5 unlock];
}

- (id)copyAudioBehaviorForCategory:(id)a3 mode:(id)a4
{
  if (!qword_1E9359BE0) {
    return 0;
  }
  if (!a3 || !a4)
  {
    if (!dword_1E9359ED0) {
      return 0;
    }
LABEL_14:
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  uint64_t CategoryStringWithModeAppended = CMSMUtility_CreateCategoryStringWithModeAppended((uint64_t)[+[MXSessionManager sharedInstance] getUncustomizedCategory:a3], (uint64_t)a4);
  if (!CategoryStringWithModeAppended) {
    goto LABEL_14;
  }
  uint64_t v6 = (void *)CategoryStringWithModeAppended;
  uint64_t v7 = CMSMUtility_CopyCurrentRouteTypes();
  if ([a3 isEqualToString:@"VoiceOver"]
    && [(__CFArray *)v7 containsObject:@"BluetoothLEOutput"])
  {
    CFTypeRef v8 = CMSMUtility_CopyVoiceOverOverBTLEAudioDictionary();
  }
  else
  {
    id v9 = (id)[(id)qword_1E9359BE0 objectForKey:v6];
    if (v9) {
      goto LABEL_13;
    }
    CFTypeRef v8 = (id)[(id)qword_1E9359BE0 objectForKey:@"Default"];
  }
  id v9 = (id)v8;
LABEL_13:

  if (!v9) {
    goto LABEL_14;
  }
  return v9;
}

- (id)getUncustomizedCategory:(id)a3
{
  id result = [(NSDictionary *)[(MXSessionManager *)self figUncustomizedCategory_Dict] objectForKey:a3];
  if (!result) {
    return a3;
  }
  return result;
}

- (NSDictionary)figUncustomizedCategory_Dict
{
  return self->_figUncustomizedCategory_Dict;
}

- (BOOL)isLongFormVideoApp:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"DisableLongFormVideoApp", @"com.apple.coremedia", &keyExistsAndHasValidFormat);
  BOOL v6 = 0;
  if (keyExistsAndHasValidFormat) {
    BOOL v7 = AppBooleanValue == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    return v6;
  }
  if (CMSMDeviceState_ItsAHomePod())
  {
    if (!a3) {
      return 0;
    }
  }
  else
  {
    FigMobileAsset_UpdateCatalogIfTimeIntervalElapsed();
    if (!a3) {
      return 0;
    }
  }
  if (![a3 length]) {
    return 0;
  }
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];
  longFormVideoApps = self->_longFormVideoApps;
  if (longFormVideoApps) {
    BOOL v6 = [(NSArray *)longFormVideoApps containsObject:a3];
  }
  else {
    BOOL v6 = 0;
  }
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
  return v6;
}

- (BOOL)sessionUtilizesIndependentRecordingOnly:(id)a3
{
  int IsAdditiveRoutingEnabled = CMSMVAUtility_IsAdditiveRoutingEnabled();
  if (IsAdditiveRoutingEnabled)
  {
    if (([a3 isRoutedToOnDemandVAD] & 1) != 0
      || (int IsAdditiveRoutingEnabled = [a3 willRouteToOnDemandVADOnActivation]) != 0)
    {
      if ([a3 hasAudioMode:@"SoundRecognition"])
      {
        LOBYTE(IsAdditiveRoutingEnabled) = 1;
      }
      else
      {
        int IsAdditiveRoutingEnabled = [a3 mixesWithEveryone];
        if (IsAdditiveRoutingEnabled) {
          LOBYTE(IsAdditiveRoutingEnabled) = CMSMUtility_IsCategoryInputOnly((const void *)[a3 audioCategory]);
        }
      }
    }
  }
  return IsAdditiveRoutingEnabled;
}

- (id)copyActiveSessionsInfoForAdditiveRouting
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v4 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        CFTypeRef v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v8, "isActive", v12, v13)
          && !-[MXSessionManager isSpeechDetectCategory:](self, "isSpeechDetectCategory:", [v8 audioCategory])&& (objc_msgSend(v8, "isIDSMXCoreSession") & 1) == 0&& (objc_msgSend(v8, "isHardwareSafetySession") & 1) == 0)
        {
          uint64_t v9 = [v8 additiveRoutingInfo];
          if (v9)
          {
            [v14 addObject:v9];
          }
          else
          {
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
      }
      uint64_t v5 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  [(MXSessionManager *)self mxCoreSessionListEndIteration];
  return v14;
}

- (BOOL)isCurrentPortTypeMuteable:(unsigned int)a3
{
  if (a3) {
    id v3 = [(NSDictionary *)[(MXSessionManager *)self vadOutputPortTypeToMuteabilityDict] objectForKey:a3];
  }
  else {
    id v3 = 0;
  }
  return [v3 isEqualToString:0x1EE5E98A8];
}

- (BOOL)isAudioCategoryMuteable:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [(NSDictionary *)[(MXSessionManager *)self figCategoryToMuteabilityDict] objectForKey:a3];
  return [v3 isEqualToString:0x1EE5E98A8];
}

- (NSDictionary)vadOutputPortTypeToMuteabilityDict
{
  return self->_vadOutputPortTypeToMuteabilityDict;
}

- (NSDictionary)figCategoryToMuteabilityDict
{
  return self->_figCategoryToMuteabilityDict;
}

- (NSString)appAllowedToFadeInTemporarily
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (NSArray)recordingClientPIDs
{
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];
  if ([(NSArray *)self->_recordingClientPIDs count]) {
    id v3 = (NSArray *)(id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_recordingClientPIDs copyItems:1];
  }
  else {
    id v3 = 0;
  }
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
  return v3;
}

- (void)setRecordingClientPIDs:(id)a3
{
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];

  self->_recordingClientPIDs = (NSArray *)a3;
  uint64_t v5 = [(MXSessionManager *)self propertiesLock];
  [(NSRecursiveLock *)v5 unlock];
}

- (BOOL)areBothBudsInEarForA2DPPort
{
  uint64_t CurrentOutputPortAtIndex = CMSMUtility_GetCurrentOutputPortAtIndex(0);
  AudioObjectID v3 = CurrentOutputPortAtIndex;
  if (vaeGetPortTypeFromPortID(CurrentOutputPortAtIndex) != 1885892674) {
    goto LABEL_5;
  }
  int DoesBTPortSupportInEarDetection = vaeDoesBTPortSupportInEarDetection(v3);
  if (DoesBTPortSupportInEarDetection)
  {
    if (vaeGetBTPortPrimaryBudInEarStatus(v3) == 1)
    {
      LOBYTE(DoesBTPortSupportInEarDetection) = vaeGetBTPortSecondaryBudInEarStatus(v3) == 1;
      return DoesBTPortSupportInEarDetection;
    }
LABEL_5:
    LOBYTE(DoesBTPortSupportInEarDetection) = 0;
  }
  return DoesBTPortSupportInEarDetection;
}

- (NSDictionary)vadOutputPortTypeToFigOutputDeviceNameDict
{
  return self->_vadOutputPortTypeToFigOutputDeviceNameDict;
}

- (void)setUplinkMutedBundleID:(id)a3
{
}

- (id)getBluetoothCustomizedAlternateCategory:(id)a3 enableBluetooth:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = [(MXSessionManager *)self figCustomizedCategoryWithBluetooth_Dict];
  }
  else {
    uint64_t v5 = [(MXSessionManager *)self figCustomizedCategoryWithoutBluetooth_Dict];
  }
  id result = [(NSDictionary *)v5 objectForKey:a3];
  if (!result) {
    return a3;
  }
  return result;
}

- (NSDictionary)figCustomizedCategoryWithBluetooth_Dict
{
  return self->_figCustomizedCategoryWithBluetooth_Dict;
}

- (NSDictionary)figCustomizedCategoryWithoutBluetooth_Dict
{
  return self->_figCustomizedCategoryWithoutBluetooth_Dict;
}

- (void)volumePreferenceDidChangeCallback:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 userInfo];
  v45 = (void *)[v4 objectForKey:0x1EE5E9248];
  v43 = (void *)[v4 objectForKey:0x1EE5E92A8];
  uint64_t v5 = (void *)[v4 objectForKey:0x1EE5EBDE8];
  [v4 objectForKey:0x1EE5EB228];
  uint64_t v6 = (void *)[v4 objectForKey:0x1EE5F1068];
  objc_msgSend((id)objc_msgSend(v4, "objectForKey:", 0x1EE5FAE68), "floatValue");
  float v8 = v7;
  objc_msgSend((id)objc_msgSend(v4, "objectForKey:", 0x1EE5FAE88), "floatValue");
  float v10 = v9;
  char v46 = [v5 isEqualToString:@"ImplicitVolumeChange"];
  if (v6)
  {
    [v6 floatValue];
    float v12 = v11;
  }
  else
  {
    float v12 = PVMGetCurrentPreferredVolume();
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:"), @"Volume");
  }
  [v4 removeObjectForKey:0x1EE5FAE68];
  [v4 removeObjectForKey:0x1EE5FAE88];
  MEMORY[0x199716E90](gCMSM);
  if (CMSMVAUtility_IsAdditiveRoutingEnabled()
    && [(MXSessionManager *)self voiceOverVADVolumeNeedsUpdate])
  {
    id v13 = [+[MXAdditiveRoutingManager sharedInstance] copyActiveVoiceOverSessionPlayingToOnDemandVAD];
    BOOL v44 = v13 != 0;
    if (v13)
    {
      if (dword_1E9359ED0)
      {
        unsigned int v53 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMSUtility_UpdatePlaybackVolume(v13, 0.0, 0.0);
    }

    [(MXSessionManager *)self setVoiceOverVADVolumeNeedsUpdate:0];
  }
  else
  {
    BOOL v44 = 0;
    id v13 = 0;
  }
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v15 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v16 = [(NSPointerArray *)v15 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (!v16)
  {
    [(MXSessionManager *)self mxCoreSessionListEndIteration];
    long long v17 = 0;
LABEL_34:
    if (vaemSystemSoundLocalVADExists())
    {
      if ([v17 isActive]
        && (int CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(v17),
            CurrentOutputVADID == [+[MXSessionManager sharedInstance] systemSoundLocalVADID]))
      {
        CMSUtility_UpdatePlaybackVolume(v17, 0.0, 0.0);
      }
      else
      {
        CurrentRouteTypeForSystemSoundAtIndex = CMSMUtility_GetCurrentRouteTypeForSystemSoundAtIndex(0);
        if (dword_1E9359ED0)
        {
          unsigned int v53 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          long long v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v28 = v53;
          if (os_log_type_enabled(v27, type)) {
            unsigned int v29 = v28;
          }
          else {
            unsigned int v29 = v28 & 0xFFFFFFFE;
          }
          if (v29)
          {
            uint64_t VADNameForVADID = CMSMUtility_GetVADNameForVADID([+[MXSessionManager sharedInstance] systemSoundLocalVADID]);
            int v54 = 136315650;
            v55 = "-[MXSessionManager volumePreferenceDidChangeCallback:]";
            __int16 v56 = 2114;
            uint64_t v57 = VADNameForVADID;
            __int16 v58 = 2114;
            v59 = CurrentRouteTypeForSystemSoundAtIndex;
            LODWORD(v41) = 32;
            v39 = &v54;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        vaemSetDeviceVolumeIfNotSet([+[MXSessionManager sharedInstance] systemSoundLocalVADID], 0, CurrentRouteTypeForSystemSoundAtIndex, 0, 1.0, 0.0, 0.0);
      }
    }
    goto LABEL_46;
  }
  v42 = self;
  uint64_t v47 = 0;
  long long v17 = 0;
  uint64_t v18 = *(void *)v49;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v49 != v18) {
        objc_enumerationMutation(v15);
      }
      uint64_t v20 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      if ([v20 isActive])
      {
        if ([v20 hasAudioCategory:@"VoiceOver"]) {
          long long v17 = v20;
        }
        if ((!CMSMVAUtility_IsAdditiveRoutingEnabled() || ([v20 isEqual:v13] & 1) == 0)
          && ([v20 currentlyControllingFlags] & 0x10) != 0)
        {
          CurrentAudioDestination = (void *)CMSUtility_GetCurrentAudioDestination(v20);
          if ([CurrentAudioDestination isEqualToString:0x1EE5EBF48])
          {
            if (objc_msgSend((id)objc_msgSend(v20, "audioCategory"), "isEqualToString:", @"VoiceOver"))
            {
              float v22 = 0.0;
              float v23 = 0.0;
              long long v24 = v20;
            }
            else
            {
              long long v24 = v20;
              float v22 = v8;
              float v23 = v10;
            }
            CMSUtility_UpdatePlaybackVolume(v24, v22, v23);
            LOBYTE(v47) = 1;
          }
          else
          {
            CMSUtility_UpdatePlaybackVolume(v20, v8, v10);
            HIDWORD(v47) |= [CurrentAudioDestination isEqualToString:0x1EE5EBF68];
          }
        }
      }
    }
    uint64_t v16 = [(NSPointerArray *)v15 countByEnumeratingWithState:&v48 objects:v60 count:16];
  }
  while (v16);
  [(MXSessionManager *)v42 mxCoreSessionListEndIteration];
  LOBYTE(v16) = v47;
  if ((v47 & 0x100000000) == 0) {
    goto LABEL_34;
  }
LABEL_46:
  if ((v16 & 1) == 0
    && CMSMDeviceState_IsVoiceOverOn()
    && (!CMSMVAUtility_IsAdditiveRoutingEnabled() || !v44))
  {
    CurrentRouteTypeAtIndex = (const void *)CMSMUtility_GetCurrentRouteTypeAtIndex(0);
    if (dword_1E9359ED0)
    {
      unsigned int v53 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      int v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v34 = v53;
      if (os_log_type_enabled(v33, type)) {
        unsigned int v35 = v34;
      }
      else {
        unsigned int v35 = v34 & 0xFFFFFFFE;
      }
      if (v35)
      {
        uint64_t v36 = CMSMUtility_GetVADNameForVADID([+[MXSessionManager sharedInstance] defaultVADID]);
        int v54 = 136315650;
        v55 = "-[MXSessionManager volumePreferenceDidChangeCallback:]";
        __int16 v56 = 2114;
        uint64_t v57 = v36;
        __int16 v58 = 2114;
        v59 = CurrentRouteTypeAtIndex;
        LODWORD(v41) = 32;
        v39 = &v54;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    vaemSetDeviceVolumeIfNotSet([+[MXSessionManager sharedInstance] defaultVADID], 0, CurrentRouteTypeAtIndex, 0, v12, 0.0, 0.0);
  }
  MEMORY[0x199716EA0](gCMSM);
  if ((v46 & 1) == 0
    && (![v45 isEqualToString:@"EmergencyAlert"]
     || ([v43 isEqualToString:@"CustomVolume"] & 1) == 0))
  {
    MEMORY[0x199716E90](gCMSM);
    float v37 = *(float *)&dword_1E9359BDC;
    MEMORY[0x199716EA0](gCMSM);
    if (v37 != v12)
    {
      MEMORY[0x199716E90](gCMSM);
      dword_1E9359BDC = LODWORD(v12);
      MEMORY[0x199716EA0](gCMSM);
      CMSMNotificationUtility_PostVolumeDidChangeToVolumeButtonClientsWithPayload(v4);
    }
    CMSMNotificationUtility_PostVolumeDidChangeToAVSystemControllersWithPayload((uint64_t)v4);
  }
}

- (BOOL)voiceOverVADVolumeNeedsUpdate
{
  return self->_voiceOverVADVolumeNeedsUpdate;
}

- (NSString)currentAudioMode
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (unint64_t)mxCoreSessionListAddSession:(id)a3
{
  objc_initWeak(&location, a3);
  dispatch_semaphore_wait((dispatch_semaphore_t)[(MXSessionManager *)self mxCoreSessionListWriteSemaphore], 0xFFFFFFFFFFFFFFFFLL);
  [(NSPointerArray *)[(MXSessionManager *)self mxCoreSessionList] addPointer:objc_loadWeak(&location)];
  [(NSPointerArray *)[(MXSessionManager *)self mxCoreSessionList] compact];
  unint64_t v4 = [(NSPointerArray *)[(MXSessionManager *)self mxCoreSessionList] count];
  dispatch_semaphore_signal((dispatch_semaphore_t)[(MXSessionManager *)self mxCoreSessionListWriteSemaphore]);
  objc_destroyWeak(&location);
  return v4;
}

- (unsigned)musicVADID
{
  id v2 = [(NSDictionary *)[(MXSessionManager *)self audioDeviceInfo] objectForKey:0x1EE5EFB28];
  return [v2 unsignedIntValue];
}

- (unsigned)siriOutputVADID
{
  id v2 = [(NSDictionary *)[(MXSessionManager *)self audioDeviceInfo] objectForKey:0x1EE5EFB08];
  return [v2 unsignedIntValue];
}

- (unsigned)defaultVADID
{
  id v2 = [(NSDictionary *)[(MXSessionManager *)self audioDeviceInfo] objectForKey:0x1EE5EBF48];
  return [v2 unsignedIntValue];
}

- (unsigned)systemSoundLocalVADID
{
  id v2 = [(NSDictionary *)[(MXSessionManager *)self audioDeviceInfo] objectForKey:0x1EE5EBF68];
  return [v2 unsignedIntValue];
}

- (NSDictionary)vadInputPortTypeToFigInputDeviceNameDict
{
  return self->_vadInputPortTypeToFigInputDeviceNameDict;
}

- (id)getDefaultBuiltInCustomizedAlternateCategory:(id)a3 defaultBuiltInRoute:(id)a4
{
  if (!a3) {
    return 0;
  }
  if ([a4 isEqualToString:@"Speaker"])
  {
    float v7 = [(MXSessionManager *)self figCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict];
  }
  else if ([a4 isEqualToString:@"Receiver"])
  {
    float v7 = [(MXSessionManager *)self figCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict];
  }
  else
  {
    if (a4)
    {
      id result = 0;
      goto LABEL_11;
    }
    float v7 = [(MXSessionManager *)self figCustomizedCategoryWithDefaultBuiltIn_Default_Dict];
  }
  id result = [(NSDictionary *)v7 objectForKey:a3];
LABEL_11:
  if (!result) {
    return a3;
  }
  return result;
}

- (NSDictionary)figCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict
{
  return self->_figCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict;
}

- (NSString)systemMirroringRoutingContextUUID
{
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];
  AudioObjectID v3 = self->_systemMirroringRoutingContextUUID;
  uint64_t v5 = v3;
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
  if (!v3)
  {
    FigRoutingManagerContextUtilities_CopySystemMirroringContextUUID((uint64_t)&v5);
    [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];

    self->_systemMirroringRoutingContextUUID = v5;
    [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
    AudioObjectID v3 = v5;
  }
  return v3;
}

- (unsigned)systemSoundRemoteVADID
{
  id v2 = [(NSDictionary *)[(MXSessionManager *)self audioDeviceInfo] objectForKey:0x1EE5EBF88];
  return [v2 unsignedIntValue];
}

- (unsigned)speechDetectionVADID
{
  id v2 = [(NSDictionary *)[(MXSessionManager *)self audioDeviceInfo] objectForKey:0x1EE5EFAA8];
  return [v2 unsignedIntValue];
}

- (unsigned)speakerAlertVADID
{
  id v2 = [(NSDictionary *)[(MXSessionManager *)self audioDeviceInfo] objectForKey:0x1EE5EBFA8];
  return [v2 unsignedIntValue];
}

- (void)setSpeakerAlertVADID:(unsigned int)a3
{
}

- (void)setDecoupledInputVADID:(unsigned int)a3
{
}

- (void)setActuatorVADID:(unsigned int)a3
{
}

- (unsigned)perAppAirPlayVADID
{
  id v2 = [(NSDictionary *)[(MXSessionManager *)self audioDeviceInfo] objectForKey:0x1EE5EFB48];
  return [v2 unsignedIntValue];
}

- (unsigned)lowLatencyVADID
{
  id v2 = [(NSDictionary *)[(MXSessionManager *)self audioDeviceInfo] objectForKey:0x1EE5EFB68];
  return [v2 unsignedIntValue];
}

- (void)setSystemSoundRemoteVADID:(unsigned int)a3
{
}

- (void)setSystemSoundLocalVADID:(unsigned int)a3
{
}

- (void)setSpeechDetectionVADID:(unsigned int)a3
{
}

- (void)setSiriOutputVADID:(unsigned int)a3
{
}

- (void)setPerAppAirPlayVADID:(unsigned int)a3
{
}

- (void)setMusicVADID:(unsigned int)a3
{
}

- (void)setLowLatencyVADID:(unsigned int)a3
{
}

- (unsigned)actuatorVADID
{
  id v2 = [(NSDictionary *)[(MXSessionManager *)self audioDeviceInfo] objectForKey:0x1EE5EFAE8];
  return [v2 unsignedIntValue];
}

- (id)copyVoiceOverSession
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  AudioObjectID v3 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v4 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        float v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 hasAudioCategory:@"VoiceOver"])
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  float v8 = 0;
LABEL_11:
  [(MXSessionManager *)self mxCoreSessionListEndIteration];
  return v8;
}

- (unsigned)currentStream0
{
  return self->_currentStream0;
}

- (BOOL)carPlayIsConnected
{
  return self->_carPlayIsConnected;
}

- (void)setCurrentAudioMode:(id)a3
{
}

- (void)setCurrentAudioCategory:(id)a3
{
}

- (void)duckSessionIfDuckerIsActive:(id)a3
{
  uint64_t v5 = CMSMUtility_CopyCurrentRouteTypes();
  uint64_t v6 = CMSUtility_CopyActiveDuckerForSession(a3);
  [(MXSessionManager *)self startAsyncDuckingOperation];
  if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled())
  {
    if (v6)
    {
      int v7 = [v6 hasAudioCategory:@"VoiceOver"];
      float v8 = +[MXSessionManager sharedInstance];
      if (v7) {
        id v9 = v6;
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      float v8 = +[MXSessionManager sharedInstance];
      int v7 = 0;
      id v9 = 0;
    }
    int v10 = v7 & [(MXSessionManager *)v8 duckSessionForVoiceOverIfNeeded:a3 voiceOverSession:v9];
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  uint64_t v19 = 0;
  if (v6 && (v10 & 1) == 0)
  {
    long long v11 = [MXDuckingSource alloc];
    uint64_t v12 = objc_msgSend((id)objc_msgSend(v6, "ID"), "longLongValue");
    [v6 duckToLevelScalar];
    uint64_t v19 = -[MXDuckingSource initWithType:ID:duckVolume:duckFadeDuration:](v11, "initWithType:ID:duckVolume:duckFadeDuration:", 2, v12);
    -[MXSessionManager duckVolume:duckerSession:duckingSource:](self, "duckVolume:duckerSession:duckingSource:", a3, v6);
    [v6 setNeedToEndInterruption:1];
  }
  if ([(MXSessionManager *)self shouldDuckSessionForSpeakerVolumeLimit:a3])
  {
    [+[MXSessionManager sharedInstance] duckVolumeForSpeakerVolumeLimit];
    int v14 = v13;
    long long v15 = [MXDuckingSource alloc];
    LODWORD(v16) = 0.5;
    LODWORD(v17) = v14;
    uint64_t v18 = [(MXDuckingSource *)v15 initWithType:7 ID:0 duckVolume:v17 duckFadeDuration:v16];
    [(MXSessionManager *)self duckVolume:a3 duckerSession:0 duckingSource:v18];
  }
  [(MXSessionManager *)self endAsyncDuckingOperationForSession:a3];
}

- (void)setMostRecentDuckOperation:(BOOL)a3
{
  self->_mostRecentDuckOperation = a3;
}

- (void)startAsyncDuckingOperation
{
}

- (void)endAsyncDuckingOperation
{
  BOOL v3 = [(MXSessionManager *)self mostRecentDuckOperation];
  [(MXSessionManager *)self mostRecentDuckFadeDuration];
  -[MXSessionManager sleepForAsyncDucking:duration:](self, "sleepForAsyncDucking:duration:", v3);
  [(MXSessionManager *)self setMostRecentDuckFadeDuration:0.0];
  [(MXSessionManager *)self setMostRecentDuckOperation:0];
}

- (void)getAndResetAsyncDuckingParameters:(BOOL *)a3 mostRecentDuckFadeDuration:(float *)a4
{
  if (MX_FeatureFlags_IsOffloadActivationOffACQEnabled())
  {
    *a3 = [(MXSessionManager *)self mostRecentDuckOperation];
    [(MXSessionManager *)self mostRecentDuckFadeDuration];
    *(_DWORD *)a4 = v7;
    [(MXSessionManager *)self setMostRecentDuckFadeDuration:0.0];
    [(MXSessionManager *)self setMostRecentDuckOperation:0];
  }
}

- (void)setMostRecentDuckFadeDuration:(float)a3
{
  self->_mostRecentDuckFadeDuration = a3;
}

- (BOOL)mostRecentDuckOperation
{
  return self->_mostRecentDuckOperation;
}

- (float)mostRecentDuckFadeDuration
{
  return self->_mostRecentDuckFadeDuration;
}

- (void)sleepForAsyncDucking:(BOOL)a3 duration:(float)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (MX_FeatureFlags_IsAsyncDuckingEnabled())
  {
    *(float *)&double v6 = a4;
    [(MXSessionManager *)self getSleepDurationForDuckFadeDuration:v6];
    if (v7 > 0.0)
    {
      double v8 = v7;
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(MEMORY[0x1E4F29060], "sleepForTimeInterval:", v8, v10, v11);
    }
  }
}

- (float)getSleepDurationForDuckFadeDuration:(float)a3
{
  if (a3 >= 0.5)
  {
    a3 = a3 * 0.6;
  }
  else if (a3 >= 0.3 && a3 < 0.5)
  {
    a3 = 0.3;
  }
  return fminf(a3, 5.0);
}

- (void)endAsyncDuckingOperationForSession:(id)a3
{
  int IsOffloadActivationOffACQEnabled = MX_FeatureFlags_IsOffloadActivationOffACQEnabled();
  if (a3 && IsOffloadActivationOffACQEnabled && ([a3 isInterruptionCalledOffAudioControlQueue] & 1) != 0)
  {
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    [(MXSessionManager *)self endAsyncDuckingOperation];
  }
}

- (BOOL)duckSessionForVoiceOverIfNeeded:(id)a3 voiceOverSession:(id)a4
{
  v19[24] = *MEMORY[0x1E4F143B8];
  BOOL v7 = [+[MXSessionManager sharedInstance] shouldDuckSessionForVoiceOver:a3];
  if (v7)
  {
    v19[0] = 0;
    BOOL v8 = [+[MXSessionManager sharedInstance] isVoiceOverDuckingActive:a4 outDuckScalar:(char *)v19 + 4 outDuckFadeDuration:v19];
    LOBYTE(v7) = 0;
    if (v8)
    {
      id v9 = [+[MXSessionManager sharedInstance] copyActiveVoiceOverSession];
      BOOL v10 = [(MXSessionManager *)self shouldSkipDuckingForVoiceOver:a3 inActiveVoiceOverSession:v9];

      if (v10)
      {
        LOBYTE(v7) = 0;
      }
      else
      {
        uint64_t v11 = [MXDuckingSource alloc];
        LODWORD(v12) = HIDWORD(v19[0]);
        LODWORD(v13) = v19[0];
        int v14 = [(MXDuckingSource *)v11 initWithType:6 ID:0 duckVolume:v12 duckFadeDuration:v13];
        if (dword_1E9359ED0)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        [+[MXSessionManager sharedInstance] duckVolume:a3 duckerSession:0 duckingSource:v14];

        LOBYTE(v7) = 1;
      }
    }
  }
  return v7;
}

- (BOOL)shouldDuckSessionForVoiceOver:(id)a3
{
  v7[16] = *(id *)MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0;
  }
  if ([a3 hasAudioCategory:@"VoiceOver"]) {
    return 0;
  }
  v7[0] = 0;
  PVMCopyVolumeCategoryAndMode((const __CFString *)-[MXSessionManager getUncustomizedCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getUncustomizedCategory:", [a3 audioCategory]), (const void *)objc_msgSend(a3, "audioMode"), v7, 0);
  BOOL v4 = [a3 clientPriority] <= 0xA
    && (([v7[0] isEqualToString:@"Alert"] & 1) == 0
     && ([v7[0] isEqualToString:@"Alarm"] & 1) == 0
     && ![a3 isTheAssistant]
     || MX_FeatureFlags_IsAlertsRelativeVoiceOverVolumeEnabled() != 0);

  return v4;
}

- (BOOL)isVoiceOverDuckingActive:(id)a3 outDuckScalar:(float *)a4 outDuckFadeDuration:(float *)a5
{
  id v8 = a3;
  if ((a3
     || (id v8 = -[MXSessionManager copyActiveVoiceOverSession](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyActiveVoiceOverSession")) != 0)&& [v8 isActive]&& CMSUtility_SessionDucksOthers(v8))
  {
    [v8 duckToLevelScalar];
    float v10 = v9;
    [v8 duckFadeDuration];
    int v12 = v11;
    BOOL v13 = 1;
    if (a3) {
      goto LABEL_9;
    }
  }
  else
  {
    [+[MXSessionManager sharedInstance] duckScalarForVoiceOver];
    float v10 = v14;
    BOOL v13 = CMSMDeviceState_IsVoiceOverOn() != 0;
    int v12 = 1050253722;
    if (a3) {
      goto LABEL_9;
    }
  }

LABEL_9:
  *a4 = v10;
  *(_DWORD *)a5 = v12;
  return v10 < 1.0 && v13;
}

- (id)copyActiveVoiceOverSession
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [(MXSessionManager *)self copyMXCoreSessionList];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 isActive]
          && [v7 hasAudioCategory:@"VoiceOver"])
        {
          id v8 = v7;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 0;
LABEL_12:

  return v7;
}

- (float)duckScalarForVoiceOver
{
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];
  float duckScalarForVoiceOver = self->_duckScalarForVoiceOver;
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
  return duckScalarForVoiceOver;
}

- (BOOL)isSessionWithAudioCategoryActive:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if [v10 isActive] && (objc_msgSend(v10, "hasAudioCategory:", a3))
        {
          BOOL v11 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:
  [(MXSessionManager *)self mxCoreSessionListEndIteration];
  return v11;
}

- (BOOL)isSessionWithAudioModeRecording:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 isActive]
          && [v10 isRecording]
          && ([v10 hasAudioMode:a3] & 1) != 0)
        {
          BOOL v11 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_13:
  [(MXSessionManager *)self mxCoreSessionListEndIteration];
  return v11;
}

- (BOOL)isSessionWithAudioModePlaying:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 isActive]
          && [v10 isPlaying]
          && ([v10 hasAudioMode:a3] & 1) != 0)
        {
          BOOL v11 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_13:
  [(MXSessionManager *)self mxCoreSessionListEndIteration];
  return v11;
}

- (BOOL)areSessionsWithAudioModesActive:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 isActive]
          && (objc_msgSend(a3, "containsObject:", objc_msgSend(v10, "audioMode")) & 1) != 0)
        {
          BOOL v11 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:
  [(MXSessionManager *)self mxCoreSessionListEndIteration];
  return v11;
}

- (NSSet)audioModesWithShortVoicePromptStyle
{
  return self->_audioModesWithShortVoicePromptStyle;
}

- (void)updateSupportedOutputChannelLayouts
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [+[MXSessionManager sharedInstance] copyMXCoreSessionList];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v7, "isActive", v11, v12)
          && CMSUtility_SessionCanBeAndAllowedToBeNowPlayingApp(v7))
        {
          CFTypeRef cf = 0;
          FigRoutingManagerContextUtilities_CopySystemMusicContextUUID((uint64_t)&cf);
          uint64_t v8 = (const void *)FigRoutingManagerContextUtilities_CopySupportedOutputChannelLayouts((uint64_t)cf);
          [v7 supportedOutputChannelLayouts];
          if (FigCFEqual())
          {
            if (dword_1E9359ED0)
            {
              os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
          else
          {
            if (dword_1E9359ED0)
            {
              long long v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            objc_msgSend(v7, "setSupportedOutputChannelLayouts:", v8, v11, v12);
            CMSMNotificationUtility_PostSupportedBufferedAudioCapabilitiesDidChange(v7);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          if (v8) {
            CFRelease(v8);
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

- (void)applyUplinkMute:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    id v6 = CMSUtility_CopyBundleID(a3);
    if ([a3 hasPhoneCallBehavior]
      && [(NSNumber *)[(MXSessionManager *)self applyUplinkMuteToPhoneCallBehaviorSession] BOOLValue])
    {
      [(MXSessionManager *)self updateMutedBundleIDs:v6 muteValue:1];
      if (dword_1E9359ED0)
      {
        uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[MXSessionManager setApplyUplinkMuteToPhoneCallBehaviorSession:](self, "setApplyUplinkMuteToPhoneCallBehaviorSession:", 0, v12, v13);
    }
    if ([a3 isActive]
      && [a3 isRecording]
      && ([a3 isRecordingMuted] & 1) == 0
      && [(NSSet *)[+[MXSessionManager sharedInstance] mutedSessionBundleIDs] containsObject:v6])
    {
      if (dword_1E9359ED0)
      {
        uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      float v9 = +[MXSessionManager sharedInstance];
      uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
      *(void *)&long long v11 = -1;
      *((void *)&v11 + 1) = -1;
      v14[0] = v11;
      v14[1] = v11;
      [(MXSessionManager *)v9 updateMuteState:v14 muteValue:v10];
    }
  }
}

- (void)replaceMutedBundleIDwithHostID
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:", -[MXSessionManager mutedSessionBundleIDs](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mutedSessionBundleIDs"));
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obuint64_t j = v4;
    uint64_t v31 = [v4 countByEnumeratingWithState:&v41 objects:v55 count:16];
    if (v31)
    {
      uint64_t v30 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v42 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          [+[MXSessionManager sharedInstance] mxCoreSessionListBeginIteration];
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          uint64_t v8 = [+[MXSessionManager sharedInstance] mxCoreSessionList];
          uint64_t v9 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v37 objects:v54 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v38;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v38 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8 * j);
                if (objc_msgSend((id)objc_msgSend(v13, "displayID"), "isEqualToString:", v7)
                  && [v13 hasPhoneCallBehavior])
                {
                  [v5 addObject:v13];
                }
              }
              uint64_t v10 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v37 objects:v54 count:16];
            }
            while (v10);
          }
          [+[MXSessionManager sharedInstance] mxCoreSessionListEndIteration];
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
      }
      while (v31);
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v14 = [v5 countByEnumeratingWithState:&v33 objects:v53 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v32 = *(void *)v34;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v34 != v32) {
            objc_enumerationMutation(v5);
          }
          long long v17 = *(void **)(*((void *)&v33 + 1) + 8 * k);
          -[MXSessionManager updateMutedBundleIDs:muteValue:](self, "updateMutedBundleIDs:muteValue:", objc_msgSend(v17, "displayID", v27, v28), 0);
          id v18 = CMSUtility_CopyBundleID(v17);
          [(MXSessionManager *)self updateMutedBundleIDs:v18 muteValue:1];
          if (objc_msgSend((id)objc_msgSend(v17, "displayID"), "isEqualToString:", -[MXSessionManager uplinkMutedBundleID](self, "uplinkMutedBundleID")))
          {
            if (dword_1E9359ED0)
            {
              unsigned int v46 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              uint64_t v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v20 = v46;
              if (os_log_type_enabled(v19, type)) {
                unsigned int v21 = v20;
              }
              else {
                unsigned int v21 = v20 & 0xFFFFFFFE;
              }
              if (v21)
              {
                uint64_t v22 = [v17 displayID];
                int v47 = 136315651;
                long long v48 = "-[MXSessionManager(Utilities) replaceMutedBundleIDwithHostID]";
                __int16 v49 = 2113;
                uint64_t v50 = v22;
                __int16 v51 = 2113;
                id v52 = v18;
                LODWORD(v28) = 32;
                long long v27 = &v47;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            -[MXSessionManager setUplinkMutedBundleID:](self, "setUplinkMutedBundleID:", v18, v27, v28);
          }
          if (dword_1E9359ED0)
          {
            unsigned int v46 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            float v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v24 = v46;
            if (os_log_type_enabled(v23, type)) {
              unsigned int v25 = v24;
            }
            else {
              unsigned int v25 = v24 & 0xFFFFFFFE;
            }
            if (v25)
            {
              uint64_t v26 = [v17 displayID];
              int v47 = 136315651;
              long long v48 = "-[MXSessionManager(Utilities) replaceMutedBundleIDwithHostID]";
              __int16 v49 = 2113;
              uint64_t v50 = v26;
              __int16 v51 = 2113;
              id v52 = v18;
              LODWORD(v28) = 32;
              long long v27 = &v47;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        uint64_t v15 = [v5 countByEnumeratingWithState:&v33 objects:v53 count:16];
      }
      while (v15);
    }
  }
}

- (NSSet)mutedSessionBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (id)getRouteSharingPolicyAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%d)", *(void *)&a3);
  }
  else {
    return off_1E57CB498[a3];
  }
}

- (BOOL)isAirPlaySession:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "displayID"), "containsString:", @"tvairplayd") & 1) != 0
    || (objc_msgSend((id)objc_msgSend(a3, "displayID"), "containsString:", @"TVAirPlay") & 1) != 0)
  {
    return 1;
  }
  return [a3 isAirPlayReceiverSession];
}

- (BOOL)isSmartRoutingEligibleSessionAvailable
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [+[MXSessionManager sharedInstance] mxCoreSessionListBeginIteration];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [+[MXSessionManager sharedInstance] mxCoreSessionList];
  uint64_t v3 = [(NSPointerArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    BOOL v6 = 1;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
      if ([v8 isPlaying])
      {
        if (CMSUtility_GetIsEligibleForBTSmartRoutingConsideration(v8)
          && CMSM_GetLocalSessionPriority(v8, 1) > 0x64)
        {
          break;
        }
      }
      if (v4 == ++v7)
      {
        uint64_t v4 = [(NSPointerArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    BOOL v6 = 0;
  }
  [+[MXSessionManager sharedInstance] mxCoreSessionListEndIteration];
  return v6;
}

- (BOOL)isSessionWithAudioModeActive:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if [v10 isActive] && (objc_msgSend(v10, "hasAudioMode:", a3))
        {
          BOOL v11 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:
  [(MXSessionManager *)self mxCoreSessionListEndIteration];
  return v11;
}

- (BOOL)isSiriSessionActive:(BOOL *)a3 andMixable:(BOOL *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = [(MXSessionManager *)self copyMXCoreSessionList];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 isTheAssistant])
        {
          if (a3) {
            *a3 = [v11 isRecording];
          }
          if (a4) {
            *a4 = [v11 mixesWithEveryone];
          }
          char v12 = [v11 isActive];
          goto LABEL_15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  char v12 = 0;
LABEL_15:

  return v12;
}

uint64_t __34__MXSessionManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(MXSessionManager);
  sharedInstance_sSharedInstance_3 = (uint64_t)v0;
  return [(MXSessionManager *)v0 setUpStringConversionDictionaries];
}

+ (id)copyDefaultMusicAppFromPlist
{
  CelestialGetModelSpecificName();
  CFDictionaryRef v2 = (const __CFDictionary *)CelestialCFCreatePropertyListForModelAndBundleIdentifier();
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    Value = (__CFString *)CFDictionaryGetValue(v2, @"DefaultMusicApp");
    if (Value) {
      uint64_t v5 = Value;
    }
    else {
      uint64_t v5 = @"com.apple.Music";
    }
    id v6 = v5;
    CFRelease(v3);
  }
  else
  {
    uint64_t v5 = @"com.apple.Music";
    uint64_t v7 = @"com.apple.Music";
  }
  return v5;
}

+ (BOOL)getSilentModeStateFromDisk
{
  CFDictionaryRef v2 = (void *)CFPreferencesCopyValue(@"silentModeEnabled", @"com.apple.mediaexperience", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (id)copySilentModeUntilTimeFromDisk
{
  return (id)CFPreferencesCopyValue(@"silentModeEnabledUntilTime", @"com.apple.mediaexperience", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
}

- (MXSessionManager)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)MXSessionManager;
  CFDictionaryRef v2 = [(MXSessionManager *)&v14 init];
  if (v2)
  {
    v2->_audioCategoriesWithInput = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"Multi", @"Record", 0x1EE5E9828, @"PlayAndRecord", 0x1EE5E9848, 0x1EE5E9868, 0x1EE5E9888, @"VoiceCommand", @"VoiceCommand_WithBluetooth", @"VoiceCommandThatMixes", @"VoiceCommandThatMixes_WithBluetooth", @"PhoneCall", @"TTYCall", 0);
    v2->_audioModesWithShortVoicePromptStyle = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"SpeechRecognition", @"VoiceMessages", 0);
    v2->_currentAudioCategory = 0;
    v2->_currentAudioMode = 0;
    v2->_defaultMusicApp = (NSString *)+[MXSessionManager copyDefaultMusicAppFromPlist];
    v2->_devicesSampleRates = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "systemUptime");
    if (v3 <= 45.0)
    {
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      MXCFPreferencesSetAndSynchronizeUserPreference(@"mutedSessionBundleIDs", 0);
    }
    uint64_t v5 = (void *)MXCFPreferencesCopyPreference(@"mutedSessionBundleIDs");
    v2->_mutedSessionBundleIDs = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];

    v2->_propertiesLocuint64_t k = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v2->_mxCoreSessionList = (NSPointerArray *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:5];
    v2->_mxCoreSessionListActiveReaders = 0;
    v2->_mxCoreSessionListReadLocuint64_t k = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v2->_mxCoreSessionListWriteSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v2->_sessionsThatWantToSuspendNeroScreenMirroring = (NSPointerArray *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:5];
    v2->_pickableRoutesDescriptions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (MX_FeatureFlags_IsQuiesceableWiredConnectionEnabled())
    {
      id v6 = (void *)MXCFPreferencesCopyPreference(@"quiesceableWiredPortsAutoRouteOnConnectPreference");
      v2->_quiesceableWiredPortsAutoRouteOnConnectPreference = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v6];
    }
    else
    {
      v2->_quiesceableWiredPortsAutoRouteOnConnectPreference = 0;
    }
    v2->_silentModeEnabled = +[MXSessionManager getSilentModeStateFromDisk];
    v2->_silentModeEnabledUntilTime = (NSDate *)+[MXSessionManager copySilentModeUntilTimeFromDisk];
    uint64_t v7 = (void *)MXCFPreferencesCopyPreference(@"silentModeClientType");
    v2->_silentModeClient = [v7 unsignedIntValue];
    v2->_silentModeReason = (NSString *)MXCFPreferencesCopyPreference(@"silentModeReason");

    if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled())
    {
      uint64_t v8 = (void *)MXCFPreferencesCopyPreference(@"duckScalarForVoiceOver");
      uint64_t v9 = v8;
      if (v8) {
        [v8 floatValue];
      }
      else {
        float v10 = 1.0;
      }
      v2->_float duckScalarForVoiceOver = v10;
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v2, sel_volumePreferenceDidChangeCallback_, 0x1EE5FAE48, +[MXPreferredVolumeManager sharedInstance](MXPreferredVolumeManager, "sharedInstance"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v2, sel_pvmStateDidChangeCallback_, 0x1EE5FAEA8, +[MXPreferredVolumeManager sharedInstance](MXPreferredVolumeManager, "sharedInstance"));
    dword_1E9359BDC = 0;
  }
  return v2;
}

- (void)dealloc
{
  self->_audioCategoriesWithInput = 0;
  self->_audioDeviceInfo = 0;

  self->_audioModesWithShortVoicePromptStyle = 0;
  self->_appAllowedToFadeInTemporarily = 0;

  self->_appAllowedToInitiatePlaybackTemporarily = 0;
  self->_appAllowedToInitiateRecordingTemporarily = 0;

  self->_appAllowedToInitiateRecordingTemporarilyTimestamp = 0;
  self->_applyUplinkMuteToPhoneCallBehaviorSession = 0;

  self->_currentAudioCategory = 0;
  self->_currentAudioMode = 0;

  self->_defaultMusicApp = 0;
  self->_devicesSampleRates = 0;

  self->_propertiesLocuint64_t k = 0;
  self->_longFormVideoApps = 0;

  self->_mxCoreSessionList = 0;
  self->_mxCoreSessionListReadLocuint64_t k = 0;
  dispatch_release((dispatch_object_t)self->_mxCoreSessionListWriteSemaphore);
  self->_mxCoreSessionListWriteSemaphore = 0;

  self->_pickableRoutesDescriptions = 0;
  self->_recordingClientPIDs = 0;

  self->_quiesceableWiredPortsAutoRouteOnConnectPreference = 0;
  self->_mutedSessionBundleIDs = 0;

  self->_silentModeEnabledUntilTime = 0;
  self->_silentModeReason = 0;

  self->_systemMirroringRoutingContextUUID = 0;
  self->_figUncustomizedCategory_Dict = 0;

  self->_figCustomizedCategoryWithBluetooth_Dict = 0;
  self->_figCustomizedCategoryWithoutBluetooth_Dict = 0;

  self->_figCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict = 0;
  self->_figCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict = 0;

  self->_figCustomizedCategoryWithDefaultBuiltIn_Default_Dict = 0;
  self->_figCategoryToMuteabilityDict = 0;

  self->_figCategoryToOutputOverridabilityDict = 0;
  self->_figCategoryToVADCategoryDict = 0;

  self->_figRouteToVADOutputPortTypeDict = 0;
  self->_figRouteToVADInputPortTypeDict = 0;

  self->_vadOutputPortTypeToFigOutputDeviceNameDict = 0;
  self->_vadOutputPortTypeToMuteabilityDict = 0;

  self->_vadInputPortTypeToFigInputDeviceNameDict = 0;
  self->_figModeTypeToVADModeType = 0;

  self->_uplinkMutedBundleID = 0;
  self->_sessionsThatWantToSuspendNeroScreenMirroring = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXSessionManager;
  [(MXSessionManager *)&v3 dealloc];
}

- (NSArray)longFormVideoApps
{
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];
  if ([+[MXNowPlayingAppManager sharedInstance] nowPlayingAppDisplayID])
  {
    objc_super v3 = (NSArray *)(id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_longFormVideoApps copyItems:1];
  }
  else
  {
    objc_super v3 = 0;
  }
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
  return v3;
}

- (void)setLongFormVideoApps:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];

  self->_longFormVideoApps = (NSArray *)a3;
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
}

- (void)setSystemMirroringRoutingContextUUID:(id)a3
{
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];

  self->_systemMirroringRoutingContextUUID = (NSString *)a3;
  uint64_t v5 = [(MXSessionManager *)self propertiesLock];
  [(NSRecursiveLock *)v5 unlock];
}

- (void)setWombatEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];
  BOOL wombatEnabled = self->_wombatEnabled;
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
  if (wombatEnabled != v3)
  {
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];
    self->_BOOL wombatEnabled = v3;
    [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
    if (v3) {
      [(MXSessionManager *)self interruptActiveSessionsNotOptedIntoWombat];
    }
    CMSMNotificationUtility_PostWombatEnabledDidChange(v3);
    CMSMNotificationUtility_PostSpeechDetectStyleDidChangeIfNeeded(0, 0);
  }
}

- (float)duckVolumeForSpeakerVolumeLimit
{
  float v2 = PVMGetMaxVolumeLimitForBuiltInSpeaker();
  return pow(v2, 2.5);
}

- (void)setDuckScalarForVoiceOver:(float)a3
{
  if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled())
  {
    float v5 = fminf(a3, 1.0);
    if (v5 >= 0.0) {
      float v6 = v5;
    }
    else {
      float v6 = 0.0;
    }
    [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];
    float duckScalarForVoiceOver = self->_duckScalarForVoiceOver;
    self->_float duckScalarForVoiceOver = v6;
    [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (vabds_f32(duckScalarForVoiceOver, v6) > 0.01)
    {
      if (CMSMDeviceState_IsVoiceOverOn())
      {
        [+[MXSessionManager sharedInstance] startAsyncDuckingOperation];
        [+[MXSessionManager sharedInstance] updateDuckedSessionsForVoiceOver:0];
        [+[MXSessionManager sharedInstance] endAsyncDuckingOperation];
      }
      id v10 = objc_alloc(MEMORY[0x1E4F28ED0]);
      *(float *)&double v11 = v6;
      uint64_t v12 = (void *)[v10 initWithFloat:v11];
      MXCFPreferencesSetAndSynchronizeUserPreference(@"duckScalarForVoiceOver", v12);
    }
  }
  else if (dword_1E9359ED0)
  {
    uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (NSString)appAllowedToInitiateRecordingTemporarily
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];
  if (!self->_appAllowedToInitiateRecordingTemporarilyTimestamp)
  {
LABEL_7:
    float v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSinceDate:", self->_appAllowedToInitiateRecordingTemporarilyTimestamp);
  if (v3 > 5.0)
  {

    self->_appAllowedToInitiateRecordingTemporarily = 0;
    self->_appAllowedToInitiateRecordingTemporarilyTimestamp = 0;
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_7;
  }
  if (dword_1E9359ED0)
  {
    float v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  float v6 = self->_appAllowedToInitiateRecordingTemporarily;
LABEL_9:
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
  return v6;
}

- (void)setAppAllowedToInitiateRecordingTemporarily:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];

  self->_appAllowedToInitiateRecordingTemporarily = 0;
  self->_appAllowedToInitiateRecordingTemporarilyTimestamp = 0;
  if ([a3 length])
  {
    self->_appAllowedToInitiateRecordingTemporarily = (NSString *)a3;
    self->_appAllowedToInitiateRecordingTemporarilyTimestamp = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    if (dword_1E9359ED0) {
      goto LABEL_5;
    }
  }
  else if (dword_1E9359ED0)
  {
LABEL_5:
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
}

- (void)appToInterruptCurrentNowPlayingSession:(id)a3
{
  unsigned __int8 v3 = a3 == 0;
  if (a3) {
    id v6 = CMSMUtility_CopyActiveMXCoreSessionEligibleForNowPlayingAppConsideration((uint64_t)a3);
  }
  else {
    id v6 = 0;
  }
  id v4 = CMSMNP_CopyNowPlayingAppSession();
  float v5 = v4;
  if (v4)
  {
    if ([v4 audioSessionID]) {
      CMSMUtility_PostStopCommandToShadowingSessionsForSession(v5, v3);
    }
    CMSMNotificationUtility_PostStopCommandToActiveClientWithDisplayID([v5 displayID], 0);
  }
  if (v6)
  {
    CMSUtility_UpdateRoutingContextForSession(v6);
    -[MXNowPlayingAppManager updateNowPlayingApp:session:reasonForUpdate:](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "updateNowPlayingApp:session:reasonForUpdate:", objc_msgSend((id)objc_msgSend(v6, "clientPID"), "intValue"), 0, 4);
  }
}

- (void)interruptActiveSessionsNotOptedIntoWombat
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v12 = self;
  unsigned __int8 v3 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v4 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "isActive", v10, v11)
          && ([v8 prefersToPlayDuringWombat] & 1) == 0)
        {
          if (dword_1E9359ED0)
          {
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          CMSUtilityApplier_PostNotification_StopCommand(v8, 0);
        }
      }
      uint64_t v5 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  [(MXSessionManager *)v12 mxCoreSessionListEndIteration];
}

- (void)makeStarkPortRoutableForPhoneCall:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = CMSMUtility_CopyCurrentRouteTypes();
  if (!v3 || FigCFArrayContainsValue())
  {
    if (!v4) {
      return;
    }
    goto LABEL_4;
  }
  uint64_t v5 = CMSMUtility_CopyMostImportantPlayingSession();
  uint64_t v6 = v5;
  if (v5
    && (([(__CFArray *)v5 hasPhoneCallBehavior] & 1) != 0
     || CMSUtility_IsAudioCategoryRingtone(v6)))
  {
    AudioObjectID PortOfTypeInConnectedPortsList = CMSMVAUtility_GetPortOfTypeInConnectedPortsList(1886614639);
    if (cmsmRequestCarMainAudioForSession(v6))
    {
      if (PortOfTypeInConnectedPortsList) {
        CMSMVAUtility_MakeConnectedPortRoutable(PortOfTypeInConnectedPortsList);
      }
    }
  }

  if (v4)
  {
LABEL_4:
    CFRelease(v4);
  }
}

- (void)makeStarkPortRoutableForPlayingSession:(BOOL)a3
{
  if (a3)
  {
    AudioObjectID PortOfTypeInConnectedPortsList = CMSMVAUtility_GetPortOfTypeInConnectedPortsList(1886614639);
    uint64_t v4 = CMSMUtility_CopyMostImportantPlayingSession();
    int v5 = cmsmRequestCarMainAudioForSession(v4);

    if (v5 && PortOfTypeInConnectedPortsList) {
      CMSMVAUtility_MakeConnectedPortRoutable(PortOfTypeInConnectedPortsList);
    }
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (unint64_t)mxCoreSessionListRemoveSession:(id)a3
{
  objc_initWeak(&location, a3);
  dispatch_semaphore_wait((dispatch_semaphore_t)[(MXSessionManager *)self mxCoreSessionListWriteSemaphore], 0xFFFFFFFFFFFFFFFFLL);
  for (unint64_t i = 0; i < [(NSPointerArray *)[(MXSessionManager *)self mxCoreSessionList] count]; ++i)
  {
    if (objc_msgSend(-[NSPointerArray pointerAtIndex:](-[MXSessionManager mxCoreSessionList](self, "mxCoreSessionList"), "pointerAtIndex:", i), "isEqual:", objc_loadWeak(&location)))
    {
      [(NSPointerArray *)[(MXSessionManager *)self mxCoreSessionList] removePointerAtIndex:i];
      [(NSPointerArray *)[(MXSessionManager *)self mxCoreSessionList] compact];
      break;
    }
  }
  unint64_t v5 = [(NSPointerArray *)[(MXSessionManager *)self mxCoreSessionList] count];
  dispatch_semaphore_signal((dispatch_semaphore_t)[(MXSessionManager *)self mxCoreSessionListWriteSemaphore]);
  objc_destroyWeak(&location);
  return v5;
}

- (unint64_t)addSessionThatWantsToSuspendNeroScreenMirroring:(id)a3
{
  objc_initWeak(&location, a3);
  dispatch_semaphore_wait((dispatch_semaphore_t)[(MXSessionManager *)self mxCoreSessionListWriteSemaphore], 0xFFFFFFFFFFFFFFFFLL);
  [(NSPointerArray *)[(MXSessionManager *)self sessionsThatWantToSuspendNeroScreenMirroring] addPointer:objc_loadWeak(&location)];
  uint64_t v4 = (void *)MEMORY[0x1997179E0]([(NSPointerArray *)[(MXSessionManager *)self sessionsThatWantToSuspendNeroScreenMirroring] compact]);
  unint64_t v5 = [(NSArray *)[(NSPointerArray *)[(MXSessionManager *)self sessionsThatWantToSuspendNeroScreenMirroring] allObjects] count];
  dispatch_semaphore_signal((dispatch_semaphore_t)[(MXSessionManager *)self mxCoreSessionListWriteSemaphore]);
  objc_destroyWeak(&location);
  return v5;
}

- (unint64_t)removeSessionThatWantsToSuspendNeroScreenMirroring:(id)a3
{
  objc_initWeak(&location, a3);
  dispatch_semaphore_wait((dispatch_semaphore_t)[(MXSessionManager *)self mxCoreSessionListWriteSemaphore], 0xFFFFFFFFFFFFFFFFLL);
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v5 = [(NSPointerArray *)[(MXSessionManager *)self sessionsThatWantToSuspendNeroScreenMirroring] count];
    if (i >= v5) {
      break;
    }
    if (objc_msgSend(-[NSPointerArray pointerAtIndex:](-[MXSessionManager sessionsThatWantToSuspendNeroScreenMirroring](self, "sessionsThatWantToSuspendNeroScreenMirroring"), "pointerAtIndex:", i), "isEqual:", objc_loadWeak(&location)))
    {
      [(NSPointerArray *)[(MXSessionManager *)self sessionsThatWantToSuspendNeroScreenMirroring] removePointerAtIndex:i];
      unint64_t v5 = [(NSPointerArray *)[(MXSessionManager *)self sessionsThatWantToSuspendNeroScreenMirroring] compact];
      break;
    }
  }
  uint64_t v6 = (void *)MEMORY[0x1997179E0](v5);
  unint64_t v7 = [(NSArray *)[(NSPointerArray *)[(MXSessionManager *)self sessionsThatWantToSuspendNeroScreenMirroring] allObjects] count];
  dispatch_semaphore_signal((dispatch_semaphore_t)[(MXSessionManager *)self mxCoreSessionListWriteSemaphore]);
  objc_destroyWeak(&location);
  return v7;
}

- (void)updateNeroScreenState:(id)a3 suspendScreen:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = +[MXSessionManager sharedInstance];
  if (v4) {
    uint64_t v7 = [(MXSessionManager *)v6 addSessionThatWantsToSuspendNeroScreenMirroring:a3];
  }
  else {
    uint64_t v7 = [(MXSessionManager *)v6 removeSessionThatWantsToSuspendNeroScreenMirroring:a3];
  }
  int v8 = v7;
  if (v7) {
    BOOL v9 = updateNeroScreenState_suspendScreen__sCurrentCount == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    FigRoutingManagerSuspendCurrentEndpointScreen((uint64_t)[+[MXSessionManager sharedInstance] systemMirroringRoutingContextUUID]);
  }
  else
  {
    if (v7) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = updateNeroScreenState_suspendScreen__sCurrentCount == 0;
    }
    if (!v10) {
      FigRoutingManagerResumeCurrentEndpointScreen((uint64_t)[+[MXSessionManager sharedInstance] systemMirroringRoutingContextUUID]);
    }
  }
  updateNeroScreenState_suspendScreen__sCurrentCount = v8;
}

- (void)nowPlayingAppShouldResumeForCarPlay:(BOOL)a3
{
  BOOL v3 = a3;
  CMSMNP_SetNowPlayingAppShouldResumeForCarPlay(a3);
  CFPropertyListRef v4 = CMSMNP_CopyNowPlayingAppWasPlayingUponCarPlayDisconnectFromDisk();
  if (v4 != (CFPropertyListRef)*MEMORY[0x1E4F1CFD0]) {
    BOOL v3 = 0;
  }
  if (v4) {
    CFRelease(v4);
  }
  if (v3)
  {
    unint64_t v5 = +[MXNowPlayingAppManager sharedInstance];
    if ([(MXNowPlayingAppManager *)v5 nowPlayingAppStopTime])
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "now"), "timeIntervalSinceDate:", -[MXNowPlayingAppManager nowPlayingAppStopTime](v5, "nowPlayingAppStopTime"));
      if (v6 < 480.0)
      {
        uint64_t v7 = [(MXNowPlayingAppManager *)v5 nowPlayingAppDisplayID];
        CFPropertyListRef v8 = v7;
        if (v7) {
          CFRetain(v7);
        }
        if (!dword_1E9359ED0) {
          goto LABEL_19;
        }
        goto LABEL_17;
      }
      CFPropertyListRef v8 = CMSMNP_CopyNowPlayingAppDisplayIDUponCarPlayDisconnectFromDisk();
      if (dword_1E9359ED0)
      {
LABEL_17:
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        if (dword_1E9359ED0)
        {
          uint64_t v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
    }
    else
    {
      CFPropertyListRef v8 = CMSMNP_CopyNowPlayingAppDisplayIDUponCarPlayDisconnectFromDisk();
      if (dword_1E9359ED0) {
        goto LABEL_17;
      }
    }
LABEL_19:
    CMSMNP_ResumeNowPlayingAppOverCarPlay(v8);
    if (v8) {
      CFRelease(v8);
    }
    goto LABEL_21;
  }
  if (dword_1E9359ED0)
  {
    BOOL v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_21:
  CMSMNP_WriteNowPlayingAppWasPlayingUponCarPlayDisconnectToDisk(0);
}

- (void)resetDefaultMusicApp
{
  BOOL v3 = +[MXSessionManager copyDefaultMusicAppFromPlist];
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];

  self->_defaultMusicApp = v3;
  CFPropertyListRef v4 = [(MXSessionManager *)self propertiesLock];
  [(NSRecursiveLock *)v4 unlock];
}

- (void)handleSilentModeTimerDidFire
{
  BOOL v3 = MXGetSerialQueue();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__MXSessionManager_handleSilentModeTimerDidFire__block_invoke;
  v4[3] = &unk_1E57C6368;
  v4[4] = self;
  MXDispatchAsync((uint64_t)"-[MXSessionManager handleSilentModeTimerDidFire]", (uint64_t)"MXSessionManager.m", 1205, 0, 0, v3, (uint64_t)v4);
}

uint64_t __48__MXSessionManager_handleSilentModeTimerDidFire__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 32), "setSilentModeEnabled:", objc_msgSend(*(id *)(a1 + 32), "silentModeEnabled", v4, v5) ^ 1);
  [*(id *)(a1 + 32) setSilentModeEnabledUntilTime:0];
  [+[MXAlarmEvents sharedInstance] resetAlarmEvent:@"com.apple.mediaexperience.silentmode.timer"];
  MXCFPreferencesSetAndSynchronizeUserPreference(@"silentModeEnabled", (const void *)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "silentModeEnabled")));
  MXCFPreferencesSetAndSynchronizeUserPreference(@"silentModeEnabledUntilTime", 0);
  CMSMDeviceState_UpdateRingerStateForSilentMode([*(id *)(a1 + 32) silentModeEnabled]);
  CMSMNotificationUtility_PostSilentModeEnabledDidChange([*(id *)(a1 + 32) silentModeEnabled]);
  return -[MXBiomeStreams updateBiomeSilentMode:clientType:untilTime:reason:](+[MXBiomeStreams sharedInstance](MXBiomeStreams, "sharedInstance"), "updateBiomeSilentMode:clientType:untilTime:reason:", [*(id *)(a1 + 32) silentModeEnabled], objc_msgSend(*(id *)(a1 + 32), "silentModeClient"), 0, objc_msgSend(*(id *)(a1 + 32), "silentModeReason"));
}

- (void)updateSilentModeTimer:(BOOL)a3 untilTime:(id)a4 clientType:(unsigned int)a5
{
  BOOL v7 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [a4 timeIntervalSinceNow];
  if (v9 <= 0.0)
  {
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [(MXSessionManager *)self removeSilentModeTimer];
  }
  else
  {
    double v10 = v9;
    if (a5 == 5
      && [(MXSessionManager *)self silentModeEnabled] == v7
      && ![(MXSessionManager *)self silentModeEnabledUntilTime])
    {
      if (dword_1E9359ED0)
      {
        uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      [+[MXAlarmEvents sharedInstance] setAlarmEvent:@"com.apple.mediaexperience.silentmode.timer" eventName:v10];
      [(MXSessionManager *)self setSilentModeEnabledUntilTime:a4];
      MXCFPreferencesSetAndSynchronizeUserPreference(@"silentModeEnabledUntilTime", a4);
    }
  }
}

- (void)updateSilentModeState:(BOOL)a3 untilTime:(id)a4 withReason:(id)a5 forClientType:(unsigned int)a6 updateForStartup:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v11 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v13 = [(MXSessionManager *)self silentModeEnabled];
  int v14 = v13;
  if (v7)
  {
    if (dword_1E9359ED0)
    {
      BOOL v22 = v13;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      int v14 = v22;
    }
    long long v16 = [+[MXSessionManager sharedInstance] silentModeEnabledUntilTime];
    if (v16)
    {
      [(NSDate *)v16 timeIntervalSinceNow];
      if (v17 > 0.0)
      {
        uint64_t v11 = v11;
      }
      else
      {
        a4 = 0;
        uint64_t v11 = v14 ^ 1u;
      }
    }
  }
  [+[MXSessionManager sharedInstance] setSilentModeClient:v8];
  [+[MXSessionManager sharedInstance] setSilentModeReason:a5];
  MXCFPreferencesSetAndSynchronizeUserPreference(@"silentModeClientType", (const void *)[MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v8]);
  MXCFPreferencesSetAndSynchronizeUserPreference(@"silentModeReason", a5);
  if (dword_1E9359ED0)
  {
    uint64_t v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[MXSessionManager updateSilentModeTimer:untilTime:clientType:](self, "updateSilentModeTimer:untilTime:clientType:", v11, a4, v8, v20, v21);
  if (v14 != v11)
  {
    [(MXSessionManager *)self setSilentModeEnabled:v11];
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithBool:v11];
    MXCFPreferencesSetAndSynchronizeUserPreference(@"silentModeEnabled", v19);

LABEL_13:
    CMSMDeviceState_UpdateRingerStateForSilentMode(v11);
    CMSMNotificationUtility_PostSilentModeEnabledDidChange(v11);
    goto LABEL_14;
  }
  if (v7) {
    goto LABEL_13;
  }
LABEL_14:
  [+[MXBiomeStreams sharedInstance] updateBiomeSilentMode:v11 clientType:v8 untilTime:a4 reason:a5];
}

- (void)removeSilentModeTimer
{
  [+[MXAlarmEvents sharedInstance] resetAlarmEvent:@"com.apple.mediaexperience.silentmode.timer"];
  [(MXSessionManager *)self setSilentModeEnabledUntilTime:0];
  MXCFPreferencesSetAndSynchronizeUserPreference(@"silentModeEnabledUntilTime", 0);
}

- (void)ringerIsOnChanged:(BOOL)a3
{
  BOOL v3 = a3;
  cmsmUpdateEnableSharedAudioRouteSyntheticMute(1, 0, 0, 0, 0, 0);
  cmsUpdateMuteStatus(0);
  if (v3)
  {
    vaemUnmuteFullMuteIfMuted();
  }
}

- (void)pvmStateDidChangeCallback:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = [(MXSessionManager *)self copyMXCoreSessionList];
  [+[MXSessionManager sharedInstance] duckVolumeForSpeakerVolumeLimit];
  int v6 = v5;
  BOOL v7 = [MXDuckingSource alloc];
  LODWORD(v8) = 0.5;
  LODWORD(v9) = v6;
  double v10 = [(MXDuckingSource *)v7 initWithType:7 ID:0 duckVolume:v9 duckFadeDuration:v8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v4;
  uint64_t v11 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * v14);
        if ([(MXSessionManager *)self isSessionDucked:v15 duckingSource:v10])
        {
          [(MXSessionManager *)self startAsyncDuckingOperation];
          if (dword_1E9359ED0)
          {
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          -[MXSessionManager unduckVolume:sessionCausingUnduck:duckingSource:](self, "unduckVolume:sessionCausingUnduck:duckingSource:", v15, 0, v10, v19, v20);
LABEL_14:
          [(MXSessionManager *)self endAsyncDuckingOperationForSession:v15];
          goto LABEL_15;
        }
        if ([v15 isActive]
          && [(MXSessionManager *)self shouldDuckSessionForSpeakerVolumeLimit:v15])
        {
          [(MXSessionManager *)self startAsyncDuckingOperation];
          if (dword_1E9359ED0)
          {
            double v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          -[MXSessionManager duckVolume:duckerSession:duckingSource:](self, "duckVolume:duckerSession:duckingSource:", v15, 0, v10, v19, v20);
          goto LABEL_14;
        }
LABEL_15:
        ++v14;
      }
      while (v12 != v14);
      uint64_t v18 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v12 = v18;
    }
    while (v18);
  }
}

- (void)dumpDebugInfo
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    unsigned int v40 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] lock];
  if (dword_1E9359ED0)
  {
    unsigned int v40 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ([(NSMutableDictionary *)[(MXSessionManager *)self pickableRoutesDescriptions] count])
  {
    CFDictionaryApplyFunction((CFDictionaryRef)[(MXSessionManager *)self pickableRoutesDescriptions], (CFDictionaryApplierFunction)CMSMUtility_PrintRouteDescriptions, 0);
  }
  if (dword_1E9359ED0)
  {
    unsigned int v40 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(NSRecursiveLock *)[(MXSessionManager *)self propertiesLock] unlock];
  if (dword_1E9359ED0)
  {
    unsigned int v40 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  BOOL v7 = [(MXSessionManager *)self devicesSampleRates];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v8 = [(NSDictionary *)v7 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v34 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v34) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v12 = -[NSDictionary objectForKey:](v7, "objectForKey:", v11, v28, v33);
        if (dword_1E9359ED0)
        {
          uint64_t v13 = v12;
          unsigned int v40 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v15 = v40;
          if (os_log_type_enabled(v14, type)) {
            unsigned int v16 = v15;
          }
          else {
            unsigned int v16 = v15 & 0xFFFFFFFE;
          }
          if (v16)
          {
            uint64_t VADNameForVADID = CMSMUtility_GetVADNameForVADID([v11 unsignedIntValue]);
            int v41 = 136315650;
            long long v42 = "-[MXSessionManager dumpDebugInfo]";
            __int16 v43 = 2114;
            uint64_t v44 = VADNameForVADID;
            __int16 v45 = 2114;
            uint64_t v46 = v13;
            LODWORD(v33) = 32;
            uint64_t v28 = &v41;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      uint64_t v9 = [(NSDictionary *)v7 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v9);
  }
  if (dword_1E9359ED0)
  {
    unsigned int v40 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v19 = v40;
    if (os_log_type_enabled(v18, type)) {
      unsigned int v20 = v19;
    }
    else {
      unsigned int v20 = v19 & 0xFFFFFFFE;
    }
    if (v20)
    {
      int v41 = 136315138;
      long long v42 = "-[MXSessionManager dumpDebugInfo]";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1E9359ED0)
    {
      unsigned int v40 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v22 = v40;
      if (os_log_type_enabled(v21, type)) {
        unsigned int v23 = v22;
      }
      else {
        unsigned int v23 = v22 & 0xFFFFFFFE;
      }
      if (v23)
      {
        int v41 = 136315138;
        long long v42 = "-[MXSessionManager dumpDebugInfo]";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (void)setMutedSessionBundleIDs:(id)a3
{
}

- (void)setFigCustomizedCategoryWithBluetooth_Dict:(id)a3
{
}

- (void)setFigCustomizedCategoryWithoutBluetooth_Dict:(id)a3
{
}

- (void)setMxCoreSessionListReadLock:(id)a3
{
}

- (void)setMxCoreSessionListWriteSemaphore:(id)a3
{
}

- (void)setFigUncustomizedCategory_Dict:(id)a3
{
}

- (void)setFigCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict:(id)a3
{
}

- (NSDictionary)figCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict
{
  return self->_figCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict;
}

- (void)setFigCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict:(id)a3
{
}

- (NSDictionary)figCustomizedCategoryWithDefaultBuiltIn_Default_Dict
{
  return self->_figCustomizedCategoryWithDefaultBuiltIn_Default_Dict;
}

- (void)setFigCustomizedCategoryWithDefaultBuiltIn_Default_Dict:(id)a3
{
}

- (void)setFigCategoryToMuteabilityDict:(id)a3
{
}

- (NSDictionary)figCategoryToOutputOverridabilityDict
{
  return self->_figCategoryToOutputOverridabilityDict;
}

- (void)setFigCategoryToOutputOverridabilityDict:(id)a3
{
}

- (void)setFigCategoryToVADCategoryDict:(id)a3
{
}

- (NSDictionary)figRouteToVADOutputPortTypeDict
{
  return self->_figRouteToVADOutputPortTypeDict;
}

- (void)setFigRouteToVADOutputPortTypeDict:(id)a3
{
}

- (NSDictionary)figRouteToVADInputPortTypeDict
{
  return self->_figRouteToVADInputPortTypeDict;
}

- (void)setFigRouteToVADInputPortTypeDict:(id)a3
{
}

- (void)setVadOutputPortTypeToFigOutputDeviceNameDict:(id)a3
{
}

- (void)setVadOutputPortTypeToMuteabilityDict:(id)a3
{
}

- (void)setVadInputPortTypeToFigInputDeviceNameDict:(id)a3
{
}

- (void)setFigModeTypeToVADModeType:(id)a3
{
}

- (void)setAppAllowedToFadeInTemporarily:(id)a3
{
}

- (NSString)appAllowedToInitiatePlaybackTemporarily
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAppAllowedToInitiatePlaybackTemporarily:(id)a3
{
}

- (NSDate)appAllowedToInitiateRecordingTemporarilyTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 248, 1);
}

- (NSNumber)applyUplinkMuteToPhoneCallBehaviorSession
{
  return (NSNumber *)objc_getProperty(self, a2, 256, 1);
}

- (void)setApplyUplinkMuteToPhoneCallBehaviorSession:(id)a3
{
}

- (void)setCurrentStream0:(unsigned int)a3
{
  self->_currentStream0 = a3;
}

- (NSString)defaultMusicApp
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setDefaultMusicApp:(id)a3
{
}

- (NSDictionary)detailedRoutesDescription
{
  return (NSDictionary *)objc_getProperty(self, a2, 288, 1);
}

- (void)setDetailedRoutesDescription:(id)a3
{
}

- (NSPointerArray)sessionsThatWantToSuspendNeroScreenMirroring
{
  return self->_sessionsThatWantToSuspendNeroScreenMirroring;
}

- (void)setSessionsThatWantToSuspendNeroScreenMirroring:(id)a3
{
}

- (NSMutableDictionary)quiesceableWiredPortsAutoRouteOnConnectPreference
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 304, 1);
}

- (void)setQuiesceableWiredPortsAutoRouteOnConnectPreference:(id)a3
{
}

- (NSDate)silentModeEnabledUntilTime
{
  return (NSDate *)objc_getProperty(self, a2, 312, 1);
}

- (void)setSilentModeEnabledUntilTime:(id)a3
{
}

- (NSString)silentModeReason
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setSilentModeReason:(id)a3
{
}

- (NSString)uplinkMutedBundleID
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setVoiceOverVADVolumeNeedsUpdate:(BOOL)a3
{
  self->_voiceOverVADVolumeNeedsUpdate = a3;
}

- (void)setCarPlayIsConnected:(BOOL)a3
{
  self->_carPlayIsConnected = a3;
}

- (BOOL)phoneCallBehaviorSessionShouldResumeForCarPlay
{
  return self->_phoneCallBehaviorSessionShouldResumeForCarPlay;
}

- (void)setPhoneCallBehaviorSessionShouldResumeForCarPlay:(BOOL)a3
{
  self->_phoneCallBehaviorSessionShouldResumeForCarPlay = a3;
}

- (void)setMxCoreSessionList:(id)a3
{
}

- (void)setPropertiesLock:(id)a3
{
}

- (unsigned)silentModeClient
{
  return self->_silentModeClient;
}

- (void)setSilentModeClient:(unsigned int)a3
{
  self->_silentModeClient = a3;
}

- (BOOL)silentModeEnabled
{
  return self->_silentModeEnabled;
}

- (void)setSilentModeEnabled:(BOOL)a3
{
  self->_silentModeEnabled = a3;
}

- (BOOL)starkMainAudioIsOwnedByiOSButBorrowedByCar
{
  return self->_starkMainAudioIsOwnedByiOSButBorrowedByCar;
}

- (void)setStarkMainAudioIsOwnedByiOSButBorrowedByCar:(BOOL)a3
{
  self->_starkMainAudioIsOwnedByiOSButBorrowedByCar = a3;
}

- (void)setUplinkMute:(BOOL)a3
{
  self->_uplinkMute = a3;
}

- (BOOL)uplinkMuteSetByClient
{
  return self->_uplinkMuteSetByClient;
}

- (void)setUplinkMuteSetByClient:(BOOL)a3
{
  self->_uplinkMuteSetByClient = a3;
}

- (BOOL)appendContextToMuteNotification
{
  return self->_appendContextToMuteNotification;
}

- (void)setAppendContextToMuteNotification:(BOOL)a3
{
  self->_appendContextToMuteNotification = a3;
}

- (void)setPickableRoutesDescriptions:(id)a3
{
}

- (void)getUpdatedDuckVolume:(id)a3 outDuckVolume:(float *)a4
{
  if (a3)
  {
    [a3 duckToLevelDB];
    float v7 = v6;
    if (v6 == -40.0)
    {
      if ([a3 duckToLevelScalarSetByClient])
      {
        BOOL v8 = 0;
        float v7 = -40.0;
      }
      else
      {
        AudioObjectID CurrentOutputPortAtIndex = CMSMUtility_GetCurrentOutputPortAtIndex(0);
        int DoesPortSupportDoAP = vaeDoesPortSupportDoAP(CurrentOutputPortAtIndex);
        BOOL v8 = DoesPortSupportDoAP != 0;
        if (DoesPortSupportDoAP) {
          float v7 = -68.0;
        }
        else {
          float v7 = -40.0;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
    int v11 = [a3 duckToLevelDBSetByClient];
    AudioObjectID v12 = CMSMUtility_GetCurrentOutputPortAtIndex(0);
    if (vaeDoesPortSupportSoftwareVolume(v12))
    {
      if (v8 | v11) {
        *a4 = vaeGetDestinationVolumeScalarFactor(v7, *a4);
      }
    }
  }
}

- (void)addDuckerToSession:(id)a3 duckerSession:(id)a4 duckingSource:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v8 = [a5 type];
  [a5 ID];
  if (a4 || v8 != 2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = objc_msgSend(a3, "duckingSourceList", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        if ([a5 type] == 1 && objc_msgSend(v14, "type") == 1) {
          break;
        }
        if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled()
          && [a5 type] == 6
          && [v14 type] == 6)
        {
          break;
        }
        if ([a5 type] == 7 && objc_msgSend(v14, "type") == 7) {
          break;
        }
        int v15 = [a5 type];
        if (v15 == [v14 type])
        {
          uint64_t v16 = [a5 ID];
          if (v16 == [v14 ID] && objc_msgSend(a5, "type") == 2) {
            break;
          }
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v11) {
            goto LABEL_5;
          }
          goto LABEL_20;
        }
      }
    }
    else
    {
LABEL_20:
      objc_msgSend((id)objc_msgSend(a3, "duckingSourceList"), "addObject:", a5);
    }
  }
}

- (void)removeDuckerForSession:(id)a3 sessionCausingUnduck:(id)a4 duckingSource:(id)a5 outLastDuckingSourceWasRemoved:(BOOL *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a5, "type", a3, a4) == 3)
  {
    objc_msgSend((id)objc_msgSend(a3, "duckingSourceList"), "removeAllObjects");
LABEL_30:
    *a6 = 1;
    return;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = (void *)[a3 duckingSourceList];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (([a5 type] != 1 || objc_msgSend(v14, "type") != 1)
          && (!MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled()
           || [a5 type] != 6
           || [v14 type] != 6)
          && ([a5 type] != 7 || objc_msgSend(v14, "type") != 7))
        {
          int v15 = [a5 type];
          if (v15 != [v14 type]) {
            continue;
          }
          uint64_t v16 = [a5 ID];
          if (v16 != [v14 ID]) {
            continue;
          }
        }
        if (v14) {
          objc_msgSend((id)objc_msgSend(a3, "duckingSourceList"), "removeObject:", v14);
        }
        goto LABEL_22;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_22:
  if (!objc_msgSend((id)objc_msgSend(a3, "duckingSourceList"), "count")) {
    goto LABEL_30;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  long long v17 = objc_msgSend(a3, "duckingSourceList", 0, 0);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v22;
    while (1)
    {
      if (*(void *)v22 != v20) {
        objc_enumerationMutation(v17);
      }
      if (!--v19)
      {
        uint64_t v19 = [v17 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (!v19) {
          break;
        }
      }
    }
  }
}

- (float)getScalarVolume:(float)a3
{
  return __exp10(a3 / 20.0);
}

- (float)getDuckVolumeForBlurEffect:(id)a3 duckeeSession:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  *(_OWORD *)CFTypeRef cf = 0u;
  *(_OWORD *)long long v24 = 0u;
  uint64_t CurrentAudioDestination = CMSUtility_GetCurrentAudioDestination(a4);
  cmsmCopyCurrentActiveRouteInfoAtIndexForVADUID(CurrentAudioDestination, 0, &cf[1], &v24[1], v24);
  CFStringRef v8 = -[MXSessionManager getUncustomizedCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getUncustomizedCategory:", [a4 audioCategory]);
  uint64_t v9 = (const void *)[a4 audioMode];
  v26[0] = *(_OWORD *)cf;
  v26[1] = *(_OWORD *)v24;
  uint64_t v27 = v25;
  float v10 = PVMGetVolumePreference(v8, v9, (uint64_t)v26);
  if (cf[1]) {
    CFRelease(cf[1]);
  }
  if (v24[1]) {
    CFRelease(v24[1]);
  }
  if (cf[1]) {
    CFRelease(cf[1]);
  }
  float outData = v10;
  AudioObjectID CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a4);
  if (vaemConvertToDecibelInVAD(CurrentOutputVADID, &outData)) {
    float outData = 0.0;
  }
  if (a3)
  {
    [a3 duckToLevelDB];
    float v13 = *(float *)&v12;
  }
  else
  {
    float v13 = -40.0;
  }
  float v14 = 1.0;
  if (outData > v13)
  {
    *(float *)&double v12 = v13;
    [(MXSessionManager *)self getScalarVolume:v12];
    float v16 = v15;
    *(float *)&double v17 = outData;
    [(MXSessionManager *)self getScalarVolume:v17];
    float v14 = v16 / v18;
  }
  if (v14 <= 1.0) {
    float v19 = v14;
  }
  else {
    float v19 = 1.0;
  }
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v19;
}

- (BOOL)areDuckerAndDuckeePlayingOnDifferentVADs:(id)a3 duckerSession:(id)a4
{
  int CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a3);
  if (a4) {
    int VADIDForVADName = CMSUtility_GetCurrentOutputVADID(a4);
  }
  else {
    int VADIDForVADName = CMSMUtility_GetVADIDForVADName(0x1EE5EBF68);
  }
  if (VADIDForVADName == CurrentOutputVADID && dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return VADIDForVADName != CurrentOutputVADID;
}

- (BOOL)shouldBlurOnHomePod:(id)a3 duckerSession:(id)a4
{
  int v7 = CMSMDeviceState_ItsAHomePod();
  if (v7)
  {
    LOBYTE(v7) = [(MXSessionManager *)self areDuckerAndDuckeePlayingOnDifferentVADs:a3 duckerSession:a4];
  }
  return v7;
}

- (int)blurOnHomePod:(id)a3 duckerSession:(id)a4 duckVolume:(float)a5 duckFadeDuration:(float)a6
{
  [(MXSessionManager *)self getDuckVolumeForBlurEffect:a4 duckeeSession:a3];
  if (a4)
  {
    if (!dword_1E9359ED0) {
      goto LABEL_6;
    }
  }
  else if (!dword_1E9359ED0)
  {
    goto LABEL_6;
  }
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_6:
  uint64_t CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a3);
  int v10 = CMSMVAUtility_SetBlurConfigurationOnVA(CurrentOutputVADID);
  [a3 setDuckedOnVAD:1];
  if (v10) {
    BOOL v11 = dword_1E9359ED0 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    double v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v10;
}

- (BOOL)unblurOnHomePod:(id)a3 unduckDuration:(float)a4
{
  int v5 = CMSMDeviceState_ItsAHomePod();
  if (v5)
  {
    int v5 = [a3 duckedOnVAD];
    if (v5)
    {
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a3);
      CMSMVAUtility_SetBlurConfigurationOnVA(CurrentOutputVADID);
      [a3 setDuckedOnVAD:0];
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)duckVolume:(id)a3 duckerSession:(id)a4 duckingSource:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a4 && CMSUtility_SessionDucksOthers(a3))
  {
    if (!dword_1E9359ED0) {
      return;
    }
LABEL_17:
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return;
  }
  int v9 = [a5 type];
  int v10 = (void *)[a5 ID];
  [a5 duckVolume];
  int v12 = v11;
  int v32 = v11;
  [a5 duckFadeDuration];
  int v14 = v13;
  if (v9) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = CMSystemSoundMgr_SystemSoundMustBeHeard(v10) != 0;
  }
  if (CMSUtility_GetPrefersNoDucking(a3)
    && v9 != 1
    && !v15
    && (!MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled() || v9 != 6))
  {
    if (!dword_1E9359ED0) {
      return;
    }
    goto LABEL_17;
  }
  [(MXSessionManager *)self addDuckerToSession:a3 duckerSession:a4 duckingSource:a5];
  if ([a3 isDucked]) {
    return;
  }
  [+[MXSessionManager sharedInstance] cancelAnyInProgressRampIfNeeded:a3 reason:1];
  if (![(MXSessionManager *)self shouldBlurOnHomePod:a3 duckerSession:a4])
  {
    [(MXSessionManager *)self getUpdatedDuckVolume:a4 outDuckVolume:&v32];
    if (a4)
    {
      if (dword_1E9359ED0)
      {
        uint64_t v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
LABEL_23:
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else if (dword_1E9359ED0)
    {
      uint64_t v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      goto LABEL_23;
    }
    LODWORD(v19) = v32;
    long long v21 = (const void *)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v19, v29, v30);
    LODWORD(v22) = v14;
    long long v23 = (const void *)[MEMORY[0x1E4F28ED0] numberWithFloat:v22];
    AudioObjectID CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a3);
    vaemSetToolboxDuckingEnabled(CurrentOutputVADID);
    CMSUtility_PostInterruptionCommandNotification(a3, 2u, (__CFString *)[a3 clientName], 0, v21, v23, 0, 0);
    LODWORD(v25) = v14;
    [(MXSessionManager *)self updateMostRecentDuckFadeDuration:1 duckOperation:a4 duckerSession:a3 sessionToDuck:v25];
    goto LABEL_25;
  }
  LODWORD(v16) = v12;
  LODWORD(v17) = v14;
  [(MXSessionManager *)self blurOnHomePod:a3 duckerSession:a4 duckVolume:v16 duckFadeDuration:v17];
LABEL_25:
  [a3 setIsDucked:1];
  LODWORD(v26) = v14;
  [a3 setAudioQueueFadeDuration:v26];
  LODWORD(v27) = v32;
  [a3 setAudioQueueDuckVolume:v27];
  LODWORD(v28) = v32;
  [a4 setLastDuckVolumeApplied:v28];
}

- (void)unduckVolume:(id)a3 sessionCausingUnduck:(id)a4 duckingSource:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([a3 isDucked])
  {
    id v9 = a4 ? a4 : a3;
    [v9 unduckFadeDuration];
    float v11 = v10 <= 0.0 ? 0.5 : v10;
    char v22 = 0;
    [(MXSessionManager *)self removeDuckerForSession:a3 sessionCausingUnduck:a4 duckingSource:a5 outLastDuckingSourceWasRemoved:&v22];
    if (v22)
    {
      [a3 setIsDucked:0];
      *(float *)&double v12 = v11;
      if (![(MXSessionManager *)self unblurOnHomePod:a3 unduckDuration:v12]
        && ![a3 interruptingSession])
      {
        *(float *)&double v13 = v11;
        int v14 = (const void *)[MEMORY[0x1E4F28ED0] numberWithFloat:v13];
        LODWORD(v15) = 1.0;
        double v16 = (const void *)[MEMORY[0x1E4F28ED0] numberWithFloat:v15];
        if (dword_1E9359ED0)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        CMSUtility_PostInterruptionCommandNotification(a3, 3u, (__CFString *)objc_msgSend(a3, "clientName", v20, v21), 0, v16, v14, 0, 0);
        AudioObjectID CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a3);
        vaemSetToolboxDuckingEnabled(CurrentOutputVADID);
        *(float *)&double v19 = v11;
        [(MXSessionManager *)self updateMostRecentDuckFadeDuration:0 duckOperation:a4 duckerSession:a3 sessionToDuck:v19];
      }
    }
  }
}

- (BOOL)isSessionDucked:(id)a3 duckingSource:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  LODWORD(v6) = [a3 isDucked];
  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v7 = objc_msgSend(a3, "duckingSourceList", 0);
    uint64_t v6 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          float v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          int v12 = [v11 type];
          if (v12 == [a4 type])
          {
            uint64_t v13 = [v11 ID];
            if (v13 == [a4 ID])
            {
              LOBYTE(v6) = 1;
              return v6;
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        LOBYTE(v6) = 0;
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  return v6;
}

- (id)getDuckingSource:(id)a3 duckerSession:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v5 = objc_msgSend(a3, "duckingSourceList", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v14;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v14 != v8) {
      objc_enumerationMutation(v5);
    }
    float v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
    if ([v10 type] == 2)
    {
      uint64_t v11 = [v10 ID];
      if (v11 == objc_msgSend((id)objc_msgSend(a4, "ID"), "longLongValue")) {
        return v10;
      }
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)duckSessionsForDucker:(id)a3 sessionsToDuck:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    [(MXSessionManager *)self startAsyncDuckingOperation];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = [a4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(a4);
          }
          float v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
          uint64_t v11 = [MXDuckingSource alloc];
          uint64_t v12 = objc_msgSend((id)objc_msgSend(a3, "ID"), "longLongValue");
          [a3 duckToLevelScalar];
          int v14 = v13;
          [a3 duckFadeDuration];
          LODWORD(v16) = v15;
          LODWORD(v17) = v14;
          uint64_t v18 = [(MXDuckingSource *)v11 initWithType:2 ID:v12 duckVolume:v17 duckFadeDuration:v16];
          [+[MXSessionManager sharedInstance] duckVolume:v10 duckerSession:a3 duckingSource:v18];

          if ([v10 isCarSession]) {
            [a3 setDuckCommandSentToCarSession:1];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [a4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
    [(MXSessionManager *)self endAsyncDuckingOperationForSession:a3];
  }
}

- (void)unduckSessionsForDucker:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = -[MXDuckingSource initWithType:ID:duckVolume:duckFadeDuration:]([MXDuckingSource alloc], "initWithType:ID:duckVolume:duckFadeDuration:", 2, objc_msgSend((id)objc_msgSend(a3, "ID"), "longLongValue"), 0.0, 0.0);
  [+[MXSessionManager sharedInstance] mxCoreSessionListBeginIteration];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [+[MXSessionManager sharedInstance] mxCoreSessionList];
  uint64_t v8 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v12 isDucked]
          && [+[MXSessionManager sharedInstance] isSessionDucked:v12 duckingSource:v6])
        {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }
  [+[MXSessionManager sharedInstance] mxCoreSessionListEndIteration];
  [(MXSessionManager *)self startAsyncDuckingOperation];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v13 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v5);
        }
        double v17 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        [+[MXSessionManager sharedInstance] unduckVolume:v17 sessionCausingUnduck:a3 duckingSource:v6];
        if ([v17 duckCommandSentToCarSession]) {
          [v17 setDuckCommandSentToCarSession:0];
        }
      }
      uint64_t v14 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
  [(MXSessionManager *)self endAsyncDuckingOperationForSession:a3];
}

- (void)unduckSessionsForDuckingSource:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(MXSessionManager *)self startAsyncDuckingOperation];
  [+[MXSessionManager sharedInstance] mxCoreSessionListBeginIteration];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [+[MXSessionManager sharedInstance] mxCoreSessionList];
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * v9);
        if ([+[MXSessionManager sharedInstance] isSessionDucked:v10 duckingSource:a3])
        {
          [+[MXSessionManager sharedInstance] unduckVolume:v10 sessionCausingUnduck:0 duckingSource:a3];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [+[MXSessionManager sharedInstance] mxCoreSessionListEndIteration];
  [(MXSessionManager *)self endAsyncDuckingOperation];
}

- (void)updateDuckingSourceInfoForSession:(id)a3 duckerSession:(id)a4 duckVolume:(float)a5 duckFadeDuration:(float)a6
{
  id v8 = -[MXSessionManager getDuckingSource:duckerSession:](self, "getDuckingSource:duckerSession:");
  if (v8)
  {
    uint64_t v10 = v8;
    *(float *)&double v9 = a5;
    [v8 setDuckVolume:v9];
    *(float *)&double v11 = a6;
    [v10 setDuckFadeDuration:v11];
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (BOOL)isAnExistingDuckingSource:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFArrayRef v5 = CMSUtility_CopySessionsToDuck(1, 0, (const __CFArray *)a3);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(__CFArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([(MXSessionManager *)self getDuckingSource:*(void *)(*((void *)&v12 + 1) + 8 * i) duckerSession:a3])
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(__CFArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)updateDuckVolume:(id)a3 duckerSession:(id)a4 duckVolume:(float)a5 duckFadeDuration:(float)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  float v21 = a5;
  [+[MXSessionManager sharedInstance] cancelAnyInProgressRampIfNeeded:a3 reason:1];
  [(MXSessionManager *)self getUpdatedDuckVolume:a4 outDuckVolume:&v21];
  *(float *)&double v10 = v21;
  double v11 = (const void *)[MEMORY[0x1E4F28ED0] numberWithFloat:v10];
  *(float *)&double v12 = a6;
  long long v13 = (const void *)[MEMORY[0x1E4F28ED0] numberWithFloat:v12];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSUtility_PostInterruptionCommandNotification(a3, 2u, (__CFString *)objc_msgSend(a3, "clientName", v19, v20), 0, v11, v13, 0, 0);
  *(float *)&double v15 = a6;
  [(MXSessionManager *)self updateMostRecentDuckFadeDuration:1 duckOperation:a4 duckerSession:a3 sessionToDuck:v15];
  *(float *)&double v16 = a6;
  [a3 setAudioQueueFadeDuration:v16];
  *(float *)&double v17 = v21;
  [a3 setAudioQueueDuckVolume:v17];
  *(float *)&double v18 = v21;
  [a4 setLastDuckVolumeApplied:v18];
}

- (BOOL)updateUnduckVolume:(id)a3 duckerSession:(id)a4 unduckVolume:(float)a5 unduckFadeDuration:(float)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  float v22 = a5;
  [+[MXSessionManager sharedInstance] cancelAnyInProgressRampIfNeeded:a3 reason:1];
  [(MXSessionManager *)self getUpdatedDuckVolume:a4 outDuckVolume:&v22];
  *(float *)&double v10 = v22;
  double v11 = (const void *)[MEMORY[0x1E4F28ED0] numberWithFloat:v10];
  *(float *)&double v12 = a6;
  long long v13 = (const void *)[MEMORY[0x1E4F28ED0] numberWithFloat:v12];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  float v15 = v22;
  if (v22 == 1.0)
  {
    uint64_t v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    CMSUtility_PostInterruptionCommandNotification(a3, 3u, (__CFString *)[a3 clientName], 0, v11, v13, 0, 0);
    *(float *)&double v16 = a6;
    [(MXSessionManager *)self updateMostRecentDuckFadeDuration:0 duckOperation:a4 duckerSession:a3 sessionToDuck:v16];
    *(float *)&double v17 = a6;
    [a3 setAudioQueueFadeDuration:v17];
    *(float *)&double v18 = v22;
    [a3 setAudioQueueDuckVolume:v18];
    *(float *)&double v19 = v22;
    [a4 setLastDuckVolumeApplied:v19];
  }
  return v15 != 1.0;
}

- (BOOL)updateDuckVolumeForDucker:(id)a3 duckVolume:(float)a4 duckFadeDuration:(float)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v9 = 1;
  CFArrayRef v10 = CMSUtility_CopySessionsToDuck(1, 0, (const __CFArray *)a3);
  [(MXSessionManager *)self startAsyncDuckingOperation];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v11 = [(__CFArray *)v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        float v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (([v15 isDucked] & 1) == 0)
        {
          if (dword_1E9359ED0)
          {
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          BOOL v9 = 0;
          goto LABEL_13;
        }
        *(float *)&double v16 = a4;
        *(float *)&double v17 = a5;
        [(MXSessionManager *)self updateDuckingSourceInfoForSession:v15 duckerSession:a3 duckVolume:v16 duckFadeDuration:v17];
        *(float *)&double v18 = a4;
        *(float *)&double v19 = a5;
        [(MXSessionManager *)self updateDuckVolume:v15 duckerSession:a3 duckVolume:v18 duckFadeDuration:v19];
      }
      uint64_t v12 = [(__CFArray *)v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    BOOL v9 = 1;
  }
LABEL_13:
  [(MXSessionManager *)self endAsyncDuckingOperation];

  return v9;
}

- (BOOL)updateUnduckVolumeForDucker:(id)a3 unduckVolume:(float)a4 unduckFadeDuration:(float)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  CFArrayRef v9 = CMSUtility_CopySessionsToDuck(1, 0, (const __CFArray *)a3);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v10 = [(__CFArray *)v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        if (([*(id *)(*((void *)&v32 + 1) + 8 * i) isDucked] & 1) == 0)
        {
          if (dword_1E9359ED0)
          {
            int v31 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          BOOL v23 = 0;
          goto LABEL_20;
        }
      }
      uint64_t v11 = [(__CFArray *)v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  [(MXSessionManager *)self startAsyncDuckingOperation];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v14 = [(__CFArray *)v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v14)
  {
    uint64_t v17 = v14;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v9);
        }
        uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        *(float *)&double v15 = a4;
        *(float *)&double v16 = a5;
        [(MXSessionManager *)self updateDuckingSourceInfoForSession:v20 duckerSession:a3 duckVolume:v15 duckFadeDuration:v16];
        *(float *)&double v21 = a4;
        *(float *)&double v22 = a5;
        [(MXSessionManager *)self updateUnduckVolume:v20 duckerSession:a3 unduckVolume:v21 unduckFadeDuration:v22];
      }
      uint64_t v17 = [(__CFArray *)v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v17);
  }
  [(MXSessionManager *)self endAsyncDuckingOperation];
  BOOL v23 = 1;
LABEL_20:

  return v23;
}

- (int)updateDuckToLevelScalarSetByClient:(BOOL)a3 session:(id)a4 newLevel:(float)a5 newLevelSetByClient:(BOOL)a6 currentLevel:(float)a7 currentLevelSetByClient:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  BOOL v13 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  BOOL v15 = [+[MXSessionManager sharedInstance] isAnExistingDuckingSource:a4];
  [a4 lastDuckVolumeApplied];
  float v16 = *(float *)&v17;
  *(float *)&double v17 = a5;
  if (v13)
  {
    [a4 setDuckToLevelScalar:v17];
    [a4 setDuckToLevelScalarSetByClient:v10];
  }
  else
  {
    [a4 setUnduckToLevelScalar:v17];
    [a4 setUnduckToLevelScalarSetByClient:v10];
  }
  int result = [a4 isActive];
  if (result)
  {
    if ([a4 interruptionStyle] != 32)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return -15685;
    }
    if ([+[MXSessionManager sharedInstance] voiceOverSessionWantsRelativeDucking:a4])
    {
      if (dword_1E9359ED0)
      {
        double v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      [(MXSessionManager *)self startAsyncDuckingOperation];
      [+[MXSessionManager sharedInstance] updateDuckedSessionsForVoiceOver:a4];
      [(MXSessionManager *)self endAsyncDuckingOperation];
      return 0;
    }
    if (v13)
    {
      if (v15)
      {
        if (v16 > a5)
        {
          double v21 = +[MXSessionManager sharedInstance];
          [a4 duckToLevelScalar];
          int v23 = v22;
          [a4 duckFadeDuration];
          LODWORD(v25) = v24;
          LODWORD(v26) = v23;
          if (![(MXSessionManager *)v21 updateDuckVolumeForDucker:a4 duckVolume:v26 duckFadeDuration:v25])
          {
            long long v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            *(float *)&double v36 = a7;
            [a4 setDuckToLevelScalar:v36];
            [a4 setDuckToLevelScalarSetByClient:v8];
            return -15685;
          }
          return 0;
        }
        if (!dword_1E9359ED0) {
          return 0;
        }
      }
      else if (!dword_1E9359ED0)
      {
        return 0;
      }
    }
    else if (v15)
    {
      if (a5 == 1.0)
      {
        [+[MXSessionManager sharedInstance] unduckSessionsForDucker:a4];
        return 0;
      }
      if (v16 < a5)
      {
        long long v28 = +[MXSessionManager sharedInstance];
        [a4 unduckToLevelScalar];
        int v30 = v29;
        [a4 unduckFadeDuration];
        LODWORD(v32) = v31;
        LODWORD(v33) = v30;
        if (![(MXSessionManager *)v28 updateUnduckVolumeForDucker:a4 unduckVolume:v33 unduckFadeDuration:v32])
        {
          long long v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          *(float *)&double v37 = a7;
          [a4 setUnduckToLevelScalar:v37];
          [a4 setUnduckToLevelScalarSetByClient:v8];
          return -15685;
        }
        return 0;
      }
      if (!dword_1E9359ED0) {
        return 0;
      }
    }
    else if (!dword_1E9359ED0)
    {
      return 0;
    }
    long long v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  return result;
}

- (BOOL)shouldSkipDuckingForVoiceOver:(id)a3 inActiveVoiceOverSession:(id)a4
{
  if (a4) {
    id v6 = a4;
  }
  else {
    id v6 = 0;
  }
  [+[MXSessionManager sharedInstance] duckScalarForVoiceOver];
  if (v7 >= 1.0)
  {
    if (!v6
      || !CMSUtility_SessionDucksOthers(v6)
      || CMSUtility_AreSessionsRoutedToTheSamePhysicalDevice(a3, v6))
    {
      BOOL v9 = 0;
      goto LABEL_15;
    }
    if (!dword_1E9359ED0)
    {
      BOOL v9 = 1;
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  if (v6 || (id v6 = [(MXSessionManager *)self copyVoiceOverSession]) != 0)
  {
    int v8 = CMSUtility_AreSessionsRoutedToTheSamePhysicalDevice(a3, v6);
  }
  else
  {
    id v12 = [+[MXSessionManager sharedInstance] getProjectedAudioDestinationForCategory:@"VoiceOver" mode:@"Default"];
    uint64_t CurrentAudioDestination = CMSUtility_GetCurrentAudioDestination(a3);
    int v8 = CMSMUtility_AreVADsRoutedToTheSamePhysicalDevice((uint64_t)v12, CurrentAudioDestination);
  }
  BOOL v9 = v8 == 0;
  if (!v8 && dword_1E9359ED0)
  {
LABEL_10:
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    BOOL v9 = 1;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_15:

  return v9;
}

- (void)unduckSessionsForVoiceOverDuckingSource
{
  float v2 = [MXDuckingSource alloc];
  LODWORD(v3) = 1050253722;
  id v4 = [(MXDuckingSource *)v2 initWithType:6 ID:0 duckVolume:0.0 duckFadeDuration:v3];
  [+[MXSessionManager sharedInstance] unduckSessionsForDuckingSource:v4];
}

- (BOOL)voiceOverSessionWantsRelativeDucking:(id)a3
{
  int IsRelativeVoiceOverVolumeEnabled = MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled();
  LOBYTE(v5) = 0;
  if (a3)
  {
    if (IsRelativeVoiceOverVolumeEnabled)
    {
      int v5 = [a3 hasAudioCategory:@"VoiceOver"];
      if (v5) {
        LOBYTE(v5) = CMSUtility_SessionDucksOthers(a3);
      }
    }
  }
  return v5;
}

- (void)updateDuckedSessionsForVoiceOver:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled())
  {
    uint64_t v36 = 0;
    BOOL v5 = [+[MXSessionManager sharedInstance] isVoiceOverDuckingActive:a3 outDuckScalar:(char *)&v36 + 4 outDuckFadeDuration:&v36];
    if (dword_1E9359ED0)
    {
      unsigned int v35 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v5)
    {
      id v7 = [+[MXSessionManager sharedInstance] copyMXCoreSessionList];
      id v8 = [+[MXSessionManager sharedInstance] copyActiveVoiceOverSession];
      BOOL v9 = [MXDuckingSource alloc];
      LODWORD(v10) = HIDWORD(v36);
      LODWORD(v11) = v36;
      id v12 = [(MXDuckingSource *)v9 initWithType:6 ID:0 duckVolume:v10 duckFadeDuration:v11];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v13 = [v7 countByEnumeratingWithState:&v30 objects:v37 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v31;
        id v28 = v8;
        int v29 = self;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v31 != v15) {
              objc_enumerationMutation(v7);
            }
            double v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (objc_msgSend(v17, "isActive", v26, v27))
            {
              BOOL v18 = [(MXSessionManager *)self shouldSkipDuckingForVoiceOver:v17 inActiveVoiceOverSession:v8];
              if ([+[MXSessionManager sharedInstance] isSessionDucked:v17 duckingSource:v12])
              {
                if (v18)
                {
                  if (dword_1E9359ED0)
                  {
                    unsigned int v35 = 0;
                    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                    double v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    unsigned int v20 = v35;
                    if (os_log_type_enabled(v19, type)) {
                      unsigned int v21 = v20;
                    }
                    else {
                      unsigned int v21 = v20 & 0xFFFFFFFE;
                    }
                    if (v21)
                    {
                      uint64_t v22 = [v17 clientName];
                      int v38 = 136315394;
                      uint64_t v39 = "-[MXSessionManager(DuckingUtilities) updateDuckedSessionsForVoiceOver:]";
                      __int16 v40 = 2114;
                      uint64_t v41 = v22;
                      LODWORD(v27) = 22;
                      double v26 = &v38;
                      _os_log_send_and_compose_impl();
                    }
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                    id v8 = v28;
                    self = v29;
                  }
                  [+[MXSessionManager sharedInstance] unduckVolume:v17 sessionCausingUnduck:0 duckingSource:v12];
                }
                else
                {
                  int v23 = +[MXSessionManager sharedInstance];
                  LODWORD(v24) = HIDWORD(v36);
                  LODWORD(v25) = v36;
                  [(MXSessionManager *)v23 updateDuckVolume:v17 duckerSession:0 duckVolume:v24 duckFadeDuration:v25];
                }
              }
              else if (!v18 {
                     && [+[MXSessionManager sharedInstance] shouldDuckSessionForVoiceOver:v17])
              }
              {
                [+[MXSessionManager sharedInstance] duckVolume:v17 duckerSession:0 duckingSource:v12];
              }
            }
          }
          uint64_t v14 = [v7 countByEnumeratingWithState:&v30 objects:v37 count:16];
        }
        while (v14);
      }
    }
    else
    {
      [(MXSessionManager *)self unduckSessionsForVoiceOverDuckingSource];
    }
  }
}

- (void)updateDuckedSessionsForVoiceOverIfNeededOnRouteChange
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled())
  {
    if (CMSMDeviceState_IsVoiceOverOn())
    {
      [+[MXSessionManager sharedInstance] duckScalarForVoiceOver];
      if (v2 < 1.0)
      {
        if (dword_1E9359ED0)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        [+[MXSessionManager sharedInstance] startAsyncDuckingOperation];
        [+[MXSessionManager sharedInstance] updateDuckedSessionsForVoiceOver:0];
        [+[MXSessionManager sharedInstance] endAsyncDuckingOperation];
      }
    }
  }
}

- (void)updateMostRecentDuckFadeDuration:(float)a3 duckOperation:(BOOL)a4 duckerSession:(id)a5 sessionToDuck:(id)a6
{
  BOOL v7 = a4;
  if ([a6 isPlayingOutput]
    && !-[MXSessionManager isSpeechDetectCategory:](self, "isSpeechDetectCategory:", [a5 audioCategory]))
  {
    [(MXSessionManager *)self mostRecentDuckFadeDuration];
    if (*(float *)&v10 > a3)
    {
      [(MXSessionManager *)self mostRecentDuckFadeDuration];
      a3 = *(float *)&v10;
    }
    *(float *)&double v10 = a3;
    [(MXSessionManager *)self setMostRecentDuckFadeDuration:v10];
    [(MXSessionManager *)self setMostRecentDuckOperation:v7];
  }
}

- (BOOL)shouldDuckSessionForSpeakerVolumeLimit:(id)a3
{
  v14[22] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  if (([a3 isSharePlayCallSession] & 1) != 0
    || ([a3 isSharePlayMediaSession] & 1) != 0
    || PVMGetMaxVolumeLimitForBuiltInSpeaker() >= 1.0)
  {
    return 0;
  }
  id v13 = 0;
  v14[0] = 0;
  double v11 = 0;
  id v12 = 0;
  id v9 = 0;
  double v10 = 0;
  id v8 = 0;
  PVMCopyCurrentState(0, v14, &v13, (CFTypeRef *)&v12, (CFTypeRef *)&v11, (CFTypeRef *)&v10);
  if ([v12 isEqualToString:@"Speaker"]
    && [v11 isEqualToString:@"Speaker"]
    && (char v4 = [(id)v14[0] isEqualToString:@"Audio/Video"],
        PVMCopyVolumeCategoryAndMode((const __CFString *)[a3 audioCategory], (const void *)objc_msgSend(a3, "audioMode"), &v9, &v8), objc_msgSend(v9, "isEqualToString:", @"Audio/Video")))
  {
    char v5 = v4 ^ 1;
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)interruptEligibleSessionsOnContinuityScreenOutputPortAvailableDidChange
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (MX_FeatureFlags_IsInterruptingPlayingSessionsInOnenessEnabled())
  {
    id v3 = [(MXSessionManager *)self copyMXCoreSessionList];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v8, "isActive", v10, v11)
            && ([v8 isTheAssistant] & 1) == 0
            && ([v8 prefersNoInterruptionsDuringRemoteDeviceControl] & 1) == 0
            && ([v8 hasPhoneCallBehavior] & 1) == 0
            && !CMSMUtility_IsEmergencyAlertCategory([v8 audioCategory]))
          {
            if (dword_1E9359ED0)
            {
              os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            CMSUtilityApplier_PostNotification_StopCommand(v8, 0);
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
}

- (void)interruptRecordingSessionsOnContinuityScreenOutputPortAvailableDidChange
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (MX_FeatureFlags_IsOnenessEnabled())
  {
    id v3 = [(MXSessionManager *)self copyMXCoreSessionList];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v8, "isActive", v10, v11)
            && [v8 isRecordingMutedForRemoteDevice]
            && ([v8 prefersNoInterruptionsDuringRemoteDeviceControl] & 1) == 0)
          {
            if (dword_1E9359ED0)
            {
              os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            CMSUtilityApplier_PostNotification_StopCommand(v8, 0);
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
}

- (void)processContinuityScreenOutputPortAvailableDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    [(MXSessionManager *)self interruptRecordingSessionsOnContinuityScreenOutputPortAvailableDidChange];
  }
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  +[MXSystemController notifyAll:payload:dontPostIfSuspended:](MXSystemController, "notifyAll:payload:dontPostIfSuspended:", @"ContinuityScreenOutputPortAvailableDidChange", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", v3, v5, v6), @"ContinuityScreenOutputPortAvailableDidChange_IsPortAvailable", 0), 0);
}

- (void)updateCachedContinuityScreenOutputPortID
{
  if (MX_FeatureFlags_IsOnenessEnabled())
  {
    int CachedContinuityScreenOutputPortID = vaemGetCachedContinuityScreenOutputPortID();
    CFArrayRef v4 = vaemContinuityScreenOutputIsConnected() ? vaemGetVADPortIDFromVADPortType(1885565807) : 0;
    if (CachedContinuityScreenOutputPortID != v4)
    {
      vaemSetCachedContinuityScreenOutputPortID((uint64_t)v4);
      [(MXSessionManager *)self processContinuityScreenOutputPortAvailableDidChange:v4 != 0];
    }
  }
}

- (void)setUpStringConversionDictionaries
{
  keys[10] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v3 = 1650811758;
  keys[0] = @"Record";
  keys[1] = @"Record_WithBluetooth";
  keys[2] = @"PlayAndRecord";
  keys[3] = @"PlayAndRecord_WithBluetooth";
  keys[4] = @"PlayAndRecord_NoBluetooth_DefaultToSpeaker";
  keys[5] = @"PlayAndRecord_WithBluetooth_DefaultToSpeaker";
  keys[6] = @"VoiceCommand";
  keys[7] = @"VoiceCommand_WithBluetooth";
  keys[8] = @"VoiceCommandThatMixes";
  keys[9] = @"VoiceCommandThatMixes_WithBluetooth";
  values[0] = @"Record_WithBluetooth";
  values[1] = @"Record_WithBluetooth";
  values[2] = @"PlayAndRecord_WithBluetooth";
  values[3] = @"PlayAndRecord_WithBluetooth";
  values[4] = @"PlayAndRecord_WithBluetooth_DefaultToSpeaker";
  values[5] = @"PlayAndRecord_WithBluetooth_DefaultToSpeaker";
  values[6] = @"VoiceCommand_WithBluetooth";
  values[7] = @"VoiceCommand_WithBluetooth";
  values[8] = @"VoiceCommandThatMixes_WithBluetooth";
  values[9] = @"VoiceCommandThatMixes_WithBluetooth";
  v21[0] = @"Record";
  v21[1] = @"Record";
  v21[2] = @"PlayAndRecord";
  v21[3] = @"PlayAndRecord";
  v21[4] = @"PlayAndRecord_NoBluetooth_DefaultToSpeaker";
  v21[5] = @"PlayAndRecord_NoBluetooth_DefaultToSpeaker";
  v21[6] = @"VoiceCommand";
  v21[7] = @"VoiceCommand";
  v21[8] = @"VoiceCommandThatMixes";
  v21[9] = @"VoiceCommandThatMixes";
  v20[0] = @"Record";
  v20[1] = @"Record";
  v20[2] = @"PlayAndRecord";
  v20[3] = @"PlayAndRecord";
  v20[4] = @"PlayAndRecord";
  v20[5] = @"PlayAndRecord";
  v20[6] = @"VoiceCommand";
  v20[7] = @"VoiceCommand";
  v20[8] = @"VoiceCommandThatMixes";
  v20[9] = @"VoiceCommandThatMixes";
  v19[0] = @"Record";
  v19[1] = @"Record_WithBluetooth";
  v19[2] = @"PlayAndRecord_NoBluetooth_DefaultToSpeaker";
  v19[3] = @"PlayAndRecord_WithBluetooth_DefaultToSpeaker";
  v19[4] = @"PlayAndRecord_NoBluetooth_DefaultToSpeaker";
  v19[5] = @"PlayAndRecord_WithBluetooth_DefaultToSpeaker";
  v19[6] = @"VoiceCommand";
  v19[7] = @"VoiceCommand_WithBluetooth";
  v19[8] = @"VoiceCommandThatMixes";
  v19[9] = @"VoiceCommandThatMixes_WithBluetooth";
  v18[0] = @"Record";
  v18[1] = @"Record_WithBluetooth";
  v18[2] = @"PlayAndRecord";
  v18[3] = @"PlayAndRecord_WithBluetooth";
  v18[4] = @"PlayAndRecord";
  v18[5] = @"PlayAndRecord_WithBluetooth";
  v18[6] = @"VoiceCommand";
  v18[7] = @"VoiceCommand_WithBluetooth";
  v18[8] = @"VoiceCommandThatMixes";
  v18[9] = @"VoiceCommandThatMixes_WithBluetooth";
  v17[0] = @"Record";
  v17[1] = @"Record_WithBluetooth";
  v17[2] = @"PlayAndRecord";
  v17[3] = @"PlayAndRecord_WithBluetooth";
  v17[4] = @"PlayAndRecord";
  v17[5] = @"PlayAndRecord_WithBluetooth";
  v17[6] = @"VoiceCommand";
  v17[7] = @"VoiceCommand_WithBluetooth";
  v17[8] = @"VoiceCommandThatMixes";
  v17[9] = @"VoiceCommandThatMixes_WithBluetooth";
  v16[0] = @"Audio/Video";
  v16[1] = @"Ringtone";
  v16[2] = @"Voicemail";
  v16[3] = @"VoicemailGreeting";
  v16[4] = @"PhoneCall";
  v16[5] = @"TTYCall";
  v16[6] = @"RingtonePreview";
  v16[7] = @"Alarm";
  v16[8] = @"Record";
  v16[9] = @"Record_WithBluetooth";
  v16[10] = @"PlayAndRecord";
  v16[11] = @"PlayAndRecord_WithBluetooth";
  v16[12] = @"PlayAndRecord_NoBluetooth_DefaultToSpeaker";
  v16[13] = @"PlayAndRecord_WithBluetooth_DefaultToSpeaker";
  v16[14] = @"UserInterfaceSoundEffects";
  v16[15] = @"AmbientSound";
  v16[16] = @"SoloAmbientSound";
  v16[17] = @"MediaPlayback";
  v16[18] = @"AudioProcessing";
  v16[19] = @"LiveAudio";
  v16[20] = @"Notice";
  v16[21] = @"VoiceCommand";
  v16[22] = @"VoiceCommand_WithBluetooth";
  v16[23] = @"VoiceCommandThatMixes";
  v16[24] = @"VoiceCommandThatMixes_WithBluetooth";
  v16[25] = @"VoiceOver";
  v16[26] = @"FindMyPhone";
  v16[27] = @"EmergencyAlert";
  v16[28] = @"EmergencyAlert_Muteable";
  v16[29] = @"Multi";
  v16[30] = @"MediaPlaybackNoSpeaker";
  v16[31] = @"WaterEjection";
  v16[32] = @"FindMyAudioDevice";
  v16[33] = @"SystemSoundsAndHaptics";
  v16[34] = @"eARC";
  v16[35] = @"SpeechDetect";
  v16[36] = @"HearingTest";
  v15[0] = @"NonMuteable";
  v15[1] = @"NonMuteable";
  v15[2] = @"NonMuteable";
  v15[3] = @"NonMuteable";
  v15[4] = @"NonMuteable";
  v15[5] = @"NonMuteable";
  v15[6] = @"NonMuteable";
  v15[7] = @"NonMuteable";
  v15[8] = @"NonMuteable";
  v15[9] = @"NonMuteable";
  v15[10] = @"NonMuteable";
  v15[11] = @"NonMuteable";
  v15[12] = @"NonMuteable";
  v15[13] = @"NonMuteable";
  v15[14] = @"Muteable";
  v15[15] = @"Muteable";
  v15[16] = @"Muteable";
  v15[17] = @"NonMuteable";
  v15[18] = @"NonMuteable";
  v15[19] = @"NonMuteable";
  v15[20] = @"NonMuteable";
  v15[21] = @"NonMuteable";
  v15[22] = @"NonMuteable";
  v15[23] = @"NonMuteable";
  v15[24] = @"NonMuteable";
  v15[25] = @"NonMuteable";
  v15[26] = @"NonMuteable";
  v15[27] = @"NonMuteable";
  v15[28] = @"Muteable";
  v15[29] = @"NonMuteable";
  v15[30] = @"NonMuteable";
  v15[31] = @"NonMuteable";
  v15[32] = @"NonMuteable";
  v15[33] = @"Muteable";
  v15[34] = @"Muteable";
  v15[35] = @"Muteable";
  v15[36] = @"NonMuteable";
  v14[0] = @"CannotOverride";
  v14[1] = @"CannotOverride";
  v14[2] = @"CanOverride";
  v14[3] = @"CanOverride";
  v14[4] = @"CanOverride";
  v14[5] = @"CanOverride";
  v14[6] = @"CannotOverride";
  v14[7] = @"CannotOverride";
  _OWORD v14[8] = @"CannotOverride";
  v14[9] = @"CannotOverride";
  v14[10] = @"CanOverride";
  v14[11] = @"CanOverride";
  v14[12] = @"CanOverride";
  v14[13] = @"CanOverride";
  v14[14] = @"CannotOverride";
  v14[15] = @"CannotOverride";
  v14[16] = @"CannotOverride";
  v14[17] = @"CannotOverride";
  v14[18] = @"CannotOverride";
  v14[19] = @"CannotOverride";
  v14[20] = @"CannotOverride";
  v14[21] = @"CanOverride";
  v14[22] = @"CanOverride";
  CFTypeRef v14[23] = @"CanOverride";
  v14[24] = @"CanOverride";
  v14[25] = @"CannotOverride";
  v14[26] = @"CanOverride";
  v14[27] = @"CannotOverride";
  v14[28] = @"CannotOverride";
  v14[29] = @"CanOverride";
  v14[30] = @"CannotOverride";
  v14[31] = @"CannotOverride";
  v14[32] = @"CannotOverride";
  v14[33] = @"CannotOverride";
  v14[34] = @"CannotOverride";
  v14[35] = @"CannotOverride";
  v14[36] = @"CannotOverride";
  v13[0] = @"Muteable";
  v13[1] = @"NonMuteable";
  v13[2] = @"NonMuteable";
  v13[3] = @"NonMuteable";
  v13[4] = @"NonMuteable";
  v13[5] = @"Muteable";
  v13[6] = @"NonMuteable";
  v13[7] = @"Muteable";
  v13[8] = @"Muteable";
  v13[9] = @"Muteable";
  v13[10] = @"NonMuteable";
  v13[11] = @"NonMuteable";
  v13[12] = @"NonMuteable";
  v13[13] = @"Muteable";
  v13[14] = @"Muteable";
  v13[15] = @"Muteable";
  v13[16] = @"Muteable";
  v13[17] = @"Muteable";
  v13[18] = @"Muteable";
  v13[19] = @"Muteable";
  v13[20] = @"NonMuteable";
  v12[0] = @"Default";
  v12[1] = @"VoiceChat";
  v12[2] = @"VideoChat";
  v12[3] = @"VideoRecording";
  v12[4] = @"SpeechRecognition";
  v12[5] = @"Measurement";
  v12[6] = @"Raw";
  v12[7] = @"GameChat";
  v12[8] = @"MoviePlayback";
  v12[9] = @"SpokenAudio";
  v12[10] = @"VoicePrompt";
  v12[11] = @"RemoteVoiceChat";
  v12[12] = @"VoiceMessages";
  v12[13] = @"LivePhoto";
  v12[14] = @"HearingAccessibility";
  v12[15] = @"SOSNotification";
  v12[16] = @"SpatialRecording";
  v12[17] = @"Ibis";
  v12[18] = @"VideoChatForMedia";
  v12[19] = @"MultiCam";
  v12[20] = @"Skeuomorphic";
  v12[21] = @"LowLatency";
  v12[22] = @"CustomVolume";
  v12[23] = @"SpatialCapture";
  v12[24] = @"Beacon";
  v12[25] = @"WebCam";
  v12[26] = @"WebCam_MultiMic";
  v12[27] = @"Sleep";
  v12[28] = @"SoundRecognition";
  v12[29] = @"Enrollment";
  v12[30] = @"EchoCancellationInput";
  if (MX_FeatureFlags_IsMandrakeEverywhereEnabled() && !CMSMDeviceState_SupportsBeacon()) {
    uint64_t v3 = 1768776806;
  }
  v5[0] = xmmword_194EDED80;
  v5[1] = xmmword_194EDED90;
  v5[2] = xmmword_194EDEDA0;
  v5[3] = xmmword_194EDEDB0;
  v5[4] = xmmword_194EDEDC0;
  v5[5] = xmmword_194EDEDD0;
  v5[6] = xmmword_194EDEDE0;
  v5[7] = xmmword_194EDEDF0;
  v5[8] = xmmword_194EDEE00;
  v5[9] = xmmword_194EDEE10;
  int64x2_t v6 = vdupq_n_s64(0x696D6466uLL);
  long long v7 = xmmword_194EDEE20;
  uint64_t v8 = v3;
  long long v9 = xmmword_194EDEE30;
  int64x2_t v10 = v6;
  long long v11 = xmmword_194EDEE40;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  -[MXSessionManager setFigCustomizedCategoryWithBluetooth_Dict:](self, "setFigCustomizedCategoryWithBluetooth_Dict:", CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 10, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]), xmmword_194EDED80, xmmword_194EDED90, xmmword_194EDEDA0, xmmword_194EDEDB0, xmmword_194EDEDC0, xmmword_194EDEDD0, xmmword_194EDEDE0, xmmword_194EDEDF0, xmmword_194EDEE00,
    xmmword_194EDEE10);
  if ([(MXSessionManager *)self figCustomizedCategoryWithBluetooth_Dict])
  {
    [(MXSessionManager *)self setFigCustomizedCategoryWithoutBluetooth_Dict:CFDictionaryCreate(v4, (const void **)keys, (const void **)v21, 10, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540])];
    if ([(MXSessionManager *)self figCustomizedCategoryWithoutBluetooth_Dict])
    {
      [(MXSessionManager *)self setFigUncustomizedCategory_Dict:CFDictionaryCreate(v4, (const void **)keys, (const void **)v20, 10, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540])];
      if ([(MXSessionManager *)self figUncustomizedCategory_Dict])
      {
        [(MXSessionManager *)self setFigCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict:CFDictionaryCreate(v4, (const void **)keys, (const void **)v19, 10, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540])];
        if ([(MXSessionManager *)self figCustomizedCategoryWithDefaultBuiltIn_Speaker_Dict])
        {
          [(MXSessionManager *)self setFigCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict:CFDictionaryCreate(v4, (const void **)keys, (const void **)v18, 10, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540])];
          if ([(MXSessionManager *)self figCustomizedCategoryWithDefaultBuiltIn_Receiver_Dict])
          {
            [(MXSessionManager *)self setFigCustomizedCategoryWithDefaultBuiltIn_Default_Dict:CFDictionaryCreate(v4, (const void **)keys, (const void **)v17, 10, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540])];
            if ([(MXSessionManager *)self figCustomizedCategoryWithDefaultBuiltIn_Default_Dict])
            {
              [(MXSessionManager *)self setFigCategoryToMuteabilityDict:CFDictionaryCreate(v4, (const void **)v16, (const void **)v15, 37, MEMORY[0x1E4F1D530], 0)];
              if ([(MXSessionManager *)self figCategoryToMuteabilityDict])
              {
                [(MXSessionManager *)self setFigCategoryToOutputOverridabilityDict:CFDictionaryCreate(v4, (const void **)v16, (const void **)v14, 37, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540])];
                if ([(MXSessionManager *)self figCategoryToOutputOverridabilityDict])
                {
                  [(MXSessionManager *)self setFigCategoryToVADCategoryDict:CFDictionaryCreate(v4, (const void **)v16, (const void **)"vasc", 37, MEMORY[0x1E4F1D530], 0)];
                  if ([(MXSessionManager *)self figCategoryToVADCategoryDict])
                  {
                    [(MXSessionManager *)self setFigRouteToVADOutputPortTypeDict:CFDictionaryCreate(v4, (const void **)setUpStringConversionDictionaries_figRouteNames, (const void **)"wphp", 23, MEMORY[0x1E4F1D530], 0)];
                    if ([(MXSessionManager *)self figRouteToVADOutputPortTypeDict])
                    {
                      [(MXSessionManager *)self setFigRouteToVADInputPortTypeDict:CFDictionaryCreate(v4, (const void **)setUpStringConversionDictionaries_figRouteNames, (const void **)"iwmp", 23, MEMORY[0x1E4F1D530], 0)];
                      if ([(MXSessionManager *)self figRouteToVADInputPortTypeDict])
                      {
                        [(MXSessionManager *)self setVadOutputPortTypeToFigOutputDeviceNameDict:CFDictionaryCreate(v4, (const void **)"uolp", (const void **)setUpStringConversionDictionaries_figOutputDeviceNamesForVADOutputPortTypes, 21, 0, MEMORY[0x1E4F1D540])];
                        if ([(MXSessionManager *)self vadOutputPortTypeToFigOutputDeviceNameDict])
                        {
                          [(MXSessionManager *)self setVadOutputPortTypeToMuteabilityDict:CFDictionaryCreate(v4, (const void **)"uolp", (const void **)v13, 21, 0, MEMORY[0x1E4F1D540])];
                          if ([(MXSessionManager *)self vadOutputPortTypeToMuteabilityDict])
                          {
                            [(MXSessionManager *)self setVadInputPortTypeToFigInputDeviceNameDict:CFDictionaryCreate(v4, (const void **)"nilp", (const void **)setUpStringConversionDictionaries_figInputDeviceNamesForVADInputPortTypes, 8, 0, MEMORY[0x1E4F1D540])];
                            if ([(MXSessionManager *)self vadInputPortTypeToFigInputDeviceNameDict])
                            {
                              [(MXSessionManager *)self setFigModeTypeToVADModeType:CFDictionaryCreate(v4, (const void **)v12, (const void **)v5, 31, MEMORY[0x1E4F1D530], 0)];
                              [(MXSessionManager *)self figModeTypeToVADModeType];
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)setDefaultVADID:(unsigned int)a3
{
}

- (BOOL)getQuiesceableWiredPortAutoRouteOnConnectPreference:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!MX_FeatureFlags_IsQuiesceableWiredConnectionEnabled()) {
    return 0;
  }
  if (!v3)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  uint64_t v5 = (void *)vaeCopyPersistentUID(v3);
  int64x2_t v6 = (void *)[(NSMutableDictionary *)[(MXSessionManager *)self quiesceableWiredPortsAutoRouteOnConnectPreference] objectForKey:v5];
  if (v6)
  {
    char v7 = [v6 BOOLValue];
    if (dword_1E9359ED0)
    {
      uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    if (dword_1E9359ED0)
    {
      int64x2_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    char v7 = 1;
    -[MXSessionManager setQuiesceableWiredPortPreference:autoRouteOnConnect:](self, "setQuiesceableWiredPortPreference:autoRouteOnConnect:", v3, 1, v12, v13);
  }

  return v7;
}

- (void)setQuiesceableWiredPortPreference:(unsigned int)a3 autoRouteOnConnect:(BOOL)a4
{
  BOOL v4 = a4;
  if (MX_FeatureFlags_IsQuiesceableWiredConnectionEnabled())
  {
    if (a3)
    {
      char v7 = (void *)vaeCopyPersistentUID(a3);
      uint64_t v8 = [(MXSessionManager *)self quiesceableWiredPortsAutoRouteOnConnectPreference];
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [MEMORY[0x1E4F28ED0] numberWithBool:v4], v7);
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }

      MXCFPreferencesSetAndSynchronizeUserPreference(@"quiesceableWiredPortsAutoRouteOnConnectPreference", [(MXSessionManager *)self quiesceableWiredPortsAutoRouteOnConnectPreference]);
    }
    else
    {
      int64x2_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (int)updateSecureSpeakerMuteState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  AudioObjectID VADPortIDFromVADPortType = vaemGetVADPortIDFromVADPortType(1886613611);
  inAddress.mElement = 0;
  BOOL v11 = v3;
  *(void *)&inAddress.mSelector = *(void *)"msspbolg";
  if (!VADPortIDFromVADPortType)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
LABEL_7:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return -12985;
  }
  if (!AudioObjectHasProperty(VADPortIDFromVADPortType, &inAddress))
  {
    uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    goto LABEL_7;
  }
  int v5 = CMSMVAUtility_AudioObjectSetPropertyData();
  if (v5)
  {
    int64x2_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v5;
}

- (BOOL)isVADIDRoutedToOutputPortType:(unsigned int)a3 portType:(unsigned int)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = [+[MXAdditiveRoutingManager sharedInstance] copyDetailedRouteDescription:*(void *)&a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int64x2_t v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", @"RouteDetailedDescription_Outputs", 0), "allObjects");
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (vaeGetPortTypeFromPortID(objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "objectForKey:", @"RouteDetailedDescription_ID"), "unsignedIntValue")) == a4)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (id)copyInterruptedSessions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [+[MXSessionManager sharedInstance] mxCoreSessionListBeginIteration];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [+[MXSessionManager sharedInstance] mxCoreSessionList];
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        int64x2_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 waitingToResume] && (id)objc_msgSend(v10, "interruptingSession") == a3) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  [+[MXSessionManager sharedInstance] mxCoreSessionListEndIteration];
  return v4;
}

- (id)copyHighestPriorityActiveSession:(id)a3 deviceIdentifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    int v25 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [+[MXSessionManager sharedInstance] mxCoreSessionListBeginIteration];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [+[MXSessionManager sharedInstance] mxCoreSessionList];
  uint64_t v8 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v21;
    unsigned int v12 = 100;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unsigned int LocalSessionPriority = CMSM_GetLocalSessionPriority(v14, 1);
        if ([v14 isActive]) {
          BOOL v16 = LocalSessionPriority > v12;
        }
        else {
          BOOL v16 = 0;
        }
        if (v16 && CMSUtility_IsSessionPlayStateEligibleForTipi(v14))
        {
          if (a4)
          {
            if (CMSUtility_DoPickedEndpointsForSessionContainDeviceIdentifier(v14, (uint64_t)a4)) {
              goto LABEL_20;
            }
          }
          else if (a3 {
                 && [(id)CMSUtility_GetCurrentAudioDestination(v14) isEqualToString:a3])
          }
          {
LABEL_20:

            id v10 = v14;
            unsigned int v12 = LocalSessionPriority;
            continue;
          }
        }
      }
      uint64_t v9 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (!v9) {
        goto LABEL_25;
      }
    }
  }
  id v10 = 0;
LABEL_25:
  [+[MXSessionManager sharedInstance] mxCoreSessionListEndIteration];
  return v10;
}

- (BOOL)shouldResetWaitingToResume:(id)a3 currentSession:(id)a4
{
  return [a3 handsOverInterruptionsToInterruptor]
      && ([a4 handsOverInterruptionsToInterruptor] & 1) == 0
      && ![a4 isTheAssistant];
}

- (void)resetWaitingToResume:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [+[MXSessionManager sharedInstance] mxCoreSessionListBeginIteration];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [+[MXSessionManager sharedInstance] mxCoreSessionList];
  uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((id)[v9 interruptingSession] == a3 && objc_msgSend(v9, "waitingToResume")) {
          [v9 setWaitingToResume:0];
        }
      }
      uint64_t v6 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  [+[MXSessionManager sharedInstance] mxCoreSessionListEndIteration];
}

- (id)copySessionWithPID:(int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v10, "clientPID"), "intValue") == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  long long v10 = 0;
LABEL_11:
  [(MXSessionManager *)self mxCoreSessionListEndIteration];
  return v10;
}

- (id)copySessionToBeMuted:(id *)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v6 = *(_OWORD *)&a3->var0[4];
  long long v86 = *(_OWORD *)a3->var0;
  long long v87 = v6;
  if (![(MXSessionManager *)self isAuditTokenValid:&v86])
  {
    unsigned int v79 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
LABEL_28:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    id v14 = 0;
    goto LABEL_29;
  }
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v7 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v8 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v74 objects:v83 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v75 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v74 + 1) + 8 * i);
        if (v12) {
          [*(id *)(*((void *)&v74 + 1) + 8 * i) auditToken];
        }
        else {
          memset(v73, 0, sizeof(v73));
        }
        long long v13 = *(_OWORD *)&a3->var0[4];
        long long v86 = *(_OWORD *)a3->var0;
        long long v87 = v13;
        if ([(MXSessionManager *)self isAuditTokenEqual:v73 compareTo:&v86]) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v74 objects:v83 count:16];
    }
    while (v9);
  }
  [(MXSessionManager *)self mxCoreSessionListEndIteration];
  if (![v5 count])
  {
    unsigned int v79 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v20 = v79;
    if (os_log_type_enabled(v19, type)) {
      unsigned int v21 = v20;
    }
    else {
      unsigned int v21 = v20 & 0xFFFFFFFE;
    }
    if (v21)
    {
      int v84 = 136315138;
      v85 = "-[MXSessionManager(Utilities) copySessionToBeMuted:]";
      _os_log_send_and_compose_impl();
    }
    goto LABEL_28;
  }
  if ([v5 count] == 1)
  {
    id v14 = (id)[v5 firstObject];
    if (dword_1E9359ED0)
    {
      unsigned int v79 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      long long v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v16 = v79;
      if (os_log_type_enabled(v15, type)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (!v17) {
        goto LABEL_97;
      }
      int v84 = 136315138;
      v85 = "-[MXSessionManager(Utilities) copySessionToBeMuted:]";
LABEL_96:
      _os_log_send_and_compose_impl();
LABEL_97:
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    if (dword_1E9359ED0)
    {
      unsigned int v79 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      long long v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v24 = v79;
      if (os_log_type_enabled(v23, type)) {
        unsigned int v25 = v24;
      }
      else {
        unsigned int v25 = v24 & 0xFFFFFFFE;
      }
      if (v25)
      {
        int v84 = 136315138;
        v85 = "-[MXSessionManager(Utilities) copySessionToBeMuted:]";
        LODWORD(v57) = 12;
        unsigned int v53 = &v84;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    uint64_t v26 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v69, v82, 16, v53, v57);
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v70;
LABEL_39:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v70 != v28) {
          objc_enumerationMutation(v5);
        }
        long long v30 = *(void **)(*((void *)&v69 + 1) + 8 * v29);
        if ([v30 isActive])
        {
          if ([v30 isRecording] && objc_msgSend(v30, "hasPhoneCallBehavior")) {
            break;
          }
        }
        if (v27 == ++v29)
        {
          uint64_t v27 = [v5 countByEnumeratingWithState:&v69 objects:v82 count:16];
          if (v27) {
            goto LABEL_39;
          }
          goto LABEL_56;
        }
      }
      id v14 = v30;
      if (dword_1E9359ED0)
      {
        unsigned int v79 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        long long v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v32 = v79;
        if (os_log_type_enabled(v31, type)) {
          unsigned int v33 = v32;
        }
        else {
          unsigned int v33 = v32 & 0xFFFFFFFE;
        }
        if (v33)
        {
          int v84 = 136315138;
          v85 = "-[MXSessionManager(Utilities) copySessionToBeMuted:]";
          LODWORD(v58) = 12;
          int v54 = &v84;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (v14) {
        goto LABEL_29;
      }
    }
LABEL_56:
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v34 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v65, v81, 16, v54, v58);
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v66;
LABEL_58:
      uint64_t v37 = 0;
      while (1)
      {
        if (*(void *)v66 != v36) {
          objc_enumerationMutation(v5);
        }
        int v38 = *(void **)(*((void *)&v65 + 1) + 8 * v37);
        if ([v38 hasPhoneCallBehavior]) {
          break;
        }
        if (v35 == ++v37)
        {
          uint64_t v35 = [v5 countByEnumeratingWithState:&v65 objects:v81 count:16];
          if (v35) {
            goto LABEL_58;
          }
          goto LABEL_73;
        }
      }
      id v14 = v38;
      if (dword_1E9359ED0)
      {
        unsigned int v79 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        uint64_t v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v40 = v79;
        if (os_log_type_enabled(v39, type)) {
          unsigned int v41 = v40;
        }
        else {
          unsigned int v41 = v40 & 0xFFFFFFFE;
        }
        if (v41)
        {
          int v84 = 136315138;
          v85 = "-[MXSessionManager(Utilities) copySessionToBeMuted:]";
          LODWORD(v59) = 12;
          v55 = &v84;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (v14) {
        goto LABEL_29;
      }
    }
LABEL_73:
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v42 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v61, v80, 16, v55, v59);
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v62;
LABEL_75:
      uint64_t v45 = 0;
      while (1)
      {
        if (*(void *)v62 != v44) {
          objc_enumerationMutation(v5);
        }
        uint64_t v46 = *(void **)(*((void *)&v61 + 1) + 8 * v45);
        if ([v46 hostProcessAttribution]) {
          break;
        }
        if (v43 == ++v45)
        {
          uint64_t v43 = [v5 countByEnumeratingWithState:&v61 objects:v80 count:16];
          if (v43) {
            goto LABEL_75;
          }
          goto LABEL_90;
        }
      }
      id v14 = v46;
      if (dword_1E9359ED0)
      {
        unsigned int v79 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        int v47 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v48 = v79;
        if (os_log_type_enabled(v47, type)) {
          unsigned int v49 = v48;
        }
        else {
          unsigned int v49 = v48 & 0xFFFFFFFE;
        }
        if (v49)
        {
          int v84 = 136315138;
          v85 = "-[MXSessionManager(Utilities) copySessionToBeMuted:]";
          LODWORD(v60) = 12;
          uint64_t v56 = &v84;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (v14) {
        goto LABEL_29;
      }
    }
LABEL_90:
    id v14 = (id)objc_msgSend(v5, "firstObject", v56, v60);
    if (dword_1E9359ED0)
    {
      unsigned int v79 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v51 = v79;
      if (os_log_type_enabled(v50, type)) {
        unsigned int v52 = v51;
      }
      else {
        unsigned int v52 = v51 & 0xFFFFFFFE;
      }
      if (!v52) {
        goto LABEL_97;
      }
      int v84 = 136315138;
      v85 = "-[MXSessionManager(Utilities) copySessionToBeMuted:]";
      goto LABEL_96;
    }
  }
LABEL_29:

  return v14;
}

- (BOOL)isAuditTokenValid:(id *)a3
{
  if (a3->var0[0] != -1) {
    return 1;
  }
  unint64_t v4 = 0;
  do
  {
    unint64_t v5 = v4;
    if (v4 == 7) {
      break;
    }
    unsigned int v6 = a3->var0[++v4];
  }
  while (v6 == -1);
  return v5 < 7;
}

- (BOOL)isAuditTokenEqual:(id *)a3 compareTo:(id *)a4
{
  long long v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v16.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v16.val[4] = v6;
  pid_t v7 = audit_token_to_pid(&v16);
  long long v8 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)v16.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&v16.val[4] = v8;
  pid_t v9 = audit_token_to_pid(&v16);
  long long v10 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v16.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v16.val[4] = v10;
  int v11 = audit_token_to_pidversion(&v16);
  long long v12 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)v16.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&v16.val[4] = v12;
  int v13 = audit_token_to_pidversion(&v16);
  return v7 == v9 && v11 == v13;
}

- (void)updateMutedBundleIDs:(id)a3 muteValue:(BOOL)a4
{
  BOOL v4 = a4;
  pid_t v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:", -[MXSessionManager mutedSessionBundleIDs](self, "mutedSessionBundleIDs"));
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled()) {
    goto LABEL_11;
  }
  int v8 = [a3 isEqualToString:@"com.apple.mobilephone"];
  int v9 = (v8 & 1) != 0 ? 0 : [a3 isEqualToString:@"com.apple.facetime"];
  int v10 = v8 | v9;
  if (v4)
  {
    [v7 addObject:a3];
    if (v10)
    {
      [v7 addObject:@"com.apple.mobilephone"];
      [v7 addObject:@"com.apple.facetime"];
    }
  }
  else
  {
    [v7 removeObject:a3];
    if (v10)
    {
      [v7 removeObject:@"com.apple.mobilephone"];
      [v7 removeObject:@"com.apple.facetime"];
    }
  }
  [(MXSessionManager *)self setMutedSessionBundleIDs:v7];
  MXCFPreferencesSetAndSynchronizeUserPreference(@"mutedSessionBundleIDs", [(NSSet *)[(MXSessionManager *)self mutedSessionBundleIDs] allObjects]);
  if (dword_1E9359ED0)
  {
LABEL_11:
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (int)clearUplinkMutedCache
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return -15685;
  }
  if (CMSMUtility_PhoneCallOrRingtoneExists()) {
    return -15685;
  }
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:", -[MXSessionManager mutedSessionBundleIDs](self, "mutedSessionBundleIDs"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v5 = [(MXSessionManager *)self mutedSessionBundleIDs];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 hasPrefix:@"com.apple"]) {
          [v4 removeObject:v10];
        }
      }
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v7);
  }
  [(MXSessionManager *)self setMutedSessionBundleIDs:v4];
  MXCFPreferencesSetAndSynchronizeUserPreference(@"mutedSessionBundleIDs", [(NSSet *)[(MXSessionManager *)self mutedSessionBundleIDs] allObjects]);
  if (dword_1E9359ED0)
  {
    unsigned int v21 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v12 = v21;
    if (os_log_type_enabled(v11, type)) {
      unsigned int v13 = v12;
    }
    else {
      unsigned int v13 = v12 & 0xFFFFFFFE;
    }
    if (v13)
    {
      id v14 = [(MXSessionManager *)self mutedSessionBundleIDs];
      int v22 = 136315395;
      long long v23 = "-[MXSessionManager(Utilities) clearUplinkMutedCache]";
      __int16 v24 = 2113;
      unsigned int v25 = v14;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return 0;
}

- (int)updateMuteState:(id *)a3 muteValue:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v58 = 0;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x2020000000;
  int v61 = 3;
  long long v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&atoken.val[4] = v7;
  unsigned int v51 = audit_token_to_pid(&atoken);
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    int v57 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    id v12 = 0;
    unsigned int v13 = 0;
    int refreshed = -15685;
    goto LABEL_8;
  }
  if (a4)
  {
    long long v9 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&atoken.val[4] = v9;
    if ([(MXSessionManager *)self isAuditTokenValid:&atoken])
    {
      long long v10 = *(_OWORD *)&a3->var0[4];
      *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
      *(_OWORD *)&atoken.val[4] = v10;
      if ([(MXSessionManager *)self isAuditTokenValid:&atoken])
      {
        if (dword_1E9359ED0)
        {
          int v57 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          int v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        long long v25 = *(_OWORD *)&a3->var0[4];
        *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
        *(_OWORD *)&atoken.val[4] = v25;
        id v12 = -[MXSessionManager copySessionToBeMuted:](self, "copySessionToBeMuted:", &atoken, v45, v48);
        if (v12)
        {
LABEL_27:
          int v17 = 0;
LABEL_35:
          int refreshed = 0;
          goto LABEL_36;
        }
        if (dword_1E9359ED0)
        {
          int v57 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        unsigned int v13 = (void *)MX_RunningBoardServices_CopyDisplayIDForPID(v51);
        if (v13)
        {
          -[MXSessionManager updateMutedBundleIDs:muteValue:](self, "updateMutedBundleIDs:muteValue:", v13, [a4 BOOLValue]);
          if (dword_1E9359ED0)
          {
            int v57 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            uint64_t v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          id v12 = 0;
          int refreshed = 0;
          goto LABEL_8;
        }
      }
      int v17 = 0;
      id v12 = 0;
      goto LABEL_35;
    }
    if (dword_1E9359ED0)
    {
      int v57 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      long long v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[MXSessionManager setUplinkMuteSetByClient:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v45, v48), "setUplinkMuteSetByClient:", [a4 BOOLValue]);
    id v12 = [+[MXSessionManager sharedInstance] copyPhoneCallBehaviorRecordingSession];
    if (v12) {
      goto LABEL_27;
    }
    int v57 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unsigned int v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if ([a4 BOOLValue]) {
      uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    }
    else {
      uint64_t v23 = 0;
    }
    -[MXSessionManager setApplyUplinkMuteToPhoneCallBehaviorSession:](self, "setApplyUplinkMuteToPhoneCallBehaviorSession:", v23, v45, v48);
    if (([a4 BOOLValue] & 1) == 0)
    {
      if (dword_1E9359ED0)
      {
        int v57 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        __int16 v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      [(MXSessionManager *)self removeEntryFromMutedBundleIDCache:0 bundleID:[(MXSessionManager *)self uplinkMutedBundleID]];
      [(MXSessionManager *)self setUplinkMutedBundleID:0];
    }
    CMSMNotificationUtility_PostUplinkMuteDidChange([a4 BOOLValue]);
    int v17 = 0;
    id v12 = 0;
    int refreshed = -15685;
  }
  else
  {
    long long v16 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&atoken.val[4] = v16;
    if ([(MXSessionManager *)self isAuditTokenValid:&atoken])
    {
      int v17 = 0;
      id v12 = 0;
      int refreshed = 0;
      a4 = 0;
    }
    else
    {
      if (dword_1E9359ED0)
      {
        int v57 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        long long v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      id v12 = [+[MXSessionManager sharedInstance] copyPhoneCallBehaviorRecordingSession];
      int v21 = [v12 prefersBluetoothAccessoryMuting];
      if (v21)
      {
        int refreshed = 0;
      }
      else
      {
        int v57 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        int v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        int refreshed = -15685;
      }
      int v27 = objc_msgSend(v12, "isRecordingMuted", v46, v49);
      a4 = (id)[MEMORY[0x1E4F28ED0] numberWithBool:v27 ^ 1u];
      int v17 = v21 ^ 1;
    }
  }
LABEL_36:
  unsigned int v13 = CMSUtility_CopyBundleID(v12);
  if (!v13)
  {
    if (dword_1E9359ED0)
    {
      int v57 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    unsigned int v13 = (void *)MX_RunningBoardServices_CopyDisplayIDForPID(v51);
    if (!v13)
    {
      int v57 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      long long v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      unsigned int v13 = 0;
      int refreshed = -15685;
    }
  }
  int v31 = objc_msgSend(a4, "BOOLValue", v45, v48);
  if (((v31 ^ [(NSSet *)[(MXSessionManager *)self mutedSessionBundleIDs] containsObject:v13] | v17) & 1) == 0)
  {
    if (dword_1E9359ED0)
    {
      int v57 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      unsigned int v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_8;
  }
  if (![v12 hasPhoneCallBehavior])
  {
    if (!v17) {
      goto LABEL_51;
    }
LABEL_48:
    if (dword_1E9359ED0)
    {
      int v57 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      unsigned int v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    int v17 = 1;
    goto LABEL_51;
  }
  if (([v12 isRecording] | v17)) {
    goto LABEL_48;
  }
  int v17 = 0;
LABEL_51:
  if (v12)
  {
    [v12 auditToken];
    long long v34 = *(_OWORD *)&atoken.val[4];
    *(_OWORD *)a3->var0 = *(_OWORD *)atoken.val;
    *(_OWORD *)&a3->var0[4] = v34;
  }
  if (refreshed)
  {
    if (!v17) {
      goto LABEL_8;
    }
    goto LABEL_55;
  }
  -[MXSessionManager updateMutedBundleIDs:muteValue:](self, "updateMutedBundleIDs:muteValue:", v13, [a4 BOOLValue]);
  if ([a4 BOOLValue]) {
    uint64_t v37 = v13;
  }
  else {
    uint64_t v37 = 0;
  }
  -[MXSessionManager setUplinkMutedBundleID:](self, "setUplinkMutedBundleID:", v37, v47, v50);
  if ([a4 BOOLValue]) {
    int v38 = 1;
  }
  else {
    int v38 = 2;
  }
  *((_DWORD *)v59 + 6) = v38;
  int refreshed = CMSMUtility_AudioToolboxServerRefreshMuteState();
  if (refreshed)
  {
    int v57 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    *((_DWORD *)v59 + 6) = 3;
    if (!v17) {
      goto LABEL_8;
    }
    goto LABEL_55;
  }
  if (dword_1E9359ED0)
  {
    int v57 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unsigned int v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[MXSessionManager setUplinkMuteSetByClient:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", v47, v50), "setUplinkMuteSetByClient:", [a4 BOOLValue]);
  CMSMNotificationUtility_PostUplinkMuteDidChange([a4 BOOLValue]);
  int refreshed = 0;
  if (v17)
  {
LABEL_55:
    id v35 = objc_alloc_init((Class)getAAAudioSessionControlClass());
    if (updateMuteState_muteValue__onceToken != -1) {
      dispatch_once(&updateMuteState_muteValue__onceToken, &__block_literal_global_73);
    }
    objc_msgSend(v35, "setDispatchQueue:", updateMuteState_muteValue__sBluetoothMuteActionQueue, v47, v50);
    if (dword_1E9359ED0)
    {
      int v57 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    UpTimeNanoseconds = (void *)FigGetUpTimeNanoseconds();
    objc_initWeak((id *)&atoken, v35);
    id v42 = v13;
    uint64_t v43 = updateMuteState_muteValue__sBluetoothMuteActionQueue;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __57__MXSessionManager_Utilities__updateMuteState_muteValue___block_invoke_22;
    v52[3] = &unk_1E57CB378;
    objc_copyWeak(v53, (id *)&atoken);
    long long v44 = *(_OWORD *)&a3->var0[4];
    long long v54 = *(_OWORD *)a3->var0;
    long long v55 = v44;
    v52[4] = v13;
    v52[5] = &v58;
    v53[1] = UpTimeNanoseconds;
    MXDispatchAsync((uint64_t)"-[MXSessionManager(Utilities) updateMuteState:muteValue:]", (uint64_t)"MXSessionManagerUtilities.m", 846, 0, 0, v43, (uint64_t)v52);
    objc_destroyWeak(v53);
    objc_destroyWeak((id *)&atoken);
  }
LABEL_8:

  _Block_object_dispose(&v58, 8);
  return refreshed;
}

dispatch_queue_t __57__MXSessionManager_Utilities__updateMuteState_muteValue___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("com.apple.mediaexperience.BluetoothMuteActionQueue", v0);
  updateMuteState_muteValue__sBluetoothMuteActionQueue = (uint64_t)result;
  return result;
}

uint64_t __57__MXSessionManager_Utilities__updateMuteState_muteValue___block_invoke_22(uint64_t a1)
{
  Weauint64_t k = objc_loadWeak((id *)(a1 + 48));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__MXSessionManager_Utilities__updateMuteState_muteValue___block_invoke_2;
  v5[3] = &unk_1E57CB350;
  v5[4] = Weak;
  long long v3 = *(_OWORD *)(a1 + 80);
  long long v8 = *(_OWORD *)(a1 + 64);
  long long v9 = v3;
  long long v6 = *(_OWORD *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  return [Weak activateWithCompletion:v5];
}

void __57__MXSessionManager_Utilities__updateMuteState_muteValue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    long long v6 = *(void **)(a1 + 32);
    long long v7 = *(_OWORD *)(a1 + 80);
    v9[0] = *(_OWORD *)(a1 + 64);
    v9[1] = v7;
    [v6 setMuteAction:v5 auditToken:v9 bundleIdentifier:v4];
  }

  if (dword_1E9359ED0)
  {
    long long v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (int)getMuteState:(id *)a3 outMuteValue:(BOOL *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&atoken.val[4] = v7;
  uint64_t v8 = audit_token_to_pid(&atoken);
  *a4 = 0;
  if (MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return -15685;
  }
  long long v10 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&atoken.val[4] = v10;
  if (![(MXSessionManager *)self isAuditTokenValid:&atoken]) {
    return -15685;
  }
  id v11 = [(MXSessionManager *)self copySessionWithPID:v8];
  id v12 = CMSUtility_CopyBundleID(v11);
  if (v12 || (id v12 = (void *)MX_RunningBoardServices_CopyDisplayIDForPID(v8)) != 0)
  {
    BOOL v13 = [(NSSet *)[(MXSessionManager *)self mutedSessionBundleIDs] containsObject:v12];
    int v14 = 0;
    *a4 = v13;
  }
  else
  {
    int v14 = -15685;
  }

  return v14;
}

- (id)copyPhoneCallBehaviorRecordingSession
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v3 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v4 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 isActive]
          && [v8 isRecording]
          && [v8 hasPhoneCallBehavior])
        {
          id v9 = v8;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_13:
  [(MXSessionManager *)self mxCoreSessionListEndIteration];
  return v8;
}

- (void)removeEntryFromMutedBundleIDCache:(int)a3 bundleID:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  if (!MX_FeatureFlags_IsSessionBasedMutingEnabled())
  {
    if (!MX_FeatureFlags_IsCallManagementMuteControlEnabled()) {
      return;
    }
    if (v5 || a4)
    {
      if (v5)
      {
        id v8 = [(MXSessionManager *)self copySessionWithPID:v5];
        id v9 = (__CFString *)CMSUtility_CopyBundleID(v8);
        if (v9)
        {
          long long v10 = v9;
          goto LABEL_13;
        }
        long long v10 = (__CFString *)MX_RunningBoardServices_CopyDisplayIDForPID(v5);
        if (v10)
        {
LABEL_13:
          if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:", -[MXSessionManager mutedSessionBundleIDs](self, "mutedSessionBundleIDs")), "containsObject:", v10))
          {
            [(MXSessionManager *)self updateMutedBundleIDs:v10 muteValue:0];
            if (dword_1E9359ED0)
            {
              os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
        }
      }
      else
      {
        long long v10 = (__CFString *)a4;
        id v8 = 0;
        if (v10) {
          goto LABEL_13;
        }
      }

      return;
    }
  }
  long long v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
}

- (id)copyActiveSessionWithAudioCategory:(id)a3 andAudioMode:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    id v6 = [(MXSessionManager *)self copyMXCoreSessionList];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      if (a3) {
        BOOL v10 = a4 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      int v11 = !v10;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v13 isActive])
          {
            if (v11)
            {
              if (([v13 hasAudioMode:a4] & 1) != 0
                && [v13 hasAudioCategory:a3])
              {
                goto LABEL_26;
              }
            }
            else if (a3)
            {
              if ([v13 hasAudioCategory:a3]) {
                goto LABEL_26;
              }
            }
            else if (a4 && ([v13 hasAudioMode:a4] & 1) != 0)
            {
LABEL_26:
              if (dword_1E9359ED0)
              {
                unsigned int v28 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v17 = v28;
                if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
                  unsigned int v18 = v17;
                }
                else {
                  unsigned int v18 = v17 & 0xFFFFFFFE;
                }
                if (v18)
                {
                  uint64_t v19 = [v13 clientName];
                  uint64_t v20 = [v13 audioCategory];
                  uint64_t v21 = [v13 audioMode];
                  int v29 = 136315906;
                  long long v30 = "-[MXSessionManager(Utilities) copyActiveSessionWithAudioCategory:andAudioMode:]";
                  __int16 v31 = 2114;
                  uint64_t v32 = v19;
                  __int16 v33 = 2114;
                  uint64_t v34 = v20;
                  __int16 v35 = 2114;
                  uint64_t v36 = v21;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              id v14 = v13;
              goto LABEL_34;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v37 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    id v14 = 0;
LABEL_34:
  }
  else
  {
    long long v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  return v14;
}

- (id)copySessionsWithAuditToken:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(MXSessionManager *)self copyMXCoreSessionList];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        if (v11) {
          [*(id *)(*((void *)&v16 + 1) + 8 * v10) auditToken];
        }
        else {
          memset(v15, 0, sizeof(v15));
        }
        long long v12 = *(_OWORD *)&a3->var0[4];
        v14[0] = *(_OWORD *)a3->var0;
        v14[1] = v12;
        if ([(MXSessionManager *)self isAuditTokenEqual:v15 compareTo:v14]) {
          [v5 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)updateBluetoothFrameworkToPlayMuteChime:(id)a3 playRejectTone:(BOOL)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (([a3 isRecording] & 1) != 0 || a4)
  {
    id v7 = objc_alloc_init((Class)getAAAudioSessionControlClass());
    uint64_t v23 = 0;
    long long v24 = &v23;
    uint64_t v25 = 0x3052000000;
    long long v26 = __Block_byref_object_copy__15;
    int v27 = __Block_byref_object_dispose__15;
    id v28 = 0;
    id v28 = CMSUtility_CopyBundleID(a3);
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x4010000000;
    v29[3] = &unk_194F1B831;
    long long v30 = 0u;
    long long v31 = 0u;
    if (a3) {
      [a3 auditToken];
    }
    if (updateBluetoothFrameworkToPlayMuteChime_playRejectTone__onceToken != -1) {
      dispatch_once(&updateBluetoothFrameworkToPlayMuteChime_playRejectTone__onceToken, &__block_literal_global_26_0);
    }
    if (!v24[5])
    {
      CFStringRef v8 = MX_RunningBoardServices_CopyDisplayIDForPID(objc_msgSend((id)objc_msgSend(a3, "clientPID"), "unsignedIntValue"));
      v24[5] = (uint64_t)v8;
      if (!v8)
      {
        LODWORD(location) = 0;
        v21[0] = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    objc_msgSend(v7, "setDispatchQueue:", updateBluetoothFrameworkToPlayMuteChime_playRejectTone__sBluetoothMuteActionQueue, v15, v16);
    objc_initWeak(&location, v7);
    if (a4)
    {
      int v10 = 3;
    }
    else if ([a3 isRecordingMuted])
    {
      int v10 = 1;
    }
    else if ([a3 isRecordingMuted])
    {
      int v10 = 3;
    }
    else
    {
      int v10 = 2;
    }
    if (dword_1E9359ED0)
    {
      *(_DWORD *)uint64_t v21 = 0;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      long long v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    UpTimeNanoseconds = (void *)FigGetUpTimeNanoseconds();
    id v14 = updateBluetoothFrameworkToPlayMuteChime_playRejectTone__sBluetoothMuteActionQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __86__MXSessionManager_Utilities__updateBluetoothFrameworkToPlayMuteChime_playRejectTone___block_invoke_40;
    v17[3] = &unk_1E57CB3C8;
    objc_copyWeak(v18, &location);
    int v19 = v10;
    v17[4] = v29;
    v17[5] = &v23;
    v18[1] = UpTimeNanoseconds;
    MXDispatchAsync((uint64_t)"-[MXSessionManager(Utilities) updateBluetoothFrameworkToPlayMuteChime:playRejectTone:]", (uint64_t)"MXSessionManagerUtilities.m", 1112, 0, 0, v14, (uint64_t)v17);
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
    _Block_object_dispose(v29, 8);
    _Block_object_dispose(&v23, 8);
  }
  else if (dword_1E9359ED0)
  {
    id v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

dispatch_queue_t __86__MXSessionManager_Utilities__updateBluetoothFrameworkToPlayMuteChime_playRejectTone___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("com.apple.mediaexperience.MuteActionQueue", v0);
  updateBluetoothFrameworkToPlayMuteChime_playRejectTone__sBluetoothMuteActionQueue = (uint64_t)result;
  return result;
}

uint64_t __86__MXSessionManager_Utilities__updateBluetoothFrameworkToPlayMuteChime_playRejectTone___block_invoke_40(uint64_t a1)
{
  Weauint64_t k = objc_loadWeak((id *)(a1 + 48));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__MXSessionManager_Utilities__updateBluetoothFrameworkToPlayMuteChime_playRejectTone___block_invoke_2;
  v4[3] = &unk_1E57CB3A0;
  v4[4] = Weak;
  int v7 = *(_DWORD *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  return [Weak activateWithCompletion:v4];
}

void __86__MXSessionManager_Utilities__updateBluetoothFrameworkToPlayMuteChime_playRejectTone___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    unsigned int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    uint64_t v4 = *(unsigned int *)(a1 + 64);
    long long v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    long long v8 = *(_OWORD *)(v6 + 48);
    v20[0] = *(_OWORD *)(v6 + 32);
    v20[1] = v8;
    [v5 setMuteAction:v4 auditToken:v20 bundleIdentifier:v7];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__MXSessionManager_Utilities__updateBluetoothFrameworkToPlayMuteChime_playRejectTone___block_invoke_2_41;
  v13[3] = &unk_1E57C6368;
  v13[4] = *(void *)(a1 + 32);
  MXDispatchAsync((uint64_t)"-[MXSessionManager(Utilities) updateBluetoothFrameworkToPlayMuteChime:playRejectTone:]_block_invoke", (uint64_t)"MXSessionManagerUtilities.m", 1126, 0, 0, updateBluetoothFrameworkToPlayMuteChime_playRejectTone__sBluetoothMuteActionQueue, (uint64_t)v13);

  if (dword_1E9359ED0)
  {
    unsigned int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v10 = v15;
    if (os_log_type_enabled(v9, type)) {
      unsigned int v11 = v10;
    }
    else {
      unsigned int v11 = v10 & 0xFFFFFFFE;
    }
    if (v11)
    {
      double v12 = (float)((float)(FigGetUpTimeNanoseconds() - *(void *)(a1 + 56)) / 1000000.0);
      int v16 = 136315394;
      long long v17 = "-[MXSessionManager(Utilities) updateBluetoothFrameworkToPlayMuteChime:playRejectTone:]_block_invoke";
      __int16 v18 = 2048;
      double v19 = v12;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

void __86__MXSessionManager_Utilities__updateBluetoothFrameworkToPlayMuteChime_playRejectTone___block_invoke_2_41(uint64_t a1)
{
}

- (BOOL)clientTypeOverridesHardwareSwitch:(unsigned int)a3
{
  return (a3 > 8) | (0xEDu >> a3) & 1;
}

- (id)getSilentModeClientTypeAsString:(unsigned int)a3
{
  if (a3 >= 0xA) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%d)", *(void *)&a3);
  }
  else {
    return off_1E57CB448[a3];
  }
}

- (id)getClientPriorityAsString:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      return @"Default";
    case 0x14u:
      return @"EmergencyAlert";
    case 0xAu:
      return @"PhoneCall";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%d)", *(void *)&a3);
}

- (BOOL)isAnyOtherUnduckedPlayingSessionMatchingVolumeRampCategory:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CFStringRef LastVolumeRampCategory = (const __CFString *)vaemVolumeStateGetLastVolumeRampCategory();
  int CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a3);
  [+[MXSessionManager sharedInstance] mxCoreSessionListBeginIteration];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [+[MXSessionManager sharedInstance] mxCoreSessionList];
  uint64_t v7 = [(NSPointerArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if (v11 != a3
          && [*(id *)(*((void *)&v14 + 1) + 8 * i) isPlaying]
          && ([v11 isDucked] & 1) == 0
          && CurrentOutputVADID == CMSUtility_GetCurrentOutputVADID(v11)
          && PVMCategoriesAreEquivalent((const __CFString *)-[MXSessionManager getUncustomizedCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getUncustomizedCategory:", [a3 audioCategory]), (const void *)objc_msgSend(a3, "audioMode"), LastVolumeRampCategory, 0))
        {
          BOOL v12 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v8 = [(NSPointerArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_15:
  [+[MXSessionManager sharedInstance] mxCoreSessionListEndIteration];
  return v12;
}

- (void)cancelAnyInProgressRampIfNeeded:(id)a3 reason:(unsigned __int16)a4
{
  uint64_t CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(a3);
  if (vaemIsVolumeRampInProgress(CurrentOutputVADID)
    && ![+[MXSessionManager sharedInstance] isAnyOtherUnduckedPlayingSessionMatchingVolumeRampCategory:a3])
  {
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    vaemDeviceCancelVolumeRamp(CurrentOutputVADID, a4);
  }
}

- (BOOL)doesSessionPreferInterruptionOnRouteDisconnect:(id)a3
{
  int v4 = [a3 hasAudioCategory:@"MediaPlayback"];
  if ([a3 prefersInterruptionOnRouteDisconnectSetByClient])
  {
    return [a3 prefersInterruptionOnRouteDisconnect];
  }
  else if ((-[NSString isEqualToString:](-[MXNowPlayingAppManager nowPlayingAppDisplayID](+[MXNowPlayingAppManager sharedInstance](MXNowPlayingAppManager, "sharedInstance"), "nowPlayingAppDisplayID"), "isEqualToString:", [a3 displayID]) & v4) == 1)
  {
    return [a3 isAirPlayReceiverSession] ^ 1;
  }
  else
  {
    return 0;
  }
}

- (void)interruptSessionsOnRouteDisconnect:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  int IsInterruptOnRouteDisconnectEnabled = MX_FeatureFlags_IsInterruptOnRouteDisconnectEnabled();
  int IsContextSystemAudio = FigRoutingManagerContextUtilities_IsContextSystemAudio((uint64_t)a3);
  int v6 = CMSMUtility_IsSharePlayCallSessionActive();
  if (IsInterruptOnRouteDisconnectEnabled && IsContextSystemAudio && !v6)
  {
    [+[MXSessionManager sharedInstance] mxCoreSessionListBeginIteration];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v7 = [+[MXSessionManager sharedInstance] mxCoreSessionList];
    uint64_t v8 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v33 objects:v49 count:16];
    uint64_t v9 = self;
    if (v8)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(void *)v34;
      uint64_t v30 = *(void *)v34;
      long long v31 = v7;
      do
      {
        uint64_t v12 = 0;
        uint64_t v32 = v10;
        do
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v7);
          }
          long long v13 = *(void **)(*((void *)&v33 + 1) + 8 * v12);
          if (objc_msgSend(v13, "isActive", v27, v28) && objc_msgSend(v13, "isPlaying"))
          {
            BOOL v14 = [(MXSessionManager *)v9 doesSessionPreferInterruptionOnRouteDisconnect:v13];
            BOOL v15 = CMSUtility_AreRoutingContextsEquivalent((uint64_t)a3, [v13 routingContextUUID]);
            if (dword_1E9359ED0)
            {
              unsigned int v38 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v17 = v38;
              if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
                unsigned int v18 = v17;
              }
              else {
                unsigned int v18 = v17 & 0xFFFFFFFE;
              }
              if (v18)
              {
                uint64_t v19 = [v13 clientName];
                uint64_t v20 = [v13 audioCategory];
                int v39 = 136316162;
                unsigned int v40 = "-[MXSessionManager(Utilities) interruptSessionsOnRouteDisconnect:]";
                __int16 v41 = 2114;
                uint64_t v42 = v19;
                __int16 v43 = 2114;
                uint64_t v44 = v20;
                __int16 v45 = 1024;
                BOOL v46 = v14;
                __int16 v47 = 1024;
                BOOL v48 = v15;
                uint64_t v9 = self;
                LODWORD(v28) = 44;
                int v27 = &v39;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              uint64_t v11 = v30;
              uint64_t v7 = v31;
              uint64_t v10 = v32;
            }
            if (v15 && v14)
            {
              if (dword_1E9359ED0)
              {
                unsigned int v38 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                int v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v23 = v38;
                if (os_log_type_enabled(v22, type)) {
                  unsigned int v24 = v23;
                }
                else {
                  unsigned int v24 = v23 & 0xFFFFFFFE;
                }
                if (v24)
                {
                  uint64_t v25 = [v13 clientName];
                  int v39 = 136315394;
                  unsigned int v40 = "-[MXSessionManager(Utilities) interruptSessionsOnRouteDisconnect:]";
                  __int16 v41 = 2114;
                  uint64_t v42 = v25;
                  LODWORD(v28) = 22;
                  int v27 = &v39;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                uint64_t v11 = v30;
                uint64_t v7 = v31;
                uint64_t v10 = v32;
              }
              CMSUtilityApplier_PostNotification_StopCommandWithReason(v13, 0, (const void *)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", 4, v27, v28));
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v33 objects:v49 count:16];
      }
      while (v10);
    }
    [+[MXSessionManager sharedInstance] mxCoreSessionListEndIteration];
  }
  else if (dword_1E9359ED0)
  {
    long long v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)interruptSessionsForCategoryNoLongerRoutable
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [+[MXSessionManager sharedInstance] mxCoreSessionListBeginIteration];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  float v2 = [+[MXSessionManager sharedInstance] mxCoreSessionList];
  uint64_t v3 = [(NSPointerArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v7 isActive]
          && [v7 hasInput]
          && !CMSMVAUtility_IsInputDeviceAvailableForSession(v7))
        {
          if (dword_1E9359ED0)
          {
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          CMSUtilityApplier_PostNotification_StopCommandWithReason(v7, 0, (const void *)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", 4, v9, v10));
        }
      }
      uint64_t v4 = [(NSPointerArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  [+[MXSessionManager sharedInstance] mxCoreSessionListEndIteration];
}

- (void)postStopCommandToSessionsWithAudioMode:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [+[MXSessionManager sharedInstance] mxCoreSessionListBeginIteration];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v4 = [+[MXSessionManager sharedInstance] mxCoreSessionList];
    uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v18 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      unsigned int v17 = v4;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v9, "isActive", v15, v16)
            && [v9 hasAudioMode:a3])
          {
            if (dword_1E9359ED0)
            {
              unsigned int v23 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v11 = v23;
              if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
                unsigned int v12 = v11;
              }
              else {
                unsigned int v12 = v11 & 0xFFFFFFFE;
              }
              if (v12)
              {
                uint64_t v13 = [v9 clientName];
                int v24 = 136315650;
                uint64_t v25 = "-[MXSessionManager(Utilities) postStopCommandToSessionsWithAudioMode:]";
                __int16 v26 = 2114;
                uint64_t v27 = v13;
                __int16 v28 = 2114;
                id v29 = a3;
                LODWORD(v16) = 32;
                BOOL v15 = &v24;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              uint64_t v4 = v17;
            }
            CMSUtilityApplier_PostNotification_StopCommand(v9, 0);
          }
        }
        uint64_t v6 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v18 objects:v30 count:16];
      }
      while (v6);
    }
    [+[MXSessionManager sharedInstance] mxCoreSessionListEndIteration];
  }
  else
  {
    long long v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (BOOL)isAtleastOneBudNotInEarForA2DPPort
{
  uint64_t CurrentOutputPortAtIndex = CMSMUtility_GetCurrentOutputPortAtIndex(0);
  AudioObjectID v3 = CurrentOutputPortAtIndex;
  if (vaeGetPortTypeFromPortID(CurrentOutputPortAtIndex) == 1885892674)
  {
    int DoesBTPortSupportInEarDetection = vaeDoesBTPortSupportInEarDetection(v3);
    if (DoesBTPortSupportInEarDetection) {
      LOBYTE(DoesBTPortSupportInEarDetection) = vaeGetBTPortPrimaryBudInEarStatus(v3) != 1
    }
                                             || vaeGetBTPortSecondaryBudInEarStatus(v3) != 1;
  }
  else
  {
    LOBYTE(DoesBTPortSupportInEarDetection) = 0;
  }
  return DoesBTPortSupportInEarDetection;
}

- (void)interruptAllSessionsAndSystemSounds:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(MXSessionManager *)self copyMXCoreSessionList];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 isActive])
        {
          if (dword_1E9359ED0)
          {
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          CMSUtilityApplier_PostNotification_StopCommand(v8, 0);
        }
        objc_msgSend((id)objc_msgSend(v8, "clientPID", v10, v11), "unsignedIntValue");
        CMSystemSoundMgr_StopSystemSoundsforPID();
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (BOOL)isSessionUsingBuiltInMic:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![a3 hasInput]) {
    return 0;
  }
  id v4 = [+[MXAdditiveRoutingManager sharedInstance] copyDetailedRouteDescription:CMSUtility_GetCurrentInputVADID(a3)];
  uint64_t v5 = (void *)[v4 objectForKey:@"RouteDetailedDescription_Inputs"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "objectForKey:", @"RouteDetailedDescription_PortType"), "isEqualToString:", @"MicrophoneBuiltIn"))
        {
          BOOL v10 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (void)updateExclaveSensorStatusIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (CMSMDeviceState_DeviceHasExclaveCapability())
  {
    id v2 = [+[MXSessionManager sharedInstance] copyMXCoreSessionList];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v14;
      unint64_t v6 = 0x1EC297000uLL;
      id v12 = v2;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v8, "isActive", v10, v11)
            && objc_msgSend((id)objc_msgSend((id)(v6 + 3848), "sharedInstance"), "updateSensorStatus:reason:", v8, @"Route has changed"))
          {
            if (dword_1E9359ED0)
            {
              os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              unint64_t v6 = 0x1EC297000;
              id v2 = v12;
            }
            CMSUtilityApplier_PostNotification_StopCommand(v8, 0);
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }
  }
}

- (unsigned)getSpeechDetectStyleForSessionConfiguration:(id)a3
{
  if (![a3 prefersSpeechDetectEnabled]
    || [a3 clientPriority] == 10)
  {
    return 4;
  }
  if ([a3 hasAudioMode:@"SpokenAudio"]) {
    return 2;
  }
  if (([a3 hasAudioCategory:@"MediaPlayback"] & 1) != 0
    || ([a3 hasAudioCategory:@"MediaPlaybackNoSpeaker"] & 1) != 0
    || ([a3 hasAudioCategory:@"Audio/Video"] & 1) != 0
    || ([a3 hasAudioCategory:@"AmbientSound"] & 1) != 0
    || ([a3 hasAudioCategory:@"SoloAmbientSound"] & 1) != 0
    || ([a3 hasAudioCategory:@"UserInterfaceSoundEffects"] & 1) != 0
    || ([a3 hasAudioCategory:@"AudioProcessing"] & 1) != 0
    || ([a3 hasAudioCategory:@"LiveAudio"] & 1) != 0
    || ([a3 hasAudioCategory:@"Notice"] & 1) != 0
    || [a3 isPlayingOutput]
    && CMSMUtility_IsPlayAndRecordCategory([a3 audioCategory])
    && [a3 hasAudioMode:@"Default"])
  {
    if (!MX_FeatureFlags_IsInterruptLongFormVideoOnSpeechDetectEnabled()
      || ([a3 hasAudioMode:@"MoviePlayback"] & 1) == 0
      && !CMSUtility_IsLongFormVideoSession(a3))
    {
      return 3;
    }
    return 2;
  }
  if (-[MXSessionManager sessionUtilizesIndependentRecordingOnly:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "sessionUtilizesIndependentRecordingOnly:", a3)|| ([a3 hasAudioMode:@"LivePhoto"] & 1) != 0)
  {
    return 1;
  }
  if ([a3 hasAudioCategory:@"SystemSoundsAndHaptics"]) {
    return 1;
  }
  return 4;
}

- (BOOL)shouldSetDeviceFormatAndSampleRate:(id)a3
{
  if (a3) {
    return ([a3 currentlyControllingFlags] >> 1) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isAnySessionWithMappedVolumeCategoryPlaying:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [(MXSessionManager *)self copyMXCoreSessionList];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = PVMGetMappedCategory((void *)[v9 audioCategory]);
        if ([v9 isActive]
          && [v9 isPlaying]
          && ([v9 doesntActuallyPlayAudio] & 1) == 0
          && ([v10 isEqualToString:a3] & 1) != 0)
        {
          BOOL v11 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_14:

  return v11;
}

- (BOOL)isAudioCategoryAllowedForSharePlayMedia:(id)a3
{
  return [a3 isEqual:@"MediaPlayback"];
}

- (BOOL)isPotentialSharePlayMediaSessionActive
{
  id v2 = [(MXSessionManager *)self copyPotentialActiveSharePlayMediaSession];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)sessionCanBecomeSharePlayMedia:(id)a3
{
  if (!-[MXSessionManager isAudioCategoryAllowedForSharePlayMedia:](self, "isAudioCategoryAllowedForSharePlayMedia:", [a3 audioCategory])|| !objc_msgSend(a3, "isEligibleForNowPlayingAppConsideration"))
  {
    return 0;
  }
  return [a3 allowedToBeNowPlayingApp];
}

- (id)copyPotentialActiveSharePlayMediaSession
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!MX_FeatureFlags_IsSharePlayEnabled()) {
    return 0;
  }
  id SharePlayMediaSession = CMSMUtility_GetSharePlayMediaSession();
  if (![SharePlayMediaSession isActive])
  {
    [(MXSessionManager *)self mxCoreSessionListBeginIteration];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [(MXSessionManager *)self mxCoreSessionList];
    uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v10 isActive]
            && [(MXSessionManager *)self sessionCanBecomeSharePlayMedia:v10])
          {
            id v4 = v10;
            goto LABEL_18;
          }
        }
        uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    id v4 = 0;
LABEL_18:
    [(MXSessionManager *)self mxCoreSessionListEndIteration];
    return v4;
  }
  return SharePlayMediaSession;
}

- (BOOL)isSessionAllowedToStartRecordingTemporarily:(id)a3
{
  id v4 = (void *)[a3 displayID];
  uint64_t v5 = [(MXSessionManager *)self appAllowedToInitiateRecordingTemporarily];
  if (!v4 || !v5) {
    return 0;
  }
  return [v4 isEqualToString:v5];
}

- (void)postDisallowedActivationDueToContinuityCaptureNotification:(BOOL)a3 videoPlaybackWasIntended:(BOOL)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (CMSMDeviceState_ItsAniPad())
  {
    uint64_t v6 = MXGetNotificationSenderQueue();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __115__MXSessionManager_Utilities__postDisallowedActivationDueToContinuityCaptureNotification_videoPlaybackWasIntended___block_invoke;
    v8[3] = &__block_descriptor_34_e5_v8__0l;
    BOOL v9 = a3;
    BOOL v10 = a4;
    MXDispatchAsync((uint64_t)"-[MXSessionManager(Utilities) postDisallowedActivationDueToContinuityCaptureNotification:videoPlaybackWasIntended:]", (uint64_t)"MXSessionManagerUtilities.m", 1974, 0, 0, v6, (uint64_t)v8);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __115__MXSessionManager_Utilities__postDisallowedActivationDueToContinuityCaptureNotification_videoPlaybackWasIntended___block_invoke(uint64_t a1)
{
  if (_block_invoke_registrationStatus
    && (_block_invoke_registrationStatus = notify_register_check("com.apple.MediaExperience.DisallowedActivationDueToContinuityCapture", &_block_invoke_notificationToken)) != 0|| (*(unsigned char *)(a1 + 33) ? (uint64_t v2 = *(unsigned __int8 *)(a1 + 32) | 2) : (uint64_t v2 = *(unsigned __int8 *)(a1 + 32)), notify_set_state(_block_invoke_notificationToken, v2)|| (result = notify_post("com.apple.MediaExperience.DisallowedActivationDueToContinuityCapture"), result)|| dword_1E9359ED0))
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (void)postDisallowedRecordingNotification:(unint64_t)a3
{
  uint64_t v5 = MXGetNotificationSenderQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__MXSessionManager_Utilities__postDisallowedRecordingNotification___block_invoke;
  v6[3] = &unk_1E57CA3A0;
  v6[4] = self;
  v6[5] = a3;
  MXDispatchAsync((uint64_t)"-[MXSessionManager(Utilities) postDisallowedRecordingNotification:]", (uint64_t)"MXSessionManagerUtilities.m", 2023, 0, 0, v5, (uint64_t)v6);
}

uint64_t __67__MXSessionManager_Utilities__postDisallowedRecordingNotification___block_invoke(uint64_t a1)
{
  if (_block_invoke_2_registrationStatus
    && (_block_invoke_2_registrationStatus = notify_register_check("com.apple.MediaExperience.DisallowedRecording", &_block_invoke_2_notificationToken)) != 0|| notify_set_state(_block_invoke_2_notificationToken, *(void *)(a1 + 40))|| (uint64_t result = notify_post("com.apple.MediaExperience.DisallowedRecording"), result)|| dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (id)getDisallowedRecordingReasonString:(unint64_t)a3
{
  if (a3 == 1) {
    return @"OnenessIsActive";
  }
  else {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN(%llu)", a3);
  }
}

- (void)updateActiveSessionsOnDeviceRelinquished
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(MXSessionManager *)self mxCoreSessionListBeginIteration];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  BOOL v3 = [(MXSessionManager *)self mxCoreSessionList];
  uint64_t v4 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "setWasActiveWhenDeviceOwnershipRelinquished:", objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "isActive"));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(MXSessionManager *)self mxCoreSessionListEndIteration];
}

- (id)getCleanupSessionAssertionReasonString:(int64_t)a3
{
  if ((unint64_t)a3 >= 3) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN reason = %d", a3);
  }
  else {
    return off_1E57CB4B8[a3];
  }
}

- (void)cleanupSessionAssertionsIfNeeded:(id)a3 cleanupReason:(int64_t)a4
{
  if (a3 && [a3 audioSessionID])
  {
    objc_initWeak(&location, a3);
    uint64_t v6 = [a3 audioSessionID];
    if ([a3 clientName]) {
      uint64_t v7 = [a3 clientName];
    }
    else {
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN-client-%u", v6);
    }
    uint64_t v8 = [[NSString alloc] initWithString:v7];
    long long v9 = MXGetSerialQueue();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__MXSessionManager_Utilities__cleanupSessionAssertionsIfNeeded_cleanupReason___block_invoke;
    v10[3] = &unk_1E57CB410;
    objc_copyWeak(v11, &location);
    int v12 = v6;
    v11[1] = (id)a4;
    v10[4] = v8;
    MXDispatchAsync((uint64_t)"-[MXSessionManager(Utilities) cleanupSessionAssertionsIfNeeded:cleanupReason:]", (uint64_t)"MXSessionManagerUtilities.m", 2127, 0, 0, v9, (uint64_t)v10);
    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __78__MXSessionManager_Utilities__cleanupSessionAssertionsIfNeeded_cleanupReason___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  Weauint64_t k = objc_loadWeak((id *)(a1 + 40));
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([Weak playbackAssertionRef]) {
    objc_msgSend(v3, "addObject:", objc_msgSend(Weak, "playbackAssertionRef"));
  }
  if ([Weak resumeAssertionRef]) {
    objc_msgSend(v3, "addObject:", objc_msgSend(Weak, "resumeAssertionRef"));
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = (void *)[Weak hostProcessPlaybackAssertions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend((id)objc_msgSend(Weak, "hostProcessPlaybackAssertions"), "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v8++)));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  long long v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"0x%x", *(unsigned int *)(a1 + 56));
  MX_RunningBoardServices_InvalidatePlaybackAssertionsContainingSessionID((uint64_t)v9, v3, *(_DWORD *)(a1 + 48));
}

- (id)copyEvaluatedBadgeType:(id)a3
{
  EvaluatedBadgeType = FigRoutingManagerUtilities_GetEvaluatedBadgeType();
  return EvaluatedBadgeType;
}

- (id)copySessionEligibleForNowPlayingAppConsideration:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [+[MXSessionManager sharedInstance] copyMXCoreSessionList];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v9, "clientPID"), "intValue") == a3
          && [v9 isEligibleForNowPlayingAppConsideration])
        {
          id v10 = v9;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)doesActiveSessionHaveInput
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [(MXSessionManager *)self copyMXCoreSessionList];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isActive]
          && [v6 hasInput]
          && ([v6 currentlyControllingFlags] & 2) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v3;
}

- (BOOL)isBTRouteSameDeviceWithDifferentProfile:(unsigned int)a3 newNumRoutes:(unsigned int)a4 oldRouteTypes:(id)a5 newRouteTypes:(id)a6 oldRouteIdentifiers:(id)a7 newRouteIdentifiers:(id)a8
{
  LOBYTE(v8) = 0;
  if (a3 == 1 && a4 == 1)
  {
    if ([a5 containsObject:@"HeadphonesBT"]) {
      int v13 = 0;
    }
    else {
      int v13 = [a5 containsObject:@"HeadsetBT"] ^ 1;
    }
    if ([a6 containsObject:@"HeadphonesBT"]) {
      int v14 = 0;
    }
    else {
      int v14 = [a6 containsObject:@"HeadsetBT"] ^ 1;
    }
    if ((v13 | v14))
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      uint64_t v18 = 0;
      long long v19 = 0;
      long long v16 = 0;
      uint64_t v17 = 0;
      CMSMUtility_CreateTokensFromDeviceUID((CFStringRef)[a7 objectAtIndex:0], (CFStringRef *)&v19, (CFStringRef *)&v17);
      CMSMUtility_CreateTokensFromDeviceUID((CFStringRef)[a8 objectAtIndex:0], (CFStringRef *)&v18, (CFStringRef *)&v16);
      LOBYTE(v8) = 0;
      if (v19 && v18 && v17 && v16)
      {
        if (-[__CFString isEqualToString:](v19, "isEqualToString:")) {
          int v8 = [(__CFString *)v17 isEqualToString:v16] ^ 1;
        }
        else {
          LOBYTE(v8) = 0;
        }
      }
    }
  }
  return v8;
}

- (BOOL)canSessionsCoexistDueToIndependentRecording:(id)a3 victim:(id)a4
{
  if (!CMSMVAUtility_IsAdditiveRoutingEnabled()
    || (id v6 = a4,
        id v7 = a3,
        ![+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance") sessionUtilizesIndependentRecordingOnly:a3])&& (id v6 = a3, v7 = a4, ![+[MXSessionManager sharedInstance] sessionUtilizesIndependentRecordingOnly:a4]))
  {
LABEL_16:
    LOBYTE(v7) = 0;
    return (char)v7;
  }
  if (v7)
  {
    if (([v7 prefersEchoCancelledInput] & 1) == 0 && objc_msgSend(v6, "isTheAssistant"))
    {
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      goto LABEL_16;
    }
    if ([v7 hasAudioMode:@"SoundRecognition"])
    {
      if (dword_1E9359ED0)
      {
        long long v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        LOBYTE(v7) = 1;
LABEL_18:
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        return (char)v7;
      }
      goto LABEL_15;
    }
    if (![v6 hasPhoneCallBehavior])
    {
LABEL_15:
      LOBYTE(v7) = 1;
      return (char)v7;
    }
    LOBYTE(v7) = [v7 hasEntitlementToRecordDuringCall];
    if (dword_1E9359ED0)
    {
      long long v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      goto LABEL_18;
    }
  }
  return (char)v7;
}

- (BOOL)isSiriSessionActiveAndRoutedToSiriOutputVAD
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(MXSessionManager *)self copyMXCoreSessionList];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v6 isActive])
        {
          if ([v6 isTheAssistant])
          {
            int CurrentOutputVADID = CMSUtility_GetCurrentOutputVADID(v6);
            if (CurrentOutputVADID == [+[MXSessionManager sharedInstance] siriOutputVADID])
            {
              LOBYTE(v3) = 1;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v3;
}

- (BOOL)isMixableSessionBeingInterruptedByNextRecordingClient:(id)a3 victim:(id)a4
{
  if ([a4 mixesWithEveryone])
  {
    int v6 = [a4 clientPriority];
    BOOL v7 = v6 == [a3 clientPriority];
  }
  else
  {
    BOOL v7 = 0;
  }
  BOOL v8 = [a4 prefersBeingInterruptedByNextActiveRecordingClient]
    && CMSMUtility_IsRecordingCategory((const void *)[a3 audioCategory])
    || [a3 prefersToInterruptActiveRecordingSessions]
    && ([a4 isTheAssistant] & 1) == 0
    && CMSMUtility_IsRecordingCategory((const void *)[a4 audioCategory]);
  return v7 && v8;
}

- (void)remoteDeviceControlIsAllowed:(unsigned int *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!MX_FeatureFlags_IsOnenessEnabled())
  {
    if (!a3) {
      return;
    }
    unsigned int v11 = 1;
    goto LABEL_30;
  }
  id v5 = [(MXSessionManager *)self copyMXCoreSessionList];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 isActive]
          && [v10 hasPhoneCallBehavior]
          && [v10 isRecording])
        {
          if (dword_1E9359ED0)
          {
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          unsigned int v11 = 3;
          goto LABEL_29;
        }
        if ([v10 isTheAssistant] && objc_msgSend(v10, "isRecording"))
        {
          if (dword_1E9359ED0)
          {
            long long v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          unsigned int v11 = 4;
          goto LABEL_29;
        }
        if ([v10 isActive]
          && [v10 isRecording]
          && ([v10 prefersNoInterruptionsDuringRemoteDeviceControl] & 1) == 0)
        {
          if (dword_1E9359ED0)
          {
            uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          unsigned int v11 = 2;
          goto LABEL_29;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  unsigned int v11 = 0;
LABEL_29:

  if (a3) {
LABEL_30:
  }
    *a3 = v11;
}

- (id)getProjectedAudioDestinationForCategory:(id)a3 mode:(id)a4
{
  id v4 = @"VirtualAudioDevice_Default";
  if (a3 && a4)
  {
    id v5 = [+[MXSessionManager sharedInstance] copyAudioBehaviorForCategory:a3 mode:a4];
    uint64_t v6 = [v5 objectForKey:@"AudioBehaviour_Destination"];
    if (v6) {
      id v4 = [+[MXSessionManager sharedInstance] getAvailableAudioDestination:v6];
    }
  }
  else if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v4;
}

- (int)getVolumeButtonDelta:(id)a3 outVolumeDelta:(float *)a4
{
  cf[16] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  VolumeButtonClient = CMSessionMgrFindVolumeButtonClient(1u);
  uint64_t v7 = VolumeButtonClient;
  if (VolumeButtonClient)
  {
    if (![VolumeButtonClient isActive])
    {
      float VolumeDeltaIfRoutedToThirdPartyTV = 0.0625;
      goto LABEL_33;
    }
    float VolumeDeltaIfRoutedToThirdPartyTV = CMSUtility_GetVolumeDeltaIfRoutedToThirdPartyTV(v7, 0.0625);
  }
  else
  {
    cf[0] = 0;
    CFTypeRef v18 = 0;
    *(void *)long long v19 = 0;
    CFArrayRef theArray = 0;
    PVMCopyCurrentDeviceRoute(cf, v19, &v18);
    CFTypeRef v9 = CMSMUtility_CopySystemAudioRoutingContextUUID();
    FigRoutingManagerContextUtilities_CopyPickedEndpoints((uint64_t)v9, (uint64_t)&theArray);
    if (theArray
      && CFArrayGetCount(theArray)
      && (CFArrayGetValueAtIndex(theArray, 0), FigEndpointUtility_IsEndpointThirdPartyTVFamily())
      && FigCFEqual())
    {
      if (CMSMDeviceState_ButtonsCanChangeRingerVolume()) {
        float VolumeDeltaIfRoutedToThirdPartyTV = 0.0625;
      }
      else {
        float VolumeDeltaIfRoutedToThirdPartyTV = 0.01;
      }
    }
    else
    {
      float VolumeDeltaIfRoutedToThirdPartyTV = 0.0625;
    }
    if (cf[0])
    {
      CFRelease(cf[0]);
      cf[0] = 0;
    }
    if (*(void *)v19)
    {
      CFRelease(*(CFTypeRef *)v19);
      *(void *)long long v19 = 0;
    }
    if (v18)
    {
      CFRelease(v18);
      CFTypeRef v18 = 0;
    }
    if (v9) {
      CFRelease(v9);
    }
    if (theArray) {
      CFRelease(theArray);
    }
  }
  if (VolumeDeltaIfRoutedToThirdPartyTV != 0.0625 && dword_1E9359ED0 != 0)
  {
    LODWORD(v18) = 0;
    LOBYTE(theArray) = 0;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v12 = v18;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, (os_log_type_t)theArray)) {
      unsigned int v13 = v12;
    }
    else {
      unsigned int v13 = v12 & 0xFFFFFFFE;
    }
    if (v13)
    {
      uint64_t v14 = [v7 clientName];
      int v15 = [v7 isActive];
      *(_DWORD *)long long v19 = 136316162;
      *(void *)&v19[4] = "-[MXSessionManager(Utilities) getVolumeButtonDelta:outVolumeDelta:]";
      __int16 v20 = 2114;
      uint64_t v21 = v14;
      __int16 v22 = 2114;
      id v23 = a3;
      __int16 v24 = 1024;
      int v25 = v15;
      __int16 v26 = 2048;
      double v27 = VolumeDeltaIfRoutedToThirdPartyTV;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_33:
  *a4 = VolumeDeltaIfRoutedToThirdPartyTV;
  return 0;
}

@end