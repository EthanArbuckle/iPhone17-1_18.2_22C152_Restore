@interface CNLazyArray
- (BOOL)consumeNextObject;
- (CNLazyArray)init;
- (CNLazyArray)initWithArray:(id)a3;
- (CNLazyArray)initWithEnumerator:(id)a3;
- (CNLazyArray)initWithFastEnumeration:(id)a3;
- (CNLazyArray)initWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6;
- (CNLazyArray)initWithSource:(id)a3;
- (NSArray)allObjects;
- (NSMutableArray)output;
- (_CNLazyArrayOperation)operationChain;
- (id)all;
- (id)any;
- (id)compactMap;
- (id)contains;
- (id)distinct;
- (id)doOnNext;
- (id)filter;
- (id)firstObject;
- (id)flatMap;
- (id)lastObject;
- (id)map;
- (id)none;
- (id)reduce;
- (id)skip;
- (id)skipLast;
- (id)take;
- (id)takeLast;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)consumeAllObjects;
- (void)consumeToIndex:(unint64_t)a3;
- (void)setOperationChain:(id)a3;
@end

@implementation CNLazyArray

- (CNLazyArray)init
{
  return [(CNLazyArray *)self initWithArray:MEMORY[0x1E4F1CBF0]];
}

- (CNLazyArray)initWithArray:(id)a3
{
  v4 = [a3 objectEnumerator];
  v5 = [(CNLazyArray *)self initWithEnumerator:v4];

  return v5;
}

- (CNLazyArray)initWithEnumerator:(id)a3
{
  id v4 = a3;
  v5 = [[_CNLazyArrayEnumeratorSource alloc] initWithEnumerator:v4];

  v6 = [(CNLazyArray *)self initWithSource:v5];
  return v6;
}

- (CNLazyArray)initWithFastEnumeration:(id)a3
{
  id v4 = a3;
  v5 = [[_CNLazyArrayFastEnumerationSource alloc] initWithFastEnumeration:v4];

  v6 = [(CNLazyArray *)self initWithSource:v5];
  return v6;
}

- (CNLazyArray)initWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[_CNLazyArrayGeneratorSource alloc] initWithInitialState:v13 condition:v12 nextState:v11 resultSelector:v10];

  v15 = [(CNLazyArray *)self initWithSource:v14];
  return v15;
}

- (CNLazyArray)initWithSource:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNLazyArray;
  v6 = [(CNLazyArray *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_operationChain, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    output = v7->_output;
    v7->_output = (NSMutableArray *)v8;

    id v10 = v7;
  }

  return v7;
}

- (NSArray)allObjects
{
  [(CNLazyArray *)self consumeAllObjects];
  output = self->_output;

  return (NSArray *)output;
}

- (id)reduce
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __21__CNLazyArray_reduce__block_invoke;
  aBlock[3] = &unk_1E56A13C0;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

id __21__CNLazyArray_reduce__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  id v7 = v5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  id v10 = v7;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v17;
    id v10 = v7;
    do
    {
      uint64_t v13 = 0;
      v14 = v10;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v8);
        }
        id v10 = v6[2](v6, v14, *(void *)(*((void *)&v16 + 1) + 8 * v13));

        ++v13;
        v14 = v10;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v10;
}

- (id)firstObject
{
  [(CNLazyArray *)self consumeToIndex:0];
  v3 = [(CNLazyArray *)self output];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)lastObject
{
  [(CNLazyArray *)self consumeAllObjects];
  v3 = [(CNLazyArray *)self output];
  id v4 = [v3 lastObject];

  return v4;
}

- (id)filter
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __21__CNLazyArray_filter__block_invoke;
  aBlock[3] = &unk_1E56A13E8;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

id __21__CNLazyArray_filter__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [_CNLazyArrayOperatorFilter alloc];
  id v5 = [*(id *)(a1 + 32) operationChain];
  v6 = [(_CNLazyArrayOperatorFilter *)v4 initWithInput:v5 test:v3];

  [*(id *)(a1 + 32) setOperationChain:v6];
  id v7 = *(void **)(a1 + 32);

  return v7;
}

- (id)map
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __18__CNLazyArray_map__block_invoke;
  aBlock[3] = &unk_1E56A1410;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

id __18__CNLazyArray_map__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [_CNLazyArrayOperatorMap alloc];
  id v5 = [*(id *)(a1 + 32) operationChain];
  v6 = [(_CNLazyArrayOperatorMap *)v4 initWithInput:v5 transform:v3];

  [*(id *)(a1 + 32) setOperationChain:v6];
  id v7 = *(void **)(a1 + 32);

  return v7;
}

- (id)compactMap
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __25__CNLazyArray_compactMap__block_invoke;
  aBlock[3] = &unk_1E56A1410;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

id __25__CNLazyArray_compactMap__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [_CNLazyArrayOperatorCompactMap alloc];
  id v5 = [*(id *)(a1 + 32) operationChain];
  v6 = [(_CNLazyArrayOperatorCompactMap *)v4 initWithInput:v5 transform:v3];

  [*(id *)(a1 + 32) setOperationChain:v6];
  id v7 = *(void **)(a1 + 32);

  return v7;
}

- (id)flatMap
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __22__CNLazyArray_flatMap__block_invoke;
  aBlock[3] = &unk_1E56A1438;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

id __22__CNLazyArray_flatMap__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [_CNLazyArrayOperatorFlatMap alloc];
  id v5 = [*(id *)(a1 + 32) operationChain];
  v6 = [(_CNLazyArrayOperatorFlatMap *)v4 initWithInput:v5 transform:v3];

  [*(id *)(a1 + 32) setOperationChain:v6];
  id v7 = *(void **)(a1 + 32);

  return v7;
}

- (id)all
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __18__CNLazyArray_all__block_invoke;
  aBlock[3] = &unk_1E56A1460;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

uint64_t __18__CNLazyArray_all__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!v3[2](v3, *(void *)(*((void *)&v11 + 1) + 8 * v8)))
        {
          uint64_t v9 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 1;
LABEL_11:

  return v9;
}

- (id)any
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __18__CNLazyArray_any__block_invoke;
  aBlock[3] = &unk_1E56A1460;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

uint64_t __18__CNLazyArray_any__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (v3[2](v3, *(void *)(*((void *)&v9 + 1) + 8 * i)))
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)none
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __19__CNLazyArray_none__block_invoke;
  aBlock[3] = &unk_1E56A1460;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

uint64_t __19__CNLazyArray_none__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (v3[2](v3, *(void *)(*((void *)&v11 + 1) + 8 * v8)))
        {
          uint64_t v9 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 1;
LABEL_11:

  return v9;
}

- (id)contains
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __23__CNLazyArray_contains__block_invoke;
  aBlock[3] = &unk_1E56A1488;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

uint64_t __23__CNLazyArray_contains__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isEqual:", v3, (void)v9))
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)distinct
{
  id v3 = [_CNLazyArrayOperatorDistinct alloc];
  id v4 = [(CNLazyArray *)self operationChain];
  uint64_t v5 = [(_CNLazyArrayOperatorDistinct *)v3 initWithInput:v4];
  [(CNLazyArray *)self setOperationChain:v5];

  return self;
}

- (id)skip
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __19__CNLazyArray_skip__block_invoke;
  aBlock[3] = &unk_1E56A14B0;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

id __19__CNLazyArray_skip__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = [_CNLazyArrayOperatorSkip alloc];
    uint64_t v5 = [*(id *)(a1 + 32) operationChain];
    uint64_t v6 = [(_CNLazyArrayOperatorSkip *)v4 initWithInput:v5 limit:a2];
    [*(id *)(a1 + 32) setOperationChain:v6];
  }
  uint64_t v7 = *(void **)(a1 + 32);

  return v7;
}

- (id)skipLast
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __23__CNLazyArray_skipLast__block_invoke;
  aBlock[3] = &unk_1E56A14B0;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

id __23__CNLazyArray_skipLast__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = [_CNLazyArrayOperatorSkipLast alloc];
    uint64_t v5 = [*(id *)(a1 + 32) operationChain];
    uint64_t v6 = [(_CNLazyArrayOperatorSkipLast *)v4 initWithInput:v5 limit:a2];
    [*(id *)(a1 + 32) setOperationChain:v6];
  }
  uint64_t v7 = *(void **)(a1 + 32);

  return v7;
}

- (id)take
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __19__CNLazyArray_take__block_invoke;
  aBlock[3] = &unk_1E56A14B0;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

id __19__CNLazyArray_take__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = [_CNLazyArrayOperatorTake alloc];
    uint64_t v5 = [*(id *)(a1 + 32) operationChain];
    uint64_t v6 = [(_CNLazyArrayOperatorTake *)v4 initWithInput:v5 limit:a2];
  }
  else
  {
    uint64_t v7 = [_CNLazyArrayEnumeratorSource alloc];
    uint64_t v5 = [MEMORY[0x1E4F1CBF0] objectEnumerator];
    uint64_t v6 = [(_CNLazyArrayEnumeratorSource *)v7 initWithEnumerator:v5];
  }
  uint64_t v8 = (void *)v6;
  [*(id *)(a1 + 32) setOperationChain:v6];

  long long v9 = *(void **)(a1 + 32);

  return v9;
}

- (id)takeLast
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __23__CNLazyArray_takeLast__block_invoke;
  aBlock[3] = &unk_1E56A14B0;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

id __23__CNLazyArray_takeLast__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = [_CNLazyArrayOperatorTakeLast alloc];
    uint64_t v5 = [*(id *)(a1 + 32) operationChain];
    uint64_t v6 = [(_CNLazyArrayOperatorTakeLast *)v4 initWithInput:v5 limit:a2];
  }
  else
  {
    uint64_t v7 = [_CNLazyArrayEnumeratorSource alloc];
    uint64_t v5 = [MEMORY[0x1E4F1CBF0] objectEnumerator];
    uint64_t v6 = [(_CNLazyArrayEnumeratorSource *)v7 initWithEnumerator:v5];
  }
  uint64_t v8 = (void *)v6;
  [*(id *)(a1 + 32) setOperationChain:v6];

  long long v9 = *(void **)(a1 + 32);

  return v9;
}

- (id)doOnNext
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __23__CNLazyArray_doOnNext__block_invoke;
  aBlock[3] = &unk_1E56A14D8;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);

  return v2;
}

id __23__CNLazyArray_doOnNext__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [_CNLazyArrayActionOnNext alloc];
  uint64_t v5 = [*(id *)(a1 + 32) operationChain];
  uint64_t v6 = [(_CNLazyArrayActionOnNext *)v4 initWithInput:v5 action:v3];

  [*(id *)(a1 + 32) setOperationChain:v6];
  uint64_t v7 = *(void **)(a1 + 32);

  return v7;
}

- (void)consumeToIndex:(unint64_t)a3
{
  while ([(NSMutableArray *)self->_output count] <= a3
       && [(CNLazyArray *)self consumeNextObject])
    ;
}

- (void)consumeAllObjects
{
  while ([(CNLazyArray *)self consumeNextObject])
    ;
}

- (BOOL)consumeNextObject
{
  id v3 = [(CNLazyArray *)self operationChain];
  id v4 = [v3 nextObject];

  if (v4) {
    [(NSMutableArray *)self->_output addObject:v4];
  }

  return v4 != 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0 = a3->var0;
  if (!var0)
  {
    a3->var2 = (unint64_t *)self;
    a3->var3[0] = [(NSMutableArray *)self->_output count];
    unint64_t var0 = a3->var0;
  }
  -[CNLazyArray consumeToIndex:](self, "consumeToIndex:", var0, a4, a5);
  if ([(NSMutableArray *)self->_output count] <= a3->var0) {
    return 0;
  }
  long long v9 = -[NSMutableArray objectAtIndexedSubscript:](self->_output, "objectAtIndexedSubscript:");
  *a4 = v9;
  ++a3->var0;
  a3->var1 = a4;

  return 1;
}

- (_CNLazyArrayOperation)operationChain
{
  return (_CNLazyArrayOperation *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOperationChain:(id)a3
{
}

- (NSMutableArray)output
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);

  objc_storeStrong((id *)&self->_operationChain, 0);
}

@end