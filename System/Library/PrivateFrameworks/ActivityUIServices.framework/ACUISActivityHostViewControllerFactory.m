@interface ACUISActivityHostViewControllerFactory
+ (id)activityHostViewControllerWithDescriptor:(id)a3 metricsRequest:(id)a4;
+ (id)activityHostViewControllerWithDescriptor:(id)a3 metricsRequest:(id)a4 payloadID:(id)a5;
+ (id)activityHostViewControllerWithDescriptor:(id)a3 sceneType:(int64_t)a4 metricsRequest:(id)a5;
@end

@implementation ACUISActivityHostViewControllerFactory

+ (id)activityHostViewControllerWithDescriptor:(id)a3 sceneType:(int64_t)a4 metricsRequest:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [[ACUISActivitySceneDescriptor alloc] initWithActivityDescriptor:v8 payloadIdentifier:0 activitySceneType:a4 metricsRequest:v7];

  v10 = [(ACUISActivitySceneDescriptor *)v9 _activitySceneDescriptor];
  switch(a4)
  {
    case 0:
      v11 = [_TtC18ActivityUIServices34ActivityListItemHostViewController alloc];
      v12 = [v10 activityDescriptor];
      v13 = [v10 metricsRequest];
      v14 = [(ActivityListItemHostViewController *)v11 initWithActivityDescriptor:v12 systemMetricsRequest:v13];
      goto LABEL_8;
    case 1:
      v15 = _TtC18ActivityUIServices32ActivityBannerHostViewController;
      goto LABEL_7;
    case 2:
      v15 = _TtC18ActivityUIServices33ActivityAmbientHostViewController;
      goto LABEL_7;
    case 3:
      v15 = _TtC18ActivityUIServices40ActivityAmbientCompactHostViewController;
LABEL_7:
      id v16 = [v15 alloc];
      v12 = [v10 activityDescriptor];
      v13 = [v10 metricsRequest];
      v17 = [v10 payloadID];
      v14 = (_TtC18ActivityUIServices34ActivityListItemHostViewController *)[v16 initWithActivityDescriptor:v12 systemMetricsRequest:v13 payloadID:v17];

LABEL_8:
      break;
    default:
      v14 = 0;
      break;
  }
  v18 = [[ACUISActivityHostViewController alloc] initWithActivityHostViewController:v14];

  return v18;
}

+ (id)activityHostViewControllerWithDescriptor:(id)a3 metricsRequest:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[ACUISActivitySceneDescriptor alloc] initWithActivityDescriptor:v6 payloadIdentifier:0 activitySceneType:0 metricsRequest:v5];

  id v8 = [(ACUISActivitySceneDescriptor *)v7 _activitySceneDescriptor];
  v9 = [_TtC18ActivityUIServices34ActivityListItemHostViewController alloc];
  v10 = [v8 activityDescriptor];
  v11 = [v8 metricsRequest];
  v12 = [(ActivityListItemHostViewController *)v9 initWithActivityDescriptor:v10 systemMetricsRequest:v11];

  v13 = [[ACUISActivityHostViewController alloc] initWithActivityHostViewController:v12];
  return v13;
}

+ (id)activityHostViewControllerWithDescriptor:(id)a3 metricsRequest:(id)a4 payloadID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[ACUISActivitySceneDescriptor alloc] initWithActivityDescriptor:v9 payloadIdentifier:v7 activitySceneType:1 metricsRequest:v8];

  v11 = [(ACUISActivitySceneDescriptor *)v10 _activitySceneDescriptor];
  v12 = [_TtC18ActivityUIServices32ActivityBannerHostViewController alloc];
  v13 = [v11 activityDescriptor];
  v14 = [v11 metricsRequest];
  v15 = [(ActivityBannerHostViewController *)v12 initWithActivityDescriptor:v13 systemMetricsRequest:v14 payloadID:v7];

  id v16 = [[ACUISActivityHostViewController alloc] initWithActivityHostViewController:v15];
  return v16;
}

@end