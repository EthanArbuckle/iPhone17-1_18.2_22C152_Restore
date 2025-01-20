@interface GEOVectorTileAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)enumerateVisibleBuildingsUsingBlock:(id)a3;
- (void)enumerateVisibleRoadsUsingBlock:(id)a3;
@end

@implementation GEOVectorTileAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GEOVectorTile";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)enumerateVisibleBuildingsUsingBlock:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  if (v3)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2020000000;
    uint64_t v10 = 0;
    AXPerformSafeBlock();
    v4 = (void *)v12[5];
    if (v4)
    {
      unint64_t v5 = 0;
      do
      {
        if (v5 >= v8[3]) {
          break;
        }
        v6 = [v4 objectAtIndexedSubscript:v5];
        if (v6) {
          v3[2](v3, v6);
        }

        ++v5;
        v4 = (void *)v12[5];
      }
      while (v4);
    }
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v11, 8);
  }
}

uint64_t __66__GEOVectorTileAccessibility_enumerateVisibleBuildingsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) buildingFootprints];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t result = [*(id *)(a1 + 32) buildingFootprintsCount];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)enumerateVisibleRoadsUsingBlock:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    AXPerformSafeBlock();
  }
}

void __62__GEOVectorTileAccessibility_enumerateVisibleRoadsUsingBlock___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __62__GEOVectorTileAccessibility_enumerateVisibleRoadsUsingBlock___block_invoke_2;
  v2[3] = &unk_265123808;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 forEachRoad:v2];
}

uint64_t __62__GEOVectorTileAccessibility_enumerateVisibleRoadsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end