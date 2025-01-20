@interface BuddyEnrollmentFlowMCBridge
- (BOOL)respondsToSelector:(SEL)a3;
- (BuddyEnrollmentFlowMCBridge)init;
- (DMCEnrollmentFlowManagedConfigurationHelper)helper;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)profileInstallationRequestHandler;
- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 completionHandler:(id)a7;
- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 managedProfileIdentifiers:(id)a7 installationSource:(id)a8 completionHandler:(id)a9;
- (void)setHelper:(id)a3;
- (void)setProfileInstallationRequestHandler:(id)a3;
- (void)trackEnrollmentDirtyState:(id)a3;
@end

@implementation BuddyEnrollmentFlowMCBridge

- (BuddyEnrollmentFlowMCBridge)init
{
  SEL v7 = a2;
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyEnrollmentFlowMCBridge;
  id location = [(BuddyEnrollmentFlowMCBridge *)&v6 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v2 = objc_alloc_init((Class)sub_1000F7DAC());
    v3 = (void *)*((void *)location + 2);
    *((void *)location + 2) = v2;
  }
  v4 = (BuddyEnrollmentFlowMCBridge *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v11 = self;
  SEL v10 = a2;
  SEL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BuddyEnrollmentFlowMCBridge;
  unsigned __int8 v3 = [(BuddyEnrollmentFlowMCBridge *)&v8 respondsToSelector:a3];
  char v6 = 0;
  char v4 = 1;
  if ((v3 & 1) == 0)
  {
    SEL v7 = [(BuddyEnrollmentFlowMCBridge *)v11 helper];
    char v6 = 1;
    char v4 = objc_opt_respondsToSelector();
  }
  char v12 = v4 & 1;
  if (v6) {

  }
  return v12 & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return [(BuddyEnrollmentFlowMCBridge *)self helper];
}

- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 completionHandler:(id)a7
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  id v12 = 0;
  objc_storeStrong(&v12, a6);
  id v11 = 0;
  objc_storeStrong(&v11, a7);
  [(BuddyEnrollmentFlowMCBridge *)v16 installEnrollmentProfile:location[0] devicePasscode:v14 personaID:v13 rmAccountIdentifier:v12 managedProfileIdentifiers:0 installationSource:0 completionHandler:v11];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 managedProfileIdentifiers:(id)a7 installationSource:(id)a8 completionHandler:(id)a9
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  id v25 = 0;
  objc_storeStrong(&v25, a5);
  id v24 = 0;
  objc_storeStrong(&v24, a6);
  id v23 = 0;
  objc_storeStrong(&v23, a7);
  id v22 = 0;
  objc_storeStrong(&v22, a8);
  id v21 = 0;
  objc_storeStrong(&v21, a9);
  id v14 = [(BuddyEnrollmentFlowMCBridge *)v28 profileInstallationRequestHandler];

  if (v14)
  {
    id v20 = 0;
    id obj = 0;
    id v15 = [(BuddyEnrollmentFlowMCBridge *)v28 detailsFromMDMProfile:location[0] error:&obj];
    objc_storeStrong(&v20, obj);
    id v19 = [v15 objectForKeyedSubscript:kMCBridgeProfileIdentifierKey];

    if (v20)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        sub_10004BB7C((uint64_t)buf, (uint64_t)v20);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "BuddyEnrollmentFlowMCBridge: Invalid profile! Error: %{public}@", buf, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    v16 = (void (**)(id, id, id, id, id))[(BuddyEnrollmentFlowMCBridge *)v28 profileInstallationRequestHandler];
    v16[2](v16, location[0], v19, v24, v21);

    [(BuddyEnrollmentFlowMCBridge *)v28 setProfileInstallationRequestHandler:0];
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)trackEnrollmentDirtyState:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (id)profileInstallationRequestHandler
{
  return self->_profileInstallationRequestHandler;
}

- (void)setProfileInstallationRequestHandler:(id)a3
{
}

- (DMCEnrollmentFlowManagedConfigurationHelper)helper
{
  return self->_helper;
}

- (void)setHelper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end