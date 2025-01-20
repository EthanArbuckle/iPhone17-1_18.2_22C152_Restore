@interface AKMDMInformationProvider
- (BOOL)_shouldGetMDMInformationForAccount:(id)a3 accountManager:(id)a4;
- (BOOL)_shouldGetMDMInformationForAuthContext:(id)a3;
- (id)_fetchMDMInformationFromDeviceManagementClient;
- (id)fetchMDMInformationIfNecessaryForAccount:(id)a3 accountManager:(id)a4;
- (id)fetchMDMInformationIfNecessaryForAuthContext:(id)a3;
@end

@implementation AKMDMInformationProvider

- (id)fetchMDMInformationIfNecessaryForAuthContext:(id)a3
{
  if ([(AKMDMInformationProvider *)self _shouldGetMDMInformationForAuthContext:a3])
  {
    v4 = [(AKMDMInformationProvider *)self _fetchMDMInformationFromDeviceManagementClient];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)fetchMDMInformationIfNecessaryForAccount:(id)a3 accountManager:(id)a4
{
  if ([(AKMDMInformationProvider *)self _shouldGetMDMInformationForAccount:a3 accountManager:a4])
  {
    v5 = [(AKMDMInformationProvider *)self _fetchMDMInformationFromDeviceManagementClient];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldGetMDMInformationForAuthContext:(id)a3
{
  unsigned __int8 v3 = [a3 isMDMInformationRequired];
  v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10018AE84(v3, v4);
  }

  return v3;
}

- (BOOL)_shouldGetMDMInformationForAccount:(id)a3 accountManager:(id)a4
{
  unsigned __int8 v4 = [a4 mdmInformationRequiredForAccount:a3];
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10018AF14(v4, v5);
  }

  return v4;
}

- (id)_fetchMDMInformationFromDeviceManagementClient
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "E+E: Aquiring MDM information", v8, 2u);
  }

  uint64_t v3 = +[AKMDMConfiguration getManagementState];
  unsigned __int8 v4 = +[AKMDMConfiguration getOrganizationToken];
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10018AFA4((uint64_t)v4, v3, v5);
  }

  v6 = [[AKMDMInformation alloc] initWithDeviceManagedState:v3 organizationToken:v4];

  return v6;
}

@end