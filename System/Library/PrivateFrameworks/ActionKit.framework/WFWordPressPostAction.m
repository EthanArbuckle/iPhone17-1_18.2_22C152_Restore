@interface WFWordPressPostAction
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (id)contentDestinationWithError:(id *)a3;
- (id)defaultSerializedRepresentationForEnumeration:(id)a3;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)observer;
- (id)possibleStatesForEnumeration:(id)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (id)suggestedTagsForTagField:(id)a3;
- (void)generateHTMLFromInput:(id)a3 completionHandler:(id)a4;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setObserver:(id)a3;
- (void)updateAccountMetadata;
- (void)updateHiddenStates;
- (void)updatePossibleStates;
- (void)wasAddedToWorkflow:(id)a3;
- (void)wasRemovedFromWorkflow:(id)a3;
@end

@implementation WFWordPressPostAction

- (void).cxx_destruct
{
}

- (void)setObserver:(id)a3
{
}

- (id)observer
{
  return self->_observer;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to post %2$@ on WordPress?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to post on WordPress?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F339D0], "wordpressLocation", a3);
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  return (id)objc_msgSend(a4, "value", a3);
}

- (id)possibleStatesForEnumeration:(id)a3
{
  id v4 = a3;
  v5 = +[WFDiskCache workflowCache];
  id v6 = [(WFWordPressPostAction *)self parameterForKey:@"WFAccount"];
  v7 = [(WFWordPressPostAction *)self parameterStateForKey:@"WFAccount"];
  id v8 = [v7 value];
  if (v8)
  {
    v9 = [v7 value];
    v10 = [v6 accountWithName:v9];
  }
  else
  {
    v10 = 0;
  }

  v11 = [v10 username];
  uint64_t v12 = [v10 endpointURL];
  v13 = [v12 absoluteString];
  v21 = WFDiskCacheKey(v11, v14, v15, v16, v17, v18, v19, v20, v13);

  v22 = (void *)MEMORY[0x263EFFA08];
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v25 = objc_msgSend(v5, "objectOfClasses:forKeyComponents:", v24, v21, @"WFWordPressBlogs", 0);

  v26 = [v4 key];
  LODWORD(v13) = [v26 isEqualToString:@"Blog"];

  if (v13)
  {
    objc_msgSend(v4, "setHidden:", (unint64_t)objc_msgSend(v25, "count") < 2);
    v27 = objc_msgSend(v25, "if_compactMap:", &__block_literal_global_316);
  }
  else
  {
    v28 = [(WFWordPressPostAction *)self parameterStateForKey:@"Blog"];
    v29 = [v28 value];
    v96 = v7;
    v97 = v6;
    v95 = v28;
    v98 = v5;
    if (v29)
    {
      v30 = [v28 value];
      v31 = [v25 objectMatchingKey:@"blogName" value:v30];
    }
    else
    {
      v31 = 0;
    }

    v94 = v31;
    v32 = [v31 blogId];
    v33 = [v32 description];
    uint64_t v41 = WFDiskCacheKey(v21, v34, v35, v36, v37, v38, v39, v40, v33);

    v42 = [v4 key];
    int v43 = [v42 isEqualToString:@"Type"];

    v44 = (void *)MEMORY[0x263EFFA08];
    uint64_t v45 = objc_opt_class();
    uint64_t v46 = objc_opt_class();
    v47 = objc_msgSend(v44, "setWithObjects:", v45, v46, objc_opt_class(), 0);
    v93 = (void *)v41;
    v48 = objc_msgSend(v98, "objectOfClasses:forKeyComponents:", v47, v41, @"WFWordPressPostTypes", 0);
    v49 = v48;
    v92 = v21;
    if (v43)
    {

      objc_msgSend(v4, "setHidden:", (unint64_t)objc_msgSend(v49, "count") < 2);
      v50 = [v49 allKeys];
      v109[0] = MEMORY[0x263EF8330];
      v109[1] = 3221225472;
      v109[2] = __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_2;
      v109[3] = &unk_264E5A830;
      v110 = &unk_26F0767B8;
      v51 = [v50 sortedArrayUsingComparator:v109];

      v107[0] = MEMORY[0x263EF8330];
      v107[1] = 3221225472;
      v107[2] = __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_3;
      v107[3] = &unk_264E5CF58;
      id v108 = v49;
      id v52 = v49;
      v27 = objc_msgSend(v51, "if_compactMap:", v107);

      v53 = v110;
      v7 = v96;
      id v6 = v97;
      v54 = v95;
      v55 = (void *)v41;
      v5 = v98;
    }
    else
    {
      v56 = [v48 objectForKey:@"attachment"];

      v57 = [(WFWordPressPostAction *)self parameterStateForKey:@"Type"];
      v90 = v56;
      v58 = [v56 labels];
      v59 = [v58 objectForKeyedSubscript:@"singular_name"];
      v91 = v57;
      v60 = [v57 value];
      unsigned int v61 = [v59 isEqual:v60];

      v62 = [v4 key];
      LODWORD(v59) = [v62 isEqualToString:@"Format"];

      if (v59)
      {
        v63 = (void *)MEMORY[0x263EFFA08];
        uint64_t v64 = objc_opt_class();
        v65 = objc_msgSend(v63, "setWithObjects:", v64, objc_opt_class(), 0);
        v5 = v98;
        v55 = v93;
        v66 = objc_msgSend(v98, "objectOfClasses:forKeyComponents:", v65, v93, @"WFWordPressPostFormats", 0);

        if ((unint64_t)[v66 count] < 2) {
          uint64_t v67 = 1;
        }
        else {
          uint64_t v67 = v61;
        }
        [v4 setHidden:v67];
        v68 = [v66 allKeys];
        v105[0] = MEMORY[0x263EF8330];
        v105[1] = 3221225472;
        v105[2] = __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_4;
        v105[3] = &unk_264E5A830;
        id v106 = &unk_26F0767D0;
        v69 = [v68 sortedArrayUsingComparator:v105];

        v103[0] = MEMORY[0x263EF8330];
        v103[1] = 3221225472;
        v103[2] = __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_5;
        v103[3] = &unk_264E5CF58;
        id v104 = v66;
        id v70 = v66;
        v27 = objc_msgSend(v69, "if_compactMap:", v103);

        v7 = v96;
        id v6 = v97;
        v54 = v95;
      }
      else
      {
        v71 = [v4 key];
        int v72 = [v71 isEqualToString:@"Status"];

        v54 = v95;
        v55 = v93;
        v5 = v98;
        if (v72)
        {
          v73 = (void *)MEMORY[0x263EFFA08];
          uint64_t v74 = objc_opt_class();
          v75 = objc_msgSend(v73, "setWithObjects:", v74, objc_opt_class(), 0);
          v76 = objc_msgSend(v98, "objectOfClasses:forKeyComponents:", v75, v93, @"WFWordPressPostStatuses", 0);

          if ((unint64_t)[v76 count] < 2) {
            uint64_t v77 = 1;
          }
          else {
            uint64_t v77 = v61;
          }
          [v4 setHidden:v77];
          v78 = [v76 allKeys];
          v101[0] = MEMORY[0x263EF8330];
          v101[1] = 3221225472;
          v101[2] = __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_6;
          v101[3] = &unk_264E5A830;
          id v102 = &unk_26F0767E8;
          v79 = [v78 sortedArrayUsingComparator:v101];

          v99[0] = MEMORY[0x263EF8330];
          v99[1] = 3221225472;
          v99[2] = __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_7;
          v99[3] = &unk_264E5CF58;
          id v100 = v76;
          id v80 = v76;
          v27 = objc_msgSend(v79, "if_compactMap:", v99);
        }
        else
        {
          v81 = [v4 key];
          int v82 = [v81 isEqualToString:@"Template"];

          if (v82)
          {
            v83 = (void *)MEMORY[0x263EFFA08];
            uint64_t v84 = objc_opt_class();
            v85 = objc_msgSend(v83, "setWithObjects:", v84, objc_opt_class(), 0);
            v86 = objc_msgSend(v98, "objectOfClasses:forKeyComponents:", v85, v93, @"WFWordPressPageTemplates", 0);

            if ((unint64_t)[v86 count] < 2) {
              uint64_t v87 = 1;
            }
            else {
              uint64_t v87 = v61;
            }
            [v4 setHidden:v87];
            v88 = [v86 allKeys];
            v27 = objc_msgSend(v88, "if_compactMap:", &__block_literal_global_376);
          }
          else
          {
            v27 = 0;
          }
        }
        v7 = v96;
        id v6 = v97;
      }
      id v52 = v90;
      v53 = v91;
    }

    v21 = v92;
  }

  return v27;
}

uint64_t __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = NSNumber;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v9 = NSNumber;
  uint64_t v10 = [*(id *)(a1 + 32) indexOfObject:v7];

  v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

id __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F86F00];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];

  id v7 = [v6 labels];
  id v8 = [v7 objectForKey:@"singular_name"];
  v9 = (void *)[v5 initWithValue:v8];

  return v9;
}

uint64_t __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSNumber;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v9 = NSNumber;
  uint64_t v10 = [*(id *)(a1 + 32) indexOfObject:v7];

  v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

id __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_5(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F86F00];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];

  id v7 = (void *)[v5 initWithValue:v6];
  return v7;
}

uint64_t __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSNumber;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v9 = NSNumber;
  uint64_t v10 = [*(id *)(a1 + 32) indexOfObject:v7];

  v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

id __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_7(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F86F00];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];

  id v7 = (void *)[v5 initWithValue:v6];
  return v7;
}

id __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke_8(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

id __54__WFWordPressPostAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 blogName];

  id v6 = (void *)[v4 initWithValue:v5];
  return v6;
}

- (id)defaultSerializedRepresentationForEnumeration:(id)a3
{
  id v3 = [(WFWordPressPostAction *)self possibleStatesForEnumeration:a3];
  id v4 = [v3 firstObject];
  id v5 = [v4 serializedRepresentation];

  return v5;
}

- (id)suggestedTagsForTagField:(id)a3
{
  v56[2] = *MEMORY[0x263EF8340];
  id v51 = a3;
  id v4 = +[WFDiskCache workflowCache];
  id v5 = [(WFWordPressPostAction *)self parameterForKey:@"WFAccount"];
  id v6 = [(WFWordPressPostAction *)self parameterStateForKey:@"WFAccount"];
  id v7 = [v6 value];
  v53 = v6;
  v54 = v5;
  if (v7)
  {
    id v8 = [v6 value];
    v9 = [v5 accountWithName:v8];
  }
  else
  {
    v9 = 0;
  }

  uint64_t v10 = [v9 username];
  id v52 = v9;
  v11 = [v9 endpointURL];
  uint64_t v12 = [v11 absoluteString];
  uint64_t v20 = WFDiskCacheKey(v10, v13, v14, v15, v16, v17, v18, v19, v12);

  v21 = [(WFWordPressPostAction *)self parameterStateForKey:@"Blog"];
  v22 = (void *)MEMORY[0x263EFFA08];
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v25 = objc_msgSend(v4, "objectOfClasses:forKeyComponents:", v24, v20, @"WFWordPressBlogs", 0);

  v26 = [v21 value];
  v49 = v25;
  v50 = v21;
  v27 = v4;
  if (v26)
  {
    v28 = [v21 value];
    v29 = [v25 objectMatchingKey:@"blogName" value:v28];
  }
  else
  {
    v29 = 0;
  }

  v30 = [v29 blogId];
  v31 = [v30 description];
  uint64_t v39 = WFDiskCacheKey(v20, v32, v33, v34, v35, v36, v37, v38, v31);

  v55[0] = @"Tags";
  v55[1] = @"Categories";
  v56[0] = @"WFWordPressPostTags";
  v56[1] = @"WFWordPressPostCategories";
  uint64_t v40 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
  uint64_t v41 = (void *)MEMORY[0x263EFFA08];
  uint64_t v42 = objc_opt_class();
  int v43 = objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
  v44 = [v51 key];

  uint64_t v45 = [v40 objectForKeyedSubscript:v44];
  uint64_t v46 = objc_msgSend(v27, "objectOfClasses:forKeyComponents:", v43, v39, v45, 0);
  v47 = objc_msgSend(v46, "if_compactMap:", &__block_literal_global_313);

  return v47;
}

uint64_t __50__WFWordPressPostAction_suggestedTagsForTagField___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (void)updateHiddenStates
{
  id v3 = +[WFDiskCache workflowCache];
  id v4 = [(WFWordPressPostAction *)self parameterForKey:@"WFAccount"];
  id v5 = [(WFWordPressPostAction *)self parameterStateForKey:@"WFAccount"];
  id v6 = [v5 value];
  v53 = v5;
  v54 = v4;
  if (v6)
  {
    id v7 = [v5 value];
    id v8 = [v4 accountWithName:v7];
  }
  else
  {
    id v8 = 0;
  }

  v9 = [v8 username];
  id v52 = v8;
  uint64_t v10 = [v8 endpointURL];
  v11 = [v10 absoluteString];
  uint64_t v19 = WFDiskCacheKey(v9, v12, v13, v14, v15, v16, v17, v18, v11);

  uint64_t v20 = [(WFWordPressPostAction *)self parameterStateForKey:@"Blog"];
  v21 = (void *)MEMORY[0x263EFFA08];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v24 = objc_msgSend(v3, "objectOfClasses:forKeyComponents:", v23, v19, @"WFWordPressBlogs", 0);

  v25 = [v20 value];
  v50 = v24;
  id v51 = v20;
  if (v25)
  {
    v26 = [v20 value];
    v27 = [v24 objectMatchingKey:@"blogName" value:v26];
  }
  else
  {
    v27 = 0;
  }

  v28 = [v27 blogId];
  v29 = [v28 description];
  v49 = WFDiskCacheKey(v19, v30, v31, v32, v33, v34, v35, v36, v29);

  uint64_t v37 = (void *)MEMORY[0x263EFFA08];
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v40 = objc_msgSend(v37, "setWithObjects:", v38, v39, objc_opt_class(), 0);
  uint64_t v41 = objc_msgSend(v3, "objectOfClasses:forKeyComponents:", v40, v49, @"WFWordPressPostTypes", 0);
  uint64_t v42 = [v41 objectForKey:@"attachment"];

  int v43 = [(WFWordPressPostAction *)self parameterStateForKey:@"Type"];
  v44 = [v42 labels];
  uint64_t v45 = [v44 objectForKeyedSubscript:@"singular_name"];
  uint64_t v46 = [v43 value];
  char v47 = [v45 isEqual:v46];

  v48 = [(WFWordPressPostAction *)self parameters];
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  void v55[2] = __43__WFWordPressPostAction_updateHiddenStates__block_invoke;
  v55[3] = &__block_descriptor_33_e28_v32__0__WFParameter_8Q16_B24l;
  char v56 = v47;
  [v48 enumerateObjectsUsingBlock:v55];
}

void __43__WFWordPressPostAction_updateHiddenStates__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 key];
  if ([v3 isEqualToString:@"WFAccount"]) {
    goto LABEL_4;
  }
  id v4 = [v7 key];
  if ([v4 isEqualToString:@"Blog"])
  {

LABEL_4:
    goto LABEL_5;
  }
  id v5 = [v7 key];
  char v6 = [v5 isEqualToString:@"Type"];

  if ((v6 & 1) == 0) {
    [v7 setHidden:*(unsigned __int8 *)(a1 + 32)];
  }
LABEL_5:
}

- (void)updatePossibleStates
{
  id v2 = [(WFWordPressPostAction *)self parameters];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_309];
}

void __45__WFWordPressPostAction_updatePossibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 reloadPossibleStates];
  }
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFWordPressPostAction;
  BOOL v7 = [(WFWordPressPostAction *)&v9 setParameterState:a3 forKey:v6];
  if (v7)
  {
    if ([v6 isEqualToString:@"Type"]) {
      [(WFWordPressPostAction *)self updateHiddenStates];
    }
    if (([v6 isEqualToString:@"WFAccount"] & 1) != 0
      || [v6 isEqualToString:@"Blog"])
    {
      [(WFWordPressPostAction *)self updatePossibleStates];
    }
  }

  return v7;
}

- (void)updateAccountMetadata
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v31 = +[WFDiskCache workflowCache];
  v28 = self;
  id v3 = [(WFWordPressPostAction *)self resourceManager];
  id v4 = [v3 resourceObjectsOfClass:objc_opt_class()];
  id v5 = [v4 anyObject];

  id v6 = dispatch_group_create();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v27 = v5;
  id obj = [v5 accounts];
  uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v30 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v11 = objc_alloc_init(WFWordPressSessionManager);
        uint64_t v12 = [v10 username];
        [(WFWordPressSessionManager *)v11 setUsername:v12];

        uint64_t v13 = [v10 password];
        [(WFWordPressSessionManager *)v11 setPassword:v13];

        uint64_t v14 = [v10 endpointURL];
        [(WFWordPressSessionManager *)v11 setEndpointURL:v14];

        uint64_t v15 = [v10 username];
        uint64_t v16 = [v10 endpointURL];
        uint64_t v17 = [v16 absoluteString];
        v25 = WFDiskCacheKey(v15, v18, v19, v20, v21, v22, v23, v24, v17);

        dispatch_group_enter(v6);
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke;
        v33[3] = &unk_264E5BD20;
        id v34 = v31;
        id v35 = v25;
        uint64_t v36 = v10;
        uint64_t v37 = v6;
        id v26 = v25;
        [(WFWordPressSessionManager *)v11 getBlogsWithCompletionHandler:v33];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v8);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_8;
  block[3] = &unk_264E5EE70;
  block[4] = v28;
  dispatch_group_notify(v6, MEMORY[0x263EF83A0], block);
}

void __46__WFWordPressPostAction_updateAccountMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v32 = a3;
  if (v5) {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyComponents:", v5, *(void *)(a1 + 40), @"WFWordPressBlogs", 0, v32);
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v34 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v60 != v34) {
          objc_enumerationMutation(obj);
        }
        objc_super v9 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        uint64_t v10 = objc_alloc_init(WFWordPressSessionManager);
        v11 = [*(id *)(a1 + 48) username];
        [(WFWordPressSessionManager *)v10 setUsername:v11];

        uint64_t v12 = [*(id *)(a1 + 48) password];
        [(WFWordPressSessionManager *)v10 setPassword:v12];

        uint64_t v13 = [v9 endpointURL];
        [(WFWordPressSessionManager *)v10 setEndpointURL:v13];

        uint64_t v14 = [v9 blogId];
        [(WFWordPressSessionManager *)v10 setBlogId:v14];

        uint64_t v15 = *(void **)(a1 + 40);
        uint64_t v16 = [v9 blogId];
        uint64_t v17 = [v16 description];
        v25 = WFDiskCacheKey(v15, v18, v19, v20, v21, v22, v23, v24, v17);

        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        void v55[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_2;
        v55[3] = &unk_264E58D00;
        id v56 = *(id *)(a1 + 32);
        id v26 = v25;
        id v57 = v26;
        id v58 = *(id *)(a1 + 56);
        [(WFWordPressSessionManager *)v10 getPostStatusesWithCompletionHandler:v55];
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_3;
        v51[3] = &unk_264E58D00;
        id v52 = *(id *)(a1 + 32);
        id v27 = v26;
        id v53 = v27;
        id v54 = *(id *)(a1 + 56);
        [(WFWordPressSessionManager *)v10 getPageTemplatesWithCompletionHandler:v51];
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_4;
        v47[3] = &unk_264E58D00;
        id v48 = *(id *)(a1 + 32);
        id v28 = v27;
        id v49 = v28;
        id v50 = *(id *)(a1 + 56);
        [(WFWordPressSessionManager *)v10 getPostTypesWithCompletionHandler:v47];
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_5;
        v43[3] = &unk_264E58D00;
        id v44 = *(id *)(a1 + 32);
        id v29 = v28;
        id v45 = v29;
        id v46 = *(id *)(a1 + 56);
        [(WFWordPressSessionManager *)v10 getPostFormatsWithCompletionHandler:v43];
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_6;
        v39[3] = &unk_264E5EBA0;
        id v40 = *(id *)(a1 + 32);
        id v30 = v29;
        id v41 = v30;
        id v42 = *(id *)(a1 + 56);
        [(WFWordPressSessionManager *)v10 getTermsForTaxonomy:@"category" completionHandler:v39];
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_7;
        v35[3] = &unk_264E5EBA0;
        id v36 = *(id *)(a1 + 32);
        id v37 = v30;
        id v38 = *(id *)(a1 + 56);
        id v31 = v30;
        [(WFWordPressSessionManager *)v10 getTermsForTaxonomy:@"post_tag" completionHandler:v35];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
    }
    while (v7);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) updateHiddenStates];
  id v2 = *(void **)(a1 + 32);
  return [v2 updatePossibleStates];
}

void __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyComponents:", a2, *(void *)(a1 + 40), @"WFWordPressPostStatuses", 0);
  }
  id v3 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v3);
}

void __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyComponents:", a2, *(void *)(a1 + 40), @"WFWordPressPageTemplates", 0);
  }
  id v3 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v3);
}

void __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyComponents:", a2, *(void *)(a1 + 40), @"WFWordPressPostTypes", 0);
  }
  id v3 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v3);
}

void __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyComponents:", a2, *(void *)(a1 + 40), @"WFWordPressPostFormats", 0);
  }
  id v3 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v3);
}

void __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyComponents:", a2, *(void *)(a1 + 40), @"WFWordPressPostCategories", 0);
  }
  id v3 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v3);
}

void __46__WFWordPressPostAction_updateAccountMetadata__block_invoke_7(uint64_t a1, uint64_t a2)
{
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyComponents:", a2, *(void *)(a1 + 40), @"WFWordPressPostTags", 0);
  }
  id v3 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v3);
}

- (void)wasRemovedFromWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFWordPressPostAction;
  [(WFWordPressPostAction *)&v5 wasRemovedFromWorkflow:a3];
  id v4 = [(WFWordPressPostAction *)self observer];
  +[WFAccount removeAccountObserver:v4];
}

- (void)wasAddedToWorkflow:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFWordPressPostAction;
  [(WFWordPressPostAction *)&v12 wasAddedToWorkflow:v4];
  [(WFWordPressPostAction *)self updateAccountMetadata];
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __44__WFWordPressPostAction_wasAddedToWorkflow___block_invoke;
  objc_super v9 = &unk_264E5B950;
  objc_copyWeak(&v10, &location);
  objc_super v5 = +[WFAccount addAccountObserver:&v6];
  -[WFWordPressPostAction setObserver:](self, "setObserver:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __44__WFWordPressPostAction_wasAddedToWorkflow___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateAccountMetadata];
}

- (void)initializeParameters
{
  v15[8] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)WFWordPressPostAction;
  [(WFWordPressPostAction *)&v13 initializeParameters];
  v15[0] = @"Blog";
  v15[1] = @"Type";
  v15[2] = @"Format";
  v15[3] = @"Status";
  v15[4] = @"Template";
  v15[5] = @"WFWordPressPostTags";
  v15[6] = @"Categories";
  v15[7] = @"Tags";
  [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[WFWordPressPostAction parameterForKey:](self, "parameterForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
          [v8 setDataSource:self];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }

  [(WFWordPressPostAction *)self updateHiddenStates];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v110 = a3;
  uint64_t v4 = +[WFDiskCache workflowCache];
  uint64_t v5 = [(WFWordPressPostAction *)self parameterForKey:@"WFAccount"];
  uint64_t v6 = [(WFWordPressPostAction *)self parameterValueForKey:@"WFAccount" ofClass:objc_opt_class()];
  v97 = v5;
  id v108 = [v5 accountWithName:v6];

  uint64_t v7 = [v108 username];
  uint64_t v8 = [v108 endpointURL];
  long long v9 = [v8 absoluteString];
  uint64_t v17 = WFDiskCacheKey(v7, v10, v11, v12, v13, v14, v15, v16, v9);

  uint64_t v18 = (void *)MEMORY[0x263EFFA08];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v98 = v4;
  uint64_t v21 = objc_msgSend(v4, "objectOfClasses:forKeyComponents:", v20, v17, @"WFWordPressBlogs", 0);

  uint64_t v22 = [(WFWordPressPostAction *)self parameterValueForKey:@"Blog" ofClass:objc_opt_class()];
  v95 = v21;
  id v106 = [v21 objectMatchingKey:@"blogName" value:v22];

  uint64_t v23 = [v106 blogId];
  uint64_t v24 = [v23 description];
  v96 = v17;
  uint64_t v32 = WFDiskCacheKey(v17, v25, v26, v27, v28, v29, v30, v31, v24);

  uint64_t v33 = [(WFWordPressPostAction *)self parameterValueForKey:@"Type" ofClass:objc_opt_class()];
  uint64_t v34 = +[WFDiskCache workflowCache];
  id v35 = (void *)MEMORY[0x263EFFA08];
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  id v38 = objc_msgSend(v35, "setWithObjects:", v36, v37, objc_opt_class(), 0);
  long long v39 = objc_msgSend(v34, "objectOfClasses:forKeyComponents:", v38, v32, @"WFWordPressPostTypes", 0);

  v93 = v39;
  id v40 = [v39 allValues];
  v138[0] = MEMORY[0x263EF8330];
  v138[1] = 3221225472;
  v138[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke;
  v138[3] = &unk_264E58B70;
  id v92 = v33;
  id v139 = v92;
  id v41 = objc_msgSend(v40, "if_compactMap:", v138);
  id v104 = [v41 firstObject];

  id v42 = [(WFWordPressPostAction *)self parameterValueForKey:@"Format" ofClass:objc_opt_class()];
  uint64_t v43 = +[WFDiskCache workflowCache];
  id v44 = (void *)MEMORY[0x263EFFA08];
  uint64_t v45 = objc_opt_class();
  id v46 = objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
  char v47 = objc_msgSend(v43, "objectOfClasses:forKeyComponents:", v46, v32, @"WFWordPressPostFormats", 0);

  v136[0] = MEMORY[0x263EF8330];
  v136[1] = 3221225472;
  v136[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_2;
  v136[3] = &unk_264E58B98;
  id v90 = v42;
  v91 = v47;
  id v137 = v90;
  id v48 = [v47 keysOfEntriesPassingTest:v136];
  id v102 = [v48 anyObject];

  id v49 = [(WFWordPressPostAction *)self parameterValueForKey:@"Status" ofClass:objc_opt_class()];
  id v50 = +[WFDiskCache workflowCache];
  id v51 = (void *)MEMORY[0x263EFFA08];
  uint64_t v52 = objc_opt_class();
  id v53 = objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
  id v54 = objc_msgSend(v50, "objectOfClasses:forKeyComponents:", v53, v32, @"WFWordPressPostStatuses", 0);

  v134[0] = MEMORY[0x263EF8330];
  v134[1] = 3221225472;
  v134[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_3;
  v134[3] = &unk_264E58B98;
  id v88 = v49;
  v89 = v54;
  id v135 = v88;
  v55 = [v54 keysOfEntriesPassingTest:v134];
  id v100 = [v55 anyObject];

  uint64_t v56 = [(WFWordPressPostAction *)self parameterValueForKey:@"Template" ofClass:objc_opt_class()];
  id v57 = +[WFDiskCache workflowCache];
  id v58 = (void *)MEMORY[0x263EFFA08];
  uint64_t v59 = objc_opt_class();
  long long v60 = objc_msgSend(v58, "setWithObjects:", v59, objc_opt_class(), 0);
  v94 = (void *)v32;
  long long v61 = objc_msgSend(v57, "objectOfClasses:forKeyComponents:", v60, v32, @"WFWordPressPageTemplates", 0);

  v86 = v61;
  uint64_t v87 = (void *)v56;
  v99 = [v61 objectForKey:v56];
  long long v62 = [(WFWordPressPostAction *)self parameterValueForKey:@"Title" ofClass:objc_opt_class()];
  v63 = [(WFWordPressPostAction *)self parameterValueForKey:@"Excerpt" ofClass:objc_opt_class()];
  uint64_t v64 = [(WFWordPressPostAction *)self parameterValueForKey:@"Slug" ofClass:objc_opt_class()];
  v65 = [(WFWordPressPostAction *)self parameterValueForKey:@"AllowComments" ofClass:objc_opt_class()];
  char v66 = [v65 BOOLValue];

  uint64_t v67 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@","];
  v68 = [(WFWordPressPostAction *)self parameterValueForKey:@"Tags" ofClass:objc_opt_class()];
  v69 = [v68 componentsSeparatedByCharactersInSet:v67];

  id v70 = objc_msgSend(v69, "if_compactMap:", &__block_literal_global_20404);

  v71 = [(WFWordPressPostAction *)self parameterValueForKey:@"Categories" ofClass:objc_opt_class()];
  v85 = (void *)v67;
  int v72 = [v71 componentsSeparatedByCharactersInSet:v67];

  v73 = objc_msgSend(v72, "if_compactMap:", &__block_literal_global_274);

  uint64_t v74 = [(WFWordPressPostAction *)self parameterValueForKey:@"CustomFields" ofClass:objc_opt_class()];
  v132[0] = 0;
  v132[1] = v132;
  v132[2] = 0x3032000000;
  v132[3] = __Block_byref_object_copy__20406;
  v132[4] = __Block_byref_object_dispose__20407;
  id v133 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_275;
  aBlock[3] = &unk_264E58CB0;
  id v109 = v108;
  id v116 = v109;
  id v107 = v106;
  id v117 = v107;
  id v105 = v104;
  id v118 = v105;
  id v111 = v110;
  id v119 = v111;
  v120 = self;
  id v75 = v62;
  id v121 = v75;
  v130 = v132;
  id v103 = v102;
  id v122 = v103;
  id v101 = v100;
  id v123 = v101;
  char v131 = v66;
  id v76 = v64;
  id v124 = v76;
  id v77 = v63;
  id v125 = v77;
  id v78 = v99;
  id v126 = v78;
  id v79 = v70;
  id v127 = v79;
  id v80 = v73;
  id v128 = v80;
  id v81 = v74;
  id v129 = v81;
  int v82 = (void (**)(void))_Block_copy(aBlock);
  v83 = [(WFWordPressPostAction *)self parameterValueForKey:@"Date" ofClass:objc_opt_class()];
  if ([v83 length])
  {
    uint64_t v84 = [MEMORY[0x263F337C8] itemWithObject:v83];
    v112[0] = MEMORY[0x263EF8330];
    v112[1] = 3221225472;
    v112[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_14;
    v112[3] = &unk_264E58CD8;
    v114 = v132;
    v113 = v82;
    [v84 getObjectRepresentation:v112 forClass:objc_opt_class()];
  }
  else
  {
    v82[2](v82);
  }

  _Block_object_dispose(v132, 8);
}

id __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 labels];
  uint64_t v5 = [v4 objectForKey:@"singular_name"];
  if ([v5 isEqualToString:*(void *)(a1 + 32)]) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

uint64_t __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isEqualToString:*(void *)(a1 + 32)];
}

uint64_t __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isEqualToString:*(void *)(a1 + 32)];
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_275(uint64_t a1)
{
  v37[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(WFWordPressSessionManager);
  id v3 = [*(id *)(a1 + 32) username];
  [(WFWordPressSessionManager *)v2 setUsername:v3];

  uint64_t v4 = [*(id *)(a1 + 32) password];
  [(WFWordPressSessionManager *)v2 setPassword:v4];

  uint64_t v5 = [*(id *)(a1 + 40) endpointURL];
  if (v5)
  {
    [(WFWordPressSessionManager *)v2 setEndpointURL:v5];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) endpointURL];
    [(WFWordPressSessionManager *)v2 setEndpointURL:v6];
  }
  id v7 = [*(id *)(a1 + 40) blogId];
  [(WFWordPressSessionManager *)v2 setBlogId:v7];

  uint64_t v8 = [*(id *)(a1 + 48) name];
  int v9 = [v8 isEqualToString:@"attachment"];

  if (v9)
  {
    uint64_t v10 = *(void **)(a1 + 56);
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_2_280;
    v34[3] = &unk_264E5B908;
    uint64_t v12 = *(void *)(a1 + 64);
    id v35 = v2;
    uint64_t v36 = v12;
    uint64_t v13 = v2;
    [v10 generateCollectionByCoercingToItemClasses:v11 completionHandler:v34];

    uint64_t v14 = v35;
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v15 = *(void **)(a1 + 64);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_7;
    v20[3] = &unk_264E58C88;
    v20[4] = v15;
    uint64_t v21 = v2;
    id v22 = *(id *)(a1 + 72);
    id v17 = *(id *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 144);
    id v23 = v17;
    uint64_t v32 = v18;
    id v24 = *(id *)(a1 + 80);
    id v25 = *(id *)(a1 + 88);
    char v33 = *(unsigned char *)(a1 + 152);
    id v26 = *(id *)(a1 + 96);
    id v27 = *(id *)(a1 + 104);
    id v28 = *(id *)(a1 + 112);
    id v29 = *(id *)(a1 + 120);
    id v30 = *(id *)(a1 + 128);
    id v31 = *(id *)(a1 + 136);
    uint64_t v19 = v2;
    [v15 generateHTMLFromInput:v16 completionHandler:v20];

    uint64_t v14 = v21;
  }
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_14(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_2_280(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_3_281;
  v5[3] = &unk_264E59DC8;
  id v6 = *(id *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_6;
  v4[3] = &unk_264E5E840;
  v4[4] = *(void *)(a1 + 40);
  [a2 transformFileRepresentationsForType:0 usingBlock:v5 completionHandler:v4];
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_8;
    aBlock[3] = &unk_264E58C60;
    id v20 = *(id *)(a1 + 40);
    id v21 = *(id *)(a1 + 48);
    id v22 = v5;
    id v6 = *(id *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 128);
    id v23 = v6;
    uint64_t v33 = v7;
    id v24 = *(id *)(a1 + 64);
    id v25 = *(id *)(a1 + 72);
    char v34 = *(unsigned char *)(a1 + 136);
    id v26 = *(id *)(a1 + 80);
    id v27 = *(id *)(a1 + 88);
    id v28 = *(id *)(a1 + 96);
    id v29 = *(id *)(a1 + 104);
    id v30 = *(id *)(a1 + 112);
    id v8 = *(id *)(a1 + 120);
    uint64_t v9 = *(void *)(a1 + 32);
    id v31 = v8;
    uint64_t v32 = v9;
    uint64_t v10 = _Block_copy(aBlock);
    uint64_t v11 = [*(id *)(a1 + 32) parameterValueForKey:@"ThumbnailImage" ofClass:objc_opt_class()];
    if (v11)
    {
      uint64_t v12 = objc_opt_class();
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_11;
      v15[3] = &unk_264E5B610;
      id v18 = v10;
      id v13 = *(id *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 32);
      id v16 = v13;
      uint64_t v17 = v14;
      [v11 generateCollectionByCoercingToItemClass:v12 completionHandler:v15];
    }
    else
    {
      (*((void (**)(void *, void))v10 + 2))(v10, 0);
    }
  }
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_8(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  char v9 = *(unsigned char *)(a1 + 144);
  long long v13 = *(_OWORD *)(a1 + 96);
  long long v14 = *(_OWORD *)(a1 + 80);
  uint64_t v10 = *(void *)(a1 + 112);
  uint64_t v11 = *(void *)(a1 + 120);
  uint64_t v15 = *(void *)(a1 + 40);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_9;
  v16[3] = &unk_264E58C38;
  v16[4] = *(void *)(a1 + 128);
  id v17 = v3;
  LOBYTE(v12) = v9;
  objc_msgSend(v17, "createPostWithTitle:content:type:date:format:status:allowingComments:name:excerpt:template:tags:categories:thumbnailId:customFields:completionHandler:", v15, v4, v5, v6, v7, v8, v12, v14, v13, v10, a2, v11, v16);
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_11(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_12;
  v6[3] = &unk_264E5DB78;
  id v9 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 getFileRepresentation:v6 forType:0];
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_12(void *a1, uint64_t a2)
{
  if (a2)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_13;
    v6[3] = &unk_264E58BE8;
    id v3 = (void *)a1[4];
    id v4 = (void *)a1[6];
    void v6[4] = a1[5];
    id v7 = v4;
    [v3 uploadFile:a2 completionHandler:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(a1[6] + 16);
    v5();
  }
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "finishRunningWithError:");
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [a2 fileId];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

uint64_t __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_9(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_10;
    v5[3] = &unk_264E58C10;
    id v2 = *(void **)(a1 + 40);
    void v5[4] = *(void *)(a1 + 32);
    return [v2 getPost:a2 completionHandler:v5];
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    return objc_msgSend(v4, "finishRunningWithError:");
  }
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [v9 link];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) output];
    uint64_t v8 = [v9 link];
    [v7 addObject:v8];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v5];
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_3_281(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_4_282;
  v9[3] = &unk_264E58BE8;
  id v11 = v6;
  id v10 = v7;
  id v8 = v6;
  [v10 uploadFile:a2 completionHandler:v9];
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_4_282(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [a2 fileId];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_5_283;
    v6[3] = &unk_264E58BC0;
    id v7 = *(id *)(a1 + 40);
    [v3 getPost:v4 completionHandler:v6];
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

void __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_5_283(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 link];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

id __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F08708];
  id v3 = a2;
  uint64_t v4 = [v2 whitespaceAndNewlineCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return v5;
}

id __52__WFWordPressPostAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F08708];
  id v3 = a2;
  uint64_t v4 = [v2 whitespaceAndNewlineCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return v5;
}

- (void)generateHTMLFromInput:(id)a3 completionHandler:(id)a4
{
  v12[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke;
  v10[3] = &unk_264E5D218;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 generateCollectionByCoercingToItemClasses:v8 completionHandler:v10];
}

void __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  id v5 = [v3 items];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_2;
  v13[3] = &unk_264E5A948;
  id v6 = v4;
  uint64_t v7 = *(void *)(a1 + 32);
  id v14 = v6;
  uint64_t v15 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_7;
  v10[3] = &unk_264E5E980;
  id v8 = *(id *)(a1 + 40);
  id v11 = v6;
  id v12 = v8;
  id v9 = v6;
  objc_msgSend(v5, "if_enumerateAsynchronouslyInSequence:completionHandler:", v13, v10);
}

void __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_3;
    v18[3] = &unk_264E58B40;
    id v19 = *(id *)(a1 + 32);
    id v20 = v7;
    [v6 getObjectRepresentation:v18 forClass:objc_opt_class()];

    id v8 = v19;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_4;
      v15[3] = &unk_264E5E098;
      id v17 = v7;
      id v16 = *(id *)(a1 + 32);
      id v9 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB00]];
      [v6 getFileRepresentation:v15 forType:v9];

      id v8 = v17;
    }
    else
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_5;
      v12[3] = &unk_264E5DB78;
      int8x16_t v11 = *(int8x16_t *)(a1 + 32);
      id v10 = (id)v11.i64[0];
      int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
      id v14 = v7;
      [v6 getFileRepresentation:v12 forType:0];

      id v8 = (void *)v13.i64[1];
    }
  }
}

uint64_t __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  [v6 appendString:a2];
  [*(id *)(a1 + 32) appendString:@"\n"];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v26 = a3;
  id v5 = [a2 mappedData];
  uint64_t v6 = [v5 length];
  if (v26 || !v6)
  {
    id v17 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v7 = v5;
    Memory = htmlReadMemory((const char *)[v7 bytes], objc_msgSend(v7, "length"), 0, 0, 2049);
    if (Memory)
    {
      id v9 = (xmlDoc *)Memory;
      xmlNodePtr RootElement = xmlDocGetRootElement(Memory);
      if (RootElement)
      {
        xmlNodePtr v11 = RootElement;
        id v12 = [NSString stringWithUTF8String:RootElement->name];
        int v13 = [v12 isEqualToString:@"html"];

        if (v13)
        {
          xmlNodePtr children = v11->children;
          if (children)
          {
            while (1)
            {
              uint64_t v15 = [NSString stringWithUTF8String:children->name];
              int v16 = [v15 isEqualToString:@"body"];

              if (v16) {
                break;
              }
              xmlNodePtr children = xmlNextElementSibling(children);
              if (!children) {
                goto LABEL_9;
              }
            }
            xmlDocSetRootElement(v9, children);
          }
          else
          {
LABEL_9:
            xmlNodePtr children = v11;
          }
          for (uint64_t i = children->children; i; uint64_t i = xmlNextElementSibling(i))
          {
            xmlBufferPtr v21 = xmlBufferCreate();
            xmlNodeDump(v21, v9, i, 0, 0);
            id v22 = xmlBufferContent(v21);
            int v23 = xmlBufferLength(v21);
            id v24 = *(void **)(a1 + 32);
            id v25 = (void *)[[NSString alloc] initWithBytes:v22 length:v23 encoding:4];
            [v24 appendString:v25];

            xmlBufferFree(v21);
          }
        }
        else
        {
          id v18 = *(void **)(a1 + 32);
          id v19 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
          [v18 appendString:v19];
        }
        [*(id *)(a1 + 32) appendString:@"\n"];
      }
      xmlFreeDoc(v9);
    }
    id v17 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v17();
}

void __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_5(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[WFDiskCache workflowCache];
  id v5 = [a1[4] parameterForKey:@"WFAccount"];
  uint64_t v6 = [a1[4] parameterValueForKey:@"WFAccount" ofClass:objc_opt_class()];
  id v7 = [v5 accountWithName:v6];

  id v8 = [v7 username];
  id v9 = [v7 endpointURL];
  id v10 = [v9 absoluteString];
  id v18 = WFDiskCacheKey(v8, v11, v12, v13, v14, v15, v16, v17, v10);

  id v19 = (void *)MEMORY[0x263EFFA08];
  uint64_t v20 = objc_opt_class();
  xmlBufferPtr v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  id v22 = objc_msgSend(v4, "objectOfClasses:forKeyComponents:", v21, v18, @"WFWordPressBlogs", 0);

  int v23 = [a1[4] parameterValueForKey:@"Blog" ofClass:objc_opt_class()];
  id v24 = [v22 objectMatchingKey:@"blogName" value:v23];

  id v25 = objc_alloc_init(WFWordPressSessionManager);
  id v26 = [v7 username];
  [(WFWordPressSessionManager *)v25 setUsername:v26];

  id v27 = [v7 password];
  [(WFWordPressSessionManager *)v25 setPassword:v27];

  id v28 = [v24 endpointURL];
  [(WFWordPressSessionManager *)v25 setEndpointURL:v28];

  id v29 = [v24 blogId];
  [(WFWordPressSessionManager *)v25 setBlogId:v29];

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_6;
  v30[3] = &unk_264E58BE8;
  id v31 = a1[5];
  id v32 = a1[6];
  [(WFWordPressSessionManager *)v25 uploadFile:v3 completionHandler:v30];
}

void __65__WFWordPressPostAction_generateHTMLFromInput_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v7 = [v6 url];
    id v8 = [v7 absoluteString];
    id v9 = [v8 stringByEncodingHTMLEntities];
    id v10 = [v6 filename];

    uint64_t v11 = [v10 stringByEncodingHTMLEntities];
    [v5 appendFormat:@"<img src=\"%@\" alt=\"%@\">\n", v9, v11];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end