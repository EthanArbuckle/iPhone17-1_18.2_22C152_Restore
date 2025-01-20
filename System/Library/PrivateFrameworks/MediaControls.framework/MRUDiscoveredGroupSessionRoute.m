@interface MRUDiscoveredGroupSessionRoute
- (BOOL)isB520Route;
- (BOOL)isHomePodRoute;
- (BOOL)isPhoneRoute;
- (BOOL)isPickable;
- (BOOL)isPicked;
- (MRDiscoveredGroupSession)discoveredGroupSession;
- (MRUDiscoveredGroupSessionRoute)initWithDiscoveredGroupSession:(id)a3;
- (id)routeName;
- (id)routeUID;
- (int64_t)routeSubtype;
- (int64_t)routeType;
- (void)setDiscoveredGroupSession:(id)a3;
@end

@implementation MRUDiscoveredGroupSessionRoute

- (MRUDiscoveredGroupSessionRoute)initWithDiscoveredGroupSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUDiscoveredGroupSessionRoute;
  v6 = [(MRUDiscoveredGroupSessionRoute *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_discoveredGroupSession, a3);
  }

  return v7;
}

- (id)routeName
{
  v3 = [(MRDiscoveredGroupSession *)self->_discoveredGroupSession hostInfo];
  v4 = [v3 displayName];
  id v5 = [(MRDiscoveredGroupSession *)self->_discoveredGroupSession hostInfo];
  [v5 routeType];
  v6 = MRGroupSessionRouteMakeName();

  return v6;
}

- (id)routeUID
{
  return (id)[(MRDiscoveredGroupSession *)self->_discoveredGroupSession identifier];
}

- (int64_t)routeType
{
  return 0;
}

- (int64_t)routeSubtype
{
  v2 = [(MRDiscoveredGroupSession *)self->_discoveredGroupSession hostInfo];
  unsigned int v3 = [v2 routeType] - 1;
  if (v3 > 0xA) {
    int64_t v4 = 1;
  }
  else {
    int64_t v4 = qword_1AE963B20[(char)v3];
  }

  return v4;
}

- (BOOL)isHomePodRoute
{
  v2 = [(MRDiscoveredGroupSession *)self->_discoveredGroupSession hostInfo];
  char v3 = [v2 routeType];

  return (v3 & 0xFE) == 8;
}

- (BOOL)isB520Route
{
  v2 = [(MRDiscoveredGroupSession *)self->_discoveredGroupSession hostInfo];
  BOOL v3 = [v2 routeType] == 9;

  return v3;
}

- (BOOL)isPicked
{
  return 0;
}

- (BOOL)isPickable
{
  return 1;
}

- (BOOL)isPhoneRoute
{
  return 0;
}

- (MRDiscoveredGroupSession)discoveredGroupSession
{
  return self->_discoveredGroupSession;
}

- (void)setDiscoveredGroupSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end