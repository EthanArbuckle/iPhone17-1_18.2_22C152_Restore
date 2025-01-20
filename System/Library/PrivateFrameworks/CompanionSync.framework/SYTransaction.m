@interface SYTransaction
- (BOOL)_beginTransaction;
- (BOOL)_endTransaction;
- (NSDictionary)contextInfo;
- (NSDictionary)idsOptions;
- (NSMutableArray)changes;
- (SYLegacyStore)store;
- (SYTransaction)initWithStore:(id)a3;
- (id)changeList;
- (id)completion;
- (void)_beginTransaction;
- (void)_endTransaction;
- (void)addObject:(id)a3;
- (void)commit;
- (void)commitBlocking:(BOOL)a3 reportError:(id)a4;
- (void)dealloc;
- (void)deleteObject:(id)a3;
- (void)rollback;
- (void)setChanges:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setContextInfo:(id)a3;
- (void)setIdsOptions:(id)a3;
- (void)setStore:(id)a3;
- (void)updateObject:(id)a3;
@end

@implementation SYTransaction

- (SYTransaction)initWithStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SYTransaction;
  v6 = [(SYTransaction *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    changes = v7->_changes;
    v7->_changes = v8;
  }
  return v7;
}

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "-[SYTransaction dealloc]: XPC transaction wasn't ended properly", v1, 2u);
}

- (BOOL)_beginTransaction
{
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_inTransaction, (unsigned __int8 *)&v2, 1u);
  BOOL v3 = v2 == 0;
  if (!v2)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v5 = qword_26AB047A8;
    if (os_log_type_enabled((os_log_t)qword_26AB047A8, OS_LOG_TYPE_DEBUG)) {
      -[SYTransaction _beginTransaction](v5);
    }
    v6 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v6;
  }
  return v3;
}

- (BOOL)_endTransaction
{
  int v2 = 1;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_inTransaction, (unsigned __int8 *)&v2, 0);
  BOOL v3 = v2 == 1;
  if (v2 == 1)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v5 = qword_26AB047A8;
    if (os_log_type_enabled((os_log_t)qword_26AB047A8, OS_LOG_TYPE_DEBUG)) {
      -[SYTransaction _endTransaction](v5);
    }
    transaction = self->_transaction;
    self->_transaction = 0;
  }
  return v3;
}

- (id)changeList
{
  return self->_changes;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  [(SYTransaction *)self _beginTransaction];
  id v5 = [(SYTransaction *)self store];
  id v7 = +[SYChange changeWithObject:v4 updateType:0 store:v5];

  v6 = [(SYTransaction *)self changes];
  [v6 addObject:v7];
}

- (void)updateObject:(id)a3
{
  id v4 = a3;
  [(SYTransaction *)self _beginTransaction];
  id v5 = [(SYTransaction *)self store];
  id v7 = +[SYChange changeWithObject:v4 updateType:1 store:v5];

  v6 = [(SYTransaction *)self changes];
  [v6 addObject:v7];
}

- (void)deleteObject:(id)a3
{
  id v7 = a3;
  if ([(SYStore *)self->_store allowsDeletes])
  {
    [(SYTransaction *)self _beginTransaction];
    id v4 = [(SYTransaction *)self store];
    id v5 = +[SYChange changeWithObject:v7 updateType:2 store:v4];

    v6 = [(SYTransaction *)self changes];
    [v6 addObject:v5];
  }
  else
  {
    [(SYLegacyStore *)self->_store postUserNotification:@"Delete Denied" message:@"A client attempted to send a delete message while deletes were denied."];
  }
}

- (void)commit
{
}

- (void)commitBlocking:(BOOL)a3 reportError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v10 = [(SYTransaction *)self store];
  id v7 = [(SYTransaction *)self changes];
  v8 = [(SYTransaction *)self contextInfo];
  v9 = [(SYTransaction *)self idsOptions];
  [v10 _handleObjectChanges:v7 contextInfo:v8 idsOptions:v9 blockUntilSent:v4 reportError:v6 notifyingTransaction:self];
}

- (void)rollback
{
  id v2 = [(SYTransaction *)self changes];
  [v2 removeAllObjects];
}

- (NSDictionary)contextInfo
{
  return self->_contextInfo;
}

- (void)setContextInfo:(id)a3
{
}

- (NSDictionary)idsOptions
{
  return self->_idsOptions;
}

- (void)setIdsOptions:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (SYLegacyStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (NSMutableArray)changes
{
  return self->_changes;
}

- (void)setChanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_idsOptions, 0);
  objc_storeStrong((id *)&self->_contextInfo, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (void)_beginTransaction
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21C7C9000, log, OS_LOG_TYPE_DEBUG, "SYTransaction: beginning XPC transaction, to stop us being Jetsammed until it's done.", v1, 2u);
}

- (void)_endTransaction
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21C7C9000, log, OS_LOG_TYPE_DEBUG, "SYTransaction: ending XPC transaction. We can now be jetsammed safely.", v1, 2u);
}

@end