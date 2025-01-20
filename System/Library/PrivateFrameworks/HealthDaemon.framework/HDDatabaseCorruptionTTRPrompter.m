@interface HDDatabaseCorruptionTTRPrompter
- (BOOL)shouldAttemptTTRForProfileIdentier:(id)a3 component:(int64_t)a4;
- (HDDatabaseCorruptionTTRPrompter)init;
- (HDDatabaseCorruptionTTRPrompter)initWithStore:(id)a3 behavior:(id)a4;
- (id)TTRAttemptRecordForProfile:(id)a3;
- (id)unitTest_willPresentTTRAlertHandler;
- (void)_popAlertWithRadarDescription:(id)a3;
- (void)promptForEvent:(id)a3;
- (void)setUnitTest_willPresentTTRAlertHandler:(id)a3;
@end

@implementation HDDatabaseCorruptionTTRPrompter

- (HDDatabaseCorruptionTTRPrompter)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDDatabaseCorruptionTTRPrompter)initWithStore:(id)a3 behavior:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDDatabaseCorruptionTTRPrompter;
  v9 = [(HDDatabaseCorruptionTTRPrompter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_corruptionStore, a3);
    objc_storeStrong((id *)&v10->_behavior, a4);
  }

  return v10;
}

- (id)TTRAttemptRecordForProfile:(id)a3
{
  uint64_t v4 = [a3 identifier];
  v5 = [v4 UUIDString];

  v6 = [(_HKBehavior *)self->_behavior currentOSBuild];
  id v7 = [NSString stringWithFormat:@"%@-%@", v5, v6];

  return v7;
}

- (BOOL)shouldAttemptTTRForProfileIdentier:(id)a3 component:(int64_t)a4
{
  id v6 = a3;
  if ([(_HKBehavior *)self->_behavior isAppleInternalInstall]
    && ([(_HKBehavior *)self->_behavior isTestingDevice] & 1) == 0)
  {
    id v8 = [(HDDatabaseCorruptionTTRPrompter *)self TTRAttemptRecordForProfile:v6];
    v9 = [(HDDatabaseCorruptionEventStore *)self->_corruptionStore mostRecentTTRAttemptForProfileIdentifier:v6 component:a4];
    v10 = v9;
    if (v9 == v8)
    {
      LOBYTE(v7) = 0;
    }
    else if (v8)
    {
      int v7 = [v9 isEqualToString:v8] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)promptForEvent:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 profileIdentifier];
  BOOL v6 = -[HDDatabaseCorruptionTTRPrompter shouldAttemptTTRForProfileIdentier:component:](self, "shouldAttemptTTRForProfileIdentier:component:", v5, [v4 component]);

  if (v6 && (atomic_exchange(_isPresenting, 1u) & 1) == 0)
  {
    id v7 = [NSString alloc];
    id v8 = HDStringFromDatabaseComponentIdentifier([v4 component]);
    v9 = [v4 error];
    v30 = (void *)[v7 initWithFormat:@"Database corruption in %@: %@", v8, v9];

    id v27 = [NSString alloc];
    v29 = [v4 error];
    v10 = [v29 domain];
    v28 = [v4 error];
    uint64_t v11 = [v28 code];
    objc_super v12 = [v4 error];
    v13 = [v12 localizedDescription];
    v14 = [v4 buildDescription];
    v15 = HDStringFromDatabaseComponentIdentifier([v4 component]);
    v16 = [v4 profileIdentifier];
    v17 = [v4 date];
    v18 = (void *)[v27 initWithFormat:@"%@\n\nError(%@, %ld):\n%@\n\nBuild:%@\nComponent:%@\nProfile:%@\nDate:%@\n", v30, v10, v11, v13, v14, v15, v16, v17];

    v19 = [v4 failedObliterationReason];

    if (v19)
    {
      v20 = [v4 failedObliterationReason];
      uint64_t v21 = [v18 stringByAppendingFormat:@"\n\n*** Resulted from failed obliteration attempt for reason <%@>", v20];

      v18 = (void *)v21;
    }
    _HKInitializeLogging();
    v22 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = self;
      __int16 v33 = 2114;
      v34 = v18;
      _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: present database corruption alert %{public}@", buf, 0x16u);
    }
    [(HDDatabaseCorruptionTTRPrompter *)self _popAlertWithRadarDescription:v18];
    corruptionStore = self->_corruptionStore;
    v24 = [v4 profileIdentifier];
    v25 = [(HDDatabaseCorruptionTTRPrompter *)self TTRAttemptRecordForProfile:v24];
    v26 = [v4 profileIdentifier];
    -[HDDatabaseCorruptionEventStore persistTTRAttempt:forProfileIdentifier:component:](corruptionStore, "persistTTRAttempt:forProfileIdentifier:component:", v25, v26, [v4 component]);
  }
}

- (void)_popAlertWithRadarDescription:(id)a3
{
  id v4 = a3;
  if (_HDIsUnitTesting)
  {
    v5 = _Block_copy(self->_unitTest_willPresentTTRAlertHandler);
    id v6 = v5;
    if (v5) {
      (*((void (**)(void *, HDDatabaseCorruptionTTRPrompter *, id))v5 + 2))(v5, self, v4);
    }
    atomic_store(0, (unsigned __int8 *)_isPresenting);
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F65D98]);
    [v6 setTitle:@"Corrupt Health Database"];
    [v6 setMessage:@"Corruption has been detected in your Health database. Please file a radar with Tap-to-Radar against 'Health' and attach your Health database directory. Instructions at https://at.apple.com/CaptureHealthDB"];
    [v6 setDefaultButton:@"Tap-to-Radar"];
    [v6 setCancelButton:@"Not Now"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__HDDatabaseCorruptionTTRPrompter__popAlertWithRadarDescription___block_invoke;
    v7[3] = &unk_1E62F8560;
    v7[4] = self;
    id v8 = v4;
    [v6 presentWithResponseHandler:v7];
  }
}

void __65__HDDatabaseCorruptionTTRPrompter__popAlertWithRadarDescription___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a3 == 1)
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v14;
      _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: TTR alert: 'Not Now' button pressed", buf, 0xCu);
    }
  }
  else if (!a3)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: TTR alert: 'Tap-to-Radar' button pressed", buf, 0xCu);
    }
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CB10], "hk_tapToHealthRadarURLWithTitle:description:classification:reproducibility:keywords:autoDiagnostics:attachments:", @"Corrupt Health Database", *(void *)(a1 + 40), 2, 6, &unk_1F17E9288, 2, 0);
    objc_super v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v12 openURL:v11 configuration:0 completionHandler:&__block_literal_global_43];
  }
  atomic_store(0, (unsigned __int8 *)_isPresenting);
}

void __65__HDDatabaseCorruptionTTRPrompter__popAlertWithRadarDescription___block_invoke_309(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Could not open Tap-to-Radar URL %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)unitTest_willPresentTTRAlertHandler
{
  return self->_unitTest_willPresentTTRAlertHandler;
}

- (void)setUnitTest_willPresentTTRAlertHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_willPresentTTRAlertHandler, 0);
  objc_storeStrong((id *)&self->_behavior, 0);

  objc_storeStrong((id *)&self->_corruptionStore, 0);
}

@end