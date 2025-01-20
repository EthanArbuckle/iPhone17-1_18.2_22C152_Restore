@interface _EFLRUCacheNode
- (_EFLRUCacheNode)initWithKey:(id)a3 element:(id)a4;
- (_EFLRUCacheNode)next;
- (_EFLRUCacheNode)previous;
- (id)element;
- (id)key;
- (void)setNext:(id)a3;
- (void)setPrevious:(id)a3;
@end

@implementation _EFLRUCacheNode

- (_EFLRUCacheNode)initWithKey:(id)a3 element:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_EFLRUCacheNode;
  v9 = [(_EFLRUCacheNode *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_key, a3);
    objc_storeStrong(&v10->_element, a4);
  }

  return v10;
}

- (void)setNext:(id)a3
{
  v4 = (_EFLRUCacheNode *)a3;
  id v7 = v4;
  if (v4 == self)
  {
    next = v4->_next;
    v4->_next = 0;
  }
  else
  {
    v5 = v4;
    next = self->_next;
    self->_next = v5;
  }
}

- (void)setPrevious:(id)a3
{
  v4 = (_EFLRUCacheNode *)a3;
  id v7 = v4;
  if (v4 == self)
  {
    previous = v4->_previous;
    v4->_previous = 0;
  }
  else
  {
    v5 = v4;
    previous = self->_previous;
    self->_previous = v5;
  }
}

- (id)element
{
  return self->_element;
}

- (id)key
{
  return self->_key;
}

- (_EFLRUCacheNode)previous
{
  return self->_previous;
}

- (_EFLRUCacheNode)next
{
  return self->_next;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong((id *)&self->_previous, 0);
  objc_storeStrong(&self->_key, 0);
  objc_storeStrong(&self->_element, 0);
}

@end