@interface WFReminderContentItemChangeTransaction
+ (void)addImageFiles:(id)a3 toAttachmentContext:(id)a4;
- (REMReminderChangeItem)mutableReminder;
- (REMSaveRequest)saveRequest;
- (REMStore)store;
- (WFReminderContentItemChangeTransaction)initWithContentItem:(id)a3;
- (void)addImageFiles:(id)a3;
- (void)addSubtasks:(id)a3;
- (void)addTags:(id)a3;
- (void)removeAllImageAttachments;
- (void)removeAllSubtasks;
- (void)removeSubtasks:(id)a3;
- (void)saveWithCompletionHandler:(id)a3 isNew:(BOOL)a4;
- (void)setSaveRequest:(id)a3;
- (void)updateImageFiles:(id)a3;
- (void)updateList:(id)a3;
- (void)updateSubtasks:(id)a3;
- (void)updateTags:(id)a3;
@end

@implementation WFReminderContentItemChangeTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveRequest, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_mutableReminder, 0);
}

- (void)setSaveRequest:(id)a3
{
}

- (REMSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (REMStore)store
{
  return self->_store;
}

- (REMReminderChangeItem)mutableReminder
{
  return self->_mutableReminder;
}

- (void)addTags:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        v10 = [(WFReminderContentItemChangeTransaction *)self mutableReminder];
        v11 = [v10 hashtagContext];
        id v12 = (id)[v11 addHashtagWithType:0 name:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)updateTags:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WFContentItemChangeTransaction *)self mode];
  int v6 = [v5 isEqualToString:@"Append"];

  if (v6) {
    goto LABEL_14;
  }
  uint64_t v7 = [(WFContentItemChangeTransaction *)self mode];
  int v8 = [v7 isEqualToString:@"Remove"];

  if (!v8)
  {
    v21 = [(WFContentItemChangeTransaction *)self mode];
    int v22 = [v21 isEqualToString:@"RemoveAll"];

    v23 = [(WFReminderContentItemChangeTransaction *)self mutableReminder];
    v24 = [v23 hashtagContext];
    [v24 removeAllHashtags];

    if (v22) {
      goto LABEL_15;
    }
LABEL_14:
    [(WFReminderContentItemChangeTransaction *)self addTags:v4];
    goto LABEL_15;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [(WFReminderContentItemChangeTransaction *)self mutableReminder];
  v10 = [v9 hashtagContext];
  v11 = [v10 hashtags];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v17 = [v16 name];
        int v18 = [v4 containsObject:v17];

        if (v18)
        {
          v19 = [(WFReminderContentItemChangeTransaction *)self mutableReminder];
          v20 = [v19 hashtagContext];
          [v20 removeHashtag:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

LABEL_15:
}

- (void)removeAllImageAttachments
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [(WFReminderContentItemChangeTransaction *)self mutableReminder];
  v3 = [v2 attachmentContext];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = objc_msgSend(v3, "imageAttachments", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 removeAttachment:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addImageFiles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v7 = [(WFReminderContentItemChangeTransaction *)self mutableReminder];
  uint64_t v6 = [v7 attachmentContext];
  [v5 addImageFiles:v4 toAttachmentContext:v6];
}

- (void)updateImageFiles:(id)a3
{
  id v8 = a3;
  id v4 = [(WFContentItemChangeTransaction *)self mode];
  char v5 = [v4 isEqualToString:@"Append"];

  if ((v5 & 1) != 0
    || ([(WFContentItemChangeTransaction *)self mode],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:@"RemoveAll"],
        v6,
        [(WFReminderContentItemChangeTransaction *)self removeAllImageAttachments],
        (v7 & 1) == 0))
  {
    [(WFReminderContentItemChangeTransaction *)self addImageFiles:v8];
  }
}

- (void)saveWithCompletionHandler:(id)a3 isNew:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = [(WFReminderContentItemChangeTransaction *)self saveRequest];
  char v7 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__WFReminderContentItemChangeTransaction_saveWithCompletionHandler_isNew___block_invoke;
  v9[3] = &unk_264287990;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v6 saveWithQueue:v7 completion:v9];
}

void __74__WFReminderContentItemChangeTransaction_saveWithCompletionHandler_isNew___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) store];
    uint64_t v6 = [*(id *)(a1 + 32) mutableReminder];
    char v7 = [v6 objectID];
    id v11 = 0;
    id v8 = [v5 fetchReminderWithObjectID:v7 error:&v11];
    id v4 = v11;

    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = +[WFContentItem itemWithObject:v8];
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
  }
}

- (void)removeAllSubtasks
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = [(WFReminderContentItemChangeTransaction *)self store];
  id v4 = [(WFReminderContentItemChangeTransaction *)self mutableReminder];
  id v5 = [v4 objectID];
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  char v7 = [v3 fetchRemindersWithParentReminderIDs:v6 error:0];

  [(WFReminderContentItemChangeTransaction *)self removeSubtasks:v7];
}

- (void)removeSubtasks:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        id v10 = [(WFReminderContentItemChangeTransaction *)self saveRequest];
        id v11 = [v10 updateReminder:v9];

        [v11 setParentReminderID:0];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)addSubtasks:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        id v10 = [(WFReminderContentItemChangeTransaction *)self saveRequest];
        id v11 = [v10 updateReminder:v9];

        long long v12 = [(WFReminderContentItemChangeTransaction *)self mutableReminder];
        long long v13 = [v12 listChangeItem];
        [v13 addReminderChangeItem:v11];

        long long v14 = [(WFReminderContentItemChangeTransaction *)self mutableReminder];
        long long v15 = [v14 objectID];
        [v11 setParentReminderID:v15];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)updateSubtasks:(id)a3
{
  id v10 = a3;
  id v4 = [(WFContentItemChangeTransaction *)self mode];
  int v5 = [v4 isEqualToString:@"Append"];

  if (v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [(WFContentItemChangeTransaction *)self mode];
  int v7 = [v6 isEqualToString:@"Remove"];

  if (v7)
  {
    [(WFReminderContentItemChangeTransaction *)self removeSubtasks:v10];
    goto LABEL_6;
  }
  uint64_t v8 = [(WFContentItemChangeTransaction *)self mode];
  int v9 = [v8 isEqualToString:@"RemoveAll"];

  [(WFReminderContentItemChangeTransaction *)self removeAllSubtasks];
  if ((v9 & 1) == 0) {
LABEL_5:
  }
    [(WFReminderContentItemChangeTransaction *)self addSubtasks:v10];
LABEL_6:
}

- (void)updateList:(id)a3
{
  id v4 = a3;
  int v5 = [(WFReminderContentItemChangeTransaction *)self mutableReminder];
  [v5 removeFromList];

  uint64_t v6 = [(WFReminderContentItemChangeTransaction *)self saveRequest];
  id v8 = [v6 updateList:v4];

  int v7 = [(WFReminderContentItemChangeTransaction *)self mutableReminder];
  [v8 addReminderChangeItem:v7];
}

- (WFReminderContentItemChangeTransaction)initWithContentItem:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFReminderContentItemChangeTransaction;
  int v5 = [(WFContentItemChangeTransaction *)&v18 initWithContentItem:v4];
  if (v5)
  {
    uint64_t v6 = WFGetWorkflowReminderStore();
    store = v5->_store;
    v5->_store = (REMStore *)v6;

    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2050000000;
    id v8 = (void *)getREMSaveRequestClass_softClass;
    uint64_t v23 = getREMSaveRequestClass_softClass;
    if (!getREMSaveRequestClass_softClass)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __getREMSaveRequestClass_block_invoke;
      v19[3] = &unk_26428AC60;
      v19[4] = &v20;
      __getREMSaveRequestClass_block_invoke((uint64_t)v19);
      id v8 = (void *)v21[3];
    }
    int v9 = v8;
    _Block_object_dispose(&v20, 8);
    uint64_t v10 = [[v9 alloc] initWithStore:v5->_store];
    saveRequest = v5->_saveRequest;
    v5->_saveRequest = (REMSaveRequest *)v10;

    long long v12 = v5->_saveRequest;
    long long v13 = [v4 reminder];
    uint64_t v14 = [(REMSaveRequest *)v12 updateReminder:v13];
    mutableReminder = v5->_mutableReminder;
    v5->_mutableReminder = (REMReminderChangeItem *)v14;

    long long v16 = v5;
  }

  return v5;
}

+ (void)addImageFiles:(id)a3 toAttachmentContext:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__WFReminderContentItemChangeTransaction_addImageFiles_toAttachmentContext___block_invoke;
  v7[3] = &unk_2642879B8;
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateObjectsUsingBlock:v7];
}

void __76__WFReminderContentItemChangeTransaction_addImageFiles_toAttachmentContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 fileURL];
  double v5 = WFImageSizeFromFile(v3, 0);
  double v7 = v6;

  id v8 = *(void **)(a1 + 32);
  id v12 = 0;
  int v9 = [v8 addImageAttachmentWithURL:v4 width:(unint64_t)v5 height:(unint64_t)v7 error:&v12];
  id v10 = v12;
  if (!v9)
  {
    id v11 = getWFActionsLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "+[WFReminderContentItemChangeTransaction addImageFiles:toAttachmentContext:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl(&dword_216505000, v11, OS_LOG_TYPE_ERROR, "%s Adding image attachment failed with error %@", buf, 0x16u);
    }
  }
}

@end