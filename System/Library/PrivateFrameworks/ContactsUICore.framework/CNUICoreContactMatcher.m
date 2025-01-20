@interface CNUICoreContactMatcher
+ (BOOL)doesContact:(id)a3 matchAnyParentOrGuardianInFamily:(id)a4;
+ (BOOL)doesNameOfContact:(id)a3 matchNameOfContact:(id)a4;
+ (BOOL)doesNameOfContact:(id)a3 matchNameOfFamilyMember:(id)a4;
+ (id)nameFromFammilyMember:(id)a3;
@end

@implementation CNUICoreContactMatcher

+ (id)nameFromFammilyMember:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFEAF0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 firstName];
  [v5 setGivenName:v6];

  v7 = [v4 lastName];

  [v5 setFamilyName:v7];
  v8 = [MEMORY[0x263EFEA20] stringFromContact:v5 style:0];

  return v8;
}

+ (BOOL)doesNameOfContact:(id)a3 matchNameOfContact:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 givenName];
  v8 = [v6 givenName];
  if (objc_msgSend(v7, "_cn_caseInsensitiveIsEqual:", v8))
  {
    v9 = [v5 familyName];
    v10 = [v6 familyName];
    char v11 = objc_msgSend(v9, "_cn_caseInsensitiveIsEqual:", v10);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)doesContact:(id)a3 matchAnyParentOrGuardianInFamily:(id)a4
{
  id v6 = a3;
  v7 = [a4 elements];
  v8 = objc_msgSend(v7, "_cn_filter:", &__block_literal_global_11);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__CNUICoreContactMatcher_doesContact_matchAnyParentOrGuardianInFamily___block_invoke_2;
  v11[3] = &unk_264017968;
  id v12 = v6;
  id v13 = a1;
  id v9 = v6;
  LOBYTE(v6) = objc_msgSend(v8, "_cn_any:", v11);

  return (char)v6;
}

uint64_t __71__CNUICoreContactMatcher_doesContact_matchAnyParentOrGuardianInFamily___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 familyMember];
  uint64_t v3 = [v2 isParent];

  return v3;
}

uint64_t __71__CNUICoreContactMatcher_doesContact_matchAnyParentOrGuardianInFamily___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v4 = [a2 familyMember];
  uint64_t v5 = [v2 doesNameOfContact:v3 matchNameOfFamilyMember:v4];

  return v5;
}

+ (BOOL)doesNameOfContact:(id)a3 matchNameOfFamilyMember:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 givenName];
  v8 = [v6 firstName];
  if (objc_msgSend(v7, "_cn_caseInsensitiveIsEqual:", v8))
  {
    id v9 = [v5 familyName];
    v10 = [v6 lastName];
    char v11 = objc_msgSend(v9, "_cn_caseInsensitiveIsEqual:", v10);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

@end