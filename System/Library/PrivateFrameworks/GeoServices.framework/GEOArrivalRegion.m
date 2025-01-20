@interface GEOArrivalRegion
+ (BOOL)isValid:(id)a3;
- (BOOL)hasArrivalRegion;
- (BOOL)hasArrivalRegionAction;
- (BOOL)hasEndNavigationTimeoutThreshold;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasRouteEndDistanceThresholdCm;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOArrivalRegion)initWithDictionary:(id)a3;
- (GEOArrivalRegion)initWithJSON:(id)a3;
- (GEOMapRegion)arrivalRegion;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)arrivalRegionActionAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsArrivalRegionAction:(id)a3;
- (int)arrivalRegionAction;
- (unint64_t)hash;
- (unsigned)endNavigationTimeoutThreshold;
- (unsigned)routeEndDistanceThresholdCm;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArrivalRegion:(id)a3;
- (void)setArrivalRegionAction:(int)a3;
- (void)setEndNavigationTimeoutThreshold:(unsigned int)a3;
- (void)setHasArrivalRegionAction:(BOOL)a3;
- (void)setHasEndNavigationTimeoutThreshold:(BOOL)a3;
- (void)setHasRouteEndDistanceThresholdCm:(BOOL)a3;
- (void)setRouteEndDistanceThresholdCm:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOArrivalRegion

- (BOOL)hasArrivalRegion
{
  return self->_arrivalRegion != 0;
}

- (GEOMapRegion)arrivalRegion
{
  return self->_arrivalRegion;
}

- (void)setArrivalRegion:(id)a3
{
}

- (int)arrivalRegionAction
{
  if (*(unsigned char *)&self->_flags) {
    return self->_arrivalRegionAction;
  }
  else {
    return 1;
  }
}

- (void)setArrivalRegionAction:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_arrivalRegionAction = a3;
}

- (void)setHasArrivalRegionAction:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasArrivalRegionAction
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)arrivalRegionActionAsString:(int)a3
{
  if ((a3 - 1) >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53DFF10[a3 - 1];
  }

  return v3;
}

- (int)StringAsArrivalRegionAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NO_ACTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ISSUE_ARRIVAL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ISSUE_ARRIVAL_OFF_ROUTE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"END_NAVIGATION_TIMEOUT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PRE_ARRIVAL_MODE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PARKING_SUGGEST_WALKING"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"INITIATE_APPROACHING"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PREPARE_TO_PARK"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (unsigned)endNavigationTimeoutThreshold
{
  return self->_endNavigationTimeoutThreshold;
}

- (void)setEndNavigationTimeoutThreshold:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_endNavigationTimeoutThreshold = a3;
}

- (void)setHasEndNavigationTimeoutThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasEndNavigationTimeoutThreshold
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)routeEndDistanceThresholdCm
{
  return self->_routeEndDistanceThresholdCm;
}

- (void)setRouteEndDistanceThresholdCm:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_routeEndDistanceThresholdCm = a3;
}

- (void)setHasRouteEndDistanceThresholdCm:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasRouteEndDistanceThresholdCm
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOArrivalRegion;
  int v4 = [(GEOArrivalRegion *)&v8 description];
  v5 = [(GEOArrivalRegion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOArrivalRegion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 arrivalRegion];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"arrivalRegion";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"arrival_region";
      }
      [v4 setObject:v7 forKey:v8];
    }
    char v9 = *(unsigned char *)(a1 + 36);
    if (v9)
    {
      unsigned int v10 = *(_DWORD *)(a1 + 24) - 1;
      if (v10 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 24));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E53DFF10[v10];
      }
      if (a2) {
        v12 = @"arrivalRegionAction";
      }
      else {
        v12 = @"arrival_region_action";
      }
      [v4 setObject:v11 forKey:v12];

      char v9 = *(unsigned char *)(a1 + 36);
    }
    if ((v9 & 2) != 0)
    {
      v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
      if (a2) {
        v14 = @"endNavigationTimeoutThreshold";
      }
      else {
        v14 = @"end_navigation_timeout_threshold";
      }
      [v4 setObject:v13 forKey:v14];

      char v9 = *(unsigned char *)(a1 + 36);
    }
    if ((v9 & 4) != 0)
    {
      v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
      if (a2) {
        v16 = @"routeEndDistanceThresholdCm";
      }
      else {
        v16 = @"route_end_distance_threshold_cm";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = *(void **)(a1 + 8);
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __46__GEOArrivalRegion__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
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
  return -[GEOArrivalRegion _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOArrivalRegion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    char v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOArrivalRegion)initWithDictionary:(id)a3
{
  return (GEOArrivalRegion *)-[GEOArrivalRegion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_47;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_47;
  }
  if (a3) {
    v6 = @"arrivalRegion";
  }
  else {
    v6 = @"arrival_region";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [GEOMapRegion alloc];
    if (a3) {
      uint64_t v9 = [(GEOMapRegion *)v8 initWithJSON:v7];
    }
    else {
      uint64_t v9 = [(GEOMapRegion *)v8 initWithDictionary:v7];
    }
    id v10 = (void *)v9;
    [a1 setArrivalRegion:v9];
  }
  if (a3) {
    v11 = @"arrivalRegionAction";
  }
  else {
    v11 = @"arrival_region_action";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;
    if ([v13 isEqualToString:@"NO_ACTION"])
    {
      uint64_t v14 = 1;
    }
    else if ([v13 isEqualToString:@"ISSUE_ARRIVAL"])
    {
      uint64_t v14 = 2;
    }
    else if ([v13 isEqualToString:@"ISSUE_ARRIVAL_OFF_ROUTE"])
    {
      uint64_t v14 = 3;
    }
    else if ([v13 isEqualToString:@"END_NAVIGATION_TIMEOUT"])
    {
      uint64_t v14 = 4;
    }
    else if ([v13 isEqualToString:@"PRE_ARRIVAL_MODE"])
    {
      uint64_t v14 = 5;
    }
    else if ([v13 isEqualToString:@"PARKING_SUGGEST_WALKING"])
    {
      uint64_t v14 = 6;
    }
    else if ([v13 isEqualToString:@"INITIATE_APPROACHING"])
    {
      uint64_t v14 = 7;
    }
    else if ([v13 isEqualToString:@"PREPARE_TO_PARK"])
    {
      uint64_t v14 = 8;
    }
    else
    {
      uint64_t v14 = 1;
    }

    goto LABEL_35;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v12 intValue];
LABEL_35:
    [a1 setArrivalRegionAction:v14];
  }

  if (a3) {
    v15 = @"endNavigationTimeoutThreshold";
  }
  else {
    v15 = @"end_navigation_timeout_threshold";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEndNavigationTimeoutThreshold:", objc_msgSend(v16, "unsignedIntValue"));
  }

  if (a3) {
    v17 = @"routeEndDistanceThresholdCm";
  }
  else {
    v17 = @"route_end_distance_threshold_cm";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRouteEndDistanceThresholdCm:", objc_msgSend(v18, "unsignedIntValue"));
  }

LABEL_47:
  return a1;
}

- (GEOArrivalRegion)initWithJSON:(id)a3
{
  return (GEOArrivalRegion *)-[GEOArrivalRegion _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOArrivalRegionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOArrivalRegionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_arrivalRegion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_5:
      if ((flags & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_7:
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOMapRegion *)self->_arrivalRegion hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOArrivalRegion *)self readAll:0];
  if (self->_arrivalRegion) {
    objc_msgSend(v5, "setArrivalRegion:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v5 + 6) = self->_arrivalRegionAction;
    *((unsigned char *)v5 + 36) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_5:
      if ((flags & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 7) = self->_endNavigationTimeoutThreshold;
  *((unsigned char *)v5 + 36) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 8) = self->_routeEndDistanceThresholdCm;
    *((unsigned char *)v5 + 36) |= 4u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOMapRegion *)self->_arrivalRegion copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 28) = self->_endNavigationTimeoutThreshold;
    *(unsigned char *)(v5 + 36) |= 2u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 24) = self->_arrivalRegionAction;
  *(unsigned char *)(v5 + 36) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 32) = self->_routeEndDistanceThresholdCm;
    *(unsigned char *)(v5 + 36) |= 4u;
  }
LABEL_5:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEOArrivalRegion *)self readAll:1];
  [v4 readAll:1];
  arrivalRegion = self->_arrivalRegion;
  if ((unint64_t)arrivalRegion | *((void *)v4 + 2))
  {
    if (!-[GEOMapRegion isEqual:](arrivalRegion, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_arrivalRegionAction != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_endNavigationTimeoutThreshold != *((_DWORD *)v4 + 7)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 36) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_routeEndDistanceThresholdCm != *((_DWORD *)v4 + 8)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  [(GEOArrivalRegion *)self readAll:1];
  unint64_t v3 = [(GEOMapRegion *)self->_arrivalRegion hash];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_arrivalRegionAction;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_endNavigationTimeoutThreshold;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_routeEndDistanceThresholdCm;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  [v7 readAll:0];
  arrivalRegion = self->_arrivalRegion;
  uint64_t v5 = *((void *)v7 + 2);
  if (arrivalRegion)
  {
    if (v5) {
      -[GEOMapRegion mergeFrom:](arrivalRegion, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOArrivalRegion setArrivalRegion:](self, "setArrivalRegion:");
  }
  char v6 = *((unsigned char *)v7 + 36);
  if (v6)
  {
    self->_arrivalRegionAction = *((_DWORD *)v7 + 6);
    *(unsigned char *)&self->_flags |= 1u;
    char v6 = *((unsigned char *)v7 + 36);
    if ((v6 & 2) == 0)
    {
LABEL_8:
      if ((v6 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)v7 + 36) & 2) == 0)
  {
    goto LABEL_8;
  }
  self->_endNavigationTimeoutThreshold = *((_DWORD *)v7 + 7);
  *(unsigned char *)&self->_flags |= 2u;
  if ((*((unsigned char *)v7 + 36) & 4) != 0)
  {
LABEL_9:
    self->_routeEndDistanceThresholdCm = *((_DWORD *)v7 + 8);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_10:
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOArrivalRegion *)self readAll:0];
    arrivalRegion = self->_arrivalRegion;
    [(GEOMapRegion *)arrivalRegion clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalRegion, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end