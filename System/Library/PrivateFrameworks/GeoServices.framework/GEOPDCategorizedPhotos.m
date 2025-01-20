@interface GEOPDCategorizedPhotos
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDCategorizedPhotos)init;
- (GEOPDCategorizedPhotos)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)categoryId;
- (id)categoryNames;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayTitle;
- (id)jsonRepresentation;
- (id)photos;
- (unint64_t)hash;
- (void)_addNoFlagsCategoryName:(uint64_t)a1;
- (void)_addNoFlagsPhoto:(uint64_t)a1;
- (void)_readCategoryId;
- (void)_readCategoryNames;
- (void)_readPhotos;
- (void)addCategoryName:(uint64_t)a1;
- (void)addPhoto:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDCategorizedPhotos

- (id)displayTitle
{
  v2 = -[GEOPDCategorizedPhotos categoryNames]((id *)&self->super.super.isa);
  v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (GEOPDCategorizedPhotos)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDCategorizedPhotos;
  v2 = [(GEOPDCategorizedPhotos *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDCategorizedPhotos)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDCategorizedPhotos;
  v3 = [(GEOPDCategorizedPhotos *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCategoryId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorizedPhotosReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryId_tags_1297);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)categoryId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorizedPhotos _readCategoryId]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readCategoryNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorizedPhotosReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryNames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)categoryNames
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorizedPhotos _readCategoryNames]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addCategoryName:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDCategorizedPhotos _readCategoryNames](a1);
    -[GEOPDCategorizedPhotos _addNoFlagsCategoryName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 64) |= 0x20u;
  }
}

- (void)_addNoFlagsCategoryName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readPhotos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorizedPhotosReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)photos
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDCategorizedPhotos _readPhotos]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addPhoto:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDCategorizedPhotos _readPhotos](a1);
    -[GEOPDCategorizedPhotos _addNoFlagsPhoto:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 64) |= 0x20u;
  }
}

- (void)_addNoFlagsPhoto:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCategorizedPhotos;
  v4 = [(GEOPDCategorizedPhotos *)&v8 description];
  id v5 = [(GEOPDCategorizedPhotos *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCategorizedPhotos _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDCategorizedPhotos readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDCategorizedPhotos categoryId]((id *)a1);
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"categoryId";
      }
      else {
        objc_super v6 = @"category_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if ([*(id *)(a1 + 32) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v40 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"categoryName";
      }
      else {
        v15 = @"category_name";
      }
      [v4 setObject:v7 forKey:v15];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v17 = *(id *)(a1 + 40);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v36 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v35 + 1) + 8 * j);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            v23 = [v22 dictionaryRepresentation];
            }
            [v16 addObject:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v19);
      }

      [v4 setObject:v16 forKey:@"photo"];
    }
    if (*(unsigned char *)(a1 + 64))
    {
      v24 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
      if (a2) {
        v25 = @"photosAvailable";
      }
      else {
        v25 = @"photos_available";
      }
      [v4 setObject:v24 forKey:v25];
    }
    v26 = *(void **)(a1 + 16);
    if (v26)
    {
      v27 = [v26 dictionaryRepresentation];
      v28 = v27;
      if (a2)
      {
        v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __52__GEOPDCategorizedPhotos__dictionaryRepresentation___block_invoke;
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
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDCategorizedPhotos _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_1310_0;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_1311_0;
      }
      GEOPDCategorizedPhotosReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDCategorizedPhotosCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __52__GEOPDCategorizedPhotos__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
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
  return GEOPDCategorizedPhotosReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3C) == 0))
  {
    if ((*(unsigned char *)&self->_flags & 0x10) != 0)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v14 = self->_photos;
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(v14);
            }
            if (GEOPDCaptionedPhotoIsDirty(*(os_unfair_lock_s **)(*((void *)&v28 + 1) + 8 * i)))
            {

              goto LABEL_3;
            }
          }
          uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
    }
    uint64_t v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
LABEL_3:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDCategorizedPhotos readAll:]((uint64_t)self, 0);
    if (self->_categoryId) {
      PBDataWriterWriteStringField();
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    objc_super v6 = self->_categoryNames;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v7; ++j)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v7);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = self->_photos;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t k = 0; k != v11; ++k)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v11);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDCategorizedPhotosReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCategorizedPhotos readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_categoryId copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v11 = self->_categoryNames;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDCategorizedPhotos addCategoryName:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v16 = self->_photos;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (void)v23);
        -[GEOPDCategorizedPhotos addPhoto:](v5, v20);
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_photosAvailable;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  long long v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  -[GEOPDCategorizedPhotos readAll:]((uint64_t)self, 1);
  -[GEOPDCategorizedPhotos readAll:]((uint64_t)v4, 1);
  categoryId = self->_categoryId;
  if ((unint64_t)categoryId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](categoryId, "isEqual:")) {
      goto LABEL_12;
    }
  }
  categoryNames = self->_categoryNames;
  if ((unint64_t)categoryNames | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](categoryNames, "isEqual:")) {
      goto LABEL_12;
    }
  }
  photos = self->_photos;
  if ((unint64_t)photos | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](photos, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 64) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) != 0 && self->_photosAvailable == *((_DWORD *)v4 + 15))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDCategorizedPhotos readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_categoryId hash];
  uint64_t v4 = [(NSMutableArray *)self->_categoryNames hash];
  uint64_t v5 = [(NSMutableArray *)self->_photos hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_photosAvailable;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_categoryNames, 0);
  objc_storeStrong((id *)&self->_categoryId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end