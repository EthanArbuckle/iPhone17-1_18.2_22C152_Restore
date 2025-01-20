@interface GEORPDirectionsProblem
+ (BOOL)isValid:(id)a3;
+ (Class)clientSuggestedRouteType;
+ (Class)instructionCorrectionType;
+ (Class)problematicRouteIndexType;
- (BOOL)hasDirectionsResponseId;
- (BOOL)hasEndWaypoint;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasOverviewScreenshotImageData;
- (BOOL)hasProblematicLineIndex;
- (BOOL)hasProblematicStepIndex;
- (BOOL)hasStartWaypoint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPDirectionsProblem)init;
- (GEORPDirectionsProblem)initWithData:(id)a3;
- (GEORPDirectionsProblem)initWithDictionary:(id)a3;
- (GEORPDirectionsProblem)initWithJSON:(id)a3;
- (GEORPUserSearchInput)endWaypoint;
- (GEORPUserSearchInput)startWaypoint;
- (NSData)directionsResponseId;
- (NSData)overviewScreenshotImageData;
- (NSMutableArray)clientSuggestedRoutes;
- (NSMutableArray)instructionCorrections;
- (NSMutableArray)problematicRouteIndexs;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)clientSuggestedRouteAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)instructionCorrectionAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)problematicRouteIndexAtIndex:(unint64_t)a3;
- (unint64_t)clientSuggestedRoutesCount;
- (unint64_t)hash;
- (unint64_t)instructionCorrectionsCount;
- (unint64_t)problematicRouteIndexsCount;
- (unsigned)problematicLineIndex;
- (unsigned)problematicStepIndex;
- (void)_addNoFlagsClientSuggestedRoute:(uint64_t)a1;
- (void)_addNoFlagsInstructionCorrection:(uint64_t)a1;
- (void)_addNoFlagsProblematicRouteIndex:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readClientSuggestedRoutes;
- (void)_readDirectionsResponseId;
- (void)_readEndWaypoint;
- (void)_readInstructionCorrections;
- (void)_readOverviewScreenshotImageData;
- (void)_readProblematicRouteIndexs;
- (void)_readStartWaypoint;
- (void)addClientSuggestedRoute:(id)a3;
- (void)addInstructionCorrection:(id)a3;
- (void)addProblematicRouteIndex:(id)a3;
- (void)clearClientSuggestedRoutes;
- (void)clearInstructionCorrections;
- (void)clearProblematicRouteIndexs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setClientSuggestedRoutes:(id)a3;
- (void)setDirectionsResponseId:(id)a3;
- (void)setEndWaypoint:(id)a3;
- (void)setHasProblematicLineIndex:(BOOL)a3;
- (void)setHasProblematicStepIndex:(BOOL)a3;
- (void)setInstructionCorrections:(id)a3;
- (void)setOverviewScreenshotImageData:(id)a3;
- (void)setProblematicLineIndex:(unsigned int)a3;
- (void)setProblematicRouteIndexs:(id)a3;
- (void)setProblematicStepIndex:(unsigned int)a3;
- (void)setStartWaypoint:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPDirectionsProblem

- (GEORPDirectionsProblem)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPDirectionsProblem;
  v2 = [(GEORPDirectionsProblem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPDirectionsProblem)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPDirectionsProblem;
  v3 = [(GEORPDirectionsProblem *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsProblemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsResponseId_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDirectionsResponseId
{
  return self->_directionsResponseId != 0;
}

- (NSData)directionsResponseId
{
  -[GEORPDirectionsProblem _readDirectionsResponseId]((uint64_t)self);
  directionsResponseId = self->_directionsResponseId;

  return directionsResponseId;
}

- (void)setDirectionsResponseId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  objc_storeStrong((id *)&self->_directionsResponseId, a3);
}

- (void)_readOverviewScreenshotImageData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsProblemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOverviewScreenshotImageData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasOverviewScreenshotImageData
{
  return self->_overviewScreenshotImageData != 0;
}

- (NSData)overviewScreenshotImageData
{
  -[GEORPDirectionsProblem _readOverviewScreenshotImageData]((uint64_t)self);
  overviewScreenshotImageData = self->_overviewScreenshotImageData;

  return overviewScreenshotImageData;
}

- (void)setOverviewScreenshotImageData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_overviewScreenshotImageData, a3);
}

- (unsigned)problematicStepIndex
{
  return self->_problematicStepIndex;
}

- (void)setProblematicStepIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_problematicStepIndex = a3;
}

- (void)setHasProblematicStepIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasProblematicStepIndex
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readClientSuggestedRoutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsProblemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientSuggestedRoutes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)clientSuggestedRoutes
{
  -[GEORPDirectionsProblem _readClientSuggestedRoutes]((uint64_t)self);
  clientSuggestedRoutes = self->_clientSuggestedRoutes;

  return clientSuggestedRoutes;
}

- (void)setClientSuggestedRoutes:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  clientSuggestedRoutes = self->_clientSuggestedRoutes;
  self->_clientSuggestedRoutes = v4;
}

- (void)clearClientSuggestedRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  clientSuggestedRoutes = self->_clientSuggestedRoutes;

  [(NSMutableArray *)clientSuggestedRoutes removeAllObjects];
}

- (void)addClientSuggestedRoute:(id)a3
{
  id v4 = a3;
  -[GEORPDirectionsProblem _readClientSuggestedRoutes]((uint64_t)self);
  -[GEORPDirectionsProblem _addNoFlagsClientSuggestedRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsClientSuggestedRoute:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)clientSuggestedRoutesCount
{
  -[GEORPDirectionsProblem _readClientSuggestedRoutes]((uint64_t)self);
  clientSuggestedRoutes = self->_clientSuggestedRoutes;

  return [(NSMutableArray *)clientSuggestedRoutes count];
}

- (id)clientSuggestedRouteAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsProblem _readClientSuggestedRoutes]((uint64_t)self);
  clientSuggestedRoutes = self->_clientSuggestedRoutes;

  return (id)[(NSMutableArray *)clientSuggestedRoutes objectAtIndex:a3];
}

+ (Class)clientSuggestedRouteType
{
  return (Class)objc_opt_class();
}

- (void)_readProblematicRouteIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsProblemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblematicRouteIndexs_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)problematicRouteIndexs
{
  -[GEORPDirectionsProblem _readProblematicRouteIndexs]((uint64_t)self);
  problematicRouteIndexs = self->_problematicRouteIndexs;

  return problematicRouteIndexs;
}

- (void)setProblematicRouteIndexs:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  problematicRouteIndexs = self->_problematicRouteIndexs;
  self->_problematicRouteIndexs = v4;
}

- (void)clearProblematicRouteIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  problematicRouteIndexs = self->_problematicRouteIndexs;

  [(NSMutableArray *)problematicRouteIndexs removeAllObjects];
}

- (void)addProblematicRouteIndex:(id)a3
{
  id v4 = a3;
  -[GEORPDirectionsProblem _readProblematicRouteIndexs]((uint64_t)self);
  -[GEORPDirectionsProblem _addNoFlagsProblematicRouteIndex:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
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
  -[GEORPDirectionsProblem _readProblematicRouteIndexs]((uint64_t)self);
  problematicRouteIndexs = self->_problematicRouteIndexs;

  return [(NSMutableArray *)problematicRouteIndexs count];
}

- (id)problematicRouteIndexAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsProblem _readProblematicRouteIndexs]((uint64_t)self);
  problematicRouteIndexs = self->_problematicRouteIndexs;

  return (id)[(NSMutableArray *)problematicRouteIndexs objectAtIndex:a3];
}

+ (Class)problematicRouteIndexType
{
  return (Class)objc_opt_class();
}

- (unsigned)problematicLineIndex
{
  return self->_problematicLineIndex;
}

- (void)setProblematicLineIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_problematicLineIndex = a3;
}

- (void)setHasProblematicLineIndex:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasProblematicLineIndex
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readStartWaypoint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsProblemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStartWaypoint_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasStartWaypoint
{
  return self->_startWaypoint != 0;
}

- (GEORPUserSearchInput)startWaypoint
{
  -[GEORPDirectionsProblem _readStartWaypoint]((uint64_t)self);
  startWaypoint = self->_startWaypoint;

  return startWaypoint;
}

- (void)setStartWaypoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_startWaypoint, a3);
}

- (void)_readEndWaypoint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsProblemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEndWaypoint_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasEndWaypoint
{
  return self->_endWaypoint != 0;
}

- (GEORPUserSearchInput)endWaypoint
{
  -[GEORPDirectionsProblem _readEndWaypoint]((uint64_t)self);
  endWaypoint = self->_endWaypoint;

  return endWaypoint;
}

- (void)setEndWaypoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_endWaypoint, a3);
}

- (void)_readInstructionCorrections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsProblemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInstructionCorrections_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)instructionCorrections
{
  -[GEORPDirectionsProblem _readInstructionCorrections]((uint64_t)self);
  instructionCorrections = self->_instructionCorrections;

  return instructionCorrections;
}

- (void)setInstructionCorrections:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  instructionCorrections = self->_instructionCorrections;
  self->_instructionCorrections = v4;
}

- (void)clearInstructionCorrections
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  instructionCorrections = self->_instructionCorrections;

  [(NSMutableArray *)instructionCorrections removeAllObjects];
}

- (void)addInstructionCorrection:(id)a3
{
  id v4 = a3;
  -[GEORPDirectionsProblem _readInstructionCorrections]((uint64_t)self);
  -[GEORPDirectionsProblem _addNoFlagsInstructionCorrection:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
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
  -[GEORPDirectionsProblem _readInstructionCorrections]((uint64_t)self);
  instructionCorrections = self->_instructionCorrections;

  return [(NSMutableArray *)instructionCorrections count];
}

- (id)instructionCorrectionAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsProblem _readInstructionCorrections]((uint64_t)self);
  instructionCorrections = self->_instructionCorrections;

  return (id)[(NSMutableArray *)instructionCorrections objectAtIndex:a3];
}

+ (Class)instructionCorrectionType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPDirectionsProblem;
  id v4 = [(GEORPDirectionsProblem *)&v8 description];
  id v5 = [(GEORPDirectionsProblem *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPDirectionsProblem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
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

    objc_super v8 = [(id)a1 overviewScreenshotImageData];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 base64EncodedStringWithOptions:0];
        [v4 setObject:v10 forKey:@"overviewScreenshotImageData"];
      }
      else
      {
        [v4 setObject:v8 forKey:@"overview_screenshot_image_data"];
      }
    }

    if ((*(_WORD *)(a1 + 92) & 2) != 0)
    {
      v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 88)];
      if (a2) {
        v12 = @"problematicStepIndex";
      }
      else {
        v12 = @"problematic_step_index";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v14 = *(id *)(a1 + 16);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v59 objects:v65 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v60 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = [v19 dictionaryRepresentation];
            }
            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v59 objects:v65 count:16];
        }
        while (v16);
      }

      if (a2) {
        v21 = @"clientSuggestedRoute";
      }
      else {
        v21 = @"client_suggested_route";
      }
      [v4 setObject:v13 forKey:v21];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v23 = *(id *)(a1 + 56);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v55 objects:v64 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v56;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v56 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v55 + 1) + 8 * j);
            if (a2) {
              [v28 jsonRepresentation];
            }
            else {
            v29 = [v28 dictionaryRepresentation];
            }
            [v22 addObject:v29];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v55 objects:v64 count:16];
        }
        while (v25);
      }

      if (a2) {
        v30 = @"problematicRouteIndex";
      }
      else {
        v30 = @"problematic_route_index";
      }
      [v4 setObject:v22 forKey:v30];
    }
    if (*(_WORD *)(a1 + 92))
    {
      v31 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
      if (a2) {
        v32 = @"problematicLineIndex";
      }
      else {
        v32 = @"problematic_line_index";
      }
      [v4 setObject:v31 forKey:v32];
    }
    v33 = [(id)a1 startWaypoint];
    v34 = v33;
    if (v33)
    {
      if (a2)
      {
        v35 = [v33 jsonRepresentation];
        v36 = @"startWaypoint";
      }
      else
      {
        v35 = [v33 dictionaryRepresentation];
        v36 = @"start_waypoint";
      }
      [v4 setObject:v35 forKey:v36];
    }
    v37 = [(id)a1 endWaypoint];
    v38 = v37;
    if (v37)
    {
      if (a2)
      {
        v39 = [v37 jsonRepresentation];
        v40 = @"endWaypoint";
      }
      else
      {
        v39 = [v37 dictionaryRepresentation];
        v40 = @"end_waypoint";
      }
      [v4 setObject:v39 forKey:v40];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v42 = *(id *)(a1 + 40);
      uint64_t v43 = [v42 countByEnumeratingWithState:&v51 objects:v63 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v52;
        do
        {
          for (uint64_t k = 0; k != v44; ++k)
          {
            if (*(void *)v52 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = *(void **)(*((void *)&v51 + 1) + 8 * k);
            if (a2) {
              [v47 jsonRepresentation];
            }
            else {
            v48 = objc_msgSend(v47, "dictionaryRepresentation", (void)v51);
            }
            objc_msgSend(v41, "addObject:", v48, (void)v51);
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v51 objects:v63 count:16];
        }
        while (v44);
      }

      if (a2) {
        v49 = @"instructionCorrection";
      }
      else {
        v49 = @"instruction_correction";
      }
      objc_msgSend(v4, "setObject:forKey:", v41, v49, (void)v51);
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
  return -[GEORPDirectionsProblem _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPDirectionsProblem)initWithDictionary:(id)a3
{
  return (GEORPDirectionsProblem *)-[GEORPDirectionsProblem _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
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
        v9 = @"overviewScreenshotImageData";
      }
      else {
        v9 = @"overview_screenshot_image_data";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:0];
        [a1 setOverviewScreenshotImageData:v11];
      }
      if (a3) {
        v12 = @"problematicStepIndex";
      }
      else {
        v12 = @"problematic_step_index";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setProblematicStepIndex:", objc_msgSend(v13, "unsignedIntValue"));
      }

      if (a3) {
        id v14 = @"clientSuggestedRoute";
      }
      else {
        id v14 = @"client_suggested_route";
      }
      uint64_t v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      id v60 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v69 objects:v75 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v70;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v70 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v69 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v22 = [GEOTransitSuggestedRoute alloc];
                if (a3) {
                  uint64_t v23 = [(GEOTransitSuggestedRoute *)v22 initWithJSON:v21];
                }
                else {
                  uint64_t v23 = [(GEOTransitSuggestedRoute *)v22 initWithDictionary:v21];
                }
                uint64_t v24 = (void *)v23;
                [a1 addClientSuggestedRoute:v23];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v69 objects:v75 count:16];
          }
          while (v18);
        }

        id v5 = v60;
      }

      if (a3) {
        uint64_t v25 = @"problematicRouteIndex";
      }
      else {
        uint64_t v25 = @"problematic_route_index";
      }
      uint64_t v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v65 objects:v74 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v66;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v66 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void *)(*((void *)&v65 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v33 = [GEORPSuggestedRouteIndex alloc];
                if (a3) {
                  uint64_t v34 = [(GEORPSuggestedRouteIndex *)v33 initWithJSON:v32];
                }
                else {
                  uint64_t v34 = [(GEORPSuggestedRouteIndex *)v33 initWithDictionary:v32];
                }
                v35 = (void *)v34;
                [a1 addProblematicRouteIndex:v34];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v65 objects:v74 count:16];
          }
          while (v29);
        }

        id v5 = v60;
      }

      if (a3) {
        v36 = @"problematicLineIndex";
      }
      else {
        v36 = @"problematic_line_index";
      }
      v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setProblematicLineIndex:", objc_msgSend(v37, "unsignedIntValue"));
      }

      if (a3) {
        v38 = @"startWaypoint";
      }
      else {
        v38 = @"start_waypoint";
      }
      v39 = [v5 objectForKeyedSubscript:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40 = [GEORPUserSearchInput alloc];
        if (a3) {
          uint64_t v41 = [(GEORPUserSearchInput *)v40 initWithJSON:v39];
        }
        else {
          uint64_t v41 = [(GEORPUserSearchInput *)v40 initWithDictionary:v39];
        }
        id v42 = (void *)v41;
        [a1 setStartWaypoint:v41];
      }
      if (a3) {
        uint64_t v43 = @"endWaypoint";
      }
      else {
        uint64_t v43 = @"end_waypoint";
      }
      uint64_t v44 = [v5 objectForKeyedSubscript:v43];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v45 = [GEORPUserSearchInput alloc];
        if (a3) {
          uint64_t v46 = [(GEORPUserSearchInput *)v45 initWithJSON:v44];
        }
        else {
          uint64_t v46 = [(GEORPUserSearchInput *)v45 initWithDictionary:v44];
        }
        v47 = (void *)v46;
        [a1 setEndWaypoint:v46];
      }
      if (a3) {
        v48 = @"instructionCorrection";
      }
      else {
        v48 = @"instruction_correction";
      }
      v49 = [v5 objectForKeyedSubscript:v48];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v50 = v49;
        uint64_t v51 = [v50 countByEnumeratingWithState:&v61 objects:v73 count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v62;
          do
          {
            for (uint64_t k = 0; k != v52; ++k)
            {
              if (*(void *)v62 != v53) {
                objc_enumerationMutation(v50);
              }
              uint64_t v55 = *(void *)(*((void *)&v61 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v56 = [GEORPInstructionCorrection alloc];
                if (a3) {
                  uint64_t v57 = [(GEORPInstructionCorrection *)v56 initWithJSON:v55];
                }
                else {
                  uint64_t v57 = [(GEORPInstructionCorrection *)v56 initWithDictionary:v55];
                }
                long long v58 = (void *)v57;
                [a1 addInstructionCorrection:v57];
              }
            }
            uint64_t v52 = [v50 countByEnumeratingWithState:&v61 objects:v73 count:16];
          }
          while (v52);
        }

        id v5 = v60;
      }
    }
  }

  return a1;
}

- (GEORPDirectionsProblem)initWithJSON:(id)a3
{
  return (GEORPDirectionsProblem *)-[GEORPDirectionsProblem _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_991;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_992;
    }
    GEORPDirectionsProblemReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPDirectionsProblemCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDirectionsProblemIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDirectionsProblemReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPDirectionsProblemIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPDirectionsProblem *)self readAll:0];
    if (self->_directionsResponseId) {
      PBDataWriterWriteDataField();
    }
    if (self->_overviewScreenshotImageData) {
      PBDataWriterWriteDataField();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v6 = self->_clientSuggestedRoutes;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v10 = self->_problematicRouteIndexs;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_startWaypoint) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_endWaypoint) {
      PBDataWriterWriteSubmessage();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = self->_instructionCorrections;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  -[GEORPDirectionsProblem _readClientSuggestedRoutes]((uint64_t)self);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = self->_clientSuggestedRoutes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v19 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
LABEL_19:

    return 1;
  }
LABEL_9:

  -[GEORPDirectionsProblem _readEndWaypoint]((uint64_t)self);
  if (![(GEORPUserSearchInput *)self->_endWaypoint hasGreenTeaWithValue:v3])
  {
    -[GEORPDirectionsProblem _readInstructionCorrections]((uint64_t)self);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = self->_instructionCorrections;
    uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (!v10)
    {
LABEL_18:

      -[GEORPDirectionsProblem _readStartWaypoint]((uint64_t)self);
      return [(GEORPUserSearchInput *)self->_startWaypoint hasGreenTeaWithValue:v3];
    }
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
        goto LABEL_19;
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
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  long long v16 = (id *)a3;
  [(GEORPDirectionsProblem *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 18) = self->_readerMarkPos;
  *((_DWORD *)v16 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_directionsResponseId) {
    objc_msgSend(v16, "setDirectionsResponseId:");
  }
  if (self->_overviewScreenshotImageData) {
    objc_msgSend(v16, "setOverviewScreenshotImageData:");
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v16 + 22) = self->_problematicStepIndex;
    *((_WORD *)v16 + 46) |= 2u;
  }
  if ([(GEORPDirectionsProblem *)self clientSuggestedRoutesCount])
  {
    [v16 clearClientSuggestedRoutes];
    unint64_t v4 = [(GEORPDirectionsProblem *)self clientSuggestedRoutesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPDirectionsProblem *)self clientSuggestedRouteAtIndex:i];
        [v16 addClientSuggestedRoute:v7];
      }
    }
  }
  if ([(GEORPDirectionsProblem *)self problematicRouteIndexsCount])
  {
    [v16 clearProblematicRouteIndexs];
    unint64_t v8 = [(GEORPDirectionsProblem *)self problematicRouteIndexsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORPDirectionsProblem *)self problematicRouteIndexAtIndex:j];
        [v16 addProblematicRouteIndex:v11];
      }
    }
  }
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v16 + 21) = self->_problematicLineIndex;
    *((_WORD *)v16 + 46) |= 1u;
  }
  if (self->_startWaypoint) {
    objc_msgSend(v16, "setStartWaypoint:");
  }
  if (self->_endWaypoint) {
    objc_msgSend(v16, "setEndWaypoint:");
  }
  if ([(GEORPDirectionsProblem *)self instructionCorrectionsCount])
  {
    [v16 clearInstructionCorrections];
    unint64_t v12 = [(GEORPDirectionsProblem *)self instructionCorrectionsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        long long v15 = [(GEORPDirectionsProblem *)self instructionCorrectionAtIndex:k];
        [v16 addInstructionCorrection:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPDirectionsProblemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      unint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_30;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPDirectionsProblem *)self readAll:0];
  uint64_t v9 = [(NSData *)self->_directionsResponseId copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSData *)self->_overviewScreenshotImageData copyWithZone:a3];
  unint64_t v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_problematicStepIndex;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v13 = self->_clientSuggestedRoutes;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addClientSuggestedRoute:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v14);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v18 = self->_problematicRouteIndexs;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v18);
        }
        long long v22 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addProblematicRouteIndex:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v19);
  }

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 84) = self->_problematicLineIndex;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  id v23 = [(GEORPUserSearchInput *)self->_startWaypoint copyWithZone:a3];
  long long v24 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v23;

  id v25 = [(GEORPUserSearchInput *)self->_endWaypoint copyWithZone:a3];
  long long v26 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v25;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v8 = self->_instructionCorrections;
  uint64_t v27 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(v8);
        }
        long long v30 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * k), "copyWithZone:", a3, (void)v32);
        [(id)v5 addInstructionCorrection:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v27);
  }
LABEL_30:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  [(GEORPDirectionsProblem *)self readAll:1];
  [v4 readAll:1];
  directionsResponseId = self->_directionsResponseId;
  if ((unint64_t)directionsResponseId | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](directionsResponseId, "isEqual:")) {
      goto LABEL_26;
    }
  }
  overviewScreenshotImageData = self->_overviewScreenshotImageData;
  if ((unint64_t)overviewScreenshotImageData | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](overviewScreenshotImageData, "isEqual:")) {
      goto LABEL_26;
    }
  }
  __int16 v7 = *((_WORD *)v4 + 46);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_problematicStepIndex != *((_DWORD *)v4 + 22)) {
      goto LABEL_26;
    }
  }
  else if ((v7 & 2) != 0)
  {
LABEL_26:
    char v14 = 0;
    goto LABEL_27;
  }
  clientSuggestedRoutes = self->_clientSuggestedRoutes;
  if ((unint64_t)clientSuggestedRoutes | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](clientSuggestedRoutes, "isEqual:"))
  {
    goto LABEL_26;
  }
  problematicRouteIndexs = self->_problematicRouteIndexs;
  if ((unint64_t)problematicRouteIndexs | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](problematicRouteIndexs, "isEqual:")) {
      goto LABEL_26;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 46);
  if (*(_WORD *)&self->_flags)
  {
    if ((v10 & 1) == 0 || self->_problematicLineIndex != *((_DWORD *)v4 + 21)) {
      goto LABEL_26;
    }
  }
  else if (v10)
  {
    goto LABEL_26;
  }
  startWaypoint = self->_startWaypoint;
  if ((unint64_t)startWaypoint | *((void *)v4 + 8)
    && !-[GEORPUserSearchInput isEqual:](startWaypoint, "isEqual:"))
  {
    goto LABEL_26;
  }
  endWaypoint = self->_endWaypoint;
  if ((unint64_t)endWaypoint | *((void *)v4 + 4))
  {
    if (!-[GEORPUserSearchInput isEqual:](endWaypoint, "isEqual:")) {
      goto LABEL_26;
    }
  }
  instructionCorrections = self->_instructionCorrections;
  if ((unint64_t)instructionCorrections | *((void *)v4 + 5)) {
    char v14 = -[NSMutableArray isEqual:](instructionCorrections, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_27:

  return v14;
}

- (unint64_t)hash
{
  [(GEORPDirectionsProblem *)self readAll:1];
  uint64_t v3 = [(NSData *)self->_directionsResponseId hash];
  uint64_t v4 = [(NSData *)self->_overviewScreenshotImageData hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_problematicStepIndex;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [(NSMutableArray *)self->_clientSuggestedRoutes hash];
  uint64_t v7 = [(NSMutableArray *)self->_problematicRouteIndexs hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v8 = 2654435761 * self->_problematicLineIndex;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(GEORPUserSearchInput *)self->_startWaypoint hash];
  unint64_t v10 = [(GEORPUserSearchInput *)self->_endWaypoint hash];
  return v9 ^ v10 ^ [(NSMutableArray *)self->_instructionCorrections hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 3)) {
    -[GEORPDirectionsProblem setDirectionsResponseId:](self, "setDirectionsResponseId:");
  }
  if (*((void *)v4 + 6)) {
    -[GEORPDirectionsProblem setOverviewScreenshotImageData:](self, "setOverviewScreenshotImageData:");
  }
  if ((*((_WORD *)v4 + 46) & 2) != 0)
  {
    self->_problematicStepIndex = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 2u;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEORPDirectionsProblem *)self addClientSuggestedRoute:*(void *)(*((void *)&v32 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v7);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = *((id *)v4 + 7);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEORPDirectionsProblem *)self addProblematicRouteIndex:*(void *)(*((void *)&v28 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v12);
  }

  if (*((_WORD *)v4 + 46))
  {
    self->_problematicLineIndex = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 1u;
  }
  startWaypoint = self->_startWaypoint;
  uint64_t v16 = *((void *)v4 + 8);
  if (startWaypoint)
  {
    if (v16) {
      -[GEORPUserSearchInput mergeFrom:](startWaypoint, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[GEORPDirectionsProblem setStartWaypoint:](self, "setStartWaypoint:");
  }
  endWaypoint = self->_endWaypoint;
  uint64_t v18 = *((void *)v4 + 4);
  if (endWaypoint)
  {
    if (v18) {
      -[GEORPUserSearchInput mergeFrom:](endWaypoint, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[GEORPDirectionsProblem setEndWaypoint:](self, "setEndWaypoint:");
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v19 = *((id *)v4 + 5);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        -[GEORPDirectionsProblem addInstructionCorrection:](self, "addInstructionCorrection:", *(void *)(*((void *)&v24 + 1) + 8 * k), (void)v24);
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v21);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startWaypoint, 0);
  objc_storeStrong((id *)&self->_problematicRouteIndexs, 0);
  objc_storeStrong((id *)&self->_overviewScreenshotImageData, 0);
  objc_storeStrong((id *)&self->_instructionCorrections, 0);
  objc_storeStrong((id *)&self->_endWaypoint, 0);
  objc_storeStrong((id *)&self->_directionsResponseId, 0);
  objc_storeStrong((id *)&self->_clientSuggestedRoutes, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end