@interface PDDPClientConfig
+ (Class)excludeAppIdsType;
+ (Class)hostAllowListType;
- (BOOL)hasCloudKitSyncFetchGracePeriod;
- (BOOL)hasIsContextTrackingAllowed;
- (BOOL)hasRecordActivity;
- (BOOL)hasSendToCloudKit;
- (BOOL)hasSendToOnramp;
- (BOOL)isContextTrackingAllowed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)recordActivity;
- (BOOL)sendToCloudKit;
- (BOOL)sendToOnramp;
- (NSMutableArray)excludeAppIds;
- (NSMutableArray)hostAllowLists;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)excludeAppIdsAtIndex:(unint64_t)a3;
- (id)hostAllowListAtIndex:(unint64_t)a3;
- (int)cloudKitSyncFetchGracePeriod;
- (unint64_t)excludeAppIdsCount;
- (unint64_t)hash;
- (unint64_t)hostAllowListsCount;
- (void)addExcludeAppIds:(id)a3;
- (void)addHostAllowList:(id)a3;
- (void)clearExcludeAppIds;
- (void)clearHostAllowLists;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCloudKitSyncFetchGracePeriod:(int)a3;
- (void)setExcludeAppIds:(id)a3;
- (void)setHasCloudKitSyncFetchGracePeriod:(BOOL)a3;
- (void)setHasIsContextTrackingAllowed:(BOOL)a3;
- (void)setHasRecordActivity:(BOOL)a3;
- (void)setHasSendToCloudKit:(BOOL)a3;
- (void)setHasSendToOnramp:(BOOL)a3;
- (void)setHostAllowLists:(id)a3;
- (void)setIsContextTrackingAllowed:(BOOL)a3;
- (void)setRecordActivity:(BOOL)a3;
- (void)setSendToCloudKit:(BOOL)a3;
- (void)setSendToOnramp:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPClientConfig

- (void)setRecordActivity:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_recordActivity = a3;
}

- (void)setHasRecordActivity:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRecordActivity
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSendToCloudKit:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_sendToCloudKit = a3;
}

- (void)setHasSendToCloudKit:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSendToCloudKit
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSendToOnramp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_sendToOnramp = a3;
}

- (void)setHasSendToOnramp:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSendToOnramp
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)clearExcludeAppIds
{
}

- (void)addExcludeAppIds:(id)a3
{
  id v4 = a3;
  excludeAppIds = self->_excludeAppIds;
  id v8 = v4;
  if (!excludeAppIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_excludeAppIds;
    self->_excludeAppIds = v6;

    id v4 = v8;
    excludeAppIds = self->_excludeAppIds;
  }
  [(NSMutableArray *)excludeAppIds addObject:v4];
}

- (unint64_t)excludeAppIdsCount
{
  return (unint64_t)[(NSMutableArray *)self->_excludeAppIds count];
}

- (id)excludeAppIdsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_excludeAppIds objectAtIndex:a3];
}

+ (Class)excludeAppIdsType
{
  return (Class)objc_opt_class();
}

- (void)clearHostAllowLists
{
}

- (void)addHostAllowList:(id)a3
{
  id v4 = a3;
  hostAllowLists = self->_hostAllowLists;
  id v8 = v4;
  if (!hostAllowLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_hostAllowLists;
    self->_hostAllowLists = v6;

    id v4 = v8;
    hostAllowLists = self->_hostAllowLists;
  }
  [(NSMutableArray *)hostAllowLists addObject:v4];
}

- (unint64_t)hostAllowListsCount
{
  return (unint64_t)[(NSMutableArray *)self->_hostAllowLists count];
}

- (id)hostAllowListAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_hostAllowLists objectAtIndex:a3];
}

+ (Class)hostAllowListType
{
  return (Class)objc_opt_class();
}

- (void)setCloudKitSyncFetchGracePeriod:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cloudKitSyncFetchGracePeriod = a3;
}

- (void)setHasCloudKitSyncFetchGracePeriod:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCloudKitSyncFetchGracePeriod
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsContextTrackingAllowed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isContextTrackingAllowed = a3;
}

- (void)setHasIsContextTrackingAllowed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsContextTrackingAllowed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPClientConfig;
  char v3 = [(PDDPClientConfig *)&v7 description];
  id v4 = [(PDDPClientConfig *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v12 = +[NSNumber numberWithBool:self->_recordActivity];
    [v3 setObject:v12 forKey:@"record_activity"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v13 = +[NSNumber numberWithBool:self->_sendToCloudKit];
  [v3 setObject:v13 forKey:@"send_to_cloudKit"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v5 = +[NSNumber numberWithBool:self->_sendToOnramp];
    [v3 setObject:v5 forKey:@"send_to_onramp"];
  }
LABEL_5:
  excludeAppIds = self->_excludeAppIds;
  if (excludeAppIds) {
    [v3 setObject:excludeAppIds forKey:@"exclude_app_ids"];
  }
  hostAllowLists = self->_hostAllowLists;
  if (hostAllowLists) {
    [v3 setObject:hostAllowLists forKey:@"host_allow_list"];
  }
  char v8 = (char)self->_has;
  if (v8)
  {
    v9 = +[NSNumber numberWithInt:self->_cloudKitSyncFetchGracePeriod];
    [v3 setObject:v9 forKey:@"cloudKit_sync_fetch_grace_period"];

    char v8 = (char)self->_has;
  }
  if ((v8 & 2) != 0)
  {
    v10 = +[NSNumber numberWithBool:self->_isContextTrackingAllowed];
    [v3 setObject:v10 forKey:@"is_context_tracking_allowed"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100028470((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = self->_excludeAppIds;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    char v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      char v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = self->_hostAllowLists;
  v12 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      v13 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  char v16 = (char)self->_has;
  if (v16)
  {
    PBDataWriterWriteInt32Field();
    char v16 = (char)self->_has;
  }
  if ((v16 & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_3;
    }
LABEL_21:
    v4[34] = self->_sendToCloudKit;
    v4[36] |= 8u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v4[33] = self->_recordActivity;
  v4[36] |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_21;
  }
LABEL_3:
  if ((has & 0x10) != 0)
  {
LABEL_4:
    v4[35] = self->_sendToOnramp;
    v4[36] |= 0x10u;
  }
LABEL_5:
  id v15 = v4;
  if ([(PDDPClientConfig *)self excludeAppIdsCount])
  {
    [v15 clearExcludeAppIds];
    unint64_t v6 = [(PDDPClientConfig *)self excludeAppIdsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PDDPClientConfig *)self excludeAppIdsAtIndex:i];
        [v15 addExcludeAppIds:v9];
      }
    }
  }
  if ([(PDDPClientConfig *)self hostAllowListsCount])
  {
    [v15 clearHostAllowLists];
    unint64_t v10 = [(PDDPClientConfig *)self hostAllowListsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        v13 = [(PDDPClientConfig *)self hostAllowListAtIndex:j];
        [v15 addHostAllowList:v13];
      }
    }
  }
  char v14 = (char)self->_has;
  if (v14)
  {
    *((_DWORD *)v15 + 2) = self->_cloudKitSyncFetchGracePeriod;
    *((unsigned char *)v15 + 36) |= 1u;
    char v14 = (char)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    *((unsigned char *)v15 + 32) = self->_isContextTrackingAllowed;
    *((unsigned char *)v15 + 36) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[33] = self->_recordActivity;
    v5[36] |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[34] = self->_sendToCloudKit;
  v5[36] |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v5[35] = self->_sendToOnramp;
    v5[36] |= 0x10u;
  }
LABEL_5:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  char v8 = self->_excludeAppIds;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        [v6 addExcludeAppIds:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  char v14 = self->_hostAllowLists;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)j), "copyWithZone:", a3, (void)v22);
        [v6 addHostAllowList:v19];
      }
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  char v20 = (char)self->_has;
  if (v20)
  {
    *((_DWORD *)v6 + 2) = self->_cloudKitSyncFetchGracePeriod;
    v6[36] |= 1u;
    char v20 = (char)self->_has;
  }
  if ((v20 & 2) != 0)
  {
    v6[32] = self->_isContextTrackingAllowed;
    v6[36] |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0) {
      goto LABEL_37;
    }
    if (self->_recordActivity)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_37;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0) {
      goto LABEL_37;
    }
    if (self->_sendToCloudKit)
    {
      if (!*((unsigned char *)v4 + 34)) {
        goto LABEL_37;
      }
    }
    else if (*((unsigned char *)v4 + 34))
    {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0) {
      goto LABEL_37;
    }
    if (self->_sendToOnramp)
    {
      if (!*((unsigned char *)v4 + 35)) {
        goto LABEL_37;
      }
    }
    else if (*((unsigned char *)v4 + 35))
    {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_37;
  }
  excludeAppIds = self->_excludeAppIds;
  if ((unint64_t)excludeAppIds | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](excludeAppIds, "isEqual:"))
  {
    goto LABEL_37;
  }
  hostAllowLists = self->_hostAllowLists;
  if ((unint64_t)hostAllowLists | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](hostAllowLists, "isEqual:")) {
      goto LABEL_37;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_cloudKitSyncFetchGracePeriod != *((_DWORD *)v4 + 2)) {
      goto LABEL_37;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_37;
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) != 0)
    {
      if (self->_isContextTrackingAllowed)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_37;
        }
      }
      else if (*((unsigned char *)v4 + 32))
      {
        goto LABEL_37;
      }
      BOOL v7 = 1;
      goto LABEL_38;
    }
LABEL_37:
    BOOL v7 = 0;
  }
LABEL_38:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_recordActivity;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_sendToCloudKit;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_sendToOnramp;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_excludeAppIds hash];
  unint64_t v7 = (unint64_t)[(NSMutableArray *)self->_hostAllowLists hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_cloudKitSyncFetchGracePeriod;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_10;
    }
LABEL_12:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_isContextTrackingAllowed;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 36);
  if ((v6 & 4) != 0)
  {
    self->_recordActivity = *((unsigned char *)v4 + 33);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v4 + 36);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_sendToCloudKit = *((unsigned char *)v4 + 34);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
LABEL_4:
    self->_sendToOnramp = *((unsigned char *)v4 + 35);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_5:
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = *((id *)v4 + 2);
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        [(PDDPClientConfig *)self addExcludeAppIds:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = *((id *)v5 + 3);
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        -[PDDPClientConfig addHostAllowList:](self, "addHostAllowList:", *(void *)(*((void *)&v18 + 1) + 8 * (void)j), (void)v18);
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  char v17 = *((unsigned char *)v5 + 36);
  if (v17)
  {
    self->_cloudKitSyncFetchGracePeriod = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v17 = *((unsigned char *)v5 + 36);
  }
  if ((v17 & 2) != 0)
  {
    self->_isContextTrackingAllowed = *((unsigned char *)v5 + 32);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (BOOL)recordActivity
{
  return self->_recordActivity;
}

- (BOOL)sendToCloudKit
{
  return self->_sendToCloudKit;
}

- (BOOL)sendToOnramp
{
  return self->_sendToOnramp;
}

- (NSMutableArray)excludeAppIds
{
  return self->_excludeAppIds;
}

- (void)setExcludeAppIds:(id)a3
{
}

- (NSMutableArray)hostAllowLists
{
  return self->_hostAllowLists;
}

- (void)setHostAllowLists:(id)a3
{
}

- (int)cloudKitSyncFetchGracePeriod
{
  return self->_cloudKitSyncFetchGracePeriod;
}

- (BOOL)isContextTrackingAllowed
{
  return self->_isContextTrackingAllowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostAllowLists, 0);

  objc_storeStrong((id *)&self->_excludeAppIds, 0);
}

@end