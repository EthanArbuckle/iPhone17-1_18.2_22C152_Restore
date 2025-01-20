@interface WFRemindersLibraryFiltering
+ (void)getItemsMatchingQuery:(id)a3 withInput:(id)a4 resultHandler:(id)a5;
+ (void)performCustomFilteringUsingContentPredicates:(id)a3 compoundPredicateType:(unint64_t)a4 forQuery:(id)a5 withInput:(id)a6 resultHandler:(id)a7;
@end

@implementation WFRemindersLibraryFiltering

+ (void)getItemsMatchingQuery:(id)a3 withInput:(id)a4 resultHandler:(id)a5
{
  id v8 = a4;
  if (v8)
  {
    id v9 = a5;
    id v10 = a3;
    v11 = +[WFContentItem contentPropertySubstitutor];
    [v10 runWithObjects:v8 propertySubstitutor:v11 completionHandler:v9];
  }
  else
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___WFRemindersLibraryFiltering;
    id v12 = a5;
    id v13 = a3;
    objc_msgSendSuper2(&v14, sel_getItemsMatchingQuery_withInput_resultHandler_, v13, 0, v12);
  }
}

+ (void)performCustomFilteringUsingContentPredicates:(id)a3 compoundPredicateType:(unint64_t)a4 forQuery:(id)a5 withInput:(id)a6 resultHandler:(id)a7
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v79 = a5;
  id v74 = a6;
  id v77 = a7;
  unint64_t v78 = a4;
  if (!a4)
  {
    id v12 = [v11 firstObject];
    id v13 = +[WFContentCompoundPredicate notPredicateWithSubpredicate:v12];
    v103 = v13;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v103 count:1];

    unint64_t v78 = 1;
    id v11 = (id)v14;
  }
  if (getWFRemindersLibraryFilteringLogObject_onceToken != -1) {
    dispatch_once(&getWFRemindersLibraryFilteringLogObject_onceToken, &__block_literal_global_5849);
  }
  v15 = (id)getWFRemindersLibraryFilteringLogObject_log;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = @"OR";
    *(void *)&buf[4] = "+[WFRemindersLibraryFiltering performCustomFilteringUsingContentPredicates:compoundPredicateTyp"
                         "e:forQuery:withInput:resultHandler:]";
    *(_DWORD *)buf = 136315650;
    if (v78 == 1) {
      v16 = @"AND";
    }
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    v105 = v11;
    _os_log_impl(&dword_216505000, v15, OS_LOG_TYPE_INFO, "%s Filtering using predicate of type %{public}@ and subpredicates %@", buf, 0x20u);
  }

  v80 = objc_opt_new();
  v17 = objc_opt_new();
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v93 objects:v102 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v94 != v20) {
          objc_enumerationMutation(v18);
        }
        v22 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        v23 = WFReminderPredicateDescriptorFromContentPredicate(v22);
        if (v23) {
          [v17 addObject:v23];
        }
        else {
          [v80 addObject:v22];
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v93 objects:v102 count:16];
    }
    while (v19);
  }

  if (v78 == 2 && [v80 count])
  {
    v92[0] = MEMORY[0x263EF8330];
    v92[1] = 3221225472;
    v92[2] = __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke;
    v92[3] = &__block_descriptor_40_e60_v32__0__WFContentPredicate_8Q16___v____NSArray___NSError__24l;
    v92[4] = a1;
    v88[0] = MEMORY[0x263EF8330];
    v88[1] = 3221225472;
    v88[2] = __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_3;
    v88[3] = &unk_264287D80;
    id v91 = a1;
    id v89 = v79;
    id v90 = v77;
    objc_msgSend(v18, "if_flatMapAsynchronously:completionHandler:", v92, v88);

    v24 = v89;
  }
  else
  {
    if ([v80 count]
      || ([v79 sortDescriptors],
          v26 = objc_claimAutoreleasedReturnValue(),
          BOOL v27 = [v26 count] == 0,
          v26,
          v27))
    {
      id v73 = 0;
      BOOL v25 = 1;
    }
    else
    {
      id v28 = [v79 sortDescriptors];
      v29 = objc_opt_new();
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      obuint64_t j = v28;
      uint64_t v30 = [obj countByEnumeratingWithState:&v97 objects:buf count:16];
      if (v30)
      {
        uint64_t v75 = *(void *)v98;
        while (2)
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v98 != v75) {
              objc_enumerationMutation(obj);
            }
            id v32 = *(id *)(*((void *)&v97 + 1) + 8 * j);
            v33 = [v32 comparator];

            if (v33)
            {
LABEL_41:

LABEL_42:
              id v73 = 0;
              goto LABEL_43;
            }
            v34 = [v32 property];
            v35 = [v34 name];
            v36 = WFLocalizedContentPropertyNameMarker(@"Creation Date");
            int v37 = [v35 isEqualToString:v36];

            if (v37)
            {
              uint64_t v38 = objc_msgSend(getREMReminderSortDescriptorClass(), "sortDescriptorSortingByCreationDateAscending:", objc_msgSend(v32, "ascending"));
            }
            else
            {
              v39 = [v32 property];
              v40 = [v39 name];
              v41 = WFLocalizedContentPropertyNameMarker(@"Due Date");
              int v42 = [v40 isEqualToString:v41];

              if (v42)
              {
                uint64_t v38 = objc_msgSend(getREMReminderSortDescriptorClass(), "sortDescriptorSortingByDueDateAscending:", objc_msgSend(v32, "ascending"));
              }
              else
              {
                v43 = [v32 property];
                v44 = [v43 name];
                v45 = WFLocalizedContentPropertyNameMarker(@"Priority");
                int v46 = [v44 isEqualToString:v45];

                if (!v46) {
                  goto LABEL_41;
                }
                uint64_t v38 = objc_msgSend(getREMReminderSortDescriptorClass(), "sortDescriptorSortingByPriorityAscending:", objc_msgSend(v32, "ascending"));
              }
            }
            v47 = (void *)v38;

            if (!v47) {
              goto LABEL_42;
            }
            [v29 addObject:v47];
          }
          uint64_t v30 = [obj countByEnumeratingWithState:&v97 objects:buf count:16];
          if (v30) {
            continue;
          }
          break;
        }
      }

      id v73 = v29;
LABEL_43:

      BOOL v25 = v73 != 0;
    }
    if ([v80 count]) {
      BOOL v48 = 0;
    }
    else {
      BOOL v48 = v25;
    }
    BOOL v69 = v48;
    if (v79) {
      BOOL v49 = v48;
    }
    else {
      BOOL v49 = 0;
    }
    v50 = WFGetWorkflowReminderStore();
    if ([v17 count])
    {
      v51 = WFCompoundReminderPredicateDescriptorWithSubpredicates(v17, v78);
      *(void *)&long long v97 = 0;
      *((void *)&v97 + 1) = &v97;
      *(void *)&long long v98 = 0x2050000000;
      v52 = (void *)getREMReminderClass_softClass_5812;
      *((void *)&v98 + 1) = getREMReminderClass_softClass_5812;
      if (!getREMReminderClass_softClass_5812)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getREMReminderClass_block_invoke_5813;
        v105 = &unk_26428AC60;
        v106 = &v97;
        __getREMReminderClass_block_invoke_5813((uint64_t)buf);
        v52 = *(void **)(*((void *)&v97 + 1) + 24);
      }
      id v53 = v52;
      _Block_object_dispose(&v97, 8);
      v54 = [v53 fetchRequestWithPredicateDescriptor:v51 sortDescriptors:v73];
      id v87 = 0;
      id v76 = [v50 executeFetchRequest:v54 error:&v87];
      id obja = v87;
    }
    else
    {
      v55 = objc_opt_new();
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_4;
      v85[3] = &unk_264286B80;
      id v76 = v55;
      id v86 = v76;
      [v50 enumerateAllRemindersWithBlock:v85];
      id obja = 0;
      v51 = v86;
    }

    if (v76)
    {
      uint64_t v56 = [v79 slice];
      uint64_t v58 = v57;
      id v59 = v76;
      v60 = v59;
      if (v49)
      {
        v61 = WFIndexSetFromContentSlice(v56, v58, [v59 count]);
        uint64_t v62 = [v60 objectsAtIndexes:v61];

        v60 = (void *)v62;
      }
      v63 = objc_opt_new();
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v64 = v60;
      uint64_t v65 = [v64 countByEnumeratingWithState:&v81 objects:v101 count:16];
      if (v65)
      {
        uint64_t v66 = *(void *)v82;
        do
        {
          for (uint64_t k = 0; k != v65; ++k)
          {
            if (*(void *)v82 != v66) {
              objc_enumerationMutation(v64);
            }
            v68 = +[WFReminderContentItem itemWithReminder:*(void *)(*((void *)&v81 + 1) + 8 * k) fromReminderStore:v50];
            [v63 addObject:v68];
          }
          uint64_t v65 = [v64 countByEnumeratingWithState:&v81 objects:v101 count:16];
        }
        while (v65);
      }

      if (v69) {
        (*((void (**)(id, void *, void))v77 + 2))(v77, v63, 0);
      }
      else {
        [a1 performFallbackFilteringWithItems:v63 withContentPredicates:v80 compoundPredicateType:v78 originalQuery:v79 resultHandler:v77];
      }
    }
    else
    {
      (*((void (**)(id, void, id))v77 + 2))(v77, 0, obja);
    }

    v24 = v73;
  }
}

void __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = *(void **)(a1 + 32);
  v14[0] = a2;
  id v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a2;
  id v10 = [v8 arrayWithObjects:v14 count:1];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_2;
  v12[3] = &unk_26428AF18;
  id v13 = v6;
  id v11 = v6;
  [v7 performCustomFilteringUsingContentPredicates:v10 compoundPredicateType:1 forQuery:0 withInput:0 resultHandler:v12];
}

void __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_3(void *a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263EFF9B0];
  id v4 = a2;
  id v7 = (id)[[v3 alloc] initWithArray:v4];

  v5 = (void *)a1[6];
  id v6 = [v7 array];
  [v5 performFallbackFilteringWithItems:v6 withContentPredicates:0 compoundPredicateType:0 originalQuery:a1[4] resultHandler:a1[5]];
}

uint64_t __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end