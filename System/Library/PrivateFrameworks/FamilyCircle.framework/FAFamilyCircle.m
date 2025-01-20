@interface FAFamilyCircle
+ (BOOL)supportsSecureCoding;
- (BOOL)anyChildHasRemoteGuardians;
- (BOOL)canAddMembers;
- (BOOL)currentUserIsU13;
- (BOOL)familyHasU13Member;
- (BOOL)sharedPaymentEnabled;
- (BOOL)shouldBadgeInvitee;
- (BOOL)shouldBadgeOrganizer;
- (BOOL)shouldShowInvites;
- (BOOL)showAddMemberButton;
- (BOOL)showLocationSplashScreen;
- (BOOL)showRUIPages;
- (FAEligibilityRequirements)eligibilityRequirements;
- (FAFamilyCircle)init;
- (FAFamilyCircle)initWithCoder:(id)a3;
- (FAFamilyCircle)initWithServerResponse:(id)a3;
- (FAFamilyCloudKitProperties)cloudKitProperties;
- (FAFamilyMember)me;
- (FAFamilyMember)remoteGuardian;
- (FAFamilyMember)remoteGuardianPerson;
- (NSArray)allowedSubscriptions;
- (NSArray)childBotAllowlistedParents;
- (NSArray)firstNames;
- (NSArray)invites;
- (NSArray)members;
- (NSArray)pendingMembers;
- (NSArray)pendingMembersWithAllStatues;
- (NSDictionary)_serverResponse;
- (NSString)addMemberButtonLabel;
- (NSString)checklistRankingBucketType;
- (NSString)checklistRankingVersion;
- (NSString)childCutOffAge;
- (NSString)familyID;
- (NSString)familyMembersFooterLabel;
- (OS_dispatch_queue)processingQueue;
- (id)memberForAltDSID:(id)a3;
- (id)memberForDSID:(id)a3;
- (id)memberForPhoneNumber:(id)a3;
- (id)pendingInvitesOnly;
- (int)ageCategoryEnum;
- (int64_t)ageCategory;
- (void)encodeWithCoder:(id)a3;
- (void)setRemoteGuardianPerson:(id)a3;
@end

@implementation FAFamilyCircle

- (void)encodeWithCoder:(id)a3
{
  members = self->_members;
  id v5 = a3;
  [v5 encodeObject:members forKey:@"_members"];
  [v5 encodeObject:self->_cloudKitProperties forKey:@"_cloudKitProperties"];
  [v5 encodeObject:self->__serverResponse forKey:@"__serverResponse"];
  [v5 encodeObject:self->_childCutOffAge forKey:@"_childCutOffAge"];
  [v5 encodeBool:self->_canAddMembers forKey:@"_canAddMembers"];
  [v5 encodeObject:self->_addMemberButtonLabel forKey:@"_addMemberButtonLabel"];
  [v5 encodeObject:self->_eligibilityRequirements forKey:@"family-recommendation-info"];
  [v5 encodeObject:self->_familyMembersFooterLabel forKey:@"_familyMembersFooterLabel"];
  [v5 encodeObject:self->_allowedSubscriptions forKey:@"_allowedSubscriptions"];
  [v5 encodeBool:self->_showAddMemberButton forKey:@"_showAddMemberButton"];
  [v5 encodeBool:self->_shouldShowInvites forKey:@"_shouldShowInvites"];
  [v5 encodeBool:self->_showLocationSplashScreen forKey:@"_showLocationSplashScreen"];
  [v5 encodeBool:self->_showRUIPages forKey:@"_showRUIPages"];
  [v5 encodeObject:self->_familyID forKey:@"_familyID"];
  [v5 encodeInteger:self->_ageCategory forKey:@"_ageCategory"];
  [v5 encodeBool:self->_sharedPayementEnabled forKey:@"_sharedPayementEnabled"];
  [v5 encodeObject:self->_checklistRankingBucketType forKey:@"_checklistRankingBucketType"];
  [v5 encodeObject:self->_checklistRankingVersion forKey:@"_checklistRankingVersion"];
  [v5 encodeBool:self->_shouldBadgeOrganizer forKey:@"_shouldBadgeOrganizer"];
  [v5 encodeBool:self->_shouldBadgeInvitee forKey:@"_shouldBadgeInvitee"];
  [v5 encodeObject:self->_childBotAllowlistedParents forKey:@"_childBotAllowlistedParents"];
}

- (NSArray)members
{
  return self->_members;
}

- (id)pendingInvitesOnly
{
  v2 = [(FAFamilyCircle *)self invites];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_5];
    id v4 = [v2 filteredArrayUsingPredicate:v3];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }

  return v4;
}

- (FAFamilyCircle)initWithCoder:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)FAFamilyCircle;
  id v5 = [(FAFamilyCircle *)&v47 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_members"];
    members = v5->_members;
    v5->_members = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_cloudKitProperties"];
    cloudKitProperties = v5->_cloudKitProperties;
    v5->_cloudKitProperties = (FAFamilyCloudKitProperties *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"__serverResponse"];
    serverResponse = v5->__serverResponse;
    v5->__serverResponse = (NSDictionary *)v19;

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"family-recommendation-info"];
    v22 = v21;
    if (v21) {
      v23 = v21;
    }
    else {
      v23 = objc_alloc_init(FAEligibilityRequirements);
    }
    eligibilityRequirements = v5->_eligibilityRequirements;
    v5->_eligibilityRequirements = v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_childCutOffAge"];
    childCutOffAge = v5->_childCutOffAge;
    v5->_childCutOffAge = (NSString *)v25;

    v5->_canAddMembers = [v4 decodeBoolForKey:@"_canAddMembers"];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_addMemberButtonLabel"];
    addMemberButtonLabel = v5->_addMemberButtonLabel;
    v5->_addMemberButtonLabel = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_familyMembersFooterLabel"];
    familyMembersFooterLabel = v5->_familyMembersFooterLabel;
    v5->_familyMembersFooterLabel = (NSString *)v29;

    uint64_t v31 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_allowedSubscriptions"];
    allowedSubscriptions = v5->_allowedSubscriptions;
    v5->_allowedSubscriptions = (NSArray *)v31;

    v5->_showAddMemberButton = [v4 decodeBoolForKey:@"_showAddMemberButton"];
    v5->_shouldShowInvites = [v4 decodeBoolForKey:@"_shouldShowInvites"];
    v5->_showLocationSplashScreen = [v4 decodeBoolForKey:@"_showLocationSplashScreen"];
    v5->_showRUIPages = [v4 decodeBoolForKey:@"_showRUIPages"];
    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_familyID"];
    familyID = v5->_familyID;
    v5->_familyID = (NSString *)v33;

    v5->_ageCategory = [v4 decodeIntegerForKey:@"_ageCategory"];
    v5->_sharedPayementEnabled = [v4 decodeBoolForKey:@"_sharedPayementEnabled"];
    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_checklistRankingBucketType"];
    checklistRankingBucketType = v5->_checklistRankingBucketType;
    v5->_checklistRankingBucketType = (NSString *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_checklistRankingVersion"];
    checklistRankingVersion = v5->_checklistRankingVersion;
    v5->_checklistRankingVersion = (NSString *)v37;

    if ([v4 containsValueForKey:@"_shouldBadgeOrganizer"]) {
      char v39 = [v4 decodeBoolForKey:@"_shouldBadgeOrganizer"];
    }
    else {
      char v39 = 1;
    }
    v5->_shouldBadgeOrganizer = v39;
    if ([v4 containsValueForKey:@"_shouldBadgeInvitee"]) {
      char v40 = [v4 decodeBoolForKey:@"_shouldBadgeInvitee"];
    }
    else {
      char v40 = 1;
    }
    v5->_shouldBadgeInvitee = v40;
    uint64_t v41 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_childBotAllowlistedParents"];
    childBotAllowlistedParents = v5->_childBotAllowlistedParents;
    v5->_childBotAllowlistedParents = (NSArray *)v41;

    v43 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v44 = dispatch_queue_create("com.apple.family.familyCircle", v43);
    processingQueue = v5->_processingQueue;
    v5->_processingQueue = (OS_dispatch_queue *)v44;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMembersFooterLabel, 0);
  objc_storeStrong((id *)&self->_addMemberButtonLabel, 0);
  objc_storeStrong((id *)&self->__serverResponse, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_remoteGuardianPerson, 0);
  objc_storeStrong((id *)&self->_cloudKitProperties, 0);
  objc_storeStrong((id *)&self->_eligibilityRequirements, 0);
  objc_storeStrong((id *)&self->_childBotAllowlistedParents, 0);
  objc_storeStrong((id *)&self->_checklistRankingVersion, 0);
  objc_storeStrong((id *)&self->_checklistRankingBucketType, 0);
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_invites, 0);
  objc_storeStrong((id *)&self->_pendingMembersWithAllStatues, 0);
  objc_storeStrong((id *)&self->_pendingMembers, 0);
  objc_storeStrong((id *)&self->_allowedSubscriptions, 0);
  objc_storeStrong((id *)&self->_childCutOffAge, 0);
  objc_storeStrong((id *)&self->_members, 0);
}

- (NSArray)pendingMembers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__FAFamilyCircle_pendingMembers__block_invoke;
  v5[3] = &unk_1E6924ED0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(processingQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)invites
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__FAFamilyCircle_invites__block_invoke;
  v5[3] = &unk_1E6924ED0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(processingQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSDictionary)_serverResponse
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (FAFamilyCircle)initWithServerResponse:(id)a3
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v111.receiver = self;
  v111.super_class = (Class)FAFamilyCircle;
  uint64_t v6 = [(FAFamilyCircle *)&v111 init];
  uint64_t v7 = (FAFamilyCircle *)v6;
  if (v6)
  {
    *(_WORD *)(v6 + 9) = 257;
    objc_storeStrong((id *)v6 + 19, a3);
    uint64_t v8 = [v5 objectForKeyedSubscript:@"family-id"];

    if (v8)
    {
      uint64_t v9 = [v5 objectForKeyedSubscript:@"family-id"];
      familyID = v7->_familyID;
      v7->_familyID = (NSString *)v9;
    }
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"memberSortOrder" ascending:1];
    v12 = [v5 objectForKeyedSubscript:@"family-members"];
    v13 = v12;
    if (v12 && [v12 count])
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      v97 = v13;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v107 objects:v119 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v108;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v108 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = [[FAFamilyMember alloc] initWithDictionaryRepresentation:*(void *)(*((void *)&v107 + 1) + 8 * i)];
            [v14 addObject:v20];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v107 objects:v119 count:16];
        }
        while (v17);
      }

      v118 = v11;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v118 count:1];
      [v14 sortUsingDescriptors:v21];

      uint64_t v22 = [v14 copy];
      members = v7->_members;
      v7->_members = (NSArray *)v22;

      v13 = v97;
    }
    if (_os_feature_enabled_impl())
    {
      v96 = v11;
      v98 = v13;
      v24 = [v5 objectForKeyedSubscript:@"person-info"];
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (v24 && [v24 count])
      {
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        v95 = v24;
        id v26 = v24;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v103 objects:v117 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v104;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v104 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = [[FAFamilyMember alloc] initWithDictionaryRepresentation:*(void *)(*((void *)&v103 + 1) + 8 * j)];
              v32 = [(FAFamilyMember *)v31 dsid];
              [v25 setObject:v31 forKeyedSubscript:v32];
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v103 objects:v117 count:16];
          }
          while (v28);
        }

        v24 = v95;
      }
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      uint64_t v33 = v7->_members;
      uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v99 objects:v116 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v100;
        do
        {
          for (uint64_t k = 0; k != v35; ++k)
          {
            if (*(void *)v100 != v36) {
              objc_enumerationMutation(v33);
            }
            [*(id *)(*((void *)&v99 + 1) + 8 * k) finishWith:v25];
          }
          uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v99 objects:v116 count:16];
        }
        while (v35);
      }

      id v11 = v96;
      v13 = v98;
      if (![(NSArray *)v7->_members count])
      {
        v38 = [v5 objectForKeyedSubscript:@"member-guardian"];
        if (v38)
        {
          char v39 = _FALogSystem();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D252C000, v39, OS_LOG_TYPE_DEFAULT, "Remote guardian key found", buf, 2u);
          }

          char v40 = [[FAFamilyMember alloc] initWithDictionaryRepresentation:v38];
          remoteGuardianPerson = v7->_remoteGuardianPerson;
          v7->_remoteGuardianPerson = v40;

          [(FAFamilyMember *)v7->_remoteGuardianPerson finishWith:v25];
        }
      }
      v42 = [(FAFamilyCircle *)v7 remoteGuardian];

      if (v24 && !v42)
      {
        v43 = _FALogSystem();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          -[FAFamilyCircle initWithServerResponse:](v43);
        }
      }
    }
    dispatch_queue_t v44 = [v5 objectForKeyedSubscript:@"ck-handles"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45 = [v5 objectForKeyedSubscript:@"ck-handles"];
    }
    else
    {
      v45 = 0;
    }

    v46 = [[FAFamilyCloudKitProperties alloc] initWithDictionaryRepresentation:v45];
    cloudKitProperties = v7->_cloudKitProperties;
    v7->_cloudKitProperties = v46;

    v48 = [v5 objectForKeyedSubscript:@"family-recommendation-info"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v49 = [v5 objectForKeyedSubscript:@"family-recommendation-info"];
    }
    else
    {
      v49 = 0;
    }

    v50 = [[FAEligibilityRequirements alloc] initWithDictionaryRepresentation:v49];
    eligibilityRequirements = v7->_eligibilityRequirements;
    v7->_eligibilityRequirements = v50;

    v52 = [v5 objectForKeyedSubscript:@"show-location-splash-screen"];

    if (v52)
    {
      v53 = [v5 objectForKeyedSubscript:@"show-location-splash-screen"];
      v7->_showLocationSplashScreen = [v53 BOOLValue];
    }
    else
    {
      v7->_showLocationSplashScreen = 0;
    }
    v54 = [v5 objectForKeyedSubscript:@"age-category"];
    if ([v54 isEqualToString:@"ADULT"])
    {
      v7->_int64_t ageCategory = 0;
    }
    else
    {
      if ([v54 isEqualToString:@"TEEN"])
      {
        uint64_t v55 = 1;
      }
      else if ([v54 isEqualToString:@"CHILD"])
      {
        uint64_t v55 = 2;
      }
      else
      {
        uint64_t v55 = -1;
      }
      v7->_int64_t ageCategory = v55;
    }
    v56 = _FALogSystem();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      int64_t ageCategory = v7->_ageCategory;
      *(_DWORD *)buf = 138412546;
      v113 = v54;
      __int16 v114 = 2048;
      int64_t v115 = ageCategory;
      _os_log_impl(&dword_1D252C000, v56, OS_LOG_TYPE_DEFAULT, "Current user age category is %@, FAMemberType %ld", buf, 0x16u);
    }

    v58 = [v5 objectForKeyedSubscript:@"age-category-enum"];
    int v59 = [v58 intValue];

    v7->_ageCategoryEnum = v59;
    v60 = [v5 objectForKey:@"family-meta-info"];
    if (v60)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v61 = [v60 objectForKeyedSubscript:@"childCutOffAge"];
        childCutOffAge = v7->_childCutOffAge;
        v7->_childCutOffAge = (NSString *)v61;

        v63 = [v60 objectForKeyedSubscript:@"add-member-enabled"];
        v7->_canAddMembers = [v63 BOOLValue];

        uint64_t v64 = [v60 objectForKeyedSubscript:@"add-member-label"];
        addMemberButtonLabel = v7->_addMemberButtonLabel;
        v7->_addMemberButtonLabel = (NSString *)v64;

        uint64_t v66 = [v60 objectForKeyedSubscript:@"family-members-footer"];
        familyMembersFooterLabel = v7->_familyMembersFooterLabel;
        v7->_familyMembersFooterLabel = (NSString *)v66;

        v68 = [v60 objectForKeyedSubscript:@"allowed-apple-subscriptions"];

        if (v68)
        {
          uint64_t v69 = [v60 objectForKeyedSubscript:@"allowed-apple-subscriptions"];
          allowedSubscriptions = v7->_allowedSubscriptions;
          v7->_allowedSubscriptions = (NSArray *)v69;
        }
        else
        {
          allowedSubscriptions = v7->_allowedSubscriptions;
          v7->_allowedSubscriptions = 0;
        }

        v71 = [v60 objectForKeyedSubscript:@"show-add-member-button"];

        if (v71)
        {
          v72 = [v60 objectForKeyedSubscript:@"show-add-member-button"];
          v7->_showAddMemberButton = [v72 BOOLValue];
        }
        else
        {
          v7->_showAddMemberButton = 1;
        }
        v73 = [v60 objectForKeyedSubscript:@"should-show-invites"];

        if (v73)
        {
          v74 = [v60 objectForKeyedSubscript:@"should-show-invites"];
          v7->_shouldShowInvites = [v74 BOOLValue];
        }
        else
        {
          v7->_shouldShowInvites = 0;
        }
        v75 = [v60 objectForKeyedSubscript:@"use-rui-pages"];

        if (v75)
        {
          v76 = [v60 objectForKeyedSubscript:@"use-rui-pages"];
          v7->_showRUIPages = [v76 BOOLValue];
        }
        else
        {
          v7->_showRUIPages = 0;
        }
        v77 = [v60 objectForKeyedSubscript:@"family-share-payment-enabled"];

        if (v77)
        {
          v78 = [v60 objectForKeyedSubscript:@"family-share-payment-enabled"];
          v7->_sharedPayementEnabled = [v78 BOOLValue];
        }
        else
        {
          v7->_sharedPayementEnabled = 0;
        }
        v79 = [v60 objectForKeyedSubscript:@"checklist-ranking-bucket-type"];

        if (v79)
        {
          uint64_t v80 = [v60 objectForKeyedSubscript:@"checklist-ranking-bucket-type"];
          checklistRankingBucketType = v7->_checklistRankingBucketType;
          v7->_checklistRankingBucketType = (NSString *)v80;
        }
        v82 = [v60 objectForKeyedSubscript:@"checklist-ranking-version"];

        if (v82)
        {
          uint64_t v83 = [v60 objectForKeyedSubscript:@"checklist-ranking-version"];
          checklistRankingVersion = v7->_checklistRankingVersion;
          v7->_checklistRankingVersion = (NSString *)v83;
        }
        v7->_shouldBadgeOrganizer = 1;
        v85 = [v60 objectForKeyedSubscript:@"is-badging-disabled-organizer"];

        if (v85)
        {
          v86 = [v60 objectForKeyedSubscript:@"is-badging-disabled-organizer"];
          v7->_shouldBadgeOrganizer = [v86 BOOLValue] ^ 1;
        }
        v7->_shouldBadgeInvitee = 1;
        v87 = [v60 objectForKeyedSubscript:@"is-badging-disabled-invitee"];

        if (v87)
        {
          v88 = [v60 objectForKeyedSubscript:@"is-badging-disabled-invitee"];
          v7->_shouldBadgeInvitee = [v88 BOOLValue] ^ 1;
        }
      }
    }
    v89 = [v5 objectForKey:@"child-bot-details"];
    if (v89)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v90 = [v89 objectForKey:@"allowListed-parents"];
        if (v90)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeStrong((id *)&v7->_childBotAllowlistedParents, v90);
          }
        }
      }
    }
    v91 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v92 = dispatch_queue_create("com.apple.family.familyCircle", v91);
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v92;
  }
  return v7;
}

- (FAFamilyCircle)init
{
  v9.receiver = self;
  v9.super_class = (Class)FAFamilyCircle;
  v2 = [(FAFamilyCircle *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C978] array];
    id v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    *((void *)v2 + 11) = -1;
    *((_DWORD *)v2 + 4) = 0;
    *(_WORD *)(v2 + 9) = 257;
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.family.familyCircle", v5);
    uint64_t v7 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = v6;
  }
  return (FAFamilyCircle *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FAFamilyMember)me
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  objc_super v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __20__FAFamilyCircle_me__block_invoke;
  v5[3] = &unk_1E6924ED0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(processingQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (FAFamilyMember *)v3;
}

- (FAFamilyMember)remoteGuardian
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  remoteGuardianPerson = self->_remoteGuardianPerson;
  if (remoteGuardianPerson)
  {
    id v3 = remoteGuardianPerson;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = self->_members;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v9, "isMe", (void)v13))
          {
            v10 = [v9 remoteChildren];
            uint64_t v11 = [v10 count];

            if (v11)
            {
              id v3 = v9;

              goto LABEL_14;
            }
          }
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    id v3 = 0;
  }
LABEL_14:
  return v3;
}

- (BOOL)anyChildHasRemoteGuardians
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = self->_members;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "remoteGuardians", (void)v10);
          uint64_t v8 = [v7 count];

          if (v8)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)memberForAltDSID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    long long v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__0;
    long long v16 = __Block_byref_object_dispose__0;
    id v17 = 0;
    members = self->_members;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __35__FAFamilyCircle_memberForAltDSID___block_invoke;
    v9[3] = &unk_1E6924E88;
    id v10 = v4;
    long long v11 = &v12;
    [(NSArray *)members enumerateObjectsUsingBlock:v9];
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __35__FAFamilyCircle_memberForAltDSID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 altDSID];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)memberForDSID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 intValue])
  {
    uint64_t v12 = 0;
    long long v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__0;
    long long v16 = __Block_byref_object_dispose__0;
    id v17 = 0;
    members = self->_members;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __32__FAFamilyCircle_memberForDSID___block_invoke;
    v9[3] = &unk_1E6924E88;
    id v10 = v5;
    long long v11 = &v12;
    [(NSArray *)members enumerateObjectsUsingBlock:v9];
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __32__FAFamilyCircle_memberForDSID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = [v10 dsid];
  int v8 = [v7 intValue];
  int v9 = [*(id *)(a1 + 32) intValue];

  if (v8 == v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)memberForPhoneNumber:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v4];
  uint64_t v6 = [v5 fullyQualifiedDigits];

  if (v6)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = [(FAFamilyCircle *)self members];
    uint64_t v23 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v23)
    {
      uint64_t v8 = *(void *)v30;
      v24 = v7;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v7);
          }
          id v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v11 = [v10 memberPhoneNumbers];
          uint64_t v12 = [v11 componentsSeparatedByString:@","];

          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v13 = v12;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v26;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v26 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void **)(*((void *)&v25 + 1) + 8 * j);
                if ([v18 length])
                {
                  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v18];
                  if ([v5 isLikePhoneNumber:v19])
                  {
                    id v20 = v10;

                    id v7 = v24;
                    goto LABEL_23;
                  }
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          id v7 = v24;
          uint64_t v8 = v22;
        }
        id v20 = 0;
        uint64_t v23 = [v24 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v23);
    }
    else
    {
      id v20 = 0;
    }
LABEL_23:
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (NSArray)firstNames
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(FAFamilyCircle *)self members];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [(FAFamilyCircle *)self members];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (!v7) {
      goto LABEL_16;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (([v11 isMe] & 1) == 0)
        {
          uint64_t v12 = [v11 contact];
          id v13 = [v12 givenName];

          uint64_t v14 = [v11 firstName];
          if ([v13 length])
          {
            uint64_t v15 = v5;
            uint64_t v16 = v13;
            goto LABEL_12;
          }
          if (v14)
          {
            uint64_t v15 = v5;
            uint64_t v16 = v14;
LABEL_12:
            [v15 addObject:v16];
          }

          continue;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (!v8)
      {
LABEL_16:

        id v17 = (void *)[v5 copy];
        goto LABEL_18;
      }
    }
  }
  id v17 = 0;
LABEL_18:
  return (NSArray *)v17;
}

uint64_t __36__FAFamilyCircle_pendingInvitesOnly__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 inviteStatus];
  uint64_t v3 = [v2 isEqual:@"Pending"];

  return v3;
}

void __25__FAFamilyCircle_invites__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[8];
  if (!v3)
  {
    uint64_t v4 = [v2 _serverResponse];
    id v5 = [v4 objectForKey:@"family-invitations"];

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v28 = v1;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      obuint64_t j = v5;
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v31 != v9) {
              objc_enumerationMutation(obj);
            }
            long long v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            uint64_t v12 = objc_alloc_init(FAFamilyInvite);
            id v13 = [v11 objectForKeyedSubscript:@"invitee-last-name"];
            [(FAFamilyInvite *)v12 setOrganizerLastName:v13];

            uint64_t v14 = [v11 objectForKeyedSubscript:@"invitee-first-name"];
            [(FAFamilyInvite *)v12 setOrganizerFirstName:v14];

            uint64_t v15 = [v11 objectForKeyedSubscript:@"inviter-email"];
            [(FAFamilyInvite *)v12 setOrganizerEmail:v15];

            uint64_t v16 = [v11 objectForKeyedSubscript:@"invite-code"];
            [(FAFamilyInvite *)v12 setCode:v16];

            id v17 = [v11 objectForKeyedSubscript:@"invitee-dsid"];
            [(FAFamilyInvite *)v12 setOrganizerDSID:v17];

            uint64_t v18 = [v11 objectForKeyedSubscript:@"invite-status"];
            [(FAFamilyInvite *)v12 setInviteStatus:v18];

            long long v19 = [v11 objectForKeyedSubscript:@"inviteDateEpoch"];
            if (v19)
            {
              id v20 = objc_alloc(MEMORY[0x1E4F1C9C8]);
              [v19 doubleValue];
              uint64_t v22 = [v20 initWithTimeIntervalSince1970:v21 / 1000.0];
            }
            else
            {
              uint64_t v22 = [MEMORY[0x1E4F1C9C8] distantPast];
            }
            uint64_t v23 = (void *)v22;
            uint64_t v24 = [v11 objectForKeyedSubscript:@"badge-after-invite-delay"];
            if (!v24)
            {
              uint64_t v24 = +[FAFamilyMember defaultInvitationDelay];
            }
            [(FAFamilyInvite *)v12 setInviteDate:v23];
            [(FAFamilyInvite *)v12 setBadgeAfter:v24];
            [v6 addObject:v12];
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v8);
      }

      uint64_t v1 = v28;
    }
    uint64_t v25 = [v6 copy];
    uint64_t v26 = *(void *)(v1 + 32);
    long long v27 = *(void **)(v26 + 64);
    *(void *)(v26 + 64) = v25;

    uint64_t v3 = *(void **)(*(void *)(v1 + 32) + 64);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 40) + 8) + 40), v3);
}

void __32__FAFamilyCircle_pendingMembers__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = [*(id *)(v1 + 32) _serverResponse];
    id v5 = [v4 objectForKey:@"pending-members"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = v5;
      uint64_t v19 = v1;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v21 != v9) {
              objc_enumerationMutation(v6);
            }
            long long v11 = [[FAFamilyMember alloc] initWithDictionaryRepresentation:*(void *)(*((void *)&v20 + 1) + 8 * i)];
            uint64_t v12 = [(FAFamilyMember *)v11 inviteEmail];

            if (v12)
            {
              id v13 = [(FAFamilyMember *)v11 statusString];
              int v14 = [v13 isEqual:@"Pending"];

              if (v14) {
                [v3 addObject:v11];
              }
            }
            else
            {
              uint64_t v15 = _FALogSystem();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v25 = v11;
                _os_log_impl(&dword_1D252C000, v15, OS_LOG_TYPE_DEFAULT, "No invite email, dropping %@", buf, 0xCu);
              }
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
        }
        while (v8);
      }

      id v5 = v18;
      uint64_t v1 = v19;
    }
    uint64_t v16 = *(void *)(v1 + 32);
    id v17 = *(void **)(v16 + 48);
    *(void *)(v16 + 48) = v3;

    v2 = *(void **)(*(void *)(v1 + 32) + 48);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 40) + 8) + 40), v2);
}

- (NSArray)pendingMembersWithAllStatues
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__FAFamilyCircle_pendingMembersWithAllStatues__block_invoke;
  v5[3] = &unk_1E6924ED0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(processingQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __46__FAFamilyCircle_pendingMembersWithAllStatues__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = [*(id *)(a1 + 32) _serverResponse];
    id v5 = [v4 objectForKey:@"pending-members"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v17;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
            uint64_t v12 = [FAFamilyMember alloc];
            id v13 = -[FAFamilyMember initWithDictionaryRepresentation:](v12, "initWithDictionaryRepresentation:", v11, (void)v16);
            [v3 addObject:v13];

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v8);
      }
    }
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 56);
    *(void *)(v14 + 56) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void __20__FAFamilyCircle_me__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 72);
  if (!v3)
  {
    uint64_t v4 = *(void **)(v2 + 24);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __20__FAFamilyCircle_me__block_invoke_2;
    v5[3] = &unk_1E6924EF8;
    v5[4] = v2;
    [v4 enumerateObjectsUsingBlock:v5];
    id v3 = *(void **)(*(void *)(a1 + 32) + 72);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

void __20__FAFamilyCircle_me__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isMe])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), a2);
    *a4 = 1;
  }
}

- (BOOL)currentUserIsU13
{
  id v3 = [(FAFamilyCircle *)self me];
  if (v3)
  {
    uint64_t v4 = [(FAFamilyCircle *)self me];
    char v5 = [v4 isChildAccount];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)familyHasU13Member
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = self->_members;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isChildAccount", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)childCutOffAge
{
  return self->_childCutOffAge;
}

- (NSArray)allowedSubscriptions
{
  return self->_allowedSubscriptions;
}

- (NSString)familyID
{
  return self->_familyID;
}

- (int64_t)ageCategory
{
  return self->_ageCategory;
}

- (BOOL)sharedPaymentEnabled
{
  return self->_sharedPayementEnabled;
}

- (NSString)checklistRankingBucketType
{
  return self->_checklistRankingBucketType;
}

- (NSString)checklistRankingVersion
{
  return self->_checklistRankingVersion;
}

- (BOOL)shouldBadgeOrganizer
{
  return self->_shouldBadgeOrganizer;
}

- (BOOL)shouldBadgeInvitee
{
  return self->_shouldBadgeInvitee;
}

- (NSArray)childBotAllowlistedParents
{
  return self->_childBotAllowlistedParents;
}

- (FAEligibilityRequirements)eligibilityRequirements
{
  return (FAEligibilityRequirements *)objc_getProperty(self, a2, 120, 1);
}

- (FAFamilyCloudKitProperties)cloudKitProperties
{
  return (FAFamilyCloudKitProperties *)objc_getProperty(self, a2, 128, 1);
}

- (FAFamilyMember)remoteGuardianPerson
{
  return (FAFamilyMember *)objc_getProperty(self, a2, 136, 1);
}

- (void)setRemoteGuardianPerson:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (BOOL)shouldShowInvites
{
  return self->_shouldShowInvites;
}

- (BOOL)canAddMembers
{
  return self->_canAddMembers;
}

- (NSString)addMemberButtonLabel
{
  return self->_addMemberButtonLabel;
}

- (NSString)familyMembersFooterLabel
{
  return self->_familyMembersFooterLabel;
}

- (BOOL)showAddMemberButton
{
  return self->_showAddMemberButton;
}

- (BOOL)showLocationSplashScreen
{
  return self->_showLocationSplashScreen;
}

- (BOOL)showRUIPages
{
  return self->_showRUIPages;
}

- (int)ageCategoryEnum
{
  return self->_ageCategoryEnum;
}

- (void)initWithServerResponse:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D252C000, log, OS_LOG_TYPE_ERROR, "Failed to get a remote guardian but have DSID:Person map", v1, 2u);
}

@end