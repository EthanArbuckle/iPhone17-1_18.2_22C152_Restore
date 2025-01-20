@interface NLPLearnerEmojiClassificationData
+ (void)initialize;
- (BOOL)addExamples:(id)a3;
- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4;
- (NLPLearnerEmojiClassificationData)initWithLocale:(id)a3;
- (NSDictionary)labelClasses;
- (id).cxx_construct;
- (id)nextEvaluationDataPoint;
- (id)nextTrainingDataBatch:(unint64_t)a3;
- (unint64_t)embeddingDimension;
- (unint64_t)numOutputClasses;
- (void)addResource:(id)a3;
- (void)sampleNoneClassExample:(id)a3;
@end

@implementation NLPLearnerEmojiClassificationData

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.NLP", "NLPLearnerEmojiClassificationData");
    v3 = (void *)qword_1F0E0;
    qword_1F0E0 = (uint64_t)v2;
  }
}

- (NLPLearnerEmojiClassificationData)initWithLocale:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NLPLearnerEmojiClassificationData;
  v5 = [(NLPLearnerTextData *)&v17 initWithLocale:v4];
  if (!v5) {
    goto LABEL_4;
  }
  -[NLPLearnerTextData setMaxSequenceLength:](v5, "setMaxSequenceLength:", [(id)objc_opt_class() defaultMaxSequenceLength]);
  v19[0] = kNLStringEmbeddingModelLocale;
  v6 = [(NLPLearnerTextData *)v5 locale];
  v19[1] = kNLStringEmbeddingModelType;
  v20[0] = v6;
  v20[1] = kNLStringEmbeddingModelTypeContextualWordEmbedding;
  v7 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  v8 = (const void *)NLStringEmbeddingCreateWithOptions();
  sub_57C4((const void **)&v5->_embedding.m_ref, v8);
  if (v5->_embedding.m_ref)
  {
    v5->_embeddingDimension = NLStringEmbeddingGetDimension();
    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    labels = v5->_labels;
    v5->_labels = v9;

    noneClassProbability = v5->_noneClassProbability;
    v5->_noneClassProbability = (NSNumber *)&off_19930;

LABEL_4:
    v12 = v5;
    goto LABEL_8;
  }
  v13 = (id)qword_1F0E0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = [(NLPLearnerTextData *)v5 locale];
    v15 = [v14 languageCode];
    sub_FC8C(v15, buf, v13, v14);
  }

  v12 = 0;
LABEL_8:

  return v12;
}

- (void)sampleNoneClassExample:(id)a3
{
  id v12 = a3;
  if ([v12 count])
  {
    uint32_t v4 = arc4random_uniform(0x64u);
    [(NSNumber *)self->_noneClassProbability floatValue];
    if ((float)(v5 * 100.0) > (float)v4)
    {
      labels = self->_labels;
      v7 = +[NSNumber numberWithInt:0];
      [(NSMutableArray *)labels addObject:v7];

      LODWORD(v7) = [v12 count];
      if (v7 >= [(NLPLearnerTextData *)self maxSequenceLength]) {
        uint32_t v8 = [(NLPLearnerTextData *)self maxSequenceLength];
      }
      else {
        uint32_t v8 = [v12 count];
      }
      uint32_t v9 = arc4random_uniform(v8);
      v10 = [(NLPLearnerTextData *)self sentences];
      v11 = objc_msgSend(v12, "subarrayWithRange:", 0, (int)(v9 + 1));
      [v10 addObject:v11];
    }
  }
}

- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4
{
  id v6 = a3;
  labelClasses = self->_labelClasses;
  if (labelClasses)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    char v17 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    char v15 = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = sub_46B4;
    v12[4] = sub_46C4;
    id v13 = +[NSMutableArray array];
    uint32_t v8 = [(NLPLearnerTextData *)self locale];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_46CC;
    v11[3] = &unk_186A0;
    v11[4] = self;
    v11[5] = v14;
    v11[6] = v12;
    v11[7] = v16;
    v10.receiver = self;
    v10.super_class = (Class)NLPLearnerEmojiClassificationData;
    [(NLPLearnerTextData *)&v10 loadFromCoreDuet:v6 limitSamplesTo:a4 withLocale:v8 andLMStreamTokenizationBlock:v11];

    _Block_object_dispose(v12, 8);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);
  }

  return labelClasses != 0;
}

- (id)nextTrainingDataBatch:(unint64_t)a3
{
  float v5 = (char *)[(NLPLearnerTextData *)self iterator] + a3;
  if (v5 <= (char *)[(NLPLearnerTextData *)self numSamples])
  {
    v7 = [(NLPLearnerTextData *)self sentences];
    uint32_t v8 = objc_msgSend(v7, "subarrayWithRange:", -[NLPLearnerTextData iterator](self, "iterator"), a3);

    size_t v9 = 4 * a3 * [(NLPLearnerTextData *)self maxSequenceLength] * self->_embeddingDimension;
    objc_super v10 = malloc_type_malloc(v9, 0xCABCD16BuLL);
    unint64_t embeddingDimension = self->_embeddingDimension;
    int v15 = 0;
    sub_5810(__p, embeddingDimension, &v15);
    [(NLPLearnerTextData *)self maxSequenceLength];
    NLStringEmbeddingFillWordVectors();
    id v12 = +[NSData dataWithBytesNoCopy:v10 length:v9 freeWhenDone:1];
    v18[0] = v12;
    v17[0] = MLPModelSampleDataFeatureValuesKey;
    v17[1] = MLPModelSampleDataLabelsKey;
    id v13 = -[NSMutableArray subarrayWithRange:](self->_labels, "subarrayWithRange:", [(NLPLearnerTextData *)self iterator], a3);
    v18[1] = v13;
    id v6 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

    [(NLPLearnerTextData *)self setIterator:(char *)[(NLPLearnerTextData *)self iterator] + a3];
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
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
    id v13 = 0;
  }
  else
  {
    uint32_t v4 = [(NLPLearnerTextData *)self sentences];
    float v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", -[NLPLearnerTextData iterator](self, "iterator"));
    v20 = v5;
    id v6 = +[NSArray arrayWithObjects:&v20 count:1];

    size_t v7 = 4 * [(NLPLearnerTextData *)self maxSequenceLength] * self->_embeddingDimension;
    uint32_t v8 = malloc_type_malloc(v7, 0x6BAACAC8uLL);
    unint64_t embeddingDimension = self->_embeddingDimension;
    int v15 = 0;
    sub_5810(__p, embeddingDimension, &v15);
    [(NLPLearnerTextData *)self maxSequenceLength];
    NLStringEmbeddingFillWordVectors();
    objc_super v10 = +[NSData dataWithBytesNoCopy:v8 length:v7 freeWhenDone:1];
    v19[0] = v10;
    v18[0] = MRLNeuralNetworkEvaluateInputDataKey;
    v18[1] = MRLNeuralNetworkEvaluateOutputLabelKey;
    v11 = [(NSMutableArray *)self->_labels objectAtIndexedSubscript:[(NLPLearnerTextData *)self iterator]];
    char v17 = v11;
    id v12 = +[NSArray arrayWithObjects:&v17 count:1];
    v19[1] = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

    [(NLPLearnerTextData *)self setIterator:(char *)[(NLPLearnerTextData *)self iterator] + 1];
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }

  return v13;
}

- (unint64_t)numOutputClasses
{
  os_log_t v2 = [(NSDictionary *)self->_labelClasses allValues];
  unint64_t v3 = +[NSSet setWithArray:v2];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (void)addResource:(id)a3
{
  id v4 = a3;
  float v5 = +[NSDictionary dictionaryWithContentsOfFile:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    p_labelClasses = &self->_labelClasses;
    objc_storeStrong((id *)&self->_labelClasses, v5);
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    unint64_t v39 = 0;
    unint64_t v39 = [(NLPLearnerEmojiClassificationData *)self numOutputClasses];
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 1;
    labelClasses = self->_labelClasses;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_5250;
    v33[3] = &unk_186C8;
    v33[4] = self;
    v33[5] = v38;
    v33[6] = &v34;
    [(NSDictionary *)labelClasses enumerateKeysAndObjectsUsingBlock:v33];
    if (*((unsigned char *)v35 + 24))
    {
      [(NSNumber *)self->_noneClassProbability floatValue];
      if (v8 > 0.0)
      {
        size_t v9 = *p_labelClasses;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_53D8;
        v32[3] = &unk_186F0;
        v32[4] = &v34;
        [(NSDictionary *)v9 enumerateKeysAndObjectsUsingBlock:v32];
      }
      if (*((unsigned char *)v35 + 24)) {
        goto LABEL_13;
      }
      objc_super v10 = qword_1F0E0;
      if (os_log_type_enabled((os_log_t)qword_1F0E0, OS_LOG_TYPE_ERROR)) {
        sub_FD58((uint64_t)v4, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      v24 = qword_1F0E0;
      if (os_log_type_enabled((os_log_t)qword_1F0E0, OS_LOG_TYPE_ERROR)) {
        sub_FCEC((uint64_t)v4, v24, v25, v26, v27, v28, v29, v30);
      }
    }
    v31 = *p_labelClasses;
    *p_labelClasses = 0;

LABEL_13:
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(v38, 8);
    goto LABEL_14;
  }
  char v17 = qword_1F0E0;
  if (os_log_type_enabled((os_log_t)qword_1F0E0, OS_LOG_TYPE_ERROR)) {
    sub_FDC4((uint64_t)v4, v17, v18, v19, v20, v21, v22, v23);
  }
LABEL_14:
}

- (unint64_t)embeddingDimension
{
  return self->_embeddingDimension;
}

- (NSDictionary)labelClasses
{
  return self->_labelClasses;
}

- (void).cxx_destruct
{
  sub_57C4((const void **)&self->_embedding.m_ref, 0);
  objc_storeStrong((id *)&self->_noneClassProbability, 0);
  objc_storeStrong((id *)&self->_labelClasses, 0);

  objc_storeStrong((id *)&self->_labels, 0);
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  return self;
}

- (BOOL)addExamples:(id)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    float v5 = 0;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        float v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        size_t v9 = [v8 objectForKeyedSubscript:@"sentence"];
        objc_super v10 = [v9 componentsSeparatedByString:@" "];

        float v5 = v10;
        id v11 = [v10 count];
        if (v11 <= (id)[(NLPLearnerTextData *)self maxSequenceLength])
        {
          uint64_t v12 = [v8 objectForKeyedSubscript:@"label"];
          uint64_t v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v12 unsignedIntegerValue] - 1);

          uint64_t v14 = [(NSDictionary *)self->_labelClasses allValues];
          unsigned int v15 = [v14 containsObject:v13];

          if (v15)
          {
            [(NSMutableArray *)self->_labels addObject:v13];
            uint64_t v16 = [(NLPLearnerTextData *)self sentences];
            [v16 addObject:v5];
          }
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }
  return 1;
}

@end