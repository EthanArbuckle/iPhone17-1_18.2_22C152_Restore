@interface GEOPDBounds
+ (id)boundsInfoForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDBounds)init;
- (GEOPDBounds)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayMapRegion;
- (id)jsonRepresentation;
- (id)mapRegion;
- (id)viewportFrame;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_readDisplayMapRegion;
- (void)_readMapRegion;
- (void)_readViewportFrame;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setDisplayMapRegion:(uint64_t)a1;
- (void)setMapRegion:(uint64_t)a1;
- (void)setViewportFrame:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDBounds

- (id)mapRegion
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDBounds _readMapRegion]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBoundsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

+ (id)boundsInfoForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__37;
  v13 = __Block_byref_object_dispose__37;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__GEOPDBounds_PlaceDataExtras__boundsInfoForPlaceData___block_invoke;
  v8[3] = &unk_1E53E16F0;
  v8[4] = &v9;
  [v3 enumerateValidComponentValuesOfType:4 usingBlock:v8];
  v4 = (void *)v10[5];
  if (!v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__GEOPDBounds_PlaceDataExtras__boundsInfoForPlaceData___block_invoke_2;
    v7[3] = &unk_1E53E16F0;
    v7[4] = &v9;
    [v3 enumerateValidComponentValuesOfType:34 usingBlock:v7];
    v4 = (void *)v10[5];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)displayMapRegion
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDBounds _readDisplayMapRegion]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readDisplayMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBoundsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayMapRegion_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDBoundsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDBounds readAll:]((uint64_t)self, 0);
  id v9 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOMapRegion *)self->_displayMapRegion copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(float *)(v5 + 64) = self->_minZoom;
    *(unsigned char *)(v5 + 68) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(float *)(v5 + 60) = self->_maxZoom;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  id v14 = [(GEOPDViewportFrame *)self->_viewportFrame copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_10:

  return (id)v5;
}

- (GEOPDBounds)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDBounds;
  v2 = [(GEOPDBounds *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

void __55__GEOPDBounds_PlaceDataExtras__boundsInfoForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue bounds](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportFrame, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDBoundsIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
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
    -[GEOPDBounds readAll:]((uint64_t)self, 0);
    if (self->_mapRegion) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v9;
    if (self->_displayMapRegion)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteFloatField();
      id v5 = v9;
      char flags = (char)self->_flags;
    }
    if (flags)
    {
      PBDataWriterWriteFloatField();
      id v5 = v9;
    }
    if (self->_viewportFrame)
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
    goto LABEL_18;
  }
  -[GEOPDBounds readAll:]((uint64_t)self, 1);
  -[GEOPDBounds readAll:]((uint64_t)v4, 1);
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 4))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
      goto LABEL_18;
    }
  }
  displayMapRegion = self->_displayMapRegion;
  if ((unint64_t)displayMapRegion | *((void *)v4 + 3))
  {
    if (!-[GEOMapRegion isEqual:](displayMapRegion, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_minZoom != *((float *)v4 + 16)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_maxZoom != *((float *)v4 + 15)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_18;
  }
  viewportFrame = self->_viewportFrame;
  if ((unint64_t)viewportFrame | *((void *)v4 + 5)) {
    char v8 = -[GEOPDViewportFrame isEqual:](viewportFrame, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_885;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_886;
      }
      GEOPDBoundsReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDBoundsCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __55__GEOPDBounds_PlaceDataExtras__boundsInfoForPlaceData___block_invoke_2(uint64_t a1, id *a2, BOOL *a3)
{
  -[GEOPDComponentValue spatialLookupResult](a2);
  id v5 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = -[GEOPDSpatialLookupResult bounds](v5);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (GEOPDBounds)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDBounds;
  id v3 = [(GEOPDBounds *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setMapRegion:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 68) |= 0x10u;
  *(unsigned char *)(a1 + 68) |= 0x40u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setDisplayMapRegion:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 68) |= 8u;
  *(unsigned char *)(a1 + 68) |= 0x40u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)_readViewportFrame
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBoundsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportFrame_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)viewportFrame
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDBounds _readViewportFrame]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setViewportFrame:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 68) |= 0x20u;
  *(unsigned char *)(a1 + 68) |= 0x40u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDBounds;
  id v4 = [(GEOPDBounds *)&v8 description];
  id v5 = [(GEOPDBounds *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBounds _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDBounds readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDBounds mapRegion]((id *)a1);
    uint64_t v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"mapRegion";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"map_region";
      }
      [v4 setObject:v7 forKey:v8];
    }
    id v9 = -[GEOPDBounds displayMapRegion]((id *)a1);
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        id v11 = [v9 jsonRepresentation];
        v12 = @"displayMapRegion";
      }
      else
      {
        id v11 = [v9 dictionaryRepresentation];
        v12 = @"display_map_region";
      }
      [v4 setObject:v11 forKey:v12];
    }
    char v14 = *(unsigned char *)(a1 + 68);
    if ((v14 & 2) != 0)
    {
      LODWORD(v13) = *(_DWORD *)(a1 + 64);
      v15 = [NSNumber numberWithFloat:v13];
      if (a2) {
        v16 = @"minZoom";
      }
      else {
        v16 = @"min_zoom";
      }
      [v4 setObject:v15 forKey:v16];

      char v14 = *(unsigned char *)(a1 + 68);
    }
    if (v14)
    {
      LODWORD(v13) = *(_DWORD *)(a1 + 60);
      v17 = [NSNumber numberWithFloat:v13];
      if (a2) {
        v18 = @"maxZoom";
      }
      else {
        v18 = @"max_zoom";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = -[GEOPDBounds viewportFrame]((id *)a1);
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"viewportFrame";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"viewport_frame";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = *(void **)(a1 + 16);
    if (v23)
    {
      v24 = [v23 dictionaryRepresentation];
      v25 = v24;
      if (a2)
      {
        v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __41__GEOPDBounds__dictionaryRepresentation___block_invoke;
        v30[3] = &unk_1E53D8860;
        id v27 = v26;
        id v31 = v27;
        [v25 enumerateKeysAndObjectsUsingBlock:v30];
        id v28 = v27;

        v25 = v28;
      }
      [v4 setObject:v25 forKey:@"Unknown Fields"];
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
  return -[GEOPDBounds _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOPDBounds__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      objc_super v7 = @"mapRegion";
    }
    else {
      objc_super v7 = @"map_region";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [GEOMapRegion alloc];
      if (a3) {
        id v10 = [(GEOMapRegion *)v9 initWithJSON:v8];
      }
      else {
        id v10 = [(GEOMapRegion *)v9 initWithDictionary:v8];
      }
      id v11 = v10;
      -[GEOPDBounds setMapRegion:](v6, v10);
    }
    if (a3) {
      v12 = @"displayMapRegion";
    }
    else {
      v12 = @"display_map_region";
    }
    double v13 = [v5 objectForKeyedSubscript:v12];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v14 = [GEOMapRegion alloc];
      if (a3) {
        v15 = [(GEOMapRegion *)v14 initWithJSON:v13];
      }
      else {
        v15 = [(GEOMapRegion *)v14 initWithDictionary:v13];
      }
      v16 = v15;
      -[GEOPDBounds setDisplayMapRegion:](v6, v15);
    }
    if (a3) {
      v17 = @"minZoom";
    }
    else {
      v17 = @"min_zoom";
    }
    v18 = [v5 objectForKeyedSubscript:v17];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v18 floatValue];
      *(unsigned char *)(v6 + 68) |= 0x40u;
      *(unsigned char *)(v6 + 68) |= 2u;
      *(_DWORD *)(v6 + 64) = v19;
    }

    if (a3) {
      v20 = @"maxZoom";
    }
    else {
      v20 = @"max_zoom";
    }
    v21 = [v5 objectForKeyedSubscript:v20];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v21 floatValue];
      *(unsigned char *)(v6 + 68) |= 0x40u;
      *(unsigned char *)(v6 + 68) |= 1u;
      *(_DWORD *)(v6 + 60) = v22;
    }

    if (a3) {
      v23 = @"viewportFrame";
    }
    else {
      v23 = @"viewport_frame";
    }
    v24 = [v5 objectForKeyedSubscript:v23];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [GEOPDViewportFrame alloc];
      if (v25)
      {
        id v26 = v24;
        v25 = [(GEOPDViewportFrame *)v25 init];
        if (v25)
        {
          if (a3) {
            id v27 = @"targetPoint";
          }
          else {
            id v27 = @"target_point";
          }
          id v28 = [v26 objectForKeyedSubscript:v27];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v29 = [GEOPDGeographicCoordinate alloc];
            if (a3) {
              v30 = [(GEOPDGeographicCoordinate *)v29 initWithJSON:v28];
            }
            else {
              v30 = [(GEOPDGeographicCoordinate *)v29 initWithDictionary:v28];
            }
            id v31 = v30;
            -[GEOPDViewportFrame setTargetPoint:]((uint64_t)v25, v30);
          }
          v32 = [v26 objectForKeyedSubscript:@"heading"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v32 floatValue];
            *(unsigned char *)&v25->_flags |= 0x40u;
            *(unsigned char *)&v25->_flags |= 2u;
            v25->_heading = v33;
          }

          v34 = [v26 objectForKeyedSubscript:@"pitch"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v34 floatValue];
            *(unsigned char *)&v25->_flags |= 0x40u;
            *(unsigned char *)&v25->_flags |= 4u;
            v25->_pitch = v35;
          }

          v36 = [v26 objectForKeyedSubscript:@"distance"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v36 floatValue];
            *(unsigned char *)&v25->_flags |= 0x40u;
            *(unsigned char *)&v25->_flags |= 1u;
            v25->_distance = v37;
          }

          if (a3) {
            v38 = @"viewTargetBounds";
          }
          else {
            v38 = @"view_target_bounds";
          }
          v39 = [v26 objectForKeyedSubscript:v38];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v40 = [GEOPDBoundingCube alloc];
            if (v40)
            {
              id v41 = v39;
              v40 = [(GEOPDBoundingCube *)v40 init];
              if (v40)
              {
                v51 = v41;
                v42 = [v41 objectForKeyedSubscript:@"min"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v43 = [GEOPDGeographicCoordinate alloc];
                  if (a3) {
                    v44 = [(GEOPDGeographicCoordinate *)v43 initWithJSON:v42];
                  }
                  else {
                    v44 = [(GEOPDGeographicCoordinate *)v43 initWithDictionary:v42];
                  }
                  v45 = v44;
                  -[GEOPDBoundingCube setMin:]((uint64_t)v40, v44);
                }
                v46 = [v51 objectForKeyedSubscript:@"max"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v47 = [GEOPDGeographicCoordinate alloc];
                  if (a3) {
                    v48 = [(GEOPDGeographicCoordinate *)v47 initWithJSON:v46];
                  }
                  else {
                    v48 = [(GEOPDGeographicCoordinate *)v47 initWithDictionary:v46];
                  }
                  v49 = v48;
                  -[GEOPDBoundingCube setMax:]((uint64_t)v40, v48);
                }
                id v41 = v51;
              }
            }
            -[GEOPDViewportFrame setViewTargetBounds:]((uint64_t)v25, v40);
          }
        }
      }
      -[GEOPDBounds setViewportFrame:](v6, v25);
    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDBoundsReadAllFrom((uint64_t)self, a3, 0);
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDBounds _readDisplayMapRegion](result);
    if ([*(id *)(v3 + 24) hasGreenTeaWithValue:a2])
    {
      return 1;
    }
    else
    {
      -[GEOPDBounds _readMapRegion](v3);
      id v4 = *(void **)(v3 + 32);
      return [v4 hasGreenTeaWithValue:a2];
    }
  }
  return result;
}

- (unint64_t)hash
{
  -[GEOPDBounds readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOMapRegion *)self->_mapRegion hash];
  unint64_t v4 = [(GEOMapRegion *)self->_displayMapRegion hash];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    float minZoom = self->_minZoom;
    double v8 = minZoom;
    if (minZoom < 0.0) {
      double v8 = -minZoom;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if (flags)
  {
    float maxZoom = self->_maxZoom;
    double v13 = maxZoom;
    if (maxZoom < 0.0) {
      double v13 = -maxZoom;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ [(GEOPDViewportFrame *)self->_viewportFrame hash];
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 4u;
    *(unsigned char *)(a1 + 68) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDBounds readAll:](a1, 0);
    [*(id *)(a1 + 32) clearUnknownFields:1];
    [*(id *)(a1 + 24) clearUnknownFields:1];
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(v3 + 64) |= 8u;
      *(unsigned char *)(v3 + 64) |= 0x40u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 48));
      unint64_t v4 = *(void **)(v3 + 16);
      *(void *)(v3 + 16) = 0;

      -[GEOPDViewportFrame readAll:](v3, 0);
      uint64_t v5 = *(void *)(v3 + 32);
      if (v5)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v5 + 52) |= 1u;
        *(unsigned char *)(v5 + 52) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 48));
        unint64_t v6 = *(void **)(v5 + 16);
        *(void *)(v5 + 16) = 0;

        -[GEOPDBoundingCube readAll:](v5, 0);
      }
    }
  }
}

@end