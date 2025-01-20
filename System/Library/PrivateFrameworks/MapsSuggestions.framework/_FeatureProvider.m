@interface _FeatureProvider
- (id)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation _FeatureProvider

- (id)featureNames
{
  if (qword_100081E60 != -1) {
    dispatch_once(&qword_100081E60, &stru_1000719E0);
  }
  v2 = (void *)qword_100081E58;
  return v2;
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_FeatureProvider;
  v5 = [(_FeatureProvider *)&v8 featureValueForName:v4];
  if (!v5)
  {
    v5 = +[MLFeatureValue undefinedFeatureValueWithType:2];
  }
  v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Will respond: %@ => %@", buf, 0x16u);
  }

  return v5;
}

@end