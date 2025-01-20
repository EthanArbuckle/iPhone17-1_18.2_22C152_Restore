@interface NavdBucketizedLocations
- (NavdBucketizedLocations)init;
- (id).cxx_construct;
- (id)locations;
- (void)_pruneLeachedLocations;
- (void)addLocation:(id)a3;
@end

@implementation NavdBucketizedLocations

- (NavdBucketizedLocations)init
{
  v9.receiver = self;
  v9.super_class = (Class)NavdBucketizedLocations;
  v2 = [(NavdBucketizedLocations *)&v9 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = 0;
    engine = v2->_config.engine;
    do
      engine = (MapsSuggestionsEngine *)((char *)engine + qword_100066E00[v4++]);
    while (v4 != 5);
    v2->_config.engine = engine;
    v2->_config.requester = (NavdNetworkRequester *)5;
    v6 = (MNRouteGeniusDelegateProxy *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v2->_config.engine];
    delegate = v3->_config.delegate;
    v3->_config.delegate = v6;
  }
  return v3;
}

- (void)addLocation:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self->_config.delegate;
  objc_sync_enter(v4);
  [(MNRouteGeniusDelegateProxy *)self->_config.delegate insertObject:v5 atIndex:0];
  [(NavdBucketizedLocations *)self _pruneLeachedLocations];
  objc_sync_exit(v4);
}

- (void)_pruneLeachedLocations
{
  if (self->_config.requester)
  {
    v3 = 0;
    unint64_t v4 = 0;
    id v5 = 0;
    do
    {
      v6 = (char *)[(MNRouteGeniusDelegateProxy *)self->_config.delegate count];
      if (v4 < (unint64_t)v6)
      {
        v7 = v6;
        id v5 = (char *)v4;
        while (1)
        {
          v8 = [(MNRouteGeniusDelegateProxy *)self->_config.delegate objectAtIndexedSubscript:v5];
          objc_super v9 = [v8 timestamp];
          double v10 = MapsSuggestionsSecondsSince(v9);
          double v11 = (double)qword_100066E28[(void)v3];

          if (v10 >= v11) {
            break;
          }
          if (v7 == ++v5)
          {
            id v5 = v7;
            break;
          }
        }
      }
      unint64_t v12 = qword_100066E00[(void)v3];
      unint64_t v13 = (unint64_t)&v5[-v4];
      if ((unint64_t)&v5[-v4] > v12)
      {
        do
        {
          [(MNRouteGeniusDelegateProxy *)self->_config.delegate removeObjectAtIndex:v4];
          --v13;
        }
        while (v13 > v12);
        id v5 = (char *)(v12 + v4);
      }
      v3 = (NavdNetworkRequester *)((char *)v3 + 1);
      unint64_t v4 = (unint64_t)v5;
    }
    while (v3 < self->_config.requester);
  }
}

- (id)locations
{
  v3 = self->_config.delegate;
  objc_sync_enter(v3);
  id v4 = [(MNRouteGeniusDelegateProxy *)self->_config.delegate copy];
  objc_sync_exit(v3);

  return v4;
}

- (void).cxx_destruct
{
  name = self->_config.name;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end