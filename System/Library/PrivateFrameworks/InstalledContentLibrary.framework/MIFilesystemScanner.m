@interface MIFilesystemScanner
- (BOOL)_scanAppsDirectory:(id)a3 withError:(id *)a4;
- (BOOL)_scanBundleContainersWithClass:(unint64_t)a3 withError:(id *)a4 ignoredErrorOccurredOnOneOrMoreItems:(BOOL *)a5;
- (BOOL)_scanExtensionKitDirectory:(id)a3 withError:(id *)a4;
- (BOOL)_scanExtensionKitLocations:(id)a3 withError:(id *)a4;
- (BOOL)_scanFrameworkDirectory:(id)a3 withError:(id *)a4;
- (BOOL)_scanFrameworksLocationsWithError:(id *)a3;
- (BOOL)performScanWithError:(id *)a3;
- (MIFilesystemScanner)init;
- (MIFilesystemScanner)initWithScanOptions:(unint64_t)a3;
- (MIFilesystemScanner)initWithScanOptions:(unint64_t)a3 personaUniqueString:(id)a4;
- (MIFilesystemScannerDelegate)delegate;
- (NSString)personaUniqueString;
- (id)builtInExtensionKitExtensionsDirectories;
- (unint64_t)options;
- (void)setDelegate:(id)a3;
@end

@implementation MIFilesystemScanner

- (BOOL)_scanAppsDirectory:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v7 = +[MIFileManager defaultManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__MIFilesystemScanner__scanAppsDirectory_withError___block_invoke;
  v16[3] = &unk_1E62E6DA0;
  v16[4] = self;
  v16[5] = v17;
  id v8 = [v7 enumerateURLsForItemsInDirectoryAtURL:v6 ignoreSymlinks:1 withBlock:v16];

  if (!v8)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      v15 = [v6 path];
      MOLogWrite();
    }
    id v8 = 0;
    goto LABEL_9;
  }
  v9 = [v8 domain];
  if (![v9 isEqualToString:*MEMORY[0x1E4F28798]])
  {

    goto LABEL_11;
  }
  uint64_t v10 = [v8 code];

  if (v10 == 2)
  {
LABEL_9:
    BOOL v12 = 1;
    goto LABEL_14;
  }
LABEL_11:
  v13 = _CreateAndLogError((uint64_t)"-[MIFilesystemScanner _scanAppsDirectory:withError:]", 76, @"MIInstallerErrorDomain", 27, v8, 0, @"Failed to enumerate %@", v11, (uint64_t)v6);

  if (a4)
  {
    id v8 = v13;
    BOOL v12 = 0;
    *a4 = v8;
  }
  else
  {
    BOOL v12 = 0;
    id v8 = v13;
  }
LABEL_14:

  _Block_object_dispose(v17, 8);
  return v12;
}

uint64_t __52__MIFilesystemScanner__scanAppsDirectory_withError___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 4)
  {
    v7 = [v5 pathExtension];
    if (![v7 isEqualToString:@"app"])
    {
LABEL_18:

      goto LABEL_19;
    }
    id v22 = 0;
    id v8 = +[MIBundle bundleForURL:v6 error:&v22];
    id v9 = v22;
    uint64_t v10 = v9;
    if (v8)
    {
      if (([v8 isPlaceholder] & 1) != 0
        || (+[MIFileManager defaultManager],
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            [v8 executableURL],
            BOOL v12 = objc_claimAutoreleasedReturnValue(),
            int v13 = [v11 itemDoesNotExistAtURL:v12],
            v12,
            v11,
            !v13))
      {
        v15 = [*(id *)(a1 + 32) delegate];
        v16 = [*(id *)(a1 + 32) personaUniqueString];
        id v21 = v10;
        int v17 = [v15 scanExecutableBundle:v8 inContainer:0 forPersona:v16 withError:&v21];
        id v18 = v21;

        if (v17) {
          ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        }
        uint64_t v10 = v18;
        goto LABEL_17;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
LABEL_17:

        goto LABEL_18;
      }
      v14 = [v8 executableURL];
      v20 = [v14 path];
      MOLogWrite();
    }
    else
    {
      if (_IsMalformedBundleError(v9) || gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_17;
      }
      v14 = [v6 path];
      MOLogWrite();
    }

    goto LABEL_17;
  }
LABEL_19:

  return 1;
}

- (BOOL)_scanFrameworkDirectory:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v7 = +[MIFileManager defaultManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__MIFilesystemScanner__scanFrameworkDirectory_withError___block_invoke;
  v16[3] = &unk_1E62E6DA0;
  v16[4] = self;
  v16[5] = v17;
  id v8 = [v7 enumerateURLsForItemsInDirectoryAtURL:v6 ignoreSymlinks:1 withBlock:v16];

  if (!v8)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      v15 = [v6 path];
      MOLogWrite();
    }
    id v8 = 0;
    goto LABEL_9;
  }
  id v9 = [v8 domain];
  if (![v9 isEqualToString:*MEMORY[0x1E4F28798]])
  {

    goto LABEL_11;
  }
  uint64_t v10 = [v8 code];

  if (v10 == 2)
  {
LABEL_9:
    BOOL v12 = 1;
    goto LABEL_14;
  }
LABEL_11:
  int v13 = _CreateAndLogError((uint64_t)"-[MIFilesystemScanner _scanFrameworkDirectory:withError:]", 159, @"MIInstallerErrorDomain", 27, v8, 0, @"Failed to enumerate %@", v11, (uint64_t)v6);

  if (a4)
  {
    id v8 = v13;
    BOOL v12 = 0;
    *a4 = v8;
  }
  else
  {
    BOOL v12 = 0;
    id v8 = v13;
  }
LABEL_14:

  _Block_object_dispose(v17, 8);
  return v12;
}

uint64_t __57__MIFilesystemScanner__scanFrameworkDirectory_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 pathExtension];
  if ([v4 isEqualToString:@"framework"]
    && !+[MIBundle bundleIsInDenyList:v3])
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
    if ((v5 & 0x80) != 0)
    {
      id v6 = [v3 URLByAppendingPathComponent:@"PlugIns" isDirectory:1];
      v7 = +[MIFileManager defaultManager];
      int v8 = [v7 itemDoesNotExistAtURL:v6];

      if (v8)
      {
        id v9 = [v3 URLByAppendingPathComponent:@"Extensions" isDirectory:1];
        uint64_t v10 = +[MIFileManager defaultManager];
        char v11 = [v10 itemDoesNotExistAtURL:v9];

        if (v11)
        {

          goto LABEL_21;
        }
      }
    }
    id v24 = 0;
    BOOL v12 = +[MIBundle bundleForURL:v3 error:&v24];
    id v13 = v24;
    v14 = v13;
    if (!v12)
    {
      if (_IsMalformedBundleError(v13) || gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_20;
      }
      v16 = [v3 path];
      MOLogWrite();
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
    v15 = [*(id *)(a1 + 32) delegate];
    v16 = v15;
    if ((v5 & 0x80) != 0)
    {
      id v23 = v14;
      char v20 = [v15 scanAppExtensionsInFrameworkBundle:v12 withError:&v23];
      id v19 = v23;

      if ((v20 & 1) == 0)
      {
LABEL_18:
        v14 = v19;
        goto LABEL_19;
      }
    }
    else
    {
      int v17 = [*(id *)(a1 + 32) personaUniqueString];
      id v22 = v14;
      int v18 = [v16 scanExecutableBundle:v12 inContainer:0 forPersona:v17 withError:&v22];
      id v19 = v22;

      if (!v18) {
        goto LABEL_18;
      }
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    goto LABEL_18;
  }
LABEL_21:

  return 1;
}

- (BOOL)_scanFrameworksLocationsWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v5 = [v4 allFrameworksDirectories];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        id v16 = 0;
        BOOL v12 = [(MIFilesystemScanner *)self _scanFrameworkDirectory:v11 withError:&v16];
        id v13 = v16;
        if (!v12)
        {
          v14 = [(MIFilesystemScanner *)self delegate];
          [v14 errorOccurred:v13];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return 1;
}

- (BOOL)_scanExtensionKitDirectory:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  uint64_t v7 = +[MIFileManager defaultManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__MIFilesystemScanner__scanExtensionKitDirectory_withError___block_invoke;
  v16[3] = &unk_1E62E6DA0;
  v16[4] = self;
  v16[5] = v17;
  id v8 = [v7 enumerateURLsForItemsInDirectoryAtURL:v6 ignoreSymlinks:1 withBlock:v16];

  if (!v8)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      v15 = [v6 path];
      MOLogWrite();
    }
    id v8 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = [v8 domain];
  if (![v9 isEqualToString:*MEMORY[0x1E4F28798]])
  {

    goto LABEL_11;
  }
  uint64_t v10 = [v8 code];

  if (v10 == 2)
  {
LABEL_9:
    BOOL v12 = 1;
    goto LABEL_14;
  }
LABEL_11:
  id v13 = _CreateAndLogError((uint64_t)"-[MIFilesystemScanner _scanExtensionKitDirectory:withError:]", 227, @"MIInstallerErrorDomain", 27, v8, 0, @"Failed to enumerate %@", v11, (uint64_t)v6);

  if (a4)
  {
    id v8 = v13;
    BOOL v12 = 0;
    *a4 = v8;
  }
  else
  {
    BOOL v12 = 0;
    id v8 = v13;
  }
LABEL_14:

  _Block_object_dispose(v17, 8);
  return v12;
}

uint64_t __60__MIFilesystemScanner__scanExtensionKitDirectory_withError___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 4)
  {
    uint64_t v7 = [v5 pathExtension];
    if (![v7 isEqualToString:@"appex"])
    {
LABEL_9:

      goto LABEL_10;
    }
    id v17 = 0;
    id v8 = +[MIBundle bundleForURL:v6 error:&v17];
    id v9 = v17;
    uint64_t v10 = v9;
    if (v8)
    {
      uint64_t v11 = [*(id *)(a1 + 32) delegate];
      BOOL v12 = [*(id *)(a1 + 32) personaUniqueString];
      id v16 = v10;
      int v13 = [v11 scanExecutableBundle:v8 inContainer:0 forPersona:v12 withError:&v16];
      id v14 = v16;

      if (v13) {
        ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      }
      uint64_t v10 = v14;
    }
    else
    {
      if (_IsMalformedBundleError(v9) || gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_8;
      }
      uint64_t v11 = [v6 path];
      MOLogWrite();
    }

LABEL_8:
    goto LABEL_9;
  }
LABEL_10:

  return 1;
}

- (id)builtInExtensionKitExtensionsDirectories
{
  v2 = +[MIDaemonConfiguration sharedInstance];
  id v3 = [v2 builtInExtensionKitExtensionsDirectories];

  return v3;
}

- (BOOL)_scanExtensionKitLocations:(id)a3 withError:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        id v15 = 0;
        BOOL v11 = [(MIFilesystemScanner *)self _scanExtensionKitDirectory:v10 withError:&v15];
        id v12 = v15;
        if (!v11)
        {
          int v13 = [(MIFilesystemScanner *)self delegate];
          [v13 errorOccurred:v12];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return 1;
}

- (BOOL)_scanBundleContainersWithClass:(unint64_t)a3 withError:(id *)a4 ignoredErrorOccurredOnOneOrMoreItems:(BOOL *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void *)MEMORY[0x1C1878860](self, a2);
  v37 = self;
  uint64_t v10 = [(MIFilesystemScanner *)self personaUniqueString];
  if (v10)
  {
    uint64_t v45 = 0;
    BOOL v11 = (id *)&v45;
    uint64_t v12 = +[MIContainer containersWithClass:a3 personaUniqueString:v10 error:&v45];
  }
  else
  {
    uint64_t v44 = 0;
    BOOL v11 = (id *)&v44;
    uint64_t v12 = +[MIContainer containersWithClass:a3 error:&v44];
  }
  int v13 = (void *)v12;
  id v15 = *v11;
  if (v13)
  {
    v32 = v10;
    v38 = [(MIFilesystemScanner *)v37 delegate];
    if (!v38 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
      MOLogWrite();
    }
    context = v9;
    v34 = v13;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v13;
    uint64_t v16 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v36 = 0;
      uint64_t v18 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(obj);
          }
          long long v20 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v21 = (void *)MEMORY[0x1C1878860]();
          uint64_t v22 = [v20 bundle];

          if (v22)
          {
            id v23 = [v20 bundle];
            id v24 = [(MIFilesystemScanner *)v37 personaUniqueString];
            id v39 = v15;
            char v25 = [v38 scanExecutableBundle:v23 inContainer:v20 forPersona:v24 withError:&v39];
            id v26 = v39;

            if (v25)
            {
              ++v36;
            }
            else if (a5)
            {
              *a5 = 1;
            }
            id v15 = v26;
          }
          else
          {
            if (a5) {
              *a5 = 1;
            }
            v27 = [v20 identifier];
            _CreateAndLogError((uint64_t)"-[MIFilesystemScanner _scanBundleContainersWithClass:withError:ignoredErrorOccurredOnOneOrMoreItems:]", 288, @"MIInstallerErrorDomain", 36, 0, 0, @"No bundle found in container %@; skipping.",
              v28,
            v29 = (uint64_t)v27);
            [v38 errorOccurred:v29];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v17);
    }

    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      MOLogWrite();
    }
    int v13 = v34;
  }
  else
  {
    v30 = _CreateAndLogError((uint64_t)"-[MIFilesystemScanner _scanBundleContainersWithClass:withError:ignoredErrorOccurredOnOneOrMoreItems:]", 275, @"MIInstallerErrorDomain", 4, v15, 0, @"Failed to scan for bundle containers of content class %ld", v14, a3);

    if (a4)
    {
      id v15 = v30;
      *a4 = v15;
    }
    else
    {
      id v15 = v30;
    }
  }

  return v13 != 0;
}

- (MIFilesystemScanner)initWithScanOptions:(unint64_t)a3 personaUniqueString:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIFilesystemScanner;
  uint64_t v8 = [(MIFilesystemScanner *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_options = a3;
    objc_storeStrong((id *)&v8->_personaUniqueString, a4);
  }

  return v9;
}

- (MIFilesystemScanner)initWithScanOptions:(unint64_t)a3
{
  id v5 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v6 = [v5 primaryPersonaString];
  id v7 = [(MIFilesystemScanner *)self initWithScanOptions:a3 personaUniqueString:v6];

  return v7;
}

- (MIFilesystemScanner)init
{
  id v3 = +[MIDaemonConfiguration sharedInstance];
  v4 = [v3 primaryPersonaString];
  id v5 = [(MIFilesystemScanner *)self initWithScanOptions:3967 personaUniqueString:v4];

  return v5;
}

- (BOOL)performScanWithError:(id *)a3
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  v4 = +[MIFileManager defaultManager];
  v83 = [(MIFilesystemScanner *)self delegate];
  __int16 v5 = [(MIFilesystemScanner *)self options];
  if (v5)
  {
    id v105 = 0;
    BOOL v7 = [(MIFilesystemScanner *)self _scanBundleContainersWithClass:1 withError:&v105 ignoredErrorOccurredOnOneOrMoreItems:0];
    id v6 = v105;
    if (!v7) {
      [v83 errorOccurred:v6];
    }
  }
  else
  {
    id v6 = 0;
  }
  BOOL v8 = +[ICLFeatureFlags appReferencesEnabled];
  if ((v5 & 0x400) != 0 && v8)
  {
    id v104 = v6;
    BOOL v9 = [(MIFilesystemScanner *)self _scanBundleContainersWithClass:14 withError:&v104 ignoredErrorOccurredOnOneOrMoreItems:0];
    id v10 = v104;

    if (!v9) {
      [v83 errorOccurred:v10];
    }
  }
  else
  {
    id v10 = v6;
  }
  v82 = self;
  if ((v5 & 2) == 0)
  {
    id v11 = v10;
    if ((v5 & 0x20) != 0) {
      goto LABEL_12;
    }
LABEL_28:
    id v15 = v11;
    if ((v5 & 8) != 0) {
      goto LABEL_15;
    }
LABEL_29:
    id v19 = v15;
    if ((v5 & 0x40) != 0) {
      goto LABEL_18;
    }
LABEL_30:
    id v23 = v19;
    if ((v5 & 0x10) != 0) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }
  v27 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v28 = [v27 systemAppsDirectory];
  id v103 = v10;
  BOOL v29 = [(MIFilesystemScanner *)self _scanAppsDirectory:v28 withError:&v103];
  id v11 = v103;

  if (!v29) {
    [v83 errorOccurred:v11];
  }
  if ((v5 & 0x20) == 0) {
    goto LABEL_28;
  }
LABEL_12:
  uint64_t v12 = +[MIDaemonConfiguration sharedInstance];
  int v13 = [v12 coreServicesDirectory];
  id v102 = v11;
  BOOL v14 = [(MIFilesystemScanner *)self _scanAppsDirectory:v13 withError:&v102];
  id v15 = v102;

  if (!v14) {
    [v83 errorOccurred:v15];
  }
  if ((v5 & 8) == 0) {
    goto LABEL_29;
  }
LABEL_15:
  uint64_t v16 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v17 = [v16 internalAppsDirectory];
  id v101 = v15;
  BOOL v18 = [(MIFilesystemScanner *)self _scanAppsDirectory:v17 withError:&v101];
  id v19 = v101;

  if (!v18) {
    [v83 errorOccurred:v19];
  }
  if ((v5 & 0x40) == 0) {
    goto LABEL_30;
  }
LABEL_18:
  long long v20 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v21 = [v20 systemAppPlaceholdersDirectory];
  id v100 = v19;
  BOOL v22 = [(MIFilesystemScanner *)self _scanAppsDirectory:v21 withError:&v100];
  id v23 = v100;

  if (!v22) {
    [v83 errorOccurred:v23];
  }
  if ((v5 & 0x10) != 0)
  {
LABEL_21:
    id v99 = v23;
    BOOL v24 = [(MIFilesystemScanner *)self _scanFrameworksLocationsWithError:&v99];
    id v25 = v99;

    if (!v24) {
      [v83 errorOccurred:v25];
    }
    if ((v5 & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_32;
  }
LABEL_31:
  id v25 = v23;
  if ((v5 & 0x800) == 0)
  {
LABEL_24:
    id v26 = v25;
    goto LABEL_34;
  }
LABEL_32:
  v30 = [(MIFilesystemScanner *)self builtInExtensionKitExtensionsDirectories];
  id v98 = v25;
  BOOL v31 = [(MIFilesystemScanner *)self _scanExtensionKitLocations:v30 withError:&v98];
  id v26 = v98;

  if (!v31) {
    [v83 errorOccurred:v26];
  }
LABEL_34:
  if ((v5 & 0x200) != 0)
  {
    v32 = +[MIDaemonConfiguration sharedInstance];
    v33 = [v32 cryptexAppsDirectory];
    id v97 = v26;
    v34 = [v4 realPathForURL:v33 allowNonExistentPathComponents:0 isDirectory:1 error:&v97];
    id v35 = v97;

    if (v34)
    {
      id v96 = v35;
      BOOL v36 = [(MIFilesystemScanner *)self _scanAppsDirectory:v34 withError:&v96];
      id v37 = v96;

      id v35 = v37;
      if (v36) {
        goto LABEL_43;
      }
    }
    else
    {
      v38 = [v35 domain];
      if ([v38 isEqualToString:*MEMORY[0x1E4F28798]])
      {
        uint64_t v39 = [v35 code];

        if (v39 == 2) {
          goto LABEL_43;
        }
      }
      else
      {
      }
    }
    [v83 errorOccurred:v35];
LABEL_43:

    id v26 = v35;
  }
  if ((v5 & 0x100) == 0) {
    goto LABEL_63;
  }
  char v80 = v5;
  long long v40 = +[MIDaemonConfiguration sharedInstance];
  long long v41 = [v40 cryptexFrameworksDirectories];

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v42 = v41;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v92 objects:v111 count:16];
  if (!v43) {
    goto LABEL_60;
  }
  uint64_t v44 = v43;
  uint64_t v45 = *(void *)v93;
  uint64_t v46 = *MEMORY[0x1E4F28798];
  do
  {
    for (uint64_t i = 0; i != v44; ++i)
    {
      if (*(void *)v93 != v45) {
        objc_enumerationMutation(v42);
      }
      uint64_t v48 = *(void *)(*((void *)&v92 + 1) + 8 * i);

      id v91 = 0;
      v49 = [v4 realPathForURL:v48 allowNonExistentPathComponents:0 isDirectory:1 error:&v91];
      id v50 = v91;
      id v26 = v50;
      if (v49)
      {
        id v90 = v50;
        BOOL v51 = [(MIFilesystemScanner *)v82 _scanAppsDirectory:v49 withError:&v90];
        id v52 = v90;

        id v26 = v52;
        if (!v51) {
          goto LABEL_57;
        }
      }
      else
      {
        v53 = [v50 domain];
        if (([v53 isEqualToString:v46] & 1) == 0)
        {

LABEL_57:
          [v83 errorOccurred:v26];
          goto LABEL_58;
        }
        uint64_t v54 = [v26 code];

        if (v54 != 2) {
          goto LABEL_57;
        }
      }
LABEL_58:
    }
    uint64_t v44 = [v42 countByEnumeratingWithState:&v92 objects:v111 count:16];
  }
  while (v44);
LABEL_60:
  v55 = v26;

  v56 = +[MIDaemonConfiguration sharedInstance];
  v57 = [v56 cryptexExtensionKitExtensionsDirectories];
  id v89 = v26;
  BOOL v58 = [(MIFilesystemScanner *)v82 _scanExtensionKitLocations:v57 withError:&v89];
  id v26 = v89;

  if (!v58) {
    [v83 errorOccurred:v26];
  }

  LOBYTE(v5) = v80;
LABEL_63:
  if ((v5 & 4) != 0)
  {
    v81 = v4;
    v59 = [MEMORY[0x1E4F1CA48] array];
    v60 = MIDiskImageManagerProxy();
    v61 = [v60 diskMountPaths];

    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v62 = v61;
    uint64_t v63 = [v62 countByEnumeratingWithState:&v106 objects:v112 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v107;
      do
      {
        for (uint64_t j = 0; j != v64; ++j)
        {
          if (*(void *)v107 != v65) {
            objc_enumerationMutation(v62);
          }
          v67 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*((void *)&v106 + 1) + 8 * j) isDirectory:1];
          v68 = [v67 URLByAppendingPathComponent:@"Applications" isDirectory:1];
          [v59 addObject:v68];
        }
        uint64_t v64 = [v62 countByEnumeratingWithState:&v106 objects:v112 count:16];
      }
      while (v64);
    }

    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      v79 = v59;
      MOLogWrite();
    }
    v69 = objc_msgSend(v59, "copy", v79);

    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v70 = v69;
    uint64_t v71 = [v70 countByEnumeratingWithState:&v85 objects:v110 count:16];
    if (v71)
    {
      uint64_t v72 = v71;
      uint64_t v73 = *(void *)v86;
      do
      {
        uint64_t v74 = 0;
        v75 = v26;
        do
        {
          if (*(void *)v86 != v73) {
            objc_enumerationMutation(v70);
          }
          uint64_t v76 = *(void *)(*((void *)&v85 + 1) + 8 * v74);
          id v84 = v75;
          BOOL v77 = [(MIFilesystemScanner *)v82 _scanAppsDirectory:v76 withError:&v84];
          id v26 = v84;

          if (!v77) {
            [v83 errorOccurred:v26];
          }
          ++v74;
          v75 = v26;
        }
        while (v72 != v74);
        uint64_t v72 = [v70 countByEnumeratingWithState:&v85 objects:v110 count:16];
      }
      while (v72);
    }

    v4 = v81;
  }

  return 1;
}

- (MIFilesystemScannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MIFilesystemScannerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end