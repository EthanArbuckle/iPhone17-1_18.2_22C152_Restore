@interface VOTDirectInteractionKeyboardManager
- (BOOL)inDirectInteractionTypingMode;
- (BOOL)inGestureMode;
- (BOOL)inGestureTypingMode;
- (BOOL)isEmojiKey;
- (BOOL)isEmojiKeyboard;
- (BOOL)processEvent:(id)a3;
- (CGRect)gestureKeyboardRegion;
- (VOTDirectInteractionKeyboardManager)init;
- (VOTElement)keyboardElement;
- (VOTGestureKeyboardDelegate)delegate;
- (void)_handleCommitTyping:(id)a3;
- (void)_handleDelete:(id)a3;
- (void)_handleKeyboardSelection:(id)a3;
- (void)_handleKeyplaneSelection:(id)a3;
- (void)_handleShift:(id)a3;
- (void)_handleShiftLock:(id)a3;
- (void)_handleSuggestionSelection:(id)a3;
- (void)_handleTypingEnter:(id)a3;
- (void)_handleTypingPeriod:(id)a3;
- (void)_initializeDispatchTable;
- (void)_processEvent:(id)a3;
- (void)_updateKeyboardElement;
- (void)_updateTypingMode;
- (void)dealloc;
- (void)screenChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInDirectInteractionTypingMode:(BOOL)a3;
- (void)setInGestureMode:(BOOL)a3;
- (void)setIsEmojiKey:(BOOL)a3;
- (void)setIsEmojiKeyboard:(BOOL)a3;
- (void)setKeyboardElement:(id)a3;
- (void)updateKeyboardElement;
- (void)updateTypingMode;
@end

@implementation VOTDirectInteractionKeyboardManager

- (VOTDirectInteractionKeyboardManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)VOTDirectInteractionKeyboardManager;
  v2 = [(VOTDirectInteractionKeyboardManager *)&v12 init];
  if (v2)
  {
    v3 = (AXAccessQueue *)objc_alloc_init((Class)AXAccessQueue);
    dispatchAccessQueue = v2->_dispatchAccessQueue;
    v2->_dispatchAccessQueue = v3;

    [(VOTDirectInteractionKeyboardManager *)v2 _initializeDispatchTable];
    v5 = v2->_dispatchAccessQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000E0538;
    v10[3] = &unk_1001B33B8;
    v6 = v2;
    v11 = v6;
    [(AXAccessQueue *)v5 afterDelay:v10 processWritingBlock:1.0];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v6 selector:"screenChange:" name:@"UpdateElement" object:0];

    v8 = v6;
  }

  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VOTDirectInteractionKeyboardManager;
  [(VOTDirectInteractionKeyboardManager *)&v4 dealloc];
}

- (void)_initializeDispatchTable
{
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  dispatchTable = self->_dispatchTable;
  self->_dispatchTable = v3;

  v5 = self->_dispatchTable;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000E0A58;
  v37[3] = &unk_1001B68B0;
  v37[4] = self;
  v6 = objc_retainBlock(v37);
  [(NSMutableDictionary *)v5 setObject:v6 forKey:kVOTEventCommandGestureTypingShiftLock];

  v7 = self->_dispatchTable;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000E0A64;
  v36[3] = &unk_1001B68B0;
  v36[4] = self;
  v8 = objc_retainBlock(v36);
  [(NSMutableDictionary *)v7 setObject:v8 forKey:kVOTEventCommandGestureTypingShift];

  v9 = self->_dispatchTable;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000E0A70;
  v35[3] = &unk_1001B68B0;
  v35[4] = self;
  v10 = objc_retainBlock(v35);
  [(NSMutableDictionary *)v9 setObject:v10 forKey:kVOTEventCommandGestureTypingTypeEnter];

  v11 = self->_dispatchTable;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000E0A7C;
  v34[3] = &unk_1001B68B0;
  v34[4] = self;
  objc_super v12 = objc_retainBlock(v34);
  [(NSMutableDictionary *)v11 setObject:v12 forKey:kVOTEventCommandGestureTypingTypePeriod];

  v13 = self->_dispatchTable;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000E0A88;
  v33[3] = &unk_1001B68B0;
  v33[4] = self;
  v14 = objc_retainBlock(v33);
  [(NSMutableDictionary *)v13 setObject:v14 forKey:kVOTEventCommandGestureTypingCommitTyping];

  v15 = self->_dispatchTable;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000E0A94;
  v32[3] = &unk_1001B68B0;
  v32[4] = self;
  v16 = objc_retainBlock(v32);
  [(NSMutableDictionary *)v15 setObject:v16 forKey:kVOTEventCommandGestureTypingDelete];

  v17 = self->_dispatchTable;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000E0AA0;
  v31[3] = &unk_1001B68B0;
  v31[4] = self;
  v18 = objc_retainBlock(v31);
  [(NSMutableDictionary *)v17 setObject:v18 forKey:kVOTEventCommandGestureTypingNextSuggestion];

  v19 = self->_dispatchTable;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000E0AAC;
  v30[3] = &unk_1001B68B0;
  v30[4] = self;
  v20 = objc_retainBlock(v30);
  [(NSMutableDictionary *)v19 setObject:v20 forKey:kVOTEventCommandGestureTypingPreviousSuggestion];

  v21 = self->_dispatchTable;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000E0AB8;
  v29[3] = &unk_1001B68B0;
  v29[4] = self;
  v22 = objc_retainBlock(v29);
  [(NSMutableDictionary *)v21 setObject:v22 forKey:kVOTEventCommandGestureTypingNextKeyplane];

  v23 = self->_dispatchTable;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000E0AC4;
  v28[3] = &unk_1001B68B0;
  v28[4] = self;
  v24 = objc_retainBlock(v28);
  [(NSMutableDictionary *)v23 setObject:v24 forKey:kVOTEventCommandGestureTypingPreviousKeyplane];

  v25 = self->_dispatchTable;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000E0AD0;
  v27[3] = &unk_1001B68B0;
  v27[4] = self;
  v26 = objc_retainBlock(v27);
  [(NSMutableDictionary *)v25 setObject:v26 forKey:kVOTEventCommandGestureTypingNextInternationalKeyboard];
}

- (void)screenChange:(id)a3
{
  [(VOTDirectInteractionKeyboardManager *)self updateKeyboardElement];

  [(VOTDirectInteractionKeyboardManager *)self updateTypingMode];
}

- (void)updateTypingMode
{
  dispatchAccessQueue = self->_dispatchAccessQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E0B88;
  v3[3] = &unk_1001B33B8;
  v3[4] = self;
  [(AXAccessQueue *)dispatchAccessQueue performAsynchronousWritingBlock:v3];
}

- (void)_updateKeyboardElement
{
  keyboardElement = self->_keyboardElement;
  self->_keyboardElement = 0;

  [(VOTDirectInteractionKeyboardManager *)self _updateTypingMode];
}

- (void)updateKeyboardElement
{
  dispatchAccessQueue = self->_dispatchAccessQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E0C44;
  v3[3] = &unk_1001B33B8;
  v3[4] = self;
  [(AXAccessQueue *)dispatchAccessQueue performAsynchronousWritingBlock:v3];
}

- (void)_updateTypingMode
{
  if ([(id)VOTSharedWorkspace typingMode] != (id)2)
  {
    uint64_t v16 = 0;
    goto LABEL_40;
  }
  p_keyboardElement = (id *)&self->_keyboardElement;
  [(VOTElement *)self->_keyboardElement updateWindowContextId];
  objc_super v4 = VOTLogKeyboard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = *p_keyboardElement;
    *(_DWORD *)buf = 138477827;
    id v43 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Got keyboard element: %{private}@", buf, 0xCu);
  }

  id v6 = *p_keyboardElement;
  if (*p_keyboardElement)
  {
    unsigned int v7 = [v6 isValid];
    id v6 = *p_keyboardElement;
    if (v7)
    {
      if ([v6 windowContextId]) {
        goto LABEL_30;
      }
      id v6 = *p_keyboardElement;
    }
  }
  id *p_keyboardElement = 0;

  v8 = +[VOTWorkspace sharedWorkspace];
  v9 = [v8 focusedApplications];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v39;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "activeKeyboard", (void)v38);
        if (v15)
        {
          id v17 = *p_keyboardElement;
          id *p_keyboardElement = (id)v15;

          goto LABEL_19;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  v18 = [(VOTDirectInteractionKeyboardManager *)self delegate];
  v19 = [v18 currentElement];

  if ([(VOTDirectInteractionKeyboardManager *)self isEmojiKeyboard]
    && [(VOTDirectInteractionKeyboardManager *)self isEmojiKey])
  {
    v20 = [v19 activeKeyboard];
    if (v20) {
      objc_storeStrong((id *)&self->_keyboardElement, v20);
    }
  }
  if (*p_keyboardElement
    || ([v19 activeKeyboard],
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        id v22 = *p_keyboardElement,
        id *p_keyboardElement = (id)v21,
        v22,
        *p_keyboardElement))
  {
    v23 = v19;
  }
  else
  {
    v23 = [(id)VOTSharedWorkspace currentElement];

    v34 = [v23 remoteParent];

    if (v34)
    {
      v35 = [v23 application];
      uint64_t v36 = [v35 activeKeyboard];
      id v37 = *p_keyboardElement;
      id *p_keyboardElement = (id)v36;
    }
  }
  if (objc_msgSend(*p_keyboardElement, "isRemoteElement", (void)v38))
  {
    uint64_t v24 = [*p_keyboardElement activeKeyboard];
    id v25 = *p_keyboardElement;
    id *p_keyboardElement = (id)v24;
  }
LABEL_30:
  v26 = VOTLogKeyboard();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = *p_keyboardElement;
    v28 = [*p_keyboardElement application];
    unsigned int v29 = [v28 isSoftwareKeyboardActive];
    unsigned int v30 = [*p_keyboardElement isSoftwareKeyboardMimic];
    *(_DWORD *)buf = 138412802;
    id v43 = v27;
    __int16 v44 = 1024;
    unsigned int v45 = v29;
    __int16 v46 = 1024;
    unsigned int v47 = v30;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Got gesture keyboard: %@ [SW active: %d, IsMimic: %d]", buf, 0x18u);
  }
  v31 = [*p_keyboardElement application];
  if ([v31 isSoftwareKeyboardActive])
  {
  }
  else
  {
    unsigned __int8 v32 = [*p_keyboardElement isSoftwareKeyboardMimic];

    if ((v32 & 1) == 0)
    {
      uint64_t v16 = 0;
      goto LABEL_37;
    }
  }
  [*p_keyboardElement updateFrame];
  uint64_t v16 = 1;
LABEL_37:
  v33 = VOTLogKeyboard();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v43) = v16;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Is in mode: %d", buf, 8u);
  }

LABEL_40:
  [(VOTDirectInteractionKeyboardManager *)self setInDirectInteractionTypingMode:v16];
}

- (BOOL)inGestureTypingMode
{
  return 0;
}

- (void)setInDirectInteractionTypingMode:(BOOL)a3
{
  self->_inDirectInteractionTypingMode = a3;
  id v4 = [(VOTDirectInteractionKeyboardManager *)self delegate];
  [v4 directInteractionModeStatus:self->_inDirectInteractionTypingMode];
}

- (BOOL)isEmojiKey
{
  v2 = [(VOTDirectInteractionKeyboardManager *)self delegate];
  v3 = [v2 currentElement];
  id v4 = [v3 bundleIdentifier];
  unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.StickerKit.StickerPickerService"];

  return v5;
}

- (BOOL)isEmojiKeyboard
{
  v2 = +[VOTWorkspace sharedWorkspace];
  v3 = [v2 focusedApplications];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isKeyboardEmojiInputMode", (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (CGRect)gestureKeyboardRegion
{
  [(VOTElement *)self->_keyboardElement frameForDirectInteraction];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  long long v11 = VOTLogKeyboard();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    keyboardElement = self->_keyboardElement;
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    uint64_t v13 = NSStringFromRect(v26);
    *(_DWORD *)buf = 138412546;
    v23 = keyboardElement;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Gesture KB frame: %@ %@", buf, 0x16u);
  }
  v27.origin.x = CGRectZero.origin.x;
  v27.origin.y = CGRectZero.origin.y;
  v27.size.width = CGRectZero.size.width;
  v27.size.height = CGRectZero.size.height;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  if (CGRectEqualToRect(v27, v29))
  {
    [(VOTElement *)self->_keyboardElement frameForDirectInteraction];
    CGFloat v4 = v14;
    CGFloat v6 = v15;
    CGFloat v8 = v16;
    CGFloat v10 = v17;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  double v18 = v4;
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)processEvent:(id)a3
{
  id v4 = a3;
  if ((self->_inDirectInteractionTypingMode || (_AXAssert(), self->_inDirectInteractionTypingMode))
    && ([v4 command],
        double v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 isEqualToString:kVOTEventCommandGestureTypingType],
        v5,
        v6))
  {
    double v7 = [v4 objectForIndex:115];
    [v7 pointValue];
    double v9 = v8;
    double v11 = v10;

    long long v12 = +[VOTElement systemWideElement];
    objc_msgSend(v12, "performSimpleTapAtPoint:withForce:withContextId:withDelay:forElement:", -[VOTElement windowContextId](self->_keyboardElement, "windowContextId"), 0, v9, v11, 0.0, 0.0);

    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_processEvent:(id)a3
{
  id v4 = a3;
  dispatchTable = self->_dispatchTable;
  id v8 = v4;
  unsigned int v6 = [v4 command];
  double v7 = [(NSMutableDictionary *)dispatchTable objectForKey:v6];

  if (v7) {
    ((void (**)(void, id))v7)[2](v7, v8);
  }
}

- (void)_handleSuggestionSelection:(id)a3
{
  id v4 = [a3 command];
  unsigned int v5 = [v4 isEqualToString:kVOTEventCommandGestureTypingNextSuggestion];

  if (v5) {
    uint64_t v6 = 2606;
  }
  else {
    uint64_t v6 = 2607;
  }
  id v8 = [(VOTDirectInteractionKeyboardManager *)self keyboardElement];
  double v7 = [v8 uiElement];
  [v7 performAXAction:v6];
}

- (void)_handleKeyplaneSelection:(id)a3
{
  id v4 = [a3 command];
  unsigned int v5 = [v4 isEqualToString:kVOTEventCommandGestureTypingNextKeyplane];

  if (v5) {
    uint64_t v6 = 2602;
  }
  else {
    uint64_t v6 = 2603;
  }
  id v8 = [(VOTDirectInteractionKeyboardManager *)self keyboardElement];
  double v7 = [v8 uiElement];
  [v7 performAXAction:v6];
}

- (void)_handleKeyboardSelection:(id)a3
{
  id v4 = [a3 command];
  unsigned int v5 = [v4 isEqualToString:kVOTEventCommandGestureTypingNextInternationalKeyboard];

  if (v5) {
    uint64_t v6 = 2608;
  }
  else {
    uint64_t v6 = 0;
  }
  id v8 = [(VOTDirectInteractionKeyboardManager *)self keyboardElement];
  double v7 = [v8 uiElement];
  [v7 performAXAction:v6];
}

- (void)_handleDelete:(id)a3
{
  id v4 = [(VOTDirectInteractionKeyboardManager *)self keyboardElement];
  double v3 = [v4 uiElement];
  [v3 performAXAction:2601];
}

- (void)_handleShiftLock:(id)a3
{
  id v4 = [(VOTDirectInteractionKeyboardManager *)self keyboardElement];
  double v3 = [v4 uiElement];
  [v3 performAXAction:2610];
}

- (void)_handleShift:(id)a3
{
  id v4 = [(VOTDirectInteractionKeyboardManager *)self keyboardElement];
  double v3 = [v4 uiElement];
  [v3 performAXAction:2609];
}

- (void)_handleTypingEnter:(id)a3
{
  id v5 = [(VOTDirectInteractionKeyboardManager *)self keyboardElement];
  double v3 = [v5 uiElement];
  id v4 = +[NSString stringWithFormat:@"\n"];
  [v3 performAXAction:2605 withValue:v4];
}

- (void)_handleTypingPeriod:(id)a3
{
  id v5 = [(VOTDirectInteractionKeyboardManager *)self keyboardElement];
  double v3 = [v5 uiElement];
  id v4 = +[NSString stringWithFormat:@"."];
  [v3 performAXAction:2605 withValue:v4];
}

- (void)_handleCommitTyping:(id)a3
{
  id v4 = [(VOTDirectInteractionKeyboardManager *)self keyboardElement];
  double v3 = [v4 uiElement];
  [v3 performAXAction:2604];
}

- (BOOL)inDirectInteractionTypingMode
{
  return self->_inDirectInteractionTypingMode;
}

- (VOTGestureKeyboardDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTGestureKeyboardDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VOTElement)keyboardElement
{
  return self->_keyboardElement;
}

- (void)setKeyboardElement:(id)a3
{
}

- (void)setIsEmojiKey:(BOOL)a3
{
  self->_isEmojiKey = a3;
}

- (void)setIsEmojiKeyboard:(BOOL)a3
{
  self->_isEmojiKeyboard = a3;
}

- (BOOL)inGestureMode
{
  return self->_inGestureMode;
}

- (void)setInGestureMode:(BOOL)a3
{
  self->_inGestureMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardElement, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dispatchTable, 0);
  objc_storeStrong((id *)&self->_dispatchTimer, 0);

  objc_storeStrong((id *)&self->_dispatchAccessQueue, 0);
}

@end