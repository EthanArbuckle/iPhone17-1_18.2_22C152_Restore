@interface MLProbabilityDictionarySharedKeySet
- (MLProbabilityDictionarySharedKeySet)initWithLabels:(id)a3;
- (NSEnumerator)labelEnumerator;
- (id)labelAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)indexOfLabel:(id)a3;
- (unint64_t)uniqueLabelCount;
@end

@implementation MLProbabilityDictionarySharedKeySet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);

  objc_storeStrong((id *)&self->_labelToIndex, 0);
}

- (NSEnumerator)labelEnumerator
{
  return [(NSDictionary *)self->_labelToIndex keyEnumerator];
}

- (id)labelAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_labels objectAtIndexedSubscript:a3];
}

- (unint64_t)uniqueLabelCount
{
  return [(NSDictionary *)self->_labelToIndex count];
}

- (unint64_t)count
{
  return [(NSArray *)self->_labels count];
}

- (unint64_t)indexOfLabel:(id)a3
{
  v3 = [(NSDictionary *)self->_labelToIndex objectForKeyedSubscript:a3];
  v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (MLProbabilityDictionarySharedKeySet)initWithLabels:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id obj = a3;
  id v17 = a3;
  if (!v17) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"labels is nil", obj);
  }
  v22.receiver = self;
  v22.super_class = (Class)MLProbabilityDictionarySharedKeySet;
  v4 = [(MLProbabilityDictionarySharedKeySet *)&v22 init];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
    unint64_t v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v17;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v12 = [NSNumber numberWithInteger:v8 + i];
          [(NSDictionary *)v5 setObject:v12 forKeyedSubscript:v11];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
        v8 += i;
      }
      while (v7);
    }

    objc_storeStrong((id *)&v4->_labels, obja);
    labelToIndex = v4->_labelToIndex;
    v4->_labelToIndex = v5;
  }
  return v4;
}

@end