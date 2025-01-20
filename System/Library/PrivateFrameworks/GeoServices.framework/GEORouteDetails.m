@interface GEORouteDetails
+ (BOOL)isValid:(id)a3;
+ (id)routeDetailsWithResultIndex:(int)a3;
+ (id)routeDetailsWithResultIndex:(int)a3 stepID:(int)a4;
+ (id)routeDetailsWithResultIndex:(int)a3 stepID:(int)a4 nearRoute:(BOOL)a5 nearCurrentlyDisplayedStep:(BOOL)a6 userTrackingOn:(BOOL)a7 timeSinceResponse:(double)a8;
- (BOOL)hasIsNearCurrentlyDisplayedStep;
- (BOOL)hasIsNearRoute;
- (BOOL)hasIsUserTrackingOn;
- (BOOL)hasResultIndex;
- (BOOL)hasStepID;
- (BOOL)hasTimeSinceRouteResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNearCurrentlyDisplayedStep;
- (BOOL)isNearRoute;
- (BOOL)isUserTrackingOn;
- (BOOL)readFrom:(id)a3;
- (GEORouteDetails)initWithDictionary:(id)a3;
- (GEORouteDetails)initWithJSON:(id)a3;
- (GEORouteDetails)initWithResultIndex:(int)a3;
- (double)timeSinceRouteResponse;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)resultIndex;
- (unint64_t)hash;
- (unsigned)stepID;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsNearCurrentlyDisplayedStep:(BOOL)a3;
- (void)setHasIsNearRoute:(BOOL)a3;
- (void)setHasIsUserTrackingOn:(BOOL)a3;
- (void)setHasResultIndex:(BOOL)a3;
- (void)setHasStepID:(BOOL)a3;
- (void)setHasTimeSinceRouteResponse:(BOOL)a3;
- (void)setIsNearCurrentlyDisplayedStep:(BOOL)a3;
- (void)setIsNearRoute:(BOOL)a3;
- (void)setIsUserTrackingOn:(BOOL)a3;
- (void)setResultIndex:(int)a3;
- (void)setStepID:(unsigned int)a3;
- (void)setTimeSinceRouteResponse:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORouteDetails

- (void)setHasTimeSinceRouteResponse:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (GEORouteDetails)initWithResultIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)GEORouteDetails;
  v4 = [(GEORouteDetails *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if ((v3 & 0x80000000) == 0) {
      [(GEORouteDetails *)v4 setResultIndex:v3];
    }
    v6 = v5;
  }

  return v5;
}

+ (id)routeDetailsWithResultIndex:(int)a3
{
  if (a3 < 0)
  {
    v4 = 0;
  }
  else
  {
    v4 = [[GEORouteDetails alloc] initWithResultIndex:*(void *)&a3];
  }
  return v4;
}

+ (id)routeDetailsWithResultIndex:(int)a3 stepID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v5 = [a1 routeDetailsWithResultIndex:*(void *)&a3];
  v6 = v5;
  if ((v4 & 0x80000000) == 0) {
    [v5 setStepID:v4];
  }

  return v6;
}

+ (id)routeDetailsWithResultIndex:(int)a3 stepID:(int)a4 nearRoute:(BOOL)a5 nearCurrentlyDisplayedStep:(BOOL)a6 userTrackingOn:(BOOL)a7 timeSinceResponse:(double)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  v12 = [a1 routeDetailsWithResultIndex:*(void *)&a3 stepID:*(void *)&a4];
  v13 = v12;
  if (v11)
  {
    [v12 setIsNearRoute:1];
    if (!v10)
    {
LABEL_3:
      if (!v9) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!v10)
  {
    goto LABEL_3;
  }
  [v13 setIsNearCurrentlyDisplayedStep:1];
  if (v9) {
LABEL_4:
  }
    [v13 setIsUserTrackingOn:1];
LABEL_5:
  if (a8 > 0.0) {
    [v13 setTimeSinceRouteResponse:a8];
  }

  return v13;
}

- (int)resultIndex
{
  return self->_resultIndex;
}

- (void)setResultIndex:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_resultIndex = a3;
}

- (void)setHasResultIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasResultIndex
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasStepID
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)isNearRoute
{
  return self->_isNearRoute;
}

- (void)setIsNearRoute:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_isNearRoute = a3;
}

- (void)setHasIsNearRoute:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIsNearRoute
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (BOOL)isNearCurrentlyDisplayedStep
{
  return self->_isNearCurrentlyDisplayedStep;
}

- (void)setIsNearCurrentlyDisplayedStep:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_isNearCurrentlyDisplayedStep = a3;
}

- (void)setHasIsNearCurrentlyDisplayedStep:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsNearCurrentlyDisplayedStep
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)isUserTrackingOn
{
  return self->_isUserTrackingOn;
}

- (void)setIsUserTrackingOn:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_isUserTrackingOn = a3;
}

- (void)setHasIsUserTrackingOn:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasIsUserTrackingOn
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (double)timeSinceRouteResponse
{
  return self->_timeSinceRouteResponse;
}

- (void)setTimeSinceRouteResponse:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_timeSinceRouteResponse = a3;
}

- (BOOL)hasTimeSinceRouteResponse
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORouteDetails;
  uint64_t v4 = [(GEORouteDetails *)&v8 description];
  v5 = [(GEORouteDetails *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v2 = 0;
    goto LABEL_15;
  }
  [(id)a1 readAll:1];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  char v3 = *(unsigned char *)(a1 + 28);
  if ((v3 & 2) != 0)
  {
    uint64_t v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
    [v2 setObject:v4 forKey:@"resultIndex"];

    char v3 = *(unsigned char *)(a1 + 28);
  }
  if ((v3 & 4) != 0)
  {
    v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
    [v2 setObject:v5 forKey:@"stepID"];

    char v3 = *(unsigned char *)(a1 + 28);
    if ((v3 & 0x10) == 0)
    {
LABEL_6:
      if ((v3 & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else if ((v3 & 0x10) == 0)
  {
    goto LABEL_6;
  }
  v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 25)];
  [v2 setObject:v6 forKey:@"isNearRoute"];

  char v3 = *(unsigned char *)(a1 + 28);
  if ((v3 & 8) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
LABEL_13:
    objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 26)];
    [v2 setObject:v8 forKey:@"isUserTrackingOn"];

    if ((*(unsigned char *)(a1 + 28) & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_12:
  v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
  [v2 setObject:v7 forKey:@"isNearCurrentlyDisplayedStep"];

  char v3 = *(unsigned char *)(a1 + 28);
  if ((v3 & 0x20) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if (v3)
  {
LABEL_14:
    BOOL v9 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
    [v2 setObject:v9 forKey:@"timeSinceRouteResponse"];
  }
LABEL_15:

  return v2;
}

- (GEORouteDetails)initWithDictionary:(id)a3
{
  return (GEORouteDetails *)-[GEORouteDetails _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      uint64_t v4 = [v3 objectForKeyedSubscript:@"resultIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setResultIndex:", objc_msgSend(v4, "intValue"));
      }

      v5 = [v3 objectForKeyedSubscript:@"stepID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStepID:", objc_msgSend(v5, "unsignedIntValue"));
      }

      v6 = [v3 objectForKeyedSubscript:@"isNearRoute"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsNearRoute:", objc_msgSend(v6, "BOOLValue"));
      }

      v7 = [v3 objectForKeyedSubscript:@"isNearCurrentlyDisplayedStep"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsNearCurrentlyDisplayedStep:", objc_msgSend(v7, "BOOLValue"));
      }

      objc_super v8 = [v3 objectForKeyedSubscript:@"isUserTrackingOn"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsUserTrackingOn:", objc_msgSend(v8, "BOOLValue"));
      }

      BOOL v9 = [v3 objectForKeyedSubscript:@"timeSinceRouteResponse"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        objc_msgSend(a1, "setTimeSinceRouteResponse:");
      }
    }
  }

  return a1;
}

- (GEORouteDetails)initWithJSON:(id)a3
{
  return (GEORouteDetails *)-[GEORouteDetails _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_flags) {
LABEL_7:
  }
    PBDataWriterWriteDoubleField();
LABEL_8:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORouteDetails *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[4] = self->_resultIndex;
    *((unsigned char *)v5 + 28) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = self->_stepID;
  *((unsigned char *)v5 + 28) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)v5 + 25) = self->_isNearRoute;
  *((unsigned char *)v5 + 28) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)v5 + 24) = self->_isNearCurrentlyDisplayedStep;
  *((unsigned char *)v5 + 28) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((unsigned char *)v5 + 26) = self->_isUserTrackingOn;
  *((unsigned char *)v5 + 28) |= 0x20u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_7:
    *((void *)v5 + 1) = *(void *)&self->_timeSinceRouteResponse;
    *((unsigned char *)v5 + 28) |= 1u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_resultIndex;
    *((unsigned char *)result + 28) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_stepID;
  *((unsigned char *)result + 28) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)result + 25) = self->_isNearRoute;
  *((unsigned char *)result + 28) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)result + 24) = self->_isNearCurrentlyDisplayedStep;
  *((unsigned char *)result + 28) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((unsigned char *)result + 26) = self->_isUserTrackingOn;
  *((unsigned char *)result + 28) |= 0x20u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_7:
  *((void *)result + 1) = *(void *)&self->_timeSinceRouteResponse;
  *((unsigned char *)result + 28) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  [(GEORouteDetails *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_resultIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_stepID != *((_DWORD *)v4 + 5)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 0x10) == 0) {
      goto LABEL_40;
    }
    if (self->_isNearRoute)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) == 0) {
      goto LABEL_40;
    }
    if (self->_isNearCurrentlyDisplayedStep)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 0x20) != 0)
    {
      if (self->_isUserTrackingOn)
      {
        if (!*((unsigned char *)v4 + 26)) {
          goto LABEL_40;
        }
        goto LABEL_36;
      }
      if (!*((unsigned char *)v4 + 26)) {
        goto LABEL_36;
      }
    }
LABEL_40:
    BOOL v5 = 0;
    goto LABEL_41;
  }
  if ((*((unsigned char *)v4 + 28) & 0x20) != 0) {
    goto LABEL_40;
  }
LABEL_36:
  BOOL v5 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_timeSinceRouteResponse != *((double *)v4 + 1)) {
      goto LABEL_40;
    }
    BOOL v5 = 1;
  }
LABEL_41:

  return v5;
}

- (unint64_t)hash
{
  [(GEORouteDetails *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_resultIndex;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_stepID;
      if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_isNearRoute;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_isNearCurrentlyDisplayedStep;
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      goto LABEL_6;
    }
LABEL_15:
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_7;
    }
LABEL_16:
    unint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_isUserTrackingOn;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_16;
  }
LABEL_7:
  double timeSinceRouteResponse = self->_timeSinceRouteResponse;
  double v9 = -timeSinceRouteResponse;
  if (timeSinceRouteResponse >= 0.0) {
    double v9 = self->_timeSinceRouteResponse;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 2) != 0)
  {
    self->_resultIndex = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 28);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v5 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_stepID = *((_DWORD *)v5 + 5);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 0x10) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_isNearRoute = *((unsigned char *)v5 + 25);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_isNearCurrentlyDisplayedStep = *((unsigned char *)v5 + 24);
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 0x20) == 0)
  {
LABEL_6:
    if ((v4 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_isUserTrackingOn = *((unsigned char *)v5 + 26);
  *(unsigned char *)&self->_flags |= 0x20u;
  if (*((unsigned char *)v5 + 28))
  {
LABEL_7:
    self->_double timeSinceRouteResponse = *((double *)v5 + 1);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_8:
}

@end