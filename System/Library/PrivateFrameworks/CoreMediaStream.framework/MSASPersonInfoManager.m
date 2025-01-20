@interface MSASPersonInfoManager
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedManager;
- (BOOL)updateWithSharingRelationship:(id)a3;
- (MSASPersonInfoManager)initWithPath:(id)a3;
- (NSMutableDictionary)personIDToPersonInfoDictionary;
- (NSString)pathForPersonInfoDictionary;
- (id)emailForPersonID:(id)a3;
- (id)firstNameForPersonID:(id)a3;
- (id)fullNameForPersonID:(id)a3;
- (id)lastNameForPersonID:(id)a3;
- (void)setPathForPersonInfoDictionary:(id)a3;
- (void)setPersonIDToPersonInfoDictionary:(id)a3;
@end

@implementation MSASPersonInfoManager

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MSASPersonInfoManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

void __38__MSASPersonInfoManager_sharedManager__block_invoke(uint64_t a1)
{
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___MSASPersonInfoManager;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v6, sel_allocWithZone_, 0), "init");
  v2 = (void *)sharedManager_manager;
  sharedManager_manager = v1;

  v3 = (void *)sharedManager_manager;
  v4 = MSPathAlbumSharingDir();
  v5 = [v4 stringByAppendingPathComponent:@"personID.plist"];
  [v3 initWithPath:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathForPersonInfoDictionary, 0);
  objc_storeStrong((id *)&self->_personIDToPersonInfoDictionary, 0);
}

- (void)setPathForPersonInfoDictionary:(id)a3
{
}

- (NSString)pathForPersonInfoDictionary
{
  return self->_pathForPersonInfoDictionary;
}

- (void)setPersonIDToPersonInfoDictionary:(id)a3
{
}

- (NSMutableDictionary)personIDToPersonInfoDictionary
{
  return self->_personIDToPersonInfoDictionary;
}

- (id)emailForPersonID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_personIDToPersonInfoDictionary objectForKey:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKey:kMSASPersonInfoEmailKey];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)fullNameForPersonID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_personIDToPersonInfoDictionary objectForKey:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKey:kMSASPersonInfoFullNameKey];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)lastNameForPersonID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_personIDToPersonInfoDictionary objectForKey:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKey:kMSASPersonInfoLastNameKey];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)firstNameForPersonID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_personIDToPersonInfoDictionary objectForKey:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKey:kMSASPersonInfoFirstNameKey];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)updateWithSharingRelationship:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 personID];
  if (v5)
  {
    v27 = v5;
    objc_super v6 = [(NSMutableDictionary *)self->_personIDToPersonInfoDictionary objectForKey:v5];
    v7 = (void *)[v6 mutableCopy];

    if (!v7)
    {
      v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    }
    v8 = [v7 objectForKey:kMSASPersonInfoFirstNameKey];
    uint64_t v9 = [v4 firstName];
    v26 = v8;
    if (v9 && ([v8 isEqualToString:v9] & 1) == 0)
    {
      [v7 setObject:v9 forKey:kMSASPersonInfoFirstNameKey];
      int v10 = 1;
    }
    else
    {
      int v10 = 0;
    }
    v12 = [v7 objectForKey:kMSASPersonInfoLastNameKey];
    v13 = [v4 lastName];
    if (v13 && ([v12 isEqualToString:v13] & 1) == 0)
    {
      [v7 setObject:v13 forKey:kMSASPersonInfoLastNameKey];
      int v10 = 1;
    }
    int v14 = v10;
    v15 = [v7 objectForKey:kMSASPersonInfoFullNameKey];
    v16 = [v4 fullName];
    v25 = (void *)v9;
    v24 = v15;
    if (v16 && ([v15 isEqualToString:v16] & 1) == 0)
    {
      [v7 setObject:v16 forKey:kMSASPersonInfoFullNameKey];
      int v14 = 1;
    }
    v17 = [v7 objectForKey:kMSASPersonInfoEmailKey];
    v18 = [v4 email];
    v23 = v17;
    if (v18 && (objc_msgSend(v17, "isEqualToString:", v18, v17) & 1) == 0)
    {
      [v7 setObject:v18 forKey:kMSASPersonInfoEmailKey];
    }
    else if (!v14)
    {
      BOOL v11 = 0;
      v19 = v24;
LABEL_23:

      v5 = v27;
      goto LABEL_24;
    }
    -[NSMutableDictionary setObject:forKey:](self->_personIDToPersonInfoDictionary, "setObject:forKey:", v7, v27, v23);
    BOOL v11 = 1;
    v19 = v24;
    if (([(NSMutableDictionary *)self->_personIDToPersonInfoDictionary writeToFile:self->_pathForPersonInfoDictionary atomically:1] & 1) == 0&& os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      personIDToPersonInfoDictionary = self->_personIDToPersonInfoDictionary;
      pathForPersonInfoDictionary = self->_pathForPersonInfoDictionary;
      *(_DWORD *)buf = 138543874;
      v29 = self;
      __int16 v30 = 2114;
      v31 = personIDToPersonInfoDictionary;
      __int16 v32 = 2112;
      v33 = pathForPersonInfoDictionary;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to save personIDToPersonInfo dictionary %{public}@ to %@.", buf, 0x20u);
    }
    goto LABEL_23;
  }
  BOOL v11 = 0;
LABEL_24:

  return v11;
}

- (MSASPersonInfoManager)initWithPath:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_pathForPersonInfoDictionary, a3);
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 fileExistsAtPath:v10];

  if (v6) {
    [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:self->_pathForPersonInfoDictionary];
  }
  else {
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  personIDToPersonInfoDictionary = self->_personIDToPersonInfoDictionary;
  self->_personIDToPersonInfoDictionary = v7;

  return result;
}

@end