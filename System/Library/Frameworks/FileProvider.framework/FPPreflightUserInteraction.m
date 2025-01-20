@interface FPPreflightUserInteraction
+ (id)evaluationObjectsForAction:(id)a3 sourceItems:(id)a4 destinationItem:(id)a5 domainUserInfo:(id)a6 sourceItemKeysAllowList:(id)a7 destinationItemKeysAllowList:(id)a8;
+ (id)gatherErrorsForInteractions:(id)a3 evaluationObjects:(id)a4 suppressionDelegate:(id)a5;
+ (id)interactionFromDictionary:(id)a3 localizationLookup:(id)a4 providerIdentifier:(id)a5 domainIdentifier:(id)a6;
+ (id)interactionsForArray:(id)a3 localizationLookup:(id)a4 providerIdentifier:(id)a5 domainIdentifier:(id)a6;
+ (id)interactionsForBundle:(id)a3 providerIdentifier:(id)a4 domainIdentifier:(id)a5;
+ (id)interactionsForProviderItem:(id)a3 error:(id *)a4;
+ (id)userInteractionErrorsInInfoPlistDict:(id)a3 forAction:(id)a4 bundleID:(id)a5 hierarchyServicer:(id)a6 sourceNSFPItems:(id)a7 destinationNSFPItem:(id)a8 localizationLookup:(id)a9 provider:(id)a10 domain:(id)a11 extensionCapabilities:(unint64_t)a12 useFPFS:(BOOL)a13;
+ (void)propagateConfigurationKeysDownInteractionTreeWithObject:(id)a3 key:(id)a4 value:(id)a5;
- (BOOL)hasSuppressionIdentifier;
- (FPPreflightUserInteractionAlert)alert;
- (NSArray)subInteractions;
- (NSPredicate)predicate;
- (NSString)domainIdentifier;
- (NSString)helpURL;
- (NSString)providerIdentifier;
- (NSString)userInteractionIdentifier;
- (id)_evaluateWithObjectsByName:(id)a3 sourceItems:(id)a4 suppressionDelegate:(id)a5 errorIndex:(unint64_t *)a6;
- (id)description;
- (id)evaluateWithObjectsByName:(id)a3 suppressionDelegate:(id)a4;
- (void)setAlert:(id)a3;
- (void)setDomainIdentifier:(id)a3;
- (void)setHasSuppressionIdentifier:(BOOL)a3;
- (void)setHelpURL:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setSubInteractions:(id)a3;
- (void)setUserInteractionIdentifier:(id)a3;
@end

@implementation FPPreflightUserInteraction

+ (id)interactionFromDictionary:(id)a3 localizationLookup:(id)a4 providerIdentifier:(id)a5 domainIdentifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = 0;
    goto LABEL_34;
  }
  v13 = [v9 objectForKey:@"ActivationRule"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [v9 objectForKey:@"SuppressionIdentifier"];
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = fp_current_or_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          +[FPPreflightUserInteraction interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:].cold.5(v17, v22, v23, v24, v25, v26, v27, v28);
        }
        v16 = 0;
        goto LABEL_32;
      }
      BOOL v15 = [v14 length] != 0;
    }
    else
    {
      BOOL v15 = 0;
    }
    v17 = [v9 objectForKey:@"HelpURL"];
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v29 = fp_current_or_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          +[FPPreflightUserInteraction interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:].cold.4(v29, v30, v31, v32, v33, v34, v35, v36);
        }
        v16 = 0;
        goto LABEL_31;
      }
      v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v17 encodingInvalidCharacters:0];
      if (!v18)
      {

        v17 = 0;
      }
    }
    uint64_t v19 = [v9 objectForKey:@"Alert"];
    uint64_t v42 = +[FPPreflightUserInteractionAlert alertFromDictionary:v19 localizationLookup:v10];
    uint64_t v20 = [v9 objectForKey:@"SubInteractions"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v20 = 0;
    }
    v41 = v19;
    if (v42 | v20)
    {
      if (![v13 containsString:@"%"])
      {
        v37 = objc_opt_new();
        [v37 setProviderIdentifier:v11];
        [v37 setDomainIdentifier:v12];
        [v37 setAlert:v42];
        [v37 setHasSuppressionIdentifier:v15];
        [v37 setHelpURL:v17];
        [v37 setUserInteractionIdentifier:v14];
        v40 = [MEMORY[0x1E4F28F60] predicateWithFormat:v13 argumentArray:0];
        [v37 setPredicate:v40];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __111__FPPreflightUserInteraction_interactionFromDictionary_localizationLookup_providerIdentifier_domainIdentifier___block_invoke;
        v43[3] = &unk_1E5AF33C0;
        id v44 = v14;
        v45 = v17;
        id v46 = v10;
        id v47 = v11;
        id v48 = v12;
        v38 = objc_msgSend((id)v20, "fp_map:", v43);
        [v37 setSubInteractions:v38];

        v21 = v37;
        v16 = v21;
        goto LABEL_30;
      }
      v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[FPPreflightUserInteraction interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:]();
      }
    }
    else
    {
      v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[FPPreflightUserInteraction interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:]((uint64_t)v9, v21);
      }
    }
    v16 = 0;
LABEL_30:

    v29 = v41;
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
  v16 = 0;
LABEL_33:

LABEL_34:

  return v16;
}

id __111__FPPreflightUserInteraction_interactionFromDictionary_localizationLookup_providerIdentifier_domainIdentifier___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (a1[4] || a1[5])
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v3];
    +[FPPreflightUserInteraction propagateConfigurationKeysDownInteractionTreeWithObject:v5 key:@"SuppressionIdentifier" value:a1[4]];
    +[FPPreflightUserInteraction propagateConfigurationKeysDownInteractionTreeWithObject:v5 key:@"HelpURL" value:a1[5]];
  }
  else
  {
    id v5 = v3;
  }
  v6 = +[FPPreflightUserInteraction interactionFromDictionary:v5 localizationLookup:a1[6] providerIdentifier:a1[7] domainIdentifier:a1[8]];

  return v6;
}

+ (void)propagateConfigurationKeysDownInteractionTreeWithObject:(id)a3 key:(id)a4 value:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v10 objectForKey:v7];

  if (!v9) {
    [v10 setValue:v8 forKey:v7];
  }
}

+ (id)interactionsForBundle:(id)a3 providerIdentifier:(id)a4 domainIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v10 objectForInfoDictionaryKey:@"NSExtension"];
  id v12 = objc_opt_new();
  [v12 setTableNames:&unk_1EF6C3A28];
  [v12 setBundle:v10];

  v13 = [v11 objectForKeyedSubscript:@"NSFileProviderUserInteractions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [a1 interactionsForArray:v13 localizationLookup:v12 providerIdentifier:v8 domainIdentifier:v9];
  }
  else
  {
    BOOL v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[FPPreflightUserInteraction interactionsForBundle:providerIdentifier:domainIdentifier:]();
    }

    v14 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

+ (id)interactionsForArray:(id)a3 localizationLookup:(id)a4 providerIdentifier:(id)a5 domainIdentifier:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __106__FPPreflightUserInteraction_interactionsForArray_localizationLookup_providerIdentifier_domainIdentifier___block_invoke;
  v17[3] = &unk_1E5AF33E8;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  BOOL v15 = objc_msgSend(a3, "fp_map:", v17);

  return v15;
}

id __106__FPPreflightUserInteraction_interactionsForArray_localizationLookup_providerIdentifier_domainIdentifier___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = +[FPPreflightUserInteraction interactionFromDictionary:v3 localizationLookup:a1[4] providerIdentifier:a1[5] domainIdentifier:a1[6]];
  }
  else
  {
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __106__FPPreflightUserInteraction_interactionsForArray_localizationLookup_providerIdentifier_domainIdentifier___block_invoke_cold_1();
    }

    v4 = 0;
  }

  return v4;
}

- (id)evaluateWithObjectsByName:(id)a3 suppressionDelegate:(id)a4
{
  uint64_t v11 = 0;
  id v6 = a4;
  id v7 = (void *)[a3 mutableCopy];
  id v8 = [v7 objectForKey:@"sourceItems"];
  [v7 removeObjectForKey:@"sourceItems"];
  id v9 = [(FPPreflightUserInteraction *)self _evaluateWithObjectsByName:v7 sourceItems:v8 suppressionDelegate:v6 errorIndex:&v11];

  return v9;
}

- (id)_evaluateWithObjectsByName:(id)a3 sourceItems:(id)a4 suppressionDelegate:(id)a5 errorIndex:(unint64_t *)a6
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v88 = a4;
  id v87 = a5;
  v84 = a6;
  ++*a6;
  v89 = objc_opt_new();
  v86 = v9;
  id v10 = (void *)[v9 mutableCopy];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v88, "count"));
  [v10 setObject:v11 forKeyedSubscript:@"sourceItemsCount"];

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v12 = v88;
  char v13 = 0;
  uint64_t v14 = [v12 countByEnumeratingWithState:&v101 objects:v107 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v102 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v101 + 1) + 8 * i);
        [v10 setObject:v17 forKeyedSubscript:@"sourceItem"];
        id v18 = [(FPPreflightUserInteraction *)self predicate];
        int v19 = [v18 evaluateWithObject:v10];

        if (v19)
        {
          [v89 addObject:v17];
          char v13 = 1;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v101 objects:v107 count:16];
    }
    while (v14);
  }

  if ([v12 count])
  {

    if (v13)
    {
LABEL_12:
      id v20 = objc_opt_new();
      v21 = [(FPPreflightUserInteraction *)self subInteractions];
      uint64_t v22 = [v21 count];

      if (v22)
      {
        uint64_t v23 = [(FPPreflightUserInteraction *)self subInteractions];
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = __100__FPPreflightUserInteraction__evaluateWithObjectsByName_sourceItems_suppressionDelegate_errorIndex___block_invoke;
        v95[3] = &unk_1E5AF3410;
        id v96 = v86;
        id v97 = v89;
        id v98 = v87;
        v100 = v84;
        id v99 = v20;
        [v23 enumerateObjectsUsingBlock:v95];
      }
      uint64_t v24 = [(FPPreflightUserInteraction *)self alert];
      if (v24)
      {
        v85 = (void *)[v86 mutableCopy];
        if ([v89 count])
        {
          uint64_t v25 = [v89 firstObject];
          [v85 setObject:v25 forKeyedSubscript:@"firstMatchingItem"];

          uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v89, "count"));
          [v85 setObject:v26 forKeyedSubscript:@"matchingItemsCount"];

          if ((unint64_t)[v89 count] >= 2)
          {
            uint64_t v27 = [v89 objectAtIndex:1];
            [v85 setObject:v27 forKeyedSubscript:@"secondMatchingItem"];

            uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v89, "count") - 1);
            [v85 setObject:v28 forKeyedSubscript:@"matchingItemsCountMinusOne"];

            if ((unint64_t)[v89 count] >= 3)
            {
              v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v89, "count") - 2);
              [v85 setObject:v29 forKeyedSubscript:@"matchingItemsCountMinusTwo"];
            }
          }
        }
        uint64_t v30 = [v24 cancelCaptionFormat];
        id v94 = 0;
        v83 = [v30 evaluateWithValuesByName:v85 error:&v94];
        id v31 = v94;

        if (!v83)
        {
          if (v31)
          {
            uint64_t v32 = fp_current_or_default_log();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              -[FPPreflightUserInteraction _evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:].cold.5(v31);
            }
          }
          v83 = FPLocalizedErrorStringForKey(@"Preflight-Cancel");
        }
        uint64_t v33 = [(FPPreflightUserInteraction *)self alert];
        int v34 = [v33 enableContinue];

        if (v34)
        {

          uint64_t v35 = [v24 continueCaptionFormat];
          id v93 = 0;
          uint64_t v36 = [v35 evaluateWithValuesByName:v85 error:&v93];
          id v31 = v93;

          if (!v36)
          {
            if (v31)
            {
              v37 = fp_current_or_default_log();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
                -[FPPreflightUserInteraction _evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:].cold.4(v31);
              }
            }
            uint64_t v36 = FPLocalizedErrorStringForKey(@"Preflight-Continue");
          }
          v106[0] = v83;
          v106[1] = v36;
          v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:2];
        }
        else
        {
          v105 = v83;
          v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
        }
        BOOL v42 = [(FPPreflightUserInteraction *)self hasSuppressionIdentifier];
        if (v87) {
          BOOL v43 = v42;
        }
        else {
          BOOL v43 = 0;
        }
        int v44 = ![(FPPreflightUserInteraction *)self hasSuppressionIdentifier];
        if (v87) {
          LOBYTE(v44) = 1;
        }
        if ((v44 & 1) == 0)
        {
          v45 = fp_current_or_default_log();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            -[FPPreflightUserInteraction _evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:](v45, v46, v47, v48, v49, v50, v51, v52);
          }
        }
        v53 = objc_opt_new();

        v54 = [v24 titleFormat];
        id v92 = 0;
        v55 = [v54 evaluateWithValuesByName:v85 error:&v92];
        id v56 = v92;
        uint64_t v57 = *MEMORY[0x1E4F28568];
        [v53 setObject:v55 forKeyedSubscript:*MEMORY[0x1E4F28568]];

        v58 = [v53 objectForKeyedSubscript:v57];
        if (v58) {
          BOOL v59 = 1;
        }
        else {
          BOOL v59 = v56 == 0;
        }
        int v60 = !v59;

        if (v60)
        {
          v61 = fp_current_or_default_log();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
            -[FPPreflightUserInteraction _evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:](v56);
          }
        }
        v62 = [v24 subtitleFormat];
        id v91 = 0;
        v63 = [v62 evaluateWithValuesByName:v85 error:&v91];
        id v64 = v91;
        uint64_t v65 = *MEMORY[0x1E4F285A0];
        [v53 setObject:v63 forKeyedSubscript:*MEMORY[0x1E4F285A0]];

        v66 = [v53 objectForKeyedSubscript:v65];
        if (v66) {
          BOOL v67 = 1;
        }
        else {
          BOOL v67 = v64 == 0;
        }
        int v68 = !v67;

        if (v68)
        {
          v69 = fp_current_or_default_log();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
            -[FPPreflightUserInteraction _evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:](v64);
          }
        }
        [v53 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F28590]];
        v70 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v24, "continueIsDestructive"));
        [v53 setObject:v70 forKeyedSubscript:@"NSFileProviderDestructiveRecoveryKey"];

        v71 = [(FPPreflightUserInteraction *)self providerIdentifier];
        [v53 setObject:v71 forKeyedSubscript:@"ProviderIdentifier"];

        v72 = [NSNumber numberWithUnsignedInteger:*v84];
        [v53 setObject:v72 forKeyedSubscript:@"PreflightIndex"];

        v73 = [NSNumber numberWithBool:v43];
        [v53 setObject:v73 forKeyedSubscript:@"FPCanBeSuppressed"];

        v74 = [(FPPreflightUserInteraction *)self helpURL];
        [v53 setObject:v74 forKeyedSubscript:@"FPHelpURL"];

        if ([(FPPreflightUserInteraction *)self hasSuppressionIdentifier])
        {
          v75 = NSNumber;
          v76 = [(FPPreflightUserInteraction *)self userInteractionIdentifier];
          v77 = objc_msgSend(v75, "numberWithBool:", objc_msgSend(v87, "isInteractionSuppressedForIdentifier:", v76));
          [v53 setObject:v77 forKeyedSubscript:@"FPIsSuppressed"];

          v78 = [(FPPreflightUserInteraction *)self userInteractionIdentifier];
          [v53 setObject:v78 forKeyedSubscript:@"FPUserInteractionIdentifier"];
        }
        v79 = [(FPPreflightUserInteraction *)self domainIdentifier];
        [v53 setObject:v79 forKeyedSubscript:@"DomainIdentifier"];

        v80 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderInternalErrorDomain" code:13 userInfo:v53];
        [v20 addObject:v80];
        id v81 = v20;
      }
      goto LABEL_71;
    }
  }
  else
  {
    v39 = [(FPPreflightUserInteraction *)self predicate];
    char v40 = [v39 evaluateWithObject:v10];

    if (v40) {
      goto LABEL_12;
    }
  }
  v41 = fp_current_or_default_log();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
    -[FPPreflightUserInteraction _evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:].cold.6(self, v41);
  }

  id v20 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_71:

  return v20;
}

void __100__FPPreflightUserInteraction__evaluateWithObjectsByName_sourceItems_suppressionDelegate_errorIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _evaluateWithObjectsByName:*(void *)(a1 + 32) sourceItems:*(void *)(a1 + 40) suppressionDelegate:*(void *)(a1 + 48) errorIndex:*(void *)(a1 + 64)];
  [*(id *)(a1 + 56) addObjectsFromArray:v3];
}

+ (id)evaluationObjectsForAction:(id)a3 sourceItems:(id)a4 destinationItem:(id)a5 domainUserInfo:(id)a6 sourceItemKeysAllowList:(id)a7 destinationItemKeysAllowList:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  uint64_t v17 = (id *)MEMORY[0x1E4F1CA60];
  id v18 = a6;
  id v19 = a3;
  id v20 = [v17 dictionary];
  [v20 setObject:v19 forKeyedSubscript:@"action"];

  if (v13)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __153__FPPreflightUserInteraction_evaluationObjectsForAction_sourceItems_destinationItem_domainUserInfo_sourceItemKeysAllowList_destinationItemKeysAllowList___block_invoke;
    v24[3] = &unk_1E5AF3438;
    uint64_t v17 = &v25;
    id v25 = v15;
    v21 = objc_msgSend(v13, "fp_map:", v24);
    [v20 setObject:v21 forKeyedSubscript:@"sourceItems"];

    if (v14)
    {
LABEL_3:
      uint64_t v22 = FPExtensionMatchingDictionaryForItem(v14, v16);
      [v20 setObject:v22 forKeyedSubscript:@"destinationItem"];

      goto LABEL_6;
    }
  }
  else
  {
    [v20 setObject:0 forKeyedSubscript:@"sourceItems"];
    if (v14) {
      goto LABEL_3;
    }
  }
  [v20 setObject:0 forKeyedSubscript:@"destinationItem"];
LABEL_6:
  [v20 setObject:v18 forKeyedSubscript:@"domainUserInfo"];

  if (v13) {

  }
  return v20;
}

id __153__FPPreflightUserInteraction_evaluationObjectsForAction_sourceItems_destinationItem_domainUserInfo_sourceItemKeysAllowList_destinationItemKeysAllowList___block_invoke(uint64_t a1, void *a2)
{
  return FPExtensionMatchingDictionaryForItem(a2, *(void **)(a1 + 32));
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FPPreflightUserInteraction *)self predicate];
  id v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (FPPreflightUserInteractionAlert)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
}

- (NSArray)subInteractions
{
  return self->_subInteractions;
}

- (void)setSubInteractions:(id)a3
{
}

- (BOOL)hasSuppressionIdentifier
{
  return self->_hasSuppressionIdentifier;
}

- (void)setHasSuppressionIdentifier:(BOOL)a3
{
  self->_hasSuppressionIdentifier = a3;
}

- (NSString)helpURL
{
  return self->_helpURL;
}

- (void)setHelpURL:(id)a3
{
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (NSString)userInteractionIdentifier
{
  return self->_userInteractionIdentifier;
}

- (void)setUserInteractionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInteractionIdentifier, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_helpURL, 0);
  objc_storeStrong((id *)&self->_subInteractions, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);

  objc_storeStrong((id *)&self->_alert, 0);
}

+ (id)interactionsForProviderItem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 providerID];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v6 error:a4];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 infoDictionary];
    id v10 = [v9 objectForKey:@"NSExtension" ofClass:objc_opt_class()];

    uint64_t v11 = [v10 objectForKey:@"NSFileProviderUserInteractions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = objc_opt_new();
      CFURLRef v13 = [v8 URL];
      CFBundleRef v14 = CFBundleCreate(0, v13);
      [v12 setCfBundle:v14];

      [v12 setTableNames:&unk_1EF6C3A40];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __77__FPPreflightUserInteraction_Convenience__interactionsForProviderItem_error___block_invoke;
      v18[3] = &unk_1E5AF33E8;
      id v19 = v12;
      id v20 = v6;
      id v21 = v5;
      id v15 = v12;
      id v16 = objc_msgSend(v11, "fp_map:", v18);
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

id __77__FPPreflightUserInteraction_Convenience__interactionsForProviderItem_error___block_invoke(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = (void *)a1[6];
  id v5 = a2;
  id v6 = [v4 providerDomainID];
  id v7 = +[FPPreflightUserInteraction interactionFromDictionary:v5 localizationLookup:v2 providerIdentifier:v3 domainIdentifier:v6];

  return v7;
}

+ (id)gatherErrorsForInteractions:(id)a3 evaluationObjects:(id)a4 suppressionDelegate:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "evaluateWithObjectsByName:suppressionDelegate:", v8, v9, (void)v18);
        [v10 addObjectsFromArray:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v10;
}

+ (id)userInteractionErrorsInInfoPlistDict:(id)a3 forAction:(id)a4 bundleID:(id)a5 hierarchyServicer:(id)a6 sourceNSFPItems:(id)a7 destinationNSFPItem:(id)a8 localizationLookup:(id)a9 provider:(id)a10 domain:(id)a11 extensionCapabilities:(unint64_t)a12 useFPFS:(BOOL)a13
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v43 = a4;
  id v42 = a5;
  id v17 = a7;
  id v41 = a8;
  id v40 = a9;
  id v46 = a10;
  id v45 = a11;
  long long v18 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v19 = (FPItem *)v17;
  uint64_t v20 = [(FPItem *)v19 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v52;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v52 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = [[FPItem alloc] initWithVendorItem:*(void *)(*((void *)&v51 + 1) + 8 * i) provider:v46 domain:v45 spotlightDomainIdentifier:0 extensionCapabilities:a12 useFPFS:a13];
        if (!v24)
        {
          uint64_t v27 = fp_current_or_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            +[FPPreflightUserInteraction(CloudDocs) userInteractionErrorsInInfoPlistDict:forAction:bundleID:hierarchyServicer:sourceNSFPItems:destinationNSFPItem:localizationLookup:provider:domain:extensionCapabilities:useFPFS:]();
          }
          uint64_t v28 = (void *)MEMORY[0x1E4F1CBF0];
          uint64_t v26 = v19;
          goto LABEL_23;
        }
        id v25 = v24;
        [v18 addObject:v24];
      }
      uint64_t v21 = [(FPItem *)v19 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  if (v41) {
    uint64_t v26 = [[FPItem alloc] initWithVendorItem:v41 provider:v46 domain:v45 spotlightDomainIdentifier:0 extensionCapabilities:a12 useFPFS:a13];
  }
  else {
    uint64_t v26 = 0;
  }
  v29 = objc_msgSend(v44, "objectForKeyedSubscript:", @"NSFileProviderUserInteractions", a1);
  uint64_t v30 = [v39 interactionsForArray:v29 localizationLookup:v40 providerIdentifier:v42 domainIdentifier:0];

  id v31 = +[FPPreflightUserInteraction evaluationObjectsForAction:v43 sourceItems:v18 destinationItem:v26 domainUserInfo:0 sourceItemKeysAllowList:0 destinationItemKeysAllowList:0];
  uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v27 = v30;
  uint64_t v32 = [v27 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v48 != v34) {
          objc_enumerationMutation(v27);
        }
        uint64_t v36 = [*(id *)(*((void *)&v47 + 1) + 8 * j) evaluateWithObjectsByName:v31 suppressionDelegate:0];
        [v28 addObjectsFromArray:v36];
      }
      uint64_t v33 = [v27 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v33);
  }

LABEL_23:

  return v28;
}

+ (void)interactionFromDictionary:localizationLookup:providerIdentifier:domainIdentifier:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] Can't parse activation rule '%@' containing: %%", v2);
}

+ (void)interactionFromDictionary:(os_log_t)log localizationLookup:providerIdentifier:domainIdentifier:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] Can't parse activation rule: %@: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)interactionFromDictionary:(uint64_t)a1 localizationLookup:(NSObject *)a2 providerIdentifier:domainIdentifier:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 138412802;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  __int16 v5 = @"SubInteractions";
  __int16 v6 = 2112;
  uint64_t v7 = @"Alert";
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Interaction %@ has doesn't have valid value for %@ nor %@ keys, ignoring", (uint8_t *)&v2, 0x20u);
}

+ (void)interactionFromDictionary:(uint64_t)a3 localizationLookup:(uint64_t)a4 providerIdentifier:(uint64_t)a5 domainIdentifier:(uint64_t)a6 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)interactionFromDictionary:(uint64_t)a3 localizationLookup:(uint64_t)a4 providerIdentifier:(uint64_t)a5 domainIdentifier:(uint64_t)a6 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)interactionsForBundle:providerIdentifier:domainIdentifier:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] List of user interactions %@ is not an array", v2);
}

void __106__FPPreflightUserInteraction_interactionsForArray_localizationLookup_providerIdentifier_domainIdentifier___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_23(&dword_1A33AE000, v0, v1, "[ERROR] User interaction %@ is not a dictionary", v2);
}

- (void)_evaluateWithObjectsByName:(void *)a1 sourceItems:suppressionDelegate:errorIndex:.cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] Failed to evaluate alert subtitle format. Error: %@", v4, v5, v6, v7, v8);
}

- (void)_evaluateWithObjectsByName:(void *)a1 sourceItems:suppressionDelegate:errorIndex:.cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] Failed to evaluate alert title format. Error: %@", v4, v5, v6, v7, v8);
}

- (void)_evaluateWithObjectsByName:(uint64_t)a3 sourceItems:(uint64_t)a4 suppressionDelegate:(uint64_t)a5 errorIndex:(uint64_t)a6 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_evaluateWithObjectsByName:(void *)a1 sourceItems:suppressionDelegate:errorIndex:.cold.4(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] Failed to evaluate alert continue caption format. Error: %@", v4, v5, v6, v7, v8);
}

- (void)_evaluateWithObjectsByName:(void *)a1 sourceItems:suppressionDelegate:errorIndex:.cold.5(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] Failed to evaluate alert cancel caption format. Error: %@", v4, v5, v6, v7, v8);
}

- (void)_evaluateWithObjectsByName:(void *)a1 sourceItems:(NSObject *)a2 suppressionDelegate:errorIndex:.cold.6(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 predicate];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] No match for predicate %@", v4, 0xCu);
}

- (void)_evaluateWithObjectsByName:(void *)a1 sourceItems:(uint64_t)a2 suppressionDelegate:(uint8_t *)buf errorIndex:(os_log_t)log .cold.7(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] Can't evaluate activation rule: %@: %@", buf, 0x16u);
}

@end