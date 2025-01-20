@interface _DKPrivacyPolicyEnforcer
+ (id)privacyPolicyEnforcer;
- (id)enforcePrivacy:(id)a3;
@end

@implementation _DKPrivacyPolicyEnforcer

- (id)enforcePrivacy:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v54 = [MEMORY[0x1E4F1CA48] array];
  v4 = (void *)MEMORY[0x1E4F28F60];
  v5 = +[_CDSiriLearningSettings sharedInstance];
  v6 = [v5 allLearningDisabledBundleIDs];
  uint64_t v7 = [v4 predicateWithFormat:@"SELF.source.bundleID IN %@", v6];

  if (+[_CDDeviceInfo isRunningOnInternalBuild])
  {
    v8 = [v3 filteredArrayUsingPredicate:v7];
    if ([v8 count])
    {
      v9 = (void *)MEMORY[0x1E4F1CAD0];
      v10 = [v8 valueForKeyPath:@"source.bundleID"];
      v11 = [v9 setWithArray:v10];

      v12 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v62 = v11;
        _os_log_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_INFO, "Filtered objects for bundles with Siri Learning disabled: %@", buf, 0xCu);
      }
    }
  }
  v48 = (void *)v7;
  v13 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v7];
  v14 = [v3 filteredArrayUsingPredicate:v13];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v55 = *(void *)v57;
    unint64_t v18 = 0x1E560C000uLL;
    id v49 = v15;
    do
    {
      uint64_t v19 = 0;
      uint64_t v50 = v17;
      do
      {
        if (*(void *)v57 != v55) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(id *)(*((void *)&v56 + 1) + 8 * v19);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = v20;
          v21 = [v20 stream];
          v22 = [v21 name];

          v23 = +[_CDEventStreams privacyPolicyForEventStreamName:v22];
          if (!v23)
          {
            v23 = +[_CDPrivacyPolicy sharedPrivacyPolicy];
          }
          if (![v23 canPersistOnStorage])
          {

            goto LABEL_22;
          }
          [v23 temporalPrecision];
          v24 = v20;
          if (v25 != 0.0)
          {
            v26 = [v20 startDate];
            [v26 timeIntervalSinceReferenceDate];
            double v28 = v27;

            [v23 temporalPrecision];
            double v30 = v29 * floor(v28 / v29);
            v31 = [v20 endDate];
            [v31 timeIntervalSinceReferenceDate];
            double v33 = v32;

            [v23 temporalPrecision];
            double v35 = v34 * floor(v33 / v34);
            v52 = *(void **)(v18 + 3168);
            v51 = [v20 stream];
            v36 = [v20 source];
            v53 = v22;
            v37 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v30];
            v38 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v35];
            v39 = [v20 value];
            [v20 confidence];
            double v41 = v40;
            [v20 metadata];
            v43 = unint64_t v42 = v18;
            v24 = [v52 eventWithStream:v51 source:v36 startDate:v37 endDate:v38 value:v39 confidence:v43 metadata:v41];

            unint64_t v18 = v42;
            uint64_t v17 = v50;

            id v15 = v49;
            objc_msgSend(v24, "setShouldSync:", objc_msgSend(v20, "shouldSync"));
            v44 = [v20 UUID];
            [v24 setUUID:v44];

            objc_msgSend(v24, "setCompatibilityVersion:", objc_msgSend(v20, "compatibilityVersion"));
            v45 = [v20 timeZone];
            [v24 setTimeZone:v45];

            v22 = v53;
          }

          id v20 = v24;
        }
        if (!v20) {
          goto LABEL_23;
        }
        [v54 addObject:v20];
LABEL_22:

LABEL_23:
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v17);
  }

  v46 = (void *)[v54 copy];
  return v46;
}

+ (id)privacyPolicyEnforcer
{
  if (privacyPolicyEnforcer_onceToken != -1) {
    dispatch_once(&privacyPolicyEnforcer_onceToken, &__block_literal_global_30);
  }
  v2 = (void *)privacyPolicyEnforcer_enforcer;
  return v2;
}

@end