@interface ATXModeFaceLandscapeLayoutThreeSmallAndTwoRectangular
- (BOOL)assignComplicationsFromCandidates:(id)a3 forSuggestedFace:(id)a4;
@end

@implementation ATXModeFaceLandscapeLayoutThreeSmallAndTwoRectangular

- (BOOL)assignComplicationsFromCandidates:(id)a3 forSuggestedFace:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_msgSend(v6, "_pas_filteredArrayWithTest:", &__block_literal_global_106);
  v8 = objc_msgSend(v6, "_pas_filteredArrayWithTest:", &__block_literal_global_6);

  v9 = objc_opt_new();
  unint64_t v10 = [v8 count];
  if (v10 >= 3) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = v10;
  }
  v12 = objc_msgSend(v8, "subarrayWithRange:", 0, v11);
  [v9 addObjectsFromArray:v12];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __108__ATXModeFaceLandscapeLayoutThreeSmallAndTwoRectangular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke_3;
  v19[3] = &unk_1E68AE538;
  id v20 = v9;
  id v13 = v9;
  v14 = objc_msgSend(v7, "_pas_filteredArrayWithTest:", v19);

  unint64_t v15 = [v14 count];
  if (v15 >= 2) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = v15;
  }
  v17 = objc_msgSend(v14, "subarrayWithRange:", 0, v16);

  [v13 addObjectsFromArray:v17];
  [v5 setLandscapeComplications:v13];

  return 1;
}

BOOL __108__ATXModeFaceLandscapeLayoutThreeSmallAndTwoRectangular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke(uint64_t a1, void *a2)
{
  return [a2 widgetFamily] == 11;
}

BOOL __108__ATXModeFaceLandscapeLayoutThreeSmallAndTwoRectangular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 widgetFamily] == 1;
}

uint64_t __108__ATXModeFaceLandscapeLayoutThreeSmallAndTwoRectangular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F4AF50];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 extensionBundleIdentifier];
  v7 = [v4 kind];
  v8 = [v4 containerBundleIdentifier];
  v9 = [v4 intent];

  unint64_t v10 = (void *)[v5 initWithExtensionBundleIdentifier:v6 kind:v7 containerBundleIdentifier:v8 widgetFamily:1 intent:v9 source:4];
  uint64_t v11 = [*(id *)(a1 + 32) containsObject:v10] ^ 1;

  return v11;
}

@end