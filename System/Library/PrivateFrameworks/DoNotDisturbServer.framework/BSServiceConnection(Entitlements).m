@interface BSServiceConnection(Entitlements)
- (BOOL)dnds_hasAnyValidEntitlement;
- (id)_dnds_safeStringArrayEntitlementForKey:()Entitlements;
- (uint64_t)dnds_hasActiveModeUpdatesEntitlementForClientIdentifier:()Entitlements;
- (uint64_t)dnds_hasAuxiliaryStateModificationEntitlementForClientIdentifier:()Entitlements;
- (uint64_t)dnds_hasBehaviorResolutionEntitlementForClientIdentifier:()Entitlements;
- (uint64_t)dnds_hasEntitlementsToRequestAssertionWithDetails:()Entitlements clientIdentifier:;
- (uint64_t)dnds_hasHearingTestEventUpdateEntitlementForClientIdentifier:()Entitlements;
- (uint64_t)dnds_hasMeDeviceStateEntitlementForClientIdentifier:()Entitlements;
- (uint64_t)dnds_hasModeAssertionEntitlementForClientIdentifier:()Entitlements;
- (uint64_t)dnds_hasModeConfigurationAvailabilityEntitlementForClientIdentifier:()Entitlements;
- (uint64_t)dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:()Entitlements;
- (uint64_t)dnds_hasModeConfigurationRequestEntitlementForClientIdentifier:()Entitlements;
- (uint64_t)dnds_hasModeConfigurationUpdatesEntitlementForClientIdentifier:()Entitlements;
- (uint64_t)dnds_hasSettingsModificationEntitlementForClientIdentifier:()Entitlements;
- (uint64_t)dnds_hasSettingsRequestEntitlementForClientIdentifier:()Entitlements;
- (uint64_t)dnds_hasSettingsUpdatesEntitlementForClientIdentifier:()Entitlements;
- (uint64_t)dnds_hasStateRequestEntitlementForClientIdentifier:()Entitlements;
- (uint64_t)dnds_hasStateUpdatesEntitlementForClientIdentifier:()Entitlements;
- (uint64_t)dnds_hasUserNotificationsCommunicationEntitlement;
- (uint64_t)dnds_hasUserRequestedModeAssertionEntitlementForClientIdentifier:()Entitlements;
@end

@implementation BSServiceConnection(Entitlements)

- (uint64_t)dnds_hasModeAssertionEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.mode.assertion.client-identifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)dnds_hasActiveModeUpdatesEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  int v5 = objc_msgSend(a1, "dnds_hasModeConfigurationUpdatesEntitlementForClientIdentifier:", v4);
  int v6 = objc_msgSend(a1, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v4);
  if (([v4 isEqualToString:@"com.apple.focus.activity-manager"] & 1) != 0
    || ([v4 isEqualToString:@"com.apple.FocusSettings"] & 1) != 0)
  {
    int v7 = 1;
  }
  else
  {
    int v7 = [v4 isEqualToString:@"com.apple.Focus-Settings.extension"];
  }
  if (v5) {
    uint64_t v8 = v6 & v7;
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (uint64_t)dnds_hasModeConfigurationUpdatesEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  int v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.modeconfiguration.updates.client-identifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)dnds_hasStateRequestEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  int v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.state.request.client-identifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)dnds_hasStateUpdatesEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  int v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.state.updates.client-identifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)dnds_hasAnyValidEntitlement
{
  v2 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.behavior.resolution.client-identifiers");
  if ([v2 count])
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.mode.assertion.client-identifiers");
    if ([v4 count])
    {
      BOOL v3 = 1;
    }
    else
    {
      int v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.state.request.client-identifiers");
      if ([v5 count])
      {
        BOOL v3 = 1;
      }
      else
      {
        uint64_t v6 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.state.updates.client-identifiers");
        if ([v6 count])
        {
          BOOL v3 = 1;
        }
        else
        {
          int v7 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.settings.request.client-identifiers");
          if ([v7 count])
          {
            BOOL v3 = 1;
          }
          else
          {
            uint64_t v8 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.settings.modify.client-identifiers");
            if ([v8 count])
            {
              BOOL v3 = 1;
            }
            else
            {
              v9 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.settings.updates.client-identifiers");
              if ([v9 count])
              {
                BOOL v3 = 1;
              }
              else
              {
                v10 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.modeconfiguration.request.client-identifiers");
                if ([v10 count])
                {
                  BOOL v3 = 1;
                }
                else
                {
                  v11 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.modeconfiguration.modify.client-identifiers");
                  if ([v11 count])
                  {
                    BOOL v3 = 1;
                  }
                  else
                  {
                    v15 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.modeconfiguration.updates.client-identifiers");
                    if ([v15 count])
                    {
                      BOOL v3 = 1;
                    }
                    else
                    {
                      v14 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.modeconfiguration.availability.client-identifiers");
                      if ([v14 count])
                      {
                        BOOL v3 = 1;
                      }
                      else
                      {
                        v13 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.medevicestate.client-identifiers");
                        BOOL v3 = [v13 count] != 0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v3;
}

- (id)_dnds_safeStringArrayEntitlementForKey:()Entitlements
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = objc_opt_respondsToSelector();
  uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (a1 && (v5 & 1) != 0)
  {
    int v7 = [a1 remoteProcess];
    uint64_t v8 = [v7 valueForEntitlement:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_37];
      uint64_t v6 = [v8 filteredArrayUsingPredicate:v9];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11[0] = v8;
        uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      }
      else
      {
        uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
  }
  return v6;
}

- (uint64_t)dnds_hasModeConfigurationRequestEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  char v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.modeconfiguration.request.client-identifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)dnds_hasBehaviorResolutionEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  char v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.behavior.resolution.client-identifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)dnds_hasEntitlementsToRequestAssertionWithDetails:()Entitlements clientIdentifier:
{
  return objc_msgSend(a1, "dnds_hasModeAssertionEntitlementForClientIdentifier:", a4);
}

- (uint64_t)dnds_hasUserRequestedModeAssertionEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  char v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.mode.assertion.user-requested.client-identifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)dnds_hasAuxiliaryStateModificationEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  char v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.auxiliary-state.modification.client-identifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)dnds_hasHearingTestEventUpdateEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  char v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.0191488e-ff8a-728d-a9f7-08a0a77abd7d.update.client-identifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)dnds_hasSettingsRequestEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  char v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.settings.request.client-identifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)dnds_hasSettingsModificationEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  char v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.settings.modify.client-identifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)dnds_hasSettingsUpdatesEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  char v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.settings.updates.client-identifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  char v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.modeconfiguration.modify.client-identifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)dnds_hasModeConfigurationAvailabilityEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  char v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.modeconfiguration.availability.client-identifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)dnds_hasMeDeviceStateEntitlementForClientIdentifier:()Entitlements
{
  id v4 = a3;
  char v5 = objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", @"com.apple.private.donotdisturb.medevicestate.client-identifiers");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)dnds_hasUserNotificationsCommunicationEntitlement
{
  if (objc_opt_respondsToSelector()) {
    v2 = a1;
  }
  else {
    v2 = 0;
  }
  BOOL v3 = [v2 remoteProcess];
  uint64_t v4 = [v3 hasEntitlement:@"com.apple.developer.usernotifications.communication"];

  return v4;
}

@end