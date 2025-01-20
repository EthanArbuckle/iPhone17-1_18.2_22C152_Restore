@interface AXKeyboardShortcutEntryPresenter
+ (AXKeyboardShortcutEntryPresenter)presenterWithSpecifier:(id)a3 selectionBlock:(id)a4 cancelBlock:(id)a5;
- (AXSSKeyChord)keyChord;
- (AXSSKeyChord)tabKeyChord;
- (BOOL)hasEndedEventCapture;
- (BOOL)isTabDown;
- (BOOL)shouldAllowClearingKeyChord;
- (BOOL)shouldAllowEndingEventCapture;
- (BOOL)shouldAllowTabAsModifier;
- (NSDate)timeOfLastSpaceKey;
- (NSMutableArray)recentKeyChords;
- (id)_handleEndingEventCaptureIfNeededWithKeyChord:(id)a3;
- (id)_initWithSpecifier:(id)a3 selectionBlock:(id)a4 cancelBlock:(id)a5;
- (id)userCanceledKeyChordSelectionBlock;
- (id)userSelectedKeyChordBlock;
- (unsigned)filteredKeyModifiers;
- (void)_handleKeyDown:(id)a3 keyInfo:(id)a4;
- (void)_snarfKeyboardEvent:(id)a3;
- (void)dealloc;
- (void)dismissViewController;
- (void)presentWithController:(id)a3 initialKeyChord:(id)a4;
- (void)setFilteredKeyModifiers:(unsigned int)a3;
- (void)setHasEndedEventCapture:(BOOL)a3;
- (void)setIsTabDown:(BOOL)a3;
- (void)setKeyChord:(id)a3;
- (void)setRecentKeyChords:(id)a3;
- (void)setShouldAllowClearingKeyChord:(BOOL)a3;
- (void)setShouldAllowEndingEventCapture:(BOOL)a3;
- (void)setShouldAllowTabAsModifier:(BOOL)a3;
- (void)setTabKeyChord:(id)a3;
- (void)setTimeOfLastSpaceKey:(id)a3;
- (void)setUserCanceledKeyChordSelectionBlock:(id)a3;
- (void)setUserSelectedKeyChordBlock:(id)a3;
@end

@implementation AXKeyboardShortcutEntryPresenter

+ (AXKeyboardShortcutEntryPresenter)presenterWithSpecifier:(id)a3 selectionBlock:(id)a4 cancelBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) _initWithSpecifier:v10 selectionBlock:v9 cancelBlock:v8];

  return (AXKeyboardShortcutEntryPresenter *)v11;
}

- (id)_initWithSpecifier:(id)a3 selectionBlock:(id)a4 cancelBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AXKeyboardShortcutEntryPresenter;
  v12 = [(AXKeyboardShortcutEntryPresenter *)&v21 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_specifier, a3);
    [p_isa setUserSelectedKeyChordBlock:v10];
    [p_isa setUserCanceledKeyChordSelectionBlock:v11];
    id v14 = [objc_alloc((Class)AXEventProcessor) initWithHIDTapIdentifier:@"VOTKeyboardShortcutEntry" HIDEventTapPriority:70 systemEventTapIdentifier:0 systemEventTapPriority:0];
    id v15 = p_isa[4];
    p_isa[4] = v14;

    [p_isa[4] setShouldNotifyUserEventOccurred:1];
    [p_isa[4] setHIDEventFilterMask:2];
    objc_initWeak(&location, p_isa);
    id v16 = p_isa[4];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __82__AXKeyboardShortcutEntryPresenter__initWithSpecifier_selectionBlock_cancelBlock___block_invoke;
    v18[3] = &unk_208E88;
    objc_copyWeak(&v19, &location);
    [v16 setHIDEventHandler:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return p_isa;
}

uint64_t __82__AXKeyboardShortcutEntryPresenter__initWithSpecifier_selectionBlock_cancelBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([WeakRetained hasEndedEventCapture] & 1) != 0
    || [v3 type] - 10 > 2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __82__AXKeyboardShortcutEntryPresenter__initWithSpecifier_selectionBlock_cancelBlock___block_invoke_2;
    v7[3] = &unk_208948;
    id v8 = WeakRetained;
    id v9 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

    uint64_t v5 = 1;
  }

  return v5;
}

id __82__AXKeyboardShortcutEntryPresenter__initWithSpecifier_selectionBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _snarfKeyboardEvent:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(AXEventProcessor *)self->_keyboardEventProcessor cleanup];
  [(AXEventProcessor *)self->_keyboardEventProcessor endHandlingHIDEventsForReason:@"UserEnteringKeyboardShortcut"];
  v3.receiver = self;
  v3.super_class = (Class)AXKeyboardShortcutEntryPresenter;
  [(AXKeyboardShortcutEntryPresenter *)&v3 dealloc];
}

- (void)setKeyChord:(id)a3
{
  id v4 = a3;
  if ([(AXKeyboardShortcutEntryPresenter *)self shouldAllowEndingEventCapture])
  {
    uint64_t v5 = [(AXKeyboardShortcutEntryPresenter *)self _handleEndingEventCaptureIfNeededWithKeyChord:v4];

    id v4 = (id)v5;
  }
  keyChord = self->_keyChord;
  self->_keyChord = (AXSSKeyChord *)v4;
  id v8 = v4;

  if (v8) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = [(AXKeyboardShortcutEntryPresenter *)self shouldAllowClearingKeyChord];
  }
  [(UIAlertAction *)self->_doneAction setEnabled:v7];
  [(AXKeyboardShortcutEntryViewController *)self->_shortcutEntryViewController updateWithKeyChord:v8 shouldSpeakChange:1];
}

- (void)setHasEndedEventCapture:(BOOL)a3
{
  if (self->_hasEndedEventCapture != a3)
  {
    self->_hasEndedEventCapture = a3;
    -[AXKeyboardShortcutEntryViewController setHasEndedEventCapture:](self->_shortcutEntryViewController, "setHasEndedEventCapture:");
  }
}

- (void)presentWithController:(id)a3 initialKeyChord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = settingsLocString(@"KEYBOARD_SHORTCUT", @"Accessibility");
  id v9 = +[AXKeyboardShortcutEntryViewController alertControllerWithTitle:v8 message:0 preferredStyle:1];
  shortcutEntryViewController = self->_shortcutEntryViewController;
  self->_shortcutEntryViewController = v9;

  [(AXKeyboardShortcutEntryViewController *)self->_shortcutEntryViewController setSpecifier:self->_specifier];
  [(AXKeyboardShortcutEntryViewController *)self->_shortcutEntryViewController setPresenter:self];
  [(AXKeyboardShortcutEntryViewController *)self->_shortcutEntryViewController setShouldAllowTabAsModifier:[(AXKeyboardShortcutEntryPresenter *)self shouldAllowTabAsModifier]];
  [(AXKeyboardShortcutEntryViewController *)self->_shortcutEntryViewController setShouldAllowEndingEventCapture:[(AXKeyboardShortcutEntryPresenter *)self shouldAllowEndingEventCapture]];
  [(AXKeyboardShortcutEntryViewController *)self->_shortcutEntryViewController setHasEndedEventCapture:[(AXKeyboardShortcutEntryPresenter *)self hasEndedEventCapture]];
  if (v7) {
    [(AXKeyboardShortcutEntryViewController *)self->_shortcutEntryViewController updateWithKeyChord:v7 shouldSpeakChange:0];
  }
  objc_initWeak(&location, self);
  if ([(AXKeyboardShortcutEntryPresenter *)self shouldAllowClearingKeyChord])
  {
    id v11 = settingsLocString(@"KEYBOARD_SHORTCUT_CLEAR", @"Accessibility");
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __74__AXKeyboardShortcutEntryPresenter_presentWithController_initialKeyChord___block_invoke;
    v27[3] = &unk_208F50;
    objc_copyWeak(&v28, &location);
    v12 = +[UIAlertAction _actionWithTitle:v11 image:0 style:2 handler:v27 shouldDismissHandler:&__block_literal_global_40];

    [(AXKeyboardShortcutEntryViewController *)self->_shortcutEntryViewController addAction:v12];
    objc_destroyWeak(&v28);
    uint64_t v13 = 0;
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v13 = 1;
  }
  id v15 = settingsLocString(@"CANCEL", @"Accessibility");
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __74__AXKeyboardShortcutEntryPresenter_presentWithController_initialKeyChord___block_invoke_3;
  v25[3] = &unk_208F50;
  objc_copyWeak(&v26, &location);
  id v16 = +[UIAlertAction _actionWithTitle:v15 image:0 style:v13 handler:v25 shouldDismissHandler:&__block_literal_global_296_1];

  [(AXKeyboardShortcutEntryViewController *)self->_shortcutEntryViewController addAction:v16];
  v17 = settingsLocString(@"DONE", @"Accessibility");
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = __74__AXKeyboardShortcutEntryPresenter_presentWithController_initialKeyChord___block_invoke_5;
  v23 = &unk_208F50;
  objc_copyWeak(&v24, &location);
  v18 = +[UIAlertAction _actionWithTitle:v17 image:0 style:v14 handler:&v20 shouldDismissHandler:&__block_literal_global_301];
  doneAction = self->_doneAction;
  self->_doneAction = v18;

  -[UIAlertAction setEnabled:](self->_doneAction, "setEnabled:", 0, v20, v21, v22, v23);
  [(AXKeyboardShortcutEntryViewController *)self->_shortcutEntryViewController addAction:self->_doneAction];
  [(AXEventProcessor *)self->_keyboardEventProcessor beginHandlingHIDEventsForReason:@"UserEnteringKeyboardShortcut"];
  [v6 presentViewController:self->_shortcutEntryViewController animated:1 completion:0];
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __74__AXKeyboardShortcutEntryPresenter_presentWithController_initialKeyChord___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[AXSSKeyChord nullKeyChord];
  [WeakRetained setKeyChord:v1];

  v2 = [WeakRetained userSelectedKeyChordBlock];

  if (v2)
  {
    objc_super v3 = [WeakRetained userSelectedKeyChordBlock];
    id v4 = [WeakRetained keyChord];
    ((void (**)(void, void *))v3)[2](v3, v4);
  }
}

BOOL __74__AXKeyboardShortcutEntryPresenter_presentWithController_initialKeyChord___block_invoke_2(id a1)
{
  return 0;
}

void __74__AXKeyboardShortcutEntryPresenter_presentWithController_initialKeyChord___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained userCanceledKeyChordSelectionBlock];

  if (v1)
  {
    v2 = [WeakRetained userCanceledKeyChordSelectionBlock];
    v2[2]();
  }
}

BOOL __74__AXKeyboardShortcutEntryPresenter_presentWithController_initialKeyChord___block_invoke_4(id a1)
{
  return 0;
}

void __74__AXKeyboardShortcutEntryPresenter_presentWithController_initialKeyChord___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained userSelectedKeyChordBlock];

  if (v1)
  {
    v2 = [WeakRetained userSelectedKeyChordBlock];
    objc_super v3 = [WeakRetained keyChord];
    ((void (**)(void, void *))v2)[2](v2, v3);
  }
}

BOOL __74__AXKeyboardShortcutEntryPresenter_presentWithController_initialKeyChord___block_invoke_6(id a1)
{
  return 0;
}

- (void)dismissViewController
{
}

- (id)_handleEndingEventCaptureIfNeededWithKeyChord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXKeyboardShortcutEntryPresenter *)self recentKeyChords];

  if (!v5)
  {
    id v6 = +[NSMutableArray array];
    [(AXKeyboardShortcutEntryPresenter *)self setRecentKeyChords:v6];
  }
  id v7 = [(AXKeyboardShortcutEntryPresenter *)self recentKeyChords];
  id v8 = v7;
  if (v4)
  {
    [v7 addObject:v4];
  }
  else
  {
    id v9 = +[NSNull null];
    [v8 addObject:v9];
  }
  id v10 = [(AXKeyboardShortcutEntryPresenter *)self recentKeyChords];
  id v11 = [v10 count];

  if ((unint64_t)v11 >= 4)
  {
    v12 = [(AXKeyboardShortcutEntryPresenter *)self recentKeyChords];
    uint64_t v13 = [(AXKeyboardShortcutEntryPresenter *)self recentKeyChords];
    objc_msgSend(v12, "removeObjectsInRange:", 0, (char *)objc_msgSend(v13, "count") - 3);
  }
  uint64_t v14 = [v4 keys];
  unsigned int v15 = [v14 isEqualToArray:&off_22BE88];

  if (v15)
  {
    id v16 = +[NSDate date];
    if (![(AXSSKeyChord *)self->_keyChord isEqual:v4]) {
      goto LABEL_16;
    }
    uint64_t v17 = [(AXKeyboardShortcutEntryPresenter *)self timeOfLastSpaceKey];
    if (!v17) {
      goto LABEL_16;
    }
    v18 = (void *)v17;
    id v19 = [(AXKeyboardShortcutEntryPresenter *)self timeOfLastSpaceKey];
    [v16 timeIntervalSinceDate:v19];
    double v21 = v20;

    if (v21 < 0.5)
    {
      [(AXKeyboardShortcutEntryPresenter *)self setHasEndedEventCapture:[(AXKeyboardShortcutEntryPresenter *)self hasEndedEventCapture] ^ 1];
      v22 = [(AXKeyboardShortcutEntryPresenter *)self recentKeyChords];
      id v23 = [v22 count];

      if ((unint64_t)v23 >= 3)
      {
        id v24 = [(AXKeyboardShortcutEntryPresenter *)self recentKeyChords];
        v25 = [(AXKeyboardShortcutEntryPresenter *)self recentKeyChords];
        id v26 = objc_msgSend(v24, "objectAtIndexedSubscript:", (char *)objc_msgSend(v25, "count") - 3);

        v27 = +[NSNull null];
        LODWORD(v24) = [v26 isEqual:v27];

        if (!v24)
        {
          id v28 = 0;
          goto LABEL_17;
        }
        id v4 = v26;
      }

      id v28 = 0;
      id v26 = 0;
    }
    else
    {
LABEL_16:
      id v28 = v16;
      id v26 = v4;
    }
LABEL_17:
    [(AXKeyboardShortcutEntryPresenter *)self setTimeOfLastSpaceKey:v28];

    id v4 = v26;
  }

  return v4;
}

- (void)_snarfKeyboardEvent:(id)a3
{
  id v8 = a3;
  id v4 = [v8 keyInfo];
  [v4 translateKeycode];
  unsigned int v5 = [v8 type];
  if (v5 == 11)
  {
    if ([v4 keyCode] == 43)
    {
      if ([(AXKeyboardShortcutEntryPresenter *)self shouldAllowTabAsModifier])
      {
        id v6 = [(AXKeyboardShortcutEntryPresenter *)self tabKeyChord];

        if (v6)
        {
          id v7 = [(AXKeyboardShortcutEntryPresenter *)self tabKeyChord];
          [(AXKeyboardShortcutEntryPresenter *)self setKeyChord:v7];

          [(AXKeyboardShortcutEntryPresenter *)self setTabKeyChord:0];
        }
      }
      [(AXKeyboardShortcutEntryPresenter *)self setIsTabDown:0];
    }
  }
  else if (v5 == 10)
  {
    if ([v4 keyCode] == 43) {
      [(AXKeyboardShortcutEntryPresenter *)self setIsTabDown:1];
    }
    [(AXKeyboardShortcutEntryPresenter *)self _handleKeyDown:v8 keyInfo:v4];
  }
}

- (void)_handleKeyDown:(id)a3 keyInfo:(id)a4
{
  id v18 = a3;
  unsigned int filteredKeyModifiers = self->_filteredKeyModifiers;
  id v7 = a4;
  objc_msgSend(v7, "setModifierState:", objc_msgSend(v7, "modifierState") & ~filteredKeyModifiers);
  id v8 = [v7 unmodifiedInput];

  if ([v8 length])
  {
    id v9 = +[AXSSKeyChord keyChordWithEvent:v18];
    if ([(AXKeyboardShortcutEntryPresenter *)self shouldAllowTabAsModifier])
    {
      if ([(AXKeyboardShortcutEntryPresenter *)self isTabDown])
      {
        id v10 = [v9 keys];
        unsigned __int8 v11 = [v10 containsObject:@"⇥"];

        if ((v11 & 1) == 0)
        {
          v12 = [v9 keys];
          uint64_t v13 = [v12 arrayByAddingObject:@"⇥"];
          uint64_t v14 = +[AXSSKeyChord keyChordWithKeys:v13];

          id v9 = (void *)v14;
        }
      }
      unsigned int v15 = [v9 keys];
      if ([v15 count] == (char *)&dword_0 + 1)
      {
        id v16 = [v9 keys];
        unsigned int v17 = [v16 containsObject:@"⇥"];

        if (v17)
        {
          [(AXKeyboardShortcutEntryPresenter *)self setTabKeyChord:v9];
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
      }
      [(AXKeyboardShortcutEntryPresenter *)self setTabKeyChord:0];
    }
    [(AXKeyboardShortcutEntryPresenter *)self setKeyChord:v9];
    goto LABEL_12;
  }
LABEL_13:
}

- (id)userSelectedKeyChordBlock
{
  return self->_userSelectedKeyChordBlock;
}

- (void)setUserSelectedKeyChordBlock:(id)a3
{
}

- (id)userCanceledKeyChordSelectionBlock
{
  return self->_userCanceledKeyChordSelectionBlock;
}

- (void)setUserCanceledKeyChordSelectionBlock:(id)a3
{
}

- (unsigned)filteredKeyModifiers
{
  return self->_filteredKeyModifiers;
}

- (void)setFilteredKeyModifiers:(unsigned int)a3
{
  self->_unsigned int filteredKeyModifiers = a3;
}

- (BOOL)shouldAllowTabAsModifier
{
  return self->_shouldAllowTabAsModifier;
}

- (void)setShouldAllowTabAsModifier:(BOOL)a3
{
  self->_shouldAllowTabAsModifier = a3;
}

- (BOOL)shouldAllowEndingEventCapture
{
  return self->_shouldAllowEndingEventCapture;
}

- (void)setShouldAllowEndingEventCapture:(BOOL)a3
{
  self->_shouldAllowEndingEventCapture = a3;
}

- (BOOL)shouldAllowClearingKeyChord
{
  return self->_shouldAllowClearingKeyChord;
}

- (void)setShouldAllowClearingKeyChord:(BOOL)a3
{
  self->_shouldAllowClearingKeyChord = a3;
}

- (AXSSKeyChord)keyChord
{
  return self->_keyChord;
}

- (AXSSKeyChord)tabKeyChord
{
  return self->_tabKeyChord;
}

- (void)setTabKeyChord:(id)a3
{
}

- (BOOL)isTabDown
{
  return self->_isTabDown;
}

- (void)setIsTabDown:(BOOL)a3
{
  self->_isTabDown = a3;
}

- (BOOL)hasEndedEventCapture
{
  return self->_hasEndedEventCapture;
}

- (NSMutableArray)recentKeyChords
{
  return self->_recentKeyChords;
}

- (void)setRecentKeyChords:(id)a3
{
}

- (NSDate)timeOfLastSpaceKey
{
  return self->_timeOfLastSpaceKey;
}

- (void)setTimeOfLastSpaceKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfLastSpaceKey, 0);
  objc_storeStrong((id *)&self->_recentKeyChords, 0);
  objc_storeStrong((id *)&self->_tabKeyChord, 0);
  objc_storeStrong((id *)&self->_keyChord, 0);
  objc_storeStrong(&self->_userCanceledKeyChordSelectionBlock, 0);
  objc_storeStrong(&self->_userSelectedKeyChordBlock, 0);
  objc_storeStrong((id *)&self->_keyboardEventProcessor, 0);
  objc_storeStrong((id *)&self->_shortcutEntryViewController, 0);
  objc_storeStrong((id *)&self->_specifier, 0);

  objc_storeStrong((id *)&self->_doneAction, 0);
}

@end