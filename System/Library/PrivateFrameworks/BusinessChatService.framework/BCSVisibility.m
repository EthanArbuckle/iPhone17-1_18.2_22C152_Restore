@interface BCSVisibility
- (BOOL)hasCountry;
- (BOOL)hasLanguage;
- (BOOL)hasRatio;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)country;
- (NSString)language;
- (double)ratio;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCountry:(id)a3;
- (void)setHasRatio:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setRatio:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSVisibility

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasCountry
{
  return self->_country != 0;
}

- (void)setRatio:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ratio = a3;
}

- (void)setHasRatio:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRatio
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSVisibility;
  v4 = [(BCSVisibility *)&v8 description];
  v5 = [(BCSVisibility *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  language = self->_language;
  if (language) {
    [v3 setObject:language forKey:@"language"];
  }
  country = self->_country;
  if (country) {
    [v4 setObject:country forKey:@"country"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_ratio];
    [v4 setObject:v7 forKey:@"ratio"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BCSVisibilityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_country)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_language)
  {
    objc_msgSend(v4, "setLanguage:");
    id v4 = v5;
  }
  if (self->_country)
  {
    objc_msgSend(v5, "setCountry:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_ratio;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_language copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_country copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_ratio;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](language, "isEqual:")) {
      goto LABEL_10;
    }
  }
  country = self->_country;
  if ((unint64_t)country | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](country, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_ratio == *((double *)v4 + 1))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_language hash];
  NSUInteger v4 = [(NSString *)self->_country hash];
  if (*(unsigned char *)&self->_has)
  {
    double ratio = self->_ratio;
    double v7 = -ratio;
    if (ratio >= 0.0) {
      double v7 = self->_ratio;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (double *)a3;
  unint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[BCSVisibility setLanguage:](self, "setLanguage:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[BCSVisibility setCountry:](self, "setCountry:");
    NSUInteger v4 = v5;
  }
  if ((_BYTE)v4[4])
  {
    self->_double ratio = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (double)ratio
{
  return self->_ratio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_country, 0);
}

@end