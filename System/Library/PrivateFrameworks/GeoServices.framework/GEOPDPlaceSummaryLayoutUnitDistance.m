@interface GEOPDPlaceSummaryLayoutUnitDistance
+ (BOOL)isValid:(id)a3;
- (BOOL)hasMaximumDistanceInMeters;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitDistance)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitDistance)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)maximumDistanceInMeters;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMaximumDistanceInMeters:(BOOL)a3;
- (void)setMaximumDistanceInMeters:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryLayoutUnitDistance

- (unint64_t)maximumDistanceInMeters
{
  return self->_maximumDistanceInMeters;
}

- (void)setMaximumDistanceInMeters:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_maximumDistanceInMeters = a3;
}

- (void)setHasMaximumDistanceInMeters:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMaximumDistanceInMeters
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnitDistance;
  v4 = [(GEOPDPlaceSummaryLayoutUnitDistance *)&v8 description];
  v5 = [(GEOPDPlaceSummaryLayoutUnitDistance *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnitDistance _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 16))
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
      if (a2) {
        v6 = @"maximumDistanceInMeters";
      }
      else {
        v6 = @"maximum_distance_in_meters";
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
  return -[GEOPDPlaceSummaryLayoutUnitDistance _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutUnitDistance)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitDistance *)-[GEOPDPlaceSummaryLayoutUnitDistance _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"maximumDistanceInMeters";
      }
      else {
        v6 = @"maximum_distance_in_meters";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMaximumDistanceInMeters:", objc_msgSend(v7, "unsignedLongLongValue"));
      }
    }
  }

  return a1;
}

- (GEOPDPlaceSummaryLayoutUnitDistance)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitDistance *)-[GEOPDPlaceSummaryLayoutUnitDistance _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitDistanceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitDistanceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  [(GEOPDPlaceSummaryLayoutUnitDistance *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[1] = self->_maximumDistanceInMeters;
    *((unsigned char *)v4 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((void *)result + 1) = self->_maximumDistanceInMeters;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEOPDPlaceSummaryLayoutUnitDistance *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) != 0 && self->_maximumDistanceInMeters == *((void *)v4 + 1))
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
    return 2654435761u * self->_maximumDistanceInMeters;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  id v4 = (unint64_t *)a3;
  [v4 readAll:0];
  if (v4[2])
  {
    self->_maximumDistanceInMeters = v4[1];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end