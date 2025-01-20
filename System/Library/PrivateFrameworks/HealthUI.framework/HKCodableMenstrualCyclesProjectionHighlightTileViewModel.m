@interface HKCodableMenstrualCyclesProjectionHighlightTileViewModel
- (BOOL)hasLatestSupportedVersion;
- (BOOL)hasMinimumSupportedVersion;
- (BOOL)hasProjection;
- (BOOL)hasProjectionKind;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableMenstrualCyclesProjection)projection;
- (HKCodableMenstrualCyclesProjectionKind)projectionKind;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)latestSupportedVersion;
- (int64_t)minimumSupportedVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLatestSupportedVersion:(BOOL)a3;
- (void)setHasMinimumSupportedVersion:(BOOL)a3;
- (void)setLatestSupportedVersion:(int64_t)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)setProjection:(id)a3;
- (void)setProjectionKind:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableMenstrualCyclesProjectionHighlightTileViewModel

- (HKCodableMenstrualCyclesProjection)projection
{
  return self->_projection;
}

- (void)setProjectionKind:(id)a3
{
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_minimumSupportedVersion = a3;
}

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_latestSupportedVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_projectionKind, 0);
  objc_storeStrong((id *)&self->_projection, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_projection)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_projectionKind)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
}

- (BOOL)hasProjection
{
  return self->_projection != 0;
}

- (BOOL)hasProjectionKind
{
  return self->_projectionKind != 0;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatestSupportedVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableMenstrualCyclesProjectionHighlightTileViewModel;
  id v4 = [(HKCodableMenstrualCyclesProjectionHighlightTileViewModel *)&v8 description];
  v5 = [(HKCodableMenstrualCyclesProjectionHighlightTileViewModel *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  projection = self->_projection;
  if (projection)
  {
    v5 = [(HKCodableMenstrualCyclesProjection *)projection dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"projection"];
  }
  projectionKind = self->_projectionKind;
  if (projectionKind)
  {
    v7 = [(HKCodableMenstrualCyclesProjectionKind *)projectionKind dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"projectionKind"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithLongLong:self->_latestSupportedVersion];
    [v3 setObject:v9 forKey:@"latestSupportedVersion"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = [NSNumber numberWithLongLong:self->_minimumSupportedVersion];
    [v3 setObject:v10 forKey:@"minimumSupportedVersion"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableMenstrualCyclesProjectionHighlightTileViewModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_projection)
  {
    objc_msgSend(v4, "setProjection:");
    id v4 = v6;
  }
  if (self->_projectionKind)
  {
    objc_msgSend(v6, "setProjectionKind:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_latestSupportedVersion;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_minimumSupportedVersion;
    *((unsigned char *)v4 + 40) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableMenstrualCyclesProjection *)self->_projection copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  id v8 = [(HKCodableMenstrualCyclesProjectionKind *)self->_projectionKind copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_latestSupportedVersion;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_minimumSupportedVersion;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  projection = self->_projection;
  if ((unint64_t)projection | *((void *)v4 + 3))
  {
    if (!-[HKCodableMenstrualCyclesProjection isEqual:](projection, "isEqual:")) {
      goto LABEL_15;
    }
  }
  projectionKind = self->_projectionKind;
  if ((unint64_t)projectionKind | *((void *)v4 + 4))
  {
    if (!-[HKCodableMenstrualCyclesProjectionKind isEqual:](projectionKind, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_latestSupportedVersion != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_minimumSupportedVersion != *((void *)v4 + 2)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableMenstrualCyclesProjection *)self->_projection hash];
  unint64_t v4 = [(HKCodableMenstrualCyclesProjectionKind *)self->_projectionKind hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_latestSupportedVersion;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_minimumSupportedVersion;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  projection = self->_projection;
  uint64_t v6 = v4[3];
  v10 = v4;
  if (projection)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableMenstrualCyclesProjection mergeFrom:](projection, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableMenstrualCyclesProjectionHighlightTileViewModel setProjection:](self, "setProjection:");
  }
  unint64_t v4 = v10;
LABEL_7:
  projectionKind = self->_projectionKind;
  uint64_t v8 = v4[4];
  if (projectionKind)
  {
    if (!v8) {
      goto LABEL_13;
    }
    projectionKind = (HKCodableMenstrualCyclesProjectionKind *)-[HKCodableMenstrualCyclesProjectionKind mergeFrom:](projectionKind, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    projectionKind = (HKCodableMenstrualCyclesProjectionKind *)-[HKCodableMenstrualCyclesProjectionHighlightTileViewModel setProjectionKind:](self, "setProjectionKind:");
  }
  unint64_t v4 = v10;
LABEL_13:
  char v9 = *((unsigned char *)v4 + 40);
  if (v9)
  {
    self->_latestSupportedVersion = v4[1];
    *(unsigned char *)&self->_has |= 1u;
    char v9 = *((unsigned char *)v4 + 40);
  }
  if ((v9 & 2) != 0)
  {
    self->_minimumSupportedVersion = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x1F41817F8](projectionKind, v4);
}

- (void)setProjection:(id)a3
{
}

- (HKCodableMenstrualCyclesProjectionKind)projectionKind
{
  return self->_projectionKind;
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

@end