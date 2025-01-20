@interface MFNoopMutedThreadMessageRule
- (BOOL)canExecuteRuleOnMessage:(id)a3;
- (BOOL)shouldIncludeInNewMessagesSet;
- (id)messageOperation;
@end

@implementation MFNoopMutedThreadMessageRule

- (BOOL)canExecuteRuleOnMessage:(id)a3
{
  return 0;
}

- (BOOL)shouldIncludeInNewMessagesSet
{
  return 1;
}

- (id)messageOperation
{
  return 0;
}

@end