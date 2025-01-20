@interface GEOPDHikeAssociatedInfo
+ (BOOL)isValid:(id)a3;
+ (Class)endMuidType;
+ (Class)intermediateMuidType;
+ (Class)startMuidType;
+ (GEOPDHikeAssociatedInfo)hikeAssociatedInfoWithPlaceData:(id)a3;
- (BOOL)hasEncryptedTourMuid;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDHikeAssociatedInfo)init;
- (GEOPDHikeAssociatedInfo)initWithData:(id)a3;
- (GEOPDHikeAssociatedInfo)initWithDictionary:(id)a3;
- (GEOPDHikeAssociatedInfo)initWithJSON:(id)a3;
- (NSMutableArray)endMuids;
- (NSMutableArray)intermediateMuids;
- (NSMutableArray)startMuids;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)endMuidAtIndex:(unint64_t)a3;
- (id)intermediateMuidAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)startMuidAtIndex:(unint64_t)a3;
- (unint64_t)encryptedTourMuid;
- (unint64_t)endMuidsCount;
- (unint64_t)hash;
- (unint64_t)intermediateMuidsCount;
- (unint64_t)startMuidsCount;
- (void)_addNoFlagsEndMuid:(uint64_t)a1;
- (void)_addNoFlagsIntermediateMuid:(uint64_t)a1;
- (void)_addNoFlagsStartMuid:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readEndMuids;
- (void)_readIntermediateMuids;
- (void)_readStartMuids;
- (void)addEndMuid:(id)a3;
- (void)addIntermediateMuid:(id)a3;
- (void)addStartMuid:(id)a3;
- (void)clearEndMuids;
- (void)clearIntermediateMuids;
- (void)clearStartMuids;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEncryptedTourMuid:(unint64_t)a3;
- (void)setEndMuids:(id)a3;
- (void)setHasEncryptedTourMuid:(BOOL)a3;
- (void)setIntermediateMuids:(id)a3;
- (void)setStartMuids:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDHikeAssociatedInfo

+ (GEOPDHikeAssociatedInfo)hikeAssociatedInfoWithPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__GEOPDHikeAssociatedInfo_PlaceDataExtras__hikeAssociatedInfoWithPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:104 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (GEOPDHikeAssociatedInfo *)v4;
}

void __76__GEOPDHikeAssociatedInfo_PlaceDataExtras__hikeAssociatedInfoWithPlaceData___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  v5 = -[GEOPDComponentValue hikeAssociatedInfo](a2);
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5);
    v5 = v6;
    *a3 = 1;
  }
}

- (GEOPDHikeAssociatedInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDHikeAssociatedInfo;
  v2 = [(GEOPDHikeAssociatedInfo *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDHikeAssociatedInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDHikeAssociatedInfo;
  id v3 = [(GEOPDHikeAssociatedInfo *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)encryptedTourMuid
{
  return self->_encryptedTourMuid;
}

- (void)setEncryptedTourMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_encryptedTourMuid = a3;
}

- (void)setHasEncryptedTourMuid:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasEncryptedTourMuid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readStartMuids
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDHikeAssociatedInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStartMuids_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)startMuids
{
  -[GEOPDHikeAssociatedInfo _readStartMuids]((uint64_t)self);
  startMuids = self->_startMuids;

  return startMuids;
}

- (void)setStartMuids:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  startMuids = self->_startMuids;
  self->_startMuids = v4;
}

- (void)clearStartMuids
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  startMuids = self->_startMuids;

  [(NSMutableArray *)startMuids removeAllObjects];
}

- (void)addStartMuid:(id)a3
{
  id v4 = a3;
  -[GEOPDHikeAssociatedInfo _readStartMuids]((uint64_t)self);
  -[GEOPDHikeAssociatedInfo _addNoFlagsStartMuid:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsStartMuid:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)startMuidsCount
{
  -[GEOPDHikeAssociatedInfo _readStartMuids]((uint64_t)self);
  startMuids = self->_startMuids;

  return [(NSMutableArray *)startMuids count];
}

- (id)startMuidAtIndex:(unint64_t)a3
{
  -[GEOPDHikeAssociatedInfo _readStartMuids]((uint64_t)self);
  startMuids = self->_startMuids;

  return (id)[(NSMutableArray *)startMuids objectAtIndex:a3];
}

+ (Class)startMuidType
{
  return (Class)objc_opt_class();
}

- (void)_readEndMuids
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDHikeAssociatedInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEndMuids_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)endMuids
{
  -[GEOPDHikeAssociatedInfo _readEndMuids]((uint64_t)self);
  endMuids = self->_endMuids;

  return endMuids;
}

- (void)setEndMuids:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  endMuids = self->_endMuids;
  self->_endMuids = v4;
}

- (void)clearEndMuids
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  endMuids = self->_endMuids;

  [(NSMutableArray *)endMuids removeAllObjects];
}

- (void)addEndMuid:(id)a3
{
  id v4 = a3;
  -[GEOPDHikeAssociatedInfo _readEndMuids]((uint64_t)self);
  -[GEOPDHikeAssociatedInfo _addNoFlagsEndMuid:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsEndMuid:(uint64_t)a1
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

- (unint64_t)endMuidsCount
{
  -[GEOPDHikeAssociatedInfo _readEndMuids]((uint64_t)self);
  endMuids = self->_endMuids;

  return [(NSMutableArray *)endMuids count];
}

- (id)endMuidAtIndex:(unint64_t)a3
{
  -[GEOPDHikeAssociatedInfo _readEndMuids]((uint64_t)self);
  endMuids = self->_endMuids;

  return (id)[(NSMutableArray *)endMuids objectAtIndex:a3];
}

+ (Class)endMuidType
{
  return (Class)objc_opt_class();
}

- (void)_readIntermediateMuids
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDHikeAssociatedInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIntermediateMuids_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)intermediateMuids
{
  -[GEOPDHikeAssociatedInfo _readIntermediateMuids]((uint64_t)self);
  intermediateMuids = self->_intermediateMuids;

  return intermediateMuids;
}

- (void)setIntermediateMuids:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  intermediateMuids = self->_intermediateMuids;
  self->_intermediateMuids = v4;
}

- (void)clearIntermediateMuids
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  intermediateMuids = self->_intermediateMuids;

  [(NSMutableArray *)intermediateMuids removeAllObjects];
}

- (void)addIntermediateMuid:(id)a3
{
  id v4 = a3;
  -[GEOPDHikeAssociatedInfo _readIntermediateMuids]((uint64_t)self);
  -[GEOPDHikeAssociatedInfo _addNoFlagsIntermediateMuid:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsIntermediateMuid:(uint64_t)a1
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

- (unint64_t)intermediateMuidsCount
{
  -[GEOPDHikeAssociatedInfo _readIntermediateMuids]((uint64_t)self);
  intermediateMuids = self->_intermediateMuids;

  return [(NSMutableArray *)intermediateMuids count];
}

- (id)intermediateMuidAtIndex:(unint64_t)a3
{
  -[GEOPDHikeAssociatedInfo _readIntermediateMuids]((uint64_t)self);
  intermediateMuids = self->_intermediateMuids;

  return (id)[(NSMutableArray *)intermediateMuids objectAtIndex:a3];
}

+ (Class)intermediateMuidType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDHikeAssociatedInfo;
  id v4 = [(GEOPDHikeAssociatedInfo *)&v8 description];
  id v5 = [(GEOPDHikeAssociatedInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDHikeAssociatedInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 68))
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      if (a2) {
        objc_super v6 = @"encryptedTourMuid";
      }
      else {
        objc_super v6 = @"encrypted_tour_muid";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if ([*(id *)(a1 + 48) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v8 = *(id *)(a1 + 48);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v52 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"startMuid";
      }
      else {
        v15 = @"start_muid";
      }
      [v4 setObject:v7 forKey:v15];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v17 = *(id *)(a1 + 32);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v48 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v47 + 1) + 8 * j);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            v23 = [v22 dictionaryRepresentation];
            }
            [v16 addObject:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
        }
        while (v19);
      }

      if (a2) {
        v24 = @"endMuid";
      }
      else {
        v24 = @"end_muid";
      }
      [v4 setObject:v16 forKey:v24];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v26 = *(id *)(a1 + 40);
      uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v55 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v44;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v44 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v43 + 1) + 8 * k);
            if (a2) {
              [v31 jsonRepresentation];
            }
            else {
            v32 = [v31 dictionaryRepresentation];
            }
            [v25 addObject:v32];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v43 objects:v55 count:16];
        }
        while (v28);
      }

      if (a2) {
        v33 = @"intermediateMuid";
      }
      else {
        v33 = @"intermediate_muid";
      }
      [v4 setObject:v25 forKey:v33];
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
        v41[2] = __53__GEOPDHikeAssociatedInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDHikeAssociatedInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOPDHikeAssociatedInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDHikeAssociatedInfo)initWithDictionary:(id)a3
{
  return (GEOPDHikeAssociatedInfo *)-[GEOPDHikeAssociatedInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"encryptedTourMuid";
      }
      else {
        objc_super v6 = @"encrypted_tour_muid";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEncryptedTourMuid:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        id v8 = @"startMuid";
      }
      else {
        id v8 = @"start_muid";
      }
      uint64_t v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      id v42 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v57 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v52 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v51 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v16 = [GEOPDMapsIdentifier alloc];
                if (a3) {
                  uint64_t v17 = [(GEOPDMapsIdentifier *)v16 initWithJSON:v15];
                }
                else {
                  uint64_t v17 = [(GEOPDMapsIdentifier *)v16 initWithDictionary:v15];
                }
                uint64_t v18 = (void *)v17;
                [a1 addStartMuid:v17];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v51 objects:v57 count:16];
          }
          while (v12);
        }

        id v5 = v42;
      }

      if (a3) {
        uint64_t v19 = @"endMuid";
      }
      else {
        uint64_t v19 = @"end_muid";
      }
      uint64_t v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v48;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v48 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v47 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v27 = [GEOPDMapsIdentifier alloc];
                if (a3) {
                  uint64_t v28 = [(GEOPDMapsIdentifier *)v27 initWithJSON:v26];
                }
                else {
                  uint64_t v28 = [(GEOPDMapsIdentifier *)v27 initWithDictionary:v26];
                }
                uint64_t v29 = (void *)v28;
                [a1 addEndMuid:v28];
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }
          while (v23);
        }

        id v5 = v42;
      }

      if (a3) {
        v30 = @"intermediateMuid";
      }
      else {
        v30 = @"intermediate_muid";
      }
      v31 = [v5 objectForKeyedSubscript:v30];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v32 = v31;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v44;
          do
          {
            for (uint64_t k = 0; k != v34; ++k)
            {
              if (*(void *)v44 != v35) {
                objc_enumerationMutation(v32);
              }
              uint64_t v37 = *(void *)(*((void *)&v43 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v38 = [GEOPDMapsIdentifier alloc];
                if (a3) {
                  uint64_t v39 = [(GEOPDMapsIdentifier *)v38 initWithJSON:v37];
                }
                else {
                  uint64_t v39 = [(GEOPDMapsIdentifier *)v38 initWithDictionary:v37];
                }
                v40 = (void *)v39;
                [a1 addIntermediateMuid:v39];
              }
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v55 count:16];
          }
          while (v34);
        }

        id v5 = v42;
      }
    }
  }

  return a1;
}

- (GEOPDHikeAssociatedInfo)initWithJSON:(id)a3
{
  return (GEOPDHikeAssociatedInfo *)-[GEOPDHikeAssociatedInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_5594;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_5595;
    }
    GEOPDHikeAssociatedInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDHikeAssociatedInfoCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDHikeAssociatedInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDHikeAssociatedInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3C) == 0))
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
    [(GEOPDHikeAssociatedInfo *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v6 = self->_startMuids;
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
    id v10 = self->_endMuids;
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

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = self->_intermediateMuids;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  -[GEOPDHikeAssociatedInfo _readEndMuids]((uint64_t)self);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = self->_endMuids;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v28 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_26;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOPDHikeAssociatedInfo _readIntermediateMuids]((uint64_t)self);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = self->_intermediateMuids;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v25 != v12) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v24 + 1) + 8 * v13) hasGreenTeaWithValue:v3]) {
        goto LABEL_26;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v11) {
          goto LABEL_11;
        }
        break;
      }
    }
  }

  -[GEOPDHikeAssociatedInfo _readStartMuids]((uint64_t)self);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_startMuids;
  uint64_t v14 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
LABEL_19:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v21 != v16) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "hasGreenTeaWithValue:", v3, (void)v20)) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v32 count:16];
        if (v15) {
          goto LABEL_19;
        }
        goto LABEL_25;
      }
    }
LABEL_26:
    BOOL v18 = 1;
    goto LABEL_27;
  }
LABEL_25:
  BOOL v18 = 0;
LABEL_27:

  return v18;
}

- (void)copyTo:(id)a3
{
  uint64_t v16 = (id *)a3;
  [(GEOPDHikeAssociatedInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 14) = self->_readerMarkPos;
  *((_DWORD *)v16 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    v16[3] = self->_encryptedTourMuid;
    *((unsigned char *)v16 + 68) |= 1u;
  }
  if ([(GEOPDHikeAssociatedInfo *)self startMuidsCount])
  {
    [v16 clearStartMuids];
    unint64_t v4 = [(GEOPDHikeAssociatedInfo *)self startMuidsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDHikeAssociatedInfo *)self startMuidAtIndex:i];
        [v16 addStartMuid:v7];
      }
    }
  }
  if ([(GEOPDHikeAssociatedInfo *)self endMuidsCount])
  {
    [v16 clearEndMuids];
    unint64_t v8 = [(GEOPDHikeAssociatedInfo *)self endMuidsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOPDHikeAssociatedInfo *)self endMuidAtIndex:j];
        [v16 addEndMuid:v11];
      }
    }
  }
  if ([(GEOPDHikeAssociatedInfo *)self intermediateMuidsCount])
  {
    [v16 clearIntermediateMuids];
    unint64_t v12 = [(GEOPDHikeAssociatedInfo *)self intermediateMuidsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOPDHikeAssociatedInfo *)self intermediateMuidAtIndex:k];
        [v16 addIntermediateMuid:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDHikeAssociatedInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_29;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDHikeAssociatedInfo *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 24) = self->_encryptedTourMuid;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v9 = self->_startMuids;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addStartMuid:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v10);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v14 = self->_endMuids;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v14);
        }
        BOOL v18 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addEndMuid:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v15);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v19 = self->_intermediateMuids;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * k), "copyWithZone:", a3, (void)v26);
        [(id)v5 addIntermediateMuid:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v20);
  }

  long long v24 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v24;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOPDHikeAssociatedInfo *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_encryptedTourMuid != *((void *)v4 + 3)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  startMuids = self->_startMuids;
  if ((unint64_t)startMuids | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](startMuids, "isEqual:"))
  {
    goto LABEL_13;
  }
  endMuids = self->_endMuids;
  if ((unint64_t)endMuids | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](endMuids, "isEqual:")) {
      goto LABEL_13;
    }
  }
  intermediateMuids = self->_intermediateMuids;
  if ((unint64_t)intermediateMuids | *((void *)v4 + 5)) {
    char v8 = -[NSMutableArray isEqual:](intermediateMuids, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  [(GEOPDHikeAssociatedInfo *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_encryptedTourMuid;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_startMuids hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_endMuids hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_intermediateMuids hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 68))
  {
    self->_encryptedTourMuid = *((void *)v4 + 3);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = *((id *)v4 + 6);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOPDHikeAssociatedInfo *)self addStartMuid:*(void *)(*((void *)&v28 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = *((id *)v4 + 4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOPDHikeAssociatedInfo *)self addEndMuid:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *((id *)v4 + 5);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[GEOPDHikeAssociatedInfo addIntermediateMuid:](self, "addIntermediateMuid:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOPDHikeAssociatedInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_5599);
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
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x22u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDHikeAssociatedInfo *)self readAll:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v7 = self->_startMuids;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v12 = self->_endMuids;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v14);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v17 = self->_intermediateMuids;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v21++), "clearUnknownFields:", 1, (void)v22);
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v19);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startMuids, 0);
  objc_storeStrong((id *)&self->_intermediateMuids, 0);
  objc_storeStrong((id *)&self->_endMuids, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end