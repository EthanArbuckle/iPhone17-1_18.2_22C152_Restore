@interface BNPendingDequeuePromise
- (BNPendingDequeuePromise)initWithPostingContext:(id)a3 dequeueBlock:(id)a4;
- (BNPostingContext)postingContext;
- (BOOL)isValid;
- (void)dequeue;
@end

@implementation BNPendingDequeuePromise

- (BNPendingDequeuePromise)initWithPostingContext:(id)a3 dequeueBlock:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"BNPresentableQueue.m", 200, @"Invalid parameter not satisfying: %@", @"postingContext" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"BNPresentableQueue.m", 201, @"Invalid parameter not satisfying: %@", @"dequeueBlock" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)BNPendingDequeuePromise;
  v11 = [(BNPendingDequeuePromise *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_postingContext, a3);
    uint64_t v13 = [v10 copy];
    id dequeueBlock = v12->_dequeueBlock;
    v12->_id dequeueBlock = (id)v13;
  }
  return v12;
}

- (BOOL)isValid
{
  return self->_dequeueBlock != 0;
}

- (void)dequeue
{
  uint64_t v5 = MEMORY[0x1C1899380](self->_dequeueBlock, a2);
  id dequeueBlock = self->_dequeueBlock;
  self->_id dequeueBlock = 0;

  v4 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, BNPostingContext *))(v5 + 16))(v5, self->_postingContext);
    v4 = (void *)v5;
  }
}

- (BNPostingContext)postingContext
{
  return self->_postingContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postingContext, 0);
  objc_storeStrong(&self->_dequeueBlock, 0);
}

@end