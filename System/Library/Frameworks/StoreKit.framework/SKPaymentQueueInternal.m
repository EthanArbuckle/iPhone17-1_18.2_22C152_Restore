@interface SKPaymentQueueInternal
- (SKPaymentQueueInternal)init;
@end

@implementation SKPaymentQueueInternal

- (SKPaymentQueueInternal)init
{
  v15.receiver = self;
  v15.super_class = (Class)SKPaymentQueueInternal;
  v2 = [(SKPaymentQueueInternal *)&v15 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    transactions = v2->_transactions;
    v2->_transactions = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    localTransactions = v2->_localTransactions;
    v2->_localTransactions = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    weakObservers = v2->_weakObservers;
    v2->_weakObservers = v10;

    objc_storeStrong((id *)&v2->_observerQueue, MEMORY[0x1E4F14428]);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    downloads = v2->_downloads;
    v2->_downloads = v12;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_weakObservers, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_localTransactions, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end