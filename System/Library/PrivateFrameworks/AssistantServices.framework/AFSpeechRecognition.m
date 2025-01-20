@interface AFSpeechRecognition
+ (BOOL)supportsSecureCoding;
+ (id)fakeOneBestFromPhrases:(id)a3;
+ (id)tokenListFromUtterance:(id)a3 phrases:(id)a4;
+ (id)transcriptFromTokens:(id)a3;
- (AFSpeechRecognition)initWithCoder:(id)a3;
- (AFSpeechRecognition)initWithDictionary:(id)a3;
- (AFSpeechRecognition)initWithPhrases:(id)a3;
- (AFSpeechRecognition)initWithPhrases:(id)a3 utterances:(id)a4;
- (AFSpeechRecognition)initWithPhrases:(id)a3 utterances:(id)a4 processedAudioDuration:(double)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)phrases;
- (NSArray)utterances;
- (double)averageOneBestConfidenceScore;
- (double)processedAudioDuration;
- (id)aceRecognition;
- (id)dictionaryRepresentation;
- (id)nBestTokenListsFromSausage;
- (id)nBestTokenListsLossless;
- (id)nBestTranscripts;
- (id)oneBestTokenList;
- (id)oneBestTranscript;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSpeechRecognition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterances, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
}

- (double)processedAudioDuration
{
  return self->_processedAudioDuration;
}

- (NSArray)utterances
{
  return self->_utterances;
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v4 = self->_phrases;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v6);
  }

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v11 = self->_utterances;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "dictionaryRepresentation", (void)v19);
        [v10 addObject:v16];
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v13);
  }

  v27[0] = @"phrases";
  v27[1] = @"utterances";
  v28[0] = v3;
  v28[1] = v10;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  return v17;
}

- (AFSpeechRecognition)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"phrases"];
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = v5;
  if (v8 && (NSClassFromString((NSString *)v7), (objc_opt_isKindOfClass() & 1) != 0))
  {

    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    uint64_t v25 = 0;
    long long v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__10648;
    v29 = __Block_byref_object_dispose__10649;
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __42__AFSpeechRecognition_initWithDictionary___block_invoke;
    v24[3] = &unk_1E5926638;
    v24[4] = &v31;
    v24[5] = &v25;
    [v8 enumerateObjectsUsingBlock:v24];
    if (*((unsigned char *)v32 + 24) || ![(id)v26[5] count])
    {
      v9 = 0;
    }
    else
    {
      id v10 = [v4 objectForKey:@"utterances"];
      v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      id v13 = v10;
      uint64_t v14 = v12;
      v15 = v14;
      if (v13 && (NSClassFromString(v14), (objc_opt_isKindOfClass() & 1) != 0))
      {

        *((unsigned char *)v32 + 24) = 0;
        uint64_t v18 = 0;
        long long v19 = &v18;
        uint64_t v20 = 0x3032000000;
        long long v21 = __Block_byref_object_copy__10648;
        long long v22 = __Block_byref_object_dispose__10649;
        id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __42__AFSpeechRecognition_initWithDictionary___block_invoke_2;
        v17[3] = &unk_1E5926638;
        v17[4] = &v31;
        v17[5] = &v18;
        [v13 enumerateObjectsUsingBlock:v17];
        if (*((unsigned char *)v32 + 24) || ![(id)v19[5] count])
        {
          v9 = 0;
        }
        else
        {
          self = [(AFSpeechRecognition *)self initWithPhrases:v26[5] utterances:v19[5]];
          v9 = self;
        }
        _Block_object_dispose(&v18, 8);
      }
      else
      {

        v9 = 0;
      }
    }
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

void __42__AFSpeechRecognition_initWithDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = v6;
  id v12 = v9;
  if (v9
    && (NSClassFromString((NSString *)v8), isKindOfClass = objc_opt_isKindOfClass(), id v9 = v12, (isKindOfClass & 1) != 0))
  {
  }
  else
  {

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  v11 = [[AFSpeechPhrase alloc] initWithDictionary:v12];
  if (!v11)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v11];
}

void __42__AFSpeechRecognition_initWithDictionary___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = v6;
  id v12 = v9;
  if (v9
    && (NSClassFromString((NSString *)v8), isKindOfClass = objc_opt_isKindOfClass(), id v9 = v12, (isKindOfClass & 1) != 0))
  {
  }
  else
  {

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  v11 = [[AFSpeechUtterance alloc] initWithDictionary:v12];
  if (!v12)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v11];
}

- (id)aceRecognition
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F96998]);
  id v4 = [(NSArray *)self->_phrases _sa_mappedArrayWithBlock:&__block_literal_global_10653];
  [v3 setPhrases:v4];

  uint64_t v5 = [(NSArray *)self->_utterances _sa_mappedArrayWithBlock:&__block_literal_global_29];
  [v3 setUtterances:v5];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v22 = v3;
  obuint64_t j = [v3 phrases];
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    uint64_t v9 = 1000;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v12 = [v11 interpretations];
        id v13 = [v12 firstObject];
        uint64_t v14 = [v13 tokens];

        uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v19 = [*(id *)(*((void *)&v24 + 1) + 8 * j) confidenceScore];
              uint64_t v20 = [v19 integerValue];

              if (v20 < v9) {
                uint64_t v9 = v20;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v16);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v9 = 1000;
  }

  [v22 setSentenceConfidence:v9];
  return v22;
}

id __37__AFSpeechRecognition_aceRecognition__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F969D8];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  uint64_t v5 = [v3 interpretationIndices];

  [v4 setInterpretationIndices:v5];
  return v4;
}

id __37__AFSpeechRecognition_aceRecognition__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F96988];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  uint64_t v5 = [v3 interpretations];

  uint64_t v6 = objc_msgSend(v5, "_sa_mappedArrayWithBlock:", &__block_literal_global_22);
  [v4 setInterpretations:v6];

  return v4;
}

id __37__AFSpeechRecognition_aceRecognition__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F96980];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  uint64_t v5 = [v3 tokens];

  uint64_t v6 = objc_msgSend(v5, "_sa_mappedArrayWithBlock:", &__block_literal_global_26);
  [v4 setTokens:v6];

  return v4;
}

uint64_t __37__AFSpeechRecognition_aceRecognition__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 aceToken];
}

- (AFSpeechRecognition)initWithPhrases:(id)a3 utterances:(id)a4 processedAudioDuration:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AFSpeechRecognition;
  id v10 = [(AFSpeechRecognition *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    phrases = v10->_phrases;
    v10->_phrases = (NSArray *)v11;

    uint64_t v13 = [v9 copy];
    utterances = v10->_utterances;
    v10->_utterances = (NSArray *)v13;

    v10->_processedAudioDuration = a5;
  }

  return v10;
}

- (AFSpeechRecognition)initWithPhrases:(id)a3 utterances:(id)a4
{
  return [(AFSpeechRecognition *)self initWithPhrases:a3 utterances:a4 processedAudioDuration:0.0];
}

- (AFSpeechRecognition)initWithPhrases:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() fakeOneBestFromPhrases:v4];
  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  uint64_t v7 = [(AFSpeechRecognition *)self initWithPhrases:v4 utterances:v6];

  return v7;
}

- (id)nBestTokenListsLossless
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(AFSpeechRecognition *)self utterances];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
    uint64_t v6 = 0;
    *(void *)&long long v7 = 136315138;
    long long v17 = v7;
    do
    {
      id v8 = [(AFSpeechRecognition *)self utterances];
      id v9 = [v8 objectAtIndex:v6];

      id v10 = [v9 interpretation];
      uint64_t v11 = [v10 tokens];

      if (v11)
      {
        id v12 = [v9 interpretation];
        uint64_t v13 = [v12 tokens];
        [v5 addObject:v13];
      }
      else
      {
        uint64_t v14 = AFSiriLogContextSpeech;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v17;
          long long v19 = "-[AFSpeechRecognition nBestTokenListsLossless]";
          _os_log_error_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_ERROR, "%s Nil tokens for utterance!", buf, 0xCu);
        }
      }

      ++v6;
    }
    while (v4 != v6);
    if ([v5 count]) {
      id v15 = v5;
    }
    else {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }
  return v15;
}

- (id)nBestTokenListsFromSausage
{
  id v3 = [(AFSpeechRecognition *)self utterances];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
    for (uint64_t i = 0; i != v4; ++i)
    {
      long long v7 = [(AFSpeechRecognition *)self utterances];
      id v8 = [v7 objectAtIndex:i];

      id v9 = [(AFSpeechRecognition *)self phrases];
      id v10 = +[AFSpeechRecognition tokenListFromUtterance:v8 phrases:v9];

      if (v10) {
        [v5 addObject:v10];
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (double)averageOneBestConfidenceScore
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(AFSpeechRecognition *)self oneBestTokenList];
  uint64_t v3 = [v2 count];
  if (v3)
  {
    unint64_t v4 = v3;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v2;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      double v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          double v9 = v9 + (double)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "confidenceScore", (void)v13);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      double v9 = 0.0;
    }

    double v11 = v9 / (double)v4;
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

- (id)oneBestTokenList
{
  uint64_t v3 = [(AFSpeechRecognition *)self utterances];
  unint64_t v4 = [v3 firstObject];

  id v5 = [(AFSpeechRecognition *)self phrases];
  uint64_t v6 = +[AFSpeechRecognition tokenListFromUtterance:v4 phrases:v5];

  return v6;
}

- (id)nBestTranscripts
{
  v2 = [(AFSpeechRecognition *)self nBestTokenListsFromSausage];
  uint64_t v3 = [v2 count];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v7 = [v2 objectAtIndex:i];
      uint64_t v8 = +[AFSpeechRecognition transcriptFromTokens:v7];
      [v5 addObject:v8];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)oneBestTranscript
{
  v2 = [(AFSpeechRecognition *)self oneBestTokenList];
  uint64_t v3 = +[AFSpeechRecognition transcriptFromTokens:v2];

  return v3;
}

- (AFSpeechRecognition)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AFSpeechRecognition;
  id v5 = [(AFSpeechRecognition *)&v18 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    uint64_t v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_phrases"];
    phrases = v5->_phrases;
    v5->_phrases = (NSArray *)v9;

    double v11 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    long long v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_utterances"];
    utterances = v5->_utterances;
    v5->_utterances = (NSArray *)v14;

    [v4 decodeDoubleForKey:@"_processedAudioDuration"];
    v5->_processedAudioDuration = v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  phrases = self->_phrases;
  id v5 = a3;
  [v5 encodeObject:phrases forKey:@"_phrases"];
  [v5 encodeObject:self->_utterances forKey:@"_utterances"];
  [v5 encodeDouble:@"_processedAudioDuration" forKey:self->_processedAudioDuration];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_phrases hash];
  id v4 = [(NSArray *)self->_phrases firstObject];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = v5 ^ v3 ^ [(NSArray *)self->_utterances hash];
  uint64_t v7 = [(NSArray *)self->_utterances firstObject];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((uint64_t v5 = (NSArray *)v4[1], v5 == self->_phrases) || -[NSArray isEqualToArray:](v5, "isEqualToArray:")))
  {
    uint64_t v6 = (NSArray *)v4[2];
    if (v6 == self->_utterances) {
      char v7 = 1;
    }
    else {
      char v7 = -[NSArray isEqualToArray:](v6, "isEqualToArray:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)fakeOneBestFromPhrases:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
  if (v4)
  {
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    for (uint64_t i = 0; i != v4; ++i)
    {
      [v5 addObject:&unk_1EEE96B60];
      uint64_t v9 = [v3 objectAtIndex:i];
      id v10 = [v9 interpretations];
      double v11 = v10;
      if (v10 && [v10 count])
      {
        id v12 = [v11 firstObject];
        v6 += [v12 averageConfidenceScore];

        ++v7;
      }
    }
    if (v7) {
      uint64_t v4 = v6 / v7;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  long long v13 = [[AFSpeechUtterance alloc] initWithInterpretationIndices:v5 confidenceScore:v4];

  return v13;
}

+ (id)tokenListFromUtterance:(id)a3 phrases:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [a3 interpretationIndices];
  uint64_t v7 = [v6 count];
  if (v7 && (uint64_t v8 = v7, [v5 count]))
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
    for (uint64_t i = 0; i != v8; ++i)
    {
      double v11 = [v5 objectAtIndex:i];
      id v12 = [v11 interpretations];

      if ([v12 count])
      {
        long long v13 = [v6 objectAtIndex:i];
        uint64_t v14 = [v13 unsignedIntegerValue];

        long long v15 = [v12 objectAtIndex:v14];
        double v16 = [v15 tokens];
        [v9 addObjectsFromArray:v16];
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)transcriptFromTokens:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      int v9 = 1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          double v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (((v9 | objc_msgSend(v11, "removeSpaceBefore", (void)v14)) & 1) == 0) {
            [v4 appendString:@" "];
          }
          id v12 = [v11 text];
          if (v12) {
            [v4 appendString:v12];
          }
          int v9 = [v11 removeSpaceAfter];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end