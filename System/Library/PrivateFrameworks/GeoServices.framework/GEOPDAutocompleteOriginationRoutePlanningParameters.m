@interface GEOPDAutocompleteOriginationRoutePlanningParameters
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsEditServerRecommendedStop;
- (BOOL)hasIsRoutePlanningEditStopFillRequest;
- (BOOL)hasPreviousLocation;
- (BOOL)isEditServerRecommendedStop;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRoutePlanningEditStopFillRequest;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)previousLocation;
- (GEOPDAutocompleteOriginationRoutePlanningParameters)initWithDictionary:(id)a3;
- (GEOPDAutocompleteOriginationRoutePlanningParameters)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsEditServerRecommendedStop:(BOOL)a3;
- (void)setHasIsRoutePlanningEditStopFillRequest:(BOOL)a3;
- (void)setIsEditServerRecommendedStop:(BOOL)a3;
- (void)setIsRoutePlanningEditStopFillRequest:(BOOL)a3;
- (void)setPreviousLocation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteOriginationRoutePlanningParameters

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"previousLocation";
      }
      else {
        v6 = @"previous_location";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v9 = [(GEOLatLng *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOLatLng *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setPreviousLocation:v9];
      }
      if (a3) {
        v11 = @"isEditServerRecommendedStop";
      }
      else {
        v11 = @"is_edit_server_recommended_stop";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsEditServerRecommendedStop:", objc_msgSend(v12, "BOOLValue"));
      }

      if (a3) {
        v13 = @"isRoutePlanningEditStopFillRequest";
      }
      else {
        v13 = @"is_route_planning_edit_stop_fill_request";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsRoutePlanningEditStopFillRequest:", objc_msgSend(v14, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (BOOL)hasPreviousLocation
{
  return self->_previousLocation != 0;
}

- (GEOLatLng)previousLocation
{
  return self->_previousLocation;
}

- (void)setPreviousLocation:(id)a3
{
}

- (BOOL)isEditServerRecommendedStop
{
  return self->_isEditServerRecommendedStop;
}

- (void)setIsEditServerRecommendedStop:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_isEditServerRecommendedStop = a3;
}

- (void)setHasIsEditServerRecommendedStop:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIsEditServerRecommendedStop
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)isRoutePlanningEditStopFillRequest
{
  return self->_isRoutePlanningEditStopFillRequest;
}

- (void)setIsRoutePlanningEditStopFillRequest:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_isRoutePlanningEditStopFillRequest = a3;
}

- (void)setHasIsRoutePlanningEditStopFillRequest:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsRoutePlanningEditStopFillRequest
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompleteOriginationRoutePlanningParameters;
  v4 = [(GEOPDAutocompleteOriginationRoutePlanningParameters *)&v8 description];
  id v5 = [(GEOPDAutocompleteOriginationRoutePlanningParameters *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteOriginationRoutePlanningParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 previousLocation];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"previousLocation";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"previous_location";
      }
      [v4 setObject:v7 forKey:v8];
    }
    char v9 = *(unsigned char *)(a1 + 28);
    if (v9)
    {
      v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
      if (a2) {
        v11 = @"isEditServerRecommendedStop";
      }
      else {
        v11 = @"is_edit_server_recommended_stop";
      }
      [v4 setObject:v10 forKey:v11];

      char v9 = *(unsigned char *)(a1 + 28);
    }
    if ((v9 & 2) != 0)
    {
      v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 25)];
      if (a2) {
        v13 = @"isRoutePlanningEditStopFillRequest";
      }
      else {
        v13 = @"is_route_planning_edit_stop_fill_request";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __81__GEOPDAutocompleteOriginationRoutePlanningParameters__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEOPDAutocompleteOriginationRoutePlanningParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __81__GEOPDAutocompleteOriginationRoutePlanningParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteOriginationRoutePlanningParameters)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteOriginationRoutePlanningParameters *)-[GEOPDAutocompleteOriginationRoutePlanningParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOPDAutocompleteOriginationRoutePlanningParameters)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteOriginationRoutePlanningParameters *)-[GEOPDAutocompleteOriginationRoutePlanningParameters _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteOriginationRoutePlanningParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteOriginationRoutePlanningParametersReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_previousLocation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOLatLng *)self->_previousLocation hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPDAutocompleteOriginationRoutePlanningParameters *)self readAll:0];
  if (self->_previousLocation) {
    objc_msgSend(v5, "setPreviousLocation:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[24] = self->_isEditServerRecommendedStop;
    v5[28] |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[25] = self->_isRoutePlanningEditStopFillRequest;
    v5[28] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOLatLng *)self->_previousLocation copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(unsigned char *)(v5 + 24) = self->_isEditServerRecommendedStop;
    *(unsigned char *)(v5 + 28) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 25) = self->_isRoutePlanningEditStopFillRequest;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOPDAutocompleteOriginationRoutePlanningParameters *)self readAll:1];
  [v4 readAll:1];
  previousLocation = self->_previousLocation;
  if ((unint64_t)previousLocation | *((void *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](previousLocation, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0) {
      goto LABEL_14;
    }
    if (self->_isEditServerRecommendedStop)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) != 0)
    {
      if (self->_isRoutePlanningEditStopFillRequest)
      {
        if (!*((unsigned char *)v4 + 25)) {
          goto LABEL_14;
        }
      }
      else if (*((unsigned char *)v4 + 25))
      {
        goto LABEL_14;
      }
      BOOL v6 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v6 = 0;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPDAutocompleteOriginationRoutePlanningParameters *)self readAll:1];
  unint64_t v3 = [(GEOLatLng *)self->_previousLocation hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v4 = 2654435761 * self->_isEditServerRecommendedStop;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isRoutePlanningEditStopFillRequest;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  v7 = (BOOL *)a3;
  [v7 readAll:0];
  previousLocation = self->_previousLocation;
  uint64_t v5 = *((void *)v7 + 2);
  if (previousLocation)
  {
    if (v5) {
      -[GEOLatLng mergeFrom:](previousLocation, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOPDAutocompleteOriginationRoutePlanningParameters setPreviousLocation:](self, "setPreviousLocation:");
  }
  BOOL v6 = v7[28];
  if (v6)
  {
    self->_isEditServerRecommendedStop = v7[24];
    *(unsigned char *)&self->_flags |= 1u;
    BOOL v6 = v7[28];
  }
  if ((v6 & 2) != 0)
  {
    self->_isRoutePlanningEditStopFillRequest = v7[25];
    *(unsigned char *)&self->_flags |= 2u;
  }
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
    [(GEOPDAutocompleteOriginationRoutePlanningParameters *)self readAll:0];
    previousLocation = self->_previousLocation;
    [(GEOLatLng *)previousLocation clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousLocation, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end