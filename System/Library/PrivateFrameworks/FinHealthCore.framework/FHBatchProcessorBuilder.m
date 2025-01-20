@interface FHBatchProcessorBuilder
- (BOOL)computeMerchantCounts;
- (FHBatchProcessorBuilder)init;
- (FHDatabaseManager)databaseManager;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSMutableSet)internalStates;
- (unint64_t)mostRecentTransactionFromDatabase;
- (void)addInternalState:(unint64_t)a3;
- (void)enableMerchantCounts;
- (void)setComputeMerchantCounts:(BOOL)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setInternalStates:(id)a3;
- (void)setMostRecentTransactionFromDatabase:(unint64_t)a3;
- (void)setStartDate:(id)a3;
@end

@implementation FHBatchProcessorBuilder

- (FHBatchProcessorBuilder)init
{
  v10.receiver = self;
  v10.super_class = (Class)FHBatchProcessorBuilder;
  v2 = [(FHBatchProcessorBuilder *)&v10 init];
  v3 = v2;
  if (v2)
  {
    databaseManager = v2->_databaseManager;
    v2->_databaseManager = 0;

    v3->_computeMerchantCounts = 0;
    startDate = v3->_startDate;
    v3->_startDate = 0;

    endDate = v3->_endDate;
    v3->_endDate = 0;

    uint64_t v7 = objc_opt_new();
    internalStates = v3->_internalStates;
    v3->_internalStates = (NSMutableSet *)v7;
  }
  return v3;
}

- (void)addInternalState:(unint64_t)a3
{
  internalStates = self->_internalStates;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableSet *)internalStates addObject:v4];
}

- (void)enableMerchantCounts
{
  self->_computeMerchantCounts = 1;
}

- (FHDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (unint64_t)mostRecentTransactionFromDatabase
{
  return self->_mostRecentTransactionFromDatabase;
}

- (void)setMostRecentTransactionFromDatabase:(unint64_t)a3
{
  self->_mostRecentTransactionFromDatabase = a3;
}

- (NSMutableSet)internalStates
{
  return self->_internalStates;
}

- (void)setInternalStates:(id)a3
{
}

- (BOOL)computeMerchantCounts
{
  return self->_computeMerchantCounts;
}

- (void)setComputeMerchantCounts:(BOOL)a3
{
  self->_computeMerchantCounts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_internalStates, 0);
}

@end