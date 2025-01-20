@interface NMCLocationManager
- (NMCLocationManager)initWithBundleIdentifier:(id)a3;
- (NMCLocationManager)initWithEffectiveBundleIdentifier:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)effectiveBundleIdentifier;
- (id)locationDidUpdate;
- (void)dealloc;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)locationManagerDidPauseLocationUpdates:(id)a3;
- (void)locationManagerDidResumeLocationUpdates:(id)a3;
- (void)reset;
- (void)setLocationDidUpdate:(id)a3;
- (void)startLocationUpdate;
- (void)stopLocationUpdate;
@end

@implementation NMCLocationManager

- (NMCLocationManager)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NMCLocationManager;
  v5 = [(NMCLocationManager *)&v13 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v6;

    v8 = v5->_bundleIdentifier;
    if (v8)
    {
      v9 = sub_100029EFC();
      v10 = [v9 objectForKeyedSubscript:v8];
      if (!v10) {
        v10 = v8;
      }
    }
    else
    {
      v10 = 0;
    }

    effectiveBundleIdentifier = v5->_effectiveBundleIdentifier;
    v5->_effectiveBundleIdentifier = v10;
  }
  return v5;
}

- (NMCLocationManager)initWithEffectiveBundleIdentifier:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NMCLocationManager;
  v5 = [(NMCLocationManager *)&v20 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    effectiveBundleIdentifier = v5->_effectiveBundleIdentifier;
    v5->_effectiveBundleIdentifier = v6;

    id v8 = v4;
    if (v8)
    {
      v9 = sub_100029EFC();
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v22;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            v16 = [v10 objectForKeyedSubscript:v15];
            if ([v16 isEqualToString:v8])
            {
              v17 = v15;

              goto LABEL_13;
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      v17 = (NSString *)v8;
LABEL_13:
    }
    else
    {
      v17 = 0;
    }

    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v17;
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NMCLocationManager;
  [(NMCLocationManager *)&v2 dealloc];
}

- (void)startLocationUpdate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000297EC;
  block[3] = &unk_100080F10;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)stopLocationUpdate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029914;
  block[3] = &unk_100080F10;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)reset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000299F4;
  block[3] = &unk_100080F10;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  unsigned int v4 = [a3 authorizationStatus];
  if (self->_updatingLocations && v4 - 3 <= 1)
  {
    locationManager = self->_locationManager;
    [(CLLocationManager *)locationManager startUpdatingLocation];
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v12 = a4;
  if ([v12 count])
  {
    v5 = [v12 firstObject];
    v6 = objc_alloc_init(NMMessage);
    [(NMMessage *)v6 setType:202];
    id v7 = [[NMArgument alloc] _nm_initWithLocation:v5 tag:1];
    [(NMMessage *)v6 addArgument:v7];
    id v8 = objc_alloc_init(NMArgument);

    [(NMArgument *)v8 setTag:4];
    [(NMArgument *)v8 setStringValue:self->_bundleIdentifier];
    [(NMMessage *)v6 addArgument:v8];
    v9 = +[NMCGizmoConnection sharedInstance];
    [v9 sendMessage:v6 options:0];

    id v10 = [(NMCLocationManager *)self locationDidUpdate];

    if (v10)
    {
      id v11 = [(NMCLocationManager *)self locationDidUpdate];
      ((void (**)(void, void *))v11)[2](v11, v5);
    }
  }

  _objc_release_x1();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  v9 = objc_alloc_init(NMMessage);
  [(NMMessage *)v9 setType:203];
  id v6 = [[NMArgument alloc] _nm_initWithErrorValue:v5 tag:3];

  [(NMMessage *)v9 addArgument:v6];
  id v7 = objc_alloc_init(NMArgument);

  [(NMArgument *)v7 setTag:4];
  [(NMArgument *)v7 setStringValue:self->_bundleIdentifier];
  [(NMMessage *)v9 addArgument:v7];
  id v8 = +[NMCGizmoConnection sharedInstance];
  [v8 sendMessage:v9 options:0];
}

- (void)locationManagerDidPauseLocationUpdates:(id)a3
{
  id v6 = objc_alloc_init(NMMessage);
  [(NMMessage *)v6 setType:204];
  unsigned int v4 = objc_alloc_init(NMArgument);
  [(NMArgument *)v4 setTag:4];
  [(NMArgument *)v4 setStringValue:self->_bundleIdentifier];
  [(NMMessage *)v6 addArgument:v4];
  id v5 = +[NMCGizmoConnection sharedInstance];
  [v5 sendMessage:v6 options:0];
}

- (void)locationManagerDidResumeLocationUpdates:(id)a3
{
  id v6 = objc_alloc_init(NMMessage);
  [(NMMessage *)v6 setType:205];
  unsigned int v4 = objc_alloc_init(NMArgument);
  [(NMArgument *)v4 setTag:4];
  [(NMArgument *)v4 setStringValue:self->_bundleIdentifier];
  [(NMMessage *)v6 addArgument:v4];
  id v5 = +[NMCGizmoConnection sharedInstance];
  [v5 sendMessage:v6 options:0];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)effectiveBundleIdentifier
{
  return self->_effectiveBundleIdentifier;
}

- (id)locationDidUpdate
{
  return self->_locationDidUpdate;
}

- (void)setLocationDidUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationDidUpdate, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end