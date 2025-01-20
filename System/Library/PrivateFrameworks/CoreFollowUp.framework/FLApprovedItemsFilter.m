@interface FLApprovedItemsFilter
+ (id)sharedFilter;
- (BOOL)overrideGroupRestrictionsForItem:(id)a3;
- (unint64_t)approvalStatusForItem:(id)a3;
@end

@implementation FLApprovedItemsFilter

- (unint64_t)approvalStatusForItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[FLEnvironment currentEnvironment];
  char v6 = [v5 shouldHideAllFollowUps];

  if ((v6 & 1) == 0)
  {
    v8 = [v4 uniqueIdentifier];
    uint64_t v9 = [v4 clientIdentifier];
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([(NSSet *)self->_approvedClientIdentifiers containsObject:v9]
        || [(NSSet *)self->_approvedItemIdentifiers containsObject:v8]
        || (approvedItemIdentifiers = self->_approvedItemIdentifiers,
            [v4 typeIdentifier],
            v12 = objc_claimAutoreleasedReturnValue(),
            LODWORD(approvedItemIdentifiers) = [(NSSet *)approvedItemIdentifiers containsObject:v12],
            v12,
            approvedItemIdentifiers))
      {
        v13 = [FLGroupViewModelImpl alloc];
        v14 = [v4 groupIdentifier];
        v15 = [(FLGroupViewModelImpl *)v13 initWithIdentifier:v14];

        if ([v15 restrictionEnabled]
          && ![(FLApprovedItemsFilter *)self overrideGroupRestrictionsForItem:v4])
        {
          v16 = _FLLogSystem();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 138412290;
            id v19 = v4;
            _os_log_impl(&dword_1BE24A000, v16, OS_LOG_TYPE_DEFAULT, "Item rejected due to group restriction: %@", (uint8_t *)&v18, 0xCu);
          }
          unint64_t v7 = 2;
        }
        else
        {
          v16 = _FLLogSystem();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 138412290;
            id v19 = v4;
            _os_log_impl(&dword_1BE24A000, v16, OS_LOG_TYPE_DEFAULT, "Item approved: %@", (uint8_t *)&v18, 0xCu);
          }
          unint64_t v7 = 1;
        }

        goto LABEL_20;
      }
      v15 = _FLLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[FLApprovedItemsFilter approvalStatusForItem:]((uint64_t)v4, v15);
      }
    }
    else
    {
      v15 = _FLLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[FLApprovedItemsFilter approvalStatusForItem:]((uint64_t)v4, v15);
      }
    }
    unint64_t v7 = 0;
LABEL_20:

    goto LABEL_21;
  }
  unint64_t v7 = 2;
LABEL_21:

  return v7;
}

+ (id)sharedFilter
{
  if (sharedFilter_onceToken != -1) {
    dispatch_once(&sharedFilter_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)sharedFilter_filter;

  return v2;
}

uint64_t __37__FLApprovedItemsFilter_sharedFilter__block_invoke()
{
  v0 = objc_alloc_init(FLApprovedItemsFilter);
  v1 = (void *)sharedFilter_filter;
  sharedFilter_filter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.purplebuddy.revisitSkippedSteps", @"DrySpellFollowUpItem", @"WifiFollowUpItem", @"RestoreFailureFollowUpItem", @"com.apple.faceid.CamInterlockError", @"com.apple.SoftwareUpdateServices.followup", @"com.apple.SoftwareUpdateServices.followup.AutoUpdate", @"com.apple.SoftwareUpdateServices.followup.updateAvailable", @"com.apple.SoftwareUpdateServices.followup.badgeOnly", @"com.apple.SoftwareUpdateServices.followup.RollbackDetected", @"com.apple.SoftwareUpdateServices.followup.InsufficientDiskSpace", @"com.apple.softwareupdateservicesui.followup.postupdate", @"com.apple.Bridge.AppleID-FollowUp", @"com.apple.Bridge.iTunesAccount-FollowUp", @"com.apple.enhanced-logging-state", @"com.apple.NewDeviceOutreach", @"com.apple.managedconfiguration.ios-purgatory",
    @"com.apple.SensorKit.followup.enableSensorKit",
    @"com.apple.identityservicesd.HomeNumberSuccess",
    @"com.apple.identityservicesd.HomeNumberNearExpiration",
    @"com.apple.identityservicesd.HomeNumberExpiration",
    @"com.apple.sharingd.phone-auto-unlock-upsell",
    @"com.apple.backupd.prebuddy",
    @"com.apple.disembarkui",
    @"com.apple.devicemanagementclient.followup.reauth",
    @"com.apple.SOS.settingsReset",
    @"com.apple.transparency.ValidateSelfFailed",
    @"com.apple.transparency.AuditFailure",
    @"com.apple.transparency.TreeRollDetected",
    @"com.apple.transparency.OptOut",
    @"com.apple.Health.MedicalID.followup",
    @"com.apple.timed.timefix",
    @"com.apple.mdmclient.depenroll",
    @"com.apple.siri.assets.corefollowup",
    @"com.apple.safetyalerts.enhancedDelivery.onboardPrompt",
    @"com.apple.app-distribution.approval-flow",
    @"com.apple.SystemEnvironments.updateAvailable",
    @"com.apple.mdmclient.purgatory",
    @"com.apple.icloud.gm",
    @"com.apple.swtransparency.rollback",
    @"com.apple.swtransparency.treeFork",
    @"com.apple.modelcatalog.out-of-space-cfu",
    @"com.apple.icloud.gm.adm",
  uint64_t v2 = 0);
  v3 = *(void **)(sharedFilter_filter + 8);
  *(void *)(sharedFilter_filter + 8) = v2;

  *(void *)(sharedFilter_filter + 16) = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.appleaccount.followup", @"com.apple.NewDeviceOutreach", @"com.apple.authkit", @"com.apple.corecdp", @"com.apple.icloud.quota", @"com.apple.AppleMediaServices", @"com.apple.followup.tests", @"com.apple.ndoagent", @"com.apple.CoreTelephony", @"com.apple.mobilerepair", @"com.apple.HomeKit", @"com.icloud.family", @"com.apple.backupd", 0);

  return MEMORY[0x1F41817F8]();
}

- (BOOL)overrideGroupRestrictionsForItem:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8 = @"com.apple.AAFollowUpIdentifier.RenewCredentials";
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  v5 = [v3 arrayWithObjects:&v8 count:1];
  char v6 = objc_msgSend(v4, "uniqueIdentifier", v8, v9);

  LOBYTE(v3) = [v5 containsObject:v6];
  return (char)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_approvedClientIdentifiers, 0);

  objc_storeStrong((id *)&self->_approvedItemIdentifiers, 0);
}

- (void)approvalStatusForItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BE24A000, a2, OS_LOG_TYPE_ERROR, "Rejecting item as invalid: %@", (uint8_t *)&v2, 0xCu);
}

- (void)approvalStatusForItem:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BE24A000, a2, OS_LOG_TYPE_ERROR, "Unknown item detected, please file a radar to [Follow Up | Requests] to be approved: %@", (uint8_t *)&v2, 0xCu);
}

@end