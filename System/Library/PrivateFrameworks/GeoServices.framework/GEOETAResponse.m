@interface GEOETAResponse
+ (BOOL)isValid:(id)a3;
+ (Class)etaResultReferencePointDestinationType;
+ (Class)etaResultType;
- (BOOL)hasClientMetrics;
- (BOOL)hasDatasetAbStatus;
- (BOOL)hasDebugData;
- (BOOL)hasEtaResultReferencePointOrigin;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasOriginPlaceSearchResponse;
- (BOOL)hasResponseAttributes;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOClientMetrics)clientMetrics;
- (GEOCommonResponseAttributes)responseAttributes;
- (GEOETAResponse)init;
- (GEOETAResponse)initWithData:(id)a3;
- (GEOETAResponse)initWithDictionary:(id)a3;
- (GEOETAResponse)initWithJSON:(id)a3;
- (GEOETAResult)etaResultReferencePointOrigin;
- (GEOPDDatasetABStatus)datasetAbStatus;
- (GEOPlaceSearchResponse)originPlaceSearchResponse;
- (GEOProblemDetail)problemDetailAtIndex:(unint64_t)a3;
- (GEOProblemDetail)problemDetails;
- (NSMutableArray)etaResultReferencePointDestinations;
- (NSMutableArray)etaResults;
- (NSString)debugData;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)etaResultAtIndex:(unint64_t)a3;
- (id)etaResultReferencePointDestinationAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (uint64_t)_reserveProblemDetails:(uint64_t)a1;
- (unint64_t)etaResultReferencePointDestinationsCount;
- (unint64_t)etaResultsCount;
- (unint64_t)hash;
- (unint64_t)problemDetailsCount;
- (void)_addNoFlagsEtaResult:(uint64_t)a1;
- (void)_addNoFlagsEtaResultReferencePointDestination:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readClientMetrics;
- (void)_readDatasetAbStatus;
- (void)_readDebugData;
- (void)_readEtaResultReferencePointDestinations;
- (void)_readEtaResultReferencePointOrigin;
- (void)_readEtaResults;
- (void)_readOriginPlaceSearchResponse;
- (void)_readProblemDetails;
- (void)_readResponseAttributes;
- (void)addEtaResult:(id)a3;
- (void)addEtaResultReferencePointDestination:(id)a3;
- (void)addProblemDetail:(GEOProblemDetail)a3;
- (void)clearEtaResultReferencePointDestinations;
- (void)clearEtaResults;
- (void)clearProblemDetails;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setClientMetrics:(id)a3;
- (void)setDatasetAbStatus:(id)a3;
- (void)setDebugData:(id)a3;
- (void)setEtaResultReferencePointDestinations:(id)a3;
- (void)setEtaResultReferencePointOrigin:(id)a3;
- (void)setEtaResults:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setOriginPlaceSearchResponse:(id)a3;
- (void)setProblemDetails:(GEOProblemDetail *)a3 count:(unint64_t)a4;
- (void)setResponseAttributes:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOETAResponse

- (int)status
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (id)etaResultAtIndex:(unint64_t)a3
{
  -[GEOETAResponse _readEtaResults]((uint64_t)self);
  etaResults = self->_etaResults;

  return (id)[(NSMutableArray *)etaResults objectAtIndex:a3];
}

- (void)_readEtaResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaResults_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (void)dealloc
{
  [(GEOETAResponse *)self clearProblemDetails];
  v3.receiver = self;
  v3.super_class = (Class)GEOETAResponse;
  [(GEOETAResponse *)&v3 dealloc];
}

- (void)clearProblemDetails
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  self->_problemDetailsSpace = 0;
  self->_problemDetailsCount = 0;
  free(self->_problemDetails);
  self->_problemDetails = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseAttributes, 0);
  objc_storeStrong((id *)&self->_originPlaceSearchResponse, 0);
  objc_storeStrong((id *)&self->_etaResults, 0);
  objc_storeStrong((id *)&self->_etaResultReferencePointOrigin, 0);
  objc_storeStrong((id *)&self->_etaResultReferencePointDestinations, 0);
  objc_storeStrong((id *)&self->_debugData, 0);
  objc_storeStrong((id *)&self->_datasetAbStatus, 0);
  objc_storeStrong((id *)&self->_clientMetrics, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETAResponseIsDirty((uint64_t)self) & 1) == 0)
  {
    v16 = self->_reader;
    objc_sync_enter(v16);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v17 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v17];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOETAResponse *)self readAll:0];
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v6 = self->_etaResults;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v24;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    if (self->_originPlaceSearchResponse) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_problemDetailsCount)
    {
      uint64_t v10 = 0;
      unint64_t v11 = 0;
      do
      {
        uint64_t v22 = 0;
        PBDataWriterPlaceMark();
        GEOProblemDetailWriteTo((uint64_t)&self->_problemDetails[v10]);
        PBDataWriterRecallMark();
        ++v11;
        ++v10;
      }
      while (v11 < self->_problemDetailsCount);
    }
    if (self->_etaResultReferencePointOrigin) {
      PBDataWriterWriteSubmessage();
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v12 = self->_etaResultReferencePointDestinations;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v12);
          }
          PBDataWriterWriteSubmessage();
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
      }
      while (v13);
    }

    if (self->_datasetAbStatus) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_debugData) {
      PBDataWriterWriteStringField();
    }
    if (self->_responseAttributes) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_clientMetrics) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v18);
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_639;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_640;
    }
    GEOETAResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOETAResponseCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (void)_addNoFlagsEtaResult:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      id v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)setClientMetrics:(id)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  objc_storeStrong((id *)&self->_clientMetrics, a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETAResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (GEOETAResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOETAResponse;
  v2 = [(GEOETAResponse *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOETAResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOETAResponse;
  id v3 = [(GEOETAResponse *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (GEOPDDatasetABStatus)datasetAbStatus
{
  -[GEOETAResponse _readDatasetAbStatus]((uint64_t)self);
  datasetAbStatus = self->_datasetAbStatus;

  return datasetAbStatus;
}

- (void)_readDatasetAbStatus
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDatasetAbStatus_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

+ (BOOL)isValid:(id)a3
{
  return GEOETAResponseIsValid((char *)a3);
}

- (void)setStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasStatus
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 <= 29)
  {
    id v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        id v4 = @"STATUS_FAILED";
        break;
      case 2:
        id v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        id v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        id v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      id v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      id v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        id v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    id v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS_FAILED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_INCOMPLETE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INVALID_REQUEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAILED_NO_RESULT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"NEEDS_REFINEMENT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"STATUS_DEDUPED"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"VERSION_MISMATCH"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSMutableArray)etaResults
{
  -[GEOETAResponse _readEtaResults]((uint64_t)self);
  etaResults = self->_etaResults;

  return etaResults;
}

- (void)setEtaResults:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  etaResults = self->_etaResults;
  self->_etaResults = v4;
}

- (void)clearEtaResults
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  etaResults = self->_etaResults;

  [(NSMutableArray *)etaResults removeAllObjects];
}

- (void)addEtaResult:(id)a3
{
  id v4 = a3;
  -[GEOETAResponse _readEtaResults]((uint64_t)self);
  -[GEOETAResponse _addNoFlagsEtaResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (unint64_t)etaResultsCount
{
  -[GEOETAResponse _readEtaResults]((uint64_t)self);
  etaResults = self->_etaResults;

  return [(NSMutableArray *)etaResults count];
}

+ (Class)etaResultType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginPlaceSearchResponse
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginPlaceSearchResponse_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasOriginPlaceSearchResponse
{
  return self->_originPlaceSearchResponse != 0;
}

- (GEOPlaceSearchResponse)originPlaceSearchResponse
{
  -[GEOETAResponse _readOriginPlaceSearchResponse]((uint64_t)self);
  originPlaceSearchResponse = self->_originPlaceSearchResponse;

  return originPlaceSearchResponse;
}

- (void)setOriginPlaceSearchResponse:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_originPlaceSearchResponse, a3);
}

- (void)_readProblemDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemDetails_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)problemDetailsCount
{
  return self->_problemDetailsCount;
}

- (GEOProblemDetail)problemDetails
{
  return self->_problemDetails;
}

- (uint64_t)_reserveProblemDetails:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 40);
    if (v6 >= v5) {
      return 1;
    }
    unint64_t v7 = v6 + a2;
    if (v6 + a2)
    {
      unint64_t v8 = 1;
      while (1)
      {
        unint64_t v9 = v8;
        if (v8 >= v7) {
          break;
        }
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          unint64_t v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < a2) {
      return 0;
    }
LABEL_12:
    if (12 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 12 * v9, 0x3243262AuLL);
    if (result)
    {
      *(void *)(a1 + 40) = v9;
      *(void *)(a1 + 24) = result;
      bzero((void *)(result + 12 * *(void *)(a1 + 32)), 12 * (v9 - *(void *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (void)addProblemDetail:(GEOProblemDetail)a3
{
  $7D24B5AD5894795FD85A0EE1D817D743 var2 = a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  -[GEOETAResponse _readProblemDetails]((uint64_t)self);
  if (self && -[GEOETAResponse _reserveProblemDetails:]((uint64_t)self, 1uLL))
  {
    unint64_t v6 = &self->_problemDetails[self->_problemDetailsCount];
    *(void *)&v6->var0 = v4;
    v6->$7D24B5AD5894795FD85A0EE1D817D743 var2 = var2;
    ++self->_problemDetailsCount;
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (GEOProblemDetail)problemDetailAtIndex:(unint64_t)a3
{
  -[GEOETAResponse _readProblemDetails]((uint64_t)self);
  unint64_t problemDetailsCount = self->_problemDetailsCount;
  if (problemDetailsCount <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, problemDetailsCount);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  uint64_t v10 = &self->_problemDetails[a3];
  uint64_t v11 = *(void *)&v10->var0;
  $7D24B5AD5894795FD85A0EE1D817D743 var2 = v10->var2;
  result.var0 = v11;
  result.var1 = HIDWORD(v11);
  result.$7D24B5AD5894795FD85A0EE1D817D743 var2 = var2;
  return result;
}

- (void)setProblemDetails:(GEOProblemDetail *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  [(GEOETAResponse *)self clearProblemDetails];
  if (-[GEOETAResponse _reserveProblemDetails:]((uint64_t)self, a4))
  {
    memcpy(self->_problemDetails, a3, 12 * a4);
    self->_unint64_t problemDetailsCount = a4;
  }
}

- (void)_readEtaResultReferencePointOrigin
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaResultReferencePointOrigin_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasEtaResultReferencePointOrigin
{
  return self->_etaResultReferencePointOrigin != 0;
}

- (GEOETAResult)etaResultReferencePointOrigin
{
  -[GEOETAResponse _readEtaResultReferencePointOrigin]((uint64_t)self);
  etaResultReferencePointOrigin = self->_etaResultReferencePointOrigin;

  return etaResultReferencePointOrigin;
}

- (void)setEtaResultReferencePointOrigin:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_etaResultReferencePointOrigin, a3);
}

- (void)_readEtaResultReferencePointDestinations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaResultReferencePointDestinations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)etaResultReferencePointDestinations
{
  -[GEOETAResponse _readEtaResultReferencePointDestinations]((uint64_t)self);
  etaResultReferencePointDestinations = self->_etaResultReferencePointDestinations;

  return etaResultReferencePointDestinations;
}

- (void)setEtaResultReferencePointDestinations:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  etaResultReferencePointDestinations = self->_etaResultReferencePointDestinations;
  self->_etaResultReferencePointDestinations = v4;
}

- (void)clearEtaResultReferencePointDestinations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  etaResultReferencePointDestinations = self->_etaResultReferencePointDestinations;

  [(NSMutableArray *)etaResultReferencePointDestinations removeAllObjects];
}

- (void)addEtaResultReferencePointDestination:(id)a3
{
  id v4 = a3;
  -[GEOETAResponse _readEtaResultReferencePointDestinations]((uint64_t)self);
  -[GEOETAResponse _addNoFlagsEtaResultReferencePointDestination:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsEtaResultReferencePointDestination:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)etaResultReferencePointDestinationsCount
{
  -[GEOETAResponse _readEtaResultReferencePointDestinations]((uint64_t)self);
  etaResultReferencePointDestinations = self->_etaResultReferencePointDestinations;

  return [(NSMutableArray *)etaResultReferencePointDestinations count];
}

- (id)etaResultReferencePointDestinationAtIndex:(unint64_t)a3
{
  -[GEOETAResponse _readEtaResultReferencePointDestinations]((uint64_t)self);
  etaResultReferencePointDestinations = self->_etaResultReferencePointDestinations;

  return (id)[(NSMutableArray *)etaResultReferencePointDestinations objectAtIndex:a3];
}

+ (Class)etaResultReferencePointDestinationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDatasetAbStatus
{
  return self->_datasetAbStatus != 0;
}

- (void)setDatasetAbStatus:(id)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  objc_storeStrong((id *)&self->_datasetAbStatus, a3);
}

- (void)_readDebugData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDebugData_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasDebugData
{
  return self->_debugData != 0;
}

- (NSString)debugData
{
  -[GEOETAResponse _readDebugData]((uint64_t)self);
  debugData = self->_debugData;

  return debugData;
}

- (void)setDebugData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x820u;
  objc_storeStrong((id *)&self->_debugData, a3);
}

- (void)_readResponseAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResponseAttributes_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasResponseAttributes
{
  return self->_responseAttributes != 0;
}

- (GEOCommonResponseAttributes)responseAttributes
{
  -[GEOETAResponse _readResponseAttributes]((uint64_t)self);
  responseAttributes = self->_responseAttributes;

  return responseAttributes;
}

- (void)setResponseAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_responseAttributes, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOETAResponse;
  id v4 = [(GEOETAResponse *)&v8 description];
  id v5 = [(GEOETAResponse *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETAResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_84;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(_WORD *)(a1 + 128))
  {
    int v5 = *(_DWORD *)(a1 + 124);
    if (v5 <= 29)
    {
      unint64_t v6 = @"STATUS_SUCCESS";
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          unint64_t v6 = @"STATUS_FAILED";
          break;
        case 2:
          unint64_t v6 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          unint64_t v6 = @"INVALID_REQUEST";
          break;
        default:
          if (v5 != 20) {
            goto LABEL_15;
          }
          unint64_t v6 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        unint64_t v6 = @"STATUS_DEDUPED";
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        unint64_t v6 = @"VERSION_MISMATCH";
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        unint64_t v6 = @"NEEDS_REFINEMENT";
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        unint64_t v6 = @"FAILED_NOT_AUTHORIZED";
LABEL_20:
        [v4 setObject:v6 forKey:@"status"];

        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 124));
    unint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if ([*(id *)(a1 + 88) count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v8 = *(id *)(a1 + 88);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v60 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          if (a2) {
            [v13 jsonRepresentation];
          }
          else {
          uint64_t v14 = [v13 dictionaryRepresentation];
          }
          [v7 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"etaResult"];
  }
  uint64_t v15 = [(id)a1 originPlaceSearchResponse];
  v16 = v15;
  if (v15)
  {
    if (a2) {
      [v15 jsonRepresentation];
    }
    else {
    v17 = [v15 dictionaryRepresentation];
    }
    [v4 setObject:v17 forKey:@"originPlaceSearchResponse"];
  }
  if (*(void *)(a1 + 32))
  {
    long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 32))
    {
      uint64_t v19 = 0;
      unint64_t v20 = 0;
      do
      {
        long long v21 = _GEOProblemDetailDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 24) + v19));
        [v18 addObject:v21];

        ++v20;
        v19 += 12;
      }
      while (v20 < *(void *)(a1 + 32));
    }
    [v4 setObject:v18 forKey:@"problemDetail"];
  }
  uint64_t v22 = [(id)a1 etaResultReferencePointOrigin];
  long long v23 = v22;
  if (v22)
  {
    if (a2) {
      [v22 jsonRepresentation];
    }
    else {
    long long v24 = [v22 dictionaryRepresentation];
    }
    [v4 setObject:v24 forKey:@"etaResultReferencePointOrigin"];
  }
  if ([*(id *)(a1 + 72) count])
  {
    long long v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v26 = *(id *)(a1 + 72);
    uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v56 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v55 + 1) + 8 * j);
          if (a2) {
            [v31 jsonRepresentation];
          }
          else {
          v32 = [v31 dictionaryRepresentation];
          }
          [v25 addObject:v32];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v55 objects:v63 count:16];
      }
      while (v28);
    }

    [v4 setObject:v25 forKey:@"etaResultReferencePointDestination"];
  }
  v33 = [(id)a1 datasetAbStatus];
  v34 = v33;
  if (v33)
  {
    if (a2)
    {
      v35 = [v33 jsonRepresentation];
      v36 = @"datasetAbStatus";
    }
    else
    {
      v35 = [v33 dictionaryRepresentation];
      v36 = @"dataset_ab_status";
    }
    [v4 setObject:v35 forKey:v36];
  }
  v37 = [(id)a1 debugData];
  if (v37)
  {
    if (a2) {
      v38 = @"debugData";
    }
    else {
      v38 = @"debug_data";
    }
    [v4 setObject:v37 forKey:v38];
  }

  v39 = [(id)a1 responseAttributes];
  v40 = v39;
  if (v39)
  {
    if (a2)
    {
      v41 = [v39 jsonRepresentation];
      v42 = @"responseAttributes";
    }
    else
    {
      v41 = [v39 dictionaryRepresentation];
      v42 = @"response_attributes";
    }
    [v4 setObject:v41 forKey:v42];
  }
  v43 = [(id)a1 clientMetrics];
  v44 = v43;
  if (v43)
  {
    if (a2) {
      [v43 jsonRepresentation];
    }
    else {
    v45 = [v43 dictionaryRepresentation];
    }
    [v4 setObject:v45 forKey:@"clientMetrics"];
  }
  v46 = *(void **)(a1 + 16);
  if (v46)
  {
    v47 = [v46 dictionaryRepresentation];
    v48 = v47;
    if (a2)
    {
      v49 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v47, "count"));
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __44__GEOETAResponse__dictionaryRepresentation___block_invoke;
      v53[3] = &unk_1E53D8860;
      id v50 = v49;
      id v54 = v50;
      [v48 enumerateKeysAndObjectsUsingBlock:v53];
      id v51 = v50;

      v48 = v51;
    }
    [v4 setObject:v48 forKey:@"Unknown Fields"];
  }
LABEL_84:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOETAResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOETAResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOETAResponse)initWithDictionary:(id)a3
{
  return (GEOETAResponse *)-[GEOETAResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (!a1) {
    goto LABEL_104;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_104;
  }
  id v7 = [v6 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"STATUS_SUCCESS"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"STATUS_FAILED"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"INVALID_REQUEST"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"FAILED_NO_RESULT"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      uint64_t v9 = 30;
    }
    else if ([v8 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      uint64_t v9 = 40;
    }
    else if ([v8 isEqualToString:@"STATUS_DEDUPED"])
    {
      uint64_t v9 = 50;
    }
    else if ([v8 isEqualToString:@"VERSION_MISMATCH"])
    {
      uint64_t v9 = 60;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_26:
    [a1 setStatus:v9];
  }

  id v10 = [v6 objectForKeyedSubscript:@"etaResult"];
  objc_opt_class();
  id v60 = v6;
  if (objc_opt_isKindOfClass())
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v71 objects:v77 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v72;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v72 != v14) {
            objc_enumerationMutation(v11);
          }
          unint64_t v3 = *(void *)(*((void *)&v71 + 1) + 8 * v15);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = [GEOETAResult alloc];
            if (v16) {
              unint64_t v3 = -[GEOETAResult _initWithDictionary:isJSON:](v16, (void *)v3, a3);
            }
            else {
              unint64_t v3 = 0;
            }
            [a1 addEtaResult:v3];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v17 = [v11 countByEnumeratingWithState:&v71 objects:v77 count:16];
        uint64_t v13 = v17;
      }
      while (v17);
    }

    id v6 = v60;
  }

  long long v18 = [v6 objectForKeyedSubscript:@"originPlaceSearchResponse"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v19 = [GEOPlaceSearchResponse alloc];
    if (a3) {
      uint64_t v20 = [(GEOPlaceSearchResponse *)v19 initWithJSON:v18];
    }
    else {
      uint64_t v20 = [(GEOPlaceSearchResponse *)v19 initWithDictionary:v18];
    }
    long long v21 = (void *)v20;
    [a1 setOriginPlaceSearchResponse:v20];
  }
  uint64_t v22 = [v6 objectForKeyedSubscript:@"problemDetail"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v68 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned int v66 = 0;
            uint64_t v65 = 0;
            _GEOProblemDetailFromDictionaryRepresentation(v28, (uint64_t)&v65);
            unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v66;
            objc_msgSend(a1, "addProblemDetail:", v65, v3);
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v67 objects:v76 count:16];
      }
      while (v25);
    }

    id v6 = v60;
  }

  uint64_t v29 = [v6 objectForKeyedSubscript:@"etaResultReferencePointOrigin"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [GEOETAResult alloc];
    if (v30) {
      v31 = (void *)-[GEOETAResult _initWithDictionary:isJSON:](v30, v29, a3);
    }
    else {
      v31 = 0;
    }
    [a1 setEtaResultReferencePointOrigin:v31];
  }
  v32 = [v6 objectForKeyedSubscript:@"etaResultReferencePointDestination"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v33 = v32;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v61 objects:v75 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v62;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v62 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v61 + 1) + 8 * v37);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v39 = [GEOETAResult alloc];
            if (v39) {
              v40 = (void *)-[GEOETAResult _initWithDictionary:isJSON:](v39, v38, a3);
            }
            else {
              v40 = 0;
            }
            [a1 addEtaResultReferencePointDestination:v40];
          }
          ++v37;
        }
        while (v35 != v37);
        uint64_t v41 = [v33 countByEnumeratingWithState:&v61 objects:v75 count:16];
        uint64_t v35 = v41;
      }
      while (v41);
    }

    id v6 = v60;
  }

  if (a3) {
    v42 = @"datasetAbStatus";
  }
  else {
    v42 = @"dataset_ab_status";
  }
  v43 = [v6 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v44 = [GEOPDDatasetABStatus alloc];
    if (a3) {
      uint64_t v45 = [(GEOPDDatasetABStatus *)v44 initWithJSON:v43];
    }
    else {
      uint64_t v45 = [(GEOPDDatasetABStatus *)v44 initWithDictionary:v43];
    }
    v46 = (void *)v45;
    [a1 setDatasetAbStatus:v45];
  }
  if (a3) {
    v47 = @"debugData";
  }
  else {
    v47 = @"debug_data";
  }
  v48 = [v6 objectForKeyedSubscript:v47];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v49 = (void *)[v48 copy];
    [a1 setDebugData:v49];
  }
  if (a3) {
    id v50 = @"responseAttributes";
  }
  else {
    id v50 = @"response_attributes";
  }
  id v51 = [v6 objectForKeyedSubscript:v50];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v52 = [GEOCommonResponseAttributes alloc];
    if (a3) {
      uint64_t v53 = [(GEOCommonResponseAttributes *)v52 initWithJSON:v51];
    }
    else {
      uint64_t v53 = [(GEOCommonResponseAttributes *)v52 initWithDictionary:v51];
    }
    id v54 = (void *)v53;
    [a1 setResponseAttributes:v53];
  }
  long long v55 = [v6 objectForKeyedSubscript:@"clientMetrics"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v56 = [GEOClientMetrics alloc];
    if (a3) {
      uint64_t v57 = [(GEOClientMetrics *)v56 initWithJSON:v55];
    }
    else {
      uint64_t v57 = [(GEOClientMetrics *)v56 initWithDictionary:v55];
    }
    long long v58 = (void *)v57;
    [a1 setClientMetrics:v57];
  }
LABEL_104:

  return a1;
}

- (GEOETAResponse)initWithJSON:(id)a3
{
  return (GEOETAResponse *)-[GEOETAResponse _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  -[GEOETAResponse _readEtaResults]((uint64_t)self);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = self->_etaResults;
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
      if (-[GEOETAResult hasGreenTeaWithValue:](*(void *)(*((void *)&v19 + 1) + 8 * v9), v3)) {
        goto LABEL_19;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOETAResponse _readEtaResultReferencePointDestinations]((uint64_t)self);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_etaResultReferencePointDestinations;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v16 != v12) {
        objc_enumerationMutation(v5);
      }
      if (-[GEOETAResult hasGreenTeaWithValue:](*(void *)(*((void *)&v15 + 1) + 8 * v13), v3)) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_19:

    return 1;
  }
LABEL_17:

  -[GEOETAResponse _readEtaResultReferencePointOrigin]((uint64_t)self);
  if ((-[GEOETAResult hasGreenTeaWithValue:]((uint64_t)self->_etaResultReferencePointOrigin, v3) & 1) == 0)
  {
    -[GEOETAResponse _readOriginPlaceSearchResponse]((uint64_t)self);
    return -[GEOPlaceSearchResponse hasGreenTeaWithValue:](self->_originPlaceSearchResponse, "hasGreenTeaWithValue:", v3, (void)v15);
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  long long v18 = (id *)a3;
  [(GEOETAResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v18 + 1, self->_reader);
  *((_DWORD *)v18 + 28) = self->_readerMarkPos;
  *((_DWORD *)v18 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v18 + 31) = self->_status;
    *((_WORD *)v18 + 64) |= 1u;
  }
  if ([(GEOETAResponse *)self etaResultsCount])
  {
    [v18 clearEtaResults];
    unint64_t v4 = [(GEOETAResponse *)self etaResultsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOETAResponse *)self etaResultAtIndex:i];
        [v18 addEtaResult:v7];
      }
    }
  }
  if (self->_originPlaceSearchResponse) {
    objc_msgSend(v18, "setOriginPlaceSearchResponse:");
  }
  if ([(GEOETAResponse *)self problemDetailsCount])
  {
    [v18 clearProblemDetails];
    unint64_t v8 = [(GEOETAResponse *)self problemDetailsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOETAResponse *)self problemDetailAtIndex:j];
        objc_msgSend(v18, "addProblemDetail:", v11, v12);
      }
    }
  }
  if (self->_etaResultReferencePointOrigin) {
    objc_msgSend(v18, "setEtaResultReferencePointOrigin:");
  }
  if ([(GEOETAResponse *)self etaResultReferencePointDestinationsCount])
  {
    [v18 clearEtaResultReferencePointDestinations];
    unint64_t v13 = [(GEOETAResponse *)self etaResultReferencePointDestinationsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        long long v16 = [(GEOETAResponse *)self etaResultReferencePointDestinationAtIndex:k];
        [v18 addEtaResultReferencePointDestination:v16];
      }
    }
  }
  if (self->_datasetAbStatus) {
    objc_msgSend(v18, "setDatasetAbStatus:");
  }
  long long v17 = v18;
  if (self->_debugData)
  {
    objc_msgSend(v18, "setDebugData:");
    long long v17 = v18;
  }
  if (self->_responseAttributes)
  {
    objc_msgSend(v18, "setResponseAttributes:");
    long long v17 = v18;
  }
  if (self->_clientMetrics)
  {
    objc_msgSend(v18, "setClientMetrics:");
    long long v17 = v18;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOETAResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOETAResponse *)self readAll:0];
  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 124) = self->_status;
    *(_WORD *)(v5 + 128) |= 1u;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  unint64_t v9 = self->_etaResults;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addEtaResult:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v10);
  }

  id v14 = [(GEOPlaceSearchResponse *)self->_originPlaceSearchResponse copyWithZone:a3];
  long long v15 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v14;

  unint64_t problemDetailsCount = self->_problemDetailsCount;
  if (problemDetailsCount)
  {
    -[GEOETAResponse _reserveProblemDetails:](v5, problemDetailsCount);
    memcpy(*(void **)(v5 + 24), self->_problemDetails, 12 * self->_problemDetailsCount);
    *(void *)(v5 + 32) = self->_problemDetailsCount;
  }
  id v17 = [(GEOETAResult *)self->_etaResultReferencePointOrigin copyWithZone:a3];
  long long v18 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v17;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v19 = self->_etaResultReferencePointDestinations;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v19);
        }
        id v23 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * j), "copyWithZone:", a3, (void)v34);
        [(id)v5 addEtaResultReferencePointDestination:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v20);
  }

  id v24 = [(GEOPDDatasetABStatus *)self->_datasetAbStatus copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v24;

  uint64_t v26 = [(NSString *)self->_debugData copyWithZone:a3];
  uint64_t v27 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v26;

  id v28 = [(GEOCommonResponseAttributes *)self->_responseAttributes copyWithZone:a3];
  uint64_t v29 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v28;

  id v30 = [(GEOClientMetrics *)self->_clientMetrics copyWithZone:a3];
  v31 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v30;

  v32 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v32;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOETAResponse *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 64);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_status != *((_DWORD *)v4 + 31)) {
      goto LABEL_13;
    }
  }
  else if (v5)
  {
LABEL_13:
    char v9 = 0;
    goto LABEL_14;
  }
  etaResults = self->_etaResults;
  if ((unint64_t)etaResults | (unint64_t)v4[11]
    && !-[NSMutableArray isEqual:](etaResults, "isEqual:"))
  {
    goto LABEL_13;
  }
  originPlaceSearchResponse = self->_originPlaceSearchResponse;
  if ((unint64_t)originPlaceSearchResponse | (unint64_t)v4[12])
  {
    if (!-[GEOPlaceSearchResponse isEqual:](originPlaceSearchResponse, "isEqual:")) {
      goto LABEL_13;
    }
  }
  unint64_t problemDetailsCount = self->_problemDetailsCount;
  if ((const void *)problemDetailsCount != v4[4]) {
    goto LABEL_13;
  }
  if (memcmp(self->_problemDetails, v4[3], 12 * problemDetailsCount)) {
    goto LABEL_13;
  }
  etaResultReferencePointOrigin = self->_etaResultReferencePointOrigin;
  if ((unint64_t)etaResultReferencePointOrigin | (unint64_t)v4[10])
  {
    if (!-[GEOETAResult isEqual:](etaResultReferencePointOrigin, "isEqual:")) {
      goto LABEL_13;
    }
  }
  etaResultReferencePointDestinations = self->_etaResultReferencePointDestinations;
  if ((unint64_t)etaResultReferencePointDestinations | (unint64_t)v4[9])
  {
    if (!-[NSMutableArray isEqual:](etaResultReferencePointDestinations, "isEqual:")) {
      goto LABEL_13;
    }
  }
  datasetAbStatus = self->_datasetAbStatus;
  if ((unint64_t)datasetAbStatus | (unint64_t)v4[7])
  {
    if (!-[GEOPDDatasetABStatus isEqual:](datasetAbStatus, "isEqual:")) {
      goto LABEL_13;
    }
  }
  debugData = self->_debugData;
  if ((unint64_t)debugData | (unint64_t)v4[8])
  {
    if (!-[NSString isEqual:](debugData, "isEqual:")) {
      goto LABEL_13;
    }
  }
  responseAttributes = self->_responseAttributes;
  if ((unint64_t)responseAttributes | (unint64_t)v4[13])
  {
    if (!-[GEOCommonResponseAttributes isEqual:](responseAttributes, "isEqual:")) {
      goto LABEL_13;
    }
  }
  clientMetrics = self->_clientMetrics;
  if ((unint64_t)clientMetrics | (unint64_t)v4[6]) {
    char v9 = -[GEOClientMetrics isEqual:](clientMetrics, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_14:

  return v9;
}

- (unint64_t)hash
{
  [(GEOETAResponse *)self readAll:1];
  if (*(_WORD *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_status;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_etaResults hash] ^ v3;
  unint64_t v5 = v4 ^ [(GEOPlaceSearchResponse *)self->_originPlaceSearchResponse hash];
  uint64_t v6 = PBHashBytes();
  unint64_t v7 = v5 ^ [(GEOETAResult *)self->_etaResultReferencePointOrigin hash] ^ v6;
  uint64_t v8 = [(NSMutableArray *)self->_etaResultReferencePointDestinations hash];
  unint64_t v9 = v8 ^ [(GEOPDDatasetABStatus *)self->_datasetAbStatus hash];
  NSUInteger v10 = v9 ^ [(NSString *)self->_debugData hash];
  unint64_t v11 = v10 ^ [(GEOCommonResponseAttributes *)self->_responseAttributes hash];
  return v7 ^ v11 ^ [(GEOClientMetrics *)self->_clientMetrics hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((_WORD *)v4 + 64))
  {
    self->_status = *((_DWORD *)v4 + 31);
    *(_WORD *)&self->_flags |= 1u;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v5 = *((id *)v4 + 11);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOETAResponse *)self addEtaResult:*(void *)(*((void *)&v48 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v7);
  }

  originPlaceSearchResponse = self->_originPlaceSearchResponse;
  uint64_t v11 = *((void *)v4 + 12);
  if (originPlaceSearchResponse)
  {
    if (v11) {
      -[GEOPlaceSearchResponse mergeFrom:](originPlaceSearchResponse, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOETAResponse setOriginPlaceSearchResponse:](self, "setOriginPlaceSearchResponse:");
  }
  uint64_t v12 = [v4 problemDetailsCount];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t j = 0; j != v13; ++j)
    {
      uint64_t v15 = [v4 problemDetailAtIndex:j];
      -[GEOETAResponse addProblemDetail:](self, "addProblemDetail:", v15, v16);
    }
  }
  etaResultReferencePointOrigiuint64_t n = self->_etaResultReferencePointOrigin;
  long long v18 = (void *)*((void *)v4 + 10);
  if (etaResultReferencePointOrigin)
  {
    if (!v18) {
      goto LABEL_51;
    }
    id v19 = v18;
    -[GEOETAResult readAll:]((uint64_t)v19, 0);
    __int16 v20 = *((_WORD *)v19 + 38);
    if ((v20 & 8) != 0)
    {
      etaResultReferencePointOrigin->_status = *((_DWORD *)v19 + 18);
      *(_WORD *)&etaResultReferencePointOrigin->_flags |= 8u;
      __int16 v20 = *((_WORD *)v19 + 38);
      if ((v20 & 4) == 0)
      {
LABEL_22:
        if ((v20 & 2) == 0)
        {
LABEL_24:
          placeSearchResponse = etaResultReferencePointOrigin->_placeSearchResponse;
          uint64_t v22 = *((void *)v19 + 4);
          if (placeSearchResponse)
          {
            if (v22) {
              -[GEOPlaceSearchResponse mergeFrom:](placeSearchResponse, "mergeFrom:");
            }
          }
          else if (v22)
          {
            -[GEOETAResult setPlaceSearchResponse:]((uint64_t)etaResultReferencePointOrigin, *((void **)v19 + 4));
          }
          if (*((_WORD *)v19 + 38))
          {
            etaResultReferencePointOrigin->_distance = *((_DWORD *)v19 + 15);
            *(_WORD *)&etaResultReferencePointOrigin->_flags |= 1u;
          }
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v23 = *((id *)v19 + 5);
          uint64_t v24 = [v23 countByEnumeratingWithState:&v56 objects:v63 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v57;
            do
            {
              for (uint64_t k = 0; k != v25; ++k)
              {
                if (*(void *)v57 != v26) {
                  objc_enumerationMutation(v23);
                }
                -[GEOETAResult addSortedETA:]((uint64_t)etaResultReferencePointOrigin, *(void **)(*((void *)&v56 + 1) + 8 * k));
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v56 objects:v63 count:16];
            }
            while (v25);
          }

          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v28 = *((id *)v19 + 3);
          uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v62 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v53;
            do
            {
              for (uint64_t m = 0; m != v30; ++m)
              {
                if (*(void *)v53 != v31) {
                  objc_enumerationMutation(v28);
                }
                -[GEOETAResult addEtaRouteIncident:]((uint64_t)etaResultReferencePointOrigin, *(void **)(*((void *)&v52 + 1) + 8 * m));
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v52 objects:v62 count:16];
            }
            while (v30);
          }

          goto LABEL_51;
        }
LABEL_23:
        etaResultReferencePointOrigin->_historicTravelTime = *((_DWORD *)v19 + 16);
        *(_WORD *)&etaResultReferencePointOrigin->_flags |= 2u;
        goto LABEL_24;
      }
    }
    else if ((v20 & 4) == 0)
    {
      goto LABEL_22;
    }
    etaResultReferencePointOrigin->_liveTravelTime = *((_DWORD *)v19 + 17);
    *(_WORD *)&etaResultReferencePointOrigin->_flags |= 4u;
    if ((*((_WORD *)v19 + 38) & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (v18) {
    -[GEOETAResponse setEtaResultReferencePointOrigin:](self, "setEtaResultReferencePointOrigin:");
  }
LABEL_51:
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v33 = *((id *)v4 + 9);
  uint64_t v34 = [v33 countByEnumeratingWithState:&v44 objects:v60 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v45;
    do
    {
      for (uint64_t n = 0; n != v35; ++n)
      {
        if (*(void *)v45 != v36) {
          objc_enumerationMutation(v33);
        }
        -[GEOETAResponse addEtaResultReferencePointDestination:](self, "addEtaResultReferencePointDestination:", *(void *)(*((void *)&v44 + 1) + 8 * n), (void)v44);
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v44 objects:v60 count:16];
    }
    while (v35);
  }

  datasetAbStatus = self->_datasetAbStatus;
  uint64_t v39 = *((void *)v4 + 7);
  if (datasetAbStatus)
  {
    if (v39) {
      -[GEOPDDatasetABStatus mergeFrom:](datasetAbStatus, "mergeFrom:");
    }
  }
  else if (v39)
  {
    -[GEOETAResponse setDatasetAbStatus:](self, "setDatasetAbStatus:");
  }
  if (*((void *)v4 + 8)) {
    -[GEOETAResponse setDebugData:](self, "setDebugData:");
  }
  responseAttributes = self->_responseAttributes;
  uint64_t v41 = *((void *)v4 + 13);
  if (responseAttributes)
  {
    if (v41) {
      -[GEOCommonResponseAttributes mergeFrom:](responseAttributes, "mergeFrom:");
    }
  }
  else if (v41)
  {
    -[GEOETAResponse setResponseAttributes:](self, "setResponseAttributes:");
  }
  clientMetrics = self->_clientMetrics;
  uint64_t v43 = *((void *)v4 + 6);
  if (clientMetrics)
  {
    if (v43) {
      -[GEOClientMetrics mergeFrom:](clientMetrics, "mergeFrom:");
    }
  }
  else if (v43)
  {
    -[GEOETAResponse setClientMetrics:](self, "setClientMetrics:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOETAResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_644);
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
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x802u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOETAResponse *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_etaResults;
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
          -[GEOETAResult clearUnknownFields:](*(void *)(*((void *)&v21 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    [(GEOPlaceSearchResponse *)self->_originPlaceSearchResponse clearUnknownFields:1];
    -[GEOETAResult clearUnknownFields:]((uint64_t)self->_etaResultReferencePointOrigin);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = self->_etaResultReferencePointDestinations;
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
          -[GEOETAResult clearUnknownFields:](*(void *)(*((void *)&v17 + 1) + 8 * v16++));
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }

    -[GEOPDDatasetABStatus clearUnknownFields:](self->_datasetAbStatus, "clearUnknownFields:", 1, (void)v17);
    [(GEOCommonResponseAttributes *)self->_responseAttributes clearUnknownFields:1];
    [(GEOClientMetrics *)self->_clientMetrics clearUnknownFields:1];
  }
}

- (void)_readClientMetrics
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientMetrics_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasClientMetrics
{
  return self->_clientMetrics != 0;
}

- (GEOClientMetrics)clientMetrics
{
  -[GEOETAResponse _readClientMetrics]((uint64_t)self);
  clientMetrics = self->_clientMetrics;

  return clientMetrics;
}

@end