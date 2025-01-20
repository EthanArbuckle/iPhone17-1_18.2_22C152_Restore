@interface HDCodableSyncAnchorRange
- (BOOL)hasEndAnchor;
- (BOOL)hasEntityIdentifier;
- (BOOL)hasEntityType;
- (BOOL)hasStartAnchor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableEntityIdentifier)entityIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)endAnchor;
- (int64_t)entityType;
- (int64_t)startAnchor;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndAnchor:(int64_t)a3;
- (void)setEntityIdentifier:(id)a3;
- (void)setEntityType:(int64_t)a3;
- (void)setHasEndAnchor:(BOOL)a3;
- (void)setHasEntityType:(BOOL)a3;
- (void)setHasStartAnchor:(BOOL)a3;
- (void)setStartAnchor:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSyncAnchorRange

- (void)setEntityType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_entityType = a3;
}

- (void)setHasEntityType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEntityType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStartAnchor:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_startAnchor = a3;
}

- (void)setHasStartAnchor:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartAnchor
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEndAnchor:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_endAnchor = a3;
}

- (void)setHasEndAnchor:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndAnchor
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasEntityIdentifier
{
  return self->_entityIdentifier != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSyncAnchorRange;
  v4 = [(HDCodableSyncAnchorRange *)&v8 description];
  v5 = [(HDCodableSyncAnchorRange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithLongLong:self->_entityType];
    [v3 setObject:v9 forKey:@"entityType"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v10 = [NSNumber numberWithLongLong:self->_startAnchor];
  [v3 setObject:v10 forKey:@"startAnchor"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v5 = [NSNumber numberWithLongLong:self->_endAnchor];
    [v3 setObject:v5 forKey:@"endAnchor"];
  }
LABEL_5:
  entityIdentifier = self->_entityIdentifier;
  if (entityIdentifier)
  {
    v7 = [(HDCodableEntityIdentifier *)entityIdentifier dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"entityIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSyncAnchorRangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_entityIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_entityType;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_startAnchor;
  *((unsigned char *)v4 + 40) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v4[1] = self->_endAnchor;
    *((unsigned char *)v4 + 40) |= 1u;
  }
LABEL_5:
  if (self->_entityIdentifier)
  {
    id v6 = v4;
    objc_msgSend(v4, "setEntityIdentifier:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 24) = self->_startAnchor;
    *(unsigned char *)(v5 + 40) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 16) = self->_entityType;
  *(unsigned char *)(v5 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(void *)(v5 + 8) = self->_endAnchor;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
LABEL_5:
  id v8 = [(HDCodableEntityIdentifier *)self->_entityIdentifier copyWithZone:a3];
  v9 = (void *)v6[4];
  v6[4] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_entityType != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_startAnchor != *((void *)v4 + 3)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_endAnchor != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_19;
  }
  entityIdentifier = self->_entityIdentifier;
  if ((unint64_t)entityIdentifier | *((void *)v4 + 4)) {
    char v6 = -[HDCodableEntityIdentifier isEqual:](entityIdentifier, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(HDCodableEntityIdentifier *)self->_entityIdentifier hash];
  }
  uint64_t v2 = 2654435761 * self->_entityType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_startAnchor;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_endAnchor;
  return v3 ^ v2 ^ v4 ^ [(HDCodableEntityIdentifier *)self->_entityIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 40);
  if ((v6 & 2) != 0)
  {
    self->_entityType = v4[2];
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 40);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v4[5] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_startAnchor = v4[3];
  *(unsigned char *)&self->_has |= 4u;
  if (v4[5])
  {
LABEL_4:
    self->_endAnchor = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  entityIdentifier = self->_entityIdentifier;
  uint64_t v8 = v5[4];
  if (entityIdentifier)
  {
    if (!v8) {
      goto LABEL_14;
    }
    v9 = v5;
    -[HDCodableEntityIdentifier mergeFrom:](entityIdentifier, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    v9 = v5;
    -[HDCodableSyncAnchorRange setEntityIdentifier:](self, "setEntityIdentifier:");
  }
  uint64_t v5 = v9;
LABEL_14:
}

- (int64_t)entityType
{
  return self->_entityType;
}

- (int64_t)startAnchor
{
  return self->_startAnchor;
}

- (int64_t)endAnchor
{
  return self->_endAnchor;
}

- (HDCodableEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end