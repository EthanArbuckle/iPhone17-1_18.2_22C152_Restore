@interface IKJSEventListenerObject
- (BOOL)_searchEventListener:(id)a3 key:(id)a4 destroy:(BOOL)a5;
- (BOOL)invokeListeners:(id)a3 extraInfo:(id)a4;
- (BOOL)invokeMethod:(id)a3 withArguments:(id)a4 thenDispatchEvent:(id)a5 extraInfo:(id)a6;
- (BOOL)invokeSingleListener:(id)a3 extraInfo:(id)a4 return:(id *)a5;
- (NSMutableDictionary)eventListenersMap;
- (id)_eventInformationForType:(id)a3 extraInfo:(id)a4;
- (void)addEventListener:(id)a3 :(id)a4 :(id)a5;
- (void)removeEventListener:(id)a3 :(id)a4;
- (void)setEventListenersMap:(id)a3;
@end

@implementation IKJSEventListenerObject

- (void)addEventListener:(id)a3 :(id)a4 :(id)a5
{
  id v15 = a3;
  id v7 = a4;
  uint64_t v8 = [v15 length];
  if (v7
    && v8
    && ![(IKJSEventListenerObject *)self _searchEventListener:v7 key:v15 destroy:0])
  {
    v9 = [(IKJSObject *)self appContext];
    v10 = [v9 jsContext];
    v11 = [v10 virtualMachine];

    v12 = [MEMORY[0x1E4F30928] managedValueWithValue:v7];
    [v11 addManagedReference:v12 withOwner:self];
    v13 = [(IKJSEventListenerObject *)self eventListenersMap];
    if (!v13)
    {
      v13 = [MEMORY[0x1E4F1CA60] dictionary];
      [(IKJSEventListenerObject *)self setEventListenersMap:v13];
    }
    v14 = [v13 objectForKey:v15];
    if (!v14)
    {
      v14 = [MEMORY[0x1E4F1CA48] array];
      [v13 setObject:v14 forKey:v15];
    }
    [v14 addObject:v12];
  }
}

- (void)removeEventListener:(id)a3 :(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [v8 length];
  if (v6 && v7) {
    [(IKJSEventListenerObject *)self _searchEventListener:v6 key:v8 destroy:1];
  }
}

- (BOOL)_searchEventListener:(id)a3 key:(id)a4 destroy:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = [(IKJSEventListenerObject *)self eventListenersMap];
  v11 = [v10 objectForKey:v9];

  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __60__IKJSEventListenerObject__searchEventListener_key_destroy___block_invoke;
  v24 = &unk_1E6DE6AB0;
  id v12 = v8;
  id v25 = v12;
  v26 = &v27;
  [v11 enumerateObjectsUsingBlock:&v21];
  uint64_t v13 = v28[3];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL && v5)
  {
    id v15 = [(IKJSObject *)self appContext];
    v16 = [v15 jsContext];
    v17 = [v16 virtualMachine];

    v18 = [v11 objectAtIndex:v28[3]];
    [v17 removeManagedReference:v18 withOwner:self];

    [v11 removeObjectAtIndex:v28[3]];
    uint64_t v13 = v28[3];
  }
  BOOL v19 = v13 != 0x7FFFFFFFFFFFFFFFLL;

  _Block_object_dispose(&v27, 8);
  return v19;
}

void __60__IKJSEventListenerObject__searchEventListener_key_destroy___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 value];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (BOOL)invokeListeners:(id)a3 extraInfo:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(NSMutableDictionary *)self->_eventListenersMap objectForKey:v6];
  if (v8)
  {
    id v21 = v7;
    id v9 = [(IKJSEventListenerObject *)self _eventInformationForType:v6 extraInfo:v7];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    BOOL v20 = v11 != 0;
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [*(id *)(*((void *)&v22 + 1) + 8 * i) value];
          v26 = v9;
          v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
          id v17 = (id)[v15 callWithArguments:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v12);
    }

    id v7 = v21;
    BOOL v18 = v20;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)invokeSingleListener:(id)a3 extraInfo:(id)a4 return:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1E4F30938];
  uint64_t v11 = [(IKJSObject *)self appContext];
  uint64_t v12 = [v11 jsContext];
  uint64_t v13 = [v10 valueWithUndefinedInContext:v12];

  v14 = [(NSMutableDictionary *)self->_eventListenersMap objectForKey:v8];
  id v15 = [v14 lastObject];

  if (v15)
  {
    v16 = [(IKJSEventListenerObject *)self _eventInformationForType:v8 extraInfo:v9];
    id v17 = [v15 value];
    v21[0] = v16;
    BOOL v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    uint64_t v19 = [v17 callWithArguments:v18];

    uint64_t v13 = (void *)v19;
  }
  if (a5) {
    *a5 = v13;
  }

  return v15 != 0;
}

- (BOOL)invokeMethod:(id)a3 withArguments:(id)a4 thenDispatchEvent:(id)a5 extraInfo:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = [(IKJSObject *)self invokeMethod:a3 withArguments:a4];
  LOBYTE(a4) = [(IKJSEventListenerObject *)self invokeListeners:v11 extraInfo:v10];

  return (char)a4;
}

- (id)_eventInformationForType:(id)a3 extraInfo:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  id v9 = (void *)[[v7 alloc] initWithCapacity:3];
  [v9 setObject:v8 forKey:@"type"];

  [v9 setObject:self forKey:@"target"];
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  [v9 setObject:v10 forKey:@"timeStamp"];

  if (v6) {
    [v9 addEntriesFromDictionary:v6];
  }
  id v11 = (void *)[v9 copy];

  return v11;
}

- (NSMutableDictionary)eventListenersMap
{
  return self->_eventListenersMap;
}

- (void)setEventListenersMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end