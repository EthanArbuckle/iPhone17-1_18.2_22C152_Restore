@interface GEOWiFiQualityServiceResponse
+ (BOOL)isValid:(id)a3;
+ (Class)locationResultsType;
+ (Class)networkResultsType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasStatusCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWiFiQualityServiceResponse)init;
- (GEOWiFiQualityServiceResponse)initWithData:(id)a3;
- (GEOWiFiQualityServiceResponse)initWithDictionary:(id)a3;
- (GEOWiFiQualityServiceResponse)initWithJSON:(id)a3;
- (NSMutableArray)locationResults;
- (NSMutableArray)networkResults;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)locationResultsAtIndex:(unint64_t)a3;
- (id)networkResultsAtIndex:(unint64_t)a3;
- (id)statusCodeAsString:(int)a3;
- (int)StringAsStatusCode:(id)a3;
- (int)statusCode;
- (unint64_t)hash;
- (unint64_t)locationResultsCount;
- (unint64_t)networkResultsCount;
- (void)_addNoFlagsLocationResults:(uint64_t)a1;
- (void)_addNoFlagsNetworkResults:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLocationResults;
- (void)_readNetworkResults;
- (void)addLocationResults:(id)a3;
- (void)addNetworkResults:(id)a3;
- (void)clearLocationResults;
- (void)clearNetworkResults;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasStatusCode:(BOOL)a3;
- (void)setLocationResults:(id)a3;
- (void)setNetworkResults:(id)a3;
- (void)setStatusCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiQualityServiceResponse

- (GEOWiFiQualityServiceResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiQualityServiceResponse;
  v2 = [(GEOWiFiQualityServiceResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiQualityServiceResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiQualityServiceResponse;
  v3 = [(GEOWiFiQualityServiceResponse *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)statusCode
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_statusCode;
  }
  else {
    return 0;
  }
}

- (void)setStatusCode:(int)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_statusCode = a3;
}

- (void)setHasStatusCode:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasStatusCode
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)statusCodeAsString:(int)a3
{
  if (a3 <= 29)
  {
    v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        v4 = @"STATUS_FAILED";
        break;
      case 2:
        v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatusCode:(id)a3
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

- (void)_readLocationResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiQualityServiceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationResults_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)locationResults
{
  -[GEOWiFiQualityServiceResponse _readLocationResults]((uint64_t)self);
  locationResults = self->_locationResults;

  return locationResults;
}

- (void)setLocationResults:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  locationResults = self->_locationResults;
  self->_locationResults = v4;
}

- (void)clearLocationResults
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  locationResults = self->_locationResults;

  [(NSMutableArray *)locationResults removeAllObjects];
}

- (void)addLocationResults:(id)a3
{
  id v4 = a3;
  -[GEOWiFiQualityServiceResponse _readLocationResults]((uint64_t)self);
  -[GEOWiFiQualityServiceResponse _addNoFlagsLocationResults:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsLocationResults:(uint64_t)a1
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

- (unint64_t)locationResultsCount
{
  -[GEOWiFiQualityServiceResponse _readLocationResults]((uint64_t)self);
  locationResults = self->_locationResults;

  return [(NSMutableArray *)locationResults count];
}

- (id)locationResultsAtIndex:(unint64_t)a3
{
  -[GEOWiFiQualityServiceResponse _readLocationResults]((uint64_t)self);
  locationResults = self->_locationResults;

  return (id)[(NSMutableArray *)locationResults objectAtIndex:a3];
}

+ (Class)locationResultsType
{
  return (Class)objc_opt_class();
}

- (void)_readNetworkResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiQualityServiceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNetworkResults_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)networkResults
{
  -[GEOWiFiQualityServiceResponse _readNetworkResults]((uint64_t)self);
  networkResults = self->_networkResults;

  return networkResults;
}

- (void)setNetworkResults:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  networkResults = self->_networkResults;
  self->_networkResults = v4;
}

- (void)clearNetworkResults
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  networkResults = self->_networkResults;

  [(NSMutableArray *)networkResults removeAllObjects];
}

- (void)addNetworkResults:(id)a3
{
  id v4 = a3;
  -[GEOWiFiQualityServiceResponse _readNetworkResults]((uint64_t)self);
  -[GEOWiFiQualityServiceResponse _addNoFlagsNetworkResults:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsNetworkResults:(uint64_t)a1
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

- (unint64_t)networkResultsCount
{
  -[GEOWiFiQualityServiceResponse _readNetworkResults]((uint64_t)self);
  networkResults = self->_networkResults;

  return [(NSMutableArray *)networkResults count];
}

- (id)networkResultsAtIndex:(unint64_t)a3
{
  -[GEOWiFiQualityServiceResponse _readNetworkResults]((uint64_t)self);
  networkResults = self->_networkResults;

  return (id)[(NSMutableArray *)networkResults objectAtIndex:a3];
}

+ (Class)networkResultsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiQualityServiceResponse;
  id v4 = [(GEOWiFiQualityServiceResponse *)&v8 description];
  id v5 = [(GEOWiFiQualityServiceResponse *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiQualityServiceResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_48;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)(a1 + 48))
  {
    int v5 = *(_DWORD *)(a1 + 44);
    if (v5 <= 29)
    {
      objc_super v6 = @"STATUS_SUCCESS";
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          objc_super v6 = @"STATUS_FAILED";
          break;
        case 2:
          objc_super v6 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          objc_super v6 = @"INVALID_REQUEST";
          break;
        default:
          if (v5 != 20) {
            goto LABEL_15;
          }
          objc_super v6 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        objc_super v6 = @"STATUS_DEDUPED";
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        objc_super v6 = @"VERSION_MISMATCH";
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        objc_super v6 = @"NEEDS_REFINEMENT";
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        objc_super v6 = @"FAILED_NOT_AUTHORIZED";
LABEL_20:
        if (a2) {
          id v7 = @"statusCode";
        }
        else {
          id v7 = @"status_code";
        }
        [v4 setObject:v6 forKey:v7];

        goto LABEL_24;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 44));
    objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_24:
  if ([*(id *)(a1 + 16) count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = *(id *)(a1 + 16);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          v15 = [v14 dictionaryRepresentation];
          }
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"locationResults"];
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

    [v4 setObject:v16 forKey:@"networkResults"];
  }
LABEL_48:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWiFiQualityServiceResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOWiFiQualityServiceResponse)initWithDictionary:(id)a3
{
  return (GEOWiFiQualityServiceResponse *)-[GEOWiFiQualityServiceResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_59;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_59;
  }
  if (a3) {
    objc_super v6 = @"statusCode";
  }
  else {
    objc_super v6 = @"status_code";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
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

    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_29:
    [a1 setStatusCode:v9];
  }

  uint64_t v10 = [v5 objectForKeyedSubscript:@"locationResults"];
  objc_opt_class();
  id v31 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = [GEOWiFiQualityLocationSearchResult alloc];
            if (a3) {
              uint64_t v18 = [(GEOWiFiQualityLocationSearchResult *)v17 initWithJSON:v16];
            }
            else {
              uint64_t v18 = [(GEOWiFiQualityLocationSearchResult *)v17 initWithDictionary:v16];
            }
            uint64_t v19 = (void *)v18;
            [a1 addLocationResults:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v13);
    }

    id v5 = v31;
  }

  uint64_t v20 = [v5 objectForKeyedSubscript:@"networkResults"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v27 = [GEOWiFiQualityNetworkSearchResult alloc];
            if (a3) {
              uint64_t v28 = [(GEOWiFiQualityNetworkSearchResult *)v27 initWithJSON:v26];
            }
            else {
              uint64_t v28 = [(GEOWiFiQualityNetworkSearchResult *)v27 initWithDictionary:v26];
            }
            long long v29 = (void *)v28;
            [a1 addNetworkResults:v28];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v23);
    }

    id v5 = v31;
  }

LABEL_59:
  return a1;
}

- (GEOWiFiQualityServiceResponse)initWithJSON:(id)a3
{
  return (GEOWiFiQualityServiceResponse *)-[GEOWiFiQualityServiceResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_590;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_591;
    }
    GEOWiFiQualityServiceResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOWiFiQualityServiceResponseCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiQualityServiceResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiQualityServiceResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
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
    [(GEOWiFiQualityServiceResponse *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_locationResults;
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
    uint64_t v10 = self->_networkResults;
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
  -[GEOWiFiQualityServiceResponse _readLocationResults]((uint64_t)self);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_locationResults;
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

  -[GEOWiFiQualityServiceResponse _readNetworkResults]((uint64_t)self);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_networkResults;
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

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOWiFiQualityServiceResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 8) = self->_readerMarkPos;
  *((_DWORD *)v12 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v12 + 11) = self->_statusCode;
    *((unsigned char *)v12 + 48) |= 1u;
  }
  if ([(GEOWiFiQualityServiceResponse *)self locationResultsCount])
  {
    [v12 clearLocationResults];
    unint64_t v4 = [(GEOWiFiQualityServiceResponse *)self locationResultsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOWiFiQualityServiceResponse *)self locationResultsAtIndex:i];
        [v12 addLocationResults:v7];
      }
    }
  }
  if ([(GEOWiFiQualityServiceResponse *)self networkResultsCount])
  {
    [v12 clearNetworkResults];
    unint64_t v8 = [(GEOWiFiQualityServiceResponse *)self networkResultsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOWiFiQualityServiceResponse *)self networkResultsAtIndex:j];
        [v12 addNetworkResults:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOWiFiQualityServiceResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      unint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWiFiQualityServiceResponse *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 44) = self->_statusCode;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v9 = self->_locationResults;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addLocationResults:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v10);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v8 = self->_networkResults;
  uint64_t v14 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v8);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "copyWithZone:", a3, (void)v19);
        [(id)v5 addNetworkResults:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOWiFiQualityServiceResponse *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_statusCode != *((_DWORD *)v4 + 11)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  locationResults = self->_locationResults;
  if ((unint64_t)locationResults | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](locationResults, "isEqual:"))
  {
    goto LABEL_11;
  }
  networkResults = self->_networkResults;
  if ((unint64_t)networkResults | *((void *)v4 + 3)) {
    char v7 = -[NSMutableArray isEqual:](networkResults, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOWiFiQualityServiceResponse *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_statusCode;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_locationResults hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_networkResults hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 48))
  {
    self->_statusCode = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOWiFiQualityServiceResponse *)self addLocationResults:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
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
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOWiFiQualityServiceResponse addNetworkResults:](self, "addNetworkResults:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkResults, 0);
  objc_storeStrong((id *)&self->_locationResults, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end