@interface CPLByClassExtractionStep
- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6;
- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3;
- (CPLByClassExtractionStep)initWithStorage:(id)a3 scopeIdentifier:(id)a4 description:(id)a5 class:(Class)a6 maximumCount:(unint64_t)a7 query:(void *)a8;
- (Class)extractionClass;
- (NSString)queryDescription;
- (id)shortDescription;
- (unint64_t)maximumCount;
@end

@implementation CPLByClassExtractionStep

- (void).cxx_destruct
{
}

- (NSString)queryDescription
{
  return self->_queryDescription;
}

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

- (Class)extractionClass
{
  return self->_extractionClass;
}

- (id)shortDescription
{
  return self->_queryDescription;
}

- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3
{
  Class extractionClass = self->_extractionClass;
  return !extractionClass || extractionClass == (Class)objc_opt_class();
}

- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = [(CPLBatchExtractionStep *)self storage];
  if (self->_maximumCount >= a4) {
    unint64_t maximumCount = a4;
  }
  else {
    unint64_t maximumCount = self->_maximumCount;
  }
  ((void (*)(CPLByClassExtractionStep *))self->_query)(self);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v14)
  {
    v29 = a6;
    uint64_t v15 = 0;
    id v16 = 0;
    uint64_t v17 = *(void *)v39;
    id v31 = v10;
    id v32 = v13;
    unint64_t v35 = a5;
    uint64_t v18 = v14;
    while (2)
    {
      uint64_t v19 = 0;
      uint64_t v36 = v15 + 1;
      uint64_t v30 = v15 + v18;
      v20 = v16;
      uint64_t v34 = v18;
      do
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v13);
        }
        v21 = *(void **)(*((void *)&v38 + 1) + 8 * v19);
        if ([v21 supportsResources]
          && [v21 hasChangeType:8])
        {
          unint64_t v22 = [v21 effectiveResourceSizeToUploadUsingStorage:v11];
          if (v22 > v35)
          {
            v23 = [v10 batch];
            uint64_t v33 = [v23 count];

            id v10 = v31;
            id v13 = v32;
            if (v33)
            {
              id v16 = v20;
LABEL_27:
              [v10 setFull:1];
              goto LABEL_28;
            }
          }
          unint64_t v24 = v35 - v22;
          if (v35 < v22) {
            unint64_t v24 = 0;
          }
          unint64_t v35 = v24;
          uint64_t v18 = v34;
        }
        [v10 addChange:v21 fromStorage:v11];
        id v37 = v20;
        int v25 = [v11 removeChange:v21 error:&v37];
        id v16 = v37;

        if (!v25)
        {

          if (v29)
          {
            id v16 = v16;
            BOOL v26 = 0;
            id *v29 = v16;
          }
          else
          {
            BOOL v26 = 0;
          }
          v27 = v32;
          goto LABEL_29;
        }
        if (v36 + v19 >= maximumCount) {
          goto LABEL_27;
        }
        ++v19;
        v20 = v16;
      }
      while (v18 != v19);
      uint64_t v18 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
      uint64_t v15 = v30;
      if (v18) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v16 = 0;
  }
LABEL_28:

  v27 = v13;
  BOOL v26 = 1;
LABEL_29:

  return v26;
}

- (CPLByClassExtractionStep)initWithStorage:(id)a3 scopeIdentifier:(id)a4 description:(id)a5 class:(Class)a6 maximumCount:(unint64_t)a7 query:(void *)a8
{
  id v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CPLByClassExtractionStep;
  uint64_t v15 = [(CPLBatchExtractionStep *)&v19 initWithStorage:a3 scopeIdentifier:a4];
  if (v15)
  {
    uint64_t v16 = [v14 copy];
    queryDescription = v15->_queryDescription;
    v15->_queryDescription = (NSString *)v16;

    v15->_Class extractionClass = a6;
    v15->_unint64_t maximumCount = a7;
    v15->_query = a8;
  }

  return v15;
}

@end