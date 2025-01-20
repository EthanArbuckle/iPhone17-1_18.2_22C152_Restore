@interface DBOEMPunchthroughViewController
- (BOOL)presentsFullScreen;
- (BOOL)presentsUnderStatusBar;
- (DBDashboardEntity)entity;
- (DBEnvironment)environment;
- (DBOEMPunchthroughViewController)initWithOEMPunchthroughEntity:(id)a3 environment:(id)a4;
- (NSString)identifier;
- (NSString)oemPunchthroughIdentifier;
- (_TtC9DashBoard15DBUISyncSession)uisyncSession;
- (id)presentationViewWithIdentifier:(id)a3;
- (void)_requestDismissal;
- (void)activateSceneWithSettings:(id)a3 completion:(id)a4;
- (void)backgroundSceneWithCompletion:(id)a3;
- (void)foregroundSceneWithSettings:(id)a3 completion:(id)a4;
- (void)handleEvent:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setUisyncSession:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)wrapTransition:(id)a3;
@end

@implementation DBOEMPunchthroughViewController

- (DBOEMPunchthroughViewController)initWithOEMPunchthroughEntity:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DBOEMPunchthroughViewController;
  v9 = [(DBOEMPunchthroughViewController *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entity, a3);
    v11 = [v7 identifier];
    uint64_t v12 = [v11 copy];
    oemPunchthroughIdentifier = v10->_oemPunchthroughIdentifier;
    v10->_oemPunchthroughIdentifier = (NSString *)v12;

    objc_storeWeak((id *)&v10->_environment, v8);
    v14 = [v8 environmentConfiguration];
    uint64_t v15 = [v14 uisyncSession];
    uisyncSession = v10->_uisyncSession;
    v10->_uisyncSession = (_TtC9DashBoard15DBUISyncSession *)v15;
  }
  return v10;
}

- (NSString)identifier
{
  v2 = NSString;
  v3 = [(DBOEMPunchthroughViewController *)self oemPunchthroughIdentifier];
  v4 = [v2 stringWithFormat:@"stream:%@", v3];

  return (NSString *)v4;
}

- (BOOL)presentsUnderStatusBar
{
  return 0;
}

- (BOOL)presentsFullScreen
{
  return 0;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)DBOEMPunchthroughViewController;
  [(DBOEMPunchthroughViewController *)&v7 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] tableBackgroundColor];
  v4 = [(DBOEMPunchthroughViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(DBOEMPunchthroughViewController *)self view];
  v6 = [v5 layer];
  [v6 setHitTestsAsOpaque:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBOEMPunchthroughViewController;
  [(DBOEMPunchthroughViewController *)&v5 viewDidAppear:a3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__DBOEMPunchthroughViewController_viewDidAppear___block_invoke;
  v4[3] = &unk_2649B3E90;
  v4[4] = self;
  [(DBOEMPunchthroughViewController *)self wrapTransition:v4];
}

void __49__DBOEMPunchthroughViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uisyncSession];
  v11[0] = @"presentStream";
  v3 = [*(id *)(a1 + 32) oemPunchthroughIdentifier];
  v11[1] = @"current_ntp_time";
  v12[0] = v3;
  v4 = NSNumber;
  mach_absolute_time();
  objc_super v5 = [v4 numberWithUnsignedLongLong:UpTicksToNTP()];
  v12[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  objc_super v7 = NSString;
  id v8 = [*(id *)(a1 + 32) identifier];
  v9 = [v7 stringWithFormat:@"Presenting %@", v8];
  [v2 sendTransitionStart:v6 description:v9 error:0];

  v10 = [*(id *)(a1 + 32) uisyncSession];
  [v10 sendTransitionEnd:MEMORY[0x263EFFA78] error:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBOEMPunchthroughViewController;
  [(DBOEMPunchthroughViewController *)&v5 viewDidDisappear:a3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__DBOEMPunchthroughViewController_viewDidDisappear___block_invoke;
  v4[3] = &unk_2649B3E90;
  v4[4] = self;
  [(DBOEMPunchthroughViewController *)self wrapTransition:v4];
}

void __52__DBOEMPunchthroughViewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uisyncSession];
  v11[0] = @"dismissStream";
  v3 = [*(id *)(a1 + 32) oemPunchthroughIdentifier];
  v11[1] = @"current_ntp_time";
  v12[0] = v3;
  v4 = NSNumber;
  mach_absolute_time();
  objc_super v5 = [v4 numberWithUnsignedLongLong:UpTicksToNTP()];
  v12[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  objc_super v7 = NSString;
  id v8 = [*(id *)(a1 + 32) identifier];
  v9 = [v7 stringWithFormat:@"Dismissing %@", v8];
  [v2 sendTransitionStart:v6 description:v9 error:0];

  v10 = [*(id *)(a1 + 32) uisyncSession];
  [v10 sendTransitionEnd:MEMORY[0x263EFFA78] error:0];
}

- (void)wrapTransition:(id)a3
{
  v4 = (void (**)(void))a3;
  objc_super v5 = [(DBOEMPunchthroughViewController *)self uisyncSession];
  [v5 metadataTransfer:&unk_26E17F1F0 error:0];

  v4[2](v4);
  id v6 = [(DBOEMPunchthroughViewController *)self uisyncSession];
  [v6 metadataTransfer:&unk_26E17F218 error:0];
}

- (void)foregroundSceneWithSettings:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)backgroundSceneWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)activateSceneWithSettings:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (id)presentationViewWithIdentifier:(id)a3
{
  return 0;
}

- (void)handleEvent:(id)a3
{
  uint64_t v4 = [a3 type];
  if (v4 == 10 || v4 == 1)
  {
    [(DBOEMPunchthroughViewController *)self _requestDismissal];
  }
}

- (void)_requestDismissal
{
  id v6 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
  v3 = [(DBOEMPunchthroughViewController *)self oemPunchthroughIdentifier];
  [(DBMutableWorkspaceStateChangeRequest *)v6 deactivateOEMPunchthrough:v3];

  uint64_t v4 = [(DBOEMPunchthroughViewController *)self environment];
  objc_super v5 = [v4 workspace];
  [v5 requestStateChange:v6];
}

- (DBDashboardEntity)entity
{
  return self->_entity;
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (NSString)oemPunchthroughIdentifier
{
  return self->_oemPunchthroughIdentifier;
}

- (_TtC9DashBoard15DBUISyncSession)uisyncSession
{
  return self->_uisyncSession;
}

- (void)setUisyncSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uisyncSession, 0);
  objc_storeStrong((id *)&self->_oemPunchthroughIdentifier, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_entity, 0);
}

@end