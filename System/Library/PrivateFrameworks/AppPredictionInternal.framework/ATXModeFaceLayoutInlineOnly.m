@interface ATXModeFaceLayoutInlineOnly
- (BOOL)assignComplicationsFromCandidates:(id)a3 forSuggestedFace:(id)a4;
@end

@implementation ATXModeFaceLayoutInlineOnly

- (BOOL)assignComplicationsFromCandidates:(id)a3 forSuggestedFace:(id)a4
{
  id v5 = a4;
  v6 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_16);
  uint64_t v7 = [v6 count];
  if (v7)
  {
    [v5 setLayoutType:0];
    v8 = [v6 firstObject];
    [v5 setSubtitleComplication:v8];
  }
  return v7 != 0;
}

BOOL __82__ATXModeFaceLayoutInlineOnly_assignComplicationsFromCandidates_forSuggestedFace___block_invoke(uint64_t a1, void *a2)
{
  return [a2 widgetFamily] == 12;
}

@end