@interface DOCUserInterfaceState
+ (BOOL)supportsSecureCoding;
+ (id)stateWithDefaultSettingsForConfiguration:(id)a3;
+ (id)unarchivedFromData:(id)a3 configuration:(id)a4 error:(id *)a5;
- (DOCUserInterfaceState)initWithCoder:(id)a3;
- (DOCUserInterfaceState)initWithDefaultSettingsForConfiguration:(id)a3;
- (NSData)lastUsedOpenSaveLocation;
- (NSData)mostRecentlyVisitedBrowsedState_FullBrowser;
- (NSData)mostRecentlyVisitedBrowsedState_Recents;
- (NSData)mostRecentlyVisitedBrowsedState_Shared;
- (NSDate)lastUpdatedDate;
- (NSDictionary)sortingMode;
- (NSMutableDictionary)displayModes;
- (NSMutableDictionary)groupingBehaviors;
- (NSNumber)isInUIPDocumentLanding;
- (NSNumber)sizeSetting;
- (NSNumber)userPrefersTiledSidebarHidden;
- (NSString)mostRecentlyVisitedEffectiveTabIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)configurationDefaultsVersion;
- (void)bumpLastUpdatedDate;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigurationDefaultsVersion:(unint64_t)a3;
- (void)setIsInUIPDocumentLanding:(id)a3;
- (void)setLastUpdatedDate:(id)a3;
- (void)setLastUsedOpenSaveLocation:(id)a3;
- (void)setMostRecentlyVisitedBrowsedState_FullBrowser:(id)a3;
- (void)setMostRecentlyVisitedBrowsedState_Recents:(id)a3;
- (void)setMostRecentlyVisitedBrowsedState_Shared:(id)a3;
- (void)setMostRecentlyVisitedEffectiveTabIdentifier:(id)a3;
- (void)setSizeSetting:(id)a3;
- (void)setSortingMode:(id)a3;
- (void)setUserPrefersTiledSidebarHidden:(id)a3;
- (void)upgradeDefaultSettingsIfNecessaryForConfiguration:(id)a3;
@end

@implementation DOCUserInterfaceState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v27 = a3;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DOCUserInterfaceState configurationDefaultsVersion](self, "configurationDefaultsVersion"));
  [v27 encodeObject:v4 forKey:@"configurationDefaultsVersion"];

  v5 = [(DOCUserInterfaceState *)self mostRecentlyVisitedEffectiveTabIdentifier];

  if (v5)
  {
    v6 = [(DOCUserInterfaceState *)self mostRecentlyVisitedEffectiveTabIdentifier];
    [v27 encodeObject:v6 forKey:@"mostRecentlyVisitedEffectiveTabIdentifier"];
  }
  v7 = [(DOCUserInterfaceState *)self mostRecentlyVisitedBrowsedState_Recents];

  if (v7)
  {
    v8 = [(DOCUserInterfaceState *)self mostRecentlyVisitedBrowsedState_Recents];
    [v27 encodeObject:v8 forKey:@"mostRecentlyVisitedBrowsedState_Recents"];
  }
  v9 = [(DOCUserInterfaceState *)self mostRecentlyVisitedBrowsedState_Shared];

  if (v9)
  {
    v10 = [(DOCUserInterfaceState *)self mostRecentlyVisitedBrowsedState_Shared];
    [v27 encodeObject:v10 forKey:@"mostRecentlyVisitedBrowsedState_Shared"];
  }
  v11 = [(DOCUserInterfaceState *)self mostRecentlyVisitedBrowsedState_FullBrowser];

  if (v11)
  {
    v12 = [(DOCUserInterfaceState *)self mostRecentlyVisitedBrowsedState_FullBrowser];
    [v27 encodeObject:v12 forKey:@"mostRecentlyVisitedBrowsedState_FullBrowser"];
  }
  v13 = [(DOCUserInterfaceState *)self lastUsedOpenSaveLocation];

  if (v13)
  {
    v14 = [(DOCUserInterfaceState *)self lastUsedOpenSaveLocation];
    [v27 encodeObject:v14 forKey:@"lastUsedOpenSaveLocation"];
  }
  v15 = [(DOCUserInterfaceState *)self displayModes];

  if (v15)
  {
    v16 = [(DOCUserInterfaceState *)self displayModes];
    [v27 encodeObject:v16 forKey:@"displayModes"];
  }
  v17 = [(DOCUserInterfaceState *)self sortingMode];

  if (v17)
  {
    v18 = [(DOCUserInterfaceState *)self sortingMode];
    [v27 encodeObject:v18 forKey:@"sortingMode"];
  }
  v19 = [(DOCUserInterfaceState *)self groupingBehaviors];

  if (v19)
  {
    v20 = [(DOCUserInterfaceState *)self groupingBehaviors];
    [v27 encodeObject:v20 forKey:@"groupingBehaviors"];
  }
  v21 = [(DOCUserInterfaceState *)self userPrefersTiledSidebarHidden];

  if (v21)
  {
    v22 = [(DOCUserInterfaceState *)self userPrefersTiledSidebarHidden];
    [v27 encodeObject:v22 forKey:@"userPrefersTiledSidebarHidden"];
  }
  v23 = [(DOCUserInterfaceState *)self lastUpdatedDate];

  if (v23)
  {
    v24 = [(DOCUserInterfaceState *)self lastUpdatedDate];
    [v27 encodeObject:v24 forKey:@"lastUpdatedDate"];
  }
  v25 = [(DOCUserInterfaceState *)self sizeSetting];

  if (v25)
  {
    v26 = [(DOCUserInterfaceState *)self sizeSetting];
    [v27 encodeObject:v26 forKey:@"sizeSetting"];
  }
}

- (NSNumber)sizeSetting
{
  return self->_sizeSetting;
}

- (NSMutableDictionary)groupingBehaviors
{
  return self->_groupingBehaviors;
}

- (NSDictionary)sortingMode
{
  return self->_sortingMode;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (NSMutableDictionary)displayModes
{
  return self->_displayModes;
}

- (NSData)mostRecentlyVisitedBrowsedState_Shared
{
  return self->_mostRecentlyVisitedBrowsedState_Shared;
}

- (NSData)mostRecentlyVisitedBrowsedState_FullBrowser
{
  return self->_mostRecentlyVisitedBrowsedState_FullBrowser;
}

- (NSNumber)userPrefersTiledSidebarHidden
{
  return self->_userPrefersTiledSidebarHidden;
}

- (NSString)mostRecentlyVisitedEffectiveTabIdentifier
{
  return self->_mostRecentlyVisitedEffectiveTabIdentifier;
}

- (NSData)mostRecentlyVisitedBrowsedState_Recents
{
  return self->_mostRecentlyVisitedBrowsedState_Recents;
}

- (NSData)lastUsedOpenSaveLocation
{
  return self->_lastUsedOpenSaveLocation;
}

- (unint64_t)configurationDefaultsVersion
{
  return self->_configurationDefaultsVersion;
}

- (DOCUserInterfaceState)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)DOCUserInterfaceState;
  v5 = [(DOCUserInterfaceState *)&v39 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configurationDefaultsVersion"];
    -[DOCUserInterfaceState setConfigurationDefaultsVersion:](v5, "setConfigurationDefaultsVersion:", [v6 unsignedIntegerValue]);

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mostRecentlyVisitedEffectiveTabIdentifier"];
    [(DOCUserInterfaceState *)v5 setMostRecentlyVisitedEffectiveTabIdentifier:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mostRecentlyVisitedBrowsedState_Recents"];
    [(DOCUserInterfaceState *)v5 setMostRecentlyVisitedBrowsedState_Recents:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mostRecentlyVisitedBrowsedState_Shared"];
    [(DOCUserInterfaceState *)v5 setMostRecentlyVisitedBrowsedState_Shared:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mostRecentlyVisitedBrowsedState_FullBrowser"];
    [(DOCUserInterfaceState *)v5 setMostRecentlyVisitedBrowsedState_FullBrowser:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUsedOpenSaveLocation"];
    [(DOCUserInterfaceState *)v5 setLastUsedOpenSaveLocation:v11];

    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v16 = [v4 decodeObjectOfClasses:v15 forKey:@"displayModes"];
    uint64_t v17 = [v16 mutableCopy];
    displayModes = v5->_displayModes;
    v5->_displayModes = (NSMutableDictionary *)v17;

    v19 = (void *)MEMORY[0x263EFFA08];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
    v23 = [v4 decodeObjectOfClasses:v22 forKey:@"sortingMode"];
    [(DOCUserInterfaceState *)v5 setSortingMode:v23];

    v24 = (void *)MEMORY[0x263EFFA08];
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    id v27 = objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);
    v28 = [v4 decodeObjectOfClasses:v27 forKey:@"groupingBehaviors"];
    uint64_t v29 = [v28 mutableCopy];
    groupingBehaviors = v5->_groupingBehaviors;
    v5->_groupingBehaviors = (NSMutableDictionary *)v29;

    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userPrefersTiledSidebarHidden"];
    [(DOCUserInterfaceState *)v5 setUserPrefersTiledSidebarHidden:v31];

    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedDate"];
    [(DOCUserInterfaceState *)v5 setLastUpdatedDate:v32];

    v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sizeSetting"];
    [(DOCUserInterfaceState *)v5 setSizeSetting:v33];

    if (!v5->_groupingBehaviors)
    {
      uint64_t v34 = [MEMORY[0x263EFF9A0] dictionary];
      v35 = v5->_groupingBehaviors;
      v5->_groupingBehaviors = (NSMutableDictionary *)v34;
    }
    if (!v5->_displayModes)
    {
      uint64_t v36 = [MEMORY[0x263EFF9A0] dictionary];
      v37 = v5->_displayModes;
      v5->_displayModes = (NSMutableDictionary *)v36;
    }
  }

  return v5;
}

- (void)setMostRecentlyVisitedBrowsedState_FullBrowser:(id)a3
{
}

- (void)setUserPrefersTiledSidebarHidden:(id)a3
{
}

- (void)setSortingMode:(id)a3
{
}

- (void)setSizeSetting:(id)a3
{
}

- (void)setMostRecentlyVisitedEffectiveTabIdentifier:(id)a3
{
}

- (void)setMostRecentlyVisitedBrowsedState_Shared:(id)a3
{
}

- (void)setMostRecentlyVisitedBrowsedState_Recents:(id)a3
{
}

- (void)setLastUsedOpenSaveLocation:(id)a3
{
}

- (void)setLastUpdatedDate:(id)a3
{
}

- (void)setConfigurationDefaultsVersion:(unint64_t)a3
{
  self->_configurationDefaultsVersion = a3;
}

- (void)bumpLastUpdatedDate
{
  v3 = [MEMORY[0x263EFF910] date];
  lastUpdatedDate = self->_lastUpdatedDate;
  self->_lastUpdatedDate = v3;
  MEMORY[0x270F9A758](v3, lastUpdatedDate);
}

+ (id)unarchivedFromData:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = (void *)MEMORY[0x263F08928];
  id v9 = a3;
  id v14 = 0;
  v10 = [v8 unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v14];

  id v11 = v14;
  if (v10)
  {
    [v10 upgradeDefaultSettingsIfNecessaryForConfiguration:v7];
    goto LABEL_8;
  }
  v12 = docStateStoreHandle;
  if (!docStateStoreHandle)
  {
    DOCInitLogging();
    v12 = docStateStoreHandle;
  }
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    if (!a5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  +[DOCUserInterfaceState unarchivedFromData:configuration:error:]((uint64_t)v11, v12);
  if (a5) {
LABEL_7:
  }
    *a5 = v11;
LABEL_8:

  return v10;
}

- (void)upgradeDefaultSettingsIfNecessaryForConfiguration:(id)a3
{
  if (!self->_configurationDefaultsVersion && [a3 isInUIPDocumentLanding])
  {
    userPrefersTiledSidebarHidden = self->_userPrefersTiledSidebarHidden;
    self->_userPrefersTiledSidebarHidden = (NSNumber *)MEMORY[0x263EFFA88];
  }
  self->_configurationDefaultsVersion = 1;
}

- (DOCUserInterfaceState)initWithDefaultSettingsForConfiguration:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DOCUserInterfaceState;
  v5 = [(DOCUserInterfaceState *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF910] date];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    groupingBehaviors = v5->_groupingBehaviors;
    v5->_groupingBehaviors = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    displayModes = v5->_displayModes;
    v5->_displayModes = (NSMutableDictionary *)v10;

    v5->_configurationDefaultsVersion = 0;
    [(DOCUserInterfaceState *)v5 upgradeDefaultSettingsIfNecessaryForConfiguration:v4];
  }

  return v5;
}

+ (id)stateWithDefaultSettingsForConfiguration:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDefaultSettingsForConfiguration:v4];

  return v5;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)DOCUserInterfaceState;
  id v4 = [(DOCUserInterfaceState *)&v9 description];
  v5 = [(DOCUserInterfaceState *)self lastUpdatedDate];
  uint64_t v6 = [(DOCUserInterfaceState *)self userPrefersTiledSidebarHidden];
  id v7 = [v3 stringWithFormat:@"%@ lastUpdatedDate=\"%@\", userPrefersTiledSidebarHidden=(%@)", v4, v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[DOCUserInterfaceState allocWithZone:a3] init];
  if (v4)
  {
    [(DOCUserInterfaceState *)v4 setConfigurationDefaultsVersion:[(DOCUserInterfaceState *)self configurationDefaultsVersion]];
    v5 = [(DOCUserInterfaceState *)self mostRecentlyVisitedEffectiveTabIdentifier];
    uint64_t v6 = (void *)[v5 copy];
    [(DOCUserInterfaceState *)v4 setMostRecentlyVisitedEffectiveTabIdentifier:v6];

    id v7 = [(DOCUserInterfaceState *)self mostRecentlyVisitedBrowsedState_Recents];
    uint64_t v8 = (void *)[v7 copy];
    [(DOCUserInterfaceState *)v4 setMostRecentlyVisitedBrowsedState_Recents:v8];

    objc_super v9 = [(DOCUserInterfaceState *)self mostRecentlyVisitedBrowsedState_Shared];
    uint64_t v10 = (void *)[v9 copy];
    [(DOCUserInterfaceState *)v4 setMostRecentlyVisitedBrowsedState_Shared:v10];

    id v11 = [(DOCUserInterfaceState *)self mostRecentlyVisitedBrowsedState_FullBrowser];
    v12 = (void *)[v11 copy];
    [(DOCUserInterfaceState *)v4 setMostRecentlyVisitedBrowsedState_FullBrowser:v12];

    objc_super v13 = [(DOCUserInterfaceState *)self lastUsedOpenSaveLocation];
    id v14 = (void *)[v13 copy];
    [(DOCUserInterfaceState *)v4 setLastUsedOpenSaveLocation:v14];

    v15 = [(DOCUserInterfaceState *)self displayModes];
    uint64_t v16 = [v15 mutableCopy];
    displayModes = v4->_displayModes;
    v4->_displayModes = (NSMutableDictionary *)v16;

    v18 = [(DOCUserInterfaceState *)self sortingMode];
    v19 = (void *)[v18 copy];
    [(DOCUserInterfaceState *)v4 setSortingMode:v19];

    uint64_t v20 = [(DOCUserInterfaceState *)self groupingBehaviors];
    uint64_t v21 = [v20 mutableCopy];
    groupingBehaviors = v4->_groupingBehaviors;
    v4->_groupingBehaviors = (NSMutableDictionary *)v21;

    v23 = [(DOCUserInterfaceState *)self userPrefersTiledSidebarHidden];
    v24 = (void *)[v23 copy];
    [(DOCUserInterfaceState *)v4 setUserPrefersTiledSidebarHidden:v24];

    uint64_t v25 = [(DOCUserInterfaceState *)self lastUpdatedDate];
    uint64_t v26 = (void *)[v25 copy];
    [(DOCUserInterfaceState *)v4 setLastUpdatedDate:v26];

    id v27 = [(DOCUserInterfaceState *)self sizeSetting];
    v28 = (void *)[v27 copy];
    [(DOCUserInterfaceState *)v4 setSizeSetting:v28];
  }
  return v4;
}

- (NSNumber)isInUIPDocumentLanding
{
  return self->_isInUIPDocumentLanding;
}

- (void)setIsInUIPDocumentLanding:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isInUIPDocumentLanding, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_userPrefersTiledSidebarHidden, 0);
  objc_storeStrong((id *)&self->_displayModes, 0);
  objc_storeStrong((id *)&self->_groupingBehaviors, 0);
  objc_storeStrong((id *)&self->_sortingMode, 0);
  objc_storeStrong((id *)&self->_sizeSetting, 0);
  objc_storeStrong((id *)&self->_lastUsedOpenSaveLocation, 0);
  objc_storeStrong((id *)&self->_mostRecentlyVisitedBrowsedState_FullBrowser, 0);
  objc_storeStrong((id *)&self->_mostRecentlyVisitedBrowsedState_Shared, 0);
  objc_storeStrong((id *)&self->_mostRecentlyVisitedBrowsedState_Recents, 0);
  objc_storeStrong((id *)&self->_mostRecentlyVisitedEffectiveTabIdentifier, 0);
}

+ (void)unarchivedFromData:(uint64_t)a1 configuration:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "+[DOCUserInterfaceState unarchivedFromData:configuration:error:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_213670000, a2, OS_LOG_TYPE_ERROR, "%s: Unable to unarchive most recent interface state. Error: %@", (uint8_t *)&v2, 0x16u);
}

@end