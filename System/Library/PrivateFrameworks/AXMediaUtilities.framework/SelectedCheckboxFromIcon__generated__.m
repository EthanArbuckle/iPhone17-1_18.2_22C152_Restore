@interface SelectedCheckboxFromIcon__generated__
+ (id)urlOfModelInThisBundle;
- (MLModel)model;
- (SelectedCheckboxFromIcon__generated__)init;
- (SelectedCheckboxFromIcon__generated__)initWithConfiguration:(id)a3 error:(id *)a4;
- (SelectedCheckboxFromIcon__generated__)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (SelectedCheckboxFromIcon__generated__)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromImage:(__CVBuffer *)a3 error:(id *)a4;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation SelectedCheckboxFromIcon__generated__

+ (id)urlOfModelInThisBundle
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"SelectedCheckboxFromIcon" ofType:@"mlmodelc"];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (SelectedCheckboxFromIcon__generated__)init
{
  v3 = [(id)objc_opt_class() urlOfModelInThisBundle];
  v4 = [(SelectedCheckboxFromIcon__generated__ *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (SelectedCheckboxFromIcon__generated__)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SelectedCheckboxFromIcon__generated__;
  v7 = [(SelectedCheckboxFromIcon__generated__ *)&v12 init];
  if (v7
    && ([MEMORY[0x1E4F1E968] modelWithContentsOfURL:v6 error:a4],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        model = v7->_model,
        v7->_model = (MLModel *)v8,
        model,
        v7->_model))
  {
    v10 = v7;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (SelectedCheckboxFromIcon__generated__)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() urlOfModelInThisBundle];
  uint64_t v8 = [(SelectedCheckboxFromIcon__generated__ *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (SelectedCheckboxFromIcon__generated__)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SelectedCheckboxFromIcon__generated__;
  v10 = [(SelectedCheckboxFromIcon__generated__ *)&v15 init];
  if (v10
    && ([MEMORY[0x1E4F1E968] modelWithContentsOfURL:v8 configuration:v9 error:a5],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        model = v10->_model,
        v10->_model = (MLModel *)v11,
        model,
        v10->_model))
  {
    v13 = v10;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1E9E0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [(SelectedCheckboxFromIcon__generated__ *)self predictionFromFeatures:v7 options:v8 error:a4];

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v5 = [(MLModel *)self->_model predictionFromFeatures:a3 options:a4 error:a5];
  id v6 = [SelectedCheckboxFromIcon__generated__Output alloc];
  id v7 = [v5 featureValueForName:@"labelProbability"];
  id v8 = [v7 dictionaryValue];
  id v9 = [v5 featureValueForName:@"label"];
  v10 = [v9 stringValue];
  uint64_t v11 = [(SelectedCheckboxFromIcon__generated__Output *)v6 initWithLabelProbability:v8 label:v10];

  return v11;
}

- (id)predictionFromImage:(__CVBuffer *)a3 error:(id *)a4
{
  id v6 = [[SelectedCheckboxFromIcon__generated__Input alloc] initWithImage:a3];
  id v7 = [(SelectedCheckboxFromIcon__generated__ *)self predictionFromFeatures:v6 error:a4];

  return v7;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v22 = v7;
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F1E910]) initWithFeatureProviderArray:v7];
  v21 = v8;
  id v9 = -[MLModel predictionsFromBatch:options:error:](self->_model, "predictionsFromBatch:options:error:");
  v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  if ([v9 count] >= 1)
  {
    uint64_t v11 = 0;
    do
    {
      objc_super v12 = [v9 featuresAtIndex:v11];
      v13 = [SelectedCheckboxFromIcon__generated__Output alloc];
      v14 = [v12 featureValueForName:@"labelProbability"];
      objc_super v15 = [v14 dictionaryValue];
      v16 = [v12 featureValueForName:@"label"];
      v17 = [v16 stringValue];
      v18 = [(SelectedCheckboxFromIcon__generated__Output *)v13 initWithLabelProbability:v15 label:v17];

      [v10 addObject:v18];
      ++v11;
    }
    while (v11 < [v9 count]);
  }

  return v10;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
}

@end