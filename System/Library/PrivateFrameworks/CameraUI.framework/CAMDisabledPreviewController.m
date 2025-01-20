@interface CAMDisabledPreviewController
- (BOOL)isPreviewDisabled;
- (CAMDisabledPreviewController)init;
- (CAMDisabledPreviewControllerDelegate)delegate;
- (NSMutableSet)_reasonsForDisablingPreview;
- (id)_descriptionForReasons:(id)a3;
- (id)_descriptionStringForReason:(int64_t)a3;
- (void)addDisabledPreviewReason:(int64_t)a3;
- (void)removeDisabledPreviewReason:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CAMDisabledPreviewController

- (CAMDisabledPreviewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CAMDisabledPreviewController;
  v2 = [(CAMDisabledPreviewController *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    reasonsForDisablingPreview = v2->__reasonsForDisablingPreview;
    v2->__reasonsForDisablingPreview = v3;

    v5 = v2;
  }

  return v2;
}

- (void)setDelegate:(id)a3
{
}

- (void)removeDisabledPreviewReason:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = [(CAMDisabledPreviewController *)self _reasonsForDisablingPreview];
  uint64_t v6 = [v5 count];
  objc_super v7 = [NSNumber numberWithInteger:a3];
  [v5 removeObject:v7];

  uint64_t v8 = [v5 count];
  if (v6 && !v8)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(CAMDisabledPreviewController *)self _descriptionStringForReason:a3];
      int v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Enabling disabled preview for final reason %{public}@", (uint8_t *)&v14, 0xCu);
    }
    v11 = [(CAMDisabledPreviewController *)self delegate];
    [v11 disabledPreviewController:self wantsPreviewEnabledForReason:a3];
LABEL_9:

    goto LABEL_10;
  }
  if (v6 != v8)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(CAMDisabledPreviewController *)self _descriptionStringForReason:a3];
      v13 = [(CAMDisabledPreviewController *)self _descriptionForReasons:v5];
      int v14 = 138543618;
      v15 = v12;
      __int16 v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "Removed disabled preview reason %{public}@: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_9;
  }
LABEL_10:
}

- (NSMutableSet)_reasonsForDisablingPreview
{
  return self->__reasonsForDisablingPreview;
}

- (BOOL)isPreviewDisabled
{
  v2 = [(CAMDisabledPreviewController *)self _reasonsForDisablingPreview];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)addDisabledPreviewReason:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = [(CAMDisabledPreviewController *)self _reasonsForDisablingPreview];
  uint64_t v6 = [v5 count];
  objc_super v7 = [NSNumber numberWithInteger:a3];
  [v5 addObject:v7];

  uint64_t v8 = [v5 count];
  if (!v6 && v8)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(CAMDisabledPreviewController *)self _descriptionStringForReason:a3];
      int v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Disabled preview for reason %{public}@", (uint8_t *)&v14, 0xCu);
    }
    v11 = [(CAMDisabledPreviewController *)self delegate];
    [v11 disabledPreviewController:self wantsPreviewDisabledForReason:a3];
LABEL_9:

    goto LABEL_10;
  }
  if (v6 != v8)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(CAMDisabledPreviewController *)self _descriptionStringForReason:a3];
      v13 = [(CAMDisabledPreviewController *)self _descriptionForReasons:v5];
      int v14 = 138543618;
      v15 = v12;
      __int16 v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "Added disabled preview reason %{public}@: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_9;
  }
LABEL_10:
}

- (id)_descriptionStringForReason:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_263FA3858[a3];
  }
}

- (id)_descriptionForReasons:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [MEMORY[0x263EFF9C0] set];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __55__CAMDisabledPreviewController__descriptionForReasons___block_invoke;
    v21[3] = &unk_263FA2E88;
    id v22 = v5;
    v23 = self;
    id v6 = v5;
    [v4 enumerateObjectsUsingBlock:v21];
    objc_super v7 = [v6 allObjects];
    uint64_t v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_24];

    v9 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", @"(");
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __55__CAMDisabledPreviewController__descriptionForReasons___block_invoke_3;
    uint64_t v18 = &unk_263FA2ED0;
    id v10 = v9;
    id v19 = v10;
    v20 = v8;
    id v11 = v8;
    [v11 enumerateObjectsUsingBlock:&v15];
    [v10 appendString:@""], v15, v16, v17, v18);
    v12 = v20;
    v13 = (__CFString *)v10;
  }
  else
  {
    v13 = &stru_26BD78BA0;
  }

  return v13;
}

void __55__CAMDisabledPreviewController__descriptionForReasons___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) _descriptionStringForReason:v3];
  [v4 addObject:v5];
}

uint64_t __55__CAMDisabledPreviewController__descriptionForReasons___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __55__CAMDisabledPreviewController__descriptionForReasons___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  [*(id *)(a1 + 32) appendString:a2];
  uint64_t result = [*(id *)(a1 + 40) count];
  if (result - 1 > a3)
  {
    id v6 = *(void **)(a1 + 32);
    return [v6 appendString:@", "];
  }
  return result;
}

- (CAMDisabledPreviewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMDisabledPreviewControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__reasonsForDisablingPreview, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end