@interface FBSynchronizedTransactionGroup
- (BOOL)_canBeInterrupted;
- (BOOL)_shouldFailForChildTransaction:(id)a3;
- (BOOL)isReadyForSynchronizedCommit;
- (FBSynchronizedTransactionDelegate)synchronizationDelegate;
- (FBSynchronizedTransactionGroup)init;
- (id)synchronizedTransactions;
- (void)_checkPreconditionsAndCommitIfReady;
- (void)_childTransactionDidComplete:(id)a3;
- (void)_didComplete;
- (void)_performSynchronizedCommit:(id)a3;
- (void)_performSynchronizedCommitIfReady;
- (void)addSynchronizedTransaction:(id)a3;
- (void)performSynchronizedCommit;
- (void)setSynchronizationDelegate:(id)a3;
- (void)synchronizedTransactionReadyToCommit:(id)a3;
@end

@implementation FBSynchronizedTransactionGroup

uint64_t __46__FBSynchronizedTransactionGroup__didComplete__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSynchronizationDelegate:0];
}

- (void)addSynchronizedTransaction:(id)a3
{
  if (a3)
  {
    synchronizedTransactions = self->_synchronizedTransactions;
    id v5 = a3;
    [(NSMutableSet *)synchronizedTransactions addObject:v5];
    [(NSMutableSet *)self->_synchronizedTransactionsAwaitingCommitReadiness addObject:v5];
    [v5 setSynchronizationDelegate:self];
    [(FBSynchronizedTransactionGroup *)self addChildTransaction:v5];
  }
}

- (void)_didComplete
{
  v3.receiver = self;
  v3.super_class = (Class)FBSynchronizedTransactionGroup;
  [(FBSynchronizedTransactionGroup *)&v3 _didComplete];
}

- (void)setSynchronizationDelegate:(id)a3
{
}

- (id)synchronizedTransactions
{
  return (id)[(NSMutableSet *)self->_synchronizedTransactions allObjects];
}

- (void)_performSynchronizedCommit:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(FBSynchronizedTransactionGroup *)self synchronizationDelegate];
  [v5 synchronizedTransaction:self willCommitSynchronizedTransactions:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) { {
          objc_enumerationMutation(v6);
        }
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "performSynchronizedCommit", (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [v5 synchronizedTransaction:self didCommitSynchronizedTransactions:v6];
}

- (void)synchronizedTransactionReadyToCommit:(id)a3
{
  id v4 = a3;
  if (-[NSMutableSet containsObject:](self->_synchronizedTransactionsAwaitingCommitReadiness, "containsObject:"))
  {
    [(NSMutableSet *)self->_synchronizedTransactionsAwaitingCommitReadiness removeObject:v4];
    [(NSMutableSet *)self->_synchronizedTransactionsReadyToCommit addObject:v4];
    [(FBSynchronizedTransactionGroup *)self _checkPreconditionsAndCommitIfReady];
  }
}

- (void)_childTransactionDidComplete:(id)a3
{
  synchronizedTransactionsAwaitingCommitReadiness = self->_synchronizedTransactionsAwaitingCommitReadiness;
  id v5 = a3;
  [(NSMutableSet *)synchronizedTransactionsAwaitingCommitReadiness removeObject:v5];
  [(NSMutableSet *)self->_synchronizedTransactionsReadyToCommit removeObject:v5];
  [(FBSynchronizedTransactionGroup *)self _checkPreconditionsAndCommitIfReady];
  v6.receiver = self;
  v6.super_class = (Class)FBSynchronizedTransactionGroup;
  [(FBSynchronizedTransactionGroup *)&v6 _childTransactionDidComplete:v5];
}

- (void)_performSynchronizedCommitIfReady
{
  if ([(FBSynchronizedTransactionGroup *)self isReadyForSynchronizedCommit])
  {
    self->_didCommit = 1;
    if ([(FBSynchronizedTransactionGroup *)self isAuditHistoryEnabled]) { {
      [(FBSynchronizedTransactionGroup *)self _addAuditHistoryItem:@"Committing now!"];
    }
    }
    id v3 = [(NSMutableSet *)self->_synchronizedTransactionsReadyToCommit allObjects];
    [(NSMutableSet *)self->_synchronizedTransactionsReadyToCommit removeAllObjects];
    [(FBSynchronizedTransactionGroup *)self _performSynchronizedCommit:v3];
    [(FBSynchronizedTransactionGroup *)self satisfyMilestone:@"synchronizedCommit"];
  }
}

- (BOOL)isReadyForSynchronizedCommit
{
  return self->_commitAllowed && !self->_didCommit && self->_readyForCommit;
}

- (void)performSynchronizedCommit
{
  self->_commitAllowed = 1;
  id v3 = [(FBSynchronizedTransactionGroup *)self synchronizationDelegate];

  if (v3 && [(FBSynchronizedTransactionGroup *)self isAuditHistoryEnabled]) { {
    [(FBSynchronizedTransactionGroup *)self _addAuditHistoryItem:@"Delegate says we're good to commit."];
  }
  }

  [(FBSynchronizedTransactionGroup *)self _performSynchronizedCommitIfReady];
}

- (FBSynchronizedTransactionDelegate)synchronizationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_synchronizationDelegate);

  return (FBSynchronizedTransactionDelegate *)WeakRetained;
}

- (void)_checkPreconditionsAndCommitIfReady
{
  if (self->_readyForCommit || [(NSMutableSet *)self->_synchronizedTransactionsAwaitingCommitReadiness count])
  {
    [(FBSynchronizedTransactionGroup *)self _performSynchronizedCommitIfReady];
  }
  else
  {
    self->_readyForCommit = 1;
    if ([(FBSynchronizedTransactionGroup *)self isAuditHistoryEnabled]) { {
      [(FBSynchronizedTransactionGroup *)self _addAuditHistoryItem:@"Commit preconditions satisfied."];
    }
    }
    [(FBSynchronizedTransactionGroup *)self addMilestone:@"synchronizedCommit"];
    id v4 = [(FBSynchronizedTransactionGroup *)self synchronizationDelegate];
    if (v4 && !self->_commitAllowed)
    {
      if ([(FBSynchronizedTransactionGroup *)self isAuditHistoryEnabled])
      {
        id v3 = [MEMORY[0x1E4F62810] descriptionForObject:v4];
        [(FBSynchronizedTransactionGroup *)self _addAuditHistoryItem:@"Using synchronization delegate: %@", v3];
      }
      [v4 synchronizedTransactionReadyToCommit:self];
    }
    else
    {
      self->_commitAllowed = 1;
      [(FBSynchronizedTransactionGroup *)self _performSynchronizedCommitIfReady];
    }
  }
}

- (FBSynchronizedTransactionGroup)init
{
  v10.receiver = self;
  v10.super_class = (Class)FBSynchronizedTransactionGroup;
  v2 = [(FBTransaction *)&v10 init];
  if (v2)
  {
    id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    synchronizedTransactions = v2->_synchronizedTransactions;
    v2->_synchronizedTransactions = v3;

    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    synchronizedTransactionsAwaitingCommitReadiness = v2->_synchronizedTransactionsAwaitingCommitReadiness;
    v2->_synchronizedTransactionsAwaitingCommitReadiness = v5;

    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    synchronizedTransactionsReadyToCommit = v2->_synchronizedTransactionsReadyToCommit;
    v2->_synchronizedTransactionsReadyToCommit = v7;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizedTransactions, 0);
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (BOOL)_shouldFailForChildTransaction:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_synchronizedTransactions containsObject:v4])
  {
    id v5 = [(FBSynchronizedTransactionGroup *)self synchronizationDelegate];
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0) { {
      char v6 = [v5 synchronizedTransactionGroup:self shouldFailForSynchronizedTransaction:v4];
    }
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

@end