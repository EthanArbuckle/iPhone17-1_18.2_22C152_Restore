@interface IAMICMessageEntryProvider
- (IAMICMessageEntryProvider)init;
- (IAMMessageEntryProviderDelegate)delegate;
- (void)_handleMessagesDidChangeNotification;
- (void)downloadResourcesForMessageWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)messageEntriesForBundleIdentifiers:(id)a3 completion:(id)a4;
- (void)removeApplicationBadgeForBundleIdentifier:(id)a3 fromPresentedMessageEntry:(id)a4 completion:(id)a5;
- (void)removeMessageEntryWithIdentifier:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5;
- (void)reportEventForMessageIdentifier:(id)a3 withParams:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation IAMICMessageEntryProvider

- (void)setDelegate:(id)a3
{
}

- (void)messageEntriesForBundleIdentifiers:(id)a3 completion:(id)a4
{
}

- (IAMICMessageEntryProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)IAMICMessageEntryProvider;
  v2 = [(IAMICMessageEntryProvider *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F89160] sharedManager];
    iTunesCloudIAMManager = v2->_iTunesCloudIAMManager;
    v2->_iTunesCloudIAMManager = (ICInAppMessageManager *)v3;

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel__handleMessagesDidChangeNotification name:*MEMORY[0x263F88F38] object:0];
  }
  return v2;
}

- (void)removeMessageEntryWithIdentifier:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  iTunesCloudIAMManager = self->_iTunesCloudIAMManager;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __93__IAMICMessageEntryProvider_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke;
  v13[3] = &unk_264341CA8;
  id v12 = v10;
  id v14 = v12;
  objc_copyWeak(&v15, &location);
  v13[4] = self;
  [(ICInAppMessageManager *)iTunesCloudIAMManager removeMessageEntryWithIdentifier:v8 forBundleIdentifier:v9 completion:v13];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __93__IAMICMessageEntryProvider_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  if (a2)
  {
    v3();
  }
  else
  {
    v3();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      id v6 = WeakRetained;
      v5 = [WeakRetained delegate];
      [v5 messageEntriesDidChange:*(void *)(a1 + 32)];

      id WeakRetained = v6;
    }
  }
}

- (void)reportEventForMessageIdentifier:(id)a3 withParams:(id)a4 completion:(id)a5
{
}

- (void)downloadResourcesForMessageWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
}

- (void)removeApplicationBadgeForBundleIdentifier:(id)a3 fromPresentedMessageEntry:(id)a4 completion:(id)a5
{
}

- (void)_handleMessagesDidChangeNotification
{
  uint64_t v3 = [(IAMICMessageEntryProvider *)self delegate];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(IAMICMessageEntryProvider *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(IAMICMessageEntryProvider *)self delegate];
      [v7 messageEntriesDidChange:self];
    }
  }
}

- (IAMMessageEntryProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IAMMessageEntryProviderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_iTunesCloudIAMManager, 0);
}

@end