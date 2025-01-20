@interface GEOPDSearchOriginationInfo
- (BOOL)hasGreenTeaWithValue:(BOOL)result;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchOriginationInfo)init;
- (GEOPDSearchOriginationInfo)initWithData:(id)a3;
- (GEOPDSearchOriginationInfo)initWithTraits:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)searchClientContextAtIndex:(uint64_t)result;
- (uint64_t)searchOriginationType;
- (unint64_t)hash;
- (void)_readRoutePlanningParameters;
- (void)_readSearchClientContexts;
- (void)addSearchClientContext:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)dealloc;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setRoutePlanningParameters:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchOriginationInfo

- (GEOPDSearchOriginationInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchOriginationInfo;
  v2 = [(GEOPDSearchOriginationInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchOriginationInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchOriginationInfo;
  v3 = [(GEOPDSearchOriginationInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchOriginationInfo;
  [(GEOPDSearchOriginationInfo *)&v3 dealloc];
}

- (uint64_t)searchOriginationType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if ((v2 & 2) != 0) {
      return *(unsigned int *)(v1 + 72);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readRoutePlanningParameters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchOriginationInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoutePlanningParameters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)setRoutePlanningParameters:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 76) |= 0x10u;
    *(unsigned char *)(a1 + 76) |= 0x20u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)_readSearchClientContexts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchOriginationInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchClientContexts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)addSearchClientContext:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchOriginationInfo _readSearchClientContexts](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 76) |= 0x20u;
  }
}

- (uint64_t)searchClientContextAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSearchOriginationInfo _readSearchClientContexts](result);
    unint64_t v4 = *(void *)(v3 + 32);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 24) + 4 * a2);
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchOriginationInfo;
  unint64_t v4 = [(GEOPDSearchOriginationInfo *)&v8 description];
  v5 = [(GEOPDSearchOriginationInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchOriginationInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchOriginationInfo readAll:](a1, 1);
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 76) & 2) != 0)
    {
      uint64_t v5 = *(int *)(a1 + 72);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 72));
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v6 = off_1E53E5D98[v5];
      }
      if (a2) {
        objc_super v7 = @"searchOriginationType";
      }
      else {
        objc_super v7 = @"search_origination_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    -[GEOPDSearchOriginationInfo _readRoutePlanningParameters](a1);
    id v8 = *(id *)(a1 + 48);
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"routePlanningParameters";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"route_planning_parameters";
      }
      [v4 setObject:v10 forKey:v11];
    }
    if (*(void *)(a1 + 32))
    {
      v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v13 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v14 = 0;
        do
        {
          uint64_t v15 = *(unsigned int *)(*v13 + 4 * v14);
          if (v15)
          {
            if (v15 == 1)
            {
              v16 = @"SEARCH_CLIENT_CONTEXT_HIKING";
            }
            else
            {
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
              v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v16 = @"SEARCH_CLIENT_CONTEXT_UNKNOWN";
          }
          [v12 addObject:v16];

          ++v14;
          v13 = (void *)(a1 + 24);
        }
        while (v14 < *(void *)(a1 + 32));
      }
      if (a2) {
        v17 = @"searchClientContext";
      }
      else {
        v17 = @"search_client_context";
      }
      [v4 setObject:v12 forKey:v17];
    }
    if (*(unsigned char *)(a1 + 76))
    {
      uint64_t v18 = *(int *)(a1 + 68);
      if (v18 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = off_1E53E5DB8[v18];
      }
      if (a2) {
        v20 = @"clientSoftwarePlatform";
      }
      else {
        v20 = @"client_software_platform";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = *(void **)(a1 + 16);
    if (v21)
    {
      v22 = [v21 dictionaryRepresentation];
      v23 = v22;
      if (a2)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __56__GEOPDSearchOriginationInfo__dictionaryRepresentation___block_invoke;
        v28[3] = &unk_1E53D8860;
        id v25 = v24;
        id v29 = v25;
        [v23 enumerateKeysAndObjectsUsingBlock:v28];
        id v26 = v25;

        v23 = v26;
      }
      [v4 setObject:v23 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchOriginationInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_1373;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_1374;
      }
      GEOPDSearchOriginationInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __56__GEOPDSearchOriginationInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      if (a3) {
        uint64_t v6 = @"searchOriginationType";
      }
      else {
        uint64_t v6 = @"search_origination_type";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v8 = &OBJC_IVAR___GEOPDRelatedCollectionSection__collectionIds;
      if (objc_opt_isKindOfClass())
      {
        id v9 = v7;
        if ([v9 isEqualToString:@"SEARCH_ORIGINATION_TYPE_DEFAULT"])
        {
          int v10 = 0;
        }
        else if ([v9 isEqualToString:@"SEARCH_ORIGINATION_TYPE_ROUTE_PLANNING"])
        {
          int v10 = 1;
        }
        else if ([v9 isEqualToString:@"SEARCH_ORIGINATION_TYPE_SEARCH_ALONG_ROUTE"])
        {
          int v10 = 2;
        }
        else if ([v9 isEqualToString:@"SEARCH_ORIGINATION_TYPE_IMPLICIT"])
        {
          int v10 = 3;
        }
        else
        {
          int v10 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_20;
        }
        int v10 = [v7 intValue];
      }
      *(unsigned char *)(a1 + 76) |= 0x20u;
      *(unsigned char *)(a1 + 76) |= 2u;
      *(_DWORD *)(a1 + 72) = v10;
LABEL_20:

      if (a3) {
        v11 = @"routePlanningParameters";
      }
      else {
        v11 = @"route_planning_parameters";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOPDSearchOriginationRoutePlanningParameters alloc];
        if (v13)
        {
          id v14 = v12;
          v13 = [(GEOPDSearchOriginationRoutePlanningParameters *)v13 init];
          if (v13)
          {
            if (a3) {
              uint64_t v15 = @"previousLocation";
            }
            else {
              uint64_t v15 = @"previous_location";
            }
            [v14 objectForKeyedSubscript:v15];
            v17 = int v16 = a3;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v18 = [GEOLatLng alloc];
              if (v16) {
                v19 = [(GEOLatLng *)v18 initWithJSON:v17];
              }
              else {
                v19 = [(GEOLatLng *)v18 initWithDictionary:v17];
              }
              v20 = v19;
              -[GEOPDSearchOriginationRoutePlanningParameters setPreviousLocation:]((uint64_t)v13, v19);

              id v8 = &OBJC_IVAR___GEOPDRelatedCollectionSection__collectionIds;
            }

            if (v16) {
              v21 = @"isEditServerRecommendedStop";
            }
            else {
              v21 = @"is_edit_server_recommended_stop";
            }
            v22 = [v14 objectForKeyedSubscript:v21];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              char v23 = [v22 BOOLValue];
              *(unsigned char *)&v13->_flags |= 1u;
              v13->_isEditServerRecommendedStop = v23;
            }

            a3 = v16;
          }
        }
        -[GEOPDSearchOriginationInfo setRoutePlanningParameters:](a1, v13);
      }
      if (a3) {
        v24 = @"searchClientContext";
      }
      else {
        v24 = @"search_client_context";
      }
      id v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v39 = a3;
        id v40 = v5;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        v38 = v25;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (!v27) {
          goto LABEL_61;
        }
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v42;
        while (1)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v42 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v32 = v31;
              if (([v32 isEqualToString:@"SEARCH_CLIENT_CONTEXT_UNKNOWN"] & 1) == 0) {
                [v32 isEqualToString:@"SEARCH_CLIENT_CONTEXT_HIKING"];
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              [v31 intValue];
            }
            -[GEOPDSearchOriginationInfo addSearchClientContext:](a1);
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
          if (!v28)
          {
LABEL_61:

            id v5 = v40;
            id v8 = &OBJC_IVAR___GEOPDRelatedCollectionSection__collectionIds;
            a3 = v39;
            id v25 = v38;
            break;
          }
        }
      }

      if (a3) {
        v33 = @"clientSoftwarePlatform";
      }
      else {
        v33 = @"client_software_platform";
      }
      v34 = [v5 objectForKeyedSubscript:v33];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v35 = v34;
        if ([v35 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_UNKNOWN"])
        {
          int v36 = 0;
        }
        else if ([v35 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_IOS"])
        {
          int v36 = 1;
        }
        else if ([v35 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_WATCHOS"])
        {
          int v36 = 2;
        }
        else if ([v35 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_MACOS"])
        {
          int v36 = 3;
        }
        else if ([v35 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_TVOS"])
        {
          int v36 = 4;
        }
        else if ([v35 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_WEB"])
        {
          int v36 = 5;
        }
        else
        {
          int v36 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_83:

          goto LABEL_84;
        }
        int v36 = [v34 intValue];
      }
      *(unsigned char *)(a1 + v8[150]) |= 0x20u;
      *(unsigned char *)(a1 + v8[150]) |= 1u;
      *(_DWORD *)(a1 + 68) = v36;
      goto LABEL_83;
    }
  }
LABEL_84:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchOriginationInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchOriginationInfo readAll:]((uint64_t)self, 0);
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v9;
    if (self->_routePlanningParameters)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_searchClientContexts.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v9;
        ++v6;
      }
      while (v6 < self->_searchClientContexts.count);
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSearchOriginationInfo _readRoutePlanningParameters](result);
    uint64_t v4 = *(void *)(v3 + 48);
    return v4 && ([*(id *)(v4 + 16) hasGreenTeaWithValue:a2] & 1) != 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchOriginationInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchOriginationInfo readAll:]((uint64_t)self, 0);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_searchOriginationType;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  id v9 = [(GEOPDSearchOriginationRoutePlanningParameters *)self->_routePlanningParameters copyWithZone:a3];
  int v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  PBRepeatedInt32Copy();
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_clientSoftwarePlatform;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  v11 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v11;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  -[GEOPDSearchOriginationInfo readAll:]((uint64_t)self, 1);
  -[GEOPDSearchOriginationInfo readAll:]((uint64_t)v4, 1);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_searchOriginationType != *((_DWORD *)v4 + 18)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
LABEL_14:
    BOOL v6 = 0;
    goto LABEL_15;
  }
  routePlanningParameters = self->_routePlanningParameters;
  if ((unint64_t)routePlanningParameters | *((void *)v4 + 6)
    && !-[GEOPDSearchOriginationRoutePlanningParameters isEqual:](routePlanningParameters, "isEqual:")
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 76) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_clientSoftwarePlatform != *((_DWORD *)v4 + 17)) {
      goto LABEL_14;
    }
    BOOL v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  -[GEOPDSearchOriginationInfo readAll:]((uint64_t)self, 1);
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_searchOriginationType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDSearchOriginationRoutePlanningParameters *)self->_routePlanningParameters hash];
  uint64_t v5 = PBRepeatedInt32Hash();
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_clientSoftwarePlatform;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (!a1) {
    goto LABEL_15;
  }
  id v9 = v3;
  -[GEOPDSearchOriginationInfo readAll:]((uint64_t)v3, 0);
  uint64_t v4 = (uint64_t)v9;
  if ((v9[19] & 2) != 0)
  {
    *(_DWORD *)(a1 + 72) = v9[18];
    *(unsigned char *)(a1 + 76) |= 2u;
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = (void *)*((void *)v9 + 6);
  if (v5)
  {
    if (v6)
    {
      -[GEOPDSearchOriginationRoutePlanningParameters mergeFrom:](v5, v6);
LABEL_9:
      uint64_t v4 = (uint64_t)v9;
    }
  }
  else if (v6)
  {
    -[GEOPDSearchOriginationInfo setRoutePlanningParameters:](a1, v6);
    goto LABEL_9;
  }
  -[GEOPDSearchOriginationInfo _readSearchClientContexts](v4);
  uint64_t v3 = v9;
  uint64_t v7 = *((void *)v9 + 4);
  if (v7)
  {
    for (unint64_t i = 0; i != v7; ++i)
    {
      -[GEOPDSearchOriginationInfo searchClientContextAtIndex:]((uint64_t)v3, i);
      -[GEOPDSearchOriginationInfo addSearchClientContext:](a1);
      uint64_t v3 = v9;
    }
  }
  if (v3[19])
  {
    *(_DWORD *)(a1 + 68) = v3[17];
    *(unsigned char *)(a1 + 76) |= 1u;
  }
LABEL_15:
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 4u;
    *(unsigned char *)(a1 + 76) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSearchOriginationInfo readAll:](a1, 0);
      uint64_t v5 = *(void *)(a1 + 48);
      -[GEOPDSearchOriginationRoutePlanningParameters clearUnknownFields:](v5, 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePlanningParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDSearchOriginationInfo)initWithTraits:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOPDSearchOriginationInfo;
  uint64_t v5 = [(GEOPDSearchOriginationInfo *)&v13 init];
  if (v5)
  {
    switch([v4 searchOriginationType])
    {
      case 0u:
        *(unsigned char *)&v5->_flags |= 0x20u;
        *(unsigned char *)&v5->_flags |= 2u;
        v5->_searchOriginationType = 0;
        break;
      case 1u:
        *(unsigned char *)&v5->_flags |= 0x20u;
        *(unsigned char *)&v5->_flags |= 2u;
        v5->_searchOriginationType = 1;
        uint64_t v6 = objc_alloc_init(GEOPDSearchOriginationRoutePlanningParameters);
        uint64_t v7 = [v4 searchOriginationPreviousLatlng];
        -[GEOPDSearchOriginationRoutePlanningParameters setPreviousLocation:]((uint64_t)v6, v7);

        char v8 = [v4 searchOriginationEditingServerWaypoints];
        if (v6)
        {
          *(unsigned char *)&v6->_flags |= 1u;
          v6->_isEditServerRecommendedStop = v8;
        }
        -[GEOPDSearchOriginationInfo setRoutePlanningParameters:]((uint64_t)v5, v6);

        break;
      case 2u:
        *(unsigned char *)&v5->_flags |= 0x20u;
        *(unsigned char *)&v5->_flags |= 2u;
        int v9 = 2;
        goto LABEL_9;
      case 3u:
        *(unsigned char *)&v5->_flags |= 0x20u;
        *(unsigned char *)&v5->_flags |= 2u;
        int v9 = 3;
LABEL_9:
        v5->_searchOriginationType = v9;
        break;
      default:
        break;
    }
    if (GEOConfigGetBOOL(MapsFeaturesConfig_HikingWatchEnabled, (uint64_t)off_1E9111E28)
      && (([v4 isWithinHikingBoundary] & 1) != 0
       || [v4 isWithinHikingBufferRegion]))
    {
      -[GEOPDSearchOriginationInfo addSearchClientContext:]((uint64_t)v5);
    }
    unsigned int v10 = [v4 devicePlatform] - 1;
    if (v10 > 3) {
      int v11 = 0;
    }
    else {
      int v11 = dword_18A640CF0[v10];
    }
    *(unsigned char *)&v5->_flags |= 0x20u;
    *(unsigned char *)&v5->_flags |= 1u;
    v5->_clientSoftwarePlatform = v11;
  }

  return v5;
}

@end