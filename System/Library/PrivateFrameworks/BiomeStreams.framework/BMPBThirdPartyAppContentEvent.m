@interface BMPBThirdPartyAppContentEvent
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasBundleId;
- (BOOL)hasComment;
- (BOOL)hasContent;
- (BOOL)hasContentProtection;
- (BOOL)hasDesc;
- (BOOL)hasDomainId;
- (BOOL)hasPersonaId;
- (BOOL)hasTitle;
- (BOOL)hasUniqueId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleId;
- (NSString)comment;
- (NSString)content;
- (NSString)contentProtection;
- (NSString)desc;
- (NSString)domainId;
- (NSString)personaId;
- (NSString)title;
- (NSString)uniqueId;
- (double)absoluteTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setBundleId:(id)a3;
- (void)setComment:(id)a3;
- (void)setContent:(id)a3;
- (void)setContentProtection:(id)a3;
- (void)setDesc:(id)a3;
- (void)setDomainId:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setPersonaId:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBThirdPartyAppContentEvent

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

- (BOOL)hasDomainId
{
  return self->_domainId != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
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

- (BOOL)hasDesc
{
  return self->_desc != 0;
}

- (BOOL)hasComment
{
  return self->_comment != 0;
}

- (BOOL)hasContent
{
  return self->_content != 0;
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
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBThirdPartyAppContentEvent;
  v4 = [(BMPBThirdPartyAppContentEvent *)&v8 description];
  v5 = [(BMPBThirdPartyAppContentEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  uniqueId = self->_uniqueId;
  if (uniqueId) {
    [v3 setObject:uniqueId forKey:@"uniqueId"];
  }
  domainId = self->_domainId;
  if (domainId) {
    [v4 setObject:domainId forKey:@"domainId"];
  }
  bundleId = self->_bundleId;
  if (bundleId) {
    [v4 setObject:bundleId forKey:@"bundleId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v4 setObject:v8 forKey:@"absoluteTimestamp"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  desc = self->_desc;
  if (desc) {
    [v4 setObject:desc forKey:@"desc"];
  }
  comment = self->_comment;
  if (comment) {
    [v4 setObject:comment forKey:@"comment"];
  }
  content = self->_content;
  if (content) {
    [v4 setObject:content forKey:@"content"];
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
  return BMPBThirdPartyAppContentEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_bundleId)
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
  if (self->_desc)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_comment)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_content)
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
  if (self->_bundleId)
  {
    objc_msgSend(v5, "setBundleId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 88) |= 1u;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    id v4 = v5;
  }
  if (self->_desc)
  {
    objc_msgSend(v5, "setDesc:");
    id v4 = v5;
  }
  if (self->_comment)
  {
    objc_msgSend(v5, "setComment:");
    id v4 = v5;
  }
  if (self->_content)
  {
    objc_msgSend(v5, "setContent:");
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
  v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  uint64_t v8 = [(NSString *)self->_domainId copyWithZone:a3];
  v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_bundleId copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 88) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_title copyWithZone:a3];
  v13 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v12;

  uint64_t v14 = [(NSString *)self->_desc copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  uint64_t v16 = [(NSString *)self->_comment copyWithZone:a3];
  v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  uint64_t v18 = [(NSString *)self->_content copyWithZone:a3];
  v19 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v18;

  uint64_t v20 = [(NSString *)self->_contentProtection copyWithZone:a3];
  v21 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v20;

  uint64_t v22 = [(NSString *)self->_personaId copyWithZone:a3];
  v23 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v22;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:")) {
      goto LABEL_25;
    }
  }
  domainId = self->_domainId;
  if ((unint64_t)domainId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](domainId, "isEqual:")) {
      goto LABEL_25;
    }
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_25;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
LABEL_25:
    char v14 = 0;
    goto LABEL_26;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 9) && !-[NSString isEqual:](title, "isEqual:")) {
    goto LABEL_25;
  }
  desc = self->_desc;
  if ((unint64_t)desc | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](desc, "isEqual:")) {
      goto LABEL_25;
    }
  }
  comment = self->_comment;
  if ((unint64_t)comment | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](comment, "isEqual:")) {
      goto LABEL_25;
    }
  }
  content = self->_content;
  if ((unint64_t)content | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](content, "isEqual:")) {
      goto LABEL_25;
    }
  }
  contentProtection = self->_contentProtection;
  if ((unint64_t)contentProtection | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](contentProtection, "isEqual:")) {
      goto LABEL_25;
    }
  }
  personaId = self->_personaId;
  if ((unint64_t)personaId | *((void *)v4 + 8)) {
    char v14 = -[NSString isEqual:](personaId, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_26:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueId hash];
  NSUInteger v4 = [(NSString *)self->_domainId hash];
  NSUInteger v5 = [(NSString *)self->_bundleId hash];
  if (*(unsigned char *)&self->_has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v8 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v8 = self->_absoluteTimestamp;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  NSUInteger v11 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v12 = [(NSString *)self->_title hash];
  NSUInteger v13 = v12 ^ [(NSString *)self->_desc hash];
  NSUInteger v14 = v11 ^ v13 ^ [(NSString *)self->_comment hash];
  NSUInteger v15 = [(NSString *)self->_content hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_contentProtection hash];
  return v14 ^ v16 ^ [(NSString *)self->_personaId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (double *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 10))
  {
    -[BMPBThirdPartyAppContentEvent setUniqueId:](self, "setUniqueId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 7))
  {
    -[BMPBThirdPartyAppContentEvent setDomainId:](self, "setDomainId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[BMPBThirdPartyAppContentEvent setBundleId:](self, "setBundleId:");
    NSUInteger v4 = v5;
  }
  if ((_BYTE)v4[11])
  {
    self->_double absoluteTimestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 9))
  {
    -[BMPBThirdPartyAppContentEvent setTitle:](self, "setTitle:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[BMPBThirdPartyAppContentEvent setDesc:](self, "setDesc:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[BMPBThirdPartyAppContentEvent setComment:](self, "setComment:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[BMPBThirdPartyAppContentEvent setContent:](self, "setContent:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[BMPBThirdPartyAppContentEvent setContentProtection:](self, "setContentProtection:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 8))
  {
    -[BMPBThirdPartyAppContentEvent setPersonaId:](self, "setPersonaId:");
    NSUInteger v4 = v5;
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

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
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

- (NSString)desc
{
  return self->_desc;
}

- (void)setDesc:(id)a3
{
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
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
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_comment, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end