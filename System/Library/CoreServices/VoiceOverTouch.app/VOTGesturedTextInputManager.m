@interface VOTGesturedTextInputManager
- (BOOL)_isInHomeScreen:(id)a3;
- (BOOL)_performWordBackspaceForElement:(id)a3;
- (BOOL)_processRawInputEvent:(id)a3 forElement:(id)a4 withAttributes:(id)a5;
- (BOOL)_processRotorEvent:(id)a3;
- (BOOL)_processSearchEvent:(id)a3 forElement:(id)a4;
- (BOOL)_processWebRotorEvent:(id)a3;
- (BOOL)gesturesControlRotor;
- (BOOL)isActive;
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
- (BOOL)performCustomBackspace;
- (BOOL)performCustomWordBackspace;
- (BOOL)performNextBrailleTableCommand;
- (BOOL)performNextKeyboardLanguage;
- (BOOL)processEvent:(id)a3;
- (BOOL)processTapWithFingerCount:(unint64_t)a3;
- (BOOL)shouldAllowRotorEvents;
- (NSDictionary)localizedWebRotorMap;
- (NSString)currentInputString;
- (NSString)nameSearcherHint;
- (NSString)pendingInputString;
- (VOTElement)nameSearcherMonitorElement;
- (VOTGesturedTextInputManager)init;
- (VOTGesturedTextInputManagerDelegate)delegate;
- (VOTNameSearcher)nameSearcher;
- (id)_stringByDeletingFromCurrentInputStringIfNeeded;
- (id)currentElementAttributes;
- (id)hintForAppLaunch;
- (id)hintForItemChooser;
- (id)nameSearcherEntriesPassingSearchFrom:(id)a3;
- (id)outputForLatestInput;
- (int64_t)rotorType;
- (int64_t)valueChangeOriginator;
- (unint64_t)_numberOfCharactersToDeleteStartingAtIndex:(unint64_t)a3 toDesiredLength:(unint64_t)a4 fromString:(id)a5;
- (unint64_t)_numberOfCharactersToDeleteToDesiredLength:(unint64_t)a3 fromString:(id)a4;
- (void)_deleteFromCurrentInputStringIfNeeded;
- (void)_prepareNameSearcherForElement:(id)a3;
- (void)_updateLocalizedResources;
- (void)appendString:(id)a3;
- (void)applyNextSuggestionToElement:(id)a3;
- (void)applyPreviousSuggestionToElement:(id)a3;
- (void)clearCurrentString;
- (void)inputSpaceForElement:(id)a3;
- (void)itemSource:(id)a3 didFilter:(id)a4 didSwitchFocus:(id)a5;
- (void)itemSource:(id)a3 didSelect:(id)a4;
- (void)pressReturnKeyForElement:(id)a3;
- (void)sendCarriageReturnForElement:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setCurrentInputString:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocalizedWebRotorMap:(id)a3;
- (void)setNameSearcher:(id)a3;
- (void)setNameSearcherHint:(id)a3;
- (void)setNameSearcherMonitorElement:(id)a3;
- (void)setPendingInputString:(id)a3;
- (void)setRotorType:(int64_t)a3;
- (void)updateWithString:(id)a3;
@end

@implementation VOTGesturedTextInputManager

- (VOTGesturedTextInputManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)VOTGesturedTextInputManager;
  v2 = [(VOTGesturedTextInputManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(VOTGesturedTextInputManager *)v2 setRotorType:9];
    [(VOTGesturedTextInputManager *)v3 setCurrentInputString:&stru_1001B7888];
    [(VOTGesturedTextInputManager *)v3 _updateLocalizedResources];
  }
  return v3;
}

- (BOOL)processTapWithFingerCount:(unint64_t)a3
{
  v3 = [(VOTGesturedTextInputManager *)self nameSearcherMonitorElement];
  if ([v3 doesHaveTraits:kAXLaunchIconTrait]) {
    LOBYTE(v4) = 0;
  }
  else {
    unsigned int v4 = [v3 doesHaveTraits:kAXFolderIconTrait] ^ 1;
  }

  return v4;
}

- (void)appendString:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    unsigned int v4 = [(VOTGesturedTextInputManager *)self currentInputString];
    objc_super v5 = [v4 stringByAppendingString:v6];
    [(VOTGesturedTextInputManager *)self updateWithString:v5];
  }
}

- (void)updateWithString:(id)a3
{
  id v4 = a3;
  objc_super v5 = VOTLogHandwriting();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Update string: %@", buf, 0xCu);
  }

  id v6 = +[VOTUserEventManager sharedInstance];
  [v6 userEventOccurred];

  v7 = [(VOTGesturedTextInputManager *)self delegate];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000555AC;
  v9[3] = &unk_1001B4868;
  id v10 = v4;
  v11 = self;
  id v8 = v4;
  [v7 gesturedTextInputManager:self accessCurrentGesturedTextInputElement:v9];
}

- (id)currentElementAttributes
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100055BCC;
  v11 = sub_100055BDC;
  id v12 = 0;
  v3 = [(VOTGesturedTextInputManager *)self delegate];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100055BE4;
  v6[3] = &unk_1001B4890;
  v6[4] = &v7;
  [v3 gesturedTextInputManager:self accessCurrentGesturedTextInputElement:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)processEvent:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  objc_super v5 = [v4 command];
  if ([v5 isEqualToString:kVOTEventCommandSearchRotorLeft])
  {

    goto LABEL_4;
  }
  id v6 = [v4 command];
  unsigned __int8 v7 = [v6 isEqualToString:kVOTEventCommandSearchRotorRight];

  if (v7)
  {
LABEL_4:
    if (![(VOTGesturedTextInputManager *)self shouldAllowRotorEvents]) {
      *((unsigned char *)v18 + 24) = 1;
    }
    goto LABEL_10;
  }
  id v8 = [v4 command];
  if ([v8 isEqualToString:kVOTEventCommandEscape])
  {
  }
  else
  {
    uint64_t v9 = [v4 command];
    unsigned __int8 v10 = [v9 isEqualToString:kVOTEventCommandBSIExit];

    if ((v10 & 1) == 0)
    {
      v11 = [(VOTGesturedTextInputManager *)self delegate];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100055E0C;
      v14[3] = &unk_1001B48B8;
      v14[4] = self;
      id v15 = v4;
      v16 = &v17;
      [v11 gesturedTextInputManager:self accessCurrentGesturedTextInputElement:v14];
    }
  }
LABEL_10:
  char v12 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (void)inputSpaceForElement:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "insertText:source:", @" ", -[VOTGesturedTextInputManager valueChangeOriginator](self, "valueChangeOriginator"));

  [(VOTGesturedTextInputManager *)self clearCurrentString];
}

- (void)pressReturnKeyForElement:(id)a3
{
  [a3 activateKeyboardReturnKey];

  [(VOTGesturedTextInputManager *)self clearCurrentString];
}

- (void)sendCarriageReturnForElement:(id)a3
{
  [a3 handwritingSendCarriageReturn];

  [(VOTGesturedTextInputManager *)self clearCurrentString];
}

- (void)clearCurrentString
{
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

- (BOOL)isRotorDownEvent:(id)a3
{
  return 0;
}

- (BOOL)isTextSelectionForwardEvent:(id)a3
{
  return 0;
}

- (BOOL)isTextSelectionBackwardEvent:(id)a3
{
  return 0;
}

- (BOOL)performCustomBackspace
{
  return 0;
}

- (BOOL)performCustomWordBackspace
{
  return 0;
}

- (BOOL)performNextKeyboardLanguage
{
  return 0;
}

- (BOOL)performNextBrailleTableCommand
{
  return 0;
}

- (BOOL)shouldAllowRotorEvents
{
  return 1;
}

- (id)hintForAppLaunch
{
  return 0;
}

- (id)hintForItemChooser
{
  return 0;
}

- (id)outputForLatestInput
{
  return 0;
}

- (BOOL)gesturesControlRotor
{
  return 0;
}

- (BOOL)_processWebRotorEvent:(id)a3
{
  id v4 = a3;
  if ([(VOTGesturedTextInputManager *)self isNextSuggestionEvent:v4])
  {
    objc_super v5 = [(VOTGesturedTextInputManager *)self delegate];
    int64_t v6 = [(VOTGesturedTextInputManager *)self rotorType];
    unsigned __int8 v7 = v5;
    id v8 = self;
    uint64_t v9 = 1;
  }
  else
  {
    if (![(VOTGesturedTextInputManager *)self isPreviousSuggestionEvent:v4])
    {
      BOOL v10 = 0;
      goto LABEL_7;
    }
    objc_super v5 = [(VOTGesturedTextInputManager *)self delegate];
    int64_t v6 = [(VOTGesturedTextInputManager *)self rotorType];
    unsigned __int8 v7 = v5;
    id v8 = self;
    uint64_t v9 = 2;
  }
  [v7 gesturedTextInputManager:v8 moveToElementMatchingRotorType:v6 inDirection:v9];

  BOOL v10 = 1;
LABEL_7:

  return v10;
}

- (void)_deleteFromCurrentInputStringIfNeeded
{
  v3 = [(VOTGesturedTextInputManager *)self currentInputString];
  id v4 = [v3 length];

  if (v4)
  {
    id v5 = [(VOTGesturedTextInputManager *)self _stringByDeletingFromCurrentInputStringIfNeeded];
    [(VOTGesturedTextInputManager *)self setCurrentInputString:v5];
  }
}

- (id)_stringByDeletingFromCurrentInputStringIfNeeded
{
  v3 = [(VOTGesturedTextInputManager *)self currentInputString];
  id v4 = [v3 length];

  if (v4)
  {
    id v5 = [(VOTGesturedTextInputManager *)self currentInputString];
    int64_t v6 = [(VOTGesturedTextInputManager *)self currentInputString];
    unsigned __int8 v7 = [(VOTGesturedTextInputManager *)self currentInputString];
    objc_msgSend(v5, "substringToIndex:", objc_msgSend(v6, "rangeOfComposedCharacterSequenceAtIndex:", (char *)objc_msgSend(v7, "length") - 1));
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = &stru_1001B7888;
  }

  return v8;
}

- (BOOL)_performWordBackspaceForElement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 selectedTextRange];
  if (v5 == (id)0x7FFFFFFF || v6 != 0) {
    goto LABEL_10;
  }
  id v8 = v5;
  [v4 updateValue];
  uint64_t v9 = [v4 value];
  id v10 = objc_msgSend(v9, "ax_wordFromPosition:inDirection:", v8, 1);
  if (v10 == (id)0x7FFFFFFF || !v11)
  {

LABEL_10:
    uint64_t v9 = +[VOTOutputManager outputManager];
    id v13 = +[VOSOutputEvent BoundaryEncountered];
    [v9 sendEvent:v13];

    BOOL v12 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "replaceCharactersAtCursor:withString:source:", -[VOTGesturedTextInputManager _numberOfCharactersToDeleteStartingAtIndex:toDesiredLength:fromString:](self, "_numberOfCharactersToDeleteStartingAtIndex:toDesiredLength:fromString:", v8, v10, v9), &stru_1001B7888, -[VOTGesturedTextInputManager valueChangeOriginator](self, "valueChangeOriginator"));
  [(VOTGesturedTextInputManager *)self clearCurrentString];
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)_processRawInputEvent:(id)a3 forElement:(id)a4 withAttributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(VOTGesturedTextInputManager *)self isReturnKeyEvent:v8])
  {
    if ([(VOTGesturedTextInputManager *)self isSpaceEvent:v8])
    {
      if (([v9 doesHaveTraits:kAXSecureTextFieldTrait] & 1) == 0) {
        [(VOTGesturedTextInputManager *)self inputSpaceForElement:v9];
      }
      goto LABEL_19;
    }
    if ([(VOTGesturedTextInputManager *)self isBackspaceEvent:v8])
    {
      if (![(VOTGesturedTextInputManager *)self performCustomBackspace])
      {
        if ([v10 canDeleteCharacter])
        {
          objc_msgSend(v9, "deleteCharacterAtCursorWithSource:", -[VOTGesturedTextInputManager valueChangeOriginator](self, "valueChangeOriginator"));
          [(VOTGesturedTextInputManager *)self _deleteFromCurrentInputStringIfNeeded];
          [(VOTGesturedTextInputManager *)self didInputBackspace];
        }
        else
        {
          uint64_t v11 = +[VOTOutputManager outputManager];
          BOOL v12 = +[VOSOutputEvent BoundaryEncountered];
          [v11 sendEvent:v12];
        }
      }
      goto LABEL_19;
    }
    if ([(VOTGesturedTextInputManager *)self isWordBackspaceEvent:v8])
    {
      if ([(VOTGesturedTextInputManager *)self performCustomWordBackspace]
        || [(VOTGesturedTextInputManager *)self _performWordBackspaceForElement:v9])
      {
        [(VOTGesturedTextInputManager *)self didInputWordBackspace];
        goto LABEL_19;
      }
    }
    else
    {
      if ([(VOTGesturedTextInputManager *)self isPreviousSuggestionEvent:v8])
      {
        [(VOTGesturedTextInputManager *)self applyPreviousSuggestionToElement:v9];
        goto LABEL_19;
      }
      if ([(VOTGesturedTextInputManager *)self isNextSuggestionEvent:v8])
      {
        [(VOTGesturedTextInputManager *)self applyNextSuggestionToElement:v9];
        goto LABEL_19;
      }
      if ([(VOTGesturedTextInputManager *)self isNextKeyboardLanguageEvent:v8])
      {
        BOOL v13 = [(VOTGesturedTextInputManager *)self performNextKeyboardLanguage];
        goto LABEL_20;
      }
    }
    BOOL v13 = 0;
    goto LABEL_20;
  }
  [(VOTGesturedTextInputManager *)self pressReturnKeyForElement:v9];
LABEL_19:
  BOOL v13 = 1;
LABEL_20:

  return v13;
}

- (void)_prepareNameSearcherForElement:(id)a3
{
  id v9 = a3;
  id v4 = [(VOTGesturedTextInputManager *)self nameSearcher];

  if (!v4)
  {
    if ([(VOTGesturedTextInputManager *)self _isInHomeScreen:v9])
    {
      id v5 = -[VOTNameSearcherAppSource initWithLaunchContext:]([VOTNameSearcherAppSource alloc], "initWithLaunchContext:", [v9 isInAppSwitcher]);
      uint64_t v6 = [[VOTNameSearcher alloc] initWithDelegate:self itemSource:v5 filter:self];
      [(VOTGesturedTextInputManager *)self setNameSearcher:v6];

      [(VOTGesturedTextInputManager *)self hintForAppLaunch];
    }
    else
    {
      id v5 = [[VOTNameSearcherElementSource alloc] initWithElement:v9];
      unsigned __int8 v7 = [[VOTNameSearcher alloc] initWithDelegate:self itemSource:v5 filter:self];
      [(VOTGesturedTextInputManager *)self setNameSearcher:v7];

      [(VOTGesturedTextInputManager *)self hintForItemChooser];
    id v8 = };
    [(VOTGesturedTextInputManager *)self setNameSearcherHint:v8];
  }
}

- (BOOL)_isInHomeScreen:(id)a3
{
  id v3 = a3;
  id v4 = [v3 application];
  if ([v4 isSpringBoard])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    uint64_t v6 = [v3 immediateRemoteParent];
    unsigned __int8 v7 = [v6 application];
    unsigned __int8 v5 = [v7 isSpringBoard];
  }
  id v8 = +[AXSpringBoardServer server];
  unsigned __int8 v9 = [v8 isScreenLockedWithPasscode:0];

  return v5 & (v9 ^ 1);
}

- (BOOL)_processSearchEvent:(id)a3 forElement:(id)a4
{
  id v5 = a3;
  if (![(VOTGesturedTextInputManager *)self isNextSuggestionEvent:v5])
  {
    if ([(VOTGesturedTextInputManager *)self isPreviousSuggestionEvent:v5])
    {
      uint64_t v6 = [(VOTGesturedTextInputManager *)self nameSearcher];
      [v6 focusOnPreviousMatchingItem];
      goto LABEL_5;
    }
    if ([(VOTGesturedTextInputManager *)self isBackspaceEvent:v5])
    {
      if (![(VOTGesturedTextInputManager *)self performCustomBackspace])
      {
        unsigned __int8 v9 = [(VOTGesturedTextInputManager *)self _stringByDeletingFromCurrentInputStringIfNeeded];
        [(VOTGesturedTextInputManager *)self setPendingInputString:v9];

        id v10 = [(VOTGesturedTextInputManager *)self nameSearcher];
        [v10 updateMatchingItems];

        [(VOTGesturedTextInputManager *)self _deleteFromCurrentInputStringIfNeeded];
      }
      goto LABEL_6;
    }
    if ([(VOTGesturedTextInputManager *)self isSelectItemEvent:v5])
    {
      uint64_t v11 = [(VOTGesturedTextInputManager *)self nameSearcher];
      [v11 selectFocusedItem];

      [(VOTGesturedTextInputManager *)self clearCurrentString];
      goto LABEL_6;
    }
    if ([(VOTGesturedTextInputManager *)self isNextKeyboardLanguageEvent:v5])
    {
      BOOL v7 = [(VOTGesturedTextInputManager *)self performNextKeyboardLanguage];
      goto LABEL_7;
    }
    BOOL v12 = [v5 command];
    if (([v12 isEqualToString:kVOTEventCommandSearchRotorLeft] & 1) == 0)
    {
      BOOL v13 = [v5 command];
      if (([v13 isEqualToString:kVOTEventCommandSearchRotorRight] & 1) == 0)
      {
        v14 = [v5 command];
        if (![v14 isEqualToString:kVOTEventCommandEscape])
        {
          id v15 = [v5 command];
          if ([v15 isEqualToString:kVOTEventCommandNextTextSegment])
          {
            unsigned __int8 v16 = 1;
          }
          else
          {
            uint64_t v17 = [v5 command];
            if ([v17 isEqualToString:kVOTEventCommandPreviousTextSegment])
            {
              unsigned __int8 v16 = 1;
            }
            else
            {
              v18 = [v5 command];
              if ([v18 isEqualToString:kVOTEventCommandSelectRight])
              {
                unsigned __int8 v16 = 1;
              }
              else
              {
                uint64_t v19 = [v5 command];
                if ([v19 isEqualToString:kVOTEventCommandSelectLeft])
                {
                  unsigned __int8 v16 = 1;
                }
                else
                {
                  char v20 = [v5 command];
                  if ([v20 isEqualToString:kVOTEventCommandBSIExit])
                  {
                    unsigned __int8 v16 = 1;
                  }
                  else
                  {
                    v23 = [v5 command];
                    if ([v23 isEqualToString:kVOTEventCommandBSIPreviousRotor])
                    {
                      unsigned __int8 v16 = 1;
                    }
                    else
                    {
                      v22 = [v5 command];
                      if ([v22 isEqualToString:kVOTEventCommandBSINextRotor])
                      {
                        unsigned __int8 v16 = 1;
                      }
                      else
                      {
                        v21 = [v5 command];
                        unsigned __int8 v16 = [v21 isEqualToString:kVOTEventCommandBSIEscape];
                      }
                    }
                  }
                }
              }
            }
          }
          if ((v16 & 1) == 0) {
            goto LABEL_6;
          }
LABEL_21:
          BOOL v7 = 0;
          goto LABEL_7;
        }
      }
    }

    goto LABEL_21;
  }
  uint64_t v6 = [(VOTGesturedTextInputManager *)self nameSearcher];
  [v6 focusOnNextMatchingItem];
LABEL_5:

LABEL_6:
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (BOOL)_processRotorEvent:(id)a3
{
  id v4 = a3;
  if ([(VOTGesturedTextInputManager *)self isRotorLeftEvent:v4])
  {
    id v5 = (void *)VOTSharedWorkspace;
    uint64_t v6 = &kVOTEventCommandSearchRotorLeft;
LABEL_5:
    BOOL v7 = +[VOTEvent internalEventWithCommand:*v6 info:0];
    [v5 dispatchCommand:v7];
LABEL_13:

    goto LABEL_14;
  }
  if ([(VOTGesturedTextInputManager *)self isRotorRightEvent:v4])
  {
    id v5 = (void *)VOTSharedWorkspace;
    uint64_t v6 = &kVOTEventCommandSearchRotorRight;
    goto LABEL_5;
  }
  if ([(VOTGesturedTextInputManager *)self isRotorDownEvent:v4])
  {
    id v8 = (void *)VOTSharedWorkspace;
    unsigned __int8 v9 = &kVOTEventCommandSearchRotorDown;
LABEL_12:
    BOOL v7 = +[VOTEvent internalEventWithCommand:*v9 info:0];
    [v8 dispatchCommand:v7 bypassGesturedInput:1];
    goto LABEL_13;
  }
  if ([(VOTGesturedTextInputManager *)self isRotorUpEvent:v4])
  {
    id v8 = (void *)VOTSharedWorkspace;
    unsigned __int8 v9 = &kVOTEventCommandSearchRotorUp;
    goto LABEL_12;
  }
  if ([(VOTGesturedTextInputManager *)self isTextSelectionForwardEvent:v4])
  {
    id v8 = (void *)VOTSharedWorkspace;
    unsigned __int8 v9 = &kVOTEventCommandSimpleTap;
    goto LABEL_12;
  }
  if (![(VOTGesturedTextInputManager *)self isTextSelectionBackwardEvent:v4])
  {
    BOOL v10 = 0;
    goto LABEL_15;
  }
LABEL_14:
  BOOL v10 = 1;
LABEL_15:

  return v10;
}

- (void)_updateLocalizedResources
{
  id v15 = +[NSMutableDictionary dictionary];
  uint64_t v2 = 0;
  id v3 = &objc_release_x25_ptr;
  do
  {
    uint64_t v4 = qword_10016E640[v2];
    if ((unint64_t)(v4 - 46) < 6)
    {
      id v5 = off_1001B4900[v4 - 46];
LABEL_4:
      uint64_t v6 = [v3[336] numberWithInteger:v4];
      [v15 setObject:v6 forKey:v5];

      BOOL v7 = v5;
LABEL_10:

      goto LABEL_11;
    }
    id v8 = +[VOTRotor stringForRotorType:qword_10016E640[v2]];
    BOOL v7 = [v8 lowercaseString];

    uint64_t v9 = (uint64_t)[v7 length];
    if (v9 < 1) {
      goto LABEL_10;
    }
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    while (1)
    {
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C", [v7 characterAtIndex:v11]);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BOOL v12 = [v15 allKeys];
      unsigned int v13 = [v12 containsObject:0];

      if (!v13) {
        break;
      }

      if (v10 == ++v11)
      {
        id v3 = &objc_release_x25_ptr;
        goto LABEL_10;
      }
    }

    id v3 = &objc_release_x25_ptr;
    if (v5) {
      goto LABEL_4;
    }
LABEL_11:
    ++v2;
  }
  while (v2 != 14);
  [(VOTGesturedTextInputManager *)self setLocalizedWebRotorMap:v15];
}

- (unint64_t)_numberOfCharactersToDeleteToDesiredLength:(unint64_t)a3 fromString:(id)a4
{
  id v6 = a4;
  unint64_t v7 = -[VOTGesturedTextInputManager _numberOfCharactersToDeleteStartingAtIndex:toDesiredLength:fromString:](self, "_numberOfCharactersToDeleteStartingAtIndex:toDesiredLength:fromString:", [v6 length], a3, v6);

  return v7;
}

- (unint64_t)_numberOfCharactersToDeleteStartingAtIndex:(unint64_t)a3 toDesiredLength:(unint64_t)a4 fromString:(id)a5
{
  id v7 = a5;
  if (a4 >= a3)
  {
    unint64_t v8 = 0;
  }
  else
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = objc_msgSend(v7, "rangeOfComposedCharacterSequenceAtIndex:", a4, v14, v15, v16);
      NSUInteger v11 = v10;
      if (v9 != (id)a4)
      {
        BOOL v12 = +[NSNumber numberWithUnsignedInteger:a4];
        v17.location = (NSUInteger)v9;
        v17.length = v11;
        NSStringFromRange(v17);
        v16 = id v15 = v12;
        id v14 = v7;
        _AXAssert();
      }
      a4 = (unint64_t)v9 + v11;
      ++v8;
    }
    while ((unint64_t)v9 + v11 < a3);
  }

  return v8;
}

- (void)itemSource:(id)a3 didFilter:(id)a4 didSwitchFocus:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  NSUInteger v10 = [(VOTGesturedTextInputManager *)self pendingInputString];
  NSUInteger v11 = objc_alloc_init(VOTOutputRequest);
  BOOL v12 = [(VOTGesturedTextInputManager *)self currentInputString];
  unsigned int v13 = [(VOTGesturedTextInputManager *)self outputForLatestInput];
  id v14 = v13;
  if (v13)
  {
    id v15 = v11;
    NSUInteger v11 = v13;
  }
  else
  {
    if ([v12 length] && !objc_msgSend(v10, "hasPrefix:", v12))
    {
      if (![v10 length]) {
        goto LABEL_10;
      }
      uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C", objc_msgSend(v10, "characterAtIndex:", (char *)objc_msgSend(v10, "length") - 1));
    }
    else
    {
      uint64_t v16 = objc_msgSend(v10, "substringFromIndex:", objc_msgSend(v12, "length"));
    }
    id v15 = (void *)v16;
    id v17 = [(VOTOutputRequest *)v11 addString:v16];
  }

LABEL_10:
  if (v8)
  {
    v18 = objc_msgSend(v24, "messageForMatchingItemsCount:", objc_msgSend(v8, "integerValue"));
    id v19 = [(VOTOutputRequest *)v11 addString:v18];
  }
  if (v9)
  {
    id v20 = [(VOTOutputRequest *)v11 addString:v9];
    if ([(id)VOTSharedWorkspace hintsEnabled])
    {
      v21 = [(VOTGesturedTextInputManager *)self nameSearcherHint];
      if ([v21 length])
      {
        LODWORD(v22) = 1061997773;
        [(VOTOutputRequest *)v11 addPause:v22];
        id v23 = [(VOTOutputRequest *)v11 addString:v21];
      }
    }
  }
  [(VOTOutputRequest *)v11 send];
}

- (void)itemSource:(id)a3 didSelect:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    [v5 selectSpeechDelay];
    id v10 = v5;
    id v11 = v6;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    id v7 = [v5 messageForNoMatchingItems];
    id v8 = [(id)VOTSharedWorkspace selectedLanguage];
    id v9 = sub_10000ABF8(v7, 1, v8);
  }
}

- (id)nameSearcherEntriesPassingSearchFrom:(id)a3
{
  id v4 = a3;
  id v5 = [(VOTGesturedTextInputManager *)self pendingInputString];
  id v6 = [(VOTGesturedTextInputManager *)self pendingInputString];

  if (!v6)
  {
    uint64_t v7 = [(VOTGesturedTextInputManager *)self currentInputString];

    id v5 = (void *)v7;
  }
  if ([v5 length])
  {
    id v19 = v4;
    id v20 = (id)objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned int v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v14 = objc_msgSend(v13, "name", v19);
          id v15 = [v14 lowercaseString];
          uint64_t v16 = [v5 lowercaseString];
          unsigned int v17 = [v15 hasPrefix:v16];

          if (v17) {
            [v20 addObject:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    id v4 = v19;
  }
  else
  {
    id v20 = v4;
  }

  return v20;
}

- (VOTGesturedTextInputManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTGesturedTextInputManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (int64_t)rotorType
{
  return self->_rotorType;
}

- (void)setRotorType:(int64_t)a3
{
  self->_rotorType = a3;
}

- (NSDictionary)localizedWebRotorMap
{
  return self->_localizedWebRotorMap;
}

- (void)setLocalizedWebRotorMap:(id)a3
{
}

- (VOTNameSearcher)nameSearcher
{
  return self->_nameSearcher;
}

- (void)setNameSearcher:(id)a3
{
}

- (VOTElement)nameSearcherMonitorElement
{
  return self->_nameSearcherMonitorElement;
}

- (void)setNameSearcherMonitorElement:(id)a3
{
}

- (NSString)nameSearcherHint
{
  return self->_nameSearcherHint;
}

- (void)setNameSearcherHint:(id)a3
{
}

- (NSString)currentInputString
{
  return self->_currentInputString;
}

- (void)setCurrentInputString:(id)a3
{
}

- (NSString)pendingInputString
{
  return self->_pendingInputString;
}

- (void)setPendingInputString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingInputString, 0);
  objc_storeStrong((id *)&self->_currentInputString, 0);
  objc_storeStrong((id *)&self->_nameSearcherHint, 0);
  objc_storeStrong((id *)&self->_nameSearcherMonitorElement, 0);
  objc_storeStrong((id *)&self->_nameSearcher, 0);
  objc_storeStrong((id *)&self->_localizedWebRotorMap, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (int64_t)valueChangeOriginator
{
  return 0;
}

- (BOOL)isSpaceEvent:(id)a3
{
  return 0;
}

- (BOOL)isBackspaceEvent:(id)a3
{
  return 0;
}

- (BOOL)isWordBackspaceEvent:(id)a3
{
  return 0;
}

- (BOOL)isReturnKeyEvent:(id)a3
{
  return 0;
}

- (BOOL)isNextSuggestionEvent:(id)a3
{
  return 0;
}

- (BOOL)isPreviousSuggestionEvent:(id)a3
{
  return 0;
}

- (BOOL)isSelectItemEvent:(id)a3
{
  return 0;
}

- (BOOL)isNextKeyboardLanguageEvent:(id)a3
{
  return 0;
}

- (BOOL)isNextBrailleTableEvent:(id)a3
{
  return 0;
}

- (void)applyNextSuggestionToElement:(id)a3
{
  sub_100057EC8();
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)applyPreviousSuggestionToElement:(id)a3
{
  sub_100057EC8();
  objc_opt_class();

  NSRequestConcreteImplementation();
}

@end