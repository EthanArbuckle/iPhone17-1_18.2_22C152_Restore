@interface SGEKEventStoreProvider
+ (id)defaultEKStoreProvider;
- (SGEKEventStoreProvider)initWithNewEKEventStoreGetter:(id)a3 callBlockWithEKEventStoreForReading:(id)a4;
@end

@implementation SGEKEventStoreProvider

+ (id)defaultEKStoreProvider
{
  v2 = (void *)[objc_alloc((Class)a1) initWithNewEKEventStoreGetter:&__block_literal_global_4069 callBlockWithEKEventStoreForReading:&__block_literal_global_177];
  return v2;
}

- (SGEKEventStoreProvider)initWithNewEKEventStoreGetter:(id)a3 callBlockWithEKEventStoreForReading:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SGEKEventStoreProvider;
  v8 = [(SGEKEventStoreProvider *)&v14 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x1CB79B4C0](v6);
    id newEKEventStoreGetter = v8->_newEKEventStoreGetter;
    v8->_id newEKEventStoreGetter = (id)v9;

    uint64_t v11 = MEMORY[0x1CB79B4C0](v7);
    id callBlockWithEKEventStoreForReading = v8->_callBlockWithEKEventStoreForReading;
    v8->_id callBlockWithEKEventStoreForReading = (id)v11;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callBlockWithEKEventStoreForReading, 0);
  objc_storeStrong(&self->_newEKEventStoreGetter, 0);
}

uint64_t __48__SGEKEventStoreProvider_defaultEKStoreProvider__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E4F25550], "sg_usingSharedStoreForReadingOnly:", a2);
}

uint64_t __48__SGEKEventStoreProvider_defaultEKStoreProvider__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E4F25550], "sg_newStore");
}

@end