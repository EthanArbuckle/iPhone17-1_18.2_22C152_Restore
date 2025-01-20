@interface GEOPDPlaceCollectionItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceCollectionItem)init;
- (GEOPDPlaceCollectionItem)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)appClip;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)itemDescription;
- (id)itemDescriptionHtmls;
- (id)itemDescriptions;
- (id)itemHTMLDescription;
- (id)itemId;
- (id)jsonRepresentation;
- (id)photos;
- (id)punchOutText;
- (id)punchOutTexts;
- (id)url;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsItemDescription:(uint64_t)a1;
- (void)_addNoFlagsItemDescriptionBytes:(uint64_t)a1;
- (void)_addNoFlagsItemDescriptionHtml:(uint64_t)a1;
- (void)_addNoFlagsPhoto:(uint64_t)a1;
- (void)_addNoFlagsPunchOutText:(uint64_t)a1;
- (void)_readAppClip;
- (void)_readItemDescriptionHtmls;
- (void)_readItemDescriptions;
- (void)_readItemId;
- (void)_readPhotos;
- (void)_readPunchOutTexts;
- (void)_readUrl;
- (void)addItemDescription:(uint64_t)a1;
- (void)addItemDescriptionBytes:(uint64_t)a1;
- (void)addItemDescriptionHtml:(uint64_t)a1;
- (void)addPhoto:(uint64_t)a1;
- (void)addPunchOutText:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceCollectionItem

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlaceCollectionItemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_45;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceCollectionItem readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDMapsIdentifier *)self->_itemId copyWithZone:a3];
  v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v11 = self->_photos;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v59 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = (void *)[*(id *)(*((void *)&v58 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDPlaceCollectionItem addPhoto:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v12);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v16 = self->_itemDescriptions;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v55 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = (void *)[*(id *)(*((void *)&v54 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDPlaceCollectionItem addItemDescription:](v5, v20);
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v54 objects:v65 count:16];
    }
    while (v17);
  }

  uint64_t v21 = [(NSString *)self->_url copyWithZone:a3];
  v22 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v21;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 101) = self->_enableImageFallback;
    *(_WORD *)(v5 + 104) |= 2u;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v23 = self->_punchOutTexts;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v50 objects:v64 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v51 != v25) {
          objc_enumerationMutation(v23);
        }
        v27 = (void *)[*(id *)(*((void *)&v50 + 1) + 8 * k) copyWithZone:a3];
        -[GEOPDPlaceCollectionItem addPunchOutText:](v5, v27);
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v50 objects:v64 count:16];
    }
    while (v24);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v28 = self->_itemDescriptionBytes;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v46 objects:v63 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v47;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v47 != v30) {
          objc_enumerationMutation(v28);
        }
        v32 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * m) copyWithZone:a3];
        -[GEOPDPlaceCollectionItem addItemDescriptionBytes:](v5, v32);
      }
      uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v46 objects:v63 count:16];
    }
    while (v29);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v33 = self->_itemDescriptionHtmls;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v42 objects:v62 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v43;
    do
    {
      for (uint64_t n = 0; n != v34; ++n)
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(v33);
        }
        v37 = objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * n), "copyWithZone:", a3, (void)v42);
        -[GEOPDPlaceCollectionItem addItemDescriptionHtml:](v5, v37);
      }
      uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v42 objects:v62 count:16];
    }
    while (v34);
  }

  id v38 = [(GEOPDQuickLinkItem *)self->_appClip copyWithZone:a3];
  v39 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v38;

  if (*(_WORD *)&self->_flags)
  {
    *(unsigned char *)(v5 + 100) = self->_disableAppClipFallback;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  v40 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v40;
LABEL_45:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  -[GEOPDPlaceCollectionItem readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceCollectionItem readAll:]((uint64_t)v4, 1);
  itemId = self->_itemId;
  if ((unint64_t)itemId | *((void *)v4 + 7))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](itemId, "isEqual:")) {
      goto LABEL_28;
    }
  }
  photos = self->_photos;
  if ((unint64_t)photos | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](photos, "isEqual:")) {
      goto LABEL_28;
    }
  }
  itemDescriptions = self->_itemDescriptions;
  if ((unint64_t)itemDescriptions | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](itemDescriptions, "isEqual:")) {
      goto LABEL_28;
    }
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_28;
    }
  }
  __int16 v9 = *((_WORD *)v4 + 52);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v9 & 2) == 0) {
      goto LABEL_28;
    }
    if (self->_enableImageFallback)
    {
      if (!*((unsigned char *)v4 + 101)) {
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)v4 + 101))
    {
      goto LABEL_28;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_28;
  }
  punchOutTexts = self->_punchOutTexts;
  if ((unint64_t)punchOutTexts | *((void *)v4 + 9)
    && !-[NSMutableArray isEqual:](punchOutTexts, "isEqual:"))
  {
    goto LABEL_28;
  }
  itemDescriptionBytes = self->_itemDescriptionBytes;
  if ((unint64_t)itemDescriptionBytes | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](itemDescriptionBytes, "isEqual:")) {
      goto LABEL_28;
    }
  }
  itemDescriptionHtmls = self->_itemDescriptionHtmls;
  if ((unint64_t)itemDescriptionHtmls | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](itemDescriptionHtmls, "isEqual:")) {
      goto LABEL_28;
    }
  }
  appClip = self->_appClip;
  if ((unint64_t)appClip | *((void *)v4 + 3))
  {
    if (!-[GEOPDQuickLinkItem isEqual:](appClip, "isEqual:")) {
      goto LABEL_28;
    }
  }
  __int16 v14 = *((_WORD *)v4 + 52);
  BOOL v15 = (v14 & 1) == 0;
  if (*(_WORD *)&self->_flags)
  {
    if (v14)
    {
      if (self->_disableAppClipFallback)
      {
        if (!*((unsigned char *)v4 + 100)) {
          goto LABEL_28;
        }
      }
      else if (*((unsigned char *)v4 + 100))
      {
        goto LABEL_28;
      }
      BOOL v15 = 1;
      goto LABEL_29;
    }
LABEL_28:
    BOOL v15 = 0;
  }
LABEL_29:

  return v15;
}

- (void)_addNoFlagsItemDescription:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addPunchOutText:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceCollectionItem _readPunchOutTexts](a1);
    -[GEOPDPlaceCollectionItem _addNoFlagsPunchOutText:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 104) |= 0x800u;
  }
}

- (void)addPhoto:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceCollectionItem _readPhotos](a1);
    -[GEOPDPlaceCollectionItem _addNoFlagsPhoto:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 104) |= 0x800u;
  }
}

- (void)_addNoFlagsPhoto:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readPunchOutTexts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPunchOutTexts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceCollectionItemIsDirty((uint64_t)self) & 1) == 0)
  {
    v26 = self->_reader;
    objc_sync_enter(v26);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v27 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v27];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v26);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceCollectionItem readAll:]((uint64_t)self, 0);
    if (self->_itemId) {
      PBDataWriterWriteSubmessage();
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v6 = self->_photos;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v45;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v45 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v7);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v10 = self->_itemDescriptions;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v40 objects:v51 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v41;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v40 objects:v51 count:16];
      }
      while (v11);
    }

    if (self->_url) {
      PBDataWriterWriteStringField();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    __int16 v14 = self->_punchOutTexts;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v36 objects:v50 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v37;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v36 objects:v50 count:16];
      }
      while (v15);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v18 = self->_itemDescriptionBytes;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v33;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v49 count:16];
      }
      while (v19);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v22 = self->_itemDescriptionHtmls;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v28 objects:v48 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v29;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v22);
          }
          PBDataWriterWriteSubmessage();
          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v28 objects:v48 count:16];
      }
      while (v23);
    }

    if (self->_appClip) {
      PBDataWriterWriteSubmessage();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v28);
  }
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_7460;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_7461;
      }
      GEOPDPlaceCollectionItemReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDPlaceCollectionItemCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDPlaceCollectionItem readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDPlaceCollectionItem itemId]((id *)a1);
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        uint64_t v7 = [v5 jsonRepresentation];
        uint64_t v8 = @"itemId";
      }
      else
      {
        uint64_t v7 = [v5 dictionaryRepresentation];
        uint64_t v8 = @"item_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if ([*(id *)(a1 + 64) count])
    {
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v10 = *(id *)(a1 + 64);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v87 objects:v95 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v88;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v88 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v87 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            uint64_t v16 = [v15 dictionaryRepresentation];
            }
            [v9 addObject:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v87 objects:v95 count:16];
        }
        while (v12);
      }

      [v4 setObject:v9 forKey:@"photo"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v18 = *(id *)(a1 + 48);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v83 objects:v94 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v84;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v84 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void **)(*((void *)&v83 + 1) + 8 * j);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            uint64_t v24 = [v23 dictionaryRepresentation];
            }
            [v17 addObject:v24];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v83 objects:v94 count:16];
        }
        while (v20);
      }

      if (a2) {
        uint64_t v25 = @"itemDescription";
      }
      else {
        uint64_t v25 = @"item_description";
      }
      [v4 setObject:v17 forKey:v25];
    }
    v26 = -[GEOPDPlaceCollectionItem url]((id *)a1);
    if (v26) {
      [v4 setObject:v26 forKey:@"url"];
    }

    if ((*(_WORD *)(a1 + 104) & 2) != 0)
    {
      v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 101)];
      if (a2) {
        long long v28 = @"enableImageFallback";
      }
      else {
        long long v28 = @"enable_image_fallback";
      }
      [v4 setObject:v27 forKey:v28];
    }
    if ([*(id *)(a1 + 72) count])
    {
      long long v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v30 = *(id *)(a1 + 72);
      uint64_t v31 = [v30 countByEnumeratingWithState:&v79 objects:v93 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v80;
        do
        {
          for (uint64_t k = 0; k != v32; ++k)
          {
            if (*(void *)v80 != v33) {
              objc_enumerationMutation(v30);
            }
            long long v35 = *(void **)(*((void *)&v79 + 1) + 8 * k);
            if (a2) {
              [v35 jsonRepresentation];
            }
            else {
            long long v36 = [v35 dictionaryRepresentation];
            }
            [v29 addObject:v36];
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v79 objects:v93 count:16];
        }
        while (v32);
      }

      if (a2) {
        long long v37 = @"punchOutText";
      }
      else {
        long long v37 = @"punch_out_text";
      }
      [v4 setObject:v29 forKey:v37];
    }
    if ([*(id *)(a1 + 32) count])
    {
      long long v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v39 = *(id *)(a1 + 32);
      uint64_t v40 = [v39 countByEnumeratingWithState:&v75 objects:v92 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v76;
        do
        {
          for (uint64_t m = 0; m != v41; ++m)
          {
            if (*(void *)v76 != v42) {
              objc_enumerationMutation(v39);
            }
            long long v44 = *(void **)(*((void *)&v75 + 1) + 8 * m);
            if (a2) {
              [v44 jsonRepresentation];
            }
            else {
            long long v45 = [v44 dictionaryRepresentation];
            }
            [v38 addObject:v45];
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v75 objects:v92 count:16];
        }
        while (v41);
      }

      if (a2) {
        long long v46 = @"itemDescriptionBytes";
      }
      else {
        long long v46 = @"item_description_bytes";
      }
      [v4 setObject:v38 forKey:v46];
    }
    if ([*(id *)(a1 + 40) count])
    {
      long long v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v48 = *(id *)(a1 + 40);
      uint64_t v49 = [v48 countByEnumeratingWithState:&v71 objects:v91 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v72;
        do
        {
          for (uint64_t n = 0; n != v50; ++n)
          {
            if (*(void *)v72 != v51) {
              objc_enumerationMutation(v48);
            }
            uint64_t v53 = *(void **)(*((void *)&v71 + 1) + 8 * n);
            if (a2) {
              [v53 jsonRepresentation];
            }
            else {
            long long v54 = [v53 dictionaryRepresentation];
            }
            [v47 addObject:v54];
          }
          uint64_t v50 = [v48 countByEnumeratingWithState:&v71 objects:v91 count:16];
        }
        while (v50);
      }

      if (a2) {
        long long v55 = @"itemDescriptionHtml";
      }
      else {
        long long v55 = @"item_description_html";
      }
      [v4 setObject:v47 forKey:v55];
    }
    long long v56 = -[GEOPDPlaceCollectionItem appClip]((id *)a1);
    long long v57 = v56;
    if (v56)
    {
      if (a2)
      {
        long long v58 = [v56 jsonRepresentation];
        long long v59 = @"appClip";
      }
      else
      {
        long long v58 = [v56 dictionaryRepresentation];
        long long v59 = @"app_clip";
      }
      [v4 setObject:v58 forKey:v59];
    }
    if (*(_WORD *)(a1 + 104))
    {
      long long v60 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 100)];
      if (a2) {
        long long v61 = @"disableAppClipFallback";
      }
      else {
        long long v61 = @"disable_app_clip_fallback";
      }
      [v4 setObject:v60 forKey:v61];
    }
    v62 = *(void **)(a1 + 16);
    if (v62)
    {
      v63 = [v62 dictionaryRepresentation];
      v64 = v63;
      if (a2)
      {
        v65 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v63, "count"));
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __54__GEOPDPlaceCollectionItem__dictionaryRepresentation___block_invoke;
        v69[3] = &unk_1E53D8860;
        id v66 = v65;
        id v70 = v66;
        [v64 enumerateKeysAndObjectsUsingBlock:v69];
        id v67 = v66;

        v64 = v67;
      }
      [v4 setObject:v64 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)itemDescription
{
  v2 = -[GEOPDPlaceCollectionItem itemDescriptions]((id *)&self->super.super.isa);
  id v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (id)itemHTMLDescription
{
  v2 = -[GEOPDPlaceCollectionItem itemDescriptionHtmls]((id *)&self->super.super.isa);
  id v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (id)punchOutText
{
  v2 = -[GEOPDPlaceCollectionItem punchOutTexts]((id *)&self->super.super.isa);
  id v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 4u;
    *(_WORD *)(a1 + 104) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDPlaceCollectionItem readAll:](a1, 0);
    [*(id *)(a1 + 56) clearUnknownFields:1];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v3 = *(id *)(a1 + 64);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v45;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v45 != v6) {
            objc_enumerationMutation(v3);
          }
          -[GEOPDCaptionedPhoto clearUnknownFields:](*(void *)(*((void *)&v44 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v5);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v51 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v41;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * v12++) clearUnknownFields:1];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v51 count:16];
      }
      while (v10);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v13 = *(id *)(a1 + 72);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v50 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v37;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v36 + 1) + 8 * v17++) clearUnknownFields:1];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v50 count:16];
      }
      while (v15);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v18 = *(id *)(a1 + 32);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * v22++) clearUnknownFields:1];
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v49 count:16];
      }
      while (v20);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v23 = *(id *)(a1 + 40);
    uint64_t v24 = [v23 countByEnumeratingWithState:&v28 objects:v48 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v29;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v29 != v26) {
            objc_enumerationMutation(v23);
          }
          objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v27++), "clearUnknownFields:", 1, (void)v28);
        }
        while (v25 != v27);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v28 objects:v48 count:16];
      }
      while (v25);
    }

    -[GEOPDQuickLinkItem clearUnknownFields:](*(void *)(a1 + 24));
  }
}

- (GEOPDPlaceCollectionItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceCollectionItem;
  v2 = [(GEOPDPlaceCollectionItem *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceCollectionItem)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceCollectionItem;
  id v3 = [(GEOPDPlaceCollectionItem *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readItemId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readItemId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)itemId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollectionItem _readItemId]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPhotos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotos_tags_7415);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)photos
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollectionItem _readPhotos]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readItemDescriptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readItemDescriptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)itemDescriptions
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollectionItem _readItemDescriptions]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addItemDescription:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceCollectionItem _readItemDescriptions](a1);
    -[GEOPDPlaceCollectionItem _addNoFlagsItemDescription:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 104) |= 0x800u;
  }
}

- (void)_readUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_7416);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)url
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollectionItem _readUrl]((uint64_t)a1);
    a1 = (id *)v2[10];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)punchOutTexts
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollectionItem _readPunchOutTexts]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_addNoFlagsPunchOutText:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      uint64_t v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addItemDescriptionBytes:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
    {
      uint64_t v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readItemDescriptionBytes_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    -[GEOPDPlaceCollectionItem _addNoFlagsItemDescriptionBytes:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 104) |= 0x800u;
  }
}

- (void)_addNoFlagsItemDescriptionBytes:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      uint64_t v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readItemDescriptionHtmls
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readItemDescriptionHtmls_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)itemDescriptionHtmls
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollectionItem _readItemDescriptionHtmls]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addItemDescriptionHtml:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceCollectionItem _readItemDescriptionHtmls](a1);
    -[GEOPDPlaceCollectionItem _addNoFlagsItemDescriptionHtml:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 104) |= 0x800u;
  }
}

- (void)_addNoFlagsItemDescriptionHtml:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      uint64_t v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readAppClip
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppClip_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)appClip
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceCollectionItem _readAppClip]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceCollectionItem;
  uint64_t v4 = [(GEOPDPlaceCollectionItem *)&v8 description];
  id v5 = [(GEOPDPlaceCollectionItem *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceCollectionItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceCollectionItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOPDPlaceCollectionItem__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
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
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      id v7 = @"itemId";
    }
    else {
      id v7 = @"item_id";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [GEOPDMapsIdentifier alloc];
      if (a3) {
        id v10 = [(GEOPDMapsIdentifier *)v9 initWithJSON:v8];
      }
      else {
        id v10 = [(GEOPDMapsIdentifier *)v9 initWithDictionary:v8];
      }
      uint64_t v11 = v10;
      uint64_t v12 = v10;
      *(_WORD *)(v6 + 104) |= 0x80u;
      *(_WORD *)(v6 + 104) |= 0x800u;
      objc_storeStrong((id *)(v6 + 56), v11);
    }
    id v13 = [v5 objectForKeyedSubscript:@"photo"];
    objc_opt_class();
    id v82 = v5;
    if (objc_opt_isKindOfClass())
    {
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v99 objects:v107 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v100;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v100 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v99 + 1) + 8 * v18);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v20 = [GEOPDCaptionedPhoto alloc];
              if (v20) {
                uint64_t v21 = (void *)-[GEOPDCaptionedPhoto _initWithDictionary:isJSON:](v20, v19, a3);
              }
              else {
                uint64_t v21 = 0;
              }
              -[GEOPDPlaceCollectionItem addPhoto:](v6, v21);
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t v22 = [v14 countByEnumeratingWithState:&v99 objects:v107 count:16];
          uint64_t v16 = v22;
        }
        while (v22);
      }

      id v5 = v82;
    }

    if (a3) {
      id v23 = @"itemDescription";
    }
    else {
      id v23 = @"item_description";
    }
    uint64_t v24 = [v5 objectForKeyedSubscript:v23];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v95 objects:v106 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v96;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v96 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v95 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v31 = [GEOLocalizedString alloc];
              if (a3) {
                long long v32 = [(GEOLocalizedString *)v31 initWithJSON:v30];
              }
              else {
                long long v32 = [(GEOLocalizedString *)v31 initWithDictionary:v30];
              }
              long long v33 = v32;
              -[GEOPDPlaceCollectionItem addItemDescription:](v6, v32);
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v95 objects:v106 count:16];
        }
        while (v27);
      }

      id v5 = v82;
    }

    long long v34 = [v5 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v35 = (void *)[v34 copy];
      id v36 = v35;
      *(_WORD *)(v6 + 104) |= 0x400u;
      *(_WORD *)(v6 + 104) |= 0x800u;
      objc_storeStrong((id *)(v6 + 80), v35);
    }
    if (a3) {
      long long v37 = @"enableImageFallback";
    }
    else {
      long long v37 = @"enable_image_fallback";
    }
    long long v38 = [v5 objectForKeyedSubscript:v37];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v39 = [v38 BOOLValue];
      *(_WORD *)(v6 + 104) |= 0x800u;
      *(_WORD *)(v6 + 104) |= 2u;
      *(unsigned char *)(v6 + 101) = v39;
    }

    if (a3) {
      long long v40 = @"punchOutText";
    }
    else {
      long long v40 = @"punch_out_text";
    }
    long long v41 = [v5 objectForKeyedSubscript:v40];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v42 = v41;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v91 objects:v105 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v92;
        do
        {
          for (uint64_t j = 0; j != v44; ++j)
          {
            if (*(void *)v92 != v45) {
              objc_enumerationMutation(v42);
            }
            uint64_t v47 = *(void *)(*((void *)&v91 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v48 = [GEOLocalizedString alloc];
              if (a3) {
                uint64_t v49 = [(GEOLocalizedString *)v48 initWithJSON:v47];
              }
              else {
                uint64_t v49 = [(GEOLocalizedString *)v48 initWithDictionary:v47];
              }
              uint64_t v50 = v49;
              -[GEOPDPlaceCollectionItem addPunchOutText:](v6, v49);
            }
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v91 objects:v105 count:16];
        }
        while (v44);
      }

      id v5 = v82;
    }

    if (a3) {
      uint64_t v51 = @"itemDescriptionBytes";
    }
    else {
      uint64_t v51 = @"item_description_bytes";
    }
    long long v52 = [v5 objectForKeyedSubscript:v51];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v53 = v52;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v87 objects:v104 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v88;
        do
        {
          for (uint64_t k = 0; k != v55; ++k)
          {
            if (*(void *)v88 != v56) {
              objc_enumerationMutation(v53);
            }
            uint64_t v58 = *(void *)(*((void *)&v87 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v59 = [GEOLocalizedBytes alloc];
              if (a3) {
                long long v60 = [(GEOLocalizedBytes *)v59 initWithJSON:v58];
              }
              else {
                long long v60 = [(GEOLocalizedBytes *)v59 initWithDictionary:v58];
              }
              long long v61 = v60;
              -[GEOPDPlaceCollectionItem addItemDescriptionBytes:](v6, v60);
            }
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v87 objects:v104 count:16];
        }
        while (v55);
      }

      id v5 = v82;
    }

    if (a3) {
      v62 = @"itemDescriptionHtml";
    }
    else {
      v62 = @"item_description_html";
    }
    v63 = [v5 objectForKeyedSubscript:v62];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v64 = v63;
      uint64_t v65 = [v64 countByEnumeratingWithState:&v83 objects:v103 count:16];
      if (v65)
      {
        uint64_t v66 = v65;
        uint64_t v67 = *(void *)v84;
        do
        {
          for (uint64_t m = 0; m != v66; ++m)
          {
            if (*(void *)v84 != v67) {
              objc_enumerationMutation(v64);
            }
            uint64_t v69 = *(void *)(*((void *)&v83 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v70 = [GEOLocalizedString alloc];
              if (a3) {
                long long v71 = [(GEOLocalizedString *)v70 initWithJSON:v69];
              }
              else {
                long long v71 = [(GEOLocalizedString *)v70 initWithDictionary:v69];
              }
              long long v72 = v71;
              -[GEOPDPlaceCollectionItem addItemDescriptionHtml:](v6, v71);
            }
          }
          uint64_t v66 = [v64 countByEnumeratingWithState:&v83 objects:v103 count:16];
        }
        while (v66);
      }

      id v5 = v82;
    }

    if (a3) {
      long long v73 = @"appClip";
    }
    else {
      long long v73 = @"app_clip";
    }
    long long v74 = [v5 objectForKeyedSubscript:v73];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v75 = [GEOPDQuickLinkItem alloc];
      if (v75) {
        long long v76 = (void *)-[GEOPDQuickLinkItem _initWithDictionary:isJSON:](v75, v74, a3);
      }
      else {
        long long v76 = 0;
      }
      id v77 = v76;
      *(_WORD *)(v6 + 104) |= 8u;
      *(_WORD *)(v6 + 104) |= 0x800u;
      objc_storeStrong((id *)(v6 + 24), v76);
    }
    if (a3) {
      long long v78 = @"disableAppClipFallback";
    }
    else {
      long long v78 = @"disable_app_clip_fallback";
    }
    long long v79 = [v5 objectForKeyedSubscript:v78];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v80 = [v79 BOOLValue];
      *(_WORD *)(v6 + 104) |= 0x800u;
      *(_WORD *)(v6 + 104) |= 1u;
      *(unsigned char *)(v6 + 100) = v80;
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceCollectionItemReadAllFrom((uint64_t)self, a3, 0);
}

- (unint64_t)hash
{
  -[GEOPDPlaceCollectionItem readAll:]((uint64_t)self, 1);
  unint64_t v13 = [(GEOPDMapsIdentifier *)self->_itemId hash];
  uint64_t v3 = [(NSMutableArray *)self->_photos hash];
  uint64_t v4 = [(NSMutableArray *)self->_itemDescriptions hash];
  NSUInteger v5 = [(NSString *)self->_url hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_enableImageFallback;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSMutableArray *)self->_punchOutTexts hash];
  uint64_t v8 = [(NSMutableArray *)self->_itemDescriptionBytes hash];
  uint64_t v9 = [(NSMutableArray *)self->_itemDescriptionHtmls hash];
  unint64_t v10 = [(GEOPDQuickLinkItem *)self->_appClip hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v11 = 2654435761 * self->_disableAppClipFallback;
  }
  else {
    uint64_t v11 = 0;
  }
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_punchOutTexts, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_itemId, 0);
  objc_storeStrong((id *)&self->_itemDescriptions, 0);
  objc_storeStrong((id *)&self->_itemDescriptionHtmls, 0);
  objc_storeStrong((id *)&self->_itemDescriptionBytes, 0);
  objc_storeStrong((id *)&self->_appClip, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end