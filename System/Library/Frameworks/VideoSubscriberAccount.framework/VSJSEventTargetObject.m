@interface VSJSEventTargetObject
- (NSMutableDictionary)listeners;
- (VSJSEventTargetObject)initWithContext:(id)a3;
- (unint64_t)_indexForListener:(id)a3 withEventType:(id)a4;
- (void)addEventListener:(id)a3 :(id)a4 :(id)a5;
- (void)dispatchEvent:(id)a3 withInfo:(id)a4;
- (void)removeEventListener:(id)a3 :(id)a4;
- (void)setListeners:(id)a3;
@end

@implementation VSJSEventTargetObject

- (VSJSEventTargetObject)initWithContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VSJSEventTargetObject;
  v3 = [(VSJSObject *)&v7 initWithContext:a3];
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    listeners = v3->_listeners;
    v3->_listeners = v4;
  }
  return v3;
}

- (void)addEventListener:(id)a3 :(id)a4 :(id)a5
{
  id v14 = a3;
  id v7 = a4;
  if ([v14 length]
    && [(VSJSEventTargetObject *)self _indexForListener:v7 withEventType:v14] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = [MEMORY[0x1E4F30920] currentContext];
    v9 = [v8 virtualMachine];

    v10 = [MEMORY[0x1E4F30928] managedValueWithValue:v7];
    [v9 addManagedReference:v10 withOwner:self];
    v11 = [(VSJSEventTargetObject *)self listeners];
    id v12 = [v11 objectForKeyedSubscript:v14];

    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v13 = [(VSJSEventTargetObject *)self listeners];
      [v13 setObject:v12 forKeyedSubscript:v14];
    }
    [v12 addObject:v10];
  }
}

- (void)removeEventListener:(id)a3 :(id)a4
{
  id v15 = a3;
  unint64_t v6 = -[VSJSEventTargetObject _indexForListener:withEventType:](self, "_indexForListener:withEventType:", a4);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = v6;
    v8 = [(VSJSEventTargetObject *)self listeners];
    v9 = [v8 objectForKeyedSubscript:v15];
    v10 = [v9 objectAtIndex:v7];

    v11 = [(VSJSEventTargetObject *)self listeners];
    id v12 = [v11 objectForKeyedSubscript:v15];
    [v12 removeObjectAtIndex:v7];

    v13 = [MEMORY[0x1E4F30920] currentContext];
    id v14 = [v13 virtualMachine];

    [v14 removeManagedReference:v10 withOwner:self];
  }
}

- (void)dispatchEvent:(id)a3 withInfo:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(VSJSEventTargetObject *)self listeners];
  v9 = [v8 objectForKeyedSubscript:v6];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14), "value", (void)v18);
        id v22 = v7;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
        id v17 = (id)[v15 callWithArguments:v16];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v12);
  }
}

- (unint64_t)_indexForListener:(id)a3 withEventType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = [(VSJSEventTargetObject *)self listeners];
  v9 = [v8 objectForKeyedSubscript:v7];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__VSJSEventTargetObject__indexForListener_withEventType___block_invoke;
  v13[3] = &unk_1E6BD2900;
  id v10 = v6;
  id v14 = v10;
  id v15 = &v16;
  [v9 enumerateObjectsUsingBlock:v13];
  unint64_t v11 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __57__VSJSEventTargetObject__indexForListener_withEventType___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 value];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (NSMutableDictionary)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (void).cxx_destruct
{
}

@end