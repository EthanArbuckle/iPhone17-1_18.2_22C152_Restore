@interface BBMaskedSet
- (BBMaskedSet)initWithMaskBits:(unint64_t)a3;
- (NSMutableArray)maskObjectSets;
- (id)allObjects;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsForMask:(unint64_t)a3;
- (void)_executeUsingMask:(unint64_t)a3 block:(id)a4;
- (void)addObject:(id)a3 withMask:(unint64_t)a4;
- (void)removeObject:(id)a3;
- (void)setMaskObjectSets:(id)a3;
@end

@implementation BBMaskedSet

- (BBMaskedSet)initWithMaskBits:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BBMaskedSet;
  v4 = [(BBMaskedSet *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_maskBits = a3;
    v6 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
    [(BBMaskedSet *)v5 setMaskObjectSets:v6];

    if (v5->_maskBits)
    {
      unint64_t v7 = 0;
      do
      {
        maskObjectSets = v5->_maskObjectSets;
        v9 = [MEMORY[0x263EFF9C0] set];
        [(NSMutableArray *)maskObjectSets setObject:v9 atIndexedSubscript:v7];

        ++v7;
      }
      while (v7 < v5->_maskBits);
    }
  }
  return v5;
}

- (void)addObject:(id)a3 withMask:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__BBMaskedSet_addObject_withMask___block_invoke;
  v8[3] = &unk_2642971F0;
  id v9 = v6;
  id v7 = v6;
  [(BBMaskedSet *)self _executeUsingMask:a4 block:v8];
}

uint64_t __34__BBMaskedSet_addObject_withMask___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (void)removeObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_maskObjectSets;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "removeObject:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)allObjects
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_maskObjectSets;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "unionSet:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v9 = (void *)[v3 copy];
  return v9;
}

- (id)objectsForMask:(unint64_t)a3
{
  uint64_t v5 = [MEMORY[0x263EFF9C0] set];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __30__BBMaskedSet_objectsForMask___block_invoke;
  v9[3] = &unk_2642971F0;
  id v10 = v5;
  id v6 = v5;
  [(BBMaskedSet *)self _executeUsingMask:a3 block:v9];
  uint64_t v7 = (void *)[v6 copy];

  return v7;
}

uint64_t __30__BBMaskedSet_objectsForMask___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) unionSet:a2];
}

- (id)objectAtIndex:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->_maskObjectSets objectAtIndex:a3];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void)_executeUsingMask:(unint64_t)a3 block:(id)a4
{
  id v10 = (void (**)(id, void *))a4;
  unint64_t maskBits = self->_maskBits;
  if (maskBits)
  {
    for (unint64_t i = 0; i < maskBits; ++i)
    {
      unint64_t v8 = 1 << i;
      if (v8 > a3) {
        break;
      }
      if ((v8 & a3) != 0)
      {
        uint64_t v9 = [(NSMutableArray *)self->_maskObjectSets objectAtIndex:i];
        v10[2](v10, v9);

        unint64_t maskBits = self->_maskBits;
      }
    }
  }
}

- (NSMutableArray)maskObjectSets
{
  return self->_maskObjectSets;
}

- (void)setMaskObjectSets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end