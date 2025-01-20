@interface BMPBPOICategoryEvent
- (BOOL)hasPoiCategory;
- (BOOL)hasRank;
- (BOOL)hasTimeIntervalSince1970;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)poiCategory;
- (double)timeIntervalSince1970;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)rank;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRank:(BOOL)a3;
- (void)setHasTimeIntervalSince1970:(BOOL)a3;
- (void)setPoiCategory:(id)a3;
- (void)setRank:(unsigned int)a3;
- (void)setTimeIntervalSince1970:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBPOICategoryEvent

- (BOOL)hasPoiCategory
{
  return self->_poiCategory != 0;
}

- (void)setRank:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rank = a3;
}

- (void)setHasRank:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRank
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimeIntervalSince1970:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeIntervalSince1970 = a3;
}

- (void)setHasTimeIntervalSince1970:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeIntervalSince1970
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBPOICategoryEvent;
  v4 = [(BMPBPOICategoryEvent *)&v8 description];
  v5 = [(BMPBPOICategoryEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  poiCategory = self->_poiCategory;
  if (poiCategory) {
    [v3 setObject:poiCategory forKey:@"poiCategory"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_rank];
    [v4 setObject:v7 forKey:@"rank"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_timeIntervalSince1970];
    [v4 setObject:v8 forKey:@"timeIntervalSince1970"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBPOICategoryEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_poiCategory)
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
  if (self->_poiCategory)
  {
    id v6 = v4;
    objc_msgSend(v4, "setPoiCategory:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_rank;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timeIntervalSince1970;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_poiCategory copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_rank;
    *(unsigned char *)(v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_timeIntervalSince1970;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  poiCategory = self->_poiCategory;
  if ((unint64_t)poiCategory | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](poiCategory, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_rank != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_timeIntervalSince1970 != *((double *)v4 + 1)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_poiCategory hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_rank;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double timeIntervalSince1970 = self->_timeIntervalSince1970;
  double v6 = -timeIntervalSince1970;
  if (timeIntervalSince1970 >= 0.0) {
    double v6 = self->_timeIntervalSince1970;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[BMPBPOICategoryEvent setPoiCategory:](self, "setPoiCategory:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_rank = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if (v5)
  {
    self->_double timeIntervalSince1970 = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (void)setPoiCategory:(id)a3
{
}

- (unsigned)rank
{
  return self->_rank;
}

- (double)timeIntervalSince1970
{
  return self->_timeIntervalSince1970;
}

- (void).cxx_destruct
{
}

@end