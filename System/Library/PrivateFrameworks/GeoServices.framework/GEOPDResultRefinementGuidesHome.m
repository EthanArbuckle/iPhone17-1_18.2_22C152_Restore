@interface GEOPDResultRefinementGuidesHome
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDResultRefinementGuidesHome)init;
- (GEOPDResultRefinementGuidesHome)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (uint64_t)mergeFrom:(uint64_t)a1;
- (unint64_t)hash;
- (void)_readCenter;
- (void)_readMapRegion;
- (void)_readPlaceId;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setCenter:(uint64_t)a1;
- (void)setDisplayName:(uint64_t)a1;
- (void)setHint:(uint64_t)a1;
- (void)setMapRegion:(uint64_t)a1;
- (void)setMetadata:(uint64_t)a1;
- (void)setPlaceId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultRefinementGuidesHome

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDResultRefinementGuidesHome _readCenter](result);
    if ([*(id *)(v3 + 24) hasGreenTeaWithValue:a2]) {
      return 1;
    }
    -[GEOPDResultRefinementGuidesHome _readMapRegion](v3);
    if ([*(id *)(v3 + 48) hasGreenTeaWithValue:a2])
    {
      return 1;
    }
    else
    {
      -[GEOPDResultRefinementGuidesHome _readPlaceId](v3);
      v4 = *(void **)(v3 + 64);
      return [v4 hasGreenTeaWithValue:a2];
    }
  }
  return result;
}

- (uint64_t)mergeFrom:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (!a1) {
    goto LABEL_35;
  }
  v17 = v3;
  -[GEOPDResultRefinementGuidesHome readAll:]((uint64_t)v3, 0);
  v4 = v17;
  if ((_WORD)v17[11])
  {
    *(_DWORD *)(a1 + 84) = *((_DWORD *)v17 + 21);
    *(_WORD *)(a1 + 88) |= 1u;
  }
  v5 = *(void **)(a1 + 64);
  v6 = v17[8];
  if (v5)
  {
    if (!v6) {
      goto LABEL_10;
    }
    objc_msgSend(v5, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_10;
    }
    -[GEOPDResultRefinementGuidesHome setPlaceId:](a1, v17[8]);
  }
  v4 = v17;
LABEL_10:
  v7 = *(void **)(a1 + 48);
  v8 = v4[6];
  if (v7)
  {
    if (!v8) {
      goto LABEL_16;
    }
    objc_msgSend(v7, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_16;
    }
    -[GEOPDResultRefinementGuidesHome setMapRegion:](a1, v4[6]);
  }
  v4 = v17;
LABEL_16:
  v9 = *(void **)(a1 + 24);
  v10 = v4[3];
  if (v9)
  {
    if (!v10) {
      goto LABEL_22;
    }
    objc_msgSend(v9, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_22;
    }
    -[GEOPDResultRefinementGuidesHome setCenter:](a1, v4[3]);
  }
  v4 = v17;
LABEL_22:
  uint64_t v11 = *(void *)(a1 + 40);
  v12 = v4[5];
  if (v11)
  {
    if (v12)
    {
      -[GEOPDRelatedSearchSuggestion mergeFrom:](v11, v12);
LABEL_27:
      v4 = v17;
    }
  }
  else if (v12)
  {
    -[GEOPDResultRefinementGuidesHome setHint:](a1, v12);
    goto LABEL_27;
  }
  v13 = v4[4];
  if (v13)
  {
    -[GEOPDResultRefinementGuidesHome setDisplayName:](a1, v13);
    v4 = v17;
  }
  v14 = *(void **)(a1 + 56);
  v15 = v4[7];
  if (v14)
  {
    if (v15) {
      objc_msgSend(v14, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEOPDResultRefinementGuidesHome setMetadata:](a1, v4[7]);
  }
LABEL_35:

  return MEMORY[0x1F4181870]();
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 88) |= 2u;
    *(_WORD *)(a1 + 88) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementGuidesHome readAll:](a1, 0);
      [*(id *)(a1 + 64) clearUnknownFields:1];
      [*(id *)(a1 + 48) clearUnknownFields:1];
      [*(id *)(a1 + 24) clearUnknownFields:1];
      -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(void *)(a1 + 40), 1);
      v5 = *(void **)(a1 + 56);
      [v5 clearUnknownFields:1];
    }
  }
}

- (GEOPDResultRefinementGuidesHome)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementGuidesHome;
  v2 = [(GEOPDResultRefinementGuidesHome *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementGuidesHome)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementGuidesHome;
  uint64_t v3 = [(GEOPDResultRefinementGuidesHome *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPlaceId
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
        GEOPDResultRefinementGuidesHomeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceId_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)setPlaceId:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 88) |= 0x80u;
  *(_WORD *)(a1 + 88) |= 0x100u;
  objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)_readMapRegion
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
        GEOPDResultRefinementGuidesHomeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_5);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)setMapRegion:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 88) |= 0x20u;
  *(_WORD *)(a1 + 88) |= 0x100u;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)_readCenter
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
        GEOPDResultRefinementGuidesHomeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_6);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)setCenter:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 88) |= 4u;
  *(_WORD *)(a1 + 88) |= 0x100u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setHint:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 88) |= 0x10u;
  *(_WORD *)(a1 + 88) |= 0x100u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setDisplayName:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 88) |= 8u;
  *(_WORD *)(a1 + 88) |= 0x100u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setMetadata:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 88) |= 0x40u;
  *(_WORD *)(a1 + 88) |= 0x100u;
  objc_storeStrong((id *)(a1 + 56), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultRefinementGuidesHome;
  id v4 = [(GEOPDResultRefinementGuidesHome *)&v8 description];
  v5 = [(GEOPDResultRefinementGuidesHome *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementGuidesHome _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDResultRefinementGuidesHome readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(_WORD *)(a1 + 88))
    {
      uint64_t v5 = *(int *)(a1 + 84);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E5C70[v5];
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    -[GEOPDResultRefinementGuidesHome _readPlaceId](a1);
    id v7 = *(id *)(a1 + 64);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"placeId";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"place_id";
      }
      [v4 setObject:v9 forKey:v10];
    }
    -[GEOPDResultRefinementGuidesHome _readMapRegion](a1);
    id v11 = *(id *)(a1 + 48);
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"mapRegion";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"map_region";
      }
      [v4 setObject:v13 forKey:v14];
    }
    -[GEOPDResultRefinementGuidesHome _readCenter](a1);
    id v15 = *(id *)(a1 + 24);
    v16 = v15;
    if (v15)
    {
      if (a2) {
        [v15 jsonRepresentation];
      }
      else {
      v17 = [v15 dictionaryRepresentation];
      }
      [v4 setObject:v17 forKey:@"center"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v18 = *(void **)(a1 + 8);
      if (v18)
      {
        id v19 = v18;
        objc_sync_enter(v19);
        GEOPDResultRefinementGuidesHomeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHint_tags);
        objc_sync_exit(v19);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v20 = *(id *)(a1 + 40);
    v21 = v20;
    if (v20)
    {
      if (a2) {
        [v20 jsonRepresentation];
      }
      else {
      v22 = [v20 dictionaryRepresentation];
      }
      [v4 setObject:v22 forKey:@"hint"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v23 = *(void **)(a1 + 8);
      if (v23)
      {
        id v24 = v23;
        objc_sync_enter(v24);
        GEOPDResultRefinementGuidesHomeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_3);
        objc_sync_exit(v24);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v25 = *(id *)(a1 + 32);
    if (v25)
    {
      if (a2) {
        v26 = @"displayName";
      }
      else {
        v26 = @"display_name";
      }
      [v4 setObject:v25 forKey:v26];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v27 = *(void **)(a1 + 8);
      if (v27)
      {
        id v28 = v27;
        objc_sync_enter(v28);
        GEOPDResultRefinementGuidesHomeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMetadata_tags_2);
        objc_sync_exit(v28);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v29 = *(id *)(a1 + 56);
    v30 = v29;
    if (v29)
    {
      if (a2) {
        [v29 jsonRepresentation];
      }
      else {
      v31 = [v29 dictionaryRepresentation];
      }
      [v4 setObject:v31 forKey:@"metadata"];
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
        v39[2] = __61__GEOPDResultRefinementGuidesHome__dictionaryRepresentation___block_invoke;
        v39[3] = &unk_1E53D8860;
        id v36 = v35;
        id v40 = v36;
        [v34 enumerateKeysAndObjectsUsingBlock:v39];
        id v37 = v36;

        v34 = v37;
      }
      [v4 setObject:v34 forKey:@"Unknown Fields"];
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
  return -[GEOPDResultRefinementGuidesHome _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_558_0;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_559_0;
      }
      GEOPDResultRefinementGuidesHomeReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDResultRefinementGuidesHomeCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __61__GEOPDResultRefinementGuidesHome__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_51;
  }
  a1 = [(id)a1 init];
  if (!a1) {
    goto LABEL_51;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"RESULT_REFINEMENT_GUIDES_HOME_TYPE_UNKNOWN"])
    {
      int v8 = 0;
    }
    else if ([v7 isEqualToString:@"RESULT_REFINEMENT_GUIDES_HOME_TYPE_PLACE"])
    {
      int v8 = 1;
    }
    else if ([v7 isEqualToString:@"RESULT_REFINEMENT_GUIDES_HOME_TYPE_LOCATION"])
    {
      int v8 = 2;
    }
    else
    {
      int v8 = 0;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v8 = [v6 intValue];
LABEL_14:
    *(_WORD *)(a1 + 88) |= 0x100u;
    *(_WORD *)(a1 + 88) |= 1u;
    *(_DWORD *)(a1 + 84) = v8;
  }

  if (a3) {
    v9 = @"placeId";
  }
  else {
    v9 = @"place_id";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [GEOPDMapsIdentifier alloc];
    if (a3) {
      v12 = [(GEOPDMapsIdentifier *)v11 initWithJSON:v10];
    }
    else {
      v12 = [(GEOPDMapsIdentifier *)v11 initWithDictionary:v10];
    }
    v13 = v12;
    -[GEOPDResultRefinementGuidesHome setPlaceId:](a1, v12);
  }
  if (a3) {
    v14 = @"mapRegion";
  }
  else {
    v14 = @"map_region";
  }
  id v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [GEOMapRegion alloc];
    if (a3) {
      v17 = [(GEOMapRegion *)v16 initWithJSON:v15];
    }
    else {
      v17 = [(GEOMapRegion *)v16 initWithDictionary:v15];
    }
    v18 = v17;
    -[GEOPDResultRefinementGuidesHome setMapRegion:](a1, v17);
  }
  id v19 = [v5 objectForKeyedSubscript:@"center"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = [GEOLatLng alloc];
    if (a3) {
      v21 = [(GEOLatLng *)v20 initWithJSON:v19];
    }
    else {
      v21 = [(GEOLatLng *)v20 initWithDictionary:v19];
    }
    v22 = v21;
    -[GEOPDResultRefinementGuidesHome setCenter:](a1, v21);
  }
  v23 = [v5 objectForKeyedSubscript:@"hint"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = [GEOPDRelatedSearchSuggestion alloc];
    if (v24) {
      id v25 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v24, v23, a3);
    }
    else {
      id v25 = 0;
    }
    -[GEOPDResultRefinementGuidesHome setHint:](a1, v25);
  }
  if (a3) {
    v26 = @"displayName";
  }
  else {
    v26 = @"display_name";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = (void *)[v27 copy];
    -[GEOPDResultRefinementGuidesHome setDisplayName:](a1, v28);
  }
  id v29 = [v5 objectForKeyedSubscript:@"metadata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [GEOPDResultRefinementMetadata alloc];
    if (a3) {
      v31 = [(GEOPDResultRefinementMetadata *)v30 initWithJSON:v29];
    }
    else {
      v31 = [(GEOPDResultRefinementMetadata *)v30 initWithDictionary:v29];
    }
    v32 = v31;
    -[GEOPDResultRefinementGuidesHome setMetadata:](a1, v31);
  }
LABEL_51:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementGuidesHomeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDResultRefinementGuidesHomeIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementGuidesHome readAll:]((uint64_t)self, 0);
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_placeId)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_mapRegion)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_center)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_hint)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_displayName)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_metadata)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDResultRefinementGuidesHomeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDResultRefinementGuidesHome readAll:]((uint64_t)self, 0);
  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 84) = self->_type;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  id v9 = [(GEOPDMapsIdentifier *)self->_placeId copyWithZone:a3];
  id v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  id v11 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  id v13 = [(GEOLatLng *)self->_center copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  id v15 = [(GEOPDRelatedSearchSuggestion *)self->_hint copyWithZone:a3];
  v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  uint64_t v17 = [(NSString *)self->_displayName copyWithZone:a3];
  v18 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v17;

  id v19 = [(GEOPDResultRefinementMetadata *)self->_metadata copyWithZone:a3];
  id v20 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v19;

  v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  -[GEOPDResultRefinementGuidesHome readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinementGuidesHome readAll:]((uint64_t)v4, 1);
  __int16 v5 = *((_WORD *)v4 + 44);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_type != *((_DWORD *)v4 + 21)) {
      goto LABEL_19;
    }
  }
  else if (v5)
  {
LABEL_19:
    char v12 = 0;
    goto LABEL_20;
  }
  placeId = self->_placeId;
  if ((unint64_t)placeId | *((void *)v4 + 8) && !-[GEOPDMapsIdentifier isEqual:](placeId, "isEqual:")) {
    goto LABEL_19;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 6))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
      goto LABEL_19;
    }
  }
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_19;
    }
  }
  hint = self->_hint;
  if ((unint64_t)hint | *((void *)v4 + 5))
  {
    if (!-[GEOPDRelatedSearchSuggestion isEqual:](hint, "isEqual:")) {
      goto LABEL_19;
    }
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_19;
    }
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 7)) {
    char v12 = -[GEOPDResultRefinementMetadata isEqual:](metadata, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  -[GEOPDResultRefinementGuidesHome readAll:]((uint64_t)self, 1);
  if (*(_WORD *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDMapsIdentifier *)self->_placeId hash] ^ v3;
  unint64_t v5 = [(GEOMapRegion *)self->_mapRegion hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOLatLng *)self->_center hash];
  unint64_t v7 = [(GEOPDRelatedSearchSuggestion *)self->_hint hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_displayName hash];
  return v6 ^ v8 ^ [(GEOPDResultRefinementMetadata *)self->_metadata hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeId, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_hint, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end