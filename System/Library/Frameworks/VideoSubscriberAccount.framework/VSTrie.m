@interface VSTrie
- (VSTrie)init;
- (VSTrieNode)root;
- (id)objectsMatchingPrefix:(id)a3;
- (void)insertString:(id)a3 withAssociatedObject:(id)a4;
- (void)setRoot:(id)a3;
@end

@implementation VSTrie

- (VSTrie)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSTrie;
  v2 = [(VSTrie *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(VSTrieNode);
    root = v2->_root;
    v2->_root = v3;
  }
  return v2;
}

- (void)insertString:(id)a3 withAssociatedObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  id v16 = [(VSTrie *)self root];
  uint64_t v8 = [v6 length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__VSTrie_insertString_withAssociatedObject___block_invoke;
  v10[3] = &unk_1E6BD30D8;
  v10[4] = &v11;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v10);
  v9 = [(id)v12[5] objects];
  [v9 addObject:v7];

  _Block_object_dispose(&v11, 8);
}

void __44__VSTrie_insertString_withAssociatedObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The substring parameter must not be nil."];
  }
  id v9 = v3;
  v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) next];
  v5 = [v4 objectForKey:v9];

  if (!v5)
  {
    v5 = objc_alloc_init(VSTrieNode);
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) next];
    if (!v5) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The nextNode parameter must not be nil."];
    }
    [v6 setObject:v5 forKey:v9];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (id)objectsMatchingPrefix:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  id v15 = [(VSTrie *)self root];
  uint64_t v5 = [v4 length];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__VSTrie_objectsMatchingPrefix___block_invoke;
  v9[3] = &unk_1E6BD30D8;
  v9[4] = &v10;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v9);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = (void *)v11[5];
  if (v7) {
    VSTrieWalkNodes(v7, v6);
  }
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __32__VSTrie_objectsMatchingPrefix___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, BOOL *a7)
{
  id v15 = a2;
  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) next];
  id v10 = v15;
  uint64_t v11 = (void *)v9;
  if (!v15)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The substring parameter must not be nil."];
    id v10 = 0;
  }
  uint64_t v12 = [v11 objectForKey:v10];
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  *a7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) == 0;
}

- (VSTrieNode)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
}

- (void).cxx_destruct
{
}

@end