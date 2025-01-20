@interface MRUActiveGroupSessionRoute
- (BOOL)isB520Route;
- (BOOL)isHomePodRoute;
- (BOOL)isPhoneRoute;
- (BOOL)isPickable;
- (BOOL)isPicked;
- (MRGroupSessionInfo)groupSessionInfo;
- (MRUActiveGroupSessionRoute)initWithActiveSession:(id)a3;
- (id)routeName;
- (id)routeUID;
- (int64_t)routeSubtype;
- (int64_t)routeType;
- (void)setGroupSessionInfo:(id)a3;
@end

@implementation MRUActiveGroupSessionRoute

- (MRUActiveGroupSessionRoute)initWithActiveSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUActiveGroupSessionRoute;
  v6 = [(MRUActiveGroupSessionRoute *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_groupSessionInfo, a3);
  }

  return v7;
}

- (id)routeName
{
  v3 = [(MRGroupSessionInfo *)self->_groupSessionInfo hostInfo];
  v4 = [v3 displayName];
  id v5 = [(MRGroupSessionInfo *)self->_groupSessionInfo hostInfo];
  [v5 routeType];
  v6 = MRGroupSessionRouteMakeName();

  return v6;
}

- (id)routeUID
{
  return (id)[(MRGroupSessionInfo *)self->_groupSessionInfo effectiveIdentifier];
}

- (int64_t)routeType
{
  return 0;
}

- (int64_t)routeSubtype
{
  v2 = [(MRGroupSessionInfo *)self->_groupSessionInfo hostInfo];
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
  v2 = [(MRGroupSessionInfo *)self->_groupSessionInfo hostInfo];
  char v3 = [v2 routeType];

  return (v3 & 0xFE) == 8;
}

- (BOOL)isB520Route
{
  v2 = [(MRGroupSessionInfo *)self->_groupSessionInfo hostInfo];
  BOOL v3 = [v2 routeType] == 9;

  return v3;
}

- (BOOL)isPicked
{
  return 1;
}

- (BOOL)isPickable
{
  return 1;
}

- (BOOL)isPhoneRoute
{
  return 0;
}

- (MRGroupSessionInfo)groupSessionInfo
{
  return self->_groupSessionInfo;
}

- (void)setGroupSessionInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end