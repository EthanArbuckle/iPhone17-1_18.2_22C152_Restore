@interface CPLRUDictionaryNode
- (CPLRUDictionaryNode)initWithKey:(id)a3 object:(id)a4;
- (id)key;
- (id)object;
- (void)dealloc;
- (void)setObject:(id)a3;
@end

@implementation CPLRUDictionaryNode

- (CPLRUDictionaryNode)initWithKey:(id)a3 object:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CPLRUDictionaryNode;
  v6 = [(CPLRUDictionaryNode *)&v8 init];
  if (v6)
  {
    v6->_key = a3;
    v6->_object = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CPLRUDictionaryNode;
  [(CPLRUDictionaryNode *)&v3 dealloc];
}

- (id)key
{
  return self->_key;
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

@end