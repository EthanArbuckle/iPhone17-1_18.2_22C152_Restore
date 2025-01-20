@interface GEOMapQuery
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapQuery)init;
- (GEOMapQuery)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)placeSearchRequest;
- (id)userLocation;
- (unint64_t)hash;
- (void)_readMapRegion;
- (void)_readPlaceSearchRequest;
- (void)_readUserLocation;
- (void)readAll:(uint64_t)a1;
- (void)setPlaceSearchRequest:(uint64_t)a1;
- (void)setUserLocation:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapQuery

- (GEOMapQuery)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapQuery;
  v2 = [(GEOMapQuery *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapQuery)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapQuery;
  v3 = [(GEOMapQuery *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMapRegion
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 121) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOMapQueryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_4);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)_readUserLocation
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 121) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOMapQueryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserLocation_tags_1);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (id)userLocation
{
  if (a1)
  {
    v2 = a1;
    -[GEOMapQuery _readUserLocation]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setUserLocation:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 120) |= 0x8000u;
  *(_DWORD *)(a1 + 120) |= 0x10000u;
  objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)_readPlaceSearchRequest
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 121) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOMapQueryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceSearchRequest_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (id)placeSearchRequest
{
  if (a1)
  {
    v2 = a1;
    -[GEOMapQuery _readPlaceSearchRequest]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPlaceSearchRequest:(uint64_t)a1
{
  id v4 = a2;
  *(_DWORD *)(a1 + 120) |= 0x2000u;
  *(_DWORD *)(a1 + 120) |= 0x10000u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapQuery;
  id v4 = [(GEOMapQuery *)&v8 description];
  v5 = [(GEOMapQuery *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapQuery _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_40;
  }
  -[GEOMapQuery readAll:](a1, 1);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 121) & 0x40) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      id v6 = v5;
      objc_sync_enter(v6);
      GEOMapQueryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuery_tags_2);
      objc_sync_exit(v6);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  id v7 = *(id *)(a1 + 48);
  if (v7) {
    [v4 setObject:v7 forKey:@"query"];
  }

  int v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 0x100) != 0)
  {
    int v12 = *(_DWORD *)(a1 + 104);
    if (v12 == 1)
    {
      v13 = @"SEARCH_REQUEST_TYPE";
    }
    else if (v12 == 2)
    {
      v13 = @"GEOCODE_REQUEST_TYPE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 104));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v4 setObject:v13 forKey:@"requestType"];

    int v8 = *(_DWORD *)(a1 + 120);
    if ((v8 & 0x10) == 0)
    {
LABEL_9:
      if ((v8 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_47;
    }
  }
  else if ((v8 & 0x10) == 0)
  {
    goto LABEL_9;
  }
  v23 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
  [v4 setObject:v23 forKey:@"mapCenterX"];

  int v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 0x20) == 0)
  {
LABEL_10:
    if ((v8 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  v24 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 92)];
  [v4 setObject:v24 forKey:@"mapCenterY"];

  int v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 0x40) == 0)
  {
LABEL_11:
    if ((v8 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  v25 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
  [v4 setObject:v25 forKey:@"mapSpanX"];

  int v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 0x80) == 0)
  {
LABEL_12:
    if ((v8 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  v26 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 100)];
  [v4 setObject:v26 forKey:@"mapSpanY"];

  int v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 0x800) == 0)
  {
LABEL_13:
    if ((v8 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  v27 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 116)];
  [v4 setObject:v27 forKey:@"zoomlevel"];

  int v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 2) == 0)
  {
LABEL_14:
    if ((v8 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_55;
  }
LABEL_51:
  uint64_t v28 = *(int *)(a1 + 76);
  if (v28 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = off_1E53E4D60[v28];
  }
  [v4 setObject:v29 forKey:@"clientImgFmt"];

  int v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 0x200) == 0)
  {
LABEL_15:
    if ((v8 & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_56;
  }
LABEL_55:
  v30 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 108)];
  [v4 setObject:v30 forKey:@"tilesizeX"];

  int v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 0x400) == 0)
  {
LABEL_16:
    if ((v8 & 8) == 0) {
      goto LABEL_17;
    }
LABEL_57:
    v32 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
    [v4 setObject:v32 forKey:@"clientImgMaxWidth"];

    if ((*(_DWORD *)(a1 + 120) & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_56:
  v31 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 112)];
  [v4 setObject:v31 forKey:@"tilesizeY"];

  int v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 8) != 0) {
    goto LABEL_57;
  }
LABEL_17:
  if ((v8 & 4) != 0)
  {
LABEL_18:
    v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
    [v4 setObject:v9 forKey:@"clientImgMaxHeight"];
  }
LABEL_19:
  -[GEOMapQuery _readMapRegion](a1);
  id v10 = *(id *)(a1 + 32);
  v11 = v10;
  if (v10)
  {
    if (a2) {
      [v10 jsonRepresentation];
    }
    else {
    v14 = [v10 dictionaryRepresentation];
    }
    [v4 setObject:v14 forKey:@"mapRegion"];
  }
  v15 = -[GEOMapQuery userLocation]((id *)a1);
  v16 = v15;
  if (v15)
  {
    if (a2) {
      [v15 jsonRepresentation];
    }
    else {
    v17 = [v15 dictionaryRepresentation];
    }
    [v4 setObject:v17 forKey:@"userLocation"];
  }
  if (*(unsigned char *)(a1 + 120))
  {
    v18 = _GEOSessionIDDictionaryRepresentation((void *)(a1 + 16));
    [v4 setObject:v18 forKey:@"sessionID"];
  }
  v19 = -[GEOMapQuery placeSearchRequest]((id *)a1);
  v20 = v19;
  if (v19)
  {
    if (a2) {
      [v19 jsonRepresentation];
    }
    else {
    v21 = [v19 dictionaryRepresentation];
    }
    [v4 setObject:v21 forKey:@"placeSearchRequest"];
  }
LABEL_40:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapQuery _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_39;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_39;
      }
      GEOMapQueryReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      [*(id *)(a1 + 32) readAll:1];
      [*(id *)(a1 + 56) readAll:1];
      [*(id *)(a1 + 40) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapQueryReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    $D9FAB42B35A4C93C96F7009395098545 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x15000) == 0)
    {
      if ((*(_WORD *)&flags & 0x8000) != 0)
      {
        if (GEOLocationIsDirty((os_unfair_lock_s *)self->_userLocation)) {
          goto LABEL_3;
        }
        $D9FAB42B35A4C93C96F7009395098545 flags = self->_flags;
      }
      if ((*(_WORD *)&flags & 0x2000) == 0
        || (GEOPlaceSearchRequestIsDirty((os_unfair_lock_s *)self->_placeSearchRequest) & 1) == 0)
      {
        int v8 = self->_reader;
        objc_sync_enter(v8);
        *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
        [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
        v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
        [v4 writeData:v9];
        os_unfair_lock_unlock(p_readerLock);

        objc_sync_exit(v8);
        goto LABEL_25;
      }
    }
  }
LABEL_3:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOMapQuery readAll:]((uint64_t)self, 0);
  if (self->_query) {
    PBDataWriterWriteStringField();
  }
  $D9FAB42B35A4C93C96F7009395098545 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    $D9FAB42B35A4C93C96F7009395098545 v7 = self->_flags;
    if ((*(unsigned char *)&v7 & 0x10) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&v7 & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  $D9FAB42B35A4C93C96F7009395098545 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&v7 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  $D9FAB42B35A4C93C96F7009395098545 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&v7 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  $D9FAB42B35A4C93C96F7009395098545 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v7 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  $D9FAB42B35A4C93C96F7009395098545 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&v7 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  $D9FAB42B35A4C93C96F7009395098545 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 2) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v7 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  $D9FAB42B35A4C93C96F7009395098545 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v7 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  $D9FAB42B35A4C93C96F7009395098545 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v7 & 8) == 0) {
      goto LABEL_15;
    }
LABEL_35:
    PBDataWriterWriteInt32Field();
    if ((*(_DWORD *)&self->_flags & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  $D9FAB42B35A4C93C96F7009395098545 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 8) != 0) {
    goto LABEL_35;
  }
LABEL_15:
  if ((*(unsigned char *)&v7 & 4) != 0) {
LABEL_16:
  }
    PBDataWriterWriteInt32Field();
LABEL_17:
  if (self->_mapRegion) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_userLocation) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterPlaceMark();
    PBDataWriterWriteUint64Field();
    PBDataWriterWriteUint64Field();
    PBDataWriterRecallMark();
  }
  if (self->_placeSearchRequest) {
    PBDataWriterWriteSubmessage();
  }
LABEL_25:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    $D9FAB42B35A4C93C96F7009395098545 v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 1) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOMapQueryReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_20;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOMapQuery readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_query copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  $D9FAB42B35A4C93C96F7009395098545 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_requestType;
    *(_DWORD *)(v5 + 120) |= 0x100u;
    $D9FAB42B35A4C93C96F7009395098545 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x10) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&flags & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 88) = self->_mapCenterX;
  *(_DWORD *)(v5 + 120) |= 0x10u;
  $D9FAB42B35A4C93C96F7009395098545 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 92) = self->_mapCenterY;
  *(_DWORD *)(v5 + 120) |= 0x20u;
  $D9FAB42B35A4C93C96F7009395098545 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 96) = self->_mapSpanX;
  *(_DWORD *)(v5 + 120) |= 0x40u;
  $D9FAB42B35A4C93C96F7009395098545 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 100) = self->_mapSpanY;
  *(_DWORD *)(v5 + 120) |= 0x80u;
  $D9FAB42B35A4C93C96F7009395098545 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 116) = self->_zoomlevel;
  *(_DWORD *)(v5 + 120) |= 0x800u;
  $D9FAB42B35A4C93C96F7009395098545 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 76) = self->_clientImgFmt;
  *(_DWORD *)(v5 + 120) |= 2u;
  $D9FAB42B35A4C93C96F7009395098545 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 108) = self->_tilesizeX;
  *(_DWORD *)(v5 + 120) |= 0x200u;
  $D9FAB42B35A4C93C96F7009395098545 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_15;
    }
LABEL_30:
    *(_DWORD *)(v5 + 84) = self->_clientImgMaxWidth;
    *(_DWORD *)(v5 + 120) |= 8u;
    if ((*(_DWORD *)&self->_flags & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_29:
  *(_DWORD *)(v5 + 112) = self->_tilesizeY;
  *(_DWORD *)(v5 + 120) |= 0x400u;
  $D9FAB42B35A4C93C96F7009395098545 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0) {
    goto LABEL_30;
  }
LABEL_15:
  if ((*(unsigned char *)&flags & 4) != 0)
  {
LABEL_16:
    *(_DWORD *)(v5 + 80) = self->_clientImgMaxHeight;
    *(_DWORD *)(v5 + 120) |= 4u;
  }
LABEL_17:
  id v12 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  id v14 = [(GEOLocation *)self->_userLocation copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  if (*(unsigned char *)&self->_flags)
  {
    *(GEOSessionID *)(v5 + 16) = self->_sessionID;
    *(_DWORD *)(v5 + 120) |= 1u;
  }
  id v16 = [(GEOPlaceSearchRequest *)self->_placeSearchRequest copyWithZone:a3];
  id v8 = *(id *)(v5 + 40);
  *(void *)(v5 + 40) = v16;
LABEL_20:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_71;
  }
  -[GEOMapQuery readAll:]((uint64_t)self, 1);
  -[GEOMapQuery readAll:]((uint64_t)v4, 1);
  query = self->_query;
  if ((unint64_t)query | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](query, "isEqual:")) {
      goto LABEL_71;
    }
  }
  $D9FAB42B35A4C93C96F7009395098545 flags = self->_flags;
  int v7 = *((_DWORD *)v4 + 30);
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_requestType != *((_DWORD *)v4 + 26)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_mapCenterX != *((_DWORD *)v4 + 22)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_mapCenterY != *((_DWORD *)v4 + 23)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_mapSpanX != *((_DWORD *)v4 + 24)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_mapSpanY != *((_DWORD *)v4 + 25)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_zoomlevel != *((_DWORD *)v4 + 29)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_clientImgFmt != *((_DWORD *)v4 + 19)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_tilesizeX != *((_DWORD *)v4 + 27)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_tilesizeY != *((_DWORD *)v4 + 28)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_clientImgMaxWidth != *((_DWORD *)v4 + 21)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_71;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_clientImgMaxHeight != *((_DWORD *)v4 + 20)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_71;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 4) && !-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
    goto LABEL_71;
  }
  userLocation = self->_userLocation;
  if ((unint64_t)userLocation | *((void *)v4 + 7))
  {
    if (!-[GEOLocation isEqual:](userLocation, "isEqual:")) {
      goto LABEL_71;
    }
  }
  int v10 = *((_DWORD *)v4 + 30);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v10 & 1) == 0) {
      goto LABEL_71;
    }
    if (self->_sessionID._high != *((void *)v4 + 2) || self->_sessionID._low != *((void *)v4 + 3)) {
      goto LABEL_71;
    }
  }
  else if (v10)
  {
LABEL_71:
    char v12 = 0;
    goto LABEL_72;
  }
  placeSearchRequest = self->_placeSearchRequest;
  if ((unint64_t)placeSearchRequest | *((void *)v4 + 5)) {
    char v12 = -[GEOPlaceSearchRequest isEqual:](placeSearchRequest, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_72:

  return v12;
}

- (unint64_t)hash
{
  -[GEOMapQuery readAll:]((uint64_t)self, 1);
  NSUInteger v20 = [(NSString *)self->_query hash];
  $D9FAB42B35A4C93C96F7009395098545 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    uint64_t v19 = 2654435761 * self->_requestType;
    if ((*(unsigned char *)&flags & 0x10) != 0)
    {
LABEL_3:
      uint64_t v18 = 2654435761 * self->_mapCenterX;
      if ((*(unsigned char *)&flags & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = 0;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
LABEL_4:
    uint64_t v17 = 2654435761 * self->_mapCenterY;
    if ((*(unsigned char *)&flags & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v17 = 0;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
LABEL_5:
    uint64_t v16 = 2654435761 * self->_mapSpanX;
    if ((*(unsigned char *)&flags & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v16 = 0;
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
LABEL_6:
    uint64_t v14 = 2654435761 * self->_mapSpanY;
    if ((*(_WORD *)&flags & 0x800) != 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v14 = 0;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
LABEL_7:
    uint64_t v4 = 2654435761 * self->_zoomlevel;
    if ((*(unsigned char *)&flags & 2) != 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
LABEL_8:
    uint64_t v5 = 2654435761 * self->_clientImgFmt;
    if ((*(_WORD *)&flags & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v5 = 0;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
LABEL_9:
    uint64_t v6 = 2654435761 * self->_tilesizeX;
    if ((*(_WORD *)&flags & 0x400) != 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v6 = 0;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
LABEL_10:
    uint64_t v7 = 2654435761 * self->_tilesizeY;
    if ((*(unsigned char *)&flags & 8) != 0) {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_21:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&flags & 8) == 0) {
    goto LABEL_22;
  }
LABEL_11:
  uint64_t v8 = 2654435761 * self->_clientImgMaxWidth;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
LABEL_12:
    uint64_t v9 = 2654435761 * self->_clientImgMaxHeight;
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v9 = 0;
LABEL_24:
  unint64_t v10 = [(GEOMapRegion *)self->_mapRegion hash];
  unint64_t v11 = [(GEOLocation *)self->_userLocation hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v12 = PBHashBytes();
  }
  else {
    uint64_t v12 = 0;
  }
  return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(GEOPlaceSearchRequest *)self->_placeSearchRequest hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_placeSearchRequest, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end