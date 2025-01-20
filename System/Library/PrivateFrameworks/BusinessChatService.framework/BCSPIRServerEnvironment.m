@interface BCSPIRServerEnvironment
- (BCSPIRServerEnvironment)initWithUserDefaults:(id)a3 isInternalInstall:(BOOL)a4 type:(int64_t)a5 serverType:(int64_t)a6;
- (BCSUserDefaults)userDefaults;
- (BOOL)isInternalInstall;
- (BOOL)pirUsesCompression;
- (NSString)pirUseCase;
- (NSString)secondaryIdentifier;
- (id)_stringFromDefaultsForKey:(void *)a3 defaultValue:;
- (int64_t)serverType;
- (int64_t)type;
- (void)setIsInternalInstall:(BOOL)a3;
- (void)setServerType:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation BCSPIRServerEnvironment

- (BCSPIRServerEnvironment)initWithUserDefaults:(id)a3 isInternalInstall:(BOOL)a4 type:(int64_t)a5 serverType:(int64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BCSPIRServerEnvironment;
  v12 = [(BCSPIRServerEnvironment *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userDefaults, a3);
    v13->_isInternalInstall = a4;
    v13->_type = a5;
    v13->_serverType = a6;
  }

  return v13;
}

- (NSString)pirUseCase
{
  if ([(BCSPIRServerEnvironment *)self isInternalInstall])
  {
    int64_t v3 = [(BCSPIRServerEnvironment *)self type];
    if (v3 == 4)
    {
      int64_t v6 = [(BCSPIRServerEnvironment *)self serverType];
      if ((unint64_t)(v6 - 1) < 2)
      {
        v4 = @"BCSBusinessEmailPIRUseCase";
        v5 = kBCSDefaultBusinessEmailPIRUseCase;
        goto LABEL_9;
      }
      if (v6 == 3)
      {
        v4 = @"BCSBusinessEmailLogoPIRUseCase";
        v5 = kBCSDefaultBusinessEmailLogoPIRUseCase;
        goto LABEL_9;
      }
    }
    else if (v3 == 3)
    {
      v4 = @"BCSBusinessCallerPIRUseCase";
      v5 = kBCSDefaultBusinessCallerPIRUseCase;
LABEL_9:
      -[BCSPIRServerEnvironment _stringFromDefaultsForKey:defaultValue:](self, v4, *v5);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  int64_t v8 = [(BCSPIRServerEnvironment *)self type];
  if (v8 == 4)
  {
    int64_t v10 = [(BCSPIRServerEnvironment *)self serverType];
    if ((unint64_t)(v10 - 1) < 2)
    {
      v9 = kBCSDefaultBusinessEmailPIRUseCase;
      goto LABEL_17;
    }
    if (v10 == 3)
    {
      v9 = kBCSDefaultBusinessEmailLogoPIRUseCase;
      goto LABEL_17;
    }
  }
  else if (v8 == 3)
  {
    v9 = kBCSDefaultBusinessCallerPIRUseCase;
LABEL_17:
    v7 = *v9;
    goto LABEL_19;
  }
  v7 = 0;
LABEL_19:

  return (NSString *)v7;
}

- (id)_stringFromDefaultsForKey:(void *)a3 defaultValue:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (v5
      && ([a1 userDefaults],
          v7 = objc_claimAutoreleasedReturnValue(),
          [v7 objectForKey:v5],
          int64_t v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8))
    {
      v9 = [a1 userDefaults];
      a1 = [v9 stringForKey:v5];
    }
    else
    {
      a1 = v6;
    }
  }

  return a1;
}

- (BOOL)pirUsesCompression
{
  v2 = self;
  if (![(BCSPIRServerEnvironment *)self isInternalInstall]) {
    goto LABEL_6;
  }
  uint64_t v3 = [(BCSPIRServerEnvironment *)v2 type];
  if (v3 == 3)
  {
    id v5 = kBCSDefaultsBusinessCallerPIRUsesCompression;
    goto LABEL_8;
  }
  if (v3 != 4 || (uint64_t v4 = [(BCSPIRServerEnvironment *)v2 serverType], (unint64_t)(v4 - 1) > 2))
  {
LABEL_6:
    LOBYTE(v2) = 1;
    return (char)v2;
  }
  id v5 = off_264249D88[v4 - 1];
LABEL_8:
  id v6 = *v5;
  v7 = v6;
  if (v2)
  {
    if (v6
      && ([(BCSPIRServerEnvironment *)v2 userDefaults],
          int64_t v8 = objc_claimAutoreleasedReturnValue(),
          [v8 objectForKey:v7],
          v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      int64_t v10 = [(BCSPIRServerEnvironment *)v2 userDefaults];
      LOBYTE(v2) = [v10 BOOLForKey:v7];
    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }

  return (char)v2;
}

- (NSString)secondaryIdentifier
{
  BOOL v3 = [(BCSPIRServerEnvironment *)self isInternalInstall];
  int64_t v4 = [(BCSPIRServerEnvironment *)self type];
  if (v3)
  {
    if (v4 == 4)
    {
      id v5 = @"BCSBusinessEmailSecondaryIdentifier";
      id v6 = kBCSPIRSecondaryIdentifierForEmail;
      goto LABEL_10;
    }
    if (v4 == 3)
    {
      id v5 = @"BCSBusinessCallerSecondaryIdentifier";
      id v6 = kBCSPIRSecondaryIdentifierForBusinessCaller;
LABEL_10:
      -[BCSPIRServerEnvironment _stringFromDefaultsForKey:defaultValue:](self, v5, *v6);
      int64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_8:
    int64_t v8 = 0;
    goto LABEL_13;
  }
  if (v4 == 4)
  {
    v7 = kBCSPIRSecondaryIdentifierForEmail;
  }
  else
  {
    if (v4 != 3) {
      goto LABEL_8;
    }
    v7 = kBCSPIRSecondaryIdentifierForBusinessCaller;
  }
  int64_t v8 = *v7;
LABEL_13:

  return (NSString *)v8;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)serverType
{
  return self->_serverType;
}

- (void)setServerType:(int64_t)a3
{
  self->_serverType = a3;
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)setIsInternalInstall:(BOOL)a3
{
  self->_isInternalInstall = a3;
}

- (BCSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end