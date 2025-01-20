@interface BMDSL
- (id)bmdsl_serialize;
- (void)bmdsl_serialize;
@end

@implementation BMDSL

- (id)bmdsl_serialize
{
  if (a1)
  {
    id v11 = 0;
    v1 = [MEMORY[0x263F08910] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v11];
    id v2 = v11;
    if (!v1)
    {
      v3 = __biome_log_for_category();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        [(BMDSL *)(uint64_t)v2 bmdsl_serialize];
      }
    }
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (void)bmdsl_serialize
{
}

@end