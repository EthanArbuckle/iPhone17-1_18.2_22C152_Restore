@interface IMPurgableObject
- (IMPurgableObject)initWithSetupBlock:(id)a3 cleanupBlock:(id)a4 queue:(id)a5;
- (id)instance;
- (void)_cleanupInstance;
- (void)_setupInstance;
- (void)dealloc;
@end

@implementation IMPurgableObject

- (IMPurgableObject)initWithSetupBlock:(id)a3 cleanupBlock:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IMPurgableObject;
  v14 = [(IMPurgableObject *)&v23 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v9, v11, v12, v13);
    id cleanupBlock = v14->_cleanupBlock;
    v14->_id cleanupBlock = (id)v15;

    uint64_t v20 = objc_msgSend_copy(v8, v17, v18, v19);
    id setupBlock = v14->_setupBlock;
    v14->_id setupBlock = (id)v20;

    if (v10) {
      objc_storeStrong((id *)&v14->_queue, a5);
    }
  }

  return v14;
}

- (void)dealloc
{
  objc_msgSend__cleanupInstance(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IMPurgableObject;
  [(IMPurgableObject *)&v5 dealloc];
}

- (void)_setupInstance
{
  if (!self->_instanceObject)
  {
    id setupBlock = (void (**)(id, SEL))self->_setupBlock;
    if (setupBlock)
    {
      setupBlock[2](setupBlock, a2);
      self->_instanceObject = (id)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1F41817F8]();
    }
  }
}

- (void)_cleanupInstance
{
  if (self->_instanceObject)
  {
    if (self->_cleanupBlock)
    {
      queue = self->_queue;
      if (queue)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1918DA534;
        block[3] = &unk_1E5723270;
        block[4] = self;
        dispatch_sync(queue, block);
      }
      else
      {
        v5[0] = MEMORY[0x1E4F143A8];
        v5[1] = 3221225472;
        v5[2] = sub_1918DA54C;
        v5[3] = &unk_1E5723270;
        v5[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], v5);
      }
    }
    id instanceObject = self->_instanceObject;
    self->_id instanceObject = 0;
  }
}

- (id)instance
{
  objc_msgSend__setupInstance(self, a2, v2, v3);
  id instanceObject = self->_instanceObject;
  return instanceObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_cleanupBlock, 0);
  objc_storeStrong(&self->_setupBlock, 0);
  objc_storeStrong(&self->_instanceObject, 0);
}

@end