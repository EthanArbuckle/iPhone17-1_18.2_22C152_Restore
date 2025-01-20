@interface LTDisambiguableResult
@end

@implementation LTDisambiguableResult

void __61___LTDisambiguableResult_initWithSentences_joinedWithString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (void *)[a2 copy];
  id v6 = v5;
  id v7 = v5;
  if (a3)
  {
    [v5 _insertPrefix:*(void *)(a1 + 32)];
    id v6 = v7;
  }
  [*(id *)(a1 + 40) addObject:v6];
}

void __58___LTDisambiguableResult_combineResults_joinedWithString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (void *)[a2 copy];
  id v8 = v5;
  if (a3)
  {
    [v5 _insertPrefix:*(void *)(a1 + 32)];
    v5 = v8;
  }
  id v6 = *(void **)(a1 + 40);
  id v7 = [v5 sentences];
  [v6 addObjectsFromArray:v7];
}

uint64_t __93___LTDisambiguableResult_combinedDisambiguableResultFromTranslationResults_joinedWithString___block_invoke(uint64_t a1, void *a2)
{
  return [a2 disambiguableResult];
}

uint64_t __43___LTDisambiguableResult_sentenceWithUUID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 UUID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __38___LTDisambiguableResult_romanization__block_invoke(uint64_t a1, void *a2)
{
  return [a2 romanization];
}

uint64_t __44___LTDisambiguableResult_hasDisambiguations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasDisambiguations];
}

uint64_t __51___LTDisambiguableResult_hasDisambiguationsOfType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasDisambiguationsOfType:*(void *)(a1 + 32)];
}

uint64_t __55___LTDisambiguableResult_isGenderDisambiguationEnabled__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  isGenderDisambiguationEnabled_isGenderDisambiguationEnabled = result;
  return result;
}

@end