@interface _HFCharacteristicReadAndWriteTransactions
- (NSMutableOrderedSet)transactionsReading;
- (NSMutableOrderedSet)transactionsWriting;
- (_HFCharacteristicReadAndWriteTransactions)init;
- (void)setTransactionsReading:(id)a3;
- (void)setTransactionsWriting:(id)a3;
@end

@implementation _HFCharacteristicReadAndWriteTransactions

- (NSMutableOrderedSet)transactionsWriting
{
  return self->_transactionsWriting;
}

- (NSMutableOrderedSet)transactionsReading
{
  return self->_transactionsReading;
}

- (_HFCharacteristicReadAndWriteTransactions)init
{
  v8.receiver = self;
  v8.super_class = (Class)_HFCharacteristicReadAndWriteTransactions;
  v2 = [(_HFCharacteristicReadAndWriteTransactions *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9B0] orderedSet];
    transactionsReading = v2->_transactionsReading;
    v2->_transactionsReading = (NSMutableOrderedSet *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9B0] orderedSet];
    transactionsWriting = v2->_transactionsWriting;
    v2->_transactionsWriting = (NSMutableOrderedSet *)v5;
  }
  return v2;
}

- (void)setTransactionsReading:(id)a3
{
}

- (void)setTransactionsWriting:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionsWriting, 0);
  objc_storeStrong((id *)&self->_transactionsReading, 0);
}

@end