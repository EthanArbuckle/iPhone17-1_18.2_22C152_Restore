@interface TRIClient(MLRTask)
+ (id)mlr_clientWithMLRTask:()MLRTask;
+ (id)mlr_namespaceNameWithMLRTask:()MLRTask;
@end

@implementation TRIClient(MLRTask)

+ (id)mlr_clientWithMLRTask:()MLRTask
{
  id v3 = a3;
  v4 = [v3 internalTask];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v3 internalTask];
    v7 = [v6 triClient];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)mlr_namespaceNameWithMLRTask:()MLRTask
{
  id v3 = a3;
  v4 = [v3 internalTask];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v3 internalTask];
    v7 = [v6 triBMLT];
    v8 = [v7 namespaceId];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end