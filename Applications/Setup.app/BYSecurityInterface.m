@interface BYSecurityInterface
+ (id)sharedInterface;
- (BOOL)getKeychainSyncCircleExists:(BOOL *)a3 inCircle:(BOOL *)a4 error:(id *)a5;
- (BOOL)isHSA2EnabledForPrimaryAccount;
- (BOOL)isICDPEnabledForDSID:(id)a3;
- (BOOL)isICDPEnabledForPrimaryAccount;
- (BOOL)isManateeAvailable;
- (BOOL)simulateCircleExists;
- (BOOL)simulateInCircle;
- (BOOL)simulating;
- (id)primaryAccountDSID;
- (int)keychainSyncStatus;
- (void)setSimulateCircleExists:(BOOL)a3;
- (void)setSimulateInCircle:(BOOL)a3;
- (void)setSimulating:(BOOL)a3;
@end

@implementation BYSecurityInterface

+ (id)sharedInterface
{
  v5 = (dispatch_once_t *)&unk_100321F80;
  id location = 0;
  objc_storeStrong(&location, &stru_1002B4C70);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_100321F78;

  return v2;
}

- (int)keychainSyncStatus
{
  v12 = self;
  location[1] = (id)a2;
  if ([(BYSecurityInterface *)self simulating])
  {
    if ([(BYSecurityInterface *)v12 simulateInCircle]) {
      return 2;
    }
    else {
      return 1;
    }
  }
  else
  {
    location[0] = 0;
    oslog[1] = 0;
    int Status = PSKeychainSyncGetStatus();
    objc_storeStrong(location, 0);
    int v10 = Status;
    if (location[0])
    {
      oslog[0] = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
      {
        char v7 = 0;
        char v5 = 0;
        if (_BYIsInternalInstall())
        {
          v3 = (NSString *)location[0];
        }
        else if (location[0])
        {
          id v8 = [location[0] domain];
          char v7 = 1;
          v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v8, [location[0] code]);
          v6 = v3;
          char v5 = 1;
        }
        else
        {
          v3 = 0;
        }
        sub_10004BB7C((uint64_t)buf, (uint64_t)v3);
        _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "PSKeychainSyncGetStatus error %{public}@", buf, 0xCu);
        if (v5) {

        }
        if (v7) {
      }
        }
      objc_storeStrong((id *)oslog, 0);
    }
    int v13 = v10;
    objc_storeStrong(location, 0);
  }
  return v13;
}

- (BOOL)getKeychainSyncCircleExists:(BOOL *)a3 inCircle:(BOOL *)a4 error:(id *)a5
{
  if (![(BYSecurityInterface *)self simulating]) {
    return PSKeychainSyncGetCircleMembershipStatus() & 1;
  }
  if (a3) {
    *a3 = [(BYSecurityInterface *)self simulateCircleExists];
  }
  if (a4) {
    *a4 = [(BYSecurityInterface *)self simulateInCircle];
  }
  return 1;
}

- (id)primaryAccountDSID
{
  id location[2] = self;
  location[1] = (id)a2;
  id v2 = +[ACAccountStore defaultStore];
  location[0] = [v2 aa_primaryAppleAccount];

  id v5 = [location[0] aa_personID];
  id v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v3;
}

- (BOOL)isHSA2EnabledForPrimaryAccount
{
  id v2 = [sub_1001EEC04() sharedInstance:a2 self];
  BOOL v3 = [v2 primaryAccountSecurityLevel] == (id)4;

  return v3;
}

- (BOOL)isICDPEnabledForPrimaryAccount
{
  char v7 = self;
  v6[1] = (id)a2;
  id v2 = +[ACAccountStore defaultStore];
  v6[0] = [v2 aa_primaryAppleAccount];

  id v3 = [v6[0] accountProperties];
  id location = [v3 objectForKeyedSubscript:@"personID"];

  if (location) {
    char v8 = [(BYSecurityInterface *)v7 isICDPEnabledForDSID:location];
  }
  else {
    char v8 = 0;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v6, 0);
  return v8 & 1;
}

- (BOOL)isICDPEnabledForDSID:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(BYSecurityInterface *)v5 simulating]) {
    char v6 = 0;
  }
  else {
    char v6 = [sub_1001EEC04() isICDPEnabledForDSID:location[0]] & 1;
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)isManateeAvailable
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  char v13 = 0;
  id v2 = objc_alloc_init((Class)sub_1001EF090());
  id obj = 0;
  unsigned __int8 v3 = [v2 isManateeAvailable:&obj];
  objc_storeStrong(location, obj);

  char v13 = v3 & 1;
  if (location[0])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      char v9 = 0;
      char v7 = 0;
      if (_BYIsInternalInstall())
      {
        v4 = (NSString *)location[0];
      }
      else if (location[0])
      {
        id v10 = [location[0] domain];
        char v9 = 1;
        v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v10, [location[0] code]);
        char v8 = v4;
        char v7 = 1;
      }
      else
      {
        v4 = 0;
      }
      sub_10004B238((uint64_t)buf, (uint64_t)v4);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to fetch manatee availability %@", buf, 0xCu);
      if (v7) {

      }
      if (v9) {
    }
      }
    objc_storeStrong((id *)&oslog, 0);
  }
  char v5 = v13;
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)simulating
{
  return self->_simulating;
}

- (void)setSimulating:(BOOL)a3
{
  self->_simulating = a3;
}

- (BOOL)simulateCircleExists
{
  return self->_simulateCircleExists;
}

- (void)setSimulateCircleExists:(BOOL)a3
{
  self->_simulateCircleExists = a3;
}

- (BOOL)simulateInCircle
{
  return self->_simulateInCircle;
}

- (void)setSimulateInCircle:(BOOL)a3
{
  self->_simulateInCircle = a3;
}

@end