@interface KMMapper_PBSUserProfile
+ (Class)externalObjectClass;
- (KMMapper_PBSUserProfile)init;
- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5;
- (int64_t)targetItemType;
@end

@implementation KMMapper_PBSUserProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeItemIdKey, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

- (int64_t)targetItemType
{
  return 20;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  return 0;
}

- (KMMapper_PBSUserProfile)init
{
  v8.receiver = self;
  v8.super_class = (Class)KMMapper_PBSUserProfile;
  v2 = [(KMMapper_PBSUserProfile *)&v8 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x263F510C0]);
    builder = v2->_builder;
    v2->_builder = v3;

    uint64_t v5 = KVAdditionalFieldTypeToNumber();
    alternativeItemIdKey = v2->_alternativeItemIdKey;
    v2->_alternativeItemIdKey = (NSNumber *)v5;
  }
  return v2;
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end