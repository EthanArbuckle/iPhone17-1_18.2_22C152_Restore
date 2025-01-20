@interface SECSFAVersion
- (BOOL)hasBuild;
- (BOOL)hasMajor;
- (BOOL)hasMinor;
- (BOOL)hasProductName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)productNameAsString:(int)a3;
- (int)StringAsProductName:(id)a3;
- (int)productName;
- (int64_t)build;
- (int64_t)major;
- (int64_t)minor;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuild:(int64_t)a3;
- (void)setHasBuild:(BOOL)a3;
- (void)setHasMajor:(BOOL)a3;
- (void)setHasMinor:(BOOL)a3;
- (void)setHasProductName:(BOOL)a3;
- (void)setMajor:(int64_t)a3;
- (void)setMinor:(int64_t)a3;
- (void)setProductName:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAVersion

- (int64_t)build
{
  return self->_build;
}

- (int64_t)minor
{
  return self->_minor;
}

- (int64_t)major
{
  return self->_major;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 8) != 0)
  {
    self->_productName = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_major = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_minor = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 36))
  {
LABEL_5:
    self->_build = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761 * self->_productName;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_major;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_minor;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_build;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_productName != *((_DWORD *)v4 + 8)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_major != *((void *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_minor != *((void *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_build != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 8) = self->_productName;
    *((unsigned char *)result + 36) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_major;
  *((unsigned char *)result + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((void *)result + 3) = self->_minor;
  *((unsigned char *)result + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_5:
  *((void *)result + 1) = self->_build;
  *((unsigned char *)result + 36) |= 1u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[8] = self->_productName;
    *((unsigned char *)v4 + 36) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 2) = self->_major;
  *((unsigned char *)v4 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *((void *)v4 + 3) = self->_minor;
  *((unsigned char *)v4 + 36) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    *((void *)v4 + 1) = self->_build;
    *((unsigned char *)v4 + 36) |= 1u;
  }
LABEL_6:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt64Field();
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    PBDataWriterWriteInt64Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAVersionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    unsigned int v5 = self->_productName - 1;
    if (v5 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_productName);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E5475EB0[v5];
    }
    [v3 setObject:v6 forKey:@"productName"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithLongLong:self->_major];
    [v3 setObject:v9 forKey:@"major"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_8:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_8;
  }
  v10 = [NSNumber numberWithLongLong:self->_minor];
  [v3 setObject:v10 forKey:@"minor"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_9:
    v7 = [NSNumber numberWithLongLong:self->_build];
    [v3 setObject:v7 forKey:@"build"];
  }
LABEL_10:

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SECSFAVersion;
  id v4 = [(SECSFAVersion *)&v8 description];
  unsigned int v5 = [(SECSFAVersion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBuild
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasBuild:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setBuild:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_build = a3;
}

- (BOOL)hasMinor
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasMinor:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setMinor:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_minor = a3;
}

- (BOOL)hasMajor
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasMajor:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setMajor:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_major = a3;
}

- (int)StringAsProductName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"macOS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"iphoneOS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"xrOS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"watchOS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"tvOS"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)productNameAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5475EB0[a3 - 1];
  }

  return v3;
}

- (BOOL)hasProductName
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasProductName:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setProductName:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_productName = a3;
}

- (int)productName
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_productName;
  }
  else {
    return 1;
  }
}

@end