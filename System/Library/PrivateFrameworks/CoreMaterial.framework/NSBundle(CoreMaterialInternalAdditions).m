@interface NSBundle(CoreMaterialInternalAdditions)
+ (uint64_t)coreMaterialRecipeBundle;
- (uint64_t)URLForMaterialRecipe:()CoreMaterialInternalAdditions;
- (uint64_t)URLForMaterialRecipeDescendant:()CoreMaterialInternalAdditions;
- (uint64_t)URLForVisualStyleSet:()CoreMaterialInternalAdditions;
- (uint64_t)URLForVisualStyleSetDescendant:()CoreMaterialInternalAdditions;
- (uint64_t)URLsForMaterialRecipeDescendants;
- (uint64_t)URLsForMaterialRecipes;
- (uint64_t)URLsForVisualStyleSets;
@end

@implementation NSBundle(CoreMaterialInternalAdditions)

+ (uint64_t)coreMaterialRecipeBundle
{
  return [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreMaterial"];
}

- (uint64_t)URLForVisualStyleSetDescendant:()CoreMaterialInternalAdditions
{
  return [a1 URLForResource:a3 withExtension:@"descendantstyleset"];
}

- (uint64_t)URLForMaterialRecipeDescendant:()CoreMaterialInternalAdditions
{
  return [a1 URLForResource:a3 withExtension:@"descendantrecipe"];
}

- (uint64_t)URLForMaterialRecipe:()CoreMaterialInternalAdditions
{
  return [a1 URLForResource:a3 withExtension:@"materialrecipe"];
}

- (uint64_t)URLForVisualStyleSet:()CoreMaterialInternalAdditions
{
  return [a1 URLForResource:a3 withExtension:@"visualstyleset"];
}

- (uint64_t)URLsForMaterialRecipes
{
  return [a1 URLsForResourcesWithExtension:@"materialrecipe" subdirectory:0];
}

- (uint64_t)URLsForMaterialRecipeDescendants
{
  return [a1 URLsForResourcesWithExtension:@"descendantrecipe" subdirectory:0];
}

- (uint64_t)URLsForVisualStyleSets
{
  return [a1 URLsForResourcesWithExtension:@"visualstyleset" subdirectory:0];
}

@end