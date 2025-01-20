@interface NLDataProvider
- (NLDataProvider)initWithConfiguration:(id)a3 dataURL:(id)a4;
- (NLModelConfiguration)configuration;
- (NSString)recognizedLanguage;
- (__CFStringTokenizer)tokenizer;
- (id)documentFrequencyMap;
- (id)instanceAtIndex:(unint64_t)a3;
- (id)inverseLabelMap;
- (id)labelMap;
- (id)vocabularyMap;
- (unint64_t)numberOfInstances;
- (unint64_t)numberOfLabels;
- (unint64_t)numberOfTokens;
- (unint64_t)numberOfVocabularyEntries;
- (void)_generateMaps;
- (void)_generateMapsWithModelTrainer:(id)a3;
- (void)_performLanguageRecognition;
- (void)dealloc;
- (void)generateMapsWithModelTrainer:(id)a3;
@end

@implementation NLDataProvider

- (NLDataProvider)initWithConfiguration:(id)a3 dataURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NLDataProvider;
  v8 = [(NLDataProvider *)&v17 init];
  if (v8)
  {
    [v6 type];
    v9 = objc_opt_class();
    v10 = [NSString stringWithContentsOfURL:v7 encoding:4 error:0];
    v18.location = 0;
    v18.length = 0;
    CFStringTokenizerRef v11 = CFStringTokenizerCreate(0, &stru_1EFB303D0, v18, 0, 0);
    uint64_t v12 = [v6 copy];
    configuration = v8->_configuration;
    v8->_configuration = (NLModelConfiguration *)v12;

    uint64_t v14 = [v9 readInstancesFromString:v10 tokenizer:v11];
    instances = v8->_instances;
    v8->_instances = (NSArray *)v14;

    v8->_tokenizer = v11;
  }

  return v8;
}

- (void)dealloc
{
  tokenizer = self->_tokenizer;
  if (tokenizer) {
    CFRelease(tokenizer);
  }
  v4.receiver = self;
  v4.super_class = (Class)NLDataProvider;
  [(NLDataProvider *)&v4 dealloc];
}

- (NLModelConfiguration)configuration
{
  return self->_configuration;
}

- (unint64_t)numberOfInstances
{
  return [(NSArray *)self->_instances count];
}

- (id)instanceAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_instances objectAtIndex:a3];
}

- (void)_generateMapsWithModelTrainer:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  unint64_t v3 = [(NLDataProvider *)self numberOfInstances];
  v61 = [MEMORY[0x1E4F1CA60] dictionary];
  v70 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_super v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v69 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v58 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v60 = v3;
  if (v3)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    unint64_t v73 = 1;
    do
    {
      uint64_t v66 = v6;
      v8 = -[NLDataProvider instanceAtIndex:](self, "instanceAtIndex:", v6, v58);
      v9 = [v8 tokens];
      v65 = v8;
      v10 = [v8 labels];
      CFStringTokenizerRef v11 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v64 = [v9 count];
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      obuint64_t j = v10;
      uint64_t v12 = [obj countByEnumeratingWithState:&v88 objects:v95 count:16];
      unint64_t v67 = v7;
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v89;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v89 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v88 + 1) + 8 * i);
            objc_super v17 = [(NSDictionary *)v61 objectForKey:v16];

            if (!v17)
            {
              CFRange v18 = [NSNumber numberWithUnsignedInteger:v73];
              [(NSDictionary *)v61 setObject:v18 forKey:v16];
              [(NSDictionary *)v70 setObject:v16 forKey:v18];
              ++v73;
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v88 objects:v95 count:16];
        }
        while (v13);
      }

      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v19 = v9;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v84 objects:v94 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v85;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v85 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v84 + 1) + 8 * j);
            v25 = [v4 objectForKey:v24];
            uint64_t v26 = [v25 unsignedIntegerValue];

            v27 = [NSNumber numberWithUnsignedInteger:v26 + 1];
            [v4 setObject:v27 forKey:v24];

            [v11 addObject:v24];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v84 objects:v94 count:16];
        }
        while (v21);
      }

      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v28 = v11;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v80 objects:v93 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v81;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v81 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v80 + 1) + 8 * k);
            v34 = [v5 objectForKey:v33];
            uint64_t v35 = [v34 unsignedIntegerValue];

            v36 = [NSNumber numberWithUnsignedInteger:v35 + 1];
            [v5 setObject:v36 forKey:v33];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v80 objects:v93 count:16];
        }
        while (v30);
      }
      unint64_t v7 = v64 + v67;

      reportInstanceCompletionToTrainer(v63, v66, v60, 0);
      uint64_t v6 = v66 + 1;
    }
    while (v66 + 1 != v60);
  }
  else
  {
    unint64_t v7 = 0;
    unint64_t v73 = 1;
  }
  unint64_t v68 = v7;
  v37 = objc_msgSend(v4, "allKeys", v58);
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __48__NLDataProvider__generateMapsWithModelTrainer___block_invoke;
  v78[3] = &unk_1E5C53768;
  id obja = v4;
  id v79 = obja;
  v38 = [v37 sortedArrayUsingComparator:v78];

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v39 = v38;
  unint64_t v40 = 16;
  uint64_t v41 = [v39 countByEnumeratingWithState:&v74 objects:v92 count:16];
  v42 = v69;
  if (v41)
  {
    uint64_t v43 = v41;
    uint64_t v44 = *(void *)v75;
    unint64_t v40 = 16;
    do
    {
      for (uint64_t m = 0; m != v43; ++m)
      {
        if (*(void *)v75 != v44) {
          objc_enumerationMutation(v39);
        }
        v46 = *(void **)(*((void *)&v74 + 1) + 8 * m);
        if (tokenIDFromTokenAndVocabularyMap(v46, v42) == 3)
        {
          v47 = [NSNumber numberWithUnsignedInteger:v40];
          v48 = [v5 objectForKey:v46];
          [(NSDictionary *)v69 setObject:v47 forKey:v46];
          [(NSDictionary *)v59 setObject:v48 forKey:v47];
          ++v40;

          v42 = v69;
        }
      }
      uint64_t v43 = [v39 countByEnumeratingWithState:&v74 objects:v92 count:16];
    }
    while (v43);
  }

  labelMap = self->_labelMap;
  self->_labelMap = v61;
  v50 = v61;

  inverseLabelMap = self->_inverseLabelMap;
  self->_inverseLabelMap = v70;
  v52 = v42;
  v53 = v70;

  vocabularyMap = self->_vocabularyMap;
  self->_vocabularyMap = v52;
  v55 = v52;

  documentFrequencyMap = self->_documentFrequencyMap;
  self->_documentFrequencyMap = v59;
  v57 = v59;

  self->_numberOfLabels = v73;
  self->_numberOfVocabularyEntries = v40;
  self->_numberOfTokens = v68;
  self->_generatedMaps = 1;
}

uint64_t __48__NLDataProvider__generateMapsWithModelTrainer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 objectForKey:a2];
  unint64_t v8 = [v7 unsignedIntegerValue];

  v9 = [*(id *)(a1 + 32) objectForKey:v6];

  unint64_t v10 = [v9 unsignedIntegerValue];
  if (v8 > v10) {
    return -1;
  }
  else {
    return v8 < v10;
  }
}

- (void)_performLanguageRecognition
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [(NLDataProvider *)self numberOfInstances];
  unint64_t v3 = objc_alloc_init(NLLanguageRecognizer);
  objc_super v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v2)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    do
    {
      unint64_t v7 = (void *)v6;
      unint64_t v8 = [(NLDataProvider *)self instanceAtIndex:v5];
      [(NLLanguageRecognizer *)v3 reset];
      v9 = [v8 string];
      [(NLLanguageRecognizer *)v3 processString:v9];

      uint64_t v6 = [(NLLanguageRecognizer *)v3 dominantLanguage];

      if (v6)
      {
        unint64_t v10 = [v4 objectForKey:v6];
        uint64_t v11 = [v10 unsignedIntegerValue];

        uint64_t v12 = [NSNumber numberWithUnsignedInteger:v11 + 1];
        [v4 setObject:v12 forKey:v6];
      }
      ++v5;
    }
    while (v2 != v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v26 = (void *)v6;
  v27 = v3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v13 = [v4 allKeys];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v13);
        }
        uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v21 = [v4 objectForKey:v20];
        unint64_t v22 = [v21 unsignedIntegerValue];

        if (v22 > v17)
        {
          id v23 = v20;

          uint64_t v16 = v23;
          unint64_t v17 = v22;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }
  else
  {
    uint64_t v16 = 0;
  }

  recognizedLanguage = self->_recognizedLanguage;
  self->_recognizedLanguage = (NSString *)v16;
  id v25 = v16;

  self->_performedLanguageRecognition = 1;
}

- (void)_generateMaps
{
}

- (void)generateMapsWithModelTrainer:(id)a3
{
  if (!self->_generatedMaps) {
    [(NLDataProvider *)self _generateMapsWithModelTrainer:a3];
  }
}

- (__CFStringTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (id)labelMap
{
  if (!self->_generatedMaps) {
    [(NLDataProvider *)self _generateMaps];
  }
  labelMap = self->_labelMap;

  return labelMap;
}

- (id)inverseLabelMap
{
  if (!self->_generatedMaps) {
    [(NLDataProvider *)self _generateMaps];
  }
  inverseLabelMap = self->_inverseLabelMap;

  return inverseLabelMap;
}

- (id)vocabularyMap
{
  if (!self->_generatedMaps) {
    [(NLDataProvider *)self _generateMaps];
  }
  vocabularyMap = self->_vocabularyMap;

  return vocabularyMap;
}

- (id)documentFrequencyMap
{
  if (!self->_generatedMaps) {
    [(NLDataProvider *)self _generateMaps];
  }
  documentFrequencyMap = self->_documentFrequencyMap;

  return documentFrequencyMap;
}

- (unint64_t)numberOfLabels
{
  if (!self->_generatedMaps) {
    [(NLDataProvider *)self _generateMaps];
  }
  return self->_numberOfLabels;
}

- (unint64_t)numberOfVocabularyEntries
{
  if (!self->_generatedMaps) {
    [(NLDataProvider *)self _generateMaps];
  }
  return self->_numberOfVocabularyEntries;
}

- (unint64_t)numberOfTokens
{
  if (!self->_generatedMaps) {
    [(NLDataProvider *)self _generateMaps];
  }
  return self->_numberOfTokens;
}

- (NSString)recognizedLanguage
{
  if (!self->_performedLanguageRecognition) {
    [(NLDataProvider *)self _performLanguageRecognition];
  }
  recognizedLanguage = self->_recognizedLanguage;

  return recognizedLanguage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizedLanguage, 0);
  objc_storeStrong((id *)&self->_documentFrequencyMap, 0);
  objc_storeStrong((id *)&self->_vocabularyMap, 0);
  objc_storeStrong((id *)&self->_inverseLabelMap, 0);
  objc_storeStrong((id *)&self->_labelMap, 0);
  objc_storeStrong((id *)&self->_instances, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end