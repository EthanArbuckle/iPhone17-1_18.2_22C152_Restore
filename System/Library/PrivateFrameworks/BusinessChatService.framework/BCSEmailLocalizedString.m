@interface BCSEmailLocalizedString
- (BOOL)hasIsDefault;
- (BOOL)hasLocale;
- (BOOL)hasText;
- (BOOL)isDefault;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)locale;
- (NSString)text;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsDefault:(BOOL)a3;
- (void)setIsDefault:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSEmailLocalizedString

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (void)setIsDefault:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isDefault = a3;
}

- (void)setHasIsDefault:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsDefault
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSEmailLocalizedString;
  v4 = [(BCSEmailLocalizedString *)&v8 description];
  v5 = [(BCSEmailLocalizedString *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKey:@"locale"];
  }
  text = self->_text;
  if (text) {
    [v4 setObject:text forKey:@"text"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithBool:self->_isDefault];
    [v4 setObject:v7 forKey:@"is_default"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BCSEmailLocalizedStringReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_locale)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_text)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_locale)
  {
    objc_msgSend(v4, "setLocale:");
    id v4 = v5;
  }
  if (self->_text)
  {
    objc_msgSend(v5, "setText:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_isDefault;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_locale copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_text copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_isDefault;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](locale, "isEqual:")) {
      goto LABEL_8;
    }
  }
  text = self->_text;
  if ((unint64_t)text | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](text, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_isDefault)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_locale hash];
  NSUInteger v4 = [(NSString *)self->_text hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_isDefault;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[BCSEmailLocalizedString setLocale:](self, "setLocale:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[BCSEmailLocalizedString setText:](self, "setText:");
    NSUInteger v4 = v5;
  }
  if (v4[28])
  {
    self->_isDefault = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end