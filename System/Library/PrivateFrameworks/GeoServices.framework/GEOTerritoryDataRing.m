@interface GEOTerritoryDataRing
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation GEOTerritoryDataRing

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTerritoryDataRing;
  [(GEOTerritoryDataRing *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTerritoryDataRing;
  v4 = [(GEOTerritoryDataRing *)&v8 description];
  v5 = [(GEOTerritoryDataRing *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 16))
    {
      objc_super v3 = PBRepeatedUInt32NSArray();
      [v2 setObject:v3 forKey:@"point"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return GEOTerritoryDataRingReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_points = &self->_points;
  if (p_points->count)
  {
    PBDataWriterPlaceMark();
    if (p_points->count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < p_points->count);
    }
    PBDataWriterRecallMark();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()]) {
    char IsEqual = PBRepeatedUInt32IsEqual();
  }
  else {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  return PBRepeatedUInt32Hash();
}

@end