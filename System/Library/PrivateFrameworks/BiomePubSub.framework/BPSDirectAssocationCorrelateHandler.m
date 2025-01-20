@interface BPSDirectAssocationCorrelateHandler
- (BPSDirectAssocationCorrelateHandler)initWithCorrelating:(id)a3;
- (id)correlateWithCurrentEvent:(id)a3;
- (void)receivePriorEvent:(id)a3;
@end

@implementation BPSDirectAssocationCorrelateHandler

- (BPSDirectAssocationCorrelateHandler)initWithCorrelating:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v10.receiver = self;
  v10.super_class = (Class)BPSDirectAssocationCorrelateHandler;
  v6 = [(BPSCorrelateHandler *)&v10 initWithInitialContext:v5];

  if (v6)
  {
    uint64_t v7 = [v4 copy];
    id correlating = v6->_correlating;
    v6->_id correlating = (id)v7;
  }
  return v6;
}

- (void)receivePriorEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(BPSCorrelateHandler *)self context];
  [v5 addObject:v4];
}

- (id)correlateWithCurrentEvent:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = objc_opt_new();
  uint64_t v7 = [(BPSCorrelateHandler *)self context];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __65__BPSDirectAssocationCorrelateHandler_correlateWithCurrentEvent___block_invoke;
  v17 = &unk_1E5E75F78;
  v18 = self;
  id v8 = v4;
  id v19 = v8;
  id v9 = v5;
  id v20 = v9;
  id v10 = v6;
  id v21 = v10;
  [v7 enumerateObjectsUsingBlock:&v14];

  v11 = [(BPSCorrelateHandler *)self context];
  [v11 removeObjectsAtIndexes:v10];

  if ([v9 count]) {
    v12 = [[BPSTuple alloc] initWithFirst:v8 second:v9];
  }
  else {
    v12 = 0;
  }

  return v12;
}

void __65__BPSDirectAssocationCorrelateHandler_correlateWithCurrentEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))())
  {
    [*(id *)(a1 + 48) addObject:v5];
    [*(id *)(a1 + 56) addIndex:a3];
  }
}

- (void).cxx_destruct
{
}

@end