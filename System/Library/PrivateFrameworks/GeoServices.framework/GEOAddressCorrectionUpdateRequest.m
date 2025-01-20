@interface GEOAddressCorrectionUpdateRequest
+ (BOOL)isValid:(id)a3;
+ (Class)addressResultType;
+ (Class)significantLocationType;
- (BOOL)hasAddressID;
- (BOOL)hasCorrectionStatus;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOAddressCorrectionUpdateRequest)init;
- (GEOAddressCorrectionUpdateRequest)initWithData:(id)a3;
- (GEOAddressCorrectionUpdateRequest)initWithDictionary:(id)a3;
- (GEOAddressCorrectionUpdateRequest)initWithJSON:(id)a3;
- (NSMutableArray)addressResults;
- (NSMutableArray)significantLocations;
- (NSString)addressID;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)addressResultAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)correctionStatusAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)significantLocationAtIndex:(unint64_t)a3;
- (int)StringAsCorrectionStatus:(id)a3;
- (int)correctionStatus;
- (unint64_t)addressResultsCount;
- (unint64_t)hash;
- (unint64_t)significantLocationsCount;
- (unsigned)requestTypeCode;
- (void)_addNoFlagsAddressResult:(uint64_t)a1;
- (void)_addNoFlagsSignificantLocation:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readAddressID;
- (void)_readAddressResults;
- (void)_readSignificantLocations;
- (void)addAddressResult:(id)a3;
- (void)addSignificantLocation:(id)a3;
- (void)clearAddressResults;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearSignificantLocations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddressID:(id)a3;
- (void)setAddressResults:(id)a3;
- (void)setCorrectionStatus:(int)a3;
- (void)setHasCorrectionStatus:(BOOL)a3;
- (void)setSignificantLocations:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAddressCorrectionUpdateRequest

- (GEOAddressCorrectionUpdateRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAddressCorrectionUpdateRequest;
  v2 = [(GEOAddressCorrectionUpdateRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAddressCorrectionUpdateRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAddressCorrectionUpdateRequest;
  v3 = [(GEOAddressCorrectionUpdateRequest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)correctionStatus
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_correctionStatus;
  }
  else {
    return 0;
  }
}

- (void)setCorrectionStatus:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_correctionStatus = a3;
}

- (void)setHasCorrectionStatus:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasCorrectionStatus
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)correctionStatusAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53DF1A0[a3];
  }

  return v3;
}

- (int)StringAsCorrectionStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ADDRESS_LOCATION_EXACT_MATCH"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ADDRESS_LOCATION_NEARBY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ADDRESS_LOCATION_FAR_AWAY"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readSignificantLocations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAddressCorrectionUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSignificantLocations_tags_242);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)significantLocations
{
  -[GEOAddressCorrectionUpdateRequest _readSignificantLocations]((uint64_t)self);
  significantLocations = self->_significantLocations;

  return significantLocations;
}

- (void)setSignificantLocations:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  significantLocations = self->_significantLocations;
  self->_significantLocations = v4;
}

- (void)clearSignificantLocations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  significantLocations = self->_significantLocations;

  [(NSMutableArray *)significantLocations removeAllObjects];
}

- (void)addSignificantLocation:(id)a3
{
  id v4 = a3;
  -[GEOAddressCorrectionUpdateRequest _readSignificantLocations]((uint64_t)self);
  -[GEOAddressCorrectionUpdateRequest _addNoFlagsSignificantLocation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsSignificantLocation:(uint64_t)a1
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

- (unint64_t)significantLocationsCount
{
  -[GEOAddressCorrectionUpdateRequest _readSignificantLocations]((uint64_t)self);
  significantLocations = self->_significantLocations;

  return [(NSMutableArray *)significantLocations count];
}

- (id)significantLocationAtIndex:(unint64_t)a3
{
  -[GEOAddressCorrectionUpdateRequest _readSignificantLocations]((uint64_t)self);
  significantLocations = self->_significantLocations;

  return (id)[(NSMutableArray *)significantLocations objectAtIndex:a3];
}

+ (Class)significantLocationType
{
  return (Class)objc_opt_class();
}

- (void)_readAddressID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAddressCorrectionUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressID_tags_243);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAddressID
{
  return self->_addressID != 0;
}

- (NSString)addressID
{
  -[GEOAddressCorrectionUpdateRequest _readAddressID]((uint64_t)self);
  addressID = self->_addressID;

  return addressID;
}

- (void)setAddressID:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_addressID, a3);
}

- (void)_readAddressResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAddressCorrectionUpdateRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressResults_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)addressResults
{
  -[GEOAddressCorrectionUpdateRequest _readAddressResults]((uint64_t)self);
  addressResults = self->_addressResults;

  return addressResults;
}

- (void)setAddressResults:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  addressResults = self->_addressResults;
  self->_addressResults = v4;
}

- (void)clearAddressResults
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  addressResults = self->_addressResults;

  [(NSMutableArray *)addressResults removeAllObjects];
}

- (void)addAddressResult:(id)a3
{
  id v4 = a3;
  -[GEOAddressCorrectionUpdateRequest _readAddressResults]((uint64_t)self);
  -[GEOAddressCorrectionUpdateRequest _addNoFlagsAddressResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsAddressResult:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)addressResultsCount
{
  -[GEOAddressCorrectionUpdateRequest _readAddressResults]((uint64_t)self);
  addressResults = self->_addressResults;

  return [(NSMutableArray *)addressResults count];
}

- (id)addressResultAtIndex:(unint64_t)a3
{
  -[GEOAddressCorrectionUpdateRequest _readAddressResults]((uint64_t)self);
  addressResults = self->_addressResults;

  return (id)[(NSMutableArray *)addressResults objectAtIndex:a3];
}

+ (Class)addressResultType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAddressCorrectionUpdateRequest;
  id v4 = [(GEOAddressCorrectionUpdateRequest *)&v8 description];
  id v5 = [(GEOAddressCorrectionUpdateRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAddressCorrectionUpdateRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v5 = *(int *)(a1 + 52);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53DF1A0[v5];
      }
      [v4 setObject:v6 forKey:@"correctionStatus"];
    }
    if ([*(id *)(a1 + 32) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v30 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v10);
      }

      [v4 setObject:v7 forKey:@"significantLocation"];
    }
    v15 = [(id)a1 addressID];
    if (v15) {
      [v4 setObject:v15 forKey:@"addressID"];
    }

    if ([*(id *)(a1 + 24) count])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v17 = *(id *)(a1 + 24);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v25 + 1) + 8 * j);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            v23 = [v22 dictionaryRepresentation];
            }
            [v16 addObject:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v19);
      }

      [v4 setObject:v16 forKey:@"addressResult"];
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
  return -[GEOAddressCorrectionUpdateRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOAddressCorrectionUpdateRequest)initWithDictionary:(id)a3
{
  return (GEOAddressCorrectionUpdateRequest *)-[GEOAddressCorrectionUpdateRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_46;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_46;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"correctionStatus"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"ADDRESS_LOCATION_EXACT_MATCH"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"ADDRESS_LOCATION_NEARBY"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"ADDRESS_LOCATION_FAR_AWAY"])
    {
      uint64_t v8 = 2;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_14:
    [a1 setCorrectionStatus:v8];
  }

  uint64_t v9 = [v5 objectForKeyedSubscript:@"significantLocation"];
  objc_opt_class();
  id v32 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v38 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = [GEOSignificantLocation alloc];
            if (a3) {
              uint64_t v17 = [(GEOSignificantLocation *)v16 initWithJSON:v15];
            }
            else {
              uint64_t v17 = [(GEOSignificantLocation *)v16 initWithDictionary:v15];
            }
            uint64_t v18 = (void *)v17;
            [a1 addSignificantLocation:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v12);
    }

    id v5 = v32;
  }

  uint64_t v19 = [v5 objectForKeyedSubscript:@"addressID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = (void *)[v19 copy];
    [a1 setAddressID:v20];
  }
  v21 = [v5 objectForKeyedSubscript:@"addressResult"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v22 = v21;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v28 = [GEOAddressCorrectionResult alloc];
            if (a3) {
              uint64_t v29 = [(GEOAddressCorrectionResult *)v28 initWithJSON:v27];
            }
            else {
              uint64_t v29 = [(GEOAddressCorrectionResult *)v28 initWithDictionary:v27];
            }
            long long v30 = (void *)v29;
            [a1 addAddressResult:v29];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v24);
    }

    id v5 = v32;
  }

LABEL_46:
  return a1;
}

- (GEOAddressCorrectionUpdateRequest)initWithJSON:(id)a3
{
  return (GEOAddressCorrectionUpdateRequest *)-[GEOAddressCorrectionUpdateRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_251;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_252;
    }
    GEOAddressCorrectionUpdateRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOAddressCorrectionUpdateRequestCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAddressCorrectionUpdateRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAddressCorrectionUpdateRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAddressCorrectionUpdateRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAddressCorrectionUpdateRequest *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_significantLocations;
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

    if (self->_addressID) {
      PBDataWriterWriteStringField();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_addressResults;
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
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  -[GEOAddressCorrectionUpdateRequest _readAddressResults]((uint64_t)self);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_addressResults;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v20 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_18;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOAddressCorrectionUpdateRequest _readSignificantLocations]((uint64_t)self);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_significantLocations;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3, (void)v16)) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_18:
    BOOL v14 = 1;
    goto LABEL_19;
  }
LABEL_17:
  BOOL v14 = 0;
LABEL_19:

  return v14;
}

- (unsigned)requestTypeCode
{
  return 54;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOAddressCorrectionUpdateRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 10) = self->_readerMarkPos;
  *((_DWORD *)v12 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v12 + 13) = self->_correctionStatus;
    *((unsigned char *)v12 + 56) |= 1u;
  }
  if ([(GEOAddressCorrectionUpdateRequest *)self significantLocationsCount])
  {
    [v12 clearSignificantLocations];
    unint64_t v4 = [(GEOAddressCorrectionUpdateRequest *)self significantLocationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOAddressCorrectionUpdateRequest *)self significantLocationAtIndex:i];
        [v12 addSignificantLocation:v7];
      }
    }
  }
  if (self->_addressID) {
    objc_msgSend(v12, "setAddressID:");
  }
  if ([(GEOAddressCorrectionUpdateRequest *)self addressResultsCount])
  {
    [v12 clearAddressResults];
    unint64_t v8 = [(GEOAddressCorrectionUpdateRequest *)self addressResultsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOAddressCorrectionUpdateRequest *)self addressResultAtIndex:j];
        [v12 addAddressResult:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOAddressCorrectionUpdateRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      unint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOAddressCorrectionUpdateRequest *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_correctionStatus;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v9 = self->_significantLocations;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addSignificantLocation:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_addressID copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v8 = self->_addressResults;
  uint64_t v16 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v8);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        [(id)v5 addAddressResult:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOAddressCorrectionUpdateRequest *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_correctionStatus != *((_DWORD *)v4 + 13)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  significantLocations = self->_significantLocations;
  if ((unint64_t)significantLocations | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](significantLocations, "isEqual:"))
  {
    goto LABEL_13;
  }
  addressID = self->_addressID;
  if ((unint64_t)addressID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](addressID, "isEqual:")) {
      goto LABEL_13;
    }
  }
  addressResults = self->_addressResults;
  if ((unint64_t)addressResults | *((void *)v4 + 3)) {
    char v8 = -[NSMutableArray isEqual:](addressResults, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  [(GEOAddressCorrectionUpdateRequest *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_correctionStatus;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_significantLocations hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_addressID hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_addressResults hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 56))
  {
    self->_correctionStatus = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOAddressCorrectionUpdateRequest *)self addSignificantLocation:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 2)) {
    -[GEOAddressCorrectionUpdateRequest setAddressID:](self, "setAddressID:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOAddressCorrectionUpdateRequest addAddressResult:](self, "addAddressResult:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantLocations, 0);
  objc_storeStrong((id *)&self->_addressResults, 0);
  objc_storeStrong((id *)&self->_addressID, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end