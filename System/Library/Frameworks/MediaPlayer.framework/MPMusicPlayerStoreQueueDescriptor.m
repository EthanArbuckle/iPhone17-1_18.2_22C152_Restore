@interface MPMusicPlayerStoreQueueDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (MPMusicPlayerStoreQueueDescriptor)initWithCoder:(id)a3;
- (MPMusicPlayerStoreQueueDescriptor)initWithStoreIDs:(NSArray *)storeIDs;
- (NSArray)storeIDs;
- (NSDictionary)assetStoreFronts;
- (NSString)startItemID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetStoreFronts:(id)a3;
- (void)setEndTime:(NSTimeInterval)endTime forItemWithStoreID:(NSString *)storeID;
- (void)setStartItemID:(NSString *)startItemID;
- (void)setStartTime:(NSTimeInterval)startTime forItemWithStoreID:(NSString *)storeID;
- (void)setStoreIDs:(NSArray *)storeIDs;
@end

@implementation MPMusicPlayerStoreQueueDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetStoreFronts, 0);
  objc_storeStrong((id *)&self->_startItemID, 0);
  objc_storeStrong((id *)&self->_storeFronts, 0);

  objc_storeStrong((id *)&self->_storeIDs, 0);
}

- (void)setAssetStoreFronts:(id)a3
{
}

- (NSDictionary)assetStoreFronts
{
  return self->_assetStoreFronts;
}

- (void)setStartItemID:(NSString *)startItemID
{
}

- (NSString)startItemID
{
  return self->_startItemID;
}

- (void)setStoreIDs:(NSArray *)storeIDs
{
}

- (BOOL)isEmpty
{
  return [(NSArray *)self->_storeIDs count] == 0;
}

- (NSArray)storeIDs
{
  v2 = (void *)[(NSArray *)self->_storeIDs copy];

  return (NSArray *)v2;
}

- (void)setEndTime:(NSTimeInterval)endTime forItemWithStoreID:(NSString *)storeID
{
  uint64_t v6 = [(NSString *)storeID longLongValue];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = [MPIdentifierSet alloc];
    v9 = +[MPModelSongKind identityKind];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__MPMusicPlayerStoreQueueDescriptor_setEndTime_forItemWithStoreID___block_invoke;
    v12[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
    v12[4] = v7;
    v10 = [(MPIdentifierSet *)v8 initWithSource:@"MPMusicPlayerQueueDescriptor" modelKind:v9 block:v12];
    v11.receiver = self;
    v11.super_class = (Class)MPMusicPlayerStoreQueueDescriptor;
    [(MPMusicPlayerQueueDescriptor *)&v11 _setEndTime:v10 forIdentifiers:endTime];
  }
}

uint64_t __67__MPMusicPlayerStoreQueueDescriptor_setEndTime_forItemWithStoreID___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__MPMusicPlayerStoreQueueDescriptor_setEndTime_forItemWithStoreID___block_invoke_2;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v3[4] = *(void *)(a1 + 32);
  return [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

void __67__MPMusicPlayerStoreQueueDescriptor_setEndTime_forItemWithStoreID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAdamID:v3];
  [v4 setSubscriptionAdamID:*(void *)(a1 + 32)];
}

- (void)setStartTime:(NSTimeInterval)startTime forItemWithStoreID:(NSString *)storeID
{
  uint64_t v6 = [(NSString *)storeID longLongValue];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = [MPIdentifierSet alloc];
    v9 = +[MPModelSongKind identityKind];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__MPMusicPlayerStoreQueueDescriptor_setStartTime_forItemWithStoreID___block_invoke;
    v12[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
    v12[4] = v7;
    v10 = [(MPIdentifierSet *)v8 initWithSource:@"MPMusicPlayerQueueDescriptor" modelKind:v9 block:v12];
    v11.receiver = self;
    v11.super_class = (Class)MPMusicPlayerStoreQueueDescriptor;
    [(MPMusicPlayerQueueDescriptor *)&v11 _setStartTime:v10 forIdentifiers:startTime];
  }
}

uint64_t __69__MPMusicPlayerStoreQueueDescriptor_setStartTime_forItemWithStoreID___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__MPMusicPlayerStoreQueueDescriptor_setStartTime_forItemWithStoreID___block_invoke_2;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v3[4] = *(void *)(a1 + 32);
  return [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

void __69__MPMusicPlayerStoreQueueDescriptor_setStartTime_forItemWithStoreID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAdamID:v3];
  [v4 setSubscriptionAdamID:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MPMusicPlayerStoreQueueDescriptor;
  id v4 = [(MPMusicPlayerQueueDescriptor *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSMutableDictionary *)self->_storeFronts mutableCopy];
  uint64_t v6 = (void *)v4[12];
  v4[12] = v5;

  uint64_t v7 = [(NSArray *)self->_storeIDs copy];
  v8 = (void *)v4[11];
  v4[11] = v7;

  uint64_t v9 = [(NSString *)self->_startItemID copy];
  v10 = (void *)v4[13];
  v4[13] = v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPMusicPlayerStoreQueueDescriptor;
  id v4 = a3;
  [(MPMusicPlayerQueueDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_storeIDs, @"MPMusicPlayerStoreQueueDescriptorStoreIDs", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_startItemID forKey:@"MPMusicPlayerStoreQueueDescriptorStartItemID"];
  [v4 encodeObject:self->_storeFronts forKey:@"MPMusicPlayerStoreQueueDescriptorStoreFronts"];
}

- (MPMusicPlayerStoreQueueDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPMusicPlayerStoreQueueDescriptor;
  objc_super v5 = [(MPMusicPlayerQueueDescriptor *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MPMusicPlayerStoreQueueDescriptorStoreIDs"];
    storeIDs = v5->_storeIDs;
    v5->_storeIDs = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPMusicPlayerStoreQueueDescriptorStartItemID"];
    startItemID = v5->_startItemID;
    v5->_startItemID = (NSString *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"MPMusicPlayerStoreQueueDescriptorStoreFronts"];
    storeFronts = v5->_storeFronts;
    v5->_storeFronts = (NSMutableDictionary *)v16;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MPMusicPlayerStoreQueueDescriptor;
  if ([(MPMusicPlayerQueueDescriptor *)&v20 isEqual:v4])
  {
    objc_super v5 = v4;
    uint64_t v6 = (NSArray *)v5[11];
    uint64_t v7 = self->_storeIDs;
    v8 = v7;
    if (v7 == v6) {
      char v9 = 1;
    }
    else {
      char v9 = [(NSArray *)v7 isEqual:v6];
    }

    uint64_t v11 = (NSString *)v5[13];
    objc_super v12 = self->_startItemID;
    v13 = v12;
    if (v12 == v11) {
      char v14 = 1;
    }
    else {
      char v14 = [(NSString *)v12 isEqual:v11];
    }

    v15 = (NSMutableDictionary *)v5[12];
    uint64_t v16 = self->_storeFronts;
    v17 = v16;
    if (v16 == v15) {
      char v18 = 1;
    }
    else {
      char v18 = [(NSMutableDictionary *)v16 isEqual:v15];
    }

    char v10 = v9 & v14 & v18;
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (MPMusicPlayerStoreQueueDescriptor)initWithStoreIDs:(NSArray *)storeIDs
{
  id v4 = storeIDs;
  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerStoreQueueDescriptor;
  objc_super v5 = [(MPMusicPlayerQueueDescriptor *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [(NSArray *)v4 copy];
    uint64_t v7 = v5->_storeIDs;
    v5->_storeIDs = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end