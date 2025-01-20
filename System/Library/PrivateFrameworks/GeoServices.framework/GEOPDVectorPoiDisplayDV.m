@interface GEOPDVectorPoiDisplayDV
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDVectorPoiDisplayDV)init;
- (GEOPDVectorPoiDisplayDV)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDVectorPoiDisplayDV

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  -[GEOPDVectorPoiDisplayDV readAll:]((uint64_t)self, 1);
  -[GEOPDVectorPoiDisplayDV readAll:]((uint64_t)v4, 1);
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 46);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_poiClass != *((_DWORD *)v4 + 20)) {
      goto LABEL_30;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_30;
  }
  classZoom = self->_classZoom;
  if ((unint64_t)classZoom | *((void *)v4 + 5))
  {
    if (!-[GEOPDZoomInfo isEqual:](classZoom, "isEqual:")) {
      goto LABEL_30;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v6 = *((_WORD *)v4 + 46);
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_containmentClass != *((_DWORD *)v4 + 19)) {
      goto LABEL_30;
    }
  }
  else if (v6)
  {
    goto LABEL_30;
  }
  containmentZoom = self->_containmentZoom;
  if ((unint64_t)containmentZoom | *((void *)v4 + 6)
    && !-[GEOPDZoomInfo isEqual:](containmentZoom, "isEqual:"))
  {
    goto LABEL_30;
  }
  customLandmark = self->_customLandmark;
  if ((unint64_t)customLandmark | *((void *)v4 + 7))
  {
    if (!-[GEOPDCustomLandmark isEqual:](customLandmark, "isEqual:")) {
      goto LABEL_30;
    }
  }
  classZoomDriving = self->_classZoomDriving;
  if ((unint64_t)classZoomDriving | *((void *)v4 + 3))
  {
    if (!-[GEOPDZoomInfo isEqual:](classZoomDriving, "isEqual:")) {
      goto LABEL_30;
    }
  }
  classZoomNavigation = self->_classZoomNavigation;
  if ((unint64_t)classZoomNavigation | *((void *)v4 + 4))
  {
    if (!-[GEOPDZoomInfo isEqual:](classZoomNavigation, "isEqual:")) {
      goto LABEL_30;
    }
  }
  __int16 v12 = (__int16)self->_flags;
  __int16 v13 = *((_WORD *)v4 + 46);
  if ((v12 & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_treeDisplayType != *((_DWORD *)v4 + 21)) {
      goto LABEL_30;
    }
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_30;
  }
  BOOL v14 = (v13 & 8) == 0;
  if ((v12 & 8) != 0)
  {
    if ((v13 & 8) != 0)
    {
      if (self->_inMiniPoiMarket)
      {
        if (!*((unsigned char *)v4 + 88)) {
          goto LABEL_30;
        }
      }
      else if (*((unsigned char *)v4 + 88))
      {
        goto LABEL_30;
      }
      BOOL v14 = 1;
      goto LABEL_31;
    }
LABEL_30:
    BOOL v14 = 0;
  }
LABEL_31:

  return v14;
}

- (GEOPDVectorPoiDisplayDV)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDVectorPoiDisplayDV;
  v2 = [(GEOPDVectorPoiDisplayDV *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDVectorPoiDisplayDV)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDVectorPoiDisplayDV;
  v3 = [(GEOPDVectorPoiDisplayDV *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDVectorPoiDisplayDV;
  id v4 = [(GEOPDVectorPoiDisplayDV *)&v8 description];
  v5 = [(GEOPDVectorPoiDisplayDV *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDVectorPoiDisplayDV _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDVectorPoiDisplayDV readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(_WORD *)(a1 + 92) & 2) != 0)
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 80)];
      if (a2) {
        objc_super v6 = @"poiClass";
      }
      else {
        objc_super v6 = @"poi_class";
      }
      [v4 setObject:v5 forKey:v6];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      objc_super v7 = *(void **)(a1 + 8);
      if (v7)
      {
        id v8 = v7;
        objc_sync_enter(v8);
        GEOPDVectorPoiDisplayDVReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClassZoom_tags);
        objc_sync_exit(v8);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v9 = *(id *)(a1 + 40);
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        __int16 v12 = @"classZoom";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        __int16 v12 = @"class_zoom";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if (*(_WORD *)(a1 + 92))
    {
      __int16 v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
      if (a2) {
        BOOL v14 = @"containmentClass";
      }
      else {
        BOOL v14 = @"containment_class";
      }
      [v4 setObject:v13 forKey:v14];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v15 = *(void **)(a1 + 8);
      if (v15)
      {
        id v16 = v15;
        objc_sync_enter(v16);
        GEOPDVectorPoiDisplayDVReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContainmentZoom_tags);
        objc_sync_exit(v16);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v17 = *(id *)(a1 + 48);
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"containmentZoom";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"containment_zoom";
      }
      [v4 setObject:v19 forKey:v20];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 92) & 0x200) == 0)
    {
      v21 = *(void **)(a1 + 8);
      if (v21)
      {
        id v22 = v21;
        objc_sync_enter(v22);
        GEOPDVectorPoiDisplayDVReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCustomLandmark_tags);
        objc_sync_exit(v22);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v23 = *(id *)(a1 + 56);
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"customLandmark";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"custom_landmark";
      }
      [v4 setObject:v25 forKey:v26];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v27 = *(void **)(a1 + 8);
      if (v27)
      {
        id v28 = v27;
        objc_sync_enter(v28);
        GEOPDVectorPoiDisplayDVReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClassZoomDriving_tags);
        objc_sync_exit(v28);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v29 = *(id *)(a1 + 24);
    v30 = v29;
    if (v29)
    {
      if (a2)
      {
        v31 = [v29 jsonRepresentation];
        v32 = @"classZoomDriving";
      }
      else
      {
        v31 = [v29 dictionaryRepresentation];
        v32 = @"class_zoom_driving";
      }
      [v4 setObject:v31 forKey:v32];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v33 = *(void **)(a1 + 8);
      if (v33)
      {
        id v34 = v33;
        objc_sync_enter(v34);
        GEOPDVectorPoiDisplayDVReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClassZoomNavigation_tags);
        objc_sync_exit(v34);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v35 = *(id *)(a1 + 32);
    v36 = v35;
    if (v35)
    {
      if (a2)
      {
        v37 = [v35 jsonRepresentation];
        v38 = @"classZoomNavigation";
      }
      else
      {
        v37 = [v35 dictionaryRepresentation];
        v38 = @"class_zoom_navigation";
      }
      [v4 setObject:v37 forKey:v38];
    }
    __int16 v39 = *(_WORD *)(a1 + 92);
    if ((v39 & 4) != 0)
    {
      uint64_t v40 = *(int *)(a1 + 84);
      if (v40 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v41 = off_1E53DD1E8[v40];
      }
      if (a2) {
        v42 = @"treeDisplayType";
      }
      else {
        v42 = @"tree_display_type";
      }
      [v4 setObject:v41 forKey:v42];

      __int16 v39 = *(_WORD *)(a1 + 92);
    }
    if ((v39 & 8) != 0)
    {
      v43 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 88)];
      if (a2) {
        v44 = @"inMiniPoiMarket";
      }
      else {
        v44 = @"in_mini_poi_market";
      }
      [v4 setObject:v43 forKey:v44];
    }
    v45 = *(void **)(a1 + 16);
    if (v45)
    {
      v46 = [v45 dictionaryRepresentation];
      v47 = v46;
      if (a2)
      {
        v48 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v46, "count"));
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __53__GEOPDVectorPoiDisplayDV__dictionaryRepresentation___block_invoke;
        v52[3] = &unk_1E53D8860;
        id v49 = v48;
        id v53 = v49;
        [v47 enumerateKeysAndObjectsUsingBlock:v52];
        id v50 = v49;

        v47 = v50;
      }
      [v4 setObject:v47 forKey:@"Unknown Fields"];
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
  return -[GEOPDVectorPoiDisplayDV _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_7400;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_7401;
      }
      GEOPDVectorPoiDisplayDVReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __53__GEOPDVectorPoiDisplayDV__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDVectorPoiDisplayDVReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x7E0) == 0))
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
    -[GEOPDVectorPoiDisplayDV readAll:]((uint64_t)self, 0);
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    id v5 = v9;
    if (self->_classZoom)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (*(_WORD *)&self->_flags)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v9;
    }
    if (self->_containmentZoom)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_customLandmark)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_classZoomDriving)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_classZoomNavigation)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
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
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDVectorPoiDisplayDVReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVectorPoiDisplayDV readAll:]((uint64_t)self, 0);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_poiClass;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  id v9 = [(GEOPDZoomInfo *)self->_classZoom copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 76) = self->_containmentClass;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  id v11 = [(GEOPDZoomInfo *)self->_containmentZoom copyWithZone:a3];
  __int16 v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  id v13 = [(GEOPDCustomLandmark *)self->_customLandmark copyWithZone:a3];
  BOOL v14 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v13;

  id v15 = [(GEOPDZoomInfo *)self->_classZoomDriving copyWithZone:a3];
  id v16 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v15;

  id v17 = [(GEOPDZoomInfo *)self->_classZoomNavigation copyWithZone:a3];
  v18 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v17;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_treeDisplayType;
    *(_WORD *)(v5 + 92) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *(unsigned char *)(v5 + 88) = self->_inMiniPoiMarket;
    *(_WORD *)(v5 + 92) |= 8u;
  }
  v20 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v20;
LABEL_14:

  return (id)v5;
}

- (unint64_t)hash
{
  -[GEOPDVectorPoiDisplayDV readAll:]((uint64_t)self, 1);
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_poiClass;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDZoomInfo *)self->_classZoom hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_containmentClass;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(GEOPDZoomInfo *)self->_containmentZoom hash];
  unint64_t v7 = [(GEOPDCustomLandmark *)self->_customLandmark hash];
  unint64_t v8 = [(GEOPDZoomInfo *)self->_classZoomDriving hash];
  unint64_t v9 = [(GEOPDZoomInfo *)self->_classZoomNavigation hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v11 = 2654435761 * self->_treeDisplayType;
    if ((flags & 8) != 0) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((flags & 8) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v12 = 2654435761 * self->_inMiniPoiMarket;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLandmark, 0);
  objc_storeStrong((id *)&self->_containmentZoom, 0);
  objc_storeStrong((id *)&self->_classZoom, 0);
  objc_storeStrong((id *)&self->_classZoomNavigation, 0);
  objc_storeStrong((id *)&self->_classZoomDriving, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end