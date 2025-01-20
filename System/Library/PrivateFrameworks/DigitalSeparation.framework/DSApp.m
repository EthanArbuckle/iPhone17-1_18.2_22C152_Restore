@interface DSApp
+ (BOOL)app:(id)a3 hasPermission:(id)a4;
+ (BOOL)app:(id)a3 hasPermissionAcceptingAnyLocationAuthorization:(id)a4;
+ (BOOL)appHasNoPermissions:(id)a3;
+ (BOOL)skipTCCCheck:(id)a3;
- (BOOL)hasLocationAccess;
- (NSMutableSet)permissionsGranted;
- (NSString)appID;
- (NSString)displayName;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)locationAuthorization;
- (void)setAppID:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setLocationAuthorization:(unint64_t)a3;
- (void)setPermissionsGranted:(id)a3;
@end

@implementation DSApp

+ (BOOL)skipTCCCheck:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"DSLocationAlways"] & 1) != 0
    || ([v3 isEqualToString:@"DSLocationWhenInUse"] & 1) != 0
    || ([v3 isEqualToString:@"DSHealth"] & 1) != 0
    || ([v3 isEqualToString:@"DSLocalNetwork"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"DSContacts"];
  }

  return v4;
}

+ (BOOL)appHasNoPermissions:(id)a3
{
  id v3 = a3;
  char v4 = [v3 permissionsGranted];
  if ([v4 count]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = [v3 locationAuthorization] == 0;
  }

  return v5;
}

+ (BOOL)app:(id)a3 hasPermissionAcceptingAnyLocationAuthorization:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v6 isEqualToString:@"DSLocationAlways"] & 1) != 0
    || [v6 isEqualToString:@"DSLocationWhenInUse"])
  {
    char v7 = [v5 hasLocationAccess];
  }
  else
  {
    v8 = [v5 permissionsGranted];
    char v7 = [v8 containsObject:v6];
  }
  return v7;
}

+ (BOOL)app:(id)a3 hasPermission:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:@"DSLocationAlways"])
  {
    BOOL v7 = [v5 locationAuthorization] == 2;
  }
  else
  {
    if (![v6 isEqualToString:@"DSLocationWhenInUse"])
    {
      v9 = [v5 permissionsGranted];
      char v8 = [v9 containsObject:v6];

      goto LABEL_9;
    }
    BOOL v7 = [v5 locationAuthorization] == 1;
  }
  char v8 = v7;
LABEL_9:

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = +[DSUtilities tccServices];
  if ([v5 count])
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    while (1)
    {
      char v8 = [v5 objectAtIndexedSubscript:v6];
      BOOL v9 = +[DSApp app:self hasPermission:v8];
      if (v9 != +[DSApp app:v4 hasPermission:v8]) {
        break;
      }

      uint64_t v6 = v7;
      if ([v5 count] <= (unint64_t)v7++) {
        goto LABEL_5;
      }
    }
    if (+[DSApp app:self hasPermission:v8]) {
      int64_t v12 = -1;
    }
    else {
      int64_t v12 = 1;
    }
  }
  else
  {
LABEL_5:
    displayName = self->_displayName;
    char v8 = [v4 displayName];
    int64_t v12 = [(NSString *)displayName localizedStandardCompare:v8];
  }

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_displayName mutableCopyWithZone:a3];
  unsigned int v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_appID mutableCopyWithZone:a3];
  BOOL v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSMutableSet *)self->_permissionsGranted mutableCopyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  v5[4] = self->_locationAuthorization;
  return v5;
}

- (BOOL)hasLocationAccess
{
  return self->_locationAuthorization - 1 < 2;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSMutableSet)permissionsGranted
{
  return self->_permissionsGranted;
}

- (void)setPermissionsGranted:(id)a3
{
}

- (unint64_t)locationAuthorization
{
  return self->_locationAuthorization;
}

- (void)setLocationAuthorization:(unint64_t)a3
{
  self->_locationAuthorization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permissionsGranted, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end