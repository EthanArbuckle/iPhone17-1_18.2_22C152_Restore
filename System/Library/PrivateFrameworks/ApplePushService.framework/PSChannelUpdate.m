@interface PSChannelUpdate
- (BOOL)hasChannelId;
- (BOOL)hasChannelStatus;
- (BOOL)hasCheckpoint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)channelId;
- (id)channelStatusAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsChannelStatus:(id)a3;
- (int)channelStatus;
- (unint64_t)checkpoint;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelId:(id)a3;
- (void)setChannelStatus:(int)a3;
- (void)setCheckpoint:(unint64_t)a3;
- (void)setHasChannelStatus:(BOOL)a3;
- (void)setHasCheckpoint:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSChannelUpdate

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (int)channelStatus
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_channelStatus;
  }
  else {
    return 0;
  }
}

- (void)setChannelStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_channelStatus = a3;
}

- (void)setHasChannelStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChannelStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)channelStatusAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"CHECKPOINT_LATEST";
    }
    else
    {
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    v4 = @"CHANNEL_ID_DOES_NOT_EXIST";
  }
  return v4;
}

- (int)StringAsChannelStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CHANNEL_ID_DOES_NOT_EXIST"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"CHECKPOINT_LATEST"];
  }

  return v4;
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
  v7.super_class = (Class)PSChannelUpdate;
  id v3 = [(PSChannelUpdate *)&v7 description];
  int v4 = [(PSChannelUpdate *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  channelId = self->_channelId;
  if (channelId) {
    [v3 setObject:channelId forKey:@"channel_id"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int channelStatus = self->_channelStatus;
    if (channelStatus)
    {
      if (channelStatus == 1)
      {
        v8 = @"CHECKPOINT_LATEST";
      }
      else
      {
        v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_channelStatus];
      }
    }
    else
    {
      v8 = @"CHANNEL_ID_DOES_NOT_EXIST";
    }
    [v4 setObject:v8 forKey:@"channel_status"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = +[NSNumber numberWithUnsignedLongLong:self->_checkpoint];
    [v4 setObject:v9 forKey:@"checkpoint"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10004062C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_channelId)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_channelId)
  {
    id v6 = v4;
    objc_msgSend(v4, "setChannelId:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_channelStatus;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_checkpoint;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_channelId copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_channelStatus;
    *((unsigned char *)v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[1] = self->_checkpoint;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  channelId = self->_channelId;
  if ((unint64_t)channelId | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](channelId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_channelStatus != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_checkpoint != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_channelId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_channelStatus;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_checkpoint;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[PSChannelUpdate setChannelId:](self, "setChannelId:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_int channelStatus = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if (v5)
  {
    self->_checkpoint = *((void *)v4 + 1);
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