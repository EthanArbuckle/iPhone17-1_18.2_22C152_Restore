@interface HMMediaGroupProtoMediaGroupRole
- (BOOL)hasMediaSystem;
- (BOOL)hasRole;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMMediaGroupProtoMediaSystemRoles)mediaSystem;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)roleAsString:(int)a3;
- (int)StringAsRole:(id)a3;
- (int)role;
- (unint64_t)hash;
- (void)clearOneofValuesForRole;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRole:(BOOL)a3;
- (void)setMediaSystem:(id)a3;
- (void)setRole:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMMediaGroupProtoMediaGroupRole

- (void).cxx_destruct
{
}

- (HMMediaGroupProtoMediaSystemRoles)mediaSystem
{
  return self->_mediaSystem;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[5])
  {
    self->_role = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  mediaSystem = self->_mediaSystem;
  uint64_t v7 = *((void *)v5 + 1);
  if (mediaSystem)
  {
    if (!v7) {
      goto LABEL_9;
    }
    v8 = v5;
    mediaSystem = (HMMediaGroupProtoMediaSystemRoles *)-[HMMediaGroupProtoMediaSystemRoles mergeFrom:](mediaSystem, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    v8 = v5;
    mediaSystem = (HMMediaGroupProtoMediaSystemRoles *)-[HMMediaGroupProtoMediaGroupRole setMediaSystem:](self, "setMediaSystem:");
  }
  v5 = v8;
LABEL_9:

  MEMORY[0x1F41817F8](mediaSystem, v5);
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_role;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(HMMediaGroupProtoMediaSystemRoles *)self->_mediaSystem hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_role != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  mediaSystem = self->_mediaSystem;
  if ((unint64_t)mediaSystem | *((void *)v4 + 1)) {
    char v6 = -[HMMediaGroupProtoMediaSystemRoles isEqual:](mediaSystem, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_role;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  id v7 = [(HMMediaGroupProtoMediaSystemRoles *)self->_mediaSystem copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_role;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  if (self->_mediaSystem)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, "setMediaSystem:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  if (self->_mediaSystem) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMMediaGroupProtoMediaGroupRoleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  mediaSystem = self->_mediaSystem;
  if (mediaSystem)
  {
    uint64_t v5 = [(HMMediaGroupProtoMediaSystemRoles *)mediaSystem dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"mediaSystem"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int role = self->_role;
    if (role)
    {
      if (role == 1)
      {
        id v7 = @"mediaSystem";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_role);
        id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v7 = @"PBUNSET";
    }
    [v3 setObject:v7 forKey:@"role"];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMMediaGroupProtoMediaGroupRole;
  id v4 = [(HMMediaGroupProtoMediaGroupRole *)&v8 description];
  uint64_t v5 = [(HMMediaGroupProtoMediaGroupRole *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)clearOneofValuesForRole
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_int role = 0;
  self->_mediaSystem = 0;
  MEMORY[0x1F41817F8]();
}

- (int)StringAsRole:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"mediaSystem"];
  }

  return v4;
}

- (id)roleAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"mediaSystem";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"PBUNSET";
  }
  return v4;
}

- (BOOL)hasRole
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRole:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRole:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int role = a3;
}

- (int)role
{
  if (*(unsigned char *)&self->_has) {
    return self->_role;
  }
  else {
    return 0;
  }
}

- (void)setMediaSystem:(id)a3
{
  int v4 = (HMMediaGroupProtoMediaSystemRoles *)a3;
  [(HMMediaGroupProtoMediaGroupRole *)self clearOneofValuesForRole];
  *(unsigned char *)&self->_has |= 1u;
  self->_int role = 1;
  mediaSystem = self->_mediaSystem;
  self->_mediaSystem = v4;
}

- (BOOL)hasMediaSystem
{
  return self->_mediaSystem != 0;
}

@end