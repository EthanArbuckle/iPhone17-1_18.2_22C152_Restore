@interface BLTSectionConfigurationInternal
- (BLTSectionConfigurationInternal)init;
- (BOOL)applyAllowListToChildSections:(id)a3;
- (BOOL)hasSectionIDDisplayedCriticalBulletins:(id)a3;
- (BOOL)hasSectionIDOptedOutOfAttachmentCoordination:(id)a3;
- (BOOL)hasSectionIDOptedOutOfNotificationTuning:(id)a3;
- (BOOL)hasSectionIDOptedOutOfSettingsCoordination:(id)a3;
- (BOOL)hasSectionIDOptedOutOfSubtitleRemovalForOlderWatches:(id)a3;
- (BOOL)hasSectionIDOptedOutOfWaitForUserIdle:(id)a3;
- (BOOL)setCoordinationType:(unint64_t)a3 sectionID:(id)a4;
- (BOOL)shouldSectionIDAlwaysAlert:(id)a3 category:(id)a4;
- (BOOL)shouldSectionIDSettingsAlwaysSync:(id)a3;
- (BOOL)shouldUsePhoneExpirationDateForSectionID:(id)a3;
- (id)_loadConfigurations;
- (id)additionalBridgeSectionIDsForSectionID:(id)a3;
- (id)watchVersionThatUsesAttachmentURLForSectionID:(id)a3;
- (id)watchVersionThatUsesUserInfoForContextForSectionID:(id)a3;
- (unint64_t)coordinationTypeForSectionID:(id)a3 subtype:(int64_t)a4;
- (unint64_t)coordinationTypeForSectionID:(id)a3 subtype:(int64_t)a4 category:(id)a5;
- (unint64_t)legacyMapLocationForSectionID:(id)a3;
@end

@implementation BLTSectionConfigurationInternal

- (BLTSectionConfigurationInternal)init
{
  v7.receiver = self;
  v7.super_class = (Class)BLTSectionConfigurationInternal;
  v2 = [(BLTSectionConfigurationInternal *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(BLTSectionConfigurationInternal *)v2 _loadConfigurations];
    configurations = v3->_configurations;
    v3->_configurations = (NSDictionary *)v4;
  }
  return v3;
}

- (unint64_t)coordinationTypeForSectionID:(id)a3 subtype:(int64_t)a4
{
  return [(BLTSectionConfigurationInternal *)self coordinationTypeForSectionID:a3 subtype:a4 category:0];
}

- (unint64_t)coordinationTypeForSectionID:(id)a3 subtype:(int64_t)a4 category:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:v8];
  unint64_t v11 = [v10 coordinationTypeWithSubtype:a4];
  v12 = objc_msgSend(MEMORY[0x263F57730], "blt_boundedWaitForActivePairedDevice");
  unint64_t v13 = [v12 bltVersion];

  if (v11 == 2)
  {
    if (v13 >= 4)
    {
      if (a4 == 0xFFFFFFFF80000000)
      {
        v14 = [v10 allowListedSubtypes];
        BOOL v15 = [v14 count] != 0;
      }
      else
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v18 = [v10 allowListedSubtypes];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v34;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v34 != v20) {
                objc_enumerationMutation(v18);
              }
              if ([*(id *)(*((void *)&v33 + 1) + 8 * i) integerValue] == a4)
              {
                BOOL v15 = 1;
                goto LABEL_22;
              }
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }
        BOOL v15 = 0;
LABEL_22:
      }
      if (v15 || !v9 || v13 < 7)
      {
        if (!v15) {
          goto LABEL_27;
        }
      }
      else
      {
        v23 = [v10 allowListedCategories];
        char v24 = [v23 containsObject:v9];

        if ((v24 & 1) == 0) {
          goto LABEL_27;
        }
      }
      unint64_t v11 = 0;
      goto LABEL_30;
    }
LABEL_27:
    unint64_t v11 = 2;
    goto LABEL_30;
  }
  if (v9 && v13 >= 6)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    v16 = [v10 denyListedCategories];
    char v17 = [v16 containsObject:v9];

    char v32 = v17;
    if (*((unsigned char *)v30 + 24))
    {
      unint64_t v11 = 2;
    }
    else
    {
      v22 = [v10 denyListedCategoriesWithVersion];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __81__BLTSectionConfigurationInternal_coordinationTypeForSectionID_subtype_category___block_invoke;
      v26[3] = &unk_264684150;
      v28 = &v29;
      id v27 = v9;
      [v22 enumerateKeysAndObjectsUsingBlock:v26];

      if (*((unsigned char *)v30 + 24)) {
        unint64_t v11 = 2;
      }
    }
    _Block_object_dispose(&v29, 8);
  }
LABEL_30:

  return v11;
}

void __81__BLTSectionConfigurationInternal_coordinationTypeForSectionID_subtype_category___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ((objc_msgSend(MEMORY[0x263F57700], "activePairedDeviceSupportIsGreaterEqualVersion:", objc_msgSend(a2, "unsignedIntValue")) & 1) == 0)*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "containsObject:", *(void *)(a1 + 32)); {
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (BOOL)hasSectionIDOptedOutOfAttachmentCoordination:(id)a3
{
  v3 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:a3];
  char v4 = [v3 optOutOfAttachmentTransmission];

  return v4;
}

- (BOOL)shouldSectionIDSettingsAlwaysSync:(id)a3
{
  v3 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:a3];
  char v4 = [v3 alwaysSyncSettings];

  return v4;
}

- (BOOL)shouldSectionIDAlwaysAlert:(id)a3 category:(id)a4
{
  id v6 = a4;
  id v7 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:a3];
  id v8 = v7;
  if (v6
    && ([v7 denyListedCategories],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 containsObject:v6],
        v9,
        (v10 & 1) != 0))
  {
    char v11 = 0;
  }
  else
  {
    char v11 = [v8 alwaysAlert];
  }

  return v11;
}

- (BOOL)hasSectionIDOptedOutOfWaitForUserIdle:(id)a3
{
  v3 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:a3];
  char v4 = [v3 optOutOfWaitForUserIdle];

  return v4;
}

- (BOOL)hasSectionIDOptedOutOfNotificationTuning:(id)a3
{
  v3 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:a3];
  char v4 = [v3 optOutOfNotificationTuning];

  return v4;
}

- (BOOL)hasSectionIDDisplayedCriticalBulletins:(id)a3
{
  v3 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:a3];
  char v4 = [v3 hasDisplayedCriticalBulletins];

  return v4;
}

- (BOOL)applyAllowListToChildSections:(id)a3
{
  v3 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:a3];
  char v4 = [v3 applyAllowListToChildSections];

  return v4;
}

- (unint64_t)legacyMapLocationForSectionID:(id)a3
{
  v3 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 hasLegacyMapInUserInfo];

  return v4;
}

- (id)watchVersionThatUsesUserInfoForContextForSectionID:(id)a3
{
  v3 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 watchVersionThatUsesUserInfoForContext];

  return v4;
}

- (id)additionalBridgeSectionIDsForSectionID:(id)a3
{
  v3 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 additionalBridgeSectionIDs];

  return v4;
}

- (BOOL)hasSectionIDOptedOutOfSubtitleRemovalForOlderWatches:(id)a3
{
  v3 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:a3];
  char v4 = [v3 optOutOfSubtitleRemovalForOlderWatches];

  return v4;
}

- (id)_loadConfigurations
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"SectionConfiguration" ofType:@"plist"];

  char v4 = [NSDictionary dictionaryWithContentsOfFile:v3];
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__BLTSectionConfigurationInternal__loadConfigurations__block_invoke;
  v8[3] = &unk_264684178;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __54__BLTSectionConfigurationInternal__loadConfigurations__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[BLTSectionConfigurationItemFactory itemForSection:v5 dictionary:a3];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (BOOL)shouldUsePhoneExpirationDateForSectionID:(id)a3
{
  v3 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:a3];
  char v4 = [v3 shouldUsePhoneExpirationDate];

  return v4;
}

- (BOOL)hasSectionIDOptedOutOfSettingsCoordination:(id)a3
{
  v3 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:a3];
  char v4 = [v3 optOutOfSettingsCoordination];

  return v4;
}

- (BOOL)setCoordinationType:(unint64_t)a3 sectionID:(id)a4
{
  id v5 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:a4];
  LOBYTE(a3) = [v5 updateCoordinationType:a3];

  return a3;
}

- (id)watchVersionThatUsesAttachmentURLForSectionID:(id)a3
{
  v3 = [(NSDictionary *)self->_configurations objectForKeyedSubscript:a3];
  char v4 = [v3 watchVersionThatUsesAttachmentURL];

  return v4;
}

- (void).cxx_destruct
{
}

@end