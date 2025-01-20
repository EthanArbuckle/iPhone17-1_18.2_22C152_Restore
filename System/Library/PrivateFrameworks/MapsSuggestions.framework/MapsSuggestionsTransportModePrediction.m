@interface MapsSuggestionsTransportModePrediction
+ (id)URLOfModelInThisBundle;
+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4;
- (MLModel)model;
- (MapsSuggestionsTransportModePrediction)init;
- (MapsSuggestionsTransportModePrediction)initWithConfiguration:(id)a3 error:(id *)a4;
- (MapsSuggestionsTransportModePrediction)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (MapsSuggestionsTransportModePrediction)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (MapsSuggestionsTransportModePrediction)initWithMLModel:(id)a3;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromTemperature:(double)a3 ChanceOfPrecipitation:(double)a4 TimeOfDay:(double)a5 DayOfWeek:(double)a6 TouristBit:(double)a7 DistanceFromOriginToDestination:(double)a8 DistanceFromHereToOrigin:(double)a9 distanceFromOriginToDestination:(double)a10 DistanceFromHereToHome:(double)a11 DistanceFromHereToWork:(double)a12 DistanceFromHereToParkedCar:(double)a13 UserPreferenceForTransportType_1:(double)a14 UserPreferenceForTransportType_3:(double)a15 UserPreferenceForTransportType_2:(double)a16 MapType_3:(double)a17 MapType_0:(double)a18 MapType_2:(double)a19 MapType_1:(double)a20 MapType_4:(double)a21 error:(id *)a22;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation MapsSuggestionsTransportModePrediction

+ (id)URLOfModelInThisBundle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"MapsSuggestionsTransportModePrediction" ofType:@"mlmodelc"];

  if (v3)
  {
    v4 = +[NSURL fileURLWithPath:v3];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load MapsSuggestionsTransportModePrediction.mlmodelc in the bundle resource", v6, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (MapsSuggestionsTransportModePrediction)initWithMLModel:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MapsSuggestionsTransportModePrediction;
    v6 = [(MapsSuggestionsTransportModePrediction *)&v10 init];
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

- (MapsSuggestionsTransportModePrediction)init
{
  v3 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v4 = [(MapsSuggestionsTransportModePrediction *)self initWithContentsOfURL:v3 error:0];

  return v4;
}

- (MapsSuggestionsTransportModePrediction)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() URLOfModelInThisBundle];
  v8 = [(MapsSuggestionsTransportModePrediction *)self initWithContentsOfURL:v7 configuration:v6 error:a4];

  return v8;
}

- (MapsSuggestionsTransportModePrediction)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = +[MLModel modelWithContentsOfURL:a3 error:a4];
  if (v5)
  {
    self = [(MapsSuggestionsTransportModePrediction *)self initWithMLModel:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (MapsSuggestionsTransportModePrediction)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = +[MLModel modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (v6)
  {
    self = [(MapsSuggestionsTransportModePrediction *)self initWithMLModel:v6];
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
  v8[2] = sub_10004E040;
  v8[3] = &unk_100072BB8;
  id v9 = a5;
  id v7 = v9;
  +[MLModel loadContentsOfURL:a3 configuration:a4 completionHandler:v8];
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)MLPredictionOptions);
  id v8 = [(MapsSuggestionsTransportModePrediction *)self predictionFromFeatures:v6 options:v7 error:a4];

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [(MapsSuggestionsTransportModePrediction *)self model];
  v11 = [v10 predictionFromFeatures:v9 options:v8 error:a5];

  if (v11)
  {
    v12 = [MapsSuggestionsTransportModePredictionOutput alloc];
    v13 = [v11 featureValueForName:@"actualTransportMode"];
    v14 = [v13 stringValue];
    v15 = [v11 featureValueForName:@"actualTransportModeProbability"];
    v16 = [v15 dictionaryValue];
    v17 = [(MapsSuggestionsTransportModePredictionOutput *)v12 initWithActualTransportMode:v14 actualTransportModeProbability:v16];
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
  id v8 = [(MapsSuggestionsTransportModePrediction *)self model];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004E340;
  v10[3] = &unk_100072BE0;
  id v11 = v6;
  id v9 = v6;
  [v8 predictionFromFeatures:v7 completionHandler:v10];
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MapsSuggestionsTransportModePrediction *)self model];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004E550;
  v13[3] = &unk_100072BE0;
  id v14 = v8;
  id v12 = v8;
  [v11 predictionFromFeatures:v10 options:v9 completionHandler:v13];
}

- (id)predictionFromTemperature:(double)a3 ChanceOfPrecipitation:(double)a4 TimeOfDay:(double)a5 DayOfWeek:(double)a6 TouristBit:(double)a7 DistanceFromOriginToDestination:(double)a8 DistanceFromHereToOrigin:(double)a9 distanceFromOriginToDestination:(double)a10 DistanceFromHereToHome:(double)a11 DistanceFromHereToWork:(double)a12 DistanceFromHereToParkedCar:(double)a13 UserPreferenceForTransportType_1:(double)a14 UserPreferenceForTransportType_3:(double)a15 UserPreferenceForTransportType_2:(double)a16 MapType_3:(double)a17 MapType_0:(double)a18 MapType_2:(double)a19 MapType_1:(double)a20 MapType_4:(double)a21 error:(id *)a22
{
  v24 = -[MapsSuggestionsTransportModePredictionInput initWithTemperature:ChanceOfPrecipitation:TimeOfDay:DayOfWeek:TouristBit:DistanceFromOriginToDestination:DistanceFromHereToOrigin:distanceFromOriginToDestination:DistanceFromHereToHome:DistanceFromHereToWork:DistanceFromHereToParkedCar:UserPreferenceForTransportType_1:UserPreferenceForTransportType_3:UserPreferenceForTransportType_2:MapType_3:MapType_0:MapType_2:MapType_1:MapType_4:]([MapsSuggestionsTransportModePredictionInput alloc], "initWithTemperature:ChanceOfPrecipitation:TimeOfDay:DayOfWeek:TouristBit:DistanceFromOriginToDestination:DistanceFromHereToOrigin:distanceFromOriginToDestination:DistanceFromHereToHome:DistanceFromHereToWork:DistanceFromHereToParkedCar:UserPreferenceForTransportType_1:UserPreferenceForTransportType_3:UserPreferenceForTransportType_2:MapType_3:MapType_0:MapType_2:MapType_1:MapType_4:", a3, a4, a5, a6, a7, a8, a9, a10, *(void *)&a11, *(void *)&a12, *(void *)&a13, *(void *)&a14, *(void *)&a15, *(void *)&a16,
          *(void *)&a17,
          *(void *)&a18,
          *(void *)&a19,
          *(void *)&a20,
          *(void *)&a21);
  v25 = [(MapsSuggestionsTransportModePrediction *)self predictionFromFeatures:v24 error:a22];

  return v25;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [objc_alloc((Class)MLArrayBatchProvider) initWithFeatureProviderArray:v8];
  id v11 = [(MapsSuggestionsTransportModePrediction *)self model];
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
        v16 = [MapsSuggestionsTransportModePredictionOutput alloc];
        v17 = [v15 featureValueForName:@"actualTransportMode"];
        v18 = [v17 stringValue];
        v19 = [v15 featureValueForName:@"actualTransportModeProbability"];
        v20 = [v19 dictionaryValue];
        v21 = [(MapsSuggestionsTransportModePredictionOutput *)v16 initWithActualTransportMode:v18 actualTransportModeProbability:v20];

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