@interface PSChannelSubscription
+ (Class)attributesType;
- (BOOL)hasChannelId;
- (BOOL)hasCheckpoint;
- (BOOL)hasMessageReplayCount;
- (BOOL)hasSubscriptionInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)channelId;
- (NSMutableArray)attributes;
- (id)attributesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subscriptionInfoAsString:(int)a3;
- (int)StringAsSubscriptionInfo:(id)a3;
- (int)subscriptionInfo;
- (unint64_t)attributesCount;
- (unint64_t)checkpoint;
- (unint64_t)hash;
- (unint64_t)messageReplayCount;
- (void)addAttributes:(id)a3;
- (void)clearAttributes;
- (void)clearOneofValuesForSubscriptionInfo;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setChannelId:(id)a3;
- (void)setCheckpoint:(unint64_t)a3;
- (void)setHasCheckpoint:(BOOL)a3;
- (void)setHasMessageReplayCount:(BOOL)a3;
- (void)setHasSubscriptionInfo:(BOOL)a3;
- (void)setMessageReplayCount:(unint64_t)a3;
- (void)setSubscriptionInfo:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSChannelSubscription

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (void)setCheckpoint:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_subscriptionInfo = 1;
  *(unsigned char *)&self->_has |= 1u;
  self->_checkpoint = a3;
}

- (void)setHasCheckpoint:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCheckpoint
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMessageReplayCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_subscriptionInfo = 2;
  *(unsigned char *)&self->_has |= 2u;
  self->_messageReplayCount = a3;
}

- (void)setHasMessageReplayCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMessageReplayCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)subscriptionInfo
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_subscriptionInfo;
  }
  else {
    return 0;
  }
}

- (void)setSubscriptionInfo:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_subscriptionInfo = a3;
}

- (void)setHasSubscriptionInfo:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubscriptionInfo
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)subscriptionInfoAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_10012BA50[a3];
  }
  return v3;
}

- (int)StringAsSubscriptionInfo:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"checkpoint"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"message_replay_count"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForSubscriptionInfo
{
  *(unsigned char *)&self->_has &= ~4u;
  self->_subscriptionInfo = 0;
  *(unsigned char *)&self->_has &= ~1u;
  self->_checkpoint = 0;
  *(unsigned char *)&self->_has &= ~2u;
  self->_messageReplayCount = 0;
}

- (void)clearAttributes
{
}

- (void)addAttributes:(id)a3
{
  id v4 = a3;
  attributes = self->_attributes;
  id v8 = v4;
  if (!attributes)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_attributes;
    self->_attributes = v6;

    id v4 = v8;
    attributes = self->_attributes;
  }
  [(NSMutableArray *)attributes addObject:v4];
}

- (unint64_t)attributesCount
{
  return (unint64_t)[(NSMutableArray *)self->_attributes count];
}

- (id)attributesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_attributes objectAtIndex:a3];
}

+ (Class)attributesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PSChannelSubscription;
  id v3 = [(PSChannelSubscription *)&v7 description];
  id v4 = [(PSChannelSubscription *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  channelId = self->_channelId;
  if (channelId) {
    [v3 setObject:channelId forKey:@"channel_id"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedLongLong:self->_checkpoint];
    [v4 setObject:v7 forKey:@"checkpoint"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  id v8 = +[NSNumber numberWithUnsignedLongLong:self->_messageReplayCount];
  [v4 setObject:v8 forKey:@"message_replay_count"];

  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t subscriptionInfo = self->_subscriptionInfo;
  if (subscriptionInfo >= 3)
  {
    v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_subscriptionInfo];
  }
  else
  {
    v10 = off_10012BA50[subscriptionInfo];
  }
  [v4 setObject:v10 forKey:@"SubscriptionInfo"];

LABEL_13:
  if ([(NSMutableArray *)self->_attributes count])
  {
    id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_attributes, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_attributes;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    [v4 setObject:v11 forKey:@"attributes"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100077128((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_channelId) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_attributes;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[10] = self->_subscriptionInfo;
    *((unsigned char *)v4 + 44) |= 4u;
  }
  v9 = v4;
  if (self->_channelId)
  {
    objc_msgSend(v4, "setChannelId:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_checkpoint;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  if ([(PSChannelSubscription *)self attributesCount])
  {
    [v9 clearAttributes];
    unint64_t v5 = [(PSChannelSubscription *)self attributesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PSChannelSubscription *)self attributesAtIndex:i];
        [v9 addAttributes:v8];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v9 + 2) = self->_messageReplayCount;
    *((unsigned char *)v9 + 44) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[10] = self->_subscriptionInfo;
    *((unsigned char *)v5 + 44) |= 4u;
  }
  id v7 = [(NSData *)self->_channelId copyWithZone:a3];
  uint64_t v8 = (void *)v6[4];
  v6[4] = v7;

  if (*(unsigned char *)&self->_has)
  {
    v6[1] = self->_checkpoint;
    *((unsigned char *)v6 + 44) |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v9 = self->_attributes;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v13), "copyWithZone:", a3, (void)v16);
        [v6 addAttributes:v14];

        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6[2] = self->_messageReplayCount;
    *((unsigned char *)v6 + 44) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_subscriptionInfo != *((_DWORD *)v4 + 10)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_22;
  }
  channelId = self->_channelId;
  if ((unint64_t)channelId | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](channelId, "isEqual:")) {
      goto LABEL_22;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_checkpoint != *((void *)v4 + 1)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_22;
  }
  attributes = self->_attributes;
  if ((unint64_t)attributes | *((void *)v4 + 3))
  {
    if (-[NSMutableArray isEqual:](attributes, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_18;
    }
LABEL_22:
    BOOL v8 = 0;
    goto LABEL_23;
  }
LABEL_18:
  BOOL v8 = (*((unsigned char *)v4 + 44) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_messageReplayCount != *((void *)v4 + 2)) {
      goto LABEL_22;
    }
    BOOL v8 = 1;
  }
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_subscriptionInfo;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSData *)self->_channelId hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_checkpoint;
  }
  else {
    unint64_t v5 = 0;
  }
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_attributes hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v7 = 2654435761u * self->_messageReplayCount;
  }
  else {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if ((v4[11] & 4) != 0)
  {
    self->_uint64_t subscriptionInfo = v4[10];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 4)) {
    -[PSChannelSubscription setChannelId:](self, "setChannelId:");
  }
  if (*((unsigned char *)v5 + 44))
  {
    self->_checkpoint = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v5 + 3);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[PSChannelSubscription addAttributes:](self, "addAttributes:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*((unsigned char *)v5 + 44) & 2) != 0)
  {
    self->_messageReplayCount = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSData)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
}

- (unint64_t)checkpoint
{
  return self->_checkpoint;
}

- (unint64_t)messageReplayCount
{
  return self->_messageReplayCount;
}

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelId, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end