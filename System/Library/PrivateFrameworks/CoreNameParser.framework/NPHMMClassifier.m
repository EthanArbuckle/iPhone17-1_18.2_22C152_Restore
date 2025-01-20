@interface NPHMMClassifier
- ($00D837B2FE8B211969D4E4E0E8844E72)stateProbabilities;
- (BOOL)formCompoundFamilyName:(id)a3;
- (BOOL)formCompoundGivenName:(id)a3;
- (BOOL)isCoupleName:(id)a3;
- (BOOL)isGivenNameAbbreviation:(id)a3;
- (BOOL)isInitial:(id)a3;
- (BOOL)isLinkingToken:(id)a3;
- (BOOL)isParticle:(id)a3;
- (BOOL)validSequence:(id)a3 compoundsConstraints:(id)a4 labelsConstraints:(id)a5;
- (NPHMMClassifier)initWithHMMProbabilities:(id *)a3 nameComponentsDate:(id)a4;
- (_CFBurstTrie)nameFrequencyTrieRef;
- (double)emissionProbability:(id)a3 hiddenState:(unint64_t)a4 isOOV:(BOOL *)a5;
- (double)startProbability:(id)a3;
- (double)stateTransitionProbabilityFrom:(id)a3 to:(id)a4;
- (id)candidatesBasedOnCommaDelimiterIndex:(unint64_t)a3 sequenceSize:(unint64_t)a4;
- (id)candidatesBasedOnFormatSequence:(id)a3;
- (id)candidatesOfSize:(unint64_t)a3 constraints:(unint64_t)a4 compoundsConstraints:(id)a5 labelsContraints:(id)a6;
- (id)compoundsFromName:(id)a3;
- (id)compoundsFromName:(id)a3 includeSpaceAsDelimiter:(BOOL)a4;
- (id)hiddenStatesFromObservationSequence:(id)a3;
- (id)probabilityForHiddenSequence:(id)a3 knowingObservationSequence:(id)a4 boost:(unint64_t)a5;
- (unint64_t)extractMetricForType:(unint64_t)a3;
- (unint64_t)frequencyForName:(id)a3 type:(unint64_t)a4;
- (unint64_t)genderMajorityForGivenName:(id)a3;
- (unint64_t)payloadForName:(id)a3 type:(unint64_t)a4;
- (void)dealloc;
- (void)setStateProbabilities:(id *)a3;
@end

@implementation NPHMMClassifier

- (NPHMMClassifier)initWithHMMProbabilities:(id *)a3 nameComponentsDate:(id)a4
{
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NPHMMClassifier;
  v8 = [(NPHMMClassifier *)&v17 init];
  v9 = v8;
  if (v8)
  {
    long long v10 = *(_OWORD *)&a3->var0.var2;
    v15[0] = *(_OWORD *)&a3->var0.var0;
    v15[1] = v10;
    v15[2] = *(_OWORD *)&a3->var1.var1;
    double var2 = a3->var2;
    [(NPHMMClassifier *)v8 setStateProbabilities:v15];
    objc_storeStrong((id *)&v9->_nameComponentsData, a4);
    pthread_mutex_lock(&_NPHMMClassifierLock);
    uint64_t v11 = _NPHMMClassifierInstanceCount;
    if (!_nameFrequencyTrie && !_NPHMMClassifierInstanceCount)
    {
      v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v13 = [v12 pathForResource:@"name_frequencies" ofType:@"trie"];

      _nameFrequencyTrie = CFBurstTrieCreateFromFile();
      uint64_t v11 = _NPHMMClassifierInstanceCount;
    }
    _NPHMMClassifierInstanceCount = v11 + 1;
    pthread_mutex_unlock(&_NPHMMClassifierLock);
    v9->_totalGivenNamesCount = [(NPHMMClassifier *)v9 extractMetricForType:2];
    v9->_totalFamilyNamesCount = [(NPHMMClassifier *)v9 extractMetricForType:3];
    v9->_uniqueGivenNamesCount = [(NPHMMClassifier *)v9 extractMetricForType:1];
    v9->_uniqueFamilyNamesCount = [(NPHMMClassifier *)v9 extractMetricForType:1];
  }

  return v9;
}

- (unint64_t)payloadForName:(id)a3 type:(unint64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v5 stringByAppendingString:@"!"];
  }
  v8 = v7;
  [v7 length];
  if (CFBurstTrieContains()) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (unint64_t)frequencyForName:(id)a3 type:(unint64_t)a4
{
  unint64_t v5 = -[NPHMMClassifier payloadForName:type:](self, "payloadForName:type:", a3);
  unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v5 / 0xA + 1;
    if (a4) {
      return v5 + 1;
    }
  }
  return v6;
}

- (void)dealloc
{
  pthread_mutex_lock(&_NPHMMClassifierLock);
  uint64_t v3 = --_NPHMMClassifierInstanceCount;
  if (_nameFrequencyTrie) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    CFBurstTrieRelease();
    _nameFrequencyTrie = 0;
  }
  pthread_mutex_unlock(&_NPHMMClassifierLock);
  v5.receiver = self;
  v5.super_class = (Class)NPHMMClassifier;
  [(NPHMMClassifier *)&v5 dealloc];
}

- (unint64_t)extractMetricForType:(unint64_t)a3
{
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  BOOL v4 = [v3 stringValue];
  objc_super v5 = [v4 stringByAppendingString:@"#"];

  [v5 length];
  CFBurstTrieContains();

  return 0;
}

- (id)hiddenStatesFromObservationSequence:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v69 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v71 = v4;
  v80 = self;
  if (v5)
  {
    for (uint64_t i = 0; v5 != i; ++i)
    {
      unint64_t v9 = [v4 objectAtIndexedSubscript:i];
      int v10 = [v9 isEqualToString:@","];

      if (v10)
      {
        self = v80;
        if (!i || v5 - 1 == i) {
          goto LABEL_11;
        }
        uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:i];
        [v69 addObject:v11];
      }
      else
      {
        v12 = [v4 objectAtIndexedSubscript:i];
        uint64_t v11 = _NPTrimNonLetters(v12);

        if ([v11 length])
        {
          v13 = [v4 objectAtIndexedSubscript:i];
          [v6 addObject:v13];

          v14 = [v11 lowercaseString];
          [v7 addObject:v14];
        }
        self = v80;
      }

LABEL_11:
      id v4 = v71;
    }
  }
  uint64_t v15 = [v6 count];
  context = (void *)[v69 count];
  id v72 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v78 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  obuint64_t j = v6;
  uint64_t v16 = [obj countByEnumeratingWithState:&v87 objects:v92 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)v88;
    uint64_t v20 = 4;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        uint64_t v22 = v20;
        if (*(void *)v88 != v19) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v87 + 1) + 8 * j);
        if ([(NPHMMClassifier *)self isInitial:v23])
        {
          int v24 = 0;
          unsigned int v25 = 0;
          uint64_t v20 = 2;
        }
        else if ([(NPHMMClassifier *)self isGivenNameAbbreviation:v23])
        {
          int v24 = 0;
          unsigned int v25 = 0;
          uint64_t v20 = 3;
        }
        else
        {
          v26 = [v23 uppercaseString];
          unsigned int v25 = [v26 isEqualToString:v23];

          self = v80;
          int v24 = v25 ^ 1;
          uint64_t v20 = v25;
        }
        if (v22 != 1) {
          int v24 = 0;
        }
        if (v22) {
          unsigned int v27 = 0;
        }
        else {
          unsigned int v27 = v25;
        }
        uint64_t v28 = v18 + (v24 | v27);
        if (v22 != 4) {
          uint64_t v18 = v28;
        }
        v29 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v20];
        [v78 addObject:v29];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v87 objects:v92 count:16];
    }
    while (v17);
  }
  else
  {
    uint64_t v18 = 0;
  }

  v76 = objc_opt_new();
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v31 = v30;
  if (v18 == 1)
  {
    uint64_t v32 = [(NPHMMClassifier *)self candidatesBasedOnFormatSequence:v78];
LABEL_37:
    v75 = (void *)v32;
    id v30 = (id)[v31 addObject:v32];
    goto LABEL_39;
  }
  if (context == (void *)1)
  {
    v33 = [v69 objectAtIndexedSubscript:0];
    uint64_t v32 = -[NPHMMClassifier candidatesBasedOnCommaDelimiterIndex:sequenceSize:](self, "candidatesBasedOnCommaDelimiterIndex:sequenceSize:", [v33 integerValue], objc_msgSend(v7, "count"));

    goto LABEL_37;
  }
  v75 = 0;
LABEL_39:
  uint64_t v34 = v15 - 1;
  if (v15 != 1)
  {
    for (uint64_t k = 0; v34 != k; ++k)
    {
      v36 = (void *)MEMORY[0x1E4E70970](v30);
      v37 = objc_msgSend(v7, "subarrayWithRange:", k, 2);
      BOOL v38 = [(NPHMMClassifier *)v80 formCompoundGivenName:v37];
      if (v38)
      {
        v39 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:k];
        [v72 setObject:&unk_1F3F3FAC0 forKeyedSubscript:v39];
      }
      if ([(NPHMMClassifier *)v80 formCompoundFamilyName:v37])
      {
        v40 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:k];
        [v72 setObject:&unk_1F3F3FAD8 forKeyedSubscript:v40];

        if (!v38) {
          goto LABEL_52;
        }
      }
      else
      {
        if (k) {
          char v41 = v38;
        }
        else {
          char v41 = 1;
        }
        if (v41) {
          goto LABEL_52;
        }
        v42 = [v71 objectAtIndexedSubscript:k];
        BOOL v43 = [(NPHMMClassifier *)v80 isParticle:v42];

        if (!v43) {
          goto LABEL_52;
        }
      }
      v44 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:k];
      [v72 setObject:&unk_1F3F3FAC0 forKeyedSubscript:v44];

LABEL_52:
      v45 = [v78 objectAtIndexedSubscript:k];
      uint64_t v46 = [v45 integerValue];

      if (v46 == 3)
      {
        v47 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:k];
        [v70 setObject:&unk_1F3F3FAC0 forKeyedSubscript:v47];
      }
    }
  }
  uint64_t v48 = [v7 count];
  v49 = v80;
  v68 = -[NPHMMClassifier candidatesOfSize:constraints:compoundsConstraints:labelsContraints:](v80, "candidatesOfSize:constraints:compoundsConstraints:labelsContraints:", v48, (unint64_t)(v48 - [v72 count]) > 1, v72, v70);
  objc_msgSend(v31, "unionSet:");
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v73 = v31;
  v50 = v75;
  uint64_t v77 = [v73 countByEnumeratingWithState:&v83 objects:v91 count:16];
  if (v77)
  {
    uint64_t v74 = *(void *)v84;
    do
    {
      for (uint64_t m = 0; m != v77; ++m)
      {
        if (*(void *)v84 != v74) {
          objc_enumerationMutation(v73);
        }
        v52 = *(void **)(*((void *)&v83 + 1) + 8 * m);
        contexta = (void *)MEMORY[0x1E4E70970]();
        if (v50 && [v52 isEqualToArray:v50])
        {
          v53 = [(NPHMMClassifier *)v49 probabilityForHiddenSequence:v52 knowingObservationSequence:v7 boost:1000];
          [v53 setFavorite:1];
        }
        else
        {
          v53 = [(NPHMMClassifier *)v49 probabilityForHiddenSequence:v52 knowingObservationSequence:v7 boost:1];
        }
        v54 = (void *)[obj copy];
        [v53 setObservation:v54];

        id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if ([v52 count])
        {
          unint64_t v57 = 0;
          do
          {
            v58 = [v52 objectAtIndexedSubscript:v57];
            int v59 = [v58 isEqual:&unk_1F3F3FAC0];

            if (v59)
            {
              v60 = [MEMORY[0x1E4F28ED0] numberWithInt:v57];
              [v55 addObject:v60];

              v61 = [v7 objectAtIndexedSubscript:v57];
              [v56 addObject:v61];
            }
            ++v57;
          }
          while ([v52 count] > v57);
        }
        if ((unint64_t)[v55 count] > 1)
        {
          v62 = [v55 lastObject];
          uint64_t v63 = [v62 integerValue];

          if (![(NPHMMClassifier *)v80 isCoupleName:v56])
          {
            v64 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v63 - 1];
            v65 = [v72 objectForKey:v64];

            if (!v65) {
              [v53 setValue:&unk_1F3F3FAF0 atSequenceIndex:v63];
            }
          }
        }
        [v76 addObject:v53];

        v49 = v80;
        v50 = v75;
      }
      uint64_t v77 = [v73 countByEnumeratingWithState:&v83 objects:v91 count:16];
    }
    while (v77);
  }

  v66 = (void *)[v76 copy];
  return v66;
}

- (BOOL)isCoupleName:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 count];
  if (v5 >= 3)
  {
    unint64_t v7 = v5;
    uint64_t v8 = 3;
    do
    {
      unint64_t v9 = [v4 objectAtIndexedSubscript:v8 - 2];
      BOOL v6 = [(NPHMMClassifier *)self isLinkingToken:v9];

      if (v6) {
        break;
      }
    }
    while (v7 != v8++);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isLinkingToken:(id)a3
{
  return [(NPNameComponentsData *)self->_nameComponentsData collectionForEntry:5 contains:a3];
}

- (id)candidatesBasedOnFormatSequence:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    uint64_t v9 = 4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "doubleValue", (void)v19);
        unint64_t v12 = (unint64_t)v11;
        v13 = &unk_1F3F3FAD8;
        if ((unint64_t)v11 != 1)
        {
          BOOL v14 = v12 == 2 && v9 == 1;
          v13 = &unk_1F3F3FAD8;
          if (!v14)
          {
            BOOL v15 = v12 == 2 && v9 == 0;
            BOOL v16 = v15;
            BOOL v17 = v12 && !v16;
            v13 = &unk_1F3F3FAC0;
            if (v17) {
              continue;
            }
          }
        }
        [v4 addObject:v13];
        uint64_t v9 = v12;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)candidatesBasedOnCommaDelimiterIndex:(unint64_t)a3 sequenceSize:(unint64_t)a4
{
  uint64_t v6 = objc_opt_new();
  if (a4)
  {
    unint64_t v7 = 0;
    do
    {
      if (v7 >= a3) {
        uint64_t v8 = &unk_1F3F3FAC0;
      }
      else {
        uint64_t v8 = &unk_1F3F3FAD8;
      }
      [v6 addObject:v8];
      ++v7;
    }
    while (a4 != v7);
  }
  return v6;
}

- (BOOL)validSequence:(id)a3 compoundsConstraints:(id)a4 labelsConstraints:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v35 = a5;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v9 = [v8 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v15 = [v14 integerValue];
        BOOL v16 = [v8 objectForKeyedSubscript:v14];
        uint64_t v17 = [v16 integerValue];

        uint64_t v18 = [v7 objectAtIndexedSubscript:v15];
        long long v19 = [v7 objectAtIndexedSubscript:v15 + 1];

        if (v18 != v19)
        {
LABEL_23:
          BOOL v33 = 0;
          uint64_t v24 = v35;
          goto LABEL_26;
        }
        if (v17 == 2)
        {
          long long v22 = [v7 objectAtIndexedSubscript:v15];
          uint64_t v23 = [v22 integerValue];

          if (v23 != 2) {
            goto LABEL_23;
          }
        }
        else if (v17 == 1)
        {
          long long v20 = [v7 objectAtIndexedSubscript:v15];
          uint64_t v21 = [v20 integerValue];

          if (v21) {
            goto LABEL_23;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v24 = v35;
  uint64_t v9 = [v35 allKeys];
  uint64_t v25 = [v9 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v37;
    while (2)
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(v9);
        }
        v29 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        id v30 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v29, "integerValue"));
        v31 = [v35 objectForKeyedSubscript:v29];
        int v32 = [v30 isEqual:v31];

        if (!v32)
        {
          BOOL v33 = 0;
          goto LABEL_26;
        }
      }
      uint64_t v26 = [v9 countByEnumeratingWithState:&v36 objects:v44 count:16];
      BOOL v33 = 1;
      if (v26) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v33 = 1;
  }
LABEL_26:

  return v33;
}

- (id)candidatesOfSize:(unint64_t)a3 constraints:(unint64_t)a4 compoundsConstraints:(id)a5 labelsContraints:(id)a6
{
  id v27 = a5;
  id v10 = a6;
  uint64_t v26 = objc_opt_new();
  uint64_t v11 = a4 == 1;
  unint64_t v12 = a3 - v11;
  if (a3 != v11)
  {
    unint64_t v13 = 1;
    do
    {
      BOOL v14 = objc_opt_new();
      if (v13)
      {
        for (unint64_t i = 1; i <= v13; ++i)
          objc_msgSend(v14, "addObject:", &unk_1F3F3FAC0, v26);
      }
      if (a3 != v13)
      {
        unint64_t v16 = 1;
        do
        {
          objc_msgSend(v14, "addObject:", &unk_1F3F3FAD8, v26);
          ++v16;
        }
        while (v16 <= a3 - v13);
      }
      if (-[NPHMMClassifier validSequence:compoundsConstraints:labelsConstraints:](self, "validSequence:compoundsConstraints:labelsConstraints:", v14, v27, v10, v26))
      {
        uint64_t v17 = (void *)[v14 copy];
        [v26 addObject:v17];
      }
      ++v13;
    }
    while (v13 <= v12);
    if (v12)
    {
      for (unint64_t j = 1; j <= v12; ++j)
      {
        long long v19 = objc_opt_new();
        if (j)
        {
          for (unint64_t k = 1; k <= j; ++k)
            [v19 addObject:&unk_1F3F3FAD8];
        }
        if (a3 != j)
        {
          unint64_t v21 = 1;
          do
          {
            [v19 addObject:&unk_1F3F3FAC0];
            ++v21;
          }
          while (v21 <= a3 - j);
        }
        if ([(NPHMMClassifier *)self validSequence:v19 compoundsConstraints:v27 labelsConstraints:v10])
        {
          long long v22 = (void *)[v19 copy];
          [v26 addObject:v22];
        }
      }
    }
  }
  uint64_t v23 = v26;
  uint64_t v24 = objc_msgSend(v26, "copy", v26);

  return v24;
}

- (id)probabilityForHiddenSequence:(id)a3 knowingObservationSequence:(id)a4 boost:(unint64_t)a5
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v43 = objc_opt_new();
  v45 = v8;
  uint64_t v9 = [v8 count];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    p_vtable = &OBJC_METACLASS___NPComponentSequence.vtable;
    double v13 = 0.0;
    BOOL v14 = &OBJC_METACLASS___NPComponentSequence.vtable;
    double v15 = 0.0;
    do
    {
      context = (void *)MEMORY[0x1E4E70970]();
      unint64_t v16 = [v7 objectAtIndexedSubscript:v11];
      uint64_t v17 = [v45 objectAtIndexedSubscript:v11];
      if (v11)
      {
        uint64_t v18 = [v7 objectAtIndexedSubscript:v11 - 1];
        [(NPHMMClassifier *)self stateTransitionProbabilityFrom:v18 to:v16];
        double v20 = v19;
      }
      else
      {
        [(NPHMMClassifier *)self startProbability:v16];
        double v20 = v21;
      }
      if (p_vtable[71] != (void *)-1) {
        dispatch_once(&probabilityForHiddenSequence_knowingObservationSequence_boost__onceToken, &__block_literal_global_1);
      }
      long long v22 = [NSString stringWithFormat:@"%@%@", v17, v16];
      uint64_t v23 = [v14[70] objectForKey:v22];
      uint64_t v24 = (void *)v17;
      uint64_t v25 = v23;
      unsigned __int8 v48 = 0;
      uint64_t v46 = v24;
      if (v23)
      {
        uint64_t v26 = [v23 objectAtIndexedSubscript:0];
        [v26 doubleValue];
        double v28 = v27;

        v29 = [v25 objectAtIndexedSubscript:1];
        unsigned __int8 v48 = [v29 BOOLValue];
      }
      else
      {
        [v16 doubleValue];
        [(NPHMMClassifier *)self emissionProbability:v24 hiddenState:(unint64_t)v30 isOOV:&v48];
        double v28 = v31;
        v44 = v14[70];
        v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
        v49[0] = v29;
        [MEMORY[0x1E4F28ED0] numberWithBool:v48];
        uint64_t v32 = v10;
        BOOL v33 = self;
        v35 = id v34 = v7;
        v49[1] = v35;
        long long v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
        [v44 setObject:v36 forKey:v22];

        BOOL v14 = (void **)(&OBJC_METACLASS___NPComponentSequence + 24);
        id v7 = v34;
        self = v33;
        uint64_t v10 = v32;
        p_vtable = (void **)(&OBJC_METACLASS___NPComponentSequence + 24);
      }

      if (v48)
      {
        long long v37 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v11];
        [v43 addObject:v37];

        BOOL v14 = (void **)(&OBJC_METACLASS___NPComponentSequence + 24);
      }
      double v13 = v13 + v20;
      double v15 = v15 + v28;

      ++v11;
    }
    while (v10 != v11);
  }
  else
  {
    double v15 = 0.0;
    double v13 = 0.0;
  }
  long long v38 = [NPComponentSequence alloc];
  long long v39 = (void *)[v43 copy];
  long long v40 = [(NPComponentSequence *)v38 initWithObservationSequence:v45 hiddenSequence:v7 oovIndices:v39 emissionModelScore:v15 stateModelScore:v13 boost:(double)log((double)a5)];

  return v40;
}

uint64_t __81__NPHMMClassifier_probabilityForHiddenSequence_knowingObservationSequence_boost___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)probabilityForHiddenSequence_knowingObservationSequence_boost__emissionCache;
  probabilityForHiddenSequence_knowingObservationSequence_boost__emissionCache = (uint64_t)v0;

  v2 = (void *)probabilityForHiddenSequence_knowingObservationSequence_boost__emissionCache;
  return [v2 setCountLimit:100];
}

- (double)startProbability:(id)a3
{
  if ([a3 unsignedIntegerValue])
  {
    [(NPHMMClassifier *)self stateProbabilities];
    id v4 = (long double *)&v7;
  }
  else
  {
    [(NPHMMClassifier *)self stateProbabilities];
    id v4 = (long double *)&v8;
  }
  long double v5 = *v4;
  return log(v5);
}

- (double)stateTransitionProbabilityFrom:(id)a3 to:(id)a4
{
  id v6 = a4;
  if ([a3 unsignedIntegerValue])
  {
    [(NPHMMClassifier *)self stateProbabilities];
    double v7 = v13;
    uint64_t v8 = (double *)v14;
  }
  else
  {
    [(NPHMMClassifier *)self stateProbabilities];
    double v7 = *(double *)&v14[3];
    uint64_t v8 = (double *)&v15;
  }
  double v9 = *v8;
  uint64_t v10 = [v6 unsignedIntegerValue];

  if (v10) {
    long double v11 = v9;
  }
  else {
    long double v11 = v7;
  }
  return log(v11);
}

- (double)emissionProbability:(id)a3 hiddenState:(unint64_t)a4 isOOV:(BOOL *)a5
{
  id v8 = a3;
  if (a5) {
    *a5 = 0;
  }
  double v9 = 0.0;
  if (![(NPHMMClassifier *)self isInitial:v8]
    && ![(NPNameComponentsData *)self->_nameComponentsData collectionForEntry:6 contains:v8])
  {
    long double v11 = _NPStripDiatritics(v8, v10);
    unint64_t v12 = [(NPHMMClassifier *)self compoundsFromName:v11];
    double v13 = [v12 componentsJoinedByString:@"*"];

    unint64_t v14 = [(NPHMMClassifier *)self frequencyForName:v13 type:a4];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a5) {
        *a5 = 1;
      }
      double v9 = 0.0 - log((double)(self->_totalFamilyNamesCount + self->_totalGivenNamesCount));
      goto LABEL_14;
    }
    double v9 = (double)v14;
    if (a4 == 2)
    {
      double v15 = log((double)v14);
      unint64_t totalFamilyNamesCount = self->_totalFamilyNamesCount;
    }
    else
    {
      if (a4)
      {
LABEL_14:

        goto LABEL_15;
      }
      double v15 = log((double)v14);
      unint64_t totalFamilyNamesCount = self->_totalGivenNamesCount;
    }
    double v9 = v15 - log((double)totalFamilyNamesCount);
    goto LABEL_14;
  }
LABEL_15:

  return v9;
}

- (BOOL)isInitial:(id)a3
{
  uint64_t v3 = isInitial__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isInitial__onceToken, &__block_literal_global_36);
  }
  long double v5 = [v4 stringByTrimmingCharactersInSet:isInitial__initialDelimiterSet];

  BOOL v6 = [v5 length] == 1;
  return v6;
}

uint64_t __29__NPHMMClassifier_isInitial___block_invoke()
{
  isInitial__initialDelimiterSet = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"."];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)isGivenNameAbbreviation:(id)a3
{
  return [(NPNameComponentsData *)self->_nameComponentsData collectionForEntry:8 contains:a3];
}

- (_CFBurstTrie)nameFrequencyTrieRef
{
  return (_CFBurstTrie *)_nameFrequencyTrie;
}

- (BOOL)formCompoundGivenName:(id)a3
{
  id v4 = [a3 componentsJoinedByString:@"*"];
  unint64_t v5 = [(NPHMMClassifier *)self frequencyForName:v4 type:0];
  BOOL v7 = v5 != 0x7FFFFFFFFFFFFFFFLL && v5 > 0xA;

  return v7;
}

- (BOOL)formCompoundFamilyName:(id)a3
{
  id v4 = [a3 componentsJoinedByString:@"*"];
  LOBYTE(self) = [(NPHMMClassifier *)self frequencyForName:v4 type:2] != 0x7FFFFFFFFFFFFFFFLL;

  return (char)self;
}

- (BOOL)isParticle:(id)a3
{
  return [(NPNameComponentsData *)self->_nameComponentsData collectionForEntry:7 contains:a3];
}

- (id)compoundsFromName:(id)a3
{
  return [(NPHMMClassifier *)self compoundsFromName:a3 includeSpaceAsDelimiter:0];
}

- (id)compoundsFromName:(id)a3 includeSpaceAsDelimiter:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4)
  {
    if (compoundsFromName_includeSpaceAsDelimiter__onceToken != -1) {
      dispatch_once(&compoundsFromName_includeSpaceAsDelimiter__onceToken, &__block_literal_global_42);
    }
    BOOL v6 = &compoundsFromName_includeSpaceAsDelimiter__compoundsCharacterDelimiterSetIncludingSpace;
  }
  else
  {
    if (compoundsFromName_includeSpaceAsDelimiter__onceToken_46 != -1) {
      dispatch_once(&compoundsFromName_includeSpaceAsDelimiter__onceToken_46, &__block_literal_global_48);
    }
    BOOL v6 = &compoundsFromName_includeSpaceAsDelimiter__compoundsCharacterDelimiterSet;
  }
  BOOL v7 = [v5 componentsSeparatedByCharactersInSet:*v6];

  return v7;
}

uint64_t __61__NPHMMClassifier_compoundsFromName_includeSpaceAsDelimiter___block_invoke()
{
  compoundsFromName_includeSpaceAsDelimiter__compoundsCharacterDelimiterSetIncludingSpace = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-| "];
  return MEMORY[0x1F41817F8]();
}

uint64_t __61__NPHMMClassifier_compoundsFromName_includeSpaceAsDelimiter___block_invoke_2()
{
  compoundsFromName_includeSpaceAsDelimiter__compoundsCharacterDelimiterSet = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-|"];
  return MEMORY[0x1F41817F8]();
}

- (unint64_t)genderMajorityForGivenName:(id)a3
{
  BOOL v4 = _NPStripDiatritics(a3, a2);
  id v5 = [(NPHMMClassifier *)self compoundsFromName:v4 includeSpaceAsDelimiter:1];
  BOOL v6 = [v5 componentsJoinedByString:@"*"];

  unint64_t v7 = [(NPHMMClassifier *)self payloadForName:v6 type:0];
  if (v7 % 0xA == 1) {
    unint64_t v8 = 2;
  }
  else {
    unint64_t v8 = v7 % 0xA == 2;
  }

  return v8;
}

- ($00D837B2FE8B211969D4E4E0E8844E72)stateProbabilities
{
  objc_copyStruct(retstr, &self->_stateProbabilities, 56, 1, 0);
  return result;
}

- (void)setStateProbabilities:(id *)a3
{
}

- (void).cxx_destruct
{
}

@end