@interface AWDCountersThreadMleS
- (BOOL)hasAttachAttempts;
- (BOOL)hasBetterPartitionAttachAttempts;
- (BOOL)hasChildRoleCount;
- (BOOL)hasDetachedRoleCount;
- (BOOL)hasDisabledRoleCount;
- (BOOL)hasLeaderRoleCount;
- (BOOL)hasParentChangesCount;
- (BOOL)hasPartitionIdChangesCount;
- (BOOL)hasRouterRoleCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)attachAttempts;
- (unsigned)betterPartitionAttachAttempts;
- (unsigned)childRoleCount;
- (unsigned)detachedRoleCount;
- (unsigned)disabledRoleCount;
- (unsigned)leaderRoleCount;
- (unsigned)parentChangesCount;
- (unsigned)partitionIdChangesCount;
- (unsigned)routerRoleCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttachAttempts:(unsigned int)a3;
- (void)setBetterPartitionAttachAttempts:(unsigned int)a3;
- (void)setChildRoleCount:(unsigned int)a3;
- (void)setDetachedRoleCount:(unsigned int)a3;
- (void)setDisabledRoleCount:(unsigned int)a3;
- (void)setHasAttachAttempts:(BOOL)a3;
- (void)setHasBetterPartitionAttachAttempts:(BOOL)a3;
- (void)setHasChildRoleCount:(BOOL)a3;
- (void)setHasDetachedRoleCount:(BOOL)a3;
- (void)setHasDisabledRoleCount:(BOOL)a3;
- (void)setHasLeaderRoleCount:(BOOL)a3;
- (void)setHasParentChangesCount:(BOOL)a3;
- (void)setHasPartitionIdChangesCount:(BOOL)a3;
- (void)setHasRouterRoleCount:(BOOL)a3;
- (void)setLeaderRoleCount:(unsigned int)a3;
- (void)setParentChangesCount:(unsigned int)a3;
- (void)setPartitionIdChangesCount:(unsigned int)a3;
- (void)setRouterRoleCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersThreadMleS

- (void)setDisabledRoleCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_disabledRoleCount = a3;
}

- (void)setHasDisabledRoleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDisabledRoleCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDetachedRoleCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_detachedRoleCount = a3;
}

- (void)setHasDetachedRoleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDetachedRoleCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setChildRoleCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_childRoleCount = a3;
}

- (void)setHasChildRoleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasChildRoleCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRouterRoleCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_routerRoleCount = a3;
}

- (void)setHasRouterRoleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRouterRoleCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setLeaderRoleCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_leaderRoleCount = a3;
}

- (void)setHasLeaderRoleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLeaderRoleCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAttachAttempts:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_attachAttempts = a3;
}

- (void)setHasAttachAttempts:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAttachAttempts
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPartitionIdChangesCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_partitionIdChangesCount = a3;
}

- (void)setHasPartitionIdChangesCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPartitionIdChangesCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setBetterPartitionAttachAttempts:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_betterPartitionAttachAttempts = a3;
}

- (void)setHasBetterPartitionAttachAttempts:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBetterPartitionAttachAttempts
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setParentChangesCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_parentChangesCount = a3;
}

- (void)setHasParentChangesCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasParentChangesCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDCountersThreadMleS;
  __int16 v3 = [(AWDCountersThreadMleS *)&v7 description];
  v4 = [(AWDCountersThreadMleS *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_disabledRoleCount];
    [v3 setObject:v7 forKey:@"disabled_role_count"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->_detachedRoleCount];
  [v3 setObject:v8 forKey:@"detached_role_count"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v9 = +[NSNumber numberWithUnsignedInt:self->_childRoleCount];
  [v3 setObject:v9 forKey:@"child_role_count"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v10 = +[NSNumber numberWithUnsignedInt:self->_routerRoleCount];
  [v3 setObject:v10 forKey:@"router_role_count"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = +[NSNumber numberWithUnsignedInt:self->_leaderRoleCount];
  [v3 setObject:v11 forKey:@"leader_role_count"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = +[NSNumber numberWithUnsignedInt:self->_attachAttempts];
  [v3 setObject:v12 forKey:@"attach_attempts"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = +[NSNumber numberWithUnsignedInt:self->_partitionIdChangesCount];
  [v3 setObject:v13 forKey:@"partition_id_changes_count"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v14 = +[NSNumber numberWithUnsignedInt:self->_betterPartitionAttachAttempts];
  [v3 setObject:v14 forKey:@"better_partition_attach_attempts"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    v5 = +[NSNumber numberWithUnsignedInt:self->_parentChangesCount];
    [v3 setObject:v5 forKey:@"parent_changes_count"];
  }
LABEL_11:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCountersThreadMleSReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_10:
    v5 = v6;
    goto LABEL_12;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  v5 = v6;

LABEL_12:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[6] = self->_disabledRoleCount;
    *((_WORD *)v4 + 22) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_detachedRoleCount;
  *((_WORD *)v4 + 22) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[4] = self->_childRoleCount;
  *((_WORD *)v4 + 22) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[10] = self->_routerRoleCount;
  *((_WORD *)v4 + 22) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[7] = self->_leaderRoleCount;
  *((_WORD *)v4 + 22) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[2] = self->_attachAttempts;
  *((_WORD *)v4 + 22) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[9] = self->_partitionIdChangesCount;
  *((_WORD *)v4 + 22) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[3] = self->_betterPartitionAttachAttempts;
  *((_WORD *)v4 + 22) |= 2u;
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_10:
    goto LABEL_12;
  }
LABEL_21:
  v4[8] = self->_parentChangesCount;
  *((_WORD *)v4 + 22) |= 0x40u;

LABEL_12:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 6) = self->_disabledRoleCount;
    *((_WORD *)result + 22) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_detachedRoleCount;
  *((_WORD *)result + 22) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 4) = self->_childRoleCount;
  *((_WORD *)result + 22) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 10) = self->_routerRoleCount;
  *((_WORD *)result + 22) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 7) = self->_leaderRoleCount;
  *((_WORD *)result + 22) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 2) = self->_attachAttempts;
  *((_WORD *)result + 22) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 9) = self->_partitionIdChangesCount;
  *((_WORD *)result + 22) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      return result;
    }
LABEL_19:
    *((_DWORD *)result + 8) = self->_parentChangesCount;
    *((_WORD *)result + 22) |= 0x40u;
    return result;
  }
LABEL_18:
  *((_DWORD *)result + 3) = self->_betterPartitionAttachAttempts;
  *((_WORD *)result + 22) |= 2u;
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    goto LABEL_19;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 22);
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_disabledRoleCount != *((_DWORD *)v4 + 6)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_detachedRoleCount != *((_DWORD *)v4 + 5)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_childRoleCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 22) & 0x100) == 0 || self->_routerRoleCount != *((_DWORD *)v4 + 10)) {
      goto LABEL_47;
    }
  }
  else if ((*((_WORD *)v4 + 22) & 0x100) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_leaderRoleCount != *((_DWORD *)v4 + 7)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_attachAttempts != *((_DWORD *)v4 + 2)) {
      goto LABEL_47;
    }
  }
  else if (v6)
  {
    goto LABEL_47;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_partitionIdChangesCount != *((_DWORD *)v4 + 9)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_betterPartitionAttachAttempts != *((_DWORD *)v4 + 3)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x40) == 0)
  {
    BOOL v7 = (v6 & 0x40) == 0;

    return v7;
  }
  if ((v6 & 0x40) != 0 && self->_parentChangesCount == *((_DWORD *)v4 + 8))
  {

    return 1;
  }
LABEL_47:

  return 0;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v3 = 2654435761 * self->_disabledRoleCount;
    if ((has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_detachedRoleCount;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_childRoleCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_routerRoleCount;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_leaderRoleCount;
    if (has) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if (has)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_attachAttempts;
    if ((has & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_partitionIdChangesCount;
    if ((has & 2) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v10 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((has & 2) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_betterPartitionAttachAttempts;
  if ((has & 0x40) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_parentChangesCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x10) != 0)
  {
    self->_disabledRoleCount = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v5 = *((_WORD *)v4 + 22);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_detachedRoleCount = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_childRoleCount = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_routerRoleCount = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_leaderRoleCount = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_attachAttempts = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_partitionIdChangesCount = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 22);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_betterPartitionAttachAttempts = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 22) & 0x40) == 0)
  {
LABEL_10:
    goto LABEL_12;
  }
LABEL_21:
  self->_parentChangesCount = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;

LABEL_12:
}

- (unsigned)disabledRoleCount
{
  return self->_disabledRoleCount;
}

- (unsigned)detachedRoleCount
{
  return self->_detachedRoleCount;
}

- (unsigned)childRoleCount
{
  return self->_childRoleCount;
}

- (unsigned)routerRoleCount
{
  return self->_routerRoleCount;
}

- (unsigned)leaderRoleCount
{
  return self->_leaderRoleCount;
}

- (unsigned)attachAttempts
{
  return self->_attachAttempts;
}

- (unsigned)partitionIdChangesCount
{
  return self->_partitionIdChangesCount;
}

- (unsigned)betterPartitionAttachAttempts
{
  return self->_betterPartitionAttachAttempts;
}

- (unsigned)parentChangesCount
{
  return self->_parentChangesCount;
}

@end