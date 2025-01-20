@interface AXElementInteractionManager
+ (id)sharedManager;
- (AXElementInteractionManager)init;
- (AXElementInteractionManagerDelegate)delegate;
- (BOOL)_moveFocusByHitTesting:(int64_t)a3;
- (BOOL)displayCursor;
- (BOOL)performActivate;
- (BOOL)performDirectionalNavigation:(int64_t)a3;
- (id)_allowDelegateToDecideElement:(id)a3;
- (id)_client;
- (id)_clientIdentifier;
- (id)focusedElement;
- (int)_registerForAXNotifications:(BOOL)a3;
- (void)_handleLayoutChange;
- (void)_handleScreenChange;
- (void)_highlightElement:(id)a3;
- (void)_initializeAXObserver;
- (void)_moveToElement:(id)a3;
- (void)_sendMessage:(id)a3 withIdentifier:(unint64_t)a4 errorHandler:(id)a5;
- (void)_sendMessageWithIdentifier:(unint64_t)a3 errorHandler:(id)a4;
- (void)endInteractionMode;
- (void)initializeFocus;
- (void)setDelegate:(id)a3;
- (void)setDisplayCursor:(BOOL)a3;
- (void)startInteractionMode;
@end

@implementation AXElementInteractionManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedManager_Manager;
  return v2;
}

uint64_t __44__AXElementInteractionManager_sharedManager__block_invoke()
{
  sharedManager_Manager = objc_alloc_init(AXElementInteractionManager);
  return MEMORY[0x270F9A758]();
}

- (AXElementInteractionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXElementInteractionManager;
  v2 = [(AXElementInteractionManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(AXElementInteractionManager *)v2 setDisplayCursor:1];
    v4 = v3;
  }

  return v3;
}

- (void)startInteractionMode
{
  if (!self->_interactionEnabled)
  {
    self->_interactionEnabled = 1;
    if (_AXSApplicationAccessibilityEnabled())
    {
      int64_t v3 = 0;
    }
    else
    {
      _AXSApplicationAccessibilitySetEnabled();
      int64_t v3 = 1000000000;
    }
    [(AXElementInteractionManager *)self _initializeAXObserver];
    dispatch_time_t v4 = dispatch_time(0, v3);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__AXElementInteractionManager_startInteractionMode__block_invoke;
    block[3] = &unk_264E38438;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __51__AXElementInteractionManager_startInteractionMode__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) initializeFocus];
}

- (void)_initializeAXObserver
{
  pid_t pid = 0;
  AXUIElementGetPid((AXUIElementRef)[MEMORY[0x263F21690] systemWideAXUIElement], &pid);
  if (AXObserverCreate(pid, (AXObserverCallback)_axEventHandler, &self->_axEventObserver))
  {
    NSLog(&cfstr_AxRegisterForE.isa);
  }
  else
  {
    CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource(self->_axEventObserver);
    if (RunLoopSource)
    {
      dispatch_time_t v4 = RunLoopSource;
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v4, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      [(AXElementInteractionManager *)self _registerForAXNotifications:1];
    }
    else
    {
      NSLog(&cfstr_AxCouldNotGetR.isa);
    }
  }
}

- (int)_registerForAXNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (const __AXUIElement *)[MEMORY[0x263F21690] systemWideAXUIElement];
  uint64_t v6 = 0;
  LODWORD(v7) = 0;
  do
  {
    axEventObserver = self->_axEventObserver;
    CFStringRef v9 = (const __CFString *)dword_23C22BC50[v6];
    if (v3) {
      AXError v10 = AXObserverAddNotification(axEventObserver, v5, v9, self);
    }
    else {
      AXError v10 = AXObserverRemoveNotification(axEventObserver, v5, v9);
    }
    ++v6;
    if (v7) {
      uint64_t v7 = v7;
    }
    else {
      uint64_t v7 = v10;
    }
  }
  while (v6 != 4);
  if (v7)
  {
    v11 = @"unregister";
    if (v3) {
      v11 = @"register";
    }
    NSLog(&cfstr_UnableToForNot.isa, v11, v7);
  }
  return v7;
}

- (void)setDisplayCursor:(BOOL)a3
{
  self->_displayCursor = a3;
  [(AXElementInteractionManager *)self _sendMessage:MEMORY[0x263EFFA78] withIdentifier:2 errorHandler:&__block_literal_global_284];
}

void __48__AXElementInteractionManager_setDisplayCursor___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)endInteractionMode
{
  if (self->_interactionEnabled)
  {
    [(AXElementInteractionManager *)self _registerForAXNotifications:0];
    axEventObserver = self->_axEventObserver;
    if (axEventObserver)
    {
      CFRelease(axEventObserver);
      self->_axEventObserver = 0;
    }
    self->_interactionEnabled = 0;
    _AXSApplicationAccessibilitySetEnabled();
    focusedElement = self->_focusedElement;
    self->_focusedElement = 0;

    uint64_t v5 = MEMORY[0x263EFFA78];
    [(AXElementInteractionManager *)self _sendMessage:v5 withIdentifier:2 errorHandler:&__block_literal_global_289];
  }
}

void __49__AXElementInteractionManager_endInteractionMode__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)_handleScreenChange
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__AXElementInteractionManager__handleScreenChange__block_invoke;
  block[3] = &unk_264E38438;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

uint64_t __50__AXElementInteractionManager__handleScreenChange__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 axElementInteractionManagerScreenChanged:*(void *)(a1 + 32)];

  dispatch_time_t v3 = *(void **)(a1 + 32);
  return [v3 initializeFocus];
}

- (void)_handleLayoutChange
{
  if (([(AXElement *)self->_focusedElement isValid] & 1) == 0)
  {
    [(AXElementInteractionManager *)self initializeFocus];
  }
}

- (id)_allowDelegateToDecideElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXElementInteractionManager *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    do
    {
      uint64_t v7 = [(AXElementInteractionManager *)self delegate];
      char v8 = [v7 axElementInteraction:self shouldMoveToElement:v4];

      if (v8) {
        break;
      }
      CFStringRef v9 = [v4 nextElementsWithCount:1];
      uint64_t v10 = [v9 firstObject];

      id v4 = (id)v10;
    }
    while (v10);
  }
  return v4;
}

- (void)initializeFocus
{
  focusedElement = self->_focusedElement;
  self->_focusedElement = 0;

  id v4 = [MEMORY[0x263F21668] systemWideElement];
  uint64_t v5 = [v4 systemApplication];
  char v6 = [v5 currentApplications];
  uint64_t v7 = [v6 firstObject];

  char v8 = [v7 firstElementInApplicationForFocus];
  CFStringRef v9 = [MEMORY[0x263F21668] systemWideElement];
  uint64_t v10 = [v9 systemApplication];
  v16 = self->_focusedElement;
  LOBYTE(v15) = 1;
  _AXLogWithFacility();

  if (v8)
  {
    v11 = [(AXElementInteractionManager *)self _allowDelegateToDecideElement:v8, v15, @"Apps: %@\n %@\n %@\n", v10, v7, v16];

    if (v11)
    {
      v12 = self->_focusedElement;
      self->_focusedElement = v11;
      v13 = v11;

      [(AXElementInteractionManager *)self _highlightElement:self->_focusedElement];
    }
  }
  else
  {
    dispatch_time_t v14 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__AXElementInteractionManager_initializeFocus__block_invoke;
    block[3] = &unk_264E38438;
    block[4] = self;
    dispatch_after(v14, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __46__AXElementInteractionManager_initializeFocus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) initializeFocus];
}

- (id)focusedElement
{
  return self->_focusedElement;
}

- (void)_highlightElement:(id)a3
{
  if (self->_displayCursor)
  {
    id v4 = a3;
    [v4 path];
    id v15 = (id)AX_CGPathCopyDataRepresentation();
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    [v4 frame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    v17.origin.x = v7;
    v17.origin.y = v9;
    v17.size.width = v11;
    v17.size.height = v13;
    dispatch_time_t v14 = NSStringFromCGRect(v17);
    [v5 setObject:v14 forKeyedSubscript:@"frame"];

    if (v15) {
      [v5 setObject:v15 forKeyedSubscript:@"path"];
    }
    [(AXElementInteractionManager *)self _sendMessage:v5 withIdentifier:1 errorHandler:&__block_literal_global_304];
  }
}

void __49__AXElementInteractionManager__highlightElement___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)_moveToElement:(id)a3
{
  objc_storeStrong((id *)&self->_focusedElement, a3);
  id v5 = a3;
  focusedElement = self->_focusedElement;
  id v8 = v5;
  LOBYTE(v6) = 1;
  _AXLogWithFacility();
  [(AXElement *)self->_focusedElement scrollToVisible];
  [(AXElementInteractionManager *)self _highlightElement:v8];
}

- (BOOL)performDirectionalNavigation:(int64_t)a3
{
  return self->_focusedElement
      && [(AXElementInteractionManager *)self _moveFocusByHitTesting:a3];
}

- (BOOL)_moveFocusByHitTesting:(int64_t)a3
{
  [(AXElement *)self->_focusedElement frame];
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  rect.origin.x = v11;
  AX_CGRectGetCenter();
  double v13 = v12;
  double v15 = v14;
  double v16 = 10.0;
  if (AXDeviceIsPad()) {
    double v17 = 20.0;
  }
  else {
    double v17 = 10.0;
  }
  if (AXDeviceIsPad()) {
    double v16 = 20.0;
  }
  BOOL v18 = a3 == 3;
  BOOL v19 = a3 == 4;
  unint64_t v20 = a3 - 1;
  BOOL v21 = a3 == 1;
  BOOL v22 = a3 == 2;
  v23 = [MEMORY[0x263F21668] systemWideElement];
  v24 = [v23 systemApplication];
  uint64_t v25 = [v24 applicationOrientation];

  *(void *)&rect.size.width = MEMORY[0x263EF8330];
  *(void *)&rect.size.height = 3221225472;
  v58 = __54__AXElementInteractionManager__moveFocusByHitTesting___block_invoke;
  v59 = &unk_264E38480;
  v60 = self;
  v26 = (uint64_t (**)(void, double, double))MEMORY[0x23ECDDCE0](&rect.size);
  double v27 = MEMORY[0x23ECDDAE0]();
  rect.origin.y = v28;
  if ((unint64_t)(v25 - 1) <= 1)
  {
    if (v25 == 2)
    {
      if (v20 > 1)
      {
        BOOL v19 = a3 != 4;
        BOOL v18 = a3 != 3;
      }
      else
      {
        BOOL v22 = a3 != 2;
        BOOL v21 = a3 != 1;
      }
    }
    int v29 = v18 || v19;
    double v30 = -v16;
    if (v21) {
      double v31 = -v16;
    }
    else {
      double v31 = v16;
    }
    if (v25 == 2) {
      double v32 = -v17;
    }
    else {
      double v32 = v17;
    }
    if (v25 != 2) {
      double v30 = v16;
    }
    double v51 = v32;
    double v53 = v30;
    double v33 = -0.0;
    if (v29) {
      double v34 = -0.0;
    }
    else {
      double v34 = v31;
    }
    if (v19) {
      double v33 = v17;
    }
    if (v18) {
      double v35 = -v17;
    }
    else {
      double v35 = v33;
    }
    double v55 = v27;
LABEL_32:
    if (!v21 && !v22) {
      goto LABEL_118;
    }
    v61.origin.x = rect.origin.x;
    v61.origin.y = v6;
    v61.size.width = v8;
    v61.size.height = v10;
    if (v15 <= CGRectGetMinY(v61) - v10
      || (v62.origin.x = rect.origin.x,
          v62.origin.y = v6,
          v62.size.width = v8,
          v62.size.height = v10,
          v15 >= v10 + CGRectGetMaxY(v62)))
    {
LABEL_118:
      if (!v29) {
        goto LABEL_114;
      }
      v63.origin.x = rect.origin.x;
      v63.origin.y = v6;
      v63.size.width = v8;
      v63.size.height = v10;
      if (v13 <= CGRectGetMinX(v63) - v8) {
        goto LABEL_114;
      }
      v64.origin.x = rect.origin.x;
      v64.origin.y = v6;
      v64.size.width = v8;
      v64.size.height = v10;
      double v27 = v55;
      if (v13 >= v8 + CGRectGetMaxX(v64)) {
        goto LABEL_114;
      }
    }
    while (1)
    {
      if (v21)
      {
        if (v13 >= 0.0 && v13 <= v27) {
          goto LABEL_58;
        }
      }
      else
      {
        char v37 = v13 < 0.0 || !v22;
        if ((v37 & 1) == 0 && v13 <= v27) {
          goto LABEL_58;
        }
      }
      if (v18)
      {
        if (v15 < 0.0 || v15 > rect.origin.y) {
          goto LABEL_61;
        }
      }
      else
      {
        char v38 = v15 < 0.0 || !v19;
        if ((v38 & 1) != 0 || v15 > rect.origin.y)
        {
          if (v29)
          {
LABEL_61:
            double v13 = v53 + v13;
            goto LABEL_32;
          }
          double v15 = v51 + v15;
          goto LABEL_32;
        }
      }
LABEL_58:
      if (v26[2](v26, v13, v15)) {
        goto LABEL_113;
      }
      double v13 = v13 + v34;
      double v15 = v15 + v35;
    }
  }
  if ((unint64_t)(v25 - 3) <= 1)
  {
    if (v25 == 3)
    {
      if (v20 > 1)
      {
        BOOL v19 = a3 != 4;
        BOOL v18 = a3 != 3;
      }
      else
      {
        BOOL v22 = a3 != 2;
        BOOL v21 = a3 != 1;
      }
    }
    int v39 = v18 || v19;
    double v40 = -v17;
    if (v22) {
      double v41 = -v17;
    }
    else {
      double v41 = v17;
    }
    if (v25 == 3) {
      double v42 = -v16;
    }
    else {
      double v42 = v16;
    }
    if (v25 != 3) {
      double v40 = v17;
    }
    double v52 = v42;
    double v54 = v40;
    if (v19) {
      double v43 = v16;
    }
    else {
      double v43 = -0.0;
    }
    if (v18) {
      double v44 = -v16;
    }
    else {
      double v44 = v43;
    }
    if (v39) {
      double v45 = -0.0;
    }
    else {
      double v45 = v41;
    }
    double v56 = v27;
LABEL_82:
    if (!v21 && !v22) {
      goto LABEL_119;
    }
    v65.origin.x = rect.origin.x;
    v65.origin.y = v6;
    v65.size.width = v8;
    v65.size.height = v10;
    if (v13 <= CGRectGetMinX(v65) - v8
      || (v66.origin.x = rect.origin.x,
          v66.origin.y = v6,
          v66.size.width = v8,
          v66.size.height = v10,
          v13 >= v8 + CGRectGetMaxX(v66)))
    {
LABEL_119:
      if (!v39) {
        goto LABEL_114;
      }
      v67.origin.x = rect.origin.x;
      v67.origin.y = v6;
      v67.size.width = v8;
      v67.size.height = v10;
      if (v15 <= CGRectGetMinY(v67) - v10) {
        goto LABEL_114;
      }
      v68.origin.x = rect.origin.x;
      v68.origin.y = v6;
      v68.size.width = v8;
      v68.size.height = v10;
      double v27 = v56;
      if (v15 >= v10 + CGRectGetMaxY(v68)) {
        goto LABEL_114;
      }
    }
    while (1)
    {
      if (v21)
      {
        if (v15 >= 0.0 && v15 <= rect.origin.y) {
          goto LABEL_108;
        }
      }
      else
      {
        char v47 = v15 < 0.0 || !v22;
        if ((v47 & 1) == 0 && v15 <= rect.origin.y) {
          goto LABEL_108;
        }
      }
      if (v18)
      {
        if (v13 < 0.0 || v13 > v27) {
          goto LABEL_111;
        }
      }
      else
      {
        char v48 = v13 < 0.0 || !v19;
        if ((v48 & 1) != 0 || v13 > v27)
        {
          if (v39)
          {
LABEL_111:
            double v15 = v54 + v15;
            goto LABEL_82;
          }
          double v13 = v52 + v13;
          goto LABEL_82;
        }
      }
LABEL_108:
      if (v26[2](v26, v13, v15))
      {
LABEL_113:
        BOOL v49 = 1;
        goto LABEL_115;
      }
      double v13 = v13 + v44;
      double v15 = v15 + v45;
    }
  }
LABEL_114:
  BOOL v49 = 0;
LABEL_115:

  return v49;
}

uint64_t __54__AXElementInteractionManager__moveFocusByHitTesting___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x263F21668], "elementAtCoordinate:withVisualPadding:", 0);
  dispatch_time_t v3 = [*(id *)(a1 + 32) _allowDelegateToDecideElement:v2];

  uint64_t v4 = 0;
  if (([v3 isEqual:*(void *)(*(void *)(a1 + 32) + 16)] & 1) == 0)
  {
    if ([v3 isAccessibleElement]
      && (int v5 = [v3 windowContextId],
          v5 == [*(id *)(*(void *)(a1 + 32) + 16) windowContextId]))
    {
      [*(id *)(a1 + 32) _moveToElement:v3];
      uint64_t v4 = 1;
    }
    else
    {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

- (BOOL)performActivate
{
  return [(AXElement *)self->_focusedElement press];
}

- (id)_clientIdentifier
{
  v2 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v3 = [v2 processIdentifier];

  uint64_t v4 = NSString;
  int v5 = [NSNumber numberWithInt:v3];
  CGFloat v6 = [v4 stringWithFormat:@"AXElementInteractionIdentifier-%@", v5];

  return v6;
}

- (id)_client
{
  client = self->_client;
  if (!client)
  {
    uint64_t v4 = [(AXElementInteractionManager *)self _clientIdentifier];
    int v5 = (AXUIClient *)[objc_alloc(MEMORY[0x263F22198]) initWithIdentifier:v4 serviceBundleName:@"AXElementInteractionUIServer"];
    CGFloat v6 = self->_client;
    self->_client = v5;

    [(AXUIClient *)self->_client setDelegate:self];
    client = self->_client;
  }
  return client;
}

- (void)_sendMessageWithIdentifier:(unint64_t)a3 errorHandler:(id)a4
{
}

- (void)_sendMessage:(id)a3 withIdentifier:(unint64_t)a4 errorHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  double v10 = [(AXElementInteractionManager *)self _client];
  CGFloat v11 = [MEMORY[0x263F227F8] mainAccessQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__AXElementInteractionManager__sendMessage_withIdentifier_errorHandler___block_invoke;
  v13[3] = &unk_264E384A8;
  id v14 = v8;
  unint64_t v15 = a4;
  id v12 = v8;
  [v10 sendAsynchronousMessage:v9 withIdentifier:a4 targetAccessQueue:v11 completion:v13];
}

void __72__AXElementInteractionManager__sendMessage_withIdentifier_errorHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v4 = a3;
    _AXLogWithFacility();
    objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:code:description:", @"AXElementInteraction", 1, @"Could not perform %d action: %@", *(void *)(a1 + 40), v4, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    }
  }
}

- (AXElementInteractionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXElementInteractionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)displayCursor
{
  return self->_displayCursor;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_focusedElement, 0);
}

@end