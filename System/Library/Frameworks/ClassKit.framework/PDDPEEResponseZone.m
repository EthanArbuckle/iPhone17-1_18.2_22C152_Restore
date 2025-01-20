@interface PDDPEEResponseZone
- (BOOL)hasCursor;
- (BOOL)hasRequestor;
- (BOOL)hasStatus;
- (BOOL)hasTotalFound;
- (BOOL)hasZoneName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)cursor;
- (NSString)zoneName;
- (PDDPAdminRequestRequestor)requestor;
- (PDDPStatus)status;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)totalFound;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCursor:(id)a3;
- (void)setHasTotalFound:(BOOL)a3;
- (void)setRequestor:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTotalFound:(int)a3;
- (void)setZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPEEResponseZone

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (BOOL)hasCursor
{
  return self->_cursor != 0;
}

- (void)setTotalFound:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_totalFound = a3;
}

- (void)setHasTotalFound:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTotalFound
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasRequestor
{
  return self->_requestor != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPEEResponseZone;
  v3 = [(PDDPEEResponseZone *)&v7 description];
  v4 = [(PDDPEEResponseZone *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  zoneName = self->_zoneName;
  if (zoneName) {
    [v3 setObject:zoneName forKey:@"zone_name"];
  }
  status = self->_status;
  if (status)
  {
    objc_super v7 = [(PDDPStatus *)status dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"status"];
  }
  cursor = self->_cursor;
  if (cursor) {
    [v4 setObject:cursor forKey:@"cursor"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = +[NSNumber numberWithInt:self->_totalFound];
    [v4 setObject:v9 forKey:@"total_found"];
  }
  requestor = self->_requestor;
  if (requestor)
  {
    v11 = [(PDDPAdminRequestRequestor *)requestor dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"requestor"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000CF17C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_zoneName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_status)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_cursor)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_requestor)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_zoneName)
  {
    objc_msgSend(v4, "setZoneName:");
    id v4 = v5;
  }
  if (self->_status)
  {
    objc_msgSend(v5, "setStatus:");
    id v4 = v5;
  }
  if (self->_cursor)
  {
    objc_msgSend(v5, "setCursor:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_totalFound;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_requestor)
  {
    objc_msgSend(v5, "setRequestor:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_zoneName copyWithZone:a3];
  objc_super v7 = (void *)v5[5];
  v5[5] = v6;

  id v8 = [(PDDPStatus *)self->_status copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(NSData *)self->_cursor copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 8) = self->_totalFound;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  id v12 = [(PDDPAdminRequestRequestor *)self->_requestor copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  zoneName = self->_zoneName;
  if ((unint64_t)zoneName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](zoneName, "isEqual:")) {
      goto LABEL_15;
    }
  }
  status = self->_status;
  if ((unint64_t)status | *((void *)v4 + 3))
  {
    if (!-[PDDPStatus isEqual:](status, "isEqual:")) {
      goto LABEL_15;
    }
  }
  cursor = self->_cursor;
  if ((unint64_t)cursor | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](cursor, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_totalFound != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    unsigned __int8 v9 = 0;
    goto LABEL_16;
  }
  requestor = self->_requestor;
  if ((unint64_t)requestor | *((void *)v4 + 2)) {
    unsigned __int8 v9 = -[PDDPAdminRequestRequestor isEqual:](requestor, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_zoneName hash];
  unint64_t v4 = [(PDDPStatus *)self->_status hash];
  unint64_t v5 = (unint64_t)[(NSData *)self->_cursor hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_totalFound;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(PDDPAdminRequestRequestor *)self->_requestor hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (int *)a3;
  unsigned __int8 v9 = v4;
  if (*((void *)v4 + 5))
  {
    -[PDDPEEResponseZone setZoneName:](self, "setZoneName:");
    unint64_t v4 = v9;
  }
  status = self->_status;
  uint64_t v6 = *((void *)v4 + 3);
  if (status)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[PDDPStatus mergeFrom:](status, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[PDDPEEResponseZone setStatus:](self, "setStatus:");
  }
  unint64_t v4 = v9;
LABEL_9:
  if (*((void *)v4 + 1))
  {
    -[PDDPEEResponseZone setCursor:](self, "setCursor:");
    unint64_t v4 = v9;
  }
  if (v4[12])
  {
    self->_totalFound = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  requestor = self->_requestor;
  uint64_t v8 = *((void *)v4 + 2);
  if (requestor)
  {
    if (!v8) {
      goto LABEL_19;
    }
    requestor = (PDDPAdminRequestRequestor *)-[PDDPAdminRequestRequestor mergeFrom:](requestor, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_19;
    }
    requestor = (PDDPAdminRequestRequestor *)-[PDDPEEResponseZone setRequestor:](self, "setRequestor:");
  }
  unint64_t v4 = v9;
LABEL_19:

  _objc_release_x1(requestor, v4);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (PDDPStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSData)cursor
{
  return self->_cursor;
}

- (void)setCursor:(id)a3
{
}

- (int)totalFound
{
  return self->_totalFound;
}

- (PDDPAdminRequestRequestor)requestor
{
  return self->_requestor;
}

- (void)setRequestor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_requestor, 0);

  objc_storeStrong((id *)&self->_cursor, 0);
}

@end