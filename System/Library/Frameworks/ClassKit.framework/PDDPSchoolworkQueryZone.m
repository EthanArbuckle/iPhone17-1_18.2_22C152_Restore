@interface PDDPSchoolworkQueryZone
- (BOOL)hasLimit;
- (BOOL)hasOffset;
- (BOOL)hasZoneIdentifier;
- (BOOL)hasZoneInfo;
- (BOOL)hasZoneName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)offset;
- (NSString)zoneName;
- (PDDPZoneIdentifier)zoneIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)zoneInfoAsString:(int)a3;
- (int)StringAsZoneInfo:(id)a3;
- (int)limit;
- (int)zoneInfo;
- (unint64_t)hash;
- (void)clearOneofValuesForZoneInfo;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLimit:(BOOL)a3;
- (void)setHasZoneInfo:(BOOL)a3;
- (void)setLimit:(int)a3;
- (void)setOffset:(id)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)setZoneInfo:(int)a3;
- (void)setZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPSchoolworkQueryZone

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (void)setZoneName:(id)a3
{
  v4 = (NSString *)a3;
  [(PDDPSchoolworkQueryZone *)self clearOneofValuesForZoneInfo];
  *(unsigned char *)&self->_has |= 2u;
  self->_zoneInfo = 1;
  zoneName = self->_zoneName;
  self->_zoneName = v4;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (void)setZoneIdentifier:(id)a3
{
  v4 = (PDDPZoneIdentifier *)a3;
  [(PDDPSchoolworkQueryZone *)self clearOneofValuesForZoneInfo];
  *(unsigned char *)&self->_has |= 2u;
  self->_zoneInfo = 2;
  zoneIdentifier = self->_zoneIdentifier;
  self->_zoneIdentifier = v4;
}

- (int)zoneInfo
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_zoneInfo;
  }
  else {
    return 0;
  }
}

- (void)setZoneInfo:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_zoneInfo = a3;
}

- (void)setHasZoneInfo:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasZoneInfo
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)zoneInfoAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1001F3C68 + a3);
  }

  return v3;
}

- (int)StringAsZoneInfo:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"zone_name"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"zone_identifier"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForZoneInfo
{
  *(unsigned char *)&self->_has &= ~2u;
  self->_zoneInfo = 0;
  zoneName = self->_zoneName;
  self->_zoneName = 0;

  zoneIdentifier = self->_zoneIdentifier;
  self->_zoneIdentifier = 0;
}

- (BOOL)hasOffset
{
  return self->_offset != 0;
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

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPSchoolworkQueryZone;
  id v3 = [(PDDPSchoolworkQueryZone *)&v7 description];
  int v4 = [(PDDPSchoolworkQueryZone *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  zoneName = self->_zoneName;
  if (zoneName) {
    [v3 setObject:zoneName forKey:@"zone_name"];
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_super v7 = [(PDDPZoneIdentifier *)zoneIdentifier dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"zone_identifier"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t zoneInfo = self->_zoneInfo;
    if (zoneInfo >= 3)
    {
      v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_zoneInfo];
    }
    else
    {
      v9 = *(&off_1001F3C68 + zoneInfo);
    }
    [v4 setObject:v9 forKey:@"zone_info"];
  }
  offset = self->_offset;
  if (offset) {
    [v4 setObject:offset forKey:@"offset"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = +[NSNumber numberWithInt:self->_limit];
    [v4 setObject:v11 forKey:@"limit"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A4F24((uint64_t)self, (uint64_t)a3);
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
  if (self->_offset)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[8] = self->_zoneInfo;
    *((unsigned char *)v4 + 48) |= 2u;
  }
  id v5 = v4;
  if (self->_zoneName)
  {
    objc_msgSend(v4, "setZoneName:");
    id v4 = v5;
  }
  if (self->_offset)
  {
    objc_msgSend(v5, "setOffset:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_limit;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_zoneIdentifier)
  {
    objc_msgSend(v5, "setZoneIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[8] = self->_zoneInfo;
    *((unsigned char *)v5 + 48) |= 2u;
  }
  id v7 = [(NSString *)self->_zoneName copyWithZone:a3];
  v8 = (void *)v6[5];
  v6[5] = v7;

  id v9 = [(NSData *)self->_offset copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v6 + 2) = self->_limit;
    *((unsigned char *)v6 + 48) |= 1u;
  }
  id v11 = [(PDDPZoneIdentifier *)self->_zoneIdentifier copyWithZone:a3];
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_zoneInfo != *((_DWORD *)v4 + 8)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
LABEL_18:
    unsigned __int8 v8 = 0;
    goto LABEL_19;
  }
  zoneName = self->_zoneName;
  if ((unint64_t)zoneName | *((void *)v4 + 5) && !-[NSString isEqual:](zoneName, "isEqual:")) {
    goto LABEL_18;
  }
  offset = self->_offset;
  if ((unint64_t)offset | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](offset, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_limit != *((_DWORD *)v4 + 2)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_18;
  }
  zoneIdentifier = self->_zoneIdentifier;
  if ((unint64_t)zoneIdentifier | *((void *)v4 + 3)) {
    unsigned __int8 v8 = -[PDDPZoneIdentifier isEqual:](zoneIdentifier, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_zoneInfo;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_zoneName hash];
  unint64_t v5 = (unint64_t)[(NSData *)self->_offset hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_limit;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(PDDPZoneIdentifier *)self->_zoneIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  unint64_t v5 = v4;
  if ((v4[12] & 2) != 0)
  {
    self->_uint64_t zoneInfo = v4[8];
    *(unsigned char *)&self->_has |= 2u;
  }
  unsigned __int8 v8 = v4;
  if (*((void *)v4 + 5))
  {
    -[PDDPSchoolworkQueryZone setZoneName:](self, "setZoneName:");
    unint64_t v5 = v8;
  }
  if (*((void *)v5 + 2))
  {
    -[PDDPSchoolworkQueryZone setOffset:](self, "setOffset:");
    unint64_t v5 = v8;
  }
  if (v5[12])
  {
    self->_limit = v5[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v7 = *((void *)v5 + 3);
  if (zoneIdentifier)
  {
    if (!v7) {
      goto LABEL_15;
    }
    zoneIdentifier = (PDDPZoneIdentifier *)-[PDDPZoneIdentifier mergeFrom:](zoneIdentifier, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_15;
    }
    zoneIdentifier = (PDDPZoneIdentifier *)-[PDDPSchoolworkQueryZone setZoneIdentifier:](self, "setZoneIdentifier:");
  }
  unint64_t v5 = v8;
LABEL_15:

  _objc_release_x1(zoneIdentifier, v5);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (PDDPZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (NSData)offset
{
  return self->_offset;
}

- (void)setOffset:(id)a3
{
}

- (int)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);

  objc_storeStrong((id *)&self->_offset, 0);
}

@end