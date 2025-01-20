@interface GEORPRatingValue
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCategoryName;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocalizedString)categoryName;
- (GEORPRatingValue)initWithDictionary:(id)a3;
- (GEORPRatingValue)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)score;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategoryName:(id)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setScore:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPRatingValue

- (BOOL)hasCategoryName
{
  return self->_categoryName != 0;
}

- (GEOLocalizedString)categoryName
{
  return self->_categoryName;
}

- (void)setCategoryName:(id)a3
{
}

- (int)score
{
  return self->_score;
}

- (void)setScore:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPRatingValue;
  v4 = [(GEORPRatingValue *)&v8 description];
  v5 = [(GEORPRatingValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPRatingValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 categoryName];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"categoryName";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"category_name";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(unsigned char *)(a1 + 20))
    {
      v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
      [v4 setObject:v9 forKey:@"score"];
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
  return -[GEORPRatingValue _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPRatingValue)initWithDictionary:(id)a3
{
  return (GEORPRatingValue *)-[GEORPRatingValue _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"categoryName";
      }
      else {
        v6 = @"category_name";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOLocalizedString alloc];
        if (a3) {
          uint64_t v9 = [(GEOLocalizedString *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOLocalizedString *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setCategoryName:v9];
      }
      v11 = [v5 objectForKeyedSubscript:@"score"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setScore:", objc_msgSend(v11, "intValue"));
      }
    }
  }

  return a1;
}

- (GEORPRatingValue)initWithJSON:(id)a3
{
  return (GEORPRatingValue *)-[GEORPRatingValue _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPRatingValueIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPRatingValueReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_categoryName)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteSint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEORPRatingValue *)self readAll:0];
  if (self->_categoryName) {
    objc_msgSend(v4, "setCategoryName:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 4) = self->_score;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOLocalizedString *)self->_categoryName copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_score;
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
  [(GEORPRatingValue *)self readAll:1];
  [v4 readAll:1];
  categoryName = self->_categoryName;
  if ((unint64_t)categoryName | *((void *)v4 + 1))
  {
    if (!-[GEOLocalizedString isEqual:](categoryName, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_score == *((_DWORD *)v4 + 4))
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
  [(GEORPRatingValue *)self readAll:1];
  unint64_t v3 = [(GEOLocalizedString *)self->_categoryName hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_score;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v6 = (int *)a3;
  [v6 readAll:0];
  categoryName = self->_categoryName;
  uint64_t v5 = *((void *)v6 + 1);
  if (categoryName)
  {
    if (v5) {
      -[GEOLocalizedString mergeFrom:](categoryName, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPRatingValue setCategoryName:](self, "setCategoryName:");
  }
  if (v6[5])
  {
    self->_score = v6[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end