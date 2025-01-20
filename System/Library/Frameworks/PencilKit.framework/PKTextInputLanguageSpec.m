@interface PKTextInputLanguageSpec
- (double)singleCharacterCommitDelay;
- (double)standardCommitDelay;
- (double)strokeFadeOutDuration;
- (id)debugLocaleDescriptions;
- (uint64_t)uncommittedTokenColumnCount;
- (void)initWithLocales:(void *)a1;
@end

@implementation PKTextInputLanguageSpec

- (void)initWithLocales:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)PKTextInputLanguageSpec;
    a1 = objc_msgSendSuper2(&v11, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[3];
      a1[3] = v4;

      if (qword_1EB3C5E28 != -1) {
        dispatch_once(&qword_1EB3C5E28, &__block_literal_global_6);
      }
      v6 = [v3 firstObject];
      v7 = [v6 languageCode];
      v8 = [v7 lowercaseString];

      if ([(id)qword_1EB3C5E10 containsObject:v8])
      {
        uint64_t v9 = 2;
      }
      else if ([(id)_MergedGlobals_116 containsObject:v8])
      {
        uint64_t v9 = 1;
      }
      else
      {
        if (![(id)qword_1EB3C5E18 containsObject:v8])
        {
          a1[1] = 0;
          goto LABEL_12;
        }
        uint64_t v9 = 3;
      }
      a1[1] = v9;
LABEL_12:
      a1[2] = [(id)qword_1EB3C5E20 containsObject:v8];
    }
  }

  return a1;
}

void __43__PKTextInputLanguageSpec_initWithLocales___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"zh", @"yue", @"ja", @"th", 0);
  v1 = (void *)_MergedGlobals_116;
  _MergedGlobals_116 = v0;

  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"en", @"pt", @"fr", @"it", @"de", @"es", 0);
  id v3 = (void *)qword_1EB3C5E10;
  qword_1EB3C5E10 = v2;

  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ko", 0);
  v5 = (void *)qword_1EB3C5E18;
  qword_1EB3C5E18 = v4;

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ar", @"ars", @"vi", 0);
  v7 = (void *)qword_1EB3C5E20;
  qword_1EB3C5E20 = v6;
}

- (uint64_t)uncommittedTokenColumnCount
{
  if (result)
  {
    switch(*(void *)(result + 8))
    {
      case 0:
      case 2:
        v1 = +[PKTextInputSettings sharedSettings];
        uint64_t v2 = [v1 incrementalCommitWordsBack];

        break;
      case 1:
        uint64_t v2 = 3;
        break;
      case 3:
        uint64_t v2 = 2;
        break;
      default:
        uint64_t v2 = 0;
        break;
    }
    if (v2 <= 1) {
      return 1;
    }
    else {
      return v2;
    }
  }
  return result;
}

- (double)strokeFadeOutDuration
{
  if (!a1) {
    return 0.0;
  }
  v1 = +[PKTextInputSettings sharedSettings];
  [v1 textInputStrokeFadeOutDuration];
  double v3 = v2;

  return v3;
}

- (double)standardCommitDelay
{
  if (!a1) {
    return 0.0;
  }
  double v2 = +[PKTextInputSettings sharedSettings];
  [v2 textInputStandardCommitDelay];
  double v4 = v3;

  double result = v4 + 0.3;
  if (*(void *)(a1 + 16) != 1) {
    return v4;
  }
  return result;
}

- (double)singleCharacterCommitDelay
{
  if (!a1) {
    return 0.0;
  }
  double v2 = +[PKTextInputSettings sharedSettings];
  [v2 singleCharacterCommitDelay];
  double v4 = v3;

  double result = v4 + 0.3;
  if (*(void *)(a1 + 16) != 1) {
    return v4;
  }
  return result;
}

- (id)debugLocaleDescriptions
{
  v1 = a1;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1[3], "count"));
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = v1[3];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "localeIdentifier", (void)v10);
          if (v8) {
            [v2 addObject:v8];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    v1 = (id *)[v2 copy];
  }

  return v1;
}

- (void).cxx_destruct
{
}

@end