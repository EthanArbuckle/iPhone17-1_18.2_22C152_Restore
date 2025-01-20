@interface CKMediaObjectAddToLibraryAssetActionPerformer
+ (BOOL)canPerformOnImplicitSelection;
+ (BOOL)canPerformWithActionManager:(id)a3 selectionSnapshot:(id)a4;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation CKMediaObjectAddToLibraryAssetActionPerformer

+ (BOOL)canPerformWithActionManager:(id)a3 selectionSnapshot:(id)a4
{
  id v5 = a4;
  v6 = [a3 chatItem];
  if ([v6 canPerformQuickAction]) {
    char v7 = [v5 isAnyItemSelected];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)canPerformOnImplicitSelection
{
  return 1;
}

- (void)performUserInteractionTask
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(PXAssetActionPerformer *)self selectionSnapshot];
  if ([v3 isAnyItemSelected])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = [v3 allItemsEnumerator];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) mediaObject];
          if (v9) {
            [v4 addObject:v9];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }

    if (_IMWillLog())
    {
      [v4 count];
      _IMAlwaysLog();
    }
    id location = 0;
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__CKMediaObjectAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke;
    v15[3] = &unk_1E56215C8;
    objc_copyWeak(&v16, &location);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75__CKMediaObjectAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_3;
    v13[3] = &unk_1E562C2B0;
    objc_copyWeak(&v14, &location);
    v10 = +[CKUtilities quickSaveConfirmationAlertForMediaObjects:v4 momentShareURL:0 popoverSource:0 metricsSource:*MEMORY[0x1E4F6DB78] cancelHandler:v15 preSaveHandler:&__block_literal_global_251 postSaveHandler:v13];
    if (v10)
    {
      if (![(PXActionPerformer *)self presentViewController:v10])
      {
        v11 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"CKMediaObjectAddToLibraryAssetActionPerformer: Failed to present save alert");
        [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v11];
      }
    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"CKMediaObjectAddToLibraryAssetActionPerformer: No items selected for add to library action");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v12];
  }
}

void __75__CKMediaObjectAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completeUserInteractionTaskWithSuccess:1 error:0];
}

void __75__CKMediaObjectAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained completeUserInteractionTaskWithSuccess:a2 error:v5];
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  id v4 = CKFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"SAVE_TO_PHOTO_LIBRARY" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v5;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"square.and.arrow.down";
}

@end