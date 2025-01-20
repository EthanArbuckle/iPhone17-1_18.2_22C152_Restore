@interface INInteraction(schema)
+ (id)fromSchemas:()schema;
- (id)toSchemas;
- (uint64_t)canConvertToSchemaOrg;
@end

@implementation INInteraction(schema)

- (id)toSchemas
{
  uint64_t v2 = [a1 intentResponse];
  if (v2
    && (v3 = (void *)v2,
        [a1 intentResponse],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 conformsToProtocol:&unk_1F2587548],
        v4,
        v3,
        v5))
  {
    v6 = [a1 intentResponse];
    v7 = [v6 toSchemas];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (uint64_t)canConvertToSchemaOrg
{
  uint64_t v2 = [a1 intentResponse];
  if (v2)
  {
    v3 = [a1 intentResponse];
    uint64_t v4 = [v3 conformsToProtocol:&unk_1F2587548];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)fromSchemas:()schema
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  int v5 = [MEMORY[0x1E4F30478] fromSchemas:v3];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v4 response:v5];
  return v6;
}

@end