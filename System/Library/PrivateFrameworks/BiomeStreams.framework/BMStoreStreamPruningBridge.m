@interface BMStoreStreamPruningBridge
- (BMStoreStreamPruningBridge)initWithStreamIdentifier:(id)a3 domain:(unint64_t)a4;
- (void)didPruneEvents;
- (void)didWriteTombstone:(id)a3 timestamp:(double)a4 account:(id)a5 remoteName:(id)a6;
- (void)willPruneEvent:(id)a3;
@end

@implementation BMStoreStreamPruningBridge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeTombstonePropagator, 0);

  objc_storeStrong((id *)&self->_bfsDeletePropagator, 0);
}

- (BMStoreStreamPruningBridge)initWithStreamIdentifier:(id)a3 domain:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMStoreStreamPruningBridge;
  v7 = [(BMStoreStreamPruningBridge *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F4FA78]) initWithStreamId:v6];
    bfsDeletePropagator = v7->_bfsDeletePropagator;
    v7->_bfsDeletePropagator = (BMBFSDeletePropagator *)v8;

    v10 = [[BMComputeTombstonePropagator alloc] initWithStreamIdentifier:v6 domain:a4];
    computeTombstonePropagator = v7->_computeTombstonePropagator;
    v7->_computeTombstonePropagator = v10;
  }
  return v7;
}

- (void)didPruneEvents
{
}

- (void)willPruneEvent:(id)a3
{
}

- (void)didWriteTombstone:(id)a3 timestamp:(double)a4 account:(id)a5 remoteName:(id)a6
{
}

@end