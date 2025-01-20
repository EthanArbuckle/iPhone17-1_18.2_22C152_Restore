@interface LiveLookupCallIdentity
- (BOOL)hasCacheExpiryMinutes;
- (BOOL)hasIcon;
- (BOOL)hasIdentityType;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LiveLookupIcon)icon;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)identityTypeAsString:(int)a3;
- (int)StringAsIdentityType:(id)a3;
- (int)identityType;
- (unint64_t)hash;
- (unsigned)cacheExpiryMinutes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCacheExpiryMinutes:(unsigned int)a3;
- (void)setHasCacheExpiryMinutes:(BOOL)a3;
- (void)setHasIdentityType:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIdentityType:(int)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LiveLookupCallIdentity

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasIcon
{
  return self->_icon != 0;
}

- (void)setCacheExpiryMinutes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cacheExpiryMinutes = a3;
}

- (void)setHasCacheExpiryMinutes:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCacheExpiryMinutes
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)identityType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_identityType;
  }
  else {
    return 0;
  }
}

- (void)setIdentityType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_identityType = a3;
}

- (void)setHasIdentityType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIdentityType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)identityTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_100034A78[a3];
  }

  return v3;
}

- (int)StringAsIdentityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"IDENTITY_CATEGORY_UNSPECIFIED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IDENTITY_CATEGORY_PERSON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IDENTITY_CATEGORY_BUSINESS"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)LiveLookupCallIdentity;
  id v3 = [(LiveLookupCallIdentity *)&v7 description];
  int v4 = [(LiveLookupCallIdentity *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  icon = self->_icon;
  if (icon)
  {
    objc_super v7 = [(LiveLookupIcon *)icon dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"icon"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_cacheExpiryMinutes];
    [v4 setObject:v9 forKey:@"cache_expiry_minutes"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t identityType = self->_identityType;
    if (identityType >= 3)
    {
      v11 = +[NSString stringWithFormat:@"(unknown: %i)", self->_identityType];
    }
    else
    {
      v11 = off_100034A78[identityType];
    }
    [v4 setObject:v11 forKey:@"identityType"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000037C4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_icon)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v6;
  }
  if (self->_icon)
  {
    objc_msgSend(v6, "setIcon:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_cacheExpiryMinutes;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_identityType;
    *((unsigned char *)v4 + 40) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_name copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(LiveLookupIcon *)self->_icon copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 2) = self->_cacheExpiryMinutes;
    *((unsigned char *)v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_identityType;
    *((unsigned char *)v5 + 40) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_15;
    }
  }
  icon = self->_icon;
  if ((unint64_t)icon | *((void *)v4 + 2))
  {
    if (!-[LiveLookupIcon isEqual:](icon, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_cacheExpiryMinutes != *((_DWORD *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_identityType != *((_DWORD *)v4 + 6)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  unint64_t v4 = [(LiveLookupIcon *)self->_icon hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_cacheExpiryMinutes;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_identityType;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 4))
  {
    -[LiveLookupCallIdentity setName:](self, "setName:");
    id v4 = v8;
  }
  icon = self->_icon;
  uint64_t v6 = *((void *)v4 + 2);
  if (icon)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[LiveLookupIcon mergeFrom:](icon, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[LiveLookupCallIdentity setIcon:](self, "setIcon:");
  }
  id v4 = v8;
LABEL_9:
  char v7 = *((unsigned char *)v4 + 40);
  if (v7)
  {
    self->_cacheExpiryMinutes = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 40);
  }
  if ((v7 & 2) != 0)
  {
    self->_uint64_t identityType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }

  _objc_release_x1();
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (LiveLookupIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (unsigned)cacheExpiryMinutes
{
  return self->_cacheExpiryMinutes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_icon, 0);
}

@end