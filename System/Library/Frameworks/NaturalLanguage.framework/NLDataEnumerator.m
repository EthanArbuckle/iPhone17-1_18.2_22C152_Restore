@interface NLDataEnumerator
- (NLDataEnumerator)initWithDataProvider:(id)a3;
- (NLDataEnumerator)initWithDataProvider:(id)a3 numberGenerator:(id)a4;
- (NLDataProvider)dataProvider;
- (id)instanceAtIndex:(unint64_t)a3;
- (id)nextInstance;
- (unint64_t)index;
- (void)rewind;
- (void)rewindAndShuffle:(BOOL)a3;
- (void)shuffle;
@end

@implementation NLDataEnumerator

- (NLDataEnumerator)initWithDataProvider:(id)a3 numberGenerator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NLDataEnumerator;
  v9 = [(NLDataEnumerator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataProvider, a3);
    v10->_idx = 0;
    objc_storeStrong((id *)&v10->_generator, a4);
  }

  return v10;
}

- (NLDataEnumerator)initWithDataProvider:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(NLNumberGenerator);
  v6 = [(NLDataEnumerator *)self initWithDataProvider:v4 numberGenerator:v5];

  return v6;
}

- (id)nextInstance
{
  unint64_t idx = self->_idx;
  while (idx < [(NLDataProvider *)self->_dataProvider numberOfInstances])
  {
    id v4 = [(NLDataEnumerator *)self instanceAtIndex:self->_idx];
    unint64_t idx = self->_idx + 1;
    self->_unint64_t idx = idx;
    if (v4) {
      goto LABEL_6;
    }
  }
  id v4 = 0;
LABEL_6:

  return v4;
}

- (id)instanceAtIndex:(unint64_t)a3
{
  unint64_t v3 = a3;
  shuffleData = self->_shuffleData;
  if (shuffleData) {
    unint64_t v3 = *(unsigned int *)([(NSMutableData *)shuffleData bytes] + 4 * a3);
  }
  v6 = [(NLDataEnumerator *)self dataProvider];
  id v7 = [v6 instanceAtIndex:v3];

  return v7;
}

- (void)rewind
{
  self->_unint64_t idx = 0;
}

- (void)rewindAndShuffle:(BOOL)a3
{
  BOOL v3 = a3;
  [(NLDataEnumerator *)self rewind];
  if (v3)
  {
    [(NLDataEnumerator *)self shuffle];
  }
}

- (NLDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (unint64_t)index
{
  return self->_idx;
}

- (void)shuffle
{
  BOOL v3 = [(NLDataEnumerator *)self dataProvider];
  unint64_t v4 = [v3 numberOfInstances];

  shuffleData = self->_shuffleData;
  if (shuffleData) {
    goto LABEL_6;
  }
  v6 = (NSMutableData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:4 * v4];
  id v7 = self->_shuffleData;
  self->_shuffleData = v6;

  id v8 = [(NSMutableData *)self->_shuffleData mutableBytes];
  if (v4)
  {
    uint64_t v9 = 0;
    do
    {
      v8[v9] = v9;
      ++v9;
    }
    while (v4 > v9);
  }
  shuffleData = self->_shuffleData;
  if (shuffleData)
  {
LABEL_6:
    uint64_t v10 = [(NSMutableData *)shuffleData mutableBytes];
    if (v4 >= 2)
    {
      uint64_t v11 = v10;
      uint64_t v12 = v10 - 4;
      do
      {
        unint64_t v13 = v4 - 1;
        unint64_t v14 = -[NLNumberGenerator numberInRange:](self->_generator, "numberInRange:", 0, v4);
        if (v4 - 1 != v14)
        {
          int v15 = *(_DWORD *)(v12 + 4 * v4);
          *(_DWORD *)(v12 + 4 * v4) = *(_DWORD *)(v11 + 4 * v14);
          *(_DWORD *)(v11 + 4 * v14) = v15;
        }
        --v4;
      }
      while (v13 > 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shuffleData, 0);
  objc_storeStrong((id *)&self->_generator, 0);

  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end