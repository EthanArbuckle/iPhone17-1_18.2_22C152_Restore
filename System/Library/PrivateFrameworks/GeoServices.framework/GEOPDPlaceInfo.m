@interface GEOPDPlaceInfo
+ (id)placeInfoForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceInfo)init;
- (GEOPDPlaceInfo)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)center;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)enhancedCenter;
- (id)jsonRepresentation;
- (id)labelPoint;
- (id)timezone;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)clearUnknownFields:(uint64_t)result;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (uint64_t)knownAccuracy;
- (unint64_t)hash;
- (void)_readCenter;
- (void)_readEnhancedCenter;
- (void)_readLabelPoint;
- (void)_readTimezone;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceInfo

- (id)center
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceInfo _readCenter]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readCenter
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
        GEOPDPlaceInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_7526);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)_readEnhancedCenter
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
        GEOPDPlaceInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEnhancedCenter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

+ (id)placeInfoForPlaceData:(id)a3
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
  v6[2] = __57__GEOPDPlaceInfo_PlaceDataExtras__placeInfoForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:2 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __57__GEOPDPlaceInfo_PlaceDataExtras__placeInfoForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue placeInfo](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (uint64_t)knownAccuracy
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 92);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if ((v2 & 2) != 0) {
      return *(unsigned int *)(v1 + 84);
    }
    else {
      return 0;
    }
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
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlaceInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceInfo readAll:]((uint64_t)self, 0);
  id v9 = [(GEOLatLng *)self->_center copyWithZone:a3];
  v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  if (*(_WORD *)&self->_flags)
  {
    *(double *)(v5 + 24) = self->_area;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  id v11 = [(GEOTimezone *)self->_timezone copyWithZone:a3];
  id v12 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v11;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 88) = self->_isApproximateCenter;
    *(_WORD *)(v5 + 92) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_knownAccuracy;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  id v14 = [(GEOPDBasemapRegionMetadata *)self->_basemapRegionMetadata copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  id v16 = [(GEOLatLng *)self->_enhancedCenter copyWithZone:a3];
  v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  id v18 = [(GEOLatLng *)self->_labelPoint copyWithZone:a3];
  v19 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v18;

  v20 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v20;
LABEL_12:

  return (id)v5;
}

- (GEOPDPlaceInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceInfo;
  __int16 v2 = [(GEOPDPlaceInfo *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_labelPoint, 0);
  objc_storeStrong((id *)&self->_enhancedCenter, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_basemapRegionMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_70;
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"center"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [GEOLatLng alloc];
    if (a3) {
      id v9 = [(GEOLatLng *)v8 initWithJSON:v7];
    }
    else {
      id v9 = [(GEOLatLng *)v8 initWithDictionary:v7];
    }
    v10 = v9;
    id v11 = v9;
    *(_WORD *)(v6 + 92) |= 0x20u;
    *(_WORD *)(v6 + 92) |= 0x200u;
    objc_storeStrong((id *)(v6 + 40), v10);
  }
  id v12 = [v5 objectForKeyedSubscript:@"area"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v12 doubleValue];
    *(_WORD *)(v6 + 92) |= 0x200u;
    *(_WORD *)(v6 + 92) |= 1u;
    *(void *)(v6 + 24) = v13;
  }

  id v14 = [v5 objectForKeyedSubscript:@"timezone"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [GEOTimezone alloc];
    if (v15) {
      id v16 = -[GEOTimezone _initWithDictionary:isJSON:](v15, v14);
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;
    *(_WORD *)(v6 + 92) |= 0x100u;
    *(_WORD *)(v6 + 92) |= 0x200u;
    objc_storeStrong((id *)(v6 + 64), v16);
  }
  if (a3) {
    id v18 = @"isApproximateCenter";
  }
  else {
    id v18 = @"is_approximate_center";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v20 = [v19 BOOLValue];
    *(_WORD *)(v6 + 92) |= 0x200u;
    *(_WORD *)(v6 + 92) |= 4u;
    *(unsigned char *)(v6 + 88) = v20;
  }

  if (a3) {
    v21 = @"knownAccuracy";
  }
  else {
    v21 = @"known_accuracy";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v22;
    if ([v23 isEqualToString:@"POINT"])
    {
      int v24 = 0;
    }
    else if ([v23 isEqualToString:@"INTERPOLATION"])
    {
      int v24 = 1;
    }
    else if ([v23 isEqualToString:@"APPROXIMATE"])
    {
      int v24 = 2;
    }
    else if ([v23 isEqualToString:@"POSTAL_ZIP"])
    {
      int v24 = 3;
    }
    else if ([v23 isEqualToString:@"PARCEL"])
    {
      int v24 = 4;
    }
    else if ([v23 isEqualToString:@"SUBPREMISE"])
    {
      int v24 = 5;
    }
    else
    {
      int v24 = 0;
    }

    goto LABEL_38;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v24 = [v22 intValue];
LABEL_38:
    *(_WORD *)(v6 + 92) |= 0x200u;
    *(_WORD *)(v6 + 92) |= 2u;
    *(_DWORD *)(v6 + 84) = v24;
  }

  if (a3) {
    v25 = @"basemapRegionMetadata";
  }
  else {
    v25 = @"basemap_region_metadata";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = [GEOPDBasemapRegionMetadata alloc];
    if (v27)
    {
      id v28 = v26;
      v27 = [(GEOPDBasemapRegionMetadata *)v27 init];
      if (v27)
      {
        if (a3) {
          v29 = @"buildUnitAreaId";
        }
        else {
          v29 = @"build_unit_area_id";
        }
        v30 = [v28 objectForKeyedSubscript:v29];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v31 = (void *)[v30 copy];
          id v32 = v31;
          objc_storeStrong((id *)&v27->_buildUnitAreaId, v31);
        }
      }
    }
    v33 = v27;
    *(_WORD *)(v6 + 92) |= 0x10u;
    *(_WORD *)(v6 + 92) |= 0x200u;
    objc_storeStrong((id *)(v6 + 32), v27);
  }
  if (a3) {
    v34 = @"enhancedCenter";
  }
  else {
    v34 = @"enhanced_center";
  }
  v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v36 = [GEOLatLng alloc];
    if (a3) {
      v37 = [(GEOLatLng *)v36 initWithJSON:v35];
    }
    else {
      v37 = [(GEOLatLng *)v36 initWithDictionary:v35];
    }
    v38 = v37;
    v39 = v37;
    *(_WORD *)(v6 + 92) |= 0x40u;
    *(_WORD *)(v6 + 92) |= 0x200u;
    objc_storeStrong((id *)(v6 + 48), v38);
  }
  if (a3) {
    v40 = @"labelPoint";
  }
  else {
    v40 = @"label_point";
  }
  v41 = [v5 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v42 = [GEOLatLng alloc];
    if (a3) {
      v43 = [(GEOLatLng *)v42 initWithJSON:v41];
    }
    else {
      v43 = [(GEOLatLng *)v42 initWithDictionary:v41];
    }
    v44 = v43;
    v45 = v43;
    *(_WORD *)(v6 + 92) |= 0x80u;
    *(_WORD *)(v6 + 92) |= 0x200u;
    objc_storeStrong((id *)(v6 + 56), v44);
  }
LABEL_70:

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3F0) == 0))
  {
    uint64_t v7 = self->_reader;
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
    -[GEOPDPlaceInfo readAll:]((uint64_t)self, 0);
    if (self->_center) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v9;
    if (*(_WORD *)&self->_flags)
    {
      PBDataWriterWriteDoubleField();
      id v5 = v9;
    }
    if (self->_timezone)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
    }
    if (self->_basemapRegionMetadata)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_enhancedCenter)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_labelPoint)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  -[GEOPDPlaceInfo readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceInfo readAll:]((uint64_t)v4, 1);
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 5))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_31;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 46);
  if (flags)
  {
    if ((v7 & 1) == 0 || self->_area != *((double *)v4 + 3)) {
      goto LABEL_31;
    }
  }
  else if (v7)
  {
    goto LABEL_31;
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((void *)v4 + 8))
  {
    if (!-[GEOTimezone isEqual:](timezone, "isEqual:")) {
      goto LABEL_31;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v7 = *((_WORD *)v4 + 46);
  }
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) != 0)
    {
      if (self->_isApproximateCenter)
      {
        if (!*((unsigned char *)v4 + 88)) {
          goto LABEL_31;
        }
        goto LABEL_20;
      }
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_20;
      }
    }
LABEL_31:
    char v12 = 0;
    goto LABEL_32;
  }
  if ((v7 & 4) != 0) {
    goto LABEL_31;
  }
LABEL_20:
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_knownAccuracy != *((_DWORD *)v4 + 21)) {
      goto LABEL_31;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_31;
  }
  basemapRegionMetadata = self->_basemapRegionMetadata;
  if ((unint64_t)basemapRegionMetadata | *((void *)v4 + 4)
    && !-[GEOPDBasemapRegionMetadata isEqual:](basemapRegionMetadata, "isEqual:"))
  {
    goto LABEL_31;
  }
  enhancedCenter = self->_enhancedCenter;
  if ((unint64_t)enhancedCenter | *((void *)v4 + 6))
  {
    if (!-[GEOLatLng isEqual:](enhancedCenter, "isEqual:")) {
      goto LABEL_31;
    }
  }
  labelPoint = self->_labelPoint;
  if ((unint64_t)labelPoint | *((void *)v4 + 7)) {
    char v12 = -[GEOLatLng isEqual:](labelPoint, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_32:

  return v12;
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
        uint64_t v6 = (int *)&readAll__recursiveTag_7556;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_7557;
      }
      GEOPDPlaceInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      [*(id *)(a1 + 40) readAll:1];
      [*(id *)(a1 + 48) readAll:1];
      [*(id *)(a1 + 56) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)timezone
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDPlaceInfo _readTimezone]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readTimezone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimezone_tags_7527);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)_readLabelPoint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabelPoint_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDPlaceInfo _readCenter](result);
    if ([*(id *)(v3 + 40) hasGreenTeaWithValue:a2]) {
      return 1;
    }
    -[GEOPDPlaceInfo _readEnhancedCenter](v3);
    if ([*(id *)(v3 + 48) hasGreenTeaWithValue:a2])
    {
      return 1;
    }
    else
    {
      -[GEOPDPlaceInfo _readLabelPoint](v3);
      id v4 = *(void **)(v3 + 56);
      return [v4 hasGreenTeaWithValue:a2];
    }
  }
  return result;
}

- (uint64_t)clearUnknownFields:(uint64_t)result
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    *(_WORD *)(v1 + 92) |= 8u;
    *(_WORD *)(v1 + 92) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    __int16 v2 = *(void **)(v1 + 16);
    *(void *)(v1 + 16) = 0;

    -[GEOPDPlaceInfo readAll:](v1, 0);
    [*(id *)(v1 + 40) clearUnknownFields:1];
    uint64_t v3 = *(void *)(v1 + 64);
    if (v3)
    {
      id v4 = *(void **)(v3 + 8);
      *(void *)(v3 + 8) = 0;
    }
    uint64_t v5 = *(void *)(v1 + 32);
    if (v5)
    {
      uint64_t v6 = *(void **)(v5 + 8);
      *(void *)(v5 + 8) = 0;
    }
    [*(id *)(v1 + 48) clearUnknownFields:1];
    __int16 v7 = *(void **)(v1 + 56);
    return [v7 clearUnknownFields:1];
  }
  return result;
}

- (GEOPDPlaceInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceInfo;
  uint64_t v3 = [(GEOPDPlaceInfo *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (id)enhancedCenter
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDPlaceInfo _readEnhancedCenter]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)labelPoint
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDPlaceInfo _readLabelPoint]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceInfo;
  id v4 = [(GEOPDPlaceInfo *)&v8 description];
  uint64_t v5 = [(GEOPDPlaceInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPlaceInfo readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = -[GEOPDPlaceInfo center]((id *)a1);
    uint64_t v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"center"];
    }
    if (*(_WORD *)(a1 + 92))
    {
      objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      [v4 setObject:v8 forKey:@"area"];
    }
    id v9 = -[GEOPDPlaceInfo timezone]((id *)a1);
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      id v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"timezone"];
    }
    __int16 v12 = *(_WORD *)(a1 + 92);
    if ((v12 & 4) != 0)
    {
      uint64_t v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 88)];
      if (a2) {
        id v14 = @"isApproximateCenter";
      }
      else {
        id v14 = @"is_approximate_center";
      }
      [v4 setObject:v13 forKey:v14];

      __int16 v12 = *(_WORD *)(a1 + 92);
    }
    if ((v12 & 2) != 0)
    {
      uint64_t v15 = *(int *)(a1 + 84);
      if (v15 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
        id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v16 = off_1E53E3F08[v15];
      }
      if (a2) {
        id v17 = @"knownAccuracy";
      }
      else {
        id v17 = @"known_accuracy";
      }
      [v4 setObject:v16 forKey:v17];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
    {
      id v18 = *(void **)(a1 + 8);
      if (v18)
      {
        id v19 = v18;
        objc_sync_enter(v19);
        GEOPDPlaceInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBasemapRegionMetadata_tags);
        objc_sync_exit(v19);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v20 = *(id *)(a1 + 32);
    v21 = v20;
    if (v20)
    {
      if (a2)
      {
        v22 = [v20 jsonRepresentation];
        id v23 = @"basemapRegionMetadata";
      }
      else
      {
        v22 = [v20 dictionaryRepresentation];
        id v23 = @"basemap_region_metadata";
      }
      [v4 setObject:v22 forKey:v23];
    }
    int v24 = -[GEOPDPlaceInfo enhancedCenter]((id *)a1);
    v25 = v24;
    if (v24)
    {
      if (a2)
      {
        v26 = [v24 jsonRepresentation];
        v27 = @"enhancedCenter";
      }
      else
      {
        v26 = [v24 dictionaryRepresentation];
        v27 = @"enhanced_center";
      }
      [v4 setObject:v26 forKey:v27];
    }
    id v28 = -[GEOPDPlaceInfo labelPoint]((id *)a1);
    v29 = v28;
    if (v28)
    {
      if (a2)
      {
        v30 = [v28 jsonRepresentation];
        v31 = @"labelPoint";
      }
      else
      {
        v30 = [v28 dictionaryRepresentation];
        v31 = @"label_point";
      }
      [v4 setObject:v30 forKey:v31];
    }
    id v32 = *(void **)(a1 + 16);
    if (v32)
    {
      v33 = [v32 dictionaryRepresentation];
      v34 = v33;
      if (a2)
      {
        v35 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v33, "count"));
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __44__GEOPDPlaceInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDPlaceInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOPDPlaceInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (unint64_t)hash
{
  -[GEOPDPlaceInfo readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOLatLng *)self->_center hash];
  if (*(_WORD *)&self->_flags)
  {
    double area = self->_area;
    double v6 = -area;
    if (area >= 0.0) {
      double v6 = self->_area;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  unint64_t v9 = [(GEOTimezone *)self->_timezone hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v11 = 2654435761 * self->_isApproximateCenter;
    if ((flags & 2) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v12 = 0;
    goto LABEL_14;
  }
  uint64_t v11 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_knownAccuracy;
LABEL_14:
  unint64_t v13 = v4 ^ v3 ^ v9 ^ v11;
  unint64_t v14 = v12 ^ [(GEOPDBasemapRegionMetadata *)self->_basemapRegionMetadata hash];
  unint64_t v15 = v13 ^ v14 ^ [(GEOLatLng *)self->_enhancedCenter hash];
  return v15 ^ [(GEOLatLng *)self->_labelPoint hash];
}

@end