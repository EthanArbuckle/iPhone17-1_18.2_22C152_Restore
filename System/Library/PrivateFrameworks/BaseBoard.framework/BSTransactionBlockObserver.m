@interface BSTransactionBlockObserver
- (void)addTransactionDidBeginBlock:(id)a3;
- (void)addTransactionDidCompleteBlock:(id)a3;
- (void)addTransactionDidFinishWorkBlock:(id)a3;
- (void)addTransactionWillBeginBlock:(id)a3;
- (void)transactionDidBegin:(id)a3;
- (void)transactionDidComplete:(id)a3;
- (void)transactionDidFinishWork:(id)a3;
- (void)transactionWillBegin:(id)a3;
@end

@implementation BSTransactionBlockObserver

- (void)addTransactionWillBeginBlock:(id)a3
{
  willBeginBlocks = self->_willBeginBlocks;
  if (!willBeginBlocks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_willBeginBlocks;
    self->_willBeginBlocks = v6;

    willBeginBlocks = self->_willBeginBlocks;
  }
  id v9 = (id)[a3 copy];
  v8 = (void *)MEMORY[0x18C125630]();
  [(NSMutableArray *)willBeginBlocks addObject:v8];
}

- (void)addTransactionDidBeginBlock:(id)a3
{
  didBeginBlocks = self->_didBeginBlocks;
  if (!didBeginBlocks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_didBeginBlocks;
    self->_didBeginBlocks = v6;

    didBeginBlocks = self->_didBeginBlocks;
  }
  id v9 = (id)[a3 copy];
  v8 = (void *)MEMORY[0x18C125630]();
  [(NSMutableArray *)didBeginBlocks addObject:v8];
}

- (void)addTransactionDidFinishWorkBlock:(id)a3
{
  didFinishWorkBlocks = self->_didFinishWorkBlocks;
  if (!didFinishWorkBlocks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_didFinishWorkBlocks;
    self->_didFinishWorkBlocks = v6;

    didFinishWorkBlocks = self->_didFinishWorkBlocks;
  }
  id v9 = (id)[a3 copy];
  v8 = (void *)MEMORY[0x18C125630]();
  [(NSMutableArray *)didFinishWorkBlocks addObject:v8];
}

- (void)addTransactionDidCompleteBlock:(id)a3
{
  didCompleteBlocks = self->_didCompleteBlocks;
  if (!didCompleteBlocks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_didCompleteBlocks;
    self->_didCompleteBlocks = v6;

    didCompleteBlocks = self->_didCompleteBlocks;
  }
  id v9 = (id)[a3 copy];
  v8 = (void *)MEMORY[0x18C125630]();
  [(NSMutableArray *)didCompleteBlocks addObject:v8];
}

- (void)transactionWillBegin:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = (void *)[(NSMutableArray *)self->_willBeginBlocks copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_willBeginBlocks removeAllObjects];
}

- (void)transactionDidBegin:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = (void *)[(NSMutableArray *)self->_didBeginBlocks copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_didBeginBlocks removeAllObjects];
}

- (void)transactionDidFinishWork:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = (void *)[(NSMutableArray *)self->_didFinishWorkBlocks copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_didFinishWorkBlocks removeAllObjects];
}

- (void)transactionDidComplete:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = (void *)[(NSMutableArray *)self->_didCompleteBlocks copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_didCompleteBlocks removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didCompleteBlocks, 0);
  objc_storeStrong((id *)&self->_didFinishWorkBlocks, 0);
  objc_storeStrong((id *)&self->_didBeginBlocks, 0);
  objc_storeStrong((id *)&self->_willBeginBlocks, 0);
}

@end