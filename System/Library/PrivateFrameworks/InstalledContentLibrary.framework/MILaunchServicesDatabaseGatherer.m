@interface MILaunchServicesDatabaseGatherer
+ (BOOL)enumerateAppExtensionsInBundle:(id)a3 forPersona:(id)a4 updatingAppExtensionParentID:(BOOL)a5 ensureAppExtensionsAreExecutable:(BOOL)a6 installProfiles:(BOOL)a7 error:(id *)a8 enumerator:(id)a9;
+ (id)_createDataContainerAndSetDataProtectionForBundle:(id)a3 forPersona:(id)a4 error:(id *)a5;
+ (id)_createPluginDataContainerForAppexBundle:(id)a3 forPersona:(id)a4 setParent:(id)a5;
+ (id)entryForBundle:(id)a3 inContainer:(id)a4 forPersona:(id)a5 withError:(id *)a6;
+ (id)fetchInfoForBundle:(id)a3 forPersona:(id)a4 inContainer:(id)a5 withError:(id *)a6;
- (BOOL)_markDriverKitExtensionsExecutableInBundle:(id)a3 withError:(id *)a4;
- (BOOL)_scanAppExtensionsInBundle:(id)a3 inBundleContainer:(id)a4 withError:(id *)a5;
- (BOOL)_scanBundle:(id)a3 inContainer:(id)a4 addingToBundleSet:(id)a5 enumeratingEntry:(id)a6 withError:(id *)a7;
- (BOOL)performGatherWithError:(id *)a3;
- (BOOL)scanAppExtensionsInFrameworkBundle:(id)a3 withError:(id *)a4;
- (BOOL)scanExecutableBundle:(id)a3 inContainer:(id)a4 forPersona:(id)a5 withError:(id *)a6;
- (BOOL)shouldUpdateAppExtensionDataContainersWithParentID;
- (MILaunchServicesDatabaseGatherer)initWithOptions:(unint64_t)a3 enumerator:(id)a4;
- (MILaunchServicesDatabaseGatherer)initWithOptions:(unint64_t)a3 personaUniqueString:(id)a4 enumerator:(id)a5;
- (NSMutableSet)appExtensions;
- (NSMutableSet)coreServices;
- (NSMutableSet)frameworks;
- (NSMutableSet)internalApps;
- (NSMutableSet)systemAppPlaceholders;
- (NSMutableSet)systemApps;
- (NSMutableSet)userApps;
- (NSString)personaUniqueString;
- (id)_setForEntry:(id)a3;
- (id)enumerator;
- (unint64_t)gatherOptions;
- (void)errorOccurred:(id)a3;
@end

@implementation MILaunchServicesDatabaseGatherer

- (MILaunchServicesDatabaseGatherer)initWithOptions:(unint64_t)a3 personaUniqueString:(id)a4 enumerator:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)MILaunchServicesDatabaseGatherer;
  v11 = [(MILaunchServicesDatabaseGatherer *)&v30 init];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    internalApps = v11->_internalApps;
    v11->_internalApps = (NSMutableSet *)v12;

    uint64_t v14 = objc_opt_new();
    systemApps = v11->_systemApps;
    v11->_systemApps = (NSMutableSet *)v14;

    uint64_t v16 = objc_opt_new();
    userApps = v11->_userApps;
    v11->_userApps = (NSMutableSet *)v16;

    uint64_t v18 = objc_opt_new();
    appExtensions = v11->_appExtensions;
    v11->_appExtensions = (NSMutableSet *)v18;

    uint64_t v20 = objc_opt_new();
    frameworks = v11->_frameworks;
    v11->_frameworks = (NSMutableSet *)v20;

    uint64_t v22 = objc_opt_new();
    coreServices = v11->_coreServices;
    v11->_coreServices = (NSMutableSet *)v22;

    uint64_t v24 = objc_opt_new();
    systemAppPlaceholders = v11->_systemAppPlaceholders;
    v11->_systemAppPlaceholders = (NSMutableSet *)v24;

    v26 = +[MIDaemonConfiguration sharedInstance];
    v11->_shouldUpdateAppExtensionDataContainersWithParentID = [v26 haveUpdatedAppExtensionDataContainersWithParentID] ^ 1;

    if (v11->_shouldUpdateAppExtensionDataContainersWithParentID && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)) {
      MOLogWrite();
    }
    uint64_t v27 = MEMORY[0x1C1878AA0](v10);
    id enumerator = v11->_enumerator;
    v11->_id enumerator = (id)v27;

    v11->_gatherOptions = a3;
    objc_storeStrong((id *)&v11->_personaUniqueString, a4);
  }

  return v11;
}

- (MILaunchServicesDatabaseGatherer)initWithOptions:(unint64_t)a3 enumerator:(id)a4
{
  return [(MILaunchServicesDatabaseGatherer *)self initWithOptions:a3 personaUniqueString:0 enumerator:a4];
}

+ (id)_createPluginDataContainerForAppexBundle:(id)a3 forPersona:(id)a4 setParent:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  char v16 = 0;
  id v15 = 0;
  id v10 = [v7 dataContainerCreatingIfNeeded:1 forPersona:v8 makeLive:1 created:&v16 error:&v15];
  id v11 = v15;
  if (v10)
  {
    if (v9 && !v16) {
      [v10 setParentBundleID:v9];
    }
    id v12 = v10;
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    uint64_t v14 = [v7 identifier];
    MOLogWrite();
  }
  return v10;
}

+ (BOOL)enumerateAppExtensionsInBundle:(id)a3 forPersona:(id)a4 updatingAppExtensionParentID:(BOOL)a5 ensureAppExtensionsAreExecutable:(BOOL)a6 installProfiles:(BOOL)a7 error:(id *)a8 enumerator:(id)a9
{
  BOOL v63 = a6;
  BOOL v64 = a7;
  BOOL v65 = a5;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v61 = a4;
  v62 = (void (**)(id, void *, void))a9;
  id v11 = [v10 identifier];
  id v92 = 0;
  id v60 = v10;
  id v12 = [v10 appExtensionBundlesWithError:&v92];
  id v13 = v92;
  if (!v12)
  {
    v52 = 0;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    BOOL IsMalformedBundleError = _IsMalformedBundleError(v13);
    v53 = a8;
    v51 = v60;
    if (a8) {
      goto LABEL_64;
    }
    goto LABEL_66;
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v58 = v12;
  obuint64_t j = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v88 objects:v95 count:16];
  if (!v14)
  {
LABEL_57:

    BOOL IsMalformedBundleError = 1;
    v51 = v60;
    v52 = v58;
    goto LABEL_66;
  }
  uint64_t v15 = v14;
  uint64_t v73 = *(void *)v89;
  v68 = v11;
LABEL_4:
  uint64_t v16 = 0;
  uint64_t v66 = v15;
  while (1)
  {
    if (*(void *)v89 != v73) {
      objc_enumerationMutation(obj);
    }
    v17 = *(void **)(*((void *)&v88 + 1) + 8 * v16);
    id v87 = v13;
    char v18 = objc_msgSend(v17, "validateBundleMetadataWithError:", &v87, v55, v56, v57);
    id v19 = v87;

    if (v18) {
      break;
    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_55;
    }
    uint64_t v20 = [v17 bundleURL];
    id v21 = [v20 path];
    v55 = v21;
    MOLogWrite();
LABEL_54:

LABEL_55:
    id v13 = v19;
    if (++v16 == v15)
    {
      uint64_t v15 = [obj countByEnumeratingWithState:&v88 objects:v95 count:16];
      if (v15) {
        goto LABEL_4;
      }
      goto LABEL_57;
    }
  }
  uint64_t v20 = objc_opt_new();
  if (v65) {
    id v21 = v11;
  }
  else {
    id v21 = 0;
  }
  uint64_t v22 = +[MIDaemonConfiguration sharedInstance];
  int v23 = [v22 deviceHasPersonas];

  if (!v23)
  {
    id v26 = [(id)objc_opt_class() _createPluginDataContainerForAppexBundle:v17 forPersona:0 setParent:v21];
    if (v26) {
      [v20 addObject:v26];
    }
LABEL_31:

    if (v63)
    {
      id v81 = v19;
      char v33 = [v17 makeExecutableWithError:&v81];
      id v34 = v81;
      v35 = v19;
      id v19 = v34;

      if ((v33 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        v55 = [v17 identifier];
        id v56 = v19;
        MOLogWrite();
      }
    }
    if (v64) {
      [v17 installEmbeddedProvisioningProfileWithProgress:0];
    }
    v36 = [MIInstalledInfoGatherer alloc];
    v37 = (void *)[v20 copy];
    v38 = [(MIInstalledInfoGatherer *)v36 initWithAppExtensionBundle:v17 inBundleIdentifier:v11 dataContainers:v37];

    id v80 = v19;
    v39 = [(MIInstalledInfoGatherer *)v38 bundleRecordWithError:&v80];
    id v75 = v80;

    if (v39)
    {
      v69 = v39;
      v70 = v38;
      v71 = v20;
      uint64_t v72 = v16;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v40 = v20;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v76 objects:v93 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v77;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v77 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            v46 = objc_msgSend(v45, "rawContainer", v55);
            int v47 = [v46 isNew];

            if (v47)
            {
              v48 = +[MIContainerProtectionManager defaultManager];
              [v48 setDataProtectionOnDataContainer:v45 forNewBundle:v17 retryIfLocked:0];
            }
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v76 objects:v93 count:16];
        }
        while (v42);
      }

      v49 = [v17 identifier];
      v39 = v69;
      ((void (**)(id, void *, void *))v62)[2](v62, v49, v69);
      id v11 = v68;
      uint64_t v20 = v71;
      uint64_t v16 = v72;
      v38 = v70;
    }
    else
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_53;
      }
      v49 = objc_msgSend(v17, "identifier", v55);
      id v56 = v11;
      id v57 = v75;
      v55 = v49;
      MOLogWrite();
    }

LABEL_53:
    uint64_t v15 = v66;
    id v19 = v75;
    goto LABEL_54;
  }
  if (v61)
  {
    id v74 = v19;
    uint64_t v24 = v16;
    v25 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
LABEL_21:
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v26 = v25;
    uint64_t v28 = [v26 countByEnumeratingWithState:&v82 objects:v94 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v83;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v83 != v30) {
            objc_enumerationMutation(v26);
          }
          v32 = [(id)objc_opt_class() _createPluginDataContainerForAppexBundle:v17 forPersona:*(void *)(*((void *)&v82 + 1) + 8 * j) setParent:v21];
          if (v32) {
            [v20 addObject:v32];
          }
        }
        uint64_t v29 = [v26 countByEnumeratingWithState:&v82 objects:v94 count:16];
      }
      while (v29);
    }

    uint64_t v16 = v24;
    id v11 = v68;
    id v19 = v74;
    goto LABEL_31;
  }
  uint64_t v27 = v20;
  id v86 = v19;
  v25 = _AllPersonasAssociatedWithIdentifier(v11, &v86);
  id v13 = v86;

  if (v25)
  {
    uint64_t v24 = v16;
    id v74 = v13;
    uint64_t v20 = v27;
    goto LABEL_21;
  }

  BOOL IsMalformedBundleError = 0;
  v53 = a8;
  v51 = v60;
  v52 = v58;
  if (!a8) {
    goto LABEL_66;
  }
LABEL_64:
  if (!IsMalformedBundleError)
  {
    id v13 = v13;
    BOOL IsMalformedBundleError = 0;
    id *v53 = v13;
  }
LABEL_66:

  return IsMalformedBundleError;
}

+ (id)_createDataContainerAndSetDataProtectionForBundle:(id)a3 forPersona:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  char v16 = 0;
  id v15 = 0;
  id v9 = [v7 dataContainerCreatingIfNeeded:1 forPersona:v8 makeLive:1 created:&v16 error:&v15];
  id v10 = v15;
  if (v9)
  {
    if (v16)
    {
      id v11 = +[MIContainerProtectionManager defaultManager];
      [v11 setDataProtectionOnDataContainer:v9 forNewBundle:v7 retryIfLocked:0];
    }
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v12 = [v7 bundleURL];
      uint64_t v14 = [v12 path];
      MOLogWrite();
    }
    if (a5) {
      *a5 = v10;
    }
  }

  return v9;
}

+ (id)entryForBundle:(id)a3 inContainer:(id)a4 forPersona:(id)a5 withError:(id *)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_opt_new();
  if (![v9 needsDataContainer])
  {
    id v21 = a6;
    uint64_t v22 = 0;
LABEL_31:
    v37 = [MIInstalledInfoGatherer alloc];
    v38 = (void *)[v12 copy];
    if (v10) {
      uint64_t v39 = [(MIInstalledInfoGatherer *)v37 initWithBundleContainer:v10 dataContainers:v38];
    }
    else {
      uint64_t v39 = [(MIInstalledInfoGatherer *)v37 initWithBundle:v9 dataContainers:v38];
    }
    id v23 = (id)v39;

    id v49 = v22;
    id v40 = [v23 bundleRecordWithError:&v49];
    id v24 = v49;

    if (v40) {
      goto LABEL_43;
    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    {
      a6 = v21;
      if (v21) {
        goto LABEL_40;
      }
      goto LABEL_42;
    }
    id v15 = [v9 identifier];
    MOLogWrite();
    a6 = v21;
    goto LABEL_38;
  }
  id v13 = +[MIDaemonConfiguration sharedInstance];
  int v14 = [v13 deviceHasPersonas];

  if (!v14)
  {
    id v50 = 0;
    id v23 = [(id)objc_opt_class() _createDataContainerAndSetDataProtectionForBundle:v9 forPersona:0 error:&v50];
    id v24 = v50;
    if (!v23) {
      goto LABEL_39;
    }
    id v21 = a6;
    [v12 addObject:v23];
    goto LABEL_30;
  }
  id v48 = v11;
  id v15 = +[MIUserManagement sharedInstance];
  char v16 = [v15 enterprisePersonaUniqueString];
  id v57 = 0;
  uint64_t v17 = [v15 multiPersonaSADAppBundleIDsWithError:&v57];
  id v19 = v57;
  int v47 = (void *)v17;
  if (v17)
  {
    v46 = v16;
    if (v48)
    {
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
LABEL_11:
      v44 = v15;
      id v45 = v10;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v23 = v20;
      uint64_t v26 = [v23 countByEnumeratingWithState:&v52 objects:v58 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v53;
        id v24 = v19;
        uint64_t v43 = a6;
        while (2)
        {
          uint64_t v29 = 0;
          uint64_t v30 = v24;
          do
          {
            if (*(void *)v53 != v28) {
              objc_enumerationMutation(v23);
            }
            uint64_t v31 = *(void *)(*((void *)&v52 + 1) + 8 * v29);
            v32 = objc_opt_class();
            id v51 = v30;
            char v33 = [v32 _createDataContainerAndSetDataProtectionForBundle:v9 forPersona:v31 error:&v51];
            id v24 = v51;

            if (!v33)
            {

              id v19 = v23;
              id v15 = v44;
              id v10 = v45;
              a6 = v43;
              char v16 = v46;
              goto LABEL_21;
            }
            [v12 addObject:v33];

            ++v29;
            uint64_t v30 = v24;
          }
          while (v27 != v29);
          uint64_t v27 = [v23 countByEnumeratingWithState:&v52 objects:v58 count:16];
          a6 = v43;
          if (v27) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v24 = v19;
      }

      id v10 = v45;
      if (v46)
      {
        id v34 = [v9 identifier];
        int v35 = [v47 containsObject:v34];

        if (v35)
        {
          v36 = [v9 dataContainerCreatingIfNeeded:0 forPersona:v46 makeLive:1 created:0 error:0];
          if (v36) {
            [v12 addObject:v36];
          }
        }
      }
      id v21 = a6;

      id v11 = v48;
LABEL_30:

      uint64_t v22 = v24;
      goto LABEL_31;
    }
    v25 = [v9 identifier];
    id v56 = v19;
    uint64_t v20 = _AllPersonasAssociatedWithIdentifier(v25, &v56);
    id v24 = v56;

    char v16 = v46;
    id v19 = v24;
    if (v20) {
      goto LABEL_11;
    }
  }
  else
  {
    _CreateAndLogError((uint64_t)"+[MILaunchServicesDatabaseGatherer entryForBundle:inContainer:forPersona:withError:]", 299, @"MIInstallerErrorDomain", 4, v19, 0, @"Failed to query multi persona SAD apps from UserManagement", v18, v42);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
  }
  id v23 = 0;
  id v11 = v48;
LABEL_38:

LABEL_39:
  if (a6)
  {
LABEL_40:
    id v24 = v24;
    id v40 = 0;
    *a6 = v24;
    goto LABEL_43;
  }
LABEL_42:
  id v40 = 0;
LABEL_43:

  return v40;
}

+ (id)fetchInfoForBundle:(id)a3 forPersona:(id)a4 inContainer:(id)a5 withError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v29 = 0;
  id v12 = [(id)objc_opt_class() entryForBundle:v9 inContainer:v11 forPersona:v10 withError:&v29];

  id v13 = v29;
  if (!v12)
  {
    uint64_t v22 = 0;
    id v18 = 0;
    id v17 = 0;
    if (!a6) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  int v14 = objc_opt_new();
  id v15 = objc_opt_new();
  char v16 = [v9 identifier];
  [v15 setObject:v12 forKeyedSubscript:v16];

  [v14 addObject:v12];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __88__MILaunchServicesDatabaseGatherer_fetchInfoForBundle_forPersona_inContainer_withError___block_invoke;
  v26[3] = &unk_1E62E75F0;
  id v17 = v15;
  id v27 = v17;
  id v18 = v14;
  id v28 = v18;
  id v19 = (void *)MEMORY[0x1C1878AA0](v26);
  id v25 = v13;
  int v20 = [(id)objc_opt_class() enumerateAppExtensionsInBundle:v9 forPersona:v10 updatingAppExtensionParentID:0 ensureAppExtensionsAreExecutable:0 installProfiles:0 error:&v25 enumerator:v19];
  id v21 = v25;

  if (v20) {
    uint64_t v22 = (void *)[v18 copy];
  }
  else {
    uint64_t v22 = 0;
  }
  id v13 = v21;
  if (a6)
  {
LABEL_8:
    if (v13) {
      *a6 = v13;
    }
  }
LABEL_10:
  id v23 = v22;

  return v23;
}

void __88__MILaunchServicesDatabaseGatherer_fetchInfoForBundle_forPersona_inContainer_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];

  if (v6)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12, v12);
      id v8 = [v7 bundleURL];
      id v9 = [v8 path];
      id v10 = [v5 bundleURL];
      id v11 = [v10 path];
      MOLogWrite();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v12];
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (BOOL)_scanAppExtensionsInBundle:(id)a3 inBundleContainer:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__MILaunchServicesDatabaseGatherer__scanAppExtensionsInBundle_inBundleContainer_withError___block_invoke;
  v18[3] = &unk_1E62E7618;
  v18[4] = self;
  id v9 = (void *)MEMORY[0x1C1878AA0](v18);
  if ([v8 bundleType] == 10)
  {
    id v10 = 0;
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v12 = objc_opt_class();
    id v13 = [(MILaunchServicesDatabaseGatherer *)self personaUniqueString];
    BOOL shouldUpdateAppExtensionDataContainersWithParentID = self->_shouldUpdateAppExtensionDataContainersWithParentID;
    BOOL v15 = a4 != 0;
    id v17 = 0;
    BOOL v11 = 1;
    LOBYTE(v12) = [(id)v12 enumerateAppExtensionsInBundle:v8 forPersona:v13 updatingAppExtensionParentID:shouldUpdateAppExtensionDataContainersWithParentID ensureAppExtensionsAreExecutable:v15 installProfiles:1 error:&v17 enumerator:v9];
    id v10 = v17;

    if ((v12 & 1) == 0)
    {
      if (a5)
      {
        id v10 = v10;
        BOOL v11 = 0;
        *a5 = v10;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
  }

  return v11;
}

void __91__MILaunchServicesDatabaseGatherer__scanAppExtensionsInBundle_inBundleContainer_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) appExtensions];
  int v7 = [v6 containsObject:v11];

  if (!v7)
  {
    id v9 = [*(id *)(a1 + 32) enumerator];
    ((void (**)(void, id, void))v9)[2](v9, v5, 0);

    id v8 = [*(id *)(a1 + 32) appExtensions];
    [v8 addObject:v11];
    goto LABEL_6;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    id v8 = [v5 bundleURL];
    id v10 = [v8 path];
    MOLogWrite();

LABEL_6:
  }
}

- (BOOL)_markDriverKitExtensionsExecutableInBundle:(id)a3 withError:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v22 = 0;
  id v5 = [a3 driverKitExtensionBundlesWithError:&v22];
  id v6 = v22;
  if (!v5)
  {
    BOOL v15 = 0;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v12 = v6;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        id v17 = v12;
        int v14 = [v13 makeExecutableWithError:&v17];
        id v6 = v17;

        if (!v14)
        {
          BOOL v15 = 0;
          goto LABEL_12;
        }
        [v13 installEmbeddedProvisioningProfileWithProgress:0];
        [v13 installMacStyleEmbeddedProvisioningProfileWithProgress:0];
        ++v11;
        uint64_t v12 = v6;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_12:

  if (a4)
  {
LABEL_15:
    if (!v15) {
      *a4 = v6;
    }
  }
LABEL_17:

  return v15;
}

- (id)_setForEntry:(id)a3
{
  id v4 = a3;
  switch([v4 applicationType])
  {
    case 1:
      uint64_t v5 = [(MILaunchServicesDatabaseGatherer *)self coreServices];
      goto LABEL_9;
    case 2:
      uint64_t v5 = [(MILaunchServicesDatabaseGatherer *)self systemApps];
      goto LABEL_9;
    case 3:
      uint64_t v5 = [(MILaunchServicesDatabaseGatherer *)self systemAppPlaceholders];
      goto LABEL_9;
    case 4:
      uint64_t v5 = [(MILaunchServicesDatabaseGatherer *)self userApps];
      goto LABEL_9;
    case 5:
      uint64_t v5 = [(MILaunchServicesDatabaseGatherer *)self internalApps];
      goto LABEL_9;
    default:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = [(MILaunchServicesDatabaseGatherer *)self appExtensions];
LABEL_9:
        id v6 = (void *)v5;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = [(MILaunchServicesDatabaseGatherer *)self frameworks];
        goto LABEL_9;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        MOLogWrite();
      }
      id v6 = 0;
LABEL_10:

      return v6;
  }
}

- (BOOL)_scanBundle:(id)a3 inContainer:(id)a4 addingToBundleSet:(id)a5 enumeratingEntry:(id)a6 withError:(id *)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  BOOL v15 = [v11 identifier];
  char v16 = [v13 containsObject:v15];

  if (v16)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      id v17 = [v11 identifier];
      long long v18 = [v11 bundleURL];
      id v51 = [v18 path];
      MOLogWrite();
    }
    id v19 = 0;
LABEL_6:
    BOOL v20 = 1;
    goto LABEL_41;
  }
  if (v14)
  {
    long long v21 = [(MILaunchServicesDatabaseGatherer *)self enumerator];
    ((void (**)(void, id, void))v21)[2](v21, v14, 0);
  }
  id v22 = [v11 identifier];
  [v13 addObject:v22];

  if (MILogHandleForSignpost_onceToken_0 != -1) {
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  }
  id v23 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    uint64_t v24 = v23;
    id v25 = [v11 bundleURL];
    uint64_t v26 = [v25 path];
    *(_DWORD *)buf = 138412290;
    id v56 = v26;
    _os_signpost_emit_with_name_impl(&dword_1BCA62000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ScanPlugins", "Scanning plugins in bundle at %@", buf, 0xCu);
  }
  id v54 = 0;
  BOOL v27 = [(MILaunchServicesDatabaseGatherer *)self _scanAppExtensionsInBundle:v11 inBundleContainer:v12 withError:&v54];
  id v19 = v54;
  if (!v27)
  {
    if (MILogHandleForSignpost_onceToken_0 != -1) {
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    }
    uint64_t v42 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      uint64_t v43 = v42;
      v44 = [v11 bundleURL];
      id v45 = [v44 path];
      *(_DWORD *)buf = 138412290;
      id v56 = v45;
      _os_signpost_emit_with_name_impl(&dword_1BCA62000, v43, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScanPlugins", "[FAIL] Done scanning plugins in bundle at %@", buf, 0xCu);
    }
    goto LABEL_38;
  }
  if (MILogHandleForSignpost_onceToken_0 != -1) {
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  }
  id v28 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    id v29 = v28;
    uint64_t v30 = [v11 bundleURL];
    uint64_t v31 = [v30 path];
    *(_DWORD *)buf = 138412290;
    id v56 = v31;
    _os_signpost_emit_with_name_impl(&dword_1BCA62000, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScanPlugins", "Done scanning plugins in bundle at %@", buf, 0xCu);
  }
  if (!v12) {
    goto LABEL_6;
  }
  if (MILogHandleForSignpost_onceToken_0 != -1) {
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  }
  v32 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    char v33 = v32;
    id v34 = [v11 bundleURL];
    int v35 = [v34 path];
    *(_DWORD *)buf = 138412290;
    id v56 = v35;
    _os_signpost_emit_with_name_impl(&dword_1BCA62000, v33, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MarkDriverKitExtensionsExecutable", "Mark DriverKit extensions in bundle as executable at %@", buf, 0xCu);
  }
  id v53 = v19;
  BOOL v36 = [(MILaunchServicesDatabaseGatherer *)self _markDriverKitExtensionsExecutableInBundle:v11 withError:&v53];
  id v37 = v53;

  if (!v36)
  {
    if (MILogHandleForSignpost_onceToken_0 != -1) {
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    }
    v46 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      int v47 = v46;
      id v48 = [v11 bundleURL];
      id v49 = [v48 path];
      *(_DWORD *)buf = 138412290;
      id v56 = v49;
      _os_signpost_emit_with_name_impl(&dword_1BCA62000, v47, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MarkDriverKitExtensionsExecutable", "[FAIL] Done marking DriverKit extensions in bundle as executable at %@", buf, 0xCu);
    }
    id v19 = v37;
LABEL_38:
    if (a7)
    {
      id v19 = v19;
      BOOL v20 = 0;
      *a7 = v19;
    }
    else
    {
      BOOL v20 = 0;
    }
    goto LABEL_41;
  }
  if (MILogHandleForSignpost_onceToken_0 != -1) {
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  }
  v38 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    uint64_t v39 = v38;
    id v40 = [v11 bundleURL];
    uint64_t v41 = [v40 path];
    *(_DWORD *)buf = 138412290;
    id v56 = v41;
    _os_signpost_emit_with_name_impl(&dword_1BCA62000, v39, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MarkDriverKitExtensionsExecutable", "Done marking DriverKit extensions in bundle as executable at %@", buf, 0xCu);
  }
  BOOL v20 = 1;
  id v19 = v37;
LABEL_41:

  return v20;
}

- (BOOL)scanExecutableBundle:(id)a3 inContainer:(id)a4 forPersona:(id)a5 withError:(id *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (MILogHandleForSignpost_onceToken_0 != -1) {
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  }
  id v13 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    id v14 = v13;
    BOOL v15 = [v10 bundleURL];
    char v16 = [v15 path];
    *(_DWORD *)buf = 138412290;
    id v37 = v16;
    _os_signpost_emit_with_name_impl(&dword_1BCA62000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ScanBundle", "Scanning bundle at %@", buf, 0xCu);
  }
  id v35 = 0;
  id v17 = [(id)objc_opt_class() entryForBundle:v10 inContainer:v11 forPersona:v12 withError:&v35];
  id v18 = v35;
  if (v17)
  {
    uint64_t v19 = [(MILaunchServicesDatabaseGatherer *)self _setForEntry:v17];
    if (v19)
    {
      long long v21 = (void *)v19;
      id v34 = v18;
      BOOL v22 = [(MILaunchServicesDatabaseGatherer *)self _scanBundle:v10 inContainer:v11 addingToBundleSet:v19 enumeratingEntry:v17 withError:&v34];
      id v23 = v34;

      id v18 = v21;
    }
    else
    {
      _CreateAndLogError((uint64_t)"-[MILaunchServicesDatabaseGatherer scanExecutableBundle:inContainer:forPersona:withError:]", 568, @"MIInstallerErrorDomain", 4, 0, 0, @"Could not find appropriate set for app %@", v20, (uint64_t)v17);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v22 = 0;
    }

    id v18 = v23;
    if (!a6) {
      goto LABEL_14;
    }
  }
  else
  {
    BOOL v22 = 0;
    if (!a6) {
      goto LABEL_14;
    }
  }
  if (!v22) {
    *a6 = v18;
  }
LABEL_14:
  if (v18) {
    char v24 = v22;
  }
  else {
    char v24 = 1;
  }
  if ((v24 & 1) == 0)
  {
    id v25 = [(MILaunchServicesDatabaseGatherer *)self enumerator];

    if (v25)
    {
      uint64_t v26 = [(MILaunchServicesDatabaseGatherer *)self enumerator];
      ((void (**)(void, void, id))v26)[2](v26, 0, v18);
    }
  }
  if (v22)
  {
    if (MILogHandleForSignpost_onceToken_0 != -1) {
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    }
    BOOL v27 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      id v28 = v27;
      id v29 = [v10 bundleURL];
      uint64_t v30 = [v29 path];
      *(_DWORD *)buf = 138412290;
      id v37 = v30;
      uint64_t v31 = "Done scanning bundle at %@";
LABEL_29:
      _os_signpost_emit_with_name_impl(&dword_1BCA62000, v28, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScanBundle", v31, buf, 0xCu);
    }
  }
  else
  {
    if (MILogHandleForSignpost_onceToken_0 != -1) {
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    }
    v32 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      id v28 = v32;
      id v29 = [v10 bundleURL];
      uint64_t v30 = [v29 path];
      *(_DWORD *)buf = 138412290;
      id v37 = v30;
      uint64_t v31 = "[FAIL] Done scanning bundle at %@";
      goto LABEL_29;
    }
  }

  return v22;
}

- (BOOL)scanAppExtensionsInFrameworkBundle:(id)a3 withError:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (MILogHandleForSignpost_onceToken_0 != -1) {
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  }
  id v7 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    uint64_t v8 = v7;
    uint64_t v9 = [v6 bundleURL];
    id v10 = [v9 path];
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v10;
    _os_signpost_emit_with_name_impl(&dword_1BCA62000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ScanBundle", "Scanning framework at %@", buf, 0xCu);
  }
  id v11 = [(MILaunchServicesDatabaseGatherer *)self frameworks];
  id v24 = 0;
  BOOL v12 = [(MILaunchServicesDatabaseGatherer *)self _scanBundle:v6 inContainer:0 addingToBundleSet:v11 enumeratingEntry:0 withError:&v24];
  id v13 = v24;

  if (a4 && !v12) {
    *a4 = v13;
  }
  if (v13) {
    char v14 = v12;
  }
  else {
    char v14 = 1;
  }
  if ((v14 & 1) == 0)
  {
    BOOL v15 = [(MILaunchServicesDatabaseGatherer *)self enumerator];

    if (v15)
    {
      char v16 = [(MILaunchServicesDatabaseGatherer *)self enumerator];
      ((void (**)(void, void, id))v16)[2](v16, 0, v13);
    }
  }
  if (v12)
  {
    if (MILogHandleForSignpost_onceToken_0 != -1) {
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    }
    id v17 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      id v18 = v17;
      uint64_t v19 = [v6 bundleURL];
      uint64_t v20 = [v19 path];
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v20;
      long long v21 = "Done scanning framework at %@";
LABEL_23:
      _os_signpost_emit_with_name_impl(&dword_1BCA62000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScanBundle", v21, buf, 0xCu);
    }
  }
  else
  {
    if (MILogHandleForSignpost_onceToken_0 != -1) {
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    }
    BOOL v22 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      id v18 = v22;
      uint64_t v19 = [v6 bundleURL];
      uint64_t v20 = [v19 path];
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v20;
      long long v21 = "[FAIL] Done scanning framework at %@";
      goto LABEL_23;
    }
  }

  return v12;
}

- (void)errorOccurred:(id)a3
{
  id v6 = a3;
  id v4 = [(MILaunchServicesDatabaseGatherer *)self enumerator];

  if (v4)
  {
    uint64_t v5 = [(MILaunchServicesDatabaseGatherer *)self enumerator];
    ((void (**)(void, void, id))v5)[2](v5, 0, v6);
  }
}

- (BOOL)performGatherWithError:(id *)a3
{
  if (([(MILaunchServicesDatabaseGatherer *)self gatherOptions] & 2) != 0)
  {
    uint64_t v5 = 2298;
  }
  else if (([(MILaunchServicesDatabaseGatherer *)self gatherOptions] & 4) != 0)
  {
    uint64_t v5 = 1029;
  }
  else if (([(MILaunchServicesDatabaseGatherer *)self gatherOptions] & 8) != 0)
  {
    uint64_t v5 = 768;
  }
  else if (([(MILaunchServicesDatabaseGatherer *)self gatherOptions] & 0x10) != 0)
  {
    uint64_t v5 = 4;
  }
  else
  {
    uint64_t v5 = 3967;
  }
  unint64_t v6 = (([(MILaunchServicesDatabaseGatherer *)self gatherOptions] & 1) << 7) | v5;
  id v7 = [MIFilesystemScanner alloc];
  uint64_t v8 = [(MILaunchServicesDatabaseGatherer *)self personaUniqueString];
  uint64_t v9 = [(MIFilesystemScanner *)v7 initWithScanOptions:v6 personaUniqueString:v8];

  [(MIFilesystemScanner *)v9 setDelegate:self];
  id v10 = +[MIDaemonConfiguration sharedInstance];
  [v10 reScanSystemApps];

  id v11 = +[MIDaemonConfiguration sharedInstance];
  [v11 reScanInternalApps];

  BOOL v12 = +[MIDaemonConfiguration sharedInstance];
  [v12 reScanCoreServicesApps];

  id v13 = +[MIKeychainAccessGroupTracker sharedTracker];
  [v13 invalidateCache];

  BOOL v14 = [(MIFilesystemScanner *)v9 performScanWithError:a3];
  if (v14 && self->_shouldUpdateAppExtensionDataContainersWithParentID)
  {
    BOOL v15 = +[MIDaemonConfiguration sharedInstance];
    [v15 setHaveUpdatedAppExtensionDataContainersWithParentID:1];

    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      MOLogWrite();
    }
  }

  return v14;
}

- (NSMutableSet)coreServices
{
  return self->_coreServices;
}

- (NSMutableSet)systemApps
{
  return self->_systemApps;
}

- (NSMutableSet)userApps
{
  return self->_userApps;
}

- (NSMutableSet)internalApps
{
  return self->_internalApps;
}

- (NSMutableSet)appExtensions
{
  return self->_appExtensions;
}

- (NSMutableSet)frameworks
{
  return self->_frameworks;
}

- (NSMutableSet)systemAppPlaceholders
{
  return self->_systemAppPlaceholders;
}

- (id)enumerator
{
  return self->_enumerator;
}

- (unint64_t)gatherOptions
{
  return self->_gatherOptions;
}

- (BOOL)shouldUpdateAppExtensionDataContainersWithParentID
{
  return self->_shouldUpdateAppExtensionDataContainersWithParentID;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong(&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_systemAppPlaceholders, 0);
  objc_storeStrong((id *)&self->_frameworks, 0);
  objc_storeStrong((id *)&self->_appExtensions, 0);
  objc_storeStrong((id *)&self->_internalApps, 0);
  objc_storeStrong((id *)&self->_userApps, 0);
  objc_storeStrong((id *)&self->_systemApps, 0);
  objc_storeStrong((id *)&self->_coreServices, 0);
}

@end