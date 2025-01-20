@interface MXCoreSession
- (BOOL)addSharedAudioRouteToRoutablePorts;
- (BOOL)allowMixableAudioWhileRecording;
- (BOOL)allowSystemSoundsWhileRecording;
- (BOOL)allowedToBeNowPlayingApp;
- (BOOL)allowsBluetoothRecordingCustomization;
- (BOOL)allowsDefaultBuiltInRouteCustomization;
- (BOOL)areBothBudsInEarForA2DPPortBeforeInterrupting;
- (BOOL)audioHWControlFlagsSetByClient;
- (BOOL)auditTokenSetByClient;
- (BOOL)bypassSystemSpatialAudioForGame;
- (BOOL)clientIsPlaying;
- (BOOL)createSpeakerDevice;
- (BOOL)defaultBuiltInRoutePreferenceSetByClient;
- (BOOL)disallowAudioFormatChanges;
- (BOOL)doNotNotifyOtherSessionsOnNextInactive;
- (BOOL)doNotResetAudioCategoryOnNextInactive;
- (BOOL)doesGameAudioNeedToBeSpatialized;
- (BOOL)doesInterAppAudio;
- (BOOL)doesntActuallyPlayAudio;
- (BOOL)dontTakeOverHardware;
- (BOOL)duckCommandSentToCarSession;
- (BOOL)duckFadeDurationSetByClient;
- (BOOL)duckToLevelDBSetByClient;
- (BOOL)duckToLevelScalarSetByClient;
- (BOOL)duckedOnVAD;
- (BOOL)enableBluetoothRecordingPreferenceSetByClient;
- (BOOL)forceSoundCheck;
- (BOOL)handsOverInterruptionsToInterruptor;
- (BOOL)hapticEngineIsPlaying;
- (BOOL)hasEntitlementToRecordAudioInAnExtension;
- (BOOL)hasEntitlementToRecordDuringCall;
- (BOOL)hasEntitlementToSetEmergencyAlertPriority;
- (BOOL)hasEntitlementToSetPreferredMinimumMicrophoneIndicatorLightOnTime;
- (BOOL)hasEntitlementToSetPrefersNoInterruptions;
- (BOOL)hasEntitlementToSetPrefersToOptOutOfHardwareSafetyInterruptions;
- (BOOL)hasEntitlementToShowMicrophoneIndicatorWhileNotRecording;
- (BOOL)hasEntitlementToStartRecordingInTheBackground;
- (BOOL)hasEntitlementToSupportProcessAssertionAuditTokens;
- (BOOL)hasEntitlementToSuppressRecordingStateToSystemStatus;
- (BOOL)hasFetchedBackgroundPrivileges;
- (BOOL)hasFetchedGPSPrivileges;
- (BOOL)hasGPSPrivileges;
- (BOOL)idleSleepPreventorAllocated;
- (BOOL)ignoreRingerSwitch;
- (BOOL)interruptionFadeDurationSetByClient;
- (BOOL)isActiveOverAirPlayVideo;
- (BOOL)isAirPlayReceiverSession;
- (BOOL)isAllowedToPlayInBackground;
- (BOOL)isAudioOnlyAirPlayVideoActive;
- (BOOL)isAudioSession;
- (BOOL)isCameraRecordingExtension;
- (BOOL)isCarSession;
- (BOOL)isDucked;
- (BOOL)isEligibleForBTTriangleConsideration;
- (BOOL)isEligibleForNowPlayingAppConsideration;
- (BOOL)isFigInstantiatedAudioSession;
- (BOOL)isHardwareSafetySession;
- (BOOL)isIDSMXCoreSession;
- (BOOL)isInterruptionCalledOffAudioControlQueue;
- (BOOL)isLongFormAudio;
- (BOOL)isPiPPossible;
- (BOOL)isPlayingOutput;
- (BOOL)isRecordingMuted;
- (BOOL)isRecordingMutedForRemoteDevice;
- (BOOL)isRouteSharingPolicySetByClient;
- (BOOL)isShadowSessionForFigSBAR;
- (BOOL)isSharePlayCallSession;
- (BOOL)isSharePlayCapableCallSession;
- (BOOL)isSharePlayMediaSession;
- (BOOL)isSharedAVAudioSessionInstance;
- (BOOL)isTemporaryAssertionEnabled;
- (BOOL)isUsingCamera;
- (BOOL)isVibrating;
- (BOOL)makesMusicResume;
- (BOOL)mustRestoreCurrentlyControllingFlags;
- (BOOL)mustUseDefaultClientPriority;
- (BOOL)mutesAudioBasedOnRingerSwitchState;
- (BOOL)needToEndInterruption;
- (BOOL)needsAudioBudget;
- (BOOL)notFullyInactive;
- (BOOL)nowPlayingAppThatWasStoppedOnMostRecentActivationWasDoingSpokenAudio;
- (BOOL)nowPlayingAppWasStoppedOnMostRecentActivation;
- (BOOL)optOutOfMutePriority;
- (BOOL)preferredDecoupledInputOutput;
- (BOOL)preferredOutputSampleRateSetByClient;
- (BOOL)prefersBeingInterruptedByNextActiveRecordingClient;
- (BOOL)prefersBluetoothAccessoryMuting;
- (BOOL)prefersConcurrentAirPlayAudio;
- (BOOL)prefersEchoCancelledInput;
- (BOOL)prefersInterruptionOnRouteDisconnect;
- (BOOL)prefersInterruptionOnRouteDisconnectSetByClient;
- (BOOL)prefersMultichannelAudio;
- (BOOL)prefersNoDucking;
- (BOOL)prefersNoInterruptionWhenSecureMicrophoneIsEngaged;
- (BOOL)prefersNoInterruptionsByMixableSessions;
- (BOOL)prefersNoInterruptionsByRingtonesAndAlerts;
- (BOOL)prefersNoInterruptionsDuringRemoteDeviceControl;
- (BOOL)prefersSpeechDetectEnabled;
- (BOOL)prefersSuppressingRecordingState;
- (BOOL)prefersToInterruptActiveRecordingSessions;
- (BOOL)prefersToOptOutOfHardwareSafetyInterruptions;
- (BOOL)prefersToPlayDuringWombat;
- (BOOL)prefersToTakeHWControlFlagsFromAnotherSession;
- (BOOL)prefersToVibeWhenVibrationsAreDisabled;
- (BOOL)recentlyWantedToPauseSpokenAudio;
- (BOOL)requiresAggregatedInputOutput;
- (BOOL)routingContextSetByClient;
- (BOOL)shouldAttemptSmartRoutingHijackForMusicApp;
- (BOOL)shouldEnableBluetoothRecording;
- (BOOL)shouldMuteBeAppliedToRemoteDevice;
- (BOOL)silentMuted;
- (BOOL)someMXSessionIsPlaying;
- (BOOL)stopsWhenDeviceLocks;
- (BOOL)systemSoundHasModifiedCurrentlyControllingFlags;
- (BOOL)tookControlOfStarkMainAudio;
- (BOOL)triggeredRemoteInterruption;
- (BOOL)unduckFadeDurationSetByClient;
- (BOOL)unduckToLevelScalarSetByClient;
- (BOOL)updateAudioBehaviourFromVARouteConfig:(id)a3;
- (BOOL)userMuted;
- (BOOL)waitingForEndInterruptionWhenDeviceUnlocksOrInForeground;
- (BOOL)waitingToResume;
- (BOOL)waitingToResumeWhenDeviceUnlocksOrInForeground;
- (BOOL)waitingToSendEndInterruptionToSpokenAudioApp;
- (BOOL)wantsAutomaticClusterPairingOnPlaybackStart;
- (BOOL)wantsToBeVolumeButtonClient;
- (BOOL)wantsToPauseSpokenAudio;
- (BOOL)wantsToSendResumableEndInterruptionWhenBackgrounded;
- (BOOL)wantsToShowMicrophoneIndicatorWhenNotRecording;
- (BOOL)wantsVibrationNotifications;
- (BOOL)wantsVolumeChangesWhenPaused;
- (BOOL)wantsVolumeChangesWhenPausedOrInactive;
- (BOOL)wasActiveWhenDeviceOwnershipRelinquished;
- (BOOL)wasInterruptedByNowPlayingApp;
- (BOOL)wasInterruptedWhileRecording;
- (BOOL)wasInterruptedWhileSuspended;
- (BOOL)wasMutedBeforeInterruption;
- (BOOL)wasRecordingBeforeBeingInterrupted;
- (BOOL)willRouteToOnDemandVADOnActivation;
- (BOOL)willSetScreenDarkModeOnVAD;
- (MXCoreSession)init;
- (MXCoreSession)interruptingSession;
- (NSArray)activeRoutesWhenInterrupted;
- (NSArray)allowedPortTypes;
- (NSArray)allowedRouteTypes;
- (NSArray)excludedPortsList;
- (NSArray)hostProcessAttribution;
- (NSArray)overridePortsList;
- (NSArray)parentProcessAuditTokens;
- (NSArray)subPortPreferences;
- (NSArray)supportedOutputChannelLayouts;
- (NSDate)idleSleepPreventorCreationTime;
- (NSDate)isPlayingStartTime;
- (NSDate)isPlayingStopTime;
- (NSDictionary)activationContext;
- (NSDictionary)bundleIdToPAAccessIntervalMap;
- (NSDictionary)cameraParameters;
- (NSDictionary)hostProcessPlaybackAssertions;
- (NSDictionary)powerProfile;
- (NSDictionary)preferredPersistentRoute;
- (NSDictionary)preferredRouteControlFeatures;
- (NSDictionary)vibrationData;
- (NSDictionary)vpBlockConfiguration;
- (NSLock)mxSessionListReadLock;
- (NSLock)sessionPropertiesLock;
- (NSMutableArray)duckingSourceList;
- (NSNumber)desiredInputGainScalar;
- (NSNumber)preferredMinimumMicrophoneIndicatorLightOnTime;
- (NSPointerArray)mxSessionList;
- (NSSet)notificationsSubscribedTo;
- (NSString)aggregateDeviceClockUID;
- (NSString)badgeType;
- (NSString)defaultBuiltInRoutePreference;
- (NSString)defaultVPChatMode;
- (NSString)idleSleepPreventorName;
- (NSString)preferredHardwareFormat;
- (NSString)siriInputDeviceUUID;
- (NSString)waitingForRemoteInterruptionDoneIdentifier;
- (OS_dispatch_semaphore)mxSessionListWriteSemaphore;
- (OS_dispatch_source)extendBackgroundAppAssertionTimer;
- (OS_dispatch_source)idleSleepPreventorUpdaterTimer;
- (OS_dispatch_source)interruptSessionWithoutValidAssertionsTimer;
- (OS_dispatch_source)resumeBackgroundAppUpdaterTimer;
- (OS_dispatch_source)sessionAssertionAuditTimer;
- (OS_dispatch_source)sessionDeactivateTimer;
- (OS_os_transaction)vibratingOSTransaction;
- (RBSAssertion)playbackAssertionRef;
- (RBSAssertion)resumeAssertionRef;
- (double)getPreferredOutputSampleRatePointer;
- (double)preferredInputSampleRate;
- (double)preferredOutputSampleRate;
- (float)audioQueueDuckVolume;
- (float)audioQueueFadeDuration;
- (float)constantOutputVolumeLeveldB;
- (float)duckFadeDuration;
- (float)duckToLevelDB;
- (float)duckToLevelScalar;
- (float)lastDuckVolumeApplied;
- (float)preferredIOBufferDuration;
- (float)unduckFadeDuration;
- (float)unduckToLevelScalar;
- (id)copyDetailedRouteDescription;
- (id)copyDetailedRouteDescriptionForContinuityScreenOutput:(id)a3;
- (id)copyMXSessionList;
- (id)defaultBuiltInRouteToUse;
- (int)deactivateTimerDelay;
- (int)getPreferredIOBufferFramesPointer;
- (int)lastRouteSharingPolicySetByClient;
- (int)pidToInheritAppStateFrom;
- (int)preferredIOBufferFrames;
- (int)preferredNumberOfInputChannels;
- (int)preferredNumberOfOutputChannels;
- (int)preferredStereoInputOrientation;
- (int)routeSharingPolicy;
- (int)setInterruptionStyleAtClientRequest:(unsigned int)a3;
- (int)setUpDefaultBehavioursForCategoryAtClientRequest;
- (int)setUpDefaultInterruptionStyleForCategoryAndMode;
- (int)updateInterruptionStyle:(unsigned int)a3;
- (int64_t)timestampWhenMostRecentResumableEndInterruptionWasSent;
- (int64_t)timestampWhenMostRecentlyInterrupted;
- (int64_t)timestampWhenRecordingInBackgroundMostRecentlyStopped;
- (unint64_t)mxSessionListAddSession:(id)a3;
- (unsigned)assertionAuditTimerDelay;
- (unsigned)clientPriority;
- (unsigned)currentlyControllingFlags;
- (unsigned)hwControlFlags;
- (unsigned)idleSleepPreventor;
- (unsigned)mode;
- (unsigned)mxSessionListActiveReaders;
- (unsigned)orientationOverride;
- (unsigned)savedCurrentlyControllingFlags;
- (unsigned)savedHWControlFlagsForClientThatDoesNotActuallyPlayAudio;
- (unsigned)shadowingAudioSessionID;
- (unsigned)starkBorrowCount;
- (void)dealloc;
- (void)mxSessionListBeginIteration;
- (void)mxSessionListEndIteration;
- (void)resetInterruptionFlags;
- (void)setActivationContext:(id)a3;
- (void)setActiveRoutesWhenInterrupted:(id)a3;
- (void)setAddSharedAudioRouteToRoutablePorts:(BOOL)a3;
- (void)setAggregateDeviceClockUID:(id)a3;
- (void)setAllowMixableAudioWhileRecording:(BOOL)a3;
- (void)setAllowSystemSoundsWhileRecording:(BOOL)a3;
- (void)setAllowedPortTypes:(id)a3;
- (void)setAllowedRouteTypes:(id)a3;
- (void)setAllowedToBeNowPlayingApp:(BOOL)a3;
- (void)setAllowsBluetoothRecordingCustomization:(BOOL)a3;
- (void)setAllowsDefaultBuiltInRouteCustomization:(BOOL)a3;
- (void)setAreBothBudsInEarForA2DPPortBeforeInterrupting:(BOOL)a3;
- (void)setAssertionAuditTimerDelay:(unsigned int)a3;
- (void)setAudioHWControlFlagsSetByClient:(BOOL)a3;
- (void)setAudioQueueDuckVolume:(float)a3;
- (void)setAudioQueueFadeDuration:(float)a3;
- (void)setAuditTokenSetByClient:(BOOL)a3;
- (void)setBadgeType:(id)a3;
- (void)setBundleIdToPAAccessIntervalMap:(id)a3;
- (void)setBypassSystemSpatialAudioForGame:(BOOL)a3;
- (void)setCameraParameters:(id)a3;
- (void)setClientIsPlaying:(BOOL)a3;
- (void)setClientPriority:(unsigned int)a3;
- (void)setConstantOutputVolumeLeveldB:(float)a3;
- (void)setCreateSpeakerDevice:(BOOL)a3;
- (void)setCurrentlyControllingFlags:(unsigned int)a3;
- (void)setDeactivateTimerDelay:(int)a3;
- (void)setDefaultBuiltInRoutePreference:(id)a3;
- (void)setDefaultBuiltInRoutePreferenceSetByClient:(BOOL)a3;
- (void)setDefaultVPChatMode:(id)a3;
- (void)setDesiredInputGainScalar:(id)a3;
- (void)setDisallowAudioFormatChanges:(BOOL)a3;
- (void)setDoNotNotifyOtherSessionsOnNextInactive:(BOOL)a3;
- (void)setDoNotResetAudioCategoryOnNextInactive:(BOOL)a3;
- (void)setDoesGameAudioNeedToBeSpatialized:(BOOL)a3;
- (void)setDoesInterAppAudio:(BOOL)a3;
- (void)setDoesntActuallyPlayAudio:(BOOL)a3;
- (void)setDontTakeOverHardware:(BOOL)a3;
- (void)setDuckCommandSentToCarSession:(BOOL)a3;
- (void)setDuckFadeDuration:(float)a3;
- (void)setDuckFadeDurationSetByClient:(BOOL)a3;
- (void)setDuckToLevelDB:(float)a3;
- (void)setDuckToLevelDBSetByClient:(BOOL)a3;
- (void)setDuckToLevelScalar:(float)a3;
- (void)setDuckToLevelScalarSetByClient:(BOOL)a3;
- (void)setDuckedOnVAD:(BOOL)a3;
- (void)setDuckingSourceList:(id)a3;
- (void)setEnableBluetoothRecordingPreferenceSetByClient:(BOOL)a3;
- (void)setExcludedPortsList:(id)a3;
- (void)setExtendBackgroundAppAssertionTimer:(id)a3;
- (void)setForceSoundCheck:(BOOL)a3;
- (void)setHandsOverInterruptionsToInterruptor:(BOOL)a3;
- (void)setHapticEngineIsPlaying:(BOOL)a3;
- (void)setHasEntitlementToRecordAudioInAnExtension:(BOOL)a3;
- (void)setHasEntitlementToRecordDuringCall:(BOOL)a3;
- (void)setHasEntitlementToSetEmergencyAlertPriority:(BOOL)a3;
- (void)setHasEntitlementToSetPreferredMinimumMicrophoneIndicatorLightOnTime:(BOOL)a3;
- (void)setHasEntitlementToSetPrefersNoInterruptions:(BOOL)a3;
- (void)setHasEntitlementToSetPrefersToOptOutOfHardwareSafetyInterruptions:(BOOL)a3;
- (void)setHasEntitlementToShowMicrophoneIndicatorWhileNotRecording:(BOOL)a3;
- (void)setHasEntitlementToStartRecordingInTheBackground:(BOOL)a3;
- (void)setHasEntitlementToSupportProcessAssertionAuditTokens:(BOOL)a3;
- (void)setHasEntitlementToSuppressRecordingStateToSystemStatus:(BOOL)a3;
- (void)setHasFetchedBackgroundPrivileges:(BOOL)a3;
- (void)setHasFetchedGPSPrivileges:(BOOL)a3;
- (void)setHasGPSPrivileges:(BOOL)a3;
- (void)setHostProcessAttribution:(id)a3;
- (void)setHostProcessPlaybackAssertions:(id)a3;
- (void)setHwControlFlags:(unsigned int)a3;
- (void)setIdleSleepPreventor:(unsigned int)a3;
- (void)setIdleSleepPreventorAllocated:(BOOL)a3;
- (void)setIdleSleepPreventorCreationTime:(id)a3;
- (void)setIdleSleepPreventorName:(id)a3;
- (void)setIdleSleepPreventorUpdaterTimer:(id)a3;
- (void)setIgnoreRingerSwitch:(BOOL)a3;
- (void)setInterruptSessionWithoutValidAssertionsTimer:(id)a3;
- (void)setInterruptingSession:(id)a3;
- (void)setInterruptionFadeDurationSetByClient:(BOOL)a3;
- (void)setIsActiveOverAirPlayVideo:(BOOL)a3;
- (void)setIsAirPlayReceiverSession:(BOOL)a3;
- (void)setIsAllowedToPlayInBackground:(BOOL)a3;
- (void)setIsAudioOnlyAirPlayVideoActive:(BOOL)a3;
- (void)setIsAudioSession:(BOOL)a3;
- (void)setIsCameraRecordingExtension:(BOOL)a3;
- (void)setIsCarSession:(BOOL)a3;
- (void)setIsDucked:(BOOL)a3;
- (void)setIsEligibleForBTTriangleConsideration:(BOOL)a3;
- (void)setIsEligibleForNowPlayingAppConsideration:(BOOL)a3;
- (void)setIsFigInstantiatedAudioSession:(BOOL)a3;
- (void)setIsHardwareSafetySession:(BOOL)a3;
- (void)setIsIDSMXCoreSession:(BOOL)a3;
- (void)setIsInterruptionCalledOffAudioControlQueue:(BOOL)a3;
- (void)setIsLongFormAudio:(BOOL)a3;
- (void)setIsPiPPossible:(BOOL)a3;
- (void)setIsPlayingOutput:(BOOL)a3;
- (void)setIsPlayingStartTime:(id)a3;
- (void)setIsPlayingStopTime:(id)a3;
- (void)setIsRecordingMuted:(BOOL)a3;
- (void)setIsRecordingMutedForRemoteDevice:(BOOL)a3;
- (void)setIsShadowSessionForFigSBAR:(BOOL)a3;
- (void)setIsSharePlayCallSession:(BOOL)a3;
- (void)setIsSharePlayCapableCallSession:(BOOL)a3;
- (void)setIsSharePlayMediaSession:(BOOL)a3;
- (void)setIsSharedAVAudioSessionInstance:(BOOL)a3;
- (void)setIsTemporaryAssertionEnabled:(BOOL)a3;
- (void)setIsUsingCamera:(BOOL)a3;
- (void)setIsVibrating:(BOOL)a3;
- (void)setLastDuckVolumeApplied:(float)a3;
- (void)setLastRouteSharingPolicySetByClient:(int)a3;
- (void)setMakesMusicResume:(BOOL)a3;
- (void)setMode:(unsigned int)a3;
- (void)setMustRestoreCurrentlyControllingFlags:(BOOL)a3;
- (void)setMustUseDefaultClientPriority:(BOOL)a3;
- (void)setMutesAudioBasedOnRingerSwitchState:(BOOL)a3;
- (void)setMxSessionList:(id)a3;
- (void)setMxSessionListActiveReaders:(unsigned int)a3;
- (void)setMxSessionListReadLock:(id)a3;
- (void)setMxSessionListWriteSemaphore:(id)a3;
- (void)setNeedToEndInterruption:(BOOL)a3;
- (void)setNeedsAudioBudget:(BOOL)a3;
- (void)setNotFullyInactive:(BOOL)a3;
- (void)setNotificationsSubscribedTo:(id)a3;
- (void)setNowPlayingAppThatWasStoppedOnMostRecentActivationWasDoingSpokenAudio:(BOOL)a3;
- (void)setNowPlayingAppWasStoppedOnMostRecentActivation:(BOOL)a3;
- (void)setOptOutOfMutePriority:(BOOL)a3;
- (void)setOrientationOverride:(unsigned int)a3;
- (void)setOverridePortsList:(id)a3;
- (void)setParentProcessAuditTokens:(id)a3;
- (void)setPidToInheritAppStateFrom:(int)a3;
- (void)setPlaybackAssertionRef:(id)a3;
- (void)setPowerProfile:(id)a3;
- (void)setPreferredDecoupledInputOutput:(BOOL)a3;
- (void)setPreferredHardwareFormat:(id)a3;
- (void)setPreferredIOBufferDuration:(float)a3;
- (void)setPreferredIOBufferFrames:(int)a3;
- (void)setPreferredInputSampleRate:(double)a3;
- (void)setPreferredMinimumMicrophoneIndicatorLightOnTime:(id)a3;
- (void)setPreferredNumberOfInputChannels:(int)a3;
- (void)setPreferredNumberOfOutputChannels:(int)a3;
- (void)setPreferredOutputSampleRate:(double)a3;
- (void)setPreferredOutputSampleRateSetByClient:(BOOL)a3;
- (void)setPreferredPersistentRoute:(id)a3;
- (void)setPreferredRouteControlFeatures:(id)a3;
- (void)setPreferredStereoInputOrientation:(int)a3;
- (void)setPrefersBeingInterruptedByNextActiveRecordingClient:(BOOL)a3;
- (void)setPrefersBluetoothAccessoryMuting:(BOOL)a3;
- (void)setPrefersConcurrentAirPlayAudio:(BOOL)a3;
- (void)setPrefersEchoCancelledInput:(BOOL)a3;
- (void)setPrefersInterruptionOnRouteDisconnect:(BOOL)a3;
- (void)setPrefersInterruptionOnRouteDisconnectSetByClient:(BOOL)a3;
- (void)setPrefersMultichannelAudio:(BOOL)a3;
- (void)setPrefersNoDucking:(BOOL)a3;
- (void)setPrefersNoInterruptionWhenSecureMicrophoneIsEngaged:(BOOL)a3;
- (void)setPrefersNoInterruptionsByMixableSessions:(BOOL)a3;
- (void)setPrefersNoInterruptionsByRingtonesAndAlerts:(BOOL)a3;
- (void)setPrefersNoInterruptionsDuringRemoteDeviceControl:(BOOL)a3;
- (void)setPrefersSpeechDetectEnabled:(BOOL)a3;
- (void)setPrefersSuppressingRecordingState:(BOOL)a3;
- (void)setPrefersToInterruptActiveRecordingSessions:(BOOL)a3;
- (void)setPrefersToOptOutOfHardwareSafetyInterruptions:(BOOL)a3;
- (void)setPrefersToPlayDuringWombat:(BOOL)a3;
- (void)setPrefersToTakeHWControlFlagsFromAnotherSession:(BOOL)a3;
- (void)setPrefersToVibeWhenVibrationsAreDisabled:(BOOL)a3;
- (void)setRecentlyWantedToPauseSpokenAudio:(BOOL)a3;
- (void)setRequiresAggregatedInputOutput:(BOOL)a3;
- (void)setResumeAssertionRef:(id)a3;
- (void)setResumeBackgroundAppUpdaterTimer:(id)a3;
- (void)setRouteSharingPolicy:(int)a3;
- (void)setRoutingContextSetByClient:(BOOL)a3;
- (void)setSavedCurrentlyControllingFlags:(unsigned int)a3;
- (void)setSavedHWControlFlagsForClientThatDoesNotActuallyPlayAudio:(unsigned int)a3;
- (void)setSessionAssertionAuditTimer:(id)a3;
- (void)setSessionDeactivateTimer:(id)a3;
- (void)setSessionPropertiesLock:(id)a3;
- (void)setShadowingAudioSessionID:(unsigned int)a3;
- (void)setShouldMuteBeAppliedToRemoteDevice:(BOOL)a3;
- (void)setSilentMuted:(BOOL)a3;
- (void)setSiriInputDeviceUUID:(id)a3;
- (void)setSomeMXSessionIsPlaying:(BOOL)a3;
- (void)setStarkBorrowCount:(unsigned int)a3;
- (void)setStopsWhenDeviceLocks:(BOOL)a3;
- (void)setSubPortPreferences:(id)a3;
- (void)setSupportedOutputChannelLayouts:(id)a3;
- (void)setSystemSoundHasModifiedCurrentlyControllingFlags:(BOOL)a3;
- (void)setTimestampWhenMostRecentResumableEndInterruptionWasSent:(int64_t)a3;
- (void)setTimestampWhenMostRecentlyInterrupted:(int64_t)a3;
- (void)setTimestampWhenRecordingInBackgroundMostRecentlyStopped:(int64_t)a3;
- (void)setTookControlOfStarkMainAudio:(BOOL)a3;
- (void)setTriggeredRemoteInterruption:(BOOL)a3;
- (void)setUnduckFadeDuration:(float)a3;
- (void)setUnduckFadeDurationSetByClient:(BOOL)a3;
- (void)setUnduckToLevelScalar:(float)a3;
- (void)setUnduckToLevelScalarSetByClient:(BOOL)a3;
- (void)setUserMuted:(BOOL)a3;
- (void)setVibratingOSTransaction:(id)a3;
- (void)setVibrationData:(id)a3;
- (void)setVpBlockConfiguration:(id)a3;
- (void)setWaitingForEndInterruptionWhenDeviceUnlocksOrInForeground:(BOOL)a3;
- (void)setWaitingForRemoteInterruptionDoneIdentifier:(id)a3;
- (void)setWaitingToResume:(BOOL)a3;
- (void)setWaitingToResumeWhenDeviceUnlocksOrInForeground:(BOOL)a3;
- (void)setWaitingToSendEndInterruptionToSpokenAudioApp:(BOOL)a3;
- (void)setWantsAutomaticClusterPairingOnPlaybackStart:(BOOL)a3;
- (void)setWantsToBeVolumeButtonClient:(BOOL)a3;
- (void)setWantsToPauseSpokenAudio:(BOOL)a3;
- (void)setWantsToSendResumableEndInterruptionWhenBackgrounded:(BOOL)a3;
- (void)setWantsToShowMicrophoneIndicatorWhenNotRecording:(BOOL)a3;
- (void)setWantsVibrationNotifications:(BOOL)a3;
- (void)setWantsVolumeChangesWhenPaused:(BOOL)a3;
- (void)setWantsVolumeChangesWhenPausedOrInactive:(BOOL)a3;
- (void)setWasActiveWhenDeviceOwnershipRelinquished:(BOOL)a3;
- (void)setWasInterruptedByNowPlayingApp:(BOOL)a3;
- (void)setWasInterruptedWhileRecording:(BOOL)a3;
- (void)setWasInterruptedWhileSuspended:(BOOL)a3;
- (void)setWasMutedBeforeInterruption:(BOOL)a3;
- (void)setWasRecordingBeforeBeingInterrupted:(BOOL)a3;
- (void)setWillSetScreenDarkModeOnVAD:(BOOL)a3;
- (void)subscribeToNotifications:(id)a3;
- (void)updateApplicationStateAndPIDToInheritAppStateFrom;
- (void)updateCameraExtensionFlagsIfNeeded;
- (void)updatePreferredIOBufferDuration:(float)a3;
- (void)updatePreferredIOBufferFrames:(int)a3;
- (void)updateRouteSharingPolicy:(int)a3 setByClient:(BOOL)a4;
@end

@implementation MXCoreSession

- (id)copyMXSessionList
{
  v3 = (void *)MEMORY[0x1997179E0](self, a2);
  [(MXCoreSession *)self mxSessionListBeginIteration];
  v4 = [(NSPointerArray *)[(MXCoreSession *)self mxSessionList] allObjects];
  [(MXCoreSession *)self mxSessionListEndIteration];
  return v4;
}

- (NSPointerArray)mxSessionList
{
  return self->_mxSessionList;
}

- (void)mxSessionListEndIteration
{
  [(NSLock *)[(MXCoreSession *)self mxSessionListReadLock] lock];
  [(MXCoreSession *)self setMxSessionListActiveReaders:[(MXCoreSession *)self mxSessionListActiveReaders] - 1];
  if (![(MXCoreSession *)self mxSessionListActiveReaders]) {
    dispatch_semaphore_signal((dispatch_semaphore_t)[(MXCoreSession *)self mxSessionListWriteSemaphore]);
  }
  v3 = [(MXCoreSession *)self mxSessionListReadLock];
  [(NSLock *)v3 unlock];
}

- (void)mxSessionListBeginIteration
{
  [(NSLock *)[(MXCoreSession *)self mxSessionListReadLock] lock];
  [(MXCoreSession *)self setMxSessionListActiveReaders:[(MXCoreSession *)self mxSessionListActiveReaders] + 1];
  if ([(MXCoreSession *)self mxSessionListActiveReaders] == 1) {
    dispatch_semaphore_wait((dispatch_semaphore_t)[(MXCoreSession *)self mxSessionListWriteSemaphore], 0xFFFFFFFFFFFFFFFFLL);
  }
  v3 = [(MXCoreSession *)self mxSessionListReadLock];
  [(NSLock *)v3 unlock];
}

- (NSLock)mxSessionListReadLock
{
  return self->_mxSessionListReadLock;
}

- (unsigned)mxSessionListActiveReaders
{
  return self->_mxSessionListActiveReaders;
}

- (OS_dispatch_semaphore)mxSessionListWriteSemaphore
{
  return self->_mxSessionListWriteSemaphore;
}

- (void)setMxSessionListActiveReaders:(unsigned int)a3
{
  self->_mxSessionListActiveReaders = a3;
}

- (BOOL)isSharePlayCallSession
{
  return self->_isSharePlayCapableCallSession;
}

- (int)pidToInheritAppStateFrom
{
  return self->_pidToInheritAppStateFrom;
}

- (BOOL)waitingForEndInterruptionWhenDeviceUnlocksOrInForeground
{
  return self->_waitingToResume;
}

- (BOOL)wasInterruptedByNowPlayingApp
{
  return self->_wasInterruptedWhileSuspended;
}

- (BOOL)waitingToResumeWhenDeviceUnlocksOrInForeground
{
  return self->_waitingForEndInterruptionWhenDeviceUnlocksOrInForeground;
}

- (BOOL)stopsWhenDeviceLocks
{
  return self->_systemSoundHasModifiedCurrentlyControllingFlags;
}

- (void)setLastRouteSharingPolicySetByClient:(int)a3
{
  self->_lastRouteSharingPolicySetByClient = a3;
}

- (BOOL)isSharePlayMediaSession
{
  return self->_isSharePlayCallSession;
}

- (void)setStopsWhenDeviceLocks:(BOOL)a3
{
  self->_systemSoundHasModifiedCurrentlyControllingFlags = a3;
}

- (NSDictionary)preferredPersistentRoute
{
  return self->_preferredPersistentRoute;
}

- (BOOL)doesntActuallyPlayAudio
{
  return self->_defaultBuiltInRoutePreferenceSetByClient;
}

- (void)setPrefersToTakeHWControlFlagsFromAnotherSession:(BOOL)a3
{
  self->_dontTakeOverHardware = a3;
}

- (BOOL)isAllowedToPlayInBackground
{
  return self->_wantsAutomaticClusterPairingOnPlaybackStart;
}

- (void)setOverridePortsList:(id)a3
{
}

- (void)setIsLongFormAudio:(BOOL)a3
{
  self->_wantsToPauseSpokenAudio = a3;
}

- (void)setAllowedRouteTypes:(id)a3
{
}

- (void)setAllowedPortTypes:(id)a3
{
}

- (void)setAllowSystemSoundsWhileRecording:(BOOL)a3
{
  self->_allowMixableAudioWhileRecording = a3;
}

- (unsigned)clientPriority
{
  return self->_clientPriority;
}

- (BOOL)preferredDecoupledInputOutput
{
  return self->_requiresAggregatedInputOutput;
}

- (void)setWantsToBeVolumeButtonClient:(BOOL)a3
{
  self->_prefersNoInterruptionsByRingtonesAndAlerts = a3;
}

- (void)setAllowsDefaultBuiltInRouteCustomization:(BOOL)a3
{
  self->_areBothBudsInEarForA2DPPortBeforeInterrupting = a3;
}

- (void)setAllowsBluetoothRecordingCustomization:(BOOL)a3
{
  self->_allowsDefaultBuiltInRouteCustomization = a3;
}

- (BOOL)hasFetchedBackgroundPrivileges
{
  return self->_hasFetchedGPSPrivileges;
}

- (unsigned)hwControlFlags
{
  return self->_hwControlFlags;
}

- (void)setHwControlFlags:(unsigned int)a3
{
  self->_hwControlFlags = a3;
}

- (void)setMustUseDefaultClientPriority:(BOOL)a3
{
  self->_handsOverInterruptionsToInterruptor = a3;
}

- (void)setMakesMusicResume:(BOOL)a3
{
  self->_mustUseDefaultClientPriority = a3;
}

- (BOOL)mustUseDefaultClientPriority
{
  return self->_handsOverInterruptionsToInterruptor;
}

- (BOOL)isEligibleForBTTriangleConsideration
{
  return self->_isCameraRecordingExtension;
}

- (void)setHandsOverInterruptionsToInterruptor:(BOOL)a3
{
  self->_allowedToBeNowPlayingApp = a3;
}

- (BOOL)audioHWControlFlagsSetByClient
{
  return self->_routingContextSetByClient;
}

- (void)setPreferredIOBufferDuration:(float)a3
{
  self->_preferredIOBufferDuration = a3;
}

- (BOOL)hasEntitlementToShowMicrophoneIndicatorWhileNotRecording
{
  return self->_hasEntitlementToSetPreferredMinimumMicrophoneIndicatorLightOnTime;
}

- (BOOL)wantsToShowMicrophoneIndicatorWhenNotRecording
{
  return self->_prefersConcurrentAirPlayAudio;
}

- (BOOL)isRecordingMuted
{
  return self->_prefersBluetoothAccessoryMuting;
}

- (BOOL)auditTokenSetByClient
{
  return self->_duckToLevelScalarSetByClient;
}

- (NSNumber)preferredMinimumMicrophoneIndicatorLightOnTime
{
  return (NSNumber *)objc_getProperty(self, a2, 784, 1);
}

- (BOOL)hasEntitlementToSuppressRecordingStateToSystemStatus
{
  return self->_hasEntitlementToSupportProcessAssertionAuditTokens;
}

- (BOOL)isUsingCamera
{
  return self->_stopsWhenDeviceLocks;
}

- (void)setHasEntitlementToStartRecordingInTheBackground:(BOOL)a3
{
  self->_hasEntitlementToSuppressRecordingStateToSystemStatus = a3;
}

- (void)setHasEntitlementToSupportProcessAssertionAuditTokens:(BOOL)a3
{
  self->_hasEntitlementToRecordDuringCall = a3;
}

- (void)setHasEntitlementToRecordAudioInAnExtension:(BOOL)a3
{
  self->_hasEntitlementToStartRecordingInTheBackground = a3;
}

- (void)setHasFetchedBackgroundPrivileges:(BOOL)a3
{
  self->_hasFetchedGPSPrivileges = a3;
}

- (void)setIsAllowedToPlayInBackground:(BOOL)a3
{
  self->_wantsAutomaticClusterPairingOnPlaybackStart = a3;
}

- (void)setHasEntitlementToSuppressRecordingStateToSystemStatus:(BOOL)a3
{
  self->_hasEntitlementToSupportProcessAssertionAuditTokens = a3;
}

- (void)setHasEntitlementToSetPrefersToOptOutOfHardwareSafetyInterruptions:(BOOL)a3
{
  self->_doesGameAudioNeedToBeSpatialized = a3;
}

- (void)setHasEntitlementToSetPrefersNoInterruptions:(BOOL)a3
{
  self->_hasEntitlementToShowMicrophoneIndicatorWhileNotRecording = a3;
}

- (void)setHasEntitlementToSetPreferredMinimumMicrophoneIndicatorLightOnTime:(BOOL)a3
{
  self->_hasEntitlementToSetPrefersToOptOutOfHardwareSafetyInterruptions = a3;
}

- (void)setHasEntitlementToSetEmergencyAlertPriority:(BOOL)a3
{
  self->_hasEntitlementToSetPrefersNoInterruptions = a3;
}

- (void)setDoesGameAudioNeedToBeSpatialized:(BOOL)a3
{
  self->_bypassSystemSpatialAudioForGame = a3;
}

- (void)setBypassSystemSpatialAudioForGame:(BOOL)a3
{
  self->_isEligibleForNowPlayingAppConsideration = a3;
}

- (void)setIsSharedAVAudioSessionInstance:(BOOL)a3
{
  self->_prefersBeingInterruptedByNextActiveRecordingClient = a3;
}

- (void)setIsEligibleForNowPlayingAppConsideration:(BOOL)a3
{
  self->_prefersToOptOutOfHardwareSafetyInterruptions = a3;
}

- (void)setIsPiPPossible:(BOOL)a3
{
  self->_allowsBluetoothRecordingCustomization = a3;
}

- (void)setWantsToPauseSpokenAudio:(BOOL)a3
{
  self->_wantsVibrationNotifications = a3;
}

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
}

- (BOOL)allowedToBeNowPlayingApp
{
  return self->_isPiPPossible;
}

- (BOOL)isEligibleForNowPlayingAppConsideration
{
  return self->_prefersToOptOutOfHardwareSafetyInterruptions;
}

- (void)setAllowedToBeNowPlayingApp:(BOOL)a3
{
  self->_isPiPPossible = a3;
}

- (void)setSupportedOutputChannelLayouts:(id)a3
{
}

- (void)subscribeToNotifications:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(NSLock *)[(MXCoreSession *)self sessionPropertiesLock] lock];
  v5 = (void *)[MEMORY[0x1E4F1CA80] setWithSet:self->_notificationsSubscribedTo];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v5 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  self->_notificationsSubscribedTo = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:v5];
  [(NSLock *)[(MXCoreSession *)self sessionPropertiesLock] unlock];
}

- (void)setBadgeType:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(NSLock *)[(MXCoreSession *)self sessionPropertiesLock] lock];
  if ([(NSString *)self->_badgeType isEqualToString:a3])
  {
    v5 = [(MXCoreSession *)self sessionPropertiesLock];
    [(NSLock *)v5 unlock];
  }
  else
  {
    badgeType = self->_badgeType;

    self->_badgeType = (NSString *)a3;
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [(NSLock *)[(MXCoreSession *)self sessionPropertiesLock] unlock];
    if (badgeType) {
      CMSMNotificationUtility_PostBadgeTypeDidChange(self);
    }
  }
}

- (NSLock)sessionPropertiesLock
{
  return self->_sessionPropertiesLock;
}

- (void)setPlaybackAssertionRef:(id)a3
{
}

- (void)setHostProcessPlaybackAssertions:(id)a3
{
}

- (void)setSomeMXSessionIsPlaying:(BOOL)a3
{
  self->_clientIsPlaying = a3;
}

- (void)setPreferredInputSampleRate:(double)a3
{
  self->_preferredInputSampleRate = a3;
}

- (void)setDoNotNotifyOtherSessionsOnNextInactive:(BOOL)a3
{
  self->_wantsToSendResumableEndInterruptionWhenBackgrounded = a3;
}

- (void)setBundleIdToPAAccessIntervalMap:(id)a3
{
}

- (void)updateApplicationStateAndPIDToInheritAppStateFrom
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(MXCoreSessionBase *)self setApplicationState:0];
  uint64_t v3 = +[MXSystemController getPIDToInheritAppStateFromForPID:[(NSNumber *)[(MXCoreSessionBase *)self clientPID] intValue]];
  if (v3 != [(MXCoreSession *)self pidToInheritAppStateFrom])
  {
    int v4 = [(MXCoreSession *)self pidToInheritAppStateFrom];
    [(MXCoreSession *)self setPidToInheritAppStateFrom:v3];
    if ([(MXCoreSession *)self pidToInheritAppStateFrom] >= 1) {
      MX_RunningBoardServices_StartMonitoringForPID([(MXCoreSession *)self pidToInheritAppStateFrom]);
    }
    if (v4 >= 1)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if ([(MXCoreSession *)self pidToInheritAppStateFrom] < 1) {
    uint64_t v6 = [(NSNumber *)[(MXCoreSessionBase *)self clientPID] intValue];
  }
  else {
    uint64_t v6 = [(MXCoreSession *)self pidToInheritAppStateFrom];
  }
  [(MXCoreSessionBase *)self setApplicationState:MX_RunningBoardServices_GetApplicationStateForPID(v6, 0)];
}

- (void)setWasInterruptedWhileRecording:(BOOL)a3
{
  self->_wasRecordingBeforeBeingInterrupted = a3;
}

- (void)setWasActiveWhenDeviceOwnershipRelinquished:(BOOL)a3
{
  self->_shouldMuteBeAppliedToRemoteDevice = a3;
}

- (void)setWantsToShowMicrophoneIndicatorWhenNotRecording:(BOOL)a3
{
  self->_prefersConcurrentAirPlayAudio = a3;
}

- (void)setWantsAutomaticClusterPairingOnPlaybackStart:(BOOL)a3
{
  self->_isSharePlayMediaSession = a3;
}

- (void)setWaitingForRemoteInterruptionDoneIdentifier:(id)a3
{
}

- (void)setVibratingOSTransaction:(id)a3
{
  self->_vibratingOSTransaction = (OS_os_transaction *)a3;
}

- (void)setUnduckToLevelScalarSetByClient:(BOOL)a3
{
  self->_duckToLevelDBSetByClient = a3;
}

- (void)setUnduckToLevelScalar:(float)a3
{
  self->_unduckToLevelScalar = a3;
}

- (void)setUnduckFadeDurationSetByClient:(BOOL)a3
{
  self->_audioHWControlFlagsSetByClient = a3;
}

- (void)setTookControlOfStarkMainAudio:(BOOL)a3
{
  self->_duckCommandSentToCarSession = a3;
}

- (void)setTimestampWhenMostRecentlyInterrupted:(int64_t)a3
{
  self->_timestampWhenMostRecentlyInterrupted = a3;
}

- (void)setTimestampWhenMostRecentResumableEndInterruptionWasSent:(int64_t)a3
{
  self->_timestampWhenMostRecentResumableEndInterruptionWasSent = a3;
}

- (void)setSystemSoundHasModifiedCurrentlyControllingFlags:(BOOL)a3
{
  self->_makesMusicResume = a3;
}

- (void)setStarkBorrowCount:(unsigned int)a3
{
  self->_starkBorrowCount = a3;
}

- (void)setShouldMuteBeAppliedToRemoteDevice:(BOOL)a3
{
  self->_isRecordingMutedForRemoteDevice = a3;
}

- (void)setShadowingAudioSessionID:(unsigned int)a3
{
  self->_shadowingAudioSessionID = a3;
}

- (void)setSavedHWControlFlagsForClientThatDoesNotActuallyPlayAudio:(unsigned int)a3
{
  self->_savedHWControlFlagsForClientThatDoesNotActuallyPlayAudio = a3;
}

- (void)setResumeBackgroundAppUpdaterTimer:(id)a3
{
}

- (void)setResumeAssertionRef:(id)a3
{
}

- (void)setRecentlyWantedToPauseSpokenAudio:(BOOL)a3
{
  self->_waitingToSendEndInterruptionToSpokenAudioApp = a3;
}

- (void)setPrefersToVibeWhenVibrationsAreDisabled:(BOOL)a3
{
  self->_prefersToInterruptActiveRecordingSessions = a3;
}

- (void)setPrefersToOptOutOfHardwareSafetyInterruptions:(BOOL)a3
{
  self->_prefersToTakeHWControlFlagsFromAnotherSession = a3;
}

- (void)setPrefersToInterruptActiveRecordingSessions:(BOOL)a3
{
  self->_optOutOfMutePriority = a3;
}

- (void)setPrefersSuppressingRecordingState:(BOOL)a3
{
  self->_prefersToPlayDuringWombat = a3;
}

- (void)setPrefersSpeechDetectEnabled:(BOOL)a3
{
  self->_prefersInterruptionOnRouteDisconnect = a3;
}

- (void)setPrefersNoInterruptionsByRingtonesAndAlerts:(BOOL)a3
{
  self->_prefersNoInterruptionsByMixableSessions = a3;
}

- (void)setPrefersNoInterruptionsByMixableSessions:(BOOL)a3
{
  self->_prefersNoInterruptionsDuringRemoteDeviceControl = a3;
}

- (void)setPrefersNoInterruptionWhenSecureMicrophoneIsEngaged:(BOOL)a3
{
  self->_wantsToShowMicrophoneIndicatorWhenNotRecording = a3;
}

- (void)setPrefersNoDucking:(BOOL)a3
{
  self->_isIDSMXCoreSession = a3;
}

- (void)setPrefersMultichannelAudio:(BOOL)a3
{
  self->_enableBluetoothRecordingPreferenceSetByClient = a3;
}

- (void)setPrefersInterruptionOnRouteDisconnectSetByClient:(BOOL)a3
{
  self->_isSharedAVAudioSessionInstance = a3;
}

- (void)setPrefersInterruptionOnRouteDisconnect:(BOOL)a3
{
  self->_prefersInterruptionOnRouteDisconnectSetByClient = a3;
}

- (void)setPrefersEchoCancelledInput:(BOOL)a3
{
  self->_createSpeakerDevice = a3;
}

- (void)setPrefersConcurrentAirPlayAudio:(BOOL)a3
{
  self->_prefersSuppressingRecordingState = a3;
}

- (void)setPrefersBluetoothAccessoryMuting:(BOOL)a3
{
  self->_isVibrating = a3;
}

- (void)setPrefersBeingInterruptedByNextActiveRecordingClient:(BOOL)a3
{
  *(&self->_prefersBeingInterruptedByNextActiveRecordingClient + 1) = a3;
}

- (void)setPreferredStereoInputOrientation:(int)a3
{
  self->_preferredStereoInputOrientation = a3;
}

- (void)setPreferredPersistentRoute:(id)a3
{
}

- (void)setPreferredOutputSampleRateSetByClient:(BOOL)a3
{
  self->_preferredDecoupledInputOutput = a3;
}

- (void)setPreferredOutputSampleRate:(double)a3
{
  self->_preferredOutputSampleRate = a3;
}

- (void)setPreferredMinimumMicrophoneIndicatorLightOnTime:(id)a3
{
}

- (void)setPreferredHardwareFormat:(id)a3
{
}

- (void)setPowerProfile:(id)a3
{
}

- (void)setPidToInheritAppStateFrom:(int)a3
{
  self->_pidToInheritAppStateFrom = a3;
}

- (void)setParentProcessAuditTokens:(id)a3
{
}

- (void)setOrientationOverride:(unsigned int)a3
{
  self->_orientationOverride = a3;
}

- (void)setOptOutOfMutePriority:(BOOL)a3
{
  self->_prefersNoDucking = a3;
}

- (void)setNowPlayingAppWasStoppedOnMostRecentActivation:(BOOL)a3
{
  self->_nowPlayingAppThatWasStoppedOnMostRecentActivationWasDoingSpokenAudio = a3;
}

- (void)setNowPlayingAppThatWasStoppedOnMostRecentActivationWasDoingSpokenAudio:(BOOL)a3
{
  self->_isActiveOverAirPlayVideo = a3;
}

- (void)setNotFullyInactive:(BOOL)a3
{
  self->_someMXSessionIsPlaying = a3;
}

- (void)setNeedsAudioBudget:(BOOL)a3
{
  self->_isLongFormAudio = a3;
}

- (void)setIsSharePlayMediaSession:(BOOL)a3
{
  self->_isSharePlayCallSession = a3;
}

- (void)setIsSharePlayCapableCallSession:(BOOL)a3
{
  self->_allowSystemSoundsWhileRecording = a3;
}

- (void)setIsSharePlayCallSession:(BOOL)a3
{
  self->_isSharePlayCapableCallSession = a3;
}

- (void)setIsShadowSessionForFigSBAR:(BOOL)a3
{
  self->_isAudioSession = a3;
}

- (void)setIsRecordingMutedForRemoteDevice:(BOOL)a3
{
  self->_hasEntitlementToRecordAudioInAnExtension = a3;
}

- (void)setIsRecordingMuted:(BOOL)a3
{
  self->_prefersBluetoothAccessoryMuting = a3;
}

- (void)setIsPlayingOutput:(BOOL)a3
{
  self->_isRecordingMuted = a3;
}

- (void)setIsHardwareSafetySession:(BOOL)a3
{
  self->_isCarSession = a3;
}

- (void)setIsEligibleForBTTriangleConsideration:(BOOL)a3
{
  self->_isCameraRecordingExtension = a3;
}

- (void)setIsAirPlayReceiverSession:(BOOL)a3
{
  self->_isInterruptionCalledOffAudioControlQueue = a3;
}

- (void)setInterruptionFadeDurationSetByClient:(BOOL)a3
{
  self->_duckFadeDurationSetByClient = a3;
}

- (void)setHostProcessAttribution:(id)a3
{
}

- (void)setHasGPSPrivileges:(BOOL)a3
{
  self->_isAllowedToPlayInBackground = a3;
}

- (void)setHasEntitlementToShowMicrophoneIndicatorWhileNotRecording:(BOOL)a3
{
  self->_hasEntitlementToSetPreferredMinimumMicrophoneIndicatorLightOnTime = a3;
}

- (void)setHasEntitlementToRecordDuringCall:(BOOL)a3
{
  self->_hasEntitlementToSetEmergencyAlertPriority = a3;
}

- (void)setHapticEngineIsPlaying:(BOOL)a3
{
  self->_isAirPlayReceiverSession = a3;
}

- (void)setForceSoundCheck:(BOOL)a3
{
  self->_wantsToBeVolumeButtonClient = a3;
}

- (void)setExtendBackgroundAppAssertionTimer:(id)a3
{
}

- (void)setExcludedPortsList:(id)a3
{
}

- (void)setDuckingSourceList:(id)a3
{
}

- (void)setDuckToLevelScalarSetByClient:(BOOL)a3
{
  self->_unduckToLevelScalarSetByClient = a3;
}

- (void)setDuckToLevelScalar:(float)a3
{
  self->_duckToLevelScalar = a3;
}

- (void)setDuckToLevelDBSetByClient:(BOOL)a3
{
  self->_wasActiveWhenDeviceOwnershipRelinquished = a3;
}

- (void)setDuckToLevelDB:(float)a3
{
  self->_duckToLevelDB = a3;
}

- (void)setDuckFadeDurationSetByClient:(BOOL)a3
{
  self->_unduckFadeDurationSetByClient = a3;
}

- (void)setDuckCommandSentToCarSession:(BOOL)a3
{
  self->_triggeredRemoteInterruption = a3;
}

- (void)setDoesntActuallyPlayAudio:(BOOL)a3
{
  self->_defaultBuiltInRoutePreferenceSetByClient = a3;
}

- (void)setDesiredInputGainScalar:(id)a3
{
}

- (void)setDeactivateTimerDelay:(int)a3
{
  self->_deactivateTimerDelay = a3;
}

- (void)setClientIsPlaying:(BOOL)a3
{
  self->_hapticEngineIsPlaying = a3;
}

- (void)setAssertionAuditTimerDelay:(unsigned int)a3
{
  self->_assertionAuditTimerDelay = a3;
}

- (void)setAreBothBudsInEarForA2DPPortBeforeInterrupting:(BOOL)a3
{
  self->_wasInterruptedByNowPlayingApp = a3;
}

- (void)setAllowMixableAudioWhileRecording:(BOOL)a3
{
  self->_prefersNoInterruptionWhenSecureMicrophoneIsEngaged = a3;
}

- (void)setAggregateDeviceClockUID:(id)a3
{
}

- (void)setAddSharedAudioRouteToRoutablePorts:(BOOL)a3
{
  self->_hasFetchedBackgroundPrivileges = a3;
}

- (BOOL)hasEntitlementToRecordAudioInAnExtension
{
  return self->_hasEntitlementToStartRecordingInTheBackground;
}

- (NSArray)allowedPortTypes
{
  return (NSArray *)objc_getProperty(self, a2, 712, 1);
}

- (NSDictionary)activationContext
{
  return (NSDictionary *)objc_getProperty(self, a2, 696, 1);
}

- (BOOL)allowsDefaultBuiltInRouteCustomization
{
  return self->_areBothBudsInEarForA2DPPortBeforeInterrupting;
}

- (BOOL)allowsBluetoothRecordingCustomization
{
  return self->_allowsDefaultBuiltInRouteCustomization;
}

- (id)defaultBuiltInRouteToUse
{
  if ([(MXCoreSession *)self defaultBuiltInRoutePreferenceSetByClient])
  {
    return [(MXCoreSession *)self defaultBuiltInRoutePreference];
  }
  else
  {
    int v4 = [(MXCoreSession *)self mode];
    return CMSMUtility_GetDefaultBuiltInRouteSettingForMode(v4);
  }
}

- (BOOL)defaultBuiltInRoutePreferenceSetByClient
{
  return self->_prefersSpeechDetectEnabled;
}

- (BOOL)shouldEnableBluetoothRecording
{
  if ([(MXCoreSession *)self enableBluetoothRecordingPreferenceSetByClient])
  {
    return [(MXCoreSessionBase *)self enableBluetoothRecordingPreference];
  }
  else
  {
    DefaultEnableBluetoothRecordingSettingForMode = (void *)CMSMUtility_GetDefaultEnableBluetoothRecordingSettingForMode([(MXCoreSession *)self mode]);
    return [DefaultEnableBluetoothRecordingSettingForMode BOOLValue];
  }
}

- (unsigned)mode
{
  return self->_mode;
}

- (BOOL)enableBluetoothRecordingPreferenceSetByClient
{
  return self->_isEligibleForBTTriangleConsideration;
}

- (BOOL)prefersEchoCancelledInput
{
  return self->_createSpeakerDevice;
}

- (NSDictionary)preferredRouteControlFeatures
{
  return (NSDictionary *)objc_getProperty(self, a2, 792, 1);
}

- (NSString)defaultBuiltInRoutePreference
{
  return (NSString *)objc_getProperty(self, a2, 736, 1);
}

- (NSString)siriInputDeviceUUID
{
  return (NSString *)objc_getProperty(self, a2, 800, 1);
}

- (int)updateInterruptionStyle:(unsigned int)a3
{
  if (a3 == 2) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = a3;
  }
  int v5 = -12981;
  if (v4 <= 0x20)
  {
    if (((1 << v4) & 0x10112) != 0)
    {
      [(MXCoreSessionBase *)self setInterruptionStyle:v4];
      BOOL v6 = v4 == 16;
    }
    else
    {
      if (v4 != 32) {
        goto LABEL_8;
      }
      if (![(MXCoreSession *)self duckToLevelScalarSetByClient])
      {
        LODWORD(v10) = 1045220557;
        [(MXCoreSession *)self setDuckToLevelScalar:v10];
      }
      if (![(MXCoreSession *)self duckToLevelDBSetByClient])
      {
        LODWORD(v11) = -1038090240;
        [(MXCoreSession *)self setDuckToLevelDB:v11];
      }
      if (![(MXCoreSession *)self unduckToLevelScalarSetByClient])
      {
        LODWORD(v12) = 1045220557;
        [(MXCoreSession *)self setUnduckToLevelScalar:v12];
      }
      if (![(MXCoreSession *)self duckFadeDurationSetByClient])
      {
        LODWORD(v13) = 0.5;
        [(MXCoreSession *)self setDuckFadeDuration:v13];
      }
      if (![(MXCoreSession *)self unduckFadeDurationSetByClient])
      {
        LODWORD(v14) = 0.5;
        [(MXCoreSession *)self setUnduckFadeDuration:v14];
      }
      if ([(MXCoreSessionBase *)self audioCategory]
        && CFEqual([(MXCoreSessionBase *)self audioCategory], @"VoiceOver"))
      {
        *(float *)&double v15 = CMSMUtility_GetVoiceOverDuckFadeDuration();
        [(MXCoreSession *)self setDuckFadeDuration:v15];
        *(float *)&double v16 = CMSMUtility_GetVoiceOverDuckFadeDuration();
        [(MXCoreSession *)self setUnduckFadeDuration:v16];
      }
      [(MXCoreSessionBase *)self setInterruptionStyle:32];
      BOOL v6 = 1;
    }
    [(MXCoreSessionBase *)self setMixesWithEveryone:v6];
    int v5 = 0;
  }
LABEL_8:
  CMSMNP_UpdateNowPlayingAppForNewInterruptionStyle(self);
  uint64_t v7 = self;
  uint64_t v8 = MXGetNotificationSenderQueue();
  MXDispatchAsyncFunction((uint64_t)"-[MXCoreSession updateInterruptionStyle:]", (uint64_t)"MXCoreSession.m", 1261, 0, 0, v8, (uint64_t)self, (uint64_t)CMSMNotificationUtility_PostSessionAudioBehaviourDidChange_f);
  return v5;
}

- (int)routeSharingPolicy
{
  return self->_routeSharingPolicy;
}

- (int)setUpDefaultInterruptionStyleForCategoryAndMode
{
  [(MXCoreSessionBase *)self setMixesWithEveryone:0];
  [(MXCoreSessionBase *)self setInterruptionStyleSetByClient:0];
  if (![(MXCoreSessionBase *)self audioCategory]) {
    goto LABEL_11;
  }
  if (CFEqual([(MXCoreSessionBase *)self audioCategory], @"UserInterfaceSoundEffects")
    || CFEqual([(MXCoreSessionBase *)self audioCategory], @"AmbientSound")
    || [+[MXSessionManager sharedInstance] isSpeechDetectCategory:[(MXCoreSessionBase *)self audioCategory]])
  {
    goto LABEL_5;
  }
  if (CFEqual([(MXCoreSessionBase *)self audioCategory], @"MediaPlayback")
    || CFEqual([(MXCoreSessionBase *)self audioCategory], @"MediaPlaybackNoSpeaker")
    || CFEqual([(MXCoreSessionBase *)self audioCategory], @"LiveAudio")
    || CFEqual([(MXCoreSessionBase *)self audioCategory], @"AudioProcessing")
    || CFEqual([(MXCoreSessionBase *)self audioCategory], @"SoloAmbientSound"))
  {
    goto LABEL_11;
  }
  if (CFEqual([(MXCoreSessionBase *)self audioCategory], @"Notice")
    || CFEqual([(MXCoreSessionBase *)self audioCategory], @"VoiceOver"))
  {
LABEL_15:
    [(MXCoreSessionBase *)self setMixesWithEveryone:1];
    uint64_t v3 = 32;
    goto LABEL_12;
  }
  if (CFEqual([(MXCoreSessionBase *)self audioCategory], @"VoiceCommand")
    || CFEqual([(MXCoreSessionBase *)self audioCategory], @"VoiceCommand_WithBluetooth"))
  {
LABEL_18:
    uint64_t v3 = 4;
    goto LABEL_12;
  }
  if (CFEqual([(MXCoreSessionBase *)self audioCategory], @"VoiceCommandThatMixes")
    || CFEqual([(MXCoreSessionBase *)self audioCategory], @"VoiceCommandThatMixes_WithBluetooth"))
  {
    goto LABEL_15;
  }
  if (CFEqual([(MXCoreSessionBase *)self audioCategory], @"Record")
    || CFEqual([(MXCoreSessionBase *)self audioCategory], @"Record_WithBluetooth")
    || CFEqual([(MXCoreSessionBase *)self audioCategory], @"PlayAndRecord")
    || CFEqual([(MXCoreSessionBase *)self audioCategory], @"PlayAndRecord_WithBluetooth")
    || CFEqual([(MXCoreSessionBase *)self audioCategory], @"PlayAndRecord_NoBluetooth_DefaultToSpeaker")|| CFEqual([(MXCoreSessionBase *)self audioCategory], @"PlayAndRecord_WithBluetooth_DefaultToSpeaker")|| CFEqual([(MXCoreSessionBase *)self audioCategory], @"Multi"))
  {
    if ([(MXCoreSessionBase *)self hasAudioMode:@"EchoCancellationInput"]) {
      uint64_t v3 = 16;
    }
    else {
      uint64_t v3 = 8;
    }
  }
  else
  {
    if (CMSUtility_HasPhoneCallBehaviour(self)) {
      goto LABEL_11;
    }
    if (CFEqual([(MXCoreSessionBase *)self audioCategory], @"Ringtone")) {
      goto LABEL_18;
    }
    if (!CFEqual([(MXCoreSessionBase *)self audioCategory], @"Alarm"))
    {
      if (!CFEqual([(MXCoreSessionBase *)self audioCategory], @"RingtonePreview")
        && !CFEqual([(MXCoreSessionBase *)self audioCategory], @"FindMyPhone")
        && !CFEqual([(MXCoreSessionBase *)self audioCategory], @"WaterEjection")
        && !CFEqual([(MXCoreSessionBase *)self audioCategory], @"EmergencyAlert")
        && !CFEqual([(MXCoreSessionBase *)self audioCategory], @"EmergencyAlert_Muteable"))
      {
        if (CFEqual([(MXCoreSessionBase *)self audioCategory], @"Voicemail")
          || CFEqual([(MXCoreSessionBase *)self audioCategory], @"VoicemailGreeting"))
        {
          goto LABEL_11;
        }
        if (!CFEqual([(MXCoreSessionBase *)self audioCategory], @"FindMyAudioDevice"))
        {
          if (CFEqual([(MXCoreSessionBase *)self audioCategory], @"SystemSoundsAndHaptics"))
          {
LABEL_5:
            [(MXCoreSessionBase *)self setMixesWithEveryone:1];
            uint64_t v3 = 16;
            goto LABEL_12;
          }
          if (!CFEqual([(MXCoreSessionBase *)self audioCategory], @"eARC")) {
            CFEqual([(MXCoreSessionBase *)self audioCategory], @"HearingTest");
          }
LABEL_11:
          uint64_t v3 = 8;
          goto LABEL_12;
        }
      }
      goto LABEL_18;
    }
    if (CFEqual([(MXCoreSessionBase *)self audioMode], @"Sleep")) {
      uint64_t v3 = 8;
    }
    else {
      uint64_t v3 = 4;
    }
  }
LABEL_12:
  [(MXCoreSession *)self updateInterruptionStyle:v3];
  return 0;
}

- (BOOL)routingContextSetByClient
{
  return self->_auditTokenSetByClient;
}

- (void)updateRouteSharingPolicy:(int)a3 setByClient:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  [(MXCoreSession *)self setRouteSharingPolicy:"setRouteSharingPolicy:"];
  if (v4)
  {
    [(MXCoreSession *)self setLastRouteSharingPolicySetByClient:v5];
  }
}

- (void)setRouteSharingPolicy:(int)a3
{
  self->_routeSharingPolicy = a3;
}

- (BOOL)willRouteToOnDemandVADOnActivation
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [(MXCoreSessionBase *)self additiveRoutingInfo];
  if (v2)
  {
    char v5 = 0;
    if (CMSMVAUtility_WillSessionWithDescriptionRouteToOnDemandVADOnActivation((uint64_t)v2, &v5)
      || dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    LOBYTE(v2) = v5 != 0;
  }
  return (char)v2;
}

- (BOOL)isHardwareSafetySession
{
  return self->_isCarSession;
}

- (BOOL)isIDSMXCoreSession
{
  return self->_isHardwareSafetySession;
}

- (BOOL)wantsVolumeChangesWhenPausedOrInactive
{
  return self->_ignoreRingerSwitch;
}

- (BOOL)isSharePlayCapableCallSession
{
  return self->_allowSystemSoundsWhileRecording;
}

- (BOOL)mutesAudioBasedOnRingerSwitchState
{
  return self->_wantsVolumeChangesWhenPaused;
}

- (BOOL)wantsToBeVolumeButtonClient
{
  return self->_prefersNoInterruptionsByRingtonesAndAlerts;
}

- (BOOL)wantsVolumeChangesWhenPaused
{
  return self->_wantsVolumeChangesWhenPausedOrInactive;
}

- (BOOL)silentMuted
{
  return self->_isDucked;
}

- (BOOL)isDucked
{
  return self->_duckedOnVAD;
}

- (BOOL)allowSystemSoundsWhileRecording
{
  return self->_allowMixableAudioWhileRecording;
}

- (BOOL)idleSleepPreventorAllocated
{
  return self->_silentMuted;
}

- (void)updateCameraExtensionFlagsIfNeeded
{
  id v3 = (id)MX_RunningBoardServices_CopyBundleExtensionPointID(self);
  -[MXCoreSession setIsCameraRecordingExtension:](self, "setIsCameraRecordingExtension:", [v3 isEqualToString:@"com.apple.securecapture"]);
}

- (void)setIsCameraRecordingExtension:(BOOL)a3
{
  self->_userMuted = a3;
}

- (NSArray)hostProcessAttribution
{
  return (NSArray *)objc_getProperty(self, a2, 488, 1);
}

- (BOOL)isPiPPossible
{
  return self->_allowsBluetoothRecordingCustomization;
}

- (void)setDoNotResetAudioCategoryOnNextInactive:(BOOL)a3
{
  self->_doNotNotifyOtherSessionsOnNextInactive = a3;
}

- (void)setSavedCurrentlyControllingFlags:(unsigned int)a3
{
  self->_savedCurrentlyControllingFlags = a3;
}

- (unsigned)currentlyControllingFlags
{
  return self->_currentlyControllingFlags;
}

- (BOOL)isCameraRecordingExtension
{
  return self->_userMuted;
}

- (void)updatePreferredIOBufferFrames:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(MXCoreSession *)self preferredIOBufferFrames] != a3)
  {
    [(MXCoreSession *)self setPreferredIOBufferFrames:v3];
  }
}

- (BOOL)prefersToTakeHWControlFlagsFromAnotherSession
{
  return self->_dontTakeOverHardware;
}

- (BOOL)wasMutedBeforeInterruption
{
  return self->_nowPlayingAppWasStoppedOnMostRecentActivation;
}

- (NSString)waitingForRemoteInterruptionDoneIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 560, 1);
}

- (BOOL)shouldAttemptSmartRoutingHijackForMusicApp
{
  BOOL v3 = [(NSString *)[(MXCoreSessionBase *)self displayID] isEqualToString:@"com.apple.Music"];
  if (v3)
  {
    BOOL v3 = [(MXCoreSession *)self isSharedAVAudioSessionInstance];
    if (v3)
    {
      if ([(MXCoreSessionBase *)self hasAudioCategory:@"MediaPlayback"])
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        LOBYTE(v3) = [(MXCoreSessionBase *)self hasAudioCategory:@"MediaPlaybackNoSpeaker"];
      }
    }
  }
  return v3;
}

- (void)setWasMutedBeforeInterruption:(BOOL)a3
{
  self->_nowPlayingAppWasStoppedOnMostRecentActivation = a3;
}

- (void)setCurrentlyControllingFlags:(unsigned int)a3
{
  self->_currentlyControllingFlags = a3;
}

- (int)preferredStereoInputOrientation
{
  return self->_preferredStereoInputOrientation;
}

- (unsigned)orientationOverride
{
  return self->_orientationOverride;
}

- (BOOL)disallowAudioFormatChanges
{
  return self->_prefersMultichannelAudio;
}

- (void)updatePreferredIOBufferDuration:(float)a3
{
  [(MXCoreSession *)self preferredIOBufferDuration];
  if (*(float *)&v5 != a3)
  {
    *(float *)&double v5 = a3;
    [(MXCoreSession *)self setPreferredIOBufferDuration:v5];
  }
}

- (float)preferredIOBufferDuration
{
  return self->_preferredIOBufferDuration;
}

- (int)preferredIOBufferFrames
{
  return self->_preferredIOBufferFrames;
}

- (double)preferredOutputSampleRate
{
  return self->_preferredOutputSampleRate;
}

- (double)getPreferredOutputSampleRatePointer
{
  return &self->_preferredOutputSampleRate;
}

- (int)getPreferredIOBufferFramesPointer
{
  return &self->_preferredIOBufferFrames;
}

- (BOOL)isSharedAVAudioSessionInstance
{
  return self->_prefersBeingInterruptedByNextActiveRecordingClient;
}

- (double)preferredInputSampleRate
{
  return self->_preferredInputSampleRate;
}

- (MXCoreSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)MXCoreSession;
  v2 = [(MXCoreSessionBase *)&v5 init];
  if (v2)
  {
    v2->_mxSessionList = (NSPointerArray *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:5];
    v2->_mxSessionListActiveReaders = 0;
    v2->_mxSessionListReadLock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v2->_mxSessionListWriteSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v2->_sessionPropertiesLock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    objc_initWeak(&location, v2);
    [+[MXSessionManager sharedInstance] mxCoreSessionListAddSession:objc_loadWeak(&location)];
    v2->_doesInterAppAudio = 0;
    v2->_notificationsSubscribedTo = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (unint64_t)mxSessionListAddSession:(id)a3
{
  objc_initWeak(&location, a3);
  dispatch_semaphore_wait((dispatch_semaphore_t)[(MXCoreSession *)self mxSessionListWriteSemaphore], 0xFFFFFFFFFFFFFFFFLL);
  [(NSPointerArray *)[(MXCoreSession *)self mxSessionList] addPointer:objc_loadWeak(&location)];
  [(NSPointerArray *)[(MXCoreSession *)self mxSessionList] compact];
  unint64_t v4 = [(NSPointerArray *)[(MXCoreSession *)self mxSessionList] count];
  dispatch_semaphore_signal((dispatch_semaphore_t)[(MXCoreSession *)self mxSessionListWriteSemaphore]);
  objc_destroyWeak(&location);
  return v4;
}

- (BOOL)userMuted
{
  return self->_mutesAudioBasedOnRingerSwitchState;
}

- (BOOL)isActiveOverAirPlayVideo
{
  return self->_isAudioOnlyAirPlayVideoActive;
}

- (void)setDefaultVPChatMode:(id)a3
{
}

- (void)setDefaultBuiltInRoutePreferenceSetByClient:(BOOL)a3
{
  self->_prefersSpeechDetectEnabled = a3;
}

- (void)setDefaultBuiltInRoutePreference:(id)a3
{
}

- (NSArray)subPortPreferences
{
  return (NSArray *)objc_getProperty(self, a2, 808, 1);
}

- (void)setSubPortPreferences:(id)a3
{
}

- (BOOL)hapticEngineIsPlaying
{
  return self->_isAirPlayReceiverSession;
}

- (BOOL)someMXSessionIsPlaying
{
  return self->_clientIsPlaying;
}

- (BOOL)clientIsPlaying
{
  return self->_hapticEngineIsPlaying;
}

- (BOOL)prefersConcurrentAirPlayAudio
{
  return self->_prefersSuppressingRecordingState;
}

- (NSString)badgeType
{
  [(NSLock *)[(MXCoreSession *)self sessionPropertiesLock] lock];
  BOOL v3 = self->_badgeType;
  [(NSLock *)[(MXCoreSession *)self sessionPropertiesLock] unlock];
  return v3;
}

- (NSArray)overridePortsList
{
  return (NSArray *)objc_getProperty(self, a2, 760, 1);
}

- (NSDictionary)cameraParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 728, 1);
}

- (BOOL)willSetScreenDarkModeOnVAD
{
  return self->_addSharedAudioRouteToRoutablePorts;
}

- (NSDictionary)vpBlockConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 832, 1);
}

- (void)setWillSetScreenDarkModeOnVAD:(BOOL)a3
{
  self->_addSharedAudioRouteToRoutablePorts = a3;
}

- (BOOL)ignoreRingerSwitch
{
  return self->_forceSoundCheck;
}

- (NSArray)excludedPortsList
{
  return (NSArray *)objc_getProperty(self, a2, 752, 1);
}

- (BOOL)createSpeakerDevice
{
  return self->_disallowAudioFormatChanges;
}

- (NSString)aggregateDeviceClockUID
{
  return (NSString *)objc_getProperty(self, a2, 704, 1);
}

- (BOOL)addSharedAudioRouteToRoutablePorts
{
  return self->_hasFetchedBackgroundPrivileges;
}

- (id)copyDetailedRouteDescription
{
  id v3 = [+[MXAdditiveRoutingManager sharedInstance] copyDetailedRouteDescription:CMSUtility_GetCurrentOutputVADID(self)];
  unint64_t v4 = (void *)[v3 mutableCopy];

  if ([(MXCoreSessionBase *)self hasInput])
  {
    id v5 = [+[MXAdditiveRoutingManager sharedInstance] copyDetailedRouteDescription:CMSUtility_GetCurrentInputVADID(self)];
    uint64_t v6 = [v5 objectForKey:@"RouteDetailedDescription_Inputs"];
    if (v6) {
      [v4 setObject:v6 forKey:@"RouteDetailedDescription_Inputs"];
    }
    if (!v5)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (vaemIsContinuityScreenOutputPortPresentInConnectedOutputPorts())
  {
    id v8 = [(MXCoreSession *)self copyDetailedRouteDescriptionForContinuityScreenOutput:v4];

    return v8;
  }
  return v4;
}

- (RBSAssertion)playbackAssertionRef
{
  return (RBSAssertion *)objc_getProperty(self, a2, 544, 1);
}

- (NSArray)parentProcessAuditTokens
{
  return (NSArray *)objc_getProperty(self, a2, 536, 1);
}

- (NSDictionary)hostProcessPlaybackAssertions
{
  return (NSDictionary *)objc_getProperty(self, a2, 496, 1);
}

- (void)setIsInterruptionCalledOffAudioControlQueue:(BOOL)a3
{
  self->_isPlayingOutput = a3;
}

- (BOOL)isInterruptionCalledOffAudioControlQueue
{
  return self->_isPlayingOutput;
}

- (BOOL)prefersNoInterruptionsByRingtonesAndAlerts
{
  return self->_prefersNoInterruptionsByMixableSessions;
}

- (BOOL)prefersInterruptionOnRouteDisconnectSetByClient
{
  return self->_isSharedAVAudioSessionInstance;
}

- (BOOL)wasActiveWhenDeviceOwnershipRelinquished
{
  return self->_shouldMuteBeAppliedToRemoteDevice;
}

- (void)setWasInterruptedWhileSuspended:(BOOL)a3
{
  self->_wasInterruptedWhileRecording = a3;
}

- (void)setWaitingToResume:(BOOL)a3
{
  self->_needToEndInterruption = a3;
}

- (void)setIsPlayingStopTime:(id)a3
{
}

- (void)setInterruptingSession:(id)a3
{
  self->_interruptingSession = (MXCoreSession *)a3;
}

- (void)setIdleSleepPreventorUpdaterTimer:(id)a3
{
}

- (OS_dispatch_source)idleSleepPreventorUpdaterTimer
{
  return self->_idleSleepPreventorUpdaterTimer;
}

- (void)setEnableBluetoothRecordingPreferenceSetByClient:(BOOL)a3
{
  self->_isEligibleForBTTriangleConsideration = a3;
}

- (void)setAuditTokenSetByClient:(BOOL)a3
{
  self->_duckToLevelScalarSetByClient = a3;
}

- (void)setIsAudioSession:(BOOL)a3
{
  self->_isFigInstantiatedAudioSession = a3;
}

- (void)setIsUsingCamera:(BOOL)a3
{
  self->_stopsWhenDeviceLocks = a3;
}

- (BOOL)isRecordingMutedForRemoteDevice
{
  return self->_hasEntitlementToRecordAudioInAnExtension;
}

- (int)setInterruptionStyleAtClientRequest:(unsigned int)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = *(void *)&a3;
    if ([(MXCoreSessionBase *)self interruptionStyle] == a3)
    {
      [(MXCoreSessionBase *)self setInterruptionStyleSetByClient:1];
      return 0;
    }
    if ([(MXCoreSessionBase *)self audioCategory]) {
      uint64_t v7 = [+[MXSessionManager sharedInstance] getUncustomizedCategory:[(MXCoreSessionBase *)self audioCategory]];
    }
    else {
      uint64_t v7 = @"Audio/Video";
    }
    BOOL v8 = [(MXCoreSessionBase *)self mixesWithEveryone];
    unsigned int v9 = [(MXCoreSessionBase *)self interruptionStyle];
    BOOL v10 = [(MXCoreSessionBase *)self interruptionStyleSetByClient];
    uint64_t v11 = [(MXCoreSessionBase *)self interruptionStyle];
    unsigned int LocalSessionPriority = CMSM_GetLocalSessionPriority(self, 1);
    if (v4 == 32 || v4 == 16)
    {
      if (!FigCFEqual()
        && !FigCFEqual()
        && !FigCFEqual()
        && !FigCFEqual()
        && !FigCFEqual()
        && !FigCFEqual()
        && !FigCFEqual()
        && !FigCFEqual()
        && !FigCFEqual())
      {
LABEL_27:
        if (!FigCFEqual()
          && !CMSMUtility_IsEmergencyAlertCategory((unint64_t)v7)
          && !FigCFEqual()
          && (!CMSMDeviceState_ItsAHomePod() || !FigCFEqual())
          && ![+[MXSessionManager sharedInstance] isSpeechDetectCategory:v7]&& !FigCFEqual())
        {
          return 0;
        }
      }
    }
    else if (!FigCFEqual() {
           && !FigCFEqual()
    }
           && !FigCFEqual()
           && !FigCFEqual())
    {
      goto LABEL_27;
    }
    int v5 = [(MXCoreSession *)self updateInterruptionStyle:v4];
    if (v5) {
      return v5;
    }
    [(MXCoreSessionBase *)self setInterruptionStyleSetByClient:1];
    unsigned int v13 = [(MXCoreSessionBase *)self interruptionStyle];
    if ([(MXCoreSessionBase *)self isActive])
    {
      BOOL v14 = [(MXCoreSessionBase *)self mixesWithEveryone];
      if (!v8 || v14)
      {
        cmsTryToTakeControl(self);
      }
      else if (cmsBeginInterruptionGuts(self, 0, 2))
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        int v5 = [(MXCoreSession *)self updateInterruptionStyle:v11];
        [(MXCoreSessionBase *)self setInterruptionStyleSetByClient:v10];
        return v5;
      }
      [+[MXSessionManager sharedInstance] mxCoreSessionListBeginIteration];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      double v16 = [+[MXSessionManager sharedInstance] mxCoreSessionList];
      uint64_t v17 = [(NSPointerArray *)v16 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(MXCoreSession **)(*((void *)&v29 + 1) + 8 * i);
            if (v21 != self && [(MXCoreSessionBase *)v21 isActive])
            {
              [+[MXSessionManager sharedInstance] mxCoreSessionListEndIteration];
              if ((v9 == 32) == (v13 == 32)
                || ![+[MXSessionManager sharedInstance] voiceOverSessionWantsRelativeDucking:self])
              {
                BOOL v25 = v9 != 32;
                if (v9 == 32 || v13 != 32)
                {
                  if (v13 == 32) {
                    BOOL v25 = 1;
                  }
                  if (!v25) {
                    [+[MXSessionManager sharedInstance] unduckSessionsForDucker:self];
                  }
                }
                else
                {
                  CFArrayRef v26 = CMSUtility_CopySessionsToDuck(1, 0, (const __CFArray *)self);
                  [+[MXSessionManager sharedInstance] duckSessionsForDucker:self sessionsToDuck:v26];
                  if (v26) {
                    [(MXCoreSession *)self setNeedToEndInterruption:1];
                  }
                }
              }
              else
              {
                if (dword_1E9359ED0)
                {
                  unsigned int v34 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  unsigned int v23 = v34;
                  if (os_log_type_enabled(v22, type)) {
                    unsigned int v24 = v23;
                  }
                  else {
                    unsigned int v24 = v23 & 0xFFFFFFFE;
                  }
                  if (v24)
                  {
                    int v36 = 136315650;
                    v37 = "-[MXCoreSession setInterruptionStyleAtClientRequest:]";
                    __int16 v38 = 1024;
                    BOOL v39 = v9 == 32;
                    __int16 v40 = 1024;
                    BOOL v41 = v13 == 32;
                    LODWORD(v28) = 24;
                    v27 = &v36;
                    _os_log_send_and_compose_impl();
                  }
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
                [+[MXSessionManager sharedInstance] startAsyncDuckingOperation];
                [+[MXSessionManager sharedInstance] updateDuckedSessionsForVoiceOver:self];
                [+[MXSessionManager sharedInstance] endAsyncDuckingOperation];
              }
              goto LABEL_67;
            }
          }
          uint64_t v18 = [(NSPointerArray *)v16 countByEnumeratingWithState:&v29 objects:v35 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
      [+[MXSessionManager sharedInstance] mxCoreSessionListEndIteration];
LABEL_67:
      CMSUtility_RouteToPreferredRouteIfRequired(self, LocalSessionPriority, 4);
    }
    return 0;
  }
  -[MXCoreSessionBase setInterruptionStyleSetByClient:](self, "setInterruptionStyleSetByClient:");
  return [(MXCoreSession *)self setUpDefaultBehavioursForCategoryAtClientRequest];
}

- (void)setRoutingContextSetByClient:(BOOL)a3
{
  self->_auditTokenSetByClient = a3;
}

- (void)setAudioHWControlFlagsSetByClient:(BOOL)a3
{
  self->_routingContextSetByClient = a3;
}

- (void)setIsAudioOnlyAirPlayVideoActive:(BOOL)a3
{
  self->_recentlyWantedToPauseSpokenAudio = a3;
}

- (void)setIsActiveOverAirPlayVideo:(BOOL)a3
{
  self->_isAudioOnlyAirPlayVideoActive = a3;
}

- (void)setWantsToSendResumableEndInterruptionWhenBackgrounded:(BOOL)a3
{
  self->_hasGPSPrivileges = a3;
}

- (void)setPreferredIOBufferFrames:(int)a3
{
  self->_preferredIOBufferFrames = a3;
}

- (void)setPreferredDecoupledInputOutput:(BOOL)a3
{
  self->_requiresAggregatedInputOutput = a3;
}

- (void)setCameraParameters:(id)a3
{
}

- (BOOL)requiresAggregatedInputOutput
{
  return self->_prefersEchoCancelledInput;
}

- (NSString)preferredHardwareFormat
{
  return (NSString *)objc_getProperty(self, a2, 776, 1);
}

- (BOOL)isAirPlayReceiverSession
{
  return self->_isInterruptionCalledOffAudioControlQueue;
}

- (void)setIsPlayingStartTime:(id)a3
{
}

- (OS_dispatch_source)sessionAssertionAuditTimer
{
  return self->_sessionAssertionAuditTimer;
}

- (BOOL)isPlayingOutput
{
  return self->_isRecordingMuted;
}

- (OS_dispatch_source)sessionDeactivateTimer
{
  return self->_sessionDeactivateTimer;
}

- (BOOL)dontTakeOverHardware
{
  return self->_preferredOutputSampleRateSetByClient;
}

- (BOOL)wantsToPauseSpokenAudio
{
  return self->_wantsVibrationNotifications;
}

- (int64_t)timestampWhenMostRecentlyInterrupted
{
  return self->_timestampWhenMostRecentlyInterrupted;
}

- (void)setDontTakeOverHardware:(BOOL)a3
{
  self->_preferredOutputSampleRateSetByClient = a3;
}

- (BOOL)wasInterruptedWhileRecording
{
  return self->_wasRecordingBeforeBeingInterrupted;
}

- (int)setUpDefaultBehavioursForCategoryAtClientRequest
{
  unsigned int LocalSessionPriority = CMSM_GetLocalSessionPriority(self, 1);
  BOOL v4 = [(MXCoreSessionBase *)self mixesWithEveryone];
  int v5 = [(MXCoreSession *)self setUpDefaultInterruptionStyleForCategoryAndMode];
  if (!v5 && [(MXCoreSessionBase *)self isActive])
  {
    BOOL v6 = [(MXCoreSessionBase *)self mixesWithEveryone];
    if (!v4 || v6) {
      cmsTryToTakeControl(self);
    }
    else {
      cmsBeginInterruptionGuts(self, 0, 2);
    }
    CMSUtility_RouteToPreferredRouteIfRequired(self, LocalSessionPriority, 5);
  }
  return v5;
}

- (int64_t)timestampWhenRecordingInBackgroundMostRecentlyStopped
{
  return self->_timestampWhenRecordingInBackgroundMostRecentlyStopped;
}

- (int64_t)timestampWhenMostRecentResumableEndInterruptionWasSent
{
  return self->_timestampWhenMostRecentResumableEndInterruptionWasSent;
}

- (BOOL)hasEntitlementToRecordDuringCall
{
  return self->_hasEntitlementToSetEmergencyAlertPriority;
}

- (NSDictionary)vibrationData
{
  return (NSDictionary *)objc_getProperty(self, a2, 824, 1);
}

- (BOOL)isVibrating
{
  return self->_isUsingCamera;
}

- (int)preferredNumberOfInputChannels
{
  return self->_preferredNumberOfInputChannels;
}

- (void)dealloc
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1997179E0](self, a2);
  [+[MXSessionManager sharedInstance] mxCoreSessionListAddSession:0];

  self->_mxSessionList = 0;
  self->_mxSessionListReadLock = 0;
  dispatch_release((dispatch_object_t)self->_mxSessionListWriteSemaphore);
  self->_mxSessionListWriteSemaphore = 0;

  self->_sessionPropertiesLock = 0;
  self->_isPlayingStartTime = 0;

  self->_isPlayingStopTime = 0;
  self->_vibrationData = 0;

  self->_defaultVPChatMode = 0;
  self->_overridePortsList = 0;

  self->_subPortPreferences = 0;
  self->_supportedOutputChannelLayouts = 0;

  self->_activeRoutesWhenInterrupted = 0;
  self->_allowedRouteTypes = 0;

  self->_allowedPortTypes = 0;
  self->_aggregateDeviceClockUID = 0;
  if (self->_extendBackgroundAppAssertionTimer)
  {
    BOOL v4 = MXGetAssertionLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_playbackAssertionRef) {
        int v5 = @"YES";
      }
      else {
        int v5 = @"NO";
      }
      NSUInteger v6 = [(NSDictionary *)self->_hostProcessPlaybackAssertions count];
      v20 = "-MXCoreSession_Embedded-";
      __int16 v21 = 2082;
      *(_DWORD *)buf = 136447234;
      v22 = "-[MXCoreSession dealloc]";
      __int16 v23 = 1024;
      int v24 = 144;
      __int16 v25 = 2114;
      CFArrayRef v26 = v5;
      __int16 v27 = 2048;
      NSUInteger v28 = v6;
      _os_log_impl(&dword_194CDF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}s:%i Extend background app assertion timer is running playbackAssertion exists: %{public}@, host process playbackassertion count: %lu", buf, 0x30u);
    }
    dispatch_source_cancel((dispatch_source_t)self->_extendBackgroundAppAssertionTimer);

    self->_extendBackgroundAppAssertionTimer = 0;
  }
  interruptSessionWithoutValidAssertionsTimer = self->_interruptSessionWithoutValidAssertionsTimer;
  if (interruptSessionWithoutValidAssertionsTimer)
  {
    dispatch_source_cancel(interruptSessionWithoutValidAssertionsTimer);

    self->_interruptSessionWithoutValidAssertionsTimer = 0;
  }
  playbackAssertionRef = self->_playbackAssertionRef;
  if (playbackAssertionRef)
  {
    MX_RunningBoardServices_InvalidateAssertion(playbackAssertionRef);

    self->_playbackAssertionRef = 0;
  }

  self->_activationContext = 0;
  self->_vpBlockConfiguration = 0;
  resumeAssertionRef = self->_resumeAssertionRef;
  if (resumeAssertionRef)
  {
    MX_RunningBoardServices_InvalidateAssertion(resumeAssertionRef);

    self->_resumeAssertionRef = 0;
  }
  resumeBackgroundAppUpdaterTimer = self->_resumeBackgroundAppUpdaterTimer;
  if (resumeBackgroundAppUpdaterTimer)
  {
    dispatch_source_cancel(resumeBackgroundAppUpdaterTimer);

    self->_resumeBackgroundAppUpdaterTimer = 0;
  }
  sessionDeactivateTimer = self->_sessionDeactivateTimer;
  if (sessionDeactivateTimer)
  {
    dispatch_source_cancel(sessionDeactivateTimer);

    self->_sessionDeactivateTimer = 0;
    if (dword_1E9359ED0)
    {
      int v18 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  sessionAssertionAuditTimer = self->_sessionAssertionAuditTimer;
  if (sessionAssertionAuditTimer)
  {
    dispatch_source_cancel(sessionAssertionAuditTimer);

    self->_sessionAssertionAuditTimer = 0;
  }

  self->_excludedPortsList = 0;
  self->_cameraParameters = 0;

  self->_duckingSourceList = 0;
  self->_preferredHardwareFormat = 0;

  self->_idleSleepPreventorName = 0;
  self->_idleSleepPreventorCreationTime = 0;
  idleSleepPreventorUpdaterTimer = self->_idleSleepPreventorUpdaterTimer;
  if (idleSleepPreventorUpdaterTimer)
  {
    dispatch_source_cancel(idleSleepPreventorUpdaterTimer);

    self->_idleSleepPreventorUpdaterTimer = 0;
  }

  self->_waitingForRemoteInterruptionDoneIdentifier = 0;
  self->_siriInputDeviceUUID = 0;

  self->_defaultBuiltInRoutePreference = 0;
  self->_desiredInputGainScalar = 0;

  self->_bundleIdToPAAccessIntervalMap = 0;
  self->_parentProcessAuditTokens = 0;

  self->_hostProcessPlaybackAssertions = 0;
  self->_hostProcessAttribution = 0;

  self->_powerProfile = 0;
  self->_preferredPersistentRoute = 0;

  self->_notificationsSubscribedTo = 0;
  self->_badgeType = 0;
  double v15 = MXGetSerialQueue();
  MXDispatchAsync((uint64_t)"-[MXCoreSession dealloc]", (uint64_t)"MXCoreSession.m", 300, 0, 0, v15, (uint64_t)&__block_literal_global_12);
  v16.receiver = self;
  v16.super_class = (Class)MXCoreSession;
  [(MXCoreSessionBase *)&v16 dealloc];
}

uint64_t __24__MXCoreSession_dealloc__block_invoke()
{
  v0 = +[MXSessionManager sharedInstance];
  return [(MXSessionManager *)v0 updateNeroScreenState:0 suspendScreen:1];
}

- (id)copyDetailedRouteDescriptionForContinuityScreenOutput:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (void *)[a3 mutableCopy];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = (id)objc_msgSend(a3, "objectForKey:");
  uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(obj);
        }
        unsigned int v9 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * i) mutableCopy];
        if (vaeGetPortTypeFromPortID(objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"RouteDetailedDescription_ID"), "unsignedIntValue")) == 1885565807)
        {
          [v9 setObject:@"Speaker" forKey:@"RouteDetailedDescription_Name"];
          [v9 setObject:@"Speaker" forKey:@"RouteDetailedDescription_UID"];
        }
        [v4 addObject:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  [v11 setObject:v4 forKey:@"RouteDetailedDescription_Outputs"];

  return v11;
}

- (BOOL)updateAudioBehaviourFromVARouteConfig:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a3 objectForKey:0x1EE5EFBC8];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", 0x1EE5EFC08), "count");
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", 0x1EE5EFC28), "count");
  int v8 = [v5 containsString:0x1EE5EBFC8];
  if (v5)
  {
    int v9 = v8;
    BOOL v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v5, 0);
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithDictionary:", -[MXCoreSessionBase audioBehaviour](self, "audioBehaviour"));
    double v12 = v11;
    if (v6) {
      [v11 setObject:v10 forKey:@"AudioBehaviour_Source"];
    }
    if (v7)
    {
      [(MXCoreSessionBase *)self setAudioDestinationPriority:v10];
      [v12 setObject:v10 forKey:@"AudioBehaviour_Destination"];
    }
    BOOL v13 = [(NSDictionary *)[(MXCoreSessionBase *)self audioBehaviour] isEqualToDictionary:v12];
    if (!v13)
    {
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[MXCoreSessionBase setAudioBehaviour:](self, "setAudioBehaviour:", v12, v18, v19);
      CMSMNotificationUtility_PostSessionAudioBehaviourDidChange(self);
      if (v9) {
        CMSMNotificationUtility_PostSessionRouteControlFeaturesDidChange(self, 1);
      }
      CMSMVAUtility_UpdateSessionInfoAndReporterIDsOnVA(self, 0);
    }
    BOOL v16 = !v13;
  }
  else
  {
    long long v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  return v16;
}

- (BOOL)isRouteSharingPolicySetByClient
{
  int v3 = [(MXCoreSession *)self routeSharingPolicy];
  return v3 == [(MXCoreSession *)self lastRouteSharingPolicySetByClient];
}

- (void)setNotificationsSubscribedTo:(id)a3
{
  [(NSLock *)[(MXCoreSession *)self sessionPropertiesLock] lock];

  self->_notificationsSubscribedTo = (NSSet *)a3;
  uint64_t v5 = [(MXCoreSession *)self sessionPropertiesLock];
  [(NSLock *)v5 unlock];
}

- (NSSet)notificationsSubscribedTo
{
  [(NSLock *)[(MXCoreSession *)self sessionPropertiesLock] lock];
  int v3 = self->_notificationsSubscribedTo;
  [(NSLock *)[(MXCoreSession *)self sessionPropertiesLock] unlock];
  return v3;
}

- (void)resetInterruptionFlags
{
  [(MXCoreSession *)self setWaitingToResumeWhenDeviceUnlocksOrInForeground:0];
  [(MXCoreSession *)self setWaitingForEndInterruptionWhenDeviceUnlocksOrInForeground:0];
}

- (NSArray)activeRoutesWhenInterrupted
{
  return (NSArray *)objc_getProperty(self, a2, 464, 1);
}

- (void)setActiveRoutesWhenInterrupted:(id)a3
{
}

- (NSDictionary)bundleIdToPAAccessIntervalMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 472, 1);
}

- (NSString)defaultVPChatMode
{
  return (NSString *)objc_getProperty(self, a2, 480, 1);
}

- (NSDate)idleSleepPreventorCreationTime
{
  return (NSDate *)objc_getProperty(self, a2, 504, 1);
}

- (void)setIdleSleepPreventorCreationTime:(id)a3
{
}

- (NSString)idleSleepPreventorName
{
  return (NSString *)objc_getProperty(self, a2, 512, 1);
}

- (void)setIdleSleepPreventorName:(id)a3
{
}

- (NSDate)isPlayingStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 520, 1);
}

- (NSDate)isPlayingStopTime
{
  return (NSDate *)objc_getProperty(self, a2, 528, 1);
}

- (RBSAssertion)resumeAssertionRef
{
  return (RBSAssertion *)objc_getProperty(self, a2, 552, 1);
}

- (void)setMxSessionList:(id)a3
{
}

- (void)setMxSessionListReadLock:(id)a3
{
}

- (void)setMxSessionListWriteSemaphore:(id)a3
{
}

- (void)setSessionPropertiesLock:(id)a3
{
}

- (BOOL)notFullyInactive
{
  return self->_someMXSessionIsPlaying;
}

- (void)setSessionDeactivateTimer:(id)a3
{
}

- (void)setSessionAssertionAuditTimer:(id)a3
{
}

- (BOOL)prefersBluetoothAccessoryMuting
{
  return self->_isVibrating;
}

- (void)setIsVibrating:(BOOL)a3
{
  self->_isUsingCamera = a3;
}

- (unsigned)savedCurrentlyControllingFlags
{
  return self->_savedCurrentlyControllingFlags;
}

- (unsigned)savedHWControlFlagsForClientThatDoesNotActuallyPlayAudio
{
  return self->_savedHWControlFlagsForClientThatDoesNotActuallyPlayAudio;
}

- (BOOL)systemSoundHasModifiedCurrentlyControllingFlags
{
  return self->_makesMusicResume;
}

- (BOOL)makesMusicResume
{
  return self->_mustUseDefaultClientPriority;
}

- (BOOL)handsOverInterruptionsToInterruptor
{
  return self->_allowedToBeNowPlayingApp;
}

- (BOOL)areBothBudsInEarForA2DPPortBeforeInterrupting
{
  return self->_wasInterruptedByNowPlayingApp;
}

- (MXCoreSession)interruptingSession
{
  return self->_interruptingSession;
}

- (void)setWasInterruptedByNowPlayingApp:(BOOL)a3
{
  self->_wasInterruptedWhileSuspended = a3;
}

- (BOOL)wasInterruptedWhileSuspended
{
  return self->_wasInterruptedWhileRecording;
}

- (BOOL)wasRecordingBeforeBeingInterrupted
{
  return self->_waitingToResumeWhenDeviceUnlocksOrInForeground;
}

- (void)setWasRecordingBeforeBeingInterrupted:(BOOL)a3
{
  self->_waitingToResumeWhenDeviceUnlocksOrInForeground = a3;
}

- (void)setWaitingToResumeWhenDeviceUnlocksOrInForeground:(BOOL)a3
{
  self->_waitingForEndInterruptionWhenDeviceUnlocksOrInForeground = a3;
}

- (void)setWaitingForEndInterruptionWhenDeviceUnlocksOrInForeground:(BOOL)a3
{
  self->_waitingToResume = a3;
}

- (BOOL)waitingToResume
{
  return self->_needToEndInterruption;
}

- (BOOL)needToEndInterruption
{
  return self->_wasMutedBeforeInterruption;
}

- (void)setNeedToEndInterruption:(BOOL)a3
{
  self->_wasMutedBeforeInterruption = a3;
}

- (BOOL)nowPlayingAppWasStoppedOnMostRecentActivation
{
  return self->_nowPlayingAppThatWasStoppedOnMostRecentActivationWasDoingSpokenAudio;
}

- (BOOL)nowPlayingAppThatWasStoppedOnMostRecentActivationWasDoingSpokenAudio
{
  return self->_isActiveOverAirPlayVideo;
}

- (void)setTimestampWhenRecordingInBackgroundMostRecentlyStopped:(int64_t)a3
{
  self->_timestampWhenRecordingInBackgroundMostRecentlyStopped = a3;
}

- (OS_dispatch_source)resumeBackgroundAppUpdaterTimer
{
  return self->_resumeBackgroundAppUpdaterTimer;
}

- (OS_dispatch_source)extendBackgroundAppAssertionTimer
{
  return self->_extendBackgroundAppAssertionTimer;
}

- (OS_dispatch_source)interruptSessionWithoutValidAssertionsTimer
{
  return self->_interruptSessionWithoutValidAssertionsTimer;
}

- (void)setInterruptSessionWithoutValidAssertionsTimer:(id)a3
{
}

- (BOOL)isAudioOnlyAirPlayVideoActive
{
  return self->_recentlyWantedToPauseSpokenAudio;
}

- (BOOL)recentlyWantedToPauseSpokenAudio
{
  return self->_waitingToSendEndInterruptionToSpokenAudioApp;
}

- (BOOL)waitingToSendEndInterruptionToSpokenAudioApp
{
  return self->_idleSleepPreventorAllocated;
}

- (void)setWaitingToSendEndInterruptionToSpokenAudioApp:(BOOL)a3
{
  self->_idleSleepPreventorAllocated = a3;
}

- (void)setIdleSleepPreventorAllocated:(BOOL)a3
{
  self->_silentMuted = a3;
}

- (OS_os_transaction)vibratingOSTransaction
{
  return self->_vibratingOSTransaction;
}

- (unsigned)idleSleepPreventor
{
  return self->_idleSleepPreventor;
}

- (void)setIdleSleepPreventor:(unsigned int)a3
{
  self->_idleSleepPreventor = a3;
}

- (NSMutableArray)duckingSourceList
{
  return self->_duckingSourceList;
}

- (void)setSilentMuted:(BOOL)a3
{
  self->_isDucked = a3;
}

- (void)setIsDucked:(BOOL)a3
{
  self->_duckedOnVAD = a3;
}

- (BOOL)duckedOnVAD
{
  return self->_tookControlOfStarkMainAudio;
}

- (void)setDuckedOnVAD:(BOOL)a3
{
  self->_tookControlOfStarkMainAudio = a3;
}

- (unsigned)starkBorrowCount
{
  return self->_starkBorrowCount;
}

- (BOOL)tookControlOfStarkMainAudio
{
  return self->_duckCommandSentToCarSession;
}

- (BOOL)duckCommandSentToCarSession
{
  return self->_triggeredRemoteInterruption;
}

- (BOOL)triggeredRemoteInterruption
{
  return self->_mustRestoreCurrentlyControllingFlags;
}

- (void)setTriggeredRemoteInterruption:(BOOL)a3
{
  self->_mustRestoreCurrentlyControllingFlags = a3;
}

- (BOOL)mustRestoreCurrentlyControllingFlags
{
  return self->_willSetScreenDarkModeOnVAD;
}

- (void)setMustRestoreCurrentlyControllingFlags:(BOOL)a3
{
  self->_willSetScreenDarkModeOnVAD = a3;
}

- (BOOL)hasFetchedGPSPrivileges
{
  return self->_interruptionFadeDurationSetByClient;
}

- (void)setHasFetchedGPSPrivileges:(BOOL)a3
{
  self->_interruptionFadeDurationSetByClient = a3;
}

- (BOOL)interruptionFadeDurationSetByClient
{
  return self->_duckFadeDurationSetByClient;
}

- (BOOL)duckFadeDurationSetByClient
{
  return self->_unduckFadeDurationSetByClient;
}

- (BOOL)unduckFadeDurationSetByClient
{
  return self->_audioHWControlFlagsSetByClient;
}

- (BOOL)duckToLevelScalarSetByClient
{
  return self->_unduckToLevelScalarSetByClient;
}

- (BOOL)unduckToLevelScalarSetByClient
{
  return self->_duckToLevelDBSetByClient;
}

- (BOOL)duckToLevelDBSetByClient
{
  return self->_wasActiveWhenDeviceOwnershipRelinquished;
}

- (BOOL)shouldMuteBeAppliedToRemoteDevice
{
  return self->_isRecordingMutedForRemoteDevice;
}

- (void)setActivationContext:(id)a3
{
}

- (NSArray)allowedRouteTypes
{
  return (NSArray *)objc_getProperty(self, a2, 720, 1);
}

- (NSNumber)desiredInputGainScalar
{
  return (NSNumber *)objc_getProperty(self, a2, 744, 1);
}

- (NSDictionary)powerProfile
{
  return (NSDictionary *)objc_getProperty(self, a2, 768, 1);
}

- (void)setPreferredRouteControlFeatures:(id)a3
{
}

- (void)setSiriInputDeviceUUID:(id)a3
{
}

- (NSArray)supportedOutputChannelLayouts
{
  return (NSArray *)objc_getProperty(self, a2, 816, 1);
}

- (void)setVibrationData:(id)a3
{
}

- (void)setVpBlockConfiguration:(id)a3
{
}

- (BOOL)hasEntitlementToStartRecordingInTheBackground
{
  return self->_hasEntitlementToSuppressRecordingStateToSystemStatus;
}

- (BOOL)hasEntitlementToSupportProcessAssertionAuditTokens
{
  return self->_hasEntitlementToRecordDuringCall;
}

- (BOOL)hasEntitlementToSetEmergencyAlertPriority
{
  return self->_hasEntitlementToSetPrefersNoInterruptions;
}

- (BOOL)hasEntitlementToSetPrefersNoInterruptions
{
  return self->_hasEntitlementToShowMicrophoneIndicatorWhileNotRecording;
}

- (BOOL)hasEntitlementToSetPreferredMinimumMicrophoneIndicatorLightOnTime
{
  return self->_hasEntitlementToSetPrefersToOptOutOfHardwareSafetyInterruptions;
}

- (BOOL)hasEntitlementToSetPrefersToOptOutOfHardwareSafetyInterruptions
{
  return self->_doesGameAudioNeedToBeSpatialized;
}

- (BOOL)doesGameAudioNeedToBeSpatialized
{
  return self->_bypassSystemSpatialAudioForGame;
}

- (BOOL)bypassSystemSpatialAudioForGame
{
  return self->_isEligibleForNowPlayingAppConsideration;
}

- (void)setClientPriority:(unsigned int)a3
{
  self->_clientPriority = a3;
}

- (BOOL)prefersToOptOutOfHardwareSafetyInterruptions
{
  return self->_prefersToTakeHWControlFlagsFromAnotherSession;
}

- (BOOL)preferredOutputSampleRateSetByClient
{
  return self->_preferredDecoupledInputOutput;
}

- (void)setRequiresAggregatedInputOutput:(BOOL)a3
{
  self->_prefersEchoCancelledInput = a3;
}

- (void)setPreferredNumberOfInputChannels:(int)a3
{
  self->_preferredNumberOfInputChannels = a3;
}

- (int)preferredNumberOfOutputChannels
{
  return self->_preferredNumberOfOutputChannels;
}

- (void)setPreferredNumberOfOutputChannels:(int)a3
{
  self->_preferredNumberOfOutputChannels = a3;
}

- (void)setCreateSpeakerDevice:(BOOL)a3
{
  self->_disallowAudioFormatChanges = a3;
}

- (void)setDisallowAudioFormatChanges:(BOOL)a3
{
  self->_prefersMultichannelAudio = a3;
}

- (BOOL)prefersMultichannelAudio
{
  return self->_enableBluetoothRecordingPreferenceSetByClient;
}

- (float)duckToLevelScalar
{
  return self->_duckToLevelScalar;
}

- (float)unduckToLevelScalar
{
  return self->_unduckToLevelScalar;
}

- (float)duckToLevelDB
{
  return self->_duckToLevelDB;
}

- (float)lastDuckVolumeApplied
{
  return self->_lastDuckVolumeApplied;
}

- (void)setLastDuckVolumeApplied:(float)a3
{
  self->_lastDuckVolumeApplied = a3;
}

- (float)duckFadeDuration
{
  return self->_duckFadeDuration;
}

- (void)setDuckFadeDuration:(float)a3
{
  self->_duckFadeDuration = a3;
}

- (float)unduckFadeDuration
{
  return self->_unduckFadeDuration;
}

- (void)setUnduckFadeDuration:(float)a3
{
  self->_unduckFadeDuration = a3;
}

- (void)setUserMuted:(BOOL)a3
{
  self->_mutesAudioBasedOnRingerSwitchState = a3;
}

- (unsigned)shadowingAudioSessionID
{
  return self->_shadowingAudioSessionID;
}

- (void)setMutesAudioBasedOnRingerSwitchState:(BOOL)a3
{
  self->_wantsVolumeChangesWhenPaused = a3;
}

- (float)audioQueueFadeDuration
{
  return self->_audioQueueFadeDuration;
}

- (void)setAudioQueueFadeDuration:(float)a3
{
  self->_audioQueueFadeDuration = a3;
}

- (float)audioQueueDuckVolume
{
  return self->_audioQueueDuckVolume;
}

- (void)setAudioQueueDuckVolume:(float)a3
{
  self->_audioQueueDuckVolume = a3;
}

- (void)setWantsVolumeChangesWhenPaused:(BOOL)a3
{
  self->_wantsVolumeChangesWhenPausedOrInactive = a3;
}

- (void)setWantsVolumeChangesWhenPausedOrInactive:(BOOL)a3
{
  self->_ignoreRingerSwitch = a3;
}

- (void)setIgnoreRingerSwitch:(BOOL)a3
{
  self->_forceSoundCheck = a3;
}

- (BOOL)forceSoundCheck
{
  return self->_wantsToBeVolumeButtonClient;
}

- (float)constantOutputVolumeLeveldB
{
  return self->_constantOutputVolumeLeveldB;
}

- (void)setConstantOutputVolumeLeveldB:(float)a3
{
  self->_constantOutputVolumeLeveldB = a3;
}

- (BOOL)prefersNoInterruptionsByMixableSessions
{
  return self->_prefersNoInterruptionsDuringRemoteDeviceControl;
}

- (BOOL)prefersNoInterruptionsDuringRemoteDeviceControl
{
  return self->_prefersToVibeWhenVibrationsAreDisabled;
}

- (void)setPrefersNoInterruptionsDuringRemoteDeviceControl:(BOOL)a3
{
  self->_prefersToVibeWhenVibrationsAreDisabled = a3;
}

- (BOOL)prefersToVibeWhenVibrationsAreDisabled
{
  return self->_prefersToInterruptActiveRecordingSessions;
}

- (BOOL)prefersToInterruptActiveRecordingSessions
{
  return self->_optOutOfMutePriority;
}

- (BOOL)optOutOfMutePriority
{
  return self->_prefersNoDucking;
}

- (BOOL)prefersNoDucking
{
  return self->_isIDSMXCoreSession;
}

- (void)setIsIDSMXCoreSession:(BOOL)a3
{
  self->_isHardwareSafetySession = a3;
}

- (BOOL)isCarSession
{
  return self->_isShadowSessionForFigSBAR;
}

- (void)setIsCarSession:(BOOL)a3
{
  self->_isShadowSessionForFigSBAR = a3;
}

- (BOOL)isShadowSessionForFigSBAR
{
  return self->_isAudioSession;
}

- (BOOL)isAudioSession
{
  return self->_isFigInstantiatedAudioSession;
}

- (BOOL)isFigInstantiatedAudioSession
{
  return self->_isTemporaryAssertionEnabled;
}

- (void)setIsFigInstantiatedAudioSession:(BOOL)a3
{
  self->_isTemporaryAssertionEnabled = a3;
}

- (BOOL)isTemporaryAssertionEnabled
{
  return self->_doesInterAppAudio;
}

- (void)setIsTemporaryAssertionEnabled:(BOOL)a3
{
  self->_doesInterAppAudio = a3;
}

- (BOOL)doesInterAppAudio
{
  return self->_needsAudioBudget;
}

- (void)setDoesInterAppAudio:(BOOL)a3
{
  self->_needsAudioBudget = a3;
}

- (BOOL)needsAudioBudget
{
  return self->_isLongFormAudio;
}

- (BOOL)isLongFormAudio
{
  return self->_wantsToPauseSpokenAudio;
}

- (BOOL)wantsVibrationNotifications
{
  return self->_doNotResetAudioCategoryOnNextInactive;
}

- (void)setWantsVibrationNotifications:(BOOL)a3
{
  self->_doNotResetAudioCategoryOnNextInactive = a3;
}

- (BOOL)doNotResetAudioCategoryOnNextInactive
{
  return self->_doNotNotifyOtherSessionsOnNextInactive;
}

- (BOOL)doNotNotifyOtherSessionsOnNextInactive
{
  return self->_wantsToSendResumableEndInterruptionWhenBackgrounded;
}

- (BOOL)wantsToSendResumableEndInterruptionWhenBackgrounded
{
  return self->_hasGPSPrivileges;
}

- (BOOL)hasGPSPrivileges
{
  return self->_isAllowedToPlayInBackground;
}

- (BOOL)wantsAutomaticClusterPairingOnPlaybackStart
{
  return self->_isSharePlayMediaSession;
}

- (BOOL)allowMixableAudioWhileRecording
{
  return self->_prefersNoInterruptionWhenSecureMicrophoneIsEngaged;
}

- (BOOL)prefersNoInterruptionWhenSecureMicrophoneIsEngaged
{
  return self->_wantsToShowMicrophoneIndicatorWhenNotRecording;
}

- (int)deactivateTimerDelay
{
  return self->_deactivateTimerDelay;
}

- (unsigned)assertionAuditTimerDelay
{
  return self->_assertionAuditTimerDelay;
}

- (BOOL)prefersSuppressingRecordingState
{
  return self->_prefersToPlayDuringWombat;
}

- (BOOL)prefersToPlayDuringWombat
{
  return self->_doesntActuallyPlayAudio;
}

- (void)setPrefersToPlayDuringWombat:(BOOL)a3
{
  self->_doesntActuallyPlayAudio = a3;
}

- (int)lastRouteSharingPolicySetByClient
{
  return self->_lastRouteSharingPolicySetByClient;
}

- (BOOL)prefersSpeechDetectEnabled
{
  return self->_prefersInterruptionOnRouteDisconnect;
}

- (BOOL)prefersInterruptionOnRouteDisconnect
{
  return self->_prefersInterruptionOnRouteDisconnectSetByClient;
}

- (BOOL)prefersBeingInterruptedByNextActiveRecordingClient
{
  return *(&self->_prefersBeingInterruptedByNextActiveRecordingClient + 1);
}

@end