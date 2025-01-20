@interface ATXModeFaceLayoutRectangularAndTwoCircular
- (BOOL)assignComplicationsFromCandidates:(id)a3 forSuggestedFace:(id)a4;
@end

@implementation ATXModeFaceLayoutRectangularAndTwoCircular

- (BOOL)assignComplicationsFromCandidates:(id)a3 forSuggestedFace:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_msgSend(v6, "_pas_filteredArrayWithTest:", &__block_literal_global_192);
  v8 = objc_msgSend(v6, "_pas_filteredArrayWithTest:", &__block_literal_global_6_0);

  if ([v7 count])
  {
    v9 = objc_opt_new();
    v10 = [v7 firstObject];
    [v9 addObject:v10];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __97__ATXModeFaceLayoutRectangularAndTwoCircular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke_3;
    v18[3] = &unk_1E68AE538;
    id v19 = v7;
    v11 = objc_msgSend(v8, "_pas_filteredArrayWithTest:", v18);

    unint64_t v12 = [v11 count];
    BOOL v13 = v12 > 1;
    if (v12 >= 2)
    {
      unint64_t v14 = [v11 count];
      if (v14 >= 2) {
        uint64_t v15 = 2;
      }
      else {
        uint64_t v15 = v14;
      }
      v16 = objc_msgSend(v11, "subarrayWithRange:", 0, v15);
      [v9 addObjectsFromArray:v16];
      [v5 setLayoutType:3];
      [v5 setComplications:v9];
    }
  }
  else
  {
    BOOL v13 = 0;
    v11 = v8;
  }

  return v13;
}

BOOL __97__ATXModeFaceLayoutRectangularAndTwoCircular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke(uint64_t a1, void *a2)
{
  return [a2 widgetFamily] == 11;
}

BOOL __97__ATXModeFaceLayoutRectangularAndTwoCircular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 widgetFamily] == 10;
}

uint64_t __97__ATXModeFaceLayoutRectangularAndTwoCircular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F4AF50];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 extensionBundleIdentifier];
  v7 = [v4 kind];
  v8 = [v4 containerBundleIdentifier];
  v9 = [v4 intent];

  v10 = (void *)[v5 initWithExtensionBundleIdentifier:v6 kind:v7 containerBundleIdentifier:v8 widgetFamily:11 intent:v9 source:4];
  v11 = [*(id *)(a1 + 32) firstObject];
  LODWORD(v4) = [v10 isEqual:v11];

  return v4 ^ 1;
}

@end