@interface HREStandardAsyncRecommendationSource
- (Class)generationProcessClass;
- (HREStandardAsyncRecommendationSource)init;
- (id)asyncSetupProcess:(id)a3;
- (id)dispatchProcess:(id)a3 options:(unint64_t)a4 actionBlock:(id)a5;
- (id)recommendationsForHome:(id)a3 withServiceLikeItems:(id)a4 accessoryTypeGroup:(id)a5 options:(unint64_t)a6;
- (unint64_t)disablingOptions;
- (void)setupProcess:(id)a3;
@end

@implementation HREStandardAsyncRecommendationSource

- (HREStandardAsyncRecommendationSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)HREStandardAsyncRecommendationSource;
  v2 = [(HREStandardAsyncRecommendationSource *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    Class generationProcessClass = v2->_generationProcessClass;
    v2->_Class generationProcessClass = (Class)v3;
  }
  return v2;
}

- (unint64_t)disablingOptions
{
  return 0;
}

- (id)recommendationsForHome:(id)a3 withServiceLikeItems:(id)a4 accessoryTypeGroup:(id)a5 options:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init([(HREStandardAsyncRecommendationSource *)self generationProcessClass]);
  [v13 setHome:v10];
  v14 = [MEMORY[0x263EFFA08] setWithArray:v11];
  [v13 setSourceItems:v14];

  [v13 setTypeGroup:v12];
  [v13 setOptions:a6];
  [(HREStandardAsyncRecommendationSource *)self setupProcess:v13];
  if ([v13 shouldGenerateRecommendations])
  {
    objc_initWeak(&location, self);
    v15 = [(HREStandardAsyncRecommendationSource *)self asyncSetupProcess:v13];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __111__HREStandardAsyncRecommendationSource_recommendationsForHome_withServiceLikeItems_accessoryTypeGroup_options___block_invoke;
    v20[3] = &unk_264CF4358;
    objc_copyWeak(v22, &location);
    id v21 = v13;
    v22[1] = (id)a6;
    v16 = [v15 flatMap:v20];

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
  else
  {
    v17 = (void *)MEMORY[0x263F58190];
    v18 = objc_opt_new();
    v16 = [v17 futureWithResult:v18];
  }

  return v16;
}

id __111__HREStandardAsyncRecommendationSource_recommendationsForHome_withServiceLikeItems_accessoryTypeGroup_options___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained dispatchProcess:*(void *)(a1 + 32) options:*(void *)(a1 + 48) actionBlock:&__block_literal_global_8];

  return v3;
}

uint64_t __111__HREStandardAsyncRecommendationSource_recommendationsForHome_withServiceLikeItems_accessoryTypeGroup_options___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 generateRecommendations];
}

- (id)dispatchProcess:(id)a3 options:(unint64_t)a4 actionBlock:(id)a5
{
  char v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if ((v6 & 0x20) != 0)
  {
    id v10 = (void *)MEMORY[0x263F58190];
  }
  else
  {
    int v9 = [MEMORY[0x263F47C58] isInternalTest];
    id v10 = (void *)MEMORY[0x263F58190];
    if (!v9)
    {
      uint64_t v15 = MEMORY[0x263EF8330];
      id v17 = v8;
      id v16 = v7;
      id v11 = objc_msgSend(MEMORY[0x263F581B8], "globalAsyncScheduler", v15, 3221225472, __76__HREStandardAsyncRecommendationSource_dispatchProcess_options_actionBlock___block_invoke, &unk_264CF4380);
      id v12 = [v10 lazyFutureWithBlock:&v15 scheduler:v11];

      goto LABEL_6;
    }
  }
  id v13 = (*((void (**)(id, id))v8 + 2))(v8, v7);
  id v12 = [v10 futureWithResult:v13];

LABEL_6:

  return v12;
}

void __76__HREStandardAsyncRecommendationSource_dispatchProcess_options_actionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  id v5 = a2;
  v4(v2, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 finishWithResult:v6];
}

- (id)asyncSetupProcess:(id)a3
{
  id v3 = a3;
  int v4 = [MEMORY[0x263F47C58] isInternalTest];
  id v5 = (void *)MEMORY[0x263F58190];
  if (v4)
  {
    id v6 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __58__HREStandardAsyncRecommendationSource_asyncSetupProcess___block_invoke;
    v8[3] = &unk_264CF43D0;
    id v9 = v3;
    id v6 = [v5 futureWithBlock:v8];
  }

  return v6;
}

void __58__HREStandardAsyncRecommendationSource_asyncSetupProcess___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)MEMORY[0x263F47B98];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__HREStandardAsyncRecommendationSource_asyncSetupProcess___block_invoke_2;
  v6[3] = &unk_264CF43A8;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  [v4 fetchCurrentWithCompletionHandler:v6];
}

uint64_t __58__HREStandardAsyncRecommendationSource_asyncSetupProcess___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setSnapshotContainer:a2];
  id v3 = *(void **)(a1 + 40);

  return [v3 finishWithNoResult];
}

- (void)setupProcess:(id)a3
{
  id v3 = a3;
  int v4 = [v3 sourceItems];
  if (v4)
  {
    uint64_t v5 = [v3 sourceItems];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  id v6 = (void *)v5;

  id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_11);
  id v8 = (void *)[v6 copy];
  id v9 = objc_msgSend(v6, "na_map:", &__block_literal_global_65);
  v72 = v8;
  id v10 = objc_msgSend(v8, "na_flatMap:", &__block_literal_global_269);
  v73 = v7;
  uint64_t v11 = objc_msgSend(v7, "na_flatMap:", &__block_literal_global_272);
  uint64_t v12 = objc_msgSend(v6, "na_map:", &__block_literal_global_274);
  v71 = v9;
  uint64_t v13 = objc_msgSend(v9, "na_flatMap:", &__block_literal_global_277);
  v14 = (void *)MEMORY[0x263EFFA08];
  uint64_t v15 = [v3 home];
  id v16 = [v15 serviceGroups];
  id v17 = [v14 setWithArray:v16];
  v78[0] = MEMORY[0x263EF8330];
  v78[1] = 3221225472;
  v78[2] = __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_7;
  v78[3] = &unk_264CF4478;
  id v79 = v10;
  id v18 = v10;
  v19 = objc_msgSend(v17, "na_filter:", v78);

  v20 = objc_msgSend(v19, "na_flatMap:", &__block_literal_global_281);
  uint64_t v21 = objc_msgSend(v18, "na_setByRemovingObjectsFromSet:", v20);

  v74 = v6;
  uint64_t v22 = objc_msgSend(v6, "na_flatMap:", &__block_literal_global_284);
  v23 = objc_opt_new();
  v66 = (void *)v21;
  v24 = +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:v21];
  [v23 unionSet:v24];

  v67 = v19;
  v25 = +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:v19];
  [v23 unionSet:v25];

  v70 = (void *)v11;
  v26 = +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:v11];
  [v23 unionSet:v26];

  v69 = (void *)v12;
  v27 = +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:v12];
  [v23 unionSet:v27];

  v68 = (void *)v13;
  v28 = +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:v13];
  [v23 unionSet:v28];

  v65 = (void *)v22;
  v29 = +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:v22];
  [v23 unionSet:v29];

  v30 = (void *)[v23 copy];
  [v3 setSourceRecommendableObjects:v30];

  v31 = (void *)MEMORY[0x263EFFA08];
  v32 = [v3 home];
  v33 = objc_msgSend(v32, "hf_allServices");
  v34 = [v31 setWithArray:v33];

  v35 = (void *)MEMORY[0x263EFFA08];
  v36 = [v3 home];
  v37 = objc_msgSend(v36, "hf_allAccessoryProfiles");
  uint64_t v38 = [v35 setWithArray:v37];

  v39 = (void *)MEMORY[0x263EFFA08];
  v40 = [v3 home];
  v41 = [v40 serviceGroups];
  v42 = [v39 setWithArray:v41];

  v43 = objc_msgSend(v42, "na_flatMap:", &__block_literal_global_299);
  uint64_t v44 = objc_msgSend(v34, "na_setByRemovingObjectsFromSet:", v43);

  v45 = (void *)MEMORY[0x263EFFA08];
  v46 = [v3 home];
  v47 = [v46 accessories];
  v48 = objc_msgSend(v47, "na_filter:", &__block_literal_global_301);
  v49 = [v45 setWithArray:v48];

  v50 = objc_opt_new();
  v64 = (void *)v44;
  v51 = +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:v44];
  [v50 unionSet:v51];

  v52 = +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:v42];
  [v50 unionSet:v52];

  v53 = (void *)v38;
  v54 = +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:v38];
  [v50 unionSet:v54];

  v55 = +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:v49];
  [v50 unionSet:v55];

  [v3 setHomeRecommendableObjects:v50];
  v56 = [v3 typeGroup];

  if (v56)
  {
    if ([v23 count]) {
      v57 = v23;
    }
    else {
      v57 = v50;
    }
    id v58 = v57;
    v59 = [v3 typeGroup];
    v60 = [MEMORY[0x263F47AB0] mediaAccessoryTypeGroup];
    char v61 = [v59 intersectsGroup:v60];

    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_13;
    v75[3] = &unk_264CF4500;
    char v77 = v61;
    id v62 = v3;
    id v76 = v62;
    v63 = objc_msgSend(v58, "na_filter:", v75);

    [v62 setSourceRecommendableObjects:v63];
  }
}

id __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26EAC9430]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 homeKitObject];
  if ([v2 conformsToProtocol:&unk_26EAC9D48]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 services];
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 profiles];
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 homeKitObject];
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 mediaProfiles];
}

BOOL __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(v3, "hf_containedServices");
  if ([v4 count])
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];

    if (!v5)
    {
      BOOL v7 = 0;
      goto LABEL_7;
    }
    id v4 = objc_msgSend(v3, "hf_containedServices");
    id v6 = objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", *(void *)(a1 + 32));
    BOOL v7 = [v6 count] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

LABEL_7:
  return v7;
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_containedServices");
}

id __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26EAC9E88]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 accessoryRepresentableObject];
    BOOL v7 = objc_msgSend(v6, "hf_associatedAccessories");
    id v8 = objc_msgSend(v7, "na_filter:", &__block_literal_global_295);
  }
  else
  {
    id v8 = [MEMORY[0x263EFFA08] set];
  }

  return v8;
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isMatterOnlyAccessory");
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_containedServices");
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_12(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isMatterOnlyAccessory");
}

uint64_t __53__HREStandardAsyncRecommendationSource_setupProcess___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hre_isMediaObject") && !*(unsigned char *)(a1 + 40))
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) typeGroup];
    uint64_t v5 = objc_msgSend(v3, "hf_accessoryType");
    uint64_t v6 = [v4 containsType:v5];
  }
  return v6;
}

- (Class)generationProcessClass
{
  return self->_generationProcessClass;
}

- (void).cxx_destruct
{
}

@end