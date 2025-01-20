@interface SASRecognition(AFSpeechTokenAdditions)
- (id)af_speechPhrases;
- (id)af_speechUtterances;
@end

@implementation SASRecognition(AFSpeechTokenAdditions)

- (id)af_speechUtterances
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v1 = [a1 utterances];
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  }
  else
  {
    v3 = 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_alloc_init(AFSpeechUtterance);
        v11 = objc_msgSend(v9, "interpretationIndices", (void)v14);
        [(AFSpeechUtterance *)v10 setInterpretationIndices:v11];

        [v9 confidenceScore];
        [(AFSpeechUtterance *)v10 setConfidenceScore:(uint64_t)v12];
        [(AFSpeechUtterance *)v10 setSource:1];
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)af_speechPhrases
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v1 = [a1 phrases];
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  }
  else
  {
    v3 = 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_alloc_init(AFSpeechPhrase);
        v11 = objc_msgSend(v9, "af_speechInterpretations", (void)v13);
        [(AFSpeechPhrase *)v10 setInterpretations:v11];

        -[AFSpeechPhrase setIsLowConfidence:](v10, "setIsLowConfidence:", [v9 lowConfidence]);
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

@end