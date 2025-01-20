@interface GEOPDCollectionSuggestionParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDCollectionSuggestionParameters)init;
- (GEOPDCollectionSuggestionParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsCategoryId:(uint64_t)a1;
- (void)_addNoFlagsGeoId:(uint64_t)a1;
- (void)_addNoFlagsPublisherId:(uint64_t)a1;
- (void)_readCategoryIds;
- (void)_readGeoIds;
- (void)_readPublisherIds;
- (void)_readViewportInfo;
- (void)addCategoryId:(uint64_t)a1;
- (void)addGeoId:(uint64_t)a1;
- (void)addPublisherId:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDCollectionSuggestionParameters

- (GEOPDCollectionSuggestionParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDCollectionSuggestionParameters;
  v2 = [(GEOPDCollectionSuggestionParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_2751;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_2752;
      }
      GEOPDCollectionSuggestionParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDCollectionSuggestionParametersCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_publisherIds, 0);
  objc_storeStrong((id *)&self->_geoIds, 0);
  objc_storeStrong((id *)&self->_categoryIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7C) == 0))
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDCollectionSuggestionParameters readAll:]((uint64_t)self, 0);
    if (self->_viewportInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v6 = self->_publisherIds;
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
    v10 = self->_geoIds;
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
    v14 = self->_categoryIds;
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
          PBDataWriterWriteStringField();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (GEOPDCollectionSuggestionParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDCollectionSuggestionParameters;
  v3 = [(GEOPDCollectionSuggestionParameters *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readViewportInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDCollectionSuggestionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_2743);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 76) |= 0x20u;
    *(unsigned char *)(a1 + 76) |= 0x40u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)_readPublisherIds
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDCollectionSuggestionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherIds_tags_2744);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)addPublisherId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDCollectionSuggestionParameters _readPublisherIds](a1);
    -[GEOPDCollectionSuggestionParameters _addNoFlagsPublisherId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 76) |= 0x40u;
  }
}

- (void)_addNoFlagsPublisherId:(uint64_t)a1
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

- (void)_readGeoIds
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 76) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDCollectionSuggestionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeoIds_tags_0);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)addGeoId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDCollectionSuggestionParameters _readGeoIds](a1);
    -[GEOPDCollectionSuggestionParameters _addNoFlagsGeoId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 76) |= 0x40u;
  }
}

- (void)_addNoFlagsGeoId:(uint64_t)a1
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

- (void)_readCategoryIds
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 76) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDCollectionSuggestionParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryIds_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)addCategoryId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDCollectionSuggestionParameters _readCategoryIds](a1);
    -[GEOPDCollectionSuggestionParameters _addNoFlagsCategoryId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(unsigned char *)(a1 + 76) |= 0x40u;
  }
}

- (void)_addNoFlagsCategoryId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCollectionSuggestionParameters;
  id v4 = [(GEOPDCollectionSuggestionParameters *)&v8 description];
  id v5 = [(GEOPDCollectionSuggestionParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCollectionSuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDCollectionSuggestionParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    -[GEOPDCollectionSuggestionParameters _readViewportInfo](a1);
    id v5 = *(id *)(a1 + 56);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"viewportInfo";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"viewport_info";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(unsigned char *)(a1 + 76))
    {
      v9 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      if (a2) {
        v10 = @"requestLocalTimestamp";
      }
      else {
        v10 = @"request_local_timestamp";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if ([*(id *)(a1 + 40) count])
    {
      uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v12 = *(id *)(a1 + 40);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
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
          uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
        }
        while (v14);
      }

      if (a2) {
        v19 = @"publisherId";
      }
      else {
        v19 = @"publisher_id";
      }
      [v4 setObject:v11 forKey:v19];
    }
    if ([*(id *)(a1 + 32) count])
    {
      long long v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v21 = *(id *)(a1 + 32);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v41 != v24) {
              objc_enumerationMutation(v21);
            }
            long long v26 = *(void **)(*((void *)&v40 + 1) + 8 * j);
            if (a2) {
              [v26 jsonRepresentation];
            }
            else {
            long long v27 = [v26 dictionaryRepresentation];
            }
            [v20 addObject:v27];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v23);
      }

      if (a2) {
        long long v28 = @"geoId";
      }
      else {
        long long v28 = @"geo_id";
      }
      [v4 setObject:v20 forKey:v28];
    }
    if (*(void *)(a1 + 24))
    {
      -[GEOPDCollectionSuggestionParameters _readCategoryIds](a1);
      id v29 = *(id *)(a1 + 24);
      if (a2) {
        long long v30 = @"categoryId";
      }
      else {
        long long v30 = @"category_id";
      }
      [v4 setObject:v29 forKey:v30];
    }
    long long v31 = *(void **)(a1 + 16);
    if (v31)
    {
      v32 = [v31 dictionaryRepresentation];
      v33 = v32;
      if (a2)
      {
        v34 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __65__GEOPDCollectionSuggestionParameters__dictionaryRepresentation___block_invoke;
        v38[3] = &unk_1E53D8860;
        id v35 = v34;
        id v39 = v35;
        [v33 enumerateKeysAndObjectsUsingBlock:v38];
        id v36 = v35;

        v33 = v36;
      }
      [v4 setObject:v33 forKey:@"Unknown Fields"];
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
  return -[GEOPDCollectionSuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __65__GEOPDCollectionSuggestionParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      id v7 = @"viewportInfo";
    }
    else {
      id v7 = @"viewport_info";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [GEOPDViewportInfo alloc];
      if (a3) {
        id v10 = [(GEOPDViewportInfo *)v9 initWithJSON:v8];
      }
      else {
        id v10 = [(GEOPDViewportInfo *)v9 initWithDictionary:v8];
      }
      uint64_t v11 = v10;
      -[GEOPDCollectionSuggestionParameters setViewportInfo:](v6, v10);
    }
    if (a3) {
      id v12 = @"requestLocalTimestamp";
    }
    else {
      id v12 = @"request_local_timestamp";
    }
    uint64_t v13 = [v5 objectForKeyedSubscript:v12];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 doubleValue];
      *(unsigned char *)(v6 + 76) |= 0x40u;
      *(unsigned char *)(v6 + 76) |= 1u;
      *(void *)(v6 + 48) = v14;
    }

    if (a3) {
      uint64_t v15 = @"publisherId";
    }
    else {
      uint64_t v15 = @"publisher_id";
    }
    uint64_t v16 = [v5 objectForKeyedSubscript:v15];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v55 objects:v61 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v56 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v55 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v23 = [GEOPDMapsIdentifier alloc];
              if (a3) {
                uint64_t v24 = [(GEOPDMapsIdentifier *)v23 initWithJSON:v22];
              }
              else {
                uint64_t v24 = [(GEOPDMapsIdentifier *)v23 initWithDictionary:v22];
              }
              long long v25 = v24;
              -[GEOPDCollectionSuggestionParameters addPublisherId:](v6, v24);
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v55 objects:v61 count:16];
        }
        while (v19);
      }
    }
    if (a3) {
      long long v26 = @"geoId";
    }
    else {
      long long v26 = @"geo_id";
    }
    long long v27 = [v5 objectForKeyedSubscript:v26];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v28 = v27;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v52;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v52 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v51 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v34 = [GEOPDMapsIdentifier alloc];
              if (a3) {
                id v35 = [(GEOPDMapsIdentifier *)v34 initWithJSON:v33];
              }
              else {
                id v35 = [(GEOPDMapsIdentifier *)v34 initWithDictionary:v33];
              }
              id v36 = v35;
              -[GEOPDCollectionSuggestionParameters addGeoId:](v6, v35);
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v51 objects:v60 count:16];
        }
        while (v30);
      }
    }
    if (a3) {
      v37 = @"categoryId";
    }
    else {
      v37 = @"category_id";
    }
    v38 = [v5 objectForKeyedSubscript:v37];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v39 = v38;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v47 objects:v59 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v48;
        do
        {
          for (uint64_t k = 0; k != v41; ++k)
          {
            if (*(void *)v48 != v42) {
              objc_enumerationMutation(v39);
            }
            long long v44 = *(void **)(*((void *)&v47 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v45 = (void *)[v44 copy];
              -[GEOPDCollectionSuggestionParameters addCategoryId:](v6, v45);
            }
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v47 objects:v59 count:16];
        }
        while (v41);
      }
    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDCollectionSuggestionParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id v3 = (id *)result;
    -[GEOPDCollectionSuggestionParameters _readGeoIds](result);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = v3[4];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v17 + 1) + 8 * v8) hasGreenTeaWithValue:a2]) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      -[GEOPDCollectionSuggestionParameters _readPublisherIds]((uint64_t)v3);
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v4 = v3[5];
      uint64_t v9 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (!v9)
      {
LABEL_18:

        -[GEOPDCollectionSuggestionParameters _readViewportInfo]((uint64_t)v3);
        return [v3[7] hasGreenTeaWithValue:a2];
      }
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
LABEL_12:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12), "hasGreenTeaWithValue:", a2, (void)v13)) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
          if (v10) {
            goto LABEL_12;
          }
          goto LABEL_18;
        }
      }
    }

    return 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDCollectionSuggestionParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_29;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCollectionSuggestionParameters readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 48) = self->_requestLocalTimestamp;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v11 = self->_publisherIds;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDCollectionSuggestionParameters addPublisherId:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v12);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v16 = self->_geoIds;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDCollectionSuggestionParameters addGeoId:](v5, v20);
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v17);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v21 = self->_categoryIds;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v21);
        }
        long long v25 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * k), "copyWithZone:", a3, (void)v28);
        -[GEOPDCollectionSuggestionParameters addCategoryId:](v5, v25);
      }
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v22);
  }

  long long v26 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v26;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  -[GEOPDCollectionSuggestionParameters readAll:]((uint64_t)self, 1);
  -[GEOPDCollectionSuggestionParameters readAll:]((uint64_t)v4, 1);
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 7))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_requestLocalTimestamp != *((double *)v4 + 6)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  publisherIds = self->_publisherIds;
  if ((unint64_t)publisherIds | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](publisherIds, "isEqual:"))
  {
    goto LABEL_15;
  }
  geoIds = self->_geoIds;
  if ((unint64_t)geoIds | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](geoIds, "isEqual:")) {
      goto LABEL_15;
    }
  }
  categoryIds = self->_categoryIds;
  if ((unint64_t)categoryIds | *((void *)v4 + 3)) {
    char v9 = -[NSMutableArray isEqual:](categoryIds, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDCollectionSuggestionParameters readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDViewportInfo *)self->_viewportInfo hash];
  if (*(unsigned char *)&self->_flags)
  {
    double requestLocalTimestamp = self->_requestLocalTimestamp;
    double v6 = -requestLocalTimestamp;
    if (requestLocalTimestamp >= 0.0) {
      double v6 = self->_requestLocalTimestamp;
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
  uint64_t v9 = v4 ^ v3 ^ [(NSMutableArray *)self->_publisherIds hash];
  uint64_t v10 = [(NSMutableArray *)self->_geoIds hash];
  return v9 ^ v10 ^ [(NSMutableArray *)self->_categoryIds hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  -[GEOPDCollectionSuggestionParameters readAll:]((uint64_t)v3, 0);
  unint64_t v4 = *(void **)(a1 + 56);
  uint64_t v5 = *((void *)v3 + 7);
  if (v4)
  {
    if (v5) {
      objc_msgSend(v4, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOPDCollectionSuggestionParameters setViewportInfo:](a1, *((void **)v3 + 7));
  }
  if (*((unsigned char *)v3 + 76))
  {
    *(void *)(a1 + 48) = *((void *)v3 + 6);
    *(unsigned char *)(a1 + 76) |= 1u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = *((id *)v3 + 5);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOPDCollectionSuggestionParameters addPublisherId:](a1, *(void **)(*((void *)&v29 + 1) + 8 * i));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = *((id *)v3 + 4);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        -[GEOPDCollectionSuggestionParameters addGeoId:](a1, *(void **)(*((void *)&v25 + 1) + 8 * j));
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = *((id *)v3 + 3);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[GEOPDCollectionSuggestionParameters addCategoryId:](a1, *(void **)(*((void *)&v21 + 1) + 8 * k));
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 2u;
    *(unsigned char *)(a1 + 76) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDCollectionSuggestionParameters readAll:](a1, 0);
    [*(id *)(a1 + 56) clearUnknownFields:1];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v7++) clearUnknownFields:1];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v5);
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "clearUnknownFields:", 1, (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

@end