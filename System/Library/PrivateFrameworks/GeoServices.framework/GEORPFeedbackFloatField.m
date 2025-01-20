@interface GEORPFeedbackFloatField
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEdited;
- (BOOL)hasOriginal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackFloatField)initWithDictionary:(id)a3;
- (GEORPFeedbackFloatField)initWithJSON:(id)a3;
- (float)edited;
- (float)original;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEdited:(float)a3;
- (void)setHasEdited:(BOOL)a3;
- (void)setHasOriginal:(BOOL)a3;
- (void)setOriginal:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackFloatField

- (float)original
{
  return self->_original;
}

- (void)setOriginal:(float)a3
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

- (float)edited
{
  return self->_edited;
}

- (void)setEdited:(float)a3
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
  v8.super_class = (Class)GEORPFeedbackFloatField;
  v4 = [(GEORPFeedbackFloatField *)&v8 description];
  v5 = [(GEORPFeedbackFloatField *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    char v4 = *(unsigned char *)(a1 + 16);
    if ((v4 & 2) != 0)
    {
      LODWORD(v3) = *(_DWORD *)(a1 + 12);
      v5 = [NSNumber numberWithFloat:v3];
      [v2 setObject:v5 forKey:@"original"];

      char v4 = *(unsigned char *)(a1 + 16);
    }
    if (v4)
    {
      LODWORD(v3) = *(_DWORD *)(a1 + 8);
      v6 = [NSNumber numberWithFloat:v3];
      [v2 setObject:v6 forKey:@"edited"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEORPFeedbackFloatField)initWithDictionary:(id)a3
{
  return (GEORPFeedbackFloatField *)-[GEORPFeedbackFloatField _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      char v4 = [v3 objectForKeyedSubscript:@"original"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v4 floatValue];
        objc_msgSend(a1, "setOriginal:");
      }

      v5 = [v3 objectForKeyedSubscript:@"edited"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v5 floatValue];
        objc_msgSend(a1, "setEdited:");
      }
    }
  }

  return a1;
}

- (GEORPFeedbackFloatField)initWithJSON:(id)a3
{
  return (GEORPFeedbackFloatField *)-[GEORPFeedbackFloatField _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackFloatFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackFloatFieldReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [(GEORPFeedbackFloatField *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = LODWORD(self->_original);
    *((unsigned char *)v5 + 16) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[2] = LODWORD(self->_edited);
    *((unsigned char *)v5 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = LODWORD(self->_original);
    *((unsigned char *)result + 16) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_edited);
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEORPFeedbackFloatField *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_original != *((float *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_edited != *((float *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEORPFeedbackFloatField *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    float original = self->_original;
    double v6 = original;
    if (original < 0.0) {
      double v6 = -original;
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
  if (flags)
  {
    float edited = self->_edited;
    double v11 = edited;
    if (edited < 0.0) {
      double v11 = -edited;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  return v9 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (float *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if ((v4 & 2) != 0)
  {
    self->_float original = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 16);
  }
  if (v4)
  {
    self->_float edited = v5[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end