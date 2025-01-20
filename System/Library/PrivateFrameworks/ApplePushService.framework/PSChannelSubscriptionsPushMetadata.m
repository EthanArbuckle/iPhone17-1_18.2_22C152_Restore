@interface PSChannelSubscriptionsPushMetadata
- (BOOL)hasChannelId;
- (BOOL)hasCheckpoint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)channelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)checkpoint;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelId:(id)a3;
- (void)setCheckpoint:(unint64_t)a3;
- (void)setHasCheckpoint:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSChannelSubscriptionsPushMetadata

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (void)setCheckpoint:(unint64_t)a3
{
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

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PSChannelSubscriptionsPushMetadata;
  v3 = [(PSChannelSubscriptionsPushMetadata *)&v7 description];
  v4 = [(PSChannelSubscriptionsPushMetadata *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  channelId = self->_channelId;
  if (channelId) {
    [v3 setObject:channelId forKey:@"channel_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithUnsignedLongLong:self->_checkpoint];
    [v4 setObject:v6 forKey:@"checkpoint"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100079D0C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_channelId)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_channelId)
  {
    id v5 = v4;
    objc_msgSend(v4, "setChannelId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_checkpoint;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_channelId copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_checkpoint;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  channelId = self->_channelId;
  if ((unint64_t)channelId | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](channelId, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_checkpoint == *((void *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_channelId hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_checkpoint;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unint64_t *)a3;
  if (v4[2])
  {
    id v5 = v4;
    -[PSChannelSubscriptionsPushMetadata setChannelId:](self, "setChannelId:");
    unint64_t v4 = v5;
  }
  if (v4[3])
  {
    self->_checkpoint = v4[1];
    *(unsigned char *)&self->_has |= 1u;
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

- (void).cxx_destruct
{
}

@end