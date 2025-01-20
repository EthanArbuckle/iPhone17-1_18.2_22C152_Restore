@interface VOTCommandHelper
+ (id)commandHelper;
- (BOOL)_commandIsSupportedByTV:(id)a3;
- (BOOL)helpEnabled;
- (CGRect)practiceRegion;
- (VOTCommandHelper)init;
- (VOTElement)practiceElement;
- (id)_keyboardKeyStringForEvent:(id)a3 spoken:(BOOL)a4;
- (id)_stringForBrailleGestureCommand:(id)a3;
- (void)_processFallbackHelpForEvent:(id)a3 command:(id)a4 commandHelpText:(id *)a5 activationSpokenHelpText:(id *)a6 activationDisplayedHelpText:(id *)a7;
- (void)_processHelpForEvent:(id)a3 userCommandContext:(id)a4 commandHelpText:(id *)a5 activationSpokenHelpText:(id *)a6 activationDisplayedHelpText:(id *)a7;
- (void)_updateAccelerometerDataIfNeededAndAnnounce:(BOOL)a3;
- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4;
- (void)dealloc;
- (void)processHelpForEvent:(id)a3;
- (void)setHelpEnabled:(BOOL)a3;
- (void)setPracticeElement:(id)a3;
- (void)setPracticeRegion:(CGRect)a3;
@end

@implementation VOTCommandHelper

+ (id)commandHelper
{
  v2 = (void *)qword_1001EBA30;
  if (!qword_1001EBA30)
  {
    id v3 = [objc_allocWithZone((Class)VOTCommandHelper) init];
    v4 = (void *)qword_1001EBA30;
    qword_1001EBA30 = (uint64_t)v3;

    v2 = (void *)qword_1001EBA30;
  }

  return v2;
}

- (VOTCommandHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)VOTCommandHelper;
  v2 = [(VOTCommandHelper *)&v7 init];
  if (v2)
  {
    id v3 = (BKSAccelerometer *)objc_alloc_init((Class)BKSAccelerometer);
    accelerometer = v2->_accelerometer;
    v2->_accelerometer = v3;

    [(BKSAccelerometer *)v2->_accelerometer setDelegate:v2];
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  [(BKSAccelerometer *)self->_accelerometer setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)VOTCommandHelper;
  [(VOTCommandHelper *)&v3 dealloc];
}

- (void)setHelpEnabled:(BOOL)a3
{
  self->_helpEnabled = a3;
  [(VOTCommandHelper *)self _updateAccelerometerDataIfNeededAndAnnounce:0];
  if (!self->_helpEnabled)
  {
    -[VOTCommandHelper setPracticeRegion:](self, "setPracticeRegion:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(VOTCommandHelper *)self setPracticeElement:0];
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"VOTHelpEnabledChangedNotification" object:0];
}

- (void)_updateAccelerometerDataIfNeededAndAnnounce:(BOOL)a3
{
  if (self->_helpEnabled
    && (BOOL v4 = a3,
        +[AXSettings sharedInstance],
        v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 voiceOverHelpMode],
        v5,
        v6 == (id)2))
  {
    [(BKSAccelerometer *)self->_accelerometer setOrientationEventsEnabled:1];
    int64_t currentTypingMode = self->_currentTypingMode;
    self->_int64_t currentTypingMode = [(BKSAccelerometer *)self->_accelerometer currentDeviceOrientation] == (id)5;
    if (v4)
    {
      id v8 = [(BKSAccelerometer *)self->_accelerometer currentDeviceOrientation];
      if (self->_currentTypingMode != currentTypingMode)
      {
        id v10 = v8;
        v11 = [(id)VOTSharedWorkspace selectedLanguage];
        id v15 = v11;
        if (v10 == (id)5) {
          v12 = @"braille.table.top";
        }
        else {
          v12 = @"braille.screen.away";
        }
        v13 = sub_100051D04(off_1001EA9E8, v12, 0, v11);
        id v14 = sub_10000ABF8(v13, 0, v15);
      }
    }
  }
  else
  {
    accelerometer = self->_accelerometer;
    [(BKSAccelerometer *)accelerometer setOrientationEventsEnabled:0];
  }
}

- (id)_keyboardKeyStringForEvent:(id)a3 spoken:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 objectForIndex:103];
  objc_super v7 = @" + ";
  if (v4) {
    objc_super v7 = @", ";
  }
  id v8 = v7;
  if (v6)
  {
    v9 = +[NSMutableString string];
    unsigned __int8 v10 = [v6 integerValue];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000B3654;
    v37[3] = &unk_1001B60D8;
    id v11 = v9;
    id v38 = v11;
    v39 = v8;
    v12 = objc_retainBlock(v37);
    v13 = (void (**)(void, void))v12;
    if (v10)
    {
      ((void (*)(void *, const __CFString *))v12[2])(v12, @"VOSKey.left");
      if ((v10 & 2) == 0)
      {
LABEL_6:
        if ((v10 & 4) == 0) {
          goto LABEL_7;
        }
        goto LABEL_20;
      }
    }
    else if ((v10 & 2) == 0)
    {
      goto LABEL_6;
    }
    ((void (**)(void, const __CFString *))v13)[2](v13, @"VOSKey.right");
    if ((v10 & 4) == 0)
    {
LABEL_7:
      if ((v10 & 8) == 0)
      {
LABEL_9:
        id v14 = v11;

        goto LABEL_56;
      }
LABEL_8:
      ((void (**)(void, const __CFString *))v13)[2](v13, @"VOSKey.down");
      goto LABEL_9;
    }
LABEL_20:
    ((void (**)(void, const __CFString *))v13)[2](v13, @"VOSKey.up");
    if ((v10 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v15 = [v5 keyInfo];
  v16 = [v15 eventRecord];
  unsigned int v17 = [v15 changedModifiers];
  if (!v17)
  {
    if ([v15 isAppleVendorKey])
    {
      unsigned int v19 = [v15 mediaKeyCode];
      if (v19 == 32)
      {
        CFStringRef v20 = @"brightnessUp";
        goto LABEL_42;
      }
      if (v19 == 33)
      {
        CFStringRef v20 = @"brightnessDown";
        goto LABEL_42;
      }
    }
    else
    {
      if ([v15 isMediaKey])
      {
        int v29 = [v15 mediaKeyCode];
        v28 = 0;
        if (v29 <= 204)
        {
          id v14 = 0;
          switch(v29)
          {
            case 178:
              CFStringRef v20 = @"record";
              goto LABEL_42;
            case 179:
            case 181:
              CFStringRef v20 = @"nextTrack";
              goto LABEL_42;
            case 180:
            case 182:
              CFStringRef v20 = @"previousTrack";
              goto LABEL_42;
            case 183:
              CFStringRef v20 = @"stop";
              goto LABEL_42;
            case 184:
              CFStringRef v20 = @"eject";
              goto LABEL_42;
            default:
              goto LABEL_44;
          }
          goto LABEL_44;
        }
        if (v29 <= 429)
        {
          if (v29 == 205)
          {
            CFStringRef v20 = @"playPause";
          }
          else
          {
            id v14 = 0;
            if (v29 != 226) {
              goto LABEL_44;
            }
            CFStringRef v20 = @"mute";
          }
        }
        else if (v29 == 430)
        {
          CFStringRef v20 = @"layout";
        }
        else if (v29 == 433)
        {
          CFStringRef v20 = @"screensaver";
        }
        else
        {
          id v14 = 0;
          if (v29 != 545) {
            goto LABEL_44;
          }
          CFStringRef v20 = @"search";
        }
        goto LABEL_42;
      }
      if (v16)
      {
        if ([v16 originalType] == 1007)
        {
          CFStringRef v20 = @"volumeUp";
          goto LABEL_42;
        }
        if ([v16 originalType] == 1009)
        {
          CFStringRef v20 = @"volumeDown";
          goto LABEL_42;
        }
      }
      int v36 = [v15 keyCode];
      if ((v36 - 58) >= 0xC)
      {
        v28 = 0;
        CFStringRef v20 = @"enter";
        if (v36 > 73)
        {
          id v14 = 0;
          switch(v36)
          {
            case 'J':
              CFStringRef v20 = @"home";
              goto LABEL_42;
            case 'K':
              CFStringRef v20 = @"pageup";
              goto LABEL_42;
            case 'M':
              CFStringRef v20 = @"end";
              goto LABEL_42;
            case 'N':
              CFStringRef v20 = @"pagedown";
              goto LABEL_42;
            case 'O':
              CFStringRef v20 = @"right";
              goto LABEL_42;
            case 'P':
              CFStringRef v20 = @"left";
              goto LABEL_42;
            case 'Q':
              CFStringRef v20 = @"down";
              goto LABEL_42;
            case 'R':
              CFStringRef v20 = @"up";
              goto LABEL_42;
            case 'X':
              goto LABEL_42;
            default:
              goto LABEL_44;
          }
          goto LABEL_44;
        }
        if (v36 != 40)
        {
          if (v36 == 41)
          {
            CFStringRef v20 = @"escape";
          }
          else
          {
            id v14 = 0;
            if (v36 != 42) {
              goto LABEL_44;
            }
            CFStringRef v20 = @"backspace";
          }
        }
        goto LABEL_42;
      }
      CFStringRef v20 = +[NSString stringWithFormat:@"F%i", (v36 - 57)];
      if (v20)
      {
LABEL_42:
        v27 = +[NSString stringWithFormat:@"VOSKey.%@", v20];
        VOSLocString();
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
    }
    v28 = 0;
    id v14 = 0;
    goto LABEL_44;
  }
  char v18 = v17;
  id v14 = +[NSMutableString string];
  if ((v18 & 8) != 0)
  {
    v21 = VOSLocString();
    [v14 appendStringWithComma:v21];

    if ((v18 & 1) == 0)
    {
LABEL_13:
      if ((v18 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_28;
    }
  }
  else if ((v18 & 1) == 0)
  {
    goto LABEL_13;
  }
  v22 = VOSLocString();
  [v14 appendStringWithComma:v22];

  if ((v18 & 2) == 0)
  {
LABEL_14:
    if ((v18 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_29;
  }
LABEL_28:
  v23 = VOSLocString();
  [v14 appendStringWithComma:v23];

  if ((v18 & 4) == 0)
  {
LABEL_15:
    if ((v18 & 0x10) == 0) {
      goto LABEL_16;
    }
LABEL_30:
    v25 = VOSLocString();
    [v14 appendStringWithComma:v25];

    if ((v18 & 0x40) == 0) {
      goto LABEL_33;
    }
    goto LABEL_31;
  }
LABEL_29:
  v24 = VOSLocString();
  [v14 appendStringWithComma:v24];

  if ((v18 & 0x10) != 0) {
    goto LABEL_30;
  }
LABEL_16:
  if ((v18 & 0x40) == 0) {
    goto LABEL_33;
  }
LABEL_31:
  v26 = VOSLocString();
  [v14 appendStringWithComma:v26];

  if ([v15 isKeyboardSelectKey])
  {
    v27 = VOSLocString();
    [v14 appendStringWithComma:v27];
    CFStringRef v20 = 0;
LABEL_43:

    v28 = (__CFString *)v20;
    goto LABEL_44;
  }
LABEL_33:
  v28 = 0;
LABEL_44:
  if (![v14 length])
  {
    if ([v15 isControlKeyPressed]) {
      [v15 originalCharacters];
    }
    else {
    v30 = [v15 characters];
    }
    if ([v30 length])
    {
      if ([v30 length] == (id)1
        && (+[NSCharacterSet uppercaseLetterCharacterSet],
            v31 = objc_claimAutoreleasedReturnValue(),
            unsigned int v32 = objc_msgSend(v31, "characterIsMember:", objc_msgSend(v30, "characterAtIndex:", 0)),
            v31,
            v32))
      {
        uint64_t v33 = sub_100051804(off_1001EA9E8, @"CapitalLetterFormat", 0);
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v33, v30);
        id v34 = (id)objc_claimAutoreleasedReturnValue();

        id v14 = (id)v33;
      }
      else
      {
        id v34 = v30;
      }

      id v14 = v34;
    }
  }
LABEL_56:

  return v14;
}

- (id)_stringForBrailleGestureCommand:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:kVOTEventCommandNextElement] && self->_currentTypingMode == 1
    || [v4 isEqualToString:kVOTEventCommandPreviousElement] && !self->_currentTypingMode
    || [v4 isEqualToString:kVOTEventCommandPreviousElement]
    && self->_currentTypingMode == 1
    || [v4 isEqualToString:kVOTEventCommandNextElement] && !self->_currentTypingMode
    || ([v4 isEqualToString:kVOTEventCommandSearchRotorDown] & 1) != 0
    || ([v4 isEqualToString:kVOTEventCommandSearchRotorUp] & 1) != 0
    || [v4 isEqualToString:kVOTEventCommandMoveToLinkedUI]
    && self->_currentTypingMode == 1
    || [v4 isEqualToString:kVOTEventCommandCustomTwoFingerSwipeLeft]
    && !self->_currentTypingMode
    || ([v4 isEqualToString:kVOTEventCommandReadAll] & 1) != 0
    || ([v4 isEqualToString:kVOTEventCommandScrollLeftPage] & 1) != 0
    || ([v4 isEqualToString:kVOTEventCommandScrollRightPage] & 1) != 0
    || [v4 isEqualToString:kVOTEventCommandCustomTwoFingerSwipeLeft]
    && self->_currentTypingMode == 1
    || [v4 isEqualToString:kVOTEventCommandMoveToLinkedUI] && !self->_currentTypingMode
    || ([v4 isEqualToString:kVOTEventCommandScrollDownPage] & 1) != 0
    || ([v4 isEqualToString:kVOTEventCommandScrollUpPage] & 1) != 0
    || [v4 isEqualToString:kVOTEventCommandTracking])
  {
    id v5 = VOSLocString();
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)processHelpForEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 command];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (([v5 isEqualToString:kVOTEventCommandIdle] & 1) == 0
    && (![v5 isEqualToString:kVOTEventCommandTracking]
     || [(NSString *)self->_lastCommand isEqualToString:kVOTEventCommandTracking]
     || Current - self->_lastCommandOutputTime >= 1.5)
    && (![v5 isEqualToString:kVOTEventCommandSystemToggleQuickNote]
     || AXDeviceSupportsQuickNote()))
  {
    objc_super v7 = [v4 userCommandContext];
    if (v7)
    {
      uint64_t v31 = 0;
      unsigned int v32 = 0;
      uint64_t v30 = 0;
      id v8 = (id *)&v31;
      v9 = (id *)&v30;
      [(VOTCommandHelper *)self _processHelpForEvent:v4 userCommandContext:v7 commandHelpText:&v32 activationSpokenHelpText:&v31 activationDisplayedHelpText:&v30];
      unsigned __int8 v10 = v32;
    }
    else
    {
      uint64_t v28 = 0;
      int v29 = 0;
      uint64_t v27 = 0;
      id v8 = (id *)&v28;
      v9 = (id *)&v27;
      [(VOTCommandHelper *)self _processFallbackHelpForEvent:v4 command:v5 commandHelpText:&v29 activationSpokenHelpText:&v28 activationDisplayedHelpText:&v27];
      unsigned __int8 v10 = v29;
    }
    id v11 = v10;
    id v12 = *v8;
    v13 = (__CFString *)*v9;
    if (self->_practiceElement)
    {
      id v14 = objc_allocWithZone((Class)NSArray);
      if (v13) {
        CFStringRef v15 = v13;
      }
      else {
        CFStringRef v15 = &stru_1001B7888;
      }
      id v16 = objc_msgSend(v14, "initWithObjects:", v15, v11, v5, 0);
      [(VOTElement *)self->_practiceElement setGesturePracticeInfo:v16];
    }
    if (![v5 isEqualToString:self->_lastCommand]
      || (+[VOTOutputManager outputManager],
          unsigned int v17 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v18 = [v17 isSpeaking],
          v17,
          (v18 & 1) == 0))
    {
      id v19 = [objc_allocWithZone((Class)VOTOutputRequest) init];
      if ([v12 length]) {
        id v20 = [v19 addString:v12];
      }
      if ([v11 length]) {
        id v21 = [v19 addString:v11];
      }
      practiceElement = self->_practiceElement;
      if (practiceElement) {
        char v23 = ![(VOTElement *)practiceElement shouldSpeakHelpInGestureArea];
      }
      else {
        char v23 = 0;
      }
      if ([v19 containsActions] && (v23 & 1) == 0)
      {
        [v19 setGeneratesBraille:1];
        [v19 send];
      }
      objc_storeStrong((id *)&self->_lastCommand, v5);
      self->_lastCommandOutputTime = Current;
      if ([v5 isEqualToString:kVOTEventCommandStartHelp]
        && [v4 isTouchEvent]
        && !self->_practiceElement)
      {
        v24 = [(id)VOTSharedWorkspace selectedLanguage];
        v25 = sub_100051D04(off_1001EA9E8, @"stopping.help.mode", 0, v24);
        id v26 = sub_10000ABF8(v25, 2, v24);

        [(VOTCommandHelper *)self setHelpEnabled:0];
      }
    }
  }
}

- (void)_processHelpForEvent:(id)a3 userCommandContext:(id)a4 commandHelpText:(id *)a5 activationSpokenHelpText:(id *)a6 activationDisplayedHelpText:(id *)a7
{
  id v22 = a4;
  unsigned __int8 v10 = [v22 command];
  id v11 = [v10 localizedName];

  id v12 = [v22 gesture];

  if (v12)
  {
    v13 = [v22 gesture];
    id v14 = [v13 localizedName];

    CFStringRef v15 = [v22 gesture];
    uint64_t v16 = [v15 localizedName];
LABEL_5:
    unsigned __int8 v18 = (void *)v16;

    goto LABEL_6;
  }
  id v14 = [v22 keyChord];

  if (v14)
  {
    unsigned int v17 = [v22 keyChord];
    id v14 = [v17 displayValue];

    CFStringRef v15 = [v22 keyChord];
    uint64_t v16 = [v15 displayValue];
    goto LABEL_5;
  }
  unsigned __int8 v18 = 0;
LABEL_6:
  id v19 = v11;
  *a5 = v19;
  id v20 = v14;
  *a6 = v20;
  id v21 = v18;
  *a7 = v21;
}

- (void)_processFallbackHelpForEvent:(id)a3 command:(id)a4 commandHelpText:(id *)a5 activationSpokenHelpText:(id *)a6 activationDisplayedHelpText:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = +[AXSettings sharedInstance];
  id v15 = [v14 voiceOverHelpMode];

  if ([v13 isEqualToString:kVOTEventCommandTracking])
  {
    VOSLocString();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    VOSLocString();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v18 = v17;
LABEL_30:
    id v16 = v16;
    *a5 = v16;
    id v29 = v18;
    *a6 = v29;
    id v30 = v17;
    *a7 = v30;

    goto LABEL_31;
  }
  if ((unint64_t)v15 > 1)
  {
    if (v15 == (id)2)
    {
      id v16 = [(VOTCommandHelper *)self _stringForBrailleGestureCommand:v13];
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v19 = +[VOSCommand commandForVOSEventCommand:v13];
    id v16 = [v19 localizedName];
    if (![v16 length])
    {
      id v20 = VOTLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100121564((uint64_t)v19, (uint64_t)v13, v20);
      }
    }
  }
  if ([(id)VOTSharedWorkspace allowSingleLetterSearching]
    && [v12 isKeyEvent]
    && [v13 isEqualToString:kVOTEventCommandSingleLetterSearch])
  {
    id v21 = +[VOTKeyboardManager keyboardManager];
    id v22 = [v12 keyInfo];
    char v23 = [v21 singleLetterCommandForKeyInfo:v22];

    if (v23)
    {
      v24 = +[VOSCommand commandForVOSEventCommand:v23];
      v25 = [v24 localizedName];

      if (![v25 length])
      {
        id v26 = VOTLogCommon();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          int v31 = 138412802;
          unsigned int v32 = v24;
          __int16 v33 = 2112;
          id v34 = v13;
          __int16 v35 = 2112;
          int v36 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "No help text found for transformed command: '%@'. name: '%@' (actual: '%@')", (uint8_t *)&v31, 0x20u);
        }
      }
      id v16 = v25;
    }
  }
  if (![v13 length] || objc_msgSend(v16, "length") || objc_msgSend(v12, "isKeyEvent"))
  {
    id v27 = [v12 origin];
    if (v27 == (id)5)
    {
      uint64_t v28 = [v12 objectForIndex:105];
      unsigned __int8 v18 = [v28 componentsJoinedByString:@", "];
      id v17 = [v28 componentsJoinedByString:@" + "];
    }
    else if (v27 == (id)4)
    {
      unsigned __int8 v18 = [(VOTCommandHelper *)self _keyboardKeyStringForEvent:v12 spoken:1];
      id v17 = [(VOTCommandHelper *)self _keyboardKeyStringForEvent:v12 spoken:0];
    }
    else
    {
      id v17 = 0;
      unsigned __int8 v18 = 0;
    }
    goto LABEL_30;
  }
LABEL_31:
}

- (BOOL)_commandIsSupportedByTV:(id)a3
{
  uint64_t v3 = qword_1001EBA40;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1001EBA40, &stru_1001B60F8);
  }
  unsigned __int8 v5 = [(id)qword_1001EBA38 containsObject:v4];

  return v5 ^ 1;
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
}

- (VOTElement)practiceElement
{
  return self->_practiceElement;
}

- (void)setPracticeElement:(id)a3
{
}

- (CGRect)practiceRegion
{
  double x = self->_practiceRegion.origin.x;
  double y = self->_practiceRegion.origin.y;
  double width = self->_practiceRegion.size.width;
  double height = self->_practiceRegion.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPracticeRegion:(CGRect)a3
{
  self->_practiceRegion = a3;
}

- (BOOL)helpEnabled
{
  return self->_helpEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accelerometer, 0);
  objc_storeStrong((id *)&self->_lastCommand, 0);

  objc_storeStrong((id *)&self->_practiceElement, 0);
}

@end