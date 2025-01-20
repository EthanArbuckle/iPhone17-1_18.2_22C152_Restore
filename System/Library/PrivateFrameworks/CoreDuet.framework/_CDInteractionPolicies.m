@interface _CDInteractionPolicies
+ (id)interactionPolicies;
+ (id)limitArray:(id)a3 toMaxCount:(unint64_t)a4;
+ (id)modifyDate:(id)a3 usingPolicy:(id)a4;
- (NSDate)dateOfOldestAllowedInteraction;
- (_CDInteractionPolicies)init;
- (id)dateOfOldestAllowedInteractionForMechanism:(int64_t)a3;
- (id)dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds;
- (id)description;
- (id)filterAndModifyInteractionsWithPolicies:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5;
- (id)policyForMechanism:(int64_t)a3;
- (id)whitelistedFirstPartyBundleIds;
- (unint64_t)maxNumberOfInteractionsDeleted;
- (unint64_t)maxNumberOfInteractionsStored;
- (void)readConfigurationPlist;
- (void)setupDefaultHardcodedPolicies;
@end

@implementation _CDInteractionPolicies

+ (id)interactionPolicies
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (_CDInteractionPolicies)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CDInteractionPolicies;
  id v2 = [(_CDInteractionPolicies *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_CDInteractionPolicies *)v2 setupDefaultHardcodedPolicies];
  }
  return v3;
}

- (id)whitelistedFirstPartyBundleIds
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.MobileSMS";
  v4[1] = @"com.apple.iChat";
  v4[2] = @"com.apple.mobilemail";
  v4[3] = @"com.apple.mail";
  v4[4] = @"com.apple.UIKit.activity.AirDrop";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  return v2;
}

- (id)policyForMechanism:(int64_t)a3
{
  specialPoliciesForMechanisms = self->_specialPoliciesForMechanisms;
  objc_super v5 = [NSNumber numberWithInteger:a3];
  v6 = [(NSDictionary *)specialPoliciesForMechanisms objectForKeyedSubscript:v5];

  if (!v6) {
    v6 = self->_defaultPolicy;
  }
  return v6;
}

- (unint64_t)maxNumberOfInteractionsStored
{
  return self->_maxNumberOfInteractions;
}

- (unint64_t)maxNumberOfInteractionsDeleted
{
  return self->_maxNumberOfInteractionsDeletedInBatch;
}

- (NSDate)dateOfOldestAllowedInteraction
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-14515200.0];
}

- (id)dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds
{
  return (id)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-14515200.0];
}

- (id)dateOfOldestAllowedInteractionForMechanism:(int64_t)a3
{
  v3 = [(_CDInteractionPolicies *)self policyForMechanism:a3];
  unint64_t v4 = [v3 lifespanInSeconds];

  double v5 = (double)v4;
  if ((double)v4 > 14515200.0) {
    double v5 = 14515200.0;
  }
  v6 = (void *)MEMORY[0x1E4F1C9C8];
  double v7 = -v5;
  return (id)[v6 dateWithTimeIntervalSinceNow:v7];
}

+ (id)modifyDate:(id)a3 usingPolicy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = v6;
  if (v5)
  {
    if ([v6 timeResolutionInSeconds])
    {
      [v5 timeIntervalSinceReferenceDate];
      double v9 = v8;
      double v10 = (double)(unint64_t)[v7 timeResolutionInSeconds];
      unint64_t v11 = [v7 timeResolutionInSeconds];
      id v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:floor(v9 / (double)v11) * v10];
    }
    else
    {
      id v12 = v5;
    }
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)limitArray:(id)a3 toMaxCount:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 count] > a4)
  {
    objc_msgSend(v6, "subarrayWithRange:", 0, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v6;
  }
  double v8 = v7;

  return v8;
}

- (id)filterAndModifyInteractionsWithPolicies:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  double v9 = +[_CDSiriLearningSettings sharedInstance];
  double v10 = [v9 allLearningDisabledBundleIDs];

  if ([v10 count])
  {
    unint64_t v11 = (void *)MEMORY[0x1E4F28F60];
    id v12 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_61);
    v13 = [v11 predicateWithFormat:@"SELF.bundleId IN %@ OR SELF.targetBundleId IN %@", v10, v12];

    if (+[_CDDeviceInfo isRunningOnInternalBuild])
    {
      v14 = [v8 filteredArrayUsingPredicate:v13];
      if ([v14 count])
      {
        v15 = +[_CDLogging interactionChannel];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v89 = [v14 count];
          __int16 v90 = 2114;
          v91 = v10;
          _os_log_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_DEFAULT, "Filtered %tu interactions for bundles with Siri Learning disabled (%{public}@)", buf, 0x16u);
        }
      }
    }
    v16 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v13];
    uint64_t v17 = [v8 filteredArrayUsingPredicate:v16];

    id v8 = (id)v17;
  }
  uint64_t v18 = [v8 count];
  if ((v6 || v5) && v18)
  {
    v73 = v10;
    v76 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v19 = [(_CDInteractionPolicies *)self policyForMechanism:1];
    v83 = [(_CDInteractionPolicies *)self dateOfOldestAllowedInteractionForMechanism:1];
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v74 = v8;
    id obj = v8;
    uint64_t v82 = [obj countByEnumeratingWithState:&v84 objects:v94 count:16];
    if (!v82) {
      goto LABEL_55;
    }
    uint64_t v81 = *(void *)v85;
    uint64_t v77 = 1;
    BOOL v78 = v6;
    BOOL v79 = v5;
    while (1)
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v85 != v81) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v84 + 1) + 8 * v20);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v22 = v19;
          id v23 = v21;
          uint64_t v24 = [v23 mechanism];
          v25 = [(_CDInteractionPolicies *)self whitelistedFirstPartyBundleIds];
          v26 = [v23 bundleId];
          int v27 = [v25 containsObject:v26];

          if (v27)
          {
            specialPoliciesForBundleIds = self->_specialPoliciesForBundleIds;
            v29 = [v23 bundleId];
            v19 = [(NSDictionary *)specialPoliciesForBundleIds objectForKeyedSubscript:v29];

            uint64_t v30 = [(_CDInteractionPolicies *)self dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds];
            goto LABEL_28;
          }
          uint64_t v31 = [v23 targetBundleId];
          if (!v31) {
            goto LABEL_22;
          }
          v32 = (void *)v31;
          v33 = [(_CDInteractionPolicies *)self whitelistedFirstPartyBundleIds];
          v34 = [v23 targetBundleId];
          int v35 = [v33 containsObject:v34];

          if (v35)
          {
            v36 = self->_specialPoliciesForBundleIds;
            v37 = [v23 targetBundleId];
            v19 = [(NSDictionary *)v36 objectForKeyedSubscript:v37];

            uint64_t v30 = [(_CDInteractionPolicies *)self dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds];
LABEL_27:
            BOOL v6 = v78;
            BOOL v5 = v79;
LABEL_28:

            v83 = (void *)v30;
            if (v5) {
              goto LABEL_29;
            }
LABEL_24:
            int v38 = 0;
            if (!v6)
            {
LABEL_35:
              int v43 = 1;
              goto LABEL_36;
            }
          }
          else
          {
LABEL_22:
            if (v24 != v77)
            {
              v19 = [(_CDInteractionPolicies *)self policyForMechanism:v24];

              uint64_t v30 = [(_CDInteractionPolicies *)self dateOfOldestAllowedInteractionForMechanism:v24];
              uint64_t v77 = v24;
              goto LABEL_27;
            }
            BOOL v6 = v78;
            BOOL v5 = v79;
            v19 = v22;
            if (!v79) {
              goto LABEL_24;
            }
LABEL_29:
            v39 = [v23 startDate];
            v40 = [v83 earlierDate:v39];

            if (v40 == v83)
            {
              int v38 = 0;
              if (!v6) {
                goto LABEL_35;
              }
            }
            else
            {
              v41 = +[_CDLogging interactionChannel];
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
              {
                v70 = [v23 startDate];
                *(_DWORD *)buf = 138412802;
                uint64_t v89 = (uint64_t)v70;
                __int16 v90 = 2112;
                v91 = v83;
                __int16 v92 = 2112;
                id v93 = v23;
                _os_log_debug_impl(&dword_18ECEB000, v41, OS_LOG_TYPE_DEBUG, "Incoming interaction fails retention policy. %@ (oldest allowed is %@). %@", buf, 0x20u);
              }
              int v38 = 1;
              if (!v6) {
                goto LABEL_35;
              }
            }
          }
          v42 = [v19 rateLimiter];
          int v43 = [v42 debited];

LABEL_36:
          if (((v38 | v43 ^ 1) & 1) == 0)
          {
            if (v5)
            {
              v44 = objc_opt_class();
              v45 = [v23 startDate];
              v46 = [v44 modifyDate:v45 usingPolicy:v19];
              [v23 setStartDate:v46];

              v47 = objc_opt_class();
              v48 = [v23 endDate];
              v49 = [v47 modifyDate:v48 usingPolicy:v19];
              [v23 setEndDate:v49];
            }
            if (v6)
            {
              v50 = objc_opt_class();
              v51 = [v23 recipients];
              v52 = objc_msgSend(v50, "limitArray:toMaxCount:", v51, objc_msgSend(v19, "maxNumberOfRecipients"));
              [v23 setRecipients:v52];

              v53 = objc_opt_class();
              v54 = [v23 keywords];
              v55 = objc_msgSend(v53, "limitArray:toMaxCount:", v54, objc_msgSend(v19, "maxNumberOfKeywords"));
              [v23 setKeywords:v55];

              v56 = objc_opt_class();
              v57 = [v23 attachments];
              v58 = objc_msgSend(v56, "limitArray:toMaxCount:", v57, objc_msgSend(v19, "maxNumberOfAttachments"));
              [v23 setAttachments:v58];
            }
            if ([v23 mechanism] == 13)
            {
              v59 = [v23 targetBundleId];
              int v60 = [v59 isEqualToString:@"com.apple.UIKit.activity.Mail"];

              if (v60)
              {
                v75 = v19;
                v61 = [v23 recipients];
                v62 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v61, "count"));
                if ([v61 count])
                {
                  unint64_t v63 = 0;
                  do
                  {
                    v64 = [v61 objectAtIndexedSubscript:v63];
                    v65 = [v64 personId];

                    if (v65)
                    {
                      [v64 setPersonId:0];
                    }
                    else
                    {
                      [v64 identifier];
                      v67 = v66 = self;
                      v68 = +[_CDContactResolver resolveContactIfPossibleFromContactIdentifierString:v67];
                      v69 = [v68 identifier];

                      self = v66;
                      [v64 setPersonId:v69];
                      if (v69)
                      {
                        [v64 setPersonIdType:3];
                      }
                    }
                    [v62 addObject:v64];

                    ++v63;
                  }
                  while ([v61 count] > v63);
                }
                [v23 setRecipients:v62];

                BOOL v6 = v78;
                BOOL v5 = v79;
                v19 = v75;
              }
            }
            [v76 addObject:v23];
          }
        }
        ++v20;
      }
      while (v20 != v82);
      uint64_t v82 = [obj countByEnumeratingWithState:&v84 objects:v94 count:16];
      if (!v82)
      {
LABEL_55:

        id v71 = (id)[v76 copy];
        double v10 = v73;
        id v8 = v74;
        goto LABEL_57;
      }
    }
  }
  id v71 = v8;
LABEL_57:

  return v71;
}

- (id)description
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unint64_t v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@ { \n", v5];

  BOOL v6 = [NSNumber numberWithUnsignedInteger:self->_maxNumberOfInteractions];
  [v3 appendFormat:@"         maxNumber: %@\n", v6];

  id v7 = [NSNumber numberWithDouble:self->_maxLifespanInSeconds];
  [v3 appendFormat:@"       maxLifespan: %@\n", v7];

  id v8 = [NSNumber numberWithUnsignedInteger:self->_maxNumberOfInteractionsDeletedInBatch];
  [v3 appendFormat:@" maxDeletedInBatch: %@\n", v8];

  [v3 appendFormat:@"     defaultPolicy: %@\n", self->_defaultPolicy];
  [v3 appendFormat:@"   specialPolicies: {\n"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v9 = self->_specialPoliciesForMechanisms;
  uint64_t v10 = [(NSDictionary *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v15 = mechanismToString([v14 integerValue]);
        v16 = [(NSDictionary *)self->_specialPoliciesForMechanisms objectForKeyedSubscript:v14];
        [v3 appendFormat:@" %@  : %@\n", v15, v16];
      }
      uint64_t v11 = [(NSDictionary *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v17 = self->_specialPoliciesForBundleIds;
  uint64_t v18 = [(NSDictionary *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        id v23 = [(NSDictionary *)self->_specialPoliciesForBundleIds objectForKeyedSubscript:v22];
        [v3 appendFormat:@" %@  : %@\n", v22, v23, (void)v25];
      }
      uint64_t v19 = [(NSDictionary *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v19);
  }

  [v3 appendFormat:@"}\n"];
  [v3 appendString:@"}\n"];
  return v3;
}

- (void)setupDefaultHardcodedPolicies
{
  v22[5] = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&self->_maxNumberOfInteractions = xmmword_18EEAC630;
  self->_maxLifespanInSeconds = 14515200.0;
  id v3 = +[_CDInteractionPolicy defaultPolicy];
  defaultPolicy = self->_defaultPolicy;
  self->_defaultPolicy = v3;

  v21[0] = &unk_1EDE1DE20;
  BOOL v5 = +[_CDInteractionPolicy defaultPolicyForEmail];
  v22[0] = v5;
  v21[1] = &unk_1EDE1DE38;
  BOOL v6 = +[_CDInteractionPolicy defaultPolicyForMessages];
  v22[1] = v6;
  v21[2] = &unk_1EDE1DE50;
  id v7 = +[_CDInteractionPolicy defaultPolicyForMessages];
  v22[2] = v7;
  v21[3] = &unk_1EDE1DE68;
  id v8 = +[_CDInteractionPolicy defaultPolicyForMessages];
  v22[3] = v8;
  v21[4] = &unk_1EDE1DE80;
  double v9 = +[_CDInteractionPolicy defaultPolicyForMeetings];
  v22[4] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
  specialPoliciesForMechanisms = self->_specialPoliciesForMechanisms;
  self->_specialPoliciesForMechanisms = v10;

  v19[0] = @"com.apple.MobileSMS";
  uint64_t v12 = +[_CDInteractionPolicy specialPolicyForFirstPartyApps];
  v20[0] = v12;
  v19[1] = @"com.apple.iChat";
  v13 = +[_CDInteractionPolicy specialPolicyForFirstPartyApps];
  v20[1] = v13;
  v19[2] = @"com.apple.mobilemail";
  v14 = +[_CDInteractionPolicy specialPolicyForFirstPartyApps];
  v20[2] = v14;
  v19[3] = @"com.apple.mail";
  v15 = +[_CDInteractionPolicy specialPolicyForFirstPartyApps];
  v20[3] = v15;
  v19[4] = @"com.apple.UIKit.activity.AirDrop";
  v16 = +[_CDInteractionPolicy specialPolicyForFirstPartyApps];
  v20[4] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:5];
  specialPoliciesForBundleIds = self->_specialPoliciesForBundleIds;
  self->_specialPoliciesForBundleIds = v17;
}

- (void)readConfigurationPlist
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = +[_CDPaths policiesConfigPath];
  int v3 = 138412290;
  unint64_t v4 = v2;
  _os_log_error_impl(&dword_18ECEB000, a1, OS_LOG_TYPE_ERROR, "Failed to read %@", (uint8_t *)&v3, 0xCu);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultPolicy, 0);
  objc_storeStrong((id *)&self->_specialPoliciesForMechanisms, 0);
  objc_storeStrong((id *)&self->_specialPoliciesForBundleIds, 0);
}

@end