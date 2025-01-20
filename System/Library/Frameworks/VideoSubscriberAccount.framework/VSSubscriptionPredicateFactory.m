@interface VSSubscriptionPredicateFactory
+ (id)_subscriptionPredicateTemplateValues;
+ (id)_subscriptionSourceKindPredicateTemplateValues;
+ (id)_subscriptionSourcePredicateTemplateValues;
- (VSAppInstallationInfoCenter)appInstallationInfoCenter;
- (id)_expressionByConvertingSubscriptionKeyPathInExpression:(id)a3 toAttributeKeysInEntity:(id)a4;
- (id)_predicateTemplateForAppPredicate:(id)a3 withTask:(id)a4;
- (id)_predicateTemplateForRequestKind:(int64_t)a3 fromTask:(id)a4;
- (id)_predicateTemplateForSourceIdentifier:(id)a3;
- (id)_predicateTemplateForSourceKind:(int64_t)a3;
- (id)_predicateTemplateForSourceOfTask:(id)a3;
- (id)_topLevelAccessPredicateForRequestKind:(int64_t)a3 fromTask:(id)a4;
- (id)allowedSubscriptionSourceKindsPredicateForRequestKind:(int64_t)a3 fromTask:(id)a4;
- (id)allowedSubscriptionSourcesPredicateForRequestKind:(int64_t)a3 fromTask:(id)a4;
- (id)allowedSubscriptionsPredicateForRequestKind:(int64_t)a3 fromTask:(id)a4;
- (id)allowedSubscriptionsPredicateForTask:(id)a3;
- (id)predicateByConvertingSubscriptionKeyPathsInPredicate:(id)a3 toAttributeKeysInEntity:(id)a4;
- (id)subscriptionFetchPredicateForTask:(id)a3 withOptions:(id)a4;
- (void)setAppInstallationInfoCenter:(id)a3;
@end

@implementation VSSubscriptionPredicateFactory

+ (id)_subscriptionSourceKindPredicateTemplateValues
{
  if (_subscriptionSourceKindPredicateTemplateValues___vs_lazy_init_predicate != -1) {
    dispatch_once(&_subscriptionSourceKindPredicateTemplateValues___vs_lazy_init_predicate, &__block_literal_global);
  }
  v2 = (void *)_subscriptionSourceKindPredicateTemplateValues___vs_lazy_init_variable;

  return v2;
}

uint64_t __80__VSSubscriptionPredicateFactory__subscriptionSourceKindPredicateTemplateValues__block_invoke()
{
  _subscriptionSourceKindPredicateTemplateValues___vs_lazy_init_variable = __80__VSSubscriptionPredicateFactory__subscriptionSourceKindPredicateTemplateValues__block_invoke_2();

  return MEMORY[0x1F41817F8]();
}

id __80__VSSubscriptionPredicateFactory__subscriptionSourceKindPredicateTemplateValues__block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  [v0 setObject:v1 forKey:@"VSSubscriptionSourceKindVariableName"];

  v2 = (void *)[v0 copy];

  return v2;
}

+ (id)_subscriptionSourcePredicateTemplateValues
{
  if (_subscriptionSourcePredicateTemplateValues___vs_lazy_init_predicate != -1) {
    dispatch_once(&_subscriptionSourcePredicateTemplateValues___vs_lazy_init_predicate, &__block_literal_global_10);
  }
  v2 = (void *)_subscriptionSourcePredicateTemplateValues___vs_lazy_init_variable;

  return v2;
}

uint64_t __76__VSSubscriptionPredicateFactory__subscriptionSourcePredicateTemplateValues__block_invoke()
{
  _subscriptionSourcePredicateTemplateValues___vs_lazy_init_variable = __76__VSSubscriptionPredicateFactory__subscriptionSourcePredicateTemplateValues__block_invoke_2();

  return MEMORY[0x1F41817F8]();
}

id __76__VSSubscriptionPredicateFactory__subscriptionSourcePredicateTemplateValues__block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"kind"];
  [v0 setObject:v1 forKey:@"VSSubscriptionSourceKindVariableName"];

  v2 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"identifier"];
  [v0 setObject:v2 forKey:@"VSSubscriptionSourceIdentifierVariableName"];

  v3 = (void *)[v0 copy];

  return v3;
}

+ (id)_subscriptionPredicateTemplateValues
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__VSSubscriptionPredicateFactory__subscriptionPredicateTemplateValues__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_subscriptionPredicateTemplateValues___vs_lazy_init_predicate != -1) {
    dispatch_once(&_subscriptionPredicateTemplateValues___vs_lazy_init_predicate, block);
  }
  v2 = (void *)_subscriptionPredicateTemplateValues___vs_lazy_init_variable;

  return v2;
}

void __70__VSSubscriptionPredicateFactory__subscriptionPredicateTemplateValues__block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__VSSubscriptionPredicateFactory__subscriptionPredicateTemplateValues__block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e5__8__0l;
  aBlock[4] = *(void *)(a1 + 32);
  v1 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v2 = v1[2]();
  v3 = (void *)_subscriptionPredicateTemplateValues___vs_lazy_init_variable;
  _subscriptionPredicateTemplateValues___vs_lazy_init_variable = v2;
}

id __70__VSSubscriptionPredicateFactory__subscriptionPredicateTemplateValues__block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = [*(id *)(a1 + 32) _subscriptionSourcePredicateTemplateValues];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__VSSubscriptionPredicateFactory__subscriptionPredicateTemplateValues__block_invoke_3;
  v7[3] = &unk_1E6BD2738;
  id v8 = v2;
  id v4 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  v5 = (void *)[v4 copy];

  return v5;
}

void __70__VSSubscriptionPredicateFactory__subscriptionPredicateTemplateValues__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E0173AA0]();
  v12[0] = @"source";
  id v8 = [v6 keyPath];
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v10 = [v9 componentsJoinedByString:@"."];

  v11 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v10];
  [*(id *)(a1 + 32) setObject:v11 forKey:v5];
}

- (id)_predicateTemplateForSourceKind:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28C68] expressionForVariable:@"VSSubscriptionSourceKindVariableName"];
  id v5 = (void *)MEMORY[0x1E4F28C68];
  id v6 = [NSNumber numberWithInteger:a3];
  v7 = [v5 expressionForConstantValue:v6];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v4 rightExpression:v7 modifier:0 type:4 options:0];

  return v8;
}

- (id)_predicateTemplateForSourceIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28C68];
  id v4 = a3;
  id v5 = [v3 expressionForVariable:@"VSSubscriptionSourceIdentifierVariableName"];
  id v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v4];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v5 rightExpression:v6 modifier:0 type:4 options:0];

  return v7;
}

- (id)_topLevelAccessPredicateForRequestKind:(int64_t)a3 fromTask:(id)a4
{
  id v5 = a4;
  if (([v5 shouldAllowAccessForBooleanEntitlement:@"com.apple.private.subscriptionservice.internal"] & 1) != 0|| (int v6 = objc_msgSend(v5, "shouldAllowAccessForBooleanEntitlement:", @"com.apple.private.subscriptionservice.all-sources.read-only"), v7 = 0, !a3)&& v6)
  {
    v7 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }

  return v7;
}

- (id)_predicateTemplateForAppPredicate:(id)a3 withTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v7 shouldAllowAccessForBooleanEntitlement:@"com.apple.smoot.subscriptionservice"])
  {
    if (!v6) {
      goto LABEL_7;
    }
LABEL_6:
    [v8 addObject:v6];
    goto LABEL_7;
  }
  char v9 = [v7 shouldAllowAccessForBooleanEntitlement:@"com.apple.developer.video-subscription-registration"];
  if (v6 && (v9 & 1) != 0) {
    goto LABEL_6;
  }
LABEL_7:
  if ([v7 shouldAllowAccessForBooleanEntitlement:@"com.apple.private.subscriptionservice.web-sources.read-write"])
  {
    v10 = [(VSSubscriptionPredicateFactory *)self _predicateTemplateForSourceKind:1];
    [v8 addObject:v10];
  }
  uint64_t v11 = [v8 count];
  if (v11 == 1)
  {
    uint64_t v12 = [v8 objectAtIndex:0];
  }
  else
  {
    if (v11) {
      [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v8];
    }
    else {
    uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
    }
  }
  v13 = (void *)v12;

  return v13;
}

- (id)_predicateTemplateForSourceOfTask:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 signingIdentifier];
  if (v4)
  {
    id v5 = [(VSSubscriptionPredicateFactory *)self _predicateTemplateForSourceKind:0];
    id v6 = [(VSSubscriptionPredicateFactory *)self _predicateTemplateForSourceIdentifier:v4];
    id v7 = (void *)MEMORY[0x1E4F28BA0];
    v11[0] = v5;
    v11[1] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    char v9 = [v7 andPredicateWithSubpredicates:v8];
  }
  else
  {
    id v5 = VSErrorLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[VSSubscriptionPredicateFactory _predicateTemplateForSourceOfTask:](v5);
    }
    char v9 = 0;
  }

  return v9;
}

- (id)_predicateTemplateForRequestKind:(int64_t)a3 fromTask:(id)a4
{
  id v6 = a4;
  id v7 = [(VSSubscriptionPredicateFactory *)self _topLevelAccessPredicateForRequestKind:a3 fromTask:v6];
  if (!v7)
  {
    id v8 = [(VSSubscriptionPredicateFactory *)self _predicateTemplateForSourceOfTask:v6];
    id v7 = [(VSSubscriptionPredicateFactory *)self _predicateTemplateForAppPredicate:v8 withTask:v6];
  }

  return v7;
}

- (VSAppInstallationInfoCenter)appInstallationInfoCenter
{
  id v2 = self->_appInstallationInfoCenter;
  if (!v2) {
    id v2 = objc_alloc_init(VSAppInstallationInfoCenter);
  }

  return v2;
}

- (id)allowedSubscriptionSourceKindsPredicateForRequestKind:(int64_t)a3 fromTask:(id)a4
{
  id v6 = a4;
  id v7 = [(VSSubscriptionPredicateFactory *)self _topLevelAccessPredicateForRequestKind:a3 fromTask:v6];
  if (!v7)
  {
    id v8 = [(VSSubscriptionPredicateFactory *)self _predicateTemplateForSourceKind:0];
    id v7 = [(VSSubscriptionPredicateFactory *)self _predicateTemplateForAppPredicate:v8 withTask:v6];
  }
  char v9 = [(id)objc_opt_class() _subscriptionSourceKindPredicateTemplateValues];
  v10 = [v7 predicateWithSubstitutionVariables:v9];

  uint64_t v11 = +[VSOptional optionalWithObject:v10];
  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  v13 = [v11 unwrapWithFallback:v12];

  return v13;
}

- (id)allowedSubscriptionSourcesPredicateForRequestKind:(int64_t)a3 fromTask:(id)a4
{
  id v4 = [(VSSubscriptionPredicateFactory *)self _predicateTemplateForRequestKind:a3 fromTask:a4];
  id v5 = [(id)objc_opt_class() _subscriptionSourcePredicateTemplateValues];
  id v6 = [v4 predicateWithSubstitutionVariables:v5];

  id v7 = +[VSOptional optionalWithObject:v6];
  id v8 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  char v9 = [v7 unwrapWithFallback:v8];

  return v9;
}

- (id)allowedSubscriptionsPredicateForTask:(id)a3
{
  v3 = [(VSSubscriptionPredicateFactory *)self _predicateTemplateForSourceOfTask:a3];
  id v4 = [(id)objc_opt_class() _subscriptionPredicateTemplateValues];
  id v5 = [v3 predicateWithSubstitutionVariables:v4];

  id v6 = +[VSOptional optionalWithObject:v5];
  id v7 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  id v8 = [v6 unwrapWithFallback:v7];

  return v8;
}

- (id)allowedSubscriptionsPredicateForRequestKind:(int64_t)a3 fromTask:(id)a4
{
  id v4 = [(VSSubscriptionPredicateFactory *)self _predicateTemplateForRequestKind:a3 fromTask:a4];
  id v5 = [(id)objc_opt_class() _subscriptionPredicateTemplateValues];
  id v6 = [v4 predicateWithSubstitutionVariables:v5];

  id v7 = +[VSOptional optionalWithObject:v6];
  id v8 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  char v9 = [v7 unwrapWithFallback:v8];

  return v9;
}

- (id)subscriptionFetchPredicateForTask:(id)a3 withOptions:(id)a4
{
  v79[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  context = (void *)MEMORY[0x1E0173AA0]();
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v9 = +[VSFeatureManager sharedFeatureManager];
  char v10 = [v9 featureIsEnabled:VSFederatedTwoFeatureName];

  if ((v10 & 1) == 0)
  {
    if (!v6)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Security task is required when %@ feature is disabled.", VSFederatedTwoFeatureName format];
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The taskOrNil parameter must not be nil."];
    }
    uint64_t v11 = [(VSSubscriptionPredicateFactory *)self allowedSubscriptionsPredicateForRequestKind:0 fromTask:v6];
    if (v11) {
      [v8 addObject:v11];
    }
  }
  v70 = v6;
  uint64_t v12 = [v7 objectForKey:@"VSSubscriptionFetchOptionEarliestExpirationDate"];
  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
  }
  unint64_t v13 = 0x1E4F28000uLL;
  v68 = (void *)v12;
  v67 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"expirationDate", v12];
  objc_msgSend(v8, "addObject:");
  v14 = [v7 objectForKey:@"VSSubscriptionFetchOptionExcludeUninstalledApps"];
  int v15 = [v14 BOOLValue];

  if (v15)
  {
    v65 = [(VSSubscriptionPredicateFactory *)self appInstallationInfoCenter];
    v16 = [v65 installedAppBundleIDs];
    v63 = [v16 forceUnwrapObject];

    v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != %@", @"source.kind", &unk_1F34D0C70];
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"source.kind", &unk_1F34D0C70];
    v19 = v18 = v8;
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"source.identifier", v63];
    v21 = id v20 = v7;
    v22 = (void *)MEMORY[0x1E4F28BA0];
    v79[0] = v19;
    v79[1] = v21;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
    v24 = [v22 andPredicateWithSubpredicates:v23];

    v25 = (void *)MEMORY[0x1E4F28BA0];
    v78[0] = v17;
    v78[1] = v24;
    unint64_t v13 = 0x1E4F28000uLL;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];
    v27 = [v25 orPredicateWithSubpredicates:v26];

    [v18 addObject:v27];
    id v7 = v20;

    id v8 = v18;
  }
  v28 = [v7 objectForKey:@"VSSubscriptionFetchOptionCreationDateInterval"];
  if (!v28)
  {
    id v29 = objc_alloc(MEMORY[0x1E4F28C18]);
    v30 = [MEMORY[0x1E4F1C9C8] distantPast];
    v31 = [MEMORY[0x1E4F1C9C8] distantFuture];
    v28 = (void *)[v29 initWithStartDate:v30 endDate:v31];
  }
  v32 = (void *)MEMORY[0x1E4F28F60];
  v33 = [v28 startDate];
  v34 = [v28 endDate];
  v35 = [v32 predicateWithFormat:@"%K BETWEEN {%@, %@}", @"creationDate", v33, v34];

  [v8 addObject:v35];
  v36 = [v7 objectForKey:@"VSSubscriptionFetchOptionSources"];
  if (v36)
  {
    v61 = v35;
    v62 = v28;
    v64 = v8;
    id v66 = v7;
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v60 = v36;
    id v38 = v36;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v73 objects:v77 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v74 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          v44 = (void *)MEMORY[0x1E0173AA0]();
          v45 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v43, "kind"));
          v46 = [v37 objectForKeyedSubscript:v45];

          if (!v46)
          {
            id v47 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            [v37 setObject:v47 forKeyedSubscript:v45];
          }
          v48 = [v37 objectForKeyedSubscript:v45];
          v49 = [v43 identifier];
          [v48 addObject:v49];
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v73 objects:v77 count:16];
      }
      while (v40);
    }

    if ([v37 count])
    {
      id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __80__VSSubscriptionPredicateFactory_subscriptionFetchPredicateForTask_withOptions___block_invoke;
      v71[3] = &unk_1E6BD27A0;
      id v72 = v50;
      id v51 = v50;
      [v37 enumerateKeysAndObjectsUsingBlock:v71];
      v52 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v51];
      id v8 = v64;
      [v64 addObject:v52];

      id v7 = v66;
      unint64_t v13 = 0x1E4F28000;
    }
    else
    {
      unint64_t v13 = 0x1E4F28000uLL;
      id v51 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
      id v8 = v64;
      [v64 addObject:v51];
      id v7 = v66;
    }
    v35 = v61;
    v28 = v62;
    v36 = v60;
  }
  v53 = [v7 objectForKey:@"VSSubscriptionFetchOptionSourceKind"];
  if (v53)
  {
    v54 = [*(id *)(v13 + 3936) predicateWithFormat:@"%K == %@", @"source.kind", v53];
    [v8 addObject:v54];
  }
  v55 = [v7 objectForKey:@"VSSubscriptionFetchOptionSubscriptionInfo"];
  if (v55)
  {
    [*(id *)(v13 + 3936) predicateWithFormat:@"%K == %@", @"providedSubscriptionInfo", v55];
    v57 = v56 = v36;
    [v8 addObject:v57];

    v36 = v56;
  }
  if ((unint64_t)[v8 count] < 2) {
    [v8 objectAtIndex:0];
  }
  else {
  v58 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v8];
  }
  if (!v58) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The predicate parameter must not be nil."];
  }

  return v58;
}

void __80__VSSubscriptionPredicateFactory_subscriptionFetchPredicateForTask_withOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a2;
  id v7 = [a3 allObjects];
  [v5 predicateWithFormat:@"%K == %@ AND (%K IN %@)", @"source.kind", v6, @"source.identifier", v7];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) addObject:v8];
}

- (id)_expressionByConvertingSubscriptionKeyPathInExpression:(id)a3 toAttributeKeysInEntity:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v39 = v5;
  uint64_t v7 = [v5 expressionType];
  if (v7)
  {
    id v36 = v6;
    if (v7 == 14)
    {
      id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v17 = [v5 constantValue];
      if ([v17 conformsToProtocol:&unk_1F34E67B8])
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v35 = v17;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v41;
          uint64_t v22 = *MEMORY[0x1E4F1C3C8];
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v41 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v24 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              v25 = (void *)MEMORY[0x1E0173AA0]();
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v26 = (void *)MEMORY[0x1E4F1CA00];
                  v27 = (objc_class *)objc_opt_class();
                  v28 = NSStringFromClass(v27);
                  [v26 raise:v22, @"Unexpectedly, object was %@, instead of NSExpression.", v28 format];

                  id v6 = v36;
                }
                id v29 = [(VSSubscriptionPredicateFactory *)self _expressionByConvertingSubscriptionKeyPathInExpression:v24 toAttributeKeysInEntity:v6];
                [v37 addObject:v29];
              }
              else
              {
                [MEMORY[0x1E4F1CA00] raise:v22, @"Object (%@) in constant value is not an expression: %@", v24, v5 format];
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
          }
          while (v20);
        }

        v17 = v35;
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Unable to enumerate constant value of aggregate expression: expression"];
      }
      uint64_t v33 = [MEMORY[0x1E4F28C68] expressionForAggregate:v37];

      id v39 = (id)v33;
    }
    else if (v7 == 3)
    {
      id v8 = [v5 keyPath];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      char v9 = [v6 attributesByName];
      char v10 = [v9 allValues];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v45;
        while (2)
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v45 != v13) {
              objc_enumerationMutation(v10);
            }
            int v15 = *(void **)(*((void *)&v44 + 1) + 8 * j);
            if (objc_msgSend(v15, "vs_isSuitableForPurpose:", 1))
            {
              v16 = objc_msgSend(v15, "vs_subscriptionKeyPath");
              if ([v16 isEqual:v8])
              {
                v30 = (void *)MEMORY[0x1E4F28C68];
                v31 = [v15 name];
                uint64_t v32 = [v30 expressionForKeyPath:v31];

                id v39 = (id)v32;
                goto LABEL_31;
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"No suitable replacement found for key path %@ in expression %@", v8, v39 format];
LABEL_31:

      id v6 = v36;
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unexpected type of expression: %@", v5 format];
    }
  }

  return v39;
}

- (id)predicateByConvertingSubscriptionKeyPathsInPredicate:(id)a3 toAttributeKeysInEntity:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3C8];
      uint64_t v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      [v9 raise:v10, @"Unexpectedly, subscriptionPredicate was %@, instead of NSComparisonPredicate.", v12 format];
    }
    id v13 = v8;
    v14 = [v13 leftExpression];
    id v15 = [(VSSubscriptionPredicateFactory *)self _expressionByConvertingSubscriptionKeyPathInExpression:v14 toAttributeKeysInEntity:v7];

    v16 = [v13 rightExpression];
    v17 = [(VSSubscriptionPredicateFactory *)self _expressionByConvertingSubscriptionKeyPathInExpression:v16 toAttributeKeysInEntity:v7];

    id v18 = objc_alloc(MEMORY[0x1E4F28B98]);
    uint64_t v19 = [v13 comparisonPredicateModifier];
    uint64_t v20 = [v13 predicateOperatorType];
    uint64_t v21 = [v13 options];

    uint64_t v22 = (void *)[v18 initWithLeftExpression:v15 rightExpression:v17 modifier:v19 type:v20 options:v21];
LABEL_16:

    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v23 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v24 = *MEMORY[0x1E4F1C3C8];
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      [v23 raise:v24, @"Unexpectedly, subscriptionPredicate was %@, instead of NSCompoundPredicate.", v26 format];
    }
    id v27 = v8;
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v40 = v27;
    v28 = [v27 subpredicates];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v42 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          v34 = (void *)MEMORY[0x1E0173AA0]();
          v35 = [(VSSubscriptionPredicateFactory *)self predicateByConvertingSubscriptionKeyPathsInPredicate:v33 toAttributeKeysInEntity:v7];
          [v15 addObject:v35];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v30);
    }

    id v13 = v40;
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(v40, "compoundPredicateType"), v15);

    goto LABEL_16;
  }
  id v36 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  if ([v8 isEqual:v36])
  {
  }
  else
  {
    id v37 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
    char v38 = [v8 isEqual:v37];

    uint64_t v22 = v8;
    if (v38) {
      goto LABEL_22;
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unknown kind of subscription predicate: %@", v8 format];
  }
  uint64_t v22 = v8;
LABEL_22:

  return v22;
}

- (void)setAppInstallationInfoCenter:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_predicateTemplateForSourceOfTask:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Unable to determine bundle ID of caller.", v1, 2u);
}

@end