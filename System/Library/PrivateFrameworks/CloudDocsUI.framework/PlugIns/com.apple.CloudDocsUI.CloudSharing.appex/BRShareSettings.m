@interface BRShareSettings
- (BOOL)_hasACLFromPermissionOptions;
- (BOOL)applyToShare:(id)a3;
- (BOOL)hasACL;
- (BOOL)shouldHideCopyLink;
- (BOOL)shouldShowMode;
- (BOOL)shouldShowPermissions;
- (BRShareSettings)initWithPermissions:(unint64_t)a3;
- (BRShareSettings)initWithShare:(id)a3 permissions:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_permissionFromPermissionOptions;
- (int64_t)defaultPermission;
- (int64_t)publicPermission;
- (void)setDefaultPermission:(int64_t)a3;
- (void)setHasACL:(BOOL)a3;
- (void)setPublicPermission:(int64_t)a3;
- (void)setShouldHideCopyLink:(BOOL)a3;
@end

@implementation BRShareSettings

- (BRShareSettings)initWithPermissions:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BRShareSettings;
  v4 = [(BRShareSettings *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_permissionOptions = a3;
    v4->_defaultPermission = [(BRShareSettings *)v4 _permissionFromPermissionOptions];
    v5->_publicPermission = [(BRShareSettings *)v5 _permissionFromPermissionOptions];
    [(BRShareSettings *)v5 setHasACL:[(BRShareSettings *)v5 _hasACLFromPermissionOptions]];
  }
  return v5;
}

- (BOOL)_hasACLFromPermissionOptions
{
  return (self->_permissionOptions & 1) == 0;
}

- (int64_t)_permissionFromPermissionOptions
{
  if ((self->_permissionOptions & 4) != 0) {
    return 2;
  }
  else {
    return 3;
  }
}

- (BRShareSettings)initWithShare:(id)a3 permissions:(unint64_t)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BRShareSettings;
  objc_super v7 = [(BRShareSettings *)&v27 init];
  v8 = v7;
  if (v7)
  {
    v7->_permissionOptions = a4;
    v7->_unsigned int hasACL = [v6 publicPermission] == (id)1;
    if ([(BRShareSettings *)v8 shouldShowMode])
    {
      unsigned int hasACL = v8->_hasACL;
    }
    else
    {
      unsigned int hasACL = [(BRShareSettings *)v8 _hasACLFromPermissionOptions];
      v8->_unsigned int hasACL = hasACL;
    }
    v8->_publicPermission = (int64_t)[v6 publicPermission];
    if (hasACL)
    {
      v10 = [v6 participants];
      v11 = +[NSPredicate predicateWithBlock:&stru_10004CC60];
      v12 = [v10 filteredArrayUsingPredicate:v11];

      if ([v12 count])
      {
        v13 = [v12 firstObject];
        v8->_defaultPermission = (int64_t)[v13 permission];

        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v22 = v12;
        id v14 = v12;
        id v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v24;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v24 != v17) {
                objc_enumerationMutation(v14);
              }
              if ([*(id *)(*((void *)&v23 + 1) + 8 * i) permission] != (id)v8->_defaultPermission)
              {
                v19 = cdui_default_log();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v30 = v6;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[INFO] Share %@ has participants with multiple permissions, setting to indeterminate", buf, 0xCu);
                }

                v8->_defaultPermission = 0;
              }
            }
            id v16 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
          }
          while (v16);
        }

        v12 = v22;
      }
      else
      {
        v20 = cdui_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v6;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[INFO] Share %@ has ACL but no participants, setting default permissions", buf, 0xCu);
        }

        v8->_defaultPermission = [(BRShareSettings *)v8 _permissionFromPermissionOptions];
      }
    }
    if (![(BRShareSettings *)v8 shouldShowPermissions]) {
      v8->_publicPermission = [(BRShareSettings *)v8 _permissionFromPermissionOptions];
    }
    if (!v8->_hasACL) {
      v8->_defaultPermission = v8->_publicPermission;
    }
  }

  return v8;
}

- (BOOL)applyToShare:(id)a3
{
  id v4 = a3;
  v5 = cdui_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002DCF4((uint64_t)self, (uint64_t)v4, v5);
  }

  if (self->_hasACL) {
    int64_t publicPermission = 1;
  }
  else {
    int64_t publicPermission = self->_publicPermission;
  }
  id v7 = [v4 publicPermission];
  if (v7 != (id)publicPermission) {
    [v4 setPublicPermission:publicPermission];
  }

  return v7 != (id)publicPermission;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[BRShareSettings alloc] initWithPermissions:self->_permissionOptions];
  [(BRShareSettings *)v4 setHasACL:[(BRShareSettings *)self hasACL]];
  [(BRShareSettings *)v4 setPublicPermission:[(BRShareSettings *)self publicPermission]];
  [(BRShareSettings *)v4 setDefaultPermission:[(BRShareSettings *)self defaultPermission]];
  [(BRShareSettings *)v4 setShouldHideCopyLink:[(BRShareSettings *)self shouldHideCopyLink]];
  return v4;
}

- (BOOL)shouldShowMode
{
  return (self->_permissionOptions & 3) == 0;
}

- (BOOL)shouldShowPermissions
{
  return (self->_permissionOptions & 0xC) == 0;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = v3;
  uint64_t v5 = 24;
  if (self->_hasACL)
  {
    CFStringRef v6 = @"; ACL, %li";
  }
  else
  {
    uint64_t v5 = 32;
    CFStringRef v6 = @"; public, %li";
  }
  objc_msgSend(v3, "appendFormat:", v6, *(Class *)((char *)&self->super.isa + v5));
  if ([(BRShareSettings *)self shouldShowMode]) {
    [v4 appendFormat:@"; mode switchable"];
  }
  if ([(BRShareSettings *)self shouldShowPermissions]) {
    [v4 appendFormat:@"; perm switchable"];
  }
  if ([(BRShareSettings *)self shouldHideCopyLink]) {
    [v4 appendFormat:@"; copyLink hidden"];
  }
  [v4 appendFormat:@">"];

  return v4;
}

- (BOOL)hasACL
{
  return self->_hasACL;
}

- (void)setHasACL:(BOOL)a3
{
  self->_unsigned int hasACL = a3;
}

- (int64_t)defaultPermission
{
  return self->_defaultPermission;
}

- (void)setDefaultPermission:(int64_t)a3
{
  self->_defaultPermission = a3;
}

- (int64_t)publicPermission
{
  return self->_publicPermission;
}

- (void)setPublicPermission:(int64_t)a3
{
  self->_int64_t publicPermission = a3;
}

- (BOOL)shouldHideCopyLink
{
  return self->_shouldHideCopyLink;
}

- (void)setShouldHideCopyLink:(BOOL)a3
{
  self->_shouldHideCopyLink = a3;
}

@end