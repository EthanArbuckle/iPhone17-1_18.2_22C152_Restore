@interface CABTMIDICentralViewController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CABTMIDICentralViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)peripheralAtIndex:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)title;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)peripheralCount;
- (void)cancelAction:(id)a3;
- (void)centralTimerFired:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)editAction:(id)a3;
- (void)forgetAction:(id)a3;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateButtonsToMatchTableState;
- (void)updatePeripheralTable;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CABTMIDICentralViewController

- (CABTMIDICentralViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CABTMIDICentralViewController;
  return [(CABTMIDICentralViewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (void)dealloc
{
  [(CABTMIDICentralViewController *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)CABTMIDICentralViewController;
  [(CABTMIDICentralViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)CABTMIDICentralViewController;
  [(CABTMIDICentralViewController *)&v15 viewDidLoad];
  self->previousLeftItem = (UIBarButtonItem *)(id)objc_msgSend((id)-[CABTMIDICentralViewController navigationItem](self, "navigationItem"), "leftBarButtonItem");
  self->previousRightItem = (UIBarButtonItem *)(id)objc_msgSend((id)-[CABTMIDICentralViewController navigationItem](self, "navigationItem"), "rightBarButtonItem");
  self->connectionManager = [[AMSBTLEConnectionManager alloc] initWithUIController:self];
  [(CABTMIDICentralViewController *)self addObserver:self forKeyPath:@"parentViewController" options:0 context:0];
  self->peripheralList = [(AMSBTLEConnectionManager *)self->connectionManager peripheralList];
  objc_super v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F83318];
  uint64_t v5 = [MEMORY[0x263F08A48] mainQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__CABTMIDICentralViewController_viewDidLoad__block_invoke;
  v14[3] = &unk_2644B0180;
  v14[4] = self;
  [v3 addObserverForName:v4 object:self queue:v5 usingBlock:v14];
  v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v7 = *MEMORY[0x263F833C0];
  uint64_t v8 = [MEMORY[0x263F08A48] mainQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__CABTMIDICentralViewController_viewDidLoad__block_invoke_2;
  v13[3] = &unk_2644B0180;
  v13[4] = self;
  [v6 addObserverForName:v7 object:self queue:v8 usingBlock:v13];
  v9 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v10 = *MEMORY[0x263F83428];
  uint64_t v11 = [MEMORY[0x263F08A48] mainQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__CABTMIDICentralViewController_viewDidLoad__block_invoke_3;
  v12[3] = &unk_2644B0180;
  v12[4] = self;
  [v9 addObserverForName:v10 object:self queue:v11 usingBlock:v12];
  self->didRegisterObserver = 1;
}

uint64_t __44__CABTMIDICentralViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1032) startScan];
  v2 = *(void **)(*(void *)(a1 + 32) + 1032);

  return [v2 startTimer];
}

uint64_t __44__CABTMIDICentralViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1032) stopScan];
  v2 = *(void **)(*(void *)(a1 + 32) + 1032);

  return [v2 killTimer];
}

uint64_t __44__CABTMIDICentralViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) view];

  return [v1 reloadData];
}

- (void)cleanup
{
  if (!self->didCleanup)
  {
    objc_sync_enter(self);
    [(NSTimer *)self->connectionTimer invalidate];
    self->connectionTimer = 0;
    objc_sync_exit(self);
    [(AMSBTLEConnectionManager *)self->connectionManager killTimer];
    [(AMSBTLEConnectionManager *)self->connectionManager stopScan];

    self->connectionManager = 0;
    self->peripheralList = 0;
    if (self->didRegisterObserver)
    {
      [(CABTMIDICentralViewController *)self removeObserver:self forKeyPath:@"parentViewController"];
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
      self->didRegisterObserver = 0;
    }

    self->didCleanup = 1;
  }
}

- (void)didReceiveMemoryWarning
{
  v3.receiver = self;
  v3.super_class = (Class)CABTMIDICentralViewController;
  [(CABTMIDICentralViewController *)&v3 didReceiveMemoryWarning];
  if ([(CABTMIDICentralViewController *)self isViewLoaded])
  {
    if (!objc_msgSend((id)-[CABTMIDICentralViewController view](self, "view"), "window"))
    {
      [(CABTMIDICentralViewController *)self cleanup];
      [(CABTMIDICentralViewController *)self setView:0];
    }
  }
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F82C78]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F82B60], "mainScreen"), "applicationFrame");
  uint64_t v4 = objc_msgSend(v3, "initWithFrame:style:", 1);
  [v4 setAutoresizingMask:18];
  [v4 setDelegate:self];
  [v4 setDataSource:self];
  [v4 setAllowsSelection:1];
  [v4 setAllowsMultipleSelectionDuringEditing:1];
  [(CABTMIDICentralViewController *)self setView:v4];
  self->didCleanup = 0;
  self->didRegisterObserver = 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  int v8 = objc_msgSend(@"parentViewController", "isEqualToString:", a3, a4, a5, a6);
  if (a4 == self && v8 && ![a4 parentViewController])
  {
    [a4 cleanup];
  }
}

- (void)updatePeripheralTable
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__CABTMIDICentralViewController_updatePeripheralTable__block_invoke;
  block[3] = &unk_2644B01F0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __54__CABTMIDICentralViewController_updatePeripheralTable__block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "reloadData");
  v2 = *(void **)(a1 + 32);

  return [v2 updateButtonsToMatchTableState];
}

- (unint64_t)peripheralCount
{
  return [(NSMutableArray *)self->peripheralList count];
}

- (id)peripheralAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->peripheralList objectAtIndexedSubscript:a3];
}

- (id)title
{
  return (id)priv_getBTLELocalizedString(@"Ext Devs", @"External Bluetooth Devices");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = [(CABTMIDICentralViewController *)self peripheralCount];
  if ((unint64_t)result <= 1) {
    return 1;
  }
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)priv_getBTLELocalizedString(@"Ext Devs", @"External Bluetooth Devices");
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.audio.CoreAudioKit", a4), "localizedStringForKey:value:table:", @"%lu device(s) found", &stru_26CF7B700, @"AMS");
  return (id)objc_msgSend(NSString, "localizedStringWithFormat:", v5, -[CABTMIDICentralViewController peripheralCount](self, "peripheralCount"));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  if ([(CABTMIDICentralViewController *)self peripheralCount])
  {
    uint64_t v7 = (CACentralTableViewCell *)[a3 dequeueReusableCellWithIdentifier:@"Cell"];
    id v8 = -[CABTMIDICentralViewController peripheralAtIndex:](self, "peripheralAtIndex:", [a4 row]);
    if (!v7) {
      uint64_t v7 = [[CACentralTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"Cell"];
    }
    int v9 = [v8 isOnline];
    uint64_t v10 = [v8 isAvailable];
    -[UILabel setText:](-[CACentralTableViewCell deviceNameLabel](v7, "deviceNameLabel"), "setText:", [v8 name]);
    [(UILabel *)[(CACentralTableViewCell *)v7 connectionStatusLabel] setEnabled:v10];
    [(UILabel *)[(CACentralTableViewCell *)v7 deviceNameLabel] setEnabled:v10];
    if ([(UILabel *)[(CACentralTableViewCell *)v7 deviceNameLabel] isEnabled])
    {
      if (v9) {
        uint64_t v11 = @"Connected";
      }
      else {
        uint64_t v11 = @"Not Connected";
      }
      [(UILabel *)[(CACentralTableViewCell *)v7 connectionStatusLabel] setText:priv_getBTLELocalizedString((uint64_t)v11, (uint64_t)v11)];
      -[UILabel setEnabled:](-[CACentralTableViewCell inputLabel](v7, "inputLabel"), "setEnabled:", [v8 inputAvailable]);
      uint64_t v14 = [v8 outputAvailable];
    }
    else
    {
      [(UILabel *)[(CACentralTableViewCell *)v7 connectionStatusLabel] setText:priv_getBTLELocalizedString(@"Offline", @"Offline")];
      [(UILabel *)[(CACentralTableViewCell *)v7 inputLabel] setEnabled:0];
      uint64_t v14 = 0;
    }
    [(UILabel *)[(CACentralTableViewCell *)v7 outputLabel] setEnabled:v14];
    [(CACentralTableViewCell *)v7 stopIndicator];
    [(CACentralTableViewCell *)v7 setNeedsUpdateConstraints];
    [(CACentralTableViewCell *)v7 updateConstraintsIfNeeded];
  }
  else
  {
    uint64_t v7 = (CACentralTableViewCell *)[a3 dequeueReusableCellWithIdentifier:@"NoItems"];
    if (!v7)
    {
      uint64_t v7 = (CACentralTableViewCell *)(id)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"NoItems"];
      v12 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:2];
      self->indicator = v12;
      [(UIActivityIndicatorView *)v12 setTag:1];
      [(UIActivityIndicatorView *)self->indicator setAutoresizingMask:33];
      -[UIActivityIndicatorView setFrame:](self->indicator, "setFrame:", 0.0, 0.0, 24.0, 24.0);
      [(UIActivityIndicatorView *)self->indicator setHidesWhenStopped:0];
      [(UIActivityIndicatorView *)self->indicator setHidden:0];
      [(CACentralTableViewCell *)v7 setAccessoryView:self->indicator];
    }
    v13 = (void *)[(CACentralTableViewCell *)v7 textLabel];
    [v13 setText:priv_getBTLELocalizedString(@"Searching", @"Searching for Bluetooth LE MIDI Devices...")];
    [v13 setEnabled:0];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__CABTMIDICentralViewController_tableView_cellForRowAtIndexPath___block_invoke;
    block[3] = &unk_2644B01F0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  return v7;
}

uint64_t __65__CABTMIDICentralViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1040) startAnimating];
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return (id)priv_getBTLELocalizedString(@"Forget", @"Forget");
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CABTMIDICentralViewController;
  [(CABTMIDICentralViewController *)&v6 viewWillAppear:a3];
  [(CABTMIDICentralViewController *)self updatePeripheralTable];
  if (!self->connectionTimer)
  {
    uint64_t v4 = (NSTimer *)[MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel_centralTimerFired_ selector:0 userInfo:1 repeats:5.0];
    self->connectionTimer = v4;
    [(NSTimer *)v4 setTolerance:0.150000006];
    uint64_t v5 = (void *)[MEMORY[0x263EFF9F0] currentRunLoop];
    [v5 addTimer:self->connectionTimer forMode:*MEMORY[0x263EFF588]];
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 50.0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  unint64_t v6 = [(CABTMIDICentralViewController *)self peripheralCount];
  if (v6)
  {
    if (self->inEditingMode)
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      id v7 = -[CABTMIDICentralViewController peripheralAtIndex:](self, "peripheralAtIndex:", [a4 row]);
      LOBYTE(v6) = [v7 isAvailable];
    }
  }
  return v6;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  self->inEditingMode = a3;
  v5.receiver = self;
  v5.super_class = (Class)CABTMIDICentralViewController;
  -[CABTMIDICentralViewController setEditing:animated:](&v5, sel_setEditing_animated_);
  [(CABTMIDICentralViewController *)self updateButtonsToMatchTableState];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = (void *)[a3 cellForRowAtIndexPath:a4];
  if (([v7 isEditing] & 1) == 0 && !self->inEditingMode)
  {
    id v8 = -[CABTMIDICentralViewController peripheralAtIndex:](self, "peripheralAtIndex:", [a4 row]);
    if ([v8 isOnline])
    {
      int v9 = [v8 disconnect];
      if (v7 && v9)
      {
        objc_msgSend((id)objc_msgSend(v7, "connectionStatusLabel"), "setText:", priv_getBTLELocalizedString(@"dis...", @"Disconnecting..."));
        [v7 startIndicator];
      }
    }
    else
    {
      int v10 = [v8 connect];
      if (v7 && v10)
      {
        [v7 startIndicator];
        objc_msgSend((id)objc_msgSend(v7, "connectionStatusLabel"), "setText:", priv_getBTLELocalizedString(@"con...", @"Connecting..."));
      }
    }
    [a3 selectRowAtIndexPath:0 animated:1 scrollPosition:0];
    [(CABTMIDICentralViewController *)self updateButtonsToMatchTableState];
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return [(CABTMIDICentralViewController *)self peripheralCount] != 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v6 = -[CABTMIDICentralViewController peripheralAtIndex:](self, "peripheralAtIndex:", objc_msgSend(a5, "row", a3));
    uint64_t v7 = MIDISetupRemoveDevice(objc_msgSend(MEMORY[0x263F00B68], "midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:", objc_msgSend(v6, "uuid"), 0, 1));
    if (v7)
    {
      NSLog(&cfstr_ErrorRemovingD.isa, [v6 uuid], v7);
    }
    else
    {
      [(CABTMIDICentralViewController *)self updatePeripheralTable];
    }
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  unint64_t v6 = [(CABTMIDICentralViewController *)self peripheralCount];
  if (v6)
  {
    if (self->inEditingMode) {
      LOBYTE(v6) = 1;
    }
    else {
      LOBYTE(v6) = objc_msgSend(-[CABTMIDICentralViewController peripheralAtIndex:](self, "peripheralAtIndex:", objc_msgSend(a4, "row")), "isAvailable") ^ 1;
    }
  }
  return v6;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CABTMIDICentralViewController *)self cleanup];
  v5.receiver = self;
  v5.super_class = (Class)CABTMIDICentralViewController;
  [(CABTMIDICentralViewController *)&v5 viewDidDisappear:v3];
}

- (void)centralTimerFired:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__CABTMIDICentralViewController_centralTimerFired___block_invoke;
  block[3] = &unk_2644B01F0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

unsigned char *__51__CABTMIDICentralViewController_centralTimerFired___block_invoke(uint64_t a1)
{
  int64_t result = *(unsigned char **)(a1 + 32);
  if (!result[1048])
  {
    v2 = (void *)[result view];
    return (unsigned char *)[v2 reloadData];
  }
  return result;
}

- (void)updateButtonsToMatchTableState
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(CABTMIDICentralViewController *)self navigationItem])
  {
    if (![(CABTMIDICentralViewController *)self peripheralCount]) {
      goto LABEL_16;
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    peripheralList = self->peripheralList;
    uint64_t v4 = [(NSMutableArray *)peripheralList countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (!v4) {
      goto LABEL_16;
    }
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(peripheralList);
        }
        v6 += [*(id *)(*((void *)&v12 + 1) + 8 * i) isAvailable] ^ 1;
      }
      uint64_t v5 = [(NSMutableArray *)peripheralList countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
    if (v6)
    {
      if (objc_msgSend((id)-[CABTMIDICentralViewController view](self, "view"), "isEditing"))
      {
        cancelButton = self->cancelButton;
        if (!cancelButton)
        {
          cancelButton = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelAction_];
          self->cancelButton = cancelButton;
        }
        objc_msgSend((id)-[CABTMIDICentralViewController navigationItem](self, "navigationItem"), "setRightBarButtonItem:", cancelButton);
        forgetButton = self->forgetButton;
        if (!forgetButton)
        {
          forgetButton = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:priv_getBTLELocalizedString(@"Forget", @"Forget"), 0, self, sel_forgetAction_ style target action];
          self->forgetButton = forgetButton;
        }
        goto LABEL_18;
      }
      editButton = self->editButton;
      if (!editButton)
      {
        editButton = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:2 target:self action:sel_editAction_];
        self->editButton = editButton;
      }
    }
    else
    {
LABEL_16:
      editButton = self->previousRightItem;
    }
    objc_msgSend((id)-[CABTMIDICentralViewController navigationItem](self, "navigationItem"), "setRightBarButtonItem:", editButton);
    forgetButton = self->previousLeftItem;
LABEL_18:
    objc_msgSend((id)-[CABTMIDICentralViewController navigationItem](self, "navigationItem"), "setLeftBarButtonItem:", forgetButton);
  }
}

- (void)editAction:(id)a3
{
}

- (void)cancelAction:(id)a3
{
}

- (void)forgetAction:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend((id)-[CABTMIDICentralViewController view](self, "view", a3), "indexPathsForSelectedRows");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = -[CABTMIDICentralViewController peripheralAtIndex:](self, "peripheralAtIndex:", [*(id *)(*((void *)&v11 + 1) + 8 * v8) row]);
        uint64_t v10 = MIDISetupRemoveDevice(objc_msgSend(MEMORY[0x263F00B68], "midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:", objc_msgSend(v9, "uuid"), 0, 1));
        if (v10) {
          NSLog(&cfstr_ErrorRemovingD.isa, [v9 uuid], v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  if ([v4 count]) {
    [(CABTMIDICentralViewController *)self updatePeripheralTable];
  }
  [(CABTMIDICentralViewController *)self setEditing:0 animated:1];
}

@end