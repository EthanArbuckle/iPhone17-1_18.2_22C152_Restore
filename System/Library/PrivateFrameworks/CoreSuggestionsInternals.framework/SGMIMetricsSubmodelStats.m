@interface SGMIMetricsSubmodelStats
- (BOOL)hasAgeOfTheSubmodelInDays;
- (BOOL)hasNbExtremelyDiscriminantTokensForIgnorability;
- (BOOL)hasNbExtremelyDiscriminantTokensForSaliency;
- (BOOL)hasNbHighlyDiscriminantTokensForIgnorability;
- (BOOL)hasNbHighlyDiscriminantTokensForSaliency;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)ageOfTheSubmodelInDays;
- (unsigned)nbExtremelyDiscriminantTokensForIgnorability;
- (unsigned)nbExtremelyDiscriminantTokensForSaliency;
- (unsigned)nbHighlyDiscriminantTokensForIgnorability;
- (unsigned)nbHighlyDiscriminantTokensForSaliency;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAgeOfTheSubmodelInDays:(unsigned int)a3;
- (void)setHasAgeOfTheSubmodelInDays:(BOOL)a3;
- (void)setHasNbExtremelyDiscriminantTokensForIgnorability:(BOOL)a3;
- (void)setHasNbExtremelyDiscriminantTokensForSaliency:(BOOL)a3;
- (void)setHasNbHighlyDiscriminantTokensForIgnorability:(BOOL)a3;
- (void)setHasNbHighlyDiscriminantTokensForSaliency:(BOOL)a3;
- (void)setNbExtremelyDiscriminantTokensForIgnorability:(unsigned int)a3;
- (void)setNbExtremelyDiscriminantTokensForSaliency:(unsigned int)a3;
- (void)setNbHighlyDiscriminantTokensForIgnorability:(unsigned int)a3;
- (void)setNbHighlyDiscriminantTokensForSaliency:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGMIMetricsSubmodelStats

- (unsigned)nbExtremelyDiscriminantTokensForIgnorability
{
  return self->_nbExtremelyDiscriminantTokensForIgnorability;
}

- (unsigned)nbExtremelyDiscriminantTokensForSaliency
{
  return self->_nbExtremelyDiscriminantTokensForSaliency;
}

- (unsigned)nbHighlyDiscriminantTokensForIgnorability
{
  return self->_nbHighlyDiscriminantTokensForIgnorability;
}

- (unsigned)nbHighlyDiscriminantTokensForSaliency
{
  return self->_nbHighlyDiscriminantTokensForSaliency;
}

- (unsigned)ageOfTheSubmodelInDays
{
  return self->_ageOfTheSubmodelInDays;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if (v5)
  {
    self->_ageOfTheSubmodelInDays = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_nbHighlyDiscriminantTokensForSaliency = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_nbHighlyDiscriminantTokensForIgnorability = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_nbExtremelyDiscriminantTokensForSaliency = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_6:
    self->_nbExtremelyDiscriminantTokensForIgnorability = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_ageOfTheSubmodelInDays;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_nbHighlyDiscriminantTokensForSaliency;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_nbHighlyDiscriminantTokensForIgnorability;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_nbExtremelyDiscriminantTokensForSaliency;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_nbExtremelyDiscriminantTokensForIgnorability;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_ageOfTheSubmodelInDays != *((_DWORD *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_26:
    BOOL v5 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 0x10) == 0 || self->_nbHighlyDiscriminantTokensForSaliency != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) == 0 || self->_nbHighlyDiscriminantTokensForIgnorability != *((_DWORD *)v4 + 5)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_nbExtremelyDiscriminantTokensForSaliency != *((_DWORD *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_nbExtremelyDiscriminantTokensForIgnorability != *((_DWORD *)v4 + 3)) {
      goto LABEL_26;
    }
    BOOL v5 = 1;
  }
LABEL_27:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_ageOfTheSubmodelInDays;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_nbHighlyDiscriminantTokensForSaliency;
  *((unsigned char *)result + 28) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 5) = self->_nbHighlyDiscriminantTokensForIgnorability;
  *((unsigned char *)result + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_nbExtremelyDiscriminantTokensForSaliency;
  *((unsigned char *)result + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 3) = self->_nbExtremelyDiscriminantTokensForIgnorability;
  *((unsigned char *)result + 28) |= 2u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_ageOfTheSubmodelInDays;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_nbHighlyDiscriminantTokensForSaliency;
  *((unsigned char *)v4 + 28) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[5] = self->_nbHighlyDiscriminantTokensForIgnorability;
  *((unsigned char *)v4 + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v4[4] = self->_nbExtremelyDiscriminantTokensForSaliency;
  *((unsigned char *)v4 + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    v4[3] = self->_nbExtremelyDiscriminantTokensForIgnorability;
    *((unsigned char *)v4 + 28) |= 2u;
  }
LABEL_7:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsSubmodelStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_ageOfTheSubmodelInDays];
    [v3 setObject:v7 forKey:@"ageOfTheSubmodelInDays"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v8 = [NSNumber numberWithUnsignedInt:self->_nbHighlyDiscriminantTokensForSaliency];
  [v3 setObject:v8 forKey:@"nbHighlyDiscriminantTokensForSaliency"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = [NSNumber numberWithUnsignedInt:self->_nbHighlyDiscriminantTokensForIgnorability];
  [v3 setObject:v9 forKey:@"nbHighlyDiscriminantTokensForIgnorability"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = [NSNumber numberWithUnsignedInt:self->_nbExtremelyDiscriminantTokensForSaliency];
  [v3 setObject:v10 forKey:@"nbExtremelyDiscriminantTokensForSaliency"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    id v5 = [NSNumber numberWithUnsignedInt:self->_nbExtremelyDiscriminantTokensForIgnorability];
    [v3 setObject:v5 forKey:@"nbExtremelyDiscriminantTokensForIgnorability"];
  }
LABEL_7:
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGMIMetricsSubmodelStats;
  id v4 = [(SGMIMetricsSubmodelStats *)&v8 description];
  id v5 = [(SGMIMetricsSubmodelStats *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasNbExtremelyDiscriminantTokensForIgnorability
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNbExtremelyDiscriminantTokensForIgnorability:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setNbExtremelyDiscriminantTokensForIgnorability:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_nbExtremelyDiscriminantTokensForIgnorability = a3;
}

- (BOOL)hasNbExtremelyDiscriminantTokensForSaliency
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNbExtremelyDiscriminantTokensForSaliency:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setNbExtremelyDiscriminantTokensForSaliency:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_nbExtremelyDiscriminantTokensForSaliency = a3;
}

- (BOOL)hasNbHighlyDiscriminantTokensForIgnorability
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasNbHighlyDiscriminantTokensForIgnorability:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setNbHighlyDiscriminantTokensForIgnorability:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_nbHighlyDiscriminantTokensForIgnorability = a3;
}

- (BOOL)hasNbHighlyDiscriminantTokensForSaliency
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasNbHighlyDiscriminantTokensForSaliency:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setNbHighlyDiscriminantTokensForSaliency:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_nbHighlyDiscriminantTokensForSaliency = a3;
}

- (BOOL)hasAgeOfTheSubmodelInDays
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAgeOfTheSubmodelInDays:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAgeOfTheSubmodelInDays:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ageOfTheSubmodelInDays = a3;
}

@end