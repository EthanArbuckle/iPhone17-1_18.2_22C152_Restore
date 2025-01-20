@interface DSSubSource
- (DSSource)parentSource;
- (NSString)resourceName;
- (id)init:(id)a3 withResourceName:(id)a4;
- (void)fetchSharedResourcesWithCompletion:(id)a3;
- (void)setParentSource:(id)a3;
- (void)setResourceName:(id)a3;
- (void)stopAllSharingWithCompletion:(id)a3;
- (void)stopSharing:(id)a3 withCompletion:(id)a4;
- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4;
@end

@implementation DSSubSource

- (id)init:(id)a3 withResourceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)DSSubSource;
  v8 = [(DSSubSource *)&v10 init];
  if (v8 == self)
  {
    [(DSSubSource *)self setParentSource:v6];
    [(DSSubSource *)self setResourceName:v7];
  }

  return v8;
}

- (void)fetchSharedResourcesWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(DSSubSource *)self parentSource];
  v5 = [(DSSubSource *)self resourceName];
  [v6 fetchSharedResourcesWithName:v5 completion:v4];
}

- (void)stopAllSharingWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(DSSubSource *)self parentSource];
  v5 = [(DSSubSource *)self resourceName];
  [v6 stopSharingResourcesWithName:v5 completion:v4];
}

- (void)stopSharing:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DSSubSource *)self parentSource];
  [v8 stopSharing:v7 withCompletion:v6];
}

- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(DSSubSource *)self parentSource];
  id v8 = [(DSSubSource *)self resourceName];
  [v9 stopSharingWithParticipant:v7 forResourceName:v8 withCompletion:v6];
}

- (DSSource)parentSource
{
  return self->_parentSource;
}

- (void)setParentSource:(id)a3
{
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (void)setResourceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_storeStrong((id *)&self->_parentSource, 0);
}

@end