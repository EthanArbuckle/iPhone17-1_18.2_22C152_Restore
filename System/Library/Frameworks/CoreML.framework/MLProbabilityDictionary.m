@interface MLProbabilityDictionary
+ (id)sharedKeySetForLabels:(id)a3;
- (MLProbabilityDictionary)initWithLabelIndexMap:(id)a3 storage:(id)a4;
- (MLProbabilityDictionary)initWithLabels:(id)a3 probabilities:(const double *)a4;
- (MLProbabilityDictionary)initWithLabels:(id)a3 probabilityArray:(id)a4;
- (MLProbabilityDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (MLProbabilityDictionary)initWithSharedKeySet:(id)a3 probabilities:(const double *)a4;
- (MLProbabilityDictionary)initWithSharedKeySet:(id)a3 probabilityArray:(id)a4;
- (MLProbabilityDictionary)initWithSharedKeySet:(id)a3 probabilityMultiArray:(id)a4;
- (MLProbabilityDictionarySharedKeySet)labelIndexMap;
- (MLProbabilityDictionaryStorage)storage;
- (id)classLabelOfMaxProbability;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
@end

@implementation MLProbabilityDictionary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_labelIndexMap, 0);
}

- (MLProbabilityDictionaryStorage)storage
{
  return (MLProbabilityDictionaryStorage *)objc_getProperty(self, a2, 16, 1);
}

- (MLProbabilityDictionarySharedKeySet)labelIndexMap
{
  return (MLProbabilityDictionarySharedKeySet *)objc_getProperty(self, a2, 8, 1);
}

- (id)keyEnumerator
{
  v2 = [(MLProbabilityDictionary *)self labelIndexMap];
  v3 = [v2 labelEnumerator];

  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(MLProbabilityDictionary *)self labelIndexMap];
  uint64_t v6 = [v5 indexOfLabel:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v8 = [(MLProbabilityDictionary *)self storage];
    v7 = [v8 probabilityAtIndex:v6];
  }

  return v7;
}

- (unint64_t)count
{
  v2 = [(MLProbabilityDictionary *)self labelIndexMap];
  unint64_t v3 = [v2 uniqueLabelCount];

  return v3;
}

- (id)classLabelOfMaxProbability
{
  unint64_t v3 = [(MLProbabilityDictionary *)self storage];
  id v4 = v3;
  if (v3 && (uint64_t v5 = [v3 maxElementIndex], v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v7 = [(MLProbabilityDictionary *)self labelIndexMap];
    uint64_t v6 = [v7 labelAtIndex:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (MLProbabilityDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:a3 count:a5];
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:a3 count:a5];
  v10 = [(MLProbabilityDictionary *)self initWithLabels:v8 probabilityArray:v9];

  return v10;
}

- (MLProbabilityDictionary)initWithLabels:(id)a3 probabilities:(const double *)a4
{
  uint64_t v6 = +[MLProbabilityDictionary sharedKeySetForLabels:a3];
  v7 = [(MLProbabilityDictionary *)self initWithSharedKeySet:v6 probabilities:a4];

  return v7;
}

- (MLProbabilityDictionary)initWithLabels:(id)a3 probabilityArray:(id)a4
{
  id v6 = a4;
  v7 = +[MLProbabilityDictionary sharedKeySetForLabels:a3];
  v8 = [(MLProbabilityDictionary *)self initWithSharedKeySet:v7 probabilityArray:v6];

  return v8;
}

- (MLProbabilityDictionary)initWithSharedKeySet:(id)a3 probabilityArray:(id)a4
{
  id v6 = (objc_object *)a3;
  id v7 = a4;
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"probabilities is nil."];
  }
  LabelIndexMapFromSharedKeySet(v6);
  objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 count];
  if (v8 != [(objc_object *)v6 count])
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = [(objc_object *)v6 count];
    uint64_t v11 = [v7 count];
    objc_msgSend(v9, "raise:format:", *MEMORY[0x1E4F1C3C8], @"There are %tu class labels but class probability array has %tu entries.", v10, v11);
  }
  v12 = [[MLProbabilityDictionaryArrayStorage alloc] initWithArray:v7];
  v13 = [(MLProbabilityDictionary *)self initWithLabelIndexMap:v6 storage:v12];

  return v13;
}

- (MLProbabilityDictionary)initWithSharedKeySet:(id)a3 probabilities:(const double *)a4
{
  id v6 = (objc_object *)a3;
  if (!a4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"probabilities is nil."];
  }
  LabelIndexMapFromSharedKeySet(v6);
  objc_claimAutoreleasedReturnValue();
  id v7 = [[MLProbabilityDictionaryFloat64Storage alloc] initWithFloat64CArray:a4 count:[(objc_object *)v6 count]];
  uint64_t v8 = [(MLProbabilityDictionary *)self initWithLabelIndexMap:v6 storage:v7];

  return v8;
}

- (MLProbabilityDictionary)initWithSharedKeySet:(id)a3 probabilityMultiArray:(id)a4
{
  id v6 = (objc_object *)a3;
  id v7 = a4;
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"probabilities is nil."];
  }
  LabelIndexMapFromSharedKeySet(v6);
  objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 count];
  if (v8 != [(objc_object *)v6 count])
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = [(objc_object *)v6 count];
    uint64_t v11 = [v7 count];
    objc_msgSend(v9, "raise:format:", *MEMORY[0x1E4F1C3C8], @"There are %tu class labels but class probability multiArray has %tu entries.", v10, v11);
  }
  v12 = [[MLProbabilityDictionaryMultiArrayStorage alloc] initWithMultiArray:v7];
  v13 = [(MLProbabilityDictionary *)self initWithLabelIndexMap:v6 storage:v12];

  return v13;
}

- (MLProbabilityDictionary)initWithLabelIndexMap:(id)a3 storage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MLProbabilityDictionary;
  v9 = [(MLProbabilityDictionary *)&v17 init];
  uint64_t v10 = v9;
  if (v9)
  {
    p_labelIndexMap = (id *)&v9->_labelIndexMap;
    objc_storeStrong((id *)&v9->_labelIndexMap, a3);
    objc_storeStrong((id *)&v10->_storage, a4);
    uint64_t v12 = [(MLProbabilityDictionaryStorage *)v10->_storage count];
    if (v12 != [*p_labelIndexMap count])
    {
      v13 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v14 = [*p_labelIndexMap count];
      uint64_t v15 = [(MLProbabilityDictionaryStorage *)v10->_storage count];
      objc_msgSend(v13, "raise:format:", *MEMORY[0x1E4F1C3C8], @"The number of labels (%tu) doesn't match the number of probabilities (%tu).", v14, v15);
    }
  }

  return v10;
}

+ (id)sharedKeySetForLabels:(id)a3
{
  id v3 = a3;
  id v4 = [[MLProbabilityDictionarySharedKeySet alloc] initWithLabels:v3];

  return v4;
}

@end