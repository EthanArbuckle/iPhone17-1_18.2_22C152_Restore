@interface _SFApplicationExtensionActivity
- (BOOL)validateExtensionHasSameContainerAsHostApp:(id)a3;
- (id)customCompletionHandler;
- (void)activityDidFinish:(BOOL)a3 items:(id)a4 error:(id)a5;
- (void)setCustomCompletionHandler:(id)a3;
@end

@implementation _SFApplicationExtensionActivity

- (void)activityDidFinish:(BOOL)a3 items:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_SFApplicationExtensionActivity;
  [(UIActivity *)&v20 activityDidFinish:v6 items:v8 error:v9];
  v10 = WBS_LOG_CHANNEL_PREFIXExtensions();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_SFApplicationExtensionActivity activityDidFinish:items:error:](v11, v9);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    uint64_t v13 = [v8 count];
    *(_DWORD *)buf = 67109376;
    BOOL v22 = v6;
    __int16 v23 = 2048;
    uint64_t v24 = v13;
    _os_log_impl(&dword_1A690B000, v12, OS_LOG_TYPE_DEFAULT, "Toolbar button extension finished with status: %i; number of items returned: %lu",
      buf,
      0x12u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65___SFApplicationExtensionActivity_activityDidFinish_items_error___block_invoke;
  v16[3] = &unk_1E5C75148;
  BOOL v19 = v6;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  [(UIApplicationExtensionActivity *)self _dismissActivityFromViewController:0 animated:1 completion:v16];
}

- (BOOL)validateExtensionHasSameContainerAsHostApp:(id)a3
{
  id v4 = a3;
  v5 = [(UIApplicationExtensionActivity *)self applicationExtension];
  BOOL v6 = [v5 identifier];
  id v16 = 0;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v6 error:&v16];
  id v8 = v16;
  id v9 = [v7 containingBundleRecord];
  id v15 = v8;
  v10 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v4 allowPlaceholder:0 error:&v15];

  id v11 = v15;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v10 containingBundleRecord];

    v10 = (void *)v12;
  }
  char v13 = [v9 isEqual:v10];

  return v13;
}

- (id)customCompletionHandler
{
  return self->_customCompletionHandler;
}

- (void)setCustomCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)activityDidFinish:(void *)a1 items:(void *)a2 error:.cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  BOOL v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Toolbar button extension cancelled with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end