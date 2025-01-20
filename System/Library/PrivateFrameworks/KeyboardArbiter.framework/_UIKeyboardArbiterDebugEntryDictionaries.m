@interface _UIKeyboardArbiterDebugEntryDictionaries
+ (id)entryWithDictionaries:(id)a3;
- (int)importance;
- (void)enumerateContents:(id)a3;
@end

@implementation _UIKeyboardArbiterDebugEntryDictionaries

+ (id)entryWithDictionaries:(id)a3
{
  id v5 = a3;
  v6 = (id *)objc_alloc_init((Class)a1);
  v7 = v6;
  if (v6) {
    objc_storeStrong(v6 + 2, a3);
  }

  return v7;
}

- (int)importance
{
  return 100;
}

- (void)enumerateContents:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIKeyboardArbiterDebugEntryDictionaries;
  [(_UIKeyboardArbiterDebugEntry *)&v14 enumerateContents:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_dictionaries;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end