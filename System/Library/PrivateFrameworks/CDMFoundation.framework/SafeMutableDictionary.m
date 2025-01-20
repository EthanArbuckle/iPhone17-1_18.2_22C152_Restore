@interface SafeMutableDictionary
- (SafeMutableDictionary)init;
- (id)objectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation SafeMutableDictionary

- (void).cxx_destruct
{
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = self->dictionary;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)self->dictionary objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self->dictionary;
  objc_sync_enter(v7);
  [(NSMutableDictionary *)self->dictionary setObject:v8 forKeyedSubscript:v6];
  objc_sync_exit(v7);
}

- (SafeMutableDictionary)init
{
  v6.receiver = self;
  v6.super_class = (Class)SafeMutableDictionary;
  v2 = [(SafeMutableDictionary *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dictionary = v2->dictionary;
    v2->dictionary = v3;
  }
  return v2;
}

@end