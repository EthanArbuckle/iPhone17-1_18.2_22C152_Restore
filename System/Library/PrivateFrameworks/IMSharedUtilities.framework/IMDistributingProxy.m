@interface IMDistributingProxy
- (BOOL)isAsynchronous;
- (BOOL)respondsToSelector:(SEL)a3;
- (IMDistributingProxy)initWithTargets:(id)a3;
- (IMDistributingProxy)initWithTargets:(id)a3 targetQueue:(id)a4 asynchronous:(BOOL)a5 filterBlock:(id)a6;
- (NSArray)targets;
- (OS_dispatch_queue)targetQueue;
- (id)filterBlock;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation IMDistributingProxy

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  v5 = [(IMDistributingProxy *)self targetQueue];

  if (v5)
  {
    if ([(IMDistributingProxy *)self isAsynchronous])
    {
      [v4 retainArguments];
      v6 = [(IMDistributingProxy *)self targetQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1A07B019C;
      block[3] = &unk_1E5A10080;
      block[4] = self;
      id v12 = v4;
      dispatch_async(v6, block);

      v7 = v12;
    }
    else
    {
      v8 = [(IMDistributingProxy *)self targetQueue];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = sub_1A07B01A8;
      v9[3] = &unk_1E5A10080;
      v9[4] = self;
      id v10 = v4;
      dispatch_sync(v8, v9);

      v7 = v10;
    }
  }
  else
  {
    sub_1A0775F70(self, v4);
  }
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (NSArray)targets
{
  return self->_targets;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(IMDistributingProxy *)self targets];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) methodSignatureForSelector:a3];
        if (v9)
        {
          id v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)filterBlock
{
  return self->_filterBlock;
}

- (IMDistributingProxy)initWithTargets:(id)a3 targetQueue:(id)a4 asynchronous:(BOOL)a5 filterBlock:(id)a6
{
  id v10 = (OS_dispatch_queue *)a4;
  id v11 = a6;
  long long v12 = (NSArray *)[a3 copy];
  targets = self->_targets;
  self->_targets = v12;

  targetQueue = self->_targetQueue;
  self->_targetQueue = v10;
  long long v15 = v10;

  self->_asynchronous = a5;
  v16 = (void *)[v11 copy];

  id filterBlock = self->_filterBlock;
  self->_id filterBlock = v16;

  return self;
}

- (IMDistributingProxy)initWithTargets:(id)a3
{
  return (IMDistributingProxy *)MEMORY[0x1F4181798](self, sel_initWithTargets_targetQueue_asynchronous_filterBlock_);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(IMDistributingProxy *)self targets];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_opt_respondsToSelector())
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)isAsynchronous
{
  return self->_asynchronous;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filterBlock, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);

  objc_storeStrong((id *)&self->_targets, 0);
}

@end