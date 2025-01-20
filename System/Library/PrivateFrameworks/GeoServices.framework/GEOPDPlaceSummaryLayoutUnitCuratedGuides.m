@interface GEOPDPlaceSummaryLayoutUnitCuratedGuides
+ (BOOL)isValid:(id)a3;
- (BOOL)hasMinNumGuides;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitCuratedGuides)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitCuratedGuides)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)minNumGuides;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMinNumGuides:(BOOL)a3;
- (void)setMinNumGuides:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryLayoutUnitCuratedGuides

- (unsigned)minNumGuides
{
  return self->_minNumGuides;
}

- (void)setMinNumGuides:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_minNumGuides = a3;
}

- (void)setHasMinNumGuides:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMinNumGuides
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnitCuratedGuides;
  v4 = [(GEOPDPlaceSummaryLayoutUnitCuratedGuides *)&v8 description];
  v5 = [(GEOPDPlaceSummaryLayoutUnitCuratedGuides *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnitCuratedGuides _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 12))
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 8)];
      if (a2) {
        v6 = @"minNumGuides";
      }
      else {
        v6 = @"min_num_guides";
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
  return -[GEOPDPlaceSummaryLayoutUnitCuratedGuides _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutUnitCuratedGuides)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitCuratedGuides *)-[GEOPDPlaceSummaryLayoutUnitCuratedGuides _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"minNumGuides";
      }
      else {
        v6 = @"min_num_guides";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMinNumGuides:", objc_msgSend(v7, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOPDPlaceSummaryLayoutUnitCuratedGuides)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitCuratedGuides *)-[GEOPDPlaceSummaryLayoutUnitCuratedGuides _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitCuratedGuidesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitCuratedGuidesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  [(GEOPDPlaceSummaryLayoutUnitCuratedGuides *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[2] = self->_minNumGuides;
    *((unsigned char *)v4 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)result + 2) = self->_minNumGuides;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEOPDPlaceSummaryLayoutUnitCuratedGuides *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_minNumGuides == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    return 2654435761 * self->_minNumGuides;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  id v4 = (unsigned int *)a3;
  [v4 readAll:0];
  if (v4[3])
  {
    self->_minNumGuides = v4[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end