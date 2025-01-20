@interface BLTSectionConfigurationItem
- (BLTSectionConfigurationItem)initWithDictionary:(id)a3;
- (BOOL)alwaysAlert;
- (BOOL)alwaysSyncSettings;
- (BOOL)applyAllowListToChildSections;
- (BOOL)hasDisplayedCriticalBulletins;
- (BOOL)hasLegacyMapInContext;
- (BOOL)hasLegacyMapInUserInfo;
- (BOOL)optOutOfAttachmentTransmission;
- (BOOL)optOutOfNotificationTuning;
- (BOOL)optOutOfSettingsCoordination;
- (BOOL)optOutOfSubtitleRemovalForOlderWatches;
- (BOOL)optOutOfWaitForUserIdle;
- (BOOL)overrideAppliesToCoordinationOptOut;
- (BOOL)shouldUsePhoneExpirationDate;
- (BOOL)updateCoordinationType:(unint64_t)a3;
- (NSArray)additionalBridgeSectionIDs;
- (NSArray)allowListedCategories;
- (NSArray)allowListedSubtypes;
- (NSArray)denyListedCategories;
- (NSMutableDictionary)denyListedCategoriesWithVersion;
- (NSNumber)watchVersionThatUsesAttachmentURL;
- (NSNumber)watchVersionThatUsesUserInfoForContext;
- (id)description;
- (unint64_t)coordinationType;
- (void)setAdditionalBridgeSectionIDs:(id)a3;
- (void)setAllowListedCategories:(id)a3;
- (void)setAllowListedSubtypes:(id)a3;
- (void)setAlwaysAlert:(BOOL)a3;
- (void)setAlwaysSyncSettings:(BOOL)a3;
- (void)setApplyAllowListToChildSections:(BOOL)a3;
- (void)setCoordinationType:(unint64_t)a3;
- (void)setDenyListedCategories:(id)a3;
- (void)setDenyListedCategoriesWithVersion:(id)a3;
- (void)setHasLegacyMapInContext:(BOOL)a3;
- (void)setHasLegacyMapInUserInfo:(BOOL)a3;
- (void)setOptOutOfAttachmentTransmission:(BOOL)a3;
- (void)setOptOutOfNotificationTuning:(BOOL)a3;
- (void)setOptOutOfSettingsCoordination:(BOOL)a3;
- (void)setOptOutOfSubtitleRemovalForOlderWatches:(BOOL)a3;
- (void)setOptOutOfWaitForUserIdle:(BOOL)a3;
- (void)setOverrideAppliesToCoordinationOptOut:(BOOL)a3;
- (void)setShouldUsePhoneExpirationDate:(BOOL)a3;
- (void)setWatchVersionThatUsesAttachmentURL:(id)a3;
- (void)setWatchVersionThatUsesUserInfoForContext:(id)a3;
@end

@implementation BLTSectionConfigurationItem

- (BLTSectionConfigurationItem)initWithDictionary:(id)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)BLTSectionConfigurationItem;
  v5 = [(BLTSectionConfigurationItem *)&v76 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"OptOutOfCoordination"];
    if (v6
      && (v7 = (void *)v6,
          [v4 objectForKeyedSubscript:@"OptOutOfCoordination"],
          v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 BOOLValue],
          v8,
          v7,
          (v9 & 1) != 0))
    {
      uint64_t v10 = 2;
    }
    else
    {
      uint64_t v11 = [v4 objectForKeyedSubscript:@"OptOutOfCoordinationForwardOnly"];
      uint64_t v10 = 0;
      if (v11)
      {
        v12 = (void *)v11;
        v13 = [v4 objectForKeyedSubscript:@"OptOutOfCoordinationForwardOnly"];
        char v14 = [v13 BOOLValue];

        if (v14) {
          uint64_t v10 = 1;
        }
      }
    }
    v5->_coordinationType = v10;
    v15 = [v4 objectForKeyedSubscript:@"OptOutOfAttachmentTransmission"];

    if (v15)
    {
      v16 = [v4 objectForKeyedSubscript:@"OptOutOfAttachmentTransmission"];
      v5->_optOutOfAttachmentTransmission = [v16 BOOLValue];
    }
    v17 = [v4 objectForKeyedSubscript:@"AllowListedSubtypes"];

    if (v17)
    {
      uint64_t v18 = [v4 objectForKeyedSubscript:@"AllowListedSubtypes"];
      allowListedSubtypes = v5->_allowListedSubtypes;
      v5->_allowListedSubtypes = (NSArray *)v18;
    }
    v20 = [v4 objectForKeyedSubscript:@"DenyListedCategories"];

    if (v20)
    {
      uint64_t v21 = [v4 objectForKeyedSubscript:@"DenyListedCategories"];
      denyListedCategories = v5->_denyListedCategories;
      v5->_denyListedCategories = (NSArray *)v21;
    }
    v23 = [v4 objectForKeyedSubscript:@"DenyListedCategoriesWithVersion"];
    if (v23)
    {
      id v71 = v4;
      uint64_t v24 = [MEMORY[0x263EFF9A0] dictionary];
      denyListedCategoriesWithVersion = v5->_denyListedCategoriesWithVersion;
      v5->_denyListedCategoriesWithVersion = (NSMutableDictionary *)v24;

      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      v70 = v23;
      id v26 = v23;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v72 objects:v77 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v73 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            uint64_t v32 = objc_msgSend(v31, "objectForKeyedSubscript:", @"Version", v70);
            if (v32)
            {
              v33 = (void *)v32;
              v34 = [v31 objectForKeyedSubscript:@"DenyListedCategories"];

              if (v34)
              {
                v35 = [v31 objectForKeyedSubscript:@"DenyListedCategories"];
                v36 = v5->_denyListedCategoriesWithVersion;
                v37 = [v31 objectForKeyedSubscript:@"Version"];
                [(NSMutableDictionary *)v36 setObject:v35 forKeyedSubscript:v37];
              }
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v72 objects:v77 count:16];
        }
        while (v28);
      }

      v23 = v70;
      id v4 = v71;
    }
    v38 = objc_msgSend(v4, "objectForKeyedSubscript:", @"AllowListedCategories", v70);

    if (v38)
    {
      uint64_t v39 = [v4 objectForKeyedSubscript:@"AllowListedCategories"];
      allowListedCategories = v5->_allowListedCategories;
      v5->_allowListedCategories = (NSArray *)v39;
    }
    v41 = [v4 objectForKeyedSubscript:@"AlwaysSyncSettings"];

    if (v41)
    {
      v42 = [v4 objectForKeyedSubscript:@"AlwaysSyncSettings"];
      v5->_alwaysSyncSettings = [v42 BOOLValue];
    }
    else
    {
      v5->_alwaysSyncSettings = 0;
    }
    v43 = [v4 objectForKeyedSubscript:@"AlwaysAlert"];

    if (v43)
    {
      v44 = [v4 objectForKeyedSubscript:@"AlwaysAlert"];
      v5->_alwaysAlert = [v44 BOOLValue];
    }
    v45 = [v4 objectForKeyedSubscript:@"OptOutOfWaitForUserIdle"];

    if (v45)
    {
      v46 = [v4 objectForKeyedSubscript:@"OptOutOfWaitForUserIdle"];
      v5->_optOutOfWaitForUserIdle = [v46 BOOLValue];
    }
    v47 = [v4 objectForKeyedSubscript:@"ApplyAllowListToChildSections"];

    if (v47)
    {
      v48 = [v4 objectForKeyedSubscript:@"ApplyAllowListToChildSections"];
      v5->_applyAllowListToChildSections = [v48 BOOLValue];
    }
    v49 = [v4 objectForKeyedSubscript:@"OptOutOfNotificationTuning"];

    if (v49)
    {
      v50 = [v4 objectForKeyedSubscript:@"OptOutOfNotificationTuning"];
      v5->_optOutOfNotificationTuning = [v50 BOOLValue];
    }
    v51 = [v4 objectForKeyedSubscript:@"HasLegacyMapInUserInfo"];

    if (v51)
    {
      v52 = [v4 objectForKeyedSubscript:@"HasLegacyMapInUserInfo"];
      v5->_hasLegacyMapInUserInfo = [v52 BOOLValue];
    }
    v53 = [v4 objectForKeyedSubscript:@"HasLegacyMapInContext"];

    if (v53)
    {
      v54 = [v4 objectForKeyedSubscript:@"HasLegacyMapInContext"];
      v5->_hasLegacyMapInContext = [v54 BOOLValue];
    }
    uint64_t v55 = [v4 objectForKeyedSubscript:@"WatchVersionThatUsesUserInfoForContext"];
    watchVersionThatUsesUserInfoForContext = v5->_watchVersionThatUsesUserInfoForContext;
    v5->_watchVersionThatUsesUserInfoForContext = (NSNumber *)v55;

    uint64_t v57 = [v4 objectForKeyedSubscript:@"AdditionalBridgeSectionIDs"];
    additionalBridgeSectionIDs = v5->_additionalBridgeSectionIDs;
    v5->_additionalBridgeSectionIDs = (NSArray *)v57;

    v59 = [v4 objectForKeyedSubscript:@"OptOutOfSubtitleRemovalForOlderWatches"];

    if (v59)
    {
      v60 = [v4 objectForKeyedSubscript:@"OptOutOfSubtitleRemovalForOlderWatches"];
      v5->_optOutOfSubtitleRemovalForOlderWatches = [v60 BOOLValue];
    }
    v61 = [v4 objectForKeyedSubscript:@"ShouldUsePhoneExpirationDate"];

    if (v61)
    {
      v62 = [v4 objectForKeyedSubscript:@"ShouldUsePhoneExpirationDate"];
      v5->_shouldUsePhoneExpirationDate = [v62 BOOLValue];
    }
    v63 = [v4 objectForKeyedSubscript:@"OptOutOfSettingsCoordination"];

    if (v63)
    {
      v64 = [v4 objectForKeyedSubscript:@"OptOutOfSettingsCoordination"];
      v5->_optOutOfSettingsCoordination = [v64 BOOLValue];
    }
    v65 = [v4 objectForKeyedSubscript:@"OverrideAppliesToCoordinationOptOut"];

    if (v65)
    {
      v66 = [v4 objectForKeyedSubscript:@"OverrideAppliesToCoordinationOptOut"];
      v5->_overrideAppliesToCoordinationOptOut = [v66 BOOLValue];
    }
    uint64_t v67 = [v4 objectForKeyedSubscript:@"WatchVersionThatUsesAttachmentURL"];
    watchVersionThatUsesAttachmentURL = v5->_watchVersionThatUsesAttachmentURL;
    v5->_watchVersionThatUsesAttachmentURL = (NSNumber *)v67;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(BLTSectionConfigurationItem *)self coordinationType];
  if (v4 > 2) {
    v5 = @"Unknown";
  }
  else {
    v5 = off_264684198[v4];
  }
  return (id)[v3 stringWithFormat:@"Coordinate: %@, Attachments: %d, Always sync settings: %d Always alert: %d Wait For User Idle: %d Apply AllowList to Child Sections: %d Notification Tuning: %d", v5, !self->_optOutOfAttachmentTransmission, self->_alwaysSyncSettings, self->_alwaysAlert, !self->_optOutOfWaitForUserIdle, self->_applyAllowListToChildSections, !self->_optOutOfNotificationTuning];
}

- (BOOL)hasDisplayedCriticalBulletins
{
  return 0;
}

- (BOOL)updateCoordinationType:(unint64_t)a3
{
  if (!self->_overrideAppliesToCoordinationOptOut) {
    return 0;
  }
  [(BLTSectionConfigurationItem *)self setCoordinationType:a3];
  return self->_overrideAppliesToCoordinationOptOut;
}

- (unint64_t)coordinationType
{
  return self->_coordinationType;
}

- (void)setCoordinationType:(unint64_t)a3
{
  self->_coordinationType = a3;
}

- (BOOL)optOutOfAttachmentTransmission
{
  return self->_optOutOfAttachmentTransmission;
}

- (void)setOptOutOfAttachmentTransmission:(BOOL)a3
{
  self->_optOutOfAttachmentTransmission = a3;
}

- (BOOL)alwaysSyncSettings
{
  return self->_alwaysSyncSettings;
}

- (void)setAlwaysSyncSettings:(BOOL)a3
{
  self->_alwaysSyncSettings = a3;
}

- (NSArray)allowListedSubtypes
{
  return self->_allowListedSubtypes;
}

- (void)setAllowListedSubtypes:(id)a3
{
}

- (NSArray)denyListedCategories
{
  return self->_denyListedCategories;
}

- (void)setDenyListedCategories:(id)a3
{
}

- (NSArray)allowListedCategories
{
  return self->_allowListedCategories;
}

- (void)setAllowListedCategories:(id)a3
{
}

- (BOOL)alwaysAlert
{
  return self->_alwaysAlert;
}

- (void)setAlwaysAlert:(BOOL)a3
{
  self->_alwaysAlert = a3;
}

- (BOOL)optOutOfWaitForUserIdle
{
  return self->_optOutOfWaitForUserIdle;
}

- (void)setOptOutOfWaitForUserIdle:(BOOL)a3
{
  self->_optOutOfWaitForUserIdle = a3;
}

- (BOOL)applyAllowListToChildSections
{
  return self->_applyAllowListToChildSections;
}

- (void)setApplyAllowListToChildSections:(BOOL)a3
{
  self->_applyAllowListToChildSections = a3;
}

- (BOOL)optOutOfNotificationTuning
{
  return self->_optOutOfNotificationTuning;
}

- (void)setOptOutOfNotificationTuning:(BOOL)a3
{
  self->_optOutOfNotificationTuning = a3;
}

- (BOOL)hasLegacyMapInUserInfo
{
  return self->_hasLegacyMapInUserInfo;
}

- (void)setHasLegacyMapInUserInfo:(BOOL)a3
{
  self->_hasLegacyMapInUserInfo = a3;
}

- (BOOL)hasLegacyMapInContext
{
  return self->_hasLegacyMapInContext;
}

- (void)setHasLegacyMapInContext:(BOOL)a3
{
  self->_hasLegacyMapInContext = a3;
}

- (NSNumber)watchVersionThatUsesUserInfoForContext
{
  return self->_watchVersionThatUsesUserInfoForContext;
}

- (void)setWatchVersionThatUsesUserInfoForContext:(id)a3
{
}

- (NSArray)additionalBridgeSectionIDs
{
  return self->_additionalBridgeSectionIDs;
}

- (void)setAdditionalBridgeSectionIDs:(id)a3
{
}

- (BOOL)optOutOfSubtitleRemovalForOlderWatches
{
  return self->_optOutOfSubtitleRemovalForOlderWatches;
}

- (void)setOptOutOfSubtitleRemovalForOlderWatches:(BOOL)a3
{
  self->_optOutOfSubtitleRemovalForOlderWatches = a3;
}

- (BOOL)shouldUsePhoneExpirationDate
{
  return self->_shouldUsePhoneExpirationDate;
}

- (void)setShouldUsePhoneExpirationDate:(BOOL)a3
{
  self->_shouldUsePhoneExpirationDate = a3;
}

- (BOOL)optOutOfSettingsCoordination
{
  return self->_optOutOfSettingsCoordination;
}

- (void)setOptOutOfSettingsCoordination:(BOOL)a3
{
  self->_optOutOfSettingsCoordination = a3;
}

- (BOOL)overrideAppliesToCoordinationOptOut
{
  return self->_overrideAppliesToCoordinationOptOut;
}

- (void)setOverrideAppliesToCoordinationOptOut:(BOOL)a3
{
  self->_overrideAppliesToCoordinationOptOut = a3;
}

- (NSNumber)watchVersionThatUsesAttachmentURL
{
  return self->_watchVersionThatUsesAttachmentURL;
}

- (void)setWatchVersionThatUsesAttachmentURL:(id)a3
{
}

- (NSMutableDictionary)denyListedCategoriesWithVersion
{
  return self->_denyListedCategoriesWithVersion;
}

- (void)setDenyListedCategoriesWithVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denyListedCategoriesWithVersion, 0);
  objc_storeStrong((id *)&self->_watchVersionThatUsesAttachmentURL, 0);
  objc_storeStrong((id *)&self->_additionalBridgeSectionIDs, 0);
  objc_storeStrong((id *)&self->_watchVersionThatUsesUserInfoForContext, 0);
  objc_storeStrong((id *)&self->_allowListedCategories, 0);
  objc_storeStrong((id *)&self->_denyListedCategories, 0);
  objc_storeStrong((id *)&self->_allowListedSubtypes, 0);
}

@end