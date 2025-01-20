@interface MFBlockedSenderMessageRule
+ (id)log;
- (BOOL)canExecuteRuleOnMessage:(id)a3;
- (BOOL)shouldIncludeInNewMessagesSet;
- (MFLibraryStore)store;
- (void)performOperationOnMessages:(id)a3 withMessageChangeManager:(id)a4;
- (void)setStore:(id)a3;
@end

@implementation MFBlockedSenderMessageRule

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055C14;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BA28 != -1) {
    dispatch_once(&qword_10016BA28, block);
  }
  v2 = (void *)qword_10016BA20;

  return v2;
}

- (BOOL)canExecuteRuleOnMessage:(id)a3
{
  id v3 = a3;
  v4 = +[DaemonAppController sharedController];
  v5 = [v4 blockedSenderManager];
  if ([v5 isMoveToTrashEnabled])
  {
    v6 = +[DaemonAppController sharedController];
    v7 = [v6 blockedSenderManager];
    v8 = [v3 firstSender];
    if ([v7 isEmailAddressBlocked:v8])
    {
      v9 = [v3 mailbox];
      unsigned __int8 v10 = +[EMBlockedSenderManager shouldMoveToTrashForMailboxType:](EMBlockedSenderManager, "shouldMoveToTrashForMailboxType:", [v9 type]);
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)performOperationOnMessages:(id)a3 withMessageChangeManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = objc_msgSend(v5, "ef_groupBy:", &stru_10013B770);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100056048;
  v18 = &unk_10013B750;
  id v9 = v7;
  id v19 = v9;
  id v10 = v6;
  id v20 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:&v15];
  if (objc_msgSend(v9, "count", v15, v16, v17, v18))
  {
    v11 = +[MFBlockedSenderMessageRule log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v9 count];
      *(_DWORD *)buf = 134217984;
      id v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully moved %lu messages from blocked sender to trash", buf, 0xCu);
    }

    v13 = +[ECMessageFlagChange setRead];
    id v14 = [v10 applyFlagChange:v13 toMessages:v9];
  }
}

- (BOOL)shouldIncludeInNewMessagesSet
{
  return 0;
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