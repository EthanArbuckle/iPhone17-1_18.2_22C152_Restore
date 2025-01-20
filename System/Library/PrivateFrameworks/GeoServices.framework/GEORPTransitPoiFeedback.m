@interface GEORPTransitPoiFeedback
+ (BOOL)isValid:(id)a3;
+ (Class)directionsRequestType;
+ (Class)directionsResponseType;
- (BOOL)hasCorrectionType;
- (BOOL)hasCorrections;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasPlace;
- (BOOL)hasPlaceRequest;
- (BOOL)hasTransitLineTileInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlace)place;
- (GEOPDPlaceRequest)placeRequest;
- (GEORPTransitLineTileInfo)transitLineTileInfo;
- (GEORPTransitPoiCorrections)corrections;
- (GEORPTransitPoiFeedback)init;
- (GEORPTransitPoiFeedback)initWithData:(id)a3;
- (GEORPTransitPoiFeedback)initWithDictionary:(id)a3;
- (GEORPTransitPoiFeedback)initWithJSON:(id)a3;
- (NSMutableArray)directionsRequests;
- (NSMutableArray)directionsResponses;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)correctionTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)directionsRequestAtIndex:(unint64_t)a3;
- (id)directionsResponseAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (int)StringAsCorrectionType:(id)a3;
- (int)correctionType;
- (unint64_t)directionsRequestsCount;
- (unint64_t)directionsResponsesCount;
- (unint64_t)hash;
- (void)_addNoFlagsDirectionsRequest:(uint64_t)a1;
- (void)_addNoFlagsDirectionsResponse:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCorrections;
- (void)_readDirectionsRequests;
- (void)_readDirectionsResponses;
- (void)_readPlace;
- (void)_readPlaceRequest;
- (void)_readTransitLineTileInfo;
- (void)addDirectionsRequest:(id)a3;
- (void)addDirectionsResponse:(id)a3;
- (void)clearDirectionsRequests;
- (void)clearDirectionsResponses;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCorrectionType:(int)a3;
- (void)setCorrections:(id)a3;
- (void)setDirectionsRequests:(id)a3;
- (void)setDirectionsResponses:(id)a3;
- (void)setHasCorrectionType:(BOOL)a3;
- (void)setPlace:(id)a3;
- (void)setPlaceRequest:(id)a3;
- (void)setTransitLineTileInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPTransitPoiFeedback

- (GEORPTransitPoiFeedback)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPTransitPoiFeedback;
  v2 = [(GEORPTransitPoiFeedback *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPTransitPoiFeedback)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPTransitPoiFeedback;
  v3 = [(GEORPTransitPoiFeedback *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)correctionType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_correctionType;
  }
  else {
    return 0;
  }
}

- (void)setCorrectionType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_correctionType = a3;
}

- (void)setHasCorrectionType:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasCorrectionType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)correctionTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53DBDD0[a3];
  }

  return v3;
}

- (int)StringAsCorrectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TRANSIT_POI_CORRECTION_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT_POI_CORRECTION_TYPE_STATION_EDIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRANSIT_POI_CORRECTION_TYPE_LINE_EDIT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRANSIT_POI_CORRECTION_TYPE_OTHER"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readCorrections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrections_tags_3802);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasCorrections
{
  return self->_corrections != 0;
}

- (GEORPTransitPoiCorrections)corrections
{
  -[GEORPTransitPoiFeedback _readCorrections]((uint64_t)self);
  corrections = self->_corrections;

  return corrections;
}

- (void)setCorrections:(id)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  objc_storeStrong((id *)&self->_corrections, a3);
}

- (void)_readPlace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlace_tags_3803);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPlace
{
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEORPTransitPoiFeedback _readPlace]((uint64_t)self);
  place = self->_place;

  return place;
}

- (void)setPlace:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (void)_readTransitLineTileInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitLineTileInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTransitLineTileInfo
{
  return self->_transitLineTileInfo != 0;
}

- (GEORPTransitLineTileInfo)transitLineTileInfo
{
  -[GEORPTransitPoiFeedback _readTransitLineTileInfo]((uint64_t)self);
  transitLineTileInfo = self->_transitLineTileInfo;

  return transitLineTileInfo;
}

- (void)setTransitLineTileInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_transitLineTileInfo, a3);
}

- (void)_readPlaceRequest
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceRequest_tags_3804);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPlaceRequest
{
  return self->_placeRequest != 0;
}

- (GEOPDPlaceRequest)placeRequest
{
  -[GEORPTransitPoiFeedback _readPlaceRequest]((uint64_t)self);
  placeRequest = self->_placeRequest;

  return placeRequest;
}

- (void)setPlaceRequest:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_placeRequest, a3);
}

- (void)_readDirectionsRequests
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsRequests_tags_3805);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)directionsRequests
{
  -[GEORPTransitPoiFeedback _readDirectionsRequests]((uint64_t)self);
  directionsRequests = self->_directionsRequests;

  return directionsRequests;
}

- (void)setDirectionsRequests:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  directionsRequests = self->_directionsRequests;
  self->_directionsRequests = v4;
}

- (void)clearDirectionsRequests
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  directionsRequests = self->_directionsRequests;

  [(NSMutableArray *)directionsRequests removeAllObjects];
}

- (void)addDirectionsRequest:(id)a3
{
  id v4 = a3;
  -[GEORPTransitPoiFeedback _readDirectionsRequests]((uint64_t)self);
  -[GEORPTransitPoiFeedback _addNoFlagsDirectionsRequest:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsDirectionsRequest:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)directionsRequestsCount
{
  -[GEORPTransitPoiFeedback _readDirectionsRequests]((uint64_t)self);
  directionsRequests = self->_directionsRequests;

  return [(NSMutableArray *)directionsRequests count];
}

- (id)directionsRequestAtIndex:(unint64_t)a3
{
  -[GEORPTransitPoiFeedback _readDirectionsRequests]((uint64_t)self);
  directionsRequests = self->_directionsRequests;

  return (id)[(NSMutableArray *)directionsRequests objectAtIndex:a3];
}

+ (Class)directionsRequestType
{
  return (Class)objc_opt_class();
}

- (void)_readDirectionsResponses
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsResponses_tags_3806);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)directionsResponses
{
  -[GEORPTransitPoiFeedback _readDirectionsResponses]((uint64_t)self);
  directionsResponses = self->_directionsResponses;

  return directionsResponses;
}

- (void)setDirectionsResponses:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  directionsResponses = self->_directionsResponses;
  self->_directionsResponses = v4;
}

- (void)clearDirectionsResponses
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  directionsResponses = self->_directionsResponses;

  [(NSMutableArray *)directionsResponses removeAllObjects];
}

- (void)addDirectionsResponse:(id)a3
{
  id v4 = a3;
  -[GEORPTransitPoiFeedback _readDirectionsResponses]((uint64_t)self);
  -[GEORPTransitPoiFeedback _addNoFlagsDirectionsResponse:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsDirectionsResponse:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)directionsResponsesCount
{
  -[GEORPTransitPoiFeedback _readDirectionsResponses]((uint64_t)self);
  directionsResponses = self->_directionsResponses;

  return [(NSMutableArray *)directionsResponses count];
}

- (id)directionsResponseAtIndex:(unint64_t)a3
{
  -[GEORPTransitPoiFeedback _readDirectionsResponses]((uint64_t)self);
  directionsResponses = self->_directionsResponses;

  return (id)[(NSMutableArray *)directionsResponses objectAtIndex:a3];
}

+ (Class)directionsResponseType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPTransitPoiFeedback;
  id v4 = [(GEORPTransitPoiFeedback *)&v8 description];
  id v5 = [(GEORPTransitPoiFeedback *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPTransitPoiFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(_WORD *)(a1 + 88))
    {
      uint64_t v5 = *(int *)(a1 + 84);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53DBDD0[v5];
      }
      if (a2) {
        id v7 = @"correctionType";
      }
      else {
        id v7 = @"correction_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 corrections];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"corrections"];
    }
    v11 = [(id)a1 place];
    v12 = v11;
    if (v11)
    {
      if (a2) {
        [v11 jsonRepresentation];
      }
      else {
      v13 = [v11 dictionaryRepresentation];
      }
      [v4 setObject:v13 forKey:@"place"];
    }
    v14 = [(id)a1 transitLineTileInfo];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"transitLineTileInfo";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"transit_line_tile_info";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = [(id)a1 placeRequest];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"placeRequest";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"place_request";
      }
      [v4 setObject:v20 forKey:v21];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v23 = *(id *)(a1 + 32);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v54 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            if (a2) {
              [v28 jsonRepresentation];
            }
            else {
            v29 = [v28 dictionaryRepresentation];
            }
            [v22 addObject:v29];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v25);
      }

      if (a2) {
        v30 = @"directionsRequest";
      }
      else {
        v30 = @"directions_request";
      }
      [v4 setObject:v22 forKey:v30];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v32 = *(id *)(a1 + 40);
      uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v50 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v49 + 1) + 8 * j);
            if (a2) {
              [v37 jsonRepresentation];
            }
            else {
            v38 = [v37 dictionaryRepresentation];
            }
            [v31 addObject:v38];
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v49 objects:v57 count:16];
        }
        while (v34);
      }

      if (a2) {
        v39 = @"directionsResponse";
      }
      else {
        v39 = @"directions_response";
      }
      [v4 setObject:v31 forKey:v39];
    }
    v40 = *(void **)(a1 + 16);
    if (v40)
    {
      v41 = [v40 dictionaryRepresentation];
      v42 = v41;
      if (a2)
      {
        v43 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __53__GEORPTransitPoiFeedback__dictionaryRepresentation___block_invoke;
        v47[3] = &unk_1E53D8860;
        id v44 = v43;
        id v48 = v44;
        [v42 enumerateKeysAndObjectsUsingBlock:v47];
        id v45 = v44;

        v42 = v45;
      }
      [v4 setObject:v42 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPTransitPoiFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEORPTransitPoiFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPTransitPoiFeedback)initWithDictionary:(id)a3
{
  return (GEORPTransitPoiFeedback *)-[GEORPTransitPoiFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_81;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_81;
  }
  if (a3) {
    objc_super v6 = @"correctionType";
  }
  else {
    objc_super v6 = @"correction_type";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"TRANSIT_POI_CORRECTION_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"TRANSIT_POI_CORRECTION_TYPE_STATION_EDIT"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"TRANSIT_POI_CORRECTION_TYPE_LINE_EDIT"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"TRANSIT_POI_CORRECTION_TYPE_OTHER"])
    {
      uint64_t v9 = 3;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_19:
    [a1 setCorrectionType:v9];
  }

  id v10 = [v5 objectForKeyedSubscript:@"corrections"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [GEORPTransitPoiCorrections alloc];
    if (a3) {
      uint64_t v12 = [(GEORPTransitPoiCorrections *)v11 initWithJSON:v10];
    }
    else {
      uint64_t v12 = [(GEORPTransitPoiCorrections *)v11 initWithDictionary:v10];
    }
    v13 = (void *)v12;
    [a1 setCorrections:v12];
  }
  v14 = [v5 objectForKeyedSubscript:@"place"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [GEOPDPlace alloc];
    if (a3) {
      uint64_t v16 = [(GEOPDPlace *)v15 initWithJSON:v14];
    }
    else {
      uint64_t v16 = [(GEOPDPlace *)v15 initWithDictionary:v14];
    }
    v17 = (void *)v16;
    [a1 setPlace:v16];
  }
  if (a3) {
    v18 = @"transitLineTileInfo";
  }
  else {
    v18 = @"transit_line_tile_info";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = [GEORPTransitLineTileInfo alloc];
    if (a3) {
      uint64_t v21 = [(GEORPTransitLineTileInfo *)v20 initWithJSON:v19];
    }
    else {
      uint64_t v21 = [(GEORPTransitLineTileInfo *)v20 initWithDictionary:v19];
    }
    v22 = (void *)v21;
    [a1 setTransitLineTileInfo:v21];
  }
  if (a3) {
    id v23 = @"placeRequest";
  }
  else {
    id v23 = @"place_request";
  }
  uint64_t v24 = [v5 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v25 = [GEOPDPlaceRequest alloc];
    if (a3) {
      uint64_t v26 = [(GEOPDPlaceRequest *)v25 initWithJSON:v24];
    }
    else {
      uint64_t v26 = [(GEOPDPlaceRequest *)v25 initWithDictionary:v24];
    }
    v27 = (void *)v26;
    [a1 setPlaceRequest:v26];
  }
  if (a3) {
    v28 = @"directionsRequest";
  }
  else {
    v28 = @"directions_request";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  id v51 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v30 = v29;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v57 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v36 = [GEODirectionsRequest alloc];
            if (a3) {
              uint64_t v37 = [(GEODirectionsRequest *)v36 initWithJSON:v35];
            }
            else {
              uint64_t v37 = [(GEODirectionsRequest *)v36 initWithDictionary:v35];
            }
            v38 = (void *)v37;
            [a1 addDirectionsRequest:v37];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v32);
    }

    id v5 = v51;
  }

  if (a3) {
    v39 = @"directionsResponse";
  }
  else {
    v39 = @"directions_response";
  }
  v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v41 = v40;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v53 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = *(void *)(*((void *)&v52 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v47 = [GEODirectionsResponse alloc];
            if (a3) {
              uint64_t v48 = [(GEODirectionsResponse *)v47 initWithJSON:v46];
            }
            else {
              uint64_t v48 = [(GEODirectionsResponse *)v47 initWithDictionary:v46];
            }
            long long v49 = (void *)v48;
            [a1 addDirectionsResponse:v48];
          }
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v43);
    }

    id v5 = v51;
  }

LABEL_81:
  return a1;
}

- (GEORPTransitPoiFeedback)initWithJSON:(id)a3
{
  return (GEORPTransitPoiFeedback *)-[GEORPTransitPoiFeedback _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_3815;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_3816;
    }
    GEORPTransitPoiFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPTransitPoiFeedbackCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTransitPoiFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTransitPoiFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPTransitPoiFeedbackIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPTransitPoiFeedback *)self readAll:0];
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_corrections) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_place) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_transitLineTileInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeRequest) {
      PBDataWriterWriteSubmessage();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_directionsRequests;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_directionsResponses;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  -[GEORPTransitPoiFeedback _readCorrections]((uint64_t)self);
  if ([(GEORPTransitPoiCorrections *)self->_corrections hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPTransitPoiFeedback _readDirectionsRequests]((uint64_t)self);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = self->_directionsRequests;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v19 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_20;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v7) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  -[GEORPTransitPoiFeedback _readDirectionsResponses]((uint64_t)self);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_directionsResponses;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
LABEL_12:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v16 != v12) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3, (void)v15)) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
    }
LABEL_20:

    return 1;
  }
LABEL_18:

  -[GEORPTransitPoiFeedback _readPlace]((uint64_t)self);
  if (![(GEOPDPlace *)self->_place hasGreenTeaWithValue:v3])
  {
    -[GEORPTransitPoiFeedback _readPlaceRequest]((uint64_t)self);
    return [(GEOPDPlaceRequest *)self->_placeRequest hasGreenTeaWithValue:v3];
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEORPTransitPoiFeedback *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 18) = self->_readerMarkPos;
  *((_DWORD *)v12 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v12 + 21) = self->_correctionType;
    *((_WORD *)v12 + 44) |= 1u;
  }
  if (self->_corrections) {
    objc_msgSend(v12, "setCorrections:");
  }
  if (self->_place) {
    objc_msgSend(v12, "setPlace:");
  }
  if (self->_transitLineTileInfo) {
    objc_msgSend(v12, "setTransitLineTileInfo:");
  }
  if (self->_placeRequest) {
    objc_msgSend(v12, "setPlaceRequest:");
  }
  if ([(GEORPTransitPoiFeedback *)self directionsRequestsCount])
  {
    [v12 clearDirectionsRequests];
    unint64_t v4 = [(GEORPTransitPoiFeedback *)self directionsRequestsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPTransitPoiFeedback *)self directionsRequestAtIndex:i];
        [v12 addDirectionsRequest:v7];
      }
    }
  }
  if ([(GEORPTransitPoiFeedback *)self directionsResponsesCount])
  {
    [v12 clearDirectionsResponses];
    unint64_t v8 = [(GEORPTransitPoiFeedback *)self directionsResponsesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORPTransitPoiFeedback *)self directionsResponseAtIndex:j];
        [v12 addDirectionsResponse:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPTransitPoiFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPTransitPoiFeedback *)self readAll:0];
  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 84) = self->_correctionType;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  id v9 = [(GEORPTransitPoiCorrections *)self->_corrections copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOPDPlace *)self->_place copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v11;

  id v13 = [(GEORPTransitLineTileInfo *)self->_transitLineTileInfo copyWithZone:a3];
  v14 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v13;

  id v15 = [(GEOPDPlaceRequest *)self->_placeRequest copyWithZone:a3];
  long long v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v17 = self->_directionsRequests;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v17);
        }
        long long v21 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addDirectionsRequest:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v18);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v22 = self->_directionsResponses;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * j), "copyWithZone:", a3, (void)v29);
        [(id)v5 addDirectionsResponse:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v23);
  }

  v27 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v27;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEORPTransitPoiFeedback *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 44);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_correctionType != *((_DWORD *)v4 + 21)) {
      goto LABEL_19;
    }
  }
  else if (v5)
  {
LABEL_19:
    char v12 = 0;
    goto LABEL_20;
  }
  corrections = self->_corrections;
  if ((unint64_t)corrections | *((void *)v4 + 3)
    && !-[GEORPTransitPoiCorrections isEqual:](corrections, "isEqual:"))
  {
    goto LABEL_19;
  }
  place = self->_place;
  if ((unint64_t)place | *((void *)v4 + 7))
  {
    if (!-[GEOPDPlace isEqual:](place, "isEqual:")) {
      goto LABEL_19;
    }
  }
  transitLineTileInfo = self->_transitLineTileInfo;
  if ((unint64_t)transitLineTileInfo | *((void *)v4 + 8))
  {
    if (!-[GEORPTransitLineTileInfo isEqual:](transitLineTileInfo, "isEqual:")) {
      goto LABEL_19;
    }
  }
  placeRequest = self->_placeRequest;
  if ((unint64_t)placeRequest | *((void *)v4 + 6))
  {
    if (!-[GEOPDPlaceRequest isEqual:](placeRequest, "isEqual:")) {
      goto LABEL_19;
    }
  }
  directionsRequests = self->_directionsRequests;
  if ((unint64_t)directionsRequests | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](directionsRequests, "isEqual:")) {
      goto LABEL_19;
    }
  }
  directionsResponses = self->_directionsResponses;
  if ((unint64_t)directionsResponses | *((void *)v4 + 5)) {
    char v12 = -[NSMutableArray isEqual:](directionsResponses, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  [(GEORPTransitPoiFeedback *)self readAll:1];
  if (*(_WORD *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_correctionType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEORPTransitPoiCorrections *)self->_corrections hash] ^ v3;
  unint64_t v5 = [(GEOPDPlace *)self->_place hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEORPTransitLineTileInfo *)self->_transitLineTileInfo hash];
  unint64_t v7 = [(GEOPDPlaceRequest *)self->_placeRequest hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_directionsRequests hash];
  return v6 ^ v8 ^ [(NSMutableArray *)self->_directionsResponses hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((_WORD *)v4 + 44))
  {
    self->_correctionType = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 1u;
  }
  corrections = self->_corrections;
  uint64_t v6 = *((void *)v4 + 3);
  if (corrections)
  {
    if (v6) {
      -[GEORPTransitPoiCorrections mergeFrom:](corrections, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPTransitPoiFeedback setCorrections:](self, "setCorrections:");
  }
  place = self->_place;
  uint64_t v8 = *((void *)v4 + 7);
  if (place)
  {
    if (v8) {
      -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEORPTransitPoiFeedback setPlace:](self, "setPlace:");
  }
  transitLineTileInfo = self->_transitLineTileInfo;
  uint64_t v10 = *((void *)v4 + 8);
  if (transitLineTileInfo)
  {
    if (v10) {
      -[GEORPTransitLineTileInfo mergeFrom:](transitLineTileInfo, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[GEORPTransitPoiFeedback setTransitLineTileInfo:](self, "setTransitLineTileInfo:");
  }
  placeRequest = self->_placeRequest;
  uint64_t v12 = *((void *)v4 + 6);
  if (placeRequest)
  {
    if (v12) {
      -[GEOPDPlaceRequest mergeFrom:](placeRequest, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[GEORPTransitPoiFeedback setPlaceRequest:](self, "setPlaceRequest:");
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = *((id *)v4 + 4);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        [(GEORPTransitPoiFeedback *)self addDirectionsRequest:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v15);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = *((id *)v4 + 5);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        -[GEORPTransitPoiFeedback addDirectionsResponse:](self, "addDirectionsResponse:", *(void *)(*((void *)&v23 + 1) + 8 * j), (void)v23);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v20);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPTransitPoiFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3820);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x102u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPTransitPoiFeedback *)self readAll:0];
    [(GEORPTransitPoiCorrections *)self->_corrections clearUnknownFields:1];
    [(GEOPDPlace *)self->_place clearUnknownFields:1];
    [(GEOPDPlaceRequest *)self->_placeRequest clearUnknownFields:1];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    unint64_t v7 = self->_directionsRequests;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = self->_directionsResponses;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitLineTileInfo, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeRequest, 0);
  objc_storeStrong((id *)&self->_directionsResponses, 0);
  objc_storeStrong((id *)&self->_directionsRequests, 0);
  objc_storeStrong((id *)&self->_corrections, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end