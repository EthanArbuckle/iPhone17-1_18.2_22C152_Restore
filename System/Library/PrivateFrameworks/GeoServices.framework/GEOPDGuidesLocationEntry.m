@interface GEOPDGuidesLocationEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGuidesLocationEntry)init;
- (GEOPDGuidesLocationEntry)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)placeId;
- (id)worldwide;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (uint64_t)type;
- (unint64_t)hash;
- (void)_readCenter;
- (void)_readGeoIdCandidates;
- (void)_readMapRegion;
- (void)_readPlaceId;
- (void)_readWorldwide;
- (void)addGeoIdCandidate:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)dealloc;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setCenter:(uint64_t)a1;
- (void)setMapRegion:(uint64_t)a1;
- (void)setPlaceId:(uint64_t)a1;
- (void)setWorldwide:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGuidesLocationEntry

- (GEOPDGuidesLocationEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDGuidesLocationEntry;
  v2 = [(GEOPDGuidesLocationEntry *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDGuidesLocationEntry _readCenter](result);
    if ([*(id *)(v3 + 48) hasGreenTeaWithValue:a2]) {
      return 1;
    }
    -[GEOPDGuidesLocationEntry _readMapRegion](v3);
    if ([*(id *)(v3 + 56) hasGreenTeaWithValue:a2])
    {
      return 1;
    }
    else
    {
      -[GEOPDGuidesLocationEntry _readPlaceId](v3);
      v4 = *(void **)(v3 + 64);
      return [v4 hasGreenTeaWithValue:a2];
    }
  }
  return result;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1) {
    goto LABEL_49;
  }
  id v30 = v3;
  -[GEOPDGuidesLocationEntry readAll:]((uint64_t)v3, 0);
  uint64_t v4 = (uint64_t)v30;
  v5 = *(void **)(a1 + 64);
  uint64_t v6 = *((void *)v30 + 8);
  if (v5)
  {
    if (!v6) {
      goto LABEL_8;
    }
    objc_msgSend(v5, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_8;
    }
    -[GEOPDGuidesLocationEntry setPlaceId:](a1, *((void **)v30 + 8));
  }
  uint64_t v4 = (uint64_t)v30;
LABEL_8:
  __int16 v7 = *(_WORD *)(v4 + 100);
  if (v7)
  {
    *(_DWORD *)(a1 + 92) = *(_DWORD *)(v4 + 92);
    *(_WORD *)(a1 + 100) |= 1u;
    __int16 v7 = *(_WORD *)(v4 + 100);
  }
  if ((v7 & 2) != 0)
  {
    *(_DWORD *)(a1 + 96) = *(_DWORD *)(v4 + 96);
    *(_WORD *)(a1 + 100) |= 2u;
  }
  uint64_t v8 = *(void *)(a1 + 72);
  v9 = *(void **)(v4 + 72);
  if (v8)
  {
    if (!v9) {
      goto LABEL_32;
    }
    id v10 = v9;
    -[GEOPDGuidesLocationEntryTypeWorldWide readAll:]((uint64_t)v10, 0);
    v11 = (void *)*((void *)v10 + 4);
    if (v11) {
      -[GEOPDGuidesLocationEntryTypeWorldWide setName:](v8, v11);
    }
    uint64_t v12 = *(void *)(v8 + 40);
    v13 = (void *)*((void *)v10 + 5);
    if (v12)
    {
      if (v13) {
        -[GEOPDCaptionedPhoto mergeFrom:](v12, v13);
      }
    }
    else if (v13)
    {
      -[GEOPDGuidesLocationEntryTypeWorldWide setPhoto:](v8, v13);
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = *((id *)v10 + 3);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          -[GEOPDGuidesLocationEntryTypeWorldWide addGuideLocationImage:](v8, *(void **)(*((void *)&v31 + 1) + 8 * i));
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v16);
    }
  }
  else
  {
    if (!v9) {
      goto LABEL_32;
    }
    -[GEOPDGuidesLocationEntry setWorldwide:](a1, v9);
  }
  uint64_t v4 = (uint64_t)v30;
LABEL_32:
  v19 = *(void **)(a1 + 56);
  uint64_t v20 = *(void *)(v4 + 56);
  if (v19)
  {
    if (!v20) {
      goto LABEL_38;
    }
    objc_msgSend(v19, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_38;
    }
    -[GEOPDGuidesLocationEntry setMapRegion:](a1, *(void **)(v4 + 56));
  }
  uint64_t v4 = (uint64_t)v30;
LABEL_38:
  v21 = *(void **)(a1 + 48);
  uint64_t v22 = *(void *)(v4 + 48);
  if (v21)
  {
    if (!v22) {
      goto LABEL_44;
    }
    objc_msgSend(v21, "mergeFrom:");
  }
  else
  {
    if (!v22) {
      goto LABEL_44;
    }
    -[GEOPDGuidesLocationEntry setCenter:](a1, *(void **)(v4 + 48));
  }
  uint64_t v4 = (uint64_t)v30;
LABEL_44:
  -[GEOPDGuidesLocationEntry _readGeoIdCandidates](v4);
  id v3 = v30;
  uint64_t v23 = *((void *)v30 + 4);
  if (v23)
  {
    unint64_t v24 = 0;
    uint64_t v25 = *MEMORY[0x1E4F1C4A8];
    do
    {
      -[GEOPDGuidesLocationEntry _readGeoIdCandidates]((uint64_t)v3);
      unint64_t v26 = *((void *)v30 + 4);
      if (v26 <= v24)
      {
        v27 = (void *)MEMORY[0x1E4F1CA00];
        v28 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v24, v26);
        v29 = [v27 exceptionWithName:v25 reason:v28 userInfo:0];
        [v29 raise];
      }
      -[GEOPDGuidesLocationEntry addGeoIdCandidate:](a1);
      id v3 = v30;
      ++v24;
    }
    while (v23 != v24);
  }
LABEL_49:
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 100) |= 4u;
    *(_WORD *)(a1 + 100) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDGuidesLocationEntry readAll:](a1, 0);
      [*(id *)(a1 + 64) clearUnknownFields:1];
      -[GEOPDGuidesLocationEntryTypeWorldWide clearUnknownFields:](*(void *)(a1 + 72), 1);
      [*(id *)(a1 + 56) clearUnknownFields:1];
      v5 = *(void **)(a1 + 48);
      [v5 clearUnknownFields:1];
    }
  }
}

- (GEOPDGuidesLocationEntry)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDGuidesLocationEntry;
  id v3 = [(GEOPDGuidesLocationEntry *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDGuidesLocationEntry;
  [(GEOPDGuidesLocationEntry *)&v3 dealloc];
}

- (void)_readPlaceId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesLocationEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceId_tags_5515);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)placeId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDGuidesLocationEntry _readPlaceId]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPlaceId:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x40u;
  *(_WORD *)(a1 + 100) |= 0x100u;
  objc_storeStrong((id *)(a1 + 64), a2);
}

- (uint64_t)type
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 100);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 88));
    if ((v2 & 2) != 0) {
      return *(unsigned int *)(v1 + 96);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readWorldwide
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 0x80) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesLocationEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWorldwide_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)worldwide
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDGuidesLocationEntry _readWorldwide]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setWorldwide:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 100) |= 0x80u;
    *(_WORD *)(a1 + 100) |= 0x100u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)_readMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 0x20) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesLocationEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_5516);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)setMapRegion:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x20u;
  *(_WORD *)(a1 + 100) |= 0x100u;
  objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 0x10) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesLocationEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)setCenter:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x10u;
  *(_WORD *)(a1 + 100) |= 0x100u;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)_readGeoIdCandidates
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 8) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesLocationEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeoIdCandidates_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)addGeoIdCandidate:(uint64_t)a1
{
  *(_WORD *)(a1 + 100) |= 8u;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  *(_WORD *)(a1 + 100) |= 0x100u;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGuidesLocationEntry;
  id v4 = [(GEOPDGuidesLocationEntry *)&v8 description];
  v5 = [(GEOPDGuidesLocationEntry *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuidesLocationEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDGuidesLocationEntry readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDGuidesLocationEntry placeId]((id *)a1);
    uint64_t v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"placeId";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"place_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    __int16 v9 = *(_WORD *)(a1 + 100);
    if (v9)
    {
      id v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
      if (a2) {
        v11 = @"numGuides";
      }
      else {
        v11 = @"num_guides";
      }
      [v4 setObject:v10 forKey:v11];

      __int16 v9 = *(_WORD *)(a1 + 100);
    }
    if ((v9 & 2) != 0)
    {
      uint64_t v12 = *(int *)(a1 + 96);
      if (v12 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 96));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E53E3A88[v12];
      }
      [v4 setObject:v13 forKey:@"type"];
    }
    id v14 = -[GEOPDGuidesLocationEntry worldwide]((id *)a1);
    uint64_t v15 = v14;
    if (v14)
    {
      if (a2) {
        [v14 jsonRepresentation];
      }
      else {
      uint64_t v16 = [v14 dictionaryRepresentation];
      }
      [v4 setObject:v16 forKey:@"worldwide"];
    }
    -[GEOPDGuidesLocationEntry _readMapRegion](a1);
    id v17 = *(id *)(a1 + 56);
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        uint64_t v20 = @"mapRegion";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        uint64_t v20 = @"map_region";
      }
      [v4 setObject:v19 forKey:v20];
    }
    -[GEOPDGuidesLocationEntry _readCenter](a1);
    id v21 = *(id *)(a1 + 48);
    uint64_t v22 = v21;
    if (v21)
    {
      if (a2) {
        [v21 jsonRepresentation];
      }
      else {
      uint64_t v23 = [v21 dictionaryRepresentation];
      }
      [v4 setObject:v23 forKey:@"center"];
    }
    if (*(void *)(a1 + 32))
    {
      unint64_t v24 = PBRepeatedUInt64NSArray();
      if (a2) {
        uint64_t v25 = @"geoIdCandidate";
      }
      else {
        uint64_t v25 = @"geo_id_candidate";
      }
      [v4 setObject:v24 forKey:v25];
    }
    unint64_t v26 = *(void **)(a1 + 16);
    if (v26)
    {
      v27 = [v26 dictionaryRepresentation];
      v28 = v27;
      if (a2)
      {
        v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __54__GEOPDGuidesLocationEntry__dictionaryRepresentation___block_invoke;
        v33[3] = &unk_1E53D8860;
        id v30 = v29;
        id v34 = v30;
        [v28 enumerateKeysAndObjectsUsingBlock:v33];
        id v31 = v30;

        v28 = v31;
      }
      [v4 setObject:v28 forKey:@"Unknown Fields"];
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
  return -[GEOPDGuidesLocationEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_5530;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_5531;
      }
      GEOPDGuidesLocationEntryReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDGuidesLocationEntryCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __54__GEOPDGuidesLocationEntry__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    __int16 v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_86;
  }
  a1 = [(id)a1 init];
  if (!a1) {
    goto LABEL_86;
  }
  if (a3) {
    uint64_t v6 = @"placeId";
  }
  else {
    uint64_t v6 = @"place_id";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [GEOPDMapsIdentifier alloc];
    if (a3) {
      __int16 v9 = [(GEOPDMapsIdentifier *)v8 initWithJSON:v7];
    }
    else {
      __int16 v9 = [(GEOPDMapsIdentifier *)v8 initWithDictionary:v7];
    }
    id v10 = v9;
    -[GEOPDGuidesLocationEntry setPlaceId:](a1, v9);
  }
  if (a3) {
    v11 = @"numGuides";
  }
  else {
    v11 = @"num_guides";
  }
  uint64_t v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v13 = [v12 unsignedIntValue];
    *(_WORD *)(a1 + 100) |= 0x100u;
    *(_WORD *)(a1 + 100) |= 1u;
    *(_DWORD *)(a1 + 92) = v13;
  }

  id v14 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 isEqualToString:@"GUIDES_LOCATION_ENTRY_TYPE_UNKNOWN"])
    {
      int v16 = 0;
    }
    else if ([v15 isEqualToString:@"GUIDES_LOCATION_ENTRY_TYPE_PLACE"])
    {
      int v16 = 1;
    }
    else if ([v15 isEqualToString:@"GUIDES_LOCATION_ENTRY_TYPE_WORLDWIDE"])
    {
      int v16 = 2;
    }
    else
    {
      int v16 = 0;
    }

    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v16 = [v14 intValue];
LABEL_27:
    *(_WORD *)(a1 + 100) |= 0x100u;
    *(_WORD *)(a1 + 100) |= 2u;
    *(_DWORD *)(a1 + 96) = v16;
  }

  id v17 = [v5 objectForKeyedSubscript:@"worldwide"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [GEOPDGuidesLocationEntryTypeWorldWide alloc];
    if (v18)
    {
      id v19 = v17;
      v18 = [(GEOPDGuidesLocationEntryTypeWorldWide *)v18 init];
      if (v18)
      {
        uint64_t v20 = [v19 objectForKeyedSubscript:@"name"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = (void *)[v20 copy];
          -[GEOPDGuidesLocationEntryTypeWorldWide setName:]((uint64_t)v18, v21);
        }
        uint64_t v22 = [v19 objectForKeyedSubscript:@"photo"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v23 = [GEOPDCaptionedPhoto alloc];
          if (v23) {
            unint64_t v24 = (void *)-[GEOPDCaptionedPhoto _initWithDictionary:isJSON:](v23, v22, a3);
          }
          else {
            unint64_t v24 = 0;
          }
          -[GEOPDGuidesLocationEntryTypeWorldWide setPhoto:]((uint64_t)v18, v24);
        }
        if (a3) {
          uint64_t v25 = @"guideLocationImage";
        }
        else {
          uint64_t v25 = @"guide_location_image";
        }
        unint64_t v26 = [v19 objectForKeyedSubscript:v25];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v56 = v19;
          v57 = v17;
          int v27 = a3;
          id v58 = v5;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          v55 = v26;
          id v28 = v26;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v63 objects:v68 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v64;
            do
            {
              uint64_t v32 = 0;
              do
              {
                if (*(void *)v64 != v31) {
                  objc_enumerationMutation(v28);
                }
                long long v33 = *(void **)(*((void *)&v63 + 1) + 8 * v32);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v34 = [GEOPDGuideLocationImage alloc];
                  if (v34) {
                    v35 = (void *)-[GEOPDGuideLocationImage _initWithDictionary:isJSON:](v34, v33, v27);
                  }
                  else {
                    v35 = 0;
                  }
                  -[GEOPDGuidesLocationEntryTypeWorldWide addGuideLocationImage:]((uint64_t)v18, v35);
                }
                ++v32;
              }
              while (v30 != v32);
              uint64_t v36 = [v28 countByEnumeratingWithState:&v63 objects:v68 count:16];
              uint64_t v30 = v36;
            }
            while (v36);
          }

          id v5 = v58;
          a3 = v27;
          unint64_t v26 = v55;
          id v19 = v56;
        }
      }
    }
    -[GEOPDGuidesLocationEntry setWorldwide:](a1, v18);
  }
  if (a3) {
    v37 = @"mapRegion";
  }
  else {
    v37 = @"map_region";
  }
  v38 = objc_msgSend(v5, "objectForKeyedSubscript:", v37, v55, v56, v57, v58);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v39 = [GEOMapRegion alloc];
    if (a3) {
      v40 = [(GEOMapRegion *)v39 initWithJSON:v38];
    }
    else {
      v40 = [(GEOMapRegion *)v39 initWithDictionary:v38];
    }
    v41 = v40;
    -[GEOPDGuidesLocationEntry setMapRegion:](a1, v40);
  }
  v42 = [v5 objectForKeyedSubscript:@"center"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v43 = [GEOLatLng alloc];
    if (a3) {
      v44 = [(GEOLatLng *)v43 initWithJSON:v42];
    }
    else {
      v44 = [(GEOLatLng *)v43 initWithDictionary:v42];
    }
    v45 = v44;
    -[GEOPDGuidesLocationEntry setCenter:](a1, v44);
  }
  if (a3) {
    v46 = @"geoIdCandidate";
  }
  else {
    v46 = @"geo_id_candidate";
  }
  v47 = [v5 objectForKeyedSubscript:v46];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v48 = v47;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v59 objects:v67 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v60 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v53 unsignedLongLongValue];
            -[GEOPDGuidesLocationEntry addGeoIdCandidate:](a1);
          }
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v59 objects:v67 count:16];
      }
      while (v50);
    }
  }
LABEL_86:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGuidesLocationEntryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDGuidesLocationEntryIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    __int16 v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDGuidesLocationEntry readAll:]((uint64_t)self, 0);
    if (self->_placeId) {
      PBDataWriterWriteSubmessage();
    }
    __int16 flags = (__int16)self->_flags;
    id v6 = v10;
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      id v6 = v10;
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v10;
    }
    if (self->_worldwide)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v10;
    }
    if (self->_mapRegion)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v10;
    }
    if (self->_center)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v10;
    }
    if (self->_geoIdCandidates.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        id v6 = v10;
        ++v7;
      }
      while (v7 < self->_geoIdCandidates.count);
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDGuidesLocationEntryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGuidesLocationEntry readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDMapsIdentifier *)self->_placeId copyWithZone:a3];
  id v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 92) = self->_numGuides;
    *(_WORD *)(v5 + 100) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_type;
    *(_WORD *)(v5 + 100) |= 2u;
  }
  id v12 = [(GEOPDGuidesLocationEntryTypeWorldWide *)self->_worldwide copyWithZone:a3];
  int v13 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v12;

  id v14 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  id v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  id v16 = [(GEOLatLng *)self->_center copyWithZone:a3];
  id v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  PBRepeatedUInt64Copy();
  v18 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v18;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  -[GEOPDGuidesLocationEntry readAll:]((uint64_t)self, 1);
  -[GEOPDGuidesLocationEntry readAll:]((uint64_t)v4, 1);
  placeId = self->_placeId;
  if ((unint64_t)placeId | *((void *)v4 + 8))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](placeId, "isEqual:")) {
      goto LABEL_21;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 50);
  if (flags)
  {
    if ((v7 & 1) == 0 || self->_numGuides != *((_DWORD *)v4 + 23)) {
      goto LABEL_21;
    }
  }
  else if (v7)
  {
LABEL_21:
    char IsEqual = 0;
    goto LABEL_22;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_type != *((_DWORD *)v4 + 24)) {
      goto LABEL_21;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_21;
  }
  worldwide = self->_worldwide;
  if ((unint64_t)worldwide | *((void *)v4 + 9)
    && !-[GEOPDGuidesLocationEntryTypeWorldWide isEqual:](worldwide, "isEqual:"))
  {
    goto LABEL_21;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 7))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
      goto LABEL_21;
    }
  }
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 6))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_21;
    }
  }
  char IsEqual = PBRepeatedUInt64IsEqual();
LABEL_22:

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOPDGuidesLocationEntry readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDMapsIdentifier *)self->_placeId hash];
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    uint64_t v5 = 2654435761 * self->_numGuides;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_type;
LABEL_6:
  unint64_t v7 = v5 ^ v3 ^ v6 ^ [(GEOPDGuidesLocationEntryTypeWorldWide *)self->_worldwide hash];
  unint64_t v8 = [(GEOMapRegion *)self->_mapRegion hash];
  unint64_t v9 = v8 ^ [(GEOLatLng *)self->_center hash];
  return v7 ^ v9 ^ PBRepeatedUInt64Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_worldwide, 0);
  objc_storeStrong((id *)&self->_placeId, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end