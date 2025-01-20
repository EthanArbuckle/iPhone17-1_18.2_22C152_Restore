@interface ATXModeFaceLayoutTwoRectangular
- (BOOL)assignComplicationsFromCandidates:(id)a3 forSuggestedFace:(id)a4;
@end

@implementation ATXModeFaceLayoutTwoRectangular

- (BOOL)assignComplicationsFromCandidates:(id)a3 forSuggestedFace:(id)a4
{
  id v5 = a4;
  v6 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_141);
  unint64_t v7 = [v6 count];
  if (v7 >= 2)
  {
    [v5 setLayoutType:1];
    unint64_t v8 = [v6 count];
    if (v8 >= 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8;
    }
    v10 = objc_msgSend(v6, "subarrayWithRange:", 0, v9);
    [v5 setComplications:v10];
  }
  return v7 > 1;
}

BOOL __86__ATXModeFaceLayoutTwoRectangular_assignComplicationsFromCandidates_forSuggestedFace___block_invoke(uint64_t a1, void *a2)
{
  return [a2 widgetFamily] == 11;
}

@end