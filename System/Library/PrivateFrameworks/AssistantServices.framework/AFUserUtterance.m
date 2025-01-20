@interface AFUserUtterance
- (AFUserUtterance)initWithPhrases:(id)a3 correctionIdentifier:(id)a4;
- (AFUserUtterance)initWithPhrases:(id)a3 sentenceConfidence:(int64_t)a4 utterances:(id)a5 correctionIdentifier:(id)a6;
- (AFUserUtterance)initWithPhrases:(id)a3 utterances:(id)a4;
- (AFUserUtterance)initWithString:(id)a3 correctionIdentifier:(id)a4;
- (AFUserUtterance)initWithTokens:(id)a3 correctionIdentifier:(id)a4;
- (NSArray)allPhrases;
- (NSArray)dictationResult;
- (NSDictionary)correctionIdentifier;
- (id)allRecognitionStringsAndScores;
- (id)bestTextInterpretation;
- (id)description;
- (id)interpretationOfUtteranceAtIndex:(unint64_t)a3;
- (id)longestCommonSubsequenceBetweenList:(id)a3 andList:(id)a4;
- (id)rangeListOfDifferingTextFromSpeechInterpretation:(id)a3 comparedToBaseTokenList:(id)a4;
- (id)rangeListOfDifferingTextFromSpeechInterpretation:(id)a3 comparedToBaseUtteranceAtIndex:(unint64_t)a4;
- (id)rangeListOfDifferingTextFromTargetTokenList:(id)a3 comparedToBaseTokenList:(id)a4;
- (id)rangeListOfDifferingTextFromUtteranceAtIndex:(unint64_t)a3 comparedToBaseUtteranceAtIndex:(unint64_t)a4;
- (id)speechTokensForUtteranceAtIndex:(unint64_t)a3;
- (id)streamingTokens;
- (id)textOfUtteranceAtIndex:(unint64_t)a3;
- (id)updateDictationResult:(id)a3 withAlternativeUtteranceAtIndex:(unint64_t)a4;
- (int64_t)numberOfAlternativeUtterances;
- (void)_updatePhraseswithSwapIndices:(id)a3;
- (void)_updateUtteranceswithAlternativeUtteranceAtIndex:(unint64_t)a3 swapIndices:(id)a4;
@end

@implementation AFUserUtterance

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctionIdentifier, 0);
  objc_storeStrong((id *)&self->_utterances, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
}

- (NSDictionary)correctionIdentifier
{
  return self->_correctionIdentifier;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NSMutableArray *)self->_phrases count];
  uint64_t v7 = [(NSMutableArray *)self->_tokens count];
  v8 = [(AFUserUtterance *)self bestTextInterpretation];
  v9 = [v3 stringWithFormat:@"<%@: %p; %lu phrases; %lu tokens; text: \"%@\">", v5, self, v6, v7, v8];

  return v9;
}

- (id)streamingTokens
{
  return self->_tokens;
}

- (NSArray)dictationResult
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_phrases)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obuint64_t j = self->_phrases;
    uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = [*(id *)(*((void *)&v22 + 1) + 8 * i) interpretations];
          v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v10 = v8;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v19;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v19 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = [*(id *)(*((void *)&v18 + 1) + 8 * j) text];
                [v9 addObject:v15];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v12);
          }

          [v3 addObject:v9];
        }
        uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v5);
    }
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (NSArray)allPhrases
{
  v2 = (void *)[(NSMutableArray *)self->_phrases copy];
  v3 = [v2 firstObject];
  uint64_t v4 = [v3 firstInterpretation];
  uint64_t v5 = [v4 tokens];
  uint64_t v6 = [v5 firstObject];
  [v6 setRemoveSpaceBefore:1];

  return (NSArray *)v2;
}

- (id)updateDictationResult:(id)a3 withAlternativeUtteranceAtIndex:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NSMutableArray *)self->_utterances count] <= a4)
  {
    long long v21 = [(AFUserUtterance *)self allPhrases];
  }
  else
  {
    uint64_t v7 = [(NSMutableArray *)self->_utterances objectAtIndex:a4];
    v8 = [v7 interpretationIndices];

    v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    uint64_t v10 = [v8 count];
    if (v10 == [v6 count])
    {
      unint64_t v24 = a4;
      uint64_t v11 = [v8 count];
      if (v11 >= 1)
      {
        uint64_t v12 = v11;
        for (uint64_t i = 0; i != v12; ++i)
        {
          v14 = [v6 objectAtIndex:i];
          v15 = [v8 objectAtIndex:i];
          unint64_t v16 = [v15 integerValue];

          [v9 addObject:&unk_1EEE968F0];
          if (v16 && v16 < [v14 count])
          {
            v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v16];
            [v9 replaceObjectAtIndex:i withObject:v17];
          }
        }
      }
      [(AFUserUtterance *)self _updateUtteranceswithAlternativeUtteranceAtIndex:v24 swapIndices:v9];
      [(AFUserUtterance *)self _updatePhraseswithSwapIndices:v9];
      long long v18 = [(NSMutableArray *)self->_utterances objectAtIndex:0];
      long long v19 = [(NSMutableArray *)self->_utterances objectAtIndex:v24];
      uint64_t v20 = [v18 confidenceScore];
      objc_msgSend(v18, "setConfidenceScore:", objc_msgSend(v19, "confidenceScore"));
      [v19 setConfidenceScore:v20];
      long long v21 = [(AFUserUtterance *)self allPhrases];
    }
    else
    {
      long long v22 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[AFUserUtterance updateDictationResult:withAlternativeUtteranceAtIndex:]";
        __int16 v27 = 2050;
        unint64_t v28 = a4;
        _os_log_error_impl(&dword_19CF1D000, v22, OS_LOG_TYPE_ERROR, "%s utterance index %{public}lu out of range", buf, 0x16u);
      }
      long long v21 = [(AFUserUtterance *)self allPhrases];
    }
  }
  return v21;
}

- (void)_updateUtteranceswithAlternativeUtteranceAtIndex:(unint64_t)a3 swapIndices:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  if ([(NSMutableArray *)self->_utterances count])
  {
    unint64_t v9 = 0;
    *(void *)&long long v8 = 136315650;
    long long v31 = v8;
    v32 = self;
    v33 = v7;
    unint64_t v34 = a3;
    do
    {
      uint64_t v10 = -[NSMutableArray objectAtIndex:](self->_utterances, "objectAtIndex:", v9, v31);
      uint64_t v11 = v10;
      if (v9 == a3 || !v9)
      {
        [v7 setObject:v10 atIndexedSubscript:v9];
      }
      else
      {
        uint64_t v12 = [v10 interpretationIndices];
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
        uint64_t v14 = [v12 count];
        if (v14 == [v6 count])
        {
          if ([v6 count])
          {
            unint64_t v15 = 0;
            do
            {
              unint64_t v16 = [v6 objectAtIndex:v15];
              uint64_t v17 = [v16 integerValue];

              long long v18 = [v12 objectAtIndex:v15];
              uint64_t v19 = [v18 integerValue];

              if (v19 == v17) {
                uint64_t v20 = 0;
              }
              else {
                uint64_t v20 = v19;
              }
              if (!v19) {
                uint64_t v20 = v17;
              }
              if (v17 >= 1) {
                uint64_t v21 = v20;
              }
              else {
                uint64_t v21 = v19;
              }
              long long v22 = [MEMORY[0x1E4F28ED0] numberWithInteger:v21];
              [v13 setObject:v22 atIndexedSubscript:v15];

              ++v15;
            }
            while (v15 < [v6 count]);
          }
          long long v23 = -[AFSpeechUtterance initWithInterpretationIndices:confidenceScore:]([AFSpeechUtterance alloc], "initWithInterpretationIndices:confidenceScore:", v13, [v11 confidenceScore]);
          -[AFSpeechUtterance setSource:](v23, "setSource:", [v11 source]);
          uint64_t v7 = v33;
          [v33 addObject:v23];

          self = v32;
          a3 = v34;
        }
        else
        {
          unint64_t v24 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          {
            long long v25 = v24;
            v26 = [v11 interpretationIndices];
            uint64_t v27 = [v26 count];
            uint64_t v28 = [v6 count];
            *(_DWORD *)buf = v31;
            v36 = "-[AFUserUtterance _updateUtteranceswithAlternativeUtteranceAtIndex:swapIndices:]";
            __int16 v37 = 2050;
            uint64_t v38 = v27;
            __int16 v39 = 2050;
            uint64_t v40 = v28;
            _os_log_error_impl(&dword_19CF1D000, v25, OS_LOG_TYPE_ERROR, "%s utterance interpretationIndices count (%{public}ld) does not match swapIndices count (%{public}ld)", buf, 0x20u);

            a3 = v34;
            uint64_t v7 = v33;
          }
          [v7 addObject:v11];
        }
      }
      ++v9;
    }
    while (v9 < [(NSMutableArray *)self->_utterances count]);
  }
  uint64_t v29 = (NSMutableArray *)[v7 copy];
  utterances = self->_utterances;
  self->_utterances = v29;
}

- (void)_updatePhraseswithSwapIndices:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_phrases count];
  if (v5 == [v4 count])
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    if ([(NSMutableArray *)self->_phrases count])
    {
      unint64_t v7 = 0;
      do
      {
        long long v8 = [v4 objectAtIndex:v7];
        unint64_t v9 = [v8 integerValue];

        uint64_t v10 = [(NSMutableArray *)self->_phrases objectAtIndex:v7];
        uint64_t v11 = v10;
        if (v9
          && ([v10 interpretations],
              uint64_t v12 = objc_claimAutoreleasedReturnValue(),
              unint64_t v13 = [v12 count],
              v12,
              v9 < v13))
        {
          uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
          unint64_t v15 = [v11 interpretations];
          if ([v15 count])
          {
            unint64_t v16 = 0;
            do
            {
              if (v9 == v16) {
                unint64_t v17 = 0;
              }
              else {
                unint64_t v17 = v16;
              }
              if (v16) {
                unint64_t v18 = v17;
              }
              else {
                unint64_t v18 = v9;
              }
              uint64_t v19 = [v15 objectAtIndex:v18];
              [v14 addObject:v19];

              ++v16;
            }
            while (v16 < [v15 count]);
          }
          uint64_t v20 = -[AFSpeechPhrase initWithInterpretations:isLowConfidence:]([AFSpeechPhrase alloc], "initWithInterpretations:isLowConfidence:", v14, [v11 isLowConfidence]);
          [(NSMutableArray *)v6 addObject:v20];
        }
        else
        {
          [(NSMutableArray *)v6 addObject:v11];
        }

        ++v7;
      }
      while (v7 < [(NSMutableArray *)self->_phrases count]);
    }
    phrases = self->_phrases;
    self->_phrases = v6;
  }
  else
  {
    long long v22 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      long long v23 = self->_phrases;
      unint64_t v24 = v22;
      int v25 = 136315650;
      v26 = "-[AFUserUtterance _updatePhraseswithSwapIndices:]";
      __int16 v27 = 2050;
      uint64_t v28 = [(NSMutableArray *)v23 count];
      __int16 v29 = 2050;
      uint64_t v30 = [v4 count];
      _os_log_error_impl(&dword_19CF1D000, v24, OS_LOG_TYPE_ERROR, "%s _phrase count (%{public}ld) not match swapIndices count (%{public}ld)", (uint8_t *)&v25, 0x20u);
    }
  }
}

- (id)allRecognitionStringsAndScores
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (self->_phrases)
  {
    if ([(NSMutableArray *)self->_utterances count])
    {
      if ([(NSMutableArray *)self->_utterances count])
      {
        unint64_t v4 = 0;
        uint64_t v56 = 136315394;
        do
        {
          uint64_t v5 = -[NSMutableArray objectAtIndex:](self->_utterances, "objectAtIndex:", v4, v56);
          uint64_t v6 = [v5 confidenceScore];
          unint64_t v7 = [(AFUserUtterance *)self textOfUtteranceAtIndex:v4];
          if (v7)
          {
            v75[0] = @"avg";
            long long v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:v6];
            v76[0] = v8;
            v75[1] = @"index";
            unint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v4];
            v76[1] = v9;
            v75[2] = @"source";
            uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v5, "source"));
            v76[2] = v10;
            uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:3];
            [v3 setObject:v11 forKey:v7];
          }
          else
          {
            uint64_t v12 = AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v56;
              *(void *)&uint8_t buf[4] = "-[AFUserUtterance allRecognitionStringsAndScores]";
              *(_WORD *)&buf[12] = 2050;
              *(void *)&buf[14] = v4;
              _os_log_error_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_ERROR, "%s No utterance text existed for utterance index %{public}lu", buf, 0x16u);
            }
          }

          ++v4;
        }
        while (v4 < [(NSMutableArray *)self->_utterances count]);
      }
      goto LABEL_68;
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v14 = self->_phrases;
    uint64_t v21 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v58 objects:v74 count:16];
    if (!v21) {
      goto LABEL_67;
    }
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v59;
    v57 = &buf[16];
LABEL_22:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v59 != v23) {
        objc_enumerationMutation(v14);
      }
      int v25 = objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * v24), "allInterpretationStringsAndScores", v57);
      if ([v3 count])
      {
        if ([v25 count])
        {
          id v26 = v3;
          id v27 = v25;
          if ([v27 count])
          {
            if ([v26 count])
            {
              id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __af_mergedUtteranceDictionary_block_invoke;
              v82 = &unk_1E5925B40;
              id v83 = v27;
              id v29 = v28;
              id v84 = v29;
              [v26 enumerateKeysAndObjectsUsingBlock:buf];
              uint64_t v30 = v84;
              id v31 = v29;

LABEL_34:
              [v26 setDictionary:v31];

              goto LABEL_35;
            }
            id v32 = v27;
          }
          else
          {
            id v32 = v26;
          }
          id v31 = v32;
          goto LABEL_34;
        }
      }
      else
      {
        [v3 setDictionary:v25];
      }
LABEL_35:

      if (v22 == ++v24)
      {
        uint64_t v22 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v58 objects:v74 count:16];
        if (!v22) {
          goto LABEL_67;
        }
        goto LABEL_22;
      }
    }
  }
  tokens = self->_tokens;
  if (tokens)
  {
    af_bestTokenInterpretation(tokens);
    uint64_t v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    unint64_t v15 = self->_tokens;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v70 objects:buf count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v71 != v19) {
            objc_enumerationMutation(v15);
          }
          v18 += [*(id *)(*((void *)&v70 + 1) + 8 * i) confidenceScore];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v70 objects:buf count:16];
      }
      while (v17);
    }
    else
    {
      uint64_t v18 = 0;
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v33 = v15;
    uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v66 objects:v80 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v67;
      uint64_t v37 = -1;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v67 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v39 = [*(id *)(*((void *)&v66 + 1) + 8 * j) confidenceScore];
          if (v39 > v37) {
            uint64_t v37 = v39;
          }
        }
        uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v66 objects:v80 count:16];
      }
      while (v35);
    }
    else
    {
      uint64_t v37 = -1;
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v40 = v33;
    uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v62 objects:v79 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v63;
      uint64_t v44 = 1000;
      do
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v63 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v46 = [*(id *)(*((void *)&v62 + 1) + 8 * k) confidenceScore];
          if (v46 < v44) {
            uint64_t v44 = v46;
          }
        }
        uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v62 objects:v79 count:16];
      }
      while (v42);
    }
    else
    {
      uint64_t v44 = 1000;
    }

    uint64_t v47 = [(NSMutableArray *)v40 count];
    if (v47 < 1) {
      uint64_t v48 = 0;
    }
    else {
      uint64_t v48 = v18 / v47;
    }
    v77[0] = @"avg";
    v49 = [MEMORY[0x1E4F28ED0] numberWithInteger:v48];
    v78[0] = v49;
    v77[1] = @"max";
    v50 = [MEMORY[0x1E4F28ED0] numberWithInteger:v37];
    v78[1] = v50;
    v77[2] = @"min";
    v51 = [MEMORY[0x1E4F28ED0] numberWithInteger:v44];
    v78[2] = v51;
    v77[3] = @"sum";
    v52 = [MEMORY[0x1E4F28ED0] numberWithInteger:v18];
    v78[3] = v52;
    v77[4] = @"count";
    v53 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[NSMutableArray count](v40, "count"));
    v78[4] = v53;
    v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:5];

    [v3 setObject:v54 forKey:v14];
LABEL_67:
  }
  else if (self->_text)
  {
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E4F1CC08]);
  }
LABEL_68:
  return v3;
}

- (id)interpretationOfUtteranceAtIndex:(unint64_t)a3
{
  utterances = self->_utterances;
  if (utterances && [(NSMutableArray *)utterances count] > a3)
  {
    uint64_t v6 = [(NSMutableArray *)self->_utterances objectAtIndex:a3];
    unint64_t v7 = [v6 interpretationIndices];
    uint64_t v8 = [v7 count];
    uint64_t v9 = [(NSMutableArray *)self->_phrases count];

    if (v8 == v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v11 = [v6 interpretationIndices];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __52__AFUserUtterance_interpretationOfUtteranceAtIndex___block_invoke;
      uint64_t v18 = &unk_1E5925DF8;
      uint64_t v19 = self;
      id v20 = v10;
      id v12 = v10;
      [v11 enumerateObjectsUsingBlock:&v15];

      unint64_t v13 = objc_alloc_init(AFSpeechInterpretation);
      -[AFSpeechInterpretation setTokens:](v13, "setTokens:", v12, v15, v16, v17, v18, v19);

      goto LABEL_7;
    }
  }
  unint64_t v13 = 0;
LABEL_7:
  return v13;
}

void __52__AFUserUtterance_interpretationOfUtteranceAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = a2;
  id v12 = [v5 objectAtIndex:a3];
  unint64_t v7 = [v12 interpretations];
  uint64_t v8 = [v6 unsignedIntegerValue];

  uint64_t v9 = [v7 objectAtIndex:v8];

  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v11 = [v9 tokens];
  [v10 addObjectsFromArray:v11];
}

- (id)textOfUtteranceAtIndex:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_phrases && [(NSMutableArray *)self->_utterances count] > a3)
  {
    uint64_t v5 = [(NSMutableArray *)self->_utterances objectAtIndex:a3];
    id v6 = [v5 interpretationIndices];
    uint64_t v7 = [v6 count];
    if (v7 == [(NSMutableArray *)self->_phrases count])
    {
      uint64_t v8 = [MEMORY[0x1E4F28E78] string];
      if ([(NSMutableArray *)self->_phrases count])
      {
        unint64_t v10 = 0;
        *(void *)&long long v9 = 136315650;
        long long v21 = v9;
        do
        {
          uint64_t v11 = objc_msgSend(v6, "objectAtIndex:", v10, v21);
          unint64_t v12 = [v11 unsignedIntegerValue];

          unint64_t v13 = [(NSMutableArray *)self->_phrases objectAtIndex:v10];
          uint64_t v14 = [v13 interpretations];

          if (v12 >= [v14 count])
          {
            uint64_t v17 = AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v21;
              uint64_t v23 = "-[AFUserUtterance textOfUtteranceAtIndex:]";
              __int16 v24 = 2050;
              unint64_t v25 = v12;
              __int16 v26 = 2112;
              id v27 = v14;
              _os_log_error_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_ERROR, "%s utterance interpretationIndex (%{public}lu) is out of range of interpretations=%@", buf, 0x20u);
            }
          }
          else
          {
            uint64_t v15 = [v14 objectAtIndex:v12];
            uint64_t v16 = [v15 text];
            [v8 appendString:v16];
          }
          ++v10;
        }
        while (v10 < [(NSMutableArray *)self->_phrases count]);
      }
    }
    else
    {
      uint64_t v18 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        phrases = self->_phrases;
        *(_DWORD *)buf = 136315650;
        uint64_t v23 = "-[AFUserUtterance textOfUtteranceAtIndex:]";
        __int16 v24 = 2112;
        unint64_t v25 = (unint64_t)phrases;
        __int16 v26 = 2114;
        id v27 = v6;
        _os_log_error_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_ERROR, "%s Phrase length is not the same as interpretationIndices. Phrases=%@, interpretationIndices=%{public}@", buf, 0x20u);
      }
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)rangeListOfDifferingTextFromTargetTokenList:(id)a3 comparedToBaseTokenList:(id)a4
{
  id v6 = a3;
  long long v21 = [(AFUserUtterance *)self longestCommonSubsequenceBetweenList:v6 andList:a4];
  unint64_t v7 = [v21 count];
  id v20 = [MEMORY[0x1E4F1CA48] array];
  if ([v6 count])
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    char v11 = 0;
    do
    {
      if (v9 >= v7)
      {
        BOOL v14 = 1;
      }
      else
      {
        unint64_t v12 = [v21 objectAtIndex:v9];
        uint64_t v13 = [v12 unsignedIntegerValue];

        BOOL v14 = v10 != v13;
        if (v10 == v13) {
          ++v9;
        }
      }
      uint64_t v15 = [v6 objectAtIndex:v10];
      uint64_t v16 = [v15 text];
      uint64_t v17 = [v16 length];

      if (!((v8 == 0) | v11 & 1)) {
        v8 += [v15 removeSpaceBefore] ^ 1;
      }
      if (v14)
      {
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v8, v17);
        [v20 addObject:v18];
      }
      v8 += v17;
      char v11 = [v15 removeSpaceAfter];

      ++v10;
    }
    while (v10 < [v6 count]);
  }

  return v20;
}

- (id)rangeListOfDifferingTextFromSpeechInterpretation:(id)a3 comparedToBaseTokenList:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [a3 tokens];
  uint64_t v8 = [(AFUserUtterance *)self rangeListOfDifferingTextFromTargetTokenList:v7 comparedToBaseTokenList:v6];

  return v8;
}

- (id)rangeListOfDifferingTextFromSpeechInterpretation:(id)a3 comparedToBaseUtteranceAtIndex:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(AFUserUtterance *)self speechTokensForUtteranceAtIndex:a4];
  uint64_t v8 = [(AFUserUtterance *)self rangeListOfDifferingTextFromSpeechInterpretation:v6 comparedToBaseTokenList:v7];

  return v8;
}

- (id)longestCommonSubsequenceBetweenList:(id)a3 andList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v42 = [MEMORY[0x1E4F1CA48] array];
  v45 = v5;
  uint64_t v7 = [v5 count];
  uint64_t v44 = v6;
  uint64_t v8 = [v6 count];
  unint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7 + 1];
  if (v7 == -1) {
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  do
  {
    char v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8 + 1];
    uint64_t v12 = v8 + 1;
    if (v8 != -1)
    {
      do
      {
        [v11 addObject:&unk_1EEE968F0];
        --v12;
      }
      while (v12);
    }
    [v9 addObject:v11];
  }
  while (v10++ != v7);
  if (v7)
  {
LABEL_8:
    uint64_t v14 = 0;
    uint64_t v43 = v7;
    do
    {
      while (1)
      {
        uint64_t v15 = v14 + 1;
        if (v8) {
          break;
        }
        ++v14;
        if (v15 == v7) {
          goto LABEL_28;
        }
      }
      uint64_t v16 = 0;
      do
      {
        uint64_t v17 = [v45 objectAtIndex:v14];
        uint64_t v18 = [v17 text];
        uint64_t v19 = [v44 objectAtIndex:v16];
        id v20 = [v19 text];
        int v21 = [v18 isEqualToString:v20];

        if (v21)
        {
          uint64_t v22 = (void *)MEMORY[0x1E4F28ED0];
          uint64_t v23 = [v9 objectAtIndexedSubscript:v14];
          id v24 = [v23 objectAtIndexedSubscript:v16];
          unint64_t v25 = objc_msgSend(v22, "numberWithInt:", objc_msgSend(v24, "intValue") + 1);
          __int16 v26 = [v9 objectAtIndexedSubscript:v14 + 1];
          [v26 setObject:v25 atIndexedSubscript:++v16];
        }
        else
        {
          id v27 = [v9 objectAtIndexedSubscript:v14 + 1];
          uint64_t v28 = [v27 objectAtIndexedSubscript:v16];

          id v29 = [v9 objectAtIndexedSubscript:v14];
          uint64_t v30 = [v29 objectAtIndexedSubscript:++v16];

          if (v28 >= v30) {
            id v31 = v28;
          }
          else {
            id v31 = v30;
          }
          id v24 = v31;

          uint64_t v23 = [v9 objectAtIndexedSubscript:v14 + 1];
          [v23 setObject:v24 atIndexedSubscript:v16];
        }
      }
      while (v16 != v8);
      ++v14;
      uint64_t v7 = v43;
    }
    while (v15 != v43);
    do
    {
      id v32 = [v9 objectAtIndexedSubscript:v7];
      v33 = [v32 objectAtIndexedSubscript:v8];
      uint64_t v34 = [v9 objectAtIndexedSubscript:v7 - 1];
      uint64_t v35 = [v34 objectAtIndexedSubscript:v8];

      if (v33 != v35)
      {
        uint64_t v36 = [v9 objectAtIndexedSubscript:v7];
        uint64_t v37 = [v36 objectAtIndexedSubscript:v8];
        uint64_t v38 = [v9 objectAtIndexedSubscript:v7];
        uint64_t v39 = [v38 objectAtIndexedSubscript:--v8];

        if (v37 == v39) {
          continue;
        }
        uint64_t v40 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v7 - 1];
        [v42 insertObject:v40 atIndex:0];
      }
      --v7;
    }
    while (v7 && v8);
  }
LABEL_28:

  return v42;
}

- (id)speechTokensForUtteranceAtIndex:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_utterances count] <= a3)
  {
    uint64_t v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v21 = "-[AFUserUtterance speechTokensForUtteranceAtIndex:]";
      __int16 v22 = 2050;
      unint64_t v23 = a3;
      _os_log_error_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_ERROR, "%s utterance index (%{public}lu) is out of range", buf, 0x16u);
    }
    id v5 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [(NSMutableArray *)self->_utterances objectAtIndex:a3];
    uint64_t v7 = [v6 interpretationIndices];

    if ([(NSMutableArray *)self->_phrases count])
    {
      unint64_t v9 = 0;
      *(void *)&long long v8 = 136315650;
      long long v19 = v8;
      do
      {
        uint64_t v10 = objc_msgSend(v7, "objectAtIndex:", v9, v19);
        unint64_t v11 = [v10 unsignedIntegerValue];

        uint64_t v12 = [(NSMutableArray *)self->_phrases objectAtIndex:v9];
        uint64_t v13 = [v12 interpretations];

        if (v11 >= [v13 count])
        {
          uint64_t v16 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            int v21 = "-[AFUserUtterance speechTokensForUtteranceAtIndex:]";
            __int16 v22 = 2050;
            unint64_t v23 = v11;
            __int16 v24 = 2112;
            unint64_t v25 = v13;
            _os_log_error_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_ERROR, "%s utterance interpretationIndex (%{public}lu) is out of range of interpretations=%@", buf, 0x20u);
          }
        }
        else
        {
          uint64_t v14 = [v13 objectAtIndex:v11];
          uint64_t v15 = [v14 tokens];
          [v5 addObjectsFromArray:v15];
        }
        ++v9;
      }
      while (v9 < [(NSMutableArray *)self->_phrases count]);
    }
  }
  return v5;
}

- (id)rangeListOfDifferingTextFromUtteranceAtIndex:(unint64_t)a3 comparedToBaseUtteranceAtIndex:(unint64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a3 == a4) {
    goto LABEL_17;
  }
  if ([(NSMutableArray *)self->_utterances count] <= a3)
  {
    unint64_t v25 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      id v27 = 0;
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315394;
    id v32 = "-[AFUserUtterance rangeListOfDifferingTextFromUtteranceAtIndex:comparedToBaseUtteranceAtIndex:]";
    __int16 v33 = 2050;
    unint64_t v34 = a3;
    uint64_t v26 = "%s utterance index (%{public}lu) is out of range";
LABEL_23:
    _os_log_error_impl(&dword_19CF1D000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x16u);
    goto LABEL_17;
  }
  if ([(NSMutableArray *)self->_utterances count] <= a4)
  {
    unint64_t v25 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315394;
    id v32 = "-[AFUserUtterance rangeListOfDifferingTextFromUtteranceAtIndex:comparedToBaseUtteranceAtIndex:]";
    __int16 v33 = 2050;
    unint64_t v34 = a4;
    uint64_t v26 = "%s base utterance index (%{public}lu) is out of range";
    goto LABEL_23;
  }
  uint64_t v7 = [(NSMutableArray *)self->_utterances objectAtIndex:a3];
  long long v8 = [v7 interpretationIndices];

  unint64_t v9 = [(NSMutableArray *)self->_utterances objectAtIndex:a4];
  uint64_t v10 = [v9 interpretationIndices];

  uint64_t v30 = [MEMORY[0x1E4F1CA48] array];
  if ([(NSMutableArray *)self->_phrases count])
  {
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    *(void *)&long long v11 = 136315650;
    long long v29 = v11;
    do
    {
      uint64_t v14 = objc_msgSend(v8, "objectAtIndex:", v13, v29);
      unint64_t v15 = [v14 unsignedIntegerValue];

      uint64_t v16 = [v10 objectAtIndex:v13];
      uint64_t v17 = [v16 unsignedIntegerValue];

      uint64_t v18 = [(NSMutableArray *)self->_phrases objectAtIndex:v13];
      long long v19 = [v18 interpretations];

      if (v15 >= [v19 count])
      {
        __int16 v24 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v29;
          id v32 = "-[AFUserUtterance rangeListOfDifferingTextFromUtteranceAtIndex:comparedToBaseUtteranceAtIndex:]";
          __int16 v33 = 2050;
          unint64_t v34 = v15;
          __int16 v35 = 2112;
          uint64_t v36 = v19;
          _os_log_error_impl(&dword_19CF1D000, v24, OS_LOG_TYPE_ERROR, "%s utterance interpretationIndex (%{public}lu) is out of range of interpretations=%@", buf, 0x20u);
        }
      }
      else
      {
        id v20 = [v19 objectAtIndex:v15];
        int v21 = [v20 text];
        __int16 v22 = v21;
        if (v15 != v17)
        {
          unint64_t v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v12, objc_msgSend(v21, "length"));
          [v30 addObject:v23];
        }
        v12 += [v22 length];
      }
      ++v13;
    }
    while (v13 < [(NSMutableArray *)self->_phrases count]);
  }

  id v27 = v30;
LABEL_18:
  return v27;
}

- (id)bestTextInterpretation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_phrases)
  {
    tokens = self->_tokens;
    if (tokens)
    {
      af_bestTokenInterpretation(tokens);
      unint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      text = self->_text;
      if (!text)
      {
        long long v11 = &stru_1EEE35D28;
        goto LABEL_15;
      }
      unint64_t v13 = text;
    }
    long long v11 = v13;
    goto LABEL_15;
  }
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v4 = self->_phrases;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "firstInterpretation", (void)v16);
        uint64_t v10 = [v9 tokens];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  af_bestTokenInterpretation(v3);
  long long v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v11;
}

- (int64_t)numberOfAlternativeUtterances
{
  return [(NSMutableArray *)self->_utterances count];
}

- (AFUserUtterance)initWithString:(id)a3 correctionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFUserUtterance;
  long long v8 = [(AFUserUtterance *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    correctionIdentifier = v8->_correctionIdentifier;
    v8->_correctionIdentifier = (NSDictionary *)v9;

    uint64_t v11 = [v6 copy];
    text = v8->_text;
    v8->_text = (NSString *)v11;
  }
  return v8;
}

- (AFUserUtterance)initWithTokens:(id)a3 correctionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFUserUtterance;
  long long v8 = [(AFUserUtterance *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    correctionIdentifier = v8->_correctionIdentifier;
    v8->_correctionIdentifier = (NSDictionary *)v9;

    uint64_t v11 = [v6 copy];
    tokens = v8->_tokens;
    v8->_tokens = (NSMutableArray *)v11;
  }
  return v8;
}

- (AFUserUtterance)initWithPhrases:(id)a3 sentenceConfidence:(int64_t)a4 utterances:(id)a5 correctionIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)AFUserUtterance;
  unint64_t v13 = [(AFUserUtterance *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    correctionIdentifier = v13->_correctionIdentifier;
    v13->_correctionIdentifier = (NSDictionary *)v14;

    uint64_t v16 = [v10 copy];
    phrases = v13->_phrases;
    v13->_phrases = (NSMutableArray *)v16;

    uint64_t v18 = [v11 copy];
    utterances = v13->_utterances;
    v13->_utterances = (NSMutableArray *)v18;

    v13->_sentenceConfidence = a4;
  }

  return v13;
}

- (AFUserUtterance)initWithPhrases:(id)a3 utterances:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFUserUtterance;
  long long v8 = [(AFUserUtterance *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    phrases = v8->_phrases;
    v8->_phrases = (NSMutableArray *)v9;

    uint64_t v11 = [v7 copy];
    utterances = v8->_utterances;
    v8->_utterances = (NSMutableArray *)v11;
  }
  return v8;
}

- (AFUserUtterance)initWithPhrases:(id)a3 correctionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFUserUtterance;
  long long v8 = [(AFUserUtterance *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    correctionIdentifier = v8->_correctionIdentifier;
    v8->_correctionIdentifier = (NSDictionary *)v9;

    uint64_t v11 = [v6 copy];
    phrases = v8->_phrases;
    v8->_phrases = (NSMutableArray *)v11;
  }
  return v8;
}

@end