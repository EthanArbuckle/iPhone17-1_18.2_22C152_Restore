@interface DictationOfflineStatusObserver
- (DictationOfflineStatusObserver)initWithDelegate:(id)a3;
- (DictationOfflineStatusObserverDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)updateOfflineDictationStatus;
@end

@implementation DictationOfflineStatusObserver

- (DictationOfflineStatusObserver)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DictationOfflineStatusObserver;
  v5 = [(DictationOfflineStatusObserver *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(DictationOfflineStatusObserver *)v5 setDelegate:v4];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    int v8 = IsTrialAssetDeliveryEnabled();
    v9 = (CFStringRef *)MEMORY[0x263F28790];
    if (!v8) {
      v9 = (CFStringRef *)MEMORY[0x263F28770];
    }
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)EmbeddedSpeechNewAssetInstalled, *v9, 0, (CFNotificationSuspensionBehavior)0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__DictationOfflineStatusObserver_initWithDelegate___block_invoke;
    block[3] = &unk_264A00D78;
    v12 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  return v6;
}

uint64_t __51__DictationOfflineStatusObserver_initWithDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateOfflineDictationStatus];
}

- (void)updateOfflineDictationStatus
{
  v3 = [MEMORY[0x263F285A0] sharedPreferences];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__DictationOfflineStatusObserver_updateOfflineDictationStatus__block_invoke;
  v4[3] = &unk_264A00DC8;
  v4[4] = self;
  [v3 getOfflineDictationStatusWithCompletion:v4];
}

void __62__DictationOfflineStatusObserver_updateOfflineDictationStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__DictationOfflineStatusObserver_updateOfflineDictationStatus__block_invoke_2;
  v5[3] = &unk_264A00DA0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __62__DictationOfflineStatusObserver_updateOfflineDictationStatus__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 offlineDictationStatusUpdated:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  int v4 = IsTrialAssetDeliveryEnabled();
  v5 = (CFNotificationName *)MEMORY[0x263F28790];
  if (!v4) {
    v5 = (CFNotificationName *)MEMORY[0x263F28770];
  }
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, *v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)DictationOfflineStatusObserver;
  [(DictationOfflineStatusObserver *)&v6 dealloc];
}

- (DictationOfflineStatusObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DictationOfflineStatusObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end