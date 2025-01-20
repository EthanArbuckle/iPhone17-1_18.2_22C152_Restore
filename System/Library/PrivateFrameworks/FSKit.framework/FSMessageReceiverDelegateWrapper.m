@interface FSMessageReceiverDelegateWrapper
- (BOOL)hasCompleted;
- (BOOL)hasStarted;
- (FSMessageReceiverDelegateWrapper)initWithDelegate:(id)a3 Locale:(id)a4 preferredLanguages:(id)a5;
- (FSTaskMessageOperations)delegate;
- (NSArray)preferredLanguages;
- (NSError)completedError;
- (NSLocale)locale;
- (void)completed:(id)a3 reply:(id)a4;
- (void)completed:(id)a3 replyHandler:(id)a4;
- (void)didStart;
- (void)getLocalizationSetup:(id)a3;
- (void)logMessage:(id)a3;
- (void)prompt:(id)a3 replyHandler:(id)a4;
- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4;
- (void)setCompletedError:(id)a3;
@end

@implementation FSMessageReceiverDelegateWrapper

- (FSMessageReceiverDelegateWrapper)initWithDelegate:(id)a3 Locale:(id)a4 preferredLanguages:(id)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)FSMessageReceiverDelegateWrapper;
  v12 = [(FSMessageReceiverDelegateWrapper *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_delegate, a3);
    if (v10)
    {
      v14 = (NSLocale *)v10;
    }
    else
    {
      v14 = [MEMORY[0x263EFF960] currentLocale];
    }
    locale = v13->_locale;
    v13->_locale = v14;

    if (v11 && [v11 count])
    {
      v16 = (NSArray *)v11;
      preferredLanguages = v13->_preferredLanguages;
      v13->_preferredLanguages = v16;
    }
    else
    {
      preferredLanguages = [(NSLocale *)v13->_locale languageCode];
      v23[0] = preferredLanguages;
      uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
      v19 = v13->_preferredLanguages;
      v13->_preferredLanguages = (NSArray *)v18;
    }
    *(_WORD *)&v13->_hasCompleted = 0;
    completedError = v13->_completedError;
    v13->_completedError = 0;
  }
  return v13;
}

- (void)getLocalizationSetup:(id)a3
{
}

- (void)completed:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__FSMessageReceiverDelegateWrapper_completed_reply___block_invoke;
  v8[3] = &unk_26530B0E8;
  id v9 = v6;
  id v7 = v6;
  [(FSMessageReceiverDelegateWrapper *)self completed:a3 replyHandler:v8];
}

uint64_t __52__FSMessageReceiverDelegateWrapper_completed_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)completed:(id)a3 replyHandler:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  BOOL hasCompleted = v8->_hasCompleted;
  if (!v8->_hasCompleted) {
    v8->_BOOL hasCompleted = 1;
  }
  if (!v8->_hasStarted)
  {
    objc_storeStrong((id *)&v8->_completedError, a3);
    objc_sync_exit(v8);

    if (!hasCompleted) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  objc_sync_exit(v8);

  if (hasCompleted)
  {
LABEL_8:
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    [(FSTaskMessageOperations *)v8->_delegate completed:v10 replyHandler:v7];
  }
  else if (objc_opt_respondsToSelector())
  {
    [(FSTaskMessageOperations *)v8->_delegate completed:v10 reply:v7];
  }
LABEL_9:
}

- (void)didStart
{
  v2 = self;
  objc_sync_enter(v2);
  v2->_hasStarted = 1;
  BOOL hasCompleted = v2->_hasCompleted;
  objc_sync_exit(v2);

  if (hasCompleted)
  {
    char v4 = objc_opt_respondsToSelector();
    delegate = v2->_delegate;
    if (v4)
    {
      completedError = v2->_completedError;
      [(FSTaskMessageOperations *)delegate completed:completedError reply:&__block_literal_global];
    }
    else if (objc_opt_respondsToSelector())
    {
      id v7 = v2->_delegate;
      v8 = v2->_completedError;
      [(FSTaskMessageOperations *)v7 completed:v8 replyHandler:&__block_literal_global_7];
    }
  }
}

- (void)logMessage:(id)a3
{
}

- (void)prompt:(id)a3 replyHandler:(id)a4
{
}

- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4
{
}

- (FSTaskMessageOperations)delegate
{
  return (FSTaskMessageOperations *)objc_getProperty(self, a2, 16, 1);
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)preferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)hasCompleted
{
  return self->_hasCompleted;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (NSError)completedError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCompletedError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedError, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end