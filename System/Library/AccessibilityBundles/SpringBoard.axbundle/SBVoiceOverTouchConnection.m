@interface SBVoiceOverTouchConnection
+ (id)defaultConnection;
- (BOOL)elementLabelerVisible;
- (BOOL)inVoiceOverPassthroughMode;
- (BOOL)screenCurtainEnabled;
- (BOOL)voiceOverTouchLabelElementAlertItem:(id)a3 textFieldShouldReturn:(id)a4;
- (void)_dismissLabelAlert;
- (void)_programmaticAppSwitch:(BOOL)a3;
- (void)_registerForMachConnection;
- (void)_registerVOTConnectionWithPort:(unsigned int)a3;
- (void)dealloc;
- (void)setInVoiceOverPassthroughMode:(BOOL)a3;
- (void)setLabelElementPanelVisible:(BOOL)a3 initialValue:(id)a4;
- (void)setScreenCurtainEnabled:(BOOL)a3;
- (void)setScreenCurtainEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)tearDownVoiceOverTouchConnection;
- (void)voiceOverTouchLabelElementAlertItemDidAccept:(id)a3 withTextField:(id)a4;
@end

@implementation SBVoiceOverTouchConnection

+ (id)defaultConnection
{
  v2 = (void *)_SBVOTConnection;
  if (!_SBVOTConnection)
  {
    uint64_t v3 = [objc_allocWithZone((Class)SBVoiceOverTouchConnection) init];
    v4 = (void *)_SBVOTConnection;
    _SBVOTConnection = v3;

    [(id)_SBVOTConnection _registerForMachConnection];
    v2 = (void *)_SBVOTConnection;
  }

  return v2;
}

- (void)_registerVOTConnectionWithPort:(unsigned int)a3
{
  if (a3 && ([(id)*MEMORY[0x263F1D020] _accessibilityIsAppReadyToBeProbed] & 1) != 0)
  {
    votMachPort = self->_votMachPort;
    if (votMachPort)
    {
      CFMachPortSetInvalidationCallBack(votMachPort, 0);
      v6 = self->_votMachPort;
      if (v6)
      {
        CFRelease(v6);
        self->_votMachPort = 0;
      }
    }
    _SBVOTPort = a3;
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = self;
    v7 = CFMachPortCreateWithPort(0, a3, 0, &context, 0);
    self->_votMachPort = v7;
    if (v7) {
      CFMachPortSetInvalidationCallBack(v7, (CFMachPortInvalidationCallBack)_voiceOverTouchDied);
    }
    _AXLogWithFacility();
  }
  else
  {
    [(SBVoiceOverTouchConnection *)self tearDownVoiceOverTouchConnection];
  }
}

- (void)_registerForMachConnection
{
  mach_port_t sp = 0;
  if (bootstrap_check_in(*MEMORY[0x263EF87F0], "com.apple.SpringBoard.VOT", &sp))
  {
    _AXLogWithFacility();
    v2 = (ipc_space_t *)MEMORY[0x263EF8960];
    if (!mach_port_allocate(*MEMORY[0x263EF8960], 1u, &sp)
      && !mach_port_insert_right(*v2, sp, sp, 0x14u)
      && bootstrap_register2())
    {
      _AXLogWithFacility();
    }
  }
  server_source = MSHCreateMIGServerSource();
  if (server_source)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, (CFRunLoopSourceRef)server_source, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  }
}

- (void)tearDownVoiceOverTouchConnection
{
  votMachmach_port_t Port = self->_votMachPort;
  if (votMachPort)
  {
    mach_port_t Port = CFMachPortGetPort(votMachPort);
    CFMachPortSetInvalidationCallBack(self->_votMachPort, 0);
    mach_port_deallocate(*MEMORY[0x263EF8960], Port);
    CFRelease(self->_votMachPort);
    self->_votMachmach_port_t Port = 0;
  }
  [(SBVoiceOverTouchConnection *)self setLabelElementPanelVisible:0 initialValue:0];
  [(SBVoiceOverTouchConnection *)self setScreenCurtainEnabled:0];
  _SBVOTmach_port_t Port = 0;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1CE10] object:0];

  [(SBVoiceOverTouchConnection *)self tearDownVoiceOverTouchConnection];
  if (server_source)
  {
    mach_port_name_t v4 = MSHGetMachPortFromSource();
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)server_source);
    mach_port_mod_refs(*MEMORY[0x263EF8960], v4, 1u, -1);
    CFRelease((CFTypeRef)server_source);
    server_source = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBVoiceOverTouchConnection;
  [(SBVoiceOverTouchConnection *)&v5 dealloc];
}

- (BOOL)elementLabelerVisible
{
  return self->_labelAlert != 0;
}

- (void)setLabelElementPanelVisible:(BOOL)a3 initialValue:(id)a4
{
  id v11 = a4;
  v6 = [(id)*MEMORY[0x263F1D020] _iosAccessibilityAttributeValue:1500];
  char v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    if (a3)
    {
      v8 = objc_alloc_init(SBVoiceOverTouchLabelElementAlertItem);
      labelAlert = self->_labelAlert;
      self->_labelAlert = v8;

      [(SBVoiceOverTouchLabelElementAlertItem *)self->_labelAlert setInitialValue:v11];
      [(SBVoiceOverTouchLabelElementAlertItem *)self->_labelAlert setVoiceOverAlertItemDelegate:self];
      [MEMORY[0x263F796B0] activateAlertItem:self->_labelAlert];
    }
    else
    {
      [(SBAlertItem *)self->_labelAlert dismiss];
      v10 = self->_labelAlert;
      self->_labelAlert = 0;
    }
  }
}

- (void)_programmaticAppSwitch:(BOOL)a3
{
  BOOL v3 = a3;
  SBSSpringBoardServerPort();
  if (v3)
  {
    JUMPOUT(0x245662F00);
  }

  JUMPOUT(0x245662EF0);
}

- (void)setScreenCurtainEnabled:(BOOL)a3
{
}

- (void)setScreenCurtainEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  self->_screenCurtainEnabled = a3;
  if (!a3
    || (+[AXSpringBoardGlue sharedInstance],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isDimmed],
        v5,
        (v6 & 1) == 0))
  {
    AXSpringBoardSetScreenCurtainEnabled(v4);
  }
}

- (void)_dismissLabelAlert
{
  [(SBAlertItem *)self->_labelAlert dismiss];
  labelAlert = self->_labelAlert;
  self->_labelAlert = 0;
}

- (void)voiceOverTouchLabelElementAlertItemDidAccept:(id)a3 withTextField:(id)a4
{
  objc_super v5 = objc_msgSend(a4, "text", a3);
  UIAccessibilityPostNotification(0x7E9u, v5);

  [(SBVoiceOverTouchConnection *)self _dismissLabelAlert];
}

- (BOOL)voiceOverTouchLabelElementAlertItem:(id)a3 textFieldShouldReturn:(id)a4
{
  if (a4)
  {
    char v6 = objc_msgSend(a4, "text", a3);
    UIAccessibilityPostNotification(0x7E9u, v6);

    [(SBVoiceOverTouchConnection *)self setLabelElementPanelVisible:0 initialValue:0];
  }
  return a4 == 0;
}

- (BOOL)screenCurtainEnabled
{
  return self->_screenCurtainEnabled;
}

- (BOOL)inVoiceOverPassthroughMode
{
  return self->inVoiceOverPassthroughMode;
}

- (void)setInVoiceOverPassthroughMode:(BOOL)a3
{
  self->inVoiceOverPassthroughMode = a3;
}

- (void).cxx_destruct
{
}

@end