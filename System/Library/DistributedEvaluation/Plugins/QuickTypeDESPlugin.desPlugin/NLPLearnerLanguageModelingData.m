@interface NLPLearnerLanguageModelingData
+ (unint64_t)defaultMaxSequenceLength;
+ (void)initialize;
- (BOOL)addExamples:(id)a3;
- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4;
- (NLPLearnerLanguageModelingData)initWithLocale:(id)a3;
- (NSString)tokenIDMapPath;
- (id).cxx_construct;
- (id)nextEvaluationDataPoint;
- (id)nextTrainingDataBatch:(unint64_t)a3;
- (void)addPreprocessedExample:(void *)a3;
- (void)setTokenIDMapPath:(id)a3;
@end

@implementation NLPLearnerLanguageModelingData

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.NLP", "NLPLearnerLanguageModelingData");
    v3 = (void *)qword_1F0F8;
    qword_1F0F8 = (uint64_t)v2;
  }
}

+ (unint64_t)defaultMaxSequenceLength
{
  return 50;
}

- (NLPLearnerLanguageModelingData)initWithLocale:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLPLearnerLanguageModelingData;
  v5 = [(NLPLearnerTextData *)&v12 initWithLocale:v4];
  if (!v5) {
    goto LABEL_3;
  }
  -[NLPLearnerTextData setMaxSequenceLength:](v5, "setMaxSequenceLength:", [(id)objc_opt_class() defaultMaxSequenceLength]);
  uint64_t v13 = kLXLexiconLocaleKey;
  v6 = [(NLPLearnerTextData *)v5 locale];
  v7 = [v6 languageCode];
  v14 = v7;
  +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v8 = (const void *)LXLexiconCreate();
  sub_8518((const void **)&v5->_lexicon.m_ref, v8);

  if (!v5->_lexicon.m_ref)
  {
    v10 = qword_1F0F8;
    if (os_log_type_enabled((os_log_t)qword_1F0F8, OS_LOG_TYPE_ERROR)) {
      sub_10100(0, v10);
    }

    v9 = 0;
  }
  else
  {
LABEL_3:
    v9 = v5;
  }

  return v9;
}

- (void)addPreprocessedExample:(void *)a3
{
  id v4 = [(NLPLearnerLanguageModelingData *)self tokenIDMapPath];

  if (v4)
  {
    v5 = [(NLPLearnerLanguageModelingData *)self tokenIDMapPath];
    CFDataRef v6 = (const __CFData *)LMCreateMontrealIDsFromLMTokenIDSequence();

    if (v6)
    {
      CFDataGetBytePtr(v6);
      [(NLPLearnerTextData *)self maxSequenceLength];
      id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
      v9 = (id)qword_1F0F8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = [v8 componentsJoinedByString:@" "];
        sub_101BC(v10, buf, v9);
      }

      v11 = [(NLPLearnerTextData *)self sentences];
      [v11 addObject:v8];

      CFRelease(v6);
    }
    else
    {
      v7 = qword_1F0F8;
      if (os_log_type_enabled((os_log_t)qword_1F0F8, OS_LOG_TYPE_ERROR)) {
        sub_10178(v7);
      }
    }
  }
}

- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4
{
  id v6 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x4812000000;
  v11[3] = sub_6B74;
  v11[4] = sub_6B98;
  v11[5] = "";
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  __p = 0;
  sub_6BB0(&__p, [(NLPLearnerTextData *)self maxSequenceLength]);
  v7 = [(NLPLearnerTextData *)self locale];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_6C58;
  v10[3] = &unk_18770;
  v10[4] = self;
  v10[5] = v11;
  v9.receiver = self;
  v9.super_class = (Class)NLPLearnerLanguageModelingData;
  [(NLPLearnerTextData *)&v9 loadFromCoreDuet:v6 limitSamplesTo:a4 withLocale:v7 andLMStreamTokenizationBlock:v10];

  _Block_object_dispose(v11, 8);
  if (__p)
  {
    uint64_t v13 = __p;
    operator delete(__p);
  }

  return 1;
}

- (id)nextTrainingDataBatch:(unint64_t)a3
{
  v5 = (char *)[(NLPLearnerTextData *)self iterator] + a3;
  if (v5 <= (char *)[(NLPLearnerTextData *)self numSamples])
  {
    v7 = +[NSMutableArray arrayWithCapacity:a3];
    if (a3)
    {
      uint64_t v8 = 0;
      do
      {
        objc_super v9 = [(NLPLearnerTextData *)self sentences];
        v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", (char *)-[NLPLearnerTextData iterator](self, "iterator") + v8);

        v11 = objc_msgSend(v10, "subarrayWithRange:", 0, (char *)objc_msgSend(v10, "count") - 1);
        objc_super v12 = objc_msgSend(v10, "subarrayWithRange:", 1, (char *)objc_msgSend(v10, "count") - 1);
        v17[0] = MLPModelSampleDataSequenceValuesKey;
        v17[1] = MLPModelSampleDataSequenceLabelsKey;
        v18[0] = v11;
        v18[1] = v12;
        uint64_t v13 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
        [v7 addObject:v13];

        ++v8;
      }
      while (a3 != v8);
    }
    [(NLPLearnerTextData *)self setIterator:(char *)[(NLPLearnerTextData *)self iterator] + a3];
    uint64_t v15 = MLPModelSampleDataBatchOfSequencesKey;
    v16 = v7;
    id v6 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)nextEvaluationDataPoint
{
  unint64_t v3 = [(NLPLearnerTextData *)self iterator];
  if (v3 >= [(NLPLearnerTextData *)self numSamples])
  {
    v11 = 0;
  }
  else
  {
    id v4 = [(NLPLearnerTextData *)self sentences];
    v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", -[NLPLearnerTextData iterator](self, "iterator"));

    id v6 = objc_msgSend(v5, "subarrayWithRange:", 0, (char *)objc_msgSend(v5, "count") - 1);
    v7 = objc_msgSend(v5, "subarrayWithRange:", 1, (char *)objc_msgSend(v5, "count") - 1);
    id v8 = v6;
    objc_super v9 = v8;
    if (v8) {
      CFRetain(v8);
    }
    sub_8460(&cf, v9);

    if (!cf)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Could not construct");
    }
    sub_8588(cf, (uint64_t)&__p);
    v17[0] = MRLNeuralNetworkEvaluateInputDataKey;
    v10 = +[NSData dataWithBytes:__p length:v15 - (unsigned char *)__p];
    v17[1] = MRLNeuralNetworkEvaluateOutputLabelKey;
    v18[0] = v10;
    v18[1] = v7;
    v11 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

    [(NLPLearnerTextData *)self setIterator:(char *)[(NLPLearnerTextData *)self iterator] + 1];
    if (__p)
    {
      uint64_t v15 = __p;
      operator delete(__p);
    }
    if (cf) {
      CFRelease(cf);
    }
  }

  return v11;
}

- (NSString)tokenIDMapPath
{
  return self->_tokenIDMapPath;
}

- (void)setTokenIDMapPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenIDMapPath, 0);

  sub_8518((const void **)&self->_lexicon.m_ref, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  return self;
}

- (BOOL)addExamples:(id)a3
{
  id v18 = a3;
  id v4 = objc_alloc_init((Class)NSNumberFormatter);
  [v4 setNumberStyle:1];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v18;
  id v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v21 = *(void *)v27;
    do
    {
      id v6 = 0;
      id v20 = v5;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v6);
        if ([v7 length])
        {
          id v8 = [v7 componentsSeparatedByString:@" "];
          id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v10 = v8;
          id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v23;
LABEL_9:
            uint64_t v13 = 0;
            while (1)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = [v4 numberFromString:*(void *)(*((void *)&v22 + 1) + 8 * v13)];
              [v9 addObject:v14];
              unint64_t v15 = (unint64_t)[v9 count];
              LOBYTE(v15) = v15 < [(NLPLearnerTextData *)self maxSequenceLength];

              if ((v15 & 1) == 0) {
                break;
              }
              if (v11 == (id)++v13)
              {
                id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
                if (v11) {
                  goto LABEL_9;
                }
                break;
              }
            }
          }

          v16 = [(NLPLearnerTextData *)self sentences];
          [v16 addObject:v9];

          id v5 = v20;
        }
        id v6 = (char *)v6 + 1;
      }
      while (v6 != v5);
      id v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }

  return 1;
}

@end