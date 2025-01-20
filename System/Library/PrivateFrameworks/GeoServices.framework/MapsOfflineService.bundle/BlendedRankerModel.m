@interface BlendedRankerModel
+ (id)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (BlendedRankerModel)init;
- (BlendedRankerModel)initWithConfiguration:(id)a3 error:(id *)a4;
- (BlendedRankerModel)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (BlendedRankerModel)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (BlendedRankerModel)initWithMLModel:(id)a3;
- (MLModel)model;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromPOPULARITY:(double)a3 DISTANCE:(double)a4 SCORE:(double)a5 NORMALIZED_RATING_SCORE:(double)a6 COUNTRY_CODE:(double)a7 ADDRESS_ACCURACY:(double)a8 ADDRESS_FEATURE_TYPE:(double)a9 NUM_TOKENS_MATCH_QUERY_RESULT:(double)a10 TYPE_OF_QUERY_RESULT_MATCH:(double)a11 IS_CATEGORY_QUERY:(double)a12 CATEGORY_TRIGGER_POPULARITY:(double)a13 JACCARD_SIMILARITY_UNION:(double)a14 JACCARD_SIMILARITY_RESULT:(double)a15 IS_NEGATIVE_CATEGORY:(double)a16 IS_PREFERRED_LANGUAGE:(double)a17 DEVICE_LOCALE:(double)a18 SUBSTRING_SIMILARITY:(double)a19 PREFIX_SIMILARITY:(double)a20 DIST_USER_TO_VIEWPORT:(double)a21 IS_USER_IN_VIEWPORT:(double)a22 IS_DEVICELOCATION_IN_VIEWPORT:(double)a23 DIST_RESULT_TO_VIEWPORT:(double)a24 IS_RESULT_IN_VIEWPORT:(double)a25 TIME_SINCE_VIEWPORT_CHANGED:(double)a26 IS_VIEWPORT_FRESH:(double)a27 CATEGORY_MATCH_NORMALIZED_SCORE:(double)a28 error:(id *)a29;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation BlendedRankerModel

+ (id)URLOfModelInThisBundle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"BlendedRankerModel" ofType:@"mlmodelc"];

  if (v3)
  {
    v4 = +[NSURL fileURLWithPath:v3];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_207C854();
    }
    v4 = 0;
  }

  return v4;
}

- (BlendedRankerModel)initWithMLModel:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)BlendedRankerModel;
    v6 = [(BlendedRankerModel *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_model, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BlendedRankerModel)init
{
  v3 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v4 = [(BlendedRankerModel *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (BlendedRankerModel)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v8 = [(BlendedRankerModel *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (BlendedRankerModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = +[MLModel modelWithContentsOfURL:a3 error:a4];
  if (v5)
  {
    self = [(BlendedRankerModel *)self initWithMLModel:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BlendedRankerModel)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = +[MLModel modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (v6)
  {
    self = [(BlendedRankerModel *)self initWithMLModel:v6];
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
  v8[2] = sub_207BEEC;
  v8[3] = &unk_24EDED0;
  id v9 = a5;
  id v7 = v9;
  +[MLModel loadContentsOfURL:a3 configuration:a4 completionHandler:v8];
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)MLPredictionOptions);
  id v8 = [(BlendedRankerModel *)self predictionFromFeatures:v6 options:v7 error:a4];

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(BlendedRankerModel *)self model];
  v11 = [v10 predictionFromFeatures:v9 options:v8 error:a5];

  if (v11)
  {
    v12 = [BlendedRankerModelOutput alloc];
    v13 = [v11 featureValueForName:@"target"];
    id v14 = [v13 int64Value];
    v15 = [v11 featureValueForName:@"classProbability"];
    v16 = [v15 dictionaryValue];
    v17 = [(BlendedRankerModelOutput *)v12 initWithTarget:v14 classProbability:v16];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BlendedRankerModel *)self model];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_207C1E4;
  v10[3] = &unk_24EDEF8;
  id v11 = v6;
  id v9 = v6;
  [v8 predictionFromFeatures:v7 completionHandler:v10];
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(BlendedRankerModel *)self model];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_207C3EC;
  v13[3] = &unk_24EDEF8;
  id v14 = v8;
  id v12 = v8;
  [v11 predictionFromFeatures:v10 options:v9 completionHandler:v13];
}

- (id)predictionFromPOPULARITY:(double)a3 DISTANCE:(double)a4 SCORE:(double)a5 NORMALIZED_RATING_SCORE:(double)a6 COUNTRY_CODE:(double)a7 ADDRESS_ACCURACY:(double)a8 ADDRESS_FEATURE_TYPE:(double)a9 NUM_TOKENS_MATCH_QUERY_RESULT:(double)a10 TYPE_OF_QUERY_RESULT_MATCH:(double)a11 IS_CATEGORY_QUERY:(double)a12 CATEGORY_TRIGGER_POPULARITY:(double)a13 JACCARD_SIMILARITY_UNION:(double)a14 JACCARD_SIMILARITY_RESULT:(double)a15 IS_NEGATIVE_CATEGORY:(double)a16 IS_PREFERRED_LANGUAGE:(double)a17 DEVICE_LOCALE:(double)a18 SUBSTRING_SIMILARITY:(double)a19 PREFIX_SIMILARITY:(double)a20 DIST_USER_TO_VIEWPORT:(double)a21 IS_USER_IN_VIEWPORT:(double)a22 IS_DEVICELOCATION_IN_VIEWPORT:(double)a23 DIST_RESULT_TO_VIEWPORT:(double)a24 IS_RESULT_IN_VIEWPORT:(double)a25 TIME_SINCE_VIEWPORT_CHANGED:(double)a26 IS_VIEWPORT_FRESH:(double)a27 CATEGORY_MATCH_NORMALIZED_SCORE:(double)a28 error:(id *)a29
{
  v31 = -[BlendedRankerModelInput initWithPOPULARITY:DISTANCE:SCORE:NORMALIZED_RATING_SCORE:COUNTRY_CODE:ADDRESS_ACCURACY:ADDRESS_FEATURE_TYPE:NUM_TOKENS_MATCH_QUERY_RESULT:TYPE_OF_QUERY_RESULT_MATCH:IS_CATEGORY_QUERY:CATEGORY_TRIGGER_POPULARITY:JACCARD_SIMILARITY_UNION:JACCARD_SIMILARITY_RESULT:IS_NEGATIVE_CATEGORY:IS_PREFERRED_LANGUAGE:DEVICE_LOCALE:SUBSTRING_SIMILARITY:PREFIX_SIMILARITY:DIST_USER_TO_VIEWPORT:IS_USER_IN_VIEWPORT:IS_DEVICELOCATION_IN_VIEWPORT:DIST_RESULT_TO_VIEWPORT:IS_RESULT_IN_VIEWPORT:TIME_SINCE_VIEWPORT_CHANGED:IS_VIEWPORT_FRESH:CATEGORY_MATCH_NORMALIZED_SCORE:]([BlendedRankerModelInput alloc], "initWithPOPULARITY:DISTANCE:SCORE:NORMALIZED_RATING_SCORE:COUNTRY_CODE:ADDRESS_ACCURACY:ADDRESS_FEATURE_TYPE:NUM_TOKENS_MATCH_QUERY_RESULT:TYPE_OF_QUERY_RESULT_MATCH:IS_CATEGORY_QUERY:CATEGORY_TRIGGER_POPULARITY:JACCARD_SIMILARITY_UNION:JACCARD_SIMILARITY_RESULT:IS_NEGATIVE_CATEGORY:IS_PREFERRED_LANGUAGE:DEVICE_LOCALE:SUBSTRING_SIMILARITY:PREFIX_SIMILARITY:DIST_USER_TO_VIEWPORT:IS_USER_IN_VIEWPORT:IS_DEVICELOCATION_IN_VIEWPORT:DIST_RESULT_TO_VIEWPORT:IS_RESULT_IN_VIEWPORT:TIME_SINCE_VIEWPORT_CHANGED:IS_VIEWPORT_FRESH:CATEGORY_MATCH_NORMALIZED_SCORE:", a3, a4, a5, a6, a7, a8, a9, a10, *(void *)&a11, *(void *)&a12, *(void *)&a13, *(void *)&a14, *(void *)&a15,
          *(void *)&a16,
          *(void *)&a17,
          *(void *)&a18,
          *(void *)&a19,
          *(void *)&a20,
          *(void *)&a21,
          *(void *)&a22,
          *(void *)&a23,
          *(void *)&a24,
          *(void *)&a25,
          *(void *)&a26,
          *(void *)&a27,
          *(void *)&a28);
  v32 = [(BlendedRankerModel *)self predictionFromFeatures:v31 error:a29];

  return v32;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [objc_alloc((Class)MLArrayBatchProvider) initWithFeatureProviderArray:v8];
  id v11 = [(BlendedRankerModel *)self model];
  id v12 = [v11 predictionsFromBatch:v10 options:v9 error:a5];

  if (v12)
  {
    v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
    if ((uint64_t)[v12 count] >= 1)
    {
      id v23 = v10;
      id v24 = v9;
      id v25 = v8;
      uint64_t v14 = 0;
      do
      {
        v15 = [v12 featuresAtIndex:v14];
        v16 = [BlendedRankerModelOutput alloc];
        v17 = [v15 featureValueForName:@"target"];
        id v18 = [v17 int64Value];
        v19 = [v15 featureValueForName:@"classProbability"];
        v20 = [v19 dictionaryValue];
        v21 = [(BlendedRankerModelOutput *)v16 initWithTarget:v18 classProbability:v20];

        [v13 addObject:v21];
        ++v14;
      }
      while (v14 < (uint64_t)[v12 count]);
      id v9 = v24;
      id v8 = v25;
      id v10 = v23;
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