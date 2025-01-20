@interface GEOChargeLocationDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)arrivedAtChargeLocation;
- (BOOL)hasArrivedAtChargeLocation;
- (BOOL)hasRoutePaused;
- (BOOL)hasRouteResumed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)routePaused;
- (BOOL)routeResumed;
- (GEOChargeLocationDetails)initWithDictionary:(id)a3;
- (GEOChargeLocationDetails)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArrivedAtChargeLocation:(BOOL)a3;
- (void)setHasArrivedAtChargeLocation:(BOOL)a3;
- (void)setHasRoutePaused:(BOOL)a3;
- (void)setHasRouteResumed:(BOOL)a3;
- (void)setRoutePaused:(BOOL)a3;
- (void)setRouteResumed:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOChargeLocationDetails

- (BOOL)arrivedAtChargeLocation
{
  return self->_arrivedAtChargeLocation;
}

- (void)setArrivedAtChargeLocation:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_arrivedAtChargeLocation = a3;
}

- (void)setHasArrivedAtChargeLocation:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasArrivedAtChargeLocation
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)routePaused
{
  return self->_routePaused;
}

- (void)setRoutePaused:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_routePaused = a3;
}

- (void)setHasRoutePaused:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRoutePaused
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)routeResumed
{
  return self->_routeResumed;
}

- (void)setRouteResumed:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_routeResumed = a3;
}

- (void)setHasRouteResumed:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasRouteResumed
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOChargeLocationDetails;
  v4 = [(GEOChargeLocationDetails *)&v8 description];
  v5 = [(GEOChargeLocationDetails *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOChargeLocationDetails _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_18;
  }
  [a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  unsigned __int8 v5 = a1[12];
  if ((v5 & 1) == 0)
  {
    if ((a1[12] & 2) == 0) {
      goto LABEL_4;
    }
LABEL_10:
    objc_super v8 = [NSNumber numberWithBool:a1[9]];
    if (a2) {
      v9 = @"routePaused";
    }
    else {
      v9 = @"route_paused";
    }
    [v4 setObject:v8 forKey:v9];

    if ((a1[12] & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  v6 = [NSNumber numberWithBool:a1[8]];
  if (a2) {
    v7 = @"arrivedAtChargeLocation";
  }
  else {
    v7 = @"arrived_at_charge_location";
  }
  [v4 setObject:v6 forKey:v7];

  unsigned __int8 v5 = a1[12];
  if ((v5 & 2) != 0) {
    goto LABEL_10;
  }
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_14:
    v10 = [NSNumber numberWithBool:a1[10]];
    if (a2) {
      v11 = @"routeResumed";
    }
    else {
      v11 = @"route_resumed";
    }
    [v4 setObject:v10 forKey:v11];
  }
LABEL_18:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOChargeLocationDetails _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOChargeLocationDetails)initWithDictionary:(id)a3
{
  return (GEOChargeLocationDetails *)-[GEOChargeLocationDetails _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"arrivedAtChargeLocation";
      }
      else {
        v6 = @"arrived_at_charge_location";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setArrivedAtChargeLocation:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"routePaused";
      }
      else {
        objc_super v8 = @"route_paused";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRoutePaused:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        v10 = @"routeResumed";
      }
      else {
        v10 = @"route_resumed";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRouteResumed:", objc_msgSend(v11, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOChargeLocationDetails)initWithJSON:(id)a3
{
  return (GEOChargeLocationDetails *)-[GEOChargeLocationDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOChargeLocationDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOChargeLocationDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOChargeLocationDetails *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[8] = self->_arrivedAtChargeLocation;
    v5[12] |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[9] = self->_routePaused;
  v5[12] |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    v5[10] = self->_routeResumed;
    v5[12] |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((unsigned char *)result + 8) = self->_arrivedAtChargeLocation;
    *((unsigned char *)result + 12) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 9) = self->_routePaused;
  *((unsigned char *)result + 12) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 10) = self->_routeResumed;
  *((unsigned char *)result + 12) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  [(GEOChargeLocationDetails *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[12] & 1) == 0) {
      goto LABEL_20;
    }
    if (self->_arrivedAtChargeLocation)
    {
      if (!v4[8]) {
        goto LABEL_20;
      }
    }
    else if (v4[8])
    {
      goto LABEL_20;
    }
  }
  else if (v4[12])
  {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[12] & 2) == 0) {
      goto LABEL_20;
    }
    if (self->_routePaused)
    {
      if (!v4[9]) {
        goto LABEL_20;
      }
    }
    else if (v4[9])
    {
      goto LABEL_20;
    }
  }
  else if ((v4[12] & 2) != 0)
  {
    goto LABEL_20;
  }
  BOOL v5 = (v4[12] & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v4[12] & 4) != 0)
    {
      if (self->_routeResumed)
      {
        if (!v4[10]) {
          goto LABEL_20;
        }
      }
      else if (v4[10])
      {
        goto LABEL_20;
      }
      BOOL v5 = 1;
      goto LABEL_21;
    }
LABEL_20:
    BOOL v5 = 0;
  }
LABEL_21:

  return v5;
}

- (unint64_t)hash
{
  [(GEOChargeLocationDetails *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_arrivedAtChargeLocation;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_routePaused;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_routeResumed;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (BOOL *)a3;
  [v5 readAll:0];
  BOOL v4 = v5[12];
  if (v4)
  {
    self->_arrivedAtChargeLocation = v5[8];
    *(unsigned char *)&self->_flags |= 1u;
    BOOL v4 = v5[12];
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5[12] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_routePaused = v5[9];
  *(unsigned char *)&self->_flags |= 2u;
  if ((v5[12] & 4) != 0)
  {
LABEL_4:
    self->_routeResumed = v5[10];
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_5:
}

@end