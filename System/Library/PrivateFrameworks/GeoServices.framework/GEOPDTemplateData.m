@interface GEOPDTemplateData
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTemplateData)init;
- (GEOPDTemplateData)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)footer;
- (id)jsonRepresentation;
- (id)mapsId;
- (id)photo;
- (id)placeName;
- (id)poiIcon;
- (id)subtitle;
- (id)timezone;
- (id)titles;
- (unint64_t)hash;
- (void)_addNoFlagsTitle:(uint64_t)a1;
- (void)_readFooter;
- (void)_readMapsId;
- (void)_readPhoto;
- (void)_readPoiIcon;
- (void)_readSubtitle;
- (void)_readTimezone;
- (void)_readTitles;
- (void)addTitle:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setMapsId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTemplateData

- (id)mapsId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTemplateData _readMapsId]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readMapsId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplateDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsId_tags_8792);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)timezone
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTemplateData _readTimezone]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setMapsId:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 8u;
    *(_WORD *)(a1 + 96) |= 0x200u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (GEOPDTemplateData)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTemplateData;
  v2 = [(GEOPDTemplateData *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void)_readTimezone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplateDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimezone_tags_8795);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_poiIcon, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)placeName
{
  v2 = -[GEOPDTemplateData titles]((id *)&self->super.super.isa);
  id v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (GEOPDTemplateData)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTemplateData;
  id v3 = [(GEOPDTemplateData *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTitles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplateDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitles_tags_8793);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)titles
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTemplateData _readTitles]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addTitle:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTemplateData _readTitles](a1);
    -[GEOPDTemplateData _addNoFlagsTitle:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_addNoFlagsTitle:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readSubtitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplateDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubtitle_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)subtitle
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTemplateData _readSubtitle]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPoiIcon
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplateDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiIcon_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)poiIcon
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTemplateData _readPoiIcon]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPhoto
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplateDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoto_tags_8794);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)photo
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTemplateData _readPhoto]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readFooter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplateDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFooter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)footer
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTemplateData _readFooter]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTemplateData;
  id v4 = [(GEOPDTemplateData *)&v8 description];
  id v5 = [(GEOPDTemplateData *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTemplateData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDTemplateData readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDTemplateData mapsId]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"mapsId";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"maps_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(_WORD *)(a1 + 96))
    {
      v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 92)];
      if (a2) {
        v10 = @"areaHighlight";
      }
      else {
        v10 = @"area_highlight";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if ([*(id *)(a1 + 72) count])
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v12 = *(id *)(a1 + 72);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v45 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            if (a2) {
              [v17 jsonRepresentation];
            }
            else {
            v18 = [v17 dictionaryRepresentation];
            }
            [v11 addObject:v18];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v14);
      }

      [v4 setObject:v11 forKey:@"title"];
    }
    v19 = -[GEOPDTemplateData subtitle]((id *)a1);
    v20 = v19;
    if (v19)
    {
      if (a2) {
        [v19 jsonRepresentation];
      }
      else {
      v21 = [v19 dictionaryRepresentation];
      }
      [v4 setObject:v21 forKey:@"subtitle"];
    }
    v22 = -[GEOPDTemplateData poiIcon]((id *)a1);
    v23 = v22;
    if (v22)
    {
      if (a2)
      {
        v24 = [v22 jsonRepresentation];
        v25 = @"poiIcon";
      }
      else
      {
        v24 = [v22 dictionaryRepresentation];
        v25 = @"poi_icon";
      }
      [v4 setObject:v24 forKey:v25];
    }
    v26 = -[GEOPDTemplateData photo]((id *)a1);
    v27 = v26;
    if (v26)
    {
      if (a2) {
        [v26 jsonRepresentation];
      }
      else {
      v28 = [v26 dictionaryRepresentation];
      }
      [v4 setObject:v28 forKey:@"photo"];
    }
    v29 = -[GEOPDTemplateData footer]((id *)a1);
    v30 = v29;
    if (v29)
    {
      if (a2) {
        [v29 jsonRepresentation];
      }
      else {
      v31 = [v29 dictionaryRepresentation];
      }
      [v4 setObject:v31 forKey:@"footer"];
    }
    v32 = -[GEOPDTemplateData timezone]((id *)a1);
    v33 = v32;
    if (v32)
    {
      if (a2) {
        [v32 jsonRepresentation];
      }
      else {
      v34 = [v32 dictionaryRepresentation];
      }
      [v4 setObject:v34 forKey:@"timezone"];
    }
    v35 = *(void **)(a1 + 16);
    if (v35)
    {
      v36 = [v35 dictionaryRepresentation];
      v37 = v36;
      if (a2)
      {
        v38 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __47__GEOPDTemplateData__dictionaryRepresentation___block_invoke;
        v42[3] = &unk_1E53D8860;
        id v39 = v38;
        id v43 = v39;
        [v37 enumerateKeysAndObjectsUsingBlock:v42];
        id v40 = v39;

        v37 = v40;
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
  return -[GEOPDTemplateData _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_8815;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_8816;
      }
      GEOPDTemplateDataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDTemplateDataCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __47__GEOPDTemplateData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDTemplateDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_3;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x308) != 0) {
    goto LABEL_3;
  }
  if ((flags & 0x40) != 0)
  {
    if (GEOPDDataItemIsDirty((os_unfair_lock_s *)self->_subtitle)) {
      goto LABEL_3;
    }
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 0x20) != 0) {
    goto LABEL_3;
  }
  if ((flags & 0x10) != 0)
  {
    if (GEOPDPhotoIsDirty((uint64_t)self->_photo)) {
      goto LABEL_3;
    }
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 4) == 0) {
    goto LABEL_36;
  }
  if (GEOPDDataItemIsDirty((os_unfair_lock_s *)self->_footer))
  {
LABEL_3:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDTemplateData readAll:]((uint64_t)self, 0);
    if (self->_mapsId) {
      PBDataWriterWriteSubmessage();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = self->_titles;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v8);
    }

    if (self->_subtitle) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_poiIcon) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_photo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_footer) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_timezone) {
      PBDataWriterWriteSubmessage();
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
    goto LABEL_25;
  }
  __int16 flags = (__int16)self->_flags;
LABEL_36:
  if ((flags & 0x80) != 0) {
    goto LABEL_3;
  }
  if ((flags & 0x100) != 0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    obuint64_t j = self->_titles;
    uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(obj);
          }
          if (GEOLocalizedStringIsDirty(*(void *)(*((void *)&v21 + 1) + 8 * j)))
          {

            goto LABEL_3;
          }
        }
        uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  uint64_t v14 = self->_reader;
  objc_sync_enter(v14);
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  uint64_t v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
  [v4 writeData:v15];
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v14);
LABEL_25:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDTemplateDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTemplateData readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDMapsIdentifier *)self->_mapsId copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  if (*(_WORD *)&self->_flags)
  {
    *(unsigned char *)(v5 + 92) = self->_areaHighlight;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v11 = self->_titles;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "copyWithZone:", a3, (void)v28);
        -[GEOPDTemplateData addTitle:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  id v16 = [(GEOPDDataItem *)self->_subtitle copyWithZone:a3];
  long long v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  id v18 = [(GEOStyleAttributes *)self->_poiIcon copyWithZone:a3];
  long long v19 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v18;

  id v20 = [(GEOPDPhoto *)self->_photo copyWithZone:a3];
  long long v21 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v20;

  id v22 = [(GEOPDDataItem *)self->_footer copyWithZone:a3];
  long long v23 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v22;

  id v24 = [(GEOTimezone *)self->_timezone copyWithZone:a3];
  v25 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v24;

  v26 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v26;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  -[GEOPDTemplateData readAll:]((uint64_t)self, 1);
  -[GEOPDTemplateData readAll:]((uint64_t)v4, 1);
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((void *)v4 + 4))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:")) {
      goto LABEL_24;
    }
  }
  __int16 v6 = *((_WORD *)v4 + 48);
  if (*(_WORD *)&self->_flags)
  {
    if (v6)
    {
      if (self->_areaHighlight)
      {
        if (!*((unsigned char *)v4 + 92)) {
          goto LABEL_24;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 92)) {
        goto LABEL_12;
      }
    }
LABEL_24:
    char v13 = 0;
    goto LABEL_25;
  }
  if (v6) {
    goto LABEL_24;
  }
LABEL_12:
  titles = self->_titles;
  if ((unint64_t)titles | *((void *)v4 + 9) && !-[NSMutableArray isEqual:](titles, "isEqual:")) {
    goto LABEL_24;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 7))
  {
    if (!-[GEOPDDataItem isEqual:](subtitle, "isEqual:")) {
      goto LABEL_24;
    }
  }
  poiIcon = self->_poiIcon;
  if ((unint64_t)poiIcon | *((void *)v4 + 6))
  {
    if (!-[GEOStyleAttributes isEqual:](poiIcon, "isEqual:")) {
      goto LABEL_24;
    }
  }
  photo = self->_photo;
  if ((unint64_t)photo | *((void *)v4 + 5))
  {
    if (!-[GEOPDPhoto isEqual:](photo, "isEqual:")) {
      goto LABEL_24;
    }
  }
  footer = self->_footer;
  if ((unint64_t)footer | *((void *)v4 + 3))
  {
    if (!-[GEOPDDataItem isEqual:](footer, "isEqual:")) {
      goto LABEL_24;
    }
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((void *)v4 + 8)) {
    char v13 = -[GEOTimezone isEqual:](timezone, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_25:

  return v13;
}

- (unint64_t)hash
{
  -[GEOPDTemplateData readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDMapsIdentifier *)self->_mapsId hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_areaHighlight;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(NSMutableArray *)self->_titles hash];
  unint64_t v7 = v5 ^ v6 ^ [(GEOPDDataItem *)self->_subtitle hash];
  unint64_t v8 = [(GEOStyleAttributes *)self->_poiIcon hash];
  unint64_t v9 = v8 ^ [(GEOPDPhoto *)self->_photo hash];
  unint64_t v10 = v7 ^ v9 ^ [(GEOPDDataItem *)self->_footer hash];
  return v10 ^ [(GEOTimezone *)self->_timezone hash];
}

@end