@interface CABTMIDILocalPeripheralViewController
- (BOOL)advertiseServiceWithName:(id)a3 completionBlock:(id)a4 error:(id *)a5;
- (BOOL)changeServiceNameTo:(id)a3 completionBlock:(id)a4 error:(id *)a5;
- (BOOL)disconnectLocalPeripheral;
- (BOOL)stopAdvertisingServiceWithCompletionBlock:(id)a3 error:(id *)a4;
- (CABTMIDILocalPeripheralViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)advertisedServiceName;
- (id)statusString;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)title;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)activateController:(id)a3;
- (void)advertiseServiceSwitchToggled:(id)a3;
- (void)advertiseTimerFired:(id)a3;
- (void)cleanup;
- (void)deactivateController:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)messageTimerFired:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setStatusString:(id)a3 animateIndicator:(BOOL)a4 isError:(BOOL)a5;
- (void)stopTimers;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)textFieldDone:(id)a3;
- (void)updateAdvertiseUI;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CABTMIDILocalPeripheralViewController

- (CABTMIDILocalPeripheralViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CABTMIDILocalPeripheralViewController;
  v4 = [(CABTMIDILocalPeripheralViewController *)&v7 initWithNibName:a3 bundle:a4];
  if (v4) {
    BOOL v5 = gPeripheralNotificationClient == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    MIDIClientCreate(&stru_26CF7B700, (MIDINotifyProc)AdvertisingNotifyProc, v4, (MIDIClientRef *)&gPeripheralNotificationClient);
  }
  return v4;
}

- (void)dealloc
{
  [(CABTMIDILocalPeripheralViewController *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)CABTMIDILocalPeripheralViewController;
  [(CABTMIDILocalPeripheralViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CABTMIDILocalPeripheralViewController;
  [(CABTMIDILocalPeripheralViewController *)&v7 viewDidLoad];
  objc_super v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F83428];
  uint64_t v5 = [MEMORY[0x263F08A48] mainQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__CABTMIDILocalPeripheralViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_2644B0180;
  v6[4] = self;
  [v3 addObserverForName:v4 object:self queue:v5 usingBlock:v6];
}

uint64_t __52__CABTMIDILocalPeripheralViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) view];

  return [v1 reloadData];
}

- (void)loadView
{
  self->advertisingManager = objc_alloc_init(AMSBTLEAdvertisementManager);
  self->theServiceName = (NSString *)[(CABTMIDILocalPeripheralViewController *)self advertisedServiceName];
  id v3 = objc_alloc(MEMORY[0x263F82C78]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F82B60], "mainScreen"), "applicationFrame");
  uint64_t v4 = objc_msgSend(v3, "initWithFrame:style:", 1);
  [v4 setAutoresizingMask:18];
  [v4 setDelegate:self];
  [v4 setDataSource:self];
  [v4 setAllowsSelection:0];
  [v4 setRowHeight:*MEMORY[0x263F839B8]];
  [v4 setEstimatedRowHeight:44.0];
  [(CABTMIDILocalPeripheralViewController *)self setView:v4];
  self->advertiseTimeout = -1;
  self->fullRefreshCounter = 0;
  uint64_t v5 = (NSTimer *)(id)objc_msgSend(MEMORY[0x263EFFA20], "timerWithTimeInterval:target:selector:userInfo:repeats:", +[CATimerManager getWeakReferenceOfObject:](CATimerManager, "getWeakReferenceOfObject:", self), sel_advertiseTimerFired_, 0, 1, 1.0);
  self->advertiseTimer = v5;
  [(NSTimer *)v5 setTolerance:0.150000006];
  v6 = (void *)[MEMORY[0x263EFF9F0] currentRunLoop];
  [v6 addTimer:self->advertiseTimer forMode:*MEMORY[0x263EFF588]];
  [(CABTMIDILocalPeripheralViewController *)self addObserver:self forKeyPath:@"parentViewController" options:0 context:0];
  self->advertising = [(AMSBTLEAdvertisementManager *)self->advertisingManager isAdvertising];
  [(CABTMIDILocalPeripheralViewController *)self updateAdvertiseUI];
  [v4 reloadData];
  objc_super v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_activateController_ name:*MEMORY[0x263F83318] object:0];
  v8 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel_deactivateController_ name:*MEMORY[0x263F833C0] object:0];
  self->didCleanup = 0;
}

- (void)stopTimers
{
  advertiseTimer = self->advertiseTimer;
  if (advertiseTimer)
  {
    [(NSTimer *)advertiseTimer invalidate];

    self->advertiseTimer = 0;
  }
  messageTimer = self->messageTimer;
  if (messageTimer)
  {
    [(NSTimer *)messageTimer invalidate];

    self->messageTimer = 0;
  }
}

- (void)cleanup
{
  if (!self->didCleanup)
  {
    [(CABTMIDILocalPeripheralViewController *)self removeObserver:self forKeyPath:@"parentViewController"];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
    [(CABTMIDILocalPeripheralViewController *)self stopTimers];

    if (gPeripheralNotificationClient)
    {
      MIDIClientDispose(gPeripheralNotificationClient);
      gPeripheralNotificationClient = 0;
    }
    self->didCleanup = 1;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  int v8 = objc_msgSend(@"parentViewController", "isEqualToString:", a3, a4, a5, a6);
  if (a4 == self && v8 && ![a4 parentViewController])
  {
    [a4 cleanup];
  }
}

- (void)activateController:(id)a3
{
  self->advertiseTimeout = 10;
  uint64_t v4 = (NSTimer *)(id)objc_msgSend(MEMORY[0x263EFFA20], "timerWithTimeInterval:target:selector:userInfo:repeats:", +[CATimerManager getWeakReferenceOfObject:](CATimerManager, "getWeakReferenceOfObject:", self), sel_advertiseTimerFired_, 0, 1, 1.0);
  self->advertiseTimer = v4;
  [(NSTimer *)v4 setTolerance:0.150000006];
  uint64_t v5 = (void *)[MEMORY[0x263EFF9F0] currentRunLoop];
  [v5 addTimer:self->advertiseTimer forMode:*MEMORY[0x263EFF588]];
  if (self->advertising)
  {
    id v6 = [(CABTMIDILocalPeripheralViewController *)self advertisedServiceName];
    [(CABTMIDILocalPeripheralViewController *)self advertiseServiceWithName:v6 completionBlock:&__block_literal_global error:0];
  }
}

- (void)deactivateController:(id)a3
{
  [(CABTMIDILocalPeripheralViewController *)self stopTimers];

  [(CABTMIDILocalPeripheralViewController *)self stopAdvertisingServiceWithCompletionBlock:&__block_literal_global_38 error:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CABTMIDILocalPeripheralViewController *)self cleanup];
  v5.receiver = self;
  v5.super_class = (Class)CABTMIDILocalPeripheralViewController;
  [(CABTMIDILocalPeripheralViewController *)&v5 viewDidDisappear:v3];
}

- (void)updateAdvertiseUI
{
  int v3 = [MEMORY[0x263F00B68] localPeripheral];
  BOOL v4 = [(AMSBTLEAdvertisementManager *)self->advertisingManager isAdvertising];
  self->advertising = v4;
  if (v3)
  {
    if (v4) {
      [(CABTMIDILocalPeripheralViewController *)self stopAdvertisingServiceWithCompletionBlock:&__block_literal_global_56 error:0];
    }
    objc_super v5 = NSString;
    uint64_t BTLELocalizedString = priv_getBTLELocalizedString(@"Connected to %@", @"Connected to %@. Advertising disabled.");
    id v7 = (id)[MEMORY[0x263F00B68] localPeripheralName];
  }
  else
  {
    objc_super v5 = NSString;
    if (v4)
    {
      int v8 = @"Serv Reg as %@";
      v9 = @"Now discoverable as %@";
    }
    else
    {
      int v8 = @"Advertise as %@";
      v9 = @"Select Advertise to be discoverable as %@";
    }
    uint64_t BTLELocalizedString = priv_getBTLELocalizedString((uint64_t)v8, (uint64_t)v9);
    id v7 = [(CABTMIDILocalPeripheralViewController *)self advertisedServiceName];
  }
  uint64_t v10 = objc_msgSend(v5, "stringWithFormat:", BTLELocalizedString, v7);

  [(CABTMIDILocalPeripheralViewController *)self setStatusString:v10 animateIndicator:0 isError:0];
}

- (id)title
{
  return (id)priv_getBTLELocalizedString(@"Local MIDI Service", @"Local MIDI Service");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return a4 == 1;
  }
  else {
    return 2;
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1) {
    return (id)priv_getBTLELocalizedString(@"stat", @"Status");
  }
  if (a4) {
    return 0;
  }
  return (id)priv_getBTLELocalizedString(@"Settings", @"Peripheral Settings");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v34[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = [a3 dequeueReusableCellWithIdentifier:@"Cell"];
  if (v6)
  {
    id v7 = (id)v6;
    if (![a4 section])
    {
      if ([a4 row])
      {
        if (self->advertiseTimeout == -1) {
          objc_msgSend((id)objc_msgSend(v7, "accessoryView"), "setOn:", -[AMSBTLEAdvertisementManager isAdvertising](self->advertisingManager, "isAdvertising"));
        }
        objc_msgSend((id)objc_msgSend(v7, "accessoryView"), "setEnabled:", objc_msgSend(MEMORY[0x263F00B68], "localPeripheral") == 0);
      }
      else
      {
        [(UITextField *)self->serviceNameField setText:[(CABTMIDILocalPeripheralViewController *)self advertisedServiceName]];
      }
    }
    if ([a4 section] == 1) {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "contentView"), "viewWithTag:", 5), "setText:", -[CABTMIDILocalPeripheralViewController statusString](self, "statusString"));
    }
  }
  else
  {
    id v7 = (id)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"Cell"];
    if ([a4 section])
    {
      int v8 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:2];
      self->indicator = v8;
      [(UIActivityIndicatorView *)v8 setTag:1];
      [(UIActivityIndicatorView *)self->indicator setTranslatesAutoresizingMaskIntoConstraints:0];
      -[UIActivityIndicatorView setFrame:](self->indicator, "setFrame:", 0.0, 0.0, 24.0, 24.0);
      [(UIActivityIndicatorView *)self->indicator setHidesWhenStopped:0];
      [(UIActivityIndicatorView *)self->indicator setHidden:1];
      LODWORD(v9) = 1148846080;
      [(UIActivityIndicatorView *)self->indicator setContentHuggingPriority:0 forAxis:v9];
      LODWORD(v10) = 1148846080;
      [(UIActivityIndicatorView *)self->indicator setContentCompressionResistancePriority:0 forAxis:v10];
      id v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", 0.0, 0.0, 100.0, 15.0);
      [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v11 setNumberOfLines:0];
      objc_msgSend(v11, "setText:", -[CABTMIDILocalPeripheralViewController statusString](self, "statusString"));
      objc_msgSend(v11, "setFont:", objc_msgSend(MEMORY[0x263F81708], "preferredFontForTextStyle:", *MEMORY[0x263F835F0]));
      [v11 setEnabled:0];
      LODWORD(v12) = 1148829696;
      [v11 setContentCompressionResistancePriority:0 forAxis:v12];
      LODWORD(v13) = 1148846080;
      [v11 setContentCompressionResistancePriority:1 forAxis:v13];
      [v11 setTag:5];
      id v14 = objc_alloc(MEMORY[0x263F82BF8]);
      indicator = self->indicator;
      v33[0] = v11;
      v33[1] = indicator;
      id v16 = (id)objc_msgSend(v14, "initWithArrangedSubviews:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v33, 2));
      [v16 setAxis:0];
      v17 = v16;
      uint64_t v18 = 0;
    }
    else
    {
      if ([a4 row])
      {
        objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setText:", priv_getBTLELocalizedString(@"Advertise", @"Advertise MIDI Service"));
        id v22 = objc_alloc(MEMORY[0x263F82C40]);
        v23 = objc_msgSend(v22, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        objc_msgSend(v23, "setOn:", -[AMSBTLEAdvertisementManager isAdvertising](self->advertisingManager, "isAdvertising"));
        [v23 addTarget:self action:sel_advertiseServiceSwitchToggled_ forControlEvents:4096];
        objc_msgSend(v23, "setEnabled:", objc_msgSend(MEMORY[0x263F00B68], "localPeripheral") == 0);
        [v7 setAccessoryView:v23];
        return v7;
      }
      id v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", 0.0, 0.0, 100.0, 15.0);
      [v25 setText:priv_getBTLELocalizedString(@"name", @"Name")];
      [v25 setEnabled:0];
      [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v26) = 1132134400;
      [v25 setContentHuggingPriority:0 forAxis:v26];
      LODWORD(v27) = 1132134400;
      [v25 setContentHuggingPriority:1 forAxis:v27];
      LODWORD(v28) = 1144766464;
      [v25 setContentCompressionResistancePriority:0 forAxis:v28];
      self->serviceNameField = (UITextField *)objc_alloc_init(MEMORY[0x263F82CF0]);
      [(UITextField *)self->serviceNameField setText:[(CABTMIDILocalPeripheralViewController *)self advertisedServiceName]];
      [(UITextField *)self->serviceNameField setClearButtonMode:3];
      [(UITextField *)self->serviceNameField setPlaceholder:priv_getBTLELocalizedString(@"Serv Name", @"Service Name")];
      [(UITextField *)self->serviceNameField setDelegate:self];
      -[UITextField setFont:](self->serviceNameField, "setFont:", [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]]);
      [(UITextField *)self->serviceNameField addTarget:self action:sel_textFieldDone_ forControlEvents:0x80000];
      [(UITextField *)self->serviceNameField setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v29) = 1144750080;
      [(UITextField *)self->serviceNameField setContentCompressionResistancePriority:0 forAxis:v29];
      LODWORD(v30) = 1132068864;
      [(UITextField *)self->serviceNameField setContentHuggingPriority:0 forAxis:v30];
      id v31 = objc_alloc(MEMORY[0x263F82BF8]);
      serviceNameField = self->serviceNameField;
      v34[0] = v25;
      v34[1] = serviceNameField;
      id v16 = (id)objc_msgSend(v31, "initWithArrangedSubviews:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v34, 2));
      [v16 setAxis:0];
      v17 = v16;
      uint64_t v18 = 2;
    }
    [v17 setAlignment:v18];
    [v16 setSpacing:8.0];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend((id)objc_msgSend(v7, "contentView"), "addSubview:", v16);
    v19 = _NSDictionaryOfVariableBindings(&cfstr_Stack.isa, v16, 0);
    v20 = (void *)[v7 contentView];
    objc_msgSend(v20, "addConstraints:", objc_msgSend(MEMORY[0x263F08938], "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[stack]-|", 0, 0, v19));
    v21 = (void *)[v7 contentView];
    objc_msgSend(v21, "addConstraints:", objc_msgSend(MEMORY[0x263F08938], "constraintsWithVisualFormat:options:metrics:views:", @"V:|-[stack]-|", 0, 0, v19));
  }
  return v7;
}

- (void)textFieldDone:(id)a3
{
  [a3 resignFirstResponder];
  if ([(NSString *)[(UITextField *)self->serviceNameField text] isEqualToString:&stru_26CF7B700])
  {
    id v4 = [(CABTMIDILocalPeripheralViewController *)self advertisedServiceName];
    serviceNameField = self->serviceNameField;
    [(UITextField *)serviceNameField setText:v4];
  }
  else
  {
    uint64_t v6 = [(UITextField *)self->serviceNameField text];
    self->theServiceName = v6;
    [(CABTMIDILocalPeripheralViewController *)self changeServiceNameTo:v6 completionBlock:&__block_literal_global_122 error:0];
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
}

- (void)textFieldDidEndEditing:(id)a3
{
}

- (void)setStatusString:(id)a3 animateIndicator:(BOOL)a4 isError:(BOOL)a5
{
  BOOL v5 = a5;

  self->statusString = (NSString *)a3;
  self->isErrorMessage = v5;
  if (v5)
  {
    messageTimer = self->messageTimer;
    if (messageTimer)
    {
      -[NSTimer setFireDate:](messageTimer, "setFireDate:", [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:10.0]);
    }
    else
    {
      double v10 = (NSTimer *)objc_msgSend(MEMORY[0x263EFFA20], "timerWithTimeInterval:target:selector:userInfo:repeats:", +[CATimerManager getWeakReferenceOfObject:](CATimerManager, "getWeakReferenceOfObject:", self), sel_messageTimerFired_, 0, 0, 10.0);
      self->messageTimer = v10;
      [(NSTimer *)v10 setTolerance:0.5];
      id v11 = self->messageTimer;
      double v12 = (void *)[MEMORY[0x263EFF9F0] currentRunLoop];
      [v12 addTimer:self->messageTimer forMode:*MEMORY[0x263EFF588]];
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__CABTMIDILocalPeripheralViewController_setStatusString_animateIndicator_isError___block_invoke;
  v13[3] = &unk_2644B01C8;
  BOOL v14 = a4;
  v13[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v13);
}

uint64_t __82__CABTMIDILocalPeripheralViewController_setStatusString_animateIndicator_isError___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  int v3 = *(void **)(*(void *)(a1 + 32) + 1008);
  if (v2)
  {
    [v3 setHidden:0];
    [*(id *)(*(void *)(a1 + 32) + 1008) startAnimating];
  }
  else
  {
    [v3 setHidden:1];
    [*(id *)(*(void *)(a1 + 32) + 1008) stopAnimating];
  }
  id v4 = (void *)[*(id *)(a1 + 32) view];

  return [v4 reloadData];
}

- (id)statusString
{
  id result = self->statusString;
  if (!result)
  {
    id result = (id)priv_getBTLELocalizedString(@"rdy", @"Ready");
    self->statusString = (NSString *)result;
  }
  return result;
}

- (void)advertiseServiceSwitchToggled:(id)a3
{
  uint64_t v7 = 0;
  self->advertiseTimeout = 10;
  [a3 setEnabled:0];
  self->advertising = [(AMSBTLEAdvertisementManager *)self->advertisingManager isAdvertising];
  if ([MEMORY[0x263F00B68] localPeripheral])
  {
    -[CABTMIDILocalPeripheralViewController setStatusString:animateIndicator:isError:](self, "setStatusString:animateIndicator:isError:", [NSString stringWithFormat:priv_getBTLELocalizedString(@"Disconnecting %@", @"Disconnecting from %@..."), objc_msgSend(MEMORY[0x263F00B68], "localPeripheralName")], 1, 0);
    if ([(CABTMIDILocalPeripheralViewController *)self disconnectLocalPeripheral]) {
      return;
    }
    goto LABEL_3;
  }
  if (!self->advertising)
  {
    id v4 = [(CABTMIDILocalPeripheralViewController *)self advertisedServiceName];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __71__CABTMIDILocalPeripheralViewController_advertiseServiceSwitchToggled___block_invoke;
    v6[3] = &unk_2644B01F0;
    v6[4] = self;
    if ([(CABTMIDILocalPeripheralViewController *)self advertiseServiceWithName:v4 completionBlock:v6 error:&v7])
    {
      return;
    }
    goto LABEL_3;
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__CABTMIDILocalPeripheralViewController_advertiseServiceSwitchToggled___block_invoke_2;
  v5[3] = &unk_2644B01F0;
  v5[4] = self;
  if (![(CABTMIDILocalPeripheralViewController *)self stopAdvertisingServiceWithCompletionBlock:v5 error:&v7])LABEL_3:[(CABTMIDILocalPeripheralViewController *)self updateAdvertiseUI]; {
}
  }

uint64_t __71__CABTMIDILocalPeripheralViewController_advertiseServiceSwitchToggled___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t BTLELocalizedString = priv_getBTLELocalizedString(@"starting", @"Registering Service...");

  return [v1 setStatusString:BTLELocalizedString animateIndicator:1 isError:0];
}

uint64_t __71__CABTMIDILocalPeripheralViewController_advertiseServiceSwitchToggled___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t BTLELocalizedString = priv_getBTLELocalizedString(@"stopping", @"Stopping Service...");

  return [v1 setStatusString:BTLELocalizedString animateIndicator:1 isError:0];
}

- (id)advertisedServiceName
{
  MIDIObjectRef v2 = [MEMORY[0x263F00B68] nullDevice];
  CFStringRef str = 0;
  if (v2)
  {
    MIDIObjectGetStringProperty(v2, @"Bluetooth Advertising Name", &str);
    if (str)
    {
      id v3 = [NSString alloc];
      id v4 = (void *)[v3 initWithString:str];
      CFRelease(str);
      return v4;
    }
    else
    {
      return (id)priv_getBTLELocalizedString(@"My Service", @"Local Bluetooth");
    }
  }
  else
  {
    return (id)priv_getBTLELocalizedString(@"My Service", @"Local Bluetooth");
  }
}

- (BOOL)advertiseServiceWithName:(id)a3 completionBlock:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)stopAdvertisingServiceWithCompletionBlock:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)changeServiceNameTo:(id)a3 completionBlock:(id)a4 error:(id *)a5
{
  MIDIObjectRef v9 = [MEMORY[0x263F00B68] nullDevice];
  if (!v9)
  {
    if (a5) {
      *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:@"CoreMIDI" code:-10842 userInfo:0];
    }
    goto LABEL_7;
  }
  if (![(AMSBTLEAdvertisementManager *)self->advertisingManager isAdvertising])
  {
    MIDIObjectSetStringProperty(v9, @"Bluetooth Advertising Name", (CFStringRef)a3);
LABEL_7:
    (*((void (**)(id))a4 + 2))(a4);
    return v9 != 0;
  }
  [(AMSBTLEAdvertisementManager *)self->advertisingManager stopAdvertisingMIDIService];
  MIDIObjectSetStringProperty(v9, @"Bluetooth Advertising Name", (CFStringRef)a3);
  (*((void (**)(id))a4 + 2))(a4);
  [(AMSBTLEAdvertisementManager *)self->advertisingManager advertiseMIDIService];
  return v9 != 0;
}

- (BOOL)disconnectLocalPeripheral
{
  MIDIObjectRef v2 = [MEMORY[0x263F00B68] nullDevice];
  MIDIObjectRef v3 = [MEMORY[0x263F00B68] localPeripheral];
  CFStringRef str = 0;
  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    MIDIObjectGetStringProperty(v3, @"BLE MIDI Device UUID", &str);
    if (str)
    {
      MIDIObjectSetStringProperty(v2, @"disconnect device", str);
      CFRelease(str);
    }
  }
  return v2 != 0;
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)CABTMIDILocalPeripheralViewController;
  [(CABTMIDILocalPeripheralViewController *)&v2 didReceiveMemoryWarning];
}

- (void)advertiseTimerFired:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CABTMIDILocalPeripheralViewController_advertiseTimerFired___block_invoke;
  block[3] = &unk_2644B01F0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __61__CABTMIDILocalPeripheralViewController_advertiseTimerFired___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 976) isAdvertising];
  uint64_t result = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(result + 1000) == v2)
  {
    uint64_t v4 = *(void *)(result + 1024);
    if (v4 >= 1)
    {
      *(void *)(result + 1024) = v4 - 1;
      goto LABEL_13;
    }
    if (!v4)
    {
      int v6 = [MEMORY[0x263F00B68] localPeripheral];
      uint64_t v7 = *(unsigned char **)(a1 + 32);
      if (v6)
      {
        int v8 = @"disconnectErr";
        MIDIObjectRef v9 = @"There has been an error disconnecting.";
      }
      else
      {
        if (!v7[1000])
        {
          uint64_t BTLELocalizedString = &stru_26CF7B700;
          id v11 = *(void **)(a1 + 32);
          uint64_t v12 = 0;
          goto LABEL_12;
        }
        int v8 = @"stopErr";
        MIDIObjectRef v9 = @"There has been an error stopping the service";
      }
      uint64_t BTLELocalizedString = (__CFString *)priv_getBTLELocalizedString((uint64_t)v8, (uint64_t)v9);
      id v11 = v7;
      uint64_t v12 = 1;
LABEL_12:
      uint64_t result = [v11 setStatusString:BTLELocalizedString animateIndicator:0 isError:v12];
      *(void *)(*(void *)(a1 + 32) + 1024) = -1;
    }
  }
  else
  {
    uint64_t result = [(id)result updateAdvertiseUI];
    *(void *)(*(void *)(a1 + 32) + 1024) = -1;
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(uint64_t *)(v5 + 1024) >= 1) {
      *(void *)(v5 + 1024) = -1;
    }
  }
LABEL_13:
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(v13 + 1032);
  if (v14 < 15)
  {
    *(void *)(v13 + 1032) = v14 + 1;
  }
  else
  {
    *(void *)(v13 + 1032) = 0;
    v15 = *(void **)(a1 + 32);
    return [v15 updateAdvertiseUI];
  }
  return result;
}

- (void)messageTimerFired:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CABTMIDILocalPeripheralViewController_messageTimerFired___block_invoke;
  block[3] = &unk_2644B01F0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __59__CABTMIDILocalPeripheralViewController_messageTimerFired___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1048) = 0;
  [*(id *)(*(void *)(a1 + 32) + 1008) stopAnimating];
  int v2 = *(void **)(a1 + 32);

  return [v2 updateAdvertiseUI];
}

@end