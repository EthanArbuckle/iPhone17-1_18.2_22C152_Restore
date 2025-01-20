@interface PDDPEERequestZone
- (BOOL)hasCursor;
- (BOOL)hasLimit;
- (BOOL)hasRequestor;
- (BOOL)hasZoneName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)cursor;
- (NSString)zoneName;
- (PDDPAdminRequestRequestor)requestor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)limit;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCursor:(id)a3;
- (void)setHasLimit:(BOOL)a3;
- (void)setLimit:(int)a3;
- (void)setRequestor:(id)a3;
- (void)setZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPEERequestZone

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (void)setLimit:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_limit = a3;
}

- (void)setHasLimit:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLimit
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCursor
{
  return self->_cursor != 0;
}

- (BOOL)hasRequestor
{
  return self->_requestor != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPEERequestZone;
  v3 = [(PDDPEERequestZone *)&v7 description];
  v4 = [(PDDPEERequestZone *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithInt:self->_limit];
    [v4 setObject:v6 forKey:@"limit"];
  }
  cursor = self->_cursor;
  if (cursor) {
    [v4 setObject:cursor forKey:@"cursor"];
  }
  requestor = self->_requestor;
  if (requestor)
  {
    v9 = [(PDDPAdminRequestRequestor *)requestor dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"requestor"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10013E898((uint64_t)self, (uint64_t)a3);
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_cursor)
  {
    PBDataWriterWriteDataField();
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
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_limit;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_cursor)
  {
    objc_msgSend(v5, "setCursor:");
    id v4 = v5;
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
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_limit;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  id v8 = [(NSData *)self->_cursor copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(PDDPAdminRequestRequestor *)self->_requestor copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  zoneName = self->_zoneName;
  if ((unint64_t)zoneName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](zoneName, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_limit != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    unsigned __int8 v8 = 0;
    goto LABEL_14;
  }
  cursor = self->_cursor;
  if ((unint64_t)cursor | *((void *)v4 + 1) && !-[NSData isEqual:](cursor, "isEqual:")) {
    goto LABEL_13;
  }
  requestor = self->_requestor;
  if ((unint64_t)requestor | *((void *)v4 + 3)) {
    unsigned __int8 v8 = -[PDDPAdminRequestRequestor isEqual:](requestor, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_zoneName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_limit;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  unint64_t v6 = (unint64_t)[(NSData *)self->_cursor hash];
  return v5 ^ v6 ^ [(PDDPAdminRequestRequestor *)self->_requestor hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  objc_super v7 = v4;
  if (*((void *)v4 + 4))
  {
    -[PDDPEERequestZone setZoneName:](self, "setZoneName:");
    uint64_t v4 = v7;
  }
  if (v4[10])
  {
    self->_limit = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[PDDPEERequestZone setCursor:](self, "setCursor:");
    uint64_t v4 = v7;
  }
  requestor = self->_requestor;
  uint64_t v6 = *((void *)v4 + 3);
  if (requestor)
  {
    if (!v6) {
      goto LABEL_13;
    }
    requestor = (PDDPAdminRequestRequestor *)-[PDDPAdminRequestRequestor mergeFrom:](requestor, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_13;
    }
    requestor = (PDDPAdminRequestRequestor *)-[PDDPEERequestZone setRequestor:](self, "setRequestor:");
  }
  uint64_t v4 = v7;
LABEL_13:

  _objc_release_x1(requestor, v4);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (int)limit
{
  return self->_limit;
}

- (NSData)cursor
{
  return self->_cursor;
}

- (void)setCursor:(id)a3
{
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
  objc_storeStrong((id *)&self->_requestor, 0);

  objc_storeStrong((id *)&self->_cursor, 0);
}

@end