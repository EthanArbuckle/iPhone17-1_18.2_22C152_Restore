@interface NLPLearnerTextData
+ (id)dataForPFL:(int64_t)a3 andLocale:(id)a4;
+ (id)dataForTask:(int64_t)a3 andLocale:(id)a4;
+ (unint64_t)defaultMaxSequenceLength;
+ (void)initialize;
- (BOOL)addExamples:(id)a3;
- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4;
- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4 withLocale:(id)a5 andLMStreamTokenizationBlock:(id)a6;
- (BOOL)processingNewRecord;
- (NLPLearnerTextData)initWithLocale:(id)a3;
- (NSLocale)locale;
- (NSMutableArray)sentences;
- (unint64_t)iterator;
- (unint64_t)maxSequenceLength;
- (unint64_t)numSamples;
- (void)addResource:(id)a3;
- (void)rewind;
- (void)setIterator:(unint64_t)a3;
- (void)setLocale:(id)a3;
- (void)setMaxSequenceLength:(unint64_t)a3;
- (void)setProcessingNewRecord:(BOOL)a3;
- (void)setSentences:(id)a3;
@end

@implementation NLPLearnerTextData

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.NLP", "NLPLearnerTextData");
    v3 = (void *)qword_1F0E8;
    qword_1F0E8 = (uint64_t)v2;
  }
}

- (NLPLearnerTextData)initWithLocale:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NLPLearnerTextData;
  v5 = [(NLPLearnerTextData *)&v8 init];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    [(NLPLearnerTextData *)v5 setSentences:v6];

    [(NLPLearnerTextData *)v5 setIterator:0];
    [(NLPLearnerTextData *)v5 setLocale:v4];
  }

  return v5;
}

+ (id)dataForTask:(int64_t)a3 andLocale:(id)a4
{
  id v5 = a4;
  if (os_log_type_enabled((os_log_t)qword_1F0E8, OS_LOG_TYPE_DEBUG)) {
    sub_FE98();
  }
  if ((unint64_t)(a3 - 1) >= 7)
  {
    if (os_log_type_enabled((os_log_t)qword_1F0E8, OS_LOG_TYPE_ERROR)) {
      sub_FE30();
    }
    id v6 = 0;
  }
  else
  {
    id v6 = [objc_alloc(off_18710[a3 - 1]->isa) initWithLocale:v5];
  }

  return v6;
}

+ (id)dataForPFL:(int64_t)a3 andLocale:(id)a4
{
  id v5 = a4;
  if ((unint64_t)(a3 - 1) >= 4)
  {
    if (os_log_type_enabled((os_log_t)qword_1F0E8, OS_LOG_TYPE_ERROR)) {
      sub_FE30();
    }
    id v6 = 0;
  }
  else
  {
    id v6 = [objc_alloc(off_18748[a3 - 1]->isa) initWithLocale:v5];
  }

  return v6;
}

- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4
{
  id v18 = a3;
  id v6 = (id)qword_1F0E8;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_FF60(buf, (uint64_t)[v18 count], v6);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v18;
  id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
      if (a4 && [(NLPLearnerTextData *)self numSamples] >= a4)
      {
        int v16 = 2;
      }
      else
      {
        v12 = [(NLPLearnerTextData *)self locale];
        v13 = [v12 languageCode];
        v14 = +[NLPLearnerUtils messageContentForEvent:v10 andLanguage:v13];

        if (v14)
        {
          v15 = [(NLPLearnerTextData *)self sentences];
          [v15 addObject:v14];

          int v16 = 0;
        }
        else
        {
          int v16 = 3;
        }
      }
      if (v16 != 3)
      {
        if (v16) {
          break;
        }
      }
      if (v7 == (id)++v9)
      {
        id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v7) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  return 1;
}

- (void)rewind
{
  self->_iterator = 0;
}

- (unint64_t)numSamples
{
  return (unint64_t)[(NSMutableArray *)self->_sentences count];
}

- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4 withLocale:(id)a5 andLMStreamTokenizationBlock:(id)a6
{
  id v23 = a3;
  id v10 = a5;
  id v25 = a6;
  v26 = v10;
  CFTypeRef cf = (CFTypeRef)LMStreamTokenizerCreate();
  CFTypeRef v31 = cf;
  v11 = (id)qword_1F0E8;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_FF60(buf, (uint64_t)[v23 count], v11);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v23;
  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v28;
LABEL_5:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v28 != v14) {
        objc_enumerationMutation(v12);
      }
      uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * v15);
      if (a4 && [(NLPLearnerTextData *)self numSamples] >= a4)
      {
        int v21 = 2;
      }
      else
      {
        id v18 = objc_msgSend(v26, "languageCode", v23);
        v19 = +[NLPLearnerUtils messageContentForEvent:v16 andLanguage:v18];

        if (v19)
        {
          long long v20 = (const char *)[v19 UTF8String];
          [(NLPLearnerTextData *)self setProcessingNewRecord:1];
          strlen(v20);
          LMStreamTokenizerPushBytes();
          int v21 = 0;
        }
        else
        {
          int v21 = 3;
        }
      }
      if (v21 != 3)
      {
        if (v21) {
          break;
        }
      }
      if (v13 == (id)++v15)
      {
        id v13 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v13) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  [(NLPLearnerTextData *)self setProcessingNewRecord:0];
  if (cf) {
    CFRelease(cf);
  }

  return 1;
}

+ (unint64_t)defaultMaxSequenceLength
{
  return 50;
}

- (void)addResource:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)qword_1F0E8, OS_LOG_TYPE_ERROR)) {
    sub_FFA8();
  }
}

- (unint64_t)maxSequenceLength
{
  return self->_maxSequenceLength;
}

- (void)setMaxSequenceLength:(unint64_t)a3
{
  self->_maxSequenceLength = a3;
}

- (NSMutableArray)sentences
{
  return self->_sentences;
}

- (void)setSentences:(id)a3
{
}

- (unint64_t)iterator
{
  return self->_iterator;
}

- (void)setIterator:(unint64_t)a3
{
  self->_iterator = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (BOOL)processingNewRecord
{
  return self->_processingNewRecord;
}

- (void)setProcessingNewRecord:(BOOL)a3
{
  self->_processingNewRecord = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_sentences, 0);
}

- (BOOL)addExamples:(id)a3
{
  id v4 = a3;
  id v5 = [(NLPLearnerTextData *)self sentences];
  [v5 addObjectsFromArray:v4];

  return 1;
}

@end