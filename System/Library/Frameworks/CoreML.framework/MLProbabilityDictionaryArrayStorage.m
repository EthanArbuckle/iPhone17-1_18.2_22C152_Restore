@interface MLProbabilityDictionaryArrayStorage
- (MLProbabilityDictionaryArrayStorage)initWithArray:(id)a3;
- (id)probabilityAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)maxElementIndex;
@end

@implementation MLProbabilityDictionaryArrayStorage

- (void).cxx_destruct
{
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)maxElementIndex
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__28162;
  v6[4] = __Block_byref_object_dispose__28163;
  id v7 = &unk_1EF11AB68;
  array = self->_array;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__MLProbabilityDictionaryArrayStorage_maxElementIndex__block_invoke;
  v5[3] = &unk_1E59A53E0;
  v5[4] = v6;
  v5[5] = &v8;
  [(NSArray *)array enumerateObjectsUsingBlock:v5];
  unint64_t v3 = v9[3];
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(&v8, 8);
  return v3;
}

void __54__MLProbabilityDictionaryArrayStorage_maxElementIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "compare:") == -1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (id)probabilityAtIndex:(unint64_t)a3
{
  if ([(MLProbabilityDictionaryArrayStorage *)self count] <= a3) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"Probability index %tu is out of range because there are only %tu classes.", a3, -[MLProbabilityDictionaryArrayStorage count](self, "count"));
  }
  array = self->_array;

  return [(NSArray *)array objectAtIndexedSubscript:a3];
}

- (MLProbabilityDictionaryArrayStorage)initWithArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLProbabilityDictionaryArrayStorage;
  id v6 = [(MLProbabilityDictionaryArrayStorage *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_array, a3);
    v7->_count = [v5 count];
  }

  return v7;
}

@end