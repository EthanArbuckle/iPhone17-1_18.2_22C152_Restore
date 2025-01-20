@interface BMPBParsecSearchTopic
- (BOOL)hasIdentifier;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (float)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setScore:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBParsecSearchTopic

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setScore:(float)a3
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

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBParsecSearchTopic;
  v4 = [(BMPBParsecSearchTopic *)&v8 description];
  v5 = [(BMPBParsecSearchTopic *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v4 = self->_score;
    v7 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v7 forKey:@"score"];
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBParsecSearchTopicReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_identifier)
  {
    id v5 = v4;
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = LODWORD(self->_score);
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(float *)(v5 + 16) = self->_score;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_score == *((float *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if (*(unsigned char *)&self->_has)
  {
    float score = self->_score;
    float v6 = -score;
    if (score >= 0.0) {
      float v6 = self->_score;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (float *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[BMPBParsecSearchTopic setIdentifier:](self, "setIdentifier:");
    unint64_t v4 = v5;
  }
  if ((_BYTE)v4[5])
  {
    self->_float score = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (float)score
{
  return self->_score;
}

- (void).cxx_destruct
{
}

@end