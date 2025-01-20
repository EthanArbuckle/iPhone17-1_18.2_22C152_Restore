@interface HDClinicalBiomeSignalsManager
+ (void)lazilySendEvent:(id)a3 context:(id)a4;
+ (void)sendEvent:(id)a3 context:(id)a4;
@end

@implementation HDClinicalBiomeSignalsManager

+ (void)sendEvent:(id)a3 context:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if (![v8 length])
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"HDClinicalBiomeSignalsManager.m", 20, @"Invalid parameter not satisfying: %@", @"eventIdentifier.length > 0" object file lineNumber description];
  }
  v9 = BiomeLibrary();
  v10 = [v9 Discoverability];
  id v17 = [v10 Signals];

  v11 = [v17 source];
  id v12 = objc_alloc((Class)BMDiscoverabilitySignals);
  v13 = +[NSProcessInfo processInfo];
  v14 = [v13 operatingSystemVersionString];
  id v15 = [v12 initWithContentIdentifier:v8 context:v7 osBuild:v14 userInfo:0];

  [v11 sendEvent:v15];
}

+ (void)lazilySendEvent:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2458C;
  block[3] = &unk_112820;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

@end