@interface MDMUserParser
- (id)_allCommands;
- (id)_allSettingsItems;
- (id)_allowedDeviceQueriesForAccessRights:(unint64_t)a3;
- (id)_declarativeManagement:(id)a3;
- (id)_installProfile:(id)a3 accessRights:(unint64_t)a4;
- (id)_originator;
- (id)_profileList:(id)a3;
- (id)_removeProfile:(id)a3;
- (id)_restrictions:(id)a3;
- (void)_performQuery:(id)a3 withResultDictionary:(id)a4;
- (void)_sendAnalyticsMDMCommandEventWithRequest:(id)a3 response:(id)a4;
- (void)_userConfigured:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
@end

@implementation MDMUserParser

- (id)_allCommands
{
  if (_allCommands_once != -1) {
    dispatch_once(&_allCommands_once, &__block_literal_global_9);
  }
  v2 = (void *)_allCommands_set;
  return v2;
}

void __29__MDMUserParser__allCommands__block_invoke()
{
  v4[9] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"ProfileList";
  v4[1] = @"InstallProfile";
  v4[2] = @"RemoveProfile";
  v4[3] = @"Restrictions";
  v4[4] = @"InviteToProgram";
  v4[5] = @"DeviceInformation";
  v4[6] = @"DeclarativeManagement";
  v4[7] = @"Settings";
  v4[8] = @"UserConfigured";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:9];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)_allCommands_set;
  _allCommands_set = v2;
}

- (id)_allSettingsItems
{
  if (_allSettingsItems_onceToken != -1) {
    dispatch_once(&_allSettingsItems_onceToken, &__block_literal_global_3);
  }
  BOOL v3 = [(MDMParser *)self isChaperoned];
  v4 = &_allSettingsItems_nonSupervisedSet;
  if (v3) {
    v4 = &_allSettingsItems_supervisedSet;
  }
  v5 = (void *)*v4;
  return v5;
}

void __34__MDMUserParser__allSettingsItems__block_invoke()
{
  v9[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFF9C0];
  v9[0] = @"AccessibilitySettings";
  v9[1] = @"DefaultApplications";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  BOOL v3 = (void *)_allSettingsItems_supervisedSet;
  _allSettingsItems_supervisedSet = v2;

  v4 = (void *)MEMORY[0x263EFF9C0];
  v8 = @"DefaultApplications";
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  uint64_t v6 = [v4 setWithArray:v5];
  v7 = (void *)_allSettingsItems_nonSupervisedSet;
  _allSettingsItems_nonSupervisedSet = v6;
}

- (id)_profileList:(id)a3
{
  return [(MDMParser *)self _profileList:a3 filterFlags:9];
}

- (id)_installProfile:(id)a3 accessRights:(unint64_t)a4
{
  return [(MDMParser *)self _installProfile:a3 accessRights:a4 installationType:1];
}

- (id)_removeProfile:(id)a3
{
  v4 = [a3 objectForKey:@"Identifier"];
  if (v4) {
    [(MDMParser *)self _removeProfileWithIdentifier:v4 forInstalledProfilesWithFilterFlags:9];
  }
  else {
  v5 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
  }

  return v5;
}

- (id)_declarativeManagement:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v5, OS_LOG_TYPE_DEFAULT, "Processing DeclarativeManagement command", buf, 2u);
  }
  uint64_t v6 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  v7 = [(MDMParser *)self managingProfileIdentifier];
  id v15 = 0;
  BOOL v8 = +[MDMDeclarativeManagementCommand processMultiUserDeviceUserChannelRequestTypeWithProfileIdentifier:v7 request:v4 error:&v15];

  id v9 = v15;
  if (!v8)
  {
    v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      v12 = [v9 DMCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_230A49000, v11, OS_LOG_TYPE_ERROR, "Failed to process DeclarativeManagement command with error: %{public}@", buf, 0xCu);
    }
    uint64_t v13 = +[MDMAbstractTunnelParser responseWithError:v9];

    uint64_t v6 = (void *)v13;
  }

  return v6;
}

- (id)_restrictions:(id)a3
{
  return [(MDMParser *)self _restrictions:a3 withProfileFilterFlags:9];
}

- (id)_allowedDeviceQueriesForAccessRights:(unint64_t)a3
{
  return (id)[MEMORY[0x263F52820] allowedDeviceQueriesOnUserChannelForAccessRights:a3];
}

- (void)_performQuery:(id)a3 withResultDictionary:(id)a4
{
  id v10 = a4;
  uint64_t v5 = *MEMORY[0x263F52CA0];
  if ([a3 isEqualToString:*MEMORY[0x263F52CA0]])
  {
    id v6 = [NSString alloc];
    v7 = [MEMORY[0x263F52860] sharedClient];
    BOOL v8 = [v7 pushToken];
    id v9 = (void *)[v6 initWithData:v8 encoding:1];

    if (v9) {
      [v10 setObject:v9 forKeyedSubscript:v5];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)_sendAnalyticsMDMCommandEventWithRequest:(id)a3 response:(id)a4
{
  if (a3 && a4)
  {
    id v6 = (void *)MEMORY[0x263F52808];
    id v7 = a4;
    id v8 = a3;
    id v11 = [v6 sharedConfiguration];
    id v9 = [(MDMParser *)self _analyticsCommandNameFromRequest:v8];
    id v10 = [(MDMParser *)self _analyticsErrorFromResponse:v7];

    [(MDMParser *)self _analyticsRequiresNetworkTetheringFromRequest:v8];
    [v11 isTeslaEnrolled];
    [v11 isSupervised];
    MDMAnalyticsSendCommandEvent(v9, v10);
  }
}

- (id)_originator
{
  uint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 managingOrganizationInformation];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F38990]];

  return v4;
}

- (void)_userConfigured:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  uint64_t v5 = (void (**)(id, void *))a5;
  if ([MEMORY[0x263F38BA0] markCurrentUserAsConfigured])
  {
    id v6 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
    if (!v5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v7 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_ERROR, "Could not update await user configured", buf, 2u);
  }
  id v8 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F38B10];
  id v10 = DMCErrorArray();
  id v11 = objc_msgSend(v8, "DMCErrorWithDomain:code:descriptionArray:errorType:", v9, 12114, v10, *MEMORY[0x263F38A40], 0);
  id v6 = +[MDMAbstractTunnelParser responseWithError:v11];

  if (v5) {
LABEL_7:
  }
    v5[2](v5, v6);
LABEL_8:
}

@end