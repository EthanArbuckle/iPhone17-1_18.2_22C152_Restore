@interface GAXEventProcessor
- (BOOL)_allowingAllTouchByOverride:(id *)a3;
- (BOOL)_eventLooksLikeVolumeButtonPress:(id)a3;
- (BOOL)_handleGAXActiveSystemEvent:(id)a3 gaxState:(id *)a4;
- (BOOL)_handleGAXWorkspaceSystemEvent:(id)a3 gaxState:(id *)a4;
- (BOOL)_handleSystemEvent:(id)a3;
- (BOOL)_ignoringAllTouchByOverride:(id *)a3;
- (BOOL)_prevalidateEvent:(id)a3;
- (BOOL)_shouldSwallowTouchEvent:(id)a3 gaxState:(id *)a4;
- (BOOL)_touchEvent:(id)a3 isForWindowWithContextID:(unsigned int)a4 gaxState:(id *)a5;
- (BOOL)_touchEventIsForAccessibilityFeatures:(id)a3 gaxState:(id *)a4;
- (BOOL)_touchEventIsForAssistiveTouch:(id)a3 gaxState:(id *)a4;
- (BOOL)_touchEventIsForTripleClickSheet:(id)a3 gaxState:(id *)a4;
- (BOOL)_touchEventIsForVoiceOverItemChooser:(id)a3 gaxState:(id *)a4;
- (GAXEventProcessor)init;
- (GAXEventProcessorDelegate)delegate;
- (void)_postLockButtonPressWithDown:(id)a3 up:(id)a4;
- (void)_updateLocalEventStateWithEvent:(id)a3;
- (void)beginBlockingHID;
- (void)endBlockingHID;
- (void)setDelegate:(id)a3;
- (void)setForceDisableLockButton:(BOOL)a3;
@end

@implementation GAXEventProcessor

- (GAXEventProcessor)init
{
  v16.receiver = self;
  v16.super_class = (Class)GAXEventProcessor;
  v2 = [(GAXEventProcessor *)&v16 initWithHIDTapIdentifier:AXEventHIDTapIdentifierGuidedAccess HIDEventTapPriority:50 systemEventTapIdentifier:AXEventTapIdentifierGuidedAccess systemEventTapPriority:50];
  v3 = v2;
  if (v2)
  {
    [(GAXEventProcessor *)v2 setShouldNotifyUserEventOccurred:1];
    objc_initWeak(&location, v3);
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_10724;
    v13 = &unk_49388;
    objc_copyWeak(&v14, &location);
    [(GAXEventProcessor *)v3 setSystemEventHandler:&v10];
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.GuidedAccess.sideButtonAction", 0);
    sideButtonActionQueue = v3->_sideButtonActionQueue;
    v3->_sideButtonActionQueue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc((Class)AXDispatchTimer);
    v7 = (AXDispatchTimer *)objc_msgSend(v6, "initWithTargetSerialQueue:", v3->_sideButtonActionQueue, v10, v11, v12, v13);
    sideButtonActionTimer = v3->_sideButtonActionTimer;
    v3->_sideButtonActionTimer = v7;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)setForceDisableLockButton:(BOOL)a3
{
  self->_forceDisableLockButton = a3;
}

- (void)beginBlockingHID
{
}

- (void)endBlockingHID
{
}

- (BOOL)_handleSystemEvent:(id)a3
{
  id v4 = a3;
  [(GAXEventProcessor *)self _updateLocalEventStateWithEvent:v4];
  if ([(GAXEventProcessor *)self _prevalidateEvent:v4])
  {
    memset(v11, 0, 28);
    v5 = [(GAXEventProcessor *)self delegate];
    id v6 = v5;
    if (v5) {
      [v5 gaxStateWithGAXEventProcessor:self];
    }
    else {
      memset(v11, 0, 28);
    }

    if (LODWORD(v11[0]) == 2)
    {
      *(_OWORD *)v10 = v11[0];
      *(_OWORD *)&v10[12] = *(_OWORD *)((char *)v11 + 12);
      BOOL v8 = [(GAXEventProcessor *)self _handleGAXActiveSystemEvent:v4 gaxState:v10];
    }
    else
    {
      if (LODWORD(v11[0]) != 1)
      {
        BOOL v7 = 0;
        goto LABEL_9;
      }
      *(_OWORD *)v10 = v11[0];
      *(_OWORD *)&v10[12] = *(_OWORD *)((char *)v11 + 12);
      BOOL v8 = [(GAXEventProcessor *)self _handleGAXWorkspaceSystemEvent:v4 gaxState:v10];
    }
    BOOL v7 = v8;
  }
  else
  {
    BOOL v7 = 1;
  }
LABEL_9:
  +[NSNumber numberWithBool:v7];

  return v7;
}

- (BOOL)_handleGAXWorkspaceSystemEvent:(id)a3 gaxState:(id *)a4
{
  unsigned int v5 = [a3 type];
  if ((AXEventTypeIsOrientationChange() & 1) == 0)
  {
    if (v5 == 1010) {
      return 1;
    }
    if (v5 == 1011)
    {
      id v6 = [(GAXEventProcessor *)self delegate];
      [v6 eventProcessor:self transitionToMode:0];

      return 1;
    }
  }
  return 0;
}

- (BOOL)_eventLooksLikeVolumeButtonPress:(id)a3
{
  id v3 = a3;
  [v3 type];
  if (AXEventTypeIsVolumeButtonPress())
  {
    char v4 = 1;
  }
  else
  {
    unsigned int v5 = [v3 keyInfo];
    unsigned int v6 = [v5 usagePage];

    if (v6 == 7)
    {
      BOOL v7 = [v3 keyInfo];
      if ([v7 keyCode] == 68)
      {
        char v4 = 1;
      }
      else
      {
        BOOL v8 = [v3 keyInfo];
        char v4 = [v8 keyCode] == 69;
      }
    }
    else
    {
      char v4 = 0;
    }
  }

  return v4;
}

- (void)_postLockButtonPressWithDown:(id)a3 up:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = +[AXEventTapManager sharedManager];
  [v7 sendEvent:v6 afterTap:AXEventTapIdentifierGuidedAccess useGSEvent:0 namedTaps:0 options:0];

  dispatch_time_t v8 = dispatch_time(0, 50000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10CD0;
  block[3] = &unk_48928;
  id v11 = v5;
  id v9 = v5;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)_handleGAXActiveSystemEvent:(id)a3 gaxState:(id *)a4
{
  id v7 = a3;
  unsigned int v8 = [v7 type];
  if (AXEventTypeIsLockButtonPress())
  {
    id v9 = GAXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int var0 = a4->var0;
      int v11 = (*((_DWORD *)a4 + 6) >> 12) & 1;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = var0;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v11;
      v12 = "Lock button press. Mode: %i, allows exit: %i";
LABEL_7:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, v12, buf, 0xEu);
    }
  }
  else
  {
    if (!AXEventTypeIsHomeButtonPress()) {
      goto LABEL_9;
    }
    id v9 = GAXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = a4->var0;
      int v14 = (*((_DWORD *)a4 + 6) >> 12) & 1;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v13;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v14;
      v12 = "Home button press. Mode: %i, allows exit: %i";
      goto LABEL_7;
    }
  }

LABEL_9:
  if (a4->var0 != 2) {
    goto LABEL_25;
  }
  if ((*((unsigned char *)a4 + 24) & 8) != 0)
  {
    if (!AXEventTypeIsTouch()
      || (AX_EventRepresentationContainsOnlyPathsForContextID() & 1) == 0
      && (*(_OWORD *)buf = *(_OWORD *)&a4->var0,
          *(_OWORD *)&buf[12] = *(_OWORD *)&a4->var3,
          ![(GAXEventProcessor *)self _touchEventIsForAccessibilityFeatures:v7 gaxState:buf]))
    {
      unsigned __int8 v17 = v8 != 3200;
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (AXEventTypeIsLockButtonPress())
  {
    if (AXDeviceHasHomeButton())
    {
      if ((*((_DWORD *)a4 + 6) & 0x800) == 0 || self->_forceDisableLockButton)
      {
        v15 = [(GAXEventProcessor *)self delegate];
        [v15 unlockDeviceWithEventProcessor:self];

        if ((*((unsigned char *)a4 + 25) & 0x10) != 0)
        {
          objc_super v16 = [(GAXEventProcessor *)self delegate];
          unsigned __int8 v17 = 1;
          [v16 eventProcessor:self showAlertWithType:1];

          goto LABEL_26;
        }
        goto LABEL_50;
      }
    }
    else if ((*((_DWORD *)a4 + 6) & 0x1800) != 0x800)
    {
      if (v8 != 1011)
      {
        objc_storeStrong((id *)&self->_savedSideDown, a3);
        [(AXDispatchTimer *)self->_sideButtonActionTimer cancel];
        goto LABEL_50;
      }
      +[NSDate timeIntervalSinceReferenceDate];
      if ((*((unsigned char *)a4 + 25) & 0x10) != 0)
      {
        double v21 = v20;
        double v22 = v20 - self->_lastD2XSideButtonUpTime;
        _AXSHomeClickSpeed();
        if (v22 < v23 || self->_lastD2XSideButtonUpTime == 0.0)
        {
          unint64_t sideButtonPresses = self->_sideButtonPresses;
          self->_unint64_t sideButtonPresses = sideButtonPresses + 1;
          self->_lastD2XSideButtonUpTime = v21;
          if (sideButtonPresses == 1)
          {
            v26 = +[AXSettings sharedInstance];
            unsigned int v27 = [v26 guidedAccessAllowsUnlockWithTouchID];

            if (v27)
            {
              sideButtonActionTimer = self->_sideButtonActionTimer;
              _AXSHomeClickSpeed();
              v36[0] = _NSConcreteStackBlock;
              v36[1] = 3221225472;
              v36[2] = sub_11234;
              v36[3] = &unk_48928;
              v36[4] = self;
              [(AXDispatchTimer *)sideButtonActionTimer afterDelay:v36 processBlock:v29];
              goto LABEL_50;
            }
          }
          else if (sideButtonPresses == 2)
          {
            v25 = [(GAXEventProcessor *)self delegate];
            [v25 unlockDeviceWithEventProcessor:self];

            _AXSHandleTripleClickHomeButtonPress();
            self->_unint64_t sideButtonPresses = 0;
            self->_lastD2XSideButtonUpTime = 0.0;
            goto LABEL_50;
          }
        }
        else
        {
          self->_unint64_t sideButtonPresses = 0;
          self->_lastD2XSideButtonUpTime = v21;
        }
        v30 = self->_sideButtonActionTimer;
        _AXSHomeClickSpeed();
        double v32 = v31;
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_112C4;
        v33[3] = &unk_493F0;
        v33[4] = self;
        v35[0] = *(_OWORD *)&a4->var0;
        *(_OWORD *)((char *)v35 + 12) = *(_OWORD *)&a4->var3;
        id v34 = v7;
        [(AXDispatchTimer *)v30 afterDelay:v33 processBlock:v32];
      }
LABEL_50:
      unsigned __int8 v17 = 1;
      goto LABEL_26;
    }
LABEL_25:
    unsigned __int8 v17 = 0;
    goto LABEL_26;
  }
  if (AXEventTypeIsHomeButtonPress()) {
    goto LABEL_25;
  }
  if ([(GAXEventProcessor *)self _eventLooksLikeVolumeButtonPress:v7])
  {
    BOOL v18 = (*((unsigned char *)a4 + 25) & 0x40) == 0;
  }
  else if ((AXEventTypeIsMotion() & 1) != 0 {
         || (AXEventTypeIsShake() & 1) != 0
  }
         || AXEventTypeIsOrientationChange())
  {
    BOOL v18 = (*((unsigned char *)a4 + 26) & 1) == 0;
  }
  else
  {
    if (!AXEventTypeIsRingerSwitchStateChange())
    {
      if (AXEventTypeIsTouch())
      {
        *(_OWORD *)buf = *(_OWORD *)&a4->var0;
        *(_OWORD *)&buf[12] = *(_OWORD *)&a4->var3;
        unsigned __int8 v17 = [(GAXEventProcessor *)self _shouldSwallowTouchEvent:v7 gaxState:buf];
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    BOOL v18 = (*((unsigned char *)a4 + 25) & 0x80) == 0;
  }
  unsigned __int8 v17 = v18;
LABEL_26:

  return v17;
}

- (BOOL)_touchEventIsForAccessibilityFeatures:(id)a3 gaxState:(id *)a4
{
  id v6 = a3;
  *(_OWORD *)id v9 = *(_OWORD *)&a4->var0;
  *(_OWORD *)&v9[12] = *(_OWORD *)&a4->var3;
  if ([(GAXEventProcessor *)self _touchEventIsForAssistiveTouch:v6 gaxState:v9]|| (*(_OWORD *)id v9 = *(_OWORD *)&a4->var0, *(_OWORD *)&v9[12] = *(_OWORD *)&a4->var3, [(GAXEventProcessor *)self _touchEventIsForTripleClickSheet:v6 gaxState:v9]))
  {
    BOOL v7 = 1;
  }
  else
  {
    *(_OWORD *)id v9 = *(_OWORD *)&a4->var0;
    *(_OWORD *)&v9[12] = *(_OWORD *)&a4->var3;
    BOOL v7 = [(GAXEventProcessor *)self _touchEventIsForVoiceOverItemChooser:v6 gaxState:v9];
  }

  return v7;
}

- (BOOL)_touchEventIsForAssistiveTouch:(id)a3 gaxState:(id *)a4
{
  id v6 = a3;
  if (_AXSAssistiveTouchEnabled())
  {
    BOOL v7 = [v6 handInfo];
    unsigned int v8 = [v7 paths];
    id v9 = (char *)[v8 count];

    if (v9 == (unsigned char *)&dword_0 + 1)
    {
      mach_port_t sp = a4->var4;
      if (!sp)
      {
        bootstrap_look_up(bootstrap_port, "com.apple.assistivetouchd", &sp);
        v10 = [(GAXEventProcessor *)self delegate];
        [v10 eventProcessor:self updateAssistiveTouchBootstrapPort:sp];
      }
      int v11 = +[CAWindowServer serverIfRunning];
      v12 = [v11 displays];
      unsigned int v13 = [v12 firstObject];

      int v14 = [v7 paths];
      v15 = [v14 objectAtIndexedSubscript:0];

      objc_super v16 = +[CAWindowServer serverIfRunning];
      unsigned __int8 v17 = [v16 displays];
      BOOL v18 = [v17 firstObject];
      [v15 pathLocation];
      id v19 = objc_msgSend(v18, "contextIdAtPosition:");

      id v20 = [v15 pathWindowContextID];
      LODWORD(v17) = sp;
      if (v17 == [v13 clientPortOfContextId:v19])
      {
        char v21 = 1;
      }
      else
      {
        mach_port_t v22 = sp;
        char v21 = v22 == [v13 clientPortOfContextId:v20];
      }
    }
    else
    {
      char v21 = 0;
    }
  }
  else
  {
    char v21 = 0;
  }

  return v21;
}

- (BOOL)_touchEventIsForTripleClickSheet:(id)a3 gaxState:(id *)a4
{
  id v6 = a3;
  __int16 v14 = 0;
  BOOL v7 = [(GAXEventProcessor *)self delegate];
  [v7 eventProcessor:self shouldAllowTripleClickSheet:(char *)&v14 + 1 tripleClickAlertIsVisible:&v14];

  BOOL v8 = 0;
  if (HIBYTE(v14)) {
    BOOL v9 = v14 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    uint64_t var3 = a4->var3;
    if (!var3)
    {
      int v11 = GAXLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_2A7D4(v11);
      }
    }
    *(_OWORD *)unsigned int v13 = *(_OWORD *)&a4->var0;
    *(_OWORD *)&v13[12] = *(_OWORD *)&a4->var3;
    BOOL v8 = [(GAXEventProcessor *)self _touchEvent:v6 isForWindowWithContextID:var3 gaxState:v13];
  }

  return v8;
}

- (BOOL)_touchEventIsForVoiceOverItemChooser:(id)a3 gaxState:(id *)a4
{
  uint64_t var2 = a4->var2;
  if (!var2) {
    return 0;
  }
  v7[0] = *(_OWORD *)&a4->var0;
  *(_OWORD *)((char *)v7 + 12) = *(_OWORD *)&a4->var3;
  return [(GAXEventProcessor *)self _touchEvent:a3 isForWindowWithContextID:var2 gaxState:v7];
}

- (BOOL)_touchEvent:(id)a3 isForWindowWithContextID:(unsigned int)a4 gaxState:(id *)a5
{
  if (a4)
  {
    id v6 = [a3 handInfo];
    BOOL v7 = [v6 paths];
    BOOL v8 = (char *)[v7 count];

    if (v8 == (unsigned char *)&dword_0 + 1)
    {
      BOOL v9 = [v6 paths];
      v10 = [v9 objectAtIndexedSubscript:0];

      int v11 = +[CAWindowServer serverIfRunning];
      v12 = [v11 displays];
      unsigned int v13 = [v12 firstObject];
      [v10 pathLocation];
      unsigned int v14 = objc_msgSend(v13, "contextIdAtPosition:");

      BOOL v15 = v14 == a4;
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    objc_super v16 = GAXLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_2A818(v16);
    }

    return 0;
  }
  return v15;
}

- (BOOL)_ignoringAllTouchByOverride:(id *)a3
{
  return (*((unsigned char *)a3 + 25) & 3) != 0;
}

- (BOOL)_allowingAllTouchByOverride:(id *)a3
{
  return (*((unsigned char *)a3 + 24) & 0xE0) != 0;
}

- (BOOL)_shouldSwallowTouchEvent:(id)a3 gaxState:(id *)a4
{
  id v6 = a3;
  *(_OWORD *)objc_super v16 = *(_OWORD *)&a4->var0;
  *(_OWORD *)&v16[12] = *(_OWORD *)&a4->var3;
  if ([(GAXEventProcessor *)self _touchEventIsForAccessibilityFeatures:v6 gaxState:v16]|| (*(_OWORD *)objc_super v16 = *(_OWORD *)&a4->var0, *(_OWORD *)&v16[12] = *(_OWORD *)&a4->var3, [(GAXEventProcessor *)self _allowingAllTouchByOverride:v16]))
  {
    char v7 = 0;
  }
  else
  {
    *(_OWORD *)objc_super v16 = *(_OWORD *)&a4->var0;
    *(_OWORD *)&v16[12] = *(_OWORD *)&a4->var3;
    if ([(GAXEventProcessor *)self _ignoringAllTouchByOverride:v16])
    {
      char v7 = 1;
    }
    else
    {
      BOOL v9 = [(GAXEventProcessor *)self delegate];
      CFArrayRef v10 = [v9 ignoredTouchRegionsForEventProcessor:self];

      if (v10 && (CFIndex Count = CFArrayGetCount(v10)) != 0)
      {
        CFIndex v12 = Count;
        if (Count < 1)
        {
LABEL_16:
          char v7 = 0;
        }
        else
        {
          uint64_t v13 = 1;
          while (1)
          {
            CFArrayGetValueAtIndex(v10, v13 - 1);
            if (AX_EventRepresentationContainsAnyTouchesInPath()) {
              break;
            }
            self->_sentCancelEventForSnarfedTouch = 0;
            if (v13++ >= v12) {
              goto LABEL_16;
            }
          }
          char v7 = 1;
          if (!self->_sentCancelEventForSnarfedTouch)
          {
            BKSHIDServicesCancelTouchesOnMainDisplay();
            self->_sentCancelEventForSnarfedTouch = 1;
          }
        }
      }
      else
      {
        char v7 = (*((unsigned char *)a4 + 25) & 4) == 0;
      }
    }
  }

  return v7;
}

- (void)_updateLocalEventStateWithEvent:(id)a3
{
  int v4 = [a3 type];
  if (v4 > 1009)
  {
    if (v4 == 1010)
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      if (v4 != 1011) {
        return;
      }
      unsigned __int8 v5 = 0;
    }
    id v6 = &OBJC_IVAR___GAXEventProcessor__lockButtonIsDown;
  }
  else
  {
    if (v4 == 1000)
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      if (v4 != 1001) {
        return;
      }
      unsigned __int8 v5 = 0;
    }
    id v6 = &OBJC_IVAR___GAXEventProcessor__homeButtonIsDown;
  }
  self->AXEventProcessor_opaque[*v6] = v5;
}

- (BOOL)_prevalidateEvent:(id)a3
{
  id v4 = a3;
  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  unsigned int v7 = [v4 type];

  if (v7 == 1011) {
    return !self->_blockedLastLockButtonDownEvent;
  }
  if (v7 == 1010 && AXDeviceHasHomeButton())
  {
    if (self->_homeButtonIsDown || vabdd_f64(v6, self->_lastPrevalidatedLockButtonUpTime) < 1.0)
    {
      BOOL result = 0;
      self->_blockedLastLockButtonDownEvent = 1;
      return result;
    }
    self->_blockedLastLockButtonDownEvent = 0;
    +[NSDate timeIntervalSinceReferenceDate];
    self->_lastPrevalidatedLockButtonUpTime = v9;
  }
  return 1;
}

- (GAXEventProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GAXEventProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_savedSideDown, 0);
  objc_storeStrong((id *)&self->_sideButtonActionQueue, 0);

  objc_storeStrong((id *)&self->_sideButtonActionTimer, 0);
}

@end