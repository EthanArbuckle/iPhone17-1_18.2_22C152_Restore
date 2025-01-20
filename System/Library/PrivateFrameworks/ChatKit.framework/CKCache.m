@interface CKCache
- (CKCache)init;
- (NSMutableDictionary)dictionary;
- (id)objectForKey:(id)a3;
- (void)dealloc;
- (void)removeAllObjects;
- (void)setDictionary:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation CKCache

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKCache;
  [(CKCache *)&v4 dealloc];
}

- (CKCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKCache;
  v2 = [(CKCache *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(CKCache *)v2 setDictionary:v3];
    objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_removeAllObjects name:*MEMORY[0x1E4F43660] object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_removeAllObjects name:*MEMORY[0x1E4F43670] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel_removeAllObjects name:*MEMORY[0x1E4F43788] object:0];
  }
  return v2;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(CKCache *)self dictionary];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(CKCache *)self dictionary];
    [v8 setObject:v7 forKey:v6];
  }
}

- (void)removeAllObjects
{
  id v2 = [(CKCache *)self dictionary];
  [v2 removeAllObjects];
}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end