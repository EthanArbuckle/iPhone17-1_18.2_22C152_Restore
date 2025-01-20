@interface SGMIMetricsMailAttachmentHistogram
- (BOOL)hasCategory;
- (BOOL)hasCount128KBTo512KB;
- (BOOL)hasCount32KBTo128KB;
- (BOOL)hasCount512KBTo2MB;
- (BOOL)hasCount8KBTo32KB;
- (BOOL)hasCountOver2MB;
- (BOOL)hasCountUpTo8KB;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)categoryAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCategory:(id)a3;
- (int)category;
- (unint64_t)hash;
- (unsigned)count128KBTo512KB;
- (unsigned)count32KBTo128KB;
- (unsigned)count512KBTo2MB;
- (unsigned)count8KBTo32KB;
- (unsigned)countOver2MB;
- (unsigned)countUpTo8KB;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(int)a3;
- (void)setCount128KBTo512KB:(unsigned int)a3;
- (void)setCount32KBTo128KB:(unsigned int)a3;
- (void)setCount512KBTo2MB:(unsigned int)a3;
- (void)setCount8KBTo32KB:(unsigned int)a3;
- (void)setCountOver2MB:(unsigned int)a3;
- (void)setCountUpTo8KB:(unsigned int)a3;
- (void)setHasCategory:(BOOL)a3;
- (void)setHasCount128KBTo512KB:(BOOL)a3;
- (void)setHasCount32KBTo128KB:(BOOL)a3;
- (void)setHasCount512KBTo2MB:(BOOL)a3;
- (void)setHasCount8KBTo32KB:(BOOL)a3;
- (void)setHasCountOver2MB:(BOOL)a3;
- (void)setHasCountUpTo8KB:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGMIMetricsMailAttachmentHistogram

- (unsigned)countOver2MB
{
  return self->_countOver2MB;
}

- (unsigned)count512KBTo2MB
{
  return self->_count512KBTo2MB;
}

- (unsigned)count128KBTo512KB
{
  return self->_count128KBTo512KB;
}

- (unsigned)count32KBTo128KB
{
  return self->_count32KBTo128KB;
}

- (unsigned)count8KBTo32KB
{
  return self->_count8KBTo32KB;
}

- (unsigned)countUpTo8KB
{
  return self->_countUpTo8KB;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_category = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_countUpTo8KB = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_count8KBTo32KB = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_count32KBTo128KB = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_count128KBTo512KB = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_count512KBTo2MB = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 36) & 0x20) != 0)
  {
LABEL_8:
    self->_countOver2MB = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_9:
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_category;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_countUpTo8KB;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_count8KBTo32KB;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_count32KBTo128KB;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_count128KBTo512KB;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_count512KBTo2MB;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_countOver2MB;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_category != *((_DWORD *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_36:
    BOOL v5 = 0;
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x40) == 0 || self->_countUpTo8KB != *((_DWORD *)v4 + 8)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x40) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0 || self->_count8KBTo32KB != *((_DWORD *)v4 + 6)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_count32KBTo128KB != *((_DWORD *)v4 + 4)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_count128KBTo512KB != *((_DWORD *)v4 + 3)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_count512KBTo2MB != *((_DWORD *)v4 + 5)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_36;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x20) == 0 || self->_countOver2MB != *((_DWORD *)v4 + 7)) {
      goto LABEL_36;
    }
    BOOL v5 = 1;
  }
LABEL_37:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_category;
    *((unsigned char *)result + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_countUpTo8KB;
  *((unsigned char *)result + 36) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = self->_count8KBTo32KB;
  *((unsigned char *)result + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 4) = self->_count32KBTo128KB;
  *((unsigned char *)result + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 3) = self->_count128KBTo512KB;
  *((unsigned char *)result + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 5) = self->_count512KBTo2MB;
  *((unsigned char *)result + 36) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 7) = self->_countOver2MB;
  *((unsigned char *)result + 36) |= 0x20u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_category;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v4[8] = self->_countUpTo8KB;
  *((unsigned char *)v4 + 36) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[6] = self->_count8KBTo32KB;
  *((unsigned char *)v4 + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[4] = self->_count32KBTo128KB;
  *((unsigned char *)v4 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[3] = self->_count128KBTo512KB;
  *((unsigned char *)v4 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v4[5] = self->_count512KBTo2MB;
  *((unsigned char *)v4 + 36) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    v4[7] = self->_countOver2MB;
    *((unsigned char *)v4 + 36) |= 0x20u;
  }
LABEL_9:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsMailAttachmentHistogramReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t category = self->_category;
    if (category >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_category);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = off_1E65B90E0[category];
    }
    [v3 setObject:v6 forKey:@"category"];

    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_countUpTo8KB];
    [v3 setObject:v9 forKey:@"countUpTo8KB"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_8:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_8;
  }
  v10 = [NSNumber numberWithUnsignedInt:self->_count8KBTo32KB];
  [v3 setObject:v10 forKey:@"count8KBTo32KB"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = [NSNumber numberWithUnsignedInt:self->_count32KBTo128KB];
  [v3 setObject:v11 forKey:@"count32KBTo128KB"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = [NSNumber numberWithUnsignedInt:self->_count128KBTo512KB];
  [v3 setObject:v12 forKey:@"count128KBTo512KB"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_20:
  v13 = [NSNumber numberWithUnsignedInt:self->_count512KBTo2MB];
  [v3 setObject:v13 forKey:@"count512KBTo2MB"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_12:
    uint64_t v7 = [NSNumber numberWithUnsignedInt:self->_countOver2MB];
    [v3 setObject:v7 forKey:@"countOver2MB"];
  }
LABEL_13:
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGMIMetricsMailAttachmentHistogram;
  id v4 = [(SGMIMetricsMailAttachmentHistogram *)&v8 description];
  id v5 = [(SGMIMetricsMailAttachmentHistogram *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCountOver2MB
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasCountOver2MB:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setCountOver2MB:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_countOver2MB = a3;
}

- (BOOL)hasCount512KBTo2MB
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasCount512KBTo2MB:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setCount512KBTo2MB:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_count512KBTo2MB = a3;
}

- (BOOL)hasCount128KBTo512KB
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasCount128KBTo512KB:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setCount128KBTo512KB:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_count128KBTo512KB = a3;
}

- (BOOL)hasCount32KBTo128KB
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasCount32KBTo128KB:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setCount32KBTo128KB:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_count32KBTo128KB = a3;
}

- (BOOL)hasCount8KBTo32KB
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasCount8KBTo32KB:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setCount8KBTo32KB:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_count8KBTo32KB = a3;
}

- (BOOL)hasCountUpTo8KB
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasCountUpTo8KB:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setCountUpTo8KB:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_countUpTo8KB = a3;
}

- (int)StringAsCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Application"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Media"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Others"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)categoryAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B90E0[a3];
  }
  return v3;
}

- (BOOL)hasCategory
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCategory:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t category = a3;
}

- (int)category
{
  if (*(unsigned char *)&self->_has) {
    return self->_category;
  }
  else {
    return 0;
  }
}

@end