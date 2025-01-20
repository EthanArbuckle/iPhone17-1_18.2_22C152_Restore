@interface MCBrowserViewController
- (BOOL)isVisible;
- (BOOL)maximumNumberOfPeersReached;
- (BOOL)minimumNumberOfPeersReached;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (MCBrowserViewController)init;
- (MCBrowserViewController)initWithBrowser:(MCNearbyServiceBrowser *)browser session:(MCSession *)session;
- (MCBrowserViewController)initWithCoder:(id)a3;
- (MCBrowserViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MCBrowserViewController)initWithServiceType:(NSString *)serviceType session:(MCSession *)session;
- (MCNearbyServiceBrowser)browser;
- (MCPeerID)myPeerID;
- (MCSession)session;
- (NSBundle)frameworkBundle;
- (NSMutableArray)foundPeers;
- (NSMutableArray)invitedPeersSection;
- (NSMutableArray)nearbyPeersSection;
- (NSMutableDictionary)invitedPeersState;
- (NSString)description;
- (NSUInteger)maximumNumberOfPeers;
- (NSUInteger)minimumNumberOfPeers;
- (OS_dispatch_queue)callbackQueue;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)doneButton;
- (UINavigationBar)navigationBar;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)delegate;
- (id)detailStringForPeerState:(int)a3;
- (id)nearbySectionTitle;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)positionForBar:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)declinedPeersCount;
- (void)applicationDidEnterBackgroundNotification:(id)a3;
- (void)applicationWillEnterForegroundNotification:(id)a3;
- (void)browser:(id)a3 foundPeer:(id)a4 withDiscoveryInfo:(id)a5;
- (void)browser:(id)a3 lostPeer:(id)a4;
- (void)cancelTapped:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)doneTapped:(id)a3;
- (void)handleViewDidDisappear;
- (void)handleViewWillAppear;
- (void)peer:(id)a3 changedStateTo:(int)a4;
- (void)peerJoinedSession;
- (void)session:(id)a3 didFinishReceivingResourceWithName:(id)a4 fromPeer:(id)a5 atURL:(id)a6 withError:(id)a7 propagate:(BOOL *)a8;
- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5 propagate:(BOOL *)a6;
- (void)session:(id)a3 didReceiveStream:(id)a4 withName:(id)a5 fromPeer:(id)a6 propagate:(BOOL *)a7;
- (void)session:(id)a3 didStartReceivingResourceWithName:(id)a4 fromPeer:(id)a5 withProgress:(id)a6 propagate:(BOOL *)a7;
- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5 propagate:(BOOL *)a6;
- (void)setBrowser:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setDeclinedPeersCount:(unint64_t)a3;
- (void)setDelegate:(id)delegate;
- (void)setDoneButton:(id)a3;
- (void)setFoundPeers:(id)a3;
- (void)setFrameworkBundle:(id)a3;
- (void)setInvitedPeersSection:(id)a3;
- (void)setInvitedPeersState:(id)a3;
- (void)setMaximumNumberOfPeers:(NSUInteger)maximumNumberOfPeers;
- (void)setMinimumNumberOfPeers:(NSUInteger)minimumNumberOfPeers;
- (void)setMyPeerID:(id)a3;
- (void)setNavigationBar:(id)a3;
- (void)setNearbyPeersSection:(id)a3;
- (void)setSession:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)verifyPeerIsAccountedFor:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MCBrowserViewController

- (MCBrowserViewController)initWithBrowser:(MCNearbyServiceBrowser *)browser session:(MCSession *)session
{
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18.receiver = self;
  v18.super_class = (Class)MCBrowserViewController;
  v8 = [(MCBrowserViewController *)&v18 initWithNibName:@"MCBrowserViewController" bundle:v7];
  if (!v8) {
    return v8;
  }
  if (!browser)
  {
    v12 = (void *)MEMORY[0x263EFF940];
    uint64_t v13 = *MEMORY[0x263EFF4A0];
    v14 = (objc_class *)objc_opt_class();
    [v12 raise:v13, @"A nil MCNearbyServiceBrowser object passed to %@", NSStringFromClass(v14) format];
    if (session) {
      goto LABEL_4;
    }
LABEL_12:
    v15 = (void *)MEMORY[0x263EFF940];
    uint64_t v16 = *MEMORY[0x263EFF4A0];
    v17 = (objc_class *)objc_opt_class();
    [v15 raise:v16, @"A nil MCSession object passed to %@", NSStringFromClass(v17) format];
    goto LABEL_4;
  }
  if (!session) {
    goto LABEL_12;
  }
LABEL_4:
  v8->_frameworkBundle = (NSBundle *)(id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  [MEMORY[0x263F1C5C0] currentDevice];
  if (objc_opt_respondsToSelector()) {
    uint64_t v9 = 2 * (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1);
  }
  else {
    uint64_t v9 = 0;
  }
  [(MCBrowserViewController *)v8 setModalPresentationStyle:v9];
  v8->_myPeerID = (MCPeerID *)[(MCPeerID *)[(MCNearbyServiceBrowser *)browser myPeerID] copy];
  v8->_browser = browser;
  v8->_session = session;
  v8->_nearbyPeersSection = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v8->_invitedPeersSection = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v8->_invitedPeersState = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8->_foundPeers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v8->_minimumNumberOfPeers = 2;
  v8->_maximumNumberOfPeers = 8;
  if (![(MCNearbyServiceBrowser *)v8->_browser delegate]) {
    [(MCNearbyServiceBrowser *)v8->_browser setDelegate:v8];
  }
  [(MCSession *)v8->_session setPrivateDelegate:v8];
  v8->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MCBrowserViewController.callbackQueue", 0);
  v10 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:v8 selector:sel_applicationWillEnterForegroundNotification_ name:*MEMORY[0x263F1D0D0] object:0];
  [v10 addObserver:v8 selector:sel_applicationDidEnterBackgroundNotification_ name:*MEMORY[0x263F1D050] object:0];
  return v8;
}

- (MCBrowserViewController)initWithServiceType:(NSString *)serviceType session:(MCSession *)session
{
  v6 = [[MCNearbyServiceBrowser alloc] initWithPeer:[(MCSession *)session myPeerID] serviceType:serviceType];

  return [(MCBrowserViewController *)self initWithBrowser:v6 session:session];
}

- (MCBrowserViewController)init
{
  return [(MCBrowserViewController *)self initWithNibName:0 bundle:0];
}

- (MCBrowserViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MCBrowserViewController;
  -[MCBrowserViewController doesNotRecognizeSelector:](&v5, sel_doesNotRecognizeSelector_, a2, a4);
  return 0;
}

- (MCBrowserViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MCBrowserViewController;
  [(MCBrowserViewController *)&v4 doesNotRecognizeSelector:a2];
  return 0;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)MCBrowserViewController;
  [(MCBrowserViewController *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [(MCBrowserViewController *)self browser];
  uint64_t v7 = [(MCBrowserViewController *)self session];
  NSUInteger v8 = [(MCBrowserViewController *)self minimumNumberOfPeers];
  NSUInteger v9 = [(MCBrowserViewController *)self maximumNumberOfPeers];
  [(MCBrowserViewController *)self delegate];
  v10 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p Browser = %@ Session = %@ MinimumNumberOfPeers = %ld MaximumNumberOfPeers = %ld Delegate = <%@: %p>>", v5, self, v6, v7, v8, v9, NSStringFromClass(v10), -[MCBrowserViewController delegate](self, "delegate")];
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
}

- (BOOL)isVisible
{
  int v3 = [(MCBrowserViewController *)self isViewLoaded];
  if (v3) {
    LOBYTE(v3) = objc_msgSend((id)-[MCBrowserViewController view](self, "view"), "window") != 0;
  }
  return v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)MCBrowserViewController;
  [(MCBrowserViewController *)&v5 viewDidLoad];
  [(UITableView *)[(MCBrowserViewController *)self tableView] registerClass:objc_opt_class() forCellReuseIdentifier:@"Peer Cell"];
  int v3 = _NSDictionaryOfVariableBindings(&cfstr_TopguideNaviga.isa, (id)[(MCBrowserViewController *)self topLayoutGuide], [(MCBrowserViewController *)self navigationBar], 0);
  objc_super v4 = (void *)[(MCBrowserViewController *)self view];
  objc_msgSend(v4, "addConstraints:", objc_msgSend(MEMORY[0x263F08938], "constraintsWithVisualFormat:options:metrics:views:", @"V:[topGuide]-0-[navigationBar]", 0, 0, v3));
  [(UINavigationBar *)[(MCBrowserViewController *)self navigationBar] setDelegate:self];
}

- (void)handleViewWillAppear
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(NSMutableArray *)[(MCBrowserViewController *)self nearbyPeersSection] removeAllObjects];
  [(NSMutableArray *)[(MCBrowserViewController *)self invitedPeersSection] removeAllObjects];
  [(NSMutableDictionary *)[(MCBrowserViewController *)self invitedPeersState] removeAllObjects];
  [(NSMutableArray *)[(MCBrowserViewController *)self foundPeers] removeAllObjects];
  [(MCBrowserViewController *)self setDeclinedPeersCount:0];
  [(UIBarButtonItem *)[(MCBrowserViewController *)self doneButton] setEnabled:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v3 = [(MCSession *)self->_session connectedPeers];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * v7);
        [(NSMutableArray *)[(MCBrowserViewController *)self invitedPeersSection] addObject:v8];
        [(MCBrowserViewController *)self peer:v8 changedStateTo:2];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [(UITableView *)[(MCBrowserViewController *)self tableView] reloadData];
  [(MCNearbyServiceBrowser *)[(MCBrowserViewController *)self browser] startBrowsingForPeers];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MCBrowserViewController;
  [(MCBrowserViewController *)&v4 viewWillAppear:a3];
  [(MCBrowserViewController *)self handleViewWillAppear];
}

- (void)handleViewDidDisappear
{
  v2 = [(MCBrowserViewController *)self browser];

  [(MCNearbyServiceBrowser *)v2 stopBrowsingForPeers];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MCBrowserViewController *)self handleViewDidDisappear];
  v5.receiver = self;
  v5.super_class = (Class)MCBrowserViewController;
  [(MCBrowserViewController *)&v5 viewDidDisappear:v3];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)MCBrowserViewController;
  [(MCBrowserViewController *)&v2 didReceiveMemoryWarning];
}

- (void)setMinimumNumberOfPeers:(NSUInteger)minimumNumberOfPeers
{
  unint64_t v3 = 2;
  if (minimumNumberOfPeers >= 2 && (unint64_t v3 = 8, minimumNumberOfPeers <= 8)) {
    self->_minimumNumberOfPeers = minimumNumberOfPeers;
  }
  else {
    self->_minimumNumberOfPeers = v3;
  }
}

- (void)setMaximumNumberOfPeers:(NSUInteger)maximumNumberOfPeers
{
  unint64_t v3 = 2;
  if (maximumNumberOfPeers >= 2 && (unint64_t v3 = 8, maximumNumberOfPeers <= 8)) {
    self->_maximumNumberOfPeers = maximumNumberOfPeers;
  }
  else {
    self->_maximumNumberOfPeers = v3;
  }
}

- (void)doneTapped:(id)a3
{
  id v4 = [(MCBrowserViewController *)self delegate];

  [v4 browserViewControllerDidFinish:self];
}

- (void)peerJoinedSession
{
  NSUInteger v3 = [(NSArray *)[(MCSession *)[(MCBrowserViewController *)self session] connectedPeers] count]+ 1;
  BOOL v4 = v3 >= [(MCBrowserViewController *)self minimumNumberOfPeers];
  objc_super v5 = [(MCBrowserViewController *)self doneButton];

  [(UIBarButtonItem *)v5 setEnabled:v4];
}

- (void)peer:(id)a3 changedStateTo:(int)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  switch(a4)
  {
    case 0:
      [(NSMutableArray *)[(MCBrowserViewController *)self nearbyPeersSection] removeObject:a3];
      [(NSMutableArray *)[(MCBrowserViewController *)self invitedPeersSection] addObject:a3];
      uint64_t v7 = [(MCBrowserViewController *)self invitedPeersState];
      uint64_t v8 = NSNumber;
      uint64_t v9 = 0;
      goto LABEL_6;
    case 1:
      uint64_t v7 = [(MCBrowserViewController *)self invitedPeersState];
      uint64_t v8 = NSNumber;
      uint64_t v9 = 1;
LABEL_6:
      uint64_t v11 = [v8 numberWithInteger:v9];
      [(NSMutableDictionary *)v7 setObject:v11 forKey:a3];
      break;
    case 2:
      long long v12 = [(MCBrowserViewController *)self invitedPeersState];
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", [NSNumber numberWithInteger:2], a3);
      [(MCBrowserViewController *)self peerJoinedSession];
      break;
    case 3:
      uint64_t v13 = [(MCBrowserViewController *)self invitedPeersState];
      -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", [NSNumber numberWithInteger:3], a3);
      unint64_t v14 = [(MCBrowserViewController *)self declinedPeersCount] + 1;
      [(MCBrowserViewController *)self setDeclinedPeersCount:v14];
      break;
    case 4:
      [(NSMutableArray *)[(MCBrowserViewController *)self invitedPeersSection] removeObject:a3];
      [(NSMutableDictionary *)[(MCBrowserViewController *)self invitedPeersState] removeObjectForKey:a3];
      if ([(NSMutableArray *)[(MCBrowserViewController *)self foundPeers] containsObject:a3])
      {
        v15 = [(MCBrowserViewController *)self nearbyPeersSection];
        [(NSMutableArray *)v15 addObject:a3];
      }
      break;
    default:
      long long v10 = mcbrowser_ui_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v16[0] = 67109120;
        v16[1] = a4;
        _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "Unknown peer state [%d].", (uint8_t *)v16, 8u);
      }
      break;
  }
}

- (void)cancelTapped:(id)a3
{
  id v4 = [(MCBrowserViewController *)self delegate];

  [v4 browserViewControllerWasCancelled:self];
}

- (id)detailStringForPeerState:(int)a3
{
  if (a3 <= 4) {
    return (id)[*((id *)self + 136) localizedStringForKey:off_264338378[a3] value:&stru_26C9DA3B0 table:0];
  }
  return self;
}

- (void)verifyPeerIsAccountedFor:(id)a3
{
  [(NSMutableArray *)[(MCBrowserViewController *)self nearbyPeersSection] removeObject:a3];
  if (([(NSMutableArray *)[(MCBrowserViewController *)self invitedPeersSection] containsObject:a3] & 1) == 0)
  {
    objc_super v5 = [(MCBrowserViewController *)self invitedPeersSection];
    [(NSMutableArray *)v5 addObject:a3];
  }
}

- (BOOL)maximumNumberOfPeersReached
{
  uint64_t v3 = [(NSMutableArray *)[(MCBrowserViewController *)self invitedPeersSection] count];
  unint64_t v4 = v3 - [(MCBrowserViewController *)self declinedPeersCount];
  return v4 >= [(MCBrowserViewController *)self maximumNumberOfPeers] - 1;
}

- (BOOL)minimumNumberOfPeersReached
{
  uint64_t v3 = [(NSMutableArray *)[(MCBrowserViewController *)self invitedPeersSection] count];
  unint64_t v4 = v3 - [(MCBrowserViewController *)self declinedPeersCount];
  return v4 >= [(MCBrowserViewController *)self minimumNumberOfPeers] - 1;
}

- (id)nearbySectionTitle
{
  BOOL v3 = [(MCBrowserViewController *)self minimumNumberOfPeersReached];
  BOOL v4 = [(MCBrowserViewController *)self maximumNumberOfPeersReached];
  BOOL v5 = v4;
  if (!v3)
  {
    NSUInteger v15 = [(MCBrowserViewController *)self minimumNumberOfPeers];
    uint64_t v16 = ~[(NSMutableArray *)[(MCBrowserViewController *)self invitedPeersSection] count];
    NSUInteger v6 = v15 + [(MCBrowserViewController *)self declinedPeersCount] + v16;
    if (!v5) {
      goto LABEL_3;
    }
    return 0;
  }
  NSUInteger v6 = 0;
  if (v4) {
    return 0;
  }
LABEL_3:
  NSUInteger v7 = [(MCBrowserViewController *)self maximumNumberOfPeers];
  uint64_t v8 = ~[(NSMutableArray *)[(MCBrowserViewController *)self invitedPeersSection] count];
  NSUInteger v9 = v7 + [(MCBrowserViewController *)self declinedPeersCount] + v8;
  if (v9 == 1 && v3)
  {
    frameworkBundle = self->_frameworkBundle;
    long long v12 = @"Choose up to %lu more invitee";
LABEL_8:
    uint64_t v13 = [(NSBundle *)frameworkBundle localizedStringForKey:v12 value:&stru_26C9DA3B0 table:0];
    return (id)objc_msgSend(NSString, "localizedStringWithFormat:", v13, 1, v20);
  }
  if (v3)
  {
    uint64_t v17 = [(NSBundle *)self->_frameworkBundle localizedStringForKey:@"Choose up to %lu more invitees" value:&stru_26C9DA3B0 table:0];
    return (id)objc_msgSend(NSString, "localizedStringWithFormat:", v17, v9, v20);
  }
  else
  {
    frameworkBundle = self->_frameworkBundle;
    if (v6 == v9 && v9 == 1)
    {
      long long v12 = @"Choose %lu invitee";
      goto LABEL_8;
    }
    if (v6 == v9)
    {
      uint64_t v18 = [(NSBundle *)frameworkBundle localizedStringForKey:@"Choose %lu invitees" value:&stru_26C9DA3B0 table:0];
      v19 = NSString;
    }
    else
    {
      uint64_t v18 = [(NSBundle *)frameworkBundle localizedStringForKey:@"Choose %lu to %lu invitees" value:&stru_26C9DA3B0 table:0];
      v19 = NSString;
      NSUInteger v20 = v9;
    }
    return (id)objc_msgSend(v19, "localizedStringWithFormat:", v18, v6, v20);
  }
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  if ([(MCBrowserViewController *)self isVisible])
  {
    [(MCBrowserViewController *)self handleViewDidDisappear];
  }
}

- (void)applicationWillEnterForegroundNotification:(id)a3
{
  if ([(MCBrowserViewController *)self isVisible])
  {
    [(MCBrowserViewController *)self handleViewWillAppear];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(NSMutableArray *)[(MCBrowserViewController *)self invitedPeersSection] count]
    && ![(MCBrowserViewController *)self maximumNumberOfPeersReached])
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v6 = [(NSMutableArray *)[(MCBrowserViewController *)self invitedPeersSection] count];
  if (a4 || !v6)
  {
    return [(MCBrowserViewController *)self nearbySectionTitle];
  }
  else
  {
    frameworkBundle = self->_frameworkBundle;
    return [(NSBundle *)frameworkBundle localizedStringForKey:@"Invitees" value:&stru_26C9DA3B0 table:0];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6 = [(NSMutableArray *)[(MCBrowserViewController *)self invitedPeersSection] count];
  if (a4 || !v6)
  {
    int64_t result = [(NSMutableArray *)[(MCBrowserViewController *)self nearbyPeersSection] count];
    if ((unint64_t)result <= 1) {
      return 1;
    }
  }
  else
  {
    NSUInteger v7 = [(MCBrowserViewController *)self invitedPeersSection];
    return [(NSMutableArray *)v7 count];
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", @"Peer Cell");
  [v6 setAccessoryType:0];
  [v6 setAccessoryView:0];
  if ([(NSMutableArray *)[(MCBrowserViewController *)self invitedPeersSection] count]
    && ![a4 section])
  {
    NSUInteger v9 = (void *)-[NSMutableArray objectAtIndex:](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection"), "objectAtIndex:", [a4 row]);
    long long v10 = (void *)[(NSMutableDictionary *)[(MCBrowserViewController *)self invitedPeersState] objectForKey:v9];
    objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", objc_msgSend(v9, "displayName"));
    objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setEnabled:", 1);
    NSUInteger v7 = -[MCBrowserViewController detailStringForPeerState:](self, "detailStringForPeerState:", [v10 integerValue]);
    goto LABEL_7;
  }
  if ([(NSMutableArray *)[(MCBrowserViewController *)self nearbyPeersSection] count])
  {
    objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", objc_msgSend((id)-[NSMutableArray objectAtIndex:](-[MCBrowserViewController nearbyPeersSection](self, "nearbyPeersSection"), "objectAtIndex:", objc_msgSend(a4, "row")), "displayName"));
    objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setEnabled:", 1);
    NSUInteger v7 = &stru_26C9DA3B0;
    objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setText:", &stru_26C9DA3B0);
LABEL_7:
    objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setText:", v7);
    return v6;
  }
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", -[NSBundle localizedStringForKey:value:table:](self->_frameworkBundle, "localizedStringForKey:value:table:", @"Searching...", &stru_26C9DA3B0, 0));
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setEnabled:", 0);
  objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setText:", &stru_26C9DA3B0);
  objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setText:", &stru_26C9DA3B0);
  id v8 = (id)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
  [v8 setHidesWhenStopped:1];
  [v8 startAnimating];
  [v6 setAccessoryView:v8];
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5 = -[NSMutableArray objectAtIndex:](-[MCBrowserViewController nearbyPeersSection](self, "nearbyPeersSection", a3), "objectAtIndex:", [a4 row]);
  [(MCNearbyServiceBrowser *)[(MCBrowserViewController *)self browser] invitePeer:v5 toSession:[(MCBrowserViewController *)self session] withContext:0 timeout:0.0];
  [(MCBrowserViewController *)self peer:v5 changedStateTo:0];
  uint64_t v6 = [(MCBrowserViewController *)self tableView];

  [(UITableView *)v6 reloadData];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  if (!-[NSMutableArray count](-[MCBrowserViewController invitedPeersSection](self, "invitedPeersSection", a3), "count")|| (uint64_t v6 = [a4 section]) != 0)
  {
    LOBYTE(v6) = [(NSMutableArray *)[(MCBrowserViewController *)self nearbyPeersSection] count] != 0;
  }
  return v6;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  uint64_t v6 = [(NSMutableArray *)[(MCBrowserViewController *)self invitedPeersSection] count];
  if (!a4 && v6
    || ![(NSMutableArray *)[(MCBrowserViewController *)self nearbyPeersSection] count])
  {
    return 0;
  }
  NSUInteger v7 = [[MCNearbyPeerTableViewHeader alloc] initWithTitle:[(MCBrowserViewController *)self nearbySectionTitle]];

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 40.0;
}

- (void)browser:(id)a3 foundPeer:(id)a4 withDiscoveryInfo:(id)a5
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__MCBrowserViewController_browser_foundPeer_withDiscoveryInfo___block_invoke;
  block[3] = &unk_264337D80;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __63__MCBrowserViewController_browser_foundPeer_withDiscoveryInfo___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "foundPeers"), "addObject:", *(void *)(a1 + 40));
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nearbyPeersSection"), "containsObject:", *(void *)(a1 + 40)))
  {
    objc_super v2 = mcbrowser_ui_log();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v3 = [*(id *)(a1 + 40) displayName];
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v3;
    BOOL v4 = "Found Peer [%@] - peer already previously discovered?";
LABEL_7:
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, v4, buf, 0xCu);
    return;
  }
  int v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "session"), "connectedPeers"), "containsObject:", *(void *)(a1 + 40));
  objc_super v2 = mcbrowser_ui_log();
  BOOL v6 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v6) {
      return;
    }
    uint64_t v7 = [*(id *)(a1 + 40) displayName];
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v7;
    BOOL v4 = "Found Peer [%@] - peer already connected.";
    goto LABEL_7;
  }
  if (v6)
  {
    uint64_t v8 = [*(id *)(a1 + 40) displayName];
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v8;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Found Peer [%@].", buf, 0xCu);
  }
  long long v9 = *(_OWORD *)(a1 + 32);
  long long v10 = *(NSObject **)(*(void *)(a1 + 32) + 1104);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__MCBrowserViewController_browser_foundPeer_withDiscoveryInfo___block_invoke_83;
  block[3] = &unk_264337D80;
  long long v12 = v9;
  uint64_t v13 = *(void *)(a1 + 48);
  dispatch_async(v10, block);
}

void __63__MCBrowserViewController_browser_foundPeer_withDiscoveryInfo___block_invoke_83(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "browserViewController:shouldPresentNearbyPeer:withDiscoveryInfo:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48)))
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __63__MCBrowserViewController_browser_foundPeer_withDiscoveryInfo___block_invoke_2;
    v2[3] = &unk_264337D58;
    long long v3 = *(_OWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v2);
  }
}

uint64_t __63__MCBrowserViewController_browser_foundPeer_withDiscoveryInfo___block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nearbyPeersSection"), "addObject:", *(void *)(a1 + 40));
  objc_super v2 = (void *)[*(id *)(a1 + 32) tableView];

  return [v2 reloadData];
}

- (void)browser:(id)a3 lostPeer:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__MCBrowserViewController_browser_lostPeer___block_invoke;
  v4[3] = &unk_264337D58;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __44__MCBrowserViewController_browser_lostPeer___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "foundPeers"), "removeObject:", *(void *)(a1 + 40));
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nearbyPeersSection"), "containsObject:", *(void *)(a1 + 40)))
  {
    objc_super v2 = mcbrowser_ui_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 40) displayName];
      int v6 = 138412290;
      uint64_t v7 = v3;
      _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Removing peer [%@] from tableView.", (uint8_t *)&v6, 0xCu);
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nearbyPeersSection"), "removeObject:", *(void *)(a1 + 40));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "tableView"), "reloadData");
  }
  BOOL v4 = mcbrowser_ui_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 40) displayName];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "Lost Peer [%@].", (uint8_t *)&v6, 0xCu);
  }
}

- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5 propagate:(BOOL *)a6
{
  int v6 = mcbrowser_ui_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MCBrowserViewController session:didReceiveData:fromPeer:propagate:]();
  }
}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5 propagate:(BOOL *)a6
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v9 = mcbrowser_ui_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = [a4 displayName];
    __int16 v13 = 2112;
    id v14 = +[MCSession stringForSessionState:a5];
    _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "Peer [%@] changed state to [%@].", buf, 0x16u);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__MCBrowserViewController_session_peer_didChangeState_propagate___block_invoke;
  block[3] = &unk_264337F60;
  block[5] = a4;
  block[6] = a5;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __65__MCBrowserViewController_session_peer_didChangeState_propagate___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    if (v2 == 1)
    {
      [*(id *)(a1 + 32) verifyPeerIsAccountedFor:*(void *)(a1 + 40)];
      uint64_t v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = 1;
      goto LABEL_9;
    }
    if (v2 == 2)
    {
      [*(id *)(a1 + 32) verifyPeerIsAccountedFor:*(void *)(a1 + 40)];
      uint64_t v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = 2;
LABEL_9:
      [v3 peer:v4 changedStateTo:v5];
    }
  }
  else
  {
    int v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "invitedPeersState"), "objectForKey:", *(void *)(a1 + 40));
    if (v6)
    {
      uint64_t v7 = [v6 integerValue];
      uint64_t v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      if (v7) {
        uint64_t v5 = 4;
      }
      else {
        uint64_t v5 = 3;
      }
      goto LABEL_9;
    }
    long long v9 = mcbrowser_ui_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 40) displayName];
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "Peer [%@] disconnected but was not in 'invitees' section.", (uint8_t *)&v11, 0xCu);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "tableView"), "reloadData");
}

- (void)session:(id)a3 didReceiveStream:(id)a4 withName:(id)a5 fromPeer:(id)a6 propagate:(BOOL *)a7
{
  uint64_t v7 = mcbrowser_ui_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MCBrowserViewController session:didReceiveData:fromPeer:propagate:]();
  }
}

- (void)session:(id)a3 didStartReceivingResourceWithName:(id)a4 fromPeer:(id)a5 withProgress:(id)a6 propagate:(BOOL *)a7
{
  uint64_t v7 = mcbrowser_ui_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MCBrowserViewController session:didReceiveData:fromPeer:propagate:]();
  }
}

- (void)session:(id)a3 didFinishReceivingResourceWithName:(id)a4 fromPeer:(id)a5 atURL:(id)a6 withError:(id)a7 propagate:(BOOL *)a8
{
  uint64_t v8 = mcbrowser_ui_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MCBrowserViewController session:didReceiveData:fromPeer:propagate:]();
  }
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (MCNearbyServiceBrowser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
}

- (MCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSUInteger)minimumNumberOfPeers
{
  return self->_minimumNumberOfPeers;
}

- (NSUInteger)maximumNumberOfPeers
{
  return self->_maximumNumberOfPeers;
}

- (MCPeerID)myPeerID
{
  return self->_myPeerID;
}

- (void)setMyPeerID:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSMutableArray)nearbyPeersSection
{
  return self->_nearbyPeersSection;
}

- (void)setNearbyPeersSection:(id)a3
{
}

- (NSMutableArray)invitedPeersSection
{
  return self->_invitedPeersSection;
}

- (void)setInvitedPeersSection:(id)a3
{
}

- (NSMutableDictionary)invitedPeersState
{
  return self->_invitedPeersState;
}

- (void)setInvitedPeersState:(id)a3
{
}

- (NSMutableArray)foundPeers
{
  return self->_foundPeers;
}

- (void)setFoundPeers:(id)a3
{
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
}

- (NSBundle)frameworkBundle
{
  return self->_frameworkBundle;
}

- (void)setFrameworkBundle:(id)a3
{
}

- (unint64_t)declinedPeersCount
{
  return self->_declinedPeersCount;
}

- (void)setDeclinedPeersCount:(unint64_t)a3
{
  self->_declinedPeersCount = a3;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void)session:didReceiveData:fromPeer:propagate:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_218756000, v0, v1, "MCBrowserViewController shouldn't be receiving this callback.", v2, v3, v4, v5, v6);
}

@end