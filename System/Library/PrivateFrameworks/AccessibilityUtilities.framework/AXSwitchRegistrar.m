@interface AXSwitchRegistrar
- (AXMIDIManager)midiManager;
- (AXSwitch)aSwitch;
- (AXSwitchRegistrar)init;
- (AXSwitchRegistrarDelegate)delegate;
- (BOOL)_isATVRemoteButtonSwitchWithUsage:(int64_t)a3 longPress:(BOOL)a4;
- (BOOL)_isGamepadSwitchWithKeyCode:(unsigned __int16)a3 longPress:(BOOL)a4;
- (BOOL)_isKeyboardSwitchWithKeyCode:(unsigned __int16)a3 longPress:(BOOL)a4;
- (BOOL)_isMFISwitchWithButtonNumber:(unsigned int)a3 longPress:(BOOL)a4;
- (BOOL)_isMIDISwitchWithMidiEvent:(id)a3;
- (BOOL)_isSwitchWithSource:(id)a3 keyCode:(unsigned __int16)a4 buttonNumber:(unsigned int)a5 ATVRemoteButtonUsage:(int64_t)a6 midiEvent:(id)a7;
- (BOOL)addLongPressSwitch;
- (BOOL)isSwitchWithName:(id)a3;
- (__IOHIDDevice)device;
- (__IOHIDEventSystemClient)eventSystemClient;
- (__IOHIDManager)manager;
- (id)_atvRemoteMatching;
- (id)_gamepadMatching;
- (id)_keyboardMatching;
- (id)_mfiMatching;
- (void)_filterEvents:(BOOL)a3;
- (void)_handleATVRemoteButtonDownEvent:(__IOHIDEvent *)a3;
- (void)_handleApplicationDidBecomeActive:(id)a3;
- (void)_handleApplicationWillResignActive:(id)a3;
- (void)_handleGamepadButtonPressedEvent:(__IOHIDEvent *)a3;
- (void)_handleKeyboardKeyDownEvent:(__IOHIDEvent *)a3;
- (void)_handleMFIButtonDownValue:(__IOHIDValue *)a3;
- (void)_handleMIDIEvent:(id)a3 device:(id)a4 entity:(id)a5 source:(id)a6;
- (void)beginFilteringEvents;
- (void)dealloc;
- (void)endFilteringEvents;
- (void)setASwitch:(id)a3;
- (void)setAddLongPressSwitch:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(__IOHIDDevice *)a3;
- (void)setEventSystemClient:(__IOHIDEventSystemClient *)a3;
- (void)setManager:(__IOHIDManager *)a3;
- (void)setMidiManager:(id)a3;
@end

@implementation AXSwitchRegistrar

- (AXSwitchRegistrar)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXSwitchRegistrar;
  v2 = [(AXSwitchRegistrar *)&v5 init];
  if (v2)
  {
    v3 = +[AXSwitch switchWithAction:0 name:0 source:0 type:@"SwitchTypeOptional"];
    [(AXSwitchRegistrar *)v2 setASwitch:v3];
  }
  return v2;
}

- (void)dealloc
{
  [(AXSwitchRegistrar *)self _filterEvents:0];
  v3.receiver = self;
  v3.super_class = (Class)AXSwitchRegistrar;
  [(AXSwitchRegistrar *)&v3 dealloc];
}

- (void)beginFilteringEvents
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F48390] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    objc_super v5 = [MEMORY[0x1E4F48390] identifier];
    v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = AXColorizeFormatLog();
      v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_18D308000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(AXSwitchRegistrar *)self _filterEvents:1];
}

- (void)endFilteringEvents
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F48390] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    objc_super v5 = [MEMORY[0x1E4F48390] identifier];
    v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = AXColorizeFormatLog();
      v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_18D308000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(AXSwitchRegistrar *)self _filterEvents:0];
}

- (BOOL)isSwitchWithName:(id)a3
{
  return SCATSwitchExistsWithName(a3);
}

- (BOOL)_isKeyboardSwitchWithKeyCode:(unsigned __int16)a3 longPress:(BOOL)a4
{
  return [(AXSwitchRegistrar *)self _isSwitchWithSource:@"SwitchSourceKeyboard" keyCode:a3 buttonNumber:0xFFFFFFFFLL ATVRemoteButtonUsage:-1 midiEvent:0];
}

- (BOOL)_isMFISwitchWithButtonNumber:(unsigned int)a3 longPress:(BOOL)a4
{
  return [(AXSwitchRegistrar *)self _isSwitchWithSource:@"SwitchSourceMFI" keyCode:0xFFFFLL buttonNumber:*(void *)&a3 ATVRemoteButtonUsage:-1 midiEvent:0];
}

- (BOOL)_isATVRemoteButtonSwitchWithUsage:(int64_t)a3 longPress:(BOOL)a4
{
  return [(AXSwitchRegistrar *)self _isSwitchWithSource:@"SwitchSourceATVRemote" keyCode:0xFFFFLL buttonNumber:0xFFFFFFFFLL ATVRemoteButtonUsage:a3 midiEvent:0];
}

- (BOOL)_isMIDISwitchWithMidiEvent:(id)a3
{
  return [(AXSwitchRegistrar *)self _isSwitchWithSource:@"SwitchSourceMIDI" keyCode:0xFFFFLL buttonNumber:0xFFFFFFFFLL ATVRemoteButtonUsage:-1 midiEvent:a3];
}

- (BOOL)_isGamepadSwitchWithKeyCode:(unsigned __int16)a3 longPress:(BOOL)a4
{
  return [(AXSwitchRegistrar *)self _isSwitchWithSource:@"SwitchSourceGamepad" keyCode:a3 buttonNumber:0xFFFFFFFFLL ATVRemoteButtonUsage:-1 midiEvent:0];
}

- (BOOL)_isSwitchWithSource:(id)a3 keyCode:(unsigned __int16)a4 buttonNumber:(unsigned int)a5 ATVRemoteButtonUsage:(int64_t)a6 midiEvent:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  v13 = +[AXSettings sharedInstance];
  v14 = [v13 assistiveTouchSwitches];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__AXSwitchRegistrar__isSwitchWithSource_keyCode_buttonNumber_ATVRemoteButtonUsage_midiEvent___block_invoke;
  v18[3] = &unk_1E5587AE0;
  id v15 = v11;
  unsigned __int16 v24 = a4;
  unsigned int v23 = a5;
  v21 = &v25;
  int64_t v22 = a6;
  id v19 = v15;
  id v16 = v12;
  id v20 = v16;
  [v14 enumerateObjectsUsingBlock:v18];
  LOBYTE(a5) = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  return a5;
}

void __93__AXSwitchRegistrar__isSwitchWithSource_keyCode_buttonNumber_ATVRemoteButtonUsage_midiEvent___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v24 = a2;
  objc_super v5 = [v24 source];
  int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  os_log_type_t v7 = v24;
  if (v6)
  {
    v8 = [v24 source];
    if ([v8 isEqual:@"SwitchSourceKeyboard"]
      && [v24 keyCode] == *(unsigned __int16 *)(a1 + 68))
    {
      goto LABEL_10;
    }
    v9 = [v24 source];
    if ([v9 isEqual:@"SwitchSourceGamepad"]
      && [v24 keyCode] == *(unsigned __int16 *)(a1 + 68))
    {
LABEL_9:

LABEL_10:
      os_log_type_t v7 = v24;
LABEL_11:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
      goto LABEL_12;
    }
    int v10 = [v24 source];
    if ([v10 isEqual:@"SwitchSourceMFI"]
      && [v24 buttonNumber] == *(_DWORD *)(a1 + 64))
    {

      goto LABEL_9;
    }
    id v11 = [v24 source];
    if ([v11 isEqual:@"SwitchSourceATVRemote"])
    {
      uint64_t v12 = [v24 buttonNumber];
      uint64_t v13 = *(void *)(a1 + 56);

      os_log_type_t v7 = v24;
      if (v12 == v13) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    v14 = [v24 source];
    int v15 = [v14 isEqual:@"SwitchSourceMIDI"];

    os_log_type_t v7 = v24;
    if (v15)
    {
      id v16 = [v24 midiEvent];
      id v17 = *(id *)(a1 + 40);
      v18 = v17;
      if (!v16) {
        goto LABEL_33;
      }
      if (!v17) {
        goto LABEL_33;
      }
      if (([v16 isOmniChannel] & 1) == 0)
      {
        int v19 = [v16 channel];
        if (v19 != [v18 channel]) {
          goto LABEL_33;
        }
      }
      uint64_t v20 = [v16 type];
      if (v20 != [v18 type]) {
        goto LABEL_33;
      }
      uint64_t v21 = [v16 type];
      if ((unint64_t)(v21 - 1) >= 3)
      {
        if (v21 == 4)
        {
          int v22 = [v16 control];
          int v23 = [v18 control];
        }
        else
        {
          if (v21 != 5) {
            goto LABEL_32;
          }
          int v22 = [v16 program];
          int v23 = [v18 program];
        }
      }
      else
      {
        int v22 = [v16 note];
        int v23 = [v18 note];
      }
      if (v22 != v23)
      {
LABEL_33:

        os_log_type_t v7 = v24;
        goto LABEL_12;
      }
LABEL_32:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
      goto LABEL_33;
    }
  }
LABEL_12:
}

- (void)_handleApplicationDidBecomeActive:(id)a3
{
  char v4 = [(AXSwitchRegistrar *)self delegate];
  int v5 = [v4 switchRegistrarShouldFilterEvents:self];

  if (v5)
  {
    [(AXSwitchRegistrar *)self _filterEvents:1];
  }
}

- (void)_handleApplicationWillResignActive:(id)a3
{
}

- (void)_handleKeyboardKeyDownEvent:(__IOHIDEvent *)a3
{
  char v4 = [(AXSwitchRegistrar *)self delegate];
  int v5 = [v4 switchRegistrarShouldProcessKeyboardKeyEvent:self];

  if (v5)
  {
    uint64_t IntegerValue = (unsigned __int16)IOHIDEventGetIntegerValue();
    if ([(AXSwitchRegistrar *)self _isKeyboardSwitchWithKeyCode:IntegerValue longPress:[(AXSwitchRegistrar *)self addLongPressSwitch]])
    {
      id v8 = [(AXSwitchRegistrar *)self delegate];
      [v8 switchRegistrarKeyboardKeyAlreadyInUseForSwitch:self];
    }
    else
    {
      id v8 = [(AXSwitchRegistrar *)self aSwitch];
      [v8 setKeyCode:IntegerValue];
      [v8 setSource:@"SwitchSourceKeyboard"];
      os_log_type_t v7 = [(AXSwitchRegistrar *)self delegate];
      [v7 switchRegistrar:self didUpdateSwitch:v8];
    }
  }
}

- (void)_handleGamepadButtonPressedEvent:(__IOHIDEvent *)a3
{
  int v5 = [(AXSwitchRegistrar *)self delegate];
  int v6 = [v5 switchRegistrarShouldProcessGamepadEvent:self];

  if (v6)
  {
    uint64_t v7 = +[AXGameControllerEvent axGameControllerKeyCodeForEvent:a3];
    if ((unsigned __int16)(v7 - 13) >= 4u)
    {
      uint64_t v8 = v7;
      if ([(AXSwitchRegistrar *)self _isGamepadSwitchWithKeyCode:v7 longPress:[(AXSwitchRegistrar *)self addLongPressSwitch]])
      {
        id v10 = [(AXSwitchRegistrar *)self delegate];
        [v10 switchRegistrarGamepadSourceAlreadyInUseForSwitch:self];
      }
      else
      {
        id v10 = [(AXSwitchRegistrar *)self aSwitch];
        [v10 setKeyCode:v8];
        [v10 setSource:@"SwitchSourceGamepad"];
        v9 = [(AXSwitchRegistrar *)self delegate];
        [v9 switchRegistrar:self didUpdateSwitch:v10];
      }
    }
  }
}

- (void)_handleMIDIEvent:(id)a3 device:(id)a4 entity:(id)a5 source:(id)a6
{
  id v13 = a3;
  unint64_t v7 = [v13 type];
  if (v7 <= 7 && ((1 << v7) & 0xB4) != 0)
  {
    v9 = [(AXSwitchRegistrar *)self delegate];
    int v10 = [v9 switchRegistrarShouldProcessMIDIEvent:self];

    if (v10)
    {
      if ([(AXSwitchRegistrar *)self _isMIDISwitchWithMidiEvent:v13])
      {
        id v11 = [(AXSwitchRegistrar *)self delegate];
        [v11 switchRegistrarMIDISourceAlreadyInUseForSwitch:self];
      }
      else
      {
        id v11 = [(AXSwitchRegistrar *)self aSwitch];
        [v11 setSource:@"SwitchSourceMIDI"];
        [v11 setMidiEvent:v13];
        uint64_t v12 = [(AXSwitchRegistrar *)self delegate];
        [v12 switchRegistrar:self didUpdateSwitch:v11];
      }
    }
  }
}

- (void)_handleATVRemoteButtonDownEvent:(__IOHIDEvent *)a3
{
  char v4 = [(AXSwitchRegistrar *)self delegate];
  int v5 = [v4 switchRegistrarShouldProcessKeyboardKeyEvent:self];

  if (v5)
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    if ([(AXSwitchRegistrar *)self _isATVRemoteButtonSwitchWithUsage:IntegerValue longPress:[(AXSwitchRegistrar *)self addLongPressSwitch]])
    {
      id v8 = [(AXSwitchRegistrar *)self delegate];
      [v8 switchRegistrarMFIButtonAlreadyInUseForSwitch:self];
    }
    else
    {
      id v8 = [(AXSwitchRegistrar *)self aSwitch];
      [v8 setButtonNumber:IntegerValue];
      [v8 setSource:@"SwitchSourceATVRemote"];
      unint64_t v7 = [(AXSwitchRegistrar *)self delegate];
      [v7 switchRegistrar:self didUpdateSwitch:v8];
    }
  }
}

- (void)_handleMFIButtonDownValue:(__IOHIDValue *)a3
{
  int v5 = [(AXSwitchRegistrar *)self delegate];
  int v6 = [v5 switchRegistrarShouldProcessMFIButtonEvent:self];

  if (v6)
  {
    Element = IOHIDValueGetElement(a3);
    uint64_t Usage = IOHIDElementGetUsage(Element);
    if ([(AXSwitchRegistrar *)self _isMFISwitchWithButtonNumber:Usage longPress:[(AXSwitchRegistrar *)self addLongPressSwitch]])
    {
      id v10 = [(AXSwitchRegistrar *)self delegate];
      [v10 switchRegistrarMFIButtonAlreadyInUseForSwitch:self];
    }
    else
    {
      id v10 = [(AXSwitchRegistrar *)self aSwitch];
      [v10 setButtonNumber:Usage];
      [v10 setSource:@"SwitchSourceMFI"];
      v9 = [(AXSwitchRegistrar *)self delegate];
      [v9 switchRegistrar:self didUpdateSwitch:v10];
    }
  }
}

- (id)_keyboardMatching
{
  return &unk_1EDC631F8;
}

- (id)_atvRemoteMatching
{
  return &unk_1EDC63210;
}

- (id)_mfiMatching
{
  return &unk_1EDC63228;
}

- (id)_gamepadMatching
{
  return &unk_1EDC63240;
}

- (void)_filterEvents:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(AXSwitchRegistrar *)self device];
  int v6 = [(AXSwitchRegistrar *)self eventSystemClient];
  unint64_t v7 = [(AXSwitchRegistrar *)self manager];
  if (v3)
  {
    if (!v6)
    {
      uint64_t v8 = IOHIDEventSystemClientCreate();
      if (!v8)
      {
        id v24 = @"Could not create event system client";
        LOBYTE(v23) = 1;
        _AXLogWithFacility();
        if (!v7)
        {
LABEL_6:
          IOHIDManagerRef v13 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
          if (v13)
          {
            v14 = v13;
            CFArrayRef v15 = [(AXSwitchRegistrar *)self _mfiMatching];
            IOHIDManagerSetDeviceMatchingMultiple(v14, v15);

            Current = CFRunLoopGetCurrent();
            IOHIDManagerScheduleWithRunLoop(v14, Current, (CFStringRef)*MEMORY[0x1E4F1D418]);
            IOHIDManagerRegisterDeviceMatchingCallback(v14, (IOHIDDeviceCallback)_ASUIDeviceMatchingCallback, self);
            uint64_t v17 = IOHIDManagerOpen(v14, 0);
            if (v17)
            {
              id v24 = @"Could not open HID manager: %d";
              uint64_t v25 = v17;
              LOBYTE(v23) = 1;
              _AXLogWithFacility();
            }
            -[AXSwitchRegistrar setManager:](self, "setManager:", v14, v23, v24, v25);
            CFRelease(v14);
          }
        }
LABEL_20:
        objc_initWeak(&location, self);
        uint64_t v21 = [AXMIDIManager alloc];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __35__AXSwitchRegistrar__filterEvents___block_invoke;
        v26[3] = &unk_1E5587B08;
        objc_copyWeak(&v27, &location);
        int v22 = [(AXMIDIManager *)v21 initWithIdentifier:@"AXEventRegistrar" eventHandler:v26];
        [(AXSwitchRegistrar *)self setMidiManager:v22];

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
        return;
      }
      v9 = (const void *)v8;
      id v10 = [(AXSwitchRegistrar *)self _keyboardMatching];
      id v11 = [(AXSwitchRegistrar *)self _gamepadMatching];
      uint64_t v12 = [v10 arrayByAddingObjectsFromArray:v11];

      IOHIDEventSystemClientSetMatchingMultiple();
      CFRunLoopGetCurrent();
      IOHIDEventSystemClientScheduleWithRunLoop();
      IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority();
      [(AXSwitchRegistrar *)self setEventSystemClient:v9];
      CFRelease(v9);
    }
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
  v18 = (CFStringRef *)MEMORY[0x1E4F1D418];
  if (v5)
  {
    int v19 = CFRunLoopGetCurrent();
    IOHIDDeviceUnscheduleFromRunLoop(v5, v19, *v18);
    IOHIDDeviceClose(v5, 0);
    [(AXSwitchRegistrar *)self setDevice:0];
  }
  if (v6)
  {
    IOHIDEventSystemClientUnregisterEventFilterCallback();
    CFRunLoopGetCurrent();
    IOHIDEventSystemClientUnscheduleWithRunLoop();
    [(AXSwitchRegistrar *)self setEventSystemClient:0];
  }
  if (v7)
  {
    uint64_t v20 = CFRunLoopGetCurrent();
    IOHIDManagerUnscheduleFromRunLoop(v7, v20, *v18);
    IOHIDManagerClose(v7, 0);
    [(AXSwitchRegistrar *)self setManager:0];
  }

  [(AXSwitchRegistrar *)self setMidiManager:0];
}

void __35__AXSwitchRegistrar__filterEvents___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v8 = (id *)(a1 + 32);
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  [WeakRetained _handleMIDIEvent:v12 device:v11 entity:v10 source:v9];
}

- (AXSwitchRegistrarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXSwitchRegistrarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)addLongPressSwitch
{
  return self->_addLongPressSwitch;
}

- (void)setAddLongPressSwitch:(BOOL)a3
{
  self->_addLongPressSwitch = a3;
}

- (AXSwitch)aSwitch
{
  return self->_aSwitch;
}

- (void)setASwitch:(id)a3
{
}

- (__IOHIDDevice)device
{
  return self->_device;
}

- (void)setDevice:(__IOHIDDevice *)a3
{
}

- (__IOHIDEventSystemClient)eventSystemClient
{
  return self->_eventSystemClient;
}

- (void)setEventSystemClient:(__IOHIDEventSystemClient *)a3
{
}

- (__IOHIDManager)manager
{
  return self->_manager;
}

- (void)setManager:(__IOHIDManager *)a3
{
}

- (AXMIDIManager)midiManager
{
  return self->_midiManager;
}

- (void)setMidiManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_midiManager, 0);
  objc_storeStrong((id *)&self->_aSwitch, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end