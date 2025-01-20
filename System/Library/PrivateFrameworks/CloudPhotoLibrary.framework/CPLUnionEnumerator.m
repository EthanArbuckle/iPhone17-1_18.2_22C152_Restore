@interface CPLUnionEnumerator
- (CPLUnionEnumerator)initWithEnumeratorGenerators:(id)a3;
- (CPLUnionEnumerator)initWithEnumerators:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_prepareNextEnumeratorWithState:(id *)a3;
@end

@implementation CPLUnionEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEnumerator, 0);
  objc_storeStrong((id *)&self->_remainingGenerators, 0);
  uint64_t v3 = 16;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (self->_currentEnumerator) {
    goto LABEL_3;
  }
  do
  {
    [(CPLUnionEnumerator *)self _prepareNextEnumeratorWithState:a3];
    if (!self->_currentEnumerator) {
      return 0;
    }
LABEL_3:
    a3->var2 = (unint64_t *)self->_currentEnumeratorMutationsPtr;
    unint64_t result = [(NSFastEnumeration *)self->_currentEnumerator countByEnumeratingWithState:a3 objects:a4 count:a5];
  }
  while (!result);
  currentEnumeratorMutationsPtr = (unint64_t *)self->_currentEnumeratorMutationsPtr;
  var2 = a3->var2;
  if (currentEnumeratorMutationsPtr) {
    BOOL v12 = var2 == currentEnumeratorMutationsPtr;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    self->_currentEnumeratorMutationsPtr = var2;
    v13 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu;
  }
  else
  {
    v13 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu2;
  }
  a3->var2 = v13;
  return result;
}

- (void)_prepareNextEnumeratorWithState:(id *)a3
{
  remainingGenerators = self->_remainingGenerators;
  unint64_t currentGeneratorIndex = self->_currentGeneratorIndex;
  if (remainingGenerators)
  {
    if (currentGeneratorIndex < [(NSMutableArray *)remainingGenerators count])
    {
      v7 = [(NSMutableArray *)self->_remainingGenerators objectAtIndexedSubscript:self->_currentGeneratorIndex];
      v7[2]();
      v8 = (NSFastEnumeration *)objc_claimAutoreleasedReturnValue();
      currentEnumerator = self->_currentEnumerator;
      self->_currentEnumerator = v8;

      [(NSMutableArray *)self->_remainingGenerators replaceObjectAtIndex:self->_currentGeneratorIndex withObject:&__block_literal_global_4546];
LABEL_6:
      ++self->_currentGeneratorIndex;
      goto LABEL_8;
    }
  }
  else if (currentGeneratorIndex <= 1)
  {
    (*((void (**)(void))self->_generatorArray[currentGeneratorIndex] + 2))();
    v10 = (NSFastEnumeration *)objc_claimAutoreleasedReturnValue();
    v11 = self->_currentEnumerator;
    self->_currentEnumerator = v10;

    unint64_t v12 = self->_currentGeneratorIndex;
    id v13 = self->_generatorArray[v12];
    self->_generatorArray[v12] = 0;

    goto LABEL_6;
  }
  v14 = self->_currentEnumerator;
  self->_currentEnumerator = 0;

LABEL_8:
  if (self->_currentEnumerator)
  {
    a3->var0 = 0;
    *(_OWORD *)a3->var3 = 0u;
    *(_OWORD *)&a3->var3[2] = 0u;
    a3->var3[4] = 0;
    self->_currentEnumeratorMutationsPtr = 0;
  }
}

- (CPLUnionEnumerator)initWithEnumerators:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __42__CPLUnionEnumerator_initWithEnumerators___block_invoke;
        v15[3] = &unk_1E60A73F8;
        v15[4] = v11;
        unint64_t v12 = (void *)MEMORY[0x1BA994060](v15);
        [v5 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v13 = [(CPLUnionEnumerator *)self initWithEnumeratorGenerators:v5];
  return v13;
}

id __42__CPLUnionEnumerator_initWithEnumerators___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (CPLUnionEnumerator)initWithEnumeratorGenerators:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CPLUnionEnumerator;
  v5 = [(CPLUnionEnumerator *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 count];
    if (v6 == 2)
    {
      uint64_t v10 = [v4 firstObject];
      id v11 = v5->_generatorArray[0];
      v5->_generatorArray[0] = (id)v10;

      uint64_t v12 = [v4 lastObject];
      id v13 = v5->_generatorArray[1];
      v5->_generatorArray[1] = (id)v12;

      v5->_unint64_t currentGeneratorIndex = 0;
    }
    else
    {
      if (v6 == 1)
      {
        id v14 = v5->_generatorArray[0];
        v5->_generatorArray[0] = 0;

        uint64_t v15 = [v4 firstObject];
        id v16 = v5->_generatorArray[1];
        v5->_generatorArray[1] = (id)v15;

        uint64_t v9 = 1;
      }
      else
      {
        if (v6)
        {
          uint64_t v17 = [v4 mutableCopy];
          remainingGenerators = v5->_remainingGenerators;
          v5->_remainingGenerators = (NSMutableArray *)v17;

          goto LABEL_10;
        }
        id v7 = v5->_generatorArray[0];
        v5->_generatorArray[0] = 0;

        id v8 = v5->_generatorArray[1];
        v5->_generatorArray[1] = 0;

        uint64_t v9 = 2;
      }
      v5->_unint64_t currentGeneratorIndex = v9;
    }
  }
LABEL_10:

  return v5;
}

@end