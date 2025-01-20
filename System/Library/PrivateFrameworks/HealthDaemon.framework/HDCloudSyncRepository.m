@interface HDCloudSyncRepository
- (BOOL)shouldPushToUnifiedZone;
- (CKContainer)primaryCKContainer;
- (HDCloudSyncAttachmentManager)attachmentManager;
- (HDCloudSyncAvailability)syncAvailability;
- (HDCloudSyncMedicalIDDataManager)medicalIDDataManager;
- (HDCloudSyncProfileManager)profileManager;
- (HDCloudSyncRepository)init;
- (HDCloudSyncRepository)initWithProfile:(id)a3 syncCircleIdentifier:(id)a4 primaryCKContainer:(id)a5 secondaryCKContainers:(id)a6 userRecordName:(id)a7;
- (HDCloudSyncRepositoryProfile)profile;
- (HDCloudSyncSharedSummaryManager)sharedSummaryManager;
- (HDCloudSyncSharingAuthorizationManager)sharingAuthorizationManager;
- (HDCloudSyncShimProviderProtocol)cloudSyncShimProvider;
- (HDCloudSyncSummarySharingEntryManager)sharingEntryManager;
- (HDCloudSyncSyncIdentityManager)syncIdentityManager;
- (HDSyncEngine)syncEngine;
- (HKProfileIdentifier)profileIdentifier;
- (NSArray)secondaryCKContainers;
- (NSSet)allCKContainers;
- (NSString)syncCircleIdentifier;
- (NSString)userRecordName;
- (_HKBehavior)behavior;
- (id)cachedOwnerIdentifierForContainer:(id)a3;
- (id)containerForContainerIdentifier:(id)a3;
- (id)description;
- (int)deviceMode;
- (int64_t)profileType;
- (unint64_t)repositorySettings;
- (void)cacheAllOwnerIdentifiersWithCompletion:(id)a3;
- (void)dealloc;
- (void)setRepositorySettings:(unint64_t)a3;
- (void)unitTest_setShouldPushToUnifiedZone:(BOOL)a3;
@end

@implementation HDCloudSyncRepository

- (HDCloudSyncRepository)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncRepository)initWithProfile:(id)a3 syncCircleIdentifier:(id)a4 primaryCKContainer:(id)a5 secondaryCKContainers:(id)a6 userRecordName:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!v14)
  {
    v68 = [MEMORY[0x1E4F28B00] currentHandler];
    [v68 handleFailureInMethod:a2, self, @"HDCloudSyncRepository.m", 120, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];
  }
  v70.receiver = self;
  v70.super_class = (Class)HDCloudSyncRepository;
  v19 = [(HDCloudSyncRepository *)&v70 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_profile, a3);
    uint64_t v21 = [(HDCloudSyncRepositoryProfile *)v20->_profile profileIdentifier];
    profileIdentifier = v20->_profileIdentifier;
    v20->_profileIdentifier = (HKProfileIdentifier *)v21;

    v20->_int64_t profileType = [(HKProfileIdentifier *)v20->_profileIdentifier type];
    objc_storeStrong((id *)&v20->_primaryCKContainer, a5);
    id v69 = v16;
    if (v20->_primaryCKContainer) {
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
    }
    else {
    uint64_t v23 = [MEMORY[0x1E4F1CAD0] set];
    }
    allCKContainers = v20->_allCKContainers;
    v20->_allCKContainers = (NSSet *)v23;

    uint64_t v25 = [v17 copy];
    secondaryCKContainers = v20->_secondaryCKContainers;
    v20->_secondaryCKContainers = (NSArray *)v25;

    uint64_t v27 = [(NSSet *)v20->_allCKContainers setByAddingObjectsFromArray:v20->_secondaryCKContainers];
    v28 = v20->_allCKContainers;
    v20->_allCKContainers = (NSSet *)v27;

    uint64_t v29 = [v15 copy];
    syncCircleIdentifier = v20->_syncCircleIdentifier;
    v20->_syncCircleIdentifier = (NSString *)v29;

    uint64_t v31 = [v18 copy];
    userRecordName = v20->_userRecordName;
    v20->_userRecordName = (NSString *)v31;

    v33 = [(HDCloudSyncRepositoryProfile *)v20->_profile daemon];
    uint64_t v34 = [v33 behavior];
    behavior = v20->_behavior;
    v20->_behavior = (_HKBehavior *)v34;

    v36 = [HDCloudSyncAvailability alloc];
    int64_t profileType = v20->_profileType;
    v38 = [(HDCloudSyncRepositoryProfile *)v20->_profile daemon];
    v39 = [v38 behavior];
    uint64_t v40 = [(HDCloudSyncAvailability *)v36 initWithProfileType:profileType behavior:v39];
    syncAvailability = v20->_syncAvailability;
    v20->_syncAvailability = (HDCloudSyncAvailability *)v40;

    uint64_t v42 = [v14 medicalIDDataManager];
    medicalIDDataManager = v20->_medicalIDDataManager;
    v20->_medicalIDDataManager = (HDCloudSyncMedicalIDDataManager *)v42;

    uint64_t v44 = [v14 attachmentManager];
    attachmentManager = v20->_attachmentManager;
    v20->_attachmentManager = (HDCloudSyncAttachmentManager *)v44;

    v46 = [v14 daemon];
    uint64_t v47 = [v46 profileManager];
    profileManager = v20->_profileManager;
    v20->_profileManager = (HDCloudSyncProfileManager *)v47;

    uint64_t v49 = [v14 sharingEntryManager];
    sharingEntryManager = v20->_sharingEntryManager;
    v20->_sharingEntryManager = (HDCloudSyncSummarySharingEntryManager *)v49;

    uint64_t v51 = [v14 sharingAuthorizationManager];
    sharingAuthorizationManager = v20->_sharingAuthorizationManager;
    v20->_sharingAuthorizationManager = (HDCloudSyncSharingAuthorizationManager *)v51;

    uint64_t v53 = [v14 sharedSummaryManager];
    sharedSummaryManager = v20->_sharedSummaryManager;
    v20->_sharedSummaryManager = (HDCloudSyncSharedSummaryManager *)v53;

    uint64_t v55 = [v14 syncIdentityManager];
    syncIdentityManager = v20->_syncIdentityManager;
    v20->_syncIdentityManager = (HDCloudSyncSyncIdentityManager *)v55;

    uint64_t v57 = [v14 syncEngine];
    syncEngine = v20->_syncEngine;
    v20->_syncEngine = (HDSyncEngine *)v57;

    v59 = [HDCloudSyncShimProvider alloc];
    v60 = [v14 legacyRepositoryProfile];
    uint64_t v61 = [(HDCloudSyncShimProvider *)v59 initWithProfile:v60];
    cloudSyncShimProvider = v20->_cloudSyncShimProvider;
    v20->_cloudSyncShimProvider = (HDCloudSyncShimProviderProtocol *)v61;

    int64_t v63 = v20->_profileType;
    if ((unint64_t)(v63 - 2) < 3 || v63 == 100)
    {
      v20->_shouldPushToUnifiedZone = 1;
    }
    else if (v63 == 1)
    {
      v20->_shouldPushToUnifiedZone = _os_feature_enabled_impl();
    }
    v64 = [(HDCloudSyncRepositoryProfile *)v20->_profile daemon];
    v65 = [v64 behavior];
    int v66 = [v65 isAppleWatch];

    id v16 = v69;
    if (v66) {
      v20->_shouldPushToUnifiedZone = 1;
    }
  }

  return v20;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HDCloudSyncRepository;
  [(HDCloudSyncRepository *)&v4 dealloc];
}

- (int)deviceMode
{
  int64_t profileType = self->_profileType;
  if (profileType == 1)
  {
    objc_super v4 = [(HDCloudSyncRepositoryProfile *)self->_profile daemon];
    v5 = [v4 behavior];
    if ([v5 tinkerModeEnabled]) {
      int v3 = 2;
    }
    else {
      int v3 = 1;
    }
  }
  else if (profileType == 3)
  {
    return 2;
  }
  else
  {
    return 1;
  }
  return v3;
}

- (void)unitTest_setShouldPushToUnifiedZone:(BOOL)a3
{
  self->_shouldPushToUnifiedZone = a3;
}

- (id)containerForContainerIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_allCKContainers;
  id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "containerIdentifier", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)cacheAllOwnerIdentifiersWithCompletion:(id)a3
{
  profile = self->_profile;
  id v5 = a3;
  id v9 = [(HDCloudSyncRepositoryProfile *)profile cloudSyncManager];
  id v6 = [v9 ownerIdentifierManager];
  uint64_t v7 = [(HDCloudSyncRepository *)self allCKContainers];
  v8 = [v7 allObjects];
  [v6 cacheOwnerIdentifiersForContainers:v8 completion:v5];
}

- (id)cachedOwnerIdentifierForContainer:(id)a3
{
  profile = self->_profile;
  id v4 = a3;
  id v5 = [(HDCloudSyncRepositoryProfile *)profile cloudSyncManager];
  id v6 = [v5 ownerIdentifierManager];
  uint64_t v7 = [v6 cachedOwnerIdentifierForContainer:v4];

  return v7;
}

- (id)description
{
  int v3 = [(NSArray *)self->_secondaryCKContainers hk_mapToSet:&__block_literal_global_57];
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  profileIdentifier = self->_profileIdentifier;
  uint64_t v7 = [self->_primaryCKContainer containerIdentifier];
  v8 = [v3 allObjects];
  id v9 = [v8 componentsJoinedByString:@", "];
  v10 = [v4 stringWithFormat:@"<%@:%p [%@] %@ (%@)>", v5, self, profileIdentifier, v7, v9];

  return v10;
}

uint64_t __36__HDCloudSyncRepository_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containerIdentifier];
}

- (HDCloudSyncRepositoryProfile)profile
{
  return self->_profile;
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (int64_t)profileType
{
  return self->_profileType;
}

- (CKContainer)primaryCKContainer
{
  return self->_primaryCKContainer;
}

- (NSArray)secondaryCKContainers
{
  return self->_secondaryCKContainers;
}

- (NSSet)allCKContainers
{
  return self->_allCKContainers;
}

- (HDCloudSyncAvailability)syncAvailability
{
  return self->_syncAvailability;
}

- (_HKBehavior)behavior
{
  return self->_behavior;
}

- (unint64_t)repositorySettings
{
  return self->_repositorySettings;
}

- (void)setRepositorySettings:(unint64_t)a3
{
  self->_repositorySettings = a3;
}

- (NSString)syncCircleIdentifier
{
  return self->_syncCircleIdentifier;
}

- (NSString)userRecordName
{
  return self->_userRecordName;
}

- (HDCloudSyncShimProviderProtocol)cloudSyncShimProvider
{
  return self->_cloudSyncShimProvider;
}

- (HDCloudSyncMedicalIDDataManager)medicalIDDataManager
{
  return self->_medicalIDDataManager;
}

- (HDCloudSyncAttachmentManager)attachmentManager
{
  return self->_attachmentManager;
}

- (HDCloudSyncSummarySharingEntryManager)sharingEntryManager
{
  return self->_sharingEntryManager;
}

- (HDCloudSyncSharedSummaryManager)sharedSummaryManager
{
  return self->_sharedSummaryManager;
}

- (HDCloudSyncSharingAuthorizationManager)sharingAuthorizationManager
{
  return self->_sharingAuthorizationManager;
}

- (HDCloudSyncSyncIdentityManager)syncIdentityManager
{
  return self->_syncIdentityManager;
}

- (HDCloudSyncProfileManager)profileManager
{
  return self->_profileManager;
}

- (HDSyncEngine)syncEngine
{
  return self->_syncEngine;
}

- (BOOL)shouldPushToUnifiedZone
{
  return self->_shouldPushToUnifiedZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_profileManager, 0);
  objc_storeStrong((id *)&self->_syncIdentityManager, 0);
  objc_storeStrong((id *)&self->_sharingAuthorizationManager, 0);
  objc_storeStrong((id *)&self->_sharedSummaryManager, 0);
  objc_storeStrong((id *)&self->_sharingEntryManager, 0);
  objc_storeStrong((id *)&self->_attachmentManager, 0);
  objc_storeStrong((id *)&self->_medicalIDDataManager, 0);
  objc_storeStrong((id *)&self->_cloudSyncShimProvider, 0);
  objc_storeStrong((id *)&self->_userRecordName, 0);
  objc_storeStrong((id *)&self->_syncCircleIdentifier, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_syncAvailability, 0);
  objc_storeStrong((id *)&self->_allCKContainers, 0);
  objc_storeStrong((id *)&self->_secondaryCKContainers, 0);
  objc_storeStrong((id *)&self->_primaryCKContainer, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end