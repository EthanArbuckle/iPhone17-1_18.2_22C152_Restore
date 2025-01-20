@interface MFMutedThreadMessageRule
- (BOOL)canExecuteRuleOnMessage:(id)a3;
- (BOOL)shouldIncludeInNewMessagesSet;
- (MFLibraryStore)store;
- (void)performOperationOnMessages:(id)a3 withMessageChangeManager:(id)a4;
- (void)setStore:(id)a3;
@end

@implementation MFMutedThreadMessageRule

- (BOOL)canExecuteRuleOnMessage:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 conversationFlags];
  BOOL v5 = (((unint64_t)[v3 messageFlags] & 0x1000000) == 0) & (v4 >> 2);

  return v5;
}

- (BOOL)shouldIncludeInNewMessagesSet
{
}

- (void)performOperationOnMessages:(id)a3 withMessageChangeManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(MFMutedThreadMessageRule *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFMutedThreadMessageRule performOperationOnMessages:withMessageChangeManager:]", "MFMutedThreadMessageRule.m", 33, "0");
}

- (MFLibraryStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end