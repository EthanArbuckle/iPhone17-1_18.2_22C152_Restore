@interface GEOARPRating
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDisplayedText;
- (BOOL)hasRating;
- (BOOL)isEqual:(id)a3;
- (BOOL)rating;
- (BOOL)readFrom:(id)a3;
- (GEOARPRating)initWithDictionary:(id)a3;
- (GEOARPRating)initWithJSON:(id)a3;
- (NSString)displayedText;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayedText:(id)a3;
- (void)setHasRating:(BOOL)a3;
- (void)setRating:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOARPRating

- (BOOL)rating
{
  return self->_rating;
}

- (void)setRating:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_rating = a3;
}

- (void)setHasRating:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasRating
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasDisplayedText
{
  return self->_displayedText != 0;
}

- (NSString)displayedText
{
  return self->_displayedText;
}

- (void)setDisplayedText:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOARPRating;
  v4 = [(GEOARPRating *)&v8 description];
  v5 = [(GEOARPRating *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOARPRating _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[20])
    {
      v5 = [NSNumber numberWithBool:a1[16]];
      [v4 setObject:v5 forKey:@"rating"];
    }
    v6 = [a1 displayedText];
    if (v6)
    {
      if (a2) {
        v7 = @"displayedText";
      }
      else {
        v7 = @"displayed_text";
      }
      [v4 setObject:v6 forKey:v7];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOARPRating _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOARPRating)initWithDictionary:(id)a3
{
  return (GEOARPRating *)-[GEOARPRating _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"rating"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRating:", objc_msgSend(v6, "BOOLValue"));
      }

      if (a3) {
        v7 = @"displayedText";
      }
      else {
        v7 = @"displayed_text";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (void *)[v8 copy];
        [a1 setDisplayedText:v9];
      }
    }
  }

  return a1;
}

- (GEOARPRating)initWithJSON:(id)a3
{
  return (GEOARPRating *)-[GEOARPRating _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOARPRatingIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOARPRatingReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_displayedText)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOARPRating *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    v5[16] = self->_rating;
    v5[20] |= 1u;
  }
  if (self->_displayedText)
  {
    objc_msgSend(v5, "setDisplayedText:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 16) = self->_rating;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_displayedText copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEOARPRating *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_rating)
      {
        if (*((unsigned char *)v4 + 16)) {
          goto LABEL_12;
        }
      }
      else if (!*((unsigned char *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    char v5 = 0;
    goto LABEL_7;
  }
  if (*((unsigned char *)v4 + 20)) {
    goto LABEL_6;
  }
LABEL_12:
  displayedText = self->_displayedText;
  if ((unint64_t)displayedText | *((void *)v4 + 1)) {
    char v5 = -[NSString isEqual:](displayedText, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  [(GEOARPRating *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_rating;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(NSString *)self->_displayedText hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  char v5 = (BOOL *)a3;
  [v5 readAll:0];
  id v4 = v5;
  if (v5[20])
  {
    self->_rating = v5[16];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 1))
  {
    -[GEOARPRating setDisplayedText:](self, "setDisplayedText:");
    id v4 = v5;
  }
}

- (void).cxx_destruct
{
}

@end