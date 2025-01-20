@interface AVControlCenterModuleState
+ (id)moduleStateForBundleID:(id)a3;
- (AudioValueRange)getEffectIntensityRangeForVideoEffect:(id)a3;
- (BOOL)backgroundBlurSupported;
- (BOOL)backgroundReplacementSupported;
- (BOOL)centerStageFieldOfViewRestrictedToWide;
- (BOOL)centerStageSupported;
- (BOOL)hasBackgroundReplacementBeenToggled;
- (BOOL)isActive;
- (BOOL)isAutoMicrophoneModeEnabled;
- (BOOL)isAutoMicrophoneModeSupported;
- (BOOL)isDeviceBasedModuleState;
- (BOOL)isDeviceBasedModuleStateUpdateToDate;
- (BOOL)isEnabledForVideoEffect:(id)a3;
- (BOOL)manualFramingEnabledForDevice:(id)a3;
- (BOOL)manualFramingIsAtDefault;
- (BOOL)reactionEffectsSupported;
- (BOOL)setAutoMicrophoneModeEnabled:(BOOL)a3;
- (BOOL)setEffectIntensityForVideoEffect:(float)a3 forVideoEffect:(id)a4;
- (BOOL)setEnabled:(BOOL)a3 forVideoEffect:(id)a4;
- (BOOL)setMicrophoneMode:(int64_t)a3;
- (BOOL)studioLightingSupported;
- (BOOL)supportsVideoEffect:(id)a3;
- (BOOL)voiceProcessingBypassed;
- (NSDictionary)zoomFactorConstantsByManualFramingDeviceType;
- (NSURL)backgroundReplacementURL;
- (__CVBuffer)backgroundReplacementPixelBufferFillingWidth:(int)a3 height:(int)a4;
- (double)_defaultOriginalVideoZoomFactor;
- (double)manualFramingOriginalVideoZoomFactor;
- (float)getEffectIntensityDefaultForVideoEffect:(id)a3;
- (float)getEffectIntensityForVideoEffect:(id)a3;
- (id)hiddenMicrophoneModes;
- (id)initForBundleID:(id)a3;
- (id)supportedMicrophoneModes;
- (int64_t)activeMicrophoneMode;
- (int64_t)controlModeForVideoEffect:(id)a3;
- (int64_t)manualFramingDeviceType;
- (int64_t)microphoneMode;
- (unint64_t)unavailableReasonsForVideoEffect:(id)a3;
- (void)_checkManualFramingDefaultStateWithNewOriginalZoomFactor:(double)a3;
- (void)_handleBackPropagatedVideoZoomFactorUpdate:(id)a3;
- (void)_handlePanningAnglesUpdate:(id)a3;
- (void)_proprietaryDefaultChanged:(id)a3 keyPath:(id)a4 context:(void *)a5;
- (void)_updateEligibleEffects:(id)a3;
- (void)cleanUpOrphanedSupportedMicModes;
- (void)dealloc;
- (void)enableBlackenFrames:(BOOL)a3 forDeviceUID:(id)a4;
- (void)installProprietaryDefaultsHandlers;
- (void)invalidateDeviceBasedModuleStatesIfNeeded;
- (void)panWithTranslation:(CGPoint)a3;
- (void)performOneShotFraming;
- (void)performReactionEffect:(id)a3 forCaptureDeviceWithID:(id)a4;
- (void)resetFraming;
- (void)setBackgroundBlurSupported:(BOOL)a3;
- (void)setBackgroundReplacementSupported:(BOOL)a3;
- (void)setBackgroundReplacementURL:(id)a3;
- (void)setCenterStageFieldOfViewRestrictedToWide:(BOOL)a3;
- (void)setCenterStageSupported:(BOOL)a3;
- (void)setManualFramingDeviceType:(int64_t)a3;
- (void)setManualFramingOriginalZoomFactor:(double)a3 convertedZoomFactor:(double)a4;
- (void)setReactionEffectsSupported:(BOOL)a3;
- (void)setStudioLightingSupported:(BOOL)a3;
- (void)startPanningAtPoint:(CGPoint)a3;
- (void)updateActiveReactions:(id)a3 currentRenderPTS:(id *)a4 requestedTriggers:(int)a5 forCaptureDeviceWithID:(id)a6;
- (void)updateCenterStageSupported:(BOOL)a3 backgroundBlurSupported:(BOOL)a4 studioLightingSupported:(BOOL)a5 reactionEffectsSupported:(BOOL)a6 backgroundReplacementSupported:(BOOL)a7;
@end

@implementation AVControlCenterModuleState

- (BOOL)isActive
{
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  BOOL v4 = [(NSArray *)self->_supportedMicrophoneModes count] >= 2 && !self->_auVoiceIOBypassVoiceProcessing;
  BOOL centerStageSupported = self->_centerStageSupported;
  BOOL backgroundBlurSupported = self->_backgroundBlurSupported;
  BOOL studioLightingSupported = self->_studioLightingSupported;
  BOOL reactionEffectsSupported = self->_reactionEffectsSupported;
  BOOL backgroundReplacementSupported = self->_backgroundReplacementSupported;
  if (!holdingStateLock) {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  return backgroundBlurSupported
      || centerStageSupported
      || studioLightingSupported
      || reactionEffectsSupported
      || backgroundReplacementSupported
      || v4;
}

- (BOOL)isDeviceBasedModuleState
{
  return self->_deviceBasedModuleState;
}

+ (id)moduleStateForBundleID:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initForBundleID:a3];

  return v3;
}

- (id)initForBundleID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)AVControlCenterModuleState;
  BOOL v4 = [(AVControlCenterModuleState *)&v9 init];
  if (v4)
  {
    v4->_bundleID = (NSString *)a3;
    v4->_stateLock._os_unfair_lock_opaque = 0;
    [a3 isEqualToString:0x1EF4D64B0];
    v5 = (void *)AVControlCenterPreferencesDomainForPreferencesDomain(a3);
    v4->_eligibleEffectsKey = (NSString *)AVControlCenterVideoEffectsEligibleEffectListPreferenceKey(v5);
    v4->_centerStageControlModeKey = (NSString *)(id)AVControlCenterVideoEffectsCenterStageControlModePreferenceKey(v5);
    v4->_centerStageEnabledKey = (NSString *)(id)AVControlCenterVideoEffectsCenterStageEnabledPreferenceKey(v5);
    v4->_centerStageUnavailableReasonsKey = (NSString *)(id)AVControlCenterVideoEffectsCenterStageUnavailableReasonsPreferenceKey(v5);
    uint64_t v6 = AVControlCenterVideoEffectsCenterStageMigrationCompletePreferenceKey(v5);
    v13[0] = @"videoeffects-cinematicframing-controlmode";
    v13[1] = @"videoeffects-cinematicframing-enabled";
    long long v14 = *(_OWORD *)&v4->_centerStageControlModeKey;
    v13[2] = 0x1EF4D7DF0;
    centerStageUnavailableReasonsKey = v4->_centerStageUnavailableReasonsKey;
    AVControlCenterMigrateDefaultsForKeys(v5, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:v13 count:3], v6);
    v4->_backgroundBlurControlModeKey = (NSString *)(id)AVControlCenterVideoEffectsPortraitEffectControlModePreferenceKey(v5);
    v4->_backgroundBlurEnabledKey = (NSString *)(id)AVControlCenterVideoEffectsPortraitEffectEnabledPreferenceKey(v5);
    v4->_backgroundBlurUnavailableReasonsKey = (NSString *)(id)AVControlCenterVideoEffectsPortraitEffectUnavailableReasonsPreferenceKey(v5);
    v4->_backgroundBlurApertureKey = (NSString *)(id)AVControlCenterVideoEffectsPortraitEffectAperturePreferenceKey(v5);
    uint64_t v7 = AVControlCenterVideoEffectsPortraitEffectMigrationCompletePreferenceKey(v5);
    v10[0] = @"videoeffects-backgroundblur-controlmode";
    v10[1] = @"videoeffects-backgroundblur-enabled";
    long long v11 = *(_OWORD *)&v4->_backgroundBlurControlModeKey;
    v10[2] = 0x1EF4D7E50;
    backgroundBlurUnavailableReasonsKey = v4->_backgroundBlurUnavailableReasonsKey;
    AVControlCenterMigrateDefaultsForKeys(v5, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:v10 count:3], v7);
    v4->_studioLightingControlModeKey = (NSString *)(id)AVControlCenterVideoEffectsStudioLightingControlModePreferenceKey(v5);
    v4->_studioLightingEnabledKey = (NSString *)(id)AVControlCenterVideoEffectsStudioLightingEnabledPreferenceKey(v5);
    v4->_studioLightingUnavailableReasonsKey = (NSString *)(id)AVControlCenterVideoEffectsStudioLightingUnavailableReasonsPreferenceKey(v5);
    v4->_studioLightingIntensityKey = (NSString *)(id)AVControlCenterVideoEffectsStudioLightingIntensityPreferenceKey(v5);
    v4->_previousReactionStateByDeviceIdentifier = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_reactionsEnabledKey = (NSString *)(id)AVControlCenterVideoEffectsReactionsEnabledPreferenceKey(v5);
    v4->_gesturesEnabledKey = (NSString *)(id)AVControlCenterVideoEffectsGesturesEnabledPreferenceKey(v5);
    v4->_gesturesEnabledDefaultKey = (NSString *)(id)AVControlCenterVideoEffectsGesturesEnabledDefaultPreferenceKey(v5);
    v4->_reactionsUnavailableReasonsKey = (NSString *)(id)AVControlCenterVideoEffectsReactionsUnavailableReasonsPreferenceKey(v5);
    v4->_reactionTriggeredKey = (NSString *)(id)AVControlCenterVideoEffectsReactionsTriggeredPreferenceKey(v5);
    v4->_reactionsInProgressKey = (NSString *)(id)AVControlCenterVideoEffectsReactionsInProgressPreferenceKey(v5);
    v4->_backgroundReplacementEnabledKey = (NSString *)(id)AVControlCenterVideoEffectsBackgroundReplacementEnabledPreferenceKey(v5);
    v4->_backgroundReplacementUnavailableReasonsKey = (NSString *)(id)AVControlCenterVideoEffectsBackgroundReplacementUnavailableReasonsPreferenceKey(v5);
    v4->_backgroundReplacementURLBookmarkKey = (NSString *)(id)AVControlCenterVideoEffectsBackgroundReplacementURLBookmarkPreferenceKey(v5);
    v4->_auVoiceIOBypassVoiceProcessingKey = (NSString *)(id)AVControlCenterAudioVoiceProcessingBypassedPreferenceKey(v5);
    v4->_microphoneModeKey = (NSString *)(id)AVControlCenterAudioPreferredMicrophoneModePreferenceKey(v5);
    v4->_activeMicrophoneModeKey = (NSString *)(id)AVControlCenterAudioActiveMicrophoneModePreferenceKey(v5);
    v4->_supportedMicrophoneModesKey = (NSString *)(id)AVControlCenterAudioSupportedMicrophoneModesPreferenceKey(v5);
    v4->_hiddenMicrophoneModesKey = (NSString *)(id)AVControlCenterAudioHiddenMicrophoneModesPreferenceKey(v5);
    v4->_autoMicModeEnabledKey = (NSString *)(id)AVControlCenterAudioIsAutoMicrophoneModeEnabledPreferenceKey(v5);
    [(AVControlCenterModuleState *)v4 cleanUpOrphanedSupportedMicModes];
    [(AVControlCenterModuleState *)v4 setupDeviceBasedModuleStatesIfNeeded];
  }
  return v4;
}

- (void)cleanUpOrphanedSupportedMicModes
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.cisco.squared", @"com.webex.meeting", 0), "containsObject:", self->_bundleID))
  {
    v3 = (void *)AVControlCenterPreferencesDomainForPreferencesDomain(self->_bundleID);
    uint64_t v4 = AVControlCenterDidOverwriteOrphanedSupportedMicrophoneModesPreferenceKey(v3);
    if ((objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", v4), "BOOLValue") & 1) == 0)
    {
      +[AVCaptureProprietaryDefaultsSingleton setObject:MEMORY[0x1E4F1CBF0] forKey:self->_supportedMicrophoneModesKey];
      +[AVCaptureProprietaryDefaultsSingleton setObject:MEMORY[0x1E4F1CC38] forKey:v4];
      if (dword_1EB4C9160)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
}

- (void)updateCenterStageSupported:(BOOL)a3 backgroundBlurSupported:(BOOL)a4 studioLightingSupported:(BOOL)a5 reactionEffectsSupported:(BOOL)a6 backgroundReplacementSupported:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  [(AVControlCenterModuleState *)self setCenterStageSupported:a3];
  [(AVControlCenterModuleState *)self setBackgroundBlurSupported:v10];
  [(AVControlCenterModuleState *)self setStudioLightingSupported:v9];
  [(AVControlCenterModuleState *)self setReactionEffectsSupported:v8];

  [(AVControlCenterModuleState *)self setBackgroundReplacementSupported:v7];
}

- (BOOL)isDeviceBasedModuleStateUpdateToDate
{
  return ![+[AVCaptureDevice deviceWithUniqueID:self->_bundleID] isManualFramingSupported]|| self->_deviceSupportsManualFraming;
}

- (void)installProprietaryDefaultsHandlers
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_BOOL holdingStateLock = 1;
  eligibleEffectsKey = self->_eligibleEffectsKey;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke;
  v55[3] = &unk_1E5A72DB8;
  v55[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:eligibleEffectsKey callHandlerForInitialValue:1 defaultChangedHandler:v55];
  centerStageControlModeKey = self->_centerStageControlModeKey;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_2;
  v54[3] = &unk_1E5A72DB8;
  v54[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:centerStageControlModeKey callHandlerForInitialValue:1 defaultChangedHandler:v54];
  centerStageEnabledKey = self->_centerStageEnabledKey;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_3;
  v53[3] = &unk_1E5A72DB8;
  v53[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:centerStageEnabledKey callHandlerForInitialValue:1 defaultChangedHandler:v53];
  centerStageUnavailableReasonsKey = self->_centerStageUnavailableReasonsKey;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_4;
  v52[3] = &unk_1E5A72DB8;
  v52[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:centerStageUnavailableReasonsKey callHandlerForInitialValue:1 defaultChangedHandler:v52];
  backgroundBlurControlModeKey = self->_backgroundBlurControlModeKey;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_5;
  v51[3] = &unk_1E5A72DB8;
  v51[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:backgroundBlurControlModeKey callHandlerForInitialValue:1 defaultChangedHandler:v51];
  backgroundBlurEnabledKey = self->_backgroundBlurEnabledKey;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_6;
  v50[3] = &unk_1E5A72DB8;
  v50[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:backgroundBlurEnabledKey callHandlerForInitialValue:1 defaultChangedHandler:v50];
  backgroundBlurUnavailableReasonsKey = self->_backgroundBlurUnavailableReasonsKey;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_7;
  v49[3] = &unk_1E5A72DB8;
  v49[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:backgroundBlurUnavailableReasonsKey callHandlerForInitialValue:1 defaultChangedHandler:v49];
  backgroundBlurApertureKey = self->_backgroundBlurApertureKey;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_8;
  v48[3] = &unk_1E5A72DB8;
  v48[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:backgroundBlurApertureKey callHandlerForInitialValue:1 defaultChangedHandler:v48];
  studioLightingControlModeKey = self->_studioLightingControlModeKey;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_9;
  v47[3] = &unk_1E5A72DB8;
  v47[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:studioLightingControlModeKey callHandlerForInitialValue:1 defaultChangedHandler:v47];
  studioLightingEnabledKey = self->_studioLightingEnabledKey;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_10;
  v46[3] = &unk_1E5A72DB8;
  v46[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:studioLightingEnabledKey callHandlerForInitialValue:1 defaultChangedHandler:v46];
  studioLightingUnavailableReasonsKey = self->_studioLightingUnavailableReasonsKey;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_11;
  v45[3] = &unk_1E5A72DB8;
  v45[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:studioLightingUnavailableReasonsKey callHandlerForInitialValue:1 defaultChangedHandler:v45];
  studioLightingIntensityKey = self->_studioLightingIntensityKey;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_12;
  v44[3] = &unk_1E5A72DB8;
  v44[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:studioLightingIntensityKey callHandlerForInitialValue:1 defaultChangedHandler:v44];
  reactionsEnabledKey = self->_reactionsEnabledKey;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_13;
  v43[3] = &unk_1E5A72DB8;
  v43[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:reactionsEnabledKey callHandlerForInitialValue:1 defaultChangedHandler:v43];
  gesturesEnabledKey = self->_gesturesEnabledKey;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_14;
  v42[3] = &unk_1E5A72DB8;
  v42[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:gesturesEnabledKey callHandlerForInitialValue:1 defaultChangedHandler:v42];
  gesturesEnabledDefaultKey = self->_gesturesEnabledDefaultKey;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_15;
  v41[3] = &unk_1E5A72DB8;
  v41[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:gesturesEnabledDefaultKey callHandlerForInitialValue:0 defaultChangedHandler:v41];
  reactionTriggeredKey = self->_reactionTriggeredKey;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_16;
  v40[3] = &unk_1E5A72DB8;
  v40[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:reactionTriggeredKey callHandlerForInitialValue:0 defaultChangedHandler:v40];
  reactionsInProgressKey = self->_reactionsInProgressKey;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_17;
  v39[3] = &unk_1E5A72DB8;
  v39[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:reactionsInProgressKey callHandlerForInitialValue:0 defaultChangedHandler:v39];
  backgroundReplacementEnabledKey = self->_backgroundReplacementEnabledKey;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_18;
  v38[3] = &unk_1E5A72DB8;
  v38[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:backgroundReplacementEnabledKey callHandlerForInitialValue:1 defaultChangedHandler:v38];
  backgroundReplacementUnavailableReasonsKey = self->_backgroundReplacementUnavailableReasonsKey;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_19;
  v37[3] = &unk_1E5A72DB8;
  v37[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:backgroundReplacementUnavailableReasonsKey callHandlerForInitialValue:1 defaultChangedHandler:v37];
  backgroundReplacementURLBookmarkKey = self->_backgroundReplacementURLBookmarkKey;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_20;
  v36[3] = &unk_1E5A72DB8;
  v36[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:backgroundReplacementURLBookmarkKey callHandlerForInitialValue:1 defaultChangedHandler:v36];
  auVoiceIOBypassVoiceProcessingKey = self->_auVoiceIOBypassVoiceProcessingKey;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_21;
  v35[3] = &unk_1E5A72DB8;
  v35[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:auVoiceIOBypassVoiceProcessingKey callHandlerForInitialValue:1 defaultChangedHandler:v35];
  microphoneModeKey = self->_microphoneModeKey;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_22;
  v34[3] = &unk_1E5A72DB8;
  v34[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:microphoneModeKey callHandlerForInitialValue:1 defaultChangedHandler:v34];
  activeMicrophoneModeKey = self->_activeMicrophoneModeKey;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_23;
  v33[3] = &unk_1E5A72DB8;
  v33[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:activeMicrophoneModeKey callHandlerForInitialValue:1 defaultChangedHandler:v33];
  supportedMicrophoneModesKey = self->_supportedMicrophoneModesKey;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_24;
  v32[3] = &unk_1E5A72DB8;
  v32[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:supportedMicrophoneModesKey callHandlerForInitialValue:1 defaultChangedHandler:v32];
  hiddenMicrophoneModesKey = self->_hiddenMicrophoneModesKey;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_25;
  v31[3] = &unk_1E5A72DB8;
  v31[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:hiddenMicrophoneModesKey callHandlerForInitialValue:1 defaultChangedHandler:v31];
  autoMicModeEnabledKey = self->_autoMicModeEnabledKey;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_26;
  v30[3] = &unk_1E5A72DB8;
  v30[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:self forKey:autoMicModeEnabledKey callHandlerForInitialValue:1 defaultChangedHandler:v30];
  os_unfair_lock_unlock(p_stateLock);
  self->_BOOL holdingStateLock = 0;
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEligibleEffects:");
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 56) context:AVCCM_CenterStageControlModeChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 64) context:AVCCM_CenterStageEnabledChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 72) context:AVCCM_CenterStageUnavailableReasonsChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 104) context:AVCCM_BackgroundBlurControlModeChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 112) context:AVCCM_BackgroundBlurEnabledChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 120) context:AVCCM_BackgroundBlurUnavailableReasonsChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 136) context:AVCCM_BackgroundBlurApertureChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 168) context:AVCCM_StudioLightingControlModeChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 176) context:AVCCM_StudioLightingEnabledChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 184) context:AVCCM_StudioLightingUnavailableReasonsChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 200) context:AVCCM_StudioLightingIntensityChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 216) context:AVCCM_ReactionsEnabledChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 232) context:AVCCM_GesturesEnabledChangedContext];
}

id __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_15(uint64_t a1)
{
  id result = +[AVCaptureProprietaryDefaultsSingleton objectForKey:*(void *)(*(void *)(a1 + 32) + 232)];
  if (!result)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = v3[29];
    uint64_t v5 = AVCCM_GesturesEnabledChangedContext;
    return (id)[v3 _proprietaryDefaultChanged:0 keyPath:v4 context:v5];
  }
  return result;
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 256) context:AVCCM_ReactionEffectTriggeredContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 272) context:AVCCM_ReactionEffectsInProgressChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 288) context:AVCCM_BackgroundReplacementEnabledChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_19(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 296) context:AVCCM_BackgroundReplacementUnavailableReasonsChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 312) context:AVCCM_BackgroundReplacementURLChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 344) context:AVCCM_AUVoiceIOBypassVoiceProcessingChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_22(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 368) context:AVCCM_AUVoiceIOChatFlavorChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_23(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 376) context:AVCCM_AUVoiceIOActiveChatFlavorChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 392) context:AVCCM_AUVoiceIOSupportedChatFlavorsChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 408) context:AVCCM_AUVoiceIOHiddenChatFlavorsChangedContext];
}

uint64_t __64__AVControlCenterModuleState_installProprietaryDefaultsHandlers__block_invoke_26(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _proprietaryDefaultChanged:a3 keyPath:*(void *)(*(void *)(a1 + 32) + 424) context:AVCCM_AUVoiceIOAutoEnabledChangedContext];
}

- (void)dealloc
{
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_centerStageControlModeKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_centerStageEnabledKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_centerStageUnavailableReasonsKey];

  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_backgroundBlurControlModeKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_backgroundBlurEnabledKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_backgroundBlurUnavailableReasonsKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_backgroundBlurApertureKey];

  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_studioLightingControlModeKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_studioLightingEnabledKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_studioLightingUnavailableReasonsKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_studioLightingIntensityKey];

  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_reactionsEnabledKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_gesturesEnabledKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_reactionsUnavailableReasonsKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_reactionTriggeredKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_reactionsInProgressKey];

  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_backgroundReplacementEnabledKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_backgroundReplacementUnavailableReasonsKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_backgroundReplacementURLBookmarkKey];

  backgroundReplacementPixelBuffer = self->_backgroundReplacementPixelBuffer;
  if (backgroundReplacementPixelBuffer)
  {
    CFRelease(backgroundReplacementPixelBuffer);
    self->_backgroundReplacementPixelBuffer = 0;
  }
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_auVoiceIOBypassVoiceProcessingKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_microphoneModeKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_activeMicrophoneModeKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_supportedMicrophoneModesKey];
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_hiddenMicrophoneModesKey];
  [(AVControlCenterModuleState *)self invalidateDeviceBasedModuleStatesIfNeeded];

  +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_eligibleEffectsKey];
  v4.receiver = self;
  v4.super_class = (Class)AVControlCenterModuleState;
  [(AVControlCenterModuleState *)&v4 dealloc];
}

- (void)_updateEligibleEffects:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL holdingStateLock = self->_holdingStateLock;
    if (!self->_holdingStateLock) {
      os_unfair_lock_lock(&self->_stateLock);
    }
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:a3];
    self->_isOptedInForBackgroundBlur = [v6 containsObject:AVCaptureBundleCameraPortraitEffectEnabledKey];
    self->_isOptedInForStudioLight = [v6 containsObject:AVCaptureBundleCameraStudioLightEnabledKey];
    self->_isOptedInForReactionEffects = [v6 containsObject:AVCaptureBundleCameraReactionEffectsEnabledKey];
    self->_isOptedInForBackgroundReplacement = [v6 containsObject:AVCaptureBundleCameraBackgroundReplacementEnabledKey];
    if (!holdingStateLock) {
      os_unfair_lock_unlock(&self->_stateLock);
    }
    uint64_t v7 = [(id)sCaptureDeviceWatcher centerStageSupported];
    uint64_t v8 = [(id)sCaptureDeviceWatcher backgroundBlurSupported];
    uint64_t v9 = [(id)sCaptureDeviceWatcher studioLightingSupported];
    uint64_t v10 = [(id)sCaptureDeviceWatcher reactionEffectsSupported];
    uint64_t v11 = [(id)sCaptureDeviceWatcher backgroundReplacementSupported];
    [(AVControlCenterModuleState *)self updateCenterStageSupported:v7 backgroundBlurSupported:v8 studioLightingSupported:v9 reactionEffectsSupported:v10 backgroundReplacementSupported:v11];
  }
}

- (BOOL)centerStageSupported
{
  if (self->_holdingStateLock)
  {
    return self->_centerStageSupported;
  }
  else
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    BOOL centerStageSupported = self->_centerStageSupported;
    os_unfair_lock_unlock(p_stateLock);
  }
  return centerStageSupported;
}

- (void)setCenterStageSupported:(BOOL)a3
{
  int v3 = a3;
  v10[2] = *MEMORY[0x1E4F143B8];
  if (self->_holdingStateLock)
  {
    BOOL centerStageSupported = self->_centerStageSupported;
    self->_BOOL centerStageSupported = a3;
    if (centerStageSupported == a3) {
      return;
    }
  }
  else
  {
    os_unfair_lock_lock(&self->_stateLock);
    int v8 = self->_centerStageSupported;
    self->_BOOL centerStageSupported = v3;
    os_unfair_lock_unlock(&self->_stateLock);
    if (v8 == v3) {
      return;
    }
  }
  v9[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
  v9[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
  bundleID = self->_bundleID;
  v10[0] = @"AVControlCenterVideoEffectCenterStage";
  v10[1] = bundleID;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification", 0, v7);
}

- (BOOL)backgroundBlurSupported
{
  if (self->_holdingStateLock)
  {
    return self->_backgroundBlurSupported;
  }
  else
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    BOOL backgroundBlurSupported = self->_backgroundBlurSupported;
    os_unfair_lock_unlock(p_stateLock);
  }
  return backgroundBlurSupported;
}

- (void)setBackgroundBlurSupported:(BOOL)a3
{
  int isOptedInForBackgroundBlur = a3;
  v10[2] = *MEMORY[0x1E4F143B8];
  BOOL holdingStateLock = self->_holdingStateLock;
  if (self->_holdingStateLock)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  os_unfair_lock_lock(&self->_stateLock);
  if (isOptedInForBackgroundBlur) {
LABEL_3:
  }
    int isOptedInForBackgroundBlur = self->_isOptedInForBackgroundBlur;
LABEL_4:
  int backgroundBlurSupported = self->_backgroundBlurSupported;
  self->_int backgroundBlurSupported = isOptedInForBackgroundBlur;
  if (!holdingStateLock) {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  if (backgroundBlurSupported != isOptedInForBackgroundBlur)
  {
    v9[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
    v9[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
    bundleID = self->_bundleID;
    v10[0] = @"AVControlCenterVideoEffectBackgroundBlur";
    v10[1] = bundleID;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification", 0, v8);
  }
}

- (BOOL)studioLightingSupported
{
  if (self->_holdingStateLock)
  {
    return self->_studioLightingSupported;
  }
  else
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    BOOL studioLightingSupported = self->_studioLightingSupported;
    os_unfair_lock_unlock(p_stateLock);
  }
  return studioLightingSupported;
}

- (void)setStudioLightingSupported:(BOOL)a3
{
  int isOptedInForStudioLight = a3;
  v10[2] = *MEMORY[0x1E4F143B8];
  BOOL holdingStateLock = self->_holdingStateLock;
  if (self->_holdingStateLock)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  os_unfair_lock_lock(&self->_stateLock);
  if (isOptedInForStudioLight) {
LABEL_3:
  }
    int isOptedInForStudioLight = self->_isOptedInForStudioLight;
LABEL_4:
  int studioLightingSupported = self->_studioLightingSupported;
  self->_int studioLightingSupported = isOptedInForStudioLight;
  if (!holdingStateLock) {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  if (studioLightingSupported != isOptedInForStudioLight)
  {
    v9[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
    v9[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
    bundleID = self->_bundleID;
    v10[0] = @"AVControlCenterVideoEffectStudioLighting";
    v10[1] = bundleID;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification", 0, v8);
  }
}

- (BOOL)reactionEffectsSupported
{
  if (self->_holdingStateLock)
  {
    return self->_reactionEffectsSupported;
  }
  else
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    BOOL reactionEffectsSupported = self->_reactionEffectsSupported;
    os_unfair_lock_unlock(p_stateLock);
  }
  return reactionEffectsSupported;
}

- (void)setReactionEffectsSupported:(BOOL)a3
{
  int isOptedInForReactionEffects = a3;
  v10[2] = *MEMORY[0x1E4F143B8];
  BOOL holdingStateLock = self->_holdingStateLock;
  if (self->_holdingStateLock)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  os_unfair_lock_lock(&self->_stateLock);
  if (isOptedInForReactionEffects) {
LABEL_3:
  }
    int isOptedInForReactionEffects = self->_isOptedInForReactionEffects;
LABEL_4:
  int reactionEffectsSupported = self->_reactionEffectsSupported;
  self->_int reactionEffectsSupported = isOptedInForReactionEffects;
  if (!holdingStateLock) {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  if (reactionEffectsSupported != isOptedInForReactionEffects)
  {
    v9[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
    v9[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
    bundleID = self->_bundleID;
    v10[0] = @"AVControlCenterVideoEffectReactions";
    v10[1] = bundleID;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification", 0, v8);
  }
}

- (BOOL)backgroundReplacementSupported
{
  if (self->_holdingStateLock)
  {
    return self->_backgroundReplacementSupported;
  }
  else
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    BOOL backgroundReplacementSupported = self->_backgroundReplacementSupported;
    os_unfair_lock_unlock(p_stateLock);
  }
  return backgroundReplacementSupported;
}

- (void)setBackgroundReplacementSupported:(BOOL)a3
{
  int isOptedInForBackgroundReplacement = a3;
  v10[2] = *MEMORY[0x1E4F143B8];
  BOOL holdingStateLock = self->_holdingStateLock;
  if (self->_holdingStateLock)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  os_unfair_lock_lock(&self->_stateLock);
  if (isOptedInForBackgroundReplacement) {
LABEL_3:
  }
    int isOptedInForBackgroundReplacement = self->_isOptedInForBackgroundReplacement;
LABEL_4:
  int backgroundReplacementSupported = self->_backgroundReplacementSupported;
  self->_int backgroundReplacementSupported = isOptedInForBackgroundReplacement;
  if (!holdingStateLock) {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  if (backgroundReplacementSupported != isOptedInForBackgroundReplacement)
  {
    v9[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
    v9[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
    bundleID = self->_bundleID;
    v10[0] = @"AVControlCenterVideoEffectBackgroundReplacement";
    v10[1] = bundleID;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification", 0, v8);
  }
}

- (BOOL)isAutoMicrophoneModeSupported
{
  return AVControlCenterAudioMicrophoneMGAutoMode() != -1;
}

- (BOOL)supportsVideoEffect:(id)a3
{
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectCenterStage"]) {
    BOOL centerStageSupported = self->_centerStageSupported;
  }
  else {
    BOOL centerStageSupported = 0;
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundBlur"]) {
    BOOL centerStageSupported = self->_backgroundBlurSupported;
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectStudioLighting"]) {
    BOOL centerStageSupported = self->_studioLightingSupported;
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectReactions"]) {
    BOOL centerStageSupported = self->_reactionEffectsSupported;
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundReplacement"]) {
    BOOL centerStageSupported = self->_backgroundReplacementSupported;
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectGestures"]) {
    BOOL centerStageSupported = self->_reactionEffectsSupported;
  }
  if (!holdingStateLock) {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  return centerStageSupported;
}

- (int64_t)controlModeForVideoEffect:(id)a3
{
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectCenterStage"]) {
    int64_t centerStageControlMode = self->_centerStageControlMode;
  }
  else {
    int64_t centerStageControlMode = 0;
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundBlur"]) {
    int64_t centerStageControlMode = self->_backgroundBlurControlMode;
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectStudioLighting"]) {
    int64_t centerStageControlMode = self->_studioLightingControlMode;
  }
  int v7 = [a3 isEqualToString:@"AVControlCenterVideoEffectReactions"];
  int v8 = [a3 isEqualToString:@"AVControlCenterVideoEffectGestures"];
  int v9 = [a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundReplacement"];
  if (!holdingStateLock) {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  if (v9 | v8 | v7) {
    return 2;
  }
  else {
    return centerStageControlMode;
  }
}

- (BOOL)isEnabledForVideoEffect:(id)a3
{
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectCenterStage"]) {
    BOOL centerStageEnabled = self->_centerStageEnabled;
  }
  else {
    BOOL centerStageEnabled = 0;
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundBlur"]) {
    BOOL centerStageEnabled = self->_backgroundBlurEnabled;
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectStudioLighting"]) {
    BOOL centerStageEnabled = self->_studioLightingEnabled;
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectReactions"]) {
    BOOL centerStageEnabled = self->_reactionsEnabled;
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectGestures"]) {
    BOOL centerStageEnabled = self->_gesturesEnabled;
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundReplacement"]) {
    BOOL centerStageEnabled = self->_backgroundReplacementEnabled;
  }
  if (!holdingStateLock) {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  return centerStageEnabled;
}

- (BOOL)setEnabled:(BOOL)a3 forVideoEffect:(id)a4
{
  BOOL v5 = a3;
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
  {
    os_unfair_lock_lock(&self->_stateLock);
    self->_BOOL holdingStateLock = 1;
  }
  int v8 = [a4 isEqualToString:@"AVControlCenterVideoEffectCenterStage"];
  if (v8) {
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [NSNumber numberWithBool:v5], self->_centerStageEnabledKey);
  }
  if ([a4 isEqualToString:@"AVControlCenterVideoEffectBackgroundBlur"])
  {
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [NSNumber numberWithBool:v5], self->_backgroundBlurEnabledKey);
    LOBYTE(v8) = 1;
  }
  if ([a4 isEqualToString:@"AVControlCenterVideoEffectStudioLighting"])
  {
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [NSNumber numberWithBool:v5], self->_studioLightingEnabledKey);
    LOBYTE(v8) = 1;
  }
  if ([a4 isEqualToString:@"AVControlCenterVideoEffectReactions"])
  {
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [NSNumber numberWithBool:v5], self->_reactionsEnabledKey);
    LOBYTE(v8) = 1;
  }
  if ([a4 isEqualToString:@"AVControlCenterVideoEffectGestures"])
  {
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [NSNumber numberWithBool:v5], self->_gesturesEnabledKey);
    LOBYTE(v8) = 1;
  }
  if ([a4 isEqualToString:@"AVControlCenterVideoEffectBackgroundReplacement"])
  {
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [NSNumber numberWithBool:v5], self->_backgroundReplacementEnabledKey);
    LOBYTE(v8) = 1;
  }
  if (!holdingStateLock)
  {
    os_unfair_lock_unlock(&self->_stateLock);
    self->_BOOL holdingStateLock = 0;
  }
  return v8;
}

- (unint64_t)unavailableReasonsForVideoEffect:(id)a3
{
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectCenterStage"]) {
    unint64_t v5 = objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_centerStageUnavailableReasonsKey), "unsignedIntegerValue");
  }
  else {
    unint64_t v5 = 0;
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundBlur"]) {
    unint64_t v5 = objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_backgroundBlurUnavailableReasonsKey), "unsignedIntegerValue");
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectStudioLighting"]) {
    unint64_t v5 = objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_studioLightingUnavailableReasonsKey), "unsignedIntegerValue");
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectReactions"]) {
    unint64_t v5 = objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_reactionsUnavailableReasonsKey), "unsignedIntegerValue");
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectGestures"]) {
    unint64_t v5 = objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_reactionsUnavailableReasonsKey), "unsignedIntegerValue");
  }
  if (![a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundReplacement"]) {
    return v5;
  }
  id v6 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:self->_backgroundReplacementUnavailableReasonsKey];

  return [v6 unsignedIntegerValue];
}

- (void)performReactionEffect:(id)a3 forCaptureDeviceWithID:(id)a4
{
  v12[3] = *MEMORY[0x1E4F143B8];
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  int v8 = self->_reactionTriggeredKey;
  bundleID = self->_bundleID;
  v11[0] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
  v11[1] = @"AVControlCenterModulesNotificationDeviceIdentifierKey";
  v12[0] = bundleID;
  v12[1] = a4;
  v11[2] = @"AVControlCenterModulesNotificationReactionTypeKey";
  v12[2] = a3;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (!holdingStateLock) {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  +[AVCaptureProprietaryDefaultsSingleton setObject:v10 forKey:v8];
}

- (void)updateActiveReactions:(id)a3 currentRenderPTS:(id *)a4 requestedTriggers:(int)a5 forCaptureDeviceWithID:(id)a6
{
  v22[3] = *MEMORY[0x1E4F143B8];
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  v12 = self->_bundleID;
  v13 = self->_reactionsInProgressKey;
  id v14 = (id)[(NSMutableDictionary *)self->_previousReactionStateByDeviceIdentifier objectForKeyedSubscript:a6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_previousReactionStateByDeviceIdentifier, "setObject:forKeyedSubscript:", (id)[a3 mutableCopy], a6);
  if (!holdingStateLock) {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  if (a5 > 0 || (uint64_t v15 = [a3 count], v15 != objc_msgSend(v14, "count")))
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count") + objc_msgSend(v14, "count"));
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __110__AVControlCenterModuleState_updateActiveReactions_currentRenderPTS_requestedTriggers_forCaptureDeviceWithID___block_invoke;
    v20[3] = &unk_1E5A7A210;
    v20[4] = v14;
    v20[5] = v16;
    [a3 enumerateKeysAndObjectsUsingBlock:v20];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __110__AVControlCenterModuleState_updateActiveReactions_currentRenderPTS_requestedTriggers_forCaptureDeviceWithID___block_invoke_2;
    v17[3] = &unk_1E5A7A238;
    long long v18 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    v17[4] = v16;
    [v14 enumerateKeysAndObjectsUsingBlock:v17];
    [v16 sortUsingComparator:&__block_literal_global_22];
    v21[0] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
    v21[1] = @"AVControlCenterModulesNotificationDeviceIdentifierKey";
    v22[0] = v12;
    v22[1] = a6;
    v21[2] = @"AVControlCenterModulesNotificationReactionEffectsInProgressKey";
    v22[2] = v16;
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3], v13);
  }
}

void __110__AVControlCenterModuleState_updateActiveReactions_currentRenderPTS_requestedTriggers_forCaptureDeviceWithID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [*(id *)(a1 + 32) removeObjectForKey:a2];
  AVCaptureReactionType AVCaptureReactionTypeForPTEffectReactionType = _AVControlCenterGetAVCaptureReactionTypeForPTEffectReactionType([a3 effectType]);
  if (AVCaptureReactionTypeForPTEffectReactionType)
  {
    AVCaptureReactionType v6 = AVCaptureReactionTypeForPTEffectReactionType;
    memset(&v11, 0, sizeof(v11));
    [a3 startTime];
    CMTimeMakeWithSeconds(&v11, v7, 1000000000);
    int v8 = [AVCaptureReactionEffectState alloc];
    CMTime v10 = v11;
    int v9 = [(AVCaptureReactionEffectState *)v8 initWithReactionType:v6 startTime:&v10];
    objc_msgSend(*(id *)(a1 + 40), "addObject:", -[AVCaptureReactionEffectState dictionaryRepresentation](v9, "dictionaryRepresentation"));
  }
}

void __110__AVControlCenterModuleState_updateActiveReactions_currentRenderPTS_requestedTriggers_forCaptureDeviceWithID___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  AVCaptureReactionType AVCaptureReactionTypeForPTEffectReactionType = _AVControlCenterGetAVCaptureReactionTypeForPTEffectReactionType([a3 effectType]);
  if (AVCaptureReactionTypeForPTEffectReactionType)
  {
    AVCaptureReactionType v6 = AVCaptureReactionTypeForPTEffectReactionType;
    memset(&v13, 0, sizeof(v13));
    [a3 startTime];
    CMTimeMakeWithSeconds(&v13, v7, 1000000000);
    int v8 = [AVCaptureReactionEffectState alloc];
    CMTime v12 = v13;
    long long v10 = *(_OWORD *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 56);
    int v9 = [(AVCaptureReactionEffectState *)v8 initWithReactionType:v6 startTime:&v12 endTime:&v10];
    objc_msgSend(*(id *)(a1 + 32), "addObject:", -[AVCaptureReactionEffectState dictionaryRepresentation](v9, "dictionaryRepresentation"));
  }
}

uint64_t __110__AVControlCenterModuleState_updateActiveReactions_currentRenderPTS_requestedTriggers_forCaptureDeviceWithID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  objc_super v4 = (void *)[a2 objectForKeyedSubscript:@"StartTime"];
  uint64_t v5 = [a3 objectForKeyedSubscript:@"StartTime"];

  return [v4 compare:v5];
}

- (NSURL)backgroundReplacementURL
{
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  objc_super v4 = self->_backgroundReplacementURL;
  if (!holdingStateLock) {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  return v4;
}

- (void)setBackgroundReplacementURL:(id)a3
{
  if (a3)
  {
    uint64_t v5 = 0;
    objc_super v4 = (void *)[a3 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&v5];
    if (v5) {
      return;
    }
    a3 = v4;
  }
  +[AVCaptureProprietaryDefaultsSingleton setObject:a3 forKey:self->_backgroundReplacementURLBookmarkKey];
}

- (__CVBuffer)backgroundReplacementPixelBufferFillingWidth:(int)a3 height:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  backgroundReplacementPixelBuffer = self->_backgroundReplacementPixelBuffer;
  if (backgroundReplacementPixelBuffer)
  {
    if (self->_backgroundReplacementPixelBufferFillWidth == v5
      && self->_backgroundReplacementPixelBufferFillHeight == v4)
    {
      CFTypeRef v9 = CFRetain(backgroundReplacementPixelBuffer);
      long long v10 = (__CVBuffer *)CFAutorelease(v9);
      if (!holdingStateLock) {
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    if (!v5 || !v4)
    {
      CFRelease(backgroundReplacementPixelBuffer);
      self->_backgroundReplacementPixelBuffer = 0;
      goto LABEL_15;
    }
LABEL_13:
    long long v10 = 0;
    if (!holdingStateLock) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v5 && v4) {
    goto LABEL_13;
  }
LABEL_15:
  long long v10 = 0;
  *(void *)&self->_backgroundReplacementPixelBufferFillWidth = 0;
  if (!holdingStateLock) {
LABEL_16:
  }
    os_unfair_lock_unlock(&self->_stateLock);
LABEL_17:
  if ((int)v4 >= 1 && (int)v5 >= 1 && !v10)
  {
    long long v10 = +[AVCaptureProprietaryDefaultsSingleton imageForKey:self->_backgroundReplacementURLBookmarkKey fillWidth:v5 fillHeight:v4];
    if (v10
      || ([(AVControlCenterModuleState *)self setBackgroundReplacementURL:+[AVCaptureDevice backgroundReplacementURLDefault](AVCaptureDevice, "backgroundReplacementURLDefault")], (long long v10 = +[AVCaptureProprietaryDefaultsSingleton imageForKey:self->_backgroundReplacementURLBookmarkKey fillWidth:v5 fillHeight:v4]) != 0))
    {
      if (!holdingStateLock) {
        os_unfair_lock_lock(&self->_stateLock);
      }
      uint64_t v11 = self->_backgroundReplacementPixelBuffer;
      self->_backgroundReplacementPixelBuffer = v10;
      CFRetain(v10);
      if (v11) {
        CFRelease(v11);
      }
      self->_backgroundReplacementPixelBufferFillWidth = v5;
      self->_backgroundReplacementPixelBufferFillHeight = v4;
      if (!holdingStateLock) {
        os_unfair_lock_unlock(&self->_stateLock);
      }
    }
  }
  return v10;
}

- (BOOL)hasBackgroundReplacementBeenToggled
{
  return +[AVCaptureProprietaryDefaultsSingleton objectForKey:self->_backgroundReplacementEnabledKey] != 0;
}

- (float)getEffectIntensityForVideoEffect:(id)a3
{
  if (([a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundBlur"] & 1) != 0
    || ([a3 isEqualToString:@"AVControlCenterVideoEffectStudioLighting"] & 1) != 0)
  {
    BOOL holdingStateLock = self->_holdingStateLock;
    if (!self->_holdingStateLock) {
      os_unfair_lock_lock(&self->_stateLock);
    }
    if ([a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundBlur"])
    {
      uint64_t v6 = 128;
    }
    else
    {
      float v7 = 0.0;
      if (![a3 isEqualToString:@"AVControlCenterVideoEffectStudioLighting"]) {
        goto LABEL_10;
      }
      uint64_t v6 = 192;
    }
    float v7 = *(float *)((char *)&self->super.isa + v6);
LABEL_10:
    if (!holdingStateLock) {
      os_unfair_lock_unlock(&self->_stateLock);
    }
    return v7;
  }
  int v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
  return 0.0;
}

- (BOOL)setEffectIntensityForVideoEffect:(float)a3 forVideoEffect:(id)a4
{
  if (([a4 isEqualToString:@"AVControlCenterVideoEffectBackgroundBlur"] & 1) == 0
    && ([a4 isEqualToString:@"AVControlCenterVideoEffectStudioLighting"] & 1) == 0)
  {
    id v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v14);
    }
    NSLog(&cfstr_SuppressingExc.isa, v14);
    return 0;
  }
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
  {
    os_unfair_lock_lock(&self->_stateLock);
    self->_BOOL holdingStateLock = 1;
  }
  if ([a4 isEqualToString:@"AVControlCenterVideoEffectBackgroundBlur"])
  {
    +[AVCaptureDevice backgroundBlurApertureRange];
    if (v8 > a3
      || (+[AVCaptureDevice backgroundBlurApertureRange],
          v10 < a3))
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
LABEL_18:
      uint64_t v16 = (void *)[v11 exceptionWithName:v12 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
      if (!holdingStateLock)
      {
        os_unfair_lock_unlock(&self->_stateLock);
        self->_BOOL holdingStateLock = 0;
      }
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v16);
      }
      NSLog(&cfstr_SuppressingExc.isa, v16);
      return 0;
    }
    uint64_t v13 = 136;
LABEL_25:
    *(float *)&double v9 = a3;
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [NSNumber numberWithFloat:v9], *(Class *)((char *)&self->super.isa + v13));
    BOOL v15 = 1;
    if (holdingStateLock) {
      return v15;
    }
LABEL_26:
    os_unfair_lock_unlock(&self->_stateLock);
    self->_BOOL holdingStateLock = 0;
    return v15;
  }
  if ([a4 isEqualToString:@"AVControlCenterVideoEffectStudioLighting"])
  {
    if (a3 < 0.0 || a3 > 1.0)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
      goto LABEL_18;
    }
    uint64_t v13 = 200;
    goto LABEL_25;
  }
  BOOL v15 = 0;
  if (!holdingStateLock) {
    goto LABEL_26;
  }
  return v15;
}

- (AudioValueRange)getEffectIntensityRangeForVideoEffect:(id)a3
{
  if (([a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundBlur"] & 1) != 0
    || ([a3 isEqualToString:@"AVControlCenterVideoEffectStudioLighting"] & 1) != 0)
  {
    if ([a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundBlur"])
    {
      +[AVCaptureDevice backgroundBlurApertureRange];
    }
    else
    {
      int v6 = [a3 isEqualToString:@"AVControlCenterVideoEffectStudioLighting"];
      double v4 = 0.0;
      double v5 = 1.0;
      if (!v6) {
        double v5 = 0.0;
      }
    }
  }
  else
  {
    float v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
    double v5 = 0.0;
    double v4 = 0.0;
  }
  result.mMaximum = v5;
  result.mMinimum = v4;
  return result;
}

- (float)getEffectIntensityDefaultForVideoEffect:(id)a3
{
  if (([a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundBlur"] & 1) == 0
    && ([a3 isEqualToString:@"AVControlCenterVideoEffectStudioLighting"] & 1) == 0)
  {
    double v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    return 0.0;
  }
  if ([a3 isEqualToString:@"AVControlCenterVideoEffectBackgroundBlur"])
  {
    +[AVCaptureDevice backgroundBlurApertureDefault];
    return result;
  }
  if (![a3 isEqualToString:@"AVControlCenterVideoEffectStudioLighting"]) {
    return 0.0;
  }

  +[AVCaptureDevice studioLightingIntensityDefault];
  return result;
}

- (void)enableBlackenFrames:(BOOL)a3 forDeviceUID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v5 = AVControlCenterBlackenFramesPreferenceKey(self->_bundleID, (uint64_t)a4);
  if (v4) {
    uint64_t v6 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v6 = 0;
  }

  +[AVCaptureProprietaryDefaultsSingleton setObject:v6 forKey:v5];
}

- (id)supportedMicrophoneModes
{
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  if ([(AVControlCenterModuleState *)self micModesSupported])
  {
    BOOL v4 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_supportedMicrophoneModes];
    if (!holdingStateLock) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v4 = (void *)MEMORY[0x1E4F1CBF0];
    if (!holdingStateLock) {
LABEL_7:
    }
      os_unfair_lock_unlock(&self->_stateLock);
  }
  return v4;
}

- (id)hiddenMicrophoneModes
{
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  if (!self->_hiddenMicrophoneModes)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F1CBF0];
    if (holdingStateLock) {
      return v4;
    }
    goto LABEL_5;
  }
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
  if (!holdingStateLock) {
LABEL_5:
  }
    os_unfair_lock_unlock(&self->_stateLock);
  return v4;
}

- (int64_t)microphoneMode
{
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  if ([(AVControlCenterModuleState *)self micModesSupported])
  {
    int64_t microphoneMode = self->_microphoneMode;
    if (!holdingStateLock) {
      goto LABEL_7;
    }
  }
  else
  {
    int64_t microphoneMode = 0;
    if (!holdingStateLock) {
LABEL_7:
    }
      os_unfair_lock_unlock(&self->_stateLock);
  }
  return microphoneMode;
}

- (BOOL)setMicrophoneMode:(int64_t)a3
{
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
  {
    os_unfair_lock_lock(&self->_stateLock);
    self->_BOOL holdingStateLock = 1;
  }
  LODWORD(v6) = [(AVControlCenterModuleState *)self micModesSupported];
  if (v6)
  {
    BOOL v7 = -[NSArray containsObject:](self->_supportedMicrophoneModes, "containsObject:", [NSNumber numberWithInteger:a3]);
    if (a3 && !v7)
    {
      uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
      if (!holdingStateLock)
      {
        os_unfair_lock_unlock(&self->_stateLock);
        self->_BOOL holdingStateLock = 0;
      }
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v6);
      }
      NSLog(&cfstr_SuppressingExc.isa, v6);
      LOBYTE(v6) = 0;
      return (char)v6;
    }
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [NSNumber numberWithInteger:a3], self->_microphoneModeKey);
  }
  if (!holdingStateLock)
  {
    os_unfair_lock_unlock(&self->_stateLock);
    self->_BOOL holdingStateLock = 0;
  }
  return (char)v6;
}

- (int64_t)activeMicrophoneMode
{
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  uint64_t activeMicrophoneMode = self->_activeMicrophoneMode;
  if (activeMicrophoneMode <= 0)
  {
    if (activeMicrophoneMode == -1)
    {
      uint64_t activeMicrophoneMode = self->_microphoneMode;
      if (holdingStateLock) {
        return activeMicrophoneMode;
      }
      goto LABEL_7;
    }
    uint64_t activeMicrophoneMode = 0;
  }
  if (!holdingStateLock) {
LABEL_7:
  }
    os_unfair_lock_unlock(&self->_stateLock);
  return activeMicrophoneMode;
}

- (BOOL)voiceProcessingBypassed
{
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  if ([(AVControlCenterModuleState *)self micModesSupported])
  {
    BOOL auVoiceIOBypassVoiceProcessing = self->_auVoiceIOBypassVoiceProcessing;
    if (!holdingStateLock) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL auVoiceIOBypassVoiceProcessing = 0;
    if (!holdingStateLock) {
LABEL_7:
    }
      os_unfair_lock_unlock(&self->_stateLock);
  }
  return auVoiceIOBypassVoiceProcessing;
}

- (BOOL)isAutoMicrophoneModeEnabled
{
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  if ([(AVControlCenterModuleState *)self isAutoMicrophoneModeSupported])
  {
    BOOL autoMicModeEnabled = self->_autoMicModeEnabled;
    if (!holdingStateLock) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL autoMicModeEnabled = 0;
    if (!holdingStateLock) {
LABEL_7:
    }
      os_unfair_lock_unlock(&self->_stateLock);
  }
  return autoMicModeEnabled;
}

- (BOOL)setAutoMicrophoneModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
  {
    os_unfair_lock_lock(&self->_stateLock);
    self->_BOOL holdingStateLock = 1;
  }
  BOOL v6 = [(AVControlCenterModuleState *)self isAutoMicrophoneModeSupported];
  if (v6) {
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [NSNumber numberWithBool:v3], self->_autoMicModeEnabledKey);
  }
  if (!holdingStateLock)
  {
    os_unfair_lock_unlock(&self->_stateLock);
    self->_BOOL holdingStateLock = 0;
  }
  return v6;
}

- (void)startPanningAtPoint:(CGPoint)a3
{
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(a3);
  +[AVCaptureProprietaryDefaultsSingleton setObject:DictionaryRepresentation forKey:self->_startPanningAtPointKey];

  CFRelease(DictionaryRepresentation);
}

- (void)panWithTranslation:(CGPoint)a3
{
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(a3);
  +[AVCaptureProprietaryDefaultsSingleton setObject:DictionaryRepresentation forKey:self->_panWithTranslationKey];

  CFRelease(DictionaryRepresentation);
}

- (void)setManualFramingOriginalZoomFactor:(double)a3 convertedZoomFactor:(double)a4
{
  void v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = AVControlCenterManualFramingOriginalVideoZoomFactor;
  v13[0] = objc_msgSend(NSNumber, "numberWithDouble:");
  v12[1] = AVControlCenterManualFramingConvertedVideoZoomFactor;
  uint64_t v7 = [NSNumber numberWithDouble:a4];
  v12[2] = AVControlCenterManualFramingUpdateSettingEntity;
  v13[1] = v7;
  v13[2] = @"ControlCenterModules";
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVControlCenterModuleState _checkManualFramingDefaultStateWithNewOriginalZoomFactor:](self, "_checkManualFramingDefaultStateWithNewOriginalZoomFactor:", a3, v10, v11);
  +[AVCaptureProprietaryDefaultsSingleton setObject:v8 forKey:self->_manualFramingVideoZoomFactorKey];
}

- (double)manualFramingOriginalVideoZoomFactor
{
  id v3 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:self->_manualFramingVideoZoomFactorKey];
  if (v3 && (BOOL v4 = v3, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = (void *)[v4 objectForKeyedSubscript:AVControlCenterManualFramingOriginalVideoZoomFactor];
    uint64_t v6 = [v4 objectForKeyedSubscript:AVControlCenterManualFramingConvertedVideoZoomFactor];
    if (v5)
    {
      [v5 floatValue];
      double v8 = v7;
    }
    else
    {
      uint64_t v13 = (void *)v6;
      int64_t v14 = [(AVControlCenterModuleState *)self manualFramingDeviceType];
      [v13 floatValue];
      double v16 = v15;
      if (v14 == 2) {
        double v8 = v16 * 0.5;
      }
      else {
        double v8 = v16;
      }
    }
    [(AVControlCenterModuleState *)self _defaultOriginalVideoZoomFactor];
    double v10 = v17;
    if (vabdd_f64(v8, v17) >= 0.00999999978)
    {
      double v10 = v8;
    }
    else
    {
      if (!dword_1EB4C9160) {
        return v10;
      }
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    [(AVControlCenterModuleState *)self _defaultOriginalVideoZoomFactor];
    double v10 = v9;
  }
  if (dword_1EB4C9160)
  {
    uint64_t v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v10;
}

- (void)performOneShotFraming
{
}

- (void)resetFraming
{
}

- (BOOL)manualFramingEnabledForDevice:(id)a3
{
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  if ([a3 isCenterStageActive])
  {
    BOOL centerStageSupported = 0;
    if (!holdingStateLock) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL centerStageSupported = self->_centerStageSupported;
    if (!holdingStateLock) {
LABEL_7:
    }
      os_unfair_lock_unlock(&self->_stateLock);
  }
  return centerStageSupported;
}

- (BOOL)manualFramingIsAtDefault
{
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock)
  {
    os_unfair_lock_lock(&self->_stateLock);
    self->_BOOL holdingStateLock = 1;
  }
  CFDictionaryRef v4 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:self->_panningAnglesKey];
  [(AVControlCenterModuleState *)self manualFramingOriginalVideoZoomFactor];
  double v6 = v5;
  [(AVControlCenterModuleState *)self _defaultOriginalVideoZoomFactor];
  double v8 = v7;
  if (!holdingStateLock)
  {
    os_unfair_lock_unlock(&self->_stateLock);
    self->_BOOL holdingStateLock = 0;
  }
  v11.x = 0.0;
  v11.y = 0.0;
  BOOL v9 = CGPointMakeWithDictionaryRepresentation(v4, &v11);
  if (v9)
  {
    LOBYTE(v9) = 0;
    if (fabs(v11.x) < 0.00999999978 && fabs(v11.y) < 0.00999999978) {
      LOBYTE(v9) = vabdd_f64(v6, v8) < 0.00999999978;
    }
  }
  return v9;
}

- (void)setCenterStageFieldOfViewRestrictedToWide:(BOOL)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = AVControlCenterCenterStageFieldOfViewRestrictedToWide;
  uint64_t v4 = [NSNumber numberWithBool:a3];
  v5[1] = AVControlCenterManualFramingUpdateSettingEntity;
  v6[0] = v4;
  v6[1] = @"ControlCenterModules";
  +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2], self->_centerStageFieldOfViewRestrictedToWideKey);
}

- (BOOL)centerStageFieldOfViewRestrictedToWide
{
  id v2 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:self->_centerStageFieldOfViewRestrictedToWideKey];
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = (void *)[v3 objectForKeyedSubscript:AVControlCenterCenterStageFieldOfViewRestrictedToWide];

  return [v4 BOOLValue];
}

- (void)setManualFramingDeviceType:(int64_t)a3
{
  if (self->_holdingStateLock)
  {
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [NSNumber numberWithInteger:a3], self->_manualFramingDeviceTypeKey);
    self->_manualFramingDeviceType = a3;
  }
  else
  {
    os_unfair_lock_lock(&self->_stateLock);
    self->_BOOL holdingStateLock = 1;
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", [NSNumber numberWithInteger:a3], self->_manualFramingDeviceTypeKey);
    self->_manualFramingDeviceType = a3;
    os_unfair_lock_unlock(&self->_stateLock);
    self->_BOOL holdingStateLock = 0;
  }
}

- (int64_t)manualFramingDeviceType
{
  return self->_manualFramingDeviceType;
}

- (NSDictionary)zoomFactorConstantsByManualFramingDeviceType
{
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->_zoomFactorConstantsByManualFramingDeviceType];
}

- (void)invalidateDeviceBasedModuleStatesIfNeeded
{
  if ([(AVControlCenterModuleState *)self isDeviceBasedModuleState])
  {
    if (self->_deviceSupportsManualFraming)
    {
      if (self->_observingManualFramingProprietaryDefaultKeys)
      {
        +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_centerStageFieldOfViewRestrictedToWideKey];
        +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_dockedTrackingActiveKey];
        +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_oneShotFramingCompletedKey];
        +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_resetFramingCompletedKey];
        +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_panningAnglesKey];
        +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_manualFramingVideoZoomFactorKey];
        self->_observingManualFramingProprietaryDefaultKeys = 0;
      }

      self->_startPanningAtPointKey = 0;
      self->_panWithTranslationKey = 0;

      self->_manualFramingVideoZoomFactorKey = 0;
      self->_performOneShotFramingKey = 0;

      self->_resetFramingKey = 0;
      self->_oneShotFramingCompletedKey = 0;

      self->_resetFramingCompletedKey = 0;
      self->_panningAnglesKey = 0;

      self->_manualFramingDeviceTypeKey = 0;
      self->_zoomFactorConstantsByManualFramingDeviceType = 0;

      self->_centerStageFieldOfViewRestrictedToWideKey = 0;
    }
    if (self->_observingDockedTrackingProprietaryDefaultKey)
    {
      +[AVCaptureProprietaryDefaultsSingleton removeObserver:self forKey:self->_dockedTrackingActiveKey];

      self->_dockedTrackingActiveKey = 0;
      self->_observingDockedTrackingProprietaryDefaultKey = 0;
    }
  }
}

- (double)_defaultOriginalVideoZoomFactor
{
  int64_t v3 = [(AVControlCenterModuleState *)self manualFramingDeviceType];
  uint64_t v4 = [(AVControlCenterModuleState *)self zoomFactorConstantsByManualFramingDeviceType];
  id v5 = -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", objc_msgSend(NSString, "stringWithFormat:", @"%d", v3));
  objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F50FF8]), "floatValue");
  double result = v6;
  if (v3 == 2) {
    return result * 0.5;
  }
  return result;
}

- (void)_proprietaryDefaultChanged:(id)a3 keyPath:(id)a4 context:(void *)a5
{
  float v6 = (NSURL *)a3;
  v121[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  if ((void *)AVCCM_AUVoiceIOBypassVoiceProcessingChangedContext == a5)
  {
    BOOL v13 = [(AVControlCenterModuleState *)self micModesSupported];
    if (v6) {
      LODWORD(v6) = [(NSURL *)v6 BOOLValue];
    }
    uint64_t v11 = 0;
    if (holdingStateLock)
    {
      uint64_t v12 = 0;
    }
    else
    {
      BOOL v14 = !v13;
      uint64_t v12 = 0;
      if (!v14)
      {
        if (self->_auVoiceIOBypassVoiceProcessing == v6)
        {
          uint64_t v11 = 0;
          uint64_t v12 = 0;
        }
        else
        {
          v119 = @"AVControlCenterModulesNotificationBundleIdentifierKey";
          bundleID = self->_bundleID;
          uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&bundleID forKeys:&v119 count:1];
          uint64_t v12 = @"AVControlCenterMicrophoneModesModuleVoiceProcessingBypassedDidChangeNotification";
        }
      }
    }
    self->_BOOL auVoiceIOBypassVoiceProcessing = (char)v6;
    goto LABEL_121;
  }
  if ((void *)AVCCM_AUVoiceIOChatFlavorChangedContext == a5)
  {
    BOOL v15 = [(AVControlCenterModuleState *)self micModesSupported];
    if (v6) {
      float v6 = (NSURL *)[(NSURL *)v6 integerValue];
    }
    uint64_t v11 = 0;
    if (holdingStateLock)
    {
      uint64_t v12 = 0;
    }
    else
    {
      BOOL v16 = !v15;
      uint64_t v12 = 0;
      if (!v16)
      {
        if (v6 == (NSURL *)self->_microphoneMode)
        {
          uint64_t v11 = 0;
          uint64_t v12 = 0;
        }
        else
        {
          v20 = self->_bundleID;
          v117 = @"AVControlCenterModulesNotificationBundleIdentifierKey";
          v118 = v20;
          uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
          uint64_t v12 = @"AVControlCenterMicrophoneModesModuleMicrophoneModeDidChangeNotification";
        }
      }
    }
    self->_int64_t microphoneMode = (int64_t)v6;
    goto LABEL_121;
  }
  if ((void *)AVCCM_AUVoiceIOActiveChatFlavorChangedContext == a5)
  {
    BOOL v17 = [(AVControlCenterModuleState *)self micModesSupported];
    if (v6) {
      int64_t v18 = [(NSURL *)v6 integerValue];
    }
    else {
      int64_t v18 = -1;
    }
    uint64_t v11 = 0;
    if (holdingStateLock)
    {
      uint64_t v12 = 0;
    }
    else
    {
      BOOL v21 = !v17;
      uint64_t v12 = 0;
      if (!v21)
      {
        if (v18 == self->_activeMicrophoneMode)
        {
          uint64_t v11 = 0;
          uint64_t v12 = 0;
        }
        else
        {
          v22 = self->_bundleID;
          v115 = @"AVControlCenterModulesNotificationBundleIdentifierKey";
          v116 = v22;
          uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
          uint64_t v12 = @"AVControlCenterMicrophoneModesModuleActiveMicrophoneModeDidChangeNotification";
        }
      }
    }
    self->_uint64_t activeMicrophoneMode = v18;
    goto LABEL_121;
  }
  if ((void *)AVCCM_AUVoiceIOSupportedChatFlavorsChangedContext == a5)
  {
    if (!v6)
    {
      float v6 = (NSURL *)AVControlCenterAudioDefaultSupportedMicrophoneModesForBundleID(self->_bundleID);
      if (dword_1EB4C9160)
      {
        v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    BOOL v29 = [(AVControlCenterModuleState *)self micModesSupported];
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    if (!holdingStateLock && v29)
    {
      if ([(NSURL *)v6 isEqual:self->_supportedMicrophoneModes])
      {
        uint64_t v11 = 0;
        uint64_t v12 = 0;
      }
      else
      {
        v30 = self->_bundleID;
        v113 = @"AVControlCenterModulesNotificationBundleIdentifierKey";
        v114 = v30;
        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
        uint64_t v12 = @"AVControlCenterMicrophoneModesModuleSupportedMicrophoneModesDidChangeNotification";
      }
    }

    self->_supportedMicrophoneModes = (NSArray *)v6;
    goto LABEL_121;
  }
  if ((void *)AVCCM_AUVoiceIOHiddenChatFlavorsChangedContext == a5)
  {
    if (!v6) {
      float v6 = (NSURL *)MEMORY[0x1E4F1CBF0];
    }
    if (holdingStateLock
      || (hiddenMicrophoneModes = self->_hiddenMicrophoneModes) == 0
      || (-[NSURL isEqual:](v6, "isEqual:", hiddenMicrophoneModes, a4) & 1) != 0)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      v25 = self->_bundleID;
      v111 = @"AVControlCenterModulesNotificationBundleIdentifierKey";
      v112 = v25;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
      uint64_t v12 = @"AVControlCenterMicrophoneModesModuleHiddenMicrophoneModesDidChangeNotification";
    }

    self->_hiddenMicrophoneModes = (NSArray *)v6;
    goto LABEL_121;
  }
  if ((void *)AVCCM_AUVoiceIOAutoEnabledChangedContext == a5)
  {
    if (v6)
    {
      int IsAutoMicrophoneEnabledForBundleIDAndMicMode = [(NSURL *)v6 BOOLValue];
    }
    else
    {
      int IsAutoMicrophoneEnabledForBundleIDAndMicMode = AVControlCenterAudioDefaultIsAutoMicrophoneEnabledForBundleIDAndMicMode((uint64_t)self->_bundleID, self->_microphoneMode);
      if (dword_1EB4C9160)
      {
        v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    BOOL v36 = [(AVControlCenterModuleState *)self isAutoMicrophoneModeSupported];
    if (holdingStateLock || !v36 || self->_autoMicModeEnabled == IsAutoMicrophoneEnabledForBundleIDAndMicMode)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      v37 = self->_bundleID;
      v109 = @"AVControlCenterModulesNotificationBundleIdentifierKey";
      v110 = v37;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
      uint64_t v12 = @"AVControlCenterMicrophoneModesModuleAutoEnabledDidChangeNotification";
    }
    self->_BOOL autoMicModeEnabled = IsAutoMicrophoneEnabledForBundleIDAndMicMode;
    goto LABEL_121;
  }
  if ((void *)AVCCM_CenterStageControlModeChangedContext == a5)
  {
    if (v6) {
      float v6 = (NSURL *)[(NSURL *)v6 integerValue];
    }
    if (holdingStateLock || v6 == (NSURL *)self->_centerStageControlMode)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      v107[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
      v107[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
      v32 = self->_bundleID;
      v108[0] = @"AVControlCenterVideoEffectCenterStage";
      v108[1] = v32;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:2];
      uint64_t v12 = @"AVControlCenterVideoEffectsModuleEffectControlModeDidChangeNotification";
    }
    self->_int64_t centerStageControlMode = (int64_t)v6;
    goto LABEL_121;
  }
  if ((void *)AVCCM_CenterStageEnabledChangedContext == a5)
  {
    if (v6) {
      int v26 = [(NSURL *)v6 BOOLValue];
    }
    else {
      int v26 = +[AVCaptureDevice defaultCenterStageEnabledForBundleID:](AVCaptureDevice, "defaultCenterStageEnabledForBundleID:", self->_bundleID, a4);
    }
    BOOL v31 = v26;
    if (holdingStateLock || self->_centerStageEnabled == v26)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      v105[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
      v105[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
      v39 = self->_bundleID;
      v106[0] = @"AVControlCenterVideoEffectCenterStage";
      v106[1] = v39;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:2];
      uint64_t v12 = @"AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification";
    }
    self->_BOOL centerStageEnabled = v31;
    goto LABEL_121;
  }
  if ((void *)AVCCM_CenterStageUnavailableReasonsChangedContext == a5)
  {
    if (v6) {
      uint64_t v28 = [(NSURL *)v6 unsignedIntegerValue];
    }
    else {
      uint64_t v28 = 0;
    }
    v103[0] = @"AVControlCenterModulesNotificationCenterStageUnavailableReasonsKey";
    v103[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
    v104[0] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v28, v71, v72);
    v104[1] = self->_bundleID;
    v33 = (void *)MEMORY[0x1E4F1C9E8];
    v34 = v104;
    v35 = v103;
    goto LABEL_114;
  }
  if ((void *)AVCCM_BackgroundBlurControlModeChangedContext == a5)
  {
    if (v6) {
      float v6 = (NSURL *)[(NSURL *)v6 integerValue];
    }
    if (holdingStateLock || v6 == (NSURL *)self->_backgroundBlurControlMode)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      v101[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
      v101[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
      v42 = self->_bundleID;
      v102[0] = @"AVControlCenterVideoEffectBackgroundBlur";
      v102[1] = v42;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:2];
      uint64_t v12 = @"AVControlCenterVideoEffectsModuleEffectControlModeDidChangeNotification";
    }
    self->_backgroundBlurControlMode = (int64_t)v6;
    goto LABEL_121;
  }
  if ((void *)AVCCM_BackgroundBlurEnabledChangedContext == a5)
  {
    if (v6) {
      LODWORD(v6) = [(NSURL *)v6 BOOLValue];
    }
    if (holdingStateLock || self->_backgroundBlurEnabled == v6)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      v99[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
      v99[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
      v43 = self->_bundleID;
      v100[0] = @"AVControlCenterVideoEffectBackgroundBlur";
      v100[1] = v43;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:2];
      uint64_t v12 = @"AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification";
    }
    self->_backgroundBlurEnabled = (char)v6;
    goto LABEL_121;
  }
  if ((void *)AVCCM_BackgroundBlurUnavailableReasonsChangedContext == a5)
  {
    if (v6) {
      uint64_t v40 = [(NSURL *)v6 unsignedIntegerValue];
    }
    else {
      uint64_t v40 = 0;
    }
    v97[0] = @"AVControlCenterModulesNotificationBackgroundBlurUnavailableReasonsKey";
    v97[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
    v98[0] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v40, v71, v72);
    v98[1] = self->_bundleID;
    v33 = (void *)MEMORY[0x1E4F1C9E8];
    v34 = v98;
    v35 = v97;
    goto LABEL_114;
  }
  if ((void *)AVCCM_BackgroundBlurApertureChangedContext == a5)
  {
    if (v6) {
      [(NSURL *)v6 floatValue];
    }
    else {
      +[AVCaptureDevice backgroundBlurApertureDefault];
    }
    float v44 = v41;
    if (holdingStateLock || v41 == self->_backgroundBlurAperture)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      v95[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
      v95[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
      v45 = self->_bundleID;
      v96[0] = @"AVControlCenterVideoEffectBackgroundBlur";
      v96[1] = v45;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:2];
      uint64_t v12 = @"AVControlCenterVideoEffectsModuleEffectIntensityDidChangeNotification";
    }
    self->_backgroundBlurAperture = v44;
    goto LABEL_121;
  }
  if ((void *)AVCCM_StudioLightingControlModeChangedContext == a5)
  {
    if (v6) {
      float v6 = (NSURL *)[(NSURL *)v6 integerValue];
    }
    if (holdingStateLock || v6 == (NSURL *)self->_studioLightingControlMode)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      v93[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
      v93[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
      v48 = self->_bundleID;
      v94[0] = @"AVControlCenterVideoEffectStudioLighting";
      v94[1] = v48;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:2];
      uint64_t v12 = @"AVControlCenterVideoEffectsModuleEffectControlModeDidChangeNotification";
    }
    self->_studioLightingControlMode = (int64_t)v6;
    goto LABEL_121;
  }
  if ((void *)AVCCM_StudioLightingEnabledChangedContext == a5)
  {
    if (v6) {
      LODWORD(v6) = [(NSURL *)v6 BOOLValue];
    }
    if (holdingStateLock || self->_studioLightingEnabled == v6)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      v91[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
      v91[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
      v49 = self->_bundleID;
      v92[0] = @"AVControlCenterVideoEffectStudioLighting";
      v92[1] = v49;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:2];
      uint64_t v12 = @"AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification";
    }
    self->_studioLightingEnabled = (char)v6;
    goto LABEL_121;
  }
  if ((void *)AVCCM_StudioLightingUnavailableReasonsChangedContext == a5)
  {
    if (v6) {
      uint64_t v46 = [(NSURL *)v6 unsignedIntegerValue];
    }
    else {
      uint64_t v46 = 0;
    }
    v89[0] = @"AVControlCenterModulesNotificationStudioLightingUnavailableReasonsKey";
    v89[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
    v90[0] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v46, v71, v72);
    v90[1] = self->_bundleID;
    v33 = (void *)MEMORY[0x1E4F1C9E8];
    v34 = v90;
    v35 = v89;
    goto LABEL_114;
  }
  if ((void *)AVCCM_StudioLightingIntensityChangedContext == a5)
  {
    if (v6) {
      [(NSURL *)v6 floatValue];
    }
    else {
      +[AVCaptureDevice studioLightingIntensityDefault];
    }
    float v50 = v47;
    if (holdingStateLock || v47 == self->_studioLightingIntensity)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      v87[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
      v87[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
      v51 = self->_bundleID;
      v88[0] = @"AVControlCenterVideoEffectStudioLighting";
      v88[1] = v51;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:2];
      uint64_t v12 = @"AVControlCenterVideoEffectsModuleEffectIntensityDidChangeNotification";
    }
    self->_studioLightingIntensity = v50;
    goto LABEL_121;
  }
  if ((void *)AVCCM_ManualFramingOneShotFramingCompletedContext == a5)
  {
    uint64_t v12 = @"AVControlCenterManualFramingOneShotFramingDidCompleteNotification";
LABEL_166:
    uint64_t v11 = MEMORY[0x1E4F1CC08];
    goto LABEL_121;
  }
  if ((void *)AVCCM_ManualFramingResetFramingCompletedContext == a5)
  {
    uint64_t v12 = @"AVControlCenterManualFramingResetFramingDidCompleteNotification";
    goto LABEL_166;
  }
  if ((void *)AVCCM_ReactionsEnabledChangedContext == a5)
  {
    if (v6)
    {
      int isOptedInForReactionEffects = [(NSURL *)v6 BOOLValue];
    }
    else
    {
      int isOptedInForReactionEffects = self->_isOptedInForReactionEffects;
      v55 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (holdingStateLock || self->_reactionsEnabled == isOptedInForReactionEffects)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      v85[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
      v85[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
      v64 = self->_bundleID;
      v86[0] = @"AVControlCenterVideoEffectReactions";
      v86[1] = v64;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:2];
      uint64_t v12 = @"AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification";
    }
    self->_reactionsEnabled = isOptedInForReactionEffects;
    goto LABEL_121;
  }
  if ((void *)AVCCM_GesturesEnabledChangedContext == a5)
  {
    if (v6)
    {
      if (dword_1EB4C9160)
      {
        v53 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v56 = v6;
LABEL_202:
      int v60 = [(NSURL *)v56 BOOLValue];
      if (holdingStateLock) {
        goto LABEL_226;
      }
      goto LABEL_203;
    }
    v56 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", self->_gesturesEnabledDefaultKey, a4);
    if (v56) {
      goto LABEL_202;
    }
    v57 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:self->_bundleID allowPlaceholder:1 error:0];
    v58 = (void *)[v57 infoDictionary];
    v59 = (void *)[v58 objectForKey:AVCaptureBundleCameraReactionEffectGesturesEnabledDefaultKey ofClass:objc_opt_class()];
    if (v59)
    {
      int v60 = [v59 BOOLValue];
      if (!dword_1EB4C9160) {
        goto LABEL_225;
      }
    }
    else
    {
      int v60 = FigGetCFPreferenceBooleanWithDefault() != 0;
      if (!dword_1EB4C9160)
      {
LABEL_225:

        if (holdingStateLock) {
          goto LABEL_226;
        }
LABEL_203:
        if (self->_gesturesEnabled != v60)
        {
          v83[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
          v83[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
          v65 = self->_bundleID;
          v84[0] = @"AVControlCenterVideoEffectGestures";
          v84[1] = v65;
          uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:2];
          uint64_t v12 = @"AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification";
LABEL_227:
          self->_gesturesEnabled = v60;
          goto LABEL_121;
        }
LABEL_226:
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        goto LABEL_227;
      }
    }
    v61 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_225;
  }
  if ((void *)AVCCM_ReactionsUnavailableReasonsChangedContext == a5)
  {
    if (v6) {
      uint64_t v54 = [(NSURL *)v6 unsignedIntegerValue];
    }
    else {
      uint64_t v54 = 0;
    }
    v81[0] = @"AVControlCenterModulesNotificationReactionsUnavailableReasonsKey";
    uint64_t v62 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v54, v71, v72);
    v81[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
    v63 = self->_bundleID;
    v82[0] = v62;
    v82[1] = v63;
    v33 = (void *)MEMORY[0x1E4F1C9E8];
    v34 = v82;
    v35 = v81;
    goto LABEL_114;
  }
  double v10 = a5;
  if ((void *)AVCCM_ReactionEffectTriggeredContext == a5)
  {
    uint64_t v12 = @"AVControlCenterVideoEffectsReactionWasRequestedNotification";
LABEL_187:
    uint64_t v11 = (uint64_t)v6;
    goto LABEL_121;
  }
  if ((void *)AVCCM_ReactionEffectsInProgressChangedContext == a5)
  {
    uint64_t v12 = @"AVControlCenterVideoEffectsReactionsInProgressDidChangeNotification";
    goto LABEL_187;
  }
  if ((void *)AVCCM_BackgroundReplacementEnabledChangedContext != a5)
  {
    if ((void *)AVCCM_BackgroundReplacementUnavailableReasonsChangedContext != a5)
    {
      if ((void *)AVCCM_BackgroundReplacementURLChangedContext == a5)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (v6 && (isKindOfClass & 1) == 0) {
          -[AVControlCenterModuleState _proprietaryDefaultChanged:keyPath:context:]();
        }
        if (v6)
        {
          v121[0] = 0;
          float v6 = (NSURL *)[MEMORY[0x1E4F1CB10] URLByResolvingBookmarkData:v6 options:256 relativeToURL:0 bookmarkDataIsStale:0 error:v121];
        }
        if (holdingStateLock || v6 == self->_backgroundReplacementURL || (-[NSURL isEqual:](v6, "isEqual:") & 1) != 0)
        {
          uint64_t v11 = 0;
          uint64_t v12 = 0;
        }
        else
        {
          v75[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
          v75[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
          v70 = self->_bundleID;
          v76[0] = @"AVControlCenterVideoEffectBackgroundReplacement";
          v76[1] = v70;
          uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2];
          uint64_t v12 = @"AVControlCenterVideoEffectsBackgroundReplacementURLDidChangeNotification";
        }

        self->_backgroundReplacementURL = v6;
        backgroundReplacementPixelBuffer = self->_backgroundReplacementPixelBuffer;
        if (backgroundReplacementPixelBuffer)
        {
          CFRelease(backgroundReplacementPixelBuffer);
          self->_backgroundReplacementPixelBuffer = 0;
        }
        *(void *)&self->_backgroundReplacementPixelBufferFillWidth = 0;
      }
      else
      {
        uint64_t v11 = 0;
        if (v6)
        {
          uint64_t v12 = 0;
          if ((void *)AVCCM_DockedTrackingActiveChangedContext == v10)
          {
            v73 = @"dockedTrackingActive";
            v74 = v6;
            uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
            uint64_t v12 = @"AVControlCenterDockedTrackingActiveDidChangeNotification";
          }
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      goto LABEL_121;
    }
    if (v6) {
      uint64_t v66 = [(NSURL *)v6 unsignedIntegerValue];
    }
    else {
      uint64_t v66 = 0;
    }
    v77[0] = @"AVControlCenterModulesNotificationBackgroundReplacementUnavailableReasonsKey";
    v77[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
    v78[0] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v66, v71, v72);
    v78[1] = self->_bundleID;
    v33 = (void *)MEMORY[0x1E4F1C9E8];
    v34 = v78;
    v35 = v77;
LABEL_114:
    uint64_t v11 = [v33 dictionaryWithObjects:v34 forKeys:v35 count:2];
    uint64_t v12 = @"AVControlCenterVideoEffectsUnavailableReasonsDidChangeNotification";
    goto LABEL_121;
  }
  if (v6) {
    LODWORD(v6) = [(NSURL *)v6 BOOLValue];
  }
  if (holdingStateLock || self->_backgroundReplacementEnabled == v6)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  else
  {
    v79[0] = @"AVControlCenterModulesNotificationVideoEffectKey";
    v79[1] = @"AVControlCenterModulesNotificationBundleIdentifierKey";
    v69 = self->_bundleID;
    v80[0] = @"AVControlCenterVideoEffectBackgroundReplacement";
    v80[1] = v69;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2];
    uint64_t v12 = @"AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification";
  }
  self->_backgroundReplacementEnabled = (char)v6;
LABEL_121:
  if (!holdingStateLock) {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  if (v12 && v11)
  {
    if (dword_1EB4C9160)
    {
      v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v71, v72), "postNotificationName:object:userInfo:", v12, 0, v11);
  }
}

- (void)_handlePanningAnglesUpdate:(id)a3
{
  v28[24] = *MEMORY[0x1E4F143B8];
  point.x = 0.0;
  point.y = 0.0;
  CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)a3, &point);
  if (dword_1EB4C9160)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  [(AVControlCenterModuleState *)self _defaultOriginalVideoZoomFactor];
  double v7 = v6;
  float currentOriginalZoomFactor = self->_currentOriginalZoomFactor;
  float currentPanningAngleX = self->_currentPanningAngleX;
  float currentPanningAngleY = self->_currentPanningAngleY;
  *(CGPoint *)&self->_float currentPanningAngleX = point;
  if (!holdingStateLock) {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  BOOL v11 = 0;
  double v12 = currentOriginalZoomFactor;
  if (fabs(currentPanningAngleX) < 0.00999999978 && fabs(currentPanningAngleY) < 0.00999999978) {
    BOOL v11 = vabdd_f64(v12, v7) < 0.00999999978;
  }
  BOOL v13 = fabs(point.x) < 0.00999999978;
  if (fabs(point.y) >= 0.00999999978) {
    BOOL v13 = 0;
  }
  if (v11 && !v13)
  {
    if (dword_1EB4C9160)
    {
      BOOL v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v27 = @"isAtDefault";
    v28[0] = MEMORY[0x1E4F1CC28];
    BOOL v16 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v17 = v28;
    int64_t v18 = &v27;
LABEL_24:
    uint64_t v19 = objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1, v12, v21, v23);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVControlCenterManualFramingDefaultStateDidUpdateNotification", 0, v19);
    return;
  }
  double v12 = vabdd_f64(v12, v7);
  if (v12 >= 0.00999999978) {
    LOBYTE(v11) = 1;
  }
  if (!v11 && v13)
  {
    if (dword_1EB4C9160)
    {
      BOOL v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v25 = @"isAtDefault";
    uint64_t v26 = MEMORY[0x1E4F1CC38];
    BOOL v16 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v17 = &v26;
    int64_t v18 = &v25;
    goto LABEL_24;
  }
}

- (void)_handleBackPropagatedVideoZoomFactorUpdate:(id)a3
{
  v17[24] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 objectForKeyedSubscript:AVControlCenterManualFramingConvertedVideoZoomFactor];
  int64_t v5 = [(AVControlCenterModuleState *)self manualFramingDeviceType];
  [v4 floatValue];
  double v7 = v6;
  if (v5 == 2) {
    double v8 = v7 * 0.5;
  }
  else {
    double v8 = v7;
  }
  [(AVControlCenterModuleState *)self _defaultOriginalVideoZoomFactor];
  *(float *)&double v9 = v9;
  double v10 = *(float *)&v9;
  if (vabdd_f64(v8, *(float *)&v9) >= 0.00999999978)
  {
    double v10 = v8;
  }
  else
  {
    if (!dword_1EB4C9160) {
      goto LABEL_10;
    }
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (dword_1EB4C9160)
  {
    double v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_10:
  BOOL v13 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v14, v15);
  BOOL v16 = @"videoZoomFactor";
  v17[0] = [NSNumber numberWithDouble:v10];
  objc_msgSend(v13, "postNotificationName:object:userInfo:", @"AVControlCenterManualFramingVideoZoomFactorDidChangeNotification", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1));
  [(AVControlCenterModuleState *)self _checkManualFramingDefaultStateWithNewOriginalZoomFactor:v10];
}

- (void)_checkManualFramingDefaultStateWithNewOriginalZoomFactor:(double)a3
{
  v24[22] = *MEMORY[0x1E4F143B8];
  BOOL holdingStateLock = self->_holdingStateLock;
  if (!self->_holdingStateLock) {
    os_unfair_lock_lock(&self->_stateLock);
  }
  [(AVControlCenterModuleState *)self _defaultOriginalVideoZoomFactor];
  double v7 = v6;
  double currentPanningAngleX = self->_currentPanningAngleX;
  double currentPanningAngleY = self->_currentPanningAngleY;
  double currentOriginalZoomFactor = self->_currentOriginalZoomFactor;
  self->_double currentOriginalZoomFactor = a3;
  if (!holdingStateLock) {
    os_unfair_lock_unlock(&self->_stateLock);
  }
  if (fabs(currentPanningAngleX) < 0.00999999978 && fabs(currentPanningAngleY) < 0.00999999978)
  {
    double v11 = vabdd_f64(currentOriginalZoomFactor, v7);
    double v12 = vabdd_f64(a3, v7);
    if (v11 < 0.00999999978 && v12 >= 0.00999999978)
    {
      if (dword_1EB4C9160)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v23 = @"isAtDefault";
      v24[0] = MEMORY[0x1E4F1CC28];
      uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
      BOOL v16 = v24;
      BOOL v17 = &v23;
LABEL_17:
      uint64_t v18 = objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1, v19, v20);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVControlCenterManualFramingDefaultStateDidUpdateNotification", 0, v18);
      return;
    }
    if (v11 >= 0.00999999978 && v12 < 0.00999999978)
    {
      if (dword_1EB4C9160)
      {
        uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v21 = @"isAtDefault";
      uint64_t v22 = MEMORY[0x1E4F1CC38];
      uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
      BOOL v16 = &v22;
      BOOL v17 = &v21;
      goto LABEL_17;
    }
  }
}

- (void)_proprietaryDefaultChanged:keyPath:context:.cold.1()
{
  __assert_rtn("-[AVControlCenterModuleState _proprietaryDefaultChanged:keyPath:context:]", "AVControlCenterModules.m", 3043, "[newValue isKindOfClass:[NSData class]] || newValue == nil");
}

@end