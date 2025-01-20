@interface AXPredictiveTypingModel
- (AXPredictiveTypingModel)init;
- (id)_completionPredictionsForPrefix:(id)a3 entireText:(id)a4 desiredNumber:(unint64_t)a5;
- (id)_lastPartialWordForText:(id)a3 orEndOfSentence:(BOOL *)a4;
- (id)_nextWordPredictionsForText:(id)a3 desiredNumber:(unint64_t)a4;
- (id)predictionsForText:(id)a3;
- (id)predictionsForText:(id)a3 desiredNumber:(unint64_t)a4;
- (unsigned)_newContextForText:(id)a3 includeLastToken:(BOOL)a4 length:(int64_t *)a5;
- (void)dealloc;
- (void)enumerateTokensForText:(id)a3 usingBlock:(id)a4;
@end

@implementation AXPredictiveTypingModel

- (AXPredictiveTypingModel)init
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)AXPredictiveTypingModel;
  v2 = [(AXPredictiveTypingModel *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en"];
    uint64_t v6 = *MEMORY[0x1E4F723C8];
    v7[0] = v3;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    v2->_wordModel = (void *)LMLanguageModelCreate();
  }
  return v2;
}

- (void)dealloc
{
  LMLanguageModelRelease();
  v3.receiver = self;
  v3.super_class = (Class)AXPredictiveTypingModel;
  [(AXPredictiveTypingModel *)&v3 dealloc];
}

- (void)enumerateTokensForText:(id)a3 usingBlock:(id)a4
{
  objc_super v5 = (__CFString *)a3;
  uint64_t v6 = (void (**)(id, void *, CFIndex, CFIndex, unsigned char *))a4;
  CFLocaleRef v7 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en"];
  v13.length = [(__CFString *)v5 length];
  v13.location = 0;
  v8 = CFStringTokenizerCreate(0, v5, v13, 4uLL, v7);
  unsigned __int8 v12 = 0;
  do
  {
    if (!CFStringTokenizerAdvanceToNextToken(v8)) {
      break;
    }
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v8);
    v10 = -[__CFString substringWithRange:](v5, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
    v6[2](v6, v10, CurrentTokenRange.location, CurrentTokenRange.length, &v12);
    int v11 = v12;
  }
  while (!v11);
  CFRelease(v8);
}

- (unsigned)_newContextForText:(id)a3 includeLastToken:(BOOL)a4 length:(int64_t *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __70__AXPredictiveTypingModel__newContextForText_includeLastToken_length___block_invoke;
  v19 = &unk_1E5586240;
  id v10 = v9;
  id v20 = v10;
  v21 = self;
  [(AXPredictiveTypingModel *)self enumerateTokensForText:v8 usingBlock:&v16];
  int64_t v11 = objc_msgSend(v10, "count", v16, v17, v18, v19) - !v6;
  unsigned __int8 v12 = (unsigned int *)malloc_type_malloc(4 * v11, 0x100004052888210uLL);
  if (v11)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      v14 = [v10 objectAtIndexedSubscript:i];
      v12[i] = [v14 unsignedIntegerValue];
    }
  }
  if (a5) {
    *a5 = v11;
  }

  return v12;
}

void __70__AXPredictiveTypingModel__newContextForText_includeLastToken_length___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_super v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v4 = [v8 stringByTrimmingCharactersInSet:v3];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    BOOL v6 = *(void **)(a1 + 32);
    CFLocaleRef v7 = [NSNumber numberWithUnsignedInt:LMLanguageModelGetTokenIDForString()];
    [v6 addObject:v7];
  }
}

- (id)_completionPredictionsForPrefix:(id)a3 entireText:(id)a4 desiredNumber:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  id v10 = [(AXPredictiveTypingModel *)self _newContextForText:v9 includeLastToken:0 length:&v22];
  if (3 * a5 <= 0x32) {
    unint64_t v11 = 50;
  }
  else {
    unint64_t v11 = 3 * a5;
  }
  unsigned __int8 v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  id v20 = v8;
  v21 = v9;
  id v13 = v12;
  id v14 = v9;
  id v15 = v8;
  LMLanguageModelEnumerateCompletionsForPrefixWithBlock();
  free(v10);
  objc_msgSend(v13, "sortUsingComparator:", &__block_literal_global_3, v19, 3221225472, __84__AXPredictiveTypingModel__completionPredictionsForPrefix_entireText_desiredNumber___block_invoke, &unk_1E5586268, self);
  if ([v13 count] <= a5)
  {
    id v16 = v13;
  }
  else
  {
    objc_msgSend(v13, "subarrayWithRange:", 0, a5);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v17 = v16;

  return v17;
}

void __84__AXPredictiveTypingModel__completionPredictionsForPrefix_entireText_desiredNumber___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id StringForTokenID = (id)LMLanguageModelCreateStringForTokenID();
  if ([StringForTokenID length])
  {
    uint64_t v5 = objc_alloc_init(AXTypingPrediction);
    [(AXTypingPrediction *)v5 setFullWord:StringForTokenID];
    BOOL v6 = objc_msgSend(StringForTokenID, "substringFromIndex:", objc_msgSend(*(id *)(a1 + 40), "length"));
    CFLocaleRef v7 = [v6 stringByAppendingString:@" "];
    [(AXTypingPrediction *)v5 setTextToInsert:v7];

    [(AXTypingPrediction *)v5 setPrefix:*(void *)(a1 + 40)];
    -[AXTypingPrediction setRangeToReplace:](v5, "setRangeToReplace:", [*(id *)(a1 + 48) length], 0);
    LMLanguageModelConditionalProbability();
    [(AXTypingPrediction *)v5 setProbability:__exp10(v8)];
    [*(id *)(a1 + 56) addObject:v5];
  }
  if ([*(id *)(a1 + 56) count] == *(void *)(a1 + 80)) {
    *a3 = 1;
  }
}

uint64_t __84__AXPredictiveTypingModel__completionPredictionsForPrefix_entireText_desiredNumber___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 probability];
  double v7 = v6;
  [v5 probability];
  if (v7 <= v8 + 2.22044605e-16)
  {
    [v4 probability];
    double v11 = v10;
    [v5 probability];
    uint64_t v9 = v11 < v12 + -2.22044605e-16;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (id)_lastPartialWordForText:(id)a3 orEndOfSentence:(BOOL *)a4
{
  id v5 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v6 = [v5 length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__AXPredictiveTypingModel__lastPartialWordForText_orEndOfSentence___block_invoke;
  v10[3] = &unk_1E55862B0;
  double v12 = &v18;
  id v7 = v5;
  id v11 = v7;
  id v13 = &v14;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 1283, v10);
  if (a4) {
    *a4 = *((unsigned char *)v15 + 24);
  }
  id v8 = (id)v19[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __67__AXPredictiveTypingModel__lastPartialWordForText_orEndOfSentence___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if (a5 + a6 == a3 + a4)
  {
    uint64_t v9 = [a2 copy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    double v12 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
    id v13 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v11 = [v12 stringByTrimmingCharactersInSet:v13];

    if ([v11 length]
      && ([v11 characterAtIndex:0] == 63
       || [v11 characterAtIndex:0] == 46
       || [v11 characterAtIndex:0] == 33))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }

  *a7 = 1;
}

- (id)_nextWordPredictionsForText:(id)a3 desiredNumber:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  uint64_t v13 = 0;
  id v8 = [(AXPredictiveTypingModel *)self _newContextForText:v6 includeLastToken:1 length:&v13];
  id v12 = v7;
  id v9 = v6;
  LMLanguageModelEnumeratePredictionsWithBlock();
  free(v8);
  id v10 = v12;

  return v10;
}

uint64_t __69__AXPredictiveTypingModel__nextWordPredictionsForText_desiredNumber___block_invoke(uint64_t a1, _DWORD *a2, double a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if (*a2 < 3u) {
    goto LABEL_11;
  }
  id StringForTokenID = (void *)LMLanguageModelCreateStringForTokenID();
  if ([StringForTokenID length])
  {
    id v10 = objc_alloc_init(AXTypingPrediction);
    [(AXTypingPrediction *)v10 setFullWord:StringForTokenID];
    id v11 = [StringForTokenID stringByAppendingString:@" "];
    [(AXTypingPrediction *)v10 setTextToInsert:v11];

    if ([StringForTokenID length] == 1)
    {
      id v12 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
      if (objc_msgSend(v12, "characterIsMember:", objc_msgSend(StringForTokenID, "characterAtIndex:", 0)))
      {
        uint64_t v13 = [*(id *)(a1 + 40) length];

        if (v13)
        {
          uint64_t v14 = [*(id *)(a1 + 40) length] - 1;
          uint64_t v15 = 1;
LABEL_9:
          -[AXTypingPrediction setRangeToReplace:](v10, "setRangeToReplace:", v14, v15);
          [(AXTypingPrediction *)v10 setProbability:__exp10(a3)];
          [*(id *)(a1 + 48) addObject:v10];

          goto LABEL_10;
        }
      }
      else
      {
      }
    }
    uint64_t v14 = [*(id *)(a1 + 40) length];
    uint64_t v15 = 0;
    goto LABEL_9;
  }
LABEL_10:

LABEL_11:
  uint64_t result = [*(id *)(a1 + 48) count];
  if (result == *(void *)(a1 + 56)) {
    *a6 = 1;
  }
  return result;
}

- (id)predictionsForText:(id)a3 desiredNumber:(unint64_t)a4
{
  id v6 = [a3 lowercaseString];
  char v11 = 0;
  id v7 = [(AXPredictiveTypingModel *)self _lastPartialWordForText:v6 orEndOfSentence:&v11];
  if ([v7 length])
  {
    uint64_t v8 = [(AXPredictiveTypingModel *)self _completionPredictionsForPrefix:v7 entireText:v6 desiredNumber:a4];
LABEL_3:
    id v9 = (void *)v8;
    goto LABEL_6;
  }
  if (!v11)
  {
    uint64_t v8 = [(AXPredictiveTypingModel *)self _nextWordPredictionsForText:v6 desiredNumber:a4];
    goto LABEL_3;
  }
  id v9 = 0;
LABEL_6:

  return v9;
}

- (id)predictionsForText:(id)a3
{
  return [(AXPredictiveTypingModel *)self predictionsForText:a3 desiredNumber:15];
}

@end