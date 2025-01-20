@interface PDDPRoleLocation
- (BOOL)hasLocationId;
- (BOOL)hasRoleId;
- (BOOL)hasRoleType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)locationId;
- (NSString)roleId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)roleTypeAsString:(int)a3;
- (int)StringAsRoleType:(id)a3;
- (int)roleType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRoleType:(BOOL)a3;
- (void)setLocationId:(id)a3;
- (void)setRoleId:(id)a3;
- (void)setRoleType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPRoleLocation

- (BOOL)hasRoleId
{
  return self->_roleId != 0;
}

- (BOOL)hasLocationId
{
  return self->_locationId != 0;
}

- (int)roleType
{
  if (*(unsigned char *)&self->_has) {
    return self->_roleType;
  }
  else {
    return 0;
  }
}

- (void)setRoleType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_roleType = a3;
}

- (void)setHasRoleType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRoleType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)roleTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_1001F3788 + a3);
  }

  return v3;
}

- (int)StringAsRoleType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ROLE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ADMINISTRATOR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SITE_MANAGER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MANAGER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"INSTRUCTOR"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"STAFF"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"STUDENT"])
  {
    int v4 = 6;
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
  v7.super_class = (Class)PDDPRoleLocation;
  id v3 = [(PDDPRoleLocation *)&v7 description];
  int v4 = [(PDDPRoleLocation *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  roleId = self->_roleId;
  if (roleId) {
    [v3 setObject:roleId forKey:@"role_id"];
  }
  locationId = self->_locationId;
  if (locationId) {
    [v4 setObject:locationId forKey:@"location_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t roleType = self->_roleType;
    if (roleType >= 7)
    {
      v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_roleType];
    }
    else
    {
      v8 = *(&off_1001F3788 + roleType);
    }
    [v4 setObject:v8 forKey:@"role_type"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10008601C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_roleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_locationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_roleId)
  {
    objc_msgSend(v4, "setRoleId:");
    id v4 = v5;
  }
  if (self->_locationId)
  {
    objc_msgSend(v5, "setLocationId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_roleType;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_roleId copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_locationId copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 6) = self->_roleType;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  roleId = self->_roleId;
  if ((unint64_t)roleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](roleId, "isEqual:")) {
      goto LABEL_10;
    }
  }
  locationId = self->_locationId;
  if ((unint64_t)locationId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](locationId, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_roleType == *((_DWORD *)v4 + 6))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_roleId hash];
  NSUInteger v4 = [(NSString *)self->_locationId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_roleType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[PDDPRoleLocation setRoleId:](self, "setRoleId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[PDDPRoleLocation setLocationId:](self, "setLocationId:");
    NSUInteger v4 = v5;
  }
  if (v4[7])
  {
    self->_uint64_t roleType = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)roleId
{
  return self->_roleId;
}

- (void)setRoleId:(id)a3
{
}

- (NSString)locationId
{
  return self->_locationId;
}

- (void)setLocationId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roleId, 0);

  objc_storeStrong((id *)&self->_locationId, 0);
}

@end