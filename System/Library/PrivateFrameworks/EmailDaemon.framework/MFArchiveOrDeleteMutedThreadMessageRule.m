@interface MFArchiveOrDeleteMutedThreadMessageRule
- (BOOL)canExecuteRuleOnMessage:(id)a3;
- (BOOL)shouldIncludeInNewMessagesSet;
- (void)performOperationOnMessages:(id)a3 withMessageChangeManager:(id)a4;
@end

@implementation MFArchiveOrDeleteMutedThreadMessageRule

- (BOOL)canExecuteRuleOnMessage:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MFArchiveOrDeleteMutedThreadMessageRule;
  if ([(MFMutedThreadMessageRule *)&v12 canExecuteRuleOnMessage:v4])
  {
    v5 = [v4 mailbox];
    id v6 = [v5 mailboxType];

    v7 = [v4 account];
    unsigned __int8 v8 = [v7 shouldArchiveByDefault];

    if (v6 == (id)3) {
      char v9 = v8;
    }
    else {
      char v9 = 1;
    }
    if (v6 == (id)2) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v9;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)shouldIncludeInNewMessagesSet
{
  return 0;
}

- (void)performOperationOnMessages:(id)a3 withMessageChangeManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  unsigned __int8 v8 = objc_msgSend(v5, "ef_groupBy:", &stru_10013B708);
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_100054D9C;
  v16 = &unk_10013B750;
  id v9 = v7;
  id v17 = v9;
  id v10 = v6;
  id v18 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:&v13];
  if (objc_msgSend(v9, "count", v13, v14, v15, v16))
  {
    v11 = +[ECMessageFlagChange setRead];
    id v12 = [v10 applyFlagChange:v11 toMessages:v9];
  }
}

@end