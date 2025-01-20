@interface CPLCloudKitScopeUpdate
- (BOOL)updateScopeChange:(id)a3;
- (CPLCloudKitScope)cloudKitScope;
- (CPLCloudKitScopeUpdate)initWithCloudKitScope:(id)a3;
- (NSData)updatedTransportScope;
@end

@implementation CPLCloudKitScopeUpdate

- (CPLCloudKitScopeUpdate)initWithCloudKitScope:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLCloudKitScopeUpdate;
  v6 = [(CPLCloudKitScopeUpdate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cloudKitScope, a3);
  }

  return v7;
}

- (NSData)updatedTransportScope
{
  return [(CPLCloudKitScope *)self->_cloudKitScope transportScope];
}

- (BOOL)updateScopeChange:(id)a3
{
  return 0;
}

- (CPLCloudKitScope)cloudKitScope
{
  return self->_cloudKitScope;
}

- (void).cxx_destruct
{
}

@end