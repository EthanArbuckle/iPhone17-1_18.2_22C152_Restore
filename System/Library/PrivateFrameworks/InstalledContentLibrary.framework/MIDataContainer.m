@interface MIDataContainer
+ (id)dataContainerForExecutableBundle:(id)a3 forPersona:(id)a4 createIfNeeded:(BOOL)a5 temporary:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8;
- (id)_oldCompatiblityLinkDestination;
- (int)contentProtectionClass;
- (void)makeSymlinkToBundleInContainerIfNeeded:(id)a3;
- (void)setContentProtectionClass:(int)a3;
@end

@implementation MIDataContainer

+ (id)dataContainerForExecutableBundle:(id)a3 forPersona:(id)a4 createIfNeeded:(BOOL)a5 temporary:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = [v13 dataContainerContentClass];
  if (v15)
  {
    uint64_t v17 = v15;
    if (v10)
    {
      if (a7) {
        *a7 = 1;
      }
      v18 = objc_opt_class();
      id v19 = [v13 identifier];
      uint64_t v20 = [v18 tempContainerWithIdentifier:v19 forPersona:v14 ofContentClass:v17 error:a8];
    }
    else
    {
      v23 = objc_opt_class();
      id v19 = [v13 identifier];
      uint64_t v20 = [v23 containerWithIdentifier:v19 forPersona:v14 ofContentClass:v17 createIfNeeded:v11 created:a7 error:a8];
    }
    v22 = (void *)v20;
  }
  else
  {
    v21 = _CreateAndLogError((uint64_t)"+[MIDataContainer dataContainerForExecutableBundle:forPersona:createIfNeeded:temporary:created:error:]", 39, @"MIInstallerErrorDomain", 4, 0, 0, @"Can't get data container for bundle %@", v16, (uint64_t)v13);
    id v19 = v21;
    if (a8)
    {
      id v19 = v21;
      v22 = 0;
      *a8 = v19;
    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (int)contentProtectionClass
{
  int result = self->_contentProtectionClass;
  if (!result)
  {
    uint64_t v7 = 0;
    v4 = [(MIContainer *)self infoValueForKey:@"com.apple.MobileInstallation.ContentProtectionClass" error:&v7];
    objc_opt_class();
    id v5 = v4;
    id v6 = 0;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }

    if (v6)
    {
      self->_contentProtectionClass = [v6 intValue];

      return self->_contentProtectionClass;
    }
    else
    {
      return 3;
    }
  }
  return result;
}

- (void)setContentProtectionClass:(int)a3
{
  id v5 = objc_msgSend(NSNumber, "numberWithInt:");
  id v9 = 0;
  BOOL v6 = [(MIContainer *)self setInfoValue:v5 forKey:@"com.apple.MobileInstallation.ContentProtectionClass" error:&v9];
  id v7 = v9;

  if (v6)
  {
    self->_contentProtectionClass = a3;
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v8 = [(MIContainer *)self identifier];
    MOLogWrite();
  }
}

- (id)_oldCompatiblityLinkDestination
{
  id v19 = 0;
  v3 = [(MIContainer *)self infoValueForKey:@"com.apple.MobileInstallation.WorkaroundBundleSymlinkName" error:&v19];
  id v4 = v19;
  if (v3)
  {
    objc_opt_class();
    id v5 = v3;
    id v6 = (objc_opt_isKindOfClass() & 1) != 0 ? v5 : 0;

    if (v6)
    {
      id v7 = [(MIContainer *)self containerURL];
      v8 = [v7 URLByAppendingPathComponent:v5 isDirectory:1];

      id v9 = +[MIFileManager defaultManager];
      id v18 = v4;
      BOOL v10 = [v9 destinationOfSymbolicLinkAtURL:v8 error:&v18];
      id v11 = v18;

      if (!v10)
      {
        v12 = [v11 domain];
        if (![v12 isEqualToString:*MEMORY[0x1E4F28798]])
        {

          goto LABEL_24;
        }
        uint64_t v13 = [v11 code];

        if (v13 != 2)
        {
LABEL_24:
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
            goto LABEL_18;
          }
          uint64_t v16 = [v8 path];
          MOLogWrite();
          goto LABEL_17;
        }
      }
LABEL_18:

      id v4 = v11;
      goto LABEL_20;
    }
  }
  id v14 = [v4 domain];
  if ([v14 isEqualToString:@"MIContainerManagerErrorDomain"])
  {
    uint64_t v15 = [v4 code];

    if (v15 == 24) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v8 = [(MIContainer *)self containerURL];
    uint64_t v16 = [v8 path];
    MOLogWrite();
    BOOL v10 = 0;
    id v11 = v4;
LABEL_17:

    goto LABEL_18;
  }
LABEL_19:
  BOOL v10 = 0;
LABEL_20:

  return v10;
}

- (void)makeSymlinkToBundleInContainerIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundle];
  if (v5)
  {
    uint64_t v6 = [v4 compatibilityLinkDestination];
    uint64_t v7 = [(MIDataContainer *)self _oldCompatiblityLinkDestination];
    v8 = (void *)v7;
    if (!(v6 | v7))
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) < 7) {
        goto LABEL_15;
      }
LABEL_14:
      MOLogWrite();
LABEL_15:
      id v9 = 0;
LABEL_46:

      goto LABEL_47;
    }
    if (v6 && v7)
    {
      if ([(id)v6 isEqual:v7])
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) < 7) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
    }
    else if (!v7)
    {
      id v9 = 0;
      if (!v6) {
        goto LABEL_46;
      }
LABEL_33:
      uint64_t v17 = [(MIContainer *)self containerURL];
      id v18 = [(id)v6 lastPathComponent];
      id v19 = [v17 URLByAppendingPathComponent:v18 isDirectory:1];

      if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        v29 = [v19 path];
        MOLogWrite();
      }
      uint64_t v20 = +[MIFileManager defaultManager];
      [v20 removeItemAtURL:v19 error:0];

      v21 = +[MIFileManager defaultManager];
      id v33 = v9;
      char v22 = [v21 createSymbolicLinkAtURL:v19 withDestinationURL:v6 error:&v33];
      id v23 = v33;

      if (v22)
      {
        v24 = [(id)v6 lastPathComponent];
        id v32 = v23;
        BOOL v25 = [(MIContainer *)self setInfoValue:v24 forKey:@"com.apple.MobileInstallation.WorkaroundBundleSymlinkName" error:&v32];
        id v26 = v32;

        if (!v25 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
          MOLogWrite();
        }
        id v23 = v26;
      }
      else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v27 = [v19 path];
        v31 = [(id)v6 path];
        MOLogWrite();
      }
      id v9 = v23;
      goto LABEL_46;
    }
    BOOL v10 = [(MIContainer *)self containerURL];
    id v11 = [v8 lastPathComponent];
    v12 = [v10 URLByAppendingPathComponent:v11 isDirectory:1];

    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      v28 = [v12 path];
      MOLogWrite();
    }
    uint64_t v13 = +[MIFileManager defaultManager];
    id v35 = 0;
    char v14 = [v13 removeItemAtURL:v12 error:&v35];
    id v15 = v35;

    if ((v14 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v28 = [v12 path];
      id v30 = v15;
      MOLogWrite();
    }
    if (v6)
    {
      id v9 = v15;
    }
    else
    {
      id v34 = v15;
      BOOL v16 = [(MIContainer *)self setInfoValue:0 forKey:@"com.apple.MobileInstallation.WorkaroundBundleSymlinkName" error:&v34];
      id v9 = v34;

      if (!v16 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        v28 = self;
        id v30 = v9;
        MOLogWrite();
      }
    }

    if (!v6) {
      goto LABEL_46;
    }
    goto LABEL_33;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
    MOLogWrite();
  }
LABEL_47:
}

@end