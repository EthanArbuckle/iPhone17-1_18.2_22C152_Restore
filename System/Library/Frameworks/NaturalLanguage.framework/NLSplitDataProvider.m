@interface NLSplitDataProvider
- (NLSplitDataProvider)initWithDataProvider:(id)a3 indexes:(id)a4;
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

@implementation NLSplitDataProvider

- (NLSplitDataProvider)initWithDataProvider:(id)a3 indexes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NLSplitDataProvider;
  v9 = [(NLSplitDataProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataProvider, a3);
    uint64_t v11 = [v8 copy];
    indexes = v10->_indexes;
    v10->_indexes = (NSArray *)v11;
  }
  return v10;
}

- (id)configuration
{
  return [(NLDataProvider *)self->_dataProvider configuration];
}

- (unint64_t)numberOfInstances
{
  return [(NSArray *)self->_indexes count];
}

- (id)instanceAtIndex:(unint64_t)a3
{
  dataProvider = self->_dataProvider;
  v4 = [(NSArray *)self->_indexes objectAtIndex:a3];
  v5 = -[NLDataProvider instanceAtIndex:](dataProvider, "instanceAtIndex:", [v4 unsignedIntegerValue]);

  return v5;
}

- (__CFStringTokenizer)tokenizer
{
  return [(NLDataProvider *)self->_dataProvider tokenizer];
}

- (id)labelMap
{
  return [(NLDataProvider *)self->_dataProvider labelMap];
}

- (id)inverseLabelMap
{
  return [(NLDataProvider *)self->_dataProvider inverseLabelMap];
}

- (id)vocabularyMap
{
  return [(NLDataProvider *)self->_dataProvider vocabularyMap];
}

- (id)documentFrequencyMap
{
  return [(NLDataProvider *)self->_dataProvider documentFrequencyMap];
}

- (unint64_t)numberOfLabels
{
  return [(NLDataProvider *)self->_dataProvider numberOfLabels];
}

- (unint64_t)numberOfVocabularyEntries
{
  return [(NLDataProvider *)self->_dataProvider numberOfVocabularyEntries];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexes, 0);

  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end