@interface MCAdvertiserAssistant
- (BOOL)isAdvertising;
- (BOOL)wasAdvertising;
- (MCAdvertiserAssistant)init;
- (MCAdvertiserAssistant)initWithServiceType:(NSString *)serviceType discoveryInfo:(NSDictionary *)info session:(MCSession *)session;
- (MCAlertController)alertController;
- (MCNearbyServiceAdvertiser)advertiser;
- (MCPeerID)myPeerID;
- (MCSession)session;
- (NSBundle)frameworkBundle;
- (NSDictionary)discoveryInfo;
- (NSMutableArray)invitationsBuffer;
- (NSString)appName;
- (NSString)description;
- (NSString)serviceType;
- (id)delegate;
- (id)invitationHandlerForPresentedAlert;
- (void)advertiser:(id)a3 didReceiveInvitationFromPeer:(id)a4 withContext:(id)a5 invitationHandler:(id)a6;
- (void)applicationDidEnterBackgroundNotification:(id)a3;
- (void)applicationWillTerminateNotification:(id)a3;
- (void)dealloc;
- (void)handleUserInvitationDecision:(BOOL)a3;
- (void)presentNextInvitation;
- (void)setAdvertiser:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDiscoveryInfo:(id)a3;
- (void)setFrameworkBundle:(id)a3;
- (void)setInvitationHandlerForPresentedAlert:(id)a3;
- (void)setInvitationsBuffer:(id)a3;
- (void)setIsAdvertising:(BOOL)a3;
- (void)setMyPeerID:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setSession:(id)a3;
- (void)setWasAdvertising:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation MCAdvertiserAssistant

- (MCAdvertiserAssistant)init
{
  v3.receiver = self;
  v3.super_class = (Class)MCAdvertiserAssistant;
  [(MCAdvertiserAssistant *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (MCAdvertiserAssistant)initWithServiceType:(NSString *)serviceType discoveryInfo:(NSDictionary *)info session:(MCSession *)session
{
  v20.receiver = self;
  v20.super_class = (Class)MCAdvertiserAssistant;
  v8 = [(MCAdvertiserAssistant *)&v20 init];
  if (v8)
  {
    if (!session)
    {
      v9 = (void *)MEMORY[0x263EFF940];
      uint64_t v10 = *MEMORY[0x263EFF4A0];
      v11 = (objc_class *)objc_opt_class();
      [v9 raise:v10, @"A nil MCSession object passed to %@", NSStringFromClass(v11) format];
    }
    v12 = session;
    v8->_session = v12;
    v8->_myPeerID = (MCPeerID *)[(MCPeerID *)[(MCSession *)v12 myPeerID] copy];
    if (!+[MCNearbyServiceUtils isServiceTypeValid:serviceType])
    {
      v13 = (void *)MEMORY[0x263EFF940];
      uint64_t v14 = *MEMORY[0x263EFF4A0];
      v15 = (objc_class *)objc_opt_class();
      [v13 raise:v14, @"Invalid serviceType passed to %@", NSStringFromClass(v15) format];
    }
    v8->_serviceType = (NSString *)[(NSString *)serviceType copy];
    v8->_discoveryInfo = (NSDictionary *)[(NSDictionary *)info copy];
    v16 = [[MCNearbyServiceAdvertiser alloc] initWithPeer:v8->_myPeerID discoveryInfo:v8->_discoveryInfo serviceType:v8->_serviceType];
    v8->_advertiser = v16;
    [(MCNearbyServiceAdvertiser *)v16 setDelegate:v8];
    v8->_invitationsBuffer = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v17 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "infoDictionary");
    v8->_appName = (NSString *)objc_msgSend((id)objc_msgSend(v17, "objectForKey:", *MEMORY[0x263EFFB68]), "copy");
    v8->_frameworkBundle = (NSBundle *)(id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v18 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v8 selector:sel_applicationDidEnterBackgroundNotification_ name:*MEMORY[0x263F1D050] object:0];
    [v18 addObserver:v8 selector:sel_applicationWillTerminateNotification_ name:*MEMORY[0x263F1D0E0] object:0];
  }
  return v8;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  [(MCNearbyServiceAdvertiser *)self->_advertiser setDelegate:0];
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)MCAdvertiserAssistant;
  [(MCAdvertiserAssistant *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MCAdvertiserAssistant *)self serviceType];
  v7 = [(MCAdvertiserAssistant *)self discoveryInfo];
  v8 = [(MCAdvertiserAssistant *)self session];
  [(MCAdvertiserAssistant *)self delegate];
  v9 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p ServiceType = %@ DiscoveryInfo = %@ Session = %@ Delegate = <%@: %p>>", v5, self, v6, v7, v8, NSStringFromClass(v9), -[MCAdvertiserAssistant delegate](self, "delegate")];
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
}

- (void)start
{
  v2 = [(MCAdvertiserAssistant *)self advertiser];

  [(MCNearbyServiceAdvertiser *)v2 startAdvertisingPeer];
}

- (void)stop
{
  v2 = [(MCAdvertiserAssistant *)self advertiser];

  [(MCNearbyServiceAdvertiser *)v2 stopAdvertisingPeer];
}

- (void)handleUserInvitationDecision:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MCAdvertiserAssistant *)self invitationHandlerForPresentedAlert])
  {
    if (v3) {
      v5 = [(MCAdvertiserAssistant *)self session];
    }
    else {
      v5 = 0;
    }
    v7 = [(MCAdvertiserAssistant *)self invitationHandlerForPresentedAlert];
    v7[2](v7, v3, v5);
    [(MCAdvertiserAssistant *)self setInvitationHandlerForPresentedAlert:0];
    [(MCAdvertiserAssistant *)self presentNextInvitation];
  }
  else
  {
    v6 = mcadvertiser_ui_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MCAdvertiserAssistant handleUserInvitationDecision:](v6);
    }
  }
}

- (void)presentNextInvitation
{
  if (![(MCAdvertiserAssistant *)self alertController]
    && ![(MCAdvertiserAssistant *)self invitationHandlerForPresentedAlert])
  {
    if ([(NSMutableArray *)[(MCAdvertiserAssistant *)self invitationsBuffer] count])
    {
      BOOL v3 = (void *)[(NSMutableArray *)[(MCAdvertiserAssistant *)self invitationsBuffer] objectAtIndex:0];
      v4 = (void *)[v3 objectForKey:@"peerID"];
      -[MCAdvertiserAssistant setInvitationHandlerForPresentedAlert:](self, "setInvitationHandlerForPresentedAlert:", [v3 objectForKey:@"invitationHandler"]);
      v5 = [(NSBundle *)self->_frameworkBundle localizedStringForKey:@"Accept" value:&stru_26C9DA3B0 table:0];
      v6 = [(NSBundle *)self->_frameworkBundle localizedStringForKey:@"Decline" value:&stru_26C9DA3B0 table:0];
      v7 = [(NSBundle *)self->_frameworkBundle localizedStringForKey:@"%@ wants to connect." value:&stru_26C9DA3B0 table:0];
      v8 = [(MCAdvertiserAssistant *)self appName];
      v9 = +[MCAlertController alertControllerWithTitle:message:preferredStyle:](MCAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, objc_msgSend(NSString, "stringWithFormat:", v7, objc_msgSend(v4, "displayName")), 1);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke;
      v13[3] = &unk_2643388D0;
      v13[4] = self;
      -[MCAlertController addAction:](v9, "addAction:", [MEMORY[0x263F1C3F0] actionWithTitle:v5 style:0 handler:v13]);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke_2;
      v12[3] = &unk_2643388D0;
      v12[4] = self;
      -[MCAlertController addAction:](v9, "addAction:", [MEMORY[0x263F1C3F0] actionWithTitle:v6 style:1 handler:v12]);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke_3;
      v11[3] = &unk_264337EE8;
      v11[4] = self;
      [(MCAlertController *)v9 setViewWillAppearHandler:v11];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke_4;
      v10[3] = &unk_264337EE8;
      v10[4] = self;
      [(MCAlertController *)v9 setViewDidDisappearHandler:v10];
      [(MCAdvertiserAssistant *)self setAlertController:v9];
      [(MCAlertController *)[(MCAdvertiserAssistant *)self alertController] show];
      [(NSMutableArray *)[(MCAdvertiserAssistant *)self invitationsBuffer] removeObjectAtIndex:0];
    }
  }
}

uint64_t __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleUserInvitationDecision:1];
}

uint64_t __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleUserInvitationDecision:0];
}

uint64_t __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  char v2 = objc_opt_respondsToSelector();
  BOOL v3 = (void *)[*(id *)(a1 + 32) delegate];
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    return [v3 advertiserAssitantWillPresentInvitation:v4];
  }
  else
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      v6 = (void *)[*(id *)(a1 + 32) delegate];
      uint64_t v7 = *(void *)(a1 + 32);
      return [v6 advertiserAssistantWillPresentInvitation:v7];
    }
  }
  return result;
}

uint64_t __46__MCAdvertiserAssistant_presentNextInvitation__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "advertiserAssistantDidDismissInvitation:", *(void *)(a1 + 32));
  }
  char v2 = *(void **)(a1 + 32);

  return [v2 setAlertController:0];
}

- (void)advertiser:(id)a3 didReceiveInvitationFromPeer:(id)a4 withContext:(id)a5 invitationHandler:(id)a6
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v9 = mcadvertiser_ui_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = [a4 displayName];
    _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "Advertiser assistant will present invitation from from peer [%@].", buf, 0xCu);
  }
  v10[0] = @"peerID";
  v10[1] = @"invitationHandler";
  v11[0] = a4;
  v11[1] = (id)[a6 copy];
  -[NSMutableArray addObject:](-[MCAdvertiserAssistant invitationsBuffer](self, "invitationsBuffer"), "addObject:", [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2]);
  [(MCAdvertiserAssistant *)self presentNextInvitation];
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  if ([(MCAdvertiserAssistant *)self alertController])
  {
    [(MCAdvertiserAssistant *)self handleUserInvitationDecision:0];
    [(MCAlertController *)[(MCAdvertiserAssistant *)self alertController] dismiss];
    [(MCAdvertiserAssistant *)self setAlertController:0];
  }
  invitationsBuffer = self->_invitationsBuffer;

  [(NSMutableArray *)invitationsBuffer removeAllObjects];
}

- (void)applicationWillTerminateNotification:(id)a3
{
  if ([(MCAdvertiserAssistant *)self alertController])
  {
    [(MCAdvertiserAssistant *)self handleUserInvitationDecision:0];
    [(MCAlertController *)[(MCAdvertiserAssistant *)self alertController] dismiss];
    [(MCAdvertiserAssistant *)self setAlertController:0];
  }
}

- (MCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSDictionary)discoveryInfo
{
  return self->_discoveryInfo;
}

- (void)setDiscoveryInfo:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (MCPeerID)myPeerID
{
  return self->_myPeerID;
}

- (void)setMyPeerID:(id)a3
{
}

- (MCNearbyServiceAdvertiser)advertiser
{
  return self->_advertiser;
}

- (void)setAdvertiser:(id)a3
{
}

- (NSMutableArray)invitationsBuffer
{
  return self->_invitationsBuffer;
}

- (void)setInvitationsBuffer:(id)a3
{
}

- (id)invitationHandlerForPresentedAlert
{
  return self->_invitationHandlerForPresentedAlert;
}

- (void)setInvitationHandlerForPresentedAlert:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (void)setIsAdvertising:(BOOL)a3
{
  self->_isAdvertising = a3;
}

- (BOOL)wasAdvertising
{
  return self->_wasAdvertising;
}

- (void)setWasAdvertising:(BOOL)a3
{
  self->_wasAdvertising = a3;
}

- (NSBundle)frameworkBundle
{
  return self->_frameworkBundle;
}

- (void)setFrameworkBundle:(id)a3
{
}

- (MCAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (void)handleUserInvitationDecision:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218756000, log, OS_LOG_TYPE_ERROR, "Couldn't find invitationHandler.", v1, 2u);
}

@end