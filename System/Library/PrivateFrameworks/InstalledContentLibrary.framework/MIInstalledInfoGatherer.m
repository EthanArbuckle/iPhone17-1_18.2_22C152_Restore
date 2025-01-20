@interface MIInstalledInfoGatherer
- (BOOL)_populateBundleRecord:(id)a3 error:(id *)a4;
- (BOOL)_populateBundleRecordValues:(id)a3 signingInfo:(id)a4 error:(id *)a5;
- (MIBundleContainer)bundleContainer;
- (MIExecutableBundle)builtInAppParallelPlaceholderBundle;
- (MIExecutableBundle)bundle;
- (MIInstalledInfoGatherer)initWithAppExtensionBundle:(id)a3 inBundleIdentifier:(id)a4 dataContainer:(id)a5;
- (MIInstalledInfoGatherer)initWithAppExtensionBundle:(id)a3 inBundleIdentifier:(id)a4 dataContainers:(id)a5;
- (MIInstalledInfoGatherer)initWithBundle:(id)a3 dataContainer:(id)a4;
- (MIInstalledInfoGatherer)initWithBundle:(id)a3 dataContainers:(id)a4;
- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 dataContainer:(id)a4;
- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 dataContainers:(id)a4;
- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 forPersona:(id)a4;
- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 forPersonas:(id)a4;
- (NSArray)dataContainers;
- (NSArray)personaUniqueStrings;
- (NSString)owningBundleIdentifier;
- (NSURL)parentBundleURL;
- (id)_buildBundlePersonaRecordWithDataContainer:(id)a3;
- (id)_groupContainersDictionaryForPersona:(id)a3;
- (id)_sandboxEnvironmentForDataContainer:(id)a3;
- (id)_stashedAppRecordForStashedContainer:(id)a3;
- (id)_staticDiskUsage;
- (id)bundleRecordWithError:(id *)a3;
- (void)_fixUpForBuiltInAppParallelPlaceholder;
- (void)_initWithAppExtensionBundle:(id)a3 inBundleIdentifier:(id)a4 dataContainers:(id)a5;
- (void)_initWithBundle:(id)a3 dataContainers:(id)a4;
- (void)_initWithBundleContainer:(id)a3 dataContainers:(id)a4;
- (void)_initWithBundleContainer:(id)a3 forPersonas:(id)a4;
- (void)_populateAppExtensionRecordValues:(id)a3;
- (void)_populateAppRecordValues:(id)a3;
- (void)_populatePlaceholderRecordValues:(id)a3 signingInfo:(id)a4;
@end

@implementation MIInstalledInfoGatherer

- (void)_fixUpForBuiltInAppParallelPlaceholder
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v3 = [(MIInstalledInfoGatherer *)self bundle];
  char v4 = [v3 isRemovableSystemApp];

  if ((v4 & 1) == 0)
  {
    v5 = [(MIInstalledInfoGatherer *)self bundle];
    unsigned int v6 = [v5 bundleType];

    if (v6 <= 5 && ((1 << v6) & 0x26) != 0)
    {
      v7 = [(MIInstalledInfoGatherer *)self bundle];
      int v8 = [v7 isPlaceholder];

      if (!v8)
      {
        id v14 = [(MIInstalledInfoGatherer *)self bundle];
        if (!v14)
        {
LABEL_62:

          return;
        }
        v15 = [(MIInstalledInfoGatherer *)self bundleContainer];

        if (!v15)
        {
          v16 = [(MIInstalledInfoGatherer *)self bundle];
          v17 = [v16 identifier];
          id v60 = 0;
          v18 = +[MIBundleContainer appBundleContainerWithIdentifier:v17 createIfNeeded:0 created:0 error:&v60];
          id v14 = v60;

          if (v18)
          {
            v19 = [v18 bundle];
            int v20 = [v19 isPlaceholder];

            if (v20)
            {
              v21 = [v18 bundle];
              builtInAppParallelPlaceholderBundle = self->_builtInAppParallelPlaceholderBundle;
              self->_builtInAppParallelPlaceholderBundle = v21;
            }
            goto LABEL_62;
          }
          v52 = [v14 domain];
          if ([v52 isEqualToString:@"MIContainerManagerErrorDomain"])
          {
            uint64_t v53 = [v14 code];

            if (v53 == 21) {
              goto LABEL_62;
            }
          }
          else
          {
          }
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            v54 = [(MIInstalledInfoGatherer *)self bundle];
            v56 = [v54 identifier];
            MOLogWrite();
          }
          goto LABEL_62;
        }
LABEL_51:
        id v14 = 0;
        goto LABEL_62;
      }
      switch(v6)
      {
        case 5u:
          v23 = +[MIDaemonConfiguration sharedInstance];
          v24 = [v23 coreServicesAppBundleIDToInfoMap];
          v25 = [(MIInstalledInfoGatherer *)self bundle];
          v26 = [v25 identifier];
          v13 = [v24 objectForKeyedSubscript:v26];

          if (v13) {
            goto LABEL_23;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
            goto LABEL_51;
          }
          break;
        case 2u:
          v27 = +[MIDaemonConfiguration sharedInstance];
          v28 = [v27 internalAppBundleIDToInfoMap];
          v29 = [(MIInstalledInfoGatherer *)self bundle];
          v30 = [v29 identifier];
          v13 = [v28 objectForKeyedSubscript:v30];

          if (v13) {
            goto LABEL_23;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
            goto LABEL_51;
          }
          break;
        case 1u:
          v9 = +[MIDaemonConfiguration sharedInstance];
          v10 = [v9 systemAppBundleIDToInfoMap];
          v11 = [(MIInstalledInfoGatherer *)self bundle];
          v12 = [v11 identifier];
          v13 = [v10 objectForKeyedSubscript:v12];

          if (!v13)
          {
            if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
              goto LABEL_51;
            }
            break;
          }
LABEL_23:
          v31 = [v13 objectForKeyedSubscript:@"com.apple.MobileInstallation.bundleURL"];

          if (v31)
          {
            id v66 = 0;
            v32 = +[MIBundle bundleForURL:v31 error:&v66];
            id v14 = v66;
            if (v32)
            {
              v33 = objc_opt_new();
              long long v62 = 0u;
              long long v63 = 0u;
              long long v64 = 0u;
              long long v65 = 0u;
              v34 = [(MIInstalledInfoGatherer *)self personaUniqueStrings];
              uint64_t v35 = [(MIBundleContainer *)v34 countByEnumeratingWithState:&v62 objects:v67 count:16];
              if (v35)
              {
                uint64_t v36 = v35;
                v59 = v33;
                v57 = v31;
                v37 = 0;
                uint64_t v38 = *(void *)v63;
                obj = v34;
                while (2)
                {
                  uint64_t v39 = 0;
                  v40 = v37;
                  v41 = v14;
                  do
                  {
                    if (*(void *)v63 != v38) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v42 = *(void *)(*((void *)&v62 + 1) + 8 * v39);
                    id v61 = v41;
                    v37 = [v32 dataContainerForPersona:v42 error:&v61];
                    id v14 = v61;

                    if (v37)
                    {
                      [v59 addObject:v37];
                    }
                    else
                    {
                      v43 = [v14 domain];
                      if (![v43 isEqualToString:@"MIContainerManagerErrorDomain"])
                      {

LABEL_56:
                        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
                          MOLogWrite();
                        }
                        v31 = v57;
                        bundleContainer = obj;
                        v33 = v59;
                        goto LABEL_60;
                      }
                      uint64_t v44 = [v14 code];

                      if (v44 != 21) {
                        goto LABEL_56;
                      }
                    }
                    ++v39;
                    v40 = v37;
                    v41 = v14;
                  }
                  while (v36 != v39);
                  v34 = obj;
                  uint64_t v36 = [(MIBundleContainer *)obj countByEnumeratingWithState:&v62 objects:v67 count:16];
                  if (v36) {
                    continue;
                  }
                  break;
                }

                v31 = v57;
                v33 = v59;
              }

              v45 = (NSArray *)[v33 copy];
              dataContainers = self->_dataContainers;
              self->_dataContainers = v45;

              v47 = [(MIInstalledInfoGatherer *)self bundle];
              v48 = self->_builtInAppParallelPlaceholderBundle;
              self->_builtInAppParallelPlaceholderBundle = v47;

              objc_storeStrong((id *)&self->_bundle, v32);
              bundleContainer = self->_bundleContainer;
              self->_bundleContainer = 0;
LABEL_60:
            }
            else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              v55 = [v31 path];
              MOLogWrite();
            }
            goto LABEL_62;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
            goto LABEL_51;
          }
LABEL_43:
          v50 = [(MIInstalledInfoGatherer *)self bundle];
          MOLogWrite();
LABEL_50:

          goto LABEL_51;
        default:
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
            goto LABEL_51;
          }
          goto LABEL_43;
      }
      v50 = [(MIInstalledInfoGatherer *)self bundle];
      v51 = [v50 identifier];
      MOLogWrite();

      goto LABEL_50;
    }
  }
}

- (void)_initWithBundle:(id)a3 dataContainers:(id)a4
{
  objc_storeStrong((id *)&self->_bundle, a3);
  id v7 = a3;
  id v8 = a4;
  v9 = (NSArray *)[v8 copy];

  dataContainers = self->_dataContainers;
  self->_dataContainers = v9;

  [(MIInstalledInfoGatherer *)self _fixUpForBuiltInAppParallelPlaceholder];
}

- (MIInstalledInfoGatherer)initWithBundle:(id)a3 dataContainers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIInstalledInfoGatherer;
  id v8 = [(MIInstalledInfoGatherer *)&v11 init];
  v9 = v8;
  if (v8) {
    [(MIInstalledInfoGatherer *)v8 _initWithBundle:v6 dataContainers:v7];
  }

  return v9;
}

- (MIInstalledInfoGatherer)initWithBundle:(id)a3 dataContainer:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIInstalledInfoGatherer;
  id v8 = [(MIInstalledInfoGatherer *)&v11 init];
  if (v8)
  {
    if (v7)
    {
      v12[0] = v7;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    }
    else
    {
      v9 = 0;
    }
    [(MIInstalledInfoGatherer *)v8 _initWithBundle:v6 dataContainers:v9];
  }
  return v8;
}

- (void)_initWithBundleContainer:(id)a3 forPersonas:(id)a4
{
  id v6 = (MIBundleContainer *)a3;
  id v7 = a4;
  id v8 = [(MIBundleContainer *)v6 bundle];
  bundle = self->_bundle;
  self->_bundle = v8;

  bundleContainer = self->_bundleContainer;
  self->_bundleContainer = v6;
  objc_super v11 = v6;

  v12 = (NSArray *)[v7 copy];
  personaUniqueStrings = self->_personaUniqueStrings;
  self->_personaUniqueStrings = v12;

  [(MIInstalledInfoGatherer *)self _fixUpForBuiltInAppParallelPlaceholder];
}

- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 forPersonas:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIInstalledInfoGatherer;
  id v8 = [(MIInstalledInfoGatherer *)&v11 init];
  v9 = v8;
  if (v8) {
    [(MIInstalledInfoGatherer *)v8 _initWithBundleContainer:v6 forPersonas:v7];
  }

  return v9;
}

- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 forPersona:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIInstalledInfoGatherer;
  id v8 = [(MIInstalledInfoGatherer *)&v11 init];
  if (v8)
  {
    if (v7)
    {
      v12[0] = v7;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    }
    else
    {
      v9 = 0;
    }
    [(MIInstalledInfoGatherer *)v8 _initWithBundleContainer:v6 forPersonas:v9];
  }
  return v8;
}

- (void)_initWithBundleContainer:(id)a3 dataContainers:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = objc_opt_new();
  v10 = [v7 bundle];
  bundle = self->_bundle;
  self->_bundle = v10;

  objc_storeStrong((id *)&self->_bundleContainer, a3);
  v12 = (NSArray *)[v8 copy];
  dataContainers = self->_dataContainers;
  self->_dataContainers = v12;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        int v20 = objc_msgSend(v19, "personaUniqueString", (void)v24);

        if (v20)
        {
          v21 = [v19 personaUniqueString];
          [v9 addObject:v21];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

  v22 = (NSArray *)[v9 copy];
  personaUniqueStrings = self->_personaUniqueStrings;
  self->_personaUniqueStrings = v22;

  [(MIInstalledInfoGatherer *)self _fixUpForBuiltInAppParallelPlaceholder];
}

- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 dataContainer:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIInstalledInfoGatherer;
  id v8 = [(MIInstalledInfoGatherer *)&v11 init];
  if (v8)
  {
    if (v7)
    {
      v12[0] = v7;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    }
    else
    {
      v9 = 0;
    }
    [(MIInstalledInfoGatherer *)v8 _initWithBundleContainer:v6 dataContainers:v9];
  }
  return v8;
}

- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 dataContainers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIInstalledInfoGatherer;
  id v8 = [(MIInstalledInfoGatherer *)&v11 init];
  v9 = v8;
  if (v8) {
    [(MIInstalledInfoGatherer *)v8 _initWithBundleContainer:v6 dataContainers:v7];
  }

  return v9;
}

- (void)_initWithAppExtensionBundle:(id)a3 inBundleIdentifier:(id)a4 dataContainers:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_opt_new();
  objc_storeStrong((id *)&self->_bundle, a3);
  v13 = (NSArray *)[v11 copy];
  dataContainers = self->_dataContainers;
  self->_dataContainers = v13;

  objc_storeStrong((id *)&self->_owningBundleIdentifier, a4);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        int v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "personaUniqueString", (void)v25);

        if (v21)
        {
          v22 = [v20 personaUniqueString];
          [v12 addObject:v22];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v17);
  }

  v23 = (NSArray *)[v12 copy];
  personaUniqueStrings = self->_personaUniqueStrings;
  self->_personaUniqueStrings = v23;
}

- (MIInstalledInfoGatherer)initWithAppExtensionBundle:(id)a3 inBundleIdentifier:(id)a4 dataContainers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MIInstalledInfoGatherer;
  id v11 = [(MIInstalledInfoGatherer *)&v14 init];
  v12 = v11;
  if (v11) {
    [(MIInstalledInfoGatherer *)v11 _initWithAppExtensionBundle:v8 inBundleIdentifier:v9 dataContainers:v10];
  }

  return v12;
}

- (MIInstalledInfoGatherer)initWithAppExtensionBundle:(id)a3 inBundleIdentifier:(id)a4 dataContainer:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MIInstalledInfoGatherer;
  id v11 = [(MIInstalledInfoGatherer *)&v14 init];
  if (v11)
  {
    if (v10)
    {
      v15[0] = v10;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    }
    else
    {
      v12 = 0;
    }
    [(MIInstalledInfoGatherer *)v11 _initWithAppExtensionBundle:v8 inBundleIdentifier:v9 dataContainers:v12];
  }
  return v11;
}

- (id)_sandboxEnvironmentForDataContainer:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = [a3 containerURL];
    char v4 = [v3 URLByAppendingPathComponent:@"tmp" isDirectory:1];
    uint64_t v5 = [v3 path];
    id v6 = (void *)v5;
    if (v4 && v5)
    {
      v10[0] = @"HOME";
      v10[1] = @"CFFIXED_USER_HOME";
      v11[0] = v5;
      v11[1] = v5;
      v10[2] = @"TMPDIR";
      id v7 = [v4 path];
      v11[2] = v7;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
    }
    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        MOLogWrite();
      }
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)_groupContainersDictionaryForPersona:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MIInstalledInfoGatherer *)self bundle];
  id v6 = [v5 identifier];

  id v7 = [(MIInstalledInfoGatherer *)self dataContainers];

  if (v7)
  {
    id v15 = 0;
    id v8 = +[MIContainer groupContainerURLsForBundleIdentifier:v6 forPersona:v4 error:&v15];
    id v9 = v15;
    if (!v8 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      id v13 = v4;
      id v14 = v9;
      v12 = v6;
      MOLogWrite();
    }
    id v10 = objc_msgSend(v8, "copy", v12, v13, v14);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_staticDiskUsage
{
  v3 = [(MIInstalledInfoGatherer *)self bundleContainer];

  if (v3)
  {
    id v4 = NSNumber;
    uint64_t v5 = [(MIInstalledInfoGatherer *)self bundleContainer];
    id v6 = objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "diskUsage"));
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_stashedAppRecordForStashedContainer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [MIInstalledInfoGatherer alloc];
  id v7 = [(MIInstalledInfoGatherer *)self personaUniqueStrings];
  id v8 = [(MIInstalledInfoGatherer *)v6 initWithBundleContainer:v4 forPersonas:v7];

  id v18 = 0;
  LOBYTE(v6) = [(MIInstalledInfoGatherer *)v8 _populateBundleRecord:v5 error:&v18];
  id v9 = v18;
  id v10 = v9;
  if (v6)
  {
    id v17 = v9;
    id v11 = [v4 stashMetadataWithError:&v17];
    id v12 = v17;

    if (v11)
    {
      id v13 = [v11 dateStashed];
      [v5 setStashedAtTimestamp:v13];

      id v14 = [v11 dateOriginallyInstalled];
      [v5 setStashOriginalInstallTimestamp:v14];
    }
    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        MOLogWrite();
      }
      id v14 = v12;
      id v12 = 0;
    }

    id v15 = v5;
    id v10 = v12;
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    id v15 = 0;
  }

  return v15;
}

- (id)_buildBundlePersonaRecordWithDataContainer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [v4 personaUniqueString];
  id v7 = [v4 containerURL];
  [v5 setDataContainerURL:v7];

  id v8 = [(MIInstalledInfoGatherer *)self _sandboxEnvironmentForDataContainer:v4];

  [v5 setEnvironmentVariables:v8];
  id v9 = [(MIInstalledInfoGatherer *)self _groupContainersDictionaryForPersona:v6];
  [v5 setGroupContainerURLs:v9];

  return v5;
}

- (BOOL)_populateBundleRecordValues:(id)a3 signingInfo:(id)a4 error:(id *)a5
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(MIInstalledInfoGatherer *)self bundle];
  v124 = self;
  id v10 = [(MIInstalledInfoGatherer *)self bundleContainer];
  int v11 = [v9 bundleType];
  uint64_t v12 = [v9 isPlaceholder];
  [v7 setIsPlaceholder:v12];
  id v13 = [v9 identifier];
  [v7 setBundleIdentifier:v13];

  id v14 = [v9 bundleVersion];
  [v7 setBundleVersion:v14];

  id v15 = [v9 bundleShortVersion];
  [v7 setBundleShortVersion:v15];

  uint64_t v16 = [v9 bundleURL];
  [v7 setBundleURL:v16];

  unsigned int v17 = v11 - 1;
  if ((v11 - 1) > 9) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = qword_1BCB0A430[(char)v17];
  }
  [v7 setApplicationType:v18];
  v19 = [v9 counterpartIdentifiers];
  [v7 setCounterpartIdentifiers:v19];

  objc_msgSend(v7, "setCompatibilityState:", objc_msgSend(v9, "compatibilityState"));
  [v7 setIsOnMountedDiskImage:v11 == 3];
  int v20 = [v8 signatureVersion];
  if (!v20)
  {
    if (v17 < 6 || v11 == 9)
    {
      int v20 = [v9 bundleSignatureVersionWithError:0];
    }
    else
    {
      int v20 = 0;
    }
  }
  [v7 setSignatureVersion:v20];
  objc_msgSend(v7, "setIsContainerized:", objc_msgSend(v9, "needsDataContainer"));
  if (v8)
  {
    v21 = [v8 entitlements];
    [v7 setHasAppGroupContainers:MIHasAnyApplicationGroupEntitlements(v21)];

    v22 = [v8 entitlements];
    [v7 setHasSystemContainer:MIHasSystemContainerEntitlement(v22)];

    v23 = [v8 entitlements];
    [v7 setHasSystemGroupContainers:MIHasAnySystemGroupEntitlements(v23)];

    uint64_t v24 = [v9 codeSignatureVerificationState];
    if ((unint64_t)(v24 - 1) <= 1)
    {
      long long v25 = v10;
      id v134 = 0;
      char v26 = [v9 updateMCMWithCodeSigningInfoAsAdvanceCopy:0 withError:&v134];
      id v27 = v134;
      if ((v26 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        v109 = [v9 identifier];
        id v111 = v27;
        MOLogWrite();
      }
      id v10 = v25;
    }
    if ((objc_msgSend(v8, "signingInfoSource", v109, v111) & 0xFFFFFFFFFFFFFFFELL) != 2) {
      [v7 setCodeSigningInfoNotAuthoritative:1];
    }
    if (v24 == 1)
    {

      id v8 = 0;
    }
    long long v28 = [v8 entitlements];
    [v7 setEntitlements:v28];

    uint64_t v29 = [v8 signerIdentity];
    uint64_t v30 = [v8 codeSignerType];
    if ((unint64_t)(v30 - 1) >= 6) {
      uint64_t v31 = 0;
    }
    else {
      uint64_t v31 = v30;
    }
    [v7 setCodeSignerType:v31];
    uint64_t v32 = [v8 codeSignerType];
    if (v29)
    {
      uint64_t v33 = v32;
      [v7 setSignerIdentity:v29];
      if (v33 == 3)
      {
        uint64_t v34 = [v8 profileValidationType];
        if ((unint64_t)(v34 - 1) >= 4) {
          uint64_t v35 = 0;
        }
        else {
          uint64_t v35 = v34;
        }
        [v7 setProfileValidationType:v35];
      }
      uint64_t v36 = [v8 signerOrganization];
      [v7 setSignerOrganization:v36];
    }
    v37 = [v8 teamIdentifier];
    [v7 setTeamIdentifier:v37];

    uint64_t v38 = [v8 codeInfoIdentifier];
    [v7 setCodeInfoIdentifier:v38];
  }
  else
  {
    [v7 setCodeSigningInfoNotAuthoritative:1];
  }
  if ([v9 codeSignatureVerificationState] == 6)
  {
    [v7 setIsNoLongerCompatible:1];
  }
  else if ([v9 codeSignatureVerificationState] != 1)
  {
    uint64_t v39 = [v9 identifier];
    [v7 setCodeInfoIdentifier:v39];
  }
  uint64_t v40 = [(MIInstalledInfoGatherer *)v124 dataContainers];
  v41 = (void *)v40;
  if (v11 == 6 && !v40)
  {
    uint64_t v42 = [v9 bundleURL];
    _CreateAndLogError((uint64_t)"-[MIInstalledInfoGatherer _populateBundleRecordValues:signingInfo:error:]", 598, @"MIInstallerErrorDomain", 4, 0, 0, @"Discovered app extension without data containers %@", v43, (uint64_t)v42);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  int v46 = v12;
  id v47 = 0;
  v118 = v20;
  v119 = (void *)v40;
  if (v11 == 4)
  {
    v54 = @"user";
    if (!v10)
    {
LABEL_115:
      v55 = v47;
      uint64_t v42 = [v9 bundleURL];
      _CreateAndLogError((uint64_t)"-[MIInstalledInfoGatherer _populateBundleRecordValues:signingInfo:error:]", 637, @"MIInstallerErrorDomain", 4, 0, 0, @"Discovered %@ app without bundle container %@", v106, (uint64_t)v54);
      goto LABEL_116;
    }
  }
  else
  {
    if (v11 != 1) {
      goto LABEL_48;
    }
    v115 = v10;
    v48 = [v9 bundleParentDirectoryURL];
    v49 = [v48 path];
    v50 = +[MIDaemonConfiguration sharedInstance];
    v51 = [v50 systemAppsDirectory];
    v52 = [v51 path];
    char v53 = [v49 isEqualToString:v52];

    if (v53)
    {
      id v47 = 0;
      id v10 = v115;
      int v20 = v118;
      v41 = v119;
      int v11 = 1;
      goto LABEL_48;
    }
    if (v46)
    {
      id v133 = 0;
      v70 = [v9 lsInstallTypeWithError:&v133];
      id v121 = v133;
      id v10 = v115;
      int v20 = v118;
      if (v70)
      {
        if ([v70 unsignedIntegerValue] == 7)
        {
          uint64_t v71 = 3;
        }
        else if ([v70 unsignedIntegerValue] == 8)
        {
          uint64_t v71 = 4;
        }
        else
        {
          uint64_t v71 = 1;
        }
      }
      else
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v109 = v9;
          id v111 = v121;
          MOLogWrite();
        }

        id v121 = 0;
        uint64_t v71 = 1;
      }
      v78 = +[MISystemAppState sharedList];
      v105 = [v9 identifier];
      [v78 addIdentifier:v105 withState:v71];
    }
    else
    {
      v70 = +[MISystemAppState sharedList];
      v78 = [v9 identifier];
      [v70 addIdentifier:v78 withState:1];
      id v121 = 0;
      id v10 = v115;
      int v20 = v118;
    }
    v41 = v119;
    int v11 = 1;

    v54 = @"system";
    id v47 = v121;
    if (!v10) {
      goto LABEL_115;
    }
  }
  if (v41 || ![v10 shouldHaveCorrespondingDataContainer])
  {
LABEL_48:
    v120 = v47;
    v57 = [(MIInstalledInfoGatherer *)v124 owningBundleIdentifier];

    if (v57)
    {
      if (v10) {
        goto LABEL_50;
      }
      goto LABEL_76;
    }
    int v64 = v11;
    long long v65 = [v9 bundleURL];
    id v66 = [v65 URLByAppendingPathComponent:@"Settings.bundle" isDirectory:1];

    v67 = +[MIFileManager defaultManager];
    id v132 = 0;
    int v68 = [v67 itemExistsAtURL:v66 error:&v132];
    id v69 = v132;

    if (v68)
    {
      [v7 setHasSettingsBundle:1];
      int v11 = v64;
      goto LABEL_75;
    }
    v72 = [v69 domain];
    if ([v72 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v73 = [v69 code];

      BOOL v94 = v73 == 2;
      int v11 = v64;
      if (v94) {
        goto LABEL_75;
      }
    }
    else
    {

      int v11 = v64;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v109 = v66;
      id v111 = v69;
      MOLogWrite();
    }
LABEL_75:

    v41 = v119;
    if (v10)
    {
LABEL_50:
      id v131 = 0;
      v58 = objc_msgSend(v10, "bundleMetadataWithError:", &v131, v109, v111);
      id v59 = v131;
      if (!v58) {
        goto LABEL_126;
      }
      uint64_t v60 = [v58 watchKitAppExecutableHash];
      if (v60)
      {
        id v61 = (void *)v60;
        long long v62 = v9;
        id v63 = v120;
LABEL_125:

        v120 = v63;
        id v9 = v62;
        int v20 = v118;
LABEL_126:
        v107 = [(MIInstalledInfoGatherer *)v124 _staticDiskUsage];
        [v7 setStaticDiskUsage:v107];

        if (!v41)
        {
LABEL_127:
          BOOL v45 = 1;
LABEL_128:
          id v44 = v120;
          goto LABEL_129;
        }
LABEL_79:
        v117 = v9;
        v79 = objc_opt_new();
        long long v125 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        id v80 = v41;
        uint64_t v81 = [v80 countByEnumeratingWithState:&v125 objects:v135 count:16];
        if (v81)
        {
          uint64_t v82 = v81;
          v123 = v79;
          id v114 = v7;
          v116 = v10;
          id v113 = v8;
          v83 = 0;
          id v84 = 0;
          uint64_t v85 = *(void *)v126;
          do
          {
            v86 = v80;
            uint64_t v87 = 0;
            v88 = v84;
            do
            {
              if (*(void *)v126 != v85) {
                objc_enumerationMutation(v86);
              }
              v89 = *(void **)(*((void *)&v125 + 1) + 8 * v87);
              v90 = objc_msgSend(v89, "personaUniqueString", v109);
              id v84 = [(MIInstalledInfoGatherer *)v124 _buildBundlePersonaRecordWithDataContainer:v89];

              if (v90) {
                [v123 setObject:v84 forKeyedSubscript:v90];
              }
              v91 = +[MIGlobalConfiguration sharedInstance];
              v92 = [v91 primaryPersonaString];
              int v93 = [v90 isEqualToString:v92];

              if (v90) {
                BOOL v94 = v93 == 0;
              }
              else {
                BOOL v94 = 0;
              }
              if (!v94)
              {
                id v95 = v84;

                v83 = v95;
              }

              ++v87;
              v88 = v84;
            }
            while (v82 != v87);
            id v80 = v86;
            uint64_t v82 = [v86 countByEnumeratingWithState:&v125 objects:v135 count:16];
          }
          while (v82);

          id v8 = v113;
          id v7 = v114;
          id v10 = v116;
          v79 = v123;
          if (v83) {
            goto LABEL_97;
          }
        }
        else
        {

          id v84 = 0;
        }
        id v84 = v84;
        v83 = v84;
LABEL_97:
        v96 = objc_msgSend(v83, "dataContainerURL", v109);
        [v7 setDataContainerURL:v96];

        v97 = [v83 environmentVariables];
        [v7 setEnvironmentVariables:v97];

        v98 = [v83 groupContainerURLs];
        [v7 setGroupContainers:v98];

        v99 = +[MIDaemonConfiguration sharedInstance];
        int v100 = [v99 deviceHasPersonas];

        v41 = v119;
        if (v100) {
          uint64_t v101 = [v79 copy];
        }
        else {
          uint64_t v101 = objc_opt_new();
        }
        v102 = (void *)v101;
        [v7 setPersonasRecordMap:v101];

        BOOL v45 = 1;
        id v9 = v117;
        int v20 = v118;
        goto LABEL_128;
      }
      id v130 = v120;
      long long v62 = v9;
      id v61 = [v9 watchKitAppExecutableHashWithError:&v130];
      id v63 = v130;

      if (v61)
      {
        [v58 setWatchKitAppExecutableHash:v61];
        id v129 = v63;
        v74 = v10;
        char v75 = [v10 saveBundleMetadata:v58 withError:&v129];
        id v76 = v129;

        if ((v75 & 1) != 0 || gLogHandle && *(int *)(gLogHandle + 44) < 3) {
          goto LABEL_123;
        }
        v77 = [v62 identifier];
        v110 = v77;
        id v112 = v76;
        MOLogWrite();
LABEL_122:

LABEL_123:
        id v63 = v76;
LABEL_124:
        id v10 = v74;
        v41 = v119;
        goto LABEL_125;
      }
      v74 = v10;
      v77 = [v63 domain];
      if (![v77 isEqualToString:@"MIInstallerErrorDomain"]
        || [v63 code] != 85)
      {
        v103 = [v63 domain];
        if ([v103 isEqualToString:@"MIInstallerErrorDomain"])
        {
          uint64_t v104 = [v63 code];

          if (v104 == 139)
          {
LABEL_130:
            id v61 = 0;
            goto LABEL_124;
          }
        }
        else
        {
        }
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
          goto LABEL_130;
        }
        v77 = [v62 identifier];
        v110 = v77;
        id v112 = v63;
        MOLogWrite();
      }
      id v61 = 0;
      id v76 = v63;
      goto LABEL_122;
    }
LABEL_76:
    if (v11 == 10) {
      [v7 setIsPlaceholder:1];
    }
    if (!v41) {
      goto LABEL_127;
    }
    goto LABEL_79;
  }
  v55 = v47;
  uint64_t v42 = [v9 bundleURL];
  _CreateAndLogError((uint64_t)"-[MIInstalledInfoGatherer _populateBundleRecordValues:signingInfo:error:]", 642, @"MIInstallerErrorDomain", 4, 0, 0, @"Discovered %@ app without data container %@", v56, (uint64_t)v54);
LABEL_116:
  id v44 = (id)objc_claimAutoreleasedReturnValue();

LABEL_37:
  if (a5)
  {
    id v44 = v44;
    BOOL v45 = 0;
    *a5 = v44;
  }
  else
  {
    BOOL v45 = 0;
  }
LABEL_129:

  return v45;
}

- (void)_populateAppRecordValues:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MIInstalledInfoGatherer *)self bundle];
  int v28 = [v5 bundleType];
  id v6 = [(MIInstalledInfoGatherer *)self bundleContainer];
  id v7 = [v5 driverKitExtensionBundlesWithError:0];
  id v8 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v29 + 1) + 8 * v13) bundleURL];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    id v15 = (void *)[v8 copy];
    [v4 setDriverKitExtensionURLs:v15];
  }
  if (v6)
  {
    uint64_t v16 = +[MIDaemonConfiguration sharedInstance];
    int v17 = [v16 allowsInternalSecurityPolicy];

    if (v17)
    {
      uint64_t v18 = [v6 stashedBundleContainerWithError:0];
      if (v18)
      {
        v19 = [(MIInstalledInfoGatherer *)self _stashedAppRecordForStashedContainer:v18];
        uint64_t v33 = v19;
        int v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
        [v4 setStashedVersions:v20];
      }
    }
    uint64_t v21 = [v6 containerURL];
    if (v21)
    {
      v22 = (void *)v21;
      int v23 = [v6 hasParallelPlaceholder];

      if (v23)
      {
        uint64_t v24 = [v6 parallelPlaceholderURL];
        [v4 setParallelPlaceholderURL:v24];
      }
    }
    [v4 setIsUpdatedSystemApp:(v28 & 0xFFFFFFFB) == 1];
  }
  else
  {
    long long v25 = [(MIInstalledInfoGatherer *)self builtInAppParallelPlaceholderBundle];

    if (v25)
    {
      char v26 = [(MIInstalledInfoGatherer *)self builtInAppParallelPlaceholderBundle];
      id v27 = [v26 bundleURL];
      [v4 setParallelPlaceholderURL:v27];
    }
  }
}

- (void)_populateAppExtensionRecordValues:(id)a3
{
  id v4 = a3;
  id v5 = [(MIInstalledInfoGatherer *)self owningBundleIdentifier];
  [v4 setExtensionOwnerBundleID:v5];
}

- (void)_populatePlaceholderRecordValues:(id)a3 signingInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MIInstalledInfoGatherer *)self bundle];
  id v9 = [(MIInstalledInfoGatherer *)self bundleContainer];
  int v10 = [v8 bundleType];
  uint64_t v11 = [v7 entitlements];

  [v6 setIsOnDemandInstallCapable:MIHasOnDemandInstallCapableEntitlement(v11)];
  uint64_t v12 = MICopyParentIdentifiersEntitlement(v11);
  [v6 setParentIdentifiers:v12];

  [v6 setIsSwiftPlaygroundsApp:MIHasSwiftPlaygroundsAppEntitlement(v11)];
  uint64_t v13 = MICopyAppManagementDomainEntitlement(v11);
  [v6 setAppManagementDomain:v13];

  [v6 setIsWebNotificationBundle:MIHasWebKitPushBundleEntitlement(v11)];
  [v6 setIsBeta:MIHasBetaReportsActiveEntitlement(v11)];
  [v6 setIsMarketplace:MIHasMarketplaceEntitlement(v11)];
  if ((v10 - 1) >= 5 && v10 != 9)
  {
    uint64_t v16 = 0;
    if (!v9) {
      goto LABEL_53;
    }
LABEL_16:
    id v50 = 0;
    uint64_t v21 = objc_msgSend(v9, "bundleMetadataWithError:", &v50, v37, v41);
    id v22 = v50;
    int v46 = v22;
    if (v21)
    {
      int v23 = [v21 alternateIconName];
      [v6 setAlternateIconName:v23];

      uint64_t v24 = [v21 linkedParentBundleID];
      [v6 setLinkedParentBundleID:v24];

      long long v25 = [v21 installDate];
      [v6 setInstallDate:v25];

      if ([v8 isPlaceholder])
      {
        objc_msgSend(v6, "setPlaceholderFailureReason:", objc_msgSend(v21, "placeholderFailureReason"));
        goto LABEL_28;
      }
    }
    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        uint64_t v38 = v9;
        id v42 = v22;
        MOLogWrite();
      }
      if (objc_msgSend(v8, "isPlaceholder", v38, v42))
      {
LABEL_28:
        id v27 = [v9 containerURL];
        if (v27)
        {
          [v6 setBundleContainerURL:v27];
        }
        else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          uint64_t v38 = v9;
          MOLogWrite();
        }
        id v49 = v16;
        int v28 = objc_msgSend(v8, "lsInstallTypeWithError:", &v49, v38);
        id v29 = v49;

        if (v28)
        {
          [v6 setLsInstallType:v28];
        }
        else
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            uint64_t v39 = v8;
            id v42 = v29;
            MOLogWrite();
          }

          id v29 = 0;
        }
        long long v30 = objc_msgSend(v8, "watchKitV2AppBundleWithError:", 0, v39, v42);
        id v47 = v21;
        if (!v30)
        {
          uint64_t v33 = 1;
LABEL_52:
          objc_msgSend(v6, "setIsEligibleForWatchAppInstall:", v33, v40, v43);

          uint64_t v16 = v29;
          goto LABEL_53;
        }
        id v48 = v29;
        BOOL v45 = v9;
        long long v31 = [v9 iTunesMetadataWithError:&v48];
        id v32 = v48;

        if (v31)
        {
          uint64_t v33 = [v31 isEligibleForWatchAppInstall];
LABEL_51:

          id v29 = v32;
          id v9 = v45;
          goto LABEL_52;
        }
        uint64_t v34 = [v32 userInfo];
        uint64_t v35 = [v34 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

        uint64_t v36 = [v35 domain];
        if ([v36 isEqualToString:*MEMORY[0x1E4F281F8]])
        {
          uint64_t v44 = [v35 code];

          if (v44 == 260)
          {
LABEL_50:

            id v32 = 0;
            uint64_t v33 = 1;
            goto LABEL_51;
          }
        }
        else
        {
        }
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          uint64_t v40 = v45;
          id v43 = v32;
          MOLogWrite();
        }
        goto LABEL_50;
      }
    }
    char v26 = [v8 fairPlaySinfInfoWithError:0];
    if (!v26)
    {
      if ([v8 needsSinf])
      {
        char v26 = objc_opt_new();
        [v26 setIsMissingRequiredSINF:1];
      }
      else
      {
        char v26 = 0;
      }
    }
    [v6 setSinfInfo:v26];

    goto LABEL_28;
  }
  objc_msgSend(v6, "setIsDeletable:", objc_msgSend(v8, "isDeletable"));
  id v51 = 0;
  id v14 = [v8 installationIdentitySettingIfNotSet:0 withError:&v51];
  id v15 = v51;
  uint64_t v16 = v15;
  if (v14)
  {
    int v17 = [v14 uniqueInstallID];
    [v6 setUniqueInstallID:v17];

    uint64_t v18 = [v14 installSessionID];
    [v6 setInstallSessionID:v18];
    goto LABEL_15;
  }
  v19 = [v15 domain];
  if (![v19 isEqualToString:*MEMORY[0x1E4F28798]])
  {

    goto LABEL_11;
  }
  uint64_t v20 = [v16 code];

  if (v20 != 93)
  {
LABEL_11:
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v37 = v8;
      v41 = v16;
      MOLogWrite();
    }
  }
  uint64_t v18 = v16;
  uint64_t v16 = 0;
LABEL_15:

  if (v9) {
    goto LABEL_16;
  }
LABEL_53:
}

- (id)bundleRecordWithError:(id *)a3
{
  id v5 = [(MIInstalledInfoGatherer *)self bundle];
  switch([v5 bundleType])
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 0xBu:
      id v8 = (ICLSystemAppPlaceholderRecord *)objc_opt_new();
      goto LABEL_4;
    case 9u:
      id v6 = [v5 bundleURL];
      _CreateAndLogError((uint64_t)"-[MIInstalledInfoGatherer bundleRecordWithError:]", 983, @"MIInstallerErrorDomain", 4, 0, 0, @"Embedded watch apps don't get reported to Launch Services: %@", v13, (uint64_t)v6);
      goto LABEL_8;
    case 0xAu:
      id v8 = [ICLSystemAppPlaceholderRecord alloc];
LABEL_4:
      id v9 = v8;
      id v15 = 0;
      BOOL v10 = [(MIInstalledInfoGatherer *)self _populateBundleRecord:v8 error:&v15];
      id v11 = v15;
      if (!v10) {
        goto LABEL_9;
      }
      id v9 = v9;
      uint64_t v12 = v9;
      if (!a3) {
        goto LABEL_12;
      }
      goto LABEL_10;
    default:
      id v6 = [v5 bundleURL];
      _CreateAndLogError((uint64_t)"-[MIInstalledInfoGatherer bundleRecordWithError:]", 987, @"MIInstallerErrorDomain", 4, 0, 0, @"Unable to determine application type for %@", v7, (uint64_t)v6);
LABEL_8:
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      id v9 = 0;
LABEL_9:
      uint64_t v12 = 0;
      if (a3)
      {
LABEL_10:
        if (!v12) {
          *a3 = v11;
        }
      }
LABEL_12:

      return v12;
  }
}

- (BOOL)_populateBundleRecord:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(MIInstalledInfoGatherer *)self bundle];
  id v8 = [v7 identifier];

  id v9 = [(MIInstalledInfoGatherer *)self bundle];
  if (MILogHandleForSignpost_onceToken != -1) {
    dispatch_once(&MILogHandleForSignpost_onceToken, &__block_literal_global_3);
  }
  BOOL v10 = MILogHandleForSignpost_logHandle;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v8;
    _os_signpost_emit_with_name_impl(&dword_1BCA62000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GenerateDict", "Generating ICL bundle record for %@", buf, 0xCu);
  }
  id v25 = 0;
  id v11 = [v9 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:0 checkingTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:&v25];
  id v12 = v25;
  uint64_t v13 = v12;
  if (!v11)
  {
    id v14 = [v12 domain];
    if ([v14 isEqualToString:@"MIInstallerErrorDomain"]
      && [v13 code] == 71)
    {
      int v15 = [v9 bundleType];

      if (v15 == 7) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 4)
    {
      uint64_t v16 = [v9 bundleURL];
      int v23 = [v16 path];
      MOLogWrite();
    }
  }
LABEL_14:

  id v24 = 0;
  BOOL v17 = [(MIInstalledInfoGatherer *)self _populateBundleRecordValues:v6 signingInfo:v11 error:&v24];
  id v18 = v24;
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MIInstalledInfoGatherer *)self _populateAppRecordValues:v6];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MIInstalledInfoGatherer *)self _populateAppExtensionRecordValues:v6];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MIInstalledInfoGatherer *)self _populatePlaceholderRecordValues:v6 signingInfo:v11];
    }
  }
  if (MILogHandleForSignpost_onceToken != -1) {
    dispatch_once(&MILogHandleForSignpost_onceToken, &__block_literal_global_3);
  }
  v19 = MILogHandleForSignpost_logHandle;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle))
  {
    uint64_t v20 = @"[FAIL] ";
    if (v17) {
      uint64_t v20 = &stru_1F16FEFE8;
    }
    *(_DWORD *)buf = 138412546;
    id v27 = v20;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_signpost_emit_with_name_impl(&dword_1BCA62000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GenerateDict", "%@Done generating ICL bundle record for %@", buf, 0x16u);
  }
  if (a4) {
    char v21 = v17;
  }
  else {
    char v21 = 1;
  }
  if ((v21 & 1) == 0) {
    *a4 = v18;
  }

  return v17;
}

- (MIExecutableBundle)bundle
{
  return self->_bundle;
}

- (MIExecutableBundle)builtInAppParallelPlaceholderBundle
{
  return self->_builtInAppParallelPlaceholderBundle;
}

- (MIBundleContainer)bundleContainer
{
  return self->_bundleContainer;
}

- (NSArray)personaUniqueStrings
{
  return self->_personaUniqueStrings;
}

- (NSArray)dataContainers
{
  return self->_dataContainers;
}

- (NSString)owningBundleIdentifier
{
  return self->_owningBundleIdentifier;
}

- (NSURL)parentBundleURL
{
  return self->_parentBundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentBundleURL, 0);
  objc_storeStrong((id *)&self->_owningBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dataContainers, 0);
  objc_storeStrong((id *)&self->_personaUniqueStrings, 0);
  objc_storeStrong((id *)&self->_bundleContainer, 0);
  objc_storeStrong((id *)&self->_builtInAppParallelPlaceholderBundle, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end