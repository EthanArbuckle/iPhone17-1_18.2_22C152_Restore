@interface QuickTypeLanguageModel
+ (unint64_t)unknownTokenCountOfTokenSequence:(id)a3;
+ (void)initialize;
- (QuickTypeLanguageModel)initWithLocale:(id)a3;
- (QuickTypeLanguageModel)initWithLocale:(id)a3 resourceDirectory:(id)a4 andDynamicData:(id)a5 filtered:(BOOL)a6;
- (double)perplexityOfTokenSequence:(id)a3;
- (id)ksrOfTokenSequence:(id)a3;
- (id)stringForTokenID:(unsigned int)a3 stringBytes:(const char *)a4 numBytes:(int64_t)a5;
- (id)tokensForString:(id)a3;
- (unint64_t)getCompletionIndexForToken:(id)a3 givenContext:(unsigned int *)a4 contextLength:(unint64_t)a5;
- (void)dealloc;
@end

@implementation QuickTypeLanguageModel

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.NLPLearner", "QuickTypeLanguageModel");
    v3 = (void *)qword_1F180;
    qword_1F180 = (uint64_t)v2;
  }
}

- (QuickTypeLanguageModel)initWithLocale:(id)a3
{
  return [(QuickTypeLanguageModel *)self initWithLocale:a3 resourceDirectory:0 andDynamicData:0 filtered:0];
}

- (QuickTypeLanguageModel)initWithLocale:(id)a3 resourceDirectory:(id)a4 andDynamicData:(id)a5 filtered:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v42.receiver = self;
  v42.super_class = (Class)QuickTypeLanguageModel;
  v13 = [(QuickTypeLanguageModel *)&v42 init];
  if (!v13) {
    goto LABEL_14;
  }
  v14 = +[NSMutableDictionary dictionary];
  v15 = +[NSMutableDictionary dictionary];
  [v14 setObject:v10 forKey:kLMLanguageModelLocaleKey];
  if (v11) {
    [v14 setObject:v11 forKey:kLMLanguageModelCustomResourceDirectoryKey];
  }
  v16 = +[NSNumber numberWithBool:v12 != 0];
  [v14 setObject:v16 forKey:kLMLanguageModelAdaptationEnabledKey];

  if (v12)
  {
    [v14 setObject:v12 forKey:kLMLanguageModelCustomDynamicResourceDirectoryKey];
    v17 = +[NSNumber numberWithBool:v6];
    [v14 setObject:v17 forKey:kLMExcludeInformalDynamicDataKey];
  }
  uint64_t v18 = LMLanguageModelCreate();
  v13->_model = (void *)v18;
  if (!v18) {
    goto LABEL_16;
  }
  [v15 setObject:v10 forKey:kLXLexiconLocaleKey];
  if (v11)
  {
    v19 = +[NSLocale localeWithLocaleIdentifier:v10];
    v46[0] = @"Unigrams";
    v20 = [v19 languageCode];
    v46[1] = v20;
    v21 = +[NSArray arrayWithObjects:v46 count:2];
    v22 = [v21 componentsJoinedByString:@"-"];
    v41 = [v22 stringByAppendingString:@".dat"];

    uint64_t v23 = [v11 path];
    v40 = [(id)v23 stringByAppendingPathComponent:v41];

    [v15 setObject:v40 forKey:kLXLexiconDataFileKey];
    v24 = [v19 countryCode];
    LOBYTE(v23) = v24 == 0;

    if ((v23 & 1) == 0)
    {
      v25 = [v19 languageCode];
      v45[0] = v25;
      v26 = [v19 countryCode];
      v45[1] = v26;
      v27 = +[NSArray arrayWithObjects:v45 count:2];
      v39 = [v27 componentsJoinedByString:@"_"];

      v44[0] = @"Delta";
      v44[1] = v39;
      v28 = +[NSArray arrayWithObjects:v44 count:2];
      v29 = [v28 componentsJoinedByString:@"-"];
      v30 = [v29 stringByAppendingString:@".dat"];

      v31 = [v11 path];
      v32 = [v31 stringByAppendingPathComponent:v30];

      v43 = v32;
      v33 = +[NSArray arrayWithObjects:&v43 count:1];
      [v15 setObject:v33 forKey:kLXLexiconDeltaFilesKey];
    }
  }
  uint64_t v34 = LXLexiconCreate();
  v13->_lexicon = (_LXLexicon *)v34;
  if (!v34)
  {
    CFRelease(v13->_model);
    v13->_model = 0;
LABEL_16:

LABEL_17:
    v37 = 0;
    goto LABEL_18;
  }
  v35 = +[NSLocale localeWithLocaleIdentifier:v10];
  uint64_t v36 = LMStreamTokenizerCreate();
  v13->_tokenizer = (void *)v36;
  if (!v36)
  {
    CFRelease(v13->_model);
    CFRelease(v13->_lexicon);
    v13->_model = 0;
    v13->_lexicon = 0;

    goto LABEL_17;
  }
  *(_OWORD *)&v13->_numCandidates = xmmword_13340;

LABEL_14:
  v37 = v13;
LABEL_18:

  return v37;
}

- (void)dealloc
{
  model = self->_model;
  if (model) {
    CFRelease(model);
  }
  tokenizer = self->_tokenizer;
  if (tokenizer) {
    CFRelease(tokenizer);
  }
  lexicon = self->_lexicon;
  if (lexicon) {
    CFRelease(lexicon);
  }
  v6.receiver = self;
  v6.super_class = (Class)QuickTypeLanguageModel;
  [(QuickTypeLanguageModel *)&v6 dealloc];
}

- (id)stringForTokenID:(unsigned int)a3 stringBytes:(const char *)a4 numBytes:(int64_t)a5
{
  if (a3 || a5 < 1)
  {
    if (a3 - 1 <= 0x1F2) {
      goto LABEL_9;
    }
  }
  else
  {
    unsigned int v7 = *(unsigned __int8 *)a4;
    BOOL v8 = v7 > 0x3F;
    unint64_t v9 = (1 << v7) & 0x8000400200000000;
    if (!v8 && v9 != 0)
    {
LABEL_9:
      id StringForSpecialTokenID = (id)LMLanguageModelCreateStringForSpecialTokenID();
      if (StringForSpecialTokenID) {
        goto LABEL_11;
      }
    }
  }
  id StringForSpecialTokenID = [objc_alloc((Class)NSString) initWithBytes:a4 length:a5 encoding:4];
LABEL_11:

  return StringForSpecialTokenID;
}

- (id)tokensForString:(id)a3
{
  id v4 = a3;
  v5 = (const char *)[v4 UTF8String];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_BE88;
  v16 = sub_BE98;
  id v17 = objc_alloc_init((Class)NSMutableArray);
  strlen(v5);
  id v11 = self;
  LMStreamTokenizerPushBytes();
  LMStreamTokenizerReset();
  objc_super v6 = (id)qword_1F180;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v9 = objc_msgSend((id)v13[5], "valueForKey:", @"description", _NSConcreteStackBlock, 3221225472, sub_BEA0, &unk_188F8, v11, &v12);
    id v10 = [v9 componentsJoinedByString:@" "];
    *(_DWORD *)buf = 138740227;
    id v19 = v4;
    __int16 v20 = 2117;
    v21 = v10;
    _os_log_debug_impl(&dword_0, v6, OS_LOG_TYPE_DEBUG, "'%{sensitive}@' tokenized into '%{sensitive}@'", buf, 0x16u);
  }
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (double)perplexityOfTokenSequence:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    [v3 count];
    __chkstk_darwin();
    v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    long long v17 = 0u;
    long long v16 = 0u;
    long long v15 = 0u;
    long long v14 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v15;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          *(_DWORD *)&v5[4 * v8 + 4 * (void)v10] = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) tokenID];
          id v10 = (char *)v10 + 1;
        }
        while (v7 != v10);
        id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        v8 += (uint64_t)v10;
      }
      while (v7);
    }

    [v6 count];
    LMLanguageModelJointProbability();
    double v12 = exp2(v11 / -0.301029996 / (double)(unint64_t)[v6 count]);
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

- (unint64_t)getCompletionIndexForToken:(id)a3 givenContext:(unsigned int *)a4 contextLength:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = v8;
  if (a5)
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    uint64_t PredictionEnumerator = 0;
    uint64_t PredictionEnumerator = LMLanguageModelCreatePredictionEnumerator();
    uint64_t v10 = -1;
    while (LMPredictionEnumeratorAdvance())
    {
      if (++v10 >= self->_numCandidates) {
        break;
      }
      LODWORD(v25) = 0;
      LMPredictionEnumeratorGetPrediction();
      StringForTokenID = (void *)LMLanguageModelCreateStringForTokenID();
      double v12 = [v9 string];
      unsigned __int8 v13 = [StringForTokenID isEqualToString:v12];

      if (v13)
      {
        id v14 = 0;
        goto LABEL_8;
      }
    }
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    long long v15 = [v9 string];
    long long v16 = [v9 string];
    id v17 = [v16 length];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_C478;
    v19[3] = &unk_18988;
    v21 = &v25;
    v22 = v29;
    v19[4] = self;
    id v20 = v9;
    uint64_t v23 = a4;
    unint64_t v24 = a5;
    objc_msgSend(v15, "enumerateSubstringsInRange:options:usingBlock:", 0, v17, 2, v19);

    id v14 = (id)v26[3];
    _Block_object_dispose(&v25, 8);
LABEL_8:
    _Block_object_dispose(v29, 8);
  }
  else
  {
    id v14 = [v8 chracterCount];
  }

  return (unint64_t)v14;
}

- (id)ksrOfTokenSequence:(id)a3
{
  id v4 = a3;
  sub_CBF8(__p, (unint64_t)[v4 count]);
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  id v7 = 0;
  while (v6 < (unint64_t)[v4 count])
  {
    id v8 = [v4 objectAtIndexedSubscript:v6];
    unsigned int v9 = [v8 tokenID];
    *((_DWORD *)__p[0] + v6) = v9;
    if ([v8 tokenID] > 0x1F3 || objc_msgSend(v8, "isOOV"))
    {
      unint64_t v10 = [(QuickTypeLanguageModel *)self getCompletionIndexForToken:v8 givenContext:__p[0] contextLength:v6];
      id v7 = &v7[(void)[v8 chracterCount] - v10];
      v5 += (uint64_t)[v8 chracterCount];
    }

    ++v6;
  }
  double v11 = [[KSRScore alloc] initWithTotalCount:v5 andSavedCount:v7];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v11;
}

+ (unint64_t)unknownTokenCountOfTokenSequence:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  unint64_t v4 = 0;
  id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v7), "isOOV", (void)v9);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v4;
}

@end