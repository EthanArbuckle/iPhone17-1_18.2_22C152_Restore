@interface HKBaseDimension
@end

@implementation HKBaseDimension

void __33___HKBaseDimension_nullDimension__block_invoke(uint64_t a1, void *a2)
{
  v4 = a2;
  v2 = +[HKUnit countUnit];
  [v4 setReducibleBaseUnit:v2];

  v3 = +[HKUnit _nullUnit];
  [v4 setReducedUnit:v3];

  v4[6] = 0x3FF0000000000000;
}

uint64_t __60___HKBaseDimension__uniquedDimensionWithName_configuration___block_invoke()
{
  _uniquedDimensionWithName_configuration____dimensionsByName = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

void __53___HKBaseDimension__uniquedDefinedDimensionWithName___block_invoke(uint64_t a1, void *a2)
{
  v12 = a2;
  v3 = (const char *)[*(id *)(a1 + 32) UTF8String];
  uint64_t v4 = 0;
  while (strcmp((&__DimensionDefinitions)[v4], v3))
  {
    v4 += 4;
    if (v4 == 84) {
      goto LABEL_7;
    }
  }
  v5 = &(&__DimensionDefinitions)[v4];
  if ((&__DimensionDefinitions)[v4 + 1])
  {
    v6 = v5[3];
    v7 = v5[2];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:");
    v9 = [NSString stringWithUTF8String:v7];
    v10 = +[HKBaseUnit unitFromString:v8];
    [v12 setReducibleBaseUnit:v10];

    v11 = +[HKUnit unitFromString:v9];
    [v12 setReducedUnit:v11];

    v12[6] = v6;
  }
LABEL_7:
}

@end