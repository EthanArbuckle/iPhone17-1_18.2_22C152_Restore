@interface SCATInputController
- (AXAccessQueue)queue;
- (AXDispatchTimer)inputHoldTimer;
- (AXDispatchTimer)inputLongPressTimer;
- (AXDispatchTimer)inputRepeatTimer;
- (AXSSInterDeviceCommunicator)interDeviceCommunicator;
- (AXSwitchRecipe)recipe;
- (AXUIClient)userInterfaceClient;
- (BOOL)_handleHoldAtPointForActionIdentifier:(id)a3 start:(BOOL)a4;
- (BOOL)_hasExternalSwitchConfigured;
- (BOOL)_isSwitchWithSource:(id)a3 isEnabled:(id)a4;
- (BOOL)_switchConfigurationHasScreenSwitch;
- (BOOL)_switchConfigurationRendersDeviceUnusable;
- (BOOL)hasInitializedInputSources;
- (BOOL)isEnabledSwitchWithSource:(id)a3;
- (BOOL)isInputCoalesceEnabled;
- (BOOL)isInputHoldEnabled;
- (BOOL)isInputRepeatEnabled;
- (BOOL)isSwitchWithSource:(id)a3;
- (BOOL)isValid;
- (BOOL)motionTrackerLostFace;
- (BOOL)motionTrackingEnabled;
- (BOOL)shouldForwardSwitchEventsForInputSource:(id)a3;
- (BSInvalidatable)systemApertureInvalidatable;
- (NSMutableSet)availableDevices;
- (NSTimer)motionTrackerDelayedHideAlertTimer;
- (NSTimer)motionTrackerDelayedShowAlertTimer;
- (SBSSystemApertureRestrictionService)restrictionService;
- (SCATATVRemoteInputSource)atvRemoteInputSource;
- (SCATAccessibilityEventInputSource)accessibilityEventInputSource;
- (SCATCameraInputSource)cameraInputSource;
- (SCATGamepadInputSource)gamepadInputSource;
- (SCATHandTracker)handGestureSource;
- (SCATHeadTracker)headGestureSource;
- (SCATInputController)initWithInterDeviceCommunicator:(id)a3;
- (SCATInputControllerDelegate)delegate;
- (SCATInterDeviceInputSource)interDeviceInputSource;
- (SCATKeyboardInputSource)keyboardInputSource;
- (SCATMFIInputSource)mfiInputSource;
- (SCATMIDIInputSource)midiInputSource;
- (SCATMotionTrackerInputSource)motionTrackerInputSource;
- (SCATRemoteControlInputSource)remoteControlInputSource;
- (SCATScreenInputSource)screenInputSource;
- (_TtC15assistivetouchd17SCATAirPodsSource)airPodsSource;
- (double)timeIntervalBeforeSendAction;
- (double)timeIntervalBeforeSendLongPressAction;
- (double)timeIntervalBeforeSendRepeatAction;
- (double)timeIntervalBetweenDidSendActions;
- (double)timeIntervalSinceDidSendAction;
- (id)_allSwitchesInUse;
- (int64_t)motionTrackerErrorCode;
- (int64_t)role;
- (void)_addMotionTrackingInputSource;
- (void)_configureMFIAccessoryIfNecessary:(id)a3;
- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5;
- (void)_endAction;
- (void)_hideAlertForMotionTrackerInputSource;
- (void)_hideAlertForSource:(unint64_t)a3;
- (void)_hideAlerts;
- (void)_hideStateForSource:(unint64_t)a3;
- (void)_invalidateAssertionForSystemApertureInert;
- (void)_removeInputSource:(id)a3;
- (void)_removeInputSources;
- (void)_removeInputTimers;
- (void)_removeMotionTrackingInputSourceAndClearAlert:(BOOL)a3;
- (void)_restrictSystemApertureLayoutToInert;
- (void)_sendActionWithIdentifier:(id)a3;
- (void)_setupInputTimers;
- (void)_sharedInit;
- (void)_showAlert:(id)a3 forSource:(unint64_t)a4;
- (void)_showHeadTrackingErrorMessageForHeadMovementSwitchConflict;
- (void)_showState:(id)a3 forSource:(unint64_t)a4;
- (void)_updateAccessibilityEventInputSource;
- (void)_updateActionsForSource:(id)a3;
- (void)_updateAirPodsSource;
- (void)_updateCameraHandGestureSource;
- (void)_updateGamepadInputSource;
- (void)_updateHeadGesturesInputSource;
- (void)_updateInputSources;
- (void)_updateInterDeviceInputSource;
- (void)_updateIsInputCoalesceEnabled;
- (void)_updateIsInputHoldEnabled;
- (void)_updateIsInputRepeatEnabled;
- (void)_updateKeyboardInputSource;
- (void)_updateMFIInputSource;
- (void)_updateMIDIInputSource;
- (void)_updateMotionTrackingForOneness;
- (void)_updateMotionTrackingInputSource;
- (void)_updateRemoteControlInputSource;
- (void)_updateSCNeedsCameraOnLockScreen;
- (void)_updateSCNeedsMicrophoneOnLockScreen;
- (void)_updateScreenInputSource;
- (void)_updateTimeIntervalBeforeSendAction;
- (void)_updateTimeIntervalBeforeSendRepeatAction;
- (void)_updateTimeIntervalBetweenDidSendActions;
- (void)accessibilityEventInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6;
- (void)airPodsInputSource:(id)a3 didReceiveActionWithIdentifier:(int64_t)a4 start:(BOOL)a5;
- (void)cameraInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5;
- (void)cameraInputSource:(id)a3 didUpdateAvailability:(BOOL)a4 withDetail:(unint64_t)a5;
- (void)cameraInputSource:(id)a3 didUpdateState:(id)a4;
- (void)dealloc;
- (void)didBeginLongPressForInputSource:(id)a3;
- (void)didEndLongPressForInputSource:(id)a3;
- (void)didReceiveSwitchEvent:(id)a3 forDeviceWithName:(id)a4;
- (void)handTrackerInputSource:(id)a3 didReceiveActionWithIdentifier:(int64_t)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6;
- (void)handTrackerInputSource:(id)a3 didUpdateAvailability:(BOOL)a4 withDetail:(int64_t)a5;
- (void)handleInterDeviceBailOutForInputSource:(id)a3;
- (void)hardwareInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6;
- (void)hardwareInputSource:(id)a3 didUpdateAvailability:(BOOL)a4 withDetail:(unint64_t)a5;
- (void)headTrackerInputSource:(id)a3 didReceiveActionWithIdentifier:(int64_t)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6;
- (void)headTrackerInputSource:(id)a3 didUpdateAvailability:(BOOL)a4 withDetail:(int64_t)a5;
- (void)headTrackerInputSource:(id)a3 didUpdateState:(id)a4;
- (void)inputSource:(id)a3 forwardSwitchEvent:(id)a4;
- (void)interDeviceInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6;
- (void)motionTrackerInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6;
- (void)motionTrackerInputSource:(id)a3 didReceivePoint:(CGPoint)a4;
- (void)motionTrackerInputSourceFailedToTrackFaceWithError:(id)a3;
- (void)overrideMotionTrackerLookAtPoint:(CGPoint)a3;
- (void)performSysdiagnose;
- (void)remoteControlInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6;
- (void)screenInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6;
- (void)setAccessibilityEventInputSource:(id)a3;
- (void)setAirPodsSource:(id)a3;
- (void)setAtvRemoteInputSource:(id)a3;
- (void)setAvailableDevices:(id)a3;
- (void)setCameraInputSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setGamepadInputSource:(id)a3;
- (void)setHandGestureSource:(id)a3;
- (void)setHasInitializedInputSources:(BOOL)a3;
- (void)setHeadGestureSource:(id)a3;
- (void)setInputHoldTimer:(id)a3;
- (void)setInputLongPressTimer:(id)a3;
- (void)setInputRepeatTimer:(id)a3;
- (void)setInterDeviceInputSource:(id)a3;
- (void)setIsInputCoalesceEnabled:(BOOL)a3;
- (void)setIsInputHoldEnabled:(BOOL)a3;
- (void)setIsInputRepeatEnabled:(BOOL)a3;
- (void)setKeyboardInputSource:(id)a3;
- (void)setMfiInputSource:(id)a3;
- (void)setMidiInputSource:(id)a3;
- (void)setMotionTrackerDelayedHideAlertTimer:(id)a3;
- (void)setMotionTrackerDelayedShowAlertTimer:(id)a3;
- (void)setMotionTrackerErrorCode:(int64_t)a3;
- (void)setMotionTrackerInputSource:(id)a3;
- (void)setMotionTrackerLostFace:(BOOL)a3;
- (void)setMotionTrackingEnabled:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setRecipe:(id)a3;
- (void)setRemoteControlInputSource:(id)a3;
- (void)setRestrictionService:(id)a3;
- (void)setScreenInputSource:(id)a3;
- (void)setSystemApertureInvalidatable:(id)a3;
- (void)setTimeIntervalBeforeSendAction:(double)a3;
- (void)setTimeIntervalBeforeSendLongPressAction:(double)a3;
- (void)setTimeIntervalBeforeSendRepeatAction:(double)a3;
- (void)setTimeIntervalBetweenDidSendActions:(double)a3;
- (void)setTimeIntervalSinceDidSendAction:(double)a3;
- (void)setValid:(BOOL)a3;
- (void)updateWhetherSwitchConfigurationHasScreenSwitch;
- (void)updateWhetherSwitchConfigurationRendersDeviceUnusable;
@end

@implementation SCATInputController

- (void)_updateActionsForSource:(id)a3
{
  id v4 = a3;
  id v6 = [(SCATInputController *)self _allSwitchesInUse];
  v5 = [(SCATInputController *)self recipe];
  [v4 updateWithSwitches:v6 recipe:v5];
}

- (BOOL)_hasExternalSwitchConfigured
{
  if ([(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceKeyboard]
    || [(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceGamepad]
    || [(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceMIDI]
    || [(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceMFI])
  {
    return 1;
  }
  uint64_t v4 = SCATSwitchSourceRemote;

  return [(SCATInputController *)self isEnabledSwitchWithSource:v4];
}

- (BOOL)_handleHoldAtPointForActionIdentifier:(id)a3 start:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![v6 action])
  {
    v7 = [v6 shortcutIdentifier];

    if (!v7) {
      goto LABEL_10;
    }
  }
  v8 = [(SCATInputController *)self recipe];

  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
  BOOL v31 = 0;
  SCATGetRecipeMappingIndexAndLongPressVariant(v6, &v32, &v31);
  unint64_t v9 = v32;
  v10 = [(SCATInputController *)self recipe];
  v11 = [v10 mappings];
  id v12 = [v11 count];

  if (v9 >= (unint64_t)v12)
  {
    uint64_t v13 = v32;
    v14 = [(SCATInputController *)self recipe];
    v15 = [v14 mappings];
    id v29 = v6;
    id v30 = [v15 count];
    uint64_t v28 = v13;
    _AXAssert();
  }
  unint64_t v16 = v32;
  v17 = [(SCATInputController *)self recipe];
  v18 = [v17 mappings];
  id v19 = [v18 count];

  if (v16 < (unint64_t)v19)
  {
    v20 = [(SCATInputController *)self recipe];
    v21 = [v20 mappings];
    v22 = [v21 objectAtIndexedSubscript:v32];

    if (v31
      || ([v22 action],
          v23 = objc_claimAutoreleasedReturnValue(),
          unsigned int v24 = [v23 isEqualToString:AXSwitchRecipeMappingActionHoldAtPoint],
          v23,
          !v24))
    {
      BOOL v26 = 0;
    }
    else
    {
      v25 = [(SCATInputController *)self delegate];
      [v22 holdPoint];
      objc_msgSend(v25, "inputController:didReceiveRecipeHoldAtPoint:isDown:", self, v4);

      BOOL v26 = 1;
    }
  }
  else
  {
LABEL_10:
    BOOL v26 = 0;
  }

  return v26;
}

- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (![(SCATInputController *)self _handleHoldAtPointForActionIdentifier:v8 start:v6])
  {
    if (v6)
    {
      v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472;
      uint64_t v13 = sub_10006C738;
      v14 = &unk_1001AAC78;
      v15 = self;
      id v16 = v8;
      unint64_t v9 = objc_retainBlock(&v11);
      if (![(SCATInputController *)self isInputHoldEnabled] || a5)
      {
        ((void (*)(void ***))v9[2])(v9);
      }
      else
      {
        v10 = [(SCATInputController *)self inputHoldTimer];
        [(SCATInputController *)self timeIntervalBeforeSendAction];
        objc_msgSend(v10, "afterDelay:processBlock:", v9);
      }
    }
    else
    {
      [(SCATInputController *)self _endAction];
    }
  }
}

- (void)_endAction
{
  id v4 = [(SCATInputController *)self inputHoldTimer];
  [v4 cancel];
  v3 = [(SCATInputController *)self inputRepeatTimer];
  [v3 cancel];
}

- (void)_sendActionWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SCATInputController *)self delegate];
  BOOL v6 = [(SCATInputController *)self queue];
  uint64_t v7 = [(SCATInputController *)self queue];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = v4;
    if ([v9 action])
    {
    }
    else
    {
      v10 = [v9 shortcutIdentifier];

      if (!v10) {
        goto LABEL_15;
      }
    }
    v11 = [(SCATInputController *)self recipe];

    if (!v11)
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10006CBBC;
      v31[3] = &unk_1001AB1A8;
      id v32 = v5;
      v33 = self;
      id v22 = v9;
      id v34 = v22;
      [v6 performAsynchronousWritingBlock:v31];
      if ([(SCATInputController *)self isInputRepeatEnabled]
        && ((unint64_t)[v22 action] & 0xFFFFFFFFFFFFFFFELL) == 0x68)
      {
        v23 = [(SCATInputController *)self inputRepeatTimer];
        [(SCATInputController *)self timeIntervalBeforeSendRepeatAction];
        double v25 = v24;
        objc_initWeak(&location, self);
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10006CBCC;
        v28[3] = &unk_1001AAA40;
        objc_copyWeak(&v30, &location);
        id v29 = v22;
        [v23 afterDelay:v28 processBlock:v25];

        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
      }
      v21 = v32;
      goto LABEL_14;
    }
    id location = (id)0x7FFFFFFFFFFFFFFFLL;
    BOOL v40 = 0;
    SCATGetRecipeMappingIndexAndLongPressVariant(v9, (uint64_t *)&location, &v40);
    id v12 = location;
    uint64_t v13 = [(SCATInputController *)self recipe];
    v14 = [v13 mappings];
    id v15 = [v14 count];

    if (v12 >= v15)
    {
      id v16 = location;
      [(SCATInputController *)self recipe];
      v27 = id v26 = v16;
      _AXAssert();
    }
    id v17 = location;
    v18 = [(SCATInputController *)self recipe];
    id v19 = [v18 mappings];
    id v20 = [v19 count];

    if (v17 < v20)
    {
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10006CBA8;
      v35[3] = &unk_1001ACCD0;
      id v36 = v5;
      v37 = self;
      id v38 = location;
      BOOL v39 = v40;
      [v6 performAsynchronousWritingBlock:v35];
      v21 = v36;
LABEL_14:
    }
  }
LABEL_15:
}

- (void)_updateTimeIntervalBeforeSendAction
{
  id v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchInputHoldDuration];
  -[SCATInputController setTimeIntervalBeforeSendAction:](self, "setTimeIntervalBeforeSendAction:");
}

- (void)_updateTimeIntervalBeforeSendRepeatAction
{
  id v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchActionRepeatInterval];
  -[SCATInputController setTimeIntervalBeforeSendRepeatAction:](self, "setTimeIntervalBeforeSendRepeatAction:");
}

- (void)_updateTimeIntervalBetweenDidSendActions
{
  id v3 = +[AXSettings sharedInstance];
  [v3 assistiveTouchInputCoalescingDuration];
  -[SCATInputController setTimeIntervalBetweenDidSendActions:](self, "setTimeIntervalBetweenDidSendActions:");
}

- (void)_updateIsInputHoldEnabled
{
  id v3 = +[AXSettings sharedInstance];
  -[SCATInputController setIsInputHoldEnabled:](self, "setIsInputHoldEnabled:", [v3 assistiveTouchInputHoldEnabled]);
}

- (void)_updateIsInputRepeatEnabled
{
  id v3 = +[AXSettings sharedInstance];
  -[SCATInputController setIsInputRepeatEnabled:](self, "setIsInputRepeatEnabled:", [v3 assistiveTouchActionRepeatEnabled]);
}

- (void)_updateIsInputCoalesceEnabled
{
  id v3 = +[AXSettings sharedInstance];
  -[SCATInputController setIsInputCoalesceEnabled:](self, "setIsInputCoalesceEnabled:", [v3 assistiveTouchInputCoalescingEnabled]);
}

- (void)didBeginLongPressForInputSource:(id)a3
{
  id v4 = [(SCATInputController *)self delegate];
  [v4 didBeginLongPressForInputController:self];
}

- (void)didEndLongPressForInputSource:(id)a3
{
  id v4 = [(SCATInputController *)self delegate];
  [v4 didEndLongPressForInputController:self];
}

- (BOOL)shouldForwardSwitchEventsForInputSource:(id)a3
{
  return (id)[(SCATInputController *)self role] == (id)1;
}

- (void)inputSource:(id)a3 forwardSwitchEvent:(id)a4
{
  id v5 = a4;
  id v6 = [(SCATInputController *)self interDeviceCommunicator];
  [v6 forwardSwitchEvent:v5];
}

- (void)handleInterDeviceBailOutForInputSource:(id)a3
{
  id v4 = AXSSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Inter-device bail out.", buf, 2u);
  }

  if (CFPreferencesGetAppBooleanValue(@"GatherAnalyticsOnBailOut", @"com.apple.Accessibility.SwitchControl", 0))
  {
    id v5 = AXSSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Performing sysdiagnose on forwarder and receiver.", v9, 2u);
    }

    id v6 = [(SCATInputController *)self delegate];
    [v6 performSysdiagnoseForInputController:self];

    uint64_t v7 = [(SCATInputController *)self interDeviceCommunicator];
    [v7 performSysdiagnoseOnReceiver];
  }
  id v8 = [(SCATInputController *)self interDeviceCommunicator];
  [v8 stop];
}

- (void)cameraInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5
{
}

- (void)cameraInputSource:(id)a3 didUpdateAvailability:(BOOL)a4 withDetail:(unint64_t)a5
{
  if (a4)
  {
    [(SCATInputController *)self _hideAlertForSource:1];
  }
  else
  {
    SCATCameraInputSourceAvailabilityDetailLocalizedDescription(a5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(SCATInputController *)self _showAlert:v6 forSource:1];
    [(SCATInputController *)self _endAction];
  }
}

- (void)cameraInputSource:(id)a3 didUpdateState:(id)a4
{
  double var1 = a4.var1;
  id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3, a4.var0);
  v9[0] = v6;
  uint64_t v7 = +[NSNumber numberWithDouble:var1];
  v9[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v9 count:2];

  [(SCATInputController *)self _showState:v8 forSource:1];
}

- (void)headTrackerInputSource:(id)a3 didReceiveActionWithIdentifier:(int64_t)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = (id)objc_opt_new();
  [v10 setAction:a4];
  [(SCATInputController *)self _didReceiveActionWithIdentifier:v10 start:v7 ignoreInputHold:v6];
}

- (void)headTrackerInputSource:(id)a3 didUpdateAvailability:(BOOL)a4 withDetail:(int64_t)a5
{
  if (a4)
  {
    [(SCATInputController *)self _hideAlertForSource:1];
  }
  else
  {
    id v6 = [a3 localizedDescriptionForAvailabilityDetail:a5];
    [(SCATInputController *)self _showAlert:v6 forSource:1];
    [(SCATInputController *)self _endAction];
  }
}

- (void)headTrackerInputSource:(id)a3 didUpdateState:(id)a4
{
  double var1 = a4.var1;
  id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3, a4.var0);
  v9[0] = v6;
  BOOL v7 = +[NSNumber numberWithDouble:var1];
  v9[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v9 count:2];

  [(SCATInputController *)self _showState:v8 forSource:1];
}

- (void)handTrackerInputSource:(id)a3 didReceiveActionWithIdentifier:(int64_t)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = (id)objc_opt_new();
  [v10 setAction:a4];
  [(SCATInputController *)self _didReceiveActionWithIdentifier:v10 start:v7 ignoreInputHold:v6];
}

- (void)handTrackerInputSource:(id)a3 didUpdateAvailability:(BOOL)a4 withDetail:(int64_t)a5
{
  if (a4)
  {
    [(SCATInputController *)self _hideAlertForSource:1];
  }
  else
  {
    id v6 = [a3 localizedDescriptionForAvailabilityDetail:a5];
    [(SCATInputController *)self _showAlert:v6 forSource:1];
    [(SCATInputController *)self _endAction];
  }
}

- (void)airPodsInputSource:(id)a3 didReceiveActionWithIdentifier:(int64_t)a4 start:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (id)objc_opt_new();
  [v8 setAction:a4];
  [(SCATInputController *)self _didReceiveActionWithIdentifier:v8 start:v5 ignoreInputHold:0];
}

- (void)hardwareInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6
{
}

- (void)hardwareInputSource:(id)a3 didUpdateAvailability:(BOOL)a4 withDetail:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = (NSMutableSet *)a3;
  id v9 = v8;
  if (self->_availableDevices)
  {
    if (!v8) {
      goto LABEL_11;
    }
  }
  else
  {
    id v10 = (NSMutableSet *)objc_opt_new();
    availableDevices = self->_availableDevices;
    self->_availableDevices = v10;

    if (!v9)
    {
LABEL_11:
      if (v9)
      {
        id v15 = SWCHLogHW();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v19 = 138412290;
          id v20 = v9;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Removing Hardware Input Source to available devices: %@", (uint8_t *)&v19, 0xCu);
        }

        [(NSMutableSet *)self->_availableDevices removeObject:v9];
        id v16 = SWCHLogHW();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v17 = self->_availableDevices;
          int v19 = 138412290;
          id v20 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "We now have %@ availableDevices", (uint8_t *)&v19, 0xCu);
        }
      }
      [(SCATInputController *)self _endAction];
      goto LABEL_18;
    }
  }
  if (!v6) {
    goto LABEL_11;
  }
  id v12 = SWCHLogHW();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Adding Hardware Input Source to available devices: %@", (uint8_t *)&v19, 0xCu);
  }

  [(NSMutableSet *)self->_availableDevices addObject:v9];
  uint64_t v13 = SWCHLogHW();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = self->_availableDevices;
    int v19 = 138412290;
    id v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "We now have %@ availableDevices", (uint8_t *)&v19, 0xCu);
  }

  [(SCATInputController *)self _configureMFIAccessoryIfNecessary:v9];
  [(SCATInputController *)self _hideAlertForSource:2];
LABEL_18:
  if (![(NSMutableSet *)self->_availableDevices count]
    && [(SCATInputController *)self _hasExternalSwitchConfigured])
  {
    v18 = SCATHardwareInputSourceAvailabilityDetailLocalizedDescription(a5);
    [(SCATInputController *)self _showAlert:v18 forSource:2];
  }
  [(SCATInputController *)self updateWhetherSwitchConfigurationRendersDeviceUnusable];
}

- (void)screenInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6
{
}

- (void)interDeviceInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6
{
}

- (void)accessibilityEventInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6
{
}

- (void)remoteControlInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6
{
}

- (void)motionTrackerInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6
{
}

- (void)motionTrackerInputSource:(id)a3 didReceivePoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v7 = [(SCATInputController *)self delegate];
  objc_msgSend(v7, "inputController:didReceivePoint:", self, x, y);

  if ([(SCATInputController *)self motionTrackerLostFace])
  {
    id v8 = [(SCATInputController *)self motionTrackerDelayedShowAlertTimer];

    if (v8)
    {
      id v9 = [(SCATInputController *)self motionTrackerDelayedShowAlertTimer];
      [v9 invalidate];

      [(SCATInputController *)self setMotionTrackerDelayedShowAlertTimer:0];
    }
    [(SCATInputController *)self _hideAlertForMotionTrackerInputSource];
    [(SCATInputController *)self setMotionTrackerErrorCode:0x7FFFFFFFFFFFFFFFLL];
    [(SCATInputController *)self setMotionTrackerLostFace:0];
  }
}

- (void)motionTrackerInputSourceFailedToTrackFaceWithError:(id)a3
{
  unint64_t v4 = (unint64_t)[a3 code];
  BOOL v5 = (void *)v4;
  if (v4 <= 9 && ((1 << v4) & 0x281) != 0)
  {
    BOOL v6 = AXSSHumanReadableDescriptionForMotionTrackingErrorCode();
    [(SCATInputController *)self _showAlert:v6 forSource:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006DAF8;
    v12[3] = &unk_1001ACCF8;
    v12[4] = self;
    BOOL v7 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v12 block:5.0];
    [(SCATInputController *)self setMotionTrackerDelayedHideAlertTimer:v7];

    id v8 = [(SCATInputController *)self delegate];
    [v8 inputControllerPointPickerInterrupted:self];

LABEL_4:
    goto LABEL_5;
  }
  if (![(SCATInputController *)self motionTrackerLostFace]
    || (void *)[(SCATInputController *)self motionTrackerErrorCode] != v5)
  {
    [(SCATInputController *)self setMotionTrackerLostFace:1];
    id v9 = [(SCATInputController *)self motionTrackerDelayedShowAlertTimer];
    [v9 invalidate];

    [(SCATInputController *)self setMotionTrackerDelayedShowAlertTimer:0];
    double v10 = 1.0;
    if (v5 == (void *)11) {
      double v10 = 5.0;
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006DB00;
    v11[3] = &unk_1001ACCF8;
    v11[4] = self;
    BOOL v6 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v11 block:v10];
    [(SCATInputController *)self setMotionTrackerDelayedShowAlertTimer:v6];
    goto LABEL_4;
  }
LABEL_5:
  [(SCATInputController *)self setMotionTrackerErrorCode:v5];
}

- (void)_showHeadTrackingErrorMessageForHeadMovementSwitchConflict
{
  sub_100040EC8(@"HEAD_MOVEMENT_SWITCHES_PREVENTING_HEAD_TRACKING");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(SCATInputController *)self _showAlert:v3 forSource:1];
}

- (void)_updateMotionTrackingForOneness
{
  id v3 = +[AXSpringBoardServer server];
  unsigned int v4 = [v3 isContinuitySessionActive];

  if (v4)
  {
    id v5 = [(SCATInputController *)self delegate];
    [v5 inputControllerPointPickerInterrupted:self];
  }
}

- (void)_configureMFIAccessoryIfNecessary:(id)a3
{
  id v25 = a3;
  id v4 = [v25 isMFIInputSource];
  id v5 = v25;
  if (v4)
  {
    id v6 = v25;
    uint64_t v7 = SCATSwitchSourceMFI;
    unsigned int v8 = [(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceMFI];
    char v9 = v8;
    NSLog(@"Attempting MFI autoconfigure : %d", v8);
    if (v9)
    {
LABEL_19:

      id v5 = v25;
      goto LABEL_20;
    }
    double v10 = +[AXSettings sharedInstance];
    v11 = [v10 assistiveTouchSwitches];
    id v12 = [v11 mutableCopy];

    if (!v12) {
      id v12 = objc_alloc_init((Class)NSMutableSet);
    }
    NSLog(@"Available buttons: %d", [v6 availableButtons]);
    if ((uint64_t)[v6 availableButtons] < 1)
    {
      v14 = 0;
    }
    else
    {
      uint64_t v13 = sub_100040EC8(@"MadeForIphone_HardwareSwitch_Select");
      v14 = +[AXSwitch switchWithAction:103 name:v13 source:v7 type:SCATSwitchTypeRequired];

      [v14 setButtonNumber:1];
      [v12 addObject:v14];
    }
    if ((uint64_t)[v6 availableButtons] <= 1)
    {
      id v16 = 0;
      if (!v14) {
        goto LABEL_14;
      }
    }
    else
    {
      id v15 = sub_100040EC8(@"MadeForIphone_HardwareSwitch_MoveToNextItem");
      id v16 = +[AXSwitch switchWithAction:104 name:v15 source:v7 type:SCATSwitchTypeRequired];

      [v16 setButtonNumber:2];
      [v12 addObject:v16];
      if (!v14) {
        goto LABEL_14;
      }
    }
    if (!v16)
    {
      id v17 = +[AXSettings sharedInstance];
      v18 = v17;
      uint64_t v19 = 0;
      goto LABEL_17;
    }
LABEL_14:
    if (!v14 || !v16) {
      goto LABEL_18;
    }
    id v17 = +[AXSettings sharedInstance];
    v18 = v17;
    uint64_t v19 = 1;
LABEL_17:
    [v17 setSwitchControlScanningStyle:v19];

LABEL_18:
    id v20 = [v6 productName];
    [v14 setProductName:v20];

    v21 = [v6 productName];
    [v16 setProductName:v21];

    id v22 = [v6 manufacturerName];
    [v14 setManufacturerName:v22];

    v23 = [v6 manufacturerName];
    [v16 setManufacturerName:v23];

    NSLog(@"Auto Configuring Setting up switches: %@", v12);
    double v24 = +[AXSettings sharedInstance];
    [v24 setAssistiveTouchSwitches:v12];

    goto LABEL_19;
  }
LABEL_20:

  _objc_release_x1(v4, v5);
}

- (void)_removeInputSource:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    [v3 stopRunning];
    [v4 setDelegate:0 queue:0];
  }
}

- (void)_removeInputSources
{
  id v3 = [(SCATInputController *)self headGestureSource];
  [(SCATInputController *)self _removeInputSource:v3];

  [(SCATInputController *)self setHeadGestureSource:0];
  id v4 = [(SCATInputController *)self handGestureSource];
  [(SCATInputController *)self _removeInputSource:v4];

  [(SCATInputController *)self setHandGestureSource:0];
  [(SCATInputController *)self _hideAlertForSource:1];
  [(SCATInputController *)self _hideStateForSource:1];
  id v5 = [(SCATInputController *)self keyboardInputSource];
  id v6 = [(SCATInputController *)self mfiInputSource];
  uint64_t v7 = [(SCATInputController *)self atvRemoteInputSource];
  unsigned int v8 = [(SCATInputController *)self midiInputSource];
  char v9 = [(SCATInputController *)self gamepadInputSource];
  double v10 = [(SCATInputController *)self airPodsSource];
  v11 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 6, v5, v6, v7, v8, v9, v10);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v16);
        if (v17)
        {
          [*(id *)(*((void *)&v32 + 1) + 8 * (void)v16) stopRunning];
          [v17 setDelegate:0 queue:0];
          [(SCATInputController *)self _hideAlertForSource:2];
        }
        id v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v14);
  }

  [(SCATInputController *)self setKeyboardInputSource:0];
  [(SCATInputController *)self setMfiInputSource:0];
  [(SCATInputController *)self setAtvRemoteInputSource:0];
  [(SCATInputController *)self setMidiInputSource:0];
  [(SCATInputController *)self setGamepadInputSource:0];
  [(SCATInputController *)self setAirPodsSource:0];
  v18 = [(SCATInputController *)self screenInputSource];
  uint64_t v19 = v18;
  if (v18)
  {
    [v18 stopRunning];
    [v19 setDelegate:0 queue:0];
    [(SCATInputController *)self setScreenInputSource:0];
  }
  id v20 = [(SCATInputController *)self interDeviceInputSource];
  [v20 stopRunning];

  v21 = [(SCATInputController *)self interDeviceInputSource];
  [v21 setDelegate:0 queue:0];

  [(SCATInputController *)self setInterDeviceInputSource:0];
  id v22 = [(SCATInputController *)self motionTrackerInputSource];
  v23 = v22;
  if (v22)
  {
    [v22 stopRunning];
    [v23 setDelegate:0 queue:0];
    [(SCATInputController *)self setMotionTrackerInputSource:0];
    double v24 = [(SCATInputController *)self motionTrackerDelayedShowAlertTimer];

    if (v24)
    {
      id v25 = [(SCATInputController *)self motionTrackerDelayedShowAlertTimer];
      [v25 invalidate];

      [(SCATInputController *)self setMotionTrackerDelayedShowAlertTimer:0];
    }
    id v26 = [(SCATInputController *)self motionTrackerDelayedHideAlertTimer];
    unsigned __int8 v27 = [v26 isValid];

    if ((v27 & 1) == 0) {
      [(SCATInputController *)self _hideAlertForMotionTrackerInputSource];
    }
  }
  uint64_t v28 = [(SCATInputController *)self accessibilityEventInputSource];
  id v29 = v28;
  if (v28)
  {
    [v28 stopRunning];
    [v29 setDelegate:0 queue:0];
    [(SCATInputController *)self setAccessibilityEventInputSource:0];
  }
  id v30 = [(SCATInputController *)self remoteControlInputSource];
  BOOL v31 = v30;
  if (v30)
  {
    [v30 stopRunning];
    [v31 setDelegate:0 queue:0];
    [(SCATInputController *)self setRemoteControlInputSource:0];
  }
}

- (void)_updateKeyboardInputSource
{
  unsigned int v8 = [(SCATInputController *)self keyboardInputSource];
  id v3 = (id)[(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceKeyboard];
  id v4 = v8;
  if (v3) {
    BOOL v5 = v8 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    unsigned int v8 = objc_opt_new();
    [(SCATInputController *)self setKeyboardInputSource:v8];
    [(SCATInputController *)self _updateActionsForSource:v8];
    id v6 = +[AXAccessQueue mainAccessQueue];
    [v8 setDelegate:self queue:v6];

    id v3 = [v8 startRunning];
  }
  else if (!v8 || ((v3 ^ 1) & 1) != 0)
  {
    if (v8) {
      char v7 = (char)v3;
    }
    else {
      char v7 = 1;
    }
    if (v7) {
      goto LABEL_15;
    }
    [v8 stopRunning];
    [v8 setDelegate:0 queue:0];
    [(SCATInputController *)self setKeyboardInputSource:0];
    id v3 = [(SCATInputController *)self _hideAlertForSource:2];
  }
  else
  {
    id v3 = [(SCATInputController *)self _updateActionsForSource:v8];
  }
  id v4 = v8;
LABEL_15:

  _objc_release_x1(v3, v4);
}

- (void)_updateMIDIInputSource
{
  id v9 = [(SCATInputController *)self midiInputSource];
  BOOL v3 = [(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceMIDI];
  id v4 = +[NSNumber numberWithBool:v9 != 0];
  unsigned int v8 = +[NSNumber numberWithBool:v3];
  AXPrintLine();

  BOOL v5 = v9;
  char v6 = !v3;
  if (v9 || !v3)
  {
    if (!v9) {
      char v6 = 1;
    }
    if (v6)
    {
      if (v9 == 0 || v3) {
        goto LABEL_11;
      }
      objc_msgSend(v9, "stopRunning", v4, v8);
      [v9 setDelegate:0 queue:0];
      [(SCATInputController *)self setMidiInputSource:0];
      [(SCATInputController *)self _hideAlertForSource:2];
    }
    else
    {
      -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v9, v4, v8);
    }
  }
  else
  {
    id v9 = (id)objc_opt_new();
    -[SCATInputController setMidiInputSource:](self, "setMidiInputSource:", v9, v4, v8);
    [(SCATInputController *)self _updateActionsForSource:v9];
    char v7 = +[AXAccessQueue mainAccessQueue];
    [v9 setDelegate:self queue:v7];

    [v9 startRunning];
  }
  BOOL v5 = v9;
LABEL_11:
}

- (void)_updateMFIInputSource
{
  char v6 = [(SCATInputController *)self mfiInputSource];
  id v3 = (id)[(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceMFI];
  id v4 = v6;
  if (v6)
  {
    if (!v3) {
      goto LABEL_6;
    }
    id v3 = [(SCATInputController *)self _updateActionsForSource:v6];
  }
  else
  {
    char v6 = objc_opt_new();
    [(SCATInputController *)self setMfiInputSource:v6];
    [(SCATInputController *)self _updateActionsForSource:v6];
    BOOL v5 = +[AXAccessQueue mainAccessQueue];
    [v6 setDelegate:self queue:v5];

    id v3 = [v6 startRunning];
  }
  id v4 = v6;
LABEL_6:

  _objc_release_x1(v3, v4);
}

- (void)_updateScreenInputSource
{
  id v9 = [(SCATInputController *)self screenInputSource];
  unsigned int v3 = [(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceScreen];
  if (v3) {
    BOOL v4 = v9 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    id v9 = (id)objc_opt_new();
    [(SCATInputController *)self setScreenInputSource:v9];
    [(SCATInputController *)self _updateActionsForSource:v9];
    unsigned int v8 = +[AXAccessQueue mainAccessQueue];
    [v9 setDelegate:self queue:v8];

    [v9 startRunning];
  }
  else
  {
    if (v3) {
      BOOL v5 = v9 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (v9) {
        char v6 = v3;
      }
      else {
        char v6 = 1;
      }
      if (v3) {
        id v7 = v9;
      }
      else {
        id v7 = 0;
      }
      if (v6)
      {
        id v9 = v7;
      }
      else
      {
        [v9 stopRunning];
        [v9 setDelegate:0 queue:0];
        [(SCATInputController *)self setScreenInputSource:0];
      }
    }
    else
    {
      [(SCATInputController *)self _updateActionsForSource:v9];
    }
  }
  [(SCATInputController *)self updateWhetherSwitchConfigurationHasScreenSwitch];
  [(SCATInputController *)self updateWhetherSwitchConfigurationRendersDeviceUnusable];
}

- (void)_updateGamepadInputSource
{
  id v9 = [(SCATInputController *)self gamepadInputSource];
  id v3 = (id)[(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceGamepad];
  BOOL v4 = v9;
  if (v3) {
    BOOL v5 = v9 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v9 = objc_opt_new();
    [(SCATInputController *)self setGamepadInputSource:v9];
    [(SCATInputController *)self _updateActionsForSource:v9];
    unsigned int v8 = +[AXAccessQueue mainAccessQueue];
    [v9 setDelegate:self queue:v8];

    id v3 = [v9 startRunning];
  }
  else
  {
    if (v3) {
      BOOL v6 = v9 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (v9) {
        char v7 = (char)v3;
      }
      else {
        char v7 = 1;
      }
      if (v7) {
        goto LABEL_17;
      }
      [v9 stopRunning];
      [v9 setDelegate:0 queue:0];
      [(SCATInputController *)self setGamepadInputSource:0];
      id v3 = [(SCATInputController *)self _hideAlertForSource:2];
    }
    else
    {
      id v3 = [(SCATInputController *)self _updateActionsForSource:v9];
    }
  }
  BOOL v4 = v9;
LABEL_17:

  _objc_release_x1(v3, v4);
}

- (void)_updateAirPodsSource
{
  id v3 = [(SCATInputController *)self airPodsSource];
  unsigned int v4 = [(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceHeadGesture];
  if (v4) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v9 = SWCHLogHW();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "HeadGestures: Creating a new airPodsInputSource and updating actions for airPodsInputSource", buf, 2u);
    }

    id v3 = objc_opt_new();
    [(SCATInputController *)self setAirPodsSource:v3];
    [(SCATInputController *)self _updateActionsForSource:v3];
    double v10 = +[AXAccessQueue mainAccessQueue];
    [v3 setDelegate:self queue:v10];

    [v3 startRunning];
  }
  else
  {
    if (v4) {
      BOOL v6 = v3 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (v3) {
        char v7 = v4;
      }
      else {
        char v7 = 1;
      }
      if ((v7 & 1) == 0)
      {
        unsigned int v8 = SWCHLogHW();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "HeadGestures: No switches configured for airPodsInputSource. Tearing it down.", v13, 2u);
        }

        [v3 stopRunning];
        [(SCATInputController *)self setAirPodsSource:0];
        [(SCATInputController *)self _hideAlertForSource:2];
      }
    }
    else
    {
      v11 = SWCHLogHW();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "HeadGestures: Updating actions for airPodsInputSource", v14, 2u);
      }

      [(SCATInputController *)self _updateActionsForSource:v3];
    }
  }
}

- (void)_updateHeadGesturesInputSource
{
  id v9 = [(SCATInputController *)self headGestureSource];
  unsigned int v3 = [(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceCamera];
  if (v3) {
    BOOL v4 = v9 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    id v9 = (id)objc_opt_new();
    [(SCATInputController *)self setHeadGestureSource:v9];
    [(SCATInputController *)self _updateActionsForSource:v9];
    unsigned int v8 = +[AXAccessQueue mainAccessQueue];
    [v9 setDelegate:self queue:v8];

    [v9 startRunning];
  }
  else
  {
    if (v3) {
      BOOL v5 = v9 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (v9) {
        char v6 = v3;
      }
      else {
        char v6 = 1;
      }
      if (v3) {
        id v7 = v9;
      }
      else {
        id v7 = 0;
      }
      if (v6)
      {
        id v9 = v7;
      }
      else
      {
        [v9 stopRunning];
        [v9 setDelegate:0 queue:0];
        [(SCATInputController *)self setHeadGestureSource:0];
        [(SCATInputController *)self _hideAlertForSource:1];
        [(SCATInputController *)self _hideStateForSource:1];
      }
    }
    else
    {
      [(SCATInputController *)self _updateActionsForSource:v9];
    }
  }
  [(SCATInputController *)self _updateSCNeedsCameraOnLockScreen];
}

- (void)_updateCameraHandGestureSource
{
  unsigned int v3 = [(SCATInputController *)self handGestureSource];
  unsigned int v4 = [(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceCameraHandGesture];
  if (v4) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    unsigned int v8 = SWCHLogHW();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "HandGestures: Creating a new HandTracker and updating actions for handGestureSource", buf, 2u);
    }

    unsigned int v3 = objc_opt_new();
    [(SCATInputController *)self setHandGestureSource:v3];
    [(SCATInputController *)self _updateActionsForSource:v3];
    id v9 = +[AXAccessQueue mainAccessQueue];
    [v3 setDelegate:self queue:v9];

    [v3 startRunning];
  }
  else
  {
    if (v4) {
      BOOL v6 = v3 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      id v7 = SWCHLogHW();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "HandGestures: Updating actions for handGestureSource", v10, 2u);
      }

      [(SCATInputController *)self _updateActionsForSource:v3];
    }
  }
}

- (void)_updateInterDeviceInputSource
{
  unsigned int v3 = [(SCATInputController *)self interDeviceInputSource];

  if (!v3)
  {
    unsigned int v4 = objc_opt_new();
    [(SCATInputController *)self setInterDeviceInputSource:v4];
    [(SCATInputController *)self _updateActionsForSource:v4];
    BOOL v5 = +[AXAccessQueue mainAccessQueue];
    [v4 setDelegate:self queue:v5];

    [v4 startRunning];
  }
  id v6 = [(SCATInputController *)self interDeviceInputSource];
  [(SCATInputController *)self _updateActionsForSource:v6];
}

- (void)setMotionTrackingEnabled:(BOOL)a3
{
  BOOL v3 = !self->_motionTrackingEnabled;
  self->_motionTrackingEnabled = a3;
  if (((v3 ^ a3) & 1) == 0) {
    [(SCATInputController *)self _updateMotionTrackingInputSource];
  }
}

- (void)overrideMotionTrackerLookAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(SCATInputController *)self motionTrackingEnabled])
  {
    id v6 = [(SCATInputController *)self motionTrackerInputSource];

    if (v6)
    {
      id v7 = [(SCATInputController *)self motionTrackerInputSource];
      objc_msgSend(v7, "overrideLookAtPoint:", x, y);
    }
  }
}

- (void)_updateMotionTrackingInputSource
{
  id v4 = [(SCATInputController *)self motionTrackerInputSource];
  BOOL v3 = [(SCATInputController *)self cameraInputSource];

  if ([(SCATInputController *)self motionTrackingEnabled] && v3) {
    [(SCATInputController *)self _showHeadTrackingErrorMessageForHeadMovementSwitchConflict];
  }
  if (v3 && v4) {
    [(SCATInputController *)self _removeMotionTrackingInputSourceAndClearAlert:0];
  }
  if ([(SCATInputController *)self motionTrackingEnabled] || !v3)
  {
    if ([(SCATInputController *)self motionTrackingEnabled] && !v4 && !v3)
    {
      [(SCATInputController *)self _addMotionTrackingInputSource];
      goto LABEL_20;
    }
  }
  else
  {
    [(SCATInputController *)self _hideAlertForMotionTrackerInputSource];
    [(SCATInputController *)self motionTrackingEnabled];
  }
  if ([(SCATInputController *)self motionTrackingEnabled] && v4)
  {
    [(SCATInputController *)self _updateActionsForSource:v4];
  }
  else if (![(SCATInputController *)self motionTrackingEnabled] && v4)
  {
    [(SCATInputController *)self _removeMotionTrackingInputSourceAndClearAlert:1];
  }
LABEL_20:
}

- (void)_addMotionTrackingInputSource
{
  id v7 = (id)objc_opt_new();
  [(SCATInputController *)self setMotionTrackerInputSource:v7];
  [(SCATInputController *)self _updateActionsForSource:v7];
  BOOL v3 = +[AXAccessQueue mainAccessQueue];
  [v7 setDelegate:self queue:v3];

  id v4 = +[AXSettings sharedInstance];
  [v4 switchControlCameraPointPickerSensitivity];
  objc_msgSend(v7, "setSensitivity:");

  BOOL v5 = +[AXSettings sharedInstance];
  objc_msgSend(v7, "setMotionTrackingMode:", objc_msgSend(v5, "switchControlCameraPointPickerMode"));

  id v6 = +[AXSettings sharedInstance];
  [v6 switchControlCameraPointPickerMovementToleranceInJoystickMode];
  objc_msgSend(v7, "setJoystickModeMovementThreshold:");

  [(SCATInputController *)self setMotionTrackerErrorCode:0x7FFFFFFFFFFFFFFFLL];
  [v7 startRunning];
  [(SCATInputController *)self _updateSCNeedsCameraOnLockScreen];
}

- (void)_removeMotionTrackingInputSourceAndClearAlert:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SCATInputController *)self motionTrackerInputSource];
  [v5 stopRunning];

  id v6 = [(SCATInputController *)self motionTrackerInputSource];
  [v6 setDelegate:0 queue:0];

  [(SCATInputController *)self setMotionTrackerInputSource:0];
  id v7 = [(SCATInputController *)self motionTrackerDelayedShowAlertTimer];

  if (v7)
  {
    unsigned int v8 = [(SCATInputController *)self motionTrackerDelayedShowAlertTimer];
    [v8 invalidate];

    [(SCATInputController *)self setMotionTrackerDelayedShowAlertTimer:0];
  }
  id v9 = [(SCATInputController *)self motionTrackerDelayedHideAlertTimer];
  unsigned int v10 = [v9 isValid];

  if (!v10 && v3) {
    [(SCATInputController *)self _hideAlertForMotionTrackerInputSource];
  }
  [(SCATInputController *)self setMotionTrackerErrorCode:0x7FFFFFFFFFFFFFFFLL];

  [(SCATInputController *)self _updateSCNeedsCameraOnLockScreen];
}

- (void)_updateSCNeedsCameraOnLockScreen
{
  BOOL v3 = [(SCATInputController *)self motionTrackerInputSource];
  if (v3)
  {

    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [(SCATInputController *)self cameraInputSource];
    BOOL v4 = v5 != 0;
  }

  __AXSSetAccessibilityNeedsCameraOnLockScreen(v4);
}

- (void)_updateSCNeedsMicrophoneOnLockScreen
{
  unsigned int v2 = [(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceSound];
  BOOL v3 = AXLogSoundActions();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      sub_100114D9C(v3);
    }
  }
  else if (v4)
  {
    sub_100114DE0(v3);
  }

  _AXSSetAccessibilityNeedsMicrophoneOnLockScreen();
}

- (void)_updateAccessibilityEventInputSource
{
  unsigned int v8 = [(SCATInputController *)self accessibilityEventInputSource];
  if ([(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceAccessibility]|| [(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceBackTap])
  {
    [(SCATInputController *)self _updateSCNeedsMicrophoneOnLockScreen];
  }
  else
  {
    unsigned __int8 v7 = [(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceSound];
    [(SCATInputController *)self _updateSCNeedsMicrophoneOnLockScreen];
    if ((v7 & 1) == 0
      && ![(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceHandGestures]&& ![(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceGamepad])
    {
      uint64_t v3 = [(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceAutomation];
      goto LABEL_5;
    }
  }
  uint64_t v3 = 1;
LABEL_5:
  BOOL v4 = v8;
  if (v3 && !v8)
  {
    unsigned int v8 = objc_opt_new();
    [(SCATInputController *)self setAccessibilityEventInputSource:v8];
    [(SCATInputController *)self _updateActionsForSource:v8];
    BOOL v5 = +[AXAccessQueue mainAccessQueue];
    [v8 setDelegate:self queue:v5];

    uint64_t v3 = (uint64_t)[v8 startRunning];
LABEL_20:
    BOOL v4 = v8;
    goto LABEL_21;
  }
  if (v8) {
    int v6 = v3;
  }
  else {
    int v6 = 0;
  }
  if (v6 == 1)
  {
    uint64_t v3 = (uint64_t)[(SCATInputController *)self _updateActionsForSource:v8];
    goto LABEL_20;
  }
  if ((v3 & 1) == 0 && v8)
  {
    [v8 stopRunning];
    [v8 setDelegate:0 queue:0];
    uint64_t v3 = (uint64_t)[(SCATInputController *)self setAccessibilityEventInputSource:0];
    goto LABEL_20;
  }
LABEL_21:

  _objc_release_x1(v3, v4);
}

- (void)_updateRemoteControlInputSource
{
  uint64_t v3 = [(SCATInputController *)self remoteControlInputSource];

  if (!v3)
  {
    BOOL v4 = objc_opt_new();
    [(SCATInputController *)self setRemoteControlInputSource:v4];

    BOOL v5 = [(SCATInputController *)self remoteControlInputSource];
    int v6 = +[AXAccessQueue mainAccessQueue];
    [v5 setDelegate:self queue:v6];

    id v7 = [(SCATInputController *)self remoteControlInputSource];
    [v7 startRunning];
  }
}

- (void)_updateInputSources
{
  [(SCATInputController *)self _updateHeadGesturesInputSource];
  [(SCATInputController *)self _updateCameraHandGestureSource];
  [(SCATInputController *)self _updateKeyboardInputSource];
  [(SCATInputController *)self _updateMIDIInputSource];
  [(SCATInputController *)self _updateATVRemoteInputSource];
  [(SCATInputController *)self _updateMFIInputSource];
  [(SCATInputController *)self _updateGamepadInputSource];
  [(SCATInputController *)self _updateScreenInputSource];
  [(SCATInputController *)self _updateAirPodsSource];
  [(SCATInputController *)self _updateInterDeviceInputSource];
  [(SCATInputController *)self _updateMotionTrackingInputSource];
  [(SCATInputController *)self _updateAccessibilityEventInputSource];
  [(SCATInputController *)self _updateRemoteControlInputSource];
  [(SCATInputController *)self _endAction];

  [(SCATInputController *)self setHasInitializedInputSources:1];
}

- (BOOL)_switchConfigurationRendersDeviceUnusable
{
  uint64_t v3 = [(SCATInputController *)self _allSwitchesInUse];
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x2020000000;
  char v79 = 0;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  char v75 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 0;
  +[NSMutableDictionary dictionary];
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_10006FE88;
  v63[3] = &unk_1001ACD20;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v64 = v4;
  v65 = &v76;
  v66 = &v72;
  v67 = &v68;
  [v3 enumerateObjectsUsingBlock:v63];
  BOOL v5 = [(SCATInputController *)self recipe];
  if (v5)
  {
    int v6 = [(SCATInputController *)self recipe];
    unsigned __int8 v7 = [v6 shouldContinueScanning];

    if ((v7 & 1) == 0) {
      goto LABEL_69;
    }
  }
  unsigned int v8 = +[AXSettings sharedInstance];
  id v9 = [v8 switchControlScanningStyle];

  if (!v9) {
    goto LABEL_73;
  }
  if (v9 == (id)1)
  {
    unsigned int v10 = [(SCATInputController *)self keyboardInputSource];
    id v11 = [v10 numberOfDevicesConnected];

    id v12 = [(SCATInputController *)self mfiInputSource];
    id v13 = [v12 numberOfDevicesConnected];

    id v14 = [(SCATInputController *)self midiInputSource];
    id v61 = [v14 numberOfDevicesConnected];

    uint64_t v15 = [(SCATInputController *)self gamepadInputSource];
    id v60 = [v15 numberOfDevicesConnected];

    id v16 = [(SCATInputController *)self interDeviceCommunicator];
    unsigned int v17 = [v16 isReceivingSwitchEvents];

    if (*((unsigned char *)v77 + 24))
    {
      v18 = [v4 objectForKeyedSubscript:SCATSwitchSourceScreen];
      uint64_t v19 = [v18 firstObject];
      if ([v19 BOOLValue])
      {
        int v20 = 1;
      }
      else
      {
        v21 = [v4 objectForKeyedSubscript:SCATSwitchSourceKeyboard];
        id v22 = [v21 firstObject];
        if ([v22 BOOLValue] && v11)
        {
          int v20 = 1;
        }
        else
        {
          v23 = [v4 objectForKeyedSubscript:SCATSwitchSourceMFI];
          v58 = [v23 firstObject];
          v56 = v22;
          if ([v58 BOOLValue] && v13)
          {
            double v24 = v21;
            id v25 = v23;
            int v20 = 1;
          }
          else
          {
            v54 = [v4 objectForKeyedSubscript:SCATSwitchSourceMIDI];
            v52 = [v54 firstObject];
            if ([v52 BOOLValue] && v61)
            {
              double v24 = v21;
              id v25 = v23;
              int v20 = 1;
            }
            else
            {
              v50 = [v4 objectForKeyedSubscript:SCATSwitchSourceRemote];
              v48 = [v50 firstObject];
              if ([v48 BOOLValue] & v17)
              {
                double v24 = v21;
                id v25 = v23;
                int v20 = 1;
              }
              else
              {
                v46 = [v4 objectForKeyedSubscript:SCATSwitchSourceBackTap];
                v44 = [v46 firstObject];
                if ([v44 BOOLValue])
                {
                  double v24 = v21;
                  id v25 = v23;
                  int v20 = 1;
                }
                else
                {
                  v42 = [v4 objectForKeyedSubscript:SCATSwitchSourceSound];
                  v41 = [v42 firstObject];
                  if ([v41 BOOLValue])
                  {
                    double v24 = v21;
                    id v25 = v23;
                    int v20 = 1;
                  }
                  else
                  {
                    BOOL v40 = [v4 objectForKeyedSubscript:SCATSwitchSourceGamepad];
                    BOOL v39 = [v40 firstObject];
                    unsigned int v26 = [v39 BOOLValue];
                    double v24 = v21;
                    id v25 = v23;
                    if (v60) {
                      int v20 = v26;
                    }
                    else {
                      int v20 = 0;
                    }
                  }
                }
              }
            }
          }
          v21 = v24;
          id v22 = v56;
        }
      }
    }
    else
    {
      int v20 = 0;
    }
    if (!*((unsigned char *)v73 + 24)) {
      goto LABEL_69;
    }
    unsigned __int8 v27 = [v4 objectForKeyedSubscript:SCATSwitchSourceScreen];
    uint64_t v28 = [v27 lastObject];
    if ([v28 BOOLValue])
    {
      int v29 = 1;
    }
    else
    {
      id v30 = [v4 objectForKeyedSubscript:SCATSwitchSourceKeyboard];
      BOOL v31 = [v30 lastObject];
      if ([v31 BOOLValue] && v11)
      {
        long long v32 = v30;
        int v29 = 1;
      }
      else
      {
        long long v33 = [v4 objectForKeyedSubscript:SCATSwitchSourceMFI];
        v59 = [v33 lastObject];
        if ([v59 BOOLValue] && v13)
        {
          long long v32 = v30;
          int v29 = 1;
        }
        else
        {
          long long v34 = [v4 objectForKeyedSubscript:SCATSwitchSourceMIDI];
          v57 = [v34 lastObject];
          if ([v57 BOOLValue] && v61)
          {
            long long v32 = v30;
            int v29 = 1;
          }
          else
          {
            v62 = [v4 objectForKeyedSubscript:SCATSwitchSourceRemote];
            v55 = [v62 lastObject];
            if ([v55 BOOLValue] & v17)
            {
              long long v32 = v30;
              int v29 = 1;
            }
            else
            {
              long long v35 = [v4 objectForKeyedSubscript:SCATSwitchSourceBackTap];
              v53 = [v35 lastObject];
              v51 = v35;
              if ([v53 BOOLValue])
              {
                long long v32 = v30;
                int v29 = 1;
              }
              else
              {
                v49 = [v4 objectForKeyedSubscript:SCATSwitchSourceSound];
                v47 = [v49 lastObject];
                if ([v47 BOOLValue])
                {
                  long long v32 = v30;
                  int v29 = 1;
                }
                else
                {
                  v45 = [v4 objectForKeyedSubscript:SCATSwitchSourceGamepad];
                  v43 = [v45 lastObject];
                  unsigned int v36 = [v43 BOOLValue];
                  long long v32 = v30;
                  int v29 = v60 ? v36 : 0;
                }
              }
            }
          }
        }
      }
    }
    if ((v20 & v29 & 1) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
  if (v9 != (id)2)
  {
LABEL_69:
    BOOL v37 = *((unsigned char *)v69 + 24) != 0;
    goto LABEL_70;
  }
  if (!*((unsigned char *)v73 + 24))
  {
LABEL_73:
    if (!*((unsigned char *)v77 + 24)) {
      goto LABEL_69;
    }
  }
LABEL_68:
  BOOL v37 = 0;
LABEL_70:

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);

  return v37;
}

- (BOOL)_switchConfigurationHasScreenSwitch
{
  return [(SCATInputController *)self isEnabledSwitchWithSource:SCATSwitchSourceScreen];
}

- (void)_removeInputTimers
{
  id v5 = [(SCATInputController *)self inputHoldTimer];
  if (v5)
  {
    [v5 cancel];
    [(SCATInputController *)self setInputHoldTimer:0];
  }
  uint64_t v3 = [(SCATInputController *)self inputRepeatTimer];
  id v4 = v3;
  if (v3)
  {
    [v3 cancel];
    [(SCATInputController *)self setInputRepeatTimer:0];
  }
}

- (void)_setupInputTimers
{
  id v4 = [(SCATInputController *)self inputHoldTimer];
  if (!v4)
  {
    id v4 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    [v4 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [v4 setLabel:@"input hold timer"];
    [(SCATInputController *)self setInputHoldTimer:v4];
  }
  id v3 = [(SCATInputController *)self inputRepeatTimer];
  if (!v3)
  {
    id v3 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    [v3 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [v3 setLabel:@"input repeat timer"];
    [(SCATInputController *)self setInputRepeatTimer:v3];
  }
}

- (void)dealloc
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithUnsignedLongLong:self];
  [v3 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchInputHoldDuration" withListenerID:v4];

  id v5 = +[AXSettings sharedInstance];
  int v6 = +[NSNumber numberWithUnsignedLongLong:self];
  [v5 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchInputHoldEnabled" withListenerID:v6];

  unsigned __int8 v7 = +[AXSettings sharedInstance];
  unsigned int v8 = +[NSNumber numberWithUnsignedLongLong:self];
  [v7 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchActionRepeatInterval" withListenerID:v8];

  id v9 = +[AXSettings sharedInstance];
  unsigned int v10 = +[NSNumber numberWithUnsignedLongLong:self];
  [v9 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchActionRepeatEnabled" withListenerID:v10];

  id v11 = +[AXSettings sharedInstance];
  id v12 = +[NSNumber numberWithUnsignedLongLong:self];
  [v11 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchInputCoalescingDuration" withListenerID:v12];

  id v13 = +[AXSettings sharedInstance];
  id v14 = +[NSNumber numberWithUnsignedLongLong:self];
  [v13 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchInputCoalescingEnabled" withListenerID:v14];

  uint64_t v15 = +[AXSettings sharedInstance];
  id v16 = +[NSNumber numberWithUnsignedLongLong:self];
  [v15 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchSwitches" withListenerID:v16];

  uint64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_100070484;
  id v22 = &unk_1001AAA90;
  v23 = self;
  AXPerformBlockSynchronouslyOnMainThread();
  [(AXSSInterDeviceCommunicator *)self->_interDeviceCommunicator setActionReceiver:0];
  if (AXDeviceHasJindo()) {
    [(SCATInputController *)self _invalidateAssertionForSystemApertureInert];
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v18.receiver = self;
  v18.super_class = (Class)SCATInputController;
  [(SCATInputController *)&v18 dealloc];
}

- (SCATInputController)initWithInterDeviceCommunicator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCATInputController;
  int v6 = [(SCATInputController *)&v9 init];
  unsigned __int8 v7 = v6;
  if (v6)
  {
    [(SCATInputController *)v6 _sharedInit];
    objc_storeStrong((id *)&v7->_interDeviceCommunicator, a3);
    [(AXSSInterDeviceCommunicator *)v7->_interDeviceCommunicator setActionReceiver:v7];
  }

  return v7;
}

- (void)_sharedInit
{
  location[1] = _NSConcreteStackBlock;
  location[2] = (id)3221225472;
  location[3] = sub_100070BBC;
  location[4] = &unk_1001AAA90;
  location[5] = self;
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_initWeak(location, self);
  id v3 = +[AXSettings sharedInstance];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100070C34;
  v37[3] = &unk_1001AAA68;
  objc_copyWeak(&v38, location);
  [v3 registerUpdateBlock:v37 forRetrieveSelector:"assistiveTouchInputHoldDuration" withListener:self];

  objc_destroyWeak(&v38);
  id v4 = +[AXSettings sharedInstance];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100070D10;
  v35[3] = &unk_1001AAA68;
  objc_copyWeak(&v36, location);
  [v4 registerUpdateBlock:v35 forRetrieveSelector:"assistiveTouchInputHoldEnabled" withListener:self];

  objc_destroyWeak(&v36);
  id v5 = +[AXSettings sharedInstance];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100070DEC;
  v33[3] = &unk_1001AAA68;
  objc_copyWeak(&v34, location);
  [v5 registerUpdateBlock:v33 forRetrieveSelector:"assistiveTouchActionRepeatInterval" withListener:self];

  objc_destroyWeak(&v34);
  int v6 = +[AXSettings sharedInstance];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100070EC8;
  v31[3] = &unk_1001AAA68;
  objc_copyWeak(&v32, location);
  [v6 registerUpdateBlock:v31 forRetrieveSelector:"assistiveTouchActionRepeatEnabled" withListener:self];

  objc_destroyWeak(&v32);
  unsigned __int8 v7 = +[AXSettings sharedInstance];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100070FA4;
  v29[3] = &unk_1001AAA68;
  objc_copyWeak(&v30, location);
  [v7 registerUpdateBlock:v29 forRetrieveSelector:"assistiveTouchInputCoalescingDuration" withListener:self];

  objc_destroyWeak(&v30);
  unsigned int v8 = +[AXSettings sharedInstance];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100071080;
  v27[3] = &unk_1001AAA68;
  objc_copyWeak(&v28, location);
  [v8 registerUpdateBlock:v27 forRetrieveSelector:"assistiveTouchInputCoalescingEnabled" withListener:self];

  objc_destroyWeak(&v28);
  objc_super v9 = +[AXSettings sharedInstance];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10007115C;
  v25[3] = &unk_1001AAA68;
  objc_copyWeak(&v26, location);
  [v9 registerUpdateBlock:v25 forRetrieveSelector:"assistiveTouchSwitches" withListener:self];

  objc_destroyWeak(&v26);
  unsigned int v10 = +[AXSettings sharedInstance];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100071238;
  v23[3] = &unk_1001AAA68;
  objc_copyWeak(&v24, location);
  [v10 registerUpdateBlock:v23 forRetrieveSelector:"switchControlUseCameraForPointMode" withListener:self];

  objc_destroyWeak(&v24);
  id v11 = +[AXSettings sharedInstance];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100071384;
  v21[3] = &unk_1001AAA68;
  objc_copyWeak(&v22, location);
  [v11 registerUpdateBlock:v21 forRetrieveSelector:"switchControlCameraPointPickerMode" withListener:self];

  objc_destroyWeak(&v22);
  id v12 = +[AXSettings sharedInstance];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000714D8;
  v19[3] = &unk_1001AAA68;
  objc_copyWeak(&v20, location);
  [v12 registerUpdateBlock:v19 forRetrieveSelector:"switchControlCameraPointPickerSensitivity" withListener:self];

  objc_destroyWeak(&v20);
  id v13 = +[AXSettings sharedInstance];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100071638;
  v17[3] = &unk_1001AAA68;
  objc_copyWeak(&v18, location);
  [v13 registerUpdateBlock:v17 forRetrieveSelector:"switchControlCameraPointPickerMovementToleranceInJoystickMode" withListener:self];

  objc_destroyWeak(&v18);
  id v14 = (SBSSystemApertureRestrictionService *)objc_alloc_init((Class)SBSSystemApertureRestrictionService);
  restrictionService = self->_restrictionService;
  self->_restrictionService = v14;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100071798, kAXSContinuityDisplayStateChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_destroyWeak(location);
}

- (id)_allSwitchesInUse
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = [v3 assistiveTouchSwitches];
  id v5 = [(SCATInputController *)self recipe];

  if (v5)
  {
    int v6 = [(SCATInputController *)self recipe];
    unsigned __int8 v7 = [v6 mappings];
    unsigned int v8 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v7 count]);

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    objc_super v9 = [(SCATInputController *)self recipe];
    unsigned int v10 = [v9 mappings];

    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v16 = [v15 switchUUID];

          if (v16)
          {
            unsigned int v17 = [v15 switchUUID];
            [v8 addObject:v17];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100071A2C;
    v21[3] = &unk_1001ACD48;
    id v22 = v8;
    id v18 = v8;
    uint64_t v19 = [v4 objectsPassingTest:v21];
  }
  else
  {
    uint64_t v19 = [v4 objectsPassingTest:&stru_1001ACD88];
  }

  return v19;
}

- (int64_t)role
{
  id v3 = [(SCATInputController *)self interDeviceCommunicator];
  unsigned __int8 v4 = [v3 isReceivingSwitchEvents];

  if (v4) {
    return 2;
  }
  int v6 = [(SCATInputController *)self interDeviceCommunicator];
  unsigned int v7 = [v6 isForwardingSwitchEvents];

  return v7;
}

- (void)setRecipe:(id)a3
{
  id v5 = (AXSwitchRecipe *)a3;
  p_recipe = &self->_recipe;
  if (self->_recipe != v5)
  {
    unsigned int v7 = v5;
    objc_storeStrong((id *)p_recipe, a3);
    p_recipe = (AXSwitchRecipe **)[(SCATInputController *)self hasInitializedInputSources];
    id v5 = v7;
    if (p_recipe)
    {
      p_recipe = (AXSwitchRecipe **)[(SCATInputController *)self _updateInputSources];
      id v5 = v7;
    }
  }

  _objc_release_x1(p_recipe, v5);
}

- (BOOL)isSwitchWithSource:(id)a3
{
  return [(SCATInputController *)self _isSwitchWithSource:a3 isEnabled:0];
}

- (BOOL)isEnabledSwitchWithSource:(id)a3
{
  return [(SCATInputController *)self _isSwitchWithSource:a3 isEnabled:&__kCFBooleanTrue];
}

- (BOOL)_isSwitchWithSource:(id)a3 isEnabled:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(SCATInputController *)self _allSwitchesInUse];
  uint64_t v16 = 0;
  unsigned int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100071CA0;
  v12[3] = &unk_1001ACDB0;
  id v9 = v6;
  id v13 = v9;
  id v10 = v7;
  id v14 = v10;
  uint64_t v15 = &v16;
  [v8 enumerateObjectsUsingBlock:v12];
  LOBYTE(v7) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v7;
}

- (void)updateWhetherSwitchConfigurationRendersDeviceUnusable
{
  BOOL v3 = [(SCATInputController *)self _switchConfigurationRendersDeviceUnusable];
  unsigned int v4 = [(SCATInputController *)self isValid];
  if (v3)
  {
    if (v4)
    {
      [(SCATInputController *)self setValid:[(SCATInputController *)self isValid] ^ 1];
      id v5 = AXLocStringKeyForHomeButton();
      id v6 = sub_100040EC8(v5);

      [(SCATInputController *)self _showAlert:v6 forSource:3];
    }
  }
  else if ((v4 & 1) == 0)
  {
    [(SCATInputController *)self setValid:[(SCATInputController *)self isValid] ^ 1];
    [(SCATInputController *)self _hideAlertForSource:3];
  }
  id v7 = +[AXBackBoardServer server];
  [v7 setSwitchControlRendersDeviceUnusable:v3];
}

- (void)updateWhetherSwitchConfigurationHasScreenSwitch
{
  id v3 = +[AXBackBoardServer server];
  objc_msgSend(v3, "setSwitchControlHasScreenSwitch:", -[SCATInputController _switchConfigurationHasScreenSwitch](self, "_switchConfigurationHasScreenSwitch"));
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  [(SCATInputController *)self setDelegate:a3];
  [(SCATInputController *)self setQueue:v6];
}

- (AXUIClient)userInterfaceClient
{
  id v3 = [(SCATInputController *)self delegate];
  unsigned int v4 = [v3 userInterfaceClientForInputController:self];

  return (AXUIClient *)v4;
}

- (void)_hideAlerts
{
  if (AXDeviceHasJindo()) {
    [(SCATInputController *)self _invalidateAssertionForSystemApertureInert];
  }
  id v3 = [(SCATInputController *)self userInterfaceClient];
  [v3 sendAsynchronousMessage:0 withIdentifier:9 targetAccessQueue:0 completion:0];
}

- (void)_hideAlertForSource:(unint64_t)a3
{
  if (AXDeviceHasJindo()) {
    [(SCATInputController *)self _invalidateAssertionForSystemApertureInert];
  }
  id v7 = [(SCATInputController *)self userInterfaceClient];
  id v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = +[NSDictionary dictionaryWithObjectsAndKeys:v5, @"input source", 0];

  [v7 sendAsynchronousMessage:v6 withIdentifier:3 targetAccessQueue:0 completion:0];
}

- (void)_hideStateForSource:(unint64_t)a3
{
  if (AXDeviceHasJindo()) {
    [(SCATInputController *)self _invalidateAssertionForSystemApertureInert];
  }
  id v7 = [(SCATInputController *)self userInterfaceClient];
  id v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = +[NSDictionary dictionaryWithObjectsAndKeys:v5, @"input source", 0];

  [v7 sendAsynchronousMessage:v6 withIdentifier:5 targetAccessQueue:0 completion:0];
}

- (void)_showAlert:(id)a3 forSource:(unint64_t)a4
{
  id v6 = a3;
  if (AXDeviceHasJindo()) {
    [(SCATInputController *)self _restrictSystemApertureLayoutToInert];
  }
  id v7 = +[AXSettings sharedInstance];
  unsigned int v8 = [v7 switchControlIgnoreInvalidSwitchConfiguration];

  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2 && v8)
  {
    id v9 = SWCHLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = +[NSNumber numberWithUnsignedInteger:a4];
      *(_DWORD *)buf = 138412546;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not showing alert because switchControlIgnoreInvalidSwitchConfiguration is enabled. Input Source: %@. Alert: %@", buf, 0x16u);
    }
  }
  else
  {
    id v9 = [(SCATInputController *)self userInterfaceClient];
    id v11 = +[NSNumber numberWithUnsignedInteger:a4];
    id v12 = +[NSDictionary dictionaryWithObjectsAndKeys:v11, @"input source", v6, @"input alert", 0];

    [v9 sendAsynchronousMessage:v12 withIdentifier:4 targetAccessQueue:0 completion:0];
  }
}

- (void)_showState:(id)a3 forSource:(unint64_t)a4
{
  id v6 = a3;
  if (AXDeviceHasJindo()) {
    [(SCATInputController *)self _restrictSystemApertureLayoutToInert];
  }
  id v9 = [(SCATInputController *)self userInterfaceClient];
  id v7 = +[NSNumber numberWithUnsignedInteger:a4];
  unsigned int v8 = +[NSDictionary dictionaryWithObjectsAndKeys:v7, @"input source", v6, @"input state", 0];

  [v9 sendAsynchronousMessage:v8 withIdentifier:6 targetAccessQueue:0 completion:0];
}

- (void)_restrictSystemApertureLayoutToInert
{
  if (AXDeviceHasJindo())
  {
    [(SCATInputController *)self _invalidateAssertionForSystemApertureInert];
    id v3 = [(SCATInputController *)self systemApertureInvalidatable];

    if (!v3)
    {
      id v4 = [(SBSSystemApertureRestrictionService *)self->_restrictionService acquireRestrictSystemApertureLayoutToInertAssertionWithReason:@"switchControlBanner"];
      [(SCATInputController *)self setSystemApertureInvalidatable:v4];
    }
  }
}

- (void)_invalidateAssertionForSystemApertureInert
{
  if (AXDeviceHasJindo())
  {
    id v3 = [(SCATInputController *)self systemApertureInvalidatable];

    if (v3)
    {
      id v4 = [(SCATInputController *)self systemApertureInvalidatable];
      [v4 invalidate];

      [(SCATInputController *)self setSystemApertureInvalidatable:0];
    }
  }
}

- (void)_hideAlertForMotionTrackerInputSource
{
}

- (void)didReceiveSwitchEvent:(id)a3 forDeviceWithName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SCATInputController *)self interDeviceInputSource];
  [v8 handleReceivedSwitchEvent:v7 deviceName:v6];
}

- (void)performSysdiagnose
{
  id v3 = [(SCATInputController *)self delegate];
  [v3 performSysdiagnoseForInputController:self];
}

- (BOOL)motionTrackingEnabled
{
  return self->_motionTrackingEnabled;
}

- (AXSwitchRecipe)recipe
{
  return self->_recipe;
}

- (SCATKeyboardInputSource)keyboardInputSource
{
  return self->_keyboardInputSource;
}

- (void)setKeyboardInputSource:(id)a3
{
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (SCATInputControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATInputControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AXAccessQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (SCATCameraInputSource)cameraInputSource
{
  return self->_cameraInputSource;
}

- (void)setCameraInputSource:(id)a3
{
}

- (SCATMFIInputSource)mfiInputSource
{
  return self->_mfiInputSource;
}

- (void)setMfiInputSource:(id)a3
{
}

- (SCATScreenInputSource)screenInputSource
{
  return self->_screenInputSource;
}

- (void)setScreenInputSource:(id)a3
{
}

- (SCATATVRemoteInputSource)atvRemoteInputSource
{
  return self->_atvRemoteInputSource;
}

- (void)setAtvRemoteInputSource:(id)a3
{
}

- (SCATMIDIInputSource)midiInputSource
{
  return self->_midiInputSource;
}

- (void)setMidiInputSource:(id)a3
{
}

- (SCATGamepadInputSource)gamepadInputSource
{
  return self->_gamepadInputSource;
}

- (void)setGamepadInputSource:(id)a3
{
}

- (SCATRemoteControlInputSource)remoteControlInputSource
{
  return self->_remoteControlInputSource;
}

- (void)setRemoteControlInputSource:(id)a3
{
}

- (_TtC15assistivetouchd17SCATAirPodsSource)airPodsSource
{
  return self->_airPodsSource;
}

- (void)setAirPodsSource:(id)a3
{
}

- (SCATHeadTracker)headGestureSource
{
  return self->_headGestureSource;
}

- (void)setHeadGestureSource:(id)a3
{
}

- (SCATHandTracker)handGestureSource
{
  return self->_handGestureSource;
}

- (void)setHandGestureSource:(id)a3
{
}

- (AXSSInterDeviceCommunicator)interDeviceCommunicator
{
  return self->_interDeviceCommunicator;
}

- (SCATInterDeviceInputSource)interDeviceInputSource
{
  return self->_interDeviceInputSource;
}

- (void)setInterDeviceInputSource:(id)a3
{
}

- (SCATMotionTrackerInputSource)motionTrackerInputSource
{
  return self->_motionTrackerInputSource;
}

- (void)setMotionTrackerInputSource:(id)a3
{
}

- (BOOL)motionTrackerLostFace
{
  return self->_motionTrackerLostFace;
}

- (void)setMotionTrackerLostFace:(BOOL)a3
{
  self->_motionTrackerLostFace = a3;
}

- (int64_t)motionTrackerErrorCode
{
  return self->_motionTrackerErrorCode;
}

- (void)setMotionTrackerErrorCode:(int64_t)a3
{
  self->_motionTrackerErrorCode = a3;
}

- (NSTimer)motionTrackerDelayedShowAlertTimer
{
  return self->_motionTrackerDelayedShowAlertTimer;
}

- (void)setMotionTrackerDelayedShowAlertTimer:(id)a3
{
}

- (NSTimer)motionTrackerDelayedHideAlertTimer
{
  return self->_motionTrackerDelayedHideAlertTimer;
}

- (void)setMotionTrackerDelayedHideAlertTimer:(id)a3
{
}

- (SCATAccessibilityEventInputSource)accessibilityEventInputSource
{
  return self->_accessibilityEventInputSource;
}

- (void)setAccessibilityEventInputSource:(id)a3
{
}

- (double)timeIntervalBeforeSendAction
{
  return self->_timeIntervalBeforeSendAction;
}

- (void)setTimeIntervalBeforeSendAction:(double)a3
{
  self->_timeIntervalBeforeSendAction = a3;
}

- (double)timeIntervalBeforeSendLongPressAction
{
  return self->_timeIntervalBeforeSendLongPressAction;
}

- (void)setTimeIntervalBeforeSendLongPressAction:(double)a3
{
  self->_timeIntervalBeforeSendLongPressAction = a3;
}

- (double)timeIntervalBeforeSendRepeatAction
{
  return self->_timeIntervalBeforeSendRepeatAction;
}

- (void)setTimeIntervalBeforeSendRepeatAction:(double)a3
{
  self->_timeIntervalBeforeSendRepeatAction = a3;
}

- (double)timeIntervalBetweenDidSendActions
{
  return self->_timeIntervalBetweenDidSendActions;
}

- (void)setTimeIntervalBetweenDidSendActions:(double)a3
{
  self->_timeIntervalBetweenDidSendActions = a3;
}

- (double)timeIntervalSinceDidSendAction
{
  return self->_timeIntervalSinceDidSendAction;
}

- (void)setTimeIntervalSinceDidSendAction:(double)a3
{
  self->_timeIntervalSinceDidSendAction = a3;
}

- (BOOL)isInputHoldEnabled
{
  return self->_isInputHoldEnabled;
}

- (void)setIsInputHoldEnabled:(BOOL)a3
{
  self->_isInputHoldEnabled = a3;
}

- (BOOL)isInputRepeatEnabled
{
  return self->_isInputRepeatEnabled;
}

- (void)setIsInputRepeatEnabled:(BOOL)a3
{
  self->_isInputRepeatEnabled = a3;
}

- (BOOL)isInputCoalesceEnabled
{
  return self->_isInputCoalesceEnabled;
}

- (void)setIsInputCoalesceEnabled:(BOOL)a3
{
  self->_isInputCoalesceEnabled = a3;
}

- (AXDispatchTimer)inputHoldTimer
{
  return self->_inputHoldTimer;
}

- (void)setInputHoldTimer:(id)a3
{
}

- (AXDispatchTimer)inputRepeatTimer
{
  return self->_inputRepeatTimer;
}

- (void)setInputRepeatTimer:(id)a3
{
}

- (AXDispatchTimer)inputLongPressTimer
{
  return self->_inputLongPressTimer;
}

- (void)setInputLongPressTimer:(id)a3
{
}

- (BOOL)hasInitializedInputSources
{
  return self->_hasInitializedInputSources;
}

- (void)setHasInitializedInputSources:(BOOL)a3
{
  self->_hasInitializedInputSources = a3;
}

- (NSMutableSet)availableDevices
{
  return self->_availableDevices;
}

- (void)setAvailableDevices:(id)a3
{
}

- (SBSSystemApertureRestrictionService)restrictionService
{
  return self->_restrictionService;
}

- (void)setRestrictionService:(id)a3
{
}

- (BSInvalidatable)systemApertureInvalidatable
{
  return self->_systemApertureInvalidatable;
}

- (void)setSystemApertureInvalidatable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemApertureInvalidatable, 0);
  objc_storeStrong((id *)&self->_restrictionService, 0);
  objc_storeStrong((id *)&self->_availableDevices, 0);
  objc_storeStrong((id *)&self->_inputLongPressTimer, 0);
  objc_storeStrong((id *)&self->_inputRepeatTimer, 0);
  objc_storeStrong((id *)&self->_inputHoldTimer, 0);
  objc_storeStrong((id *)&self->_accessibilityEventInputSource, 0);
  objc_storeStrong((id *)&self->_motionTrackerDelayedHideAlertTimer, 0);
  objc_storeStrong((id *)&self->_motionTrackerDelayedShowAlertTimer, 0);
  objc_storeStrong((id *)&self->_motionTrackerInputSource, 0);
  objc_storeStrong((id *)&self->_interDeviceInputSource, 0);
  objc_storeStrong((id *)&self->_interDeviceCommunicator, 0);
  objc_storeStrong((id *)&self->_handGestureSource, 0);
  objc_storeStrong((id *)&self->_headGestureSource, 0);
  objc_storeStrong((id *)&self->_airPodsSource, 0);
  objc_storeStrong((id *)&self->_remoteControlInputSource, 0);
  objc_storeStrong((id *)&self->_gamepadInputSource, 0);
  objc_storeStrong((id *)&self->_midiInputSource, 0);
  objc_storeStrong((id *)&self->_atvRemoteInputSource, 0);
  objc_storeStrong((id *)&self->_screenInputSource, 0);
  objc_storeStrong((id *)&self->_mfiInputSource, 0);
  objc_storeStrong((id *)&self->_cameraInputSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyboardInputSource, 0);

  objc_storeStrong((id *)&self->_recipe, 0);
}

@end