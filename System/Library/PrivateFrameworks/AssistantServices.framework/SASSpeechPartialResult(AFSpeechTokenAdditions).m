@interface SASSpeechPartialResult(AFSpeechTokenAdditions)
+ (id)createUsingPhrases:()AFSpeechTokenAdditions andUtterances:;
@end

@implementation SASSpeechPartialResult(AFSpeechTokenAdditions)

+ (id)createUsingPhrases:()AFSpeechTokenAdditions andUtterances:
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  v8 = [v6 array];
  v9 = [v7 firstObject];

  v10 = [v9 interpretationIndices];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __83__SASSpeechPartialResult_AFSpeechTokenAdditions__createUsingPhrases_andUtterances___block_invoke;
  v18 = &unk_1E5925DF8;
  id v19 = v5;
  id v20 = v8;
  id v11 = v8;
  id v12 = v5;
  [v10 enumerateObjectsUsingBlock:&v15];

  id v13 = objc_alloc_init(MEMORY[0x1E4F969A0]);
  objc_msgSend(v13, "setTokens:", v11, v15, v16, v17, v18);

  return v13;
}

@end