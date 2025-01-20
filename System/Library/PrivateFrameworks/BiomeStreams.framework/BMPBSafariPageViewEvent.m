@interface BMPBSafariPageViewEvent
- (BOOL)contentIsReaderText;
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasContent;
- (BOOL)hasContentIsReaderText;
- (BOOL)hasContentProtection;
- (BOOL)hasDomainId;
- (BOOL)hasPersonaId;
- (BOOL)hasTitle;
- (BOOL)hasUniqueId;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)content;
- (NSString)contentProtection;
- (NSString)domainId;
- (NSString)personaId;
- (NSString)title;
- (NSString)uniqueId;
- (NSString)url;
- (double)absoluteTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setContent:(id)a3;
- (void)setContentIsReaderText:(BOOL)a3;
- (void)setContentProtection:(id)a3;
- (void)setDomainId:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasContentIsReaderText:(BOOL)a3;
- (void)setPersonaId:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueId:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSafariPageViewEvent

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

- (BOOL)hasDomainId
{
  return self->_domainId != 0;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)setContentIsReaderText:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_contentIsReaderText = a3;
}

- (void)setHasContentIsReaderText:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasContentIsReaderText
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (BOOL)hasContentProtection
{
  return self->_contentProtection != 0;
}

- (BOOL)hasPersonaId
{
  return self->_personaId != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBSafariPageViewEvent;
  v4 = [(BMPBSafariPageViewEvent *)&v8 description];
  v5 = [(BMPBSafariPageViewEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  uniqueId = self->_uniqueId;
  if (uniqueId) {
    [v3 setObject:uniqueId forKey:@"uniqueId"];
  }
  domainId = self->_domainId;
  if (domainId) {
    [v4 setObject:domainId forKey:@"domainId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v4 setObject:v7 forKey:@"absoluteTimestamp"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  content = self->_content;
  if (content) {
    [v4 setObject:content forKey:@"content"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_contentIsReaderText];
    [v4 setObject:v10 forKey:@"contentIsReaderText"];
  }
  url = self->_url;
  if (url) {
    [v4 setObject:url forKey:@"url"];
  }
  contentProtection = self->_contentProtection;
  if (contentProtection) {
    [v4 setObject:contentProtection forKey:@"contentProtection"];
  }
  personaId = self->_personaId;
  if (personaId) {
    [v4 setObject:personaId forKey:@"personaId"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSafariPageViewEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_domainId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_content)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_url)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_contentProtection)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_personaId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueId)
  {
    objc_msgSend(v4, "setUniqueId:");
    id v4 = v5;
  }
  if (self->_domainId)
  {
    objc_msgSend(v5, "setDomainId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 76) |= 1u;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    id v4 = v5;
  }
  if (self->_content)
  {
    objc_msgSend(v5, "setContent:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 72) = self->_contentIsReaderText;
    *((unsigned char *)v4 + 76) |= 2u;
  }
  if (self->_url)
  {
    objc_msgSend(v5, "setUrl:");
    id v4 = v5;
  }
  if (self->_contentProtection)
  {
    objc_msgSend(v5, "setContentProtection:");
    id v4 = v5;
  }
  if (self->_personaId)
  {
    objc_msgSend(v5, "setPersonaId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueId copyWithZone:a3];
  v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_domainId copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_title copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_content copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 72) = self->_contentIsReaderText;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  uint64_t v14 = [(NSString *)self->_url copyWithZone:a3];
  v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  uint64_t v16 = [(NSString *)self->_contentProtection copyWithZone:a3];
  v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  uint64_t v18 = [(NSString *)self->_personaId copyWithZone:a3];
  v19 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:")) {
      goto LABEL_29;
    }
  }
  domainId = self->_domainId;
  if ((unint64_t)domainId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](domainId, "isEqual:")) {
      goto LABEL_29;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_29;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 6) && !-[NSString isEqual:](title, "isEqual:")) {
    goto LABEL_29;
  }
  content = self->_content;
  if ((unint64_t)content | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](content, "isEqual:")) {
      goto LABEL_29;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) != 0)
    {
      if (self->_contentIsReaderText)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_29;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_23;
      }
    }
LABEL_29:
    char v12 = 0;
    goto LABEL_30;
  }
  if ((*((unsigned char *)v4 + 76) & 2) != 0) {
    goto LABEL_29;
  }
LABEL_23:
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 8) && !-[NSString isEqual:](url, "isEqual:")) {
    goto LABEL_29;
  }
  contentProtection = self->_contentProtection;
  if ((unint64_t)contentProtection | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](contentProtection, "isEqual:")) {
      goto LABEL_29;
    }
  }
  personaId = self->_personaId;
  if ((unint64_t)personaId | *((void *)v4 + 5)) {
    char v12 = -[NSString isEqual:](personaId, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_30:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueId hash];
  NSUInteger v4 = [(NSString *)self->_domainId hash];
  if (*(unsigned char *)&self->_has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v7 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v7 = self->_absoluteTimestamp;
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
  NSUInteger v10 = [(NSString *)self->_title hash];
  NSUInteger v11 = [(NSString *)self->_content hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v12 = 2654435761 * self->_contentIsReaderText;
  }
  else {
    uint64_t v12 = 0;
  }
  NSUInteger v13 = v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12 ^ [(NSString *)self->_url hash];
  NSUInteger v14 = [(NSString *)self->_contentProtection hash];
  return v13 ^ v14 ^ [(NSString *)self->_personaId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 7))
  {
    -[BMPBSafariPageViewEvent setUniqueId:](self, "setUniqueId:");
    id v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[BMPBSafariPageViewEvent setDomainId:](self, "setDomainId:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 76))
  {
    self->_double absoluteTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6))
  {
    -[BMPBSafariPageViewEvent setTitle:](self, "setTitle:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[BMPBSafariPageViewEvent setContent:](self, "setContent:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    self->_contentIsReaderText = *((unsigned char *)v4 + 72);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 8))
  {
    -[BMPBSafariPageViewEvent setUrl:](self, "setUrl:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[BMPBSafariPageViewEvent setContentProtection:](self, "setContentProtection:");
    id v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[BMPBSafariPageViewEvent setPersonaId:](self, "setPersonaId:");
    id v4 = v5;
  }
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
}

- (NSString)domainId
{
  return self->_domainId;
}

- (void)setDomainId:(id)a3
{
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (BOOL)contentIsReaderText
{
  return self->_contentIsReaderText;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void)setContentProtection:(id)a3
{
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void)setPersonaId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end