@interface NSMapTable(BWInferenceVideoRequirements)
+ (id)bw_strongVideoRequirementToMapTableWithValueFunctions:()BWInferenceVideoRequirements;
+ (id)bw_strongVideoRequirementToStrongObjectsMapTable;
@end

@implementation NSMapTable(BWInferenceVideoRequirements)

+ (id)bw_strongVideoRequirementToStrongObjectsMapTable
{
  v0 = (void *)[MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:0];
  [v0 setHashFunction:satisfiedVideoRequirementHash];
  [v0 setIsEqualFunction:satisfiedVideoRequirementCheck];
  uint64_t v1 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyPointerFunctions:v0 valuePointerFunctions:v1 capacity:0];
  return v2;
}

+ (id)bw_strongVideoRequirementToMapTableWithValueFunctions:()BWInferenceVideoRequirements
{
  v4 = (void *)[MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:0];
  [v4 setHashFunction:satisfiedVideoRequirementHash];
  [v4 setIsEqualFunction:satisfiedVideoRequirementCheck];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyPointerFunctions:v4 valuePointerFunctions:a3 capacity:0];
  return v5;
}

@end