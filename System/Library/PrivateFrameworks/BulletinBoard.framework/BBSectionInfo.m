@interface BBSectionInfo
+ (BOOL)supportsSecureCoding;
+ (id)defaultSectionInfoForSection:(id)a3;
+ (id)defaultSectionInfoForType:(int64_t)a3;
- (BBMuteAssertion)muteAssertion;
- (BBSectionIcon)icon;
- (BBSectionInfo)init;
- (BBSectionInfo)initWithCoder:(id)a3;
- (BBSectionInfo)initWithDefaultsForSectionType:(int64_t)a3;
- (BBSectionInfo)initWithUNCSectionInfo:(id)a3 parentSection:(id)a4;
- (BBSectionInfo)parentSection;
- (BBSectionInfoSettings)managedSectionInfoSettings;
- (BBSectionInfoSettings)readableSettings;
- (BBSectionInfoSettings)sectionInfoSettings;
- (BBSectionInfoSettings)writableSettings;
- (BOOL)_isDeliveredQuietly;
- (BOOL)allowsNotifications;
- (BOOL)enabled;
- (BOOL)hasEnabledSettings;
- (BOOL)hasUserConfiguredDirectMessagesSetting;
- (BOOL)hasUserConfiguredTimeSensitiveSetting;
- (BOOL)hideWeeApp;
- (BOOL)isAppClip;
- (BOOL)isBulletinMutedForThreadIdentifier:(id)a3;
- (BOOL)isDeliveredQuietly;
- (BOOL)isEqual:(id)a3;
- (BOOL)isModificationAllowed;
- (BOOL)isRestricted;
- (BOOL)showsCustomSettingsLink;
- (BOOL)showsInLockScreen;
- (BOOL)showsInNotificationCenter;
- (BOOL)showsMessagePreview;
- (BOOL)showsOnExternalDevices;
- (BOOL)suppressFromSettings;
- (BOOL)usesManagedSettings;
- (NSArray)dataProviderIDs;
- (NSArray)subsections;
- (NSData)iconData;
- (NSDate)authorizationExpirationDate;
- (NSDate)lastUserGrantedAuthorizationDate;
- (NSDictionary)stateCapture;
- (NSString)appName;
- (NSString)customSettingsBundle;
- (NSString)customSettingsDetailControllerClass;
- (NSString)displayName;
- (NSString)factorySectionID;
- (NSString)pathToWeeAppPluginBundle;
- (NSString)sectionID;
- (NSString)subsectionID;
- (id)_subsectionForID:(id)a3;
- (id)_suppressedSettingsList:(unint64_t)a3;
- (id)copyFromManagedSettings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectiveSectionInfoWithDefaultContentPreviewSetting:(int64_t)a3 globalAnnounceSetting:(int64_t)a4 globalScheduledDeliverySetting:(int64_t)a5 globalSummarizationSetting:(int64_t)a6 hasPairedVehiclesForCarPlay:(BOOL)a7 hasDestinationForRemoteNotifications:(BOOL)a8;
- (id)effectiveSectionInfoWithFactoryInfo:(id)a3 defaultContentPreviewSetting:(int64_t)a4 globalAnnounceSetting:(int64_t)a5 globalScheduledDeliverySetting:(int64_t)a6 globalSummarizationSetting:(int64_t)a7 hasPairedVehiclesForCarPlay:(BOOL)a8 hasDestinationForRemoteNotifications:(BOOL)a9;
- (id)toUNCSectionInfoWithParentSection:(id)a3;
- (int64_t)announceSetting;
- (int64_t)authorizationStatus;
- (int64_t)bulletinGroupingSetting;
- (int64_t)carPlaySetting;
- (int64_t)contentPreviewSetting;
- (int64_t)criticalAlertSetting;
- (int64_t)directMessagesSetting;
- (int64_t)disabledSettingForSetting:(int64_t)a3;
- (int64_t)lockScreenSetting;
- (int64_t)notificationCenterSetting;
- (int64_t)remoteNotificationsSetting;
- (int64_t)scheduledDeliverySetting;
- (int64_t)sectionCategory;
- (int64_t)sectionType;
- (int64_t)spokenNotificationSetting;
- (int64_t)subsectionPriority;
- (int64_t)summarizationSetting;
- (int64_t)timeSensitiveSetting;
- (unint64_t)alertType;
- (unint64_t)bulletinCount;
- (unint64_t)hash;
- (unint64_t)notificationCenterLimit;
- (unint64_t)pushSettings;
- (unint64_t)suppressedSettings;
- (unint64_t)version;
- (void)_addSubsection:(id)a3;
- (void)_associateDataProviderSectionInfo:(id)a3;
- (void)_configureWithDefaultsForSectionType:(int64_t)a3;
- (void)_deliverQuietly:(BOOL)a3;
- (void)_dissociateDataProviderSectionInfo:(id)a3;
- (void)_replaceSubsection:(id)a3;
- (void)deliverQuietly:(BOOL)a3;
- (void)deliverQuietly:(BOOL)a3 changeAuthorizationStatus:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)makeAuthorizationPermanent;
- (void)muteSectionUntilDate:(id)a3;
- (void)muteThreadIdentifier:(id)a3 untilDate:(id)a4;
- (void)queryAndUseManagedSettings;
- (void)queryAndUseManagedSettingsForSectionID:(id)a3;
- (void)setAlertType:(unint64_t)a3;
- (void)setAllowsNotifications:(BOOL)a3;
- (void)setAnnounceSetting:(int64_t)a3;
- (void)setAppName:(id)a3;
- (void)setAuthorizationExpirationDate:(id)a3;
- (void)setAuthorizationStatus:(int64_t)a3;
- (void)setBulletinGroupingSetting:(int64_t)a3;
- (void)setCarPlaySetting:(int64_t)a3;
- (void)setContentPreviewSetting:(int64_t)a3;
- (void)setCriticalAlertSetting:(int64_t)a3;
- (void)setCustomSettingsBundle:(id)a3;
- (void)setCustomSettingsDetailControllerClass:(id)a3;
- (void)setDataProviderIDs:(id)a3;
- (void)setDirectMessagesSetting:(int64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFactorySectionID:(id)a3;
- (void)setHideWeeApp:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIsAppClip:(BOOL)a3;
- (void)setIsModificationAllowed:(BOOL)a3;
- (void)setIsRestricted:(BOOL)a3;
- (void)setLastUserGrantedAuthorizationDate:(id)a3;
- (void)setLockScreenSetting:(int64_t)a3;
- (void)setManagedSectionInfoSettings:(id)a3;
- (void)setMuteAssertion:(id)a3;
- (void)setNotificationCenterSetting:(int64_t)a3;
- (void)setParentSection:(id)a3;
- (void)setPathToWeeAppPluginBundle:(id)a3;
- (void)setPushSettings:(unint64_t)a3;
- (void)setRemoteNotificationsSetting:(int64_t)a3;
- (void)setScheduledDeliverySetting:(int64_t)a3;
- (void)setSectionCategory:(int64_t)a3;
- (void)setSectionID:(id)a3;
- (void)setSectionInfoSettings:(id)a3;
- (void)setSectionType:(int64_t)a3;
- (void)setShowsCustomSettingsLink:(BOOL)a3;
- (void)setShowsInLockScreen:(BOOL)a3;
- (void)setShowsInNotificationCenter:(BOOL)a3;
- (void)setShowsMessagePreview:(BOOL)a3;
- (void)setShowsOnExternalDevices:(BOOL)a3;
- (void)setSpokenNotificationSetting:(int64_t)a3;
- (void)setSubsectionID:(id)a3;
- (void)setSubsectionPriority:(int64_t)a3;
- (void)setSubsections:(id)a3;
- (void)setSummarizationSetting:(int64_t)a3;
- (void)setSuppressFromSettings:(BOOL)a3;
- (void)setSuppressedSettings:(unint64_t)a3;
- (void)setTimeSensitiveSetting:(int64_t)a3;
- (void)setUserConfiguredDirectMessagesSetting:(BOOL)a3;
- (void)setUserConfiguredTimeSensitiveSetting:(BOOL)a3;
- (void)setVersion:(unint64_t)a3;
- (void)unmuteSection;
- (void)unmuteThreadIdentifier:(id)a3;
- (void)updateWithDefaultSectionInfo:(id)a3;
@end

@implementation BBSectionInfo

- (BOOL)isEqual:(id)a3
{
  v4 = (BBSectionInfo *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v5 = v4;
      v6 = [(BBSectionInfo *)self sectionID];
      v7 = [(BBSectionInfo *)v5 sectionID];
      if (BSEqualStrings())
      {
        v8 = [(BBSectionInfo *)self subsectionID];
        v9 = [(BBSectionInfo *)v5 subsectionID];
        if (BSEqualStrings()
          && (int64_t v10 = [(BBSectionInfo *)self sectionType],
              v10 == [(BBSectionInfo *)v5 sectionType])
          && (BOOL v11 = [(BBSectionInfo *)self isAppClip], v11 == [(BBSectionInfo *)v5 isAppClip])
          && (BOOL v12 = [(BBSectionInfo *)self isModificationAllowed],
              v12 == [(BBSectionInfo *)v5 isModificationAllowed])
          && (BOOL v13 = [(BBSectionInfo *)self isRestricted],
              v13 == [(BBSectionInfo *)v5 isRestricted])
          && (int64_t v14 = [(BBSectionInfo *)self sectionCategory],
              v14 == [(BBSectionInfo *)v5 sectionCategory])
          && (BOOL v15 = [(BBSectionInfo *)self suppressFromSettings],
              v15 == [(BBSectionInfo *)v5 suppressFromSettings]))
        {
          v18 = [(BBSectionInfo *)self sectionInfoSettings];
          v19 = [(BBSectionInfo *)v5 sectionInfoSettings];
          if (BSEqualObjects())
          {
            v20 = [(BBSectionInfo *)self managedSectionInfoSettings];
            v58 = [(BBSectionInfo *)v5 managedSectionInfoSettings];
            if (BSEqualObjects())
            {
              v57 = v20;
              unint64_t v21 = [(BBSectionInfo *)self suppressedSettings];
              if (v21 == [(BBSectionInfo *)v5 suppressedSettings])
              {
                uint64_t v22 = [(BBSectionInfo *)self subsections];
                v55 = [(BBSectionInfo *)v5 subsections];
                v56 = (void *)v22;
                if (BSEqualObjects())
                {
                  v54 = [(BBSectionInfo *)self parentSection];
                  uint64_t v23 = [v54 sectionID];
                  v52 = [(BBSectionInfo *)v5 parentSection];
                  [v52 sectionID];
                  v51 = v53 = (void *)v23;
                  if (BSEqualStrings()
                    && (int64_t v24 = [(BBSectionInfo *)self subsectionPriority],
                        v24 == [(BBSectionInfo *)v5 subsectionPriority])
                    && (unint64_t v25 = [(BBSectionInfo *)self version], v25 == [(BBSectionInfo *)v5 version]))
                  {
                    uint64_t v26 = [(BBSectionInfo *)self appName];
                    [(BBSectionInfo *)v5 appName];
                    v50 = v49 = (void *)v26;
                    if (BSEqualStrings())
                    {
                      uint64_t v27 = [(BBSectionInfo *)self displayName];
                      v47 = [(BBSectionInfo *)v5 displayName];
                      v48 = (void *)v27;
                      if (BSEqualStrings())
                      {
                        uint64_t v28 = [(BBSectionInfo *)self icon];
                        v45 = [(BBSectionInfo *)v5 icon];
                        v46 = (void *)v28;
                        if (BSEqualObjects())
                        {
                          uint64_t v29 = [(BBSectionInfo *)self factorySectionID];
                          v43 = [(BBSectionInfo *)v5 factorySectionID];
                          v44 = (void *)v29;
                          if (BSEqualStrings())
                          {
                            uint64_t v30 = [(BBSectionInfo *)self dataProviderIDs];
                            v41 = [(BBSectionInfo *)v5 dataProviderIDs];
                            v42 = (void *)v30;
                            if (BSEqualObjects())
                            {
                              uint64_t v31 = [(BBSectionInfo *)self customSettingsBundle];
                              v39 = [(BBSectionInfo *)v5 customSettingsBundle];
                              v40 = (void *)v31;
                              if (BSEqualStrings())
                              {
                                uint64_t v32 = [(BBSectionInfo *)self customSettingsDetailControllerClass];
                                v37 = [(BBSectionInfo *)v5 customSettingsDetailControllerClass];
                                v38 = (void *)v32;
                                if (BSEqualStrings())
                                {
                                  uint64_t v33 = [(BBSectionInfo *)self pathToWeeAppPluginBundle];
                                  [(BBSectionInfo *)v5 pathToWeeAppPluginBundle];
                                  v34 = v36 = (void *)v33;
                                  if (BSEqualStrings())
                                  {
                                    BOOL v35 = [(BBSectionInfo *)self hideWeeApp];
                                    BOOL v16 = v35 ^ [(BBSectionInfo *)v5 hideWeeApp] ^ 1;
                                  }
                                  else
                                  {
                                    LOBYTE(v16) = 0;
                                  }
                                }
                                else
                                {
                                  LOBYTE(v16) = 0;
                                }
                              }
                              else
                              {
                                LOBYTE(v16) = 0;
                              }
                            }
                            else
                            {
                              LOBYTE(v16) = 0;
                            }
                          }
                          else
                          {
                            LOBYTE(v16) = 0;
                          }
                        }
                        else
                        {
                          LOBYTE(v16) = 0;
                        }
                      }
                      else
                      {
                        LOBYTE(v16) = 0;
                      }
                    }
                    else
                    {
                      LOBYTE(v16) = 0;
                    }
                  }
                  else
                  {
                    LOBYTE(v16) = 0;
                  }
                }
                else
                {
                  LOBYTE(v16) = 0;
                }
              }
              else
              {
                LOBYTE(v16) = 0;
              }
              v20 = v57;
            }
            else
            {
              LOBYTE(v16) = 0;
            }
          }
          else
          {
            LOBYTE(v16) = 0;
          }
        }
        else
        {
          LOBYTE(v16) = 0;
        }
      }
      else
      {
        LOBYTE(v16) = 0;
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (id)effectiveSectionInfoWithDefaultContentPreviewSetting:(int64_t)a3 globalAnnounceSetting:(int64_t)a4 globalScheduledDeliverySetting:(int64_t)a5 globalSummarizationSetting:(int64_t)a6 hasPairedVehiclesForCarPlay:(BOOL)a7 hasDestinationForRemoteNotifications:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v67 = a7;
  BOOL v12 = self;
  uint64_t v78 = *MEMORY[0x263EF8340];
  BOOL v13 = [(BBSectionInfo *)self parentSection];
  if (!v13)
  {
    v17 = [(BBSectionInfo *)v12 subsections];
    uint64_t v18 = [v17 count];

    if (!v18) {
      goto LABEL_41;
    }
    id v19 = [(BBSectionInfo *)v12 copyFromManagedSettings];
    id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v53 = v12;
    unint64_t v21 = [(BBSectionInfo *)v12 subsections];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v72 objects:v77 count:16];
    int64_t v65 = a4;
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v73 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = [*(id *)(*((void *)&v72 + 1) + 8 * i) effectiveSectionInfoWithDefaultContentPreviewSetting:a3 globalAnnounceSetting:a4 globalScheduledDeliverySetting:a5 globalSummarizationSetting:a6 hasPairedVehiclesForCarPlay:v67 hasDestinationForRemoteNotifications:v8];
          [v20 addObject:v26];

          a4 = v65;
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v72 objects:v77 count:16];
      }
      while (v23);
    }

    int v27 = [v19 suppressedSettings];
    int v28 = v27;
    if ((v27 & 2) != 0)
    {
      uint64_t v64 = 0;
      if ((v27 & 4) != 0) {
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v64 = [v19 lockScreenSetting];
      if ((v28 & 4) != 0)
      {
LABEL_36:
        int v55 = 0;
        if ((v28 & 1) == 0) {
          goto LABEL_37;
        }
        goto LABEL_59;
      }
    }
    int v55 = [v19 showsOnExternalDevices];
    if ((v28 & 1) == 0)
    {
LABEL_37:
      uint64_t v63 = [v19 notificationCenterSetting];
      if ((v28 & 0x40) == 0) {
        goto LABEL_38;
      }
      goto LABEL_60;
    }
LABEL_59:
    uint64_t v63 = 0;
    if ((v28 & 0x40) == 0)
    {
LABEL_38:
      uint64_t v62 = [v19 contentPreviewSetting];
      if ((v28 & 0x2000) != 0) {
        goto LABEL_39;
      }
      goto LABEL_61;
    }
LABEL_60:
    uint64_t v62 = 0;
    if ((v28 & 0x2000) != 0)
    {
LABEL_39:
      uint64_t v29 = 0;
      if ((v28 & 0x4000) != 0)
      {
LABEL_40:
        uint64_t v30 = 0;
        goto LABEL_63;
      }
LABEL_62:
      uint64_t v30 = [v19 pushSettings] & 0x12;
LABEL_63:
      int64_t v52 = a3;
      if ((v28 & 0x20) != 0)
      {
        unint64_t v54 = 0;
        uint64_t v31 = v30 | v29;
        if ((v28 & 0x80) == 0)
        {
LABEL_65:
          uint64_t v61 = [v19 carPlaySetting];
          if ((v28 & 0x10000) == 0) {
            goto LABEL_66;
          }
          goto LABEL_74;
        }
      }
      else
      {
        uint64_t v31 = v29 | v30 | [v19 pushSettings] & 0x24;
        unint64_t v54 = [v19 alertType];
        if ((v28 & 0x80) == 0) {
          goto LABEL_65;
        }
      }
      uint64_t v61 = 0;
      if ((v28 & 0x10000) == 0)
      {
LABEL_66:
        uint64_t v60 = [v19 remoteNotificationsSetting];
        if ((v28 & 0x100) == 0) {
          goto LABEL_67;
        }
        goto LABEL_75;
      }
LABEL_74:
      uint64_t v60 = 0;
      if ((v28 & 0x100) == 0)
      {
LABEL_67:
        uint64_t v59 = [v19 criticalAlertSetting];
        if ((v28 & 0x400) == 0) {
          goto LABEL_68;
        }
        goto LABEL_76;
      }
LABEL_75:
      uint64_t v59 = 0;
      if ((v28 & 0x400) == 0)
      {
LABEL_68:
        uint64_t v32 = [v19 announceSetting];
        if ((v28 & 0x800) == 0) {
          goto LABEL_69;
        }
        goto LABEL_77;
      }
LABEL_76:
      uint64_t v32 = 0;
      if ((v28 & 0x800) == 0)
      {
LABEL_69:
        uint64_t v58 = [v19 timeSensitiveSetting];
        if ((v28 & 0x1000) == 0) {
          goto LABEL_70;
        }
        goto LABEL_78;
      }
LABEL_77:
      uint64_t v58 = 0;
      if ((v28 & 0x1000) == 0)
      {
LABEL_70:
        uint64_t v57 = [v19 scheduledDeliverySetting];
        if ((v28 & 0x8000) == 0)
        {
LABEL_71:
          uint64_t v56 = [v19 directMessagesSetting];
          goto LABEL_80;
        }
LABEL_79:
        uint64_t v56 = 0;
LABEL_80:
        BOOL v50 = v8;
        if ((v28 & 0x20000) != 0) {
          uint64_t v33 = 0;
        }
        else {
          uint64_t v33 = [v19 summarizationSetting];
        }
        int64_t v51 = a6;
        BOOL v8 = (BOOL)v19;
        [v19 setSubsections:0];
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v34 = v20;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v68 objects:v76 count:16];
        if (!v35)
        {
LABEL_135:

          int64_t v14 = (BBSectionInfo *)v8;
          [(id)v8 setLockScreenSetting:v64];
          [(id)v8 setShowsOnExternalDevices:v55 & 1];
          [(id)v8 setNotificationCenterSetting:v63];
          [(id)v8 setPushSettings:v31];
          [(id)v8 setAlertType:v54];
          [(id)v8 setContentPreviewSetting:v62];
          [(id)v8 setAnnounceSetting:v32];
          [(id)v8 setCarPlaySetting:v61];
          [(id)v8 setRemoteNotificationsSetting:v60];
          [(id)v8 setCriticalAlertSetting:v59];
          [(id)v8 setTimeSensitiveSetting:v58];
          [(id)v8 setScheduledDeliverySetting:v57];
          [(id)v8 setDirectMessagesSetting:v56];
          [(id)v8 setSummarizationSetting:v33];

          BOOL v12 = v53;
          BOOL v13 = 0;
          a6 = v51;
          a3 = v52;
          LOBYTE(v8) = v50;
          a4 = v65;
          goto LABEL_136;
        }
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v69;
LABEL_85:
        uint64_t v38 = 0;
        while (1)
        {
          if (*(void *)v69 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v68 + 1) + 8 * v38);
          [(id)v8 _addSubsection:v39];
          if ([v39 sectionType] != 2) {
            goto LABEL_133;
          }
          if ((v28 & 0x2000) != 0)
          {
            v31 |= [v39 pushSettings] & 9;
            if ((v28 & 0x4000) == 0)
            {
LABEL_91:
              if ((v28 & 0x20) != 0) {
                goto LABEL_95;
              }
              goto LABEL_97;
            }
          }
          else if ((v28 & 0x4000) == 0)
          {
            goto LABEL_91;
          }
          v31 |= [v39 pushSettings] & 0x12;
          if ((v28 & 0x20) != 0)
          {
LABEL_95:
            v31 |= [v39 pushSettings] & 0x24;
            if ([v39 alertType] > v54) {
              unint64_t v54 = [v39 alertType];
            }
          }
LABEL_97:
          if ((v28 & 2) != 0 && v64 != 2) {
            uint64_t v64 = [v39 lockScreenSetting];
          }
          if ((v28 & 4) != 0) {
            v55 |= [v39 showsOnExternalDevices];
          }
          if ((v28 & 1) != 0 && v63 != 2) {
            uint64_t v63 = [v39 notificationCenterSetting];
          }
          if ((v28 & 0x40) != 0 && v62 != 1) {
            uint64_t v62 = [v39 contentPreviewSetting];
          }
          if ((v28 & 0x80) != 0 && v61 != 2) {
            uint64_t v61 = [v39 carPlaySetting];
          }
          if ((v28 & 0x10000) != 0 && v60 != 2) {
            uint64_t v60 = [v39 remoteNotificationsSetting];
          }
          if ((v28 & 0x400) != 0 && v32 != 2 && v32 != 3) {
            uint64_t v32 = [v39 announceSetting];
          }
          if ((v28 & 0x100) != 0 && v59 != 2) {
            uint64_t v59 = [v39 criticalAlertSetting];
          }
          if ((v28 & 0x800) != 0 && v58 != 2) {
            uint64_t v58 = [v39 timeSensitiveSetting];
          }
          if ((v28 & 0x1000) != 0 && v57 != 2) {
            uint64_t v57 = [v39 scheduledDeliverySetting];
          }
          if ((v28 & 0x8000) != 0 && v56 != 2) {
            uint64_t v56 = [v39 directMessagesSetting];
          }
          if ((v28 & 0x20000) != 0 && v33 != 2) {
            uint64_t v33 = [v39 summarizationSetting];
          }
LABEL_133:
          if (v36 == ++v38)
          {
            uint64_t v36 = [v34 countByEnumeratingWithState:&v68 objects:v76 count:16];
            if (!v36) {
              goto LABEL_135;
            }
            goto LABEL_85;
          }
        }
      }
LABEL_78:
      uint64_t v57 = 0;
      if ((v28 & 0x8000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_79;
    }
LABEL_61:
    uint64_t v29 = [v19 pushSettings] & 9;
    if ((v28 & 0x4000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_62;
  }
  if ([(BBSectionInfo *)v12 sectionType] != 2)
  {
LABEL_41:
    int64_t v14 = 0;
    goto LABEL_136;
  }
  int64_t v14 = [(BBSectionInfo *)v12 copyFromManagedSettings];
  if (([v13 allowsNotifications] & 1) == 0) {
    -[BBSectionInfo setAuthorizationStatus:](v14, "setAuthorizationStatus:", [v13 authorizationStatus]);
  }
  if (([v13 suppressedSettings] & 0x2000) == 0
    && ([v13 pushSettings] & 1) != 0
    && ([v13 pushSettings] & 8) == 0
    && ([(BBSectionInfo *)v14 pushSettings] & 1) != 0)
  {
    [(BBSectionInfo *)v14 setPushSettings:[(BBSectionInfo *)v14 pushSettings] & 0xFFFFFFFFFFFFFFF7];
  }
  int v15 = [(BBSectionInfo *)v14 suppressedSettings];
  int v16 = v15;
  if (v15)
  {
    -[BBSectionInfo setNotificationCenterSetting:](v14, "setNotificationCenterSetting:", [v13 notificationCenterSetting]);
    if ((v16 & 2) == 0)
    {
LABEL_12:
      if ((v16 & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_44;
    }
  }
  else if ((v15 & 2) == 0)
  {
    goto LABEL_12;
  }
  -[BBSectionInfo setLockScreenSetting:](v14, "setLockScreenSetting:", [v13 lockScreenSetting]);
  if ((v16 & 4) == 0)
  {
LABEL_13:
    if ((v16 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  -[BBSectionInfo setShowsOnExternalDevices:](v14, "setShowsOnExternalDevices:", [v13 showsOnExternalDevices]);
  if ((v16 & 0x2000) == 0)
  {
LABEL_14:
    if ((v16 & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  -[BBSectionInfo setPushSettings:](v14, "setPushSettings:", [v13 pushSettings] & 9 | -[BBSectionInfo pushSettings](v14, "pushSettings") & 0xFFFFFFFFFFFFFFF6);
  if ((v16 & 0x4000) == 0)
  {
LABEL_15:
    if ((v16 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  -[BBSectionInfo setPushSettings:](v14, "setPushSettings:", [v13 pushSettings] & 0x12 | -[BBSectionInfo pushSettings](v14, "pushSettings") & 0xFFFFFFFFFFFFFFEDLL);
  if ((v16 & 0x20) == 0)
  {
LABEL_16:
    if ((v16 & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  -[BBSectionInfo setPushSettings:](v14, "setPushSettings:", [v13 pushSettings] & 0x24 | -[BBSectionInfo pushSettings](v14, "pushSettings") & 0xFFFFFFFFFFFFFFDBLL);
  -[BBSectionInfo setAlertType:](v14, "setAlertType:", [v13 alertType]);
  if ((v16 & 0x40) == 0)
  {
LABEL_17:
    if ((v16 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  -[BBSectionInfo setContentPreviewSetting:](v14, "setContentPreviewSetting:", [v13 contentPreviewSetting]);
  if ((v16 & 0x400) == 0)
  {
LABEL_18:
    if ((v16 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  -[BBSectionInfo setAnnounceSetting:](v14, "setAnnounceSetting:", [v13 announceSetting]);
  if ((v16 & 0x80) == 0)
  {
LABEL_19:
    if ((v16 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  -[BBSectionInfo setCarPlaySetting:](v14, "setCarPlaySetting:", [v13 carPlaySetting]);
  if ((v16 & 0x10000) == 0)
  {
LABEL_20:
    if ((v16 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  -[BBSectionInfo setRemoteNotificationsSetting:](v14, "setRemoteNotificationsSetting:", [v13 remoteNotificationsSetting]);
  if ((v16 & 0x100) == 0)
  {
LABEL_21:
    if ((v16 & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  -[BBSectionInfo setCriticalAlertSetting:](v14, "setCriticalAlertSetting:", [v13 criticalAlertSetting]);
  if ((v16 & 0x800) == 0)
  {
LABEL_22:
    if ((v16 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  -[BBSectionInfo setTimeSensitiveSetting:](v14, "setTimeSensitiveSetting:", [v13 timeSensitiveSetting]);
  if ((v16 & 0x1000) == 0)
  {
LABEL_23:
    if ((v16 & 0x8000) == 0) {
      goto LABEL_24;
    }
LABEL_55:
    -[BBSectionInfo setDirectMessagesSetting:](v14, "setDirectMessagesSetting:", [v13 directMessagesSetting]);
    if ((v16 & 0x20000) == 0) {
      goto LABEL_136;
    }
    goto LABEL_56;
  }
LABEL_54:
  -[BBSectionInfo setScheduledDeliverySetting:](v14, "setScheduledDeliverySetting:", [v13 scheduledDeliverySetting]);
  if ((v16 & 0x8000) != 0) {
    goto LABEL_55;
  }
LABEL_24:
  if ((v16 & 0x20000) != 0) {
LABEL_56:
  }
    -[BBSectionInfo setSummarizationSetting:](v14, "setSummarizationSetting:", [v13 summarizationSetting]);
LABEL_136:
  if ([(BBSectionInfo *)v12 isRestricted])
  {
    if (!v14) {
      int64_t v14 = [(BBSectionInfo *)v12 copyFromManagedSettings];
    }
    [(BBSectionInfo *)v14 setAuthorizationStatus:1];
  }
  if (![(BBSectionInfo *)v12 allowsNotifications])
  {
    if (!v14) {
      int64_t v14 = [(BBSectionInfo *)v12 copyFromManagedSettings];
    }
LABEL_146:
    if (![v13 allowsNotifications]
      || ([v13 pushSettings] & 1) == 0
      || ([v13 suppressedSettings] & 0x2000) != 0
      || ([(BBSectionInfo *)v12 suppressedSettings] & 0x2000) != 0)
    {
      uint64_t v40 = -57;
    }
    else
    {
      uint64_t v40 = -49;
    }
    [(BBSectionInfo *)v14 setPushSettings:[(BBSectionInfo *)v12 pushSettings] & v40];
    [(BBSectionInfo *)v14 setAlertType:0];
    [(BBSectionInfo *)v14 setNotificationCenterSetting:[(BBSectionInfo *)v12 disabledSettingForSetting:[(BBSectionInfo *)v12 notificationCenterSetting]]];
    [(BBSectionInfo *)v14 setLockScreenSetting:[(BBSectionInfo *)v12 disabledSettingForSetting:[(BBSectionInfo *)v12 lockScreenSetting]]];
    [(BBSectionInfo *)v14 setShowsOnExternalDevices:0];
    [(BBSectionInfo *)v14 setShowsCustomSettingsLink:0];
    [(BBSectionInfo *)v14 setContentPreviewSetting:0];
    [(BBSectionInfo *)v14 setAnnounceSetting:1];
    [(BBSectionInfo *)v14 setCarPlaySetting:[(BBSectionInfo *)v12 disabledSettingForSetting:[(BBSectionInfo *)v12 carPlaySetting]]];
    [(BBSectionInfo *)v14 setRemoteNotificationsSetting:[(BBSectionInfo *)v12 disabledSettingForSetting:[(BBSectionInfo *)v12 remoteNotificationsSetting]]];
    [(BBSectionInfo *)v14 setDirectMessagesSetting:[(BBSectionInfo *)v12 disabledSettingForSetting:[(BBSectionInfo *)v12 directMessagesSetting]]];
    [(BBSectionInfo *)v14 setScheduledDeliverySetting:[(BBSectionInfo *)v12 disabledSettingForSetting:[(BBSectionInfo *)v12 scheduledDeliverySetting]]];
    [(BBSectionInfo *)v14 setTimeSensitiveSetting:[(BBSectionInfo *)v12 disabledSettingForSetting:[(BBSectionInfo *)v12 timeSensitiveSetting]]];
    [(BBSectionInfo *)v14 setSummarizationSetting:[(BBSectionInfo *)v12 disabledSettingForSetting:[(BBSectionInfo *)v12 summarizationSetting]]];
LABEL_153:
    if (a4 != -1)
    {
      if ((unint64_t)a4 >= 2) {
        goto LABEL_166;
      }
      if (v14) {
        goto LABEL_162;
      }
      goto LABEL_161;
    }
    if (v14)
    {
LABEL_164:
      v41 = v14;
      uint64_t v42 = 0;
      goto LABEL_165;
    }
LABEL_163:
    int64_t v14 = [(BBSectionInfo *)v12 copyFromManagedSettings];
    goto LABEL_164;
  }
  if (v14)
  {
    if ([(BBSectionInfo *)v14 allowsNotifications]) {
      goto LABEL_153;
    }
    goto LABEL_146;
  }
  if (a4 == -1) {
    goto LABEL_163;
  }
  if ((unint64_t)a4 >= 2)
  {
    if ((unint64_t)(a5 + 1) < 3) {
      goto LABEL_168;
    }
LABEL_171:
    int64_t v14 = [(BBSectionInfo *)v12 copyFromManagedSettings];
    goto LABEL_172;
  }
LABEL_161:
  int64_t v14 = [(BBSectionInfo *)v12 copyFromManagedSettings];
LABEL_162:
  v41 = v14;
  uint64_t v42 = 1;
LABEL_165:
  [(BBSectionInfo *)v41 setAnnounceSetting:v42];
LABEL_166:
  if ((unint64_t)(a5 + 1) < 3)
  {
    if (v14)
    {
LABEL_169:
      [(BBSectionInfo *)v14 setScheduledDeliverySetting:1];
      goto LABEL_172;
    }
LABEL_168:
    int64_t v14 = [(BBSectionInfo *)v12 copyFromManagedSettings];
    goto LABEL_169;
  }
  if (!v14) {
    goto LABEL_171;
  }
LABEL_172:
  if (!v67)
  {
    if (!v14) {
      int64_t v14 = [(BBSectionInfo *)v12 copyFromManagedSettings];
    }
    [(BBSectionInfo *)v14 setCarPlaySetting:0];
  }
  if (!v8)
  {
    if (!v14) {
      int64_t v14 = [(BBSectionInfo *)v12 copyFromManagedSettings];
    }
    [(BBSectionInfo *)v14 setRemoteNotificationsSetting:0];
  }
  if (a6 != 2)
  {
    if (!v14) {
      int64_t v14 = [(BBSectionInfo *)v12 copyFromManagedSettings];
    }
    [(BBSectionInfo *)v14 setSummarizationSetting:a6 != -1];
  }
  if (v14) {
    v43 = v14;
  }
  else {
    v43 = v12;
  }
  v44 = v43;
  if (![(BBSectionInfo *)v44 contentPreviewSetting])
  {
    if (!v14) {
      int64_t v14 = [(BBSectionInfo *)v12 copyFromManagedSettings];
    }
    [(BBSectionInfo *)v14 setContentPreviewSetting:a3];
  }
  if ([(BBSectionInfo *)v44 authorizationStatus] == 4)
  {
    if (!v14) {
      int64_t v14 = [(BBSectionInfo *)v12 copyFromManagedSettings];
    }
    v45 = [(BBSectionInfo *)v12 sectionInfoSettings];
    if ([v45 isAuthorizedTemporarily]) {
      uint64_t v46 = 2;
    }
    else {
      uint64_t v46 = 0;
    }

    [(BBSectionInfo *)v14 setAuthorizationStatus:v46];
  }
  if (v14) {
    v47 = v14;
  }
  else {
    v47 = v12;
  }
  v48 = v47;

  return v48;
}

- (unint64_t)pushSettings
{
  v2 = [(BBSectionInfo *)self readableSettings];
  unint64_t v3 = [v2 pushSettings];

  return v3;
}

- (BBSectionInfoSettings)readableSettings
{
  managedSectionInfoSettings = self->_managedSectionInfoSettings;
  if (!managedSectionInfoSettings) {
    managedSectionInfoSettings = self->_sectionInfoSettings;
  }
  return managedSectionInfoSettings;
}

- (int64_t)contentPreviewSetting
{
  v2 = [(BBSectionInfo *)self readableSettings];
  int64_t v3 = [v2 contentPreviewSetting];

  return v3;
}

- (BOOL)allowsNotifications
{
  v2 = [(BBSectionInfo *)self readableSettings];
  char v3 = [v2 allowsNotifications];

  return v3;
}

- (int64_t)authorizationStatus
{
  v2 = [(BBSectionInfo *)self readableSettings];
  int64_t v3 = [v2 authorizationStatus];

  return v3;
}

- (void)setScheduledDeliverySetting:(int64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setScheduledDeliverySetting:a3];
}

- (void)setCarPlaySetting:(int64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setCarPlaySetting:a3];
}

- (void)setAnnounceSetting:(int64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setAnnounceSetting:a3];
}

- (BBSectionInfoSettings)writableSettings
{
  if (self->_managedSectionInfoSettings) {
    return (BBSectionInfoSettings *)0;
  }
  else {
    return self->_sectionInfoSettings;
  }
}

- (void)setSummarizationSetting:(int64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setSummarizationSetting:a3];
}

- (void)setContentPreviewSetting:(int64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setContentPreviewSetting:a3];
}

- (int64_t)disabledSettingForSetting:(int64_t)a3
{
  return a3 != 0;
}

- (void)setPushSettings:(unint64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setPushSettings:a3];
}

- (int64_t)timeSensitiveSetting
{
  v2 = [(BBSectionInfo *)self readableSettings];
  int64_t v3 = [v2 timeSensitiveSetting];

  return v3;
}

- (int64_t)remoteNotificationsSetting
{
  v2 = [(BBSectionInfo *)self readableSettings];
  int64_t v3 = [v2 remoteNotificationsSetting];

  return v3;
}

- (int64_t)carPlaySetting
{
  v2 = [(BBSectionInfo *)self readableSettings];
  int64_t v3 = [v2 carPlaySetting];

  return v3;
}

- (int64_t)summarizationSetting
{
  v2 = [(BBSectionInfo *)self readableSettings];
  int64_t v3 = [v2 summarizationSetting];

  return v3;
}

- (int64_t)scheduledDeliverySetting
{
  v2 = [(BBSectionInfo *)self readableSettings];
  int64_t v3 = [v2 scheduledDeliverySetting];

  return v3;
}

- (int64_t)notificationCenterSetting
{
  v2 = [(BBSectionInfo *)self readableSettings];
  int64_t v3 = [v2 notificationCenterSetting];

  return v3;
}

- (int64_t)lockScreenSetting
{
  v2 = [(BBSectionInfo *)self readableSettings];
  int64_t v3 = [v2 lockScreenSetting];

  return v3;
}

- (int64_t)directMessagesSetting
{
  v2 = [(BBSectionInfo *)self readableSettings];
  int64_t v3 = [v2 directMessagesSetting];

  return v3;
}

- (int64_t)criticalAlertSetting
{
  v2 = [(BBSectionInfo *)self readableSettings];
  int64_t v3 = [v2 criticalAlertSetting];

  return v3;
}

- (int64_t)announceSetting
{
  v2 = [(BBSectionInfo *)self readableSettings];
  int64_t v3 = [v2 announceSetting];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BBSectionInfo *)self sectionID];
  [v4 encodeObject:v5 forKey:@"sectionID"];

  v6 = [(BBSectionInfo *)self subsectionID];
  [v4 encodeObject:v6 forKey:@"subsectionID"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBSectionInfo sectionType](self, "sectionType"), @"sectionType");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBSectionInfo isAppClip](self, "isAppClip"), @"isAppClip");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBSectionInfo isModificationAllowed](self, "isModificationAllowed"), @"isModificationAllowed");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBSectionInfo isRestricted](self, "isRestricted"), @"isRestricted");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBSectionInfo sectionCategory](self, "sectionCategory"), @"sectionCategory");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBSectionInfo suppressFromSettings](self, "suppressFromSettings"), @"suppressFromSettings");
  [v4 encodeObject:self->_sectionInfoSettings forKey:@"sectionInfoSettings"];
  [v4 encodeObject:self->_managedSectionInfoSettings forKey:@"managedSectionInfoSettings"];
  v7 = [(BBSectionInfo *)self pathToWeeAppPluginBundle];
  [v4 encodeObject:v7 forKey:@"pathToWeeAppPluginBundle"];

  BOOL v8 = [(BBSectionInfo *)self appName];
  [v4 encodeObject:v8 forKey:@"appName"];

  v9 = [(BBSectionInfo *)self displayName];
  [v4 encodeObject:v9 forKey:@"displayName"];

  int64_t v10 = [(BBSectionInfo *)self icon];
  [v4 encodeObject:v10 forKey:@"icon"];

  BOOL v11 = [(BBSectionInfo *)self subsections];
  [v4 encodeObject:v11 forKey:@"subsections"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBSectionInfo subsectionPriority](self, "subsectionPriority"), @"subsectionPriority");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBSectionInfo suppressedSettings](self, "suppressedSettings"), @"suppressedSettings");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBSectionInfo hideWeeApp](self, "hideWeeApp"), @"hideWeeApp");
  BOOL v12 = [(BBSectionInfo *)self factorySectionID];
  [v4 encodeObject:v12 forKey:@"factorySectionID"];

  BOOL v13 = [(BBSectionInfo *)self dataProviderIDs];
  [v4 encodeObject:v13 forKey:@"dataProviderIDs"];

  int64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BBSectionInfo version](self, "version"));
  [v4 encodeObject:v14 forKey:@"version"];

  int v15 = [(BBSectionInfo *)self customSettingsBundle];
  [v4 encodeObject:v15 forKey:@"customSettingsBundle"];

  id v16 = [(BBSectionInfo *)self customSettingsDetailControllerClass];
  [v4 encodeObject:v16 forKey:@"customSettingsDetailControllerClass"];
}

- (BBSectionInfo)initWithCoder:(id)a3
{
  v43[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BBSectionInfo;
  v5 = [(BBSectionInfo *)&v40 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionID"];
    [(BBSectionInfo *)v5 setSectionID:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subsectionID"];
    [(BBSectionInfo *)v5 setSubsectionID:v7];

    -[BBSectionInfo setSectionType:](v5, "setSectionType:", [v4 decodeIntegerForKey:@"sectionType"]);
    -[BBSectionInfo setIsAppClip:](v5, "setIsAppClip:", [v4 decodeBoolForKey:@"isAppClip"]);
    -[BBSectionInfo setIsModificationAllowed:](v5, "setIsModificationAllowed:", [v4 decodeBoolForKey:@"isModificationAllowed"]);
    -[BBSectionInfo setIsRestricted:](v5, "setIsRestricted:", [v4 decodeBoolForKey:@"isRestricted"]);
    -[BBSectionInfo setSectionCategory:](v5, "setSectionCategory:", [v4 decodeIntegerForKey:@"sectionCategory"]);
    -[BBSectionInfo setSuppressFromSettings:](v5, "setSuppressFromSettings:", [v4 decodeBoolForKey:@"suppressFromSettings"]);
    BOOL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pathToWeeAppPluginBundle"];
    [(BBSectionInfo *)v5 setPathToWeeAppPluginBundle:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appName"];
    [(BBSectionInfo *)v5 setAppName:v9];

    int64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    [(BBSectionInfo *)v5 setDisplayName:v10];

    BOOL v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    [(BBSectionInfo *)v5 setIcon:v11];

    BOOL v12 = (void *)MEMORY[0x263EFFA08];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    BOOL v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
    int64_t v14 = [v12 setWithArray:v13];
    int v15 = [v4 decodeObjectOfClasses:v14 forKey:@"subsections"];

    [(BBSectionInfo *)v5 setSubsections:v15];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v37;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * v20++), "setParentSection:", v5, (void)v36);
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v18);
    }

    -[BBSectionInfo setSubsectionPriority:](v5, "setSubsectionPriority:", [v4 decodeIntegerForKey:@"subsectionPriority"]);
    -[BBSectionInfo setSuppressedSettings:](v5, "setSuppressedSettings:", [v4 decodeInt64ForKey:@"suppressedSettings"]);
    -[BBSectionInfo setHideWeeApp:](v5, "setHideWeeApp:", [v4 decodeBoolForKey:@"hideWeeApp"]);
    unint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"factorySectionID"];
    [(BBSectionInfo *)v5 setFactorySectionID:v21];

    uint64_t v22 = (void *)MEMORY[0x263EFFA08];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
    uint64_t v24 = [v22 setWithArray:v23];
    unint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"dataProviderIDs"];
    [(BBSectionInfo *)v5 setDataProviderIDs:v25];

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customSettingsBundle"];
    [(BBSectionInfo *)v5 setCustomSettingsBundle:v26];

    int v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customSettingsDetailControllerClass"];
    [(BBSectionInfo *)v5 setCustomSettingsDetailControllerClass:v27];

    int v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    -[BBSectionInfo setVersion:](v5, "setVersion:", [v28 unsignedIntegerValue]);
    if ([v4 containsValueForKey:@"sectionInfoSettings"])
    {
      uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionInfoSettings"];
      sectionInfoSettings = v5->_sectionInfoSettings;
      v5->_sectionInfoSettings = (BBSectionInfoSettings *)v29;
    }
    else
    {
      uint64_t v31 = [[BBSectionInfoSettings alloc] initWithDefaultsForSectionType:[(BBSectionInfo *)v5 sectionType]];
      uint64_t v32 = v5->_sectionInfoSettings;
      v5->_sectionInfoSettings = v31;

      if ([v4 containsValueForKey:@"allowsNotifications"]) {
        uint64_t v33 = [v4 decodeBoolForKey:@"allowsNotifications"];
      }
      else {
        uint64_t v33 = 1;
      }
      -[BBSectionInfoSettings setAllowsNotifications:](v5->_sectionInfoSettings, "setAllowsNotifications:", v33, (void)v36);
      -[BBSectionInfoSettings setShowsInNotificationCenter:](v5->_sectionInfoSettings, "setShowsInNotificationCenter:", [v4 decodeBoolForKey:@"showsInNotificationCenter"]);
      -[BBSectionInfoSettings setShowsInLockScreen:](v5->_sectionInfoSettings, "setShowsInLockScreen:", [v4 decodeBoolForKey:@"showsInLockScreen"]);
      -[BBSectionInfoSettings setShowsCustomSettingsLink:](v5->_sectionInfoSettings, "setShowsCustomSettingsLink:", [v4 decodeBoolForKey:@"showsCustomSettingsLink"]);
      -[BBSectionInfoSettings setAlertType:](v5->_sectionInfoSettings, "setAlertType:", [v4 decodeIntegerForKey:@"alertType"]);
      -[BBSectionInfoSettings setPushSettings:](v5->_sectionInfoSettings, "setPushSettings:", [v4 decodeInt64ForKey:@"pushSettings"]);
      if ([v4 containsValueForKey:@"showsOnExternalDevices"]) {
        -[BBSectionInfoSettings setShowsOnExternalDevices:](v5->_sectionInfoSettings, "setShowsOnExternalDevices:", [v4 decodeBoolForKey:@"showsOnExternalDevices"]);
      }
      if ([v4 containsValueForKey:@"showsMessagePreview"]) {
        -[BBSectionInfoSettings setShowsMessagePreview:](v5->_sectionInfoSettings, "setShowsMessagePreview:", [v4 decodeBoolForKey:@"showsMessagePreview"]);
      }
    }
    if (objc_msgSend(v4, "containsValueForKey:", @"bulletinGroupingSetting", (void)v36)) {
      -[BBSectionInfo setBulletinGroupingSetting:](v5, "setBulletinGroupingSetting:", [v4 decodeIntegerForKey:@"bulletinGroupingSetting"]);
    }
    if ([v4 containsValueForKey:@"managedSectionInfoSettings"])
    {
      id v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managedSectionInfoSettings"];
      [(BBSectionInfo *)v5 setManagedSectionInfoSettings:v34];
    }
  }

  return v5;
}

- (void)setSubsections:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(BBSectionInfo *)self parentSection];
  [v5 setParentSection:v6];

  v7 = [(BBSectionInfo *)self sectionID];
  [v5 setSectionID:v7];

  BOOL v8 = [(BBSectionInfo *)self subsectionID];
  [v5 setSubsectionID:v8];

  objc_msgSend(v5, "setSectionType:", -[BBSectionInfo sectionType](self, "sectionType"));
  objc_msgSend(v5, "setIsAppClip:", -[BBSectionInfo isAppClip](self, "isAppClip"));
  objc_msgSend(v5, "setIsModificationAllowed:", -[BBSectionInfo isModificationAllowed](self, "isModificationAllowed"));
  objc_msgSend(v5, "setIsRestricted:", -[BBSectionInfo isRestricted](self, "isRestricted"));
  objc_msgSend(v5, "setSectionCategory:", -[BBSectionInfo sectionCategory](self, "sectionCategory"));
  objc_msgSend(v5, "setSuppressFromSettings:", -[BBSectionInfo suppressFromSettings](self, "suppressFromSettings"));
  id v9 = [(BBSectionInfoSettings *)self->_sectionInfoSettings copyWithZone:a3];
  [v5 setSectionInfoSettings:v9];

  id v10 = [(BBSectionInfoSettings *)self->_managedSectionInfoSettings copyWithZone:a3];
  [v5 setManagedSectionInfoSettings:v10];

  BOOL v11 = [(BBSectionInfo *)self pathToWeeAppPluginBundle];
  [v5 setPathToWeeAppPluginBundle:v11];

  BOOL v12 = [(BBSectionInfo *)self appName];
  [v5 setAppName:v12];

  BOOL v13 = [(BBSectionInfo *)self displayName];
  [v5 setDisplayName:v13];

  int64_t v14 = [(BBSectionInfo *)self icon];
  [v5 setIcon:v14];

  int v15 = [(BBSectionInfo *)self customSettingsBundle];
  [v5 setCustomSettingsBundle:v15];

  id v16 = [(BBSectionInfo *)self customSettingsDetailControllerClass];
  [v5 setCustomSettingsDetailControllerClass:v16];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v17 = [(BBSectionInfo *)self subsections];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * v21) copyWithZone:a3];
        [v5 _addSubsection:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v19);
  }

  objc_msgSend(v5, "setSubsectionPriority:", -[BBSectionInfo subsectionPriority](self, "subsectionPriority"));
  objc_msgSend(v5, "setSuppressedSettings:", -[BBSectionInfo suppressedSettings](self, "suppressedSettings"));
  objc_msgSend(v5, "setHideWeeApp:", -[BBSectionInfo hideWeeApp](self, "hideWeeApp"));
  uint64_t v23 = [(BBSectionInfo *)self factorySectionID];
  [v5 setFactorySectionID:v23];

  uint64_t v24 = [(BBSectionInfo *)self dataProviderIDs];
  [v5 setDataProviderIDs:v24];

  objc_msgSend(v5, "setVersion:", -[BBSectionInfo version](self, "version"));
  objc_msgSend(v5, "setIsRestricted:", -[BBSectionInfo isRestricted](self, "isRestricted"));
  return v5;
}

- (void)setManagedSectionInfoSettings:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (BBSectionInfoSettings *)[v4 copy];
  managedSectionInfoSettings = self->_managedSectionInfoSettings;
  self->_managedSectionInfoSettings = v5;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = self->_subsections;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setManagedSectionInfoSettings:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (NSArray)subsections
{
  return self->_subsections;
}

- (void)setIsRestricted:(BOOL)a3
{
  self->_isRestricted = a3;
}

- (unint64_t)suppressedSettings
{
  return self->_suppressedSettings;
}

- (void)setSuppressedSettings:(unint64_t)a3
{
  self->_suppressedSettings = a3;
}

- (void)setSectionType:(int64_t)a3
{
  self->_sectionType = a3;
}

- (BBSectionInfo)parentSection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSection);
  return (BBSectionInfo *)WeakRetained;
}

- (NSString)factorySectionID
{
  return self->_factorySectionID;
}

- (NSString)subsectionID
{
  return self->_subsectionID;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setParentSection:(id)a3
{
  p_parentSection = &self->_parentSection;
  id v7 = a3;
  id v5 = objc_storeWeak((id *)p_parentSection, v7);
  v6 = [v7 managedSectionInfoSettings];

  [(BBSectionInfo *)self setManagedSectionInfoSettings:v6];
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)suppressFromSettings
{
  return self->_suppressFromSettings;
}

- (int64_t)subsectionPriority
{
  return self->_subsectionPriority;
}

- (int64_t)sectionCategory
{
  return self->_sectionCategory;
}

- (NSString)pathToWeeAppPluginBundle
{
  return self->_pathToWeeAppPluginBundle;
}

- (BOOL)isModificationAllowed
{
  return self->_isModificationAllowed;
}

- (BOOL)isAppClip
{
  return self->_isAppClip;
}

- (BBSectionIcon)icon
{
  return self->_icon;
}

- (BOOL)hideWeeApp
{
  return self->_hideWeeApp;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)dataProviderIDs
{
  return self->_dataProviderIDs;
}

- (NSString)customSettingsDetailControllerClass
{
  return self->_customSettingsDetailControllerClass;
}

- (NSString)customSettingsBundle
{
  return self->_customSettingsBundle;
}

- (NSString)appName
{
  return self->_appName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSettingsDetailControllerClass, 0);
  objc_storeStrong((id *)&self->_customSettingsBundle, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_dataProviderIDs, 0);
  objc_storeStrong((id *)&self->_factorySectionID, 0);
  objc_destroyWeak((id *)&self->_parentSection);
  objc_storeStrong((id *)&self->_subsections, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_pathToWeeAppPluginBundle, 0);
  objc_storeStrong((id *)&self->_managedSectionInfoSettings, 0);
  objc_storeStrong((id *)&self->_sectionInfoSettings, 0);
  objc_storeStrong((id *)&self->_subsectionID, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

- (BBSectionInfoSettings)managedSectionInfoSettings
{
  return self->_managedSectionInfoSettings;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (void)setCustomSettingsDetailControllerClass:(id)a3
{
}

- (void)setCustomSettingsBundle:(id)a3
{
}

- (void)setSuppressFromSettings:(BOOL)a3
{
  self->_suppressFromSettings = a3;
}

- (void)setSubsectionPriority:(int64_t)a3
{
  self->_subsectionPriority = a3;
}

- (void)setSubsectionID:(id)a3
{
}

- (void)setSectionID:(id)a3
{
}

- (void)setSectionCategory:(int64_t)a3
{
  self->_sectionCategory = a3;
}

- (void)setPathToWeeAppPluginBundle:(id)a3
{
}

- (void)setIsModificationAllowed:(BOOL)a3
{
  self->_isModificationAllowed = a3;
}

- (void)setIsAppClip:(BOOL)a3
{
  self->_isAppClip = a3;
}

- (void)setIcon:(id)a3
{
}

- (void)setHideWeeApp:(BOOL)a3
{
  self->_hideWeeApp = a3;
}

- (void)setFactorySectionID:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (void)setDataProviderIDs:(id)a3
{
}

- (void)setAppName:(id)a3
{
}

- (void)setSectionInfoSettings:(id)a3
{
}

- (BBSectionInfo)init
{
  return [(BBSectionInfo *)self initWithDefaultsForSectionType:0];
}

- (BBSectionInfo)initWithDefaultsForSectionType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BBSectionInfo;
  id v4 = [(BBSectionInfo *)&v8 init];
  if (v4)
  {
    id v5 = [[BBSectionInfoSettings alloc] initWithDefaultsForSectionType:a3];
    sectionInfoSettings = v4->_sectionInfoSettings;
    v4->_sectionInfoSettings = v5;

    [(BBSectionInfo *)v4 _configureWithDefaultsForSectionType:a3];
  }
  return v4;
}

- (void)_configureWithDefaultsForSectionType:(int64_t)a3
{
  -[BBSectionInfo setSectionType:](self, "setSectionType:");
  [(BBSectionInfo *)self setSuppressedSettings:0];
  if ((a3 | 2) == 2)
  {
    [(BBSectionInfo *)self setBulletinCount:5];
    if (a3 == 2)
    {
      [(BBSectionInfo *)self setSuppressedSettings:8];
    }
  }
}

- (unint64_t)alertType
{
  v2 = [(BBSectionInfo *)self readableSettings];
  unint64_t v3 = [v2 alertType];

  return v3;
}

- (id)copyFromManagedSettings
{
  v2 = (void *)[(BBSectionInfo *)self copy];
  if ([v2 usesManagedSettings])
  {
    unint64_t v3 = [v2 managedSectionInfoSettings];
    [v2 setSectionInfoSettings:v3];

    [v2 setManagedSectionInfoSettings:0];
  }
  return v2;
}

- (BOOL)usesManagedSettings
{
  return self->_managedSectionInfoSettings != 0;
}

- (void)_addSubsection:(id)a3
{
  id v11 = a3;
  id v5 = [(BBSectionInfo *)self parentSection];
  if (v5)
  {
  }
  else if ([(BBSectionInfo *)self sectionType] != 2)
  {
    goto LABEL_3;
  }
  uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
  [v10 handleFailureInMethod:a2 object:self file:@"BBSectionInfo.m" lineNumber:191 description:@"a subsection cannot have a subsection"];

LABEL_3:
  v6 = v11;
  if (v11)
  {
    [v11 setParentSection:self];
    id v7 = (void *)MEMORY[0x263EFF980];
    objc_super v8 = [(BBSectionInfo *)self subsections];
    uint64_t v9 = [v7 arrayWithArray:v8];

    [v9 addObject:v11];
    [(BBSectionInfo *)self setSubsections:v9];

    v6 = v11;
  }
}

- (void)setTimeSensitiveSetting:(int64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setTimeSensitiveSetting:a3];
}

- (void)setRemoteNotificationsSetting:(int64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setRemoteNotificationsSetting:a3];
}

- (void)setNotificationCenterSetting:(int64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setNotificationCenterSetting:a3];
}

- (void)setLockScreenSetting:(int64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setLockScreenSetting:a3];
}

- (void)setDirectMessagesSetting:(int64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setDirectMessagesSetting:a3];
}

- (void)setAlertType:(unint64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setAlertType:a3];
}

- (BOOL)showsCustomSettingsLink
{
  v2 = [(BBSectionInfo *)self sectionInfoSettings];
  char v3 = [v2 showsCustomSettingsLink];

  return v3;
}

- (void)setShowsOnExternalDevices:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BBSectionInfo *)self sectionInfoSettings];
  [v4 setShowsOnExternalDevices:v3];
}

- (BBSectionInfoSettings)sectionInfoSettings
{
  return self->_sectionInfoSettings;
}

- (void)setCriticalAlertSetting:(int64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setCriticalAlertSetting:a3];
}

- (BOOL)showsOnExternalDevices
{
  v2 = [(BBSectionInfo *)self sectionInfoSettings];
  char v3 = [v2 showsOnExternalDevices];

  return v3;
}

- (void)setShowsCustomSettingsLink:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BBSectionInfo *)self sectionInfoSettings];
  [v4 setShowsCustomSettingsLink:v3];
}

- (int64_t)bulletinGroupingSetting
{
  v2 = [(BBSectionInfo *)self readableSettings];
  int64_t v3 = [v2 bulletinGroupingSetting];

  return v3;
}

- (BOOL)hasEnabledSettings
{
  if ([(BBSectionInfo *)self allowsNotifications])
  {
    char v3 = [(BBSectionInfo *)self pushSettings];
    if ((v3 & 0x18) != 0
      || (v3 & 0x20) != 0 && [(BBSectionInfo *)self alertType]
      || [(BBSectionInfo *)self lockScreenSetting] == 2
      || [(BBSectionInfo *)self notificationCenterSetting] == 2
      || [(BBSectionInfo *)self carPlaySetting] == 2
      || [(BBSectionInfo *)self remoteNotificationsSetting] == 2
      || [(BBSectionInfo *)self criticalAlertSetting] == 2)
    {
      return 1;
    }
    int64_t v4 = [(BBSectionInfo *)self scheduledDeliverySetting];
  }
  else
  {
    int64_t v4 = [(BBSectionInfo *)self criticalAlertSetting];
  }
  return v4 == 2;
}

+ (id)defaultSectionInfoForType:(int64_t)a3
{
  char v3 = [[BBSectionInfo alloc] initWithDefaultsForSectionType:a3];
  return v3;
}

- (BBSectionInfo)initWithUNCSectionInfo:(id)a3 parentSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && (v30.receiver = self,
        v30.super_class = (Class)BBSectionInfo,
        (self = [(BBSectionInfo *)&v30 init]) != 0))
  {
    objc_super v8 = [v6 sectionID];
    if (v8)
    {
    }
    else
    {
      uint64_t v10 = [v6 subsectionID];

      if (!v10)
      {
        id v11 = BBLogSettings;
        if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_ERROR)) {
          -[BBSectionInfo initWithUNCSectionInfo:parentSection:]((uint64_t)v6, v11);
        }
      }
    }
    [(BBSectionInfo *)self setParentSection:v7];
    long long v12 = [v6 subsections];
    long long v13 = +[BBUNCoreConversion toBBSectionInfos:v12 parentSection:self];
    [(BBSectionInfo *)self setSubsections:v13];

    long long v14 = [v6 appName];
    [(BBSectionInfo *)self setAppName:v14];

    long long v15 = [v6 customSettingsBundle];
    [(BBSectionInfo *)self setCustomSettingsBundle:v15];

    id v16 = [v6 customSettingsDetailControllerClass];
    [(BBSectionInfo *)self setCustomSettingsDetailControllerClass:v16];

    uint64_t v17 = [v6 dataProviderIDs];
    [(BBSectionInfo *)self setDataProviderIDs:v17];

    uint64_t v18 = [v6 displayName];
    [(BBSectionInfo *)self setDisplayName:v18];

    uint64_t v19 = [v6 factorySectionID];
    [(BBSectionInfo *)self setFactorySectionID:v19];

    -[BBSectionInfo setHideWeeApp:](self, "setHideWeeApp:", [v6 hideWeeApp]);
    uint64_t v20 = [v6 icon];
    uint64_t v21 = +[BBUNCoreConversion toBBSectionIcon:v20];
    [(BBSectionInfo *)self setIcon:v21];

    -[BBSectionInfo setIsAppClip:](self, "setIsAppClip:", [v6 isAppClip]);
    -[BBSectionInfo setIsModificationAllowed:](self, "setIsModificationAllowed:", [v6 isModificationAllowed]);
    -[BBSectionInfo setIsRestricted:](self, "setIsRestricted:", [v6 isRestricted]);
    uint64_t v22 = [v6 pathToWeeAppPluginBundle];
    [(BBSectionInfo *)self setPathToWeeAppPluginBundle:v22];

    -[BBSectionInfo setSectionCategory:](self, "setSectionCategory:", +[BBUNCoreConversion toBBSectionCategory:](BBUNCoreConversion, "toBBSectionCategory:", [v6 sectionCategory]));
    uint64_t v23 = [v6 sectionID];
    [(BBSectionInfo *)self setSectionID:v23];

    -[BBSectionInfo setSectionType:](self, "setSectionType:", +[BBUNCoreConversion toBBSectionType:](BBUNCoreConversion, "toBBSectionType:", [v6 sectionType]));
    uint64_t v24 = [v6 subsectionID];
    [(BBSectionInfo *)self setSubsectionID:v24];

    -[BBSectionInfo setSubsectionPriority:](self, "setSubsectionPriority:", [v6 subsectionPriority]);
    -[BBSectionInfo setSuppressedSettings:](self, "setSuppressedSettings:", +[BBUNCoreConversion toBBSettings:](BBUNCoreConversion, "toBBSettings:", [v6 suppressedSettings]));
    -[BBSectionInfo setSuppressFromSettings:](self, "setSuppressFromSettings:", [v6 suppressFromSettings]);
    -[BBSectionInfo setVersion:](self, "setVersion:", [v6 version]);
    unint64_t v25 = [v6 sectionInfoSettings];
    long long v26 = +[BBUNCoreConversion toBBSectionInfoSettings:v25];
    [(BBSectionInfo *)self setSectionInfoSettings:v26];

    long long v27 = [v6 managedSectionInfoSettings];
    long long v28 = +[BBUNCoreConversion toBBSectionInfoSettings:v27];
    [(BBSectionInfo *)self setManagedSectionInfoSettings:v28];

    self = self;
    uint64_t v9 = self;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)toUNCSectionInfoWithParentSection:(id)a3
{
  int64_t v4 = (objc_class *)MEMORY[0x263F842D8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setParentSection:v5];

  id v7 = [(BBSectionInfo *)self subsections];
  objc_super v8 = +[BBUNCoreConversion toUNCSectionInfos:v7 parentSection:v6];
  [v6 setSubsections:v8];

  uint64_t v9 = [(BBSectionInfo *)self appName];
  [v6 setAppName:v9];

  uint64_t v10 = [(BBSectionInfo *)self customSettingsBundle];
  [v6 setCustomSettingsBundle:v10];

  id v11 = [(BBSectionInfo *)self customSettingsDetailControllerClass];
  [v6 setCustomSettingsDetailControllerClass:v11];

  long long v12 = [(BBSectionInfo *)self dataProviderIDs];
  [v6 setDataProviderIDs:v12];

  long long v13 = [(BBSectionInfo *)self displayName];
  [v6 setDisplayName:v13];

  long long v14 = [(BBSectionInfo *)self factorySectionID];
  [v6 setFactorySectionID:v14];

  objc_msgSend(v6, "setHideWeeApp:", -[BBSectionInfo hideWeeApp](self, "hideWeeApp"));
  long long v15 = [(BBSectionInfo *)self icon];
  id v16 = +[BBUNCoreConversion toUNCSectionIcon:v15];
  [v6 setIcon:v16];

  objc_msgSend(v6, "setIsAppClip:", -[BBSectionInfo isAppClip](self, "isAppClip"));
  objc_msgSend(v6, "setIsModificationAllowed:", -[BBSectionInfo isModificationAllowed](self, "isModificationAllowed"));
  objc_msgSend(v6, "setIsRestricted:", -[BBSectionInfo isRestricted](self, "isRestricted"));
  uint64_t v17 = [(BBSectionInfo *)self pathToWeeAppPluginBundle];
  [v6 setPathToWeeAppPluginBundle:v17];

  objc_msgSend(v6, "setSectionCategory:", +[BBUNCoreConversion toUNCSectionCategory:](BBUNCoreConversion, "toUNCSectionCategory:", -[BBSectionInfo sectionCategory](self, "sectionCategory")));
  uint64_t v18 = [(BBSectionInfo *)self sectionID];
  [v6 setSectionID:v18];

  objc_msgSend(v6, "setSectionType:", +[BBUNCoreConversion toUNCSectionType:](BBUNCoreConversion, "toUNCSectionType:", -[BBSectionInfo sectionType](self, "sectionType")));
  uint64_t v19 = [(BBSectionInfo *)self subsectionID];
  [v6 setSubsectionID:v19];

  objc_msgSend(v6, "setSubsectionPriority:", -[BBSectionInfo subsectionPriority](self, "subsectionPriority"));
  objc_msgSend(v6, "setSuppressedSettings:", +[BBUNCoreConversion toUNCSettings:](BBUNCoreConversion, "toUNCSettings:", -[BBSectionInfo suppressedSettings](self, "suppressedSettings")));
  objc_msgSend(v6, "setSuppressFromSettings:", -[BBSectionInfo suppressFromSettings](self, "suppressFromSettings"));
  objc_msgSend(v6, "setVersion:", -[BBSectionInfo version](self, "version"));
  uint64_t v20 = [(BBSectionInfo *)self sectionInfoSettings];
  uint64_t v21 = +[BBUNCoreConversion toUNCSectionInfoSettings:v20];
  [v6 setSectionInfoSettings:v21];

  uint64_t v22 = [(BBSectionInfo *)self managedSectionInfoSettings];
  uint64_t v23 = +[BBUNCoreConversion toUNCSectionInfoSettings:v22];
  [v6 setManagedSectionInfoSettings:v23];

  if (*(_OWORD *)&self->_sectionID == 0)
  {
    uint64_t v24 = BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_ERROR)) {
      -[BBSectionInfo toUNCSectionInfoWithParentSection:]((uint64_t)v6, v24);
    }
  }
  return v6;
}

- (void)_replaceSubsection:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v17 = self;
  id v5 = [(BBSectionInfo *)self subsections];
  id v6 = [v4 subsectionID];
  if ([v5 count] && v6)
  {
    id v7 = [MEMORY[0x263EFF980] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v16 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v14 = objc_msgSend(v13, "subsectionID", v16);
          int v15 = [v14 isEqualToString:v6];

          if (v15)
          {
            [v13 setParentSection:0];
            [v4 setParentSection:v17];
            long long v13 = v4;
          }
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [(BBSectionInfo *)v17 setSubsections:v7];
    id v5 = v16;
  }
}

- (id)_subsectionForID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(BBSectionInfo *)self subsections];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 subsectionID];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_associateDataProviderSectionInfo:(id)a3
{
  id v4 = a3;
  id v8 = [v4 sectionID];
  id v5 = [(BBSectionInfo *)self dataProviderIDs];
  if (v8 && ([v5 containsObject:v8] & 1) == 0)
  {
    id v6 = [MEMORY[0x263EFF980] arrayWithArray:v5];
    [v6 addObject:v8];
    [(BBSectionInfo *)self setDataProviderIDs:v6];
  }
  uint64_t v7 = [(BBSectionInfo *)self sectionID];
  [v4 setFactorySectionID:v7];
}

- (void)_dissociateDataProviderSectionInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    id v5 = [v4 factorySectionID];
    id v6 = [(BBSectionInfo *)self sectionID];
    int v7 = [v5 isEqualToString:v6];

    id v4 = v12;
    if (v7)
    {
      id v8 = (void *)MEMORY[0x263EFF980];
      uint64_t v9 = [(BBSectionInfo *)self dataProviderIDs];
      uint64_t v10 = [v8 arrayWithArray:v9];

      int v11 = [v12 sectionID];
      [v10 removeObject:v11];

      [(BBSectionInfo *)self setDataProviderIDs:v10];
      [v12 setFactorySectionID:0];

      id v4 = v12;
    }
  }
}

- (BOOL)_isDeliveredQuietly
{
  if (![(BBSectionInfo *)self allowsNotifications]) {
    return 0;
  }
  if ([(BBSectionInfo *)self notificationCenterSetting] != 2) {
    return 0;
  }
  char v3 = [(BBSectionInfo *)self pushSettings];
  if ((v3 & 0x18) != 0 || (v3 & 0x20) != 0 && [(BBSectionInfo *)self alertType]) {
    return 0;
  }
  if ([(BBSectionInfo *)self lockScreenSetting] == 2) {
    return 0;
  }
  id v6 = [MEMORY[0x263F7FC90] sharedToneManager];
  char v7 = objc_msgSend(v6, "bb_isToneEnabledForSectionInfo:", self);

  if (v7) {
    return 0;
  }
  id v8 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
  char v9 = objc_msgSend(v8, "bb_isVibrationEnabledForSectionInfo:", self);

  if (v9) {
    return 0;
  }
  if ([(BBSectionInfo *)self carPlaySetting] != 2) {
    goto LABEL_13;
  }
  id v10 = objc_alloc_init((Class)getCRPairedVehicleManagerClass());
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__4;
  uint64_t v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __36__BBSectionInfo__isDeliveredQuietly__block_invoke;
  v13[3] = &unk_2642969B0;
  v13[4] = &v14;
  [v10 syncFetchAllVehiclesWithCompletion:v13];
  uint64_t v11 = [(id)v15[5] count];
  _Block_object_dispose(&v14, 8);

  if (v11) {
    return 0;
  }
LABEL_13:
  [(BBSectionInfo *)self remoteNotificationsSetting];
  if ([(BBSectionInfo *)self announceSetting] != 2
    && [(BBSectionInfo *)self announceSetting] != 3)
  {
    return 1;
  }
  id v12 = +[BBBulletinBoardDefaults standardDefaults];
  BOOL v4 = ([v12 isAnnounceSupportedForHeadphones] & 1) == 0
    && (![v12 isAnnounceSupportedForCarPlay]
     || ![v12 hasPairedVehiclesForCarPlay]);

  return v4;
}

void __36__BBSectionInfo__isDeliveredQuietly__block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)isDeliveredQuietly
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v3 = [(BBSectionInfo *)self subsections];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [(BBSectionInfo *)self allowsNotifications];
    if (v5)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = [(BBSectionInfo *)self subsections];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (!v7)
      {
LABEL_18:

LABEL_19:
        LOBYTE(v5) = 0;
        return v5;
      }
      uint64_t v8 = v7;
      char v9 = 0;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v12 allowsNotifications]
            && [v12 notificationCenterSetting] == 2)
          {
            if (![v12 _isDeliveredQuietly]) {
              goto LABEL_18;
            }
            char v9 = 1;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);

      if ((v9 & 1) == 0) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
  }
  else
  {
    BOOL v5 = [(BBSectionInfo *)self _isDeliveredQuietly];
    if (v5) {
LABEL_17:
    }
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)_deliverQuietly:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(BBSectionInfo *)self pushSettings];
  if (v3)
  {
    [(BBSectionInfo *)self setPushSettings:v5 & 0xFFFFFFFFFFFFFFC7];
    [(BBSectionInfo *)self setAlertType:0];
    if ([(BBSectionInfo *)self lockScreenSetting]) {
      [(BBSectionInfo *)self setLockScreenSetting:1];
    }
    if ([(BBSectionInfo *)self carPlaySetting]) {
      [(BBSectionInfo *)self setCarPlaySetting:1];
    }
    if ([(BBSectionInfo *)self remoteNotificationsSetting]) {
      [(BBSectionInfo *)self setRemoteNotificationsSetting:1];
    }
    if ([(BBSectionInfo *)self announceSetting])
    {
      uint64_t v6 = 1;
      goto LABEL_20;
    }
  }
  else
  {
    [(BBSectionInfo *)self setPushSettings:(8 * (v5 & 7)) | v5];
    [(BBSectionInfo *)self setAlertType:1];
    if ([(BBSectionInfo *)self lockScreenSetting]) {
      [(BBSectionInfo *)self setLockScreenSetting:2];
    }
    if ([(BBSectionInfo *)self carPlaySetting]) {
      [(BBSectionInfo *)self setCarPlaySetting:2];
    }
    if ([(BBSectionInfo *)self remoteNotificationsSetting]) {
      [(BBSectionInfo *)self setRemoteNotificationsSetting:2];
    }
    if ([(BBSectionInfo *)self announceSetting])
    {
      if ([(BBSectionInfo *)self timeSensitiveSetting] == 2) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 1;
      }
LABEL_20:
      [(BBSectionInfo *)self setAnnounceSetting:v6];
    }
  }
}

- (void)deliverQuietly:(BOOL)a3
{
}

- (void)deliverQuietly:(BOOL)a3 changeAuthorizationStatus:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)MEMORY[0x263F7FC68];
  uint64_t v8 = [(BBSectionInfo *)self sectionID];
  uint64_t v9 = objc_msgSend(v7, "bb_toneLibraryAlertTypeForSectionID:", v8);

  if (v9) {
    [MEMORY[0x263F7FC68] _setCurrentOverridePolicy:v5 forType:v9];
  }
  uint64_t v10 = [(BBSectionInfo *)self subsections];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = [(BBSectionInfo *)self subsections];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * v16++) _deliverQuietly:v5];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }

    if (v4) {
      goto LABEL_12;
    }
  }
  else
  {
    [(BBSectionInfo *)self _deliverQuietly:v5];
    if (v4) {
LABEL_12:
    }
      [(BBSectionInfo *)self makeAuthorizationPermanent];
  }
  if (v5)
  {
    long long v17 = [(BBSectionInfo *)self muteAssertion];

    if (v17) {
      [(BBSectionInfo *)self setMuteAssertion:0];
    }
  }
}

- (void)makeAuthorizationPermanent
{
  if ([(BBSectionInfo *)self authorizationStatus] == 4
    || [(BBSectionInfo *)self authorizationStatus] == 3)
  {
    [(BBSectionInfo *)self setAuthorizationStatus:2];
  }
}

- (void)muteSectionUntilDate:(id)a3
{
  id v5 = a3;
  if (![(BBSectionInfo *)self _isDeliveredQuietly])
  {
    BOOL v4 = [(BBSectionInfo *)self sectionInfoSettings];
    [v4 muteSectionUntilDate:v5];
  }
}

- (void)unmuteSection
{
  id v2 = [(BBSectionInfo *)self sectionInfoSettings];
  [v2 unmuteSection];
}

- (void)muteThreadIdentifier:(id)a3 untilDate:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (![(BBSectionInfo *)self _isDeliveredQuietly])
  {
    uint64_t v7 = [(BBSectionInfo *)self sectionInfoSettings];
    [v7 muteThreadIdentifier:v8 untilDate:v6];
  }
}

- (void)unmuteThreadIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSectionInfo *)self sectionInfoSettings];
  [v5 unmuteThreadIdentifier:v4];
}

- (BOOL)isBulletinMutedForThreadIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSectionInfo *)self sectionInfoSettings];
  char v6 = [v5 isBulletinMutedForThreadIdentifier:v4];

  return v6;
}

- (id)_suppressedSettingsList:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = v4;
  if (a3 == -1)
  {
    char v6 = @"All";
LABEL_38:
    [v5 addObject:v6];
    goto LABEL_39;
  }
  if (a3)
  {
    [v4 addObject:@"ShowsInNotificationCenter"];
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_23;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v5 addObject:@"ShowsInLockScreen"];
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v5 addObject:@"ShowsOnExternalDevices"];
  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v5 addObject:@"NotificationCenterLimit"];
  if ((a3 & 0x10) == 0)
  {
LABEL_7:
    if ((a3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v5 addObject:@"PushSettings"];
  if ((a3 & 0x20) == 0)
  {
LABEL_8:
    if ((a3 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v5 addObject:@"AlertType"];
  if ((a3 & 0x40) == 0)
  {
LABEL_9:
    if ((a3 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v5 addObject:@"ShowsMessagePreview"];
  if ((a3 & 0x80) == 0)
  {
LABEL_10:
    if ((a3 & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v5 addObject:@"ShowsInCarPlay"];
  if ((a3 & 0x10000) == 0)
  {
LABEL_11:
    if ((a3 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v5 addObject:@"RemoteNotifications"];
  if ((a3 & 0x100) == 0)
  {
LABEL_12:
    if ((a3 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v5 addObject:@"CriticalAlert"];
  if ((a3 & 0x200) == 0)
  {
LABEL_13:
    if ((a3 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v5 addObject:@"BulletinGrouping"];
  if ((a3 & 0x400) == 0)
  {
LABEL_14:
    if ((a3 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v5 addObject:@"SpokenNotifications"];
  [v5 addObject:@"SpokenNotifications"];
  if ((a3 & 0x800) == 0)
  {
LABEL_15:
    if ((a3 & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v5 addObject:@"TimeSensitive"];
  if ((a3 & 0x1000) == 0)
  {
LABEL_16:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v5 addObject:@"ScheduledDelivery"];
  if ((a3 & 0x2000) == 0)
  {
LABEL_17:
    if ((a3 & 0x4000) == 0) {
      goto LABEL_18;
    }
LABEL_36:
    [v5 addObject:@"Sound"];
    if ((a3 & 0x8000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_37;
  }
LABEL_35:
  [v5 addObject:@"Badge"];
  if ((a3 & 0x4000) != 0) {
    goto LABEL_36;
  }
LABEL_18:
  if ((a3 & 0x8000) != 0)
  {
LABEL_37:
    char v6 = @"DirectMessages";
    goto LABEL_38;
  }
LABEL_39:
  return v5;
}

- (NSDictionary)stateCapture
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(BBSectionInfoSettings *)self->_sectionInfoSettings stateCapture];
  [v3 setValue:v4 forKey:@"SectionInfoSettings"];

  managedSectionInfoSettings = self->_managedSectionInfoSettings;
  if (managedSectionInfoSettings)
  {
    char v6 = [(BBSectionInfoSettings *)managedSectionInfoSettings stateCapture];
    [v3 setValue:v6 forKey:@"ManagedSettings"];
  }
  else
  {
    [v3 setValue:@"Unmanaged" forKey:@"ManagedSettings"];
  }
  uint64_t v7 = [(BBSectionInfo *)self appName];

  if (v7)
  {
    id v8 = [(BBSectionInfo *)self appName];
    [v3 setValue:v8 forKey:@"AppName"];
  }
  uint64_t v9 = [(BBSectionInfo *)self displayName];

  if (v9)
  {
    uint64_t v10 = [(BBSectionInfo *)self displayName];
    [v3 setValue:v10 forKey:@"DisplayName"];
  }
  uint64_t v11 = [(BBSectionInfo *)self subsectionID];

  if (v11)
  {
    id v12 = [(BBSectionInfo *)self subsectionID];
    [v3 setValue:v12 forKey:@"SubSectionID"];
  }
  uint64_t v13 = [(BBSectionInfo *)self factorySectionID];

  if (v13)
  {
    uint64_t v14 = [(BBSectionInfo *)self factorySectionID];
    [v3 setValue:v14 forKey:@"FactorySectionID"];
  }
  if ([(BBSectionInfo *)self version])
  {
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BBSectionInfo version](self, "version"));
    [v3 setValue:v15 forKey:@"Version"];
  }
  uint64_t v16 = BBStringFromBool(self->_suppressFromSettings);
  [v3 setValue:v16 forKey:@"HiddenFromSettings"];

  long long v17 = BBStringFromBool([(BBSectionInfo *)self hideWeeApp]);
  [v3 setValue:v17 forKey:@"HiddenWeeApp"];

  unint64_t v18 = [(BBSectionInfo *)self suppressedSettings];
  if (v18)
  {
    long long v19 = [(BBSectionInfo *)self _suppressedSettingsList:v18];
    [v3 setValue:v19 forKey:@"SuppressedSettings"];
  }
  long long v20 = [(BBSectionInfo *)self subsections];
  if ([v20 count])
  {
    id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v22 = v20;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v27 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          long long v28 = objc_msgSend(v27, "stateCapture", (void)v38);
          long long v29 = [v27 subsectionID];
          [v21 setValue:v28 forKey:v29];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v24);
    }

    [v3 setValue:v21 forKey:@"SubSections"];
    goto LABEL_25;
  }
  uint64_t v31 = [(BBSectionInfo *)self parentSection];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    uint64_t v33 = [(BBSectionInfo *)self parentSection];
    id v34 = [v33 sectionID];
    uint64_t v35 = [(BBSectionInfo *)self sectionID];
    char v36 = [v34 isEqualToString:v35];

    if ((v36 & 1) == 0)
    {
      id v21 = [(BBSectionInfo *)self parentSection];
      long long v37 = [v21 sectionID];
      [v3 setValue:v37 forKey:@"ParentSectionID"];

LABEL_25:
    }
  }

  return (NSDictionary *)v3;
}

- (void)setEnabled:(BOOL)a3
{
}

- (BOOL)enabled
{
  return [(BBSectionInfo *)self notificationCenterSetting] == 2;
}

- (unint64_t)bulletinCount
{
  return 500;
}

- (NSData)iconData
{
  id v2 = [(BBSectionInfo *)self icon];
  id v3 = [v2 _bestVariantForFormat:1];
  id v4 = [v3 imageData];

  return (NSData *)v4;
}

- (unint64_t)notificationCenterLimit
{
  return 500;
}

- (id)description
{
  id v3 = [NSString stringWithFormat:@" Section %@", self->_sectionID];
  id v4 = [v3 stringByAppendingFormat:@" %@", self->_sectionInfoSettings];

  if (self->_isRestricted)
  {
    uint64_t v5 = [v4 stringByAppendingFormat:@" (restricted)"];

    id v4 = (void *)v5;
  }
  if (self->_managedSectionInfoSettings) {
    [v4 stringByAppendingFormat:@" %@ (managed)", self->_managedSectionInfoSettings];
  }
  else {
  char v6 = [v4 stringByAppendingString:@" (unmanaged)"];
  }

  uint64_t v7 = [(BBSectionInfo *)self appName];

  if (v7)
  {
    id v8 = [(BBSectionInfo *)self appName];
    uint64_t v9 = [v6 stringByAppendingFormat:@" '%@'", v8];

    char v6 = (void *)v9;
  }
  uint64_t v10 = [(BBSectionInfo *)self displayName];

  if (v10)
  {
    uint64_t v11 = [(BBSectionInfo *)self displayName];
    uint64_t v12 = [v6 stringByAppendingFormat:@" '%@'", v11];

    char v6 = (void *)v12;
  }
  uint64_t v13 = [(BBSectionInfo *)self subsectionID];

  if (v13)
  {
    uint64_t v14 = [(BBSectionInfo *)self subsectionID];
    uint64_t v15 = [v6 stringByAppendingFormat:@" (%@)", v14];

    char v6 = (void *)v15;
  }
  uint64_t v16 = [(BBSectionInfo *)self factorySectionID];

  if (v16)
  {
    long long v17 = [(BBSectionInfo *)self factorySectionID];
    uint64_t v18 = [v6 stringByAppendingFormat:@" (factory: %@)", v17];

    char v6 = (void *)v18;
  }
  if ([(BBSectionInfo *)self version])
  {
    uint64_t v19 = objc_msgSend(v6, "stringByAppendingFormat:", @" [v%ld]", -[BBSectionInfo version](self, "version"));

    char v6 = (void *)v19;
  }
  if (self->_suppressFromSettings)
  {
    uint64_t v20 = [v6 stringByAppendingString:@", hidden from settings"];

    char v6 = (void *)v20;
  }
  if ([(BBSectionInfo *)self hideWeeApp])
  {
    uint64_t v21 = [v6 stringByAppendingString:@", hidden wee app"];

    char v6 = (void *)v21;
  }
  unint64_t v22 = [(BBSectionInfo *)self suppressedSettings];
  if (v22)
  {
    uint64_t v23 = [v6 stringByAppendingFormat:@", suppressed settings = %lX", v22];

    char v6 = (void *)v23;
  }
  uint64_t v24 = [(BBSectionInfo *)self subsections];
  if ([v24 count])
  {
    uint64_t v25 = [v6 stringByAppendingFormat:@", subsections = %@", v24];
LABEL_24:

    char v6 = (void *)v25;
    goto LABEL_25;
  }
  uint64_t v29 = [(BBSectionInfo *)self parentSection];
  if (v29)
  {
    objc_super v30 = (void *)v29;
    uint64_t v31 = [(BBSectionInfo *)self parentSection];
    uint64_t v32 = [v31 sectionID];
    uint64_t v33 = [(BBSectionInfo *)self sectionID];
    char v34 = [v32 isEqualToString:v33];

    if ((v34 & 1) == 0)
    {
      uint64_t v35 = [(BBSectionInfo *)self parentSection];
      char v36 = [v35 sectionID];
      uint64_t v25 = [v6 stringByAppendingFormat:@", parent section = %@", v36];

      char v6 = v35;
      goto LABEL_24;
    }
  }
LABEL_25:
  v37.receiver = self;
  v37.super_class = (Class)BBSectionInfo;
  long long v26 = [(BBSectionInfo *)&v37 description];
  long long v27 = [v26 stringByAppendingString:v6];

  return v27;
}

- (unint64_t)hash
{
  uint64_t v42 = [(BBSectionInfo *)self sectionID];
  uint64_t v3 = [v42 hash];
  long long v41 = [(BBSectionInfo *)self subsectionID];
  uint64_t v4 = [v41 hash] ^ v3;
  int64_t v5 = v4 ^ [(BBSectionInfo *)self sectionType];
  uint64_t v6 = [(BBSectionInfo *)self isAppClip];
  int64_t v7 = v5 ^ v6 ^ [(BBSectionInfo *)self isModificationAllowed];
  uint64_t v8 = [(BBSectionInfo *)self isRestricted];
  int64_t v9 = v8 ^ [(BBSectionInfo *)self sectionCategory];
  int64_t v10 = v7 ^ v9 ^ [(BBSectionInfo *)self suppressFromSettings];
  long long v40 = [(BBSectionInfo *)self sectionInfoSettings];
  uint64_t v11 = [v40 hash];
  long long v39 = [(BBSectionInfo *)self managedSectionInfoSettings];
  uint64_t v12 = v11 ^ [v39 hash];
  unint64_t v13 = v12 ^ [(BBSectionInfo *)self suppressedSettings];
  long long v38 = [(BBSectionInfo *)self subsections];
  uint64_t v14 = v13 ^ [v38 hash];
  objc_super v37 = [(BBSectionInfo *)self parentSection];
  char v36 = [v37 sectionID];
  uint64_t v15 = v10 ^ v14 ^ [v36 hash];
  int64_t v16 = [(BBSectionInfo *)self subsectionPriority];
  unint64_t v17 = v16 ^ [(BBSectionInfo *)self version];
  uint64_t v35 = [(BBSectionInfo *)self appName];
  uint64_t v18 = v17 ^ [v35 hash];
  uint64_t v19 = [(BBSectionInfo *)self displayName];
  uint64_t v20 = v18 ^ [v19 hash];
  uint64_t v21 = [(BBSectionInfo *)self icon];
  uint64_t v22 = v20 ^ [v21 hash];
  uint64_t v23 = [(BBSectionInfo *)self factorySectionID];
  uint64_t v24 = v22 ^ [v23 hash];
  uint64_t v25 = [(BBSectionInfo *)self dataProviderIDs];
  uint64_t v26 = v15 ^ v24 ^ [v25 hash];
  long long v27 = [(BBSectionInfo *)self customSettingsBundle];
  uint64_t v28 = [v27 hash];
  uint64_t v29 = [(BBSectionInfo *)self customSettingsDetailControllerClass];
  uint64_t v30 = v28 ^ [v29 hash];
  uint64_t v31 = [(BBSectionInfo *)self pathToWeeAppPluginBundle];
  uint64_t v32 = v30 ^ [v31 hash];
  unint64_t v33 = v26 ^ v32 ^ [(BBSectionInfo *)self hideWeeApp];

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)effectiveSectionInfoWithFactoryInfo:(id)a3 defaultContentPreviewSetting:(int64_t)a4 globalAnnounceSetting:(int64_t)a5 globalScheduledDeliverySetting:(int64_t)a6 globalSummarizationSetting:(int64_t)a7 hasPairedVehiclesForCarPlay:(BOOL)a8 hasDestinationForRemoteNotifications:(BOOL)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  if (!v15) {
    goto LABEL_9;
  }
  int64_t v16 = [(BBSectionInfo *)self factorySectionID];
  unint64_t v17 = [v15 sectionID];
  if (([v16 isEqualToString:v17] & 1) == 0)
  {

    goto LABEL_9;
  }
  [v15 dataProviderIDs];
  int64_t v28 = a6;
  v18 = BOOL v27 = v9;
  [(BBSectionInfo *)self sectionID];
  int64_t v19 = a5;
  uint64_t v21 = v20 = a7;
  char v22 = [v18 containsObject:v21];

  if ((v22 & 1) == 0)
  {
LABEL_9:
    uint64_t v25 = self;
    goto LABEL_10;
  }
  uint64_t v23 = (void *)[(BBSectionInfo *)self copy];
  if ([v23 suppressFromSettings] && (objc_msgSend(v15, "suppressFromSettings") & 1) == 0)
  {
    objc_msgSend(v23, "setNotificationCenterSetting:", objc_msgSend(v15, "notificationCenterSetting"));
    objc_msgSend(v23, "setLockScreenSetting:", objc_msgSend(v15, "lockScreenSetting"));
    if ([v23 showsOnExternalDevices]) {
      uint64_t v24 = [v15 showsOnExternalDevices];
    }
    else {
      uint64_t v24 = 0;
    }
    [v23 setShowsOnExternalDevices:v24];
    objc_msgSend(v23, "setContentPreviewSetting:", objc_msgSend(v15, "contentPreviewSetting"));
    objc_msgSend(v23, "setPushSettings:", objc_msgSend(v15, "pushSettings"));
    objc_msgSend(v23, "setAlertType:", objc_msgSend(v15, "alertType"));
    objc_msgSend(v23, "setAuthorizationStatus:", objc_msgSend(v15, "authorizationStatus"));
    objc_msgSend(v23, "setCarPlaySetting:", objc_msgSend(v15, "carPlaySetting"));
    objc_msgSend(v23, "setRemoteNotificationsSetting:", objc_msgSend(v15, "remoteNotificationsSetting"));
    objc_msgSend(v23, "setAnnounceSetting:", objc_msgSend(v15, "announceSetting"));
    objc_msgSend(v23, "setCriticalAlertSetting:", objc_msgSend(v15, "criticalAlertSetting"));
    objc_msgSend(v23, "setTimeSensitiveSetting:", objc_msgSend(v15, "timeSensitiveSetting"));
    objc_msgSend(v23, "setScheduledDeliverySetting:", objc_msgSend(v15, "scheduledDeliverySetting"));
    objc_msgSend(v23, "setDirectMessagesSetting:", objc_msgSend(v15, "directMessagesSetting"));
    objc_msgSend(v23, "setSummarizationSetting:", objc_msgSend(v15, "summarizationSetting"));
  }
  uint64_t v25 = [v23 effectiveSectionInfoWithDefaultContentPreviewSetting:a4 globalAnnounceSetting:v19 globalScheduledDeliverySetting:v28 globalSummarizationSetting:v20 hasPairedVehiclesForCarPlay:v27 hasDestinationForRemoteNotifications:a9];

LABEL_10:
  return v25;
}

+ (id)defaultSectionInfoForSection:(id)a3
{
  id v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v5 defaultSectionInfo], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v6 = +[BBSectionInfo defaultSectionInfoForType:0];
  }
  int64_t v7 = [v5 sectionIdentifier];
  [v6 setSectionID:v7];
  id v15 = 0;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v7 allowPlaceholder:1 error:&v15];
  id v9 = v15;
  if (v8)
  {
    int64_t v10 = [v8 localizedName];
    [v6 setAppName:v10];

    uint64_t v11 = [v8 applicationState];
    objc_msgSend(v6, "setIsRestricted:", objc_msgSend(v11, "isRestricted"));

    if (v6) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v12 = (void *)BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_ERROR))
    {
      +[BBSectionInfo(DataProviders) defaultSectionInfoForSection:v9];
      if (v6) {
        goto LABEL_9;
      }
    }
    else if (v6)
    {
      goto LABEL_9;
    }
  }
  uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2 object:a1 file:@"BBSectionInfo.m" lineNumber:1277 description:@"we must have a default section info"];

LABEL_9:
  return v6;
}

- (void)updateWithDefaultSectionInfo:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(BBSectionInfo *)self alertType];
  unint64_t v6 = [(BBSectionInfo *)self pushSettings];
  char v7 = [v4 pushSettings];
  char v8 = v7;
  if ((v6 & 4) == 0 && (v7 & 4) != 0)
  {
    uint64_t v5 = [v4 alertType];
    v6 |= 0x24uLL;
  }
  if (v6 & 1 | ((v8 & 1) == 0)) {
    unint64_t v9 = v6;
  }
  else {
    unint64_t v9 = v6 | 9;
  }
  uint64_t v10 = (v9 >> 1) & 1;
  if ((v8 & 2) == 0) {
    LODWORD(v10) = 1;
  }
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v9 | 0x12;
  }
  unsigned int v12 = [(BBSectionInfo *)self suppressedSettings];
  int v13 = [v4 suppressedSettings];
  int v14 = v13;
  if ((v12 & 0x2000) == 0 || (v13 & 0x2000) != 0)
  {
LABEL_26:
    if ((v12 & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  if (v8)
  {
    v11 |= 9uLL;
    goto LABEL_26;
  }
  id v15 = [(BBSectionInfo *)self subsections];
  uint64_t v16 = [v15 count];

  if (!v16) {
    goto LABEL_26;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  unint64_t v17 = [(BBSectionInfo *)self subsections];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v60;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v60 != v20) {
          objc_enumerationMutation(v17);
        }
        if (([*(id *)(*((void *)&v59 + 1) + 8 * i) pushSettings] & 8) != 0)
        {
          v11 |= 9uLL;
          goto LABEL_84;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v59 objects:v63 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
LABEL_84:

  if ((v12 & 0x20) != 0)
  {
LABEL_27:
    if ((v14 & 0x20) == 0)
    {
      uint64_t v5 = [v4 alertType];
      v11 |= 0x24uLL;
    }
  }
LABEL_29:
  [(BBSectionInfo *)self setAlertType:v5];
  [(BBSectionInfo *)self setPushSettings:v11];
  int64_t v22 = [(BBSectionInfo *)self lockScreenSetting];
  uint64_t v23 = [v4 lockScreenSetting];
  if (v22) {
    int v25 = ((v14 & 2) == 0) & (v12 >> 1);
  }
  else {
    int v25 = 1;
  }
  if (v25 == 1)
  {
    uint64_t v24 = v23;
    if (v23) {
      [(BBSectionInfo *)self setLockScreenSetting:v23];
    }
  }
  int64_t v26 = [(BBSectionInfo *)self notificationCenterSetting];
  uint64_t v27 = [v4 notificationCenterSetting];
  if (v26) {
    int v29 = v12 & ((v14 & 1) == 0);
  }
  else {
    int v29 = 1;
  }
  if (v29 == 1)
  {
    uint64_t v28 = v27;
    if (v27) {
      [(BBSectionInfo *)self setNotificationCenterSetting:v27];
    }
  }
  int64_t v30 = [(BBSectionInfo *)self carPlaySetting];
  uint64_t v31 = [v4 carPlaySetting];
  if (v30) {
    int v33 = ((v14 & 0x80) == 0) & (v12 >> 7);
  }
  else {
    int v33 = 1;
  }
  if (v33 == 1)
  {
    uint64_t v32 = v31;
    if (v31) {
      [(BBSectionInfo *)self setCarPlaySetting:v31];
    }
  }
  int64_t v34 = [(BBSectionInfo *)self remoteNotificationsSetting];
  uint64_t v35 = [v4 remoteNotificationsSetting];
  if (v34) {
    int v37 = ((*(void *)&v14 & 0x10000) == 0) & HIWORD(v12);
  }
  else {
    int v37 = 1;
  }
  if (v37 == 1)
  {
    uint64_t v36 = v35;
    if (v35) {
      [(BBSectionInfo *)self setRemoteNotificationsSetting:v35];
    }
  }
  int64_t v38 = [(BBSectionInfo *)self announceSetting];
  uint64_t v39 = [v4 announceSetting];
  if (!v38)
  {
    uint64_t v40 = v39;
    if (v39) {
      [(BBSectionInfo *)self setAnnounceSetting:v39];
    }
  }
  int64_t v41 = [(BBSectionInfo *)self criticalAlertSetting];
  uint64_t v42 = [v4 criticalAlertSetting];
  if (!v41)
  {
    uint64_t v43 = v42;
    if (v42) {
      [(BBSectionInfo *)self setCriticalAlertSetting:v42];
    }
  }
  int64_t v44 = [(BBSectionInfo *)self timeSensitiveSetting];
  uint64_t v45 = [v4 timeSensitiveSetting];
  if (!v44)
  {
    uint64_t v46 = v45;
    if (v45) {
      [(BBSectionInfo *)self setTimeSensitiveSetting:v45];
    }
  }
  int64_t v47 = [(BBSectionInfo *)self directMessagesSetting];
  uint64_t v48 = [v4 directMessagesSetting];
  if (!v47)
  {
    uint64_t v49 = v48;
    if (v48) {
      [(BBSectionInfo *)self setDirectMessagesSetting:v48];
    }
  }
  int64_t v50 = [(BBSectionInfo *)self summarizationSetting];
  uint64_t v51 = [v4 summarizationSetting];
  if (!v50)
  {
    uint64_t v52 = v51;
    if (v51) {
      [(BBSectionInfo *)self setSummarizationSetting:v51];
    }
  }
  if (![(BBSectionInfo *)self showsCustomSettingsLink]) {
    -[BBSectionInfo setShowsCustomSettingsLink:](self, "setShowsCustomSettingsLink:", [v4 showsCustomSettingsLink]);
  }
  v53 = [(BBSectionInfo *)self parentSection];
  if (!v53 || (v12 & 0x23) != 0)
  {
  }
  else
  {

    if ((v14 & 0x23) != 0)
    {
      if ([(BBSectionInfo *)self allowsNotifications])
      {
        if ([(BBSectionInfo *)self lockScreenSetting] != 2
          && [(BBSectionInfo *)self notificationCenterSetting] != 2
          && ![(BBSectionInfo *)self alertType])
        {
          [(BBSectionInfo *)self setAllowsNotifications:0];
        }
      }
      else if (([(BBSectionInfo *)self suppressedSettings] & 0x2000) == 0 {
             && ([(BBSectionInfo *)self pushSettings] & 1) != 0)
      }
      {
        [(BBSectionInfo *)self setPushSettings:[(BBSectionInfo *)self pushSettings] & 0xFFFFFFFFFFFFFFF7];
      }
    }
  }
  -[BBSectionInfo setSuppressFromSettings:](self, "setSuppressFromSettings:", [v4 suppressFromSettings]);
  -[BBSectionInfo setSuppressedSettings:](self, "setSuppressedSettings:", [v4 suppressedSettings]);
  -[BBSectionInfo setSectionType:](self, "setSectionType:", [v4 sectionType]);
  -[BBSectionInfo setIsAppClip:](self, "setIsAppClip:", [v4 isAppClip]);
  -[BBSectionInfo setSectionCategory:](self, "setSectionCategory:", [v4 sectionCategory]);
  -[BBSectionInfo setSubsectionPriority:](self, "setSubsectionPriority:", [v4 subsectionPriority]);
  -[BBSectionInfo setVersion:](self, "setVersion:", [v4 version]);
  unint64_t v54 = [v4 appName];
  [(BBSectionInfo *)self setAppName:v54];

  int v55 = [v4 displayName];
  [(BBSectionInfo *)self setDisplayName:v55];

  uint64_t v56 = [v4 icon];
  [(BBSectionInfo *)self setIcon:v56];

  -[BBSectionInfo setIsRestricted:](self, "setIsRestricted:", [v4 isRestricted]);
  uint64_t v57 = [v4 customSettingsBundle];
  [(BBSectionInfo *)self setCustomSettingsBundle:v57];

  uint64_t v58 = [v4 customSettingsDetailControllerClass];
  [(BBSectionInfo *)self setCustomSettingsDetailControllerClass:v58];
}

- (void)queryAndUseManagedSettings
{
  id v3 = [(BBSectionInfo *)self sectionID];
  [(BBSectionInfo *)self queryAndUseManagedSettingsForSectionID:v3];
}

- (void)queryAndUseManagedSettingsForSectionID:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[BBSectionInfoSettings sectionInfoSettingsForManagedBundleID:v4];
  if (v5)
  {
    unint64_t v6 = BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "Managed settings found for section %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  [(BBSectionInfo *)self setManagedSectionInfoSettings:v5];
  char v7 = [MEMORY[0x263F53C50] sharedConnection];
  int v8 = [v7 isNotificationsModificationAllowedForBundleID:v4];

  if ((v8 & 1) == 0)
  {
    unint64_t v9 = BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl(&dword_217675000, v9, OS_LOG_TYPE_DEFAULT, "Modification not allowed for section %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  [(BBSectionInfo *)self setIsModificationAllowed:v8 ^ 1u];
}

- (void)setAllowsNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setAllowsNotifications:v3];
}

- (NSDate)authorizationExpirationDate
{
  id v2 = [(BBSectionInfo *)self readableSettings];
  BOOL v3 = [v2 authorizationExpirationDate];

  return (NSDate *)v3;
}

- (void)setAuthorizationExpirationDate:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSectionInfo *)self writableSettings];
  [v5 setAuthorizationExpirationDate:v4];
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setAuthorizationStatus:a3];
}

- (NSDate)lastUserGrantedAuthorizationDate
{
  id v2 = [(BBSectionInfo *)self readableSettings];
  BOOL v3 = [v2 lastUserGrantedAuthorizationDate];

  return (NSDate *)v3;
}

- (void)setLastUserGrantedAuthorizationDate:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSectionInfo *)self writableSettings];
  [v5 setLastUserGrantedAuthorizationDate:v4];
}

- (BBMuteAssertion)muteAssertion
{
  id v2 = [(BBSectionInfo *)self sectionInfoSettings];
  BOOL v3 = [v2 muteAssertion];

  return (BBMuteAssertion *)v3;
}

- (void)setMuteAssertion:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSectionInfo *)self sectionInfoSettings];
  [v5 setMuteAssertion:v4];
}

- (BOOL)showsInNotificationCenter
{
  id v2 = [(BBSectionInfo *)self readableSettings];
  char v3 = [v2 showsInNotificationCenter];

  return v3;
}

- (void)setShowsInNotificationCenter:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setShowsInNotificationCenter:v3];
}

- (BOOL)showsInLockScreen
{
  id v2 = [(BBSectionInfo *)self readableSettings];
  char v3 = [v2 showsInLockScreen];

  return v3;
}

- (void)setShowsInLockScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setShowsInLockScreen:v3];
}

- (int64_t)spokenNotificationSetting
{
  id v2 = [(BBSectionInfo *)self readableSettings];
  int64_t v3 = [v2 spokenNotificationSetting];

  return v3;
}

- (void)setSpokenNotificationSetting:(int64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setSpokenNotificationSetting:a3];
}

- (BOOL)hasUserConfiguredTimeSensitiveSetting
{
  id v2 = [(BBSectionInfo *)self readableSettings];
  char v3 = [v2 hasUserConfiguredTimeSensitiveSetting];

  return v3;
}

- (void)setUserConfiguredTimeSensitiveSetting:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setUserConfiguredTimeSensitiveSetting:v3];
}

- (void)setBulletinGroupingSetting:(int64_t)a3
{
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setBulletinGroupingSetting:a3];
}

- (BOOL)hasUserConfiguredDirectMessagesSetting
{
  id v2 = [(BBSectionInfo *)self readableSettings];
  char v3 = [v2 hasUserConfiguredDirectMessagesSetting];

  return v3;
}

- (void)setUserConfiguredDirectMessagesSetting:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BBSectionInfo *)self writableSettings];
  [v4 setUserConfiguredDirectMessagesSetting:v3];
}

- (BOOL)showsMessagePreview
{
  id v2 = [(BBSectionInfo *)self sectionInfoSettings];
  char v3 = [v2 showsMessagePreview];

  return v3;
}

- (void)setShowsMessagePreview:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BBSectionInfo *)self sectionInfoSettings];
  [v4 setShowsMessagePreview:v3];
}

- (void)initWithUNCSectionInfo:(uint64_t)a1 parentSection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217675000, a2, OS_LOG_TYPE_ERROR, "Tried to create BBSectionInfo from UNCSectionInfo w/ nil sectionID: %@", (uint8_t *)&v2, 0xCu);
}

- (void)toUNCSectionInfoWithParentSection:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217675000, a2, OS_LOG_TYPE_ERROR, "Tried to create UNCSectionInfo from BBSectionInfo w/ nil sectionID: %@", (uint8_t *)&v2, 0xCu);
}

@end