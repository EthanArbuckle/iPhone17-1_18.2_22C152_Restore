@interface NLConcatenatedDataProvider
- (NLConcatenatedDataProvider)initWithDataProviders:(id)a3;
- (__CFStringTokenizer)tokenizer;
- (id)configuration;
- (id)documentFrequencyMap;
- (id)instanceAtIndex:(unint64_t)a3;
- (id)inverseLabelMap;
- (id)labelMap;
- (id)vocabularyMap;
- (unint64_t)numberOfInstances;
- (unint64_t)numberOfLabels;
- (unint64_t)numberOfVocabularyEntries;
@end

@implementation NLConcatenatedDataProvider

- (NLConcatenatedDataProvider)initWithDataProviders:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v8.receiver = self;
    v8.super_class = (Class)NLConcatenatedDataProvider;
    self = [(NLConcatenatedDataProvider *)&v8 init];
    if (self)
    {
      v5 = (NSArray *)[v4 copy];
      dataProviders = self->_dataProviders;
      self->_dataProviders = v5;
    }
  }

  return self;
}

- (id)configuration
{
  v2 = [(NSArray *)self->_dataProviders firstObject];
  v3 = [v2 configuration];

  return v3;
}

- (unint64_t)numberOfInstances
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_dataProviders;
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
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "numberOfInstances", (void)v9);
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

- (id)instanceAtIndex:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = self->_dataProviders;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      uint64_t v8 = 0;
      unint64_t v9 = a3;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        unint64_t v11 = objc_msgSend(v10, "numberOfInstances", (void)v14);
        a3 = v9 - v11;
        if (v9 < v11)
        {
          long long v12 = [v10 instanceAtIndex:v9];
          goto LABEL_11;
        }
        ++v8;
        v9 -= v11;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  long long v12 = 0;
LABEL_11:

  return v12;
}

- (__CFStringTokenizer)tokenizer
{
  v2 = [(NSArray *)self->_dataProviders firstObject];
  uint64_t v3 = (__CFStringTokenizer *)[v2 tokenizer];

  return v3;
}

- (id)labelMap
{
  v2 = [(NSArray *)self->_dataProviders firstObject];
  uint64_t v3 = [v2 labelMap];

  return v3;
}

- (id)inverseLabelMap
{
  v2 = [(NSArray *)self->_dataProviders firstObject];
  uint64_t v3 = [v2 inverseLabelMap];

  return v3;
}

- (id)vocabularyMap
{
  v2 = [(NSArray *)self->_dataProviders firstObject];
  uint64_t v3 = [v2 vocabularyMap];

  return v3;
}

- (id)documentFrequencyMap
{
  v2 = [(NSArray *)self->_dataProviders firstObject];
  uint64_t v3 = [v2 documentFrequencyMap];

  return v3;
}

- (unint64_t)numberOfLabels
{
  v2 = [(NSArray *)self->_dataProviders firstObject];
  unint64_t v3 = [v2 numberOfLabels];

  return v3;
}

- (unint64_t)numberOfVocabularyEntries
{
  v2 = [(NSArray *)self->_dataProviders firstObject];
  unint64_t v3 = [v2 numberOfVocabularyEntries];

  return v3;
}

- (void).cxx_destruct
{
}

@end