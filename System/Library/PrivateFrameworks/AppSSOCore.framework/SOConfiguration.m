@interface SOConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)stringWithHandleResult:(int64_t)a3;
- (BOOL)_matchHost:(id)a3 inCredentialProfile:(id)a4;
- (BOOL)empty;
- (BOOL)willHandleURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5;
- (NSArray)profiles;
- (SOConfiguration)initWithCoder:(id)a3;
- (SOConfiguration)initWithProfiles:(id)a3;
- (id)_profileForURLWithHostScheme:(id)a3;
- (id)_profileForURLWithRealmScheme:(id)a3;
- (id)_profileForURLWithSSOIDScheme:(id)a3;
- (id)_profileForURLWithStandardScheme:(id)a3 isCredential:(BOOL)a4;
- (id)description;
- (id)profileForURL:(id)a3 responseCode:(int64_t)a4;
- (id)realms;
- (int64_t)willHandleURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5 profile:(id *)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SOConfiguration

- (void)encodeWithCoder:(id)a3
{
  profiles = self->_profiles;
  id v4 = a3;
  NSStringFromSelector(sel_profiles);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:profiles forKey:v5];
}

- (SOConfiguration)initWithProfiles:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = SO_LOG_SOConfiguration();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SOConfiguration initWithProfiles:]";
    __int16 v23 = 2112;
    v24 = self;
    _os_log_impl(&dword_1D7206000, v6, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v19.receiver = self;
  v19.super_class = (Class)SOConfiguration;
  v7 = [(SOConfiguration *)&v19 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_profiles, a3);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v9 = v8->_profiles;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13++), "preLoadURLData", (void)v15);
        }
        while (v11 != v13);
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v11);
    }
  }
  return v8;
}

- (SOConfiguration)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SOConfiguration;
  id v5 = [(SOConfiguration *)&v23 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = NSStringFromSelector(sel_profiles);
    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
    uint64_t v11 = [v10 copy];
    profiles = v5->_profiles;
    v5->_profiles = (NSArray *)v11;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v13 = v5->_profiles;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * v17++) preLoadURLData];
        }
        while (v15 != v17);
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v15);
    }
  }
  return v5;
}

- (BOOL)willHandleURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v21 = 0;
  int64_t v9 = [(SOConfiguration *)self willHandleURL:v8 responseCode:a4 callerBundleIdentifier:a5 profile:&v21];
  id v10 = v21;
  uint64_t v11 = v10;
  if (v9)
  {
    BOOL v12 = 0;
    goto LABEL_13;
  }
  if ([v10 type] != 2) {
    goto LABEL_12;
  }
  BOOL v12 = 1;
  if (a4 != 401 && a4 != 407)
  {
    uint64_t v13 = [v8 scheme];
    uint64_t v14 = [v13 lowercaseString];
    if ([v14 isEqualToString:@"host"])
    {
LABEL_9:

      BOOL v12 = 1;
LABEL_10:

      goto LABEL_13;
    }
    uint64_t v15 = [v8 scheme];
    uint64_t v16 = [v15 lowercaseString];
    if ([v16 isEqualToString:@"realm"])
    {

      goto LABEL_9;
    }
    uint64_t v17 = [v8 scheme];
    long long v18 = [v17 lowercaseString];
    char v19 = [v18 isEqualToString:@"ssoid"];

    if ((v19 & 1) == 0)
    {
      uint64_t v13 = SO_LOG_SOConfiguration();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SOConfiguration willHandleURL:responseCode:callerBundleIdentifier:](a4, v13);
      }
      BOOL v12 = 0;
      goto LABEL_10;
    }
LABEL_12:
    BOOL v12 = 1;
  }
LABEL_13:

  return v12;
}

- (int64_t)willHandleURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5 profile:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  uint64_t v11 = [(SOConfiguration *)self profileForURL:a3 responseCode:a4];
  BOOL v12 = v11;
  if (!v11)
  {
    int64_t v16 = 1;
    goto LABEL_16;
  }
  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v13 = [v11 extensionBundleIdentifier];
  if ([v13 isEqualToString:v10])
  {
    uint64_t v14 = [v12 type];

    if (v14 != 2)
    {
      uint64_t v15 = SO_LOG_SOConfiguration();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v21 = 138543362;
        id v22 = v10;
        _os_log_impl(&dword_1D7206000, v15, OS_LOG_TYPE_INFO, "breaking calling recursion for caller with bundleIdentifier: %{public}@", (uint8_t *)&v21, 0xCu);
      }

      int64_t v16 = 2;
      goto LABEL_16;
    }
  }
  else
  {
  }
  uint64_t v17 = [v12 deniedBundleIdentifiers];
  int v18 = [v17 containsObject:v10];

  if (v18)
  {
    char v19 = SO_LOG_SOConfiguration();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v21 = 138543362;
      id v22 = v10;
      _os_log_impl(&dword_1D7206000, v19, OS_LOG_TYPE_INFO, "denied caller with bundleIdentifier: %{public}@", (uint8_t *)&v21, 0xCu);
    }

    int64_t v16 = 3;
  }
  else
  {
LABEL_14:
    int64_t v16 = 0;
    if (a6) {
      *a6 = v12;
    }
  }
LABEL_16:

  return v16;
}

- (id)profileForURL:(id)a3 responseCode:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 scheme];
  int v8 = [v7 isEqualToString:@"ssoid"];

  if (v8)
  {
    uint64_t v9 = [(SOConfiguration *)self _profileForURLWithSSOIDScheme:v6];
  }
  else
  {
    id v10 = [v6 scheme];
    int v11 = [v10 isEqualToString:@"host"];

    if (v11)
    {
      uint64_t v9 = [(SOConfiguration *)self _profileForURLWithHostScheme:v6];
    }
    else
    {
      BOOL v12 = [v6 scheme];
      int v13 = [v12 isEqualToString:@"realm"];

      if (v13)
      {
        uint64_t v9 = [(SOConfiguration *)self _profileForURLWithRealmScheme:v6];
      }
      else
      {
        BOOL v15 = a4 == 401 || a4 == 407;
        uint64_t v9 = [(SOConfiguration *)self _profileForURLWithStandardScheme:v6 isCredential:v15];
      }
    }
  }
  int64_t v16 = (void *)v9;

  return v16;
}

- (id)_profileForURLWithStandardScheme:(id)a3 isCredential:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v7 = self->_profiles;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    v33 = v7;
    id v34 = v6;
    BOOL v31 = v4;
    uint64_t v29 = *(void *)v40;
    v30 = self;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v32 = v9;
      do
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v39 + 1) + 8 * v11);
        int v13 = objc_msgSend(v6, "absoluteString", v29, v30);
        if ([v12 type] == 1 && !v4 && objc_msgSend(v12, "matchesURL:", v13))
        {
LABEL_32:
          id v28 = v12;
LABEL_27:

          goto LABEL_29;
        }
        if ([v12 type] == 2 && v4)
        {
          BOOL v15 = [v6 host];
          BOOL v16 = [(SOConfiguration *)self _matchHost:v15 inCredentialProfile:v12];

          if (v16) {
            goto LABEL_32;
          }
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          uint64_t v17 = [v12 URLPrefix];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v36;
            while (2)
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v36 != v20) {
                  objc_enumerationMutation(v17);
                }
                id v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                uint64_t v23 = [v13 lowercaseString];
                v24 = [v22 lowercaseString];
                char v25 = [v23 hasPrefix:v24];

                if (v25)
                {
                  id v26 = v12;

                  uint64_t v7 = v33;
                  id v6 = v34;
                  goto LABEL_27;
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }

          uint64_t v7 = v33;
          id v6 = v34;
          BOOL v4 = v31;
          uint64_t v10 = v29;
          self = v30;
          uint64_t v9 = v32;
        }

        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
      BOOL v12 = 0;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_29:

  return v12;
}

- (NSArray)profiles
{
  return self->_profiles;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (id)realms
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = SO_LOG_SOConfiguration();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v20 = "-[SOConfiguration realms]";
    __int16 v21 = 2112;
    id v22 = self;
    _os_log_impl(&dword_1D7206000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  BOOL v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_profiles;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (void)v14) == 2)
        {
          uint64_t v11 = [v10 realm];

          if (v11)
          {
            BOOL v12 = [v10 realm];
            [v4 addObject:v12];
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)empty
{
  return [(NSArray *)self->_profiles count] == 0;
}

- (id)description
{
  return [(NSArray *)self->_profiles description];
}

- (id)_profileForURLWithHostScheme:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_profiles;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (void)v15) == 2)
        {
          uint64_t v11 = [v4 host];
          BOOL v12 = [(SOConfiguration *)self _matchHost:v11 inCredentialProfile:v10];

          if (v12)
          {
            id v13 = v10;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_12:

  return v13;
}

- (BOOL)_matchHost:(id)a3 inCredentialProfile:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = objc_msgSend(a4, "hosts", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int v12 = [v11 hasPrefix:@"."];
        id v13 = [v5 lowercaseString];
        long long v14 = [v11 lowercaseString];
        if (v12)
        {
          if ([v13 hasSuffix:v14])
          {
            long long v15 = [v5 lowercaseString];
            long long v16 = [v11 lowercaseString];
            char v17 = [v15 isEqualToString:v16];

            if ((v17 & 1) == 0) {
              goto LABEL_16;
            }
          }
          else
          {
          }
        }
        else
        {
          char v18 = [v13 isEqualToString:v14];

          if (v18)
          {
LABEL_16:
            BOOL v19 = 1;
            goto LABEL_17;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (id)_profileForURLWithRealmScheme:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 host];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_profiles;
  id v5 = (id)[(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v9 type] == 2)
        {
          uint64_t v10 = [v9 realm];
          uint64_t v11 = [v10 lowercaseString];
          int v12 = [v4 lowercaseString];
          char v13 = [v11 isEqualToString:v12];

          if ((v13 & 1) != 0
            || (objc_msgSend(NSString, "stringWithFormat:", @"%d", v6),
                long long v14 = objc_claimAutoreleasedReturnValue(),
                char v15 = [v14 isEqualToString:v4],
                v14,
                (v15 & 1) != 0))
          {
            id v5 = v9;
            goto LABEL_14;
          }
          uint64_t v6 = (v6 + 1);
        }
      }
      id v5 = (id)[(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v5;
}

- (id)_profileForURLWithSSOIDScheme:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_profiles;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "extensionBundleIdentifier", (void)v14);
        uint64_t v11 = [v4 host];
        char v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)stringWithHandleResult:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
  {
    v3 = [NSString stringWithFormat:@"unknown, code: %u", a3];
  }
  else
  {
    v3 = off_1E6A6F200[a3];
  }
  return v3;
}

- (void)willHandleURL:(int)a1 responseCode:(NSObject *)a2 callerBundleIdentifier:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D7206000, a2, OS_LOG_TYPE_ERROR, "invalid response code %u, expected 401 or 407", (uint8_t *)v2, 8u);
}

@end