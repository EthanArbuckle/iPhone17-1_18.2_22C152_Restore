@interface VOTExternalAccessoryManager
+ (id)accessoryManager;
- (OS_dispatch_queue)eaQueue;
- (VOTExternalAccessoryManager)init;
- (id)accessibilityAccessory:(id)a3 currentValueForItemProperty:(int)a4 withElement:(id)a5;
- (id)accessibilityAccessory:(id)a3 currentValueForSystemProperty:(int)a4;
- (id)accessories;
- (id)accessoryTraitsFromElement:(id)a3;
- (void)_accessoryConnected:(id)a3;
- (void)_accessoryWantsStop:(id)a3;
- (void)_handleAccessoryShutdown;
- (void)_handleInputText:(id)a3;
- (void)_handleSpeakString:(id)a3;
- (void)_handleTextOperation:(int)a3;
- (void)_updateCurrentVoiceOverItem;
- (void)accessibilityAccessory:(id)a3 performAction:(int)a4 withObject:(id)a5;
- (void)accessibilityAccessory:(id)a3 setContext:(int)a4;
- (void)accessibilityAccessory:(id)a3 setValue:(id)a4 forSystemProperty:(int)a5;
- (void)accessoryDidDisconnect:(id)a3;
- (void)dealloc;
- (void)setEaQueue:(id)a3;
- (void)setElementManager:(id)a3;
- (void)startListening;
- (void)stopListening;
- (void)updateCurrentItemProperties:(id)a3;
- (void)updateSpeakingRate;
- (void)updateVolume:(double)a3;
@end

@implementation VOTExternalAccessoryManager

+ (id)accessoryManager
{
  if (qword_1001EBB38 != -1) {
    dispatch_once(&qword_1001EBB38, &stru_1001B68D0);
  }
  v2 = (void *)qword_1001EBB30;

  return v2;
}

- (VOTExternalAccessoryManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)VOTExternalAccessoryManager;
  v2 = [(VOTExternalAccessoryManager *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.voiceovertouch.ea", 0);
    eaQueue = v2->_eaQueue;
    v2->_eaQueue = (OS_dispatch_queue *)v3;

    [sub_1000E6610() registerCapabilities:2];
    v5 = +[NSNotificationCenter defaultCenter];
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    v6 = (void *)qword_1001EBB70;
    uint64_t v21 = qword_1001EBB70;
    if (!qword_1001EBB70)
    {
      v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      v15 = sub_1000EA8F4;
      v16 = &unk_1001B3FE0;
      v17 = &v18;
      v7 = (void *)sub_1000EA788();
      v8 = dlsym(v7, "EAAccessoryDidConnectNotification");
      *(void *)(v17[1] + 24) = v8;
      qword_1001EBB70 = *(void *)(v17[1] + 24);
      v6 = (void *)v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v6) {
      sub_1001224C4();
    }
    [v5 addObserver:v2 selector:"_accessoryConnected:" name:*v6 object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000E66F4, kAXSVoiceOverTouchEnabledThroughAccessoryNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v10 = v2;
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VOTExternalAccessoryManager;
  [(VOTExternalAccessoryManager *)&v4 dealloc];
}

- (void)setElementManager:(id)a3
{
}

- (void)_handleAccessoryShutdown
{
  v2 = +[AXSubsystemVoiceOverIAP sharedInstance];
  unsigned __int8 v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    objc_super v4 = +[AXSubsystemVoiceOverIAP identifier];
    v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = AXColorizeFormatLog();
      unsigned int v8 = [(id)VOTSharedWorkspace wasEnabledThroughAccessory];
      uint64_t v25 = _AXSVoiceOverTouchEnabledThroughAccessory();
      uint64_t v26 = _AXSVoiceOverTouchUIEnabled();
      uint64_t v24 = v8;
      v9 = _AXStringForArgs();
      if (os_log_type_enabled(v5, v6))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v9;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (objc_msgSend((id)VOTSharedWorkspace, "wasEnabledThroughAccessory", v24, v25, v26)
    && !_AXSVoiceOverTouchUIEnabled())
  {
    v10 = +[AXSubsystemVoiceOverIAP sharedInstance];
    unsigned __int8 v11 = [v10 ignoreLogging];

    if ((v11 & 1) == 0)
    {
      objc_super v12 = +[AXSubsystemVoiceOverIAP identifier];
      v13 = AXLoggerForFacility();

      os_log_type_t v14 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = AXColorizeFormatLog();
        v16 = _AXStringForArgs();
        if (os_log_type_enabled(v13, v14))
        {
          *(_DWORD *)buf = 138543362;
          v28 = v16;
          _os_log_impl((void *)&_mh_execute_header, v13, v14, "%{public}@", buf, 0xCu);
        }
      }
    }
    if (([(id)VOTSharedWorkspace accessoryShutdownInProgress] & 1) == 0)
    {
      _AXSVoiceOverTouchSetEnabledThroughAccessory();
      _AXSVoiceOverTouchSetEnabled();
      v17 = +[AXSubsystemVoiceOverIAP sharedInstance];
      unsigned __int8 v18 = [v17 ignoreLogging];

      if ((v18 & 1) == 0)
      {
        v19 = +[AXSubsystemVoiceOverIAP identifier];
        uint64_t v20 = AXLoggerForFacility();

        os_log_type_t v21 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v20, v21))
        {
          v22 = AXColorizeFormatLog();
          v23 = _AXStringForArgs();
          if (os_log_type_enabled(v20, v21))
          {
            *(_DWORD *)buf = 138543362;
            v28 = v23;
            _os_log_impl((void *)&_mh_execute_header, v20, v21, "%{public}@", buf, 0xCu);
          }
        }
      }
      AXPerformBlockOnMainThreadAfterDelay();
      [(id)VOTSharedWorkspace setAccessoryShutdownInProgress:1];
    }
  }
}

- (void)_accessoryWantsStop:(id)a3
{
  objc_super v4 = [(VOTExternalAccessoryManager *)self eaQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E6BBC;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_accessoryConnected:(id)a3
{
  id v4 = a3;
  v5 = [(VOTExternalAccessoryManager *)self eaQueue];
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_1000E6C88;
  v10 = &unk_1001B3448;
  id v11 = v4;
  objc_super v12 = self;
  id v6 = v4;
  dispatch_async(v5, &v7);

  +[NSThread cancelPreviousPerformRequestsWithTarget:](NSThread, "cancelPreviousPerformRequestsWithTarget:", self, v7, v8, v9, v10);
}

- (void)accessoryDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = [(VOTExternalAccessoryManager *)self eaQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E6FEC;
  v7[3] = &unk_1001B3448;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)startListening
{
  unsigned __int8 v3 = [(VOTExternalAccessoryManager *)self eaQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E7478;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)stopListening
{
  unsigned __int8 v3 = [(VOTExternalAccessoryManager *)self eaQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E78CC;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_handleInputText:(id)a3
{
}

- (void)_handleSpeakString:(id)a3
{
  id v3 = a3;
  id v4 = +[VOTOutputManager outputManager];
  [v4 speakSimpleString:v3];
}

- (void)_handleTextOperation:(int)a3
{
  if ((a3 - 12) <= 2)
  {
    id v4 = *(id *)*(&off_1001B6948 + a3 - 12);
    if (v4)
    {
      id v6 = v4;
      v5 = [(VOTElementManager *)self->_elementManager currentElement];
      [v5 performTextOperation:v6];
    }
  }
}

- (void)accessibilityAccessory:(id)a3 performAction:(int)a4 withObject:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = +[AXSubsystemVoiceOverIAP sharedInstance];
  unsigned __int8 v9 = [v8 ignoreLogging];

  if ((v9 & 1) == 0)
  {
    v10 = +[AXSubsystemVoiceOverIAP identifier];
    id v11 = AXLoggerForFacility();

    os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = AXColorizeFormatLog();
      uint64_t v35 = v5;
      id v36 = v7;
      os_log_type_t v14 = _AXStringForArgs();
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        v38 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}@", buf, 0xCu);
      }
    }
  }
  id v15 = [objc_allocWithZone((Class)AXIndexMap) init];
  switch((int)v5)
  {
    case 1:
      v19 = sub_1000E8134();
      uint64_t v20 = [v7 objectForKey:v19];
      double v21 = (double)(int)[v20 intValue];
      v22 = sub_1000E823C();
      v23 = [v7 objectForKey:v22];
      [v23 intValue];

      uint64_t v24 = +[VOTEvent touchEventWithCommand:kVOTEventCommandTracking info:0];
      [v24 setTouchPoint:sub_100051E14(v21 / 65535.0)];
      [(id)VOTSharedWorkspace dispatchCommand:v24];
      goto LABEL_31;
    case 2:
      uint64_t v25 = (id *)&kVOTEventCommandFirstElement;
      goto LABEL_43;
    case 3:
      uint64_t v25 = (id *)&kVOTEventCommandLastElement;
      goto LABEL_43;
    case 4:
    case 5:
      uint64_t v16 = 8;
      switch(self->_context)
      {
        case 0:
        case 1:
          v17 = (id *)&kVOTEventCommandPreviousElement;
          if (v5 != 5) {
            v17 = (id *)&kVOTEventCommandNextElement;
          }
          id v18 = *v17;
          if (v18) {
            goto LABEL_44;
          }
          break;
        case 2:
          goto LABEL_40;
        case 3:
          uint64_t v16 = 9;
          goto LABEL_40;
        case 4:
          uint64_t v16 = 10;
          goto LABEL_40;
        case 5:
          uint64_t v16 = 3;
          goto LABEL_40;
        case 6:
          uint64_t v16 = 7;
          goto LABEL_40;
        case 7:
          uint64_t v16 = 1;
          goto LABEL_40;
        case 8:
          uint64_t v16 = 19;
LABEL_40:
          -[VOTElementManager setElementRotorToType:saveToPreferences:userInitiated:](self->_elementManager, "setElementRotorToType:saveToPreferences:userInitiated:", v16, 1, 1, v35, v36);
          break;
        default:
          break;
      }
      uint64_t v25 = (id *)&kVOTEventCommandSearchRotorUp;
      if (v5 != 5) {
        uint64_t v25 = (id *)&kVOTEventCommandSearchRotorDown;
      }
      goto LABEL_43;
    case 6:
      uint64_t v25 = (id *)&kVOTEventCommandScrollLeftPage;
      goto LABEL_43;
    case 7:
      uint64_t v25 = (id *)&kVOTEventCommandScrollRightPage;
      goto LABEL_43;
    case 8:
      uint64_t v25 = (id *)&kVOTEventCommandScrollUpPage;
      goto LABEL_43;
    case 9:
      uint64_t v25 = (id *)&kVOTEventCommandScrollDownPage;
      goto LABEL_43;
    case 10:
      uint64_t v26 = sub_1000E8134();
      v27 = [v7 objectForKey:v26];
      double v28 = (double)(int)[v27 intValue];
      v29 = sub_1000E823C();
      v30 = [v7 objectForKey:v29];
      double v31 = (double)(int)[v30 intValue];

      v32 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v28 / 65535.0, v31 / 65535.0);
      [v15 setObject:v32 forIndex:101];

      uint64_t v25 = (id *)&kVOTEventCommandScrollToPoint;
      goto LABEL_43;
    case 11:
      uint64_t v24 = sub_1000E8344();
      v33 = [v7 objectForKey:v24];
      [(VOTExternalAccessoryManager *)self _handleInputText:v33];
      goto LABEL_30;
    case 12:
    case 13:
    case 14:
      [(VOTExternalAccessoryManager *)self _handleTextOperation:v5];
      break;
    case 15:
      uint64_t v25 = (id *)&kVOTEventCommandHomeButtonPress;
      goto LABEL_43;
    case 16:
      uint64_t v25 = (id *)&kVOTEventCommandSimpleTap;
      goto LABEL_43;
    case 19:
      uint64_t v25 = (id *)&kVOTEventCommandPauseSpeaking;
      goto LABEL_43;
    case 20:
      uint64_t v25 = (id *)&kVOTEventCommandContinueSpeaking;
      goto LABEL_43;
    case 21:
      uint64_t v25 = (id *)&kVOTEventCommandReadAll;
      goto LABEL_43;
    case 22:
      uint64_t v25 = (id *)&kVOTEventCommandReadFromTop;
      goto LABEL_43;
    case 23:
      uint64_t v24 = sub_1000E8344();
      v33 = [v7 objectForKey:v24];
      [(VOTExternalAccessoryManager *)self _handleSpeakString:v33];
LABEL_30:

LABEL_31:
      break;
    case 24:
      uint64_t v25 = (id *)&kVOTEventCommandEscape;
LABEL_43:
      id v18 = *v25;
      if (v18)
      {
LABEL_44:
        v34 = +[VOTEvent externalDeviceEventWithCommand:info:](VOTEvent, "externalDeviceEventWithCommand:info:", v18, v15, v35, v36);
        [(id)VOTSharedWorkspace dispatchCommand:v34];
      }
      break;
    case 25:
      [(VOTExternalAccessoryManager *)self _updateCurrentVoiceOverItem];
      break;
    default:
      break;
  }
}

- (void)accessibilityAccessory:(id)a3 setContext:(int)a4
{
  id v6 = +[AXSubsystemVoiceOverIAP sharedInstance];
  unsigned __int8 v7 = [v6 ignoreLogging];

  if ((v7 & 1) == 0)
  {
    id v8 = +[AXSubsystemVoiceOverIAP identifier];
    unsigned __int8 v9 = AXLoggerForFacility();

    os_log_type_t v10 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = AXColorizeFormatLog();
      os_log_type_t v12 = _AXStringForArgs();
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        os_log_type_t v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "%{public}@", buf, 0xCu);
      }
    }
  }
  self->_context = a4;
}

- (id)accessoryTraitsFromElement:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  unint64_t v5 = (unint64_t)[v3 traits];
  if ((kAXButtonTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    id v6 = (void *)qword_1001EBB98;
    uint64_t v42 = qword_1001EBB98;
    if (!qword_1001EBB98)
    {
      unsigned __int8 v7 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v7, "EAAccessoryAccessibilityTraitButton");
      qword_1001EBB98 = v40[3];
      id v6 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v6) {
      sub_100122E24();
    }
    [v4 addObject:*v6];
  }
  if ((kAXLinkTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    id v8 = (void *)qword_1001EBBA0;
    uint64_t v42 = qword_1001EBBA0;
    if (!qword_1001EBBA0)
    {
      unsigned __int8 v9 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v9, "EAAccessoryAccessibilityTraitLink");
      qword_1001EBBA0 = v40[3];
      id v8 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v8) {
      sub_100122DAC();
    }
    [v4 addObject:*v8];
  }
  if ((kAXImageTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    os_log_type_t v10 = (void *)qword_1001EBBA8;
    uint64_t v42 = qword_1001EBBA8;
    if (!qword_1001EBBA8)
    {
      id v11 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v11, "EAAccessoryAccessibilityTraitImage");
      qword_1001EBBA8 = v40[3];
      os_log_type_t v10 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v10) {
      sub_100122D34();
    }
    [v4 addObject:*v10];
  }
  if ((kAXSearchFieldTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    os_log_type_t v12 = (void *)qword_1001EBBB0;
    uint64_t v42 = qword_1001EBBB0;
    if (!qword_1001EBBB0)
    {
      v13 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v13, "EAAccessoryAccessibilityTraitSearchField");
      qword_1001EBBB0 = v40[3];
      os_log_type_t v12 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v12) {
      sub_100122CBC();
    }
    [v4 addObject:*v12];
  }
  if ((kAXSelectedTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    os_log_type_t v14 = (void *)qword_1001EBBB8;
    uint64_t v42 = qword_1001EBBB8;
    if (!qword_1001EBBB8)
    {
      id v15 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v15, "EAAccessoryAccessibilityTraitSelected");
      qword_1001EBBB8 = v40[3];
      os_log_type_t v14 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v14) {
      sub_100122C44();
    }
    [v4 addObject:*v14];
  }
  if ((kAXPlaysSoundTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v16 = (void *)qword_1001EBBC0;
    uint64_t v42 = qword_1001EBBC0;
    if (!qword_1001EBBC0)
    {
      v17 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v17, "EAAccessoryAccessibilityTraitSound");
      qword_1001EBBC0 = v40[3];
      uint64_t v16 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v16) {
      sub_100122BCC();
    }
    [v4 addObject:*v16];
  }
  if ((kAXKeyboardKeyTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    id v18 = (void *)qword_1001EBBC8;
    uint64_t v42 = qword_1001EBBC8;
    if (!qword_1001EBBC8)
    {
      v19 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v19, "EAAccessoryAccessibilityTraitKeyboardKey");
      qword_1001EBBC8 = v40[3];
      id v18 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v18) {
      sub_100122B54();
    }
    [v4 addObject:*v18];
  }
  if ((kAXStaticTextTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v20 = (void *)qword_1001EBBD0;
    uint64_t v42 = qword_1001EBBD0;
    if (!qword_1001EBBD0)
    {
      double v21 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v21, "EAAccessoryAccessibilityTraitStaticText");
      qword_1001EBBD0 = v40[3];
      uint64_t v20 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v20) {
      sub_100122ADC();
    }
    [v4 addObject:*v20];
  }
  if ((kAXSummaryElementTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    v22 = (void *)qword_1001EBBD8;
    uint64_t v42 = qword_1001EBBD8;
    if (!qword_1001EBBD8)
    {
      v23 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v23, "EAAccessoryAccessibilityTraitSummaryElement");
      qword_1001EBBD8 = v40[3];
      v22 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v22) {
      sub_100122A64();
    }
    [v4 addObject:*v22];
  }
  if ((kAXNotEnabledTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v24 = (void *)qword_1001EBBE0;
    uint64_t v42 = qword_1001EBBE0;
    if (!qword_1001EBBE0)
    {
      uint64_t v25 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v25, "EAAccessoryAccessibilityTraitNotEnabled");
      qword_1001EBBE0 = v40[3];
      uint64_t v24 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v24) {
      sub_1001229EC();
    }
    [v4 addObject:*v24];
  }
  if ((kAXUpdatesFrequentlyTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v26 = (void *)qword_1001EBBE8;
    uint64_t v42 = qword_1001EBBE8;
    if (!qword_1001EBBE8)
    {
      v27 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v27, "EAAccessoryAccessibilityTraitUpdatesFrequently");
      qword_1001EBBE8 = v40[3];
      uint64_t v26 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v26) {
      sub_100122974();
    }
    [v4 addObject:*v26];
  }
  if ((kAXAdjustableTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    double v28 = (void *)qword_1001EBBF0;
    uint64_t v42 = qword_1001EBBF0;
    if (!qword_1001EBBF0)
    {
      v29 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v29, "EAAccessoryAccessibilityTraitAdjustable");
      qword_1001EBBF0 = v40[3];
      double v28 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v28) {
      sub_1001228FC();
    }
    [v4 addObject:*v28];
  }
  if ((kAXBackButtonTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    v30 = (void *)qword_1001EBBF8;
    uint64_t v42 = qword_1001EBBF8;
    if (!qword_1001EBBF8)
    {
      double v31 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v31, "EAAccessoryAccessibilityTraitBackButton");
      qword_1001EBBF8 = v40[3];
      v30 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v30) {
      sub_100122884();
    }
    [v4 addObject:*v30];
  }
  if ((kAXMapTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    v32 = (void *)qword_1001EBC00;
    uint64_t v42 = qword_1001EBC00;
    if (!qword_1001EBC00)
    {
      v33 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v33, "EAAccessoryAccessibilityTraitMap");
      qword_1001EBC00 = v40[3];
      v32 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v32) {
      sub_10012280C();
    }
    [v4 addObject:*v32];
  }
  if ((kAXStartsMediaSessionTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    v34 = (void *)qword_1001EBC08;
    uint64_t v42 = qword_1001EBC08;
    if (!qword_1001EBC08)
    {
      uint64_t v35 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v35, "EAAccessoryAccessibilityTraitStartsMediaSession");
      qword_1001EBC08 = v40[3];
      v34 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v34) {
      sub_100122794();
    }
    [v4 addObject:*v34];
  }
  if ((kAXDeleteKeyTrait & v5) != 0)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    id v36 = (void *)qword_1001EBC10;
    uint64_t v42 = qword_1001EBC10;
    if (!qword_1001EBC10)
    {
      v37 = (void *)sub_1000EA788();
      v40[3] = (uint64_t)dlsym(v37, "EAAccessoryAccessibilityTraitDeleteKey");
      qword_1001EBC10 = v40[3];
      id v36 = (void *)v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v36) {
      sub_10012271C();
    }
    [v4 addObject:*v36];
  }

  return v4;
}

- (id)accessibilityAccessory:(id)a3 currentValueForItemProperty:(int)a4 withElement:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  os_log_type_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [(VOTElementManager *)self->_elementManager currentElement];
  }
  os_log_type_t v12 = v11;
  switch(a4)
  {
    case 1:
      uint64_t v13 = [v11 label];
      goto LABEL_17;
    case 2:
      uint64_t v13 = [v11 value];
      goto LABEL_17;
    case 3:
      uint64_t v13 = [v11 hint];
      goto LABEL_17;
    case 4:
      [v11 frame];
      double v16 = v15;
      long long v17 = xmmword_1001EBE30;
      double v19 = v18 / *(double *)&xmmword_1001EBE30;
      double v21 = v20 / *((double *)&xmmword_1001EBE30 + 1);
      double v23 = v22 / *(double *)&xmmword_1001EBE30;
      *(float *)&double v19 = v19;
      uint64_t v24 = +[NSNumber numberWithFloat:v19];
      uint64_t v25 = sub_1000E8134();
      *(float *)&double v26 = v21;
      v27 = +[NSNumber numberWithFloat:v26];
      uint64_t v39 = sub_1000E823C();
      *(float *)&double v28 = v23;
      v38 = +[NSNumber numberWithFloat:v28];
      uint64_t v40 = 0;
      uint64_t v41 = &v40;
      uint64_t v42 = 0x2020000000;
      v29 = (id *)qword_1001EBC18;
      uint64_t v43 = qword_1001EBC18;
      if (!qword_1001EBC18)
      {
        v30 = (void *)sub_1000EA788();
        v41[3] = (uint64_t)dlsym(v30, "EAAccessoryAccessibilityWidthKey");
        qword_1001EBC18 = v41[3];
        v29 = (id *)v41[3];
      }
      v37 = (void *)v24;
      _Block_object_dispose(&v40, 8);
      if (!v29) {
        sub_100122E9C();
      }
      id v31 = *v29;
      *(float *)&double v32 = v16 / *((double *)&v17 + 1);
      v33 = +[NSNumber numberWithFloat:v32];
      uint64_t v40 = 0;
      uint64_t v41 = &v40;
      uint64_t v42 = 0x2020000000;
      v34 = (void *)qword_1001EBC20;
      uint64_t v43 = qword_1001EBC20;
      if (!qword_1001EBC20)
      {
        uint64_t v35 = (void *)sub_1000EA788();
        v41[3] = (uint64_t)dlsym(v35, "EAAccessoryAccessibilityHeightKey");
        qword_1001EBC20 = v41[3];
        v34 = (void *)v41[3];
      }
      _Block_object_dispose(&v40, 8);
      if (!v34) {
        sub_100122F14();
      }
      os_log_type_t v14 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v37, v25, v27, v39, v38, v31, v33, *v34, 0);

      break;
    case 5:
      uint64_t v13 = [(VOTExternalAccessoryManager *)self accessoryTraitsFromElement:v11];
LABEL_17:
      os_log_type_t v14 = (void *)v13;
      break;
    default:
      os_log_type_t v14 = 0;
      break;
  }

  return v14;
}

- (id)accessories
{
  v2 = [sub_1000E6610() sharedAccessoryManager];
  id v3 = [v2 connectedAccessories];

  return v3;
}

- (void)_updateCurrentVoiceOverItem
{
  id v3 = (void *)qword_1001EBB48;
  qword_1001EBB48 = 0;
  id v4 = v3;

  [(VOTExternalAccessoryManager *)self updateCurrentItemProperties:v4];
}

- (void)updateCurrentItemProperties:(id)a3
{
  uint64_t v4 = qword_1001EBB58;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_1001EBB58, &stru_1001B6910);
  }
  id v6 = [v5 copyWithCache];

  unsigned __int8 v7 = [(VOTExternalAccessoryManager *)self eaQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E9918;
  v9[3] = &unk_1001B3448;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (void)updateVolume:(double)a3
{
  id v5 = [(VOTExternalAccessoryManager *)self eaQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E9BE8;
  v6[3] = &unk_1001B35D0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)updateSpeakingRate
{
  id v3 = [(VOTExternalAccessoryManager *)self eaQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E9DA0;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)accessibilityAccessory:(id)a3 setValue:(id)a4 forSystemProperty:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = +[AXSubsystemVoiceOverIAP sharedInstance];
  unsigned __int8 v10 = [v9 ignoreLogging];

  if ((v10 & 1) == 0)
  {
    id v11 = +[AXSubsystemVoiceOverIAP identifier];
    os_log_type_t v12 = AXLoggerForFacility();

    os_log_type_t v13 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v12, v13))
    {
      os_log_type_t v14 = AXColorizeFormatLog();
      id v42 = v8;
      uint64_t v43 = v5;
      double v15 = _AXStringForArgs();
      if (os_log_type_enabled(v12, v13))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "%{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  switch(v5)
  {
    case 1:
      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x2020000000;
      uint64_t v25 = (void *)qword_1001EBC38;
      uint64_t v51 = qword_1001EBC38;
      if (!qword_1001EBC38)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v54 = sub_1000EB0C4;
        v55 = &unk_1001B3FE0;
        v56 = &v48;
        double v26 = (void *)sub_1000EA788();
        v27 = dlsym(v26, "EAAccessoryAccessibilitySystemPropertyVoiceOverEnabledKey");
        *(void *)(v56[1] + 24) = v27;
        qword_1001EBC38 = *(void *)(v56[1] + 24);
        uint64_t v25 = (void *)v49[3];
      }
      _Block_object_dispose(&v48, 8);
      if (!v25) {
        sub_10012307C();
      }
      double v28 = [v8 objectForKey:*v25];
      unsigned __int8 v29 = [v28 BOOLValue];

      if ((v29 & 1) == 0)
      {
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        v30 = [sub_1000E6610() sharedAccessoryManager];
        id v31 = [v30 connectedAccessories];

        id v32 = [v31 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v32)
        {
          uint64_t v33 = *(void *)v45;
          while (2)
          {
            for (i = 0; i != v32; i = (char *)i + 1)
            {
              if (*(void *)v45 != v33) {
                objc_enumerationMutation(v31);
              }
              if (objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * i), "supportsAccessibility", v42, v43, (void)v44))
              {
                [v7 setDelegate:0];
                goto LABEL_32;
              }
            }
            id v32 = [v31 countByEnumeratingWithState:&v44 objects:v52 count:16];
            if (v32) {
              continue;
            }
            break;
          }
        }
LABEL_32:

        uint64_t v35 = +[AXSubsystemVoiceOverIAP sharedInstance];
        unsigned __int8 v36 = [v35 ignoreLogging];

        if ((v36 & 1) == 0)
        {
          v37 = +[AXSubsystemVoiceOverIAP identifier];
          v38 = AXLoggerForFacility();

          os_log_type_t v39 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v38, v39))
          {
            uint64_t v40 = AXColorizeFormatLog();
            uint64_t v41 = _AXStringForArgs();
            if (os_log_type_enabled(v38, v39))
            {
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v41;
              _os_log_impl((void *)&_mh_execute_header, v38, v39, "%{public}@", (uint8_t *)&buf, 0xCu);
            }
          }
        }
        _AXSVoiceOverTouchSetEnabledThroughAccessory();
        _AXSVoiceOverTouchSetEnabled();
      }
      break;
    case 3:
      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x2020000000;
      double v21 = (void *)qword_1001EBC30;
      uint64_t v51 = qword_1001EBC30;
      if (!qword_1001EBC30)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v54 = sub_1000EB074;
        v55 = &unk_1001B3FE0;
        v56 = &v48;
        double v22 = (void *)sub_1000EA788();
        double v23 = dlsym(v22, "EAAccessoryAccessibilitySystemPropertySpeakingRateKey");
        *(void *)(v56[1] + 24) = v23;
        qword_1001EBC30 = *(void *)(v56[1] + 24);
        double v21 = (void *)v49[3];
      }
      _Block_object_dispose(&v48, 8);
      if (!v21) {
        sub_100123004();
      }
      uint64_t v24 = [v8 objectForKey:*v21];
      [v24 floatValue];

      _AXSVoiceOverTouchSetSpeakingRate();
      break;
    case 2:
      double v16 = +[VOTOutputManager outputManager];
      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x2020000000;
      long long v17 = (void *)qword_1001EBC28;
      uint64_t v51 = qword_1001EBC28;
      if (!qword_1001EBC28)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v54 = sub_1000EB024;
        v55 = &unk_1001B3FE0;
        v56 = &v48;
        double v18 = (void *)sub_1000EA788();
        double v19 = dlsym(v18, "EAAccessoryAccessibilitySystemPropertyVoiceOverVolumeKey");
        *(void *)(v56[1] + 24) = v19;
        qword_1001EBC28 = *(void *)(v56[1] + 24);
        long long v17 = (void *)v49[3];
      }
      _Block_object_dispose(&v48, 8);
      if (!v17) {
        sub_100122F8C();
      }
      double v20 = [v8 objectForKey:*v17];
      [v20 floatValue];
      objc_msgSend(v16, "setSystemVolume:");

      break;
  }
}

- (id)accessibilityAccessory:(id)a3 currentValueForSystemProperty:(int)a4
{
  uint64_t v5 = +[AXSubsystemVoiceOverIAP sharedInstance];
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    id v7 = +[AXSubsystemVoiceOverIAP identifier];
    id v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      unsigned __int8 v10 = AXColorizeFormatLog();
      id v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)long long buf = 138543362;
        double v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  switch(a4)
  {
    case 1:
      uint64_t v14 = +[NSNumber numberWithBool:1];
LABEL_13:
      os_log_type_t v13 = (void *)v14;
      break;
    case 3:
      [(id)VOTSharedWorkspace speechRateFromSettings];
      *(float *)&double v15 = v15;
      uint64_t v14 = +[NSNumber numberWithFloat:v15];
      goto LABEL_13;
    case 2:
      os_log_type_t v12 = +[VOTOutputManager outputManager];
      [v12 systemVolume];
      os_log_type_t v13 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

      break;
    default:
      os_log_type_t v13 = 0;
      break;
  }

  return v13;
}

- (OS_dispatch_queue)eaQueue
{
  return self->_eaQueue;
}

- (void)setEaQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eaQueue, 0);

  objc_storeStrong((id *)&self->_elementManager, 0);
}

@end