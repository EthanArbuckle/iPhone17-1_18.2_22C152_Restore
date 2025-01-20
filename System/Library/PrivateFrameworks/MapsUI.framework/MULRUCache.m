@interface MULRUCache
- (MULRUCache)initWithMaxSize:(unint64_t)a3;
- (MULRUCacheDelegate)delegate;
- (NSArray)orderedKeys;
- (NSArray)orderedValues;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)maxSize;
- (void)removeObjectForKey:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation MULRUCache

- (MULRUCache)initWithMaxSize:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MULRUCache;
  v4 = [(MULRUCache *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_maxSize = a3;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    keys = v5->_keys;
    v5->_keys = (NSMutableArray *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    values = v5->_values;
    v5->_values = (NSMutableArray *)v8;
  }
  return v5;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_values count];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSMutableArray *)self->_keys indexOfObject:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v7 = v5, v5 >= [(NSMutableArray *)self->_values count]))
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(NSMutableArray *)self->_values objectAtIndexedSubscript:v7];
    [(NSMutableArray *)self->_values removeObjectAtIndex:v7];
    [(NSMutableArray *)self->_keys removeObjectAtIndex:v7];
    [(NSMutableArray *)self->_values insertObject:v6 atIndex:0];
    [(NSMutableArray *)self->_keys insertObject:v4 atIndex:0];
  }

  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  if (a3)
  {
    id v4 = -[MULRUCache objectForKey:](self, "objectForKey:");
    if (v4)
    {
      id v5 = v4;
      [(NSMutableArray *)self->_keys removeObjectAtIndex:0];
      [(NSMutableArray *)self->_values removeObjectAtIndex:0];
      id v4 = v5;
    }
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v12 && v6)
  {
    unint64_t v7 = [(MULRUCache *)self objectForKey:v6];
    values = self->_values;
    if (v7)
    {
      [(NSMutableArray *)values removeObjectAtIndex:0];
    }
    else
    {
      while ([(NSMutableArray *)values count] >= self->_maxSize)
      {
        v9 = [(MULRUCache *)self delegate];
        v10 = [(NSMutableArray *)self->_values lastObject];
        objc_super v11 = [(NSMutableArray *)self->_keys lastObject];
        [v9 lruCache:self willEvictObject:v10 forKey:v11];

        [(NSMutableArray *)self->_keys removeLastObject];
        [(NSMutableArray *)self->_values removeLastObject];
        values = self->_values;
      }
      [(NSMutableArray *)self->_keys insertObject:v6 atIndex:0];
    }
    [(NSMutableArray *)self->_values insertObject:v12 atIndex:0];
  }
}

- (NSArray)orderedKeys
{
  v2 = (void *)[(NSMutableArray *)self->_keys copy];
  return (NSArray *)v2;
}

- (NSArray)orderedValues
{
  v2 = (void *)[(NSMutableArray *)self->_values copy];
  return (NSArray *)v2;
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (MULRUCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MULRUCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end