@interface SHLCloudTaskScheduler
- (SHLCloudContainerTransformer)containerTransformer;
- (SHLCloudLibraryCache)cache;
- (SHLCloudModifyZoneTransformer)zoneTransformer;
- (SHLCloudTaskScheduler)initWithConfiguration:(id)a3;
- (SHLSyncSessionConfiguration)configuration;
- (void)setCache:(id)a3;
- (void)setContainerTransformer:(id)a3;
- (void)setZoneTransformer:(id)a3;
@end

@implementation SHLCloudTaskScheduler

- (SHLCloudTaskScheduler)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHLCloudTaskScheduler;
  v6 = [(SHLCloudTaskScheduler *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = -[SHLCloudContainerTransformer initWithScope:]([SHLCloudContainerTransformer alloc], "initWithScope:", [v5 sessionScope]);
    containerTransformer = v7->_containerTransformer;
    v7->_containerTransformer = v8;
  }
  return v7;
}

- (SHLCloudModifyZoneTransformer)zoneTransformer
{
  zoneTransformer = self->_zoneTransformer;
  if (!zoneTransformer)
  {
    v4 = [SHLCloudModifyZoneTransformer alloc];
    id v5 = [(SHLCloudTaskScheduler *)self configuration];
    v6 = [(SHLCloudModifyZoneTransformer *)v4 initWithConfiguration:v5];
    v7 = self->_zoneTransformer;
    self->_zoneTransformer = v6;

    zoneTransformer = self->_zoneTransformer;
  }

  return zoneTransformer;
}

- (void)setZoneTransformer:(id)a3
{
}

- (SHLCloudLibraryCache)cache
{
  cache = self->_cache;
  if (!cache)
  {
    v4 = [(SHLCloudTaskScheduler *)self containerTransformer];
    id v5 = [v4 cloudBackedContainer];

    v6 = [SHLCloudLibraryCache alloc];
    v7 = [(SHLCloudTaskScheduler *)self configuration];
    v8 = [v7 callingProcessIdentifier];
    v9 = [v5 container];
    v10 = [v9 containerIdentifier];
    objc_super v11 = [(SHLCloudTaskScheduler *)self configuration];
    v12 = [v11 sessionIdentifier];
    v13 = [(SHLCloudLibraryCache *)v6 initWithCallingProcessIdentifier:v8 containerIdentifier:v10 transactionIdentifier:v12];
    v14 = self->_cache;
    self->_cache = v13;

    cache = self->_cache;
  }

  return cache;
}

- (void)setCache:(id)a3
{
}

- (SHLSyncSessionConfiguration)configuration
{
  return self->_configuration;
}

- (SHLCloudContainerTransformer)containerTransformer
{
  return self->_containerTransformer;
}

- (void)setContainerTransformer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerTransformer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_zoneTransformer, 0);
}

@end