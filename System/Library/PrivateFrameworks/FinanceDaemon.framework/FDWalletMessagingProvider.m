@interface FDWalletMessagingProvider
- (FDWalletMessagingProvider)init;
- (_TtC13FinanceDaemon23WalletMessagingProvider)wrappedProvider;
- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4;
- (void)applicationMessageSink:(id)a3 removedMessageWithRegistration:(id)a4;
- (void)applicationMessageSink:(id)a3 tappedMessageWithRegistration:(id)a4;
- (void)connectApplicationMessageSink:(id)a3;
- (void)init;
- (void)processMessagesWithCompletionHandler:(id)a3;
- (void)setWrappedProvider:(id)a3;
@end

@implementation FDWalletMessagingProvider

- (FDWalletMessagingProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)FDWalletMessagingProvider;
  v2 = [(FDWalletMessagingProvider *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[WalletMessagingProvider makeProvider];
    wrappedProvider = v2->_wrappedProvider;
    v2->_wrappedProvider = (_TtC13FinanceDaemon23WalletMessagingProvider *)v3;

    if (!v2->_wrappedProvider)
    {
      v5 = os_log_create("com.apple.FinanceKit", "Notifications");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[FDWalletMessagingProvider init](v5);
      }
    }
  }
  return v2;
}

- (void)processMessagesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  wrappedProvider = self->_wrappedProvider;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__FDWalletMessagingProvider_processMessagesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A71AA0;
  id v8 = v4;
  id v6 = v4;
  [(WalletMessagingProvider *)wrappedProvider processMessagesWithCompletionHandler:v7];
}

uint64_t __66__FDWalletMessagingProvider_processMessagesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4
{
  return [(WalletMessagingProvider *)self->_wrappedProvider applicationMessageSink:a3 createContentForMessageWithRegistration:a4];
}

- (void)applicationMessageSink:(id)a3 removedMessageWithRegistration:(id)a4
{
}

- (void)applicationMessageSink:(id)a3 tappedMessageWithRegistration:(id)a4
{
}

- (void)connectApplicationMessageSink:(id)a3
{
}

- (_TtC13FinanceDaemon23WalletMessagingProvider)wrappedProvider
{
  return self->_wrappedProvider;
}

- (void)setWrappedProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7231000, log, OS_LOG_TYPE_ERROR, "Error initializing WalletMessagingProvider", v1, 2u);
}

@end