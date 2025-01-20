@interface FKBankConnectMessagesManager
- (BOOL)isAccountMessageDismissed:(int64_t)a3 forAccountIdentifier:(id)a4;
- (BOOL)isPassMessageDismissed:(int64_t)a3 forFPANIdentifier:(id)a4;
- (FKBankConnectMessagesManager)init;
- (_TtC10FinanceKit26BankConnectMessagesManager)messagesManager;
- (id)shouldDisplayBackgroundRefreshConfirmationMessageForFQAID:(id)a3;
- (void)dismissBackgroundRefreshConfirmationMessageWithToken:(id)a3;
- (void)resetMessagesForFPANIdentifier:(id)a3;
- (void)setIsDismissed:(BOOL)a3 forAccountMessage:(int64_t)a4 withAccountIdentifier:(id)a5;
- (void)setIsDismissed:(BOOL)a3 forPassMessage:(int64_t)a4 withFPANIdentifier:(id)a5;
- (void)setMessagesManager:(id)a3;
@end

@implementation FKBankConnectMessagesManager

- (FKBankConnectMessagesManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)FKBankConnectMessagesManager;
  v2 = [(FKBankConnectMessagesManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[BankConnectMessagesManager makeManager];
    messagesManager = v2->_messagesManager;
    v2->_messagesManager = (_TtC10FinanceKit26BankConnectMessagesManager *)v3;
  }
  return v2;
}

- (void)resetMessagesForFPANIdentifier:(id)a3
{
}

- (void)setIsDismissed:(BOOL)a3 forPassMessage:(int64_t)a4 withFPANIdentifier:(id)a5
{
}

- (void)setIsDismissed:(BOOL)a3 forAccountMessage:(int64_t)a4 withAccountIdentifier:(id)a5
{
}

- (BOOL)isPassMessageDismissed:(int64_t)a3 forFPANIdentifier:(id)a4
{
  return [(BankConnectMessagesManager *)self->_messagesManager isPassMessageDismissed:a3 forFPANIdentifier:a4];
}

- (BOOL)isAccountMessageDismissed:(int64_t)a3 forAccountIdentifier:(id)a4
{
  return [(BankConnectMessagesManager *)self->_messagesManager isAccountMessageDismissed:a3 forAccountIdentifier:a4];
}

- (id)shouldDisplayBackgroundRefreshConfirmationMessageForFQAID:(id)a3
{
  messagesManager = self->_messagesManager;
  v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  objc_super v6 = [v4 now];
  v7 = [(BankConnectMessagesManager *)messagesManager shouldDisplayBackgroundRefreshConfirmationMessageWithFullyQualifiedAccountIdentifier:v5 now:v6];

  v8 = [FKBackgroundRefreshConfirmationPromptToken alloc];
  v9 = [v7 token];
  v10 = [v9 fqaid];
  v11 = [v7 token];
  v12 = -[FKBackgroundRefreshConfirmationPromptToken initWithFullyQualifiedAccountIdentifier:sequenceNumber:](v8, "initWithFullyQualifiedAccountIdentifier:sequenceNumber:", v10, [v11 sequenceNumber]);

  v13 = -[FKBackgroundRefreshConfirmationPromptDecision initWithShouldShowPrompt:token:]([FKBackgroundRefreshConfirmationPromptDecision alloc], "initWithShouldShowPrompt:token:", [v7 shouldShowPrompt], v12);

  return v13;
}

- (void)dismissBackgroundRefreshConfirmationMessageWithToken:(id)a3
{
  id v4 = a3;
  id v5 = [BackgroundRefreshConfirmationPromptToken alloc];
  objc_super v6 = [v4 fqaid];
  uint64_t v7 = [v4 sequenceNumber];

  v8 = [(BackgroundRefreshConfirmationPromptToken *)v5 initWithFullyQualifiedAccountIdentifier:v6 sequenceNumber:v7];
  [(BankConnectMessagesManager *)self->_messagesManager dismissBackgroundRefreshConfirmationMessageWithToken:v8];
}

- (_TtC10FinanceKit26BankConnectMessagesManager)messagesManager
{
  return self->_messagesManager;
}

- (void)setMessagesManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end