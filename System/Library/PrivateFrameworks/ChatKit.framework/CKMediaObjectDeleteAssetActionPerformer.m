@interface CKMediaObjectDeleteAssetActionPerformer
+ (BOOL)canPerformOnImplicitSelection;
+ (BOOL)canPerformWithActionManager:(id)a3;
+ (id)createPreviewActionWithActionManager:(id)a3 handler:(id)a4;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (void)_performRetractScheduledChatItem:(id)a3 completion:(id)a4;
- (void)_performRetractScheduledChatItems:(id)a3 fromAggregateChatItem:(id)a4 completion:(id)a5;
- (void)_presentDeleteConfirmationDialogForTypedCount:(id)a3 completionHandler:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation CKMediaObjectDeleteAssetActionPerformer

+ (BOOL)canPerformWithActionManager:(id)a3
{
  id v3 = a3;
  v4 = [v3 chatItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v3 selectionManager];
    v7 = [v6 selectionSnapshot];
    char v8 = [v7 isAnyItemSelected];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

+ (BOOL)canPerformOnImplicitSelection
{
  return 0;
}

- (void)performUserInteractionTask
{
  v2 = self;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKMediaObjectAssetActionPerformer *)self chatItem];
  uint64_t v4 = [v3 message];
  v5 = [(id)v4 fileTransferGUIDs];
  uint64_t v6 = [v5 count];

  v7 = [(CKMediaObjectAssetActionPerformer *)v2 chatItem];
  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if (v4)
  {
    char v8 = [(PXAssetActionPerformer *)v2 selectionSnapshot];
    if ([v8 isAnyItemSelected])
    {
      v9 = [(CKMediaObjectAssetActionPerformer *)v2 chatItem];
      BOOL CanBeCancelled = _ChatItemCanBeCancelled(v9);

      if (CanBeCancelled)
      {
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
        id v11 = v8;
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        v13 = [v11 allItemsEnumerator];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v63 objects:v67 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v64;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v64 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = [*(id *)(*((void *)&v63 + 1) + 8 * i) chatItem];
              if (v18) {
                [v12 addObject:v18];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v63 objects:v67 count:16];
          }
          while (v15);
        }

        v19 = [(CKMediaObjectAssetActionPerformer *)v2 chatItem];
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke;
        v62[3] = &unk_1E5620C40;
        v62[4] = v2;
        [(CKMediaObjectDeleteAssetActionPerformer *)v2 _performRetractScheduledChatItems:v12 fromAggregateChatItem:v19 completion:v62];

        goto LABEL_66;
      }
      id v11 = v8;
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      v25 = [v11 allItemsEnumerator];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v63 objects:v67 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        v53 = v2;
        obuint64_t j = v25;
        v28 = v24;
        uint64_t v51 = v6;
        id v52 = v11;
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        uint64_t v32 = *(void *)v64;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v64 != v32) {
              objc_enumerationMutation(obj);
            }
            v34 = *(void **)(*((void *)&v63 + 1) + 8 * j);
            v35 = objc_msgSend(v34, "mediaObject", v51);
            v36 = v35;
            if (v35)
            {
              v37 = [v35 transferGUID];
              [v28 addObject:v37];
            }
            uint64_t v38 = [v34 mediaType];
            if (v38 == 1) {
              uint64_t v39 = v29;
            }
            else {
              uint64_t v39 = v29 + 1;
            }
            if (v38 == 1) {
              uint64_t v40 = v31 + 1;
            }
            else {
              uint64_t v40 = v31;
            }
            if (v38 == 2) {
              ++v30;
            }
            else {
              uint64_t v29 = v39;
            }
            if (v38 != 2) {
              uint64_t v31 = v40;
            }
          }
          uint64_t v27 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
        }
        while (v27);

        uint64_t v6 = v51;
        if (v31)
        {
          id v11 = v52;
          v2 = v53;
          id v24 = v28;
          if (!(v30 | v29))
          {
            uint64_t v41 = 1;
LABEL_63:

            if ([v24 count])
            {
              v59[0] = MEMORY[0x1E4F143A8];
              v59[1] = 3221225472;
              v59[2] = __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke_2;
              v59[3] = &unk_1E5623A38;
              uint64_t v50 = v30 + v31 + v29;
              v59[4] = v2;
              id v60 = v24;
              uint64_t v61 = v6;
              id v12 = v24;
              -[CKMediaObjectDeleteAssetActionPerformer _presentDeleteConfirmationDialogForTypedCount:completionHandler:](v2, "_presentDeleteConfirmationDialogForTypedCount:completionHandler:", v50, v41, v59);
              v46 = v60;
LABEL_65:

LABEL_66:
              goto LABEL_70;
            }
            uint64_t v47 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"CKMediaObjectDeleteAssetActionPerformer: Selected items are not media objects");

LABEL_68:
            id v11 = (id)v47;
            goto LABEL_69;
          }
        }
        else
        {
          id v11 = v52;
          v2 = v53;
          id v24 = v28;
        }
      }
      else
      {

        uint64_t v31 = 0;
        uint64_t v30 = 0;
        uint64_t v29 = 0;
      }
      if (v29) {
        BOOL v48 = 0;
      }
      else {
        BOOL v48 = v31 == 0;
      }
      if (!v48 || v30 == 0) {
        uint64_t v41 = 0;
      }
      else {
        uint64_t v41 = 2;
      }
      goto LABEL_63;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"CKMediaObjectDeleteAssetActionPerformer: No items selected for delete action");
    id v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_69:
    [(PXActionPerformer *)v2 completeUserInteractionTaskWithSuccess:0 error:v11];
    goto LABEL_70;
  }
  v20 = [(CKMediaObjectAssetActionPerformer *)v2 chatItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v11 = 0;
    goto LABEL_69;
  }
  id v11 = [(CKMediaObjectAssetActionPerformer *)v2 chatItem];
  v22 = [(CKMediaObjectAssetActionPerformer *)v2 chatItem];
  BOOL v23 = _ChatItemCanBeCancelled(v22);

  if (!v23)
  {
    v42 = [v11 mediaObject];

    if (v42)
    {
      v43 = [v11 mediaObject];
      int v44 = [v43 mediaType];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke_4;
      v55[3] = &unk_1E5623A38;
      if (v44 == 3) {
        uint64_t v45 = 1;
      }
      else {
        uint64_t v45 = 2 * (v44 == 2);
      }
      v55[4] = v2;
      v56 = v43;
      uint64_t v57 = v6;
      id v12 = v43;
      -[CKMediaObjectDeleteAssetActionPerformer _presentDeleteConfirmationDialogForTypedCount:completionHandler:](v2, "_presentDeleteConfirmationDialogForTypedCount:completionHandler:", 1, v45, v55);
      v46 = v56;
      goto LABEL_65;
    }
    uint64_t v47 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"CKMediaObjectDeleteAssetActionPerformer: attachment part item doesn't have a media object");
    goto LABEL_68;
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke_3;
  v58[3] = &unk_1E5620C40;
  v58[4] = v2;
  [(CKMediaObjectDeleteAssetActionPerformer *)v2 _performRetractScheduledChatItem:v11 completion:v58];
LABEL_70:
}

uint64_t __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
}

uint64_t __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) chatActionHelper];
    [v3 deleteMediaObjectAttachmentGUIDs:*(void *)(a1 + 40) originalStackCount:*(void *)(a1 + 48)];
  }
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 completeUserInteractionTaskWithSuccess:1 error:0];
}

uint64_t __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
}

uint64_t __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1, int a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) chatActionHelper];
    uint64_t v4 = [*(id *)(a1 + 40) transferGUID];
    v7[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v3 deleteMediaObjectAttachmentGUIDs:v5 originalStackCount:*(void *)(a1 + 48)];
  }
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
}

- (void)_presentDeleteConfirmationDialogForTypedCount:(id)a3 completionHandler:(id)a4
{
  unint64_t var0 = a3.var0;
  id v6 = a4;
  if (v6)
  {
    if (var0)
    {
      uint64_t v7 = PXLocalizationKeyForMediaType();
      char v8 = NSString;
      v9 = CKFrameworkBundle();
      uint64_t v31 = (void *)v7;
      v10 = [v9 localizedStringForKey:v7 value:&stru_1EDE4CA38 table:@"ChatKit"];
      id v11 = objc_msgSend(v8, "localizedStringWithFormat:", v10, var0);

      id v12 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v13 = [v12 userInterfaceLayoutDirection];

      if (v13 == 1) {
        uint64_t v14 = @"\u200F";
      }
      else {
        uint64_t v14 = @"\u200E";
      }
      uint64_t v15 = [(__CFString *)v14 stringByAppendingString:v11];

      uint64_t v16 = CKFrameworkBundle();
      v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];

      if (CKIsRunningInMacCatalyst())
      {
        v20 = PXLocalizationKeyForMediaType();
        v21 = CKFrameworkBundle();
        v22 = [v21 localizedStringForKey:v20 value:&stru_1EDE4CA38 table:@"ChatKit"];

        BOOL v23 = CKFrameworkBundle();
        id v24 = [v23 localizedStringForKey:@"DELETE_WARNING" value:&stru_1EDE4CA38 table:@"ChatKit"];

        v25 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v22 message:v24 preferredStyle:1];
      }
      else
      {
        v25 = [MEMORY[0x1E4F42728] alertControllerWithTitle:0 message:0 preferredStyle:0];
      }
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __107__CKMediaObjectDeleteAssetActionPerformer__presentDeleteConfirmationDialogForTypedCount_completionHandler___block_invoke;
      v34[3] = &unk_1E5621380;
      id v26 = v6;
      id v35 = v26;
      uint64_t v27 = +[CKAlertAction actionWithTitle:v15 style:2 handler:v34];
      [v25 addAction:v27];

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __107__CKMediaObjectDeleteAssetActionPerformer__presentDeleteConfirmationDialogForTypedCount_completionHandler___block_invoke_2;
      v32[3] = &unk_1E5621380;
      id v28 = v26;
      id v33 = v28;
      uint64_t v29 = +[CKAlertAction actionWithTitle:v17 style:1 handler:v32];
      [v25 addAction:v29];

      if (![(PXActionPerformer *)self presentViewController:v25])
      {
        uint64_t v30 = IMLogHandleForCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[CKMediaObjectDeleteAssetActionPerformer _presentDeleteConfirmationDialogForTypedCount:completionHandler:]((uint64_t)v25, v30);
        }

        (*((void (**)(id, void))v28 + 2))(v28, 0);
      }
    }
    else
    {
      v19 = IMLogHandleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CKMediaObjectDeleteAssetActionPerformer _presentDeleteConfirmationDialogForTypedCount:completionHandler:](v19);
      }

      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
  else
  {
    v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectDeleteAssetActionPerformer _presentDeleteConfirmationDialogForTypedCount:completionHandler:](v18);
    }
  }
}

uint64_t __107__CKMediaObjectDeleteAssetActionPerformer__presentDeleteConfirmationDialogForTypedCount_completionHandler___block_invoke(uint64_t a1)
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t __107__CKMediaObjectDeleteAssetActionPerformer__presentDeleteConfirmationDialogForTypedCount_completionHandler___block_invoke_2(uint64_t a1)
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

- (void)_performRetractScheduledChatItem:(id)a3 completion:(id)a4
{
  char v8 = (void (**)(void))a4;
  id v6 = a3;
  uint64_t v7 = [(CKMediaObjectAssetActionPerformer *)self chatActionHelper];
  [v7 retractScheduledChatItem:v6];

  v8[2]();
}

- (void)_performRetractScheduledChatItems:(id)a3 fromAggregateChatItem:(id)a4 completion:(id)a5
{
  id v11 = (void (**)(void))a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(CKMediaObjectAssetActionPerformer *)self chatActionHelper];
  [v10 retractScheduledChatItems:v9 fromAggregateChatItem:v8];

  v11[2]();
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  id v4 = a4;
  v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isScheduledMessagesEnabled];

  if (v6
    && ([v4 chatItem],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        BOOL CanBeCancelled = _ChatItemCanBeCancelled(v7),
        v7,
        CanBeCancelled))
  {
    id v9 = CKFrameworkBundle();
    v10 = v9;
    id v11 = @"CANCEL";
  }
  else
  {
    id v9 = CKFrameworkBundle();
    v10 = v9;
    id v11 = @"DELETE";
  }
  id v12 = [v9 localizedStringForKey:v11 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v12;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"trash";
}

+ (id)createPreviewActionWithActionManager:(id)a3 handler:(id)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CKMediaObjectDeleteAssetActionPerformer;
  id v4 = objc_msgSendSuper2(&v6, sel_createPreviewActionWithActionManager_handler_, a3, a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setAttributes:2];
  }

  return v4;
}

- (void)_presentDeleteConfirmationDialogForTypedCount:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "No completion handler for delete confirmation", v1, 2u);
}

- (void)_presentDeleteConfirmationDialogForTypedCount:(os_log_t)log completionHandler:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "No items for delete confirmation", v1, 2u);
}

- (void)_presentDeleteConfirmationDialogForTypedCount:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Failed to present alert (%@) for delete. Cancelling deletion", (uint8_t *)&v2, 0xCu);
}

@end