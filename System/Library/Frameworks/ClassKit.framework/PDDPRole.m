@interface PDDPRole
+ (Class)privilegesType;
- (BOOL)hasEntityMeta;
- (BOOL)hasRoleId;
- (BOOL)hasRoleType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)privileges;
- (NSString)roleId;
- (PDDPEntityMeta)entityMeta;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)privilegesAtIndex:(unint64_t)a3;
- (id)roleTypeAsString:(int)a3;
- (int)StringAsRoleType:(id)a3;
- (int)roleType;
- (unint64_t)hash;
- (unint64_t)privilegesCount;
- (void)addPrivileges:(id)a3;
- (void)clearPrivileges;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEntityMeta:(id)a3;
- (void)setHasRoleType:(BOOL)a3;
- (void)setPrivileges:(id)a3;
- (void)setRoleId:(id)a3;
- (void)setRoleType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPRole

- (BOOL)hasRoleId
{
  return self->_roleId != 0;
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
    v3 = off_1001F4FA0[a3];
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

- (void)clearPrivileges
{
}

- (void)addPrivileges:(id)a3
{
  id v4 = a3;
  privileges = self->_privileges;
  id v8 = v4;
  if (!privileges)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_privileges;
    self->_privileges = v6;

    id v4 = v8;
    privileges = self->_privileges;
  }
  [(NSMutableArray *)privileges addObject:v4];
}

- (unint64_t)privilegesCount
{
  return (unint64_t)[(NSMutableArray *)self->_privileges count];
}

- (id)privilegesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_privileges objectAtIndex:a3];
}

+ (Class)privilegesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasEntityMeta
{
  return self->_entityMeta != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPRole;
  id v3 = [(PDDPRole *)&v7 description];
  id v4 = [(PDDPRole *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  roleId = self->_roleId;
  if (roleId) {
    [v3 setObject:roleId forKey:@"role_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t roleType = self->_roleType;
    if (roleType >= 7)
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_roleType];
    }
    else
    {
      objc_super v7 = off_1001F4FA0[roleType];
    }
    [v4 setObject:v7 forKey:@"role_type"];
  }
  if ([(NSMutableArray *)self->_privileges count])
  {
    id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_privileges, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v9 = self->_privileges;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"privileges"];
  }
  entityMeta = self->_entityMeta;
  if (entityMeta)
  {
    v16 = [(PDDPEntityMeta *)entityMeta dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"entity_meta"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100102FA4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_roleId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_privileges;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_entityMeta) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_roleId)
  {
    objc_msgSend(v4, "setRoleId:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_roleType;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  if ([(PDDPRole *)self privilegesCount])
  {
    [v9 clearPrivileges];
    unint64_t v5 = [(PDDPRole *)self privilegesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PDDPRole *)self privilegesAtIndex:i];
        [v9 addPrivileges:v8];
      }
    }
  }
  if (self->_entityMeta) {
    objc_msgSend(v9, "setEntityMeta:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_roleId copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 8) = self->_roleType;
    *((unsigned char *)v5 + 36) |= 1u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->_privileges;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [v5 addPrivileges:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  id v14 = [(PDDPEntityMeta *)self->_entityMeta copyWithZone:a3];
  v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  roleId = self->_roleId;
  if ((unint64_t)roleId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](roleId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_roleType != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    unsigned __int8 v8 = 0;
    goto LABEL_14;
  }
  privileges = self->_privileges;
  if ((unint64_t)privileges | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](privileges, "isEqual:"))
  {
    goto LABEL_13;
  }
  entityMeta = self->_entityMeta;
  if ((unint64_t)entityMeta | *((void *)v4 + 1)) {
    unsigned __int8 v8 = -[PDDPEntityMeta isEqual:](entityMeta, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_roleId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_roleType;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_privileges hash];
  return v5 ^ v6 ^ [(PDDPEntityMeta *)self->_entityMeta hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[PDDPRole setRoleId:](self, "setRoleId:");
  }
  if (*((unsigned char *)v4 + 36))
  {
    self->_uint64_t roleType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 2);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[PDDPRole addPrivileges:](self, "addPrivileges:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  entityMeta = self->_entityMeta;
  uint64_t v11 = *((void *)v4 + 1);
  if (entityMeta)
  {
    if (v11) {
      -[PDDPEntityMeta mergeFrom:](entityMeta, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[PDDPRole setEntityMeta:](self, "setEntityMeta:");
  }
}

- (NSString)roleId
{
  return self->_roleId;
}

- (void)setRoleId:(id)a3
{
}

- (NSMutableArray)privileges
{
  return self->_privileges;
}

- (void)setPrivileges:(id)a3
{
}

- (PDDPEntityMeta)entityMeta
{
  return self->_entityMeta;
}

- (void)setEntityMeta:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roleId, 0);
  objc_storeStrong((id *)&self->_privileges, 0);

  objc_storeStrong((id *)&self->_entityMeta, 0);
}

@end