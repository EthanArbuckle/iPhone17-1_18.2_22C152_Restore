@interface GEORPSuggestedRouteIndex
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDirectionsResponseIndex;
- (BOOL)hasDirectionsResponseSuggestedRoutesIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPSuggestedRouteIndex)initWithDictionary:(id)a3;
- (GEORPSuggestedRouteIndex)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)clusteredRouteRideSelectionsCount;
- (unint64_t)hash;
- (unsigned)clusteredRouteRideSelections;
- (unsigned)clusteredRouteRideSelectionsAtIndex:(unint64_t)a3;
- (unsigned)directionsResponseIndex;
- (unsigned)directionsResponseSuggestedRoutesIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addClusteredRouteRideSelections:(unsigned int)a3;
- (void)clearClusteredRouteRideSelections;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setClusteredRouteRideSelections:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setDirectionsResponseIndex:(unsigned int)a3;
- (void)setDirectionsResponseSuggestedRoutesIndex:(unsigned int)a3;
- (void)setHasDirectionsResponseIndex:(BOOL)a3;
- (void)setHasDirectionsResponseSuggestedRoutesIndex:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPSuggestedRouteIndex

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPSuggestedRouteIndex;
  [(GEORPSuggestedRouteIndex *)&v3 dealloc];
}

- (unsigned)directionsResponseIndex
{
  return self->_directionsResponseIndex;
}

- (void)setDirectionsResponseIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_directionsResponseIndex = a3;
}

- (void)setHasDirectionsResponseIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDirectionsResponseIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)directionsResponseSuggestedRoutesIndex
{
  return self->_directionsResponseSuggestedRoutesIndex;
}

- (void)setDirectionsResponseSuggestedRoutesIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_directionsResponseSuggestedRoutesIndex = a3;
}

- (void)setHasDirectionsResponseSuggestedRoutesIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDirectionsResponseSuggestedRoutesIndex
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unint64_t)clusteredRouteRideSelectionsCount
{
  return self->_clusteredRouteRideSelections.count;
}

- (unsigned)clusteredRouteRideSelections
{
  return self->_clusteredRouteRideSelections.list;
}

- (void)clearClusteredRouteRideSelections
{
}

- (void)addClusteredRouteRideSelections:(unsigned int)a3
{
}

- (unsigned)clusteredRouteRideSelectionsAtIndex:(unint64_t)a3
{
  p_clusteredRouteRideSelections = &self->_clusteredRouteRideSelections;
  unint64_t count = self->_clusteredRouteRideSelections.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_clusteredRouteRideSelections->list[a3];
}

- (void)setClusteredRouteRideSelections:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPSuggestedRouteIndex;
  v4 = [(GEORPSuggestedRouteIndex *)&v8 description];
  v5 = [(GEORPSuggestedRouteIndex *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPSuggestedRouteIndex _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 40);
    if (v5)
    {
      v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
      if (a2) {
        uint64_t v7 = @"directionsResponseIndex";
      }
      else {
        uint64_t v7 = @"directions_response_index";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 40);
    }
    if ((v5 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 36)];
      if (a2) {
        v9 = @"directionsResponseSuggestedRoutesIndex";
      }
      else {
        v9 = @"directions_response_suggested_routes_index";
      }
      [v4 setObject:v8 forKey:v9];
    }
    if (*(void *)(a1 + 16))
    {
      v10 = PBRepeatedUInt32NSArray();
      if (a2) {
        v11 = @"clusteredRouteRideSelections";
      }
      else {
        v11 = @"clustered_route_ride_selections";
      }
      [v4 setObject:v10 forKey:v11];
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
  return -[GEORPSuggestedRouteIndex _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPSuggestedRouteIndex)initWithDictionary:(id)a3
{
  return (GEORPSuggestedRouteIndex *)-[GEORPSuggestedRouteIndex _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"directionsResponseIndex";
      }
      else {
        v6 = @"directions_response_index";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDirectionsResponseIndex:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"directionsResponseSuggestedRoutesIndex";
      }
      else {
        objc_super v8 = @"directions_response_suggested_routes_index";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDirectionsResponseSuggestedRoutesIndex:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        v10 = @"clusteredRouteRideSelections";
      }
      else {
        v10 = @"clustered_route_ride_selections";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addClusteredRouteRideSelections:", objc_msgSend(v17, "unsignedIntValue", (void)v19));
              }
              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v14);
        }
      }
    }
  }

  return a1;
}

- (GEORPSuggestedRouteIndex)initWithJSON:(id)a3
{
  return (GEORPSuggestedRouteIndex *)-[GEORPSuggestedRouteIndex _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPSuggestedRouteIndexIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPSuggestedRouteIndexReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v8 = v4;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
  }
  p_clusteredRouteRideSelections = &self->_clusteredRouteRideSelections;
  if (p_clusteredRouteRideSelections->count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v8;
      ++v7;
    }
    while (v7 < p_clusteredRouteRideSelections->count);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [(GEORPSuggestedRouteIndex *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v8[8] = self->_directionsResponseIndex;
    *((unsigned char *)v8 + 40) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v8[9] = self->_directionsResponseSuggestedRoutesIndex;
    *((unsigned char *)v8 + 40) |= 2u;
  }
  if ([(GEORPSuggestedRouteIndex *)self clusteredRouteRideSelectionsCount])
  {
    [v8 clearClusteredRouteRideSelections];
    unint64_t v5 = [(GEORPSuggestedRouteIndex *)self clusteredRouteRideSelectionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v8, "addClusteredRouteRideSelections:", -[GEORPSuggestedRouteIndex clusteredRouteRideSelectionsAtIndex:](self, "clusteredRouteRideSelectionsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = (void *)v4;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v4 + 32) = self->_directionsResponseIndex;
    *(unsigned char *)(v4 + 40) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 36) = self->_directionsResponseSuggestedRoutesIndex;
    *(unsigned char *)(v4 + 40) |= 2u;
  }
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEORPSuggestedRouteIndex *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_directionsResponseIndex != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char IsEqual = 0;
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_directionsResponseSuggestedRoutesIndex != *((_DWORD *)v4 + 9)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_13;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_14:

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEORPSuggestedRouteIndex *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_directionsResponseIndex;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3 ^ PBRepeatedUInt32Hash();
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_directionsResponseSuggestedRoutesIndex;
  return v4 ^ v3 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v8 = (unsigned int *)a3;
  [v8 readAll:0];
  char v4 = *((unsigned char *)v8 + 40);
  if (v4)
  {
    self->_directionsResponseIndex = v8[8];
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v8 + 40);
  }
  if ((v4 & 2) != 0)
  {
    self->_directionsResponseSuggestedRoutesIndex = v8[9];
    *(unsigned char *)&self->_flags |= 2u;
  }
  uint64_t v5 = [v8 clusteredRouteRideSelectionsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[GEORPSuggestedRouteIndex addClusteredRouteRideSelections:](self, "addClusteredRouteRideSelections:", [v8 clusteredRouteRideSelectionsAtIndex:i]);
  }
}

@end