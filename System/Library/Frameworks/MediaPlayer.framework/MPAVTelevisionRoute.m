@interface MPAVTelevisionRoute
- (MPAVTelevisionRoute)initWithTelevision:(void *)a3;
- (id)connection;
- (id)routeUID;
- (int64_t)routeSubtype;
- (int64_t)routeType;
- (void)dealloc;
- (void)television;
@end

@implementation MPAVTelevisionRoute

- (void).cxx_destruct
{
}

- (void)television
{
  return self->_television;
}

- (int64_t)routeSubtype
{
  return 1;
}

- (int64_t)routeType
{
  return 3;
}

- (id)routeUID
{
  v2 = (void *)MRExternalDeviceCopyUniqueIdentifier();

  return v2;
}

- (id)connection
{
  return self->_connection;
}

- (void)dealloc
{
  CFRetain(self->_television);
  v3.receiver = self;
  v3.super_class = (Class)MPAVTelevisionRoute;
  [(MPAVTelevisionRoute *)&v3 dealloc];
}

- (MPAVTelevisionRoute)initWithTelevision:(void *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MPAVTelevisionRoute;
  v5 = [(MPAVTelevisionRoute *)&v14 init];
  if (v5)
  {
    if (!a3)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, v5, @"MPAVTelevisionRoute.m", 24, @"Invalid parameter not satisfying: %@", @"television" object file lineNumber description];
    }
    v5->_television = (void *)CFRetain(a3);
    uint64_t v6 = MRExternalDeviceCopyName();
    routeName = v5->super._routeName;
    v5->super._routeName = (NSString *)v6;

    v5->super._picked = 0;
    avRouteDescription = v5->super._avRouteDescription;
    v5->super._avRouteDescription = 0;

    wirelessDisplayRoute = v5->super._wirelessDisplayRoute;
    v5->super._wirelessDisplayRoute = 0;

    v5->super._displayRouteType = 3;
    v10 = [[MPAVRouteConnection alloc] initWithExternalDevice:v5->_television];
    connection = v5->_connection;
    v5->_connection = v10;
  }
  return v5;
}

@end