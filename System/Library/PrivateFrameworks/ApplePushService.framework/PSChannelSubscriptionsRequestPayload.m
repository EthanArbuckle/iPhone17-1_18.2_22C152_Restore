@interface PSChannelSubscriptionsRequestPayload
+ (Class)appChannelSubscriptionsType;
+ (id)createPayloadForSubscriptionChannels:(id)a3 unsubscriptionChannels:(id)a4 subscriptionType:(int)a5;
- (BOOL)hasSequenceNumber;
- (BOOL)hasSubscriptionsType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)appChannelSubscriptions;
- (id)appChannelSubscriptionsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subscriptionsTypeAsString:(int)a3;
- (id)versionAsString:(int)a3;
- (int)StringAsSubscriptionsType:(id)a3;
- (int)StringAsVersion:(id)a3;
- (int)subscriptionsType;
- (int)version;
- (unint64_t)appChannelSubscriptionsCount;
- (unint64_t)hash;
- (unint64_t)sequenceNumber;
- (void)addAppChannelSubscriptions:(id)a3;
- (void)clearAppChannelSubscriptions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppChannelSubscriptions:(id)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasSubscriptionsType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSequenceNumber:(unint64_t)a3;
- (void)setSubscriptionsType:(int)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSChannelSubscriptionsRequestPayload

+ (id)createPayloadForSubscriptionChannels:(id)a3 unsubscriptionChannels:(id)a4 subscriptionType:(int)a5
{
  id v6 = a3;
  id v63 = a4;
  v66 = +[NSMutableDictionary dictionary];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v79 objects:v86 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v80;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v80 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        v12 = objc_alloc_init(PSChannelSubscription);
        id v13 = objc_alloc((Class)NSData);
        v14 = [v11 channelID];
        id v15 = [v13 initWithBase64EncodedString:v14 options:0];

        [(PSChannelSubscription *)v12 setChannelId:v15];
        v16 = [v11 channelTopic];
        v17 = [&off_100137940 objectForKeyedSubscript:v16];

        if ([v11 checkpoint]) {
          BOOL v18 = 1;
        }
        else {
          BOOL v18 = v17 == 0;
        }
        if (v18) {
          -[PSChannelSubscription setCheckpoint:](v12, "setCheckpoint:", [v11 checkpoint]);
        }
        else {
          -[PSChannelSubscription setMessageReplayCount:](v12, "setMessageReplayCount:", [v17 unsignedLongLongValue]);
        }
        v19 = [v11 channelTopic];
        v20 = [v66 objectForKeyedSubscript:v19];
        v21 = v20;
        if (v20)
        {
          id v22 = v20;
        }
        else
        {
          +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [obj count]);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
        }
        v23 = v22;

        [v23 addObject:v12];
        v24 = [v11 channelTopic];
        [v66 setObject:v23 forKeyedSubscript:v24];
      }
      id v8 = [obj countByEnumeratingWithState:&v79 objects:v86 count:16];
    }
    while (v8);
  }

  v25 = +[NSMutableDictionary dictionary];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v64 = v63;
  id v26 = [v64 countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v76;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v76 != v28) {
          objc_enumerationMutation(v64);
        }
        v30 = *(void **)(*((void *)&v75 + 1) + 8 * (void)j);
        v31 = objc_alloc_init(PSChannelUnsubscription);
        id v32 = objc_alloc((Class)NSData);
        v33 = [v30 channelID];
        id v34 = [v32 initWithBase64EncodedString:v33 options:0];

        [(PSChannelUnsubscription *)v31 setChannelId:v34];
        v35 = [v30 channelTopic];
        v36 = [v25 objectForKeyedSubscript:v35];
        v37 = v36;
        if (v36)
        {
          id v38 = v36;
        }
        else
        {
          +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v64 count]);
          id v38 = (id)objc_claimAutoreleasedReturnValue();
        }
        v39 = v38;

        [v39 addObject:v31];
        v40 = [v30 channelTopic];
        [v25 setObject:v39 forKeyedSubscript:v40];
      }
      id v27 = [v64 countByEnumeratingWithState:&v75 objects:v85 count:16];
    }
    while (v27);
  }

  v41 = +[NSMutableArray array];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v62 = [v66 allKeys];
  id v42 = [v62 countByEnumeratingWithState:&v71 objects:v84 count:16];
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v72;
    do
    {
      for (k = 0; k != v43; k = (char *)k + 1)
      {
        if (*(void *)v72 != v44) {
          objc_enumerationMutation(v62);
        }
        uint64_t v46 = *(void *)(*((void *)&v71 + 1) + 8 * (void)k);
        v47 = [v66 objectForKeyedSubscript:v46];
        v48 = [v25 objectForKeyedSubscript:v46];
        [v25 removeObjectForKey:v46];
        v49 = objc_alloc_init(PSAppChannelSubscriptions);
        [(PSAppChannelSubscriptions *)v49 setAppId:v46];
        [(PSAppChannelSubscriptions *)v49 setSubscriptionChannels:v47];
        [(PSAppChannelSubscriptions *)v49 setUnsubscriptionChannels:v48];
        [v41 addObject:v49];
      }
      id v43 = [v62 countByEnumeratingWithState:&v71 objects:v84 count:16];
    }
    while (v43);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v50 = [v25 allKeys];
  id v51 = [v50 countByEnumeratingWithState:&v67 objects:v83 count:16];
  if (v51)
  {
    id v52 = v51;
    uint64_t v53 = *(void *)v68;
    do
    {
      for (m = 0; m != v52; m = (char *)m + 1)
      {
        if (*(void *)v68 != v53) {
          objc_enumerationMutation(v50);
        }
        uint64_t v55 = *(void *)(*((void *)&v67 + 1) + 8 * (void)m);
        v56 = [v25 objectForKeyedSubscript:v55];
        v57 = objc_alloc_init(PSAppChannelSubscriptions);
        [(PSAppChannelSubscriptions *)v57 setAppId:v55];
        [(PSAppChannelSubscriptions *)v57 setUnsubscriptionChannels:v56];
        [v41 addObject:v57];
      }
      id v52 = [v50 countByEnumeratingWithState:&v67 objects:v83 count:16];
    }
    while (v52);
  }

  v58 = objc_alloc_init(PSChannelSubscriptionsRequestPayload);
  [(PSChannelSubscriptionsRequestPayload *)v58 setSubscriptionsType:a5];
  v59 = +[NSMutableArray arrayWithArray:v41];
  [(PSChannelSubscriptionsRequestPayload *)v58 setAppChannelSubscriptions:v59];

  [(PSChannelSubscriptionsRequestPayload *)v58 setVersion:1];
  return v58;
}

- (int)version
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_version;
  }
  else {
    return 1;
  }
}

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)versionAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"V_1";
  }
  else
  {
    v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return v4;
}

- (int)StringAsVersion:(id)a3
{
  return 1;
}

- (void)clearAppChannelSubscriptions
{
}

- (void)addAppChannelSubscriptions:(id)a3
{
  id v4 = a3;
  appChannelSubscriptions = self->_appChannelSubscriptions;
  id v8 = v4;
  if (!appChannelSubscriptions)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v7 = self->_appChannelSubscriptions;
    self->_appChannelSubscriptions = v6;

    id v4 = v8;
    appChannelSubscriptions = self->_appChannelSubscriptions;
  }
  [(NSMutableArray *)appChannelSubscriptions addObject:v4];
}

- (unint64_t)appChannelSubscriptionsCount
{
  return (unint64_t)[(NSMutableArray *)self->_appChannelSubscriptions count];
}

- (id)appChannelSubscriptionsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_appChannelSubscriptions objectAtIndex:a3];
}

+ (Class)appChannelSubscriptionsType
{
  return (Class)objc_opt_class();
}

- (int)subscriptionsType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_subscriptionsType;
  }
  else {
    return 0;
  }
}

- (void)setSubscriptionsType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_subscriptionsType = a3;
}

- (void)setHasSubscriptionsType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubscriptionsType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)subscriptionsTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"FULL_SUBSCRIPTION";
    }
    else
    {
      id v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    id v4 = @"DELTA_SUBSCRIPTION";
  }
  return v4;
}

- (int)StringAsSubscriptionsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DELTA_SUBSCRIPTION"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"FULL_SUBSCRIPTION"];
  }

  return v4;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequenceNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PSChannelSubscriptionsRequestPayload;
  id v3 = [(PSChannelSubscriptionsRequestPayload *)&v7 description];
  int v4 = [(PSChannelSubscriptionsRequestPayload *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if (self->_version == 1)
    {
      int v4 = @"V_1";
    }
    else
    {
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", self->_version];
    }
    [v3 setObject:v4 forKey:@"version"];
  }
  if ([(NSMutableArray *)self->_appChannelSubscriptions count])
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_appChannelSubscriptions, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = self->_appChannelSubscriptions;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"app_channel_subscriptions"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int subscriptionsType = self->_subscriptionsType;
    if (subscriptionsType)
    {
      if (subscriptionsType == 1)
      {
        v14 = @"FULL_SUBSCRIPTION";
      }
      else
      {
        v14 = +[NSString stringWithFormat:@"(unknown: %i)", self->_subscriptionsType];
      }
    }
    else
    {
      v14 = @"DELTA_SUBSCRIPTION";
    }
    [v3 setObject:v14 forKey:@"subscriptions_type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    id v15 = +[NSNumber numberWithUnsignedLongLong:self->_sequenceNumber];
    [v3 setObject:v15 forKey:@"sequence_number"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10003EFDC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_appChannelSubscriptions;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[7] = self->_version;
    *((unsigned char *)v4 + 32) |= 4u;
  }
  id v10 = v4;
  if ([(PSChannelSubscriptionsRequestPayload *)self appChannelSubscriptionsCount])
  {
    [v10 clearAppChannelSubscriptions];
    unint64_t v5 = [(PSChannelSubscriptionsRequestPayload *)self appChannelSubscriptionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PSChannelSubscriptionsRequestPayload *)self appChannelSubscriptionsAtIndex:i];
        [v10 addAppChannelSubscriptions:v8];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v10 + 6) = self->_subscriptionsType;
    *((unsigned char *)v10 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v10 + 1) = self->_sequenceNumber;
    *((unsigned char *)v10 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[7] = self->_version;
    *((unsigned char *)v5 + 32) |= 4u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = self->_appChannelSubscriptions;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [v6 addAppChannelSubscriptions:v12];
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_subscriptionsType;
    *((unsigned char *)v6 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v6 + 1) = self->_sequenceNumber;
    *((unsigned char *)v6 + 32) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_version != *((_DWORD *)v4 + 7)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  appChannelSubscriptions = self->_appChannelSubscriptions;
  if ((unint64_t)appChannelSubscriptions | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](appChannelSubscriptions, "isEqual:"))
    {
LABEL_19:
      BOOL v7 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_subscriptionsType != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_sequenceNumber != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
    BOOL v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_appChannelSubscriptions hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_subscriptionsType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_sequenceNumber;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *((id *)v4 + 2);
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[PSChannelSubscriptionsRequestPayload addAppChannelSubscriptions:](self, "addAppChannelSubscriptions:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = *((unsigned char *)v5 + 32);
  if ((v11 & 2) != 0)
  {
    self->_int subscriptionsType = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v11 = *((unsigned char *)v5 + 32);
  }
  if (v11)
  {
    self->_sequenceNumber = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)appChannelSubscriptions
{
  return self->_appChannelSubscriptions;
}

- (void)setAppChannelSubscriptions:(id)a3
{
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void).cxx_destruct
{
}

@end