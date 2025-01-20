@interface AXIntentHandler
- (id)handlerForIntent:(id)a3;
@end

@implementation AXIntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXIntentHandler Handling intent: %@", (uint8_t *)&v11, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = VoiceOverIntentHandler;
LABEL_21:
    v7 = (AXIntentHandler *)objc_alloc_init(v6);
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = SpeechIntentHandler;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = MagnifierIntentHandler;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_20:
    v6 = AXToggleIntentHandler;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = SwitchControlIntentHandler;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = AXSwitchControlSwitchIntentHandler;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = ZoomIntentHandler;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = GuidedAccessIntentHandler;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = AXDisplayIntentHandler;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v6 = AXVisionIntentHandler;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = ToggleSoundDetectionIntentHandler;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = SetSoundDetectorIntentHandler;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = AXBackgroundSoundsIntentHandler;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = AXStartRemoteWatchScreenIntentHandler;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = AXSetLeftRightBalanceIntentHandler;
    goto LABEL_21;
  }
  v10 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10000C298((uint64_t)v4, v10);
  }

  v7 = self;
LABEL_22:
  v8 = v7;

  return v8;
}

@end