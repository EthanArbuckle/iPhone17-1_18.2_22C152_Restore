@interface GEOResumeRouteHandle
+ (BOOL)supportsSecureCoding;
+ (id)resumeRouteHandleStorageFromResumeRouteHandle:(id)a3;
- (BOOL)hasVisitedFirstStop;
- (GEOOriginalWaypointRoute)routeGeometry;
- (GEOResumeRouteHandle)initWithCoder:(id)a3;
- (GEOResumeRouteHandle)initWithGEOStorageResumeRouteHandle:(id)a3;
- (NSData)serverSessionState;
- (id)debugDescription;
- (id)description;
- (id)resumeRouteHandleStorage;
- (void)encodeWithCoder:(id)a3;
- (void)setHasVisitedFirstStop:(BOOL)a3;
- (void)setRouteGeometry:(id)a3;
- (void)setServerSessionState:(id)a3;
@end

@implementation GEOResumeRouteHandle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOResumeRouteHandle)initWithGEOStorageResumeRouteHandle:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOResumeRouteHandle;
  v5 = [(GEOResumeRouteHandle *)&v14 init];
  if (v5)
  {
    v6 = [v4 routeGeometry];
    uint64_t v7 = [v6 copy];
    routeGeometry = v5->_routeGeometry;
    v5->_routeGeometry = (GEOOriginalWaypointRoute *)v7;

    v9 = [v4 serverSessionState];
    uint64_t v10 = [v9 copy];
    serverSessionState = v5->_serverSessionState;
    v5->_serverSessionState = (NSData *)v10;

    v5->_hasVisitedFirstStop = [v4 hasVisitedFirstStop];
    v12 = v5;
  }

  return v5;
}

- (id)resumeRouteHandleStorage
{
  v3 = objc_opt_new();
  id v4 = (void *)[(GEOOriginalWaypointRoute *)self->_routeGeometry copy];
  [v3 setRouteGeometry:v4];

  v5 = (void *)[(NSData *)self->_serverSessionState copy];
  [v3 setServerSessionState:v5];

  [v3 setHasVisitedFirstStop:self->_hasVisitedFirstStop];

  return v3;
}

- (GEOResumeRouteHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOResumeRouteHandle;
  v5 = [(GEOResumeRouteHandle *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeGeometry"];
    routeGeometry = v5->_routeGeometry;
    v5->_routeGeometry = (GEOOriginalWaypointRoute *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serverSessionState"];
    serverSessionState = v5->_serverSessionState;
    v5->_serverSessionState = (NSData *)v8;

    v5->_hasVisitedFirstStop = [v4 decodeBoolForKey:@"_hasVisitedFirstStop"];
    uint64_t v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  routeGeometry = self->_routeGeometry;
  id v5 = a3;
  [v5 encodeObject:routeGeometry forKey:@"_routeGeometry"];
  [v5 encodeObject:self->_serverSessionState forKey:@"_serverSessionState"];
  [v5 encodeBool:self->_hasVisitedFirstStop forKey:@"_hasVisitedFirstStop"];
}

- (id)description
{
  serverSessionState = self->_serverSessionState;
  if (serverSessionState)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Session state: %d bytes", -[NSData length](serverSessionState, "length"));
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"Session state: (null)";
  }
  id v5 = NSString;
  uint64_t v6 = [(GEOOriginalWaypointRoute *)self->_routeGeometry routeLegs];
  uint64_t v7 = [v5 stringWithFormat:@"%@, route legs: %d, has visited first stop: %d", v4, objc_msgSend(v6, "count"), self->_hasVisitedFirstStop];

  return v7;
}

- (id)debugDescription
{
  serverSessionState = self->_serverSessionState;
  if (serverSessionState)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Session state: %d bytes", -[NSData length](serverSessionState, "length"));
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"Session state: (null)";
  }
  id v5 = NSString;
  BOOL hasVisitedFirstStop = self->_hasVisitedFirstStop;
  uint64_t v7 = [(GEOOriginalWaypointRoute *)self->_routeGeometry formattedText];
  uint64_t v8 = [v5 stringWithFormat:@"%@ | has visited first stop: %d | %@", v4, hasVisitedFirstStop, v7];

  return v8;
}

+ (id)resumeRouteHandleStorageFromResumeRouteHandle:(id)a3
{
  return (id)[a3 resumeRouteHandleStorage];
}

- (GEOOriginalWaypointRoute)routeGeometry
{
  return self->_routeGeometry;
}

- (void)setRouteGeometry:(id)a3
{
}

- (NSData)serverSessionState
{
  return self->_serverSessionState;
}

- (void)setServerSessionState:(id)a3
{
}

- (BOOL)hasVisitedFirstStop
{
  return self->_hasVisitedFirstStop;
}

- (void)setHasVisitedFirstStop:(BOOL)a3
{
  self->_BOOL hasVisitedFirstStop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSessionState, 0);

  objc_storeStrong((id *)&self->_routeGeometry, 0);
}

@end