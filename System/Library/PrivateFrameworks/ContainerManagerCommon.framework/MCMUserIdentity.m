@interface MCMUserIdentity
+ (BOOL)isUserIdentityRequiredForContainerClass:(unint64_t)a3;
+ (MCMUserIdentity)userIdentityWithPlist:(id)a3 cache:(id)a4 error:(unint64_t *)a5;
+ (id)_identifierForPOSIXUID:(unsigned int)a3 personaUniqueString:(id)a4 personaType:(int)a5;
- (BOOL)homeDirectoryExists;
- (BOOL)isDataSeparated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUserIdentity:(id)a3;
- (BOOL)isNoSpecificPersona;
- (BOOL)isStrictlyEqualToUserIdentity:(id)a3;
- (MCMPOSIXUser)posixUser;
- (MCMUserIdentity)init;
- (MCMUserIdentity)initWithPOSIXUser:(id)a3 homeDirectoryURL:(id)a4 personaUniqueString:(id)a5 personaType:(int)a6 kernelPersonaID:(unsigned int)a7;
- (MCMUserIdentity)initWithPlist:(id)a3 cache:(id)a4 error:(unint64_t *)a5;
- (MCMUserIdentity)initWithVersion1PlistDictionary:(id)a3 cache:(id)a4 error:(unint64_t *)a5;
- (MCMUserIdentity)initWithVersion2PlistDictionary:(id)a3 cache:(id)a4 error:(unint64_t *)a5;
- (MCMUserIdentity)userIdentityWithPOSIXUser:(id)a3;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (NSString)shortDescription;
- (NSURL)homeDirectoryURL;
- (id)_descriptionForPersonaType:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)plist;
- (int)personaType;
- (int64_t)extensionHandle;
- (unint64_t)hash;
- (unsigned)kernelPersonaID;
- (void)dealloc;
- (void)setExtensionHandle:(int64_t)a3;
@end

@implementation MCMUserIdentity

- (MCMPOSIXUser)posixUser
{
  return self->_posixUser;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MCMUserIdentity *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(MCMUserIdentity *)self isEqualToUserIdentity:v5];

  return v6;
}

- (BOOL)isEqualToUserIdentity:(id)a3
{
  identifier = self->_identifier;
  uint64_t v4 = *((void *)a3 + 5);

  return [(NSString *)identifier isEqual:v4];
}

- (unint64_t)hash
{
  identifier = self->_identifier;

  return [(NSString *)identifier hash];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ((self->_extensionHandle & 0x8000000000000000) == 0)
  {
    sandbox_extension_release();
    self->_extensionHandle = -1;
  }
  v3.receiver = self;
  v3.super_class = (Class)MCMUserIdentity;
  [(MCMUserIdentity *)&v3 dealloc];
}

- (BOOL)isStrictlyEqualToUserIdentity:(id)a3
{
  uint64_t v4 = a3;
  if ([(MCMUserIdentity *)self isEqualToUserIdentity:v4]) {
    BOOL v5 = self->_personaType == v4[5];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

id __30__MCMUserIdentity_description__block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) homeDirectoryURL];
  BOOL v5 = [v4 path];

  BOOL v6 = [*(id *)(a1 + 32) posixUser];
  v7 = [v6 homeDirectoryURL];
  uint64_t v8 = [v7 path];

  int v9 = [(__CFString *)v5 isEqualToString:v8];
  v26 = (void *)v8;
  if ((v9 & 1) != 0 || a2)
  {
    if (v9) {
      v10 = 0;
    }
    else {
      v10 = @"<cm-redacted>";
    }

    BOOL v5 = v10;
  }
  v23 = NSString;
  v11 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v11);
  v12 = *(void **)(a1 + 32);
  v13 = [v12 posixUser];
  v24 = v13;
  if (a2) {
    [v13 redactedDescription];
  }
  else {
  v14 = [v13 description];
  }
  v15 = [*(id *)(a1 + 32) identifier];
  if (v5) {
    v16 = ", homeDirectoryURL = [";
  }
  else {
    v16 = "";
  }
  if (v5) {
    v17 = v5;
  }
  else {
    v17 = &stru_1F2EF6598;
  }
  if (v5) {
    v18 = "]";
  }
  else {
    v18 = "";
  }
  v19 = objc_msgSend(*(id *)(a1 + 32), "_descriptionForPersonaType:", objc_msgSend(*(id *)(a1 + 32), "personaType"));
  v20 = [*(id *)(a1 + 32) personaUniqueString];
  objc_msgSend(v23, "stringWithFormat:", @"<%@: %p; posixUser = %@, identifier = %@%s%@%s, personaType = %@, personaUniqueString = %@, kernelPersonaID = %d>",
    v25,
    v12,
    v14,
    v15,
    v16,
    v17,
    v18,
    v19,
    v20,
  v21 = [*(id *)(a1 + 32) kernelPersonaID]);

  return v21;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)homeDirectoryURL
{
  return self->_homeDirectoryURL;
}

- (id)_descriptionForPersonaType:(int)a3
{
  if (a3 > 2) {
    return @"unknown";
  }
  else {
    return off_1E6A7FF10[a3];
  }
}

id __35__MCMUserIdentity_shortDescription__block_invoke(uint64_t a1, char a2)
{
  uint64_t v4 = NSString;
  BOOL v5 = [*(id *)(a1 + 32) posixUser];
  uint64_t v6 = [v5 UID];
  v7 = [*(id *)(a1 + 32) posixUser];
  uint64_t v8 = [v7 primaryGID];
  if (a2)
  {
    int v9 = @"~~";
  }
  else
  {
    int v9 = [*(id *)(a1 + 32) identifier];
  }
  v10 = [v4 stringWithFormat:@"<%u/%u/%@/%d/%d>", v6, v8, v9, objc_msgSend(*(id *)(a1 + 32), "personaType"), objc_msgSend(*(id *)(a1 + 32), "kernelPersonaID")];
  if ((a2 & 1) == 0) {

  }
  return v10;
}

- (BOOL)isNoSpecificPersona
{
  return [(MCMUserIdentity *)self personaType] == 2;
}

- (int)personaType
{
  return self->_personaType;
}

- (unsigned)kernelPersonaID
{
  return self->_kernelPersonaID;
}

- (NSString)shortDescription
{
  v6[5] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__MCMUserIdentity_shortDescription__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  uint64_t v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return (NSString *)v4;
}

- (id)description
{
  v6[5] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__MCMUserIdentity_description__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  uint64_t v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    id v6 = [(MCMPOSIXUser *)self->_posixUser copyWithZone:a3];
    v7 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v6;

    uint64_t v8 = [(NSString *)self->_identifier copyWithZone:a3];
    int v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    uint64_t v10 = [(NSURL *)self->_homeDirectoryURL copyWithZone:a3];
    v11 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v10;

    uint64_t v12 = [(NSString *)self->_personaUniqueString copyWithZone:a3];
    v13 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v12;

    *(_DWORD *)(v5 + 20) = self->_personaType;
    *(_DWORD *)(v5 + 16) = self->_kernelPersonaID;
  }
  return (id)v5;
}

- (MCMUserIdentity)init
{
  id v3 = containermanager_copy_global_configuration();
  uint64_t v4 = [v3 defaultUser];

  uint64_t v5 = [v4 homeDirectoryURL];
  id v6 = -[MCMUserIdentity initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:](self, "initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:", v4, v5, 0, 2, [v4 UID]);

  return v6;
}

- (MCMUserIdentity)initWithPOSIXUser:(id)a3 homeDirectoryURL:(id)a4 personaUniqueString:(id)a5 personaType:(int)a6 kernelPersonaID:(unsigned int)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (v13)
  {
    if (v14) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v16 = container_log_handle_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D7739000, v16, OS_LOG_TYPE_FAULT, "POSIX user cannot be nil", buf, 2u);
  }

  if (!v14)
  {
LABEL_7:
    v17 = container_log_handle_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      _os_log_fault_impl(&dword_1D7739000, v17, OS_LOG_TYPE_FAULT, "Home directory cannot be nil, user '%@'", buf, 0xCu);
    }
  }
LABEL_10:
  v18 = objc_msgSend((id)objc_opt_class(), "_identifierForPOSIXUID:personaUniqueString:personaType:", objc_msgSend(v13, "UID"), v15, v8);
  if (v18)
  {
    v24.receiver = self;
    v24.super_class = (Class)MCMUserIdentity;
    v19 = [(MCMUserIdentity *)&v24 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_posixUser, a3);
      objc_storeStrong((id *)&v20->_personaUniqueString, a5);
      v20->_personaType = v8;
      objc_storeStrong((id *)&v20->_identifier, v18);
      objc_storeStrong((id *)&v20->_homeDirectoryURL, a4);
      v20->_kernelPersonaID = a7;
      v20->_extensionHandle = -1;
    }
    self = v20;
    v21 = self;
  }
  else
  {
    v22 = container_log_handle_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      _os_log_fault_impl(&dword_1D7739000, v22, OS_LOG_TYPE_FAULT, "Computed nil identifier, user '%@'", buf, 0xCu);
    }

    v21 = 0;
  }

  return v21;
}

+ (id)_identifierForPOSIXUID:(unsigned int)a3 personaUniqueString:(id)a4 personaType:(int)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7 && a5 == 1)
  {
    id v9 = v7;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%u", v6);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v10 = v9;

  return v10;
}

- (BOOL)isDataSeparated
{
  return [(MCMUserIdentity *)self personaType] == 1;
}

+ (BOOL)isUserIdentityRequiredForContainerClass:(unint64_t)a3
{
  id v4 = containermanager_copy_global_configuration();
  char v5 = [v4 isGlobalBundleContainerWithContainerClass:a3];

  if (v5) {
    return 0;
  }
  id v7 = containermanager_copy_global_configuration();
  char v8 = [v7 isGlobalSystemContainerWithContainerClass:a3];

  return v8 ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posixUser, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);

  objc_storeStrong((id *)&self->_homeDirectoryURL, 0);
}

- (void)setExtensionHandle:(int64_t)a3
{
  self->_extensionHandle = a3;
}

- (int64_t)extensionHandle
{
  return self->_extensionHandle;
}

- (MCMUserIdentity)userIdentityWithPOSIXUser:(id)a3
{
  id v4 = a3;
  char v5 = [(MCMUserIdentity *)self personaUniqueString];
  uint64_t v6 = [(MCMUserIdentity *)self homeDirectoryURL];
  if (![(MCMUserIdentity *)self isDataSeparated])
  {
    uint64_t v7 = [v4 homeDirectoryURL];

    uint64_t v6 = (void *)v7;
  }
  char v8 = [[MCMUserIdentity alloc] initWithPOSIXUser:v4 homeDirectoryURL:v6 personaUniqueString:v5 personaType:[(MCMUserIdentity *)self personaType] kernelPersonaID:[(MCMUserIdentity *)self kernelPersonaID]];

  return v8;
}

- (BOOL)homeDirectoryExists
{
  id v3 = +[MCMFileManager defaultManager];
  id v4 = [(MCMUserIdentity *)self homeDirectoryURL];
  LOBYTE(self) = [v3 itemExistsAtURL:v4];

  return (char)self;
}

- (id)plist
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v16[0] = @"posixUID";
  id v3 = NSNumber;
  id v4 = [(MCMUserIdentity *)self posixUser];
  char v5 = objc_msgSend(v3, "numberWithUnsignedInt:", objc_msgSend(v4, "UID"));
  v17[0] = v5;
  v16[1] = @"posixGID";
  uint64_t v6 = NSNumber;
  uint64_t v7 = [(MCMUserIdentity *)self posixUser];
  char v8 = objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v7, "primaryGID"));
  v17[1] = v8;
  v16[2] = @"type";
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MCMUserIdentity personaType](self, "personaType"));
  v16[3] = @"version";
  v17[2] = v9;
  v17[3] = @"2";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [(MCMUserIdentity *)self personaUniqueString];

  if (v12)
  {
    id v13 = [(MCMUserIdentity *)self personaUniqueString];
    [v11 setObject:v13 forKeyedSubscript:@"personaUniqueString"];
  }
  id v14 = (void *)[v11 copy];

  return v14;
}

- (MCMUserIdentity)initWithVersion2PlistDictionary:(id)a3 cache:(id)a4 error:(unint64_t *)a5
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 objectForKeyedSubscript:@"posixUID"];
  uint64_t v10 = [v7 objectForKeyedSubscript:@"posixGID"];
  v35 = [v7 objectForKeyedSubscript:@"type"];
  uint64_t v34 = [v7 objectForKeyedSubscript:@"personaUniqueString"];
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v37 = @"posixUID";
      *(_WORD *)&v37[8] = 2112;
      *(void *)v38 = objc_opt_class();
      *(_WORD *)&v38[8] = 2112;
      v39[0] = v7;
      id v29 = *(id *)v38;
      _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Expected number for %@, got %@. Data: %@", buf, 0x20u);
    }
    goto LABEL_22;
  }
  uint64_t v11 = [v9 unsignedIntegerValue];
  if (!v10 || (uint64_t v12 = v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v26 = container_log_handle_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v37 = @"posixGID";
      *(_WORD *)&v37[8] = 2112;
      *(void *)v38 = objc_opt_class();
      *(_WORD *)&v38[8] = 2112;
      v39[0] = v7;
      id v30 = *(id *)v38;
      _os_log_error_impl(&dword_1D7739000, v26, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Expected number for %@, got %@. Data: %@", buf, 0x20u);
    }
    goto LABEL_26;
  }
  int v13 = [v10 unsignedIntegerValue];
  uint64_t v14 = +[MCMPOSIXUser posixUserWithUID:v12];
  if (!v14)
  {
    v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v37 = v13;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v12;
      strcpy(v38, "@\b");
      v38[3] = 0;
      *(_WORD *)&v38[4] = 0;
      *(_DWORD *)&v38[6] = 0;
      LOWORD(v39[0]) = 2112;
      *(void *)((char *)v39 + 2) = v7;
      _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Could not get matching uid passwd data. gid: %d, uid: %d, User: %@, Data: %@", buf, 0x22u);
    }
LABEL_22:

LABEL_26:
    id v15 = 0;
LABEL_27:
    v19 = 0;
    unint64_t v20 = 75;
    v17 = v8;
LABEL_28:
    v18 = (void *)v34;
    goto LABEL_29;
  }
  id v15 = (void *)v14;
  if (!v35 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v28 = container_log_handle_for_category();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v37 = @"type";
      *(_WORD *)&v37[8] = 2112;
      *(void *)v38 = objc_opt_class();
      *(_WORD *)&v38[8] = 2112;
      v39[0] = v7;
      id v32 = *(id *)v38;
      _os_log_error_impl(&dword_1D7739000, v28, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Expected number for %@, got %@. Data: %@", buf, 0x20u);
    }
    goto LABEL_27;
  }
  unint64_t v16 = [v35 unsignedIntegerValue];
  if (v16 >= 4)
  {
    v31 = container_log_handle_for_category();
    v17 = v8;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v37 = @"type";
      *(_WORD *)&v37[8] = 2112;
      *(void *)v38 = v35;
      *(_WORD *)&v38[8] = 2112;
      v39[0] = v7;
      _os_log_error_impl(&dword_1D7739000, v31, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Expected persona type for %@, got %@. Data: %@", buf, 0x20u);
    }

    v19 = 0;
    unint64_t v20 = 75;
    goto LABEL_28;
  }
  v17 = v8;
  v18 = (void *)v34;
  if (!v34 || v16 != 1)
  {
    v19 = [v8 userIdentityForPersonalPersonaWithPOSIXUser:v15];
    unint64_t v20 = 1;
    if (!a5) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  v19 = [v8 userIdentityForPersonaUniqueString:v34 POSIXUser:v15];
  if (MCMPersonasAreSupported_onceToken != -1) {
    dispatch_once(&MCMPersonasAreSupported_onceToken, &__block_literal_global_8662);
  }
  unint64_t v20 = 1;
  if (!MCMPersonasAreSupported_staticPersonasSupported || !v19)
  {
LABEL_29:
    if (!a5) {
      goto LABEL_32;
    }
LABEL_30:
    if (!v19) {
      *a5 = v20;
    }
    goto LABEL_32;
  }
  if ([(MCMUserIdentity *)v19 isDataSeparated])
  {
LABEL_32:
    objc_super v24 = self;
    goto LABEL_33;
  }
  id v21 = containermanager_copy_global_configuration();
  int v22 = [v21 dispositionForContainerClass:2];

  if (v22 == 1)
  {
    v23 = container_log_handle_for_category();
    objc_super v24 = self;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v37 = v34;
      *(_WORD *)&v37[8] = 2112;
      *(void *)v38 = v19;
      *(_WORD *)&v38[8] = 2112;
      v39[0] = v7;
      _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Expected %@ to be data separated, but it was not: %@; Data: %@",
        buf,
        0x20u);
    }

    v18 = (void *)v34;
  }
  else
  {
    objc_super v24 = self;
    v18 = (void *)v34;
  }
LABEL_33:

  return v19;
}

- (MCMUserIdentity)initWithVersion1PlistDictionary:(id)a3 cache:(id)a4 error:(unint64_t *)a5
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 objectForKeyedSubscript:@"posixUID"];
  uint64_t v11 = [v8 objectForKeyedSubscript:@"posixGID"];
  uint64_t v12 = [v8 objectForKeyedSubscript:@"personaIdentifier"];
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unint64_t v20 = container_log_handle_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v27 = 138412802;
      *(void *)v28 = @"posixUID";
      *(_WORD *)&v28[8] = 2112;
      *(void *)id v29 = objc_opt_class();
      *(_WORD *)&v29[8] = 2112;
      v30[0] = v8;
      id v24 = *(id *)v29;
      _os_log_error_impl(&dword_1D7739000, v20, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Expected number for %@, got %@. Data: %@", (uint8_t *)&v27, 0x20u);
    }
LABEL_15:
    v17 = 0;
    v19 = 0;
    unint64_t v22 = 75;
    if (!a5) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  uint64_t v13 = [v10 unsignedIntegerValue];
  if (!v11 || (uint64_t v14 = v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v27 = 138412802;
      *(void *)v28 = @"posixGID";
      *(_WORD *)&v28[8] = 2112;
      *(void *)id v29 = objc_opt_class();
      *(_WORD *)&v29[8] = 2112;
      v30[0] = v8;
      id v26 = *(id *)v29;
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Expected number for %@, got %@. Data: %@", (uint8_t *)&v27, 0x20u);
    }
    goto LABEL_14;
  }
  int v15 = [v11 unsignedIntegerValue];
  uint64_t v16 = +[MCMPOSIXUser posixUserWithUID:v14];
  if (!v16)
  {
    int v25 = v14;
    id v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v27 = 67109890;
      *(_DWORD *)v28 = v15;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v25;
      strcpy(v29, "@\b");
      v29[3] = 0;
      *(_WORD *)&v29[4] = 0;
      *(_DWORD *)&v29[6] = 0;
      LOWORD(v30[0]) = 2112;
      *(void *)((char *)v30 + 2) = v8;
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Invalid user identity plist data. Could not get matching uid passwd data. gid: %d, uid: %d, User: %@, Data: %@", (uint8_t *)&v27, 0x22u);
    }
LABEL_14:

    goto LABEL_15;
  }
  v17 = (void *)v16;
  if (v12)
  {
    uint64_t v18 = [v9 userIdentityForPersonaUniqueString:v12 POSIXUser:v16];
    if (v18)
    {
      v19 = (MCMUserIdentity *)v18;
      goto LABEL_18;
    }
  }
  v19 = [v9 userIdentityForPersonalPersonaWithPOSIXUser:v17];
  unint64_t v22 = 1;
  if (!a5) {
    goto LABEL_18;
  }
LABEL_16:
  if (!v19) {
    *a5 = v22;
  }
LABEL_18:

  return v19;
}

- (MCMUserIdentity)initWithPlist:(id)a3 cache:(id)a4 error:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v8;
      uint64_t v11 = [v10 objectForKeyedSubscript:@"version"];
      int v12 = [v11 isEqual:@"2"];

      if (v12)
      {
        uint64_t v13 = [(MCMUserIdentity *)self initWithVersion2PlistDictionary:v10 cache:v9 error:a5];
      }
      else
      {
        uint64_t v14 = [v10 objectForKeyedSubscript:@"version"];
        int v15 = [v14 isEqual:@"1"];

        if (!v15)
        {
LABEL_8:

          goto LABEL_9;
        }
        uint64_t v13 = [(MCMUserIdentity *)self initWithVersion1PlistDictionary:v10 cache:v9 error:a5];
      }
      self = v13;
      goto LABEL_8;
    }
  }
LABEL_9:

  return self;
}

+ (MCMUserIdentity)userIdentityWithPlist:(id)a3 cache:(id)a4 error:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithPlist:v9 cache:v8 error:a5];

  return (MCMUserIdentity *)v10;
}

@end