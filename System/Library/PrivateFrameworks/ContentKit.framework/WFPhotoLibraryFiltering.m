@interface WFPhotoLibraryFiltering
+ (void)performCustomFilteringUsingContentPredicates:(id)a3 compoundPredicateType:(unint64_t)a4 forQuery:(id)a5 withInput:(id)a6 resultHandler:(id)a7;
@end

@implementation WFPhotoLibraryFiltering

+ (void)performCustomFilteringUsingContentPredicates:(id)a3 compoundPredicateType:(unint64_t)a4 forQuery:(id)a5 withInput:(id)a6 resultHandler:(id)a7
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (!a4)
  {
    v15 = [v11 firstObject];
    v16 = +[WFContentCompoundPredicate notPredicateWithSubpredicate:v15];
    v127 = v16;
    a4 = 1;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v127 count:1];

    id v11 = (id)v17;
  }
  id v104 = v13;
  v105 = (void (**)(void, void, void))v14;
  v18 = getWFPhotoLibraryFilteringLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = @"OR";
    v129 = "+[WFPhotoLibraryFiltering performCustomFilteringUsingContentPredicates:compoundPredicateType:forQuery:withInp"
           "ut:resultHandler:]";
    *(_DWORD *)buf = 136315650;
    if (a4 == 1) {
      v19 = @"AND";
    }
    __int16 v130 = 2114;
    v131 = v19;
    __int16 v132 = 2112;
    id v133 = v11;
    _os_log_impl(&dword_216505000, v18, OS_LOG_TYPE_INFO, "%s Filtering using predicate of type %{public}@ and subpredicates %@", buf, 0x20u);
  }
  unint64_t v103 = a4;

  v20 = objc_opt_new();
  v21 = objc_opt_new();
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  v22 = (__CFString *)v11;
  uint64_t v23 = [(__CFString *)v22 countByEnumeratingWithState:&v117 objects:v126 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v118;
    while (2)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v118 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v117 + 1) + 8 * i);
        id v116 = 0;
        v28 = WFPHAssetPredicateFromContentPredicate(v27, &v116);
        id v29 = v116;
        v30 = v29;
        if (v28)
        {
          v31 = v21;
          v32 = v28;
        }
        else
        {
          if (v29)
          {
            v34 = v105;
            ((void (**)(void, void, id))v105)[2](v105, 0, v29);

            v35 = v22;
            goto LABEL_22;
          }
          v31 = v20;
          v32 = v27;
        }
        [v31 addObject:v32];
      }
      uint64_t v24 = [(__CFString *)v22 countByEnumeratingWithState:&v117 objects:v126 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }

  unint64_t v33 = v103;
  if (v103 != 2 || ![v20 count])
  {
    v37 = +[WFSharedPhotoLibrary sharedLibrary];
    id v110 = 0;
    v38 = [v37 fetchOptionsWithError:&v110];
    v35 = (__CFString *)v110;

    v36 = v104;
    v34 = v105;
    if (!v38)
    {
      v40 = getWFGeneralLogObject();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v129 = "+[WFPhotoLibraryFiltering performCustomFilteringUsingContentPredicates:compoundPredicateType:forQuery:wit"
               "hInput:resultHandler:]";
        __int16 v130 = 2112;
        v131 = v35;
        _os_log_impl(&dword_216505000, v40, OS_LOG_TYPE_ERROR, "%s Unable to get fetch options for photo library: %@", buf, 0x16u);
      }

      ((void (**)(void, void, __CFString *))v105)[2](v105, 0, v35);
      goto LABEL_94;
    }
    [v38 setWantsIncrementalChangeDetails:0];
    [v38 setIncludeAssetSourceTypes:7];
    v101 = v38;
    v98 = v35;
    if ([v20 count])
    {
      BOOL v39 = 1;
    }
    else
    {
      v41 = [v12 sortDescriptors];
      uint64_t v42 = [v41 count];

      if (v42)
      {
        id v96 = v12;
        id v43 = [v12 sortDescriptors];
        v44 = objc_opt_new();
        long long v121 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        obuint64_t j = v43;
        uint64_t v45 = [obj countByEnumeratingWithState:&v121 objects:buf count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v122;
          while (2)
          {
            for (uint64_t j = 0; j != v46; ++j)
            {
              if (*(void *)v122 != v47) {
                objc_enumerationMutation(obj);
              }
              id v49 = *(id *)(*((void *)&v121 + 1) + 8 * j);
              v50 = [v49 comparator];

              if (v50)
              {

LABEL_45:
                v54 = obj;

                id v55 = 0;
                v36 = v104;
                goto LABEL_46;
              }
              v51 = [v49 property];
              v52 = WFPHAssetKeyPathForContentProperty(v51);

              if (v52)
              {
                v53 = objc_msgSend(MEMORY[0x263F08B30], "sortDescriptorWithKey:ascending:", v52, objc_msgSend(v49, "ascending"));
              }
              else
              {
                v53 = 0;
              }

              if (!v53) {
                goto LABEL_45;
              }
              [v44 addObject:v53];
            }
            uint64_t v46 = [obj countByEnumeratingWithState:&v121 objects:buf count:16];
            v36 = v104;
            if (v46) {
              continue;
            }
            break;
          }
        }
        v54 = obj;

        id v55 = v44;
LABEL_46:

        v38 = v101;
        [v101 setSortDescriptors:v55];

        v56 = [v101 sortDescriptors];
        BOOL v39 = v56 != 0;

        v34 = v105;
        unint64_t v33 = v103;
        id v12 = v96;
      }
      else
      {
        BOOL v39 = 1;
        v38 = v101;
      }
    }
    if ([v20 count]) {
      BOOL v57 = 0;
    }
    else {
      BOOL v57 = v39;
    }
    BOOL v95 = v57;
    if (v12) {
      BOOL v58 = v57;
    }
    else {
      BOOL v58 = 0;
    }
    id obja = (id)[v12 slice];
    uint64_t v94 = v59;
    if (v58 && obja == (id)0x7FFFFFFFFFFFFFFFLL && v59 != 0x7FFFFFFFFFFFFFFFLL) {
      [v38 setFetchLimit:v59];
    }
    if (v36)
    {
      BOOL v91 = v58;
      v60 = objc_msgSend(v36, "if_map:", &__block_literal_global_219);
      v61 = (void *)[v60 mutableCopy];

      if ([v21 count])
      {
        v62 = (void *)[objc_alloc(MEMORY[0x263F08730]) initWithType:v33 subpredicates:v21];
        [v61 filterUsingPredicate:v62];
      }
      v63 = [v38 sortDescriptors];

      if (!v63)
      {
        v65 = v61;
        BOOL v58 = v91;
        if (v65)
        {
LABEL_80:
          v93 = v65;
          id v78 = v65;
          v79 = v78;
          id v97 = v12;
          if (v58)
          {
            v80 = WFIndexSetFromContentSlice((uint64_t)obja, v94, [v78 count]);
            uint64_t v81 = [v79 objectsAtIndexes:v80];

            v79 = (void *)v81;
          }
          v82 = objc_opt_new();
          long long v106 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
          id v83 = v79;
          uint64_t v84 = [v83 countByEnumeratingWithState:&v106 objects:v125 count:16];
          if (v84)
          {
            uint64_t v85 = v84;
            uint64_t v86 = *(void *)v107;
            do
            {
              for (uint64_t k = 0; k != v85; ++k)
              {
                if (*(void *)v107 != v86) {
                  objc_enumerationMutation(v83);
                }
                v88 = +[WFContentItem itemWithObject:*(void *)(*((void *)&v106 + 1) + 8 * k)];
                [v82 addObject:v88];
              }
              uint64_t v85 = [v83 countByEnumeratingWithState:&v106 objects:v125 count:16];
            }
            while (v85);
          }

          if (v95)
          {
            ((void (**)(void, void *, void))v105)[2](v105, v82, 0);
            id v12 = v97;
          }
          else
          {
            id v12 = v97;
            [a1 performFallbackFilteringWithItems:v82 withContentPredicates:v20 compoundPredicateType:v103 originalQuery:v97 resultHandler:v105];
          }
          v36 = v104;
          v35 = v98;
          v65 = v93;

          v34 = v105;
          v38 = v101;
          goto LABEL_93;
        }
LABEL_68:
        v34[2](v34, 0, 0);
        v35 = v98;
LABEL_93:

LABEL_94:
        goto LABEL_95;
      }
      v64 = [v38 sortDescriptors];
      v65 = v61;
      [v61 sortUsingDescriptors:v64];
      BOOL v58 = v91;
    }
    else
    {
      v92 = objc_msgSend(v21, "if_objectsPassingTest:", &__block_literal_global_224_11147);
      if ([v92 count] && (v33 == 1 || objc_msgSend(v21, "count") == 1))
      {
        v66 = objc_msgSend(v92, "if_objectsPassingTest:", &__block_literal_global_229);
        v67 = [v66 firstObject];

        v89 = v67;
        if (v67)
        {
          id v68 = v67;
        }
        else
        {
          objc_msgSend(v92, "firstObject", 0);
          id v68 = (id)objc_claimAutoreleasedReturnValue();
        }
        v71 = v68;
        v72 = objc_msgSend(v68, "assetCollection", v89);
        [v21 removeObject:v71];
        if ([v21 count])
        {
          v73 = (void *)[objc_alloc(MEMORY[0x263F08730]) initWithType:v103 subpredicates:v21];
          v74 = objc_msgSend(v73, "wf_photoLibraryFilteringPredicate");
          [v101 setPredicate:v74];
        }
        v75 = getWFPhotoLibraryFilteringLogObject();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          v76 = [v72 wfName];
          *(_DWORD *)buf = 136315650;
          v129 = "+[WFPhotoLibraryFiltering performCustomFilteringUsingContentPredicates:compoundPredicateType:forQuery:w"
                 "ithInput:resultHandler:]";
          __int16 v130 = 2112;
          v131 = v76;
          __int16 v132 = 2112;
          id v133 = v21;
          _os_log_impl(&dword_216505000, v75, OS_LOG_TYPE_INFO, "%s Performing optimized photo lookup for album %@, remaining predicates %@", buf, 0x20u);
        }
        uint64_t v77 = [getPHAssetClass_11110() fetchAssetsInAssetCollection:v72 options:v101];

        v38 = v101;
        v65 = (void *)v77;

        v34 = v105;
      }
      else
      {
        if ([v21 count])
        {
          v69 = (void *)[objc_alloc(MEMORY[0x263F08730]) initWithType:v33 subpredicates:v21];
          v70 = objc_msgSend(v69, "wf_photoLibraryFilteringPredicate");
          [v101 setPredicate:v70];

          v38 = v101;
        }
        v65 = [getPHAssetClass_11110() fetchAssetsWithOptions:v38];
      }
      v64 = v92;
    }

    if (v65) {
      goto LABEL_80;
    }
    goto LABEL_68;
  }
  v115[0] = MEMORY[0x263EF8330];
  v115[1] = 3221225472;
  v115[2] = __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke;
  v115[3] = &__block_descriptor_40_e60_v32__0__WFContentPredicate_8Q16___v____NSArray___NSError__24l;
  v115[4] = a1;
  v111[0] = MEMORY[0x263EF8330];
  v111[1] = 3221225472;
  v111[2] = __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_3;
  v111[3] = &unk_264287D80;
  id v114 = a1;
  v112 = (__CFString *)v12;
  v34 = v105;
  v113 = v105;
  [(__CFString *)v22 if_flatMapAsynchronously:v115 completionHandler:v111];

  v35 = v112;
LABEL_22:
  v36 = v104;
LABEL_95:
}

void __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = *(void **)(a1 + 32);
  v14[0] = a2;
  v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a2;
  v10 = [v8 arrayWithObjects:v14 count:1];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_2;
  v12[3] = &unk_26428AF18;
  id v13 = v6;
  id v11 = v6;
  [v7 performCustomFilteringUsingContentPredicates:v10 compoundPredicateType:1 forQuery:0 withInput:0 resultHandler:v12];
}

void __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_3(void *a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263EFF9B0];
  id v4 = a2;
  id v7 = (id)[[v3 alloc] initWithArray:v4];

  v5 = (void *)a1[6];
  id v6 = [v7 array];
  [v5 performFallbackFilteringWithItems:v6 withContentPredicates:0 compoundPredicateType:0 originalQuery:a1[4] resultHandler:a1[5]];
}

BOOL __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_3_226(uint64_t a1, void *a2)
{
  v2 = [a2 assetCollection];
  BOOL v3 = [v2 assetCollectionType] == 2 && objc_msgSend(v2, "assetCollectionSubtype") == 209;

  return v3;
}

uint64_t __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_2_221(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_216(uint64_t a1, void *a2)
{
  return [a2 asset];
}

uint64_t __127__WFPhotoLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end