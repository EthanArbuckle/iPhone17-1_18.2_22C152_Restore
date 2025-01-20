@interface FHNaturalLanguageClassificationModel
- (FHNaturalLanguageClassificationModel)initWithModelURL:(id)a3;
- (NLModel)nlModel;
- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4;
- (void)setNlModel:(id)a3;
@end

@implementation FHNaturalLanguageClassificationModel

- (FHNaturalLanguageClassificationModel)initWithModelURL:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)FHNaturalLanguageClassificationModel;
  v3 = [(FHModel *)&v14 initWithModelURL:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(FHModel *)v3 mlModel];
    if (v5)
    {
      id v13 = 0;
      uint64_t v6 = [MEMORY[0x263F14028] modelWithMLModel:v5 error:&v13];
      id v7 = v13;
      nlModel = v4->_nlModel;
      v4->_nlModel = (NLModel *)v6;

      if (v7)
      {
        v9 = FinHealthLogObject(@"FinHealthCore");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = [v7 localizedDescription];
          *(_DWORD *)buf = 138412290;
          v16 = v10;
          _os_log_impl(&dword_24E029000, v9, OS_LOG_TYPE_ERROR, "Failed to create natural language model, error: %@", buf, 0xCu);
        }
        v11 = v4->_nlModel;
        v4->_nlModel = 0;
      }
    }
  }
  return v4;
}

- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4
{
  nlModel = self->_nlModel;
  if (nlModel)
  {
    id v5 = [(NLModel *)nlModel predictedLabelHypothesesForString:a3 maximumCount:a4];
  }
  else
  {
    id v5 = objc_alloc_init(NSDictionary);
  }
  return v5;
}

- (NLModel)nlModel
{
  return self->_nlModel;
}

- (void)setNlModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end