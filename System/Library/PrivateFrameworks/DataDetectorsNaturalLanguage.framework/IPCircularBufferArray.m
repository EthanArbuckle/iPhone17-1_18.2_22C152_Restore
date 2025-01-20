@interface IPCircularBufferArray
- (IPCircularBufferArray)initWithCapacity:(unint64_t)a3;
- (NSArray)allObjects;
- (id)lastObject;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3 completionHandler:(id)a4;
- (void)removeAllObjects;
@end

@implementation IPCircularBufferArray

- (IPCircularBufferArray)initWithCapacity:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IPCircularBufferArray;
  v4 = [(IPCircularBufferArray *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_capacity = a3;
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a3];
    backingStore = v5->_backingStore;
    v5->_backingStore = (NSMutableArray *)v6;

    v5->_currentIndex = 0;
  }
  return v5;
}

- (void)addObject:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  objc_super v9 = (void (**)(id, void *))a4;
  if ([(NSMutableArray *)self->_backingStore count] >= self->_capacity)
  {
    if (v9)
    {
      v7 = [(NSMutableArray *)self->_backingStore objectAtIndexedSubscript:self->_currentIndex];
    }
    else
    {
      v7 = 0;
    }
    [(NSMutableArray *)self->_backingStore setObject:v6 atIndexedSubscript:self->_currentIndex];
    self->_currentIndex = (self->_currentIndex + 1) % self->_capacity;
    if (v9) {
      v9[2](v9, v7);
    }
  }
  else
  {
    [(NSMutableArray *)self->_backingStore addObject:v6];
    if (v9) {
      v9[2](v9, 0);
    }
  }
  id lastObject = self->_lastObject;
  ++self->_mutationDetector;
  self->_id lastObject = v6;
}

- (id)lastObject
{
  v2 = (void *)[self->_lastObject copy];
  return v2;
}

- (NSArray)allObjects
{
  p_backingStore = &self->_backingStore;
  backingStore = self->_backingStore;
  v4 = p_backingStore[1];
  if (v4)
  {
    id v6 = -[NSMutableArray subarrayWithRange:](backingStore, "subarrayWithRange:", v4, self->_capacity - (void)v4);
    v7 = -[NSMutableArray subarrayWithRange:](self->_backingStore, "subarrayWithRange:", 0, self->_currentIndex);
    v8 = [v6 arrayByAddingObjectsFromArray:v7];
  }
  else
  {
    v8 = (void *)[(NSMutableArray *)backingStore copy];
  }
  return (NSArray *)v8;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v5 = a5;
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    a3->var2 = &self->_mutationDetector;
  }
  if (var0 + a5 > [(NSMutableArray *)self->_backingStore count]) {
    unint64_t v5 = [(NSMutableArray *)self->_backingStore count] - a3->var0;
  }
  a3->var1 = a4;
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
      a4[i] = (id)[(NSMutableArray *)self->_backingStore objectAtIndexedSubscript:(i + self->_currentIndex + a3->var0) % self->_capacity];
  }
  a3->var0 += v5;
  return v5;
}

- (void)removeAllObjects
{
  self->_currentIndex = 0;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_backingStore count];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastObject, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

@end