@interface GKPlayerPickerViewController
- (GKMatchmakerViewController)matchmakerVC;
- (GKPlayerPickerContext)context;
- (GKPlayerPickerDelegate)delegate;
- (GKPlayerPickerViewController)initWithContext:(id)a3;
- (GKPlayerPickerViewController)initWithMatch:(id)a3 maxPlayers:(int64_t)a4;
- (GKPlayerPickerViewController)initWithMaxPlayers:(int64_t)a3;
- (id)_initWithMaxPlayers:(int64_t)a3 excludedPlayers:(id)a4;
- (id)matchmaker;
- (void)internalPlayerPickerDidCancel;
- (void)internalPlayerPickerDidPickPlayers:(id)a3;
- (void)matchmakerViewController:(id)a3 didFailWithError:(id)a4;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMatchmakerVC:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKPlayerPickerViewController

- (GKPlayerPickerViewController)initWithContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKPlayerPickerViewController;
  v6 = [(GKPlayerPickerViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = [[GKMatchmakerViewController alloc] initWithPlayerPickerDelegate:v7 andPlayerPickerContext:v5];
    matchmakerVC = v7->_matchmakerVC;
    v7->_matchmakerVC = v8;

    [(GKMatchmakerViewController *)v7->_matchmakerVC setMatchmakerDelegate:v7];
  }

  return v7;
}

- (GKPlayerPickerViewController)initWithMaxPlayers:(int64_t)a3
{
  return (GKPlayerPickerViewController *)[(GKPlayerPickerViewController *)self _initWithMaxPlayers:a3 excludedPlayers:0];
}

- (id)_initWithMaxPlayers:(int64_t)a3 excludedPlayers:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F639E8];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  [v8 setMaxPlayers:a3];
  [v8 setExcludedPlayers:v7];

  [v8 setPickerOrigin:0];
  v9 = [(GKPlayerPickerViewController *)self initWithContext:v8];

  return v9;
}

- (GKPlayerPickerViewController)initWithMatch:(id)a3 maxPlayers:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F639E8]);
  [v7 setMaxPlayers:a4];
  [v7 setPickerOrigin:2];
  id v8 = [v6 players];

  if (v8)
  {
    v9 = [v6 players];
    [v7 setExcludedPlayers:v9];
  }
  [v7 setMatch:v6];
  v10 = [(GKPlayerPickerViewController *)self initWithContext:v7];

  return v10;
}

- (id)matchmaker
{
  return (id)[MEMORY[0x1E4F63780] sharedMatchmaker];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)GKPlayerPickerViewController;
  [(GKPlayerPickerViewController *)&v14 viewDidLoad];
  v3 = [(GKPlayerPickerViewController *)self context];
  uint64_t v4 = [v3 maxPlayers];

  if (v4 <= 0)
  {
    objc_super v11 = [(GKPlayerPickerViewController *)self view];
    v12 = [v11 layer];
    [v12 setOpacity:0.0];
  }
  else
  {
    id v5 = [(GKPlayerPickerViewController *)self matchmakerVC];
    [(GKPlayerPickerViewController *)self addChildViewController:v5];

    id v6 = [(GKPlayerPickerViewController *)self view];
    id v7 = [(GKPlayerPickerViewController *)self matchmakerVC];
    id v8 = [v7 view];
    [v6 addSubview:v8];

    v9 = [(GKPlayerPickerViewController *)self matchmakerVC];
    [v9 didMoveToParentViewController:self];

    v10 = (void *)MEMORY[0x1E4F28DC8];
    objc_super v11 = [(GKPlayerPickerViewController *)self matchmakerVC];
    v12 = [v11 view];
    v13 = [(GKPlayerPickerViewController *)self view];
    [v10 _gkInstallEdgeConstraintsForView:v12 containedWithinParentView:v13];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)GKPlayerPickerViewController;
  [(GKPlayerPickerViewController *)&v15 viewWillAppear:a3];
  uint64_t v4 = [(GKPlayerPickerViewController *)self context];
  uint64_t v5 = [v4 maxPlayers];

  if (v5 <= 0)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v6 = (id)GKOSLoggers();
    }
    id v7 = *MEMORY[0x1E4F63848];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63848], OS_LOG_TYPE_ERROR)) {
      -[GKPlayerPickerViewController viewWillAppear:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    [(GKPlayerPickerViewController *)self internalPlayerPickerDidCancel];
  }
}

- (void)internalPlayerPickerDidPickPlayers:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(GKPlayerPickerViewController *)self context];
  id v6 = [v5 match];

  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v4];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v52 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v56;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v56 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v55 + 1) + 8 * v12);
          uint64_t v14 = [(GKPlayerPickerViewController *)self matchmaker];
          [v14 cancelPendingInviteToPlayer:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v55 objects:v59 count:16];
      }
      while (v10);
    }

    id v15 = objc_alloc_init(MEMORY[0x1E4F63770]);
    [v15 setRecipients:v7];
    v50 = [(GKPlayerPickerViewController *)self context];
    v49 = [v50 match];
    [v49 players];
    v16 = v51 = (void *)v7;
    uint64_t v17 = [v16 count];
    v18 = [(GKPlayerPickerViewController *)self context];
    v19 = [v18 match];
    uint64_t v20 = [v19 expectedPlayerCount];
    v21 = [(GKPlayerPickerViewController *)self matchmaker];
    v22 = [v21 allInvitedInvitees];
    objc_msgSend(v15, "setMinPlayers:", v17 + v20 + objc_msgSend(v22, "count") + 1);

    objc_msgSend(v15, "setMaxPlayers:", objc_msgSend(v8, "count") + objc_msgSend(v15, "minPlayers"));
    v23 = [(GKPlayerPickerViewController *)self matchmaker];
    v24 = [(GKPlayerPickerViewController *)self context];
    v25 = [v24 match];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __67__GKPlayerPickerViewController_internalPlayerPickerDidPickPlayers___block_invoke;
    v53[3] = &unk_1E5F63240;
    id v54 = v15;
    id v26 = v15;
    [v23 addPlayersToMatch:v25 matchRequest:v26 completionHandler:v53];

    id v4 = v52;
  }
  v27 = [(GKPlayerPickerViewController *)self delegate];

  if (v27)
  {
    v28 = [(GKPlayerPickerViewController *)self delegate];
    char v29 = objc_opt_respondsToSelector();

    if (v29)
    {
      v30 = [(GKPlayerPickerViewController *)self delegate];
      [v30 playerPickerViewController:self didPickPlayers:v4];
    }
    else
    {
      if (!*MEMORY[0x1E4F63860]) {
        id v39 = (id)GKOSLoggers();
      }
      v40 = *MEMORY[0x1E4F63848];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63848], OS_LOG_TYPE_ERROR)) {
        -[GKPlayerPickerViewController internalPlayerPickerDidPickPlayers:](v40, v41, v42, v43, v44, v45, v46, v47);
      }
    }
  }
  else
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v31 = (id)GKOSLoggers();
    }
    v32 = *MEMORY[0x1E4F63848];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63848], OS_LOG_TYPE_ERROR)) {
      -[GKPlayerPickerViewController internalPlayerPickerDidPickPlayers:]((uint64_t)self, v32, v33, v34, v35, v36, v37, v38);
    }
  }
  v48 = [(GKPlayerPickerViewController *)self matchmaker];
  [v48 stopBrowsingForNearbyPlayers];
}

void __67__GKPlayerPickerViewController_internalPlayerPickerDidPickPlayers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*MEMORY[0x1E4F63860]) {
    id v4 = (id)GKOSLoggers();
  }
  uint64_t v5 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_ERROR)) {
    __67__GKPlayerPickerViewController_internalPlayerPickerDidPickPlayers___block_invoke_cold_1(a1, (uint64_t)v3, v5);
  }
}

- (void)internalPlayerPickerDidCancel
{
}

- (void)matchmakerViewController:(id)a3 didFailWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!*MEMORY[0x1E4F63860]) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = *MEMORY[0x1E4F63850];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
    -[GKPlayerPickerViewController matchmakerViewController:didFailWithError:]((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (GKPlayerPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKPlayerPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GKPlayerPickerContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (GKMatchmakerViewController)matchmakerVC
{
  return self->_matchmakerVC;
}

- (void)setMatchmakerVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchmakerVC, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewWillAppear:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)internalPlayerPickerDidPickPlayers:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)internalPlayerPickerDidPickPlayers:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67__GKPlayerPickerViewController_internalPlayerPickerDidPickPlayers___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "Failed to add players in the player picker. request: %@, error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)matchmakerViewController:(uint64_t)a3 didFailWithError:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end