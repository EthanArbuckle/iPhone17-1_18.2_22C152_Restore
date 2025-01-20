@interface UTDeclaredTypeRecord
@end

@implementation UTDeclaredTypeRecord

void __83___UTDeclaredTypeRecord_parentTypeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 == 1)
  {
    id v5 = (id)_CSStringCopyCFString();
    if (v5 && [v5 length]) {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
}

void __50___UTDeclaredTypeRecord_conformsToTypeIdentifier___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _resolvedPropertyValueForGetter:sel_pedigree];
  if (v2)
  {
    id v4 = v2;
    v3 = [*(id *)(a1 + 40) lowercaseString];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 containsObject:v3];

    v2 = v4;
  }
}

uint64_t __50___UTDeclaredTypeRecord_conformsToTypeIdentifier___block_invoke(uint64_t a1, void **a2, uint64_t a3, int a4)
{
  unsigned int v8 = 0;
  uint64_t result = _UTGetActiveTypeForCFStringIdentifier(*a2, *(const __CFString **)(a1 + 32), &v8);
  if (result)
  {
    uint64_t result = _UTTypeConformsTo(*a2, a4, v8);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  }
  return result;
}

void __82___UTDeclaredTypeRecord_childTypeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 == 1)
  {
    id v5 = (id)_CSStringCopyCFString();
    if (v5 && [v5 length]) {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
}

uint64_t __107___UTDeclaredTypeRecord__enumerateRelatedTypeStructuresWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, char *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2, a3, a4, &v7);
  *a5 = v7;
  return result;
}

uint64_t __107___UTDeclaredTypeRecord__enumerateRelatedTypeStructuresWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, char *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2, a3, -a4, &v7);
  *a5 = v7;
  return result;
}

uint64_t __114___UTDeclaredTypeRecord__enumerateRelatedTypeUnitsOrDynamicIdsWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    uint64_t v5 = *(void *)(result + 32);
    uint64_t v6 = 0;
    uint64_t v7 = a5;
    int v8 = a3;
    char v9 = 1;
    return (*(uint64_t (**)(void))(v5 + 16))();
  }
  return result;
}

@end