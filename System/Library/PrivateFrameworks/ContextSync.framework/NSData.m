@interface NSData
- (id)bmdsl_deserialize;
- (void)bmdsl_deserialize;
@end

@implementation NSData

- (id)bmdsl_deserialize
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x263F08928];
    v3 = [MEMORY[0x263F29E00] allowed];
    id v13 = 0;
    id v1 = [v2 unarchivedObjectOfClasses:v3 fromData:v1 error:&v13];
    id v4 = v13;

    if (!v1)
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(NSData *)(uint64_t)v4 bmdsl_deserialize];
      }
    }
  }
  return v1;
}

- (void)bmdsl_deserialize
{
}

@end