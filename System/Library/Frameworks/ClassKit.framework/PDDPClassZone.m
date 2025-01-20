@interface PDDPClassZone
- (BOOL)hasChangeToken;
- (BOOL)hasClassId;
- (BOOL)hasIsAccessDenied;
- (BOOL)hasMoreDataAvailable;
- (BOOL)hasZoneName;
- (BOOL)isAccessDenied;
- (BOOL)isEqual:(id)a3;
- (BOOL)moreDataAvailable;
- (BOOL)readFrom:(id)a3;
- (NSData)changeToken;
- (NSString)classId;
- (NSString)zoneName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChangeToken:(id)a3;
- (void)setClassId:(id)a3;
- (void)setHasIsAccessDenied:(BOOL)a3;
- (void)setHasMoreDataAvailable:(BOOL)a3;
- (void)setIsAccessDenied:(BOOL)a3;
- (void)setMoreDataAvailable:(BOOL)a3;
- (void)setZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPClassZone

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (BOOL)hasClassId
{
  return self->_classId != 0;
}

- (BOOL)hasChangeToken
{
  return self->_changeToken != 0;
}

- (void)setMoreDataAvailable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_moreDataAvailable = a3;
}

- (void)setHasMoreDataAvailable:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMoreDataAvailable
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsAccessDenied:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isAccessDenied = a3;
}

- (void)setHasIsAccessDenied:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsAccessDenied
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPClassZone;
  char v3 = [(PDDPClassZone *)&v7 description];
  v4 = [(PDDPClassZone *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  zoneName = self->_zoneName;
  if (zoneName) {
    [v3 setObject:zoneName forKey:@"zone_name"];
  }
  classId = self->_classId;
  if (classId) {
    [v4 setObject:classId forKey:@"class_id"];
  }
  changeToken = self->_changeToken;
  if (changeToken) {
    [v4 setObject:changeToken forKey:@"change_token"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = +[NSNumber numberWithBool:self->_moreDataAvailable];
    [v4 setObject:v9 forKey:@"more_data_available"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v10 = +[NSNumber numberWithBool:self->_isAccessDenied];
    [v4 setObject:v10 forKey:@"is_access_denied"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10010CA84((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_zoneName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_classId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_changeToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_zoneName)
  {
    objc_msgSend(v4, "setZoneName:");
    id v4 = v6;
  }
  if (self->_classId)
  {
    objc_msgSend(v6, "setClassId:");
    id v4 = v6;
  }
  if (self->_changeToken)
  {
    objc_msgSend(v6, "setChangeToken:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[33] = self->_moreDataAvailable;
    v4[36] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[32] = self->_isAccessDenied;
    v4[36] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_zoneName copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSString *)self->_classId copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSData *)self->_changeToken copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 33) = self->_moreDataAvailable;
    *((unsigned char *)v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((unsigned char *)v5 + 32) = self->_isAccessDenied;
    *((unsigned char *)v5 + 36) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  zoneName = self->_zoneName;
  if ((unint64_t)zoneName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](zoneName, "isEqual:")) {
      goto LABEL_18;
    }
  }
  classId = self->_classId;
  if ((unint64_t)classId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](classId, "isEqual:")) {
      goto LABEL_18;
    }
  }
  changeToken = self->_changeToken;
  if ((unint64_t)changeToken | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](changeToken, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0) {
      goto LABEL_18;
    }
    if (self->_moreDataAvailable)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_18;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_18;
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 36))
    {
      if (self->_isAccessDenied)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_18;
        }
      }
      else if (*((unsigned char *)v4 + 32))
      {
        goto LABEL_18;
      }
      BOOL v8 = 1;
      goto LABEL_19;
    }
LABEL_18:
    BOOL v8 = 0;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_zoneName hash];
  NSUInteger v4 = [(NSString *)self->_classId hash];
  unint64_t v5 = (unint64_t)[(NSData *)self->_changeToken hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_moreDataAvailable;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_isAccessDenied;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  uint64_t v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[PDDPClassZone setZoneName:](self, "setZoneName:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[PDDPClassZone setClassId:](self, "setClassId:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[PDDPClassZone setChangeToken:](self, "setChangeToken:");
    NSUInteger v4 = v6;
  }
  BOOL v5 = v4[36];
  if ((v5 & 2) != 0)
  {
    self->_moreDataAvailable = v4[33];
    *(unsigned char *)&self->_has |= 2u;
    BOOL v5 = v4[36];
  }
  if (v5)
  {
    self->_isAccessDenied = v4[32];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (NSString)classId
{
  return self->_classId;
}

- (void)setClassId:(id)a3
{
}

- (NSData)changeToken
{
  return self->_changeToken;
}

- (void)setChangeToken:(id)a3
{
}

- (BOOL)moreDataAvailable
{
  return self->_moreDataAvailable;
}

- (BOOL)isAccessDenied
{
  return self->_isAccessDenied;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_classId, 0);

  objc_storeStrong((id *)&self->_changeToken, 0);
}

@end