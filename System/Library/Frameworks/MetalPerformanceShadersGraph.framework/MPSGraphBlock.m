@interface MPSGraphBlock
- (MPSGraphBlock)init;
- (id)parentOp;
- (void)addTerminatorOperation:(id)a3;
@end

@implementation MPSGraphBlock

- (MPSGraphBlock)init
{
  v7.receiver = self;
  v7.super_class = (Class)MPSGraphBlock;
  v2 = [(MPSGraphBlock *)&v7 init];
  terminator = v2->_terminator;
  v2->_terminator = 0;

  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  blockOperations = v2->_blockOperations;
  v2->_blockOperations = (NSMutableArray *)v4;

  return v2;
}

- (void)addTerminatorOperation:(id)a3
{
}

- (id)parentOp
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_parentRegion);
  id v3 = objc_loadWeakRetained(WeakRetained + 2);

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentRegion);
  objc_storeStrong((id *)&self->_blockOperations, 0);

  objc_storeStrong((id *)&self->_terminator, 0);
}

@end