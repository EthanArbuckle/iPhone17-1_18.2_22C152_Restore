@interface BCSICloudServerEnvironment
- (BCSICloudServerEnvironment)initWithUserDefaults:(id)a3 isInternalInstall:(BOOL)a4 type:(int64_t)a5;
- (BCSUserDefaultsProviding)userDefaults;
- (BOOL)isInternalInstall;
- (BOOL)isStagingMode;
- (NSDictionary)additionalRequestHTTPHeaders;
- (NSString)containerID;
- (__CFString)_productionContainerID;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)pirEnvironmentForServerType:(int64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)containerEnvironment;
- (int64_t)type;
- (void)setType:(int64_t)a3;
@end

@implementation BCSICloudServerEnvironment

- (BCSICloudServerEnvironment)initWithUserDefaults:(id)a3 isInternalInstall:(BOOL)a4 type:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCSICloudServerEnvironment;
  v10 = [(BCSICloudServerEnvironment *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_userDefaults, a3);
    v11->_type = a5;
    v11->_isInternalInstall = a4;
  }

  return v11;
}

- (NSString)containerID
{
  v3 = -[BCSICloudServerEnvironment _productionContainerID]((__CFString *)self);
  if ([(BCSICloudServerEnvironment *)self isInternalInstall])
  {
    unint64_t v4 = [(BCSICloudServerEnvironment *)self type] - 1;
    if (v4 <= 3
      && (v5 = off_264249190[v4],
          [(BCSICloudServerEnvironment *)self userDefaults],
          v6 = objc_claimAutoreleasedReturnValue(),
          [v6 stringForKey:*v5],
          v7 = objc_claimAutoreleasedReturnValue(),
          v6,
          v7))
    {
      id v8 = v7;

      v3 = v8;
    }
    else
    {
      id v9 = ABSLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_error_impl(&dword_2154F4000, v9, OS_LOG_TYPE_ERROR, "No custom cloudKit containerID set in user defaults, using production", v11, 2u);
      }

      -[BCSICloudServerEnvironment _productionContainerID]((__CFString *)self);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }

    v3 = v8;
  }

  return (NSString *)v3;
}

- (__CFString)_productionContainerID
{
  if (a1)
  {
    uint64_t v2 = [(__CFString *)a1 type];
    if ((unint64_t)(v2 - 1) > 3) {
      a1 = 0;
    }
    else {
      a1 = *off_2642491B0[v2 - 1];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (int64_t)containerEnvironment
{
  if ([(BCSICloudServerEnvironment *)self isInternalInstall]
    && [(BCSICloudServerEnvironment *)self isStagingMode])
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (NSDictionary)additionalRequestHTTPHeaders
{
  v15[1] = *MEMORY[0x263EF8340];
  if ([(BCSICloudServerEnvironment *)self isInternalInstall])
  {
    switch([(BCSICloudServerEnvironment *)self type])
    {
      case 1:
        v3 = [(BCSICloudServerEnvironment *)self userDefaults];
        int v4 = [v3 BOOLForKey:@"BCSSkipEdgeCaching"];

        if (!v4) {
          goto LABEL_4;
        }
        goto LABEL_14;
      case 2:
        id v8 = [(BCSICloudServerEnvironment *)self userDefaults];
        id v9 = v8;
        v10 = kBCSDefaultsLinkSkipEdgeCaching;
        goto LABEL_13;
      case 3:
        id v8 = [(BCSICloudServerEnvironment *)self userDefaults];
        id v9 = v8;
        v10 = kBCSDefaultsBusinessCallerSkipEdgeCaching;
        goto LABEL_13;
      case 4:
        id v8 = [(BCSICloudServerEnvironment *)self userDefaults];
        id v9 = v8;
        v10 = kBCSDefaultsBusinessEmailSkipEdgeCaching;
LABEL_13:
        char v11 = [v8 BOOLForKey:*v10];

        if ((v11 & 1) == 0) {
          goto LABEL_4;
        }
LABEL_14:
        v12 = ABSLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)objc_super v13 = 0;
          _os_log_impl(&dword_2154F4000, v12, OS_LOG_TYPE_DEFAULT, "Edge cache disabled", v13, 2u);
        }

        v14 = @"Cache-Control";
        v15[0] = @"max-age=0";
        v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v5 = ABSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v13 = 0;
      _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "Edge cache enabled", v13, 2u);
    }

    v6 = 0;
  }

  return (NSDictionary *)v6;
}

- (id)pirEnvironmentForServerType:(int64_t)a3
{
  if ((unint64_t)([(BCSICloudServerEnvironment *)self type] - 3) > 1)
  {
    v7 = 0;
  }
  else
  {
    v5 = [BCSPIRServerEnvironment alloc];
    v6 = [(BCSICloudServerEnvironment *)self userDefaults];
    v7 = [(BCSPIRServerEnvironment *)v5 initWithUserDefaults:v6 isInternalInstall:[(BCSICloudServerEnvironment *)self isInternalInstall] type:[(BCSICloudServerEnvironment *)self type] serverType:a3];
  }

  return v7;
}

- (BOOL)isStagingMode
{
  unint64_t v3 = [(BCSICloudServerEnvironment *)self type] - 1;
  if (v3 > 3) {
    return 0;
  }
  int v4 = off_2642491D0[v3];
  v5 = [(BCSICloudServerEnvironment *)self userDefaults];
  LOBYTE(v4) = [v5 BOOLForKey:*v4];

  return (char)v4;
}

- (id)succinctDescription
{
  uint64_t v2 = [(BCSICloudServerEnvironment *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  unint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  int v4 = [(BCSICloudServerEnvironment *)self containerID];
  id v5 = (id)[v3 appendObject:v4 withName:@"containerID"];

  [(BCSICloudServerEnvironment *)self containerEnvironment];
  v6 = CKContainerEnvironmentString();
  id v7 = (id)[v3 appendObject:v6 withName:@"containerEnvironment"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(BCSICloudServerEnvironment *)self descriptionBuilderWithMultilinePrefix:a3];
  int v4 = [v3 build];

  return v4;
}

- (BCSUserDefaultsProviding)userDefaults
{
  return self->_userDefaults;
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end