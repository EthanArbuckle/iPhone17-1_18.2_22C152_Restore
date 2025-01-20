@interface MAAsset
- (NSString)assetState;
- (id)compatibilityVersion;
- (id)configurationBundleURLsForType:(id)a3;
- (id)contentVersion;
- (int64_t)db_compareCompatibilityVersionTo:(id)a3;
- (int64_t)db_compareContentRevisionTo:(id)a3;
- (int64_t)db_compareContentVersionTo:(id)a3;
- (int64_t)db_compareIgnoringContentRevisionTo:(id)a3;
- (int64_t)db_comparePlatformScoreTo:(id)a3;
- (int64_t)db_compareTo:(id)a3;
- (void)contentRevision;
@end

@implementation MAAsset

- (int64_t)db_compareIgnoringContentRevisionTo:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MAAsset *)self db_compareContentVersionTo:v4];
  if (!v5)
  {
    [(MAAsset *)self db_compareCompatibilityVersionTo:v4];
    int64_t v5 = [(MAAsset *)self db_comparePlatformScoreTo:v4];
  }

  return v5;
}

- (int64_t)db_compareTo:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MAAsset *)self db_compareIgnoringContentRevisionTo:v4];
  if (!v5) {
    int64_t v5 = [(MAAsset *)self db_compareContentRevisionTo:v4];
  }

  return v5;
}

- (NSString)assetState
{
  v2 = (char *)[(MAAsset *)self state];
  if ((unint64_t)(v2 - 1) > 5) {
    return (NSString *)@"Unknown";
  }
  else {
    return (NSString *)*(&off_100010978 + (void)(v2 - 1));
  }
}

- (id)compatibilityVersion
{
  if (a1)
  {
    id v5 = 0;
    v1 = sub_100008B20(a1, &v5);
    id v2 = v5;
    if (!v1 && v2)
    {
      id v4 = +[NSException gc_exceptionWithName:NSInvalidArgumentException error:v2];
      objc_exception_throw(v4);
    }
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

- (int64_t)db_compareCompatibilityVersionTo:(id)a3
{
  id v4 = a3;
  id v5 = -[MAAsset compatibilityVersion]_0(self);
  v6 = -[MAAsset compatibilityVersion]_0(v4);

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

- (id)contentVersion
{
  if (a1)
  {
    id v5 = 0;
    v1 = sub_100008DD0(a1, &v5);
    id v2 = v5;
    if (!v1 && v2)
    {
      id v4 = +[NSException gc_exceptionWithName:NSInvalidArgumentException error:v2];
      objc_exception_throw(v4);
    }
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

- (int64_t)db_compareContentVersionTo:(id)a3
{
  id v4 = a3;
  id v5 = -[MAAsset contentVersion]_0(self);
  v6 = -[MAAsset contentVersion]_0(v4);

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

- (void)contentRevision
{
  if (!a1) {
    return 0;
  }
  id v5 = 0;
  v1 = sub_1000090DC(a1, &v5);
  id v2 = v5;
  if (!v1 && v2)
  {
    id v4 = +[NSException gc_exceptionWithName:NSInvalidArgumentException error:v2];
    objc_exception_throw(v4);
  }

  return v1;
}

- (int64_t)db_compareContentRevisionTo:(id)a3
{
  id v4 = a3;
  id v5 = -[MAAsset contentRevision]_0(self);
  v6 = -[MAAsset contentRevision]_0(v4);

  if ((uint64_t)v5 < (uint64_t)v6) {
    return -1;
  }
  else {
    return (uint64_t)v5 > (uint64_t)v6;
  }
}

- (int64_t)db_comparePlatformScoreTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10000A310(self);
  uint64_t v6 = sub_10000A310(v4);

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (id)configurationBundleURLsForType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MAAsset *)self assetType];
  unsigned __int8 v6 = [v5 isEqual:@"com.apple.MobileAsset.GameController.DB1"];

  if (v6)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000AB20;
    v13[3] = &unk_100010958;
    v13[4] = self;
    id v14 = v4;
    id v7 = +[GCFuture futureWithLabel:@"Find configuration bundles in asset" onQueue:0 block:v13];
  }
  else
  {
    v15[0] = NSLocalizedDescriptionKey;
    v15[1] = NSLocalizedFailureReasonErrorKey;
    v16[0] = @"Invalid asset.";
    v9 = [(MAAsset *)self assetType];
    v10 = +[NSString stringWithFormat:@"Asset has incorrect type '%@'.", v9];
    v16[1] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    v12 = sub_10000B688((uint64_t)NSError, 2, v11);
    id v7 = +[GCFuture futureWithError:v12];
  }

  return v7;
}

@end