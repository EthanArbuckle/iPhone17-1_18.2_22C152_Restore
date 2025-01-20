@interface ComponentCarrierInfo
- (BOOL)hasDlBandwidth;
- (BOOL)hasDlEarfcn;
- (BOOL)hasDlRfBand;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dlBandwidthAsString:(int)a3;
- (int)StringAsDlBandwidth:(id)a3;
- (int)dlBandwidth;
- (unint64_t)hash;
- (unsigned)dlEarfcn;
- (unsigned)dlRfBand;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDlBandwidth:(int)a3;
- (void)setDlEarfcn:(unsigned int)a3;
- (void)setDlRfBand:(unsigned int)a3;
- (void)setHasDlBandwidth:(BOOL)a3;
- (void)setHasDlEarfcn:(BOOL)a3;
- (void)setHasDlRfBand:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ComponentCarrierInfo

- (void)setDlEarfcn:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dlEarfcn = a3;
}

- (void)setHasDlEarfcn:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDlEarfcn
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)dlBandwidth
{
  if (*(unsigned char *)&self->_has) {
    return self->_dlBandwidth;
  }
  else {
    return 0;
  }
}

- (void)setDlBandwidth:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dlBandwidth = a3;
}

- (void)setHasDlBandwidth:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDlBandwidth
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)dlBandwidthAsString:(int)a3
{
  if (a3 >= 6)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100287698 + a3);
  }

  return v3;
}

- (int)StringAsDlBandwidth:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LTE_BW_1M4"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LTE_BW_3M"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LTE_BW_5M"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LTE_BW_10M"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LTE_BW_15M"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LTE_BW_20M"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setDlRfBand:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_dlRfBand = a3;
}

- (void)setHasDlRfBand:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDlRfBand
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ComponentCarrierInfo;
  char v3 = [(ComponentCarrierInfo *)&v7 description];
  int v4 = [(ComponentCarrierInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_dlEarfcn];
    [v3 setObject:v7 forKey:@"dl_earfcn"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  uint64_t dlBandwidth = self->_dlBandwidth;
  if (dlBandwidth >= 6)
  {
    v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_dlBandwidth];
  }
  else
  {
    v9 = *(&off_100287698 + dlBandwidth);
  }
  [v3 setObject:v9 forKey:@"dl_bandwidth"];

  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  v5 = +[NSNumber numberWithUnsignedInt:self->_dlRfBand];
  [v3 setObject:v5 forKey:@"dl_rf_band"];

LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100087C4C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_dlEarfcn;
    *((unsigned char *)v4 + 20) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_dlBandwidth;
  *((unsigned char *)v4 + 20) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[4] = self->_dlRfBand;
    *((unsigned char *)v4 + 20) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_dlEarfcn;
    *((unsigned char *)result + 20) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_dlBandwidth;
  *((unsigned char *)result + 20) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 4) = self->_dlRfBand;
  *((unsigned char *)result + 20) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_dlEarfcn != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_dlBandwidth != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_dlRfBand != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_dlEarfcn;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_dlBandwidth;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_dlRfBand;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 2) != 0)
  {
    self->_dlEarfcn = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t dlBandwidth = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
LABEL_4:
    self->_dlRfBand = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
}

- (unsigned)dlEarfcn
{
  return self->_dlEarfcn;
}

- (unsigned)dlRfBand
{
  return self->_dlRfBand;
}

@end