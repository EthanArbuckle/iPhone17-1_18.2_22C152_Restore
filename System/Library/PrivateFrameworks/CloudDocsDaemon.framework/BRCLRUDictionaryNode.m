@interface BRCLRUDictionaryNode
- (BRCLRUDictionaryNode)initWithKey:(id)a3 object:(id)a4;
- (BRCLRUDictionaryNode)next;
- (BRCLRUDictionaryNode)prev;
- (id)copyWithZone:(_NSZone *)a3;
- (id)key;
- (id)object;
- (void)setNext:(id)a3;
- (void)setObject:(id)a3;
- (void)setPrev:(id)a3;
@end

@implementation BRCLRUDictionaryNode

- (BRCLRUDictionaryNode)initWithKey:(id)a3 object:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCLRUDictionaryNode;
  v9 = [(BRCLRUDictionaryNode *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_key, a3);
    objc_storeStrong(&v10->_object, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [BRCLRUDictionaryNode alloc];
  id key = self->_key;
  id object = self->_object;
  return [(BRCLRUDictionaryNode *)v4 initWithKey:key object:object];
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

- (BRCLRUDictionaryNode)next
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_next);
  return (BRCLRUDictionaryNode *)WeakRetained;
}

- (void)setNext:(id)a3
{
}

- (BRCLRUDictionaryNode)prev
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prev);
  return (BRCLRUDictionaryNode *)WeakRetained;
}

- (void)setPrev:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_prev);
  objc_destroyWeak((id *)&self->_next);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong(&self->_key, 0);
}

@end