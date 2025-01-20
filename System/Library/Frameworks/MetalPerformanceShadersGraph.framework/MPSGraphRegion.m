@interface MPSGraphRegion
- (MPSGraphRegion)init;
- (id)appendNewBlock;
@end

@implementation MPSGraphRegion

- (MPSGraphRegion)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPSGraphRegion;
  v2 = [(MPSGraphRegion *)&v6 init];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  blocks = v2->_blocks;
  v2->_blocks = (NSMutableArray *)v3;

  return v2;
}

- (id)appendNewBlock
{
  uint64_t v3 = (id *)objc_opt_new();
  objc_storeWeak(v3 + 4, self);
  [(NSMutableArray *)self->_blocks addObject:v3];
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_parentOp);
  v5 = (id *)objc_loadWeakRetained(WeakRetained + 1);
  objc_storeStrong(v5 + 22, v3);

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentOp);

  objc_storeStrong((id *)&self->_blocks, 0);
}

@end