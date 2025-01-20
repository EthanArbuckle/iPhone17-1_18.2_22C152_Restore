@interface DMCRFMBSnapshotSource
- (BOOL)startRestoreForSnapshot:(id)a3 excludingAppBundleIdentifiers:(id)a4 completion:(id)a5;
- (DMCRFMBRestoreDelegate)restoreDelegate;
- (DMCRFMBSnapshotSource)initWithPersonaIdentifier:(id)a3 delegate:(id)a4;
- (DMCRFSnapshotSourceDelegate)delegate;
- (MBManager)mobileBackup;
- (NSString)personaIdentifier;
- (OS_dispatch_queue)queue;
- (void)fetchAppBundleIDsForSnapshot:(id)a3 completion:(id)a4;
- (void)fetchRestorableSnapshotsWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMobileBackup:(id)a3;
- (void)setPersonaIdentifier:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRestoreDelegate:(id)a3;
@end

@implementation DMCRFMBSnapshotSource

- (DMCRFMBSnapshotSource)initWithPersonaIdentifier:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)DMCRFMBSnapshotSource;
  v9 = [(DMCRFMBSnapshotSource *)&v20 init];
  if (v9)
  {
    v10 = *(NSObject **)(DMCLogObjects() + 32);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_221CC5000, v10, OS_LOG_TYPE_DEFAULT, "managed restore, DMCRFMBSnapshotSource init begin", v19, 2u);
    }
    dispatch_queue_t v11 = dispatch_queue_create("snapshot source", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_personaIdentifier, a3);
    v13 = [[DMCRFMBRestoreDelegate alloc] initWithDelegate:v8 source:v9];
    restoreDelegate = v9->_restoreDelegate;
    v9->_restoreDelegate = v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x263F559D8]) initWithDelegate:v9->_restoreDelegate eventQueue:v9->_queue personaIdentifier:v9->_personaIdentifier];
    mobileBackup = v9->_mobileBackup;
    v9->_mobileBackup = (MBManager *)v15;
  }
  v17 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_221CC5000, v17, OS_LOG_TYPE_DEFAULT, "managed restore, DMCRFMBSnapshotSource init end", v19, 2u);
  }

  return v9;
}

- (DMCRFSnapshotSourceDelegate)delegate
{
  v2 = [(DMCRFMBSnapshotSource *)self restoreDelegate];
  v3 = [v2 delegate];

  return (DMCRFSnapshotSourceDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(DMCRFMBSnapshotSource *)self restoreDelegate];
  [v5 setDelegate:v4];
}

- (void)fetchRestorableSnapshotsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CC5000, v5, OS_LOG_TYPE_DEFAULT, "managed restore, fetchRestorableSnapshotsWithCompletion: begin", buf, 2u);
  }
  *(void *)buf = 0;
  v14 = buf;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  v6 = [(DMCRFMBSnapshotSource *)self mobileBackup];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__DMCRFMBSnapshotSource_fetchRestorableSnapshotsWithCompletion___block_invoke;
  v10[3] = &unk_2645E99E0;
  v12 = buf;
  id v7 = v4;
  id v11 = v7;
  [v6 fetchRestorableSnapshotsWithCompletion:v10];

  id v8 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_221CC5000, v8, OS_LOG_TYPE_DEFAULT, "managed restore, fetchRestorableSnapshotsWithCompletion end", v9, 2u);
  }

  _Block_object_dispose(buf, 8);
}

void __64__DMCRFMBSnapshotSource_fetchRestorableSnapshotsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CC5000, v7, OS_LOG_TYPE_DEFAULT, "managed restore, fetchRestorableSnapshotsWithCompletion: completion", buf, 2u);
  }
  if (v5)
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * v15);
          v17 = [DMCRFMBSnapshot alloc];
          id v18 = -[DMCRFMBSnapshot initWithSnapshot:](v17, "initWithSnapshot:", v16, (void)v21);
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v18];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v13);
    }
  }
  uint64_t v19 = *(void *)(a1 + 32);
  if (v19)
  {
    objc_super v20 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
    (*(void (**)(uint64_t, void *, id))(v19 + 16))(v19, v20, v6);
  }
}

- (void)fetchAppBundleIDsForSnapshot:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CC5000, v8, OS_LOG_TYPE_DEFAULT, "managed restore, fetchAppBundleIDsForSnapshot:completion: begin", buf, 2u);
  }
  uint64_t v9 = [v6 wrappedValue];
  v10 = [(DMCRFMBSnapshotSource *)self mobileBackup];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__DMCRFMBSnapshotSource_fetchAppBundleIDsForSnapshot_completion___block_invoke;
  v13[3] = &unk_2645E9A08;
  id v11 = v7;
  id v14 = v11;
  [v10 fetchAppBundleIDsForSnapshot:v9 completion:v13];

  uint64_t v12 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CC5000, v12, OS_LOG_TYPE_DEFAULT, "managed restore, fetchAppBundleIDsForSnapshot:completion: end", buf, 2u);
  }
}

void __65__DMCRFMBSnapshotSource_fetchAppBundleIDsForSnapshot_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_221CC5000, v7, OS_LOG_TYPE_DEFAULT, "managed restore, fetchAppBundleIDsForSnapshot:completion: completion", v9, 2u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (BOOL)startRestoreForSnapshot:(id)a3 excludingAppBundleIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CC5000, v11, OS_LOG_TYPE_DEFAULT, "managed restore, startRestoreForSnapshot: begin", buf, 2u);
  }
  uint64_t v12 = [v8 wrappedValue];
  uint64_t v13 = objc_opt_new();
  [v13 setExcludedAppBundleIDs:v10];

  id v14 = [(DMCRFMBSnapshotSource *)self mobileBackup];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __90__DMCRFMBSnapshotSource_startRestoreForSnapshot_excludingAppBundleIdentifiers_completion___block_invoke;
  v18[3] = &unk_2645E9878;
  id v15 = v9;
  id v19 = v15;
  [v14 startRestoreForSnapshot:v12 options:v13 completion:v18];

  uint64_t v16 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CC5000, v16, OS_LOG_TYPE_DEFAULT, "managed restore, startRestoreForSnapshot: end", buf, 2u);
  }

  return 1;
}

void __90__DMCRFMBSnapshotSource_startRestoreForSnapshot_excludingAppBundleIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_221CC5000, v4, OS_LOG_TYPE_DEFAULT, "managed restore, startRestoreForSnapshot: completion", v6, 2u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (void)setPersonaIdentifier:(id)a3
{
}

- (MBManager)mobileBackup
{
  return self->_mobileBackup;
}

- (void)setMobileBackup:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (DMCRFMBRestoreDelegate)restoreDelegate
{
  return self->_restoreDelegate;
}

- (void)setRestoreDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreDelegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mobileBackup, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
}

@end