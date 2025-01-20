@interface SASSpeechPartialResult
@end

@implementation SASSpeechPartialResult

void __83__SASSpeechPartialResult_AFSpeechTokenAdditions__createUsingPhrases_andUtterances___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3, 0);
  v7 = [v6 interpretations];
  v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "integerValue"));
  v9 = [v8 tokens];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(a1 + 40);
        v15 = [*(id *)(*((void *)&v16 + 1) + 8 * v13) aceToken];
        [v14 addObject:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

@end