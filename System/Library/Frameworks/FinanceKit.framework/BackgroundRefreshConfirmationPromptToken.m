@interface BackgroundRefreshConfirmationPromptToken
- (BackgroundRefreshConfirmationPromptToken)init;
- (BackgroundRefreshConfirmationPromptToken)initWithFullyQualifiedAccountIdentifier:(id)a3 sequenceNumber:(int64_t)a4;
- (FKFullyQualifiedAccountIdentifier)fqaid;
- (int64_t)sequenceNumber;
@end

@implementation BackgroundRefreshConfirmationPromptToken

- (FKFullyQualifiedAccountIdentifier)fqaid
{
  return (FKFullyQualifiedAccountIdentifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR___BackgroundRefreshConfirmationPromptToken_fqaid));
}

- (int64_t)sequenceNumber
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___BackgroundRefreshConfirmationPromptToken_sequenceNumber);
}

- (BackgroundRefreshConfirmationPromptToken)initWithFullyQualifiedAccountIdentifier:(id)a3 sequenceNumber:(int64_t)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BackgroundRefreshConfirmationPromptToken_fqaid) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BackgroundRefreshConfirmationPromptToken_sequenceNumber) = (Class)a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BankConnectMessagesManager.BackgroundRefreshConfirmationPromptToken();
  id v5 = a3;
  return [(BackgroundRefreshConfirmationPromptToken *)&v7 init];
}

- (BackgroundRefreshConfirmationPromptToken)init
{
  result = (BackgroundRefreshConfirmationPromptToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end