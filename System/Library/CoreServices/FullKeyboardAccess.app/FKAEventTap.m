@interface FKAEventTap
- (AXEventProcessor)eventProcessor;
- (BOOL)_handleEventRepresentation:(id)a3;
- (FKAEventTap)init;
- (FKAEventTapDelegate)delegate;
- (NSMutableDictionary)keyCodesToBackupUnicodeCharacters;
- (NSMutableDictionary)keyCodesToDownEventRepresentations;
- (NSMutableDictionary)keyCodesToUnicodeCharacters;
- (NSMutableSet)keyCodesRequiringRepostForUpEvent;
- (id)_keyboardEventForEventRepresentation:(id)a3;
- (void)_repostEventRepresentation:(id)a3;
- (void)_updateForContinuityStateChange;
- (void)dealloc;
- (void)repostDownAndUpForKeyboardEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKeyCodesRequiringRepostForUpEvent:(id)a3;
@end

@implementation FKAEventTap

- (FKAEventTap)init
{
  v21.receiver = self;
  v21.super_class = (Class)FKAEventTap;
  v2 = [(FKAEventTap *)&v21 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    uint64_t v3 = +[NSMutableDictionary dictionary];
    keyCodesToUnicodeCharacters = v2->_keyCodesToUnicodeCharacters;
    v2->_keyCodesToUnicodeCharacters = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    keyCodesToBackupUnicodeCharacters = v2->_keyCodesToBackupUnicodeCharacters;
    v2->_keyCodesToBackupUnicodeCharacters = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    keyCodesToDownEventRepresentations = v2->_keyCodesToDownEventRepresentations;
    v2->_keyCodesToDownEventRepresentations = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableSet set];
    keyCodesRequiringRepostForUpEvent = v2->_keyCodesRequiringRepostForUpEvent;
    v2->_keyCodesRequiringRepostForUpEvent = (NSMutableSet *)v9;

    +[AXEventKeyInfoRepresentation prepareForKeycodeTranslation];
    v11 = (AXEventProcessor *)[objc_alloc((Class)AXEventProcessor) initWithHIDTapIdentifier:@"FKAEventTap" HIDEventTapPriority:20 systemEventTapIdentifier:0 systemEventTapPriority:0];
    eventProcessor = v2->_eventProcessor;
    v2->_eventProcessor = v11;

    [(AXEventProcessor *)v2->_eventProcessor setHIDEventFilterMask:2];
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_10000412C;
    v18 = &unk_100024750;
    objc_copyWeak(&v19, &location);
    [(AXEventProcessor *)v2->_eventProcessor setHIDEventHandler:&v15];
    [(AXEventProcessor *)v2->_eventProcessor beginHandlingHIDEventsForReason:@"FKAEventTap", v15, v16, v17, v18];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100004180, kAXSContinuityDisplayStateChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(FKAEventTap *)v2 _updateForContinuityStateChange];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(AXEventProcessor *)self->_eventProcessor endHandlingHIDEventsForReason:@"FKAEventTap"];
  [(AXEventProcessor *)self->_eventProcessor cleanup];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)FKAEventTap;
  [(FKAEventTap *)&v4 dealloc];
}

- (BOOL)_handleEventRepresentation:(id)a3
{
  id v4 = a3;
  if ([v4 senderID] == (id)0x8000000817319378
    || ([v4 keyInfo], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, !v5)
    || [v4 senderID] == (id)0x8000000817319373)
  {
    BOOL v6 = 0;
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100004350;
    v8[3] = &unk_100024778;
    v8[4] = self;
    id v9 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

    BOOL v6 = 1;
  }

  return v6;
}

- (void)repostDownAndUpForKeyboardEvent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v6 = FKALogCommon();
  uint64_t v7 = v6;
  if (isKindOfClass)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Reposting %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v7 = v4;
    if (([v7 isDownEvent] & 1) == 0)
    {
      v8 = [(FKAEventTap *)self keyCodesToDownEventRepresentations];
      id v9 = +[NSNumber numberWithUnsignedInteger:[v7 keyCode]];
      v10 = [v8 objectForKeyedSubscript:v9];

      [(FKAEventTap *)self _repostEventRepresentation:v10];
    }
    v11 = [v7 eventRepresentation];
    [(FKAEventTap *)self _repostEventRepresentation:v11];

    if ([v7 isDownEvent])
    {
      v12 = [(FKAEventTap *)self keyCodesRequiringRepostForUpEvent];
      v13 = +[NSNumber numberWithUnsignedInteger:[v7 keyCode]];
      [v12 addObject:v13];
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10001460C((uint64_t)v4, v7);
  }
}

- (void)_repostEventRepresentation:(id)a3
{
  id v4 = [a3 copy];
  [v4 setUseOriginalHIDTime:1];
  uint64_t v3 = +[AXEventTapManager sharedManager];
  [v3 sendHIDSystemEvent:v4 senderID:0x8000000817319378];
}

- (id)_keyboardEventForEventRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 keyInfo];
  BOOL v6 = [v4 keyInfo];

  if (v6)
  {
    if (v5)
    {
LABEL_3:
      [v5 translateKeycode];
      uint64_t v7 = [v5 keyCode];
      id v8 = [v5 keyDown];
      id v9 = objc_opt_new();
      [v9 setEventRepresentation:v4];
      [v9 setKeyCode:v7];
      [v9 setIsDownEvent:v8];
      unsigned int v10 = [v5 gsModifierState];
      [v9 setIsLeftCommandDown:HIWORD(v10) & 1];
      [v9 setIsRightCommandDown:HIBYTE(v10) & 1];
      [v9 setIsLeftOptionDown:(v10 >> 19) & 1];
      [v9 setIsRightOptionDown:(v10 >> 22) & 1];
      [v9 setIsLeftControlDown:(v10 >> 20) & 1];
      [v9 setIsRightControlDown:(v10 >> 23) & 1];
      [v9 setIsLeftShiftDown:(v10 >> 17) & 1];
      [v9 setIsRightShiftDown:(v10 >> 21) & 1];
      objc_msgSend(v9, "setIsFnDown:", (objc_msgSend(v5, "modifierState") >> 6) & 1);
      v11 = +[NSNumber numberWithUnsignedInteger:v7];
      if (v8)
      {
        v12 = [v5 unmodifiedInput];
        v13 = [v5 backupUnmodifiedInput];
        int v14 = [(FKAEventTap *)self keyCodesToUnicodeCharacters];
        [v14 setObject:v12 forKeyedSubscript:v11];

        id v15 = [(FKAEventTap *)self keyCodesToBackupUnicodeCharacters];
        [v15 setObject:v13 forKeyedSubscript:v11];

        uint64_t v16 = [(FKAEventTap *)self keyCodesToDownEventRepresentations];
        [v16 setObject:v4 forKeyedSubscript:v11];
      }
      else
      {
        v18 = [(FKAEventTap *)self keyCodesToUnicodeCharacters];
        v12 = [v18 objectForKeyedSubscript:v11];

        uint64_t v16 = [(FKAEventTap *)self keyCodesToBackupUnicodeCharacters];
        v13 = [v16 objectForKeyedSubscript:v11];
      }

      [v9 setUnicodeCharacter:v12];
      [v9 setBackupUnicodeCharacter:v13];
      [v9 setIsRepeatEvent:0];
      [v9 setIsModifierChangedEvent:0];

      goto LABEL_11;
    }
  }
  else
  {
    v17 = FKALogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_100014684(v17);
    }

    if (v5) {
      goto LABEL_3;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (void)_updateForContinuityStateChange
{
  v2 = +[AXSpringBoardServer server];
  id v3 = [v2 isContinuitySessionActive];

  id v4 = +[AXEventTapManager sharedManager];
  [v4 setIgnoreEventsForContinuitySession:v3];

  uint64_t v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 136315394;
    id v8 = "-[FKAEventTap _updateForContinuityStateChange]";
    __int16 v9 = 2112;
    CFStringRef v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s isContinuitySessionActive: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (FKAEventTapDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FKAEventTapDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (NSMutableDictionary)keyCodesToUnicodeCharacters
{
  return self->_keyCodesToUnicodeCharacters;
}

- (NSMutableDictionary)keyCodesToBackupUnicodeCharacters
{
  return self->_keyCodesToBackupUnicodeCharacters;
}

- (NSMutableDictionary)keyCodesToDownEventRepresentations
{
  return self->_keyCodesToDownEventRepresentations;
}

- (NSMutableSet)keyCodesRequiringRepostForUpEvent
{
  return self->_keyCodesRequiringRepostForUpEvent;
}

- (void)setKeyCodesRequiringRepostForUpEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCodesRequiringRepostForUpEvent, 0);
  objc_storeStrong((id *)&self->_keyCodesToDownEventRepresentations, 0);
  objc_storeStrong((id *)&self->_keyCodesToBackupUnicodeCharacters, 0);
  objc_storeStrong((id *)&self->_keyCodesToUnicodeCharacters, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end