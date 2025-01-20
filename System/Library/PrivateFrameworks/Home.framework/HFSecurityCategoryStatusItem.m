@interface HFSecurityCategoryStatusItem
+ (id)_aggregatablePositionStatusItemClasses;
+ (id)statusItemClasses;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessoryTypeGroup;
@end

@implementation HFSecurityCategoryStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFSecurityCategoryStatusItem;
  v5 = [(HFAccessoryCategoryStatusItem *)&v12 _subclass_updateWithOptions:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__HFSecurityCategoryStatusItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_26408D148;
  id v10 = v4;
  v11 = self;
  id v6 = v4;
  v7 = [v5 flatMap:v9];

  return v7;
}

id __60__HFSecurityCategoryStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[v3 mutableCopy];
  v5 = [v4 objectForKeyedSubscript:@"hidden"];
  int v6 = [v5 BOOLValue];

  if (v6) {
    goto LABEL_8;
  }
  v7 = _HFLocalizedStringWithDefaultValue(@"HFAccessoryTypeGroupNameSecurity", @"HFAccessoryTypeGroupNameSecurity", 1);
  [v4 setObject:v7 forKeyedSubscript:@"title"];

  [v4 setObject:@"Home.Status.Category.Security" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
  [v4 setObject:@"lock.fill" forKeyedSubscript:@"iconNames"];
  v8 = [HFImageIconDescriptor alloc];
  v9 = [v4 objectForKeyedSubscript:@"iconNames"];
  id v10 = [(HFImageIconDescriptor *)v8 initWithSystemImageNamed:v9];
  [v4 setObject:v10 forKeyedSubscript:@"icon"];

  v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
  if ([v11 BOOLValue])
  {

LABEL_8:
    v34 = [MEMORY[0x263F58190] futureWithResult:v4];
    goto LABEL_9;
  }
  objc_super v12 = [v4 objectForKeyedSubscript:@"state"];
  uint64_t v13 = [v12 integerValue];

  if (!v13) {
    goto LABEL_8;
  }
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x3032000000;
  v124 = __Block_byref_object_copy__0;
  v125 = __Block_byref_object_dispose__0;
  id v126 = 0;
  v14 = [MEMORY[0x263EFF9C0] set];
  v15 = [MEMORY[0x263EFF9C0] set];
  v16 = [MEMORY[0x263EFF9C0] set];
  v17 = [MEMORY[0x263EFF9C0] set];
  v18 = [MEMORY[0x263EFF9C0] set];
  v19 = [MEMORY[0x263EFF9C0] set];
  v20 = [(id)objc_opt_class() statusItemClasses];
  v113[0] = MEMORY[0x263EF8330];
  v113[1] = 3221225472;
  v113[2] = __60__HFSecurityCategoryStatusItem__subclass_updateWithOptions___block_invoke_21;
  v113[3] = &unk_26408D120;
  v113[4] = *(void *)(a1 + 40);
  v120 = &v121;
  id v21 = v14;
  id v114 = v21;
  id v22 = v15;
  id v115 = v22;
  id v23 = v16;
  id v116 = v23;
  id v111 = v17;
  id v117 = v111;
  id v110 = v18;
  id v118 = v110;
  id v24 = v19;
  id v119 = v24;
  objc_msgSend(v20, "na_each:", v113);

  v112 = [*(id *)(a1 + 40) _statusItemOfClass:objc_opt_class()];
  v25 = [(id)objc_opt_class() _aggregatablePositionStatusItemClasses];
  LODWORD(v20) = [v25 containsObject:objc_opt_class()];

  if (!v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v49 = [v112 latestResults];
      v50 = [v49 objectForKeyedSubscript:@"state"];
      char v51 = [v50 isEqual:&unk_26C0F5DF0];

      if (v51)
      {
        v33 = _HFLocalizedStringWithDefaultValue(@"HFSecurityCategoryStatusDescription_NoAlerts", @"HFSecurityCategoryStatusDescription_NoAlerts", 1);
        [v4 setObject:v33 forKeyedSubscript:@"description"];
        goto LABEL_37;
      }
      v33 = [v112 latestResults];
      v38 = [v33 objectForKeyedSubscript:@"shortDescription"];
      [v4 setObject:v38 forKeyedSubscript:@"description"];
LABEL_36:

      goto LABEL_37;
    }
    v36 = [(id)v122[5] latestResults];
    v33 = [v36 objectForKeyedSubscript:@"obstructedServices"];

    v37 = [(id)v122[5] latestResults];
    v38 = [v37 objectForKeyedSubscript:@"openServices"];

    v39 = [(id)v122[5] latestResults];
    v109 = [v39 objectForKeyedSubscript:@"openingServices"];

    v40 = [(id)v122[5] latestResults];
    v108 = [v40 objectForKeyedSubscript:@"closingServices"];

    if ([v33 count])
    {
      uint64_t v41 = [v33 count];
      v48 = HFLocalizedStringWithFormat(@"HFSecurityCategoryStatusTitle_Jammed", @"%lu", v42, v43, v44, v45, v46, v47, v41);
      [v4 setObject:v48 forKeyedSubscript:@"description"];
    }
    else if ([v38 count])
    {
      uint64_t v59 = [v38 count];
      v48 = HFLocalizedStringWithFormat(@"HFSecurityCategoryStatusTitle_Unlocked", @"%lu", v60, v61, v62, v63, v64, v65, v59);
      [v4 setObject:v48 forKeyedSubscript:@"description"];
    }
    else if ([v109 count])
    {
      uint64_t v73 = [v109 count];
      v48 = HFLocalizedStringWithFormat(@"HFSecurityCategoryStatusTitle_Unlocking", @"%lu", v74, v75, v76, v77, v78, v79, v73);
      [v4 setObject:v48 forKeyedSubscript:@"description"];
    }
    else if ([v108 count])
    {
      uint64_t v87 = [v108 count];
      v48 = HFLocalizedStringWithFormat(@"HFSecurityCategoryStatusTitle_Locking", @"%lu", v88, v89, v90, v91, v92, v93, v87);
      [v4 setObject:v48 forKeyedSubscript:@"description"];
    }
    else
    {
      if (![v24 count])
      {
LABEL_35:

        goto LABEL_36;
      }
      uint64_t v101 = [v24 count];
      v48 = HFLocalizedStringWithFormat(@"HFSecurityCategoryStatusTitle_Unknown", @"%lu", v102, v103, v104, v105, v106, v107, v101);
      [v4 setObject:v48 forKeyedSubscript:@"description"];
    }

    goto LABEL_35;
  }
  if ([v21 count])
  {
    uint64_t v26 = [v21 count];
    v33 = HFLocalizedStringWithFormat(@"HFSecurityCategoryStatusTitle_Obstructed", @"%lu", v27, v28, v29, v30, v31, v32, v26);
    [v4 setObject:v33 forKeyedSubscript:@"description"];
LABEL_37:

    goto LABEL_38;
  }
  if ([v22 count])
  {
    uint64_t v52 = [v22 count];
    v33 = HFLocalizedStringWithFormat(@"HFSecurityCategoryStatusTitle_Open", @"%lu", v53, v54, v55, v56, v57, v58, v52);
    [v4 setObject:v33 forKeyedSubscript:@"description"];
    goto LABEL_37;
  }
  if ([v23 count])
  {
    uint64_t v66 = [v23 count];
    v33 = HFLocalizedStringWithFormat(@"HFSecurityCategoryStatusTitle_Opening", @"%lu", v67, v68, v69, v70, v71, v72, v66);
    [v4 setObject:v33 forKeyedSubscript:@"description"];
    goto LABEL_37;
  }
  if ([v111 count])
  {
    uint64_t v80 = [v111 count];
    v33 = HFLocalizedStringWithFormat(@"HFSecurityCategoryStatusTitle_Closing", @"%lu", v81, v82, v83, v84, v85, v86, v80);
    [v4 setObject:v33 forKeyedSubscript:@"description"];
    goto LABEL_37;
  }
  if ([v24 count])
  {
    uint64_t v94 = [v24 count];
    v33 = HFLocalizedStringWithFormat(@"HFSecurityCategoryStatusTitle_Unknown", @"%lu", v95, v96, v97, v98, v99, v100, v94);
    [v4 setObject:v33 forKeyedSubscript:@"description"];
    goto LABEL_37;
  }
LABEL_38:
  [*(id *)(a1 + 40) applyInflectionToDescriptions:v4];
  v34 = [MEMORY[0x263F58190] futureWithResult:v4];

  _Block_object_dispose(&v121, 8);
LABEL_9:

  return v34;
}

void __60__HFSecurityCategoryStatusItem__subclass_updateWithOptions___block_invoke_21(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _statusItemOfClass:a2];
  id obj = v4;
  if (!*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    v5 = [v4 latestResults];
    int v6 = [v5 objectForKeyedSubscript:@"state"];
    int v7 = [v6 isEqual:&unk_26C0F5DD8];

    if (v7) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), obj);
    }
  }
  v8 = [(id)objc_opt_class() _aggregatablePositionStatusItemClasses];
  int v9 = [v8 containsObject:a2];

  if (v9)
  {
    id v10 = *(void **)(a1 + 40);
    v11 = [obj latestResults];
    objc_super v12 = [v11 objectForKeyedSubscript:@"obstructedServices"];
    [v10 unionSet:v12];

    uint64_t v13 = *(void **)(a1 + 48);
    v14 = [obj latestResults];
    v15 = [v14 objectForKeyedSubscript:@"openServices"];
    [v13 unionSet:v15];

    v16 = *(void **)(a1 + 56);
    v17 = [obj latestResults];
    v18 = [v17 objectForKeyedSubscript:@"openingServices"];
    [v16 unionSet:v18];

    v19 = *(void **)(a1 + 64);
    v20 = [obj latestResults];
    id v21 = [v20 objectForKeyedSubscript:@"closingServices"];
    [v19 unionSet:v21];

    id v22 = *(void **)(a1 + 72);
    id v23 = [obj latestResults];
    id v24 = [v23 objectForKeyedSubscript:@"closedServices"];
    [v22 unionSet:v24];
  }
  v25 = *(void **)(a1 + 80);
  uint64_t v26 = [obj latestResults];
  uint64_t v27 = [v26 objectForKeyedSubscript:@"unknownServices"];
  [v25 unionSet:v27];
}

+ (id)_aggregatablePositionStatusItemClasses
{
  if (qword_26AB2EBE0 != -1) {
    dispatch_once(&qword_26AB2EBE0, &__block_literal_global_63);
  }
  v2 = (void *)qword_26AB2EBE8;
  return v2;
}

+ (id)statusItemClasses
{
  if (_MergedGlobals_209 != -1) {
    dispatch_once(&_MergedGlobals_209, &__block_literal_global_3_0);
  }
  v2 = (void *)qword_26AB2EBD8;
  return v2;
}

- (id)accessoryTypeGroup
{
  return +[HFAccessoryTypeGroup securityAccessoryTypeGroup];
}

void __49__HFSecurityCategoryStatusItem_statusItemClasses__block_invoke_2()
{
  v2[6] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:6];
  v1 = (void *)qword_26AB2EBD8;
  qword_26AB2EBD8 = v0;
}

void __70__HFSecurityCategoryStatusItem__aggregatablePositionStatusItemClasses__block_invoke_2()
{
  v4[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)qword_26AB2EBE8;
  qword_26AB2EBE8 = v2;
}

@end