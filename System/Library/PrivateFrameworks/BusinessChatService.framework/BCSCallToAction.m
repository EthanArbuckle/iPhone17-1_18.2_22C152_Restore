@interface BCSCallToAction
- (BOOL)hasBody;
- (BOOL)hasIsDefault;
- (BOOL)hasLanguage;
- (BOOL)hasSubtitle;
- (BOOL)hasTitle;
- (BOOL)isDefault;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)body;
- (NSString)language;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBody:(id)a3;
- (void)setHasIsDefault:(BOOL)a3;
- (void)setIsDefault:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSCallToAction

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
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

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSCallToAction;
  v4 = [(BCSCallToAction *)&v8 description];
  v5 = [(BCSCallToAction *)self dictionaryRepresentation];
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
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v4 setObject:subtitle forKey:@"subtitle"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_isDefault];
    [v4 setObject:v8 forKey:@"is_default"];
  }
  body = self->_body;
  if (body) {
    [v4 setObject:body forKey:@"body"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BCSCallToActionReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_subtitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_body)
  {
    PBDataWriterWriteStringField();
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
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    id v4 = v5;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v5, "setSubtitle:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[40] = self->_isDefault;
    v4[44] |= 1u;
  }
  if (self->_body)
  {
    objc_msgSend(v5, "setBody:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_language copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_subtitle copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 40) = self->_isDefault;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_body copyWithZone:a3];
  v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](language, "isEqual:")) {
      goto LABEL_12;
    }
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_12;
    }
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:")) {
      goto LABEL_12;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 44))
    {
      if (self->_isDefault)
      {
        if (*((unsigned char *)v4 + 40)) {
          goto LABEL_18;
        }
      }
      else if (!*((unsigned char *)v4 + 40))
      {
        goto LABEL_18;
      }
    }
LABEL_12:
    char v8 = 0;
    goto LABEL_13;
  }
  if (*((unsigned char *)v4 + 44)) {
    goto LABEL_12;
  }
LABEL_18:
  body = self->_body;
  if ((unint64_t)body | *((void *)v4 + 1)) {
    char v8 = -[NSString isEqual:](body, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_language hash];
  NSUInteger v4 = [(NSString *)self->_title hash];
  NSUInteger v5 = [(NSString *)self->_subtitle hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_isDefault;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_body hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[BCSCallToAction setLanguage:](self, "setLanguage:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[BCSCallToAction setTitle:](self, "setTitle:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[BCSCallToAction setSubtitle:](self, "setSubtitle:");
    NSUInteger v4 = v5;
  }
  if (v4[44])
  {
    self->_isDefault = v4[40];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[BCSCallToAction setBody:](self, "setBody:");
    NSUInteger v4 = v5;
  }
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_body, 0);
}

@end