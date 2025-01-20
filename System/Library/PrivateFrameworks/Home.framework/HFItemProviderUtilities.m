@interface HFItemProviderUtilities
+ (id)_legacyFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4;
+ (id)_servicesForHome:(id)a3 canShowInControlCentre:(BOOL)a4 withLimit:(unint64_t)a5 includes:(unint64_t)a6 ignoreUUIDs:(id)a7;
+ (id)favoriteActionSetsForHome:(id)a3 withLimit:(unint64_t)a4;
+ (id)favoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4;
+ (id)nonFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4;
+ (id)predictionsPaddingFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4;
+ (id)predictionsPaddingFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4 ignoreUUIDs:(id)a5;
+ (id)predictionsPaddingNonFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4;
+ (id)predictionsPaddingNonFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4 ignoreUUIDs:(id)a5;
@end

@implementation HFItemProviderUtilities

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  v5 = *(void **)(a1 + 32);
  v6 = [v3 uniqueIdentifier];
  if ([v5 containsObject:v6])
  {
    int v7 = 1;
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = [v3 accessory];
    v10 = [v9 uniqueIdentifier];
    int v7 = [v8 containsObject:v10];
  }
  LOBYTE(v11) = *(unsigned char *)(a1 + 56);
  if ((_BYTE)v11) {
    int v11 = objc_msgSend(v3, "hf_showsAsServiceInControlCentre") ^ 1;
  }
  uint64_t v12 = 0;
  if (((v4 ^ 1 | v7) & 1) == 0 && (v11 & 1) == 0)
  {
    if (objc_msgSend(v3, "hf_isInGroup"))
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 48);
      v14 = [v3 accessory];
      uint64_t v12 = (*(unsigned int (**)(uint64_t, void *))(v13 + 16))(v13, v14) ^ 1;
    }
  }

  return v12;
}

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 profiles];
  int v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_9_7);

  if (*(unsigned char *)(a1 + 56)) {
    int v6 = objc_msgSend(v3, "hf_showsAsAccessoryInControlCentre") ^ 1;
  }
  else {
    int v6 = 0;
  }
  int v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  v8 = *(void **)(a1 + 32);
  v9 = [v3 uniqueIdentifier];
  if ([v8 containsObject:v9])
  {

    uint64_t v10 = 0;
  }
  else
  {
    int v11 = objc_msgSend(v3, "hf_visibleServices");
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_6;
    v14[3] = &unk_26408E0E8;
    id v15 = *(id *)(a1 + 32);
    char v12 = objc_msgSend(v11, "na_any:", v14);

    uint64_t v10 = 0;
    if (v7 && (v12 & 1) == 0)
    {
      if ((objc_msgSend(v3, "hf_areAllServicesInGroups") | v6 | v5)) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
  }
  return v10;
}

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32) != 2) {
    return *(unsigned __int8 *)(a1 + 40) == objc_msgSend(a2, "hf_effectiveShowInHomeDashboard");
  }
  return objc_msgSend(a2, "hf_shouldBeOnForContextType:", 0);
}

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_showAsAccessoryTile");
}

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasNonStandardTileUI");
}

uint64_t __63__HFItemProviderUtilities_favoriteActionSetsForHome_withLimit___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ((objc_msgSend(v2, "hf_isAnonymous") & 1) != 0
    || ([v2 actions],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        !v4))
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = objc_msgSend(v2, "hf_effectiveShowInHomeDashboard");
  }

  return v5;
}

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

+ (id)favoriteActionSetsForHome:(id)a3 withLimit:(unint64_t)a4
{
  if (a4)
  {
    id v5 = a3;
    int v6 = objc_msgSend(v5, "hf_reorderableActionSetsList");
    int v7 = [v5 actionSets];

    v8 = objc_msgSend(v7, "na_filter:", &__block_literal_global_167);
    v9 = [v6 sortedHomeKitObjectComparator];
    uint64_t v10 = [v8 sortedArrayUsingComparator:v9];

    if ([v10 count] > a4)
    {
      uint64_t v11 = objc_msgSend(v10, "subarrayWithRange:", 0, a4);

      uint64_t v10 = (void *)v11;
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263EFFA68];
  }
  return v10;
}

+ (id)_servicesForHome:(id)a3 canShowInControlCentre:(BOOL)a4 withLimit:(unint64_t)a5 includes:(unint64_t)a6 ignoreUUIDs:(id)a7
{
  id v11 = a7;
  if (a5)
  {
    id v12 = a3;
    v47 = objc_msgSend(v12, "hf_reorderableServicesList");
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke;
    aBlock[3] = &__block_descriptor_41_e75_B16__0___HFFavoritable__HFIncludedContextProtocol__HFShowInHomeDashboard__8l;
    aBlock[4] = a6;
    BOOL v73 = a6 == 0;
    uint64_t v13 = _Block_copy(aBlock);
    unint64_t v48 = a5;
    v14 = (void *)MEMORY[0x263EFFA08];
    id v15 = objc_msgSend(v12, "hf_allVisibleServices");
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_3;
    v67[3] = &unk_2640986D0;
    id v16 = v13;
    id v69 = v16;
    id v49 = v11;
    id v17 = v11;
    BOOL v71 = a4;
    id v68 = v17;
    id v70 = &__block_literal_global_4_11;
    v18 = objc_msgSend(v15, "na_filter:", v67);
    v50 = [v14 setWithSet:v18];

    v19 = (void *)MEMORY[0x263EFFA08];
    v20 = objc_msgSend(v12, "hf_visibleAccessories");
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_4;
    v62[3] = &unk_2640986F8;
    BOOL v66 = a4;
    id v21 = v16;
    id v64 = v21;
    id v22 = v17;
    id v63 = v22;
    id v65 = &__block_literal_global_4_11;
    v23 = objc_msgSend(v20, "na_filter:", v62);
    v24 = [v19 setWithArray:v23];

    v25 = (void *)MEMORY[0x263EFF9C0];
    v26 = [v12 serviceGroups];
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_7;
    v59[3] = &unk_264098720;
    id v27 = v22;
    id v60 = v27;
    id v28 = v21;
    id v61 = v28;
    v29 = objc_msgSend(v26, "na_filter:", v59);
    v30 = [v25 setWithArray:v29];

    v31 = objc_opt_new();
    v32 = objc_msgSend(v12, "hf_mediaAccessories");
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_9;
    v55[3] = &unk_264098748;
    id v33 = v28;
    id v58 = v33;
    id v34 = v27;
    id v56 = v34;
    id v35 = v31;
    id v57 = v35;
    [v32 enumerateObjectsUsingBlock:v55];

    v36 = objc_opt_new();
    v37 = [v12 mediaSystems];

    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_10;
    v51[3] = &unk_264098770;
    id v38 = v33;
    id v54 = v38;
    id v52 = v34;
    id v39 = v36;
    id v53 = v39;
    [v37 enumerateObjectsUsingBlock:v51];

    v40 = [MEMORY[0x263EFF9C0] set];
    [v40 unionSet:v24];
    [v40 unionSet:v50];
    [v40 unionSet:v30];
    [v40 unionSet:v35];
    [v40 unionSet:v39];
    v41 = [v40 allObjects];
    v42 = (void *)[v41 mutableCopy];

    v43 = [v47 sortedHomeKitObjectComparator];
    [v42 sortUsingComparator:v43];

    v44 = (void *)[v42 copy];
    if ([v44 count] > v48)
    {
      uint64_t v45 = objc_msgSend(v44, "subarrayWithRange:", 0, v48);

      v44 = (void *)v45;
    }

    id v11 = v49;
  }
  else
  {
    v44 = (void *)MEMORY[0x263EFFA68];
  }

  return v44;
}

+ (id)_legacyFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4
{
  return +[HFItemProviderUtilities _servicesForHome:a3 canShowInControlCentre:0 withLimit:a4 includes:2 ignoreUUIDs:MEMORY[0x263EFFA68]];
}

+ (id)favoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4
{
  return +[HFItemProviderUtilities _servicesForHome:a3 canShowInControlCentre:0 withLimit:a4 includes:0 ignoreUUIDs:MEMORY[0x263EFFA68]];
}

+ (id)nonFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4
{
  return +[HFItemProviderUtilities _servicesForHome:a3 canShowInControlCentre:0 withLimit:a4 includes:1 ignoreUUIDs:MEMORY[0x263EFFA68]];
}

+ (id)predictionsPaddingFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4
{
  return (id)[a1 predictionsPaddingFavoriteServicesForHome:a3 withLimit:a4 ignoreUUIDs:MEMORY[0x263EFFA68]];
}

+ (id)predictionsPaddingNonFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4
{
  return (id)[a1 predictionsPaddingNonFavoriteServicesForHome:a3 withLimit:a4 ignoreUUIDs:MEMORY[0x263EFFA68]];
}

+ (id)predictionsPaddingFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4 ignoreUUIDs:(id)a5
{
  return +[HFItemProviderUtilities _servicesForHome:a3 canShowInControlCentre:1 withLimit:a4 includes:0 ignoreUUIDs:a5];
}

+ (id)predictionsPaddingNonFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4 ignoreUUIDs:(id)a5
{
  return +[HFItemProviderUtilities _servicesForHome:a3 canShowInControlCentre:1 withLimit:a4 includes:1 ignoreUUIDs:a5];
}

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 uniqueIdentifier];
  char v6 = [v4 containsObject:v5];

  uint64_t v7 = 0;
  if (objc_msgSend(v3, "hf_isSupported") && (v6 & 1) == 0)
  {
    v8 = [v3 services];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_8;
    v10[3] = &unk_264090850;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    uint64_t v7 = objc_msgSend(v8, "na_any:", v10);
  }
  return v7;
}

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 uniqueIdentifier];
  LODWORD(v3) = [v3 containsObject:v5];

  LODWORD(v2) = (*(uint64_t (**)(void))(*(void *)(v2 + 40) + 16))();
  return v2 & (v3 ^ 1);
}

void __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_9(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    id v3 = [v7 home];
    id v4 = objc_msgSend(v3, "hf_mediaSystemForAccessory:", v7);

    if (!v4)
    {
      id v5 = *(void **)(a1 + 32);
      char v6 = [v7 uniqueIdentifier];
      LOBYTE(v5) = [v5 containsObject:v6];

      if ((v5 & 1) == 0) {
        [*(id *)(a1 + 40) addObject:v7];
      }
    }
  }
}

void __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_10(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v5 uniqueIdentifier];
    LOBYTE(v3) = [v3 containsObject:v4];

    if ((v3 & 1) == 0) {
      [*(id *)(a1 + 40) addObject:v5];
    }
  }
}

@end