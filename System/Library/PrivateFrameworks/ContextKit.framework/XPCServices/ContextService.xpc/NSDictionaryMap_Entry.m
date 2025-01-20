@interface NSDictionaryMap_Entry
- (NSDictionaryMap_Entry)initWithDictionary:(id)a3 key:(id)a4;
- (id)getKey;
- (id)getValue;
- (id)setValueWithId:(id)a3;
- (void)dealloc;
@end

@implementation NSDictionaryMap_Entry

- (NSDictionaryMap_Entry)initWithDictionary:(id)a3 key:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NSDictionaryMap_Entry;
  v6 = [(NSDictionaryMap_Entry *)&v8 init];
  if (v6)
  {
    v6->dictionary_ = (NSMutableDictionary *)a3;
    v6->key_ = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSDictionaryMap_Entry;
  [(NSDictionaryMap_Entry *)&v3 dealloc];
}

- (id)getKey
{
  return self->key_;
}

- (id)getValue
{
  return [(NSMutableDictionary *)self->dictionary_ objectForKey:self->key_];
}

- (id)setValueWithId:(id)a3
{
  id v5 = [(NSMutableDictionary *)self->dictionary_ objectForKey:self->key_];
  [(NSMutableDictionary *)self->dictionary_ setObject:a3 forKey:self->key_];
  return v5;
}

@end