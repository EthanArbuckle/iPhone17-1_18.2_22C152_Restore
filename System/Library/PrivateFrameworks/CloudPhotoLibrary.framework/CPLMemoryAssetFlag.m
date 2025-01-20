@interface CPLMemoryAssetFlag
- (BOOL)hasIsCurated;
- (BOOL)hasIsCustomUserAsset;
- (BOOL)hasIsExtendedCurated;
- (BOOL)hasIsKeyAsset;
- (BOOL)hasIsMovieCurated;
- (BOOL)hasIsRepresentative;
- (BOOL)hasIsUserCurated;
- (BOOL)isCurated;
- (BOOL)isCustomUserAsset;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtendedCurated;
- (BOOL)isKeyAsset;
- (BOOL)isMovieCurated;
- (BOOL)isRepresentative;
- (BOOL)isUserCurated;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsCurated:(BOOL)a3;
- (void)setHasIsCustomUserAsset:(BOOL)a3;
- (void)setHasIsExtendedCurated:(BOOL)a3;
- (void)setHasIsKeyAsset:(BOOL)a3;
- (void)setHasIsMovieCurated:(BOOL)a3;
- (void)setHasIsRepresentative:(BOOL)a3;
- (void)setHasIsUserCurated:(BOOL)a3;
- (void)setIsCurated:(BOOL)a3;
- (void)setIsCustomUserAsset:(BOOL)a3;
- (void)setIsExtendedCurated:(BOOL)a3;
- (void)setIsKeyAsset:(BOOL)a3;
- (void)setIsMovieCurated:(BOOL)a3;
- (void)setIsRepresentative:(BOOL)a3;
- (void)setIsUserCurated:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLMemoryAssetFlag

- (BOOL)isCustomUserAsset
{
  return self->_isCustomUserAsset;
}

- (BOOL)isUserCurated
{
  return self->_isUserCurated;
}

- (BOOL)isExtendedCurated
{
  return self->_isExtendedCurated;
}

- (BOOL)isKeyAsset
{
  return self->_isKeyAsset;
}

- (BOOL)isMovieCurated
{
  return self->_isMovieCurated;
}

- (BOOL)isCurated
{
  return self->_isCurated;
}

- (BOOL)isRepresentative
{
  return self->_isRepresentative;
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  BOOL v5 = v4[16];
  if ((v5 & 0x20) != 0)
  {
    self->_isRepresentative = v4[13];
    *(unsigned char *)&self->_has |= 0x20u;
    BOOL v5 = v4[16];
    if (!v5)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if (!v4[16])
  {
    goto LABEL_3;
  }
  self->_isCurated = v4[8];
  *(unsigned char *)&self->_has |= 1u;
  BOOL v5 = v4[16];
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_isMovieCurated = v4[12];
  *(unsigned char *)&self->_has |= 0x10u;
  BOOL v5 = v4[16];
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_isKeyAsset = v4[11];
  *(unsigned char *)&self->_has |= 8u;
  BOOL v5 = v4[16];
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_isExtendedCurated = v4[10];
  *(unsigned char *)&self->_has |= 4u;
  BOOL v5 = v4[16];
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_isUserCurated = v4[14];
  *(unsigned char *)&self->_has |= 0x40u;
  if ((v4[16] & 2) != 0)
  {
LABEL_8:
    self->_isCustomUserAsset = v4[9];
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_9:
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v2 = 2654435761 * self->_isRepresentative;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_isCurated;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_isMovieCurated;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_isKeyAsset;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_isExtendedCurated;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_isUserCurated;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_isCustomUserAsset;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[16] & 0x20) == 0) {
      goto LABEL_52;
    }
    if (self->_isRepresentative)
    {
      if (!v4[13]) {
        goto LABEL_52;
      }
    }
    else if (v4[13])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[16] & 1) == 0) {
      goto LABEL_52;
    }
    if (self->_isCurated)
    {
      if (!v4[8]) {
        goto LABEL_52;
      }
    }
    else if (v4[8])
    {
      goto LABEL_52;
    }
  }
  else if (v4[16])
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[16] & 0x10) == 0) {
      goto LABEL_52;
    }
    if (self->_isMovieCurated)
    {
      if (!v4[12]) {
        goto LABEL_52;
      }
    }
    else if (v4[12])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[16] & 8) == 0) {
      goto LABEL_52;
    }
    if (self->_isKeyAsset)
    {
      if (!v4[11]) {
        goto LABEL_52;
      }
    }
    else if (v4[11])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[16] & 4) == 0) {
      goto LABEL_52;
    }
    if (self->_isExtendedCurated)
    {
      if (!v4[10]) {
        goto LABEL_52;
      }
    }
    else if (v4[10])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[16] & 0x40) == 0) {
      goto LABEL_52;
    }
    if (self->_isUserCurated)
    {
      if (!v4[14]) {
        goto LABEL_52;
      }
    }
    else if (v4[14])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 0x40) != 0)
  {
    goto LABEL_52;
  }
  BOOL v5 = (v4[16] & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[16] & 2) != 0)
    {
      if (self->_isCustomUserAsset)
      {
        if (!v4[9]) {
          goto LABEL_52;
        }
      }
      else if (v4[9])
      {
        goto LABEL_52;
      }
      BOOL v5 = 1;
      goto LABEL_53;
    }
LABEL_52:
    BOOL v5 = 0;
  }
LABEL_53:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)result + 13) = self->_isRepresentative;
    *((unsigned char *)result + 16) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 8) = self->_isCurated;
  *((unsigned char *)result + 16) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)result + 12) = self->_isMovieCurated;
  *((unsigned char *)result + 16) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)result + 11) = self->_isKeyAsset;
  *((unsigned char *)result + 16) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)result + 10) = self->_isExtendedCurated;
  *((unsigned char *)result + 16) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((unsigned char *)result + 14) = self->_isUserCurated;
  *((unsigned char *)result + 16) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_8:
  *((unsigned char *)result + 9) = self->_isCustomUserAsset;
  *((unsigned char *)result + 16) |= 2u;
  return result;
}

- (void)copyTo:(id)a3
{
  uint64_t v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[13] = self->_isRepresentative;
    v4[16] |= 0x20u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[8] = self->_isCurated;
  v4[16] |= 1u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[12] = self->_isMovieCurated;
  v4[16] |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[11] = self->_isKeyAsset;
  v4[16] |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[10] = self->_isExtendedCurated;
  v4[16] |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v4[14] = self->_isUserCurated;
  v4[16] |= 0x40u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    v4[9] = self->_isCustomUserAsset;
    v4[16] |= 2u;
  }
LABEL_9:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return CPLMemoryAssetFlagReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    uint64_t v7 = [NSNumber numberWithBool:self->_isRepresentative];
    [v3 setObject:v7 forKey:@"isRepresentative"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v8 = [NSNumber numberWithBool:self->_isCurated];
  [v3 setObject:v8 forKey:@"isCurated"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v9 = [NSNumber numberWithBool:self->_isMovieCurated];
  [v3 setObject:v9 forKey:@"isMovieCurated"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v10 = [NSNumber numberWithBool:self->_isKeyAsset];
  [v3 setObject:v10 forKey:@"isKeyAsset"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v11 = [NSNumber numberWithBool:self->_isExtendedCurated];
  [v3 setObject:v11 forKey:@"isExtendedCurated"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v12 = [NSNumber numberWithBool:self->_isUserCurated];
  [v3 setObject:v12 forKey:@"isUserCurated"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    id v5 = [NSNumber numberWithBool:self->_isCustomUserAsset];
    [v3 setObject:v5 forKey:@"isCustomUserAsset"];
  }
LABEL_9:
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPLMemoryAssetFlag;
  uint64_t v4 = [(CPLMemoryAssetFlag *)&v8 description];
  id v5 = [(CPLMemoryAssetFlag *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIsCustomUserAsset
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasIsCustomUserAsset:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setIsCustomUserAsset:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isCustomUserAsset = a3;
}

- (BOOL)hasIsUserCurated
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasIsUserCurated:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setIsUserCurated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isUserCurated = a3;
}

- (BOOL)hasIsExtendedCurated
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasIsExtendedCurated:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setIsExtendedCurated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isExtendedCurated = a3;
}

- (BOOL)hasIsKeyAsset
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasIsKeyAsset:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setIsKeyAsset:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isKeyAsset = a3;
}

- (BOOL)hasIsMovieCurated
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasIsMovieCurated:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setIsMovieCurated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isMovieCurated = a3;
}

- (BOOL)hasIsCurated
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasIsCurated:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setIsCurated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isCurated = a3;
}

- (BOOL)hasIsRepresentative
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasIsRepresentative:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setIsRepresentative:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isRepresentative = a3;
}

@end