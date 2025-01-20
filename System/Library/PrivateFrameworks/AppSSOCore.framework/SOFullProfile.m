@interface SOFullProfile
+ (BOOL)supportsSecureCoding;
+ (int64_t)authMethodWithString:(id)a3;
+ (int64_t)profileTypeWithString:(id)a3;
+ (int64_t)screenLockedBehaviorWithString:(id)a3;
- (NSDictionary)extensionData;
- (NSDictionary)platformSSO;
- (NSString)extensionTeamIdentifier;
- (NSString)pssoRegistrationToken;
- (SOFullProfile)initWithCoder:(id)a3;
- (SOFullProfile)initWithProfileData:(id)a3;
- (id)copyProfile;
- (id)copyProfileForClient;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)removeURLPrefix:(id)a3;
- (void)setExtensionData:(id)a3;
- (void)setExtensionTeamIdentifier:(id)a3;
- (void)setPlatformSSO:(id)a3;
- (void)setPssoRegistrationToken:(id)a3;
@end

@implementation SOFullProfile

- (id)copyProfileForClient
{
  v3.receiver = self;
  v3.super_class = (Class)SOFullProfile;
  return [(SOProfile *)&v3 copyWithZone:0];
}

+ (int64_t)profileTypeWithString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Redirect"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Credential"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)screenLockedBehaviorWithString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Cancel"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"DoNotHandle"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)authMethodWithString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Password"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"UserSecureEnclaveKey"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"SmartCard"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 1000;
  }

  return v4;
}

- (SOFullProfile)initWithProfileData:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SOFullProfile;
  v5 = [(SOFullProfile *)&v52 init];
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = [v4 objectForKeyedSubscript:@"Type"];
    -[SOProfile setType:](v5, "setType:", [v6 profileTypeWithString:v7]);

    v8 = [v4 objectForKeyedSubscript:@"URLPrefix"];
    [(SOProfile *)v5 setURLPrefix:v8];

    v9 = [v4 objectForKeyedSubscript:@"Hosts"];
    [(SOProfile *)v5 setHosts:v9];

    v10 = [v4 objectForKeyedSubscript:@"ExtensionData"];
    [(SOFullProfile *)v5 setExtensionData:v10];

    v11 = [v4 objectForKeyedSubscript:@"Realm"];
    [(SOProfile *)v5 setRealm:v11];

    v12 = [v4 objectForKeyedSubscript:@"DeniedBundleIdentifiers"];
    [(SOProfile *)v5 setDeniedBundleIdentifiers:v12];

    v13 = objc_opt_class();
    v14 = [v4 objectForKeyedSubscript:@"ScreenLockedBehavior"];
    -[SOProfile setScreenLockedBehavior:](v5, "setScreenLockedBehavior:", [v13 screenLockedBehaviorWithString:v14]);

    v15 = [v4 objectForKeyedSubscript:@"RegistrationToken"];
    [(SOFullProfile *)v5 setPssoRegistrationToken:v15];

    v16 = [v4 objectForKeyedSubscript:@"PlatformSSO"];
    [(SOFullProfile *)v5 setPlatformSSO:v16];

    v17 = [(SOFullProfile *)v5 platformSSO];
    v18 = [v17 objectForKeyedSubscript:@"AuthenticationMethod"];

    if (!v18)
    {
      v19 = [(SOFullProfile *)v5 platformSSO];
      id v20 = (id)[v19 mutableCopy];

      if (!v20) {
        id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      v21 = objc_opt_class();
      v22 = [v4 objectForKeyedSubscript:@"AuthenticationMethod"];
      -[SOProfile setPssoAuthenticationMethod:](v5, "setPssoAuthenticationMethod:", [v21 authMethodWithString:v22]);

      v23 = [v4 objectForKeyedSubscript:@"AuthenticationMethod"];
      [v20 setObject:v23 forKeyedSubscript:@"AuthenticationMethod"];

      [(SOFullProfile *)v5 setPlatformSSO:v20];
    }
    v24 = [v4 objectForKeyedSubscript:@"Extension"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v26 = [v4 objectForKeyedSubscript:@"Extension"];
      v27 = [v26 objectForKeyedSubscript:@"BundleIdentifier"];
      [(SOProfile *)v5 setExtensionBundleIdentifier:v27];

      v28 = [v4 objectForKeyedSubscript:@"Extension"];
      v29 = [v28 objectForKeyedSubscript:@"TeamIdentifier"];
      [(SOFullProfile *)v5 setExtensionTeamIdentifier:v29];
    }
    v30 = [(SOProfile *)v5 extensionBundleIdentifier];
    objc_opt_class();
    char v31 = objc_opt_isKindOfClass();

    if ((v31 & 1) == 0)
    {
      v48 = SO_LOG_SOFullProfile();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        -[SOFullProfile initWithProfileData:].cold.7();
      }
      goto LABEL_36;
    }
    uint64_t v32 = [(SOFullProfile *)v5 extensionData];
    if (v32)
    {
      v33 = (void *)v32;
      v34 = [(SOFullProfile *)v5 extensionData];
      objc_opt_class();
      char v35 = objc_opt_isKindOfClass();

      if ((v35 & 1) == 0)
      {
        v48 = SO_LOG_SOFullProfile();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          -[SOFullProfile initWithProfileData:].cold.6();
        }
        goto LABEL_36;
      }
    }
    uint64_t v36 = [(SOProfile *)v5 realm];
    if (v36)
    {
      v37 = (void *)v36;
      v38 = [(SOProfile *)v5 realm];
      objc_opt_class();
      char v39 = objc_opt_isKindOfClass();

      if ((v39 & 1) == 0)
      {
        v48 = SO_LOG_SOFullProfile();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          -[SOFullProfile initWithProfileData:].cold.5();
        }
        goto LABEL_36;
      }
    }
    uint64_t v40 = [(SOProfile *)v5 deniedBundleIdentifiers];
    if (v40)
    {
      v41 = (void *)v40;
      v42 = [(SOProfile *)v5 deniedBundleIdentifiers];
      objc_opt_class();
      char v43 = objc_opt_isKindOfClass();

      if ((v43 & 1) == 0)
      {
        v48 = SO_LOG_SOFullProfile();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          -[SOFullProfile initWithProfileData:].cold.4();
        }
        goto LABEL_36;
      }
    }
    if ([(SOProfile *)v5 type] == 1)
    {
      uint64_t v44 = [(SOProfile *)v5 URLPrefix];
      if (v44)
      {
        v45 = (void *)v44;
        v46 = [(SOProfile *)v5 URLPrefix];
        objc_opt_class();
        char v47 = objc_opt_isKindOfClass();

        if ((v47 & 1) == 0)
        {
          v48 = SO_LOG_SOFullProfile();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            -[SOFullProfile initWithProfileData:]();
          }
LABEL_36:

          v49 = 0;
          goto LABEL_37;
        }
      }
    }
    else if ([(SOProfile *)v5 type] != 2)
    {
      v48 = SO_LOG_SOFullProfile();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        -[SOFullProfile initWithProfileData:]();
      }
      goto LABEL_36;
    }
    if (![(SOProfile *)v5 screenLockedBehavior])
    {
      v50 = [v4 objectForKeyedSubscript:@"ScreenLockedBehavior"];

      if (v50)
      {
        v48 = SO_LOG_SOFullProfile();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          -[SOFullProfile initWithProfileData:]();
        }
        goto LABEL_36;
      }
      [(SOProfile *)v5 setScreenLockedBehavior:1];
    }
  }
  v49 = v5;
LABEL_37:

  return v49;
}

- (void)removeURLPrefix:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SOProfile *)self URLPrefix];
  v8[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  v7 = [v5 arrayByExcludingObjectsInArray:v6];
  [(SOProfile *)self setURLPrefix:v7];
}

- (id)description
{
  v31[11] = *MEMORY[0x1E4F143B8];
  v30[0] = @"Type";
  v29 = objc_msgSend((id)objc_opt_class(), "stringWithProfileType:", -[SOProfile type](self, "type"));
  v31[0] = v29;
  v30[1] = @"URLPrefix";
  uint64_t v3 = [(SOProfile *)self URLPrefix];
  v28 = (void *)v3;
  if (v3) {
    id v4 = (__CFString *)v3;
  }
  else {
    id v4 = @"<null>";
  }
  v31[1] = v4;
  v30[2] = @"Hosts";
  uint64_t v5 = [(SOProfile *)self hosts];
  v27 = (void *)v5;
  if (v5) {
    v6 = (__CFString *)v5;
  }
  else {
    v6 = @"<null>";
  }
  v31[2] = v6;
  v30[3] = @"BundleIdentifier";
  uint64_t v7 = [(SOProfile *)self extensionBundleIdentifier];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"<null>";
  }
  v31[3] = v9;
  v30[4] = @"TeamIdentifier";
  uint64_t v10 = [(SOFullProfile *)self extensionTeamIdentifier];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = @"<null>";
  }
  v31[4] = v12;
  v30[5] = @"Realm";
  uint64_t v13 = [(SOProfile *)self realm];
  v14 = (void *)v13;
  if (v13) {
    v15 = (__CFString *)v13;
  }
  else {
    v15 = @"<null>";
  }
  v31[5] = v15;
  v30[6] = @"DeniedBundleIdentifiers";
  uint64_t v16 = [(SOProfile *)self deniedBundleIdentifiers];
  v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = @"<null>";
  }
  v31[6] = v18;
  v30[7] = @"ScreenLockedBehavior";
  v19 = objc_msgSend((id)objc_opt_class(), "stringWithScreenLockedBehavior:", -[SOProfile screenLockedBehavior](self, "screenLockedBehavior"));
  v31[7] = v19;
  v30[8] = @"AuthenticationMethod";
  id v20 = objc_msgSend((id)objc_opt_class(), "stringWithAuthenticationMethod:", -[SOProfile pssoAuthenticationMethod](self, "pssoAuthenticationMethod"));
  v31[8] = v20;
  v30[9] = @"RegistrationToken";
  v21 = [(SOFullProfile *)self pssoRegistrationToken];
  v22 = @"present";
  if (!v21) {
    v22 = @"<null>";
  }
  v31[9] = v22;
  v30[10] = @"PlatformSSO";
  v23 = [(SOFullProfile *)self platformSSO];
  v31[10] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:11];
  v25 = [v24 description];

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  objc_msgSend(v4, "setType:", -[SOProfile type](self, "type"));
  uint64_t v5 = [(SOProfile *)self URLPrefix];
  v6 = (void *)[v5 copy];
  [v4 setURLPrefix:v6];

  uint64_t v7 = [(SOProfile *)self hosts];
  v8 = (void *)[v7 copy];
  [v4 setHosts:v8];

  v9 = [(SOProfile *)self realm];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setRealm:v10];

  v11 = [(SOProfile *)self extensionBundleIdentifier];
  v12 = (void *)[v11 copy];
  [v4 setExtensionBundleIdentifier:v12];

  uint64_t v13 = (void *)[(NSString *)self->_extensionTeamIdentifier copy];
  [v4 setExtensionTeamIdentifier:v13];

  v14 = (void *)[(NSDictionary *)self->_extensionData copy];
  [v4 setExtensionData:v14];

  v15 = [(SOProfile *)self deniedBundleIdentifiers];
  uint64_t v16 = (void *)[v15 copy];
  [v4 setDeniedBundleIdentifiers:v16];

  objc_msgSend(v4, "setScreenLockedBehavior:", -[SOProfile screenLockedBehavior](self, "screenLockedBehavior"));
  [v4 setPlatformSSO:self->_platformSSO];
  [v4 setPssoRegistrationToken:0];
  return v4;
}

- (id)copyProfile
{
  return [(SOFullProfile *)self copyWithZone:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SOFullProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SOFullProfile;
  uint64_t v5 = [(SOProfile *)&v32 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(sel_extensionTeamIdentifier);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    extensionTeamIdentifier = v5->_extensionTeamIdentifier;
    v5->_extensionTeamIdentifier = (NSString *)v8;

    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
    uint64_t v16 = NSStringFromSelector(sel_extensionData);
    uint64_t v17 = [v4 decodeObjectOfClasses:v15 forKey:v16];
    extensionData = v5->_extensionData;
    v5->_extensionData = (NSDictionary *)v17;

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v19, "setWithObjects:", v20, v21, v22, objc_opt_class(), 0);
    v24 = NSStringFromSelector(sel_platformSSO);
    uint64_t v25 = [v4 decodeObjectOfClasses:v23 forKey:v24];
    platformSSO = v5->_platformSSO;
    v5->_platformSSO = (NSDictionary *)v25;

    uint64_t v27 = objc_opt_class();
    v28 = NSStringFromSelector(sel_pssoRegistrationToken);
    uint64_t v29 = [v4 decodeObjectOfClass:v27 forKey:v28];
    pssoRegistrationToken = v5->_pssoRegistrationToken;
    v5->_pssoRegistrationToken = (NSString *)v29;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SOFullProfile;
  id v4 = a3;
  [(SOProfile *)&v13 encodeWithCoder:v4];
  extensionTeamIdentifier = self->_extensionTeamIdentifier;
  uint64_t v6 = NSStringFromSelector(sel_extensionTeamIdentifier);
  objc_msgSend(v4, "encodeObject:forKey:", extensionTeamIdentifier, v6, v13.receiver, v13.super_class);

  extensionData = self->_extensionData;
  uint64_t v8 = NSStringFromSelector(sel_extensionData);
  [v4 encodeObject:extensionData forKey:v8];

  platformSSO = self->_platformSSO;
  uint64_t v10 = NSStringFromSelector(sel_platformSSO);
  [v4 encodeObject:platformSSO forKey:v10];

  pssoRegistrationToken = self->_pssoRegistrationToken;
  uint64_t v12 = NSStringFromSelector(sel_pssoRegistrationToken);
  [v4 encodeObject:pssoRegistrationToken forKey:v12];
}

- (NSString)extensionTeamIdentifier
{
  return self->_extensionTeamIdentifier;
}

- (void)setExtensionTeamIdentifier:(id)a3
{
}

- (NSDictionary)extensionData
{
  return self->_extensionData;
}

- (void)setExtensionData:(id)a3
{
}

- (NSString)pssoRegistrationToken
{
  return self->_pssoRegistrationToken;
}

- (void)setPssoRegistrationToken:(id)a3
{
}

- (NSDictionary)platformSSO
{
  return self->_platformSSO;
}

- (void)setPlatformSSO:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformSSO, 0);
  objc_storeStrong((id *)&self->_pssoRegistrationToken, 0);
  objc_storeStrong((id *)&self->_extensionData, 0);
  objc_storeStrong((id *)&self->_extensionTeamIdentifier, 0);
}

- (void)initWithProfileData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7206000, v0, v1, "invalid profile (screenLockedBehavior): %{private}@", v2, v3, v4, v5, v6);
}

- (void)initWithProfileData:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7206000, v0, v1, "invalid profile (URLPrefix): %{private}@", v2, v3, v4, v5, v6);
}

- (void)initWithProfileData:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7206000, v0, v1, "invalid profile (type): %{private}@", v2, v3, v4, v5, v6);
}

- (void)initWithProfileData:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7206000, v0, v1, "invalid profile (deniedBundleIdentifiers): %@{private}", v2, v3, v4, v5, v6);
}

- (void)initWithProfileData:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7206000, v0, v1, "invalid profile (realm): %@{private}", v2, v3, v4, v5, v6);
}

- (void)initWithProfileData:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7206000, v0, v1, "invalid profile (extensionData): %{private}@", v2, v3, v4, v5, v6);
}

- (void)initWithProfileData:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7206000, v0, v1, "invalid profile (extensionBundleIdentifier): %{private}@", v2, v3, v4, v5, v6);
}

@end