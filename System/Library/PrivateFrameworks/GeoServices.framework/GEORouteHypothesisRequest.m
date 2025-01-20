@interface GEORouteHypothesisRequest
+ (BOOL)isValid:(id)a3;
- (BOOL)hasArrivalDate;
- (BOOL)hasDestinationLocation;
- (BOOL)hasExpirationDate;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasTransportType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapItemStorage)destinationLocation;
- (GEORouteHypothesisRequest)initWithDictionary:(id)a3;
- (GEORouteHypothesisRequest)initWithJSON:(id)a3;
- (double)arrivalDate;
- (double)expirationDate;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)transportTypeAsString:(int)a3;
- (int)StringAsTransportType:(id)a3;
- (int)transportType;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArrivalDate:(double)a3;
- (void)setDestinationLocation:(id)a3;
- (void)setExpirationDate:(double)a3;
- (void)setHasArrivalDate:(BOOL)a3;
- (void)setHasExpirationDate:(BOOL)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setTransportType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORouteHypothesisRequest

- (double)arrivalDate
{
  return self->_arrivalDate;
}

- (void)setArrivalDate:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_arrivalDate = a3;
}

- (void)setHasArrivalDate:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasArrivalDate
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasDestinationLocation
{
  return self->_destinationLocation != 0;
}

- (GEOMapItemStorage)destinationLocation
{
  return self->_destinationLocation;
}

- (void)setDestinationLocation:(id)a3
{
}

- (int)transportType
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_transportType;
  }
  else {
    return 4;
  }
}

- (void)setTransportType:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTransportType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53DFB20[a3];
  }

  return v3;
}

- (int)StringAsTransportType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasExpirationDate
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORouteHypothesisRequest;
  int v4 = [(GEORouteHypothesisRequest *)&v8 description];
  v5 = [(GEORouteHypothesisRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteHypothesisRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 36))
    {
      v5 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
      [v4 setObject:v5 forKey:@"arrivalDate"];
    }
    v6 = [(id)a1 destinationLocation];
    v7 = v6;
    if (v6)
    {
      if (a2) {
        [v6 jsonRepresentation];
      }
      else {
      objc_super v8 = [v6 dictionaryRepresentation];
      }
      [v4 setObject:v8 forKey:@"destinationLocation"];
    }
    char v9 = *(unsigned char *)(a1 + 36);
    if ((v9 & 4) != 0)
    {
      uint64_t v10 = *(int *)(a1 + 32);
      if (v10 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E53DFB20[v10];
      }
      [v4 setObject:v11 forKey:@"transportType"];

      char v9 = *(unsigned char *)(a1 + 36);
    }
    if ((v9 & 2) != 0)
    {
      v12 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      [v4 setObject:v12 forKey:@"expirationDate"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORouteHypothesisRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORouteHypothesisRequest)initWithDictionary:(id)a3
{
  return (GEORouteHypothesisRequest *)-[GEORouteHypothesisRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_33;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_33;
  }
  v6 = [v5 objectForKeyedSubscript:@"arrivalDate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 doubleValue];
    objc_msgSend(a1, "setArrivalDate:");
  }

  v7 = [v5 objectForKeyedSubscript:@"destinationLocation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [GEOMapItemStorage alloc];
    if (a3) {
      uint64_t v9 = [(GEOMapItemStorage *)v8 initWithJSON:v7];
    }
    else {
      uint64_t v9 = [(GEOMapItemStorage *)v8 initWithDictionary:v7];
    }
    uint64_t v10 = (void *)v9;
    [a1 setDestinationLocation:v9];
  }
  v11 = [v5 objectForKeyedSubscript:@"transportType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"TRANSIT"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"WALKING"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"BICYCLE"])
    {
      uint64_t v13 = 3;
    }
    else if ([v12 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v13 = 4;
    }
    else if ([v12 isEqualToString:@"FERRY"])
    {
      uint64_t v13 = 5;
    }
    else if ([v12 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v13 = 6;
    }
    else
    {
      uint64_t v13 = 0;
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_29:
    [a1 setTransportType:v13];
  }

  v14 = [v5 objectForKeyedSubscript:@"expirationDate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v14 doubleValue];
    objc_msgSend(a1, "setExpirationDate:");
  }

LABEL_33:
  return a1;
}

- (GEORouteHypothesisRequest)initWithJSON:(id)a3
{
  return (GEORouteHypothesisRequest *)-[GEORouteHypothesisRequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteHypothesisRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteHypothesisRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_destinationLocation) {
    PBDataWriterWriteSubmessage();
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOMapItemStorage *)self->_destinationLocation hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  v6 = a3;
  [(GEORouteHypothesisRequest *)self readAll:0];
  int v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
    v6[1] = *(void *)&self->_arrivalDate;
    *((unsigned char *)v6 + 36) |= 1u;
  }
  if (self->_destinationLocation)
  {
    objc_msgSend(v6, "setDestinationLocation:");
    int v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v4[8] = self->_transportType;
    *((unsigned char *)v4 + 36) |= 4u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_expirationDate;
    *((unsigned char *)v4 + 36) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 8) = self->_arrivalDate;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  id v7 = [(GEOMapItemStorage *)self->_destinationLocation copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_transportType;
    *(unsigned char *)(v6 + 36) |= 4u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(double *)(v6 + 24) = self->_expirationDate;
    *(unsigned char *)(v6 + 36) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEORouteHypothesisRequest *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 36);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_arrivalDate != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_19;
  }
  destinationLocation = self->_destinationLocation;
  if ((unint64_t)destinationLocation | *((void *)v4 + 2))
  {
    if (!-[GEOMapItemStorage isEqual:](destinationLocation, "isEqual:"))
    {
LABEL_19:
      BOOL v8 = 0;
      goto LABEL_20;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 36);
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_transportType != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_19;
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_expirationDate != *((double *)v4 + 3)) {
      goto LABEL_19;
    }
    BOOL v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  [(GEORouteHypothesisRequest *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    double arrivalDate = self->_arrivalDate;
    double v5 = -arrivalDate;
    if (arrivalDate >= 0.0) {
      double v5 = self->_arrivalDate;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  unint64_t v8 = [(GEOMapItemStorage *)self->_destinationLocation hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v9 = 2654435761 * self->_transportType;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v14 = 0;
    return v8 ^ v3 ^ v9 ^ v14;
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double expirationDate = self->_expirationDate;
  double v11 = -expirationDate;
  if (expirationDate >= 0.0) {
    double v11 = self->_expirationDate;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
  return v8 ^ v3 ^ v9 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v8 = (double *)a3;
  [v8 readAll:0];
  id v4 = v8;
  if (*((unsigned char *)v8 + 36))
  {
    self->_double arrivalDate = v8[1];
    *(unsigned char *)&self->_flags |= 1u;
  }
  destinationLocation = self->_destinationLocation;
  uint64_t v6 = *((void *)v8 + 2);
  if (destinationLocation)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOMapItemStorage mergeFrom:](destinationLocation, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORouteHypothesisRequest setDestinationLocation:](self, "setDestinationLocation:");
  }
  id v4 = v8;
LABEL_9:
  char v7 = *((unsigned char *)v4 + 36);
  if ((v7 & 4) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_flags |= 4u;
    char v7 = *((unsigned char *)v4 + 36);
  }
  if ((v7 & 2) != 0)
  {
    self->_double expirationDate = v4[3];
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
}

@end