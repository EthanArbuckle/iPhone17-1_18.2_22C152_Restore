@interface PDDPIngestItemStatus
- (BOOL)hasObjectId;
- (BOOL)hasStatus;
- (BOOL)hasSyncType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)objectId;
- (PDDPStatus)status;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)syncTypeAsString:(int)a3;
- (int)StringAsSyncType:(id)a3;
- (int)syncType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSyncType:(BOOL)a3;
- (void)setObjectId:(id)a3;
- (void)setStatus:(id)a3;
- (void)setSyncType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPIngestItemStatus

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (int)syncType
{
  if (*(unsigned char *)&self->_has) {
    return self->_syncType;
  }
  else {
    return 0;
  }
}

- (void)setSyncType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_syncType = a3;
}

- (void)setHasSyncType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSyncType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)syncTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_1001F2870 + a3);
  }

  return v3;
}

- (int)StringAsSyncType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SYNC_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TIME_INTERVAL_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ACTIVITY_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ACTIVITY_ITEM_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RANGE_TYPE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPIngestItemStatus;
  id v3 = [(PDDPIngestItemStatus *)&v7 description];
  int v4 = [(PDDPIngestItemStatus *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t syncType = self->_syncType;
    if (syncType >= 5)
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_syncType];
    }
    else
    {
      objc_super v7 = *(&off_1001F2870 + syncType);
    }
    [v4 setObject:v7 forKey:@"sync_type"];
  }
  status = self->_status;
  if (status)
  {
    v9 = [(PDDPStatus *)status dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"status"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10003E404((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_objectId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_status)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_objectId)
  {
    objc_msgSend(v4, "setObjectId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_syncType;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  if (self->_status)
  {
    objc_msgSend(v5, "setStatus:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_objectId copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 6) = self->_syncType;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  id v8 = [(PDDPStatus *)self->_status copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](objectId, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_syncType != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }
  status = self->_status;
  if ((unint64_t)status | *((void *)v4 + 2)) {
    unsigned __int8 v7 = -[PDDPStatus isEqual:](status, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_objectId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_syncType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ [(PDDPStatus *)self->_status hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  unsigned __int8 v7 = v4;
  if (*((void *)v4 + 1))
  {
    -[PDDPIngestItemStatus setObjectId:](self, "setObjectId:");
    uint64_t v4 = v7;
  }
  if (v4[7])
  {
    self->_uint64_t syncType = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  status = self->_status;
  uint64_t v6 = *((void *)v4 + 2);
  if (status)
  {
    if (v6) {
      -[PDDPStatus mergeFrom:](status, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPIngestItemStatus setStatus:](self, "setStatus:");
  }

  _objc_release_x1();
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (PDDPStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_objectId, 0);
}

@end