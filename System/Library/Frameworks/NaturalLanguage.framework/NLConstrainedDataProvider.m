@interface NLConstrainedDataProvider
- (NLConstrainedDataProvider)initWithDataProvider:(id)a3 parameters:(_NLConstraintParameters *)a4 modelTrainer:(id)a5;
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

@implementation NLConstrainedDataProvider

- (NLConstrainedDataProvider)initWithDataProvider:(id)a3 parameters:(_NLConstraintParameters *)a4 modelTrainer:(id)a5
{
  v116[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v110.receiver = self;
  v110.super_class = (Class)NLConstrainedDataProvider;
  v11 = [(NLConstrainedDataProvider *)&v110 init];
  if (v11)
  {
    id v86 = a3;
    id v92 = v10;
    v93 = [MEMORY[0x1E4F1CA48] array];
    v83 = [v9 labelMap];
    v84 = [v9 vocabularyMap];
    v85 = [v9 documentFrequencyMap];
    v96 = [MEMORY[0x1E4F1CA60] dictionary];
    v88 = [MEMORY[0x1E4F1CA60] dictionary];
    v94 = [MEMORY[0x1E4F1CA60] dictionary];
    v97 = [MEMORY[0x1E4F1CA60] dictionary];
    v89 = v9;
    unint64_t v90 = [v9 numberOfInstances];
    v12 = [NLTagger alloc];
    v116[0] = @"TokenType";
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:1];
    v91 = [(NLTagger *)v12 initWithTagSchemes:v13];

    v14 = (void *)MEMORY[0x1AD0BB930]();
    v15 = NLGetLogCategory(0);
    v16 = [v15 internal];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = 0;
      _os_log_impl(&dword_1A6419000, v16, OS_LOG_TYPE_INFO, "event: %lu", buf, 0xCu);
    }

    if ([&unk_1EFB3AAA8 count])
    {
      unint64_t v17 = 0;
      do
      {
        v18 = (void *)MEMORY[0x1AD0BB930]();
        v19 = NLGetLogCategory(0);
        v20 = [v19 internal];

        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v21 = [&unk_1EFB3AAA8 objectAtIndexedSubscript:v17];
          uint64_t v22 = [v21 UTF8String];
          *(_DWORD *)buf = 134218498;
          *(void *)&buf[4] = 1;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v17;
          *(_WORD *)&buf[22] = 2082;
          *(void *)&buf[24] = v22;
          _os_log_impl(&dword_1A6419000, v20, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %{public}s", buf, 0x20u);
        }
        ++v17;
      }
      while (v17 < [&unk_1EFB3AAA8 count]);
    }
    v87 = v11;
    uint64_t v23 = v90;
    unint64_t v24 = (unint64_t)((double)(v90 / 0x64) * 10.0);
    if (v24 <= 1) {
      unint64_t v24 = 1;
    }
    if (v24 >= 0x64) {
      unint64_t v25 = 100;
    }
    else {
      unint64_t v25 = v24;
    }
    v27 = v91;
    v26 = v92;
    if (v90)
    {
      uint64_t v28 = 0;
      uint64_t v29 = -1;
      do
      {
        v30 = [v89 instanceAtIndex:v28];
        uint64_t v31 = [v89 tokenizer];
        long long v32 = *(_OWORD *)&a4->maxSplitTokens;
        *(_OWORD *)buf = *(_OWORD *)&a4->splitSentences;
        *(_OWORD *)&buf[16] = v32;
        long long v115 = *(_OWORD *)&a4->maxLabels;
        v33 = [v30 locatorsWithIndex:v28 parameters:buf tagger:v27 tokenizer:v31];
        uint64_t v34 = [(NSArray *)v93 addObjectsFromArray:v33];
        if (!((v23 + v29) % v25))
        {
          v35 = (void *)MEMORY[0x1AD0BB930](v34);
          v36 = NLGetLogCategory(0);
          v37 = [v36 internal];

          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218496;
            *(void *)&buf[4] = 2;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = 0;
            *(_WORD *)&buf[22] = 2048;
            *(void *)&buf[24] = v28 + 1;
            _os_log_impl(&dword_1A6419000, v37, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %lu", buf, 0x20u);
          }

          v38 = (void *)MEMORY[0x1AD0BB930]();
          v39 = NLGetLogCategory(0);
          v40 = [v39 internal];

          uint64_t v23 = v90;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218496;
            *(void *)&buf[4] = 2;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = 1;
            *(_WORD *)&buf[22] = 2048;
            *(void *)&buf[24] = v90;
            _os_log_impl(&dword_1A6419000, v40, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %lu", buf, 0x20u);
          }

          v27 = v91;
          v26 = v92;
        }
        reportInstanceCompletionToTrainer(v26, v28, v23, 1);

        ++v28;
        --v29;
      }
      while (v23 != v28);
    }
    v41 = (void *)MEMORY[0x1AD0BB930]();
    v42 = NLGetLogCategory(0);
    v43 = [v42 internal];

    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = 3;
      _os_log_impl(&dword_1A6419000, v43, OS_LOG_TYPE_INFO, "event: %lu", buf, 0xCu);
    }

    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v44 = v83;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v106 objects:v113 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      unint64_t v47 = 0;
      uint64_t v48 = *(void *)v107;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v107 != v48) {
            objc_enumerationMutation(v44);
          }
          uint64_t v50 = *(void *)(*((void *)&v106 + 1) + 8 * i);
          v51 = [v44 objectForKey:v50];
          unint64_t v52 = [v51 unsignedIntegerValue];
          if (a4->maxLabels - 1 >= v52)
          {
            unint64_t v53 = v52;
            [(NSDictionary *)v96 setObject:v51 forKey:v50];
            [(NSDictionary *)v88 setObject:v50 forKey:v51];
            if (v53 > v47) {
              unint64_t v47 = v53;
            }
          }
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v106 objects:v113 count:16];
      }
      while (v46);
    }
    else
    {
      unint64_t v47 = 0;
    }

    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v54 = v84;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v102 objects:v112 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      unint64_t v95 = 0;
      uint64_t v57 = *(void *)v103;
      do
      {
        for (uint64_t j = 0; j != v56; ++j)
        {
          if (*(void *)v103 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = *(void **)(*((void *)&v102 + 1) + 8 * j);
          unint64_t v60 = tokenIDFromTokenAndVocabularyMap(v59, v54);
          if (v60 >= 0x10)
          {
            unint64_t v61 = v60;
            if (a4->maxVocabularySize - 1 >= v60)
            {
              v62 = [NSNumber numberWithUnsignedInteger:v60];
              [(NSDictionary *)v94 setObject:v62 forKey:v59];

              unint64_t v63 = v95;
              if (v61 > v95) {
                unint64_t v63 = v61;
              }
              unint64_t v95 = v63;
            }
          }
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v102 objects:v112 count:16];
      }
      while (v56);
    }
    else
    {
      unint64_t v95 = 0;
    }

    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v64 = v85;
    uint64_t v65 = [v64 countByEnumeratingWithState:&v98 objects:v111 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v99;
      do
      {
        for (uint64_t k = 0; k != v66; ++k)
        {
          if (*(void *)v99 != v67) {
            objc_enumerationMutation(v64);
          }
          v69 = *(void **)(*((void *)&v98 + 1) + 8 * k);
          v70 = [v64 objectForKey:v69];
          if (a4->maxVocabularySize - 1 >= [v69 unsignedIntegerValue]) {
            [(NSDictionary *)v97 setObject:v70 forKey:v69];
          }
        }
        uint64_t v66 = [v64 countByEnumeratingWithState:&v98 objects:v111 count:16];
      }
      while (v66);
    }

    v11 = v87;
    objc_storeStrong((id *)&v87->_dataProvider, v86);
    long long v72 = *(_OWORD *)&a4->maxSplitTokens;
    long long v71 = *(_OWORD *)&a4->maxLabels;
    *(_OWORD *)&v87->_parameters.splitSentences = *(_OWORD *)&a4->splitSentences;
    *(_OWORD *)&v87->_parameters.maxSplitTokens = v72;
    *(_OWORD *)&v87->_parameters.maxLabels = v71;
    locators = v87->_locators;
    v87->_locators = v93;
    v74 = v93;

    labelMap = v87->_labelMap;
    v87->_labelMap = v96;
    v76 = v96;

    inverseLabelMap = v87->_inverseLabelMap;
    v87->_inverseLabelMap = v88;
    v78 = v88;

    vocabularyMap = v87->_vocabularyMap;
    v87->_vocabularyMap = v94;
    v80 = v94;

    documentFrequencyMap = v87->_documentFrequencyMap;
    v87->_documentFrequencyMap = v97;

    v87->_numberOfLabels = v47 + 1;
    v87->_numberOfVocabularyEntries = v95 + 1;

    id v9 = v89;
    id v10 = v92;
  }

  return v11;
}

- (id)configuration
{
  return [(NLDataProvider *)self->_dataProvider configuration];
}

- (unint64_t)numberOfInstances
{
  return [(NSArray *)self->_locators count];
}

- (id)instanceAtIndex:(unint64_t)a3
{
  v4 = [(NSArray *)self->_locators objectAtIndex:a3];
  v5 = -[NLDataProvider instanceAtIndex:](self->_dataProvider, "instanceAtIndex:", [v4 instanceIndex]);
  v6 = objc_msgSend(v5, "subInstanceWithLocator:tokenizer:", v4, -[NLConstrainedDataProvider tokenizer](self, "tokenizer"));

  return v6;
}

- (__CFStringTokenizer)tokenizer
{
  return [(NLDataProvider *)self->_dataProvider tokenizer];
}

- (id)labelMap
{
  return self->_labelMap;
}

- (id)inverseLabelMap
{
  return self->_inverseLabelMap;
}

- (id)vocabularyMap
{
  return self->_vocabularyMap;
}

- (id)documentFrequencyMap
{
  return self->_documentFrequencyMap;
}

- (unint64_t)numberOfLabels
{
  return self->_numberOfLabels;
}

- (unint64_t)numberOfVocabularyEntries
{
  return self->_numberOfVocabularyEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentFrequencyMap, 0);
  objc_storeStrong((id *)&self->_vocabularyMap, 0);
  objc_storeStrong((id *)&self->_inverseLabelMap, 0);
  objc_storeStrong((id *)&self->_labelMap, 0);
  objc_storeStrong((id *)&self->_locators, 0);

  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end