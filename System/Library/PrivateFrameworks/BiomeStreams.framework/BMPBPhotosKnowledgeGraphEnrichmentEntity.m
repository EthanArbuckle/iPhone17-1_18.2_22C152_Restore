@interface BMPBPhotosKnowledgeGraphEnrichmentEntity
- (BOOL)hasCategory;
- (BOOL)hasLanguage;
- (BOOL)hasName;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)language;
- (NSString)name;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)category;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(unsigned int)a3;
- (void)setHasCategory:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setName:(id)a3;
- (void)setScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBPhotosKnowledgeGraphEnrichmentEntity

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)setCategory:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_category = a3;
}

- (void)setHasCategory:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCategory
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBPhotosKnowledgeGraphEnrichmentEntity;
  v4 = [(BMPBPhotosKnowledgeGraphEnrichmentEntity *)&v8 description];
  v5 = [(BMPBPhotosKnowledgeGraphEnrichmentEntity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithDouble:self->_score];
    [v4 setObject:v6 forKey:@"score"];
  }
  language = self->_language;
  if (language) {
    [v4 setObject:language forKey:@"language"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_category];
    [v4 setObject:v8 forKey:@"category"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBPhotosKnowledgeGraphEnrichmentEntityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_score;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_language)
  {
    objc_msgSend(v5, "setLanguage:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_category;
    *((unsigned char *)v4 + 40) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_score;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_language copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_category;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_16;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_score != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_16;
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](language, "isEqual:"))
    {
LABEL_16:
      BOOL v8 = 0;
      goto LABEL_17;
    }
    char has = (char)self->_has;
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_category != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
    BOOL v8 = 1;
  }
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_has)
  {
    double score = self->_score;
    double v6 = -score;
    if (score >= 0.0) {
      double v6 = self->_score;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_language hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_category;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[BMPBPhotosKnowledgeGraphEnrichmentEntity setName:](self, "setName:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_double score = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[BMPBPhotosKnowledgeGraphEnrichmentEntity setLanguage:](self, "setLanguage:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    self->_category = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)score
{
  return self->_score;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (unsigned)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_language, 0);
}

@end