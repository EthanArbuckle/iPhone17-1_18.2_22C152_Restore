@interface GEOLogMsgEventPeriodicSettingsSummary
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAccount;
- (BOOL)hasDeviceConnection;
- (BOOL)hasDeviceSettings;
- (BOOL)hasElectricVehicleCount;
- (BOOL)hasFavoritesCount;
- (BOOL)hasHomeFavoriteSet;
- (BOOL)hasLearnFromAppEnabled;
- (BOOL)hasLicensePlateCount;
- (BOOL)hasMapSettings;
- (BOOL)hasMapUiShown;
- (BOOL)hasMapsFeatures;
- (BOOL)hasMapsUserSettings;
- (BOOL)hasNotificationsEnabled;
- (BOOL)hasPersonalCollectionsCount;
- (BOOL)hasRoutingSettings;
- (BOOL)hasSiriSuggestionsEnabled;
- (BOOL)hasWorkFavoriteSet;
- (BOOL)homeFavoriteSet;
- (BOOL)isEqual:(id)a3;
- (BOOL)learnFromAppEnabled;
- (BOOL)notificationsEnabled;
- (BOOL)readFrom:(id)a3;
- (BOOL)siriSuggestionsEnabled;
- (BOOL)workFavoriteSet;
- (GEOLogMsgEventPeriodicSettingsSummary)init;
- (GEOLogMsgEventPeriodicSettingsSummary)initWithData:(id)a3;
- (GEOLogMsgEventPeriodicSettingsSummary)initWithDictionary:(id)a3;
- (GEOLogMsgEventPeriodicSettingsSummary)initWithJSON:(id)a3;
- (GEOLogMsgStateAccount)account;
- (GEOLogMsgStateDeviceConnection)deviceConnection;
- (GEOLogMsgStateDeviceSettings)deviceSettings;
- (GEOLogMsgStateMapSettings)mapSettings;
- (GEOLogMsgStateMapUIShown)mapUiShown;
- (GEOLogMsgStateMapsFeatures)mapsFeatures;
- (GEOLogMsgStateMapsUserSettings)mapsUserSettings;
- (GEOLogMsgStateRoutingSettings)routingSettings;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)electricVehicleCount;
- (unsigned)favoritesCount;
- (unsigned)licensePlateCount;
- (unsigned)personalCollectionsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAccount;
- (void)_readDeviceConnection;
- (void)_readDeviceSettings;
- (void)_readMapSettings;
- (void)_readMapUiShown;
- (void)_readMapsFeatures;
- (void)_readMapsUserSettings;
- (void)_readRoutingSettings;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAccount:(id)a3;
- (void)setDeviceConnection:(id)a3;
- (void)setDeviceSettings:(id)a3;
- (void)setElectricVehicleCount:(unsigned int)a3;
- (void)setFavoritesCount:(unsigned int)a3;
- (void)setHasElectricVehicleCount:(BOOL)a3;
- (void)setHasFavoritesCount:(BOOL)a3;
- (void)setHasHomeFavoriteSet:(BOOL)a3;
- (void)setHasLearnFromAppEnabled:(BOOL)a3;
- (void)setHasLicensePlateCount:(BOOL)a3;
- (void)setHasNotificationsEnabled:(BOOL)a3;
- (void)setHasPersonalCollectionsCount:(BOOL)a3;
- (void)setHasSiriSuggestionsEnabled:(BOOL)a3;
- (void)setHasWorkFavoriteSet:(BOOL)a3;
- (void)setHomeFavoriteSet:(BOOL)a3;
- (void)setLearnFromAppEnabled:(BOOL)a3;
- (void)setLicensePlateCount:(unsigned int)a3;
- (void)setMapSettings:(id)a3;
- (void)setMapUiShown:(id)a3;
- (void)setMapsFeatures:(id)a3;
- (void)setMapsUserSettings:(id)a3;
- (void)setNotificationsEnabled:(BOOL)a3;
- (void)setPersonalCollectionsCount:(unsigned int)a3;
- (void)setRoutingSettings:(id)a3;
- (void)setSiriSuggestionsEnabled:(BOOL)a3;
- (void)setWorkFavoriteSet:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventPeriodicSettingsSummary

- (GEOLogMsgEventPeriodicSettingsSummary)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventPeriodicSettingsSummary;
  v2 = [(GEOLogMsgEventPeriodicSettingsSummary *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventPeriodicSettingsSummary)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventPeriodicSettingsSummary;
  v3 = [(GEOLogMsgEventPeriodicSettingsSummary *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMapSettings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 117) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapSettings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasMapSettings
{
  return self->_mapSettings != 0;
}

- (GEOLogMsgStateMapSettings)mapSettings
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readMapSettings]((uint64_t)self);
  mapSettings = self->_mapSettings;

  return mapSettings;
}

- (void)setMapSettings:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x21000u;
  objc_storeStrong((id *)&self->_mapSettings, a3);
}

- (void)_readMapUiShown
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 117) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapUiShown_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasMapUiShown
{
  return self->_mapUiShown != 0;
}

- (GEOLogMsgStateMapUIShown)mapUiShown
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readMapUiShown]((uint64_t)self);
  mapUiShown = self->_mapUiShown;

  return mapUiShown;
}

- (void)setMapUiShown:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x22000u;
  objc_storeStrong((id *)&self->_mapUiShown, a3);
}

- (BOOL)notificationsEnabled
{
  return self->_notificationsEnabled;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20040u;
  self->_notificationsEnabled = a3;
}

- (void)setHasNotificationsEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 131136;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasNotificationsEnabled
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (BOOL)homeFavoriteSet
{
  return self->_homeFavoriteSet;
}

- (void)setHomeFavoriteSet:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20010u;
  self->_homeFavoriteSet = a3;
}

- (void)setHasHomeFavoriteSet:(BOOL)a3
{
  if (a3) {
    int v3 = 131088;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasHomeFavoriteSet
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (BOOL)workFavoriteSet
{
  return self->_workFavoriteSet;
}

- (void)setWorkFavoriteSet:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20100u;
  self->_workFavoriteSet = a3;
}

- (void)setHasWorkFavoriteSet:(BOOL)a3
{
  if (a3) {
    int v3 = 131328;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasWorkFavoriteSet
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (unsigned)favoritesCount
{
  return self->_favoritesCount;
}

- (void)setFavoritesCount:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20002u;
  self->_favoritesCount = a3;
}

- (void)setHasFavoritesCount:(BOOL)a3
{
  if (a3) {
    int v3 = 131074;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFDFFFD | v3);
}

- (BOOL)hasFavoritesCount
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)personalCollectionsCount
{
  return self->_personalCollectionsCount;
}

- (void)setPersonalCollectionsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20008u;
  self->_personalCollectionsCount = a3;
}

- (void)setHasPersonalCollectionsCount:(BOOL)a3
{
  if (a3) {
    int v3 = 131080;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPersonalCollectionsCount
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)electricVehicleCount
{
  return self->_electricVehicleCount;
}

- (void)setElectricVehicleCount:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20001u;
  self->_electricVehicleCount = a3;
}

- (void)setHasElectricVehicleCount:(BOOL)a3
{
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x20000);
}

- (BOOL)hasElectricVehicleCount
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unsigned)licensePlateCount
{
  return self->_licensePlateCount;
}

- (void)setLicensePlateCount:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20004u;
  self->_licensePlateCount = a3;
}

- (void)setHasLicensePlateCount:(BOOL)a3
{
  if (a3) {
    int v3 = 131076;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasLicensePlateCount
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)siriSuggestionsEnabled
{
  return self->_siriSuggestionsEnabled;
}

- (void)setSiriSuggestionsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20080u;
  self->_siriSuggestionsEnabled = a3;
}

- (void)setHasSiriSuggestionsEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 131200;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasSiriSuggestionsEnabled
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (BOOL)learnFromAppEnabled
{
  return self->_learnFromAppEnabled;
}

- (void)setLearnFromAppEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20020u;
  self->_learnFromAppEnabled = a3;
}

- (void)setHasLearnFromAppEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 131104;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasLearnFromAppEnabled
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_readAccount
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 117) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAccount_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasAccount
{
  return self->_account != 0;
}

- (GEOLogMsgStateAccount)account
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readAccount]((uint64_t)self);
  account = self->_account;

  return account;
}

- (void)setAccount:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20200u;
  objc_storeStrong((id *)&self->_account, a3);
}

- (void)_readDeviceConnection
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 117) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceConnection_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasDeviceConnection
{
  return self->_deviceConnection != 0;
}

- (GEOLogMsgStateDeviceConnection)deviceConnection
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readDeviceConnection]((uint64_t)self);
  deviceConnection = self->_deviceConnection;

  return deviceConnection;
}

- (void)setDeviceConnection:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20400u;
  objc_storeStrong((id *)&self->_deviceConnection, a3);
}

- (void)_readMapsUserSettings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 117) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsUserSettings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasMapsUserSettings
{
  return self->_mapsUserSettings != 0;
}

- (GEOLogMsgStateMapsUserSettings)mapsUserSettings
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readMapsUserSettings]((uint64_t)self);
  mapsUserSettings = self->_mapsUserSettings;

  return mapsUserSettings;
}

- (void)setMapsUserSettings:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x28000u;
  objc_storeStrong((id *)&self->_mapsUserSettings, a3);
}

- (void)_readRoutingSettings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 118) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoutingSettings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasRoutingSettings
{
  return self->_routingSettings != 0;
}

- (GEOLogMsgStateRoutingSettings)routingSettings
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readRoutingSettings]((uint64_t)self);
  routingSettings = self->_routingSettings;

  return routingSettings;
}

- (void)setRoutingSettings:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x30000u;
  objc_storeStrong((id *)&self->_routingSettings, a3);
}

- (void)_readMapsFeatures
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 117) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsFeatures_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasMapsFeatures
{
  return self->_mapsFeatures != 0;
}

- (GEOLogMsgStateMapsFeatures)mapsFeatures
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readMapsFeatures]((uint64_t)self);
  mapsFeatures = self->_mapsFeatures;

  return mapsFeatures;
}

- (void)setMapsFeatures:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x24000u;
  objc_storeStrong((id *)&self->_mapsFeatures, a3);
}

- (void)_readDeviceSettings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 117) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceSettings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasDeviceSettings
{
  return self->_deviceSettings != 0;
}

- (GEOLogMsgStateDeviceSettings)deviceSettings
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readDeviceSettings]((uint64_t)self);
  deviceSettings = self->_deviceSettings;

  return deviceSettings;
}

- (void)setDeviceSettings:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20800u;
  objc_storeStrong((id *)&self->_deviceSettings, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventPeriodicSettingsSummary;
  v4 = [(GEOLogMsgEventPeriodicSettingsSummary *)&v8 description];
  v5 = [(GEOLogMsgEventPeriodicSettingsSummary *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventPeriodicSettingsSummary _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_89;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 mapSettings];
  objc_super v6 = v5;
  if (v5)
  {
    if (a2)
    {
      objc_super v7 = [v5 jsonRepresentation];
      objc_super v8 = @"mapSettings";
    }
    else
    {
      objc_super v7 = [v5 dictionaryRepresentation];
      objc_super v8 = @"map_settings";
    }
    [v4 setObject:v7 forKey:v8];
  }
  v9 = [(id)a1 mapUiShown];
  v10 = v9;
  if (v9)
  {
    if (a2)
    {
      v11 = [v9 jsonRepresentation];
      v12 = @"mapUiShown";
    }
    else
    {
      v11 = [v9 dictionaryRepresentation];
      v12 = @"map_ui_shown";
    }
    [v4 setObject:v11 forKey:v12];
  }
  int v13 = *(_DWORD *)(a1 + 116);
  if ((v13 & 0x40) != 0)
  {
    v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 110)];
    if (a2) {
      v19 = @"notificationsEnabled";
    }
    else {
      v19 = @"notifications_enabled";
    }
    [v4 setObject:v18 forKey:v19];

    int v13 = *(_DWORD *)(a1 + 116);
    if ((v13 & 0x10) == 0)
    {
LABEL_14:
      if ((v13 & 0x100) == 0) {
        goto LABEL_15;
      }
      goto LABEL_36;
    }
  }
  else if ((v13 & 0x10) == 0)
  {
    goto LABEL_14;
  }
  v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 108)];
  if (a2) {
    v21 = @"homeFavoriteSet";
  }
  else {
    v21 = @"home_favorite_set";
  }
  [v4 setObject:v20 forKey:v21];

  int v13 = *(_DWORD *)(a1 + 116);
  if ((v13 & 0x100) == 0)
  {
LABEL_15:
    if ((v13 & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_36:
  v22 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 112)];
  if (a2) {
    v23 = @"workFavoriteSet";
  }
  else {
    v23 = @"work_favorite_set";
  }
  [v4 setObject:v22 forKey:v23];

  int v13 = *(_DWORD *)(a1 + 116);
  if ((v13 & 2) == 0)
  {
LABEL_16:
    if ((v13 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_44;
  }
LABEL_40:
  v24 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 96)];
  if (a2) {
    v25 = @"favoritesCount";
  }
  else {
    v25 = @"favorites_count";
  }
  [v4 setObject:v24 forKey:v25];

  int v13 = *(_DWORD *)(a1 + 116);
  if ((v13 & 8) == 0)
  {
LABEL_17:
    if ((v13 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_44:
  v26 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 104)];
  if (a2) {
    v27 = @"personalCollectionsCount";
  }
  else {
    v27 = @"personal_collections_count";
  }
  [v4 setObject:v26 forKey:v27];

  int v13 = *(_DWORD *)(a1 + 116);
  if ((v13 & 1) == 0)
  {
LABEL_18:
    if ((v13 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_52;
  }
LABEL_48:
  v28 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
  if (a2) {
    v29 = @"electricVehicleCount";
  }
  else {
    v29 = @"electric_vehicle_count";
  }
  [v4 setObject:v28 forKey:v29];

  int v13 = *(_DWORD *)(a1 + 116);
  if ((v13 & 4) == 0)
  {
LABEL_19:
    if ((v13 & 0x80) == 0) {
      goto LABEL_20;
    }
LABEL_56:
    v32 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 111)];
    if (a2) {
      v33 = @"siriSuggestionsEnabled";
    }
    else {
      v33 = @"siri_suggestions_enabled";
    }
    [v4 setObject:v32 forKey:v33];

    if ((*(_DWORD *)(a1 + 116) & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }
LABEL_52:
  v30 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 100)];
  if (a2) {
    v31 = @"licensePlateCount";
  }
  else {
    v31 = @"license_plate_count";
  }
  [v4 setObject:v30 forKey:v31];

  int v13 = *(_DWORD *)(a1 + 116);
  if ((v13 & 0x80) != 0) {
    goto LABEL_56;
  }
LABEL_20:
  if ((v13 & 0x20) != 0)
  {
LABEL_21:
    v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 109)];
    if (a2) {
      v15 = @"learnFromAppEnabled";
    }
    else {
      v15 = @"learn_from_app_enabled";
    }
    [v4 setObject:v14 forKey:v15];
  }
LABEL_25:
  v16 = [(id)a1 account];
  v17 = v16;
  if (v16)
  {
    if (a2) {
      [v16 jsonRepresentation];
    }
    else {
    v34 = [v16 dictionaryRepresentation];
    }
    [v4 setObject:v34 forKey:@"account"];
  }
  v35 = [(id)a1 deviceConnection];
  v36 = v35;
  if (v35)
  {
    if (a2)
    {
      v37 = [v35 jsonRepresentation];
      v38 = @"deviceConnection";
    }
    else
    {
      v37 = [v35 dictionaryRepresentation];
      v38 = @"device_connection";
    }
    [v4 setObject:v37 forKey:v38];
  }
  v39 = [(id)a1 mapsUserSettings];
  v40 = v39;
  if (v39)
  {
    if (a2)
    {
      v41 = [v39 jsonRepresentation];
      v42 = @"mapsUserSettings";
    }
    else
    {
      v41 = [v39 dictionaryRepresentation];
      v42 = @"maps_user_settings";
    }
    [v4 setObject:v41 forKey:v42];
  }
  v43 = [(id)a1 routingSettings];
  v44 = v43;
  if (v43)
  {
    if (a2)
    {
      v45 = [v43 jsonRepresentation];
      v46 = @"routingSettings";
    }
    else
    {
      v45 = [v43 dictionaryRepresentation];
      v46 = @"routing_settings";
    }
    [v4 setObject:v45 forKey:v46];
  }
  v47 = [(id)a1 mapsFeatures];
  v48 = v47;
  if (v47)
  {
    if (a2)
    {
      v49 = [v47 jsonRepresentation];
      v50 = @"mapsFeatures";
    }
    else
    {
      v49 = [v47 dictionaryRepresentation];
      v50 = @"maps_features";
    }
    [v4 setObject:v49 forKey:v50];
  }
  v51 = [(id)a1 deviceSettings];
  v52 = v51;
  if (v51)
  {
    if (a2)
    {
      v53 = [v51 jsonRepresentation];
      v54 = @"deviceSettings";
    }
    else
    {
      v53 = [v51 dictionaryRepresentation];
      v54 = @"device_settings";
    }
    [v4 setObject:v53 forKey:v54];
  }
LABEL_89:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventPeriodicSettingsSummary _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventPeriodicSettingsSummary)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventPeriodicSettingsSummary *)-[GEOLogMsgEventPeriodicSettingsSummary _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"mapSettings";
      }
      else {
        objc_super v6 = @"map_settings";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOLogMsgStateMapSettings alloc];
        if (a3) {
          uint64_t v9 = [(GEOLogMsgStateMapSettings *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOLogMsgStateMapSettings *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setMapSettings:v9];
      }
      if (a3) {
        v11 = @"mapUiShown";
      }
      else {
        v11 = @"map_ui_shown";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v13 = [GEOLogMsgStateMapUIShown alloc];
        if (a3) {
          uint64_t v14 = [(GEOLogMsgStateMapUIShown *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOLogMsgStateMapUIShown *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setMapUiShown:v14];
      }
      if (a3) {
        v16 = @"notificationsEnabled";
      }
      else {
        v16 = @"notifications_enabled";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNotificationsEnabled:", objc_msgSend(v17, "BOOLValue"));
      }

      if (a3) {
        v18 = @"homeFavoriteSet";
      }
      else {
        v18 = @"home_favorite_set";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHomeFavoriteSet:", objc_msgSend(v19, "BOOLValue"));
      }

      if (a3) {
        v20 = @"workFavoriteSet";
      }
      else {
        v20 = @"work_favorite_set";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setWorkFavoriteSet:", objc_msgSend(v21, "BOOLValue"));
      }

      if (a3) {
        v22 = @"favoritesCount";
      }
      else {
        v22 = @"favorites_count";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setFavoritesCount:", objc_msgSend(v23, "unsignedIntValue"));
      }

      if (a3) {
        v24 = @"personalCollectionsCount";
      }
      else {
        v24 = @"personal_collections_count";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setPersonalCollectionsCount:", objc_msgSend(v25, "unsignedIntValue"));
      }

      if (a3) {
        v26 = @"electricVehicleCount";
      }
      else {
        v26 = @"electric_vehicle_count";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setElectricVehicleCount:", objc_msgSend(v27, "unsignedIntValue"));
      }

      if (a3) {
        v28 = @"licensePlateCount";
      }
      else {
        v28 = @"license_plate_count";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLicensePlateCount:", objc_msgSend(v29, "unsignedIntValue"));
      }

      if (a3) {
        v30 = @"siriSuggestionsEnabled";
      }
      else {
        v30 = @"siri_suggestions_enabled";
      }
      v31 = [v5 objectForKeyedSubscript:v30];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSiriSuggestionsEnabled:", objc_msgSend(v31, "BOOLValue"));
      }

      if (a3) {
        v32 = @"learnFromAppEnabled";
      }
      else {
        v32 = @"learn_from_app_enabled";
      }
      v33 = [v5 objectForKeyedSubscript:v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLearnFromAppEnabled:", objc_msgSend(v33, "BOOLValue"));
      }

      v34 = [v5 objectForKeyedSubscript:@"account"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = [GEOLogMsgStateAccount alloc];
        if (a3) {
          uint64_t v36 = [(GEOLogMsgStateAccount *)v35 initWithJSON:v34];
        }
        else {
          uint64_t v36 = [(GEOLogMsgStateAccount *)v35 initWithDictionary:v34];
        }
        v37 = (void *)v36;
        [a1 setAccount:v36];
      }
      if (a3) {
        v38 = @"deviceConnection";
      }
      else {
        v38 = @"device_connection";
      }
      v39 = [v5 objectForKeyedSubscript:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40 = [GEOLogMsgStateDeviceConnection alloc];
        if (a3) {
          uint64_t v41 = [(GEOLogMsgStateDeviceConnection *)v40 initWithJSON:v39];
        }
        else {
          uint64_t v41 = [(GEOLogMsgStateDeviceConnection *)v40 initWithDictionary:v39];
        }
        v42 = (void *)v41;
        [a1 setDeviceConnection:v41];
      }
      if (a3) {
        v43 = @"mapsUserSettings";
      }
      else {
        v43 = @"maps_user_settings";
      }
      v44 = [v5 objectForKeyedSubscript:v43];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v45 = [GEOLogMsgStateMapsUserSettings alloc];
        if (a3) {
          uint64_t v46 = [(GEOLogMsgStateMapsUserSettings *)v45 initWithJSON:v44];
        }
        else {
          uint64_t v46 = [(GEOLogMsgStateMapsUserSettings *)v45 initWithDictionary:v44];
        }
        v47 = (void *)v46;
        [a1 setMapsUserSettings:v46];
      }
      if (a3) {
        v48 = @"routingSettings";
      }
      else {
        v48 = @"routing_settings";
      }
      v49 = [v5 objectForKeyedSubscript:v48];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v50 = [GEOLogMsgStateRoutingSettings alloc];
        if (a3) {
          uint64_t v51 = [(GEOLogMsgStateRoutingSettings *)v50 initWithJSON:v49];
        }
        else {
          uint64_t v51 = [(GEOLogMsgStateRoutingSettings *)v50 initWithDictionary:v49];
        }
        v52 = (void *)v51;
        [a1 setRoutingSettings:v51];
      }
      if (a3) {
        v53 = @"mapsFeatures";
      }
      else {
        v53 = @"maps_features";
      }
      v54 = [v5 objectForKeyedSubscript:v53];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v55 = [GEOLogMsgStateMapsFeatures alloc];
        if (a3) {
          uint64_t v56 = [(GEOLogMsgStateMapsFeatures *)v55 initWithJSON:v54];
        }
        else {
          uint64_t v56 = [(GEOLogMsgStateMapsFeatures *)v55 initWithDictionary:v54];
        }
        v57 = (void *)v56;
        [a1 setMapsFeatures:v56];
      }
      if (a3) {
        v58 = @"deviceSettings";
      }
      else {
        v58 = @"device_settings";
      }
      v59 = [v5 objectForKeyedSubscript:v58];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v60 = [GEOLogMsgStateDeviceSettings alloc];
        if (a3) {
          uint64_t v61 = [(GEOLogMsgStateDeviceSettings *)v60 initWithJSON:v59];
        }
        else {
          uint64_t v61 = [(GEOLogMsgStateDeviceSettings *)v60 initWithDictionary:v59];
        }
        v62 = (void *)v61;
        [a1 setDeviceSettings:v61];
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventPeriodicSettingsSummary)initWithJSON:(id)a3
{
  return (GEOLogMsgEventPeriodicSettingsSummary *)-[GEOLogMsgEventPeriodicSettingsSummary _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_4117;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_4118;
    }
    GEOLogMsgEventPeriodicSettingsSummaryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgEventPeriodicSettingsSummaryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventPeriodicSettingsSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventPeriodicSettingsSummaryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgEventPeriodicSettingsSummaryIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
    goto LABEL_39;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventPeriodicSettingsSummary *)self readAll:0];
  if (self->_mapSettings) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_mapUiShown) {
    PBDataWriterWriteSubmessage();
  }
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x10) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&flags & 0x100) == 0) {
        goto LABEL_10;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&flags & 0x10) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteBOOLField();
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&flags & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  if ((*(unsigned char *)&flags & 1) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_15;
    }
LABEL_36:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_flags & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) != 0) {
    goto LABEL_36;
  }
LABEL_15:
  if ((*(unsigned char *)&flags & 0x20) != 0) {
LABEL_16:
  }
    PBDataWriterWriteBOOLField();
LABEL_17:
  if (self->_account) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_deviceConnection) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_mapsUserSettings) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_routingSettings) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_mapsFeatures) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_deviceSettings) {
    PBDataWriterWriteSubmessage();
  }
LABEL_39:
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOLogMsgEventPeriodicSettingsSummary *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 20) = self->_readerMarkPos;
  *((_DWORD *)v6 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_mapSettings) {
    objc_msgSend(v6, "setMapSettings:");
  }
  if (self->_mapUiShown) {
    objc_msgSend(v6, "setMapUiShown:");
  }
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  id v5 = v6;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    *((unsigned char *)v6 + 110) = self->_notificationsEnabled;
    *((_DWORD *)v6 + 29) |= 0x40u;
    $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x10) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&flags & 0x100) == 0) {
        goto LABEL_8;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v6 + 108) = self->_homeFavoriteSet;
  *((_DWORD *)v6 + 29) |= 0x10u;
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((unsigned char *)v6 + 112) = self->_workFavoriteSet;
  *((_DWORD *)v6 + 29) |= 0x100u;
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v6 + 24) = self->_favoritesCount;
  *((_DWORD *)v6 + 29) |= 2u;
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&flags & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v6 + 26) = self->_personalCollectionsCount;
  *((_DWORD *)v6 + 29) |= 8u;
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  if ((*(unsigned char *)&flags & 1) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v6 + 23) = self->_electricVehicleCount;
  *((_DWORD *)v6 + 29) |= 1u;
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v6 + 25) = self->_licensePlateCount;
  *((_DWORD *)v6 + 29) |= 4u;
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_37:
  *((unsigned char *)v6 + 111) = self->_siriSuggestionsEnabled;
  *((_DWORD *)v6 + 29) |= 0x80u;
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_14:
    *((unsigned char *)v6 + 109) = self->_learnFromAppEnabled;
    *((_DWORD *)v6 + 29) |= 0x20u;
  }
LABEL_15:
  if (self->_account)
  {
    objc_msgSend(v6, "setAccount:");
    id v5 = v6;
  }
  if (self->_deviceConnection)
  {
    objc_msgSend(v6, "setDeviceConnection:");
    id v5 = v6;
  }
  if (self->_mapsUserSettings)
  {
    objc_msgSend(v6, "setMapsUserSettings:");
    id v5 = v6;
  }
  if (self->_routingSettings)
  {
    objc_msgSend(v6, "setRoutingSettings:");
    id v5 = v6;
  }
  if (self->_mapsFeatures)
  {
    objc_msgSend(v6, "setMapsFeatures:");
    id v5 = v6;
  }
  if (self->_deviceSettings)
  {
    objc_msgSend(v6, "setDeviceSettings:");
    id v5 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventPeriodicSettingsSummary *)self readAll:0];
    id v9 = [(GEOLogMsgStateMapSettings *)self->_mapSettings copyWithZone:a3];
    v10 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v9;

    id v11 = [(GEOLogMsgStateMapUIShown *)self->_mapUiShown copyWithZone:a3];
    v12 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v11;

    $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x40) != 0)
    {
      *(unsigned char *)(v5 + 110) = self->_notificationsEnabled;
      *(_DWORD *)(v5 + 116) |= 0x40u;
      $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
      if ((*(unsigned char *)&flags & 0x10) == 0)
      {
LABEL_7:
        if ((*(_WORD *)&flags & 0x100) == 0) {
          goto LABEL_8;
        }
        goto LABEL_19;
      }
    }
    else if ((*(unsigned char *)&flags & 0x10) == 0)
    {
      goto LABEL_7;
    }
    *(unsigned char *)(v5 + 108) = self->_homeFavoriteSet;
    *(_DWORD *)(v5 + 116) |= 0x10u;
    $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_8:
      if ((*(unsigned char *)&flags & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_20;
    }
LABEL_19:
    *(unsigned char *)(v5 + 112) = self->_workFavoriteSet;
    *(_DWORD *)(v5 + 116) |= 0x100u;
    $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
LABEL_20:
    *(_DWORD *)(v5 + 96) = self->_favoritesCount;
    *(_DWORD *)(v5 + 116) |= 2u;
    $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_10:
      if ((*(unsigned char *)&flags & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_22;
    }
LABEL_21:
    *(_DWORD *)(v5 + 104) = self->_personalCollectionsCount;
    *(_DWORD *)(v5 + 116) |= 8u;
    $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_11:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_23;
    }
LABEL_22:
    *(_DWORD *)(v5 + 92) = self->_electricVehicleCount;
    *(_DWORD *)(v5 + 116) |= 1u;
    $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&flags & 0x80) == 0) {
        goto LABEL_13;
      }
      goto LABEL_24;
    }
LABEL_23:
    *(_DWORD *)(v5 + 100) = self->_licensePlateCount;
    *(_DWORD *)(v5 + 116) |= 4u;
    $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x80) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&flags & 0x20) == 0)
      {
LABEL_15:
        id v14 = [(GEOLogMsgStateAccount *)self->_account copyWithZone:a3];
        v15 = *(void **)(v5 + 16);
        *(void *)(v5 + 16) = v14;

        id v16 = [(GEOLogMsgStateDeviceConnection *)self->_deviceConnection copyWithZone:a3];
        v17 = *(void **)(v5 + 24);
        *(void *)(v5 + 24) = v16;

        id v18 = [(GEOLogMsgStateMapsUserSettings *)self->_mapsUserSettings copyWithZone:a3];
        v19 = *(void **)(v5 + 64);
        *(void *)(v5 + 64) = v18;

        id v20 = [(GEOLogMsgStateRoutingSettings *)self->_routingSettings copyWithZone:a3];
        v21 = *(void **)(v5 + 72);
        *(void *)(v5 + 72) = v20;

        id v22 = [(GEOLogMsgStateMapsFeatures *)self->_mapsFeatures copyWithZone:a3];
        v23 = *(void **)(v5 + 56);
        *(void *)(v5 + 56) = v22;

        id v24 = [(GEOLogMsgStateDeviceSettings *)self->_deviceSettings copyWithZone:a3];
        id v8 = *(id *)(v5 + 32);
        *(void *)(v5 + 32) = v24;
        goto LABEL_16;
      }
LABEL_14:
      *(unsigned char *)(v5 + 109) = self->_learnFromAppEnabled;
      *(_DWORD *)(v5 + 116) |= 0x20u;
      goto LABEL_15;
    }
LABEL_24:
    *(unsigned char *)(v5 + 111) = self->_siriSuggestionsEnabled;
    *(_DWORD *)(v5 + 116) |= 0x80u;
    if ((*(_DWORD *)&self->_flags & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*((unsigned char *)&self->_flags + 2) & 2) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgEventPeriodicSettingsSummaryReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_16:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_78;
  }
  [(GEOLogMsgEventPeriodicSettingsSummary *)self readAll:1];
  [v4 readAll:1];
  mapSettings = self->_mapSettings;
  if ((unint64_t)mapSettings | *((void *)v4 + 5))
  {
    if (!-[GEOLogMsgStateMapSettings isEqual:](mapSettings, "isEqual:")) {
      goto LABEL_78;
    }
  }
  mapUiShown = self->_mapUiShown;
  if ((unint64_t)mapUiShown | *((void *)v4 + 6))
  {
    if (!-[GEOLogMsgStateMapUIShown isEqual:](mapUiShown, "isEqual:")) {
      goto LABEL_78;
    }
  }
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  int v8 = *((_DWORD *)v4 + 29);
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0) {
      goto LABEL_78;
    }
    if (self->_notificationsEnabled)
    {
      if (!*((unsigned char *)v4 + 110)) {
        goto LABEL_78;
      }
    }
    else if (*((unsigned char *)v4 + 110))
    {
      goto LABEL_78;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_78;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0) {
      goto LABEL_78;
    }
    if (self->_homeFavoriteSet)
    {
      if (!*((unsigned char *)v4 + 108)) {
        goto LABEL_78;
      }
    }
    else if (*((unsigned char *)v4 + 108))
    {
      goto LABEL_78;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0) {
      goto LABEL_78;
    }
    if (self->_workFavoriteSet)
    {
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_78;
      }
    }
    else if (*((unsigned char *)v4 + 112))
    {
      goto LABEL_78;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_78;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_favoritesCount != *((_DWORD *)v4 + 24)) {
      goto LABEL_78;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_78;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_personalCollectionsCount != *((_DWORD *)v4 + 26)) {
      goto LABEL_78;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_78;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v8 & 1) == 0 || self->_electricVehicleCount != *((_DWORD *)v4 + 23)) {
      goto LABEL_78;
    }
  }
  else if (v8)
  {
    goto LABEL_78;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_licensePlateCount != *((_DWORD *)v4 + 25)) {
      goto LABEL_78;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_78;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0) {
      goto LABEL_78;
    }
    if (self->_siriSuggestionsEnabled)
    {
      if (!*((unsigned char *)v4 + 111)) {
        goto LABEL_78;
      }
    }
    else if (*((unsigned char *)v4 + 111))
    {
      goto LABEL_78;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_78;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v8 & 0x20) != 0)
    {
      if (self->_learnFromAppEnabled)
      {
        if (!*((unsigned char *)v4 + 109)) {
          goto LABEL_78;
        }
        goto LABEL_66;
      }
      if (!*((unsigned char *)v4 + 109)) {
        goto LABEL_66;
      }
    }
LABEL_78:
    char v15 = 0;
    goto LABEL_79;
  }
  if ((v8 & 0x20) != 0) {
    goto LABEL_78;
  }
LABEL_66:
  account = self->_account;
  if ((unint64_t)account | *((void *)v4 + 2) && !-[GEOLogMsgStateAccount isEqual:](account, "isEqual:")) {
    goto LABEL_78;
  }
  deviceConnection = self->_deviceConnection;
  if ((unint64_t)deviceConnection | *((void *)v4 + 3))
  {
    if (!-[GEOLogMsgStateDeviceConnection isEqual:](deviceConnection, "isEqual:")) {
      goto LABEL_78;
    }
  }
  mapsUserSettings = self->_mapsUserSettings;
  if ((unint64_t)mapsUserSettings | *((void *)v4 + 8))
  {
    if (!-[GEOLogMsgStateMapsUserSettings isEqual:](mapsUserSettings, "isEqual:")) {
      goto LABEL_78;
    }
  }
  routingSettings = self->_routingSettings;
  if ((unint64_t)routingSettings | *((void *)v4 + 9))
  {
    if (!-[GEOLogMsgStateRoutingSettings isEqual:](routingSettings, "isEqual:")) {
      goto LABEL_78;
    }
  }
  mapsFeatures = self->_mapsFeatures;
  if ((unint64_t)mapsFeatures | *((void *)v4 + 7))
  {
    if (!-[GEOLogMsgStateMapsFeatures isEqual:](mapsFeatures, "isEqual:")) {
      goto LABEL_78;
    }
  }
  deviceSettings = self->_deviceSettings;
  if ((unint64_t)deviceSettings | *((void *)v4 + 4)) {
    char v15 = -[GEOLogMsgStateDeviceSettings isEqual:](deviceSettings, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_79:

  return v15;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventPeriodicSettingsSummary *)self readAll:1];
  unint64_t v3 = [(GEOLogMsgStateMapSettings *)self->_mapSettings hash];
  unint64_t v4 = [(GEOLogMsgStateMapUIShown *)self->_mapUiShown hash];
  $D63EE9E95D2419817D8490C7201791AB flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    uint64_t v6 = 2654435761 * self->_notificationsEnabled;
    if ((*(unsigned char *)&flags & 0x10) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_homeFavoriteSet;
      if ((*(_WORD *)&flags & 0x100) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
LABEL_4:
    uint64_t v8 = 2654435761 * self->_workFavoriteSet;
    if ((*(unsigned char *)&flags & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
LABEL_5:
    uint64_t v9 = 2654435761 * self->_favoritesCount;
    if ((*(unsigned char *)&flags & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
LABEL_6:
    uint64_t v10 = 2654435761 * self->_personalCollectionsCount;
    if (*(unsigned char *)&flags) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v10 = 0;
  if (*(unsigned char *)&flags)
  {
LABEL_7:
    uint64_t v11 = 2654435761 * self->_electricVehicleCount;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v11 = 0;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
LABEL_8:
    uint64_t v12 = 2654435761 * self->_licensePlateCount;
    if ((*(unsigned char *)&flags & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v13 = 0;
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v14 = 0;
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v12 = 0;
  if ((*(unsigned char *)&flags & 0x80) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v13 = 2654435761 * self->_siriSuggestionsEnabled;
  if ((*(unsigned char *)&flags & 0x20) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v14 = 2654435761 * self->_learnFromAppEnabled;
LABEL_20:
  unint64_t v15 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ [(GEOLogMsgStateAccount *)self->_account hash];
  unint64_t v16 = [(GEOLogMsgStateDeviceConnection *)self->_deviceConnection hash];
  unint64_t v17 = v16 ^ [(GEOLogMsgStateMapsUserSettings *)self->_mapsUserSettings hash];
  unint64_t v18 = v15 ^ v17 ^ [(GEOLogMsgStateRoutingSettings *)self->_routingSettings hash];
  unint64_t v19 = [(GEOLogMsgStateMapsFeatures *)self->_mapsFeatures hash];
  return v18 ^ v19 ^ [(GEOLogMsgStateDeviceSettings *)self->_deviceSettings hash];
}

- (void)mergeFrom:(id)a3
{
  id v22 = a3;
  [v22 readAll:0];
  unint64_t v4 = v22;
  mapSettings = self->_mapSettings;
  uint64_t v6 = v22[5];
  if (mapSettings)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOLogMsgStateMapSettings mergeFrom:](mapSettings, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOLogMsgEventPeriodicSettingsSummary setMapSettings:](self, "setMapSettings:");
  }
  unint64_t v4 = v22;
LABEL_7:
  mapUiShown = self->_mapUiShown;
  uint64_t v8 = v4[6];
  if (mapUiShown)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOLogMsgStateMapUIShown mergeFrom:](mapUiShown, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOLogMsgEventPeriodicSettingsSummary setMapUiShown:](self, "setMapUiShown:");
  }
  unint64_t v4 = v22;
LABEL_13:
  int v9 = *((_DWORD *)v4 + 29);
  if ((v9 & 0x40) != 0)
  {
    self->_notificationsEnabled = *((unsigned char *)v4 + 110);
    *(_DWORD *)&self->_flags |= 0x40u;
    int v9 = *((_DWORD *)v4 + 29);
    if ((v9 & 0x10) == 0)
    {
LABEL_15:
      if ((v9 & 0x100) == 0) {
        goto LABEL_16;
      }
      goto LABEL_28;
    }
  }
  else if ((v9 & 0x10) == 0)
  {
    goto LABEL_15;
  }
  self->_homeFavoriteSet = *((unsigned char *)v4 + 108);
  *(_DWORD *)&self->_flags |= 0x10u;
  int v9 = *((_DWORD *)v4 + 29);
  if ((v9 & 0x100) == 0)
  {
LABEL_16:
    if ((v9 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_workFavoriteSet = *((unsigned char *)v4 + 112);
  *(_DWORD *)&self->_flags |= 0x100u;
  int v9 = *((_DWORD *)v4 + 29);
  if ((v9 & 2) == 0)
  {
LABEL_17:
    if ((v9 & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_favoritesCount = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_flags |= 2u;
  int v9 = *((_DWORD *)v4 + 29);
  if ((v9 & 8) == 0)
  {
LABEL_18:
    if ((v9 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_personalCollectionsCount = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_flags |= 8u;
  int v9 = *((_DWORD *)v4 + 29);
  if ((v9 & 1) == 0)
  {
LABEL_19:
    if ((v9 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_electricVehicleCount = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_flags |= 1u;
  int v9 = *((_DWORD *)v4 + 29);
  if ((v9 & 4) == 0)
  {
LABEL_20:
    if ((v9 & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_licensePlateCount = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_flags |= 4u;
  int v9 = *((_DWORD *)v4 + 29);
  if ((v9 & 0x80) == 0)
  {
LABEL_21:
    if ((v9 & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_33:
  self->_siriSuggestionsEnabled = *((unsigned char *)v4 + 111);
  *(_DWORD *)&self->_flags |= 0x80u;
  if ((*((_DWORD *)v4 + 29) & 0x20) != 0)
  {
LABEL_22:
    self->_learnFromAppEnabled = *((unsigned char *)v4 + 109);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
LABEL_23:
  account = self->_account;
  uint64_t v11 = v4[2];
  if (account)
  {
    if (!v11) {
      goto LABEL_38;
    }
    -[GEOLogMsgStateAccount mergeFrom:](account, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_38;
    }
    -[GEOLogMsgEventPeriodicSettingsSummary setAccount:](self, "setAccount:");
  }
  unint64_t v4 = v22;
LABEL_38:
  deviceConnection = self->_deviceConnection;
  uint64_t v13 = v4[3];
  if (deviceConnection)
  {
    if (!v13) {
      goto LABEL_44;
    }
    -[GEOLogMsgStateDeviceConnection mergeFrom:](deviceConnection, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_44;
    }
    -[GEOLogMsgEventPeriodicSettingsSummary setDeviceConnection:](self, "setDeviceConnection:");
  }
  unint64_t v4 = v22;
LABEL_44:
  mapsUserSettings = self->_mapsUserSettings;
  uint64_t v15 = v4[8];
  if (mapsUserSettings)
  {
    if (!v15) {
      goto LABEL_50;
    }
    -[GEOLogMsgStateMapsUserSettings mergeFrom:](mapsUserSettings, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_50;
    }
    -[GEOLogMsgEventPeriodicSettingsSummary setMapsUserSettings:](self, "setMapsUserSettings:");
  }
  unint64_t v4 = v22;
LABEL_50:
  routingSettings = self->_routingSettings;
  uint64_t v17 = v4[9];
  if (routingSettings)
  {
    if (!v17) {
      goto LABEL_56;
    }
    -[GEOLogMsgStateRoutingSettings mergeFrom:](routingSettings, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_56;
    }
    [(GEOLogMsgEventPeriodicSettingsSummary *)self setRoutingSettings:"setRoutingSettings:"];
  }
  unint64_t v4 = v22;
LABEL_56:
  mapsFeatures = self->_mapsFeatures;
  uint64_t v19 = v4[7];
  if (mapsFeatures)
  {
    if (!v19) {
      goto LABEL_62;
    }
    -[GEOLogMsgStateMapsFeatures mergeFrom:](mapsFeatures, "mergeFrom:");
  }
  else
  {
    if (!v19) {
      goto LABEL_62;
    }
    -[GEOLogMsgEventPeriodicSettingsSummary setMapsFeatures:](self, "setMapsFeatures:");
  }
  unint64_t v4 = v22;
LABEL_62:
  deviceSettings = self->_deviceSettings;
  uint64_t v21 = v4[4];
  if (deviceSettings)
  {
    if (!v21) {
      goto LABEL_68;
    }
    -[GEOLogMsgStateDeviceSettings mergeFrom:](deviceSettings, "mergeFrom:");
  }
  else
  {
    if (!v21) {
      goto LABEL_68;
    }
    -[GEOLogMsgEventPeriodicSettingsSummary setDeviceSettings:](self, "setDeviceSettings:");
  }
  unint64_t v4 = v22;
LABEL_68:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingSettings, 0);
  objc_storeStrong((id *)&self->_mapsUserSettings, 0);
  objc_storeStrong((id *)&self->_mapsFeatures, 0);
  objc_storeStrong((id *)&self->_mapUiShown, 0);
  objc_storeStrong((id *)&self->_mapSettings, 0);
  objc_storeStrong((id *)&self->_deviceSettings, 0);
  objc_storeStrong((id *)&self->_deviceConnection, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end