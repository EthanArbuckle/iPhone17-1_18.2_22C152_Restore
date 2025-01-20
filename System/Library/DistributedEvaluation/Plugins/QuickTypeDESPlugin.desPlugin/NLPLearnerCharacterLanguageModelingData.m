@interface NLPLearnerCharacterLanguageModelingData
+ (unint64_t)defaultMaxSequenceLength;
+ (void)initialize;
- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4;
- (NLPLearnerCharacterLanguageModelingData)initWithLocale:(id)a3;
- (void)addResource:(id)a3;
@end

@implementation NLPLearnerCharacterLanguageModelingData

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.NLP", "NLPLearnerCharacterLanguageModelingData");
    v3 = (void *)qword_1F100;
    qword_1F100 = (uint64_t)v2;
  }
}

+ (unint64_t)defaultMaxSequenceLength
{
  return 200;
}

- (NLPLearnerCharacterLanguageModelingData)initWithLocale:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NLPLearnerCharacterLanguageModelingData;
  v5 = [(NLPLearnerLanguageModelingData *)&v7 initWithLocale:v4];
  if (v5) {
    -[NLPLearnerTextData setMaxSequenceLength:](v5, "setMaxSequenceLength:", [(id)objc_opt_class() defaultMaxSequenceLength]);
  }

  return v5;
}

- (void)addResource:(id)a3
{
  id v4 = a3;
  [(NLPLearnerLanguageModelingData *)self setTokenIDMapPath:v4];
  id v5 = objc_alloc((Class)CVNLPTokenIDConverter);
  v6 = +[NSURL URLWithString:v4];
  objc_super v7 = (CVNLPTokenIDConverter *)[v5 initWithResource:v6 andTokenType:1];
  tokenConverter = self->_tokenConverter;
  self->_tokenConverter = v7;

  if (!self->_tokenConverter)
  {
    v9 = qword_1F100;
    if (os_log_type_enabled((os_log_t)qword_1F100, OS_LOG_TYPE_ERROR)) {
      sub_10240((uint64_t)v4, v9);
    }
  }
}

- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4
{
  id v6 = a3;
  tokenConverter = self->_tokenConverter;
  id v26 = v6;
  if (tokenConverter)
  {
    objc_super v7 = (id)qword_1F100;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_FF60(buf, (uint64_t)[v26 count], v7);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v26;
    id v8 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v36;
LABEL_6:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8 * v10);
        if (a4 && [(NLPLearnerTextData *)self numSamples] >= a4)
        {
          int v23 = 2;
        }
        else
        {
          v13 = [(NLPLearnerTextData *)self locale];
          v14 = [v13 languageCode];
          v15 = +[NLPLearnerUtils messageContentForEvent:v11 andLanguage:v14];

          if (v15)
          {
            uint64_t v29 = 0;
            v30 = &v29;
            uint64_t v31 = 0x3032000000;
            v32 = sub_7C90;
            v33 = sub_7CA0;
            v16 = +[NSNumber numberWithUnsignedInt:[(CVNLPTokenIDConverter *)self->_tokenConverter bosTokenID]];
            v39 = v16;
            v17 = +[NSArray arrayWithObjects:&v39 count:1];
            id v34 = [v17 mutableCopy];

            v18 = self->_tokenConverter;
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472;
            v28[2] = sub_7CA8;
            v28[3] = &unk_18798;
            v28[4] = self;
            v28[5] = &v29;
            [(CVNLPTokenIDConverter *)v18 enumerateTokenIDsForText:v15 withBlock:v28];
            id v19 = [(id)v30[5] count];
            if (v19 < (id)[(NLPLearnerTextData *)self maxSequenceLength])
            {
              v20 = (void *)v30[5];
              v21 = +[NSNumber numberWithUnsignedInt:[(CVNLPTokenIDConverter *)self->_tokenConverter eosTokenID]];
              [v20 addObject:v21];

              v22 = [(NLPLearnerTextData *)self sentences];
              [v22 addObject:v30[5]];
            }
            _Block_object_dispose(&v29, 8);

            int v23 = 0;
          }
          else
          {
            int v23 = 3;
          }
        }
        if (v23 != 3)
        {
          if (v23) {
            break;
          }
        }
        if (v8 == (id)++v10)
        {
          id v8 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
          if (v8) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }
  return tokenConverter != 0;
}

- (void).cxx_destruct
{
}

@end