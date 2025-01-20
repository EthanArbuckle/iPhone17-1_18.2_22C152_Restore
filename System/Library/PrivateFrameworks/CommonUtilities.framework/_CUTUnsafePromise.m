@interface _CUTUnsafePromise
- (BOOL)done;
- (CUTResult)result;
- (NSMutableArray)resultBlocks;
- (_CUTUnsafePromise)init;
- (_CUTUnsafePromise)initWithResult:(id)a3;
- (void)_fulfillWithResult:(id)a3;
- (void)registerResultBlock:(id)a3;
- (void)setDone:(BOOL)a3;
- (void)setResult:(id)a3;
- (void)setResultBlocks:(id)a3;
@end

@implementation _CUTUnsafePromise

- (_CUTUnsafePromise)init
{
  v7.receiver = self;
  v7.super_class = (Class)_CUTUnsafePromise;
  v2 = [(CUTUnsafePromise *)&v7 _init];
  v3 = v2;
  if (v2)
  {
    v2->_done = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    resultBlocks = v3->_resultBlocks;
    v3->_resultBlocks = v4;
  }
  return v3;
}

- (_CUTUnsafePromise)initWithResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CUTUnsafePromise;
  v6 = [(CUTUnsafePromise *)&v9 _init];
  objc_super v7 = v6;
  if (v6)
  {
    v6->_done = 1;
    objc_storeStrong((id *)&v6->_result, a3);
  }

  return v7;
}

- (void)_fulfillWithResult:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(_CUTUnsafePromise *)self done])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_CUTUnsafePromise.m", 34, @"Invalid parameter not satisfying: %@", @"!self.done" object file lineNumber description];
  }
  [(_CUTUnsafePromise *)self setDone:1];
  [(_CUTUnsafePromise *)self setResult:v5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_resultBlocks;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  resultBlocks = self->_resultBlocks;
  self->_resultBlocks = 0;
}

- (void)registerResultBlock:(id)a3
{
  v6 = (void (**)(id, void *))a3;
  if ([(_CUTUnsafePromise *)self done])
  {
    v4 = [(_CUTUnsafePromise *)self result];
    v6[2](v6, v4);
  }
  else
  {
    resultBlocks = self->_resultBlocks;
    v4 = (void *)MEMORY[0x1A6249D30](v6);
    [(NSMutableArray *)resultBlocks addObject:v4];
  }
}

- (BOOL)done
{
  return self->_done;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (CUTResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSMutableArray)resultBlocks
{
  return self->_resultBlocks;
}

- (void)setResultBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultBlocks, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end