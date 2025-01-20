@interface HDDatabaseTransactionContextStatistics
- (HDDatabaseTransactionContextStatistics)init;
- (NSArray)transactions;
- (NSString)shortDescription;
- (double)totalDuration;
- (void)_addTransactionStatistics:(id)a3;
@end

@implementation HDDatabaseTransactionContextStatistics

- (HDDatabaseTransactionContextStatistics)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDDatabaseTransactionContextStatistics;
  v2 = [(HDDatabaseTransactionContextStatistics *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    transactions = v2->_transactions;
    v2->_transactions = v3;
  }
  return v2;
}

- (NSArray)transactions
{
  v2 = (void *)[(NSMutableArray *)self->_transactions copy];

  return (NSArray *)v2;
}

- (double)totalDuration
{
  [(NSMutableArray *)self->_transactions hk_sumUsingEvaluationBlock:&__block_literal_global_132];
  return result;
}

uint64_t __55__HDDatabaseTransactionContextStatistics_totalDuration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 duration];
}

- (void)_addTransactionStatistics:(id)a3
{
}

- (NSString)shortDescription
{
  uint64_t v8 = 0;
  v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  transactions = self->_transactions;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HDDatabaseTransactionContextStatistics_shortDescription__block_invoke;
  v7[3] = &unk_1E6303490;
  v7[4] = &v8;
  objc_msgSend(v3, "hk_appendComponentsJoinedByString:container:componentGenerator:", @", ", transactions, v7);
  v5 = [NSString stringWithFormat:@"%.0lfms [ %@ ]", v9[3] * 1000.0, v3];

  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

uint64_t __58__HDDatabaseTransactionContextStatistics_shortDescription__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 duration];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  v5 = NSString;
  [v3 duration];
  double v7 = v6;

  return objc_msgSend(v5, "stringWithFormat:", @"%.1lf", v7 * 1000.0);
}

- (void).cxx_destruct
{
}

@end