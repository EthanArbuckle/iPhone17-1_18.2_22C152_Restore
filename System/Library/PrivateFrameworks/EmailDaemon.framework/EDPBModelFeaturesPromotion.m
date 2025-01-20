@interface EDPBModelFeaturesPromotion
- (BOOL)hasHeaderKeyFilteredCount;
- (BOOL)hasLanguage;
- (BOOL)hasToCount;
- (BOOL)hasUnknownFeatureCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)language;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)headerKeyFilteredCount;
- (unsigned)toCount;
- (unsigned)unknownFeatureCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHeaderKeyFilteredCount:(BOOL)a3;
- (void)setHasToCount:(BOOL)a3;
- (void)setHasUnknownFeatureCount:(BOOL)a3;
- (void)setHeaderKeyFilteredCount:(unsigned int)a3;
- (void)setLanguage:(id)a3;
- (void)setToCount:(unsigned int)a3;
- (void)setUnknownFeatureCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation EDPBModelFeaturesPromotion

- (void)setUnknownFeatureCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unknownFeatureCount = a3;
}

- (void)setHasUnknownFeatureCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUnknownFeatureCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setToCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_toCount = a3;
}

- (void)setHasToCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasToCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)setHeaderKeyFilteredCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_headerKeyFilteredCount = a3;
}

- (void)setHasHeaderKeyFilteredCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHeaderKeyFilteredCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EDPBModelFeaturesPromotion;
  v4 = [(EDPBModelFeaturesPromotion *)&v8 description];
  v5 = [(EDPBModelFeaturesPromotion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = [NSNumber numberWithUnsignedInt:self->_unknownFeatureCount];
    [v3 setObject:v5 forKey:@"unknown_feature_count"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_toCount];
    [v3 setObject:v6 forKey:@"to_count"];
  }
  language = self->_language;
  if (language) {
    [v3 setObject:language forKey:@"language"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_headerKeyFilteredCount];
    [v3 setObject:v8 forKey:@"header_key_filtered_count"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBModelFeaturesPromotionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_language) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[7] = self->_unknownFeatureCount;
    *((unsigned char *)v4 + 32) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[6] = self->_toCount;
    *((unsigned char *)v4 + 32) |= 2u;
  }
  v6 = v4;
  if (self->_language) {
    objc_msgSend(v4, "setLanguage:");
  }
  if (*(unsigned char *)&self->_has)
  {
    v6[2] = self->_headerKeyFilteredCount;
    *((unsigned char *)v6 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_unknownFeatureCount;
    *(unsigned char *)(v5 + 32) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_toCount;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_language copyWithZone:a3];
  v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 8) = self->_headerKeyFilteredCount;
    *(unsigned char *)(v6 + 32) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_unknownFeatureCount != *((_DWORD *)v4 + 7)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_toCount != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](language, "isEqual:"))
    {
LABEL_19:
      BOOL v7 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_headerKeyFilteredCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_19;
    }
    BOOL v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_unknownFeatureCount;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_toCount;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_language hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_headerKeyFilteredCount;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_unknownFeatureCount = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if ((v5 & 2) != 0)
  {
    self->_toCount = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v6 = v4;
  if (*((void *)v4 + 2)) {
    -[EDPBModelFeaturesPromotion setLanguage:](self, "setLanguage:");
  }
  if (v6[8])
  {
    self->_headerKeyFilteredCount = v6[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)unknownFeatureCount
{
  return self->_unknownFeatureCount;
}

- (unsigned)toCount
{
  return self->_toCount;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (unsigned)headerKeyFilteredCount
{
  return self->_headerKeyFilteredCount;
}

- (void).cxx_destruct
{
}

@end