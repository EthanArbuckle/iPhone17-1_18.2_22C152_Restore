@interface PDDPZoneIdentifier
- (BOOL)hasZoneIdentifierId;
- (BOOL)hasZoneIdentifierType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)zoneIdentifierId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)zoneIdentifierTypeAsString:(int)a3;
- (int)StringAsZoneIdentifierType:(id)a3;
- (int)zoneIdentifierType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasZoneIdentifierType:(BOOL)a3;
- (void)setZoneIdentifierId:(id)a3;
- (void)setZoneIdentifierType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPZoneIdentifier

- (int)zoneIdentifierType
{
  if (*(unsigned char *)&self->_has) {
    return self->_zoneIdentifierType;
  }
  else {
    return 0;
  }
}

- (void)setZoneIdentifierType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_zoneIdentifierType = a3;
}

- (void)setHasZoneIdentifierType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasZoneIdentifierType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)zoneIdentifierTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_1001F5D28 + a3);
  }

  return v3;
}

- (int)StringAsZoneIdentifierType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ZONE_IDENTIFIER_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PERSON_LINK_ID_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CLASS_ID_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ZONE_NAME_TYPE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasZoneIdentifierId
{
  return self->_zoneIdentifierId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPZoneIdentifier;
  id v3 = [(PDDPZoneIdentifier *)&v7 description];
  int v4 = [(PDDPZoneIdentifier *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t zoneIdentifierType = self->_zoneIdentifierType;
    if (zoneIdentifierType >= 4)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_zoneIdentifierType];
    }
    else
    {
      v5 = *(&off_1001F5D28 + zoneIdentifierType);
    }
    [v3 setObject:v5 forKey:@"zone_identifier_type"];
  }
  zoneIdentifierId = self->_zoneIdentifierId;
  if (zoneIdentifierId) {
    [v3 setObject:zoneIdentifierId forKey:@"zone_identifier_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100136F58((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_zoneIdentifierId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_zoneIdentifierType;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  if (self->_zoneIdentifierId)
  {
    id v5 = v4;
    objc_msgSend(v4, "setZoneIdentifierId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_zoneIdentifierType;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  id v7 = [(NSString *)self->_zoneIdentifierId copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_zoneIdentifierType != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  zoneIdentifierId = self->_zoneIdentifierId;
  if ((unint64_t)zoneIdentifierId | *((void *)v4 + 1)) {
    unsigned __int8 v6 = -[NSString isEqual:](zoneIdentifierId, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_zoneIdentifierType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_zoneIdentifierId hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[5])
  {
    self->_uint64_t zoneIdentifierType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[PDDPZoneIdentifier setZoneIdentifierId:](self, "setZoneIdentifierId:");
    id v4 = v5;
  }
}

- (NSString)zoneIdentifierId
{
  return self->_zoneIdentifierId;
}

- (void)setZoneIdentifierId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end