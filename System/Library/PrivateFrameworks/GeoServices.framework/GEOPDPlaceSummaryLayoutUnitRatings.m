@interface GEOPDPlaceSummaryLayoutUnitRatings
+ (BOOL)isValid:(id)a3;
- (BOOL)hasShouldShowRatingCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldShowRatingCount;
- (GEOPDPlaceSummaryLayoutUnitRatings)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitRatings)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasShouldShowRatingCount:(BOOL)a3;
- (void)setShouldShowRatingCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryLayoutUnitRatings

- (BOOL)shouldShowRatingCount
{
  return self->_shouldShowRatingCount;
}

- (void)setShouldShowRatingCount:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_shouldShowRatingCount = a3;
}

- (void)setHasShouldShowRatingCount:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasShouldShowRatingCount
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnitRatings;
  v4 = [(GEOPDPlaceSummaryLayoutUnitRatings *)&v8 description];
  v5 = [(GEOPDPlaceSummaryLayoutUnitRatings *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnitRatings _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[12])
    {
      v5 = [NSNumber numberWithBool:a1[8]];
      if (a2) {
        v6 = @"shouldShowRatingCount";
      }
      else {
        v6 = @"should_show_rating_count";
      }
      [v4 setObject:v5 forKey:v6];
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
  return -[GEOPDPlaceSummaryLayoutUnitRatings _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOPDPlaceSummaryLayoutUnitRatings)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitRatings *)-[GEOPDPlaceSummaryLayoutUnitRatings _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"shouldShowRatingCount";
      }
      else {
        v6 = @"should_show_rating_count";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setShouldShowRatingCount:", objc_msgSend(v7, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOPDPlaceSummaryLayoutUnitRatings)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitRatings *)-[GEOPDPlaceSummaryLayoutUnitRatings _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitRatingsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitRatingsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  [(GEOPDPlaceSummaryLayoutUnitRatings *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[8] = self->_shouldShowRatingCount;
    v4[12] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)result + 8) = self->_shouldShowRatingCount;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_4;
  }
  [(GEOPDPlaceSummaryLayoutUnitRatings *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (v4[12] & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[12] & 1) == 0)
    {
LABEL_4:
      BOOL v5 = 0;
      goto LABEL_5;
    }
    if (self->_shouldShowRatingCount)
    {
      if (!v4[8]) {
        goto LABEL_4;
      }
    }
    else if (v4[8])
    {
      goto LABEL_4;
    }
    BOOL v5 = 1;
  }
LABEL_5:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    return 2654435761 * self->_shouldShowRatingCount;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  [v4 readAll:0];
  if (v4[12])
  {
    self->_shouldShowRatingCount = v4[8];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end