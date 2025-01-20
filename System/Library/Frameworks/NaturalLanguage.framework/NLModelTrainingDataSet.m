@interface NLModelTrainingDataSet
- (NLModelTrainingDataSet)initWithConfiguration:(id)a3 numberOfTrainingInstances:(unint64_t)a4 numberOfValidationInstances:(unint64_t)a5 trainingDataSource:(void *)a6 validationDataSource:(void *)a7 instanceDataProvider:(id)a8;
- (id)dataProviderOfType:(int64_t)a3;
@end

@implementation NLModelTrainingDataSet

- (NLModelTrainingDataSet)initWithConfiguration:(id)a3 numberOfTrainingInstances:(unint64_t)a4 numberOfValidationInstances:(unint64_t)a5 trainingDataSource:(void *)a6 validationDataSource:(void *)a7 instanceDataProvider:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  v44.receiver = self;
  v44.super_class = (Class)NLModelTrainingDataSet;
  v16 = [(NLDataSet *)&v44 initWithConfiguration:v14 trainingDataURL:0 validationDataURL:0 testDataURL:0];
  if (v16)
  {
    obj = [[NLPModelTrainingDataProvider alloc] initWithConfiguration:v14 numberOfInstances:a4 dataSource:a6 instanceDataProvider:v15];
    v42 = [[NLPModelTrainingDataProvider alloc] initWithConfiguration:v14 numberOfInstances:a5 dataSource:a7 instanceDataProvider:v15];
    v17 = [(NLDataSet *)v16 configuration];
    v18 = [v17 options];
    int v19 = BOOLForKeyWithDefault(v18, @"UseCRF");

    v20 = [(NLDataSet *)v16 configuration];
    v21 = [v20 options];
    unsigned __int8 v22 = BOOLForKeyWithDefault(v21, @"UseRNN");

    v23 = [(NLDataSet *)v16 configuration];
    v24 = [v23 options];
    unsigned __int8 v25 = BOOLForKeyWithDefault(v24, @"UseTransfer");

    if (a4 >= 0xA && !a5)
    {
      v26 = [(NLDataSet *)v16 configuration];
      if ([v26 type]) {
        int v27 = 1;
      }
      else {
        int v27 = v19;
      }
      if (v27 == 1)
      {

LABEL_10:
        double v28 = dbl_1A646D6F0[a4 > 0x63];
        if (a4 >> 5 > 0xC34) {
          double v28 = 0.05;
        }
        v29 = splitIndexes(a4, v28, 0.0);
        v30 = [NLSplitDataProvider alloc];
        v31 = [v29 objectAtIndex:0];
        v32 = obj;
        uint64_t v33 = [(NLSplitDataProvider *)v30 initWithDataProvider:obj indexes:v31];
        modelTrainingDataProvider = v16->_modelTrainingDataProvider;
        v16->_modelTrainingDataProvider = (NLDataProvider *)v33;

        v35 = [NLSplitDataProvider alloc];
        v36 = [v29 objectAtIndex:1];
        uint64_t v37 = [(NLSplitDataProvider *)v35 initWithDataProvider:obj indexes:v36];
        modelValidationDataProvider = v16->_modelValidationDataProvider;
        v16->_modelValidationDataProvider = (NLDataProvider *)v37;

        v39 = v42;
        goto LABEL_14;
      }

      if ((v22 | v25)) {
        goto LABEL_10;
      }
    }
    v32 = obj;
    objc_storeStrong((id *)&v16->_modelTrainingDataProvider, obj);
    v39 = v42;
    v40 = v42;
    v29 = v16->_modelValidationDataProvider;
    v16->_modelValidationDataProvider = &v40->super;
LABEL_14:
  }
  return v16;
}

- (id)dataProviderOfType:(int64_t)a3
{
  if (!a3)
  {
    v4 = &OBJC_IVAR___NLModelTrainingDataSet__modelTrainingDataProvider;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.super.isa + *v4);
    return v5;
  }
  if (a3 == 1)
  {
    v4 = &OBJC_IVAR___NLModelTrainingDataSet__modelValidationDataProvider;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelValidationDataProvider, 0);

  objc_storeStrong((id *)&self->_modelTrainingDataProvider, 0);
}

@end