@interface ATXAnchorModelPBActionUUIDMetadata
- (ATXAnchorModelPBLaunchHistoryMetadata)actionUUIDLaunchHistory;
- (BOOL)hasActionUUID;
- (BOOL)hasActionUUIDLaunchHistory;
- (BOOL)hasParamCount;
- (BOOL)hasSlotHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)actionUUID;
- (int64_t)slotHash;
- (unint64_t)hash;
- (unsigned)paramCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionUUID:(int64_t)a3;
- (void)setActionUUIDLaunchHistory:(id)a3;
- (void)setHasActionUUID:(BOOL)a3;
- (void)setHasParamCount:(BOOL)a3;
- (void)setHasSlotHash:(BOOL)a3;
- (void)setParamCount:(unsigned int)a3;
- (void)setSlotHash:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXAnchorModelPBActionUUIDMetadata

- (void)setActionUUID:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_actionUUID = a3;
}

- (void)setHasActionUUID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionUUID
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSlotHash:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_slotHash = a3;
}

- (void)setHasSlotHash:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSlotHash
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setParamCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_paramCount = a3;
}

- (void)setHasParamCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasParamCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasActionUUIDLaunchHistory
{
  return self->_actionUUIDLaunchHistory != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXAnchorModelPBActionUUIDMetadata;
  v4 = [(ATXAnchorModelPBActionUUIDMetadata *)&v8 description];
  v5 = [(ATXAnchorModelPBActionUUIDMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithLongLong:self->_actionUUID];
    [v3 setObject:v9 forKey:@"actionUUID"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = [NSNumber numberWithLongLong:self->_slotHash];
  [v3 setObject:v10 forKey:@"slotHash"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithUnsignedInt:self->_paramCount];
    [v3 setObject:v5 forKey:@"paramCount"];
  }
LABEL_5:
  actionUUIDLaunchHistory = self->_actionUUIDLaunchHistory;
  if (actionUUIDLaunchHistory)
  {
    v7 = [(ATXAnchorModelPBLaunchHistoryMetadata *)actionUUIDLaunchHistory dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"actionUUIDLaunchHistory"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBActionUUIDMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_actionUUIDLaunchHistory)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_actionUUID;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_slotHash;
  *((unsigned char *)v4 + 36) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 8) = self->_paramCount;
    *((unsigned char *)v4 + 36) |= 4u;
  }
LABEL_5:
  if (self->_actionUUIDLaunchHistory)
  {
    id v6 = v4;
    objc_msgSend(v4, "setActionUUIDLaunchHistory:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 16) = self->_slotHash;
    *(unsigned char *)(v5 + 36) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 8) = self->_actionUUID;
  *(unsigned char *)(v5 + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 32) = self->_paramCount;
    *(unsigned char *)(v5 + 36) |= 4u;
  }
LABEL_5:
  id v8 = [(ATXAnchorModelPBLaunchHistoryMetadata *)self->_actionUUIDLaunchHistory copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_actionUUID != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_slotHash != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_paramCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_19;
  }
  actionUUIDLaunchHistory = self->_actionUUIDLaunchHistory;
  if ((unint64_t)actionUUIDLaunchHistory | *((void *)v4 + 3)) {
    char v6 = -[ATXAnchorModelPBLaunchHistoryMetadata isEqual:](actionUUIDLaunchHistory, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(ATXAnchorModelPBLaunchHistoryMetadata *)self->_actionUUIDLaunchHistory hash];
  }
  uint64_t v2 = 2654435761 * self->_actionUUID;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_slotHash;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_paramCount;
  return v3 ^ v2 ^ v4 ^ [(ATXAnchorModelPBLaunchHistoryMetadata *)self->_actionUUIDLaunchHistory hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 36);
  if (v6)
  {
    self->_actionUUID = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 36);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_slotHash = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
LABEL_4:
    self->_paramCount = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  actionUUIDLaunchHistory = self->_actionUUIDLaunchHistory;
  uint64_t v8 = v5[3];
  if (actionUUIDLaunchHistory)
  {
    if (!v8) {
      goto LABEL_14;
    }
    v9 = v5;
    actionUUIDLaunchHistory = (ATXAnchorModelPBLaunchHistoryMetadata *)-[ATXAnchorModelPBLaunchHistoryMetadata mergeFrom:](actionUUIDLaunchHistory, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    v9 = v5;
    actionUUIDLaunchHistory = (ATXAnchorModelPBLaunchHistoryMetadata *)-[ATXAnchorModelPBActionUUIDMetadata setActionUUIDLaunchHistory:](self, "setActionUUIDLaunchHistory:");
  }
  uint64_t v5 = v9;
LABEL_14:
  MEMORY[0x1F41817F8](actionUUIDLaunchHistory, v5);
}

- (int64_t)actionUUID
{
  return self->_actionUUID;
}

- (int64_t)slotHash
{
  return self->_slotHash;
}

- (unsigned)paramCount
{
  return self->_paramCount;
}

- (ATXAnchorModelPBLaunchHistoryMetadata)actionUUIDLaunchHistory
{
  return self->_actionUUIDLaunchHistory;
}

- (void)setActionUUIDLaunchHistory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end