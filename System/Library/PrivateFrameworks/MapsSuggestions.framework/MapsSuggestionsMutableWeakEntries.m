@interface MapsSuggestionsMutableWeakEntries
- (MapsSuggestionsMutableWeakEntries)init;
- (MapsSuggestionsMutableWeakEntries)initWithEntries:(id)a3;
- (NSArray)strongArray;
- (unint64_t)count;
- (void)addWeakObject:(id)a3;
@end

@implementation MapsSuggestionsMutableWeakEntries

- (void).cxx_destruct
{
}

- (MapsSuggestionsMutableWeakEntries)initWithEntries:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MapsSuggestionsMutableWeakEntries *)self init];
  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          -[MapsSuggestionsMutableWeakEntries addWeakObject:](v5, "addWeakObject:", *(void *)(*((void *)&v12 + 1) + 8 * v9++), (void)v12);
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [(NSPointerArray *)v5->_array compact];
    v5->_dirty = 0;
    v10 = v5;
  }

  return v5;
}

- (MapsSuggestionsMutableWeakEntries)init
{
  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsMutableWeakEntries;
  v2 = [(MapsSuggestionsMutableWeakEntries *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    array = v2->_array;
    v2->_array = (NSPointerArray *)v3;

    v2->_dirty = 0;
    v5 = v2;
  }

  return v2;
}

- (void)addWeakObject:(id)a3
{
  self->_dirty = 1;
}

- (unint64_t)count
{
  if (self->_dirty)
  {
    [(NSPointerArray *)self->_array compact];
    self->_dirty = 0;
  }
  array = self->_array;
  return [(NSPointerArray *)array count];
}

- (NSArray)strongArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[MapsSuggestionsMutableWeakEntries count](self, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_array;
  uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        if (*(void *)(*((void *)&v10 + 1) + 8 * i)) {
          [v3 addObject:(void)v10];
        }
      }
      uint64_t v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return (NSArray *)v8;
}

@end