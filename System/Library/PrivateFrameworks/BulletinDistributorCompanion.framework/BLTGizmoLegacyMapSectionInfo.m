@interface BLTGizmoLegacyMapSectionInfo
- (BBSectionIcon)icon;
- (BLTGizmoLegacyMapSectionInfo)initWithNotificationMap:(id)a3;
- (NSString)displayName;
- (NSString)mappedParentSectionID;
- (NSString)mappedSectionID;
- (void)setDisplayName:(id)a3;
- (void)setIcon:(id)a3;
@end

@implementation BLTGizmoLegacyMapSectionInfo

- (BLTGizmoLegacyMapSectionInfo)initWithNotificationMap:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFFA08];
  v6 = [v4 allKeys];
  v7 = [v5 setWithArray:v6];
  if (BLTGizmoLegacyMapSectionInfoKeySet_onceToken != -1) {
    dispatch_once(&BLTGizmoLegacyMapSectionInfoKeySet_onceToken, &__block_literal_global_9);
  }
  int v8 = [v7 intersectsSet:BLTGizmoLegacyMapSectionInfoKeySet___BLTGizmoLegacyMapSectionInfoKeySet];

  if (v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)BLTGizmoLegacyMapSectionInfo;
    v9 = [(BLTGizmoLegacyMapSectionInfo *)&v13 init];
    if (v9)
    {
      uint64_t v10 = [v4 copy];
      notificationMap = v9->_notificationMap;
      v9->_notificationMap = (NSDictionary *)v10;
    }
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

- (NSString)mappedSectionID
{
  return (NSString *)[(NSDictionary *)self->_notificationMap objectForKeyedSubscript:@"sectionID"];
}

- (NSString)mappedParentSectionID
{
  return (NSString *)[(NSDictionary *)self->_notificationMap objectForKeyedSubscript:@"parentSectionID"];
}

- (BBSectionIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_notificationMap, 0);
}

@end