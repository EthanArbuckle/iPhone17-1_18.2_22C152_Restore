@interface CPLCKCheckFeatureAvailabilityOperation
- (CPLCKCheckFeatureAvailabilityOperation)init;
- (id)featureCheckAvailabilityCompletionBlock;
- (void)setFeatureCheckAvailabilityCompletionBlock:(id)a3;
@end

@implementation CPLCKCheckFeatureAvailabilityOperation

- (CPLCKCheckFeatureAvailabilityOperation)init
{
  if (qword_1002CE570 != -1) {
    dispatch_once(&qword_1002CE570, &stru_100277C28);
  }
  v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [v3 stringForKey:@"CPLCloudPhotosAvailabilityServiceName"];

  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      v5 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Using custom CloudPhotosAvailability service: '%@'", buf, 0xCu);
      }
    }
  }
  else
  {
    v4 = @"CloudPhotosAvailability";
  }
  uint64_t v6 = objc_opt_class();
  v12.receiver = self;
  v12.super_class = (Class)CPLCKCheckFeatureAvailabilityOperation;
  v7 = [(CPLCKCheckFeatureAvailabilityOperation *)&v12 initWithServiceName:v4 functionName:@"checkFeatures" responseClass:v6];
  v8 = v7;
  if (v7)
  {
    [(CPLCKCheckFeatureAvailabilityOperation *)v7 setRequest:qword_1002CE568];
    objc_initWeak((id *)buf, v8);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100048CB4;
    v10[3] = &unk_100277C08;
    objc_copyWeak(&v11, (id *)buf);
    [(CPLCKCheckFeatureAvailabilityOperation *)v8 setCodeOperationCompletionBlock:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }

  return v8;
}

- (id)featureCheckAvailabilityCompletionBlock
{
  return self->_featureCheckAvailabilityCompletionBlock;
}

- (void)setFeatureCheckAvailabilityCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end