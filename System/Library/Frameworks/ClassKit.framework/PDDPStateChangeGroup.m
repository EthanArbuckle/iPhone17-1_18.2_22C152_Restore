@interface PDDPStateChangeGroup
- (BOOL)hasGroupId;
- (BOOL)hasRoles;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)groupId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)roles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGroupId:(id)a3;
- (void)setHasRoles:(BOOL)a3;
- (void)setRoles:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPStateChangeGroup

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

- (void)setRoles:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_roles = a3;
}

- (void)setHasRoles:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRoles
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPStateChangeGroup;
  v3 = [(PDDPStateChangeGroup *)&v7 description];
  v4 = [(PDDPStateChangeGroup *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  groupId = self->_groupId;
  if (groupId) {
    [v3 setObject:groupId forKey:@"group_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_roles];
    [v4 setObject:v6 forKey:@"roles"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000BC51C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_groupId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_groupId)
  {
    id v5 = v4;
    objc_msgSend(v4, "setGroupId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_roles;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_groupId copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_roles;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  groupId = self->_groupId;
  if ((unint64_t)groupId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](groupId, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_roles == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_groupId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_roles;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[PDDPStateChangeGroup setGroupId:](self, "setGroupId:");
    uint64_t v4 = v5;
  }
  if (v4[5])
  {
    self->_roles = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(id)a3
{
}

- (unsigned)roles
{
  return self->_roles;
}

- (void).cxx_destruct
{
}

@end