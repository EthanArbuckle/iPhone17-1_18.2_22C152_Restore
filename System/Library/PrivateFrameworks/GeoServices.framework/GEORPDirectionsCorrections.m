@interface GEORPDirectionsCorrections
+ (BOOL)isValid:(id)a3;
+ (Class)instructionCorrectionType;
+ (Class)problematicRouteIndexType;
- (BOOL)hasArrivalCoordinate;
- (BOOL)hasDirectionsResponseId;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasNoGoodRoutesShown;
- (BOOL)hasOverviewScreenshotImageId;
- (BOOL)isEqual:(id)a3;
- (BOOL)noGoodRoutesShown;
- (BOOL)readFrom:(id)a3;
- (GEORPCorrectedCoordinate)arrivalCoordinate;
- (GEORPDirectionsCorrections)init;
- (GEORPDirectionsCorrections)initWithData:(id)a3;
- (GEORPDirectionsCorrections)initWithDictionary:(id)a3;
- (GEORPDirectionsCorrections)initWithJSON:(id)a3;
- (NSData)directionsResponseId;
- (NSMutableArray)instructionCorrections;
- (NSMutableArray)problematicRouteIndexs;
- (NSString)overviewScreenshotImageId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)instructionCorrectionAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)problematicRouteIndexAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)instructionCorrectionsCount;
- (unint64_t)problematicRouteIndexsCount;
- (void)_addNoFlagsInstructionCorrection:(uint64_t)a1;
- (void)_addNoFlagsProblematicRouteIndex:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArrivalCoordinate;
- (void)_readDirectionsResponseId;
- (void)_readInstructionCorrections;
- (void)_readOverviewScreenshotImageId;
- (void)_readProblematicRouteIndexs;
- (void)addInstructionCorrection:(id)a3;
- (void)addProblematicRouteIndex:(id)a3;
- (void)clearInstructionCorrections;
- (void)clearProblematicRouteIndexs;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArrivalCoordinate:(id)a3;
- (void)setDirectionsResponseId:(id)a3;
- (void)setHasNoGoodRoutesShown:(BOOL)a3;
- (void)setInstructionCorrections:(id)a3;
- (void)setNoGoodRoutesShown:(BOOL)a3;
- (void)setOverviewScreenshotImageId:(id)a3;
- (void)setProblematicRouteIndexs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPDirectionsCorrections

- (GEORPDirectionsCorrections)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPDirectionsCorrections;
  v2 = [(GEORPDirectionsCorrections *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPDirectionsCorrections)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPDirectionsCorrections;
  v3 = [(GEORPDirectionsCorrections *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDirectionsResponseId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsResponseId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDirectionsResponseId
{
  return self->_directionsResponseId != 0;
}

- (NSData)directionsResponseId
{
  -[GEORPDirectionsCorrections _readDirectionsResponseId]((uint64_t)self);
  directionsResponseId = self->_directionsResponseId;

  return directionsResponseId;
}

- (void)setDirectionsResponseId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_directionsResponseId, a3);
}

- (void)_readProblematicRouteIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblematicRouteIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)problematicRouteIndexs
{
  -[GEORPDirectionsCorrections _readProblematicRouteIndexs]((uint64_t)self);
  problematicRouteIndexs = self->_problematicRouteIndexs;

  return problematicRouteIndexs;
}

- (void)setProblematicRouteIndexs:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  problematicRouteIndexs = self->_problematicRouteIndexs;
  self->_problematicRouteIndexs = v4;
}

- (void)clearProblematicRouteIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  problematicRouteIndexs = self->_problematicRouteIndexs;

  [(NSMutableArray *)problematicRouteIndexs removeAllObjects];
}

- (void)addProblematicRouteIndex:(id)a3
{
  id v4 = a3;
  -[GEORPDirectionsCorrections _readProblematicRouteIndexs]((uint64_t)self);
  -[GEORPDirectionsCorrections _addNoFlagsProblematicRouteIndex:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsProblematicRouteIndex:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)problematicRouteIndexsCount
{
  -[GEORPDirectionsCorrections _readProblematicRouteIndexs]((uint64_t)self);
  problematicRouteIndexs = self->_problematicRouteIndexs;

  return [(NSMutableArray *)problematicRouteIndexs count];
}

- (id)problematicRouteIndexAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsCorrections _readProblematicRouteIndexs]((uint64_t)self);
  problematicRouteIndexs = self->_problematicRouteIndexs;

  return (id)[(NSMutableArray *)problematicRouteIndexs objectAtIndex:a3];
}

+ (Class)problematicRouteIndexType
{
  return (Class)objc_opt_class();
}

- (void)_readInstructionCorrections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInstructionCorrections_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)instructionCorrections
{
  -[GEORPDirectionsCorrections _readInstructionCorrections]((uint64_t)self);
  instructionCorrections = self->_instructionCorrections;

  return instructionCorrections;
}

- (void)setInstructionCorrections:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  instructionCorrections = self->_instructionCorrections;
  self->_instructionCorrections = v4;
}

- (void)clearInstructionCorrections
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  instructionCorrections = self->_instructionCorrections;

  [(NSMutableArray *)instructionCorrections removeAllObjects];
}

- (void)addInstructionCorrection:(id)a3
{
  id v4 = a3;
  -[GEORPDirectionsCorrections _readInstructionCorrections]((uint64_t)self);
  -[GEORPDirectionsCorrections _addNoFlagsInstructionCorrection:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsInstructionCorrection:(uint64_t)a1
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

- (unint64_t)instructionCorrectionsCount
{
  -[GEORPDirectionsCorrections _readInstructionCorrections]((uint64_t)self);
  instructionCorrections = self->_instructionCorrections;

  return [(NSMutableArray *)instructionCorrections count];
}

- (id)instructionCorrectionAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsCorrections _readInstructionCorrections]((uint64_t)self);
  instructionCorrections = self->_instructionCorrections;

  return (id)[(NSMutableArray *)instructionCorrections objectAtIndex:a3];
}

+ (Class)instructionCorrectionType
{
  return (Class)objc_opt_class();
}

- (void)_readOverviewScreenshotImageId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOverviewScreenshotImageId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOverviewScreenshotImageId
{
  return self->_overviewScreenshotImageId != 0;
}

- (NSString)overviewScreenshotImageId
{
  -[GEORPDirectionsCorrections _readOverviewScreenshotImageId]((uint64_t)self);
  overviewScreenshotImageId = self->_overviewScreenshotImageId;

  return overviewScreenshotImageId;
}

- (void)setOverviewScreenshotImageId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_overviewScreenshotImageId, a3);
}

- (void)_readArrivalCoordinate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsCorrectionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArrivalCoordinate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasArrivalCoordinate
{
  return self->_arrivalCoordinate != 0;
}

- (GEORPCorrectedCoordinate)arrivalCoordinate
{
  -[GEORPDirectionsCorrections _readArrivalCoordinate]((uint64_t)self);
  arrivalCoordinate = self->_arrivalCoordinate;

  return arrivalCoordinate;
}

- (void)setArrivalCoordinate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_arrivalCoordinate, a3);
}

- (BOOL)noGoodRoutesShown
{
  return self->_noGoodRoutesShown;
}

- (void)setNoGoodRoutesShown:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_noGoodRoutesShown = a3;
}

- (void)setHasNoGoodRoutesShown:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasNoGoodRoutesShown
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPDirectionsCorrections;
  id v4 = [(GEORPDirectionsCorrections *)&v8 description];
  id v5 = [(GEORPDirectionsCorrections *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPDirectionsCorrections _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 directionsResponseId];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"directionsResponseId"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"directions_response_id"];
      }
    }

    if ([*(id *)(a1 + 56) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v9 = *(id *)(a1 + 56);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v48 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = [v14 dictionaryRepresentation];
            }
            [v8 addObject:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v11);
      }

      if (a2) {
        v16 = @"problematicRouteIndex";
      }
      else {
        v16 = @"problematic_route_index";
      }
      [v4 setObject:v8 forKey:v16];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v18 = *(id *)(a1 + 40);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v44 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v43 + 1) + 8 * j);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = [v23 dictionaryRepresentation];
            }
            [v17 addObject:v24];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v51 count:16];
        }
        while (v20);
      }

      if (a2) {
        v25 = @"instructionCorrection";
      }
      else {
        v25 = @"instruction_correction";
      }
      [v4 setObject:v17 forKey:v25];
    }
    v26 = [(id)a1 overviewScreenshotImageId];
    if (v26)
    {
      if (a2) {
        v27 = @"overviewScreenshotImageId";
      }
      else {
        v27 = @"overview_screenshot_image_id";
      }
      [v4 setObject:v26 forKey:v27];
    }

    v28 = [(id)a1 arrivalCoordinate];
    v29 = v28;
    if (v28)
    {
      if (a2)
      {
        v30 = [v28 jsonRepresentation];
        v31 = @"arrivalCoordinate";
      }
      else
      {
        v30 = [v28 dictionaryRepresentation];
        v31 = @"arrival_coordinate";
      }
      [v4 setObject:v30 forKey:v31];
    }
    if (*(unsigned char *)(a1 + 80))
    {
      v32 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 76)];
      if (a2) {
        v33 = @"noGoodRoutesShown";
      }
      else {
        v33 = @"no_good_routes_shown";
      }
      [v4 setObject:v32 forKey:v33];
    }
    v34 = *(void **)(a1 + 16);
    if (v34)
    {
      v35 = [v34 dictionaryRepresentation];
      v36 = v35;
      if (a2)
      {
        v37 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v35, "count"));
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __56__GEORPDirectionsCorrections__dictionaryRepresentation___block_invoke;
        v41[3] = &unk_1E53D8860;
        id v38 = v37;
        id v42 = v38;
        [v36 enumerateKeysAndObjectsUsingBlock:v41];
        id v39 = v38;

        v36 = v39;
      }
      [v4 setObject:v36 forKey:@"Unknown Fields"];
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
  return -[GEORPDirectionsCorrections _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEORPDirectionsCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPDirectionsCorrections)initWithDictionary:(id)a3
{
  return (GEORPDirectionsCorrections *)-[GEORPDirectionsCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"directionsResponseId";
      }
      else {
        objc_super v6 = @"directions_response_id";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
        [a1 setDirectionsResponseId:v8];
      }
      if (a3) {
        id v9 = @"problematicRouteIndex";
      }
      else {
        id v9 = @"problematic_route_index";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      id v42 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v52 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v48 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v17 = [GEORPSuggestedRouteIndex alloc];
                if (a3) {
                  uint64_t v18 = [(GEORPSuggestedRouteIndex *)v17 initWithJSON:v16];
                }
                else {
                  uint64_t v18 = [(GEORPSuggestedRouteIndex *)v17 initWithDictionary:v16];
                }
                uint64_t v19 = (void *)v18;
                [a1 addProblematicRouteIndex:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v52 count:16];
          }
          while (v13);
        }

        id v5 = v42;
      }

      if (a3) {
        uint64_t v20 = @"instructionCorrection";
      }
      else {
        uint64_t v20 = @"instruction_correction";
      }
      uint64_t v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v44;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v44 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v43 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v28 = [GEORPInstructionCorrection alloc];
                if (a3) {
                  uint64_t v29 = [(GEORPInstructionCorrection *)v28 initWithJSON:v27];
                }
                else {
                  uint64_t v29 = [(GEORPInstructionCorrection *)v28 initWithDictionary:v27];
                }
                v30 = (void *)v29;
                [a1 addInstructionCorrection:v29];
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
          }
          while (v24);
        }

        id v5 = v42;
      }

      if (a3) {
        v31 = @"overviewScreenshotImageId";
      }
      else {
        v31 = @"overview_screenshot_image_id";
      }
      v32 = [v5 objectForKeyedSubscript:v31];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = (void *)[v32 copy];
        [a1 setOverviewScreenshotImageId:v33];
      }
      if (a3) {
        v34 = @"arrivalCoordinate";
      }
      else {
        v34 = @"arrival_coordinate";
      }
      v35 = [v5 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v36 = [GEORPCorrectedCoordinate alloc];
        if (a3) {
          uint64_t v37 = [(GEORPCorrectedCoordinate *)v36 initWithJSON:v35];
        }
        else {
          uint64_t v37 = [(GEORPCorrectedCoordinate *)v36 initWithDictionary:v35];
        }
        id v38 = (void *)v37;
        [a1 setArrivalCoordinate:v37];
      }
      if (a3) {
        id v39 = @"noGoodRoutesShown";
      }
      else {
        id v39 = @"no_good_routes_shown";
      }
      v40 = [v5 objectForKeyedSubscript:v39];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNoGoodRoutesShown:", objc_msgSend(v40, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEORPDirectionsCorrections)initWithJSON:(id)a3
{
  return (GEORPDirectionsCorrections *)-[GEORPDirectionsCorrections _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_672;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_673;
    }
    GEORPDirectionsCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPDirectionsCorrectionsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDirectionsCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDirectionsCorrectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPDirectionsCorrectionsIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v14 = self->_reader;
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
    [(GEORPDirectionsCorrections *)self readAll:0];
    if (self->_directionsResponseId) {
      PBDataWriterWriteDataField();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_problematicRouteIndexs;
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
    id v10 = self->_instructionCorrections;
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

    if (self->_overviewScreenshotImageId) {
      PBDataWriterWriteStringField();
    }
    if (self->_arrivalCoordinate) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEORPDirectionsCorrections _readArrivalCoordinate]((uint64_t)self);
  if ([(GEORPCorrectedCoordinate *)self->_arrivalCoordinate hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPDirectionsCorrections _readInstructionCorrections]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v6 = self->_instructionCorrections;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v5 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v5 = 0;
LABEL_13:

  return v5;
}

- (void)copyTo:(id)a3
{
  long long v13 = (id *)a3;
  [(GEORPDirectionsCorrections *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 16) = self->_readerMarkPos;
  *((_DWORD *)v13 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_directionsResponseId) {
    objc_msgSend(v13, "setDirectionsResponseId:");
  }
  if ([(GEORPDirectionsCorrections *)self problematicRouteIndexsCount])
  {
    [v13 clearProblematicRouteIndexs];
    unint64_t v4 = [(GEORPDirectionsCorrections *)self problematicRouteIndexsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPDirectionsCorrections *)self problematicRouteIndexAtIndex:i];
        [v13 addProblematicRouteIndex:v7];
      }
    }
  }
  if ([(GEORPDirectionsCorrections *)self instructionCorrectionsCount])
  {
    [v13 clearInstructionCorrections];
    unint64_t v8 = [(GEORPDirectionsCorrections *)self instructionCorrectionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORPDirectionsCorrections *)self instructionCorrectionAtIndex:j];
        [v13 addInstructionCorrection:v11];
      }
    }
  }
  if (self->_overviewScreenshotImageId) {
    objc_msgSend(v13, "setOverviewScreenshotImageId:");
  }
  long long v12 = v13;
  if (self->_arrivalCoordinate)
  {
    objc_msgSend(v13, "setArrivalCoordinate:");
    long long v12 = v13;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)v12 + 76) = self->_noGoodRoutesShown;
    *((unsigned char *)v12 + 80) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPDirectionsCorrectionsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPDirectionsCorrections *)self readAll:0];
  uint64_t v9 = [(NSData *)self->_directionsResponseId copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v11 = self->_problematicRouteIndexs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addProblematicRouteIndex:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v12);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v16 = self->_instructionCorrections;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (void)v27);
        [(id)v5 addInstructionCorrection:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v17);
  }

  uint64_t v21 = [(NSString *)self->_overviewScreenshotImageId copyWithZone:a3];
  long long v22 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v21;

  id v23 = [(GEORPCorrectedCoordinate *)self->_arrivalCoordinate copyWithZone:a3];
  uint64_t v24 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v23;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 76) = self->_noGoodRoutesShown;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  uint64_t v25 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v25;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEORPDirectionsCorrections *)self readAll:1];
  [v4 readAll:1];
  directionsResponseId = self->_directionsResponseId;
  if ((unint64_t)directionsResponseId | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](directionsResponseId, "isEqual:")) {
      goto LABEL_14;
    }
  }
  problematicRouteIndexs = self->_problematicRouteIndexs;
  if ((unint64_t)problematicRouteIndexs | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](problematicRouteIndexs, "isEqual:")) {
      goto LABEL_14;
    }
  }
  instructionCorrections = self->_instructionCorrections;
  if ((unint64_t)instructionCorrections | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](instructionCorrections, "isEqual:")) {
      goto LABEL_14;
    }
  }
  overviewScreenshotImageId = self->_overviewScreenshotImageId;
  if ((unint64_t)overviewScreenshotImageId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](overviewScreenshotImageId, "isEqual:")) {
      goto LABEL_14;
    }
  }
  arrivalCoordinate = self->_arrivalCoordinate;
  if ((unint64_t)arrivalCoordinate | *((void *)v4 + 3))
  {
    if (!-[GEORPCorrectedCoordinate isEqual:](arrivalCoordinate, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 80) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0)
    {
LABEL_14:
      BOOL v10 = 0;
      goto LABEL_15;
    }
    if (self->_noGoodRoutesShown)
    {
      if (!*((unsigned char *)v4 + 76)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 76))
    {
      goto LABEL_14;
    }
    BOOL v10 = 1;
  }
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  [(GEORPDirectionsCorrections *)self readAll:1];
  uint64_t v3 = [(NSData *)self->_directionsResponseId hash];
  uint64_t v4 = [(NSMutableArray *)self->_problematicRouteIndexs hash];
  uint64_t v5 = [(NSMutableArray *)self->_instructionCorrections hash];
  NSUInteger v6 = [(NSString *)self->_overviewScreenshotImageId hash];
  unint64_t v7 = [(GEORPCorrectedCoordinate *)self->_arrivalCoordinate hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v8 = 2654435761 * self->_noGoodRoutesShown;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 4)) {
    -[GEORPDirectionsCorrections setDirectionsResponseId:](self, "setDirectionsResponseId:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *((id *)v4 + 7);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEORPDirectionsCorrections *)self addProblematicRouteIndex:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = *((id *)v4 + 5);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEORPDirectionsCorrections addInstructionCorrection:](self, "addInstructionCorrection:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 6)) {
    -[GEORPDirectionsCorrections setOverviewScreenshotImageId:](self, "setOverviewScreenshotImageId:");
  }
  arrivalCoordinate = self->_arrivalCoordinate;
  uint64_t v16 = *((void *)v4 + 3);
  if (arrivalCoordinate)
  {
    if (v16) {
      -[GEORPCorrectedCoordinate mergeFrom:](arrivalCoordinate, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[GEORPDirectionsCorrections setArrivalCoordinate:](self, "setArrivalCoordinate:");
  }
  if (*((unsigned char *)v4 + 80))
  {
    self->_noGoodRoutesShown = *((unsigned char *)v4 + 76);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEORPDirectionsCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_677);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x82u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPDirectionsCorrections *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_problematicRouteIndexs, 0);
  objc_storeStrong((id *)&self->_overviewScreenshotImageId, 0);
  objc_storeStrong((id *)&self->_instructionCorrections, 0);
  objc_storeStrong((id *)&self->_directionsResponseId, 0);
  objc_storeStrong((id *)&self->_arrivalCoordinate, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end