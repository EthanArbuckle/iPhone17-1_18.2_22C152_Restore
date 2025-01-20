@interface HMDManagedObjectCodingChangeDetails
- (id)changedAttributeKeys;
- (id)changedRelationshipKeys;
- (void)addChangedRelationshipCodingKey:(uint64_t)a1;
@end

@implementation HMDManagedObjectCodingChangeDetails

- (id)changedAttributeKeys
{
  v1 = *(void **)(a1 + 8);
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = [MEMORY[0x263EFFA08] set];
  }
  return v2;
}

- (id)changedRelationshipKeys
{
  v1 = *(void **)(a1 + 16);
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = [MEMORY[0x263EFFA08] set];
  }
  return v2;
}

- (void)addChangedRelationshipCodingKey:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (v4)
    {
      [v4 addObject:v3];
    }
    else
    {
      uint64_t v5 = [MEMORY[0x263EFF9C0] setWithObject:v3];
      v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;
    }
    id v3 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedRelationshipKeys, 0);
  objc_storeStrong((id *)&self->_changedAttributeKeys, 0);
}

@end