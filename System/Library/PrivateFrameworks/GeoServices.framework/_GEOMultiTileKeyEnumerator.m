@interface _GEOMultiTileKeyEnumerator
- (BOOL)continueEnumeratingTileKeysWithBlock:(id)a3;
- (_GEOMultiTileKeyEnumerator)initWithEnumerators:(id)a3;
- (unint64_t)count;
@end

@implementation _GEOMultiTileKeyEnumerator

- (_GEOMultiTileKeyEnumerator)initWithEnumerators:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GEOMultiTileKeyEnumerator;
  v5 = [(_GEOMultiTileKeyEnumerator *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    enumerators = v5->_enumerators;
    v5->_enumerators = (NSArray *)v6;

    v5->_currentEnumeratorIndex = 0;
    v8 = v5;
  }

  return v5;
}

- (BOOL)continueEnumeratingTileKeysWithBlock:(id)a3
{
  id v4 = a3;
  unint64_t currentEnumeratorIndex = self->_currentEnumeratorIndex;
  if ([(NSArray *)self->_enumerators count] <= currentEnumeratorIndex)
  {
    BOOL v12 = 1;
  }
  else
  {
    uint64_t v6 = [(NSArray *)self->_enumerators objectAtIndexedSubscript:self->_currentEnumeratorIndex];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    if (v6)
    {
      uint64_t v7 = MEMORY[0x1E4F143A8];
      do
      {
        v14[0] = v7;
        v14[1] = 3221225472;
        v14[2] = __67___GEOMultiTileKeyEnumerator_continueEnumeratingTileKeysWithBlock___block_invoke;
        v14[3] = &unk_1E53EBEA8;
        id v15 = v4;
        v16 = &v17;
        if ([v6 continueEnumeratingTileKeysWithBlock:v14])
        {
          unsigned int v8 = self->_currentEnumeratorIndex + 1;
          self->_unint64_t currentEnumeratorIndex = v8;
          if ([(NSArray *)self->_enumerators count] <= v8)
          {
            uint64_t v9 = 0;
          }
          else
          {
            uint64_t v9 = [(NSArray *)self->_enumerators objectAtIndexedSubscript:self->_currentEnumeratorIndex];
          }

          uint64_t v6 = (void *)v9;
        }

        if (*((unsigned char *)v18 + 24)) {
          BOOL v10 = 1;
        }
        else {
          BOOL v10 = v6 == 0;
        }
      }
      while (!v10);
    }
    unint64_t v11 = self->_currentEnumeratorIndex;
    BOOL v12 = [(NSArray *)self->_enumerators count] <= v11;
    _Block_object_dispose(&v17, 8);
  }
  return v12;
}

- (unint64_t)count
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_enumerators;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "count", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end