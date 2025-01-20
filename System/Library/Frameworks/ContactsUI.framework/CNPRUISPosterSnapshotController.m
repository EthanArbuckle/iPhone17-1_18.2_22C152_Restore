@interface CNPRUISPosterSnapshotController
- (id)latestSnapshotBundleForRequest:(id)a3 error:(id *)a4;
- (id)sharedController;
- (void)acquireKeepActiveAssertionForReason:(id)a3;
- (void)executeSnapshotRequest:(id)a3 completion:(id)a4;
- (void)releaseKeepActiveAssertionForReason:(id)a3;
@end

@implementation CNPRUISPosterSnapshotController

- (void)releaseKeepActiveAssertionForReason:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F5A298];
  v6 = *(unsigned int (**)(uint64_t, id))(*MEMORY[0x1E4F5A298] + 16);
  id v7 = a3;
  if (v6(v5, v7))
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"CNPostersSoftLinkWrappers.m" lineNumber:707 description:@"assertion reason must be non-empty"];
  }
  id v9 = [(id)_assertions objectForKeyedSubscript:v7];
  [v9 invalidate];
  [(id)_assertions setObject:0 forKeyedSubscript:v7];
}

- (void)acquireKeepActiveAssertionForReason:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 == 1)
  {
    v8 = CNUILogPosters();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      id v9 = "Posters are not supported on iPad";
      v10 = v8;
      uint32_t v11 = 2;
LABEL_11:
      _os_log_impl(&dword_18B625000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v16, v11);
    }
  }
  else
  {
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"CNPostersSoftLinkWrappers.m" lineNumber:689 description:@"assertion reason must be non-empty"];
    }
    if (acquireKeepActiveAssertionForReason__onceToken != -1) {
      dispatch_once(&acquireKeepActiveAssertionForReason__onceToken, &__block_literal_global_64632);
    }
    v12 = [(id)_assertions objectForKeyedSubscript:v5];

    if (!v12)
    {
      v13 = [(CNPRUISPosterSnapshotController *)self sharedController];
      v14 = [v13 acquireKeepActiveAssertionForReason:v5];

      [(id)_assertions setObject:v14 forKeyedSubscript:v5];
      goto LABEL_13;
    }
    v8 = CNUILogPosters();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v5;
      id v9 = "There's already an assertion for reason: %@, skipping adding another one";
      v10 = v8;
      uint32_t v11 = 12;
      goto LABEL_11;
    }
  }

LABEL_13:
}

void __71__CNPRUISPosterSnapshotController_acquireKeepActiveAssertionForReason___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_assertions;
  _assertions = (uint64_t)v0;
}

- (void)executeSnapshotRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CNPRUISPosterSnapshotController *)self sharedController];
  id v9 = [v7 wrappedRequest];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__CNPRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke;
  v11[3] = &unk_1E549BD00;
  id v12 = v6;
  id v10 = v6;
  [v8 executeSnapshotRequest:v9 completion:v11];
}

void __69__CNPRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  if (*(void *)(a1 + 32))
  {
    id v7 = a4;
    id v8 = a3;
    id v9 = a2;
    uint32_t v11 = [[CNPRUISPosterSnapshotRequest alloc] initWithWrappedRequest:v9];

    id v10 = [[CNPRUISPosterSnapshotResult alloc] initWithWrappedResult:v8];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)latestSnapshotBundleForRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CNPRUISPosterSnapshotController *)self sharedController];
  id v8 = [v6 wrappedRequest];

  id v9 = [v7 latestSnapshotBundleForRequest:v8 error:a4];

  if (v9) {
    id v10 = [[CNPRPosterSnapshotBundle alloc] initWithWrappedBundle:v9];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (id)sharedController
{
  Class PRUISPosterSnapshotControllerClass = getPRUISPosterSnapshotControllerClass();

  return (id)[(objc_class *)PRUISPosterSnapshotControllerClass sharedIncomingCallSnapshotController];
}

@end