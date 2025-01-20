@interface CKLRUCache
- (CKLRUCache)initWithMaximumCapacity:(unint64_t)a3;
- (void)dealloc;
@end

@implementation CKLRUCache

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKLRUCache;
  [(CPLRUDictionary *)&v4 dealloc];
}

- (CKLRUCache)initWithMaximumCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKLRUCache;
  v3 = [(CPLRUDictionary *)&v8 initWithMaximumCapacity:a3];
  if (v3)
  {
    objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_removeAllObjects name:*MEMORY[0x1E4F43660] object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v3 selector:sel_removeAllObjects name:*MEMORY[0x1E4F43670] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel_removeAllObjects name:*MEMORY[0x1E4F43788] object:0];
  }
  return v3;
}

@end