@interface NSUUID(MSPAdditions)
+ (id)_maps_UUIDWithUUIDString:()MSPAdditions;
+ (id)_maps_zeroUUID;
- (uint64_t)_maps_compare:()MSPAdditions;
@end

@implementation NSUUID(MSPAdditions)

+ (id)_maps_zeroUUID
{
  if (qword_1EB7F4490 != -1) {
    dispatch_once(&qword_1EB7F4490, &__block_literal_global_0);
  }
  v0 = (void *)_MergedGlobals_35;

  return v0;
}

+ (id)_maps_UUIDWithUUIDString:()MSPAdditions
{
  v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithUUIDString:v4];

  v6 = objc_msgSend((id)objc_opt_class(), "_maps_zeroUUID");
  LOBYTE(v4) = [v5 isEqual:v6];

  if (v4) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (uint64_t)_maps_compare:()MSPAdditions
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(void *)uu1 = 0;
  uint64_t v10 = 0;
  *(void *)uu2 = 0;
  uint64_t v8 = 0;
  id v4 = a3;
  [a1 getUUIDBytes:uu1];
  [v4 getUUIDBytes:uu2];

  int v5 = uuid_compare(uu1, uu2);
  if (v5 < 0) {
    return -1;
  }
  else {
    return v5 != 0;
  }
}

@end