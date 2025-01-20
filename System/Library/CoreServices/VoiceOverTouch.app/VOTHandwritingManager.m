@interface VOTHandwritingManager
+ (VOTHandwritingManager)sharedInstance;
- (AXDispatchTimer)announceCharacterModeTimer;
- (BOOL)isBackspaceEvent:(id)a3;
- (BOOL)isNextBrailleTableEvent:(id)a3;
- (BOOL)isNextKeyboardLanguageEvent:(id)a3;
- (BOOL)isNextSuggestionEvent:(id)a3;
- (BOOL)isPreviousSuggestionEvent:(id)a3;
- (BOOL)isReturnKeyEvent:(id)a3;
- (BOOL)isRotorDownEvent:(id)a3;
- (BOOL)isRotorLeftEvent:(id)a3;
- (BOOL)isRotorRightEvent:(id)a3;
- (BOOL)isRotorUpEvent:(id)a3;
- (BOOL)isSelectItemEvent:(id)a3;
- (BOOL)isSpaceEvent:(id)a3;
- (BOOL)isTextSelectionBackwardEvent:(id)a3;
- (BOOL)isTextSelectionForwardEvent:(id)a3;
- (BOOL)isWordBackspaceEvent:(id)a3;
- (BOOL)processEvent:(id)a3;
- (BOOL)processTapWithFingerCount:(unint64_t)a3;
- (CGPoint)_localizePoint:(CGPoint)a3 forOrientation:(int64_t)a4;
- (CHDrawing)recognitionCanvas;
- (CHRecognizer)recognitionEngine;
- (NSDictionary)replacements;
- (NSMutableOrderedSet)alternateSuggestions;
- (OS_dispatch_queue)engineAccessQueue;
- (VOTHandwritingManager)init;
- (double)_recognitionThresholdForCharacterMode;
- (id)_adjustRecognizedStringForActiveCharacterMode:(id)a3;
- (id)_characterModesForCharacterModeMask:(unint64_t)a3;
- (id)_characterSetForHandwritingMode:(unint64_t)a3;
- (id)_diacriticsForCharacter:(id)a3;
- (int)state;
- (int64_t)valueChangeOriginator;
- (unint64_t)allowedCharacterModes;
- (unint64_t)characterMode;
- (unint64_t)currentAlternateSuggestion;
- (void)_announceActiveCharacterMode;
- (void)_applyAlternateSuggestionToElement:(id)a3 inDirection:(BOOL)a4;
- (void)_nextActiveCharacterSet;
- (void)_previousActiveCharacterSet;
- (void)_promoteCommaToBeginningOfListIfNeeded:(id)a3;
- (void)_resetAlternateCharacterSuggestions;
- (void)_updateActiveCharacterSetFromCharacterMode:(unint64_t)a3 allowedCharacterModes:(unint64_t)a4 announceChange:(BOOL)a5;
- (void)addPointToSession:(CGPoint)a3;
- (void)announceActiveCharacterModeWithDelay:(BOOL)a3;
- (void)applyNextSuggestionToElement:(id)a3;
- (void)applyPreviousSuggestionToElement:(id)a3;
- (void)cancelAnnounceActiveCharacterMode;
- (void)dealloc;
- (void)endCurrentStroke;
- (void)recognizeAndResetSession;
- (void)resetSession;
- (void)setActive:(BOOL)a3;
- (void)setAllowedCharacterModes:(unint64_t)a3;
- (void)setAlternateSuggestions:(id)a3;
- (void)setAnnounceCharacterModeTimer:(id)a3;
- (void)setCharacterMode:(unint64_t)a3;
- (void)setCurrentAlternateSuggestion:(unint64_t)a3;
- (void)setEngineAccessQueue:(id)a3;
- (void)setRecognitionCanvas:(id)a3;
- (void)setRecognitionEngine:(id)a3;
- (void)setReplacements:(id)a3;
- (void)setState:(int)a3;
- (void)updateCharacterModesWithHandwritingAttributes:(id)a3;
@end

@implementation VOTHandwritingManager

+ (VOTHandwritingManager)sharedInstance
{
  if (qword_1001EBCA0 != -1) {
    dispatch_once(&qword_1001EBCA0, &stru_1001B6F50);
  }
  v2 = (void *)qword_1001EBC98;

  return (VOTHandwritingManager *)v2;
}

- (VOTHandwritingManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)VOTHandwritingManager;
  v2 = [(VOTGesturedTextInputManager *)&v20 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("handwiting-access-queue", 0);
    [(VOTHandwritingManager *)v2 setEngineAccessQueue:v3];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v4 = (void *)qword_1001EBCC8;
    uint64_t v25 = qword_1001EBCC8;
    if (!qword_1001EBCC8)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1001067E0;
      v21[3] = &unk_1001B3FE0;
      v21[4] = &v22;
      sub_1001067E0((uint64_t)v21);
      v4 = (void *)v23[3];
    }
    v5 = v4;
    _Block_object_dispose(&v22, 8);
    id v6 = objc_alloc_init(v5);
    [(VOTHandwritingManager *)v2 setRecognitionCanvas:v6];
    v7 = [(VOTHandwritingManager *)v2 engineAccessQueue];
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_100103FF4;
    v18 = &unk_1001B33B8;
    v8 = v2;
    v19 = v8;
    dispatch_async(v7, &v15);

    id v9 = objc_alloc((Class)AXDispatchTimer);
    id v10 = objc_msgSend(v9, "initWithTargetSerialQueue:", &_dispatch_main_q, v15, v16, v17, v18);
    [(VOTHandwritingManager *)v8 setAnnounceCharacterModeTimer:v10];
    v11 = +[NSBundle mainBundle];
    v12 = [v11 pathForResource:@"VOTHandwritingReplacements" ofType:@"plist"];

    v13 = +[NSDictionary dictionaryWithContentsOfFile:v12];
    [(VOTHandwritingManager *)v8 setReplacements:v13];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"VOTRotorChangedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)VOTHandwritingManager;
  [(VOTHandwritingManager *)&v4 dealloc];
}

- (void)endCurrentStroke
{
  id v2 = [(VOTHandwritingManager *)self recognitionCanvas];
  [v2 endStroke];
}

- (void)addPointToSession:(CGPoint)a3
{
  -[VOTHandwritingManager _localizePoint:forOrientation:](self, "_localizePoint:forOrientation:", [(id)VOTSharedWorkspace deviceOrientation], a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  v8 = [(VOTHandwritingManager *)self recognitionCanvas];
  objc_msgSend(v8, "addPoint:", v5, v7);

  id v9 = [(VOTHandwritingManager *)self recognitionCanvas];
  id v10 = [v9 pointCount];

  if (!v10)
  {
    [(VOTHandwritingManager *)self cancelAnnounceActiveCharacterMode];
  }
}

- (CHRecognizer)recognitionEngine
{
  return self->_recognitionEngine;
}

- (double)_recognitionThresholdForCharacterMode
{
  return dbl_10016EAA0[(([(VOTHandwritingManager *)self characterMode] - 4) & 0xFFFFFFFFFFFFFFFBLL) == 0];
}

- (void)recognizeAndResetSession
{
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = sub_100104BE0;
  v66 = sub_100104BF0;
  id v67 = 0;
  [(VOTHandwritingManager *)self _resetAlternateCharacterSuggestions];
  dispatch_queue_t v3 = [(VOTHandwritingManager *)self recognitionCanvas];
  BOOL v4 = (unint64_t)[v3 pointCount] < 5;

  if (v4)
  {
    if ((id)[(VOTHandwritingManager *)self characterMode] != (id)8) {
      goto LABEL_44;
    }
    double v5 = (void *)v63[5];
    v63[5] = @".";

    +[NSMutableOrderedSet orderedSetWithObjects:](NSMutableOrderedSet, "orderedSetWithObjects:", @".", @",", @";",
      @"'",
      @"\"",
    double v6 = 0);
    [(VOTHandwritingManager *)self setAlternateSuggestions:v6];
  }
  else
  {
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x3032000000;
    v59 = sub_100104BE0;
    v60 = sub_100104BF0;
    id v61 = 0;
    double v7 = [(VOTHandwritingManager *)self engineAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100104BF8;
    block[3] = &unk_1001B67F8;
    block[4] = self;
    block[5] = &v56;
    dispatch_sync(v7, block);

    v8 = +[NSMutableArray array];
    id v9 = VOTLogHandwriting();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

    if (v10)
    {
      v11 = VOTLogHandwriting();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_100124350(v11);
      }

      long long v53 = 0u;
      long long v54 = 0u;
      long long v52 = 0u;
      long long v51 = 0u;
      id v12 = (id)v57[5];
      id v13 = [v12 countByEnumeratingWithState:&v51 objects:v75 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v52;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v52 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            v17 = VOTLogHandwriting();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v18 = [v16 string];
              [v16 score];
              v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              *(_DWORD *)buf = 134218499;
              v70 = v16;
              __int16 v71 = 2113;
              v72 = v18;
              __int16 v73 = 2114;
              v74 = v19;
              _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "  result<%p>:%{private}@ score:%{public}@", buf, 0x20u);
            }
          }
          id v13 = [v12 countByEnumeratingWithState:&v51 objects:v75 count:16];
        }
        while (v13);
      }
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v20 = (id)v57[5];
    id v21 = [v20 countByEnumeratingWithState:&v47 objects:v68 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v48;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v48 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
          [v24 score];
          double v26 = v25;
          [(VOTHandwritingManager *)self _recognitionThresholdForCharacterMode];
          if (v26 >= v27)
          {
            v28 = [v24 string];
            BOOL v29 = (unint64_t)[v28 length] > 1;

            if (v29)
            {
              v44 = [v24 string];
              _AXAssert();
            }
            v30 = objc_msgSend(v24, "string", v44);
            [v8 addObject:v30];
          }
        }
        id v21 = [v20 countByEnumeratingWithState:&v47 objects:v68 count:16];
      }
      while (v21);
    }

    [(VOTHandwritingManager *)self _promoteCommaToBeginningOfListIfNeeded:v8];
    if ([v8 count])
    {
      uint64_t v31 = [v8 objectAtIndex:0];
      v32 = (void *)v63[5];
      v63[5] = v31;

      v33 = +[NSMutableOrderedSet orderedSetWithObject:v63[5]];
      [(VOTHandwritingManager *)self setAlternateSuggestions:v33];

      v34 = [(VOTHandwritingManager *)self alternateSuggestions];
      [v34 addObjectsFromArray:v8];

      uint64_t v35 = [(VOTHandwritingManager *)self _adjustRecognizedStringForActiveCharacterMode:v63[5]];
      v36 = (void *)v63[5];
      v63[5] = v35;
    }
    if (v63[5])
    {
      v37 = -[VOTHandwritingManager _diacriticsForCharacter:](self, "_diacriticsForCharacter:");
      if ([v37 count])
      {
        v38 = [(VOTHandwritingManager *)self alternateSuggestions];
        BOOL v39 = [v38 count] == 0;

        if (v39)
        {
          v40 = +[NSMutableOrderedSet orderedSetWithArray:v37];
          [(VOTHandwritingManager *)self setAlternateSuggestions:v40];
        }
        else
        {
          v40 = [(VOTHandwritingManager *)self alternateSuggestions];
          [v40 addObjectsFromArray:v37];
        }
      }
    }

    _Block_object_dispose(&v56, 8);
  }
  if ([(id)v63[5] length])
  {
    unsigned __int16 v41 = (unsigned __int16)[(id)v63[5] characterAtIndex:0];
    v42 = [(VOTHandwritingManager *)self engineAccessQueue];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100104CAC;
    v45[3] = &unk_1001B6FB8;
    unsigned __int16 v46 = v41;
    v45[4] = self;
    v45[5] = &v62;
    dispatch_sync(v42, v45);
  }
  if (v63[5])
  {
    -[VOTGesturedTextInputManager appendString:](self, "appendString:");
  }
  else
  {
    v43 = sub_100051804(off_1001EA9E8, @"handwrite.notrecognized", 0);
    +[VOTOutputRequest sendRequestWithString:v43];
  }
  [(VOTHandwritingManager *)self resetSession];
LABEL_44:
  _Block_object_dispose(&v62, 8);
}

- (void)resetSession
{
  dispatch_queue_t v3 = [(VOTHandwritingManager *)self recognitionCanvas];
  [v3 clear];

  [(VOTHandwritingManager *)self setState:0];
}

- (BOOL)processEvent:(id)a3
{
  id v4 = a3;
  if ([(VOTHandwritingManager *)self state] == 4)
  {
    double v5 = [v4 command];
    if ([v5 isEqualToString:kVOTEventCommandSimpleTap])
    {
    }
    else
    {
      double v6 = [v4 command];
      unsigned int v7 = [v6 isEqualToString:kVOTEventCommandGesturedTextInputLaunchApp];

      if (!v7) {
        goto LABEL_18;
      }
    }
  }
  v8 = [v4 command];
  unsigned int v9 = [v8 isEqualToString:kVOTEventCommandHandwritingNextActiveCharacterSet];

  if (!v9)
  {
    BOOL v10 = [v4 command];
    unsigned int v11 = [v10 isEqualToString:kVOTEventCommandHandwritingPreviousActiveCharacterSet];

    if (v11)
    {
      [(VOTHandwritingManager *)self _previousActiveCharacterSet];
      goto LABEL_16;
    }
    id v12 = [v4 command];
    unsigned int v13 = [v12 isEqualToString:kVOTEventCommandHandwritingAnnounceActiveCharacterSet];

    if (v13)
    {
      [(VOTHandwritingManager *)self _announceActiveCharacterMode];
      goto LABEL_16;
    }
    v16.receiver = self;
    v16.super_class = (Class)VOTHandwritingManager;
    if ([(VOTGesturedTextInputManager *)&v16 processEvent:v4])
    {
      if ([(VOTHandwritingManager *)self isSpaceEvent:v4]
        || [(VOTHandwritingManager *)self isBackspaceEvent:v4]
        || [(VOTHandwritingManager *)self isReturnKeyEvent:v4])
      {
        [(VOTHandwritingManager *)self _resetAlternateCharacterSuggestions];
      }
      goto LABEL_16;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_17;
  }
  [(VOTHandwritingManager *)self _nextActiveCharacterSet];
LABEL_16:
  BOOL v14 = 1;
LABEL_17:

  return v14;
}

- (void)announceActiveCharacterModeWithDelay:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(VOTHandwritingManager *)self announceCharacterModeTimer];
    [v4 cancel];

    double v5 = [(VOTHandwritingManager *)self announceCharacterModeTimer];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10010508C;
    v6[3] = &unk_1001B33B8;
    v6[4] = self;
    [v5 afterDelay:v6 processBlock:1.0];
  }
  else
  {
    [(VOTHandwritingManager *)self _announceActiveCharacterMode];
  }
}

- (void)cancelAnnounceActiveCharacterMode
{
  id v2 = [(VOTHandwritingManager *)self announceCharacterModeTimer];
  [v2 cancel];
}

- (void)updateCharacterModesWithHandwritingAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [v4 preferredCharacterSet];
  id v6 = [v4 allowedCharacterSets];

  [(VOTHandwritingManager *)self _updateActiveCharacterSetFromCharacterMode:v5 allowedCharacterModes:v6 announceChange:0];
}

- (int64_t)valueChangeOriginator
{
  return 4;
}

- (BOOL)processTapWithFingerCount:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VOTHandwritingManager;
  BOOL result = -[VOTGesturedTextInputManager processTapWithFingerCount:](&v5, "processTapWithFingerCount:");
  if (a3 == 3) {
    return 0;
  }
  return result;
}

- (BOOL)isSpaceEvent:(id)a3
{
  dispatch_queue_t v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputInsertSpace];

  return v4;
}

- (BOOL)isBackspaceEvent:(id)a3
{
  dispatch_queue_t v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputBackspace];

  return v4;
}

- (BOOL)isWordBackspaceEvent:(id)a3
{
  dispatch_queue_t v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputDeleteWord];

  return v4;
}

- (BOOL)isReturnKeyEvent:(id)a3
{
  dispatch_queue_t v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputPerformReturnEquivalent];

  return v4;
}

- (BOOL)isNextSuggestionEvent:(id)a3
{
  dispatch_queue_t v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputNextSuggestion];

  return v4;
}

- (BOOL)isPreviousSuggestionEvent:(id)a3
{
  dispatch_queue_t v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputPreviousSuggestion];

  return v4;
}

- (BOOL)isSelectItemEvent:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 command];
  if ([v4 isEqualToString:kVOTEventCommandSimpleTap])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [v3 command];
    unsigned __int8 v5 = [v6 isEqualToString:kVOTEventCommandGesturedTextInputLaunchApp];
  }
  return v5;
}

- (BOOL)isNextKeyboardLanguageEvent:(id)a3
{
  id v3 = [a3 command];
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputNextKeyboardLanguage];

  return v4;
}

- (BOOL)isNextBrailleTableEvent:(id)a3
{
  return 0;
}

- (void)applyPreviousSuggestionToElement:(id)a3
{
}

- (void)applyNextSuggestionToElement:(id)a3
{
}

- (BOOL)isRotorDownEvent:(id)a3
{
  return 0;
}

- (BOOL)isRotorLeftEvent:(id)a3
{
  return 0;
}

- (BOOL)isRotorRightEvent:(id)a3
{
  return 0;
}

- (BOOL)isRotorUpEvent:(id)a3
{
  return 0;
}

- (BOOL)isTextSelectionBackwardEvent:(id)a3
{
  return 0;
}

- (BOOL)isTextSelectionForwardEvent:(id)a3
{
  return 0;
}

- (id)_diacriticsForCharacter:(id)a3
{
  id v3 = a3;
  if (qword_1001EBCA8 != -1) {
    dispatch_once(&qword_1001EBCA8, &stru_1001B6FD8);
  }
  unsigned __int8 v4 = sub_100105890();

  if (v4)
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    unsigned __int8 v5 = (void (*)(void))off_1001EBCF8;
    uint64_t v24 = off_1001EBCF8;
    if (!off_1001EBCF8)
    {
      id v6 = (void *)sub_100106A50();
      v22[3] = (uint64_t)dlsym(v6, "UIKeyboardGetCurrentInputMode");
      off_1001EBCF8 = (_UNKNOWN *)v22[3];
      unsigned __int8 v5 = (void (*)(void))v22[3];
    }
    _Block_object_dispose(&v21, 8);
    if (!v5) {
      sub_1001243D8();
    }
    v5();
    unsigned int v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInputModeController"];
      unsigned int v9 = [v8 safeValueForKey:@"suggestedInputModesForPreferredLanguages"];
      BOOL v10 = [v9 firstObject];
      unsigned int v11 = __UIAccessibilitySafeClass();

      uint64_t v12 = [v11 safeValueForKey:@"identifier"];
      if (v12) {
        unsigned int v7 = (__CFString *)v12;
      }
      else {
        unsigned int v7 = @"en_US@hw=US;sw=QWERTY";
      }
    }
    id v13 = v3;
    BOOL v14 = v7;
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    v15 = (void (*)(id, NSObject *, uint64_t))off_1001EBD00;
    uint64_t v24 = off_1001EBD00;
    if (!off_1001EBD00)
    {
      objc_super v16 = (void *)sub_100106A50();
      v22[3] = (uint64_t)dlsym(v16, "UIKeyboardRomanAccentVariants");
      off_1001EBD00 = (_UNKNOWN *)v22[3];
      v15 = (void (*)(id, NSObject *, uint64_t))v22[3];
    }
    _Block_object_dispose(&v21, 8);
    if (!v15) {
      sub_100124450();
    }
    v17 = v15(v13, v14, 7);

    v18 = sub_100105890();
    v19 = [v17 objectForKey:v18];
  }
  else
  {
    BOOL v14 = VOTLogHandwriting();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100124394(v14);
    }
    v19 = 0;
  }

  return v19;
}

- (void)_promoteCommaToBeginningOfListIfNeeded:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    id v3 = [v5 objectAtIndex:0];
    id v4 = objc_msgSend(@"?>%"), "rangeOfString:", v3);

    if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v5 removeObject:@","];
      [v5 insertObject:@"," atIndex:0];
    }
  }
}

- (void)_resetAlternateCharacterSuggestions
{
  [(VOTHandwritingManager *)self setCurrentAlternateSuggestion:0];

  [(VOTHandwritingManager *)self setAlternateSuggestions:0];
}

- (void)_announceActiveCharacterMode
{
  unint64_t v2 = [(VOTHandwritingManager *)self characterMode];
  switch(v2)
  {
    case 2uLL:
      id v3 = off_1001EA9E8;
      id v4 = @"handwrite.uppercase";
      break;
    case 8uLL:
      id v3 = off_1001EA9E8;
      id v4 = @"handwrite.symbols";
      break;
    case 4uLL:
      id v3 = off_1001EA9E8;
      id v4 = @"handwrite.numbers";
      break;
    default:
      id v3 = off_1001EA9E8;
      id v4 = @"handwrite.lowercase";
      break;
  }
  sub_100051804(v3, v4, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  +[VOTOutputRequest sendRequestWithString:](VOTOutputRequest, "sendRequestWithString:");
}

- (void)_applyAlternateSuggestionToElement:(id)a3 inDirection:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  id v6 = [(VOTHandwritingManager *)self alternateSuggestions];
  unsigned int v7 = (char *)[v6 count];

  if (v7)
  {
    unint64_t v8 = [(VOTHandwritingManager *)self currentAlternateSuggestion];
    unsigned int v9 = (char *)(v8 - 1);
    if (!v8) {
      unsigned int v9 = v7 - 1;
    }
    if ((char *)v8 == v7 - 1) {
      unint64_t v10 = 0;
    }
    else {
      unint64_t v10 = v8 + 1;
    }
    if (v4) {
      unsigned int v11 = (char *)v10;
    }
    else {
      unsigned int v11 = v9;
    }
    uint64_t v12 = [(VOTHandwritingManager *)self alternateSuggestions];
    id v13 = [v12 objectAtIndex:v11];

    [v15 replaceCharactersAtCursor:1 withString:v13 source:4];
    +[VOTOutputRequest sendRequestWithString:v13];
    [(VOTHandwritingManager *)self setCurrentAlternateSuggestion:v11];
  }
  else
  {
    id v13 = +[VOTOutputManager outputManager];
    BOOL v14 = +[VOSOutputEvent BoundaryEncountered];
    [v13 sendEvent:v14];
  }
}

- (id)_characterModesForCharacterModeMask:(unint64_t)a3
{
  char v3 = a3;
  BOOL v4 = +[NSMutableArray array];
  id v5 = v4;
  if (v3)
  {
    [v4 addObject:&off_1001C63B8];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:&off_1001C63D0];
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v5 addObject:&off_1001C63E8];
  if ((v3 & 8) != 0) {
LABEL_5:
  }
    [v5 addObject:&off_1001C6400];
LABEL_6:

  return v5;
}

- (id)_characterSetForHandwritingMode:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      BOOL v4 = +[NSLocale localeWithLocaleIdentifier:@"en_US"];
      id v5 = [v4 objectForKey:NSLocaleExemplarCharacterSet];
      id v6 = [v5 mutableCopy];

      uint64_t v7 = +[NSCharacterSet uppercaseLetterCharacterSet];
      break;
    case 8uLL:
      uint64_t v3 = +[AXLanguageManager commonPunctuationCharacters];
      goto LABEL_7;
    case 4uLL:
      uint64_t v3 = +[NSCharacterSet decimalDigitCharacterSet];
LABEL_7:
      id v6 = (id)v3;
      goto LABEL_10;
    default:
      BOOL v4 = +[NSLocale localeWithLocaleIdentifier:@"en_US"];
      unint64_t v8 = [v4 objectForKey:NSLocaleExemplarCharacterSet];
      id v6 = [v8 mutableCopy];

      uint64_t v7 = +[NSCharacterSet lowercaseLetterCharacterSet];
      break;
  }
  unsigned int v9 = (void *)v7;
  [v6 formIntersectionWithCharacterSet:v7];

LABEL_10:

  return v6;
}

- (void)_updateActiveCharacterSetFromCharacterMode:(unint64_t)a3 allowedCharacterModes:(unint64_t)a4 announceChange:(BOOL)a5
{
  BOOL v5 = a5;
  if (!a4) {
    _AXAssert();
  }
  [(VOTHandwritingManager *)self setAllowedCharacterModes:a4];
  unsigned int v9 = [(VOTHandwritingManager *)self _characterModesForCharacterModeMask:a4];
  if ((a3 & ~a4) != 0)
  {
    unint64_t v10 = VOTLogHandwriting();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Preferred handwriting character mode (%lu) is not among allowed character modes. Choosing a suitable substitue", buf, 0xCu);
    }

    unsigned int v11 = [v9 firstObject];
    a3 = (int)[v11 intValue];
  }
  [(VOTHandwritingManager *)self setCharacterMode:a3];
  uint64_t v12 = [(VOTHandwritingManager *)self engineAccessQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100106014;
  v13[3] = &unk_1001B35D0;
  v13[4] = self;
  v13[5] = a3;
  dispatch_sync(v12, v13);

  if (v5) {
    [(VOTHandwritingManager *)self _announceActiveCharacterMode];
  }
}

- (void)_previousActiveCharacterSet
{
  id v8 = +[NSNumber numberWithUnsignedInteger:[(VOTHandwritingManager *)self characterMode]];
  uint64_t v3 = [(VOTHandwritingManager *)self _characterModesForCharacterModeMask:[(VOTHandwritingManager *)self allowedCharacterModes]];
  unint64_t v4 = [(VOTHandwritingManager *)self characterMode];
  BOOL v5 = (char *)[v3 indexOfObject:v8];
  if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v5;
    if ((unint64_t)[v3 count] >= 2)
    {
      if (v6) {
        [v3 objectAtIndex:v6 - 1];
      }
      else {
      uint64_t v7 = [v3 lastObject];
      }
      unint64_t v4 = (int)[v7 intValue];
    }
  }
  [(VOTHandwritingManager *)self _updateActiveCharacterSetFromCharacterMode:v4 allowedCharacterModes:[(VOTHandwritingManager *)self allowedCharacterModes] announceChange:1];
}

- (void)_nextActiveCharacterSet
{
  id v8 = +[NSNumber numberWithUnsignedInteger:[(VOTHandwritingManager *)self characterMode]];
  uint64_t v3 = [(VOTHandwritingManager *)self _characterModesForCharacterModeMask:[(VOTHandwritingManager *)self allowedCharacterModes]];
  unint64_t v4 = [(VOTHandwritingManager *)self characterMode];
  BOOL v5 = [v3 indexOfObject:v8];
  if (v5 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v5;
    if ((unint64_t)[v3 count] >= 2)
    {
      if (v6 == (char *)[v3 count] - 1) {
        [v3 firstObject];
      }
      else {
      uint64_t v7 = [v3 objectAtIndex:v6 + 1];
      }
      unint64_t v4 = (int)[v7 intValue];
    }
  }
  [(VOTHandwritingManager *)self _updateActiveCharacterSetFromCharacterMode:v4 allowedCharacterModes:[(VOTHandwritingManager *)self allowedCharacterModes] announceChange:1];
}

- (id)_adjustRecognizedStringForActiveCharacterMode:(id)a3
{
  id v4 = a3;
  BOOL v5 = 0;
  id v6 = v4;
  switch([(VOTHandwritingManager *)self characterMode])
  {
    case 1uLL:
      uint64_t v7 = [(VOTHandwritingManager *)self replacements];
      BOOL v5 = [v7 objectForKey:@"lowercase"];

      id v6 = [v5 objectForKey:v4];

      if (v6) {
        id v8 = v6;
      }
      else {
        id v8 = v4;
      }
      uint64_t v15 = [v8 lowercaseString];
      goto LABEL_14;
    case 2uLL:
      unsigned int v9 = [(VOTHandwritingManager *)self replacements];
      BOOL v5 = [v9 objectForKey:@"uppercase"];

      id v6 = [v5 objectForKey:v4];

      if (v6) {
        unint64_t v10 = v6;
      }
      else {
        unint64_t v10 = v4;
      }
      uint64_t v15 = [v10 uppercaseString];
LABEL_14:
      id v14 = (id)v15;
      goto LABEL_15;
    case 4uLL:
      unsigned int v11 = [(VOTHandwritingManager *)self replacements];
      uint64_t v12 = v11;
      CFStringRef v13 = @"numbers";
      goto LABEL_8;
    case 8uLL:
      unsigned int v11 = [(VOTHandwritingManager *)self replacements];
      uint64_t v12 = v11;
      CFStringRef v13 = @"punctuation";
LABEL_8:
      BOOL v5 = [v11 objectForKey:v13];

      id v6 = [v5 objectForKey:v4];

      if (v6)
      {
        id v14 = v6;
        id v6 = v14;
LABEL_15:

        id v4 = v14;
      }
      break;
    default:
      break;
  }
  id v16 = v4;

  return v16;
}

- (CGPoint)_localizePoint:(CGPoint)a3 forOrientation:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  if (qword_1001EBCC0 != -1) {
    dispatch_once(&qword_1001EBCC0, &stru_1001B6FF8);
  }
  switch(a4)
  {
    case 2:
      double v7 = *((double *)&xmmword_1001EBCB0 + 1) - y;
      double y = *(double *)&xmmword_1001EBCB0 - x;
      break;
    case 4:
      double y = *((double *)&xmmword_1001EBCB0 + 1) - y;
      double v7 = x;
      break;
    case 3:
      double v7 = *(double *)&xmmword_1001EBCB0 - x;
      break;
    default:
      double v7 = y;
      double y = x;
      break;
  }
  double v8 = y;
  result.double y = v7;
  result.double x = v8;
  return result;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(VOTGesturedTextInputManager *)self isActive];
  v7.receiver = self;
  v7.super_class = (Class)VOTHandwritingManager;
  [(VOTGesturedTextInputManager *)&v7 setActive:v3];
  if (!v5 || v3)
  {
    if (!(!v3 | v5)) {
      [(VOTHandwritingManager *)self _resetAlternateCharacterSuggestions];
    }
  }
  else
  {
    id v6 = [(VOTHandwritingManager *)self announceCharacterModeTimer];
    [v6 cancel];
  }
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (CHDrawing)recognitionCanvas
{
  return self->_recognitionCanvas;
}

- (void)setRecognitionCanvas:(id)a3
{
}

- (void)setRecognitionEngine:(id)a3
{
}

- (unint64_t)characterMode
{
  return self->_characterMode;
}

- (void)setCharacterMode:(unint64_t)a3
{
  self->_characterMode = a3;
}

- (unint64_t)allowedCharacterModes
{
  return self->_allowedCharacterModes;
}

- (void)setAllowedCharacterModes:(unint64_t)a3
{
  self->_allowedCharacterModes = a3;
}

- (AXDispatchTimer)announceCharacterModeTimer
{
  return self->_announceCharacterModeTimer;
}

- (void)setAnnounceCharacterModeTimer:(id)a3
{
}

- (NSDictionary)replacements
{
  return self->_replacements;
}

- (void)setReplacements:(id)a3
{
}

- (NSMutableOrderedSet)alternateSuggestions
{
  return self->_alternateSuggestions;
}

- (void)setAlternateSuggestions:(id)a3
{
}

- (unint64_t)currentAlternateSuggestion
{
  return self->_currentAlternateSuggestion;
}

- (void)setCurrentAlternateSuggestion:(unint64_t)a3
{
  self->_currentAlternateSuggestion = a3;
}

- (OS_dispatch_queue)engineAccessQueue
{
  return self->_engineAccessQueue;
}

- (void)setEngineAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engineAccessQueue, 0);
  objc_storeStrong((id *)&self->_alternateSuggestions, 0);
  objc_storeStrong((id *)&self->_replacements, 0);
  objc_storeStrong((id *)&self->_announceCharacterModeTimer, 0);
  objc_storeStrong((id *)&self->_recognitionEngine, 0);

  objc_storeStrong((id *)&self->_recognitionCanvas, 0);
}

@end