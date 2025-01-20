@interface MIBundleContainer
+ (BOOL)purgeTransientBundleContainersWithError:(id *)a3;
+ (BOOL)updateiTunesMetadata:(id)a3 forAppWithIdentifier:(id)a4 error:(id *)a5;
+ (id)allAppBundleContainersWithError:(id *)a3;
+ (id)appBundleContainerForIdentifier:(id)a3 inDomain:(unint64_t)a4 withError:(id *)a5;
+ (id)appBundleContainerForIdentifier:(id)a3 temporary:(BOOL)a4 inDomain:(unint64_t)a5 withError:(id *)a6;
+ (id)appBundleContainerWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6;
+ (id)pluginKitPluginBundleContainerWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6;
+ (id)privateAppBundleContainerWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6;
+ (id)privateTempAppBundleContainerWithIdentifier:(id)a3 error:(id *)a4;
+ (id)tempAppBundleContainerWithIdentifier:(id)a3 error:(id *)a4;
+ (id)tempAppBundleContainerWithIdentifier:(id)a3 inDomain:(unint64_t)a4 withError:(id *)a5;
+ (id)tempPluginKitPluginBundleContainerWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_configureBundleWithError:(id *)a3;
- (BOOL)_writeRawiTunesMetadataData:(id)a3 error:(id *)a4;
- (BOOL)bestEffortRollbackiTunesMetadata:(id)a3 error:(id *)a4;
- (BOOL)captureBundleByMoving:(id)a3 withError:(id *)a4;
- (BOOL)captureStoreDataFromDirectory:(id)a3 doCopy:(BOOL)a4 failureIsFatal:(BOOL)a5 includeiTunesMetadata:(BOOL)a6 withError:(id *)a7;
- (BOOL)cloneContentFromStashedBundleContainer:(id)a3 error:(id *)a4;
- (BOOL)hasParallelPlaceholder;
- (BOOL)makeContainerLiveReplacingContainer:(id)a3 reason:(unint64_t)a4 waitForDeletion:(BOOL)a5 withError:(id *)a6;
- (BOOL)saveBundleMetadata:(id)a3 withError:(id *)a4;
- (BOOL)shouldHaveCorrespondingDataContainer;
- (BOOL)stashBundleContainerContents:(id)a3 error:(id *)a4;
- (BOOL)transferExistingStashesFromContainer:(id)a3 error:(id *)a4;
- (BOOL)writeiTunesMetadata:(id)a3 error:(id *)a4;
- (MIBundleContainer)initWithContainer:(id)a3 error:(id *)a4;
- (MIBundleContainer)initWithToken:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (MIBundleMetadata)bundleMetadata;
- (MIExecutableBundle)bundle;
- (MIStoreMetadata)iTunesMetadata;
- (NSURL)bundleMetadataURL;
- (NSURL)compatibilityLinkDestination;
- (NSURL)iTunesMetadataURL;
- (NSURL)parallelPlaceholderURL;
- (NSURL)referenceStorageURL;
- (NSURL)stashBaseURL;
- (id)_bundleExtensionForContainerClassWithError:(id *)a3;
- (id)_stashURLForIndex:(unint64_t)a3;
- (id)_stashedBundleContainerForIndex:(unint64_t)a3 error:(id *)a4;
- (id)bundleMetadataWithError:(id *)a3;
- (id)iTunesMetadataWithError:(id *)a3;
- (id)initForAppContainerWithURL:(id)a3;
- (id)stashedBundleContainerWithError:(id *)a3;
- (unsigned)bundleMaxLinkedSDKVersion;
- (void)setBundleMetadata:(id)a3;
- (void)setITunesMetadata:(id)a3;
@end

@implementation MIBundleContainer

+ (id)appBundleContainerForIdentifier:(id)a3 temporary:(BOOL)a4 inDomain:(unint64_t)a5 withError:(id *)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  if (a5 == 3)
  {
    if (v8)
    {
      v18 = 0;
      uint64_t v12 = [a1 privateTempAppBundleContainerWithIdentifier:v11 error:&v18];
      v13 = v18;
    }
    else
    {
      v17 = 0;
      uint64_t v12 = [a1 privateAppBundleContainerWithIdentifier:v11 createIfNeeded:0 created:0 error:&v17];
      v13 = v17;
    }
  }
  else
  {
    if (a5 != 2)
    {
      uint64_t v15 = _CreateAndLogError((uint64_t)"+[MIBundleContainer appBundleContainerForIdentifier:temporary:inDomain:withError:]", 79, @"MIInstallerErrorDomain", 4, 0, 0, @"MIInstallationDomain was not set to either MIInstallationDomainSystemShared or MIInstallationDomainUserPrivate: %lu", v10, a5);
      uint64_t v12 = 0;
      goto LABEL_11;
    }
    if (v8)
    {
      v20 = 0;
      uint64_t v12 = [a1 tempAppBundleContainerWithIdentifier:v11 error:&v20];
      v13 = v20;
    }
    else
    {
      v19 = 0;
      uint64_t v12 = [a1 appBundleContainerWithIdentifier:v11 createIfNeeded:0 created:0 error:&v19];
      v13 = v19;
    }
  }
  uint64_t v15 = v13;
LABEL_11:
  if (!(v12 | v15))
  {
    uint64_t v15 = _CreateAndLogError((uint64_t)"+[MIBundleContainer appBundleContainerForIdentifier:temporary:inDomain:withError:]", 85, @"MIInstallerErrorDomain", 26, 0, 0, @"Could not find installed app with identifier %@ in domain %lu", v14, (uint64_t)v11);
  }
  if (a6 && !v12) {
    *a6 = (id) v15;
  }

  return (id)v12;
}

+ (id)appBundleContainerWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = +[MIGlobalConfiguration sharedInstance];
  uint64_t v12 = [v11 primaryPersonaString];
  v13 = [a1 containerWithIdentifier:v10 forPersona:v12 ofContentClass:1 createIfNeeded:v8 created:a5 error:a6];

  return v13;
}

+ (id)pluginKitPluginBundleContainerWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = +[MIGlobalConfiguration sharedInstance];
  uint64_t v12 = [v11 primaryPersonaString];
  v13 = [a1 containerWithIdentifier:v10 forPersona:v12 ofContentClass:3 createIfNeeded:v8 created:a5 error:a6];

  return v13;
}

+ (id)tempAppBundleContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[MIGlobalConfiguration sharedInstance];
  BOOL v8 = [v7 primaryPersonaString];
  v9 = [a1 tempContainerWithIdentifier:v6 forPersona:v8 ofContentClass:1 error:a4];

  return v9;
}

+ (id)privateAppBundleContainerWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = +[MIGlobalConfiguration sharedInstance];
  uint64_t v12 = [v11 primaryPersonaString];
  v13 = [a1 containerWithIdentifier:v10 forPersona:v12 ofContentClass:14 createIfNeeded:v8 created:a5 error:a6];

  return v13;
}

+ (id)privateTempAppBundleContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[MIGlobalConfiguration sharedInstance];
  BOOL v8 = [v7 primaryPersonaString];
  v9 = [a1 tempContainerWithIdentifier:v6 forPersona:v8 ofContentClass:14 error:a4];

  return v9;
}

+ (id)tempAppBundleContainerWithIdentifier:(id)a3 inDomain:(unint64_t)a4 withError:(id *)a5
{
  return (id)[a1 appBundleContainerForIdentifier:a3 temporary:1 inDomain:a4 withError:a5];
}

+ (id)tempPluginKitPluginBundleContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[MIGlobalConfiguration sharedInstance];
  BOOL v8 = [v7 primaryPersonaString];
  v9 = [a1 tempContainerWithIdentifier:v6 forPersona:v8 ofContentClass:3 error:a4];

  return v9;
}

+ (id)appBundleContainerForIdentifier:(id)a3 inDomain:(unint64_t)a4 withError:(id *)a5
{
  return (id)[a1 appBundleContainerForIdentifier:a3 temporary:0 inDomain:a4 withError:a5];
}

+ (id)allAppBundleContainersWithError:(id *)a3
{
  v4 = objc_opt_class();
  return (id)[v4 containersWithClass:1 error:a3];
}

+ (BOOL)purgeTransientBundleContainersWithError:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_new();
  id v6 = objc_opt_new();
  if (!+[ICLFeatureFlags transientBundleCleanupEnabled])
  {
    _CreateAndLogError((uint64_t)"+[MIBundleContainer purgeTransientBundleContainersWithError:]", 157, @"MIInstallerErrorDomain", 4, 0, 0, @"%s is not enabled", v7, (uint64_t)"+[MIBundleContainer purgeTransientBundleContainersWithError:]");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    BOOL v8 = 0;
    if (!a3) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }
  id v39 = 0;
  BOOL v8 = [(id)objc_opt_class() containersForIdentifier:0 groupContainerIdentifier:0 ofContentClass:1 forPersona:0 fetchTransient:1 createIfNeeded:0 error:&v39];
  id v9 = v39;
  if (!v8)
  {
    v22 = 0;
    if (!a3) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }
  id v38 = v9;
  uint64_t v10 = [(id)objc_opt_class() containersForIdentifier:0 groupContainerIdentifier:0 ofContentClass:14 forPersona:0 fetchTransient:1 createIfNeeded:0 error:&v38];
  id v11 = v38;

  if (!v10)
  {
    v22 = 0;
    id v9 = v11;
    if (!a3) {
      goto LABEL_27;
    }
LABEL_25:
    id v11 = v9;
    BOOL v23 = 0;
    *a3 = v11;
    goto LABEL_29;
  }
  v27 = a3;
  id v28 = a1;
  v30 = v8;
  [v5 addObjectsFromArray:v8];
  v29 = (void *)v10;
  [v5 addObjectsFromArray:v10];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (!v13) {
    goto LABEL_21;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v35;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      v17 = v11;
      if (*(void *)v35 != v15) {
        objc_enumerationMutation(v12);
      }
      v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      char v33 = 0;
      id v32 = v11;
      char v19 = objc_msgSend(v18, "isStagedUpdateContainer:withError:", &v33, &v32, v25);
      id v11 = v32;

      if (v19)
      {
        if (v33) {
          continue;
        }
      }
      else
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v25 = v18;
          id v26 = v11;
          MOLogWrite();
        }
        char v33 = 0;
      }
      objc_msgSend(v6, "addObject:", v18, v25, v26);
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v25 = v18;
        MOLogWrite();
      }
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
  }
  while (v14);
LABEL_21:

  if (![v6 count])
  {
    BOOL v23 = 1;
    BOOL v8 = v30;
    v22 = v29;
    goto LABEL_29;
  }
  v20 = (void *)[v6 copy];
  id v31 = v11;
  char v21 = [v28 removeContainers:v20 waitForDeletion:0 error:&v31];
  id v9 = v31;

  BOOL v8 = v30;
  v22 = v29;
  if (v21)
  {
    BOOL v23 = 1;
    goto LABEL_28;
  }
  a3 = v27;
  if (v27) {
    goto LABEL_25;
  }
LABEL_27:
  BOOL v23 = 0;
LABEL_28:
  id v11 = v9;
LABEL_29:

  return v23;
}

- (BOOL)hasParallelPlaceholder
{
  v3 = +[MIFileManager defaultManager];
  v4 = [(MIBundleContainer *)self parallelPlaceholderURL];
  char v5 = [v3 itemExistsAtURL:v4];

  return v5;
}

- (NSURL)parallelPlaceholderURL
{
  v2 = [(MIContainer *)self containerURL];
  v3 = [v2 URLByAppendingPathComponent:@"com.apple.mobileinstallation.placeholder" isDirectory:1];

  return (NSURL *)v3;
}

- (BOOL)writeiTunesMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v15 = 0;
  uint64_t v7 = [v6 propertyListDataWithError:&v15];
  id v8 = v15;
  id v9 = v8;
  if (v7)
  {
    id v14 = v8;
    BOOL v10 = [(MIBundleContainer *)self _writeRawiTunesMetadataData:v7 error:&v14];
    id v11 = v14;

    if (v10)
    {
      [(MIBundleContainer *)self setITunesMetadata:v6];
      BOOL v12 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    id v11 = v8;
  }
  if (a4)
  {
    id v11 = v11;
    BOOL v12 = 0;
    *a4 = v11;
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_8:

  return v12;
}

- (BOOL)_writeRawiTunesMetadataData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MIBundleContainer *)self iTunesMetadataURL];
  id v14 = 0;
  char v8 = [v6 writeToURL:v7 options:268435457 error:&v14];

  id v9 = v14;
  if ((v8 & 1) == 0)
  {
    BOOL v10 = [v7 path];
    BOOL v12 = _CreateAndLogError((uint64_t)"-[MIBundleContainer _writeRawiTunesMetadataData:error:]", 263, @"MIInstallerErrorDomain", 124, v9, &unk_1F170F5E8, @"Failed to write iTunesMetadata to %@", v11, (uint64_t)v10);

    if (a4)
    {
      id v9 = v12;
      *a4 = v9;
    }
    else
    {
      id v9 = v12;
    }
  }

  return v8;
}

- (BOOL)bestEffortRollbackiTunesMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v19 = 0;
    uint64_t v7 = +[MIStoreMetadata metadataFromPlistData:v6 error:&v19];
    id v8 = v19;
    id v9 = v8;
    if (v7)
    {
      id v18 = v8;
      BOOL v10 = [(MIBundleContainer *)self _writeRawiTunesMetadataData:v6 error:&v18];
      id v11 = v18;

      if (v10)
      {
        [(MIBundleContainer *)self setITunesMetadata:v7];

LABEL_7:
        BOOL v15 = 1;
        goto LABEL_19;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
        MOLogWrite();
      }
    }
    else
    {
      id v11 = v8;
    }
  }
  else
  {
    BOOL v12 = +[MIFileManager defaultManager];
    uint64_t v13 = [(MIBundleContainer *)self iTunesMetadataURL];
    id v17 = 0;
    char v14 = [v12 removeItemAtURL:v13 error:&v17];
    id v11 = v17;

    if (v14)
    {
      [(MIBundleContainer *)self setITunesMetadata:0];
      goto LABEL_7;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
  }
  if (a4)
  {
    id v11 = v11;
    BOOL v15 = 0;
    *a4 = v11;
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_19:

  return v15;
}

+ (BOOL)updateiTunesMetadata:(id)a3 forAppWithIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v18 = 0;
  id v9 = [a1 appBundleContainerWithIdentifier:a4 createIfNeeded:0 created:0 error:&v18];
  id v10 = v18;
  id v11 = v10;
  if (v9)
  {
    id v17 = v10;
    BOOL v12 = [v8 propertyListDataWithError:&v17];
    id v13 = v17;

    if (v12)
    {
      id v16 = v13;
      char v14 = [v9 writeiTunesMetadata:v8 error:&v16];
      id v11 = v16;

      if (!a5) {
        goto LABEL_10;
      }
    }
    else
    {
      char v14 = 0;
      id v11 = v13;
      if (!a5) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    char v14 = 0;
    if (!a5) {
      goto LABEL_10;
    }
  }
  if ((v14 & 1) == 0) {
    *a5 = v11;
  }
LABEL_10:

  return v14;
}

- (id)iTunesMetadataWithError:(id *)a3
{
  char v5 = [(MIBundleContainer *)self iTunesMetadata];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = [(MIBundleContainer *)self iTunesMetadataURL];
    id v11 = 0;
    id v6 = +[MIStoreMetadata metadataFromPlistAtURL:v7 error:&v11];
    id v8 = v11;

    if (v6)
    {
      [(MIBundleContainer *)self setITunesMetadata:v6];
      id v9 = v6;
    }
    else if (a3)
    {
      *a3 = v8;
    }
  }
  return v6;
}

- (id)_bundleExtensionForContainerClassWithError:(id *)a3
{
  uint64_t v5 = [(MIContainer *)self containerClass];
  id v6 = 0;
  uint64_t v7 = @"app";
  if (v5 != 1 && v5 != 14)
  {
    _CreateAndLogError((uint64_t)"-[MIBundleContainer _bundleExtensionForContainerClassWithError:]", 386, @"MIInstallerErrorDomain", 4, 0, 0, @"BundleContainer can't be created for container type %llu", v4, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      id v6 = v6;
      uint64_t v7 = 0;
      *a3 = v6;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (BOOL)_configureBundleWithError:(id *)a3
{
  uint64_t v5 = [(MIContainer *)self containerURL];
  id v15 = 0;
  id v6 = [(MIBundleContainer *)self _bundleExtensionForContainerClassWithError:&v15];
  id v7 = v15;
  id v8 = v7;
  if (v6)
  {
    id v14 = v7;
    id v9 = [[MIExecutableBundle alloc] initWithBundleInContainer:self withExtension:v6 error:&v14];
    id v10 = v14;

    bundle = self->_bundle;
    self->_bundle = v9;

    if (!self->_bundle && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      id v13 = [v5 path];
      MOLogWrite();
    }
  }
  else if (a3)
  {
    id v10 = v7;
    *a3 = v10;
  }
  else
  {
    id v10 = v7;
  }

  return v6 != 0;
}

- (MIBundleContainer)initWithToken:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MIBundleContainer;
  id v27 = 0;
  id v9 = [(MIContainer *)&v26 initWithToken:v8 options:a4 error:&v27];
  id v10 = v27;
  if (v9)
  {
    v25.receiver = v9;
    v25.super_class = (Class)MIBundleContainer;
    id v11 = [(MIContainer *)&v25 rawContainer];

    if (v11)
    {
      if ([v8 hasIdentifiedBundle])
      {
        id v24 = v10;
        BOOL v12 = [(MIBundleContainer *)v9 _configureBundleWithError:&v24];
        id v13 = v24;

        id v10 = v13;
        if (!v12) {
          goto LABEL_5;
        }
      }
      else
      {
        id v13 = v10;
      }
    }
    else
    {
      id v15 = [MIExecutableBundle alloc];
      id v16 = [v8 bundleURL];
      id v23 = v10;
      uint64_t v17 = [(MIBundle *)v15 initWithBundleURL:v16 error:&v23];
      id v13 = v23;

      bundle = v9->_bundle;
      v9->_bundle = (MIExecutableBundle *)v17;

      id v19 = v9->_bundle;
      if (!v19)
      {
        v20 = [v8 bundleURL];
        _CreateAndLogError((uint64_t)"-[MIBundleContainer initWithToken:options:error:]", 433, @"MIInstallerErrorDomain", 4, v13, 0, @"Failed to create app bundle from %@", v21, (uint64_t)v20);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (a5) {
          goto LABEL_6;
        }
LABEL_12:
        id v14 = 0;
        goto LABEL_13;
      }
      [(MIExecutableBundle *)v19 setBundleContainer:v9];
    }
    id v14 = v9;
    id v10 = v13;
    goto LABEL_13;
  }
LABEL_5:
  if (!a5) {
    goto LABEL_12;
  }
LABEL_6:
  id v10 = v10;
  id v14 = 0;
  *a5 = v10;
LABEL_13:

  return v14;
}

- (id)initForAppContainerWithURL:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MIBundleContainer;
  uint64_t v5 = [(MIContainer *)&v12 initWithContainerURL:v4];
  if (v5)
  {
    id v11 = 0;
    id v6 = [[MIExecutableBundle alloc] initWithBundleInContainer:v5 withExtension:@"app" error:&v11];
    id v7 = v11;
    bundle = v5->_bundle;
    v5->_bundle = v6;

    if (!v5->_bundle && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      id v10 = [v4 path];
      MOLogWrite();
    }
  }

  return v5;
}

- (MIBundleContainer)initWithContainer:(id)a3 error:(id *)a4
{
  v13.receiver = self;
  v13.super_class = (Class)MIBundleContainer;
  uint64_t v5 = -[MIContainer initWithContainer:error:](&v13, sel_initWithContainer_error_, a3);
  id v6 = v5;
  if (!v5 || [(MIContainer *)v5 status] != 1)
  {
    id v9 = 0;
    goto LABEL_7;
  }
  id v12 = 0;
  BOOL v7 = [(MIBundleContainer *)v6 _configureBundleWithError:&v12];
  id v8 = v12;
  id v9 = v8;
  if (v7)
  {
LABEL_7:
    id v10 = v6;
    goto LABEL_8;
  }
  if (a4)
  {
    id v9 = v8;
    id v10 = 0;
    *a4 = v9;
  }
  else
  {
    id v10 = 0;
  }
LABEL_8:

  return v10;
}

- (NSURL)iTunesMetadataURL
{
  v2 = [(MIContainer *)self containerURL];
  v3 = [v2 URLByAppendingPathComponent:@"iTunesMetadata.plist" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)bundleMetadataURL
{
  v2 = [(MIContainer *)self containerURL];
  v3 = [v2 URLByAppendingPathComponent:@"BundleMetadata.plist" isDirectory:0];

  return (NSURL *)v3;
}

- (id)bundleMetadataWithError:(id *)a3
{
  uint64_t v5 = [(MIBundleContainer *)self bundleMetadata];
  if (v5)
  {
    id v6 = (MIBundleMetadata *)v5;
    id v7 = 0;
LABEL_5:
    id v10 = (void *)[(MIBundleMetadata *)v6 copy];
    id v8 = v6;
    goto LABEL_6;
  }
  id v8 = [(MIBundleContainer *)self bundleMetadataURL];
  id v14 = 0;
  id v6 = +[MIBundleMetadata metadataFromURL:v8 error:&v14];
  id v9 = v14;
  id v7 = v9;
  if (v6)
  {
LABEL_4:
    [(MIBundleContainer *)self setBundleMetadata:v6];

    goto LABEL_5;
  }
  id v12 = [v9 domain];
  if ([v12 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v13 = [v7 code];

    if (v13 == 260)
    {
      id v6 = objc_alloc_init(MIBundleMetadata);
      goto LABEL_4;
    }
  }
  else
  {
  }
  if (a3)
  {
    id v7 = v7;
    id v10 = 0;
    *a3 = v7;
  }
  else
  {
    id v10 = 0;
  }
LABEL_6:

  return v10;
}

- (BOOL)saveBundleMetadata:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = [(MIBundleContainer *)self bundleMetadataURL];
  id v12 = 0;
  int v8 = [v6 serializeToURL:v7 error:&v12];
  id v9 = v12;
  id v10 = v9;
  if (v8)
  {
    [(MIBundleContainer *)self setBundleMetadata:v6];
  }
  else if (a4)
  {
    *a4 = v9;
  }

  return v8;
}

- (BOOL)captureBundleByMoving:(id)a3 withError:(id *)a4
{
  id v7 = a3;
  id v9 = [(MIContainer *)self containerURL];
  if (!v9)
  {
    _CreateAndLogError((uint64_t)"-[MIBundleContainer captureBundleByMoving:withError:]", 562, @"MIInstallerErrorDomain", 4, 0, 0, @"Failed get container URL from %@", v8, (uint64_t)self);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = 0;
    if (a4)
    {
LABEL_7:
      id v15 = v15;
      BOOL v16 = 0;
      *a4 = v15;
      goto LABEL_8;
    }
LABEL_5:
    BOOL v16 = 0;
    goto LABEL_8;
  }
  id v10 = [v7 bundleName];
  id v11 = [v9 URLByAppendingPathComponent:v10];

  id v12 = +[MIFileManager defaultManager];
  uint64_t v13 = [v7 bundleURL];
  id v21 = 0;
  char v14 = [v12 moveItemAtURL:v13 toURL:v11 error:&v21];
  id v15 = v21;

  if ((v14 & 1) == 0)
  {
    uint64_t v17 = [v7 bundleURL];
    uint64_t v19 = _CreateAndLogError((uint64_t)"-[MIBundleContainer captureBundleByMoving:withError:]", 568, @"MIInstallerErrorDomain", 20, v15, &unk_1F170F610, @"Failed to move application at %@ into container path %@", v18, (uint64_t)v17);

    id v15 = (id)v19;
    if (a4) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  objc_storeStrong((id *)&self->_bundle, a3);
  [v7 setBundleParentDirectoryURL:v9];
  [v7 setBundleContainer:self];
  BOOL v16 = 1;
LABEL_8:

  return v16;
}

- (BOOL)makeContainerLiveReplacingContainer:(id)a3 reason:(unint64_t)a4 waitForDeletion:(BOOL)a5 withError:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  char v30 = 0;
  id v29 = 0;
  BOOL v11 = [(MIContainer *)self isStagedUpdateContainer:&v30 withError:&v29];
  id v12 = v29;
  if (!v11)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v23 = self;
      id v25 = v12;
      MOLogWrite();
    }
    char v30 = 1;
  }
  v27.receiver = self;
  v27.super_class = (Class)MIBundleContainer;
  id v28 = 0;
  BOOL v13 = -[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:](&v27, sel_makeContainerLiveReplacingContainer_reason_waitForDeletion_withError_, v10, a4, v7, &v28, v23, v25);
  id v14 = v28;
  if (v13)
  {
    uint64_t v15 = [(MIContainer *)self containerURL];
    LOBYTE(v13) = v15 != 0;
    if (v15)
    {
      uint64_t v17 = (void *)v15;
      uint64_t v18 = [(MIBundleContainer *)self bundle];
      [v18 setBundleParentDirectoryURL:v17];
    }
    else
    {
      _CreateAndLogError((uint64_t)"-[MIBundleContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 602, @"MIInstallerErrorDomain", 4, 0, 0, @"Failed to get container URL from %@", v16, (uint64_t)self);
      uint64_t v17 = v14;
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if (v30)
  {
    id v26 = v12;
    BOOL v19 = [(MIContainer *)self clearStagedUpdateContainerStatusWithError:&v26];
    id v20 = v26;

    if (!v19 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      id v24 = [(MIContainer *)self identifier];
      MOLogWrite();
    }
  }
  else
  {
    id v20 = v12;
  }
  if (a6) {
    char v21 = v13;
  }
  else {
    char v21 = 1;
  }
  if ((v21 & 1) == 0) {
    *a6 = v14;
  }

  return v13;
}

- (unsigned)bundleMaxLinkedSDKVersion
{
  id v14 = 0;
  v3 = [(MIContainer *)self infoValueForKey:@"com.apple.MobileInstallation.BundleMaxLinkedSDKVersion" error:&v14];
  id v4 = v14;
  objc_opt_class();
  id v5 = v3;
  id v6 = 0;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }

  if (v6)
  {
    LODWORD(v7) = [v6 unsignedIntValue];
LABEL_5:
    id v8 = v4;
    goto LABEL_6;
  }
  id v10 = [(MIBundleContainer *)self bundle];
  uint64_t v7 = [v10 maxLinkedSDKVersion];

  if (!v7) {
    goto LABEL_5;
  }
  BOOL v11 = [NSNumber numberWithUnsignedInt:v7];
  id v13 = v4;
  BOOL v12 = [(MIContainer *)self setInfoValue:v11 forKey:@"com.apple.MobileInstallation.BundleMaxLinkedSDKVersion" error:&v13];
  id v8 = v13;

  if (!v12 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
    MOLogWrite();
  }
LABEL_6:

  return v7;
}

- (BOOL)shouldHaveCorrespondingDataContainer
{
  v2 = [(MIBundleContainer *)self bundle];
  char v3 = [v2 needsDataContainer];

  return v3;
}

- (BOOL)captureStoreDataFromDirectory:(id)a3 doCopy:(BOOL)a4 failureIsFatal:(BOOL)a5 includeiTunesMetadata:(BOOL)a6 withError:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v10 = a4;
  id v12 = a3;
  id v13 = [(MIBundleContainer *)self iTunesMetadataURL];
  uint64_t v15 = [(MIContainer *)self containerURL];
  if (v15)
  {
    uint64_t v16 = +[MIFileManager defaultManager];
    id v33 = 0;
    LODWORD(v10) = [v16 captureStoreDataFromDirectory:v12 toDirectory:v15 doCopy:v10 failureIsFatal:v9 includeiTunesMetadata:v8 withError:&v33];
    id v17 = v33;

    if (v10) {
      BOOL v18 = !v8;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18)
    {
      BOOL v19 = 0;
      id v20 = v17;
      if (!a7) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }
    id v32 = v17;
    BOOL v19 = +[MIStoreMetadata metadataFromPlistAtURL:v13 error:&v32];
    id v20 = v32;

    if (v19)
    {
      uint64_t v21 = [v19 distributorInfo];
      if (v21)
      {
        uint64_t v10 = v21;
        v22 = [v12 path];
        _CreateAndLogError((uint64_t)"-[MIBundleContainer captureStoreDataFromDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:]", 675, @"MIInstallerErrorDomain", 215, 0, 0, @"iTunesMetadata.plist captured from %@ has distributorInfo set; this is not allowed. Found distributorInfo: %@",
          v23,
        uint64_t v24 = (uint64_t)v22);

        LOBYTE(v10) = 0;
        id v20 = (id)v24;
        if (!a7) {
          goto LABEL_17;
        }
        goto LABEL_15;
      }
LABEL_21:
      [(MIBundleContainer *)self setITunesMetadata:v19];
      LOBYTE(v10) = 1;
      goto LABEL_17;
    }
    id v26 = [v20 userInfo];
    objc_super v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    id v28 = [v27 domain];
    if ([v28 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v29 = [v27 code];

      if (v29 == 260)
      {

        id v20 = 0;
        goto LABEL_21;
      }
    }
    else
    {
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v31 = [v13 path];
      MOLogWrite();
    }
  }
  else
  {
    _CreateAndLogError((uint64_t)"-[MIBundleContainer captureStoreDataFromDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:]", 652, @"MIInstallerErrorDomain", 4, 0, 0, @"Failed to get container URL", v14, v30);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v19 = 0;
  LOBYTE(v10) = 0;
  if (!a7) {
    goto LABEL_17;
  }
LABEL_15:
  if ((v10 & 1) == 0)
  {
    id v20 = v20;
    LOBYTE(v10) = 0;
    *a7 = v20;
  }
LABEL_17:

  return v10;
}

- (NSURL)stashBaseURL
{
  v2 = [(MIContainer *)self containerURL];
  char v3 = [v2 URLByAppendingPathComponent:@"com.apple.mobileinstallation.stash" isDirectory:1];

  return (NSURL *)v3;
}

- (id)_stashURLForIndex:(unint64_t)a3
{
  id v4 = [(MIBundleContainer *)self stashBaseURL];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
  id v6 = [v4 URLByAppendingPathComponent:v5 isDirectory:1];

  return v6;
}

- (id)_stashedBundleContainerForIndex:(unint64_t)a3 error:(id *)a4
{
  id v6 = -[MIBundleContainer _stashURLForIndex:](self, "_stashURLForIndex:");
  uint64_t v7 = +[MIFileManager defaultManager];
  id v21 = 0;
  char v8 = [v7 itemExistsAtURL:v6 error:&v21];
  id v9 = v21;

  if (v8)
  {
    id v10 = [(MIBundleContainer *)[MIStashedBundleContainer alloc] initForAppContainerWithURL:v6];
    if (v10)
    {
      BOOL v11 = v10;
      id v12 = v9;
      goto LABEL_9;
    }
    BOOL v18 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v18);
    uint64_t v15 = [v6 path];
    uint64_t v17 = _CreateAndLogError((uint64_t)"-[MIBundleContainer _stashedBundleContainerForIndex:error:]", 725, @"MIInstallerErrorDomain", 4, 0, 0, @"Failed to create %@ instance for %@", v19, (uint64_t)v14);
  }
  else
  {
    id v13 = (void *)*MEMORY[0x1E4F281F8];
    uint64_t v14 = [(MIContainer *)self containerURL];
    uint64_t v15 = [v6 path];
    uint64_t v17 = _CreateError((uint64_t)"-[MIBundleContainer _stashedBundleContainerForIndex:error:]", 719, v13, 260, v9, 0, @"No stash was found in bundle container %@ with index %lu (at %@)", v16, (uint64_t)v14);
  }
  id v12 = (id)v17;

  if (a4)
  {
    id v12 = v12;
    BOOL v11 = 0;
    *a4 = v12;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_9:

  return v11;
}

- (id)stashedBundleContainerWithError:(id *)a3
{
  return [(MIBundleContainer *)self _stashedBundleContainerForIndex:0 error:a3];
}

- (BOOL)cloneContentFromStashedBundleContainer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__8;
  id v31 = __Block_byref_object_dispose__8;
  id v32 = 0;
  uint64_t v7 = +[MIFileManager defaultManager];
  id v9 = [(MIContainer *)self containerURL];
  if (!v9)
  {
    uint64_t v16 = _CreateAndLogError((uint64_t)"-[MIBundleContainer cloneContentFromStashedBundleContainer:error:]", 772, @"MIInstallerErrorDomain", 4, 0, 0, @"Failed get container URL for %@ when trying to clone content from %@", v8, (uint64_t)self);
    id v10 = 0;
    id v13 = 0;
LABEL_7:
    uint64_t v17 = (void *)v28[5];
    v28[5] = v16;
    goto LABEL_9;
  }
  id v10 = [v6 bundle];
  if (!v10)
  {
    uint64_t v17 = [v6 containerURL];
    uint64_t v19 = _CreateAndLogError((uint64_t)"-[MIBundleContainer cloneContentFromStashedBundleContainer:error:]", 778, @"MIInstallerErrorDomain", 4, 0, 0, @"Could not locate bundle in stashed bundle container at %@", v18, (uint64_t)v17);
    id v20 = (void *)v28[5];
    v28[5] = v19;

    id v10 = 0;
    id v13 = 0;
LABEL_9:

    if (a4) {
      goto LABEL_5;
    }
LABEL_10:
    BOOL v15 = 0;
    goto LABEL_11;
  }
  BOOL v11 = [v6 containerURL];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__MIBundleContainer_cloneContentFromStashedBundleContainer_error___block_invoke;
  v23[3] = &unk_1E62E7438;
  id v12 = v9;
  id v24 = v12;
  id v25 = v7;
  id v26 = &v27;
  id v13 = [v25 enumerateURLsForItemsInDirectoryAtURL:v11 ignoreSymlinks:1 withBlock:v23];

  if (!v28[5])
  {
    if (!v13)
    {
      objc_storeStrong((id *)&self->_bundle, v10);
      [v10 setBundleParentDirectoryURL:v12];
      [v10 setBundleContainer:self];
      id v13 = 0;
      BOOL v15 = 1;
      goto LABEL_11;
    }
    uint64_t v16 = _CreateAndLogError((uint64_t)"-[MIBundleContainer cloneContentFromStashedBundleContainer:error:]", 807, @"MIInstallerErrorDomain", 4, v13, 0, @"Failed to enumerate stashed container", v14, v22);
    goto LABEL_7;
  }
  if (!a4) {
    goto LABEL_10;
  }
LABEL_5:
  BOOL v15 = 0;
  *a4 = (id) v28[5];
LABEL_11:

  _Block_object_dispose(&v27, 8);
  return v15;
}

uint64_t __66__MIBundleContainer_cloneContentFromStashedBundleContainer_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = [v5 lastPathComponent];
  if (_ItemIsIgnoredContainerContentForStash(v6))
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) URLByAppendingPathComponent:v6 isDirectory:a3 == 4];
    id v9 = *(void **)(a1 + 40);
    id v18 = 0;
    uint64_t v7 = [v9 copyItemAtURL:v5 toURL:v8 alwaysClone:0 error:&v18];
    id v10 = v18;
    if ((v7 & 1) == 0)
    {
      BOOL v11 = [v5 path];
      uint64_t v17 = [v8 path];
      uint64_t v13 = _CreateAndLogError((uint64_t)"-[MIBundleContainer cloneContentFromStashedBundleContainer:error:]_block_invoke", 794, @"MIInstallerErrorDomain", 4, v10, 0, @"Failed to clone stashed item %@ to %@", v12, (uint64_t)v11);
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      BOOL v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }

  return v7;
}

- (BOOL)transferExistingStashesFromContainer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = +[MIFileManager defaultManager];
  uint64_t v8 = [v6 stashBaseURL];

  id v9 = [(MIBundleContainer *)self stashBaseURL];
  if ([v7 itemDoesNotExistAtURL:v8])
  {
    id v10 = 0;
LABEL_7:
    BOOL v13 = 1;
    goto LABEL_8;
  }
  id v21 = 0;
  int v11 = [v7 copyItemAtURL:v8 toURL:v9 alwaysClone:0 error:&v21];
  id v10 = v21;
  if (v11)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      uint64_t v12 = [(MIBundleContainer *)self bundle];
      uint64_t v19 = [v12 identifier];
      MOLogWrite();
    }
    goto LABEL_7;
  }
  BOOL v15 = [(MIBundleContainer *)self bundle];
  uint64_t v16 = [v15 identifier];
  id v20 = [v8 path];
  id v18 = _CreateAndLogError((uint64_t)"-[MIBundleContainer transferExistingStashesFromContainer:error:]", 840, @"MIInstallerErrorDomain", 4, v10, 0, @"Failed to preserve existing stashed version of app %@ at %@", v17, (uint64_t)v16);

  if (a4)
  {
    id v10 = v18;
    BOOL v13 = 0;
    *a4 = v10;
  }
  else
  {
    BOOL v13 = 0;
    id v10 = v18;
  }
LABEL_8:

  return v13;
}

- (BOOL)stashBundleContainerContents:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__8;
  v54 = __Block_byref_object_dispose__8;
  id v55 = 0;
  uint64_t v7 = +[MIFileManager defaultManager];
  uint64_t v8 = [(MIBundleContainer *)self stashBaseURL];
  id v9 = [(MIBundleContainer *)self _stashURLForIndex:0];
  id v10 = (id *)(v51 + 5);
  id obj = (id)v51[5];
  char v11 = [v7 createDirectoryAtURL:v8 withIntermediateDirectories:0 mode:493 class:4 error:&obj];
  objc_storeStrong(v10, obj);
  if ((v11 & 1) == 0)
  {
    uint64_t v22 = (void *)v51[5];
    uint64_t v23 = [v8 path];
    uint64_t v25 = _CreateAndLogError((uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]", 870, @"MIInstallerErrorDomain", 4, v22, 0, @"Failed to create stash base directory at %@", v24, (uint64_t)v23);
LABEL_8:
    id v28 = (void *)v51[5];
    v51[5] = v25;

    uint64_t v16 = 0;
    id v18 = 0;
    uint64_t v19 = 0;
    id v20 = 0;
    goto LABEL_9;
  }
  uint64_t v12 = (id *)(v51 + 5);
  id v48 = (id)v51[5];
  char v13 = [v7 createDirectoryAtURL:v9 withIntermediateDirectories:0 mode:493 class:4 error:&v48];
  objc_storeStrong(v12, v48);
  if ((v13 & 1) == 0)
  {
    id v26 = (void *)v51[5];
    uint64_t v23 = [v8 path];
    uint64_t v25 = _CreateAndLogError((uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]", 876, @"MIInstallerErrorDomain", 4, v26, 0, @"Failed to create stash base directory at %@", v27, (uint64_t)v23);
    goto LABEL_8;
  }
  uint64_t v14 = [v6 containerURL];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __56__MIBundleContainer_stashBundleContainerContents_error___block_invoke;
  v44[3] = &unk_1E62E7438;
  id v15 = v9;
  id v45 = v15;
  id v46 = v7;
  v47 = &v50;
  uint64_t v16 = [v46 enumerateURLsForItemsInDirectoryAtURL:v14 ignoreSymlinks:1 withBlock:v44];

  if (v51[5])
  {
    id v18 = 0;
    uint64_t v19 = 0;
    id v20 = 0;
    if (!a4)
    {
LABEL_5:
      BOOL v21 = 0;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v21 = 0;
    *a4 = (id) v51[5];
    goto LABEL_11;
  }
  if (v16)
  {
    uint64_t v30 = _CreateAndLogError((uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]", 906, @"MIInstallerErrorDomain", 4, v16, 0, @"Failed to enumerate stashed container", v17, v39);
    id v18 = 0;
    uint64_t v19 = 0;
    id v20 = 0;
LABEL_14:
    uint64_t v23 = (void *)v51[5];
    v51[5] = v30;
LABEL_9:

    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
  id v20 = [(MIBundleContainer *)[MIStashedBundleContainer alloc] initForAppContainerWithURL:v15];
  if (!v20)
  {
    uint64_t v23 = [v15 path];
    uint64_t v25 = _CreateAndLogError((uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]", 913, @"MIInstallerErrorDomain", 4, 0, 0, @"Failed to create MIStashedBundleContainer instance for %@", v38, (uint64_t)v23);
    goto LABEL_8;
  }
  id v31 = (id *)(v51 + 5);
  id v43 = (id)v51[5];
  uint64_t v19 = [v6 bundleMetadataWithError:&v43];
  objc_storeStrong(v31, v43);
  if (!v19)
  {
    uint64_t v30 = _CreateAndLogError((uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]", 920, @"MIInstallerErrorDomain", 4, (void *)v51[5], 0, @"Failed to read bundle metadata from %@", v32, (uint64_t)v6);
    uint64_t v16 = 0;
    id v18 = 0;
    uint64_t v19 = 0;
    goto LABEL_14;
  }
  id v18 = (void *)[v20 newStashMetadata];
  id v33 = [MEMORY[0x1E4F1C9C8] date];
  [v18 setDateStashed:v33];

  long long v34 = [v19 installDate];
  [v18 setDateOriginallyInstalled:v34];

  long long v35 = (id *)(v51 + 5);
  id v42 = (id)v51[5];
  char v41 = [v20 saveStashMetadata:v18 withError:&v42];
  objc_storeStrong(v35, v42);
  if ((v41 & 1) == 0)
  {
    uint64_t v30 = _CreateAndLogError((uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]", 929, @"MIInstallerErrorDomain", 4, (void *)v51[5], 0, @"Failed to save stash metadata", v36, v39);
    uint64_t v16 = 0;
    goto LABEL_14;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    long long v37 = [(MIBundleContainer *)self bundle];
    v40 = [v37 identifier];
    MOLogWrite();
  }
  uint64_t v16 = 0;
  BOOL v21 = 1;
LABEL_11:

  _Block_object_dispose(&v50, 8);
  return v21;
}

uint64_t __56__MIBundleContainer_stashBundleContainerContents_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = [v5 lastPathComponent];
  if (_ItemIsIgnoredContainerContentForStash(v6))
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) URLByAppendingPathComponent:v6 isDirectory:a3 == 4];
    id v9 = *(void **)(a1 + 40);
    id v18 = 0;
    uint64_t v7 = [v9 copyItemAtURL:v5 toURL:v8 alwaysClone:0 error:&v18];
    id v10 = v18;
    if ((v7 & 1) == 0)
    {
      char v11 = [v5 path];
      uint64_t v17 = [v8 path];
      uint64_t v13 = _CreateAndLogError((uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]_block_invoke", 893, @"MIInstallerErrorDomain", 4, v10, 0, @"Failed to clone existing container item at path %@ to stash path %@", v12, (uint64_t)v11);
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }

  return v7;
}

- (NSURL)compatibilityLinkDestination
{
  char v3 = [(MIBundleContainer *)self bundle];
  if ([v3 isPlaceholder])
  {
LABEL_10:
    id v6 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = [(MIBundleContainer *)self bundleMaxLinkedSDKVersion];
  if (!v4)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v5 = [v3 bundleURL];
      id v9 = [v5 path];
      MOLogWrite();
    }
    goto LABEL_10;
  }
  if (v4 >= 0x80000)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
      MOLogWrite();
    }
    goto LABEL_10;
  }
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    uint64_t v8 = v4;
    MOLogWrite();
  }
  id v6 = objc_msgSend(v3, "bundleURL", v8);
LABEL_11:

  return (NSURL *)v6;
}

- (NSURL)referenceStorageURL
{
  v2 = [(MIContainer *)self containerURL];
  char v3 = [v2 URLByAppendingPathComponent:@"References" isDirectory:1];

  return (NSURL *)v3;
}

- (MIExecutableBundle)bundle
{
  return self->_bundle;
}

- (MIBundleMetadata)bundleMetadata
{
  return self->_bundleMetadata;
}

- (void)setBundleMetadata:(id)a3
{
}

- (MIStoreMetadata)iTunesMetadata
{
  return self->_iTunesMetadata;
}

- (void)setITunesMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesMetadata, 0);
  objc_storeStrong((id *)&self->_bundleMetadata, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end