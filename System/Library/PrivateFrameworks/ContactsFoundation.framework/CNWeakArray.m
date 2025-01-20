@interface CNWeakArray
- (CNWeakArray)init;
- (NSArray)allObjects;
- (int64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3;
- (void)compact;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)setArray:(id)a3;
@end

@implementation CNWeakArray

- (CNWeakArray)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNWeakArray;
  v2 = [(CNWeakArray *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    storage = v2->_storage;
    v2->_storage = (NSPointerArray *)v3;

    v5 = v2;
  }

  return v2;
}

- (int64_t)count
{
  return [(NSPointerArray *)self->_storage count];
}

- (NSArray)allObjects
{
  return [(NSPointerArray *)self->_storage allObjects];
}

- (void)compact
{
}

- (void)addObject:(id)a3
{
}

- (void)removeObject:(id)a3
{
  id v5 = a3;
  if ([(NSPointerArray *)self->_storage count])
  {
    unint64_t v4 = 0;
    do
    {
      if ([(NSPointerArray *)self->_storage pointerAtIndex:v4] == v5) {
        [(NSPointerArray *)self->_storage replacePointerAtIndex:v4 withPointer:0];
      }
      ++v4;
    }
    while (v4 < [(NSPointerArray *)self->_storage count]);
  }
}

- (void)removeAllObjects
{
}

- (void)setArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CNWeakArray *)self removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CNWeakArray addObject:](self, "addObject:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSPointerArray *)self->_storage countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void).cxx_destruct
{
}

@end