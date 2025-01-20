@interface AKMDMConfiguration
+ (id)getOrganizationToken;
+ (unint64_t)getManagementState;
@end

@implementation AKMDMConfiguration

+ (unint64_t)getManagementState
{
  return (unint64_t)+[MDMConfiguration getManagementStateForMAID];
}

+ (id)getOrganizationToken
{
  id v12 = 0;
  v2 = +[MDMConfiguration getOrgTokenForMAID:&v12];
  id v3 = v12;
  if (v3)
  {
    v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10018ADAC((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  return v2;
}

@end