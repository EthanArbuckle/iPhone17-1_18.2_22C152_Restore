@interface GEOPDBusinessHours
+ (id)businessHoursForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDBusinessHours)init;
- (GEOPDBusinessHours)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)hoursThreshold;
- (id)jsonRepresentation;
- (id)message;
- (id)weeklyHours;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hoursType;
- (unint64_t)hash;
- (void)_addNoFlagsWeeklyHours:(uint64_t)a1;
- (void)_readHoursThreshold;
- (void)_readMessage;
- (void)_readWeeklyHours;
- (void)addWeeklyHours:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setWeeklyHours:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDBusinessHours

- (GEOPDBusinessHours)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDBusinessHours;
  v2 = [(GEOPDBusinessHours *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weeklyHours, 0);
  objc_storeStrong((id *)&self->_shortMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_hoursThreshold, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

+ (id)businessHoursForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = (id)objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__GEOPDBusinessHours_PlaceDataExtras__businessHoursForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:64 usingBlock:v6];
  v4 = (void *)[(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__GEOPDBusinessHours_PlaceDataExtras__businessHoursForPlaceData___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  v5 = -[GEOPDComponentValue businessHours](a2);
  if (v5)
  {
    objc_super v6 = v5;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
    v5 = v6;
  }
  else
  {
    *a3 = 1;
  }
}

- (GEOPDBusinessHours)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDBusinessHours;
  id v3 = [(GEOPDBusinessHours *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readWeeklyHours
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
        GEOPDBusinessHoursReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWeeklyHours_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)weeklyHours
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDBusinessHours _readWeeklyHours]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setWeeklyHours:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 88) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 88) |= 0x100u;
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)addWeeklyHours:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDBusinessHours _readWeeklyHours](a1);
    -[GEOPDBusinessHours _addNoFlagsWeeklyHours:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 88) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 88) |= 0x100u;
  }
}

- (void)_addNoFlagsWeeklyHours:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readMessage
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
        GEOPDBusinessHoursReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMessage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)message
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDBusinessHours _readMessage]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)hoursType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 88);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if ((v2 & 4) != 0) {
      return *(unsigned int *)(v1 + 84);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readHoursThreshold
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBusinessHoursReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHoursThreshold_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)hoursThreshold
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDBusinessHours _readHoursThreshold]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDBusinessHours;
  id v4 = [(GEOPDBusinessHours *)&v8 description];
  id v5 = [(GEOPDBusinessHours *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBusinessHours _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDBusinessHours readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 64) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v6 = *(id *)(a1 + 64);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v42 != v8) {
              objc_enumerationMutation(v6);
            }
            v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            if (a2) {
              [v10 jsonRepresentation];
            }
            else {
            v11 = [v10 dictionaryRepresentation];
            }
            [v5 addObject:v11];
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v7);
      }

      if (a2) {
        id v12 = @"weeklyHours";
      }
      else {
        id v12 = @"weekly_hours";
      }
      [v4 setObject:v5 forKey:v12];
    }
    __int16 v13 = *(_WORD *)(a1 + 88);
    if ((v13 & 2) != 0)
    {
      v14 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
      [v4 setObject:v14 forKey:@"start"];

      __int16 v13 = *(_WORD *)(a1 + 88);
    }
    if (v13)
    {
      v15 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      [v4 setObject:v15 forKey:@"end"];
    }
    v16 = -[GEOPDBusinessHours message]((id *)a1);
    v17 = v16;
    if (v16)
    {
      if (a2) {
        [v16 jsonRepresentation];
      }
      else {
      v18 = [v16 dictionaryRepresentation];
      }
      [v4 setObject:v18 forKey:@"message"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v19 = *(void **)(a1 + 8);
      if (v19)
      {
        id v20 = v19;
        objc_sync_enter(v20);
        GEOPDBusinessHoursReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShortMessage_tags);
        objc_sync_exit(v20);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v21 = *(id *)(a1 + 48);
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"shortMessage";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"short_message";
      }
      [v4 setObject:v23 forKey:v24];
    }
    if ((*(_WORD *)(a1 + 88) & 4) != 0)
    {
      uint64_t v25 = *(int *)(a1 + 84);
      if (v25 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = off_1E53E36F8[v25];
      }
      if (a2) {
        v27 = @"hoursType";
      }
      else {
        v27 = @"hours_type";
      }
      [v4 setObject:v26 forKey:v27];
    }
    v28 = -[GEOPDBusinessHours hoursThreshold]((id *)a1);
    v29 = v28;
    if (v28)
    {
      if (a2)
      {
        v30 = [v28 jsonRepresentation];
        v31 = @"hoursThreshold";
      }
      else
      {
        v30 = [v28 dictionaryRepresentation];
        v31 = @"hours_threshold";
      }
      [v4 setObject:v30 forKey:v31];
    }
    v32 = *(void **)(a1 + 16);
    if (v32)
    {
      v33 = [v32 dictionaryRepresentation];
      v34 = v33;
      if (a2)
      {
        v35 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v33, "count"));
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __48__GEOPDBusinessHours__dictionaryRepresentation___block_invoke;
        v39[3] = &unk_1E53D8860;
        id v36 = v35;
        id v40 = v36;
        [v34 enumerateKeysAndObjectsUsingBlock:v39];
        id v37 = v36;
      }
      else
      {
        id v37 = v33;
      }
      [v4 setObject:v37 forKey:@"Unknown Fields"];
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
  return -[GEOPDBusinessHours _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_1049_0;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_1050_0;
      }
      GEOPDBusinessHoursReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDBusinessHoursCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __48__GEOPDBusinessHours__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_63;
  }
  if (a3) {
    uint64_t v7 = @"weeklyHours";
  }
  else {
    uint64_t v7 = @"weekly_hours";
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v43 = v5;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v45 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v15 = [GEOPDHours alloc];
            if (a3) {
              v16 = [(GEOPDHours *)v15 initWithJSON:v14];
            }
            else {
              v16 = [(GEOPDHours *)v15 initWithDictionary:v14];
            }
            v17 = v16;
            -[GEOPDBusinessHours addWeeklyHours:](v6, v16);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v11);
    }

    id v5 = v43;
  }

  v18 = [v5 objectForKeyedSubscript:@"start"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v19 = [v18 unsignedLongLongValue];
    *(_WORD *)(v6 + 88) |= 0x100u;
    *(_WORD *)(v6 + 88) |= 2u;
    *(void *)(v6 + 56) = v19;
  }

  id v20 = [v5 objectForKeyedSubscript:@"end"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = [v20 unsignedLongLongValue];
    *(_WORD *)(v6 + 88) |= 0x100u;
    *(_WORD *)(v6 + 88) |= 1u;
    *(void *)(v6 + 24) = v21;
  }

  v22 = [v5 objectForKeyedSubscript:@"message"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = [GEOLocalizedString alloc];
    if (a3) {
      v24 = [(GEOLocalizedString *)v23 initWithJSON:v22];
    }
    else {
      v24 = [(GEOLocalizedString *)v23 initWithDictionary:v22];
    }
    uint64_t v25 = v24;
    v26 = v24;
    *(_WORD *)(v6 + 88) |= 0x20u;
    *(_WORD *)(v6 + 88) |= 0x100u;
    objc_storeStrong((id *)(v6 + 40), v25);
  }
  if (a3) {
    v27 = @"shortMessage";
  }
  else {
    v27 = @"short_message";
  }
  v28 = [v5 objectForKeyedSubscript:v27];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29 = [GEOLocalizedString alloc];
    if (a3) {
      v30 = [(GEOLocalizedString *)v29 initWithJSON:v28];
    }
    else {
      v30 = [(GEOLocalizedString *)v29 initWithDictionary:v28];
    }
    v31 = v30;
    v32 = v30;
    *(_WORD *)(v6 + 88) |= 0x40u;
    *(_WORD *)(v6 + 88) |= 0x100u;
    objc_storeStrong((id *)(v6 + 48), v31);
  }
  if (a3) {
    v33 = @"hoursType";
  }
  else {
    v33 = @"hours_type";
  }
  v34 = [v5 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = v34;
    if ([v35 isEqualToString:@"UNKNOWN"])
    {
      int v36 = 0;
    }
    else if ([v35 isEqualToString:@"NORMAL"])
    {
      int v36 = 1;
    }
    else if ([v35 isEqualToString:@"SPECIAL"])
    {
      int v36 = 2;
    }
    else if ([v35 isEqualToString:@"TEMPORARY_CLOSURE"])
    {
      int v36 = 3;
    }
    else if ([v35 isEqualToString:@"PERMANENT_CLOSURE"])
    {
      int v36 = 4;
    }
    else
    {
      int v36 = 0;
    }

    goto LABEL_54;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v36 = [v34 intValue];
LABEL_54:
    *(_WORD *)(v6 + 88) |= 0x100u;
    *(_WORD *)(v6 + 88) |= 4u;
    *(_DWORD *)(v6 + 84) = v36;
  }

  if (a3) {
    id v37 = @"hoursThreshold";
  }
  else {
    id v37 = @"hours_threshold";
  }
  v38 = [v5 objectForKeyedSubscript:v37];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v39 = [GEOPDHoursThreshold alloc];
    if (v39) {
      id v40 = (void *)-[GEOPDHoursThreshold _initWithDictionary:isJSON:](v39, v38, a3);
    }
    else {
      id v40 = 0;
    }
    id v41 = v40;
    *(_WORD *)(v6 + 88) |= 0x10u;
    *(_WORD *)(v6 + 88) |= 0x100u;
    objc_storeStrong((id *)(v6 + 32), v40);
  }
LABEL_63:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDBusinessHoursReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDBusinessHoursIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDBusinessHours readAll:]((uint64_t)self, 0);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = self->_weeklyHours;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_message) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_shortMessage) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(_WORD *)&self->_flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_hoursThreshold) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
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
      GEOPDBusinessHoursReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDBusinessHours readAll:]((uint64_t)self, 0);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = self->_weeklyHours;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
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
        long long v13 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (void)v23);
        -[GEOPDBusinessHours addWeeklyHours:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 56) = self->_start;
    *(_WORD *)(v5 + 88) |= 2u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 24) = self->_end;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  id v15 = -[GEOLocalizedString copyWithZone:](self->_message, "copyWithZone:", a3, (void)v23);
  long long v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  id v17 = [(GEOLocalizedString *)self->_shortMessage copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v17;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_hoursType;
    *(_WORD *)(v5 + 88) |= 4u;
  }
  id v19 = [(GEOPDHoursThreshold *)self->_hoursThreshold copyWithZone:a3];
  id v20 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v19;

  uint64_t v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  -[GEOPDBusinessHours readAll:]((uint64_t)self, 1);
  -[GEOPDBusinessHours readAll:]((uint64_t)v4, 1);
  weeklyHours = self->_weeklyHours;
  if ((unint64_t)weeklyHours | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](weeklyHours, "isEqual:")) {
      goto LABEL_25;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 44);
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_start != *((void *)v4 + 7)) {
      goto LABEL_25;
    }
  }
  else if ((v7 & 2) != 0)
  {
LABEL_25:
    char v12 = 0;
    goto LABEL_26;
  }
  if (flags)
  {
    if ((v7 & 1) == 0 || self->_end != *((void *)v4 + 3)) {
      goto LABEL_25;
    }
  }
  else if (v7)
  {
    goto LABEL_25;
  }
  message = self->_message;
  if ((unint64_t)message | *((void *)v4 + 5) && !-[GEOLocalizedString isEqual:](message, "isEqual:")) {
    goto LABEL_25;
  }
  shortMessage = self->_shortMessage;
  if ((unint64_t)shortMessage | *((void *)v4 + 6))
  {
    if (!-[GEOLocalizedString isEqual:](shortMessage, "isEqual:")) {
      goto LABEL_25;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_hoursType != *((_DWORD *)v4 + 21)) {
      goto LABEL_25;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_25;
  }
  hoursThreshold = self->_hoursThreshold;
  if ((unint64_t)hoursThreshold | *((void *)v4 + 4)) {
    char v12 = -[GEOPDHoursThreshold isEqual:](hoursThreshold, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  -[GEOPDBusinessHours readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_weeklyHours hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    unint64_t v5 = 2654435761u * self->_start;
    if (flags) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if (flags)
    {
LABEL_3:
      unint64_t v6 = 2654435761u * self->_end;
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0;
LABEL_6:
  unint64_t v7 = [(GEOLocalizedString *)self->_message hash];
  unint64_t v8 = [(GEOLocalizedString *)self->_shortMessage hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v9 = 2654435761 * self->_hoursType;
  }
  else {
    uint64_t v9 = 0;
  }
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(GEOPDHoursThreshold *)self->_hoursThreshold hash];
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 88) |= 8u;
    *(_WORD *)(a1 + 88) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    __int16 v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDBusinessHours readAll:](a1, 0);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = *(id *)(a1 + 64);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7++), "clearUnknownFields:", 1, (void)v10);
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    [*(id *)(a1 + 40) clearUnknownFields:1];
    [*(id *)(a1 + 48) clearUnknownFields:1];
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      uint64_t v9 = *(void **)(v8 + 8);
      *(void *)(v8 + 8) = 0;
    }
  }
}

@end