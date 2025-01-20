@interface VOTKeyboardManager
+ (id)keyboardManager;
+ (void)initialize;
- (AXEventRepresentation)lastDispatchedKeyEvent;
- (BOOL)_dispatchCommandForKeyInfo:(id)a3 isRepeatedEvent:(BOOL)a4;
- (BOOL)_handleArrowKeyEvent:(id)a3;
- (BOOL)_handleBrailleKeyEvent:(id)a3;
- (BOOL)_handleTerminalKeyEvent:(id)a3;
- (BOOL)_keyEventShouldGoToFocusedContext:(id)a3;
- (BOOL)_keyInfoIsModifierOnly:(id)a3;
- (BOOL)captureModeEnabled;
- (BOOL)controlKeyToggleSpeakingAllowed;
- (BOOL)explictlyEnabledQuickNav;
- (BOOL)isQuickNavOn;
- (BOOL)modifierKeyLockEnabled;
- (VOTKeyInfo)lastReleasedToSystemKeyEvent;
- (VOTKeyboardManager)init;
- (double)lastDispatchedKeyEventTime;
- (double)lastReleasedToSystemKeyEventTime;
- (double)lastVolumeDownButtonDownTime;
- (double)lastVolumeDownButtonUpTime;
- (double)lastVolumeUpButtonDownTime;
- (double)lastVolumeUpButtonUpTime;
- (double)quickNavDownDurationAllowedAcceptance;
- (id)_characterStringRepresentationForKey:(id)a3;
- (id)_localizeKeyboardString:(id)a3;
- (id)keyDownInfo;
- (id)keyboardEventForKeyInfo:(id)a3;
- (id)singleLetterCommandForKeyInfo:(id)a3;
- (id)testingEventDispatchTap;
- (id)testingProcessEventCallback;
- (id)threadSafe_keyDownInfo;
- (void)_axEndPassthroughTouch;
- (void)_axStartPassthroughTouch;
- (void)_dispatchEventRepresentationIntoSystem:(id)a3;
- (void)_dispatchKeyEventIntoSystem:(id)a3;
- (void)_handleAnnouncementsForKeyInfo:(id)a3;
- (void)_handleCapsLockToggle:(id)a3;
- (void)_handleKeyboardKeyEvent:(id)a3;
- (void)_handleKeyboardKeyEvent:(id)a3 isRepeatedEvent:(BOOL)a4;
- (void)_handleModifierCapsLockBehavior:(id)a3;
- (void)_handleNonPerkinsKeyboardKeyEvent:(id)a3 isRepeatedEvent:(BOOL)a4;
- (void)_handleQuickNavDownArrowRepostPress:(id)a3;
- (void)_handleQuickNavPress:(id)a3;
- (void)_handleQuickNavPressTimer:(id)a3;
- (void)_initializeQuickNav;
- (void)_initializeThread;
- (void)_keyRepeat:(id)a3;
- (void)_postEvent:(id)a3;
- (void)_postKeyboardKey:(id)a3 keyCode:(unsigned __int16)a4 eventFlags:(unsigned int)a5 keyFlags:(unsigned __int16)a6 keyDown:(BOOL)a7 source:(unsigned __int16)a8;
- (void)_processVolumeButtonsForCurtainReset:(id)a3;
- (void)_resetSoundAndScreenCurtain;
- (void)_sendEvent:(id)a3 withKeyInfo:(id)a4 arrowMask:(int64_t)a5;
- (void)_sendEventForCommand:(id)a3 withKeyInfo:(id)a4 arrowMask:(int64_t)a5;
- (void)_speakCapsLockKey;
- (void)_updateConsecutiveKeyCount:(id)a3;
- (void)_updateEventFlags:(id)a3;
- (void)_verifyCorrectThread;
- (void)clearConsecutiveKeyPressCount;
- (void)dealloc;
- (void)handleKeyboardKeyEvent:(id)a3 eventOrigin:(int64_t)a4;
- (void)loadKeyboardMap;
- (void)postEvent:(id)a3;
- (void)setCaptureModeEnabled:(BOOL)a3;
- (void)setCommandManager:(id)a3;
- (void)setControlKeyToggleSpeakingAllowed:(BOOL)a3;
- (void)setExplictlyEnabledQuickNav:(BOOL)a3;
- (void)setKeyDownInfo:(id)a3;
- (void)setLastDispatchedKeyEvent:(id)a3;
- (void)setLastDispatchedKeyEventTime:(double)a3;
- (void)setLastReleasedToSystemKeyEvent:(id)a3;
- (void)setLastReleasedToSystemKeyEventTime:(double)a3;
- (void)setLastVolumeDownButtonDownTime:(double)a3;
- (void)setLastVolumeDownButtonUpTime:(double)a3;
- (void)setLastVolumeUpButtonDownTime:(double)a3;
- (void)setLastVolumeUpButtonUpTime:(double)a3;
- (void)setQuickNavDownDurationAllowedAcceptance:(double)a3;
- (void)setTestingEventDispatchTap:(id)a3;
- (void)setTestingProcessEventCallback:(id)a3;
- (void)toggleVoiceOverModifierKeyLock;
- (void)updateQuickNavState:(BOOL)a3;
@end

@implementation VOTKeyboardManager

+ (void)initialize
{
  if (!qword_1001EBAF0)
  {
    id v2 = [objc_allocWithZone((Class)VOTKeyboardManager) init];
    uint64_t v3 = qword_1001EBAF0;
    qword_1001EBAF0 = (uint64_t)v2;
    _objc_release_x1(v2, v3);
  }
}

+ (id)keyboardManager
{
  return (id)qword_1001EBAF0;
}

- (void)setCommandManager:(id)a3
{
}

- (void)dealloc
{
  [(SCRCTargetSelectorTimer *)self->_keyRepeatTimer invalidate];
  [(SCRCTargetSelectorTimer *)self->_quickNavRepostTimer invalidate];
  [(SCRCTargetSelectorTimer *)self->_quickNavKeyTimer invalidate];
  [(SCRCThread *)self->_keyboardThread setIsInvalid:1];
  v3.receiver = self;
  v3.super_class = (Class)VOTKeyboardManager;
  [(VOTKeyboardManager *)&v3 dealloc];
}

- (VOTKeyboardManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)VOTKeyboardManager;
  id v2 = [(VOTKeyboardManager *)&v18 init];
  if (v2)
  {
    objc_storeStrong((id *)&qword_1001EBAF0, v2);
    id v3 = objc_alloc((Class)NSDictionary);
    v4 = +[NSBundle mainBundle];
    v5 = [v4 pathForResource:@"VOTSingleLetterCommands" ofType:@"plist"];
    v6 = (NSDictionary *)[v3 initWithContentsOfFile:v5];
    singleLetterCommandsTable = v2->_singleLetterCommandsTable;
    v2->_singleLetterCommandsTable = v6;

    [(VOTKeyboardManager *)v2 loadKeyboardMap];
    [(VOTKeyboardManager *)v2 _initializeQuickNav];
    v8 = (NSLock *)objc_alloc_init((Class)NSLock);
    keyDownLock = v2->_keyDownLock;
    v2->_keyDownLock = v8;

    v10 = (SCRCThread *)objc_alloc_init((Class)SCRCThread);
    keyboardThread = v2->_keyboardThread;
    v2->_keyboardThread = v10;

    [(SCRCThread *)v2->_keyboardThread performSelector:"_initializeThread" onTarget:v2 count:0 objects:0];
    v12 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_keyRepeat:" thread:v2->_keyboardThread];
    keyRepeatTimer = v2->_keyRepeatTimer;
    v2->_keyRepeatTimer = v12;

    [(VOTKeyboardManager *)v2 setControlKeyToggleSpeakingAllowed:1];
    v2->_quickNavDownStateTime[0] = 0.0;
    v2->_quickNavDownStateTime[1] = 0.0;
    v14 = +[VOTConfiguration rootConfiguration];
    v15 = [v14 preferenceForKey:@"VOTModifierKeyLockKey"];
    v2->_modifierKeyLockEnabled = [v15 BOOLValue];

    v16 = v2;
  }

  return v2;
}

- (void)_verifyCorrectThread
{
  if (([(id)VOTSharedWorkspace inUnitTestMode] & 1) == 0
    && ([(SCRCThread *)self->_keyboardThread _debug_currentlyRunningOnThisThread] & 1) == 0)
  {
    id v4 = +[NSThread currentThread];
    id v3 = [v4 name];
    _AXAssert();
  }
}

- (void)toggleVoiceOverModifierKeyLock
{
  self->_modifierKeyLockEnabled ^= 1u;
}

- (BOOL)modifierKeyLockEnabled
{
  return self->_modifierKeyLockEnabled;
}

- (void)_initializeThread
{
  AXSetThreadPriority();
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = +[NSThread currentThread];
  [v4 setName:v6];

  BOOL v5 = BKSHIDServicesIsCapsLockLightOn() != 0;
  self->_fakeCapsLockOn = v5;
  self->_realCapsLockOn = v5;
}

- (void)handleKeyboardKeyEvent:(id)a3 eventOrigin:(int64_t)a4
{
  id v7 = a3;
  if (!self->_lastLayout) {
    [(VOTKeyboardManager *)self loadKeyboardMap];
  }
  id v6 = [objc_allocWithZone((Class)VOTKeyInfo) initWithEventRepresentation:v7];
  [v6 setEventOrigin:a4];
  [(SCRCThread *)self->_keyboardThread performSelector:"_handleKeyboardKeyEvent:" onTarget:self count:1 objects:v6];
}

- (void)loadKeyboardMap
{
  id v3 = [(id)VOTSharedWorkspace applicationForCurrentElement];
  id v4 = [v3 currentHardwareKeyboardLayout];

  BOOL v5 = +[AXSubsystemVoiceOver sharedInstance];
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    id v7 = +[AXSubsystemVoiceOver identifier];
    v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = AXColorizeFormatLog();
      v32 = v4;
      v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (self->_lastLayout && (objc_msgSend(v4, "isEqualToString:") & 1) != 0)
  {
    v12 = v4;
  }
  else
  {
    if (objc_msgSend(v4, "isEqualToString:", @"Automatic", v32))
    {
      uint64_t v13 = [(id)VOTSharedWorkspace applicationForCurrentElement];
      v12 = [(id)v13 currentSoftwareKeyboardLayout];

      v14 = +[AXSubsystemVoiceOver sharedInstance];
      LOBYTE(v13) = [v14 ignoreLogging];

      if ((v13 & 1) == 0)
      {
        v15 = +[AXSubsystemVoiceOver identifier];
        v16 = AXLoggerForFacility();

        os_log_type_t v17 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v16, v17))
        {
          objc_super v18 = AXColorizeFormatLog();
          v33 = v12;
          v19 = _AXStringForArgs();
          if (os_log_type_enabled(v16, v17))
          {
            *(_DWORD *)buf = 138543362;
            v35 = v19;
            _os_log_impl((void *)&_mh_execute_header, v16, v17, "%{public}@", buf, 0xCu);
          }
        }
      }
    }
    else
    {
      v12 = v4;
    }
    layoutToKeyboardMap = self->_layoutToKeyboardMap;
    if (!layoutToKeyboardMap)
    {
      id v21 = objc_alloc((Class)NSDictionary);
      v22 = +[NSBundle mainBundle];
      v23 = [v22 pathForResource:@"VOTLayoutToKeyboardMap" ofType:@"plist"];
      v24 = (NSDictionary *)[v21 initWithContentsOfFile:v23];
      v25 = self->_layoutToKeyboardMap;
      self->_layoutToKeyboardMap = v24;

      layoutToKeyboardMap = self->_layoutToKeyboardMap;
    }
    v26 = -[NSDictionary objectForKey:](layoutToKeyboardMap, "objectForKey:", v12, v33);
    if ([v26 length])
    {
      id v27 = objc_alloc((Class)NSDictionary);
      v28 = +[NSBundle mainBundle];
      v29 = [v28 pathForResource:v26 ofType:@"plist" inDirectory:@"VOTKeyboardMaps"];
      v30 = (NSDictionary *)[v27 initWithContentsOfFile:v29];
      keyboardMap = self->_keyboardMap;
      self->_keyboardMap = v30;

      objc_storeStrong((id *)&self->_lastLayout, v12);
    }
  }
}

- (id)_characterStringRepresentationForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 originalCharacters];
  unsigned __int8 v6 = +[NSCharacterSet controlCharacterSet];
  id v7 = [v5 stringByTrimmingCharactersInSet:v6];
  v8 = [(VOTKeyboardManager *)self _localizeKeyboardString:v7];

  if ([v4 isShiftKeyPressed])
  {
    uint64_t v9 = [(__CFString *)v8 uppercaseString];

    v8 = (__CFString *)v9;
  }
  if (![(__CFString *)v8 length])
  {
    unsigned int v11 = [v4 keyCode];
    v12 = [v4 eventRecord];
    uint64_t v13 = [v12 keyInfo];
    unsigned int v14 = [v13 alternativeKeyCode];

    if (v14) {
      unsigned int v15 = v14;
    }
    else {
      unsigned int v15 = v11;
    }
    switch(v15)
    {
      case '(':

        v8 = @"return";
        break;
      case ':':

        v8 = @"f1";
        break;
      case ';':

        v8 = @"f2";
        break;
      case '<':

        v8 = @"f3";
        break;
      case '=':

        v8 = @"f4";
        break;
      case '>':

        v8 = @"f5";
        break;
      case '?':

        v8 = @"f6";
        break;
      case '@':

        v8 = @"f7";
        break;
      case 'A':

        v8 = @"f8";
        break;
      case 'B':

        v8 = @"f9";
        break;
      case 'C':

        v8 = @"f10";
        break;
      case 'D':

        v8 = @"f11";
        break;
      case 'E':

        v8 = @"f12";
        break;
      case 'J':

        v8 = @"home";
        break;
      case 'K':

        v8 = @"pageup";
        break;
      case 'M':

        v8 = @"end";
        break;
      case 'N':

        v8 = @"pagedown";
        break;
      case 'O':
        v16 = [(VOTKeyboardManager *)self keyDownInfo];
        unsigned int v17 = [v16 isFNKeyPressed];

        CFStringRef v18 = @"right";
        CFStringRef v19 = @"end";
        goto LABEL_32;
      case 'P':
        v20 = [(VOTKeyboardManager *)self keyDownInfo];
        unsigned int v17 = [v20 isFNKeyPressed];

        CFStringRef v18 = @"left";
        CFStringRef v19 = @"home";
        goto LABEL_32;
      case 'Q':
        id v21 = [(VOTKeyboardManager *)self keyDownInfo];
        unsigned int v17 = [v21 isFNKeyPressed];

        CFStringRef v18 = @"down";
        CFStringRef v19 = @"pagedown";
        goto LABEL_32;
      case 'R':
        v22 = [(VOTKeyboardManager *)self keyDownInfo];
        unsigned int v17 = [v22 isFNKeyPressed];

        CFStringRef v18 = @"up";
        CFStringRef v19 = @"pageup";
LABEL_32:
        if (v17) {
          v8 = (__CFString *)v19;
        }
        else {
          v8 = (__CFString *)v18;
        }
        break;
      case 'X':

        v8 = @"⌤";
        break;
      default:
        break;
    }
  }

  return v8;
}

- (id)keyboardEventForKeyInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VOTKeyboardManager *)self _characterStringRepresentationForKey:v4];
  id v25 = [v5 copy];
  if ([v4 isCommandKeyPressed])
  {
    uint64_t v6 = [v5 stringByAppendingString:@"_command"];

    BOOL v5 = (void *)v6;
  }
  if ([v4 isShiftKeyPressed]
    && (([v25 isEqualToString:@"home"] & 1) != 0
     || ([v25 isEqualToString:@"end"] & 1) != 0
     || ([v25 isEqualToString:@"pagedown"] & 1) != 0
     || ([v25 isEqualToString:@"pageup"] & 1) != 0
     || ([v25 isEqualToString:@"right"] & 1) != 0
     || ([v25 isEqualToString:@"left"] & 1) != 0
     || ([v25 isEqualToString:@"up"] & 1) != 0
     || ([v25 isEqualToString:@"down"] & 1) != 0
     || ([v25 isEqualToString:@"f3"] & 1) != 0
     || ([v25 isEqualToString:@"f4"] & 1) != 0
     || ([v25 isEqualToString:@"["] & 1) != 0
     || ([v25 isEqualToString:@"]"] & 1) != 0
     || [v25 isEqualToString:@"-"]))
  {
    uint64_t v7 = [v5 stringByAppendingString:@"_shift"];

    BOOL v5 = (void *)v7;
  }
  if ([v4 isFNKeyPressed]
    && ([v25 isEqualToString:@"home"] & 1) == 0
    && ([v25 isEqualToString:@"end"] & 1) == 0
    && ([v25 isEqualToString:@"pagedown"] & 1) == 0
    && ([v25 isEqualToString:@"pageup"] & 1) == 0
    && ([v25 isEqualToString:@"f11"] & 1) == 0)
  {
    uint64_t v8 = [v5 stringByAppendingString:@"_fn"];

    BOOL v5 = (void *)v8;
  }
  uint64_t v9 = +[AXSSKeyChord keyboardShortcutKeyChordWithInfo:v4 characters:v5];
  v10 = +[VOSCommandResolver resolverForCurrentHost];
  objc_initWeak(&location, self);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000DD254;
  v29[3] = &unk_1001B6820;
  objc_copyWeak(&v30, &location);
  [v10 setFetchPressCountBlock:v29];
  [v10 setFetchContextBlock:&stru_1001B6860];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000DD2E8;
  v26[3] = &unk_1001B6888;
  objc_copyWeak(&v28, &location);
  unsigned int v11 = v5;
  id v27 = v11;
  [v10 setResolvingEventOccurredBlock:v26];
  v12 = [(VOSCommandManager *)self->_commandManager commandForKeyChord:v9 withResolver:v10];
  uint64_t v13 = [(__CFString *)v12 votEventCommandName];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    unsigned int v15 = VOTLogKeyboard();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      goto LABEL_38;
    }
    unsigned int v19 = [v4 isFNKeyPressed];
    unsigned int v20 = [v4 isShiftKeyPressed];
    CFStringRef v21 = @"NO";
    if (v19) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    v33 = v11;
    __int16 v34 = 2112;
    CFStringRef v35 = v22;
    if (v20) {
      CFStringRef v21 = @"YES";
    }
    __int16 v36 = 2112;
    CFStringRef v37 = v21;
    CFStringRef v18 = "❌ no customized command found for original characters '%@'. Fn-pressed? %@ shiftPressed? %@";
  }
  else
  {
    unsigned int v15 = VOTLogKeyboard();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      goto LABEL_38;
    }
    unsigned int v16 = [v4 isFNKeyPressed];
    CFStringRef v17 = @"NO";
    *(_DWORD *)buf = 138412802;
    v33 = v12;
    __int16 v34 = 2112;
    if (v16) {
      CFStringRef v17 = @"YES";
    }
    CFStringRef v35 = v11;
    __int16 v36 = 2112;
    CFStringRef v37 = v17;
    CFStringRef v18 = "✅ returning customized vosCommand: '%@' for characters '%@' Fn-pressed? %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v18, buf, 0x20u);
LABEL_38:

  v23 = [(VOSCommandManager *)self->_commandManager eventForKeyChord:v9 resolver:v10 info:v4];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v23;
}

- (id)singleLetterCommandForKeyInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 characters];
  uint64_t v6 = [(VOTKeyboardManager *)self _localizeKeyboardString:v5];

  LODWORD(v5) = [v4 isShiftKeyPressed];
  if (v5)
  {
    uint64_t v7 = [v6 uppercaseString];

    uint64_t v6 = (void *)v7;
  }
  uint64_t v8 = [(NSDictionary *)self->_singleLetterCommandsTable objectForKey:v6];

  return v8;
}

- (void)postEvent:(id)a3
{
  id v4 = a3;
  id v5 = [objc_allocWithZone((Class)VOTKeyInfo) initWithEventRepresentation:v4];

  [(SCRCThread *)self->_keyboardThread performSelector:"_postEvent:" onTarget:self count:1 objects:v5];
}

- (id)threadSafe_keyDownInfo
{
  [(NSLock *)self->_keyDownLock lock];
  id v3 = [(VOTKeyInfo *)self->_keyDownInfo copy];
  [(NSLock *)self->_keyDownLock unlock];

  return v3;
}

- (id)keyDownInfo
{
  [(VOTKeyboardManager *)self _verifyCorrectThread];
  keyDownInfo = self->_keyDownInfo;

  return keyDownInfo;
}

- (void)updateQuickNavState:(BOOL)a3
{
  self->_isQuickNavOn = a3;
  self->_explictlyEnabledQuickNav = 0;
}

- (void)_updateConsecutiveKeyCount:(id)a3
{
  id v10 = a3;
  if ([v10 keyDown])
  {
    id v4 = [(VOTKeyboardManager *)self _characterStringRepresentationForKey:v10];
    if ([v4 length])
    {
      id v5 = [(VOTKeyboardManager *)self _characterStringRepresentationForKey:self->_lastKeyForTapCount];
      unsigned int v6 = [v5 isEqualToString:v4];

      if (v6) {
        int64_t v7 = self->_consecutiveKeyPressCount + 1;
      }
      else {
        int64_t v7 = 1;
      }
      self->_consecutiveKeyPressCount = v7;
      uint64_t v8 = (VOTKeyInfo *)[v10 copy];
      lastKeyForTapCount = self->_lastKeyForTapCount;
      self->_lastKeyForTapCount = v8;
    }
  }

  _objc_release_x2();
}

- (void)setKeyDownInfo:(id)a3
{
  id v5 = (VOTKeyInfo *)a3;
  [(VOTKeyboardManager *)self _verifyCorrectThread];
  [(NSLock *)self->_keyDownLock lock];
  if (self->_keyDownInfo != v5) {
    objc_storeStrong((id *)&self->_keyDownInfo, a3);
  }
  [(NSLock *)self->_keyDownLock unlock];
}

- (id)_localizeKeyboardString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_keyboardMap objectForKey:v4];
  unsigned int v6 = (void *)v5;
  if (v5) {
    int64_t v7 = (void *)v5;
  }
  else {
    int64_t v7 = v4;
  }
  id v8 = v7;

  return v8;
}

- (BOOL)_dispatchCommandForKeyInfo:(id)a3 isRepeatedEvent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 keyDown]) {
    [(VOTKeyboardManager *)self setKeyDownInfo:v6];
  }
  int64_t v7 = +[VOTElement systemAppApplication];
  unsigned int v8 = [v7 isSystemSleeping];

  if (!v8)
  {
    if (self->_modifierToggleSpeakingKeyDown
      && ![v6 modifierState]
      && [(VOTKeyboardManager *)self controlKeyToggleSpeakingAllowed])
    {
      id v10 = (__CFString *)kVOTEventCommandToggleSpeaking;
      v12 = 0;
      goto LABEL_62;
    }
    [(SCRCTargetSelectorTimer *)self->_keyRepeatTimer cancel];
    if (self->_captureModeEnabled && [v6 keyCode] != 41)
    {
      v12 = +[VOTEvent keyEventWithCommand:0 keyInfo:v6];
      [(id)VOTSharedWorkspace dispatchCommand:v12];
LABEL_22:
      id v10 = 0;
      BOOL v11 = 1;
LABEL_101:

      goto LABEL_102;
    }
    if ([(VOTKeyboardManager *)self _handleArrowKeyEvent:v6])
    {
      if ([v6 keyDown] && _AXSKeyRepeatEnabled())
      {
        if (v4) {
          _AXSKeyRepeatInterval();
        }
        else {
          _AXSKeyRepeatDelay();
        }
        -[SCRCTargetSelectorTimer dispatchAfterDelay:withObject:](self->_keyRepeatTimer, "dispatchAfterDelay:withObject:", v6);
      }
      goto LABEL_54;
    }
    if (sub_1000DBFDC(v6, self->_capsLockDown))
    {
      if ([v6 keyDown])
      {
        id v13 = v6;
      }
      else
      {
        id v13 = [(VOTKeyboardManager *)self keyDownInfo];
      }
      unsigned int v16 = v13;
      v12 = [(VOTKeyboardManager *)self keyboardEventForKeyInfo:v13];
      id v10 = [v12 command];
      CFStringRef v17 = [(VOTKeyboardManager *)self lastReleasedToSystemKeyEvent];

      if (v17)
      {
        if (([v6 isOptionKeyPressed] & 1) != 0
          || [v6 isControlKeyPressed])
        {
          CFStringRef v18 = [(VOTKeyboardManager *)self lastReleasedToSystemKeyEvent];
          unsigned int v19 = [v18 eventRecord];
          id v20 = [v19 copy];

          CFStringRef v21 = [v20 keyInfo];
          [v21 setKeyDown:0];

          [v20 setType:11];
          CFStringRef v22 = [v20 keyInfo];
          [v22 setModifierState:0];

          v23 = [[VOTKeyInfo alloc] initWithEventRepresentation:v20];
          [(VOTKeyboardManager *)self _dispatchKeyEventIntoSystem:v23];

          v24 = AXLogCommon();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            int v58 = 138412290;
            *(void *)v59 = v20;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Released our snarfed modifier key: %@", (uint8_t *)&v58, 0xCu);
          }
        }
        [(VOTKeyboardManager *)self setLastReleasedToSystemKeyEvent:0];
      }
      +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_axStartPassthroughTouch" object:0];
      if ([(__CFString *)v10 isEqualToString:kVOTEventCommandSimpleTap]
        && [v6 keyDown])
      {
        [(VOTKeyboardManager *)self performSelector:"_axStartPassthroughTouch" withObject:0 afterDelay:0.5];
      }
      else
      {
        [(VOTKeyboardManager *)self _axEndPassthroughTouch];
      }
      if ([v6 keyDown])
      {

        v12 = 0;
        id v10 = 0;
      }

      if (v10) {
        goto LABEL_62;
      }
    }
    else if (self->_isQuickNavOn {
           && [(id)VOTSharedWorkspace allowSingleLetterSearching]
    }
           && ([v6 eventRecord],
               BOOL v14 = objc_claimAutoreleasedReturnValue(),
               [v14 originalType],
               char IsVolumeButtonPress = AXEventTypeIsVolumeButtonPress(),
               v14,
               (IsVolumeButtonPress & 1) == 0))
    {
      v54 = [(VOTKeyboardManager *)self keyDownInfo];
      v55 = v54;
      if (!v54
        || ([v54 isCommandKeyPressed] & 1) != 0
        || ([v55 isControlKeyPressed] & 1) != 0)
      {
        id v10 = 0;
      }
      else
      {
        if ([v6 isEscapeKey])
        {
          unsigned int v56 = [v6 isShiftKeyPressed];
          v57 = (id *)&kVOTEventCommandEscape;
          if (v56) {
            v57 = (id *)&kVOTEventCommandShowSideApp;
          }
        }
        else
        {
          if (![v6 keyUp])
          {

LABEL_54:
            v12 = 0;
            id v10 = &stru_1001B7888;
            goto LABEL_62;
          }
          v57 = (id *)&kVOTEventCommandSingleLetterSearch;
        }
        id v10 = (__CFString *)*v57;
      }

      v12 = 0;
      if (v10) {
        goto LABEL_62;
      }
    }
    else
    {
      v12 = 0;
    }
    if ([v6 keyUp] && objc_msgSend(v6, "keyCode") == 41)
    {
      unsigned int v25 = [v6 isShiftKeyPressed];
      v26 = (id *)&kVOTEventCommandShowSideApp;
      if (!v25) {
        v26 = (id *)&kVOTEventCommandEscape;
      }
      id v27 = (__CFString *)*v26;
      if (v27)
      {
        id v10 = v27;
        goto LABEL_62;
      }
    }
    id v28 = +[VOTCommandHelper commandHelper];
    if ([v28 helpEnabled])
    {
      if ([v6 keyUp])
      {

LABEL_56:
        if ([(NSString *)self->_lastCommand isEqualToString:kVOTEventCommandStartHelp]
          && [v6 modifiersChanged]
          && (([v6 isOptionKeyPressed] & 1) != 0
           || [v6 isControlKeyPressed]))
        {
          lastCommand = self->_lastCommand;
          self->_lastCommand = 0;
        }
        else if ([v6 keyCode] != 57)
        {
          v47 = +[VOTEvent keyEventWithCommand:0 keyInfo:0];

          v48 = [(VOTKeyboardManager *)self keyDownInfo];
          id v49 = [v48 copy];

          if ([v6 keyUp]) {
            objc_msgSend(v49, "setChangedModifiers:", objc_msgSend(v6, "changedModifiers"));
          }
          if ([v6 keyUp]) {
            id v50 = v49;
          }
          else {
            id v50 = v6;
          }
          [v47 setKeyInfo:v50];
          [(id)VOTSharedWorkspace dispatchCommand:v47];

          id v10 = 0;
          BOOL v11 = 1;
          v12 = v47;
          goto LABEL_101;
        }
        goto LABEL_22;
      }
      unsigned int v29 = [v6 modifiersChanged];

      if (v29) {
        goto LABEL_56;
      }
    }
    else
    {
    }
    id v10 = 0;
LABEL_62:
    v31 = [v6 characters];
    id v32 = [v31 length];

    if (v32)
    {
      v33 = [v6 characters];
      LODWORD(v32) = [v33 characterAtIndex:0];
    }
    __int16 v34 = VOTLogKeyboard();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v51 = [v6 keyUp];
      v52 = [v6 characters];
      unsigned int v53 = [(id)VOTSharedWorkspace allowSingleLetterSearching];
      int v58 = 67110146;
      *(_DWORD *)v59 = v51;
      *(_WORD *)&v59[4] = 2114;
      *(void *)&v59[6] = v52;
      __int16 v60 = 1024;
      int v61 = (int)v32;
      __int16 v62 = 2114;
      v63 = v10;
      __int16 v64 = 1024;
      unsigned int v65 = v53;
      _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Key State: %d, Character(s): %{public}@ [%d], Command: %{public}@, Single Letter State: %d", (uint8_t *)&v58, 0x28u);
    }
    CFStringRef v35 = [(id)VOTSharedWorkspace elementManager];
    __int16 v36 = [(id)VOTSharedWorkspace currentElement];
    unint64_t v37 = (unint64_t)[v35 modifierKeyChoiceForElement:v36];

    BOOL v11 = !self->_modifierToggleSpeakingKeyDown;
    if ([v6 isControlKeyPressed] && self->_currentModifiers == 4)
    {
      LOBYTE(v38) = 1;
    }
    else if ([v6 keyCode] == 57)
    {
      BOOL v38 = (v37 >> 1) & 1;
      if (self->_currentModifiers != 16) {
        LOBYTE(v38) = 0;
      }
    }
    else
    {
      LOBYTE(v38) = 0;
    }
    self->_modifierToggleSpeakingKeyDown = v38;
    objc_storeStrong((id *)&self->_lastCommand, v10);
    if (!v10)
    {
      if (sub_1000DBFDC(v6, self->_capsLockDown))
      {
        if ([v6 keyUp])
        {
          v41 = [(VOTKeyInfo *)self->_keyDownInfo characters];
          id v42 = [v41 length];

          if (v42)
          {
            v43 = +[VOTOutputManager outputManager];
            v44 = +[VOSOutputEvent UnknownCommand];
            [v43 sendEvent:v44];
          }
        }
        BOOL v11 = 1;
      }
      else
      {
        BOOL v11 = 0;
      }
      goto LABEL_90;
    }
    unsigned __int8 v39 = [v6 keyUp];
    if (v12)
    {
      if ((v39 & 1) == 0)
      {
        [(VOTKeyboardManager *)self _sendEvent:v12 withKeyInfo:v6 arrowMask:0];
        goto LABEL_89;
      }
      v40 = [(VOTKeyboardManager *)self keyDownInfo];
      [(VOTKeyboardManager *)self _sendEvent:v12 withKeyInfo:v40 arrowMask:0];
    }
    else
    {
      if ((v39 & 1) == 0)
      {
        [(VOTKeyboardManager *)self _sendEventForCommand:v10 withKeyInfo:v6 arrowMask:0];
        goto LABEL_89;
      }
      v40 = [(VOTKeyboardManager *)self keyDownInfo];
      [(VOTKeyboardManager *)self _sendEventForCommand:v10 withKeyInfo:v40 arrowMask:0];
    }

LABEL_89:
    [(VOTKeyboardManager *)self setControlKeyToggleSpeakingAllowed:0];
LABEL_90:
    if ([v6 keyCode] == 57 && (v37 & 2) != 0)
    {
      if ([v6 keyDown])
      {
        v45 = +[AXBackBoardServer server];
        [v45 setCapsLockLightOn:self->_fakeCapsLockOn];
      }
      BOOL v11 = 1;
    }
    if (([v6 keyDown] & 1) == 0) {
      [(VOTKeyboardManager *)self setKeyDownInfo:0];
    }
    if (!self->_currentModifiers
      && (([v6 keyUp] & 1) != 0 || objc_msgSend(v6, "modifiersChanged")))
    {
      [(VOTKeyboardManager *)self setControlKeyToggleSpeakingAllowed:1];
    }
    goto LABEL_101;
  }
  uint64_t v9 = AXLogSystemApp();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v58) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "VOT requesting system-app wake-up for key dispatch", (uint8_t *)&v58, 2u);
  }

  id v10 = +[AXSystemAppServer server];
  [(__CFString *)v10 wakeUpDeviceIfNecessary];
  BOOL v11 = 0;
LABEL_102:

  return v11;
}

- (void)_axStartPassthroughTouch
{
  self->_passthroughStart = CGPointZero;
  id v3 = [(id)VOTSharedWorkspace currentElement];
  if (v3)
  {
    id v12 = v3;
    id v4 = [v3 windowContextId];
    uint64_t v5 = +[VOTElement systemWideElement];
    id v6 = [(id)VOTSharedWorkspace currentElement];
    [v6 centerPoint];
    objc_msgSend(v5, "convertPoint:fromContextId:", v4);
    self->_passthroughStart.x = v7;
    self->_passthroughStart.y = v8;

    uint64_t v9 = +[VOTElement systemWideElement];
    objc_msgSend(v9, "postFingerTouchAtPoint:withForce:withContextId:", v4, self->_passthroughStart.x, self->_passthroughStart.y, 0.0);

    id v10 = +[VOTOutputManager outputManager];
    BOOL v11 = +[VOSOutputEvent DidBeginPassthrough];
    [v10 sendEvent:v11];

    id v3 = v12;
  }
}

- (void)_axEndPassthroughTouch
{
  p_passthroughStart = &self->_passthroughStart;
  if (CGPointZero.x != self->_passthroughStart.x || CGPointZero.y != self->_passthroughStart.y)
  {
    uint64_t v5 = +[VOTElement systemWideElement];
    id v6 = [(id)VOTSharedWorkspace currentElement];
    objc_msgSend(v5, "postFingerLiftAtPoint:withContextId:", objc_msgSend(v6, "windowContextId"), self->_passthroughStart.x, self->_passthroughStart.y);

    CGPoint *p_passthroughStart = CGPointZero;
  }
}

- (void)_initializeQuickNav
{
  id v3 = +[VOTConfiguration rootConfiguration];
  id v9 = [v3 preferenceForKey:@"VOTQuickNavEnabled"];

  if (!v9)
  {
    id v4 = +[VOTConfiguration rootConfiguration];
    id v9 = &__kCFBooleanTrue;
    objc_msgSend(v4, "setPreference:forKey:");
  }
  [(VOTKeyboardManager *)self setQuickNavDownDurationAllowedAcceptance:0.2];
  -[VOTKeyboardManager updateQuickNavState:](self, "updateQuickNavState:", [v9 BOOLValue]);
  uint64_t v5 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:self selector:"_handleQuickNavPressTimer:"];
  quickNavKeyTimer = self->_quickNavKeyTimer;
  self->_quickNavKeyTimer = v5;

  CGFloat v7 = (SCRCTargetSelectorTimer *)[objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:self selector:"_handleQuickNavDownArrowRepostPress:"];
  quickNavRepostTimer = self->_quickNavRepostTimer;
  self->_quickNavRepostTimer = v7;

  xmmword_1001EBB00 = xmmword_10016E9F0;
  *(_OWORD *)algn_1001EBB10 = xmmword_10016EA00;
}

- (BOOL)_handleArrowKeyEvent:(id)a3
{
  id v4 = a3;
  if ([v4 isArrowKey] && (sub_1000DBFDC(v4, self->_capsLockDown) & 1) == 0)
  {
    uint64_t v6 = *((void *)&xmmword_1001EBB00 + [v4 keyCode] - 79);
    unint64_t quickNavStateMask = self->_quickNavStateMask;
    BOOL v8 = [v4 keyCode] == 79 || objc_msgSend(v4, "keyCode") == 80;
    unsigned int v9 = [v4 keyCode];
    if ([v4 keyDown])
    {
      self->_quickNavStateMask |= v6;
      if (v8)
      {
        BOOL v10 = v9 != 79;
        if (self->_quickNavDownStateTime[v10] == 0.0) {
          self->_quickNavDownStateTime[v10] = CFAbsoluteTimeGetCurrent();
        }
      }
    }
    else if ([v4 keyUp])
    {
      if (v8)
      {
        double v11 = self->_quickNavDownStateTime[0];
        if (v11 > 0.0)
        {
          double v12 = self->_quickNavDownStateTime[1];
          if (v12 > 0.0) {
            self->_quickNavLastRecordedActivation = vabdd_f64(v11, v12);
          }
        }
        self->_quickNavDownStateTime[v9 != 79] = 0.0;
      }
      self->_quickNavStateMask &= ~v6;
    }
    if ([v4 keyDown] && quickNavStateMask != self->_quickNavStateMask) {
      [(SCRCTargetSelectorTimer *)self->_quickNavKeyTimer cancel];
    }
    if ([v4 keyDown])
    {
      unint64_t v13 = self->_quickNavStateMask;
      self->_unint64_t quickNavLastDownState = v13;
      if (quickNavStateMask == v13) {
        [(VOTKeyboardManager *)self _handleQuickNavPress:v4];
      }
      else {
        [(SCRCTargetSelectorTimer *)self->_quickNavKeyTimer dispatchAfterDelay:v4 withObject:0.25];
      }
    }
    unint64_t quickNavLastDownState = self->_quickNavLastDownState;
    uint64_t v15 = quickNavLastDownState & 0xFFFF00000000;
    if ((quickNavLastDownState & 0xFFFF00000000) == 0xFFFF00000000) {
      uint64_t v16 = 79;
    }
    else {
      uint64_t v16 = 80;
    }
    CFStringRef v17 = +[NSNumber numberWithShort:v16];
    if ([v4 keyUp])
    {
      if (!self->_quickNavStateMask)
      {
        if (quickNavStateMask)
        {
          [(SCRCTargetSelectorTimer *)self->_quickNavKeyTimer cancel];
          [(VOTKeyboardManager *)self _handleQuickNavPress:v4];
          if (self->_isQuickNavOn && self->_quickNavDidSendDown)
          {
            self->_quickNavDidSendDown = 0;
            -[VOTKeyboardManager _postKeyboardKey:keyCode:eventFlags:keyFlags:keyDown:source:](self, "_postKeyboardKey:keyCode:eventFlags:keyFlags:keyDown:source:", &stru_1001B7888, [v17 unsignedShortValue], objc_msgSend(v4, "modifierState"), 0, 0, 1);
          }
        }
      }
    }
    if (!self->_isQuickNavOn)
    {
      if (quickNavLastDownState >= 0xFFFF000000000000 && v15 == 0xFFFF00000000)
      {
        [(SCRCTargetSelectorTimer *)self->_quickNavRepostTimer cancel];
      }
      else
      {
        if (quickNavLastDownState <= 0xFFFEFFFFFFFFFFFFLL && v15 != 0xFFFF00000000)
        {
          BOOL v5 = 0;
          goto LABEL_39;
        }
        if ([v4 keyDown])
        {
          if ([(SCRCTargetSelectorTimer *)self->_quickNavRepostTimer isPending]
            && ([(SCRCTargetSelectorTimer *)self->_quickNavRepostTimer isCancelled] & 1) == 0)
          {
            [(VOTKeyboardManager *)self _handleQuickNavDownArrowRepostPress:v4];
          }
          [(SCRCTargetSelectorTimer *)self->_quickNavRepostTimer dispatchAfterDelay:v4 withObject:0.0799999982];
        }
        else if ([v4 keyUp])
        {
          if ([(SCRCTargetSelectorTimer *)self->_quickNavRepostTimer isPending]
            && ([(SCRCTargetSelectorTimer *)self->_quickNavRepostTimer isCancelled] & 1) == 0)
          {
            [(SCRCTargetSelectorTimer *)self->_quickNavRepostTimer cancel];
            [(VOTKeyboardManager *)self _handleQuickNavDownArrowRepostPress:v4];
          }
          self->_quickNavDidSendDown = 0;
          BOOL v5 = 1;
          -[VOTKeyboardManager _postKeyboardKey:keyCode:eventFlags:keyFlags:keyDown:source:](self, "_postKeyboardKey:keyCode:eventFlags:keyFlags:keyDown:source:", &stru_1001B7888, [v17 unsignedShortValue], objc_msgSend(v4, "modifierState"), 0, 0, 1);
          goto LABEL_39;
        }
      }
    }
    BOOL v5 = 1;
LABEL_39:

    goto LABEL_40;
  }
  BOOL v5 = 0;
LABEL_40:

  return v5;
}

- (void)_speakCapsLockKey
{
  BOOL v3 = BKSHIDServicesIsCapsLockLightOn() != 0;
  self->_fakeCapsLockOn = v3;
  self->_realCapsLockOn = v3;
  id v6 = +[VOTOutputManager outputManager];
  if (self->_realCapsLockOn) {
    id v4 = @"capslock.on";
  }
  else {
    id v4 = @"capslock.off";
  }
  BOOL v5 = sub_100051804(off_1001EA9E8, v4, 0);
  [v6 speakSimpleString:v5];
}

- (void)_handleAnnouncementsForKeyInfo:(id)a3
{
  id v3 = a3;
  if ([v3 keyDown])
  {
    if ([v3 keyCode] == 57)
    {
      id v4 = [(id)VOTSharedWorkspace elementManager];
      BOOL v5 = [(id)VOTSharedWorkspace currentElement];
      unsigned __int8 v6 = [v4 modifierKeyChoiceForElement:v5];

      if ((v6 & 2) == 0) {
        AXPerformBlockOnMainThreadAfterDelay();
      }
    }
  }
}

- (void)_updateEventFlags:(id)a3
{
  id v7 = a3;
  unsigned int v4 = [v7 modifierState];
  self->_currentModifiers = v4;
  unsigned int keyboardHelpMask = self->_keyboardHelpMask;
  if ((v4 & 8) != 0)
  {
    if ((keyboardHelpMask & 8) == 0)
    {
LABEL_3:
      uint64_t v6 = 8;
      if ((v4 & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((keyboardHelpMask & 8) != 0)
  {
    goto LABEL_3;
  }
  uint64_t v6 = 0;
  if ((v4 & 4) != 0)
  {
LABEL_4:
    if ((keyboardHelpMask & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  if ((keyboardHelpMask & 4) != 0) {
LABEL_5:
  }
    uint64_t v6 = v6 | 4;
LABEL_6:
  if ((v4 & 0x40) != 0)
  {
    if ((keyboardHelpMask & 0x40) != 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if ((keyboardHelpMask & 0x40) != 0) {
LABEL_14:
  }
    uint64_t v6 = v6 | 0x40;
LABEL_15:
  if ((v4 & 2) != 0)
  {
    if ((keyboardHelpMask & 2) != 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if ((keyboardHelpMask & 2) != 0) {
LABEL_19:
  }
    uint64_t v6 = v6 | 2;
LABEL_20:
  if (v4)
  {
    if (keyboardHelpMask) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (keyboardHelpMask) {
LABEL_24:
  }
    uint64_t v6 = v6 | 1;
LABEL_25:
  if ((v4 & 0x10) != 0)
  {
    if ((keyboardHelpMask & 0x10) != 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if ((keyboardHelpMask & 0x10) != 0) {
LABEL_29:
  }
    uint64_t v6 = v6 | 0x10;
LABEL_30:
  self->_unsigned int keyboardHelpMask = [v7 modifierState];
  [v7 setChangedModifiers:v6];
}

- (void)_handleKeyboardKeyEvent:(id)a3
{
}

- (BOOL)_keyEventShouldGoToFocusedContext:(id)a3
{
  return 1;
}

- (void)_dispatchEventRepresentationIntoSystem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[VOTKeyInfo alloc] initWithEventRepresentation:v4];

  [(VOTKeyboardManager *)self _dispatchKeyEventIntoSystem:v5];
}

- (void)_handleCapsLockToggle:(id)a3
{
  id v23 = a3;
  id v4 = [(id)VOTSharedWorkspace elementManager];
  BOOL v5 = [(id)VOTSharedWorkspace currentElement];
  unsigned __int8 v6 = [v4 modifierKeyChoiceForElement:v5];

  if ((v6 & 2) != 0)
  {
    self->_fakeCapsLockOn ^= 1u;
    id v7 = +[AXEventRepresentation keyRepresentationWithType:10];
    BOOL v8 = [v7 keyInfo];
    [v8 setKeyCode:57];

    uint64_t v9 = 16 * self->_fakeCapsLockOn;
    BOOL v10 = [v7 keyInfo];
    [v10 setModifierState:v9];

    double v11 = [(id)VOTSharedWorkspace currentElement];
    id v12 = [v11 windowContextId];
    unint64_t v13 = [v23 eventRecord];
    [v13 setContextId:v12];

    BOOL v14 = [v7 keyInfo];
    [v14 setKeyDown:1];

    uint64_t v15 = [v23 eventRecord];
    uint64_t v16 = [v15 clientId];
    [v7 setClientId:v16];

    [(VOTKeyboardManager *)self _dispatchEventRepresentationIntoSystem:v7];
    id v17 = [v7 copy];
    [v17 setType:11];
    CFStringRef v18 = [v17 keyInfo];
    [v18 setKeyDown:0];

    [(VOTKeyboardManager *)self _dispatchEventRepresentationIntoSystem:v17];
    unsigned int v19 = +[VOTOutputManager outputManager];
    if (self->_fakeCapsLockOn) {
      id v20 = @"capslock.on";
    }
    else {
      id v20 = @"capslock.off";
    }
    CFStringRef v21 = sub_100051804(off_1001EA9E8, v20, 0);
    [v19 speakSimpleString:v21];

    CFStringRef v22 = +[AXBackBoardServer server];
    [v22 setCapsLockLightOn:self->_fakeCapsLockOn];
  }
}

- (void)_handleModifierCapsLockBehavior:(id)a3
{
  id v5 = a3;
  if ([v5 isCapsLockKeyDown])
  {
    self->_capsLockDown = 1;
    goto LABEL_10;
  }
  if (![v5 isCapsLockKeyUp])
  {
LABEL_9:
    self->_capsLockTap1 = 0.0;
    goto LABEL_10;
  }
  self->_capsLockDown = 0;
  if ([v5 modifierState])
  {
    [(VOTKeyboardManager *)self _handleCapsLockToggle:v5];
    goto LABEL_9;
  }
  if (self->_capsLockTap1 > 0.0 && CFAbsoluteTimeGetCurrent() - self->_capsLockTap1 < 0.3)
  {
    [(VOTKeyboardManager *)self _handleCapsLockToggle:v5];
    id v4 = v5;
    self->_capsLockTap1 = 0.0;
    goto LABEL_11;
  }
  self->_capsLockTap1 = CFAbsoluteTimeGetCurrent();
LABEL_10:
  id v4 = v5;
LABEL_11:
}

- (void)_resetSoundAndScreenCurtain
{
  [(id)VOTSharedWorkspace setVoiceOverMuted:0 sendRequest:0];
  id v2 = AXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Resetting sound and screen curtain with volume button presses", buf, 2u);
  }

  id v3 = +[AXSettings sharedInstance];
  if ([v3 voiceOverScreenCurtainEnabled])
  {
  }
  else
  {
    id v4 = +[AXSettings sharedInstance];
    unsigned int v5 = [v4 voiceOverSoundCurtain];

    if (!v5) {
      return;
    }
  }
  unsigned __int8 v6 = +[AVSystemController sharedAVSystemController];
  float v13 = 0.0;
  [v6 getVolume:&v13 forCategory:@"Audio/Video"];
  *(float *)&double v7 = v13;
  if (v13 < 0.25)
  {
    LODWORD(v7) = 0.5;
    [v6 setVolumeTo:@"Audio/Video" forCategory:0 retainFullMute:v7];
  }
  BOOL v8 = +[AXSettings sharedInstance];
  [v8 setVoiceOverScreenCurtainEnabled:0];

  uint64_t v9 = +[AXSettings sharedInstance];
  [v9 setVoiceOverSoundCurtain:0];

  BOOL v10 = sub_100051804(off_1001EA9E8, @"screen.and.sound.curtain.restored", 0);
  double v11 = [(id)VOTSharedWorkspace selectedLanguage];
  id v12 = sub_10000ABF8(v10, 0, v11);
}

- (void)_processVolumeButtonsForCurtainReset:(id)a3
{
  id v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DF00C;
  v6[3] = &unk_1001B33B8;
  v6[4] = self;
  unsigned int v5 = objc_retainBlock(v6);
  if ([v4 type] == 1008)
  {
    [(VOTKeyboardManager *)self setLastVolumeDownButtonDownTime:CFAbsoluteTimeGetCurrent()];
  }
  else
  {
    if ([v4 type] != 1006)
    {
      if ([v4 type] == 1009)
      {
        [(VOTKeyboardManager *)self setLastVolumeDownButtonUpTime:CFAbsoluteTimeGetCurrent()];
      }
      else
      {
        if ([v4 type] != 1007) {
          goto LABEL_10;
        }
        [(VOTKeyboardManager *)self setLastVolumeUpButtonUpTime:CFAbsoluteTimeGetCurrent()];
      }
      ((void (*)(void *))v5[2])(v5);
      goto LABEL_10;
    }
    [(VOTKeyboardManager *)self setLastVolumeUpButtonDownTime:CFAbsoluteTimeGetCurrent()];
  }
LABEL_10:
}

- (void)_handleKeyboardKeyEvent:(id)a3 isRepeatedEvent:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  if ([(id)VOTSharedWorkspace perkinsKeyboardInputEnabled]
    && [v12 eventOrigin] == (id)4
    && !self->_currentModifiers)
  {
    BOOL v10 = +[VOTBrailleManager manager];
    LOBYTE(v8) = [v10 handleKeyboardPerkinsInput:v12 chordOnly:0];
  }
  else
  {
    if (![(id)VOTSharedWorkspace perkinsChordKeyboardInputEnabled]
      || [v12 eventOrigin] != (id)4
      || self->_currentModifiers)
    {
      goto LABEL_14;
    }
    double v7 = +[VOTBrailleManager manager];
    unsigned int v8 = [v7 handleKeyboardPerkinsInput:v12 chordOnly:1];

    id v9 = [v12 keyCode];
    if (v9 == 44)
    {
      if (v8)
      {
        objc_storeStrong((id *)&self->_spaceKeyInfoCache, a3);
LABEL_15:
        id v11 = v12;
        goto LABEL_16;
      }
      [(VOTKeyboardManager *)self _handleNonPerkinsKeyboardKeyEvent:self->_spaceKeyInfoCache isRepeatedEvent:v4];
LABEL_14:
      id v9 = [(VOTKeyboardManager *)self _handleNonPerkinsKeyboardKeyEvent:v12 isRepeatedEvent:v4];
      goto LABEL_15;
    }
  }
  id v11 = v12;
  if ((v8 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_16:

  _objc_release_x1(v9, v11);
}

- (void)_handleNonPerkinsKeyboardKeyEvent:(id)a3 isRepeatedEvent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int currentModifiers = self->_currentModifiers;
  id v23 = v6;
  if (currentModifiers != [v6 modifierState]) {
    [v23 setModifiersChanged:1];
  }
  if (!v4)
  {
    unsigned int v8 = [v23 eventRecord];
    [(VOTKeyboardManager *)self _processVolumeButtonsForCurtainReset:v8];
  }
  [(VOTKeyboardManager *)self _handleModifierCapsLockBehavior:v23];
  [(VOTKeyboardManager *)self _updateEventFlags:v23];
  [(VOTKeyboardManager *)self _handleAnnouncementsForKeyInfo:v23];
  [(VOTKeyboardManager *)self _updateConsecutiveKeyCount:v23];
  id v9 = +[VOTBrailleManager manager];
  unsigned int v10 = [v9 hasActiveBrailleDisplay];

  if (v10
    && ([(VOTKeyboardManager *)self _handleBrailleKeyEvent:v23]
     || [(VOTKeyboardManager *)self _handleTerminalKeyEvent:v23]))
  {
    unsigned int v11 = 1;
  }
  else
  {
    unsigned int v11 = [(VOTKeyboardManager *)self _dispatchCommandForKeyInfo:v23 isRepeatedEvent:v4];
  }
  if ([v23 eventOrigin] == (id)4 && -[VOTKeyboardManager isQuickNavOn](self, "isQuickNavOn"))
  {
    id v12 = [(VOTKeyboardManager *)self keyDownInfo];
    unsigned int v13 = [v12 isArrowKey];

    if ((v13 | v11)) {
      goto LABEL_26;
    }
  }
  else if (v11)
  {
    goto LABEL_26;
  }
  BOOL v14 = +[VOTCommandHelper commandHelper];
  unsigned __int8 v15 = [v14 helpEnabled];

  if ((v15 & 1) == 0)
  {
    if ([(id)VOTSharedWorkspace playKeyboardClicksOnHWInput])
    {
      uint64_t v16 = [v23 eventRecord];
      unsigned int v17 = [v16 type];

      if (v17 == 10)
      {
        CFStringRef v18 = +[VOTOutputManager outputManager];
        [v18 playSoundFast:@"KeyboardClick"];
      }
    }
    [(VOTKeyboardManager *)self _dispatchKeyEventIntoSystem:v23];
    [(SCRCTargetSelectorTimer *)self->_keyRepeatTimer cancel];
    if ([v23 keyDown]
      && _AXSKeyRepeatEnabled()
      && ![(VOTKeyboardManager *)self _keyInfoIsModifierOnly:v23])
    {
      if (v4) {
        _AXSKeyRepeatInterval();
      }
      else {
        _AXSKeyRepeatDelay();
      }
      -[SCRCTargetSelectorTimer dispatchAfterDelay:withObject:](self->_keyRepeatTimer, "dispatchAfterDelay:withObject:", v23);
    }
  }
LABEL_26:
  unsigned int v19 = [(VOTKeyboardManager *)self testingProcessEventCallback];

  id v21 = v23;
  if (v19)
  {
    CFStringRef v22 = [(VOTKeyboardManager *)self testingProcessEventCallback];
    ((void (**)(void, id))v22)[2](v22, v23);

    id v21 = v23;
  }

  _objc_release_x1(v20, v21);
}

- (BOOL)_handleBrailleKeyEvent:(id)a3
{
  id v3 = a3;
  if (([v3 keyCode] != 41 || objc_msgSend(v3, "keyUp"))
    && ([v3 keyCode] == 41 || objc_msgSend(v3, "keyDown")))
  {
    unsigned int v4 = [v3 keyCode];
    unsigned __int8 v5 = 0;
    switch(v4)
    {
      case 'J':
        id v6 = (id *)&kVOTEventCommandFirstElement;
        goto LABEL_15;
      case 'K':
      case 'L':
      case 'N':
        break;
      case 'M':
        id v6 = (id *)&kVOTEventCommandLastElement;
        goto LABEL_15;
      case 'O':
        id v6 = (id *)&kVOTEventCommandNextElement;
        goto LABEL_15;
      case 'P':
        id v6 = (id *)&kVOTEventCommandPreviousElement;
        goto LABEL_15;
      default:
        if (v4 == 40)
        {
          if ([(id)VOTSharedWorkspace brailleInputActive]) {
            goto LABEL_17;
          }
          id v6 = (id *)&kVOTEventCommandReturn;
        }
        else
        {
          if (v4 != 41) {
            break;
          }
          id v6 = (id *)&kVOTEventCommandEscape;
        }
LABEL_15:
        id v7 = *v6;
        if (!v7) {
          goto LABEL_17;
        }
        unsigned int v8 = v7;
        id v9 = +[VOTBrailleManager manager];
        unsigned __int8 v5 = [v9 handleCommandIfActiveBrailleRelated:v8];

        break;
    }
  }
  else
  {
LABEL_17:
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)_handleTerminalKeyEvent:(id)a3
{
  id v3 = a3;
  if (![v3 keyDown]) {
    goto LABEL_19;
  }
  int v4 = [v3 keyCode];
  if (v4 > 78)
  {
    if (v4 == 79)
    {
      unsigned __int8 v5 = +[VOTBrailleTerminalManager sharedManager];
      unsigned __int8 v6 = [v5 handleRightArrow];
      goto LABEL_11;
    }
    if (v4 == 80)
    {
      unsigned __int8 v5 = +[VOTBrailleTerminalManager sharedManager];
      unsigned __int8 v6 = [v5 handleLeftArrow];
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (v4 == 42)
  {
    unsigned __int8 v5 = +[VOTBrailleTerminalManager sharedManager];
    unsigned __int8 v6 = [v5 handleDelete];
    goto LABEL_11;
  }
  if (v4 != 76)
  {
LABEL_12:
    unsigned int v8 = +[VOTBrailleTerminalManager sharedManager];
    id v9 = [v8 state];

    if (v9 == (id)2)
    {
LABEL_17:
      BOOL v7 = 1;
      goto LABEL_20;
    }
    if (v9 == (id)1)
    {
      unsigned int v10 = [v3 characters];
      unsigned int v11 = v10;
      if (v10 && [v10 length])
      {
        id v12 = +[VOTBrailleTerminalManager sharedManager];
        [v12 commandInsertString:v11];

        goto LABEL_17;
      }
    }
LABEL_19:
    BOOL v7 = 0;
    goto LABEL_20;
  }
  unsigned __int8 v5 = +[VOTBrailleTerminalManager sharedManager];
  unsigned __int8 v6 = [v5 handleForwardDelete];
LABEL_11:
  BOOL v7 = v6;

LABEL_20:
  return v7;
}

- (BOOL)_keyInfoIsModifierOnly:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 keyCode] == 227
    || [v3 keyCode] == 231
    || [v3 keyCode] == 225
    || [v3 keyCode] == 229
    || [v3 keyCode] == 224
    || [v3 keyCode] == 228
    || [v3 keyCode] == 226
    || [v3 keyCode] == 230
    || [v3 keyCode] == 57;

  return v4;
}

- (void)_dispatchKeyEventIntoSystem:(id)a3
{
  id v20 = a3;
  BOOL v4 = [(id)VOTSharedWorkspace currentElement];
  id v5 = [v4 windowContextId];
  unsigned __int8 v6 = [(id)VOTSharedWorkspace elementManager];
  unsigned int v7 = [v6 isItemChooserVisible];

  if (v7)
  {
    if (v5)
    {
      unsigned int v8 = [v20 eventRecord];
      [v8 setClientId:0];
    }
    id v9 = [v20 eventRecord];
    [v9 setContextId:v5];
  }
  unsigned int v10 = [v20 eventRecord];
  unsigned int v11 = [v10 contextId];

  if (!v11)
  {
    id v12 = [v20 eventRecord];
    [v12 setContextId:v5];
  }
  unsigned int v13 = +[VOTWorkspace sharedWorkspace];
  unsigned int v14 = [v13 inUnitTestMode];

  if (v14)
  {
    unsigned __int8 v15 = +[VOTWorkspace sharedWorkspace];
    uint64_t v16 = [v20 eventRecord];
    [v15 notePostedEventForUnitTesting:v16];
  }
  [(VOTKeyboardManager *)self setLastReleasedToSystemKeyEvent:v20];
  [(VOTKeyboardManager *)self setLastReleasedToSystemKeyEventTime:CFAbsoluteTimeGetCurrent()];
  if ([v20 keyCode])
  {
    unsigned int v17 = +[AXEventTapManager sharedManager];
    CFStringRef v18 = [v20 eventRecord];
    [v17 sendHIDSystemEvent:v18 repostCreatorHIDEvent:0 senderID:0x8000000817319373];
  }
  else
  {
    if ([v4 doesHaveTraits:kAXWebContentTrait])
    {
      uint64_t v19 = [v4 application];

      BOOL v4 = (void *)v19;
    }
    unsigned int v17 = [v20 eventRecord];
    [v4 dispatchKeyboardEvent:v17];
  }
}

- (void)_keyRepeat:(id)a3
{
  id v4 = a3;
  if (([(SCRCTargetSelectorTimer *)self->_keyRepeatTimer isCancelled] & 1) == 0) {
    [(VOTKeyboardManager *)self _handleKeyboardKeyEvent:v4 isRepeatedEvent:1];
  }
}

- (void)_sendEvent:(id)a3 withKeyInfo:(id)a4 arrowMask:(int64_t)a5
{
  id v12 = a3;
  id v8 = a4;
  if (a5 >= 1)
  {
    id v9 = +[NSNumber numberWithInteger:a5];
    [v12 setObject:v9 forIndex:103];
  }
  unsigned int v10 = [(VOTKeyboardManager *)self testingEventDispatchTap];

  if (v10)
  {
    unsigned int v11 = [(VOTKeyboardManager *)self testingEventDispatchTap];
    ((void (**)(void, id))v11)[2](v11, v12);
  }
  [(id)VOTSharedWorkspace dispatchCommand:v12];
}

- (void)_sendEventForCommand:(id)a3 withKeyInfo:(id)a4 arrowMask:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  if ([v10 length])
  {
    id v9 = +[VOTEvent keyEventWithCommand:v10 keyInfo:v8];
    [(VOTKeyboardManager *)self _sendEvent:v9 withKeyInfo:v8 arrowMask:a5];
  }
}

- (void)_postKeyboardKey:(id)a3 keyCode:(unsigned __int16)a4 eventFlags:(unsigned int)a5 keyFlags:(unsigned __int16)a6 keyDown:(BOOL)a7 source:(unsigned __int16)a8
{
  BOOL v8 = a7;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = a4;
  id v18 = a3;
  if (v8) {
    uint64_t v12 = 10;
  }
  else {
    uint64_t v12 = 11;
  }
  unsigned int v13 = +[AXEventRepresentation keyRepresentationWithType:v12];
  unsigned int v14 = [v13 keyInfo];
  [v14 setModifiedInput:v18];
  [v14 setUnmodifiedInput:v18];
  [v14 setKeyCode:v10];
  [v14 setModifierState:v9];
  [v14 setKeyDown:v8];
  [(VOTKeyboardManager *)self setLastDispatchedKeyEvent:v13];
  [(VOTKeyboardManager *)self setLastDispatchedKeyEventTime:CFAbsoluteTimeGetCurrent()];
  if ([v14 keyCode] && !objc_msgSend(v18, "length"))
  {
    uint64_t v16 = [(id)VOTSharedWorkspace currentElement];
    objc_msgSend(v13, "setContextId:", objc_msgSend(v16, "windowContextId"));

    unsigned int v17 = [(id)VOTSharedWorkspace currentElement];
    objc_msgSend(v13, "setDisplayId:", objc_msgSend(v17, "displayId"));

    [(VOTKeyboardManager *)self _dispatchEventRepresentationIntoSystem:v13];
  }
  else
  {
    unsigned __int8 v15 = [(id)VOTSharedWorkspace currentElement];
    [v15 dispatchKeyboardEvent:v13];
  }
}

- (void)_handleQuickNavDownArrowRepostPress:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    id v5 = +[VOTCommandHelper commandHelper];
    unsigned int v6 = [v5 helpEnabled];

    if (v6)
    {
      unsigned int v7 = +[VOTEvent keyEventWithCommand:0 keyInfo:v8];
      [(id)VOTSharedWorkspace dispatchCommand:v7];
    }
    else
    {
      self->_quickNavDidSendDown = 1;
      -[VOTKeyboardManager _postKeyboardKey:keyCode:eventFlags:keyFlags:keyDown:source:](self, "_postKeyboardKey:keyCode:eventFlags:keyFlags:keyDown:source:", &stru_1001B7888, [v8 keyCode], objc_msgSend(v8, "modifierState"), 0, 1, 1);
    }
    id v4 = v8;
  }
}

- (void)_handleQuickNavPress:(id)a3
{
  id v4 = a3;
  if (self->_quickNavLastDownState == 0xFFFFFFFF00000000
    && (double quickNavLastRecordedActivation = self->_quickNavLastRecordedActivation,
        [(VOTKeyboardManager *)self quickNavDownDurationAllowedAcceptance],
        quickNavLastRecordedActivation < v6)
    && self->_quickNavLastRecordedActivation > 0.0)
  {
    [(SCRCTargetSelectorTimer *)self->_quickNavRepostTimer cancel];
    [(VOTKeyboardManager *)self updateQuickNavState:!self->_isQuickNavOn];
    self->_explictlyEnabledQuickNav = 1;
    [(VOTKeyboardManager *)self _sendEventForCommand:kVOTEventCommandAnnounceQuickNav withKeyInfo:v4 arrowMask:3];
    self->_double quickNavLastRecordedActivation = 0.0;
  }
  else
  {
    self->_double quickNavLastRecordedActivation = 0.0;
    if (self->_isQuickNavOn)
    {
      unint64_t quickNavLastDownState = self->_quickNavLastDownState;
      if ((~quickNavLastDownState & 0xFFFF00000000) != 0) {
        uint64_t v8 = quickNavLastDownState > 0xFFFEFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v8 = (quickNavLastDownState > 0xFFFEFFFFFFFFFFFFLL) | 2;
      }
      if ((~LODWORD(self->_quickNavLastDownState) & 0xFFFF0000) == 0) {
        v8 |= 8uLL;
      }
      if (LOWORD(self->_quickNavLastDownState) == 0xFFFF) {
        uint64_t v9 = v8 | 4;
      }
      else {
        uint64_t v9 = v8;
      }
      uint64_t v10 = +[AXSSKeyChord quickNavKeyChordWithInfo:v4 arrowMask:v9];
      unsigned int v11 = +[VOSCommandResolver resolverForCurrentHost];
      [v11 setKeyboardMode:1];
      uint64_t v12 = [(VOSCommandManager *)self->_commandManager commandForKeyChord:v10 withResolver:v11];
      unsigned int v13 = [v12 votEventCommandName];

      unsigned int v14 = VOTLogKeyboard();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
      if (v13)
      {
        if (v15)
        {
          uint64_t v16 = [v10 displayValue];
          int v18 = 138412802;
          uint64_t v19 = v12;
          __int16 v20 = 2112;
          id v21 = v16;
          __int16 v22 = 2112;
          id v23 = v4;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "✅ handling quickNav vosCommand: '%@' for keys '%@' info '%@'", (uint8_t *)&v18, 0x20u);
        }
        unsigned int v14 = [v12 votEventCommandName];
        [(VOTKeyboardManager *)self _sendEventForCommand:v14 withKeyInfo:v4 arrowMask:v9];
      }
      else if (v15)
      {
        unsigned int v17 = [v10 displayValue];
        int v18 = 138412546;
        uint64_t v19 = v17;
        __int16 v20 = 2112;
        id v21 = v4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "❌ no customized quickNav command found for keys '%@' info '%@'", (uint8_t *)&v18, 0x16u);
      }
    }
  }
}

- (void)_handleQuickNavPressTimer:(id)a3
{
  id v4 = a3;
  if (([(SCRCTargetSelectorTimer *)self->_quickNavKeyTimer isCancelled] & 1) == 0) {
    [(VOTKeyboardManager *)self _handleQuickNavPress:v4];
  }
}

- (void)_postEvent:(id)a3
{
  id v3 = a3;
  id v5 = +[VOTElement systemWideElement];
  id v4 = [v3 eventRecord];

  [v5 repostEvent:v4];
}

- (void)clearConsecutiveKeyPressCount
{
  self->_consecutiveKeyPressCount = 1;
  self->_lastKeyForTapCount = 0;
  _objc_release_x1();
}

- (BOOL)captureModeEnabled
{
  return self->_captureModeEnabled;
}

- (void)setCaptureModeEnabled:(BOOL)a3
{
  self->_captureModeEnabled = a3;
}

- (BOOL)isQuickNavOn
{
  return self->_isQuickNavOn;
}

- (BOOL)explictlyEnabledQuickNav
{
  return self->_explictlyEnabledQuickNav;
}

- (void)setExplictlyEnabledQuickNav:(BOOL)a3
{
  self->_explictlyEnabledQuickNav = a3;
}

- (AXEventRepresentation)lastDispatchedKeyEvent
{
  return self->_lastDispatchedKeyEvent;
}

- (void)setLastDispatchedKeyEvent:(id)a3
{
}

- (VOTKeyInfo)lastReleasedToSystemKeyEvent
{
  return self->_lastReleasedToSystemKeyEvent;
}

- (void)setLastReleasedToSystemKeyEvent:(id)a3
{
}

- (double)lastReleasedToSystemKeyEventTime
{
  return self->_lastReleasedToSystemKeyEventTime;
}

- (void)setLastReleasedToSystemKeyEventTime:(double)a3
{
  self->_lastReleasedToSystemKeyEventTime = a3;
}

- (double)lastDispatchedKeyEventTime
{
  return self->_lastDispatchedKeyEventTime;
}

- (void)setLastDispatchedKeyEventTime:(double)a3
{
  self->_lastDispatchedKeyEventTime = a3;
}

- (id)testingEventDispatchTap
{
  return self->_testingEventDispatchTap;
}

- (void)setTestingEventDispatchTap:(id)a3
{
}

- (id)testingProcessEventCallback
{
  return self->_testingProcessEventCallback;
}

- (void)setTestingProcessEventCallback:(id)a3
{
}

- (double)quickNavDownDurationAllowedAcceptance
{
  return self->_quickNavDownDurationAllowedAcceptance;
}

- (void)setQuickNavDownDurationAllowedAcceptance:(double)a3
{
  self->_quickNavDownDurationAllowedAcceptance = a3;
}

- (double)lastVolumeDownButtonDownTime
{
  return self->_lastVolumeDownButtonDownTime;
}

- (void)setLastVolumeDownButtonDownTime:(double)a3
{
  self->_lastVolumeDownButtonDownTime = a3;
}

- (double)lastVolumeUpButtonDownTime
{
  return self->_lastVolumeUpButtonDownTime;
}

- (void)setLastVolumeUpButtonDownTime:(double)a3
{
  self->_lastVolumeUpButtonDownTime = a3;
}

- (double)lastVolumeDownButtonUpTime
{
  return self->_lastVolumeDownButtonUpTime;
}

- (void)setLastVolumeDownButtonUpTime:(double)a3
{
  self->_lastVolumeDownButtonUpTime = a3;
}

- (double)lastVolumeUpButtonUpTime
{
  return self->_lastVolumeUpButtonUpTime;
}

- (void)setLastVolumeUpButtonUpTime:(double)a3
{
  self->_lastVolumeUpButtonUpTime = a3;
}

- (BOOL)controlKeyToggleSpeakingAllowed
{
  return self->_controlKeyToggleSpeakingAllowed;
}

- (void)setControlKeyToggleSpeakingAllowed:(BOOL)a3
{
  self->_controlKeyToggleSpeakingAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_testingProcessEventCallback, 0);
  objc_storeStrong(&self->_testingEventDispatchTap, 0);
  objc_storeStrong((id *)&self->_lastReleasedToSystemKeyEvent, 0);
  objc_storeStrong((id *)&self->_lastDispatchedKeyEvent, 0);
  objc_storeStrong((id *)&self->_spaceKeyInfoCache, 0);
  objc_storeStrong((id *)&self->_commandManager, 0);
  objc_storeStrong((id *)&self->_lastKeyForTapCount, 0);
  objc_storeStrong((id *)&self->_keyboardThread, 0);
  objc_storeStrong((id *)&self->_keyDownLock, 0);
  objc_storeStrong((id *)&self->_keyDownInfo, 0);
  objc_storeStrong((id *)&self->_quickNavKeyTimer, 0);
  objc_storeStrong((id *)&self->_quickNavRepostTimer, 0);
  objc_storeStrong((id *)&self->_keyRepeatTimer, 0);
  objc_storeStrong((id *)&self->_lastCommand, 0);
  objc_storeStrong((id *)&self->_keyboardMap, 0);
  objc_storeStrong((id *)&self->_layoutToKeyboardMap, 0);
  objc_storeStrong((id *)&self->_lastLayout, 0);

  objc_storeStrong((id *)&self->_singleLetterCommandsTable, 0);
}

@end