@interface GEORPFeedbackBooleanField
+ (BOOL)isValid:(id)a3;
- (BOOL)edited;
- (BOOL)hasEdited;
- (BOOL)hasOriginal;
- (BOOL)isEqual:(id)a3;
- (BOOL)original;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackBooleanField)initWithDictionary:(id)a3;
- (GEORPFeedbackBooleanField)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEdited:(BOOL)a3;
- (void)setHasEdited:(BOOL)a3;
- (void)setHasOriginal:(BOOL)a3;
- (void)setOriginal:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackBooleanField

- (BOOL)original
{
  return self->_original;
}

- (void)setOriginal:(BOOL)a3
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

- (BOOL)edited
{
  return self->_edited;
}

- (void)setEdited:(BOOL)a3
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
  v8.super_class = (Class)GEORPFeedbackBooleanField;
  v4 = [(GEORPFeedbackBooleanField *)&v8 description];
  v5 = [(GEORPFeedbackBooleanField *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    unsigned __int8 v3 = a1[12];
    if ((v3 & 2) != 0)
    {
      v4 = [NSNumber numberWithBool:a1[9]];
      [v2 setObject:v4 forKey:@"original"];

      unsigned __int8 v3 = a1[12];
    }
    if (v3)
    {
      v5 = [NSNumber numberWithBool:a1[8]];
      [v2 setObject:v5 forKey:@"edited"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEORPFeedbackBooleanField)initWithDictionary:(id)a3
{
  return (GEORPFeedbackBooleanField *)-[GEORPFeedbackBooleanField _initWithDictionary:isJSON:](self, a3);
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
        objc_msgSend(a1, "setOriginal:", objc_msgSend(v4, "BOOLValue"));
      }

      v5 = [v3 objectForKeyedSubscript:@"edited"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEdited:", objc_msgSend(v5, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEORPFeedbackBooleanField)initWithJSON:(id)a3
{
  return (GEORPFeedbackBooleanField *)-[GEORPFeedbackBooleanField _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackBooleanFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackBooleanFieldReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [(GEORPFeedbackBooleanField *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[9] = self->_original;
    v5[12] |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[8] = self->_edited;
    v5[12] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((unsigned char *)result + 9) = self->_original;
    *((unsigned char *)result + 12) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((unsigned char *)result + 8) = self->_edited;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  [(GEORPFeedbackBooleanField *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[12] & 2) == 0) {
      goto LABEL_12;
    }
    if (self->_original)
    {
      if (!v4[9]) {
        goto LABEL_12;
      }
    }
    else if (v4[9])
    {
      goto LABEL_12;
    }
  }
  else if ((v4[12] & 2) != 0)
  {
    goto LABEL_12;
  }
  BOOL v5 = (v4[12] & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if (v4[12])
    {
      if (self->_edited)
      {
        if (!v4[8]) {
          goto LABEL_12;
        }
      }
      else if (v4[8])
      {
        goto LABEL_12;
      }
      BOOL v5 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v5 = 0;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  [(GEORPFeedbackBooleanField *)self readAll:1];
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
  BOOL v5 = (BOOL *)a3;
  [v5 readAll:0];
  BOOL v4 = v5[12];
  if ((v4 & 2) != 0)
  {
    self->_original = v5[9];
    *(unsigned char *)&self->_flags |= 2u;
    BOOL v4 = v5[12];
  }
  if (v4)
  {
    self->_edited = v5[8];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end