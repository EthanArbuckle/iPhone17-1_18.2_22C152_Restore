@interface MPProtocolProxy
+ (id)proxyForObject:(id)a3 protocol:(id)a4;
+ (id)proxyForObjects:(id)a3 protocol:(id)a4;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSHashTable)objects;
- (Protocol)protocol;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setObjects:(id)a3;
- (void)setProtocol:(id)a3;
@end

@implementation MPProtocolProxy

- (id)methodSignatureForSelector:(SEL)a3
{
  if (a3 == a2)
  {
    v9 = 0;
  }
  else
  {
    v6 = [(MPProtocolProxy *)self protocol];
    types = protocol_getMethodDescription(v6, a3, 0, 1).types;

    if (types
      || ([(MPProtocolProxy *)self protocol],
          v8 = (Protocol *)objc_claimAutoreleasedReturnValue(),
          types = protocol_getMethodDescription(v8, a3, 1, 1).types,
          v8,
          types))
    {
      v9 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:types];
    }
    else
    {
      v9 = 0;
    }
  }
  return v9;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(MPProtocolProxy *)self objects];
  v6 = [v5 allObjects];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
        [v4 selector];
        if (objc_opt_respondsToSelector()) {
          [v4 invokeWithTarget:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (NSHashTable)objects
{
  return self->_objects;
}

+ (id)proxyForObjects:(id)a3 protocol:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)a1);
  uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  [v8 setObjects:v9];

  [v8 setProtocol:v7];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v16 = objc_msgSend(v8, "objects", (void)v18);
        [v16 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  return v8;
}

- (void)setProtocol:(id)a3
{
}

- (void)setObjects:(id)a3
{
}

+ (id)proxyForObject:(id)a3 protocol:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 arrayWithObjects:&v12 count:1];

  id v10 = objc_msgSend(a1, "proxyForObjects:protocol:", v9, v7, v12, v13);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);

  objc_storeStrong((id *)&self->_protocol, 0);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(MPProtocolProxy *)self objects];
  id v4 = [v3 allObjects];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_opt_respondsToSelector())
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

@end