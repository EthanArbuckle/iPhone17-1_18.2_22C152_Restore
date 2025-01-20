@interface MIDIUMPEndpointManager
+ (MIDIUMPEndpointManager)sharedInstance;
+ (id)description;
- (BOOL)postNotificationName:(id)a3 endpoint:(id)a4 functionBlock:(id)a5;
- (BOOL)removeEndpoint:(unsigned int)a3;
- (BOOL)removeFunctionBlock:(unsigned int)a3;
- (MIDIUMPEndpointManager)init;
- (NSArray)UMPEndpoints;
- (NSMutableArray)functionBlocks;
- (id)findEndpoint:(unsigned int)a3;
- (id)findFunctionBlock:(unsigned int)a3;
- (void)addEndpoint:(id)a3;
- (void)addFunctionBlock:(id)a3;
- (void)setFunctionBlocks:(id)a3;
- (void)updateEndpoint:(unsigned int)a3 description:(id)a4;
- (void)updateFunctionBlock:(unsigned int)a3 description:(id)a4;
@end

@implementation MIDIUMPEndpointManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoints, 0);

  objc_storeStrong((id *)&self->_functionBlocks, 0);
}

- (void)setFunctionBlocks:(id)a3
{
}

- (NSMutableArray)functionBlocks
{
  return self->_functionBlocks;
}

- (void)updateEndpoint:(unsigned int)a3 description:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  v6 = [(MIDIUMPEndpointManager *)self findEndpoint:v4];
  v7 = v6;
  if (v6 && [v6 deserialize:v8]) {
    [(MIDIUMPEndpointManager *)self postNotificationName:@"MIDIUMPEndpointWasUpdatedNotification" endpoint:v7 functionBlock:0];
  }
}

- (BOOL)removeEndpoint:(unsigned int)a3
{
  uint64_t v4 = [(MIDIUMPEndpointManager *)self findEndpoint:*(void *)&a3];
  if (v4)
  {
    [(NSMutableArray *)self->_endpoints removeObject:v4];
    [(MIDIUMPEndpointManager *)self postNotificationName:@"MIDIUMPEndpointWasRemovedNotification" endpoint:v4 functionBlock:0];
  }

  return v4 != 0;
}

- (void)addEndpoint:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[MIDIUMPEndpointManager findEndpoint:](self, "findEndpoint:", [v5 objectRef]);

  if (!v4)
  {
    [(NSMutableArray *)self->_endpoints addObject:v5];
    [(MIDIUMPEndpointManager *)self postNotificationName:@"MIDIUMPEndpointWasAddedNotification" endpoint:v5 functionBlock:0];
  }
}

- (id)findEndpoint:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_endpoints;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "objectRef", (void)v11) == a3)
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (void)updateFunctionBlock:(unsigned int)a3 description:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v9 = a4;
  uint64_t v6 = [(MIDIUMPEndpointManager *)self findFunctionBlock:v4];
  v7 = v6;
  if (v6 && [v6 deserialize:v9])
  {
    id v8 = [v7 UMPEndpoint];
    [(MIDIUMPEndpointManager *)self postNotificationName:@"MIDIUMPFunctionBlockWasUpdatedNotification" endpoint:v8 functionBlock:v7];
  }
}

- (BOOL)removeFunctionBlock:(unsigned int)a3
{
  uint64_t v4 = [(MIDIUMPEndpointManager *)self findFunctionBlock:*(void *)&a3];
  if (v4) {
    [(NSMutableArray *)self->_functionBlocks removeObject:v4];
  }

  return v4 != 0;
}

- (void)addFunctionBlock:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[MIDIUMPEndpointManager findFunctionBlock:](self, "findFunctionBlock:", [v5 objectRef]);

  if (!v4) {
    [(NSMutableArray *)self->_functionBlocks addObject:v5];
  }
}

- (id)findFunctionBlock:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_functionBlocks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "objectRef", (void)v11) == a3)
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)postNotificationName:(id)a3 endpoint:(id)a4 functionBlock:(id)a5
{
  id v8 = a3;
  unint64_t v9 = (unint64_t)a4;
  unint64_t v10 = (unint64_t)a5;
  if (v9 | v10)
  {
    long long v11 = objc_opt_new();
    long long v12 = v11;
    if (v9) {
      [v11 setValue:v9 forKey:@"MIDIUMPEndpointObjectKey"];
    }
    if (v10) {
      [v12 setValue:v10 forKey:@"MIDIUMPFunctionBlockObjectKey"];
    }
    long long v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:v8 object:self userInfo:v12];
  }
  return (v9 | v10) != 0;
}

- (NSArray)UMPEndpoints
{
  v2 = (void *)[(NSMutableArray *)self->_endpoints copy];

  return (NSArray *)v2;
}

- (MIDIUMPEndpointManager)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)MIDIUMPEndpointManager;
  v2 = [(MIDIUMPEndpointManager *)&v19 init];
  if (v2)
  {
    id v18 = 0;
    if (!UMPCIGlobalState((MIDIServer *)&v18))
    {
      v3 = [v18 objectForKey:@"ump_endpoints"];
      uint64_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v15;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v15 != v7) {
              objc_enumerationMutation(v5);
            }
            id v9 = *(id *)(*((void *)&v14 + 1) + 8 * v8);
            unint64_t v10 = [MIDIUMPEndpoint alloc];
            long long v11 = -[MIDIUMPEndpoint initWithDescription:](v10, "initWithDescription:", v9, (void)v14);
            [(NSMutableArray *)v4 addObject:v11];

            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
        }
        while (v6);
      }

      endpoints = v2->_endpoints;
      v2->_endpoints = v4;
    }
  }
  return v2;
}

+ (MIDIUMPEndpointManager)sharedInstance
{
  if (+[MIDIUMPEndpointManager sharedInstance]::onceToken != -1) {
    dispatch_once(&+[MIDIUMPEndpointManager sharedInstance]::onceToken, &__block_literal_global_951);
  }
  v2 = (void *)+[MIDIUMPEndpointManager sharedInstance]::theInstance;

  return (MIDIUMPEndpointManager *)v2;
}

uint64_t __40__MIDIUMPEndpointManager_sharedInstance__block_invoke(UMPCIClients *a1)
{
  UMPCIClients::instance(a1);
  +[MIDIUMPEndpointManager sharedInstance]::theInstance = objc_alloc_init(MIDIUMPEndpointManager);

  return MEMORY[0x1F41817F8]();
}

+ (id)description
{
  return @"MIDI UMP Endpoint Pair Manager";
}

@end