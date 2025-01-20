@interface _KSTextReplacementManager
+ (id)textReplacementStoreWithTestDirectory:(id)a3 withDelegate:(id)a4;
- (NSString)directoryPath;
- (_KSTextReplacementCKStore)ckStore;
- (_KSTextReplacementManager)initWithDirectoryPath:(id)a3;
- (_KSTextReplacementSyncProtocol)textReplacementStore;
- (double)minimumUptimeRemaining;
- (void)dealloc;
- (void)notifyTextReplacementDidChange;
- (void)pushAllLocalRecordsOnceIfNeeded;
- (void)recordSyncStatus;
- (void)requestSync:(unint64_t)a3 withCompletionBlock:(id)a4;
- (void)requestSyncWithCompletionBlock:(id)a3;
- (void)setCkStore:(id)a3;
- (void)setDirectoryPath:(id)a3;
- (void)setTextReplacementStore:(id)a3;
@end

@implementation _KSTextReplacementManager

- (_KSTextReplacementManager)initWithDirectoryPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_KSTextReplacementManager;
  v6 = [(_KSTextReplacementManager *)&v13 init];
  if (v6)
  {
    v7 = (void *)MEMORY[0x230F44DF0]();
    v8 = [[_KSTextReplacementCKStore alloc] initWithDirectoryPath:v5];
    ckStore = v6->_ckStore;
    v6->_ckStore = v8;

    objc_storeStrong((id *)&v6->_directoryPath, a3);
    v10 = KSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[_KSTextReplacementManager initWithDirectoryPath:]";
      _os_log_impl(&dword_22B2BC000, v10, OS_LOG_TYPE_INFO, "%s  >>> using cloudkit store", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_textReplacementStore, v6->_ckStore);
    +[_KSAggdLogger setValue:1 forScalarKey:@"com.apple.keyboard.textReplacement.usingCloudKitSyncing"];
    [(_KSTextReplacementManager *)v6 pushAllLocalRecordsOnceIfNeeded];
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v6 selector:sel_notifyTextReplacementDidChange name:@"_KSTRCKStoreDidReceiveChangesNotification" object:0];
  }

  return v6;
}

- (_KSTextReplacementSyncProtocol)textReplacementStore
{
  return self->_textReplacementStore;
}

- (void)pushAllLocalRecordsOnceIfNeeded
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60___KSTextReplacementManager_pushAllLocalRecordsOnceIfNeeded__block_invoke;
  block[3] = &unk_2648906A8;
  block[4] = self;
  if (pushAllLocalRecordsOnceIfNeeded_onceToken != -1) {
    dispatch_once(&pushAllLocalRecordsOnceIfNeeded_onceToken, block);
  }
}

+ (id)textReplacementStoreWithTestDirectory:(id)a3 withDelegate:(id)a4
{
  id v4 = a3;
  id v5 = [[_KSTextReplacementManager alloc] initWithDirectoryPath:v4];

  v6 = [(_KSTextReplacementManager *)v5 ckStore];
  [(_KSTextReplacementManager *)v5 setTextReplacementStore:v6];

  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_KSTextReplacementManager;
  [(_KSTextReplacementManager *)&v4 dealloc];
}

- (void)notifyTextReplacementDidChange
{
  if (notify_post((const char *)[@"KSTextReplacementDidChangeNotification" UTF8String])) {
    NSLog(&cfstr_ErrorSendingDa.isa);
  }
  NSLog(&cfstr_SendingOutShor.isa);
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"KSTextReplacementDidChangeNotification" object:0];
}

- (void)requestSyncWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(_KSTextReplacementManager *)self textReplacementStore];
  [v5 requestSyncWithCompletionBlock:v4];
}

- (void)requestSync:(unint64_t)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(_KSTextReplacementManager *)self textReplacementStore];
  [v7 requestSync:a3 withCompletionBlock:v6];
}

- (double)minimumUptimeRemaining
{
  return 0.0;
}

- (void)recordSyncStatus
{
  id v2 = [(_KSTextReplacementManager *)self ckStore];
  [v2 recordSyncStatus];
}

- (_KSTextReplacementCKStore)ckStore
{
  return self->_ckStore;
}

- (void)setCkStore:(id)a3
{
}

- (void)setTextReplacementStore:(id)a3
{
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

- (void)setDirectoryPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryPath, 0);
  objc_storeStrong((id *)&self->_textReplacementStore, 0);
  objc_storeStrong((id *)&self->_ckStore, 0);
}

@end