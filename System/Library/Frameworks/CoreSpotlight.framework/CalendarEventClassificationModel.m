@interface CalendarEventClassificationModel
+ (id)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (CalendarEventClassificationModel)init;
- (CalendarEventClassificationModel)initWithConfiguration:(id)a3 error:(id *)a4;
- (CalendarEventClassificationModel)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (CalendarEventClassificationModel)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (CalendarEventClassificationModel)initWithMLModel:(id)a3;
- (MLModel)model;
- (id)predictionFromEmb:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation CalendarEventClassificationModel

+ (id)URLOfModelInThisBundle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"doc_classification_model" ofType:@"mlmodelc"];

  if (v3)
  {
    v4 = +[NSURL fileURLWithPath:v3];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000A2FB0();
    }
    v4 = 0;
  }

  return v4;
}

- (CalendarEventClassificationModel)initWithMLModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CalendarEventClassificationModel;
  v6 = [(CalendarEventClassificationModel *)&v10 init];
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_model, a3), v7->_model)) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (CalendarEventClassificationModel)init
{
  v3 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v4 = [(CalendarEventClassificationModel *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (CalendarEventClassificationModel)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v8 = [(CalendarEventClassificationModel *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (CalendarEventClassificationModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = +[MLModel modelWithContentsOfURL:a3 error:a4];
  if (v5)
  {
    self = [(CalendarEventClassificationModel *)self initWithMLModel:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (CalendarEventClassificationModel)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = +[MLModel modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (v6)
  {
    self = [(CalendarEventClassificationModel *)self initWithMLModel:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 URLOfModelInThisBundle];
  [a1 loadContentsOfURL:v8 configuration:v7 completionHandler:v6];
}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007C5D0;
  v8[3] = &unk_1000DC180;
  id v9 = a5;
  id v7 = v9;
  +[MLModel loadContentsOfURL:a3 configuration:a4 completionHandler:v8];
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)MLPredictionOptions);
  id v8 = [(CalendarEventClassificationModel *)self predictionFromFeatures:v6 options:v7 error:a4];

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(CalendarEventClassificationModel *)self model];
  v11 = [v10 predictionFromFeatures:v9 options:v8 error:a5];

  if (v11)
  {
    v12 = [CalendarEventClassificationModelOutput alloc];
    v13 = [v11 featureValueForName:@"y"];
    v14 = [v13 multiArrayValue];
    v15 = [(CalendarEventClassificationModelOutput *)v12 initWithY:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CalendarEventClassificationModel *)self model];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007C898;
  v10[3] = &unk_1000DC1A8;
  id v11 = v6;
  id v9 = v6;
  [v8 predictionFromFeatures:v7 completionHandler:v10];
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CalendarEventClassificationModel *)self model];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007CA70;
  v13[3] = &unk_1000DC1A8;
  id v14 = v8;
  id v12 = v8;
  [v11 predictionFromFeatures:v10 options:v9 completionHandler:v13];
}

- (id)predictionFromEmb:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[CalendarEventClassificationModelInput alloc] initWithEmb:v6];

  id v8 = [(CalendarEventClassificationModel *)self predictionFromFeatures:v7 error:a4];

  return v8;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [objc_alloc((Class)MLArrayBatchProvider) initWithFeatureProviderArray:v8];
  id v11 = [(CalendarEventClassificationModel *)self model];
  id v12 = [v11 predictionsFromBatch:v10 options:v9 error:a5];

  if (v12)
  {
    v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
    if ((uint64_t)[v12 count] >= 1)
    {
      id v21 = v9;
      id v22 = v8;
      uint64_t v14 = 0;
      do
      {
        v15 = objc_msgSend(v12, "featuresAtIndex:", v14, v21, v22);
        v16 = [CalendarEventClassificationModelOutput alloc];
        v17 = [v15 featureValueForName:@"y"];
        v18 = [v17 multiArrayValue];
        v19 = [(CalendarEventClassificationModelOutput *)v16 initWithY:v18];

        [v13 addObject:v19];
        ++v14;
      }
      while (v14 < (uint64_t)[v12 count]);
      id v9 = v21;
      id v8 = v22;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
}

@end