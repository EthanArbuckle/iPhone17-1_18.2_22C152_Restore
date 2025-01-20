@interface CPLSuggestionAssetFlag
- (BOOL)hasIsKeyAsset;
- (BOOL)hasIsRepresentative;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKeyAsset;
- (BOOL)isRepresentative;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsKeyAsset:(BOOL)a3;
- (void)setHasIsRepresentative:(BOOL)a3;
- (void)setIsKeyAsset:(BOOL)a3;
- (void)setIsRepresentative:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLSuggestionAssetFlag

- (BOOL)isKeyAsset
{
  return self->_isKeyAsset;
}

- (BOOL)isRepresentative
{
  return self->_isRepresentative;
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  BOOL v5 = v4[12];
  if ((v5 & 2) != 0)
  {
    self->_isRepresentative = v4[9];
    *(unsigned char *)&self->_has |= 2u;
    BOOL v5 = v4[12];
  }
  if (v5)
  {
    self->_isKeyAsset = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_isRepresentative;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isKeyAsset;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) == 0) {
      goto LABEL_12;
    }
    if (self->_isRepresentative)
    {
      if (!v4[9]) {
        goto LABEL_12;
      }
    }
    else if (v4[9])
    {
      goto LABEL_12;
    }
  }
  else if ((v4[12] & 2) != 0)
  {
    goto LABEL_12;
  }
  BOOL v5 = (v4[12] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (v4[12])
    {
      if (self->_isKeyAsset)
      {
        if (!v4[8]) {
          goto LABEL_12;
        }
      }
      else if (v4[8])
      {
        goto LABEL_12;
      }
      BOOL v5 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v5 = 0;
  }
LABEL_13:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 9) = self->_isRepresentative;
    *((unsigned char *)result + 12) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((unsigned char *)result + 8) = self->_isKeyAsset;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[9] = self->_isRepresentative;
    v4[12] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[8] = self->_isKeyAsset;
    v4[12] |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CPLSuggestionAssetFlagReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    BOOL v5 = [NSNumber numberWithBool:self->_isRepresentative];
    [v3 setObject:v5 forKey:@"isRepresentative"];

    char has = (char)self->_has;
  }
  if (has)
  {
    id v6 = [NSNumber numberWithBool:self->_isKeyAsset];
    [v3 setObject:v6 forKey:@"isKeyAsset"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPLSuggestionAssetFlag;
  id v4 = [(CPLSuggestionAssetFlag *)&v8 description];
  BOOL v5 = [(CPLSuggestionAssetFlag *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIsKeyAsset
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasIsKeyAsset:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setIsKeyAsset:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isKeyAsset = a3;
}

- (BOOL)hasIsRepresentative
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasIsRepresentative:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setIsRepresentative:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isRepresentative = a3;
}

@end