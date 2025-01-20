@interface GEORPFeedbackLongField
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEdited;
- (BOOL)hasOriginal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackLongField)initWithDictionary:(id)a3;
- (GEORPFeedbackLongField)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)edited;
- (int64_t)original;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEdited:(int64_t)a3;
- (void)setHasEdited:(BOOL)a3;
- (void)setHasOriginal:(BOOL)a3;
- (void)setOriginal:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackLongField

- (int64_t)original
{
  return self->_original;
}

- (void)setOriginal:(int64_t)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_original = a3;
}

- (void)setHasOriginal:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasOriginal
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int64_t)edited
{
  return self->_edited;
}

- (void)setEdited:(int64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_edited = a3;
}

- (void)setHasEdited:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEdited
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackLongField;
  v4 = [(GEORPFeedbackLongField *)&v8 description];
  v5 = [(GEORPFeedbackLongField *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    char v3 = *(unsigned char *)(a1 + 24);
    if ((v3 & 2) != 0)
    {
      v4 = [NSNumber numberWithLongLong:*(void *)(a1 + 16)];
      [v2 setObject:v4 forKey:@"original"];

      char v3 = *(unsigned char *)(a1 + 24);
    }
    if (v3)
    {
      v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 8)];
      [v2 setObject:v5 forKey:@"edited"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEORPFeedbackLongField)initWithDictionary:(id)a3
{
  return (GEORPFeedbackLongField *)-[GEORPFeedbackLongField _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"original"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setOriginal:", objc_msgSend(v4, "longLongValue"));
      }

      v5 = [v3 objectForKeyedSubscript:@"edited"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEdited:", objc_msgSend(v5, "longLongValue"));
      }
    }
  }

  return a1;
}

- (GEORPFeedbackLongField)initWithJSON:(id)a3
{
  return (GEORPFeedbackLongField *)-[GEORPFeedbackLongField _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackLongFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackLongFieldReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [(GEORPFeedbackLongField *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[2] = self->_original;
    *((unsigned char *)v5 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[1] = self->_edited;
    *((unsigned char *)v5 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((void *)result + 2) = self->_original;
    *((unsigned char *)result + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((void *)result + 1) = self->_edited;
    *((unsigned char *)result + 24) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEORPFeedbackLongField *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_original != *((void *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_edited != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEORPFeedbackLongField *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_original;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_edited;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (int64_t *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 2) != 0)
  {
    self->_original = v5[2];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 24);
  }
  if (v4)
  {
    self->_edited = v5[1];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end