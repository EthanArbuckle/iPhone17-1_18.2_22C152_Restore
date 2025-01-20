@interface BLTPBIntelligentSummaryBulletinRequest
- (BLTPBBulletin)bulletin;
- (BOOL)hasBulletin;
- (BOOL)hasDate;
- (BOOL)hasUpdateType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)updateType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBulletin:(id)a3;
- (void)setDate:(double)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setHasUpdateType:(BOOL)a3;
- (void)setUpdateType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBIntelligentSummaryBulletinRequest

- (BOOL)hasBulletin
{
  return self->_bulletin != 0;
}

- (void)setDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUpdateType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_updateType = a3;
}

- (void)setHasUpdateType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUpdateType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBIntelligentSummaryBulletinRequest;
  v4 = [(BLTPBIntelligentSummaryBulletinRequest *)&v8 description];
  v5 = [(BLTPBIntelligentSummaryBulletinRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  bulletin = self->_bulletin;
  if (bulletin)
  {
    v5 = [(BLTPBBulletin *)bulletin dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"bulletin"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithDouble:self->_date];
    [v3 setObject:v7 forKey:@"date"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_updateType];
    [v3 setObject:v8 forKey:@"updateType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBIntelligentSummaryBulletinRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_bulletin)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_bulletin)
  {
    id v6 = v4;
    objc_msgSend(v4, "setBulletin:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_date;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_updateType;
    *((unsigned char *)v4 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(BLTPBBulletin *)self->_bulletin copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_date;
    *(unsigned char *)(v5 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_updateType;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  bulletin = self->_bulletin;
  if ((unint64_t)bulletin | *((void *)v4 + 2))
  {
    if (!-[BLTPBBulletin isEqual:](bulletin, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_updateType != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BLTPBBulletin *)self->_bulletin hash];
  char has = (char)self->_has;
  if (has)
  {
    double date = self->_date;
    double v7 = -date;
    if (date >= 0.0) {
      double v7 = self->_date;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_updateType;
  }
  else {
    uint64_t v10 = 0;
  }
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  bulletin = self->_bulletin;
  uint64_t v6 = *((void *)v4 + 2);
  if (bulletin)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[BLTPBBulletin mergeFrom:](bulletin, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[BLTPBIntelligentSummaryBulletinRequest setBulletin:](self, "setBulletin:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 28);
  if (v7)
  {
    self->_double date = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 28);
  }
  if ((v7 & 2) != 0)
  {
    self->_updateType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x270F9A758]();
}

- (BLTPBBulletin)bulletin
{
  return self->_bulletin;
}

- (void)setBulletin:(id)a3
{
}

- (double)date
{
  return self->_date;
}

- (unsigned)updateType
{
  return self->_updateType;
}

- (void).cxx_destruct
{
}

@end