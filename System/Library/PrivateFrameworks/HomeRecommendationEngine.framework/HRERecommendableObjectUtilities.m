@interface HRERecommendableObjectUtilities
+ (BOOL)_actionMap:(id)a3 includesType:(id)a4 forRecommendableObject:(id)a5;
+ (BOOL)recommendableObject:(id)a3 containsObject:(id)a4;
+ (BOOL)recommendableObject:(id)a3 involvedInAction:(id)a4;
+ (BOOL)recommendableObject:(id)a3 involvedInActionMap:(id)a4;
+ (BOOL)recommendableObject:(id)a3 isEffectivelyEqualToObject:(id)a4;
+ (BOOL)recommendableObjects:(id)a3 matchAllRules:(id)a4;
+ (id)actionMapFromActionMap:(id)a3 forRecommendableObject:(id)a4;
+ (id)filterRecommendableObjects:(id)a3 excludingObjectsInActions:(id)a4;
+ (id)filterRecommendableObjects:(id)a3 toMatchTypes:(id)a4;
+ (id)filterRecommendableObjects:(id)a3 toRooms:(id)a4;
+ (id)recommendableObject:(id)a3 actionBuildersDerivedFromActions:(id)a4;
+ (id)recommendableObjectsFromHomeKitObjects:(id)a3;
@end

@implementation HRERecommendableObjectUtilities

+ (BOOL)recommendableObject:(id)a3 isEffectivelyEqualToObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 == v6)
  {
    char v11 = 1;
  }
  else
  {
    v7 = objc_msgSend(v5, "hf_containedServices");
    v8 = objc_msgSend(v6, "hf_containedServices");
    if ([v7 isEqualToSet:v8])
    {
      v9 = objc_msgSend(v5, "hf_containedProfiles");
      v10 = objc_msgSend(v6, "hf_containedProfiles");
      char v11 = [v9 isEqualToSet:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

+ (BOOL)recommendableObject:(id)a3 containsObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 recommendableObject:v6 isEffectivelyEqualToObject:v7])
  {
    char v8 = 0;
  }
  else
  {
    v9 = objc_msgSend(v7, "hf_containedServices");
    v10 = objc_msgSend(v6, "hf_containedServices");
    if ([v9 isSubsetOfSet:v10])
    {
      char v11 = objc_msgSend(v7, "hf_containedProfiles");
      v12 = objc_msgSend(v6, "hf_containedProfiles");
      char v8 = [v11 isSubsetOfSet:v12];
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

+ (id)recommendableObject:(id)a3 actionBuildersDerivedFromActions:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263EFFA08];
  id v13 = a3;
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v13 count:1];
  v10 = objc_msgSend(v5, "setWithArray:", v9, v13, v14);
  char v11 = +[HREDerivedActionUtilities derivedActionsForActionableObjects:v10 fromActions:v7];

  return v11;
}

+ (BOOL)recommendableObject:(id)a3 involvedInActionMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "hre_matchingTypes");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__HRERecommendableObjectUtilities_recommendableObject_involvedInActionMap___block_invoke;
  v12[3] = &unk_264CF37D0;
  id v14 = v6;
  id v15 = a1;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  LOBYTE(v7) = objc_msgSend(v8, "na_any:", v12);

  return (char)v7;
}

uint64_t __75__HRERecommendableObjectUtilities_recommendableObject_involvedInActionMap___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) _actionMap:*(void *)(a1 + 32) includesType:a2 forRecommendableObject:*(void *)(a1 + 40)];
}

+ (BOOL)_actionMap:(id)a3 includesType:(id)a4 forRecommendableObject:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  id v10 = [v7 objectForKeyedSubscript:@"HREServiceTypeAll"];
  if (objc_opt_isKindOfClass()) {
    char v11 = v10;
  }
  else {
    char v11 = 0;
  }
  id v12 = v11;

  if (!v12) {
    goto LABEL_7;
  }
  uint64_t v13 = [v12 flattenedMapEvaluatedForObject:v9];

  id v14 = objc_msgSend(v9, "hre_characteristics");
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __82__HRERecommendableObjectUtilities__actionMap_includesType_forRecommendableObject___block_invoke;
  v18[3] = &unk_264CF37F8;
  id v12 = (id)v13;
  id v19 = v12;
  LOBYTE(v13) = objc_msgSend(v14, "na_any:", v18);

  if (v13)
  {
    BOOL v15 = 1;
  }
  else
  {
LABEL_7:
    v16 = [v7 objectForKeyedSubscript:v8];
    BOOL v15 = v16 != 0;
  }
  return v15;
}

BOOL __82__HRERecommendableObjectUtilities__actionMap_includesType_forRecommendableObject___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 characteristicTypeValues];
  id v5 = [v3 characteristicType];

  id v6 = [v4 objectForKeyedSubscript:v5];
  BOOL v7 = v6 != 0;

  return v7;
}

+ (BOOL)recommendableObject:(id)a3 involvedInAction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ((objc_opt_class(),
         id v7 = (id)[v6 performSelector:sel_characteristic],
         (objc_opt_isKindOfClass() & 1) == 0)
      ? (id v8 = 0)
      : (id v8 = v7),
        id v9 = v8,
        v7,
        v9))
  {
    id v10 = objc_msgSend(v5, "hre_characteristics");
    char v11 = [v10 containsObject:v9];
  }
  else
  {
    objc_opt_class();
    id v12 = v6;
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    id v9 = v13;

    if (!v9)
    {
      char v11 = 0;
      goto LABEL_14;
    }
    id v10 = objc_msgSend(v5, "hf_containedProfiles");
    id v14 = [v9 mediaProfiles];
    char v11 = [v10 intersectsSet:v14];
  }
LABEL_14:

  return v11;
}

+ (id)actionMapFromActionMap:(id)a3 forRecommendableObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v6, "hre_matchingTypes");
  if (![v7 count])
  {

    goto LABEL_7;
  }
  uint64_t v8 = [v5 count];

  if (!v8)
  {
LABEL_7:
    id v14 = +[HREActionMap emptyMap];
    goto LABEL_8;
  }
  id v9 = objc_msgSend(v6, "hre_matchingTypes");
  id v10 = [v9 allObjects];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __81__HRERecommendableObjectUtilities_actionMapFromActionMap_forRecommendableObject___block_invoke;
  v20 = &unk_264CF3820;
  id v21 = v5;
  id v22 = v6;
  char v11 = objc_msgSend(v10, "na_map:", &v17);

  uint64_t v12 = objc_msgSend(v11, "count", v17, v18, v19, v20);
  uint64_t v13 = +[HREActionMap emptyMap];
  id v14 = v13;
  if (v12)
  {
    uint64_t v15 = [v13 mergeWithActionMaps:v11];

    id v14 = (void *)v15;
  }

LABEL_8:

  return v14;
}

id __81__HRERecommendableObjectUtilities_actionMapFromActionMap_forRecommendableObject___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  v4 = [v3 flattenedMapEvaluatedForObject:*(void *)(a1 + 40)];

  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    uint64_t v8 = [v7 characteristicTypeValues];
    if ([v8 count]) {
      id v9 = v7;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

+ (id)recommendableObjectsFromHomeKitObjects:(id)a3
{
  return (id)objc_msgSend(a3, "na_flatMap:", &__block_literal_global_133);
}

id __74__HRERecommendableObjectUtilities_recommendableObjectsFromHomeKitObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  id v4 = v2;
  if ([v4 conformsToProtocol:&unk_26EABF440]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  objc_msgSend(v3, "na_safeAddObject:", v6);
  objc_opt_class();
  id v7 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  objc_opt_class();
  id v10 = v7;
  if (objc_opt_isKindOfClass()) {
    char v11 = v10;
  }
  else {
    char v11 = 0;
  }
  id v12 = v11;

  if (v12 && (objc_msgSend(v12, "hf_isMatterOnlyAccessory") & 1) == 0)
  {
    [v3 removeObject:v12];
    if (objc_msgSend(v12, "hf_isBridge")) {
      goto LABEL_26;
    }
    id v18 = [v12 _containedRecommendableObjects];
    [v3 unionSet:v18];
    goto LABEL_25;
  }
  if (!v9)
  {
    if (objc_opt_respondsToSelector())
    {
      objc_opt_class();
      id v13 = (id)[v10 performSelector:sel_services];
      if (objc_opt_isKindOfClass()) {
        id v14 = v13;
      }
      else {
        id v14 = 0;
      }
      id v15 = v14;

      objc_msgSend(v3, "na_safeAddObjectsFromArray:", v15);
    }
    if (objc_opt_respondsToSelector())
    {
      objc_opt_class();
      id v16 = (id)[v10 performSelector:sel_profiles];
      if (objc_opt_isKindOfClass()) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = 0;
      }
      id v18 = v17;

      id v19 = objc_msgSend(v18, "na_map:", &__block_literal_global_142);
      objc_msgSend(v3, "na_safeAddObjectsFromArray:", v19);

LABEL_25:
    }
  }
LABEL_26:

  return v3;
}

id __74__HRERecommendableObjectUtilities_recommendableObjectsFromHomeKitObjects___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26EABF440]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)recommendableObjects:(id)a3 matchAllRules:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    if ([v5 count])
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __70__HRERecommendableObjectUtilities_recommendableObjects_matchAllRules___block_invoke;
      v9[3] = &unk_264CF3888;
      id v10 = v5;
      char v7 = objc_msgSend(v6, "na_all:", v9);
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

uint64_t __70__HRERecommendableObjectUtilities_recommendableObjects_matchAllRules___block_invoke(uint64_t a1, void *a2)
{
  return [a2 passesWithHomeObjects:*(void *)(a1 + 32)];
}

+ (id)filterRecommendableObjects:(id)a3 toMatchTypes:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__HRERecommendableObjectUtilities_filterRecommendableObjects_toMatchTypes___block_invoke;
  v9[3] = &unk_264CF38B0;
  id v10 = v5;
  id v6 = v5;
  char v7 = objc_msgSend(a3, "na_filter:", v9);

  return v7;
}

uint64_t __75__HRERecommendableObjectUtilities_filterRecommendableObjects_toMatchTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hre_matchingTypes");
  uint64_t v4 = [v3 intersectsSet:*(void *)(a1 + 32)];

  return v4;
}

+ (id)filterRecommendableObjects:(id)a3 toRooms:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__HRERecommendableObjectUtilities_filterRecommendableObjects_toRooms___block_invoke;
  v9[3] = &unk_264CF38B0;
  id v10 = v5;
  id v6 = v5;
  char v7 = objc_msgSend(a3, "na_filter:", v9);

  return v7;
}

uint64_t __70__HRERecommendableObjectUtilities_filterRecommendableObjects_toRooms___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "hre_parentRoom");
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = objc_msgSend(v3, "hre_parentRoom");
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)filterRecommendableObjects:(id)a3 excludingObjectsInActions:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v5, "na_map:", &__block_literal_global_146);
  uint64_t v8 = objc_msgSend(v5, "na_flatMap:", &__block_literal_global_150);

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __88__HRERecommendableObjectUtilities_filterRecommendableObjects_excludingObjectsInActions___block_invoke_3;
  v13[3] = &unk_264CF3918;
  id v14 = v7;
  id v15 = v8;
  id v9 = v8;
  id v10 = v7;
  char v11 = objc_msgSend(v6, "na_filter:", v13);

  return v11;
}

id __88__HRERecommendableObjectUtilities_filterRecommendableObjects_excludingObjectsInActions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 characteristic];
    uint64_t v7 = [v6 service];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id __88__HRERecommendableObjectUtilities_filterRecommendableObjects_excludingObjectsInActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 mediaProfiles];
  }
  else
  {
    objc_opt_class();
    id v7 = v3;
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      id v10 = (void *)MEMORY[0x263EFFA08];
      char v11 = [v9 characteristic];
      id v12 = [v11 service];
      id v13 = [v12 accessory];
      id v14 = [v13 profiles];
      id v6 = [v10 setWithArray:v14];
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

uint64_t __88__HRERecommendableObjectUtilities_filterRecommendableObjects_excludingObjectsInActions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "hf_containedServices");
  int v5 = [v4 intersectsSet:*(void *)(a1 + 32)];

  id v6 = objc_msgSend(v3, "hf_containedProfiles");

  LODWORD(a1) = [v6 intersectsSet:*(void *)(a1 + 40)];
  return (v5 | a1) ^ 1;
}

@end