@interface MFMarkReadMutedThreadMessageRule
- (BOOL)shouldIncludeInNewMessagesSet;
- (void)performOperationOnMessages:(id)a3 withMessageChangeManager:(id)a4;
@end

@implementation MFMarkReadMutedThreadMessageRule

- (BOOL)shouldIncludeInNewMessagesSet
{
  return 1;
}

- (void)performOperationOnMessages:(id)a3 withMessageChangeManager:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  v6 = +[ECMessageFlagChange setRead];
  id v7 = [v5 applyFlagChange:v6 toMessages:v8];
}

@end