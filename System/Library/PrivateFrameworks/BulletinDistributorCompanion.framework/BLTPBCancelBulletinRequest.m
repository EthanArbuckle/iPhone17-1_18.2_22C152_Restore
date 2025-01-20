@interface BLTPBCancelBulletinRequest
- (BOOL)hasDate;
- (BOOL)hasFeed;
- (BOOL)hasPublisherMatchID;
- (BOOL)hasUniversalSectionID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)publisherMatchID;
- (NSString)universalSectionID;
- (double)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)feed;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDate:(double)a3;
- (void)setFeed:(unsigned int)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setHasFeed:(BOOL)a3;
- (void)setPublisherMatchID:(id)a3;
- (void)setUniversalSectionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBCancelBulletinRequest

- (BOOL)hasUniversalSectionID
{
  return self->_universalSectionID != 0;
}

- (BOOL)hasPublisherMatchID
{
  return self->_publisherMatchID != 0;
}

- (void)setFeed:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_feed = a3;
}

- (void)setHasFeed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFeed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBCancelBulletinRequest;
  v4 = [(BLTPBCancelBulletinRequest *)&v8 description];
  v5 = [(BLTPBCancelBulletinRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  universalSectionID = self->_universalSectionID;
  if (universalSectionID) {
    [v3 setObject:universalSectionID forKey:@"universalSectionID"];
  }
  publisherMatchID = self->_publisherMatchID;
  if (publisherMatchID) {
    [v4 setObject:publisherMatchID forKey:@"publisherMatchID"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_feed];
    [v4 setObject:v8 forKey:@"feed"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_date];
    [v4 setObject:v9 forKey:@"date"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBCancelBulletinRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_universalSectionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_publisherMatchID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_universalSectionID)
  {
    objc_msgSend(v4, "setUniversalSectionID:");
    id v4 = v6;
  }
  if (self->_publisherMatchID)
  {
    objc_msgSend(v6, "setPublisherMatchID:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_feed;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_date;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_universalSectionID copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_publisherMatchID copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_feed;
    *(unsigned char *)(v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_date;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  universalSectionID = self->_universalSectionID;
  if ((unint64_t)universalSectionID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](universalSectionID, "isEqual:")) {
      goto LABEL_15;
    }
  }
  publisherMatchID = self->_publisherMatchID;
  if ((unint64_t)publisherMatchID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](publisherMatchID, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_feed != *((_DWORD *)v4 + 4)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_universalSectionID hash];
  NSUInteger v4 = [(NSString *)self->_publisherMatchID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_feed;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v10;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double date = self->_date;
  double v7 = -date;
  if (date >= 0.0) {
    double v7 = self->_date;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[BLTPBCancelBulletinRequest setUniversalSectionID:](self, "setUniversalSectionID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[BLTPBCancelBulletinRequest setPublisherMatchID:](self, "setPublisherMatchID:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_feed = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if (v5)
  {
    self->_double date = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)universalSectionID
{
  return self->_universalSectionID;
}

- (void)setUniversalSectionID:(id)a3
{
}

- (NSString)publisherMatchID
{
  return self->_publisherMatchID;
}

- (void)setPublisherMatchID:(id)a3
{
}

- (unsigned)feed
{
  return self->_feed;
}

- (double)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalSectionID, 0);
  objc_storeStrong((id *)&self->_publisherMatchID, 0);
}

@end