@interface HDCloudSyncCodableChange
- (BOOL)finalForSequence;
- (BOOL)hasAnchorRangeMap;
- (BOOL)hasChangeIndex;
- (BOOL)hasChangeSize;
- (BOOL)hasFinalForSequence;
- (BOOL)hasProtocolVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncAnchorRangeMap)anchorRangeMap;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)changeIndex;
- (int64_t)changeSize;
- (int64_t)protocolVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnchorRangeMap:(id)a3;
- (void)setChangeIndex:(int64_t)a3;
- (void)setChangeSize:(int64_t)a3;
- (void)setFinalForSequence:(BOOL)a3;
- (void)setHasChangeIndex:(BOOL)a3;
- (void)setHasChangeSize:(BOOL)a3;
- (void)setHasFinalForSequence:(BOOL)a3;
- (void)setHasProtocolVersion:(BOOL)a3;
- (void)setProtocolVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableChange

- (BOOL)hasAnchorRangeMap
{
  return self->_anchorRangeMap != 0;
}

- (void)setProtocolVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProtocolVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setChangeSize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_changeSize = a3;
}

- (void)setHasChangeSize:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChangeSize
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setChangeIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_changeIndex = a3;
}

- (void)setHasChangeIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChangeIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFinalForSequence:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_finalForSequence = a3;
}

- (void)setHasFinalForSequence:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFinalForSequence
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableChange;
  v4 = [(HDCloudSyncCodableChange *)&v8 description];
  v5 = [(HDCloudSyncCodableChange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  anchorRangeMap = self->_anchorRangeMap;
  if (anchorRangeMap)
  {
    v5 = [(HDCodableSyncAnchorRangeMap *)anchorRangeMap dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"anchorRangeMap"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = [NSNumber numberWithLongLong:self->_protocolVersion];
    [v3 setObject:v9 forKey:@"protocolVersion"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v10 = [NSNumber numberWithLongLong:self->_changeSize];
  [v3 setObject:v10 forKey:@"changeSize"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  v11 = [NSNumber numberWithLongLong:self->_changeIndex];
  [v3 setObject:v11 forKey:@"changeIndex"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    v7 = [NSNumber numberWithBool:self->_finalForSequence];
    [v3 setObject:v7 forKey:@"finalForSequence"];
  }
LABEL_8:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_anchorRangeMap)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_8:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_anchorRangeMap)
  {
    id v6 = v4;
    objc_msgSend(v4, "setAnchorRangeMap:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_protocolVersion;
    *((unsigned char *)v4 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 2) = self->_changeSize;
  *((unsigned char *)v4 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((void *)v4 + 1) = self->_changeIndex;
  *((unsigned char *)v4 + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((unsigned char *)v4 + 40) = self->_finalForSequence;
    *((unsigned char *)v4 + 44) |= 8u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSyncAnchorRangeMap *)self->_anchorRangeMap copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_protocolVersion;
    *(unsigned char *)(v5 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(void *)(v5 + 8) = self->_changeIndex;
      *(unsigned char *)(v5 + 44) |= 1u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_changeSize;
  *(unsigned char *)(v5 + 44) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(unsigned char *)(v5 + 40) = self->_finalForSequence;
    *(unsigned char *)(v5 + 44) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  anchorRangeMap = self->_anchorRangeMap;
  if ((unint64_t)anchorRangeMap | *((void *)v4 + 4))
  {
    if (!-[HDCodableSyncAnchorRangeMap isEqual:](anchorRangeMap, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_protocolVersion != *((void *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_changeSize != *((void *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_changeIndex != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_21;
  }
  BOOL v6 = (*((unsigned char *)v4 + 44) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0)
    {
LABEL_21:
      BOOL v6 = 0;
      goto LABEL_22;
    }
    if (self->_finalForSequence)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_21;
    }
    BOOL v6 = 1;
  }
LABEL_22:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableSyncAnchorRangeMap *)self->_anchorRangeMap hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_protocolVersion;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_changeSize;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_changeIndex;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_finalForSequence;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  anchorRangeMap = self->_anchorRangeMap;
  uint64_t v6 = *((void *)v4 + 4);
  if (anchorRangeMap)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[HDCodableSyncAnchorRangeMap mergeFrom:](anchorRangeMap, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[HDCloudSyncCodableChange setAnchorRangeMap:](self, "setAnchorRangeMap:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 44);
  if ((v7 & 4) != 0)
  {
    self->_protocolVersion = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v7 = *((unsigned char *)v4 + 44);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_changeSize = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v7 = *((unsigned char *)v4 + 44);
  if ((v7 & 1) == 0)
  {
LABEL_10:
    if ((v7 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  self->_changeIndex = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
LABEL_11:
    self->_finalForSequence = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_12:
}

- (HDCodableSyncAnchorRangeMap)anchorRangeMap
{
  return self->_anchorRangeMap;
}

- (void)setAnchorRangeMap:(id)a3
{
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (int64_t)changeSize
{
  return self->_changeSize;
}

- (int64_t)changeIndex
{
  return self->_changeIndex;
}

- (BOOL)finalForSequence
{
  return self->_finalForSequence;
}

- (void).cxx_destruct
{
}

@end