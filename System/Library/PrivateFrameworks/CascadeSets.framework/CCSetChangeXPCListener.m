@interface CCSetChangeXPCListener
- (BOOL)handlesUpdateForSet:(id)a3;
- (CCSetChangeQueue)setChangeQueue;
- (CCSetChangeXPCListener)initWithIdentifier:(id)a3 batchHandlerBlock:(id)a4 queue:(id)a5;
- (CCSetChangeXPCListener)initWithIdentifier:(id)a3 batchHandlerBlock:(id)a4 queue:(id)a5 useCase:(id)a6;
- (CCSetChangeXPCListener)initWithIdentifier:(id)a3 handlerBlock:(id)a4 queue:(id)a5;
- (CCSetChangeXPCListener)initWithIdentifier:(id)a3 handlerBlock:(id)a4 queue:(id)a5 useCase:(id)a6;
- (CCSetChangeXPCListener)initWithIdentifier:(id)a3 queue:(id)a4 handlerBlock:(id)a5 batchHandlerBlock:(id)a6 useCase:(id)a7;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (id)batchHandlerBlock;
- (id)description;
- (id)handlerBlock;
- (void)dealloc;
@end

@implementation CCSetChangeXPCListener

- (CCSetChangeXPCListener)initWithIdentifier:(id)a3 queue:(id)a4 handlerBlock:(id)a5 batchHandlerBlock:(id)a6 useCase:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CCSetChangeXPCListener;
  v18 = [(CCSetChangeXPCListener *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_queue, a4);
    uint64_t v20 = MEMORY[0x24C5B1320](v15);
    id handlerBlock = v19->_handlerBlock;
    v19->_id handlerBlock = (id)v20;

    uint64_t v22 = MEMORY[0x24C5B1320](v16);
    id batchHandlerBlock = v19->_batchHandlerBlock;
    v19->_id batchHandlerBlock = (id)v22;

    if (v19->_batchHandlerBlock)
    {
      v24 = objc_alloc_init(CCSetChangeQueue);
      setChangeQueue = v19->_setChangeQueue;
      v19->_setChangeQueue = v24;
    }
    objc_storeStrong((id *)&v19->_useCase, a7);
    v26 = +[CCSetChangeXPCEventHandler sharedInstance];
    [v26 addListener:v19];
  }
  return v19;
}

- (CCSetChangeXPCListener)initWithIdentifier:(id)a3 handlerBlock:(id)a4 queue:(id)a5
{
  return [(CCSetChangeXPCListener *)self initWithIdentifier:a3 queue:a5 handlerBlock:a4 batchHandlerBlock:0 useCase:*MEMORY[0x263F29E30]];
}

- (CCSetChangeXPCListener)initWithIdentifier:(id)a3 handlerBlock:(id)a4 queue:(id)a5 useCase:(id)a6
{
  return [(CCSetChangeXPCListener *)self initWithIdentifier:a3 queue:a5 handlerBlock:a4 batchHandlerBlock:0 useCase:a6];
}

- (CCSetChangeXPCListener)initWithIdentifier:(id)a3 batchHandlerBlock:(id)a4 queue:(id)a5
{
  return [(CCSetChangeXPCListener *)self initWithIdentifier:a3 queue:a5 handlerBlock:0 batchHandlerBlock:a4 useCase:*MEMORY[0x263F29E30]];
}

- (CCSetChangeXPCListener)initWithIdentifier:(id)a3 batchHandlerBlock:(id)a4 queue:(id)a5 useCase:(id)a6
{
  return [(CCSetChangeXPCListener *)self initWithIdentifier:a3 queue:a5 handlerBlock:0 batchHandlerBlock:a4 useCase:a6];
}

- (BOOL)handlesUpdateForSet:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self->_useCase isEqualToString:*MEMORY[0x263F29E30]])
  {
    BOOL v5 = 1;
  }
  else
  {
    if (!self->_listeningProcess || !self->_readableSetIdentifiers)
    {
      v6 = [MEMORY[0x263F29E80] current];
      listeningProcess = self->_listeningProcess;
      self->_listeningProcess = v6;

      v8 = [MEMORY[0x263F29E58] policyForProcess:self->_listeningProcess connectionFlags:0 useCase:self->_useCase];
      v9 = [v8 explicitlyAuthorizedResourcesOfType:4 withAccessMode:1];
      readableSetIdentifiers = self->_readableSetIdentifiers;
      self->_readableSetIdentifiers = v9;
    }
    v11 = CCTypeIdentifierRegistryBridge();
    v12 = objc_msgSend(v11, "setIdentifierForItemType:", objc_msgSend(v4, "itemType"));

    if (v12) {
      BOOL v5 = [(NSSet *)self->_readableSetIdentifiers containsObject:v12];
    }
    else {
      BOOL v5 = 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[CCSetChangeXPCEventHandler sharedInstance];
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)CCSetChangeXPCListener;
  [(CCSetChangeXPCListener *)&v4 dealloc];
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<%@ %p> identifier: %@", objc_opt_class(), self, self->_identifier];

  return v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)handlerBlock
{
  return self->_handlerBlock;
}

- (id)batchHandlerBlock
{
  return self->_batchHandlerBlock;
}

- (CCSetChangeQueue)setChangeQueue
{
  return self->_setChangeQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setChangeQueue, 0);
  objc_storeStrong(&self->_batchHandlerBlock, 0);
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_readableSetIdentifiers, 0);

  objc_storeStrong((id *)&self->_listeningProcess, 0);
}

@end