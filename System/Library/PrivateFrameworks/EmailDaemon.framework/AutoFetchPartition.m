@interface AutoFetchPartition
- (AutoFetchPartition)initWithSyncedByMailbox:(id)a3 syncedByAccount:(id)a4;
- (NSArray)syncedByAccount;
- (NSArray)syncedByMailbox;
@end

@implementation AutoFetchPartition

- (AutoFetchPartition)initWithSyncedByMailbox:(id)a3 syncedByAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AutoFetchPartition;
  v8 = [(AutoFetchPartition *)&v14 init];
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    syncedByMailbox = v8->_syncedByMailbox;
    v8->_syncedByMailbox = v9;

    v11 = (NSArray *)[v7 copy];
    syncedByAccount = v8->_syncedByAccount;
    v8->_syncedByAccount = v11;
  }
  return v8;
}

- (NSArray)syncedByMailbox
{
  return self->_syncedByMailbox;
}

- (NSArray)syncedByAccount
{
  return self->_syncedByAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncedByAccount, 0);

  objc_storeStrong((id *)&self->_syncedByMailbox, 0);
}

@end