@interface MPQueueFeeder
+ (BOOL)usesIdentifierRegistry;
- (BOOL)identifierRegistryWithExclusiveAccessReturningBOOL:(id)a3;
- (MPQueueFeeder)init;
- (NSData)playActivityRecommendationData;
- (NSDictionary)siriWHAMetricsInfo;
- (NSString)playActivityFeatureName;
- (NSString)playActivityQueueGroupingID;
- (NSString)siriReferenceIdentifier;
- (NSString)uniqueIdentifier;
- (id)errorResolverForItem:(id)a3;
- (id)firstModelPlayEvent;
- (id)identifierRegistryWithExclusiveAccessReturningObject:(id)a3;
- (id)supplementalPlaybackContextWithReason:(int64_t)a3;
- (int64_t)identifierRegistryWithExclusiveAccessReturningInteger:(id)a3;
- (int64_t)supplementalPlaybackContextBehavior;
- (void)getRepresentativeMetadataForPlaybackContext:(id)a3 properties:(id)a4 completion:(id)a5;
- (void)identifierRegistryWithExclusiveAccess:(id)a3;
- (void)replaceIdentifierRegistry:(id)a3;
- (void)setPlayActivityFeatureName:(id)a3;
- (void)setPlayActivityQueueGroupingID:(id)a3;
- (void)setPlayActivityRecommendationData:(id)a3;
- (void)setSiriReferenceIdentifier:(id)a3;
- (void)setSiriWHAMetricsInfo:(id)a3;
@end

@implementation MPQueueFeeder

- (NSString)playActivityFeatureName
{
  return self->_playActivityFeatureName;
}

- (void)setSiriWHAMetricsInfo:(id)a3
{
}

- (void)setSiriReferenceIdentifier:(id)a3
{
}

- (void)setPlayActivityRecommendationData:(id)a3
{
}

- (void)setPlayActivityQueueGroupingID:(id)a3
{
}

- (void)setPlayActivityFeatureName:(id)a3
{
}

- (void)identifierRegistryWithExclusiveAccess:(id)a3
{
  v5 = (void (**)(id, MPQueueFeederIdentifierRegistry *))a3;
  if (([(id)objc_opt_class() usesIdentifierRegistry] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MPQueueFeeder.m" lineNumber:51 description:@"Invalid attempt to use identifierRegistry"];
  }
  os_unfair_lock_lock(&self->_identifierRegistryLock);
  v5[2](v5, self->_identifierRegistry);

  os_unfair_lock_unlock(&self->_identifierRegistryLock);
}

- (void)replaceIdentifierRegistry:(id)a3
{
  v5 = (MPQueueFeederIdentifierRegistry *)a3;
  if (([(id)objc_opt_class() usesIdentifierRegistry] & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MPQueueFeeder.m" lineNumber:44 description:@"Invalid attempt to use identifierRegistry"];
  }
  os_unfair_lock_lock(&self->_identifierRegistryLock);
  identifierRegistry = self->_identifierRegistry;
  self->_identifierRegistry = v5;

  os_unfair_lock_unlock(&self->_identifierRegistryLock);
}

- (MPQueueFeeder)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPQueueFeeder;
  v2 = [(MPQueueFeeder *)&v6 init];
  if (v2 && [(id)objc_opt_class() usesIdentifierRegistry])
  {
    v3 = objc_alloc_init(MPQueueFeederIdentifierRegistry);
    identifierRegistry = v2->_identifierRegistry;
    v2->_identifierRegistry = v3;

    v2->_identifierRegistryLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)identifierRegistryWithExclusiveAccessReturningObject:(id)a3
{
  v5 = (void (**)(id, MPQueueFeederIdentifierRegistry *))a3;
  if (([(id)objc_opt_class() usesIdentifierRegistry] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MPQueueFeeder.m" lineNumber:58 description:@"Invalid attempt to use identifierRegistry"];
  }
  p_identifierRegistryLock = &self->_identifierRegistryLock;
  os_unfair_lock_lock(&self->_identifierRegistryLock);
  v7 = v5[2](v5, self->_identifierRegistry);

  os_unfair_lock_unlock(p_identifierRegistryLock);

  return v7;
}

- (int64_t)identifierRegistryWithExclusiveAccessReturningInteger:(id)a3
{
  v5 = (uint64_t (**)(id, MPQueueFeederIdentifierRegistry *))a3;
  if (([(id)objc_opt_class() usesIdentifierRegistry] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MPQueueFeeder.m" lineNumber:74 description:@"Invalid attempt to use identifierRegistry"];
  }
  p_identifierRegistryLock = &self->_identifierRegistryLock;
  os_unfair_lock_lock(&self->_identifierRegistryLock);
  int64_t v7 = v5[2](v5, self->_identifierRegistry);

  os_unfair_lock_unlock(p_identifierRegistryLock);
  return v7;
}

+ (BOOL)usesIdentifierRegistry
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriWHAMetricsInfo, 0);
  objc_storeStrong((id *)&self->_siriReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_playActivityRecommendationData, 0);
  objc_storeStrong((id *)&self->_playActivityFeatureName, 0);
  objc_storeStrong((id *)&self->_playActivityQueueGroupingID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_identifierRegistry, 0);
}

- (NSDictionary)siriWHAMetricsInfo
{
  return self->_siriWHAMetricsInfo;
}

- (NSString)siriReferenceIdentifier
{
  return self->_siriReferenceIdentifier;
}

- (NSData)playActivityRecommendationData
{
  return self->_playActivityRecommendationData;
}

- (NSString)playActivityQueueGroupingID
{
  return self->_playActivityQueueGroupingID;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (id)firstModelPlayEvent
{
  return 0;
}

- (id)errorResolverForItem:(id)a3
{
  return 0;
}

- (void)getRepresentativeMetadataForPlaybackContext:(id)a3 properties:(id)a4 completion:(id)a5
{
  uint64_t v7 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v7 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(a2);
    [v11 handleFailureInMethod:a2, self, @"MPQueueFeeder.m", 90, @"Subclass %@ must implement -%@ defined in %@.", v9, v10, @"[MPQueueFeeder class]" object file lineNumber description];
  }
}

- (id)supplementalPlaybackContextWithReason:(int64_t)a3
{
  return 0;
}

- (int64_t)supplementalPlaybackContextBehavior
{
  return 0;
}

- (BOOL)identifierRegistryWithExclusiveAccessReturningBOOL:(id)a3
{
  v5 = (uint64_t (**)(id, MPQueueFeederIdentifierRegistry *))a3;
  if (([(id)objc_opt_class() usesIdentifierRegistry] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MPQueueFeeder.m" lineNumber:66 description:@"Invalid attempt to use identifierRegistry"];
  }
  p_identifierRegistryLock = &self->_identifierRegistryLock;
  os_unfair_lock_lock(&self->_identifierRegistryLock);
  char v7 = v5[2](v5, self->_identifierRegistry);

  os_unfair_lock_unlock(p_identifierRegistryLock);
  return v7;
}

@end