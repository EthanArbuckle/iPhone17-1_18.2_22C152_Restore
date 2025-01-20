@interface CalDAVUpdateFreeBusySetTaskGroup
- (CalDAVUpdateFreeBusySetTaskGroup)initWithAccountInfoProvider:(id)a3 inboxURL:(id)a4 urlToAdd:(id)a5 suffixToFilterOut:(id)a6 taskManager:(id)a7;
- (CoreDAVPropFindTask)fetchTask;
- (NSString)suffixToFilterOut;
- (NSURL)inboxURL;
- (NSURL)urlToAdd;
- (int)state;
- (void)_finishWithError:(id)a3 state:(int)a4;
- (void)_startFetchFreeBusySet;
- (void)_startPropPatchWithURLs:(id)a3;
- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5;
- (void)propPatchTask:(id)a3 parsedResponses:(id)a4 error:(id)a5;
- (void)setFetchTask:(id)a3;
- (void)setInboxURL:(id)a3;
- (void)setState:(int)a3;
- (void)setSuffixToFilterOut:(id)a3;
- (void)setUrlToAdd:(id)a3;
- (void)taskGroupWillCancelWithError:(id)a3;
@end

@implementation CalDAVUpdateFreeBusySetTaskGroup

- (CalDAVUpdateFreeBusySetTaskGroup)initWithAccountInfoProvider:(id)a3 inboxURL:(id)a4 urlToAdd:(id)a5 suffixToFilterOut:(id)a6 taskManager:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CalDAVUpdateFreeBusySetTaskGroup;
  v15 = [(CoreDAVTaskGroup *)&v18 initWithAccountInfoProvider:a3 taskManager:a7];
  v16 = v15;
  if (v15)
  {
    [(CalDAVUpdateFreeBusySetTaskGroup *)v15 setState:0];
    [(CalDAVUpdateFreeBusySetTaskGroup *)v16 setInboxURL:v12];
    [(CalDAVUpdateFreeBusySetTaskGroup *)v16 setUrlToAdd:v13];
    [(CalDAVUpdateFreeBusySetTaskGroup *)v16 setSuffixToFilterOut:v14];
    [(CalDAVUpdateFreeBusySetTaskGroup *)v16 setFetchTask:0];
  }

  return v16;
}

- (void)_startFetchFreeBusySet
{
  id v3 = objc_alloc(MEMORY[0x263F34B00]);
  id v15 = (id)[v3 initWithNameSpace:*MEMORY[0x263F34CD8] name:*MEMORY[0x263F34D00] parseClass:objc_opt_class()];
  v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", v15, 0);
  id v5 = objc_alloc(MEMORY[0x263F34B80]);
  v6 = [(CalDAVUpdateFreeBusySetTaskGroup *)self inboxURL];
  v7 = (void *)[v5 initWithPropertiesToFind:v4 atURL:v6 withDepth:2];

  [(CalDAVUpdateFreeBusySetTaskGroup *)self setFetchTask:v7];
  v8 = [(CoreDAVTaskGroup *)self outstandingTasks];
  v9 = [(CalDAVUpdateFreeBusySetTaskGroup *)self fetchTask];
  [v8 addObject:v9];

  v10 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  v11 = [(CalDAVUpdateFreeBusySetTaskGroup *)self fetchTask];
  [v11 setAccountInfoProvider:v10];

  id v12 = [(CalDAVUpdateFreeBusySetTaskGroup *)self fetchTask];
  [v12 setDelegate:self];

  id v13 = [(CoreDAVTaskGroup *)self taskManager];
  id v14 = [(CalDAVUpdateFreeBusySetTaskGroup *)self fetchTask];
  [v13 submitQueuedCoreDAVTask:v14];

  [(CalDAVUpdateFreeBusySetTaskGroup *)self setState:1];
}

- (void)_startPropPatchWithURLs:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F34AF8]);
  v6 = (void *)[v5 initWithNameSpace:*MEMORY[0x263F34CD8] andName:*MEMORY[0x263F34D00]];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
        id v13 = objc_alloc_init(MEMORY[0x263F34AF0]);
        id v14 = objc_msgSend(v12, "CDVRawPath", (void)v23);
        [v13 setPayloadAsString:v14];

        id v15 = [v6 extraChildItems];
        [v15 addObject:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  id v16 = objc_alloc(MEMORY[0x263F34B88]);
  v17 = [MEMORY[0x263EFFA08] setWithObject:v6];
  objc_super v18 = [(CalDAVUpdateFreeBusySetTaskGroup *)self inboxURL];
  v19 = (void *)[v16 initWithPropertiesToSet:v17 andRemove:0 atURL:v18];

  v20 = [(CoreDAVTaskGroup *)self outstandingTasks];
  [v20 addObject:v19];

  v21 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [v19 setAccountInfoProvider:v21];

  [v19 setDelegate:self];
  v22 = [(CoreDAVTaskGroup *)self taskManager];
  [v22 submitQueuedCoreDAVTask:v19];

  [(CalDAVUpdateFreeBusySetTaskGroup *)self setState:2];
}

- (void)_finishWithError:(id)a3 state:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  [(CalDAVUpdateFreeBusySetTaskGroup *)self setState:v4];
  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v6 delegateCallbackBlock:0];
}

- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v6 = a5;
  id v7 = [(CoreDAVTaskGroup *)self outstandingTasks];
  uint64_t v8 = [(CalDAVUpdateFreeBusySetTaskGroup *)self fetchTask];
  [v7 removeObject:v8];

  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v9 = [v6 domain];
  if (([v9 isEqualToString:*MEMORY[0x263F34A48]] & 1) == 0)
  {

    goto LABEL_8;
  }
  uint64_t v10 = [v6 code];

  if (v10 != 2)
  {
LABEL_8:
    [(CalDAVUpdateFreeBusySetTaskGroup *)self _finishWithError:v6 state:4];
    goto LABEL_17;
  }
LABEL_4:
  uint64_t v11 = [(CalDAVUpdateFreeBusySetTaskGroup *)self fetchTask];
  id v12 = [v11 successfulValueForNameSpace:*MEMORY[0x263F34CD8] elementName:*MEMORY[0x263F34D00]];

  if (v12)
  {
    id v13 = [v12 hrefsAsFullURLs];
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [MEMORY[0x263EFFA08] set];
    }
    id v16 = v15;

    v17 = [(CalDAVUpdateFreeBusySetTaskGroup *)self suffixToFilterOut];
    uint64_t v18 = [v17 length];

    if (v18)
    {
      v19 = [(CalDAVUpdateFreeBusySetTaskGroup *)self suffixToFilterOut];
      v20 = [v19 CDVStringByAppendingSlashIfNeeded];

      v21 = [(CalDAVUpdateFreeBusySetTaskGroup *)self suffixToFilterOut];
      v22 = [v21 CDVStringByRemovingTerminatingSlashIfNeeded];

      uint64_t v29 = MEMORY[0x263EF8330];
      uint64_t v30 = 3221225472;
      v31 = __71__CalDAVUpdateFreeBusySetTaskGroup_propFindTask_parsedResponses_error___block_invoke;
      v32 = &unk_2641EBF38;
      id v33 = v20;
      id v34 = v22;
      id v23 = v22;
      id v24 = v20;
      uint64_t v25 = [v16 objectsPassingTest:&v29];

      id v16 = (void *)v25;
    }
    long long v26 = [(CalDAVUpdateFreeBusySetTaskGroup *)self urlToAdd];

    if (v26)
    {
      v27 = [(CalDAVUpdateFreeBusySetTaskGroup *)self urlToAdd];
      uint64_t v28 = [v16 setByAddingObject:v27];

      id v16 = (void *)v28;
    }
    [(CalDAVUpdateFreeBusySetTaskGroup *)self _startPropPatchWithURLs:v16];
  }
  else
  {
    [(CalDAVUpdateFreeBusySetTaskGroup *)self _finishWithError:0 state:4];
  }

LABEL_17:
}

uint64_t __71__CalDAVUpdateFreeBusySetTaskGroup_propFindTask_parsedResponses_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 absoluteString];
  if ([v3 hasSuffix:*(void *)(a1 + 32)]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [v3 hasSuffix:*(void *)(a1 + 40)] ^ 1;
  }

  return v4;
}

- (void)propPatchTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v9 = a5;
  id v7 = a3;
  uint64_t v8 = [(CoreDAVTaskGroup *)self outstandingTasks];
  [v8 removeObject:v7];

  -[CalDAVUpdateFreeBusySetTaskGroup _finishWithError:state:](self, "_finishWithError:state:");
}

- (void)taskGroupWillCancelWithError:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSURL)inboxURL
{
  return self->_inboxURL;
}

- (void)setInboxURL:(id)a3
{
}

- (NSURL)urlToAdd
{
  return self->_urlToAdd;
}

- (void)setUrlToAdd:(id)a3
{
}

- (NSString)suffixToFilterOut
{
  return self->_suffixToFilterOut;
}

- (void)setSuffixToFilterOut:(id)a3
{
}

- (CoreDAVPropFindTask)fetchTask
{
  return self->_fetchTask;
}

- (void)setFetchTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchTask, 0);
  objc_storeStrong((id *)&self->_suffixToFilterOut, 0);
  objc_storeStrong((id *)&self->_urlToAdd, 0);
  objc_storeStrong((id *)&self->_inboxURL, 0);
}

@end