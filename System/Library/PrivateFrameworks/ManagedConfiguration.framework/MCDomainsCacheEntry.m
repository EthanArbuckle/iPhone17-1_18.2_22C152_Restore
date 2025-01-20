@interface MCDomainsCacheEntry
+ (id)normalizedPatternString:(id)a3;
- (BOOL)matchesURL:(id)a3;
- (BOOL)subdomainsMatch;
- (MCDomainsCacheEntry)initWithPattern:(id)a3;
- (NSNumber)port;
- (NSString)domain;
- (NSString)path;
- (id)description;
- (void)setDomain:(id)a3;
- (void)setPath:(id)a3;
- (void)setPort:(id)a3;
- (void)setSubdomainsMatch:(BOOL)a3;
@end

@implementation MCDomainsCacheEntry

+ (id)normalizedPatternString:(id)a3
{
  id v3 = a3;
  if ([v3 rangeOfString:@"http://" options:8])
  {
    uint64_t v4 = 8;
    if ([v3 rangeOfString:@"https://" options:8]) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v4 = 7;
  }
  uint64_t v5 = [v3 substringFromIndex:v4];

  id v3 = (id)v5;
LABEL_6:
  if (![v3 rangeOfString:@"www." options:8])
  {
    uint64_t v6 = [v3 substringFromIndex:4];

    id v3 = (id)v6;
  }
  return v3;
}

- (MCDomainsCacheEntry)initWithPattern:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MCDomainsCacheEntry;
  uint64_t v5 = [(MCDomainsCacheEntry *)&v21 init];
  if (v5)
  {
    uint64_t v6 = +[MCDomainsCacheEntry normalizedPatternString:v4];

    v7 = [v6 pathComponents];
    v8 = [v7 objectAtIndexedSubscript:0];
    if (![v8 rangeOfString:@"*." options:8])
    {
      v5->_subdomainsMatch = 1;
      uint64_t v9 = [v8 substringFromIndex:2];

      v8 = (void *)v9;
    }
    uint64_t v10 = [v8 rangeOfString:@":" options:4];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = v10;
      v12 = [v8 substringFromIndex:v10 + 1];
      uint64_t v13 = [v8 substringToIndex:v11];

      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v12, "intValue"));
      port = v5->_port;
      v5->_port = (NSNumber *)v14;

      v8 = (void *)v13;
    }
    objc_storeStrong((id *)&v5->_domain, v8);
    if ((unint64_t)[v7 count] >= 2)
    {
      v16 = NSString;
      v17 = objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 1);
      uint64_t v18 = [v16 pathWithComponents:v17];
      path = v5->_path;
      v5->_path = (NSString *)v18;
    }
    id v4 = v6;
  }

  return v5;
}

- (BOOL)matchesURL:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F29088] componentsWithURL:v4 resolvingAgainstBaseURL:1];
    uint64_t v6 = [v5 host];
    if (!v6)
    {
      v29 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A13F0000, v29, OS_LOG_TYPE_DEBUG, "Not matching URL because its host is nil.", buf, 2u);
      }
      goto LABEL_41;
    }
    v7 = v6;
    if (![v6 rangeOfString:@"www." options:8])
    {
      uint64_t v8 = [v7 substringFromIndex:4];

      v7 = (void *)v8;
    }
    uint64_t v9 = [(MCDomainsCacheEntry *)self domain];
    char v10 = [v7 isEqualToString:v9];

    if ([(MCDomainsCacheEntry *)self subdomainsMatch])
    {
      uint64_t v11 = NSString;
      v12 = [(MCDomainsCacheEntry *)self domain];
      uint64_t v13 = [v11 stringWithFormat:@".%@", v12];
      uint64_t v14 = [v7 rangeOfString:v13 options:12];

      if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_7;
      }
    }
    else if (v10)
    {
LABEL_7:
      v15 = [(MCDomainsCacheEntry *)self path];

      if (v15)
      {
        v16 = [v5 path];
        v17 = v16;
        if (!v16 || ![v16 length])
        {
LABEL_13:
          v25 = _MCLogObjects;
          if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            v41 = self;
            __int16 v42 = 2114;
            id v43 = v4;
            v26 = "%{public}@: Rejecting URL %{public}@ because path doesn't match.";
LABEL_38:
            _os_log_impl(&dword_1A13F0000, v25, OS_LOG_TYPE_DEBUG, v26, buf, 0x16u);
            goto LABEL_39;
          }
          goto LABEL_39;
        }
        uint64_t v18 = [v17 substringFromIndex:1];

        v19 = [(MCDomainsCacheEntry *)self path];
        char v20 = [v18 isEqualToString:v19];

        if ((v20 & 1) == 0)
        {
          objc_super v21 = NSString;
          v22 = [(MCDomainsCacheEntry *)self path];
          v23 = [v21 stringWithFormat:@"%@/", v22];
          uint64_t v24 = [v18 rangeOfString:v23 options:8];

          if (v24 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v17 = v18;
            goto LABEL_13;
          }
        }
      }
      v31 = [(MCDomainsCacheEntry *)self port];

      if (v31)
      {
        v17 = [v5 port];
        if (!v17)
        {
          v32 = [v5 scheme];
          char v33 = [v32 isEqualToString:@"http"];

          if (v33)
          {
            v17 = &unk_1EF4D0B98;
          }
          else
          {
            v34 = [v5 scheme];
            int v35 = [v34 isEqualToString:@"https"];

            if (v35) {
              v17 = &unk_1EF4D0BB0;
            }
            else {
              v17 = 0;
            }
          }
        }
        v36 = [(MCDomainsCacheEntry *)self port];
        char v37 = [v17 isEqualToNumber:v36];

        if ((v37 & 1) == 0)
        {
          v25 = _MCLogObjects;
          if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            v41 = self;
            __int16 v42 = 2114;
            id v43 = v4;
            v26 = "%{public}@: Rejecting URL %{public}@ because ports don't match.";
            goto LABEL_38;
          }
LABEL_39:

LABEL_40:
LABEL_41:
          BOOL v28 = 0;
LABEL_42:

          goto LABEL_43;
        }
      }
      v38 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        v41 = self;
        __int16 v42 = 2114;
        id v43 = v4;
        _os_log_impl(&dword_1A13F0000, v38, OS_LOG_TYPE_DEBUG, "%{public}@: Matched URL %{public}@", buf, 0x16u);
      }

      BOOL v28 = 1;
      goto LABEL_42;
    }
    v30 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      v41 = self;
      __int16 v42 = 2114;
      id v43 = v4;
      _os_log_impl(&dword_1A13F0000, v30, OS_LOG_TYPE_DEBUG, "%{public}@: Rejecting URL %{public}@ because host doesn't match.", buf, 0x16u);
    }
    goto LABEL_40;
  }
  v27 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A13F0000, v27, OS_LOG_TYPE_DEBUG, "Not matching URL because it's nil.", buf, 2u);
  }
  BOOL v28 = 0;
LABEL_43:

  return v28;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v13.receiver = self;
  v13.super_class = (Class)MCDomainsCacheEntry;
  id v4 = [(MCDomainsCacheEntry *)&v13 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@\n", v4];

  uint64_t v6 = [(MCDomainsCacheEntry *)self domain];

  if (v6)
  {
    v7 = [(MCDomainsCacheEntry *)self domain];
    [v5 appendFormat:@"Domain: %@\n", v7];
  }
  if ([(MCDomainsCacheEntry *)self subdomainsMatch]) {
    [v5 appendFormat:@"Subdomain match: yes"];
  }
  uint64_t v8 = [(MCDomainsCacheEntry *)self path];

  if (v8)
  {
    uint64_t v9 = [(MCDomainsCacheEntry *)self path];
    [v5 appendFormat:@"Path: %@\n", v9];
  }
  char v10 = [(MCDomainsCacheEntry *)self port];

  if (v10)
  {
    uint64_t v11 = [(MCDomainsCacheEntry *)self port];
    [v5 appendFormat:@"Port: %@\n", v11];
  }
  return v5;
}

- (BOOL)subdomainsMatch
{
  return self->_subdomainsMatch;
}

- (void)setSubdomainsMatch:(BOOL)a3
{
  self->_subdomainsMatch = a3;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end