@interface SARDNativeFlowContextUpdate(ContextSnapshot)
- (id)initWithSerializedBackingStore:()ContextSnapshot;
- (uint64_t)serializedBackingStore;
@end

@implementation SARDNativeFlowContextUpdate(ContextSnapshot)

- (id)initWithSerializedBackingStore:()ContextSnapshot
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];
    v6 = [v5 dictionary];
    a1 = (id)[a1 initWithDictionary:v6];

    id v7 = a1;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (uint64_t)serializedBackingStore
{
  return [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:0];
}

@end