@interface CCUIAnimationBatch
- (CCUIAnimationBatch)init;
- (NSUUID)UUID;
- (void)addAnimation:(id)a3;
- (void)iterateAnimationsOfType:(Class)a3 withBlock:(id)a4;
- (void)iterateAnimationsWithBlock:(id)a3;
@end

@implementation CCUIAnimationBatch

- (CCUIAnimationBatch)init
{
  v8.receiver = self;
  v8.super_class = (Class)CCUIAnimationBatch;
  v2 = [(CCUIAnimationBatch *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    UUID = v2->_UUID;
    v2->_UUID = (NSUUID *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    animationsByParameters = v2->_animationsByParameters;
    v2->_animationsByParameters = v5;
  }
  return v2;
}

- (void)addAnimation:(id)a3
{
  id v6 = a3;
  v4 = [v6 parameters];
  id v5 = [(NSMutableDictionary *)self->_animationsByParameters objectForKey:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableDictionary *)self->_animationsByParameters setObject:v5 forKey:v4];
  }
  [v5 addObject:v6];
}

- (void)iterateAnimationsWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, void *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_animationsByParameters;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v11 = -[NSMutableDictionary objectForKey:](self->_animationsByParameters, "objectForKey:", v10, (void)v12);
        v4[2](v4, v10, v11);
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)iterateAnimationsOfType:(Class)a3 withBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__CCUIAnimationBatch_iterateAnimationsOfType_withBlock___block_invoke;
  v8[3] = &unk_1E6A8A2F0;
  id v9 = v6;
  Class v10 = a3;
  id v7 = v6;
  [(CCUIAnimationBatch *)self iterateAnimationsWithBlock:v8];
}

void __56__CCUIAnimationBatch_iterateAnimationsOfType_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_animationsByParameters, 0);
}

@end