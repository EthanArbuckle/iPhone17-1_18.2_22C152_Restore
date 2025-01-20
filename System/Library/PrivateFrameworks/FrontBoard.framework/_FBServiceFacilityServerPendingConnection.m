@interface _FBServiceFacilityServerPendingConnection
+ (id)pendingConnectionToFacility:(id)a3 completion:(id)a4;
- (FBSServiceFacility)facility;
- (_FBServiceFacilityServerPendingConnection)initWithFacility:(id)a3 completion:(id)a4;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setFacility:(id)a3;
@end

@implementation _FBServiceFacilityServerPendingConnection

+ (id)pendingConnectionToFacility:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_FBServiceFacilityServerPendingConnection alloc] initWithFacility:v6 completion:v5];

  return v7;
}

- (_FBServiceFacilityServerPendingConnection)initWithFacility:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_FBServiceFacilityServerPendingConnection;
  v9 = [(_FBServiceFacilityServerPendingConnection *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_facility, a3);
    uint64_t v11 = [v8 copy];
    id completion = v10->_completion;
    v10->_id completion = (id)v11;
  }
  return v10;
}

- (FBSServiceFacility)facility
{
  return self->_facility;
}

- (void)setFacility:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facility, 0);
}

@end