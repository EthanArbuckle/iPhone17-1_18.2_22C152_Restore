@interface MessageListFetchHelper
+ (OS_os_log)log;
- (BOOL)fetchMailboxesIsUserInitiated:(BOOL)a3;
- (EMFetchController)fetchController;
- (MessageListFetchHelper)initWithFetchController:(id)a3 mailboxes:(id)a4;
- (NSArray)mailboxes;
- (void)setFetchController:(id)a3;
- (void)setMailboxes:(id)a3;
@end

@implementation MessageListFetchHelper

- (void)setMailboxes:(id)a3
{
  id v8 = a3;
  if (!-[NSArray isEqualToArray:](self->_mailboxes, "isEqualToArray:"))
  {
    objc_msgSend(v8, "ef_filter:", &__block_literal_global_4);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    mailboxes = self->_mailboxes;
    self->_mailboxes = v4;
    v6 = v4;

    uint64_t v7 = [(NSArray *)v6 count];
    self->_mailboxesNeedFetching = v7 != 0;
  }
}

- (MessageListFetchHelper)initWithFetchController:(id)a3 mailboxes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MessageListFetchHelper;
  v9 = [(MessageListFetchHelper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(MessageListFetchHelper *)v9 setMailboxes:v8];
    objc_storeStrong((id *)&v10->_fetchController, a3);
  }

  return v10;
}

- (BOOL)fetchMailboxesIsUserInitiated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_BOOL mailboxesNeedFetching = &self->_mailboxesNeedFetching;
  if (!self->_mailboxesNeedFetching && !a3)
  {
    v6 = +[MessageListFetchHelper log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[MessageListFetchHelper fetchMailboxesIsUserInitiated:]((unsigned __int8 *)p_mailboxesNeedFetching, v6);
    }
LABEL_13:
    BOOL v13 = 0;
    goto LABEL_14;
  }
  self->_BOOL mailboxesNeedFetching = 0;
  id v7 = [(MessageListFetchHelper *)self mailboxes];
  uint64_t v8 = [v7 count];

  v6 = +[MessageListFetchHelper log];
  BOOL v9 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (!v8)
  {
    if (v9) {
      -[MessageListFetchHelper fetchMailboxesIsUserInitiated:](v6);
    }
    goto LABEL_13;
  }
  if (v9)
  {
    v15 = [(MessageListFetchHelper *)self fetchController];
    BOOL mailboxesNeedFetching = self->_mailboxesNeedFetching;
    int v17 = 134218496;
    v18 = v15;
    __int16 v19 = 1024;
    BOOL v20 = mailboxesNeedFetching;
    __int16 v21 = 1024;
    BOOL v22 = v3;
    _os_log_debug_impl(&dword_1DDCDB000, v6, OS_LOG_TYPE_DEBUG, "Fetching (%p). _mailboxesNeedFetching: %{BOOL}d, userInitiated: %{BOOL}d", (uint8_t *)&v17, 0x18u);
  }
  v10 = (unsigned int *)MEMORY[0x1E4F5FCE0];
  if (!v3) {
    v10 = (unsigned int *)MEMORY[0x1E4F5FCD8];
  }
  uint64_t v11 = *v10;
  v6 = [(MessageListFetchHelper *)self fetchController];
  objc_super v12 = [(MessageListFetchHelper *)self mailboxes];
  [v6 performFetchOfType:v11 mailboxes:v12];

  BOOL v13 = 1;
LABEL_14:

  return v13;
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (EMFetchController)fetchController
{
  return self->_fetchController;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__MessageListFetchHelper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1) {
    dispatch_once(&log_onceToken_3, block);
  }
  v2 = (void *)log_log_3;
  return (OS_os_log *)v2;
}

uint64_t __39__MessageListFetchHelper_setMailboxes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSmartMailbox] ^ 1;
}

void __29__MessageListFetchHelper_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;
}

- (void)setFetchController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchController, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
}

- (void)fetchMailboxesIsUserInitiated:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1DDCDB000, log, OS_LOG_TYPE_DEBUG, "No mailboxes.", v1, 2u);
}

- (void)fetchMailboxesIsUserInitiated:(unsigned __int8 *)a1 .cold.2(unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = 0;
  _os_log_debug_impl(&dword_1DDCDB000, a2, OS_LOG_TYPE_DEBUG, "Not fetching. _mailboxesNeedFetching: %{BOOL}d, userInitiated: %{BOOL}d", (uint8_t *)v3, 0xEu);
}

@end