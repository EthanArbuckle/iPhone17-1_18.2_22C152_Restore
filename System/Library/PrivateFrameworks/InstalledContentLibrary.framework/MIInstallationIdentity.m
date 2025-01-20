@interface MIInstallationIdentity
+ (id)identityForUpdateOfBundle:(id)a3 error:(id *)a4;
+ (id)installSessionIDEAName;
+ (id)installationIdentityForBundle:(id)a3 settingIfNotSet:(BOOL)a4 error:(id *)a5;
+ (id)newIdentityForBundle:(id)a3;
+ (id)uniqueInstallIDEAName;
- (BOOL)_writeToBundle:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)writeToBundle:(id)a3 error:(id *)a4;
- (MIInstallationIdentity)initWithSessionID:(id)a3 uniqueID:(id)a4;
- (NSData)installSessionID;
- (NSData)uniqueInstallID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setInstallSessionID:(id)a3;
- (void)setUniqueInstallID:(id)a3;
@end

@implementation MIInstallationIdentity

+ (id)newIdentityForBundle:(id)a3
{
  id v3 = a3;
  if ([v3 isStaticContent])
  {
    v4 = [v3 identifier];
    id v5 = objc_alloc((Class)objc_opt_class());
    v6 = _GenerateBuiltInAppInstallSessionID(v4);
    v7 = _GenerateBuiltInAppInstallID(v4);
    v8 = (void *)[v5 initWithSessionID:v6 uniqueID:v7];
  }
  else
  {
    id v9 = objc_alloc((Class)objc_opt_class());
    v4 = _UUIDData();
    v6 = _UUIDData();
    v8 = (void *)[v9 initWithSessionID:v4 uniqueID:v6];
  }

  return v8;
}

+ (id)identityForUpdateOfBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v17 = 0;
  v7 = +[MIInstallationIdentity installationIdentityForBundle:v6 settingIfNotSet:0 error:&v17];
  id v8 = v17;
  id v9 = v8;
  if (!v7)
  {
    v14 = [v8 domain];
    if ([v14 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v15 = [v9 code];

      if (v15 == 93)
      {

        v13 = (void *)[a1 newIdentityForBundle:v6];
        id v9 = 0;
        goto LABEL_8;
      }
    }
    else
    {
    }
    v13 = 0;
    goto LABEL_8;
  }
  id v10 = objc_alloc((Class)objc_opt_class());
  v11 = [v7 installSessionID];
  v12 = _UUIDData();
  v13 = (void *)[v10 initWithSessionID:v11 uniqueID:v12];

LABEL_8:
  if (a4 && !v13) {
    *a4 = v9;
  }

  return v13;
}

+ (id)installationIdentityForBundle:(id)a3 settingIfNotSet:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  int v9 = [v8 bundleType];
  if ((v9 - 1) >= 6 && v9 != 9)
  {
    v24 = _CreateAndLogError((uint64_t)"+[MIInstallationIdentity installationIdentityForBundle:settingIfNotSet:error:]", 186, @"MIInstallerErrorDomain", 3, 0, 0, @"Install session ID requested for bundle that was not an app or app extension: %@", v10, (uint64_t)v8);
    v25 = 0;
    v26 = 0;
    v27 = 0;
    id v28 = 0;
    id v29 = 0;
    goto LABEL_13;
  }
  if ([v8 isStaticContent])
  {
    v12 = [v8 identifier];
    id v13 = objc_alloc((Class)objc_opt_class());
    v14 = _GenerateBuiltInAppInstallSessionID(v12);
    uint64_t v15 = _GenerateBuiltInAppInstallID(v12);
    id v29 = (id)[v13 initWithSessionID:v14 uniqueID:v15];

    v25 = 0;
    v26 = 0;
    v27 = 0;
    id v28 = 0;
    v24 = 0;
LABEL_13:
    LODWORD(v17) = -1;
    if (!a5) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  _IdentifierStorageLocationForBundle(v8);
  id v28 = objc_claimAutoreleasedReturnValue();
  v16 = (const char *)[v28 fileSystemRepresentation];
  uint64_t v17 = open(v16, 256);
  if ((v17 & 0x80000000) != 0)
  {
    v20 = __error();
    v22 = _CreateError((uint64_t)"+[MIInstallationIdentity installationIdentityForBundle:settingIfNotSet:error:]", 202, (void *)*MEMORY[0x1E4F28798], *v20, 0, 0, @"Failed to open %s", v21, (uint64_t)v16);
    v24 = _CreateAndLogError((uint64_t)"+[MIInstallationIdentity installationIdentityForBundle:settingIfNotSet:error:]", 202, @"MIInstallerErrorDomain", 4, v22, 0, @"Failed to get FD to bundle executable at %s", v23, (uint64_t)v16);

    v25 = 0;
    v26 = 0;
    v27 = 0;
    goto LABEL_25;
  }
  v27 = +[MIFileManager defaultManager];
  id v39 = 0;
  v25 = [v27 dataForExtendedAttributeNamed:@"com.apple.install_uuid" length:16 fromFD:v17 fdLocation:v28 error:&v39];
  id v18 = v39;
  v24 = v18;
  if (v25)
  {
    id v37 = v18;
    v26 = [v27 dataForExtendedAttributeNamed:@"com.apple.install_session_uuid" length:16 fromFD:v17 fdLocation:v28 error:&v37];
    id v19 = v37;

    if (v26) {
      id v29 = (id)[objc_alloc((Class)objc_opt_class()) initWithSessionID:v26 uniqueID:v25];
    }
    else {
      id v29 = 0;
    }
    v24 = v19;
    if (!a5) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  if (!v6) {
    goto LABEL_24;
  }
  v30 = [v18 domain];
  if (([v30 isEqualToString:*MEMORY[0x1E4F28798]] & 1) == 0)
  {

    goto LABEL_24;
  }
  uint64_t v31 = [v24 code];

  if (v31 != 93)
  {
LABEL_24:
    v25 = 0;
    v26 = 0;
LABEL_25:
    id v29 = 0;
    if (!a5) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }

  v32 = (void *)[a1 newIdentityForBundle:v8];
  id v38 = 0;
  int v33 = [v32 _writeToBundle:v8 error:&v38];
  id v34 = v38;
  v24 = v34;
  if (v33)
  {

    id v29 = v32;
    v24 = 0;
  }
  else
  {
    id v29 = 0;
  }

  v25 = 0;
  v26 = 0;
  if (!a5) {
    goto LABEL_28;
  }
LABEL_26:
  if (!v29) {
    *a5 = v24;
  }
LABEL_28:
  if ((v17 & 0x80000000) == 0) {
    close(v17);
  }
  id v35 = v29;

  return v35;
}

- (MIInstallationIdentity)initWithSessionID:(id)a3 uniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIInstallationIdentity;
  id v8 = [(MIInstallationIdentity *)&v11 init];
  if (!v8) {
    goto LABEL_5;
  }
  if ([v6 length] != 16)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_12;
    }
LABEL_11:
    MOLogWrite();
LABEL_12:
    int v9 = 0;
    goto LABEL_13;
  }
  if ([v7 length] != 16)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  [(MIInstallationIdentity *)v8 setInstallSessionID:v6];
  [(MIInstallationIdentity *)v8 setUniqueInstallID:v7];
LABEL_5:
  int v9 = v8;
LABEL_13:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MIInstallationIdentity *)a3;
  if (v4 == self)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(MIInstallationIdentity *)v5 uniqueInstallID];
      id v7 = [(MIInstallationIdentity *)self uniqueInstallID];
      id v8 = v6;
      id v9 = v7;
      uint64_t v10 = v9;
      if ((v8 != 0) != (v9 != 0) || v8 && v9 && ![v8 isEqual:v9]) {
        goto LABEL_14;
      }

      objc_super v11 = [(MIInstallationIdentity *)v5 installSessionID];
      v12 = [(MIInstallationIdentity *)self installSessionID];
      id v8 = v11;
      id v13 = v12;
      uint64_t v10 = v13;
      if ((v8 != 0) != (v13 != 0) || v8 && v13 && ![v8 isEqual:v13]) {
LABEL_14:
      }
        BOOL v14 = 0;
      else {
        BOOL v14 = 1;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  id v3 = [(MIInstallationIdentity *)self installSessionID];
  uint64_t v4 = [v3 hash];
  id v5 = [(MIInstallationIdentity *)self uniqueInstallID];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(MIInstallationIdentity *)self installSessionID];
  unint64_t v6 = [(MIInstallationIdentity *)self uniqueInstallID];
  id v7 = (void *)[v4 initWithSessionID:v5 uniqueID:v6];

  return v7;
}

- (BOOL)_writeToBundle:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[MIFileManager defaultManager];
  int v33 = [(MIInstallationIdentity *)self uniqueInstallID];
  v32 = [(MIInstallationIdentity *)self installSessionID];
  id v41 = 0;
  id v8 = [v6 thisBundleAndAllContainedBundlesWithError:&v41];
  id v9 = v41;
  id v10 = v9;
  if (!v8)
  {
    LODWORD(v19) = -1;
    if (a4) {
LABEL_17:
    }
      *a4 = v10;
    goto LABEL_18;
  }
  id v34 = v9;
  id v29 = v8;
  id v30 = v6;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (!v12)
  {
LABEL_15:

    BOOL v23 = 1;
    id v8 = v29;
    id v6 = v30;
    id v10 = v34;
    goto LABEL_21;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v38;
  uint64_t v31 = v11;
LABEL_4:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v38 != v14) {
      objc_enumerationMutation(v11);
    }
    v16 = *(void **)(*((void *)&v37 + 1) + 8 * v15);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v16 mayHaveExecutableProgram]) {
      goto LABEL_13;
    }
    _IdentifierStorageLocationForBundle(v16);
    id v17 = objc_claimAutoreleasedReturnValue();
    id v18 = (const char *)[v17 fileSystemRepresentation];
    uint64_t v19 = open(v18, 256);
    if ((v19 & 0x80000000) != 0)
    {
      uint64_t v21 = v7;
      v25 = __error();
      v27 = _CreateError((uint64_t)"-[MIInstallationIdentity _writeToBundle:error:]", 340, (void *)*MEMORY[0x1E4F28798], *v25, 0, 0, @"Failed to open %s", v26, (uint64_t)v18);
      _CreateAndLogError((uint64_t)"-[MIInstallationIdentity _writeToBundle:error:]", 340, @"MIInstallerErrorDomain", 4, v27, 0, @"Failed to get FD to bundle executable at %s", v28, (uint64_t)v18);
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_25;
    }
    id v36 = v34;
    int v20 = [v7 setData:v33 forExtendedAttributeNamed:@"com.apple.install_uuid" onFD:v19 fdLocation:v17 error:&v36];
    id v10 = v36;

    if (!v20)
    {
      uint64_t v21 = v7;
      goto LABEL_25;
    }
    id v35 = v10;
    uint64_t v21 = v7;
    int v22 = [v7 setData:v32 forExtendedAttributeNamed:@"com.apple.install_session_uuid" onFD:v19 fdLocation:v17 error:&v35];
    id v34 = v35;

    if (!v22) {
      break;
    }
    close(v19);

    id v7 = v21;
    id v11 = v31;
LABEL_13:
    if (v13 == ++v15)
    {
      uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v13) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  id v10 = v34;
LABEL_25:

  id v8 = v29;
  id v6 = v30;
  id v7 = v21;
  if (a4) {
    goto LABEL_17;
  }
LABEL_18:
  if ((v19 & 0x80000000) == 0) {
    close(v19);
  }
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (BOOL)writeToBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 isAppTypeBundle])
  {
    if (![v6 isStaticContent])
    {
      id v12 = 0;
      BOOL v10 = [(MIInstallationIdentity *)self _writeToBundle:v6 error:&v12];
      id v9 = v12;
      if (!a4) {
        goto LABEL_10;
      }
      goto LABEL_8;
    }
    _CreateAndLogError((uint64_t)"-[MIInstallationIdentity writeToBundle:error:]", 380, @"MIInstallerErrorDomain", 3, 0, 0, @"Cannot set installation identity for bundle that uses a static identity: %@", v8, (uint64_t)v6);
  }
  else
  {
    _CreateAndLogError((uint64_t)"-[MIInstallationIdentity writeToBundle:error:]", 375, @"MIInstallerErrorDomain", 3, 0, 0, @"Cannot set installation identity for non-app bundle %@", v7, (uint64_t)v6);
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v10 = 0;
  if (!a4) {
    goto LABEL_10;
  }
LABEL_8:
  if (!v10) {
    *a4 = v9;
  }
LABEL_10:

  return v10;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(MIInstallationIdentity *)self uniqueInstallID];
  uint64_t v7 = [(MIInstallationIdentity *)self installSessionID];
  uint64_t v8 = [v3 stringWithFormat:@"<%@ 0x%p uniqueInstallID=%@ installSessionID=%@", v5, self, v6, v7];

  return v8;
}

+ (id)installSessionIDEAName
{
  return @"com.apple.install_session_uuid";
}

+ (id)uniqueInstallIDEAName
{
  return @"com.apple.install_uuid";
}

- (NSData)installSessionID
{
  return self->_installSessionID;
}

- (void)setInstallSessionID:(id)a3
{
}

- (NSData)uniqueInstallID
{
  return self->_uniqueInstallID;
}

- (void)setUniqueInstallID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueInstallID, 0);
  objc_storeStrong((id *)&self->_installSessionID, 0);
}

@end