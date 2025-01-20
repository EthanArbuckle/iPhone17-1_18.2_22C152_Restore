@interface CKVOBlockHelper
- (CKVOBlockHelper)initWithObject:(id)a3;
- (NSMutableDictionary)tokensByContext;
- (id)allKVOObservers;
- (id)debugDescription;
- (id)insertNewTokenForKeyPath:(id)a3 block:(id)a4;
- (id)observedObject;
- (int64_t)nextIdentifier;
- (void)dealloc;
- (void)dump;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeHandlerForKey:(id)a3;
- (void)setNextIdentifier:(int64_t)a3;
@end

@implementation CKVOBlockHelper

- (CKVOBlockHelper)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKVOBlockHelper;
  v5 = [(CKVOBlockHelper *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_observedObject, v4);
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(CKVOBlockHelper *)self observedObject];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(NSMutableDictionary *)self->_tokensByContext allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 context];
        v11 = [v9 keypath];
        [v3 removeObserver:self forKeyPath:v11 context:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v12.receiver = self;
  v12.super_class = (Class)CKVOBlockHelper;
  [(CKVOBlockHelper *)&v12 dealloc];
}

- (id)debugDescription
{
  v3 = [(CKVOBlockHelper *)self observedObject];
  id v4 = NSString;
  uint64_t v5 = [(CKVOBlockHelper *)self description];
  uint64_t v6 = [(CKVOBlockHelper *)self tokensByContext];
  id v7 = v3;
  objc_super v8 = [v4 stringWithFormat:@"%@ (%@, %@, %@)", v5, v7, v6, objc_msgSend(v7, "observationInfo")];

  return v8;
}

- (void)dump
{
  v3 = [(CKVOBlockHelper *)self observedObject];
  puts("*******************************************************");
  id v4 = [(CKVOBlockHelper *)self description];
  puts((const char *)[v4 UTF8String]);

  printf("\tObserved Object: %p\n", v3);
  puts("\tKeys:");
  [(NSMutableDictionary *)self->_tokensByContext enumerateKeysAndObjectsUsingBlock:&__block_literal_global_4];
  id v6 = v3;
  objc_msgSend((id)objc_msgSend(v6, "observationInfo"), "description");
  id v5 = objc_claimAutoreleasedReturnValue();
  printf("\tObservationInfo: %s\n", (const char *)[v5 UTF8String]);
}

void __23__CKVOBlockHelper_dump__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 description];
  printf("\t\t%s\n", (const char *)[v2 UTF8String]);
}

- (id)allKVOObservers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  tokensByContext = self->_tokensByContext;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__CKVOBlockHelper_allKVOObservers__block_invoke;
  v7[3] = &unk_1E689EC10;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)tokensByContext enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

uint64_t __34__CKVOBlockHelper_allKVOObservers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)removeHandlerForKey:(id)a3
{
  tokensByContext = self->_tokensByContext;
  id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(a3, "index"));
  [(NSMutableDictionary *)tokensByContext removeObjectForKey:v5];

  if (![(NSMutableDictionary *)self->_tokensByContext count])
  {
    id v6 = self->_tokensByContext;
    self->_tokensByContext = 0;
  }
}

- (id)insertNewTokenForKeyPath:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [CKVOToken alloc];
  int64_t v9 = [(CKVOBlockHelper *)self nextIdentifier] + 1;
  [(CKVOBlockHelper *)self setNextIdentifier:v9];
  uint64_t v10 = [(CKVOToken *)v8 initWithKeyPath:v7 index:v9 block:v6];

  tokensByContext = self->_tokensByContext;
  if (!tokensByContext)
  {
    objc_super v12 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v13 = self->_tokensByContext;
    self->_tokensByContext = v12;

    tokensByContext = self->_tokensByContext;
  }
  long long v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[CKVOToken index](v10, "index"));
  [(NSMutableDictionary *)tokensByContext setObject:v10 forKeyedSubscript:v14];

  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = [MEMORY[0x1E4F28ED0] numberWithInteger:a6];
  long long v14 = [(NSMutableDictionary *)self->_tokensByContext objectForKeyedSubscript:v13];
  long long v15 = v14;
  if (v14)
  {
    uint64_t v16 = [v14 block];
    (*(void (**)(uint64_t, id, id, id))(v16 + 16))(v16, v10, v11, v12);
  }
  else
  {
    uint64_t v16 = LogCategory_Unspecified();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      -[CKVOBlockHelper observeValueForKeyPath:ofObject:change:context:]((uint64_t)v13, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

- (id)observedObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_observedObject);
  return WeakRetained;
}

- (NSMutableDictionary)tokensByContext
{
  return self->_tokensByContext;
}

- (int64_t)nextIdentifier
{
  return self->_nextIdentifier;
}

- (void)setNextIdentifier:(int64_t)a3
{
  self->_nextIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokensByContext, 0);
  objc_destroyWeak(&self->_observedObject);
}

- (void)observeValueForKeyPath:(uint64_t)a3 ofObject:(uint64_t)a4 change:(uint64_t)a5 context:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end