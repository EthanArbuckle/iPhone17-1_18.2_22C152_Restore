@interface WFCalendarEventContentItemChangeTransaction
- (EKEvent)mutableEvent;
- (EKEventStore)eventStore;
- (WFCalendarEventContentItemChangeTransaction)initWithContentItem:(id)a3 eventStore:(id)a4;
- (void)addAttachments:(id)a3;
- (void)removeAllAttachments;
- (void)saveWithCompletionHandler:(id)a3 isNew:(BOOL)a4;
- (void)updateAttachments:(id)a3;
@end

@implementation WFCalendarEventContentItemChangeTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_mutableEvent, 0);
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (EKEvent)mutableEvent
{
  return self->_mutableEvent;
}

- (void)removeAllAttachments
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(WFCalendarEventContentItemChangeTransaction *)self mutableEvent];
  v4 = [v3 attachments];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        v10 = [(WFCalendarEventContentItemChangeTransaction *)self mutableEvent];
        [v10 removeAttachment:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)addAttachments:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        uint64_t v9 = [(WFCalendarEventContentItemChangeTransaction *)self mutableEvent];
        uint64_t v20 = 0;
        v21 = &v20;
        uint64_t v22 = 0x2050000000;
        v10 = (void *)getEKAttachmentClass_softClass;
        uint64_t v23 = getEKAttachmentClass_softClass;
        if (!getEKAttachmentClass_softClass)
        {
          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 3221225472;
          v19[2] = __getEKAttachmentClass_block_invoke;
          v19[3] = &unk_26428AC60;
          v19[4] = &v20;
          __getEKAttachmentClass_block_invoke((uint64_t)v19);
          v10 = (void *)v21[3];
        }
        long long v11 = v10;
        _Block_object_dispose(&v20, 8);
        id v12 = [v11 alloc];
        long long v13 = [v8 fileURL];
        long long v14 = (void *)[v12 initWithFilepath:v13];
        [v9 addAttachment:v14];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v24 count:16];
    }
    while (v5);
  }
}

- (void)updateAttachments:(id)a3
{
  id v8 = a3;
  id v4 = [(WFContentItemChangeTransaction *)self mode];
  char v5 = [v4 isEqualToString:@"Append"];

  if ((v5 & 1) != 0
    || ([(WFContentItemChangeTransaction *)self mode],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:@"RemoveAll"],
        v6,
        [(WFCalendarEventContentItemChangeTransaction *)self removeAllAttachments],
        (v7 & 1) == 0))
  {
    [(WFCalendarEventContentItemChangeTransaction *)self addAttachments:v8];
  }
}

- (void)saveWithCompletionHandler:(id)a3 isNew:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v5 = (void (**)(id, void *, void))a3;
  uint64_t v6 = [(WFCalendarEventContentItemChangeTransaction *)self eventStore];
  char v7 = [(WFCalendarEventContentItemChangeTransaction *)self mutableEvent];
  id v14 = 0;
  char v8 = [v6 saveEvent:v7 span:0 error:&v14];
  id v9 = v14;

  if (v8)
  {
    uint64_t v10 = [(WFCalendarEventContentItemChangeTransaction *)self mutableEvent];
    long long v11 = [(WFCalendarEventContentItemChangeTransaction *)self eventStore];
    id v12 = +[WFCalendarEventContentItem itemWithEKEvent:v10 fromEventStore:v11];
    v5[2](v5, v12, 0);

    char v5 = (void (**)(id, void *, void))v10;
  }
  else
  {
    long long v13 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v16 = "-[WFCalendarEventContentItemChangeTransaction saveWithCompletionHandler:isNew:]";
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_216505000, v13, OS_LOG_TYPE_ERROR, "%s Failed to save calendar event: %@", buf, 0x16u);
    }

    ((void (**)(id, void *, id))v5)[2](v5, 0, v9);
  }
}

- (WFCalendarEventContentItemChangeTransaction)initWithContentItem:(id)a3 eventStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFCalendarEventContentItemChangeTransaction.m", 21, @"Invalid parameter not satisfying: %@", @"contentItem" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  long long v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFCalendarEventContentItemChangeTransaction.m", 22, @"Invalid parameter not satisfying: %@", @"eventStore" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFCalendarEventContentItemChangeTransaction;
  uint64_t v10 = [(WFContentItemChangeTransaction *)&v17 initWithContentItem:v7];
  if (v10)
  {
    uint64_t v11 = [v7 event];
    mutableEvent = v10->_mutableEvent;
    v10->_mutableEvent = (EKEvent *)v11;

    objc_storeStrong((id *)&v10->_eventStore, a4);
    long long v13 = v10;
  }

  return v10;
}

@end