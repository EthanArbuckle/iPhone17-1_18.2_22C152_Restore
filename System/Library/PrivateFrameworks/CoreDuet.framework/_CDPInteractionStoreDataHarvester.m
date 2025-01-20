@interface _CDPInteractionStoreDataHarvester
- (NSArray)interactions;
- (NSPredicate)predicate;
- (_CDInteractionStore)store;
- (id)contactForIdentifier:(id)a3;
- (void)loadWithLimit:(unint64_t)a3 dataPointReader:(id)a4 completion:(id)a5;
- (void)setPredicate:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation _CDPInteractionStoreDataHarvester

- (void)loadWithLimit:(unint64_t)a3 dataPointReader:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = dispatch_get_global_queue(0, 0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78___CDPInteractionStoreDataHarvester_loadWithLimit_dataPointReader_completion___block_invoke;
  v16[3] = &unk_1E5610400;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  unint64_t v19 = a3;
  v11 = v16;
  id v12 = v9;
  id v13 = v8;
  v14 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_10;
  block[3] = &unk_1E560D978;
  id v21 = v14;
  id v22 = v11;
  id v15 = v14;
  dispatch_async(v10, block);
}

- (id)contactForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_identifierToContactMap objectForKeyedSubscript:a3];
}

- (_CDInteractionStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (NSArray)interactions
{
  return self->_interactions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_identifierToContactMap, 0);
}

@end