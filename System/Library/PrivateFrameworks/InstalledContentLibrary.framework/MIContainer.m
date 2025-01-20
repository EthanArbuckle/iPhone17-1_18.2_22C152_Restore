@interface MIContainer
+ (BOOL)removeContainers:(id)a3 waitForDeletion:(BOOL)a4 error:(id *)a5;
+ (id)_allContainersForIdentifier:(id)a3 persona:(id)a4 options:(unint64_t)a5 error:(id *)a6;
+ (id)_bundleContainerForIdentifier:(id)a3 forPersona:(id)a4 error:(id *)a5;
+ (id)allContainersForAllPersonasForIdentifier:(id)a3 options:(unint64_t)a4 error:(id *)a5;
+ (id)containerWithIdentifier:(id)a3 forPersona:(id)a4 ofContentClass:(unint64_t)a5 createIfNeeded:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8;
+ (id)containersForIdentifier:(id)a3 groupContainerIdentifier:(id)a4 ofContentClass:(unint64_t)a5 forPersona:(id)a6 fetchTransient:(BOOL)a7 createIfNeeded:(BOOL)a8 error:(id *)a9;
+ (id)containersWithClass:(unint64_t)a3 error:(id *)a4;
+ (id)containersWithClass:(unint64_t)a3 personaUniqueString:(id)a4 error:(id *)a5;
+ (id)groupContainerURLsForBundleIdentifier:(id)a3 forPersona:(id)a4 error:(id *)a5;
+ (id)tempContainerWithIdentifier:(id)a3 forPersona:(id)a4 ofContentClass:(unint64_t)a5 error:(id *)a6;
- (BOOL)_deriveContainerStatusWithError:(id *)a3;
- (BOOL)_doInitWithContainer:(id)a3 error:(id *)a4;
- (BOOL)_replaceExistingContainer:(id)a3 replacementReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 error:(id *)a6;
- (BOOL)_setContainer:(id)a3 error:(id *)a4;
- (BOOL)clearStagedUpdateContainerStatusWithError:(id *)a3;
- (BOOL)isNew;
- (BOOL)isStagedUpdateContainer:(BOOL *)a3 withError:(id *)a4;
- (BOOL)isTransient;
- (BOOL)makeContainerLiveReplacingContainer:(id)a3 reason:(unint64_t)a4 waitForDeletion:(BOOL)a5 withError:(id *)a6;
- (BOOL)makeContainerLiveWithError:(id *)a3;
- (BOOL)markContainerAsStagedUpdateContainer:(id *)a3;
- (BOOL)purgeContentWithError:(id *)a3;
- (BOOL)recreateDefaultStructureWithError:(id *)a3;
- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3;
- (BOOL)removeUnderlyingContainerWaitingForDeletion:(BOOL)a3 error:(id *)a4;
- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (MIContainer)initWithContainer:(id)a3 error:(id *)a4;
- (MIContainer)initWithContainerURL:(id)a3;
- (MIContainer)initWithToken:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (MIMCMContainer)rawContainer;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (NSURL)containerURL;
- (id)description;
- (id)infoValueForKey:(id)a3 error:(id *)a4;
- (unint64_t)containerClass;
- (unint64_t)diskUsage;
- (unint64_t)status;
- (void)dealloc;
- (void)setContainerClass:(unint64_t)a3;
- (void)setContainerURL:(id)a3;
- (void)setDiskUsage:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsTransient:(BOOL)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation MIContainer

- (MIContainer)initWithContainerURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MIContainer;
  v6 = [(MIContainer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_containerURL, a3);
  }

  return v7;
}

- (BOOL)_deriveContainerStatusWithError:(id *)a3
{
  if ([(MIContainer *)self isTransient])
  {
    id v5 = 0;
    self->_status = 2;
LABEL_10:
    BOOL v11 = 1;
    goto LABEL_11;
  }
  id v13 = 0;
  v6 = [(MIContainer *)self infoValueForKey:@"com.apple.MobileContainerManager.SafeHarborInfo" error:&v13];
  id v7 = v13;
  id v5 = v7;
  if (v6)
  {
    unint64_t v8 = 3;
LABEL_9:
    self->_status = v8;

    goto LABEL_10;
  }
  if (!v7)
  {
LABEL_8:

    id v5 = 0;
    unint64_t v8 = 1;
    goto LABEL_9;
  }
  objc_super v9 = [v7 domain];
  if ([v9 isEqualToString:@"MIContainerManagerErrorDomain"])
  {
    uint64_t v10 = [v5 code];

    if (v10 == 24) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
  if (a3)
  {
    id v5 = v5;
    BOOL v11 = 0;
    *a3 = v5;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_11:

  return v11;
}

- (BOOL)_doInitWithContainer:(id)a3 error:(id *)a4
{
  objc_storeStrong((id *)&self->_rawContainer, a3);
  id v7 = a3;
  id v12 = 0;
  BOOL v8 = [(MIContainer *)self _deriveContainerStatusWithError:&v12];
  id v9 = v12;
  uint64_t v10 = v9;
  if (a4 && !v8) {
    *a4 = v9;
  }

  return v8;
}

- (MIContainer)initWithContainer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MIContainer;
  id v7 = [(MIContainer *)&v15 init];
  BOOL v8 = v7;
  if (!v7)
  {
    id v11 = 0;
    goto LABEL_6;
  }
  id v14 = 0;
  BOOL v9 = [(MIContainer *)v7 _doInitWithContainer:v6 error:&v14];
  id v10 = v14;
  id v11 = v10;
  if (v9)
  {
LABEL_6:
    id v12 = v8;
    goto LABEL_7;
  }
  if (a4)
  {
    id v11 = v10;
    id v12 = 0;
    *a4 = v11;
  }
  else
  {
    id v12 = 0;
  }
LABEL_7:

  return v12;
}

- (MIContainer)initWithToken:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  int v6 = a4;
  id v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MIContainer;
  BOOL v9 = [(MIContainer *)&v28 init];
  if (!v9)
  {
    id v11 = 0;
    goto LABEL_6;
  }
  id v10 = [v8 containerURL];
  if (!v10)
  {
    id v14 = [MIMCMContainer alloc];
    objc_super v15 = [v8 serializedContainerRepresentation];
    id v27 = 0;
    v16 = [(MIMCMContainer *)v14 initWithSerializedContainer:v15 matchingWithOptions:~(v6 << 16) & 0x30000 error:&v27];
    id v17 = v27;

    if (v16)
    {
      v25 = a5;
      v19 = [(MIMCMContainer *)v16 personaUniqueString];
      v20 = [v8 personaUniqueString];
      v21 = [(MIMCMContainer *)v16 identifier];
      v22 = [v8 identifier];
      if (![v22 isEqualToString:v21]
        || v20 && v19 && ([v20 isEqualToString:v19] & 1) == 0)
      {
        _CreateAndLogError((uint64_t)"-[MIContainer initWithToken:options:error:]", 170, @"MIInstallerErrorDomain", 186, v17, 0, @"Deserialized container object had identity %@/%@ but the token was for %@/%@", v23, (uint64_t)v21);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v24 = 0;
      }
      else
      {
        id v26 = v17;
        BOOL v24 = [(MIContainer *)v9 _doInitWithContainer:v16 error:&v26];
        id v11 = v26;
      }

      a5 = v25;
      if (v24) {
        goto LABEL_4;
      }
      if (v25)
      {
LABEL_17:
        id v11 = v11;
        id v12 = 0;
        *a5 = v11;
        goto LABEL_7;
      }
    }
    else
    {
      _CreateAndLogError((uint64_t)"-[MIContainer initWithToken:options:error:]", 160, @"MIInstallerErrorDomain", 186, v17, 0, @"Failed to serialize container data %@", v18, (uint64_t)v8);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      if (a5) {
        goto LABEL_17;
      }
    }
    id v12 = 0;
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v9->_containerURL, v10);
  id v11 = 0;
LABEL_4:

LABEL_6:
  id v12 = v9;
LABEL_7:

  return v12;
}

- (void)dealloc
{
  v3 = +[MITestManager sharedInstance];
  char v4 = [v3 testFlagsAreSet:64];

  unint64_t v5 = [(MIContainer *)self containerClass];
  char v17 = 0;
  id v16 = 0;
  BOOL v6 = [(MIContainer *)self isStagedUpdateContainer:&v17 withError:&v16];
  id v7 = v16;
  if (!v6)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v10 = self;
      id v13 = v7;
      MOLogWrite();
    }
    char v17 = 0;

    id v7 = 0;
  }
  if ([(MIContainer *)self isTransient] && !v17 && (v5 == 14 || v5 == 1) && (v4 & 1) == 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v11 = self;
      MOLogWrite();
    }
    id v15 = v7;
    BOOL v9 = -[MIContainer removeUnderlyingContainerWaitingForDeletion:error:](self, "removeUnderlyingContainerWaitingForDeletion:error:", 0, &v15, v11);
    id v8 = v15;

    if (!v9 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      id v12 = [(MIContainer *)self identifier];
      MOLogWrite();
    }
  }
  else
  {
    id v8 = v7;
  }

  v14.receiver = self;
  v14.super_class = (Class)MIContainer;
  [(MIContainer *)&v14 dealloc];
}

- (NSString)identifier
{
  v2 = [(MIContainer *)self rawContainer];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSString)personaUniqueString
{
  v2 = [(MIContainer *)self rawContainer];
  v3 = [v2 personaUniqueString];

  return (NSString *)v3;
}

- (unint64_t)containerClass
{
  v2 = [(MIContainer *)self rawContainer];
  unint64_t v3 = [v2 containerClass];

  return v3;
}

- (BOOL)isTransient
{
  v2 = [(MIContainer *)self rawContainer];
  char v3 = [v2 isTransient];

  return v3;
}

- (BOOL)isNew
{
  v2 = [(MIContainer *)self rawContainer];
  char v3 = [v2 isNew];

  return v3;
}

- (void)setContainerURL:(id)a3
{
}

- (NSURL)containerURL
{
  containerURL = self->_containerURL;
  if (containerURL)
  {
    char v3 = containerURL;
  }
  else
  {
    char v4 = [(MIContainer *)self rawContainer];
    char v3 = [v4 containerURL];
  }
  return v3;
}

- (BOOL)_setContainer:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = [(MIContainer *)self rawContainer];
  char v9 = [v8 isEqual:v7];

  if ((v9 & 1) == 0)
  {
    if (!v7)
    {
      [(MIContainer *)self setContainerURL:0];
      goto LABEL_8;
    }
    uint64_t v11 = [v7 containerClass];
    if (v11 == [(MIContainer *)self containerClass])
    {
      id v12 = [v7 identifier];
      id v13 = [(MIContainer *)self identifier];
      char v14 = [v12 isEqualToString:v13];

      if (v14)
      {

        objc_storeStrong((id *)&self->_rawContainer, a3);
LABEL_8:
        id v16 = 0;
        BOOL v10 = 1;
LABEL_13:

        goto LABEL_14;
      }
      _CreateAndLogError((uint64_t)"-[MIContainer _setContainer:error:]", 279, @"MIInstallerErrorDomain", 4, 0, 0, @"Attempted to set container with mismatched identifier %@ on %@", v15, (uint64_t)v12);
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      if (!a4)
      {
LABEL_12:
        BOOL v10 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      [(MIContainer *)self containerClass];
      _CreateAndLogError((uint64_t)"-[MIContainer _setContainer:error:]", 273, @"MIInstallerErrorDomain", 4, 0, 0, @"Attempted to set container %@ with content class %llu on %@ which represents a container with class %llu", v17, (uint64_t)v7);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4) {
        goto LABEL_12;
      }
    }
    id v16 = v16;
    BOOL v10 = 0;
    *a4 = v16;
    goto LABEL_13;
  }
  BOOL v10 = 1;
LABEL_14:

  return v10;
}

- (BOOL)removeUnderlyingContainerWaitingForDeletion:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = [(MIContainer *)self rawContainer];
  v16[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v15 = 0;
  BOOL v9 = +[MIMCMContainer deleteContainers:v8 waitForDeletion:v5 error:&v15];
  id v10 = v15;

  if (!v9)
  {
    uint64_t v11 = [(MIContainer *)self rawContainer];
    id v13 = _CreateAndLogError((uint64_t)"-[MIContainer removeUnderlyingContainerWaitingForDeletion:error:]", 306, @"MIInstallerErrorDomain", 4, v10, 0, @"Failed to delete container_object_t for %@", v12, (uint64_t)v11);

    if (a4)
    {
      id v10 = v13;
      *a4 = v10;
    }
    else
    {
      id v10 = v13;
    }
  }

  return v9;
}

- (BOOL)_replaceExistingContainer:(id)a3 replacementReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v28[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = [(MIContainer *)self identifier];
  unint64_t v12 = [(MIContainer *)self containerClass];
  id v13 = [(MIContainer *)self rawContainer];
  char v14 = [v10 rawContainer];

  id v26 = 0;
  int v15 = [v13 replaceExistingContainer:v14 error:&v26];
  id v16 = v26;

  if (v15)
  {
    if (v7)
    {
      uint64_t v17 = [(MIContainer *)self rawContainer];
      id v25 = 0;
      int v18 = [v17 reclaimDiskSpaceWithError:&v25];
      id v19 = v25;
      uint64_t v20 = v18 ^ 1u;

      if ((v18 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
        MOLogWrite();
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
    if (a4 == 1 && v12 == 1)
    {
      v27[0] = *MEMORY[0x1E4F1CFF8];
      v27[1] = @"MobileInstallationDemotionCompleteErrorOccurred";
      v28[0] = v11;
      v21 = [NSNumber numberWithBool:v20];
      v28[1] = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

      uint64_t v23 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v23 postNotificationName:@"MobileInstallationDemotionCompleteNotification" object:0 userInfo:v22 options:3];

      if (gLogHandle && *(int *)(gLogHandle + 44) >= 7) {
        MOLogWrite();
      }
    }
  }
  else if (a6)
  {
    *a6 = v16;
  }

  return v15;
}

+ (id)containersForIdentifier:(id)a3 groupContainerIdentifier:(id)a4 ofContentClass:(unint64_t)a5 forPersona:(id)a6 fetchTransient:(BOOL)a7 createIfNeeded:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = (uint64_t)a3;
  unint64_t v15 = (unint64_t)a4;
  id v16 = a6;
  v47 = objc_opt_new();
  BOOL v45 = (v14 | v15) != 0;
  if (v14 | v15)
  {
    if (v14)
    {
      uint64_t v54 = 0;
      int v18 = (id *)&v54;
      uint64_t v19 = +[MIMCMContainer containersForBundleIdentifier:v14 contentClass:a5 forPersona:v16 create:v9 fetchTransient:v10 error:&v54];
    }
    else
    {
      if (!v15)
      {
        v22 = 0;
        goto LABEL_31;
      }
      uint64_t v53 = 0;
      int v18 = (id *)&v53;
      uint64_t v19 = +[MIMCMContainer containersForGroupIdentifier:v15 forPersona:v16 create:v9 fetchTransient:v10 error:&v53];
    }
  }
  else
  {
    uint64_t v55 = 0;
    int v18 = (id *)&v55;
    uint64_t v19 = +[MIMCMContainer containersForContentClass:a5 forPersona:v16 fetchTransient:v10 error:&v55];
  }
  uint64_t v20 = (void *)v19;
  id v21 = *v18;
  v22 = v21;
  if (!v20)
  {
LABEL_31:
    id v25 = _CreateAndLogError((uint64_t)"+[MIContainer containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:]", 378, @"MIInstallerErrorDomain", 4, v22, 0, @"Failed to retrieve any containers for identifier: %@ groupIdentifier: %@ container type: %llu persona: %@", v17, v14);

    id obj = 0;
    v35 = 0;
    goto LABEL_32;
  }
  id v42 = v16;
  unint64_t v43 = v15;
  uint64_t v44 = v14;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v20;
  uint64_t v23 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    id v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = *(void *)v50;
    while (2)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v50 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        id v30 = objc_alloc((Class)objc_opt_class());
        id v48 = 0;
        v31 = (void *)[v30 initWithContainer:v29 error:&v48];
        id v32 = v48;
        v33 = v32;
        if (v31)
        {
          [v47 addObject:v31];
        }
        else
        {
          id v34 = v32;

          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            uint64_t v40 = v29;
            id v41 = v34;
            MOLogWrite();
          }
          if (v45)
          {

            v35 = 0;
            id v25 = v34;
            goto LABEL_29;
          }
          ++v26;
          id v25 = v34;
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v25 = 0;
    uint64_t v26 = 0;
  }

  if ([obj count] || !v25)
  {
    v35 = objc_msgSend(v47, "copy", v40, v41);
  }
  else
  {
    _CreateAndLogError((uint64_t)"+[MIContainer containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:]", 400, @"MIInstallerErrorDomain", 4, v25, 0, @"Failed to construct MIContainer object for all %llu containers; last error is underlying error",
      v36,
    uint64_t v37 = v26);

    v35 = 0;
    id v25 = (void *)v37;
  }
LABEL_29:
  unint64_t v15 = v43;
  uint64_t v14 = v44;
  id v16 = v42;
LABEL_32:
  if (a9 && !v35) {
    *a9 = v25;
  }
  id v38 = v35;

  return v38;
}

+ (id)groupContainerURLsForBundleIdentifier:(id)a3 forPersona:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v32 = 0;
  id v8 = +[MIMCMContainer containersForBundleIdentifier:v7 contentClass:7 forPersona:a4 create:1 fetchTransient:0 error:&v32];
  id v9 = v32;
  uint64_t v11 = v9;
  if (!v8)
  {
    v22 = _CreateAndLogError((uint64_t)"+[MIContainer groupContainerURLsForBundleIdentifier:forPersona:error:]", 423, @"MIInstallerErrorDomain", 4, v9, 0, @"Failed to retrieve any shared data containers for %@", v10, (uint64_t)v7);

    id v21 = 0;
    unint64_t v12 = 0;
    if (!a5) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  id v25 = v9;
  id v27 = v7;
  unint64_t v12 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v26 = v8;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        int v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend(v18, "identifier", v24);
        uint64_t v20 = [v18 containerURL];
        if (v20)
        {
          [v12 setObject:v20 forKeyedSubscript:v19];
        }
        else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          uint64_t v24 = v19;
          MOLogWrite();
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v15);
  }

  id v21 = (void *)[v12 copy];
  id v7 = v27;
  v22 = v25;
  id v8 = v26;
  if (a5)
  {
LABEL_17:
    if (!v21) {
      *a5 = v22;
    }
  }
LABEL_19:

  return v21;
}

+ (id)tempContainerWithIdentifier:(id)a3 forPersona:(id)a4 ofContentClass:(unint64_t)a5 error:(id *)a6
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v28 = 0;
  uint64_t v11 = +[MIMCMContainer transientContainerForIdentifier:v9 contentClass:a5 forPersona:v10 create:1 error:&v28];
  id v12 = v28;
  if (!v11) {
    goto LABEL_14;
  }
  if ([v11 isNew]) {
    goto LABEL_3;
  }
  uint64_t v24 = a6;
  v29[0] = v11;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  id v27 = v12;
  BOOL v17 = +[MIMCMContainer deleteContainers:v16 waitForDeletion:0 error:&v27];
  id v14 = v27;

  if (v17)
  {
    id v26 = v14;
    uint64_t v19 = +[MIMCMContainer transientContainerForIdentifier:v9 contentClass:a5 forPersona:v10 create:1 error:&v26];
    id v12 = v26;

    a6 = v24;
    if (v19)
    {
      if ([v19 isNew])
      {
        uint64_t v11 = v19;
LABEL_3:
        id v25 = v12;
        id v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContainer:v11 error:&v25];
        id v14 = v25;

        if (v13)
        {
          id v12 = v14;
          goto LABEL_17;
        }
        uint64_t v22 = _CreateAndLogError((uint64_t)"+[MIContainer tempContainerWithIdentifier:forPersona:ofContentClass:error:]", 479, @"MIInstallerErrorDomain", 4, v14, 0, @"Failed to create MIContainer instance for %@", v15, (uint64_t)v11);
        goto LABEL_13;
      }
      uint64_t v22 = _CreateAndLogError((uint64_t)"+[MIContainer tempContainerWithIdentifier:forPersona:ofContentClass:error:]", 472, @"MIInstallerErrorDomain", 4, 0, 0, @"Unexpectedly received existing container %@ when request was to create a new container for %@", v21, (uint64_t)v19);
      id v14 = v12;
      uint64_t v11 = v19;
    }
    else
    {
      uint64_t v22 = _CreateAndLogError((uint64_t)"+[MIContainer tempContainerWithIdentifier:forPersona:ofContentClass:error:]", 468, @"MIInstallerErrorDomain", 4, v12, 0, @"Failed to create container for %@", v20, (uint64_t)v9);
      uint64_t v11 = 0;
      id v14 = v12;
    }
  }
  else
  {
    uint64_t v22 = _CreateAndLogError((uint64_t)"+[MIContainer tempContainerWithIdentifier:forPersona:ofContentClass:error:]", 462, @"MIInstallerErrorDomain", 4, v14, 0, @"Failed to delete existing transient container for %@", v18, (uint64_t)v9);
    a6 = v24;
  }
LABEL_13:

  id v12 = (id)v22;
LABEL_14:
  if (a6)
  {
    id v12 = v12;
    id v13 = 0;
    *a6 = v12;
  }
  else
  {
    id v13 = 0;
  }
LABEL_17:

  return v13;
}

+ (id)containerWithIdentifier:(id)a3 forPersona:(id)a4 ofContentClass:(unint64_t)a5 createIfNeeded:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8
{
  BOOL v9 = a6;
  v35[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v34 = 0;
  id v14 = +[MIMCMContainer containerForIdentifier:v12 contentClass:a5 forPersona:v13 create:v9 error:&v34];
  id v15 = v34;
  id v17 = v15;
  if (!v14)
  {
    if (!v9)
    {
      uint64_t v21 = [v15 domain];
      if ([v21 isEqualToString:@"MIContainerManagerErrorDomain"])
      {
        uint64_t v22 = [v17 code];

        if (v22 == 21)
        {
          LOBYTE(v18) = 0;
          uint64_t v19 = 0;
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
    uint64_t v25 = _CreateAndLogError((uint64_t)"+[MIContainer containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:]", 504, @"MIInstallerErrorDomain", 4, v17, 0, @"Failed to find container of class %llu with identity %@/%@", v16, a5);
    goto LABEL_27;
  }
  int v18 = [v14 isNew];
  id v33 = v17;
  uint64_t v19 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContainer:v14 error:&v33];
  id v20 = v33;

  if (v19)
  {
    id v17 = v20;
    goto LABEL_17;
  }
  uint64_t v23 = objc_opt_class();
  uint64_t v25 = _CreateAndLogError((uint64_t)"+[MIContainer containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:]", 512, @"MIInstallerErrorDomain", 4, v20, 0, @"Failed to create %@ instance for %@", v24, v23);

  if (v18)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      long long v30 = v14;
      MOLogWrite();
    }
    v35[0] = v14;
    id v26 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v35, 1, v30, v14);
    id v32 = 0;
    BOOL v27 = +[MIMCMContainer deleteContainers:v26 waitForDeletion:0 error:&v32];
    id v17 = v32;

    if (!v27 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)) {
      MOLogWrite();
    }
LABEL_27:
    id v28 = a8;

    uint64_t v19 = 0;
    id v17 = (id)v25;
    LOBYTE(v18) = v14 != 0;
    if (!a7) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v19 = 0;
  id v17 = (id)v25;
LABEL_17:
  id v28 = a8;
  if (a7) {
LABEL_18:
  }
    *a7 = v18;
LABEL_19:
  if (v28 && !v19) {
    *id v28 = v17;
  }

  return v19;
}

+ (BOOL)removeContainers:(id)a3 waitForDeletion:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13), "rawContainer", (void)v18);
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  id v15 = (void *)[v8 copy];
  BOOL v16 = +[MIMCMContainer deleteContainers:v15 waitForDeletion:v6 error:a5];

  return v16;
}

+ (id)containersWithClass:(unint64_t)a3 error:(id *)a4
{
  BOOL v6 = [NSString stringWithUTF8String:*MEMORY[0x1E4F14060]];
  id v7 = [(id)objc_opt_class() containersWithClass:a3 personaUniqueString:v6 error:a4];

  return v7;
}

+ (id)containersWithClass:(unint64_t)a3 personaUniqueString:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [(id)objc_opt_class() containersForIdentifier:0 groupContainerIdentifier:0 ofContentClass:a3 forPersona:v7 fetchTransient:0 createIfNeeded:0 error:a5];

  return v8;
}

- (BOOL)recreateDefaultStructureWithError:(id *)a3
{
  BOOL v5 = [(MIContainer *)self rawContainer];
  id v12 = 0;
  char v6 = [v5 recreateDefaultStructureWithError:&v12];
  id v7 = v12;

  if ((v6 & 1) == 0)
  {
    id v8 = [(MIContainer *)self rawContainer];
    uint64_t v10 = _CreateAndLogError((uint64_t)"-[MIContainer recreateDefaultStructureWithError:]", 563, @"MIInstallerErrorDomain", 4, v7, 0, @"Failed to recreate structure for %@", v9, (uint64_t)v8);

    if (a3)
    {
      id v7 = v10;
      *a3 = v7;
    }
    else
    {
      id v7 = v10;
    }
  }

  return v6;
}

- (BOOL)makeContainerLiveReplacingContainer:(id)a3 reason:(unint64_t)a4 waitForDeletion:(BOOL)a5 withError:(id *)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  if (!v11 && a4 != 3)
  {
    _CreateAndLogError((uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 583, @"MIInstallerErrorDomain", 4, 0, 0, @"Existing container was nil but replacement reason was not NewContainer; given %ld",
      v10,
      a4);
LABEL_20:
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    long long v18 = 0;
    goto LABEL_21;
  }
  unint64_t v12 = [(MIContainer *)self status];
  if (v12 == 1)
  {
    [(MIContainer *)self recreateDefaultStructureWithError:0];
    long long v18 = 0;
    id v20 = 0;
LABEL_48:
    BOOL v28 = 1;
    goto LABEL_49;
  }
  if (v12 != 3)
  {
    if (v12 != 2)
    {
      uint64_t v42 = [(MIContainer *)self status];
      _CreateAndLogError((uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 662, @"MIInstallerErrorDomain", 4, 0, 0, @"Unknown container status: %lu", v29, v42);
      goto LABEL_20;
    }
    uint64_t v13 = [(MIContainer *)self identifier];
    unint64_t v14 = [(MIContainer *)self containerClass];
    id v51 = 0;
    BOOL v15 = [(MIContainer *)self _replaceExistingContainer:v11 replacementReason:a4 waitForDeletion:v7 error:&v51];
    id v16 = v51;
    id v17 = v16;
    if (v15)
    {
      long long v18 = 0;
      goto LABEL_9;
    }
    long long v30 = [v16 domain];
    if ([v30 isEqualToString:@"MIContainerManagerErrorDomain"])
    {
      uint64_t v31 = [v17 code];

      if (v31 == 27)
      {

        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          id v41 = self;
          MOLogWrite();
        }
        id v50 = 0;
        BOOL v33 = -[MIContainer removeUnderlyingContainerWaitingForDeletion:error:](self, "removeUnderlyingContainerWaitingForDeletion:error:", 0, &v50, v41);
        id v34 = v50;
        if (!v33)
        {
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            unint64_t v43 = self;
            id v44 = v34;
            MOLogWrite();
          }

          id v34 = 0;
        }
        id v49 = v34;
        long long v18 = +[MIMCMContainer containerForIdentifier:contentClass:forPersona:create:error:](MIMCMContainer, "containerForIdentifier:contentClass:forPersona:create:error:", v13, v14, 0, 0, &v49, v43, v44);
        id v17 = v49;

        if (v18)
        {
          id v48 = v17;
          BOOL v36 = [(MIContainer *)self _setContainer:v18 error:&v48];
          id v37 = v48;

          if (v36)
          {
            id v17 = v37;
LABEL_9:
            id v47 = v17;
            long long v19 = [(MIContainer *)self infoValueForKey:@"com.apple.MobileContainerManager.SafeHarborInfo" error:&v47];
            id v20 = v47;

            if (v19)
            {
              if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
              {
                unint64_t v23 = 3;
                goto LABEL_47;
              }
              long long v21 = [(MIContainer *)self containerURL];
              uint64_t v22 = [v21 path];
              MOLogWrite();
              unint64_t v23 = 3;
            }
            else
            {
              if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
              {
                unint64_t v23 = 1;
                goto LABEL_47;
              }
              long long v21 = [(MIContainer *)self containerURL];
              uint64_t v22 = [v21 path];
              MOLogWrite();
              unint64_t v23 = 1;
            }

LABEL_47:
            self->_status = v23;

            goto LABEL_48;
          }
          _CreateAndLogError((uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 622, @"MIInstallerErrorDomain", 22, v37, 0, @"Failed to set container after fetching existing container found when making container live for %@", v38, (uint64_t)v13);
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          id v17 = v37;
        }
        else
        {
          _CreateAndLogError((uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 617, @"MIInstallerErrorDomain", 22, v17, 0, @"Failed to get existing container when replacement found the live container was already present for %@", v35, (uint64_t)v13);
          id v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_40;
      }
    }
    else
    {
    }
    _CreateAndLogError((uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 626, @"MIInstallerErrorDomain", 22, v17, 0, @"Failed to make staged container live %@", v32, (uint64_t)self);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    long long v18 = 0;
LABEL_40:

LABEL_21:
    if (a6)
    {
      id v20 = v20;
      BOOL v28 = 0;
      *a6 = v20;
    }
    else
    {
      BOOL v28 = 0;
    }
    goto LABEL_49;
  }
  id v46 = 0;
  BOOL v24 = [(MIContainer *)self setInfoValue:0 forKey:@"com.apple.MobileContainerManager.SafeHarborInfo" error:&v46];
  id v20 = v46;
  if (!v24)
  {
    uint64_t v39 = _CreateAndLogError((uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 644, @"MIInstallerErrorDomain", 22, v20, 0, @"Failed to make safe harbor container live %@", v25, (uint64_t)self);

    long long v18 = 0;
    id v20 = (id)v39;
    goto LABEL_21;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    id v26 = [(MIContainer *)self identifier];
    BOOL v27 = [(MIContainer *)self containerURL];
    BOOL v45 = [v27 path];
    MOLogWrite();
  }
  long long v18 = 0;
  BOOL v28 = 1;
  self->_status = 1;
LABEL_49:

  return v28;
}

- (BOOL)makeContainerLiveWithError:(id *)a3
{
  return [(MIContainer *)self makeContainerLiveReplacingContainer:0 reason:3 waitForDeletion:0 withError:a3];
}

- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MIContainer *)self rawContainer];
  id v16 = 0;
  char v11 = [v10 setInfoValue:v8 forKey:v9 error:&v16];
  id v12 = v16;

  if ((v11 & 1) == 0)
  {
    unint64_t v14 = _CreateAndLogError((uint64_t)"-[MIContainer setInfoValue:forKey:error:]", 686, @"MIInstallerErrorDomain", 4, v12, 0, @"Failed to set value %@ for key %@ for container %@", v13, (uint64_t)v8);

    if (a5)
    {
      id v12 = v14;
      *a5 = v12;
    }
    else
    {
      id v12 = v14;
    }
  }

  return v11;
}

- (id)infoValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(MIContainer *)self rawContainer];
  id v11 = 0;
  id v8 = [v7 infoValueForKey:v6 error:&v11];

  id v9 = v11;
  if (a4 && !v8) {
    *a4 = v9;
  }

  return v8;
}

- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3
{
  char v4 = [(MIContainer *)self rawContainer];
  id v8 = 0;
  char v5 = [v4 regenerateDirectoryUUIDWithError:&v8];
  id v6 = v8;

  if (a3 && (v5 & 1) == 0) {
    *a3 = v6;
  }

  return v5;
}

- (BOOL)purgeContentWithError:(id *)a3
{
  unint64_t v5 = [(MIContainer *)self containerClass];
  if (v5 > 7 || ((1 << v5) & 0x94) == 0)
  {
    uint64_t v10 = [(MIContainer *)self identifier];
    _CreateAndLogError((uint64_t)"-[MIContainer purgeContentWithError:]", 733, @"MIInstallerErrorDomain", 4, 0, 0, @"Container for identifier %@ is not a data container; found class %ld.",
      v11,
      (uint64_t)v10);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    char v8 = 0;
    if (!a3) {
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v7 = [(MIContainer *)self rawContainer];
    id v13 = 0;
    char v8 = [v7 purgeContentWithError:&v13];
    id v9 = v13;

    if (!a3) {
      goto LABEL_10;
    }
  }
  if ((v8 & 1) == 0) {
    *a3 = v9;
  }
LABEL_10:

  return v8;
}

- (unint64_t)diskUsage
{
  v2 = [(MIContainer *)self rawContainer];
  unint64_t v3 = [v2 diskUsage];

  return v3;
}

+ (id)_bundleContainerForIdentifier:(id)a3 forPersona:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v14 = 0;
  BOOL v7 = +[MIBundleContainer privateAppBundleContainerWithIdentifier:v6 createIfNeeded:0 created:0 error:&v14];
  id v8 = v14;
  id v9 = v8;
  if (v7) {
    goto LABEL_10;
  }
  uint64_t v10 = [v8 domain];
  if ([v10 isEqualToString:@"MIContainerManagerErrorDomain"])
  {
    uint64_t v11 = [v9 code];

    if (v11 == 21)
    {

      id v13 = 0;
      BOOL v7 = +[MIBundleContainer appBundleContainerWithIdentifier:v6 createIfNeeded:0 created:0 error:&v13];
      id v9 = v13;
      if (!a5) {
        goto LABEL_10;
      }
      goto LABEL_8;
    }
  }
  else
  {
  }
  BOOL v7 = 0;
  if (!a5) {
    goto LABEL_10;
  }
LABEL_8:
  if (!v7)
  {
    id v9 = v9;
    *a5 = v9;
  }
LABEL_10:

  return v7;
}

+ (id)_allContainersForIdentifier:(id)a3 persona:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  char v7 = a5;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_opt_new();
  v56 = objc_opt_new();
  if ((v7 & 0xB) == 0)
  {
    id v19 = v12;
    goto LABEL_69;
  }
  id v13 = +[MIGlobalConfiguration sharedInstance];
  id v14 = [v13 primaryPersonaString];
  id v65 = 0;
  BOOL v15 = [a1 _bundleContainerForIdentifier:v10 forPersona:v14 error:&v65];
  id v16 = v65;

  if (!v15)
  {
    id v20 = [v16 domain];
    if ([v20 isEqualToString:@"MIContainerManagerErrorDomain"])
    {
      long long v21 = v16;
      uint64_t v22 = [v16 code];

      if (v22 != 21)
      {
        uint64_t v32 = 0;
        id v17 = 0;
        goto LABEL_65;
      }
      if ((v7 & 4) == 0)
      {

        id v55 = 0;
        unint64_t v18 = 0x1E62E6000uLL;
        goto LABEL_15;
      }
      _CreateAndLogError((uint64_t)"+[MIContainer _allContainersForIdentifier:persona:options:error:]", 820, @"MIInstallerErrorDomain", 26, 0, 0, @"No bundle container found for identifier %@", v23, (uint64_t)v10);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
    }
    id v17 = 0;
    uint64_t v32 = 0;
    goto LABEL_65;
  }
  id v55 = v16;
  id v17 = [v15 bundle];
  if (v7) {
    [v12 addObject:v15];
  }
  unint64_t v18 = 0x1E62E6000;
  if (v17)
  {
    if ((v7 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_15:
  if ((v7 & 0xA) != 0)
  {
    BOOL v24 = [*(id *)(v18 + 2216) sharedInstance];
    uint64_t v25 = [v24 systemAppBundleIDToInfoMap];

    id v26 = [v25 objectForKeyedSubscript:v10];
    if (!v26)
    {
      BOOL v27 = [*(id *)(v18 + 2216) sharedInstance];
      id v26 = [v27 internalAppBundleIDToInfoMap];

      uint64_t v28 = [v26 objectForKeyedSubscript:v10];
      if (!v28)
      {
        uint64_t v29 = MIDiskImageManagerProxy();
        uint64_t v28 = [v29 diskImageAppInfoForBundleID:v10];

        if (!v28)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            id v49 = v10;
            MOLogWrite();
          }
          uint64_t v31 = 0;
LABEL_35:

          id v17 = (void *)v31;
          if ((v7 & 2) == 0)
          {
LABEL_7:
            if (!v17) {
              goto LABEL_8;
            }
            goto LABEL_39;
          }
LABEL_36:
          BOOL v33 = +[MIContainer containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:](MIDataContainer, "containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:", v10, 0, 2, v11, 0, 0, 0, v50);
          if (v33) {
            [v12 addObjectsFromArray:v33];
          }

          if (!v17)
          {
LABEL_8:
            if ((v7 & 8) == 0) {
              goto LABEL_64;
            }
LABEL_54:
            uint64_t v54 = v15;
            id v41 = a6;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id v42 = v56;
            uint64_t v43 = [v42 countByEnumeratingWithState:&v57 objects:v66 count:16];
            if (v43)
            {
              uint64_t v44 = v43;
              uint64_t v45 = *(void *)v58;
              do
              {
                for (uint64_t i = 0; i != v44; ++i)
                {
                  if (*(void *)v58 != v45) {
                    objc_enumerationMutation(v42);
                  }
                  id v47 = +[MIContainer containersForIdentifier:*(void *)(*((void *)&v57 + 1) + 8 * i) groupContainerIdentifier:0 ofContentClass:7 forPersona:v11 fetchTransient:0 createIfNeeded:0 error:0];
                  if (v47) {
                    [v12 addObjectsFromArray:v47];
                  }
                }
                uint64_t v44 = [v42 countByEnumeratingWithState:&v57 objects:v66 count:16];
              }
              while (v44);
            }

            a6 = v41;
            BOOL v15 = v54;
            goto LABEL_64;
          }
LABEL_39:
          if ((v7 & 0xA) == 0) {
            goto LABEL_64;
          }
          uint64_t v53 = v15;
          id v51 = a6;
          if ((v7 & 8) != 0) {
            [v56 addObject:v10];
          }
          long long v52 = v17;
          id v34 = objc_msgSend(v17, "appExtensionBundlesPerformingPlatformValidation:withError:", 0, 0, v49);
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          uint64_t v35 = [v34 countByEnumeratingWithState:&v61 objects:v67 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v62;
            do
            {
              for (uint64_t j = 0; j != v36; ++j)
              {
                if (*(void *)v62 != v37) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v39 = [*(id *)(*((void *)&v61 + 1) + 8 * j) identifier];
                uint64_t v40 = +[MIContainer containersForIdentifier:v39 groupContainerIdentifier:0 ofContentClass:4 forPersona:v11 fetchTransient:0 createIfNeeded:0 error:0];
                if (v40) {
                  [v12 addObjectsFromArray:v40];
                }
                if ((v7 & 8) != 0) {
                  [v56 addObject:v39];
                }
              }
              uint64_t v36 = [v34 countByEnumeratingWithState:&v61 objects:v67 count:16];
            }
            while (v36);
          }

          a6 = v51;
          id v17 = v52;
          BOOL v15 = v53;
          if ((v7 & 8) == 0) {
            goto LABEL_64;
          }
          goto LABEL_54;
        }
      }

      id v26 = (void *)v28;
    }
    long long v30 = [v26 objectForKeyedSubscript:@"com.apple.MobileInstallation.bundleURL"];
    if (v30)
    {
      uint64_t v31 = +[MIBundle bundleForURL:v30 error:0];
      if (v31)
      {
LABEL_34:

        goto LABEL_35;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
LABEL_33:
        uint64_t v31 = 0;
        goto LABEL_34;
      }
      id v49 = v10;
      id v50 = v30;
    }
    else
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_33;
      }
      id v49 = v10;
    }
    MOLogWrite();
    goto LABEL_33;
  }
  id v17 = 0;
LABEL_64:
  uint64_t v32 = objc_msgSend(v12, "copy", v49);
  id v16 = v55;
LABEL_65:
  if (a6 && !v32) {
    *a6 = v16;
  }
  id v19 = v32;

LABEL_69:
  return v19;
}

+ (id)allContainersForAllPersonasForIdentifier:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return (id)[a1 _allContainersForIdentifier:a3 persona:0 options:a4 error:a5];
}

- (BOOL)markContainerAsStagedUpdateContainer:(id *)a3
{
  if (![(MIContainer *)self isTransient])
  {
    _CreateAndLogError((uint64_t)"-[MIContainer markContainerAsStagedUpdateContainer:]", 928, @"MIInstallerErrorDomain", 4, 0, 0, @"Non transient container can't be marked as a staged container", v5, v13);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
LABEL_7:
      BOOL v8 = 0;
      goto LABEL_8;
    }
LABEL_5:
    id v7 = v7;
    BOOL v8 = 0;
    *a3 = v7;
    goto LABEL_8;
  }
  id v14 = 0;
  BOOL v6 = [(MIContainer *)self setInfoValue:MEMORY[0x1E4F1CC38] forKey:@"com.apple.MobileContainerManager.StagedUpdateContainer" error:&v14];
  id v7 = v14;
  if (!v6)
  {
    id v9 = [(MIContainer *)self identifier];
    uint64_t v11 = _CreateAndLogError((uint64_t)"-[MIContainer markContainerAsStagedUpdateContainer:]", 933, @"MIInstallerErrorDomain", 4, v7, 0, @"Failed to set staged update container attribute for identifier %@ ", v10, (uint64_t)v9);

    id v7 = (id)v11;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  BOOL v8 = 1;
LABEL_8:

  return v8;
}

- (BOOL)clearStagedUpdateContainerStatusWithError:(id *)a3
{
  if (![(MIContainer *)self isTransient])
  {
    _CreateAndLogError((uint64_t)"-[MIContainer clearStagedUpdateContainerStatusWithError:]", 952, @"MIInstallerErrorDomain", 4, 0, 0, @"Clearing staged container requested for non transient container", v5, v13);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
LABEL_7:
      BOOL v8 = 0;
      goto LABEL_8;
    }
LABEL_5:
    id v7 = v7;
    BOOL v8 = 0;
    *a3 = v7;
    goto LABEL_8;
  }
  id v14 = 0;
  BOOL v6 = [(MIContainer *)self setInfoValue:0 forKey:@"com.apple.MobileContainerManager.StagedUpdateContainer" error:&v14];
  id v7 = v14;
  if (!v6)
  {
    id v9 = [(MIContainer *)self identifier];
    uint64_t v11 = _CreateAndLogError((uint64_t)"-[MIContainer clearStagedUpdateContainerStatusWithError:]", 957, @"MIInstallerErrorDomain", 4, v7, 0, @"Failed to clear staged update container attribute for identifier %@ ", v10, (uint64_t)v9);

    id v7 = (id)v11;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  BOOL v8 = 1;
LABEL_8:

  return v8;
}

- (BOOL)isStagedUpdateContainer:(BOOL *)a3 withError:(id *)a4
{
  id v17 = 0;
  BOOL v6 = [(MIContainer *)self infoValueForKey:@"com.apple.MobileContainerManager.StagedUpdateContainer" error:&v17];
  id v7 = v17;
  id v8 = v7;
  if (v6)
  {
    objc_opt_class();
    id v9 = v6;
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    if (v10)
    {
      char v13 = [v10 BOOLValue];
      if (!a3)
      {
LABEL_12:
        BOOL v15 = 1;
        goto LABEL_18;
      }
LABEL_11:
      *a3 = v13;
      goto LABEL_12;
    }
    _CreateAndLogError((uint64_t)"-[MIContainer isStagedUpdateContainer:withError:]", 988, @"MIInstallerErrorDomain", 4, 0, 0, @"Value of key %@ on %@ was not a number", v14, @"com.apple.MobileContainerManager.StagedUpdateContainer");
    uint64_t v11 = v8;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  uint64_t v11 = [v7 domain];
  if (![v11 isEqualToString:@"MIContainerManagerErrorDomain"])
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v12 = [v8 code];

  if (v12 == 24)
  {

    id v10 = 0;
    char v13 = 0;
    id v8 = 0;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_15:
  if (a4)
  {
    id v8 = v8;
    id v10 = 0;
    BOOL v15 = 0;
    *a4 = v8;
  }
  else
  {
    id v10 = 0;
    BOOL v15 = 0;
  }
LABEL_18:

  return v15;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(MIContainer *)self status];
  BOOL v6 = [(MIContainer *)self rawContainer];
  id v7 = [v3 stringWithFormat:@"<%@ status:%lu container:%@>", v4, v5, v6];

  return v7;
}

- (MIMCMContainer)rawContainer
{
  return self->_rawContainer;
}

- (void)setContainerClass:(unint64_t)a3
{
  self->_containerClass = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void)setDiskUsage:(unint64_t)a3
{
  self->_diskUsage = a3;
}

- (void)setIsTransient:(BOOL)a3
{
  self->_isTransient = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rawContainer, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
}

@end