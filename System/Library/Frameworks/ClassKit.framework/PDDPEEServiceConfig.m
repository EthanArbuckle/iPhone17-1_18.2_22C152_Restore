@interface PDDPEEServiceConfig
+ (Class)defaultSyncZoneNamesType;
+ (Class)serviceBagType;
+ (Class)zoneSubscriptionsType;
- (BOOL)allowSharingOutsideOrg;
- (BOOL)analyticsOptedIn;
- (BOOL)classroomClassicAdHocModeEnabled;
- (BOOL)hasAllowSharingOutsideOrg;
- (BOOL)hasAnalyticsOptedIn;
- (BOOL)hasClassroomClassicAdHocModeEnabled;
- (BOOL)hasIsRosterSearchAllowed;
- (BOOL)hasMinimumSearchKeyLength;
- (BOOL)hasPersonlinkServiceContext;
- (BOOL)hasSearchCacheTtl;
- (BOOL)hasSearchLimitForGroupMemberSearch;
- (BOOL)hasServiceId;
- (BOOL)hasSyncFetchInterval;
- (BOOL)hasUseServerForRosterSearch;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRosterSearchAllowed;
- (BOOL)readFrom:(id)a3;
- (BOOL)useServerForRosterSearch;
- (NSMutableArray)defaultSyncZoneNames;
- (NSMutableArray)serviceBags;
- (NSMutableArray)zoneSubscriptions;
- (NSString)personlinkServiceContext;
- (NSString)serviceId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultSyncZoneNamesAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)serviceBagAtIndex:(unint64_t)a3;
- (id)zoneSubscriptionsAtIndex:(unint64_t)a3;
- (int)minimumSearchKeyLength;
- (int)searchCacheTtl;
- (int)searchLimitForGroupMemberSearch;
- (int)syncFetchInterval;
- (unint64_t)defaultSyncZoneNamesCount;
- (unint64_t)hash;
- (unint64_t)serviceBagsCount;
- (unint64_t)zoneSubscriptionsCount;
- (void)addDefaultSyncZoneNames:(id)a3;
- (void)addServiceBag:(id)a3;
- (void)addZoneSubscriptions:(id)a3;
- (void)clearDefaultSyncZoneNames;
- (void)clearServiceBags;
- (void)clearZoneSubscriptions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowSharingOutsideOrg:(BOOL)a3;
- (void)setAnalyticsOptedIn:(BOOL)a3;
- (void)setClassroomClassicAdHocModeEnabled:(BOOL)a3;
- (void)setDefaultSyncZoneNames:(id)a3;
- (void)setHasAllowSharingOutsideOrg:(BOOL)a3;
- (void)setHasAnalyticsOptedIn:(BOOL)a3;
- (void)setHasClassroomClassicAdHocModeEnabled:(BOOL)a3;
- (void)setHasIsRosterSearchAllowed:(BOOL)a3;
- (void)setHasMinimumSearchKeyLength:(BOOL)a3;
- (void)setHasSearchCacheTtl:(BOOL)a3;
- (void)setHasSearchLimitForGroupMemberSearch:(BOOL)a3;
- (void)setHasSyncFetchInterval:(BOOL)a3;
- (void)setHasUseServerForRosterSearch:(BOOL)a3;
- (void)setIsRosterSearchAllowed:(BOOL)a3;
- (void)setMinimumSearchKeyLength:(int)a3;
- (void)setPersonlinkServiceContext:(id)a3;
- (void)setSearchCacheTtl:(int)a3;
- (void)setSearchLimitForGroupMemberSearch:(int)a3;
- (void)setServiceBags:(id)a3;
- (void)setServiceId:(id)a3;
- (void)setSyncFetchInterval:(int)a3;
- (void)setUseServerForRosterSearch:(BOOL)a3;
- (void)setZoneSubscriptions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPEEServiceConfig

- (BOOL)hasServiceId
{
  return self->_serviceId != 0;
}

- (BOOL)hasPersonlinkServiceContext
{
  return self->_personlinkServiceContext != 0;
}

- (void)clearZoneSubscriptions
{
}

- (void)addZoneSubscriptions:(id)a3
{
  id v4 = a3;
  zoneSubscriptions = self->_zoneSubscriptions;
  id v8 = v4;
  if (!zoneSubscriptions)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_zoneSubscriptions;
    self->_zoneSubscriptions = v6;

    id v4 = v8;
    zoneSubscriptions = self->_zoneSubscriptions;
  }
  [(NSMutableArray *)zoneSubscriptions addObject:v4];
}

- (unint64_t)zoneSubscriptionsCount
{
  return (unint64_t)[(NSMutableArray *)self->_zoneSubscriptions count];
}

- (id)zoneSubscriptionsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_zoneSubscriptions objectAtIndex:a3];
}

+ (Class)zoneSubscriptionsType
{
  return (Class)objc_opt_class();
}

- (void)clearServiceBags
{
}

- (void)addServiceBag:(id)a3
{
  id v4 = a3;
  serviceBags = self->_serviceBags;
  id v8 = v4;
  if (!serviceBags)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_serviceBags;
    self->_serviceBags = v6;

    id v4 = v8;
    serviceBags = self->_serviceBags;
  }
  [(NSMutableArray *)serviceBags addObject:v4];
}

- (unint64_t)serviceBagsCount
{
  return (unint64_t)[(NSMutableArray *)self->_serviceBags count];
}

- (id)serviceBagAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_serviceBags objectAtIndex:a3];
}

+ (Class)serviceBagType
{
  return (Class)objc_opt_class();
}

- (void)setIsRosterSearchAllowed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isRosterSearchAllowed = a3;
}

- (void)setHasIsRosterSearchAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsRosterSearchAllowed
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setMinimumSearchKeyLength:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_minimumSearchKeyLength = a3;
}

- (void)setHasMinimumSearchKeyLength:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasMinimumSearchKeyLength
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setUseServerForRosterSearch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_useServerForRosterSearch = a3;
}

- (void)setHasUseServerForRosterSearch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasUseServerForRosterSearch
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)clearDefaultSyncZoneNames
{
}

- (void)addDefaultSyncZoneNames:(id)a3
{
  id v4 = a3;
  defaultSyncZoneNames = self->_defaultSyncZoneNames;
  id v8 = v4;
  if (!defaultSyncZoneNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_defaultSyncZoneNames;
    self->_defaultSyncZoneNames = v6;

    id v4 = v8;
    defaultSyncZoneNames = self->_defaultSyncZoneNames;
  }
  [(NSMutableArray *)defaultSyncZoneNames addObject:v4];
}

- (unint64_t)defaultSyncZoneNamesCount
{
  return (unint64_t)[(NSMutableArray *)self->_defaultSyncZoneNames count];
}

- (id)defaultSyncZoneNamesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_defaultSyncZoneNames objectAtIndex:a3];
}

+ (Class)defaultSyncZoneNamesType
{
  return (Class)objc_opt_class();
}

- (void)setSyncFetchInterval:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_syncFetchInterval = a3;
}

- (void)setHasSyncFetchInterval:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSyncFetchInterval
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSearchCacheTtl:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_searchCacheTtl = a3;
}

- (void)setHasSearchCacheTtl:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasSearchCacheTtl
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAnalyticsOptedIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_analyticsOptedIn = a3;
}

- (void)setHasAnalyticsOptedIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAnalyticsOptedIn
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAllowSharingOutsideOrg:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_allowSharingOutsideOrg = a3;
}

- (void)setHasAllowSharingOutsideOrg:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAllowSharingOutsideOrg
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setClassroomClassicAdHocModeEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_classroomClassicAdHocModeEnabled = a3;
}

- (void)setHasClassroomClassicAdHocModeEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasClassroomClassicAdHocModeEnabled
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setSearchLimitForGroupMemberSearch:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_searchLimitForGroupMemberSearch = a3;
}

- (void)setHasSearchLimitForGroupMemberSearch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSearchLimitForGroupMemberSearch
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPEEServiceConfig;
  __int16 v3 = [(PDDPEEServiceConfig *)&v7 description];
  id v4 = [(PDDPEEServiceConfig *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  serviceId = self->_serviceId;
  if (serviceId) {
    [v3 setObject:serviceId forKey:@"service_id"];
  }
  personlinkServiceContext = self->_personlinkServiceContext;
  if (personlinkServiceContext) {
    [v4 setObject:personlinkServiceContext forKey:@"personlink_service_context"];
  }
  zoneSubscriptions = self->_zoneSubscriptions;
  if (zoneSubscriptions) {
    [v4 setObject:zoneSubscriptions forKey:@"zone_subscriptions"];
  }
  if ([(NSMutableArray *)self->_serviceBags count])
  {
    id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_serviceBags, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v9 = self->_serviceBags;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "dictionaryRepresentation", (void)v28);
          [v8 addObject:v14];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"service_bag"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    v21 = +[NSNumber numberWithBool:self->_isRosterSearchAllowed];
    [v4 setObject:v21 forKey:@"is_roster_search_allowed"];

    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_18:
      if ((has & 0x100) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_18;
  }
  v22 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_minimumSearchKeyLength, (void)v28);
  [v4 setObject:v22 forKey:@"minimum_search_key_length"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_19:
    v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_useServerForRosterSearch, (void)v28);
    [v4 setObject:v16 forKey:@"use_server_for_roster_search"];
  }
LABEL_20:
  defaultSyncZoneNames = self->_defaultSyncZoneNames;
  if (defaultSyncZoneNames) {
    [v4 setObject:defaultSyncZoneNames forKey:@"default_sync_zone_names"];
  }
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 8) != 0)
  {
    v23 = +[NSNumber numberWithInt:self->_syncFetchInterval];
    [v4 setObject:v23 forKey:@"sync_fetch_interval"];

    __int16 v18 = (__int16)self->_has;
    if ((v18 & 2) == 0)
    {
LABEL_24:
      if ((v18 & 0x20) == 0) {
        goto LABEL_25;
      }
      goto LABEL_37;
    }
  }
  else if ((v18 & 2) == 0)
  {
    goto LABEL_24;
  }
  v24 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_searchCacheTtl, (void)v28);
  [v4 setObject:v24 forKey:@"search_cache_ttl"];

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x20) == 0)
  {
LABEL_25:
    if ((v18 & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_38;
  }
LABEL_37:
  v25 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_analyticsOptedIn, (void)v28);
  [v4 setObject:v25 forKey:@"analytics_opted_in"];

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x10) == 0)
  {
LABEL_26:
    if ((v18 & 0x40) == 0) {
      goto LABEL_27;
    }
    goto LABEL_39;
  }
LABEL_38:
  v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_allowSharingOutsideOrg, (void)v28);
  [v4 setObject:v26 forKey:@"allow_sharing_outside_org"];

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x40) == 0)
  {
LABEL_27:
    if ((v18 & 4) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_39:
  v27 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_classroomClassicAdHocModeEnabled, (void)v28);
  [v4 setObject:v27 forKey:@"classroom_classic_ad_hoc_mode_enabled"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_28:
    v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_searchLimitForGroupMemberSearch, (void)v28);
    [v4 setObject:v19 forKey:@"search_limit_for_group_member_search"];
  }
LABEL_29:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100094650(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_serviceId) {
    PBDataWriterWriteStringField();
  }
  if (self->_personlinkServiceContext) {
    PBDataWriterWriteStringField();
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = self->_zoneSubscriptions;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v7);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = self->_serviceBags;
  id v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v12);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_21:
      if ((has & 0x100) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_22:
  }
    PBDataWriterWriteBOOLField();
LABEL_23:
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v16 = self->_defaultSyncZoneNames;
  v17 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v17)
  {
    __int16 v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
        ++v20;
      }
      while (v18 != v20);
      __int16 v18 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v18);
  }

  __int16 v21 = (__int16)self->_has;
  if ((v21 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v21 = (__int16)self->_has;
    if ((v21 & 2) == 0)
    {
LABEL_32:
      if ((v21 & 0x20) == 0) {
        goto LABEL_33;
      }
      goto LABEL_43;
    }
  }
  else if ((v21 & 2) == 0)
  {
    goto LABEL_32;
  }
  PBDataWriterWriteInt32Field();
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x20) == 0)
  {
LABEL_33:
    if ((v21 & 0x10) == 0) {
      goto LABEL_34;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x10) == 0)
  {
LABEL_34:
    if ((v21 & 0x40) == 0) {
      goto LABEL_35;
    }
LABEL_45:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_has & 4) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x40) != 0) {
    goto LABEL_45;
  }
LABEL_35:
  if ((v21 & 4) != 0) {
LABEL_36:
  }
    PBDataWriterWriteInt32Field();
LABEL_37:
}

- (void)copyTo:(id)a3
{
  id v18 = a3;
  if (self->_serviceId) {
    objc_msgSend(v18, "setServiceId:");
  }
  if (self->_personlinkServiceContext) {
    objc_msgSend(v18, "setPersonlinkServiceContext:");
  }
  if ([(PDDPEEServiceConfig *)self zoneSubscriptionsCount])
  {
    [v18 clearZoneSubscriptions];
    unint64_t v4 = [(PDDPEEServiceConfig *)self zoneSubscriptionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(PDDPEEServiceConfig *)self zoneSubscriptionsAtIndex:i];
        [v18 addZoneSubscriptions:v7];
      }
    }
  }
  if ([(PDDPEEServiceConfig *)self serviceBagsCount])
  {
    [v18 clearServiceBags];
    unint64_t v8 = [(PDDPEEServiceConfig *)self serviceBagsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        id v11 = [(PDDPEEServiceConfig *)self serviceBagAtIndex:j];
        [v18 addServiceBag:v11];
      }
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
LABEL_32:
    *((_DWORD *)v18 + 4) = self->_minimumSearchKeyLength;
    *((_WORD *)v18 + 40) |= 1u;
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  *((unsigned char *)v18 + 75) = self->_isRosterSearchAllowed;
  *((_WORD *)v18 + 40) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if (has) {
    goto LABEL_32;
  }
LABEL_15:
  if ((has & 0x100) != 0)
  {
LABEL_16:
    *((unsigned char *)v18 + 76) = self->_useServerForRosterSearch;
    *((_WORD *)v18 + 40) |= 0x100u;
  }
LABEL_17:
  if ([(PDDPEEServiceConfig *)self defaultSyncZoneNamesCount])
  {
    [v18 clearDefaultSyncZoneNames];
    unint64_t v13 = [(PDDPEEServiceConfig *)self defaultSyncZoneNamesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        v16 = [(PDDPEEServiceConfig *)self defaultSyncZoneNamesAtIndex:k];
        [v18 addDefaultSyncZoneNames:v16];
      }
    }
  }
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 8) != 0)
  {
    *((_DWORD *)v18 + 14) = self->_syncFetchInterval;
    *((_WORD *)v18 + 40) |= 8u;
    __int16 v17 = (__int16)self->_has;
    if ((v17 & 2) == 0)
    {
LABEL_23:
      if ((v17 & 0x20) == 0) {
        goto LABEL_24;
      }
      goto LABEL_36;
    }
  }
  else if ((v17 & 2) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)v18 + 8) = self->_searchCacheTtl;
  *((_WORD *)v18 + 40) |= 2u;
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x20) == 0)
  {
LABEL_24:
    if ((v17 & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((unsigned char *)v18 + 73) = self->_analyticsOptedIn;
  *((_WORD *)v18 + 40) |= 0x20u;
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x10) == 0)
  {
LABEL_25:
    if ((v17 & 0x40) == 0) {
      goto LABEL_26;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((unsigned char *)v18 + 72) = self->_allowSharingOutsideOrg;
  *((_WORD *)v18 + 40) |= 0x10u;
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x40) == 0)
  {
LABEL_26:
    if ((v17 & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_38:
  *((unsigned char *)v18 + 74) = self->_classroomClassicAdHocModeEnabled;
  *((_WORD *)v18 + 40) |= 0x40u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_27:
    *((_DWORD *)v18 + 9) = self->_searchLimitForGroupMemberSearch;
    *((_WORD *)v18 + 40) |= 4u;
  }
LABEL_28:
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_serviceId copyWithZone:a3];
  objc_super v7 = (void *)v5[6];
  v5[6] = v6;

  id v8 = [(NSString *)self->_personlinkServiceContext copyWithZone:a3];
  unint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v10 = self->_zoneSubscriptions;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v40;
    do
    {
      unint64_t v14 = 0;
      do
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v39 + 1) + 8 * (void)v14) copyWithZone:a3];
        [v5 addZoneSubscriptions:v15];

        unint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v12);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v16 = self->_serviceBags;
  id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      v20 = 0;
      do
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)v20) copyWithZone:a3];
        [v5 addServiceBag:v21];

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v18);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *((unsigned char *)v5 + 75) = self->_isRosterSearchAllowed;
    *((_WORD *)v5 + 40) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_17:
      if ((has & 0x100) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v5 + 4) = self->_minimumSearchKeyLength;
  *((_WORD *)v5 + 40) |= 1u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_18:
    *((unsigned char *)v5 + 76) = self->_useServerForRosterSearch;
    *((_WORD *)v5 + 40) |= 0x100u;
  }
LABEL_19:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v23 = self->_defaultSyncZoneNames;
  id v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      long long v27 = 0;
      do
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * (void)v27), "copyWithZone:", a3, (void)v31);
        [v5 addDefaultSyncZoneNames:v28];

        long long v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v25);
  }

  __int16 v29 = (__int16)self->_has;
  if ((v29 & 8) != 0)
  {
    *((_DWORD *)v5 + 14) = self->_syncFetchInterval;
    *((_WORD *)v5 + 40) |= 8u;
    __int16 v29 = (__int16)self->_has;
    if ((v29 & 2) == 0)
    {
LABEL_28:
      if ((v29 & 0x20) == 0) {
        goto LABEL_29;
      }
      goto LABEL_39;
    }
  }
  else if ((v29 & 2) == 0)
  {
    goto LABEL_28;
  }
  *((_DWORD *)v5 + 8) = self->_searchCacheTtl;
  *((_WORD *)v5 + 40) |= 2u;
  __int16 v29 = (__int16)self->_has;
  if ((v29 & 0x20) == 0)
  {
LABEL_29:
    if ((v29 & 0x10) == 0) {
      goto LABEL_30;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((unsigned char *)v5 + 73) = self->_analyticsOptedIn;
  *((_WORD *)v5 + 40) |= 0x20u;
  __int16 v29 = (__int16)self->_has;
  if ((v29 & 0x10) == 0)
  {
LABEL_30:
    if ((v29 & 0x40) == 0) {
      goto LABEL_31;
    }
LABEL_41:
    *((unsigned char *)v5 + 74) = self->_classroomClassicAdHocModeEnabled;
    *((_WORD *)v5 + 40) |= 0x40u;
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return v5;
    }
    goto LABEL_32;
  }
LABEL_40:
  *((unsigned char *)v5 + 72) = self->_allowSharingOutsideOrg;
  *((_WORD *)v5 + 40) |= 0x10u;
  __int16 v29 = (__int16)self->_has;
  if ((v29 & 0x40) != 0) {
    goto LABEL_41;
  }
LABEL_31:
  if ((v29 & 4) != 0)
  {
LABEL_32:
    *((_DWORD *)v5 + 9) = self->_searchLimitForGroupMemberSearch;
    *((_WORD *)v5 + 40) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_73;
  }
  serviceId = self->_serviceId;
  if ((unint64_t)serviceId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](serviceId, "isEqual:")) {
      goto LABEL_73;
    }
  }
  personlinkServiceContext = self->_personlinkServiceContext;
  if ((unint64_t)personlinkServiceContext | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](personlinkServiceContext, "isEqual:")) {
      goto LABEL_73;
    }
  }
  zoneSubscriptions = self->_zoneSubscriptions;
  if ((unint64_t)zoneSubscriptions | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](zoneSubscriptions, "isEqual:")) {
      goto LABEL_73;
    }
  }
  serviceBags = self->_serviceBags;
  if ((unint64_t)serviceBags | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](serviceBags, "isEqual:")) {
      goto LABEL_73;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v10 = *((_WORD *)v4 + 40);
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0) {
      goto LABEL_73;
    }
    if (self->_isRosterSearchAllowed)
    {
      if (!*((unsigned char *)v4 + 75)) {
        goto LABEL_73;
      }
    }
    else if (*((unsigned char *)v4 + 75))
    {
      goto LABEL_73;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_73;
  }
  if (has)
  {
    if ((v10 & 1) == 0 || self->_minimumSearchKeyLength != *((_DWORD *)v4 + 4)) {
      goto LABEL_73;
    }
  }
  else if (v10)
  {
    goto LABEL_73;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0) {
      goto LABEL_73;
    }
    if (self->_useServerForRosterSearch)
    {
      if (!*((unsigned char *)v4 + 76)) {
        goto LABEL_73;
      }
    }
    else if (*((unsigned char *)v4 + 76))
    {
      goto LABEL_73;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
    goto LABEL_73;
  }
  defaultSyncZoneNames = self->_defaultSyncZoneNames;
  if ((unint64_t)defaultSyncZoneNames | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](defaultSyncZoneNames, "isEqual:")) {
      goto LABEL_73;
    }
    __int16 has = (__int16)self->_has;
    __int16 v10 = *((_WORD *)v4 + 40);
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_syncFetchInterval != *((_DWORD *)v4 + 14)) {
      goto LABEL_73;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_73;
  }
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_searchCacheTtl != *((_DWORD *)v4 + 8)) {
      goto LABEL_73;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_73;
  }
  if ((has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0) {
      goto LABEL_73;
    }
    if (self->_analyticsOptedIn)
    {
      if (!*((unsigned char *)v4 + 73)) {
        goto LABEL_73;
      }
    }
    else if (*((unsigned char *)v4 + 73))
    {
      goto LABEL_73;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_73;
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0) {
      goto LABEL_73;
    }
    if (self->_allowSharingOutsideOrg)
    {
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_73;
      }
    }
    else if (*((unsigned char *)v4 + 72))
    {
      goto LABEL_73;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_73;
  }
  if ((has & 0x40) != 0)
  {
    if ((v10 & 0x40) != 0)
    {
      if (self->_classroomClassicAdHocModeEnabled)
      {
        if (!*((unsigned char *)v4 + 74)) {
          goto LABEL_73;
        }
        goto LABEL_68;
      }
      if (!*((unsigned char *)v4 + 74)) {
        goto LABEL_68;
      }
    }
LABEL_73:
    BOOL v12 = 0;
    goto LABEL_74;
  }
  if ((v10 & 0x40) != 0) {
    goto LABEL_73;
  }
LABEL_68:
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_searchLimitForGroupMemberSearch != *((_DWORD *)v4 + 9)) {
      goto LABEL_73;
    }
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = (v10 & 4) == 0;
  }
LABEL_74:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_serviceId hash];
  NSUInteger v4 = [(NSString *)self->_personlinkServiceContext hash];
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_zoneSubscriptions hash];
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_serviceBags hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
    uint64_t v8 = 0;
    if (has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v9 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v8 = 2654435761 * self->_isRosterSearchAllowed;
  if ((has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v9 = 2654435761 * self->_minimumSearchKeyLength;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    uint64_t v10 = 2654435761 * self->_useServerForRosterSearch;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v10 = 0;
LABEL_8:
  unint64_t v11 = (unint64_t)[(NSMutableArray *)self->_defaultSyncZoneNames hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 8) != 0)
  {
    uint64_t v13 = 2654435761 * self->_syncFetchInterval;
    if ((v12 & 2) != 0)
    {
LABEL_10:
      uint64_t v14 = 2654435761 * self->_searchCacheTtl;
      if ((v12 & 0x20) != 0) {
        goto LABEL_11;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((v12 & 2) != 0) {
      goto LABEL_10;
    }
  }
  uint64_t v14 = 0;
  if ((v12 & 0x20) != 0)
  {
LABEL_11:
    uint64_t v15 = 2654435761 * self->_analyticsOptedIn;
    if ((v12 & 0x10) != 0) {
      goto LABEL_12;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v15 = 0;
  if ((v12 & 0x10) != 0)
  {
LABEL_12:
    uint64_t v16 = 2654435761 * self->_allowSharingOutsideOrg;
    if ((v12 & 0x40) != 0) {
      goto LABEL_13;
    }
LABEL_19:
    uint64_t v17 = 0;
    if ((v12 & 4) != 0) {
      goto LABEL_14;
    }
LABEL_20:
    uint64_t v18 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  }
LABEL_18:
  uint64_t v16 = 0;
  if ((v12 & 0x40) == 0) {
    goto LABEL_19;
  }
LABEL_13:
  uint64_t v17 = 2654435761 * self->_classroomClassicAdHocModeEnabled;
  if ((v12 & 4) == 0) {
    goto LABEL_20;
  }
LABEL_14:
  uint64_t v18 = 2654435761 * self->_searchLimitForGroupMemberSearch;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[PDDPEEServiceConfig setServiceId:](self, "setServiceId:");
  }
  if (*((void *)v4 + 3)) {
    -[PDDPEEServiceConfig setPersonlinkServiceContext:](self, "setPersonlinkServiceContext:");
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = *((id *)v4 + 8);
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PDDPEEServiceConfig *)self addZoneSubscriptions:*(void *)(*((void *)&v30 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v7);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = *((id *)v4 + 5);
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        [(PDDPEEServiceConfig *)self addServiceBag:*(void *)(*((void *)&v26 + 1) + 8 * (void)j)];
      }
      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v12);
  }

  __int16 v15 = *((_WORD *)v4 + 40);
  if ((v15 & 0x80) != 0)
  {
    self->_isRosterSearchAllowed = *((unsigned char *)v4 + 75);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v15 = *((_WORD *)v4 + 40);
    if ((v15 & 1) == 0)
    {
LABEL_21:
      if ((v15 & 0x100) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((v15 & 1) == 0)
  {
    goto LABEL_21;
  }
  self->_minimumSearchKeyLength = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
LABEL_22:
    self->_useServerForRosterSearch = *((unsigned char *)v4 + 76);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_23:
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = *((id *)v4 + 1);
  id v17 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t k = 0; k != v18; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        -[PDDPEEServiceConfig addDefaultSyncZoneNames:](self, "addDefaultSyncZoneNames:", *(void *)(*((void *)&v22 + 1) + 8 * (void)k), (void)v22);
      }
      id v18 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v18);
  }

  __int16 v21 = *((_WORD *)v4 + 40);
  if ((v21 & 8) != 0)
  {
    self->_syncFetchInterval = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 8u;
    __int16 v21 = *((_WORD *)v4 + 40);
    if ((v21 & 2) == 0)
    {
LABEL_32:
      if ((v21 & 0x20) == 0) {
        goto LABEL_33;
      }
      goto LABEL_43;
    }
  }
  else if ((v21 & 2) == 0)
  {
    goto LABEL_32;
  }
  self->_searchCacheTtl = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 2u;
  __int16 v21 = *((_WORD *)v4 + 40);
  if ((v21 & 0x20) == 0)
  {
LABEL_33:
    if ((v21 & 0x10) == 0) {
      goto LABEL_34;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_analyticsOptedIn = *((unsigned char *)v4 + 73);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v21 = *((_WORD *)v4 + 40);
  if ((v21 & 0x10) == 0)
  {
LABEL_34:
    if ((v21 & 0x40) == 0) {
      goto LABEL_35;
    }
LABEL_45:
    self->_classroomClassicAdHocModeEnabled = *((unsigned char *)v4 + 74);
    *(_WORD *)&self->_has |= 0x40u;
    if ((*((_WORD *)v4 + 40) & 4) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_44:
  self->_allowSharingOutsideOrg = *((unsigned char *)v4 + 72);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v21 = *((_WORD *)v4 + 40);
  if ((v21 & 0x40) != 0) {
    goto LABEL_45;
  }
LABEL_35:
  if ((v21 & 4) != 0)
  {
LABEL_36:
    self->_searchLimitForGroupMemberSearch = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_37:
}

- (NSString)serviceId
{
  return self->_serviceId;
}

- (void)setServiceId:(id)a3
{
}

- (NSString)personlinkServiceContext
{
  return self->_personlinkServiceContext;
}

- (void)setPersonlinkServiceContext:(id)a3
{
}

- (NSMutableArray)zoneSubscriptions
{
  return self->_zoneSubscriptions;
}

- (void)setZoneSubscriptions:(id)a3
{
}

- (NSMutableArray)serviceBags
{
  return self->_serviceBags;
}

- (void)setServiceBags:(id)a3
{
}

- (BOOL)isRosterSearchAllowed
{
  return self->_isRosterSearchAllowed;
}

- (int)minimumSearchKeyLength
{
  return self->_minimumSearchKeyLength;
}

- (BOOL)useServerForRosterSearch
{
  return self->_useServerForRosterSearch;
}

- (NSMutableArray)defaultSyncZoneNames
{
  return self->_defaultSyncZoneNames;
}

- (void)setDefaultSyncZoneNames:(id)a3
{
}

- (int)syncFetchInterval
{
  return self->_syncFetchInterval;
}

- (int)searchCacheTtl
{
  return self->_searchCacheTtl;
}

- (BOOL)analyticsOptedIn
{
  return self->_analyticsOptedIn;
}

- (BOOL)allowSharingOutsideOrg
{
  return self->_allowSharingOutsideOrg;
}

- (BOOL)classroomClassicAdHocModeEnabled
{
  return self->_classroomClassicAdHocModeEnabled;
}

- (int)searchLimitForGroupMemberSearch
{
  return self->_searchLimitForGroupMemberSearch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneSubscriptions, 0);
  objc_storeStrong((id *)&self->_serviceId, 0);
  objc_storeStrong((id *)&self->_serviceBags, 0);
  objc_storeStrong((id *)&self->_personlinkServiceContext, 0);

  objc_storeStrong((id *)&self->_defaultSyncZoneNames, 0);
}

@end