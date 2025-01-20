@interface NLPModelTrainingDataProvider
- (NLPModelTrainingDataProvider)initWithConfiguration:(id)a3 numberOfInstances:(unint64_t)a4 dataSource:(void *)a5 instanceDataProvider:(id)a6;
- (id)instanceAtIndex:(unint64_t)a3;
- (unint64_t)numberOfInstances;
@end

@implementation NLPModelTrainingDataProvider

- (NLPModelTrainingDataProvider)initWithConfiguration:(id)a3 numberOfInstances:(unint64_t)a4 dataSource:(void *)a5 instanceDataProvider:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NLPModelTrainingDataProvider;
  v11 = [(NLDataProvider *)&v16 initWithConfiguration:a3 dataURL:0];
  v12 = v11;
  if (v11)
  {
    v11->_numberOfInstances = a4;
    v11->_dataSource = a5;
    uint64_t v13 = MEMORY[0x1AD0BBB20](v10);
    id instanceDataProvider = v12->_instanceDataProvider;
    v12->_id instanceDataProvider = (id)v13;
  }
  return v12;
}

- (unint64_t)numberOfInstances
{
  return self->_numberOfInstances;
}

- (id)instanceAtIndex:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v5 = (void *)(*((uint64_t (**)(void))self->_instanceDataProvider + 2))();
  if (!v5) {
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_41;
  }
  v6 = [(NLDataProvider *)self configuration];
  uint64_t v7 = [v6 type];

  if (v7 == 1)
  {
    v11 = [v5 objectForKey:kNLPTokenArrayKey];
    v12 = [v5 objectForKey:kNLPLabelArrayKey];
    if (v11)
    {
      objc_opt_class();
      id v10 = 0;
      if ((objc_opt_isKindOfClass() & 1) == 0 || !v12)
      {
LABEL_40:

        if (v10) {
          goto LABEL_42;
        }
        goto LABEL_41;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v11 count];
        if (v13 == [v12 count])
        {
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v14 = v11;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v32;
            while (2)
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v32 != v17) {
                  objc_enumerationMutation(v14);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  int v26 = 0;
                  goto LABEL_28;
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }
          int v26 = 1;
LABEL_28:
          id v25 = v14;

          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v19 = v12;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v28;
            while (2)
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v28 != v22) {
                  objc_enumerationMutation(v19);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  goto LABEL_39;
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
              if (v21) {
                continue;
              }
              break;
            }
          }

          if (v26)
          {
            id v10 = [[NLSequenceModelDataInstance alloc] initWithTokens:v25 labels:v19];
            goto LABEL_40;
          }
        }
      }
    }
LABEL_39:
    id v10 = 0;
    goto LABEL_40;
  }
  if (!v7)
  {
    v8 = [v5 objectForKey:kNLPStringKey];
    v9 = [v5 objectForKey:kNLPLabelKey];
    if (v8)
    {
      objc_opt_class();
      id v10 = 0;
      if ((objc_opt_isKindOfClass() & 1) == 0 || !v9)
      {
LABEL_25:

        if (v10) {
          goto LABEL_42;
        }
        goto LABEL_41;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [[NLClassifierModelDataInstance alloc] initWithString:v8 label:v9 tokenizer:[(NLDataProvider *)self tokenizer]];
        goto LABEL_25;
      }
    }
    id v10 = 0;
    goto LABEL_25;
  }
LABEL_41:
  NSLog(&cfstr_SkippingInvali.isa, a3);
  id v10 = 0;
LABEL_42:

  return v10;
}

- (void).cxx_destruct
{
}

@end